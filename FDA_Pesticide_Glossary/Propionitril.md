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
-3.033767, 0.8259056, -2.029951, 1, 0, 0, 1,
-2.920097, -0.2666932, -2.251312, 1, 0.007843138, 0, 1,
-2.791078, 0.3764823, -2.273025, 1, 0.01176471, 0, 1,
-2.639272, -0.02739984, -4.145627, 1, 0.01960784, 0, 1,
-2.589565, -0.7415982, 0.4674585, 1, 0.02352941, 0, 1,
-2.416126, -0.4935699, -1.768486, 1, 0.03137255, 0, 1,
-2.379248, 0.4741036, -2.082901, 1, 0.03529412, 0, 1,
-2.322044, -1.498956, -3.015938, 1, 0.04313726, 0, 1,
-2.299902, -0.276717, -2.296475, 1, 0.04705882, 0, 1,
-2.284636, -0.3210309, -1.706948, 1, 0.05490196, 0, 1,
-2.278445, -0.06580535, -1.870861, 1, 0.05882353, 0, 1,
-2.191665, -0.3109785, -0.9047143, 1, 0.06666667, 0, 1,
-2.178599, 0.3696567, -2.03082, 1, 0.07058824, 0, 1,
-2.177348, 0.08294007, 0.260023, 1, 0.07843138, 0, 1,
-2.174373, 0.3339152, -1.457301, 1, 0.08235294, 0, 1,
-2.158937, -1.075679, -2.876118, 1, 0.09019608, 0, 1,
-2.126813, -1.096676, -1.746551, 1, 0.09411765, 0, 1,
-2.088067, 0.4698514, 0.7471749, 1, 0.1019608, 0, 1,
-2.058184, 0.1773478, -2.088409, 1, 0.1098039, 0, 1,
-2.036145, 0.6167065, -1.107409, 1, 0.1137255, 0, 1,
-2.001998, 0.7929947, -0.7219878, 1, 0.1215686, 0, 1,
-1.996845, 1.091408, -1.623604, 1, 0.1254902, 0, 1,
-1.980611, 0.3025257, -0.1605622, 1, 0.1333333, 0, 1,
-1.978703, -0.02505011, -0.9417248, 1, 0.1372549, 0, 1,
-1.972443, -0.2090113, -2.87471, 1, 0.145098, 0, 1,
-1.962169, -1.191782, -0.9541842, 1, 0.1490196, 0, 1,
-1.943807, 0.868933, 0.06318003, 1, 0.1568628, 0, 1,
-1.932713, 0.2704939, -3.292448, 1, 0.1607843, 0, 1,
-1.911064, 0.5491894, -1.343774, 1, 0.1686275, 0, 1,
-1.900079, 0.06243584, -1.635035, 1, 0.172549, 0, 1,
-1.883701, -0.2376034, -0.2356608, 1, 0.1803922, 0, 1,
-1.851124, 0.7297171, -0.8673242, 1, 0.1843137, 0, 1,
-1.828653, -1.746958, -2.609375, 1, 0.1921569, 0, 1,
-1.827042, -0.4351, -1.805417, 1, 0.1960784, 0, 1,
-1.825411, 0.2591655, -1.249414, 1, 0.2039216, 0, 1,
-1.825032, 0.1656765, -2.107709, 1, 0.2117647, 0, 1,
-1.808087, 0.3171831, -0.8464973, 1, 0.2156863, 0, 1,
-1.781282, 0.6290144, -1.240277, 1, 0.2235294, 0, 1,
-1.765423, -1.238579, -3.467084, 1, 0.227451, 0, 1,
-1.74795, -0.2765736, -2.061811, 1, 0.2352941, 0, 1,
-1.741563, -0.3433546, -2.259693, 1, 0.2392157, 0, 1,
-1.737041, -0.3158019, -1.624094, 1, 0.2470588, 0, 1,
-1.736765, -0.1492615, -1.840213, 1, 0.2509804, 0, 1,
-1.735582, 0.1236665, -1.581734, 1, 0.2588235, 0, 1,
-1.722121, 1.116563, -2.112427, 1, 0.2627451, 0, 1,
-1.703382, -1.29746, -1.355262, 1, 0.2705882, 0, 1,
-1.701471, 1.193132, -1.129514, 1, 0.2745098, 0, 1,
-1.670947, 0.3879597, -0.624961, 1, 0.282353, 0, 1,
-1.645744, 0.439566, -1.011116, 1, 0.2862745, 0, 1,
-1.645273, -0.8523413, -1.702207, 1, 0.2941177, 0, 1,
-1.642489, -0.7100599, -1.218573, 1, 0.3019608, 0, 1,
-1.639801, -0.4690996, -2.040354, 1, 0.3058824, 0, 1,
-1.632278, -0.06385577, -0.2066414, 1, 0.3137255, 0, 1,
-1.620155, 0.1363092, -1.145549, 1, 0.3176471, 0, 1,
-1.612459, -0.4324372, -0.7533516, 1, 0.3254902, 0, 1,
-1.586863, 0.2447566, -1.196529, 1, 0.3294118, 0, 1,
-1.570935, 0.5514926, -1.078894, 1, 0.3372549, 0, 1,
-1.569316, 1.912233, -0.5173219, 1, 0.3411765, 0, 1,
-1.562519, -0.9292396, -0.7234773, 1, 0.3490196, 0, 1,
-1.555659, 0.2649826, -1.274296, 1, 0.3529412, 0, 1,
-1.554873, -1.20142, -2.158615, 1, 0.3607843, 0, 1,
-1.546073, -0.000684683, -2.251316, 1, 0.3647059, 0, 1,
-1.544147, -0.5774168, -3.813252, 1, 0.372549, 0, 1,
-1.529155, 1.595465, -0.7645863, 1, 0.3764706, 0, 1,
-1.493778, 1.048536, -0.3422258, 1, 0.3843137, 0, 1,
-1.483821, 0.1002254, -3.778561, 1, 0.3882353, 0, 1,
-1.480691, -0.07150298, -0.1546738, 1, 0.3960784, 0, 1,
-1.47162, 1.126494, -2.270032, 1, 0.4039216, 0, 1,
-1.447886, -0.4775896, -0.578851, 1, 0.4078431, 0, 1,
-1.447453, -0.9049842, -3.23076, 1, 0.4156863, 0, 1,
-1.44029, 0.6393816, -0.09869624, 1, 0.4196078, 0, 1,
-1.433855, -0.1310747, -2.334146, 1, 0.427451, 0, 1,
-1.414501, -0.7563432, -3.84083, 1, 0.4313726, 0, 1,
-1.412806, -0.5887069, -1.227105, 1, 0.4392157, 0, 1,
-1.409636, 1.044502, -0.8077582, 1, 0.4431373, 0, 1,
-1.392207, -1.152344, -1.185427, 1, 0.4509804, 0, 1,
-1.388804, -0.6276105, -2.220274, 1, 0.454902, 0, 1,
-1.384661, 1.762447, -1.597981, 1, 0.4627451, 0, 1,
-1.374607, 0.08521365, -2.132872, 1, 0.4666667, 0, 1,
-1.37216, 0.5877035, -2.37053, 1, 0.4745098, 0, 1,
-1.371717, -0.6665097, -2.744269, 1, 0.4784314, 0, 1,
-1.365883, -0.1367168, -1.087163, 1, 0.4862745, 0, 1,
-1.365026, -0.1638006, -2.519701, 1, 0.4901961, 0, 1,
-1.362228, 0.2245202, -0.1345044, 1, 0.4980392, 0, 1,
-1.351156, -0.3101865, -1.772985, 1, 0.5058824, 0, 1,
-1.342671, -1.365378, -1.198921, 1, 0.509804, 0, 1,
-1.330125, 0.1861682, -0.7751625, 1, 0.5176471, 0, 1,
-1.32338, -0.3712289, -0.9388127, 1, 0.5215687, 0, 1,
-1.321378, -0.01516592, -2.646962, 1, 0.5294118, 0, 1,
-1.316454, 0.2841067, -1.118415, 1, 0.5333334, 0, 1,
-1.315759, -0.4598311, -3.062717, 1, 0.5411765, 0, 1,
-1.312791, -1.116462, -0.6752726, 1, 0.5450981, 0, 1,
-1.310886, -0.2213355, -1.676641, 1, 0.5529412, 0, 1,
-1.307117, 0.3685185, 0.3933322, 1, 0.5568628, 0, 1,
-1.304938, -0.003382012, -1.309897, 1, 0.5647059, 0, 1,
-1.278578, 1.516106, -0.1719227, 1, 0.5686275, 0, 1,
-1.266423, 1.554139, -1.040313, 1, 0.5764706, 0, 1,
-1.251208, -2.66019, -1.967506, 1, 0.5803922, 0, 1,
-1.247001, -0.3898489, -1.236201, 1, 0.5882353, 0, 1,
-1.245244, -1.508043, -1.329354, 1, 0.5921569, 0, 1,
-1.236251, -1.39119, -2.216794, 1, 0.6, 0, 1,
-1.235914, 0.4089176, -1.0072, 1, 0.6078432, 0, 1,
-1.231857, 1.450789, -0.857038, 1, 0.6117647, 0, 1,
-1.225339, 0.7479894, 1.416858, 1, 0.6196079, 0, 1,
-1.220286, 0.4561817, -1.166051, 1, 0.6235294, 0, 1,
-1.219371, 1.030728, -0.2678282, 1, 0.6313726, 0, 1,
-1.203031, -0.3334614, -2.957784, 1, 0.6352941, 0, 1,
-1.19699, 0.2158421, -0.8280096, 1, 0.6431373, 0, 1,
-1.196743, -0.706987, -1.603433, 1, 0.6470588, 0, 1,
-1.192531, 0.1481137, -0.1561435, 1, 0.654902, 0, 1,
-1.188642, 1.243394, -0.5757375, 1, 0.6588235, 0, 1,
-1.181047, 1.639726, -0.1083867, 1, 0.6666667, 0, 1,
-1.176897, -0.4977601, -3.913191, 1, 0.6705883, 0, 1,
-1.167847, -0.03888473, -2.563765, 1, 0.6784314, 0, 1,
-1.163719, 0.5290325, -3.874277, 1, 0.682353, 0, 1,
-1.161248, -1.225526, -2.018871, 1, 0.6901961, 0, 1,
-1.161136, -0.2075389, -3.145083, 1, 0.6941177, 0, 1,
-1.159821, -1.422655, -4.201081, 1, 0.7019608, 0, 1,
-1.151044, -0.4545463, -3.775137, 1, 0.7098039, 0, 1,
-1.150836, -0.7908633, -1.780653, 1, 0.7137255, 0, 1,
-1.143116, -0.5937902, -2.066129, 1, 0.7215686, 0, 1,
-1.128479, 0.7130941, -0.301552, 1, 0.7254902, 0, 1,
-1.126311, -0.8381416, -3.132154, 1, 0.7333333, 0, 1,
-1.122522, 0.09924009, 0.2826781, 1, 0.7372549, 0, 1,
-1.11345, -0.8708307, -3.029166, 1, 0.7450981, 0, 1,
-1.106383, 0.4034487, 0.1380063, 1, 0.7490196, 0, 1,
-1.103485, -0.3351583, -0.9593372, 1, 0.7568628, 0, 1,
-1.095894, 1.087651, 1.121111, 1, 0.7607843, 0, 1,
-1.095358, 1.431328, -1.193678, 1, 0.7686275, 0, 1,
-1.092633, -1.499458, -1.761044, 1, 0.772549, 0, 1,
-1.090033, 0.6153834, -0.4380783, 1, 0.7803922, 0, 1,
-1.089995, -0.2680575, -1.67628, 1, 0.7843137, 0, 1,
-1.086517, -1.197099, -2.275938, 1, 0.7921569, 0, 1,
-1.069267, -1.25326, -1.439715, 1, 0.7960784, 0, 1,
-1.068377, -0.9402491, -3.171237, 1, 0.8039216, 0, 1,
-1.061355, -0.8978075, -1.849739, 1, 0.8117647, 0, 1,
-1.059764, 1.127551, -2.391816, 1, 0.8156863, 0, 1,
-1.058904, -0.8134382, -1.813621, 1, 0.8235294, 0, 1,
-1.057752, 0.9787858, -1.596867, 1, 0.827451, 0, 1,
-1.054326, 0.1154271, -2.141078, 1, 0.8352941, 0, 1,
-1.044332, 0.4195981, 0.3898809, 1, 0.8392157, 0, 1,
-1.042286, 0.09480834, -2.981066, 1, 0.8470588, 0, 1,
-1.04082, 0.3352504, -0.5374491, 1, 0.8509804, 0, 1,
-1.036536, -0.2333562, -1.386035, 1, 0.8588235, 0, 1,
-1.03616, 0.862529, -1.195642, 1, 0.8627451, 0, 1,
-1.035434, -0.9710701, -2.554878, 1, 0.8705882, 0, 1,
-1.033161, -0.5165653, -1.950172, 1, 0.8745098, 0, 1,
-1.032121, 1.474176, -1.407309, 1, 0.8823529, 0, 1,
-1.029819, -0.2426269, -1.55572, 1, 0.8862745, 0, 1,
-1.029484, -0.9132354, -3.101734, 1, 0.8941177, 0, 1,
-1.017352, 0.3491283, -1.938287, 1, 0.8980392, 0, 1,
-1.014535, -1.242828, -2.488158, 1, 0.9058824, 0, 1,
-1.009614, -0.8096541, -3.792519, 1, 0.9137255, 0, 1,
-1.002172, -0.2001341, -2.736194, 1, 0.9176471, 0, 1,
-1.000772, 1.647892, 0.6643751, 1, 0.9254902, 0, 1,
-0.995348, 0.5806316, -0.2926162, 1, 0.9294118, 0, 1,
-0.9839739, -0.6725566, -1.373315, 1, 0.9372549, 0, 1,
-0.9773224, -0.2207665, -1.733356, 1, 0.9411765, 0, 1,
-0.9755669, 0.3122042, -0.9720522, 1, 0.9490196, 0, 1,
-0.9739376, 1.245526, -0.08696978, 1, 0.9529412, 0, 1,
-0.9704489, -1.239148, -2.804652, 1, 0.9607843, 0, 1,
-0.9628789, -0.9099871, -2.35137, 1, 0.9647059, 0, 1,
-0.9583343, -0.375535, -2.412944, 1, 0.972549, 0, 1,
-0.950047, -1.19403, -3.231776, 1, 0.9764706, 0, 1,
-0.9387519, -0.1420002, -1.856323, 1, 0.9843137, 0, 1,
-0.9382513, 0.1750547, -0.7598838, 1, 0.9882353, 0, 1,
-0.9382356, -0.1693971, -3.902959, 1, 0.9960784, 0, 1,
-0.9257843, -0.2111962, 0.009094425, 0.9960784, 1, 0, 1,
-0.9025109, -0.07491709, -1.485903, 0.9921569, 1, 0, 1,
-0.8995579, 0.9273384, -0.2428879, 0.9843137, 1, 0, 1,
-0.8865082, -0.04149223, -1.304804, 0.9803922, 1, 0, 1,
-0.8863902, 0.186788, -0.8476135, 0.972549, 1, 0, 1,
-0.8825703, -0.6571044, -1.382408, 0.9686275, 1, 0, 1,
-0.8821781, -1.445847, -3.047746, 0.9607843, 1, 0, 1,
-0.8784907, -0.6509321, -2.968874, 0.9568627, 1, 0, 1,
-0.8705405, 0.8650674, -0.725106, 0.9490196, 1, 0, 1,
-0.8669558, 0.9546479, -2.043164, 0.945098, 1, 0, 1,
-0.8627315, -0.6443264, -3.130386, 0.9372549, 1, 0, 1,
-0.8612732, -0.3422661, -3.756761, 0.9333333, 1, 0, 1,
-0.8583069, 0.04656262, -1.50797, 0.9254902, 1, 0, 1,
-0.8540263, -0.05671419, -3.487756, 0.9215686, 1, 0, 1,
-0.8508191, 0.1958345, -0.5707633, 0.9137255, 1, 0, 1,
-0.8502319, 0.4252491, -1.647292, 0.9098039, 1, 0, 1,
-0.8462331, 1.385654, -2.644011, 0.9019608, 1, 0, 1,
-0.8449975, 0.08910105, -4.510825, 0.8941177, 1, 0, 1,
-0.8443332, -1.024042, -2.923431, 0.8901961, 1, 0, 1,
-0.8389721, 0.05042837, -2.956021, 0.8823529, 1, 0, 1,
-0.838666, 0.6758076, -1.209603, 0.8784314, 1, 0, 1,
-0.8259043, 0.5343054, 0.5613164, 0.8705882, 1, 0, 1,
-0.8220788, 0.2156067, -2.578551, 0.8666667, 1, 0, 1,
-0.8185698, -0.7749135, -2.498484, 0.8588235, 1, 0, 1,
-0.8125795, 0.1002462, -1.309691, 0.854902, 1, 0, 1,
-0.8091376, 0.1383812, -1.328745, 0.8470588, 1, 0, 1,
-0.8088088, 1.254559, -2.628995, 0.8431373, 1, 0, 1,
-0.8046293, 0.3275186, -2.210818, 0.8352941, 1, 0, 1,
-0.8044739, 1.21152, -2.80011, 0.8313726, 1, 0, 1,
-0.8035136, 1.646011, -0.330275, 0.8235294, 1, 0, 1,
-0.7833994, -0.4778779, -2.580155, 0.8196079, 1, 0, 1,
-0.7827052, 0.184775, -1.457696, 0.8117647, 1, 0, 1,
-0.7796639, -1.618349, -3.68994, 0.8078431, 1, 0, 1,
-0.777607, -0.8991985, -2.782868, 0.8, 1, 0, 1,
-0.7742538, -0.6526596, -1.917531, 0.7921569, 1, 0, 1,
-0.7680225, 0.8551143, -1.520935, 0.7882353, 1, 0, 1,
-0.7679222, -0.6444225, -4.420326, 0.7803922, 1, 0, 1,
-0.7637653, 0.4444911, -1.580114, 0.7764706, 1, 0, 1,
-0.7634529, 2.264102, -0.7460379, 0.7686275, 1, 0, 1,
-0.7588534, 0.3636079, 0.5559332, 0.7647059, 1, 0, 1,
-0.7566403, 1.281953, -0.4288741, 0.7568628, 1, 0, 1,
-0.7455546, -1.205811, -2.917615, 0.7529412, 1, 0, 1,
-0.7452034, -1.00228, -3.601318, 0.7450981, 1, 0, 1,
-0.7443395, 0.5637699, -2.110194, 0.7411765, 1, 0, 1,
-0.7433599, -1.881459, -4.268825, 0.7333333, 1, 0, 1,
-0.7408034, -0.1787119, -2.622567, 0.7294118, 1, 0, 1,
-0.7406729, -0.5898813, -1.529716, 0.7215686, 1, 0, 1,
-0.7281545, 1.539253, -1.099018, 0.7176471, 1, 0, 1,
-0.7280361, 0.6525664, -1.825195, 0.7098039, 1, 0, 1,
-0.719026, -0.09222353, -2.274486, 0.7058824, 1, 0, 1,
-0.715346, -2.049729, -1.685634, 0.6980392, 1, 0, 1,
-0.7149584, 0.01712677, -0.6784801, 0.6901961, 1, 0, 1,
-0.7106897, 0.7369127, -0.2138414, 0.6862745, 1, 0, 1,
-0.7099547, -1.423244, -1.142577, 0.6784314, 1, 0, 1,
-0.7092825, 0.709942, 0.4654156, 0.6745098, 1, 0, 1,
-0.7087983, -0.4784636, -3.611569, 0.6666667, 1, 0, 1,
-0.7057899, 0.7086866, -0.7053126, 0.6627451, 1, 0, 1,
-0.7046965, -0.9878635, -2.308795, 0.654902, 1, 0, 1,
-0.7009087, 0.6013652, -1.223678, 0.6509804, 1, 0, 1,
-0.6996467, -0.3914239, -2.765532, 0.6431373, 1, 0, 1,
-0.6992071, 0.6134298, 0.8337559, 0.6392157, 1, 0, 1,
-0.6962885, -0.8027859, -0.8844042, 0.6313726, 1, 0, 1,
-0.691902, 0.6410369, -1.632985, 0.627451, 1, 0, 1,
-0.6908435, -0.3984108, -3.659428, 0.6196079, 1, 0, 1,
-0.6901562, -0.08842909, -1.176977, 0.6156863, 1, 0, 1,
-0.690025, 1.394214, 0.07467463, 0.6078432, 1, 0, 1,
-0.6837564, -0.7144706, -2.834267, 0.6039216, 1, 0, 1,
-0.6802238, 1.365494, -0.4611713, 0.5960785, 1, 0, 1,
-0.6791847, -0.6419482, -2.518855, 0.5882353, 1, 0, 1,
-0.6744662, 0.4806215, -0.5395698, 0.5843138, 1, 0, 1,
-0.6735227, 0.853367, -1.706486, 0.5764706, 1, 0, 1,
-0.6729192, -0.8878743, -2.857375, 0.572549, 1, 0, 1,
-0.6665446, -0.5376162, -1.993838, 0.5647059, 1, 0, 1,
-0.6651869, 0.2109855, -0.191403, 0.5607843, 1, 0, 1,
-0.6595422, -0.4909181, -1.361822, 0.5529412, 1, 0, 1,
-0.6572311, -0.8147346, -4.72096, 0.5490196, 1, 0, 1,
-0.6515767, 0.9639445, -1.235558, 0.5411765, 1, 0, 1,
-0.6505989, -0.09218308, -1.124423, 0.5372549, 1, 0, 1,
-0.6502829, -0.882848, -3.747201, 0.5294118, 1, 0, 1,
-0.6492246, -0.6875821, -2.015942, 0.5254902, 1, 0, 1,
-0.6482114, -0.9338798, -1.670463, 0.5176471, 1, 0, 1,
-0.6477858, 0.4162827, -0.2326211, 0.5137255, 1, 0, 1,
-0.6471642, 0.6506216, -2.310703, 0.5058824, 1, 0, 1,
-0.6467578, 0.9518121, -0.2606538, 0.5019608, 1, 0, 1,
-0.6467252, 1.732185, -0.2934683, 0.4941176, 1, 0, 1,
-0.6453577, 0.6116011, 0.09753366, 0.4862745, 1, 0, 1,
-0.64204, -0.1409625, -1.425271, 0.4823529, 1, 0, 1,
-0.6411058, 0.5820331, -1.040929, 0.4745098, 1, 0, 1,
-0.6368887, 0.7838923, -2.091751, 0.4705882, 1, 0, 1,
-0.6243588, -0.309358, -3.644993, 0.4627451, 1, 0, 1,
-0.622974, -0.4842643, -2.516459, 0.4588235, 1, 0, 1,
-0.621139, 1.913037, -1.656283, 0.4509804, 1, 0, 1,
-0.6156833, -1.659844, -2.111002, 0.4470588, 1, 0, 1,
-0.6102747, 1.558011, -0.3894542, 0.4392157, 1, 0, 1,
-0.6053329, -0.1448415, -2.359828, 0.4352941, 1, 0, 1,
-0.6044065, 0.1751126, -0.46015, 0.427451, 1, 0, 1,
-0.5998391, -0.4658479, -2.067743, 0.4235294, 1, 0, 1,
-0.5995409, 1.878536, -0.9934777, 0.4156863, 1, 0, 1,
-0.5989047, -0.9657217, -0.7853015, 0.4117647, 1, 0, 1,
-0.5950029, 0.9415486, -1.155822, 0.4039216, 1, 0, 1,
-0.5929826, -1.24318, -3.225171, 0.3960784, 1, 0, 1,
-0.591822, 0.4079576, -0.3092928, 0.3921569, 1, 0, 1,
-0.5885099, 0.1361559, 1.462651, 0.3843137, 1, 0, 1,
-0.5849449, 0.09004346, -1.688294, 0.3803922, 1, 0, 1,
-0.5801901, 0.3627688, -2.004736, 0.372549, 1, 0, 1,
-0.5791118, 0.4459648, 0.4224084, 0.3686275, 1, 0, 1,
-0.5785245, -0.5004748, -4.129695, 0.3607843, 1, 0, 1,
-0.5649205, 0.5075902, 0.7726766, 0.3568628, 1, 0, 1,
-0.5583588, -0.9334542, -1.977112, 0.3490196, 1, 0, 1,
-0.5568483, 0.1772396, -0.8461277, 0.345098, 1, 0, 1,
-0.5542937, -1.03867, -3.384337, 0.3372549, 1, 0, 1,
-0.549686, 1.343606, 1.132939, 0.3333333, 1, 0, 1,
-0.540593, -1.486767, -2.408981, 0.3254902, 1, 0, 1,
-0.5348514, 1.82319, 0.417458, 0.3215686, 1, 0, 1,
-0.5323266, -0.3611019, -3.479086, 0.3137255, 1, 0, 1,
-0.5296499, -1.313651, -2.518319, 0.3098039, 1, 0, 1,
-0.5270294, 0.4652826, -0.9063164, 0.3019608, 1, 0, 1,
-0.5268061, -0.1268359, -3.012959, 0.2941177, 1, 0, 1,
-0.5229527, -0.8618519, -3.070132, 0.2901961, 1, 0, 1,
-0.5212693, -0.9060749, -4.003391, 0.282353, 1, 0, 1,
-0.5211064, -0.7915743, -3.0249, 0.2784314, 1, 0, 1,
-0.51805, 0.09516701, -1.302906, 0.2705882, 1, 0, 1,
-0.514973, 1.078469, -0.06276844, 0.2666667, 1, 0, 1,
-0.5098622, 1.580783, 0.9913972, 0.2588235, 1, 0, 1,
-0.5054147, 0.1186908, -2.483399, 0.254902, 1, 0, 1,
-0.5022383, 0.512798, -0.3459323, 0.2470588, 1, 0, 1,
-0.4994206, 0.05976611, -2.899292, 0.2431373, 1, 0, 1,
-0.4986886, 0.5600346, -1.732326, 0.2352941, 1, 0, 1,
-0.4932741, 0.3352428, -1.019191, 0.2313726, 1, 0, 1,
-0.4893625, -0.3910618, -3.297153, 0.2235294, 1, 0, 1,
-0.4891221, -1.361552, -3.586854, 0.2196078, 1, 0, 1,
-0.4857229, -0.06887495, -0.3284308, 0.2117647, 1, 0, 1,
-0.4815826, -0.6202056, -4.702826, 0.2078431, 1, 0, 1,
-0.4778528, 0.5856939, -0.8748279, 0.2, 1, 0, 1,
-0.4751073, 0.4484502, -1.085612, 0.1921569, 1, 0, 1,
-0.4685142, 1.014498, 0.1577567, 0.1882353, 1, 0, 1,
-0.4604844, -0.05496541, -2.323723, 0.1803922, 1, 0, 1,
-0.4590181, 0.8946586, 0.9203092, 0.1764706, 1, 0, 1,
-0.4584561, -0.6575944, -2.54893, 0.1686275, 1, 0, 1,
-0.4550684, 1.876954, 0.4408469, 0.1647059, 1, 0, 1,
-0.4550568, -0.3894485, -1.795492, 0.1568628, 1, 0, 1,
-0.4546567, 0.3808051, -0.909483, 0.1529412, 1, 0, 1,
-0.4545326, 1.574832, 0.3009044, 0.145098, 1, 0, 1,
-0.4534019, 1.009355, -0.2090234, 0.1411765, 1, 0, 1,
-0.4532852, -0.3168389, -3.196157, 0.1333333, 1, 0, 1,
-0.4523209, 0.7509744, -1.561543, 0.1294118, 1, 0, 1,
-0.4473126, 0.1739087, -1.486108, 0.1215686, 1, 0, 1,
-0.4470021, -1.080106, -1.952212, 0.1176471, 1, 0, 1,
-0.4448718, 0.5067932, -1.421884, 0.1098039, 1, 0, 1,
-0.4441369, 0.01081955, -0.9491217, 0.1058824, 1, 0, 1,
-0.4412725, -0.8709259, -1.628969, 0.09803922, 1, 0, 1,
-0.4400539, 0.7307971, -1.550837, 0.09019608, 1, 0, 1,
-0.4357884, -0.1907577, -3.331514, 0.08627451, 1, 0, 1,
-0.4357344, -0.4413491, -1.939439, 0.07843138, 1, 0, 1,
-0.4344531, -1.780364, -3.084351, 0.07450981, 1, 0, 1,
-0.4341298, 1.552812, -1.570497, 0.06666667, 1, 0, 1,
-0.4327998, -0.7303879, -3.817866, 0.0627451, 1, 0, 1,
-0.4304684, 0.6775438, 0.3822237, 0.05490196, 1, 0, 1,
-0.4303533, 0.8624289, -0.4215617, 0.05098039, 1, 0, 1,
-0.4302235, -0.8582843, -2.621619, 0.04313726, 1, 0, 1,
-0.4300126, 1.457503, -0.06661325, 0.03921569, 1, 0, 1,
-0.4266052, -0.5044957, -2.535009, 0.03137255, 1, 0, 1,
-0.4258642, 0.6834589, 0.1843393, 0.02745098, 1, 0, 1,
-0.4248425, -2.07993, -3.221427, 0.01960784, 1, 0, 1,
-0.4240547, -0.1890688, -2.990038, 0.01568628, 1, 0, 1,
-0.4224255, -0.4394748, -1.672989, 0.007843138, 1, 0, 1,
-0.4201519, 0.5986435, -2.219519, 0.003921569, 1, 0, 1,
-0.4199596, 0.9935941, 1.492653, 0, 1, 0.003921569, 1,
-0.4107619, 0.7080501, -0.9531251, 0, 1, 0.01176471, 1,
-0.40317, 1.409813, -0.2863032, 0, 1, 0.01568628, 1,
-0.3976837, 0.2581427, -0.1704111, 0, 1, 0.02352941, 1,
-0.3963979, -0.5253401, -3.155408, 0, 1, 0.02745098, 1,
-0.3954785, 0.05504204, -2.148313, 0, 1, 0.03529412, 1,
-0.3938955, 0.423943, -0.8950425, 0, 1, 0.03921569, 1,
-0.3893723, -1.292067, -3.781744, 0, 1, 0.04705882, 1,
-0.3877477, -1.393151, -1.316173, 0, 1, 0.05098039, 1,
-0.3825462, -0.04844942, -0.07997634, 0, 1, 0.05882353, 1,
-0.3814188, -1.129066, -3.433298, 0, 1, 0.0627451, 1,
-0.381404, 0.7605307, 1.206284, 0, 1, 0.07058824, 1,
-0.3802534, -0.2607589, -2.455196, 0, 1, 0.07450981, 1,
-0.3801638, -1.893339, -2.892127, 0, 1, 0.08235294, 1,
-0.3767197, 0.4711531, -0.6173115, 0, 1, 0.08627451, 1,
-0.3740521, -0.2052369, -2.212977, 0, 1, 0.09411765, 1,
-0.3717992, 2.853817, 0.02845462, 0, 1, 0.1019608, 1,
-0.370912, -0.5560141, -3.128886, 0, 1, 0.1058824, 1,
-0.3677596, -0.2022475, -1.484915, 0, 1, 0.1137255, 1,
-0.3662591, 0.7373458, -0.6915337, 0, 1, 0.1176471, 1,
-0.3633711, -0.7808477, -3.211546, 0, 1, 0.1254902, 1,
-0.3613637, -1.075868, -2.267808, 0, 1, 0.1294118, 1,
-0.3560439, -0.05044688, -2.242556, 0, 1, 0.1372549, 1,
-0.3551671, 0.4273945, -2.332525, 0, 1, 0.1411765, 1,
-0.3536264, 0.9873441, 0.8103641, 0, 1, 0.1490196, 1,
-0.3520032, -0.08588146, -0.1701992, 0, 1, 0.1529412, 1,
-0.3490718, 1.997487, -0.2273187, 0, 1, 0.1607843, 1,
-0.3460508, 1.346883, 0.8509599, 0, 1, 0.1647059, 1,
-0.3441457, 0.4013336, 0.7326745, 0, 1, 0.172549, 1,
-0.3375378, 1.004566, -1.33862, 0, 1, 0.1764706, 1,
-0.3348868, -1.341407, -1.724431, 0, 1, 0.1843137, 1,
-0.3337245, 1.022564, -1.17407, 0, 1, 0.1882353, 1,
-0.3333363, -0.8111239, -3.508701, 0, 1, 0.1960784, 1,
-0.3287488, 1.130388, -0.03465324, 0, 1, 0.2039216, 1,
-0.3280858, -0.9879066, -3.094574, 0, 1, 0.2078431, 1,
-0.3272027, -0.4085796, -1.753833, 0, 1, 0.2156863, 1,
-0.3237951, 1.104647, -2.807467, 0, 1, 0.2196078, 1,
-0.3178586, 0.09691732, -1.877151, 0, 1, 0.227451, 1,
-0.3154431, 0.1997609, 0.6770798, 0, 1, 0.2313726, 1,
-0.3143693, 0.3860919, 0.01200102, 0, 1, 0.2392157, 1,
-0.3127874, -0.3770573, 0.7740434, 0, 1, 0.2431373, 1,
-0.299701, -0.8414388, -0.707583, 0, 1, 0.2509804, 1,
-0.2948324, 0.1396736, -2.696671, 0, 1, 0.254902, 1,
-0.2880738, -0.640983, -2.966141, 0, 1, 0.2627451, 1,
-0.2868342, -0.4317339, -2.277969, 0, 1, 0.2666667, 1,
-0.2828079, -0.2392468, -0.9941735, 0, 1, 0.2745098, 1,
-0.2820085, 0.5355161, -2.330555, 0, 1, 0.2784314, 1,
-0.2802721, -0.6662543, -4.17692, 0, 1, 0.2862745, 1,
-0.2757, -0.4530069, -2.161803, 0, 1, 0.2901961, 1,
-0.2730042, -0.008101091, -2.76766, 0, 1, 0.2980392, 1,
-0.2707818, 0.4724169, -0.9064188, 0, 1, 0.3058824, 1,
-0.2696752, 1.028998, 0.4470751, 0, 1, 0.3098039, 1,
-0.2684094, -0.116154, -2.357335, 0, 1, 0.3176471, 1,
-0.2632639, 0.710268, -1.13639, 0, 1, 0.3215686, 1,
-0.2627535, -1.31839, -1.261539, 0, 1, 0.3294118, 1,
-0.2619557, 0.6868557, -0.8694763, 0, 1, 0.3333333, 1,
-0.2610023, 0.3589405, -0.2902402, 0, 1, 0.3411765, 1,
-0.2571905, 0.9759111, 0.9170564, 0, 1, 0.345098, 1,
-0.2557546, -0.9629748, -4.051325, 0, 1, 0.3529412, 1,
-0.2545763, -1.442715, -2.460468, 0, 1, 0.3568628, 1,
-0.2532269, -0.3258182, -1.27514, 0, 1, 0.3647059, 1,
-0.2524208, -0.08041674, -0.9091822, 0, 1, 0.3686275, 1,
-0.2498799, 1.009992, 0.1748181, 0, 1, 0.3764706, 1,
-0.246947, -0.2690722, -3.345001, 0, 1, 0.3803922, 1,
-0.2433272, 1.300624, 0.1677512, 0, 1, 0.3882353, 1,
-0.2419736, -1.252761, -3.466781, 0, 1, 0.3921569, 1,
-0.2400768, -0.3277405, -2.237745, 0, 1, 0.4, 1,
-0.2399675, 0.73417, -0.5312496, 0, 1, 0.4078431, 1,
-0.235298, 1.018376, 0.1252188, 0, 1, 0.4117647, 1,
-0.2326286, -0.0391917, -1.231872, 0, 1, 0.4196078, 1,
-0.2296989, 0.2503802, -0.009454061, 0, 1, 0.4235294, 1,
-0.2286772, -0.773546, -0.3871154, 0, 1, 0.4313726, 1,
-0.2209338, -0.1381133, -1.83734, 0, 1, 0.4352941, 1,
-0.2191812, 0.0678157, -1.00553, 0, 1, 0.4431373, 1,
-0.2187829, 0.8108228, 1.142286, 0, 1, 0.4470588, 1,
-0.215204, 0.02002244, -2.505297, 0, 1, 0.454902, 1,
-0.2118611, 0.1470056, -0.6392341, 0, 1, 0.4588235, 1,
-0.210844, 0.7903547, -1.594408, 0, 1, 0.4666667, 1,
-0.2107293, -0.6262812, -3.692567, 0, 1, 0.4705882, 1,
-0.2098868, 1.01911, -2.931593, 0, 1, 0.4784314, 1,
-0.2019121, 1.75189, -0.104423, 0, 1, 0.4823529, 1,
-0.1992914, -2.020187, -4.070578, 0, 1, 0.4901961, 1,
-0.1988141, -0.385721, -1.81004, 0, 1, 0.4941176, 1,
-0.1954674, 1.405011, 0.6687561, 0, 1, 0.5019608, 1,
-0.1946131, 1.170925, -0.9276562, 0, 1, 0.509804, 1,
-0.193235, -0.336192, -3.582464, 0, 1, 0.5137255, 1,
-0.186792, -0.2195195, -2.815645, 0, 1, 0.5215687, 1,
-0.1746632, 0.7820548, -0.81073, 0, 1, 0.5254902, 1,
-0.1746537, -0.5838547, -2.607529, 0, 1, 0.5333334, 1,
-0.1712159, -1.179551, -4.266901, 0, 1, 0.5372549, 1,
-0.1708056, -2.460812, -1.796471, 0, 1, 0.5450981, 1,
-0.167797, -1.778865, -3.751415, 0, 1, 0.5490196, 1,
-0.1670079, -1.50871, -2.829739, 0, 1, 0.5568628, 1,
-0.1635372, 0.2316661, -1.125891, 0, 1, 0.5607843, 1,
-0.1610004, 0.187503, -2.304973, 0, 1, 0.5686275, 1,
-0.1595325, 1.098777, -1.785925, 0, 1, 0.572549, 1,
-0.1577707, -0.2655583, 0.2555173, 0, 1, 0.5803922, 1,
-0.1473457, 1.246513, 0.01411614, 0, 1, 0.5843138, 1,
-0.1403436, -0.7254304, -3.889947, 0, 1, 0.5921569, 1,
-0.1403015, 2.117659, -0.8446375, 0, 1, 0.5960785, 1,
-0.1401758, 1.469702, -1.249072, 0, 1, 0.6039216, 1,
-0.1393778, -1.116633, -1.09949, 0, 1, 0.6117647, 1,
-0.1356983, 0.664915, 1.118843, 0, 1, 0.6156863, 1,
-0.134817, -0.7553, -3.084114, 0, 1, 0.6235294, 1,
-0.1338254, -1.106627, -1.731754, 0, 1, 0.627451, 1,
-0.1233221, 0.4541489, -0.5645345, 0, 1, 0.6352941, 1,
-0.1229898, 0.316438, -0.04087318, 0, 1, 0.6392157, 1,
-0.1199609, 2.158529, 0.00814977, 0, 1, 0.6470588, 1,
-0.115524, -0.6571307, -2.973438, 0, 1, 0.6509804, 1,
-0.1134927, -0.02459033, -2.5581, 0, 1, 0.6588235, 1,
-0.1038077, 1.005049, -0.2053656, 0, 1, 0.6627451, 1,
-0.09597917, 0.3552627, -0.2365886, 0, 1, 0.6705883, 1,
-0.09089775, 1.628952, 1.746683, 0, 1, 0.6745098, 1,
-0.09000412, -0.8883619, -3.617725, 0, 1, 0.682353, 1,
-0.08795728, -0.5987334, -3.706493, 0, 1, 0.6862745, 1,
-0.08489387, 1.373217, -2.440881, 0, 1, 0.6941177, 1,
-0.08301803, 1.756521, -1.253383, 0, 1, 0.7019608, 1,
-0.08127829, 0.2753706, 0.3251437, 0, 1, 0.7058824, 1,
-0.07861501, 0.4900758, -0.07717858, 0, 1, 0.7137255, 1,
-0.07465167, -0.5899974, -3.854238, 0, 1, 0.7176471, 1,
-0.06985996, 1.087205, -1.022685, 0, 1, 0.7254902, 1,
-0.06910194, 1.469595, -1.3266, 0, 1, 0.7294118, 1,
-0.06322853, 0.424132, -0.7791595, 0, 1, 0.7372549, 1,
-0.06005279, -0.02455429, -1.234737, 0, 1, 0.7411765, 1,
-0.05744524, 0.7176909, -0.6848509, 0, 1, 0.7490196, 1,
-0.05722671, 0.2220776, -1.30466, 0, 1, 0.7529412, 1,
-0.05715945, 0.5688828, -1.02624, 0, 1, 0.7607843, 1,
-0.05205281, 1.639743, 0.8327678, 0, 1, 0.7647059, 1,
-0.04576002, 0.1835495, 0.2431036, 0, 1, 0.772549, 1,
-0.04410057, 0.03313146, -2.148831, 0, 1, 0.7764706, 1,
-0.04362939, 0.2302662, -1.068121, 0, 1, 0.7843137, 1,
-0.04224742, -0.06597845, -2.784937, 0, 1, 0.7882353, 1,
-0.04012912, -0.5023497, -3.962403, 0, 1, 0.7960784, 1,
-0.03934885, -0.409452, -1.523112, 0, 1, 0.8039216, 1,
-0.03765465, 0.763253, -0.003482499, 0, 1, 0.8078431, 1,
-0.03094672, 0.3503358, -1.939571, 0, 1, 0.8156863, 1,
-0.02718624, 0.6081353, 2.016302, 0, 1, 0.8196079, 1,
-0.02669912, -0.1174255, -4.369594, 0, 1, 0.827451, 1,
-0.02230797, 1.099442, 0.01295548, 0, 1, 0.8313726, 1,
-0.02185214, -0.3474012, -2.183795, 0, 1, 0.8392157, 1,
-0.01820522, 0.2224516, -0.5400636, 0, 1, 0.8431373, 1,
-0.01520929, -0.3615405, -3.850986, 0, 1, 0.8509804, 1,
-0.006911087, -0.3539694, -1.879958, 0, 1, 0.854902, 1,
-0.006491147, -0.1626948, -4.633646, 0, 1, 0.8627451, 1,
-0.005830718, -0.3834358, -3.410956, 0, 1, 0.8666667, 1,
-0.005026782, 0.2659945, -0.903328, 0, 1, 0.8745098, 1,
-0.002403066, -0.3888315, -0.7414122, 0, 1, 0.8784314, 1,
0.001321682, 0.3702109, 1.362709, 0, 1, 0.8862745, 1,
0.001670894, 0.1866992, -0.3178445, 0, 1, 0.8901961, 1,
0.004222069, 2.260867, -0.2492876, 0, 1, 0.8980392, 1,
0.004807731, -1.078202, 4.173447, 0, 1, 0.9058824, 1,
0.006437906, -0.2956388, 4.261036, 0, 1, 0.9098039, 1,
0.0116174, 0.5345018, 0.5921884, 0, 1, 0.9176471, 1,
0.01447835, 0.5183353, -0.06659443, 0, 1, 0.9215686, 1,
0.01519082, -1.340623, 3.492056, 0, 1, 0.9294118, 1,
0.01771263, 0.04807475, -0.09579964, 0, 1, 0.9333333, 1,
0.01957323, 0.1629025, -1.807062, 0, 1, 0.9411765, 1,
0.02173194, 1.091687, 0.5234805, 0, 1, 0.945098, 1,
0.02219054, -0.9312764, 2.861438, 0, 1, 0.9529412, 1,
0.02230427, -0.961445, 3.321292, 0, 1, 0.9568627, 1,
0.02460263, -0.7948198, 5.192399, 0, 1, 0.9647059, 1,
0.02624852, -0.8265232, 3.573716, 0, 1, 0.9686275, 1,
0.02680116, -0.4804856, 1.933758, 0, 1, 0.9764706, 1,
0.02830348, -1.179448, 2.506015, 0, 1, 0.9803922, 1,
0.03491329, 0.7445226, 0.5283625, 0, 1, 0.9882353, 1,
0.03518211, -0.7802126, 1.973954, 0, 1, 0.9921569, 1,
0.04003179, 0.7284274, 0.4736849, 0, 1, 1, 1,
0.04100101, -0.5777711, 1.811808, 0, 0.9921569, 1, 1,
0.04349778, -0.1169487, 1.38515, 0, 0.9882353, 1, 1,
0.04512013, 0.3582979, 0.3089857, 0, 0.9803922, 1, 1,
0.04719663, -0.433337, 2.529045, 0, 0.9764706, 1, 1,
0.05040959, 0.6307467, -0.2287475, 0, 0.9686275, 1, 1,
0.0510966, 0.1872784, -2.041365, 0, 0.9647059, 1, 1,
0.05201618, -0.9747519, 3.364149, 0, 0.9568627, 1, 1,
0.05635796, -0.8700214, 2.661937, 0, 0.9529412, 1, 1,
0.056968, -0.9582357, 2.071281, 0, 0.945098, 1, 1,
0.05880922, -2.393468, 3.858835, 0, 0.9411765, 1, 1,
0.0629434, -0.4619021, 2.390606, 0, 0.9333333, 1, 1,
0.06324397, 1.514608, -0.2052419, 0, 0.9294118, 1, 1,
0.06440748, 0.4923078, 0.4853772, 0, 0.9215686, 1, 1,
0.06519022, 0.51662, 1.172334, 0, 0.9176471, 1, 1,
0.06823444, 1.05126, -0.3540998, 0, 0.9098039, 1, 1,
0.069703, 1.260071, -0.5834063, 0, 0.9058824, 1, 1,
0.0703087, 0.9440874, -0.5046599, 0, 0.8980392, 1, 1,
0.07395062, 0.277585, -1.49426, 0, 0.8901961, 1, 1,
0.07460356, 0.7845381, 1.084365, 0, 0.8862745, 1, 1,
0.07690063, 1.15744, -0.1914624, 0, 0.8784314, 1, 1,
0.07747545, -1.086481, 3.6417, 0, 0.8745098, 1, 1,
0.07892961, 1.076338, 0.2825105, 0, 0.8666667, 1, 1,
0.08011118, -0.6127977, 3.663848, 0, 0.8627451, 1, 1,
0.08072763, 0.5317404, 2.537287, 0, 0.854902, 1, 1,
0.08189356, -1.419373, 3.344191, 0, 0.8509804, 1, 1,
0.08722131, -0.1032317, 2.110743, 0, 0.8431373, 1, 1,
0.0876298, 0.4422118, 1.092527, 0, 0.8392157, 1, 1,
0.09108001, 2.494763, 1.629465, 0, 0.8313726, 1, 1,
0.09150046, 1.769284, -0.07567132, 0, 0.827451, 1, 1,
0.0924764, -0.993809, 1.604917, 0, 0.8196079, 1, 1,
0.09341469, 1.323419, 1.023046, 0, 0.8156863, 1, 1,
0.09720024, 1.289894, 1.41941, 0, 0.8078431, 1, 1,
0.0982677, 1.570087, -0.4170883, 0, 0.8039216, 1, 1,
0.09868101, 2.173516, -1.038654, 0, 0.7960784, 1, 1,
0.09953074, -1.155036, 3.831556, 0, 0.7882353, 1, 1,
0.1040918, -0.08596348, 2.873537, 0, 0.7843137, 1, 1,
0.1114351, 0.337791, -0.2499642, 0, 0.7764706, 1, 1,
0.1128214, -0.7170182, 3.586527, 0, 0.772549, 1, 1,
0.1132419, 0.09250408, 1.46513, 0, 0.7647059, 1, 1,
0.1188322, -0.06266367, 4.52528, 0, 0.7607843, 1, 1,
0.1200445, 0.07147519, 0.7075725, 0, 0.7529412, 1, 1,
0.122662, -3.311296, 4.43222, 0, 0.7490196, 1, 1,
0.1268157, -1.010728, 2.749449, 0, 0.7411765, 1, 1,
0.1299545, -0.460136, 2.060735, 0, 0.7372549, 1, 1,
0.1343605, -0.1074626, 0.7301534, 0, 0.7294118, 1, 1,
0.1384522, 1.531597, 0.7051347, 0, 0.7254902, 1, 1,
0.1390868, -0.3717028, 2.381775, 0, 0.7176471, 1, 1,
0.1411164, -1.887013, 2.333359, 0, 0.7137255, 1, 1,
0.1488525, 1.979316, 1.790768, 0, 0.7058824, 1, 1,
0.1526773, 1.284018, -1.461178, 0, 0.6980392, 1, 1,
0.1535383, 0.375633, 2.360428, 0, 0.6941177, 1, 1,
0.1596379, -0.4049819, 2.176225, 0, 0.6862745, 1, 1,
0.1629641, -0.496278, 2.315916, 0, 0.682353, 1, 1,
0.1633989, 1.120383, 0.3174019, 0, 0.6745098, 1, 1,
0.1645065, 0.7968021, -0.4505439, 0, 0.6705883, 1, 1,
0.1703109, 0.4315889, 0.8930164, 0, 0.6627451, 1, 1,
0.1729878, -1.108592, 1.381113, 0, 0.6588235, 1, 1,
0.1803251, -1.221696, 4.41356, 0, 0.6509804, 1, 1,
0.1812689, -0.1513344, 2.023923, 0, 0.6470588, 1, 1,
0.1826465, 0.6346024, 0.008366394, 0, 0.6392157, 1, 1,
0.1848745, 0.3399409, 1.463226, 0, 0.6352941, 1, 1,
0.1875259, 0.5144786, 1.004078, 0, 0.627451, 1, 1,
0.1901639, -1.061977, 2.620805, 0, 0.6235294, 1, 1,
0.1922792, -0.8966691, 2.976085, 0, 0.6156863, 1, 1,
0.196443, -0.4618308, 1.474484, 0, 0.6117647, 1, 1,
0.2001708, 0.05901938, 1.333541, 0, 0.6039216, 1, 1,
0.2002298, 0.001271035, 1.546391, 0, 0.5960785, 1, 1,
0.2029976, -0.203284, 2.221464, 0, 0.5921569, 1, 1,
0.2035662, -0.6790583, 2.144856, 0, 0.5843138, 1, 1,
0.2084065, 1.100522, -0.07334508, 0, 0.5803922, 1, 1,
0.212618, -0.8473606, 2.950835, 0, 0.572549, 1, 1,
0.2167049, 0.7717211, 0.6374044, 0, 0.5686275, 1, 1,
0.2198748, 0.8518061, -0.5231075, 0, 0.5607843, 1, 1,
0.2228995, -0.2354801, 4.338727, 0, 0.5568628, 1, 1,
0.2277317, -0.6497817, 3.450451, 0, 0.5490196, 1, 1,
0.2290737, 0.4136168, -0.4575075, 0, 0.5450981, 1, 1,
0.2337628, 0.8227809, 1.469568, 0, 0.5372549, 1, 1,
0.2400557, 0.9502702, -0.4910927, 0, 0.5333334, 1, 1,
0.2443264, 0.4096683, 0.4510723, 0, 0.5254902, 1, 1,
0.2448803, 1.364052, 1.891034, 0, 0.5215687, 1, 1,
0.246568, -1.464244, 2.085248, 0, 0.5137255, 1, 1,
0.246866, 2.436066, -0.02643696, 0, 0.509804, 1, 1,
0.2471835, 2.194267, 0.8708388, 0, 0.5019608, 1, 1,
0.2473048, 0.9599717, -0.8972041, 0, 0.4941176, 1, 1,
0.2475318, -0.5179397, 3.584249, 0, 0.4901961, 1, 1,
0.2496247, 0.2354316, -0.3012969, 0, 0.4823529, 1, 1,
0.2501769, -0.1322666, 2.618523, 0, 0.4784314, 1, 1,
0.253276, 0.09902374, 2.622504, 0, 0.4705882, 1, 1,
0.2536124, -1.320696, 3.543559, 0, 0.4666667, 1, 1,
0.2549993, 0.6975197, 1.249725, 0, 0.4588235, 1, 1,
0.2585917, -0.6430323, 3.839161, 0, 0.454902, 1, 1,
0.2600721, -0.9660361, 1.870366, 0, 0.4470588, 1, 1,
0.2603788, -0.7883124, 1.522499, 0, 0.4431373, 1, 1,
0.2605556, 1.496111, 0.05745487, 0, 0.4352941, 1, 1,
0.262367, 0.0910355, 1.722847, 0, 0.4313726, 1, 1,
0.2627034, -0.2718292, 1.98228, 0, 0.4235294, 1, 1,
0.2636674, -0.08813225, 0.134337, 0, 0.4196078, 1, 1,
0.2644545, -0.7619313, 3.728298, 0, 0.4117647, 1, 1,
0.2691351, -0.06629252, 2.213679, 0, 0.4078431, 1, 1,
0.2692446, 1.275551, 2.292633, 0, 0.4, 1, 1,
0.2695583, 1.24664, -0.1713936, 0, 0.3921569, 1, 1,
0.2700984, 0.5269849, 1.306248, 0, 0.3882353, 1, 1,
0.272729, 0.06993873, 0.2998818, 0, 0.3803922, 1, 1,
0.2728601, 0.6507046, 1.411583, 0, 0.3764706, 1, 1,
0.2733547, 0.5103111, 0.6981143, 0, 0.3686275, 1, 1,
0.2836773, -0.3068058, 3.329059, 0, 0.3647059, 1, 1,
0.2846463, 0.1660497, 0.2847057, 0, 0.3568628, 1, 1,
0.2860553, 0.5600623, 0.7447932, 0, 0.3529412, 1, 1,
0.2870386, 1.32253, 1.247887, 0, 0.345098, 1, 1,
0.2870688, 0.6374792, -0.9158491, 0, 0.3411765, 1, 1,
0.3017819, -1.027287, 4.842638, 0, 0.3333333, 1, 1,
0.3024855, 0.8432526, -0.1814943, 0, 0.3294118, 1, 1,
0.3029491, 0.9722025, 1.396353, 0, 0.3215686, 1, 1,
0.3035639, 0.2410334, 0.8960452, 0, 0.3176471, 1, 1,
0.3113551, 0.4877276, 0.400819, 0, 0.3098039, 1, 1,
0.3132828, 0.4708838, 0.8664784, 0, 0.3058824, 1, 1,
0.3139739, 0.2287625, -0.126716, 0, 0.2980392, 1, 1,
0.3184649, -0.08323904, 1.125171, 0, 0.2901961, 1, 1,
0.3201318, 0.2850425, 0.2012589, 0, 0.2862745, 1, 1,
0.3209474, -0.8263644, 2.214979, 0, 0.2784314, 1, 1,
0.3215724, -0.06520744, 1.21669, 0, 0.2745098, 1, 1,
0.3228043, 1.074692, 0.4341159, 0, 0.2666667, 1, 1,
0.3232471, 0.7350962, 1.052145, 0, 0.2627451, 1, 1,
0.3232611, 1.913534, -1.202909, 0, 0.254902, 1, 1,
0.326808, 0.6389138, 1.661533, 0, 0.2509804, 1, 1,
0.3339828, -2.072047, 1.9011, 0, 0.2431373, 1, 1,
0.3364711, -0.4546252, 3.657276, 0, 0.2392157, 1, 1,
0.3368849, -0.1370223, 2.116478, 0, 0.2313726, 1, 1,
0.342135, -0.5900581, 2.728388, 0, 0.227451, 1, 1,
0.3449706, -0.06620649, 2.56043, 0, 0.2196078, 1, 1,
0.3457388, 1.479946, 1.18043, 0, 0.2156863, 1, 1,
0.3500405, -0.8878937, 1.488854, 0, 0.2078431, 1, 1,
0.351171, -0.39735, 2.355036, 0, 0.2039216, 1, 1,
0.3601063, -0.2795098, 2.637099, 0, 0.1960784, 1, 1,
0.3655427, -0.2192182, 1.435606, 0, 0.1882353, 1, 1,
0.3766149, -1.101599, 2.417252, 0, 0.1843137, 1, 1,
0.3827315, 0.3533954, 0.4971105, 0, 0.1764706, 1, 1,
0.3834092, -0.4288183, 0.3068357, 0, 0.172549, 1, 1,
0.3847629, -0.4216126, 0.06818685, 0, 0.1647059, 1, 1,
0.3855135, 2.265075, 0.931912, 0, 0.1607843, 1, 1,
0.3875533, -0.1370403, 4.761848, 0, 0.1529412, 1, 1,
0.3890433, 1.742937, 0.8883334, 0, 0.1490196, 1, 1,
0.3922949, -1.731104, 3.626168, 0, 0.1411765, 1, 1,
0.3946705, -0.5879294, 3.153125, 0, 0.1372549, 1, 1,
0.3951527, 0.2411154, -0.4347194, 0, 0.1294118, 1, 1,
0.3958572, -0.6451626, 2.209292, 0, 0.1254902, 1, 1,
0.3960325, -0.7571356, 2.335767, 0, 0.1176471, 1, 1,
0.3974093, 0.1501364, 0.5676905, 0, 0.1137255, 1, 1,
0.3980414, 1.50867, -1.392742, 0, 0.1058824, 1, 1,
0.4034176, -0.8544639, 1.767942, 0, 0.09803922, 1, 1,
0.4035616, 1.678911, 2.682324, 0, 0.09411765, 1, 1,
0.4049132, -0.8002591, 2.058033, 0, 0.08627451, 1, 1,
0.4057838, 1.387756, 0.5556205, 0, 0.08235294, 1, 1,
0.4079716, 0.29714, 0.2514407, 0, 0.07450981, 1, 1,
0.4148709, -2.488676, 2.796271, 0, 0.07058824, 1, 1,
0.4189698, -0.3973856, 2.325657, 0, 0.0627451, 1, 1,
0.4254929, 0.4236073, 0.06092658, 0, 0.05882353, 1, 1,
0.4263945, -1.750786, 2.489663, 0, 0.05098039, 1, 1,
0.4293704, -0.009766882, 3.087017, 0, 0.04705882, 1, 1,
0.429652, -0.1513138, 2.329832, 0, 0.03921569, 1, 1,
0.4317208, 0.6123747, -0.5431158, 0, 0.03529412, 1, 1,
0.4339492, -0.3178471, 2.093036, 0, 0.02745098, 1, 1,
0.4345354, 0.3934796, -0.615617, 0, 0.02352941, 1, 1,
0.4349286, 1.459409, 1.240232, 0, 0.01568628, 1, 1,
0.4420107, -0.3842104, 0.1141124, 0, 0.01176471, 1, 1,
0.4500672, -0.1923503, 1.06127, 0, 0.003921569, 1, 1,
0.4521022, 1.508367, 1.441866, 0.003921569, 0, 1, 1,
0.4534752, -0.4941902, 1.897919, 0.007843138, 0, 1, 1,
0.4545819, 1.3419, 0.6180199, 0.01568628, 0, 1, 1,
0.4549648, 1.378797, 0.05136291, 0.01960784, 0, 1, 1,
0.4587509, -2.574769, 3.393952, 0.02745098, 0, 1, 1,
0.4595759, 0.7516719, -1.45003, 0.03137255, 0, 1, 1,
0.4614351, 2.25084, 1.291525, 0.03921569, 0, 1, 1,
0.4692662, 0.02407279, 2.583242, 0.04313726, 0, 1, 1,
0.4698082, 1.528999, -0.9231839, 0.05098039, 0, 1, 1,
0.4771631, -1.989359, 4.274655, 0.05490196, 0, 1, 1,
0.478358, 0.1196377, 0.7240974, 0.0627451, 0, 1, 1,
0.4859217, 0.04028397, 0.2032797, 0.06666667, 0, 1, 1,
0.4878076, -0.4906719, 1.4019, 0.07450981, 0, 1, 1,
0.4880802, -0.7486025, 2.858763, 0.07843138, 0, 1, 1,
0.490504, 0.09887117, 1.372871, 0.08627451, 0, 1, 1,
0.496291, 0.8634731, 2.12601, 0.09019608, 0, 1, 1,
0.5016949, -0.7582858, -0.8551399, 0.09803922, 0, 1, 1,
0.5019827, 1.639699, -0.7115223, 0.1058824, 0, 1, 1,
0.5029293, -1.704998, 2.221303, 0.1098039, 0, 1, 1,
0.5031466, -0.3030716, 1.378313, 0.1176471, 0, 1, 1,
0.508113, -0.3060252, 1.045622, 0.1215686, 0, 1, 1,
0.5106044, 0.1595967, 1.226491, 0.1294118, 0, 1, 1,
0.517844, -0.3980566, 2.032647, 0.1333333, 0, 1, 1,
0.5199785, 0.5979346, 0.5960925, 0.1411765, 0, 1, 1,
0.5204027, 1.817126, 1.73181, 0.145098, 0, 1, 1,
0.520956, -0.7751772, 1.638699, 0.1529412, 0, 1, 1,
0.5213301, -0.3421918, 1.000867, 0.1568628, 0, 1, 1,
0.5248263, 1.888742, 0.2176774, 0.1647059, 0, 1, 1,
0.5253356, -0.9358934, 1.849374, 0.1686275, 0, 1, 1,
0.5278839, -0.05515188, 1.682589, 0.1764706, 0, 1, 1,
0.5298693, 0.4985858, 1.069323, 0.1803922, 0, 1, 1,
0.5306343, -0.2036673, 2.216976, 0.1882353, 0, 1, 1,
0.5329748, 0.5154666, 0.4255697, 0.1921569, 0, 1, 1,
0.5366672, -0.8569335, 1.380842, 0.2, 0, 1, 1,
0.5381923, 1.774612, 1.823964, 0.2078431, 0, 1, 1,
0.539456, -0.1970807, 4.749259, 0.2117647, 0, 1, 1,
0.5408325, -0.5800152, 2.802626, 0.2196078, 0, 1, 1,
0.5410421, -1.582124, 3.052804, 0.2235294, 0, 1, 1,
0.5455137, 0.4364844, 1.841652, 0.2313726, 0, 1, 1,
0.5476285, 0.3460988, -0.5546546, 0.2352941, 0, 1, 1,
0.5496119, 0.2911363, 1.191168, 0.2431373, 0, 1, 1,
0.5497512, 2.016159, 0.08314219, 0.2470588, 0, 1, 1,
0.5504807, 0.6217569, 0.02132621, 0.254902, 0, 1, 1,
0.5512694, 2.292718, 1.004136, 0.2588235, 0, 1, 1,
0.5517101, -0.3672875, 1.83611, 0.2666667, 0, 1, 1,
0.5539648, 1.393083, -0.3777024, 0.2705882, 0, 1, 1,
0.5549423, 1.152547, 0.5333077, 0.2784314, 0, 1, 1,
0.5552593, 1.062571, -0.514863, 0.282353, 0, 1, 1,
0.558329, 0.7729258, 0.8741186, 0.2901961, 0, 1, 1,
0.5680836, 1.655831, 2.102126, 0.2941177, 0, 1, 1,
0.5693613, 0.1572784, 2.651482, 0.3019608, 0, 1, 1,
0.5828876, 0.5140363, 1.258009, 0.3098039, 0, 1, 1,
0.583119, -0.6763422, 3.047646, 0.3137255, 0, 1, 1,
0.5846483, -0.2642731, 3.462058, 0.3215686, 0, 1, 1,
0.5851263, 0.7741722, 0.4984863, 0.3254902, 0, 1, 1,
0.5908456, 0.3549243, 0.2217937, 0.3333333, 0, 1, 1,
0.5941837, 0.5452433, 0.9862792, 0.3372549, 0, 1, 1,
0.6016217, -0.267576, 2.999824, 0.345098, 0, 1, 1,
0.6046279, 0.4628146, 1.255019, 0.3490196, 0, 1, 1,
0.6048717, 0.7847455, -0.9450262, 0.3568628, 0, 1, 1,
0.6052546, -1.289134, 2.4159, 0.3607843, 0, 1, 1,
0.6101663, 1.775827, 0.216894, 0.3686275, 0, 1, 1,
0.611215, 0.9619057, 2.166286, 0.372549, 0, 1, 1,
0.6114143, -0.2806887, 1.026046, 0.3803922, 0, 1, 1,
0.6162085, -0.60357, 4.199419, 0.3843137, 0, 1, 1,
0.6223697, -1.333984, 3.416929, 0.3921569, 0, 1, 1,
0.6232584, -0.4426398, 2.86846, 0.3960784, 0, 1, 1,
0.6305937, 0.6025051, 1.131553, 0.4039216, 0, 1, 1,
0.6319504, -2.157449, 2.593381, 0.4117647, 0, 1, 1,
0.6373503, 1.287944, 0.5331709, 0.4156863, 0, 1, 1,
0.637753, 3.133395, 1.131653, 0.4235294, 0, 1, 1,
0.6476864, -1.296672, 2.566182, 0.427451, 0, 1, 1,
0.6529434, -2.15113, 3.475564, 0.4352941, 0, 1, 1,
0.6536375, -0.01782968, 3.296746, 0.4392157, 0, 1, 1,
0.6548449, -0.9700604, 3.576011, 0.4470588, 0, 1, 1,
0.6568623, -1.431724, 3.844059, 0.4509804, 0, 1, 1,
0.6660486, -1.652332, 3.625577, 0.4588235, 0, 1, 1,
0.6672949, -0.02645893, 0.6890394, 0.4627451, 0, 1, 1,
0.6759856, 0.6478312, 1.709032, 0.4705882, 0, 1, 1,
0.6817233, 0.2035078, -0.4116647, 0.4745098, 0, 1, 1,
0.6826701, -0.1688966, 2.027159, 0.4823529, 0, 1, 1,
0.6832743, 0.8892724, -0.04791305, 0.4862745, 0, 1, 1,
0.6960351, -0.1580039, 2.480248, 0.4941176, 0, 1, 1,
0.7039565, -1.311063, 4.310829, 0.5019608, 0, 1, 1,
0.7043604, -0.2584884, 1.401381, 0.5058824, 0, 1, 1,
0.7070157, 1.522711, 0.02800714, 0.5137255, 0, 1, 1,
0.7119669, -0.9570718, -0.3369868, 0.5176471, 0, 1, 1,
0.7120836, 0.783514, 0.6872523, 0.5254902, 0, 1, 1,
0.7153231, 1.039339, 1.805549, 0.5294118, 0, 1, 1,
0.7226187, 1.676699, 0.1421643, 0.5372549, 0, 1, 1,
0.7388293, 0.6062555, 0.3353159, 0.5411765, 0, 1, 1,
0.7393193, 0.04379377, 1.826902, 0.5490196, 0, 1, 1,
0.7411194, -1.312977, 3.145825, 0.5529412, 0, 1, 1,
0.742443, 0.6435578, -0.544039, 0.5607843, 0, 1, 1,
0.7431384, -0.4501333, 2.437788, 0.5647059, 0, 1, 1,
0.743453, 0.5511661, 1.747668, 0.572549, 0, 1, 1,
0.7434847, -0.8058652, 2.026356, 0.5764706, 0, 1, 1,
0.7445819, -0.5187786, 2.071378, 0.5843138, 0, 1, 1,
0.7453365, 0.3109695, 1.33656, 0.5882353, 0, 1, 1,
0.7550426, -1.387616, 2.349536, 0.5960785, 0, 1, 1,
0.7558149, 0.2975268, 0.6339657, 0.6039216, 0, 1, 1,
0.7578228, 0.4913949, 0.1907577, 0.6078432, 0, 1, 1,
0.7582617, 0.7868137, 1.005768, 0.6156863, 0, 1, 1,
0.7599671, -1.002617, 2.450732, 0.6196079, 0, 1, 1,
0.7622444, -0.09013772, 0.1775558, 0.627451, 0, 1, 1,
0.7635475, 1.221925, -0.09848208, 0.6313726, 0, 1, 1,
0.7659241, -1.420621, 1.807533, 0.6392157, 0, 1, 1,
0.771598, -0.6583103, 1.713145, 0.6431373, 0, 1, 1,
0.7739786, 0.2670828, 0.1044438, 0.6509804, 0, 1, 1,
0.774362, 0.5366673, 0.8261549, 0.654902, 0, 1, 1,
0.7760835, 1.449166, 0.8944088, 0.6627451, 0, 1, 1,
0.7761278, -0.7092871, 0.2938358, 0.6666667, 0, 1, 1,
0.7767743, 0.9294319, 1.406419, 0.6745098, 0, 1, 1,
0.779158, 0.4660906, 0.1315102, 0.6784314, 0, 1, 1,
0.7817132, -0.2218016, 1.4321, 0.6862745, 0, 1, 1,
0.7828333, -1.155818, 1.724281, 0.6901961, 0, 1, 1,
0.7861503, -0.08049491, 2.020389, 0.6980392, 0, 1, 1,
0.7874036, 0.5790245, 1.395462, 0.7058824, 0, 1, 1,
0.7888939, 0.5701315, 1.161603, 0.7098039, 0, 1, 1,
0.7901753, 0.1629797, -0.3292241, 0.7176471, 0, 1, 1,
0.7952547, 0.2045879, 1.968364, 0.7215686, 0, 1, 1,
0.7994998, -0.01134044, 1.978847, 0.7294118, 0, 1, 1,
0.8024989, 1.63373, 0.2526565, 0.7333333, 0, 1, 1,
0.8032006, 0.8325101, -0.1861155, 0.7411765, 0, 1, 1,
0.806418, -1.233786, 2.682605, 0.7450981, 0, 1, 1,
0.8075935, -1.370646, 3.74083, 0.7529412, 0, 1, 1,
0.8211434, -1.318321, 1.249085, 0.7568628, 0, 1, 1,
0.8295016, -1.806011, 4.623231, 0.7647059, 0, 1, 1,
0.8399863, -0.1489277, 2.297886, 0.7686275, 0, 1, 1,
0.8410978, 0.1023527, 2.051387, 0.7764706, 0, 1, 1,
0.8505411, -0.2904509, 2.267059, 0.7803922, 0, 1, 1,
0.8510999, 0.3055365, -0.1351982, 0.7882353, 0, 1, 1,
0.8561556, 0.6993578, 0.6333403, 0.7921569, 0, 1, 1,
0.868722, 2.055624, 0.439314, 0.8, 0, 1, 1,
0.870105, 0.4686154, 1.492463, 0.8078431, 0, 1, 1,
0.8787963, -0.2481854, 2.134209, 0.8117647, 0, 1, 1,
0.8806974, -0.6401139, 2.131187, 0.8196079, 0, 1, 1,
0.8859667, -0.9626338, 0.4223955, 0.8235294, 0, 1, 1,
0.8865924, 0.461132, 2.105921, 0.8313726, 0, 1, 1,
0.8879944, 1.495957, 0.2559178, 0.8352941, 0, 1, 1,
0.8921527, 0.1490417, 1.916496, 0.8431373, 0, 1, 1,
0.892399, 0.3975962, 0.6895412, 0.8470588, 0, 1, 1,
0.8933161, -1.740371, 2.334028, 0.854902, 0, 1, 1,
0.89644, -1.20575, 3.203049, 0.8588235, 0, 1, 1,
0.8987404, 0.06419569, 1.391559, 0.8666667, 0, 1, 1,
0.9009342, -0.04383079, 2.132671, 0.8705882, 0, 1, 1,
0.9017768, 0.274996, 2.239286, 0.8784314, 0, 1, 1,
0.9045094, 0.560784, -0.2373663, 0.8823529, 0, 1, 1,
0.904586, -0.1485399, 1.447259, 0.8901961, 0, 1, 1,
0.9063673, 1.98052, 0.2758065, 0.8941177, 0, 1, 1,
0.9104503, 1.367789, -0.7912272, 0.9019608, 0, 1, 1,
0.9149342, -0.6994253, 2.232671, 0.9098039, 0, 1, 1,
0.9154954, 0.8231083, -0.6595331, 0.9137255, 0, 1, 1,
0.9169216, 1.503641, -1.85402, 0.9215686, 0, 1, 1,
0.9173958, 1.605078, 0.9211873, 0.9254902, 0, 1, 1,
0.9175575, -0.6297542, 0.7981501, 0.9333333, 0, 1, 1,
0.9199345, 3.26076, -0.8538481, 0.9372549, 0, 1, 1,
0.9246942, -1.268551, 2.389046, 0.945098, 0, 1, 1,
0.928834, -0.7637548, 0.9469767, 0.9490196, 0, 1, 1,
0.9360873, -0.7672594, 2.603493, 0.9568627, 0, 1, 1,
0.939292, -2.558157, 3.485158, 0.9607843, 0, 1, 1,
0.940138, 1.166486, 2.466209, 0.9686275, 0, 1, 1,
0.943046, 0.1006027, 2.629471, 0.972549, 0, 1, 1,
0.9433765, -1.082436, 4.122361, 0.9803922, 0, 1, 1,
0.9439837, 0.4388599, 0.8320233, 0.9843137, 0, 1, 1,
0.9480163, 0.3759024, -0.5289304, 0.9921569, 0, 1, 1,
0.9618933, 0.4438629, 2.559493, 0.9960784, 0, 1, 1,
0.9645805, -1.235956, 4.610557, 1, 0, 0.9960784, 1,
0.9653827, 0.1650738, 1.194708, 1, 0, 0.9882353, 1,
0.9685071, 1.017773, 1.202971, 1, 0, 0.9843137, 1,
0.9712557, -0.9719133, 3.542572, 1, 0, 0.9764706, 1,
0.9771526, -2.004527, 3.687072, 1, 0, 0.972549, 1,
0.9945656, -0.5763054, 2.030149, 1, 0, 0.9647059, 1,
0.9960852, -0.2696245, 2.894799, 1, 0, 0.9607843, 1,
1.000265, 1.127643, -0.6682894, 1, 0, 0.9529412, 1,
1.000465, -0.2183009, 0.6988748, 1, 0, 0.9490196, 1,
1.008714, -0.5138125, 1.702245, 1, 0, 0.9411765, 1,
1.009302, -0.9377055, 2.39956, 1, 0, 0.9372549, 1,
1.0158, -2.704355, 4.114525, 1, 0, 0.9294118, 1,
1.016691, -0.2483093, 0.9227016, 1, 0, 0.9254902, 1,
1.024538, 2.077894, 1.411295, 1, 0, 0.9176471, 1,
1.025972, 0.7415388, 0.911195, 1, 0, 0.9137255, 1,
1.029264, 0.2394772, 0.2194066, 1, 0, 0.9058824, 1,
1.037278, -1.110134, 1.115525, 1, 0, 0.9019608, 1,
1.044618, 1.991646, 2.493294, 1, 0, 0.8941177, 1,
1.046623, 0.5077755, -0.1401689, 1, 0, 0.8862745, 1,
1.051759, -0.4123152, 4.715151, 1, 0, 0.8823529, 1,
1.05519, -1.830373, 3.723791, 1, 0, 0.8745098, 1,
1.057181, -0.2641197, 2.134111, 1, 0, 0.8705882, 1,
1.057562, 0.2055955, 1.712967, 1, 0, 0.8627451, 1,
1.063551, -2.238495, 0.9935899, 1, 0, 0.8588235, 1,
1.063911, -1.344613, 3.701507, 1, 0, 0.8509804, 1,
1.068956, 0.4054965, -0.2400177, 1, 0, 0.8470588, 1,
1.071396, 0.9267426, 0.445989, 1, 0, 0.8392157, 1,
1.071885, -1.281026, 3.041766, 1, 0, 0.8352941, 1,
1.08111, -0.4574774, 3.390024, 1, 0, 0.827451, 1,
1.085839, -1.480684, 1.409814, 1, 0, 0.8235294, 1,
1.094102, -0.1666701, 1.43172, 1, 0, 0.8156863, 1,
1.096327, -1.10924, 2.207383, 1, 0, 0.8117647, 1,
1.101867, -1.423311, 3.102948, 1, 0, 0.8039216, 1,
1.106568, 0.4711335, 1.163885, 1, 0, 0.7960784, 1,
1.106918, 0.07546851, 2.274778, 1, 0, 0.7921569, 1,
1.10986, -2.739079, 2.609747, 1, 0, 0.7843137, 1,
1.110568, -0.3603307, 0.7290382, 1, 0, 0.7803922, 1,
1.115465, -0.006157373, 0.6679897, 1, 0, 0.772549, 1,
1.117298, -0.775518, 3.646229, 1, 0, 0.7686275, 1,
1.120073, 2.698147, 0.9022816, 1, 0, 0.7607843, 1,
1.125671, -1.568996, 3.464693, 1, 0, 0.7568628, 1,
1.12722, 1.042954, 0.1263221, 1, 0, 0.7490196, 1,
1.128835, -0.5819475, 0.9897865, 1, 0, 0.7450981, 1,
1.132011, 0.7205862, 1.085432, 1, 0, 0.7372549, 1,
1.132868, 1.552281, -0.3425767, 1, 0, 0.7333333, 1,
1.136254, -0.4473877, 2.191649, 1, 0, 0.7254902, 1,
1.137264, -0.4648423, 0.5542096, 1, 0, 0.7215686, 1,
1.139383, 0.8563681, 2.974138, 1, 0, 0.7137255, 1,
1.140701, -0.9362462, 1.879043, 1, 0, 0.7098039, 1,
1.14251, 0.3361956, 0.5151621, 1, 0, 0.7019608, 1,
1.142736, 0.9779258, 0.661649, 1, 0, 0.6941177, 1,
1.143116, 0.2624452, 2.112602, 1, 0, 0.6901961, 1,
1.156881, 0.7240655, -0.07042997, 1, 0, 0.682353, 1,
1.168649, 0.3141743, 0.1469239, 1, 0, 0.6784314, 1,
1.175507, 0.4319645, 2.500536, 1, 0, 0.6705883, 1,
1.188319, -1.056015, 3.66253, 1, 0, 0.6666667, 1,
1.189043, -1.544, 0.9307063, 1, 0, 0.6588235, 1,
1.190143, -0.8897907, 3.173234, 1, 0, 0.654902, 1,
1.190602, -0.2247692, 2.014421, 1, 0, 0.6470588, 1,
1.191204, -0.1569897, 1.159214, 1, 0, 0.6431373, 1,
1.192377, 0.1272649, 1.205304, 1, 0, 0.6352941, 1,
1.199674, -0.9727186, 3.490345, 1, 0, 0.6313726, 1,
1.202498, 0.9325754, 2.402871, 1, 0, 0.6235294, 1,
1.203258, -1.026095, 1.291831, 1, 0, 0.6196079, 1,
1.210557, -0.9596858, 4.363289, 1, 0, 0.6117647, 1,
1.210857, 2.354978, -0.1841542, 1, 0, 0.6078432, 1,
1.215698, 0.03941847, 1.601239, 1, 0, 0.6, 1,
1.216546, -0.9702189, 2.110886, 1, 0, 0.5921569, 1,
1.218916, -1.248359, 1.436367, 1, 0, 0.5882353, 1,
1.235757, 0.6571897, -0.5299686, 1, 0, 0.5803922, 1,
1.236839, -0.2172788, 1.97558, 1, 0, 0.5764706, 1,
1.241516, 1.899091, 1.940996, 1, 0, 0.5686275, 1,
1.24562, 1.121105, 1.351285, 1, 0, 0.5647059, 1,
1.252492, 2.592796, 0.69323, 1, 0, 0.5568628, 1,
1.253669, -0.5599697, -0.1398894, 1, 0, 0.5529412, 1,
1.253982, 0.9441037, 0.1184255, 1, 0, 0.5450981, 1,
1.254183, 0.02208578, 2.435543, 1, 0, 0.5411765, 1,
1.255491, -0.3440049, 2.495393, 1, 0, 0.5333334, 1,
1.275514, 0.3899725, -0.411267, 1, 0, 0.5294118, 1,
1.284832, 0.00727816, 1.465638, 1, 0, 0.5215687, 1,
1.291033, 0.1240621, 1.753747, 1, 0, 0.5176471, 1,
1.306892, -0.2847238, 0.2829285, 1, 0, 0.509804, 1,
1.30767, -0.289781, 1.337464, 1, 0, 0.5058824, 1,
1.314484, 0.4330769, 2.106562, 1, 0, 0.4980392, 1,
1.319567, -1.496585, 0.7225181, 1, 0, 0.4901961, 1,
1.33094, -1.0769, 2.942039, 1, 0, 0.4862745, 1,
1.348782, 0.6165531, 1.397181, 1, 0, 0.4784314, 1,
1.349776, -1.34522, 2.712512, 1, 0, 0.4745098, 1,
1.352308, 1.615519, 1.877389, 1, 0, 0.4666667, 1,
1.354537, 2.361491, -0.6360017, 1, 0, 0.4627451, 1,
1.356373, 0.4952669, 1.689392, 1, 0, 0.454902, 1,
1.360707, -0.3537685, 1.081635, 1, 0, 0.4509804, 1,
1.368092, 0.337695, 2.979448, 1, 0, 0.4431373, 1,
1.37136, -1.082019, 4.897815, 1, 0, 0.4392157, 1,
1.374938, -1.454821, 3.209763, 1, 0, 0.4313726, 1,
1.379425, -0.6364491, 1.692081, 1, 0, 0.427451, 1,
1.383333, 0.2101063, 2.253031, 1, 0, 0.4196078, 1,
1.384839, 1.944508, 1.727674, 1, 0, 0.4156863, 1,
1.391592, 0.2140705, 0.937196, 1, 0, 0.4078431, 1,
1.407757, 1.199252, -0.2642851, 1, 0, 0.4039216, 1,
1.420093, 0.2265336, 3.571856, 1, 0, 0.3960784, 1,
1.421196, 0.8306459, 1.20595, 1, 0, 0.3882353, 1,
1.425668, 1.204057, -0.01534116, 1, 0, 0.3843137, 1,
1.433679, 1.5042, 2.549935, 1, 0, 0.3764706, 1,
1.437169, 1.255119, 0.9914097, 1, 0, 0.372549, 1,
1.44024, -0.4040014, 1.694729, 1, 0, 0.3647059, 1,
1.446527, 0.05682157, 3.663539, 1, 0, 0.3607843, 1,
1.453078, 0.8225359, 0.8364331, 1, 0, 0.3529412, 1,
1.453288, 0.2555636, 3.090203, 1, 0, 0.3490196, 1,
1.456093, -0.2067159, 0.652168, 1, 0, 0.3411765, 1,
1.457614, 0.8546205, 1.105021, 1, 0, 0.3372549, 1,
1.4609, 0.683138, 1.676815, 1, 0, 0.3294118, 1,
1.465692, 0.2463206, 1.784783, 1, 0, 0.3254902, 1,
1.476184, 1.003002, 0.1870747, 1, 0, 0.3176471, 1,
1.476759, -0.3755583, 1.023279, 1, 0, 0.3137255, 1,
1.487388, 2.066259, 0.64147, 1, 0, 0.3058824, 1,
1.491631, -0.5132881, 1.11219, 1, 0, 0.2980392, 1,
1.49642, -0.5584064, 3.020006, 1, 0, 0.2941177, 1,
1.51237, 0.05472751, 0.9347454, 1, 0, 0.2862745, 1,
1.520577, -2.222944, 1.87136, 1, 0, 0.282353, 1,
1.534488, -0.7442223, 1.287793, 1, 0, 0.2745098, 1,
1.537809, -1.453983, 3.721351, 1, 0, 0.2705882, 1,
1.550231, 0.03808044, 3.988651, 1, 0, 0.2627451, 1,
1.556136, -1.001454, 3.786001, 1, 0, 0.2588235, 1,
1.559099, -0.408406, 2.183901, 1, 0, 0.2509804, 1,
1.561044, -0.2598919, 2.398648, 1, 0, 0.2470588, 1,
1.561169, -0.5248364, 1.89631, 1, 0, 0.2392157, 1,
1.585497, -0.3705021, 1.282943, 1, 0, 0.2352941, 1,
1.585965, -2.668008, 4.468564, 1, 0, 0.227451, 1,
1.586109, 1.120946, 0.2379233, 1, 0, 0.2235294, 1,
1.686443, 1.656202, 2.361888, 1, 0, 0.2156863, 1,
1.69536, 0.5672077, 1.68464, 1, 0, 0.2117647, 1,
1.72521, -1.206468, 1.377733, 1, 0, 0.2039216, 1,
1.757132, 0.1883743, 2.141725, 1, 0, 0.1960784, 1,
1.768801, -1.113165, 2.814395, 1, 0, 0.1921569, 1,
1.781191, -0.2299701, 1.77956, 1, 0, 0.1843137, 1,
1.793084, 1.918279, -0.2445809, 1, 0, 0.1803922, 1,
1.809014, 0.1822887, 1.780318, 1, 0, 0.172549, 1,
1.818609, 1.651561, 2.901346, 1, 0, 0.1686275, 1,
1.838493, 0.2281299, 3.760687, 1, 0, 0.1607843, 1,
1.847977, 0.05799594, 1.141938, 1, 0, 0.1568628, 1,
1.849191, -2.067394, 2.676875, 1, 0, 0.1490196, 1,
1.871911, -1.508516, 2.594067, 1, 0, 0.145098, 1,
1.885974, -0.7107645, 4.788096, 1, 0, 0.1372549, 1,
1.888721, 0.9443545, 0.6872673, 1, 0, 0.1333333, 1,
1.923294, -0.2814239, 1.976403, 1, 0, 0.1254902, 1,
1.924097, 0.299944, 1.15344, 1, 0, 0.1215686, 1,
1.926092, 0.4823332, -0.9474086, 1, 0, 0.1137255, 1,
1.961245, -0.4893657, 1.628198, 1, 0, 0.1098039, 1,
2.008663, 1.117829, 2.484138, 1, 0, 0.1019608, 1,
2.016226, 0.9296237, 1.476632, 1, 0, 0.09411765, 1,
2.01715, 0.3043201, 0.8946013, 1, 0, 0.09019608, 1,
2.035235, -0.1151013, 0.4486753, 1, 0, 0.08235294, 1,
2.072763, 1.580405, 0.7423102, 1, 0, 0.07843138, 1,
2.079555, 1.682315, 2.194564, 1, 0, 0.07058824, 1,
2.09851, -0.4074992, 2.384817, 1, 0, 0.06666667, 1,
2.12398, 1.284178, 2.899974, 1, 0, 0.05882353, 1,
2.127179, -0.7622722, 2.543301, 1, 0, 0.05490196, 1,
2.170288, 0.2354154, 1.426495, 1, 0, 0.04705882, 1,
2.178677, 0.8778435, -0.1993131, 1, 0, 0.04313726, 1,
2.252376, -1.197811, 2.553217, 1, 0, 0.03529412, 1,
2.254443, -0.4533882, 2.006514, 1, 0, 0.03137255, 1,
2.289484, -0.2495999, 1.461531, 1, 0, 0.02352941, 1,
2.423949, 0.4244841, 1.387344, 1, 0, 0.01960784, 1,
2.519298, 0.004561691, 1.339327, 1, 0, 0.01176471, 1,
2.569899, -0.7594991, 1.416053, 1, 0, 0.007843138, 1
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
-0.2319342, -4.42526, -6.401274, 0, -0.5, 0.5, 0.5,
-0.2319342, -4.42526, -6.401274, 1, -0.5, 0.5, 0.5,
-0.2319342, -4.42526, -6.401274, 1, 1.5, 0.5, 0.5,
-0.2319342, -4.42526, -6.401274, 0, 1.5, 0.5, 0.5
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
-3.983588, -0.02526832, -6.401274, 0, -0.5, 0.5, 0.5,
-3.983588, -0.02526832, -6.401274, 1, -0.5, 0.5, 0.5,
-3.983588, -0.02526832, -6.401274, 1, 1.5, 0.5, 0.5,
-3.983588, -0.02526832, -6.401274, 0, 1.5, 0.5, 0.5
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
-3.983588, -4.42526, 0.2357192, 0, -0.5, 0.5, 0.5,
-3.983588, -4.42526, 0.2357192, 1, -0.5, 0.5, 0.5,
-3.983588, -4.42526, 0.2357192, 1, 1.5, 0.5, 0.5,
-3.983588, -4.42526, 0.2357192, 0, 1.5, 0.5, 0.5
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
-3, -3.409877, -4.86966,
2, -3.409877, -4.86966,
-3, -3.409877, -4.86966,
-3, -3.579108, -5.124929,
-2, -3.409877, -4.86966,
-2, -3.579108, -5.124929,
-1, -3.409877, -4.86966,
-1, -3.579108, -5.124929,
0, -3.409877, -4.86966,
0, -3.579108, -5.124929,
1, -3.409877, -4.86966,
1, -3.579108, -5.124929,
2, -3.409877, -4.86966,
2, -3.579108, -5.124929
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
"-3",
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
-3, -3.917569, -5.635468, 0, -0.5, 0.5, 0.5,
-3, -3.917569, -5.635468, 1, -0.5, 0.5, 0.5,
-3, -3.917569, -5.635468, 1, 1.5, 0.5, 0.5,
-3, -3.917569, -5.635468, 0, 1.5, 0.5, 0.5,
-2, -3.917569, -5.635468, 0, -0.5, 0.5, 0.5,
-2, -3.917569, -5.635468, 1, -0.5, 0.5, 0.5,
-2, -3.917569, -5.635468, 1, 1.5, 0.5, 0.5,
-2, -3.917569, -5.635468, 0, 1.5, 0.5, 0.5,
-1, -3.917569, -5.635468, 0, -0.5, 0.5, 0.5,
-1, -3.917569, -5.635468, 1, -0.5, 0.5, 0.5,
-1, -3.917569, -5.635468, 1, 1.5, 0.5, 0.5,
-1, -3.917569, -5.635468, 0, 1.5, 0.5, 0.5,
0, -3.917569, -5.635468, 0, -0.5, 0.5, 0.5,
0, -3.917569, -5.635468, 1, -0.5, 0.5, 0.5,
0, -3.917569, -5.635468, 1, 1.5, 0.5, 0.5,
0, -3.917569, -5.635468, 0, 1.5, 0.5, 0.5,
1, -3.917569, -5.635468, 0, -0.5, 0.5, 0.5,
1, -3.917569, -5.635468, 1, -0.5, 0.5, 0.5,
1, -3.917569, -5.635468, 1, 1.5, 0.5, 0.5,
1, -3.917569, -5.635468, 0, 1.5, 0.5, 0.5,
2, -3.917569, -5.635468, 0, -0.5, 0.5, 0.5,
2, -3.917569, -5.635468, 1, -0.5, 0.5, 0.5,
2, -3.917569, -5.635468, 1, 1.5, 0.5, 0.5,
2, -3.917569, -5.635468, 0, 1.5, 0.5, 0.5
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
-3.117822, -3, -4.86966,
-3.117822, 3, -4.86966,
-3.117822, -3, -4.86966,
-3.262116, -3, -5.124929,
-3.117822, -2, -4.86966,
-3.262116, -2, -5.124929,
-3.117822, -1, -4.86966,
-3.262116, -1, -5.124929,
-3.117822, 0, -4.86966,
-3.262116, 0, -5.124929,
-3.117822, 1, -4.86966,
-3.262116, 1, -5.124929,
-3.117822, 2, -4.86966,
-3.262116, 2, -5.124929,
-3.117822, 3, -4.86966,
-3.262116, 3, -5.124929
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
-3.550705, -3, -5.635468, 0, -0.5, 0.5, 0.5,
-3.550705, -3, -5.635468, 1, -0.5, 0.5, 0.5,
-3.550705, -3, -5.635468, 1, 1.5, 0.5, 0.5,
-3.550705, -3, -5.635468, 0, 1.5, 0.5, 0.5,
-3.550705, -2, -5.635468, 0, -0.5, 0.5, 0.5,
-3.550705, -2, -5.635468, 1, -0.5, 0.5, 0.5,
-3.550705, -2, -5.635468, 1, 1.5, 0.5, 0.5,
-3.550705, -2, -5.635468, 0, 1.5, 0.5, 0.5,
-3.550705, -1, -5.635468, 0, -0.5, 0.5, 0.5,
-3.550705, -1, -5.635468, 1, -0.5, 0.5, 0.5,
-3.550705, -1, -5.635468, 1, 1.5, 0.5, 0.5,
-3.550705, -1, -5.635468, 0, 1.5, 0.5, 0.5,
-3.550705, 0, -5.635468, 0, -0.5, 0.5, 0.5,
-3.550705, 0, -5.635468, 1, -0.5, 0.5, 0.5,
-3.550705, 0, -5.635468, 1, 1.5, 0.5, 0.5,
-3.550705, 0, -5.635468, 0, 1.5, 0.5, 0.5,
-3.550705, 1, -5.635468, 0, -0.5, 0.5, 0.5,
-3.550705, 1, -5.635468, 1, -0.5, 0.5, 0.5,
-3.550705, 1, -5.635468, 1, 1.5, 0.5, 0.5,
-3.550705, 1, -5.635468, 0, 1.5, 0.5, 0.5,
-3.550705, 2, -5.635468, 0, -0.5, 0.5, 0.5,
-3.550705, 2, -5.635468, 1, -0.5, 0.5, 0.5,
-3.550705, 2, -5.635468, 1, 1.5, 0.5, 0.5,
-3.550705, 2, -5.635468, 0, 1.5, 0.5, 0.5,
-3.550705, 3, -5.635468, 0, -0.5, 0.5, 0.5,
-3.550705, 3, -5.635468, 1, -0.5, 0.5, 0.5,
-3.550705, 3, -5.635468, 1, 1.5, 0.5, 0.5,
-3.550705, 3, -5.635468, 0, 1.5, 0.5, 0.5
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
-3.117822, -3.409877, -4,
-3.117822, -3.409877, 4,
-3.117822, -3.409877, -4,
-3.262116, -3.579108, -4,
-3.117822, -3.409877, -2,
-3.262116, -3.579108, -2,
-3.117822, -3.409877, 0,
-3.262116, -3.579108, 0,
-3.117822, -3.409877, 2,
-3.262116, -3.579108, 2,
-3.117822, -3.409877, 4,
-3.262116, -3.579108, 4
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
-3.550705, -3.917569, -4, 0, -0.5, 0.5, 0.5,
-3.550705, -3.917569, -4, 1, -0.5, 0.5, 0.5,
-3.550705, -3.917569, -4, 1, 1.5, 0.5, 0.5,
-3.550705, -3.917569, -4, 0, 1.5, 0.5, 0.5,
-3.550705, -3.917569, -2, 0, -0.5, 0.5, 0.5,
-3.550705, -3.917569, -2, 1, -0.5, 0.5, 0.5,
-3.550705, -3.917569, -2, 1, 1.5, 0.5, 0.5,
-3.550705, -3.917569, -2, 0, 1.5, 0.5, 0.5,
-3.550705, -3.917569, 0, 0, -0.5, 0.5, 0.5,
-3.550705, -3.917569, 0, 1, -0.5, 0.5, 0.5,
-3.550705, -3.917569, 0, 1, 1.5, 0.5, 0.5,
-3.550705, -3.917569, 0, 0, 1.5, 0.5, 0.5,
-3.550705, -3.917569, 2, 0, -0.5, 0.5, 0.5,
-3.550705, -3.917569, 2, 1, -0.5, 0.5, 0.5,
-3.550705, -3.917569, 2, 1, 1.5, 0.5, 0.5,
-3.550705, -3.917569, 2, 0, 1.5, 0.5, 0.5,
-3.550705, -3.917569, 4, 0, -0.5, 0.5, 0.5,
-3.550705, -3.917569, 4, 1, -0.5, 0.5, 0.5,
-3.550705, -3.917569, 4, 1, 1.5, 0.5, 0.5,
-3.550705, -3.917569, 4, 0, 1.5, 0.5, 0.5
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
-3.117822, -3.409877, -4.86966,
-3.117822, 3.359341, -4.86966,
-3.117822, -3.409877, 5.341099,
-3.117822, 3.359341, 5.341099,
-3.117822, -3.409877, -4.86966,
-3.117822, -3.409877, 5.341099,
-3.117822, 3.359341, -4.86966,
-3.117822, 3.359341, 5.341099,
-3.117822, -3.409877, -4.86966,
2.653954, -3.409877, -4.86966,
-3.117822, -3.409877, 5.341099,
2.653954, -3.409877, 5.341099,
-3.117822, 3.359341, -4.86966,
2.653954, 3.359341, -4.86966,
-3.117822, 3.359341, 5.341099,
2.653954, 3.359341, 5.341099,
2.653954, -3.409877, -4.86966,
2.653954, 3.359341, -4.86966,
2.653954, -3.409877, 5.341099,
2.653954, 3.359341, 5.341099,
2.653954, -3.409877, -4.86966,
2.653954, -3.409877, 5.341099,
2.653954, 3.359341, -4.86966,
2.653954, 3.359341, 5.341099
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
var radius = 7.231353;
var distance = 32.1731;
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
mvMatrix.translate( 0.2319342, 0.02526832, -0.2357192 );
mvMatrix.scale( 1.35464, 1.155035, 0.7657296 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.1731);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Propionitril<-read.table("Propionitril.xyz")
```

```
## Error in read.table("Propionitril.xyz"): no lines available in input
```

```r
x<-Propionitril$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propionitril' not found
```

```r
y<-Propionitril$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propionitril' not found
```

```r
z<-Propionitril$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propionitril' not found
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
-3.033767, 0.8259056, -2.029951, 0, 0, 1, 1, 1,
-2.920097, -0.2666932, -2.251312, 1, 0, 0, 1, 1,
-2.791078, 0.3764823, -2.273025, 1, 0, 0, 1, 1,
-2.639272, -0.02739984, -4.145627, 1, 0, 0, 1, 1,
-2.589565, -0.7415982, 0.4674585, 1, 0, 0, 1, 1,
-2.416126, -0.4935699, -1.768486, 1, 0, 0, 1, 1,
-2.379248, 0.4741036, -2.082901, 0, 0, 0, 1, 1,
-2.322044, -1.498956, -3.015938, 0, 0, 0, 1, 1,
-2.299902, -0.276717, -2.296475, 0, 0, 0, 1, 1,
-2.284636, -0.3210309, -1.706948, 0, 0, 0, 1, 1,
-2.278445, -0.06580535, -1.870861, 0, 0, 0, 1, 1,
-2.191665, -0.3109785, -0.9047143, 0, 0, 0, 1, 1,
-2.178599, 0.3696567, -2.03082, 0, 0, 0, 1, 1,
-2.177348, 0.08294007, 0.260023, 1, 1, 1, 1, 1,
-2.174373, 0.3339152, -1.457301, 1, 1, 1, 1, 1,
-2.158937, -1.075679, -2.876118, 1, 1, 1, 1, 1,
-2.126813, -1.096676, -1.746551, 1, 1, 1, 1, 1,
-2.088067, 0.4698514, 0.7471749, 1, 1, 1, 1, 1,
-2.058184, 0.1773478, -2.088409, 1, 1, 1, 1, 1,
-2.036145, 0.6167065, -1.107409, 1, 1, 1, 1, 1,
-2.001998, 0.7929947, -0.7219878, 1, 1, 1, 1, 1,
-1.996845, 1.091408, -1.623604, 1, 1, 1, 1, 1,
-1.980611, 0.3025257, -0.1605622, 1, 1, 1, 1, 1,
-1.978703, -0.02505011, -0.9417248, 1, 1, 1, 1, 1,
-1.972443, -0.2090113, -2.87471, 1, 1, 1, 1, 1,
-1.962169, -1.191782, -0.9541842, 1, 1, 1, 1, 1,
-1.943807, 0.868933, 0.06318003, 1, 1, 1, 1, 1,
-1.932713, 0.2704939, -3.292448, 1, 1, 1, 1, 1,
-1.911064, 0.5491894, -1.343774, 0, 0, 1, 1, 1,
-1.900079, 0.06243584, -1.635035, 1, 0, 0, 1, 1,
-1.883701, -0.2376034, -0.2356608, 1, 0, 0, 1, 1,
-1.851124, 0.7297171, -0.8673242, 1, 0, 0, 1, 1,
-1.828653, -1.746958, -2.609375, 1, 0, 0, 1, 1,
-1.827042, -0.4351, -1.805417, 1, 0, 0, 1, 1,
-1.825411, 0.2591655, -1.249414, 0, 0, 0, 1, 1,
-1.825032, 0.1656765, -2.107709, 0, 0, 0, 1, 1,
-1.808087, 0.3171831, -0.8464973, 0, 0, 0, 1, 1,
-1.781282, 0.6290144, -1.240277, 0, 0, 0, 1, 1,
-1.765423, -1.238579, -3.467084, 0, 0, 0, 1, 1,
-1.74795, -0.2765736, -2.061811, 0, 0, 0, 1, 1,
-1.741563, -0.3433546, -2.259693, 0, 0, 0, 1, 1,
-1.737041, -0.3158019, -1.624094, 1, 1, 1, 1, 1,
-1.736765, -0.1492615, -1.840213, 1, 1, 1, 1, 1,
-1.735582, 0.1236665, -1.581734, 1, 1, 1, 1, 1,
-1.722121, 1.116563, -2.112427, 1, 1, 1, 1, 1,
-1.703382, -1.29746, -1.355262, 1, 1, 1, 1, 1,
-1.701471, 1.193132, -1.129514, 1, 1, 1, 1, 1,
-1.670947, 0.3879597, -0.624961, 1, 1, 1, 1, 1,
-1.645744, 0.439566, -1.011116, 1, 1, 1, 1, 1,
-1.645273, -0.8523413, -1.702207, 1, 1, 1, 1, 1,
-1.642489, -0.7100599, -1.218573, 1, 1, 1, 1, 1,
-1.639801, -0.4690996, -2.040354, 1, 1, 1, 1, 1,
-1.632278, -0.06385577, -0.2066414, 1, 1, 1, 1, 1,
-1.620155, 0.1363092, -1.145549, 1, 1, 1, 1, 1,
-1.612459, -0.4324372, -0.7533516, 1, 1, 1, 1, 1,
-1.586863, 0.2447566, -1.196529, 1, 1, 1, 1, 1,
-1.570935, 0.5514926, -1.078894, 0, 0, 1, 1, 1,
-1.569316, 1.912233, -0.5173219, 1, 0, 0, 1, 1,
-1.562519, -0.9292396, -0.7234773, 1, 0, 0, 1, 1,
-1.555659, 0.2649826, -1.274296, 1, 0, 0, 1, 1,
-1.554873, -1.20142, -2.158615, 1, 0, 0, 1, 1,
-1.546073, -0.000684683, -2.251316, 1, 0, 0, 1, 1,
-1.544147, -0.5774168, -3.813252, 0, 0, 0, 1, 1,
-1.529155, 1.595465, -0.7645863, 0, 0, 0, 1, 1,
-1.493778, 1.048536, -0.3422258, 0, 0, 0, 1, 1,
-1.483821, 0.1002254, -3.778561, 0, 0, 0, 1, 1,
-1.480691, -0.07150298, -0.1546738, 0, 0, 0, 1, 1,
-1.47162, 1.126494, -2.270032, 0, 0, 0, 1, 1,
-1.447886, -0.4775896, -0.578851, 0, 0, 0, 1, 1,
-1.447453, -0.9049842, -3.23076, 1, 1, 1, 1, 1,
-1.44029, 0.6393816, -0.09869624, 1, 1, 1, 1, 1,
-1.433855, -0.1310747, -2.334146, 1, 1, 1, 1, 1,
-1.414501, -0.7563432, -3.84083, 1, 1, 1, 1, 1,
-1.412806, -0.5887069, -1.227105, 1, 1, 1, 1, 1,
-1.409636, 1.044502, -0.8077582, 1, 1, 1, 1, 1,
-1.392207, -1.152344, -1.185427, 1, 1, 1, 1, 1,
-1.388804, -0.6276105, -2.220274, 1, 1, 1, 1, 1,
-1.384661, 1.762447, -1.597981, 1, 1, 1, 1, 1,
-1.374607, 0.08521365, -2.132872, 1, 1, 1, 1, 1,
-1.37216, 0.5877035, -2.37053, 1, 1, 1, 1, 1,
-1.371717, -0.6665097, -2.744269, 1, 1, 1, 1, 1,
-1.365883, -0.1367168, -1.087163, 1, 1, 1, 1, 1,
-1.365026, -0.1638006, -2.519701, 1, 1, 1, 1, 1,
-1.362228, 0.2245202, -0.1345044, 1, 1, 1, 1, 1,
-1.351156, -0.3101865, -1.772985, 0, 0, 1, 1, 1,
-1.342671, -1.365378, -1.198921, 1, 0, 0, 1, 1,
-1.330125, 0.1861682, -0.7751625, 1, 0, 0, 1, 1,
-1.32338, -0.3712289, -0.9388127, 1, 0, 0, 1, 1,
-1.321378, -0.01516592, -2.646962, 1, 0, 0, 1, 1,
-1.316454, 0.2841067, -1.118415, 1, 0, 0, 1, 1,
-1.315759, -0.4598311, -3.062717, 0, 0, 0, 1, 1,
-1.312791, -1.116462, -0.6752726, 0, 0, 0, 1, 1,
-1.310886, -0.2213355, -1.676641, 0, 0, 0, 1, 1,
-1.307117, 0.3685185, 0.3933322, 0, 0, 0, 1, 1,
-1.304938, -0.003382012, -1.309897, 0, 0, 0, 1, 1,
-1.278578, 1.516106, -0.1719227, 0, 0, 0, 1, 1,
-1.266423, 1.554139, -1.040313, 0, 0, 0, 1, 1,
-1.251208, -2.66019, -1.967506, 1, 1, 1, 1, 1,
-1.247001, -0.3898489, -1.236201, 1, 1, 1, 1, 1,
-1.245244, -1.508043, -1.329354, 1, 1, 1, 1, 1,
-1.236251, -1.39119, -2.216794, 1, 1, 1, 1, 1,
-1.235914, 0.4089176, -1.0072, 1, 1, 1, 1, 1,
-1.231857, 1.450789, -0.857038, 1, 1, 1, 1, 1,
-1.225339, 0.7479894, 1.416858, 1, 1, 1, 1, 1,
-1.220286, 0.4561817, -1.166051, 1, 1, 1, 1, 1,
-1.219371, 1.030728, -0.2678282, 1, 1, 1, 1, 1,
-1.203031, -0.3334614, -2.957784, 1, 1, 1, 1, 1,
-1.19699, 0.2158421, -0.8280096, 1, 1, 1, 1, 1,
-1.196743, -0.706987, -1.603433, 1, 1, 1, 1, 1,
-1.192531, 0.1481137, -0.1561435, 1, 1, 1, 1, 1,
-1.188642, 1.243394, -0.5757375, 1, 1, 1, 1, 1,
-1.181047, 1.639726, -0.1083867, 1, 1, 1, 1, 1,
-1.176897, -0.4977601, -3.913191, 0, 0, 1, 1, 1,
-1.167847, -0.03888473, -2.563765, 1, 0, 0, 1, 1,
-1.163719, 0.5290325, -3.874277, 1, 0, 0, 1, 1,
-1.161248, -1.225526, -2.018871, 1, 0, 0, 1, 1,
-1.161136, -0.2075389, -3.145083, 1, 0, 0, 1, 1,
-1.159821, -1.422655, -4.201081, 1, 0, 0, 1, 1,
-1.151044, -0.4545463, -3.775137, 0, 0, 0, 1, 1,
-1.150836, -0.7908633, -1.780653, 0, 0, 0, 1, 1,
-1.143116, -0.5937902, -2.066129, 0, 0, 0, 1, 1,
-1.128479, 0.7130941, -0.301552, 0, 0, 0, 1, 1,
-1.126311, -0.8381416, -3.132154, 0, 0, 0, 1, 1,
-1.122522, 0.09924009, 0.2826781, 0, 0, 0, 1, 1,
-1.11345, -0.8708307, -3.029166, 0, 0, 0, 1, 1,
-1.106383, 0.4034487, 0.1380063, 1, 1, 1, 1, 1,
-1.103485, -0.3351583, -0.9593372, 1, 1, 1, 1, 1,
-1.095894, 1.087651, 1.121111, 1, 1, 1, 1, 1,
-1.095358, 1.431328, -1.193678, 1, 1, 1, 1, 1,
-1.092633, -1.499458, -1.761044, 1, 1, 1, 1, 1,
-1.090033, 0.6153834, -0.4380783, 1, 1, 1, 1, 1,
-1.089995, -0.2680575, -1.67628, 1, 1, 1, 1, 1,
-1.086517, -1.197099, -2.275938, 1, 1, 1, 1, 1,
-1.069267, -1.25326, -1.439715, 1, 1, 1, 1, 1,
-1.068377, -0.9402491, -3.171237, 1, 1, 1, 1, 1,
-1.061355, -0.8978075, -1.849739, 1, 1, 1, 1, 1,
-1.059764, 1.127551, -2.391816, 1, 1, 1, 1, 1,
-1.058904, -0.8134382, -1.813621, 1, 1, 1, 1, 1,
-1.057752, 0.9787858, -1.596867, 1, 1, 1, 1, 1,
-1.054326, 0.1154271, -2.141078, 1, 1, 1, 1, 1,
-1.044332, 0.4195981, 0.3898809, 0, 0, 1, 1, 1,
-1.042286, 0.09480834, -2.981066, 1, 0, 0, 1, 1,
-1.04082, 0.3352504, -0.5374491, 1, 0, 0, 1, 1,
-1.036536, -0.2333562, -1.386035, 1, 0, 0, 1, 1,
-1.03616, 0.862529, -1.195642, 1, 0, 0, 1, 1,
-1.035434, -0.9710701, -2.554878, 1, 0, 0, 1, 1,
-1.033161, -0.5165653, -1.950172, 0, 0, 0, 1, 1,
-1.032121, 1.474176, -1.407309, 0, 0, 0, 1, 1,
-1.029819, -0.2426269, -1.55572, 0, 0, 0, 1, 1,
-1.029484, -0.9132354, -3.101734, 0, 0, 0, 1, 1,
-1.017352, 0.3491283, -1.938287, 0, 0, 0, 1, 1,
-1.014535, -1.242828, -2.488158, 0, 0, 0, 1, 1,
-1.009614, -0.8096541, -3.792519, 0, 0, 0, 1, 1,
-1.002172, -0.2001341, -2.736194, 1, 1, 1, 1, 1,
-1.000772, 1.647892, 0.6643751, 1, 1, 1, 1, 1,
-0.995348, 0.5806316, -0.2926162, 1, 1, 1, 1, 1,
-0.9839739, -0.6725566, -1.373315, 1, 1, 1, 1, 1,
-0.9773224, -0.2207665, -1.733356, 1, 1, 1, 1, 1,
-0.9755669, 0.3122042, -0.9720522, 1, 1, 1, 1, 1,
-0.9739376, 1.245526, -0.08696978, 1, 1, 1, 1, 1,
-0.9704489, -1.239148, -2.804652, 1, 1, 1, 1, 1,
-0.9628789, -0.9099871, -2.35137, 1, 1, 1, 1, 1,
-0.9583343, -0.375535, -2.412944, 1, 1, 1, 1, 1,
-0.950047, -1.19403, -3.231776, 1, 1, 1, 1, 1,
-0.9387519, -0.1420002, -1.856323, 1, 1, 1, 1, 1,
-0.9382513, 0.1750547, -0.7598838, 1, 1, 1, 1, 1,
-0.9382356, -0.1693971, -3.902959, 1, 1, 1, 1, 1,
-0.9257843, -0.2111962, 0.009094425, 1, 1, 1, 1, 1,
-0.9025109, -0.07491709, -1.485903, 0, 0, 1, 1, 1,
-0.8995579, 0.9273384, -0.2428879, 1, 0, 0, 1, 1,
-0.8865082, -0.04149223, -1.304804, 1, 0, 0, 1, 1,
-0.8863902, 0.186788, -0.8476135, 1, 0, 0, 1, 1,
-0.8825703, -0.6571044, -1.382408, 1, 0, 0, 1, 1,
-0.8821781, -1.445847, -3.047746, 1, 0, 0, 1, 1,
-0.8784907, -0.6509321, -2.968874, 0, 0, 0, 1, 1,
-0.8705405, 0.8650674, -0.725106, 0, 0, 0, 1, 1,
-0.8669558, 0.9546479, -2.043164, 0, 0, 0, 1, 1,
-0.8627315, -0.6443264, -3.130386, 0, 0, 0, 1, 1,
-0.8612732, -0.3422661, -3.756761, 0, 0, 0, 1, 1,
-0.8583069, 0.04656262, -1.50797, 0, 0, 0, 1, 1,
-0.8540263, -0.05671419, -3.487756, 0, 0, 0, 1, 1,
-0.8508191, 0.1958345, -0.5707633, 1, 1, 1, 1, 1,
-0.8502319, 0.4252491, -1.647292, 1, 1, 1, 1, 1,
-0.8462331, 1.385654, -2.644011, 1, 1, 1, 1, 1,
-0.8449975, 0.08910105, -4.510825, 1, 1, 1, 1, 1,
-0.8443332, -1.024042, -2.923431, 1, 1, 1, 1, 1,
-0.8389721, 0.05042837, -2.956021, 1, 1, 1, 1, 1,
-0.838666, 0.6758076, -1.209603, 1, 1, 1, 1, 1,
-0.8259043, 0.5343054, 0.5613164, 1, 1, 1, 1, 1,
-0.8220788, 0.2156067, -2.578551, 1, 1, 1, 1, 1,
-0.8185698, -0.7749135, -2.498484, 1, 1, 1, 1, 1,
-0.8125795, 0.1002462, -1.309691, 1, 1, 1, 1, 1,
-0.8091376, 0.1383812, -1.328745, 1, 1, 1, 1, 1,
-0.8088088, 1.254559, -2.628995, 1, 1, 1, 1, 1,
-0.8046293, 0.3275186, -2.210818, 1, 1, 1, 1, 1,
-0.8044739, 1.21152, -2.80011, 1, 1, 1, 1, 1,
-0.8035136, 1.646011, -0.330275, 0, 0, 1, 1, 1,
-0.7833994, -0.4778779, -2.580155, 1, 0, 0, 1, 1,
-0.7827052, 0.184775, -1.457696, 1, 0, 0, 1, 1,
-0.7796639, -1.618349, -3.68994, 1, 0, 0, 1, 1,
-0.777607, -0.8991985, -2.782868, 1, 0, 0, 1, 1,
-0.7742538, -0.6526596, -1.917531, 1, 0, 0, 1, 1,
-0.7680225, 0.8551143, -1.520935, 0, 0, 0, 1, 1,
-0.7679222, -0.6444225, -4.420326, 0, 0, 0, 1, 1,
-0.7637653, 0.4444911, -1.580114, 0, 0, 0, 1, 1,
-0.7634529, 2.264102, -0.7460379, 0, 0, 0, 1, 1,
-0.7588534, 0.3636079, 0.5559332, 0, 0, 0, 1, 1,
-0.7566403, 1.281953, -0.4288741, 0, 0, 0, 1, 1,
-0.7455546, -1.205811, -2.917615, 0, 0, 0, 1, 1,
-0.7452034, -1.00228, -3.601318, 1, 1, 1, 1, 1,
-0.7443395, 0.5637699, -2.110194, 1, 1, 1, 1, 1,
-0.7433599, -1.881459, -4.268825, 1, 1, 1, 1, 1,
-0.7408034, -0.1787119, -2.622567, 1, 1, 1, 1, 1,
-0.7406729, -0.5898813, -1.529716, 1, 1, 1, 1, 1,
-0.7281545, 1.539253, -1.099018, 1, 1, 1, 1, 1,
-0.7280361, 0.6525664, -1.825195, 1, 1, 1, 1, 1,
-0.719026, -0.09222353, -2.274486, 1, 1, 1, 1, 1,
-0.715346, -2.049729, -1.685634, 1, 1, 1, 1, 1,
-0.7149584, 0.01712677, -0.6784801, 1, 1, 1, 1, 1,
-0.7106897, 0.7369127, -0.2138414, 1, 1, 1, 1, 1,
-0.7099547, -1.423244, -1.142577, 1, 1, 1, 1, 1,
-0.7092825, 0.709942, 0.4654156, 1, 1, 1, 1, 1,
-0.7087983, -0.4784636, -3.611569, 1, 1, 1, 1, 1,
-0.7057899, 0.7086866, -0.7053126, 1, 1, 1, 1, 1,
-0.7046965, -0.9878635, -2.308795, 0, 0, 1, 1, 1,
-0.7009087, 0.6013652, -1.223678, 1, 0, 0, 1, 1,
-0.6996467, -0.3914239, -2.765532, 1, 0, 0, 1, 1,
-0.6992071, 0.6134298, 0.8337559, 1, 0, 0, 1, 1,
-0.6962885, -0.8027859, -0.8844042, 1, 0, 0, 1, 1,
-0.691902, 0.6410369, -1.632985, 1, 0, 0, 1, 1,
-0.6908435, -0.3984108, -3.659428, 0, 0, 0, 1, 1,
-0.6901562, -0.08842909, -1.176977, 0, 0, 0, 1, 1,
-0.690025, 1.394214, 0.07467463, 0, 0, 0, 1, 1,
-0.6837564, -0.7144706, -2.834267, 0, 0, 0, 1, 1,
-0.6802238, 1.365494, -0.4611713, 0, 0, 0, 1, 1,
-0.6791847, -0.6419482, -2.518855, 0, 0, 0, 1, 1,
-0.6744662, 0.4806215, -0.5395698, 0, 0, 0, 1, 1,
-0.6735227, 0.853367, -1.706486, 1, 1, 1, 1, 1,
-0.6729192, -0.8878743, -2.857375, 1, 1, 1, 1, 1,
-0.6665446, -0.5376162, -1.993838, 1, 1, 1, 1, 1,
-0.6651869, 0.2109855, -0.191403, 1, 1, 1, 1, 1,
-0.6595422, -0.4909181, -1.361822, 1, 1, 1, 1, 1,
-0.6572311, -0.8147346, -4.72096, 1, 1, 1, 1, 1,
-0.6515767, 0.9639445, -1.235558, 1, 1, 1, 1, 1,
-0.6505989, -0.09218308, -1.124423, 1, 1, 1, 1, 1,
-0.6502829, -0.882848, -3.747201, 1, 1, 1, 1, 1,
-0.6492246, -0.6875821, -2.015942, 1, 1, 1, 1, 1,
-0.6482114, -0.9338798, -1.670463, 1, 1, 1, 1, 1,
-0.6477858, 0.4162827, -0.2326211, 1, 1, 1, 1, 1,
-0.6471642, 0.6506216, -2.310703, 1, 1, 1, 1, 1,
-0.6467578, 0.9518121, -0.2606538, 1, 1, 1, 1, 1,
-0.6467252, 1.732185, -0.2934683, 1, 1, 1, 1, 1,
-0.6453577, 0.6116011, 0.09753366, 0, 0, 1, 1, 1,
-0.64204, -0.1409625, -1.425271, 1, 0, 0, 1, 1,
-0.6411058, 0.5820331, -1.040929, 1, 0, 0, 1, 1,
-0.6368887, 0.7838923, -2.091751, 1, 0, 0, 1, 1,
-0.6243588, -0.309358, -3.644993, 1, 0, 0, 1, 1,
-0.622974, -0.4842643, -2.516459, 1, 0, 0, 1, 1,
-0.621139, 1.913037, -1.656283, 0, 0, 0, 1, 1,
-0.6156833, -1.659844, -2.111002, 0, 0, 0, 1, 1,
-0.6102747, 1.558011, -0.3894542, 0, 0, 0, 1, 1,
-0.6053329, -0.1448415, -2.359828, 0, 0, 0, 1, 1,
-0.6044065, 0.1751126, -0.46015, 0, 0, 0, 1, 1,
-0.5998391, -0.4658479, -2.067743, 0, 0, 0, 1, 1,
-0.5995409, 1.878536, -0.9934777, 0, 0, 0, 1, 1,
-0.5989047, -0.9657217, -0.7853015, 1, 1, 1, 1, 1,
-0.5950029, 0.9415486, -1.155822, 1, 1, 1, 1, 1,
-0.5929826, -1.24318, -3.225171, 1, 1, 1, 1, 1,
-0.591822, 0.4079576, -0.3092928, 1, 1, 1, 1, 1,
-0.5885099, 0.1361559, 1.462651, 1, 1, 1, 1, 1,
-0.5849449, 0.09004346, -1.688294, 1, 1, 1, 1, 1,
-0.5801901, 0.3627688, -2.004736, 1, 1, 1, 1, 1,
-0.5791118, 0.4459648, 0.4224084, 1, 1, 1, 1, 1,
-0.5785245, -0.5004748, -4.129695, 1, 1, 1, 1, 1,
-0.5649205, 0.5075902, 0.7726766, 1, 1, 1, 1, 1,
-0.5583588, -0.9334542, -1.977112, 1, 1, 1, 1, 1,
-0.5568483, 0.1772396, -0.8461277, 1, 1, 1, 1, 1,
-0.5542937, -1.03867, -3.384337, 1, 1, 1, 1, 1,
-0.549686, 1.343606, 1.132939, 1, 1, 1, 1, 1,
-0.540593, -1.486767, -2.408981, 1, 1, 1, 1, 1,
-0.5348514, 1.82319, 0.417458, 0, 0, 1, 1, 1,
-0.5323266, -0.3611019, -3.479086, 1, 0, 0, 1, 1,
-0.5296499, -1.313651, -2.518319, 1, 0, 0, 1, 1,
-0.5270294, 0.4652826, -0.9063164, 1, 0, 0, 1, 1,
-0.5268061, -0.1268359, -3.012959, 1, 0, 0, 1, 1,
-0.5229527, -0.8618519, -3.070132, 1, 0, 0, 1, 1,
-0.5212693, -0.9060749, -4.003391, 0, 0, 0, 1, 1,
-0.5211064, -0.7915743, -3.0249, 0, 0, 0, 1, 1,
-0.51805, 0.09516701, -1.302906, 0, 0, 0, 1, 1,
-0.514973, 1.078469, -0.06276844, 0, 0, 0, 1, 1,
-0.5098622, 1.580783, 0.9913972, 0, 0, 0, 1, 1,
-0.5054147, 0.1186908, -2.483399, 0, 0, 0, 1, 1,
-0.5022383, 0.512798, -0.3459323, 0, 0, 0, 1, 1,
-0.4994206, 0.05976611, -2.899292, 1, 1, 1, 1, 1,
-0.4986886, 0.5600346, -1.732326, 1, 1, 1, 1, 1,
-0.4932741, 0.3352428, -1.019191, 1, 1, 1, 1, 1,
-0.4893625, -0.3910618, -3.297153, 1, 1, 1, 1, 1,
-0.4891221, -1.361552, -3.586854, 1, 1, 1, 1, 1,
-0.4857229, -0.06887495, -0.3284308, 1, 1, 1, 1, 1,
-0.4815826, -0.6202056, -4.702826, 1, 1, 1, 1, 1,
-0.4778528, 0.5856939, -0.8748279, 1, 1, 1, 1, 1,
-0.4751073, 0.4484502, -1.085612, 1, 1, 1, 1, 1,
-0.4685142, 1.014498, 0.1577567, 1, 1, 1, 1, 1,
-0.4604844, -0.05496541, -2.323723, 1, 1, 1, 1, 1,
-0.4590181, 0.8946586, 0.9203092, 1, 1, 1, 1, 1,
-0.4584561, -0.6575944, -2.54893, 1, 1, 1, 1, 1,
-0.4550684, 1.876954, 0.4408469, 1, 1, 1, 1, 1,
-0.4550568, -0.3894485, -1.795492, 1, 1, 1, 1, 1,
-0.4546567, 0.3808051, -0.909483, 0, 0, 1, 1, 1,
-0.4545326, 1.574832, 0.3009044, 1, 0, 0, 1, 1,
-0.4534019, 1.009355, -0.2090234, 1, 0, 0, 1, 1,
-0.4532852, -0.3168389, -3.196157, 1, 0, 0, 1, 1,
-0.4523209, 0.7509744, -1.561543, 1, 0, 0, 1, 1,
-0.4473126, 0.1739087, -1.486108, 1, 0, 0, 1, 1,
-0.4470021, -1.080106, -1.952212, 0, 0, 0, 1, 1,
-0.4448718, 0.5067932, -1.421884, 0, 0, 0, 1, 1,
-0.4441369, 0.01081955, -0.9491217, 0, 0, 0, 1, 1,
-0.4412725, -0.8709259, -1.628969, 0, 0, 0, 1, 1,
-0.4400539, 0.7307971, -1.550837, 0, 0, 0, 1, 1,
-0.4357884, -0.1907577, -3.331514, 0, 0, 0, 1, 1,
-0.4357344, -0.4413491, -1.939439, 0, 0, 0, 1, 1,
-0.4344531, -1.780364, -3.084351, 1, 1, 1, 1, 1,
-0.4341298, 1.552812, -1.570497, 1, 1, 1, 1, 1,
-0.4327998, -0.7303879, -3.817866, 1, 1, 1, 1, 1,
-0.4304684, 0.6775438, 0.3822237, 1, 1, 1, 1, 1,
-0.4303533, 0.8624289, -0.4215617, 1, 1, 1, 1, 1,
-0.4302235, -0.8582843, -2.621619, 1, 1, 1, 1, 1,
-0.4300126, 1.457503, -0.06661325, 1, 1, 1, 1, 1,
-0.4266052, -0.5044957, -2.535009, 1, 1, 1, 1, 1,
-0.4258642, 0.6834589, 0.1843393, 1, 1, 1, 1, 1,
-0.4248425, -2.07993, -3.221427, 1, 1, 1, 1, 1,
-0.4240547, -0.1890688, -2.990038, 1, 1, 1, 1, 1,
-0.4224255, -0.4394748, -1.672989, 1, 1, 1, 1, 1,
-0.4201519, 0.5986435, -2.219519, 1, 1, 1, 1, 1,
-0.4199596, 0.9935941, 1.492653, 1, 1, 1, 1, 1,
-0.4107619, 0.7080501, -0.9531251, 1, 1, 1, 1, 1,
-0.40317, 1.409813, -0.2863032, 0, 0, 1, 1, 1,
-0.3976837, 0.2581427, -0.1704111, 1, 0, 0, 1, 1,
-0.3963979, -0.5253401, -3.155408, 1, 0, 0, 1, 1,
-0.3954785, 0.05504204, -2.148313, 1, 0, 0, 1, 1,
-0.3938955, 0.423943, -0.8950425, 1, 0, 0, 1, 1,
-0.3893723, -1.292067, -3.781744, 1, 0, 0, 1, 1,
-0.3877477, -1.393151, -1.316173, 0, 0, 0, 1, 1,
-0.3825462, -0.04844942, -0.07997634, 0, 0, 0, 1, 1,
-0.3814188, -1.129066, -3.433298, 0, 0, 0, 1, 1,
-0.381404, 0.7605307, 1.206284, 0, 0, 0, 1, 1,
-0.3802534, -0.2607589, -2.455196, 0, 0, 0, 1, 1,
-0.3801638, -1.893339, -2.892127, 0, 0, 0, 1, 1,
-0.3767197, 0.4711531, -0.6173115, 0, 0, 0, 1, 1,
-0.3740521, -0.2052369, -2.212977, 1, 1, 1, 1, 1,
-0.3717992, 2.853817, 0.02845462, 1, 1, 1, 1, 1,
-0.370912, -0.5560141, -3.128886, 1, 1, 1, 1, 1,
-0.3677596, -0.2022475, -1.484915, 1, 1, 1, 1, 1,
-0.3662591, 0.7373458, -0.6915337, 1, 1, 1, 1, 1,
-0.3633711, -0.7808477, -3.211546, 1, 1, 1, 1, 1,
-0.3613637, -1.075868, -2.267808, 1, 1, 1, 1, 1,
-0.3560439, -0.05044688, -2.242556, 1, 1, 1, 1, 1,
-0.3551671, 0.4273945, -2.332525, 1, 1, 1, 1, 1,
-0.3536264, 0.9873441, 0.8103641, 1, 1, 1, 1, 1,
-0.3520032, -0.08588146, -0.1701992, 1, 1, 1, 1, 1,
-0.3490718, 1.997487, -0.2273187, 1, 1, 1, 1, 1,
-0.3460508, 1.346883, 0.8509599, 1, 1, 1, 1, 1,
-0.3441457, 0.4013336, 0.7326745, 1, 1, 1, 1, 1,
-0.3375378, 1.004566, -1.33862, 1, 1, 1, 1, 1,
-0.3348868, -1.341407, -1.724431, 0, 0, 1, 1, 1,
-0.3337245, 1.022564, -1.17407, 1, 0, 0, 1, 1,
-0.3333363, -0.8111239, -3.508701, 1, 0, 0, 1, 1,
-0.3287488, 1.130388, -0.03465324, 1, 0, 0, 1, 1,
-0.3280858, -0.9879066, -3.094574, 1, 0, 0, 1, 1,
-0.3272027, -0.4085796, -1.753833, 1, 0, 0, 1, 1,
-0.3237951, 1.104647, -2.807467, 0, 0, 0, 1, 1,
-0.3178586, 0.09691732, -1.877151, 0, 0, 0, 1, 1,
-0.3154431, 0.1997609, 0.6770798, 0, 0, 0, 1, 1,
-0.3143693, 0.3860919, 0.01200102, 0, 0, 0, 1, 1,
-0.3127874, -0.3770573, 0.7740434, 0, 0, 0, 1, 1,
-0.299701, -0.8414388, -0.707583, 0, 0, 0, 1, 1,
-0.2948324, 0.1396736, -2.696671, 0, 0, 0, 1, 1,
-0.2880738, -0.640983, -2.966141, 1, 1, 1, 1, 1,
-0.2868342, -0.4317339, -2.277969, 1, 1, 1, 1, 1,
-0.2828079, -0.2392468, -0.9941735, 1, 1, 1, 1, 1,
-0.2820085, 0.5355161, -2.330555, 1, 1, 1, 1, 1,
-0.2802721, -0.6662543, -4.17692, 1, 1, 1, 1, 1,
-0.2757, -0.4530069, -2.161803, 1, 1, 1, 1, 1,
-0.2730042, -0.008101091, -2.76766, 1, 1, 1, 1, 1,
-0.2707818, 0.4724169, -0.9064188, 1, 1, 1, 1, 1,
-0.2696752, 1.028998, 0.4470751, 1, 1, 1, 1, 1,
-0.2684094, -0.116154, -2.357335, 1, 1, 1, 1, 1,
-0.2632639, 0.710268, -1.13639, 1, 1, 1, 1, 1,
-0.2627535, -1.31839, -1.261539, 1, 1, 1, 1, 1,
-0.2619557, 0.6868557, -0.8694763, 1, 1, 1, 1, 1,
-0.2610023, 0.3589405, -0.2902402, 1, 1, 1, 1, 1,
-0.2571905, 0.9759111, 0.9170564, 1, 1, 1, 1, 1,
-0.2557546, -0.9629748, -4.051325, 0, 0, 1, 1, 1,
-0.2545763, -1.442715, -2.460468, 1, 0, 0, 1, 1,
-0.2532269, -0.3258182, -1.27514, 1, 0, 0, 1, 1,
-0.2524208, -0.08041674, -0.9091822, 1, 0, 0, 1, 1,
-0.2498799, 1.009992, 0.1748181, 1, 0, 0, 1, 1,
-0.246947, -0.2690722, -3.345001, 1, 0, 0, 1, 1,
-0.2433272, 1.300624, 0.1677512, 0, 0, 0, 1, 1,
-0.2419736, -1.252761, -3.466781, 0, 0, 0, 1, 1,
-0.2400768, -0.3277405, -2.237745, 0, 0, 0, 1, 1,
-0.2399675, 0.73417, -0.5312496, 0, 0, 0, 1, 1,
-0.235298, 1.018376, 0.1252188, 0, 0, 0, 1, 1,
-0.2326286, -0.0391917, -1.231872, 0, 0, 0, 1, 1,
-0.2296989, 0.2503802, -0.009454061, 0, 0, 0, 1, 1,
-0.2286772, -0.773546, -0.3871154, 1, 1, 1, 1, 1,
-0.2209338, -0.1381133, -1.83734, 1, 1, 1, 1, 1,
-0.2191812, 0.0678157, -1.00553, 1, 1, 1, 1, 1,
-0.2187829, 0.8108228, 1.142286, 1, 1, 1, 1, 1,
-0.215204, 0.02002244, -2.505297, 1, 1, 1, 1, 1,
-0.2118611, 0.1470056, -0.6392341, 1, 1, 1, 1, 1,
-0.210844, 0.7903547, -1.594408, 1, 1, 1, 1, 1,
-0.2107293, -0.6262812, -3.692567, 1, 1, 1, 1, 1,
-0.2098868, 1.01911, -2.931593, 1, 1, 1, 1, 1,
-0.2019121, 1.75189, -0.104423, 1, 1, 1, 1, 1,
-0.1992914, -2.020187, -4.070578, 1, 1, 1, 1, 1,
-0.1988141, -0.385721, -1.81004, 1, 1, 1, 1, 1,
-0.1954674, 1.405011, 0.6687561, 1, 1, 1, 1, 1,
-0.1946131, 1.170925, -0.9276562, 1, 1, 1, 1, 1,
-0.193235, -0.336192, -3.582464, 1, 1, 1, 1, 1,
-0.186792, -0.2195195, -2.815645, 0, 0, 1, 1, 1,
-0.1746632, 0.7820548, -0.81073, 1, 0, 0, 1, 1,
-0.1746537, -0.5838547, -2.607529, 1, 0, 0, 1, 1,
-0.1712159, -1.179551, -4.266901, 1, 0, 0, 1, 1,
-0.1708056, -2.460812, -1.796471, 1, 0, 0, 1, 1,
-0.167797, -1.778865, -3.751415, 1, 0, 0, 1, 1,
-0.1670079, -1.50871, -2.829739, 0, 0, 0, 1, 1,
-0.1635372, 0.2316661, -1.125891, 0, 0, 0, 1, 1,
-0.1610004, 0.187503, -2.304973, 0, 0, 0, 1, 1,
-0.1595325, 1.098777, -1.785925, 0, 0, 0, 1, 1,
-0.1577707, -0.2655583, 0.2555173, 0, 0, 0, 1, 1,
-0.1473457, 1.246513, 0.01411614, 0, 0, 0, 1, 1,
-0.1403436, -0.7254304, -3.889947, 0, 0, 0, 1, 1,
-0.1403015, 2.117659, -0.8446375, 1, 1, 1, 1, 1,
-0.1401758, 1.469702, -1.249072, 1, 1, 1, 1, 1,
-0.1393778, -1.116633, -1.09949, 1, 1, 1, 1, 1,
-0.1356983, 0.664915, 1.118843, 1, 1, 1, 1, 1,
-0.134817, -0.7553, -3.084114, 1, 1, 1, 1, 1,
-0.1338254, -1.106627, -1.731754, 1, 1, 1, 1, 1,
-0.1233221, 0.4541489, -0.5645345, 1, 1, 1, 1, 1,
-0.1229898, 0.316438, -0.04087318, 1, 1, 1, 1, 1,
-0.1199609, 2.158529, 0.00814977, 1, 1, 1, 1, 1,
-0.115524, -0.6571307, -2.973438, 1, 1, 1, 1, 1,
-0.1134927, -0.02459033, -2.5581, 1, 1, 1, 1, 1,
-0.1038077, 1.005049, -0.2053656, 1, 1, 1, 1, 1,
-0.09597917, 0.3552627, -0.2365886, 1, 1, 1, 1, 1,
-0.09089775, 1.628952, 1.746683, 1, 1, 1, 1, 1,
-0.09000412, -0.8883619, -3.617725, 1, 1, 1, 1, 1,
-0.08795728, -0.5987334, -3.706493, 0, 0, 1, 1, 1,
-0.08489387, 1.373217, -2.440881, 1, 0, 0, 1, 1,
-0.08301803, 1.756521, -1.253383, 1, 0, 0, 1, 1,
-0.08127829, 0.2753706, 0.3251437, 1, 0, 0, 1, 1,
-0.07861501, 0.4900758, -0.07717858, 1, 0, 0, 1, 1,
-0.07465167, -0.5899974, -3.854238, 1, 0, 0, 1, 1,
-0.06985996, 1.087205, -1.022685, 0, 0, 0, 1, 1,
-0.06910194, 1.469595, -1.3266, 0, 0, 0, 1, 1,
-0.06322853, 0.424132, -0.7791595, 0, 0, 0, 1, 1,
-0.06005279, -0.02455429, -1.234737, 0, 0, 0, 1, 1,
-0.05744524, 0.7176909, -0.6848509, 0, 0, 0, 1, 1,
-0.05722671, 0.2220776, -1.30466, 0, 0, 0, 1, 1,
-0.05715945, 0.5688828, -1.02624, 0, 0, 0, 1, 1,
-0.05205281, 1.639743, 0.8327678, 1, 1, 1, 1, 1,
-0.04576002, 0.1835495, 0.2431036, 1, 1, 1, 1, 1,
-0.04410057, 0.03313146, -2.148831, 1, 1, 1, 1, 1,
-0.04362939, 0.2302662, -1.068121, 1, 1, 1, 1, 1,
-0.04224742, -0.06597845, -2.784937, 1, 1, 1, 1, 1,
-0.04012912, -0.5023497, -3.962403, 1, 1, 1, 1, 1,
-0.03934885, -0.409452, -1.523112, 1, 1, 1, 1, 1,
-0.03765465, 0.763253, -0.003482499, 1, 1, 1, 1, 1,
-0.03094672, 0.3503358, -1.939571, 1, 1, 1, 1, 1,
-0.02718624, 0.6081353, 2.016302, 1, 1, 1, 1, 1,
-0.02669912, -0.1174255, -4.369594, 1, 1, 1, 1, 1,
-0.02230797, 1.099442, 0.01295548, 1, 1, 1, 1, 1,
-0.02185214, -0.3474012, -2.183795, 1, 1, 1, 1, 1,
-0.01820522, 0.2224516, -0.5400636, 1, 1, 1, 1, 1,
-0.01520929, -0.3615405, -3.850986, 1, 1, 1, 1, 1,
-0.006911087, -0.3539694, -1.879958, 0, 0, 1, 1, 1,
-0.006491147, -0.1626948, -4.633646, 1, 0, 0, 1, 1,
-0.005830718, -0.3834358, -3.410956, 1, 0, 0, 1, 1,
-0.005026782, 0.2659945, -0.903328, 1, 0, 0, 1, 1,
-0.002403066, -0.3888315, -0.7414122, 1, 0, 0, 1, 1,
0.001321682, 0.3702109, 1.362709, 1, 0, 0, 1, 1,
0.001670894, 0.1866992, -0.3178445, 0, 0, 0, 1, 1,
0.004222069, 2.260867, -0.2492876, 0, 0, 0, 1, 1,
0.004807731, -1.078202, 4.173447, 0, 0, 0, 1, 1,
0.006437906, -0.2956388, 4.261036, 0, 0, 0, 1, 1,
0.0116174, 0.5345018, 0.5921884, 0, 0, 0, 1, 1,
0.01447835, 0.5183353, -0.06659443, 0, 0, 0, 1, 1,
0.01519082, -1.340623, 3.492056, 0, 0, 0, 1, 1,
0.01771263, 0.04807475, -0.09579964, 1, 1, 1, 1, 1,
0.01957323, 0.1629025, -1.807062, 1, 1, 1, 1, 1,
0.02173194, 1.091687, 0.5234805, 1, 1, 1, 1, 1,
0.02219054, -0.9312764, 2.861438, 1, 1, 1, 1, 1,
0.02230427, -0.961445, 3.321292, 1, 1, 1, 1, 1,
0.02460263, -0.7948198, 5.192399, 1, 1, 1, 1, 1,
0.02624852, -0.8265232, 3.573716, 1, 1, 1, 1, 1,
0.02680116, -0.4804856, 1.933758, 1, 1, 1, 1, 1,
0.02830348, -1.179448, 2.506015, 1, 1, 1, 1, 1,
0.03491329, 0.7445226, 0.5283625, 1, 1, 1, 1, 1,
0.03518211, -0.7802126, 1.973954, 1, 1, 1, 1, 1,
0.04003179, 0.7284274, 0.4736849, 1, 1, 1, 1, 1,
0.04100101, -0.5777711, 1.811808, 1, 1, 1, 1, 1,
0.04349778, -0.1169487, 1.38515, 1, 1, 1, 1, 1,
0.04512013, 0.3582979, 0.3089857, 1, 1, 1, 1, 1,
0.04719663, -0.433337, 2.529045, 0, 0, 1, 1, 1,
0.05040959, 0.6307467, -0.2287475, 1, 0, 0, 1, 1,
0.0510966, 0.1872784, -2.041365, 1, 0, 0, 1, 1,
0.05201618, -0.9747519, 3.364149, 1, 0, 0, 1, 1,
0.05635796, -0.8700214, 2.661937, 1, 0, 0, 1, 1,
0.056968, -0.9582357, 2.071281, 1, 0, 0, 1, 1,
0.05880922, -2.393468, 3.858835, 0, 0, 0, 1, 1,
0.0629434, -0.4619021, 2.390606, 0, 0, 0, 1, 1,
0.06324397, 1.514608, -0.2052419, 0, 0, 0, 1, 1,
0.06440748, 0.4923078, 0.4853772, 0, 0, 0, 1, 1,
0.06519022, 0.51662, 1.172334, 0, 0, 0, 1, 1,
0.06823444, 1.05126, -0.3540998, 0, 0, 0, 1, 1,
0.069703, 1.260071, -0.5834063, 0, 0, 0, 1, 1,
0.0703087, 0.9440874, -0.5046599, 1, 1, 1, 1, 1,
0.07395062, 0.277585, -1.49426, 1, 1, 1, 1, 1,
0.07460356, 0.7845381, 1.084365, 1, 1, 1, 1, 1,
0.07690063, 1.15744, -0.1914624, 1, 1, 1, 1, 1,
0.07747545, -1.086481, 3.6417, 1, 1, 1, 1, 1,
0.07892961, 1.076338, 0.2825105, 1, 1, 1, 1, 1,
0.08011118, -0.6127977, 3.663848, 1, 1, 1, 1, 1,
0.08072763, 0.5317404, 2.537287, 1, 1, 1, 1, 1,
0.08189356, -1.419373, 3.344191, 1, 1, 1, 1, 1,
0.08722131, -0.1032317, 2.110743, 1, 1, 1, 1, 1,
0.0876298, 0.4422118, 1.092527, 1, 1, 1, 1, 1,
0.09108001, 2.494763, 1.629465, 1, 1, 1, 1, 1,
0.09150046, 1.769284, -0.07567132, 1, 1, 1, 1, 1,
0.0924764, -0.993809, 1.604917, 1, 1, 1, 1, 1,
0.09341469, 1.323419, 1.023046, 1, 1, 1, 1, 1,
0.09720024, 1.289894, 1.41941, 0, 0, 1, 1, 1,
0.0982677, 1.570087, -0.4170883, 1, 0, 0, 1, 1,
0.09868101, 2.173516, -1.038654, 1, 0, 0, 1, 1,
0.09953074, -1.155036, 3.831556, 1, 0, 0, 1, 1,
0.1040918, -0.08596348, 2.873537, 1, 0, 0, 1, 1,
0.1114351, 0.337791, -0.2499642, 1, 0, 0, 1, 1,
0.1128214, -0.7170182, 3.586527, 0, 0, 0, 1, 1,
0.1132419, 0.09250408, 1.46513, 0, 0, 0, 1, 1,
0.1188322, -0.06266367, 4.52528, 0, 0, 0, 1, 1,
0.1200445, 0.07147519, 0.7075725, 0, 0, 0, 1, 1,
0.122662, -3.311296, 4.43222, 0, 0, 0, 1, 1,
0.1268157, -1.010728, 2.749449, 0, 0, 0, 1, 1,
0.1299545, -0.460136, 2.060735, 0, 0, 0, 1, 1,
0.1343605, -0.1074626, 0.7301534, 1, 1, 1, 1, 1,
0.1384522, 1.531597, 0.7051347, 1, 1, 1, 1, 1,
0.1390868, -0.3717028, 2.381775, 1, 1, 1, 1, 1,
0.1411164, -1.887013, 2.333359, 1, 1, 1, 1, 1,
0.1488525, 1.979316, 1.790768, 1, 1, 1, 1, 1,
0.1526773, 1.284018, -1.461178, 1, 1, 1, 1, 1,
0.1535383, 0.375633, 2.360428, 1, 1, 1, 1, 1,
0.1596379, -0.4049819, 2.176225, 1, 1, 1, 1, 1,
0.1629641, -0.496278, 2.315916, 1, 1, 1, 1, 1,
0.1633989, 1.120383, 0.3174019, 1, 1, 1, 1, 1,
0.1645065, 0.7968021, -0.4505439, 1, 1, 1, 1, 1,
0.1703109, 0.4315889, 0.8930164, 1, 1, 1, 1, 1,
0.1729878, -1.108592, 1.381113, 1, 1, 1, 1, 1,
0.1803251, -1.221696, 4.41356, 1, 1, 1, 1, 1,
0.1812689, -0.1513344, 2.023923, 1, 1, 1, 1, 1,
0.1826465, 0.6346024, 0.008366394, 0, 0, 1, 1, 1,
0.1848745, 0.3399409, 1.463226, 1, 0, 0, 1, 1,
0.1875259, 0.5144786, 1.004078, 1, 0, 0, 1, 1,
0.1901639, -1.061977, 2.620805, 1, 0, 0, 1, 1,
0.1922792, -0.8966691, 2.976085, 1, 0, 0, 1, 1,
0.196443, -0.4618308, 1.474484, 1, 0, 0, 1, 1,
0.2001708, 0.05901938, 1.333541, 0, 0, 0, 1, 1,
0.2002298, 0.001271035, 1.546391, 0, 0, 0, 1, 1,
0.2029976, -0.203284, 2.221464, 0, 0, 0, 1, 1,
0.2035662, -0.6790583, 2.144856, 0, 0, 0, 1, 1,
0.2084065, 1.100522, -0.07334508, 0, 0, 0, 1, 1,
0.212618, -0.8473606, 2.950835, 0, 0, 0, 1, 1,
0.2167049, 0.7717211, 0.6374044, 0, 0, 0, 1, 1,
0.2198748, 0.8518061, -0.5231075, 1, 1, 1, 1, 1,
0.2228995, -0.2354801, 4.338727, 1, 1, 1, 1, 1,
0.2277317, -0.6497817, 3.450451, 1, 1, 1, 1, 1,
0.2290737, 0.4136168, -0.4575075, 1, 1, 1, 1, 1,
0.2337628, 0.8227809, 1.469568, 1, 1, 1, 1, 1,
0.2400557, 0.9502702, -0.4910927, 1, 1, 1, 1, 1,
0.2443264, 0.4096683, 0.4510723, 1, 1, 1, 1, 1,
0.2448803, 1.364052, 1.891034, 1, 1, 1, 1, 1,
0.246568, -1.464244, 2.085248, 1, 1, 1, 1, 1,
0.246866, 2.436066, -0.02643696, 1, 1, 1, 1, 1,
0.2471835, 2.194267, 0.8708388, 1, 1, 1, 1, 1,
0.2473048, 0.9599717, -0.8972041, 1, 1, 1, 1, 1,
0.2475318, -0.5179397, 3.584249, 1, 1, 1, 1, 1,
0.2496247, 0.2354316, -0.3012969, 1, 1, 1, 1, 1,
0.2501769, -0.1322666, 2.618523, 1, 1, 1, 1, 1,
0.253276, 0.09902374, 2.622504, 0, 0, 1, 1, 1,
0.2536124, -1.320696, 3.543559, 1, 0, 0, 1, 1,
0.2549993, 0.6975197, 1.249725, 1, 0, 0, 1, 1,
0.2585917, -0.6430323, 3.839161, 1, 0, 0, 1, 1,
0.2600721, -0.9660361, 1.870366, 1, 0, 0, 1, 1,
0.2603788, -0.7883124, 1.522499, 1, 0, 0, 1, 1,
0.2605556, 1.496111, 0.05745487, 0, 0, 0, 1, 1,
0.262367, 0.0910355, 1.722847, 0, 0, 0, 1, 1,
0.2627034, -0.2718292, 1.98228, 0, 0, 0, 1, 1,
0.2636674, -0.08813225, 0.134337, 0, 0, 0, 1, 1,
0.2644545, -0.7619313, 3.728298, 0, 0, 0, 1, 1,
0.2691351, -0.06629252, 2.213679, 0, 0, 0, 1, 1,
0.2692446, 1.275551, 2.292633, 0, 0, 0, 1, 1,
0.2695583, 1.24664, -0.1713936, 1, 1, 1, 1, 1,
0.2700984, 0.5269849, 1.306248, 1, 1, 1, 1, 1,
0.272729, 0.06993873, 0.2998818, 1, 1, 1, 1, 1,
0.2728601, 0.6507046, 1.411583, 1, 1, 1, 1, 1,
0.2733547, 0.5103111, 0.6981143, 1, 1, 1, 1, 1,
0.2836773, -0.3068058, 3.329059, 1, 1, 1, 1, 1,
0.2846463, 0.1660497, 0.2847057, 1, 1, 1, 1, 1,
0.2860553, 0.5600623, 0.7447932, 1, 1, 1, 1, 1,
0.2870386, 1.32253, 1.247887, 1, 1, 1, 1, 1,
0.2870688, 0.6374792, -0.9158491, 1, 1, 1, 1, 1,
0.3017819, -1.027287, 4.842638, 1, 1, 1, 1, 1,
0.3024855, 0.8432526, -0.1814943, 1, 1, 1, 1, 1,
0.3029491, 0.9722025, 1.396353, 1, 1, 1, 1, 1,
0.3035639, 0.2410334, 0.8960452, 1, 1, 1, 1, 1,
0.3113551, 0.4877276, 0.400819, 1, 1, 1, 1, 1,
0.3132828, 0.4708838, 0.8664784, 0, 0, 1, 1, 1,
0.3139739, 0.2287625, -0.126716, 1, 0, 0, 1, 1,
0.3184649, -0.08323904, 1.125171, 1, 0, 0, 1, 1,
0.3201318, 0.2850425, 0.2012589, 1, 0, 0, 1, 1,
0.3209474, -0.8263644, 2.214979, 1, 0, 0, 1, 1,
0.3215724, -0.06520744, 1.21669, 1, 0, 0, 1, 1,
0.3228043, 1.074692, 0.4341159, 0, 0, 0, 1, 1,
0.3232471, 0.7350962, 1.052145, 0, 0, 0, 1, 1,
0.3232611, 1.913534, -1.202909, 0, 0, 0, 1, 1,
0.326808, 0.6389138, 1.661533, 0, 0, 0, 1, 1,
0.3339828, -2.072047, 1.9011, 0, 0, 0, 1, 1,
0.3364711, -0.4546252, 3.657276, 0, 0, 0, 1, 1,
0.3368849, -0.1370223, 2.116478, 0, 0, 0, 1, 1,
0.342135, -0.5900581, 2.728388, 1, 1, 1, 1, 1,
0.3449706, -0.06620649, 2.56043, 1, 1, 1, 1, 1,
0.3457388, 1.479946, 1.18043, 1, 1, 1, 1, 1,
0.3500405, -0.8878937, 1.488854, 1, 1, 1, 1, 1,
0.351171, -0.39735, 2.355036, 1, 1, 1, 1, 1,
0.3601063, -0.2795098, 2.637099, 1, 1, 1, 1, 1,
0.3655427, -0.2192182, 1.435606, 1, 1, 1, 1, 1,
0.3766149, -1.101599, 2.417252, 1, 1, 1, 1, 1,
0.3827315, 0.3533954, 0.4971105, 1, 1, 1, 1, 1,
0.3834092, -0.4288183, 0.3068357, 1, 1, 1, 1, 1,
0.3847629, -0.4216126, 0.06818685, 1, 1, 1, 1, 1,
0.3855135, 2.265075, 0.931912, 1, 1, 1, 1, 1,
0.3875533, -0.1370403, 4.761848, 1, 1, 1, 1, 1,
0.3890433, 1.742937, 0.8883334, 1, 1, 1, 1, 1,
0.3922949, -1.731104, 3.626168, 1, 1, 1, 1, 1,
0.3946705, -0.5879294, 3.153125, 0, 0, 1, 1, 1,
0.3951527, 0.2411154, -0.4347194, 1, 0, 0, 1, 1,
0.3958572, -0.6451626, 2.209292, 1, 0, 0, 1, 1,
0.3960325, -0.7571356, 2.335767, 1, 0, 0, 1, 1,
0.3974093, 0.1501364, 0.5676905, 1, 0, 0, 1, 1,
0.3980414, 1.50867, -1.392742, 1, 0, 0, 1, 1,
0.4034176, -0.8544639, 1.767942, 0, 0, 0, 1, 1,
0.4035616, 1.678911, 2.682324, 0, 0, 0, 1, 1,
0.4049132, -0.8002591, 2.058033, 0, 0, 0, 1, 1,
0.4057838, 1.387756, 0.5556205, 0, 0, 0, 1, 1,
0.4079716, 0.29714, 0.2514407, 0, 0, 0, 1, 1,
0.4148709, -2.488676, 2.796271, 0, 0, 0, 1, 1,
0.4189698, -0.3973856, 2.325657, 0, 0, 0, 1, 1,
0.4254929, 0.4236073, 0.06092658, 1, 1, 1, 1, 1,
0.4263945, -1.750786, 2.489663, 1, 1, 1, 1, 1,
0.4293704, -0.009766882, 3.087017, 1, 1, 1, 1, 1,
0.429652, -0.1513138, 2.329832, 1, 1, 1, 1, 1,
0.4317208, 0.6123747, -0.5431158, 1, 1, 1, 1, 1,
0.4339492, -0.3178471, 2.093036, 1, 1, 1, 1, 1,
0.4345354, 0.3934796, -0.615617, 1, 1, 1, 1, 1,
0.4349286, 1.459409, 1.240232, 1, 1, 1, 1, 1,
0.4420107, -0.3842104, 0.1141124, 1, 1, 1, 1, 1,
0.4500672, -0.1923503, 1.06127, 1, 1, 1, 1, 1,
0.4521022, 1.508367, 1.441866, 1, 1, 1, 1, 1,
0.4534752, -0.4941902, 1.897919, 1, 1, 1, 1, 1,
0.4545819, 1.3419, 0.6180199, 1, 1, 1, 1, 1,
0.4549648, 1.378797, 0.05136291, 1, 1, 1, 1, 1,
0.4587509, -2.574769, 3.393952, 1, 1, 1, 1, 1,
0.4595759, 0.7516719, -1.45003, 0, 0, 1, 1, 1,
0.4614351, 2.25084, 1.291525, 1, 0, 0, 1, 1,
0.4692662, 0.02407279, 2.583242, 1, 0, 0, 1, 1,
0.4698082, 1.528999, -0.9231839, 1, 0, 0, 1, 1,
0.4771631, -1.989359, 4.274655, 1, 0, 0, 1, 1,
0.478358, 0.1196377, 0.7240974, 1, 0, 0, 1, 1,
0.4859217, 0.04028397, 0.2032797, 0, 0, 0, 1, 1,
0.4878076, -0.4906719, 1.4019, 0, 0, 0, 1, 1,
0.4880802, -0.7486025, 2.858763, 0, 0, 0, 1, 1,
0.490504, 0.09887117, 1.372871, 0, 0, 0, 1, 1,
0.496291, 0.8634731, 2.12601, 0, 0, 0, 1, 1,
0.5016949, -0.7582858, -0.8551399, 0, 0, 0, 1, 1,
0.5019827, 1.639699, -0.7115223, 0, 0, 0, 1, 1,
0.5029293, -1.704998, 2.221303, 1, 1, 1, 1, 1,
0.5031466, -0.3030716, 1.378313, 1, 1, 1, 1, 1,
0.508113, -0.3060252, 1.045622, 1, 1, 1, 1, 1,
0.5106044, 0.1595967, 1.226491, 1, 1, 1, 1, 1,
0.517844, -0.3980566, 2.032647, 1, 1, 1, 1, 1,
0.5199785, 0.5979346, 0.5960925, 1, 1, 1, 1, 1,
0.5204027, 1.817126, 1.73181, 1, 1, 1, 1, 1,
0.520956, -0.7751772, 1.638699, 1, 1, 1, 1, 1,
0.5213301, -0.3421918, 1.000867, 1, 1, 1, 1, 1,
0.5248263, 1.888742, 0.2176774, 1, 1, 1, 1, 1,
0.5253356, -0.9358934, 1.849374, 1, 1, 1, 1, 1,
0.5278839, -0.05515188, 1.682589, 1, 1, 1, 1, 1,
0.5298693, 0.4985858, 1.069323, 1, 1, 1, 1, 1,
0.5306343, -0.2036673, 2.216976, 1, 1, 1, 1, 1,
0.5329748, 0.5154666, 0.4255697, 1, 1, 1, 1, 1,
0.5366672, -0.8569335, 1.380842, 0, 0, 1, 1, 1,
0.5381923, 1.774612, 1.823964, 1, 0, 0, 1, 1,
0.539456, -0.1970807, 4.749259, 1, 0, 0, 1, 1,
0.5408325, -0.5800152, 2.802626, 1, 0, 0, 1, 1,
0.5410421, -1.582124, 3.052804, 1, 0, 0, 1, 1,
0.5455137, 0.4364844, 1.841652, 1, 0, 0, 1, 1,
0.5476285, 0.3460988, -0.5546546, 0, 0, 0, 1, 1,
0.5496119, 0.2911363, 1.191168, 0, 0, 0, 1, 1,
0.5497512, 2.016159, 0.08314219, 0, 0, 0, 1, 1,
0.5504807, 0.6217569, 0.02132621, 0, 0, 0, 1, 1,
0.5512694, 2.292718, 1.004136, 0, 0, 0, 1, 1,
0.5517101, -0.3672875, 1.83611, 0, 0, 0, 1, 1,
0.5539648, 1.393083, -0.3777024, 0, 0, 0, 1, 1,
0.5549423, 1.152547, 0.5333077, 1, 1, 1, 1, 1,
0.5552593, 1.062571, -0.514863, 1, 1, 1, 1, 1,
0.558329, 0.7729258, 0.8741186, 1, 1, 1, 1, 1,
0.5680836, 1.655831, 2.102126, 1, 1, 1, 1, 1,
0.5693613, 0.1572784, 2.651482, 1, 1, 1, 1, 1,
0.5828876, 0.5140363, 1.258009, 1, 1, 1, 1, 1,
0.583119, -0.6763422, 3.047646, 1, 1, 1, 1, 1,
0.5846483, -0.2642731, 3.462058, 1, 1, 1, 1, 1,
0.5851263, 0.7741722, 0.4984863, 1, 1, 1, 1, 1,
0.5908456, 0.3549243, 0.2217937, 1, 1, 1, 1, 1,
0.5941837, 0.5452433, 0.9862792, 1, 1, 1, 1, 1,
0.6016217, -0.267576, 2.999824, 1, 1, 1, 1, 1,
0.6046279, 0.4628146, 1.255019, 1, 1, 1, 1, 1,
0.6048717, 0.7847455, -0.9450262, 1, 1, 1, 1, 1,
0.6052546, -1.289134, 2.4159, 1, 1, 1, 1, 1,
0.6101663, 1.775827, 0.216894, 0, 0, 1, 1, 1,
0.611215, 0.9619057, 2.166286, 1, 0, 0, 1, 1,
0.6114143, -0.2806887, 1.026046, 1, 0, 0, 1, 1,
0.6162085, -0.60357, 4.199419, 1, 0, 0, 1, 1,
0.6223697, -1.333984, 3.416929, 1, 0, 0, 1, 1,
0.6232584, -0.4426398, 2.86846, 1, 0, 0, 1, 1,
0.6305937, 0.6025051, 1.131553, 0, 0, 0, 1, 1,
0.6319504, -2.157449, 2.593381, 0, 0, 0, 1, 1,
0.6373503, 1.287944, 0.5331709, 0, 0, 0, 1, 1,
0.637753, 3.133395, 1.131653, 0, 0, 0, 1, 1,
0.6476864, -1.296672, 2.566182, 0, 0, 0, 1, 1,
0.6529434, -2.15113, 3.475564, 0, 0, 0, 1, 1,
0.6536375, -0.01782968, 3.296746, 0, 0, 0, 1, 1,
0.6548449, -0.9700604, 3.576011, 1, 1, 1, 1, 1,
0.6568623, -1.431724, 3.844059, 1, 1, 1, 1, 1,
0.6660486, -1.652332, 3.625577, 1, 1, 1, 1, 1,
0.6672949, -0.02645893, 0.6890394, 1, 1, 1, 1, 1,
0.6759856, 0.6478312, 1.709032, 1, 1, 1, 1, 1,
0.6817233, 0.2035078, -0.4116647, 1, 1, 1, 1, 1,
0.6826701, -0.1688966, 2.027159, 1, 1, 1, 1, 1,
0.6832743, 0.8892724, -0.04791305, 1, 1, 1, 1, 1,
0.6960351, -0.1580039, 2.480248, 1, 1, 1, 1, 1,
0.7039565, -1.311063, 4.310829, 1, 1, 1, 1, 1,
0.7043604, -0.2584884, 1.401381, 1, 1, 1, 1, 1,
0.7070157, 1.522711, 0.02800714, 1, 1, 1, 1, 1,
0.7119669, -0.9570718, -0.3369868, 1, 1, 1, 1, 1,
0.7120836, 0.783514, 0.6872523, 1, 1, 1, 1, 1,
0.7153231, 1.039339, 1.805549, 1, 1, 1, 1, 1,
0.7226187, 1.676699, 0.1421643, 0, 0, 1, 1, 1,
0.7388293, 0.6062555, 0.3353159, 1, 0, 0, 1, 1,
0.7393193, 0.04379377, 1.826902, 1, 0, 0, 1, 1,
0.7411194, -1.312977, 3.145825, 1, 0, 0, 1, 1,
0.742443, 0.6435578, -0.544039, 1, 0, 0, 1, 1,
0.7431384, -0.4501333, 2.437788, 1, 0, 0, 1, 1,
0.743453, 0.5511661, 1.747668, 0, 0, 0, 1, 1,
0.7434847, -0.8058652, 2.026356, 0, 0, 0, 1, 1,
0.7445819, -0.5187786, 2.071378, 0, 0, 0, 1, 1,
0.7453365, 0.3109695, 1.33656, 0, 0, 0, 1, 1,
0.7550426, -1.387616, 2.349536, 0, 0, 0, 1, 1,
0.7558149, 0.2975268, 0.6339657, 0, 0, 0, 1, 1,
0.7578228, 0.4913949, 0.1907577, 0, 0, 0, 1, 1,
0.7582617, 0.7868137, 1.005768, 1, 1, 1, 1, 1,
0.7599671, -1.002617, 2.450732, 1, 1, 1, 1, 1,
0.7622444, -0.09013772, 0.1775558, 1, 1, 1, 1, 1,
0.7635475, 1.221925, -0.09848208, 1, 1, 1, 1, 1,
0.7659241, -1.420621, 1.807533, 1, 1, 1, 1, 1,
0.771598, -0.6583103, 1.713145, 1, 1, 1, 1, 1,
0.7739786, 0.2670828, 0.1044438, 1, 1, 1, 1, 1,
0.774362, 0.5366673, 0.8261549, 1, 1, 1, 1, 1,
0.7760835, 1.449166, 0.8944088, 1, 1, 1, 1, 1,
0.7761278, -0.7092871, 0.2938358, 1, 1, 1, 1, 1,
0.7767743, 0.9294319, 1.406419, 1, 1, 1, 1, 1,
0.779158, 0.4660906, 0.1315102, 1, 1, 1, 1, 1,
0.7817132, -0.2218016, 1.4321, 1, 1, 1, 1, 1,
0.7828333, -1.155818, 1.724281, 1, 1, 1, 1, 1,
0.7861503, -0.08049491, 2.020389, 1, 1, 1, 1, 1,
0.7874036, 0.5790245, 1.395462, 0, 0, 1, 1, 1,
0.7888939, 0.5701315, 1.161603, 1, 0, 0, 1, 1,
0.7901753, 0.1629797, -0.3292241, 1, 0, 0, 1, 1,
0.7952547, 0.2045879, 1.968364, 1, 0, 0, 1, 1,
0.7994998, -0.01134044, 1.978847, 1, 0, 0, 1, 1,
0.8024989, 1.63373, 0.2526565, 1, 0, 0, 1, 1,
0.8032006, 0.8325101, -0.1861155, 0, 0, 0, 1, 1,
0.806418, -1.233786, 2.682605, 0, 0, 0, 1, 1,
0.8075935, -1.370646, 3.74083, 0, 0, 0, 1, 1,
0.8211434, -1.318321, 1.249085, 0, 0, 0, 1, 1,
0.8295016, -1.806011, 4.623231, 0, 0, 0, 1, 1,
0.8399863, -0.1489277, 2.297886, 0, 0, 0, 1, 1,
0.8410978, 0.1023527, 2.051387, 0, 0, 0, 1, 1,
0.8505411, -0.2904509, 2.267059, 1, 1, 1, 1, 1,
0.8510999, 0.3055365, -0.1351982, 1, 1, 1, 1, 1,
0.8561556, 0.6993578, 0.6333403, 1, 1, 1, 1, 1,
0.868722, 2.055624, 0.439314, 1, 1, 1, 1, 1,
0.870105, 0.4686154, 1.492463, 1, 1, 1, 1, 1,
0.8787963, -0.2481854, 2.134209, 1, 1, 1, 1, 1,
0.8806974, -0.6401139, 2.131187, 1, 1, 1, 1, 1,
0.8859667, -0.9626338, 0.4223955, 1, 1, 1, 1, 1,
0.8865924, 0.461132, 2.105921, 1, 1, 1, 1, 1,
0.8879944, 1.495957, 0.2559178, 1, 1, 1, 1, 1,
0.8921527, 0.1490417, 1.916496, 1, 1, 1, 1, 1,
0.892399, 0.3975962, 0.6895412, 1, 1, 1, 1, 1,
0.8933161, -1.740371, 2.334028, 1, 1, 1, 1, 1,
0.89644, -1.20575, 3.203049, 1, 1, 1, 1, 1,
0.8987404, 0.06419569, 1.391559, 1, 1, 1, 1, 1,
0.9009342, -0.04383079, 2.132671, 0, 0, 1, 1, 1,
0.9017768, 0.274996, 2.239286, 1, 0, 0, 1, 1,
0.9045094, 0.560784, -0.2373663, 1, 0, 0, 1, 1,
0.904586, -0.1485399, 1.447259, 1, 0, 0, 1, 1,
0.9063673, 1.98052, 0.2758065, 1, 0, 0, 1, 1,
0.9104503, 1.367789, -0.7912272, 1, 0, 0, 1, 1,
0.9149342, -0.6994253, 2.232671, 0, 0, 0, 1, 1,
0.9154954, 0.8231083, -0.6595331, 0, 0, 0, 1, 1,
0.9169216, 1.503641, -1.85402, 0, 0, 0, 1, 1,
0.9173958, 1.605078, 0.9211873, 0, 0, 0, 1, 1,
0.9175575, -0.6297542, 0.7981501, 0, 0, 0, 1, 1,
0.9199345, 3.26076, -0.8538481, 0, 0, 0, 1, 1,
0.9246942, -1.268551, 2.389046, 0, 0, 0, 1, 1,
0.928834, -0.7637548, 0.9469767, 1, 1, 1, 1, 1,
0.9360873, -0.7672594, 2.603493, 1, 1, 1, 1, 1,
0.939292, -2.558157, 3.485158, 1, 1, 1, 1, 1,
0.940138, 1.166486, 2.466209, 1, 1, 1, 1, 1,
0.943046, 0.1006027, 2.629471, 1, 1, 1, 1, 1,
0.9433765, -1.082436, 4.122361, 1, 1, 1, 1, 1,
0.9439837, 0.4388599, 0.8320233, 1, 1, 1, 1, 1,
0.9480163, 0.3759024, -0.5289304, 1, 1, 1, 1, 1,
0.9618933, 0.4438629, 2.559493, 1, 1, 1, 1, 1,
0.9645805, -1.235956, 4.610557, 1, 1, 1, 1, 1,
0.9653827, 0.1650738, 1.194708, 1, 1, 1, 1, 1,
0.9685071, 1.017773, 1.202971, 1, 1, 1, 1, 1,
0.9712557, -0.9719133, 3.542572, 1, 1, 1, 1, 1,
0.9771526, -2.004527, 3.687072, 1, 1, 1, 1, 1,
0.9945656, -0.5763054, 2.030149, 1, 1, 1, 1, 1,
0.9960852, -0.2696245, 2.894799, 0, 0, 1, 1, 1,
1.000265, 1.127643, -0.6682894, 1, 0, 0, 1, 1,
1.000465, -0.2183009, 0.6988748, 1, 0, 0, 1, 1,
1.008714, -0.5138125, 1.702245, 1, 0, 0, 1, 1,
1.009302, -0.9377055, 2.39956, 1, 0, 0, 1, 1,
1.0158, -2.704355, 4.114525, 1, 0, 0, 1, 1,
1.016691, -0.2483093, 0.9227016, 0, 0, 0, 1, 1,
1.024538, 2.077894, 1.411295, 0, 0, 0, 1, 1,
1.025972, 0.7415388, 0.911195, 0, 0, 0, 1, 1,
1.029264, 0.2394772, 0.2194066, 0, 0, 0, 1, 1,
1.037278, -1.110134, 1.115525, 0, 0, 0, 1, 1,
1.044618, 1.991646, 2.493294, 0, 0, 0, 1, 1,
1.046623, 0.5077755, -0.1401689, 0, 0, 0, 1, 1,
1.051759, -0.4123152, 4.715151, 1, 1, 1, 1, 1,
1.05519, -1.830373, 3.723791, 1, 1, 1, 1, 1,
1.057181, -0.2641197, 2.134111, 1, 1, 1, 1, 1,
1.057562, 0.2055955, 1.712967, 1, 1, 1, 1, 1,
1.063551, -2.238495, 0.9935899, 1, 1, 1, 1, 1,
1.063911, -1.344613, 3.701507, 1, 1, 1, 1, 1,
1.068956, 0.4054965, -0.2400177, 1, 1, 1, 1, 1,
1.071396, 0.9267426, 0.445989, 1, 1, 1, 1, 1,
1.071885, -1.281026, 3.041766, 1, 1, 1, 1, 1,
1.08111, -0.4574774, 3.390024, 1, 1, 1, 1, 1,
1.085839, -1.480684, 1.409814, 1, 1, 1, 1, 1,
1.094102, -0.1666701, 1.43172, 1, 1, 1, 1, 1,
1.096327, -1.10924, 2.207383, 1, 1, 1, 1, 1,
1.101867, -1.423311, 3.102948, 1, 1, 1, 1, 1,
1.106568, 0.4711335, 1.163885, 1, 1, 1, 1, 1,
1.106918, 0.07546851, 2.274778, 0, 0, 1, 1, 1,
1.10986, -2.739079, 2.609747, 1, 0, 0, 1, 1,
1.110568, -0.3603307, 0.7290382, 1, 0, 0, 1, 1,
1.115465, -0.006157373, 0.6679897, 1, 0, 0, 1, 1,
1.117298, -0.775518, 3.646229, 1, 0, 0, 1, 1,
1.120073, 2.698147, 0.9022816, 1, 0, 0, 1, 1,
1.125671, -1.568996, 3.464693, 0, 0, 0, 1, 1,
1.12722, 1.042954, 0.1263221, 0, 0, 0, 1, 1,
1.128835, -0.5819475, 0.9897865, 0, 0, 0, 1, 1,
1.132011, 0.7205862, 1.085432, 0, 0, 0, 1, 1,
1.132868, 1.552281, -0.3425767, 0, 0, 0, 1, 1,
1.136254, -0.4473877, 2.191649, 0, 0, 0, 1, 1,
1.137264, -0.4648423, 0.5542096, 0, 0, 0, 1, 1,
1.139383, 0.8563681, 2.974138, 1, 1, 1, 1, 1,
1.140701, -0.9362462, 1.879043, 1, 1, 1, 1, 1,
1.14251, 0.3361956, 0.5151621, 1, 1, 1, 1, 1,
1.142736, 0.9779258, 0.661649, 1, 1, 1, 1, 1,
1.143116, 0.2624452, 2.112602, 1, 1, 1, 1, 1,
1.156881, 0.7240655, -0.07042997, 1, 1, 1, 1, 1,
1.168649, 0.3141743, 0.1469239, 1, 1, 1, 1, 1,
1.175507, 0.4319645, 2.500536, 1, 1, 1, 1, 1,
1.188319, -1.056015, 3.66253, 1, 1, 1, 1, 1,
1.189043, -1.544, 0.9307063, 1, 1, 1, 1, 1,
1.190143, -0.8897907, 3.173234, 1, 1, 1, 1, 1,
1.190602, -0.2247692, 2.014421, 1, 1, 1, 1, 1,
1.191204, -0.1569897, 1.159214, 1, 1, 1, 1, 1,
1.192377, 0.1272649, 1.205304, 1, 1, 1, 1, 1,
1.199674, -0.9727186, 3.490345, 1, 1, 1, 1, 1,
1.202498, 0.9325754, 2.402871, 0, 0, 1, 1, 1,
1.203258, -1.026095, 1.291831, 1, 0, 0, 1, 1,
1.210557, -0.9596858, 4.363289, 1, 0, 0, 1, 1,
1.210857, 2.354978, -0.1841542, 1, 0, 0, 1, 1,
1.215698, 0.03941847, 1.601239, 1, 0, 0, 1, 1,
1.216546, -0.9702189, 2.110886, 1, 0, 0, 1, 1,
1.218916, -1.248359, 1.436367, 0, 0, 0, 1, 1,
1.235757, 0.6571897, -0.5299686, 0, 0, 0, 1, 1,
1.236839, -0.2172788, 1.97558, 0, 0, 0, 1, 1,
1.241516, 1.899091, 1.940996, 0, 0, 0, 1, 1,
1.24562, 1.121105, 1.351285, 0, 0, 0, 1, 1,
1.252492, 2.592796, 0.69323, 0, 0, 0, 1, 1,
1.253669, -0.5599697, -0.1398894, 0, 0, 0, 1, 1,
1.253982, 0.9441037, 0.1184255, 1, 1, 1, 1, 1,
1.254183, 0.02208578, 2.435543, 1, 1, 1, 1, 1,
1.255491, -0.3440049, 2.495393, 1, 1, 1, 1, 1,
1.275514, 0.3899725, -0.411267, 1, 1, 1, 1, 1,
1.284832, 0.00727816, 1.465638, 1, 1, 1, 1, 1,
1.291033, 0.1240621, 1.753747, 1, 1, 1, 1, 1,
1.306892, -0.2847238, 0.2829285, 1, 1, 1, 1, 1,
1.30767, -0.289781, 1.337464, 1, 1, 1, 1, 1,
1.314484, 0.4330769, 2.106562, 1, 1, 1, 1, 1,
1.319567, -1.496585, 0.7225181, 1, 1, 1, 1, 1,
1.33094, -1.0769, 2.942039, 1, 1, 1, 1, 1,
1.348782, 0.6165531, 1.397181, 1, 1, 1, 1, 1,
1.349776, -1.34522, 2.712512, 1, 1, 1, 1, 1,
1.352308, 1.615519, 1.877389, 1, 1, 1, 1, 1,
1.354537, 2.361491, -0.6360017, 1, 1, 1, 1, 1,
1.356373, 0.4952669, 1.689392, 0, 0, 1, 1, 1,
1.360707, -0.3537685, 1.081635, 1, 0, 0, 1, 1,
1.368092, 0.337695, 2.979448, 1, 0, 0, 1, 1,
1.37136, -1.082019, 4.897815, 1, 0, 0, 1, 1,
1.374938, -1.454821, 3.209763, 1, 0, 0, 1, 1,
1.379425, -0.6364491, 1.692081, 1, 0, 0, 1, 1,
1.383333, 0.2101063, 2.253031, 0, 0, 0, 1, 1,
1.384839, 1.944508, 1.727674, 0, 0, 0, 1, 1,
1.391592, 0.2140705, 0.937196, 0, 0, 0, 1, 1,
1.407757, 1.199252, -0.2642851, 0, 0, 0, 1, 1,
1.420093, 0.2265336, 3.571856, 0, 0, 0, 1, 1,
1.421196, 0.8306459, 1.20595, 0, 0, 0, 1, 1,
1.425668, 1.204057, -0.01534116, 0, 0, 0, 1, 1,
1.433679, 1.5042, 2.549935, 1, 1, 1, 1, 1,
1.437169, 1.255119, 0.9914097, 1, 1, 1, 1, 1,
1.44024, -0.4040014, 1.694729, 1, 1, 1, 1, 1,
1.446527, 0.05682157, 3.663539, 1, 1, 1, 1, 1,
1.453078, 0.8225359, 0.8364331, 1, 1, 1, 1, 1,
1.453288, 0.2555636, 3.090203, 1, 1, 1, 1, 1,
1.456093, -0.2067159, 0.652168, 1, 1, 1, 1, 1,
1.457614, 0.8546205, 1.105021, 1, 1, 1, 1, 1,
1.4609, 0.683138, 1.676815, 1, 1, 1, 1, 1,
1.465692, 0.2463206, 1.784783, 1, 1, 1, 1, 1,
1.476184, 1.003002, 0.1870747, 1, 1, 1, 1, 1,
1.476759, -0.3755583, 1.023279, 1, 1, 1, 1, 1,
1.487388, 2.066259, 0.64147, 1, 1, 1, 1, 1,
1.491631, -0.5132881, 1.11219, 1, 1, 1, 1, 1,
1.49642, -0.5584064, 3.020006, 1, 1, 1, 1, 1,
1.51237, 0.05472751, 0.9347454, 0, 0, 1, 1, 1,
1.520577, -2.222944, 1.87136, 1, 0, 0, 1, 1,
1.534488, -0.7442223, 1.287793, 1, 0, 0, 1, 1,
1.537809, -1.453983, 3.721351, 1, 0, 0, 1, 1,
1.550231, 0.03808044, 3.988651, 1, 0, 0, 1, 1,
1.556136, -1.001454, 3.786001, 1, 0, 0, 1, 1,
1.559099, -0.408406, 2.183901, 0, 0, 0, 1, 1,
1.561044, -0.2598919, 2.398648, 0, 0, 0, 1, 1,
1.561169, -0.5248364, 1.89631, 0, 0, 0, 1, 1,
1.585497, -0.3705021, 1.282943, 0, 0, 0, 1, 1,
1.585965, -2.668008, 4.468564, 0, 0, 0, 1, 1,
1.586109, 1.120946, 0.2379233, 0, 0, 0, 1, 1,
1.686443, 1.656202, 2.361888, 0, 0, 0, 1, 1,
1.69536, 0.5672077, 1.68464, 1, 1, 1, 1, 1,
1.72521, -1.206468, 1.377733, 1, 1, 1, 1, 1,
1.757132, 0.1883743, 2.141725, 1, 1, 1, 1, 1,
1.768801, -1.113165, 2.814395, 1, 1, 1, 1, 1,
1.781191, -0.2299701, 1.77956, 1, 1, 1, 1, 1,
1.793084, 1.918279, -0.2445809, 1, 1, 1, 1, 1,
1.809014, 0.1822887, 1.780318, 1, 1, 1, 1, 1,
1.818609, 1.651561, 2.901346, 1, 1, 1, 1, 1,
1.838493, 0.2281299, 3.760687, 1, 1, 1, 1, 1,
1.847977, 0.05799594, 1.141938, 1, 1, 1, 1, 1,
1.849191, -2.067394, 2.676875, 1, 1, 1, 1, 1,
1.871911, -1.508516, 2.594067, 1, 1, 1, 1, 1,
1.885974, -0.7107645, 4.788096, 1, 1, 1, 1, 1,
1.888721, 0.9443545, 0.6872673, 1, 1, 1, 1, 1,
1.923294, -0.2814239, 1.976403, 1, 1, 1, 1, 1,
1.924097, 0.299944, 1.15344, 0, 0, 1, 1, 1,
1.926092, 0.4823332, -0.9474086, 1, 0, 0, 1, 1,
1.961245, -0.4893657, 1.628198, 1, 0, 0, 1, 1,
2.008663, 1.117829, 2.484138, 1, 0, 0, 1, 1,
2.016226, 0.9296237, 1.476632, 1, 0, 0, 1, 1,
2.01715, 0.3043201, 0.8946013, 1, 0, 0, 1, 1,
2.035235, -0.1151013, 0.4486753, 0, 0, 0, 1, 1,
2.072763, 1.580405, 0.7423102, 0, 0, 0, 1, 1,
2.079555, 1.682315, 2.194564, 0, 0, 0, 1, 1,
2.09851, -0.4074992, 2.384817, 0, 0, 0, 1, 1,
2.12398, 1.284178, 2.899974, 0, 0, 0, 1, 1,
2.127179, -0.7622722, 2.543301, 0, 0, 0, 1, 1,
2.170288, 0.2354154, 1.426495, 0, 0, 0, 1, 1,
2.178677, 0.8778435, -0.1993131, 1, 1, 1, 1, 1,
2.252376, -1.197811, 2.553217, 1, 1, 1, 1, 1,
2.254443, -0.4533882, 2.006514, 1, 1, 1, 1, 1,
2.289484, -0.2495999, 1.461531, 1, 1, 1, 1, 1,
2.423949, 0.4244841, 1.387344, 1, 1, 1, 1, 1,
2.519298, 0.004561691, 1.339327, 1, 1, 1, 1, 1,
2.569899, -0.7594991, 1.416053, 1, 1, 1, 1, 1
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
var radius = 9.091219;
var distance = 31.93252;
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
mvMatrix.translate( 0.2319341, 0.02526832, -0.2357192 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.93252);
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
