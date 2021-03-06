#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Proxy models for augmenting our source data tables with methods useful for processing.
"""
from __future__ import unicode_literals
from django.db import models
from opencivicdata.core.models import Division
from .base import OCDProxyModelMixin


class OCDAssemblyDivisionManager(models.Manager):
    """
    Custom helpers for the OCD Division model.
    """
    def get_queryset(self):
        """
        Filters down to state assembly divisions.
        """
        return super(OCDAssemblyDivisionManager, self).get_queryset().filter(
            subid1='ca',
            subtype2='sldl',
        )


class OCDSenateDivisionManager(models.Manager):
    """
    Custom helpers for the OCD Division model.
    """
    def get_queryset(self):
        """
        Filters down to state senate divisions.
        """
        return super(OCDSenateDivisionManager, self).get_queryset().filter(
            subid1='ca',
            subtype2='sldu',
        )


class OCDCaliforniaDivisionManager(models.Manager):
    """
    Custom helpers for the OCD Division model.
    """
    def california(self):
        """
        Returns state of California division.
        """
        return self.get_queryset().get(id='ocd-division/country:us/state:ca')


class OCDDivisionProxy(Division, OCDProxyModelMixin):
    """
    A proxy on the OCD Division model with helper methods.
    """
    objects = OCDCaliforniaDivisionManager()
    assembly = OCDAssemblyDivisionManager()
    senate = OCDSenateDivisionManager()

    class Meta:
        """
        Make this a proxy model.
        """
        proxy = True

    @property
    def doc(self):
        """
        Returns the preferred description for the proxied model.
        """
        return "A political geography such as a county or legislative district, \
which may have multiple boundaries over its lifetime."
