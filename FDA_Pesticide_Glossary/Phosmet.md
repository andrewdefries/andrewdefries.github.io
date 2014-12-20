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
-3.472388, 0.5407114, -2.109226, 1, 0, 0, 1,
-3.088394, 0.3842021, -1.208863, 1, 0.007843138, 0, 1,
-2.887777, -0.241004, -1.655572, 1, 0.01176471, 0, 1,
-2.875898, -1.587339, -0.7558878, 1, 0.01960784, 0, 1,
-2.835652, 0.4591986, -1.554899, 1, 0.02352941, 0, 1,
-2.80478, 0.07050575, -0.5065879, 1, 0.03137255, 0, 1,
-2.722036, -0.5213467, -1.235615, 1, 0.03529412, 0, 1,
-2.594974, 0.2559336, -1.156745, 1, 0.04313726, 0, 1,
-2.53057, 0.3133639, -1.669554, 1, 0.04705882, 0, 1,
-2.488484, -1.226099, -1.467155, 1, 0.05490196, 0, 1,
-2.48419, 0.6204554, 0.6143222, 1, 0.05882353, 0, 1,
-2.435746, 1.081947, -1.636322, 1, 0.06666667, 0, 1,
-2.415332, 0.3031888, -0.9840991, 1, 0.07058824, 0, 1,
-2.330724, -1.487408, -2.783533, 1, 0.07843138, 0, 1,
-2.326054, 0.5624154, -1.032462, 1, 0.08235294, 0, 1,
-2.25316, 0.5772908, -0.8666697, 1, 0.09019608, 0, 1,
-2.213464, -0.1455448, -1.810858, 1, 0.09411765, 0, 1,
-2.211907, 0.549946, -1.756591, 1, 0.1019608, 0, 1,
-2.19277, 0.00110881, -2.284198, 1, 0.1098039, 0, 1,
-2.140811, -0.8522367, -0.6510475, 1, 0.1137255, 0, 1,
-2.109454, -0.9650487, -2.398612, 1, 0.1215686, 0, 1,
-2.105884, 1.698913, -2.446554, 1, 0.1254902, 0, 1,
-2.081405, -1.018063, -1.517913, 1, 0.1333333, 0, 1,
-2.07222, 1.03929, -1.42291, 1, 0.1372549, 0, 1,
-2.066732, 1.949296, 0.346861, 1, 0.145098, 0, 1,
-2.001078, 0.7868543, -2.436085, 1, 0.1490196, 0, 1,
-1.994505, -1.366237, -2.671113, 1, 0.1568628, 0, 1,
-1.961439, -2.366644, -2.308665, 1, 0.1607843, 0, 1,
-1.954006, -0.1784124, -2.864061, 1, 0.1686275, 0, 1,
-1.929432, 0.04669401, -0.1665145, 1, 0.172549, 0, 1,
-1.919741, -0.6327611, 0.820311, 1, 0.1803922, 0, 1,
-1.913326, -1.0515, -2.398476, 1, 0.1843137, 0, 1,
-1.892553, 0.7304769, -1.475028, 1, 0.1921569, 0, 1,
-1.880844, 0.07438698, 0.6354002, 1, 0.1960784, 0, 1,
-1.87966, -0.5281848, -1.614448, 1, 0.2039216, 0, 1,
-1.869098, 1.59843, 0.729278, 1, 0.2117647, 0, 1,
-1.867156, -1.479645, -3.291472, 1, 0.2156863, 0, 1,
-1.839629, -0.5260794, -3.010267, 1, 0.2235294, 0, 1,
-1.831943, -0.5915359, -2.027895, 1, 0.227451, 0, 1,
-1.819808, -1.040467, -1.528471, 1, 0.2352941, 0, 1,
-1.818848, 1.043715, -2.025972, 1, 0.2392157, 0, 1,
-1.786393, -0.4139219, -4.372047, 1, 0.2470588, 0, 1,
-1.786191, -0.7900919, -1.624471, 1, 0.2509804, 0, 1,
-1.770621, 0.6151413, -1.78766, 1, 0.2588235, 0, 1,
-1.764977, -0.9565424, -3.699592, 1, 0.2627451, 0, 1,
-1.764829, 1.097606, -2.044087, 1, 0.2705882, 0, 1,
-1.733577, 0.3518852, -0.8926933, 1, 0.2745098, 0, 1,
-1.722746, -2.249476, -2.47807, 1, 0.282353, 0, 1,
-1.709579, -0.7512219, -2.278654, 1, 0.2862745, 0, 1,
-1.701377, -0.09486539, -0.53241, 1, 0.2941177, 0, 1,
-1.678067, 0.2255092, -1.493637, 1, 0.3019608, 0, 1,
-1.677399, 0.05924756, -1.129857, 1, 0.3058824, 0, 1,
-1.676016, 0.0412728, -0.6711956, 1, 0.3137255, 0, 1,
-1.670432, -0.2084696, -1.05332, 1, 0.3176471, 0, 1,
-1.670411, -0.06153438, -1.652123, 1, 0.3254902, 0, 1,
-1.668136, -0.2175405, -1.654987, 1, 0.3294118, 0, 1,
-1.663842, -1.774412, -1.160433, 1, 0.3372549, 0, 1,
-1.64879, -0.09687816, -1.750015, 1, 0.3411765, 0, 1,
-1.643909, 0.2824254, -0.5535852, 1, 0.3490196, 0, 1,
-1.634524, -0.4590113, -3.563443, 1, 0.3529412, 0, 1,
-1.631734, 1.438355, -1.018836, 1, 0.3607843, 0, 1,
-1.623615, 0.8501602, 0.7956665, 1, 0.3647059, 0, 1,
-1.598591, 0.504205, -0.3775145, 1, 0.372549, 0, 1,
-1.58723, -0.2642672, -1.301111, 1, 0.3764706, 0, 1,
-1.58078, 0.2164487, -0.9436633, 1, 0.3843137, 0, 1,
-1.573353, -0.4412695, -2.259527, 1, 0.3882353, 0, 1,
-1.572628, -0.06232909, -2.82248, 1, 0.3960784, 0, 1,
-1.571661, 0.3468744, -1.040689, 1, 0.4039216, 0, 1,
-1.567859, -0.04481801, -1.943897, 1, 0.4078431, 0, 1,
-1.564654, 1.384631, -0.9886987, 1, 0.4156863, 0, 1,
-1.562135, -0.9093193, -3.094325, 1, 0.4196078, 0, 1,
-1.536772, 1.002489, -0.4104801, 1, 0.427451, 0, 1,
-1.51897, 0.6421701, -1.266853, 1, 0.4313726, 0, 1,
-1.503296, -1.167054, -2.284447, 1, 0.4392157, 0, 1,
-1.499849, 0.3052103, -1.226849, 1, 0.4431373, 0, 1,
-1.491926, 0.5279233, 0.2933019, 1, 0.4509804, 0, 1,
-1.490229, -1.647864, -2.188765, 1, 0.454902, 0, 1,
-1.487307, -0.7865914, -1.451549, 1, 0.4627451, 0, 1,
-1.486314, -0.2654956, -1.340886, 1, 0.4666667, 0, 1,
-1.479776, -1.086555, -1.532832, 1, 0.4745098, 0, 1,
-1.459793, -0.5423561, -0.6073585, 1, 0.4784314, 0, 1,
-1.454994, 0.9753615, -1.351755, 1, 0.4862745, 0, 1,
-1.453504, -1.108761, -1.115517, 1, 0.4901961, 0, 1,
-1.430664, 0.3981799, -0.5563918, 1, 0.4980392, 0, 1,
-1.426384, 0.700168, 0.4520178, 1, 0.5058824, 0, 1,
-1.422148, -0.5516426, -0.9470875, 1, 0.509804, 0, 1,
-1.418936, 0.6016842, -0.816914, 1, 0.5176471, 0, 1,
-1.418661, 1.361767, 0.2836298, 1, 0.5215687, 0, 1,
-1.406151, 1.056696, -0.4797547, 1, 0.5294118, 0, 1,
-1.402578, 1.423093, -1.355459, 1, 0.5333334, 0, 1,
-1.397185, -0.4356022, -1.669858, 1, 0.5411765, 0, 1,
-1.384832, 0.6858646, -0.786621, 1, 0.5450981, 0, 1,
-1.381079, -0.4913768, -1.531176, 1, 0.5529412, 0, 1,
-1.368137, -1.038517, -1.686413, 1, 0.5568628, 0, 1,
-1.363672, -0.7840357, -1.430138, 1, 0.5647059, 0, 1,
-1.348826, -1.210602, -3.839477, 1, 0.5686275, 0, 1,
-1.33178, 2.280892, -1.3791, 1, 0.5764706, 0, 1,
-1.326631, -0.684708, -2.509864, 1, 0.5803922, 0, 1,
-1.321025, 1.423852, -1.2656, 1, 0.5882353, 0, 1,
-1.307903, -0.2392827, -3.013335, 1, 0.5921569, 0, 1,
-1.304468, -0.5927728, -3.865833, 1, 0.6, 0, 1,
-1.298087, 1.644636, -0.7105163, 1, 0.6078432, 0, 1,
-1.296027, 1.017153, -0.266015, 1, 0.6117647, 0, 1,
-1.288138, 1.213499, -0.01017859, 1, 0.6196079, 0, 1,
-1.274941, 0.6912212, -1.827401, 1, 0.6235294, 0, 1,
-1.272307, 0.5743715, -2.297386, 1, 0.6313726, 0, 1,
-1.269101, 1.314709, 0.789296, 1, 0.6352941, 0, 1,
-1.267215, 0.6407996, -1.624916, 1, 0.6431373, 0, 1,
-1.247675, -0.08218365, -1.172454, 1, 0.6470588, 0, 1,
-1.239781, -0.703325, -2.19034, 1, 0.654902, 0, 1,
-1.228866, -0.01126445, -3.763121, 1, 0.6588235, 0, 1,
-1.228866, -1.004386, -1.667781, 1, 0.6666667, 0, 1,
-1.220648, -0.005739271, -2.084893, 1, 0.6705883, 0, 1,
-1.220351, -1.712988, -3.041704, 1, 0.6784314, 0, 1,
-1.212672, -0.7582143, -1.62799, 1, 0.682353, 0, 1,
-1.211905, 0.2465789, -1.143992, 1, 0.6901961, 0, 1,
-1.21147, 0.706098, -1.105164, 1, 0.6941177, 0, 1,
-1.202758, 1.209133, 0.3002458, 1, 0.7019608, 0, 1,
-1.197426, -0.2749402, -2.893574, 1, 0.7098039, 0, 1,
-1.196361, -0.7190672, -2.041748, 1, 0.7137255, 0, 1,
-1.196295, -0.8061672, -2.643369, 1, 0.7215686, 0, 1,
-1.188071, -0.6716009, -1.274423, 1, 0.7254902, 0, 1,
-1.178432, -2.097122, -2.728884, 1, 0.7333333, 0, 1,
-1.171761, 0.88254, -1.420009, 1, 0.7372549, 0, 1,
-1.166457, 0.8165265, -3.005006, 1, 0.7450981, 0, 1,
-1.165015, -0.7442722, -3.305311, 1, 0.7490196, 0, 1,
-1.157051, 0.05812271, -0.8796964, 1, 0.7568628, 0, 1,
-1.156898, 0.3944815, 0.2987232, 1, 0.7607843, 0, 1,
-1.155815, 0.6906703, -3.412095, 1, 0.7686275, 0, 1,
-1.149421, -0.2427066, -2.372556, 1, 0.772549, 0, 1,
-1.143498, -0.03167307, -1.637517, 1, 0.7803922, 0, 1,
-1.131646, -2.104886, -3.034086, 1, 0.7843137, 0, 1,
-1.128454, -0.8267853, -1.753662, 1, 0.7921569, 0, 1,
-1.124586, 0.1694187, -0.5487866, 1, 0.7960784, 0, 1,
-1.119574, -1.204402, -3.130604, 1, 0.8039216, 0, 1,
-1.119001, 0.335797, -0.3331885, 1, 0.8117647, 0, 1,
-1.112974, -0.4763879, -1.467034, 1, 0.8156863, 0, 1,
-1.110792, 0.4744185, -3.154096, 1, 0.8235294, 0, 1,
-1.107445, -1.792143, -4.097287, 1, 0.827451, 0, 1,
-1.106868, -0.1610901, -1.560598, 1, 0.8352941, 0, 1,
-1.103005, 1.292798, -1.157281, 1, 0.8392157, 0, 1,
-1.101474, -1.251888, -2.627838, 1, 0.8470588, 0, 1,
-1.099222, -0.1200624, -0.9931502, 1, 0.8509804, 0, 1,
-1.09886, -0.1159682, -2.454489, 1, 0.8588235, 0, 1,
-1.098272, 0.5057122, -0.7169393, 1, 0.8627451, 0, 1,
-1.098188, -0.04134001, -1.315077, 1, 0.8705882, 0, 1,
-1.09688, 0.9112979, -1.304585, 1, 0.8745098, 0, 1,
-1.087786, -0.9748825, -2.065088, 1, 0.8823529, 0, 1,
-1.087167, 0.12913, -0.7108723, 1, 0.8862745, 0, 1,
-1.08281, -1.193411, -4.248102, 1, 0.8941177, 0, 1,
-1.079558, -0.880092, -2.809806, 1, 0.8980392, 0, 1,
-1.079269, 1.986005, -0.4638431, 1, 0.9058824, 0, 1,
-1.074341, -0.7827917, -2.306903, 1, 0.9137255, 0, 1,
-1.073717, -0.4655687, -2.85856, 1, 0.9176471, 0, 1,
-1.072824, 0.1142671, -1.887684, 1, 0.9254902, 0, 1,
-1.070049, -0.2782898, -3.942966, 1, 0.9294118, 0, 1,
-1.069443, 0.376275, -0.2484807, 1, 0.9372549, 0, 1,
-1.066622, -0.5311604, -3.481866, 1, 0.9411765, 0, 1,
-1.064561, -0.45507, -2.356352, 1, 0.9490196, 0, 1,
-1.041941, -1.364971, -1.056581, 1, 0.9529412, 0, 1,
-1.040364, -0.4624674, -2.76134, 1, 0.9607843, 0, 1,
-1.037011, -0.4496762, -1.081904, 1, 0.9647059, 0, 1,
-1.033546, -0.2940488, -2.769295, 1, 0.972549, 0, 1,
-1.027295, -0.5725229, -2.835422, 1, 0.9764706, 0, 1,
-1.00875, -0.4246541, -3.851403, 1, 0.9843137, 0, 1,
-1.002227, -1.562083, -3.060304, 1, 0.9882353, 0, 1,
-0.9974899, -0.9833117, -2.411245, 1, 0.9960784, 0, 1,
-0.9922439, -0.4813697, -1.649937, 0.9960784, 1, 0, 1,
-0.9921259, -1.655308, -1.419394, 0.9921569, 1, 0, 1,
-0.9817941, -1.330998, -2.46598, 0.9843137, 1, 0, 1,
-0.9809014, -0.2463118, -4.024619, 0.9803922, 1, 0, 1,
-0.9807847, -0.6494629, -4.404148, 0.972549, 1, 0, 1,
-0.9769674, -0.3647893, -2.01689, 0.9686275, 1, 0, 1,
-0.9758553, 0.7768835, -0.5425705, 0.9607843, 1, 0, 1,
-0.9744281, -0.1090629, -1.811006, 0.9568627, 1, 0, 1,
-0.9690537, -0.9901412, -2.613864, 0.9490196, 1, 0, 1,
-0.9643334, -0.1543239, 0.04444581, 0.945098, 1, 0, 1,
-0.9624413, 0.5333102, -0.8190737, 0.9372549, 1, 0, 1,
-0.9605649, -0.6294255, -2.457196, 0.9333333, 1, 0, 1,
-0.9603872, -0.4615982, -2.450297, 0.9254902, 1, 0, 1,
-0.9569015, 0.1739154, -0.7398399, 0.9215686, 1, 0, 1,
-0.9557766, 0.1453661, -1.022623, 0.9137255, 1, 0, 1,
-0.9537752, 1.200386, 0.08707319, 0.9098039, 1, 0, 1,
-0.9516785, -1.048195, -1.323779, 0.9019608, 1, 0, 1,
-0.9451844, 0.1923046, 0.1306351, 0.8941177, 1, 0, 1,
-0.9396881, 0.3872092, -0.6621671, 0.8901961, 1, 0, 1,
-0.938553, 0.3579619, -1.144956, 0.8823529, 1, 0, 1,
-0.9379525, 0.1387832, -0.140047, 0.8784314, 1, 0, 1,
-0.9378229, -0.1321451, -0.9993427, 0.8705882, 1, 0, 1,
-0.9362912, 0.5396335, -1.133893, 0.8666667, 1, 0, 1,
-0.9362454, 0.3605079, -2.522216, 0.8588235, 1, 0, 1,
-0.9279805, 0.02594918, -0.8101058, 0.854902, 1, 0, 1,
-0.9250388, 1.469123, -0.4179308, 0.8470588, 1, 0, 1,
-0.9208415, 0.1821238, -1.682284, 0.8431373, 1, 0, 1,
-0.9136584, 0.4102986, -1.43572, 0.8352941, 1, 0, 1,
-0.9091098, 1.239661, -0.3463427, 0.8313726, 1, 0, 1,
-0.9059582, -0.2590163, -2.621194, 0.8235294, 1, 0, 1,
-0.8954765, 0.01102852, -1.695435, 0.8196079, 1, 0, 1,
-0.885049, -2.085836, -1.442474, 0.8117647, 1, 0, 1,
-0.8774641, -2.09392, -3.032667, 0.8078431, 1, 0, 1,
-0.876241, 0.7755713, -0.6846855, 0.8, 1, 0, 1,
-0.8708404, 0.6074747, -0.08548201, 0.7921569, 1, 0, 1,
-0.8679771, -0.9575963, -1.744266, 0.7882353, 1, 0, 1,
-0.8671019, 2.080181, -1.449433, 0.7803922, 1, 0, 1,
-0.8538311, 1.448154, -1.489753, 0.7764706, 1, 0, 1,
-0.8519453, 0.8000057, -0.143484, 0.7686275, 1, 0, 1,
-0.8472903, 1.749224, -0.2325887, 0.7647059, 1, 0, 1,
-0.8428422, 0.3575815, 0.2421445, 0.7568628, 1, 0, 1,
-0.8328562, -1.549013, -1.174603, 0.7529412, 1, 0, 1,
-0.8281265, -1.218585, -1.663331, 0.7450981, 1, 0, 1,
-0.8220102, 1.010763, -1.097114, 0.7411765, 1, 0, 1,
-0.8214745, -1.040544, -1.657163, 0.7333333, 1, 0, 1,
-0.8142229, -0.6221654, -2.388496, 0.7294118, 1, 0, 1,
-0.8061076, -0.8611096, -3.919449, 0.7215686, 1, 0, 1,
-0.8042723, -1.078093, -0.751193, 0.7176471, 1, 0, 1,
-0.8018286, 0.7189125, 0.1738921, 0.7098039, 1, 0, 1,
-0.799184, -3.021856, -2.92345, 0.7058824, 1, 0, 1,
-0.7849547, -0.5098113, -1.998989, 0.6980392, 1, 0, 1,
-0.781632, -0.8673562, -2.678464, 0.6901961, 1, 0, 1,
-0.7787249, 0.5676853, -2.058127, 0.6862745, 1, 0, 1,
-0.7781668, -0.9519895, -2.009469, 0.6784314, 1, 0, 1,
-0.7681131, -0.701246, -3.424946, 0.6745098, 1, 0, 1,
-0.7666383, 1.967846, 0.9408953, 0.6666667, 1, 0, 1,
-0.7650542, -0.7525611, -1.358234, 0.6627451, 1, 0, 1,
-0.7636705, 0.7365779, -1.590864, 0.654902, 1, 0, 1,
-0.7572579, -0.1356892, -2.531803, 0.6509804, 1, 0, 1,
-0.7554349, -0.4195534, -2.926137, 0.6431373, 1, 0, 1,
-0.7544875, 1.626271, -1.484161, 0.6392157, 1, 0, 1,
-0.7501478, 0.1097779, -1.027165, 0.6313726, 1, 0, 1,
-0.7486441, 0.3592855, -1.69859, 0.627451, 1, 0, 1,
-0.7476183, -0.2217921, -1.740291, 0.6196079, 1, 0, 1,
-0.7462502, 0.4961037, -1.446325, 0.6156863, 1, 0, 1,
-0.7443007, 1.127495, -2.013874, 0.6078432, 1, 0, 1,
-0.7275431, 0.02587007, -0.9435913, 0.6039216, 1, 0, 1,
-0.7259676, 0.1403343, -0.9600579, 0.5960785, 1, 0, 1,
-0.7186357, 2.0345, -1.455945, 0.5882353, 1, 0, 1,
-0.7170553, -0.3440758, -2.358819, 0.5843138, 1, 0, 1,
-0.7170379, -1.052898, -4.238036, 0.5764706, 1, 0, 1,
-0.7169322, -0.0417286, -2.562866, 0.572549, 1, 0, 1,
-0.716086, 2.255669, 0.9000683, 0.5647059, 1, 0, 1,
-0.7156082, -0.525066, -1.758964, 0.5607843, 1, 0, 1,
-0.712477, 0.3280919, -1.755819, 0.5529412, 1, 0, 1,
-0.7114607, -2.171881, -3.414655, 0.5490196, 1, 0, 1,
-0.7095323, 1.573746, -0.06412122, 0.5411765, 1, 0, 1,
-0.707187, -1.318611, -3.399856, 0.5372549, 1, 0, 1,
-0.7030499, -0.4185185, -2.375493, 0.5294118, 1, 0, 1,
-0.6915285, 0.06430928, -2.223135, 0.5254902, 1, 0, 1,
-0.688251, 1.465974, -1.123417, 0.5176471, 1, 0, 1,
-0.6848494, 0.8216008, -0.6201823, 0.5137255, 1, 0, 1,
-0.6847432, 0.5471298, -1.524189, 0.5058824, 1, 0, 1,
-0.6764156, 0.4288836, -0.2906587, 0.5019608, 1, 0, 1,
-0.6742433, 0.02981206, -2.924787, 0.4941176, 1, 0, 1,
-0.6732585, 0.2893119, -1.824219, 0.4862745, 1, 0, 1,
-0.6726192, 0.9890288, -0.9870219, 0.4823529, 1, 0, 1,
-0.6665904, -1.508826, -3.984233, 0.4745098, 1, 0, 1,
-0.6653707, -2.004866, -1.672401, 0.4705882, 1, 0, 1,
-0.6629847, -0.4803489, -2.922885, 0.4627451, 1, 0, 1,
-0.6627306, -0.2330914, -0.9618218, 0.4588235, 1, 0, 1,
-0.6619042, -0.564247, -2.856465, 0.4509804, 1, 0, 1,
-0.6527272, 0.2391998, 0.5769011, 0.4470588, 1, 0, 1,
-0.6501741, 0.4681023, 0.5337608, 0.4392157, 1, 0, 1,
-0.6500502, -1.178866, -2.414414, 0.4352941, 1, 0, 1,
-0.6493739, -0.8536835, -3.608046, 0.427451, 1, 0, 1,
-0.6473924, -0.848267, -2.355206, 0.4235294, 1, 0, 1,
-0.6465322, -0.7614821, -1.834767, 0.4156863, 1, 0, 1,
-0.6358702, 0.1179512, -1.937507, 0.4117647, 1, 0, 1,
-0.6344139, -0.3722894, -1.533118, 0.4039216, 1, 0, 1,
-0.6196451, 1.440601, -0.9038885, 0.3960784, 1, 0, 1,
-0.6166613, -0.9826691, -1.167578, 0.3921569, 1, 0, 1,
-0.6133683, -0.4118118, -1.277522, 0.3843137, 1, 0, 1,
-0.6100586, -0.4522573, -2.176626, 0.3803922, 1, 0, 1,
-0.6082401, 0.1041631, -2.379333, 0.372549, 1, 0, 1,
-0.6055102, 0.2543855, -1.646535, 0.3686275, 1, 0, 1,
-0.6052314, -1.007441, -1.107486, 0.3607843, 1, 0, 1,
-0.601693, -1.432473, -3.673281, 0.3568628, 1, 0, 1,
-0.6008407, -0.5563198, -3.419501, 0.3490196, 1, 0, 1,
-0.6004042, 0.1134376, -0.2592722, 0.345098, 1, 0, 1,
-0.599221, -1.130303, -2.200173, 0.3372549, 1, 0, 1,
-0.5812757, -0.5702716, -3.874495, 0.3333333, 1, 0, 1,
-0.5810458, 0.3363968, -2.001922, 0.3254902, 1, 0, 1,
-0.5769483, -0.8662995, -1.992003, 0.3215686, 1, 0, 1,
-0.5732837, -0.05682613, -1.326486, 0.3137255, 1, 0, 1,
-0.5713106, 1.102597, 0.733462, 0.3098039, 1, 0, 1,
-0.5636354, 0.2449896, -0.9669376, 0.3019608, 1, 0, 1,
-0.5607908, 0.2450772, -1.518605, 0.2941177, 1, 0, 1,
-0.556702, 1.403826, -0.04130198, 0.2901961, 1, 0, 1,
-0.5545739, 2.845117, -0.6996754, 0.282353, 1, 0, 1,
-0.549535, 1.123764, -1.659566, 0.2784314, 1, 0, 1,
-0.5479869, -1.179667, -3.379103, 0.2705882, 1, 0, 1,
-0.547053, -0.5232143, -3.634205, 0.2666667, 1, 0, 1,
-0.5401443, -1.801597, -2.892943, 0.2588235, 1, 0, 1,
-0.5355816, 0.9514838, 0.73554, 0.254902, 1, 0, 1,
-0.5355502, 1.576607, -1.22497, 0.2470588, 1, 0, 1,
-0.5330095, 0.09874453, -1.436052, 0.2431373, 1, 0, 1,
-0.5274999, 0.02693444, -1.322062, 0.2352941, 1, 0, 1,
-0.5255896, -0.5438571, -3.256628, 0.2313726, 1, 0, 1,
-0.5235922, -0.04666479, -2.823721, 0.2235294, 1, 0, 1,
-0.5223342, 0.9756528, 0.5587882, 0.2196078, 1, 0, 1,
-0.5186401, 0.1294055, -0.2939679, 0.2117647, 1, 0, 1,
-0.5141292, 0.5527596, -1.683835, 0.2078431, 1, 0, 1,
-0.5138767, -0.8330056, -4.369365, 0.2, 1, 0, 1,
-0.510811, 0.8771764, -1.724337, 0.1921569, 1, 0, 1,
-0.5088591, 0.8725912, -0.6486511, 0.1882353, 1, 0, 1,
-0.5071355, -1.450368, -3.906914, 0.1803922, 1, 0, 1,
-0.5052014, -1.209341, -1.506865, 0.1764706, 1, 0, 1,
-0.4977916, -1.68311, -2.846722, 0.1686275, 1, 0, 1,
-0.4912568, 0.04540722, -2.899143, 0.1647059, 1, 0, 1,
-0.4859884, 1.256715, -0.5772889, 0.1568628, 1, 0, 1,
-0.4857182, -0.1270064, -1.871996, 0.1529412, 1, 0, 1,
-0.4853893, -0.486867, -3.048972, 0.145098, 1, 0, 1,
-0.481828, 0.009167744, -0.5334139, 0.1411765, 1, 0, 1,
-0.4818223, 1.396209, 0.9479463, 0.1333333, 1, 0, 1,
-0.4770502, -0.817059, -3.745846, 0.1294118, 1, 0, 1,
-0.4761321, -0.9878914, -2.233124, 0.1215686, 1, 0, 1,
-0.4739863, 0.06909897, 0.83018, 0.1176471, 1, 0, 1,
-0.4723819, 1.669599, 1.429478, 0.1098039, 1, 0, 1,
-0.4700501, 0.4787211, -0.7668638, 0.1058824, 1, 0, 1,
-0.4662237, -0.7732387, -3.761058, 0.09803922, 1, 0, 1,
-0.4661063, -0.7508097, -1.719907, 0.09019608, 1, 0, 1,
-0.461929, 2.125653, 0.1990579, 0.08627451, 1, 0, 1,
-0.4591385, 0.8704348, -1.233253, 0.07843138, 1, 0, 1,
-0.4585664, -1.296861, -2.347352, 0.07450981, 1, 0, 1,
-0.4572298, -0.5674919, -3.799917, 0.06666667, 1, 0, 1,
-0.4518597, 0.01404069, -2.393668, 0.0627451, 1, 0, 1,
-0.4476607, -2.09041, -3.636056, 0.05490196, 1, 0, 1,
-0.4445197, 0.57202, -1.909108, 0.05098039, 1, 0, 1,
-0.4411205, 0.8502033, 0.2187043, 0.04313726, 1, 0, 1,
-0.4321173, 1.237744, -1.412208, 0.03921569, 1, 0, 1,
-0.4307244, -1.246402, -2.927936, 0.03137255, 1, 0, 1,
-0.4193435, -0.6695662, -1.724199, 0.02745098, 1, 0, 1,
-0.4179082, -1.359574, -2.729043, 0.01960784, 1, 0, 1,
-0.4173998, 0.617983, -0.3081404, 0.01568628, 1, 0, 1,
-0.4148239, 0.935761, -1.319391, 0.007843138, 1, 0, 1,
-0.4135451, 0.2047146, -0.8407477, 0.003921569, 1, 0, 1,
-0.4107633, -0.04843899, -1.917684, 0, 1, 0.003921569, 1,
-0.4073722, -1.371668, -2.92218, 0, 1, 0.01176471, 1,
-0.406207, -0.277411, -0.3583646, 0, 1, 0.01568628, 1,
-0.4060731, 0.6341991, -1.545875, 0, 1, 0.02352941, 1,
-0.4007593, -0.1540108, -2.732493, 0, 1, 0.02745098, 1,
-0.3975092, -0.3603702, -1.707254, 0, 1, 0.03529412, 1,
-0.3970936, -0.9172099, -1.67189, 0, 1, 0.03921569, 1,
-0.3954704, 1.119298, 0.9959642, 0, 1, 0.04705882, 1,
-0.3942025, -0.2562082, -2.958467, 0, 1, 0.05098039, 1,
-0.3822818, -0.5187843, -3.884581, 0, 1, 0.05882353, 1,
-0.3819384, 0.04507742, -2.374057, 0, 1, 0.0627451, 1,
-0.3818603, 1.794176, -0.2107769, 0, 1, 0.07058824, 1,
-0.3813372, -0.8233554, -1.292342, 0, 1, 0.07450981, 1,
-0.3746482, -1.070295, -2.478374, 0, 1, 0.08235294, 1,
-0.3725999, -1.540651, -2.233525, 0, 1, 0.08627451, 1,
-0.37226, 1.542929, -1.014776, 0, 1, 0.09411765, 1,
-0.3714224, -0.7555112, -3.838617, 0, 1, 0.1019608, 1,
-0.3711478, 1.129926, 1.166502, 0, 1, 0.1058824, 1,
-0.3681694, -0.7699277, -2.370672, 0, 1, 0.1137255, 1,
-0.3668087, -0.1371706, -0.6471093, 0, 1, 0.1176471, 1,
-0.3667395, -1.508892, -2.073489, 0, 1, 0.1254902, 1,
-0.3627426, 0.2521226, -2.33825, 0, 1, 0.1294118, 1,
-0.3591493, -0.4039017, -3.149679, 0, 1, 0.1372549, 1,
-0.3586008, -0.3575559, -2.21746, 0, 1, 0.1411765, 1,
-0.3561713, 0.2346266, 0.1578563, 0, 1, 0.1490196, 1,
-0.3502066, 1.496652, -0.3079239, 0, 1, 0.1529412, 1,
-0.3497215, -0.1491995, -0.7492547, 0, 1, 0.1607843, 1,
-0.3439147, -0.183095, -2.32498, 0, 1, 0.1647059, 1,
-0.3429615, -0.3181834, -1.785893, 0, 1, 0.172549, 1,
-0.3353259, 0.5521893, -1.616858, 0, 1, 0.1764706, 1,
-0.3301089, -0.1577874, -2.760659, 0, 1, 0.1843137, 1,
-0.3249987, -0.1267771, -0.4259999, 0, 1, 0.1882353, 1,
-0.3234356, 0.2204357, -1.688346, 0, 1, 0.1960784, 1,
-0.3180006, -0.7767996, -1.396353, 0, 1, 0.2039216, 1,
-0.3168632, -0.3703721, -0.2434902, 0, 1, 0.2078431, 1,
-0.3135861, 0.4183261, -2.119706, 0, 1, 0.2156863, 1,
-0.3123089, -0.02451119, -1.317078, 0, 1, 0.2196078, 1,
-0.309397, -0.3089119, -3.017223, 0, 1, 0.227451, 1,
-0.3074266, -1.278233, -3.500949, 0, 1, 0.2313726, 1,
-0.3073856, -0.218928, -1.189891, 0, 1, 0.2392157, 1,
-0.3051664, -2.61179, -3.000726, 0, 1, 0.2431373, 1,
-0.3037751, -0.1222993, -1.949396, 0, 1, 0.2509804, 1,
-0.3027705, -1.358116, -1.338663, 0, 1, 0.254902, 1,
-0.3023385, -1.264675, -2.508134, 0, 1, 0.2627451, 1,
-0.3011548, -0.04028109, -1.29597, 0, 1, 0.2666667, 1,
-0.2957921, -1.016374, -2.719393, 0, 1, 0.2745098, 1,
-0.2944202, -1.5028, -2.670671, 0, 1, 0.2784314, 1,
-0.2939105, 0.9463932, 0.6865982, 0, 1, 0.2862745, 1,
-0.2899905, 1.179314, -0.9776479, 0, 1, 0.2901961, 1,
-0.2897238, 0.3744807, -1.595795, 0, 1, 0.2980392, 1,
-0.2892871, -0.8623944, -3.154164, 0, 1, 0.3058824, 1,
-0.2856331, -1.128799, -2.575752, 0, 1, 0.3098039, 1,
-0.2851577, -2.353595, -1.28018, 0, 1, 0.3176471, 1,
-0.282148, 0.1911874, -0.1118031, 0, 1, 0.3215686, 1,
-0.2809328, -1.067512, -3.821201, 0, 1, 0.3294118, 1,
-0.2779201, 1.094435, -0.2333665, 0, 1, 0.3333333, 1,
-0.2746321, -0.6853385, -1.931701, 0, 1, 0.3411765, 1,
-0.2730416, 0.9287073, -2.834355, 0, 1, 0.345098, 1,
-0.272851, -1.587689, -2.468397, 0, 1, 0.3529412, 1,
-0.270171, -0.6569502, -1.71947, 0, 1, 0.3568628, 1,
-0.2699496, 0.03589022, -4.571353, 0, 1, 0.3647059, 1,
-0.2697942, 0.7838942, -2.695028, 0, 1, 0.3686275, 1,
-0.2683513, 0.1488964, -2.645571, 0, 1, 0.3764706, 1,
-0.267813, 2.386172, -0.5466574, 0, 1, 0.3803922, 1,
-0.2675269, 1.643128, -1.16507, 0, 1, 0.3882353, 1,
-0.2631785, 0.4096276, -1.722947, 0, 1, 0.3921569, 1,
-0.257634, -0.1760074, -0.9065729, 0, 1, 0.4, 1,
-0.256837, 0.3478453, -0.8992693, 0, 1, 0.4078431, 1,
-0.2535372, -0.7492766, -1.75849, 0, 1, 0.4117647, 1,
-0.2509441, 0.08652795, -0.9619625, 0, 1, 0.4196078, 1,
-0.2501271, -0.2510116, -1.949879, 0, 1, 0.4235294, 1,
-0.2424642, 0.7877068, -1.30621, 0, 1, 0.4313726, 1,
-0.2422461, 1.232859, -0.9671057, 0, 1, 0.4352941, 1,
-0.2412578, 0.3676754, 0.5059111, 0, 1, 0.4431373, 1,
-0.2384082, 0.004142408, -1.931759, 0, 1, 0.4470588, 1,
-0.2368396, 0.07110666, 0.174815, 0, 1, 0.454902, 1,
-0.235697, 2.115186, -1.311891, 0, 1, 0.4588235, 1,
-0.2355037, 1.641322, 0.4392777, 0, 1, 0.4666667, 1,
-0.2325549, -0.89397, -2.696642, 0, 1, 0.4705882, 1,
-0.2321354, -1.257722, -4.067227, 0, 1, 0.4784314, 1,
-0.2306108, 1.289311, 1.281072, 0, 1, 0.4823529, 1,
-0.2293629, -1.047131, -2.335335, 0, 1, 0.4901961, 1,
-0.2289891, -0.8331355, -2.224391, 0, 1, 0.4941176, 1,
-0.2227294, -0.9617793, -3.989066, 0, 1, 0.5019608, 1,
-0.2219096, 2.046548, -0.7037672, 0, 1, 0.509804, 1,
-0.2177221, 1.266443, 0.7844156, 0, 1, 0.5137255, 1,
-0.2141939, 0.03094401, -0.2748128, 0, 1, 0.5215687, 1,
-0.2117564, 1.347352, 0.3189963, 0, 1, 0.5254902, 1,
-0.2095973, -0.9513671, -2.655994, 0, 1, 0.5333334, 1,
-0.2065944, 0.6530443, -3.665765, 0, 1, 0.5372549, 1,
-0.2053575, 2.362001, -0.4098088, 0, 1, 0.5450981, 1,
-0.2024531, -0.8056899, -1.752918, 0, 1, 0.5490196, 1,
-0.1995676, -0.5314463, -4.173591, 0, 1, 0.5568628, 1,
-0.1926631, -0.1946861, -2.706324, 0, 1, 0.5607843, 1,
-0.1844309, -0.8376696, -2.793098, 0, 1, 0.5686275, 1,
-0.1838745, 0.8624252, 0.2746006, 0, 1, 0.572549, 1,
-0.1834538, -1.970259, -4.256743, 0, 1, 0.5803922, 1,
-0.1826812, 0.7660064, 1.286252, 0, 1, 0.5843138, 1,
-0.1802054, -0.1793332, -2.751375, 0, 1, 0.5921569, 1,
-0.1787773, 0.5346095, -1.768426, 0, 1, 0.5960785, 1,
-0.1786381, 0.2682372, -1.766355, 0, 1, 0.6039216, 1,
-0.1698112, 0.8766172, -1.019583, 0, 1, 0.6117647, 1,
-0.165825, -0.02002842, -0.8978562, 0, 1, 0.6156863, 1,
-0.1548654, 0.04334074, -0.1049211, 0, 1, 0.6235294, 1,
-0.151967, -1.427555, -2.576832, 0, 1, 0.627451, 1,
-0.1498774, -0.09507587, -1.680271, 0, 1, 0.6352941, 1,
-0.1454981, -0.9409822, -2.500871, 0, 1, 0.6392157, 1,
-0.1449791, 0.1495467, -1.413682, 0, 1, 0.6470588, 1,
-0.1447737, 0.252278, -0.6009317, 0, 1, 0.6509804, 1,
-0.1420513, -1.099094, -2.284119, 0, 1, 0.6588235, 1,
-0.1354115, 0.2110467, -1.02436, 0, 1, 0.6627451, 1,
-0.1347378, -0.3098279, -2.76142, 0, 1, 0.6705883, 1,
-0.1335908, -1.374558, -3.914529, 0, 1, 0.6745098, 1,
-0.131047, -0.2455949, -2.902195, 0, 1, 0.682353, 1,
-0.1258753, 0.8070444, 1.238873, 0, 1, 0.6862745, 1,
-0.1243324, 1.100538, 0.145697, 0, 1, 0.6941177, 1,
-0.1239408, -2.224043, -2.267892, 0, 1, 0.7019608, 1,
-0.123145, -0.2428167, -3.024485, 0, 1, 0.7058824, 1,
-0.1160394, 0.296366, -0.46085, 0, 1, 0.7137255, 1,
-0.1082316, 0.4867002, 0.7680726, 0, 1, 0.7176471, 1,
-0.1077043, -1.957293, -3.774241, 0, 1, 0.7254902, 1,
-0.1049757, -0.4551303, -3.660802, 0, 1, 0.7294118, 1,
-0.1011785, -0.3556078, -2.545324, 0, 1, 0.7372549, 1,
-0.0956241, 0.702243, 0.5814746, 0, 1, 0.7411765, 1,
-0.09461772, 1.714597, -0.9429471, 0, 1, 0.7490196, 1,
-0.08805167, -1.529634, -2.052979, 0, 1, 0.7529412, 1,
-0.08787508, 0.4198083, -0.7242005, 0, 1, 0.7607843, 1,
-0.08163685, -0.130391, -2.227117, 0, 1, 0.7647059, 1,
-0.07855459, -0.6627151, -2.711251, 0, 1, 0.772549, 1,
-0.07480469, 0.8029531, -3.216469e-05, 0, 1, 0.7764706, 1,
-0.07082136, -0.1779212, -1.831568, 0, 1, 0.7843137, 1,
-0.06697234, -0.971015, -0.3544996, 0, 1, 0.7882353, 1,
-0.06333492, -0.4317789, -3.548818, 0, 1, 0.7960784, 1,
-0.05833395, 0.6673771, 0.02295132, 0, 1, 0.8039216, 1,
-0.05827951, -0.552815, -5.024809, 0, 1, 0.8078431, 1,
-0.05637752, 0.1202348, 0.2413477, 0, 1, 0.8156863, 1,
-0.04670649, 1.520305, -0.1056973, 0, 1, 0.8196079, 1,
-0.04603613, -0.1054294, -2.792715, 0, 1, 0.827451, 1,
-0.04596858, -1.234891, -1.330369, 0, 1, 0.8313726, 1,
-0.04185913, 0.5596623, -0.9280797, 0, 1, 0.8392157, 1,
-0.04168723, -0.6269254, -1.623231, 0, 1, 0.8431373, 1,
-0.04156704, 1.355982, -0.8109752, 0, 1, 0.8509804, 1,
-0.03586931, 0.1340828, -1.943917, 0, 1, 0.854902, 1,
-0.02981325, -0.6510296, -2.81545, 0, 1, 0.8627451, 1,
-0.02947149, 0.1393449, -0.5108062, 0, 1, 0.8666667, 1,
-0.02651482, -1.806194, -2.497953, 0, 1, 0.8745098, 1,
-0.02595382, 0.3534816, 2.796721, 0, 1, 0.8784314, 1,
-0.02491489, 0.5957055, -0.1164651, 0, 1, 0.8862745, 1,
-0.02367054, 0.2350278, 0.5909076, 0, 1, 0.8901961, 1,
-0.0214627, 0.1728893, 0.4393764, 0, 1, 0.8980392, 1,
-0.0206323, -0.372311, -3.245539, 0, 1, 0.9058824, 1,
-0.01196687, -1.995924, -4.792935, 0, 1, 0.9098039, 1,
-0.007086372, 1.03837, 1.531648, 0, 1, 0.9176471, 1,
-0.002014316, -0.7092957, -2.203396, 0, 1, 0.9215686, 1,
-0.001598515, -1.198131, -5.009643, 0, 1, 0.9294118, 1,
-0.001163434, 0.8660881, 2.254912, 0, 1, 0.9333333, 1,
0.00195167, 1.467191, -0.8590527, 0, 1, 0.9411765, 1,
0.003092682, -0.6378945, 2.758412, 0, 1, 0.945098, 1,
0.006654104, 0.2674111, -0.850301, 0, 1, 0.9529412, 1,
0.007429443, -0.2569512, 2.552372, 0, 1, 0.9568627, 1,
0.007908954, 1.689754, -0.4649334, 0, 1, 0.9647059, 1,
0.008620554, 0.5051437, -0.5459134, 0, 1, 0.9686275, 1,
0.008821583, -0.9055433, 3.642044, 0, 1, 0.9764706, 1,
0.01006993, 0.2648458, -0.5742553, 0, 1, 0.9803922, 1,
0.01252934, 0.7269812, 2.073235, 0, 1, 0.9882353, 1,
0.01289179, -0.591127, 2.160065, 0, 1, 0.9921569, 1,
0.01806728, 0.9903421, 0.05829813, 0, 1, 1, 1,
0.01890674, -0.8670855, 2.619513, 0, 0.9921569, 1, 1,
0.02772573, -1.352841, 1.559408, 0, 0.9882353, 1, 1,
0.03001729, 0.06728091, 0.933411, 0, 0.9803922, 1, 1,
0.03069056, -0.5792111, 2.496928, 0, 0.9764706, 1, 1,
0.03097361, -0.76153, 2.976682, 0, 0.9686275, 1, 1,
0.03114026, 1.116327, 0.1285576, 0, 0.9647059, 1, 1,
0.03141122, -0.6318336, 4.394329, 0, 0.9568627, 1, 1,
0.03396555, -0.3959461, 1.373439, 0, 0.9529412, 1, 1,
0.03744745, 1.904902, -2.060554, 0, 0.945098, 1, 1,
0.03942727, -1.199271, 3.159918, 0, 0.9411765, 1, 1,
0.04114656, 1.086286, 2.175623, 0, 0.9333333, 1, 1,
0.04470776, -0.7166759, 2.419209, 0, 0.9294118, 1, 1,
0.04473422, -1.293624, 2.166372, 0, 0.9215686, 1, 1,
0.04893813, 0.2781712, 0.2635515, 0, 0.9176471, 1, 1,
0.04904143, -0.2828396, 3.657938, 0, 0.9098039, 1, 1,
0.04999942, -0.3231924, 2.914821, 0, 0.9058824, 1, 1,
0.05062568, 0.9577352, -0.2803695, 0, 0.8980392, 1, 1,
0.05288073, -1.459269, 3.079008, 0, 0.8901961, 1, 1,
0.05472302, 1.819427, -0.4491377, 0, 0.8862745, 1, 1,
0.05519328, 0.5503443, 0.7742921, 0, 0.8784314, 1, 1,
0.05564369, -0.3957172, 3.701201, 0, 0.8745098, 1, 1,
0.05658672, 0.5061771, -1.726848, 0, 0.8666667, 1, 1,
0.05767324, -0.1297662, 2.635646, 0, 0.8627451, 1, 1,
0.06040974, -1.510543, 3.228418, 0, 0.854902, 1, 1,
0.0619816, -2.11914, 4.020838, 0, 0.8509804, 1, 1,
0.0644858, 0.3413959, -0.6741622, 0, 0.8431373, 1, 1,
0.06566413, -0.2151462, 0.6543723, 0, 0.8392157, 1, 1,
0.07273011, -0.4115272, 4.0377, 0, 0.8313726, 1, 1,
0.08014293, -0.9947022, 2.88502, 0, 0.827451, 1, 1,
0.08472426, -1.372182, 3.846322, 0, 0.8196079, 1, 1,
0.08716007, -0.302291, 3.138745, 0, 0.8156863, 1, 1,
0.08900668, -0.8161839, 3.354602, 0, 0.8078431, 1, 1,
0.08973282, -0.1104238, 3.151151, 0, 0.8039216, 1, 1,
0.09155601, -0.7093903, 3.670115, 0, 0.7960784, 1, 1,
0.09390951, 0.4046928, -0.5208431, 0, 0.7882353, 1, 1,
0.09449188, -1.913672, 3.820995, 0, 0.7843137, 1, 1,
0.09659055, -0.1956895, 4.931948, 0, 0.7764706, 1, 1,
0.1048925, -1.04344, 3.3443, 0, 0.772549, 1, 1,
0.1070175, -0.001044106, 1.623414, 0, 0.7647059, 1, 1,
0.1106806, 1.176539, 0.7131361, 0, 0.7607843, 1, 1,
0.1131891, -0.4064527, 2.302244, 0, 0.7529412, 1, 1,
0.1136681, 1.988528, -1.369897, 0, 0.7490196, 1, 1,
0.1146658, -0.07458908, 3.447791, 0, 0.7411765, 1, 1,
0.1153958, 1.374677, 2.187404, 0, 0.7372549, 1, 1,
0.1189761, 0.612067, -0.2652712, 0, 0.7294118, 1, 1,
0.128047, 0.5736747, -0.9008357, 0, 0.7254902, 1, 1,
0.1382239, 1.816572, -1.687977, 0, 0.7176471, 1, 1,
0.1386023, 0.954506, 1.303216, 0, 0.7137255, 1, 1,
0.141074, 1.931296, 0.1630855, 0, 0.7058824, 1, 1,
0.1453911, -1.494473, 4.819526, 0, 0.6980392, 1, 1,
0.1457658, -0.7481664, 3.112848, 0, 0.6941177, 1, 1,
0.1462552, 0.6610549, 0.2206381, 0, 0.6862745, 1, 1,
0.1465622, -2.026762, 4.081183, 0, 0.682353, 1, 1,
0.146828, -0.2026565, 2.825041, 0, 0.6745098, 1, 1,
0.1585808, -0.54168, 3.054803, 0, 0.6705883, 1, 1,
0.160312, 2.158569, -0.5395112, 0, 0.6627451, 1, 1,
0.1648879, -1.24878, 2.12778, 0, 0.6588235, 1, 1,
0.1718133, 0.4032815, 0.964532, 0, 0.6509804, 1, 1,
0.1721452, 1.155363, -0.593196, 0, 0.6470588, 1, 1,
0.1773293, 0.7849475, 0.5405353, 0, 0.6392157, 1, 1,
0.1822578, -1.507162, 3.353364, 0, 0.6352941, 1, 1,
0.1896155, -0.7825235, 3.885539, 0, 0.627451, 1, 1,
0.1904998, -0.7759731, 1.002256, 0, 0.6235294, 1, 1,
0.1912002, 2.457016, 0.1041914, 0, 0.6156863, 1, 1,
0.1939788, 1.326736, -0.440474, 0, 0.6117647, 1, 1,
0.2011643, -0.3266656, 3.180947, 0, 0.6039216, 1, 1,
0.202544, -0.3451996, 2.724998, 0, 0.5960785, 1, 1,
0.2029646, -0.944975, 2.837939, 0, 0.5921569, 1, 1,
0.2054648, 0.1647488, 3.197796, 0, 0.5843138, 1, 1,
0.2060487, 0.1564429, 1.04748, 0, 0.5803922, 1, 1,
0.2081984, -0.1877484, 2.611487, 0, 0.572549, 1, 1,
0.2101686, -0.2408419, 1.406225, 0, 0.5686275, 1, 1,
0.210639, 0.6484828, 0.05552361, 0, 0.5607843, 1, 1,
0.2120599, -0.9768376, 2.821473, 0, 0.5568628, 1, 1,
0.2123134, -0.3988616, 3.987594, 0, 0.5490196, 1, 1,
0.2186885, -0.007912403, 2.119867, 0, 0.5450981, 1, 1,
0.2232297, 0.1346193, 0.03157776, 0, 0.5372549, 1, 1,
0.2234992, 1.706114, -1.078975, 0, 0.5333334, 1, 1,
0.2265981, -0.8767133, 3.758671, 0, 0.5254902, 1, 1,
0.2336228, -0.2185395, 3.162663, 0, 0.5215687, 1, 1,
0.2338464, 0.3318626, -0.1109844, 0, 0.5137255, 1, 1,
0.2541796, 1.446968, -1.083477, 0, 0.509804, 1, 1,
0.2558666, -0.3926511, 0.8062064, 0, 0.5019608, 1, 1,
0.2580568, 1.374564, 0.1655867, 0, 0.4941176, 1, 1,
0.2605536, -0.1290574, 2.208866, 0, 0.4901961, 1, 1,
0.2620449, -0.3269401, 1.799479, 0, 0.4823529, 1, 1,
0.2625241, 0.684666, 0.5663547, 0, 0.4784314, 1, 1,
0.2632116, 1.567478, -0.1138326, 0, 0.4705882, 1, 1,
0.2681448, 0.340385, -1.252855, 0, 0.4666667, 1, 1,
0.2728001, -1.504405, 4.292057, 0, 0.4588235, 1, 1,
0.2733484, 0.8213018, 1.671053, 0, 0.454902, 1, 1,
0.2767911, 0.4145256, 1.192035, 0, 0.4470588, 1, 1,
0.2827793, -0.008100751, -2.588185, 0, 0.4431373, 1, 1,
0.2832127, 0.05245312, 2.173617, 0, 0.4352941, 1, 1,
0.2841662, 0.0246965, 0.2227049, 0, 0.4313726, 1, 1,
0.2912531, 0.4808032, 2.270597, 0, 0.4235294, 1, 1,
0.2912552, 0.912982, 1.110074, 0, 0.4196078, 1, 1,
0.2956102, -1.741085, 5.875104, 0, 0.4117647, 1, 1,
0.2986965, 0.7234012, -0.2565975, 0, 0.4078431, 1, 1,
0.3002626, 1.211376, 0.2606481, 0, 0.4, 1, 1,
0.3005791, 0.289193, -0.5589191, 0, 0.3921569, 1, 1,
0.3013083, 0.2967838, 0.4306946, 0, 0.3882353, 1, 1,
0.3015546, -0.86712, 2.805364, 0, 0.3803922, 1, 1,
0.304929, 0.823074, 0.2633666, 0, 0.3764706, 1, 1,
0.3053187, 0.3085764, 0.6860746, 0, 0.3686275, 1, 1,
0.3062626, -1.313935, 3.397018, 0, 0.3647059, 1, 1,
0.3143104, -0.04291647, 1.375975, 0, 0.3568628, 1, 1,
0.3156014, -1.382742, 2.776558, 0, 0.3529412, 1, 1,
0.3166547, -0.09616338, 2.241128, 0, 0.345098, 1, 1,
0.3182076, 0.3855574, 1.016419, 0, 0.3411765, 1, 1,
0.3194667, 1.287171, 1.410053, 0, 0.3333333, 1, 1,
0.3196689, 0.9102668, 0.2724471, 0, 0.3294118, 1, 1,
0.3272167, 2.070508, -1.688701, 0, 0.3215686, 1, 1,
0.3294404, -2.517775, 3.19279, 0, 0.3176471, 1, 1,
0.3356528, 0.6147711, 0.5668765, 0, 0.3098039, 1, 1,
0.3364893, 1.306761, 0.8570139, 0, 0.3058824, 1, 1,
0.3392342, 0.4584701, 0.5487245, 0, 0.2980392, 1, 1,
0.3485236, 1.706948, 0.6530915, 0, 0.2901961, 1, 1,
0.3527747, -0.5425425, 3.113885, 0, 0.2862745, 1, 1,
0.3552883, 0.6440891, 2.741779, 0, 0.2784314, 1, 1,
0.3579267, -0.2569054, 3.086732, 0, 0.2745098, 1, 1,
0.3600841, -1.116327, 3.785717, 0, 0.2666667, 1, 1,
0.3609922, 1.15334, -2.291122, 0, 0.2627451, 1, 1,
0.361414, 0.9176332, 2.210644, 0, 0.254902, 1, 1,
0.3652838, -0.2318066, 1.301323, 0, 0.2509804, 1, 1,
0.3675548, -0.1702289, 3.324967, 0, 0.2431373, 1, 1,
0.3717615, 0.03640692, 1.961298, 0, 0.2392157, 1, 1,
0.3791091, 1.006963, -0.0538494, 0, 0.2313726, 1, 1,
0.3797449, 0.8459969, 1.010818, 0, 0.227451, 1, 1,
0.3802834, 0.2812295, 1.053641, 0, 0.2196078, 1, 1,
0.3831493, 2.514881, -0.972908, 0, 0.2156863, 1, 1,
0.3836327, -0.1412118, 0.8535991, 0, 0.2078431, 1, 1,
0.383789, 2.156556, -0.02148546, 0, 0.2039216, 1, 1,
0.3854169, 1.363642, 0.09114712, 0, 0.1960784, 1, 1,
0.3869633, -1.126843, 4.271745, 0, 0.1882353, 1, 1,
0.3879131, 0.5340863, 1.354838, 0, 0.1843137, 1, 1,
0.391974, 0.3262921, 0.4271561, 0, 0.1764706, 1, 1,
0.3988884, 0.141174, 1.200204, 0, 0.172549, 1, 1,
0.4009863, 1.084049, -1.794716, 0, 0.1647059, 1, 1,
0.4048286, 0.574919, 0.06112585, 0, 0.1607843, 1, 1,
0.4061486, 1.185739, 0.9316821, 0, 0.1529412, 1, 1,
0.407293, -0.05226893, 1.32033, 0, 0.1490196, 1, 1,
0.4076628, 0.2617508, 0.7653357, 0, 0.1411765, 1, 1,
0.4151495, -0.4667021, 1.639645, 0, 0.1372549, 1, 1,
0.4152933, -0.6108609, 3.13902, 0, 0.1294118, 1, 1,
0.4192741, 0.8943937, -0.7261649, 0, 0.1254902, 1, 1,
0.4246526, 0.6276228, -0.2113275, 0, 0.1176471, 1, 1,
0.4247507, -0.8915253, 1.547019, 0, 0.1137255, 1, 1,
0.4272948, 0.01774029, 3.360706, 0, 0.1058824, 1, 1,
0.4346076, 0.8302749, 1.716308, 0, 0.09803922, 1, 1,
0.4354574, -0.9785382, 2.635237, 0, 0.09411765, 1, 1,
0.4394893, -0.3990002, 2.278794, 0, 0.08627451, 1, 1,
0.4418938, 1.46799, 0.7915664, 0, 0.08235294, 1, 1,
0.4437315, -1.527043, 4.576708, 0, 0.07450981, 1, 1,
0.4462449, 0.3612849, 1.199759, 0, 0.07058824, 1, 1,
0.4476264, -0.6353966, 3.890645, 0, 0.0627451, 1, 1,
0.4479201, -1.028532, 2.555333, 0, 0.05882353, 1, 1,
0.4504194, -0.01873044, 1.764325, 0, 0.05098039, 1, 1,
0.4506067, -1.043639, 1.423187, 0, 0.04705882, 1, 1,
0.4540897, -0.434375, 1.022213, 0, 0.03921569, 1, 1,
0.4686452, 0.07906577, 2.065174, 0, 0.03529412, 1, 1,
0.4694923, -0.8897293, 2.209049, 0, 0.02745098, 1, 1,
0.4714957, 1.081217, 1.602875, 0, 0.02352941, 1, 1,
0.4719591, 0.5991665, -0.5570239, 0, 0.01568628, 1, 1,
0.4721297, -0.01583409, 2.357875, 0, 0.01176471, 1, 1,
0.4729285, 0.3483379, 0.8925573, 0, 0.003921569, 1, 1,
0.4740826, -1.498955, 2.264715, 0.003921569, 0, 1, 1,
0.4746665, 0.2530015, 2.103754, 0.007843138, 0, 1, 1,
0.4785276, -0.09077758, 1.904434, 0.01568628, 0, 1, 1,
0.4788041, -0.7890664, 2.160156, 0.01960784, 0, 1, 1,
0.480317, -0.6089141, 0.7844722, 0.02745098, 0, 1, 1,
0.4817096, -1.661695, 5.159169, 0.03137255, 0, 1, 1,
0.4874626, 0.3986732, 1.028461, 0.03921569, 0, 1, 1,
0.488279, 0.3733423, 1.173219, 0.04313726, 0, 1, 1,
0.4911344, 1.828818, -0.02270517, 0.05098039, 0, 1, 1,
0.4917868, -1.464537, 2.073902, 0.05490196, 0, 1, 1,
0.4945999, -1.064288, 2.934729, 0.0627451, 0, 1, 1,
0.4972507, -1.697033, 4.581972, 0.06666667, 0, 1, 1,
0.5029443, -1.957994, 2.556577, 0.07450981, 0, 1, 1,
0.5096024, 0.1702428, 0.7667333, 0.07843138, 0, 1, 1,
0.510972, -0.983218, 2.294642, 0.08627451, 0, 1, 1,
0.5130321, 0.07798894, 0.7121103, 0.09019608, 0, 1, 1,
0.5164493, 0.6995488, -0.2233729, 0.09803922, 0, 1, 1,
0.5169649, -1.183905, 3.576284, 0.1058824, 0, 1, 1,
0.5193099, 1.352581, 0.4419167, 0.1098039, 0, 1, 1,
0.5209891, -0.4647537, -0.1383826, 0.1176471, 0, 1, 1,
0.5338209, 0.846676, 0.4413709, 0.1215686, 0, 1, 1,
0.5437829, -1.159259, 1.895241, 0.1294118, 0, 1, 1,
0.5486056, 0.2853125, 3.536781, 0.1333333, 0, 1, 1,
0.5494369, -0.4282295, 1.426869, 0.1411765, 0, 1, 1,
0.5521941, -1.361763, 2.740828, 0.145098, 0, 1, 1,
0.552923, 0.08046558, -0.02152801, 0.1529412, 0, 1, 1,
0.5540647, 0.2623886, 1.278212, 0.1568628, 0, 1, 1,
0.5552137, 0.8786265, 1.567333, 0.1647059, 0, 1, 1,
0.5596553, 2.101209, -1.144209, 0.1686275, 0, 1, 1,
0.5616335, -1.06834, 1.873918, 0.1764706, 0, 1, 1,
0.5633348, -0.08741626, 2.664745, 0.1803922, 0, 1, 1,
0.5656599, 0.5953228, 0.4391196, 0.1882353, 0, 1, 1,
0.5668738, 0.2969639, 0.6675338, 0.1921569, 0, 1, 1,
0.5702467, -1.093175, 2.487046, 0.2, 0, 1, 1,
0.5770483, 1.760338, 0.254789, 0.2078431, 0, 1, 1,
0.5782417, 0.5838839, 1.151749, 0.2117647, 0, 1, 1,
0.5842357, -1.395325, 4.180471, 0.2196078, 0, 1, 1,
0.5859182, 0.4447972, 2.605541, 0.2235294, 0, 1, 1,
0.5896531, 0.2938794, 1.291812, 0.2313726, 0, 1, 1,
0.5931419, 0.2627886, 2.778303, 0.2352941, 0, 1, 1,
0.5975178, 0.1831441, 1.843711, 0.2431373, 0, 1, 1,
0.5993326, 1.139565, 0.8220893, 0.2470588, 0, 1, 1,
0.6052116, 0.8050981, 0.04385779, 0.254902, 0, 1, 1,
0.6055461, -0.5421314, 1.614204, 0.2588235, 0, 1, 1,
0.6090891, 0.6077166, 0.6290184, 0.2666667, 0, 1, 1,
0.6130484, 0.03538947, 3.865918, 0.2705882, 0, 1, 1,
0.6207905, -0.181054, 0.9416137, 0.2784314, 0, 1, 1,
0.621955, 0.4124389, -0.9635056, 0.282353, 0, 1, 1,
0.6282105, -0.418582, 1.592881, 0.2901961, 0, 1, 1,
0.6282287, 0.3017282, 1.780336, 0.2941177, 0, 1, 1,
0.6315866, 0.2213115, 3.466524, 0.3019608, 0, 1, 1,
0.6379727, -1.207658, 1.014819, 0.3098039, 0, 1, 1,
0.6437715, 0.7613436, 2.149054, 0.3137255, 0, 1, 1,
0.6442723, 1.658926, 0.7066512, 0.3215686, 0, 1, 1,
0.6457826, 0.7123731, 1.013417, 0.3254902, 0, 1, 1,
0.6471201, -1.002848, 1.910636, 0.3333333, 0, 1, 1,
0.6486598, 0.5830254, -1.732746, 0.3372549, 0, 1, 1,
0.6487023, -0.8190491, 3.194206, 0.345098, 0, 1, 1,
0.6606486, 0.2425485, -1.126983, 0.3490196, 0, 1, 1,
0.6610074, 0.005071444, 2.21627, 0.3568628, 0, 1, 1,
0.6661285, 0.6540848, 0.858577, 0.3607843, 0, 1, 1,
0.6698542, 1.6989, 1.535768, 0.3686275, 0, 1, 1,
0.6721669, 1.122401, -0.8136228, 0.372549, 0, 1, 1,
0.6724738, -1.160335, 2.694116, 0.3803922, 0, 1, 1,
0.6768728, 0.5988462, 0.1941283, 0.3843137, 0, 1, 1,
0.6841601, -0.169892, 2.148595, 0.3921569, 0, 1, 1,
0.6853624, -0.9322447, 2.049917, 0.3960784, 0, 1, 1,
0.68625, 0.6357421, 1.044755, 0.4039216, 0, 1, 1,
0.690473, -0.3429593, 2.284045, 0.4117647, 0, 1, 1,
0.7041517, 1.027524, -1.680383, 0.4156863, 0, 1, 1,
0.7119288, -2.005782, 1.821759, 0.4235294, 0, 1, 1,
0.7159073, 0.9766315, 1.45878, 0.427451, 0, 1, 1,
0.7197996, 0.2469554, 1.961503, 0.4352941, 0, 1, 1,
0.7273999, -0.1115589, 3.15461, 0.4392157, 0, 1, 1,
0.7308646, -0.3983989, 0.8959682, 0.4470588, 0, 1, 1,
0.7329438, -0.6377445, 2.074897, 0.4509804, 0, 1, 1,
0.7430003, -0.5834275, 1.916865, 0.4588235, 0, 1, 1,
0.7482588, -0.1143593, 2.107753, 0.4627451, 0, 1, 1,
0.751909, -0.780061, 2.426052, 0.4705882, 0, 1, 1,
0.7548709, -0.2983778, 1.848894, 0.4745098, 0, 1, 1,
0.7570146, 0.3376197, 0.525686, 0.4823529, 0, 1, 1,
0.7679809, 1.242003, 1.545909, 0.4862745, 0, 1, 1,
0.7727142, -1.250179, 0.8547357, 0.4941176, 0, 1, 1,
0.7731195, -0.9017047, 3.325122, 0.5019608, 0, 1, 1,
0.7738132, 0.9780067, 0.4911637, 0.5058824, 0, 1, 1,
0.774362, 2.548754, -1.141112, 0.5137255, 0, 1, 1,
0.7744648, 0.6078756, 0.802879, 0.5176471, 0, 1, 1,
0.7764801, 0.7471914, 1.815737, 0.5254902, 0, 1, 1,
0.7770622, 1.136894, 2.162256, 0.5294118, 0, 1, 1,
0.7801492, -0.7930737, 1.244378, 0.5372549, 0, 1, 1,
0.7806369, -0.2184775, 1.218031, 0.5411765, 0, 1, 1,
0.7875602, -0.7841181, 3.223367, 0.5490196, 0, 1, 1,
0.7972825, 0.3578499, 0.7930606, 0.5529412, 0, 1, 1,
0.7996884, 0.2810746, 1.30655, 0.5607843, 0, 1, 1,
0.8011085, -1.681354, 3.765921, 0.5647059, 0, 1, 1,
0.8012692, -1.221052, 2.886147, 0.572549, 0, 1, 1,
0.8015211, -1.823989, 3.14642, 0.5764706, 0, 1, 1,
0.8120229, -1.310938, 2.68932, 0.5843138, 0, 1, 1,
0.8131618, 0.9590237, 0.1426077, 0.5882353, 0, 1, 1,
0.8236179, -1.530092, 3.111203, 0.5960785, 0, 1, 1,
0.8260507, 0.4567433, 2.812489, 0.6039216, 0, 1, 1,
0.8283773, -2.230247, 3.417614, 0.6078432, 0, 1, 1,
0.8301459, -1.419099, 2.452117, 0.6156863, 0, 1, 1,
0.8324668, -0.05649378, 3.128063, 0.6196079, 0, 1, 1,
0.839987, -0.2835868, 1.681558, 0.627451, 0, 1, 1,
0.8486372, 0.4904158, 2.66785, 0.6313726, 0, 1, 1,
0.8492627, 0.6354224, -0.6768873, 0.6392157, 0, 1, 1,
0.8499067, -1.507209, 2.984764, 0.6431373, 0, 1, 1,
0.8515449, 0.408906, 0.5417813, 0.6509804, 0, 1, 1,
0.852221, -2.450273, 3.0201, 0.654902, 0, 1, 1,
0.8540456, 0.8865673, 2.4017, 0.6627451, 0, 1, 1,
0.8558804, -1.182244, -0.1257088, 0.6666667, 0, 1, 1,
0.8573889, 0.5677145, 2.546382, 0.6745098, 0, 1, 1,
0.8592132, -0.8357859, 2.192999, 0.6784314, 0, 1, 1,
0.860382, 1.400142, 1.180857, 0.6862745, 0, 1, 1,
0.8615549, -0.5274822, 1.997585, 0.6901961, 0, 1, 1,
0.8620885, -0.220577, 1.936704, 0.6980392, 0, 1, 1,
0.8758395, -0.09024065, 1.436327, 0.7058824, 0, 1, 1,
0.8761717, 1.486217, -0.1187648, 0.7098039, 0, 1, 1,
0.8803613, 0.7995289, 2.423668, 0.7176471, 0, 1, 1,
0.881003, -0.3376315, 3.215161, 0.7215686, 0, 1, 1,
0.8817121, -1.023167, 4.555067, 0.7294118, 0, 1, 1,
0.8826091, 0.05483381, 2.112497, 0.7333333, 0, 1, 1,
0.8830994, 1.074159, 2.493146, 0.7411765, 0, 1, 1,
0.8864127, -1.419504, 1.580594, 0.7450981, 0, 1, 1,
0.8869604, -0.1897835, 1.81198, 0.7529412, 0, 1, 1,
0.8872586, -1.530512, 1.405496, 0.7568628, 0, 1, 1,
0.8914459, -0.0636409, 1.635738, 0.7647059, 0, 1, 1,
0.8921102, -0.276207, 2.60585, 0.7686275, 0, 1, 1,
0.8942349, 0.4696123, 1.869632, 0.7764706, 0, 1, 1,
0.8987498, -0.1123915, 2.692221, 0.7803922, 0, 1, 1,
0.8994303, 1.320105, 1.150844, 0.7882353, 0, 1, 1,
0.9092395, 0.1414606, 1.068138, 0.7921569, 0, 1, 1,
0.9122429, 2.679815, -1.196812, 0.8, 0, 1, 1,
0.9156152, 0.6937219, 0.9994737, 0.8078431, 0, 1, 1,
0.9213242, 0.4957609, 1.883525, 0.8117647, 0, 1, 1,
0.9218705, -0.02707697, 2.566088, 0.8196079, 0, 1, 1,
0.9228801, 0.9468762, 1.362571, 0.8235294, 0, 1, 1,
0.9233701, 0.3202063, 0.9119682, 0.8313726, 0, 1, 1,
0.9254217, 0.7407407, 2.114961, 0.8352941, 0, 1, 1,
0.9297258, -0.6438814, 1.999009, 0.8431373, 0, 1, 1,
0.9419473, -0.8467765, 3.312982, 0.8470588, 0, 1, 1,
0.9422412, 1.788495, 0.3452223, 0.854902, 0, 1, 1,
0.9494309, -0.9994396, 3.131835, 0.8588235, 0, 1, 1,
0.9577373, 0.09100015, -1.399068, 0.8666667, 0, 1, 1,
0.9578114, -0.07605823, 0.3117537, 0.8705882, 0, 1, 1,
0.9671479, 1.777794, 0.07130553, 0.8784314, 0, 1, 1,
0.9708756, -2.676168, 2.398832, 0.8823529, 0, 1, 1,
0.974178, 1.239157, 0.1507132, 0.8901961, 0, 1, 1,
0.9769935, -1.743495, 1.409127, 0.8941177, 0, 1, 1,
0.9791364, 0.6097474, 1.564821, 0.9019608, 0, 1, 1,
0.9838885, 1.900329, 0.7513036, 0.9098039, 0, 1, 1,
0.9845779, 0.5973302, 0.3751862, 0.9137255, 0, 1, 1,
0.9874709, -1.036968, 2.443747, 0.9215686, 0, 1, 1,
1.00427, 1.183637, 2.320343, 0.9254902, 0, 1, 1,
1.011996, -1.215137, 3.562331, 0.9333333, 0, 1, 1,
1.022659, 0.5304391, 1.052519, 0.9372549, 0, 1, 1,
1.023911, 1.988461, -0.2245413, 0.945098, 0, 1, 1,
1.025573, -0.7065992, 1.364196, 0.9490196, 0, 1, 1,
1.025933, 0.1642239, 3.112045, 0.9568627, 0, 1, 1,
1.028006, -0.2150251, 2.550997, 0.9607843, 0, 1, 1,
1.036667, 1.175784, 2.79618, 0.9686275, 0, 1, 1,
1.036826, 0.4171424, -0.2434643, 0.972549, 0, 1, 1,
1.038077, 0.8101624, 1.873709, 0.9803922, 0, 1, 1,
1.038331, 0.1065913, 1.803593, 0.9843137, 0, 1, 1,
1.038836, -0.3597226, 1.185426, 0.9921569, 0, 1, 1,
1.040641, -1.374024, 2.361129, 0.9960784, 0, 1, 1,
1.041183, 0.08472861, 0.4056796, 1, 0, 0.9960784, 1,
1.042294, 0.2463792, 0.6195374, 1, 0, 0.9882353, 1,
1.042754, -1.147678, -0.1236397, 1, 0, 0.9843137, 1,
1.045735, -0.3161368, 1.530537, 1, 0, 0.9764706, 1,
1.051179, 1.224811, 0.3869804, 1, 0, 0.972549, 1,
1.055435, -0.4659477, 2.572068, 1, 0, 0.9647059, 1,
1.058894, 0.1506161, 1.639257, 1, 0, 0.9607843, 1,
1.063114, 0.8903402, 0.8373631, 1, 0, 0.9529412, 1,
1.063496, 1.150767, 0.2405817, 1, 0, 0.9490196, 1,
1.067362, 1.340086, -0.2157243, 1, 0, 0.9411765, 1,
1.069406, -0.6732811, 4.73703, 1, 0, 0.9372549, 1,
1.069496, 2.147137, -0.4518815, 1, 0, 0.9294118, 1,
1.06969, -0.2727319, 2.207873, 1, 0, 0.9254902, 1,
1.07257, 0.09980318, 0.3397019, 1, 0, 0.9176471, 1,
1.073186, 0.1178459, 0.6932628, 1, 0, 0.9137255, 1,
1.077563, -0.8089658, 2.499677, 1, 0, 0.9058824, 1,
1.078325, -0.3427771, 2.224726, 1, 0, 0.9019608, 1,
1.084388, -1.893726, 3.931099, 1, 0, 0.8941177, 1,
1.085067, 0.2469699, 0.554286, 1, 0, 0.8862745, 1,
1.089881, 0.8921276, -0.965935, 1, 0, 0.8823529, 1,
1.103623, -0.8826268, 1.689008, 1, 0, 0.8745098, 1,
1.107193, -0.544637, 1.363008, 1, 0, 0.8705882, 1,
1.110747, 1.192363, 2.850295, 1, 0, 0.8627451, 1,
1.130157, 1.663518, 0.9114193, 1, 0, 0.8588235, 1,
1.131764, 1.107485, 2.83273, 1, 0, 0.8509804, 1,
1.133958, 1.130721, 0.9140474, 1, 0, 0.8470588, 1,
1.139539, -0.06002434, 1.18292, 1, 0, 0.8392157, 1,
1.140802, -0.8057896, 1.976823, 1, 0, 0.8352941, 1,
1.143322, -0.1141982, 2.795478, 1, 0, 0.827451, 1,
1.154502, 1.364815, -0.06879009, 1, 0, 0.8235294, 1,
1.15575, 0.03331172, 1.425011, 1, 0, 0.8156863, 1,
1.156818, 1.270742, 0.2739745, 1, 0, 0.8117647, 1,
1.157503, -0.7761795, 2.238385, 1, 0, 0.8039216, 1,
1.157847, 0.6738393, 0.887158, 1, 0, 0.7960784, 1,
1.159345, -1.765264, 2.319724, 1, 0, 0.7921569, 1,
1.166097, 0.02273084, 1.115964, 1, 0, 0.7843137, 1,
1.171567, 0.6841817, 2.559843, 1, 0, 0.7803922, 1,
1.171729, 1.72392, 1.555972, 1, 0, 0.772549, 1,
1.173504, -0.1367251, 1.921941, 1, 0, 0.7686275, 1,
1.174163, 0.7633604, -1.761969, 1, 0, 0.7607843, 1,
1.177744, -0.3556634, 3.297334, 1, 0, 0.7568628, 1,
1.180008, -0.8196616, 2.36418, 1, 0, 0.7490196, 1,
1.181881, 0.4881643, 1.428758, 1, 0, 0.7450981, 1,
1.183182, 0.9741632, 0.6408747, 1, 0, 0.7372549, 1,
1.18563, 2.021881, 0.7454489, 1, 0, 0.7333333, 1,
1.185946, -0.06950057, 1.88506, 1, 0, 0.7254902, 1,
1.197426, -0.7877096, 1.332108, 1, 0, 0.7215686, 1,
1.198678, -0.5207375, 1.659042, 1, 0, 0.7137255, 1,
1.209934, 0.2566781, 1.54826, 1, 0, 0.7098039, 1,
1.212244, -0.330676, 1.682036, 1, 0, 0.7019608, 1,
1.215062, -0.0682, 0.3600166, 1, 0, 0.6941177, 1,
1.224462, 1.929945, 1.160537, 1, 0, 0.6901961, 1,
1.228274, -0.1360426, 0.3449121, 1, 0, 0.682353, 1,
1.238958, -0.8247809, 1.049709, 1, 0, 0.6784314, 1,
1.24018, -0.3103884, 1.351236, 1, 0, 0.6705883, 1,
1.240308, -0.2407103, 1.820278, 1, 0, 0.6666667, 1,
1.25192, 0.3351494, 3.361691, 1, 0, 0.6588235, 1,
1.258992, -1.252677, 3.760392, 1, 0, 0.654902, 1,
1.260385, 1.308996, 0.5979767, 1, 0, 0.6470588, 1,
1.26061, -1.39265, 1.378382, 1, 0, 0.6431373, 1,
1.269176, 0.6437208, 1.524233, 1, 0, 0.6352941, 1,
1.26949, -0.6195856, 2.155529, 1, 0, 0.6313726, 1,
1.270625, 0.2496374, 0.5159692, 1, 0, 0.6235294, 1,
1.276487, 1.368796, -0.1742523, 1, 0, 0.6196079, 1,
1.286853, -1.561277, 3.514101, 1, 0, 0.6117647, 1,
1.302653, 1.140725, 2.840171, 1, 0, 0.6078432, 1,
1.316381, 1.253513, 0.8805377, 1, 0, 0.6, 1,
1.323315, -0.3633963, 1.024954, 1, 0, 0.5921569, 1,
1.332605, 1.300846, -0.1060423, 1, 0, 0.5882353, 1,
1.351004, 0.2921315, 1.014212, 1, 0, 0.5803922, 1,
1.358842, -1.264029, 3.254045, 1, 0, 0.5764706, 1,
1.369325, -0.7669575, 2.348798, 1, 0, 0.5686275, 1,
1.370405, -0.8849747, 2.543355, 1, 0, 0.5647059, 1,
1.373124, -0.7839997, 3.309405, 1, 0, 0.5568628, 1,
1.375335, -0.0999706, 0.7535533, 1, 0, 0.5529412, 1,
1.376514, 0.5510252, 0.4308963, 1, 0, 0.5450981, 1,
1.37846, 0.2276243, 2.011079, 1, 0, 0.5411765, 1,
1.389116, -1.53052, 2.516324, 1, 0, 0.5333334, 1,
1.394806, -0.5100387, 2.352482, 1, 0, 0.5294118, 1,
1.464095, -1.475185, 1.906368, 1, 0, 0.5215687, 1,
1.468623, 0.4644634, 1.064085, 1, 0, 0.5176471, 1,
1.469283, 0.5452359, 2.668515, 1, 0, 0.509804, 1,
1.483573, 1.190102, 1.377456, 1, 0, 0.5058824, 1,
1.483921, 1.24013, -0.2884553, 1, 0, 0.4980392, 1,
1.509894, -0.730996, 2.303178, 1, 0, 0.4901961, 1,
1.512551, -0.9788895, 2.638638, 1, 0, 0.4862745, 1,
1.517154, -1.774624, 2.321726, 1, 0, 0.4784314, 1,
1.524758, -0.8192283, 0.6587155, 1, 0, 0.4745098, 1,
1.530398, -0.9238612, 2.502314, 1, 0, 0.4666667, 1,
1.535553, -0.6731077, 1.405047, 1, 0, 0.4627451, 1,
1.536364, 0.389906, 1.917328, 1, 0, 0.454902, 1,
1.545705, -0.004768435, -0.516233, 1, 0, 0.4509804, 1,
1.547363, -1.071746, 2.273795, 1, 0, 0.4431373, 1,
1.54882, -0.9714203, 3.056593, 1, 0, 0.4392157, 1,
1.577496, -0.7593958, 2.488008, 1, 0, 0.4313726, 1,
1.581754, -0.5743134, 2.725405, 1, 0, 0.427451, 1,
1.5828, -0.236321, 0.05293287, 1, 0, 0.4196078, 1,
1.609096, -1.033692, 2.958329, 1, 0, 0.4156863, 1,
1.620299, -0.5693017, 1.224899, 1, 0, 0.4078431, 1,
1.620696, -1.453709, 0.5618545, 1, 0, 0.4039216, 1,
1.634713, -0.4663755, 3.340334, 1, 0, 0.3960784, 1,
1.63844, -0.6242332, 1.700785, 1, 0, 0.3882353, 1,
1.643396, -1.397912, 2.807619, 1, 0, 0.3843137, 1,
1.644869, -0.7605058, 0.6807991, 1, 0, 0.3764706, 1,
1.651602, -0.7415245, 1.401747, 1, 0, 0.372549, 1,
1.655061, -1.416843, 2.962834, 1, 0, 0.3647059, 1,
1.657113, 1.549928, 0.4025635, 1, 0, 0.3607843, 1,
1.659549, 0.3871134, 0.6701049, 1, 0, 0.3529412, 1,
1.669347, -0.5436583, 1.590439, 1, 0, 0.3490196, 1,
1.694569, 0.04938853, 0.6736818, 1, 0, 0.3411765, 1,
1.71812, -0.7364895, 0.970533, 1, 0, 0.3372549, 1,
1.723603, 0.5447446, 2.179374, 1, 0, 0.3294118, 1,
1.724251, 2.024505, -0.1516409, 1, 0, 0.3254902, 1,
1.726528, -0.4104658, 2.516274, 1, 0, 0.3176471, 1,
1.732745, 0.6833285, 0.5166573, 1, 0, 0.3137255, 1,
1.736345, 0.4010524, 3.092597, 1, 0, 0.3058824, 1,
1.753086, 1.176229, 0.7372329, 1, 0, 0.2980392, 1,
1.759003, 0.07819132, 0.7772825, 1, 0, 0.2941177, 1,
1.777124, -2.284274, 0.8825496, 1, 0, 0.2862745, 1,
1.789419, 0.8911378, 1.923818, 1, 0, 0.282353, 1,
1.793031, -0.9541724, 1.871164, 1, 0, 0.2745098, 1,
1.819466, -0.778744, 2.419104, 1, 0, 0.2705882, 1,
1.84076, -0.3361793, 2.403996, 1, 0, 0.2627451, 1,
1.883645, -0.1169969, 1.353649, 1, 0, 0.2588235, 1,
1.89263, -0.5525285, 1.091322, 1, 0, 0.2509804, 1,
1.932488, 0.3127919, 2.053258, 1, 0, 0.2470588, 1,
1.950123, -0.2319993, 2.730068, 1, 0, 0.2392157, 1,
1.961555, 0.2160513, 2.175833, 1, 0, 0.2352941, 1,
2.009527, -1.711017, 2.194865, 1, 0, 0.227451, 1,
2.038675, -0.1919424, 1.233184, 1, 0, 0.2235294, 1,
2.048691, 0.2227504, -0.3079341, 1, 0, 0.2156863, 1,
2.052329, 0.7576134, -0.2988183, 1, 0, 0.2117647, 1,
2.06214, -1.059277, 3.207254, 1, 0, 0.2039216, 1,
2.065632, 1.090591, 1.007368, 1, 0, 0.1960784, 1,
2.076361, -0.357321, 1.641243, 1, 0, 0.1921569, 1,
2.121946, -0.586736, 2.20886, 1, 0, 0.1843137, 1,
2.122827, -0.5743256, 0.8686446, 1, 0, 0.1803922, 1,
2.142117, 0.2832724, 0.1119092, 1, 0, 0.172549, 1,
2.142665, 1.993164, 2.066108, 1, 0, 0.1686275, 1,
2.153362, 0.5520728, 0.15084, 1, 0, 0.1607843, 1,
2.15559, 1.056046, 1.055445, 1, 0, 0.1568628, 1,
2.158142, 0.6679641, 1.020427, 1, 0, 0.1490196, 1,
2.193196, -0.9168608, 1.060953, 1, 0, 0.145098, 1,
2.220051, -0.1956146, 0.939092, 1, 0, 0.1372549, 1,
2.23319, 2.514712, 1.031986, 1, 0, 0.1333333, 1,
2.248112, -0.2161323, 1.757192, 1, 0, 0.1254902, 1,
2.251203, -0.2405157, 1.125105, 1, 0, 0.1215686, 1,
2.292079, 0.9806911, 0.5152789, 1, 0, 0.1137255, 1,
2.298616, 1.662851, 1.200839, 1, 0, 0.1098039, 1,
2.324445, 1.536676, 1.476677, 1, 0, 0.1019608, 1,
2.373299, 0.03878792, 0.8395982, 1, 0, 0.09411765, 1,
2.410051, 0.6352188, 1.152919, 1, 0, 0.09019608, 1,
2.426554, 0.6817904, 1.537645, 1, 0, 0.08235294, 1,
2.447833, 0.2906691, 0.6268444, 1, 0, 0.07843138, 1,
2.461391, -0.4237017, 1.140415, 1, 0, 0.07058824, 1,
2.478333, 0.785079, 1.63398, 1, 0, 0.06666667, 1,
2.478998, 0.8696721, 0.3719376, 1, 0, 0.05882353, 1,
2.482383, 0.9295192, 0.2842631, 1, 0, 0.05490196, 1,
2.499714, 0.06222602, 1.202417, 1, 0, 0.04705882, 1,
2.519336, -0.1894015, 1.25517, 1, 0, 0.04313726, 1,
2.537103, -0.193145, 0.3895991, 1, 0, 0.03529412, 1,
2.666045, 1.103943, 1.252253, 1, 0, 0.03137255, 1,
2.842807, 2.149242, 1.729289, 1, 0, 0.02352941, 1,
2.845227, 1.303981, 2.941844, 1, 0, 0.01960784, 1,
3.49981, -0.3166982, 2.710476, 1, 0, 0.01176471, 1,
3.540164, 0.6947808, 2.048701, 1, 0, 0.007843138, 1
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
0.03388846, -4.016308, -6.872344, 0, -0.5, 0.5, 0.5,
0.03388846, -4.016308, -6.872344, 1, -0.5, 0.5, 0.5,
0.03388846, -4.016308, -6.872344, 1, 1.5, 0.5, 0.5,
0.03388846, -4.016308, -6.872344, 0, 1.5, 0.5, 0.5
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
-4.661015, -0.08836937, -6.872344, 0, -0.5, 0.5, 0.5,
-4.661015, -0.08836937, -6.872344, 1, -0.5, 0.5, 0.5,
-4.661015, -0.08836937, -6.872344, 1, 1.5, 0.5, 0.5,
-4.661015, -0.08836937, -6.872344, 0, 1.5, 0.5, 0.5
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
-4.661015, -4.016308, 0.4251473, 0, -0.5, 0.5, 0.5,
-4.661015, -4.016308, 0.4251473, 1, -0.5, 0.5, 0.5,
-4.661015, -4.016308, 0.4251473, 1, 1.5, 0.5, 0.5,
-4.661015, -4.016308, 0.4251473, 0, 1.5, 0.5, 0.5
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
-2, -3.109861, -5.188308,
2, -3.109861, -5.188308,
-2, -3.109861, -5.188308,
-2, -3.260935, -5.468981,
0, -3.109861, -5.188308,
0, -3.260935, -5.468981,
2, -3.109861, -5.188308,
2, -3.260935, -5.468981
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
"0",
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
-2, -3.563084, -6.030326, 0, -0.5, 0.5, 0.5,
-2, -3.563084, -6.030326, 1, -0.5, 0.5, 0.5,
-2, -3.563084, -6.030326, 1, 1.5, 0.5, 0.5,
-2, -3.563084, -6.030326, 0, 1.5, 0.5, 0.5,
0, -3.563084, -6.030326, 0, -0.5, 0.5, 0.5,
0, -3.563084, -6.030326, 1, -0.5, 0.5, 0.5,
0, -3.563084, -6.030326, 1, 1.5, 0.5, 0.5,
0, -3.563084, -6.030326, 0, 1.5, 0.5, 0.5,
2, -3.563084, -6.030326, 0, -0.5, 0.5, 0.5,
2, -3.563084, -6.030326, 1, -0.5, 0.5, 0.5,
2, -3.563084, -6.030326, 1, 1.5, 0.5, 0.5,
2, -3.563084, -6.030326, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.577576, -3, -5.188308,
-3.577576, 2, -5.188308,
-3.577576, -3, -5.188308,
-3.758149, -3, -5.468981,
-3.577576, -2, -5.188308,
-3.758149, -2, -5.468981,
-3.577576, -1, -5.188308,
-3.758149, -1, -5.468981,
-3.577576, 0, -5.188308,
-3.758149, 0, -5.468981,
-3.577576, 1, -5.188308,
-3.758149, 1, -5.468981,
-3.577576, 2, -5.188308,
-3.758149, 2, -5.468981
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
"2"
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
-4.119296, -3, -6.030326, 0, -0.5, 0.5, 0.5,
-4.119296, -3, -6.030326, 1, -0.5, 0.5, 0.5,
-4.119296, -3, -6.030326, 1, 1.5, 0.5, 0.5,
-4.119296, -3, -6.030326, 0, 1.5, 0.5, 0.5,
-4.119296, -2, -6.030326, 0, -0.5, 0.5, 0.5,
-4.119296, -2, -6.030326, 1, -0.5, 0.5, 0.5,
-4.119296, -2, -6.030326, 1, 1.5, 0.5, 0.5,
-4.119296, -2, -6.030326, 0, 1.5, 0.5, 0.5,
-4.119296, -1, -6.030326, 0, -0.5, 0.5, 0.5,
-4.119296, -1, -6.030326, 1, -0.5, 0.5, 0.5,
-4.119296, -1, -6.030326, 1, 1.5, 0.5, 0.5,
-4.119296, -1, -6.030326, 0, 1.5, 0.5, 0.5,
-4.119296, 0, -6.030326, 0, -0.5, 0.5, 0.5,
-4.119296, 0, -6.030326, 1, -0.5, 0.5, 0.5,
-4.119296, 0, -6.030326, 1, 1.5, 0.5, 0.5,
-4.119296, 0, -6.030326, 0, 1.5, 0.5, 0.5,
-4.119296, 1, -6.030326, 0, -0.5, 0.5, 0.5,
-4.119296, 1, -6.030326, 1, -0.5, 0.5, 0.5,
-4.119296, 1, -6.030326, 1, 1.5, 0.5, 0.5,
-4.119296, 1, -6.030326, 0, 1.5, 0.5, 0.5,
-4.119296, 2, -6.030326, 0, -0.5, 0.5, 0.5,
-4.119296, 2, -6.030326, 1, -0.5, 0.5, 0.5,
-4.119296, 2, -6.030326, 1, 1.5, 0.5, 0.5,
-4.119296, 2, -6.030326, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.577576, -3.109861, -4,
-3.577576, -3.109861, 4,
-3.577576, -3.109861, -4,
-3.758149, -3.260935, -4,
-3.577576, -3.109861, -2,
-3.758149, -3.260935, -2,
-3.577576, -3.109861, 0,
-3.758149, -3.260935, 0,
-3.577576, -3.109861, 2,
-3.758149, -3.260935, 2,
-3.577576, -3.109861, 4,
-3.758149, -3.260935, 4
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
-4.119296, -3.563084, -4, 0, -0.5, 0.5, 0.5,
-4.119296, -3.563084, -4, 1, -0.5, 0.5, 0.5,
-4.119296, -3.563084, -4, 1, 1.5, 0.5, 0.5,
-4.119296, -3.563084, -4, 0, 1.5, 0.5, 0.5,
-4.119296, -3.563084, -2, 0, -0.5, 0.5, 0.5,
-4.119296, -3.563084, -2, 1, -0.5, 0.5, 0.5,
-4.119296, -3.563084, -2, 1, 1.5, 0.5, 0.5,
-4.119296, -3.563084, -2, 0, 1.5, 0.5, 0.5,
-4.119296, -3.563084, 0, 0, -0.5, 0.5, 0.5,
-4.119296, -3.563084, 0, 1, -0.5, 0.5, 0.5,
-4.119296, -3.563084, 0, 1, 1.5, 0.5, 0.5,
-4.119296, -3.563084, 0, 0, 1.5, 0.5, 0.5,
-4.119296, -3.563084, 2, 0, -0.5, 0.5, 0.5,
-4.119296, -3.563084, 2, 1, -0.5, 0.5, 0.5,
-4.119296, -3.563084, 2, 1, 1.5, 0.5, 0.5,
-4.119296, -3.563084, 2, 0, 1.5, 0.5, 0.5,
-4.119296, -3.563084, 4, 0, -0.5, 0.5, 0.5,
-4.119296, -3.563084, 4, 1, -0.5, 0.5, 0.5,
-4.119296, -3.563084, 4, 1, 1.5, 0.5, 0.5,
-4.119296, -3.563084, 4, 0, 1.5, 0.5, 0.5
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
-3.577576, -3.109861, -5.188308,
-3.577576, 2.933122, -5.188308,
-3.577576, -3.109861, 6.038603,
-3.577576, 2.933122, 6.038603,
-3.577576, -3.109861, -5.188308,
-3.577576, -3.109861, 6.038603,
-3.577576, 2.933122, -5.188308,
-3.577576, 2.933122, 6.038603,
-3.577576, -3.109861, -5.188308,
3.645353, -3.109861, -5.188308,
-3.577576, -3.109861, 6.038603,
3.645353, -3.109861, 6.038603,
-3.577576, 2.933122, -5.188308,
3.645353, 2.933122, -5.188308,
-3.577576, 2.933122, 6.038603,
3.645353, 2.933122, 6.038603,
3.645353, -3.109861, -5.188308,
3.645353, 2.933122, -5.188308,
3.645353, -3.109861, 6.038603,
3.645353, 2.933122, 6.038603,
3.645353, -3.109861, -5.188308,
3.645353, -3.109861, 6.038603,
3.645353, 2.933122, -5.188308,
3.645353, 2.933122, 6.038603
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
var radius = 7.824808;
var distance = 34.81346;
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
mvMatrix.translate( -0.03388846, 0.08836937, -0.4251473 );
mvMatrix.scale( 1.171317, 1.400027, 0.7535765 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.81346);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Phosmet<-read.table("Phosmet.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phosmet$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phosmet' not found
```

```r
y<-Phosmet$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phosmet' not found
```

```r
z<-Phosmet$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phosmet' not found
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
-3.472388, 0.5407114, -2.109226, 0, 0, 1, 1, 1,
-3.088394, 0.3842021, -1.208863, 1, 0, 0, 1, 1,
-2.887777, -0.241004, -1.655572, 1, 0, 0, 1, 1,
-2.875898, -1.587339, -0.7558878, 1, 0, 0, 1, 1,
-2.835652, 0.4591986, -1.554899, 1, 0, 0, 1, 1,
-2.80478, 0.07050575, -0.5065879, 1, 0, 0, 1, 1,
-2.722036, -0.5213467, -1.235615, 0, 0, 0, 1, 1,
-2.594974, 0.2559336, -1.156745, 0, 0, 0, 1, 1,
-2.53057, 0.3133639, -1.669554, 0, 0, 0, 1, 1,
-2.488484, -1.226099, -1.467155, 0, 0, 0, 1, 1,
-2.48419, 0.6204554, 0.6143222, 0, 0, 0, 1, 1,
-2.435746, 1.081947, -1.636322, 0, 0, 0, 1, 1,
-2.415332, 0.3031888, -0.9840991, 0, 0, 0, 1, 1,
-2.330724, -1.487408, -2.783533, 1, 1, 1, 1, 1,
-2.326054, 0.5624154, -1.032462, 1, 1, 1, 1, 1,
-2.25316, 0.5772908, -0.8666697, 1, 1, 1, 1, 1,
-2.213464, -0.1455448, -1.810858, 1, 1, 1, 1, 1,
-2.211907, 0.549946, -1.756591, 1, 1, 1, 1, 1,
-2.19277, 0.00110881, -2.284198, 1, 1, 1, 1, 1,
-2.140811, -0.8522367, -0.6510475, 1, 1, 1, 1, 1,
-2.109454, -0.9650487, -2.398612, 1, 1, 1, 1, 1,
-2.105884, 1.698913, -2.446554, 1, 1, 1, 1, 1,
-2.081405, -1.018063, -1.517913, 1, 1, 1, 1, 1,
-2.07222, 1.03929, -1.42291, 1, 1, 1, 1, 1,
-2.066732, 1.949296, 0.346861, 1, 1, 1, 1, 1,
-2.001078, 0.7868543, -2.436085, 1, 1, 1, 1, 1,
-1.994505, -1.366237, -2.671113, 1, 1, 1, 1, 1,
-1.961439, -2.366644, -2.308665, 1, 1, 1, 1, 1,
-1.954006, -0.1784124, -2.864061, 0, 0, 1, 1, 1,
-1.929432, 0.04669401, -0.1665145, 1, 0, 0, 1, 1,
-1.919741, -0.6327611, 0.820311, 1, 0, 0, 1, 1,
-1.913326, -1.0515, -2.398476, 1, 0, 0, 1, 1,
-1.892553, 0.7304769, -1.475028, 1, 0, 0, 1, 1,
-1.880844, 0.07438698, 0.6354002, 1, 0, 0, 1, 1,
-1.87966, -0.5281848, -1.614448, 0, 0, 0, 1, 1,
-1.869098, 1.59843, 0.729278, 0, 0, 0, 1, 1,
-1.867156, -1.479645, -3.291472, 0, 0, 0, 1, 1,
-1.839629, -0.5260794, -3.010267, 0, 0, 0, 1, 1,
-1.831943, -0.5915359, -2.027895, 0, 0, 0, 1, 1,
-1.819808, -1.040467, -1.528471, 0, 0, 0, 1, 1,
-1.818848, 1.043715, -2.025972, 0, 0, 0, 1, 1,
-1.786393, -0.4139219, -4.372047, 1, 1, 1, 1, 1,
-1.786191, -0.7900919, -1.624471, 1, 1, 1, 1, 1,
-1.770621, 0.6151413, -1.78766, 1, 1, 1, 1, 1,
-1.764977, -0.9565424, -3.699592, 1, 1, 1, 1, 1,
-1.764829, 1.097606, -2.044087, 1, 1, 1, 1, 1,
-1.733577, 0.3518852, -0.8926933, 1, 1, 1, 1, 1,
-1.722746, -2.249476, -2.47807, 1, 1, 1, 1, 1,
-1.709579, -0.7512219, -2.278654, 1, 1, 1, 1, 1,
-1.701377, -0.09486539, -0.53241, 1, 1, 1, 1, 1,
-1.678067, 0.2255092, -1.493637, 1, 1, 1, 1, 1,
-1.677399, 0.05924756, -1.129857, 1, 1, 1, 1, 1,
-1.676016, 0.0412728, -0.6711956, 1, 1, 1, 1, 1,
-1.670432, -0.2084696, -1.05332, 1, 1, 1, 1, 1,
-1.670411, -0.06153438, -1.652123, 1, 1, 1, 1, 1,
-1.668136, -0.2175405, -1.654987, 1, 1, 1, 1, 1,
-1.663842, -1.774412, -1.160433, 0, 0, 1, 1, 1,
-1.64879, -0.09687816, -1.750015, 1, 0, 0, 1, 1,
-1.643909, 0.2824254, -0.5535852, 1, 0, 0, 1, 1,
-1.634524, -0.4590113, -3.563443, 1, 0, 0, 1, 1,
-1.631734, 1.438355, -1.018836, 1, 0, 0, 1, 1,
-1.623615, 0.8501602, 0.7956665, 1, 0, 0, 1, 1,
-1.598591, 0.504205, -0.3775145, 0, 0, 0, 1, 1,
-1.58723, -0.2642672, -1.301111, 0, 0, 0, 1, 1,
-1.58078, 0.2164487, -0.9436633, 0, 0, 0, 1, 1,
-1.573353, -0.4412695, -2.259527, 0, 0, 0, 1, 1,
-1.572628, -0.06232909, -2.82248, 0, 0, 0, 1, 1,
-1.571661, 0.3468744, -1.040689, 0, 0, 0, 1, 1,
-1.567859, -0.04481801, -1.943897, 0, 0, 0, 1, 1,
-1.564654, 1.384631, -0.9886987, 1, 1, 1, 1, 1,
-1.562135, -0.9093193, -3.094325, 1, 1, 1, 1, 1,
-1.536772, 1.002489, -0.4104801, 1, 1, 1, 1, 1,
-1.51897, 0.6421701, -1.266853, 1, 1, 1, 1, 1,
-1.503296, -1.167054, -2.284447, 1, 1, 1, 1, 1,
-1.499849, 0.3052103, -1.226849, 1, 1, 1, 1, 1,
-1.491926, 0.5279233, 0.2933019, 1, 1, 1, 1, 1,
-1.490229, -1.647864, -2.188765, 1, 1, 1, 1, 1,
-1.487307, -0.7865914, -1.451549, 1, 1, 1, 1, 1,
-1.486314, -0.2654956, -1.340886, 1, 1, 1, 1, 1,
-1.479776, -1.086555, -1.532832, 1, 1, 1, 1, 1,
-1.459793, -0.5423561, -0.6073585, 1, 1, 1, 1, 1,
-1.454994, 0.9753615, -1.351755, 1, 1, 1, 1, 1,
-1.453504, -1.108761, -1.115517, 1, 1, 1, 1, 1,
-1.430664, 0.3981799, -0.5563918, 1, 1, 1, 1, 1,
-1.426384, 0.700168, 0.4520178, 0, 0, 1, 1, 1,
-1.422148, -0.5516426, -0.9470875, 1, 0, 0, 1, 1,
-1.418936, 0.6016842, -0.816914, 1, 0, 0, 1, 1,
-1.418661, 1.361767, 0.2836298, 1, 0, 0, 1, 1,
-1.406151, 1.056696, -0.4797547, 1, 0, 0, 1, 1,
-1.402578, 1.423093, -1.355459, 1, 0, 0, 1, 1,
-1.397185, -0.4356022, -1.669858, 0, 0, 0, 1, 1,
-1.384832, 0.6858646, -0.786621, 0, 0, 0, 1, 1,
-1.381079, -0.4913768, -1.531176, 0, 0, 0, 1, 1,
-1.368137, -1.038517, -1.686413, 0, 0, 0, 1, 1,
-1.363672, -0.7840357, -1.430138, 0, 0, 0, 1, 1,
-1.348826, -1.210602, -3.839477, 0, 0, 0, 1, 1,
-1.33178, 2.280892, -1.3791, 0, 0, 0, 1, 1,
-1.326631, -0.684708, -2.509864, 1, 1, 1, 1, 1,
-1.321025, 1.423852, -1.2656, 1, 1, 1, 1, 1,
-1.307903, -0.2392827, -3.013335, 1, 1, 1, 1, 1,
-1.304468, -0.5927728, -3.865833, 1, 1, 1, 1, 1,
-1.298087, 1.644636, -0.7105163, 1, 1, 1, 1, 1,
-1.296027, 1.017153, -0.266015, 1, 1, 1, 1, 1,
-1.288138, 1.213499, -0.01017859, 1, 1, 1, 1, 1,
-1.274941, 0.6912212, -1.827401, 1, 1, 1, 1, 1,
-1.272307, 0.5743715, -2.297386, 1, 1, 1, 1, 1,
-1.269101, 1.314709, 0.789296, 1, 1, 1, 1, 1,
-1.267215, 0.6407996, -1.624916, 1, 1, 1, 1, 1,
-1.247675, -0.08218365, -1.172454, 1, 1, 1, 1, 1,
-1.239781, -0.703325, -2.19034, 1, 1, 1, 1, 1,
-1.228866, -0.01126445, -3.763121, 1, 1, 1, 1, 1,
-1.228866, -1.004386, -1.667781, 1, 1, 1, 1, 1,
-1.220648, -0.005739271, -2.084893, 0, 0, 1, 1, 1,
-1.220351, -1.712988, -3.041704, 1, 0, 0, 1, 1,
-1.212672, -0.7582143, -1.62799, 1, 0, 0, 1, 1,
-1.211905, 0.2465789, -1.143992, 1, 0, 0, 1, 1,
-1.21147, 0.706098, -1.105164, 1, 0, 0, 1, 1,
-1.202758, 1.209133, 0.3002458, 1, 0, 0, 1, 1,
-1.197426, -0.2749402, -2.893574, 0, 0, 0, 1, 1,
-1.196361, -0.7190672, -2.041748, 0, 0, 0, 1, 1,
-1.196295, -0.8061672, -2.643369, 0, 0, 0, 1, 1,
-1.188071, -0.6716009, -1.274423, 0, 0, 0, 1, 1,
-1.178432, -2.097122, -2.728884, 0, 0, 0, 1, 1,
-1.171761, 0.88254, -1.420009, 0, 0, 0, 1, 1,
-1.166457, 0.8165265, -3.005006, 0, 0, 0, 1, 1,
-1.165015, -0.7442722, -3.305311, 1, 1, 1, 1, 1,
-1.157051, 0.05812271, -0.8796964, 1, 1, 1, 1, 1,
-1.156898, 0.3944815, 0.2987232, 1, 1, 1, 1, 1,
-1.155815, 0.6906703, -3.412095, 1, 1, 1, 1, 1,
-1.149421, -0.2427066, -2.372556, 1, 1, 1, 1, 1,
-1.143498, -0.03167307, -1.637517, 1, 1, 1, 1, 1,
-1.131646, -2.104886, -3.034086, 1, 1, 1, 1, 1,
-1.128454, -0.8267853, -1.753662, 1, 1, 1, 1, 1,
-1.124586, 0.1694187, -0.5487866, 1, 1, 1, 1, 1,
-1.119574, -1.204402, -3.130604, 1, 1, 1, 1, 1,
-1.119001, 0.335797, -0.3331885, 1, 1, 1, 1, 1,
-1.112974, -0.4763879, -1.467034, 1, 1, 1, 1, 1,
-1.110792, 0.4744185, -3.154096, 1, 1, 1, 1, 1,
-1.107445, -1.792143, -4.097287, 1, 1, 1, 1, 1,
-1.106868, -0.1610901, -1.560598, 1, 1, 1, 1, 1,
-1.103005, 1.292798, -1.157281, 0, 0, 1, 1, 1,
-1.101474, -1.251888, -2.627838, 1, 0, 0, 1, 1,
-1.099222, -0.1200624, -0.9931502, 1, 0, 0, 1, 1,
-1.09886, -0.1159682, -2.454489, 1, 0, 0, 1, 1,
-1.098272, 0.5057122, -0.7169393, 1, 0, 0, 1, 1,
-1.098188, -0.04134001, -1.315077, 1, 0, 0, 1, 1,
-1.09688, 0.9112979, -1.304585, 0, 0, 0, 1, 1,
-1.087786, -0.9748825, -2.065088, 0, 0, 0, 1, 1,
-1.087167, 0.12913, -0.7108723, 0, 0, 0, 1, 1,
-1.08281, -1.193411, -4.248102, 0, 0, 0, 1, 1,
-1.079558, -0.880092, -2.809806, 0, 0, 0, 1, 1,
-1.079269, 1.986005, -0.4638431, 0, 0, 0, 1, 1,
-1.074341, -0.7827917, -2.306903, 0, 0, 0, 1, 1,
-1.073717, -0.4655687, -2.85856, 1, 1, 1, 1, 1,
-1.072824, 0.1142671, -1.887684, 1, 1, 1, 1, 1,
-1.070049, -0.2782898, -3.942966, 1, 1, 1, 1, 1,
-1.069443, 0.376275, -0.2484807, 1, 1, 1, 1, 1,
-1.066622, -0.5311604, -3.481866, 1, 1, 1, 1, 1,
-1.064561, -0.45507, -2.356352, 1, 1, 1, 1, 1,
-1.041941, -1.364971, -1.056581, 1, 1, 1, 1, 1,
-1.040364, -0.4624674, -2.76134, 1, 1, 1, 1, 1,
-1.037011, -0.4496762, -1.081904, 1, 1, 1, 1, 1,
-1.033546, -0.2940488, -2.769295, 1, 1, 1, 1, 1,
-1.027295, -0.5725229, -2.835422, 1, 1, 1, 1, 1,
-1.00875, -0.4246541, -3.851403, 1, 1, 1, 1, 1,
-1.002227, -1.562083, -3.060304, 1, 1, 1, 1, 1,
-0.9974899, -0.9833117, -2.411245, 1, 1, 1, 1, 1,
-0.9922439, -0.4813697, -1.649937, 1, 1, 1, 1, 1,
-0.9921259, -1.655308, -1.419394, 0, 0, 1, 1, 1,
-0.9817941, -1.330998, -2.46598, 1, 0, 0, 1, 1,
-0.9809014, -0.2463118, -4.024619, 1, 0, 0, 1, 1,
-0.9807847, -0.6494629, -4.404148, 1, 0, 0, 1, 1,
-0.9769674, -0.3647893, -2.01689, 1, 0, 0, 1, 1,
-0.9758553, 0.7768835, -0.5425705, 1, 0, 0, 1, 1,
-0.9744281, -0.1090629, -1.811006, 0, 0, 0, 1, 1,
-0.9690537, -0.9901412, -2.613864, 0, 0, 0, 1, 1,
-0.9643334, -0.1543239, 0.04444581, 0, 0, 0, 1, 1,
-0.9624413, 0.5333102, -0.8190737, 0, 0, 0, 1, 1,
-0.9605649, -0.6294255, -2.457196, 0, 0, 0, 1, 1,
-0.9603872, -0.4615982, -2.450297, 0, 0, 0, 1, 1,
-0.9569015, 0.1739154, -0.7398399, 0, 0, 0, 1, 1,
-0.9557766, 0.1453661, -1.022623, 1, 1, 1, 1, 1,
-0.9537752, 1.200386, 0.08707319, 1, 1, 1, 1, 1,
-0.9516785, -1.048195, -1.323779, 1, 1, 1, 1, 1,
-0.9451844, 0.1923046, 0.1306351, 1, 1, 1, 1, 1,
-0.9396881, 0.3872092, -0.6621671, 1, 1, 1, 1, 1,
-0.938553, 0.3579619, -1.144956, 1, 1, 1, 1, 1,
-0.9379525, 0.1387832, -0.140047, 1, 1, 1, 1, 1,
-0.9378229, -0.1321451, -0.9993427, 1, 1, 1, 1, 1,
-0.9362912, 0.5396335, -1.133893, 1, 1, 1, 1, 1,
-0.9362454, 0.3605079, -2.522216, 1, 1, 1, 1, 1,
-0.9279805, 0.02594918, -0.8101058, 1, 1, 1, 1, 1,
-0.9250388, 1.469123, -0.4179308, 1, 1, 1, 1, 1,
-0.9208415, 0.1821238, -1.682284, 1, 1, 1, 1, 1,
-0.9136584, 0.4102986, -1.43572, 1, 1, 1, 1, 1,
-0.9091098, 1.239661, -0.3463427, 1, 1, 1, 1, 1,
-0.9059582, -0.2590163, -2.621194, 0, 0, 1, 1, 1,
-0.8954765, 0.01102852, -1.695435, 1, 0, 0, 1, 1,
-0.885049, -2.085836, -1.442474, 1, 0, 0, 1, 1,
-0.8774641, -2.09392, -3.032667, 1, 0, 0, 1, 1,
-0.876241, 0.7755713, -0.6846855, 1, 0, 0, 1, 1,
-0.8708404, 0.6074747, -0.08548201, 1, 0, 0, 1, 1,
-0.8679771, -0.9575963, -1.744266, 0, 0, 0, 1, 1,
-0.8671019, 2.080181, -1.449433, 0, 0, 0, 1, 1,
-0.8538311, 1.448154, -1.489753, 0, 0, 0, 1, 1,
-0.8519453, 0.8000057, -0.143484, 0, 0, 0, 1, 1,
-0.8472903, 1.749224, -0.2325887, 0, 0, 0, 1, 1,
-0.8428422, 0.3575815, 0.2421445, 0, 0, 0, 1, 1,
-0.8328562, -1.549013, -1.174603, 0, 0, 0, 1, 1,
-0.8281265, -1.218585, -1.663331, 1, 1, 1, 1, 1,
-0.8220102, 1.010763, -1.097114, 1, 1, 1, 1, 1,
-0.8214745, -1.040544, -1.657163, 1, 1, 1, 1, 1,
-0.8142229, -0.6221654, -2.388496, 1, 1, 1, 1, 1,
-0.8061076, -0.8611096, -3.919449, 1, 1, 1, 1, 1,
-0.8042723, -1.078093, -0.751193, 1, 1, 1, 1, 1,
-0.8018286, 0.7189125, 0.1738921, 1, 1, 1, 1, 1,
-0.799184, -3.021856, -2.92345, 1, 1, 1, 1, 1,
-0.7849547, -0.5098113, -1.998989, 1, 1, 1, 1, 1,
-0.781632, -0.8673562, -2.678464, 1, 1, 1, 1, 1,
-0.7787249, 0.5676853, -2.058127, 1, 1, 1, 1, 1,
-0.7781668, -0.9519895, -2.009469, 1, 1, 1, 1, 1,
-0.7681131, -0.701246, -3.424946, 1, 1, 1, 1, 1,
-0.7666383, 1.967846, 0.9408953, 1, 1, 1, 1, 1,
-0.7650542, -0.7525611, -1.358234, 1, 1, 1, 1, 1,
-0.7636705, 0.7365779, -1.590864, 0, 0, 1, 1, 1,
-0.7572579, -0.1356892, -2.531803, 1, 0, 0, 1, 1,
-0.7554349, -0.4195534, -2.926137, 1, 0, 0, 1, 1,
-0.7544875, 1.626271, -1.484161, 1, 0, 0, 1, 1,
-0.7501478, 0.1097779, -1.027165, 1, 0, 0, 1, 1,
-0.7486441, 0.3592855, -1.69859, 1, 0, 0, 1, 1,
-0.7476183, -0.2217921, -1.740291, 0, 0, 0, 1, 1,
-0.7462502, 0.4961037, -1.446325, 0, 0, 0, 1, 1,
-0.7443007, 1.127495, -2.013874, 0, 0, 0, 1, 1,
-0.7275431, 0.02587007, -0.9435913, 0, 0, 0, 1, 1,
-0.7259676, 0.1403343, -0.9600579, 0, 0, 0, 1, 1,
-0.7186357, 2.0345, -1.455945, 0, 0, 0, 1, 1,
-0.7170553, -0.3440758, -2.358819, 0, 0, 0, 1, 1,
-0.7170379, -1.052898, -4.238036, 1, 1, 1, 1, 1,
-0.7169322, -0.0417286, -2.562866, 1, 1, 1, 1, 1,
-0.716086, 2.255669, 0.9000683, 1, 1, 1, 1, 1,
-0.7156082, -0.525066, -1.758964, 1, 1, 1, 1, 1,
-0.712477, 0.3280919, -1.755819, 1, 1, 1, 1, 1,
-0.7114607, -2.171881, -3.414655, 1, 1, 1, 1, 1,
-0.7095323, 1.573746, -0.06412122, 1, 1, 1, 1, 1,
-0.707187, -1.318611, -3.399856, 1, 1, 1, 1, 1,
-0.7030499, -0.4185185, -2.375493, 1, 1, 1, 1, 1,
-0.6915285, 0.06430928, -2.223135, 1, 1, 1, 1, 1,
-0.688251, 1.465974, -1.123417, 1, 1, 1, 1, 1,
-0.6848494, 0.8216008, -0.6201823, 1, 1, 1, 1, 1,
-0.6847432, 0.5471298, -1.524189, 1, 1, 1, 1, 1,
-0.6764156, 0.4288836, -0.2906587, 1, 1, 1, 1, 1,
-0.6742433, 0.02981206, -2.924787, 1, 1, 1, 1, 1,
-0.6732585, 0.2893119, -1.824219, 0, 0, 1, 1, 1,
-0.6726192, 0.9890288, -0.9870219, 1, 0, 0, 1, 1,
-0.6665904, -1.508826, -3.984233, 1, 0, 0, 1, 1,
-0.6653707, -2.004866, -1.672401, 1, 0, 0, 1, 1,
-0.6629847, -0.4803489, -2.922885, 1, 0, 0, 1, 1,
-0.6627306, -0.2330914, -0.9618218, 1, 0, 0, 1, 1,
-0.6619042, -0.564247, -2.856465, 0, 0, 0, 1, 1,
-0.6527272, 0.2391998, 0.5769011, 0, 0, 0, 1, 1,
-0.6501741, 0.4681023, 0.5337608, 0, 0, 0, 1, 1,
-0.6500502, -1.178866, -2.414414, 0, 0, 0, 1, 1,
-0.6493739, -0.8536835, -3.608046, 0, 0, 0, 1, 1,
-0.6473924, -0.848267, -2.355206, 0, 0, 0, 1, 1,
-0.6465322, -0.7614821, -1.834767, 0, 0, 0, 1, 1,
-0.6358702, 0.1179512, -1.937507, 1, 1, 1, 1, 1,
-0.6344139, -0.3722894, -1.533118, 1, 1, 1, 1, 1,
-0.6196451, 1.440601, -0.9038885, 1, 1, 1, 1, 1,
-0.6166613, -0.9826691, -1.167578, 1, 1, 1, 1, 1,
-0.6133683, -0.4118118, -1.277522, 1, 1, 1, 1, 1,
-0.6100586, -0.4522573, -2.176626, 1, 1, 1, 1, 1,
-0.6082401, 0.1041631, -2.379333, 1, 1, 1, 1, 1,
-0.6055102, 0.2543855, -1.646535, 1, 1, 1, 1, 1,
-0.6052314, -1.007441, -1.107486, 1, 1, 1, 1, 1,
-0.601693, -1.432473, -3.673281, 1, 1, 1, 1, 1,
-0.6008407, -0.5563198, -3.419501, 1, 1, 1, 1, 1,
-0.6004042, 0.1134376, -0.2592722, 1, 1, 1, 1, 1,
-0.599221, -1.130303, -2.200173, 1, 1, 1, 1, 1,
-0.5812757, -0.5702716, -3.874495, 1, 1, 1, 1, 1,
-0.5810458, 0.3363968, -2.001922, 1, 1, 1, 1, 1,
-0.5769483, -0.8662995, -1.992003, 0, 0, 1, 1, 1,
-0.5732837, -0.05682613, -1.326486, 1, 0, 0, 1, 1,
-0.5713106, 1.102597, 0.733462, 1, 0, 0, 1, 1,
-0.5636354, 0.2449896, -0.9669376, 1, 0, 0, 1, 1,
-0.5607908, 0.2450772, -1.518605, 1, 0, 0, 1, 1,
-0.556702, 1.403826, -0.04130198, 1, 0, 0, 1, 1,
-0.5545739, 2.845117, -0.6996754, 0, 0, 0, 1, 1,
-0.549535, 1.123764, -1.659566, 0, 0, 0, 1, 1,
-0.5479869, -1.179667, -3.379103, 0, 0, 0, 1, 1,
-0.547053, -0.5232143, -3.634205, 0, 0, 0, 1, 1,
-0.5401443, -1.801597, -2.892943, 0, 0, 0, 1, 1,
-0.5355816, 0.9514838, 0.73554, 0, 0, 0, 1, 1,
-0.5355502, 1.576607, -1.22497, 0, 0, 0, 1, 1,
-0.5330095, 0.09874453, -1.436052, 1, 1, 1, 1, 1,
-0.5274999, 0.02693444, -1.322062, 1, 1, 1, 1, 1,
-0.5255896, -0.5438571, -3.256628, 1, 1, 1, 1, 1,
-0.5235922, -0.04666479, -2.823721, 1, 1, 1, 1, 1,
-0.5223342, 0.9756528, 0.5587882, 1, 1, 1, 1, 1,
-0.5186401, 0.1294055, -0.2939679, 1, 1, 1, 1, 1,
-0.5141292, 0.5527596, -1.683835, 1, 1, 1, 1, 1,
-0.5138767, -0.8330056, -4.369365, 1, 1, 1, 1, 1,
-0.510811, 0.8771764, -1.724337, 1, 1, 1, 1, 1,
-0.5088591, 0.8725912, -0.6486511, 1, 1, 1, 1, 1,
-0.5071355, -1.450368, -3.906914, 1, 1, 1, 1, 1,
-0.5052014, -1.209341, -1.506865, 1, 1, 1, 1, 1,
-0.4977916, -1.68311, -2.846722, 1, 1, 1, 1, 1,
-0.4912568, 0.04540722, -2.899143, 1, 1, 1, 1, 1,
-0.4859884, 1.256715, -0.5772889, 1, 1, 1, 1, 1,
-0.4857182, -0.1270064, -1.871996, 0, 0, 1, 1, 1,
-0.4853893, -0.486867, -3.048972, 1, 0, 0, 1, 1,
-0.481828, 0.009167744, -0.5334139, 1, 0, 0, 1, 1,
-0.4818223, 1.396209, 0.9479463, 1, 0, 0, 1, 1,
-0.4770502, -0.817059, -3.745846, 1, 0, 0, 1, 1,
-0.4761321, -0.9878914, -2.233124, 1, 0, 0, 1, 1,
-0.4739863, 0.06909897, 0.83018, 0, 0, 0, 1, 1,
-0.4723819, 1.669599, 1.429478, 0, 0, 0, 1, 1,
-0.4700501, 0.4787211, -0.7668638, 0, 0, 0, 1, 1,
-0.4662237, -0.7732387, -3.761058, 0, 0, 0, 1, 1,
-0.4661063, -0.7508097, -1.719907, 0, 0, 0, 1, 1,
-0.461929, 2.125653, 0.1990579, 0, 0, 0, 1, 1,
-0.4591385, 0.8704348, -1.233253, 0, 0, 0, 1, 1,
-0.4585664, -1.296861, -2.347352, 1, 1, 1, 1, 1,
-0.4572298, -0.5674919, -3.799917, 1, 1, 1, 1, 1,
-0.4518597, 0.01404069, -2.393668, 1, 1, 1, 1, 1,
-0.4476607, -2.09041, -3.636056, 1, 1, 1, 1, 1,
-0.4445197, 0.57202, -1.909108, 1, 1, 1, 1, 1,
-0.4411205, 0.8502033, 0.2187043, 1, 1, 1, 1, 1,
-0.4321173, 1.237744, -1.412208, 1, 1, 1, 1, 1,
-0.4307244, -1.246402, -2.927936, 1, 1, 1, 1, 1,
-0.4193435, -0.6695662, -1.724199, 1, 1, 1, 1, 1,
-0.4179082, -1.359574, -2.729043, 1, 1, 1, 1, 1,
-0.4173998, 0.617983, -0.3081404, 1, 1, 1, 1, 1,
-0.4148239, 0.935761, -1.319391, 1, 1, 1, 1, 1,
-0.4135451, 0.2047146, -0.8407477, 1, 1, 1, 1, 1,
-0.4107633, -0.04843899, -1.917684, 1, 1, 1, 1, 1,
-0.4073722, -1.371668, -2.92218, 1, 1, 1, 1, 1,
-0.406207, -0.277411, -0.3583646, 0, 0, 1, 1, 1,
-0.4060731, 0.6341991, -1.545875, 1, 0, 0, 1, 1,
-0.4007593, -0.1540108, -2.732493, 1, 0, 0, 1, 1,
-0.3975092, -0.3603702, -1.707254, 1, 0, 0, 1, 1,
-0.3970936, -0.9172099, -1.67189, 1, 0, 0, 1, 1,
-0.3954704, 1.119298, 0.9959642, 1, 0, 0, 1, 1,
-0.3942025, -0.2562082, -2.958467, 0, 0, 0, 1, 1,
-0.3822818, -0.5187843, -3.884581, 0, 0, 0, 1, 1,
-0.3819384, 0.04507742, -2.374057, 0, 0, 0, 1, 1,
-0.3818603, 1.794176, -0.2107769, 0, 0, 0, 1, 1,
-0.3813372, -0.8233554, -1.292342, 0, 0, 0, 1, 1,
-0.3746482, -1.070295, -2.478374, 0, 0, 0, 1, 1,
-0.3725999, -1.540651, -2.233525, 0, 0, 0, 1, 1,
-0.37226, 1.542929, -1.014776, 1, 1, 1, 1, 1,
-0.3714224, -0.7555112, -3.838617, 1, 1, 1, 1, 1,
-0.3711478, 1.129926, 1.166502, 1, 1, 1, 1, 1,
-0.3681694, -0.7699277, -2.370672, 1, 1, 1, 1, 1,
-0.3668087, -0.1371706, -0.6471093, 1, 1, 1, 1, 1,
-0.3667395, -1.508892, -2.073489, 1, 1, 1, 1, 1,
-0.3627426, 0.2521226, -2.33825, 1, 1, 1, 1, 1,
-0.3591493, -0.4039017, -3.149679, 1, 1, 1, 1, 1,
-0.3586008, -0.3575559, -2.21746, 1, 1, 1, 1, 1,
-0.3561713, 0.2346266, 0.1578563, 1, 1, 1, 1, 1,
-0.3502066, 1.496652, -0.3079239, 1, 1, 1, 1, 1,
-0.3497215, -0.1491995, -0.7492547, 1, 1, 1, 1, 1,
-0.3439147, -0.183095, -2.32498, 1, 1, 1, 1, 1,
-0.3429615, -0.3181834, -1.785893, 1, 1, 1, 1, 1,
-0.3353259, 0.5521893, -1.616858, 1, 1, 1, 1, 1,
-0.3301089, -0.1577874, -2.760659, 0, 0, 1, 1, 1,
-0.3249987, -0.1267771, -0.4259999, 1, 0, 0, 1, 1,
-0.3234356, 0.2204357, -1.688346, 1, 0, 0, 1, 1,
-0.3180006, -0.7767996, -1.396353, 1, 0, 0, 1, 1,
-0.3168632, -0.3703721, -0.2434902, 1, 0, 0, 1, 1,
-0.3135861, 0.4183261, -2.119706, 1, 0, 0, 1, 1,
-0.3123089, -0.02451119, -1.317078, 0, 0, 0, 1, 1,
-0.309397, -0.3089119, -3.017223, 0, 0, 0, 1, 1,
-0.3074266, -1.278233, -3.500949, 0, 0, 0, 1, 1,
-0.3073856, -0.218928, -1.189891, 0, 0, 0, 1, 1,
-0.3051664, -2.61179, -3.000726, 0, 0, 0, 1, 1,
-0.3037751, -0.1222993, -1.949396, 0, 0, 0, 1, 1,
-0.3027705, -1.358116, -1.338663, 0, 0, 0, 1, 1,
-0.3023385, -1.264675, -2.508134, 1, 1, 1, 1, 1,
-0.3011548, -0.04028109, -1.29597, 1, 1, 1, 1, 1,
-0.2957921, -1.016374, -2.719393, 1, 1, 1, 1, 1,
-0.2944202, -1.5028, -2.670671, 1, 1, 1, 1, 1,
-0.2939105, 0.9463932, 0.6865982, 1, 1, 1, 1, 1,
-0.2899905, 1.179314, -0.9776479, 1, 1, 1, 1, 1,
-0.2897238, 0.3744807, -1.595795, 1, 1, 1, 1, 1,
-0.2892871, -0.8623944, -3.154164, 1, 1, 1, 1, 1,
-0.2856331, -1.128799, -2.575752, 1, 1, 1, 1, 1,
-0.2851577, -2.353595, -1.28018, 1, 1, 1, 1, 1,
-0.282148, 0.1911874, -0.1118031, 1, 1, 1, 1, 1,
-0.2809328, -1.067512, -3.821201, 1, 1, 1, 1, 1,
-0.2779201, 1.094435, -0.2333665, 1, 1, 1, 1, 1,
-0.2746321, -0.6853385, -1.931701, 1, 1, 1, 1, 1,
-0.2730416, 0.9287073, -2.834355, 1, 1, 1, 1, 1,
-0.272851, -1.587689, -2.468397, 0, 0, 1, 1, 1,
-0.270171, -0.6569502, -1.71947, 1, 0, 0, 1, 1,
-0.2699496, 0.03589022, -4.571353, 1, 0, 0, 1, 1,
-0.2697942, 0.7838942, -2.695028, 1, 0, 0, 1, 1,
-0.2683513, 0.1488964, -2.645571, 1, 0, 0, 1, 1,
-0.267813, 2.386172, -0.5466574, 1, 0, 0, 1, 1,
-0.2675269, 1.643128, -1.16507, 0, 0, 0, 1, 1,
-0.2631785, 0.4096276, -1.722947, 0, 0, 0, 1, 1,
-0.257634, -0.1760074, -0.9065729, 0, 0, 0, 1, 1,
-0.256837, 0.3478453, -0.8992693, 0, 0, 0, 1, 1,
-0.2535372, -0.7492766, -1.75849, 0, 0, 0, 1, 1,
-0.2509441, 0.08652795, -0.9619625, 0, 0, 0, 1, 1,
-0.2501271, -0.2510116, -1.949879, 0, 0, 0, 1, 1,
-0.2424642, 0.7877068, -1.30621, 1, 1, 1, 1, 1,
-0.2422461, 1.232859, -0.9671057, 1, 1, 1, 1, 1,
-0.2412578, 0.3676754, 0.5059111, 1, 1, 1, 1, 1,
-0.2384082, 0.004142408, -1.931759, 1, 1, 1, 1, 1,
-0.2368396, 0.07110666, 0.174815, 1, 1, 1, 1, 1,
-0.235697, 2.115186, -1.311891, 1, 1, 1, 1, 1,
-0.2355037, 1.641322, 0.4392777, 1, 1, 1, 1, 1,
-0.2325549, -0.89397, -2.696642, 1, 1, 1, 1, 1,
-0.2321354, -1.257722, -4.067227, 1, 1, 1, 1, 1,
-0.2306108, 1.289311, 1.281072, 1, 1, 1, 1, 1,
-0.2293629, -1.047131, -2.335335, 1, 1, 1, 1, 1,
-0.2289891, -0.8331355, -2.224391, 1, 1, 1, 1, 1,
-0.2227294, -0.9617793, -3.989066, 1, 1, 1, 1, 1,
-0.2219096, 2.046548, -0.7037672, 1, 1, 1, 1, 1,
-0.2177221, 1.266443, 0.7844156, 1, 1, 1, 1, 1,
-0.2141939, 0.03094401, -0.2748128, 0, 0, 1, 1, 1,
-0.2117564, 1.347352, 0.3189963, 1, 0, 0, 1, 1,
-0.2095973, -0.9513671, -2.655994, 1, 0, 0, 1, 1,
-0.2065944, 0.6530443, -3.665765, 1, 0, 0, 1, 1,
-0.2053575, 2.362001, -0.4098088, 1, 0, 0, 1, 1,
-0.2024531, -0.8056899, -1.752918, 1, 0, 0, 1, 1,
-0.1995676, -0.5314463, -4.173591, 0, 0, 0, 1, 1,
-0.1926631, -0.1946861, -2.706324, 0, 0, 0, 1, 1,
-0.1844309, -0.8376696, -2.793098, 0, 0, 0, 1, 1,
-0.1838745, 0.8624252, 0.2746006, 0, 0, 0, 1, 1,
-0.1834538, -1.970259, -4.256743, 0, 0, 0, 1, 1,
-0.1826812, 0.7660064, 1.286252, 0, 0, 0, 1, 1,
-0.1802054, -0.1793332, -2.751375, 0, 0, 0, 1, 1,
-0.1787773, 0.5346095, -1.768426, 1, 1, 1, 1, 1,
-0.1786381, 0.2682372, -1.766355, 1, 1, 1, 1, 1,
-0.1698112, 0.8766172, -1.019583, 1, 1, 1, 1, 1,
-0.165825, -0.02002842, -0.8978562, 1, 1, 1, 1, 1,
-0.1548654, 0.04334074, -0.1049211, 1, 1, 1, 1, 1,
-0.151967, -1.427555, -2.576832, 1, 1, 1, 1, 1,
-0.1498774, -0.09507587, -1.680271, 1, 1, 1, 1, 1,
-0.1454981, -0.9409822, -2.500871, 1, 1, 1, 1, 1,
-0.1449791, 0.1495467, -1.413682, 1, 1, 1, 1, 1,
-0.1447737, 0.252278, -0.6009317, 1, 1, 1, 1, 1,
-0.1420513, -1.099094, -2.284119, 1, 1, 1, 1, 1,
-0.1354115, 0.2110467, -1.02436, 1, 1, 1, 1, 1,
-0.1347378, -0.3098279, -2.76142, 1, 1, 1, 1, 1,
-0.1335908, -1.374558, -3.914529, 1, 1, 1, 1, 1,
-0.131047, -0.2455949, -2.902195, 1, 1, 1, 1, 1,
-0.1258753, 0.8070444, 1.238873, 0, 0, 1, 1, 1,
-0.1243324, 1.100538, 0.145697, 1, 0, 0, 1, 1,
-0.1239408, -2.224043, -2.267892, 1, 0, 0, 1, 1,
-0.123145, -0.2428167, -3.024485, 1, 0, 0, 1, 1,
-0.1160394, 0.296366, -0.46085, 1, 0, 0, 1, 1,
-0.1082316, 0.4867002, 0.7680726, 1, 0, 0, 1, 1,
-0.1077043, -1.957293, -3.774241, 0, 0, 0, 1, 1,
-0.1049757, -0.4551303, -3.660802, 0, 0, 0, 1, 1,
-0.1011785, -0.3556078, -2.545324, 0, 0, 0, 1, 1,
-0.0956241, 0.702243, 0.5814746, 0, 0, 0, 1, 1,
-0.09461772, 1.714597, -0.9429471, 0, 0, 0, 1, 1,
-0.08805167, -1.529634, -2.052979, 0, 0, 0, 1, 1,
-0.08787508, 0.4198083, -0.7242005, 0, 0, 0, 1, 1,
-0.08163685, -0.130391, -2.227117, 1, 1, 1, 1, 1,
-0.07855459, -0.6627151, -2.711251, 1, 1, 1, 1, 1,
-0.07480469, 0.8029531, -3.216469e-05, 1, 1, 1, 1, 1,
-0.07082136, -0.1779212, -1.831568, 1, 1, 1, 1, 1,
-0.06697234, -0.971015, -0.3544996, 1, 1, 1, 1, 1,
-0.06333492, -0.4317789, -3.548818, 1, 1, 1, 1, 1,
-0.05833395, 0.6673771, 0.02295132, 1, 1, 1, 1, 1,
-0.05827951, -0.552815, -5.024809, 1, 1, 1, 1, 1,
-0.05637752, 0.1202348, 0.2413477, 1, 1, 1, 1, 1,
-0.04670649, 1.520305, -0.1056973, 1, 1, 1, 1, 1,
-0.04603613, -0.1054294, -2.792715, 1, 1, 1, 1, 1,
-0.04596858, -1.234891, -1.330369, 1, 1, 1, 1, 1,
-0.04185913, 0.5596623, -0.9280797, 1, 1, 1, 1, 1,
-0.04168723, -0.6269254, -1.623231, 1, 1, 1, 1, 1,
-0.04156704, 1.355982, -0.8109752, 1, 1, 1, 1, 1,
-0.03586931, 0.1340828, -1.943917, 0, 0, 1, 1, 1,
-0.02981325, -0.6510296, -2.81545, 1, 0, 0, 1, 1,
-0.02947149, 0.1393449, -0.5108062, 1, 0, 0, 1, 1,
-0.02651482, -1.806194, -2.497953, 1, 0, 0, 1, 1,
-0.02595382, 0.3534816, 2.796721, 1, 0, 0, 1, 1,
-0.02491489, 0.5957055, -0.1164651, 1, 0, 0, 1, 1,
-0.02367054, 0.2350278, 0.5909076, 0, 0, 0, 1, 1,
-0.0214627, 0.1728893, 0.4393764, 0, 0, 0, 1, 1,
-0.0206323, -0.372311, -3.245539, 0, 0, 0, 1, 1,
-0.01196687, -1.995924, -4.792935, 0, 0, 0, 1, 1,
-0.007086372, 1.03837, 1.531648, 0, 0, 0, 1, 1,
-0.002014316, -0.7092957, -2.203396, 0, 0, 0, 1, 1,
-0.001598515, -1.198131, -5.009643, 0, 0, 0, 1, 1,
-0.001163434, 0.8660881, 2.254912, 1, 1, 1, 1, 1,
0.00195167, 1.467191, -0.8590527, 1, 1, 1, 1, 1,
0.003092682, -0.6378945, 2.758412, 1, 1, 1, 1, 1,
0.006654104, 0.2674111, -0.850301, 1, 1, 1, 1, 1,
0.007429443, -0.2569512, 2.552372, 1, 1, 1, 1, 1,
0.007908954, 1.689754, -0.4649334, 1, 1, 1, 1, 1,
0.008620554, 0.5051437, -0.5459134, 1, 1, 1, 1, 1,
0.008821583, -0.9055433, 3.642044, 1, 1, 1, 1, 1,
0.01006993, 0.2648458, -0.5742553, 1, 1, 1, 1, 1,
0.01252934, 0.7269812, 2.073235, 1, 1, 1, 1, 1,
0.01289179, -0.591127, 2.160065, 1, 1, 1, 1, 1,
0.01806728, 0.9903421, 0.05829813, 1, 1, 1, 1, 1,
0.01890674, -0.8670855, 2.619513, 1, 1, 1, 1, 1,
0.02772573, -1.352841, 1.559408, 1, 1, 1, 1, 1,
0.03001729, 0.06728091, 0.933411, 1, 1, 1, 1, 1,
0.03069056, -0.5792111, 2.496928, 0, 0, 1, 1, 1,
0.03097361, -0.76153, 2.976682, 1, 0, 0, 1, 1,
0.03114026, 1.116327, 0.1285576, 1, 0, 0, 1, 1,
0.03141122, -0.6318336, 4.394329, 1, 0, 0, 1, 1,
0.03396555, -0.3959461, 1.373439, 1, 0, 0, 1, 1,
0.03744745, 1.904902, -2.060554, 1, 0, 0, 1, 1,
0.03942727, -1.199271, 3.159918, 0, 0, 0, 1, 1,
0.04114656, 1.086286, 2.175623, 0, 0, 0, 1, 1,
0.04470776, -0.7166759, 2.419209, 0, 0, 0, 1, 1,
0.04473422, -1.293624, 2.166372, 0, 0, 0, 1, 1,
0.04893813, 0.2781712, 0.2635515, 0, 0, 0, 1, 1,
0.04904143, -0.2828396, 3.657938, 0, 0, 0, 1, 1,
0.04999942, -0.3231924, 2.914821, 0, 0, 0, 1, 1,
0.05062568, 0.9577352, -0.2803695, 1, 1, 1, 1, 1,
0.05288073, -1.459269, 3.079008, 1, 1, 1, 1, 1,
0.05472302, 1.819427, -0.4491377, 1, 1, 1, 1, 1,
0.05519328, 0.5503443, 0.7742921, 1, 1, 1, 1, 1,
0.05564369, -0.3957172, 3.701201, 1, 1, 1, 1, 1,
0.05658672, 0.5061771, -1.726848, 1, 1, 1, 1, 1,
0.05767324, -0.1297662, 2.635646, 1, 1, 1, 1, 1,
0.06040974, -1.510543, 3.228418, 1, 1, 1, 1, 1,
0.0619816, -2.11914, 4.020838, 1, 1, 1, 1, 1,
0.0644858, 0.3413959, -0.6741622, 1, 1, 1, 1, 1,
0.06566413, -0.2151462, 0.6543723, 1, 1, 1, 1, 1,
0.07273011, -0.4115272, 4.0377, 1, 1, 1, 1, 1,
0.08014293, -0.9947022, 2.88502, 1, 1, 1, 1, 1,
0.08472426, -1.372182, 3.846322, 1, 1, 1, 1, 1,
0.08716007, -0.302291, 3.138745, 1, 1, 1, 1, 1,
0.08900668, -0.8161839, 3.354602, 0, 0, 1, 1, 1,
0.08973282, -0.1104238, 3.151151, 1, 0, 0, 1, 1,
0.09155601, -0.7093903, 3.670115, 1, 0, 0, 1, 1,
0.09390951, 0.4046928, -0.5208431, 1, 0, 0, 1, 1,
0.09449188, -1.913672, 3.820995, 1, 0, 0, 1, 1,
0.09659055, -0.1956895, 4.931948, 1, 0, 0, 1, 1,
0.1048925, -1.04344, 3.3443, 0, 0, 0, 1, 1,
0.1070175, -0.001044106, 1.623414, 0, 0, 0, 1, 1,
0.1106806, 1.176539, 0.7131361, 0, 0, 0, 1, 1,
0.1131891, -0.4064527, 2.302244, 0, 0, 0, 1, 1,
0.1136681, 1.988528, -1.369897, 0, 0, 0, 1, 1,
0.1146658, -0.07458908, 3.447791, 0, 0, 0, 1, 1,
0.1153958, 1.374677, 2.187404, 0, 0, 0, 1, 1,
0.1189761, 0.612067, -0.2652712, 1, 1, 1, 1, 1,
0.128047, 0.5736747, -0.9008357, 1, 1, 1, 1, 1,
0.1382239, 1.816572, -1.687977, 1, 1, 1, 1, 1,
0.1386023, 0.954506, 1.303216, 1, 1, 1, 1, 1,
0.141074, 1.931296, 0.1630855, 1, 1, 1, 1, 1,
0.1453911, -1.494473, 4.819526, 1, 1, 1, 1, 1,
0.1457658, -0.7481664, 3.112848, 1, 1, 1, 1, 1,
0.1462552, 0.6610549, 0.2206381, 1, 1, 1, 1, 1,
0.1465622, -2.026762, 4.081183, 1, 1, 1, 1, 1,
0.146828, -0.2026565, 2.825041, 1, 1, 1, 1, 1,
0.1585808, -0.54168, 3.054803, 1, 1, 1, 1, 1,
0.160312, 2.158569, -0.5395112, 1, 1, 1, 1, 1,
0.1648879, -1.24878, 2.12778, 1, 1, 1, 1, 1,
0.1718133, 0.4032815, 0.964532, 1, 1, 1, 1, 1,
0.1721452, 1.155363, -0.593196, 1, 1, 1, 1, 1,
0.1773293, 0.7849475, 0.5405353, 0, 0, 1, 1, 1,
0.1822578, -1.507162, 3.353364, 1, 0, 0, 1, 1,
0.1896155, -0.7825235, 3.885539, 1, 0, 0, 1, 1,
0.1904998, -0.7759731, 1.002256, 1, 0, 0, 1, 1,
0.1912002, 2.457016, 0.1041914, 1, 0, 0, 1, 1,
0.1939788, 1.326736, -0.440474, 1, 0, 0, 1, 1,
0.2011643, -0.3266656, 3.180947, 0, 0, 0, 1, 1,
0.202544, -0.3451996, 2.724998, 0, 0, 0, 1, 1,
0.2029646, -0.944975, 2.837939, 0, 0, 0, 1, 1,
0.2054648, 0.1647488, 3.197796, 0, 0, 0, 1, 1,
0.2060487, 0.1564429, 1.04748, 0, 0, 0, 1, 1,
0.2081984, -0.1877484, 2.611487, 0, 0, 0, 1, 1,
0.2101686, -0.2408419, 1.406225, 0, 0, 0, 1, 1,
0.210639, 0.6484828, 0.05552361, 1, 1, 1, 1, 1,
0.2120599, -0.9768376, 2.821473, 1, 1, 1, 1, 1,
0.2123134, -0.3988616, 3.987594, 1, 1, 1, 1, 1,
0.2186885, -0.007912403, 2.119867, 1, 1, 1, 1, 1,
0.2232297, 0.1346193, 0.03157776, 1, 1, 1, 1, 1,
0.2234992, 1.706114, -1.078975, 1, 1, 1, 1, 1,
0.2265981, -0.8767133, 3.758671, 1, 1, 1, 1, 1,
0.2336228, -0.2185395, 3.162663, 1, 1, 1, 1, 1,
0.2338464, 0.3318626, -0.1109844, 1, 1, 1, 1, 1,
0.2541796, 1.446968, -1.083477, 1, 1, 1, 1, 1,
0.2558666, -0.3926511, 0.8062064, 1, 1, 1, 1, 1,
0.2580568, 1.374564, 0.1655867, 1, 1, 1, 1, 1,
0.2605536, -0.1290574, 2.208866, 1, 1, 1, 1, 1,
0.2620449, -0.3269401, 1.799479, 1, 1, 1, 1, 1,
0.2625241, 0.684666, 0.5663547, 1, 1, 1, 1, 1,
0.2632116, 1.567478, -0.1138326, 0, 0, 1, 1, 1,
0.2681448, 0.340385, -1.252855, 1, 0, 0, 1, 1,
0.2728001, -1.504405, 4.292057, 1, 0, 0, 1, 1,
0.2733484, 0.8213018, 1.671053, 1, 0, 0, 1, 1,
0.2767911, 0.4145256, 1.192035, 1, 0, 0, 1, 1,
0.2827793, -0.008100751, -2.588185, 1, 0, 0, 1, 1,
0.2832127, 0.05245312, 2.173617, 0, 0, 0, 1, 1,
0.2841662, 0.0246965, 0.2227049, 0, 0, 0, 1, 1,
0.2912531, 0.4808032, 2.270597, 0, 0, 0, 1, 1,
0.2912552, 0.912982, 1.110074, 0, 0, 0, 1, 1,
0.2956102, -1.741085, 5.875104, 0, 0, 0, 1, 1,
0.2986965, 0.7234012, -0.2565975, 0, 0, 0, 1, 1,
0.3002626, 1.211376, 0.2606481, 0, 0, 0, 1, 1,
0.3005791, 0.289193, -0.5589191, 1, 1, 1, 1, 1,
0.3013083, 0.2967838, 0.4306946, 1, 1, 1, 1, 1,
0.3015546, -0.86712, 2.805364, 1, 1, 1, 1, 1,
0.304929, 0.823074, 0.2633666, 1, 1, 1, 1, 1,
0.3053187, 0.3085764, 0.6860746, 1, 1, 1, 1, 1,
0.3062626, -1.313935, 3.397018, 1, 1, 1, 1, 1,
0.3143104, -0.04291647, 1.375975, 1, 1, 1, 1, 1,
0.3156014, -1.382742, 2.776558, 1, 1, 1, 1, 1,
0.3166547, -0.09616338, 2.241128, 1, 1, 1, 1, 1,
0.3182076, 0.3855574, 1.016419, 1, 1, 1, 1, 1,
0.3194667, 1.287171, 1.410053, 1, 1, 1, 1, 1,
0.3196689, 0.9102668, 0.2724471, 1, 1, 1, 1, 1,
0.3272167, 2.070508, -1.688701, 1, 1, 1, 1, 1,
0.3294404, -2.517775, 3.19279, 1, 1, 1, 1, 1,
0.3356528, 0.6147711, 0.5668765, 1, 1, 1, 1, 1,
0.3364893, 1.306761, 0.8570139, 0, 0, 1, 1, 1,
0.3392342, 0.4584701, 0.5487245, 1, 0, 0, 1, 1,
0.3485236, 1.706948, 0.6530915, 1, 0, 0, 1, 1,
0.3527747, -0.5425425, 3.113885, 1, 0, 0, 1, 1,
0.3552883, 0.6440891, 2.741779, 1, 0, 0, 1, 1,
0.3579267, -0.2569054, 3.086732, 1, 0, 0, 1, 1,
0.3600841, -1.116327, 3.785717, 0, 0, 0, 1, 1,
0.3609922, 1.15334, -2.291122, 0, 0, 0, 1, 1,
0.361414, 0.9176332, 2.210644, 0, 0, 0, 1, 1,
0.3652838, -0.2318066, 1.301323, 0, 0, 0, 1, 1,
0.3675548, -0.1702289, 3.324967, 0, 0, 0, 1, 1,
0.3717615, 0.03640692, 1.961298, 0, 0, 0, 1, 1,
0.3791091, 1.006963, -0.0538494, 0, 0, 0, 1, 1,
0.3797449, 0.8459969, 1.010818, 1, 1, 1, 1, 1,
0.3802834, 0.2812295, 1.053641, 1, 1, 1, 1, 1,
0.3831493, 2.514881, -0.972908, 1, 1, 1, 1, 1,
0.3836327, -0.1412118, 0.8535991, 1, 1, 1, 1, 1,
0.383789, 2.156556, -0.02148546, 1, 1, 1, 1, 1,
0.3854169, 1.363642, 0.09114712, 1, 1, 1, 1, 1,
0.3869633, -1.126843, 4.271745, 1, 1, 1, 1, 1,
0.3879131, 0.5340863, 1.354838, 1, 1, 1, 1, 1,
0.391974, 0.3262921, 0.4271561, 1, 1, 1, 1, 1,
0.3988884, 0.141174, 1.200204, 1, 1, 1, 1, 1,
0.4009863, 1.084049, -1.794716, 1, 1, 1, 1, 1,
0.4048286, 0.574919, 0.06112585, 1, 1, 1, 1, 1,
0.4061486, 1.185739, 0.9316821, 1, 1, 1, 1, 1,
0.407293, -0.05226893, 1.32033, 1, 1, 1, 1, 1,
0.4076628, 0.2617508, 0.7653357, 1, 1, 1, 1, 1,
0.4151495, -0.4667021, 1.639645, 0, 0, 1, 1, 1,
0.4152933, -0.6108609, 3.13902, 1, 0, 0, 1, 1,
0.4192741, 0.8943937, -0.7261649, 1, 0, 0, 1, 1,
0.4246526, 0.6276228, -0.2113275, 1, 0, 0, 1, 1,
0.4247507, -0.8915253, 1.547019, 1, 0, 0, 1, 1,
0.4272948, 0.01774029, 3.360706, 1, 0, 0, 1, 1,
0.4346076, 0.8302749, 1.716308, 0, 0, 0, 1, 1,
0.4354574, -0.9785382, 2.635237, 0, 0, 0, 1, 1,
0.4394893, -0.3990002, 2.278794, 0, 0, 0, 1, 1,
0.4418938, 1.46799, 0.7915664, 0, 0, 0, 1, 1,
0.4437315, -1.527043, 4.576708, 0, 0, 0, 1, 1,
0.4462449, 0.3612849, 1.199759, 0, 0, 0, 1, 1,
0.4476264, -0.6353966, 3.890645, 0, 0, 0, 1, 1,
0.4479201, -1.028532, 2.555333, 1, 1, 1, 1, 1,
0.4504194, -0.01873044, 1.764325, 1, 1, 1, 1, 1,
0.4506067, -1.043639, 1.423187, 1, 1, 1, 1, 1,
0.4540897, -0.434375, 1.022213, 1, 1, 1, 1, 1,
0.4686452, 0.07906577, 2.065174, 1, 1, 1, 1, 1,
0.4694923, -0.8897293, 2.209049, 1, 1, 1, 1, 1,
0.4714957, 1.081217, 1.602875, 1, 1, 1, 1, 1,
0.4719591, 0.5991665, -0.5570239, 1, 1, 1, 1, 1,
0.4721297, -0.01583409, 2.357875, 1, 1, 1, 1, 1,
0.4729285, 0.3483379, 0.8925573, 1, 1, 1, 1, 1,
0.4740826, -1.498955, 2.264715, 1, 1, 1, 1, 1,
0.4746665, 0.2530015, 2.103754, 1, 1, 1, 1, 1,
0.4785276, -0.09077758, 1.904434, 1, 1, 1, 1, 1,
0.4788041, -0.7890664, 2.160156, 1, 1, 1, 1, 1,
0.480317, -0.6089141, 0.7844722, 1, 1, 1, 1, 1,
0.4817096, -1.661695, 5.159169, 0, 0, 1, 1, 1,
0.4874626, 0.3986732, 1.028461, 1, 0, 0, 1, 1,
0.488279, 0.3733423, 1.173219, 1, 0, 0, 1, 1,
0.4911344, 1.828818, -0.02270517, 1, 0, 0, 1, 1,
0.4917868, -1.464537, 2.073902, 1, 0, 0, 1, 1,
0.4945999, -1.064288, 2.934729, 1, 0, 0, 1, 1,
0.4972507, -1.697033, 4.581972, 0, 0, 0, 1, 1,
0.5029443, -1.957994, 2.556577, 0, 0, 0, 1, 1,
0.5096024, 0.1702428, 0.7667333, 0, 0, 0, 1, 1,
0.510972, -0.983218, 2.294642, 0, 0, 0, 1, 1,
0.5130321, 0.07798894, 0.7121103, 0, 0, 0, 1, 1,
0.5164493, 0.6995488, -0.2233729, 0, 0, 0, 1, 1,
0.5169649, -1.183905, 3.576284, 0, 0, 0, 1, 1,
0.5193099, 1.352581, 0.4419167, 1, 1, 1, 1, 1,
0.5209891, -0.4647537, -0.1383826, 1, 1, 1, 1, 1,
0.5338209, 0.846676, 0.4413709, 1, 1, 1, 1, 1,
0.5437829, -1.159259, 1.895241, 1, 1, 1, 1, 1,
0.5486056, 0.2853125, 3.536781, 1, 1, 1, 1, 1,
0.5494369, -0.4282295, 1.426869, 1, 1, 1, 1, 1,
0.5521941, -1.361763, 2.740828, 1, 1, 1, 1, 1,
0.552923, 0.08046558, -0.02152801, 1, 1, 1, 1, 1,
0.5540647, 0.2623886, 1.278212, 1, 1, 1, 1, 1,
0.5552137, 0.8786265, 1.567333, 1, 1, 1, 1, 1,
0.5596553, 2.101209, -1.144209, 1, 1, 1, 1, 1,
0.5616335, -1.06834, 1.873918, 1, 1, 1, 1, 1,
0.5633348, -0.08741626, 2.664745, 1, 1, 1, 1, 1,
0.5656599, 0.5953228, 0.4391196, 1, 1, 1, 1, 1,
0.5668738, 0.2969639, 0.6675338, 1, 1, 1, 1, 1,
0.5702467, -1.093175, 2.487046, 0, 0, 1, 1, 1,
0.5770483, 1.760338, 0.254789, 1, 0, 0, 1, 1,
0.5782417, 0.5838839, 1.151749, 1, 0, 0, 1, 1,
0.5842357, -1.395325, 4.180471, 1, 0, 0, 1, 1,
0.5859182, 0.4447972, 2.605541, 1, 0, 0, 1, 1,
0.5896531, 0.2938794, 1.291812, 1, 0, 0, 1, 1,
0.5931419, 0.2627886, 2.778303, 0, 0, 0, 1, 1,
0.5975178, 0.1831441, 1.843711, 0, 0, 0, 1, 1,
0.5993326, 1.139565, 0.8220893, 0, 0, 0, 1, 1,
0.6052116, 0.8050981, 0.04385779, 0, 0, 0, 1, 1,
0.6055461, -0.5421314, 1.614204, 0, 0, 0, 1, 1,
0.6090891, 0.6077166, 0.6290184, 0, 0, 0, 1, 1,
0.6130484, 0.03538947, 3.865918, 0, 0, 0, 1, 1,
0.6207905, -0.181054, 0.9416137, 1, 1, 1, 1, 1,
0.621955, 0.4124389, -0.9635056, 1, 1, 1, 1, 1,
0.6282105, -0.418582, 1.592881, 1, 1, 1, 1, 1,
0.6282287, 0.3017282, 1.780336, 1, 1, 1, 1, 1,
0.6315866, 0.2213115, 3.466524, 1, 1, 1, 1, 1,
0.6379727, -1.207658, 1.014819, 1, 1, 1, 1, 1,
0.6437715, 0.7613436, 2.149054, 1, 1, 1, 1, 1,
0.6442723, 1.658926, 0.7066512, 1, 1, 1, 1, 1,
0.6457826, 0.7123731, 1.013417, 1, 1, 1, 1, 1,
0.6471201, -1.002848, 1.910636, 1, 1, 1, 1, 1,
0.6486598, 0.5830254, -1.732746, 1, 1, 1, 1, 1,
0.6487023, -0.8190491, 3.194206, 1, 1, 1, 1, 1,
0.6606486, 0.2425485, -1.126983, 1, 1, 1, 1, 1,
0.6610074, 0.005071444, 2.21627, 1, 1, 1, 1, 1,
0.6661285, 0.6540848, 0.858577, 1, 1, 1, 1, 1,
0.6698542, 1.6989, 1.535768, 0, 0, 1, 1, 1,
0.6721669, 1.122401, -0.8136228, 1, 0, 0, 1, 1,
0.6724738, -1.160335, 2.694116, 1, 0, 0, 1, 1,
0.6768728, 0.5988462, 0.1941283, 1, 0, 0, 1, 1,
0.6841601, -0.169892, 2.148595, 1, 0, 0, 1, 1,
0.6853624, -0.9322447, 2.049917, 1, 0, 0, 1, 1,
0.68625, 0.6357421, 1.044755, 0, 0, 0, 1, 1,
0.690473, -0.3429593, 2.284045, 0, 0, 0, 1, 1,
0.7041517, 1.027524, -1.680383, 0, 0, 0, 1, 1,
0.7119288, -2.005782, 1.821759, 0, 0, 0, 1, 1,
0.7159073, 0.9766315, 1.45878, 0, 0, 0, 1, 1,
0.7197996, 0.2469554, 1.961503, 0, 0, 0, 1, 1,
0.7273999, -0.1115589, 3.15461, 0, 0, 0, 1, 1,
0.7308646, -0.3983989, 0.8959682, 1, 1, 1, 1, 1,
0.7329438, -0.6377445, 2.074897, 1, 1, 1, 1, 1,
0.7430003, -0.5834275, 1.916865, 1, 1, 1, 1, 1,
0.7482588, -0.1143593, 2.107753, 1, 1, 1, 1, 1,
0.751909, -0.780061, 2.426052, 1, 1, 1, 1, 1,
0.7548709, -0.2983778, 1.848894, 1, 1, 1, 1, 1,
0.7570146, 0.3376197, 0.525686, 1, 1, 1, 1, 1,
0.7679809, 1.242003, 1.545909, 1, 1, 1, 1, 1,
0.7727142, -1.250179, 0.8547357, 1, 1, 1, 1, 1,
0.7731195, -0.9017047, 3.325122, 1, 1, 1, 1, 1,
0.7738132, 0.9780067, 0.4911637, 1, 1, 1, 1, 1,
0.774362, 2.548754, -1.141112, 1, 1, 1, 1, 1,
0.7744648, 0.6078756, 0.802879, 1, 1, 1, 1, 1,
0.7764801, 0.7471914, 1.815737, 1, 1, 1, 1, 1,
0.7770622, 1.136894, 2.162256, 1, 1, 1, 1, 1,
0.7801492, -0.7930737, 1.244378, 0, 0, 1, 1, 1,
0.7806369, -0.2184775, 1.218031, 1, 0, 0, 1, 1,
0.7875602, -0.7841181, 3.223367, 1, 0, 0, 1, 1,
0.7972825, 0.3578499, 0.7930606, 1, 0, 0, 1, 1,
0.7996884, 0.2810746, 1.30655, 1, 0, 0, 1, 1,
0.8011085, -1.681354, 3.765921, 1, 0, 0, 1, 1,
0.8012692, -1.221052, 2.886147, 0, 0, 0, 1, 1,
0.8015211, -1.823989, 3.14642, 0, 0, 0, 1, 1,
0.8120229, -1.310938, 2.68932, 0, 0, 0, 1, 1,
0.8131618, 0.9590237, 0.1426077, 0, 0, 0, 1, 1,
0.8236179, -1.530092, 3.111203, 0, 0, 0, 1, 1,
0.8260507, 0.4567433, 2.812489, 0, 0, 0, 1, 1,
0.8283773, -2.230247, 3.417614, 0, 0, 0, 1, 1,
0.8301459, -1.419099, 2.452117, 1, 1, 1, 1, 1,
0.8324668, -0.05649378, 3.128063, 1, 1, 1, 1, 1,
0.839987, -0.2835868, 1.681558, 1, 1, 1, 1, 1,
0.8486372, 0.4904158, 2.66785, 1, 1, 1, 1, 1,
0.8492627, 0.6354224, -0.6768873, 1, 1, 1, 1, 1,
0.8499067, -1.507209, 2.984764, 1, 1, 1, 1, 1,
0.8515449, 0.408906, 0.5417813, 1, 1, 1, 1, 1,
0.852221, -2.450273, 3.0201, 1, 1, 1, 1, 1,
0.8540456, 0.8865673, 2.4017, 1, 1, 1, 1, 1,
0.8558804, -1.182244, -0.1257088, 1, 1, 1, 1, 1,
0.8573889, 0.5677145, 2.546382, 1, 1, 1, 1, 1,
0.8592132, -0.8357859, 2.192999, 1, 1, 1, 1, 1,
0.860382, 1.400142, 1.180857, 1, 1, 1, 1, 1,
0.8615549, -0.5274822, 1.997585, 1, 1, 1, 1, 1,
0.8620885, -0.220577, 1.936704, 1, 1, 1, 1, 1,
0.8758395, -0.09024065, 1.436327, 0, 0, 1, 1, 1,
0.8761717, 1.486217, -0.1187648, 1, 0, 0, 1, 1,
0.8803613, 0.7995289, 2.423668, 1, 0, 0, 1, 1,
0.881003, -0.3376315, 3.215161, 1, 0, 0, 1, 1,
0.8817121, -1.023167, 4.555067, 1, 0, 0, 1, 1,
0.8826091, 0.05483381, 2.112497, 1, 0, 0, 1, 1,
0.8830994, 1.074159, 2.493146, 0, 0, 0, 1, 1,
0.8864127, -1.419504, 1.580594, 0, 0, 0, 1, 1,
0.8869604, -0.1897835, 1.81198, 0, 0, 0, 1, 1,
0.8872586, -1.530512, 1.405496, 0, 0, 0, 1, 1,
0.8914459, -0.0636409, 1.635738, 0, 0, 0, 1, 1,
0.8921102, -0.276207, 2.60585, 0, 0, 0, 1, 1,
0.8942349, 0.4696123, 1.869632, 0, 0, 0, 1, 1,
0.8987498, -0.1123915, 2.692221, 1, 1, 1, 1, 1,
0.8994303, 1.320105, 1.150844, 1, 1, 1, 1, 1,
0.9092395, 0.1414606, 1.068138, 1, 1, 1, 1, 1,
0.9122429, 2.679815, -1.196812, 1, 1, 1, 1, 1,
0.9156152, 0.6937219, 0.9994737, 1, 1, 1, 1, 1,
0.9213242, 0.4957609, 1.883525, 1, 1, 1, 1, 1,
0.9218705, -0.02707697, 2.566088, 1, 1, 1, 1, 1,
0.9228801, 0.9468762, 1.362571, 1, 1, 1, 1, 1,
0.9233701, 0.3202063, 0.9119682, 1, 1, 1, 1, 1,
0.9254217, 0.7407407, 2.114961, 1, 1, 1, 1, 1,
0.9297258, -0.6438814, 1.999009, 1, 1, 1, 1, 1,
0.9419473, -0.8467765, 3.312982, 1, 1, 1, 1, 1,
0.9422412, 1.788495, 0.3452223, 1, 1, 1, 1, 1,
0.9494309, -0.9994396, 3.131835, 1, 1, 1, 1, 1,
0.9577373, 0.09100015, -1.399068, 1, 1, 1, 1, 1,
0.9578114, -0.07605823, 0.3117537, 0, 0, 1, 1, 1,
0.9671479, 1.777794, 0.07130553, 1, 0, 0, 1, 1,
0.9708756, -2.676168, 2.398832, 1, 0, 0, 1, 1,
0.974178, 1.239157, 0.1507132, 1, 0, 0, 1, 1,
0.9769935, -1.743495, 1.409127, 1, 0, 0, 1, 1,
0.9791364, 0.6097474, 1.564821, 1, 0, 0, 1, 1,
0.9838885, 1.900329, 0.7513036, 0, 0, 0, 1, 1,
0.9845779, 0.5973302, 0.3751862, 0, 0, 0, 1, 1,
0.9874709, -1.036968, 2.443747, 0, 0, 0, 1, 1,
1.00427, 1.183637, 2.320343, 0, 0, 0, 1, 1,
1.011996, -1.215137, 3.562331, 0, 0, 0, 1, 1,
1.022659, 0.5304391, 1.052519, 0, 0, 0, 1, 1,
1.023911, 1.988461, -0.2245413, 0, 0, 0, 1, 1,
1.025573, -0.7065992, 1.364196, 1, 1, 1, 1, 1,
1.025933, 0.1642239, 3.112045, 1, 1, 1, 1, 1,
1.028006, -0.2150251, 2.550997, 1, 1, 1, 1, 1,
1.036667, 1.175784, 2.79618, 1, 1, 1, 1, 1,
1.036826, 0.4171424, -0.2434643, 1, 1, 1, 1, 1,
1.038077, 0.8101624, 1.873709, 1, 1, 1, 1, 1,
1.038331, 0.1065913, 1.803593, 1, 1, 1, 1, 1,
1.038836, -0.3597226, 1.185426, 1, 1, 1, 1, 1,
1.040641, -1.374024, 2.361129, 1, 1, 1, 1, 1,
1.041183, 0.08472861, 0.4056796, 1, 1, 1, 1, 1,
1.042294, 0.2463792, 0.6195374, 1, 1, 1, 1, 1,
1.042754, -1.147678, -0.1236397, 1, 1, 1, 1, 1,
1.045735, -0.3161368, 1.530537, 1, 1, 1, 1, 1,
1.051179, 1.224811, 0.3869804, 1, 1, 1, 1, 1,
1.055435, -0.4659477, 2.572068, 1, 1, 1, 1, 1,
1.058894, 0.1506161, 1.639257, 0, 0, 1, 1, 1,
1.063114, 0.8903402, 0.8373631, 1, 0, 0, 1, 1,
1.063496, 1.150767, 0.2405817, 1, 0, 0, 1, 1,
1.067362, 1.340086, -0.2157243, 1, 0, 0, 1, 1,
1.069406, -0.6732811, 4.73703, 1, 0, 0, 1, 1,
1.069496, 2.147137, -0.4518815, 1, 0, 0, 1, 1,
1.06969, -0.2727319, 2.207873, 0, 0, 0, 1, 1,
1.07257, 0.09980318, 0.3397019, 0, 0, 0, 1, 1,
1.073186, 0.1178459, 0.6932628, 0, 0, 0, 1, 1,
1.077563, -0.8089658, 2.499677, 0, 0, 0, 1, 1,
1.078325, -0.3427771, 2.224726, 0, 0, 0, 1, 1,
1.084388, -1.893726, 3.931099, 0, 0, 0, 1, 1,
1.085067, 0.2469699, 0.554286, 0, 0, 0, 1, 1,
1.089881, 0.8921276, -0.965935, 1, 1, 1, 1, 1,
1.103623, -0.8826268, 1.689008, 1, 1, 1, 1, 1,
1.107193, -0.544637, 1.363008, 1, 1, 1, 1, 1,
1.110747, 1.192363, 2.850295, 1, 1, 1, 1, 1,
1.130157, 1.663518, 0.9114193, 1, 1, 1, 1, 1,
1.131764, 1.107485, 2.83273, 1, 1, 1, 1, 1,
1.133958, 1.130721, 0.9140474, 1, 1, 1, 1, 1,
1.139539, -0.06002434, 1.18292, 1, 1, 1, 1, 1,
1.140802, -0.8057896, 1.976823, 1, 1, 1, 1, 1,
1.143322, -0.1141982, 2.795478, 1, 1, 1, 1, 1,
1.154502, 1.364815, -0.06879009, 1, 1, 1, 1, 1,
1.15575, 0.03331172, 1.425011, 1, 1, 1, 1, 1,
1.156818, 1.270742, 0.2739745, 1, 1, 1, 1, 1,
1.157503, -0.7761795, 2.238385, 1, 1, 1, 1, 1,
1.157847, 0.6738393, 0.887158, 1, 1, 1, 1, 1,
1.159345, -1.765264, 2.319724, 0, 0, 1, 1, 1,
1.166097, 0.02273084, 1.115964, 1, 0, 0, 1, 1,
1.171567, 0.6841817, 2.559843, 1, 0, 0, 1, 1,
1.171729, 1.72392, 1.555972, 1, 0, 0, 1, 1,
1.173504, -0.1367251, 1.921941, 1, 0, 0, 1, 1,
1.174163, 0.7633604, -1.761969, 1, 0, 0, 1, 1,
1.177744, -0.3556634, 3.297334, 0, 0, 0, 1, 1,
1.180008, -0.8196616, 2.36418, 0, 0, 0, 1, 1,
1.181881, 0.4881643, 1.428758, 0, 0, 0, 1, 1,
1.183182, 0.9741632, 0.6408747, 0, 0, 0, 1, 1,
1.18563, 2.021881, 0.7454489, 0, 0, 0, 1, 1,
1.185946, -0.06950057, 1.88506, 0, 0, 0, 1, 1,
1.197426, -0.7877096, 1.332108, 0, 0, 0, 1, 1,
1.198678, -0.5207375, 1.659042, 1, 1, 1, 1, 1,
1.209934, 0.2566781, 1.54826, 1, 1, 1, 1, 1,
1.212244, -0.330676, 1.682036, 1, 1, 1, 1, 1,
1.215062, -0.0682, 0.3600166, 1, 1, 1, 1, 1,
1.224462, 1.929945, 1.160537, 1, 1, 1, 1, 1,
1.228274, -0.1360426, 0.3449121, 1, 1, 1, 1, 1,
1.238958, -0.8247809, 1.049709, 1, 1, 1, 1, 1,
1.24018, -0.3103884, 1.351236, 1, 1, 1, 1, 1,
1.240308, -0.2407103, 1.820278, 1, 1, 1, 1, 1,
1.25192, 0.3351494, 3.361691, 1, 1, 1, 1, 1,
1.258992, -1.252677, 3.760392, 1, 1, 1, 1, 1,
1.260385, 1.308996, 0.5979767, 1, 1, 1, 1, 1,
1.26061, -1.39265, 1.378382, 1, 1, 1, 1, 1,
1.269176, 0.6437208, 1.524233, 1, 1, 1, 1, 1,
1.26949, -0.6195856, 2.155529, 1, 1, 1, 1, 1,
1.270625, 0.2496374, 0.5159692, 0, 0, 1, 1, 1,
1.276487, 1.368796, -0.1742523, 1, 0, 0, 1, 1,
1.286853, -1.561277, 3.514101, 1, 0, 0, 1, 1,
1.302653, 1.140725, 2.840171, 1, 0, 0, 1, 1,
1.316381, 1.253513, 0.8805377, 1, 0, 0, 1, 1,
1.323315, -0.3633963, 1.024954, 1, 0, 0, 1, 1,
1.332605, 1.300846, -0.1060423, 0, 0, 0, 1, 1,
1.351004, 0.2921315, 1.014212, 0, 0, 0, 1, 1,
1.358842, -1.264029, 3.254045, 0, 0, 0, 1, 1,
1.369325, -0.7669575, 2.348798, 0, 0, 0, 1, 1,
1.370405, -0.8849747, 2.543355, 0, 0, 0, 1, 1,
1.373124, -0.7839997, 3.309405, 0, 0, 0, 1, 1,
1.375335, -0.0999706, 0.7535533, 0, 0, 0, 1, 1,
1.376514, 0.5510252, 0.4308963, 1, 1, 1, 1, 1,
1.37846, 0.2276243, 2.011079, 1, 1, 1, 1, 1,
1.389116, -1.53052, 2.516324, 1, 1, 1, 1, 1,
1.394806, -0.5100387, 2.352482, 1, 1, 1, 1, 1,
1.464095, -1.475185, 1.906368, 1, 1, 1, 1, 1,
1.468623, 0.4644634, 1.064085, 1, 1, 1, 1, 1,
1.469283, 0.5452359, 2.668515, 1, 1, 1, 1, 1,
1.483573, 1.190102, 1.377456, 1, 1, 1, 1, 1,
1.483921, 1.24013, -0.2884553, 1, 1, 1, 1, 1,
1.509894, -0.730996, 2.303178, 1, 1, 1, 1, 1,
1.512551, -0.9788895, 2.638638, 1, 1, 1, 1, 1,
1.517154, -1.774624, 2.321726, 1, 1, 1, 1, 1,
1.524758, -0.8192283, 0.6587155, 1, 1, 1, 1, 1,
1.530398, -0.9238612, 2.502314, 1, 1, 1, 1, 1,
1.535553, -0.6731077, 1.405047, 1, 1, 1, 1, 1,
1.536364, 0.389906, 1.917328, 0, 0, 1, 1, 1,
1.545705, -0.004768435, -0.516233, 1, 0, 0, 1, 1,
1.547363, -1.071746, 2.273795, 1, 0, 0, 1, 1,
1.54882, -0.9714203, 3.056593, 1, 0, 0, 1, 1,
1.577496, -0.7593958, 2.488008, 1, 0, 0, 1, 1,
1.581754, -0.5743134, 2.725405, 1, 0, 0, 1, 1,
1.5828, -0.236321, 0.05293287, 0, 0, 0, 1, 1,
1.609096, -1.033692, 2.958329, 0, 0, 0, 1, 1,
1.620299, -0.5693017, 1.224899, 0, 0, 0, 1, 1,
1.620696, -1.453709, 0.5618545, 0, 0, 0, 1, 1,
1.634713, -0.4663755, 3.340334, 0, 0, 0, 1, 1,
1.63844, -0.6242332, 1.700785, 0, 0, 0, 1, 1,
1.643396, -1.397912, 2.807619, 0, 0, 0, 1, 1,
1.644869, -0.7605058, 0.6807991, 1, 1, 1, 1, 1,
1.651602, -0.7415245, 1.401747, 1, 1, 1, 1, 1,
1.655061, -1.416843, 2.962834, 1, 1, 1, 1, 1,
1.657113, 1.549928, 0.4025635, 1, 1, 1, 1, 1,
1.659549, 0.3871134, 0.6701049, 1, 1, 1, 1, 1,
1.669347, -0.5436583, 1.590439, 1, 1, 1, 1, 1,
1.694569, 0.04938853, 0.6736818, 1, 1, 1, 1, 1,
1.71812, -0.7364895, 0.970533, 1, 1, 1, 1, 1,
1.723603, 0.5447446, 2.179374, 1, 1, 1, 1, 1,
1.724251, 2.024505, -0.1516409, 1, 1, 1, 1, 1,
1.726528, -0.4104658, 2.516274, 1, 1, 1, 1, 1,
1.732745, 0.6833285, 0.5166573, 1, 1, 1, 1, 1,
1.736345, 0.4010524, 3.092597, 1, 1, 1, 1, 1,
1.753086, 1.176229, 0.7372329, 1, 1, 1, 1, 1,
1.759003, 0.07819132, 0.7772825, 1, 1, 1, 1, 1,
1.777124, -2.284274, 0.8825496, 0, 0, 1, 1, 1,
1.789419, 0.8911378, 1.923818, 1, 0, 0, 1, 1,
1.793031, -0.9541724, 1.871164, 1, 0, 0, 1, 1,
1.819466, -0.778744, 2.419104, 1, 0, 0, 1, 1,
1.84076, -0.3361793, 2.403996, 1, 0, 0, 1, 1,
1.883645, -0.1169969, 1.353649, 1, 0, 0, 1, 1,
1.89263, -0.5525285, 1.091322, 0, 0, 0, 1, 1,
1.932488, 0.3127919, 2.053258, 0, 0, 0, 1, 1,
1.950123, -0.2319993, 2.730068, 0, 0, 0, 1, 1,
1.961555, 0.2160513, 2.175833, 0, 0, 0, 1, 1,
2.009527, -1.711017, 2.194865, 0, 0, 0, 1, 1,
2.038675, -0.1919424, 1.233184, 0, 0, 0, 1, 1,
2.048691, 0.2227504, -0.3079341, 0, 0, 0, 1, 1,
2.052329, 0.7576134, -0.2988183, 1, 1, 1, 1, 1,
2.06214, -1.059277, 3.207254, 1, 1, 1, 1, 1,
2.065632, 1.090591, 1.007368, 1, 1, 1, 1, 1,
2.076361, -0.357321, 1.641243, 1, 1, 1, 1, 1,
2.121946, -0.586736, 2.20886, 1, 1, 1, 1, 1,
2.122827, -0.5743256, 0.8686446, 1, 1, 1, 1, 1,
2.142117, 0.2832724, 0.1119092, 1, 1, 1, 1, 1,
2.142665, 1.993164, 2.066108, 1, 1, 1, 1, 1,
2.153362, 0.5520728, 0.15084, 1, 1, 1, 1, 1,
2.15559, 1.056046, 1.055445, 1, 1, 1, 1, 1,
2.158142, 0.6679641, 1.020427, 1, 1, 1, 1, 1,
2.193196, -0.9168608, 1.060953, 1, 1, 1, 1, 1,
2.220051, -0.1956146, 0.939092, 1, 1, 1, 1, 1,
2.23319, 2.514712, 1.031986, 1, 1, 1, 1, 1,
2.248112, -0.2161323, 1.757192, 1, 1, 1, 1, 1,
2.251203, -0.2405157, 1.125105, 0, 0, 1, 1, 1,
2.292079, 0.9806911, 0.5152789, 1, 0, 0, 1, 1,
2.298616, 1.662851, 1.200839, 1, 0, 0, 1, 1,
2.324445, 1.536676, 1.476677, 1, 0, 0, 1, 1,
2.373299, 0.03878792, 0.8395982, 1, 0, 0, 1, 1,
2.410051, 0.6352188, 1.152919, 1, 0, 0, 1, 1,
2.426554, 0.6817904, 1.537645, 0, 0, 0, 1, 1,
2.447833, 0.2906691, 0.6268444, 0, 0, 0, 1, 1,
2.461391, -0.4237017, 1.140415, 0, 0, 0, 1, 1,
2.478333, 0.785079, 1.63398, 0, 0, 0, 1, 1,
2.478998, 0.8696721, 0.3719376, 0, 0, 0, 1, 1,
2.482383, 0.9295192, 0.2842631, 0, 0, 0, 1, 1,
2.499714, 0.06222602, 1.202417, 0, 0, 0, 1, 1,
2.519336, -0.1894015, 1.25517, 1, 1, 1, 1, 1,
2.537103, -0.193145, 0.3895991, 1, 1, 1, 1, 1,
2.666045, 1.103943, 1.252253, 1, 1, 1, 1, 1,
2.842807, 2.149242, 1.729289, 1, 1, 1, 1, 1,
2.845227, 1.303981, 2.941844, 1, 1, 1, 1, 1,
3.49981, -0.3166982, 2.710476, 1, 1, 1, 1, 1,
3.540164, 0.6947808, 2.048701, 1, 1, 1, 1, 1
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
var radius = 9.676298;
var distance = 33.98759;
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
mvMatrix.translate( -0.03388858, 0.08836949, -0.4251473 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.98759);
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
