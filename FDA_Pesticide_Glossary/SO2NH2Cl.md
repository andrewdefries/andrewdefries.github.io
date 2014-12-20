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
-2.895081, -1.160604, -2.190049, 1, 0, 0, 1,
-2.775136, 0.725493, -1.286837, 1, 0.007843138, 0, 1,
-2.694078, 0.7293065, 0.5591194, 1, 0.01176471, 0, 1,
-2.505892, -1.053824, -1.958687, 1, 0.01960784, 0, 1,
-2.388072, 1.521763, 0.9961752, 1, 0.02352941, 0, 1,
-2.329075, -0.3954062, -0.2248393, 1, 0.03137255, 0, 1,
-2.315194, -1.407208, -0.9009321, 1, 0.03529412, 0, 1,
-2.302196, -1.982471, -1.89013, 1, 0.04313726, 0, 1,
-2.225825, -0.2214418, -1.873697, 1, 0.04705882, 0, 1,
-2.223074, 0.7527568, -1.200559, 1, 0.05490196, 0, 1,
-2.171219, 1.355187, -0.7272763, 1, 0.05882353, 0, 1,
-2.040158, -0.356397, -1.802861, 1, 0.06666667, 0, 1,
-2.027802, -0.917327, -3.136311, 1, 0.07058824, 0, 1,
-2.016608, -0.1949693, -1.820869, 1, 0.07843138, 0, 1,
-1.987885, -1.854681, -3.598876, 1, 0.08235294, 0, 1,
-1.97136, -0.3700336, -1.70665, 1, 0.09019608, 0, 1,
-1.942087, -1.559285, -2.480217, 1, 0.09411765, 0, 1,
-1.936117, 0.156293, -1.06463, 1, 0.1019608, 0, 1,
-1.924142, 0.8248085, -0.9356458, 1, 0.1098039, 0, 1,
-1.904604, -1.346912, -1.956502, 1, 0.1137255, 0, 1,
-1.887053, 0.3699863, -0.4057271, 1, 0.1215686, 0, 1,
-1.880498, 0.06098742, -0.9913955, 1, 0.1254902, 0, 1,
-1.855116, -0.05979035, -1.012935, 1, 0.1333333, 0, 1,
-1.828189, 0.6254821, -2.156798, 1, 0.1372549, 0, 1,
-1.824109, 0.6892394, -1.214976, 1, 0.145098, 0, 1,
-1.823993, 1.725976, -1.83789, 1, 0.1490196, 0, 1,
-1.819592, -0.7609484, -2.78247, 1, 0.1568628, 0, 1,
-1.805243, 1.372135, -1.231545, 1, 0.1607843, 0, 1,
-1.798229, -2.08625, -2.793589, 1, 0.1686275, 0, 1,
-1.794791, 1.332891, -1.38919, 1, 0.172549, 0, 1,
-1.790309, -0.04378869, -1.950159, 1, 0.1803922, 0, 1,
-1.788209, -0.03631383, -2.217221, 1, 0.1843137, 0, 1,
-1.783747, -1.174592, -0.1747839, 1, 0.1921569, 0, 1,
-1.77393, 1.319071, -0.8323461, 1, 0.1960784, 0, 1,
-1.751776, -1.068803, -1.5524, 1, 0.2039216, 0, 1,
-1.739756, -0.2390567, 0.3875575, 1, 0.2117647, 0, 1,
-1.722785, 0.8071446, -0.7928693, 1, 0.2156863, 0, 1,
-1.705422, -0.5277556, -2.894305, 1, 0.2235294, 0, 1,
-1.700299, -1.061682, -2.41315, 1, 0.227451, 0, 1,
-1.699745, -0.7448662, -0.5518921, 1, 0.2352941, 0, 1,
-1.698923, 0.202345, -0.5961162, 1, 0.2392157, 0, 1,
-1.6724, 2.129787, -0.2082039, 1, 0.2470588, 0, 1,
-1.670073, -0.5064299, -2.795225, 1, 0.2509804, 0, 1,
-1.65298, -1.670746, -3.543014, 1, 0.2588235, 0, 1,
-1.652214, -1.161571, -3.163738, 1, 0.2627451, 0, 1,
-1.643188, 0.5090868, -1.529668, 1, 0.2705882, 0, 1,
-1.64245, 0.8860335, -1.259649, 1, 0.2745098, 0, 1,
-1.637912, 1.19101, -0.5064356, 1, 0.282353, 0, 1,
-1.62359, 1.26825, -1.642854, 1, 0.2862745, 0, 1,
-1.62147, -0.272983, -1.349569, 1, 0.2941177, 0, 1,
-1.616901, -0.1734737, -0.9227358, 1, 0.3019608, 0, 1,
-1.6127, 1.986681, 0.07481597, 1, 0.3058824, 0, 1,
-1.606519, -0.6532086, -1.593873, 1, 0.3137255, 0, 1,
-1.602234, 2.087271, -0.3869442, 1, 0.3176471, 0, 1,
-1.591659, 0.4449347, -1.280334, 1, 0.3254902, 0, 1,
-1.590967, 1.776432, 0.132009, 1, 0.3294118, 0, 1,
-1.589421, -0.5216307, -0.5975843, 1, 0.3372549, 0, 1,
-1.58272, 1.508189, -0.3026083, 1, 0.3411765, 0, 1,
-1.574739, 1.411736, -0.9690813, 1, 0.3490196, 0, 1,
-1.563326, 0.4047545, -0.2245522, 1, 0.3529412, 0, 1,
-1.562851, 0.8169513, -1.000873, 1, 0.3607843, 0, 1,
-1.551154, -0.873787, -2.861527, 1, 0.3647059, 0, 1,
-1.550335, 0.6241126, 0.1915857, 1, 0.372549, 0, 1,
-1.54881, 0.8412985, -2.214162, 1, 0.3764706, 0, 1,
-1.540716, -0.6057345, -1.038046, 1, 0.3843137, 0, 1,
-1.523918, 0.2092961, -1.013652, 1, 0.3882353, 0, 1,
-1.512394, -0.05767028, -2.119958, 1, 0.3960784, 0, 1,
-1.509281, 0.2431028, -1.410917, 1, 0.4039216, 0, 1,
-1.499373, 0.8363334, -2.580072, 1, 0.4078431, 0, 1,
-1.495853, 0.2690569, -2.936488, 1, 0.4156863, 0, 1,
-1.489075, -1.12795, -2.074002, 1, 0.4196078, 0, 1,
-1.484283, 2.058643, 0.4128164, 1, 0.427451, 0, 1,
-1.474129, -2.212852, -2.177236, 1, 0.4313726, 0, 1,
-1.469073, -0.4004481, -1.354616, 1, 0.4392157, 0, 1,
-1.468574, 0.5810367, -2.698672, 1, 0.4431373, 0, 1,
-1.458686, -0.5261107, -0.9226959, 1, 0.4509804, 0, 1,
-1.448797, -1.479079, -0.486567, 1, 0.454902, 0, 1,
-1.435573, -0.3613925, -1.563729, 1, 0.4627451, 0, 1,
-1.434223, -1.736417, -4.518893, 1, 0.4666667, 0, 1,
-1.43272, -0.7288967, -0.6814103, 1, 0.4745098, 0, 1,
-1.431204, -0.45807, -2.524835, 1, 0.4784314, 0, 1,
-1.430699, -0.7006623, -0.8102669, 1, 0.4862745, 0, 1,
-1.421311, -1.670572, -2.749646, 1, 0.4901961, 0, 1,
-1.396742, -1.227442, -2.074976, 1, 0.4980392, 0, 1,
-1.393628, -0.3774048, -3.241288, 1, 0.5058824, 0, 1,
-1.393091, -0.7061176, -0.9466277, 1, 0.509804, 0, 1,
-1.3906, -0.008939059, -0.03826981, 1, 0.5176471, 0, 1,
-1.388304, -0.5035364, -1.222901, 1, 0.5215687, 0, 1,
-1.387057, 2.683308, -0.5604466, 1, 0.5294118, 0, 1,
-1.380495, -2.0276, -3.374356, 1, 0.5333334, 0, 1,
-1.379649, -1.442706, -3.2147, 1, 0.5411765, 0, 1,
-1.367323, 0.2306553, -2.643994, 1, 0.5450981, 0, 1,
-1.363138, 0.6682261, -1.375747, 1, 0.5529412, 0, 1,
-1.357853, 0.9708472, -1.257663, 1, 0.5568628, 0, 1,
-1.355278, -0.8495574, -2.9551, 1, 0.5647059, 0, 1,
-1.355093, -0.06301749, -1.394059, 1, 0.5686275, 0, 1,
-1.350161, -0.3393999, -2.088352, 1, 0.5764706, 0, 1,
-1.342904, -2.132502, -4.072794, 1, 0.5803922, 0, 1,
-1.330299, 1.050462, -1.423856, 1, 0.5882353, 0, 1,
-1.324335, 0.5461558, -0.05319291, 1, 0.5921569, 0, 1,
-1.324324, 0.8756079, -1.007877, 1, 0.6, 0, 1,
-1.323567, 0.4693238, -1.815698, 1, 0.6078432, 0, 1,
-1.308469, 0.7007852, -1.958148, 1, 0.6117647, 0, 1,
-1.289459, -0.2372342, -2.093278, 1, 0.6196079, 0, 1,
-1.289439, 0.09631053, 0.8450235, 1, 0.6235294, 0, 1,
-1.288833, -0.6306509, -0.9152198, 1, 0.6313726, 0, 1,
-1.286235, -0.6672964, -1.059241, 1, 0.6352941, 0, 1,
-1.28281, -0.6555064, -1.407177, 1, 0.6431373, 0, 1,
-1.271411, 1.151745, -0.7686735, 1, 0.6470588, 0, 1,
-1.267345, 1.211691, -1.51826, 1, 0.654902, 0, 1,
-1.265452, -0.3625494, -1.504846, 1, 0.6588235, 0, 1,
-1.260183, 1.110387, -0.07321631, 1, 0.6666667, 0, 1,
-1.25714, 0.008449734, -1.773584, 1, 0.6705883, 0, 1,
-1.231885, -1.98811, -1.48385, 1, 0.6784314, 0, 1,
-1.222072, 1.30765, 0.214937, 1, 0.682353, 0, 1,
-1.220716, 0.1867443, -1.488544, 1, 0.6901961, 0, 1,
-1.218222, -2.010542, -1.875549, 1, 0.6941177, 0, 1,
-1.213, -0.7967225, -1.887879, 1, 0.7019608, 0, 1,
-1.210273, -1.602241, -1.758191, 1, 0.7098039, 0, 1,
-1.203964, -0.2408023, -0.6474399, 1, 0.7137255, 0, 1,
-1.199674, -2.100489, -1.830105, 1, 0.7215686, 0, 1,
-1.198181, 0.1854916, -1.731411, 1, 0.7254902, 0, 1,
-1.19576, -0.01626366, -2.749197, 1, 0.7333333, 0, 1,
-1.190924, 0.4857413, -0.4792119, 1, 0.7372549, 0, 1,
-1.190095, 2.091605, 0.9577867, 1, 0.7450981, 0, 1,
-1.188254, 0.4201989, -2.043699, 1, 0.7490196, 0, 1,
-1.18769, 0.5379683, -1.149188, 1, 0.7568628, 0, 1,
-1.18073, 0.3926977, -0.02336756, 1, 0.7607843, 0, 1,
-1.179904, 0.9634321, -0.2805838, 1, 0.7686275, 0, 1,
-1.175619, -0.6407888, -1.18791, 1, 0.772549, 0, 1,
-1.174373, 0.2261795, -0.2818741, 1, 0.7803922, 0, 1,
-1.172423, -0.4642185, -0.4358135, 1, 0.7843137, 0, 1,
-1.167694, 1.220734, -0.4904888, 1, 0.7921569, 0, 1,
-1.158243, 0.5412851, -0.4808946, 1, 0.7960784, 0, 1,
-1.147125, -0.0456282, -1.167531, 1, 0.8039216, 0, 1,
-1.146486, -0.4806719, -1.615814, 1, 0.8117647, 0, 1,
-1.143665, 0.658597, 0.622228, 1, 0.8156863, 0, 1,
-1.125112, -0.2807974, -3.058341, 1, 0.8235294, 0, 1,
-1.111376, -0.4763907, -0.9201577, 1, 0.827451, 0, 1,
-1.107158, -0.4225736, -1.758617, 1, 0.8352941, 0, 1,
-1.106057, 0.1373949, -2.700865, 1, 0.8392157, 0, 1,
-1.098959, 1.408386, -0.3469577, 1, 0.8470588, 0, 1,
-1.084771, -0.7777693, -2.421391, 1, 0.8509804, 0, 1,
-1.06191, -2.450873, -4.851022, 1, 0.8588235, 0, 1,
-1.059157, 1.180208, -1.534601, 1, 0.8627451, 0, 1,
-1.05771, 1.261279, 0.5815976, 1, 0.8705882, 0, 1,
-1.057536, -0.2108697, -1.200546, 1, 0.8745098, 0, 1,
-1.055427, -0.4968082, -3.403104, 1, 0.8823529, 0, 1,
-1.052305, -0.02505726, -2.84543, 1, 0.8862745, 0, 1,
-1.050547, 1.640489, -0.4222219, 1, 0.8941177, 0, 1,
-1.037788, -1.737849, -2.074337, 1, 0.8980392, 0, 1,
-1.03104, 0.7522205, 0.8339955, 1, 0.9058824, 0, 1,
-1.028191, 0.4304301, 0.00695518, 1, 0.9137255, 0, 1,
-1.027745, -1.278846, -2.999296, 1, 0.9176471, 0, 1,
-1.025091, 0.3418663, -1.837897, 1, 0.9254902, 0, 1,
-1.024632, 1.720592, -1.315687, 1, 0.9294118, 0, 1,
-1.020185, 1.227433, -0.6756543, 1, 0.9372549, 0, 1,
-1.016297, -0.4352824, -2.614846, 1, 0.9411765, 0, 1,
-1.013812, -1.037827, -3.101378, 1, 0.9490196, 0, 1,
-1.0125, 0.0874932, -2.217705, 1, 0.9529412, 0, 1,
-1.010384, -0.2494648, -2.679613, 1, 0.9607843, 0, 1,
-1.0082, -1.577741, -3.438742, 1, 0.9647059, 0, 1,
-1.003531, 1.293268, -1.061816, 1, 0.972549, 0, 1,
-1.002263, 2.213049, -0.6141512, 1, 0.9764706, 0, 1,
-0.990829, -0.1791132, -0.7645867, 1, 0.9843137, 0, 1,
-0.9765676, 1.241974, 2.076327, 1, 0.9882353, 0, 1,
-0.9751269, 0.3859692, -1.648626, 1, 0.9960784, 0, 1,
-0.9735109, 0.1053134, -0.03019524, 0.9960784, 1, 0, 1,
-0.9669231, -0.8420701, -2.592652, 0.9921569, 1, 0, 1,
-0.9650522, 0.5534055, -0.8172443, 0.9843137, 1, 0, 1,
-0.9574763, 0.1567234, -0.7173414, 0.9803922, 1, 0, 1,
-0.9477494, 0.8311835, 0.09636471, 0.972549, 1, 0, 1,
-0.9474857, 1.066652, -0.4239776, 0.9686275, 1, 0, 1,
-0.9461991, -0.3143278, -1.042449, 0.9607843, 1, 0, 1,
-0.941366, -1.2611, -2.746659, 0.9568627, 1, 0, 1,
-0.9368253, 0.9529929, 0.437771, 0.9490196, 1, 0, 1,
-0.9260762, 0.2741676, -0.7656203, 0.945098, 1, 0, 1,
-0.9225521, 0.5211648, -1.427675, 0.9372549, 1, 0, 1,
-0.9182493, -0.09644006, -0.7312976, 0.9333333, 1, 0, 1,
-0.9159389, -1.188799, -2.197723, 0.9254902, 1, 0, 1,
-0.9149091, 0.2925247, -0.5485687, 0.9215686, 1, 0, 1,
-0.9118441, -2.313017, -1.914739, 0.9137255, 1, 0, 1,
-0.9079449, 1.903437, 1.898373, 0.9098039, 1, 0, 1,
-0.9063641, 0.1936232, -2.247223, 0.9019608, 1, 0, 1,
-0.9049731, -2.161554, -2.846993, 0.8941177, 1, 0, 1,
-0.8992181, -0.9452883, -3.632529, 0.8901961, 1, 0, 1,
-0.8891885, 1.00369, -1.264853, 0.8823529, 1, 0, 1,
-0.8842937, -0.08928806, -2.252275, 0.8784314, 1, 0, 1,
-0.8804489, 1.762725, -0.3337361, 0.8705882, 1, 0, 1,
-0.8796817, 0.1140101, -1.020145, 0.8666667, 1, 0, 1,
-0.8776438, -0.1369897, -1.548296, 0.8588235, 1, 0, 1,
-0.8753747, 0.8215781, -2.186779, 0.854902, 1, 0, 1,
-0.8555812, 1.455069, 0.7495607, 0.8470588, 1, 0, 1,
-0.8515603, 0.2478716, -1.968454, 0.8431373, 1, 0, 1,
-0.8513626, -0.908655, -1.127264, 0.8352941, 1, 0, 1,
-0.8503332, -0.3579735, -0.9538875, 0.8313726, 1, 0, 1,
-0.8395833, -0.4604851, -3.383927, 0.8235294, 1, 0, 1,
-0.8377072, -0.4549203, -0.4613656, 0.8196079, 1, 0, 1,
-0.8335124, -0.8295925, -1.613177, 0.8117647, 1, 0, 1,
-0.8278263, -0.5171444, -1.611751, 0.8078431, 1, 0, 1,
-0.8253915, 0.5936298, -0.7768217, 0.8, 1, 0, 1,
-0.8177919, -1.280866, -1.194345, 0.7921569, 1, 0, 1,
-0.8171606, 1.07357, -0.2039237, 0.7882353, 1, 0, 1,
-0.8153431, 0.996038, -1.757148, 0.7803922, 1, 0, 1,
-0.8147845, -1.22481, -2.991946, 0.7764706, 1, 0, 1,
-0.8143825, -0.8091357, -1.579329, 0.7686275, 1, 0, 1,
-0.8129325, -0.419129, -2.127325, 0.7647059, 1, 0, 1,
-0.8104941, -0.3780031, -2.597425, 0.7568628, 1, 0, 1,
-0.807756, 0.02515109, -1.159082, 0.7529412, 1, 0, 1,
-0.8055003, 0.04784786, -2.136736, 0.7450981, 1, 0, 1,
-0.8032923, 0.7075616, -0.02627356, 0.7411765, 1, 0, 1,
-0.7969586, 0.04464989, -0.223728, 0.7333333, 1, 0, 1,
-0.7921079, -0.363751, -2.419776, 0.7294118, 1, 0, 1,
-0.7911273, 2.526657, -0.6490377, 0.7215686, 1, 0, 1,
-0.7862027, 0.01687588, -1.332738, 0.7176471, 1, 0, 1,
-0.7846631, -1.185738, -2.407186, 0.7098039, 1, 0, 1,
-0.7837377, 0.4365672, -2.372125, 0.7058824, 1, 0, 1,
-0.7823154, -1.704944, -2.198538, 0.6980392, 1, 0, 1,
-0.7784076, -1.060804, -2.214115, 0.6901961, 1, 0, 1,
-0.7748567, 0.04584337, 0.1350899, 0.6862745, 1, 0, 1,
-0.7707078, 0.6002767, -2.936286, 0.6784314, 1, 0, 1,
-0.7677529, -1.103591, -2.361438, 0.6745098, 1, 0, 1,
-0.767745, 1.681953, -2.880011, 0.6666667, 1, 0, 1,
-0.7660093, -0.735107, -3.040165, 0.6627451, 1, 0, 1,
-0.7645765, -0.9411107, -2.604123, 0.654902, 1, 0, 1,
-0.764273, 0.5199594, -1.009465, 0.6509804, 1, 0, 1,
-0.7629554, -0.4048199, -4.390939, 0.6431373, 1, 0, 1,
-0.7615733, -1.160848, -4.024463, 0.6392157, 1, 0, 1,
-0.7549149, 1.515464, -1.481862, 0.6313726, 1, 0, 1,
-0.7545708, 0.87518, -1.443466, 0.627451, 1, 0, 1,
-0.7541822, -0.6014023, -3.644037, 0.6196079, 1, 0, 1,
-0.7531721, -0.1844859, -0.3659335, 0.6156863, 1, 0, 1,
-0.7477189, -0.7925491, -2.848944, 0.6078432, 1, 0, 1,
-0.7418218, -0.5239544, -2.680846, 0.6039216, 1, 0, 1,
-0.7405913, -0.8643132, -2.227407, 0.5960785, 1, 0, 1,
-0.7192078, 0.1055543, -1.476256, 0.5882353, 1, 0, 1,
-0.7179847, 0.1425306, -2.493213, 0.5843138, 1, 0, 1,
-0.7121512, -0.5771473, -2.898032, 0.5764706, 1, 0, 1,
-0.7096195, -1.509456, -2.24125, 0.572549, 1, 0, 1,
-0.7021847, -0.5035805, -3.731927, 0.5647059, 1, 0, 1,
-0.7002973, -0.875528, -3.537373, 0.5607843, 1, 0, 1,
-0.6982905, 0.002516028, -0.5804656, 0.5529412, 1, 0, 1,
-0.6943826, -0.2295079, -2.15728, 0.5490196, 1, 0, 1,
-0.6935261, 0.05285941, -1.935448, 0.5411765, 1, 0, 1,
-0.6934645, -0.6678063, -1.988475, 0.5372549, 1, 0, 1,
-0.6864914, -1.235172, -2.491331, 0.5294118, 1, 0, 1,
-0.6863996, -1.314815, -3.231372, 0.5254902, 1, 0, 1,
-0.684348, -1.966834, -4.37, 0.5176471, 1, 0, 1,
-0.6744982, 0.5357691, -1.479629, 0.5137255, 1, 0, 1,
-0.6679943, 0.9420643, 0.66572, 0.5058824, 1, 0, 1,
-0.6674101, -0.4087259, -1.558648, 0.5019608, 1, 0, 1,
-0.6670662, 0.4153509, -1.833057, 0.4941176, 1, 0, 1,
-0.664995, 0.2110835, -0.7687319, 0.4862745, 1, 0, 1,
-0.6611639, 0.8137349, -2.022097, 0.4823529, 1, 0, 1,
-0.65716, -1.0246, -1.076829, 0.4745098, 1, 0, 1,
-0.653089, 0.8603265, 0.6515181, 0.4705882, 1, 0, 1,
-0.6523286, -1.003833, -2.228609, 0.4627451, 1, 0, 1,
-0.650177, -0.9455947, -1.856212, 0.4588235, 1, 0, 1,
-0.6482568, 1.211666, -0.28271, 0.4509804, 1, 0, 1,
-0.6462823, 1.178666, 0.1546606, 0.4470588, 1, 0, 1,
-0.6425618, -0.8451241, -4.11423, 0.4392157, 1, 0, 1,
-0.639928, 0.9785279, -0.4922728, 0.4352941, 1, 0, 1,
-0.633236, 0.2559946, -2.296133, 0.427451, 1, 0, 1,
-0.6319641, 0.1703527, -2.284926, 0.4235294, 1, 0, 1,
-0.6249585, 0.432045, -0.7709323, 0.4156863, 1, 0, 1,
-0.6170154, -0.5700431, -0.7311258, 0.4117647, 1, 0, 1,
-0.6065823, 1.185038, -2.357853, 0.4039216, 1, 0, 1,
-0.6010676, 1.083057, 0.9455503, 0.3960784, 1, 0, 1,
-0.5999541, 0.8416258, 0.9540812, 0.3921569, 1, 0, 1,
-0.5936162, 0.07679247, -1.430431, 0.3843137, 1, 0, 1,
-0.5927493, -0.09724834, -1.653792, 0.3803922, 1, 0, 1,
-0.5896283, -0.5144147, -3.706104, 0.372549, 1, 0, 1,
-0.5784941, 0.8197213, 0.1225351, 0.3686275, 1, 0, 1,
-0.5744729, 0.3690453, -0.3665301, 0.3607843, 1, 0, 1,
-0.5723329, -0.0959101, -2.263846, 0.3568628, 1, 0, 1,
-0.5707592, 0.2194192, -0.8078422, 0.3490196, 1, 0, 1,
-0.5683569, -0.3660179, -3.802788, 0.345098, 1, 0, 1,
-0.5670363, 0.4898578, 0.3551239, 0.3372549, 1, 0, 1,
-0.5636439, 3.142025, -0.2564589, 0.3333333, 1, 0, 1,
-0.5627575, 0.1518908, -0.8985366, 0.3254902, 1, 0, 1,
-0.5566317, 2.7973, -1.092008, 0.3215686, 1, 0, 1,
-0.5522992, 1.58013, 0.9064517, 0.3137255, 1, 0, 1,
-0.552083, 1.637197, -1.611182, 0.3098039, 1, 0, 1,
-0.5479522, 0.1376023, -1.394476, 0.3019608, 1, 0, 1,
-0.5423066, -0.1776514, -3.210904, 0.2941177, 1, 0, 1,
-0.5384642, -0.6783605, -2.705853, 0.2901961, 1, 0, 1,
-0.5330528, 0.5388827, -1.257493, 0.282353, 1, 0, 1,
-0.5328532, -2.398552, 0.1295985, 0.2784314, 1, 0, 1,
-0.5325045, 1.740674, -0.2565297, 0.2705882, 1, 0, 1,
-0.528766, -1.406952, -2.292147, 0.2666667, 1, 0, 1,
-0.5261978, 1.157326, 0.5829369, 0.2588235, 1, 0, 1,
-0.522772, -0.1723236, -1.534216, 0.254902, 1, 0, 1,
-0.51314, -0.6561614, -0.811855, 0.2470588, 1, 0, 1,
-0.5111833, 1.231972, -1.216311, 0.2431373, 1, 0, 1,
-0.5109256, -1.356202, -3.579474, 0.2352941, 1, 0, 1,
-0.5099829, -0.01669557, -1.200281, 0.2313726, 1, 0, 1,
-0.5034316, -0.7563819, -2.358063, 0.2235294, 1, 0, 1,
-0.5033541, -0.2454022, -0.2431246, 0.2196078, 1, 0, 1,
-0.4980454, -1.304536, -3.284536, 0.2117647, 1, 0, 1,
-0.4980292, 0.07482783, 0.6095184, 0.2078431, 1, 0, 1,
-0.4972005, 0.1349396, -2.080476, 0.2, 1, 0, 1,
-0.4918633, 1.246188, 0.4949293, 0.1921569, 1, 0, 1,
-0.4842747, -1.64788, -3.885779, 0.1882353, 1, 0, 1,
-0.4797687, -0.04118165, -2.885428, 0.1803922, 1, 0, 1,
-0.4784859, -1.483093, -4.100624, 0.1764706, 1, 0, 1,
-0.4739363, -1.18133, -3.288053, 0.1686275, 1, 0, 1,
-0.4716474, 0.7570488, -2.766536, 0.1647059, 1, 0, 1,
-0.4680857, 0.8614947, -1.106789, 0.1568628, 1, 0, 1,
-0.466155, -1.71043, -3.950304, 0.1529412, 1, 0, 1,
-0.4638543, -2.351932, -2.137928, 0.145098, 1, 0, 1,
-0.4634548, -0.9848337, -2.011124, 0.1411765, 1, 0, 1,
-0.4620754, -1.138021, -2.448805, 0.1333333, 1, 0, 1,
-0.4560902, -0.0467964, -1.292918, 0.1294118, 1, 0, 1,
-0.4548742, 0.8268825, -1.255941, 0.1215686, 1, 0, 1,
-0.4519492, 1.012566, -0.330801, 0.1176471, 1, 0, 1,
-0.4513151, 0.5597786, -1.758215, 0.1098039, 1, 0, 1,
-0.441788, 0.602372, -0.03818569, 0.1058824, 1, 0, 1,
-0.4394726, 0.09121203, 0.03018085, 0.09803922, 1, 0, 1,
-0.4385386, -0.7043967, -1.079431, 0.09019608, 1, 0, 1,
-0.437405, -2.481843, -3.190573, 0.08627451, 1, 0, 1,
-0.4363649, -0.4926761, -1.719654, 0.07843138, 1, 0, 1,
-0.4348859, 1.666245, 0.230174, 0.07450981, 1, 0, 1,
-0.4327383, 0.3067211, -0.2224962, 0.06666667, 1, 0, 1,
-0.4303085, -2.287126, -3.323419, 0.0627451, 1, 0, 1,
-0.4280037, -0.2471289, -2.383856, 0.05490196, 1, 0, 1,
-0.4255475, 0.2764907, 0.1699503, 0.05098039, 1, 0, 1,
-0.4227604, 0.6678001, 0.1213638, 0.04313726, 1, 0, 1,
-0.415467, 0.5935462, -0.5559872, 0.03921569, 1, 0, 1,
-0.4092665, -0.5132979, -3.204971, 0.03137255, 1, 0, 1,
-0.409207, -1.707606, -3.255582, 0.02745098, 1, 0, 1,
-0.4021426, 0.4585069, -1.187575, 0.01960784, 1, 0, 1,
-0.3976412, -0.2752698, -2.062417, 0.01568628, 1, 0, 1,
-0.3968259, -0.01267604, -1.353139, 0.007843138, 1, 0, 1,
-0.3948059, -1.667359, -2.069233, 0.003921569, 1, 0, 1,
-0.3897855, 1.750807, -2.009793, 0, 1, 0.003921569, 1,
-0.3879837, 0.9278393, -1.440179, 0, 1, 0.01176471, 1,
-0.3859885, 1.274312, 0.09802622, 0, 1, 0.01568628, 1,
-0.3848018, 1.761547, -1.280175, 0, 1, 0.02352941, 1,
-0.3846532, 0.7489752, -1.68698, 0, 1, 0.02745098, 1,
-0.3833051, 1.640828, -0.3702477, 0, 1, 0.03529412, 1,
-0.3809385, -0.5481588, -2.248065, 0, 1, 0.03921569, 1,
-0.3780264, 1.55672, -0.5911495, 0, 1, 0.04705882, 1,
-0.377268, -0.02588027, -1.344818, 0, 1, 0.05098039, 1,
-0.3727947, -0.3592744, -1.272426, 0, 1, 0.05882353, 1,
-0.3694643, -2.295027, -2.674892, 0, 1, 0.0627451, 1,
-0.3693551, -1.172389, -3.434285, 0, 1, 0.07058824, 1,
-0.3665681, 1.431518, -0.5705438, 0, 1, 0.07450981, 1,
-0.3571496, 0.8741347, -1.097587, 0, 1, 0.08235294, 1,
-0.3549244, 1.538681, 1.602841, 0, 1, 0.08627451, 1,
-0.3513201, 0.2301998, -2.330223, 0, 1, 0.09411765, 1,
-0.349729, 0.01523267, -2.969239, 0, 1, 0.1019608, 1,
-0.3439668, -0.484495, -1.963279, 0, 1, 0.1058824, 1,
-0.3436771, -0.2346682, -2.538255, 0, 1, 0.1137255, 1,
-0.341959, -0.4727602, -4.764679, 0, 1, 0.1176471, 1,
-0.341262, -0.7403855, -4.313495, 0, 1, 0.1254902, 1,
-0.3372173, -0.355272, -2.656433, 0, 1, 0.1294118, 1,
-0.3281488, -0.5637648, -1.942418, 0, 1, 0.1372549, 1,
-0.3271787, 0.07792864, -2.593259, 0, 1, 0.1411765, 1,
-0.3270503, -0.5480276, -1.930305, 0, 1, 0.1490196, 1,
-0.3239235, 0.746771, -0.8258804, 0, 1, 0.1529412, 1,
-0.3232805, 0.2754842, -1.005678, 0, 1, 0.1607843, 1,
-0.3201833, -0.245923, -1.052543, 0, 1, 0.1647059, 1,
-0.3198193, -0.02166152, -0.6888502, 0, 1, 0.172549, 1,
-0.3170407, -0.3045616, -4.283085, 0, 1, 0.1764706, 1,
-0.3143848, -0.7883453, -5.366036, 0, 1, 0.1843137, 1,
-0.3039057, 2.034997, 0.2331429, 0, 1, 0.1882353, 1,
-0.3028832, 0.8044077, 0.7260224, 0, 1, 0.1960784, 1,
-0.3017195, -0.8401541, -2.228348, 0, 1, 0.2039216, 1,
-0.3008627, 1.373355, -0.6520249, 0, 1, 0.2078431, 1,
-0.3001971, -1.102379, -2.601599, 0, 1, 0.2156863, 1,
-0.2998409, 0.05982155, -1.997792, 0, 1, 0.2196078, 1,
-0.2985705, 0.6825086, -0.574396, 0, 1, 0.227451, 1,
-0.2981061, -0.01177564, -3.889521, 0, 1, 0.2313726, 1,
-0.2976792, -1.778872, -3.456691, 0, 1, 0.2392157, 1,
-0.2969258, 0.4811093, 0.7514285, 0, 1, 0.2431373, 1,
-0.2966592, 0.8277833, 0.07989185, 0, 1, 0.2509804, 1,
-0.2921615, 1.12197, -1.129331, 0, 1, 0.254902, 1,
-0.2920939, 0.5639907, -0.1958786, 0, 1, 0.2627451, 1,
-0.2901317, 1.205943, -1.059009, 0, 1, 0.2666667, 1,
-0.2897248, 0.1751197, -1.056198, 0, 1, 0.2745098, 1,
-0.283423, -0.7017604, -2.150898, 0, 1, 0.2784314, 1,
-0.2821521, -0.237398, -0.2864498, 0, 1, 0.2862745, 1,
-0.2821446, 0.9663763, -1.498348, 0, 1, 0.2901961, 1,
-0.2812169, -0.5615599, -2.360271, 0, 1, 0.2980392, 1,
-0.2787083, -0.2923629, -2.539436, 0, 1, 0.3058824, 1,
-0.2761601, -0.1553722, -2.904388, 0, 1, 0.3098039, 1,
-0.2742943, -0.7612692, -5.171485, 0, 1, 0.3176471, 1,
-0.2726061, 0.2274284, 0.3625223, 0, 1, 0.3215686, 1,
-0.2724566, -1.049652, -2.743216, 0, 1, 0.3294118, 1,
-0.2711392, 0.06682695, -1.519434, 0, 1, 0.3333333, 1,
-0.2672222, 0.6478029, -0.2264106, 0, 1, 0.3411765, 1,
-0.2650096, -0.5360364, -3.917913, 0, 1, 0.345098, 1,
-0.264051, 0.5557751, -0.8123398, 0, 1, 0.3529412, 1,
-0.2586206, 1.308953, -0.1230192, 0, 1, 0.3568628, 1,
-0.2584519, 1.374962, -0.1691548, 0, 1, 0.3647059, 1,
-0.2525977, -0.6160399, -3.549346, 0, 1, 0.3686275, 1,
-0.2501489, 0.05635691, -1.506447, 0, 1, 0.3764706, 1,
-0.2474152, -1.852197, -2.684616, 0, 1, 0.3803922, 1,
-0.2465928, -0.4300557, -1.998567, 0, 1, 0.3882353, 1,
-0.2422446, 0.5756837, -0.1051794, 0, 1, 0.3921569, 1,
-0.2414143, -0.8311393, -4.883474, 0, 1, 0.4, 1,
-0.2397885, -0.7853497, -2.845119, 0, 1, 0.4078431, 1,
-0.2360206, 0.4502346, -0.708559, 0, 1, 0.4117647, 1,
-0.2340992, 0.2516415, -0.4041812, 0, 1, 0.4196078, 1,
-0.2295577, 0.9632076, 2.248281, 0, 1, 0.4235294, 1,
-0.223645, 2.083423, 0.5426373, 0, 1, 0.4313726, 1,
-0.2200827, 0.2421867, -1.127445, 0, 1, 0.4352941, 1,
-0.2174097, -0.5377953, -2.945904, 0, 1, 0.4431373, 1,
-0.2163312, 2.657866, 0.7442642, 0, 1, 0.4470588, 1,
-0.2132407, 0.1149053, -1.722576, 0, 1, 0.454902, 1,
-0.2119422, 0.4108709, -0.9655378, 0, 1, 0.4588235, 1,
-0.2080796, 2.664794, 1.558496, 0, 1, 0.4666667, 1,
-0.204574, -0.3765504, -3.359625, 0, 1, 0.4705882, 1,
-0.20339, 1.503261, -0.4481819, 0, 1, 0.4784314, 1,
-0.2014909, -0.3028803, -2.613872, 0, 1, 0.4823529, 1,
-0.2012845, -2.714108, -3.440349, 0, 1, 0.4901961, 1,
-0.2008264, 0.6375182, -0.03728966, 0, 1, 0.4941176, 1,
-0.1982966, 0.5800242, -0.03966644, 0, 1, 0.5019608, 1,
-0.1965127, -0.6608328, -2.295021, 0, 1, 0.509804, 1,
-0.1935993, 1.136866, 1.050779, 0, 1, 0.5137255, 1,
-0.1925634, 0.08615921, -1.07182, 0, 1, 0.5215687, 1,
-0.1912187, -2.3087, -2.046671, 0, 1, 0.5254902, 1,
-0.1901674, 0.1680572, -0.9384309, 0, 1, 0.5333334, 1,
-0.1893992, 1.440668, 0.4559191, 0, 1, 0.5372549, 1,
-0.1890029, 0.8806688, 1.8172, 0, 1, 0.5450981, 1,
-0.1886992, 0.0620124, -1.594054, 0, 1, 0.5490196, 1,
-0.1885916, 1.730229, -0.1064192, 0, 1, 0.5568628, 1,
-0.1862276, -0.6950529, -0.7913004, 0, 1, 0.5607843, 1,
-0.1822767, -0.1954111, -1.655604, 0, 1, 0.5686275, 1,
-0.182041, -1.272011, -2.133689, 0, 1, 0.572549, 1,
-0.1811423, 1.682332, 0.04864982, 0, 1, 0.5803922, 1,
-0.1751397, -0.121581, -1.479895, 0, 1, 0.5843138, 1,
-0.1707781, 0.9412301, -0.8815417, 0, 1, 0.5921569, 1,
-0.1707374, -1.623462, -4.815613, 0, 1, 0.5960785, 1,
-0.1698288, -0.6168472, -2.36017, 0, 1, 0.6039216, 1,
-0.1675391, 0.6123934, 0.4342817, 0, 1, 0.6117647, 1,
-0.1662166, 0.755901, -1.019139, 0, 1, 0.6156863, 1,
-0.1646084, 0.20676, 0.004908689, 0, 1, 0.6235294, 1,
-0.1628821, -0.1447986, -3.506106, 0, 1, 0.627451, 1,
-0.1612807, -1.938697, -2.115187, 0, 1, 0.6352941, 1,
-0.1601047, 0.4015119, 0.17457, 0, 1, 0.6392157, 1,
-0.1588934, 1.402611, -0.3515195, 0, 1, 0.6470588, 1,
-0.1573467, 1.323811, -1.968735, 0, 1, 0.6509804, 1,
-0.1491496, 1.53624, -1.734777, 0, 1, 0.6588235, 1,
-0.1407956, -0.4048104, -0.757211, 0, 1, 0.6627451, 1,
-0.1335412, -1.667107, -3.877915, 0, 1, 0.6705883, 1,
-0.1329845, -2.691285, -5.555119, 0, 1, 0.6745098, 1,
-0.1312479, 0.6977657, 0.5654531, 0, 1, 0.682353, 1,
-0.1308347, 1.834596, 0.6697859, 0, 1, 0.6862745, 1,
-0.1258462, 0.3664408, 0.5685605, 0, 1, 0.6941177, 1,
-0.1229796, -0.495912, -2.04989, 0, 1, 0.7019608, 1,
-0.1220755, 0.7162795, 0.6387327, 0, 1, 0.7058824, 1,
-0.1197781, 0.09681974, -0.1570011, 0, 1, 0.7137255, 1,
-0.1179247, -0.2356617, -1.354382, 0, 1, 0.7176471, 1,
-0.1146182, -0.7977994, -2.388399, 0, 1, 0.7254902, 1,
-0.1113935, -2.241485, -3.506921, 0, 1, 0.7294118, 1,
-0.1109172, -0.6946965, -2.964544, 0, 1, 0.7372549, 1,
-0.1105338, -0.0303181, -0.9011277, 0, 1, 0.7411765, 1,
-0.1096489, 0.2930695, -1.071949, 0, 1, 0.7490196, 1,
-0.1090336, 0.05697764, -0.2427759, 0, 1, 0.7529412, 1,
-0.1072578, 0.6544155, 0.4364059, 0, 1, 0.7607843, 1,
-0.1059306, -0.121509, -2.37694, 0, 1, 0.7647059, 1,
-0.1028978, 0.5409155, -1.350281, 0, 1, 0.772549, 1,
-0.1019357, 0.8960204, -1.268102, 0, 1, 0.7764706, 1,
-0.1011856, -2.491115, -2.947978, 0, 1, 0.7843137, 1,
-0.1003557, 1.66485, -0.6079125, 0, 1, 0.7882353, 1,
-0.08257502, -1.930216, -3.807489, 0, 1, 0.7960784, 1,
-0.08233705, 1.262609, -0.3658346, 0, 1, 0.8039216, 1,
-0.08179942, 0.2394798, 0.5074121, 0, 1, 0.8078431, 1,
-0.08101708, 0.1924789, -0.8006988, 0, 1, 0.8156863, 1,
-0.08082914, 0.0981963, -1.791712, 0, 1, 0.8196079, 1,
-0.07572668, 0.2389432, 1.34889, 0, 1, 0.827451, 1,
-0.07291739, 0.4537297, -0.1653022, 0, 1, 0.8313726, 1,
-0.06965964, -0.07782713, -3.927911, 0, 1, 0.8392157, 1,
-0.0655838, -1.234855, -3.865426, 0, 1, 0.8431373, 1,
-0.06221008, 2.352467, -0.3975146, 0, 1, 0.8509804, 1,
-0.05792048, -0.4051075, -3.041167, 0, 1, 0.854902, 1,
-0.05520799, 0.7565877, -0.3401994, 0, 1, 0.8627451, 1,
-0.05434196, 0.2036921, -0.2295419, 0, 1, 0.8666667, 1,
-0.05230146, 0.3648077, 0.8500599, 0, 1, 0.8745098, 1,
-0.05144082, 1.369987, 0.2354875, 0, 1, 0.8784314, 1,
-0.04249503, -0.1984569, -1.788464, 0, 1, 0.8862745, 1,
-0.04113731, 0.6362832, -0.3159842, 0, 1, 0.8901961, 1,
-0.03964228, -1.043608, -2.105136, 0, 1, 0.8980392, 1,
-0.0357988, 0.7845522, 0.6730533, 0, 1, 0.9058824, 1,
-0.0357378, 0.5252603, -2.548571, 0, 1, 0.9098039, 1,
-0.03311148, -1.889566, -1.076495, 0, 1, 0.9176471, 1,
-0.03252031, -0.2011958, -2.091925, 0, 1, 0.9215686, 1,
-0.03167484, -0.05709192, -3.460096, 0, 1, 0.9294118, 1,
-0.02998346, -0.2204551, -3.905345, 0, 1, 0.9333333, 1,
-0.02822746, 1.797959, 0.02814697, 0, 1, 0.9411765, 1,
-0.02546451, -0.7276418, -2.099049, 0, 1, 0.945098, 1,
-0.02538993, 0.1993693, 2.046065, 0, 1, 0.9529412, 1,
-0.02476041, 0.5876138, -1.16543, 0, 1, 0.9568627, 1,
-0.018964, 1.193848, 0.8640386, 0, 1, 0.9647059, 1,
-0.01489693, 0.8650437, -0.5586346, 0, 1, 0.9686275, 1,
-0.01062947, -0.1158005, -3.915416, 0, 1, 0.9764706, 1,
-0.008372827, 1.039034, 0.07735858, 0, 1, 0.9803922, 1,
-0.008336802, 1.055319, -1.653934, 0, 1, 0.9882353, 1,
-0.0005789804, -0.4762888, -4.429116, 0, 1, 0.9921569, 1,
0.0001100825, 0.4573609, 0.5871011, 0, 1, 1, 1,
0.002732875, 0.7803323, -1.429779, 0, 0.9921569, 1, 1,
0.003996982, -0.8551528, 3.306615, 0, 0.9882353, 1, 1,
0.005847872, -0.1255277, 1.213514, 0, 0.9803922, 1, 1,
0.01254685, -0.1352201, 2.662448, 0, 0.9764706, 1, 1,
0.01366103, -0.1643775, 2.425173, 0, 0.9686275, 1, 1,
0.01784514, -0.4846069, 2.45757, 0, 0.9647059, 1, 1,
0.01909177, 0.4097559, -0.08024418, 0, 0.9568627, 1, 1,
0.0234072, 1.171257, 0.60006, 0, 0.9529412, 1, 1,
0.02519821, 1.020393, 1.957399, 0, 0.945098, 1, 1,
0.02662738, 1.124685, 1.148006, 0, 0.9411765, 1, 1,
0.03902794, -1.393721, 5.030073, 0, 0.9333333, 1, 1,
0.04022925, 0.4154077, -0.1126085, 0, 0.9294118, 1, 1,
0.04389687, -0.4613018, 3.474939, 0, 0.9215686, 1, 1,
0.04410248, -1.073725, 2.63684, 0, 0.9176471, 1, 1,
0.04426958, 2.119721, -0.4458222, 0, 0.9098039, 1, 1,
0.04639465, 2.645038, -0.1921911, 0, 0.9058824, 1, 1,
0.04738437, 0.5877421, -0.5611331, 0, 0.8980392, 1, 1,
0.05009799, 1.619812, 0.5599802, 0, 0.8901961, 1, 1,
0.05052812, 1.715968, -0.3527176, 0, 0.8862745, 1, 1,
0.05081627, 0.4997351, 1.269603, 0, 0.8784314, 1, 1,
0.05099119, -0.3875649, 2.468853, 0, 0.8745098, 1, 1,
0.05467625, 0.4906302, -0.6839724, 0, 0.8666667, 1, 1,
0.05727131, 0.4120829, 0.06120175, 0, 0.8627451, 1, 1,
0.06163914, 0.1721008, 0.4997171, 0, 0.854902, 1, 1,
0.0620369, -0.4114614, 2.322065, 0, 0.8509804, 1, 1,
0.0665288, 0.6966137, -0.2847098, 0, 0.8431373, 1, 1,
0.07942786, 0.647177, 1.94472, 0, 0.8392157, 1, 1,
0.08516967, -0.688418, 4.019968, 0, 0.8313726, 1, 1,
0.08673733, 0.08702535, 0.4151872, 0, 0.827451, 1, 1,
0.08842984, -0.1354365, 3.267167, 0, 0.8196079, 1, 1,
0.08975082, 2.462698, 0.938632, 0, 0.8156863, 1, 1,
0.09066013, 0.1853209, 0.05312012, 0, 0.8078431, 1, 1,
0.09358966, -0.3564559, 2.985623, 0, 0.8039216, 1, 1,
0.0955359, -1.127413, 3.856577, 0, 0.7960784, 1, 1,
0.09902167, -0.6902692, 4.015011, 0, 0.7882353, 1, 1,
0.1000738, 0.6983896, -0.4260788, 0, 0.7843137, 1, 1,
0.1050822, 1.121934, 1.480977, 0, 0.7764706, 1, 1,
0.1122294, 0.584678, 0.1434489, 0, 0.772549, 1, 1,
0.1156125, -0.1191418, 2.912534, 0, 0.7647059, 1, 1,
0.117906, -1.074848, 1.256379, 0, 0.7607843, 1, 1,
0.1188455, -0.3998076, 2.949589, 0, 0.7529412, 1, 1,
0.1213744, -1.740491, 2.164955, 0, 0.7490196, 1, 1,
0.1228938, 0.03776778, 0.6552932, 0, 0.7411765, 1, 1,
0.1232971, -0.1339658, 1.752611, 0, 0.7372549, 1, 1,
0.128071, 0.6582775, -0.3626995, 0, 0.7294118, 1, 1,
0.1308292, -0.3072328, 2.585495, 0, 0.7254902, 1, 1,
0.1316964, 0.02061094, -0.3780178, 0, 0.7176471, 1, 1,
0.1325241, 0.9079234, 0.2384318, 0, 0.7137255, 1, 1,
0.1334564, -0.0293689, 2.274592, 0, 0.7058824, 1, 1,
0.1341615, 0.4521024, 1.816312, 0, 0.6980392, 1, 1,
0.1360492, -1.48157, 2.773877, 0, 0.6941177, 1, 1,
0.1381784, 0.3228182, -0.9005371, 0, 0.6862745, 1, 1,
0.1391279, 1.182839, 0.3435362, 0, 0.682353, 1, 1,
0.1437522, -1.490782, 3.990068, 0, 0.6745098, 1, 1,
0.1451528, 2.619076, -0.5489444, 0, 0.6705883, 1, 1,
0.1486247, -0.5392968, 2.774448, 0, 0.6627451, 1, 1,
0.1510337, 1.587817, 1.391179, 0, 0.6588235, 1, 1,
0.1529127, 0.01543747, 2.48546, 0, 0.6509804, 1, 1,
0.1588391, 0.5446022, 1.023071, 0, 0.6470588, 1, 1,
0.1609883, -0.02019164, 1.698322, 0, 0.6392157, 1, 1,
0.1624316, 0.5669222, 1.305995, 0, 0.6352941, 1, 1,
0.163225, -0.6192893, 4.204638, 0, 0.627451, 1, 1,
0.1641538, -2.076264, 3.084919, 0, 0.6235294, 1, 1,
0.1662045, 0.84983, -0.3655606, 0, 0.6156863, 1, 1,
0.166301, -3.452119, 3.085129, 0, 0.6117647, 1, 1,
0.1676946, -0.47293, 2.994557, 0, 0.6039216, 1, 1,
0.1707192, 1.499761, -2.955979, 0, 0.5960785, 1, 1,
0.170783, -1.848165, 3.725562, 0, 0.5921569, 1, 1,
0.1737333, 1.548387, -0.399134, 0, 0.5843138, 1, 1,
0.173886, 0.7932702, 0.2262155, 0, 0.5803922, 1, 1,
0.1790048, -0.465003, 3.550862, 0, 0.572549, 1, 1,
0.1827524, -0.7744353, 1.479848, 0, 0.5686275, 1, 1,
0.1845656, -0.4880566, 3.337319, 0, 0.5607843, 1, 1,
0.1934813, 0.8673574, 0.7193695, 0, 0.5568628, 1, 1,
0.1945699, -0.7151376, 2.533029, 0, 0.5490196, 1, 1,
0.1952818, -2.374604, 4.127032, 0, 0.5450981, 1, 1,
0.1963774, 1.306442, -0.6785215, 0, 0.5372549, 1, 1,
0.1976607, 1.915377, -0.7190317, 0, 0.5333334, 1, 1,
0.1982026, -1.923196, 2.368704, 0, 0.5254902, 1, 1,
0.199033, 0.133812, 2.648147, 0, 0.5215687, 1, 1,
0.2012521, -0.5687931, 2.340898, 0, 0.5137255, 1, 1,
0.2048898, -0.8225784, 3.087001, 0, 0.509804, 1, 1,
0.2063861, -2.20301, 3.138973, 0, 0.5019608, 1, 1,
0.2068963, -1.304261, 2.985852, 0, 0.4941176, 1, 1,
0.2079854, -1.729417, 2.53185, 0, 0.4901961, 1, 1,
0.2083915, -1.673054, 3.413523, 0, 0.4823529, 1, 1,
0.2102383, -0.2602856, 2.697572, 0, 0.4784314, 1, 1,
0.2109116, 0.8048875, -1.060754, 0, 0.4705882, 1, 1,
0.2125048, 0.7872064, -0.5590534, 0, 0.4666667, 1, 1,
0.2145867, -0.4729056, 2.199435, 0, 0.4588235, 1, 1,
0.2151583, 1.65644, 0.7735958, 0, 0.454902, 1, 1,
0.216899, -1.19623, 2.816149, 0, 0.4470588, 1, 1,
0.2203574, 0.7444676, -0.4695529, 0, 0.4431373, 1, 1,
0.2211884, -0.9336702, 2.921538, 0, 0.4352941, 1, 1,
0.2217379, -0.93717, 4.289207, 0, 0.4313726, 1, 1,
0.2310422, 0.06604192, 0.331897, 0, 0.4235294, 1, 1,
0.2326025, -0.5748653, 3.629511, 0, 0.4196078, 1, 1,
0.2331056, 2.331352, -0.6875765, 0, 0.4117647, 1, 1,
0.2341649, -0.1534074, -1.097995, 0, 0.4078431, 1, 1,
0.2351648, 1.406213, -0.9696776, 0, 0.4, 1, 1,
0.2357442, -0.3668596, 1.653343, 0, 0.3921569, 1, 1,
0.2362672, 1.000562, 1.508102, 0, 0.3882353, 1, 1,
0.2379279, -0.3961105, 2.517292, 0, 0.3803922, 1, 1,
0.238791, -1.094649, 4.089813, 0, 0.3764706, 1, 1,
0.2424719, -0.6526057, 3.80987, 0, 0.3686275, 1, 1,
0.2433555, 1.082744, 0.3051897, 0, 0.3647059, 1, 1,
0.2479157, -0.4545806, 1.608732, 0, 0.3568628, 1, 1,
0.2510412, -1.492304, 2.349007, 0, 0.3529412, 1, 1,
0.2525789, 1.061143, 0.4601319, 0, 0.345098, 1, 1,
0.2537699, -1.255939, 2.686403, 0, 0.3411765, 1, 1,
0.2543792, 0.04486908, 1.646598, 0, 0.3333333, 1, 1,
0.2601978, -0.2991642, 1.914217, 0, 0.3294118, 1, 1,
0.2745837, 1.036276, -1.406319, 0, 0.3215686, 1, 1,
0.276828, 0.3084717, 0.4148254, 0, 0.3176471, 1, 1,
0.2786736, -1.874959, 4.463759, 0, 0.3098039, 1, 1,
0.2798952, -1.779711, 1.655424, 0, 0.3058824, 1, 1,
0.2831035, 0.3954907, 0.7694446, 0, 0.2980392, 1, 1,
0.2886999, 1.432478, 1.026739, 0, 0.2901961, 1, 1,
0.2953148, -0.212629, 1.7461, 0, 0.2862745, 1, 1,
0.295857, 0.3279227, 1.746497, 0, 0.2784314, 1, 1,
0.2964135, -0.6177144, 1.872752, 0, 0.2745098, 1, 1,
0.2985384, 2.002662, 0.3388786, 0, 0.2666667, 1, 1,
0.3020531, -1.39986, 2.350135, 0, 0.2627451, 1, 1,
0.3044098, -0.7363819, 2.905192, 0, 0.254902, 1, 1,
0.3075378, 1.381156, 0.6118898, 0, 0.2509804, 1, 1,
0.3085198, 1.985407, 0.9595034, 0, 0.2431373, 1, 1,
0.3131554, -0.3526878, 1.280413, 0, 0.2392157, 1, 1,
0.3143846, -0.2158285, 2.689829, 0, 0.2313726, 1, 1,
0.321033, 1.441365, 1.419465, 0, 0.227451, 1, 1,
0.3228121, 1.000954, -1.491397, 0, 0.2196078, 1, 1,
0.3246085, 1.072435, 0.8921301, 0, 0.2156863, 1, 1,
0.325254, 0.1308102, 1.685571, 0, 0.2078431, 1, 1,
0.3256188, 1.137038, 1.651713, 0, 0.2039216, 1, 1,
0.3267286, 0.9548451, 0.1265074, 0, 0.1960784, 1, 1,
0.3327543, -0.01342157, 1.361752, 0, 0.1882353, 1, 1,
0.3340158, 1.399386, -0.4139911, 0, 0.1843137, 1, 1,
0.3347822, -0.8569101, 2.074433, 0, 0.1764706, 1, 1,
0.3356361, 0.2819065, 2.40975, 0, 0.172549, 1, 1,
0.3370771, 1.664015, 0.546832, 0, 0.1647059, 1, 1,
0.3380626, -0.04724048, 1.735909, 0, 0.1607843, 1, 1,
0.3526311, 0.1872682, 2.921223, 0, 0.1529412, 1, 1,
0.3567576, -0.2910057, 3.592139, 0, 0.1490196, 1, 1,
0.357759, 0.171659, 3.197896, 0, 0.1411765, 1, 1,
0.3595254, -0.1325371, 2.020763, 0, 0.1372549, 1, 1,
0.3623125, -2.39457, 3.233242, 0, 0.1294118, 1, 1,
0.3639002, 0.433726, 0.8917216, 0, 0.1254902, 1, 1,
0.3639759, 1.432069, -0.6356934, 0, 0.1176471, 1, 1,
0.3708703, 1.364238, 0.8145713, 0, 0.1137255, 1, 1,
0.3708706, -0.03357179, 0.3333988, 0, 0.1058824, 1, 1,
0.3719915, 0.08728611, 0.9837582, 0, 0.09803922, 1, 1,
0.374318, 0.791562, 0.4151574, 0, 0.09411765, 1, 1,
0.3744984, -1.030418, 2.496339, 0, 0.08627451, 1, 1,
0.3746888, -0.7256887, 1.947145, 0, 0.08235294, 1, 1,
0.3801729, 0.8056952, -0.837041, 0, 0.07450981, 1, 1,
0.3838555, -2.405818, 2.028362, 0, 0.07058824, 1, 1,
0.392481, -2.020121, 3.309487, 0, 0.0627451, 1, 1,
0.3929935, -0.6520671, 3.29927, 0, 0.05882353, 1, 1,
0.3948966, -1.192703, 4.73299, 0, 0.05098039, 1, 1,
0.397342, 0.109782, 0.7449768, 0, 0.04705882, 1, 1,
0.4019189, -0.125846, 2.305716, 0, 0.03921569, 1, 1,
0.4022487, 0.3113995, 0.8424087, 0, 0.03529412, 1, 1,
0.4071822, 1.47521, 0.2657555, 0, 0.02745098, 1, 1,
0.4096695, -2.407519, 3.128815, 0, 0.02352941, 1, 1,
0.4141103, 0.4298382, 2.368963, 0, 0.01568628, 1, 1,
0.4149528, 0.32805, 1.491087, 0, 0.01176471, 1, 1,
0.4149555, 0.9580227, 0.5786027, 0, 0.003921569, 1, 1,
0.4170146, 0.2248414, 0.1552623, 0.003921569, 0, 1, 1,
0.4194083, -0.3904863, 2.387024, 0.007843138, 0, 1, 1,
0.4197561, -0.8297358, 2.262372, 0.01568628, 0, 1, 1,
0.4242331, 0.6839889, 0.3549008, 0.01960784, 0, 1, 1,
0.4283097, 1.835035, 0.5266753, 0.02745098, 0, 1, 1,
0.4303326, 0.230705, 2.514957, 0.03137255, 0, 1, 1,
0.4363645, -0.5897287, 2.946635, 0.03921569, 0, 1, 1,
0.4413144, -0.2818655, 2.674839, 0.04313726, 0, 1, 1,
0.4444457, 0.9231427, -0.6994516, 0.05098039, 0, 1, 1,
0.4458938, -0.8044518, 0.9350157, 0.05490196, 0, 1, 1,
0.4498174, 1.048314, -0.8319873, 0.0627451, 0, 1, 1,
0.450982, -0.08923075, 1.860027, 0.06666667, 0, 1, 1,
0.45856, -0.6318102, 2.995064, 0.07450981, 0, 1, 1,
0.459387, 0.8264005, -0.05147783, 0.07843138, 0, 1, 1,
0.4640553, 1.166315, -0.6560228, 0.08627451, 0, 1, 1,
0.4640624, -0.1568157, 3.989643, 0.09019608, 0, 1, 1,
0.4720809, 0.1612882, 2.148938, 0.09803922, 0, 1, 1,
0.4729359, 1.27678, 2.234961, 0.1058824, 0, 1, 1,
0.4732209, 1.168047, 0.1603106, 0.1098039, 0, 1, 1,
0.4776397, 0.3418355, 1.841248, 0.1176471, 0, 1, 1,
0.4811317, -0.8878585, 4.11039, 0.1215686, 0, 1, 1,
0.4815608, -0.6262293, 1.806734, 0.1294118, 0, 1, 1,
0.4828344, -0.095686, 0.7070056, 0.1333333, 0, 1, 1,
0.4841535, -0.7987485, 2.345261, 0.1411765, 0, 1, 1,
0.4842817, -0.1261628, 0.4722663, 0.145098, 0, 1, 1,
0.4857028, -0.1815252, 2.357368, 0.1529412, 0, 1, 1,
0.4886198, 0.3539254, -0.1632558, 0.1568628, 0, 1, 1,
0.4902632, -1.375931, 2.883166, 0.1647059, 0, 1, 1,
0.4919747, 0.4653457, 2.415436, 0.1686275, 0, 1, 1,
0.4924413, -1.72874, 3.081399, 0.1764706, 0, 1, 1,
0.4944923, 0.9004849, 0.9226897, 0.1803922, 0, 1, 1,
0.4949571, 0.4304899, -0.2569871, 0.1882353, 0, 1, 1,
0.495703, -1.880189, 2.321403, 0.1921569, 0, 1, 1,
0.499421, -0.0635706, 2.207994, 0.2, 0, 1, 1,
0.5002796, 1.010004, -0.5563663, 0.2078431, 0, 1, 1,
0.5041473, 1.352276, -0.3055488, 0.2117647, 0, 1, 1,
0.5058127, 1.031117, -0.1292554, 0.2196078, 0, 1, 1,
0.5063872, 1.472736, 2.485452, 0.2235294, 0, 1, 1,
0.5067536, -1.576726, 2.21752, 0.2313726, 0, 1, 1,
0.507469, 1.385538, -0.7276372, 0.2352941, 0, 1, 1,
0.5112293, 0.3638393, 0.8316793, 0.2431373, 0, 1, 1,
0.5161981, -0.7998304, 2.038839, 0.2470588, 0, 1, 1,
0.5166701, 0.2817355, 1.113284, 0.254902, 0, 1, 1,
0.5196028, -1.051974, 2.623867, 0.2588235, 0, 1, 1,
0.5210084, 0.3233724, -0.03859787, 0.2666667, 0, 1, 1,
0.5296833, 0.3053645, -0.8171129, 0.2705882, 0, 1, 1,
0.5306744, 0.03215566, 2.414375, 0.2784314, 0, 1, 1,
0.5367, -0.7031399, 0.956319, 0.282353, 0, 1, 1,
0.541191, -0.5254791, 1.767216, 0.2901961, 0, 1, 1,
0.541755, -0.1294343, 0.09381077, 0.2941177, 0, 1, 1,
0.5422156, 1.175881, 0.04396124, 0.3019608, 0, 1, 1,
0.5437135, 0.9434078, 1.598447, 0.3098039, 0, 1, 1,
0.551679, 0.6831018, -0.6056255, 0.3137255, 0, 1, 1,
0.5539635, -1.838881, 3.538246, 0.3215686, 0, 1, 1,
0.5658755, 0.2306143, -0.2280545, 0.3254902, 0, 1, 1,
0.570568, 0.7713701, 2.438922, 0.3333333, 0, 1, 1,
0.5716419, -2.154365, 3.192, 0.3372549, 0, 1, 1,
0.5734245, 0.405881, 0.1812645, 0.345098, 0, 1, 1,
0.5815183, 0.8198611, 1.672754, 0.3490196, 0, 1, 1,
0.5895192, 3.426948, -0.7936338, 0.3568628, 0, 1, 1,
0.5916043, 1.87914, -0.8578089, 0.3607843, 0, 1, 1,
0.592195, -0.2638559, 2.297843, 0.3686275, 0, 1, 1,
0.5934439, 0.3047328, 2.79644, 0.372549, 0, 1, 1,
0.5951287, 0.7599416, 2.401751, 0.3803922, 0, 1, 1,
0.5958566, 0.2736665, 2.828463, 0.3843137, 0, 1, 1,
0.596937, 0.7977373, -0.2024539, 0.3921569, 0, 1, 1,
0.6014926, -1.462522, 2.886399, 0.3960784, 0, 1, 1,
0.605796, 0.5182976, 1.163079, 0.4039216, 0, 1, 1,
0.6111271, -1.288269, 3.466068, 0.4117647, 0, 1, 1,
0.6123617, -0.9596173, 2.203612, 0.4156863, 0, 1, 1,
0.6123714, 0.08925682, 2.311392, 0.4235294, 0, 1, 1,
0.6185802, -0.430038, 2.570121, 0.427451, 0, 1, 1,
0.6197925, 0.6246057, 0.2026302, 0.4352941, 0, 1, 1,
0.6256626, -1.477427, 4.981408, 0.4392157, 0, 1, 1,
0.6311627, -1.082192, 2.793607, 0.4470588, 0, 1, 1,
0.6319882, 0.2583446, 1.689859, 0.4509804, 0, 1, 1,
0.6380302, 0.3588989, 2.223957, 0.4588235, 0, 1, 1,
0.6461483, -0.3883223, 2.017764, 0.4627451, 0, 1, 1,
0.6508955, 0.988942, 0.4923369, 0.4705882, 0, 1, 1,
0.6563768, 0.4799104, 2.677519, 0.4745098, 0, 1, 1,
0.6600393, -0.976479, 3.905614, 0.4823529, 0, 1, 1,
0.6626364, 0.9900314, -0.7101108, 0.4862745, 0, 1, 1,
0.6654215, 0.9368114, -0.3448543, 0.4941176, 0, 1, 1,
0.6718987, 0.9002448, -0.8850489, 0.5019608, 0, 1, 1,
0.6731972, 1.932061, 1.158008, 0.5058824, 0, 1, 1,
0.6769401, 0.7154204, 0.7595962, 0.5137255, 0, 1, 1,
0.6778865, -0.6853607, 3.616, 0.5176471, 0, 1, 1,
0.688476, 0.9146606, 1.512318, 0.5254902, 0, 1, 1,
0.6891709, -0.4709851, 1.021649, 0.5294118, 0, 1, 1,
0.691016, 0.1560123, 0.9860957, 0.5372549, 0, 1, 1,
0.6933807, 1.763512, 1.072168, 0.5411765, 0, 1, 1,
0.6954902, -0.3659606, 1.490742, 0.5490196, 0, 1, 1,
0.6971731, -0.3257066, 1.431597, 0.5529412, 0, 1, 1,
0.7006832, -0.1191294, 1.827861, 0.5607843, 0, 1, 1,
0.7023107, -0.158355, 1.587755, 0.5647059, 0, 1, 1,
0.7100537, 0.50413, 0.6736878, 0.572549, 0, 1, 1,
0.7111642, 2.414232, -0.7661483, 0.5764706, 0, 1, 1,
0.7117319, 0.9679288, 1.668177, 0.5843138, 0, 1, 1,
0.7139665, 1.522877, 1.482708, 0.5882353, 0, 1, 1,
0.7175313, 1.016554, 2.856919, 0.5960785, 0, 1, 1,
0.7181694, -0.6503812, 1.508581, 0.6039216, 0, 1, 1,
0.7210633, 1.947513, 1.880384, 0.6078432, 0, 1, 1,
0.7308256, 0.513427, 1.093289, 0.6156863, 0, 1, 1,
0.7340714, 0.7937411, 0.3953814, 0.6196079, 0, 1, 1,
0.7397406, 0.6812951, 1.284543, 0.627451, 0, 1, 1,
0.7425139, 1.287163, 0.2648124, 0.6313726, 0, 1, 1,
0.7498738, 2.111837, -0.9860002, 0.6392157, 0, 1, 1,
0.7512984, -0.1417508, 0.7223207, 0.6431373, 0, 1, 1,
0.755364, 1.100747, 2.948261, 0.6509804, 0, 1, 1,
0.7686077, -0.6462842, 0.7228746, 0.654902, 0, 1, 1,
0.7702786, -0.8506272, 2.375237, 0.6627451, 0, 1, 1,
0.7760903, 0.4216655, 2.221432, 0.6666667, 0, 1, 1,
0.7888166, 0.6144775, 2.280336, 0.6745098, 0, 1, 1,
0.7901909, 0.5843679, 2.290286, 0.6784314, 0, 1, 1,
0.7908292, 0.2996499, 0.8991027, 0.6862745, 0, 1, 1,
0.7929942, 1.817461, 0.580402, 0.6901961, 0, 1, 1,
0.7948393, -0.158131, 1.24575, 0.6980392, 0, 1, 1,
0.7973493, 1.152273, 2.065696, 0.7058824, 0, 1, 1,
0.7978696, 1.521869, 0.941349, 0.7098039, 0, 1, 1,
0.8011937, -1.329505, 3.569213, 0.7176471, 0, 1, 1,
0.8028486, 0.9773487, 1.72403, 0.7215686, 0, 1, 1,
0.8244137, -2.101385, 3.243473, 0.7294118, 0, 1, 1,
0.8369944, -1.394597, 3.406967, 0.7333333, 0, 1, 1,
0.8453495, 0.1655175, 1.293688, 0.7411765, 0, 1, 1,
0.8462118, 1.3259, -0.3323575, 0.7450981, 0, 1, 1,
0.8468487, -0.04669975, 1.337999, 0.7529412, 0, 1, 1,
0.8472334, 1.727362, -0.5593266, 0.7568628, 0, 1, 1,
0.8474137, 1.392336, -1.786036, 0.7647059, 0, 1, 1,
0.8498577, 0.7746115, 0.361065, 0.7686275, 0, 1, 1,
0.8526075, -0.6903829, 0.8022817, 0.7764706, 0, 1, 1,
0.8536904, -0.9199849, 1.544544, 0.7803922, 0, 1, 1,
0.857577, 0.1573224, 1.110944, 0.7882353, 0, 1, 1,
0.8578344, -0.3804901, 0.7510403, 0.7921569, 0, 1, 1,
0.8633192, 0.8319029, -0.6853967, 0.8, 0, 1, 1,
0.8642341, -0.1106671, 3.738949, 0.8078431, 0, 1, 1,
0.8698599, -0.4098609, 1.377553, 0.8117647, 0, 1, 1,
0.8763027, 0.226575, 1.553397, 0.8196079, 0, 1, 1,
0.8860931, -0.6081171, 1.79649, 0.8235294, 0, 1, 1,
0.8868554, 0.8282211, 2.058649, 0.8313726, 0, 1, 1,
0.893334, -1.886141, 1.639702, 0.8352941, 0, 1, 1,
0.8986574, 1.306122, 1.244468, 0.8431373, 0, 1, 1,
0.900391, 0.2783892, 0.4205202, 0.8470588, 0, 1, 1,
0.9030873, 0.5176343, 2.37518, 0.854902, 0, 1, 1,
0.9110123, 0.4188102, 1.760174, 0.8588235, 0, 1, 1,
0.9166337, -1.425623, 3.542203, 0.8666667, 0, 1, 1,
0.9274375, 1.465435, -0.4575619, 0.8705882, 0, 1, 1,
0.9288044, 0.5248326, 0.8862759, 0.8784314, 0, 1, 1,
0.9325879, -0.6104206, 1.416431, 0.8823529, 0, 1, 1,
0.9401162, 0.1711771, 2.920598, 0.8901961, 0, 1, 1,
0.9464097, 0.6637993, 3.083099, 0.8941177, 0, 1, 1,
0.9473634, 0.8132101, 0.2523423, 0.9019608, 0, 1, 1,
0.9637455, -0.6349173, 1.787274, 0.9098039, 0, 1, 1,
0.9715059, -2.121121, 3.202499, 0.9137255, 0, 1, 1,
0.9774954, -1.352439, 2.652566, 0.9215686, 0, 1, 1,
0.9909564, -0.4754428, 2.843314, 0.9254902, 0, 1, 1,
0.9911582, 1.200519, 1.302222, 0.9333333, 0, 1, 1,
0.9919371, 0.9244385, 1.556692, 0.9372549, 0, 1, 1,
0.9921652, 0.0175198, 0.6050786, 0.945098, 0, 1, 1,
0.9944506, 1.062135, 0.8608864, 0.9490196, 0, 1, 1,
0.9991446, -1.712889, 2.495232, 0.9568627, 0, 1, 1,
1.001356, 1.162509, -0.05391058, 0.9607843, 0, 1, 1,
1.002982, -1.237119, 1.821239, 0.9686275, 0, 1, 1,
1.009324, 2.127966, 2.102558, 0.972549, 0, 1, 1,
1.011007, -2.093722, 3.872477, 0.9803922, 0, 1, 1,
1.016548, 0.2237363, 0.1999713, 0.9843137, 0, 1, 1,
1.019923, -0.3852235, 2.58757, 0.9921569, 0, 1, 1,
1.020091, 0.3874985, 1.26546, 0.9960784, 0, 1, 1,
1.02275, -1.411446, 2.481186, 1, 0, 0.9960784, 1,
1.043129, 0.3978838, 1.624272, 1, 0, 0.9882353, 1,
1.050432, -0.6826742, 2.284446, 1, 0, 0.9843137, 1,
1.064682, -0.07431404, 2.689396, 1, 0, 0.9764706, 1,
1.065552, 0.1881365, 2.698955, 1, 0, 0.972549, 1,
1.066484, -1.003039, 2.059917, 1, 0, 0.9647059, 1,
1.06969, -0.3213928, 1.760072, 1, 0, 0.9607843, 1,
1.07722, 0.5238215, -0.06024332, 1, 0, 0.9529412, 1,
1.087302, 0.216278, -0.4915615, 1, 0, 0.9490196, 1,
1.090523, 1.203163, 0.4620572, 1, 0, 0.9411765, 1,
1.091616, -0.9532013, 2.823602, 1, 0, 0.9372549, 1,
1.092096, 0.3866991, 1.614101, 1, 0, 0.9294118, 1,
1.093311, -0.2453197, 1.829093, 1, 0, 0.9254902, 1,
1.095588, 0.1080462, 2.010615, 1, 0, 0.9176471, 1,
1.09971, 0.6524894, 1.012191, 1, 0, 0.9137255, 1,
1.104544, 0.06008291, 0.2261644, 1, 0, 0.9058824, 1,
1.108888, 0.3549472, 0.4422179, 1, 0, 0.9019608, 1,
1.109671, -0.06814858, 1.669511, 1, 0, 0.8941177, 1,
1.111444, -1.340273, 3.893675, 1, 0, 0.8862745, 1,
1.111653, -1.642292, 3.614262, 1, 0, 0.8823529, 1,
1.112242, -1.088868, 2.808529, 1, 0, 0.8745098, 1,
1.11709, 0.4956855, 1.416968, 1, 0, 0.8705882, 1,
1.125218, 0.2394622, 0.7960845, 1, 0, 0.8627451, 1,
1.132863, -0.3694549, 2.76841, 1, 0, 0.8588235, 1,
1.135813, -2.608278, 0.7795981, 1, 0, 0.8509804, 1,
1.152145, 1.174703, 1.428035, 1, 0, 0.8470588, 1,
1.177058, -0.6457226, 0.8736744, 1, 0, 0.8392157, 1,
1.178427, 2.032649, 1.489725, 1, 0, 0.8352941, 1,
1.17972, 0.757665, 3.205697, 1, 0, 0.827451, 1,
1.184087, 0.09663716, 1.261294, 1, 0, 0.8235294, 1,
1.184773, -0.1144065, 1.532239, 1, 0, 0.8156863, 1,
1.196869, -0.6185, 0.56497, 1, 0, 0.8117647, 1,
1.197172, -0.7641574, 1.751813, 1, 0, 0.8039216, 1,
1.199871, -1.561828, 0.2791106, 1, 0, 0.7960784, 1,
1.203041, 0.3856225, 1.732266, 1, 0, 0.7921569, 1,
1.211818, -0.9639322, 2.105998, 1, 0, 0.7843137, 1,
1.213421, -1.699014, 1.265768, 1, 0, 0.7803922, 1,
1.216046, 1.105254, 1.884615, 1, 0, 0.772549, 1,
1.21857, 0.1112242, 0.7930791, 1, 0, 0.7686275, 1,
1.225618, 0.6061471, -1.212349, 1, 0, 0.7607843, 1,
1.232594, -1.153259, 0.4939978, 1, 0, 0.7568628, 1,
1.233531, 0.7848524, 1.618614, 1, 0, 0.7490196, 1,
1.234311, 0.8754311, 0.9037679, 1, 0, 0.7450981, 1,
1.234665, 1.610169, 2.143723, 1, 0, 0.7372549, 1,
1.238756, -0.3496232, 3.198352, 1, 0, 0.7333333, 1,
1.24272, 1.531782, -0.7041841, 1, 0, 0.7254902, 1,
1.246441, 1.687415, -0.186317, 1, 0, 0.7215686, 1,
1.248638, 0.5819906, 2.476834, 1, 0, 0.7137255, 1,
1.255442, 0.593259, 1.074424, 1, 0, 0.7098039, 1,
1.256419, -0.0821171, 1.753214, 1, 0, 0.7019608, 1,
1.274496, -2.099588, 2.834512, 1, 0, 0.6941177, 1,
1.275255, -0.145586, 0.7687651, 1, 0, 0.6901961, 1,
1.277176, 0.03430647, 2.829289, 1, 0, 0.682353, 1,
1.283985, -0.2180959, 1.665397, 1, 0, 0.6784314, 1,
1.286991, 1.247298, -0.09556776, 1, 0, 0.6705883, 1,
1.296921, 0.6283865, 1.772925, 1, 0, 0.6666667, 1,
1.29801, 0.6541137, 2.772887, 1, 0, 0.6588235, 1,
1.299241, -1.172995, 1.623321, 1, 0, 0.654902, 1,
1.301183, 0.5740623, 1.417632, 1, 0, 0.6470588, 1,
1.30347, 1.543584, 1.119027, 1, 0, 0.6431373, 1,
1.30726, 1.099628, -0.4874547, 1, 0, 0.6352941, 1,
1.308516, 1.292984, -0.2706211, 1, 0, 0.6313726, 1,
1.31916, -1.317571, 0.9619745, 1, 0, 0.6235294, 1,
1.32442, 0.1327031, 1.454076, 1, 0, 0.6196079, 1,
1.328437, 1.405233, 1.063983, 1, 0, 0.6117647, 1,
1.33242, -0.1046694, 1.86346, 1, 0, 0.6078432, 1,
1.351309, 1.177596, 2.104485, 1, 0, 0.6, 1,
1.359812, -1.468689, 2.805604, 1, 0, 0.5921569, 1,
1.360581, 1.869819, 0.6128183, 1, 0, 0.5882353, 1,
1.360588, 0.2486914, 0.8677731, 1, 0, 0.5803922, 1,
1.36495, 0.6853039, 1.795735, 1, 0, 0.5764706, 1,
1.368879, -0.302557, 1.543578, 1, 0, 0.5686275, 1,
1.369589, -1.249101, 2.371262, 1, 0, 0.5647059, 1,
1.375391, -0.04595556, 2.645969, 1, 0, 0.5568628, 1,
1.383113, -1.298834, 3.174715, 1, 0, 0.5529412, 1,
1.383978, -1.010664, 2.402492, 1, 0, 0.5450981, 1,
1.385476, -0.5283012, 1.489961, 1, 0, 0.5411765, 1,
1.392664, -1.946209, 1.404789, 1, 0, 0.5333334, 1,
1.397418, 0.8488613, 2.819236, 1, 0, 0.5294118, 1,
1.405317, -0.3228048, 1.491096, 1, 0, 0.5215687, 1,
1.419379, -0.3666565, 1.419474, 1, 0, 0.5176471, 1,
1.428602, -0.4865472, 3.171191, 1, 0, 0.509804, 1,
1.434521, 1.195323, 0.5728295, 1, 0, 0.5058824, 1,
1.438046, 0.4938891, 2.398285, 1, 0, 0.4980392, 1,
1.445683, 1.218569, 0.2546092, 1, 0, 0.4901961, 1,
1.446468, 1.286617, 0.392152, 1, 0, 0.4862745, 1,
1.461265, 0.6595423, 0.1997125, 1, 0, 0.4784314, 1,
1.481009, 3.009768, -0.512024, 1, 0, 0.4745098, 1,
1.48296, -0.5408199, 2.786965, 1, 0, 0.4666667, 1,
1.499448, -1.750355, 4.043131, 1, 0, 0.4627451, 1,
1.500172, 1.613, 0.1954998, 1, 0, 0.454902, 1,
1.50397, -0.781733, 1.564537, 1, 0, 0.4509804, 1,
1.505981, 1.797643, 0.8910004, 1, 0, 0.4431373, 1,
1.507385, -1.372585, 3.523584, 1, 0, 0.4392157, 1,
1.516087, 1.151753, 1.347845, 1, 0, 0.4313726, 1,
1.517432, 0.4808991, 1.608044, 1, 0, 0.427451, 1,
1.51925, -2.662621, 2.310359, 1, 0, 0.4196078, 1,
1.532536, -0.4666322, 1.447384, 1, 0, 0.4156863, 1,
1.538946, -0.8176289, 1.501789, 1, 0, 0.4078431, 1,
1.541226, 0.9133463, 0.5514983, 1, 0, 0.4039216, 1,
1.555126, 0.193501, 2.785743, 1, 0, 0.3960784, 1,
1.629817, 1.042429, 0.904389, 1, 0, 0.3882353, 1,
1.634749, -1.7722, 3.197003, 1, 0, 0.3843137, 1,
1.654627, 0.5217012, 1.43675, 1, 0, 0.3764706, 1,
1.656672, 0.2298494, 1.613899, 1, 0, 0.372549, 1,
1.663772, 1.612332, 2.09077, 1, 0, 0.3647059, 1,
1.667659, 0.1626766, 0.5631355, 1, 0, 0.3607843, 1,
1.679003, -0.3443849, 2.070021, 1, 0, 0.3529412, 1,
1.683054, -0.9223402, 1.291171, 1, 0, 0.3490196, 1,
1.687577, 1.137183, 0.3703131, 1, 0, 0.3411765, 1,
1.697841, -2.048613, 1.082854, 1, 0, 0.3372549, 1,
1.705894, 0.1411633, 2.609118, 1, 0, 0.3294118, 1,
1.706471, 0.7786611, 0.01183893, 1, 0, 0.3254902, 1,
1.720997, -0.5544844, -0.4162076, 1, 0, 0.3176471, 1,
1.732657, 1.037384, 1.842722, 1, 0, 0.3137255, 1,
1.738739, -1.42363, 2.749762, 1, 0, 0.3058824, 1,
1.748012, 0.1508472, 1.96728, 1, 0, 0.2980392, 1,
1.751321, 0.3641037, 2.738832, 1, 0, 0.2941177, 1,
1.753875, 0.3800462, 2.647316, 1, 0, 0.2862745, 1,
1.762045, 0.2326626, 2.17989, 1, 0, 0.282353, 1,
1.766589, -2.43794, 3.103559, 1, 0, 0.2745098, 1,
1.790879, 1.025568, 1.033162, 1, 0, 0.2705882, 1,
1.804354, -1.010542, 1.771567, 1, 0, 0.2627451, 1,
1.812279, 1.579998, 1.249141, 1, 0, 0.2588235, 1,
1.839071, -2.079555, 3.43831, 1, 0, 0.2509804, 1,
1.84187, 0.01419002, 2.437595, 1, 0, 0.2470588, 1,
1.847444, 1.064843, 2.415463, 1, 0, 0.2392157, 1,
1.847953, -0.7857677, 3.425356, 1, 0, 0.2352941, 1,
1.869143, 0.8780664, 0.2424735, 1, 0, 0.227451, 1,
1.873418, -0.4525366, 0.5384178, 1, 0, 0.2235294, 1,
1.895678, 1.973982, -0.6290502, 1, 0, 0.2156863, 1,
1.89578, 0.2589507, 1.097847, 1, 0, 0.2117647, 1,
1.945624, 0.4517283, 1.754336, 1, 0, 0.2039216, 1,
1.956213, -1.938238, 3.882567, 1, 0, 0.1960784, 1,
1.976208, -0.7761082, 2.892354, 1, 0, 0.1921569, 1,
1.97733, 0.05483807, 2.482937, 1, 0, 0.1843137, 1,
1.980733, 1.056986, 1.265209, 1, 0, 0.1803922, 1,
2.026695, 1.456997, 2.027666, 1, 0, 0.172549, 1,
2.058385, 1.282421, 2.297343, 1, 0, 0.1686275, 1,
2.066724, 0.3344052, 1.763817, 1, 0, 0.1607843, 1,
2.070742, -1.601557, 3.045051, 1, 0, 0.1568628, 1,
2.118193, -0.3089198, 0.6133988, 1, 0, 0.1490196, 1,
2.125548, 0.9309513, -0.2266208, 1, 0, 0.145098, 1,
2.132869, -0.1982421, 1.888175, 1, 0, 0.1372549, 1,
2.145225, 0.1968496, 2.057644, 1, 0, 0.1333333, 1,
2.163428, -0.1785312, 2.986133, 1, 0, 0.1254902, 1,
2.16633, -0.377737, 2.049079, 1, 0, 0.1215686, 1,
2.187686, -0.2078386, 1.881078, 1, 0, 0.1137255, 1,
2.188699, -1.443178, 2.415351, 1, 0, 0.1098039, 1,
2.209747, 0.6728809, 0.5095219, 1, 0, 0.1019608, 1,
2.235856, -0.2440838, 1.855872, 1, 0, 0.09411765, 1,
2.25722, 0.2983649, 1.242539, 1, 0, 0.09019608, 1,
2.339955, -0.1526213, 2.323068, 1, 0, 0.08235294, 1,
2.356032, 0.7738686, 1.670575, 1, 0, 0.07843138, 1,
2.38234, -0.5166328, 1.252506, 1, 0, 0.07058824, 1,
2.389661, 0.003858651, -1.037805, 1, 0, 0.06666667, 1,
2.402698, 0.1562384, 1.664938, 1, 0, 0.05882353, 1,
2.647473, 1.961541, 2.505738, 1, 0, 0.05490196, 1,
2.685299, 0.8985435, 0.4196895, 1, 0, 0.04705882, 1,
2.754665, -1.417841, 2.923296, 1, 0, 0.04313726, 1,
2.785334, -0.5006744, 2.184999, 1, 0, 0.03529412, 1,
2.796009, 0.6036788, 2.44646, 1, 0, 0.03137255, 1,
2.80005, 0.3700742, 1.708861, 1, 0, 0.02352941, 1,
2.924613, -0.3263791, 0.6066387, 1, 0, 0.01960784, 1,
3.077865, -0.2471333, -0.5161945, 1, 0, 0.01176471, 1,
4.103173, 0.6436822, 0.9994126, 1, 0, 0.007843138, 1
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
0.6040457, -4.618121, -7.349308, 0, -0.5, 0.5, 0.5,
0.6040457, -4.618121, -7.349308, 1, -0.5, 0.5, 0.5,
0.6040457, -4.618121, -7.349308, 1, 1.5, 0.5, 0.5,
0.6040457, -4.618121, -7.349308, 0, 1.5, 0.5, 0.5
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
-4.081285, -0.01258516, -7.349308, 0, -0.5, 0.5, 0.5,
-4.081285, -0.01258516, -7.349308, 1, -0.5, 0.5, 0.5,
-4.081285, -0.01258516, -7.349308, 1, 1.5, 0.5, 0.5,
-4.081285, -0.01258516, -7.349308, 0, 1.5, 0.5, 0.5
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
-4.081285, -4.618121, -0.2625227, 0, -0.5, 0.5, 0.5,
-4.081285, -4.618121, -0.2625227, 1, -0.5, 0.5, 0.5,
-4.081285, -4.618121, -0.2625227, 1, 1.5, 0.5, 0.5,
-4.081285, -4.618121, -0.2625227, 0, 1.5, 0.5, 0.5
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
-2, -3.555305, -5.713896,
4, -3.555305, -5.713896,
-2, -3.555305, -5.713896,
-2, -3.732441, -5.986465,
-1, -3.555305, -5.713896,
-1, -3.732441, -5.986465,
0, -3.555305, -5.713896,
0, -3.732441, -5.986465,
1, -3.555305, -5.713896,
1, -3.732441, -5.986465,
2, -3.555305, -5.713896,
2, -3.732441, -5.986465,
3, -3.555305, -5.713896,
3, -3.732441, -5.986465,
4, -3.555305, -5.713896,
4, -3.732441, -5.986465
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
"2",
"3",
"4"
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
-2, -4.086712, -6.531602, 0, -0.5, 0.5, 0.5,
-2, -4.086712, -6.531602, 1, -0.5, 0.5, 0.5,
-2, -4.086712, -6.531602, 1, 1.5, 0.5, 0.5,
-2, -4.086712, -6.531602, 0, 1.5, 0.5, 0.5,
-1, -4.086712, -6.531602, 0, -0.5, 0.5, 0.5,
-1, -4.086712, -6.531602, 1, -0.5, 0.5, 0.5,
-1, -4.086712, -6.531602, 1, 1.5, 0.5, 0.5,
-1, -4.086712, -6.531602, 0, 1.5, 0.5, 0.5,
0, -4.086712, -6.531602, 0, -0.5, 0.5, 0.5,
0, -4.086712, -6.531602, 1, -0.5, 0.5, 0.5,
0, -4.086712, -6.531602, 1, 1.5, 0.5, 0.5,
0, -4.086712, -6.531602, 0, 1.5, 0.5, 0.5,
1, -4.086712, -6.531602, 0, -0.5, 0.5, 0.5,
1, -4.086712, -6.531602, 1, -0.5, 0.5, 0.5,
1, -4.086712, -6.531602, 1, 1.5, 0.5, 0.5,
1, -4.086712, -6.531602, 0, 1.5, 0.5, 0.5,
2, -4.086712, -6.531602, 0, -0.5, 0.5, 0.5,
2, -4.086712, -6.531602, 1, -0.5, 0.5, 0.5,
2, -4.086712, -6.531602, 1, 1.5, 0.5, 0.5,
2, -4.086712, -6.531602, 0, 1.5, 0.5, 0.5,
3, -4.086712, -6.531602, 0, -0.5, 0.5, 0.5,
3, -4.086712, -6.531602, 1, -0.5, 0.5, 0.5,
3, -4.086712, -6.531602, 1, 1.5, 0.5, 0.5,
3, -4.086712, -6.531602, 0, 1.5, 0.5, 0.5,
4, -4.086712, -6.531602, 0, -0.5, 0.5, 0.5,
4, -4.086712, -6.531602, 1, -0.5, 0.5, 0.5,
4, -4.086712, -6.531602, 1, 1.5, 0.5, 0.5,
4, -4.086712, -6.531602, 0, 1.5, 0.5, 0.5
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
-3.000055, -3, -5.713896,
-3.000055, 3, -5.713896,
-3.000055, -3, -5.713896,
-3.18026, -3, -5.986465,
-3.000055, -2, -5.713896,
-3.18026, -2, -5.986465,
-3.000055, -1, -5.713896,
-3.18026, -1, -5.986465,
-3.000055, 0, -5.713896,
-3.18026, 0, -5.986465,
-3.000055, 1, -5.713896,
-3.18026, 1, -5.986465,
-3.000055, 2, -5.713896,
-3.18026, 2, -5.986465,
-3.000055, 3, -5.713896,
-3.18026, 3, -5.986465
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
-3.54067, -3, -6.531602, 0, -0.5, 0.5, 0.5,
-3.54067, -3, -6.531602, 1, -0.5, 0.5, 0.5,
-3.54067, -3, -6.531602, 1, 1.5, 0.5, 0.5,
-3.54067, -3, -6.531602, 0, 1.5, 0.5, 0.5,
-3.54067, -2, -6.531602, 0, -0.5, 0.5, 0.5,
-3.54067, -2, -6.531602, 1, -0.5, 0.5, 0.5,
-3.54067, -2, -6.531602, 1, 1.5, 0.5, 0.5,
-3.54067, -2, -6.531602, 0, 1.5, 0.5, 0.5,
-3.54067, -1, -6.531602, 0, -0.5, 0.5, 0.5,
-3.54067, -1, -6.531602, 1, -0.5, 0.5, 0.5,
-3.54067, -1, -6.531602, 1, 1.5, 0.5, 0.5,
-3.54067, -1, -6.531602, 0, 1.5, 0.5, 0.5,
-3.54067, 0, -6.531602, 0, -0.5, 0.5, 0.5,
-3.54067, 0, -6.531602, 1, -0.5, 0.5, 0.5,
-3.54067, 0, -6.531602, 1, 1.5, 0.5, 0.5,
-3.54067, 0, -6.531602, 0, 1.5, 0.5, 0.5,
-3.54067, 1, -6.531602, 0, -0.5, 0.5, 0.5,
-3.54067, 1, -6.531602, 1, -0.5, 0.5, 0.5,
-3.54067, 1, -6.531602, 1, 1.5, 0.5, 0.5,
-3.54067, 1, -6.531602, 0, 1.5, 0.5, 0.5,
-3.54067, 2, -6.531602, 0, -0.5, 0.5, 0.5,
-3.54067, 2, -6.531602, 1, -0.5, 0.5, 0.5,
-3.54067, 2, -6.531602, 1, 1.5, 0.5, 0.5,
-3.54067, 2, -6.531602, 0, 1.5, 0.5, 0.5,
-3.54067, 3, -6.531602, 0, -0.5, 0.5, 0.5,
-3.54067, 3, -6.531602, 1, -0.5, 0.5, 0.5,
-3.54067, 3, -6.531602, 1, 1.5, 0.5, 0.5,
-3.54067, 3, -6.531602, 0, 1.5, 0.5, 0.5
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
-3.000055, -3.555305, -4,
-3.000055, -3.555305, 4,
-3.000055, -3.555305, -4,
-3.18026, -3.732441, -4,
-3.000055, -3.555305, -2,
-3.18026, -3.732441, -2,
-3.000055, -3.555305, 0,
-3.18026, -3.732441, 0,
-3.000055, -3.555305, 2,
-3.18026, -3.732441, 2,
-3.000055, -3.555305, 4,
-3.18026, -3.732441, 4
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
-3.54067, -4.086712, -4, 0, -0.5, 0.5, 0.5,
-3.54067, -4.086712, -4, 1, -0.5, 0.5, 0.5,
-3.54067, -4.086712, -4, 1, 1.5, 0.5, 0.5,
-3.54067, -4.086712, -4, 0, 1.5, 0.5, 0.5,
-3.54067, -4.086712, -2, 0, -0.5, 0.5, 0.5,
-3.54067, -4.086712, -2, 1, -0.5, 0.5, 0.5,
-3.54067, -4.086712, -2, 1, 1.5, 0.5, 0.5,
-3.54067, -4.086712, -2, 0, 1.5, 0.5, 0.5,
-3.54067, -4.086712, 0, 0, -0.5, 0.5, 0.5,
-3.54067, -4.086712, 0, 1, -0.5, 0.5, 0.5,
-3.54067, -4.086712, 0, 1, 1.5, 0.5, 0.5,
-3.54067, -4.086712, 0, 0, 1.5, 0.5, 0.5,
-3.54067, -4.086712, 2, 0, -0.5, 0.5, 0.5,
-3.54067, -4.086712, 2, 1, -0.5, 0.5, 0.5,
-3.54067, -4.086712, 2, 1, 1.5, 0.5, 0.5,
-3.54067, -4.086712, 2, 0, 1.5, 0.5, 0.5,
-3.54067, -4.086712, 4, 0, -0.5, 0.5, 0.5,
-3.54067, -4.086712, 4, 1, -0.5, 0.5, 0.5,
-3.54067, -4.086712, 4, 1, 1.5, 0.5, 0.5,
-3.54067, -4.086712, 4, 0, 1.5, 0.5, 0.5
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
-3.000055, -3.555305, -5.713896,
-3.000055, 3.530134, -5.713896,
-3.000055, -3.555305, 5.188851,
-3.000055, 3.530134, 5.188851,
-3.000055, -3.555305, -5.713896,
-3.000055, -3.555305, 5.188851,
-3.000055, 3.530134, -5.713896,
-3.000055, 3.530134, 5.188851,
-3.000055, -3.555305, -5.713896,
4.208147, -3.555305, -5.713896,
-3.000055, -3.555305, 5.188851,
4.208147, -3.555305, 5.188851,
-3.000055, 3.530134, -5.713896,
4.208147, 3.530134, -5.713896,
-3.000055, 3.530134, 5.188851,
4.208147, 3.530134, 5.188851,
4.208147, -3.555305, -5.713896,
4.208147, 3.530134, -5.713896,
4.208147, -3.555305, 5.188851,
4.208147, 3.530134, 5.188851,
4.208147, -3.555305, -5.713896,
4.208147, -3.555305, 5.188851,
4.208147, 3.530134, -5.713896,
4.208147, 3.530134, 5.188851
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
var radius = 7.938758;
var distance = 35.32043;
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
mvMatrix.translate( -0.6040457, 0.01258516, 0.2625227 );
mvMatrix.scale( 1.190802, 1.211434, 0.7872823 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.32043);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
SO2NH2Cl<-read.table("SO2NH2Cl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-SO2NH2Cl$V2
```

```
## Error in eval(expr, envir, enclos): object 'SO2NH2Cl' not found
```

```r
y<-SO2NH2Cl$V3
```

```
## Error in eval(expr, envir, enclos): object 'SO2NH2Cl' not found
```

```r
z<-SO2NH2Cl$V4
```

```
## Error in eval(expr, envir, enclos): object 'SO2NH2Cl' not found
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
-2.895081, -1.160604, -2.190049, 0, 0, 1, 1, 1,
-2.775136, 0.725493, -1.286837, 1, 0, 0, 1, 1,
-2.694078, 0.7293065, 0.5591194, 1, 0, 0, 1, 1,
-2.505892, -1.053824, -1.958687, 1, 0, 0, 1, 1,
-2.388072, 1.521763, 0.9961752, 1, 0, 0, 1, 1,
-2.329075, -0.3954062, -0.2248393, 1, 0, 0, 1, 1,
-2.315194, -1.407208, -0.9009321, 0, 0, 0, 1, 1,
-2.302196, -1.982471, -1.89013, 0, 0, 0, 1, 1,
-2.225825, -0.2214418, -1.873697, 0, 0, 0, 1, 1,
-2.223074, 0.7527568, -1.200559, 0, 0, 0, 1, 1,
-2.171219, 1.355187, -0.7272763, 0, 0, 0, 1, 1,
-2.040158, -0.356397, -1.802861, 0, 0, 0, 1, 1,
-2.027802, -0.917327, -3.136311, 0, 0, 0, 1, 1,
-2.016608, -0.1949693, -1.820869, 1, 1, 1, 1, 1,
-1.987885, -1.854681, -3.598876, 1, 1, 1, 1, 1,
-1.97136, -0.3700336, -1.70665, 1, 1, 1, 1, 1,
-1.942087, -1.559285, -2.480217, 1, 1, 1, 1, 1,
-1.936117, 0.156293, -1.06463, 1, 1, 1, 1, 1,
-1.924142, 0.8248085, -0.9356458, 1, 1, 1, 1, 1,
-1.904604, -1.346912, -1.956502, 1, 1, 1, 1, 1,
-1.887053, 0.3699863, -0.4057271, 1, 1, 1, 1, 1,
-1.880498, 0.06098742, -0.9913955, 1, 1, 1, 1, 1,
-1.855116, -0.05979035, -1.012935, 1, 1, 1, 1, 1,
-1.828189, 0.6254821, -2.156798, 1, 1, 1, 1, 1,
-1.824109, 0.6892394, -1.214976, 1, 1, 1, 1, 1,
-1.823993, 1.725976, -1.83789, 1, 1, 1, 1, 1,
-1.819592, -0.7609484, -2.78247, 1, 1, 1, 1, 1,
-1.805243, 1.372135, -1.231545, 1, 1, 1, 1, 1,
-1.798229, -2.08625, -2.793589, 0, 0, 1, 1, 1,
-1.794791, 1.332891, -1.38919, 1, 0, 0, 1, 1,
-1.790309, -0.04378869, -1.950159, 1, 0, 0, 1, 1,
-1.788209, -0.03631383, -2.217221, 1, 0, 0, 1, 1,
-1.783747, -1.174592, -0.1747839, 1, 0, 0, 1, 1,
-1.77393, 1.319071, -0.8323461, 1, 0, 0, 1, 1,
-1.751776, -1.068803, -1.5524, 0, 0, 0, 1, 1,
-1.739756, -0.2390567, 0.3875575, 0, 0, 0, 1, 1,
-1.722785, 0.8071446, -0.7928693, 0, 0, 0, 1, 1,
-1.705422, -0.5277556, -2.894305, 0, 0, 0, 1, 1,
-1.700299, -1.061682, -2.41315, 0, 0, 0, 1, 1,
-1.699745, -0.7448662, -0.5518921, 0, 0, 0, 1, 1,
-1.698923, 0.202345, -0.5961162, 0, 0, 0, 1, 1,
-1.6724, 2.129787, -0.2082039, 1, 1, 1, 1, 1,
-1.670073, -0.5064299, -2.795225, 1, 1, 1, 1, 1,
-1.65298, -1.670746, -3.543014, 1, 1, 1, 1, 1,
-1.652214, -1.161571, -3.163738, 1, 1, 1, 1, 1,
-1.643188, 0.5090868, -1.529668, 1, 1, 1, 1, 1,
-1.64245, 0.8860335, -1.259649, 1, 1, 1, 1, 1,
-1.637912, 1.19101, -0.5064356, 1, 1, 1, 1, 1,
-1.62359, 1.26825, -1.642854, 1, 1, 1, 1, 1,
-1.62147, -0.272983, -1.349569, 1, 1, 1, 1, 1,
-1.616901, -0.1734737, -0.9227358, 1, 1, 1, 1, 1,
-1.6127, 1.986681, 0.07481597, 1, 1, 1, 1, 1,
-1.606519, -0.6532086, -1.593873, 1, 1, 1, 1, 1,
-1.602234, 2.087271, -0.3869442, 1, 1, 1, 1, 1,
-1.591659, 0.4449347, -1.280334, 1, 1, 1, 1, 1,
-1.590967, 1.776432, 0.132009, 1, 1, 1, 1, 1,
-1.589421, -0.5216307, -0.5975843, 0, 0, 1, 1, 1,
-1.58272, 1.508189, -0.3026083, 1, 0, 0, 1, 1,
-1.574739, 1.411736, -0.9690813, 1, 0, 0, 1, 1,
-1.563326, 0.4047545, -0.2245522, 1, 0, 0, 1, 1,
-1.562851, 0.8169513, -1.000873, 1, 0, 0, 1, 1,
-1.551154, -0.873787, -2.861527, 1, 0, 0, 1, 1,
-1.550335, 0.6241126, 0.1915857, 0, 0, 0, 1, 1,
-1.54881, 0.8412985, -2.214162, 0, 0, 0, 1, 1,
-1.540716, -0.6057345, -1.038046, 0, 0, 0, 1, 1,
-1.523918, 0.2092961, -1.013652, 0, 0, 0, 1, 1,
-1.512394, -0.05767028, -2.119958, 0, 0, 0, 1, 1,
-1.509281, 0.2431028, -1.410917, 0, 0, 0, 1, 1,
-1.499373, 0.8363334, -2.580072, 0, 0, 0, 1, 1,
-1.495853, 0.2690569, -2.936488, 1, 1, 1, 1, 1,
-1.489075, -1.12795, -2.074002, 1, 1, 1, 1, 1,
-1.484283, 2.058643, 0.4128164, 1, 1, 1, 1, 1,
-1.474129, -2.212852, -2.177236, 1, 1, 1, 1, 1,
-1.469073, -0.4004481, -1.354616, 1, 1, 1, 1, 1,
-1.468574, 0.5810367, -2.698672, 1, 1, 1, 1, 1,
-1.458686, -0.5261107, -0.9226959, 1, 1, 1, 1, 1,
-1.448797, -1.479079, -0.486567, 1, 1, 1, 1, 1,
-1.435573, -0.3613925, -1.563729, 1, 1, 1, 1, 1,
-1.434223, -1.736417, -4.518893, 1, 1, 1, 1, 1,
-1.43272, -0.7288967, -0.6814103, 1, 1, 1, 1, 1,
-1.431204, -0.45807, -2.524835, 1, 1, 1, 1, 1,
-1.430699, -0.7006623, -0.8102669, 1, 1, 1, 1, 1,
-1.421311, -1.670572, -2.749646, 1, 1, 1, 1, 1,
-1.396742, -1.227442, -2.074976, 1, 1, 1, 1, 1,
-1.393628, -0.3774048, -3.241288, 0, 0, 1, 1, 1,
-1.393091, -0.7061176, -0.9466277, 1, 0, 0, 1, 1,
-1.3906, -0.008939059, -0.03826981, 1, 0, 0, 1, 1,
-1.388304, -0.5035364, -1.222901, 1, 0, 0, 1, 1,
-1.387057, 2.683308, -0.5604466, 1, 0, 0, 1, 1,
-1.380495, -2.0276, -3.374356, 1, 0, 0, 1, 1,
-1.379649, -1.442706, -3.2147, 0, 0, 0, 1, 1,
-1.367323, 0.2306553, -2.643994, 0, 0, 0, 1, 1,
-1.363138, 0.6682261, -1.375747, 0, 0, 0, 1, 1,
-1.357853, 0.9708472, -1.257663, 0, 0, 0, 1, 1,
-1.355278, -0.8495574, -2.9551, 0, 0, 0, 1, 1,
-1.355093, -0.06301749, -1.394059, 0, 0, 0, 1, 1,
-1.350161, -0.3393999, -2.088352, 0, 0, 0, 1, 1,
-1.342904, -2.132502, -4.072794, 1, 1, 1, 1, 1,
-1.330299, 1.050462, -1.423856, 1, 1, 1, 1, 1,
-1.324335, 0.5461558, -0.05319291, 1, 1, 1, 1, 1,
-1.324324, 0.8756079, -1.007877, 1, 1, 1, 1, 1,
-1.323567, 0.4693238, -1.815698, 1, 1, 1, 1, 1,
-1.308469, 0.7007852, -1.958148, 1, 1, 1, 1, 1,
-1.289459, -0.2372342, -2.093278, 1, 1, 1, 1, 1,
-1.289439, 0.09631053, 0.8450235, 1, 1, 1, 1, 1,
-1.288833, -0.6306509, -0.9152198, 1, 1, 1, 1, 1,
-1.286235, -0.6672964, -1.059241, 1, 1, 1, 1, 1,
-1.28281, -0.6555064, -1.407177, 1, 1, 1, 1, 1,
-1.271411, 1.151745, -0.7686735, 1, 1, 1, 1, 1,
-1.267345, 1.211691, -1.51826, 1, 1, 1, 1, 1,
-1.265452, -0.3625494, -1.504846, 1, 1, 1, 1, 1,
-1.260183, 1.110387, -0.07321631, 1, 1, 1, 1, 1,
-1.25714, 0.008449734, -1.773584, 0, 0, 1, 1, 1,
-1.231885, -1.98811, -1.48385, 1, 0, 0, 1, 1,
-1.222072, 1.30765, 0.214937, 1, 0, 0, 1, 1,
-1.220716, 0.1867443, -1.488544, 1, 0, 0, 1, 1,
-1.218222, -2.010542, -1.875549, 1, 0, 0, 1, 1,
-1.213, -0.7967225, -1.887879, 1, 0, 0, 1, 1,
-1.210273, -1.602241, -1.758191, 0, 0, 0, 1, 1,
-1.203964, -0.2408023, -0.6474399, 0, 0, 0, 1, 1,
-1.199674, -2.100489, -1.830105, 0, 0, 0, 1, 1,
-1.198181, 0.1854916, -1.731411, 0, 0, 0, 1, 1,
-1.19576, -0.01626366, -2.749197, 0, 0, 0, 1, 1,
-1.190924, 0.4857413, -0.4792119, 0, 0, 0, 1, 1,
-1.190095, 2.091605, 0.9577867, 0, 0, 0, 1, 1,
-1.188254, 0.4201989, -2.043699, 1, 1, 1, 1, 1,
-1.18769, 0.5379683, -1.149188, 1, 1, 1, 1, 1,
-1.18073, 0.3926977, -0.02336756, 1, 1, 1, 1, 1,
-1.179904, 0.9634321, -0.2805838, 1, 1, 1, 1, 1,
-1.175619, -0.6407888, -1.18791, 1, 1, 1, 1, 1,
-1.174373, 0.2261795, -0.2818741, 1, 1, 1, 1, 1,
-1.172423, -0.4642185, -0.4358135, 1, 1, 1, 1, 1,
-1.167694, 1.220734, -0.4904888, 1, 1, 1, 1, 1,
-1.158243, 0.5412851, -0.4808946, 1, 1, 1, 1, 1,
-1.147125, -0.0456282, -1.167531, 1, 1, 1, 1, 1,
-1.146486, -0.4806719, -1.615814, 1, 1, 1, 1, 1,
-1.143665, 0.658597, 0.622228, 1, 1, 1, 1, 1,
-1.125112, -0.2807974, -3.058341, 1, 1, 1, 1, 1,
-1.111376, -0.4763907, -0.9201577, 1, 1, 1, 1, 1,
-1.107158, -0.4225736, -1.758617, 1, 1, 1, 1, 1,
-1.106057, 0.1373949, -2.700865, 0, 0, 1, 1, 1,
-1.098959, 1.408386, -0.3469577, 1, 0, 0, 1, 1,
-1.084771, -0.7777693, -2.421391, 1, 0, 0, 1, 1,
-1.06191, -2.450873, -4.851022, 1, 0, 0, 1, 1,
-1.059157, 1.180208, -1.534601, 1, 0, 0, 1, 1,
-1.05771, 1.261279, 0.5815976, 1, 0, 0, 1, 1,
-1.057536, -0.2108697, -1.200546, 0, 0, 0, 1, 1,
-1.055427, -0.4968082, -3.403104, 0, 0, 0, 1, 1,
-1.052305, -0.02505726, -2.84543, 0, 0, 0, 1, 1,
-1.050547, 1.640489, -0.4222219, 0, 0, 0, 1, 1,
-1.037788, -1.737849, -2.074337, 0, 0, 0, 1, 1,
-1.03104, 0.7522205, 0.8339955, 0, 0, 0, 1, 1,
-1.028191, 0.4304301, 0.00695518, 0, 0, 0, 1, 1,
-1.027745, -1.278846, -2.999296, 1, 1, 1, 1, 1,
-1.025091, 0.3418663, -1.837897, 1, 1, 1, 1, 1,
-1.024632, 1.720592, -1.315687, 1, 1, 1, 1, 1,
-1.020185, 1.227433, -0.6756543, 1, 1, 1, 1, 1,
-1.016297, -0.4352824, -2.614846, 1, 1, 1, 1, 1,
-1.013812, -1.037827, -3.101378, 1, 1, 1, 1, 1,
-1.0125, 0.0874932, -2.217705, 1, 1, 1, 1, 1,
-1.010384, -0.2494648, -2.679613, 1, 1, 1, 1, 1,
-1.0082, -1.577741, -3.438742, 1, 1, 1, 1, 1,
-1.003531, 1.293268, -1.061816, 1, 1, 1, 1, 1,
-1.002263, 2.213049, -0.6141512, 1, 1, 1, 1, 1,
-0.990829, -0.1791132, -0.7645867, 1, 1, 1, 1, 1,
-0.9765676, 1.241974, 2.076327, 1, 1, 1, 1, 1,
-0.9751269, 0.3859692, -1.648626, 1, 1, 1, 1, 1,
-0.9735109, 0.1053134, -0.03019524, 1, 1, 1, 1, 1,
-0.9669231, -0.8420701, -2.592652, 0, 0, 1, 1, 1,
-0.9650522, 0.5534055, -0.8172443, 1, 0, 0, 1, 1,
-0.9574763, 0.1567234, -0.7173414, 1, 0, 0, 1, 1,
-0.9477494, 0.8311835, 0.09636471, 1, 0, 0, 1, 1,
-0.9474857, 1.066652, -0.4239776, 1, 0, 0, 1, 1,
-0.9461991, -0.3143278, -1.042449, 1, 0, 0, 1, 1,
-0.941366, -1.2611, -2.746659, 0, 0, 0, 1, 1,
-0.9368253, 0.9529929, 0.437771, 0, 0, 0, 1, 1,
-0.9260762, 0.2741676, -0.7656203, 0, 0, 0, 1, 1,
-0.9225521, 0.5211648, -1.427675, 0, 0, 0, 1, 1,
-0.9182493, -0.09644006, -0.7312976, 0, 0, 0, 1, 1,
-0.9159389, -1.188799, -2.197723, 0, 0, 0, 1, 1,
-0.9149091, 0.2925247, -0.5485687, 0, 0, 0, 1, 1,
-0.9118441, -2.313017, -1.914739, 1, 1, 1, 1, 1,
-0.9079449, 1.903437, 1.898373, 1, 1, 1, 1, 1,
-0.9063641, 0.1936232, -2.247223, 1, 1, 1, 1, 1,
-0.9049731, -2.161554, -2.846993, 1, 1, 1, 1, 1,
-0.8992181, -0.9452883, -3.632529, 1, 1, 1, 1, 1,
-0.8891885, 1.00369, -1.264853, 1, 1, 1, 1, 1,
-0.8842937, -0.08928806, -2.252275, 1, 1, 1, 1, 1,
-0.8804489, 1.762725, -0.3337361, 1, 1, 1, 1, 1,
-0.8796817, 0.1140101, -1.020145, 1, 1, 1, 1, 1,
-0.8776438, -0.1369897, -1.548296, 1, 1, 1, 1, 1,
-0.8753747, 0.8215781, -2.186779, 1, 1, 1, 1, 1,
-0.8555812, 1.455069, 0.7495607, 1, 1, 1, 1, 1,
-0.8515603, 0.2478716, -1.968454, 1, 1, 1, 1, 1,
-0.8513626, -0.908655, -1.127264, 1, 1, 1, 1, 1,
-0.8503332, -0.3579735, -0.9538875, 1, 1, 1, 1, 1,
-0.8395833, -0.4604851, -3.383927, 0, 0, 1, 1, 1,
-0.8377072, -0.4549203, -0.4613656, 1, 0, 0, 1, 1,
-0.8335124, -0.8295925, -1.613177, 1, 0, 0, 1, 1,
-0.8278263, -0.5171444, -1.611751, 1, 0, 0, 1, 1,
-0.8253915, 0.5936298, -0.7768217, 1, 0, 0, 1, 1,
-0.8177919, -1.280866, -1.194345, 1, 0, 0, 1, 1,
-0.8171606, 1.07357, -0.2039237, 0, 0, 0, 1, 1,
-0.8153431, 0.996038, -1.757148, 0, 0, 0, 1, 1,
-0.8147845, -1.22481, -2.991946, 0, 0, 0, 1, 1,
-0.8143825, -0.8091357, -1.579329, 0, 0, 0, 1, 1,
-0.8129325, -0.419129, -2.127325, 0, 0, 0, 1, 1,
-0.8104941, -0.3780031, -2.597425, 0, 0, 0, 1, 1,
-0.807756, 0.02515109, -1.159082, 0, 0, 0, 1, 1,
-0.8055003, 0.04784786, -2.136736, 1, 1, 1, 1, 1,
-0.8032923, 0.7075616, -0.02627356, 1, 1, 1, 1, 1,
-0.7969586, 0.04464989, -0.223728, 1, 1, 1, 1, 1,
-0.7921079, -0.363751, -2.419776, 1, 1, 1, 1, 1,
-0.7911273, 2.526657, -0.6490377, 1, 1, 1, 1, 1,
-0.7862027, 0.01687588, -1.332738, 1, 1, 1, 1, 1,
-0.7846631, -1.185738, -2.407186, 1, 1, 1, 1, 1,
-0.7837377, 0.4365672, -2.372125, 1, 1, 1, 1, 1,
-0.7823154, -1.704944, -2.198538, 1, 1, 1, 1, 1,
-0.7784076, -1.060804, -2.214115, 1, 1, 1, 1, 1,
-0.7748567, 0.04584337, 0.1350899, 1, 1, 1, 1, 1,
-0.7707078, 0.6002767, -2.936286, 1, 1, 1, 1, 1,
-0.7677529, -1.103591, -2.361438, 1, 1, 1, 1, 1,
-0.767745, 1.681953, -2.880011, 1, 1, 1, 1, 1,
-0.7660093, -0.735107, -3.040165, 1, 1, 1, 1, 1,
-0.7645765, -0.9411107, -2.604123, 0, 0, 1, 1, 1,
-0.764273, 0.5199594, -1.009465, 1, 0, 0, 1, 1,
-0.7629554, -0.4048199, -4.390939, 1, 0, 0, 1, 1,
-0.7615733, -1.160848, -4.024463, 1, 0, 0, 1, 1,
-0.7549149, 1.515464, -1.481862, 1, 0, 0, 1, 1,
-0.7545708, 0.87518, -1.443466, 1, 0, 0, 1, 1,
-0.7541822, -0.6014023, -3.644037, 0, 0, 0, 1, 1,
-0.7531721, -0.1844859, -0.3659335, 0, 0, 0, 1, 1,
-0.7477189, -0.7925491, -2.848944, 0, 0, 0, 1, 1,
-0.7418218, -0.5239544, -2.680846, 0, 0, 0, 1, 1,
-0.7405913, -0.8643132, -2.227407, 0, 0, 0, 1, 1,
-0.7192078, 0.1055543, -1.476256, 0, 0, 0, 1, 1,
-0.7179847, 0.1425306, -2.493213, 0, 0, 0, 1, 1,
-0.7121512, -0.5771473, -2.898032, 1, 1, 1, 1, 1,
-0.7096195, -1.509456, -2.24125, 1, 1, 1, 1, 1,
-0.7021847, -0.5035805, -3.731927, 1, 1, 1, 1, 1,
-0.7002973, -0.875528, -3.537373, 1, 1, 1, 1, 1,
-0.6982905, 0.002516028, -0.5804656, 1, 1, 1, 1, 1,
-0.6943826, -0.2295079, -2.15728, 1, 1, 1, 1, 1,
-0.6935261, 0.05285941, -1.935448, 1, 1, 1, 1, 1,
-0.6934645, -0.6678063, -1.988475, 1, 1, 1, 1, 1,
-0.6864914, -1.235172, -2.491331, 1, 1, 1, 1, 1,
-0.6863996, -1.314815, -3.231372, 1, 1, 1, 1, 1,
-0.684348, -1.966834, -4.37, 1, 1, 1, 1, 1,
-0.6744982, 0.5357691, -1.479629, 1, 1, 1, 1, 1,
-0.6679943, 0.9420643, 0.66572, 1, 1, 1, 1, 1,
-0.6674101, -0.4087259, -1.558648, 1, 1, 1, 1, 1,
-0.6670662, 0.4153509, -1.833057, 1, 1, 1, 1, 1,
-0.664995, 0.2110835, -0.7687319, 0, 0, 1, 1, 1,
-0.6611639, 0.8137349, -2.022097, 1, 0, 0, 1, 1,
-0.65716, -1.0246, -1.076829, 1, 0, 0, 1, 1,
-0.653089, 0.8603265, 0.6515181, 1, 0, 0, 1, 1,
-0.6523286, -1.003833, -2.228609, 1, 0, 0, 1, 1,
-0.650177, -0.9455947, -1.856212, 1, 0, 0, 1, 1,
-0.6482568, 1.211666, -0.28271, 0, 0, 0, 1, 1,
-0.6462823, 1.178666, 0.1546606, 0, 0, 0, 1, 1,
-0.6425618, -0.8451241, -4.11423, 0, 0, 0, 1, 1,
-0.639928, 0.9785279, -0.4922728, 0, 0, 0, 1, 1,
-0.633236, 0.2559946, -2.296133, 0, 0, 0, 1, 1,
-0.6319641, 0.1703527, -2.284926, 0, 0, 0, 1, 1,
-0.6249585, 0.432045, -0.7709323, 0, 0, 0, 1, 1,
-0.6170154, -0.5700431, -0.7311258, 1, 1, 1, 1, 1,
-0.6065823, 1.185038, -2.357853, 1, 1, 1, 1, 1,
-0.6010676, 1.083057, 0.9455503, 1, 1, 1, 1, 1,
-0.5999541, 0.8416258, 0.9540812, 1, 1, 1, 1, 1,
-0.5936162, 0.07679247, -1.430431, 1, 1, 1, 1, 1,
-0.5927493, -0.09724834, -1.653792, 1, 1, 1, 1, 1,
-0.5896283, -0.5144147, -3.706104, 1, 1, 1, 1, 1,
-0.5784941, 0.8197213, 0.1225351, 1, 1, 1, 1, 1,
-0.5744729, 0.3690453, -0.3665301, 1, 1, 1, 1, 1,
-0.5723329, -0.0959101, -2.263846, 1, 1, 1, 1, 1,
-0.5707592, 0.2194192, -0.8078422, 1, 1, 1, 1, 1,
-0.5683569, -0.3660179, -3.802788, 1, 1, 1, 1, 1,
-0.5670363, 0.4898578, 0.3551239, 1, 1, 1, 1, 1,
-0.5636439, 3.142025, -0.2564589, 1, 1, 1, 1, 1,
-0.5627575, 0.1518908, -0.8985366, 1, 1, 1, 1, 1,
-0.5566317, 2.7973, -1.092008, 0, 0, 1, 1, 1,
-0.5522992, 1.58013, 0.9064517, 1, 0, 0, 1, 1,
-0.552083, 1.637197, -1.611182, 1, 0, 0, 1, 1,
-0.5479522, 0.1376023, -1.394476, 1, 0, 0, 1, 1,
-0.5423066, -0.1776514, -3.210904, 1, 0, 0, 1, 1,
-0.5384642, -0.6783605, -2.705853, 1, 0, 0, 1, 1,
-0.5330528, 0.5388827, -1.257493, 0, 0, 0, 1, 1,
-0.5328532, -2.398552, 0.1295985, 0, 0, 0, 1, 1,
-0.5325045, 1.740674, -0.2565297, 0, 0, 0, 1, 1,
-0.528766, -1.406952, -2.292147, 0, 0, 0, 1, 1,
-0.5261978, 1.157326, 0.5829369, 0, 0, 0, 1, 1,
-0.522772, -0.1723236, -1.534216, 0, 0, 0, 1, 1,
-0.51314, -0.6561614, -0.811855, 0, 0, 0, 1, 1,
-0.5111833, 1.231972, -1.216311, 1, 1, 1, 1, 1,
-0.5109256, -1.356202, -3.579474, 1, 1, 1, 1, 1,
-0.5099829, -0.01669557, -1.200281, 1, 1, 1, 1, 1,
-0.5034316, -0.7563819, -2.358063, 1, 1, 1, 1, 1,
-0.5033541, -0.2454022, -0.2431246, 1, 1, 1, 1, 1,
-0.4980454, -1.304536, -3.284536, 1, 1, 1, 1, 1,
-0.4980292, 0.07482783, 0.6095184, 1, 1, 1, 1, 1,
-0.4972005, 0.1349396, -2.080476, 1, 1, 1, 1, 1,
-0.4918633, 1.246188, 0.4949293, 1, 1, 1, 1, 1,
-0.4842747, -1.64788, -3.885779, 1, 1, 1, 1, 1,
-0.4797687, -0.04118165, -2.885428, 1, 1, 1, 1, 1,
-0.4784859, -1.483093, -4.100624, 1, 1, 1, 1, 1,
-0.4739363, -1.18133, -3.288053, 1, 1, 1, 1, 1,
-0.4716474, 0.7570488, -2.766536, 1, 1, 1, 1, 1,
-0.4680857, 0.8614947, -1.106789, 1, 1, 1, 1, 1,
-0.466155, -1.71043, -3.950304, 0, 0, 1, 1, 1,
-0.4638543, -2.351932, -2.137928, 1, 0, 0, 1, 1,
-0.4634548, -0.9848337, -2.011124, 1, 0, 0, 1, 1,
-0.4620754, -1.138021, -2.448805, 1, 0, 0, 1, 1,
-0.4560902, -0.0467964, -1.292918, 1, 0, 0, 1, 1,
-0.4548742, 0.8268825, -1.255941, 1, 0, 0, 1, 1,
-0.4519492, 1.012566, -0.330801, 0, 0, 0, 1, 1,
-0.4513151, 0.5597786, -1.758215, 0, 0, 0, 1, 1,
-0.441788, 0.602372, -0.03818569, 0, 0, 0, 1, 1,
-0.4394726, 0.09121203, 0.03018085, 0, 0, 0, 1, 1,
-0.4385386, -0.7043967, -1.079431, 0, 0, 0, 1, 1,
-0.437405, -2.481843, -3.190573, 0, 0, 0, 1, 1,
-0.4363649, -0.4926761, -1.719654, 0, 0, 0, 1, 1,
-0.4348859, 1.666245, 0.230174, 1, 1, 1, 1, 1,
-0.4327383, 0.3067211, -0.2224962, 1, 1, 1, 1, 1,
-0.4303085, -2.287126, -3.323419, 1, 1, 1, 1, 1,
-0.4280037, -0.2471289, -2.383856, 1, 1, 1, 1, 1,
-0.4255475, 0.2764907, 0.1699503, 1, 1, 1, 1, 1,
-0.4227604, 0.6678001, 0.1213638, 1, 1, 1, 1, 1,
-0.415467, 0.5935462, -0.5559872, 1, 1, 1, 1, 1,
-0.4092665, -0.5132979, -3.204971, 1, 1, 1, 1, 1,
-0.409207, -1.707606, -3.255582, 1, 1, 1, 1, 1,
-0.4021426, 0.4585069, -1.187575, 1, 1, 1, 1, 1,
-0.3976412, -0.2752698, -2.062417, 1, 1, 1, 1, 1,
-0.3968259, -0.01267604, -1.353139, 1, 1, 1, 1, 1,
-0.3948059, -1.667359, -2.069233, 1, 1, 1, 1, 1,
-0.3897855, 1.750807, -2.009793, 1, 1, 1, 1, 1,
-0.3879837, 0.9278393, -1.440179, 1, 1, 1, 1, 1,
-0.3859885, 1.274312, 0.09802622, 0, 0, 1, 1, 1,
-0.3848018, 1.761547, -1.280175, 1, 0, 0, 1, 1,
-0.3846532, 0.7489752, -1.68698, 1, 0, 0, 1, 1,
-0.3833051, 1.640828, -0.3702477, 1, 0, 0, 1, 1,
-0.3809385, -0.5481588, -2.248065, 1, 0, 0, 1, 1,
-0.3780264, 1.55672, -0.5911495, 1, 0, 0, 1, 1,
-0.377268, -0.02588027, -1.344818, 0, 0, 0, 1, 1,
-0.3727947, -0.3592744, -1.272426, 0, 0, 0, 1, 1,
-0.3694643, -2.295027, -2.674892, 0, 0, 0, 1, 1,
-0.3693551, -1.172389, -3.434285, 0, 0, 0, 1, 1,
-0.3665681, 1.431518, -0.5705438, 0, 0, 0, 1, 1,
-0.3571496, 0.8741347, -1.097587, 0, 0, 0, 1, 1,
-0.3549244, 1.538681, 1.602841, 0, 0, 0, 1, 1,
-0.3513201, 0.2301998, -2.330223, 1, 1, 1, 1, 1,
-0.349729, 0.01523267, -2.969239, 1, 1, 1, 1, 1,
-0.3439668, -0.484495, -1.963279, 1, 1, 1, 1, 1,
-0.3436771, -0.2346682, -2.538255, 1, 1, 1, 1, 1,
-0.341959, -0.4727602, -4.764679, 1, 1, 1, 1, 1,
-0.341262, -0.7403855, -4.313495, 1, 1, 1, 1, 1,
-0.3372173, -0.355272, -2.656433, 1, 1, 1, 1, 1,
-0.3281488, -0.5637648, -1.942418, 1, 1, 1, 1, 1,
-0.3271787, 0.07792864, -2.593259, 1, 1, 1, 1, 1,
-0.3270503, -0.5480276, -1.930305, 1, 1, 1, 1, 1,
-0.3239235, 0.746771, -0.8258804, 1, 1, 1, 1, 1,
-0.3232805, 0.2754842, -1.005678, 1, 1, 1, 1, 1,
-0.3201833, -0.245923, -1.052543, 1, 1, 1, 1, 1,
-0.3198193, -0.02166152, -0.6888502, 1, 1, 1, 1, 1,
-0.3170407, -0.3045616, -4.283085, 1, 1, 1, 1, 1,
-0.3143848, -0.7883453, -5.366036, 0, 0, 1, 1, 1,
-0.3039057, 2.034997, 0.2331429, 1, 0, 0, 1, 1,
-0.3028832, 0.8044077, 0.7260224, 1, 0, 0, 1, 1,
-0.3017195, -0.8401541, -2.228348, 1, 0, 0, 1, 1,
-0.3008627, 1.373355, -0.6520249, 1, 0, 0, 1, 1,
-0.3001971, -1.102379, -2.601599, 1, 0, 0, 1, 1,
-0.2998409, 0.05982155, -1.997792, 0, 0, 0, 1, 1,
-0.2985705, 0.6825086, -0.574396, 0, 0, 0, 1, 1,
-0.2981061, -0.01177564, -3.889521, 0, 0, 0, 1, 1,
-0.2976792, -1.778872, -3.456691, 0, 0, 0, 1, 1,
-0.2969258, 0.4811093, 0.7514285, 0, 0, 0, 1, 1,
-0.2966592, 0.8277833, 0.07989185, 0, 0, 0, 1, 1,
-0.2921615, 1.12197, -1.129331, 0, 0, 0, 1, 1,
-0.2920939, 0.5639907, -0.1958786, 1, 1, 1, 1, 1,
-0.2901317, 1.205943, -1.059009, 1, 1, 1, 1, 1,
-0.2897248, 0.1751197, -1.056198, 1, 1, 1, 1, 1,
-0.283423, -0.7017604, -2.150898, 1, 1, 1, 1, 1,
-0.2821521, -0.237398, -0.2864498, 1, 1, 1, 1, 1,
-0.2821446, 0.9663763, -1.498348, 1, 1, 1, 1, 1,
-0.2812169, -0.5615599, -2.360271, 1, 1, 1, 1, 1,
-0.2787083, -0.2923629, -2.539436, 1, 1, 1, 1, 1,
-0.2761601, -0.1553722, -2.904388, 1, 1, 1, 1, 1,
-0.2742943, -0.7612692, -5.171485, 1, 1, 1, 1, 1,
-0.2726061, 0.2274284, 0.3625223, 1, 1, 1, 1, 1,
-0.2724566, -1.049652, -2.743216, 1, 1, 1, 1, 1,
-0.2711392, 0.06682695, -1.519434, 1, 1, 1, 1, 1,
-0.2672222, 0.6478029, -0.2264106, 1, 1, 1, 1, 1,
-0.2650096, -0.5360364, -3.917913, 1, 1, 1, 1, 1,
-0.264051, 0.5557751, -0.8123398, 0, 0, 1, 1, 1,
-0.2586206, 1.308953, -0.1230192, 1, 0, 0, 1, 1,
-0.2584519, 1.374962, -0.1691548, 1, 0, 0, 1, 1,
-0.2525977, -0.6160399, -3.549346, 1, 0, 0, 1, 1,
-0.2501489, 0.05635691, -1.506447, 1, 0, 0, 1, 1,
-0.2474152, -1.852197, -2.684616, 1, 0, 0, 1, 1,
-0.2465928, -0.4300557, -1.998567, 0, 0, 0, 1, 1,
-0.2422446, 0.5756837, -0.1051794, 0, 0, 0, 1, 1,
-0.2414143, -0.8311393, -4.883474, 0, 0, 0, 1, 1,
-0.2397885, -0.7853497, -2.845119, 0, 0, 0, 1, 1,
-0.2360206, 0.4502346, -0.708559, 0, 0, 0, 1, 1,
-0.2340992, 0.2516415, -0.4041812, 0, 0, 0, 1, 1,
-0.2295577, 0.9632076, 2.248281, 0, 0, 0, 1, 1,
-0.223645, 2.083423, 0.5426373, 1, 1, 1, 1, 1,
-0.2200827, 0.2421867, -1.127445, 1, 1, 1, 1, 1,
-0.2174097, -0.5377953, -2.945904, 1, 1, 1, 1, 1,
-0.2163312, 2.657866, 0.7442642, 1, 1, 1, 1, 1,
-0.2132407, 0.1149053, -1.722576, 1, 1, 1, 1, 1,
-0.2119422, 0.4108709, -0.9655378, 1, 1, 1, 1, 1,
-0.2080796, 2.664794, 1.558496, 1, 1, 1, 1, 1,
-0.204574, -0.3765504, -3.359625, 1, 1, 1, 1, 1,
-0.20339, 1.503261, -0.4481819, 1, 1, 1, 1, 1,
-0.2014909, -0.3028803, -2.613872, 1, 1, 1, 1, 1,
-0.2012845, -2.714108, -3.440349, 1, 1, 1, 1, 1,
-0.2008264, 0.6375182, -0.03728966, 1, 1, 1, 1, 1,
-0.1982966, 0.5800242, -0.03966644, 1, 1, 1, 1, 1,
-0.1965127, -0.6608328, -2.295021, 1, 1, 1, 1, 1,
-0.1935993, 1.136866, 1.050779, 1, 1, 1, 1, 1,
-0.1925634, 0.08615921, -1.07182, 0, 0, 1, 1, 1,
-0.1912187, -2.3087, -2.046671, 1, 0, 0, 1, 1,
-0.1901674, 0.1680572, -0.9384309, 1, 0, 0, 1, 1,
-0.1893992, 1.440668, 0.4559191, 1, 0, 0, 1, 1,
-0.1890029, 0.8806688, 1.8172, 1, 0, 0, 1, 1,
-0.1886992, 0.0620124, -1.594054, 1, 0, 0, 1, 1,
-0.1885916, 1.730229, -0.1064192, 0, 0, 0, 1, 1,
-0.1862276, -0.6950529, -0.7913004, 0, 0, 0, 1, 1,
-0.1822767, -0.1954111, -1.655604, 0, 0, 0, 1, 1,
-0.182041, -1.272011, -2.133689, 0, 0, 0, 1, 1,
-0.1811423, 1.682332, 0.04864982, 0, 0, 0, 1, 1,
-0.1751397, -0.121581, -1.479895, 0, 0, 0, 1, 1,
-0.1707781, 0.9412301, -0.8815417, 0, 0, 0, 1, 1,
-0.1707374, -1.623462, -4.815613, 1, 1, 1, 1, 1,
-0.1698288, -0.6168472, -2.36017, 1, 1, 1, 1, 1,
-0.1675391, 0.6123934, 0.4342817, 1, 1, 1, 1, 1,
-0.1662166, 0.755901, -1.019139, 1, 1, 1, 1, 1,
-0.1646084, 0.20676, 0.004908689, 1, 1, 1, 1, 1,
-0.1628821, -0.1447986, -3.506106, 1, 1, 1, 1, 1,
-0.1612807, -1.938697, -2.115187, 1, 1, 1, 1, 1,
-0.1601047, 0.4015119, 0.17457, 1, 1, 1, 1, 1,
-0.1588934, 1.402611, -0.3515195, 1, 1, 1, 1, 1,
-0.1573467, 1.323811, -1.968735, 1, 1, 1, 1, 1,
-0.1491496, 1.53624, -1.734777, 1, 1, 1, 1, 1,
-0.1407956, -0.4048104, -0.757211, 1, 1, 1, 1, 1,
-0.1335412, -1.667107, -3.877915, 1, 1, 1, 1, 1,
-0.1329845, -2.691285, -5.555119, 1, 1, 1, 1, 1,
-0.1312479, 0.6977657, 0.5654531, 1, 1, 1, 1, 1,
-0.1308347, 1.834596, 0.6697859, 0, 0, 1, 1, 1,
-0.1258462, 0.3664408, 0.5685605, 1, 0, 0, 1, 1,
-0.1229796, -0.495912, -2.04989, 1, 0, 0, 1, 1,
-0.1220755, 0.7162795, 0.6387327, 1, 0, 0, 1, 1,
-0.1197781, 0.09681974, -0.1570011, 1, 0, 0, 1, 1,
-0.1179247, -0.2356617, -1.354382, 1, 0, 0, 1, 1,
-0.1146182, -0.7977994, -2.388399, 0, 0, 0, 1, 1,
-0.1113935, -2.241485, -3.506921, 0, 0, 0, 1, 1,
-0.1109172, -0.6946965, -2.964544, 0, 0, 0, 1, 1,
-0.1105338, -0.0303181, -0.9011277, 0, 0, 0, 1, 1,
-0.1096489, 0.2930695, -1.071949, 0, 0, 0, 1, 1,
-0.1090336, 0.05697764, -0.2427759, 0, 0, 0, 1, 1,
-0.1072578, 0.6544155, 0.4364059, 0, 0, 0, 1, 1,
-0.1059306, -0.121509, -2.37694, 1, 1, 1, 1, 1,
-0.1028978, 0.5409155, -1.350281, 1, 1, 1, 1, 1,
-0.1019357, 0.8960204, -1.268102, 1, 1, 1, 1, 1,
-0.1011856, -2.491115, -2.947978, 1, 1, 1, 1, 1,
-0.1003557, 1.66485, -0.6079125, 1, 1, 1, 1, 1,
-0.08257502, -1.930216, -3.807489, 1, 1, 1, 1, 1,
-0.08233705, 1.262609, -0.3658346, 1, 1, 1, 1, 1,
-0.08179942, 0.2394798, 0.5074121, 1, 1, 1, 1, 1,
-0.08101708, 0.1924789, -0.8006988, 1, 1, 1, 1, 1,
-0.08082914, 0.0981963, -1.791712, 1, 1, 1, 1, 1,
-0.07572668, 0.2389432, 1.34889, 1, 1, 1, 1, 1,
-0.07291739, 0.4537297, -0.1653022, 1, 1, 1, 1, 1,
-0.06965964, -0.07782713, -3.927911, 1, 1, 1, 1, 1,
-0.0655838, -1.234855, -3.865426, 1, 1, 1, 1, 1,
-0.06221008, 2.352467, -0.3975146, 1, 1, 1, 1, 1,
-0.05792048, -0.4051075, -3.041167, 0, 0, 1, 1, 1,
-0.05520799, 0.7565877, -0.3401994, 1, 0, 0, 1, 1,
-0.05434196, 0.2036921, -0.2295419, 1, 0, 0, 1, 1,
-0.05230146, 0.3648077, 0.8500599, 1, 0, 0, 1, 1,
-0.05144082, 1.369987, 0.2354875, 1, 0, 0, 1, 1,
-0.04249503, -0.1984569, -1.788464, 1, 0, 0, 1, 1,
-0.04113731, 0.6362832, -0.3159842, 0, 0, 0, 1, 1,
-0.03964228, -1.043608, -2.105136, 0, 0, 0, 1, 1,
-0.0357988, 0.7845522, 0.6730533, 0, 0, 0, 1, 1,
-0.0357378, 0.5252603, -2.548571, 0, 0, 0, 1, 1,
-0.03311148, -1.889566, -1.076495, 0, 0, 0, 1, 1,
-0.03252031, -0.2011958, -2.091925, 0, 0, 0, 1, 1,
-0.03167484, -0.05709192, -3.460096, 0, 0, 0, 1, 1,
-0.02998346, -0.2204551, -3.905345, 1, 1, 1, 1, 1,
-0.02822746, 1.797959, 0.02814697, 1, 1, 1, 1, 1,
-0.02546451, -0.7276418, -2.099049, 1, 1, 1, 1, 1,
-0.02538993, 0.1993693, 2.046065, 1, 1, 1, 1, 1,
-0.02476041, 0.5876138, -1.16543, 1, 1, 1, 1, 1,
-0.018964, 1.193848, 0.8640386, 1, 1, 1, 1, 1,
-0.01489693, 0.8650437, -0.5586346, 1, 1, 1, 1, 1,
-0.01062947, -0.1158005, -3.915416, 1, 1, 1, 1, 1,
-0.008372827, 1.039034, 0.07735858, 1, 1, 1, 1, 1,
-0.008336802, 1.055319, -1.653934, 1, 1, 1, 1, 1,
-0.0005789804, -0.4762888, -4.429116, 1, 1, 1, 1, 1,
0.0001100825, 0.4573609, 0.5871011, 1, 1, 1, 1, 1,
0.002732875, 0.7803323, -1.429779, 1, 1, 1, 1, 1,
0.003996982, -0.8551528, 3.306615, 1, 1, 1, 1, 1,
0.005847872, -0.1255277, 1.213514, 1, 1, 1, 1, 1,
0.01254685, -0.1352201, 2.662448, 0, 0, 1, 1, 1,
0.01366103, -0.1643775, 2.425173, 1, 0, 0, 1, 1,
0.01784514, -0.4846069, 2.45757, 1, 0, 0, 1, 1,
0.01909177, 0.4097559, -0.08024418, 1, 0, 0, 1, 1,
0.0234072, 1.171257, 0.60006, 1, 0, 0, 1, 1,
0.02519821, 1.020393, 1.957399, 1, 0, 0, 1, 1,
0.02662738, 1.124685, 1.148006, 0, 0, 0, 1, 1,
0.03902794, -1.393721, 5.030073, 0, 0, 0, 1, 1,
0.04022925, 0.4154077, -0.1126085, 0, 0, 0, 1, 1,
0.04389687, -0.4613018, 3.474939, 0, 0, 0, 1, 1,
0.04410248, -1.073725, 2.63684, 0, 0, 0, 1, 1,
0.04426958, 2.119721, -0.4458222, 0, 0, 0, 1, 1,
0.04639465, 2.645038, -0.1921911, 0, 0, 0, 1, 1,
0.04738437, 0.5877421, -0.5611331, 1, 1, 1, 1, 1,
0.05009799, 1.619812, 0.5599802, 1, 1, 1, 1, 1,
0.05052812, 1.715968, -0.3527176, 1, 1, 1, 1, 1,
0.05081627, 0.4997351, 1.269603, 1, 1, 1, 1, 1,
0.05099119, -0.3875649, 2.468853, 1, 1, 1, 1, 1,
0.05467625, 0.4906302, -0.6839724, 1, 1, 1, 1, 1,
0.05727131, 0.4120829, 0.06120175, 1, 1, 1, 1, 1,
0.06163914, 0.1721008, 0.4997171, 1, 1, 1, 1, 1,
0.0620369, -0.4114614, 2.322065, 1, 1, 1, 1, 1,
0.0665288, 0.6966137, -0.2847098, 1, 1, 1, 1, 1,
0.07942786, 0.647177, 1.94472, 1, 1, 1, 1, 1,
0.08516967, -0.688418, 4.019968, 1, 1, 1, 1, 1,
0.08673733, 0.08702535, 0.4151872, 1, 1, 1, 1, 1,
0.08842984, -0.1354365, 3.267167, 1, 1, 1, 1, 1,
0.08975082, 2.462698, 0.938632, 1, 1, 1, 1, 1,
0.09066013, 0.1853209, 0.05312012, 0, 0, 1, 1, 1,
0.09358966, -0.3564559, 2.985623, 1, 0, 0, 1, 1,
0.0955359, -1.127413, 3.856577, 1, 0, 0, 1, 1,
0.09902167, -0.6902692, 4.015011, 1, 0, 0, 1, 1,
0.1000738, 0.6983896, -0.4260788, 1, 0, 0, 1, 1,
0.1050822, 1.121934, 1.480977, 1, 0, 0, 1, 1,
0.1122294, 0.584678, 0.1434489, 0, 0, 0, 1, 1,
0.1156125, -0.1191418, 2.912534, 0, 0, 0, 1, 1,
0.117906, -1.074848, 1.256379, 0, 0, 0, 1, 1,
0.1188455, -0.3998076, 2.949589, 0, 0, 0, 1, 1,
0.1213744, -1.740491, 2.164955, 0, 0, 0, 1, 1,
0.1228938, 0.03776778, 0.6552932, 0, 0, 0, 1, 1,
0.1232971, -0.1339658, 1.752611, 0, 0, 0, 1, 1,
0.128071, 0.6582775, -0.3626995, 1, 1, 1, 1, 1,
0.1308292, -0.3072328, 2.585495, 1, 1, 1, 1, 1,
0.1316964, 0.02061094, -0.3780178, 1, 1, 1, 1, 1,
0.1325241, 0.9079234, 0.2384318, 1, 1, 1, 1, 1,
0.1334564, -0.0293689, 2.274592, 1, 1, 1, 1, 1,
0.1341615, 0.4521024, 1.816312, 1, 1, 1, 1, 1,
0.1360492, -1.48157, 2.773877, 1, 1, 1, 1, 1,
0.1381784, 0.3228182, -0.9005371, 1, 1, 1, 1, 1,
0.1391279, 1.182839, 0.3435362, 1, 1, 1, 1, 1,
0.1437522, -1.490782, 3.990068, 1, 1, 1, 1, 1,
0.1451528, 2.619076, -0.5489444, 1, 1, 1, 1, 1,
0.1486247, -0.5392968, 2.774448, 1, 1, 1, 1, 1,
0.1510337, 1.587817, 1.391179, 1, 1, 1, 1, 1,
0.1529127, 0.01543747, 2.48546, 1, 1, 1, 1, 1,
0.1588391, 0.5446022, 1.023071, 1, 1, 1, 1, 1,
0.1609883, -0.02019164, 1.698322, 0, 0, 1, 1, 1,
0.1624316, 0.5669222, 1.305995, 1, 0, 0, 1, 1,
0.163225, -0.6192893, 4.204638, 1, 0, 0, 1, 1,
0.1641538, -2.076264, 3.084919, 1, 0, 0, 1, 1,
0.1662045, 0.84983, -0.3655606, 1, 0, 0, 1, 1,
0.166301, -3.452119, 3.085129, 1, 0, 0, 1, 1,
0.1676946, -0.47293, 2.994557, 0, 0, 0, 1, 1,
0.1707192, 1.499761, -2.955979, 0, 0, 0, 1, 1,
0.170783, -1.848165, 3.725562, 0, 0, 0, 1, 1,
0.1737333, 1.548387, -0.399134, 0, 0, 0, 1, 1,
0.173886, 0.7932702, 0.2262155, 0, 0, 0, 1, 1,
0.1790048, -0.465003, 3.550862, 0, 0, 0, 1, 1,
0.1827524, -0.7744353, 1.479848, 0, 0, 0, 1, 1,
0.1845656, -0.4880566, 3.337319, 1, 1, 1, 1, 1,
0.1934813, 0.8673574, 0.7193695, 1, 1, 1, 1, 1,
0.1945699, -0.7151376, 2.533029, 1, 1, 1, 1, 1,
0.1952818, -2.374604, 4.127032, 1, 1, 1, 1, 1,
0.1963774, 1.306442, -0.6785215, 1, 1, 1, 1, 1,
0.1976607, 1.915377, -0.7190317, 1, 1, 1, 1, 1,
0.1982026, -1.923196, 2.368704, 1, 1, 1, 1, 1,
0.199033, 0.133812, 2.648147, 1, 1, 1, 1, 1,
0.2012521, -0.5687931, 2.340898, 1, 1, 1, 1, 1,
0.2048898, -0.8225784, 3.087001, 1, 1, 1, 1, 1,
0.2063861, -2.20301, 3.138973, 1, 1, 1, 1, 1,
0.2068963, -1.304261, 2.985852, 1, 1, 1, 1, 1,
0.2079854, -1.729417, 2.53185, 1, 1, 1, 1, 1,
0.2083915, -1.673054, 3.413523, 1, 1, 1, 1, 1,
0.2102383, -0.2602856, 2.697572, 1, 1, 1, 1, 1,
0.2109116, 0.8048875, -1.060754, 0, 0, 1, 1, 1,
0.2125048, 0.7872064, -0.5590534, 1, 0, 0, 1, 1,
0.2145867, -0.4729056, 2.199435, 1, 0, 0, 1, 1,
0.2151583, 1.65644, 0.7735958, 1, 0, 0, 1, 1,
0.216899, -1.19623, 2.816149, 1, 0, 0, 1, 1,
0.2203574, 0.7444676, -0.4695529, 1, 0, 0, 1, 1,
0.2211884, -0.9336702, 2.921538, 0, 0, 0, 1, 1,
0.2217379, -0.93717, 4.289207, 0, 0, 0, 1, 1,
0.2310422, 0.06604192, 0.331897, 0, 0, 0, 1, 1,
0.2326025, -0.5748653, 3.629511, 0, 0, 0, 1, 1,
0.2331056, 2.331352, -0.6875765, 0, 0, 0, 1, 1,
0.2341649, -0.1534074, -1.097995, 0, 0, 0, 1, 1,
0.2351648, 1.406213, -0.9696776, 0, 0, 0, 1, 1,
0.2357442, -0.3668596, 1.653343, 1, 1, 1, 1, 1,
0.2362672, 1.000562, 1.508102, 1, 1, 1, 1, 1,
0.2379279, -0.3961105, 2.517292, 1, 1, 1, 1, 1,
0.238791, -1.094649, 4.089813, 1, 1, 1, 1, 1,
0.2424719, -0.6526057, 3.80987, 1, 1, 1, 1, 1,
0.2433555, 1.082744, 0.3051897, 1, 1, 1, 1, 1,
0.2479157, -0.4545806, 1.608732, 1, 1, 1, 1, 1,
0.2510412, -1.492304, 2.349007, 1, 1, 1, 1, 1,
0.2525789, 1.061143, 0.4601319, 1, 1, 1, 1, 1,
0.2537699, -1.255939, 2.686403, 1, 1, 1, 1, 1,
0.2543792, 0.04486908, 1.646598, 1, 1, 1, 1, 1,
0.2601978, -0.2991642, 1.914217, 1, 1, 1, 1, 1,
0.2745837, 1.036276, -1.406319, 1, 1, 1, 1, 1,
0.276828, 0.3084717, 0.4148254, 1, 1, 1, 1, 1,
0.2786736, -1.874959, 4.463759, 1, 1, 1, 1, 1,
0.2798952, -1.779711, 1.655424, 0, 0, 1, 1, 1,
0.2831035, 0.3954907, 0.7694446, 1, 0, 0, 1, 1,
0.2886999, 1.432478, 1.026739, 1, 0, 0, 1, 1,
0.2953148, -0.212629, 1.7461, 1, 0, 0, 1, 1,
0.295857, 0.3279227, 1.746497, 1, 0, 0, 1, 1,
0.2964135, -0.6177144, 1.872752, 1, 0, 0, 1, 1,
0.2985384, 2.002662, 0.3388786, 0, 0, 0, 1, 1,
0.3020531, -1.39986, 2.350135, 0, 0, 0, 1, 1,
0.3044098, -0.7363819, 2.905192, 0, 0, 0, 1, 1,
0.3075378, 1.381156, 0.6118898, 0, 0, 0, 1, 1,
0.3085198, 1.985407, 0.9595034, 0, 0, 0, 1, 1,
0.3131554, -0.3526878, 1.280413, 0, 0, 0, 1, 1,
0.3143846, -0.2158285, 2.689829, 0, 0, 0, 1, 1,
0.321033, 1.441365, 1.419465, 1, 1, 1, 1, 1,
0.3228121, 1.000954, -1.491397, 1, 1, 1, 1, 1,
0.3246085, 1.072435, 0.8921301, 1, 1, 1, 1, 1,
0.325254, 0.1308102, 1.685571, 1, 1, 1, 1, 1,
0.3256188, 1.137038, 1.651713, 1, 1, 1, 1, 1,
0.3267286, 0.9548451, 0.1265074, 1, 1, 1, 1, 1,
0.3327543, -0.01342157, 1.361752, 1, 1, 1, 1, 1,
0.3340158, 1.399386, -0.4139911, 1, 1, 1, 1, 1,
0.3347822, -0.8569101, 2.074433, 1, 1, 1, 1, 1,
0.3356361, 0.2819065, 2.40975, 1, 1, 1, 1, 1,
0.3370771, 1.664015, 0.546832, 1, 1, 1, 1, 1,
0.3380626, -0.04724048, 1.735909, 1, 1, 1, 1, 1,
0.3526311, 0.1872682, 2.921223, 1, 1, 1, 1, 1,
0.3567576, -0.2910057, 3.592139, 1, 1, 1, 1, 1,
0.357759, 0.171659, 3.197896, 1, 1, 1, 1, 1,
0.3595254, -0.1325371, 2.020763, 0, 0, 1, 1, 1,
0.3623125, -2.39457, 3.233242, 1, 0, 0, 1, 1,
0.3639002, 0.433726, 0.8917216, 1, 0, 0, 1, 1,
0.3639759, 1.432069, -0.6356934, 1, 0, 0, 1, 1,
0.3708703, 1.364238, 0.8145713, 1, 0, 0, 1, 1,
0.3708706, -0.03357179, 0.3333988, 1, 0, 0, 1, 1,
0.3719915, 0.08728611, 0.9837582, 0, 0, 0, 1, 1,
0.374318, 0.791562, 0.4151574, 0, 0, 0, 1, 1,
0.3744984, -1.030418, 2.496339, 0, 0, 0, 1, 1,
0.3746888, -0.7256887, 1.947145, 0, 0, 0, 1, 1,
0.3801729, 0.8056952, -0.837041, 0, 0, 0, 1, 1,
0.3838555, -2.405818, 2.028362, 0, 0, 0, 1, 1,
0.392481, -2.020121, 3.309487, 0, 0, 0, 1, 1,
0.3929935, -0.6520671, 3.29927, 1, 1, 1, 1, 1,
0.3948966, -1.192703, 4.73299, 1, 1, 1, 1, 1,
0.397342, 0.109782, 0.7449768, 1, 1, 1, 1, 1,
0.4019189, -0.125846, 2.305716, 1, 1, 1, 1, 1,
0.4022487, 0.3113995, 0.8424087, 1, 1, 1, 1, 1,
0.4071822, 1.47521, 0.2657555, 1, 1, 1, 1, 1,
0.4096695, -2.407519, 3.128815, 1, 1, 1, 1, 1,
0.4141103, 0.4298382, 2.368963, 1, 1, 1, 1, 1,
0.4149528, 0.32805, 1.491087, 1, 1, 1, 1, 1,
0.4149555, 0.9580227, 0.5786027, 1, 1, 1, 1, 1,
0.4170146, 0.2248414, 0.1552623, 1, 1, 1, 1, 1,
0.4194083, -0.3904863, 2.387024, 1, 1, 1, 1, 1,
0.4197561, -0.8297358, 2.262372, 1, 1, 1, 1, 1,
0.4242331, 0.6839889, 0.3549008, 1, 1, 1, 1, 1,
0.4283097, 1.835035, 0.5266753, 1, 1, 1, 1, 1,
0.4303326, 0.230705, 2.514957, 0, 0, 1, 1, 1,
0.4363645, -0.5897287, 2.946635, 1, 0, 0, 1, 1,
0.4413144, -0.2818655, 2.674839, 1, 0, 0, 1, 1,
0.4444457, 0.9231427, -0.6994516, 1, 0, 0, 1, 1,
0.4458938, -0.8044518, 0.9350157, 1, 0, 0, 1, 1,
0.4498174, 1.048314, -0.8319873, 1, 0, 0, 1, 1,
0.450982, -0.08923075, 1.860027, 0, 0, 0, 1, 1,
0.45856, -0.6318102, 2.995064, 0, 0, 0, 1, 1,
0.459387, 0.8264005, -0.05147783, 0, 0, 0, 1, 1,
0.4640553, 1.166315, -0.6560228, 0, 0, 0, 1, 1,
0.4640624, -0.1568157, 3.989643, 0, 0, 0, 1, 1,
0.4720809, 0.1612882, 2.148938, 0, 0, 0, 1, 1,
0.4729359, 1.27678, 2.234961, 0, 0, 0, 1, 1,
0.4732209, 1.168047, 0.1603106, 1, 1, 1, 1, 1,
0.4776397, 0.3418355, 1.841248, 1, 1, 1, 1, 1,
0.4811317, -0.8878585, 4.11039, 1, 1, 1, 1, 1,
0.4815608, -0.6262293, 1.806734, 1, 1, 1, 1, 1,
0.4828344, -0.095686, 0.7070056, 1, 1, 1, 1, 1,
0.4841535, -0.7987485, 2.345261, 1, 1, 1, 1, 1,
0.4842817, -0.1261628, 0.4722663, 1, 1, 1, 1, 1,
0.4857028, -0.1815252, 2.357368, 1, 1, 1, 1, 1,
0.4886198, 0.3539254, -0.1632558, 1, 1, 1, 1, 1,
0.4902632, -1.375931, 2.883166, 1, 1, 1, 1, 1,
0.4919747, 0.4653457, 2.415436, 1, 1, 1, 1, 1,
0.4924413, -1.72874, 3.081399, 1, 1, 1, 1, 1,
0.4944923, 0.9004849, 0.9226897, 1, 1, 1, 1, 1,
0.4949571, 0.4304899, -0.2569871, 1, 1, 1, 1, 1,
0.495703, -1.880189, 2.321403, 1, 1, 1, 1, 1,
0.499421, -0.0635706, 2.207994, 0, 0, 1, 1, 1,
0.5002796, 1.010004, -0.5563663, 1, 0, 0, 1, 1,
0.5041473, 1.352276, -0.3055488, 1, 0, 0, 1, 1,
0.5058127, 1.031117, -0.1292554, 1, 0, 0, 1, 1,
0.5063872, 1.472736, 2.485452, 1, 0, 0, 1, 1,
0.5067536, -1.576726, 2.21752, 1, 0, 0, 1, 1,
0.507469, 1.385538, -0.7276372, 0, 0, 0, 1, 1,
0.5112293, 0.3638393, 0.8316793, 0, 0, 0, 1, 1,
0.5161981, -0.7998304, 2.038839, 0, 0, 0, 1, 1,
0.5166701, 0.2817355, 1.113284, 0, 0, 0, 1, 1,
0.5196028, -1.051974, 2.623867, 0, 0, 0, 1, 1,
0.5210084, 0.3233724, -0.03859787, 0, 0, 0, 1, 1,
0.5296833, 0.3053645, -0.8171129, 0, 0, 0, 1, 1,
0.5306744, 0.03215566, 2.414375, 1, 1, 1, 1, 1,
0.5367, -0.7031399, 0.956319, 1, 1, 1, 1, 1,
0.541191, -0.5254791, 1.767216, 1, 1, 1, 1, 1,
0.541755, -0.1294343, 0.09381077, 1, 1, 1, 1, 1,
0.5422156, 1.175881, 0.04396124, 1, 1, 1, 1, 1,
0.5437135, 0.9434078, 1.598447, 1, 1, 1, 1, 1,
0.551679, 0.6831018, -0.6056255, 1, 1, 1, 1, 1,
0.5539635, -1.838881, 3.538246, 1, 1, 1, 1, 1,
0.5658755, 0.2306143, -0.2280545, 1, 1, 1, 1, 1,
0.570568, 0.7713701, 2.438922, 1, 1, 1, 1, 1,
0.5716419, -2.154365, 3.192, 1, 1, 1, 1, 1,
0.5734245, 0.405881, 0.1812645, 1, 1, 1, 1, 1,
0.5815183, 0.8198611, 1.672754, 1, 1, 1, 1, 1,
0.5895192, 3.426948, -0.7936338, 1, 1, 1, 1, 1,
0.5916043, 1.87914, -0.8578089, 1, 1, 1, 1, 1,
0.592195, -0.2638559, 2.297843, 0, 0, 1, 1, 1,
0.5934439, 0.3047328, 2.79644, 1, 0, 0, 1, 1,
0.5951287, 0.7599416, 2.401751, 1, 0, 0, 1, 1,
0.5958566, 0.2736665, 2.828463, 1, 0, 0, 1, 1,
0.596937, 0.7977373, -0.2024539, 1, 0, 0, 1, 1,
0.6014926, -1.462522, 2.886399, 1, 0, 0, 1, 1,
0.605796, 0.5182976, 1.163079, 0, 0, 0, 1, 1,
0.6111271, -1.288269, 3.466068, 0, 0, 0, 1, 1,
0.6123617, -0.9596173, 2.203612, 0, 0, 0, 1, 1,
0.6123714, 0.08925682, 2.311392, 0, 0, 0, 1, 1,
0.6185802, -0.430038, 2.570121, 0, 0, 0, 1, 1,
0.6197925, 0.6246057, 0.2026302, 0, 0, 0, 1, 1,
0.6256626, -1.477427, 4.981408, 0, 0, 0, 1, 1,
0.6311627, -1.082192, 2.793607, 1, 1, 1, 1, 1,
0.6319882, 0.2583446, 1.689859, 1, 1, 1, 1, 1,
0.6380302, 0.3588989, 2.223957, 1, 1, 1, 1, 1,
0.6461483, -0.3883223, 2.017764, 1, 1, 1, 1, 1,
0.6508955, 0.988942, 0.4923369, 1, 1, 1, 1, 1,
0.6563768, 0.4799104, 2.677519, 1, 1, 1, 1, 1,
0.6600393, -0.976479, 3.905614, 1, 1, 1, 1, 1,
0.6626364, 0.9900314, -0.7101108, 1, 1, 1, 1, 1,
0.6654215, 0.9368114, -0.3448543, 1, 1, 1, 1, 1,
0.6718987, 0.9002448, -0.8850489, 1, 1, 1, 1, 1,
0.6731972, 1.932061, 1.158008, 1, 1, 1, 1, 1,
0.6769401, 0.7154204, 0.7595962, 1, 1, 1, 1, 1,
0.6778865, -0.6853607, 3.616, 1, 1, 1, 1, 1,
0.688476, 0.9146606, 1.512318, 1, 1, 1, 1, 1,
0.6891709, -0.4709851, 1.021649, 1, 1, 1, 1, 1,
0.691016, 0.1560123, 0.9860957, 0, 0, 1, 1, 1,
0.6933807, 1.763512, 1.072168, 1, 0, 0, 1, 1,
0.6954902, -0.3659606, 1.490742, 1, 0, 0, 1, 1,
0.6971731, -0.3257066, 1.431597, 1, 0, 0, 1, 1,
0.7006832, -0.1191294, 1.827861, 1, 0, 0, 1, 1,
0.7023107, -0.158355, 1.587755, 1, 0, 0, 1, 1,
0.7100537, 0.50413, 0.6736878, 0, 0, 0, 1, 1,
0.7111642, 2.414232, -0.7661483, 0, 0, 0, 1, 1,
0.7117319, 0.9679288, 1.668177, 0, 0, 0, 1, 1,
0.7139665, 1.522877, 1.482708, 0, 0, 0, 1, 1,
0.7175313, 1.016554, 2.856919, 0, 0, 0, 1, 1,
0.7181694, -0.6503812, 1.508581, 0, 0, 0, 1, 1,
0.7210633, 1.947513, 1.880384, 0, 0, 0, 1, 1,
0.7308256, 0.513427, 1.093289, 1, 1, 1, 1, 1,
0.7340714, 0.7937411, 0.3953814, 1, 1, 1, 1, 1,
0.7397406, 0.6812951, 1.284543, 1, 1, 1, 1, 1,
0.7425139, 1.287163, 0.2648124, 1, 1, 1, 1, 1,
0.7498738, 2.111837, -0.9860002, 1, 1, 1, 1, 1,
0.7512984, -0.1417508, 0.7223207, 1, 1, 1, 1, 1,
0.755364, 1.100747, 2.948261, 1, 1, 1, 1, 1,
0.7686077, -0.6462842, 0.7228746, 1, 1, 1, 1, 1,
0.7702786, -0.8506272, 2.375237, 1, 1, 1, 1, 1,
0.7760903, 0.4216655, 2.221432, 1, 1, 1, 1, 1,
0.7888166, 0.6144775, 2.280336, 1, 1, 1, 1, 1,
0.7901909, 0.5843679, 2.290286, 1, 1, 1, 1, 1,
0.7908292, 0.2996499, 0.8991027, 1, 1, 1, 1, 1,
0.7929942, 1.817461, 0.580402, 1, 1, 1, 1, 1,
0.7948393, -0.158131, 1.24575, 1, 1, 1, 1, 1,
0.7973493, 1.152273, 2.065696, 0, 0, 1, 1, 1,
0.7978696, 1.521869, 0.941349, 1, 0, 0, 1, 1,
0.8011937, -1.329505, 3.569213, 1, 0, 0, 1, 1,
0.8028486, 0.9773487, 1.72403, 1, 0, 0, 1, 1,
0.8244137, -2.101385, 3.243473, 1, 0, 0, 1, 1,
0.8369944, -1.394597, 3.406967, 1, 0, 0, 1, 1,
0.8453495, 0.1655175, 1.293688, 0, 0, 0, 1, 1,
0.8462118, 1.3259, -0.3323575, 0, 0, 0, 1, 1,
0.8468487, -0.04669975, 1.337999, 0, 0, 0, 1, 1,
0.8472334, 1.727362, -0.5593266, 0, 0, 0, 1, 1,
0.8474137, 1.392336, -1.786036, 0, 0, 0, 1, 1,
0.8498577, 0.7746115, 0.361065, 0, 0, 0, 1, 1,
0.8526075, -0.6903829, 0.8022817, 0, 0, 0, 1, 1,
0.8536904, -0.9199849, 1.544544, 1, 1, 1, 1, 1,
0.857577, 0.1573224, 1.110944, 1, 1, 1, 1, 1,
0.8578344, -0.3804901, 0.7510403, 1, 1, 1, 1, 1,
0.8633192, 0.8319029, -0.6853967, 1, 1, 1, 1, 1,
0.8642341, -0.1106671, 3.738949, 1, 1, 1, 1, 1,
0.8698599, -0.4098609, 1.377553, 1, 1, 1, 1, 1,
0.8763027, 0.226575, 1.553397, 1, 1, 1, 1, 1,
0.8860931, -0.6081171, 1.79649, 1, 1, 1, 1, 1,
0.8868554, 0.8282211, 2.058649, 1, 1, 1, 1, 1,
0.893334, -1.886141, 1.639702, 1, 1, 1, 1, 1,
0.8986574, 1.306122, 1.244468, 1, 1, 1, 1, 1,
0.900391, 0.2783892, 0.4205202, 1, 1, 1, 1, 1,
0.9030873, 0.5176343, 2.37518, 1, 1, 1, 1, 1,
0.9110123, 0.4188102, 1.760174, 1, 1, 1, 1, 1,
0.9166337, -1.425623, 3.542203, 1, 1, 1, 1, 1,
0.9274375, 1.465435, -0.4575619, 0, 0, 1, 1, 1,
0.9288044, 0.5248326, 0.8862759, 1, 0, 0, 1, 1,
0.9325879, -0.6104206, 1.416431, 1, 0, 0, 1, 1,
0.9401162, 0.1711771, 2.920598, 1, 0, 0, 1, 1,
0.9464097, 0.6637993, 3.083099, 1, 0, 0, 1, 1,
0.9473634, 0.8132101, 0.2523423, 1, 0, 0, 1, 1,
0.9637455, -0.6349173, 1.787274, 0, 0, 0, 1, 1,
0.9715059, -2.121121, 3.202499, 0, 0, 0, 1, 1,
0.9774954, -1.352439, 2.652566, 0, 0, 0, 1, 1,
0.9909564, -0.4754428, 2.843314, 0, 0, 0, 1, 1,
0.9911582, 1.200519, 1.302222, 0, 0, 0, 1, 1,
0.9919371, 0.9244385, 1.556692, 0, 0, 0, 1, 1,
0.9921652, 0.0175198, 0.6050786, 0, 0, 0, 1, 1,
0.9944506, 1.062135, 0.8608864, 1, 1, 1, 1, 1,
0.9991446, -1.712889, 2.495232, 1, 1, 1, 1, 1,
1.001356, 1.162509, -0.05391058, 1, 1, 1, 1, 1,
1.002982, -1.237119, 1.821239, 1, 1, 1, 1, 1,
1.009324, 2.127966, 2.102558, 1, 1, 1, 1, 1,
1.011007, -2.093722, 3.872477, 1, 1, 1, 1, 1,
1.016548, 0.2237363, 0.1999713, 1, 1, 1, 1, 1,
1.019923, -0.3852235, 2.58757, 1, 1, 1, 1, 1,
1.020091, 0.3874985, 1.26546, 1, 1, 1, 1, 1,
1.02275, -1.411446, 2.481186, 1, 1, 1, 1, 1,
1.043129, 0.3978838, 1.624272, 1, 1, 1, 1, 1,
1.050432, -0.6826742, 2.284446, 1, 1, 1, 1, 1,
1.064682, -0.07431404, 2.689396, 1, 1, 1, 1, 1,
1.065552, 0.1881365, 2.698955, 1, 1, 1, 1, 1,
1.066484, -1.003039, 2.059917, 1, 1, 1, 1, 1,
1.06969, -0.3213928, 1.760072, 0, 0, 1, 1, 1,
1.07722, 0.5238215, -0.06024332, 1, 0, 0, 1, 1,
1.087302, 0.216278, -0.4915615, 1, 0, 0, 1, 1,
1.090523, 1.203163, 0.4620572, 1, 0, 0, 1, 1,
1.091616, -0.9532013, 2.823602, 1, 0, 0, 1, 1,
1.092096, 0.3866991, 1.614101, 1, 0, 0, 1, 1,
1.093311, -0.2453197, 1.829093, 0, 0, 0, 1, 1,
1.095588, 0.1080462, 2.010615, 0, 0, 0, 1, 1,
1.09971, 0.6524894, 1.012191, 0, 0, 0, 1, 1,
1.104544, 0.06008291, 0.2261644, 0, 0, 0, 1, 1,
1.108888, 0.3549472, 0.4422179, 0, 0, 0, 1, 1,
1.109671, -0.06814858, 1.669511, 0, 0, 0, 1, 1,
1.111444, -1.340273, 3.893675, 0, 0, 0, 1, 1,
1.111653, -1.642292, 3.614262, 1, 1, 1, 1, 1,
1.112242, -1.088868, 2.808529, 1, 1, 1, 1, 1,
1.11709, 0.4956855, 1.416968, 1, 1, 1, 1, 1,
1.125218, 0.2394622, 0.7960845, 1, 1, 1, 1, 1,
1.132863, -0.3694549, 2.76841, 1, 1, 1, 1, 1,
1.135813, -2.608278, 0.7795981, 1, 1, 1, 1, 1,
1.152145, 1.174703, 1.428035, 1, 1, 1, 1, 1,
1.177058, -0.6457226, 0.8736744, 1, 1, 1, 1, 1,
1.178427, 2.032649, 1.489725, 1, 1, 1, 1, 1,
1.17972, 0.757665, 3.205697, 1, 1, 1, 1, 1,
1.184087, 0.09663716, 1.261294, 1, 1, 1, 1, 1,
1.184773, -0.1144065, 1.532239, 1, 1, 1, 1, 1,
1.196869, -0.6185, 0.56497, 1, 1, 1, 1, 1,
1.197172, -0.7641574, 1.751813, 1, 1, 1, 1, 1,
1.199871, -1.561828, 0.2791106, 1, 1, 1, 1, 1,
1.203041, 0.3856225, 1.732266, 0, 0, 1, 1, 1,
1.211818, -0.9639322, 2.105998, 1, 0, 0, 1, 1,
1.213421, -1.699014, 1.265768, 1, 0, 0, 1, 1,
1.216046, 1.105254, 1.884615, 1, 0, 0, 1, 1,
1.21857, 0.1112242, 0.7930791, 1, 0, 0, 1, 1,
1.225618, 0.6061471, -1.212349, 1, 0, 0, 1, 1,
1.232594, -1.153259, 0.4939978, 0, 0, 0, 1, 1,
1.233531, 0.7848524, 1.618614, 0, 0, 0, 1, 1,
1.234311, 0.8754311, 0.9037679, 0, 0, 0, 1, 1,
1.234665, 1.610169, 2.143723, 0, 0, 0, 1, 1,
1.238756, -0.3496232, 3.198352, 0, 0, 0, 1, 1,
1.24272, 1.531782, -0.7041841, 0, 0, 0, 1, 1,
1.246441, 1.687415, -0.186317, 0, 0, 0, 1, 1,
1.248638, 0.5819906, 2.476834, 1, 1, 1, 1, 1,
1.255442, 0.593259, 1.074424, 1, 1, 1, 1, 1,
1.256419, -0.0821171, 1.753214, 1, 1, 1, 1, 1,
1.274496, -2.099588, 2.834512, 1, 1, 1, 1, 1,
1.275255, -0.145586, 0.7687651, 1, 1, 1, 1, 1,
1.277176, 0.03430647, 2.829289, 1, 1, 1, 1, 1,
1.283985, -0.2180959, 1.665397, 1, 1, 1, 1, 1,
1.286991, 1.247298, -0.09556776, 1, 1, 1, 1, 1,
1.296921, 0.6283865, 1.772925, 1, 1, 1, 1, 1,
1.29801, 0.6541137, 2.772887, 1, 1, 1, 1, 1,
1.299241, -1.172995, 1.623321, 1, 1, 1, 1, 1,
1.301183, 0.5740623, 1.417632, 1, 1, 1, 1, 1,
1.30347, 1.543584, 1.119027, 1, 1, 1, 1, 1,
1.30726, 1.099628, -0.4874547, 1, 1, 1, 1, 1,
1.308516, 1.292984, -0.2706211, 1, 1, 1, 1, 1,
1.31916, -1.317571, 0.9619745, 0, 0, 1, 1, 1,
1.32442, 0.1327031, 1.454076, 1, 0, 0, 1, 1,
1.328437, 1.405233, 1.063983, 1, 0, 0, 1, 1,
1.33242, -0.1046694, 1.86346, 1, 0, 0, 1, 1,
1.351309, 1.177596, 2.104485, 1, 0, 0, 1, 1,
1.359812, -1.468689, 2.805604, 1, 0, 0, 1, 1,
1.360581, 1.869819, 0.6128183, 0, 0, 0, 1, 1,
1.360588, 0.2486914, 0.8677731, 0, 0, 0, 1, 1,
1.36495, 0.6853039, 1.795735, 0, 0, 0, 1, 1,
1.368879, -0.302557, 1.543578, 0, 0, 0, 1, 1,
1.369589, -1.249101, 2.371262, 0, 0, 0, 1, 1,
1.375391, -0.04595556, 2.645969, 0, 0, 0, 1, 1,
1.383113, -1.298834, 3.174715, 0, 0, 0, 1, 1,
1.383978, -1.010664, 2.402492, 1, 1, 1, 1, 1,
1.385476, -0.5283012, 1.489961, 1, 1, 1, 1, 1,
1.392664, -1.946209, 1.404789, 1, 1, 1, 1, 1,
1.397418, 0.8488613, 2.819236, 1, 1, 1, 1, 1,
1.405317, -0.3228048, 1.491096, 1, 1, 1, 1, 1,
1.419379, -0.3666565, 1.419474, 1, 1, 1, 1, 1,
1.428602, -0.4865472, 3.171191, 1, 1, 1, 1, 1,
1.434521, 1.195323, 0.5728295, 1, 1, 1, 1, 1,
1.438046, 0.4938891, 2.398285, 1, 1, 1, 1, 1,
1.445683, 1.218569, 0.2546092, 1, 1, 1, 1, 1,
1.446468, 1.286617, 0.392152, 1, 1, 1, 1, 1,
1.461265, 0.6595423, 0.1997125, 1, 1, 1, 1, 1,
1.481009, 3.009768, -0.512024, 1, 1, 1, 1, 1,
1.48296, -0.5408199, 2.786965, 1, 1, 1, 1, 1,
1.499448, -1.750355, 4.043131, 1, 1, 1, 1, 1,
1.500172, 1.613, 0.1954998, 0, 0, 1, 1, 1,
1.50397, -0.781733, 1.564537, 1, 0, 0, 1, 1,
1.505981, 1.797643, 0.8910004, 1, 0, 0, 1, 1,
1.507385, -1.372585, 3.523584, 1, 0, 0, 1, 1,
1.516087, 1.151753, 1.347845, 1, 0, 0, 1, 1,
1.517432, 0.4808991, 1.608044, 1, 0, 0, 1, 1,
1.51925, -2.662621, 2.310359, 0, 0, 0, 1, 1,
1.532536, -0.4666322, 1.447384, 0, 0, 0, 1, 1,
1.538946, -0.8176289, 1.501789, 0, 0, 0, 1, 1,
1.541226, 0.9133463, 0.5514983, 0, 0, 0, 1, 1,
1.555126, 0.193501, 2.785743, 0, 0, 0, 1, 1,
1.629817, 1.042429, 0.904389, 0, 0, 0, 1, 1,
1.634749, -1.7722, 3.197003, 0, 0, 0, 1, 1,
1.654627, 0.5217012, 1.43675, 1, 1, 1, 1, 1,
1.656672, 0.2298494, 1.613899, 1, 1, 1, 1, 1,
1.663772, 1.612332, 2.09077, 1, 1, 1, 1, 1,
1.667659, 0.1626766, 0.5631355, 1, 1, 1, 1, 1,
1.679003, -0.3443849, 2.070021, 1, 1, 1, 1, 1,
1.683054, -0.9223402, 1.291171, 1, 1, 1, 1, 1,
1.687577, 1.137183, 0.3703131, 1, 1, 1, 1, 1,
1.697841, -2.048613, 1.082854, 1, 1, 1, 1, 1,
1.705894, 0.1411633, 2.609118, 1, 1, 1, 1, 1,
1.706471, 0.7786611, 0.01183893, 1, 1, 1, 1, 1,
1.720997, -0.5544844, -0.4162076, 1, 1, 1, 1, 1,
1.732657, 1.037384, 1.842722, 1, 1, 1, 1, 1,
1.738739, -1.42363, 2.749762, 1, 1, 1, 1, 1,
1.748012, 0.1508472, 1.96728, 1, 1, 1, 1, 1,
1.751321, 0.3641037, 2.738832, 1, 1, 1, 1, 1,
1.753875, 0.3800462, 2.647316, 0, 0, 1, 1, 1,
1.762045, 0.2326626, 2.17989, 1, 0, 0, 1, 1,
1.766589, -2.43794, 3.103559, 1, 0, 0, 1, 1,
1.790879, 1.025568, 1.033162, 1, 0, 0, 1, 1,
1.804354, -1.010542, 1.771567, 1, 0, 0, 1, 1,
1.812279, 1.579998, 1.249141, 1, 0, 0, 1, 1,
1.839071, -2.079555, 3.43831, 0, 0, 0, 1, 1,
1.84187, 0.01419002, 2.437595, 0, 0, 0, 1, 1,
1.847444, 1.064843, 2.415463, 0, 0, 0, 1, 1,
1.847953, -0.7857677, 3.425356, 0, 0, 0, 1, 1,
1.869143, 0.8780664, 0.2424735, 0, 0, 0, 1, 1,
1.873418, -0.4525366, 0.5384178, 0, 0, 0, 1, 1,
1.895678, 1.973982, -0.6290502, 0, 0, 0, 1, 1,
1.89578, 0.2589507, 1.097847, 1, 1, 1, 1, 1,
1.945624, 0.4517283, 1.754336, 1, 1, 1, 1, 1,
1.956213, -1.938238, 3.882567, 1, 1, 1, 1, 1,
1.976208, -0.7761082, 2.892354, 1, 1, 1, 1, 1,
1.97733, 0.05483807, 2.482937, 1, 1, 1, 1, 1,
1.980733, 1.056986, 1.265209, 1, 1, 1, 1, 1,
2.026695, 1.456997, 2.027666, 1, 1, 1, 1, 1,
2.058385, 1.282421, 2.297343, 1, 1, 1, 1, 1,
2.066724, 0.3344052, 1.763817, 1, 1, 1, 1, 1,
2.070742, -1.601557, 3.045051, 1, 1, 1, 1, 1,
2.118193, -0.3089198, 0.6133988, 1, 1, 1, 1, 1,
2.125548, 0.9309513, -0.2266208, 1, 1, 1, 1, 1,
2.132869, -0.1982421, 1.888175, 1, 1, 1, 1, 1,
2.145225, 0.1968496, 2.057644, 1, 1, 1, 1, 1,
2.163428, -0.1785312, 2.986133, 1, 1, 1, 1, 1,
2.16633, -0.377737, 2.049079, 0, 0, 1, 1, 1,
2.187686, -0.2078386, 1.881078, 1, 0, 0, 1, 1,
2.188699, -1.443178, 2.415351, 1, 0, 0, 1, 1,
2.209747, 0.6728809, 0.5095219, 1, 0, 0, 1, 1,
2.235856, -0.2440838, 1.855872, 1, 0, 0, 1, 1,
2.25722, 0.2983649, 1.242539, 1, 0, 0, 1, 1,
2.339955, -0.1526213, 2.323068, 0, 0, 0, 1, 1,
2.356032, 0.7738686, 1.670575, 0, 0, 0, 1, 1,
2.38234, -0.5166328, 1.252506, 0, 0, 0, 1, 1,
2.389661, 0.003858651, -1.037805, 0, 0, 0, 1, 1,
2.402698, 0.1562384, 1.664938, 0, 0, 0, 1, 1,
2.647473, 1.961541, 2.505738, 0, 0, 0, 1, 1,
2.685299, 0.8985435, 0.4196895, 0, 0, 0, 1, 1,
2.754665, -1.417841, 2.923296, 1, 1, 1, 1, 1,
2.785334, -0.5006744, 2.184999, 1, 1, 1, 1, 1,
2.796009, 0.6036788, 2.44646, 1, 1, 1, 1, 1,
2.80005, 0.3700742, 1.708861, 1, 1, 1, 1, 1,
2.924613, -0.3263791, 0.6066387, 1, 1, 1, 1, 1,
3.077865, -0.2471333, -0.5161945, 1, 1, 1, 1, 1,
4.103173, 0.6436822, 0.9994126, 1, 1, 1, 1, 1
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
var radius = 9.810888;
var distance = 34.46033;
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
mvMatrix.translate( -0.6040457, 0.01258516, 0.2625227 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.46033);
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
