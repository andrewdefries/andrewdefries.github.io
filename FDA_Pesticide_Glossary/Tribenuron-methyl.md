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
-4.316033, -0.4847861, -3.03052, 1, 0, 0, 1,
-3.195132, -0.1547961, -1.566875, 1, 0.007843138, 0, 1,
-3.138819, -0.1813158, -2.458443, 1, 0.01176471, 0, 1,
-3.004734, 0.008329103, -0.1848545, 1, 0.01960784, 0, 1,
-2.729002, -0.4540927, -4.126987, 1, 0.02352941, 0, 1,
-2.712545, -1.203891, -2.873601, 1, 0.03137255, 0, 1,
-2.597648, 1.180585, -0.01084905, 1, 0.03529412, 0, 1,
-2.448584, 0.6541175, -0.935543, 1, 0.04313726, 0, 1,
-2.417247, -1.4699, -3.757664, 1, 0.04705882, 0, 1,
-2.403924, -0.001419419, 0.1557755, 1, 0.05490196, 0, 1,
-2.391379, -0.4194966, -1.114171, 1, 0.05882353, 0, 1,
-2.377348, 0.8960615, 0.5422558, 1, 0.06666667, 0, 1,
-2.375409, -0.3130247, -1.654149, 1, 0.07058824, 0, 1,
-2.356944, 0.7630623, -2.165261, 1, 0.07843138, 0, 1,
-2.327272, -0.4171124, -0.01002365, 1, 0.08235294, 0, 1,
-2.32654, 0.852479, -1.179519, 1, 0.09019608, 0, 1,
-2.29066, -0.4345286, -1.417794, 1, 0.09411765, 0, 1,
-2.231308, -0.06489028, -0.9533814, 1, 0.1019608, 0, 1,
-2.220317, 0.3337273, -2.954486, 1, 0.1098039, 0, 1,
-2.208529, -0.6092178, -2.45455, 1, 0.1137255, 0, 1,
-2.171205, -0.8975608, -2.760037, 1, 0.1215686, 0, 1,
-2.162122, 0.9367967, -0.8802555, 1, 0.1254902, 0, 1,
-2.152879, -0.05933046, -3.013115, 1, 0.1333333, 0, 1,
-2.14872, -1.705088, -2.235715, 1, 0.1372549, 0, 1,
-2.094676, 0.8989987, -2.382107, 1, 0.145098, 0, 1,
-2.092551, -0.1261031, -1.58119, 1, 0.1490196, 0, 1,
-2.082233, -0.2671023, -2.125293, 1, 0.1568628, 0, 1,
-2.060388, 2.317086, -0.09709591, 1, 0.1607843, 0, 1,
-2.047985, 1.371778, -0.2452073, 1, 0.1686275, 0, 1,
-2.022358, -1.231652, -1.700053, 1, 0.172549, 0, 1,
-2.000689, -0.9519574, -1.776024, 1, 0.1803922, 0, 1,
-1.994683, 1.511595, -0.5217637, 1, 0.1843137, 0, 1,
-1.968569, 0.1595057, -1.649014, 1, 0.1921569, 0, 1,
-1.945258, 0.4579617, -1.287156, 1, 0.1960784, 0, 1,
-1.933281, -0.5385222, -2.375285, 1, 0.2039216, 0, 1,
-1.905616, -0.697373, -3.452127, 1, 0.2117647, 0, 1,
-1.899313, -0.02800669, -0.9014587, 1, 0.2156863, 0, 1,
-1.89748, 1.256217, -1.004346, 1, 0.2235294, 0, 1,
-1.881454, 0.1401613, -1.961021, 1, 0.227451, 0, 1,
-1.881435, 0.6091293, -0.8350483, 1, 0.2352941, 0, 1,
-1.872666, 0.05947224, -1.352779, 1, 0.2392157, 0, 1,
-1.84251, 0.3081307, -1.659564, 1, 0.2470588, 0, 1,
-1.835343, -0.02113792, -3.288671, 1, 0.2509804, 0, 1,
-1.825878, -1.481788, -2.113191, 1, 0.2588235, 0, 1,
-1.821092, -0.3732952, -2.675487, 1, 0.2627451, 0, 1,
-1.801032, 1.438392, -0.2682818, 1, 0.2705882, 0, 1,
-1.799739, -0.9018299, -0.7818312, 1, 0.2745098, 0, 1,
-1.782902, 1.798183, -0.8249547, 1, 0.282353, 0, 1,
-1.77109, -0.9012802, -1.204733, 1, 0.2862745, 0, 1,
-1.761764, -0.9245262, -2.257243, 1, 0.2941177, 0, 1,
-1.7472, -0.3854375, -1.980441, 1, 0.3019608, 0, 1,
-1.745543, 0.316713, -1.119048, 1, 0.3058824, 0, 1,
-1.738612, 1.633915, -1.377124, 1, 0.3137255, 0, 1,
-1.730534, 0.8724557, 0.9328488, 1, 0.3176471, 0, 1,
-1.72769, 0.6095521, -1.925629, 1, 0.3254902, 0, 1,
-1.72172, 1.026006, -0.7096144, 1, 0.3294118, 0, 1,
-1.710995, 0.9142947, -1.577796, 1, 0.3372549, 0, 1,
-1.687702, 1.374075, 0.292687, 1, 0.3411765, 0, 1,
-1.684822, 0.1468872, -0.2800826, 1, 0.3490196, 0, 1,
-1.680868, -0.09718824, -0.9576902, 1, 0.3529412, 0, 1,
-1.675264, 0.5490646, -0.4371721, 1, 0.3607843, 0, 1,
-1.672865, -0.8828998, -2.839345, 1, 0.3647059, 0, 1,
-1.66393, -1.124903, -1.965711, 1, 0.372549, 0, 1,
-1.663829, 0.167106, -2.740456, 1, 0.3764706, 0, 1,
-1.6511, -0.5667244, -1.630395, 1, 0.3843137, 0, 1,
-1.640698, -1.321263, -1.738063, 1, 0.3882353, 0, 1,
-1.639194, -0.2863641, -2.936796, 1, 0.3960784, 0, 1,
-1.638381, 1.255718, -0.0002381126, 1, 0.4039216, 0, 1,
-1.623838, -0.8265263, -1.522437, 1, 0.4078431, 0, 1,
-1.60957, -1.659486, -2.936123, 1, 0.4156863, 0, 1,
-1.606853, 0.4345753, -0.1715422, 1, 0.4196078, 0, 1,
-1.60344, 0.813581, -2.844824, 1, 0.427451, 0, 1,
-1.57161, -0.2324645, -2.417184, 1, 0.4313726, 0, 1,
-1.554494, 1.31549, -1.650808, 1, 0.4392157, 0, 1,
-1.510424, -0.4810803, -2.400267, 1, 0.4431373, 0, 1,
-1.491797, 0.445019, -1.648346, 1, 0.4509804, 0, 1,
-1.489077, -1.165642, -1.019425, 1, 0.454902, 0, 1,
-1.47845, 0.6209074, -1.338663, 1, 0.4627451, 0, 1,
-1.467856, -0.0617829, -3.450704, 1, 0.4666667, 0, 1,
-1.464169, -0.2208449, -2.779063, 1, 0.4745098, 0, 1,
-1.448401, 0.9303523, -0.02450324, 1, 0.4784314, 0, 1,
-1.445887, 0.1485794, -2.022801, 1, 0.4862745, 0, 1,
-1.429879, -0.821343, -1.291719, 1, 0.4901961, 0, 1,
-1.403205, 0.3319916, -0.4300999, 1, 0.4980392, 0, 1,
-1.400916, 0.003713691, -0.9636105, 1, 0.5058824, 0, 1,
-1.398118, 0.4648618, -2.444691, 1, 0.509804, 0, 1,
-1.391044, 1.05598, 0.3987117, 1, 0.5176471, 0, 1,
-1.385443, 0.8248819, -1.158554, 1, 0.5215687, 0, 1,
-1.371922, -0.8303466, -0.9272873, 1, 0.5294118, 0, 1,
-1.36964, 2.353753, 0.3340227, 1, 0.5333334, 0, 1,
-1.365579, -1.215184, -2.536894, 1, 0.5411765, 0, 1,
-1.361962, -0.3281914, -1.618769, 1, 0.5450981, 0, 1,
-1.33928, -2.73934, -3.071665, 1, 0.5529412, 0, 1,
-1.326536, 0.09917233, -1.218317, 1, 0.5568628, 0, 1,
-1.326534, 1.437321, 0.6288986, 1, 0.5647059, 0, 1,
-1.320462, -2.219044, -3.178308, 1, 0.5686275, 0, 1,
-1.318439, -2.20217, -2.830126, 1, 0.5764706, 0, 1,
-1.315943, -1.554417, -1.597085, 1, 0.5803922, 0, 1,
-1.307625, -0.1178244, -2.398443, 1, 0.5882353, 0, 1,
-1.30606, 1.250695, 0.5753818, 1, 0.5921569, 0, 1,
-1.303516, 1.027712, -0.7608787, 1, 0.6, 0, 1,
-1.300374, -1.674425, -2.539084, 1, 0.6078432, 0, 1,
-1.297234, -0.9801013, -1.995652, 1, 0.6117647, 0, 1,
-1.265109, -0.1568449, -2.960844, 1, 0.6196079, 0, 1,
-1.262525, 0.981304, -0.7515915, 1, 0.6235294, 0, 1,
-1.252218, 0.1916833, -1.837924, 1, 0.6313726, 0, 1,
-1.236502, 0.04279811, -1.802322, 1, 0.6352941, 0, 1,
-1.233829, -0.04307836, -2.755892, 1, 0.6431373, 0, 1,
-1.232701, -0.2671662, -0.828718, 1, 0.6470588, 0, 1,
-1.228893, -0.2033975, -0.4920218, 1, 0.654902, 0, 1,
-1.226889, -0.5298941, -2.177993, 1, 0.6588235, 0, 1,
-1.225877, 1.144938, -2.342407, 1, 0.6666667, 0, 1,
-1.224341, 0.7773638, -0.5675595, 1, 0.6705883, 0, 1,
-1.222569, -0.08783717, -2.749473, 1, 0.6784314, 0, 1,
-1.215334, -0.4356738, -0.8696908, 1, 0.682353, 0, 1,
-1.20585, 0.4689938, -3.476171, 1, 0.6901961, 0, 1,
-1.198145, -0.5769743, -1.837492, 1, 0.6941177, 0, 1,
-1.194781, -0.4835649, -3.737195, 1, 0.7019608, 0, 1,
-1.189411, 0.3705386, -1.163769, 1, 0.7098039, 0, 1,
-1.18588, 0.6133766, -0.2832155, 1, 0.7137255, 0, 1,
-1.180119, -0.4455983, 0.003994982, 1, 0.7215686, 0, 1,
-1.170325, -0.7066776, -1.349881, 1, 0.7254902, 0, 1,
-1.167022, -0.2038375, -1.323901, 1, 0.7333333, 0, 1,
-1.152222, 0.5828289, -1.808645, 1, 0.7372549, 0, 1,
-1.147707, 2.280268, -0.4555041, 1, 0.7450981, 0, 1,
-1.144334, 0.2359518, -1.476455, 1, 0.7490196, 0, 1,
-1.141786, 0.2813514, -2.286975, 1, 0.7568628, 0, 1,
-1.141426, -1.700443, -3.659747, 1, 0.7607843, 0, 1,
-1.129575, 0.7151718, -2.996941, 1, 0.7686275, 0, 1,
-1.128481, 0.7515503, -2.188508, 1, 0.772549, 0, 1,
-1.127729, -0.2170911, -1.799363, 1, 0.7803922, 0, 1,
-1.120623, 0.3038869, -1.62499, 1, 0.7843137, 0, 1,
-1.116697, -0.8695218, -2.484222, 1, 0.7921569, 0, 1,
-1.111684, 0.424799, -1.491491, 1, 0.7960784, 0, 1,
-1.109523, 0.6377181, -0.1491653, 1, 0.8039216, 0, 1,
-1.1039, -1.078719, -4.16047, 1, 0.8117647, 0, 1,
-1.102326, -2.482363, -2.114808, 1, 0.8156863, 0, 1,
-1.092722, 0.1496483, -2.63137, 1, 0.8235294, 0, 1,
-1.087251, -0.03322862, -1.805097, 1, 0.827451, 0, 1,
-1.083346, -0.05261242, -2.00606, 1, 0.8352941, 0, 1,
-1.08163, 0.1441348, 0.8269111, 1, 0.8392157, 0, 1,
-1.079815, 0.05223262, 0.0330924, 1, 0.8470588, 0, 1,
-1.075013, 1.498234, -1.199562, 1, 0.8509804, 0, 1,
-1.069319, 1.407821, 0.288055, 1, 0.8588235, 0, 1,
-1.065346, 0.08049653, -1.678077, 1, 0.8627451, 0, 1,
-1.061221, 0.7929585, -0.5111892, 1, 0.8705882, 0, 1,
-1.054671, -0.3470399, -0.5274726, 1, 0.8745098, 0, 1,
-1.043787, 1.002007, -0.5698278, 1, 0.8823529, 0, 1,
-1.042319, 0.775606, -1.503943, 1, 0.8862745, 0, 1,
-1.03916, 0.108512, -2.548082, 1, 0.8941177, 0, 1,
-1.030038, 0.125996, -1.287484, 1, 0.8980392, 0, 1,
-1.024707, 0.7880358, -1.878235, 1, 0.9058824, 0, 1,
-1.024322, 0.1984704, -0.4094955, 1, 0.9137255, 0, 1,
-1.021381, -1.603565, -0.9105362, 1, 0.9176471, 0, 1,
-1.020728, 2.451957, 0.4478227, 1, 0.9254902, 0, 1,
-1.017994, 0.6345702, -0.9531175, 1, 0.9294118, 0, 1,
-1.013983, 0.9174255, -0.3946699, 1, 0.9372549, 0, 1,
-1.00911, 0.2896361, -2.4448, 1, 0.9411765, 0, 1,
-1.008131, 1.495158, -0.01307942, 1, 0.9490196, 0, 1,
-0.9990807, 1.018379, -1.067028, 1, 0.9529412, 0, 1,
-0.9982389, -0.9913447, -0.9946707, 1, 0.9607843, 0, 1,
-0.9887111, 0.1408164, -3.023209, 1, 0.9647059, 0, 1,
-0.9854367, 0.77428, -2.558762, 1, 0.972549, 0, 1,
-0.9778143, -0.05474322, -1.390494, 1, 0.9764706, 0, 1,
-0.9763663, -0.7737349, -4.080819, 1, 0.9843137, 0, 1,
-0.9720668, 0.7877523, 1.30466, 1, 0.9882353, 0, 1,
-0.9698937, 0.04472407, -1.133297, 1, 0.9960784, 0, 1,
-0.968915, 1.425176, 0.490229, 0.9960784, 1, 0, 1,
-0.967501, 1.03009, -1.140384, 0.9921569, 1, 0, 1,
-0.9656325, 2.996831, -1.362257, 0.9843137, 1, 0, 1,
-0.9649887, 0.2220308, -0.03176298, 0.9803922, 1, 0, 1,
-0.964074, 0.3393691, 0.01374218, 0.972549, 1, 0, 1,
-0.9629144, 0.3422067, -0.3293576, 0.9686275, 1, 0, 1,
-0.9600873, -0.1393262, -0.6283571, 0.9607843, 1, 0, 1,
-0.9497342, 0.7180678, -1.592245, 0.9568627, 1, 0, 1,
-0.9441745, -1.298089, -2.986751, 0.9490196, 1, 0, 1,
-0.9439331, -0.3060054, -2.433819, 0.945098, 1, 0, 1,
-0.9369078, -0.6607898, -2.737752, 0.9372549, 1, 0, 1,
-0.9360526, -0.291412, -3.991619, 0.9333333, 1, 0, 1,
-0.9348903, 1.587669, -0.5091306, 0.9254902, 1, 0, 1,
-0.9196196, -0.03957198, -0.9711709, 0.9215686, 1, 0, 1,
-0.9176343, -1.343721, -3.178904, 0.9137255, 1, 0, 1,
-0.9142411, 0.4227532, -0.6480579, 0.9098039, 1, 0, 1,
-0.9138288, 0.31953, 0.1507991, 0.9019608, 1, 0, 1,
-0.9124753, 0.1450778, -2.441046, 0.8941177, 1, 0, 1,
-0.9118959, -0.08896562, -1.882089, 0.8901961, 1, 0, 1,
-0.9083317, -1.075503, -2.219014, 0.8823529, 1, 0, 1,
-0.9075533, -0.0450469, -2.393603, 0.8784314, 1, 0, 1,
-0.9067678, 0.4100669, -2.356514, 0.8705882, 1, 0, 1,
-0.8986952, -0.2074955, -1.996562, 0.8666667, 1, 0, 1,
-0.8946178, 0.7739512, -1.60291, 0.8588235, 1, 0, 1,
-0.8941497, -0.8808225, -1.941308, 0.854902, 1, 0, 1,
-0.884484, 0.9265512, -1.399794, 0.8470588, 1, 0, 1,
-0.8786556, -0.4268442, -1.430986, 0.8431373, 1, 0, 1,
-0.8744326, -1.109285, -0.5379851, 0.8352941, 1, 0, 1,
-0.8725187, 1.25008, -1.933619, 0.8313726, 1, 0, 1,
-0.8709611, -0.2032802, -0.7989922, 0.8235294, 1, 0, 1,
-0.8693804, 0.3273515, -0.3655012, 0.8196079, 1, 0, 1,
-0.868621, -1.452357, -4.398173, 0.8117647, 1, 0, 1,
-0.8652087, 1.765123, 1.467413, 0.8078431, 1, 0, 1,
-0.8642494, 0.734773, -1.659523, 0.8, 1, 0, 1,
-0.8619578, -1.796304, -1.776965, 0.7921569, 1, 0, 1,
-0.8578194, -0.2395903, -0.6501477, 0.7882353, 1, 0, 1,
-0.8567514, -0.6993016, -1.510341, 0.7803922, 1, 0, 1,
-0.8556073, 0.7727977, -0.8488729, 0.7764706, 1, 0, 1,
-0.853978, 1.009647, -0.5085167, 0.7686275, 1, 0, 1,
-0.851504, -0.689391, -0.8051976, 0.7647059, 1, 0, 1,
-0.8493627, 0.5764674, -1.674605, 0.7568628, 1, 0, 1,
-0.8489268, 0.5451832, -2.359787, 0.7529412, 1, 0, 1,
-0.8412653, -1.35072, -2.184011, 0.7450981, 1, 0, 1,
-0.8375692, 0.7398975, -0.6732839, 0.7411765, 1, 0, 1,
-0.8318233, -1.19593, -3.596808, 0.7333333, 1, 0, 1,
-0.8312176, -0.2497613, -2.187297, 0.7294118, 1, 0, 1,
-0.8309826, 1.057484, 0.3615762, 0.7215686, 1, 0, 1,
-0.8296714, 0.4402862, -1.84886, 0.7176471, 1, 0, 1,
-0.8243982, 0.268196, -1.333883, 0.7098039, 1, 0, 1,
-0.8222113, 1.722455, -0.5684915, 0.7058824, 1, 0, 1,
-0.8210541, 0.1442004, -1.357598, 0.6980392, 1, 0, 1,
-0.8170224, 0.16992, -0.4121328, 0.6901961, 1, 0, 1,
-0.8157876, -0.2241399, -3.037705, 0.6862745, 1, 0, 1,
-0.8088242, 0.5758411, -0.2668708, 0.6784314, 1, 0, 1,
-0.8087025, -1.166718, -3.571239, 0.6745098, 1, 0, 1,
-0.807489, -0.3556947, -1.051541, 0.6666667, 1, 0, 1,
-0.8043249, 0.5649433, 1.236122, 0.6627451, 1, 0, 1,
-0.8038586, 0.1518484, -0.6473509, 0.654902, 1, 0, 1,
-0.8005215, -0.8685803, -2.987187, 0.6509804, 1, 0, 1,
-0.7967986, -0.01450309, -1.809631, 0.6431373, 1, 0, 1,
-0.7934466, 0.2889306, -0.8700339, 0.6392157, 1, 0, 1,
-0.7877069, -0.9810249, -2.419501, 0.6313726, 1, 0, 1,
-0.7870168, -1.198381, -0.9306033, 0.627451, 1, 0, 1,
-0.7818969, 0.5112717, -0.2430695, 0.6196079, 1, 0, 1,
-0.7761116, -0.01848441, 0.08890129, 0.6156863, 1, 0, 1,
-0.7751058, 0.7322989, 0.1711504, 0.6078432, 1, 0, 1,
-0.7685034, 0.4202041, -0.6107309, 0.6039216, 1, 0, 1,
-0.7660258, 0.6410245, -1.231655, 0.5960785, 1, 0, 1,
-0.7647828, -0.2554934, -0.6640453, 0.5882353, 1, 0, 1,
-0.7637208, 1.02149, 0.08616842, 0.5843138, 1, 0, 1,
-0.7594939, 1.532631, -1.076897, 0.5764706, 1, 0, 1,
-0.7518786, -0.6674015, -3.138359, 0.572549, 1, 0, 1,
-0.7428271, 0.4800095, -0.6017206, 0.5647059, 1, 0, 1,
-0.7426003, 0.9463769, 0.01515363, 0.5607843, 1, 0, 1,
-0.7392488, -1.565919, -2.505789, 0.5529412, 1, 0, 1,
-0.7350308, 1.564879, -0.1544235, 0.5490196, 1, 0, 1,
-0.7292694, 1.627984, -0.5711807, 0.5411765, 1, 0, 1,
-0.715353, 0.2717266, -1.98999, 0.5372549, 1, 0, 1,
-0.7131498, -0.1688983, -0.1772961, 0.5294118, 1, 0, 1,
-0.7064365, 0.1872558, -1.213566, 0.5254902, 1, 0, 1,
-0.706082, -1.979734, -2.122983, 0.5176471, 1, 0, 1,
-0.7002376, 0.7685231, 0.09586007, 0.5137255, 1, 0, 1,
-0.6940043, 0.01838449, -1.902314, 0.5058824, 1, 0, 1,
-0.6937813, 0.4411141, -1.872371, 0.5019608, 1, 0, 1,
-0.6914716, 1.050661, -1.231999, 0.4941176, 1, 0, 1,
-0.6907076, 0.03395194, -0.8440742, 0.4862745, 1, 0, 1,
-0.6899498, 1.651555, -0.2781838, 0.4823529, 1, 0, 1,
-0.6893041, 0.7240381, -0.08406339, 0.4745098, 1, 0, 1,
-0.6868923, -0.8433743, -3.929265, 0.4705882, 1, 0, 1,
-0.6868499, -0.4089611, -3.107029, 0.4627451, 1, 0, 1,
-0.6799861, -0.2932837, -1.550239, 0.4588235, 1, 0, 1,
-0.6783926, 0.936103, -0.5511923, 0.4509804, 1, 0, 1,
-0.6754324, 0.2756598, -0.4880005, 0.4470588, 1, 0, 1,
-0.6741673, 1.728058, 0.7285194, 0.4392157, 1, 0, 1,
-0.668202, -0.2051534, -1.647358, 0.4352941, 1, 0, 1,
-0.6681126, 0.02997573, -1.383879, 0.427451, 1, 0, 1,
-0.6663381, 0.846402, -0.8838248, 0.4235294, 1, 0, 1,
-0.6658393, 0.6427839, 1.055915, 0.4156863, 1, 0, 1,
-0.6610212, 0.8740694, 0.3295258, 0.4117647, 1, 0, 1,
-0.6584608, -0.1382633, -1.807173, 0.4039216, 1, 0, 1,
-0.6561409, -0.8443953, -1.45901, 0.3960784, 1, 0, 1,
-0.6545896, -1.048365, -3.967386, 0.3921569, 1, 0, 1,
-0.6319602, 0.1190763, 0.09752022, 0.3843137, 1, 0, 1,
-0.6261509, -1.066612, -1.163512, 0.3803922, 1, 0, 1,
-0.6210012, 0.2590407, -0.1179531, 0.372549, 1, 0, 1,
-0.6180497, 0.09177737, -1.532172, 0.3686275, 1, 0, 1,
-0.6166315, -0.7622405, -0.5362881, 0.3607843, 1, 0, 1,
-0.6132, 0.4607967, 0.5615559, 0.3568628, 1, 0, 1,
-0.611283, 0.3687319, -1.633488, 0.3490196, 1, 0, 1,
-0.6044895, -0.9788153, -2.738815, 0.345098, 1, 0, 1,
-0.6037666, 2.412511, 0.428845, 0.3372549, 1, 0, 1,
-0.598926, 1.130394, -2.257965, 0.3333333, 1, 0, 1,
-0.5966994, 0.4585977, -0.7642621, 0.3254902, 1, 0, 1,
-0.5939387, -0.1996807, -2.437697, 0.3215686, 1, 0, 1,
-0.5925233, -0.3021279, -2.377327, 0.3137255, 1, 0, 1,
-0.5905944, -0.5122685, -2.871907, 0.3098039, 1, 0, 1,
-0.58246, 1.833837, 0.6753242, 0.3019608, 1, 0, 1,
-0.5804271, 0.1966055, -0.621718, 0.2941177, 1, 0, 1,
-0.5798241, 0.8836254, -0.4334684, 0.2901961, 1, 0, 1,
-0.5763395, -1.05727, -3.671298, 0.282353, 1, 0, 1,
-0.573748, 0.0638295, -0.9524014, 0.2784314, 1, 0, 1,
-0.5735517, 1.828735, -0.6879812, 0.2705882, 1, 0, 1,
-0.5724132, -0.2709827, -1.822477, 0.2666667, 1, 0, 1,
-0.5695314, -0.357426, -1.059073, 0.2588235, 1, 0, 1,
-0.5604909, 1.790859, 0.04381651, 0.254902, 1, 0, 1,
-0.5593077, 1.259843, -0.9266477, 0.2470588, 1, 0, 1,
-0.5577226, -1.0154, -2.876657, 0.2431373, 1, 0, 1,
-0.5558906, 0.05016173, -2.944306, 0.2352941, 1, 0, 1,
-0.5558089, 0.4469904, 0.9285043, 0.2313726, 1, 0, 1,
-0.5431719, 0.7053914, 0.1228768, 0.2235294, 1, 0, 1,
-0.5283816, -0.06161035, -1.289587, 0.2196078, 1, 0, 1,
-0.5276477, 1.652635, -2.025604, 0.2117647, 1, 0, 1,
-0.5245315, -0.5004795, -1.634349, 0.2078431, 1, 0, 1,
-0.5224032, -1.635224, -3.434891, 0.2, 1, 0, 1,
-0.5198435, -0.2720591, -2.069942, 0.1921569, 1, 0, 1,
-0.5171185, 2.298181, -0.01023827, 0.1882353, 1, 0, 1,
-0.5169157, -1.531911, -3.154843, 0.1803922, 1, 0, 1,
-0.5167289, -0.4058075, -0.9860887, 0.1764706, 1, 0, 1,
-0.5159785, -0.5182676, -3.345022, 0.1686275, 1, 0, 1,
-0.5148543, -0.3444449, -1.851291, 0.1647059, 1, 0, 1,
-0.5141864, -1.687454, -1.750522, 0.1568628, 1, 0, 1,
-0.5126336, -0.031434, -2.1871, 0.1529412, 1, 0, 1,
-0.509778, -1.0582, -4.47659, 0.145098, 1, 0, 1,
-0.5048161, -0.6204948, -2.239624, 0.1411765, 1, 0, 1,
-0.5037594, -0.2200354, -3.129104, 0.1333333, 1, 0, 1,
-0.5014467, -0.1789847, -2.648397, 0.1294118, 1, 0, 1,
-0.4977164, -1.923671, -2.553496, 0.1215686, 1, 0, 1,
-0.4951547, -0.2971699, -1.130216, 0.1176471, 1, 0, 1,
-0.4941461, -0.3531692, -1.296741, 0.1098039, 1, 0, 1,
-0.4936517, 0.9632336, -2.481864, 0.1058824, 1, 0, 1,
-0.4910513, 1.198128, -0.5603886, 0.09803922, 1, 0, 1,
-0.4834608, -0.6662467, -2.253681, 0.09019608, 1, 0, 1,
-0.4786012, 0.579417, -2.373748, 0.08627451, 1, 0, 1,
-0.4781921, -3.005889, -4.506775, 0.07843138, 1, 0, 1,
-0.4739752, -0.01205507, -1.171015, 0.07450981, 1, 0, 1,
-0.4704387, 0.2596588, -0.2876638, 0.06666667, 1, 0, 1,
-0.4699884, 1.226897, -0.3039459, 0.0627451, 1, 0, 1,
-0.4633696, 0.3492355, -1.10943, 0.05490196, 1, 0, 1,
-0.4630573, 0.1632475, -1.756253, 0.05098039, 1, 0, 1,
-0.4609254, 0.6587821, -0.6414056, 0.04313726, 1, 0, 1,
-0.4597605, 1.399428, 0.9075271, 0.03921569, 1, 0, 1,
-0.4556706, -0.3853679, -0.04485848, 0.03137255, 1, 0, 1,
-0.4498523, 0.5348493, 0.619451, 0.02745098, 1, 0, 1,
-0.445228, 0.215987, -0.6338943, 0.01960784, 1, 0, 1,
-0.4433368, -0.4972552, -1.861053, 0.01568628, 1, 0, 1,
-0.4315659, -0.7779231, -3.843642, 0.007843138, 1, 0, 1,
-0.4259703, 0.1751776, -0.2206423, 0.003921569, 1, 0, 1,
-0.4199925, -0.5102304, -1.762265, 0, 1, 0.003921569, 1,
-0.4199354, 1.408851, -0.2447647, 0, 1, 0.01176471, 1,
-0.417848, -1.597955, -2.275145, 0, 1, 0.01568628, 1,
-0.4158171, 1.218335, -1.93865, 0, 1, 0.02352941, 1,
-0.4145814, 1.910686, -0.9489188, 0, 1, 0.02745098, 1,
-0.408075, -0.1308434, -1.355841, 0, 1, 0.03529412, 1,
-0.3992478, -0.8645806, -2.854465, 0, 1, 0.03921569, 1,
-0.394856, 1.396953, 1.770429, 0, 1, 0.04705882, 1,
-0.3943847, -0.02186707, -0.8519259, 0, 1, 0.05098039, 1,
-0.3943429, -1.055003, -3.287789, 0, 1, 0.05882353, 1,
-0.3937394, 1.29689, 0.969547, 0, 1, 0.0627451, 1,
-0.3888269, -0.4999428, -3.663331, 0, 1, 0.07058824, 1,
-0.3880709, -0.4310395, -0.5127736, 0, 1, 0.07450981, 1,
-0.3874914, 0.7719216, 1.069083, 0, 1, 0.08235294, 1,
-0.3865612, -0.2967792, -0.8370055, 0, 1, 0.08627451, 1,
-0.384261, -0.2276718, -1.868759, 0, 1, 0.09411765, 1,
-0.3806263, 1.435912, 0.7960497, 0, 1, 0.1019608, 1,
-0.3734105, 0.5215385, 0.6453486, 0, 1, 0.1058824, 1,
-0.3733805, 0.4186227, -0.4075411, 0, 1, 0.1137255, 1,
-0.3708833, -2.161061, -3.464951, 0, 1, 0.1176471, 1,
-0.3704832, 1.098245, -0.06676511, 0, 1, 0.1254902, 1,
-0.3699071, -0.8013257, -3.24693, 0, 1, 0.1294118, 1,
-0.3650397, -0.1963673, -0.919845, 0, 1, 0.1372549, 1,
-0.3644884, -0.8517168, -2.342249, 0, 1, 0.1411765, 1,
-0.3612631, 0.610133, -1.64533, 0, 1, 0.1490196, 1,
-0.3607358, -0.2805701, -0.1646481, 0, 1, 0.1529412, 1,
-0.3561393, -0.6485893, -1.087331, 0, 1, 0.1607843, 1,
-0.3471187, -0.8138386, -2.582002, 0, 1, 0.1647059, 1,
-0.3469262, 0.3518565, -0.5349194, 0, 1, 0.172549, 1,
-0.3457803, -0.1295146, -0.4517497, 0, 1, 0.1764706, 1,
-0.3445569, 0.9351198, -0.7060229, 0, 1, 0.1843137, 1,
-0.3427654, -0.2491453, -2.776148, 0, 1, 0.1882353, 1,
-0.3418285, 1.617129, 0.4205396, 0, 1, 0.1960784, 1,
-0.3411178, 1.221604, -0.9039575, 0, 1, 0.2039216, 1,
-0.3395163, -1.018703, -2.953166, 0, 1, 0.2078431, 1,
-0.3348219, -1.627198, -2.870402, 0, 1, 0.2156863, 1,
-0.3335667, 0.07440797, -0.561588, 0, 1, 0.2196078, 1,
-0.3263601, 1.109545, -1.091421, 0, 1, 0.227451, 1,
-0.3228177, -0.7690674, -1.758151, 0, 1, 0.2313726, 1,
-0.3221141, 0.09512424, -1.540356, 0, 1, 0.2392157, 1,
-0.3207754, -1.181661, -4.713817, 0, 1, 0.2431373, 1,
-0.3183298, 2.582218, 0.5527268, 0, 1, 0.2509804, 1,
-0.3163116, 0.1012241, -1.37976, 0, 1, 0.254902, 1,
-0.3160806, -0.496685, -2.168538, 0, 1, 0.2627451, 1,
-0.3132123, -0.3416964, -2.545855, 0, 1, 0.2666667, 1,
-0.3089735, -0.5808477, -2.399378, 0, 1, 0.2745098, 1,
-0.3084263, -0.1686717, -2.435367, 0, 1, 0.2784314, 1,
-0.307092, -0.02616433, -1.278269, 0, 1, 0.2862745, 1,
-0.3056729, 0.2883989, -1.449746, 0, 1, 0.2901961, 1,
-0.3044949, -1.608334, -2.006904, 0, 1, 0.2980392, 1,
-0.3043844, 0.1519336, -2.156544, 0, 1, 0.3058824, 1,
-0.3042059, -1.880843, -4.316152, 0, 1, 0.3098039, 1,
-0.3038561, -1.76827, -3.184245, 0, 1, 0.3176471, 1,
-0.3030076, 0.2481745, -0.82258, 0, 1, 0.3215686, 1,
-0.2993902, 1.22753, 0.2754639, 0, 1, 0.3294118, 1,
-0.2991312, -0.3133712, -3.44887, 0, 1, 0.3333333, 1,
-0.2980677, -0.3315187, -3.207093, 0, 1, 0.3411765, 1,
-0.2963432, -0.1916435, -1.979165, 0, 1, 0.345098, 1,
-0.2934885, -0.6335488, -2.544082, 0, 1, 0.3529412, 1,
-0.2928427, -1.252649, -2.307125, 0, 1, 0.3568628, 1,
-0.2883123, 1.268914, -0.4395201, 0, 1, 0.3647059, 1,
-0.2880581, -0.4426276, -2.427486, 0, 1, 0.3686275, 1,
-0.2786781, -0.4749773, -2.444616, 0, 1, 0.3764706, 1,
-0.2781824, -1.183091, -1.855271, 0, 1, 0.3803922, 1,
-0.2747074, -0.5466732, -1.739652, 0, 1, 0.3882353, 1,
-0.2725361, -0.07163826, -2.509279, 0, 1, 0.3921569, 1,
-0.2704586, 1.742742, 0.6633555, 0, 1, 0.4, 1,
-0.2686097, -0.5339732, -1.832254, 0, 1, 0.4078431, 1,
-0.2644568, -0.3579558, -3.068222, 0, 1, 0.4117647, 1,
-0.2565977, 1.353507, -1.804872, 0, 1, 0.4196078, 1,
-0.2536376, -0.120445, -1.598339, 0, 1, 0.4235294, 1,
-0.2519009, -0.5660249, -2.15003, 0, 1, 0.4313726, 1,
-0.2507259, -1.308778, -3.755458, 0, 1, 0.4352941, 1,
-0.2483284, 1.519687, 1.579872, 0, 1, 0.4431373, 1,
-0.2476381, 1.875901, 0.6038926, 0, 1, 0.4470588, 1,
-0.2410909, -0.9497783, -2.696275, 0, 1, 0.454902, 1,
-0.2373877, -1.314299, -3.591728, 0, 1, 0.4588235, 1,
-0.2372593, 1.742649, -0.9171966, 0, 1, 0.4666667, 1,
-0.2361586, -0.4573837, -1.634113, 0, 1, 0.4705882, 1,
-0.2354144, -0.9549196, -4.332885, 0, 1, 0.4784314, 1,
-0.2313681, -0.2927762, -4.067119, 0, 1, 0.4823529, 1,
-0.2298316, 0.5825672, -0.1582445, 0, 1, 0.4901961, 1,
-0.2296674, -0.1118718, -1.98939, 0, 1, 0.4941176, 1,
-0.2252661, -1.782616, -3.549542, 0, 1, 0.5019608, 1,
-0.2233053, -1.323613, -2.772354, 0, 1, 0.509804, 1,
-0.221371, 0.07467343, -0.1698622, 0, 1, 0.5137255, 1,
-0.2160892, -0.1919468, -3.515209, 0, 1, 0.5215687, 1,
-0.213006, 0.9109027, -2.224491, 0, 1, 0.5254902, 1,
-0.2019609, 1.169457, 0.2146561, 0, 1, 0.5333334, 1,
-0.2005133, -1.135631, -2.160895, 0, 1, 0.5372549, 1,
-0.2000305, 0.762675, -1.092102, 0, 1, 0.5450981, 1,
-0.1998873, 1.804687, 0.03984885, 0, 1, 0.5490196, 1,
-0.1966862, -0.3483579, -3.562815, 0, 1, 0.5568628, 1,
-0.1936091, -0.5924618, -2.376597, 0, 1, 0.5607843, 1,
-0.1926871, 0.3467496, -1.941211, 0, 1, 0.5686275, 1,
-0.1867398, 1.408031, 2.933855, 0, 1, 0.572549, 1,
-0.185974, -0.6826393, -3.089579, 0, 1, 0.5803922, 1,
-0.1830554, -0.6259187, -3.261528, 0, 1, 0.5843138, 1,
-0.1819657, 2.646188, 0.1810998, 0, 1, 0.5921569, 1,
-0.1819232, 0.3258144, -1.373991, 0, 1, 0.5960785, 1,
-0.1818738, -0.5174834, -2.745015, 0, 1, 0.6039216, 1,
-0.1785961, 1.096656, 0.8546668, 0, 1, 0.6117647, 1,
-0.1711963, -1.020317, -1.76105, 0, 1, 0.6156863, 1,
-0.1687347, 1.069424, 0.2418558, 0, 1, 0.6235294, 1,
-0.1624586, -0.3463225, -2.42503, 0, 1, 0.627451, 1,
-0.1567295, -0.06118319, -1.366594, 0, 1, 0.6352941, 1,
-0.1556179, 1.425563, 0.3342745, 0, 1, 0.6392157, 1,
-0.1554718, -1.338137, -0.7403975, 0, 1, 0.6470588, 1,
-0.1550798, -1.037797, -4.662208, 0, 1, 0.6509804, 1,
-0.153618, 0.7048176, 0.3862091, 0, 1, 0.6588235, 1,
-0.1528905, 0.2920142, -1.398147, 0, 1, 0.6627451, 1,
-0.1497868, 0.572953, 1.413796, 0, 1, 0.6705883, 1,
-0.1468298, 0.1753561, -0.5985068, 0, 1, 0.6745098, 1,
-0.1427091, -0.5071213, -3.169399, 0, 1, 0.682353, 1,
-0.1420324, 0.07743402, -3.273377, 0, 1, 0.6862745, 1,
-0.1391381, 0.06886602, -1.041015, 0, 1, 0.6941177, 1,
-0.1366933, -0.2022648, -5.956615, 0, 1, 0.7019608, 1,
-0.1259261, -0.6018607, -2.445771, 0, 1, 0.7058824, 1,
-0.1256922, -1.36705, -0.973095, 0, 1, 0.7137255, 1,
-0.1251386, -1.58037, -2.930555, 0, 1, 0.7176471, 1,
-0.1237525, -0.04224155, -2.960863, 0, 1, 0.7254902, 1,
-0.1234354, -0.2337319, -1.023783, 0, 1, 0.7294118, 1,
-0.1214516, 0.8527111, 1.111343, 0, 1, 0.7372549, 1,
-0.1211287, 0.8330565, 0.5435883, 0, 1, 0.7411765, 1,
-0.1175385, 0.4055504, -0.603651, 0, 1, 0.7490196, 1,
-0.1167692, -0.8370666, -1.783624, 0, 1, 0.7529412, 1,
-0.1143466, 1.503436, 0.3148027, 0, 1, 0.7607843, 1,
-0.1131825, -0.2647146, -1.900484, 0, 1, 0.7647059, 1,
-0.1130998, 1.060724, -1.627808, 0, 1, 0.772549, 1,
-0.1044711, -1.314814, -2.043985, 0, 1, 0.7764706, 1,
-0.1022032, 0.006755089, -1.011194, 0, 1, 0.7843137, 1,
-0.101963, -0.7335534, -0.6300653, 0, 1, 0.7882353, 1,
-0.1009547, 0.4451517, -0.8230407, 0, 1, 0.7960784, 1,
-0.09884505, 0.7619749, -0.8783569, 0, 1, 0.8039216, 1,
-0.09677794, 1.942599, -0.1310606, 0, 1, 0.8078431, 1,
-0.09626848, 0.6451449, -0.1156979, 0, 1, 0.8156863, 1,
-0.08736072, 0.5097646, -0.481583, 0, 1, 0.8196079, 1,
-0.08600818, 0.4521441, -2.167447, 0, 1, 0.827451, 1,
-0.08488341, -2.616203, -2.0195, 0, 1, 0.8313726, 1,
-0.08273653, 0.1643628, -1.646229, 0, 1, 0.8392157, 1,
-0.07977063, 0.3141833, 0.3783237, 0, 1, 0.8431373, 1,
-0.07785974, -0.09242039, -2.296995, 0, 1, 0.8509804, 1,
-0.07469548, 0.8317872, 0.5783508, 0, 1, 0.854902, 1,
-0.07331569, -0.5518712, -3.439386, 0, 1, 0.8627451, 1,
-0.06801034, -0.8180453, -4.322626, 0, 1, 0.8666667, 1,
-0.06208295, -0.3421799, -2.742342, 0, 1, 0.8745098, 1,
-0.05676939, 0.01797692, -1.067683, 0, 1, 0.8784314, 1,
-0.05604888, -2.714202, -1.684332, 0, 1, 0.8862745, 1,
-0.05533399, 0.6233329, 1.251556, 0, 1, 0.8901961, 1,
-0.05435225, 0.9049555, 1.914877, 0, 1, 0.8980392, 1,
-0.05433289, -0.2610577, -4.320186, 0, 1, 0.9058824, 1,
-0.05025757, -0.3161305, -1.963261, 0, 1, 0.9098039, 1,
-0.05007779, -0.6052927, -3.904855, 0, 1, 0.9176471, 1,
-0.04973314, 0.7921838, 0.2233212, 0, 1, 0.9215686, 1,
-0.04927433, 1.004341, 1.322803, 0, 1, 0.9294118, 1,
-0.04686541, 0.08326773, -0.4074239, 0, 1, 0.9333333, 1,
-0.04653315, 1.065457, 0.5074259, 0, 1, 0.9411765, 1,
-0.04597748, 0.9950724, -0.7225891, 0, 1, 0.945098, 1,
-0.0449301, 0.4426739, -2.016938, 0, 1, 0.9529412, 1,
-0.04474829, 0.5862092, 0.4066385, 0, 1, 0.9568627, 1,
-0.04107519, 0.1060461, -1.721635, 0, 1, 0.9647059, 1,
-0.04065363, -1.602224, -4.204018, 0, 1, 0.9686275, 1,
-0.02862327, -1.379339, -3.016188, 0, 1, 0.9764706, 1,
-0.02362542, -1.32703, -2.635046, 0, 1, 0.9803922, 1,
-0.02176692, -0.4469641, -1.051008, 0, 1, 0.9882353, 1,
-0.01689253, -0.6289677, -4.059408, 0, 1, 0.9921569, 1,
-0.01451665, 0.4692474, 0.877142, 0, 1, 1, 1,
-0.01242387, 0.7271933, -0.2032952, 0, 0.9921569, 1, 1,
-0.01234155, -0.3014755, -0.6445292, 0, 0.9882353, 1, 1,
-0.01234098, 0.04310914, -1.410239, 0, 0.9803922, 1, 1,
-0.01035801, -0.1249815, -3.393434, 0, 0.9764706, 1, 1,
-0.007486114, 1.35388, -1.089926, 0, 0.9686275, 1, 1,
-0.006951561, 0.2921762, 0.09143196, 0, 0.9647059, 1, 1,
-0.003577961, 0.602646, -0.6787435, 0, 0.9568627, 1, 1,
-0.003040136, 0.2143767, 0.7079768, 0, 0.9529412, 1, 1,
-0.002476363, -0.3515056, -4.313, 0, 0.945098, 1, 1,
0.00125429, -0.1474328, 2.914735, 0, 0.9411765, 1, 1,
0.006526157, -0.992321, 3.13382, 0, 0.9333333, 1, 1,
0.01081712, 0.7003513, -0.7515002, 0, 0.9294118, 1, 1,
0.01087556, 0.6435149, -0.888804, 0, 0.9215686, 1, 1,
0.01112041, 1.774791, 1.887112, 0, 0.9176471, 1, 1,
0.01252184, 1.577056, -0.242586, 0, 0.9098039, 1, 1,
0.01479935, -0.2170316, 2.914329, 0, 0.9058824, 1, 1,
0.01492042, 0.1228906, 1.040405, 0, 0.8980392, 1, 1,
0.01840862, 0.7962407, 0.899581, 0, 0.8901961, 1, 1,
0.01930016, 1.026898, -1.196685, 0, 0.8862745, 1, 1,
0.01937885, -0.7883199, 2.818389, 0, 0.8784314, 1, 1,
0.0285938, -0.6598572, 2.714839, 0, 0.8745098, 1, 1,
0.02983401, -0.02529012, 1.201397, 0, 0.8666667, 1, 1,
0.0332161, -0.5913837, 3.605626, 0, 0.8627451, 1, 1,
0.03429437, 1.239769, 2.27366, 0, 0.854902, 1, 1,
0.03748081, 0.736652, -0.3649686, 0, 0.8509804, 1, 1,
0.04066287, 0.6287112, 0.4185301, 0, 0.8431373, 1, 1,
0.05042705, 0.5391183, 0.183492, 0, 0.8392157, 1, 1,
0.05105577, -0.01257586, 0.9459775, 0, 0.8313726, 1, 1,
0.05182399, -0.5478162, 4.882345, 0, 0.827451, 1, 1,
0.05261975, -0.8096928, 1.349631, 0, 0.8196079, 1, 1,
0.05343004, -0.3658943, 2.984159, 0, 0.8156863, 1, 1,
0.0537664, 1.700149, -0.05075903, 0, 0.8078431, 1, 1,
0.06862876, 0.7313038, 1.341141, 0, 0.8039216, 1, 1,
0.07183551, -0.5326267, 0.06483047, 0, 0.7960784, 1, 1,
0.07383873, 1.540375, -0.8266637, 0, 0.7882353, 1, 1,
0.07413544, -0.5747035, 2.305264, 0, 0.7843137, 1, 1,
0.07414158, -2.100087, 5.654062, 0, 0.7764706, 1, 1,
0.07575, -0.6428466, 2.565432, 0, 0.772549, 1, 1,
0.07585736, 0.8284755, 0.09794154, 0, 0.7647059, 1, 1,
0.08039033, -0.8721459, 4.175837, 0, 0.7607843, 1, 1,
0.08082123, 1.432551, 0.2533797, 0, 0.7529412, 1, 1,
0.08271691, 1.142995, 1.039255, 0, 0.7490196, 1, 1,
0.0852921, -0.2279876, 2.67897, 0, 0.7411765, 1, 1,
0.08671069, 0.3142478, 1.815951, 0, 0.7372549, 1, 1,
0.08903238, -0.3991221, 2.419464, 0, 0.7294118, 1, 1,
0.09581301, -1.280964, 2.141849, 0, 0.7254902, 1, 1,
0.09739409, -0.5165492, 3.454559, 0, 0.7176471, 1, 1,
0.1043929, 1.756928, 0.2748854, 0, 0.7137255, 1, 1,
0.1062089, 1.286759, 1.499241, 0, 0.7058824, 1, 1,
0.1083963, -0.807953, 2.708493, 0, 0.6980392, 1, 1,
0.1089609, 0.7820596, 2.694907, 0, 0.6941177, 1, 1,
0.1097002, -1.026063, 2.458803, 0, 0.6862745, 1, 1,
0.1128782, -1.705093, 1.488321, 0, 0.682353, 1, 1,
0.1156137, -0.7944614, 1.859044, 0, 0.6745098, 1, 1,
0.1166917, -1.971564, 2.311999, 0, 0.6705883, 1, 1,
0.1190216, 0.2130271, 1.221106, 0, 0.6627451, 1, 1,
0.1219678, -2.451998, 1.712706, 0, 0.6588235, 1, 1,
0.1235153, -3.994643, 3.43617, 0, 0.6509804, 1, 1,
0.1269573, 1.297515, 0.1689978, 0, 0.6470588, 1, 1,
0.1276762, 1.425507, -2.755547, 0, 0.6392157, 1, 1,
0.129658, -0.07569756, 2.749648, 0, 0.6352941, 1, 1,
0.1408643, 1.583299, -0.4326795, 0, 0.627451, 1, 1,
0.1415997, 0.1251121, 0.3235948, 0, 0.6235294, 1, 1,
0.1421816, -1.287753, 3.607057, 0, 0.6156863, 1, 1,
0.1423535, -1.338629, 3.015568, 0, 0.6117647, 1, 1,
0.1429574, 0.7033774, 0.4884053, 0, 0.6039216, 1, 1,
0.1501727, 0.4100908, -0.08619069, 0, 0.5960785, 1, 1,
0.1532366, -0.4214061, 3.757202, 0, 0.5921569, 1, 1,
0.1533834, -0.4683691, 1.761868, 0, 0.5843138, 1, 1,
0.1545468, 0.9676253, 1.624611, 0, 0.5803922, 1, 1,
0.1588898, 1.32494, -0.6578841, 0, 0.572549, 1, 1,
0.1596767, 1.146626, 1.547977, 0, 0.5686275, 1, 1,
0.1618629, -1.768963, 2.626805, 0, 0.5607843, 1, 1,
0.1675301, -1.638722, 3.7364, 0, 0.5568628, 1, 1,
0.1685018, -0.4133493, 2.346109, 0, 0.5490196, 1, 1,
0.1692513, 0.6657945, 1.390437, 0, 0.5450981, 1, 1,
0.169283, -1.513932, 4.83072, 0, 0.5372549, 1, 1,
0.1706713, -0.2339596, 3.314954, 0, 0.5333334, 1, 1,
0.1747172, -0.01018158, 3.4028, 0, 0.5254902, 1, 1,
0.1753615, -0.5635365, 2.852885, 0, 0.5215687, 1, 1,
0.1756613, -0.01243031, 2.55541, 0, 0.5137255, 1, 1,
0.1757388, -1.368798, 4.397397, 0, 0.509804, 1, 1,
0.1762269, -0.2004361, 2.02508, 0, 0.5019608, 1, 1,
0.1838624, -0.2158458, 0.8916534, 0, 0.4941176, 1, 1,
0.1841528, 0.4711223, 0.2474623, 0, 0.4901961, 1, 1,
0.184748, -0.1689334, 2.148048, 0, 0.4823529, 1, 1,
0.1851433, -0.2232874, 1.758928, 0, 0.4784314, 1, 1,
0.1891636, 0.5116776, 0.5179472, 0, 0.4705882, 1, 1,
0.195701, 1.64238, -1.087847, 0, 0.4666667, 1, 1,
0.1959687, -0.5051403, 3.123942, 0, 0.4588235, 1, 1,
0.1959791, 0.426214, 1.540249, 0, 0.454902, 1, 1,
0.1979509, 0.8662098, 0.1176294, 0, 0.4470588, 1, 1,
0.1987152, -0.4484909, 2.062944, 0, 0.4431373, 1, 1,
0.1998251, -1.549825, 2.911155, 0, 0.4352941, 1, 1,
0.202343, -0.1078394, 1.724028, 0, 0.4313726, 1, 1,
0.2031157, -0.1001184, 1.533398, 0, 0.4235294, 1, 1,
0.203558, -0.6689731, 1.611574, 0, 0.4196078, 1, 1,
0.2116287, -1.023353, 2.057663, 0, 0.4117647, 1, 1,
0.2120363, -1.694127, 2.492104, 0, 0.4078431, 1, 1,
0.2153211, -0.1943393, 1.547561, 0, 0.4, 1, 1,
0.2156269, 0.8477511, 0.1283721, 0, 0.3921569, 1, 1,
0.2181013, -0.7574642, 2.331389, 0, 0.3882353, 1, 1,
0.2210437, -0.4332785, 4.377597, 0, 0.3803922, 1, 1,
0.2261394, -0.1625875, 3.574486, 0, 0.3764706, 1, 1,
0.2328281, 1.481766, 1.093488, 0, 0.3686275, 1, 1,
0.2381643, 0.1452791, 0.675472, 0, 0.3647059, 1, 1,
0.2387252, -0.04562436, 0.6130765, 0, 0.3568628, 1, 1,
0.2410009, 0.5810375, 0.1349175, 0, 0.3529412, 1, 1,
0.2436254, -1.055311, 1.494927, 0, 0.345098, 1, 1,
0.245682, -0.423837, 0.9619747, 0, 0.3411765, 1, 1,
0.2490416, -1.10319, 2.849045, 0, 0.3333333, 1, 1,
0.2530987, 0.6766143, -2.008155, 0, 0.3294118, 1, 1,
0.2536469, -0.8815608, 2.075923, 0, 0.3215686, 1, 1,
0.2537054, -0.4096245, 2.703184, 0, 0.3176471, 1, 1,
0.2538025, -0.213363, 1.811441, 0, 0.3098039, 1, 1,
0.2544271, -1.622781, 2.463415, 0, 0.3058824, 1, 1,
0.2556962, 2.423983, 0.1471975, 0, 0.2980392, 1, 1,
0.2563078, -0.8525054, 3.164256, 0, 0.2901961, 1, 1,
0.2597461, -0.9243878, 2.924554, 0, 0.2862745, 1, 1,
0.2706773, 1.119052, 1.73623, 0, 0.2784314, 1, 1,
0.2780028, -0.3027272, 4.157976, 0, 0.2745098, 1, 1,
0.2795542, 1.237287, 0.3110544, 0, 0.2666667, 1, 1,
0.2880754, -1.315187, 4.67671, 0, 0.2627451, 1, 1,
0.2902453, -0.5523952, 3.810579, 0, 0.254902, 1, 1,
0.2923211, 0.01806056, 1.390044, 0, 0.2509804, 1, 1,
0.3010758, -1.112079, 2.679713, 0, 0.2431373, 1, 1,
0.3032321, -0.4809231, 2.468643, 0, 0.2392157, 1, 1,
0.3056774, -0.8047282, 3.527305, 0, 0.2313726, 1, 1,
0.3067543, 1.815529, 0.8535148, 0, 0.227451, 1, 1,
0.3071277, 0.4969377, -0.5206729, 0, 0.2196078, 1, 1,
0.3072774, -0.7851542, 2.881681, 0, 0.2156863, 1, 1,
0.307444, 0.2430056, 1.65261, 0, 0.2078431, 1, 1,
0.3096147, 1.308223, -0.1562207, 0, 0.2039216, 1, 1,
0.3163387, -0.42957, 4.040172, 0, 0.1960784, 1, 1,
0.3179091, 0.03036026, 1.51933, 0, 0.1882353, 1, 1,
0.318081, 0.7320299, 0.9722056, 0, 0.1843137, 1, 1,
0.3268093, -1.644535, 3.140709, 0, 0.1764706, 1, 1,
0.3311194, -0.05585273, 3.006754, 0, 0.172549, 1, 1,
0.3369791, 0.3726497, -0.07225946, 0, 0.1647059, 1, 1,
0.3509338, -0.6775309, 2.202311, 0, 0.1607843, 1, 1,
0.3524431, -0.1352239, 1.485393, 0, 0.1529412, 1, 1,
0.3547083, 0.2932275, 1.475004, 0, 0.1490196, 1, 1,
0.3550512, -1.046351, 2.674278, 0, 0.1411765, 1, 1,
0.355729, -0.3430702, 2.758621, 0, 0.1372549, 1, 1,
0.3610545, 1.068911, 0.3566211, 0, 0.1294118, 1, 1,
0.36309, -1.618559, 2.921661, 0, 0.1254902, 1, 1,
0.3663719, -0.802182, 2.11082, 0, 0.1176471, 1, 1,
0.36887, 0.8300847, -0.5604219, 0, 0.1137255, 1, 1,
0.3755842, 0.9492733, -0.7981664, 0, 0.1058824, 1, 1,
0.3758116, -0.6625237, 3.690564, 0, 0.09803922, 1, 1,
0.37803, -0.1715367, 1.692369, 0, 0.09411765, 1, 1,
0.379707, -0.2198456, 2.304068, 0, 0.08627451, 1, 1,
0.3816803, 1.038708, 0.4663524, 0, 0.08235294, 1, 1,
0.3835356, -1.230983, 2.299704, 0, 0.07450981, 1, 1,
0.3849015, -0.9632989, 1.268089, 0, 0.07058824, 1, 1,
0.3878181, -0.9375136, 3.91729, 0, 0.0627451, 1, 1,
0.3897353, -0.9926447, 3.33244, 0, 0.05882353, 1, 1,
0.3907933, 0.02538057, 0.9946666, 0, 0.05098039, 1, 1,
0.3928718, 1.026982, 0.2858704, 0, 0.04705882, 1, 1,
0.3933374, -0.7361013, 0.5637684, 0, 0.03921569, 1, 1,
0.3991742, -0.3596889, 1.77391, 0, 0.03529412, 1, 1,
0.3998559, 1.349162, 0.7832178, 0, 0.02745098, 1, 1,
0.4028006, -0.9536595, 3.306533, 0, 0.02352941, 1, 1,
0.4043243, -0.5095552, 1.475139, 0, 0.01568628, 1, 1,
0.4047441, 0.7174401, 1.918363, 0, 0.01176471, 1, 1,
0.4057514, -0.3752936, 3.301835, 0, 0.003921569, 1, 1,
0.4058589, 1.865369, -0.3425603, 0.003921569, 0, 1, 1,
0.4065939, -0.5598262, 0.7450539, 0.007843138, 0, 1, 1,
0.4075116, -1.068204, 1.637349, 0.01568628, 0, 1, 1,
0.4117234, -2.190382, 4.686771, 0.01960784, 0, 1, 1,
0.4252006, 1.903811, 1.461765, 0.02745098, 0, 1, 1,
0.429519, 0.1535671, 0.3698047, 0.03137255, 0, 1, 1,
0.4342144, -0.01176901, 1.913441, 0.03921569, 0, 1, 1,
0.4351223, -2.603053, 2.828166, 0.04313726, 0, 1, 1,
0.4358423, 0.9461298, -0.1909844, 0.05098039, 0, 1, 1,
0.4358549, -1.401197, 4.490416, 0.05490196, 0, 1, 1,
0.4406212, 1.219398, 0.4591973, 0.0627451, 0, 1, 1,
0.4460582, -0.1152048, 1.682808, 0.06666667, 0, 1, 1,
0.4470104, 0.5277597, 0.07015982, 0.07450981, 0, 1, 1,
0.4479615, -0.2779821, 2.817119, 0.07843138, 0, 1, 1,
0.450395, -2.253203, 1.070342, 0.08627451, 0, 1, 1,
0.4514947, -1.20318, 2.693598, 0.09019608, 0, 1, 1,
0.455213, -0.2103656, 0.9558131, 0.09803922, 0, 1, 1,
0.4572582, 0.8060146, 0.6862851, 0.1058824, 0, 1, 1,
0.4587718, 0.5800033, 0.2406409, 0.1098039, 0, 1, 1,
0.4618121, 0.06295705, 2.227214, 0.1176471, 0, 1, 1,
0.4625247, -1.231274, 1.595218, 0.1215686, 0, 1, 1,
0.4626176, -0.3816773, 3.955425, 0.1294118, 0, 1, 1,
0.4632741, 0.08061289, 1.48627, 0.1333333, 0, 1, 1,
0.465749, -0.6823643, 3.355158, 0.1411765, 0, 1, 1,
0.4692518, -0.8635509, 3.695824, 0.145098, 0, 1, 1,
0.4729688, -1.916328, 3.420568, 0.1529412, 0, 1, 1,
0.4749093, 0.2559133, 3.270698, 0.1568628, 0, 1, 1,
0.4749942, 1.275628, -1.685885, 0.1647059, 0, 1, 1,
0.4823191, -0.7664042, 2.356062, 0.1686275, 0, 1, 1,
0.4850004, -0.1367549, 2.90601, 0.1764706, 0, 1, 1,
0.4854166, -0.4153711, 1.737464, 0.1803922, 0, 1, 1,
0.4861546, -0.887802, 2.246608, 0.1882353, 0, 1, 1,
0.4862467, 0.5764024, 3.297077, 0.1921569, 0, 1, 1,
0.4868042, -0.4570492, 2.814415, 0.2, 0, 1, 1,
0.4940233, 0.4186555, 1.633309, 0.2078431, 0, 1, 1,
0.4952559, -0.1308682, 2.285419, 0.2117647, 0, 1, 1,
0.496179, -0.07132123, 0.8079653, 0.2196078, 0, 1, 1,
0.4976489, -1.550613, 2.221706, 0.2235294, 0, 1, 1,
0.4991944, 0.4956371, 1.104322, 0.2313726, 0, 1, 1,
0.4995877, 0.6597505, 0.9393908, 0.2352941, 0, 1, 1,
0.5062538, 0.9445193, -0.8753334, 0.2431373, 0, 1, 1,
0.5158164, 0.3960359, 0.7337312, 0.2470588, 0, 1, 1,
0.5182097, -0.7728593, 2.178378, 0.254902, 0, 1, 1,
0.5228664, 0.4331381, 2.861779, 0.2588235, 0, 1, 1,
0.5273015, 0.8104668, -0.1663041, 0.2666667, 0, 1, 1,
0.5305313, 1.090032, 0.3796883, 0.2705882, 0, 1, 1,
0.5353638, -0.1510139, 1.334915, 0.2784314, 0, 1, 1,
0.5407653, 0.07691653, 2.170625, 0.282353, 0, 1, 1,
0.5440516, -0.5590378, 1.391696, 0.2901961, 0, 1, 1,
0.5441612, -0.08818032, 2.673093, 0.2941177, 0, 1, 1,
0.5444148, 0.2953112, 0.7349642, 0.3019608, 0, 1, 1,
0.5455713, 0.05457812, 2.14403, 0.3098039, 0, 1, 1,
0.5476812, -0.3076158, 0.6920508, 0.3137255, 0, 1, 1,
0.5509703, 0.04328353, 1.88976, 0.3215686, 0, 1, 1,
0.5544819, -0.1827034, 2.464539, 0.3254902, 0, 1, 1,
0.5620553, -1.515385, 1.09123, 0.3333333, 0, 1, 1,
0.5736576, 1.157187, 0.692265, 0.3372549, 0, 1, 1,
0.5774353, -1.330344, 1.479525, 0.345098, 0, 1, 1,
0.5796683, -0.3698347, 1.206198, 0.3490196, 0, 1, 1,
0.5892244, -1.401631, 1.99536, 0.3568628, 0, 1, 1,
0.5895745, -0.4313933, 0.9291999, 0.3607843, 0, 1, 1,
0.5908132, -0.6594557, 3.049003, 0.3686275, 0, 1, 1,
0.6070814, -0.9514754, 1.789989, 0.372549, 0, 1, 1,
0.6107142, 1.299388, 1.119419, 0.3803922, 0, 1, 1,
0.6114752, -0.2766952, 2.154344, 0.3843137, 0, 1, 1,
0.6162615, 1.672611, 1.535369, 0.3921569, 0, 1, 1,
0.6166037, -1.641363, 2.227892, 0.3960784, 0, 1, 1,
0.6171303, 0.3483668, 0.8483076, 0.4039216, 0, 1, 1,
0.6204313, 0.7849337, 1.412921, 0.4117647, 0, 1, 1,
0.6361403, -0.9759122, 1.522905, 0.4156863, 0, 1, 1,
0.6388602, 1.467024, 0.1733197, 0.4235294, 0, 1, 1,
0.6408448, 0.4441912, 1.800467, 0.427451, 0, 1, 1,
0.6426947, -0.1325909, 1.713732, 0.4352941, 0, 1, 1,
0.6492649, -0.6741993, 4.192972, 0.4392157, 0, 1, 1,
0.6529622, -0.8856105, 1.541665, 0.4470588, 0, 1, 1,
0.6637212, -1.669596, 2.608654, 0.4509804, 0, 1, 1,
0.6638981, -3.012431, 1.599203, 0.4588235, 0, 1, 1,
0.6658427, 1.140081, -0.1658084, 0.4627451, 0, 1, 1,
0.667459, -0.4309125, 1.158192, 0.4705882, 0, 1, 1,
0.6684314, 0.8316085, -0.1200376, 0.4745098, 0, 1, 1,
0.6710733, -0.8914459, 1.610302, 0.4823529, 0, 1, 1,
0.6740723, -0.6851174, 2.508643, 0.4862745, 0, 1, 1,
0.6740927, 1.127337, 0.9841531, 0.4941176, 0, 1, 1,
0.6769664, 0.9175195, 1.247942, 0.5019608, 0, 1, 1,
0.6825746, -1.181531, 2.158207, 0.5058824, 0, 1, 1,
0.6858346, -1.690934, 2.12685, 0.5137255, 0, 1, 1,
0.6917674, 0.3122318, 1.634779, 0.5176471, 0, 1, 1,
0.7004467, -0.2100718, 3.166462, 0.5254902, 0, 1, 1,
0.702666, 0.434606, -0.2647161, 0.5294118, 0, 1, 1,
0.708047, -1.08884, 1.785807, 0.5372549, 0, 1, 1,
0.7105813, -0.9216339, 2.046053, 0.5411765, 0, 1, 1,
0.7107617, 0.1081383, 2.086426, 0.5490196, 0, 1, 1,
0.7119254, -1.060241, 3.348043, 0.5529412, 0, 1, 1,
0.712289, 0.9940928, -0.5668303, 0.5607843, 0, 1, 1,
0.7172225, 0.2625958, 1.22092, 0.5647059, 0, 1, 1,
0.7263153, -1.639225, 4.812185, 0.572549, 0, 1, 1,
0.7272138, -0.1608049, 0.7965789, 0.5764706, 0, 1, 1,
0.7273801, -0.4348561, 1.553752, 0.5843138, 0, 1, 1,
0.7308189, -1.074693, 1.771508, 0.5882353, 0, 1, 1,
0.7414417, -1.25855, 2.475696, 0.5960785, 0, 1, 1,
0.7415119, 1.150233, 1.224795, 0.6039216, 0, 1, 1,
0.7463863, -2.474301, 2.747077, 0.6078432, 0, 1, 1,
0.7481424, -0.6842134, 2.105084, 0.6156863, 0, 1, 1,
0.751258, 0.3297275, 2.695116, 0.6196079, 0, 1, 1,
0.7536426, 0.505443, 0.5077597, 0.627451, 0, 1, 1,
0.7547469, 0.5938617, 1.320257, 0.6313726, 0, 1, 1,
0.7569691, -0.2552749, 1.654802, 0.6392157, 0, 1, 1,
0.7596639, -1.635401, 2.206719, 0.6431373, 0, 1, 1,
0.7849446, -1.331305, 3.618662, 0.6509804, 0, 1, 1,
0.7855754, -0.2185113, 1.231768, 0.654902, 0, 1, 1,
0.7860698, -1.295004, 3.518117, 0.6627451, 0, 1, 1,
0.7870039, 0.0567873, 0.6273878, 0.6666667, 0, 1, 1,
0.7873892, 0.3170792, 1.503037, 0.6745098, 0, 1, 1,
0.7882967, -0.8187029, 2.546793, 0.6784314, 0, 1, 1,
0.7926059, -1.560865, 2.064782, 0.6862745, 0, 1, 1,
0.8005167, 0.8274556, 1.873617, 0.6901961, 0, 1, 1,
0.8009107, 1.620939, 0.8952773, 0.6980392, 0, 1, 1,
0.8029857, 0.2640228, 1.921818, 0.7058824, 0, 1, 1,
0.8041792, 2.217215, -0.8412955, 0.7098039, 0, 1, 1,
0.8048094, 0.2111036, 1.586811, 0.7176471, 0, 1, 1,
0.8049444, -1.112103, 4.562805, 0.7215686, 0, 1, 1,
0.8055047, -0.1670851, 2.915602, 0.7294118, 0, 1, 1,
0.8097305, -1.39179, 2.185594, 0.7333333, 0, 1, 1,
0.8104191, 0.3609475, -0.1229782, 0.7411765, 0, 1, 1,
0.8211311, -1.270702, 1.609128, 0.7450981, 0, 1, 1,
0.8227556, 0.9218332, 0.7010804, 0.7529412, 0, 1, 1,
0.8269706, 0.1858533, 0.23464, 0.7568628, 0, 1, 1,
0.8314939, 2.924838, -0.1676645, 0.7647059, 0, 1, 1,
0.8376849, 1.049311, -0.491368, 0.7686275, 0, 1, 1,
0.8392997, 0.559351, 0.6155576, 0.7764706, 0, 1, 1,
0.8433833, -0.5657348, 3.051466, 0.7803922, 0, 1, 1,
0.8435225, 0.2053222, -0.5914571, 0.7882353, 0, 1, 1,
0.8631307, 2.27811, -1.66767, 0.7921569, 0, 1, 1,
0.870124, -0.0913142, 1.396549, 0.8, 0, 1, 1,
0.8784652, -0.8226048, 2.008806, 0.8078431, 0, 1, 1,
0.8793343, 0.6808802, 0.0822251, 0.8117647, 0, 1, 1,
0.8881947, 1.103869, -0.1019245, 0.8196079, 0, 1, 1,
0.8958008, 1.745881, 0.9981919, 0.8235294, 0, 1, 1,
0.9022333, -0.3989989, 1.615226, 0.8313726, 0, 1, 1,
0.9079642, -0.7657241, 2.772073, 0.8352941, 0, 1, 1,
0.931668, 1.781567, 0.4013734, 0.8431373, 0, 1, 1,
0.9327824, -0.4130755, 1.927513, 0.8470588, 0, 1, 1,
0.9332148, -0.529111, 3.364072, 0.854902, 0, 1, 1,
0.9337917, -0.9319591, 1.609077, 0.8588235, 0, 1, 1,
0.9375001, -0.3359611, 1.796682, 0.8666667, 0, 1, 1,
0.9476998, 1.021578, 1.734996, 0.8705882, 0, 1, 1,
0.9522287, 0.6858925, 0.1716901, 0.8784314, 0, 1, 1,
0.9604129, -2.147696, 2.620363, 0.8823529, 0, 1, 1,
0.9699948, -0.5655452, 0.6643119, 0.8901961, 0, 1, 1,
0.9779684, -0.05895767, 2.413944, 0.8941177, 0, 1, 1,
0.980057, -1.030094, 1.9758, 0.9019608, 0, 1, 1,
0.9818031, 0.2344816, 1.355714, 0.9098039, 0, 1, 1,
0.9840657, -0.02019335, 0.1725716, 0.9137255, 0, 1, 1,
0.993697, 1.93206, -0.4046843, 0.9215686, 0, 1, 1,
1.004065, -0.2190111, 3.528289, 0.9254902, 0, 1, 1,
1.00863, 1.107247, 0.7274057, 0.9333333, 0, 1, 1,
1.0125, 0.6842098, 2.126177, 0.9372549, 0, 1, 1,
1.014341, 0.7324235, 0.7099678, 0.945098, 0, 1, 1,
1.015064, 0.4811427, 0.2749763, 0.9490196, 0, 1, 1,
1.016911, -0.35253, 1.105017, 0.9568627, 0, 1, 1,
1.018286, 0.1023025, 0.7948721, 0.9607843, 0, 1, 1,
1.019491, 0.1382991, 0.01134468, 0.9686275, 0, 1, 1,
1.024058, -0.1356367, 0.6914767, 0.972549, 0, 1, 1,
1.025024, 1.411103, 1.782517, 0.9803922, 0, 1, 1,
1.03342, 1.425124, 0.998199, 0.9843137, 0, 1, 1,
1.036536, 1.46721, 0.7819052, 0.9921569, 0, 1, 1,
1.036682, -0.1008383, 0.3666813, 0.9960784, 0, 1, 1,
1.039624, -0.7861372, 1.285796, 1, 0, 0.9960784, 1,
1.040341, 0.4931694, 1.418023, 1, 0, 0.9882353, 1,
1.04414, 0.3117301, 3.223339, 1, 0, 0.9843137, 1,
1.046626, -0.3969998, 0.1828589, 1, 0, 0.9764706, 1,
1.047468, -0.672636, 0.5577672, 1, 0, 0.972549, 1,
1.061315, 1.210584, 0.09347969, 1, 0, 0.9647059, 1,
1.064188, -0.1017411, 0.7367064, 1, 0, 0.9607843, 1,
1.066473, 0.02946006, 2.787483, 1, 0, 0.9529412, 1,
1.066643, -1.041175, 2.582566, 1, 0, 0.9490196, 1,
1.067168, -1.468615, 1.058012, 1, 0, 0.9411765, 1,
1.068323, -0.04127854, 0.5824146, 1, 0, 0.9372549, 1,
1.073581, 0.356477, 1.225283, 1, 0, 0.9294118, 1,
1.075554, -1.213251, 3.293205, 1, 0, 0.9254902, 1,
1.079109, -0.3040487, 2.015539, 1, 0, 0.9176471, 1,
1.082051, -0.4980978, 0.5091894, 1, 0, 0.9137255, 1,
1.100018, 1.918026, 0.9560549, 1, 0, 0.9058824, 1,
1.104315, -0.1262819, 2.843885, 1, 0, 0.9019608, 1,
1.106172, 0.3353689, 0.1337819, 1, 0, 0.8941177, 1,
1.116102, 1.872313, -0.3347406, 1, 0, 0.8862745, 1,
1.116885, -1.408148, 1.158632, 1, 0, 0.8823529, 1,
1.121347, -1.128191, 3.901444, 1, 0, 0.8745098, 1,
1.121991, -0.7568673, 1.875455, 1, 0, 0.8705882, 1,
1.12946, 0.6977473, 0.2746916, 1, 0, 0.8627451, 1,
1.130625, -1.338374, 2.894381, 1, 0, 0.8588235, 1,
1.131479, -1.192059, 1.360078, 1, 0, 0.8509804, 1,
1.14502, 0.2776282, 1.444371, 1, 0, 0.8470588, 1,
1.14816, -0.1089092, 1.040165, 1, 0, 0.8392157, 1,
1.149841, -0.166872, 0.5263075, 1, 0, 0.8352941, 1,
1.167427, -1.37848, 3.866736, 1, 0, 0.827451, 1,
1.170644, 0.860664, 2.246318, 1, 0, 0.8235294, 1,
1.174543, 2.446986, -0.2833119, 1, 0, 0.8156863, 1,
1.174852, -1.483746, 2.711718, 1, 0, 0.8117647, 1,
1.175621, 0.1436249, 2.234291, 1, 0, 0.8039216, 1,
1.179594, 2.323232, -0.7757046, 1, 0, 0.7960784, 1,
1.182502, -1.610343, 3.970955, 1, 0, 0.7921569, 1,
1.183693, -0.6700507, 2.906012, 1, 0, 0.7843137, 1,
1.186971, -0.5279326, 1.612154, 1, 0, 0.7803922, 1,
1.188064, -0.7501915, 1.657906, 1, 0, 0.772549, 1,
1.189444, 0.7660441, -0.1022599, 1, 0, 0.7686275, 1,
1.192761, -1.265163, 1.687717, 1, 0, 0.7607843, 1,
1.196909, -2.106707, 0.4588206, 1, 0, 0.7568628, 1,
1.197271, -1.780323, 2.364436, 1, 0, 0.7490196, 1,
1.200767, -0.09247539, 0.948307, 1, 0, 0.7450981, 1,
1.205492, 0.6249768, 3.569891, 1, 0, 0.7372549, 1,
1.21668, -0.6261551, 3.236465, 1, 0, 0.7333333, 1,
1.222403, -1.030305, 1.992143, 1, 0, 0.7254902, 1,
1.225208, -0.7467319, 2.036557, 1, 0, 0.7215686, 1,
1.229888, 0.1834739, 2.325681, 1, 0, 0.7137255, 1,
1.231333, -0.6721272, 0.7982109, 1, 0, 0.7098039, 1,
1.23327, -0.7162513, 3.122936, 1, 0, 0.7019608, 1,
1.235267, 1.041165, 1.203462, 1, 0, 0.6941177, 1,
1.261198, -2.181908, 1.782377, 1, 0, 0.6901961, 1,
1.264982, 0.1195949, 0.7186854, 1, 0, 0.682353, 1,
1.275415, -1.174248, -0.7520242, 1, 0, 0.6784314, 1,
1.277794, -0.1265697, 2.997705, 1, 0, 0.6705883, 1,
1.280496, 0.9004532, 1.769349, 1, 0, 0.6666667, 1,
1.281687, -0.7667965, 1.473124, 1, 0, 0.6588235, 1,
1.283436, 2.438953, 0.7436255, 1, 0, 0.654902, 1,
1.283805, -0.4924324, 1.704754, 1, 0, 0.6470588, 1,
1.288304, 0.2864601, 1.414317, 1, 0, 0.6431373, 1,
1.293588, -0.9196826, 0.502315, 1, 0, 0.6352941, 1,
1.296099, 0.3968142, 1.636307, 1, 0, 0.6313726, 1,
1.300066, 0.7192867, 2.480376, 1, 0, 0.6235294, 1,
1.313429, 0.8241811, 0.7228861, 1, 0, 0.6196079, 1,
1.314679, 0.9128259, 0.1298384, 1, 0, 0.6117647, 1,
1.316526, -1.022317, 3.181291, 1, 0, 0.6078432, 1,
1.321103, 1.616326, -0.6313979, 1, 0, 0.6, 1,
1.321261, -0.5420873, 1.245752, 1, 0, 0.5921569, 1,
1.3226, 0.1382543, 2.957383, 1, 0, 0.5882353, 1,
1.324541, -1.71546, 2.232594, 1, 0, 0.5803922, 1,
1.329115, -1.1009, 2.533417, 1, 0, 0.5764706, 1,
1.331696, -0.3476138, 0.6389967, 1, 0, 0.5686275, 1,
1.3322, 0.4189737, 1.228639, 1, 0, 0.5647059, 1,
1.332323, 1.138613, 1.248791, 1, 0, 0.5568628, 1,
1.334893, -1.060585, 2.688118, 1, 0, 0.5529412, 1,
1.335672, 1.35302, 3.547704, 1, 0, 0.5450981, 1,
1.346744, -0.8995484, 1.437699, 1, 0, 0.5411765, 1,
1.354243, 0.3428006, 2.085285, 1, 0, 0.5333334, 1,
1.368638, -0.1928682, 1.818271, 1, 0, 0.5294118, 1,
1.372181, 1.030274, 0.05190852, 1, 0, 0.5215687, 1,
1.37342, -0.802722, 1.588975, 1, 0, 0.5176471, 1,
1.378774, -0.5429678, 0.4349539, 1, 0, 0.509804, 1,
1.379942, 0.03300559, 2.768106, 1, 0, 0.5058824, 1,
1.387609, -0.8599501, 1.482305, 1, 0, 0.4980392, 1,
1.38873, 0.7615162, 1.12191, 1, 0, 0.4901961, 1,
1.393399, -1.269856, 2.365448, 1, 0, 0.4862745, 1,
1.398285, -1.557402, 1.197253, 1, 0, 0.4784314, 1,
1.412082, 0.2018533, 1.637611, 1, 0, 0.4745098, 1,
1.424953, -0.7723647, 1.211342, 1, 0, 0.4666667, 1,
1.426505, -0.04381029, 3.71264, 1, 0, 0.4627451, 1,
1.428282, 0.7354448, 1.82298, 1, 0, 0.454902, 1,
1.43078, 0.7632498, -0.3714246, 1, 0, 0.4509804, 1,
1.432463, -0.2264363, 0.4932903, 1, 0, 0.4431373, 1,
1.434196, 0.9278096, -1.521547, 1, 0, 0.4392157, 1,
1.44003, 0.8550707, 1.518513, 1, 0, 0.4313726, 1,
1.440405, -0.6868493, 1.830368, 1, 0, 0.427451, 1,
1.444067, 1.703262, 1.613084, 1, 0, 0.4196078, 1,
1.445019, 0.2400588, 1.559204, 1, 0, 0.4156863, 1,
1.447989, 0.3671384, 1.953622, 1, 0, 0.4078431, 1,
1.461666, 0.8765462, 2.611638, 1, 0, 0.4039216, 1,
1.468572, -1.316499, 1.295246, 1, 0, 0.3960784, 1,
1.468587, -0.4185072, 2.48367, 1, 0, 0.3882353, 1,
1.475639, 0.4715441, 0.1726684, 1, 0, 0.3843137, 1,
1.489996, -1.717581, 2.283102, 1, 0, 0.3764706, 1,
1.499176, -0.1194664, 2.183069, 1, 0, 0.372549, 1,
1.505029, 2.314314, -0.02784414, 1, 0, 0.3647059, 1,
1.507846, -0.2426634, 2.145492, 1, 0, 0.3607843, 1,
1.514159, 1.736903, 1.289208, 1, 0, 0.3529412, 1,
1.517081, -0.6974871, 1.86955, 1, 0, 0.3490196, 1,
1.522294, -0.1127001, 1.942587, 1, 0, 0.3411765, 1,
1.52892, 0.2118753, -0.2429965, 1, 0, 0.3372549, 1,
1.531543, 1.573792, 1.204604, 1, 0, 0.3294118, 1,
1.534513, -0.4949793, 0.8212424, 1, 0, 0.3254902, 1,
1.548255, 0.5316222, 0.910135, 1, 0, 0.3176471, 1,
1.556816, -0.5143684, 1.556846, 1, 0, 0.3137255, 1,
1.568652, 0.1435594, 1.901242, 1, 0, 0.3058824, 1,
1.579088, -0.6151114, 2.019596, 1, 0, 0.2980392, 1,
1.586295, 0.2614062, 2.502192, 1, 0, 0.2941177, 1,
1.588948, -1.139123, 0.8323512, 1, 0, 0.2862745, 1,
1.615047, 0.01313142, 1.341757, 1, 0, 0.282353, 1,
1.617036, -0.6676341, 1.335928, 1, 0, 0.2745098, 1,
1.625704, 0.8217536, 1.389383, 1, 0, 0.2705882, 1,
1.656188, -0.7793747, 3.014074, 1, 0, 0.2627451, 1,
1.670591, 1.438301, 2.02667, 1, 0, 0.2588235, 1,
1.683722, 2.01, -0.3268183, 1, 0, 0.2509804, 1,
1.706341, -0.182566, 0.1919821, 1, 0, 0.2470588, 1,
1.708114, 1.215474, 2.260449, 1, 0, 0.2392157, 1,
1.721641, -0.649353, 1.450432, 1, 0, 0.2352941, 1,
1.741154, -1.572291, 1.807148, 1, 0, 0.227451, 1,
1.778798, -0.4915743, 1.577606, 1, 0, 0.2235294, 1,
1.779609, -1.575454, 2.063142, 1, 0, 0.2156863, 1,
1.781536, -0.7169451, 2.000999, 1, 0, 0.2117647, 1,
1.787489, 1.35077, 1.184344, 1, 0, 0.2039216, 1,
1.800984, 2.627827, 1.853786, 1, 0, 0.1960784, 1,
1.804937, -1.285725, 2.957963, 1, 0, 0.1921569, 1,
1.823789, -0.713, 1.938809, 1, 0, 0.1843137, 1,
1.856373, 0.2513277, 0.5632588, 1, 0, 0.1803922, 1,
1.867643, -1.016245, 2.374811, 1, 0, 0.172549, 1,
1.879151, 1.312421, 1.297031, 1, 0, 0.1686275, 1,
1.881864, 1.097526, 1.988686, 1, 0, 0.1607843, 1,
1.895294, 0.2426862, 1.357755, 1, 0, 0.1568628, 1,
1.904095, -1.372439, 1.184901, 1, 0, 0.1490196, 1,
1.929361, -2.222603, -0.7060278, 1, 0, 0.145098, 1,
1.932267, 1.408959, 0.2398648, 1, 0, 0.1372549, 1,
1.950984, -0.2404988, 0.4477392, 1, 0, 0.1333333, 1,
1.960401, -0.1200389, 1.758525, 1, 0, 0.1254902, 1,
2.066957, 1.129056, 1.004325, 1, 0, 0.1215686, 1,
2.07891, -0.2092121, 2.219592, 1, 0, 0.1137255, 1,
2.08184, 1.313616, 0.9295023, 1, 0, 0.1098039, 1,
2.11857, 0.06598677, 1.284711, 1, 0, 0.1019608, 1,
2.156078, 0.3944616, 1.913319, 1, 0, 0.09411765, 1,
2.207807, 0.8418346, 0.3289597, 1, 0, 0.09019608, 1,
2.23147, 0.5044152, 1.828188, 1, 0, 0.08235294, 1,
2.256436, -0.2673894, 4.222528, 1, 0, 0.07843138, 1,
2.266235, 0.5068782, 0.7599549, 1, 0, 0.07058824, 1,
2.27693, 0.3047832, 0.556182, 1, 0, 0.06666667, 1,
2.281285, -1.374978, 2.200063, 1, 0, 0.05882353, 1,
2.291982, 1.33856, 0.493029, 1, 0, 0.05490196, 1,
2.371548, -0.6795091, 1.452948, 1, 0, 0.04705882, 1,
2.432078, 1.205757, 0.5184593, 1, 0, 0.04313726, 1,
2.531724, 0.2863982, 1.846251, 1, 0, 0.03529412, 1,
2.564367, 0.4046836, 1.912827, 1, 0, 0.03137255, 1,
2.577348, -2.011655, 1.65566, 1, 0, 0.02352941, 1,
3.358631, 0.9737449, 2.061399, 1, 0, 0.01960784, 1,
3.404939, 1.561851, 1.811899, 1, 0, 0.01176471, 1,
3.607569, -0.10453, 1.26116, 1, 0, 0.007843138, 1
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
-0.3542322, -5.179698, -7.924625, 0, -0.5, 0.5, 0.5,
-0.3542322, -5.179698, -7.924625, 1, -0.5, 0.5, 0.5,
-0.3542322, -5.179698, -7.924625, 1, 1.5, 0.5, 0.5,
-0.3542322, -5.179698, -7.924625, 0, 1.5, 0.5, 0.5
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
-5.659083, -0.498906, -7.924625, 0, -0.5, 0.5, 0.5,
-5.659083, -0.498906, -7.924625, 1, -0.5, 0.5, 0.5,
-5.659083, -0.498906, -7.924625, 1, 1.5, 0.5, 0.5,
-5.659083, -0.498906, -7.924625, 0, 1.5, 0.5, 0.5
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
-5.659083, -5.179698, -0.1512766, 0, -0.5, 0.5, 0.5,
-5.659083, -5.179698, -0.1512766, 1, -0.5, 0.5, 0.5,
-5.659083, -5.179698, -0.1512766, 1, 1.5, 0.5, 0.5,
-5.659083, -5.179698, -0.1512766, 0, 1.5, 0.5, 0.5
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
-4, -4.099515, -6.130775,
2, -4.099515, -6.130775,
-4, -4.099515, -6.130775,
-4, -4.279546, -6.42975,
-2, -4.099515, -6.130775,
-2, -4.279546, -6.42975,
0, -4.099515, -6.130775,
0, -4.279546, -6.42975,
2, -4.099515, -6.130775,
2, -4.279546, -6.42975
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
"-4",
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
-4, -4.639607, -7.0277, 0, -0.5, 0.5, 0.5,
-4, -4.639607, -7.0277, 1, -0.5, 0.5, 0.5,
-4, -4.639607, -7.0277, 1, 1.5, 0.5, 0.5,
-4, -4.639607, -7.0277, 0, 1.5, 0.5, 0.5,
-2, -4.639607, -7.0277, 0, -0.5, 0.5, 0.5,
-2, -4.639607, -7.0277, 1, -0.5, 0.5, 0.5,
-2, -4.639607, -7.0277, 1, 1.5, 0.5, 0.5,
-2, -4.639607, -7.0277, 0, 1.5, 0.5, 0.5,
0, -4.639607, -7.0277, 0, -0.5, 0.5, 0.5,
0, -4.639607, -7.0277, 1, -0.5, 0.5, 0.5,
0, -4.639607, -7.0277, 1, 1.5, 0.5, 0.5,
0, -4.639607, -7.0277, 0, 1.5, 0.5, 0.5,
2, -4.639607, -7.0277, 0, -0.5, 0.5, 0.5,
2, -4.639607, -7.0277, 1, -0.5, 0.5, 0.5,
2, -4.639607, -7.0277, 1, 1.5, 0.5, 0.5,
2, -4.639607, -7.0277, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.434887, -3, -6.130775,
-4.434887, 2, -6.130775,
-4.434887, -3, -6.130775,
-4.63892, -3, -6.42975,
-4.434887, -2, -6.130775,
-4.63892, -2, -6.42975,
-4.434887, -1, -6.130775,
-4.63892, -1, -6.42975,
-4.434887, 0, -6.130775,
-4.63892, 0, -6.42975,
-4.434887, 1, -6.130775,
-4.63892, 1, -6.42975,
-4.434887, 2, -6.130775,
-4.63892, 2, -6.42975
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
-5.046985, -3, -7.0277, 0, -0.5, 0.5, 0.5,
-5.046985, -3, -7.0277, 1, -0.5, 0.5, 0.5,
-5.046985, -3, -7.0277, 1, 1.5, 0.5, 0.5,
-5.046985, -3, -7.0277, 0, 1.5, 0.5, 0.5,
-5.046985, -2, -7.0277, 0, -0.5, 0.5, 0.5,
-5.046985, -2, -7.0277, 1, -0.5, 0.5, 0.5,
-5.046985, -2, -7.0277, 1, 1.5, 0.5, 0.5,
-5.046985, -2, -7.0277, 0, 1.5, 0.5, 0.5,
-5.046985, -1, -7.0277, 0, -0.5, 0.5, 0.5,
-5.046985, -1, -7.0277, 1, -0.5, 0.5, 0.5,
-5.046985, -1, -7.0277, 1, 1.5, 0.5, 0.5,
-5.046985, -1, -7.0277, 0, 1.5, 0.5, 0.5,
-5.046985, 0, -7.0277, 0, -0.5, 0.5, 0.5,
-5.046985, 0, -7.0277, 1, -0.5, 0.5, 0.5,
-5.046985, 0, -7.0277, 1, 1.5, 0.5, 0.5,
-5.046985, 0, -7.0277, 0, 1.5, 0.5, 0.5,
-5.046985, 1, -7.0277, 0, -0.5, 0.5, 0.5,
-5.046985, 1, -7.0277, 1, -0.5, 0.5, 0.5,
-5.046985, 1, -7.0277, 1, 1.5, 0.5, 0.5,
-5.046985, 1, -7.0277, 0, 1.5, 0.5, 0.5,
-5.046985, 2, -7.0277, 0, -0.5, 0.5, 0.5,
-5.046985, 2, -7.0277, 1, -0.5, 0.5, 0.5,
-5.046985, 2, -7.0277, 1, 1.5, 0.5, 0.5,
-5.046985, 2, -7.0277, 0, 1.5, 0.5, 0.5
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
-4.434887, -4.099515, -4,
-4.434887, -4.099515, 4,
-4.434887, -4.099515, -4,
-4.63892, -4.279546, -4,
-4.434887, -4.099515, -2,
-4.63892, -4.279546, -2,
-4.434887, -4.099515, 0,
-4.63892, -4.279546, 0,
-4.434887, -4.099515, 2,
-4.63892, -4.279546, 2,
-4.434887, -4.099515, 4,
-4.63892, -4.279546, 4
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
-5.046985, -4.639607, -4, 0, -0.5, 0.5, 0.5,
-5.046985, -4.639607, -4, 1, -0.5, 0.5, 0.5,
-5.046985, -4.639607, -4, 1, 1.5, 0.5, 0.5,
-5.046985, -4.639607, -4, 0, 1.5, 0.5, 0.5,
-5.046985, -4.639607, -2, 0, -0.5, 0.5, 0.5,
-5.046985, -4.639607, -2, 1, -0.5, 0.5, 0.5,
-5.046985, -4.639607, -2, 1, 1.5, 0.5, 0.5,
-5.046985, -4.639607, -2, 0, 1.5, 0.5, 0.5,
-5.046985, -4.639607, 0, 0, -0.5, 0.5, 0.5,
-5.046985, -4.639607, 0, 1, -0.5, 0.5, 0.5,
-5.046985, -4.639607, 0, 1, 1.5, 0.5, 0.5,
-5.046985, -4.639607, 0, 0, 1.5, 0.5, 0.5,
-5.046985, -4.639607, 2, 0, -0.5, 0.5, 0.5,
-5.046985, -4.639607, 2, 1, -0.5, 0.5, 0.5,
-5.046985, -4.639607, 2, 1, 1.5, 0.5, 0.5,
-5.046985, -4.639607, 2, 0, 1.5, 0.5, 0.5,
-5.046985, -4.639607, 4, 0, -0.5, 0.5, 0.5,
-5.046985, -4.639607, 4, 1, -0.5, 0.5, 0.5,
-5.046985, -4.639607, 4, 1, 1.5, 0.5, 0.5,
-5.046985, -4.639607, 4, 0, 1.5, 0.5, 0.5
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
-4.434887, -4.099515, -6.130775,
-4.434887, 3.101704, -6.130775,
-4.434887, -4.099515, 5.828222,
-4.434887, 3.101704, 5.828222,
-4.434887, -4.099515, -6.130775,
-4.434887, -4.099515, 5.828222,
-4.434887, 3.101704, -6.130775,
-4.434887, 3.101704, 5.828222,
-4.434887, -4.099515, -6.130775,
3.726423, -4.099515, -6.130775,
-4.434887, -4.099515, 5.828222,
3.726423, -4.099515, 5.828222,
-4.434887, 3.101704, -6.130775,
3.726423, 3.101704, -6.130775,
-4.434887, 3.101704, 5.828222,
3.726423, 3.101704, 5.828222,
3.726423, -4.099515, -6.130775,
3.726423, 3.101704, -6.130775,
3.726423, -4.099515, 5.828222,
3.726423, 3.101704, 5.828222,
3.726423, -4.099515, -6.130775,
3.726423, -4.099515, 5.828222,
3.726423, 3.101704, -6.130775,
3.726423, 3.101704, 5.828222
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
var radius = 8.634685;
var distance = 38.41669;
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
mvMatrix.translate( 0.3542322, 0.498906, 0.1512766 );
mvMatrix.scale( 1.143933, 1.296446, 0.7806666 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.41669);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Tribenuron-methyl<-read.table("Tribenuron-methyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Tribenuron-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tribenuron' not found
```

```r
y<-Tribenuron-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tribenuron' not found
```

```r
z<-Tribenuron-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tribenuron' not found
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
-4.316033, -0.4847861, -3.03052, 0, 0, 1, 1, 1,
-3.195132, -0.1547961, -1.566875, 1, 0, 0, 1, 1,
-3.138819, -0.1813158, -2.458443, 1, 0, 0, 1, 1,
-3.004734, 0.008329103, -0.1848545, 1, 0, 0, 1, 1,
-2.729002, -0.4540927, -4.126987, 1, 0, 0, 1, 1,
-2.712545, -1.203891, -2.873601, 1, 0, 0, 1, 1,
-2.597648, 1.180585, -0.01084905, 0, 0, 0, 1, 1,
-2.448584, 0.6541175, -0.935543, 0, 0, 0, 1, 1,
-2.417247, -1.4699, -3.757664, 0, 0, 0, 1, 1,
-2.403924, -0.001419419, 0.1557755, 0, 0, 0, 1, 1,
-2.391379, -0.4194966, -1.114171, 0, 0, 0, 1, 1,
-2.377348, 0.8960615, 0.5422558, 0, 0, 0, 1, 1,
-2.375409, -0.3130247, -1.654149, 0, 0, 0, 1, 1,
-2.356944, 0.7630623, -2.165261, 1, 1, 1, 1, 1,
-2.327272, -0.4171124, -0.01002365, 1, 1, 1, 1, 1,
-2.32654, 0.852479, -1.179519, 1, 1, 1, 1, 1,
-2.29066, -0.4345286, -1.417794, 1, 1, 1, 1, 1,
-2.231308, -0.06489028, -0.9533814, 1, 1, 1, 1, 1,
-2.220317, 0.3337273, -2.954486, 1, 1, 1, 1, 1,
-2.208529, -0.6092178, -2.45455, 1, 1, 1, 1, 1,
-2.171205, -0.8975608, -2.760037, 1, 1, 1, 1, 1,
-2.162122, 0.9367967, -0.8802555, 1, 1, 1, 1, 1,
-2.152879, -0.05933046, -3.013115, 1, 1, 1, 1, 1,
-2.14872, -1.705088, -2.235715, 1, 1, 1, 1, 1,
-2.094676, 0.8989987, -2.382107, 1, 1, 1, 1, 1,
-2.092551, -0.1261031, -1.58119, 1, 1, 1, 1, 1,
-2.082233, -0.2671023, -2.125293, 1, 1, 1, 1, 1,
-2.060388, 2.317086, -0.09709591, 1, 1, 1, 1, 1,
-2.047985, 1.371778, -0.2452073, 0, 0, 1, 1, 1,
-2.022358, -1.231652, -1.700053, 1, 0, 0, 1, 1,
-2.000689, -0.9519574, -1.776024, 1, 0, 0, 1, 1,
-1.994683, 1.511595, -0.5217637, 1, 0, 0, 1, 1,
-1.968569, 0.1595057, -1.649014, 1, 0, 0, 1, 1,
-1.945258, 0.4579617, -1.287156, 1, 0, 0, 1, 1,
-1.933281, -0.5385222, -2.375285, 0, 0, 0, 1, 1,
-1.905616, -0.697373, -3.452127, 0, 0, 0, 1, 1,
-1.899313, -0.02800669, -0.9014587, 0, 0, 0, 1, 1,
-1.89748, 1.256217, -1.004346, 0, 0, 0, 1, 1,
-1.881454, 0.1401613, -1.961021, 0, 0, 0, 1, 1,
-1.881435, 0.6091293, -0.8350483, 0, 0, 0, 1, 1,
-1.872666, 0.05947224, -1.352779, 0, 0, 0, 1, 1,
-1.84251, 0.3081307, -1.659564, 1, 1, 1, 1, 1,
-1.835343, -0.02113792, -3.288671, 1, 1, 1, 1, 1,
-1.825878, -1.481788, -2.113191, 1, 1, 1, 1, 1,
-1.821092, -0.3732952, -2.675487, 1, 1, 1, 1, 1,
-1.801032, 1.438392, -0.2682818, 1, 1, 1, 1, 1,
-1.799739, -0.9018299, -0.7818312, 1, 1, 1, 1, 1,
-1.782902, 1.798183, -0.8249547, 1, 1, 1, 1, 1,
-1.77109, -0.9012802, -1.204733, 1, 1, 1, 1, 1,
-1.761764, -0.9245262, -2.257243, 1, 1, 1, 1, 1,
-1.7472, -0.3854375, -1.980441, 1, 1, 1, 1, 1,
-1.745543, 0.316713, -1.119048, 1, 1, 1, 1, 1,
-1.738612, 1.633915, -1.377124, 1, 1, 1, 1, 1,
-1.730534, 0.8724557, 0.9328488, 1, 1, 1, 1, 1,
-1.72769, 0.6095521, -1.925629, 1, 1, 1, 1, 1,
-1.72172, 1.026006, -0.7096144, 1, 1, 1, 1, 1,
-1.710995, 0.9142947, -1.577796, 0, 0, 1, 1, 1,
-1.687702, 1.374075, 0.292687, 1, 0, 0, 1, 1,
-1.684822, 0.1468872, -0.2800826, 1, 0, 0, 1, 1,
-1.680868, -0.09718824, -0.9576902, 1, 0, 0, 1, 1,
-1.675264, 0.5490646, -0.4371721, 1, 0, 0, 1, 1,
-1.672865, -0.8828998, -2.839345, 1, 0, 0, 1, 1,
-1.66393, -1.124903, -1.965711, 0, 0, 0, 1, 1,
-1.663829, 0.167106, -2.740456, 0, 0, 0, 1, 1,
-1.6511, -0.5667244, -1.630395, 0, 0, 0, 1, 1,
-1.640698, -1.321263, -1.738063, 0, 0, 0, 1, 1,
-1.639194, -0.2863641, -2.936796, 0, 0, 0, 1, 1,
-1.638381, 1.255718, -0.0002381126, 0, 0, 0, 1, 1,
-1.623838, -0.8265263, -1.522437, 0, 0, 0, 1, 1,
-1.60957, -1.659486, -2.936123, 1, 1, 1, 1, 1,
-1.606853, 0.4345753, -0.1715422, 1, 1, 1, 1, 1,
-1.60344, 0.813581, -2.844824, 1, 1, 1, 1, 1,
-1.57161, -0.2324645, -2.417184, 1, 1, 1, 1, 1,
-1.554494, 1.31549, -1.650808, 1, 1, 1, 1, 1,
-1.510424, -0.4810803, -2.400267, 1, 1, 1, 1, 1,
-1.491797, 0.445019, -1.648346, 1, 1, 1, 1, 1,
-1.489077, -1.165642, -1.019425, 1, 1, 1, 1, 1,
-1.47845, 0.6209074, -1.338663, 1, 1, 1, 1, 1,
-1.467856, -0.0617829, -3.450704, 1, 1, 1, 1, 1,
-1.464169, -0.2208449, -2.779063, 1, 1, 1, 1, 1,
-1.448401, 0.9303523, -0.02450324, 1, 1, 1, 1, 1,
-1.445887, 0.1485794, -2.022801, 1, 1, 1, 1, 1,
-1.429879, -0.821343, -1.291719, 1, 1, 1, 1, 1,
-1.403205, 0.3319916, -0.4300999, 1, 1, 1, 1, 1,
-1.400916, 0.003713691, -0.9636105, 0, 0, 1, 1, 1,
-1.398118, 0.4648618, -2.444691, 1, 0, 0, 1, 1,
-1.391044, 1.05598, 0.3987117, 1, 0, 0, 1, 1,
-1.385443, 0.8248819, -1.158554, 1, 0, 0, 1, 1,
-1.371922, -0.8303466, -0.9272873, 1, 0, 0, 1, 1,
-1.36964, 2.353753, 0.3340227, 1, 0, 0, 1, 1,
-1.365579, -1.215184, -2.536894, 0, 0, 0, 1, 1,
-1.361962, -0.3281914, -1.618769, 0, 0, 0, 1, 1,
-1.33928, -2.73934, -3.071665, 0, 0, 0, 1, 1,
-1.326536, 0.09917233, -1.218317, 0, 0, 0, 1, 1,
-1.326534, 1.437321, 0.6288986, 0, 0, 0, 1, 1,
-1.320462, -2.219044, -3.178308, 0, 0, 0, 1, 1,
-1.318439, -2.20217, -2.830126, 0, 0, 0, 1, 1,
-1.315943, -1.554417, -1.597085, 1, 1, 1, 1, 1,
-1.307625, -0.1178244, -2.398443, 1, 1, 1, 1, 1,
-1.30606, 1.250695, 0.5753818, 1, 1, 1, 1, 1,
-1.303516, 1.027712, -0.7608787, 1, 1, 1, 1, 1,
-1.300374, -1.674425, -2.539084, 1, 1, 1, 1, 1,
-1.297234, -0.9801013, -1.995652, 1, 1, 1, 1, 1,
-1.265109, -0.1568449, -2.960844, 1, 1, 1, 1, 1,
-1.262525, 0.981304, -0.7515915, 1, 1, 1, 1, 1,
-1.252218, 0.1916833, -1.837924, 1, 1, 1, 1, 1,
-1.236502, 0.04279811, -1.802322, 1, 1, 1, 1, 1,
-1.233829, -0.04307836, -2.755892, 1, 1, 1, 1, 1,
-1.232701, -0.2671662, -0.828718, 1, 1, 1, 1, 1,
-1.228893, -0.2033975, -0.4920218, 1, 1, 1, 1, 1,
-1.226889, -0.5298941, -2.177993, 1, 1, 1, 1, 1,
-1.225877, 1.144938, -2.342407, 1, 1, 1, 1, 1,
-1.224341, 0.7773638, -0.5675595, 0, 0, 1, 1, 1,
-1.222569, -0.08783717, -2.749473, 1, 0, 0, 1, 1,
-1.215334, -0.4356738, -0.8696908, 1, 0, 0, 1, 1,
-1.20585, 0.4689938, -3.476171, 1, 0, 0, 1, 1,
-1.198145, -0.5769743, -1.837492, 1, 0, 0, 1, 1,
-1.194781, -0.4835649, -3.737195, 1, 0, 0, 1, 1,
-1.189411, 0.3705386, -1.163769, 0, 0, 0, 1, 1,
-1.18588, 0.6133766, -0.2832155, 0, 0, 0, 1, 1,
-1.180119, -0.4455983, 0.003994982, 0, 0, 0, 1, 1,
-1.170325, -0.7066776, -1.349881, 0, 0, 0, 1, 1,
-1.167022, -0.2038375, -1.323901, 0, 0, 0, 1, 1,
-1.152222, 0.5828289, -1.808645, 0, 0, 0, 1, 1,
-1.147707, 2.280268, -0.4555041, 0, 0, 0, 1, 1,
-1.144334, 0.2359518, -1.476455, 1, 1, 1, 1, 1,
-1.141786, 0.2813514, -2.286975, 1, 1, 1, 1, 1,
-1.141426, -1.700443, -3.659747, 1, 1, 1, 1, 1,
-1.129575, 0.7151718, -2.996941, 1, 1, 1, 1, 1,
-1.128481, 0.7515503, -2.188508, 1, 1, 1, 1, 1,
-1.127729, -0.2170911, -1.799363, 1, 1, 1, 1, 1,
-1.120623, 0.3038869, -1.62499, 1, 1, 1, 1, 1,
-1.116697, -0.8695218, -2.484222, 1, 1, 1, 1, 1,
-1.111684, 0.424799, -1.491491, 1, 1, 1, 1, 1,
-1.109523, 0.6377181, -0.1491653, 1, 1, 1, 1, 1,
-1.1039, -1.078719, -4.16047, 1, 1, 1, 1, 1,
-1.102326, -2.482363, -2.114808, 1, 1, 1, 1, 1,
-1.092722, 0.1496483, -2.63137, 1, 1, 1, 1, 1,
-1.087251, -0.03322862, -1.805097, 1, 1, 1, 1, 1,
-1.083346, -0.05261242, -2.00606, 1, 1, 1, 1, 1,
-1.08163, 0.1441348, 0.8269111, 0, 0, 1, 1, 1,
-1.079815, 0.05223262, 0.0330924, 1, 0, 0, 1, 1,
-1.075013, 1.498234, -1.199562, 1, 0, 0, 1, 1,
-1.069319, 1.407821, 0.288055, 1, 0, 0, 1, 1,
-1.065346, 0.08049653, -1.678077, 1, 0, 0, 1, 1,
-1.061221, 0.7929585, -0.5111892, 1, 0, 0, 1, 1,
-1.054671, -0.3470399, -0.5274726, 0, 0, 0, 1, 1,
-1.043787, 1.002007, -0.5698278, 0, 0, 0, 1, 1,
-1.042319, 0.775606, -1.503943, 0, 0, 0, 1, 1,
-1.03916, 0.108512, -2.548082, 0, 0, 0, 1, 1,
-1.030038, 0.125996, -1.287484, 0, 0, 0, 1, 1,
-1.024707, 0.7880358, -1.878235, 0, 0, 0, 1, 1,
-1.024322, 0.1984704, -0.4094955, 0, 0, 0, 1, 1,
-1.021381, -1.603565, -0.9105362, 1, 1, 1, 1, 1,
-1.020728, 2.451957, 0.4478227, 1, 1, 1, 1, 1,
-1.017994, 0.6345702, -0.9531175, 1, 1, 1, 1, 1,
-1.013983, 0.9174255, -0.3946699, 1, 1, 1, 1, 1,
-1.00911, 0.2896361, -2.4448, 1, 1, 1, 1, 1,
-1.008131, 1.495158, -0.01307942, 1, 1, 1, 1, 1,
-0.9990807, 1.018379, -1.067028, 1, 1, 1, 1, 1,
-0.9982389, -0.9913447, -0.9946707, 1, 1, 1, 1, 1,
-0.9887111, 0.1408164, -3.023209, 1, 1, 1, 1, 1,
-0.9854367, 0.77428, -2.558762, 1, 1, 1, 1, 1,
-0.9778143, -0.05474322, -1.390494, 1, 1, 1, 1, 1,
-0.9763663, -0.7737349, -4.080819, 1, 1, 1, 1, 1,
-0.9720668, 0.7877523, 1.30466, 1, 1, 1, 1, 1,
-0.9698937, 0.04472407, -1.133297, 1, 1, 1, 1, 1,
-0.968915, 1.425176, 0.490229, 1, 1, 1, 1, 1,
-0.967501, 1.03009, -1.140384, 0, 0, 1, 1, 1,
-0.9656325, 2.996831, -1.362257, 1, 0, 0, 1, 1,
-0.9649887, 0.2220308, -0.03176298, 1, 0, 0, 1, 1,
-0.964074, 0.3393691, 0.01374218, 1, 0, 0, 1, 1,
-0.9629144, 0.3422067, -0.3293576, 1, 0, 0, 1, 1,
-0.9600873, -0.1393262, -0.6283571, 1, 0, 0, 1, 1,
-0.9497342, 0.7180678, -1.592245, 0, 0, 0, 1, 1,
-0.9441745, -1.298089, -2.986751, 0, 0, 0, 1, 1,
-0.9439331, -0.3060054, -2.433819, 0, 0, 0, 1, 1,
-0.9369078, -0.6607898, -2.737752, 0, 0, 0, 1, 1,
-0.9360526, -0.291412, -3.991619, 0, 0, 0, 1, 1,
-0.9348903, 1.587669, -0.5091306, 0, 0, 0, 1, 1,
-0.9196196, -0.03957198, -0.9711709, 0, 0, 0, 1, 1,
-0.9176343, -1.343721, -3.178904, 1, 1, 1, 1, 1,
-0.9142411, 0.4227532, -0.6480579, 1, 1, 1, 1, 1,
-0.9138288, 0.31953, 0.1507991, 1, 1, 1, 1, 1,
-0.9124753, 0.1450778, -2.441046, 1, 1, 1, 1, 1,
-0.9118959, -0.08896562, -1.882089, 1, 1, 1, 1, 1,
-0.9083317, -1.075503, -2.219014, 1, 1, 1, 1, 1,
-0.9075533, -0.0450469, -2.393603, 1, 1, 1, 1, 1,
-0.9067678, 0.4100669, -2.356514, 1, 1, 1, 1, 1,
-0.8986952, -0.2074955, -1.996562, 1, 1, 1, 1, 1,
-0.8946178, 0.7739512, -1.60291, 1, 1, 1, 1, 1,
-0.8941497, -0.8808225, -1.941308, 1, 1, 1, 1, 1,
-0.884484, 0.9265512, -1.399794, 1, 1, 1, 1, 1,
-0.8786556, -0.4268442, -1.430986, 1, 1, 1, 1, 1,
-0.8744326, -1.109285, -0.5379851, 1, 1, 1, 1, 1,
-0.8725187, 1.25008, -1.933619, 1, 1, 1, 1, 1,
-0.8709611, -0.2032802, -0.7989922, 0, 0, 1, 1, 1,
-0.8693804, 0.3273515, -0.3655012, 1, 0, 0, 1, 1,
-0.868621, -1.452357, -4.398173, 1, 0, 0, 1, 1,
-0.8652087, 1.765123, 1.467413, 1, 0, 0, 1, 1,
-0.8642494, 0.734773, -1.659523, 1, 0, 0, 1, 1,
-0.8619578, -1.796304, -1.776965, 1, 0, 0, 1, 1,
-0.8578194, -0.2395903, -0.6501477, 0, 0, 0, 1, 1,
-0.8567514, -0.6993016, -1.510341, 0, 0, 0, 1, 1,
-0.8556073, 0.7727977, -0.8488729, 0, 0, 0, 1, 1,
-0.853978, 1.009647, -0.5085167, 0, 0, 0, 1, 1,
-0.851504, -0.689391, -0.8051976, 0, 0, 0, 1, 1,
-0.8493627, 0.5764674, -1.674605, 0, 0, 0, 1, 1,
-0.8489268, 0.5451832, -2.359787, 0, 0, 0, 1, 1,
-0.8412653, -1.35072, -2.184011, 1, 1, 1, 1, 1,
-0.8375692, 0.7398975, -0.6732839, 1, 1, 1, 1, 1,
-0.8318233, -1.19593, -3.596808, 1, 1, 1, 1, 1,
-0.8312176, -0.2497613, -2.187297, 1, 1, 1, 1, 1,
-0.8309826, 1.057484, 0.3615762, 1, 1, 1, 1, 1,
-0.8296714, 0.4402862, -1.84886, 1, 1, 1, 1, 1,
-0.8243982, 0.268196, -1.333883, 1, 1, 1, 1, 1,
-0.8222113, 1.722455, -0.5684915, 1, 1, 1, 1, 1,
-0.8210541, 0.1442004, -1.357598, 1, 1, 1, 1, 1,
-0.8170224, 0.16992, -0.4121328, 1, 1, 1, 1, 1,
-0.8157876, -0.2241399, -3.037705, 1, 1, 1, 1, 1,
-0.8088242, 0.5758411, -0.2668708, 1, 1, 1, 1, 1,
-0.8087025, -1.166718, -3.571239, 1, 1, 1, 1, 1,
-0.807489, -0.3556947, -1.051541, 1, 1, 1, 1, 1,
-0.8043249, 0.5649433, 1.236122, 1, 1, 1, 1, 1,
-0.8038586, 0.1518484, -0.6473509, 0, 0, 1, 1, 1,
-0.8005215, -0.8685803, -2.987187, 1, 0, 0, 1, 1,
-0.7967986, -0.01450309, -1.809631, 1, 0, 0, 1, 1,
-0.7934466, 0.2889306, -0.8700339, 1, 0, 0, 1, 1,
-0.7877069, -0.9810249, -2.419501, 1, 0, 0, 1, 1,
-0.7870168, -1.198381, -0.9306033, 1, 0, 0, 1, 1,
-0.7818969, 0.5112717, -0.2430695, 0, 0, 0, 1, 1,
-0.7761116, -0.01848441, 0.08890129, 0, 0, 0, 1, 1,
-0.7751058, 0.7322989, 0.1711504, 0, 0, 0, 1, 1,
-0.7685034, 0.4202041, -0.6107309, 0, 0, 0, 1, 1,
-0.7660258, 0.6410245, -1.231655, 0, 0, 0, 1, 1,
-0.7647828, -0.2554934, -0.6640453, 0, 0, 0, 1, 1,
-0.7637208, 1.02149, 0.08616842, 0, 0, 0, 1, 1,
-0.7594939, 1.532631, -1.076897, 1, 1, 1, 1, 1,
-0.7518786, -0.6674015, -3.138359, 1, 1, 1, 1, 1,
-0.7428271, 0.4800095, -0.6017206, 1, 1, 1, 1, 1,
-0.7426003, 0.9463769, 0.01515363, 1, 1, 1, 1, 1,
-0.7392488, -1.565919, -2.505789, 1, 1, 1, 1, 1,
-0.7350308, 1.564879, -0.1544235, 1, 1, 1, 1, 1,
-0.7292694, 1.627984, -0.5711807, 1, 1, 1, 1, 1,
-0.715353, 0.2717266, -1.98999, 1, 1, 1, 1, 1,
-0.7131498, -0.1688983, -0.1772961, 1, 1, 1, 1, 1,
-0.7064365, 0.1872558, -1.213566, 1, 1, 1, 1, 1,
-0.706082, -1.979734, -2.122983, 1, 1, 1, 1, 1,
-0.7002376, 0.7685231, 0.09586007, 1, 1, 1, 1, 1,
-0.6940043, 0.01838449, -1.902314, 1, 1, 1, 1, 1,
-0.6937813, 0.4411141, -1.872371, 1, 1, 1, 1, 1,
-0.6914716, 1.050661, -1.231999, 1, 1, 1, 1, 1,
-0.6907076, 0.03395194, -0.8440742, 0, 0, 1, 1, 1,
-0.6899498, 1.651555, -0.2781838, 1, 0, 0, 1, 1,
-0.6893041, 0.7240381, -0.08406339, 1, 0, 0, 1, 1,
-0.6868923, -0.8433743, -3.929265, 1, 0, 0, 1, 1,
-0.6868499, -0.4089611, -3.107029, 1, 0, 0, 1, 1,
-0.6799861, -0.2932837, -1.550239, 1, 0, 0, 1, 1,
-0.6783926, 0.936103, -0.5511923, 0, 0, 0, 1, 1,
-0.6754324, 0.2756598, -0.4880005, 0, 0, 0, 1, 1,
-0.6741673, 1.728058, 0.7285194, 0, 0, 0, 1, 1,
-0.668202, -0.2051534, -1.647358, 0, 0, 0, 1, 1,
-0.6681126, 0.02997573, -1.383879, 0, 0, 0, 1, 1,
-0.6663381, 0.846402, -0.8838248, 0, 0, 0, 1, 1,
-0.6658393, 0.6427839, 1.055915, 0, 0, 0, 1, 1,
-0.6610212, 0.8740694, 0.3295258, 1, 1, 1, 1, 1,
-0.6584608, -0.1382633, -1.807173, 1, 1, 1, 1, 1,
-0.6561409, -0.8443953, -1.45901, 1, 1, 1, 1, 1,
-0.6545896, -1.048365, -3.967386, 1, 1, 1, 1, 1,
-0.6319602, 0.1190763, 0.09752022, 1, 1, 1, 1, 1,
-0.6261509, -1.066612, -1.163512, 1, 1, 1, 1, 1,
-0.6210012, 0.2590407, -0.1179531, 1, 1, 1, 1, 1,
-0.6180497, 0.09177737, -1.532172, 1, 1, 1, 1, 1,
-0.6166315, -0.7622405, -0.5362881, 1, 1, 1, 1, 1,
-0.6132, 0.4607967, 0.5615559, 1, 1, 1, 1, 1,
-0.611283, 0.3687319, -1.633488, 1, 1, 1, 1, 1,
-0.6044895, -0.9788153, -2.738815, 1, 1, 1, 1, 1,
-0.6037666, 2.412511, 0.428845, 1, 1, 1, 1, 1,
-0.598926, 1.130394, -2.257965, 1, 1, 1, 1, 1,
-0.5966994, 0.4585977, -0.7642621, 1, 1, 1, 1, 1,
-0.5939387, -0.1996807, -2.437697, 0, 0, 1, 1, 1,
-0.5925233, -0.3021279, -2.377327, 1, 0, 0, 1, 1,
-0.5905944, -0.5122685, -2.871907, 1, 0, 0, 1, 1,
-0.58246, 1.833837, 0.6753242, 1, 0, 0, 1, 1,
-0.5804271, 0.1966055, -0.621718, 1, 0, 0, 1, 1,
-0.5798241, 0.8836254, -0.4334684, 1, 0, 0, 1, 1,
-0.5763395, -1.05727, -3.671298, 0, 0, 0, 1, 1,
-0.573748, 0.0638295, -0.9524014, 0, 0, 0, 1, 1,
-0.5735517, 1.828735, -0.6879812, 0, 0, 0, 1, 1,
-0.5724132, -0.2709827, -1.822477, 0, 0, 0, 1, 1,
-0.5695314, -0.357426, -1.059073, 0, 0, 0, 1, 1,
-0.5604909, 1.790859, 0.04381651, 0, 0, 0, 1, 1,
-0.5593077, 1.259843, -0.9266477, 0, 0, 0, 1, 1,
-0.5577226, -1.0154, -2.876657, 1, 1, 1, 1, 1,
-0.5558906, 0.05016173, -2.944306, 1, 1, 1, 1, 1,
-0.5558089, 0.4469904, 0.9285043, 1, 1, 1, 1, 1,
-0.5431719, 0.7053914, 0.1228768, 1, 1, 1, 1, 1,
-0.5283816, -0.06161035, -1.289587, 1, 1, 1, 1, 1,
-0.5276477, 1.652635, -2.025604, 1, 1, 1, 1, 1,
-0.5245315, -0.5004795, -1.634349, 1, 1, 1, 1, 1,
-0.5224032, -1.635224, -3.434891, 1, 1, 1, 1, 1,
-0.5198435, -0.2720591, -2.069942, 1, 1, 1, 1, 1,
-0.5171185, 2.298181, -0.01023827, 1, 1, 1, 1, 1,
-0.5169157, -1.531911, -3.154843, 1, 1, 1, 1, 1,
-0.5167289, -0.4058075, -0.9860887, 1, 1, 1, 1, 1,
-0.5159785, -0.5182676, -3.345022, 1, 1, 1, 1, 1,
-0.5148543, -0.3444449, -1.851291, 1, 1, 1, 1, 1,
-0.5141864, -1.687454, -1.750522, 1, 1, 1, 1, 1,
-0.5126336, -0.031434, -2.1871, 0, 0, 1, 1, 1,
-0.509778, -1.0582, -4.47659, 1, 0, 0, 1, 1,
-0.5048161, -0.6204948, -2.239624, 1, 0, 0, 1, 1,
-0.5037594, -0.2200354, -3.129104, 1, 0, 0, 1, 1,
-0.5014467, -0.1789847, -2.648397, 1, 0, 0, 1, 1,
-0.4977164, -1.923671, -2.553496, 1, 0, 0, 1, 1,
-0.4951547, -0.2971699, -1.130216, 0, 0, 0, 1, 1,
-0.4941461, -0.3531692, -1.296741, 0, 0, 0, 1, 1,
-0.4936517, 0.9632336, -2.481864, 0, 0, 0, 1, 1,
-0.4910513, 1.198128, -0.5603886, 0, 0, 0, 1, 1,
-0.4834608, -0.6662467, -2.253681, 0, 0, 0, 1, 1,
-0.4786012, 0.579417, -2.373748, 0, 0, 0, 1, 1,
-0.4781921, -3.005889, -4.506775, 0, 0, 0, 1, 1,
-0.4739752, -0.01205507, -1.171015, 1, 1, 1, 1, 1,
-0.4704387, 0.2596588, -0.2876638, 1, 1, 1, 1, 1,
-0.4699884, 1.226897, -0.3039459, 1, 1, 1, 1, 1,
-0.4633696, 0.3492355, -1.10943, 1, 1, 1, 1, 1,
-0.4630573, 0.1632475, -1.756253, 1, 1, 1, 1, 1,
-0.4609254, 0.6587821, -0.6414056, 1, 1, 1, 1, 1,
-0.4597605, 1.399428, 0.9075271, 1, 1, 1, 1, 1,
-0.4556706, -0.3853679, -0.04485848, 1, 1, 1, 1, 1,
-0.4498523, 0.5348493, 0.619451, 1, 1, 1, 1, 1,
-0.445228, 0.215987, -0.6338943, 1, 1, 1, 1, 1,
-0.4433368, -0.4972552, -1.861053, 1, 1, 1, 1, 1,
-0.4315659, -0.7779231, -3.843642, 1, 1, 1, 1, 1,
-0.4259703, 0.1751776, -0.2206423, 1, 1, 1, 1, 1,
-0.4199925, -0.5102304, -1.762265, 1, 1, 1, 1, 1,
-0.4199354, 1.408851, -0.2447647, 1, 1, 1, 1, 1,
-0.417848, -1.597955, -2.275145, 0, 0, 1, 1, 1,
-0.4158171, 1.218335, -1.93865, 1, 0, 0, 1, 1,
-0.4145814, 1.910686, -0.9489188, 1, 0, 0, 1, 1,
-0.408075, -0.1308434, -1.355841, 1, 0, 0, 1, 1,
-0.3992478, -0.8645806, -2.854465, 1, 0, 0, 1, 1,
-0.394856, 1.396953, 1.770429, 1, 0, 0, 1, 1,
-0.3943847, -0.02186707, -0.8519259, 0, 0, 0, 1, 1,
-0.3943429, -1.055003, -3.287789, 0, 0, 0, 1, 1,
-0.3937394, 1.29689, 0.969547, 0, 0, 0, 1, 1,
-0.3888269, -0.4999428, -3.663331, 0, 0, 0, 1, 1,
-0.3880709, -0.4310395, -0.5127736, 0, 0, 0, 1, 1,
-0.3874914, 0.7719216, 1.069083, 0, 0, 0, 1, 1,
-0.3865612, -0.2967792, -0.8370055, 0, 0, 0, 1, 1,
-0.384261, -0.2276718, -1.868759, 1, 1, 1, 1, 1,
-0.3806263, 1.435912, 0.7960497, 1, 1, 1, 1, 1,
-0.3734105, 0.5215385, 0.6453486, 1, 1, 1, 1, 1,
-0.3733805, 0.4186227, -0.4075411, 1, 1, 1, 1, 1,
-0.3708833, -2.161061, -3.464951, 1, 1, 1, 1, 1,
-0.3704832, 1.098245, -0.06676511, 1, 1, 1, 1, 1,
-0.3699071, -0.8013257, -3.24693, 1, 1, 1, 1, 1,
-0.3650397, -0.1963673, -0.919845, 1, 1, 1, 1, 1,
-0.3644884, -0.8517168, -2.342249, 1, 1, 1, 1, 1,
-0.3612631, 0.610133, -1.64533, 1, 1, 1, 1, 1,
-0.3607358, -0.2805701, -0.1646481, 1, 1, 1, 1, 1,
-0.3561393, -0.6485893, -1.087331, 1, 1, 1, 1, 1,
-0.3471187, -0.8138386, -2.582002, 1, 1, 1, 1, 1,
-0.3469262, 0.3518565, -0.5349194, 1, 1, 1, 1, 1,
-0.3457803, -0.1295146, -0.4517497, 1, 1, 1, 1, 1,
-0.3445569, 0.9351198, -0.7060229, 0, 0, 1, 1, 1,
-0.3427654, -0.2491453, -2.776148, 1, 0, 0, 1, 1,
-0.3418285, 1.617129, 0.4205396, 1, 0, 0, 1, 1,
-0.3411178, 1.221604, -0.9039575, 1, 0, 0, 1, 1,
-0.3395163, -1.018703, -2.953166, 1, 0, 0, 1, 1,
-0.3348219, -1.627198, -2.870402, 1, 0, 0, 1, 1,
-0.3335667, 0.07440797, -0.561588, 0, 0, 0, 1, 1,
-0.3263601, 1.109545, -1.091421, 0, 0, 0, 1, 1,
-0.3228177, -0.7690674, -1.758151, 0, 0, 0, 1, 1,
-0.3221141, 0.09512424, -1.540356, 0, 0, 0, 1, 1,
-0.3207754, -1.181661, -4.713817, 0, 0, 0, 1, 1,
-0.3183298, 2.582218, 0.5527268, 0, 0, 0, 1, 1,
-0.3163116, 0.1012241, -1.37976, 0, 0, 0, 1, 1,
-0.3160806, -0.496685, -2.168538, 1, 1, 1, 1, 1,
-0.3132123, -0.3416964, -2.545855, 1, 1, 1, 1, 1,
-0.3089735, -0.5808477, -2.399378, 1, 1, 1, 1, 1,
-0.3084263, -0.1686717, -2.435367, 1, 1, 1, 1, 1,
-0.307092, -0.02616433, -1.278269, 1, 1, 1, 1, 1,
-0.3056729, 0.2883989, -1.449746, 1, 1, 1, 1, 1,
-0.3044949, -1.608334, -2.006904, 1, 1, 1, 1, 1,
-0.3043844, 0.1519336, -2.156544, 1, 1, 1, 1, 1,
-0.3042059, -1.880843, -4.316152, 1, 1, 1, 1, 1,
-0.3038561, -1.76827, -3.184245, 1, 1, 1, 1, 1,
-0.3030076, 0.2481745, -0.82258, 1, 1, 1, 1, 1,
-0.2993902, 1.22753, 0.2754639, 1, 1, 1, 1, 1,
-0.2991312, -0.3133712, -3.44887, 1, 1, 1, 1, 1,
-0.2980677, -0.3315187, -3.207093, 1, 1, 1, 1, 1,
-0.2963432, -0.1916435, -1.979165, 1, 1, 1, 1, 1,
-0.2934885, -0.6335488, -2.544082, 0, 0, 1, 1, 1,
-0.2928427, -1.252649, -2.307125, 1, 0, 0, 1, 1,
-0.2883123, 1.268914, -0.4395201, 1, 0, 0, 1, 1,
-0.2880581, -0.4426276, -2.427486, 1, 0, 0, 1, 1,
-0.2786781, -0.4749773, -2.444616, 1, 0, 0, 1, 1,
-0.2781824, -1.183091, -1.855271, 1, 0, 0, 1, 1,
-0.2747074, -0.5466732, -1.739652, 0, 0, 0, 1, 1,
-0.2725361, -0.07163826, -2.509279, 0, 0, 0, 1, 1,
-0.2704586, 1.742742, 0.6633555, 0, 0, 0, 1, 1,
-0.2686097, -0.5339732, -1.832254, 0, 0, 0, 1, 1,
-0.2644568, -0.3579558, -3.068222, 0, 0, 0, 1, 1,
-0.2565977, 1.353507, -1.804872, 0, 0, 0, 1, 1,
-0.2536376, -0.120445, -1.598339, 0, 0, 0, 1, 1,
-0.2519009, -0.5660249, -2.15003, 1, 1, 1, 1, 1,
-0.2507259, -1.308778, -3.755458, 1, 1, 1, 1, 1,
-0.2483284, 1.519687, 1.579872, 1, 1, 1, 1, 1,
-0.2476381, 1.875901, 0.6038926, 1, 1, 1, 1, 1,
-0.2410909, -0.9497783, -2.696275, 1, 1, 1, 1, 1,
-0.2373877, -1.314299, -3.591728, 1, 1, 1, 1, 1,
-0.2372593, 1.742649, -0.9171966, 1, 1, 1, 1, 1,
-0.2361586, -0.4573837, -1.634113, 1, 1, 1, 1, 1,
-0.2354144, -0.9549196, -4.332885, 1, 1, 1, 1, 1,
-0.2313681, -0.2927762, -4.067119, 1, 1, 1, 1, 1,
-0.2298316, 0.5825672, -0.1582445, 1, 1, 1, 1, 1,
-0.2296674, -0.1118718, -1.98939, 1, 1, 1, 1, 1,
-0.2252661, -1.782616, -3.549542, 1, 1, 1, 1, 1,
-0.2233053, -1.323613, -2.772354, 1, 1, 1, 1, 1,
-0.221371, 0.07467343, -0.1698622, 1, 1, 1, 1, 1,
-0.2160892, -0.1919468, -3.515209, 0, 0, 1, 1, 1,
-0.213006, 0.9109027, -2.224491, 1, 0, 0, 1, 1,
-0.2019609, 1.169457, 0.2146561, 1, 0, 0, 1, 1,
-0.2005133, -1.135631, -2.160895, 1, 0, 0, 1, 1,
-0.2000305, 0.762675, -1.092102, 1, 0, 0, 1, 1,
-0.1998873, 1.804687, 0.03984885, 1, 0, 0, 1, 1,
-0.1966862, -0.3483579, -3.562815, 0, 0, 0, 1, 1,
-0.1936091, -0.5924618, -2.376597, 0, 0, 0, 1, 1,
-0.1926871, 0.3467496, -1.941211, 0, 0, 0, 1, 1,
-0.1867398, 1.408031, 2.933855, 0, 0, 0, 1, 1,
-0.185974, -0.6826393, -3.089579, 0, 0, 0, 1, 1,
-0.1830554, -0.6259187, -3.261528, 0, 0, 0, 1, 1,
-0.1819657, 2.646188, 0.1810998, 0, 0, 0, 1, 1,
-0.1819232, 0.3258144, -1.373991, 1, 1, 1, 1, 1,
-0.1818738, -0.5174834, -2.745015, 1, 1, 1, 1, 1,
-0.1785961, 1.096656, 0.8546668, 1, 1, 1, 1, 1,
-0.1711963, -1.020317, -1.76105, 1, 1, 1, 1, 1,
-0.1687347, 1.069424, 0.2418558, 1, 1, 1, 1, 1,
-0.1624586, -0.3463225, -2.42503, 1, 1, 1, 1, 1,
-0.1567295, -0.06118319, -1.366594, 1, 1, 1, 1, 1,
-0.1556179, 1.425563, 0.3342745, 1, 1, 1, 1, 1,
-0.1554718, -1.338137, -0.7403975, 1, 1, 1, 1, 1,
-0.1550798, -1.037797, -4.662208, 1, 1, 1, 1, 1,
-0.153618, 0.7048176, 0.3862091, 1, 1, 1, 1, 1,
-0.1528905, 0.2920142, -1.398147, 1, 1, 1, 1, 1,
-0.1497868, 0.572953, 1.413796, 1, 1, 1, 1, 1,
-0.1468298, 0.1753561, -0.5985068, 1, 1, 1, 1, 1,
-0.1427091, -0.5071213, -3.169399, 1, 1, 1, 1, 1,
-0.1420324, 0.07743402, -3.273377, 0, 0, 1, 1, 1,
-0.1391381, 0.06886602, -1.041015, 1, 0, 0, 1, 1,
-0.1366933, -0.2022648, -5.956615, 1, 0, 0, 1, 1,
-0.1259261, -0.6018607, -2.445771, 1, 0, 0, 1, 1,
-0.1256922, -1.36705, -0.973095, 1, 0, 0, 1, 1,
-0.1251386, -1.58037, -2.930555, 1, 0, 0, 1, 1,
-0.1237525, -0.04224155, -2.960863, 0, 0, 0, 1, 1,
-0.1234354, -0.2337319, -1.023783, 0, 0, 0, 1, 1,
-0.1214516, 0.8527111, 1.111343, 0, 0, 0, 1, 1,
-0.1211287, 0.8330565, 0.5435883, 0, 0, 0, 1, 1,
-0.1175385, 0.4055504, -0.603651, 0, 0, 0, 1, 1,
-0.1167692, -0.8370666, -1.783624, 0, 0, 0, 1, 1,
-0.1143466, 1.503436, 0.3148027, 0, 0, 0, 1, 1,
-0.1131825, -0.2647146, -1.900484, 1, 1, 1, 1, 1,
-0.1130998, 1.060724, -1.627808, 1, 1, 1, 1, 1,
-0.1044711, -1.314814, -2.043985, 1, 1, 1, 1, 1,
-0.1022032, 0.006755089, -1.011194, 1, 1, 1, 1, 1,
-0.101963, -0.7335534, -0.6300653, 1, 1, 1, 1, 1,
-0.1009547, 0.4451517, -0.8230407, 1, 1, 1, 1, 1,
-0.09884505, 0.7619749, -0.8783569, 1, 1, 1, 1, 1,
-0.09677794, 1.942599, -0.1310606, 1, 1, 1, 1, 1,
-0.09626848, 0.6451449, -0.1156979, 1, 1, 1, 1, 1,
-0.08736072, 0.5097646, -0.481583, 1, 1, 1, 1, 1,
-0.08600818, 0.4521441, -2.167447, 1, 1, 1, 1, 1,
-0.08488341, -2.616203, -2.0195, 1, 1, 1, 1, 1,
-0.08273653, 0.1643628, -1.646229, 1, 1, 1, 1, 1,
-0.07977063, 0.3141833, 0.3783237, 1, 1, 1, 1, 1,
-0.07785974, -0.09242039, -2.296995, 1, 1, 1, 1, 1,
-0.07469548, 0.8317872, 0.5783508, 0, 0, 1, 1, 1,
-0.07331569, -0.5518712, -3.439386, 1, 0, 0, 1, 1,
-0.06801034, -0.8180453, -4.322626, 1, 0, 0, 1, 1,
-0.06208295, -0.3421799, -2.742342, 1, 0, 0, 1, 1,
-0.05676939, 0.01797692, -1.067683, 1, 0, 0, 1, 1,
-0.05604888, -2.714202, -1.684332, 1, 0, 0, 1, 1,
-0.05533399, 0.6233329, 1.251556, 0, 0, 0, 1, 1,
-0.05435225, 0.9049555, 1.914877, 0, 0, 0, 1, 1,
-0.05433289, -0.2610577, -4.320186, 0, 0, 0, 1, 1,
-0.05025757, -0.3161305, -1.963261, 0, 0, 0, 1, 1,
-0.05007779, -0.6052927, -3.904855, 0, 0, 0, 1, 1,
-0.04973314, 0.7921838, 0.2233212, 0, 0, 0, 1, 1,
-0.04927433, 1.004341, 1.322803, 0, 0, 0, 1, 1,
-0.04686541, 0.08326773, -0.4074239, 1, 1, 1, 1, 1,
-0.04653315, 1.065457, 0.5074259, 1, 1, 1, 1, 1,
-0.04597748, 0.9950724, -0.7225891, 1, 1, 1, 1, 1,
-0.0449301, 0.4426739, -2.016938, 1, 1, 1, 1, 1,
-0.04474829, 0.5862092, 0.4066385, 1, 1, 1, 1, 1,
-0.04107519, 0.1060461, -1.721635, 1, 1, 1, 1, 1,
-0.04065363, -1.602224, -4.204018, 1, 1, 1, 1, 1,
-0.02862327, -1.379339, -3.016188, 1, 1, 1, 1, 1,
-0.02362542, -1.32703, -2.635046, 1, 1, 1, 1, 1,
-0.02176692, -0.4469641, -1.051008, 1, 1, 1, 1, 1,
-0.01689253, -0.6289677, -4.059408, 1, 1, 1, 1, 1,
-0.01451665, 0.4692474, 0.877142, 1, 1, 1, 1, 1,
-0.01242387, 0.7271933, -0.2032952, 1, 1, 1, 1, 1,
-0.01234155, -0.3014755, -0.6445292, 1, 1, 1, 1, 1,
-0.01234098, 0.04310914, -1.410239, 1, 1, 1, 1, 1,
-0.01035801, -0.1249815, -3.393434, 0, 0, 1, 1, 1,
-0.007486114, 1.35388, -1.089926, 1, 0, 0, 1, 1,
-0.006951561, 0.2921762, 0.09143196, 1, 0, 0, 1, 1,
-0.003577961, 0.602646, -0.6787435, 1, 0, 0, 1, 1,
-0.003040136, 0.2143767, 0.7079768, 1, 0, 0, 1, 1,
-0.002476363, -0.3515056, -4.313, 1, 0, 0, 1, 1,
0.00125429, -0.1474328, 2.914735, 0, 0, 0, 1, 1,
0.006526157, -0.992321, 3.13382, 0, 0, 0, 1, 1,
0.01081712, 0.7003513, -0.7515002, 0, 0, 0, 1, 1,
0.01087556, 0.6435149, -0.888804, 0, 0, 0, 1, 1,
0.01112041, 1.774791, 1.887112, 0, 0, 0, 1, 1,
0.01252184, 1.577056, -0.242586, 0, 0, 0, 1, 1,
0.01479935, -0.2170316, 2.914329, 0, 0, 0, 1, 1,
0.01492042, 0.1228906, 1.040405, 1, 1, 1, 1, 1,
0.01840862, 0.7962407, 0.899581, 1, 1, 1, 1, 1,
0.01930016, 1.026898, -1.196685, 1, 1, 1, 1, 1,
0.01937885, -0.7883199, 2.818389, 1, 1, 1, 1, 1,
0.0285938, -0.6598572, 2.714839, 1, 1, 1, 1, 1,
0.02983401, -0.02529012, 1.201397, 1, 1, 1, 1, 1,
0.0332161, -0.5913837, 3.605626, 1, 1, 1, 1, 1,
0.03429437, 1.239769, 2.27366, 1, 1, 1, 1, 1,
0.03748081, 0.736652, -0.3649686, 1, 1, 1, 1, 1,
0.04066287, 0.6287112, 0.4185301, 1, 1, 1, 1, 1,
0.05042705, 0.5391183, 0.183492, 1, 1, 1, 1, 1,
0.05105577, -0.01257586, 0.9459775, 1, 1, 1, 1, 1,
0.05182399, -0.5478162, 4.882345, 1, 1, 1, 1, 1,
0.05261975, -0.8096928, 1.349631, 1, 1, 1, 1, 1,
0.05343004, -0.3658943, 2.984159, 1, 1, 1, 1, 1,
0.0537664, 1.700149, -0.05075903, 0, 0, 1, 1, 1,
0.06862876, 0.7313038, 1.341141, 1, 0, 0, 1, 1,
0.07183551, -0.5326267, 0.06483047, 1, 0, 0, 1, 1,
0.07383873, 1.540375, -0.8266637, 1, 0, 0, 1, 1,
0.07413544, -0.5747035, 2.305264, 1, 0, 0, 1, 1,
0.07414158, -2.100087, 5.654062, 1, 0, 0, 1, 1,
0.07575, -0.6428466, 2.565432, 0, 0, 0, 1, 1,
0.07585736, 0.8284755, 0.09794154, 0, 0, 0, 1, 1,
0.08039033, -0.8721459, 4.175837, 0, 0, 0, 1, 1,
0.08082123, 1.432551, 0.2533797, 0, 0, 0, 1, 1,
0.08271691, 1.142995, 1.039255, 0, 0, 0, 1, 1,
0.0852921, -0.2279876, 2.67897, 0, 0, 0, 1, 1,
0.08671069, 0.3142478, 1.815951, 0, 0, 0, 1, 1,
0.08903238, -0.3991221, 2.419464, 1, 1, 1, 1, 1,
0.09581301, -1.280964, 2.141849, 1, 1, 1, 1, 1,
0.09739409, -0.5165492, 3.454559, 1, 1, 1, 1, 1,
0.1043929, 1.756928, 0.2748854, 1, 1, 1, 1, 1,
0.1062089, 1.286759, 1.499241, 1, 1, 1, 1, 1,
0.1083963, -0.807953, 2.708493, 1, 1, 1, 1, 1,
0.1089609, 0.7820596, 2.694907, 1, 1, 1, 1, 1,
0.1097002, -1.026063, 2.458803, 1, 1, 1, 1, 1,
0.1128782, -1.705093, 1.488321, 1, 1, 1, 1, 1,
0.1156137, -0.7944614, 1.859044, 1, 1, 1, 1, 1,
0.1166917, -1.971564, 2.311999, 1, 1, 1, 1, 1,
0.1190216, 0.2130271, 1.221106, 1, 1, 1, 1, 1,
0.1219678, -2.451998, 1.712706, 1, 1, 1, 1, 1,
0.1235153, -3.994643, 3.43617, 1, 1, 1, 1, 1,
0.1269573, 1.297515, 0.1689978, 1, 1, 1, 1, 1,
0.1276762, 1.425507, -2.755547, 0, 0, 1, 1, 1,
0.129658, -0.07569756, 2.749648, 1, 0, 0, 1, 1,
0.1408643, 1.583299, -0.4326795, 1, 0, 0, 1, 1,
0.1415997, 0.1251121, 0.3235948, 1, 0, 0, 1, 1,
0.1421816, -1.287753, 3.607057, 1, 0, 0, 1, 1,
0.1423535, -1.338629, 3.015568, 1, 0, 0, 1, 1,
0.1429574, 0.7033774, 0.4884053, 0, 0, 0, 1, 1,
0.1501727, 0.4100908, -0.08619069, 0, 0, 0, 1, 1,
0.1532366, -0.4214061, 3.757202, 0, 0, 0, 1, 1,
0.1533834, -0.4683691, 1.761868, 0, 0, 0, 1, 1,
0.1545468, 0.9676253, 1.624611, 0, 0, 0, 1, 1,
0.1588898, 1.32494, -0.6578841, 0, 0, 0, 1, 1,
0.1596767, 1.146626, 1.547977, 0, 0, 0, 1, 1,
0.1618629, -1.768963, 2.626805, 1, 1, 1, 1, 1,
0.1675301, -1.638722, 3.7364, 1, 1, 1, 1, 1,
0.1685018, -0.4133493, 2.346109, 1, 1, 1, 1, 1,
0.1692513, 0.6657945, 1.390437, 1, 1, 1, 1, 1,
0.169283, -1.513932, 4.83072, 1, 1, 1, 1, 1,
0.1706713, -0.2339596, 3.314954, 1, 1, 1, 1, 1,
0.1747172, -0.01018158, 3.4028, 1, 1, 1, 1, 1,
0.1753615, -0.5635365, 2.852885, 1, 1, 1, 1, 1,
0.1756613, -0.01243031, 2.55541, 1, 1, 1, 1, 1,
0.1757388, -1.368798, 4.397397, 1, 1, 1, 1, 1,
0.1762269, -0.2004361, 2.02508, 1, 1, 1, 1, 1,
0.1838624, -0.2158458, 0.8916534, 1, 1, 1, 1, 1,
0.1841528, 0.4711223, 0.2474623, 1, 1, 1, 1, 1,
0.184748, -0.1689334, 2.148048, 1, 1, 1, 1, 1,
0.1851433, -0.2232874, 1.758928, 1, 1, 1, 1, 1,
0.1891636, 0.5116776, 0.5179472, 0, 0, 1, 1, 1,
0.195701, 1.64238, -1.087847, 1, 0, 0, 1, 1,
0.1959687, -0.5051403, 3.123942, 1, 0, 0, 1, 1,
0.1959791, 0.426214, 1.540249, 1, 0, 0, 1, 1,
0.1979509, 0.8662098, 0.1176294, 1, 0, 0, 1, 1,
0.1987152, -0.4484909, 2.062944, 1, 0, 0, 1, 1,
0.1998251, -1.549825, 2.911155, 0, 0, 0, 1, 1,
0.202343, -0.1078394, 1.724028, 0, 0, 0, 1, 1,
0.2031157, -0.1001184, 1.533398, 0, 0, 0, 1, 1,
0.203558, -0.6689731, 1.611574, 0, 0, 0, 1, 1,
0.2116287, -1.023353, 2.057663, 0, 0, 0, 1, 1,
0.2120363, -1.694127, 2.492104, 0, 0, 0, 1, 1,
0.2153211, -0.1943393, 1.547561, 0, 0, 0, 1, 1,
0.2156269, 0.8477511, 0.1283721, 1, 1, 1, 1, 1,
0.2181013, -0.7574642, 2.331389, 1, 1, 1, 1, 1,
0.2210437, -0.4332785, 4.377597, 1, 1, 1, 1, 1,
0.2261394, -0.1625875, 3.574486, 1, 1, 1, 1, 1,
0.2328281, 1.481766, 1.093488, 1, 1, 1, 1, 1,
0.2381643, 0.1452791, 0.675472, 1, 1, 1, 1, 1,
0.2387252, -0.04562436, 0.6130765, 1, 1, 1, 1, 1,
0.2410009, 0.5810375, 0.1349175, 1, 1, 1, 1, 1,
0.2436254, -1.055311, 1.494927, 1, 1, 1, 1, 1,
0.245682, -0.423837, 0.9619747, 1, 1, 1, 1, 1,
0.2490416, -1.10319, 2.849045, 1, 1, 1, 1, 1,
0.2530987, 0.6766143, -2.008155, 1, 1, 1, 1, 1,
0.2536469, -0.8815608, 2.075923, 1, 1, 1, 1, 1,
0.2537054, -0.4096245, 2.703184, 1, 1, 1, 1, 1,
0.2538025, -0.213363, 1.811441, 1, 1, 1, 1, 1,
0.2544271, -1.622781, 2.463415, 0, 0, 1, 1, 1,
0.2556962, 2.423983, 0.1471975, 1, 0, 0, 1, 1,
0.2563078, -0.8525054, 3.164256, 1, 0, 0, 1, 1,
0.2597461, -0.9243878, 2.924554, 1, 0, 0, 1, 1,
0.2706773, 1.119052, 1.73623, 1, 0, 0, 1, 1,
0.2780028, -0.3027272, 4.157976, 1, 0, 0, 1, 1,
0.2795542, 1.237287, 0.3110544, 0, 0, 0, 1, 1,
0.2880754, -1.315187, 4.67671, 0, 0, 0, 1, 1,
0.2902453, -0.5523952, 3.810579, 0, 0, 0, 1, 1,
0.2923211, 0.01806056, 1.390044, 0, 0, 0, 1, 1,
0.3010758, -1.112079, 2.679713, 0, 0, 0, 1, 1,
0.3032321, -0.4809231, 2.468643, 0, 0, 0, 1, 1,
0.3056774, -0.8047282, 3.527305, 0, 0, 0, 1, 1,
0.3067543, 1.815529, 0.8535148, 1, 1, 1, 1, 1,
0.3071277, 0.4969377, -0.5206729, 1, 1, 1, 1, 1,
0.3072774, -0.7851542, 2.881681, 1, 1, 1, 1, 1,
0.307444, 0.2430056, 1.65261, 1, 1, 1, 1, 1,
0.3096147, 1.308223, -0.1562207, 1, 1, 1, 1, 1,
0.3163387, -0.42957, 4.040172, 1, 1, 1, 1, 1,
0.3179091, 0.03036026, 1.51933, 1, 1, 1, 1, 1,
0.318081, 0.7320299, 0.9722056, 1, 1, 1, 1, 1,
0.3268093, -1.644535, 3.140709, 1, 1, 1, 1, 1,
0.3311194, -0.05585273, 3.006754, 1, 1, 1, 1, 1,
0.3369791, 0.3726497, -0.07225946, 1, 1, 1, 1, 1,
0.3509338, -0.6775309, 2.202311, 1, 1, 1, 1, 1,
0.3524431, -0.1352239, 1.485393, 1, 1, 1, 1, 1,
0.3547083, 0.2932275, 1.475004, 1, 1, 1, 1, 1,
0.3550512, -1.046351, 2.674278, 1, 1, 1, 1, 1,
0.355729, -0.3430702, 2.758621, 0, 0, 1, 1, 1,
0.3610545, 1.068911, 0.3566211, 1, 0, 0, 1, 1,
0.36309, -1.618559, 2.921661, 1, 0, 0, 1, 1,
0.3663719, -0.802182, 2.11082, 1, 0, 0, 1, 1,
0.36887, 0.8300847, -0.5604219, 1, 0, 0, 1, 1,
0.3755842, 0.9492733, -0.7981664, 1, 0, 0, 1, 1,
0.3758116, -0.6625237, 3.690564, 0, 0, 0, 1, 1,
0.37803, -0.1715367, 1.692369, 0, 0, 0, 1, 1,
0.379707, -0.2198456, 2.304068, 0, 0, 0, 1, 1,
0.3816803, 1.038708, 0.4663524, 0, 0, 0, 1, 1,
0.3835356, -1.230983, 2.299704, 0, 0, 0, 1, 1,
0.3849015, -0.9632989, 1.268089, 0, 0, 0, 1, 1,
0.3878181, -0.9375136, 3.91729, 0, 0, 0, 1, 1,
0.3897353, -0.9926447, 3.33244, 1, 1, 1, 1, 1,
0.3907933, 0.02538057, 0.9946666, 1, 1, 1, 1, 1,
0.3928718, 1.026982, 0.2858704, 1, 1, 1, 1, 1,
0.3933374, -0.7361013, 0.5637684, 1, 1, 1, 1, 1,
0.3991742, -0.3596889, 1.77391, 1, 1, 1, 1, 1,
0.3998559, 1.349162, 0.7832178, 1, 1, 1, 1, 1,
0.4028006, -0.9536595, 3.306533, 1, 1, 1, 1, 1,
0.4043243, -0.5095552, 1.475139, 1, 1, 1, 1, 1,
0.4047441, 0.7174401, 1.918363, 1, 1, 1, 1, 1,
0.4057514, -0.3752936, 3.301835, 1, 1, 1, 1, 1,
0.4058589, 1.865369, -0.3425603, 1, 1, 1, 1, 1,
0.4065939, -0.5598262, 0.7450539, 1, 1, 1, 1, 1,
0.4075116, -1.068204, 1.637349, 1, 1, 1, 1, 1,
0.4117234, -2.190382, 4.686771, 1, 1, 1, 1, 1,
0.4252006, 1.903811, 1.461765, 1, 1, 1, 1, 1,
0.429519, 0.1535671, 0.3698047, 0, 0, 1, 1, 1,
0.4342144, -0.01176901, 1.913441, 1, 0, 0, 1, 1,
0.4351223, -2.603053, 2.828166, 1, 0, 0, 1, 1,
0.4358423, 0.9461298, -0.1909844, 1, 0, 0, 1, 1,
0.4358549, -1.401197, 4.490416, 1, 0, 0, 1, 1,
0.4406212, 1.219398, 0.4591973, 1, 0, 0, 1, 1,
0.4460582, -0.1152048, 1.682808, 0, 0, 0, 1, 1,
0.4470104, 0.5277597, 0.07015982, 0, 0, 0, 1, 1,
0.4479615, -0.2779821, 2.817119, 0, 0, 0, 1, 1,
0.450395, -2.253203, 1.070342, 0, 0, 0, 1, 1,
0.4514947, -1.20318, 2.693598, 0, 0, 0, 1, 1,
0.455213, -0.2103656, 0.9558131, 0, 0, 0, 1, 1,
0.4572582, 0.8060146, 0.6862851, 0, 0, 0, 1, 1,
0.4587718, 0.5800033, 0.2406409, 1, 1, 1, 1, 1,
0.4618121, 0.06295705, 2.227214, 1, 1, 1, 1, 1,
0.4625247, -1.231274, 1.595218, 1, 1, 1, 1, 1,
0.4626176, -0.3816773, 3.955425, 1, 1, 1, 1, 1,
0.4632741, 0.08061289, 1.48627, 1, 1, 1, 1, 1,
0.465749, -0.6823643, 3.355158, 1, 1, 1, 1, 1,
0.4692518, -0.8635509, 3.695824, 1, 1, 1, 1, 1,
0.4729688, -1.916328, 3.420568, 1, 1, 1, 1, 1,
0.4749093, 0.2559133, 3.270698, 1, 1, 1, 1, 1,
0.4749942, 1.275628, -1.685885, 1, 1, 1, 1, 1,
0.4823191, -0.7664042, 2.356062, 1, 1, 1, 1, 1,
0.4850004, -0.1367549, 2.90601, 1, 1, 1, 1, 1,
0.4854166, -0.4153711, 1.737464, 1, 1, 1, 1, 1,
0.4861546, -0.887802, 2.246608, 1, 1, 1, 1, 1,
0.4862467, 0.5764024, 3.297077, 1, 1, 1, 1, 1,
0.4868042, -0.4570492, 2.814415, 0, 0, 1, 1, 1,
0.4940233, 0.4186555, 1.633309, 1, 0, 0, 1, 1,
0.4952559, -0.1308682, 2.285419, 1, 0, 0, 1, 1,
0.496179, -0.07132123, 0.8079653, 1, 0, 0, 1, 1,
0.4976489, -1.550613, 2.221706, 1, 0, 0, 1, 1,
0.4991944, 0.4956371, 1.104322, 1, 0, 0, 1, 1,
0.4995877, 0.6597505, 0.9393908, 0, 0, 0, 1, 1,
0.5062538, 0.9445193, -0.8753334, 0, 0, 0, 1, 1,
0.5158164, 0.3960359, 0.7337312, 0, 0, 0, 1, 1,
0.5182097, -0.7728593, 2.178378, 0, 0, 0, 1, 1,
0.5228664, 0.4331381, 2.861779, 0, 0, 0, 1, 1,
0.5273015, 0.8104668, -0.1663041, 0, 0, 0, 1, 1,
0.5305313, 1.090032, 0.3796883, 0, 0, 0, 1, 1,
0.5353638, -0.1510139, 1.334915, 1, 1, 1, 1, 1,
0.5407653, 0.07691653, 2.170625, 1, 1, 1, 1, 1,
0.5440516, -0.5590378, 1.391696, 1, 1, 1, 1, 1,
0.5441612, -0.08818032, 2.673093, 1, 1, 1, 1, 1,
0.5444148, 0.2953112, 0.7349642, 1, 1, 1, 1, 1,
0.5455713, 0.05457812, 2.14403, 1, 1, 1, 1, 1,
0.5476812, -0.3076158, 0.6920508, 1, 1, 1, 1, 1,
0.5509703, 0.04328353, 1.88976, 1, 1, 1, 1, 1,
0.5544819, -0.1827034, 2.464539, 1, 1, 1, 1, 1,
0.5620553, -1.515385, 1.09123, 1, 1, 1, 1, 1,
0.5736576, 1.157187, 0.692265, 1, 1, 1, 1, 1,
0.5774353, -1.330344, 1.479525, 1, 1, 1, 1, 1,
0.5796683, -0.3698347, 1.206198, 1, 1, 1, 1, 1,
0.5892244, -1.401631, 1.99536, 1, 1, 1, 1, 1,
0.5895745, -0.4313933, 0.9291999, 1, 1, 1, 1, 1,
0.5908132, -0.6594557, 3.049003, 0, 0, 1, 1, 1,
0.6070814, -0.9514754, 1.789989, 1, 0, 0, 1, 1,
0.6107142, 1.299388, 1.119419, 1, 0, 0, 1, 1,
0.6114752, -0.2766952, 2.154344, 1, 0, 0, 1, 1,
0.6162615, 1.672611, 1.535369, 1, 0, 0, 1, 1,
0.6166037, -1.641363, 2.227892, 1, 0, 0, 1, 1,
0.6171303, 0.3483668, 0.8483076, 0, 0, 0, 1, 1,
0.6204313, 0.7849337, 1.412921, 0, 0, 0, 1, 1,
0.6361403, -0.9759122, 1.522905, 0, 0, 0, 1, 1,
0.6388602, 1.467024, 0.1733197, 0, 0, 0, 1, 1,
0.6408448, 0.4441912, 1.800467, 0, 0, 0, 1, 1,
0.6426947, -0.1325909, 1.713732, 0, 0, 0, 1, 1,
0.6492649, -0.6741993, 4.192972, 0, 0, 0, 1, 1,
0.6529622, -0.8856105, 1.541665, 1, 1, 1, 1, 1,
0.6637212, -1.669596, 2.608654, 1, 1, 1, 1, 1,
0.6638981, -3.012431, 1.599203, 1, 1, 1, 1, 1,
0.6658427, 1.140081, -0.1658084, 1, 1, 1, 1, 1,
0.667459, -0.4309125, 1.158192, 1, 1, 1, 1, 1,
0.6684314, 0.8316085, -0.1200376, 1, 1, 1, 1, 1,
0.6710733, -0.8914459, 1.610302, 1, 1, 1, 1, 1,
0.6740723, -0.6851174, 2.508643, 1, 1, 1, 1, 1,
0.6740927, 1.127337, 0.9841531, 1, 1, 1, 1, 1,
0.6769664, 0.9175195, 1.247942, 1, 1, 1, 1, 1,
0.6825746, -1.181531, 2.158207, 1, 1, 1, 1, 1,
0.6858346, -1.690934, 2.12685, 1, 1, 1, 1, 1,
0.6917674, 0.3122318, 1.634779, 1, 1, 1, 1, 1,
0.7004467, -0.2100718, 3.166462, 1, 1, 1, 1, 1,
0.702666, 0.434606, -0.2647161, 1, 1, 1, 1, 1,
0.708047, -1.08884, 1.785807, 0, 0, 1, 1, 1,
0.7105813, -0.9216339, 2.046053, 1, 0, 0, 1, 1,
0.7107617, 0.1081383, 2.086426, 1, 0, 0, 1, 1,
0.7119254, -1.060241, 3.348043, 1, 0, 0, 1, 1,
0.712289, 0.9940928, -0.5668303, 1, 0, 0, 1, 1,
0.7172225, 0.2625958, 1.22092, 1, 0, 0, 1, 1,
0.7263153, -1.639225, 4.812185, 0, 0, 0, 1, 1,
0.7272138, -0.1608049, 0.7965789, 0, 0, 0, 1, 1,
0.7273801, -0.4348561, 1.553752, 0, 0, 0, 1, 1,
0.7308189, -1.074693, 1.771508, 0, 0, 0, 1, 1,
0.7414417, -1.25855, 2.475696, 0, 0, 0, 1, 1,
0.7415119, 1.150233, 1.224795, 0, 0, 0, 1, 1,
0.7463863, -2.474301, 2.747077, 0, 0, 0, 1, 1,
0.7481424, -0.6842134, 2.105084, 1, 1, 1, 1, 1,
0.751258, 0.3297275, 2.695116, 1, 1, 1, 1, 1,
0.7536426, 0.505443, 0.5077597, 1, 1, 1, 1, 1,
0.7547469, 0.5938617, 1.320257, 1, 1, 1, 1, 1,
0.7569691, -0.2552749, 1.654802, 1, 1, 1, 1, 1,
0.7596639, -1.635401, 2.206719, 1, 1, 1, 1, 1,
0.7849446, -1.331305, 3.618662, 1, 1, 1, 1, 1,
0.7855754, -0.2185113, 1.231768, 1, 1, 1, 1, 1,
0.7860698, -1.295004, 3.518117, 1, 1, 1, 1, 1,
0.7870039, 0.0567873, 0.6273878, 1, 1, 1, 1, 1,
0.7873892, 0.3170792, 1.503037, 1, 1, 1, 1, 1,
0.7882967, -0.8187029, 2.546793, 1, 1, 1, 1, 1,
0.7926059, -1.560865, 2.064782, 1, 1, 1, 1, 1,
0.8005167, 0.8274556, 1.873617, 1, 1, 1, 1, 1,
0.8009107, 1.620939, 0.8952773, 1, 1, 1, 1, 1,
0.8029857, 0.2640228, 1.921818, 0, 0, 1, 1, 1,
0.8041792, 2.217215, -0.8412955, 1, 0, 0, 1, 1,
0.8048094, 0.2111036, 1.586811, 1, 0, 0, 1, 1,
0.8049444, -1.112103, 4.562805, 1, 0, 0, 1, 1,
0.8055047, -0.1670851, 2.915602, 1, 0, 0, 1, 1,
0.8097305, -1.39179, 2.185594, 1, 0, 0, 1, 1,
0.8104191, 0.3609475, -0.1229782, 0, 0, 0, 1, 1,
0.8211311, -1.270702, 1.609128, 0, 0, 0, 1, 1,
0.8227556, 0.9218332, 0.7010804, 0, 0, 0, 1, 1,
0.8269706, 0.1858533, 0.23464, 0, 0, 0, 1, 1,
0.8314939, 2.924838, -0.1676645, 0, 0, 0, 1, 1,
0.8376849, 1.049311, -0.491368, 0, 0, 0, 1, 1,
0.8392997, 0.559351, 0.6155576, 0, 0, 0, 1, 1,
0.8433833, -0.5657348, 3.051466, 1, 1, 1, 1, 1,
0.8435225, 0.2053222, -0.5914571, 1, 1, 1, 1, 1,
0.8631307, 2.27811, -1.66767, 1, 1, 1, 1, 1,
0.870124, -0.0913142, 1.396549, 1, 1, 1, 1, 1,
0.8784652, -0.8226048, 2.008806, 1, 1, 1, 1, 1,
0.8793343, 0.6808802, 0.0822251, 1, 1, 1, 1, 1,
0.8881947, 1.103869, -0.1019245, 1, 1, 1, 1, 1,
0.8958008, 1.745881, 0.9981919, 1, 1, 1, 1, 1,
0.9022333, -0.3989989, 1.615226, 1, 1, 1, 1, 1,
0.9079642, -0.7657241, 2.772073, 1, 1, 1, 1, 1,
0.931668, 1.781567, 0.4013734, 1, 1, 1, 1, 1,
0.9327824, -0.4130755, 1.927513, 1, 1, 1, 1, 1,
0.9332148, -0.529111, 3.364072, 1, 1, 1, 1, 1,
0.9337917, -0.9319591, 1.609077, 1, 1, 1, 1, 1,
0.9375001, -0.3359611, 1.796682, 1, 1, 1, 1, 1,
0.9476998, 1.021578, 1.734996, 0, 0, 1, 1, 1,
0.9522287, 0.6858925, 0.1716901, 1, 0, 0, 1, 1,
0.9604129, -2.147696, 2.620363, 1, 0, 0, 1, 1,
0.9699948, -0.5655452, 0.6643119, 1, 0, 0, 1, 1,
0.9779684, -0.05895767, 2.413944, 1, 0, 0, 1, 1,
0.980057, -1.030094, 1.9758, 1, 0, 0, 1, 1,
0.9818031, 0.2344816, 1.355714, 0, 0, 0, 1, 1,
0.9840657, -0.02019335, 0.1725716, 0, 0, 0, 1, 1,
0.993697, 1.93206, -0.4046843, 0, 0, 0, 1, 1,
1.004065, -0.2190111, 3.528289, 0, 0, 0, 1, 1,
1.00863, 1.107247, 0.7274057, 0, 0, 0, 1, 1,
1.0125, 0.6842098, 2.126177, 0, 0, 0, 1, 1,
1.014341, 0.7324235, 0.7099678, 0, 0, 0, 1, 1,
1.015064, 0.4811427, 0.2749763, 1, 1, 1, 1, 1,
1.016911, -0.35253, 1.105017, 1, 1, 1, 1, 1,
1.018286, 0.1023025, 0.7948721, 1, 1, 1, 1, 1,
1.019491, 0.1382991, 0.01134468, 1, 1, 1, 1, 1,
1.024058, -0.1356367, 0.6914767, 1, 1, 1, 1, 1,
1.025024, 1.411103, 1.782517, 1, 1, 1, 1, 1,
1.03342, 1.425124, 0.998199, 1, 1, 1, 1, 1,
1.036536, 1.46721, 0.7819052, 1, 1, 1, 1, 1,
1.036682, -0.1008383, 0.3666813, 1, 1, 1, 1, 1,
1.039624, -0.7861372, 1.285796, 1, 1, 1, 1, 1,
1.040341, 0.4931694, 1.418023, 1, 1, 1, 1, 1,
1.04414, 0.3117301, 3.223339, 1, 1, 1, 1, 1,
1.046626, -0.3969998, 0.1828589, 1, 1, 1, 1, 1,
1.047468, -0.672636, 0.5577672, 1, 1, 1, 1, 1,
1.061315, 1.210584, 0.09347969, 1, 1, 1, 1, 1,
1.064188, -0.1017411, 0.7367064, 0, 0, 1, 1, 1,
1.066473, 0.02946006, 2.787483, 1, 0, 0, 1, 1,
1.066643, -1.041175, 2.582566, 1, 0, 0, 1, 1,
1.067168, -1.468615, 1.058012, 1, 0, 0, 1, 1,
1.068323, -0.04127854, 0.5824146, 1, 0, 0, 1, 1,
1.073581, 0.356477, 1.225283, 1, 0, 0, 1, 1,
1.075554, -1.213251, 3.293205, 0, 0, 0, 1, 1,
1.079109, -0.3040487, 2.015539, 0, 0, 0, 1, 1,
1.082051, -0.4980978, 0.5091894, 0, 0, 0, 1, 1,
1.100018, 1.918026, 0.9560549, 0, 0, 0, 1, 1,
1.104315, -0.1262819, 2.843885, 0, 0, 0, 1, 1,
1.106172, 0.3353689, 0.1337819, 0, 0, 0, 1, 1,
1.116102, 1.872313, -0.3347406, 0, 0, 0, 1, 1,
1.116885, -1.408148, 1.158632, 1, 1, 1, 1, 1,
1.121347, -1.128191, 3.901444, 1, 1, 1, 1, 1,
1.121991, -0.7568673, 1.875455, 1, 1, 1, 1, 1,
1.12946, 0.6977473, 0.2746916, 1, 1, 1, 1, 1,
1.130625, -1.338374, 2.894381, 1, 1, 1, 1, 1,
1.131479, -1.192059, 1.360078, 1, 1, 1, 1, 1,
1.14502, 0.2776282, 1.444371, 1, 1, 1, 1, 1,
1.14816, -0.1089092, 1.040165, 1, 1, 1, 1, 1,
1.149841, -0.166872, 0.5263075, 1, 1, 1, 1, 1,
1.167427, -1.37848, 3.866736, 1, 1, 1, 1, 1,
1.170644, 0.860664, 2.246318, 1, 1, 1, 1, 1,
1.174543, 2.446986, -0.2833119, 1, 1, 1, 1, 1,
1.174852, -1.483746, 2.711718, 1, 1, 1, 1, 1,
1.175621, 0.1436249, 2.234291, 1, 1, 1, 1, 1,
1.179594, 2.323232, -0.7757046, 1, 1, 1, 1, 1,
1.182502, -1.610343, 3.970955, 0, 0, 1, 1, 1,
1.183693, -0.6700507, 2.906012, 1, 0, 0, 1, 1,
1.186971, -0.5279326, 1.612154, 1, 0, 0, 1, 1,
1.188064, -0.7501915, 1.657906, 1, 0, 0, 1, 1,
1.189444, 0.7660441, -0.1022599, 1, 0, 0, 1, 1,
1.192761, -1.265163, 1.687717, 1, 0, 0, 1, 1,
1.196909, -2.106707, 0.4588206, 0, 0, 0, 1, 1,
1.197271, -1.780323, 2.364436, 0, 0, 0, 1, 1,
1.200767, -0.09247539, 0.948307, 0, 0, 0, 1, 1,
1.205492, 0.6249768, 3.569891, 0, 0, 0, 1, 1,
1.21668, -0.6261551, 3.236465, 0, 0, 0, 1, 1,
1.222403, -1.030305, 1.992143, 0, 0, 0, 1, 1,
1.225208, -0.7467319, 2.036557, 0, 0, 0, 1, 1,
1.229888, 0.1834739, 2.325681, 1, 1, 1, 1, 1,
1.231333, -0.6721272, 0.7982109, 1, 1, 1, 1, 1,
1.23327, -0.7162513, 3.122936, 1, 1, 1, 1, 1,
1.235267, 1.041165, 1.203462, 1, 1, 1, 1, 1,
1.261198, -2.181908, 1.782377, 1, 1, 1, 1, 1,
1.264982, 0.1195949, 0.7186854, 1, 1, 1, 1, 1,
1.275415, -1.174248, -0.7520242, 1, 1, 1, 1, 1,
1.277794, -0.1265697, 2.997705, 1, 1, 1, 1, 1,
1.280496, 0.9004532, 1.769349, 1, 1, 1, 1, 1,
1.281687, -0.7667965, 1.473124, 1, 1, 1, 1, 1,
1.283436, 2.438953, 0.7436255, 1, 1, 1, 1, 1,
1.283805, -0.4924324, 1.704754, 1, 1, 1, 1, 1,
1.288304, 0.2864601, 1.414317, 1, 1, 1, 1, 1,
1.293588, -0.9196826, 0.502315, 1, 1, 1, 1, 1,
1.296099, 0.3968142, 1.636307, 1, 1, 1, 1, 1,
1.300066, 0.7192867, 2.480376, 0, 0, 1, 1, 1,
1.313429, 0.8241811, 0.7228861, 1, 0, 0, 1, 1,
1.314679, 0.9128259, 0.1298384, 1, 0, 0, 1, 1,
1.316526, -1.022317, 3.181291, 1, 0, 0, 1, 1,
1.321103, 1.616326, -0.6313979, 1, 0, 0, 1, 1,
1.321261, -0.5420873, 1.245752, 1, 0, 0, 1, 1,
1.3226, 0.1382543, 2.957383, 0, 0, 0, 1, 1,
1.324541, -1.71546, 2.232594, 0, 0, 0, 1, 1,
1.329115, -1.1009, 2.533417, 0, 0, 0, 1, 1,
1.331696, -0.3476138, 0.6389967, 0, 0, 0, 1, 1,
1.3322, 0.4189737, 1.228639, 0, 0, 0, 1, 1,
1.332323, 1.138613, 1.248791, 0, 0, 0, 1, 1,
1.334893, -1.060585, 2.688118, 0, 0, 0, 1, 1,
1.335672, 1.35302, 3.547704, 1, 1, 1, 1, 1,
1.346744, -0.8995484, 1.437699, 1, 1, 1, 1, 1,
1.354243, 0.3428006, 2.085285, 1, 1, 1, 1, 1,
1.368638, -0.1928682, 1.818271, 1, 1, 1, 1, 1,
1.372181, 1.030274, 0.05190852, 1, 1, 1, 1, 1,
1.37342, -0.802722, 1.588975, 1, 1, 1, 1, 1,
1.378774, -0.5429678, 0.4349539, 1, 1, 1, 1, 1,
1.379942, 0.03300559, 2.768106, 1, 1, 1, 1, 1,
1.387609, -0.8599501, 1.482305, 1, 1, 1, 1, 1,
1.38873, 0.7615162, 1.12191, 1, 1, 1, 1, 1,
1.393399, -1.269856, 2.365448, 1, 1, 1, 1, 1,
1.398285, -1.557402, 1.197253, 1, 1, 1, 1, 1,
1.412082, 0.2018533, 1.637611, 1, 1, 1, 1, 1,
1.424953, -0.7723647, 1.211342, 1, 1, 1, 1, 1,
1.426505, -0.04381029, 3.71264, 1, 1, 1, 1, 1,
1.428282, 0.7354448, 1.82298, 0, 0, 1, 1, 1,
1.43078, 0.7632498, -0.3714246, 1, 0, 0, 1, 1,
1.432463, -0.2264363, 0.4932903, 1, 0, 0, 1, 1,
1.434196, 0.9278096, -1.521547, 1, 0, 0, 1, 1,
1.44003, 0.8550707, 1.518513, 1, 0, 0, 1, 1,
1.440405, -0.6868493, 1.830368, 1, 0, 0, 1, 1,
1.444067, 1.703262, 1.613084, 0, 0, 0, 1, 1,
1.445019, 0.2400588, 1.559204, 0, 0, 0, 1, 1,
1.447989, 0.3671384, 1.953622, 0, 0, 0, 1, 1,
1.461666, 0.8765462, 2.611638, 0, 0, 0, 1, 1,
1.468572, -1.316499, 1.295246, 0, 0, 0, 1, 1,
1.468587, -0.4185072, 2.48367, 0, 0, 0, 1, 1,
1.475639, 0.4715441, 0.1726684, 0, 0, 0, 1, 1,
1.489996, -1.717581, 2.283102, 1, 1, 1, 1, 1,
1.499176, -0.1194664, 2.183069, 1, 1, 1, 1, 1,
1.505029, 2.314314, -0.02784414, 1, 1, 1, 1, 1,
1.507846, -0.2426634, 2.145492, 1, 1, 1, 1, 1,
1.514159, 1.736903, 1.289208, 1, 1, 1, 1, 1,
1.517081, -0.6974871, 1.86955, 1, 1, 1, 1, 1,
1.522294, -0.1127001, 1.942587, 1, 1, 1, 1, 1,
1.52892, 0.2118753, -0.2429965, 1, 1, 1, 1, 1,
1.531543, 1.573792, 1.204604, 1, 1, 1, 1, 1,
1.534513, -0.4949793, 0.8212424, 1, 1, 1, 1, 1,
1.548255, 0.5316222, 0.910135, 1, 1, 1, 1, 1,
1.556816, -0.5143684, 1.556846, 1, 1, 1, 1, 1,
1.568652, 0.1435594, 1.901242, 1, 1, 1, 1, 1,
1.579088, -0.6151114, 2.019596, 1, 1, 1, 1, 1,
1.586295, 0.2614062, 2.502192, 1, 1, 1, 1, 1,
1.588948, -1.139123, 0.8323512, 0, 0, 1, 1, 1,
1.615047, 0.01313142, 1.341757, 1, 0, 0, 1, 1,
1.617036, -0.6676341, 1.335928, 1, 0, 0, 1, 1,
1.625704, 0.8217536, 1.389383, 1, 0, 0, 1, 1,
1.656188, -0.7793747, 3.014074, 1, 0, 0, 1, 1,
1.670591, 1.438301, 2.02667, 1, 0, 0, 1, 1,
1.683722, 2.01, -0.3268183, 0, 0, 0, 1, 1,
1.706341, -0.182566, 0.1919821, 0, 0, 0, 1, 1,
1.708114, 1.215474, 2.260449, 0, 0, 0, 1, 1,
1.721641, -0.649353, 1.450432, 0, 0, 0, 1, 1,
1.741154, -1.572291, 1.807148, 0, 0, 0, 1, 1,
1.778798, -0.4915743, 1.577606, 0, 0, 0, 1, 1,
1.779609, -1.575454, 2.063142, 0, 0, 0, 1, 1,
1.781536, -0.7169451, 2.000999, 1, 1, 1, 1, 1,
1.787489, 1.35077, 1.184344, 1, 1, 1, 1, 1,
1.800984, 2.627827, 1.853786, 1, 1, 1, 1, 1,
1.804937, -1.285725, 2.957963, 1, 1, 1, 1, 1,
1.823789, -0.713, 1.938809, 1, 1, 1, 1, 1,
1.856373, 0.2513277, 0.5632588, 1, 1, 1, 1, 1,
1.867643, -1.016245, 2.374811, 1, 1, 1, 1, 1,
1.879151, 1.312421, 1.297031, 1, 1, 1, 1, 1,
1.881864, 1.097526, 1.988686, 1, 1, 1, 1, 1,
1.895294, 0.2426862, 1.357755, 1, 1, 1, 1, 1,
1.904095, -1.372439, 1.184901, 1, 1, 1, 1, 1,
1.929361, -2.222603, -0.7060278, 1, 1, 1, 1, 1,
1.932267, 1.408959, 0.2398648, 1, 1, 1, 1, 1,
1.950984, -0.2404988, 0.4477392, 1, 1, 1, 1, 1,
1.960401, -0.1200389, 1.758525, 1, 1, 1, 1, 1,
2.066957, 1.129056, 1.004325, 0, 0, 1, 1, 1,
2.07891, -0.2092121, 2.219592, 1, 0, 0, 1, 1,
2.08184, 1.313616, 0.9295023, 1, 0, 0, 1, 1,
2.11857, 0.06598677, 1.284711, 1, 0, 0, 1, 1,
2.156078, 0.3944616, 1.913319, 1, 0, 0, 1, 1,
2.207807, 0.8418346, 0.3289597, 1, 0, 0, 1, 1,
2.23147, 0.5044152, 1.828188, 0, 0, 0, 1, 1,
2.256436, -0.2673894, 4.222528, 0, 0, 0, 1, 1,
2.266235, 0.5068782, 0.7599549, 0, 0, 0, 1, 1,
2.27693, 0.3047832, 0.556182, 0, 0, 0, 1, 1,
2.281285, -1.374978, 2.200063, 0, 0, 0, 1, 1,
2.291982, 1.33856, 0.493029, 0, 0, 0, 1, 1,
2.371548, -0.6795091, 1.452948, 0, 0, 0, 1, 1,
2.432078, 1.205757, 0.5184593, 1, 1, 1, 1, 1,
2.531724, 0.2863982, 1.846251, 1, 1, 1, 1, 1,
2.564367, 0.4046836, 1.912827, 1, 1, 1, 1, 1,
2.577348, -2.011655, 1.65566, 1, 1, 1, 1, 1,
3.358631, 0.9737449, 2.061399, 1, 1, 1, 1, 1,
3.404939, 1.561851, 1.811899, 1, 1, 1, 1, 1,
3.607569, -0.10453, 1.26116, 1, 1, 1, 1, 1
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
var radius = 10.50162;
var distance = 36.88648;
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
mvMatrix.translate( 0.3542321, 0.4989059, 0.1512766 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.88648);
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
