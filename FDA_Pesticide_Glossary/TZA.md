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
-3.503579, -0.9354377, -0.9141641, 1, 0, 0, 1,
-3.389397, -0.4428135, -1.174145, 1, 0.007843138, 0, 1,
-3.207869, -0.3828333, -1.19059, 1, 0.01176471, 0, 1,
-3.064426, -0.1905304, -1.892856, 1, 0.01960784, 0, 1,
-2.933619, -3.139971, -3.545679, 1, 0.02352941, 0, 1,
-2.713259, 1.825256, -0.7967418, 1, 0.03137255, 0, 1,
-2.618136, 0.2856729, -1.106479, 1, 0.03529412, 0, 1,
-2.585554, 0.3720247, -2.997537, 1, 0.04313726, 0, 1,
-2.476104, 0.1790618, -2.131201, 1, 0.04705882, 0, 1,
-2.433579, 0.9272295, -0.5091053, 1, 0.05490196, 0, 1,
-2.254895, -0.5383164, -1.924018, 1, 0.05882353, 0, 1,
-2.24858, -1.062797, -3.627006, 1, 0.06666667, 0, 1,
-2.239444, 0.7510636, -1.122132, 1, 0.07058824, 0, 1,
-2.227874, 0.1735754, -1.538477, 1, 0.07843138, 0, 1,
-2.201833, -0.09950274, -3.148994, 1, 0.08235294, 0, 1,
-2.18439, 0.3410793, -0.5962124, 1, 0.09019608, 0, 1,
-2.181696, 0.046655, -0.8880733, 1, 0.09411765, 0, 1,
-2.177156, -0.2306094, -3.118142, 1, 0.1019608, 0, 1,
-2.176414, -0.43376, -3.503112, 1, 0.1098039, 0, 1,
-2.020206, -0.8292095, -1.689267, 1, 0.1137255, 0, 1,
-1.985544, -0.3924336, -1.776142, 1, 0.1215686, 0, 1,
-1.978139, -0.2657897, -2.718292, 1, 0.1254902, 0, 1,
-1.977731, -0.717999, -2.56487, 1, 0.1333333, 0, 1,
-1.92657, -1.328614, -1.523679, 1, 0.1372549, 0, 1,
-1.923, 0.02768345, -1.716183, 1, 0.145098, 0, 1,
-1.913659, -0.05735246, -2.489907, 1, 0.1490196, 0, 1,
-1.906765, -0.485265, -3.120128, 1, 0.1568628, 0, 1,
-1.885705, 0.3470767, -2.97043, 1, 0.1607843, 0, 1,
-1.820246, -1.185406, -1.289578, 1, 0.1686275, 0, 1,
-1.814791, 0.05160951, -0.5638208, 1, 0.172549, 0, 1,
-1.800072, 0.8958492, -2.10969, 1, 0.1803922, 0, 1,
-1.798878, 0.6815044, -3.288741, 1, 0.1843137, 0, 1,
-1.776413, -0.8296427, -0.1189379, 1, 0.1921569, 0, 1,
-1.766921, -0.9393511, -2.571373, 1, 0.1960784, 0, 1,
-1.724851, -0.1296779, -2.482879, 1, 0.2039216, 0, 1,
-1.721637, 0.4706164, -1.296906, 1, 0.2117647, 0, 1,
-1.708444, -1.338137, -1.374276, 1, 0.2156863, 0, 1,
-1.684906, -0.01436383, -1.973827, 1, 0.2235294, 0, 1,
-1.679862, -1.711516, -2.482538, 1, 0.227451, 0, 1,
-1.674008, -1.213144, -2.991874, 1, 0.2352941, 0, 1,
-1.671009, 0.3695334, -2.064581, 1, 0.2392157, 0, 1,
-1.65807, 2.469976, -0.5417525, 1, 0.2470588, 0, 1,
-1.654773, 0.01443498, -1.901295, 1, 0.2509804, 0, 1,
-1.62796, -1.187627, -3.12373, 1, 0.2588235, 0, 1,
-1.621799, 0.3587343, -1.050723, 1, 0.2627451, 0, 1,
-1.607311, -0.2238569, -2.146187, 1, 0.2705882, 0, 1,
-1.605657, 0.3467297, -0.6420286, 1, 0.2745098, 0, 1,
-1.581142, -0.7407354, -1.586367, 1, 0.282353, 0, 1,
-1.56872, 1.533409, -2.233424, 1, 0.2862745, 0, 1,
-1.563061, -0.1789185, -2.153227, 1, 0.2941177, 0, 1,
-1.559889, 1.438439, 1.630203, 1, 0.3019608, 0, 1,
-1.556719, 1.508451, -1.994746, 1, 0.3058824, 0, 1,
-1.550783, -0.9480377, -1.7024, 1, 0.3137255, 0, 1,
-1.548313, 0.8044704, -1.660925, 1, 0.3176471, 0, 1,
-1.53553, -1.057712, -1.882524, 1, 0.3254902, 0, 1,
-1.534743, 1.341281, -1.124571, 1, 0.3294118, 0, 1,
-1.533784, -0.9460987, -1.765711, 1, 0.3372549, 0, 1,
-1.513363, 0.1222203, -1.05289, 1, 0.3411765, 0, 1,
-1.502089, 0.2154136, -1.495277, 1, 0.3490196, 0, 1,
-1.498575, 0.3039929, -1.650555, 1, 0.3529412, 0, 1,
-1.484303, -1.10434, -2.320781, 1, 0.3607843, 0, 1,
-1.48098, 0.2177229, -1.404099, 1, 0.3647059, 0, 1,
-1.48088, -1.78926, 0.3048756, 1, 0.372549, 0, 1,
-1.471111, -0.5586905, -1.771515, 1, 0.3764706, 0, 1,
-1.465918, 0.8993259, -1.318928, 1, 0.3843137, 0, 1,
-1.463993, 1.236198, -0.7091342, 1, 0.3882353, 0, 1,
-1.438543, 0.424925, -2.711537, 1, 0.3960784, 0, 1,
-1.433236, 1.327535, -1.844131, 1, 0.4039216, 0, 1,
-1.426786, 0.5808757, 0.03860978, 1, 0.4078431, 0, 1,
-1.401823, -0.2171809, -2.316988, 1, 0.4156863, 0, 1,
-1.396459, 2.538399, 0.3095305, 1, 0.4196078, 0, 1,
-1.396223, 0.3907115, 0.5932493, 1, 0.427451, 0, 1,
-1.389189, 0.1519825, 0.1913635, 1, 0.4313726, 0, 1,
-1.359232, -0.3937084, -2.222053, 1, 0.4392157, 0, 1,
-1.355202, -0.1377926, -1.557929, 1, 0.4431373, 0, 1,
-1.353118, 1.570445, -2.05386, 1, 0.4509804, 0, 1,
-1.342643, 2.125364, -0.4847661, 1, 0.454902, 0, 1,
-1.339239, -0.6056598, -1.212889, 1, 0.4627451, 0, 1,
-1.331406, -0.02584976, -1.029867, 1, 0.4666667, 0, 1,
-1.329501, 0.2836806, -1.239998, 1, 0.4745098, 0, 1,
-1.322165, 0.329286, -1.42643, 1, 0.4784314, 0, 1,
-1.305262, -1.271019, -2.940918, 1, 0.4862745, 0, 1,
-1.298002, -0.7274815, -2.692341, 1, 0.4901961, 0, 1,
-1.290082, 0.8996509, -2.471251, 1, 0.4980392, 0, 1,
-1.285349, 0.5527313, -0.1035886, 1, 0.5058824, 0, 1,
-1.281503, -1.424451, -2.719821, 1, 0.509804, 0, 1,
-1.277823, 1.231674, -2.441864, 1, 0.5176471, 0, 1,
-1.273794, -0.08034103, -2.088243, 1, 0.5215687, 0, 1,
-1.270439, 0.2533893, -1.671585, 1, 0.5294118, 0, 1,
-1.264865, 0.7417948, 0.1901721, 1, 0.5333334, 0, 1,
-1.253696, 0.7273364, -2.208899, 1, 0.5411765, 0, 1,
-1.253165, -0.7918754, -3.445748, 1, 0.5450981, 0, 1,
-1.253095, 0.05948784, -0.7373311, 1, 0.5529412, 0, 1,
-1.243588, -1.738647, -3.2392, 1, 0.5568628, 0, 1,
-1.243271, -0.8189229, -2.061438, 1, 0.5647059, 0, 1,
-1.239458, -0.4438054, -3.019257, 1, 0.5686275, 0, 1,
-1.238255, -0.6349767, -1.125654, 1, 0.5764706, 0, 1,
-1.232502, 0.8965206, 0.5857817, 1, 0.5803922, 0, 1,
-1.230632, 0.2426334, -0.6549171, 1, 0.5882353, 0, 1,
-1.22888, -0.2339517, -2.770564, 1, 0.5921569, 0, 1,
-1.228431, 1.040361, -1.411388, 1, 0.6, 0, 1,
-1.227923, -0.75818, -1.298348, 1, 0.6078432, 0, 1,
-1.227485, 0.2539861, -1.165186, 1, 0.6117647, 0, 1,
-1.22212, -0.8587809, -2.305172, 1, 0.6196079, 0, 1,
-1.221892, -0.3422498, -1.736434, 1, 0.6235294, 0, 1,
-1.209995, -0.3651508, -1.514542, 1, 0.6313726, 0, 1,
-1.197127, -0.4200779, -1.667222, 1, 0.6352941, 0, 1,
-1.19556, -0.6517962, -2.472651, 1, 0.6431373, 0, 1,
-1.195182, -0.5896388, -2.380286, 1, 0.6470588, 0, 1,
-1.189667, -0.5640218, -2.23191, 1, 0.654902, 0, 1,
-1.187292, 0.4957072, -2.884114, 1, 0.6588235, 0, 1,
-1.185192, -0.4862437, -1.359228, 1, 0.6666667, 0, 1,
-1.179357, -0.3335307, -2.216504, 1, 0.6705883, 0, 1,
-1.179167, -0.2239337, -0.1759488, 1, 0.6784314, 0, 1,
-1.178726, 0.009647415, -1.713663, 1, 0.682353, 0, 1,
-1.178006, 0.09595951, -0.06470191, 1, 0.6901961, 0, 1,
-1.168279, -1.382234, -3.949576, 1, 0.6941177, 0, 1,
-1.159162, -0.1528116, -0.2244536, 1, 0.7019608, 0, 1,
-1.159096, -0.7409129, -2.645282, 1, 0.7098039, 0, 1,
-1.148187, 0.8968646, -2.465469, 1, 0.7137255, 0, 1,
-1.143762, -0.3192201, -2.20807, 1, 0.7215686, 0, 1,
-1.143452, 0.8355298, -1.056319, 1, 0.7254902, 0, 1,
-1.13185, -0.672869, -1.891848, 1, 0.7333333, 0, 1,
-1.122186, 1.448444, -0.8557044, 1, 0.7372549, 0, 1,
-1.119119, 1.927212, -2.043699, 1, 0.7450981, 0, 1,
-1.11623, -0.5187112, -2.188146, 1, 0.7490196, 0, 1,
-1.11369, 0.1483488, -1.173985, 1, 0.7568628, 0, 1,
-1.101762, -0.5429326, -0.6030363, 1, 0.7607843, 0, 1,
-1.099949, -0.9051332, -2.070018, 1, 0.7686275, 0, 1,
-1.099387, -0.6095973, -1.202783, 1, 0.772549, 0, 1,
-1.094321, -0.005707178, 0.4035045, 1, 0.7803922, 0, 1,
-1.087669, -0.3016086, -3.193449, 1, 0.7843137, 0, 1,
-1.082339, -0.05300133, -1.887836, 1, 0.7921569, 0, 1,
-1.078965, 1.491042, -1.439149, 1, 0.7960784, 0, 1,
-1.078488, -0.5281147, -1.15373, 1, 0.8039216, 0, 1,
-1.073567, -0.01748173, -3.848387, 1, 0.8117647, 0, 1,
-1.072819, -1.985877, -1.464347, 1, 0.8156863, 0, 1,
-1.067078, 1.11612, -0.9874373, 1, 0.8235294, 0, 1,
-1.06694, -0.5489308, -1.060065, 1, 0.827451, 0, 1,
-1.057006, -1.254318, -3.936853, 1, 0.8352941, 0, 1,
-1.04907, 0.4739794, -0.5948097, 1, 0.8392157, 0, 1,
-1.040642, 0.05261533, -0.6056902, 1, 0.8470588, 0, 1,
-1.039673, -2.355302, -4.400053, 1, 0.8509804, 0, 1,
-1.031176, -1.025748, -1.475926, 1, 0.8588235, 0, 1,
-1.028172, -0.4613798, -3.947534, 1, 0.8627451, 0, 1,
-1.026215, 1.345692, 0.0692009, 1, 0.8705882, 0, 1,
-1.016905, 1.016129, -0.07536171, 1, 0.8745098, 0, 1,
-1.016168, 2.846225, -1.582479, 1, 0.8823529, 0, 1,
-1.015284, -0.08281277, -1.108719, 1, 0.8862745, 0, 1,
-1.015055, 1.10219, -0.3019663, 1, 0.8941177, 0, 1,
-1.011308, -0.5448266, -0.5925676, 1, 0.8980392, 0, 1,
-0.9954433, -0.2552313, -0.5946628, 1, 0.9058824, 0, 1,
-0.9880782, -1.216503, -0.4651836, 1, 0.9137255, 0, 1,
-0.9824039, 0.2665171, -2.504358, 1, 0.9176471, 0, 1,
-0.9761458, -0.402073, -2.155297, 1, 0.9254902, 0, 1,
-0.9760184, -0.5500816, -2.027146, 1, 0.9294118, 0, 1,
-0.9758703, 0.9641126, -1.205264, 1, 0.9372549, 0, 1,
-0.961878, 0.1285169, -1.114859, 1, 0.9411765, 0, 1,
-0.9590285, 0.08083342, -1.271897, 1, 0.9490196, 0, 1,
-0.9488933, 0.5187233, -3.677608, 1, 0.9529412, 0, 1,
-0.9384576, -0.8199703, -2.192521, 1, 0.9607843, 0, 1,
-0.9374213, 0.7090265, -0.7243292, 1, 0.9647059, 0, 1,
-0.9239786, -0.9166737, -0.2470556, 1, 0.972549, 0, 1,
-0.9225848, 0.4090622, 0.2454061, 1, 0.9764706, 0, 1,
-0.9214496, -0.7651427, -2.309025, 1, 0.9843137, 0, 1,
-0.9175767, -0.7642044, -1.179374, 1, 0.9882353, 0, 1,
-0.9139277, -0.4386114, -1.419767, 1, 0.9960784, 0, 1,
-0.9129404, 0.5844032, -0.1582012, 0.9960784, 1, 0, 1,
-0.9089455, -0.1890723, -3.756415, 0.9921569, 1, 0, 1,
-0.908266, -1.40063, -2.974134, 0.9843137, 1, 0, 1,
-0.9072899, 1.858507, 0.1723098, 0.9803922, 1, 0, 1,
-0.904383, 0.5966908, -0.04327746, 0.972549, 1, 0, 1,
-0.9037905, 2.112715, -0.01645278, 0.9686275, 1, 0, 1,
-0.8993413, 0.250348, -0.9106222, 0.9607843, 1, 0, 1,
-0.896323, -0.1405156, 0.5514686, 0.9568627, 1, 0, 1,
-0.8960453, 0.2218287, -2.438322, 0.9490196, 1, 0, 1,
-0.8959519, 0.6585668, -0.1766029, 0.945098, 1, 0, 1,
-0.8948631, 1.452863, 0.623382, 0.9372549, 1, 0, 1,
-0.8924961, -0.5664636, -1.12516, 0.9333333, 1, 0, 1,
-0.8918864, -1.039816, -2.772326, 0.9254902, 1, 0, 1,
-0.8906853, 0.09896033, -0.4924551, 0.9215686, 1, 0, 1,
-0.888781, 0.02541079, -2.885987, 0.9137255, 1, 0, 1,
-0.8874582, 0.9187828, 0.7494439, 0.9098039, 1, 0, 1,
-0.8849837, 0.6096678, -0.9125624, 0.9019608, 1, 0, 1,
-0.8724997, -1.518932, -2.819314, 0.8941177, 1, 0, 1,
-0.8701409, -1.126437, -0.8925477, 0.8901961, 1, 0, 1,
-0.8524706, -1.075062, -3.042831, 0.8823529, 1, 0, 1,
-0.8481292, 1.646688, -1.413592, 0.8784314, 1, 0, 1,
-0.847706, -0.2814858, -2.751273, 0.8705882, 1, 0, 1,
-0.8368368, -1.002722, -2.757668, 0.8666667, 1, 0, 1,
-0.820165, -0.6653749, -2.853443, 0.8588235, 1, 0, 1,
-0.8094133, 0.252686, -1.211663, 0.854902, 1, 0, 1,
-0.8081479, -0.9275056, -2.162837, 0.8470588, 1, 0, 1,
-0.8039327, 0.1957311, -1.624057, 0.8431373, 1, 0, 1,
-0.798416, 2.379528, 0.2019623, 0.8352941, 1, 0, 1,
-0.7977148, -0.8475393, -1.250389, 0.8313726, 1, 0, 1,
-0.794578, -0.8482658, -2.03708, 0.8235294, 1, 0, 1,
-0.7936643, -1.094442, -2.215852, 0.8196079, 1, 0, 1,
-0.7932824, 0.2471239, -2.481055, 0.8117647, 1, 0, 1,
-0.7930902, 2.6711, 1.687132, 0.8078431, 1, 0, 1,
-0.7927097, 0.8966476, -0.340598, 0.8, 1, 0, 1,
-0.788304, -1.22674, -2.00856, 0.7921569, 1, 0, 1,
-0.7872379, -0.07461933, -2.883101, 0.7882353, 1, 0, 1,
-0.7862214, -0.1411472, 0.1459886, 0.7803922, 1, 0, 1,
-0.7841845, 1.240563, -0.496237, 0.7764706, 1, 0, 1,
-0.7821093, 0.1403609, -1.906501, 0.7686275, 1, 0, 1,
-0.7818499, -1.12988, -2.393071, 0.7647059, 1, 0, 1,
-0.7804525, -0.5280825, -4.374571, 0.7568628, 1, 0, 1,
-0.7783864, -0.7451132, -1.317335, 0.7529412, 1, 0, 1,
-0.7723365, -0.5464565, -1.782576, 0.7450981, 1, 0, 1,
-0.772245, 1.090673, -1.001673, 0.7411765, 1, 0, 1,
-0.7519795, 0.2415303, -1.922172, 0.7333333, 1, 0, 1,
-0.7500309, 1.938891, -0.9863255, 0.7294118, 1, 0, 1,
-0.7446585, 1.464728, -0.98759, 0.7215686, 1, 0, 1,
-0.7401863, -0.1536872, -1.810507, 0.7176471, 1, 0, 1,
-0.7371931, 0.1755969, -1.427715, 0.7098039, 1, 0, 1,
-0.727258, 0.5351549, 0.4049901, 0.7058824, 1, 0, 1,
-0.7227774, -0.5268905, -1.40415, 0.6980392, 1, 0, 1,
-0.7227479, 1.164535, -0.7377906, 0.6901961, 1, 0, 1,
-0.7181762, -0.06179999, -1.585847, 0.6862745, 1, 0, 1,
-0.7138219, -1.540281, -3.575122, 0.6784314, 1, 0, 1,
-0.7090879, -0.8235336, -1.905341, 0.6745098, 1, 0, 1,
-0.7029411, 0.5158474, 0.6615931, 0.6666667, 1, 0, 1,
-0.7018728, -1.260286, -1.855639, 0.6627451, 1, 0, 1,
-0.6999927, -0.1139252, -3.032881, 0.654902, 1, 0, 1,
-0.6963046, 0.2641559, -1.616535, 0.6509804, 1, 0, 1,
-0.6894205, -0.8510724, -2.197508, 0.6431373, 1, 0, 1,
-0.6779337, 2.021318, 0.8021308, 0.6392157, 1, 0, 1,
-0.6704867, -1.142599, -3.352128, 0.6313726, 1, 0, 1,
-0.6672112, 0.3140637, 0.1374778, 0.627451, 1, 0, 1,
-0.6654608, -1.344432, -1.966875, 0.6196079, 1, 0, 1,
-0.6614482, -0.4484491, -3.440867, 0.6156863, 1, 0, 1,
-0.6586226, -1.889004, -2.307719, 0.6078432, 1, 0, 1,
-0.6579318, -0.0327824, -1.376691, 0.6039216, 1, 0, 1,
-0.6578388, -0.8512639, -4.118349, 0.5960785, 1, 0, 1,
-0.6549768, -1.010813, -1.687036, 0.5882353, 1, 0, 1,
-0.6541758, -1.731782, -2.085293, 0.5843138, 1, 0, 1,
-0.6521065, 0.6407562, 0.57469, 0.5764706, 1, 0, 1,
-0.6472715, -0.03960047, -1.462421, 0.572549, 1, 0, 1,
-0.6424937, 2.034778, 0.6779118, 0.5647059, 1, 0, 1,
-0.6389743, 0.3656612, -1.464788, 0.5607843, 1, 0, 1,
-0.6359982, 0.8878514, -0.4664648, 0.5529412, 1, 0, 1,
-0.6319985, -0.8624441, -2.89974, 0.5490196, 1, 0, 1,
-0.6295703, 1.326442, 0.361212, 0.5411765, 1, 0, 1,
-0.6256943, 0.4329046, -2.262787, 0.5372549, 1, 0, 1,
-0.6207558, 1.122293, -1.405684, 0.5294118, 1, 0, 1,
-0.6193522, 0.2616693, -0.3581015, 0.5254902, 1, 0, 1,
-0.6192744, 0.4441245, -2.245968, 0.5176471, 1, 0, 1,
-0.618356, -0.7185341, -1.676313, 0.5137255, 1, 0, 1,
-0.6171588, -0.3049165, -1.734782, 0.5058824, 1, 0, 1,
-0.6128905, -0.1419058, -2.48697, 0.5019608, 1, 0, 1,
-0.6125641, -1.473597, -3.662634, 0.4941176, 1, 0, 1,
-0.6109045, -0.1178763, -1.794619, 0.4862745, 1, 0, 1,
-0.6079543, -1.97576, -2.458843, 0.4823529, 1, 0, 1,
-0.6073809, -0.2216377, -1.661644, 0.4745098, 1, 0, 1,
-0.6058323, -0.6735269, -2.271223, 0.4705882, 1, 0, 1,
-0.6055391, 1.407857, -0.6109118, 0.4627451, 1, 0, 1,
-0.6011265, 1.814041, 0.1942129, 0.4588235, 1, 0, 1,
-0.6010801, -1.292086, -3.649032, 0.4509804, 1, 0, 1,
-0.5999359, -0.61068, -2.332053, 0.4470588, 1, 0, 1,
-0.5957239, -0.4144528, -3.132545, 0.4392157, 1, 0, 1,
-0.5933942, 2.443156, -0.5449412, 0.4352941, 1, 0, 1,
-0.5904819, -2.21151, -0.6241997, 0.427451, 1, 0, 1,
-0.5877637, 0.4958979, -0.6461481, 0.4235294, 1, 0, 1,
-0.5863505, 0.01859842, -0.8319503, 0.4156863, 1, 0, 1,
-0.5847996, 0.5532584, -0.9796342, 0.4117647, 1, 0, 1,
-0.5774232, 0.9530728, -0.9617843, 0.4039216, 1, 0, 1,
-0.5759883, 0.4537552, -0.03501538, 0.3960784, 1, 0, 1,
-0.5737837, -1.113219, -1.945874, 0.3921569, 1, 0, 1,
-0.5732242, 0.8175887, -0.6505631, 0.3843137, 1, 0, 1,
-0.5690216, -0.5920495, -3.869565, 0.3803922, 1, 0, 1,
-0.568536, -1.386232, -2.112263, 0.372549, 1, 0, 1,
-0.5650817, 0.9807315, -1.038149, 0.3686275, 1, 0, 1,
-0.5626985, 0.4056329, -0.3874977, 0.3607843, 1, 0, 1,
-0.5612937, -1.165426, -2.593591, 0.3568628, 1, 0, 1,
-0.561074, 0.3205425, -2.592232, 0.3490196, 1, 0, 1,
-0.5482118, 0.04157909, -1.88741, 0.345098, 1, 0, 1,
-0.5475001, 0.5062773, -1.174864, 0.3372549, 1, 0, 1,
-0.5380045, -0.4681821, -2.143628, 0.3333333, 1, 0, 1,
-0.5366272, 0.03192466, -0.9920858, 0.3254902, 1, 0, 1,
-0.5364743, 1.576959, -1.684089, 0.3215686, 1, 0, 1,
-0.5354241, -0.2552183, -3.739032, 0.3137255, 1, 0, 1,
-0.5345901, 0.5712968, -1.606887, 0.3098039, 1, 0, 1,
-0.5320579, -0.6844952, -1.141309, 0.3019608, 1, 0, 1,
-0.5299724, -0.6094946, -3.592729, 0.2941177, 1, 0, 1,
-0.5279803, -0.6891212, -2.149374, 0.2901961, 1, 0, 1,
-0.5278957, 0.06190255, -1.821473, 0.282353, 1, 0, 1,
-0.5167906, -1.098009, -2.794325, 0.2784314, 1, 0, 1,
-0.5137359, 0.3444327, -0.8004004, 0.2705882, 1, 0, 1,
-0.5118052, 0.05204431, -1.026448, 0.2666667, 1, 0, 1,
-0.5059559, 0.4016181, -1.552914, 0.2588235, 1, 0, 1,
-0.5048325, -0.28031, -2.329288, 0.254902, 1, 0, 1,
-0.5040771, 1.229773, -0.6438841, 0.2470588, 1, 0, 1,
-0.5026124, -0.3146015, -3.682446, 0.2431373, 1, 0, 1,
-0.5019531, 0.9899803, -2.598108, 0.2352941, 1, 0, 1,
-0.4989473, -0.6029734, -3.236834, 0.2313726, 1, 0, 1,
-0.4970608, 1.307649, -1.400781, 0.2235294, 1, 0, 1,
-0.4909714, 1.507658, -0.2619903, 0.2196078, 1, 0, 1,
-0.4787006, 1.857729, 0.1538315, 0.2117647, 1, 0, 1,
-0.4771982, 1.206003, 0.8527775, 0.2078431, 1, 0, 1,
-0.4738996, -1.029837, -3.424847, 0.2, 1, 0, 1,
-0.4702473, 0.1808673, -2.028111, 0.1921569, 1, 0, 1,
-0.4701391, -0.8130171, -4.306824, 0.1882353, 1, 0, 1,
-0.4689211, -0.05426922, -2.233021, 0.1803922, 1, 0, 1,
-0.4665096, 1.271566, 0.11307, 0.1764706, 1, 0, 1,
-0.4581375, 0.1586987, -1.627189, 0.1686275, 1, 0, 1,
-0.4523553, 0.2494049, -0.9870589, 0.1647059, 1, 0, 1,
-0.4509704, -0.2171705, -4.17286, 0.1568628, 1, 0, 1,
-0.4494444, 0.07051989, -1.435993, 0.1529412, 1, 0, 1,
-0.448616, 0.8642775, -1.784967, 0.145098, 1, 0, 1,
-0.4447405, -0.5210167, -3.119974, 0.1411765, 1, 0, 1,
-0.4358492, -0.4538182, -2.807223, 0.1333333, 1, 0, 1,
-0.4325819, 1.704999, -0.3313514, 0.1294118, 1, 0, 1,
-0.4267052, -0.1722018, -3.118607, 0.1215686, 1, 0, 1,
-0.4217275, 0.08089972, -1.372422, 0.1176471, 1, 0, 1,
-0.4213319, -0.5961387, -2.73417, 0.1098039, 1, 0, 1,
-0.4117768, 0.09882972, -0.3892024, 0.1058824, 1, 0, 1,
-0.4083118, -0.735656, -2.397825, 0.09803922, 1, 0, 1,
-0.4064536, -1.493775, -2.288524, 0.09019608, 1, 0, 1,
-0.405328, -0.4983175, -2.046216, 0.08627451, 1, 0, 1,
-0.4039189, -0.3734086, -2.836756, 0.07843138, 1, 0, 1,
-0.4002643, -0.6788859, -2.937386, 0.07450981, 1, 0, 1,
-0.3999773, 0.0985643, -0.975547, 0.06666667, 1, 0, 1,
-0.3992924, 0.4225212, -1.070085, 0.0627451, 1, 0, 1,
-0.3958756, -0.4359622, -2.652873, 0.05490196, 1, 0, 1,
-0.3939498, 1.36887, -0.9048492, 0.05098039, 1, 0, 1,
-0.3888089, 0.7980098, -1.1689, 0.04313726, 1, 0, 1,
-0.3881589, -0.02995514, -3.617933, 0.03921569, 1, 0, 1,
-0.3869393, 0.07231814, -1.36003, 0.03137255, 1, 0, 1,
-0.385769, 2.456059, -1.42322, 0.02745098, 1, 0, 1,
-0.3813067, 0.06154606, -1.363568, 0.01960784, 1, 0, 1,
-0.3802155, -0.6527388, -2.829928, 0.01568628, 1, 0, 1,
-0.3797072, -0.2183306, -1.727881, 0.007843138, 1, 0, 1,
-0.3745483, 0.6262612, 0.1579042, 0.003921569, 1, 0, 1,
-0.3736703, -2.587651, -4.541876, 0, 1, 0.003921569, 1,
-0.3702193, -0.6906242, -2.588658, 0, 1, 0.01176471, 1,
-0.3698815, -0.240803, -1.144721, 0, 1, 0.01568628, 1,
-0.367897, 0.1986154, -1.425333, 0, 1, 0.02352941, 1,
-0.3674809, 0.3597588, -0.01227152, 0, 1, 0.02745098, 1,
-0.3655614, -0.8301769, -2.412004, 0, 1, 0.03529412, 1,
-0.3626677, -0.156632, -1.244476, 0, 1, 0.03921569, 1,
-0.3619835, -0.8183258, -2.069276, 0, 1, 0.04705882, 1,
-0.3611594, -0.1028126, -0.7970719, 0, 1, 0.05098039, 1,
-0.3549384, 0.1686402, -1.213401, 0, 1, 0.05882353, 1,
-0.3534793, 1.058937, 0.1804308, 0, 1, 0.0627451, 1,
-0.3528289, 0.908554, 0.1282837, 0, 1, 0.07058824, 1,
-0.3519448, 0.6438159, -0.5762358, 0, 1, 0.07450981, 1,
-0.3493722, 1.177794, 1.999578, 0, 1, 0.08235294, 1,
-0.3492673, -1.625541, -3.265515, 0, 1, 0.08627451, 1,
-0.3472528, 0.02735611, -0.7598518, 0, 1, 0.09411765, 1,
-0.3447125, 1.515191, -0.9737263, 0, 1, 0.1019608, 1,
-0.3430174, 0.3443334, 0.2427731, 0, 1, 0.1058824, 1,
-0.3428874, -0.2387305, -0.7444439, 0, 1, 0.1137255, 1,
-0.3417854, 0.2396894, -2.045059, 0, 1, 0.1176471, 1,
-0.3355454, 0.7739285, -0.8917972, 0, 1, 0.1254902, 1,
-0.3335623, -1.41746, -1.956689, 0, 1, 0.1294118, 1,
-0.3277391, 1.277979, -1.578882, 0, 1, 0.1372549, 1,
-0.3222918, -1.454925, -2.106789, 0, 1, 0.1411765, 1,
-0.3184597, -0.4828232, -2.536826, 0, 1, 0.1490196, 1,
-0.3170476, -0.1739512, -2.892005, 0, 1, 0.1529412, 1,
-0.312739, -0.5656698, -3.788952, 0, 1, 0.1607843, 1,
-0.3119644, -0.09296097, -2.418076, 0, 1, 0.1647059, 1,
-0.311724, 2.214847, -0.6732056, 0, 1, 0.172549, 1,
-0.3086183, -0.7743216, -3.848696, 0, 1, 0.1764706, 1,
-0.3068893, 0.3728532, -1.455569, 0, 1, 0.1843137, 1,
-0.3048441, 0.7866199, -0.7765804, 0, 1, 0.1882353, 1,
-0.3024504, -1.34274, -2.655084, 0, 1, 0.1960784, 1,
-0.3001089, -1.536705, -2.150485, 0, 1, 0.2039216, 1,
-0.2998559, -0.594435, -2.244252, 0, 1, 0.2078431, 1,
-0.2989064, 0.9044663, -1.65606, 0, 1, 0.2156863, 1,
-0.2984552, 0.8683583, -2.148708, 0, 1, 0.2196078, 1,
-0.2966956, -0.6343322, -2.931341, 0, 1, 0.227451, 1,
-0.296158, 0.4394911, 0.4836088, 0, 1, 0.2313726, 1,
-0.2917152, 1.085899, 0.07193919, 0, 1, 0.2392157, 1,
-0.286723, -0.1514798, -3.128242, 0, 1, 0.2431373, 1,
-0.28262, 0.1130301, -1.884876, 0, 1, 0.2509804, 1,
-0.279276, -0.5243572, -4.070557, 0, 1, 0.254902, 1,
-0.2775896, -0.5756529, -2.754634, 0, 1, 0.2627451, 1,
-0.2754104, -0.9672455, -3.567654, 0, 1, 0.2666667, 1,
-0.2736219, -0.5069842, -3.08487, 0, 1, 0.2745098, 1,
-0.2601484, 1.168552, 0.9162816, 0, 1, 0.2784314, 1,
-0.2569517, -0.3556092, -0.7619104, 0, 1, 0.2862745, 1,
-0.2555716, -0.960233, -1.642977, 0, 1, 0.2901961, 1,
-0.2543909, -0.5344427, -2.6856, 0, 1, 0.2980392, 1,
-0.2537489, 0.76071, -0.4159327, 0, 1, 0.3058824, 1,
-0.251449, -0.5600157, -2.513308, 0, 1, 0.3098039, 1,
-0.2503131, -0.8691394, -5.398353, 0, 1, 0.3176471, 1,
-0.2495234, -0.6985104, -2.162193, 0, 1, 0.3215686, 1,
-0.2481732, 0.275788, -1.230807, 0, 1, 0.3294118, 1,
-0.2471314, -1.020569, -3.382172, 0, 1, 0.3333333, 1,
-0.2468094, 1.066004, -1.530037, 0, 1, 0.3411765, 1,
-0.2450193, -0.8110027, -3.682279, 0, 1, 0.345098, 1,
-0.2389734, 0.006861834, -1.968454, 0, 1, 0.3529412, 1,
-0.2353385, -0.5453637, -4.343918, 0, 1, 0.3568628, 1,
-0.2344417, -0.5370477, -4.522248, 0, 1, 0.3647059, 1,
-0.2329469, -0.2941406, -2.378929, 0, 1, 0.3686275, 1,
-0.230179, -0.4862445, -2.698473, 0, 1, 0.3764706, 1,
-0.2272983, -0.494448, -2.582543, 0, 1, 0.3803922, 1,
-0.2270695, -3.223537, -3.793954, 0, 1, 0.3882353, 1,
-0.2268089, -0.5934899, -5.329587, 0, 1, 0.3921569, 1,
-0.2265416, 0.7729013, 2.166931, 0, 1, 0.4, 1,
-0.2263639, -3.006057, -3.522235, 0, 1, 0.4078431, 1,
-0.2244315, 0.818575, -0.9604827, 0, 1, 0.4117647, 1,
-0.2112599, -0.5692362, -4.37257, 0, 1, 0.4196078, 1,
-0.2040567, 1.285107, 1.536113, 0, 1, 0.4235294, 1,
-0.2025841, 1.067247, -0.1466341, 0, 1, 0.4313726, 1,
-0.1983364, 0.4188429, -1.101094, 0, 1, 0.4352941, 1,
-0.1964886, 0.4746659, -0.1747755, 0, 1, 0.4431373, 1,
-0.1901521, 0.9408916, -0.968765, 0, 1, 0.4470588, 1,
-0.1885548, 0.602809, 0.6167429, 0, 1, 0.454902, 1,
-0.1829582, -0.4633355, -3.05821, 0, 1, 0.4588235, 1,
-0.1823169, 1.674303, 0.8818794, 0, 1, 0.4666667, 1,
-0.1784266, -0.4717641, -4.765289, 0, 1, 0.4705882, 1,
-0.1752654, 0.5362426, 0.06564757, 0, 1, 0.4784314, 1,
-0.1715996, -0.1328509, -2.373035, 0, 1, 0.4823529, 1,
-0.1690552, -1.387696, -3.909734, 0, 1, 0.4901961, 1,
-0.1663379, -0.01329682, -0.9985069, 0, 1, 0.4941176, 1,
-0.1660493, 0.09104369, -0.6266993, 0, 1, 0.5019608, 1,
-0.1602052, -1.285727, -1.48203, 0, 1, 0.509804, 1,
-0.1592032, 0.09437753, -1.255261, 0, 1, 0.5137255, 1,
-0.1589254, -0.1911241, -0.9781248, 0, 1, 0.5215687, 1,
-0.1589251, 0.1919401, 0.4358427, 0, 1, 0.5254902, 1,
-0.1585488, -0.8210417, -2.722048, 0, 1, 0.5333334, 1,
-0.1584587, -1.154734, -1.606081, 0, 1, 0.5372549, 1,
-0.1568815, 1.348727, -0.9980818, 0, 1, 0.5450981, 1,
-0.1528414, -1.044413, -2.94349, 0, 1, 0.5490196, 1,
-0.150845, -0.2736234, -3.445996, 0, 1, 0.5568628, 1,
-0.1472457, -0.6220507, -1.90098, 0, 1, 0.5607843, 1,
-0.1462829, -0.7092241, -4.277673, 0, 1, 0.5686275, 1,
-0.1459766, -0.4542417, -2.013061, 0, 1, 0.572549, 1,
-0.1422961, 1.764757, 0.2293175, 0, 1, 0.5803922, 1,
-0.1308101, -1.024217, -1.37623, 0, 1, 0.5843138, 1,
-0.1294347, 0.3608115, 1.036515, 0, 1, 0.5921569, 1,
-0.1290962, -0.6789376, -2.859329, 0, 1, 0.5960785, 1,
-0.128961, 0.2095214, -1.571244, 0, 1, 0.6039216, 1,
-0.1286443, 0.736393, 0.4097835, 0, 1, 0.6117647, 1,
-0.1264155, 0.4521571, -0.9070508, 0, 1, 0.6156863, 1,
-0.1152576, -0.6018478, -5.33075, 0, 1, 0.6235294, 1,
-0.1123232, 0.4646978, -0.4163626, 0, 1, 0.627451, 1,
-0.1096262, -1.544685, -2.054811, 0, 1, 0.6352941, 1,
-0.1089492, 0.5046503, -0.498081, 0, 1, 0.6392157, 1,
-0.1076992, 0.5594739, 0.3639664, 0, 1, 0.6470588, 1,
-0.1067701, -0.003453626, -1.885941, 0, 1, 0.6509804, 1,
-0.1024279, 0.4105181, -0.1890632, 0, 1, 0.6588235, 1,
-0.1019049, 0.7121628, -0.3585896, 0, 1, 0.6627451, 1,
-0.1013827, 0.05370794, -3.660722, 0, 1, 0.6705883, 1,
-0.09911503, -0.6112192, -2.811594, 0, 1, 0.6745098, 1,
-0.0985634, 0.2953081, 0.8277961, 0, 1, 0.682353, 1,
-0.09526176, -1.241478, -2.705773, 0, 1, 0.6862745, 1,
-0.0921933, 0.5261277, 1.509182, 0, 1, 0.6941177, 1,
-0.0913306, 0.8936502, -1.259331, 0, 1, 0.7019608, 1,
-0.08215579, 1.914193, 0.158919, 0, 1, 0.7058824, 1,
-0.07808398, -1.79423, -1.045532, 0, 1, 0.7137255, 1,
-0.0753619, 0.6555094, 1.187712, 0, 1, 0.7176471, 1,
-0.07444937, -0.0004254288, -1.491557, 0, 1, 0.7254902, 1,
-0.07176023, 0.8208716, 0.786088, 0, 1, 0.7294118, 1,
-0.07150713, -0.2405198, -2.828346, 0, 1, 0.7372549, 1,
-0.07097199, -1.189353, -3.619018, 0, 1, 0.7411765, 1,
-0.06737959, -0.2032957, -2.409453, 0, 1, 0.7490196, 1,
-0.06184011, -1.331661, -2.123792, 0, 1, 0.7529412, 1,
-0.06102722, 0.2011921, -1.120679, 0, 1, 0.7607843, 1,
-0.06080907, 0.511157, -1.655345, 0, 1, 0.7647059, 1,
-0.06079604, 0.4324174, -0.4201522, 0, 1, 0.772549, 1,
-0.05868077, 0.3722679, -1.036466, 0, 1, 0.7764706, 1,
-0.05522772, -0.5910837, -3.24138, 0, 1, 0.7843137, 1,
-0.05146271, 0.05859781, -0.0008924778, 0, 1, 0.7882353, 1,
-0.04702288, -2.496598, -2.272536, 0, 1, 0.7960784, 1,
-0.0441092, 0.534075, 0.07235104, 0, 1, 0.8039216, 1,
-0.04405368, 1.286334, 0.4669915, 0, 1, 0.8078431, 1,
-0.04310898, 0.4384161, -1.259937, 0, 1, 0.8156863, 1,
-0.0418091, -0.2658091, -2.392808, 0, 1, 0.8196079, 1,
-0.03850336, -0.5873483, -2.85416, 0, 1, 0.827451, 1,
-0.03672535, 1.125935, -0.06681213, 0, 1, 0.8313726, 1,
-0.03250112, 1.504102, 0.7156743, 0, 1, 0.8392157, 1,
-0.03249386, 0.4812407, 0.4333302, 0, 1, 0.8431373, 1,
-0.03234062, -0.5696027, -1.266571, 0, 1, 0.8509804, 1,
-0.02842489, -0.2567021, -3.135923, 0, 1, 0.854902, 1,
-0.02825817, 0.1202446, 0.0324329, 0, 1, 0.8627451, 1,
-0.0274631, 1.716548, 0.6542791, 0, 1, 0.8666667, 1,
-0.02441542, -0.3224959, -2.39358, 0, 1, 0.8745098, 1,
-0.01835242, 0.7196232, -0.7330057, 0, 1, 0.8784314, 1,
-0.01261158, 2.035813, 1.985365, 0, 1, 0.8862745, 1,
-0.01026523, -0.4928032, -2.976956, 0, 1, 0.8901961, 1,
-0.01021361, 0.8184285, 1.103873, 0, 1, 0.8980392, 1,
-0.006930924, 0.2086722, -0.7270827, 0, 1, 0.9058824, 1,
-0.002233573, 0.5529324, -0.4929024, 0, 1, 0.9098039, 1,
-0.001006028, 1.657304, -1.37935, 0, 1, 0.9176471, 1,
0.001436213, 1.424688, 2.235112, 0, 1, 0.9215686, 1,
0.00185184, 0.3722213, 0.4934523, 0, 1, 0.9294118, 1,
0.003775741, -1.767397, 2.274756, 0, 1, 0.9333333, 1,
0.007055583, 1.243342, 0.4755296, 0, 1, 0.9411765, 1,
0.007181066, 0.01755559, -1.105836, 0, 1, 0.945098, 1,
0.009755039, 0.6701277, -1.865258, 0, 1, 0.9529412, 1,
0.01392098, -0.5576275, 3.418214, 0, 1, 0.9568627, 1,
0.02112782, -1.353076, 1.608127, 0, 1, 0.9647059, 1,
0.02207633, 1.00117, -0.505434, 0, 1, 0.9686275, 1,
0.02293242, 0.7558247, 2.194805, 0, 1, 0.9764706, 1,
0.02324861, 0.06195278, -0.3542751, 0, 1, 0.9803922, 1,
0.02343572, 0.9489871, 1.007885, 0, 1, 0.9882353, 1,
0.02400422, -2.081479, 2.555252, 0, 1, 0.9921569, 1,
0.02963739, 1.004444, 0.1397714, 0, 1, 1, 1,
0.03034353, 0.3071077, -0.2308185, 0, 0.9921569, 1, 1,
0.03081689, -0.532222, 3.889558, 0, 0.9882353, 1, 1,
0.03233008, 0.7933741, 0.6237563, 0, 0.9803922, 1, 1,
0.03631369, 0.4521001, 0.4089605, 0, 0.9764706, 1, 1,
0.0400519, -1.42273, 3.756807, 0, 0.9686275, 1, 1,
0.04027472, 1.334689, 0.2698801, 0, 0.9647059, 1, 1,
0.04249742, -1.011546, 3.443828, 0, 0.9568627, 1, 1,
0.0427057, 0.2146856, 1.140441, 0, 0.9529412, 1, 1,
0.05497832, -2.689762, 2.984537, 0, 0.945098, 1, 1,
0.05607497, -1.154675, 2.285913, 0, 0.9411765, 1, 1,
0.05709194, -1.907253, 4.486008, 0, 0.9333333, 1, 1,
0.05835408, -0.8649541, 2.664153, 0, 0.9294118, 1, 1,
0.05917601, -0.7367753, 2.729503, 0, 0.9215686, 1, 1,
0.05985334, -0.8486596, 2.48637, 0, 0.9176471, 1, 1,
0.06257875, 1.349197, -1.612319, 0, 0.9098039, 1, 1,
0.06365862, 0.4170193, 1.922941, 0, 0.9058824, 1, 1,
0.06532842, -1.449492, 2.993452, 0, 0.8980392, 1, 1,
0.06598752, 1.025442, -2.373008, 0, 0.8901961, 1, 1,
0.06900904, 1.205868, 0.05653444, 0, 0.8862745, 1, 1,
0.06924593, -0.4089203, 1.616445, 0, 0.8784314, 1, 1,
0.07275102, -0.4486155, 4.292433, 0, 0.8745098, 1, 1,
0.07284152, -0.1812579, 0.7877756, 0, 0.8666667, 1, 1,
0.07313084, -0.09595542, 1.478813, 0, 0.8627451, 1, 1,
0.08132777, -0.4975811, 2.876581, 0, 0.854902, 1, 1,
0.08405648, 0.08959382, 0.5509443, 0, 0.8509804, 1, 1,
0.08578241, -2.773777, 2.359505, 0, 0.8431373, 1, 1,
0.0882387, -1.56365, 2.225351, 0, 0.8392157, 1, 1,
0.09205665, 1.10838, -1.010183, 0, 0.8313726, 1, 1,
0.09258229, 0.004941537, 1.118098, 0, 0.827451, 1, 1,
0.09380653, -0.9932058, 2.849591, 0, 0.8196079, 1, 1,
0.09423802, 1.055029, 2.275342, 0, 0.8156863, 1, 1,
0.09515341, 0.4525019, -0.03465994, 0, 0.8078431, 1, 1,
0.09847527, 0.9997311, -0.5826674, 0, 0.8039216, 1, 1,
0.09847821, 0.4410482, 2.219678, 0, 0.7960784, 1, 1,
0.1027943, -0.2350287, 2.463642, 0, 0.7882353, 1, 1,
0.1040753, 0.03604669, 0.5518288, 0, 0.7843137, 1, 1,
0.1105165, 1.255941, -0.4792401, 0, 0.7764706, 1, 1,
0.1109127, 0.2720646, 1.528676, 0, 0.772549, 1, 1,
0.1121029, -0.3571967, 3.971767, 0, 0.7647059, 1, 1,
0.1122945, 0.1393549, 1.761433, 0, 0.7607843, 1, 1,
0.1124265, -0.4522787, 3.060609, 0, 0.7529412, 1, 1,
0.1135186, 0.1609831, -0.5174489, 0, 0.7490196, 1, 1,
0.1139774, -1.193525, 3.218044, 0, 0.7411765, 1, 1,
0.1140855, -1.817453, 3.66125, 0, 0.7372549, 1, 1,
0.1154798, -0.99007, 1.608377, 0, 0.7294118, 1, 1,
0.115656, 2.1084, -0.6938151, 0, 0.7254902, 1, 1,
0.1176491, 0.1313244, 1.206087, 0, 0.7176471, 1, 1,
0.122715, 0.6122007, -0.1659677, 0, 0.7137255, 1, 1,
0.1244437, -1.592755, 3.207455, 0, 0.7058824, 1, 1,
0.132609, 0.4327868, -0.9822167, 0, 0.6980392, 1, 1,
0.1349795, 1.107581, -0.6027941, 0, 0.6941177, 1, 1,
0.1360933, -1.009705, 3.734353, 0, 0.6862745, 1, 1,
0.1366703, 0.2985081, 1.922499, 0, 0.682353, 1, 1,
0.1382931, 0.5627203, 0.07532305, 0, 0.6745098, 1, 1,
0.1393812, 0.1414264, 0.7091316, 0, 0.6705883, 1, 1,
0.1406913, 1.328499, -0.1753654, 0, 0.6627451, 1, 1,
0.1427455, -1.332515, 1.306002, 0, 0.6588235, 1, 1,
0.1464403, -3.217017, 3.584315, 0, 0.6509804, 1, 1,
0.1465859, -1.261751, 2.364242, 0, 0.6470588, 1, 1,
0.1466675, -2.264735, 2.51491, 0, 0.6392157, 1, 1,
0.1491923, 0.176886, 1.676817, 0, 0.6352941, 1, 1,
0.1502676, 1.622448, -0.2448669, 0, 0.627451, 1, 1,
0.1523072, -0.6962977, 2.238391, 0, 0.6235294, 1, 1,
0.1527515, -1.036084, 4.107502, 0, 0.6156863, 1, 1,
0.1588453, 1.707821, -2.025577, 0, 0.6117647, 1, 1,
0.1677098, 0.06233667, 2.683407, 0, 0.6039216, 1, 1,
0.1710923, 1.590087, 0.4108175, 0, 0.5960785, 1, 1,
0.1769054, -0.5652999, 4.128765, 0, 0.5921569, 1, 1,
0.1791896, -0.5603251, 2.883546, 0, 0.5843138, 1, 1,
0.1798109, 1.307276, -0.478843, 0, 0.5803922, 1, 1,
0.1850477, 1.417279, 0.423578, 0, 0.572549, 1, 1,
0.1852025, -1.189266, 3.308122, 0, 0.5686275, 1, 1,
0.1860221, 0.4106774, 1.387562, 0, 0.5607843, 1, 1,
0.1860941, -0.7682482, 2.20178, 0, 0.5568628, 1, 1,
0.1867851, -0.3143032, 2.529297, 0, 0.5490196, 1, 1,
0.1874754, 0.7767834, 0.3240382, 0, 0.5450981, 1, 1,
0.1931148, 1.068222, 2.181051, 0, 0.5372549, 1, 1,
0.1933473, 0.5038709, 0.09801017, 0, 0.5333334, 1, 1,
0.1938273, -0.03484464, 2.081515, 0, 0.5254902, 1, 1,
0.2033314, 0.6262582, -0.0244809, 0, 0.5215687, 1, 1,
0.2083423, 1.663137, 0.818849, 0, 0.5137255, 1, 1,
0.2092436, 0.8522753, -0.718574, 0, 0.509804, 1, 1,
0.210157, 0.06861228, 2.357387, 0, 0.5019608, 1, 1,
0.211765, -0.7733304, 2.066101, 0, 0.4941176, 1, 1,
0.2123342, -1.551122, 4.434666, 0, 0.4901961, 1, 1,
0.2137764, 1.908215, -1.049885, 0, 0.4823529, 1, 1,
0.2172481, -0.02001389, 1.348516, 0, 0.4784314, 1, 1,
0.2193856, -1.576293, 2.617926, 0, 0.4705882, 1, 1,
0.2265859, 1.42534, 1.191414, 0, 0.4666667, 1, 1,
0.2314019, 0.2259637, -0.4206736, 0, 0.4588235, 1, 1,
0.2320907, -0.002129273, 1.525427, 0, 0.454902, 1, 1,
0.2399055, 1.059234, -0.4400721, 0, 0.4470588, 1, 1,
0.2409196, 0.7851984, 0.8198068, 0, 0.4431373, 1, 1,
0.2466681, -2.034193, 3.177794, 0, 0.4352941, 1, 1,
0.2489681, -0.8677036, 1.788126, 0, 0.4313726, 1, 1,
0.2501152, -0.7267198, 4.411127, 0, 0.4235294, 1, 1,
0.2540039, -0.2223223, 1.812922, 0, 0.4196078, 1, 1,
0.2550796, -0.9247293, 3.940364, 0, 0.4117647, 1, 1,
0.2560471, 0.7425339, 1.633977, 0, 0.4078431, 1, 1,
0.2570358, 0.6077679, 2.2795, 0, 0.4, 1, 1,
0.2582232, -0.199283, 3.085024, 0, 0.3921569, 1, 1,
0.2593713, 1.469092, -0.4156442, 0, 0.3882353, 1, 1,
0.2614874, 0.235341, 0.9163578, 0, 0.3803922, 1, 1,
0.2629223, 0.9018129, 1.00961, 0, 0.3764706, 1, 1,
0.2659993, -0.6296844, 2.331135, 0, 0.3686275, 1, 1,
0.2671466, -2.116413, 2.725311, 0, 0.3647059, 1, 1,
0.2676877, -0.07124054, 3.270897, 0, 0.3568628, 1, 1,
0.2695166, 0.6069171, -0.8054525, 0, 0.3529412, 1, 1,
0.2702729, 0.292165, 0.6329049, 0, 0.345098, 1, 1,
0.2718954, -0.6443806, 1.679917, 0, 0.3411765, 1, 1,
0.2782061, -0.8738958, 1.991839, 0, 0.3333333, 1, 1,
0.2784663, -0.9217483, 4.104956, 0, 0.3294118, 1, 1,
0.28151, 1.76501, 1.132414, 0, 0.3215686, 1, 1,
0.281998, 0.9313819, -1.357249, 0, 0.3176471, 1, 1,
0.2843057, 1.337965, 0.2875369, 0, 0.3098039, 1, 1,
0.2872408, -0.1252428, 1.319677, 0, 0.3058824, 1, 1,
0.2881321, 0.8204368, 1.38101, 0, 0.2980392, 1, 1,
0.2927461, 1.192328, -0.7591143, 0, 0.2901961, 1, 1,
0.2950915, -0.4086441, 1.597196, 0, 0.2862745, 1, 1,
0.2979776, -0.02760997, 3.260284, 0, 0.2784314, 1, 1,
0.2986435, -2.283557, 4.786018, 0, 0.2745098, 1, 1,
0.3042692, 0.9757937, -0.3685432, 0, 0.2666667, 1, 1,
0.3065357, 0.96429, -1.917321, 0, 0.2627451, 1, 1,
0.3069615, -0.1235839, 0.7877709, 0, 0.254902, 1, 1,
0.3072209, -0.7359807, 2.000679, 0, 0.2509804, 1, 1,
0.310748, -0.6025592, 3.444589, 0, 0.2431373, 1, 1,
0.3107691, -1.102776, 1.734405, 0, 0.2392157, 1, 1,
0.3116816, -0.1484815, 2.391229, 0, 0.2313726, 1, 1,
0.3182643, 1.001364, -0.1197388, 0, 0.227451, 1, 1,
0.3221586, -0.1668523, 2.85422, 0, 0.2196078, 1, 1,
0.3224751, -0.599372, 1.461062, 0, 0.2156863, 1, 1,
0.3238222, -0.9660381, 1.657758, 0, 0.2078431, 1, 1,
0.3255221, -0.3348886, 1.325047, 0, 0.2039216, 1, 1,
0.3322329, 0.2776968, 2.324995, 0, 0.1960784, 1, 1,
0.3327837, -0.9083316, 3.974571, 0, 0.1882353, 1, 1,
0.3378402, 0.3687253, 0.2873829, 0, 0.1843137, 1, 1,
0.3424597, 0.7375379, 2.036172, 0, 0.1764706, 1, 1,
0.3430533, 0.02816656, 3.230304, 0, 0.172549, 1, 1,
0.343254, -1.776063, 2.994147, 0, 0.1647059, 1, 1,
0.34331, -0.3126341, 4.090502, 0, 0.1607843, 1, 1,
0.3488186, 0.7599813, 0.1530167, 0, 0.1529412, 1, 1,
0.3489087, 0.3570018, 2.200419, 0, 0.1490196, 1, 1,
0.3501247, -1.118586, 2.177689, 0, 0.1411765, 1, 1,
0.3567535, -0.01266662, 0.889396, 0, 0.1372549, 1, 1,
0.3580482, -2.005041, 3.250914, 0, 0.1294118, 1, 1,
0.3608306, -1.918954, 4.40015, 0, 0.1254902, 1, 1,
0.3643052, -0.9921901, 4.75341, 0, 0.1176471, 1, 1,
0.3644791, 0.6983911, 0.2548822, 0, 0.1137255, 1, 1,
0.3690357, 0.3954093, 1.948097, 0, 0.1058824, 1, 1,
0.370432, -1.344205, 2.80914, 0, 0.09803922, 1, 1,
0.3728688, -0.08359414, 3.39601, 0, 0.09411765, 1, 1,
0.373749, -0.2201394, 1.753348, 0, 0.08627451, 1, 1,
0.3748937, 1.185362, -0.3369576, 0, 0.08235294, 1, 1,
0.3749164, -0.7582104, 3.620068, 0, 0.07450981, 1, 1,
0.378093, 0.3211693, 0.7614318, 0, 0.07058824, 1, 1,
0.3836946, 0.2833091, -0.09250044, 0, 0.0627451, 1, 1,
0.3839645, 0.6875395, 2.352871, 0, 0.05882353, 1, 1,
0.3852203, 0.1313855, 2.226618, 0, 0.05098039, 1, 1,
0.3859954, 0.0718245, 1.216784, 0, 0.04705882, 1, 1,
0.3878887, -0.9878627, 2.448566, 0, 0.03921569, 1, 1,
0.3881668, 0.938931, 0.4408404, 0, 0.03529412, 1, 1,
0.3884816, -0.2407355, 3.012905, 0, 0.02745098, 1, 1,
0.3899492, 0.6223908, 0.9705864, 0, 0.02352941, 1, 1,
0.3937532, -0.3965333, 0.7930655, 0, 0.01568628, 1, 1,
0.3945378, 0.6686455, 0.08481319, 0, 0.01176471, 1, 1,
0.3948716, 0.4495607, -1.702539, 0, 0.003921569, 1, 1,
0.3968078, -0.1132797, 4.29606, 0.003921569, 0, 1, 1,
0.4078436, -2.047981, 2.779537, 0.007843138, 0, 1, 1,
0.4121179, -0.5590847, 2.482361, 0.01568628, 0, 1, 1,
0.4155947, -0.6484376, 4.163352, 0.01960784, 0, 1, 1,
0.4170142, 0.6071613, -0.6283416, 0.02745098, 0, 1, 1,
0.417413, -1.110543, 2.032665, 0.03137255, 0, 1, 1,
0.4232173, -0.4039826, 0.8067461, 0.03921569, 0, 1, 1,
0.4233895, 1.460506, -0.8880423, 0.04313726, 0, 1, 1,
0.4242278, 1.033683, 0.8016061, 0.05098039, 0, 1, 1,
0.4277648, -0.1244041, 2.804807, 0.05490196, 0, 1, 1,
0.4290564, 0.3434583, 1.546599, 0.0627451, 0, 1, 1,
0.4298121, -0.7325186, 2.27388, 0.06666667, 0, 1, 1,
0.4298749, 0.2435732, 2.352588, 0.07450981, 0, 1, 1,
0.4306649, 0.1545156, 1.100417, 0.07843138, 0, 1, 1,
0.4327483, -0.02474481, 2.168619, 0.08627451, 0, 1, 1,
0.4429639, 0.1057443, 2.039413, 0.09019608, 0, 1, 1,
0.4432282, -1.504509, 2.075834, 0.09803922, 0, 1, 1,
0.4469642, -0.7717953, 1.857382, 0.1058824, 0, 1, 1,
0.4471751, 1.060296, 0.7659629, 0.1098039, 0, 1, 1,
0.4483046, -1.133507, 3.490419, 0.1176471, 0, 1, 1,
0.4503832, -0.6969293, 1.982205, 0.1215686, 0, 1, 1,
0.4509908, 0.2490081, 3.365944, 0.1294118, 0, 1, 1,
0.4517955, -0.4752834, 1.775713, 0.1333333, 0, 1, 1,
0.4576751, 2.131541, -1.331452, 0.1411765, 0, 1, 1,
0.4587096, -1.479774, 3.564179, 0.145098, 0, 1, 1,
0.4605543, -0.2649197, 3.838679, 0.1529412, 0, 1, 1,
0.4606826, 0.5125918, -1.197772, 0.1568628, 0, 1, 1,
0.4719538, -1.913664, 1.951889, 0.1647059, 0, 1, 1,
0.4734206, -0.1994384, 3.406061, 0.1686275, 0, 1, 1,
0.4768472, -0.4794061, 0.8508936, 0.1764706, 0, 1, 1,
0.4782249, 0.317963, 1.011852, 0.1803922, 0, 1, 1,
0.4845668, 1.161953, 0.4375315, 0.1882353, 0, 1, 1,
0.4849491, -0.9693539, 3.715178, 0.1921569, 0, 1, 1,
0.4988469, -0.6223295, 1.460783, 0.2, 0, 1, 1,
0.5012177, 0.3729467, 2.160986, 0.2078431, 0, 1, 1,
0.5025516, -1.153789, -0.9909586, 0.2117647, 0, 1, 1,
0.5086613, -1.745934, 3.082735, 0.2196078, 0, 1, 1,
0.5097438, -1.56663, 5.124762, 0.2235294, 0, 1, 1,
0.509932, 2.463944, -1.43208, 0.2313726, 0, 1, 1,
0.5104151, -1.118226, 4.091459, 0.2352941, 0, 1, 1,
0.5141788, 0.2936485, 2.192792, 0.2431373, 0, 1, 1,
0.5142336, -0.04640144, 1.701536, 0.2470588, 0, 1, 1,
0.5188823, -1.243523, 3.671718, 0.254902, 0, 1, 1,
0.5257638, 1.209123, -0.8116984, 0.2588235, 0, 1, 1,
0.5277367, -0.05324743, 1.358053, 0.2666667, 0, 1, 1,
0.5366184, 1.282865, 0.931782, 0.2705882, 0, 1, 1,
0.5577919, -0.201364, 2.738885, 0.2784314, 0, 1, 1,
0.5579324, -0.2497362, -0.4468994, 0.282353, 0, 1, 1,
0.5629883, -0.750836, 2.239748, 0.2901961, 0, 1, 1,
0.5657276, -1.996905, 2.567036, 0.2941177, 0, 1, 1,
0.569217, 0.1881829, 1.473479, 0.3019608, 0, 1, 1,
0.5708174, 1.043093, -0.2781256, 0.3098039, 0, 1, 1,
0.5734304, -0.1833576, 1.23099, 0.3137255, 0, 1, 1,
0.5740604, -0.7569653, -0.2173499, 0.3215686, 0, 1, 1,
0.5796263, 1.065865, 1.673117, 0.3254902, 0, 1, 1,
0.5797716, -0.4786224, 1.731467, 0.3333333, 0, 1, 1,
0.5809574, 2.479543, 0.7524382, 0.3372549, 0, 1, 1,
0.5910141, 0.03068566, 0.9232374, 0.345098, 0, 1, 1,
0.596258, -0.7458229, 2.153628, 0.3490196, 0, 1, 1,
0.5988265, -0.6219581, 1.871521, 0.3568628, 0, 1, 1,
0.6001461, 0.1590368, 1.949169, 0.3607843, 0, 1, 1,
0.6007157, -0.3874025, 0.7705097, 0.3686275, 0, 1, 1,
0.6026025, 0.8456267, 0.5273027, 0.372549, 0, 1, 1,
0.6100999, -0.3441331, 0.5488283, 0.3803922, 0, 1, 1,
0.6222593, 1.893415, -0.1577395, 0.3843137, 0, 1, 1,
0.6246954, -0.3380134, 1.998664, 0.3921569, 0, 1, 1,
0.6293036, -0.2475347, 3.173068, 0.3960784, 0, 1, 1,
0.6362266, -0.4032388, 2.778172, 0.4039216, 0, 1, 1,
0.6363378, -0.6439279, 4.764569, 0.4117647, 0, 1, 1,
0.6386498, 1.388958, -0.5014058, 0.4156863, 0, 1, 1,
0.6404152, -0.1191143, 0.4588055, 0.4235294, 0, 1, 1,
0.6408736, 1.029304, 1.201326, 0.427451, 0, 1, 1,
0.6445029, 0.4624378, 1.918559, 0.4352941, 0, 1, 1,
0.6460547, 1.165187, 0.9433141, 0.4392157, 0, 1, 1,
0.6477953, -0.06897251, 3.58947, 0.4470588, 0, 1, 1,
0.6503836, 0.4330495, 2.088985, 0.4509804, 0, 1, 1,
0.6554739, -1.524205, 4.258582, 0.4588235, 0, 1, 1,
0.656728, 0.9718971, 1.013138, 0.4627451, 0, 1, 1,
0.6597216, 0.329493, 0.9028364, 0.4705882, 0, 1, 1,
0.6646727, -1.465484, 1.019136, 0.4745098, 0, 1, 1,
0.665458, 0.1785443, 1.930468, 0.4823529, 0, 1, 1,
0.6668018, -0.1688197, 2.743674, 0.4862745, 0, 1, 1,
0.6671942, 1.46835, 0.4422323, 0.4941176, 0, 1, 1,
0.6711056, 0.1344085, 1.537828, 0.5019608, 0, 1, 1,
0.6840412, -2.628022, 3.967422, 0.5058824, 0, 1, 1,
0.6885879, -0.05588147, 1.375911, 0.5137255, 0, 1, 1,
0.6923286, 1.717868, 1.757878, 0.5176471, 0, 1, 1,
0.694864, -0.8695196, 1.740753, 0.5254902, 0, 1, 1,
0.6961592, 0.2578653, 2.706731, 0.5294118, 0, 1, 1,
0.6989834, 0.2265343, 1.169524, 0.5372549, 0, 1, 1,
0.7208527, 1.200512, 0.1440996, 0.5411765, 0, 1, 1,
0.7262479, 1.732361, 0.5931835, 0.5490196, 0, 1, 1,
0.7323843, -0.5628906, 2.234329, 0.5529412, 0, 1, 1,
0.7341151, -0.2302842, 2.171885, 0.5607843, 0, 1, 1,
0.7359831, -0.5672673, 2.301685, 0.5647059, 0, 1, 1,
0.7401765, -1.384842, 3.204341, 0.572549, 0, 1, 1,
0.7420475, -1.531632, 3.864549, 0.5764706, 0, 1, 1,
0.7439336, 0.03996537, 2.156817, 0.5843138, 0, 1, 1,
0.7516301, -1.140185, 3.164478, 0.5882353, 0, 1, 1,
0.7517488, -0.7536231, 2.365548, 0.5960785, 0, 1, 1,
0.75267, 1.014272, 1.464864, 0.6039216, 0, 1, 1,
0.7549833, -0.6051591, 2.194598, 0.6078432, 0, 1, 1,
0.7577061, 2.318229, 0.5478344, 0.6156863, 0, 1, 1,
0.7601977, -1.629462, 4.254945, 0.6196079, 0, 1, 1,
0.7622905, -0.945836, 1.592677, 0.627451, 0, 1, 1,
0.7634558, -0.9926457, 1.55892, 0.6313726, 0, 1, 1,
0.7639465, 0.6849589, 0.2628869, 0.6392157, 0, 1, 1,
0.7668232, 0.05100127, 2.163154, 0.6431373, 0, 1, 1,
0.7673197, -0.525052, 1.342263, 0.6509804, 0, 1, 1,
0.771275, -0.309537, 2.104913, 0.654902, 0, 1, 1,
0.771793, 0.1775459, 0.1461554, 0.6627451, 0, 1, 1,
0.7723921, 0.184, 2.859672, 0.6666667, 0, 1, 1,
0.7733042, 1.931388, -0.686981, 0.6745098, 0, 1, 1,
0.7814313, -0.06347832, 1.403877, 0.6784314, 0, 1, 1,
0.7848497, 0.05259586, 2.631832, 0.6862745, 0, 1, 1,
0.7894776, 1.072349, 1.482535, 0.6901961, 0, 1, 1,
0.7920656, -0.5005816, 3.530833, 0.6980392, 0, 1, 1,
0.7929823, 0.5250236, -0.3526199, 0.7058824, 0, 1, 1,
0.7940184, 0.6718479, 1.469927, 0.7098039, 0, 1, 1,
0.7973145, 1.512922, -0.7237159, 0.7176471, 0, 1, 1,
0.7990469, 1.990406, -0.1885133, 0.7215686, 0, 1, 1,
0.7991449, 0.4975632, 0.3217331, 0.7294118, 0, 1, 1,
0.8139845, 1.219382, 0.6834686, 0.7333333, 0, 1, 1,
0.8160688, 0.4441495, -1.45571, 0.7411765, 0, 1, 1,
0.8163236, -1.226928, 2.210834, 0.7450981, 0, 1, 1,
0.8163946, -0.651191, 1.872495, 0.7529412, 0, 1, 1,
0.8186048, -0.5028826, 0.9827281, 0.7568628, 0, 1, 1,
0.8263192, -1.341278, 1.982521, 0.7647059, 0, 1, 1,
0.8420679, -2.210163, 3.868908, 0.7686275, 0, 1, 1,
0.8423788, -0.3113568, 3.12324, 0.7764706, 0, 1, 1,
0.846115, -0.2765864, 4.557506, 0.7803922, 0, 1, 1,
0.8476791, 0.00638284, 3.115803, 0.7882353, 0, 1, 1,
0.8488905, 0.6992788, 0.8282329, 0.7921569, 0, 1, 1,
0.857034, 0.7470561, -0.417787, 0.8, 0, 1, 1,
0.8582224, -0.3892479, 2.584493, 0.8078431, 0, 1, 1,
0.8602942, -1.471163, 1.747212, 0.8117647, 0, 1, 1,
0.861852, 1.016857, -0.5259145, 0.8196079, 0, 1, 1,
0.8637413, -1.015217, 0.7603073, 0.8235294, 0, 1, 1,
0.8664651, -0.06071749, 2.610535, 0.8313726, 0, 1, 1,
0.8669655, -0.8820873, 1.471507, 0.8352941, 0, 1, 1,
0.8711854, 0.8818874, 0.8860153, 0.8431373, 0, 1, 1,
0.8809139, 0.243802, 2.953404, 0.8470588, 0, 1, 1,
0.8875526, -0.3030466, 0.9780665, 0.854902, 0, 1, 1,
0.890733, 0.006908388, 1.792741, 0.8588235, 0, 1, 1,
0.8915466, -0.2957144, 1.802649, 0.8666667, 0, 1, 1,
0.8973363, 0.865712, -0.8677254, 0.8705882, 0, 1, 1,
0.8976735, -0.07836487, 0.1001111, 0.8784314, 0, 1, 1,
0.9041657, 2.279562, 1.522083, 0.8823529, 0, 1, 1,
0.9196936, -0.2883879, 1.203885, 0.8901961, 0, 1, 1,
0.9238455, 0.6456447, 0.09288038, 0.8941177, 0, 1, 1,
0.9239963, -0.7762321, 2.467315, 0.9019608, 0, 1, 1,
0.928757, -0.3893373, 1.467972, 0.9098039, 0, 1, 1,
0.9311869, -0.4633945, 2.5959, 0.9137255, 0, 1, 1,
0.935232, 0.1410503, 0.06041052, 0.9215686, 0, 1, 1,
0.9426328, 2.470255, 0.6935352, 0.9254902, 0, 1, 1,
0.9430842, -1.409909, 3.337609, 0.9333333, 0, 1, 1,
0.9454603, 1.115427, 2.176253, 0.9372549, 0, 1, 1,
0.9493677, -0.7722706, 2.111288, 0.945098, 0, 1, 1,
0.9512089, 0.6866722, 2.083065, 0.9490196, 0, 1, 1,
0.9545889, 2.056112, 0.8532346, 0.9568627, 0, 1, 1,
0.9581267, 1.655828, 2.021693, 0.9607843, 0, 1, 1,
0.9638913, -0.03902404, 1.086562, 0.9686275, 0, 1, 1,
0.965496, -0.3557616, 1.082927, 0.972549, 0, 1, 1,
0.9668729, 1.853608, 1.122534, 0.9803922, 0, 1, 1,
0.9776492, 0.09959003, 2.657538, 0.9843137, 0, 1, 1,
0.9777415, 0.4766551, 1.39299, 0.9921569, 0, 1, 1,
0.9821479, -0.8387677, 2.223906, 0.9960784, 0, 1, 1,
0.9822564, 0.5589913, 1.763838, 1, 0, 0.9960784, 1,
0.9843001, 0.1650936, 1.74632, 1, 0, 0.9882353, 1,
0.9887506, -0.4568206, 3.584197, 1, 0, 0.9843137, 1,
0.9932286, 0.8871751, 2.151104, 1, 0, 0.9764706, 1,
0.9971928, -1.006579, 1.336907, 1, 0, 0.972549, 1,
0.9994286, -0.1087284, 1.244748, 1, 0, 0.9647059, 1,
0.9995976, -0.009780768, 1.586896, 1, 0, 0.9607843, 1,
1.010646, -0.8546547, 2.413489, 1, 0, 0.9529412, 1,
1.02279, 0.5081463, 1.885968, 1, 0, 0.9490196, 1,
1.023695, 0.7662268, 0.7996182, 1, 0, 0.9411765, 1,
1.027602, -1.696925, 2.928768, 1, 0, 0.9372549, 1,
1.038168, 0.1116897, 1.76077, 1, 0, 0.9294118, 1,
1.038301, 0.3395387, 1.021134, 1, 0, 0.9254902, 1,
1.040939, -1.126474, 3.009535, 1, 0, 0.9176471, 1,
1.045489, 0.1303213, 1.249253, 1, 0, 0.9137255, 1,
1.045699, 2.129479, 0.03464401, 1, 0, 0.9058824, 1,
1.050193, -0.09334914, 2.173045, 1, 0, 0.9019608, 1,
1.050312, 1.114115, -2.632305, 1, 0, 0.8941177, 1,
1.051024, -1.140327, 3.45945, 1, 0, 0.8862745, 1,
1.053177, -1.97935, 4.146675, 1, 0, 0.8823529, 1,
1.05947, -0.3911249, 2.957408, 1, 0, 0.8745098, 1,
1.060144, 1.644226, 0.3799244, 1, 0, 0.8705882, 1,
1.065143, -0.446139, 0.6262572, 1, 0, 0.8627451, 1,
1.067219, -0.5634212, 3.156286, 1, 0, 0.8588235, 1,
1.067494, -1.236491, 1.707315, 1, 0, 0.8509804, 1,
1.071113, -0.3780271, 2.695943, 1, 0, 0.8470588, 1,
1.071256, 0.5068244, -0.500478, 1, 0, 0.8392157, 1,
1.073275, 0.6439754, 0.9751143, 1, 0, 0.8352941, 1,
1.073618, -0.68292, -0.130989, 1, 0, 0.827451, 1,
1.075957, 0.6048837, 0.03472099, 1, 0, 0.8235294, 1,
1.077767, -0.8317218, 2.541165, 1, 0, 0.8156863, 1,
1.094369, -1.401776, 1.849666, 1, 0, 0.8117647, 1,
1.103021, -0.0289788, 0.7204061, 1, 0, 0.8039216, 1,
1.103993, 0.6033527, 0.03877114, 1, 0, 0.7960784, 1,
1.111829, 0.9369553, 1.27279, 1, 0, 0.7921569, 1,
1.113487, -0.0401184, 0.1450313, 1, 0, 0.7843137, 1,
1.117745, 1.407589, 1.27149, 1, 0, 0.7803922, 1,
1.118502, 1.012432, -0.08162328, 1, 0, 0.772549, 1,
1.118997, 0.4441637, 1.945017, 1, 0, 0.7686275, 1,
1.119204, -0.772937, 0.7214108, 1, 0, 0.7607843, 1,
1.120533, -0.4922232, 2.858786, 1, 0, 0.7568628, 1,
1.121936, -1.722429, 1.685609, 1, 0, 0.7490196, 1,
1.122485, 0.07848802, -0.7654281, 1, 0, 0.7450981, 1,
1.130211, -0.07681815, 2.197088, 1, 0, 0.7372549, 1,
1.134288, -0.5301981, 1.888749, 1, 0, 0.7333333, 1,
1.138701, 1.765913, 0.4817353, 1, 0, 0.7254902, 1,
1.160804, 0.3098211, 0.3933392, 1, 0, 0.7215686, 1,
1.16708, 1.010759, 0.591913, 1, 0, 0.7137255, 1,
1.183109, 0.2436376, 0.4223206, 1, 0, 0.7098039, 1,
1.184362, -1.133955, 2.544607, 1, 0, 0.7019608, 1,
1.190127, 2.045983, 0.6200982, 1, 0, 0.6941177, 1,
1.190166, -0.9718858, 1.328346, 1, 0, 0.6901961, 1,
1.194806, 1.410502, 0.5790638, 1, 0, 0.682353, 1,
1.196788, 0.7220407, -0.2187447, 1, 0, 0.6784314, 1,
1.198394, 0.549157, -0.08196018, 1, 0, 0.6705883, 1,
1.199186, -1.334801, 3.592298, 1, 0, 0.6666667, 1,
1.206073, -0.9271054, 1.159312, 1, 0, 0.6588235, 1,
1.211567, -1.506582, 1.290975, 1, 0, 0.654902, 1,
1.215422, 0.001015753, 1.949861, 1, 0, 0.6470588, 1,
1.216174, -2.144176, 2.502921, 1, 0, 0.6431373, 1,
1.23281, 0.4532417, 1.257925, 1, 0, 0.6352941, 1,
1.234752, 1.689928, 0.4292186, 1, 0, 0.6313726, 1,
1.245431, -3.402205, 3.317169, 1, 0, 0.6235294, 1,
1.247221, -1.155418, 3.336847, 1, 0, 0.6196079, 1,
1.247766, 0.5110209, 0.6341919, 1, 0, 0.6117647, 1,
1.251264, 0.2172088, 1.162925, 1, 0, 0.6078432, 1,
1.256299, -0.2609766, 2.24321, 1, 0, 0.6, 1,
1.256709, -1.016614, 2.860441, 1, 0, 0.5921569, 1,
1.273391, -1.395238, 3.354757, 1, 0, 0.5882353, 1,
1.275257, 0.03812335, 0.1432496, 1, 0, 0.5803922, 1,
1.294576, -0.9968773, 1.260963, 1, 0, 0.5764706, 1,
1.308335, 1.641053, 0.278067, 1, 0, 0.5686275, 1,
1.310479, 0.7649177, 0.03991503, 1, 0, 0.5647059, 1,
1.314722, 1.02993, -1.053416, 1, 0, 0.5568628, 1,
1.33069, 2.91922, 1.628354, 1, 0, 0.5529412, 1,
1.340679, 0.6460953, 0.4734489, 1, 0, 0.5450981, 1,
1.3413, 2.063001, 0.1630378, 1, 0, 0.5411765, 1,
1.342285, -1.127671, 2.847943, 1, 0, 0.5333334, 1,
1.343623, 0.9917173, 2.462505, 1, 0, 0.5294118, 1,
1.344677, -0.01041254, 0.2049091, 1, 0, 0.5215687, 1,
1.352533, 1.09103, 1.9927, 1, 0, 0.5176471, 1,
1.364306, -0.3199286, 0.1588028, 1, 0, 0.509804, 1,
1.399065, -0.1250406, 1.903623, 1, 0, 0.5058824, 1,
1.418854, -0.1929378, 0.8824114, 1, 0, 0.4980392, 1,
1.420362, -1.735962, 1.699262, 1, 0, 0.4901961, 1,
1.425261, -0.548531, 1.077841, 1, 0, 0.4862745, 1,
1.426937, -1.283173, 2.827461, 1, 0, 0.4784314, 1,
1.427517, -0.37718, 1.28152, 1, 0, 0.4745098, 1,
1.43666, -1.279547, 2.099147, 1, 0, 0.4666667, 1,
1.441253, 0.07147601, 2.296621, 1, 0, 0.4627451, 1,
1.441489, 0.3492115, 2.556132, 1, 0, 0.454902, 1,
1.443844, -0.4720613, 2.827073, 1, 0, 0.4509804, 1,
1.46567, -0.1639761, -0.09036063, 1, 0, 0.4431373, 1,
1.466761, -0.649708, 4.040634, 1, 0, 0.4392157, 1,
1.471998, 1.283209, 0.8538988, 1, 0, 0.4313726, 1,
1.477621, 1.205392, 0.1666818, 1, 0, 0.427451, 1,
1.478721, 0.3819295, 0.5556186, 1, 0, 0.4196078, 1,
1.485942, 0.253909, 2.7229, 1, 0, 0.4156863, 1,
1.487273, 0.9189091, 1.786964, 1, 0, 0.4078431, 1,
1.493125, -2.478112, 2.612475, 1, 0, 0.4039216, 1,
1.494946, 0.672745, 1.398777, 1, 0, 0.3960784, 1,
1.511523, 1.526134, 0.3714379, 1, 0, 0.3882353, 1,
1.520082, -1.090914, 2.043255, 1, 0, 0.3843137, 1,
1.523385, 0.2330523, 2.288931, 1, 0, 0.3764706, 1,
1.55095, -1.479581, 2.307538, 1, 0, 0.372549, 1,
1.556964, -1.041796, 2.489095, 1, 0, 0.3647059, 1,
1.56621, 0.7611767, 1.043681, 1, 0, 0.3607843, 1,
1.58261, -0.1586538, 1.260002, 1, 0, 0.3529412, 1,
1.585529, 0.3042154, 1.79707, 1, 0, 0.3490196, 1,
1.597029, -0.07538499, 0.9930013, 1, 0, 0.3411765, 1,
1.621421, -1.482629, 1.569415, 1, 0, 0.3372549, 1,
1.630515, -0.3944634, 3.793243, 1, 0, 0.3294118, 1,
1.66998, 0.8267701, 1.450772, 1, 0, 0.3254902, 1,
1.670019, 1.532526, -0.7999055, 1, 0, 0.3176471, 1,
1.672623, 1.86347, 0.1349151, 1, 0, 0.3137255, 1,
1.684283, 1.325599, 0.9826241, 1, 0, 0.3058824, 1,
1.697131, -0.6670813, 1.986061, 1, 0, 0.2980392, 1,
1.71434, 0.2148258, 0.91014, 1, 0, 0.2941177, 1,
1.723301, -0.3535308, 2.215798, 1, 0, 0.2862745, 1,
1.727068, 0.03619883, 2.333453, 1, 0, 0.282353, 1,
1.727501, 0.4285608, 1.787803, 1, 0, 0.2745098, 1,
1.733113, -0.5725451, 1.980335, 1, 0, 0.2705882, 1,
1.755176, 0.9836342, 2.026701, 1, 0, 0.2627451, 1,
1.757751, -0.378335, 2.487392, 1, 0, 0.2588235, 1,
1.767094, 0.3681179, -0.3717699, 1, 0, 0.2509804, 1,
1.789282, 0.8110554, 1.634974, 1, 0, 0.2470588, 1,
1.796546, 1.097954, 2.385309, 1, 0, 0.2392157, 1,
1.801403, 1.169079, 0.824017, 1, 0, 0.2352941, 1,
1.801727, -2.340839, 2.845115, 1, 0, 0.227451, 1,
1.805278, 1.487502, 0.06052448, 1, 0, 0.2235294, 1,
1.806434, -0.8453319, 2.297904, 1, 0, 0.2156863, 1,
1.825467, -1.607365, 3.123666, 1, 0, 0.2117647, 1,
1.826273, -0.2674119, 0.5695286, 1, 0, 0.2039216, 1,
1.855717, 1.487369, 0.6288896, 1, 0, 0.1960784, 1,
1.856228, -0.1136026, 1.162034, 1, 0, 0.1921569, 1,
1.876864, -0.5592327, 2.708532, 1, 0, 0.1843137, 1,
1.879439, -0.6868902, 2.909931, 1, 0, 0.1803922, 1,
1.881858, -0.8574754, 1.688942, 1, 0, 0.172549, 1,
1.891379, 0.6681685, 2.67188, 1, 0, 0.1686275, 1,
1.907408, -0.3233013, 3.084238, 1, 0, 0.1607843, 1,
1.917804, -0.07898468, 2.026391, 1, 0, 0.1568628, 1,
2.009937, -0.404033, 0.06439422, 1, 0, 0.1490196, 1,
2.012916, -0.6081765, 1.785146, 1, 0, 0.145098, 1,
2.019708, 2.099356, -0.4737639, 1, 0, 0.1372549, 1,
2.026404, -0.6237646, 0.5543615, 1, 0, 0.1333333, 1,
2.041896, -0.1546783, 1.79328, 1, 0, 0.1254902, 1,
2.059129, 0.8478422, 1.358868, 1, 0, 0.1215686, 1,
2.064399, -1.311518, 1.948047, 1, 0, 0.1137255, 1,
2.067358, -0.5681466, 2.890722, 1, 0, 0.1098039, 1,
2.141032, -0.192853, 1.327452, 1, 0, 0.1019608, 1,
2.181944, -0.4511975, 1.914057, 1, 0, 0.09411765, 1,
2.194875, -0.3446983, -0.3863496, 1, 0, 0.09019608, 1,
2.241761, 0.07751087, 2.522489, 1, 0, 0.08235294, 1,
2.252628, 0.2789472, 1.050042, 1, 0, 0.07843138, 1,
2.266287, -0.9737941, 0.9808876, 1, 0, 0.07058824, 1,
2.298228, 0.9549508, 1.292002, 1, 0, 0.06666667, 1,
2.303394, -0.6238161, 3.144577, 1, 0, 0.05882353, 1,
2.363809, -0.1755679, -0.1177723, 1, 0, 0.05490196, 1,
2.374624, -0.4176474, 1.286057, 1, 0, 0.04705882, 1,
2.421048, -0.3289725, 2.306917, 1, 0, 0.04313726, 1,
2.422852, -1.352276, 1.459514, 1, 0, 0.03529412, 1,
2.539207, -0.8538131, 3.170968, 1, 0, 0.03137255, 1,
2.630606, -0.8020428, 3.134604, 1, 0, 0.02352941, 1,
2.764704, 0.6638774, 1.97395, 1, 0, 0.01960784, 1,
2.783621, 0.9554734, -2.23959, 1, 0, 0.01176471, 1,
2.901168, -1.172472, 3.408118, 1, 0, 0.007843138, 1
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
-0.3012058, -4.473687, -7.182021, 0, -0.5, 0.5, 0.5,
-0.3012058, -4.473687, -7.182021, 1, -0.5, 0.5, 0.5,
-0.3012058, -4.473687, -7.182021, 1, 1.5, 0.5, 0.5,
-0.3012058, -4.473687, -7.182021, 0, 1.5, 0.5, 0.5
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
-4.589184, -0.2414927, -7.182021, 0, -0.5, 0.5, 0.5,
-4.589184, -0.2414927, -7.182021, 1, -0.5, 0.5, 0.5,
-4.589184, -0.2414927, -7.182021, 1, 1.5, 0.5, 0.5,
-4.589184, -0.2414927, -7.182021, 0, 1.5, 0.5, 0.5
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
-4.589184, -4.473687, -0.1367958, 0, -0.5, 0.5, 0.5,
-4.589184, -4.473687, -0.1367958, 1, -0.5, 0.5, 0.5,
-4.589184, -4.473687, -0.1367958, 1, 1.5, 0.5, 0.5,
-4.589184, -4.473687, -0.1367958, 0, 1.5, 0.5, 0.5
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
-3, -3.497027, -5.5562,
2, -3.497027, -5.5562,
-3, -3.497027, -5.5562,
-3, -3.659804, -5.82717,
-2, -3.497027, -5.5562,
-2, -3.659804, -5.82717,
-1, -3.497027, -5.5562,
-1, -3.659804, -5.82717,
0, -3.497027, -5.5562,
0, -3.659804, -5.82717,
1, -3.497027, -5.5562,
1, -3.659804, -5.82717,
2, -3.497027, -5.5562,
2, -3.659804, -5.82717
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
-3, -3.985357, -6.369111, 0, -0.5, 0.5, 0.5,
-3, -3.985357, -6.369111, 1, -0.5, 0.5, 0.5,
-3, -3.985357, -6.369111, 1, 1.5, 0.5, 0.5,
-3, -3.985357, -6.369111, 0, 1.5, 0.5, 0.5,
-2, -3.985357, -6.369111, 0, -0.5, 0.5, 0.5,
-2, -3.985357, -6.369111, 1, -0.5, 0.5, 0.5,
-2, -3.985357, -6.369111, 1, 1.5, 0.5, 0.5,
-2, -3.985357, -6.369111, 0, 1.5, 0.5, 0.5,
-1, -3.985357, -6.369111, 0, -0.5, 0.5, 0.5,
-1, -3.985357, -6.369111, 1, -0.5, 0.5, 0.5,
-1, -3.985357, -6.369111, 1, 1.5, 0.5, 0.5,
-1, -3.985357, -6.369111, 0, 1.5, 0.5, 0.5,
0, -3.985357, -6.369111, 0, -0.5, 0.5, 0.5,
0, -3.985357, -6.369111, 1, -0.5, 0.5, 0.5,
0, -3.985357, -6.369111, 1, 1.5, 0.5, 0.5,
0, -3.985357, -6.369111, 0, 1.5, 0.5, 0.5,
1, -3.985357, -6.369111, 0, -0.5, 0.5, 0.5,
1, -3.985357, -6.369111, 1, -0.5, 0.5, 0.5,
1, -3.985357, -6.369111, 1, 1.5, 0.5, 0.5,
1, -3.985357, -6.369111, 0, 1.5, 0.5, 0.5,
2, -3.985357, -6.369111, 0, -0.5, 0.5, 0.5,
2, -3.985357, -6.369111, 1, -0.5, 0.5, 0.5,
2, -3.985357, -6.369111, 1, 1.5, 0.5, 0.5,
2, -3.985357, -6.369111, 0, 1.5, 0.5, 0.5
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
-3.59965, -3, -5.5562,
-3.59965, 2, -5.5562,
-3.59965, -3, -5.5562,
-3.764573, -3, -5.82717,
-3.59965, -2, -5.5562,
-3.764573, -2, -5.82717,
-3.59965, -1, -5.5562,
-3.764573, -1, -5.82717,
-3.59965, 0, -5.5562,
-3.764573, 0, -5.82717,
-3.59965, 1, -5.5562,
-3.764573, 1, -5.82717,
-3.59965, 2, -5.5562,
-3.764573, 2, -5.82717
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
-4.094417, -3, -6.369111, 0, -0.5, 0.5, 0.5,
-4.094417, -3, -6.369111, 1, -0.5, 0.5, 0.5,
-4.094417, -3, -6.369111, 1, 1.5, 0.5, 0.5,
-4.094417, -3, -6.369111, 0, 1.5, 0.5, 0.5,
-4.094417, -2, -6.369111, 0, -0.5, 0.5, 0.5,
-4.094417, -2, -6.369111, 1, -0.5, 0.5, 0.5,
-4.094417, -2, -6.369111, 1, 1.5, 0.5, 0.5,
-4.094417, -2, -6.369111, 0, 1.5, 0.5, 0.5,
-4.094417, -1, -6.369111, 0, -0.5, 0.5, 0.5,
-4.094417, -1, -6.369111, 1, -0.5, 0.5, 0.5,
-4.094417, -1, -6.369111, 1, 1.5, 0.5, 0.5,
-4.094417, -1, -6.369111, 0, 1.5, 0.5, 0.5,
-4.094417, 0, -6.369111, 0, -0.5, 0.5, 0.5,
-4.094417, 0, -6.369111, 1, -0.5, 0.5, 0.5,
-4.094417, 0, -6.369111, 1, 1.5, 0.5, 0.5,
-4.094417, 0, -6.369111, 0, 1.5, 0.5, 0.5,
-4.094417, 1, -6.369111, 0, -0.5, 0.5, 0.5,
-4.094417, 1, -6.369111, 1, -0.5, 0.5, 0.5,
-4.094417, 1, -6.369111, 1, 1.5, 0.5, 0.5,
-4.094417, 1, -6.369111, 0, 1.5, 0.5, 0.5,
-4.094417, 2, -6.369111, 0, -0.5, 0.5, 0.5,
-4.094417, 2, -6.369111, 1, -0.5, 0.5, 0.5,
-4.094417, 2, -6.369111, 1, 1.5, 0.5, 0.5,
-4.094417, 2, -6.369111, 0, 1.5, 0.5, 0.5
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
-3.59965, -3.497027, -4,
-3.59965, -3.497027, 4,
-3.59965, -3.497027, -4,
-3.764573, -3.659804, -4,
-3.59965, -3.497027, -2,
-3.764573, -3.659804, -2,
-3.59965, -3.497027, 0,
-3.764573, -3.659804, 0,
-3.59965, -3.497027, 2,
-3.764573, -3.659804, 2,
-3.59965, -3.497027, 4,
-3.764573, -3.659804, 4
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
-4.094417, -3.985357, -4, 0, -0.5, 0.5, 0.5,
-4.094417, -3.985357, -4, 1, -0.5, 0.5, 0.5,
-4.094417, -3.985357, -4, 1, 1.5, 0.5, 0.5,
-4.094417, -3.985357, -4, 0, 1.5, 0.5, 0.5,
-4.094417, -3.985357, -2, 0, -0.5, 0.5, 0.5,
-4.094417, -3.985357, -2, 1, -0.5, 0.5, 0.5,
-4.094417, -3.985357, -2, 1, 1.5, 0.5, 0.5,
-4.094417, -3.985357, -2, 0, 1.5, 0.5, 0.5,
-4.094417, -3.985357, 0, 0, -0.5, 0.5, 0.5,
-4.094417, -3.985357, 0, 1, -0.5, 0.5, 0.5,
-4.094417, -3.985357, 0, 1, 1.5, 0.5, 0.5,
-4.094417, -3.985357, 0, 0, 1.5, 0.5, 0.5,
-4.094417, -3.985357, 2, 0, -0.5, 0.5, 0.5,
-4.094417, -3.985357, 2, 1, -0.5, 0.5, 0.5,
-4.094417, -3.985357, 2, 1, 1.5, 0.5, 0.5,
-4.094417, -3.985357, 2, 0, 1.5, 0.5, 0.5,
-4.094417, -3.985357, 4, 0, -0.5, 0.5, 0.5,
-4.094417, -3.985357, 4, 1, -0.5, 0.5, 0.5,
-4.094417, -3.985357, 4, 1, 1.5, 0.5, 0.5,
-4.094417, -3.985357, 4, 0, 1.5, 0.5, 0.5
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
-3.59965, -3.497027, -5.5562,
-3.59965, 3.014041, -5.5562,
-3.59965, -3.497027, 5.282609,
-3.59965, 3.014041, 5.282609,
-3.59965, -3.497027, -5.5562,
-3.59965, -3.497027, 5.282609,
-3.59965, 3.014041, -5.5562,
-3.59965, 3.014041, 5.282609,
-3.59965, -3.497027, -5.5562,
2.997239, -3.497027, -5.5562,
-3.59965, -3.497027, 5.282609,
2.997239, -3.497027, 5.282609,
-3.59965, 3.014041, -5.5562,
2.997239, 3.014041, -5.5562,
-3.59965, 3.014041, 5.282609,
2.997239, 3.014041, 5.282609,
2.997239, -3.497027, -5.5562,
2.997239, 3.014041, -5.5562,
2.997239, -3.497027, 5.282609,
2.997239, 3.014041, 5.282609,
2.997239, -3.497027, -5.5562,
2.997239, -3.497027, 5.282609,
2.997239, 3.014041, -5.5562,
2.997239, 3.014041, 5.282609
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
var radius = 7.615408;
var distance = 33.88181;
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
mvMatrix.translate( 0.3012058, 0.2414927, 0.1367958 );
mvMatrix.scale( 1.248153, 1.264605, 0.759671 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.88181);
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
TZA<-read.table("TZA.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-TZA$V2
```

```
## Error in eval(expr, envir, enclos): object 'TZA' not found
```

```r
y<-TZA$V3
```

```
## Error in eval(expr, envir, enclos): object 'TZA' not found
```

```r
z<-TZA$V4
```

```
## Error in eval(expr, envir, enclos): object 'TZA' not found
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
-3.503579, -0.9354377, -0.9141641, 0, 0, 1, 1, 1,
-3.389397, -0.4428135, -1.174145, 1, 0, 0, 1, 1,
-3.207869, -0.3828333, -1.19059, 1, 0, 0, 1, 1,
-3.064426, -0.1905304, -1.892856, 1, 0, 0, 1, 1,
-2.933619, -3.139971, -3.545679, 1, 0, 0, 1, 1,
-2.713259, 1.825256, -0.7967418, 1, 0, 0, 1, 1,
-2.618136, 0.2856729, -1.106479, 0, 0, 0, 1, 1,
-2.585554, 0.3720247, -2.997537, 0, 0, 0, 1, 1,
-2.476104, 0.1790618, -2.131201, 0, 0, 0, 1, 1,
-2.433579, 0.9272295, -0.5091053, 0, 0, 0, 1, 1,
-2.254895, -0.5383164, -1.924018, 0, 0, 0, 1, 1,
-2.24858, -1.062797, -3.627006, 0, 0, 0, 1, 1,
-2.239444, 0.7510636, -1.122132, 0, 0, 0, 1, 1,
-2.227874, 0.1735754, -1.538477, 1, 1, 1, 1, 1,
-2.201833, -0.09950274, -3.148994, 1, 1, 1, 1, 1,
-2.18439, 0.3410793, -0.5962124, 1, 1, 1, 1, 1,
-2.181696, 0.046655, -0.8880733, 1, 1, 1, 1, 1,
-2.177156, -0.2306094, -3.118142, 1, 1, 1, 1, 1,
-2.176414, -0.43376, -3.503112, 1, 1, 1, 1, 1,
-2.020206, -0.8292095, -1.689267, 1, 1, 1, 1, 1,
-1.985544, -0.3924336, -1.776142, 1, 1, 1, 1, 1,
-1.978139, -0.2657897, -2.718292, 1, 1, 1, 1, 1,
-1.977731, -0.717999, -2.56487, 1, 1, 1, 1, 1,
-1.92657, -1.328614, -1.523679, 1, 1, 1, 1, 1,
-1.923, 0.02768345, -1.716183, 1, 1, 1, 1, 1,
-1.913659, -0.05735246, -2.489907, 1, 1, 1, 1, 1,
-1.906765, -0.485265, -3.120128, 1, 1, 1, 1, 1,
-1.885705, 0.3470767, -2.97043, 1, 1, 1, 1, 1,
-1.820246, -1.185406, -1.289578, 0, 0, 1, 1, 1,
-1.814791, 0.05160951, -0.5638208, 1, 0, 0, 1, 1,
-1.800072, 0.8958492, -2.10969, 1, 0, 0, 1, 1,
-1.798878, 0.6815044, -3.288741, 1, 0, 0, 1, 1,
-1.776413, -0.8296427, -0.1189379, 1, 0, 0, 1, 1,
-1.766921, -0.9393511, -2.571373, 1, 0, 0, 1, 1,
-1.724851, -0.1296779, -2.482879, 0, 0, 0, 1, 1,
-1.721637, 0.4706164, -1.296906, 0, 0, 0, 1, 1,
-1.708444, -1.338137, -1.374276, 0, 0, 0, 1, 1,
-1.684906, -0.01436383, -1.973827, 0, 0, 0, 1, 1,
-1.679862, -1.711516, -2.482538, 0, 0, 0, 1, 1,
-1.674008, -1.213144, -2.991874, 0, 0, 0, 1, 1,
-1.671009, 0.3695334, -2.064581, 0, 0, 0, 1, 1,
-1.65807, 2.469976, -0.5417525, 1, 1, 1, 1, 1,
-1.654773, 0.01443498, -1.901295, 1, 1, 1, 1, 1,
-1.62796, -1.187627, -3.12373, 1, 1, 1, 1, 1,
-1.621799, 0.3587343, -1.050723, 1, 1, 1, 1, 1,
-1.607311, -0.2238569, -2.146187, 1, 1, 1, 1, 1,
-1.605657, 0.3467297, -0.6420286, 1, 1, 1, 1, 1,
-1.581142, -0.7407354, -1.586367, 1, 1, 1, 1, 1,
-1.56872, 1.533409, -2.233424, 1, 1, 1, 1, 1,
-1.563061, -0.1789185, -2.153227, 1, 1, 1, 1, 1,
-1.559889, 1.438439, 1.630203, 1, 1, 1, 1, 1,
-1.556719, 1.508451, -1.994746, 1, 1, 1, 1, 1,
-1.550783, -0.9480377, -1.7024, 1, 1, 1, 1, 1,
-1.548313, 0.8044704, -1.660925, 1, 1, 1, 1, 1,
-1.53553, -1.057712, -1.882524, 1, 1, 1, 1, 1,
-1.534743, 1.341281, -1.124571, 1, 1, 1, 1, 1,
-1.533784, -0.9460987, -1.765711, 0, 0, 1, 1, 1,
-1.513363, 0.1222203, -1.05289, 1, 0, 0, 1, 1,
-1.502089, 0.2154136, -1.495277, 1, 0, 0, 1, 1,
-1.498575, 0.3039929, -1.650555, 1, 0, 0, 1, 1,
-1.484303, -1.10434, -2.320781, 1, 0, 0, 1, 1,
-1.48098, 0.2177229, -1.404099, 1, 0, 0, 1, 1,
-1.48088, -1.78926, 0.3048756, 0, 0, 0, 1, 1,
-1.471111, -0.5586905, -1.771515, 0, 0, 0, 1, 1,
-1.465918, 0.8993259, -1.318928, 0, 0, 0, 1, 1,
-1.463993, 1.236198, -0.7091342, 0, 0, 0, 1, 1,
-1.438543, 0.424925, -2.711537, 0, 0, 0, 1, 1,
-1.433236, 1.327535, -1.844131, 0, 0, 0, 1, 1,
-1.426786, 0.5808757, 0.03860978, 0, 0, 0, 1, 1,
-1.401823, -0.2171809, -2.316988, 1, 1, 1, 1, 1,
-1.396459, 2.538399, 0.3095305, 1, 1, 1, 1, 1,
-1.396223, 0.3907115, 0.5932493, 1, 1, 1, 1, 1,
-1.389189, 0.1519825, 0.1913635, 1, 1, 1, 1, 1,
-1.359232, -0.3937084, -2.222053, 1, 1, 1, 1, 1,
-1.355202, -0.1377926, -1.557929, 1, 1, 1, 1, 1,
-1.353118, 1.570445, -2.05386, 1, 1, 1, 1, 1,
-1.342643, 2.125364, -0.4847661, 1, 1, 1, 1, 1,
-1.339239, -0.6056598, -1.212889, 1, 1, 1, 1, 1,
-1.331406, -0.02584976, -1.029867, 1, 1, 1, 1, 1,
-1.329501, 0.2836806, -1.239998, 1, 1, 1, 1, 1,
-1.322165, 0.329286, -1.42643, 1, 1, 1, 1, 1,
-1.305262, -1.271019, -2.940918, 1, 1, 1, 1, 1,
-1.298002, -0.7274815, -2.692341, 1, 1, 1, 1, 1,
-1.290082, 0.8996509, -2.471251, 1, 1, 1, 1, 1,
-1.285349, 0.5527313, -0.1035886, 0, 0, 1, 1, 1,
-1.281503, -1.424451, -2.719821, 1, 0, 0, 1, 1,
-1.277823, 1.231674, -2.441864, 1, 0, 0, 1, 1,
-1.273794, -0.08034103, -2.088243, 1, 0, 0, 1, 1,
-1.270439, 0.2533893, -1.671585, 1, 0, 0, 1, 1,
-1.264865, 0.7417948, 0.1901721, 1, 0, 0, 1, 1,
-1.253696, 0.7273364, -2.208899, 0, 0, 0, 1, 1,
-1.253165, -0.7918754, -3.445748, 0, 0, 0, 1, 1,
-1.253095, 0.05948784, -0.7373311, 0, 0, 0, 1, 1,
-1.243588, -1.738647, -3.2392, 0, 0, 0, 1, 1,
-1.243271, -0.8189229, -2.061438, 0, 0, 0, 1, 1,
-1.239458, -0.4438054, -3.019257, 0, 0, 0, 1, 1,
-1.238255, -0.6349767, -1.125654, 0, 0, 0, 1, 1,
-1.232502, 0.8965206, 0.5857817, 1, 1, 1, 1, 1,
-1.230632, 0.2426334, -0.6549171, 1, 1, 1, 1, 1,
-1.22888, -0.2339517, -2.770564, 1, 1, 1, 1, 1,
-1.228431, 1.040361, -1.411388, 1, 1, 1, 1, 1,
-1.227923, -0.75818, -1.298348, 1, 1, 1, 1, 1,
-1.227485, 0.2539861, -1.165186, 1, 1, 1, 1, 1,
-1.22212, -0.8587809, -2.305172, 1, 1, 1, 1, 1,
-1.221892, -0.3422498, -1.736434, 1, 1, 1, 1, 1,
-1.209995, -0.3651508, -1.514542, 1, 1, 1, 1, 1,
-1.197127, -0.4200779, -1.667222, 1, 1, 1, 1, 1,
-1.19556, -0.6517962, -2.472651, 1, 1, 1, 1, 1,
-1.195182, -0.5896388, -2.380286, 1, 1, 1, 1, 1,
-1.189667, -0.5640218, -2.23191, 1, 1, 1, 1, 1,
-1.187292, 0.4957072, -2.884114, 1, 1, 1, 1, 1,
-1.185192, -0.4862437, -1.359228, 1, 1, 1, 1, 1,
-1.179357, -0.3335307, -2.216504, 0, 0, 1, 1, 1,
-1.179167, -0.2239337, -0.1759488, 1, 0, 0, 1, 1,
-1.178726, 0.009647415, -1.713663, 1, 0, 0, 1, 1,
-1.178006, 0.09595951, -0.06470191, 1, 0, 0, 1, 1,
-1.168279, -1.382234, -3.949576, 1, 0, 0, 1, 1,
-1.159162, -0.1528116, -0.2244536, 1, 0, 0, 1, 1,
-1.159096, -0.7409129, -2.645282, 0, 0, 0, 1, 1,
-1.148187, 0.8968646, -2.465469, 0, 0, 0, 1, 1,
-1.143762, -0.3192201, -2.20807, 0, 0, 0, 1, 1,
-1.143452, 0.8355298, -1.056319, 0, 0, 0, 1, 1,
-1.13185, -0.672869, -1.891848, 0, 0, 0, 1, 1,
-1.122186, 1.448444, -0.8557044, 0, 0, 0, 1, 1,
-1.119119, 1.927212, -2.043699, 0, 0, 0, 1, 1,
-1.11623, -0.5187112, -2.188146, 1, 1, 1, 1, 1,
-1.11369, 0.1483488, -1.173985, 1, 1, 1, 1, 1,
-1.101762, -0.5429326, -0.6030363, 1, 1, 1, 1, 1,
-1.099949, -0.9051332, -2.070018, 1, 1, 1, 1, 1,
-1.099387, -0.6095973, -1.202783, 1, 1, 1, 1, 1,
-1.094321, -0.005707178, 0.4035045, 1, 1, 1, 1, 1,
-1.087669, -0.3016086, -3.193449, 1, 1, 1, 1, 1,
-1.082339, -0.05300133, -1.887836, 1, 1, 1, 1, 1,
-1.078965, 1.491042, -1.439149, 1, 1, 1, 1, 1,
-1.078488, -0.5281147, -1.15373, 1, 1, 1, 1, 1,
-1.073567, -0.01748173, -3.848387, 1, 1, 1, 1, 1,
-1.072819, -1.985877, -1.464347, 1, 1, 1, 1, 1,
-1.067078, 1.11612, -0.9874373, 1, 1, 1, 1, 1,
-1.06694, -0.5489308, -1.060065, 1, 1, 1, 1, 1,
-1.057006, -1.254318, -3.936853, 1, 1, 1, 1, 1,
-1.04907, 0.4739794, -0.5948097, 0, 0, 1, 1, 1,
-1.040642, 0.05261533, -0.6056902, 1, 0, 0, 1, 1,
-1.039673, -2.355302, -4.400053, 1, 0, 0, 1, 1,
-1.031176, -1.025748, -1.475926, 1, 0, 0, 1, 1,
-1.028172, -0.4613798, -3.947534, 1, 0, 0, 1, 1,
-1.026215, 1.345692, 0.0692009, 1, 0, 0, 1, 1,
-1.016905, 1.016129, -0.07536171, 0, 0, 0, 1, 1,
-1.016168, 2.846225, -1.582479, 0, 0, 0, 1, 1,
-1.015284, -0.08281277, -1.108719, 0, 0, 0, 1, 1,
-1.015055, 1.10219, -0.3019663, 0, 0, 0, 1, 1,
-1.011308, -0.5448266, -0.5925676, 0, 0, 0, 1, 1,
-0.9954433, -0.2552313, -0.5946628, 0, 0, 0, 1, 1,
-0.9880782, -1.216503, -0.4651836, 0, 0, 0, 1, 1,
-0.9824039, 0.2665171, -2.504358, 1, 1, 1, 1, 1,
-0.9761458, -0.402073, -2.155297, 1, 1, 1, 1, 1,
-0.9760184, -0.5500816, -2.027146, 1, 1, 1, 1, 1,
-0.9758703, 0.9641126, -1.205264, 1, 1, 1, 1, 1,
-0.961878, 0.1285169, -1.114859, 1, 1, 1, 1, 1,
-0.9590285, 0.08083342, -1.271897, 1, 1, 1, 1, 1,
-0.9488933, 0.5187233, -3.677608, 1, 1, 1, 1, 1,
-0.9384576, -0.8199703, -2.192521, 1, 1, 1, 1, 1,
-0.9374213, 0.7090265, -0.7243292, 1, 1, 1, 1, 1,
-0.9239786, -0.9166737, -0.2470556, 1, 1, 1, 1, 1,
-0.9225848, 0.4090622, 0.2454061, 1, 1, 1, 1, 1,
-0.9214496, -0.7651427, -2.309025, 1, 1, 1, 1, 1,
-0.9175767, -0.7642044, -1.179374, 1, 1, 1, 1, 1,
-0.9139277, -0.4386114, -1.419767, 1, 1, 1, 1, 1,
-0.9129404, 0.5844032, -0.1582012, 1, 1, 1, 1, 1,
-0.9089455, -0.1890723, -3.756415, 0, 0, 1, 1, 1,
-0.908266, -1.40063, -2.974134, 1, 0, 0, 1, 1,
-0.9072899, 1.858507, 0.1723098, 1, 0, 0, 1, 1,
-0.904383, 0.5966908, -0.04327746, 1, 0, 0, 1, 1,
-0.9037905, 2.112715, -0.01645278, 1, 0, 0, 1, 1,
-0.8993413, 0.250348, -0.9106222, 1, 0, 0, 1, 1,
-0.896323, -0.1405156, 0.5514686, 0, 0, 0, 1, 1,
-0.8960453, 0.2218287, -2.438322, 0, 0, 0, 1, 1,
-0.8959519, 0.6585668, -0.1766029, 0, 0, 0, 1, 1,
-0.8948631, 1.452863, 0.623382, 0, 0, 0, 1, 1,
-0.8924961, -0.5664636, -1.12516, 0, 0, 0, 1, 1,
-0.8918864, -1.039816, -2.772326, 0, 0, 0, 1, 1,
-0.8906853, 0.09896033, -0.4924551, 0, 0, 0, 1, 1,
-0.888781, 0.02541079, -2.885987, 1, 1, 1, 1, 1,
-0.8874582, 0.9187828, 0.7494439, 1, 1, 1, 1, 1,
-0.8849837, 0.6096678, -0.9125624, 1, 1, 1, 1, 1,
-0.8724997, -1.518932, -2.819314, 1, 1, 1, 1, 1,
-0.8701409, -1.126437, -0.8925477, 1, 1, 1, 1, 1,
-0.8524706, -1.075062, -3.042831, 1, 1, 1, 1, 1,
-0.8481292, 1.646688, -1.413592, 1, 1, 1, 1, 1,
-0.847706, -0.2814858, -2.751273, 1, 1, 1, 1, 1,
-0.8368368, -1.002722, -2.757668, 1, 1, 1, 1, 1,
-0.820165, -0.6653749, -2.853443, 1, 1, 1, 1, 1,
-0.8094133, 0.252686, -1.211663, 1, 1, 1, 1, 1,
-0.8081479, -0.9275056, -2.162837, 1, 1, 1, 1, 1,
-0.8039327, 0.1957311, -1.624057, 1, 1, 1, 1, 1,
-0.798416, 2.379528, 0.2019623, 1, 1, 1, 1, 1,
-0.7977148, -0.8475393, -1.250389, 1, 1, 1, 1, 1,
-0.794578, -0.8482658, -2.03708, 0, 0, 1, 1, 1,
-0.7936643, -1.094442, -2.215852, 1, 0, 0, 1, 1,
-0.7932824, 0.2471239, -2.481055, 1, 0, 0, 1, 1,
-0.7930902, 2.6711, 1.687132, 1, 0, 0, 1, 1,
-0.7927097, 0.8966476, -0.340598, 1, 0, 0, 1, 1,
-0.788304, -1.22674, -2.00856, 1, 0, 0, 1, 1,
-0.7872379, -0.07461933, -2.883101, 0, 0, 0, 1, 1,
-0.7862214, -0.1411472, 0.1459886, 0, 0, 0, 1, 1,
-0.7841845, 1.240563, -0.496237, 0, 0, 0, 1, 1,
-0.7821093, 0.1403609, -1.906501, 0, 0, 0, 1, 1,
-0.7818499, -1.12988, -2.393071, 0, 0, 0, 1, 1,
-0.7804525, -0.5280825, -4.374571, 0, 0, 0, 1, 1,
-0.7783864, -0.7451132, -1.317335, 0, 0, 0, 1, 1,
-0.7723365, -0.5464565, -1.782576, 1, 1, 1, 1, 1,
-0.772245, 1.090673, -1.001673, 1, 1, 1, 1, 1,
-0.7519795, 0.2415303, -1.922172, 1, 1, 1, 1, 1,
-0.7500309, 1.938891, -0.9863255, 1, 1, 1, 1, 1,
-0.7446585, 1.464728, -0.98759, 1, 1, 1, 1, 1,
-0.7401863, -0.1536872, -1.810507, 1, 1, 1, 1, 1,
-0.7371931, 0.1755969, -1.427715, 1, 1, 1, 1, 1,
-0.727258, 0.5351549, 0.4049901, 1, 1, 1, 1, 1,
-0.7227774, -0.5268905, -1.40415, 1, 1, 1, 1, 1,
-0.7227479, 1.164535, -0.7377906, 1, 1, 1, 1, 1,
-0.7181762, -0.06179999, -1.585847, 1, 1, 1, 1, 1,
-0.7138219, -1.540281, -3.575122, 1, 1, 1, 1, 1,
-0.7090879, -0.8235336, -1.905341, 1, 1, 1, 1, 1,
-0.7029411, 0.5158474, 0.6615931, 1, 1, 1, 1, 1,
-0.7018728, -1.260286, -1.855639, 1, 1, 1, 1, 1,
-0.6999927, -0.1139252, -3.032881, 0, 0, 1, 1, 1,
-0.6963046, 0.2641559, -1.616535, 1, 0, 0, 1, 1,
-0.6894205, -0.8510724, -2.197508, 1, 0, 0, 1, 1,
-0.6779337, 2.021318, 0.8021308, 1, 0, 0, 1, 1,
-0.6704867, -1.142599, -3.352128, 1, 0, 0, 1, 1,
-0.6672112, 0.3140637, 0.1374778, 1, 0, 0, 1, 1,
-0.6654608, -1.344432, -1.966875, 0, 0, 0, 1, 1,
-0.6614482, -0.4484491, -3.440867, 0, 0, 0, 1, 1,
-0.6586226, -1.889004, -2.307719, 0, 0, 0, 1, 1,
-0.6579318, -0.0327824, -1.376691, 0, 0, 0, 1, 1,
-0.6578388, -0.8512639, -4.118349, 0, 0, 0, 1, 1,
-0.6549768, -1.010813, -1.687036, 0, 0, 0, 1, 1,
-0.6541758, -1.731782, -2.085293, 0, 0, 0, 1, 1,
-0.6521065, 0.6407562, 0.57469, 1, 1, 1, 1, 1,
-0.6472715, -0.03960047, -1.462421, 1, 1, 1, 1, 1,
-0.6424937, 2.034778, 0.6779118, 1, 1, 1, 1, 1,
-0.6389743, 0.3656612, -1.464788, 1, 1, 1, 1, 1,
-0.6359982, 0.8878514, -0.4664648, 1, 1, 1, 1, 1,
-0.6319985, -0.8624441, -2.89974, 1, 1, 1, 1, 1,
-0.6295703, 1.326442, 0.361212, 1, 1, 1, 1, 1,
-0.6256943, 0.4329046, -2.262787, 1, 1, 1, 1, 1,
-0.6207558, 1.122293, -1.405684, 1, 1, 1, 1, 1,
-0.6193522, 0.2616693, -0.3581015, 1, 1, 1, 1, 1,
-0.6192744, 0.4441245, -2.245968, 1, 1, 1, 1, 1,
-0.618356, -0.7185341, -1.676313, 1, 1, 1, 1, 1,
-0.6171588, -0.3049165, -1.734782, 1, 1, 1, 1, 1,
-0.6128905, -0.1419058, -2.48697, 1, 1, 1, 1, 1,
-0.6125641, -1.473597, -3.662634, 1, 1, 1, 1, 1,
-0.6109045, -0.1178763, -1.794619, 0, 0, 1, 1, 1,
-0.6079543, -1.97576, -2.458843, 1, 0, 0, 1, 1,
-0.6073809, -0.2216377, -1.661644, 1, 0, 0, 1, 1,
-0.6058323, -0.6735269, -2.271223, 1, 0, 0, 1, 1,
-0.6055391, 1.407857, -0.6109118, 1, 0, 0, 1, 1,
-0.6011265, 1.814041, 0.1942129, 1, 0, 0, 1, 1,
-0.6010801, -1.292086, -3.649032, 0, 0, 0, 1, 1,
-0.5999359, -0.61068, -2.332053, 0, 0, 0, 1, 1,
-0.5957239, -0.4144528, -3.132545, 0, 0, 0, 1, 1,
-0.5933942, 2.443156, -0.5449412, 0, 0, 0, 1, 1,
-0.5904819, -2.21151, -0.6241997, 0, 0, 0, 1, 1,
-0.5877637, 0.4958979, -0.6461481, 0, 0, 0, 1, 1,
-0.5863505, 0.01859842, -0.8319503, 0, 0, 0, 1, 1,
-0.5847996, 0.5532584, -0.9796342, 1, 1, 1, 1, 1,
-0.5774232, 0.9530728, -0.9617843, 1, 1, 1, 1, 1,
-0.5759883, 0.4537552, -0.03501538, 1, 1, 1, 1, 1,
-0.5737837, -1.113219, -1.945874, 1, 1, 1, 1, 1,
-0.5732242, 0.8175887, -0.6505631, 1, 1, 1, 1, 1,
-0.5690216, -0.5920495, -3.869565, 1, 1, 1, 1, 1,
-0.568536, -1.386232, -2.112263, 1, 1, 1, 1, 1,
-0.5650817, 0.9807315, -1.038149, 1, 1, 1, 1, 1,
-0.5626985, 0.4056329, -0.3874977, 1, 1, 1, 1, 1,
-0.5612937, -1.165426, -2.593591, 1, 1, 1, 1, 1,
-0.561074, 0.3205425, -2.592232, 1, 1, 1, 1, 1,
-0.5482118, 0.04157909, -1.88741, 1, 1, 1, 1, 1,
-0.5475001, 0.5062773, -1.174864, 1, 1, 1, 1, 1,
-0.5380045, -0.4681821, -2.143628, 1, 1, 1, 1, 1,
-0.5366272, 0.03192466, -0.9920858, 1, 1, 1, 1, 1,
-0.5364743, 1.576959, -1.684089, 0, 0, 1, 1, 1,
-0.5354241, -0.2552183, -3.739032, 1, 0, 0, 1, 1,
-0.5345901, 0.5712968, -1.606887, 1, 0, 0, 1, 1,
-0.5320579, -0.6844952, -1.141309, 1, 0, 0, 1, 1,
-0.5299724, -0.6094946, -3.592729, 1, 0, 0, 1, 1,
-0.5279803, -0.6891212, -2.149374, 1, 0, 0, 1, 1,
-0.5278957, 0.06190255, -1.821473, 0, 0, 0, 1, 1,
-0.5167906, -1.098009, -2.794325, 0, 0, 0, 1, 1,
-0.5137359, 0.3444327, -0.8004004, 0, 0, 0, 1, 1,
-0.5118052, 0.05204431, -1.026448, 0, 0, 0, 1, 1,
-0.5059559, 0.4016181, -1.552914, 0, 0, 0, 1, 1,
-0.5048325, -0.28031, -2.329288, 0, 0, 0, 1, 1,
-0.5040771, 1.229773, -0.6438841, 0, 0, 0, 1, 1,
-0.5026124, -0.3146015, -3.682446, 1, 1, 1, 1, 1,
-0.5019531, 0.9899803, -2.598108, 1, 1, 1, 1, 1,
-0.4989473, -0.6029734, -3.236834, 1, 1, 1, 1, 1,
-0.4970608, 1.307649, -1.400781, 1, 1, 1, 1, 1,
-0.4909714, 1.507658, -0.2619903, 1, 1, 1, 1, 1,
-0.4787006, 1.857729, 0.1538315, 1, 1, 1, 1, 1,
-0.4771982, 1.206003, 0.8527775, 1, 1, 1, 1, 1,
-0.4738996, -1.029837, -3.424847, 1, 1, 1, 1, 1,
-0.4702473, 0.1808673, -2.028111, 1, 1, 1, 1, 1,
-0.4701391, -0.8130171, -4.306824, 1, 1, 1, 1, 1,
-0.4689211, -0.05426922, -2.233021, 1, 1, 1, 1, 1,
-0.4665096, 1.271566, 0.11307, 1, 1, 1, 1, 1,
-0.4581375, 0.1586987, -1.627189, 1, 1, 1, 1, 1,
-0.4523553, 0.2494049, -0.9870589, 1, 1, 1, 1, 1,
-0.4509704, -0.2171705, -4.17286, 1, 1, 1, 1, 1,
-0.4494444, 0.07051989, -1.435993, 0, 0, 1, 1, 1,
-0.448616, 0.8642775, -1.784967, 1, 0, 0, 1, 1,
-0.4447405, -0.5210167, -3.119974, 1, 0, 0, 1, 1,
-0.4358492, -0.4538182, -2.807223, 1, 0, 0, 1, 1,
-0.4325819, 1.704999, -0.3313514, 1, 0, 0, 1, 1,
-0.4267052, -0.1722018, -3.118607, 1, 0, 0, 1, 1,
-0.4217275, 0.08089972, -1.372422, 0, 0, 0, 1, 1,
-0.4213319, -0.5961387, -2.73417, 0, 0, 0, 1, 1,
-0.4117768, 0.09882972, -0.3892024, 0, 0, 0, 1, 1,
-0.4083118, -0.735656, -2.397825, 0, 0, 0, 1, 1,
-0.4064536, -1.493775, -2.288524, 0, 0, 0, 1, 1,
-0.405328, -0.4983175, -2.046216, 0, 0, 0, 1, 1,
-0.4039189, -0.3734086, -2.836756, 0, 0, 0, 1, 1,
-0.4002643, -0.6788859, -2.937386, 1, 1, 1, 1, 1,
-0.3999773, 0.0985643, -0.975547, 1, 1, 1, 1, 1,
-0.3992924, 0.4225212, -1.070085, 1, 1, 1, 1, 1,
-0.3958756, -0.4359622, -2.652873, 1, 1, 1, 1, 1,
-0.3939498, 1.36887, -0.9048492, 1, 1, 1, 1, 1,
-0.3888089, 0.7980098, -1.1689, 1, 1, 1, 1, 1,
-0.3881589, -0.02995514, -3.617933, 1, 1, 1, 1, 1,
-0.3869393, 0.07231814, -1.36003, 1, 1, 1, 1, 1,
-0.385769, 2.456059, -1.42322, 1, 1, 1, 1, 1,
-0.3813067, 0.06154606, -1.363568, 1, 1, 1, 1, 1,
-0.3802155, -0.6527388, -2.829928, 1, 1, 1, 1, 1,
-0.3797072, -0.2183306, -1.727881, 1, 1, 1, 1, 1,
-0.3745483, 0.6262612, 0.1579042, 1, 1, 1, 1, 1,
-0.3736703, -2.587651, -4.541876, 1, 1, 1, 1, 1,
-0.3702193, -0.6906242, -2.588658, 1, 1, 1, 1, 1,
-0.3698815, -0.240803, -1.144721, 0, 0, 1, 1, 1,
-0.367897, 0.1986154, -1.425333, 1, 0, 0, 1, 1,
-0.3674809, 0.3597588, -0.01227152, 1, 0, 0, 1, 1,
-0.3655614, -0.8301769, -2.412004, 1, 0, 0, 1, 1,
-0.3626677, -0.156632, -1.244476, 1, 0, 0, 1, 1,
-0.3619835, -0.8183258, -2.069276, 1, 0, 0, 1, 1,
-0.3611594, -0.1028126, -0.7970719, 0, 0, 0, 1, 1,
-0.3549384, 0.1686402, -1.213401, 0, 0, 0, 1, 1,
-0.3534793, 1.058937, 0.1804308, 0, 0, 0, 1, 1,
-0.3528289, 0.908554, 0.1282837, 0, 0, 0, 1, 1,
-0.3519448, 0.6438159, -0.5762358, 0, 0, 0, 1, 1,
-0.3493722, 1.177794, 1.999578, 0, 0, 0, 1, 1,
-0.3492673, -1.625541, -3.265515, 0, 0, 0, 1, 1,
-0.3472528, 0.02735611, -0.7598518, 1, 1, 1, 1, 1,
-0.3447125, 1.515191, -0.9737263, 1, 1, 1, 1, 1,
-0.3430174, 0.3443334, 0.2427731, 1, 1, 1, 1, 1,
-0.3428874, -0.2387305, -0.7444439, 1, 1, 1, 1, 1,
-0.3417854, 0.2396894, -2.045059, 1, 1, 1, 1, 1,
-0.3355454, 0.7739285, -0.8917972, 1, 1, 1, 1, 1,
-0.3335623, -1.41746, -1.956689, 1, 1, 1, 1, 1,
-0.3277391, 1.277979, -1.578882, 1, 1, 1, 1, 1,
-0.3222918, -1.454925, -2.106789, 1, 1, 1, 1, 1,
-0.3184597, -0.4828232, -2.536826, 1, 1, 1, 1, 1,
-0.3170476, -0.1739512, -2.892005, 1, 1, 1, 1, 1,
-0.312739, -0.5656698, -3.788952, 1, 1, 1, 1, 1,
-0.3119644, -0.09296097, -2.418076, 1, 1, 1, 1, 1,
-0.311724, 2.214847, -0.6732056, 1, 1, 1, 1, 1,
-0.3086183, -0.7743216, -3.848696, 1, 1, 1, 1, 1,
-0.3068893, 0.3728532, -1.455569, 0, 0, 1, 1, 1,
-0.3048441, 0.7866199, -0.7765804, 1, 0, 0, 1, 1,
-0.3024504, -1.34274, -2.655084, 1, 0, 0, 1, 1,
-0.3001089, -1.536705, -2.150485, 1, 0, 0, 1, 1,
-0.2998559, -0.594435, -2.244252, 1, 0, 0, 1, 1,
-0.2989064, 0.9044663, -1.65606, 1, 0, 0, 1, 1,
-0.2984552, 0.8683583, -2.148708, 0, 0, 0, 1, 1,
-0.2966956, -0.6343322, -2.931341, 0, 0, 0, 1, 1,
-0.296158, 0.4394911, 0.4836088, 0, 0, 0, 1, 1,
-0.2917152, 1.085899, 0.07193919, 0, 0, 0, 1, 1,
-0.286723, -0.1514798, -3.128242, 0, 0, 0, 1, 1,
-0.28262, 0.1130301, -1.884876, 0, 0, 0, 1, 1,
-0.279276, -0.5243572, -4.070557, 0, 0, 0, 1, 1,
-0.2775896, -0.5756529, -2.754634, 1, 1, 1, 1, 1,
-0.2754104, -0.9672455, -3.567654, 1, 1, 1, 1, 1,
-0.2736219, -0.5069842, -3.08487, 1, 1, 1, 1, 1,
-0.2601484, 1.168552, 0.9162816, 1, 1, 1, 1, 1,
-0.2569517, -0.3556092, -0.7619104, 1, 1, 1, 1, 1,
-0.2555716, -0.960233, -1.642977, 1, 1, 1, 1, 1,
-0.2543909, -0.5344427, -2.6856, 1, 1, 1, 1, 1,
-0.2537489, 0.76071, -0.4159327, 1, 1, 1, 1, 1,
-0.251449, -0.5600157, -2.513308, 1, 1, 1, 1, 1,
-0.2503131, -0.8691394, -5.398353, 1, 1, 1, 1, 1,
-0.2495234, -0.6985104, -2.162193, 1, 1, 1, 1, 1,
-0.2481732, 0.275788, -1.230807, 1, 1, 1, 1, 1,
-0.2471314, -1.020569, -3.382172, 1, 1, 1, 1, 1,
-0.2468094, 1.066004, -1.530037, 1, 1, 1, 1, 1,
-0.2450193, -0.8110027, -3.682279, 1, 1, 1, 1, 1,
-0.2389734, 0.006861834, -1.968454, 0, 0, 1, 1, 1,
-0.2353385, -0.5453637, -4.343918, 1, 0, 0, 1, 1,
-0.2344417, -0.5370477, -4.522248, 1, 0, 0, 1, 1,
-0.2329469, -0.2941406, -2.378929, 1, 0, 0, 1, 1,
-0.230179, -0.4862445, -2.698473, 1, 0, 0, 1, 1,
-0.2272983, -0.494448, -2.582543, 1, 0, 0, 1, 1,
-0.2270695, -3.223537, -3.793954, 0, 0, 0, 1, 1,
-0.2268089, -0.5934899, -5.329587, 0, 0, 0, 1, 1,
-0.2265416, 0.7729013, 2.166931, 0, 0, 0, 1, 1,
-0.2263639, -3.006057, -3.522235, 0, 0, 0, 1, 1,
-0.2244315, 0.818575, -0.9604827, 0, 0, 0, 1, 1,
-0.2112599, -0.5692362, -4.37257, 0, 0, 0, 1, 1,
-0.2040567, 1.285107, 1.536113, 0, 0, 0, 1, 1,
-0.2025841, 1.067247, -0.1466341, 1, 1, 1, 1, 1,
-0.1983364, 0.4188429, -1.101094, 1, 1, 1, 1, 1,
-0.1964886, 0.4746659, -0.1747755, 1, 1, 1, 1, 1,
-0.1901521, 0.9408916, -0.968765, 1, 1, 1, 1, 1,
-0.1885548, 0.602809, 0.6167429, 1, 1, 1, 1, 1,
-0.1829582, -0.4633355, -3.05821, 1, 1, 1, 1, 1,
-0.1823169, 1.674303, 0.8818794, 1, 1, 1, 1, 1,
-0.1784266, -0.4717641, -4.765289, 1, 1, 1, 1, 1,
-0.1752654, 0.5362426, 0.06564757, 1, 1, 1, 1, 1,
-0.1715996, -0.1328509, -2.373035, 1, 1, 1, 1, 1,
-0.1690552, -1.387696, -3.909734, 1, 1, 1, 1, 1,
-0.1663379, -0.01329682, -0.9985069, 1, 1, 1, 1, 1,
-0.1660493, 0.09104369, -0.6266993, 1, 1, 1, 1, 1,
-0.1602052, -1.285727, -1.48203, 1, 1, 1, 1, 1,
-0.1592032, 0.09437753, -1.255261, 1, 1, 1, 1, 1,
-0.1589254, -0.1911241, -0.9781248, 0, 0, 1, 1, 1,
-0.1589251, 0.1919401, 0.4358427, 1, 0, 0, 1, 1,
-0.1585488, -0.8210417, -2.722048, 1, 0, 0, 1, 1,
-0.1584587, -1.154734, -1.606081, 1, 0, 0, 1, 1,
-0.1568815, 1.348727, -0.9980818, 1, 0, 0, 1, 1,
-0.1528414, -1.044413, -2.94349, 1, 0, 0, 1, 1,
-0.150845, -0.2736234, -3.445996, 0, 0, 0, 1, 1,
-0.1472457, -0.6220507, -1.90098, 0, 0, 0, 1, 1,
-0.1462829, -0.7092241, -4.277673, 0, 0, 0, 1, 1,
-0.1459766, -0.4542417, -2.013061, 0, 0, 0, 1, 1,
-0.1422961, 1.764757, 0.2293175, 0, 0, 0, 1, 1,
-0.1308101, -1.024217, -1.37623, 0, 0, 0, 1, 1,
-0.1294347, 0.3608115, 1.036515, 0, 0, 0, 1, 1,
-0.1290962, -0.6789376, -2.859329, 1, 1, 1, 1, 1,
-0.128961, 0.2095214, -1.571244, 1, 1, 1, 1, 1,
-0.1286443, 0.736393, 0.4097835, 1, 1, 1, 1, 1,
-0.1264155, 0.4521571, -0.9070508, 1, 1, 1, 1, 1,
-0.1152576, -0.6018478, -5.33075, 1, 1, 1, 1, 1,
-0.1123232, 0.4646978, -0.4163626, 1, 1, 1, 1, 1,
-0.1096262, -1.544685, -2.054811, 1, 1, 1, 1, 1,
-0.1089492, 0.5046503, -0.498081, 1, 1, 1, 1, 1,
-0.1076992, 0.5594739, 0.3639664, 1, 1, 1, 1, 1,
-0.1067701, -0.003453626, -1.885941, 1, 1, 1, 1, 1,
-0.1024279, 0.4105181, -0.1890632, 1, 1, 1, 1, 1,
-0.1019049, 0.7121628, -0.3585896, 1, 1, 1, 1, 1,
-0.1013827, 0.05370794, -3.660722, 1, 1, 1, 1, 1,
-0.09911503, -0.6112192, -2.811594, 1, 1, 1, 1, 1,
-0.0985634, 0.2953081, 0.8277961, 1, 1, 1, 1, 1,
-0.09526176, -1.241478, -2.705773, 0, 0, 1, 1, 1,
-0.0921933, 0.5261277, 1.509182, 1, 0, 0, 1, 1,
-0.0913306, 0.8936502, -1.259331, 1, 0, 0, 1, 1,
-0.08215579, 1.914193, 0.158919, 1, 0, 0, 1, 1,
-0.07808398, -1.79423, -1.045532, 1, 0, 0, 1, 1,
-0.0753619, 0.6555094, 1.187712, 1, 0, 0, 1, 1,
-0.07444937, -0.0004254288, -1.491557, 0, 0, 0, 1, 1,
-0.07176023, 0.8208716, 0.786088, 0, 0, 0, 1, 1,
-0.07150713, -0.2405198, -2.828346, 0, 0, 0, 1, 1,
-0.07097199, -1.189353, -3.619018, 0, 0, 0, 1, 1,
-0.06737959, -0.2032957, -2.409453, 0, 0, 0, 1, 1,
-0.06184011, -1.331661, -2.123792, 0, 0, 0, 1, 1,
-0.06102722, 0.2011921, -1.120679, 0, 0, 0, 1, 1,
-0.06080907, 0.511157, -1.655345, 1, 1, 1, 1, 1,
-0.06079604, 0.4324174, -0.4201522, 1, 1, 1, 1, 1,
-0.05868077, 0.3722679, -1.036466, 1, 1, 1, 1, 1,
-0.05522772, -0.5910837, -3.24138, 1, 1, 1, 1, 1,
-0.05146271, 0.05859781, -0.0008924778, 1, 1, 1, 1, 1,
-0.04702288, -2.496598, -2.272536, 1, 1, 1, 1, 1,
-0.0441092, 0.534075, 0.07235104, 1, 1, 1, 1, 1,
-0.04405368, 1.286334, 0.4669915, 1, 1, 1, 1, 1,
-0.04310898, 0.4384161, -1.259937, 1, 1, 1, 1, 1,
-0.0418091, -0.2658091, -2.392808, 1, 1, 1, 1, 1,
-0.03850336, -0.5873483, -2.85416, 1, 1, 1, 1, 1,
-0.03672535, 1.125935, -0.06681213, 1, 1, 1, 1, 1,
-0.03250112, 1.504102, 0.7156743, 1, 1, 1, 1, 1,
-0.03249386, 0.4812407, 0.4333302, 1, 1, 1, 1, 1,
-0.03234062, -0.5696027, -1.266571, 1, 1, 1, 1, 1,
-0.02842489, -0.2567021, -3.135923, 0, 0, 1, 1, 1,
-0.02825817, 0.1202446, 0.0324329, 1, 0, 0, 1, 1,
-0.0274631, 1.716548, 0.6542791, 1, 0, 0, 1, 1,
-0.02441542, -0.3224959, -2.39358, 1, 0, 0, 1, 1,
-0.01835242, 0.7196232, -0.7330057, 1, 0, 0, 1, 1,
-0.01261158, 2.035813, 1.985365, 1, 0, 0, 1, 1,
-0.01026523, -0.4928032, -2.976956, 0, 0, 0, 1, 1,
-0.01021361, 0.8184285, 1.103873, 0, 0, 0, 1, 1,
-0.006930924, 0.2086722, -0.7270827, 0, 0, 0, 1, 1,
-0.002233573, 0.5529324, -0.4929024, 0, 0, 0, 1, 1,
-0.001006028, 1.657304, -1.37935, 0, 0, 0, 1, 1,
0.001436213, 1.424688, 2.235112, 0, 0, 0, 1, 1,
0.00185184, 0.3722213, 0.4934523, 0, 0, 0, 1, 1,
0.003775741, -1.767397, 2.274756, 1, 1, 1, 1, 1,
0.007055583, 1.243342, 0.4755296, 1, 1, 1, 1, 1,
0.007181066, 0.01755559, -1.105836, 1, 1, 1, 1, 1,
0.009755039, 0.6701277, -1.865258, 1, 1, 1, 1, 1,
0.01392098, -0.5576275, 3.418214, 1, 1, 1, 1, 1,
0.02112782, -1.353076, 1.608127, 1, 1, 1, 1, 1,
0.02207633, 1.00117, -0.505434, 1, 1, 1, 1, 1,
0.02293242, 0.7558247, 2.194805, 1, 1, 1, 1, 1,
0.02324861, 0.06195278, -0.3542751, 1, 1, 1, 1, 1,
0.02343572, 0.9489871, 1.007885, 1, 1, 1, 1, 1,
0.02400422, -2.081479, 2.555252, 1, 1, 1, 1, 1,
0.02963739, 1.004444, 0.1397714, 1, 1, 1, 1, 1,
0.03034353, 0.3071077, -0.2308185, 1, 1, 1, 1, 1,
0.03081689, -0.532222, 3.889558, 1, 1, 1, 1, 1,
0.03233008, 0.7933741, 0.6237563, 1, 1, 1, 1, 1,
0.03631369, 0.4521001, 0.4089605, 0, 0, 1, 1, 1,
0.0400519, -1.42273, 3.756807, 1, 0, 0, 1, 1,
0.04027472, 1.334689, 0.2698801, 1, 0, 0, 1, 1,
0.04249742, -1.011546, 3.443828, 1, 0, 0, 1, 1,
0.0427057, 0.2146856, 1.140441, 1, 0, 0, 1, 1,
0.05497832, -2.689762, 2.984537, 1, 0, 0, 1, 1,
0.05607497, -1.154675, 2.285913, 0, 0, 0, 1, 1,
0.05709194, -1.907253, 4.486008, 0, 0, 0, 1, 1,
0.05835408, -0.8649541, 2.664153, 0, 0, 0, 1, 1,
0.05917601, -0.7367753, 2.729503, 0, 0, 0, 1, 1,
0.05985334, -0.8486596, 2.48637, 0, 0, 0, 1, 1,
0.06257875, 1.349197, -1.612319, 0, 0, 0, 1, 1,
0.06365862, 0.4170193, 1.922941, 0, 0, 0, 1, 1,
0.06532842, -1.449492, 2.993452, 1, 1, 1, 1, 1,
0.06598752, 1.025442, -2.373008, 1, 1, 1, 1, 1,
0.06900904, 1.205868, 0.05653444, 1, 1, 1, 1, 1,
0.06924593, -0.4089203, 1.616445, 1, 1, 1, 1, 1,
0.07275102, -0.4486155, 4.292433, 1, 1, 1, 1, 1,
0.07284152, -0.1812579, 0.7877756, 1, 1, 1, 1, 1,
0.07313084, -0.09595542, 1.478813, 1, 1, 1, 1, 1,
0.08132777, -0.4975811, 2.876581, 1, 1, 1, 1, 1,
0.08405648, 0.08959382, 0.5509443, 1, 1, 1, 1, 1,
0.08578241, -2.773777, 2.359505, 1, 1, 1, 1, 1,
0.0882387, -1.56365, 2.225351, 1, 1, 1, 1, 1,
0.09205665, 1.10838, -1.010183, 1, 1, 1, 1, 1,
0.09258229, 0.004941537, 1.118098, 1, 1, 1, 1, 1,
0.09380653, -0.9932058, 2.849591, 1, 1, 1, 1, 1,
0.09423802, 1.055029, 2.275342, 1, 1, 1, 1, 1,
0.09515341, 0.4525019, -0.03465994, 0, 0, 1, 1, 1,
0.09847527, 0.9997311, -0.5826674, 1, 0, 0, 1, 1,
0.09847821, 0.4410482, 2.219678, 1, 0, 0, 1, 1,
0.1027943, -0.2350287, 2.463642, 1, 0, 0, 1, 1,
0.1040753, 0.03604669, 0.5518288, 1, 0, 0, 1, 1,
0.1105165, 1.255941, -0.4792401, 1, 0, 0, 1, 1,
0.1109127, 0.2720646, 1.528676, 0, 0, 0, 1, 1,
0.1121029, -0.3571967, 3.971767, 0, 0, 0, 1, 1,
0.1122945, 0.1393549, 1.761433, 0, 0, 0, 1, 1,
0.1124265, -0.4522787, 3.060609, 0, 0, 0, 1, 1,
0.1135186, 0.1609831, -0.5174489, 0, 0, 0, 1, 1,
0.1139774, -1.193525, 3.218044, 0, 0, 0, 1, 1,
0.1140855, -1.817453, 3.66125, 0, 0, 0, 1, 1,
0.1154798, -0.99007, 1.608377, 1, 1, 1, 1, 1,
0.115656, 2.1084, -0.6938151, 1, 1, 1, 1, 1,
0.1176491, 0.1313244, 1.206087, 1, 1, 1, 1, 1,
0.122715, 0.6122007, -0.1659677, 1, 1, 1, 1, 1,
0.1244437, -1.592755, 3.207455, 1, 1, 1, 1, 1,
0.132609, 0.4327868, -0.9822167, 1, 1, 1, 1, 1,
0.1349795, 1.107581, -0.6027941, 1, 1, 1, 1, 1,
0.1360933, -1.009705, 3.734353, 1, 1, 1, 1, 1,
0.1366703, 0.2985081, 1.922499, 1, 1, 1, 1, 1,
0.1382931, 0.5627203, 0.07532305, 1, 1, 1, 1, 1,
0.1393812, 0.1414264, 0.7091316, 1, 1, 1, 1, 1,
0.1406913, 1.328499, -0.1753654, 1, 1, 1, 1, 1,
0.1427455, -1.332515, 1.306002, 1, 1, 1, 1, 1,
0.1464403, -3.217017, 3.584315, 1, 1, 1, 1, 1,
0.1465859, -1.261751, 2.364242, 1, 1, 1, 1, 1,
0.1466675, -2.264735, 2.51491, 0, 0, 1, 1, 1,
0.1491923, 0.176886, 1.676817, 1, 0, 0, 1, 1,
0.1502676, 1.622448, -0.2448669, 1, 0, 0, 1, 1,
0.1523072, -0.6962977, 2.238391, 1, 0, 0, 1, 1,
0.1527515, -1.036084, 4.107502, 1, 0, 0, 1, 1,
0.1588453, 1.707821, -2.025577, 1, 0, 0, 1, 1,
0.1677098, 0.06233667, 2.683407, 0, 0, 0, 1, 1,
0.1710923, 1.590087, 0.4108175, 0, 0, 0, 1, 1,
0.1769054, -0.5652999, 4.128765, 0, 0, 0, 1, 1,
0.1791896, -0.5603251, 2.883546, 0, 0, 0, 1, 1,
0.1798109, 1.307276, -0.478843, 0, 0, 0, 1, 1,
0.1850477, 1.417279, 0.423578, 0, 0, 0, 1, 1,
0.1852025, -1.189266, 3.308122, 0, 0, 0, 1, 1,
0.1860221, 0.4106774, 1.387562, 1, 1, 1, 1, 1,
0.1860941, -0.7682482, 2.20178, 1, 1, 1, 1, 1,
0.1867851, -0.3143032, 2.529297, 1, 1, 1, 1, 1,
0.1874754, 0.7767834, 0.3240382, 1, 1, 1, 1, 1,
0.1931148, 1.068222, 2.181051, 1, 1, 1, 1, 1,
0.1933473, 0.5038709, 0.09801017, 1, 1, 1, 1, 1,
0.1938273, -0.03484464, 2.081515, 1, 1, 1, 1, 1,
0.2033314, 0.6262582, -0.0244809, 1, 1, 1, 1, 1,
0.2083423, 1.663137, 0.818849, 1, 1, 1, 1, 1,
0.2092436, 0.8522753, -0.718574, 1, 1, 1, 1, 1,
0.210157, 0.06861228, 2.357387, 1, 1, 1, 1, 1,
0.211765, -0.7733304, 2.066101, 1, 1, 1, 1, 1,
0.2123342, -1.551122, 4.434666, 1, 1, 1, 1, 1,
0.2137764, 1.908215, -1.049885, 1, 1, 1, 1, 1,
0.2172481, -0.02001389, 1.348516, 1, 1, 1, 1, 1,
0.2193856, -1.576293, 2.617926, 0, 0, 1, 1, 1,
0.2265859, 1.42534, 1.191414, 1, 0, 0, 1, 1,
0.2314019, 0.2259637, -0.4206736, 1, 0, 0, 1, 1,
0.2320907, -0.002129273, 1.525427, 1, 0, 0, 1, 1,
0.2399055, 1.059234, -0.4400721, 1, 0, 0, 1, 1,
0.2409196, 0.7851984, 0.8198068, 1, 0, 0, 1, 1,
0.2466681, -2.034193, 3.177794, 0, 0, 0, 1, 1,
0.2489681, -0.8677036, 1.788126, 0, 0, 0, 1, 1,
0.2501152, -0.7267198, 4.411127, 0, 0, 0, 1, 1,
0.2540039, -0.2223223, 1.812922, 0, 0, 0, 1, 1,
0.2550796, -0.9247293, 3.940364, 0, 0, 0, 1, 1,
0.2560471, 0.7425339, 1.633977, 0, 0, 0, 1, 1,
0.2570358, 0.6077679, 2.2795, 0, 0, 0, 1, 1,
0.2582232, -0.199283, 3.085024, 1, 1, 1, 1, 1,
0.2593713, 1.469092, -0.4156442, 1, 1, 1, 1, 1,
0.2614874, 0.235341, 0.9163578, 1, 1, 1, 1, 1,
0.2629223, 0.9018129, 1.00961, 1, 1, 1, 1, 1,
0.2659993, -0.6296844, 2.331135, 1, 1, 1, 1, 1,
0.2671466, -2.116413, 2.725311, 1, 1, 1, 1, 1,
0.2676877, -0.07124054, 3.270897, 1, 1, 1, 1, 1,
0.2695166, 0.6069171, -0.8054525, 1, 1, 1, 1, 1,
0.2702729, 0.292165, 0.6329049, 1, 1, 1, 1, 1,
0.2718954, -0.6443806, 1.679917, 1, 1, 1, 1, 1,
0.2782061, -0.8738958, 1.991839, 1, 1, 1, 1, 1,
0.2784663, -0.9217483, 4.104956, 1, 1, 1, 1, 1,
0.28151, 1.76501, 1.132414, 1, 1, 1, 1, 1,
0.281998, 0.9313819, -1.357249, 1, 1, 1, 1, 1,
0.2843057, 1.337965, 0.2875369, 1, 1, 1, 1, 1,
0.2872408, -0.1252428, 1.319677, 0, 0, 1, 1, 1,
0.2881321, 0.8204368, 1.38101, 1, 0, 0, 1, 1,
0.2927461, 1.192328, -0.7591143, 1, 0, 0, 1, 1,
0.2950915, -0.4086441, 1.597196, 1, 0, 0, 1, 1,
0.2979776, -0.02760997, 3.260284, 1, 0, 0, 1, 1,
0.2986435, -2.283557, 4.786018, 1, 0, 0, 1, 1,
0.3042692, 0.9757937, -0.3685432, 0, 0, 0, 1, 1,
0.3065357, 0.96429, -1.917321, 0, 0, 0, 1, 1,
0.3069615, -0.1235839, 0.7877709, 0, 0, 0, 1, 1,
0.3072209, -0.7359807, 2.000679, 0, 0, 0, 1, 1,
0.310748, -0.6025592, 3.444589, 0, 0, 0, 1, 1,
0.3107691, -1.102776, 1.734405, 0, 0, 0, 1, 1,
0.3116816, -0.1484815, 2.391229, 0, 0, 0, 1, 1,
0.3182643, 1.001364, -0.1197388, 1, 1, 1, 1, 1,
0.3221586, -0.1668523, 2.85422, 1, 1, 1, 1, 1,
0.3224751, -0.599372, 1.461062, 1, 1, 1, 1, 1,
0.3238222, -0.9660381, 1.657758, 1, 1, 1, 1, 1,
0.3255221, -0.3348886, 1.325047, 1, 1, 1, 1, 1,
0.3322329, 0.2776968, 2.324995, 1, 1, 1, 1, 1,
0.3327837, -0.9083316, 3.974571, 1, 1, 1, 1, 1,
0.3378402, 0.3687253, 0.2873829, 1, 1, 1, 1, 1,
0.3424597, 0.7375379, 2.036172, 1, 1, 1, 1, 1,
0.3430533, 0.02816656, 3.230304, 1, 1, 1, 1, 1,
0.343254, -1.776063, 2.994147, 1, 1, 1, 1, 1,
0.34331, -0.3126341, 4.090502, 1, 1, 1, 1, 1,
0.3488186, 0.7599813, 0.1530167, 1, 1, 1, 1, 1,
0.3489087, 0.3570018, 2.200419, 1, 1, 1, 1, 1,
0.3501247, -1.118586, 2.177689, 1, 1, 1, 1, 1,
0.3567535, -0.01266662, 0.889396, 0, 0, 1, 1, 1,
0.3580482, -2.005041, 3.250914, 1, 0, 0, 1, 1,
0.3608306, -1.918954, 4.40015, 1, 0, 0, 1, 1,
0.3643052, -0.9921901, 4.75341, 1, 0, 0, 1, 1,
0.3644791, 0.6983911, 0.2548822, 1, 0, 0, 1, 1,
0.3690357, 0.3954093, 1.948097, 1, 0, 0, 1, 1,
0.370432, -1.344205, 2.80914, 0, 0, 0, 1, 1,
0.3728688, -0.08359414, 3.39601, 0, 0, 0, 1, 1,
0.373749, -0.2201394, 1.753348, 0, 0, 0, 1, 1,
0.3748937, 1.185362, -0.3369576, 0, 0, 0, 1, 1,
0.3749164, -0.7582104, 3.620068, 0, 0, 0, 1, 1,
0.378093, 0.3211693, 0.7614318, 0, 0, 0, 1, 1,
0.3836946, 0.2833091, -0.09250044, 0, 0, 0, 1, 1,
0.3839645, 0.6875395, 2.352871, 1, 1, 1, 1, 1,
0.3852203, 0.1313855, 2.226618, 1, 1, 1, 1, 1,
0.3859954, 0.0718245, 1.216784, 1, 1, 1, 1, 1,
0.3878887, -0.9878627, 2.448566, 1, 1, 1, 1, 1,
0.3881668, 0.938931, 0.4408404, 1, 1, 1, 1, 1,
0.3884816, -0.2407355, 3.012905, 1, 1, 1, 1, 1,
0.3899492, 0.6223908, 0.9705864, 1, 1, 1, 1, 1,
0.3937532, -0.3965333, 0.7930655, 1, 1, 1, 1, 1,
0.3945378, 0.6686455, 0.08481319, 1, 1, 1, 1, 1,
0.3948716, 0.4495607, -1.702539, 1, 1, 1, 1, 1,
0.3968078, -0.1132797, 4.29606, 1, 1, 1, 1, 1,
0.4078436, -2.047981, 2.779537, 1, 1, 1, 1, 1,
0.4121179, -0.5590847, 2.482361, 1, 1, 1, 1, 1,
0.4155947, -0.6484376, 4.163352, 1, 1, 1, 1, 1,
0.4170142, 0.6071613, -0.6283416, 1, 1, 1, 1, 1,
0.417413, -1.110543, 2.032665, 0, 0, 1, 1, 1,
0.4232173, -0.4039826, 0.8067461, 1, 0, 0, 1, 1,
0.4233895, 1.460506, -0.8880423, 1, 0, 0, 1, 1,
0.4242278, 1.033683, 0.8016061, 1, 0, 0, 1, 1,
0.4277648, -0.1244041, 2.804807, 1, 0, 0, 1, 1,
0.4290564, 0.3434583, 1.546599, 1, 0, 0, 1, 1,
0.4298121, -0.7325186, 2.27388, 0, 0, 0, 1, 1,
0.4298749, 0.2435732, 2.352588, 0, 0, 0, 1, 1,
0.4306649, 0.1545156, 1.100417, 0, 0, 0, 1, 1,
0.4327483, -0.02474481, 2.168619, 0, 0, 0, 1, 1,
0.4429639, 0.1057443, 2.039413, 0, 0, 0, 1, 1,
0.4432282, -1.504509, 2.075834, 0, 0, 0, 1, 1,
0.4469642, -0.7717953, 1.857382, 0, 0, 0, 1, 1,
0.4471751, 1.060296, 0.7659629, 1, 1, 1, 1, 1,
0.4483046, -1.133507, 3.490419, 1, 1, 1, 1, 1,
0.4503832, -0.6969293, 1.982205, 1, 1, 1, 1, 1,
0.4509908, 0.2490081, 3.365944, 1, 1, 1, 1, 1,
0.4517955, -0.4752834, 1.775713, 1, 1, 1, 1, 1,
0.4576751, 2.131541, -1.331452, 1, 1, 1, 1, 1,
0.4587096, -1.479774, 3.564179, 1, 1, 1, 1, 1,
0.4605543, -0.2649197, 3.838679, 1, 1, 1, 1, 1,
0.4606826, 0.5125918, -1.197772, 1, 1, 1, 1, 1,
0.4719538, -1.913664, 1.951889, 1, 1, 1, 1, 1,
0.4734206, -0.1994384, 3.406061, 1, 1, 1, 1, 1,
0.4768472, -0.4794061, 0.8508936, 1, 1, 1, 1, 1,
0.4782249, 0.317963, 1.011852, 1, 1, 1, 1, 1,
0.4845668, 1.161953, 0.4375315, 1, 1, 1, 1, 1,
0.4849491, -0.9693539, 3.715178, 1, 1, 1, 1, 1,
0.4988469, -0.6223295, 1.460783, 0, 0, 1, 1, 1,
0.5012177, 0.3729467, 2.160986, 1, 0, 0, 1, 1,
0.5025516, -1.153789, -0.9909586, 1, 0, 0, 1, 1,
0.5086613, -1.745934, 3.082735, 1, 0, 0, 1, 1,
0.5097438, -1.56663, 5.124762, 1, 0, 0, 1, 1,
0.509932, 2.463944, -1.43208, 1, 0, 0, 1, 1,
0.5104151, -1.118226, 4.091459, 0, 0, 0, 1, 1,
0.5141788, 0.2936485, 2.192792, 0, 0, 0, 1, 1,
0.5142336, -0.04640144, 1.701536, 0, 0, 0, 1, 1,
0.5188823, -1.243523, 3.671718, 0, 0, 0, 1, 1,
0.5257638, 1.209123, -0.8116984, 0, 0, 0, 1, 1,
0.5277367, -0.05324743, 1.358053, 0, 0, 0, 1, 1,
0.5366184, 1.282865, 0.931782, 0, 0, 0, 1, 1,
0.5577919, -0.201364, 2.738885, 1, 1, 1, 1, 1,
0.5579324, -0.2497362, -0.4468994, 1, 1, 1, 1, 1,
0.5629883, -0.750836, 2.239748, 1, 1, 1, 1, 1,
0.5657276, -1.996905, 2.567036, 1, 1, 1, 1, 1,
0.569217, 0.1881829, 1.473479, 1, 1, 1, 1, 1,
0.5708174, 1.043093, -0.2781256, 1, 1, 1, 1, 1,
0.5734304, -0.1833576, 1.23099, 1, 1, 1, 1, 1,
0.5740604, -0.7569653, -0.2173499, 1, 1, 1, 1, 1,
0.5796263, 1.065865, 1.673117, 1, 1, 1, 1, 1,
0.5797716, -0.4786224, 1.731467, 1, 1, 1, 1, 1,
0.5809574, 2.479543, 0.7524382, 1, 1, 1, 1, 1,
0.5910141, 0.03068566, 0.9232374, 1, 1, 1, 1, 1,
0.596258, -0.7458229, 2.153628, 1, 1, 1, 1, 1,
0.5988265, -0.6219581, 1.871521, 1, 1, 1, 1, 1,
0.6001461, 0.1590368, 1.949169, 1, 1, 1, 1, 1,
0.6007157, -0.3874025, 0.7705097, 0, 0, 1, 1, 1,
0.6026025, 0.8456267, 0.5273027, 1, 0, 0, 1, 1,
0.6100999, -0.3441331, 0.5488283, 1, 0, 0, 1, 1,
0.6222593, 1.893415, -0.1577395, 1, 0, 0, 1, 1,
0.6246954, -0.3380134, 1.998664, 1, 0, 0, 1, 1,
0.6293036, -0.2475347, 3.173068, 1, 0, 0, 1, 1,
0.6362266, -0.4032388, 2.778172, 0, 0, 0, 1, 1,
0.6363378, -0.6439279, 4.764569, 0, 0, 0, 1, 1,
0.6386498, 1.388958, -0.5014058, 0, 0, 0, 1, 1,
0.6404152, -0.1191143, 0.4588055, 0, 0, 0, 1, 1,
0.6408736, 1.029304, 1.201326, 0, 0, 0, 1, 1,
0.6445029, 0.4624378, 1.918559, 0, 0, 0, 1, 1,
0.6460547, 1.165187, 0.9433141, 0, 0, 0, 1, 1,
0.6477953, -0.06897251, 3.58947, 1, 1, 1, 1, 1,
0.6503836, 0.4330495, 2.088985, 1, 1, 1, 1, 1,
0.6554739, -1.524205, 4.258582, 1, 1, 1, 1, 1,
0.656728, 0.9718971, 1.013138, 1, 1, 1, 1, 1,
0.6597216, 0.329493, 0.9028364, 1, 1, 1, 1, 1,
0.6646727, -1.465484, 1.019136, 1, 1, 1, 1, 1,
0.665458, 0.1785443, 1.930468, 1, 1, 1, 1, 1,
0.6668018, -0.1688197, 2.743674, 1, 1, 1, 1, 1,
0.6671942, 1.46835, 0.4422323, 1, 1, 1, 1, 1,
0.6711056, 0.1344085, 1.537828, 1, 1, 1, 1, 1,
0.6840412, -2.628022, 3.967422, 1, 1, 1, 1, 1,
0.6885879, -0.05588147, 1.375911, 1, 1, 1, 1, 1,
0.6923286, 1.717868, 1.757878, 1, 1, 1, 1, 1,
0.694864, -0.8695196, 1.740753, 1, 1, 1, 1, 1,
0.6961592, 0.2578653, 2.706731, 1, 1, 1, 1, 1,
0.6989834, 0.2265343, 1.169524, 0, 0, 1, 1, 1,
0.7208527, 1.200512, 0.1440996, 1, 0, 0, 1, 1,
0.7262479, 1.732361, 0.5931835, 1, 0, 0, 1, 1,
0.7323843, -0.5628906, 2.234329, 1, 0, 0, 1, 1,
0.7341151, -0.2302842, 2.171885, 1, 0, 0, 1, 1,
0.7359831, -0.5672673, 2.301685, 1, 0, 0, 1, 1,
0.7401765, -1.384842, 3.204341, 0, 0, 0, 1, 1,
0.7420475, -1.531632, 3.864549, 0, 0, 0, 1, 1,
0.7439336, 0.03996537, 2.156817, 0, 0, 0, 1, 1,
0.7516301, -1.140185, 3.164478, 0, 0, 0, 1, 1,
0.7517488, -0.7536231, 2.365548, 0, 0, 0, 1, 1,
0.75267, 1.014272, 1.464864, 0, 0, 0, 1, 1,
0.7549833, -0.6051591, 2.194598, 0, 0, 0, 1, 1,
0.7577061, 2.318229, 0.5478344, 1, 1, 1, 1, 1,
0.7601977, -1.629462, 4.254945, 1, 1, 1, 1, 1,
0.7622905, -0.945836, 1.592677, 1, 1, 1, 1, 1,
0.7634558, -0.9926457, 1.55892, 1, 1, 1, 1, 1,
0.7639465, 0.6849589, 0.2628869, 1, 1, 1, 1, 1,
0.7668232, 0.05100127, 2.163154, 1, 1, 1, 1, 1,
0.7673197, -0.525052, 1.342263, 1, 1, 1, 1, 1,
0.771275, -0.309537, 2.104913, 1, 1, 1, 1, 1,
0.771793, 0.1775459, 0.1461554, 1, 1, 1, 1, 1,
0.7723921, 0.184, 2.859672, 1, 1, 1, 1, 1,
0.7733042, 1.931388, -0.686981, 1, 1, 1, 1, 1,
0.7814313, -0.06347832, 1.403877, 1, 1, 1, 1, 1,
0.7848497, 0.05259586, 2.631832, 1, 1, 1, 1, 1,
0.7894776, 1.072349, 1.482535, 1, 1, 1, 1, 1,
0.7920656, -0.5005816, 3.530833, 1, 1, 1, 1, 1,
0.7929823, 0.5250236, -0.3526199, 0, 0, 1, 1, 1,
0.7940184, 0.6718479, 1.469927, 1, 0, 0, 1, 1,
0.7973145, 1.512922, -0.7237159, 1, 0, 0, 1, 1,
0.7990469, 1.990406, -0.1885133, 1, 0, 0, 1, 1,
0.7991449, 0.4975632, 0.3217331, 1, 0, 0, 1, 1,
0.8139845, 1.219382, 0.6834686, 1, 0, 0, 1, 1,
0.8160688, 0.4441495, -1.45571, 0, 0, 0, 1, 1,
0.8163236, -1.226928, 2.210834, 0, 0, 0, 1, 1,
0.8163946, -0.651191, 1.872495, 0, 0, 0, 1, 1,
0.8186048, -0.5028826, 0.9827281, 0, 0, 0, 1, 1,
0.8263192, -1.341278, 1.982521, 0, 0, 0, 1, 1,
0.8420679, -2.210163, 3.868908, 0, 0, 0, 1, 1,
0.8423788, -0.3113568, 3.12324, 0, 0, 0, 1, 1,
0.846115, -0.2765864, 4.557506, 1, 1, 1, 1, 1,
0.8476791, 0.00638284, 3.115803, 1, 1, 1, 1, 1,
0.8488905, 0.6992788, 0.8282329, 1, 1, 1, 1, 1,
0.857034, 0.7470561, -0.417787, 1, 1, 1, 1, 1,
0.8582224, -0.3892479, 2.584493, 1, 1, 1, 1, 1,
0.8602942, -1.471163, 1.747212, 1, 1, 1, 1, 1,
0.861852, 1.016857, -0.5259145, 1, 1, 1, 1, 1,
0.8637413, -1.015217, 0.7603073, 1, 1, 1, 1, 1,
0.8664651, -0.06071749, 2.610535, 1, 1, 1, 1, 1,
0.8669655, -0.8820873, 1.471507, 1, 1, 1, 1, 1,
0.8711854, 0.8818874, 0.8860153, 1, 1, 1, 1, 1,
0.8809139, 0.243802, 2.953404, 1, 1, 1, 1, 1,
0.8875526, -0.3030466, 0.9780665, 1, 1, 1, 1, 1,
0.890733, 0.006908388, 1.792741, 1, 1, 1, 1, 1,
0.8915466, -0.2957144, 1.802649, 1, 1, 1, 1, 1,
0.8973363, 0.865712, -0.8677254, 0, 0, 1, 1, 1,
0.8976735, -0.07836487, 0.1001111, 1, 0, 0, 1, 1,
0.9041657, 2.279562, 1.522083, 1, 0, 0, 1, 1,
0.9196936, -0.2883879, 1.203885, 1, 0, 0, 1, 1,
0.9238455, 0.6456447, 0.09288038, 1, 0, 0, 1, 1,
0.9239963, -0.7762321, 2.467315, 1, 0, 0, 1, 1,
0.928757, -0.3893373, 1.467972, 0, 0, 0, 1, 1,
0.9311869, -0.4633945, 2.5959, 0, 0, 0, 1, 1,
0.935232, 0.1410503, 0.06041052, 0, 0, 0, 1, 1,
0.9426328, 2.470255, 0.6935352, 0, 0, 0, 1, 1,
0.9430842, -1.409909, 3.337609, 0, 0, 0, 1, 1,
0.9454603, 1.115427, 2.176253, 0, 0, 0, 1, 1,
0.9493677, -0.7722706, 2.111288, 0, 0, 0, 1, 1,
0.9512089, 0.6866722, 2.083065, 1, 1, 1, 1, 1,
0.9545889, 2.056112, 0.8532346, 1, 1, 1, 1, 1,
0.9581267, 1.655828, 2.021693, 1, 1, 1, 1, 1,
0.9638913, -0.03902404, 1.086562, 1, 1, 1, 1, 1,
0.965496, -0.3557616, 1.082927, 1, 1, 1, 1, 1,
0.9668729, 1.853608, 1.122534, 1, 1, 1, 1, 1,
0.9776492, 0.09959003, 2.657538, 1, 1, 1, 1, 1,
0.9777415, 0.4766551, 1.39299, 1, 1, 1, 1, 1,
0.9821479, -0.8387677, 2.223906, 1, 1, 1, 1, 1,
0.9822564, 0.5589913, 1.763838, 1, 1, 1, 1, 1,
0.9843001, 0.1650936, 1.74632, 1, 1, 1, 1, 1,
0.9887506, -0.4568206, 3.584197, 1, 1, 1, 1, 1,
0.9932286, 0.8871751, 2.151104, 1, 1, 1, 1, 1,
0.9971928, -1.006579, 1.336907, 1, 1, 1, 1, 1,
0.9994286, -0.1087284, 1.244748, 1, 1, 1, 1, 1,
0.9995976, -0.009780768, 1.586896, 0, 0, 1, 1, 1,
1.010646, -0.8546547, 2.413489, 1, 0, 0, 1, 1,
1.02279, 0.5081463, 1.885968, 1, 0, 0, 1, 1,
1.023695, 0.7662268, 0.7996182, 1, 0, 0, 1, 1,
1.027602, -1.696925, 2.928768, 1, 0, 0, 1, 1,
1.038168, 0.1116897, 1.76077, 1, 0, 0, 1, 1,
1.038301, 0.3395387, 1.021134, 0, 0, 0, 1, 1,
1.040939, -1.126474, 3.009535, 0, 0, 0, 1, 1,
1.045489, 0.1303213, 1.249253, 0, 0, 0, 1, 1,
1.045699, 2.129479, 0.03464401, 0, 0, 0, 1, 1,
1.050193, -0.09334914, 2.173045, 0, 0, 0, 1, 1,
1.050312, 1.114115, -2.632305, 0, 0, 0, 1, 1,
1.051024, -1.140327, 3.45945, 0, 0, 0, 1, 1,
1.053177, -1.97935, 4.146675, 1, 1, 1, 1, 1,
1.05947, -0.3911249, 2.957408, 1, 1, 1, 1, 1,
1.060144, 1.644226, 0.3799244, 1, 1, 1, 1, 1,
1.065143, -0.446139, 0.6262572, 1, 1, 1, 1, 1,
1.067219, -0.5634212, 3.156286, 1, 1, 1, 1, 1,
1.067494, -1.236491, 1.707315, 1, 1, 1, 1, 1,
1.071113, -0.3780271, 2.695943, 1, 1, 1, 1, 1,
1.071256, 0.5068244, -0.500478, 1, 1, 1, 1, 1,
1.073275, 0.6439754, 0.9751143, 1, 1, 1, 1, 1,
1.073618, -0.68292, -0.130989, 1, 1, 1, 1, 1,
1.075957, 0.6048837, 0.03472099, 1, 1, 1, 1, 1,
1.077767, -0.8317218, 2.541165, 1, 1, 1, 1, 1,
1.094369, -1.401776, 1.849666, 1, 1, 1, 1, 1,
1.103021, -0.0289788, 0.7204061, 1, 1, 1, 1, 1,
1.103993, 0.6033527, 0.03877114, 1, 1, 1, 1, 1,
1.111829, 0.9369553, 1.27279, 0, 0, 1, 1, 1,
1.113487, -0.0401184, 0.1450313, 1, 0, 0, 1, 1,
1.117745, 1.407589, 1.27149, 1, 0, 0, 1, 1,
1.118502, 1.012432, -0.08162328, 1, 0, 0, 1, 1,
1.118997, 0.4441637, 1.945017, 1, 0, 0, 1, 1,
1.119204, -0.772937, 0.7214108, 1, 0, 0, 1, 1,
1.120533, -0.4922232, 2.858786, 0, 0, 0, 1, 1,
1.121936, -1.722429, 1.685609, 0, 0, 0, 1, 1,
1.122485, 0.07848802, -0.7654281, 0, 0, 0, 1, 1,
1.130211, -0.07681815, 2.197088, 0, 0, 0, 1, 1,
1.134288, -0.5301981, 1.888749, 0, 0, 0, 1, 1,
1.138701, 1.765913, 0.4817353, 0, 0, 0, 1, 1,
1.160804, 0.3098211, 0.3933392, 0, 0, 0, 1, 1,
1.16708, 1.010759, 0.591913, 1, 1, 1, 1, 1,
1.183109, 0.2436376, 0.4223206, 1, 1, 1, 1, 1,
1.184362, -1.133955, 2.544607, 1, 1, 1, 1, 1,
1.190127, 2.045983, 0.6200982, 1, 1, 1, 1, 1,
1.190166, -0.9718858, 1.328346, 1, 1, 1, 1, 1,
1.194806, 1.410502, 0.5790638, 1, 1, 1, 1, 1,
1.196788, 0.7220407, -0.2187447, 1, 1, 1, 1, 1,
1.198394, 0.549157, -0.08196018, 1, 1, 1, 1, 1,
1.199186, -1.334801, 3.592298, 1, 1, 1, 1, 1,
1.206073, -0.9271054, 1.159312, 1, 1, 1, 1, 1,
1.211567, -1.506582, 1.290975, 1, 1, 1, 1, 1,
1.215422, 0.001015753, 1.949861, 1, 1, 1, 1, 1,
1.216174, -2.144176, 2.502921, 1, 1, 1, 1, 1,
1.23281, 0.4532417, 1.257925, 1, 1, 1, 1, 1,
1.234752, 1.689928, 0.4292186, 1, 1, 1, 1, 1,
1.245431, -3.402205, 3.317169, 0, 0, 1, 1, 1,
1.247221, -1.155418, 3.336847, 1, 0, 0, 1, 1,
1.247766, 0.5110209, 0.6341919, 1, 0, 0, 1, 1,
1.251264, 0.2172088, 1.162925, 1, 0, 0, 1, 1,
1.256299, -0.2609766, 2.24321, 1, 0, 0, 1, 1,
1.256709, -1.016614, 2.860441, 1, 0, 0, 1, 1,
1.273391, -1.395238, 3.354757, 0, 0, 0, 1, 1,
1.275257, 0.03812335, 0.1432496, 0, 0, 0, 1, 1,
1.294576, -0.9968773, 1.260963, 0, 0, 0, 1, 1,
1.308335, 1.641053, 0.278067, 0, 0, 0, 1, 1,
1.310479, 0.7649177, 0.03991503, 0, 0, 0, 1, 1,
1.314722, 1.02993, -1.053416, 0, 0, 0, 1, 1,
1.33069, 2.91922, 1.628354, 0, 0, 0, 1, 1,
1.340679, 0.6460953, 0.4734489, 1, 1, 1, 1, 1,
1.3413, 2.063001, 0.1630378, 1, 1, 1, 1, 1,
1.342285, -1.127671, 2.847943, 1, 1, 1, 1, 1,
1.343623, 0.9917173, 2.462505, 1, 1, 1, 1, 1,
1.344677, -0.01041254, 0.2049091, 1, 1, 1, 1, 1,
1.352533, 1.09103, 1.9927, 1, 1, 1, 1, 1,
1.364306, -0.3199286, 0.1588028, 1, 1, 1, 1, 1,
1.399065, -0.1250406, 1.903623, 1, 1, 1, 1, 1,
1.418854, -0.1929378, 0.8824114, 1, 1, 1, 1, 1,
1.420362, -1.735962, 1.699262, 1, 1, 1, 1, 1,
1.425261, -0.548531, 1.077841, 1, 1, 1, 1, 1,
1.426937, -1.283173, 2.827461, 1, 1, 1, 1, 1,
1.427517, -0.37718, 1.28152, 1, 1, 1, 1, 1,
1.43666, -1.279547, 2.099147, 1, 1, 1, 1, 1,
1.441253, 0.07147601, 2.296621, 1, 1, 1, 1, 1,
1.441489, 0.3492115, 2.556132, 0, 0, 1, 1, 1,
1.443844, -0.4720613, 2.827073, 1, 0, 0, 1, 1,
1.46567, -0.1639761, -0.09036063, 1, 0, 0, 1, 1,
1.466761, -0.649708, 4.040634, 1, 0, 0, 1, 1,
1.471998, 1.283209, 0.8538988, 1, 0, 0, 1, 1,
1.477621, 1.205392, 0.1666818, 1, 0, 0, 1, 1,
1.478721, 0.3819295, 0.5556186, 0, 0, 0, 1, 1,
1.485942, 0.253909, 2.7229, 0, 0, 0, 1, 1,
1.487273, 0.9189091, 1.786964, 0, 0, 0, 1, 1,
1.493125, -2.478112, 2.612475, 0, 0, 0, 1, 1,
1.494946, 0.672745, 1.398777, 0, 0, 0, 1, 1,
1.511523, 1.526134, 0.3714379, 0, 0, 0, 1, 1,
1.520082, -1.090914, 2.043255, 0, 0, 0, 1, 1,
1.523385, 0.2330523, 2.288931, 1, 1, 1, 1, 1,
1.55095, -1.479581, 2.307538, 1, 1, 1, 1, 1,
1.556964, -1.041796, 2.489095, 1, 1, 1, 1, 1,
1.56621, 0.7611767, 1.043681, 1, 1, 1, 1, 1,
1.58261, -0.1586538, 1.260002, 1, 1, 1, 1, 1,
1.585529, 0.3042154, 1.79707, 1, 1, 1, 1, 1,
1.597029, -0.07538499, 0.9930013, 1, 1, 1, 1, 1,
1.621421, -1.482629, 1.569415, 1, 1, 1, 1, 1,
1.630515, -0.3944634, 3.793243, 1, 1, 1, 1, 1,
1.66998, 0.8267701, 1.450772, 1, 1, 1, 1, 1,
1.670019, 1.532526, -0.7999055, 1, 1, 1, 1, 1,
1.672623, 1.86347, 0.1349151, 1, 1, 1, 1, 1,
1.684283, 1.325599, 0.9826241, 1, 1, 1, 1, 1,
1.697131, -0.6670813, 1.986061, 1, 1, 1, 1, 1,
1.71434, 0.2148258, 0.91014, 1, 1, 1, 1, 1,
1.723301, -0.3535308, 2.215798, 0, 0, 1, 1, 1,
1.727068, 0.03619883, 2.333453, 1, 0, 0, 1, 1,
1.727501, 0.4285608, 1.787803, 1, 0, 0, 1, 1,
1.733113, -0.5725451, 1.980335, 1, 0, 0, 1, 1,
1.755176, 0.9836342, 2.026701, 1, 0, 0, 1, 1,
1.757751, -0.378335, 2.487392, 1, 0, 0, 1, 1,
1.767094, 0.3681179, -0.3717699, 0, 0, 0, 1, 1,
1.789282, 0.8110554, 1.634974, 0, 0, 0, 1, 1,
1.796546, 1.097954, 2.385309, 0, 0, 0, 1, 1,
1.801403, 1.169079, 0.824017, 0, 0, 0, 1, 1,
1.801727, -2.340839, 2.845115, 0, 0, 0, 1, 1,
1.805278, 1.487502, 0.06052448, 0, 0, 0, 1, 1,
1.806434, -0.8453319, 2.297904, 0, 0, 0, 1, 1,
1.825467, -1.607365, 3.123666, 1, 1, 1, 1, 1,
1.826273, -0.2674119, 0.5695286, 1, 1, 1, 1, 1,
1.855717, 1.487369, 0.6288896, 1, 1, 1, 1, 1,
1.856228, -0.1136026, 1.162034, 1, 1, 1, 1, 1,
1.876864, -0.5592327, 2.708532, 1, 1, 1, 1, 1,
1.879439, -0.6868902, 2.909931, 1, 1, 1, 1, 1,
1.881858, -0.8574754, 1.688942, 1, 1, 1, 1, 1,
1.891379, 0.6681685, 2.67188, 1, 1, 1, 1, 1,
1.907408, -0.3233013, 3.084238, 1, 1, 1, 1, 1,
1.917804, -0.07898468, 2.026391, 1, 1, 1, 1, 1,
2.009937, -0.404033, 0.06439422, 1, 1, 1, 1, 1,
2.012916, -0.6081765, 1.785146, 1, 1, 1, 1, 1,
2.019708, 2.099356, -0.4737639, 1, 1, 1, 1, 1,
2.026404, -0.6237646, 0.5543615, 1, 1, 1, 1, 1,
2.041896, -0.1546783, 1.79328, 1, 1, 1, 1, 1,
2.059129, 0.8478422, 1.358868, 0, 0, 1, 1, 1,
2.064399, -1.311518, 1.948047, 1, 0, 0, 1, 1,
2.067358, -0.5681466, 2.890722, 1, 0, 0, 1, 1,
2.141032, -0.192853, 1.327452, 1, 0, 0, 1, 1,
2.181944, -0.4511975, 1.914057, 1, 0, 0, 1, 1,
2.194875, -0.3446983, -0.3863496, 1, 0, 0, 1, 1,
2.241761, 0.07751087, 2.522489, 0, 0, 0, 1, 1,
2.252628, 0.2789472, 1.050042, 0, 0, 0, 1, 1,
2.266287, -0.9737941, 0.9808876, 0, 0, 0, 1, 1,
2.298228, 0.9549508, 1.292002, 0, 0, 0, 1, 1,
2.303394, -0.6238161, 3.144577, 0, 0, 0, 1, 1,
2.363809, -0.1755679, -0.1177723, 0, 0, 0, 1, 1,
2.374624, -0.4176474, 1.286057, 0, 0, 0, 1, 1,
2.421048, -0.3289725, 2.306917, 1, 1, 1, 1, 1,
2.422852, -1.352276, 1.459514, 1, 1, 1, 1, 1,
2.539207, -0.8538131, 3.170968, 1, 1, 1, 1, 1,
2.630606, -0.8020428, 3.134604, 1, 1, 1, 1, 1,
2.764704, 0.6638774, 1.97395, 1, 1, 1, 1, 1,
2.783621, 0.9554734, -2.23959, 1, 1, 1, 1, 1,
2.901168, -1.172472, 3.408118, 1, 1, 1, 1, 1
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
var radius = 9.473968;
var distance = 33.27691;
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
mvMatrix.translate( 0.3012058, 0.2414927, 0.1367958 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.27691);
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