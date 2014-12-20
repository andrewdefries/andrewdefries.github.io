---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.918197, -1.576503, -0.9131641, 1, 0, 0, 1,
-2.693844, 0.9670886, -0.9142246, 1, 0.007843138, 0, 1,
-2.685134, 2.758036, 0.330544, 1, 0.01176471, 0, 1,
-2.660533, 0.7050327, -1.324871, 1, 0.01960784, 0, 1,
-2.648521, 0.5003242, -2.105701, 1, 0.02352941, 0, 1,
-2.515585, 0.8390228, -2.077965, 1, 0.03137255, 0, 1,
-2.510951, -0.04345541, -1.70482, 1, 0.03529412, 0, 1,
-2.46197, 0.5969826, -1.031523, 1, 0.04313726, 0, 1,
-2.43908, -0.4542229, -1.388376, 1, 0.04705882, 0, 1,
-2.371629, 1.213565, 0.5850692, 1, 0.05490196, 0, 1,
-2.370305, -1.332222, -2.058695, 1, 0.05882353, 0, 1,
-2.31669, -1.144571, -1.45319, 1, 0.06666667, 0, 1,
-2.272608, -0.5192112, -2.590694, 1, 0.07058824, 0, 1,
-2.242, -2.064204, -2.032067, 1, 0.07843138, 0, 1,
-2.214948, -0.1346016, -1.137603, 1, 0.08235294, 0, 1,
-2.149689, -0.5680521, -1.992131, 1, 0.09019608, 0, 1,
-2.144166, -0.0784817, 0.1269974, 1, 0.09411765, 0, 1,
-2.135403, 1.577157, -2.748326, 1, 0.1019608, 0, 1,
-2.128131, -1.587884, -1.294404, 1, 0.1098039, 0, 1,
-2.121711, -0.2326145, -0.8335858, 1, 0.1137255, 0, 1,
-2.092809, -0.7828118, -2.080132, 1, 0.1215686, 0, 1,
-2.064825, 0.1731569, -0.717418, 1, 0.1254902, 0, 1,
-2.062908, 2.134014, -1.270091, 1, 0.1333333, 0, 1,
-2.056185, 0.4523677, -0.5773035, 1, 0.1372549, 0, 1,
-2.053207, 0.08213504, -1.675848, 1, 0.145098, 0, 1,
-2.028183, 0.7549068, -1.738848, 1, 0.1490196, 0, 1,
-2.017613, -0.1391662, -1.80345, 1, 0.1568628, 0, 1,
-2.013531, 1.442683, -1.679259, 1, 0.1607843, 0, 1,
-1.986304, 0.1359808, -3.155475, 1, 0.1686275, 0, 1,
-1.977961, 0.7642695, -1.352425, 1, 0.172549, 0, 1,
-1.898284, 1.110853, 0.2934807, 1, 0.1803922, 0, 1,
-1.895748, -1.129119, -0.9944417, 1, 0.1843137, 0, 1,
-1.876589, 0.2572154, -1.396326, 1, 0.1921569, 0, 1,
-1.864197, -1.610565, -1.383568, 1, 0.1960784, 0, 1,
-1.858506, -2.094857, -4.107465, 1, 0.2039216, 0, 1,
-1.812276, -0.7019024, -4.955592, 1, 0.2117647, 0, 1,
-1.806526, -0.3221385, -2.690106, 1, 0.2156863, 0, 1,
-1.804265, 0.2094107, -0.1885881, 1, 0.2235294, 0, 1,
-1.791504, -0.8075584, -2.621821, 1, 0.227451, 0, 1,
-1.789488, 1.484868, -0.5204546, 1, 0.2352941, 0, 1,
-1.774651, 0.6617947, -1.847804, 1, 0.2392157, 0, 1,
-1.764612, 0.1335658, -2.507404, 1, 0.2470588, 0, 1,
-1.757802, 1.509552, -0.4270703, 1, 0.2509804, 0, 1,
-1.750047, 0.3688784, -2.142304, 1, 0.2588235, 0, 1,
-1.743699, -0.194989, -0.6174629, 1, 0.2627451, 0, 1,
-1.73191, 0.8126916, -0.3896679, 1, 0.2705882, 0, 1,
-1.723462, 1.050703, -2.589438, 1, 0.2745098, 0, 1,
-1.722761, 1.203265, 0.1897202, 1, 0.282353, 0, 1,
-1.720594, 0.5964961, 0.6902372, 1, 0.2862745, 0, 1,
-1.710175, 0.2722042, -0.2282424, 1, 0.2941177, 0, 1,
-1.707613, -2.491179, -3.088864, 1, 0.3019608, 0, 1,
-1.705493, 0.7038586, 0.1542127, 1, 0.3058824, 0, 1,
-1.703905, 1.828356, -0.2029478, 1, 0.3137255, 0, 1,
-1.699435, -1.215763, -1.906332, 1, 0.3176471, 0, 1,
-1.679113, -0.1254047, 0.8000544, 1, 0.3254902, 0, 1,
-1.677553, -0.3731298, -1.102913, 1, 0.3294118, 0, 1,
-1.62923, 0.8395414, -4.386752, 1, 0.3372549, 0, 1,
-1.618146, 0.2270273, -2.574533, 1, 0.3411765, 0, 1,
-1.604586, 0.8721158, -0.1082542, 1, 0.3490196, 0, 1,
-1.602012, -1.00172, -0.4803507, 1, 0.3529412, 0, 1,
-1.591361, 0.3890778, -0.583394, 1, 0.3607843, 0, 1,
-1.574706, 0.5497628, -1.737236, 1, 0.3647059, 0, 1,
-1.574438, 0.5474705, -0.9901789, 1, 0.372549, 0, 1,
-1.568552, -0.8583716, -2.58088, 1, 0.3764706, 0, 1,
-1.564026, 0.3392402, -1.184012, 1, 0.3843137, 0, 1,
-1.559721, 1.28991, -0.1945421, 1, 0.3882353, 0, 1,
-1.557799, -0.5380458, -0.4606542, 1, 0.3960784, 0, 1,
-1.543579, 0.2745047, -0.1174252, 1, 0.4039216, 0, 1,
-1.542854, 2.208377, -1.526621, 1, 0.4078431, 0, 1,
-1.5398, -0.9785073, -0.6791846, 1, 0.4156863, 0, 1,
-1.535539, -1.100336, -1.375789, 1, 0.4196078, 0, 1,
-1.528581, 0.8758975, -1.335535, 1, 0.427451, 0, 1,
-1.516629, 0.02831508, -1.840333, 1, 0.4313726, 0, 1,
-1.504703, 1.586236, -0.552598, 1, 0.4392157, 0, 1,
-1.503343, 1.083126, -0.370538, 1, 0.4431373, 0, 1,
-1.500702, 2.15776, 0.1785744, 1, 0.4509804, 0, 1,
-1.483173, -0.1669189, -3.764364, 1, 0.454902, 0, 1,
-1.46035, 1.310176, -0.1591837, 1, 0.4627451, 0, 1,
-1.451851, -0.6515622, -0.5755515, 1, 0.4666667, 0, 1,
-1.437281, -0.4999094, -2.453108, 1, 0.4745098, 0, 1,
-1.43492, 0.06831774, -2.287466, 1, 0.4784314, 0, 1,
-1.431234, -1.038218, -2.677986, 1, 0.4862745, 0, 1,
-1.431067, -1.103341, -0.5843779, 1, 0.4901961, 0, 1,
-1.430947, -0.6839995, -2.289789, 1, 0.4980392, 0, 1,
-1.429726, -1.133414, -1.561136, 1, 0.5058824, 0, 1,
-1.411641, -1.234277, -3.28841, 1, 0.509804, 0, 1,
-1.410816, 0.6727486, -2.586917, 1, 0.5176471, 0, 1,
-1.40736, -0.5162978, -0.933643, 1, 0.5215687, 0, 1,
-1.394814, -1.911692, -2.160155, 1, 0.5294118, 0, 1,
-1.387668, 0.8372449, -1.536543, 1, 0.5333334, 0, 1,
-1.376189, 1.209314, -1.472877, 1, 0.5411765, 0, 1,
-1.362128, 1.614724, -0.1532731, 1, 0.5450981, 0, 1,
-1.348216, -0.3854931, -1.840152, 1, 0.5529412, 0, 1,
-1.337232, 0.639945, -1.603138, 1, 0.5568628, 0, 1,
-1.334948, -0.6127337, -3.641185, 1, 0.5647059, 0, 1,
-1.322883, -1.509064, -1.853223, 1, 0.5686275, 0, 1,
-1.320844, 2.035921, -1.962764, 1, 0.5764706, 0, 1,
-1.307846, -0.2272952, -2.346158, 1, 0.5803922, 0, 1,
-1.307534, 0.3931015, 0.4208675, 1, 0.5882353, 0, 1,
-1.302623, -1.645412, -1.868724, 1, 0.5921569, 0, 1,
-1.288583, 0.9592098, -2.518909, 1, 0.6, 0, 1,
-1.28835, 0.8255854, -0.3841232, 1, 0.6078432, 0, 1,
-1.281094, 2.159075, -1.439999, 1, 0.6117647, 0, 1,
-1.280549, 1.420063, -1.930638, 1, 0.6196079, 0, 1,
-1.269546, -0.4451405, -0.2819189, 1, 0.6235294, 0, 1,
-1.267457, -2.092147, -0.2640026, 1, 0.6313726, 0, 1,
-1.264798, -1.480645, -2.692557, 1, 0.6352941, 0, 1,
-1.264384, -1.933208, -1.701267, 1, 0.6431373, 0, 1,
-1.261798, 1.520259, -0.551406, 1, 0.6470588, 0, 1,
-1.261776, -0.9302836, -3.677652, 1, 0.654902, 0, 1,
-1.256581, 1.623272, -0.8929384, 1, 0.6588235, 0, 1,
-1.249034, -0.09435877, -1.239625, 1, 0.6666667, 0, 1,
-1.248333, -0.4006462, -2.445219, 1, 0.6705883, 0, 1,
-1.24742, -1.311416, -3.368754, 1, 0.6784314, 0, 1,
-1.242362, -1.694777, -4.370849, 1, 0.682353, 0, 1,
-1.236025, 0.03129921, -2.606083, 1, 0.6901961, 0, 1,
-1.23503, 1.269919, -0.9477649, 1, 0.6941177, 0, 1,
-1.231763, -0.836299, -2.122724, 1, 0.7019608, 0, 1,
-1.221778, -1.344219, -1.755674, 1, 0.7098039, 0, 1,
-1.202676, -0.9539023, -3.960075, 1, 0.7137255, 0, 1,
-1.201055, 0.2458324, -1.805166, 1, 0.7215686, 0, 1,
-1.194936, -1.49606, -1.673424, 1, 0.7254902, 0, 1,
-1.192029, 0.6391822, -1.47397, 1, 0.7333333, 0, 1,
-1.190829, -0.1602624, -0.899986, 1, 0.7372549, 0, 1,
-1.18547, -1.523509, 0.2330549, 1, 0.7450981, 0, 1,
-1.172368, -0.07100822, -1.82538, 1, 0.7490196, 0, 1,
-1.168433, -0.7176071, -2.190539, 1, 0.7568628, 0, 1,
-1.159908, 0.5309383, 0.4452729, 1, 0.7607843, 0, 1,
-1.157289, -0.4282874, -2.505114, 1, 0.7686275, 0, 1,
-1.153245, -0.08667774, -3.244165, 1, 0.772549, 0, 1,
-1.148467, -0.009823088, -0.8098605, 1, 0.7803922, 0, 1,
-1.131634, 0.09056621, -0.2606088, 1, 0.7843137, 0, 1,
-1.128782, 0.7393312, -1.171695, 1, 0.7921569, 0, 1,
-1.124258, -2.119516, -2.862221, 1, 0.7960784, 0, 1,
-1.121211, -1.212355, -2.307822, 1, 0.8039216, 0, 1,
-1.121151, 0.4062144, 0.7092828, 1, 0.8117647, 0, 1,
-1.120013, 0.6867969, -0.4392164, 1, 0.8156863, 0, 1,
-1.119394, 0.9149646, -1.085122, 1, 0.8235294, 0, 1,
-1.113424, -0.3329656, -1.76556, 1, 0.827451, 0, 1,
-1.101485, -1.165371, -1.95013, 1, 0.8352941, 0, 1,
-1.099855, -0.2617843, -0.8990977, 1, 0.8392157, 0, 1,
-1.092101, -1.030374, -0.1184484, 1, 0.8470588, 0, 1,
-1.091727, 1.053063, -1.533554, 1, 0.8509804, 0, 1,
-1.07487, 0.4206335, -0.4857769, 1, 0.8588235, 0, 1,
-1.072817, -1.010313, -2.574721, 1, 0.8627451, 0, 1,
-1.065908, -0.02598977, -0.5220613, 1, 0.8705882, 0, 1,
-1.065727, -0.9218974, -3.083758, 1, 0.8745098, 0, 1,
-1.065495, 0.6025687, 0.6657444, 1, 0.8823529, 0, 1,
-1.056757, 0.7193164, 0.1001414, 1, 0.8862745, 0, 1,
-1.054478, -0.7480362, -1.936141, 1, 0.8941177, 0, 1,
-1.051043, -1.391681, -2.856298, 1, 0.8980392, 0, 1,
-1.037477, -0.2122552, -1.936338, 1, 0.9058824, 0, 1,
-1.033729, 1.345949, -0.3196796, 1, 0.9137255, 0, 1,
-1.031521, -1.422384, -2.040545, 1, 0.9176471, 0, 1,
-1.020445, 0.04880584, 1.420832, 1, 0.9254902, 0, 1,
-1.016343, 1.18675, -0.7570087, 1, 0.9294118, 0, 1,
-1.002059, 1.390951, -3.426257, 1, 0.9372549, 0, 1,
-0.9934088, 0.6833341, -1.033571, 1, 0.9411765, 0, 1,
-0.9917089, -0.07144747, -0.5523276, 1, 0.9490196, 0, 1,
-0.9881861, 2.53197, -0.05700268, 1, 0.9529412, 0, 1,
-0.9859226, 0.845113, -2.222627, 1, 0.9607843, 0, 1,
-0.985346, 1.453086, -0.8816897, 1, 0.9647059, 0, 1,
-0.9848865, 1.249025, 1.121041, 1, 0.972549, 0, 1,
-0.9763476, -0.1661886, -0.1586524, 1, 0.9764706, 0, 1,
-0.971122, 1.226046, -0.008212627, 1, 0.9843137, 0, 1,
-0.9688521, 0.5894918, -2.702133, 1, 0.9882353, 0, 1,
-0.9591523, -0.1639155, -1.695243, 1, 0.9960784, 0, 1,
-0.9579961, -0.1063628, 1.007488, 0.9960784, 1, 0, 1,
-0.9477664, -0.360841, -0.9716491, 0.9921569, 1, 0, 1,
-0.9462331, -0.3149751, -3.679737, 0.9843137, 1, 0, 1,
-0.9446115, 1.237229, -1.238488, 0.9803922, 1, 0, 1,
-0.9440498, 1.118103, -1.345649, 0.972549, 1, 0, 1,
-0.9430088, 0.6651679, -0.0662178, 0.9686275, 1, 0, 1,
-0.9372669, -1.330379, -3.701463, 0.9607843, 1, 0, 1,
-0.9323238, -0.9591599, -4.129133, 0.9568627, 1, 0, 1,
-0.932277, 0.3265724, -0.6860496, 0.9490196, 1, 0, 1,
-0.9311945, -0.6182414, -1.981334, 0.945098, 1, 0, 1,
-0.9258924, -0.8001759, -4.005611, 0.9372549, 1, 0, 1,
-0.9195256, -0.4908002, -1.66822, 0.9333333, 1, 0, 1,
-0.9175216, 1.008151, 0.4686055, 0.9254902, 1, 0, 1,
-0.9105036, -0.1613385, -3.712643, 0.9215686, 1, 0, 1,
-0.9068912, 0.7559183, -1.827802, 0.9137255, 1, 0, 1,
-0.9056261, -0.5106915, -2.612181, 0.9098039, 1, 0, 1,
-0.9030851, -1.099893, -1.333215, 0.9019608, 1, 0, 1,
-0.9021801, -0.0800113, -1.289483, 0.8941177, 1, 0, 1,
-0.8942356, 0.5771403, -1.030254, 0.8901961, 1, 0, 1,
-0.891795, 0.4828031, -2.30437, 0.8823529, 1, 0, 1,
-0.8907232, 2.117536, 1.657823, 0.8784314, 1, 0, 1,
-0.8900657, -0.0575382, -0.8189332, 0.8705882, 1, 0, 1,
-0.8878248, 1.05059, -0.2728714, 0.8666667, 1, 0, 1,
-0.8784393, -0.4360774, -3.057209, 0.8588235, 1, 0, 1,
-0.8782623, 0.9300762, -0.6206957, 0.854902, 1, 0, 1,
-0.8744763, -0.9093608, -2.427805, 0.8470588, 1, 0, 1,
-0.8740522, 0.8378906, -0.9245965, 0.8431373, 1, 0, 1,
-0.8702149, -0.1283656, -1.483491, 0.8352941, 1, 0, 1,
-0.8694888, 0.6317307, 0.4604061, 0.8313726, 1, 0, 1,
-0.8691201, 0.06746143, -1.440027, 0.8235294, 1, 0, 1,
-0.8582599, -0.578799, -0.6326277, 0.8196079, 1, 0, 1,
-0.8566599, 0.1628509, -2.368853, 0.8117647, 1, 0, 1,
-0.8556356, 0.2863332, -0.6849019, 0.8078431, 1, 0, 1,
-0.8539026, -2.160791, -2.927543, 0.8, 1, 0, 1,
-0.8484904, -1.332452, -2.593924, 0.7921569, 1, 0, 1,
-0.8472947, 0.6038623, -1.014191, 0.7882353, 1, 0, 1,
-0.8445854, -1.187443, 0.4074939, 0.7803922, 1, 0, 1,
-0.8431657, 0.7780443, -0.03833234, 0.7764706, 1, 0, 1,
-0.8421088, -0.5399476, -2.637053, 0.7686275, 1, 0, 1,
-0.8375615, -3.353698, -2.273925, 0.7647059, 1, 0, 1,
-0.8360657, -0.04470369, -0.7255446, 0.7568628, 1, 0, 1,
-0.8326182, -0.02864016, 0.0503596, 0.7529412, 1, 0, 1,
-0.8323193, -0.2282804, -3.033263, 0.7450981, 1, 0, 1,
-0.8227414, 0.8711453, -0.48058, 0.7411765, 1, 0, 1,
-0.8203067, -0.7619296, -3.405116, 0.7333333, 1, 0, 1,
-0.8174083, -0.2957245, -1.208313, 0.7294118, 1, 0, 1,
-0.8159512, 0.3995318, -2.011176, 0.7215686, 1, 0, 1,
-0.8105712, -0.8048009, -3.525292, 0.7176471, 1, 0, 1,
-0.8073931, -1.510109, -2.604165, 0.7098039, 1, 0, 1,
-0.7947134, -1.133685, -1.563567, 0.7058824, 1, 0, 1,
-0.7946939, 0.3092131, -0.6419549, 0.6980392, 1, 0, 1,
-0.7940015, 1.468439, -0.606284, 0.6901961, 1, 0, 1,
-0.791523, -0.6305982, -3.927357, 0.6862745, 1, 0, 1,
-0.7858854, -1.66303, -3.883312, 0.6784314, 1, 0, 1,
-0.7794885, 0.09620564, -1.271681, 0.6745098, 1, 0, 1,
-0.7764584, 1.030304, -1.933619, 0.6666667, 1, 0, 1,
-0.7752814, 0.2100028, 0.6133997, 0.6627451, 1, 0, 1,
-0.7717199, 0.7898283, -2.773883, 0.654902, 1, 0, 1,
-0.7680996, -0.3512861, -1.612498, 0.6509804, 1, 0, 1,
-0.7650791, -0.4598868, -0.1749681, 0.6431373, 1, 0, 1,
-0.76373, 1.03225, -2.307543, 0.6392157, 1, 0, 1,
-0.7621593, 1.331503, -1.638505, 0.6313726, 1, 0, 1,
-0.7608016, 1.599537, 0.3976157, 0.627451, 1, 0, 1,
-0.7597738, -0.8752902, -2.721516, 0.6196079, 1, 0, 1,
-0.758598, -1.458543, -2.873363, 0.6156863, 1, 0, 1,
-0.7582051, 0.4071783, 0.05617234, 0.6078432, 1, 0, 1,
-0.7580135, -0.1953543, -1.970153, 0.6039216, 1, 0, 1,
-0.7561668, -0.3024478, -2.227405, 0.5960785, 1, 0, 1,
-0.7530088, -0.9251184, -2.283858, 0.5882353, 1, 0, 1,
-0.7523649, 0.1783832, -2.016811, 0.5843138, 1, 0, 1,
-0.752361, 0.1519829, -0.6203075, 0.5764706, 1, 0, 1,
-0.751065, -1.114629, -2.518951, 0.572549, 1, 0, 1,
-0.7500791, -1.096817, -2.02164, 0.5647059, 1, 0, 1,
-0.7490851, 0.4514129, 0.03746568, 0.5607843, 1, 0, 1,
-0.7464794, 0.3125246, 0.09298669, 0.5529412, 1, 0, 1,
-0.7452908, -0.7258424, -3.004512, 0.5490196, 1, 0, 1,
-0.7373521, 0.2781749, -0.8149663, 0.5411765, 1, 0, 1,
-0.7363873, 1.415337, 0.1630012, 0.5372549, 1, 0, 1,
-0.7344816, -1.299235, -1.571106, 0.5294118, 1, 0, 1,
-0.7341765, -0.009997952, -2.047393, 0.5254902, 1, 0, 1,
-0.7333076, -0.9623792, -2.03187, 0.5176471, 1, 0, 1,
-0.7326934, -0.6059112, -0.8668576, 0.5137255, 1, 0, 1,
-0.7309094, -0.1208766, -2.09568, 0.5058824, 1, 0, 1,
-0.7308906, -1.345663, -2.531653, 0.5019608, 1, 0, 1,
-0.7261613, 0.5741249, -0.02869773, 0.4941176, 1, 0, 1,
-0.7208537, 0.6290557, 0.1940424, 0.4862745, 1, 0, 1,
-0.714814, -0.6405754, -1.777569, 0.4823529, 1, 0, 1,
-0.712226, 1.761681, -0.5504138, 0.4745098, 1, 0, 1,
-0.7104104, 0.9773248, -0.2549341, 0.4705882, 1, 0, 1,
-0.709048, -1.585271, -2.076894, 0.4627451, 1, 0, 1,
-0.7051923, 0.1915452, -0.1216135, 0.4588235, 1, 0, 1,
-0.7041121, -0.03349749, -0.6828014, 0.4509804, 1, 0, 1,
-0.6979495, 0.2341026, -0.6587824, 0.4470588, 1, 0, 1,
-0.6875245, 0.07120373, -1.871102, 0.4392157, 1, 0, 1,
-0.6787574, 0.3060734, -2.748313, 0.4352941, 1, 0, 1,
-0.6754886, 0.3969864, 0.1277429, 0.427451, 1, 0, 1,
-0.6740684, 1.725485, -0.09690604, 0.4235294, 1, 0, 1,
-0.6700636, -0.4744475, -1.231074, 0.4156863, 1, 0, 1,
-0.6617858, -0.6097125, -2.481279, 0.4117647, 1, 0, 1,
-0.6609278, -0.1493249, -0.9916316, 0.4039216, 1, 0, 1,
-0.6581537, 1.114962, -0.934203, 0.3960784, 1, 0, 1,
-0.6579407, -0.8624831, -2.870088, 0.3921569, 1, 0, 1,
-0.6558595, -0.4620159, -3.099426, 0.3843137, 1, 0, 1,
-0.6558542, -0.2475554, -0.1814694, 0.3803922, 1, 0, 1,
-0.6489919, -0.5925739, 0.6449577, 0.372549, 1, 0, 1,
-0.6469585, -0.2199218, -0.7869011, 0.3686275, 1, 0, 1,
-0.6451035, -0.2150373, -2.514226, 0.3607843, 1, 0, 1,
-0.6440575, -0.2808026, -1.414561, 0.3568628, 1, 0, 1,
-0.6412877, 0.3248197, -0.5610314, 0.3490196, 1, 0, 1,
-0.6360114, 1.200826, -0.5347176, 0.345098, 1, 0, 1,
-0.6313481, -0.5113952, -3.020681, 0.3372549, 1, 0, 1,
-0.6307026, -0.8258457, -3.078671, 0.3333333, 1, 0, 1,
-0.6280292, 0.9214731, -0.4070702, 0.3254902, 1, 0, 1,
-0.6271826, 0.471909, -1.986593, 0.3215686, 1, 0, 1,
-0.6267104, -1.248391, -1.224148, 0.3137255, 1, 0, 1,
-0.6264389, 0.09196377, -0.7563219, 0.3098039, 1, 0, 1,
-0.6257305, -0.5785539, -1.726567, 0.3019608, 1, 0, 1,
-0.6195363, -1.370873, -2.930538, 0.2941177, 1, 0, 1,
-0.6177111, 2.451203, 0.2638092, 0.2901961, 1, 0, 1,
-0.6138729, 0.003549814, -0.08786611, 0.282353, 1, 0, 1,
-0.6134119, 0.1181163, -0.2176746, 0.2784314, 1, 0, 1,
-0.6086231, -1.116051, -1.896022, 0.2705882, 1, 0, 1,
-0.6016339, -1.567374, -2.286343, 0.2666667, 1, 0, 1,
-0.5933934, 1.353053, 0.4971521, 0.2588235, 1, 0, 1,
-0.5892137, -1.482009, -3.30953, 0.254902, 1, 0, 1,
-0.5815597, -1.184921, -4.023675, 0.2470588, 1, 0, 1,
-0.5806834, -0.2714562, -3.865503, 0.2431373, 1, 0, 1,
-0.5785862, 1.067351, -0.4365692, 0.2352941, 1, 0, 1,
-0.5744704, 0.6519715, -2.988149, 0.2313726, 1, 0, 1,
-0.5717542, -1.2978, -2.89324, 0.2235294, 1, 0, 1,
-0.5680076, -0.4123616, -1.139523, 0.2196078, 1, 0, 1,
-0.5630621, 0.2567971, -0.2897667, 0.2117647, 1, 0, 1,
-0.5620837, -1.079426, -3.087698, 0.2078431, 1, 0, 1,
-0.5610995, 0.7801752, -2.685369, 0.2, 1, 0, 1,
-0.5595006, 0.1307797, -1.963112, 0.1921569, 1, 0, 1,
-0.5592949, 2.050963, -0.1391333, 0.1882353, 1, 0, 1,
-0.5518479, 0.06567151, -1.876073, 0.1803922, 1, 0, 1,
-0.5510065, 0.9067463, 0.0202848, 0.1764706, 1, 0, 1,
-0.5493181, 0.07941701, -1.864211, 0.1686275, 1, 0, 1,
-0.5492528, -0.6221044, -3.012961, 0.1647059, 1, 0, 1,
-0.5479164, -0.6409553, -3.833189, 0.1568628, 1, 0, 1,
-0.5437472, -0.7086691, -0.3168028, 0.1529412, 1, 0, 1,
-0.5395637, 0.1207966, -2.48737, 0.145098, 1, 0, 1,
-0.5384134, 0.2436742, -0.9848706, 0.1411765, 1, 0, 1,
-0.5193169, 0.04552901, -2.165622, 0.1333333, 1, 0, 1,
-0.517742, -0.9472021, -2.475725, 0.1294118, 1, 0, 1,
-0.5119795, -0.5189745, -1.621166, 0.1215686, 1, 0, 1,
-0.5083546, -0.2186645, -1.272463, 0.1176471, 1, 0, 1,
-0.5077283, -1.006672, -1.74027, 0.1098039, 1, 0, 1,
-0.5040368, -1.381298, -3.513537, 0.1058824, 1, 0, 1,
-0.4997433, 1.526399, -1.201754, 0.09803922, 1, 0, 1,
-0.4997226, 0.8597292, 2.019378, 0.09019608, 1, 0, 1,
-0.4955169, 0.150203, -1.528404, 0.08627451, 1, 0, 1,
-0.4937256, -0.5280461, -1.125235, 0.07843138, 1, 0, 1,
-0.4908341, 1.858292, 0.2404144, 0.07450981, 1, 0, 1,
-0.4874356, 1.257478, -1.24512, 0.06666667, 1, 0, 1,
-0.4873581, 0.6594114, -0.2230516, 0.0627451, 1, 0, 1,
-0.4873502, -1.274247, -2.583445, 0.05490196, 1, 0, 1,
-0.4869795, 0.5998724, -2.080328, 0.05098039, 1, 0, 1,
-0.4837008, 0.5870928, -0.2960872, 0.04313726, 1, 0, 1,
-0.479939, -0.5442641, -3.355786, 0.03921569, 1, 0, 1,
-0.4787574, 0.4229278, -1.454168, 0.03137255, 1, 0, 1,
-0.4759239, 0.5505493, -0.5570453, 0.02745098, 1, 0, 1,
-0.4758846, -1.255722, -2.679216, 0.01960784, 1, 0, 1,
-0.4727669, 0.5455125, -1.128222, 0.01568628, 1, 0, 1,
-0.4677035, -1.762293, -3.033702, 0.007843138, 1, 0, 1,
-0.4674597, 1.959388, -0.4506547, 0.003921569, 1, 0, 1,
-0.4666237, 0.3674397, -0.9465788, 0, 1, 0.003921569, 1,
-0.4650886, 0.4544755, -0.8798494, 0, 1, 0.01176471, 1,
-0.4643999, -0.861945, -3.915984, 0, 1, 0.01568628, 1,
-0.4630565, 1.06943, -0.06571495, 0, 1, 0.02352941, 1,
-0.4587262, -0.6652068, -2.55821, 0, 1, 0.02745098, 1,
-0.4579374, -1.287648, -2.526642, 0, 1, 0.03529412, 1,
-0.4571715, 0.4085942, -1.016493, 0, 1, 0.03921569, 1,
-0.4558099, 0.6690384, -0.8565346, 0, 1, 0.04705882, 1,
-0.4549464, 0.7150184, -1.029739, 0, 1, 0.05098039, 1,
-0.4546465, -0.317471, -2.75194, 0, 1, 0.05882353, 1,
-0.4543036, -1.428403, -3.908248, 0, 1, 0.0627451, 1,
-0.4535249, 0.4773299, 0.5932799, 0, 1, 0.07058824, 1,
-0.4520604, -0.6065302, -2.539598, 0, 1, 0.07450981, 1,
-0.4441348, -0.1619135, -2.414477, 0, 1, 0.08235294, 1,
-0.4365532, -0.6282379, -3.056211, 0, 1, 0.08627451, 1,
-0.4342828, 0.8604764, 0.6951215, 0, 1, 0.09411765, 1,
-0.4299444, -2.210344, -2.796583, 0, 1, 0.1019608, 1,
-0.4274175, 0.01049231, -0.1121866, 0, 1, 0.1058824, 1,
-0.4246246, 0.9363183, -1.320615, 0, 1, 0.1137255, 1,
-0.4242686, -0.844063, -2.292904, 0, 1, 0.1176471, 1,
-0.4195389, -0.5205192, -2.853298, 0, 1, 0.1254902, 1,
-0.4184279, 1.08128, -0.5790887, 0, 1, 0.1294118, 1,
-0.4146584, -1.559407, -1.915115, 0, 1, 0.1372549, 1,
-0.4139539, 1.404127, -0.6894854, 0, 1, 0.1411765, 1,
-0.4125893, -0.08616435, -3.568455, 0, 1, 0.1490196, 1,
-0.4078354, -0.2474307, -1.588623, 0, 1, 0.1529412, 1,
-0.4077341, -0.3410378, -3.495937, 0, 1, 0.1607843, 1,
-0.4076387, 0.001329625, -1.916513, 0, 1, 0.1647059, 1,
-0.4061976, 0.5436206, 0.5004664, 0, 1, 0.172549, 1,
-0.4034058, 1.200568, -0.1969948, 0, 1, 0.1764706, 1,
-0.3995093, 1.710131, -0.3285699, 0, 1, 0.1843137, 1,
-0.3983369, 0.2959083, -0.3357258, 0, 1, 0.1882353, 1,
-0.3963042, 0.3293949, -0.7965242, 0, 1, 0.1960784, 1,
-0.3939345, 1.199397, -0.6643687, 0, 1, 0.2039216, 1,
-0.3936884, 0.4514569, -0.4446836, 0, 1, 0.2078431, 1,
-0.3875489, 0.08515079, -1.210119, 0, 1, 0.2156863, 1,
-0.3829128, 0.6760743, -0.4609402, 0, 1, 0.2196078, 1,
-0.3825964, -1.0515, -2.071285, 0, 1, 0.227451, 1,
-0.3814754, -0.4733673, -2.605047, 0, 1, 0.2313726, 1,
-0.3772629, -0.5291563, -2.030557, 0, 1, 0.2392157, 1,
-0.3747025, -0.2757496, -3.038407, 0, 1, 0.2431373, 1,
-0.3740753, 0.02226081, -2.132272, 0, 1, 0.2509804, 1,
-0.3722928, 0.6607756, 0.2461529, 0, 1, 0.254902, 1,
-0.3699756, -1.340519, -2.15955, 0, 1, 0.2627451, 1,
-0.3685437, -1.348191, -4.914883, 0, 1, 0.2666667, 1,
-0.3683845, 0.3434144, -0.5166124, 0, 1, 0.2745098, 1,
-0.367606, 0.8383105, -0.2669592, 0, 1, 0.2784314, 1,
-0.3638597, 0.5310205, -1.012066, 0, 1, 0.2862745, 1,
-0.3608781, 1.05859, -1.492661, 0, 1, 0.2901961, 1,
-0.3592227, 1.614087, -1.944855, 0, 1, 0.2980392, 1,
-0.3535956, 2.130819, 0.1992531, 0, 1, 0.3058824, 1,
-0.3511593, 0.1270738, -1.324888, 0, 1, 0.3098039, 1,
-0.3474151, 0.2214137, -1.515957, 0, 1, 0.3176471, 1,
-0.3439388, -0.293541, -2.013301, 0, 1, 0.3215686, 1,
-0.3424872, 0.8653752, 0.4765326, 0, 1, 0.3294118, 1,
-0.3395673, 0.01783453, -2.249627, 0, 1, 0.3333333, 1,
-0.3315185, 0.2138696, -0.7421964, 0, 1, 0.3411765, 1,
-0.3303897, -0.1738379, -2.865993, 0, 1, 0.345098, 1,
-0.3162969, -0.8494079, -2.434862, 0, 1, 0.3529412, 1,
-0.3162156, 2.058146, 0.4506283, 0, 1, 0.3568628, 1,
-0.3104993, -0.7536653, -2.482513, 0, 1, 0.3647059, 1,
-0.3085197, -0.4424303, -1.47713, 0, 1, 0.3686275, 1,
-0.3077907, 1.362015, 0.6948157, 0, 1, 0.3764706, 1,
-0.3068331, -0.6285853, -2.554678, 0, 1, 0.3803922, 1,
-0.3020723, -0.1336561, -3.482248, 0, 1, 0.3882353, 1,
-0.3016153, -0.1233275, -1.828816, 0, 1, 0.3921569, 1,
-0.2989923, -1.03703, -4.477827, 0, 1, 0.4, 1,
-0.2934432, -0.4369095, -3.233232, 0, 1, 0.4078431, 1,
-0.2933685, -1.299898, -2.260908, 0, 1, 0.4117647, 1,
-0.2847174, 0.2384212, 0.5901723, 0, 1, 0.4196078, 1,
-0.2841341, 0.5683954, -0.8179026, 0, 1, 0.4235294, 1,
-0.2828, -0.7945521, -2.427218, 0, 1, 0.4313726, 1,
-0.2790762, -0.01398264, -3.914014, 0, 1, 0.4352941, 1,
-0.278232, 0.1300793, -0.9090337, 0, 1, 0.4431373, 1,
-0.2744725, 0.6577675, 0.4202692, 0, 1, 0.4470588, 1,
-0.2694583, 1.315472, -0.8516752, 0, 1, 0.454902, 1,
-0.2671442, 0.7994556, -1.241842, 0, 1, 0.4588235, 1,
-0.2652141, -0.8333182, -3.022137, 0, 1, 0.4666667, 1,
-0.2627059, 0.3696734, -2.641189, 0, 1, 0.4705882, 1,
-0.2568086, 0.1005179, -2.863768, 0, 1, 0.4784314, 1,
-0.2563457, 1.116221, -0.684386, 0, 1, 0.4823529, 1,
-0.2495416, -0.08418373, -1.041948, 0, 1, 0.4901961, 1,
-0.2423026, -1.880599, -4.001177, 0, 1, 0.4941176, 1,
-0.2398237, -0.4422179, -2.749429, 0, 1, 0.5019608, 1,
-0.2354112, 1.183926, -0.2545463, 0, 1, 0.509804, 1,
-0.2343321, 0.9254654, 0.6484911, 0, 1, 0.5137255, 1,
-0.2275798, 0.06741437, -1.927271, 0, 1, 0.5215687, 1,
-0.2160804, 1.233854, -0.8321883, 0, 1, 0.5254902, 1,
-0.2153083, -1.209793, -2.39492, 0, 1, 0.5333334, 1,
-0.2145413, 0.01214654, -2.126036, 0, 1, 0.5372549, 1,
-0.2128515, -0.6269264, -2.475611, 0, 1, 0.5450981, 1,
-0.2110036, -0.2654034, -2.022396, 0, 1, 0.5490196, 1,
-0.2103585, -0.4902735, -1.013373, 0, 1, 0.5568628, 1,
-0.204185, -0.3530087, -2.751606, 0, 1, 0.5607843, 1,
-0.2017315, 0.5988356, 1.195385, 0, 1, 0.5686275, 1,
-0.2012718, 0.1634644, -2.144346, 0, 1, 0.572549, 1,
-0.1978631, -0.4884999, -3.834537, 0, 1, 0.5803922, 1,
-0.1973693, -1.241156, -1.019262, 0, 1, 0.5843138, 1,
-0.196783, 0.6079846, -0.2518983, 0, 1, 0.5921569, 1,
-0.1926839, 2.422179, 2.184552, 0, 1, 0.5960785, 1,
-0.1910647, -1.842242, -3.458893, 0, 1, 0.6039216, 1,
-0.1901287, 1.762045, 0.5814002, 0, 1, 0.6117647, 1,
-0.1847566, -0.7382725, -2.727414, 0, 1, 0.6156863, 1,
-0.1840996, -0.4254785, -1.662002, 0, 1, 0.6235294, 1,
-0.1804322, -1.27116, -3.845933, 0, 1, 0.627451, 1,
-0.1789863, -0.2745709, -2.948294, 0, 1, 0.6352941, 1,
-0.1776058, -0.1468886, -3.142856, 0, 1, 0.6392157, 1,
-0.1774987, -0.5248441, -3.117174, 0, 1, 0.6470588, 1,
-0.175688, 0.05465484, -0.6501243, 0, 1, 0.6509804, 1,
-0.1754682, 0.5127325, -0.1191694, 0, 1, 0.6588235, 1,
-0.1751838, -1.313564, -0.7741984, 0, 1, 0.6627451, 1,
-0.1719344, 0.7048698, -1.184262, 0, 1, 0.6705883, 1,
-0.167312, -2.050442, -1.308758, 0, 1, 0.6745098, 1,
-0.1648494, 0.04038751, -1.246006, 0, 1, 0.682353, 1,
-0.1643175, -0.05088947, -2.102979, 0, 1, 0.6862745, 1,
-0.159543, -0.3796884, -3.319181, 0, 1, 0.6941177, 1,
-0.1576262, -0.6466944, -1.374456, 0, 1, 0.7019608, 1,
-0.1561477, 1.918562, -1.44873, 0, 1, 0.7058824, 1,
-0.1541982, 0.4133671, -1.100062, 0, 1, 0.7137255, 1,
-0.1528095, -0.4558277, -2.868645, 0, 1, 0.7176471, 1,
-0.151036, 0.4959536, -0.6051008, 0, 1, 0.7254902, 1,
-0.1504595, 1.87435, -0.6782224, 0, 1, 0.7294118, 1,
-0.1496636, -1.329606, -3.493881, 0, 1, 0.7372549, 1,
-0.1495099, 0.8065605, -0.6715721, 0, 1, 0.7411765, 1,
-0.1491155, 2.22329, -0.4745024, 0, 1, 0.7490196, 1,
-0.1487537, -0.7424797, -3.620156, 0, 1, 0.7529412, 1,
-0.1399151, 0.8591692, 1.01871, 0, 1, 0.7607843, 1,
-0.1394629, -0.7825255, -2.494757, 0, 1, 0.7647059, 1,
-0.1367772, -0.1473155, -4.233226, 0, 1, 0.772549, 1,
-0.1316316, 1.898758, -0.9237647, 0, 1, 0.7764706, 1,
-0.1310866, -1.241759, -2.678272, 0, 1, 0.7843137, 1,
-0.1296422, 0.2795551, -1.552455, 0, 1, 0.7882353, 1,
-0.1252618, -0.6342481, -3.176667, 0, 1, 0.7960784, 1,
-0.1248874, -0.766831, -2.23017, 0, 1, 0.8039216, 1,
-0.1199257, -0.56711, -1.38422, 0, 1, 0.8078431, 1,
-0.1184469, 2.520886, 2.028859, 0, 1, 0.8156863, 1,
-0.1175039, -0.091611, -2.99577, 0, 1, 0.8196079, 1,
-0.1167362, 2.381645, -0.3106621, 0, 1, 0.827451, 1,
-0.1131329, 0.2191479, 0.4188945, 0, 1, 0.8313726, 1,
-0.1075526, 0.7988383, 0.4249611, 0, 1, 0.8392157, 1,
-0.1045485, 0.005755478, -3.175003, 0, 1, 0.8431373, 1,
-0.1004107, -0.2841498, -2.399423, 0, 1, 0.8509804, 1,
-0.09931246, -0.8130596, -3.680645, 0, 1, 0.854902, 1,
-0.09268413, 1.096684, 0.9776436, 0, 1, 0.8627451, 1,
-0.0904334, -0.7219898, -3.653327, 0, 1, 0.8666667, 1,
-0.08863599, -1.946055, -0.947955, 0, 1, 0.8745098, 1,
-0.08598638, -1.134191, -2.809271, 0, 1, 0.8784314, 1,
-0.08428658, 0.08070709, 0.3316741, 0, 1, 0.8862745, 1,
-0.08123748, -0.6357331, -4.400308, 0, 1, 0.8901961, 1,
-0.08006031, -0.3774703, -1.136167, 0, 1, 0.8980392, 1,
-0.07984471, -0.7107493, -1.912394, 0, 1, 0.9058824, 1,
-0.07835577, 0.2529287, -0.4859398, 0, 1, 0.9098039, 1,
-0.07470334, -0.01113146, -1.192772, 0, 1, 0.9176471, 1,
-0.07247896, -0.563677, -3.76327, 0, 1, 0.9215686, 1,
-0.07167935, 0.4876629, 1.288861, 0, 1, 0.9294118, 1,
-0.07166156, -1.505056, -2.713308, 0, 1, 0.9333333, 1,
-0.06969786, 0.8152066, 1.130312, 0, 1, 0.9411765, 1,
-0.06928116, 0.8879517, 0.9190289, 0, 1, 0.945098, 1,
-0.06589839, 0.45103, -2.383914, 0, 1, 0.9529412, 1,
-0.06467171, -2.223412, -5.337534, 0, 1, 0.9568627, 1,
-0.0631503, -0.5973332, -4.174931, 0, 1, 0.9647059, 1,
-0.05779993, -1.921243, -2.715808, 0, 1, 0.9686275, 1,
-0.05590029, 2.120975, 1.557691, 0, 1, 0.9764706, 1,
-0.05564434, 0.5517618, -0.7754927, 0, 1, 0.9803922, 1,
-0.05555262, -0.9513752, -4.48073, 0, 1, 0.9882353, 1,
-0.05480585, 1.785121, 0.2854683, 0, 1, 0.9921569, 1,
-0.04663136, 0.1516639, 1.780481, 0, 1, 1, 1,
-0.04612819, -0.201292, -3.079193, 0, 0.9921569, 1, 1,
-0.04495555, -0.7335951, -3.679251, 0, 0.9882353, 1, 1,
-0.04318304, -1.349038, -2.68669, 0, 0.9803922, 1, 1,
-0.04156521, -0.1573602, -3.199866, 0, 0.9764706, 1, 1,
-0.04142437, -1.318755, -3.713933, 0, 0.9686275, 1, 1,
-0.04135236, 0.2788555, 0.0561254, 0, 0.9647059, 1, 1,
-0.03860325, 0.5342652, -0.8664479, 0, 0.9568627, 1, 1,
-0.03829322, 0.4224547, -0.7576616, 0, 0.9529412, 1, 1,
-0.03268458, 1.346011, 0.5980775, 0, 0.945098, 1, 1,
-0.03030085, -1.241847, -1.400203, 0, 0.9411765, 1, 1,
-0.0299673, -0.009430065, -1.780216, 0, 0.9333333, 1, 1,
-0.02407849, 0.08103516, 1.116932, 0, 0.9294118, 1, 1,
-0.02233735, -0.7699026, -3.549054, 0, 0.9215686, 1, 1,
-0.01932857, -3.287679, -2.38888, 0, 0.9176471, 1, 1,
-0.0192863, -1.457057, -3.00592, 0, 0.9098039, 1, 1,
-0.01099176, -0.5970709, -2.651164, 0, 0.9058824, 1, 1,
-0.01061906, 0.6133578, 1.563713, 0, 0.8980392, 1, 1,
-0.01023317, -0.680123, -2.839386, 0, 0.8901961, 1, 1,
-0.009115097, -0.336788, -3.218132, 0, 0.8862745, 1, 1,
-0.007556669, 0.537634, 0.7066418, 0, 0.8784314, 1, 1,
-0.006502674, -0.123995, -3.282999, 0, 0.8745098, 1, 1,
-0.004534397, -0.3101535, -3.326695, 0, 0.8666667, 1, 1,
-0.003708535, -0.1661329, -3.756748, 0, 0.8627451, 1, 1,
0.007176807, -0.1237668, 2.146374, 0, 0.854902, 1, 1,
0.01063254, 0.5940049, -0.2951343, 0, 0.8509804, 1, 1,
0.01172098, -1.090748, 3.213587, 0, 0.8431373, 1, 1,
0.01457259, 0.2516159, -0.2737483, 0, 0.8392157, 1, 1,
0.01494768, 0.9405013, 0.7384564, 0, 0.8313726, 1, 1,
0.02005236, -1.770259, 1.68698, 0, 0.827451, 1, 1,
0.02153573, 0.7179192, -1.518291, 0, 0.8196079, 1, 1,
0.02489429, 0.8315539, -0.7970406, 0, 0.8156863, 1, 1,
0.02528917, -0.6522871, 1.711038, 0, 0.8078431, 1, 1,
0.02816605, -0.7596463, 3.564996, 0, 0.8039216, 1, 1,
0.02849347, -1.249377, 4.323535, 0, 0.7960784, 1, 1,
0.03284985, -1.581963, 2.410445, 0, 0.7882353, 1, 1,
0.03355949, 0.2660455, 1.076081, 0, 0.7843137, 1, 1,
0.0348944, -0.9645814, 2.581553, 0, 0.7764706, 1, 1,
0.03811399, 1.288294, -0.8169265, 0, 0.772549, 1, 1,
0.03860567, 0.04509288, -0.300947, 0, 0.7647059, 1, 1,
0.0386698, -1.427731, 4.102879, 0, 0.7607843, 1, 1,
0.03914972, 0.6327967, -0.4877808, 0, 0.7529412, 1, 1,
0.04020737, -0.03900965, 2.046241, 0, 0.7490196, 1, 1,
0.04541976, 0.7366536, -0.9446365, 0, 0.7411765, 1, 1,
0.04956171, 0.9133906, -1.18337, 0, 0.7372549, 1, 1,
0.05330137, -1.127134, 2.963225, 0, 0.7294118, 1, 1,
0.05413698, 2.408717, 0.03917174, 0, 0.7254902, 1, 1,
0.05493338, -1.492024, 2.992465, 0, 0.7176471, 1, 1,
0.05701759, 1.853466, 0.8651524, 0, 0.7137255, 1, 1,
0.05713579, -0.4911747, 3.867303, 0, 0.7058824, 1, 1,
0.06332931, -0.3899562, 3.03341, 0, 0.6980392, 1, 1,
0.06458659, -1.628613, 2.667007, 0, 0.6941177, 1, 1,
0.06729273, -1.979636, 2.018368, 0, 0.6862745, 1, 1,
0.06787328, -0.5761443, 2.523711, 0, 0.682353, 1, 1,
0.07803958, 0.9300134, 0.6287506, 0, 0.6745098, 1, 1,
0.08043935, -0.2641023, 3.248123, 0, 0.6705883, 1, 1,
0.0815945, 0.7650982, -1.475265, 0, 0.6627451, 1, 1,
0.08235329, -0.4303814, 3.133585, 0, 0.6588235, 1, 1,
0.08630028, 1.58906, 1.609971, 0, 0.6509804, 1, 1,
0.08728226, -0.6126938, 2.312246, 0, 0.6470588, 1, 1,
0.09260108, -0.248946, 2.747553, 0, 0.6392157, 1, 1,
0.09580547, -1.860803, 2.434358, 0, 0.6352941, 1, 1,
0.09703147, 0.3984092, 1.174703, 0, 0.627451, 1, 1,
0.1017182, -1.771777, 1.825542, 0, 0.6235294, 1, 1,
0.1027423, 1.072147, 0.2331033, 0, 0.6156863, 1, 1,
0.1046006, 0.01706319, 0.1499291, 0, 0.6117647, 1, 1,
0.1055474, -0.2914599, 2.168883, 0, 0.6039216, 1, 1,
0.1070445, 0.7154031, -0.7543535, 0, 0.5960785, 1, 1,
0.1117789, 0.1201181, -1.259615, 0, 0.5921569, 1, 1,
0.1120886, 0.7031363, 0.127705, 0, 0.5843138, 1, 1,
0.1145741, -2.178018, 2.750506, 0, 0.5803922, 1, 1,
0.1164455, 1.476187, 0.3693581, 0, 0.572549, 1, 1,
0.1174231, 0.8541152, 2.11158, 0, 0.5686275, 1, 1,
0.1186901, 0.4942942, 1.478092, 0, 0.5607843, 1, 1,
0.1201027, 0.6113434, -0.04932964, 0, 0.5568628, 1, 1,
0.1202539, 0.5653548, 0.6691745, 0, 0.5490196, 1, 1,
0.121132, 2.359473, -0.8182287, 0, 0.5450981, 1, 1,
0.1304295, 1.246069, 0.3630501, 0, 0.5372549, 1, 1,
0.1421235, 0.8104939, 0.6220003, 0, 0.5333334, 1, 1,
0.1482804, -1.210422, 3.750068, 0, 0.5254902, 1, 1,
0.1501271, 1.491337, -0.9205906, 0, 0.5215687, 1, 1,
0.1569168, 0.7129841, 0.1035584, 0, 0.5137255, 1, 1,
0.1616075, -0.6365475, 2.184772, 0, 0.509804, 1, 1,
0.1665662, -2.174545, 2.523752, 0, 0.5019608, 1, 1,
0.1730992, 1.326679, 0.4844268, 0, 0.4941176, 1, 1,
0.1802695, -0.8012389, 3.895897, 0, 0.4901961, 1, 1,
0.184825, 0.09978814, 1.315059, 0, 0.4823529, 1, 1,
0.1851495, -2.011069, 2.793575, 0, 0.4784314, 1, 1,
0.1865263, -0.8241493, 3.426866, 0, 0.4705882, 1, 1,
0.192103, -0.003814597, 1.731018, 0, 0.4666667, 1, 1,
0.1952481, 1.956846, -0.1914705, 0, 0.4588235, 1, 1,
0.1975295, -0.483725, 2.237633, 0, 0.454902, 1, 1,
0.1981075, -0.7047771, 2.876753, 0, 0.4470588, 1, 1,
0.1990422, 0.760707, 1.761911, 0, 0.4431373, 1, 1,
0.1991142, 1.049657, -1.456769, 0, 0.4352941, 1, 1,
0.2022383, 0.5609636, 0.8120683, 0, 0.4313726, 1, 1,
0.2029246, 0.001451401, 0.9638929, 0, 0.4235294, 1, 1,
0.2043162, 1.378565, -0.5145514, 0, 0.4196078, 1, 1,
0.2050074, -0.4314801, 1.953781, 0, 0.4117647, 1, 1,
0.2060457, 0.04237998, 2.719584, 0, 0.4078431, 1, 1,
0.2090392, 0.743103, 1.259478, 0, 0.4, 1, 1,
0.2223162, 0.310364, 0.3403729, 0, 0.3921569, 1, 1,
0.2239522, -0.7746891, 1.484691, 0, 0.3882353, 1, 1,
0.2264412, -0.03159148, 0.5006551, 0, 0.3803922, 1, 1,
0.2338662, -0.09649838, 2.341973, 0, 0.3764706, 1, 1,
0.2356976, -0.309746, 2.613466, 0, 0.3686275, 1, 1,
0.2394954, -0.4153184, 3.586615, 0, 0.3647059, 1, 1,
0.2408272, -1.817268, 1.363902, 0, 0.3568628, 1, 1,
0.2419657, 0.8811038, 1.063761, 0, 0.3529412, 1, 1,
0.2519895, 0.2451755, 1.108856, 0, 0.345098, 1, 1,
0.25543, 0.5604454, -0.2854792, 0, 0.3411765, 1, 1,
0.2557196, -0.322049, 3.551268, 0, 0.3333333, 1, 1,
0.2564452, -1.406155, 2.933141, 0, 0.3294118, 1, 1,
0.2606745, 1.432397, 2.225163, 0, 0.3215686, 1, 1,
0.2641066, 1.136311, 0.5275158, 0, 0.3176471, 1, 1,
0.2661629, -0.3397355, -0.4487172, 0, 0.3098039, 1, 1,
0.271587, -1.725641, 2.332876, 0, 0.3058824, 1, 1,
0.2718143, 1.178485, 0.04884043, 0, 0.2980392, 1, 1,
0.2722583, -1.111681, 1.815289, 0, 0.2901961, 1, 1,
0.2724758, -0.702764, 3.981993, 0, 0.2862745, 1, 1,
0.2725621, 0.4732548, 0.5329652, 0, 0.2784314, 1, 1,
0.2737823, 0.8255251, 0.3831377, 0, 0.2745098, 1, 1,
0.2783093, 1.949925, -0.4938453, 0, 0.2666667, 1, 1,
0.2809668, 0.2645787, -0.7453178, 0, 0.2627451, 1, 1,
0.2814249, 0.4905132, -0.08324473, 0, 0.254902, 1, 1,
0.2818555, 0.715969, 1.74996, 0, 0.2509804, 1, 1,
0.2845217, 0.3252864, 1.162091, 0, 0.2431373, 1, 1,
0.2851463, -0.8418451, 2.742721, 0, 0.2392157, 1, 1,
0.2867144, 0.1263658, 1.793725, 0, 0.2313726, 1, 1,
0.2871006, -1.029724, 5.029267, 0, 0.227451, 1, 1,
0.2899798, 0.1376328, 2.019376, 0, 0.2196078, 1, 1,
0.2910308, 1.646474, -1.124254, 0, 0.2156863, 1, 1,
0.2911117, -1.446338, 2.666548, 0, 0.2078431, 1, 1,
0.2945489, -0.5449868, 1.732555, 0, 0.2039216, 1, 1,
0.2962967, 0.5174081, 0.1413516, 0, 0.1960784, 1, 1,
0.296515, -1.113906, 4.884743, 0, 0.1882353, 1, 1,
0.3012874, -0.3103165, 1.155864, 0, 0.1843137, 1, 1,
0.3023564, -0.07967877, 0.5754884, 0, 0.1764706, 1, 1,
0.3043047, -0.359091, 3.827983, 0, 0.172549, 1, 1,
0.3098148, 1.224212, 2.205035, 0, 0.1647059, 1, 1,
0.311188, -1.24483, 2.718055, 0, 0.1607843, 1, 1,
0.316743, -1.261563, 3.776979, 0, 0.1529412, 1, 1,
0.3192296, -0.4833339, 5.432686, 0, 0.1490196, 1, 1,
0.3203088, -1.317231, 3.022973, 0, 0.1411765, 1, 1,
0.3229178, -0.1586718, 3.033306, 0, 0.1372549, 1, 1,
0.3278143, -0.1898721, 2.916074, 0, 0.1294118, 1, 1,
0.3279646, -1.681068, 3.672369, 0, 0.1254902, 1, 1,
0.3291708, 0.8780518, 0.04394474, 0, 0.1176471, 1, 1,
0.3294625, 1.938572, 0.3447998, 0, 0.1137255, 1, 1,
0.3395503, 0.5526418, 3.850749, 0, 0.1058824, 1, 1,
0.3402363, -2.333771, 1.667613, 0, 0.09803922, 1, 1,
0.3431024, 0.3628374, 0.3064561, 0, 0.09411765, 1, 1,
0.3448364, -0.6059856, 2.348624, 0, 0.08627451, 1, 1,
0.3454062, 1.88378, -0.1297138, 0, 0.08235294, 1, 1,
0.3490597, -0.824608, 1.798926, 0, 0.07450981, 1, 1,
0.3497162, 1.653586, 0.4583134, 0, 0.07058824, 1, 1,
0.3507296, 1.879662, 0.4090321, 0, 0.0627451, 1, 1,
0.3517779, 0.1736026, 0.4995695, 0, 0.05882353, 1, 1,
0.3541132, -0.4781319, 1.40113, 0, 0.05098039, 1, 1,
0.3583609, -0.4883725, 1.4847, 0, 0.04705882, 1, 1,
0.3611335, -1.361227, 3.199686, 0, 0.03921569, 1, 1,
0.3621209, -0.543366, 4.371822, 0, 0.03529412, 1, 1,
0.3637814, 1.354738, 1.268145, 0, 0.02745098, 1, 1,
0.3674494, 0.3078145, -0.6649191, 0, 0.02352941, 1, 1,
0.3686076, 0.03639394, 1.301029, 0, 0.01568628, 1, 1,
0.3694528, 1.069774, 0.9210945, 0, 0.01176471, 1, 1,
0.3714286, -1.777871, 4.798367, 0, 0.003921569, 1, 1,
0.3743908, 1.091403, 2.058964, 0.003921569, 0, 1, 1,
0.3776728, -0.2094664, 3.277131, 0.007843138, 0, 1, 1,
0.3840084, 0.564131, -0.4123614, 0.01568628, 0, 1, 1,
0.3877265, 3.172799, -0.5172938, 0.01960784, 0, 1, 1,
0.3926821, -1.118681, 4.104172, 0.02745098, 0, 1, 1,
0.3929494, -0.4923477, 2.292099, 0.03137255, 0, 1, 1,
0.398347, 1.639243, 1.278971, 0.03921569, 0, 1, 1,
0.3987408, -0.7547618, 2.960312, 0.04313726, 0, 1, 1,
0.3994341, 0.08331143, 3.012374, 0.05098039, 0, 1, 1,
0.4062426, 0.6248484, 0.7891893, 0.05490196, 0, 1, 1,
0.4086297, 0.8805318, 0.5261829, 0.0627451, 0, 1, 1,
0.409834, -1.957915, 1.965643, 0.06666667, 0, 1, 1,
0.4109896, -3.00341, 2.549318, 0.07450981, 0, 1, 1,
0.4121641, 2.039202, 1.42658, 0.07843138, 0, 1, 1,
0.4132652, 1.322444, 0.6683161, 0.08627451, 0, 1, 1,
0.4158462, -1.651108, 1.928331, 0.09019608, 0, 1, 1,
0.4172356, 0.8608, 1.18182, 0.09803922, 0, 1, 1,
0.4203873, -1.211977, 3.408251, 0.1058824, 0, 1, 1,
0.4216099, -0.3216055, 4.531394, 0.1098039, 0, 1, 1,
0.4222869, 1.345839, -0.5073895, 0.1176471, 0, 1, 1,
0.4251118, -0.4705496, 4.703797, 0.1215686, 0, 1, 1,
0.4258327, -1.019147, 4.123565, 0.1294118, 0, 1, 1,
0.4271979, -1.67257, 1.366862, 0.1333333, 0, 1, 1,
0.4281703, 1.253661, 2.647979, 0.1411765, 0, 1, 1,
0.4311315, 0.8058394, 1.958907, 0.145098, 0, 1, 1,
0.4360921, -2.031827, 3.683682, 0.1529412, 0, 1, 1,
0.4369655, -1.525976, 2.181813, 0.1568628, 0, 1, 1,
0.441996, -0.7905716, 4.850911, 0.1647059, 0, 1, 1,
0.4431233, -1.14176, 2.527019, 0.1686275, 0, 1, 1,
0.443354, 0.0284532, 1.217081, 0.1764706, 0, 1, 1,
0.4443761, 1.098945, 1.609833, 0.1803922, 0, 1, 1,
0.4478462, 1.167633, -0.3112119, 0.1882353, 0, 1, 1,
0.4506354, -0.4393637, 2.508191, 0.1921569, 0, 1, 1,
0.452343, -0.1569489, 1.646901, 0.2, 0, 1, 1,
0.4527117, -0.8771785, 1.532136, 0.2078431, 0, 1, 1,
0.4553174, -1.435506, 4.750591, 0.2117647, 0, 1, 1,
0.4585465, 0.8700718, 0.2174961, 0.2196078, 0, 1, 1,
0.4608757, -0.6851786, 2.562236, 0.2235294, 0, 1, 1,
0.4626788, 0.4240984, 3.008412, 0.2313726, 0, 1, 1,
0.4627412, 0.2072257, 3.77545, 0.2352941, 0, 1, 1,
0.4630105, 1.034306, 0.1171762, 0.2431373, 0, 1, 1,
0.4649688, 0.5082856, 1.10504, 0.2470588, 0, 1, 1,
0.4710916, -0.722929, 2.129115, 0.254902, 0, 1, 1,
0.4722308, 1.968008, -0.1166904, 0.2588235, 0, 1, 1,
0.4779317, 0.8655172, 0.6874357, 0.2666667, 0, 1, 1,
0.4779329, -0.2255542, 1.703142, 0.2705882, 0, 1, 1,
0.4795825, 2.130913, -0.8920672, 0.2784314, 0, 1, 1,
0.4820368, -1.742854, 4.701772, 0.282353, 0, 1, 1,
0.482954, 0.7290583, -1.360208, 0.2901961, 0, 1, 1,
0.483613, -2.324497, 3.574613, 0.2941177, 0, 1, 1,
0.4857955, -0.2896272, 2.050475, 0.3019608, 0, 1, 1,
0.4948981, -0.2772855, 0.9693105, 0.3098039, 0, 1, 1,
0.4970777, -1.966499, 2.066165, 0.3137255, 0, 1, 1,
0.4973919, -0.00129113, 1.212545, 0.3215686, 0, 1, 1,
0.4976436, -1.500706, 1.548149, 0.3254902, 0, 1, 1,
0.4982564, -2.053284, 3.651351, 0.3333333, 0, 1, 1,
0.5003282, -1.508682, 2.903005, 0.3372549, 0, 1, 1,
0.5012898, -1.234977, 3.707861, 0.345098, 0, 1, 1,
0.5025289, -0.878891, 3.321244, 0.3490196, 0, 1, 1,
0.5037261, -0.05322934, 0.8928449, 0.3568628, 0, 1, 1,
0.5054005, -0.0426385, 2.904397, 0.3607843, 0, 1, 1,
0.5076762, -0.2811611, 2.801909, 0.3686275, 0, 1, 1,
0.5174434, 1.185989, 1.580633, 0.372549, 0, 1, 1,
0.5201827, 1.035091, 1.258919, 0.3803922, 0, 1, 1,
0.5263931, -0.6370043, 0.6354747, 0.3843137, 0, 1, 1,
0.5340487, 0.1589014, 2.358477, 0.3921569, 0, 1, 1,
0.534256, -0.5470186, 1.119771, 0.3960784, 0, 1, 1,
0.5356445, -0.3498372, 3.838199, 0.4039216, 0, 1, 1,
0.5427331, -1.726251, 2.602365, 0.4117647, 0, 1, 1,
0.5457599, -1.252743, 4.869293, 0.4156863, 0, 1, 1,
0.5516062, -1.309188, 2.5351, 0.4235294, 0, 1, 1,
0.5578384, -0.12076, 3.784712, 0.427451, 0, 1, 1,
0.5581769, 0.4177038, 0.5988826, 0.4352941, 0, 1, 1,
0.5607144, -1.631555, 2.348023, 0.4392157, 0, 1, 1,
0.5611608, 1.350614, -1.856688, 0.4470588, 0, 1, 1,
0.5673305, -0.820098, 2.594131, 0.4509804, 0, 1, 1,
0.5688993, -0.5460581, 1.904127, 0.4588235, 0, 1, 1,
0.5712324, -2.894126, 4.233757, 0.4627451, 0, 1, 1,
0.575573, 0.4541254, 0.1575735, 0.4705882, 0, 1, 1,
0.5819982, -0.8066407, 1.377031, 0.4745098, 0, 1, 1,
0.5872374, 0.7517102, 0.9873295, 0.4823529, 0, 1, 1,
0.5881941, -1.165593, 0.9129894, 0.4862745, 0, 1, 1,
0.5888586, 1.534749, -1.488555, 0.4941176, 0, 1, 1,
0.590169, 2.159385, -0.1123794, 0.5019608, 0, 1, 1,
0.5923051, -0.2757846, 1.07869, 0.5058824, 0, 1, 1,
0.5927613, 1.273885, -1.088787, 0.5137255, 0, 1, 1,
0.6003075, 0.0727884, 1.766186, 0.5176471, 0, 1, 1,
0.6035201, -0.7413575, 1.49615, 0.5254902, 0, 1, 1,
0.6085485, -0.4309354, 3.513068, 0.5294118, 0, 1, 1,
0.6163891, 0.2686905, 2.372448, 0.5372549, 0, 1, 1,
0.6185653, 1.938496, 0.7870374, 0.5411765, 0, 1, 1,
0.6197136, 0.06077118, 2.769732, 0.5490196, 0, 1, 1,
0.6265916, -0.613003, 0.5755712, 0.5529412, 0, 1, 1,
0.6316224, 0.3818983, 2.755659, 0.5607843, 0, 1, 1,
0.6380756, 1.5127, -0.1910082, 0.5647059, 0, 1, 1,
0.6381356, 0.7563834, -0.2510012, 0.572549, 0, 1, 1,
0.6462632, -0.7740129, 2.177082, 0.5764706, 0, 1, 1,
0.6507348, 0.02307958, 2.455076, 0.5843138, 0, 1, 1,
0.6545886, 0.2372898, 2.220921, 0.5882353, 0, 1, 1,
0.6557227, 0.633489, 1.501527, 0.5960785, 0, 1, 1,
0.6620791, -0.5744818, 0.9250412, 0.6039216, 0, 1, 1,
0.666967, -1.611231, 4.282555, 0.6078432, 0, 1, 1,
0.6682069, -0.4445475, 2.628604, 0.6156863, 0, 1, 1,
0.6712848, 0.9592477, 1.494192, 0.6196079, 0, 1, 1,
0.6715006, 0.3081686, 0.1770601, 0.627451, 0, 1, 1,
0.6878377, 0.2126391, 2.772553, 0.6313726, 0, 1, 1,
0.6922764, -0.4392684, 3.125878, 0.6392157, 0, 1, 1,
0.6930764, 0.04178816, 2.890431, 0.6431373, 0, 1, 1,
0.702317, 1.572556, 1.279777, 0.6509804, 0, 1, 1,
0.703783, -1.570725, 2.243961, 0.654902, 0, 1, 1,
0.7106318, 0.2067894, 2.227755, 0.6627451, 0, 1, 1,
0.711812, -0.3024757, 1.992577, 0.6666667, 0, 1, 1,
0.7121757, 1.06417, 1.926954, 0.6745098, 0, 1, 1,
0.7129484, -1.200588, 1.67358, 0.6784314, 0, 1, 1,
0.715354, -0.3910485, 1.511665, 0.6862745, 0, 1, 1,
0.7192267, -0.7702358, 2.527311, 0.6901961, 0, 1, 1,
0.7255238, 0.1373751, 0.4434761, 0.6980392, 0, 1, 1,
0.7270482, 0.4218981, -0.07821585, 0.7058824, 0, 1, 1,
0.7299955, 1.136553, 0.8564041, 0.7098039, 0, 1, 1,
0.7322103, 0.09325398, 0.7657949, 0.7176471, 0, 1, 1,
0.7332603, -0.8094785, 4.544819, 0.7215686, 0, 1, 1,
0.7340237, -1.430566, 2.227016, 0.7294118, 0, 1, 1,
0.7362854, -0.2465056, 2.565029, 0.7333333, 0, 1, 1,
0.7382981, 0.4127325, 1.679266, 0.7411765, 0, 1, 1,
0.7425199, -0.1508976, 0.3520301, 0.7450981, 0, 1, 1,
0.7629731, 0.7218598, 0.2650828, 0.7529412, 0, 1, 1,
0.7631493, 1.197991, 1.171267, 0.7568628, 0, 1, 1,
0.763384, -0.2631635, 2.969799, 0.7647059, 0, 1, 1,
0.7634807, -0.9831944, 2.959492, 0.7686275, 0, 1, 1,
0.768328, -0.09055173, 1.188941, 0.7764706, 0, 1, 1,
0.7792949, 0.2553638, 2.771709, 0.7803922, 0, 1, 1,
0.7816563, -1.28098, 2.443052, 0.7882353, 0, 1, 1,
0.783935, -0.01896656, 0.6612616, 0.7921569, 0, 1, 1,
0.786529, 1.144471, 0.5159252, 0.8, 0, 1, 1,
0.787955, 0.9975318, 1.589927, 0.8078431, 0, 1, 1,
0.7922686, -1.480026, 3.074227, 0.8117647, 0, 1, 1,
0.7957007, 0.6394519, 0.9170633, 0.8196079, 0, 1, 1,
0.7989133, -0.05389538, 0.4285847, 0.8235294, 0, 1, 1,
0.7999761, -1.488496, 4.083434, 0.8313726, 0, 1, 1,
0.8015226, -1.111858, 2.029499, 0.8352941, 0, 1, 1,
0.8015587, -0.9180373, 0.6595386, 0.8431373, 0, 1, 1,
0.8072533, 0.0233275, 2.07988, 0.8470588, 0, 1, 1,
0.807776, -0.03882387, 2.568808, 0.854902, 0, 1, 1,
0.8113389, -0.6188251, 0.7599075, 0.8588235, 0, 1, 1,
0.8144512, 0.8154233, 0.6015872, 0.8666667, 0, 1, 1,
0.8179443, 1.831376, 1.331749, 0.8705882, 0, 1, 1,
0.8207471, -1.151539, 2.658719, 0.8784314, 0, 1, 1,
0.8213788, -0.8614995, 2.928953, 0.8823529, 0, 1, 1,
0.8221655, 0.8025513, 3.003212, 0.8901961, 0, 1, 1,
0.8221982, 1.352423, 0.9855104, 0.8941177, 0, 1, 1,
0.8357449, -0.2557549, 3.864431, 0.9019608, 0, 1, 1,
0.8363274, 0.1675652, 1.906556, 0.9098039, 0, 1, 1,
0.852463, 0.1479973, 1.970311, 0.9137255, 0, 1, 1,
0.853451, -0.9299337, 1.534503, 0.9215686, 0, 1, 1,
0.8611615, -2.123136, 2.707745, 0.9254902, 0, 1, 1,
0.86532, -1.126672, 3.470645, 0.9333333, 0, 1, 1,
0.8725422, -0.06751709, 2.349325, 0.9372549, 0, 1, 1,
0.8734329, -0.1497565, 1.607619, 0.945098, 0, 1, 1,
0.8783201, -0.06320677, 1.881649, 0.9490196, 0, 1, 1,
0.8783521, -0.6059226, 2.013194, 0.9568627, 0, 1, 1,
0.8944783, 2.36084, 1.072252, 0.9607843, 0, 1, 1,
0.8985282, 1.112299, 1.912223, 0.9686275, 0, 1, 1,
0.905314, 0.1487085, 2.366265, 0.972549, 0, 1, 1,
0.9089548, -1.521908, 1.896847, 0.9803922, 0, 1, 1,
0.9164638, 1.20909, -0.2597249, 0.9843137, 0, 1, 1,
0.9188563, 0.2433628, 0.3584439, 0.9921569, 0, 1, 1,
0.9235062, 0.8114374, 1.362428, 0.9960784, 0, 1, 1,
0.9243643, 0.3819719, 0.5917913, 1, 0, 0.9960784, 1,
0.9262226, -2.087784, 2.186075, 1, 0, 0.9882353, 1,
0.9291222, 0.547626, -1.898698, 1, 0, 0.9843137, 1,
0.930703, -0.389746, 0.2774457, 1, 0, 0.9764706, 1,
0.9341551, -1.275168, 3.046749, 1, 0, 0.972549, 1,
0.9350595, 0.1947898, 0.34892, 1, 0, 0.9647059, 1,
0.9355952, 1.545771, 1.016177, 1, 0, 0.9607843, 1,
0.9450878, 0.3853801, 3.149198, 1, 0, 0.9529412, 1,
0.9466989, -0.04825893, 0.1922056, 1, 0, 0.9490196, 1,
0.956948, 1.408952, 0.9912365, 1, 0, 0.9411765, 1,
0.9591719, -0.05727818, 2.526222, 1, 0, 0.9372549, 1,
0.9639837, -0.1753962, 2.556777, 1, 0, 0.9294118, 1,
0.9737419, 1.642569, -1.599641, 1, 0, 0.9254902, 1,
0.9745608, -1.162641, 4.25728, 1, 0, 0.9176471, 1,
0.9754937, -1.485521, 2.439958, 1, 0, 0.9137255, 1,
0.9761805, 1.048537, -0.4990057, 1, 0, 0.9058824, 1,
0.9802361, 0.283696, 2.345823, 1, 0, 0.9019608, 1,
0.9802868, 0.4898211, 0.426016, 1, 0, 0.8941177, 1,
0.9935145, -1.817132, 1.834967, 1, 0, 0.8862745, 1,
0.99493, 0.5556509, -0.8009904, 1, 0, 0.8823529, 1,
0.998463, -3.275162, 0.8566303, 1, 0, 0.8745098, 1,
1.000468, 1.361475, -0.9947336, 1, 0, 0.8705882, 1,
1.001192, -0.5231115, 0.6359522, 1, 0, 0.8627451, 1,
1.004743, -0.7103278, 2.655139, 1, 0, 0.8588235, 1,
1.012236, -0.2719748, 2.556916, 1, 0, 0.8509804, 1,
1.017305, 1.218583, 1.116466, 1, 0, 0.8470588, 1,
1.033717, -2.001015, 2.834939, 1, 0, 0.8392157, 1,
1.043593, -0.8282685, 2.084094, 1, 0, 0.8352941, 1,
1.046293, -0.2686052, 2.78581, 1, 0, 0.827451, 1,
1.050036, -1.940581, 2.670347, 1, 0, 0.8235294, 1,
1.050182, -0.7464797, 4.240782, 1, 0, 0.8156863, 1,
1.054862, -1.082681, 2.447969, 1, 0, 0.8117647, 1,
1.056322, 1.749774, 0.6828107, 1, 0, 0.8039216, 1,
1.056944, 0.3251483, 1.475277, 1, 0, 0.7960784, 1,
1.057455, -0.3847767, 2.131983, 1, 0, 0.7921569, 1,
1.068971, -0.0804537, 3.398021, 1, 0, 0.7843137, 1,
1.072449, 1.356533, 0.09196858, 1, 0, 0.7803922, 1,
1.072551, -0.8646954, 2.344546, 1, 0, 0.772549, 1,
1.09251, -0.4331058, 0.498787, 1, 0, 0.7686275, 1,
1.107063, 0.1533664, 0.7815623, 1, 0, 0.7607843, 1,
1.109824, 0.01833732, 2.601087, 1, 0, 0.7568628, 1,
1.123801, -0.3243537, 2.097438, 1, 0, 0.7490196, 1,
1.129002, 0.1803062, 2.216947, 1, 0, 0.7450981, 1,
1.132756, 0.7533101, 1.567816, 1, 0, 0.7372549, 1,
1.134859, 0.5800254, 1.319229, 1, 0, 0.7333333, 1,
1.135569, 0.9125428, 1.708133, 1, 0, 0.7254902, 1,
1.135628, 0.8262568, 1.46541, 1, 0, 0.7215686, 1,
1.1394, 0.1327733, 1.780928, 1, 0, 0.7137255, 1,
1.142285, -1.368695, 2.135267, 1, 0, 0.7098039, 1,
1.143892, -0.4561605, 0.9630483, 1, 0, 0.7019608, 1,
1.153232, 1.889896, 0.9302436, 1, 0, 0.6941177, 1,
1.155163, 0.9530326, 1.4774, 1, 0, 0.6901961, 1,
1.165352, 0.09489936, 2.607197, 1, 0, 0.682353, 1,
1.166831, -0.2006629, 0.709536, 1, 0, 0.6784314, 1,
1.171847, 0.2038047, -0.7022178, 1, 0, 0.6705883, 1,
1.17265, 1.106006, 2.902569, 1, 0, 0.6666667, 1,
1.176303, -1.085746, 2.309664, 1, 0, 0.6588235, 1,
1.176781, -0.7687641, 2.162048, 1, 0, 0.654902, 1,
1.180113, 1.962014, 0.1849495, 1, 0, 0.6470588, 1,
1.18236, -1.337699, 2.379465, 1, 0, 0.6431373, 1,
1.201717, 1.245535, 0.2315604, 1, 0, 0.6352941, 1,
1.203797, 1.204246, -1.355422, 1, 0, 0.6313726, 1,
1.204506, 1.256511, 1.340193, 1, 0, 0.6235294, 1,
1.21041, 2.00371, 0.3743182, 1, 0, 0.6196079, 1,
1.222408, -0.4691692, 2.45564, 1, 0, 0.6117647, 1,
1.23118, 0.7280408, 1.192814, 1, 0, 0.6078432, 1,
1.246371, 1.758762, 0.8955033, 1, 0, 0.6, 1,
1.27432, 0.06984001, 1.065123, 1, 0, 0.5921569, 1,
1.278884, 0.2454776, 2.632209, 1, 0, 0.5882353, 1,
1.287312, 0.01527305, 0.3703764, 1, 0, 0.5803922, 1,
1.287485, 0.05590674, -0.2512325, 1, 0, 0.5764706, 1,
1.288632, 0.8738858, 1.9453, 1, 0, 0.5686275, 1,
1.293031, 1.250229, 0.1659652, 1, 0, 0.5647059, 1,
1.294984, -0.5505261, 2.41065, 1, 0, 0.5568628, 1,
1.295553, 0.006000573, 1.068193, 1, 0, 0.5529412, 1,
1.302526, 1.297502, 0.6215295, 1, 0, 0.5450981, 1,
1.30497, 1.419148, 1.649675, 1, 0, 0.5411765, 1,
1.308505, 1.456455, 1.127584, 1, 0, 0.5333334, 1,
1.327355, -0.2074175, 2.413837, 1, 0, 0.5294118, 1,
1.337559, -0.4611605, 1.767044, 1, 0, 0.5215687, 1,
1.339411, -0.08555862, 2.696038, 1, 0, 0.5176471, 1,
1.344969, -0.6912296, 0.3220931, 1, 0, 0.509804, 1,
1.351062, -1.467625, 2.444426, 1, 0, 0.5058824, 1,
1.357212, 2.13214, 0.1639718, 1, 0, 0.4980392, 1,
1.382753, 0.01558501, 0.3737402, 1, 0, 0.4901961, 1,
1.391006, 0.3190746, 1.43538, 1, 0, 0.4862745, 1,
1.394517, 0.7108745, 2.419842, 1, 0, 0.4784314, 1,
1.412781, 0.07278465, 0.9234248, 1, 0, 0.4745098, 1,
1.421342, -1.65844, 1.474099, 1, 0, 0.4666667, 1,
1.430256, -0.6903731, 0.2610318, 1, 0, 0.4627451, 1,
1.437933, 0.1556118, 2.259066, 1, 0, 0.454902, 1,
1.441694, 0.5343807, 2.096527, 1, 0, 0.4509804, 1,
1.444535, -2.292763, 1.301959, 1, 0, 0.4431373, 1,
1.446356, 0.562512, -0.7266685, 1, 0, 0.4392157, 1,
1.459543, 0.3058649, 0.8413869, 1, 0, 0.4313726, 1,
1.460462, -0.6457976, 4.306947, 1, 0, 0.427451, 1,
1.480842, -0.04937035, 0.1643618, 1, 0, 0.4196078, 1,
1.482368, -1.019592, 2.507403, 1, 0, 0.4156863, 1,
1.50736, -0.5602295, 1.778223, 1, 0, 0.4078431, 1,
1.522453, -0.03190989, 0.8853139, 1, 0, 0.4039216, 1,
1.535571, -0.6077834, 2.564416, 1, 0, 0.3960784, 1,
1.541872, -1.364192, 2.364195, 1, 0, 0.3882353, 1,
1.543244, -0.5143754, 1.831317, 1, 0, 0.3843137, 1,
1.547299, 2.471954, 0.2915088, 1, 0, 0.3764706, 1,
1.557506, 0.5372518, 2.494043, 1, 0, 0.372549, 1,
1.557934, -1.268996, 1.453639, 1, 0, 0.3647059, 1,
1.558718, -0.2110177, 1.990439, 1, 0, 0.3607843, 1,
1.560163, -1.333128, 4.177732, 1, 0, 0.3529412, 1,
1.560543, -0.979871, 3.699325, 1, 0, 0.3490196, 1,
1.564565, 0.5807654, 2.073327, 1, 0, 0.3411765, 1,
1.567137, -0.1482884, 2.065851, 1, 0, 0.3372549, 1,
1.574122, 0.3322303, 1.122824, 1, 0, 0.3294118, 1,
1.595392, 0.8169211, 3.286586, 1, 0, 0.3254902, 1,
1.611908, -1.096477, 1.946333, 1, 0, 0.3176471, 1,
1.647717, 0.3270019, 2.080486, 1, 0, 0.3137255, 1,
1.655315, -1.166339, 2.1547, 1, 0, 0.3058824, 1,
1.670235, 0.5429165, -0.4909673, 1, 0, 0.2980392, 1,
1.680432, -0.3026397, 2.243016, 1, 0, 0.2941177, 1,
1.705951, -0.2952845, 2.375867, 1, 0, 0.2862745, 1,
1.740443, -0.1348567, -0.2172745, 1, 0, 0.282353, 1,
1.741952, 0.9360209, 0.8283803, 1, 0, 0.2745098, 1,
1.742381, 1.285022, 0.5204106, 1, 0, 0.2705882, 1,
1.746722, 0.3346456, 1.23699, 1, 0, 0.2627451, 1,
1.750407, 0.4396934, 1.371459, 1, 0, 0.2588235, 1,
1.76133, -0.3420459, 0.7135589, 1, 0, 0.2509804, 1,
1.770813, -0.3037016, 2.191914, 1, 0, 0.2470588, 1,
1.792671, -0.2042211, -0.6430871, 1, 0, 0.2392157, 1,
1.796986, -1.498343, 3.31941, 1, 0, 0.2352941, 1,
1.801703, 0.6397312, 2.443341, 1, 0, 0.227451, 1,
1.823799, -0.9399225, 0.7383864, 1, 0, 0.2235294, 1,
1.826088, -1.687689, 0.8761699, 1, 0, 0.2156863, 1,
1.854672, -0.03771656, 1.689589, 1, 0, 0.2117647, 1,
1.858148, -0.8313183, 0.3769151, 1, 0, 0.2039216, 1,
1.8582, 2.836423, 2.018435, 1, 0, 0.1960784, 1,
1.861243, 0.5304477, 1.105408, 1, 0, 0.1921569, 1,
1.876953, -0.05077793, 1.876041, 1, 0, 0.1843137, 1,
1.940264, 0.1628644, 1.426646, 1, 0, 0.1803922, 1,
1.949397, 1.310816, -0.3536775, 1, 0, 0.172549, 1,
2.030457, 0.37325, 2.15303, 1, 0, 0.1686275, 1,
2.052436, -0.2678985, 2.317856, 1, 0, 0.1607843, 1,
2.085636, 0.8593369, 3.265479, 1, 0, 0.1568628, 1,
2.095964, -0.3256517, 0.6076598, 1, 0, 0.1490196, 1,
2.102665, 0.1413219, 2.618941, 1, 0, 0.145098, 1,
2.181545, -0.179309, 2.902565, 1, 0, 0.1372549, 1,
2.189483, -0.6666569, 2.625744, 1, 0, 0.1333333, 1,
2.196375, 0.1813603, 0.9725931, 1, 0, 0.1254902, 1,
2.199839, -2.677387, 2.133436, 1, 0, 0.1215686, 1,
2.24498, -0.8250687, 1.988841, 1, 0, 0.1137255, 1,
2.26069, 0.2188604, 2.41649, 1, 0, 0.1098039, 1,
2.265566, -1.048881, 0.6033925, 1, 0, 0.1019608, 1,
2.26798, 0.0231503, 1.298019, 1, 0, 0.09411765, 1,
2.304281, 0.1775022, 2.065682, 1, 0, 0.09019608, 1,
2.364801, 0.01242881, 2.644894, 1, 0, 0.08235294, 1,
2.37005, 0.6811433, 0.6282694, 1, 0, 0.07843138, 1,
2.395906, 1.05094, 1.977702, 1, 0, 0.07058824, 1,
2.441385, 1.455152, 0.7655778, 1, 0, 0.06666667, 1,
2.515148, -0.2314233, 2.302853, 1, 0, 0.05882353, 1,
2.518244, 0.663193, -2.0816, 1, 0, 0.05490196, 1,
2.564476, 0.04609035, -0.3288013, 1, 0, 0.04705882, 1,
2.59534, -1.340342, 2.416402, 1, 0, 0.04313726, 1,
2.635947, 0.5992274, 1.050337, 1, 0, 0.03529412, 1,
2.729918, -0.4557106, 1.745872, 1, 0, 0.03137255, 1,
2.80368, 0.04813868, 1.765136, 1, 0, 0.02352941, 1,
2.902443, 0.1668154, 1.80732, 1, 0, 0.01960784, 1,
2.909352, 0.8143914, 3.492333, 1, 0, 0.01176471, 1,
2.911381, -0.03616259, 2.434276, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.003407598, -4.45994, -7.163086, 0, -0.5, 0.5, 0.5,
-0.003407598, -4.45994, -7.163086, 1, -0.5, 0.5, 0.5,
-0.003407598, -4.45994, -7.163086, 1, 1.5, 0.5, 0.5,
-0.003407598, -4.45994, -7.163086, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.90631, -0.09044993, -7.163086, 0, -0.5, 0.5, 0.5,
-3.90631, -0.09044993, -7.163086, 1, -0.5, 0.5, 0.5,
-3.90631, -0.09044993, -7.163086, 1, 1.5, 0.5, 0.5,
-3.90631, -0.09044993, -7.163086, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.90631, -4.45994, 0.04757619, 0, -0.5, 0.5, 0.5,
-3.90631, -4.45994, 0.04757619, 1, -0.5, 0.5, 0.5,
-3.90631, -4.45994, 0.04757619, 1, 1.5, 0.5, 0.5,
-3.90631, -4.45994, 0.04757619, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.451596, -5.499087,
2, -3.451596, -5.499087,
-2, -3.451596, -5.499087,
-2, -3.619653, -5.776421,
-1, -3.451596, -5.499087,
-1, -3.619653, -5.776421,
0, -3.451596, -5.499087,
0, -3.619653, -5.776421,
1, -3.451596, -5.499087,
1, -3.619653, -5.776421,
2, -3.451596, -5.499087,
2, -3.619653, -5.776421
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.955768, -6.331087, 0, -0.5, 0.5, 0.5,
-2, -3.955768, -6.331087, 1, -0.5, 0.5, 0.5,
-2, -3.955768, -6.331087, 1, 1.5, 0.5, 0.5,
-2, -3.955768, -6.331087, 0, 1.5, 0.5, 0.5,
-1, -3.955768, -6.331087, 0, -0.5, 0.5, 0.5,
-1, -3.955768, -6.331087, 1, -0.5, 0.5, 0.5,
-1, -3.955768, -6.331087, 1, 1.5, 0.5, 0.5,
-1, -3.955768, -6.331087, 0, 1.5, 0.5, 0.5,
0, -3.955768, -6.331087, 0, -0.5, 0.5, 0.5,
0, -3.955768, -6.331087, 1, -0.5, 0.5, 0.5,
0, -3.955768, -6.331087, 1, 1.5, 0.5, 0.5,
0, -3.955768, -6.331087, 0, 1.5, 0.5, 0.5,
1, -3.955768, -6.331087, 0, -0.5, 0.5, 0.5,
1, -3.955768, -6.331087, 1, -0.5, 0.5, 0.5,
1, -3.955768, -6.331087, 1, 1.5, 0.5, 0.5,
1, -3.955768, -6.331087, 0, 1.5, 0.5, 0.5,
2, -3.955768, -6.331087, 0, -0.5, 0.5, 0.5,
2, -3.955768, -6.331087, 1, -0.5, 0.5, 0.5,
2, -3.955768, -6.331087, 1, 1.5, 0.5, 0.5,
2, -3.955768, -6.331087, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.00564, -3, -5.499087,
-3.00564, 3, -5.499087,
-3.00564, -3, -5.499087,
-3.155752, -3, -5.776421,
-3.00564, -2, -5.499087,
-3.155752, -2, -5.776421,
-3.00564, -1, -5.499087,
-3.155752, -1, -5.776421,
-3.00564, 0, -5.499087,
-3.155752, 0, -5.776421,
-3.00564, 1, -5.499087,
-3.155752, 1, -5.776421,
-3.00564, 2, -5.499087,
-3.155752, 2, -5.776421,
-3.00564, 3, -5.499087,
-3.155752, 3, -5.776421
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.455975, -3, -6.331087, 0, -0.5, 0.5, 0.5,
-3.455975, -3, -6.331087, 1, -0.5, 0.5, 0.5,
-3.455975, -3, -6.331087, 1, 1.5, 0.5, 0.5,
-3.455975, -3, -6.331087, 0, 1.5, 0.5, 0.5,
-3.455975, -2, -6.331087, 0, -0.5, 0.5, 0.5,
-3.455975, -2, -6.331087, 1, -0.5, 0.5, 0.5,
-3.455975, -2, -6.331087, 1, 1.5, 0.5, 0.5,
-3.455975, -2, -6.331087, 0, 1.5, 0.5, 0.5,
-3.455975, -1, -6.331087, 0, -0.5, 0.5, 0.5,
-3.455975, -1, -6.331087, 1, -0.5, 0.5, 0.5,
-3.455975, -1, -6.331087, 1, 1.5, 0.5, 0.5,
-3.455975, -1, -6.331087, 0, 1.5, 0.5, 0.5,
-3.455975, 0, -6.331087, 0, -0.5, 0.5, 0.5,
-3.455975, 0, -6.331087, 1, -0.5, 0.5, 0.5,
-3.455975, 0, -6.331087, 1, 1.5, 0.5, 0.5,
-3.455975, 0, -6.331087, 0, 1.5, 0.5, 0.5,
-3.455975, 1, -6.331087, 0, -0.5, 0.5, 0.5,
-3.455975, 1, -6.331087, 1, -0.5, 0.5, 0.5,
-3.455975, 1, -6.331087, 1, 1.5, 0.5, 0.5,
-3.455975, 1, -6.331087, 0, 1.5, 0.5, 0.5,
-3.455975, 2, -6.331087, 0, -0.5, 0.5, 0.5,
-3.455975, 2, -6.331087, 1, -0.5, 0.5, 0.5,
-3.455975, 2, -6.331087, 1, 1.5, 0.5, 0.5,
-3.455975, 2, -6.331087, 0, 1.5, 0.5, 0.5,
-3.455975, 3, -6.331087, 0, -0.5, 0.5, 0.5,
-3.455975, 3, -6.331087, 1, -0.5, 0.5, 0.5,
-3.455975, 3, -6.331087, 1, 1.5, 0.5, 0.5,
-3.455975, 3, -6.331087, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.00564, -3.451596, -4,
-3.00564, -3.451596, 4,
-3.00564, -3.451596, -4,
-3.155752, -3.619653, -4,
-3.00564, -3.451596, -2,
-3.155752, -3.619653, -2,
-3.00564, -3.451596, 0,
-3.155752, -3.619653, 0,
-3.00564, -3.451596, 2,
-3.155752, -3.619653, 2,
-3.00564, -3.451596, 4,
-3.155752, -3.619653, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.455975, -3.955768, -4, 0, -0.5, 0.5, 0.5,
-3.455975, -3.955768, -4, 1, -0.5, 0.5, 0.5,
-3.455975, -3.955768, -4, 1, 1.5, 0.5, 0.5,
-3.455975, -3.955768, -4, 0, 1.5, 0.5, 0.5,
-3.455975, -3.955768, -2, 0, -0.5, 0.5, 0.5,
-3.455975, -3.955768, -2, 1, -0.5, 0.5, 0.5,
-3.455975, -3.955768, -2, 1, 1.5, 0.5, 0.5,
-3.455975, -3.955768, -2, 0, 1.5, 0.5, 0.5,
-3.455975, -3.955768, 0, 0, -0.5, 0.5, 0.5,
-3.455975, -3.955768, 0, 1, -0.5, 0.5, 0.5,
-3.455975, -3.955768, 0, 1, 1.5, 0.5, 0.5,
-3.455975, -3.955768, 0, 0, 1.5, 0.5, 0.5,
-3.455975, -3.955768, 2, 0, -0.5, 0.5, 0.5,
-3.455975, -3.955768, 2, 1, -0.5, 0.5, 0.5,
-3.455975, -3.955768, 2, 1, 1.5, 0.5, 0.5,
-3.455975, -3.955768, 2, 0, 1.5, 0.5, 0.5,
-3.455975, -3.955768, 4, 0, -0.5, 0.5, 0.5,
-3.455975, -3.955768, 4, 1, -0.5, 0.5, 0.5,
-3.455975, -3.955768, 4, 1, 1.5, 0.5, 0.5,
-3.455975, -3.955768, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.00564, -3.451596, -5.499087,
-3.00564, 3.270696, -5.499087,
-3.00564, -3.451596, 5.59424,
-3.00564, 3.270696, 5.59424,
-3.00564, -3.451596, -5.499087,
-3.00564, -3.451596, 5.59424,
-3.00564, 3.270696, -5.499087,
-3.00564, 3.270696, 5.59424,
-3.00564, -3.451596, -5.499087,
2.998825, -3.451596, -5.499087,
-3.00564, -3.451596, 5.59424,
2.998825, -3.451596, 5.59424,
-3.00564, 3.270696, -5.499087,
2.998825, 3.270696, -5.499087,
-3.00564, 3.270696, 5.59424,
2.998825, 3.270696, 5.59424,
2.998825, -3.451596, -5.499087,
2.998825, 3.270696, -5.499087,
2.998825, -3.451596, 5.59424,
2.998825, 3.270696, 5.59424,
2.998825, -3.451596, -5.499087,
2.998825, -3.451596, 5.59424,
2.998825, 3.270696, -5.499087,
2.998825, 3.270696, 5.59424
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.632462;
var distance = 33.95768;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.003407598, 0.09044993, -0.04757619 );
mvMatrix.scale( 1.374372, 1.227612, 0.7439038 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.95768);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Paclobutrazol<-read.table("Paclobutrazol.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Paclobutrazol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Paclobutrazol' not found
```

```r
y<-Paclobutrazol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Paclobutrazol' not found
```

```r
z<-Paclobutrazol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Paclobutrazol' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.918197, -1.576503, -0.9131641, 0, 0, 1, 1, 1,
-2.693844, 0.9670886, -0.9142246, 1, 0, 0, 1, 1,
-2.685134, 2.758036, 0.330544, 1, 0, 0, 1, 1,
-2.660533, 0.7050327, -1.324871, 1, 0, 0, 1, 1,
-2.648521, 0.5003242, -2.105701, 1, 0, 0, 1, 1,
-2.515585, 0.8390228, -2.077965, 1, 0, 0, 1, 1,
-2.510951, -0.04345541, -1.70482, 0, 0, 0, 1, 1,
-2.46197, 0.5969826, -1.031523, 0, 0, 0, 1, 1,
-2.43908, -0.4542229, -1.388376, 0, 0, 0, 1, 1,
-2.371629, 1.213565, 0.5850692, 0, 0, 0, 1, 1,
-2.370305, -1.332222, -2.058695, 0, 0, 0, 1, 1,
-2.31669, -1.144571, -1.45319, 0, 0, 0, 1, 1,
-2.272608, -0.5192112, -2.590694, 0, 0, 0, 1, 1,
-2.242, -2.064204, -2.032067, 1, 1, 1, 1, 1,
-2.214948, -0.1346016, -1.137603, 1, 1, 1, 1, 1,
-2.149689, -0.5680521, -1.992131, 1, 1, 1, 1, 1,
-2.144166, -0.0784817, 0.1269974, 1, 1, 1, 1, 1,
-2.135403, 1.577157, -2.748326, 1, 1, 1, 1, 1,
-2.128131, -1.587884, -1.294404, 1, 1, 1, 1, 1,
-2.121711, -0.2326145, -0.8335858, 1, 1, 1, 1, 1,
-2.092809, -0.7828118, -2.080132, 1, 1, 1, 1, 1,
-2.064825, 0.1731569, -0.717418, 1, 1, 1, 1, 1,
-2.062908, 2.134014, -1.270091, 1, 1, 1, 1, 1,
-2.056185, 0.4523677, -0.5773035, 1, 1, 1, 1, 1,
-2.053207, 0.08213504, -1.675848, 1, 1, 1, 1, 1,
-2.028183, 0.7549068, -1.738848, 1, 1, 1, 1, 1,
-2.017613, -0.1391662, -1.80345, 1, 1, 1, 1, 1,
-2.013531, 1.442683, -1.679259, 1, 1, 1, 1, 1,
-1.986304, 0.1359808, -3.155475, 0, 0, 1, 1, 1,
-1.977961, 0.7642695, -1.352425, 1, 0, 0, 1, 1,
-1.898284, 1.110853, 0.2934807, 1, 0, 0, 1, 1,
-1.895748, -1.129119, -0.9944417, 1, 0, 0, 1, 1,
-1.876589, 0.2572154, -1.396326, 1, 0, 0, 1, 1,
-1.864197, -1.610565, -1.383568, 1, 0, 0, 1, 1,
-1.858506, -2.094857, -4.107465, 0, 0, 0, 1, 1,
-1.812276, -0.7019024, -4.955592, 0, 0, 0, 1, 1,
-1.806526, -0.3221385, -2.690106, 0, 0, 0, 1, 1,
-1.804265, 0.2094107, -0.1885881, 0, 0, 0, 1, 1,
-1.791504, -0.8075584, -2.621821, 0, 0, 0, 1, 1,
-1.789488, 1.484868, -0.5204546, 0, 0, 0, 1, 1,
-1.774651, 0.6617947, -1.847804, 0, 0, 0, 1, 1,
-1.764612, 0.1335658, -2.507404, 1, 1, 1, 1, 1,
-1.757802, 1.509552, -0.4270703, 1, 1, 1, 1, 1,
-1.750047, 0.3688784, -2.142304, 1, 1, 1, 1, 1,
-1.743699, -0.194989, -0.6174629, 1, 1, 1, 1, 1,
-1.73191, 0.8126916, -0.3896679, 1, 1, 1, 1, 1,
-1.723462, 1.050703, -2.589438, 1, 1, 1, 1, 1,
-1.722761, 1.203265, 0.1897202, 1, 1, 1, 1, 1,
-1.720594, 0.5964961, 0.6902372, 1, 1, 1, 1, 1,
-1.710175, 0.2722042, -0.2282424, 1, 1, 1, 1, 1,
-1.707613, -2.491179, -3.088864, 1, 1, 1, 1, 1,
-1.705493, 0.7038586, 0.1542127, 1, 1, 1, 1, 1,
-1.703905, 1.828356, -0.2029478, 1, 1, 1, 1, 1,
-1.699435, -1.215763, -1.906332, 1, 1, 1, 1, 1,
-1.679113, -0.1254047, 0.8000544, 1, 1, 1, 1, 1,
-1.677553, -0.3731298, -1.102913, 1, 1, 1, 1, 1,
-1.62923, 0.8395414, -4.386752, 0, 0, 1, 1, 1,
-1.618146, 0.2270273, -2.574533, 1, 0, 0, 1, 1,
-1.604586, 0.8721158, -0.1082542, 1, 0, 0, 1, 1,
-1.602012, -1.00172, -0.4803507, 1, 0, 0, 1, 1,
-1.591361, 0.3890778, -0.583394, 1, 0, 0, 1, 1,
-1.574706, 0.5497628, -1.737236, 1, 0, 0, 1, 1,
-1.574438, 0.5474705, -0.9901789, 0, 0, 0, 1, 1,
-1.568552, -0.8583716, -2.58088, 0, 0, 0, 1, 1,
-1.564026, 0.3392402, -1.184012, 0, 0, 0, 1, 1,
-1.559721, 1.28991, -0.1945421, 0, 0, 0, 1, 1,
-1.557799, -0.5380458, -0.4606542, 0, 0, 0, 1, 1,
-1.543579, 0.2745047, -0.1174252, 0, 0, 0, 1, 1,
-1.542854, 2.208377, -1.526621, 0, 0, 0, 1, 1,
-1.5398, -0.9785073, -0.6791846, 1, 1, 1, 1, 1,
-1.535539, -1.100336, -1.375789, 1, 1, 1, 1, 1,
-1.528581, 0.8758975, -1.335535, 1, 1, 1, 1, 1,
-1.516629, 0.02831508, -1.840333, 1, 1, 1, 1, 1,
-1.504703, 1.586236, -0.552598, 1, 1, 1, 1, 1,
-1.503343, 1.083126, -0.370538, 1, 1, 1, 1, 1,
-1.500702, 2.15776, 0.1785744, 1, 1, 1, 1, 1,
-1.483173, -0.1669189, -3.764364, 1, 1, 1, 1, 1,
-1.46035, 1.310176, -0.1591837, 1, 1, 1, 1, 1,
-1.451851, -0.6515622, -0.5755515, 1, 1, 1, 1, 1,
-1.437281, -0.4999094, -2.453108, 1, 1, 1, 1, 1,
-1.43492, 0.06831774, -2.287466, 1, 1, 1, 1, 1,
-1.431234, -1.038218, -2.677986, 1, 1, 1, 1, 1,
-1.431067, -1.103341, -0.5843779, 1, 1, 1, 1, 1,
-1.430947, -0.6839995, -2.289789, 1, 1, 1, 1, 1,
-1.429726, -1.133414, -1.561136, 0, 0, 1, 1, 1,
-1.411641, -1.234277, -3.28841, 1, 0, 0, 1, 1,
-1.410816, 0.6727486, -2.586917, 1, 0, 0, 1, 1,
-1.40736, -0.5162978, -0.933643, 1, 0, 0, 1, 1,
-1.394814, -1.911692, -2.160155, 1, 0, 0, 1, 1,
-1.387668, 0.8372449, -1.536543, 1, 0, 0, 1, 1,
-1.376189, 1.209314, -1.472877, 0, 0, 0, 1, 1,
-1.362128, 1.614724, -0.1532731, 0, 0, 0, 1, 1,
-1.348216, -0.3854931, -1.840152, 0, 0, 0, 1, 1,
-1.337232, 0.639945, -1.603138, 0, 0, 0, 1, 1,
-1.334948, -0.6127337, -3.641185, 0, 0, 0, 1, 1,
-1.322883, -1.509064, -1.853223, 0, 0, 0, 1, 1,
-1.320844, 2.035921, -1.962764, 0, 0, 0, 1, 1,
-1.307846, -0.2272952, -2.346158, 1, 1, 1, 1, 1,
-1.307534, 0.3931015, 0.4208675, 1, 1, 1, 1, 1,
-1.302623, -1.645412, -1.868724, 1, 1, 1, 1, 1,
-1.288583, 0.9592098, -2.518909, 1, 1, 1, 1, 1,
-1.28835, 0.8255854, -0.3841232, 1, 1, 1, 1, 1,
-1.281094, 2.159075, -1.439999, 1, 1, 1, 1, 1,
-1.280549, 1.420063, -1.930638, 1, 1, 1, 1, 1,
-1.269546, -0.4451405, -0.2819189, 1, 1, 1, 1, 1,
-1.267457, -2.092147, -0.2640026, 1, 1, 1, 1, 1,
-1.264798, -1.480645, -2.692557, 1, 1, 1, 1, 1,
-1.264384, -1.933208, -1.701267, 1, 1, 1, 1, 1,
-1.261798, 1.520259, -0.551406, 1, 1, 1, 1, 1,
-1.261776, -0.9302836, -3.677652, 1, 1, 1, 1, 1,
-1.256581, 1.623272, -0.8929384, 1, 1, 1, 1, 1,
-1.249034, -0.09435877, -1.239625, 1, 1, 1, 1, 1,
-1.248333, -0.4006462, -2.445219, 0, 0, 1, 1, 1,
-1.24742, -1.311416, -3.368754, 1, 0, 0, 1, 1,
-1.242362, -1.694777, -4.370849, 1, 0, 0, 1, 1,
-1.236025, 0.03129921, -2.606083, 1, 0, 0, 1, 1,
-1.23503, 1.269919, -0.9477649, 1, 0, 0, 1, 1,
-1.231763, -0.836299, -2.122724, 1, 0, 0, 1, 1,
-1.221778, -1.344219, -1.755674, 0, 0, 0, 1, 1,
-1.202676, -0.9539023, -3.960075, 0, 0, 0, 1, 1,
-1.201055, 0.2458324, -1.805166, 0, 0, 0, 1, 1,
-1.194936, -1.49606, -1.673424, 0, 0, 0, 1, 1,
-1.192029, 0.6391822, -1.47397, 0, 0, 0, 1, 1,
-1.190829, -0.1602624, -0.899986, 0, 0, 0, 1, 1,
-1.18547, -1.523509, 0.2330549, 0, 0, 0, 1, 1,
-1.172368, -0.07100822, -1.82538, 1, 1, 1, 1, 1,
-1.168433, -0.7176071, -2.190539, 1, 1, 1, 1, 1,
-1.159908, 0.5309383, 0.4452729, 1, 1, 1, 1, 1,
-1.157289, -0.4282874, -2.505114, 1, 1, 1, 1, 1,
-1.153245, -0.08667774, -3.244165, 1, 1, 1, 1, 1,
-1.148467, -0.009823088, -0.8098605, 1, 1, 1, 1, 1,
-1.131634, 0.09056621, -0.2606088, 1, 1, 1, 1, 1,
-1.128782, 0.7393312, -1.171695, 1, 1, 1, 1, 1,
-1.124258, -2.119516, -2.862221, 1, 1, 1, 1, 1,
-1.121211, -1.212355, -2.307822, 1, 1, 1, 1, 1,
-1.121151, 0.4062144, 0.7092828, 1, 1, 1, 1, 1,
-1.120013, 0.6867969, -0.4392164, 1, 1, 1, 1, 1,
-1.119394, 0.9149646, -1.085122, 1, 1, 1, 1, 1,
-1.113424, -0.3329656, -1.76556, 1, 1, 1, 1, 1,
-1.101485, -1.165371, -1.95013, 1, 1, 1, 1, 1,
-1.099855, -0.2617843, -0.8990977, 0, 0, 1, 1, 1,
-1.092101, -1.030374, -0.1184484, 1, 0, 0, 1, 1,
-1.091727, 1.053063, -1.533554, 1, 0, 0, 1, 1,
-1.07487, 0.4206335, -0.4857769, 1, 0, 0, 1, 1,
-1.072817, -1.010313, -2.574721, 1, 0, 0, 1, 1,
-1.065908, -0.02598977, -0.5220613, 1, 0, 0, 1, 1,
-1.065727, -0.9218974, -3.083758, 0, 0, 0, 1, 1,
-1.065495, 0.6025687, 0.6657444, 0, 0, 0, 1, 1,
-1.056757, 0.7193164, 0.1001414, 0, 0, 0, 1, 1,
-1.054478, -0.7480362, -1.936141, 0, 0, 0, 1, 1,
-1.051043, -1.391681, -2.856298, 0, 0, 0, 1, 1,
-1.037477, -0.2122552, -1.936338, 0, 0, 0, 1, 1,
-1.033729, 1.345949, -0.3196796, 0, 0, 0, 1, 1,
-1.031521, -1.422384, -2.040545, 1, 1, 1, 1, 1,
-1.020445, 0.04880584, 1.420832, 1, 1, 1, 1, 1,
-1.016343, 1.18675, -0.7570087, 1, 1, 1, 1, 1,
-1.002059, 1.390951, -3.426257, 1, 1, 1, 1, 1,
-0.9934088, 0.6833341, -1.033571, 1, 1, 1, 1, 1,
-0.9917089, -0.07144747, -0.5523276, 1, 1, 1, 1, 1,
-0.9881861, 2.53197, -0.05700268, 1, 1, 1, 1, 1,
-0.9859226, 0.845113, -2.222627, 1, 1, 1, 1, 1,
-0.985346, 1.453086, -0.8816897, 1, 1, 1, 1, 1,
-0.9848865, 1.249025, 1.121041, 1, 1, 1, 1, 1,
-0.9763476, -0.1661886, -0.1586524, 1, 1, 1, 1, 1,
-0.971122, 1.226046, -0.008212627, 1, 1, 1, 1, 1,
-0.9688521, 0.5894918, -2.702133, 1, 1, 1, 1, 1,
-0.9591523, -0.1639155, -1.695243, 1, 1, 1, 1, 1,
-0.9579961, -0.1063628, 1.007488, 1, 1, 1, 1, 1,
-0.9477664, -0.360841, -0.9716491, 0, 0, 1, 1, 1,
-0.9462331, -0.3149751, -3.679737, 1, 0, 0, 1, 1,
-0.9446115, 1.237229, -1.238488, 1, 0, 0, 1, 1,
-0.9440498, 1.118103, -1.345649, 1, 0, 0, 1, 1,
-0.9430088, 0.6651679, -0.0662178, 1, 0, 0, 1, 1,
-0.9372669, -1.330379, -3.701463, 1, 0, 0, 1, 1,
-0.9323238, -0.9591599, -4.129133, 0, 0, 0, 1, 1,
-0.932277, 0.3265724, -0.6860496, 0, 0, 0, 1, 1,
-0.9311945, -0.6182414, -1.981334, 0, 0, 0, 1, 1,
-0.9258924, -0.8001759, -4.005611, 0, 0, 0, 1, 1,
-0.9195256, -0.4908002, -1.66822, 0, 0, 0, 1, 1,
-0.9175216, 1.008151, 0.4686055, 0, 0, 0, 1, 1,
-0.9105036, -0.1613385, -3.712643, 0, 0, 0, 1, 1,
-0.9068912, 0.7559183, -1.827802, 1, 1, 1, 1, 1,
-0.9056261, -0.5106915, -2.612181, 1, 1, 1, 1, 1,
-0.9030851, -1.099893, -1.333215, 1, 1, 1, 1, 1,
-0.9021801, -0.0800113, -1.289483, 1, 1, 1, 1, 1,
-0.8942356, 0.5771403, -1.030254, 1, 1, 1, 1, 1,
-0.891795, 0.4828031, -2.30437, 1, 1, 1, 1, 1,
-0.8907232, 2.117536, 1.657823, 1, 1, 1, 1, 1,
-0.8900657, -0.0575382, -0.8189332, 1, 1, 1, 1, 1,
-0.8878248, 1.05059, -0.2728714, 1, 1, 1, 1, 1,
-0.8784393, -0.4360774, -3.057209, 1, 1, 1, 1, 1,
-0.8782623, 0.9300762, -0.6206957, 1, 1, 1, 1, 1,
-0.8744763, -0.9093608, -2.427805, 1, 1, 1, 1, 1,
-0.8740522, 0.8378906, -0.9245965, 1, 1, 1, 1, 1,
-0.8702149, -0.1283656, -1.483491, 1, 1, 1, 1, 1,
-0.8694888, 0.6317307, 0.4604061, 1, 1, 1, 1, 1,
-0.8691201, 0.06746143, -1.440027, 0, 0, 1, 1, 1,
-0.8582599, -0.578799, -0.6326277, 1, 0, 0, 1, 1,
-0.8566599, 0.1628509, -2.368853, 1, 0, 0, 1, 1,
-0.8556356, 0.2863332, -0.6849019, 1, 0, 0, 1, 1,
-0.8539026, -2.160791, -2.927543, 1, 0, 0, 1, 1,
-0.8484904, -1.332452, -2.593924, 1, 0, 0, 1, 1,
-0.8472947, 0.6038623, -1.014191, 0, 0, 0, 1, 1,
-0.8445854, -1.187443, 0.4074939, 0, 0, 0, 1, 1,
-0.8431657, 0.7780443, -0.03833234, 0, 0, 0, 1, 1,
-0.8421088, -0.5399476, -2.637053, 0, 0, 0, 1, 1,
-0.8375615, -3.353698, -2.273925, 0, 0, 0, 1, 1,
-0.8360657, -0.04470369, -0.7255446, 0, 0, 0, 1, 1,
-0.8326182, -0.02864016, 0.0503596, 0, 0, 0, 1, 1,
-0.8323193, -0.2282804, -3.033263, 1, 1, 1, 1, 1,
-0.8227414, 0.8711453, -0.48058, 1, 1, 1, 1, 1,
-0.8203067, -0.7619296, -3.405116, 1, 1, 1, 1, 1,
-0.8174083, -0.2957245, -1.208313, 1, 1, 1, 1, 1,
-0.8159512, 0.3995318, -2.011176, 1, 1, 1, 1, 1,
-0.8105712, -0.8048009, -3.525292, 1, 1, 1, 1, 1,
-0.8073931, -1.510109, -2.604165, 1, 1, 1, 1, 1,
-0.7947134, -1.133685, -1.563567, 1, 1, 1, 1, 1,
-0.7946939, 0.3092131, -0.6419549, 1, 1, 1, 1, 1,
-0.7940015, 1.468439, -0.606284, 1, 1, 1, 1, 1,
-0.791523, -0.6305982, -3.927357, 1, 1, 1, 1, 1,
-0.7858854, -1.66303, -3.883312, 1, 1, 1, 1, 1,
-0.7794885, 0.09620564, -1.271681, 1, 1, 1, 1, 1,
-0.7764584, 1.030304, -1.933619, 1, 1, 1, 1, 1,
-0.7752814, 0.2100028, 0.6133997, 1, 1, 1, 1, 1,
-0.7717199, 0.7898283, -2.773883, 0, 0, 1, 1, 1,
-0.7680996, -0.3512861, -1.612498, 1, 0, 0, 1, 1,
-0.7650791, -0.4598868, -0.1749681, 1, 0, 0, 1, 1,
-0.76373, 1.03225, -2.307543, 1, 0, 0, 1, 1,
-0.7621593, 1.331503, -1.638505, 1, 0, 0, 1, 1,
-0.7608016, 1.599537, 0.3976157, 1, 0, 0, 1, 1,
-0.7597738, -0.8752902, -2.721516, 0, 0, 0, 1, 1,
-0.758598, -1.458543, -2.873363, 0, 0, 0, 1, 1,
-0.7582051, 0.4071783, 0.05617234, 0, 0, 0, 1, 1,
-0.7580135, -0.1953543, -1.970153, 0, 0, 0, 1, 1,
-0.7561668, -0.3024478, -2.227405, 0, 0, 0, 1, 1,
-0.7530088, -0.9251184, -2.283858, 0, 0, 0, 1, 1,
-0.7523649, 0.1783832, -2.016811, 0, 0, 0, 1, 1,
-0.752361, 0.1519829, -0.6203075, 1, 1, 1, 1, 1,
-0.751065, -1.114629, -2.518951, 1, 1, 1, 1, 1,
-0.7500791, -1.096817, -2.02164, 1, 1, 1, 1, 1,
-0.7490851, 0.4514129, 0.03746568, 1, 1, 1, 1, 1,
-0.7464794, 0.3125246, 0.09298669, 1, 1, 1, 1, 1,
-0.7452908, -0.7258424, -3.004512, 1, 1, 1, 1, 1,
-0.7373521, 0.2781749, -0.8149663, 1, 1, 1, 1, 1,
-0.7363873, 1.415337, 0.1630012, 1, 1, 1, 1, 1,
-0.7344816, -1.299235, -1.571106, 1, 1, 1, 1, 1,
-0.7341765, -0.009997952, -2.047393, 1, 1, 1, 1, 1,
-0.7333076, -0.9623792, -2.03187, 1, 1, 1, 1, 1,
-0.7326934, -0.6059112, -0.8668576, 1, 1, 1, 1, 1,
-0.7309094, -0.1208766, -2.09568, 1, 1, 1, 1, 1,
-0.7308906, -1.345663, -2.531653, 1, 1, 1, 1, 1,
-0.7261613, 0.5741249, -0.02869773, 1, 1, 1, 1, 1,
-0.7208537, 0.6290557, 0.1940424, 0, 0, 1, 1, 1,
-0.714814, -0.6405754, -1.777569, 1, 0, 0, 1, 1,
-0.712226, 1.761681, -0.5504138, 1, 0, 0, 1, 1,
-0.7104104, 0.9773248, -0.2549341, 1, 0, 0, 1, 1,
-0.709048, -1.585271, -2.076894, 1, 0, 0, 1, 1,
-0.7051923, 0.1915452, -0.1216135, 1, 0, 0, 1, 1,
-0.7041121, -0.03349749, -0.6828014, 0, 0, 0, 1, 1,
-0.6979495, 0.2341026, -0.6587824, 0, 0, 0, 1, 1,
-0.6875245, 0.07120373, -1.871102, 0, 0, 0, 1, 1,
-0.6787574, 0.3060734, -2.748313, 0, 0, 0, 1, 1,
-0.6754886, 0.3969864, 0.1277429, 0, 0, 0, 1, 1,
-0.6740684, 1.725485, -0.09690604, 0, 0, 0, 1, 1,
-0.6700636, -0.4744475, -1.231074, 0, 0, 0, 1, 1,
-0.6617858, -0.6097125, -2.481279, 1, 1, 1, 1, 1,
-0.6609278, -0.1493249, -0.9916316, 1, 1, 1, 1, 1,
-0.6581537, 1.114962, -0.934203, 1, 1, 1, 1, 1,
-0.6579407, -0.8624831, -2.870088, 1, 1, 1, 1, 1,
-0.6558595, -0.4620159, -3.099426, 1, 1, 1, 1, 1,
-0.6558542, -0.2475554, -0.1814694, 1, 1, 1, 1, 1,
-0.6489919, -0.5925739, 0.6449577, 1, 1, 1, 1, 1,
-0.6469585, -0.2199218, -0.7869011, 1, 1, 1, 1, 1,
-0.6451035, -0.2150373, -2.514226, 1, 1, 1, 1, 1,
-0.6440575, -0.2808026, -1.414561, 1, 1, 1, 1, 1,
-0.6412877, 0.3248197, -0.5610314, 1, 1, 1, 1, 1,
-0.6360114, 1.200826, -0.5347176, 1, 1, 1, 1, 1,
-0.6313481, -0.5113952, -3.020681, 1, 1, 1, 1, 1,
-0.6307026, -0.8258457, -3.078671, 1, 1, 1, 1, 1,
-0.6280292, 0.9214731, -0.4070702, 1, 1, 1, 1, 1,
-0.6271826, 0.471909, -1.986593, 0, 0, 1, 1, 1,
-0.6267104, -1.248391, -1.224148, 1, 0, 0, 1, 1,
-0.6264389, 0.09196377, -0.7563219, 1, 0, 0, 1, 1,
-0.6257305, -0.5785539, -1.726567, 1, 0, 0, 1, 1,
-0.6195363, -1.370873, -2.930538, 1, 0, 0, 1, 1,
-0.6177111, 2.451203, 0.2638092, 1, 0, 0, 1, 1,
-0.6138729, 0.003549814, -0.08786611, 0, 0, 0, 1, 1,
-0.6134119, 0.1181163, -0.2176746, 0, 0, 0, 1, 1,
-0.6086231, -1.116051, -1.896022, 0, 0, 0, 1, 1,
-0.6016339, -1.567374, -2.286343, 0, 0, 0, 1, 1,
-0.5933934, 1.353053, 0.4971521, 0, 0, 0, 1, 1,
-0.5892137, -1.482009, -3.30953, 0, 0, 0, 1, 1,
-0.5815597, -1.184921, -4.023675, 0, 0, 0, 1, 1,
-0.5806834, -0.2714562, -3.865503, 1, 1, 1, 1, 1,
-0.5785862, 1.067351, -0.4365692, 1, 1, 1, 1, 1,
-0.5744704, 0.6519715, -2.988149, 1, 1, 1, 1, 1,
-0.5717542, -1.2978, -2.89324, 1, 1, 1, 1, 1,
-0.5680076, -0.4123616, -1.139523, 1, 1, 1, 1, 1,
-0.5630621, 0.2567971, -0.2897667, 1, 1, 1, 1, 1,
-0.5620837, -1.079426, -3.087698, 1, 1, 1, 1, 1,
-0.5610995, 0.7801752, -2.685369, 1, 1, 1, 1, 1,
-0.5595006, 0.1307797, -1.963112, 1, 1, 1, 1, 1,
-0.5592949, 2.050963, -0.1391333, 1, 1, 1, 1, 1,
-0.5518479, 0.06567151, -1.876073, 1, 1, 1, 1, 1,
-0.5510065, 0.9067463, 0.0202848, 1, 1, 1, 1, 1,
-0.5493181, 0.07941701, -1.864211, 1, 1, 1, 1, 1,
-0.5492528, -0.6221044, -3.012961, 1, 1, 1, 1, 1,
-0.5479164, -0.6409553, -3.833189, 1, 1, 1, 1, 1,
-0.5437472, -0.7086691, -0.3168028, 0, 0, 1, 1, 1,
-0.5395637, 0.1207966, -2.48737, 1, 0, 0, 1, 1,
-0.5384134, 0.2436742, -0.9848706, 1, 0, 0, 1, 1,
-0.5193169, 0.04552901, -2.165622, 1, 0, 0, 1, 1,
-0.517742, -0.9472021, -2.475725, 1, 0, 0, 1, 1,
-0.5119795, -0.5189745, -1.621166, 1, 0, 0, 1, 1,
-0.5083546, -0.2186645, -1.272463, 0, 0, 0, 1, 1,
-0.5077283, -1.006672, -1.74027, 0, 0, 0, 1, 1,
-0.5040368, -1.381298, -3.513537, 0, 0, 0, 1, 1,
-0.4997433, 1.526399, -1.201754, 0, 0, 0, 1, 1,
-0.4997226, 0.8597292, 2.019378, 0, 0, 0, 1, 1,
-0.4955169, 0.150203, -1.528404, 0, 0, 0, 1, 1,
-0.4937256, -0.5280461, -1.125235, 0, 0, 0, 1, 1,
-0.4908341, 1.858292, 0.2404144, 1, 1, 1, 1, 1,
-0.4874356, 1.257478, -1.24512, 1, 1, 1, 1, 1,
-0.4873581, 0.6594114, -0.2230516, 1, 1, 1, 1, 1,
-0.4873502, -1.274247, -2.583445, 1, 1, 1, 1, 1,
-0.4869795, 0.5998724, -2.080328, 1, 1, 1, 1, 1,
-0.4837008, 0.5870928, -0.2960872, 1, 1, 1, 1, 1,
-0.479939, -0.5442641, -3.355786, 1, 1, 1, 1, 1,
-0.4787574, 0.4229278, -1.454168, 1, 1, 1, 1, 1,
-0.4759239, 0.5505493, -0.5570453, 1, 1, 1, 1, 1,
-0.4758846, -1.255722, -2.679216, 1, 1, 1, 1, 1,
-0.4727669, 0.5455125, -1.128222, 1, 1, 1, 1, 1,
-0.4677035, -1.762293, -3.033702, 1, 1, 1, 1, 1,
-0.4674597, 1.959388, -0.4506547, 1, 1, 1, 1, 1,
-0.4666237, 0.3674397, -0.9465788, 1, 1, 1, 1, 1,
-0.4650886, 0.4544755, -0.8798494, 1, 1, 1, 1, 1,
-0.4643999, -0.861945, -3.915984, 0, 0, 1, 1, 1,
-0.4630565, 1.06943, -0.06571495, 1, 0, 0, 1, 1,
-0.4587262, -0.6652068, -2.55821, 1, 0, 0, 1, 1,
-0.4579374, -1.287648, -2.526642, 1, 0, 0, 1, 1,
-0.4571715, 0.4085942, -1.016493, 1, 0, 0, 1, 1,
-0.4558099, 0.6690384, -0.8565346, 1, 0, 0, 1, 1,
-0.4549464, 0.7150184, -1.029739, 0, 0, 0, 1, 1,
-0.4546465, -0.317471, -2.75194, 0, 0, 0, 1, 1,
-0.4543036, -1.428403, -3.908248, 0, 0, 0, 1, 1,
-0.4535249, 0.4773299, 0.5932799, 0, 0, 0, 1, 1,
-0.4520604, -0.6065302, -2.539598, 0, 0, 0, 1, 1,
-0.4441348, -0.1619135, -2.414477, 0, 0, 0, 1, 1,
-0.4365532, -0.6282379, -3.056211, 0, 0, 0, 1, 1,
-0.4342828, 0.8604764, 0.6951215, 1, 1, 1, 1, 1,
-0.4299444, -2.210344, -2.796583, 1, 1, 1, 1, 1,
-0.4274175, 0.01049231, -0.1121866, 1, 1, 1, 1, 1,
-0.4246246, 0.9363183, -1.320615, 1, 1, 1, 1, 1,
-0.4242686, -0.844063, -2.292904, 1, 1, 1, 1, 1,
-0.4195389, -0.5205192, -2.853298, 1, 1, 1, 1, 1,
-0.4184279, 1.08128, -0.5790887, 1, 1, 1, 1, 1,
-0.4146584, -1.559407, -1.915115, 1, 1, 1, 1, 1,
-0.4139539, 1.404127, -0.6894854, 1, 1, 1, 1, 1,
-0.4125893, -0.08616435, -3.568455, 1, 1, 1, 1, 1,
-0.4078354, -0.2474307, -1.588623, 1, 1, 1, 1, 1,
-0.4077341, -0.3410378, -3.495937, 1, 1, 1, 1, 1,
-0.4076387, 0.001329625, -1.916513, 1, 1, 1, 1, 1,
-0.4061976, 0.5436206, 0.5004664, 1, 1, 1, 1, 1,
-0.4034058, 1.200568, -0.1969948, 1, 1, 1, 1, 1,
-0.3995093, 1.710131, -0.3285699, 0, 0, 1, 1, 1,
-0.3983369, 0.2959083, -0.3357258, 1, 0, 0, 1, 1,
-0.3963042, 0.3293949, -0.7965242, 1, 0, 0, 1, 1,
-0.3939345, 1.199397, -0.6643687, 1, 0, 0, 1, 1,
-0.3936884, 0.4514569, -0.4446836, 1, 0, 0, 1, 1,
-0.3875489, 0.08515079, -1.210119, 1, 0, 0, 1, 1,
-0.3829128, 0.6760743, -0.4609402, 0, 0, 0, 1, 1,
-0.3825964, -1.0515, -2.071285, 0, 0, 0, 1, 1,
-0.3814754, -0.4733673, -2.605047, 0, 0, 0, 1, 1,
-0.3772629, -0.5291563, -2.030557, 0, 0, 0, 1, 1,
-0.3747025, -0.2757496, -3.038407, 0, 0, 0, 1, 1,
-0.3740753, 0.02226081, -2.132272, 0, 0, 0, 1, 1,
-0.3722928, 0.6607756, 0.2461529, 0, 0, 0, 1, 1,
-0.3699756, -1.340519, -2.15955, 1, 1, 1, 1, 1,
-0.3685437, -1.348191, -4.914883, 1, 1, 1, 1, 1,
-0.3683845, 0.3434144, -0.5166124, 1, 1, 1, 1, 1,
-0.367606, 0.8383105, -0.2669592, 1, 1, 1, 1, 1,
-0.3638597, 0.5310205, -1.012066, 1, 1, 1, 1, 1,
-0.3608781, 1.05859, -1.492661, 1, 1, 1, 1, 1,
-0.3592227, 1.614087, -1.944855, 1, 1, 1, 1, 1,
-0.3535956, 2.130819, 0.1992531, 1, 1, 1, 1, 1,
-0.3511593, 0.1270738, -1.324888, 1, 1, 1, 1, 1,
-0.3474151, 0.2214137, -1.515957, 1, 1, 1, 1, 1,
-0.3439388, -0.293541, -2.013301, 1, 1, 1, 1, 1,
-0.3424872, 0.8653752, 0.4765326, 1, 1, 1, 1, 1,
-0.3395673, 0.01783453, -2.249627, 1, 1, 1, 1, 1,
-0.3315185, 0.2138696, -0.7421964, 1, 1, 1, 1, 1,
-0.3303897, -0.1738379, -2.865993, 1, 1, 1, 1, 1,
-0.3162969, -0.8494079, -2.434862, 0, 0, 1, 1, 1,
-0.3162156, 2.058146, 0.4506283, 1, 0, 0, 1, 1,
-0.3104993, -0.7536653, -2.482513, 1, 0, 0, 1, 1,
-0.3085197, -0.4424303, -1.47713, 1, 0, 0, 1, 1,
-0.3077907, 1.362015, 0.6948157, 1, 0, 0, 1, 1,
-0.3068331, -0.6285853, -2.554678, 1, 0, 0, 1, 1,
-0.3020723, -0.1336561, -3.482248, 0, 0, 0, 1, 1,
-0.3016153, -0.1233275, -1.828816, 0, 0, 0, 1, 1,
-0.2989923, -1.03703, -4.477827, 0, 0, 0, 1, 1,
-0.2934432, -0.4369095, -3.233232, 0, 0, 0, 1, 1,
-0.2933685, -1.299898, -2.260908, 0, 0, 0, 1, 1,
-0.2847174, 0.2384212, 0.5901723, 0, 0, 0, 1, 1,
-0.2841341, 0.5683954, -0.8179026, 0, 0, 0, 1, 1,
-0.2828, -0.7945521, -2.427218, 1, 1, 1, 1, 1,
-0.2790762, -0.01398264, -3.914014, 1, 1, 1, 1, 1,
-0.278232, 0.1300793, -0.9090337, 1, 1, 1, 1, 1,
-0.2744725, 0.6577675, 0.4202692, 1, 1, 1, 1, 1,
-0.2694583, 1.315472, -0.8516752, 1, 1, 1, 1, 1,
-0.2671442, 0.7994556, -1.241842, 1, 1, 1, 1, 1,
-0.2652141, -0.8333182, -3.022137, 1, 1, 1, 1, 1,
-0.2627059, 0.3696734, -2.641189, 1, 1, 1, 1, 1,
-0.2568086, 0.1005179, -2.863768, 1, 1, 1, 1, 1,
-0.2563457, 1.116221, -0.684386, 1, 1, 1, 1, 1,
-0.2495416, -0.08418373, -1.041948, 1, 1, 1, 1, 1,
-0.2423026, -1.880599, -4.001177, 1, 1, 1, 1, 1,
-0.2398237, -0.4422179, -2.749429, 1, 1, 1, 1, 1,
-0.2354112, 1.183926, -0.2545463, 1, 1, 1, 1, 1,
-0.2343321, 0.9254654, 0.6484911, 1, 1, 1, 1, 1,
-0.2275798, 0.06741437, -1.927271, 0, 0, 1, 1, 1,
-0.2160804, 1.233854, -0.8321883, 1, 0, 0, 1, 1,
-0.2153083, -1.209793, -2.39492, 1, 0, 0, 1, 1,
-0.2145413, 0.01214654, -2.126036, 1, 0, 0, 1, 1,
-0.2128515, -0.6269264, -2.475611, 1, 0, 0, 1, 1,
-0.2110036, -0.2654034, -2.022396, 1, 0, 0, 1, 1,
-0.2103585, -0.4902735, -1.013373, 0, 0, 0, 1, 1,
-0.204185, -0.3530087, -2.751606, 0, 0, 0, 1, 1,
-0.2017315, 0.5988356, 1.195385, 0, 0, 0, 1, 1,
-0.2012718, 0.1634644, -2.144346, 0, 0, 0, 1, 1,
-0.1978631, -0.4884999, -3.834537, 0, 0, 0, 1, 1,
-0.1973693, -1.241156, -1.019262, 0, 0, 0, 1, 1,
-0.196783, 0.6079846, -0.2518983, 0, 0, 0, 1, 1,
-0.1926839, 2.422179, 2.184552, 1, 1, 1, 1, 1,
-0.1910647, -1.842242, -3.458893, 1, 1, 1, 1, 1,
-0.1901287, 1.762045, 0.5814002, 1, 1, 1, 1, 1,
-0.1847566, -0.7382725, -2.727414, 1, 1, 1, 1, 1,
-0.1840996, -0.4254785, -1.662002, 1, 1, 1, 1, 1,
-0.1804322, -1.27116, -3.845933, 1, 1, 1, 1, 1,
-0.1789863, -0.2745709, -2.948294, 1, 1, 1, 1, 1,
-0.1776058, -0.1468886, -3.142856, 1, 1, 1, 1, 1,
-0.1774987, -0.5248441, -3.117174, 1, 1, 1, 1, 1,
-0.175688, 0.05465484, -0.6501243, 1, 1, 1, 1, 1,
-0.1754682, 0.5127325, -0.1191694, 1, 1, 1, 1, 1,
-0.1751838, -1.313564, -0.7741984, 1, 1, 1, 1, 1,
-0.1719344, 0.7048698, -1.184262, 1, 1, 1, 1, 1,
-0.167312, -2.050442, -1.308758, 1, 1, 1, 1, 1,
-0.1648494, 0.04038751, -1.246006, 1, 1, 1, 1, 1,
-0.1643175, -0.05088947, -2.102979, 0, 0, 1, 1, 1,
-0.159543, -0.3796884, -3.319181, 1, 0, 0, 1, 1,
-0.1576262, -0.6466944, -1.374456, 1, 0, 0, 1, 1,
-0.1561477, 1.918562, -1.44873, 1, 0, 0, 1, 1,
-0.1541982, 0.4133671, -1.100062, 1, 0, 0, 1, 1,
-0.1528095, -0.4558277, -2.868645, 1, 0, 0, 1, 1,
-0.151036, 0.4959536, -0.6051008, 0, 0, 0, 1, 1,
-0.1504595, 1.87435, -0.6782224, 0, 0, 0, 1, 1,
-0.1496636, -1.329606, -3.493881, 0, 0, 0, 1, 1,
-0.1495099, 0.8065605, -0.6715721, 0, 0, 0, 1, 1,
-0.1491155, 2.22329, -0.4745024, 0, 0, 0, 1, 1,
-0.1487537, -0.7424797, -3.620156, 0, 0, 0, 1, 1,
-0.1399151, 0.8591692, 1.01871, 0, 0, 0, 1, 1,
-0.1394629, -0.7825255, -2.494757, 1, 1, 1, 1, 1,
-0.1367772, -0.1473155, -4.233226, 1, 1, 1, 1, 1,
-0.1316316, 1.898758, -0.9237647, 1, 1, 1, 1, 1,
-0.1310866, -1.241759, -2.678272, 1, 1, 1, 1, 1,
-0.1296422, 0.2795551, -1.552455, 1, 1, 1, 1, 1,
-0.1252618, -0.6342481, -3.176667, 1, 1, 1, 1, 1,
-0.1248874, -0.766831, -2.23017, 1, 1, 1, 1, 1,
-0.1199257, -0.56711, -1.38422, 1, 1, 1, 1, 1,
-0.1184469, 2.520886, 2.028859, 1, 1, 1, 1, 1,
-0.1175039, -0.091611, -2.99577, 1, 1, 1, 1, 1,
-0.1167362, 2.381645, -0.3106621, 1, 1, 1, 1, 1,
-0.1131329, 0.2191479, 0.4188945, 1, 1, 1, 1, 1,
-0.1075526, 0.7988383, 0.4249611, 1, 1, 1, 1, 1,
-0.1045485, 0.005755478, -3.175003, 1, 1, 1, 1, 1,
-0.1004107, -0.2841498, -2.399423, 1, 1, 1, 1, 1,
-0.09931246, -0.8130596, -3.680645, 0, 0, 1, 1, 1,
-0.09268413, 1.096684, 0.9776436, 1, 0, 0, 1, 1,
-0.0904334, -0.7219898, -3.653327, 1, 0, 0, 1, 1,
-0.08863599, -1.946055, -0.947955, 1, 0, 0, 1, 1,
-0.08598638, -1.134191, -2.809271, 1, 0, 0, 1, 1,
-0.08428658, 0.08070709, 0.3316741, 1, 0, 0, 1, 1,
-0.08123748, -0.6357331, -4.400308, 0, 0, 0, 1, 1,
-0.08006031, -0.3774703, -1.136167, 0, 0, 0, 1, 1,
-0.07984471, -0.7107493, -1.912394, 0, 0, 0, 1, 1,
-0.07835577, 0.2529287, -0.4859398, 0, 0, 0, 1, 1,
-0.07470334, -0.01113146, -1.192772, 0, 0, 0, 1, 1,
-0.07247896, -0.563677, -3.76327, 0, 0, 0, 1, 1,
-0.07167935, 0.4876629, 1.288861, 0, 0, 0, 1, 1,
-0.07166156, -1.505056, -2.713308, 1, 1, 1, 1, 1,
-0.06969786, 0.8152066, 1.130312, 1, 1, 1, 1, 1,
-0.06928116, 0.8879517, 0.9190289, 1, 1, 1, 1, 1,
-0.06589839, 0.45103, -2.383914, 1, 1, 1, 1, 1,
-0.06467171, -2.223412, -5.337534, 1, 1, 1, 1, 1,
-0.0631503, -0.5973332, -4.174931, 1, 1, 1, 1, 1,
-0.05779993, -1.921243, -2.715808, 1, 1, 1, 1, 1,
-0.05590029, 2.120975, 1.557691, 1, 1, 1, 1, 1,
-0.05564434, 0.5517618, -0.7754927, 1, 1, 1, 1, 1,
-0.05555262, -0.9513752, -4.48073, 1, 1, 1, 1, 1,
-0.05480585, 1.785121, 0.2854683, 1, 1, 1, 1, 1,
-0.04663136, 0.1516639, 1.780481, 1, 1, 1, 1, 1,
-0.04612819, -0.201292, -3.079193, 1, 1, 1, 1, 1,
-0.04495555, -0.7335951, -3.679251, 1, 1, 1, 1, 1,
-0.04318304, -1.349038, -2.68669, 1, 1, 1, 1, 1,
-0.04156521, -0.1573602, -3.199866, 0, 0, 1, 1, 1,
-0.04142437, -1.318755, -3.713933, 1, 0, 0, 1, 1,
-0.04135236, 0.2788555, 0.0561254, 1, 0, 0, 1, 1,
-0.03860325, 0.5342652, -0.8664479, 1, 0, 0, 1, 1,
-0.03829322, 0.4224547, -0.7576616, 1, 0, 0, 1, 1,
-0.03268458, 1.346011, 0.5980775, 1, 0, 0, 1, 1,
-0.03030085, -1.241847, -1.400203, 0, 0, 0, 1, 1,
-0.0299673, -0.009430065, -1.780216, 0, 0, 0, 1, 1,
-0.02407849, 0.08103516, 1.116932, 0, 0, 0, 1, 1,
-0.02233735, -0.7699026, -3.549054, 0, 0, 0, 1, 1,
-0.01932857, -3.287679, -2.38888, 0, 0, 0, 1, 1,
-0.0192863, -1.457057, -3.00592, 0, 0, 0, 1, 1,
-0.01099176, -0.5970709, -2.651164, 0, 0, 0, 1, 1,
-0.01061906, 0.6133578, 1.563713, 1, 1, 1, 1, 1,
-0.01023317, -0.680123, -2.839386, 1, 1, 1, 1, 1,
-0.009115097, -0.336788, -3.218132, 1, 1, 1, 1, 1,
-0.007556669, 0.537634, 0.7066418, 1, 1, 1, 1, 1,
-0.006502674, -0.123995, -3.282999, 1, 1, 1, 1, 1,
-0.004534397, -0.3101535, -3.326695, 1, 1, 1, 1, 1,
-0.003708535, -0.1661329, -3.756748, 1, 1, 1, 1, 1,
0.007176807, -0.1237668, 2.146374, 1, 1, 1, 1, 1,
0.01063254, 0.5940049, -0.2951343, 1, 1, 1, 1, 1,
0.01172098, -1.090748, 3.213587, 1, 1, 1, 1, 1,
0.01457259, 0.2516159, -0.2737483, 1, 1, 1, 1, 1,
0.01494768, 0.9405013, 0.7384564, 1, 1, 1, 1, 1,
0.02005236, -1.770259, 1.68698, 1, 1, 1, 1, 1,
0.02153573, 0.7179192, -1.518291, 1, 1, 1, 1, 1,
0.02489429, 0.8315539, -0.7970406, 1, 1, 1, 1, 1,
0.02528917, -0.6522871, 1.711038, 0, 0, 1, 1, 1,
0.02816605, -0.7596463, 3.564996, 1, 0, 0, 1, 1,
0.02849347, -1.249377, 4.323535, 1, 0, 0, 1, 1,
0.03284985, -1.581963, 2.410445, 1, 0, 0, 1, 1,
0.03355949, 0.2660455, 1.076081, 1, 0, 0, 1, 1,
0.0348944, -0.9645814, 2.581553, 1, 0, 0, 1, 1,
0.03811399, 1.288294, -0.8169265, 0, 0, 0, 1, 1,
0.03860567, 0.04509288, -0.300947, 0, 0, 0, 1, 1,
0.0386698, -1.427731, 4.102879, 0, 0, 0, 1, 1,
0.03914972, 0.6327967, -0.4877808, 0, 0, 0, 1, 1,
0.04020737, -0.03900965, 2.046241, 0, 0, 0, 1, 1,
0.04541976, 0.7366536, -0.9446365, 0, 0, 0, 1, 1,
0.04956171, 0.9133906, -1.18337, 0, 0, 0, 1, 1,
0.05330137, -1.127134, 2.963225, 1, 1, 1, 1, 1,
0.05413698, 2.408717, 0.03917174, 1, 1, 1, 1, 1,
0.05493338, -1.492024, 2.992465, 1, 1, 1, 1, 1,
0.05701759, 1.853466, 0.8651524, 1, 1, 1, 1, 1,
0.05713579, -0.4911747, 3.867303, 1, 1, 1, 1, 1,
0.06332931, -0.3899562, 3.03341, 1, 1, 1, 1, 1,
0.06458659, -1.628613, 2.667007, 1, 1, 1, 1, 1,
0.06729273, -1.979636, 2.018368, 1, 1, 1, 1, 1,
0.06787328, -0.5761443, 2.523711, 1, 1, 1, 1, 1,
0.07803958, 0.9300134, 0.6287506, 1, 1, 1, 1, 1,
0.08043935, -0.2641023, 3.248123, 1, 1, 1, 1, 1,
0.0815945, 0.7650982, -1.475265, 1, 1, 1, 1, 1,
0.08235329, -0.4303814, 3.133585, 1, 1, 1, 1, 1,
0.08630028, 1.58906, 1.609971, 1, 1, 1, 1, 1,
0.08728226, -0.6126938, 2.312246, 1, 1, 1, 1, 1,
0.09260108, -0.248946, 2.747553, 0, 0, 1, 1, 1,
0.09580547, -1.860803, 2.434358, 1, 0, 0, 1, 1,
0.09703147, 0.3984092, 1.174703, 1, 0, 0, 1, 1,
0.1017182, -1.771777, 1.825542, 1, 0, 0, 1, 1,
0.1027423, 1.072147, 0.2331033, 1, 0, 0, 1, 1,
0.1046006, 0.01706319, 0.1499291, 1, 0, 0, 1, 1,
0.1055474, -0.2914599, 2.168883, 0, 0, 0, 1, 1,
0.1070445, 0.7154031, -0.7543535, 0, 0, 0, 1, 1,
0.1117789, 0.1201181, -1.259615, 0, 0, 0, 1, 1,
0.1120886, 0.7031363, 0.127705, 0, 0, 0, 1, 1,
0.1145741, -2.178018, 2.750506, 0, 0, 0, 1, 1,
0.1164455, 1.476187, 0.3693581, 0, 0, 0, 1, 1,
0.1174231, 0.8541152, 2.11158, 0, 0, 0, 1, 1,
0.1186901, 0.4942942, 1.478092, 1, 1, 1, 1, 1,
0.1201027, 0.6113434, -0.04932964, 1, 1, 1, 1, 1,
0.1202539, 0.5653548, 0.6691745, 1, 1, 1, 1, 1,
0.121132, 2.359473, -0.8182287, 1, 1, 1, 1, 1,
0.1304295, 1.246069, 0.3630501, 1, 1, 1, 1, 1,
0.1421235, 0.8104939, 0.6220003, 1, 1, 1, 1, 1,
0.1482804, -1.210422, 3.750068, 1, 1, 1, 1, 1,
0.1501271, 1.491337, -0.9205906, 1, 1, 1, 1, 1,
0.1569168, 0.7129841, 0.1035584, 1, 1, 1, 1, 1,
0.1616075, -0.6365475, 2.184772, 1, 1, 1, 1, 1,
0.1665662, -2.174545, 2.523752, 1, 1, 1, 1, 1,
0.1730992, 1.326679, 0.4844268, 1, 1, 1, 1, 1,
0.1802695, -0.8012389, 3.895897, 1, 1, 1, 1, 1,
0.184825, 0.09978814, 1.315059, 1, 1, 1, 1, 1,
0.1851495, -2.011069, 2.793575, 1, 1, 1, 1, 1,
0.1865263, -0.8241493, 3.426866, 0, 0, 1, 1, 1,
0.192103, -0.003814597, 1.731018, 1, 0, 0, 1, 1,
0.1952481, 1.956846, -0.1914705, 1, 0, 0, 1, 1,
0.1975295, -0.483725, 2.237633, 1, 0, 0, 1, 1,
0.1981075, -0.7047771, 2.876753, 1, 0, 0, 1, 1,
0.1990422, 0.760707, 1.761911, 1, 0, 0, 1, 1,
0.1991142, 1.049657, -1.456769, 0, 0, 0, 1, 1,
0.2022383, 0.5609636, 0.8120683, 0, 0, 0, 1, 1,
0.2029246, 0.001451401, 0.9638929, 0, 0, 0, 1, 1,
0.2043162, 1.378565, -0.5145514, 0, 0, 0, 1, 1,
0.2050074, -0.4314801, 1.953781, 0, 0, 0, 1, 1,
0.2060457, 0.04237998, 2.719584, 0, 0, 0, 1, 1,
0.2090392, 0.743103, 1.259478, 0, 0, 0, 1, 1,
0.2223162, 0.310364, 0.3403729, 1, 1, 1, 1, 1,
0.2239522, -0.7746891, 1.484691, 1, 1, 1, 1, 1,
0.2264412, -0.03159148, 0.5006551, 1, 1, 1, 1, 1,
0.2338662, -0.09649838, 2.341973, 1, 1, 1, 1, 1,
0.2356976, -0.309746, 2.613466, 1, 1, 1, 1, 1,
0.2394954, -0.4153184, 3.586615, 1, 1, 1, 1, 1,
0.2408272, -1.817268, 1.363902, 1, 1, 1, 1, 1,
0.2419657, 0.8811038, 1.063761, 1, 1, 1, 1, 1,
0.2519895, 0.2451755, 1.108856, 1, 1, 1, 1, 1,
0.25543, 0.5604454, -0.2854792, 1, 1, 1, 1, 1,
0.2557196, -0.322049, 3.551268, 1, 1, 1, 1, 1,
0.2564452, -1.406155, 2.933141, 1, 1, 1, 1, 1,
0.2606745, 1.432397, 2.225163, 1, 1, 1, 1, 1,
0.2641066, 1.136311, 0.5275158, 1, 1, 1, 1, 1,
0.2661629, -0.3397355, -0.4487172, 1, 1, 1, 1, 1,
0.271587, -1.725641, 2.332876, 0, 0, 1, 1, 1,
0.2718143, 1.178485, 0.04884043, 1, 0, 0, 1, 1,
0.2722583, -1.111681, 1.815289, 1, 0, 0, 1, 1,
0.2724758, -0.702764, 3.981993, 1, 0, 0, 1, 1,
0.2725621, 0.4732548, 0.5329652, 1, 0, 0, 1, 1,
0.2737823, 0.8255251, 0.3831377, 1, 0, 0, 1, 1,
0.2783093, 1.949925, -0.4938453, 0, 0, 0, 1, 1,
0.2809668, 0.2645787, -0.7453178, 0, 0, 0, 1, 1,
0.2814249, 0.4905132, -0.08324473, 0, 0, 0, 1, 1,
0.2818555, 0.715969, 1.74996, 0, 0, 0, 1, 1,
0.2845217, 0.3252864, 1.162091, 0, 0, 0, 1, 1,
0.2851463, -0.8418451, 2.742721, 0, 0, 0, 1, 1,
0.2867144, 0.1263658, 1.793725, 0, 0, 0, 1, 1,
0.2871006, -1.029724, 5.029267, 1, 1, 1, 1, 1,
0.2899798, 0.1376328, 2.019376, 1, 1, 1, 1, 1,
0.2910308, 1.646474, -1.124254, 1, 1, 1, 1, 1,
0.2911117, -1.446338, 2.666548, 1, 1, 1, 1, 1,
0.2945489, -0.5449868, 1.732555, 1, 1, 1, 1, 1,
0.2962967, 0.5174081, 0.1413516, 1, 1, 1, 1, 1,
0.296515, -1.113906, 4.884743, 1, 1, 1, 1, 1,
0.3012874, -0.3103165, 1.155864, 1, 1, 1, 1, 1,
0.3023564, -0.07967877, 0.5754884, 1, 1, 1, 1, 1,
0.3043047, -0.359091, 3.827983, 1, 1, 1, 1, 1,
0.3098148, 1.224212, 2.205035, 1, 1, 1, 1, 1,
0.311188, -1.24483, 2.718055, 1, 1, 1, 1, 1,
0.316743, -1.261563, 3.776979, 1, 1, 1, 1, 1,
0.3192296, -0.4833339, 5.432686, 1, 1, 1, 1, 1,
0.3203088, -1.317231, 3.022973, 1, 1, 1, 1, 1,
0.3229178, -0.1586718, 3.033306, 0, 0, 1, 1, 1,
0.3278143, -0.1898721, 2.916074, 1, 0, 0, 1, 1,
0.3279646, -1.681068, 3.672369, 1, 0, 0, 1, 1,
0.3291708, 0.8780518, 0.04394474, 1, 0, 0, 1, 1,
0.3294625, 1.938572, 0.3447998, 1, 0, 0, 1, 1,
0.3395503, 0.5526418, 3.850749, 1, 0, 0, 1, 1,
0.3402363, -2.333771, 1.667613, 0, 0, 0, 1, 1,
0.3431024, 0.3628374, 0.3064561, 0, 0, 0, 1, 1,
0.3448364, -0.6059856, 2.348624, 0, 0, 0, 1, 1,
0.3454062, 1.88378, -0.1297138, 0, 0, 0, 1, 1,
0.3490597, -0.824608, 1.798926, 0, 0, 0, 1, 1,
0.3497162, 1.653586, 0.4583134, 0, 0, 0, 1, 1,
0.3507296, 1.879662, 0.4090321, 0, 0, 0, 1, 1,
0.3517779, 0.1736026, 0.4995695, 1, 1, 1, 1, 1,
0.3541132, -0.4781319, 1.40113, 1, 1, 1, 1, 1,
0.3583609, -0.4883725, 1.4847, 1, 1, 1, 1, 1,
0.3611335, -1.361227, 3.199686, 1, 1, 1, 1, 1,
0.3621209, -0.543366, 4.371822, 1, 1, 1, 1, 1,
0.3637814, 1.354738, 1.268145, 1, 1, 1, 1, 1,
0.3674494, 0.3078145, -0.6649191, 1, 1, 1, 1, 1,
0.3686076, 0.03639394, 1.301029, 1, 1, 1, 1, 1,
0.3694528, 1.069774, 0.9210945, 1, 1, 1, 1, 1,
0.3714286, -1.777871, 4.798367, 1, 1, 1, 1, 1,
0.3743908, 1.091403, 2.058964, 1, 1, 1, 1, 1,
0.3776728, -0.2094664, 3.277131, 1, 1, 1, 1, 1,
0.3840084, 0.564131, -0.4123614, 1, 1, 1, 1, 1,
0.3877265, 3.172799, -0.5172938, 1, 1, 1, 1, 1,
0.3926821, -1.118681, 4.104172, 1, 1, 1, 1, 1,
0.3929494, -0.4923477, 2.292099, 0, 0, 1, 1, 1,
0.398347, 1.639243, 1.278971, 1, 0, 0, 1, 1,
0.3987408, -0.7547618, 2.960312, 1, 0, 0, 1, 1,
0.3994341, 0.08331143, 3.012374, 1, 0, 0, 1, 1,
0.4062426, 0.6248484, 0.7891893, 1, 0, 0, 1, 1,
0.4086297, 0.8805318, 0.5261829, 1, 0, 0, 1, 1,
0.409834, -1.957915, 1.965643, 0, 0, 0, 1, 1,
0.4109896, -3.00341, 2.549318, 0, 0, 0, 1, 1,
0.4121641, 2.039202, 1.42658, 0, 0, 0, 1, 1,
0.4132652, 1.322444, 0.6683161, 0, 0, 0, 1, 1,
0.4158462, -1.651108, 1.928331, 0, 0, 0, 1, 1,
0.4172356, 0.8608, 1.18182, 0, 0, 0, 1, 1,
0.4203873, -1.211977, 3.408251, 0, 0, 0, 1, 1,
0.4216099, -0.3216055, 4.531394, 1, 1, 1, 1, 1,
0.4222869, 1.345839, -0.5073895, 1, 1, 1, 1, 1,
0.4251118, -0.4705496, 4.703797, 1, 1, 1, 1, 1,
0.4258327, -1.019147, 4.123565, 1, 1, 1, 1, 1,
0.4271979, -1.67257, 1.366862, 1, 1, 1, 1, 1,
0.4281703, 1.253661, 2.647979, 1, 1, 1, 1, 1,
0.4311315, 0.8058394, 1.958907, 1, 1, 1, 1, 1,
0.4360921, -2.031827, 3.683682, 1, 1, 1, 1, 1,
0.4369655, -1.525976, 2.181813, 1, 1, 1, 1, 1,
0.441996, -0.7905716, 4.850911, 1, 1, 1, 1, 1,
0.4431233, -1.14176, 2.527019, 1, 1, 1, 1, 1,
0.443354, 0.0284532, 1.217081, 1, 1, 1, 1, 1,
0.4443761, 1.098945, 1.609833, 1, 1, 1, 1, 1,
0.4478462, 1.167633, -0.3112119, 1, 1, 1, 1, 1,
0.4506354, -0.4393637, 2.508191, 1, 1, 1, 1, 1,
0.452343, -0.1569489, 1.646901, 0, 0, 1, 1, 1,
0.4527117, -0.8771785, 1.532136, 1, 0, 0, 1, 1,
0.4553174, -1.435506, 4.750591, 1, 0, 0, 1, 1,
0.4585465, 0.8700718, 0.2174961, 1, 0, 0, 1, 1,
0.4608757, -0.6851786, 2.562236, 1, 0, 0, 1, 1,
0.4626788, 0.4240984, 3.008412, 1, 0, 0, 1, 1,
0.4627412, 0.2072257, 3.77545, 0, 0, 0, 1, 1,
0.4630105, 1.034306, 0.1171762, 0, 0, 0, 1, 1,
0.4649688, 0.5082856, 1.10504, 0, 0, 0, 1, 1,
0.4710916, -0.722929, 2.129115, 0, 0, 0, 1, 1,
0.4722308, 1.968008, -0.1166904, 0, 0, 0, 1, 1,
0.4779317, 0.8655172, 0.6874357, 0, 0, 0, 1, 1,
0.4779329, -0.2255542, 1.703142, 0, 0, 0, 1, 1,
0.4795825, 2.130913, -0.8920672, 1, 1, 1, 1, 1,
0.4820368, -1.742854, 4.701772, 1, 1, 1, 1, 1,
0.482954, 0.7290583, -1.360208, 1, 1, 1, 1, 1,
0.483613, -2.324497, 3.574613, 1, 1, 1, 1, 1,
0.4857955, -0.2896272, 2.050475, 1, 1, 1, 1, 1,
0.4948981, -0.2772855, 0.9693105, 1, 1, 1, 1, 1,
0.4970777, -1.966499, 2.066165, 1, 1, 1, 1, 1,
0.4973919, -0.00129113, 1.212545, 1, 1, 1, 1, 1,
0.4976436, -1.500706, 1.548149, 1, 1, 1, 1, 1,
0.4982564, -2.053284, 3.651351, 1, 1, 1, 1, 1,
0.5003282, -1.508682, 2.903005, 1, 1, 1, 1, 1,
0.5012898, -1.234977, 3.707861, 1, 1, 1, 1, 1,
0.5025289, -0.878891, 3.321244, 1, 1, 1, 1, 1,
0.5037261, -0.05322934, 0.8928449, 1, 1, 1, 1, 1,
0.5054005, -0.0426385, 2.904397, 1, 1, 1, 1, 1,
0.5076762, -0.2811611, 2.801909, 0, 0, 1, 1, 1,
0.5174434, 1.185989, 1.580633, 1, 0, 0, 1, 1,
0.5201827, 1.035091, 1.258919, 1, 0, 0, 1, 1,
0.5263931, -0.6370043, 0.6354747, 1, 0, 0, 1, 1,
0.5340487, 0.1589014, 2.358477, 1, 0, 0, 1, 1,
0.534256, -0.5470186, 1.119771, 1, 0, 0, 1, 1,
0.5356445, -0.3498372, 3.838199, 0, 0, 0, 1, 1,
0.5427331, -1.726251, 2.602365, 0, 0, 0, 1, 1,
0.5457599, -1.252743, 4.869293, 0, 0, 0, 1, 1,
0.5516062, -1.309188, 2.5351, 0, 0, 0, 1, 1,
0.5578384, -0.12076, 3.784712, 0, 0, 0, 1, 1,
0.5581769, 0.4177038, 0.5988826, 0, 0, 0, 1, 1,
0.5607144, -1.631555, 2.348023, 0, 0, 0, 1, 1,
0.5611608, 1.350614, -1.856688, 1, 1, 1, 1, 1,
0.5673305, -0.820098, 2.594131, 1, 1, 1, 1, 1,
0.5688993, -0.5460581, 1.904127, 1, 1, 1, 1, 1,
0.5712324, -2.894126, 4.233757, 1, 1, 1, 1, 1,
0.575573, 0.4541254, 0.1575735, 1, 1, 1, 1, 1,
0.5819982, -0.8066407, 1.377031, 1, 1, 1, 1, 1,
0.5872374, 0.7517102, 0.9873295, 1, 1, 1, 1, 1,
0.5881941, -1.165593, 0.9129894, 1, 1, 1, 1, 1,
0.5888586, 1.534749, -1.488555, 1, 1, 1, 1, 1,
0.590169, 2.159385, -0.1123794, 1, 1, 1, 1, 1,
0.5923051, -0.2757846, 1.07869, 1, 1, 1, 1, 1,
0.5927613, 1.273885, -1.088787, 1, 1, 1, 1, 1,
0.6003075, 0.0727884, 1.766186, 1, 1, 1, 1, 1,
0.6035201, -0.7413575, 1.49615, 1, 1, 1, 1, 1,
0.6085485, -0.4309354, 3.513068, 1, 1, 1, 1, 1,
0.6163891, 0.2686905, 2.372448, 0, 0, 1, 1, 1,
0.6185653, 1.938496, 0.7870374, 1, 0, 0, 1, 1,
0.6197136, 0.06077118, 2.769732, 1, 0, 0, 1, 1,
0.6265916, -0.613003, 0.5755712, 1, 0, 0, 1, 1,
0.6316224, 0.3818983, 2.755659, 1, 0, 0, 1, 1,
0.6380756, 1.5127, -0.1910082, 1, 0, 0, 1, 1,
0.6381356, 0.7563834, -0.2510012, 0, 0, 0, 1, 1,
0.6462632, -0.7740129, 2.177082, 0, 0, 0, 1, 1,
0.6507348, 0.02307958, 2.455076, 0, 0, 0, 1, 1,
0.6545886, 0.2372898, 2.220921, 0, 0, 0, 1, 1,
0.6557227, 0.633489, 1.501527, 0, 0, 0, 1, 1,
0.6620791, -0.5744818, 0.9250412, 0, 0, 0, 1, 1,
0.666967, -1.611231, 4.282555, 0, 0, 0, 1, 1,
0.6682069, -0.4445475, 2.628604, 1, 1, 1, 1, 1,
0.6712848, 0.9592477, 1.494192, 1, 1, 1, 1, 1,
0.6715006, 0.3081686, 0.1770601, 1, 1, 1, 1, 1,
0.6878377, 0.2126391, 2.772553, 1, 1, 1, 1, 1,
0.6922764, -0.4392684, 3.125878, 1, 1, 1, 1, 1,
0.6930764, 0.04178816, 2.890431, 1, 1, 1, 1, 1,
0.702317, 1.572556, 1.279777, 1, 1, 1, 1, 1,
0.703783, -1.570725, 2.243961, 1, 1, 1, 1, 1,
0.7106318, 0.2067894, 2.227755, 1, 1, 1, 1, 1,
0.711812, -0.3024757, 1.992577, 1, 1, 1, 1, 1,
0.7121757, 1.06417, 1.926954, 1, 1, 1, 1, 1,
0.7129484, -1.200588, 1.67358, 1, 1, 1, 1, 1,
0.715354, -0.3910485, 1.511665, 1, 1, 1, 1, 1,
0.7192267, -0.7702358, 2.527311, 1, 1, 1, 1, 1,
0.7255238, 0.1373751, 0.4434761, 1, 1, 1, 1, 1,
0.7270482, 0.4218981, -0.07821585, 0, 0, 1, 1, 1,
0.7299955, 1.136553, 0.8564041, 1, 0, 0, 1, 1,
0.7322103, 0.09325398, 0.7657949, 1, 0, 0, 1, 1,
0.7332603, -0.8094785, 4.544819, 1, 0, 0, 1, 1,
0.7340237, -1.430566, 2.227016, 1, 0, 0, 1, 1,
0.7362854, -0.2465056, 2.565029, 1, 0, 0, 1, 1,
0.7382981, 0.4127325, 1.679266, 0, 0, 0, 1, 1,
0.7425199, -0.1508976, 0.3520301, 0, 0, 0, 1, 1,
0.7629731, 0.7218598, 0.2650828, 0, 0, 0, 1, 1,
0.7631493, 1.197991, 1.171267, 0, 0, 0, 1, 1,
0.763384, -0.2631635, 2.969799, 0, 0, 0, 1, 1,
0.7634807, -0.9831944, 2.959492, 0, 0, 0, 1, 1,
0.768328, -0.09055173, 1.188941, 0, 0, 0, 1, 1,
0.7792949, 0.2553638, 2.771709, 1, 1, 1, 1, 1,
0.7816563, -1.28098, 2.443052, 1, 1, 1, 1, 1,
0.783935, -0.01896656, 0.6612616, 1, 1, 1, 1, 1,
0.786529, 1.144471, 0.5159252, 1, 1, 1, 1, 1,
0.787955, 0.9975318, 1.589927, 1, 1, 1, 1, 1,
0.7922686, -1.480026, 3.074227, 1, 1, 1, 1, 1,
0.7957007, 0.6394519, 0.9170633, 1, 1, 1, 1, 1,
0.7989133, -0.05389538, 0.4285847, 1, 1, 1, 1, 1,
0.7999761, -1.488496, 4.083434, 1, 1, 1, 1, 1,
0.8015226, -1.111858, 2.029499, 1, 1, 1, 1, 1,
0.8015587, -0.9180373, 0.6595386, 1, 1, 1, 1, 1,
0.8072533, 0.0233275, 2.07988, 1, 1, 1, 1, 1,
0.807776, -0.03882387, 2.568808, 1, 1, 1, 1, 1,
0.8113389, -0.6188251, 0.7599075, 1, 1, 1, 1, 1,
0.8144512, 0.8154233, 0.6015872, 1, 1, 1, 1, 1,
0.8179443, 1.831376, 1.331749, 0, 0, 1, 1, 1,
0.8207471, -1.151539, 2.658719, 1, 0, 0, 1, 1,
0.8213788, -0.8614995, 2.928953, 1, 0, 0, 1, 1,
0.8221655, 0.8025513, 3.003212, 1, 0, 0, 1, 1,
0.8221982, 1.352423, 0.9855104, 1, 0, 0, 1, 1,
0.8357449, -0.2557549, 3.864431, 1, 0, 0, 1, 1,
0.8363274, 0.1675652, 1.906556, 0, 0, 0, 1, 1,
0.852463, 0.1479973, 1.970311, 0, 0, 0, 1, 1,
0.853451, -0.9299337, 1.534503, 0, 0, 0, 1, 1,
0.8611615, -2.123136, 2.707745, 0, 0, 0, 1, 1,
0.86532, -1.126672, 3.470645, 0, 0, 0, 1, 1,
0.8725422, -0.06751709, 2.349325, 0, 0, 0, 1, 1,
0.8734329, -0.1497565, 1.607619, 0, 0, 0, 1, 1,
0.8783201, -0.06320677, 1.881649, 1, 1, 1, 1, 1,
0.8783521, -0.6059226, 2.013194, 1, 1, 1, 1, 1,
0.8944783, 2.36084, 1.072252, 1, 1, 1, 1, 1,
0.8985282, 1.112299, 1.912223, 1, 1, 1, 1, 1,
0.905314, 0.1487085, 2.366265, 1, 1, 1, 1, 1,
0.9089548, -1.521908, 1.896847, 1, 1, 1, 1, 1,
0.9164638, 1.20909, -0.2597249, 1, 1, 1, 1, 1,
0.9188563, 0.2433628, 0.3584439, 1, 1, 1, 1, 1,
0.9235062, 0.8114374, 1.362428, 1, 1, 1, 1, 1,
0.9243643, 0.3819719, 0.5917913, 1, 1, 1, 1, 1,
0.9262226, -2.087784, 2.186075, 1, 1, 1, 1, 1,
0.9291222, 0.547626, -1.898698, 1, 1, 1, 1, 1,
0.930703, -0.389746, 0.2774457, 1, 1, 1, 1, 1,
0.9341551, -1.275168, 3.046749, 1, 1, 1, 1, 1,
0.9350595, 0.1947898, 0.34892, 1, 1, 1, 1, 1,
0.9355952, 1.545771, 1.016177, 0, 0, 1, 1, 1,
0.9450878, 0.3853801, 3.149198, 1, 0, 0, 1, 1,
0.9466989, -0.04825893, 0.1922056, 1, 0, 0, 1, 1,
0.956948, 1.408952, 0.9912365, 1, 0, 0, 1, 1,
0.9591719, -0.05727818, 2.526222, 1, 0, 0, 1, 1,
0.9639837, -0.1753962, 2.556777, 1, 0, 0, 1, 1,
0.9737419, 1.642569, -1.599641, 0, 0, 0, 1, 1,
0.9745608, -1.162641, 4.25728, 0, 0, 0, 1, 1,
0.9754937, -1.485521, 2.439958, 0, 0, 0, 1, 1,
0.9761805, 1.048537, -0.4990057, 0, 0, 0, 1, 1,
0.9802361, 0.283696, 2.345823, 0, 0, 0, 1, 1,
0.9802868, 0.4898211, 0.426016, 0, 0, 0, 1, 1,
0.9935145, -1.817132, 1.834967, 0, 0, 0, 1, 1,
0.99493, 0.5556509, -0.8009904, 1, 1, 1, 1, 1,
0.998463, -3.275162, 0.8566303, 1, 1, 1, 1, 1,
1.000468, 1.361475, -0.9947336, 1, 1, 1, 1, 1,
1.001192, -0.5231115, 0.6359522, 1, 1, 1, 1, 1,
1.004743, -0.7103278, 2.655139, 1, 1, 1, 1, 1,
1.012236, -0.2719748, 2.556916, 1, 1, 1, 1, 1,
1.017305, 1.218583, 1.116466, 1, 1, 1, 1, 1,
1.033717, -2.001015, 2.834939, 1, 1, 1, 1, 1,
1.043593, -0.8282685, 2.084094, 1, 1, 1, 1, 1,
1.046293, -0.2686052, 2.78581, 1, 1, 1, 1, 1,
1.050036, -1.940581, 2.670347, 1, 1, 1, 1, 1,
1.050182, -0.7464797, 4.240782, 1, 1, 1, 1, 1,
1.054862, -1.082681, 2.447969, 1, 1, 1, 1, 1,
1.056322, 1.749774, 0.6828107, 1, 1, 1, 1, 1,
1.056944, 0.3251483, 1.475277, 1, 1, 1, 1, 1,
1.057455, -0.3847767, 2.131983, 0, 0, 1, 1, 1,
1.068971, -0.0804537, 3.398021, 1, 0, 0, 1, 1,
1.072449, 1.356533, 0.09196858, 1, 0, 0, 1, 1,
1.072551, -0.8646954, 2.344546, 1, 0, 0, 1, 1,
1.09251, -0.4331058, 0.498787, 1, 0, 0, 1, 1,
1.107063, 0.1533664, 0.7815623, 1, 0, 0, 1, 1,
1.109824, 0.01833732, 2.601087, 0, 0, 0, 1, 1,
1.123801, -0.3243537, 2.097438, 0, 0, 0, 1, 1,
1.129002, 0.1803062, 2.216947, 0, 0, 0, 1, 1,
1.132756, 0.7533101, 1.567816, 0, 0, 0, 1, 1,
1.134859, 0.5800254, 1.319229, 0, 0, 0, 1, 1,
1.135569, 0.9125428, 1.708133, 0, 0, 0, 1, 1,
1.135628, 0.8262568, 1.46541, 0, 0, 0, 1, 1,
1.1394, 0.1327733, 1.780928, 1, 1, 1, 1, 1,
1.142285, -1.368695, 2.135267, 1, 1, 1, 1, 1,
1.143892, -0.4561605, 0.9630483, 1, 1, 1, 1, 1,
1.153232, 1.889896, 0.9302436, 1, 1, 1, 1, 1,
1.155163, 0.9530326, 1.4774, 1, 1, 1, 1, 1,
1.165352, 0.09489936, 2.607197, 1, 1, 1, 1, 1,
1.166831, -0.2006629, 0.709536, 1, 1, 1, 1, 1,
1.171847, 0.2038047, -0.7022178, 1, 1, 1, 1, 1,
1.17265, 1.106006, 2.902569, 1, 1, 1, 1, 1,
1.176303, -1.085746, 2.309664, 1, 1, 1, 1, 1,
1.176781, -0.7687641, 2.162048, 1, 1, 1, 1, 1,
1.180113, 1.962014, 0.1849495, 1, 1, 1, 1, 1,
1.18236, -1.337699, 2.379465, 1, 1, 1, 1, 1,
1.201717, 1.245535, 0.2315604, 1, 1, 1, 1, 1,
1.203797, 1.204246, -1.355422, 1, 1, 1, 1, 1,
1.204506, 1.256511, 1.340193, 0, 0, 1, 1, 1,
1.21041, 2.00371, 0.3743182, 1, 0, 0, 1, 1,
1.222408, -0.4691692, 2.45564, 1, 0, 0, 1, 1,
1.23118, 0.7280408, 1.192814, 1, 0, 0, 1, 1,
1.246371, 1.758762, 0.8955033, 1, 0, 0, 1, 1,
1.27432, 0.06984001, 1.065123, 1, 0, 0, 1, 1,
1.278884, 0.2454776, 2.632209, 0, 0, 0, 1, 1,
1.287312, 0.01527305, 0.3703764, 0, 0, 0, 1, 1,
1.287485, 0.05590674, -0.2512325, 0, 0, 0, 1, 1,
1.288632, 0.8738858, 1.9453, 0, 0, 0, 1, 1,
1.293031, 1.250229, 0.1659652, 0, 0, 0, 1, 1,
1.294984, -0.5505261, 2.41065, 0, 0, 0, 1, 1,
1.295553, 0.006000573, 1.068193, 0, 0, 0, 1, 1,
1.302526, 1.297502, 0.6215295, 1, 1, 1, 1, 1,
1.30497, 1.419148, 1.649675, 1, 1, 1, 1, 1,
1.308505, 1.456455, 1.127584, 1, 1, 1, 1, 1,
1.327355, -0.2074175, 2.413837, 1, 1, 1, 1, 1,
1.337559, -0.4611605, 1.767044, 1, 1, 1, 1, 1,
1.339411, -0.08555862, 2.696038, 1, 1, 1, 1, 1,
1.344969, -0.6912296, 0.3220931, 1, 1, 1, 1, 1,
1.351062, -1.467625, 2.444426, 1, 1, 1, 1, 1,
1.357212, 2.13214, 0.1639718, 1, 1, 1, 1, 1,
1.382753, 0.01558501, 0.3737402, 1, 1, 1, 1, 1,
1.391006, 0.3190746, 1.43538, 1, 1, 1, 1, 1,
1.394517, 0.7108745, 2.419842, 1, 1, 1, 1, 1,
1.412781, 0.07278465, 0.9234248, 1, 1, 1, 1, 1,
1.421342, -1.65844, 1.474099, 1, 1, 1, 1, 1,
1.430256, -0.6903731, 0.2610318, 1, 1, 1, 1, 1,
1.437933, 0.1556118, 2.259066, 0, 0, 1, 1, 1,
1.441694, 0.5343807, 2.096527, 1, 0, 0, 1, 1,
1.444535, -2.292763, 1.301959, 1, 0, 0, 1, 1,
1.446356, 0.562512, -0.7266685, 1, 0, 0, 1, 1,
1.459543, 0.3058649, 0.8413869, 1, 0, 0, 1, 1,
1.460462, -0.6457976, 4.306947, 1, 0, 0, 1, 1,
1.480842, -0.04937035, 0.1643618, 0, 0, 0, 1, 1,
1.482368, -1.019592, 2.507403, 0, 0, 0, 1, 1,
1.50736, -0.5602295, 1.778223, 0, 0, 0, 1, 1,
1.522453, -0.03190989, 0.8853139, 0, 0, 0, 1, 1,
1.535571, -0.6077834, 2.564416, 0, 0, 0, 1, 1,
1.541872, -1.364192, 2.364195, 0, 0, 0, 1, 1,
1.543244, -0.5143754, 1.831317, 0, 0, 0, 1, 1,
1.547299, 2.471954, 0.2915088, 1, 1, 1, 1, 1,
1.557506, 0.5372518, 2.494043, 1, 1, 1, 1, 1,
1.557934, -1.268996, 1.453639, 1, 1, 1, 1, 1,
1.558718, -0.2110177, 1.990439, 1, 1, 1, 1, 1,
1.560163, -1.333128, 4.177732, 1, 1, 1, 1, 1,
1.560543, -0.979871, 3.699325, 1, 1, 1, 1, 1,
1.564565, 0.5807654, 2.073327, 1, 1, 1, 1, 1,
1.567137, -0.1482884, 2.065851, 1, 1, 1, 1, 1,
1.574122, 0.3322303, 1.122824, 1, 1, 1, 1, 1,
1.595392, 0.8169211, 3.286586, 1, 1, 1, 1, 1,
1.611908, -1.096477, 1.946333, 1, 1, 1, 1, 1,
1.647717, 0.3270019, 2.080486, 1, 1, 1, 1, 1,
1.655315, -1.166339, 2.1547, 1, 1, 1, 1, 1,
1.670235, 0.5429165, -0.4909673, 1, 1, 1, 1, 1,
1.680432, -0.3026397, 2.243016, 1, 1, 1, 1, 1,
1.705951, -0.2952845, 2.375867, 0, 0, 1, 1, 1,
1.740443, -0.1348567, -0.2172745, 1, 0, 0, 1, 1,
1.741952, 0.9360209, 0.8283803, 1, 0, 0, 1, 1,
1.742381, 1.285022, 0.5204106, 1, 0, 0, 1, 1,
1.746722, 0.3346456, 1.23699, 1, 0, 0, 1, 1,
1.750407, 0.4396934, 1.371459, 1, 0, 0, 1, 1,
1.76133, -0.3420459, 0.7135589, 0, 0, 0, 1, 1,
1.770813, -0.3037016, 2.191914, 0, 0, 0, 1, 1,
1.792671, -0.2042211, -0.6430871, 0, 0, 0, 1, 1,
1.796986, -1.498343, 3.31941, 0, 0, 0, 1, 1,
1.801703, 0.6397312, 2.443341, 0, 0, 0, 1, 1,
1.823799, -0.9399225, 0.7383864, 0, 0, 0, 1, 1,
1.826088, -1.687689, 0.8761699, 0, 0, 0, 1, 1,
1.854672, -0.03771656, 1.689589, 1, 1, 1, 1, 1,
1.858148, -0.8313183, 0.3769151, 1, 1, 1, 1, 1,
1.8582, 2.836423, 2.018435, 1, 1, 1, 1, 1,
1.861243, 0.5304477, 1.105408, 1, 1, 1, 1, 1,
1.876953, -0.05077793, 1.876041, 1, 1, 1, 1, 1,
1.940264, 0.1628644, 1.426646, 1, 1, 1, 1, 1,
1.949397, 1.310816, -0.3536775, 1, 1, 1, 1, 1,
2.030457, 0.37325, 2.15303, 1, 1, 1, 1, 1,
2.052436, -0.2678985, 2.317856, 1, 1, 1, 1, 1,
2.085636, 0.8593369, 3.265479, 1, 1, 1, 1, 1,
2.095964, -0.3256517, 0.6076598, 1, 1, 1, 1, 1,
2.102665, 0.1413219, 2.618941, 1, 1, 1, 1, 1,
2.181545, -0.179309, 2.902565, 1, 1, 1, 1, 1,
2.189483, -0.6666569, 2.625744, 1, 1, 1, 1, 1,
2.196375, 0.1813603, 0.9725931, 1, 1, 1, 1, 1,
2.199839, -2.677387, 2.133436, 0, 0, 1, 1, 1,
2.24498, -0.8250687, 1.988841, 1, 0, 0, 1, 1,
2.26069, 0.2188604, 2.41649, 1, 0, 0, 1, 1,
2.265566, -1.048881, 0.6033925, 1, 0, 0, 1, 1,
2.26798, 0.0231503, 1.298019, 1, 0, 0, 1, 1,
2.304281, 0.1775022, 2.065682, 1, 0, 0, 1, 1,
2.364801, 0.01242881, 2.644894, 0, 0, 0, 1, 1,
2.37005, 0.6811433, 0.6282694, 0, 0, 0, 1, 1,
2.395906, 1.05094, 1.977702, 0, 0, 0, 1, 1,
2.441385, 1.455152, 0.7655778, 0, 0, 0, 1, 1,
2.515148, -0.2314233, 2.302853, 0, 0, 0, 1, 1,
2.518244, 0.663193, -2.0816, 0, 0, 0, 1, 1,
2.564476, 0.04609035, -0.3288013, 0, 0, 0, 1, 1,
2.59534, -1.340342, 2.416402, 1, 1, 1, 1, 1,
2.635947, 0.5992274, 1.050337, 1, 1, 1, 1, 1,
2.729918, -0.4557106, 1.745872, 1, 1, 1, 1, 1,
2.80368, 0.04813868, 1.765136, 1, 1, 1, 1, 1,
2.902443, 0.1668154, 1.80732, 1, 1, 1, 1, 1,
2.909352, 0.8143914, 3.492333, 1, 1, 1, 1, 1,
2.911381, -0.03616259, 2.434276, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.479836;
var distance = 33.29752;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.003407598, 0.09045005, -0.04757619 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.29752);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
