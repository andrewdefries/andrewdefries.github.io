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
-3.198468, -0.5650661, -2.084265, 1, 0, 0, 1,
-2.592918, 1.362881, -1.369865, 1, 0.007843138, 0, 1,
-2.541133, -0.4707623, -0.6962839, 1, 0.01176471, 0, 1,
-2.513648, 1.167906, -2.923275, 1, 0.01960784, 0, 1,
-2.373815, 0.1361533, -1.74979, 1, 0.02352941, 0, 1,
-2.328032, 0.6019195, -1.852555, 1, 0.03137255, 0, 1,
-2.301344, -0.9617198, -2.303239, 1, 0.03529412, 0, 1,
-2.281278, 0.1770189, -1.257981, 1, 0.04313726, 0, 1,
-2.237995, 0.3439502, -2.460557, 1, 0.04705882, 0, 1,
-2.183331, -1.077706, -2.573573, 1, 0.05490196, 0, 1,
-2.17902, -1.786334, -1.622717, 1, 0.05882353, 0, 1,
-2.16898, -1.579531, -0.9047745, 1, 0.06666667, 0, 1,
-2.137265, -0.7121592, -3.436288, 1, 0.07058824, 0, 1,
-2.136242, 1.481117, -2.048858, 1, 0.07843138, 0, 1,
-2.123268, -0.2781407, -2.559643, 1, 0.08235294, 0, 1,
-2.104298, -0.5454401, -1.484711, 1, 0.09019608, 0, 1,
-2.088903, -0.5090352, -0.005479935, 1, 0.09411765, 0, 1,
-2.054197, 1.369263, 0.6344594, 1, 0.1019608, 0, 1,
-2.028122, -0.233535, -2.217891, 1, 0.1098039, 0, 1,
-2.016085, 1.317384, -1.309334, 1, 0.1137255, 0, 1,
-1.977706, 1.699196, -0.220561, 1, 0.1215686, 0, 1,
-1.946158, 0.7153512, -0.6373792, 1, 0.1254902, 0, 1,
-1.933197, 1.03178, -0.9604505, 1, 0.1333333, 0, 1,
-1.923006, 1.038233, -1.713511, 1, 0.1372549, 0, 1,
-1.915307, -1.037386, -2.549069, 1, 0.145098, 0, 1,
-1.905467, -0.2790688, -0.7083058, 1, 0.1490196, 0, 1,
-1.899918, -0.1904216, -1.337834, 1, 0.1568628, 0, 1,
-1.899533, -0.6429307, -2.576678, 1, 0.1607843, 0, 1,
-1.894334, 0.04504696, -1.457728, 1, 0.1686275, 0, 1,
-1.885765, -1.861287, -0.6723644, 1, 0.172549, 0, 1,
-1.884604, -1.019064, -1.982998, 1, 0.1803922, 0, 1,
-1.87325, -0.9250865, 0.0003193192, 1, 0.1843137, 0, 1,
-1.870419, 1.91312, -1.048265, 1, 0.1921569, 0, 1,
-1.865152, -2.123504, -2.457402, 1, 0.1960784, 0, 1,
-1.854276, 1.611873, -1.4227, 1, 0.2039216, 0, 1,
-1.853114, -0.565843, -2.610152, 1, 0.2117647, 0, 1,
-1.832708, -0.8786057, -2.368196, 1, 0.2156863, 0, 1,
-1.832244, -0.74725, -1.898229, 1, 0.2235294, 0, 1,
-1.8155, -0.04170181, -2.481413, 1, 0.227451, 0, 1,
-1.814681, -0.9170094, -2.452127, 1, 0.2352941, 0, 1,
-1.794889, -0.2128519, -1.517375, 1, 0.2392157, 0, 1,
-1.783505, 0.7609059, -1.036658, 1, 0.2470588, 0, 1,
-1.783111, 1.116619, 0.2622847, 1, 0.2509804, 0, 1,
-1.722304, -0.08591267, -1.447622, 1, 0.2588235, 0, 1,
-1.706448, -0.06212031, -2.187653, 1, 0.2627451, 0, 1,
-1.678498, -0.338017, -2.426442, 1, 0.2705882, 0, 1,
-1.667553, 0.3249138, -2.9437, 1, 0.2745098, 0, 1,
-1.666368, -0.7133667, -1.340372, 1, 0.282353, 0, 1,
-1.665004, 0.06009573, -1.26193, 1, 0.2862745, 0, 1,
-1.632716, -1.737782, -1.969932, 1, 0.2941177, 0, 1,
-1.606228, 1.396117, -3.653206, 1, 0.3019608, 0, 1,
-1.604467, 2.182861, 0.6192557, 1, 0.3058824, 0, 1,
-1.601302, -0.350654, -0.5149568, 1, 0.3137255, 0, 1,
-1.59876, 0.4136788, 0.5496846, 1, 0.3176471, 0, 1,
-1.594755, 0.4468426, -0.6341935, 1, 0.3254902, 0, 1,
-1.584446, -1.365758, -2.834981, 1, 0.3294118, 0, 1,
-1.569284, -1.242384, -3.397377, 1, 0.3372549, 0, 1,
-1.549041, 0.2638426, -0.2810467, 1, 0.3411765, 0, 1,
-1.548285, 0.5907882, -1.353964, 1, 0.3490196, 0, 1,
-1.536629, 1.077849, -0.2792064, 1, 0.3529412, 0, 1,
-1.536549, 1.167846, -1.352038, 1, 0.3607843, 0, 1,
-1.535246, -0.5806616, -3.693111, 1, 0.3647059, 0, 1,
-1.531681, -0.320662, 0.6576955, 1, 0.372549, 0, 1,
-1.508376, -0.1932906, -3.864962, 1, 0.3764706, 0, 1,
-1.494626, -0.3884021, -2.078063, 1, 0.3843137, 0, 1,
-1.493581, 0.502634, -0.7147234, 1, 0.3882353, 0, 1,
-1.489586, 0.0416143, -3.062165, 1, 0.3960784, 0, 1,
-1.482227, 0.7657797, -1.761087, 1, 0.4039216, 0, 1,
-1.471751, -0.2635672, -1.918617, 1, 0.4078431, 0, 1,
-1.457109, -1.221042, -2.462335, 1, 0.4156863, 0, 1,
-1.455382, 0.0438979, -0.9449484, 1, 0.4196078, 0, 1,
-1.438851, -0.8192612, -1.967688, 1, 0.427451, 0, 1,
-1.429259, 0.6678553, -1.92243, 1, 0.4313726, 0, 1,
-1.418531, 1.326891, 0.1295753, 1, 0.4392157, 0, 1,
-1.417563, 0.0156331, -0.4950139, 1, 0.4431373, 0, 1,
-1.410388, 0.03281989, -2.112529, 1, 0.4509804, 0, 1,
-1.393326, 3.055858, 0.06574064, 1, 0.454902, 0, 1,
-1.384986, -0.914966, -2.917879, 1, 0.4627451, 0, 1,
-1.375187, -1.178575, -3.259664, 1, 0.4666667, 0, 1,
-1.372599, -0.8633078, -1.429972, 1, 0.4745098, 0, 1,
-1.368307, -1.750688, -1.851036, 1, 0.4784314, 0, 1,
-1.358724, 2.415542, -0.03372835, 1, 0.4862745, 0, 1,
-1.340791, -1.824779, -2.976584, 1, 0.4901961, 0, 1,
-1.337441, 0.6652755, -1.343878, 1, 0.4980392, 0, 1,
-1.336371, -0.5161223, -0.3849154, 1, 0.5058824, 0, 1,
-1.335556, 0.8747655, 0.2057217, 1, 0.509804, 0, 1,
-1.321705, 0.5990978, -0.879854, 1, 0.5176471, 0, 1,
-1.318316, 2.890898, 1.454629, 1, 0.5215687, 0, 1,
-1.310424, -1.643268, -3.431334, 1, 0.5294118, 0, 1,
-1.301855, -1.371219, -0.3176786, 1, 0.5333334, 0, 1,
-1.301673, 1.87796, 0.8385984, 1, 0.5411765, 0, 1,
-1.293065, 2.040321, 0.9167466, 1, 0.5450981, 0, 1,
-1.287956, -1.886665, -2.350684, 1, 0.5529412, 0, 1,
-1.286203, -0.5136859, -2.60626, 1, 0.5568628, 0, 1,
-1.279745, 0.4444126, -1.579621, 1, 0.5647059, 0, 1,
-1.272945, -0.681589, -1.215631, 1, 0.5686275, 0, 1,
-1.27227, -0.009740803, -3.309893, 1, 0.5764706, 0, 1,
-1.258335, 2.090023, 0.676979, 1, 0.5803922, 0, 1,
-1.256629, 1.962768, -0.111714, 1, 0.5882353, 0, 1,
-1.253901, -0.1740642, -0.4953234, 1, 0.5921569, 0, 1,
-1.246664, 0.163772, -1.696315, 1, 0.6, 0, 1,
-1.240242, -1.636392, -1.988359, 1, 0.6078432, 0, 1,
-1.228601, -0.8193901, -1.801613, 1, 0.6117647, 0, 1,
-1.214504, 0.6803517, -0.04718455, 1, 0.6196079, 0, 1,
-1.20012, 0.7764834, -0.3927031, 1, 0.6235294, 0, 1,
-1.198421, -2.025463, -3.49353, 1, 0.6313726, 0, 1,
-1.196951, -0.01426238, -0.7251554, 1, 0.6352941, 0, 1,
-1.191155, -0.449942, -1.932792, 1, 0.6431373, 0, 1,
-1.181792, 0.8907639, -1.615105, 1, 0.6470588, 0, 1,
-1.17868, 1.238092, -2.07529, 1, 0.654902, 0, 1,
-1.177278, 0.6304955, -0.2357792, 1, 0.6588235, 0, 1,
-1.173681, 0.1375598, 0.1428685, 1, 0.6666667, 0, 1,
-1.170251, -0.3640963, -1.916385, 1, 0.6705883, 0, 1,
-1.166306, -0.8180532, -3.48638, 1, 0.6784314, 0, 1,
-1.16318, 2.758151, -0.1208688, 1, 0.682353, 0, 1,
-1.16309, -0.1119828, -1.295457, 1, 0.6901961, 0, 1,
-1.155789, -0.2136796, -0.5257716, 1, 0.6941177, 0, 1,
-1.123908, 0.3900577, -2.066849, 1, 0.7019608, 0, 1,
-1.1151, -0.2039801, -1.854497, 1, 0.7098039, 0, 1,
-1.114905, 1.977985, -1.439471, 1, 0.7137255, 0, 1,
-1.108667, 0.1039395, -2.648085, 1, 0.7215686, 0, 1,
-1.105121, -0.2703133, -2.139581, 1, 0.7254902, 0, 1,
-1.095021, -0.9229535, -1.945057, 1, 0.7333333, 0, 1,
-1.094713, 0.4385138, -0.6283987, 1, 0.7372549, 0, 1,
-1.084962, -1.205163, -2.889877, 1, 0.7450981, 0, 1,
-1.07688, 0.6250337, -2.501743, 1, 0.7490196, 0, 1,
-1.075416, 2.082306, -2.336389, 1, 0.7568628, 0, 1,
-1.067677, 0.289864, -2.041644, 1, 0.7607843, 0, 1,
-1.065786, 0.1898375, -1.56801, 1, 0.7686275, 0, 1,
-1.057253, 1.550001, -0.293145, 1, 0.772549, 0, 1,
-1.046449, -1.514635, -2.417486, 1, 0.7803922, 0, 1,
-1.04559, -0.561725, -1.008331, 1, 0.7843137, 0, 1,
-1.043702, -0.299076, -1.428256, 1, 0.7921569, 0, 1,
-1.042547, 1.288583, -0.5530526, 1, 0.7960784, 0, 1,
-1.033172, 0.5583707, -2.176516, 1, 0.8039216, 0, 1,
-1.03168, -2.088707, -0.9656049, 1, 0.8117647, 0, 1,
-1.029948, 1.90915, -1.464881, 1, 0.8156863, 0, 1,
-1.028877, -0.2680159, -2.454656, 1, 0.8235294, 0, 1,
-1.018587, -1.197282, -1.383016, 1, 0.827451, 0, 1,
-1.014541, -0.8348885, -0.6997684, 1, 0.8352941, 0, 1,
-1.013946, 1.772748, 0.386054, 1, 0.8392157, 0, 1,
-1.003406, -0.4205558, -1.537486, 1, 0.8470588, 0, 1,
-0.9937047, -1.29231, -4.191944, 1, 0.8509804, 0, 1,
-0.9905491, -0.4398754, -1.830235, 1, 0.8588235, 0, 1,
-0.9876886, -1.645915, -3.111077, 1, 0.8627451, 0, 1,
-0.9869431, 0.1941132, -1.28423, 1, 0.8705882, 0, 1,
-0.9825965, -1.062933, -2.618852, 1, 0.8745098, 0, 1,
-0.9803624, -0.3970466, -2.720485, 1, 0.8823529, 0, 1,
-0.9766232, -0.6283041, -2.969305, 1, 0.8862745, 0, 1,
-0.9701222, 0.4707917, -1.194547, 1, 0.8941177, 0, 1,
-0.9673911, 0.2696835, -0.3980477, 1, 0.8980392, 0, 1,
-0.9565244, -0.4198557, -3.22694, 1, 0.9058824, 0, 1,
-0.9509174, -0.8231939, -4.39474, 1, 0.9137255, 0, 1,
-0.9468148, -0.1669712, 0.2890095, 1, 0.9176471, 0, 1,
-0.9466795, 1.66825, -1.040199, 1, 0.9254902, 0, 1,
-0.9389806, 0.3009043, -1.068359, 1, 0.9294118, 0, 1,
-0.9389628, -0.3459021, -1.681567, 1, 0.9372549, 0, 1,
-0.9364087, 0.6891055, 0.08486282, 1, 0.9411765, 0, 1,
-0.9270109, -0.4183094, -3.497677, 1, 0.9490196, 0, 1,
-0.917967, -1.398057, -3.444308, 1, 0.9529412, 0, 1,
-0.9179145, -0.4244939, -1.741941, 1, 0.9607843, 0, 1,
-0.9172531, -1.235708, -1.446129, 1, 0.9647059, 0, 1,
-0.916589, -0.0695948, 0.5668358, 1, 0.972549, 0, 1,
-0.9158286, 0.9487784, 0.5189565, 1, 0.9764706, 0, 1,
-0.9152643, 0.7476124, 0.4668581, 1, 0.9843137, 0, 1,
-0.9049572, -0.1547965, -2.682801, 1, 0.9882353, 0, 1,
-0.9026296, 0.5750027, -2.433956, 1, 0.9960784, 0, 1,
-0.8979897, 0.3164147, -1.531234, 0.9960784, 1, 0, 1,
-0.8924873, -0.05197726, -1.146948, 0.9921569, 1, 0, 1,
-0.8911291, -1.389442, -3.092724, 0.9843137, 1, 0, 1,
-0.88793, -1.8106, -2.173252, 0.9803922, 1, 0, 1,
-0.8860455, 0.1226663, -1.386511, 0.972549, 1, 0, 1,
-0.8831202, -0.5127484, 0.1334662, 0.9686275, 1, 0, 1,
-0.8801876, -0.7450255, -2.110257, 0.9607843, 1, 0, 1,
-0.8796256, 1.657366, -1.179833, 0.9568627, 1, 0, 1,
-0.8755681, -0.2609071, -1.885221, 0.9490196, 1, 0, 1,
-0.8707533, -0.2743869, -2.080039, 0.945098, 1, 0, 1,
-0.8658129, 0.6587066, -2.084629, 0.9372549, 1, 0, 1,
-0.8557933, 0.5588655, -1.179476, 0.9333333, 1, 0, 1,
-0.839977, 0.2670436, -3.448977, 0.9254902, 1, 0, 1,
-0.8354487, -0.1301321, -1.229321, 0.9215686, 1, 0, 1,
-0.8343213, -1.221117, -2.5194, 0.9137255, 1, 0, 1,
-0.8295614, 0.6344863, -1.260585, 0.9098039, 1, 0, 1,
-0.8195611, -0.74663, -3.022074, 0.9019608, 1, 0, 1,
-0.8195117, 1.335508, -1.320366, 0.8941177, 1, 0, 1,
-0.8187637, -1.973527, -2.280634, 0.8901961, 1, 0, 1,
-0.8167516, 1.376722, -3.310491, 0.8823529, 1, 0, 1,
-0.8144218, -0.3250504, -0.2494462, 0.8784314, 1, 0, 1,
-0.8129942, -1.107679, -4.085976, 0.8705882, 1, 0, 1,
-0.811995, -0.1036812, -0.4056915, 0.8666667, 1, 0, 1,
-0.8065779, 0.09538808, -2.434951, 0.8588235, 1, 0, 1,
-0.8023568, -1.730193, -2.83116, 0.854902, 1, 0, 1,
-0.801609, 0.5331988, -0.8389621, 0.8470588, 1, 0, 1,
-0.8010368, -1.249831, -3.371168, 0.8431373, 1, 0, 1,
-0.800409, 0.738816, -0.5039055, 0.8352941, 1, 0, 1,
-0.7993001, 1.906188, 0.887853, 0.8313726, 1, 0, 1,
-0.7908559, 0.4934905, -2.381255, 0.8235294, 1, 0, 1,
-0.7890843, -0.4411732, -1.279446, 0.8196079, 1, 0, 1,
-0.7846703, 1.407698, -0.7830336, 0.8117647, 1, 0, 1,
-0.7808754, 0.2455722, -3.135684, 0.8078431, 1, 0, 1,
-0.7761793, 1.542101, -0.971069, 0.8, 1, 0, 1,
-0.7760078, 0.8111941, 0.2878439, 0.7921569, 1, 0, 1,
-0.7751357, -0.4401581, -2.51828, 0.7882353, 1, 0, 1,
-0.7727946, -1.584273, -3.416601, 0.7803922, 1, 0, 1,
-0.7714196, 0.9498089, -0.632808, 0.7764706, 1, 0, 1,
-0.7693419, 1.119904, -0.9696366, 0.7686275, 1, 0, 1,
-0.7676851, 0.08320533, -3.15325, 0.7647059, 1, 0, 1,
-0.7613229, 0.7178631, -0.8487788, 0.7568628, 1, 0, 1,
-0.76081, 1.538179, -0.5795602, 0.7529412, 1, 0, 1,
-0.758971, -1.527092, -2.251601, 0.7450981, 1, 0, 1,
-0.7562871, 0.09086175, -0.9813222, 0.7411765, 1, 0, 1,
-0.754593, -2.444888, -4.304597, 0.7333333, 1, 0, 1,
-0.7542775, 0.1299975, -1.790316, 0.7294118, 1, 0, 1,
-0.7542325, 1.734502, -1.236928, 0.7215686, 1, 0, 1,
-0.7529508, 1.562255, -1.474845, 0.7176471, 1, 0, 1,
-0.7469495, 1.261198, 0.6662806, 0.7098039, 1, 0, 1,
-0.7464697, 0.06391033, -0.5152246, 0.7058824, 1, 0, 1,
-0.7420639, -0.8568084, -2.69433, 0.6980392, 1, 0, 1,
-0.7399142, 0.3183552, -1.354828, 0.6901961, 1, 0, 1,
-0.7396325, 1.877779, 0.9799546, 0.6862745, 1, 0, 1,
-0.7376367, 1.049696, -0.7300954, 0.6784314, 1, 0, 1,
-0.7266154, -2.061868, -0.6432288, 0.6745098, 1, 0, 1,
-0.7177922, 0.4495708, -0.9553962, 0.6666667, 1, 0, 1,
-0.7143539, -1.715095, -3.859879, 0.6627451, 1, 0, 1,
-0.7119724, -1.024414, -3.151407, 0.654902, 1, 0, 1,
-0.7101238, 1.141811, 0.3483935, 0.6509804, 1, 0, 1,
-0.7069499, -0.4931636, -2.566868, 0.6431373, 1, 0, 1,
-0.7024425, -0.8933444, -4.000655, 0.6392157, 1, 0, 1,
-0.7007002, 0.3903047, -0.3492235, 0.6313726, 1, 0, 1,
-0.6962528, -0.2154464, -1.889886, 0.627451, 1, 0, 1,
-0.693345, -0.5272411, -2.540265, 0.6196079, 1, 0, 1,
-0.6923302, 0.4909964, -1.044959, 0.6156863, 1, 0, 1,
-0.6905349, -0.6235434, -1.465677, 0.6078432, 1, 0, 1,
-0.6888273, -0.1622866, -3.543282, 0.6039216, 1, 0, 1,
-0.6883007, -0.1872066, -1.825193, 0.5960785, 1, 0, 1,
-0.6863428, -0.2810776, -3.111287, 0.5882353, 1, 0, 1,
-0.6834192, 0.1803911, -2.945751, 0.5843138, 1, 0, 1,
-0.6766378, 0.2580881, 0.3175009, 0.5764706, 1, 0, 1,
-0.6725041, 0.1611436, -1.715881, 0.572549, 1, 0, 1,
-0.6701112, 0.2902348, -0.9366251, 0.5647059, 1, 0, 1,
-0.6643651, -2.096471, -3.469638, 0.5607843, 1, 0, 1,
-0.6633997, 0.9905757, 0.3310289, 0.5529412, 1, 0, 1,
-0.6628305, -0.6553079, -2.087052, 0.5490196, 1, 0, 1,
-0.6614687, 0.791291, -2.310999, 0.5411765, 1, 0, 1,
-0.6608679, -0.5750883, -1.750206, 0.5372549, 1, 0, 1,
-0.653972, 1.111045, -1.134294, 0.5294118, 1, 0, 1,
-0.6499791, -0.129611, -2.335748, 0.5254902, 1, 0, 1,
-0.6478851, -0.328061, -2.301725, 0.5176471, 1, 0, 1,
-0.6437417, -0.5035577, -0.01757006, 0.5137255, 1, 0, 1,
-0.6435859, -0.7108215, -3.039175, 0.5058824, 1, 0, 1,
-0.6410668, -0.8052195, -2.016259, 0.5019608, 1, 0, 1,
-0.6407708, 0.09888095, -0.4741504, 0.4941176, 1, 0, 1,
-0.6329313, 0.4608532, -1.108654, 0.4862745, 1, 0, 1,
-0.628857, 1.295981, 2.196529, 0.4823529, 1, 0, 1,
-0.6287376, -0.3782661, -2.350043, 0.4745098, 1, 0, 1,
-0.6228624, -0.3391048, -4.632859, 0.4705882, 1, 0, 1,
-0.6192428, 0.03422571, -1.251423, 0.4627451, 1, 0, 1,
-0.6183821, 0.1381922, -2.040975, 0.4588235, 1, 0, 1,
-0.6183693, 1.161694, -1.328309, 0.4509804, 1, 0, 1,
-0.6183522, -0.2395745, -3.1117, 0.4470588, 1, 0, 1,
-0.6105685, -1.190443, -3.51889, 0.4392157, 1, 0, 1,
-0.6081885, 1.870527, -0.9255211, 0.4352941, 1, 0, 1,
-0.6059082, 1.817556, -0.4282919, 0.427451, 1, 0, 1,
-0.6017027, 0.1887334, -1.288181, 0.4235294, 1, 0, 1,
-0.5861577, -1.225657, -3.022303, 0.4156863, 1, 0, 1,
-0.5839076, -1.317234, -1.767809, 0.4117647, 1, 0, 1,
-0.5796141, 0.717856, -0.07746823, 0.4039216, 1, 0, 1,
-0.5792525, -0.9796315, -3.452396, 0.3960784, 1, 0, 1,
-0.5783803, 0.2418345, -1.164901, 0.3921569, 1, 0, 1,
-0.5761918, -1.1479, -3.124979, 0.3843137, 1, 0, 1,
-0.5740508, -0.8775724, -2.280726, 0.3803922, 1, 0, 1,
-0.5712471, -0.5049707, -3.256058, 0.372549, 1, 0, 1,
-0.5703675, -1.50547, -2.582742, 0.3686275, 1, 0, 1,
-0.5695624, 0.2014944, -1.54387, 0.3607843, 1, 0, 1,
-0.5643672, 0.1319243, -2.776519, 0.3568628, 1, 0, 1,
-0.5586982, -0.8143655, -3.77196, 0.3490196, 1, 0, 1,
-0.5555249, 1.176991, -1.039059, 0.345098, 1, 0, 1,
-0.5549019, 1.315564, -1.89573, 0.3372549, 1, 0, 1,
-0.5544535, 1.492162, 0.1523957, 0.3333333, 1, 0, 1,
-0.553785, 0.1605891, 0.2740726, 0.3254902, 1, 0, 1,
-0.5526645, 0.2139055, -0.6630546, 0.3215686, 1, 0, 1,
-0.5526633, -0.188616, -1.653519, 0.3137255, 1, 0, 1,
-0.5502403, 0.3938052, -0.6315677, 0.3098039, 1, 0, 1,
-0.5392959, 1.806278, -1.133322, 0.3019608, 1, 0, 1,
-0.537592, -0.07886056, -0.5748067, 0.2941177, 1, 0, 1,
-0.5315842, -0.3416496, -2.599988, 0.2901961, 1, 0, 1,
-0.5295223, 0.9303868, -1.075396, 0.282353, 1, 0, 1,
-0.5282737, -0.06807232, -0.5504166, 0.2784314, 1, 0, 1,
-0.5216228, 0.2071359, -0.2838021, 0.2705882, 1, 0, 1,
-0.515783, -1.186081, -3.052818, 0.2666667, 1, 0, 1,
-0.5138681, 1.559725, 0.08259819, 0.2588235, 1, 0, 1,
-0.5125107, 0.5579808, -1.674604, 0.254902, 1, 0, 1,
-0.5108446, 0.5233968, -1.186667, 0.2470588, 1, 0, 1,
-0.5101813, 0.4249727, -1.497964, 0.2431373, 1, 0, 1,
-0.5062765, -0.2169812, -1.665831, 0.2352941, 1, 0, 1,
-0.5052657, 1.157517, 0.3795772, 0.2313726, 1, 0, 1,
-0.5043668, 1.717829, 0.5251096, 0.2235294, 1, 0, 1,
-0.5042171, -0.2638031, -2.448066, 0.2196078, 1, 0, 1,
-0.4980605, 1.059046, -0.5002154, 0.2117647, 1, 0, 1,
-0.4979279, -0.5677615, -1.985925, 0.2078431, 1, 0, 1,
-0.4964122, 0.02406629, -1.556746, 0.2, 1, 0, 1,
-0.49411, -0.2439387, -1.729488, 0.1921569, 1, 0, 1,
-0.4926777, -1.124315, -2.65179, 0.1882353, 1, 0, 1,
-0.492315, 0.883907, -0.4149634, 0.1803922, 1, 0, 1,
-0.4896132, -1.274804, -3.88582, 0.1764706, 1, 0, 1,
-0.4882797, -0.08627379, -1.271176, 0.1686275, 1, 0, 1,
-0.4863003, 0.2695702, 1.273143, 0.1647059, 1, 0, 1,
-0.4845415, -1.446336, -2.140607, 0.1568628, 1, 0, 1,
-0.4833727, 0.9177792, -1.090529, 0.1529412, 1, 0, 1,
-0.4782946, 0.01845445, -1.083022, 0.145098, 1, 0, 1,
-0.4754368, 1.419906, 0.04317506, 0.1411765, 1, 0, 1,
-0.4752425, 0.8789076, -2.941301, 0.1333333, 1, 0, 1,
-0.4749536, -1.46084, -2.961626, 0.1294118, 1, 0, 1,
-0.4662266, -0.05620477, -0.9608597, 0.1215686, 1, 0, 1,
-0.4652112, 0.05126213, -1.159311, 0.1176471, 1, 0, 1,
-0.4632834, -0.8774936, -1.697975, 0.1098039, 1, 0, 1,
-0.4491729, -1.59579, -3.136747, 0.1058824, 1, 0, 1,
-0.4471088, -0.6814619, -0.4922472, 0.09803922, 1, 0, 1,
-0.4468509, 2.349043, 0.7419967, 0.09019608, 1, 0, 1,
-0.4453195, -0.2470044, -2.990231, 0.08627451, 1, 0, 1,
-0.4436802, 0.08866495, -1.662699, 0.07843138, 1, 0, 1,
-0.4412582, -0.5661793, -2.844084, 0.07450981, 1, 0, 1,
-0.4379703, -0.3750814, -3.146718, 0.06666667, 1, 0, 1,
-0.4300282, 0.2595952, 1.014568, 0.0627451, 1, 0, 1,
-0.4261237, -0.5898791, -1.730433, 0.05490196, 1, 0, 1,
-0.4160355, 0.3219504, -2.265097, 0.05098039, 1, 0, 1,
-0.4147667, 1.599753, 0.1900561, 0.04313726, 1, 0, 1,
-0.409538, -0.6183501, -2.515416, 0.03921569, 1, 0, 1,
-0.4094508, 0.5564451, 0.3046278, 0.03137255, 1, 0, 1,
-0.4089155, 0.6340319, -0.2430338, 0.02745098, 1, 0, 1,
-0.4068225, 0.1040957, -1.367349, 0.01960784, 1, 0, 1,
-0.4053054, 1.426947, 0.01198542, 0.01568628, 1, 0, 1,
-0.3948466, -0.5077702, -2.609316, 0.007843138, 1, 0, 1,
-0.3918106, -0.04733191, -1.986898, 0.003921569, 1, 0, 1,
-0.3888685, 1.448785, 0.8927348, 0, 1, 0.003921569, 1,
-0.3859122, 1.047195, -0.3021178, 0, 1, 0.01176471, 1,
-0.3780009, 0.8668023, 1.629587, 0, 1, 0.01568628, 1,
-0.3777526, 0.6749345, 0.9046062, 0, 1, 0.02352941, 1,
-0.3773168, -0.3845755, -3.274295, 0, 1, 0.02745098, 1,
-0.3770086, 0.9230793, -0.8947511, 0, 1, 0.03529412, 1,
-0.3762255, 1.01837, -0.3534964, 0, 1, 0.03921569, 1,
-0.3708264, 0.4712903, -0.1740067, 0, 1, 0.04705882, 1,
-0.3668191, -0.5819008, -1.278468, 0, 1, 0.05098039, 1,
-0.360636, -0.5351272, -1.8423, 0, 1, 0.05882353, 1,
-0.3606148, -0.300545, -0.1774803, 0, 1, 0.0627451, 1,
-0.3589785, 0.225868, -2.049005, 0, 1, 0.07058824, 1,
-0.3569673, 1.32664, 0.05362018, 0, 1, 0.07450981, 1,
-0.3510846, -1.06742, -3.796122, 0, 1, 0.08235294, 1,
-0.3477389, 0.06188524, -1.582559, 0, 1, 0.08627451, 1,
-0.3475227, 0.05893807, -0.6269034, 0, 1, 0.09411765, 1,
-0.3473175, 1.343237, 0.02276692, 0, 1, 0.1019608, 1,
-0.3472428, 1.060457, -1.518115, 0, 1, 0.1058824, 1,
-0.345437, -1.980341, -1.409138, 0, 1, 0.1137255, 1,
-0.3401386, -1.097343, -0.8116763, 0, 1, 0.1176471, 1,
-0.3401332, 0.6868387, -2.122861, 0, 1, 0.1254902, 1,
-0.3379208, 0.7897443, -2.473871, 0, 1, 0.1294118, 1,
-0.3368247, 0.375537, -0.1702723, 0, 1, 0.1372549, 1,
-0.336632, -1.357198, -3.537387, 0, 1, 0.1411765, 1,
-0.3346334, 0.309794, -1.576806, 0, 1, 0.1490196, 1,
-0.3335939, -0.1505249, -2.542682, 0, 1, 0.1529412, 1,
-0.3290921, -0.3537465, -2.940106, 0, 1, 0.1607843, 1,
-0.3290552, 0.2488141, -1.4764, 0, 1, 0.1647059, 1,
-0.3289073, 0.1197881, -1.980924, 0, 1, 0.172549, 1,
-0.326359, -1.968839, -4.834485, 0, 1, 0.1764706, 1,
-0.3253257, -0.235874, -1.475986, 0, 1, 0.1843137, 1,
-0.3252087, 0.6504842, -1.654224, 0, 1, 0.1882353, 1,
-0.3230176, 1.001547, -1.657668, 0, 1, 0.1960784, 1,
-0.320867, 1.090898, -0.2825343, 0, 1, 0.2039216, 1,
-0.3194887, 0.1153516, -3.17381, 0, 1, 0.2078431, 1,
-0.3190434, -1.31999, -4.09062, 0, 1, 0.2156863, 1,
-0.3190021, -0.1643039, -1.171719, 0, 1, 0.2196078, 1,
-0.3186428, -1.91804, -3.384471, 0, 1, 0.227451, 1,
-0.3181625, 0.8597502, -1.024406, 0, 1, 0.2313726, 1,
-0.3181294, 0.05144184, -1.891276, 0, 1, 0.2392157, 1,
-0.3176823, -0.8240883, -2.268023, 0, 1, 0.2431373, 1,
-0.3175746, -0.2588641, -2.642718, 0, 1, 0.2509804, 1,
-0.3164891, 0.3176296, -1.324536, 0, 1, 0.254902, 1,
-0.315626, -0.7270172, -3.477178, 0, 1, 0.2627451, 1,
-0.3151034, 0.8620815, -0.4583993, 0, 1, 0.2666667, 1,
-0.3135989, 0.9070461, 0.6791627, 0, 1, 0.2745098, 1,
-0.3088831, 1.510155, 0.6141998, 0, 1, 0.2784314, 1,
-0.3056927, 0.3565564, -0.5021389, 0, 1, 0.2862745, 1,
-0.3025794, -1.381412, -2.986005, 0, 1, 0.2901961, 1,
-0.3016607, -0.7515091, -4.481091, 0, 1, 0.2980392, 1,
-0.3010875, 1.594657, -0.5174277, 0, 1, 0.3058824, 1,
-0.2963378, 1.340662, 0.4702322, 0, 1, 0.3098039, 1,
-0.2926169, 1.908536, 1.080478, 0, 1, 0.3176471, 1,
-0.2925238, 0.1436087, -1.496807, 0, 1, 0.3215686, 1,
-0.2879384, -0.8368086, -1.587321, 0, 1, 0.3294118, 1,
-0.2822665, -0.194408, -1.524032, 0, 1, 0.3333333, 1,
-0.2748654, 0.2681665, -2.263945, 0, 1, 0.3411765, 1,
-0.2741812, 0.2099919, -0.05387911, 0, 1, 0.345098, 1,
-0.2740628, 1.163226, -1.504537, 0, 1, 0.3529412, 1,
-0.2683687, 1.928227, -1.51938, 0, 1, 0.3568628, 1,
-0.2661439, 0.08713403, -1.594138, 0, 1, 0.3647059, 1,
-0.2589471, -1.460825, -2.18236, 0, 1, 0.3686275, 1,
-0.2566032, 0.02216167, -1.733511, 0, 1, 0.3764706, 1,
-0.2537813, 1.342588, -0.5831035, 0, 1, 0.3803922, 1,
-0.2524219, -0.3046484, -1.249684, 0, 1, 0.3882353, 1,
-0.2509137, 0.4646951, -0.1840078, 0, 1, 0.3921569, 1,
-0.244096, -1.204236, -2.793803, 0, 1, 0.4, 1,
-0.2428917, 0.3648067, -0.8825337, 0, 1, 0.4078431, 1,
-0.2382671, 1.853604, 0.1387818, 0, 1, 0.4117647, 1,
-0.2366523, 0.6065244, -1.032196, 0, 1, 0.4196078, 1,
-0.2347014, 0.3681264, -1.312797, 0, 1, 0.4235294, 1,
-0.230929, 0.2410484, 0.2134769, 0, 1, 0.4313726, 1,
-0.2258678, 0.6758955, -0.2533261, 0, 1, 0.4352941, 1,
-0.2134779, -0.1680242, -1.328163, 0, 1, 0.4431373, 1,
-0.205835, -0.5592853, -3.648892, 0, 1, 0.4470588, 1,
-0.1970866, -0.4661348, -1.937569, 0, 1, 0.454902, 1,
-0.1961031, 0.3141493, -0.5087876, 0, 1, 0.4588235, 1,
-0.195146, 1.230007, -1.928398, 0, 1, 0.4666667, 1,
-0.1930137, 0.7730145, -0.5691624, 0, 1, 0.4705882, 1,
-0.1920965, 0.3722537, -0.9073541, 0, 1, 0.4784314, 1,
-0.1868661, 0.08628441, -1.5367, 0, 1, 0.4823529, 1,
-0.1825818, -1.034113, -1.799286, 0, 1, 0.4901961, 1,
-0.1803786, 2.727082, 1.232875, 0, 1, 0.4941176, 1,
-0.1793151, 0.2657761, -1.510436, 0, 1, 0.5019608, 1,
-0.1789296, -0.5495051, -2.450569, 0, 1, 0.509804, 1,
-0.1783667, -1.616502, -3.581626, 0, 1, 0.5137255, 1,
-0.177639, -1.129861, -2.857146, 0, 1, 0.5215687, 1,
-0.1704106, -1.243678, -3.626901, 0, 1, 0.5254902, 1,
-0.1657387, 1.792409, -0.2778561, 0, 1, 0.5333334, 1,
-0.1636859, -0.2519754, -0.9711081, 0, 1, 0.5372549, 1,
-0.1622069, 0.1668299, -0.6073425, 0, 1, 0.5450981, 1,
-0.1591928, 0.6987771, -1.704094, 0, 1, 0.5490196, 1,
-0.154663, -0.884743, -3.086506, 0, 1, 0.5568628, 1,
-0.1516868, -0.6750036, -1.031631, 0, 1, 0.5607843, 1,
-0.1466367, -2.382038, -4.989177, 0, 1, 0.5686275, 1,
-0.1444859, 0.09409053, 0.9116497, 0, 1, 0.572549, 1,
-0.144122, 0.4299223, -0.6153789, 0, 1, 0.5803922, 1,
-0.1315833, 0.3761146, -1.225006, 0, 1, 0.5843138, 1,
-0.1302073, 0.7113464, -2.70942, 0, 1, 0.5921569, 1,
-0.1257908, 0.3308192, 0.6349187, 0, 1, 0.5960785, 1,
-0.1217944, 1.077725, 0.6104835, 0, 1, 0.6039216, 1,
-0.1207523, -1.012448, -2.066958, 0, 1, 0.6117647, 1,
-0.1197594, -0.4065815, -2.807674, 0, 1, 0.6156863, 1,
-0.1182198, 0.2514794, -0.6905759, 0, 1, 0.6235294, 1,
-0.1174568, -0.4405116, -3.117123, 0, 1, 0.627451, 1,
-0.1167233, -0.4775513, -1.163217, 0, 1, 0.6352941, 1,
-0.1161137, -0.2172921, -1.397268, 0, 1, 0.6392157, 1,
-0.1151018, 0.7807282, 0.4658304, 0, 1, 0.6470588, 1,
-0.1116991, 0.9927946, -0.7843241, 0, 1, 0.6509804, 1,
-0.1083674, -0.456321, -1.172173, 0, 1, 0.6588235, 1,
-0.1021805, -0.04098168, -2.721867, 0, 1, 0.6627451, 1,
-0.1011366, 2.416977, -0.528785, 0, 1, 0.6705883, 1,
-0.09806875, -0.03465852, -2.342889, 0, 1, 0.6745098, 1,
-0.09276931, -0.007960613, -2.801262, 0, 1, 0.682353, 1,
-0.09153238, 0.4230574, -1.277991, 0, 1, 0.6862745, 1,
-0.08946785, 0.08989916, -0.6158018, 0, 1, 0.6941177, 1,
-0.08898921, -1.16016, -2.90987, 0, 1, 0.7019608, 1,
-0.08694457, -0.5172293, -3.485462, 0, 1, 0.7058824, 1,
-0.08556232, -1.440436, -1.928628, 0, 1, 0.7137255, 1,
-0.07532028, 0.1530907, -1.31443, 0, 1, 0.7176471, 1,
-0.07397628, 2.200404, 0.2473784, 0, 1, 0.7254902, 1,
-0.07203162, -1.064324, -4.431039, 0, 1, 0.7294118, 1,
-0.06831634, 1.303567, 0.4628354, 0, 1, 0.7372549, 1,
-0.06781431, -0.4805581, -2.858289, 0, 1, 0.7411765, 1,
-0.06321087, 0.6080517, -0.06254906, 0, 1, 0.7490196, 1,
-0.06319173, 1.64673, 1.660535, 0, 1, 0.7529412, 1,
-0.05981569, -0.4661177, -1.788315, 0, 1, 0.7607843, 1,
-0.05945243, 0.5015391, -0.5329436, 0, 1, 0.7647059, 1,
-0.05778066, 0.08647484, -0.9612854, 0, 1, 0.772549, 1,
-0.05556612, 1.747376, -2.533303, 0, 1, 0.7764706, 1,
-0.05222828, 0.4770937, -1.074245, 0, 1, 0.7843137, 1,
-0.05165544, -0.9799635, -1.833952, 0, 1, 0.7882353, 1,
-0.04861622, 0.8417354, 0.8986084, 0, 1, 0.7960784, 1,
-0.04787355, 1.022934, 0.6810274, 0, 1, 0.8039216, 1,
-0.04025169, 0.2595672, -1.015532, 0, 1, 0.8078431, 1,
-0.03858446, 1.60554, -0.4904179, 0, 1, 0.8156863, 1,
-0.03658634, -0.9472762, -4.253657, 0, 1, 0.8196079, 1,
-0.02956101, 0.2786107, 0.3731827, 0, 1, 0.827451, 1,
-0.02914092, 0.4632191, 0.4965115, 0, 1, 0.8313726, 1,
-0.0285712, 1.632778, -0.1078225, 0, 1, 0.8392157, 1,
-0.02696813, 1.658321, 1.675686, 0, 1, 0.8431373, 1,
-0.02363233, -0.2703294, -2.941503, 0, 1, 0.8509804, 1,
-0.01962711, 1.093309, -0.5136179, 0, 1, 0.854902, 1,
-0.01613895, 0.1720917, 1.131186, 0, 1, 0.8627451, 1,
-0.009182092, -1.680452, -2.755795, 0, 1, 0.8666667, 1,
-0.007898358, -1.100606, -3.638327, 0, 1, 0.8745098, 1,
-0.006448426, 1.528337, 1.911239, 0, 1, 0.8784314, 1,
-0.005295461, 0.7921376, 0.5951754, 0, 1, 0.8862745, 1,
-0.002977806, -0.5346515, -2.547436, 0, 1, 0.8901961, 1,
-0.002103218, -0.3948748, -4.05045, 0, 1, 0.8980392, 1,
-0.0005348858, 0.1080351, -1.346702, 0, 1, 0.9058824, 1,
0.001970311, -1.283934, 3.020134, 0, 1, 0.9098039, 1,
0.002278093, 0.6832759, -1.102384, 0, 1, 0.9176471, 1,
0.00534754, -0.2871044, 1.660903, 0, 1, 0.9215686, 1,
0.005709077, 0.1833921, -0.5028284, 0, 1, 0.9294118, 1,
0.008566828, -2.363611, 3.230778, 0, 1, 0.9333333, 1,
0.01077814, -0.407461, 3.081649, 0, 1, 0.9411765, 1,
0.01327297, -0.6224492, 1.896718, 0, 1, 0.945098, 1,
0.01438944, -1.095784, 3.514452, 0, 1, 0.9529412, 1,
0.02590906, -0.5528209, 2.485853, 0, 1, 0.9568627, 1,
0.02962837, -0.8280994, 3.935217, 0, 1, 0.9647059, 1,
0.03360434, -0.7074787, 2.101576, 0, 1, 0.9686275, 1,
0.03935104, -0.2622687, 0.8867663, 0, 1, 0.9764706, 1,
0.04062605, -0.738664, 2.728941, 0, 1, 0.9803922, 1,
0.04069927, -1.256523, 2.326548, 0, 1, 0.9882353, 1,
0.0412042, 1.160196, -0.4511242, 0, 1, 0.9921569, 1,
0.04237792, -1.530007, 2.582612, 0, 1, 1, 1,
0.04238006, -1.212403, 2.52059, 0, 0.9921569, 1, 1,
0.0434224, -2.277189, 2.037914, 0, 0.9882353, 1, 1,
0.04353488, 0.7094964, 0.1674316, 0, 0.9803922, 1, 1,
0.04691136, -1.415052, 1.556, 0, 0.9764706, 1, 1,
0.04962744, -0.1730449, 3.150393, 0, 0.9686275, 1, 1,
0.05613986, 1.095007, -0.5515698, 0, 0.9647059, 1, 1,
0.0582012, -1.027921, 2.525886, 0, 0.9568627, 1, 1,
0.0601622, -0.4369707, 4.333485, 0, 0.9529412, 1, 1,
0.06264126, -0.2811483, 1.778343, 0, 0.945098, 1, 1,
0.06415292, 2.314605, -0.4991253, 0, 0.9411765, 1, 1,
0.06427182, -0.9590418, 2.88832, 0, 0.9333333, 1, 1,
0.06435214, -0.6291935, 1.555857, 0, 0.9294118, 1, 1,
0.06755292, 0.1683639, 0.8415578, 0, 0.9215686, 1, 1,
0.0696245, -2.947457, 4.073986, 0, 0.9176471, 1, 1,
0.07957174, 1.992317, -0.49227, 0, 0.9098039, 1, 1,
0.08708636, -0.4644086, 4.081871, 0, 0.9058824, 1, 1,
0.08711801, 1.849917, -0.1633573, 0, 0.8980392, 1, 1,
0.08877404, -1.224053, 1.90335, 0, 0.8901961, 1, 1,
0.0923228, -0.7801071, 4.720697, 0, 0.8862745, 1, 1,
0.1021323, -1.620043, 4.10831, 0, 0.8784314, 1, 1,
0.1058582, 0.5090646, 0.1333355, 0, 0.8745098, 1, 1,
0.112176, 2.232556, 0.7420931, 0, 0.8666667, 1, 1,
0.1133269, -1.136579, 1.740384, 0, 0.8627451, 1, 1,
0.1149145, 1.427025, -1.022254, 0, 0.854902, 1, 1,
0.123673, 0.01512404, 1.908962, 0, 0.8509804, 1, 1,
0.1325582, 0.2849947, 0.03954606, 0, 0.8431373, 1, 1,
0.1328218, -0.4493536, 3.644129, 0, 0.8392157, 1, 1,
0.1362033, 0.7967598, -0.5975471, 0, 0.8313726, 1, 1,
0.1381222, 0.9302404, -0.9483435, 0, 0.827451, 1, 1,
0.1392989, -0.7434835, 2.572006, 0, 0.8196079, 1, 1,
0.1399485, 1.404033, 0.5003231, 0, 0.8156863, 1, 1,
0.1417521, 0.3439582, -0.005378603, 0, 0.8078431, 1, 1,
0.1427996, -1.902102, 3.027743, 0, 0.8039216, 1, 1,
0.1444791, 1.147138, 1.4611, 0, 0.7960784, 1, 1,
0.1517152, 0.1590188, 1.184201, 0, 0.7882353, 1, 1,
0.1540903, -0.5618064, 3.118206, 0, 0.7843137, 1, 1,
0.1544292, -1.047126, 3.619364, 0, 0.7764706, 1, 1,
0.1549671, 1.815187, 0.4912596, 0, 0.772549, 1, 1,
0.1597945, -1.349961, 3.22384, 0, 0.7647059, 1, 1,
0.1605555, 0.5198798, -0.9696375, 0, 0.7607843, 1, 1,
0.162064, 0.5719268, 1.371055, 0, 0.7529412, 1, 1,
0.1623972, -0.1232138, 1.559939, 0, 0.7490196, 1, 1,
0.1651, 0.1748822, 1.130854, 0, 0.7411765, 1, 1,
0.1669195, -0.7099515, 3.431051, 0, 0.7372549, 1, 1,
0.1697348, -1.81874, 2.796612, 0, 0.7294118, 1, 1,
0.1698787, 2.990149, 0.6646562, 0, 0.7254902, 1, 1,
0.1714322, -0.9253772, 1.931536, 0, 0.7176471, 1, 1,
0.1728605, -0.2402552, 3.288439, 0, 0.7137255, 1, 1,
0.1760233, -0.7829799, 3.034563, 0, 0.7058824, 1, 1,
0.1801697, 0.5031801, -0.1160377, 0, 0.6980392, 1, 1,
0.1814218, 0.1462103, 1.7355, 0, 0.6941177, 1, 1,
0.1834944, 0.3118978, 0.4316628, 0, 0.6862745, 1, 1,
0.1853571, 1.483655, 0.285975, 0, 0.682353, 1, 1,
0.1854723, 1.261385, 0.5234681, 0, 0.6745098, 1, 1,
0.1870251, 0.992763, -1.114879, 0, 0.6705883, 1, 1,
0.1888077, 0.5918959, 0.3507643, 0, 0.6627451, 1, 1,
0.191646, 0.780396, 0.7931205, 0, 0.6588235, 1, 1,
0.1922935, 0.7405775, -1.82936, 0, 0.6509804, 1, 1,
0.1941834, -0.3022082, 2.896135, 0, 0.6470588, 1, 1,
0.2000647, -0.3417376, 1.812397, 0, 0.6392157, 1, 1,
0.2063996, -1.249007, 2.30033, 0, 0.6352941, 1, 1,
0.2102023, -0.2123726, 2.059649, 0, 0.627451, 1, 1,
0.2105683, -0.9697981, 4.430606, 0, 0.6235294, 1, 1,
0.2116644, 0.7404338, -1.890983, 0, 0.6156863, 1, 1,
0.223024, -0.6824056, 2.194165, 0, 0.6117647, 1, 1,
0.2255428, 1.467187, 0.09690078, 0, 0.6039216, 1, 1,
0.2291709, -0.2429743, 1.788739, 0, 0.5960785, 1, 1,
0.2302983, 0.7225752, -0.479459, 0, 0.5921569, 1, 1,
0.2318348, -0.3124623, 2.304115, 0, 0.5843138, 1, 1,
0.2344093, 0.8321931, 0.5080571, 0, 0.5803922, 1, 1,
0.2356815, 0.5770841, 0.1350028, 0, 0.572549, 1, 1,
0.23621, 0.5521611, 2.786359, 0, 0.5686275, 1, 1,
0.238993, -1.295095, 4.004659, 0, 0.5607843, 1, 1,
0.2408822, -0.4655584, 3.72699, 0, 0.5568628, 1, 1,
0.2414462, 1.606098, 0.1415912, 0, 0.5490196, 1, 1,
0.2442658, -1.549021, 3.860357, 0, 0.5450981, 1, 1,
0.2470932, 0.1948984, 0.5311542, 0, 0.5372549, 1, 1,
0.2482933, 0.2787262, 1.439692, 0, 0.5333334, 1, 1,
0.2486251, -0.6170933, 3.683174, 0, 0.5254902, 1, 1,
0.2493298, -0.28919, 2.522588, 0, 0.5215687, 1, 1,
0.2556071, -0.2740262, 1.073733, 0, 0.5137255, 1, 1,
0.2590148, 2.109583, 0.6362168, 0, 0.509804, 1, 1,
0.2646615, 0.4144945, -0.6461587, 0, 0.5019608, 1, 1,
0.2647423, 0.3370695, -0.8394955, 0, 0.4941176, 1, 1,
0.2661636, 0.5852419, 2.994065, 0, 0.4901961, 1, 1,
0.2679873, 1.975747, 0.1660584, 0, 0.4823529, 1, 1,
0.2683404, 0.001444756, 3.435464, 0, 0.4784314, 1, 1,
0.2713069, 0.1216295, 0.7611217, 0, 0.4705882, 1, 1,
0.2735061, 1.21241, -0.06928713, 0, 0.4666667, 1, 1,
0.2740871, 0.04425779, 1.966356, 0, 0.4588235, 1, 1,
0.2747073, -0.02732838, 2.61091, 0, 0.454902, 1, 1,
0.275328, 0.2094241, 2.701222, 0, 0.4470588, 1, 1,
0.2806273, 1.810322, -0.5161963, 0, 0.4431373, 1, 1,
0.2807556, -0.9174194, 2.736981, 0, 0.4352941, 1, 1,
0.2840745, 0.6138837, 1.009619, 0, 0.4313726, 1, 1,
0.2897254, 0.1176065, 1.855406, 0, 0.4235294, 1, 1,
0.2899503, 0.359749, -0.001908462, 0, 0.4196078, 1, 1,
0.2919713, -1.047734, 4.323443, 0, 0.4117647, 1, 1,
0.2948565, -1.122747, 1.200272, 0, 0.4078431, 1, 1,
0.2964413, 1.08878, -0.05643466, 0, 0.4, 1, 1,
0.2986594, 2.057405, 1.140042, 0, 0.3921569, 1, 1,
0.3032342, -0.752019, 3.833068, 0, 0.3882353, 1, 1,
0.3039079, 0.4551962, 1.213784, 0, 0.3803922, 1, 1,
0.3081258, -1.663621, 1.646663, 0, 0.3764706, 1, 1,
0.3143875, -1.402798, 2.862842, 0, 0.3686275, 1, 1,
0.3157448, -0.8780576, 1.733174, 0, 0.3647059, 1, 1,
0.3164629, 1.497176, -1.019874, 0, 0.3568628, 1, 1,
0.3170946, 1.838883, -0.2680623, 0, 0.3529412, 1, 1,
0.3175209, -0.4094749, 1.838401, 0, 0.345098, 1, 1,
0.3178887, -0.9181488, 2.875341, 0, 0.3411765, 1, 1,
0.321536, -0.292934, 1.734221, 0, 0.3333333, 1, 1,
0.3238244, 0.5654642, 1.267424, 0, 0.3294118, 1, 1,
0.3259362, 1.376653, 0.3152928, 0, 0.3215686, 1, 1,
0.3259728, 1.374554, -0.8866163, 0, 0.3176471, 1, 1,
0.3334461, -2.338944, 1.653962, 0, 0.3098039, 1, 1,
0.3349625, 1.874213, 1.252437, 0, 0.3058824, 1, 1,
0.339115, 0.6108795, 0.3300715, 0, 0.2980392, 1, 1,
0.3423062, 1.375583, 0.8097692, 0, 0.2901961, 1, 1,
0.3507294, -1.154751, 3.9299, 0, 0.2862745, 1, 1,
0.3586563, -1.985483, 2.615501, 0, 0.2784314, 1, 1,
0.3597213, -1.142408, 3.183123, 0, 0.2745098, 1, 1,
0.3610413, 1.094085, 0.940154, 0, 0.2666667, 1, 1,
0.3630314, 0.7556375, 1.071637, 0, 0.2627451, 1, 1,
0.3665489, 0.9019583, 1.015684, 0, 0.254902, 1, 1,
0.3679037, 1.388464, -0.3516266, 0, 0.2509804, 1, 1,
0.3681697, 0.1688146, 2.71565, 0, 0.2431373, 1, 1,
0.3687453, 0.812578, 1.577303, 0, 0.2392157, 1, 1,
0.3699426, -1.238916, 2.806787, 0, 0.2313726, 1, 1,
0.3734074, 0.8385596, 0.2235418, 0, 0.227451, 1, 1,
0.3734368, 0.86689, -0.1071245, 0, 0.2196078, 1, 1,
0.3738359, 1.244639, -1.297397, 0, 0.2156863, 1, 1,
0.3771747, -0.1568456, 2.679588, 0, 0.2078431, 1, 1,
0.37754, -0.8480178, 1.346824, 0, 0.2039216, 1, 1,
0.3801279, -1.105218, 3.088211, 0, 0.1960784, 1, 1,
0.3833206, -0.3324827, 2.371923, 0, 0.1882353, 1, 1,
0.3843527, -0.4244579, 2.503294, 0, 0.1843137, 1, 1,
0.3903978, -0.3058881, 2.12618, 0, 0.1764706, 1, 1,
0.3931458, 2.232065, 0.5595571, 0, 0.172549, 1, 1,
0.3933197, 1.414493, 0.4871678, 0, 0.1647059, 1, 1,
0.3961281, 0.3270571, 2.917862, 0, 0.1607843, 1, 1,
0.3984063, -1.04262, 2.914914, 0, 0.1529412, 1, 1,
0.4046712, -1.76734, 1.945394, 0, 0.1490196, 1, 1,
0.4046932, -0.177697, 1.146988, 0, 0.1411765, 1, 1,
0.4059222, -1.026047, 4.754405, 0, 0.1372549, 1, 1,
0.409355, 0.02595355, -0.1219939, 0, 0.1294118, 1, 1,
0.4104546, 0.3130234, 2.365913, 0, 0.1254902, 1, 1,
0.411859, -1.162664, 3.366231, 0, 0.1176471, 1, 1,
0.4124803, 2.048317, 1.216025, 0, 0.1137255, 1, 1,
0.4151192, -0.7987682, 1.87277, 0, 0.1058824, 1, 1,
0.4247631, -0.7718295, 2.661316, 0, 0.09803922, 1, 1,
0.4312333, 0.4255621, -0.8200954, 0, 0.09411765, 1, 1,
0.4354932, 0.04635639, 2.080814, 0, 0.08627451, 1, 1,
0.435828, -0.3379789, 0.2897172, 0, 0.08235294, 1, 1,
0.4389183, -0.9978014, 2.537864, 0, 0.07450981, 1, 1,
0.440361, 0.1923207, 0.5106027, 0, 0.07058824, 1, 1,
0.4412502, -0.7876258, 1.33335, 0, 0.0627451, 1, 1,
0.442017, -0.1792938, 1.71333, 0, 0.05882353, 1, 1,
0.4446191, 1.639554, 0.2327575, 0, 0.05098039, 1, 1,
0.4457261, -0.2950239, 2.373288, 0, 0.04705882, 1, 1,
0.4470292, 0.1106268, 1.2862, 0, 0.03921569, 1, 1,
0.4492548, 0.9134935, 1.827613, 0, 0.03529412, 1, 1,
0.4523803, -0.3777867, 1.021331, 0, 0.02745098, 1, 1,
0.4532402, 1.662111, -0.09347084, 0, 0.02352941, 1, 1,
0.461312, -0.01286509, 2.300337, 0, 0.01568628, 1, 1,
0.4629299, -0.6364308, 2.159758, 0, 0.01176471, 1, 1,
0.4633623, 0.2089737, 2.816268, 0, 0.003921569, 1, 1,
0.4670022, -0.3911611, 2.175528, 0.003921569, 0, 1, 1,
0.4673342, 0.808135, -0.2580226, 0.007843138, 0, 1, 1,
0.4675054, -0.4979465, 2.05064, 0.01568628, 0, 1, 1,
0.4695805, -0.4349946, 1.325952, 0.01960784, 0, 1, 1,
0.4703124, 1.006804, 0.8530675, 0.02745098, 0, 1, 1,
0.4714877, 0.5440066, 0.8947746, 0.03137255, 0, 1, 1,
0.4749313, 0.9102113, 1.028649, 0.03921569, 0, 1, 1,
0.4782824, -1.283858, 1.867099, 0.04313726, 0, 1, 1,
0.4832924, -0.272373, 2.115973, 0.05098039, 0, 1, 1,
0.4858662, -1.786761, 2.406612, 0.05490196, 0, 1, 1,
0.4861925, 0.6638325, 0.5767745, 0.0627451, 0, 1, 1,
0.4986156, -2.069456, 0.308848, 0.06666667, 0, 1, 1,
0.4991778, 1.315598, -0.5304111, 0.07450981, 0, 1, 1,
0.5030775, -0.1711743, 1.980923, 0.07843138, 0, 1, 1,
0.5049685, 0.4185292, 1.176927, 0.08627451, 0, 1, 1,
0.5101102, -0.6215988, 0.2684039, 0.09019608, 0, 1, 1,
0.5170545, 0.7414601, 0.6286027, 0.09803922, 0, 1, 1,
0.5183288, 0.04982552, -0.5476947, 0.1058824, 0, 1, 1,
0.518334, 0.5041509, 2.623842, 0.1098039, 0, 1, 1,
0.5204193, -1.202609, 3.074737, 0.1176471, 0, 1, 1,
0.5261943, -1.577382, 1.725617, 0.1215686, 0, 1, 1,
0.5265733, -0.04515762, 1.943387, 0.1294118, 0, 1, 1,
0.527473, 1.497613, 2.1367, 0.1333333, 0, 1, 1,
0.5315667, 0.401456, -0.06377681, 0.1411765, 0, 1, 1,
0.5330783, 0.8521159, 2.295055, 0.145098, 0, 1, 1,
0.5349953, -0.04068182, -0.3693706, 0.1529412, 0, 1, 1,
0.536758, -0.8415577, 2.039736, 0.1568628, 0, 1, 1,
0.5386778, -0.1735723, 1.386435, 0.1647059, 0, 1, 1,
0.5453888, 0.4736727, -1.118371, 0.1686275, 0, 1, 1,
0.5634935, -1.139701, 2.705755, 0.1764706, 0, 1, 1,
0.5685714, 0.9302454, -0.6292034, 0.1803922, 0, 1, 1,
0.5697641, -0.762271, 2.601069, 0.1882353, 0, 1, 1,
0.5784619, 0.768586, 2.949134, 0.1921569, 0, 1, 1,
0.5805198, -1.1119, 4.06931, 0.2, 0, 1, 1,
0.581641, -0.3055266, 1.87161, 0.2078431, 0, 1, 1,
0.5823516, -0.1635121, 1.522367, 0.2117647, 0, 1, 1,
0.5849072, -0.952413, 3.99867, 0.2196078, 0, 1, 1,
0.5861827, 0.7670015, 1.757743, 0.2235294, 0, 1, 1,
0.5885874, -0.2906054, 2.073592, 0.2313726, 0, 1, 1,
0.5889788, 0.1177453, 3.066306, 0.2352941, 0, 1, 1,
0.5891032, 2.437086, -0.61945, 0.2431373, 0, 1, 1,
0.589734, -0.623857, 0.4518939, 0.2470588, 0, 1, 1,
0.5910701, 1.804662, -0.07024932, 0.254902, 0, 1, 1,
0.5961873, -1.860069, 2.499386, 0.2588235, 0, 1, 1,
0.6019433, 0.3113201, 1.892951, 0.2666667, 0, 1, 1,
0.6024683, -0.01974293, 1.57098, 0.2705882, 0, 1, 1,
0.6026762, 0.4882576, 1.750211, 0.2784314, 0, 1, 1,
0.6027644, 0.02244735, 0.5212517, 0.282353, 0, 1, 1,
0.6077771, 1.440882, 0.5205944, 0.2901961, 0, 1, 1,
0.6079902, -0.0352841, 1.613865, 0.2941177, 0, 1, 1,
0.6130573, -0.4063877, 2.126487, 0.3019608, 0, 1, 1,
0.6142974, 0.8499756, 0.2230694, 0.3098039, 0, 1, 1,
0.6163293, -0.6112426, 1.329672, 0.3137255, 0, 1, 1,
0.6214817, -1.260223, 2.569879, 0.3215686, 0, 1, 1,
0.6241843, 0.5967159, 1.082639, 0.3254902, 0, 1, 1,
0.6246738, -0.03005466, -0.1138227, 0.3333333, 0, 1, 1,
0.6284272, 0.4138411, 0.8063567, 0.3372549, 0, 1, 1,
0.6358586, -0.2959358, 3.330452, 0.345098, 0, 1, 1,
0.6374339, -1.190992, 2.368052, 0.3490196, 0, 1, 1,
0.6391183, -0.3984664, 2.494649, 0.3568628, 0, 1, 1,
0.6416994, 1.365467, 0.4977525, 0.3607843, 0, 1, 1,
0.6420193, 0.159905, 1.479416, 0.3686275, 0, 1, 1,
0.6454747, 0.6147932, -0.5272124, 0.372549, 0, 1, 1,
0.6470574, 2.398135, 0.3198386, 0.3803922, 0, 1, 1,
0.648385, -0.3730987, 1.853829, 0.3843137, 0, 1, 1,
0.6497303, 1.01593, 0.198597, 0.3921569, 0, 1, 1,
0.6498383, -0.4303786, 1.360221, 0.3960784, 0, 1, 1,
0.6516255, -0.9259528, 3.275327, 0.4039216, 0, 1, 1,
0.6552264, 0.6374165, 0.7213543, 0.4117647, 0, 1, 1,
0.6558841, -0.6532398, 1.91142, 0.4156863, 0, 1, 1,
0.6611867, 0.05696905, 0.818665, 0.4235294, 0, 1, 1,
0.6619617, -0.3059811, 3.265151, 0.427451, 0, 1, 1,
0.6620919, -0.566675, 3.03525, 0.4352941, 0, 1, 1,
0.6632276, -0.6302409, 2.918901, 0.4392157, 0, 1, 1,
0.6706086, -0.679985, 0.3425695, 0.4470588, 0, 1, 1,
0.6707287, -0.3062454, 2.059872, 0.4509804, 0, 1, 1,
0.672223, 0.5081543, 1.367826, 0.4588235, 0, 1, 1,
0.6766801, 1.333463, 0.5928926, 0.4627451, 0, 1, 1,
0.681178, 0.7959687, 0.6614662, 0.4705882, 0, 1, 1,
0.6825357, 0.8743965, 1.173099, 0.4745098, 0, 1, 1,
0.6828046, -0.3856939, 2.835513, 0.4823529, 0, 1, 1,
0.6852137, -1.992014, 2.741723, 0.4862745, 0, 1, 1,
0.686029, 1.148795, 0.8387198, 0.4941176, 0, 1, 1,
0.6874291, -0.1604473, 2.032179, 0.5019608, 0, 1, 1,
0.6883254, 1.95844, -0.5699411, 0.5058824, 0, 1, 1,
0.6883321, -1.339832, 0.8740529, 0.5137255, 0, 1, 1,
0.6901066, -0.05281927, 2.9518, 0.5176471, 0, 1, 1,
0.6906517, 0.727145, 0.5210942, 0.5254902, 0, 1, 1,
0.6909548, -2.173765, 2.814285, 0.5294118, 0, 1, 1,
0.6974285, 1.125191, 1.263322, 0.5372549, 0, 1, 1,
0.6975105, -0.1027857, 1.36385, 0.5411765, 0, 1, 1,
0.7004086, 0.3668005, 1.820511, 0.5490196, 0, 1, 1,
0.7062482, 0.2456532, 1.229359, 0.5529412, 0, 1, 1,
0.7121013, -0.9942815, 3.668665, 0.5607843, 0, 1, 1,
0.7142153, 0.6181718, -0.04072546, 0.5647059, 0, 1, 1,
0.7154459, -0.2767475, 0.5163394, 0.572549, 0, 1, 1,
0.7165555, -0.2695286, 2.019788, 0.5764706, 0, 1, 1,
0.7211145, -1.000136, 3.146565, 0.5843138, 0, 1, 1,
0.7215978, -0.2424538, 2.293573, 0.5882353, 0, 1, 1,
0.7270222, -1.052868, 3.888032, 0.5960785, 0, 1, 1,
0.7292966, -0.651462, 3.169787, 0.6039216, 0, 1, 1,
0.7304661, 0.1727139, 0.8397323, 0.6078432, 0, 1, 1,
0.7305883, 1.740421, 0.4123842, 0.6156863, 0, 1, 1,
0.7329311, -0.4325241, 0.1983821, 0.6196079, 0, 1, 1,
0.7339938, -0.5389481, 2.473939, 0.627451, 0, 1, 1,
0.7348822, -2.222217, 1.483284, 0.6313726, 0, 1, 1,
0.7364051, -0.7388208, 1.873441, 0.6392157, 0, 1, 1,
0.7370642, 1.132565, -0.4971014, 0.6431373, 0, 1, 1,
0.7381095, -1.222558, 1.939945, 0.6509804, 0, 1, 1,
0.742562, 1.201624, 0.1603093, 0.654902, 0, 1, 1,
0.7454627, 0.7383947, 0.4376465, 0.6627451, 0, 1, 1,
0.748986, -0.4454893, 0.7143487, 0.6666667, 0, 1, 1,
0.7506098, -0.7863032, 0.3103306, 0.6745098, 0, 1, 1,
0.7547113, 0.3356663, 1.388048, 0.6784314, 0, 1, 1,
0.7570958, 0.7381799, 2.857426, 0.6862745, 0, 1, 1,
0.7658796, 1.177246, 0.1164991, 0.6901961, 0, 1, 1,
0.7664631, 0.5435073, 1.86524, 0.6980392, 0, 1, 1,
0.7674287, -2.426149, 3.741045, 0.7058824, 0, 1, 1,
0.7734053, 1.395131, 0.6282575, 0.7098039, 0, 1, 1,
0.7764177, 0.8416772, 0.5951509, 0.7176471, 0, 1, 1,
0.7766392, -0.4357592, 1.404703, 0.7215686, 0, 1, 1,
0.7769046, 2.449011, 0.005370053, 0.7294118, 0, 1, 1,
0.7780832, -1.067639, 0.9906942, 0.7333333, 0, 1, 1,
0.7902883, -0.2946983, 1.994759, 0.7411765, 0, 1, 1,
0.7973213, -1.137836, 2.156589, 0.7450981, 0, 1, 1,
0.8004692, -0.1760634, -1.509384, 0.7529412, 0, 1, 1,
0.8017044, -0.3099817, 2.369039, 0.7568628, 0, 1, 1,
0.8017179, 0.789462, -0.2831956, 0.7647059, 0, 1, 1,
0.8029009, -0.4006306, 2.174986, 0.7686275, 0, 1, 1,
0.8044479, 0.6485801, 1.661473, 0.7764706, 0, 1, 1,
0.8117843, -2.755991, 2.085844, 0.7803922, 0, 1, 1,
0.8184396, -0.4473349, 0.8216184, 0.7882353, 0, 1, 1,
0.8206163, 2.053588, -0.110632, 0.7921569, 0, 1, 1,
0.8246613, -1.582939, 1.60232, 0.8, 0, 1, 1,
0.8262077, -1.628202, 3.780355, 0.8078431, 0, 1, 1,
0.8266864, -1.652078, 1.668926, 0.8117647, 0, 1, 1,
0.8328634, 0.344937, 2.680423, 0.8196079, 0, 1, 1,
0.8331305, 1.275943, 2.064412, 0.8235294, 0, 1, 1,
0.8340777, 0.376796, 0.1995375, 0.8313726, 0, 1, 1,
0.8341958, -2.239756, 2.11804, 0.8352941, 0, 1, 1,
0.8349011, -0.5409489, 2.301537, 0.8431373, 0, 1, 1,
0.8360898, 0.5231862, 2.824365, 0.8470588, 0, 1, 1,
0.838634, -0.5524368, 0.4059214, 0.854902, 0, 1, 1,
0.8403375, -0.01788762, 1.688248, 0.8588235, 0, 1, 1,
0.8560082, 0.5840497, 0.9955205, 0.8666667, 0, 1, 1,
0.8597453, -0.1110172, 0.9316201, 0.8705882, 0, 1, 1,
0.8630151, -0.2532753, 3.65027, 0.8784314, 0, 1, 1,
0.8664947, 0.07267841, 2.779506, 0.8823529, 0, 1, 1,
0.8666958, -0.5463514, 2.544369, 0.8901961, 0, 1, 1,
0.8671856, -1.290671, 2.174531, 0.8941177, 0, 1, 1,
0.8675195, -0.8408368, 2.191095, 0.9019608, 0, 1, 1,
0.8692918, -1.287992, 2.271636, 0.9098039, 0, 1, 1,
0.8698201, 0.4542884, 0.242186, 0.9137255, 0, 1, 1,
0.8705345, -0.8132121, 2.676584, 0.9215686, 0, 1, 1,
0.8765932, 0.3138814, 1.231446, 0.9254902, 0, 1, 1,
0.8787495, 0.3813339, 1.643348, 0.9333333, 0, 1, 1,
0.8789403, -1.129448, 3.228181, 0.9372549, 0, 1, 1,
0.8805971, -0.5179387, 1.283942, 0.945098, 0, 1, 1,
0.8899438, -2.828692, 3.756245, 0.9490196, 0, 1, 1,
0.8911648, -1.277928, 2.9575, 0.9568627, 0, 1, 1,
0.8921045, -0.07698778, 2.371858, 0.9607843, 0, 1, 1,
0.8974717, -0.2714287, 2.757523, 0.9686275, 0, 1, 1,
0.9018377, -0.8091133, 2.147375, 0.972549, 0, 1, 1,
0.902136, 0.4725019, 0.476171, 0.9803922, 0, 1, 1,
0.9112715, 0.9786187, 2.512738, 0.9843137, 0, 1, 1,
0.9112815, -0.3652302, 0.4837191, 0.9921569, 0, 1, 1,
0.9124587, -0.2327137, 0.2191438, 0.9960784, 0, 1, 1,
0.9126933, 0.5657324, 1.953203, 1, 0, 0.9960784, 1,
0.9197572, -1.818728, 3.029275, 1, 0, 0.9882353, 1,
0.9284074, 0.8030676, 1.128094, 1, 0, 0.9843137, 1,
0.9352509, -0.5649502, 1.790047, 1, 0, 0.9764706, 1,
0.9366205, -1.453487, 2.764833, 1, 0, 0.972549, 1,
0.938012, -0.2266339, 1.050732, 1, 0, 0.9647059, 1,
0.9412857, 0.4786291, -0.0635575, 1, 0, 0.9607843, 1,
0.9416387, -0.3383383, 2.36002, 1, 0, 0.9529412, 1,
0.9431201, 0.1211831, 0.5942034, 1, 0, 0.9490196, 1,
0.944934, -2.438547, 1.525291, 1, 0, 0.9411765, 1,
0.9462532, 0.9360756, 0.4445974, 1, 0, 0.9372549, 1,
0.9484612, 0.1165906, 1.411955, 1, 0, 0.9294118, 1,
0.9484913, 0.7549258, 0.1661616, 1, 0, 0.9254902, 1,
0.9506196, 0.8837346, 2.890725, 1, 0, 0.9176471, 1,
0.9582457, -1.509343, 3.66897, 1, 0, 0.9137255, 1,
0.9690219, -1.271266, 3.623393, 1, 0, 0.9058824, 1,
0.9743661, -0.6306261, 1.734782, 1, 0, 0.9019608, 1,
0.9824923, 0.005710918, 3.318523, 1, 0, 0.8941177, 1,
0.9875121, 0.4518066, 1.114122, 1, 0, 0.8862745, 1,
0.9877074, -0.7778969, 2.316125, 1, 0, 0.8823529, 1,
0.993022, 0.3072071, 2.087682, 1, 0, 0.8745098, 1,
0.996736, 0.0272548, 2.157626, 1, 0, 0.8705882, 1,
1.014255, -0.5230847, 1.535126, 1, 0, 0.8627451, 1,
1.016439, 1.481653, -1.090719, 1, 0, 0.8588235, 1,
1.019692, 1.315214, 1.856356, 1, 0, 0.8509804, 1,
1.02017, 1.525775, 1.018896, 1, 0, 0.8470588, 1,
1.024472, -0.6583309, 2.239778, 1, 0, 0.8392157, 1,
1.027749, -0.1121658, 1.267589, 1, 0, 0.8352941, 1,
1.028515, -0.3914914, 0.8832132, 1, 0, 0.827451, 1,
1.03682, 0.4882132, 2.501845, 1, 0, 0.8235294, 1,
1.046995, -0.5574506, 3.981955, 1, 0, 0.8156863, 1,
1.047324, -1.167231, 2.380569, 1, 0, 0.8117647, 1,
1.04753, -1.176059, 2.689979, 1, 0, 0.8039216, 1,
1.064197, -0.5080402, 0.6315961, 1, 0, 0.7960784, 1,
1.070802, 0.3477091, 0.6175477, 1, 0, 0.7921569, 1,
1.075407, -0.8132053, 2.765197, 1, 0, 0.7843137, 1,
1.077789, 2.577399, -2.258153, 1, 0, 0.7803922, 1,
1.092122, -0.3204627, 0.6952188, 1, 0, 0.772549, 1,
1.095668, -1.296993, 1.989808, 1, 0, 0.7686275, 1,
1.096917, 0.114402, 2.572519, 1, 0, 0.7607843, 1,
1.103395, -0.7522638, 3.259679, 1, 0, 0.7568628, 1,
1.110801, 2.353763, 0.9259707, 1, 0, 0.7490196, 1,
1.113187, -1.407433, 2.679286, 1, 0, 0.7450981, 1,
1.113285, -1.292462, 2.952877, 1, 0, 0.7372549, 1,
1.114491, 1.826351, 1.038083, 1, 0, 0.7333333, 1,
1.121067, -1.261065, 1.592714, 1, 0, 0.7254902, 1,
1.123111, 0.4120933, 1.772923, 1, 0, 0.7215686, 1,
1.124874, -1.851202, 3.133761, 1, 0, 0.7137255, 1,
1.126805, -0.6016835, 3.263491, 1, 0, 0.7098039, 1,
1.133392, 1.454747, 0.4957767, 1, 0, 0.7019608, 1,
1.153219, 0.6419876, 1.586317, 1, 0, 0.6941177, 1,
1.154286, -0.120441, 2.473334, 1, 0, 0.6901961, 1,
1.162803, 1.781816, 1.231208, 1, 0, 0.682353, 1,
1.164599, -0.2441166, 0.7260805, 1, 0, 0.6784314, 1,
1.165737, 1.831645, 2.966636, 1, 0, 0.6705883, 1,
1.169199, -1.147702, 2.045473, 1, 0, 0.6666667, 1,
1.175648, 1.045884, 0.6588441, 1, 0, 0.6588235, 1,
1.177194, -1.700588, 2.876241, 1, 0, 0.654902, 1,
1.177757, -0.8462642, 1.607348, 1, 0, 0.6470588, 1,
1.179169, 2.546577, 1.448516, 1, 0, 0.6431373, 1,
1.185119, 0.7194474, 0.1638098, 1, 0, 0.6352941, 1,
1.188969, -0.3909138, 2.16482, 1, 0, 0.6313726, 1,
1.19135, 2.254518, 0.4754407, 1, 0, 0.6235294, 1,
1.204234, 0.3750885, 0.4711971, 1, 0, 0.6196079, 1,
1.205066, -2.476728, 2.175525, 1, 0, 0.6117647, 1,
1.209395, -0.5981904, 2.724682, 1, 0, 0.6078432, 1,
1.220332, -0.7703598, 2.011347, 1, 0, 0.6, 1,
1.231282, 1.076223, 1.400087, 1, 0, 0.5921569, 1,
1.23293, 1.092042, 0.9367754, 1, 0, 0.5882353, 1,
1.24077, -0.9800069, 2.695351, 1, 0, 0.5803922, 1,
1.242604, -0.3105496, 3.106095, 1, 0, 0.5764706, 1,
1.250128, 0.4532559, 1.047152, 1, 0, 0.5686275, 1,
1.250987, -1.744037, 0.5033606, 1, 0, 0.5647059, 1,
1.255124, 0.5248891, 2.655718, 1, 0, 0.5568628, 1,
1.256045, 2.088342, 1.248114, 1, 0, 0.5529412, 1,
1.26086, 0.5679046, 1.24505, 1, 0, 0.5450981, 1,
1.261903, -1.542487, 2.77476, 1, 0, 0.5411765, 1,
1.267267, -0.1906752, 1.669386, 1, 0, 0.5333334, 1,
1.29207, -2.48536, 2.275299, 1, 0, 0.5294118, 1,
1.29599, -0.1970001, 3.342733, 1, 0, 0.5215687, 1,
1.302737, -0.9078864, 2.866813, 1, 0, 0.5176471, 1,
1.304666, -0.9723126, 3.028294, 1, 0, 0.509804, 1,
1.319144, 0.3198361, 2.335058, 1, 0, 0.5058824, 1,
1.340132, 0.5052891, 1.833619, 1, 0, 0.4980392, 1,
1.342911, 0.03970568, 1.414914, 1, 0, 0.4901961, 1,
1.347273, -1.226031, 2.214526, 1, 0, 0.4862745, 1,
1.355525, -0.9805522, 1.380912, 1, 0, 0.4784314, 1,
1.36299, 0.86537, -0.4771246, 1, 0, 0.4745098, 1,
1.373113, 0.2871244, -0.894009, 1, 0, 0.4666667, 1,
1.387464, -2.772891, 3.706509, 1, 0, 0.4627451, 1,
1.40178, -0.2613205, 0.4867561, 1, 0, 0.454902, 1,
1.405989, -0.6644683, 2.707345, 1, 0, 0.4509804, 1,
1.410465, 0.06492825, 0.6124636, 1, 0, 0.4431373, 1,
1.413967, 0.2119585, 3.104527, 1, 0, 0.4392157, 1,
1.427833, 0.5103993, 2.112433, 1, 0, 0.4313726, 1,
1.431509, 0.8559865, -1.243392, 1, 0, 0.427451, 1,
1.442598, 0.5443251, 2.043388, 1, 0, 0.4196078, 1,
1.467433, -0.0333719, -0.5912071, 1, 0, 0.4156863, 1,
1.476303, 1.524181, -0.1557824, 1, 0, 0.4078431, 1,
1.481484, 0.5643404, 2.380752, 1, 0, 0.4039216, 1,
1.505962, -1.70399, 1.572373, 1, 0, 0.3960784, 1,
1.515903, 0.3033529, 0.5893171, 1, 0, 0.3882353, 1,
1.519592, 0.1133826, 1.490893, 1, 0, 0.3843137, 1,
1.525673, -0.1679131, 2.235638, 1, 0, 0.3764706, 1,
1.534057, 0.8795004, 0.7069978, 1, 0, 0.372549, 1,
1.558611, 0.4476306, 2.166694, 1, 0, 0.3647059, 1,
1.563135, 0.1022865, 0.7013428, 1, 0, 0.3607843, 1,
1.570693, 1.03568, 1.312461, 1, 0, 0.3529412, 1,
1.577246, 2.418099, 2.776958, 1, 0, 0.3490196, 1,
1.578517, 0.2765384, 2.714561, 1, 0, 0.3411765, 1,
1.588433, 1.877391, 0.05116769, 1, 0, 0.3372549, 1,
1.591551, -0.9082181, 0.6064405, 1, 0, 0.3294118, 1,
1.600834, 0.7216352, 2.447999, 1, 0, 0.3254902, 1,
1.605059, 0.7509464, 2.861415, 1, 0, 0.3176471, 1,
1.607965, -1.486951, 1.257755, 1, 0, 0.3137255, 1,
1.612327, -0.420244, 0.8574513, 1, 0, 0.3058824, 1,
1.624802, -1.632737, 2.226994, 1, 0, 0.2980392, 1,
1.653526, -0.2023307, -0.5759134, 1, 0, 0.2941177, 1,
1.65996, 0.3632681, -0.6206845, 1, 0, 0.2862745, 1,
1.675894, -1.190135, 0.607639, 1, 0, 0.282353, 1,
1.67949, 0.390329, 1.631907, 1, 0, 0.2745098, 1,
1.681928, -1.53393, 2.142416, 1, 0, 0.2705882, 1,
1.685616, -1.326313, -0.2024029, 1, 0, 0.2627451, 1,
1.691903, 1.270897, 2.846273, 1, 0, 0.2588235, 1,
1.695123, 1.771504, 2.421502, 1, 0, 0.2509804, 1,
1.700608, -1.933307, 1.247638, 1, 0, 0.2470588, 1,
1.767934, -0.4065272, 3.177948, 1, 0, 0.2392157, 1,
1.774983, 1.113003, 2.223718, 1, 0, 0.2352941, 1,
1.778565, -0.8024824, 1.576176, 1, 0, 0.227451, 1,
1.782771, 1.279806, 1.639463, 1, 0, 0.2235294, 1,
1.783108, 0.582813, 1.6434, 1, 0, 0.2156863, 1,
1.790839, 1.431699, 1.822426, 1, 0, 0.2117647, 1,
1.807236, -0.1614118, 0.7287626, 1, 0, 0.2039216, 1,
1.813573, -0.2867373, 1.683442, 1, 0, 0.1960784, 1,
1.820712, 0.7782102, 1.172928, 1, 0, 0.1921569, 1,
1.850469, -0.09161389, 1.41095, 1, 0, 0.1843137, 1,
1.851185, -1.606383, 2.930783, 1, 0, 0.1803922, 1,
1.863815, -0.114554, 1.807072, 1, 0, 0.172549, 1,
1.865388, 0.646406, 1.685492, 1, 0, 0.1686275, 1,
1.891826, 0.03262649, 2.437604, 1, 0, 0.1607843, 1,
1.919616, -0.5636398, 1.395569, 1, 0, 0.1568628, 1,
1.931813, -0.7704484, 2.423322, 1, 0, 0.1490196, 1,
1.941214, 1.103621, 1.552073, 1, 0, 0.145098, 1,
1.954523, 0.01538498, -0.419753, 1, 0, 0.1372549, 1,
2.00016, 0.2455144, 1.545368, 1, 0, 0.1333333, 1,
2.020115, 0.7569422, 1.595958, 1, 0, 0.1254902, 1,
2.030795, 0.4513794, 1.585531, 1, 0, 0.1215686, 1,
2.04437, -1.932426, 1.491464, 1, 0, 0.1137255, 1,
2.067984, 0.2268097, 0.7322931, 1, 0, 0.1098039, 1,
2.094012, 0.2880124, 1.110335, 1, 0, 0.1019608, 1,
2.120026, 0.2238035, 2.918735, 1, 0, 0.09411765, 1,
2.121077, 0.7426244, 1.544637, 1, 0, 0.09019608, 1,
2.175301, 0.7964174, 1.510148, 1, 0, 0.08235294, 1,
2.183766, -2.145914, 3.083989, 1, 0, 0.07843138, 1,
2.185448, 0.2448885, 1.181121, 1, 0, 0.07058824, 1,
2.189684, -0.2715832, 2.227942, 1, 0, 0.06666667, 1,
2.244784, -0.5335937, 1.395615, 1, 0, 0.05882353, 1,
2.256288, -1.089804, 0.2064244, 1, 0, 0.05490196, 1,
2.345492, 0.4386629, 1.289082, 1, 0, 0.04705882, 1,
2.485826, -0.231821, 0.4011113, 1, 0, 0.04313726, 1,
2.503138, -0.7856462, 2.284164, 1, 0, 0.03529412, 1,
2.504198, -1.019329, 1.441774, 1, 0, 0.03137255, 1,
2.584094, -0.4394594, 1.986476, 1, 0, 0.02352941, 1,
2.67904, 0.1192384, 1.979588, 1, 0, 0.01960784, 1,
2.78122, 0.4262365, 2.199715, 1, 0, 0.01176471, 1,
2.790736, 0.362278, 2.086277, 1, 0, 0.007843138, 1
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
-0.2038662, -3.965019, -6.640714, 0, -0.5, 0.5, 0.5,
-0.2038662, -3.965019, -6.640714, 1, -0.5, 0.5, 0.5,
-0.2038662, -3.965019, -6.640714, 1, 1.5, 0.5, 0.5,
-0.2038662, -3.965019, -6.640714, 0, 1.5, 0.5, 0.5
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
-4.213639, 0.05420065, -6.640714, 0, -0.5, 0.5, 0.5,
-4.213639, 0.05420065, -6.640714, 1, -0.5, 0.5, 0.5,
-4.213639, 0.05420065, -6.640714, 1, 1.5, 0.5, 0.5,
-4.213639, 0.05420065, -6.640714, 0, 1.5, 0.5, 0.5
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
-4.213639, -3.965019, -0.1173863, 0, -0.5, 0.5, 0.5,
-4.213639, -3.965019, -0.1173863, 1, -0.5, 0.5, 0.5,
-4.213639, -3.965019, -0.1173863, 1, 1.5, 0.5, 0.5,
-4.213639, -3.965019, -0.1173863, 0, 1.5, 0.5, 0.5
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
-3, -3.037507, -5.135331,
2, -3.037507, -5.135331,
-3, -3.037507, -5.135331,
-3, -3.192092, -5.386228,
-2, -3.037507, -5.135331,
-2, -3.192092, -5.386228,
-1, -3.037507, -5.135331,
-1, -3.192092, -5.386228,
0, -3.037507, -5.135331,
0, -3.192092, -5.386228,
1, -3.037507, -5.135331,
1, -3.192092, -5.386228,
2, -3.037507, -5.135331,
2, -3.192092, -5.386228
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
-3, -3.501263, -5.888022, 0, -0.5, 0.5, 0.5,
-3, -3.501263, -5.888022, 1, -0.5, 0.5, 0.5,
-3, -3.501263, -5.888022, 1, 1.5, 0.5, 0.5,
-3, -3.501263, -5.888022, 0, 1.5, 0.5, 0.5,
-2, -3.501263, -5.888022, 0, -0.5, 0.5, 0.5,
-2, -3.501263, -5.888022, 1, -0.5, 0.5, 0.5,
-2, -3.501263, -5.888022, 1, 1.5, 0.5, 0.5,
-2, -3.501263, -5.888022, 0, 1.5, 0.5, 0.5,
-1, -3.501263, -5.888022, 0, -0.5, 0.5, 0.5,
-1, -3.501263, -5.888022, 1, -0.5, 0.5, 0.5,
-1, -3.501263, -5.888022, 1, 1.5, 0.5, 0.5,
-1, -3.501263, -5.888022, 0, 1.5, 0.5, 0.5,
0, -3.501263, -5.888022, 0, -0.5, 0.5, 0.5,
0, -3.501263, -5.888022, 1, -0.5, 0.5, 0.5,
0, -3.501263, -5.888022, 1, 1.5, 0.5, 0.5,
0, -3.501263, -5.888022, 0, 1.5, 0.5, 0.5,
1, -3.501263, -5.888022, 0, -0.5, 0.5, 0.5,
1, -3.501263, -5.888022, 1, -0.5, 0.5, 0.5,
1, -3.501263, -5.888022, 1, 1.5, 0.5, 0.5,
1, -3.501263, -5.888022, 0, 1.5, 0.5, 0.5,
2, -3.501263, -5.888022, 0, -0.5, 0.5, 0.5,
2, -3.501263, -5.888022, 1, -0.5, 0.5, 0.5,
2, -3.501263, -5.888022, 1, 1.5, 0.5, 0.5,
2, -3.501263, -5.888022, 0, 1.5, 0.5, 0.5
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
-3.288306, -2, -5.135331,
-3.288306, 3, -5.135331,
-3.288306, -2, -5.135331,
-3.442528, -2, -5.386228,
-3.288306, -1, -5.135331,
-3.442528, -1, -5.386228,
-3.288306, 0, -5.135331,
-3.442528, 0, -5.386228,
-3.288306, 1, -5.135331,
-3.442528, 1, -5.386228,
-3.288306, 2, -5.135331,
-3.442528, 2, -5.386228,
-3.288306, 3, -5.135331,
-3.442528, 3, -5.386228
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
-3.750973, -2, -5.888022, 0, -0.5, 0.5, 0.5,
-3.750973, -2, -5.888022, 1, -0.5, 0.5, 0.5,
-3.750973, -2, -5.888022, 1, 1.5, 0.5, 0.5,
-3.750973, -2, -5.888022, 0, 1.5, 0.5, 0.5,
-3.750973, -1, -5.888022, 0, -0.5, 0.5, 0.5,
-3.750973, -1, -5.888022, 1, -0.5, 0.5, 0.5,
-3.750973, -1, -5.888022, 1, 1.5, 0.5, 0.5,
-3.750973, -1, -5.888022, 0, 1.5, 0.5, 0.5,
-3.750973, 0, -5.888022, 0, -0.5, 0.5, 0.5,
-3.750973, 0, -5.888022, 1, -0.5, 0.5, 0.5,
-3.750973, 0, -5.888022, 1, 1.5, 0.5, 0.5,
-3.750973, 0, -5.888022, 0, 1.5, 0.5, 0.5,
-3.750973, 1, -5.888022, 0, -0.5, 0.5, 0.5,
-3.750973, 1, -5.888022, 1, -0.5, 0.5, 0.5,
-3.750973, 1, -5.888022, 1, 1.5, 0.5, 0.5,
-3.750973, 1, -5.888022, 0, 1.5, 0.5, 0.5,
-3.750973, 2, -5.888022, 0, -0.5, 0.5, 0.5,
-3.750973, 2, -5.888022, 1, -0.5, 0.5, 0.5,
-3.750973, 2, -5.888022, 1, 1.5, 0.5, 0.5,
-3.750973, 2, -5.888022, 0, 1.5, 0.5, 0.5,
-3.750973, 3, -5.888022, 0, -0.5, 0.5, 0.5,
-3.750973, 3, -5.888022, 1, -0.5, 0.5, 0.5,
-3.750973, 3, -5.888022, 1, 1.5, 0.5, 0.5,
-3.750973, 3, -5.888022, 0, 1.5, 0.5, 0.5
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
-3.288306, -3.037507, -4,
-3.288306, -3.037507, 4,
-3.288306, -3.037507, -4,
-3.442528, -3.192092, -4,
-3.288306, -3.037507, -2,
-3.442528, -3.192092, -2,
-3.288306, -3.037507, 0,
-3.442528, -3.192092, 0,
-3.288306, -3.037507, 2,
-3.442528, -3.192092, 2,
-3.288306, -3.037507, 4,
-3.442528, -3.192092, 4
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
-3.750973, -3.501263, -4, 0, -0.5, 0.5, 0.5,
-3.750973, -3.501263, -4, 1, -0.5, 0.5, 0.5,
-3.750973, -3.501263, -4, 1, 1.5, 0.5, 0.5,
-3.750973, -3.501263, -4, 0, 1.5, 0.5, 0.5,
-3.750973, -3.501263, -2, 0, -0.5, 0.5, 0.5,
-3.750973, -3.501263, -2, 1, -0.5, 0.5, 0.5,
-3.750973, -3.501263, -2, 1, 1.5, 0.5, 0.5,
-3.750973, -3.501263, -2, 0, 1.5, 0.5, 0.5,
-3.750973, -3.501263, 0, 0, -0.5, 0.5, 0.5,
-3.750973, -3.501263, 0, 1, -0.5, 0.5, 0.5,
-3.750973, -3.501263, 0, 1, 1.5, 0.5, 0.5,
-3.750973, -3.501263, 0, 0, 1.5, 0.5, 0.5,
-3.750973, -3.501263, 2, 0, -0.5, 0.5, 0.5,
-3.750973, -3.501263, 2, 1, -0.5, 0.5, 0.5,
-3.750973, -3.501263, 2, 1, 1.5, 0.5, 0.5,
-3.750973, -3.501263, 2, 0, 1.5, 0.5, 0.5,
-3.750973, -3.501263, 4, 0, -0.5, 0.5, 0.5,
-3.750973, -3.501263, 4, 1, -0.5, 0.5, 0.5,
-3.750973, -3.501263, 4, 1, 1.5, 0.5, 0.5,
-3.750973, -3.501263, 4, 0, 1.5, 0.5, 0.5
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
-3.288306, -3.037507, -5.135331,
-3.288306, 3.145908, -5.135331,
-3.288306, -3.037507, 4.900558,
-3.288306, 3.145908, 4.900558,
-3.288306, -3.037507, -5.135331,
-3.288306, -3.037507, 4.900558,
-3.288306, 3.145908, -5.135331,
-3.288306, 3.145908, 4.900558,
-3.288306, -3.037507, -5.135331,
2.880574, -3.037507, -5.135331,
-3.288306, -3.037507, 4.900558,
2.880574, -3.037507, 4.900558,
-3.288306, 3.145908, -5.135331,
2.880574, 3.145908, -5.135331,
-3.288306, 3.145908, 4.900558,
2.880574, 3.145908, 4.900558,
2.880574, -3.037507, -5.135331,
2.880574, 3.145908, -5.135331,
2.880574, -3.037507, 4.900558,
2.880574, 3.145908, 4.900558,
2.880574, -3.037507, -5.135331,
2.880574, -3.037507, 4.900558,
2.880574, 3.145908, -5.135331,
2.880574, 3.145908, 4.900558
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
var radius = 7.104326;
var distance = 31.60795;
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
mvMatrix.translate( 0.2038662, -0.05420065, 0.1173863 );
mvMatrix.scale( 1.245175, 1.242248, 0.7653867 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.60795);
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
ZnSO4<-read.table("ZnSO4.xyz")
```

```
## Error in read.table("ZnSO4.xyz"): no lines available in input
```

```r
x<-ZnSO4$V2
```

```
## Error in eval(expr, envir, enclos): object 'ZnSO4' not found
```

```r
y<-ZnSO4$V3
```

```
## Error in eval(expr, envir, enclos): object 'ZnSO4' not found
```

```r
z<-ZnSO4$V4
```

```
## Error in eval(expr, envir, enclos): object 'ZnSO4' not found
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
-3.198468, -0.5650661, -2.084265, 0, 0, 1, 1, 1,
-2.592918, 1.362881, -1.369865, 1, 0, 0, 1, 1,
-2.541133, -0.4707623, -0.6962839, 1, 0, 0, 1, 1,
-2.513648, 1.167906, -2.923275, 1, 0, 0, 1, 1,
-2.373815, 0.1361533, -1.74979, 1, 0, 0, 1, 1,
-2.328032, 0.6019195, -1.852555, 1, 0, 0, 1, 1,
-2.301344, -0.9617198, -2.303239, 0, 0, 0, 1, 1,
-2.281278, 0.1770189, -1.257981, 0, 0, 0, 1, 1,
-2.237995, 0.3439502, -2.460557, 0, 0, 0, 1, 1,
-2.183331, -1.077706, -2.573573, 0, 0, 0, 1, 1,
-2.17902, -1.786334, -1.622717, 0, 0, 0, 1, 1,
-2.16898, -1.579531, -0.9047745, 0, 0, 0, 1, 1,
-2.137265, -0.7121592, -3.436288, 0, 0, 0, 1, 1,
-2.136242, 1.481117, -2.048858, 1, 1, 1, 1, 1,
-2.123268, -0.2781407, -2.559643, 1, 1, 1, 1, 1,
-2.104298, -0.5454401, -1.484711, 1, 1, 1, 1, 1,
-2.088903, -0.5090352, -0.005479935, 1, 1, 1, 1, 1,
-2.054197, 1.369263, 0.6344594, 1, 1, 1, 1, 1,
-2.028122, -0.233535, -2.217891, 1, 1, 1, 1, 1,
-2.016085, 1.317384, -1.309334, 1, 1, 1, 1, 1,
-1.977706, 1.699196, -0.220561, 1, 1, 1, 1, 1,
-1.946158, 0.7153512, -0.6373792, 1, 1, 1, 1, 1,
-1.933197, 1.03178, -0.9604505, 1, 1, 1, 1, 1,
-1.923006, 1.038233, -1.713511, 1, 1, 1, 1, 1,
-1.915307, -1.037386, -2.549069, 1, 1, 1, 1, 1,
-1.905467, -0.2790688, -0.7083058, 1, 1, 1, 1, 1,
-1.899918, -0.1904216, -1.337834, 1, 1, 1, 1, 1,
-1.899533, -0.6429307, -2.576678, 1, 1, 1, 1, 1,
-1.894334, 0.04504696, -1.457728, 0, 0, 1, 1, 1,
-1.885765, -1.861287, -0.6723644, 1, 0, 0, 1, 1,
-1.884604, -1.019064, -1.982998, 1, 0, 0, 1, 1,
-1.87325, -0.9250865, 0.0003193192, 1, 0, 0, 1, 1,
-1.870419, 1.91312, -1.048265, 1, 0, 0, 1, 1,
-1.865152, -2.123504, -2.457402, 1, 0, 0, 1, 1,
-1.854276, 1.611873, -1.4227, 0, 0, 0, 1, 1,
-1.853114, -0.565843, -2.610152, 0, 0, 0, 1, 1,
-1.832708, -0.8786057, -2.368196, 0, 0, 0, 1, 1,
-1.832244, -0.74725, -1.898229, 0, 0, 0, 1, 1,
-1.8155, -0.04170181, -2.481413, 0, 0, 0, 1, 1,
-1.814681, -0.9170094, -2.452127, 0, 0, 0, 1, 1,
-1.794889, -0.2128519, -1.517375, 0, 0, 0, 1, 1,
-1.783505, 0.7609059, -1.036658, 1, 1, 1, 1, 1,
-1.783111, 1.116619, 0.2622847, 1, 1, 1, 1, 1,
-1.722304, -0.08591267, -1.447622, 1, 1, 1, 1, 1,
-1.706448, -0.06212031, -2.187653, 1, 1, 1, 1, 1,
-1.678498, -0.338017, -2.426442, 1, 1, 1, 1, 1,
-1.667553, 0.3249138, -2.9437, 1, 1, 1, 1, 1,
-1.666368, -0.7133667, -1.340372, 1, 1, 1, 1, 1,
-1.665004, 0.06009573, -1.26193, 1, 1, 1, 1, 1,
-1.632716, -1.737782, -1.969932, 1, 1, 1, 1, 1,
-1.606228, 1.396117, -3.653206, 1, 1, 1, 1, 1,
-1.604467, 2.182861, 0.6192557, 1, 1, 1, 1, 1,
-1.601302, -0.350654, -0.5149568, 1, 1, 1, 1, 1,
-1.59876, 0.4136788, 0.5496846, 1, 1, 1, 1, 1,
-1.594755, 0.4468426, -0.6341935, 1, 1, 1, 1, 1,
-1.584446, -1.365758, -2.834981, 1, 1, 1, 1, 1,
-1.569284, -1.242384, -3.397377, 0, 0, 1, 1, 1,
-1.549041, 0.2638426, -0.2810467, 1, 0, 0, 1, 1,
-1.548285, 0.5907882, -1.353964, 1, 0, 0, 1, 1,
-1.536629, 1.077849, -0.2792064, 1, 0, 0, 1, 1,
-1.536549, 1.167846, -1.352038, 1, 0, 0, 1, 1,
-1.535246, -0.5806616, -3.693111, 1, 0, 0, 1, 1,
-1.531681, -0.320662, 0.6576955, 0, 0, 0, 1, 1,
-1.508376, -0.1932906, -3.864962, 0, 0, 0, 1, 1,
-1.494626, -0.3884021, -2.078063, 0, 0, 0, 1, 1,
-1.493581, 0.502634, -0.7147234, 0, 0, 0, 1, 1,
-1.489586, 0.0416143, -3.062165, 0, 0, 0, 1, 1,
-1.482227, 0.7657797, -1.761087, 0, 0, 0, 1, 1,
-1.471751, -0.2635672, -1.918617, 0, 0, 0, 1, 1,
-1.457109, -1.221042, -2.462335, 1, 1, 1, 1, 1,
-1.455382, 0.0438979, -0.9449484, 1, 1, 1, 1, 1,
-1.438851, -0.8192612, -1.967688, 1, 1, 1, 1, 1,
-1.429259, 0.6678553, -1.92243, 1, 1, 1, 1, 1,
-1.418531, 1.326891, 0.1295753, 1, 1, 1, 1, 1,
-1.417563, 0.0156331, -0.4950139, 1, 1, 1, 1, 1,
-1.410388, 0.03281989, -2.112529, 1, 1, 1, 1, 1,
-1.393326, 3.055858, 0.06574064, 1, 1, 1, 1, 1,
-1.384986, -0.914966, -2.917879, 1, 1, 1, 1, 1,
-1.375187, -1.178575, -3.259664, 1, 1, 1, 1, 1,
-1.372599, -0.8633078, -1.429972, 1, 1, 1, 1, 1,
-1.368307, -1.750688, -1.851036, 1, 1, 1, 1, 1,
-1.358724, 2.415542, -0.03372835, 1, 1, 1, 1, 1,
-1.340791, -1.824779, -2.976584, 1, 1, 1, 1, 1,
-1.337441, 0.6652755, -1.343878, 1, 1, 1, 1, 1,
-1.336371, -0.5161223, -0.3849154, 0, 0, 1, 1, 1,
-1.335556, 0.8747655, 0.2057217, 1, 0, 0, 1, 1,
-1.321705, 0.5990978, -0.879854, 1, 0, 0, 1, 1,
-1.318316, 2.890898, 1.454629, 1, 0, 0, 1, 1,
-1.310424, -1.643268, -3.431334, 1, 0, 0, 1, 1,
-1.301855, -1.371219, -0.3176786, 1, 0, 0, 1, 1,
-1.301673, 1.87796, 0.8385984, 0, 0, 0, 1, 1,
-1.293065, 2.040321, 0.9167466, 0, 0, 0, 1, 1,
-1.287956, -1.886665, -2.350684, 0, 0, 0, 1, 1,
-1.286203, -0.5136859, -2.60626, 0, 0, 0, 1, 1,
-1.279745, 0.4444126, -1.579621, 0, 0, 0, 1, 1,
-1.272945, -0.681589, -1.215631, 0, 0, 0, 1, 1,
-1.27227, -0.009740803, -3.309893, 0, 0, 0, 1, 1,
-1.258335, 2.090023, 0.676979, 1, 1, 1, 1, 1,
-1.256629, 1.962768, -0.111714, 1, 1, 1, 1, 1,
-1.253901, -0.1740642, -0.4953234, 1, 1, 1, 1, 1,
-1.246664, 0.163772, -1.696315, 1, 1, 1, 1, 1,
-1.240242, -1.636392, -1.988359, 1, 1, 1, 1, 1,
-1.228601, -0.8193901, -1.801613, 1, 1, 1, 1, 1,
-1.214504, 0.6803517, -0.04718455, 1, 1, 1, 1, 1,
-1.20012, 0.7764834, -0.3927031, 1, 1, 1, 1, 1,
-1.198421, -2.025463, -3.49353, 1, 1, 1, 1, 1,
-1.196951, -0.01426238, -0.7251554, 1, 1, 1, 1, 1,
-1.191155, -0.449942, -1.932792, 1, 1, 1, 1, 1,
-1.181792, 0.8907639, -1.615105, 1, 1, 1, 1, 1,
-1.17868, 1.238092, -2.07529, 1, 1, 1, 1, 1,
-1.177278, 0.6304955, -0.2357792, 1, 1, 1, 1, 1,
-1.173681, 0.1375598, 0.1428685, 1, 1, 1, 1, 1,
-1.170251, -0.3640963, -1.916385, 0, 0, 1, 1, 1,
-1.166306, -0.8180532, -3.48638, 1, 0, 0, 1, 1,
-1.16318, 2.758151, -0.1208688, 1, 0, 0, 1, 1,
-1.16309, -0.1119828, -1.295457, 1, 0, 0, 1, 1,
-1.155789, -0.2136796, -0.5257716, 1, 0, 0, 1, 1,
-1.123908, 0.3900577, -2.066849, 1, 0, 0, 1, 1,
-1.1151, -0.2039801, -1.854497, 0, 0, 0, 1, 1,
-1.114905, 1.977985, -1.439471, 0, 0, 0, 1, 1,
-1.108667, 0.1039395, -2.648085, 0, 0, 0, 1, 1,
-1.105121, -0.2703133, -2.139581, 0, 0, 0, 1, 1,
-1.095021, -0.9229535, -1.945057, 0, 0, 0, 1, 1,
-1.094713, 0.4385138, -0.6283987, 0, 0, 0, 1, 1,
-1.084962, -1.205163, -2.889877, 0, 0, 0, 1, 1,
-1.07688, 0.6250337, -2.501743, 1, 1, 1, 1, 1,
-1.075416, 2.082306, -2.336389, 1, 1, 1, 1, 1,
-1.067677, 0.289864, -2.041644, 1, 1, 1, 1, 1,
-1.065786, 0.1898375, -1.56801, 1, 1, 1, 1, 1,
-1.057253, 1.550001, -0.293145, 1, 1, 1, 1, 1,
-1.046449, -1.514635, -2.417486, 1, 1, 1, 1, 1,
-1.04559, -0.561725, -1.008331, 1, 1, 1, 1, 1,
-1.043702, -0.299076, -1.428256, 1, 1, 1, 1, 1,
-1.042547, 1.288583, -0.5530526, 1, 1, 1, 1, 1,
-1.033172, 0.5583707, -2.176516, 1, 1, 1, 1, 1,
-1.03168, -2.088707, -0.9656049, 1, 1, 1, 1, 1,
-1.029948, 1.90915, -1.464881, 1, 1, 1, 1, 1,
-1.028877, -0.2680159, -2.454656, 1, 1, 1, 1, 1,
-1.018587, -1.197282, -1.383016, 1, 1, 1, 1, 1,
-1.014541, -0.8348885, -0.6997684, 1, 1, 1, 1, 1,
-1.013946, 1.772748, 0.386054, 0, 0, 1, 1, 1,
-1.003406, -0.4205558, -1.537486, 1, 0, 0, 1, 1,
-0.9937047, -1.29231, -4.191944, 1, 0, 0, 1, 1,
-0.9905491, -0.4398754, -1.830235, 1, 0, 0, 1, 1,
-0.9876886, -1.645915, -3.111077, 1, 0, 0, 1, 1,
-0.9869431, 0.1941132, -1.28423, 1, 0, 0, 1, 1,
-0.9825965, -1.062933, -2.618852, 0, 0, 0, 1, 1,
-0.9803624, -0.3970466, -2.720485, 0, 0, 0, 1, 1,
-0.9766232, -0.6283041, -2.969305, 0, 0, 0, 1, 1,
-0.9701222, 0.4707917, -1.194547, 0, 0, 0, 1, 1,
-0.9673911, 0.2696835, -0.3980477, 0, 0, 0, 1, 1,
-0.9565244, -0.4198557, -3.22694, 0, 0, 0, 1, 1,
-0.9509174, -0.8231939, -4.39474, 0, 0, 0, 1, 1,
-0.9468148, -0.1669712, 0.2890095, 1, 1, 1, 1, 1,
-0.9466795, 1.66825, -1.040199, 1, 1, 1, 1, 1,
-0.9389806, 0.3009043, -1.068359, 1, 1, 1, 1, 1,
-0.9389628, -0.3459021, -1.681567, 1, 1, 1, 1, 1,
-0.9364087, 0.6891055, 0.08486282, 1, 1, 1, 1, 1,
-0.9270109, -0.4183094, -3.497677, 1, 1, 1, 1, 1,
-0.917967, -1.398057, -3.444308, 1, 1, 1, 1, 1,
-0.9179145, -0.4244939, -1.741941, 1, 1, 1, 1, 1,
-0.9172531, -1.235708, -1.446129, 1, 1, 1, 1, 1,
-0.916589, -0.0695948, 0.5668358, 1, 1, 1, 1, 1,
-0.9158286, 0.9487784, 0.5189565, 1, 1, 1, 1, 1,
-0.9152643, 0.7476124, 0.4668581, 1, 1, 1, 1, 1,
-0.9049572, -0.1547965, -2.682801, 1, 1, 1, 1, 1,
-0.9026296, 0.5750027, -2.433956, 1, 1, 1, 1, 1,
-0.8979897, 0.3164147, -1.531234, 1, 1, 1, 1, 1,
-0.8924873, -0.05197726, -1.146948, 0, 0, 1, 1, 1,
-0.8911291, -1.389442, -3.092724, 1, 0, 0, 1, 1,
-0.88793, -1.8106, -2.173252, 1, 0, 0, 1, 1,
-0.8860455, 0.1226663, -1.386511, 1, 0, 0, 1, 1,
-0.8831202, -0.5127484, 0.1334662, 1, 0, 0, 1, 1,
-0.8801876, -0.7450255, -2.110257, 1, 0, 0, 1, 1,
-0.8796256, 1.657366, -1.179833, 0, 0, 0, 1, 1,
-0.8755681, -0.2609071, -1.885221, 0, 0, 0, 1, 1,
-0.8707533, -0.2743869, -2.080039, 0, 0, 0, 1, 1,
-0.8658129, 0.6587066, -2.084629, 0, 0, 0, 1, 1,
-0.8557933, 0.5588655, -1.179476, 0, 0, 0, 1, 1,
-0.839977, 0.2670436, -3.448977, 0, 0, 0, 1, 1,
-0.8354487, -0.1301321, -1.229321, 0, 0, 0, 1, 1,
-0.8343213, -1.221117, -2.5194, 1, 1, 1, 1, 1,
-0.8295614, 0.6344863, -1.260585, 1, 1, 1, 1, 1,
-0.8195611, -0.74663, -3.022074, 1, 1, 1, 1, 1,
-0.8195117, 1.335508, -1.320366, 1, 1, 1, 1, 1,
-0.8187637, -1.973527, -2.280634, 1, 1, 1, 1, 1,
-0.8167516, 1.376722, -3.310491, 1, 1, 1, 1, 1,
-0.8144218, -0.3250504, -0.2494462, 1, 1, 1, 1, 1,
-0.8129942, -1.107679, -4.085976, 1, 1, 1, 1, 1,
-0.811995, -0.1036812, -0.4056915, 1, 1, 1, 1, 1,
-0.8065779, 0.09538808, -2.434951, 1, 1, 1, 1, 1,
-0.8023568, -1.730193, -2.83116, 1, 1, 1, 1, 1,
-0.801609, 0.5331988, -0.8389621, 1, 1, 1, 1, 1,
-0.8010368, -1.249831, -3.371168, 1, 1, 1, 1, 1,
-0.800409, 0.738816, -0.5039055, 1, 1, 1, 1, 1,
-0.7993001, 1.906188, 0.887853, 1, 1, 1, 1, 1,
-0.7908559, 0.4934905, -2.381255, 0, 0, 1, 1, 1,
-0.7890843, -0.4411732, -1.279446, 1, 0, 0, 1, 1,
-0.7846703, 1.407698, -0.7830336, 1, 0, 0, 1, 1,
-0.7808754, 0.2455722, -3.135684, 1, 0, 0, 1, 1,
-0.7761793, 1.542101, -0.971069, 1, 0, 0, 1, 1,
-0.7760078, 0.8111941, 0.2878439, 1, 0, 0, 1, 1,
-0.7751357, -0.4401581, -2.51828, 0, 0, 0, 1, 1,
-0.7727946, -1.584273, -3.416601, 0, 0, 0, 1, 1,
-0.7714196, 0.9498089, -0.632808, 0, 0, 0, 1, 1,
-0.7693419, 1.119904, -0.9696366, 0, 0, 0, 1, 1,
-0.7676851, 0.08320533, -3.15325, 0, 0, 0, 1, 1,
-0.7613229, 0.7178631, -0.8487788, 0, 0, 0, 1, 1,
-0.76081, 1.538179, -0.5795602, 0, 0, 0, 1, 1,
-0.758971, -1.527092, -2.251601, 1, 1, 1, 1, 1,
-0.7562871, 0.09086175, -0.9813222, 1, 1, 1, 1, 1,
-0.754593, -2.444888, -4.304597, 1, 1, 1, 1, 1,
-0.7542775, 0.1299975, -1.790316, 1, 1, 1, 1, 1,
-0.7542325, 1.734502, -1.236928, 1, 1, 1, 1, 1,
-0.7529508, 1.562255, -1.474845, 1, 1, 1, 1, 1,
-0.7469495, 1.261198, 0.6662806, 1, 1, 1, 1, 1,
-0.7464697, 0.06391033, -0.5152246, 1, 1, 1, 1, 1,
-0.7420639, -0.8568084, -2.69433, 1, 1, 1, 1, 1,
-0.7399142, 0.3183552, -1.354828, 1, 1, 1, 1, 1,
-0.7396325, 1.877779, 0.9799546, 1, 1, 1, 1, 1,
-0.7376367, 1.049696, -0.7300954, 1, 1, 1, 1, 1,
-0.7266154, -2.061868, -0.6432288, 1, 1, 1, 1, 1,
-0.7177922, 0.4495708, -0.9553962, 1, 1, 1, 1, 1,
-0.7143539, -1.715095, -3.859879, 1, 1, 1, 1, 1,
-0.7119724, -1.024414, -3.151407, 0, 0, 1, 1, 1,
-0.7101238, 1.141811, 0.3483935, 1, 0, 0, 1, 1,
-0.7069499, -0.4931636, -2.566868, 1, 0, 0, 1, 1,
-0.7024425, -0.8933444, -4.000655, 1, 0, 0, 1, 1,
-0.7007002, 0.3903047, -0.3492235, 1, 0, 0, 1, 1,
-0.6962528, -0.2154464, -1.889886, 1, 0, 0, 1, 1,
-0.693345, -0.5272411, -2.540265, 0, 0, 0, 1, 1,
-0.6923302, 0.4909964, -1.044959, 0, 0, 0, 1, 1,
-0.6905349, -0.6235434, -1.465677, 0, 0, 0, 1, 1,
-0.6888273, -0.1622866, -3.543282, 0, 0, 0, 1, 1,
-0.6883007, -0.1872066, -1.825193, 0, 0, 0, 1, 1,
-0.6863428, -0.2810776, -3.111287, 0, 0, 0, 1, 1,
-0.6834192, 0.1803911, -2.945751, 0, 0, 0, 1, 1,
-0.6766378, 0.2580881, 0.3175009, 1, 1, 1, 1, 1,
-0.6725041, 0.1611436, -1.715881, 1, 1, 1, 1, 1,
-0.6701112, 0.2902348, -0.9366251, 1, 1, 1, 1, 1,
-0.6643651, -2.096471, -3.469638, 1, 1, 1, 1, 1,
-0.6633997, 0.9905757, 0.3310289, 1, 1, 1, 1, 1,
-0.6628305, -0.6553079, -2.087052, 1, 1, 1, 1, 1,
-0.6614687, 0.791291, -2.310999, 1, 1, 1, 1, 1,
-0.6608679, -0.5750883, -1.750206, 1, 1, 1, 1, 1,
-0.653972, 1.111045, -1.134294, 1, 1, 1, 1, 1,
-0.6499791, -0.129611, -2.335748, 1, 1, 1, 1, 1,
-0.6478851, -0.328061, -2.301725, 1, 1, 1, 1, 1,
-0.6437417, -0.5035577, -0.01757006, 1, 1, 1, 1, 1,
-0.6435859, -0.7108215, -3.039175, 1, 1, 1, 1, 1,
-0.6410668, -0.8052195, -2.016259, 1, 1, 1, 1, 1,
-0.6407708, 0.09888095, -0.4741504, 1, 1, 1, 1, 1,
-0.6329313, 0.4608532, -1.108654, 0, 0, 1, 1, 1,
-0.628857, 1.295981, 2.196529, 1, 0, 0, 1, 1,
-0.6287376, -0.3782661, -2.350043, 1, 0, 0, 1, 1,
-0.6228624, -0.3391048, -4.632859, 1, 0, 0, 1, 1,
-0.6192428, 0.03422571, -1.251423, 1, 0, 0, 1, 1,
-0.6183821, 0.1381922, -2.040975, 1, 0, 0, 1, 1,
-0.6183693, 1.161694, -1.328309, 0, 0, 0, 1, 1,
-0.6183522, -0.2395745, -3.1117, 0, 0, 0, 1, 1,
-0.6105685, -1.190443, -3.51889, 0, 0, 0, 1, 1,
-0.6081885, 1.870527, -0.9255211, 0, 0, 0, 1, 1,
-0.6059082, 1.817556, -0.4282919, 0, 0, 0, 1, 1,
-0.6017027, 0.1887334, -1.288181, 0, 0, 0, 1, 1,
-0.5861577, -1.225657, -3.022303, 0, 0, 0, 1, 1,
-0.5839076, -1.317234, -1.767809, 1, 1, 1, 1, 1,
-0.5796141, 0.717856, -0.07746823, 1, 1, 1, 1, 1,
-0.5792525, -0.9796315, -3.452396, 1, 1, 1, 1, 1,
-0.5783803, 0.2418345, -1.164901, 1, 1, 1, 1, 1,
-0.5761918, -1.1479, -3.124979, 1, 1, 1, 1, 1,
-0.5740508, -0.8775724, -2.280726, 1, 1, 1, 1, 1,
-0.5712471, -0.5049707, -3.256058, 1, 1, 1, 1, 1,
-0.5703675, -1.50547, -2.582742, 1, 1, 1, 1, 1,
-0.5695624, 0.2014944, -1.54387, 1, 1, 1, 1, 1,
-0.5643672, 0.1319243, -2.776519, 1, 1, 1, 1, 1,
-0.5586982, -0.8143655, -3.77196, 1, 1, 1, 1, 1,
-0.5555249, 1.176991, -1.039059, 1, 1, 1, 1, 1,
-0.5549019, 1.315564, -1.89573, 1, 1, 1, 1, 1,
-0.5544535, 1.492162, 0.1523957, 1, 1, 1, 1, 1,
-0.553785, 0.1605891, 0.2740726, 1, 1, 1, 1, 1,
-0.5526645, 0.2139055, -0.6630546, 0, 0, 1, 1, 1,
-0.5526633, -0.188616, -1.653519, 1, 0, 0, 1, 1,
-0.5502403, 0.3938052, -0.6315677, 1, 0, 0, 1, 1,
-0.5392959, 1.806278, -1.133322, 1, 0, 0, 1, 1,
-0.537592, -0.07886056, -0.5748067, 1, 0, 0, 1, 1,
-0.5315842, -0.3416496, -2.599988, 1, 0, 0, 1, 1,
-0.5295223, 0.9303868, -1.075396, 0, 0, 0, 1, 1,
-0.5282737, -0.06807232, -0.5504166, 0, 0, 0, 1, 1,
-0.5216228, 0.2071359, -0.2838021, 0, 0, 0, 1, 1,
-0.515783, -1.186081, -3.052818, 0, 0, 0, 1, 1,
-0.5138681, 1.559725, 0.08259819, 0, 0, 0, 1, 1,
-0.5125107, 0.5579808, -1.674604, 0, 0, 0, 1, 1,
-0.5108446, 0.5233968, -1.186667, 0, 0, 0, 1, 1,
-0.5101813, 0.4249727, -1.497964, 1, 1, 1, 1, 1,
-0.5062765, -0.2169812, -1.665831, 1, 1, 1, 1, 1,
-0.5052657, 1.157517, 0.3795772, 1, 1, 1, 1, 1,
-0.5043668, 1.717829, 0.5251096, 1, 1, 1, 1, 1,
-0.5042171, -0.2638031, -2.448066, 1, 1, 1, 1, 1,
-0.4980605, 1.059046, -0.5002154, 1, 1, 1, 1, 1,
-0.4979279, -0.5677615, -1.985925, 1, 1, 1, 1, 1,
-0.4964122, 0.02406629, -1.556746, 1, 1, 1, 1, 1,
-0.49411, -0.2439387, -1.729488, 1, 1, 1, 1, 1,
-0.4926777, -1.124315, -2.65179, 1, 1, 1, 1, 1,
-0.492315, 0.883907, -0.4149634, 1, 1, 1, 1, 1,
-0.4896132, -1.274804, -3.88582, 1, 1, 1, 1, 1,
-0.4882797, -0.08627379, -1.271176, 1, 1, 1, 1, 1,
-0.4863003, 0.2695702, 1.273143, 1, 1, 1, 1, 1,
-0.4845415, -1.446336, -2.140607, 1, 1, 1, 1, 1,
-0.4833727, 0.9177792, -1.090529, 0, 0, 1, 1, 1,
-0.4782946, 0.01845445, -1.083022, 1, 0, 0, 1, 1,
-0.4754368, 1.419906, 0.04317506, 1, 0, 0, 1, 1,
-0.4752425, 0.8789076, -2.941301, 1, 0, 0, 1, 1,
-0.4749536, -1.46084, -2.961626, 1, 0, 0, 1, 1,
-0.4662266, -0.05620477, -0.9608597, 1, 0, 0, 1, 1,
-0.4652112, 0.05126213, -1.159311, 0, 0, 0, 1, 1,
-0.4632834, -0.8774936, -1.697975, 0, 0, 0, 1, 1,
-0.4491729, -1.59579, -3.136747, 0, 0, 0, 1, 1,
-0.4471088, -0.6814619, -0.4922472, 0, 0, 0, 1, 1,
-0.4468509, 2.349043, 0.7419967, 0, 0, 0, 1, 1,
-0.4453195, -0.2470044, -2.990231, 0, 0, 0, 1, 1,
-0.4436802, 0.08866495, -1.662699, 0, 0, 0, 1, 1,
-0.4412582, -0.5661793, -2.844084, 1, 1, 1, 1, 1,
-0.4379703, -0.3750814, -3.146718, 1, 1, 1, 1, 1,
-0.4300282, 0.2595952, 1.014568, 1, 1, 1, 1, 1,
-0.4261237, -0.5898791, -1.730433, 1, 1, 1, 1, 1,
-0.4160355, 0.3219504, -2.265097, 1, 1, 1, 1, 1,
-0.4147667, 1.599753, 0.1900561, 1, 1, 1, 1, 1,
-0.409538, -0.6183501, -2.515416, 1, 1, 1, 1, 1,
-0.4094508, 0.5564451, 0.3046278, 1, 1, 1, 1, 1,
-0.4089155, 0.6340319, -0.2430338, 1, 1, 1, 1, 1,
-0.4068225, 0.1040957, -1.367349, 1, 1, 1, 1, 1,
-0.4053054, 1.426947, 0.01198542, 1, 1, 1, 1, 1,
-0.3948466, -0.5077702, -2.609316, 1, 1, 1, 1, 1,
-0.3918106, -0.04733191, -1.986898, 1, 1, 1, 1, 1,
-0.3888685, 1.448785, 0.8927348, 1, 1, 1, 1, 1,
-0.3859122, 1.047195, -0.3021178, 1, 1, 1, 1, 1,
-0.3780009, 0.8668023, 1.629587, 0, 0, 1, 1, 1,
-0.3777526, 0.6749345, 0.9046062, 1, 0, 0, 1, 1,
-0.3773168, -0.3845755, -3.274295, 1, 0, 0, 1, 1,
-0.3770086, 0.9230793, -0.8947511, 1, 0, 0, 1, 1,
-0.3762255, 1.01837, -0.3534964, 1, 0, 0, 1, 1,
-0.3708264, 0.4712903, -0.1740067, 1, 0, 0, 1, 1,
-0.3668191, -0.5819008, -1.278468, 0, 0, 0, 1, 1,
-0.360636, -0.5351272, -1.8423, 0, 0, 0, 1, 1,
-0.3606148, -0.300545, -0.1774803, 0, 0, 0, 1, 1,
-0.3589785, 0.225868, -2.049005, 0, 0, 0, 1, 1,
-0.3569673, 1.32664, 0.05362018, 0, 0, 0, 1, 1,
-0.3510846, -1.06742, -3.796122, 0, 0, 0, 1, 1,
-0.3477389, 0.06188524, -1.582559, 0, 0, 0, 1, 1,
-0.3475227, 0.05893807, -0.6269034, 1, 1, 1, 1, 1,
-0.3473175, 1.343237, 0.02276692, 1, 1, 1, 1, 1,
-0.3472428, 1.060457, -1.518115, 1, 1, 1, 1, 1,
-0.345437, -1.980341, -1.409138, 1, 1, 1, 1, 1,
-0.3401386, -1.097343, -0.8116763, 1, 1, 1, 1, 1,
-0.3401332, 0.6868387, -2.122861, 1, 1, 1, 1, 1,
-0.3379208, 0.7897443, -2.473871, 1, 1, 1, 1, 1,
-0.3368247, 0.375537, -0.1702723, 1, 1, 1, 1, 1,
-0.336632, -1.357198, -3.537387, 1, 1, 1, 1, 1,
-0.3346334, 0.309794, -1.576806, 1, 1, 1, 1, 1,
-0.3335939, -0.1505249, -2.542682, 1, 1, 1, 1, 1,
-0.3290921, -0.3537465, -2.940106, 1, 1, 1, 1, 1,
-0.3290552, 0.2488141, -1.4764, 1, 1, 1, 1, 1,
-0.3289073, 0.1197881, -1.980924, 1, 1, 1, 1, 1,
-0.326359, -1.968839, -4.834485, 1, 1, 1, 1, 1,
-0.3253257, -0.235874, -1.475986, 0, 0, 1, 1, 1,
-0.3252087, 0.6504842, -1.654224, 1, 0, 0, 1, 1,
-0.3230176, 1.001547, -1.657668, 1, 0, 0, 1, 1,
-0.320867, 1.090898, -0.2825343, 1, 0, 0, 1, 1,
-0.3194887, 0.1153516, -3.17381, 1, 0, 0, 1, 1,
-0.3190434, -1.31999, -4.09062, 1, 0, 0, 1, 1,
-0.3190021, -0.1643039, -1.171719, 0, 0, 0, 1, 1,
-0.3186428, -1.91804, -3.384471, 0, 0, 0, 1, 1,
-0.3181625, 0.8597502, -1.024406, 0, 0, 0, 1, 1,
-0.3181294, 0.05144184, -1.891276, 0, 0, 0, 1, 1,
-0.3176823, -0.8240883, -2.268023, 0, 0, 0, 1, 1,
-0.3175746, -0.2588641, -2.642718, 0, 0, 0, 1, 1,
-0.3164891, 0.3176296, -1.324536, 0, 0, 0, 1, 1,
-0.315626, -0.7270172, -3.477178, 1, 1, 1, 1, 1,
-0.3151034, 0.8620815, -0.4583993, 1, 1, 1, 1, 1,
-0.3135989, 0.9070461, 0.6791627, 1, 1, 1, 1, 1,
-0.3088831, 1.510155, 0.6141998, 1, 1, 1, 1, 1,
-0.3056927, 0.3565564, -0.5021389, 1, 1, 1, 1, 1,
-0.3025794, -1.381412, -2.986005, 1, 1, 1, 1, 1,
-0.3016607, -0.7515091, -4.481091, 1, 1, 1, 1, 1,
-0.3010875, 1.594657, -0.5174277, 1, 1, 1, 1, 1,
-0.2963378, 1.340662, 0.4702322, 1, 1, 1, 1, 1,
-0.2926169, 1.908536, 1.080478, 1, 1, 1, 1, 1,
-0.2925238, 0.1436087, -1.496807, 1, 1, 1, 1, 1,
-0.2879384, -0.8368086, -1.587321, 1, 1, 1, 1, 1,
-0.2822665, -0.194408, -1.524032, 1, 1, 1, 1, 1,
-0.2748654, 0.2681665, -2.263945, 1, 1, 1, 1, 1,
-0.2741812, 0.2099919, -0.05387911, 1, 1, 1, 1, 1,
-0.2740628, 1.163226, -1.504537, 0, 0, 1, 1, 1,
-0.2683687, 1.928227, -1.51938, 1, 0, 0, 1, 1,
-0.2661439, 0.08713403, -1.594138, 1, 0, 0, 1, 1,
-0.2589471, -1.460825, -2.18236, 1, 0, 0, 1, 1,
-0.2566032, 0.02216167, -1.733511, 1, 0, 0, 1, 1,
-0.2537813, 1.342588, -0.5831035, 1, 0, 0, 1, 1,
-0.2524219, -0.3046484, -1.249684, 0, 0, 0, 1, 1,
-0.2509137, 0.4646951, -0.1840078, 0, 0, 0, 1, 1,
-0.244096, -1.204236, -2.793803, 0, 0, 0, 1, 1,
-0.2428917, 0.3648067, -0.8825337, 0, 0, 0, 1, 1,
-0.2382671, 1.853604, 0.1387818, 0, 0, 0, 1, 1,
-0.2366523, 0.6065244, -1.032196, 0, 0, 0, 1, 1,
-0.2347014, 0.3681264, -1.312797, 0, 0, 0, 1, 1,
-0.230929, 0.2410484, 0.2134769, 1, 1, 1, 1, 1,
-0.2258678, 0.6758955, -0.2533261, 1, 1, 1, 1, 1,
-0.2134779, -0.1680242, -1.328163, 1, 1, 1, 1, 1,
-0.205835, -0.5592853, -3.648892, 1, 1, 1, 1, 1,
-0.1970866, -0.4661348, -1.937569, 1, 1, 1, 1, 1,
-0.1961031, 0.3141493, -0.5087876, 1, 1, 1, 1, 1,
-0.195146, 1.230007, -1.928398, 1, 1, 1, 1, 1,
-0.1930137, 0.7730145, -0.5691624, 1, 1, 1, 1, 1,
-0.1920965, 0.3722537, -0.9073541, 1, 1, 1, 1, 1,
-0.1868661, 0.08628441, -1.5367, 1, 1, 1, 1, 1,
-0.1825818, -1.034113, -1.799286, 1, 1, 1, 1, 1,
-0.1803786, 2.727082, 1.232875, 1, 1, 1, 1, 1,
-0.1793151, 0.2657761, -1.510436, 1, 1, 1, 1, 1,
-0.1789296, -0.5495051, -2.450569, 1, 1, 1, 1, 1,
-0.1783667, -1.616502, -3.581626, 1, 1, 1, 1, 1,
-0.177639, -1.129861, -2.857146, 0, 0, 1, 1, 1,
-0.1704106, -1.243678, -3.626901, 1, 0, 0, 1, 1,
-0.1657387, 1.792409, -0.2778561, 1, 0, 0, 1, 1,
-0.1636859, -0.2519754, -0.9711081, 1, 0, 0, 1, 1,
-0.1622069, 0.1668299, -0.6073425, 1, 0, 0, 1, 1,
-0.1591928, 0.6987771, -1.704094, 1, 0, 0, 1, 1,
-0.154663, -0.884743, -3.086506, 0, 0, 0, 1, 1,
-0.1516868, -0.6750036, -1.031631, 0, 0, 0, 1, 1,
-0.1466367, -2.382038, -4.989177, 0, 0, 0, 1, 1,
-0.1444859, 0.09409053, 0.9116497, 0, 0, 0, 1, 1,
-0.144122, 0.4299223, -0.6153789, 0, 0, 0, 1, 1,
-0.1315833, 0.3761146, -1.225006, 0, 0, 0, 1, 1,
-0.1302073, 0.7113464, -2.70942, 0, 0, 0, 1, 1,
-0.1257908, 0.3308192, 0.6349187, 1, 1, 1, 1, 1,
-0.1217944, 1.077725, 0.6104835, 1, 1, 1, 1, 1,
-0.1207523, -1.012448, -2.066958, 1, 1, 1, 1, 1,
-0.1197594, -0.4065815, -2.807674, 1, 1, 1, 1, 1,
-0.1182198, 0.2514794, -0.6905759, 1, 1, 1, 1, 1,
-0.1174568, -0.4405116, -3.117123, 1, 1, 1, 1, 1,
-0.1167233, -0.4775513, -1.163217, 1, 1, 1, 1, 1,
-0.1161137, -0.2172921, -1.397268, 1, 1, 1, 1, 1,
-0.1151018, 0.7807282, 0.4658304, 1, 1, 1, 1, 1,
-0.1116991, 0.9927946, -0.7843241, 1, 1, 1, 1, 1,
-0.1083674, -0.456321, -1.172173, 1, 1, 1, 1, 1,
-0.1021805, -0.04098168, -2.721867, 1, 1, 1, 1, 1,
-0.1011366, 2.416977, -0.528785, 1, 1, 1, 1, 1,
-0.09806875, -0.03465852, -2.342889, 1, 1, 1, 1, 1,
-0.09276931, -0.007960613, -2.801262, 1, 1, 1, 1, 1,
-0.09153238, 0.4230574, -1.277991, 0, 0, 1, 1, 1,
-0.08946785, 0.08989916, -0.6158018, 1, 0, 0, 1, 1,
-0.08898921, -1.16016, -2.90987, 1, 0, 0, 1, 1,
-0.08694457, -0.5172293, -3.485462, 1, 0, 0, 1, 1,
-0.08556232, -1.440436, -1.928628, 1, 0, 0, 1, 1,
-0.07532028, 0.1530907, -1.31443, 1, 0, 0, 1, 1,
-0.07397628, 2.200404, 0.2473784, 0, 0, 0, 1, 1,
-0.07203162, -1.064324, -4.431039, 0, 0, 0, 1, 1,
-0.06831634, 1.303567, 0.4628354, 0, 0, 0, 1, 1,
-0.06781431, -0.4805581, -2.858289, 0, 0, 0, 1, 1,
-0.06321087, 0.6080517, -0.06254906, 0, 0, 0, 1, 1,
-0.06319173, 1.64673, 1.660535, 0, 0, 0, 1, 1,
-0.05981569, -0.4661177, -1.788315, 0, 0, 0, 1, 1,
-0.05945243, 0.5015391, -0.5329436, 1, 1, 1, 1, 1,
-0.05778066, 0.08647484, -0.9612854, 1, 1, 1, 1, 1,
-0.05556612, 1.747376, -2.533303, 1, 1, 1, 1, 1,
-0.05222828, 0.4770937, -1.074245, 1, 1, 1, 1, 1,
-0.05165544, -0.9799635, -1.833952, 1, 1, 1, 1, 1,
-0.04861622, 0.8417354, 0.8986084, 1, 1, 1, 1, 1,
-0.04787355, 1.022934, 0.6810274, 1, 1, 1, 1, 1,
-0.04025169, 0.2595672, -1.015532, 1, 1, 1, 1, 1,
-0.03858446, 1.60554, -0.4904179, 1, 1, 1, 1, 1,
-0.03658634, -0.9472762, -4.253657, 1, 1, 1, 1, 1,
-0.02956101, 0.2786107, 0.3731827, 1, 1, 1, 1, 1,
-0.02914092, 0.4632191, 0.4965115, 1, 1, 1, 1, 1,
-0.0285712, 1.632778, -0.1078225, 1, 1, 1, 1, 1,
-0.02696813, 1.658321, 1.675686, 1, 1, 1, 1, 1,
-0.02363233, -0.2703294, -2.941503, 1, 1, 1, 1, 1,
-0.01962711, 1.093309, -0.5136179, 0, 0, 1, 1, 1,
-0.01613895, 0.1720917, 1.131186, 1, 0, 0, 1, 1,
-0.009182092, -1.680452, -2.755795, 1, 0, 0, 1, 1,
-0.007898358, -1.100606, -3.638327, 1, 0, 0, 1, 1,
-0.006448426, 1.528337, 1.911239, 1, 0, 0, 1, 1,
-0.005295461, 0.7921376, 0.5951754, 1, 0, 0, 1, 1,
-0.002977806, -0.5346515, -2.547436, 0, 0, 0, 1, 1,
-0.002103218, -0.3948748, -4.05045, 0, 0, 0, 1, 1,
-0.0005348858, 0.1080351, -1.346702, 0, 0, 0, 1, 1,
0.001970311, -1.283934, 3.020134, 0, 0, 0, 1, 1,
0.002278093, 0.6832759, -1.102384, 0, 0, 0, 1, 1,
0.00534754, -0.2871044, 1.660903, 0, 0, 0, 1, 1,
0.005709077, 0.1833921, -0.5028284, 0, 0, 0, 1, 1,
0.008566828, -2.363611, 3.230778, 1, 1, 1, 1, 1,
0.01077814, -0.407461, 3.081649, 1, 1, 1, 1, 1,
0.01327297, -0.6224492, 1.896718, 1, 1, 1, 1, 1,
0.01438944, -1.095784, 3.514452, 1, 1, 1, 1, 1,
0.02590906, -0.5528209, 2.485853, 1, 1, 1, 1, 1,
0.02962837, -0.8280994, 3.935217, 1, 1, 1, 1, 1,
0.03360434, -0.7074787, 2.101576, 1, 1, 1, 1, 1,
0.03935104, -0.2622687, 0.8867663, 1, 1, 1, 1, 1,
0.04062605, -0.738664, 2.728941, 1, 1, 1, 1, 1,
0.04069927, -1.256523, 2.326548, 1, 1, 1, 1, 1,
0.0412042, 1.160196, -0.4511242, 1, 1, 1, 1, 1,
0.04237792, -1.530007, 2.582612, 1, 1, 1, 1, 1,
0.04238006, -1.212403, 2.52059, 1, 1, 1, 1, 1,
0.0434224, -2.277189, 2.037914, 1, 1, 1, 1, 1,
0.04353488, 0.7094964, 0.1674316, 1, 1, 1, 1, 1,
0.04691136, -1.415052, 1.556, 0, 0, 1, 1, 1,
0.04962744, -0.1730449, 3.150393, 1, 0, 0, 1, 1,
0.05613986, 1.095007, -0.5515698, 1, 0, 0, 1, 1,
0.0582012, -1.027921, 2.525886, 1, 0, 0, 1, 1,
0.0601622, -0.4369707, 4.333485, 1, 0, 0, 1, 1,
0.06264126, -0.2811483, 1.778343, 1, 0, 0, 1, 1,
0.06415292, 2.314605, -0.4991253, 0, 0, 0, 1, 1,
0.06427182, -0.9590418, 2.88832, 0, 0, 0, 1, 1,
0.06435214, -0.6291935, 1.555857, 0, 0, 0, 1, 1,
0.06755292, 0.1683639, 0.8415578, 0, 0, 0, 1, 1,
0.0696245, -2.947457, 4.073986, 0, 0, 0, 1, 1,
0.07957174, 1.992317, -0.49227, 0, 0, 0, 1, 1,
0.08708636, -0.4644086, 4.081871, 0, 0, 0, 1, 1,
0.08711801, 1.849917, -0.1633573, 1, 1, 1, 1, 1,
0.08877404, -1.224053, 1.90335, 1, 1, 1, 1, 1,
0.0923228, -0.7801071, 4.720697, 1, 1, 1, 1, 1,
0.1021323, -1.620043, 4.10831, 1, 1, 1, 1, 1,
0.1058582, 0.5090646, 0.1333355, 1, 1, 1, 1, 1,
0.112176, 2.232556, 0.7420931, 1, 1, 1, 1, 1,
0.1133269, -1.136579, 1.740384, 1, 1, 1, 1, 1,
0.1149145, 1.427025, -1.022254, 1, 1, 1, 1, 1,
0.123673, 0.01512404, 1.908962, 1, 1, 1, 1, 1,
0.1325582, 0.2849947, 0.03954606, 1, 1, 1, 1, 1,
0.1328218, -0.4493536, 3.644129, 1, 1, 1, 1, 1,
0.1362033, 0.7967598, -0.5975471, 1, 1, 1, 1, 1,
0.1381222, 0.9302404, -0.9483435, 1, 1, 1, 1, 1,
0.1392989, -0.7434835, 2.572006, 1, 1, 1, 1, 1,
0.1399485, 1.404033, 0.5003231, 1, 1, 1, 1, 1,
0.1417521, 0.3439582, -0.005378603, 0, 0, 1, 1, 1,
0.1427996, -1.902102, 3.027743, 1, 0, 0, 1, 1,
0.1444791, 1.147138, 1.4611, 1, 0, 0, 1, 1,
0.1517152, 0.1590188, 1.184201, 1, 0, 0, 1, 1,
0.1540903, -0.5618064, 3.118206, 1, 0, 0, 1, 1,
0.1544292, -1.047126, 3.619364, 1, 0, 0, 1, 1,
0.1549671, 1.815187, 0.4912596, 0, 0, 0, 1, 1,
0.1597945, -1.349961, 3.22384, 0, 0, 0, 1, 1,
0.1605555, 0.5198798, -0.9696375, 0, 0, 0, 1, 1,
0.162064, 0.5719268, 1.371055, 0, 0, 0, 1, 1,
0.1623972, -0.1232138, 1.559939, 0, 0, 0, 1, 1,
0.1651, 0.1748822, 1.130854, 0, 0, 0, 1, 1,
0.1669195, -0.7099515, 3.431051, 0, 0, 0, 1, 1,
0.1697348, -1.81874, 2.796612, 1, 1, 1, 1, 1,
0.1698787, 2.990149, 0.6646562, 1, 1, 1, 1, 1,
0.1714322, -0.9253772, 1.931536, 1, 1, 1, 1, 1,
0.1728605, -0.2402552, 3.288439, 1, 1, 1, 1, 1,
0.1760233, -0.7829799, 3.034563, 1, 1, 1, 1, 1,
0.1801697, 0.5031801, -0.1160377, 1, 1, 1, 1, 1,
0.1814218, 0.1462103, 1.7355, 1, 1, 1, 1, 1,
0.1834944, 0.3118978, 0.4316628, 1, 1, 1, 1, 1,
0.1853571, 1.483655, 0.285975, 1, 1, 1, 1, 1,
0.1854723, 1.261385, 0.5234681, 1, 1, 1, 1, 1,
0.1870251, 0.992763, -1.114879, 1, 1, 1, 1, 1,
0.1888077, 0.5918959, 0.3507643, 1, 1, 1, 1, 1,
0.191646, 0.780396, 0.7931205, 1, 1, 1, 1, 1,
0.1922935, 0.7405775, -1.82936, 1, 1, 1, 1, 1,
0.1941834, -0.3022082, 2.896135, 1, 1, 1, 1, 1,
0.2000647, -0.3417376, 1.812397, 0, 0, 1, 1, 1,
0.2063996, -1.249007, 2.30033, 1, 0, 0, 1, 1,
0.2102023, -0.2123726, 2.059649, 1, 0, 0, 1, 1,
0.2105683, -0.9697981, 4.430606, 1, 0, 0, 1, 1,
0.2116644, 0.7404338, -1.890983, 1, 0, 0, 1, 1,
0.223024, -0.6824056, 2.194165, 1, 0, 0, 1, 1,
0.2255428, 1.467187, 0.09690078, 0, 0, 0, 1, 1,
0.2291709, -0.2429743, 1.788739, 0, 0, 0, 1, 1,
0.2302983, 0.7225752, -0.479459, 0, 0, 0, 1, 1,
0.2318348, -0.3124623, 2.304115, 0, 0, 0, 1, 1,
0.2344093, 0.8321931, 0.5080571, 0, 0, 0, 1, 1,
0.2356815, 0.5770841, 0.1350028, 0, 0, 0, 1, 1,
0.23621, 0.5521611, 2.786359, 0, 0, 0, 1, 1,
0.238993, -1.295095, 4.004659, 1, 1, 1, 1, 1,
0.2408822, -0.4655584, 3.72699, 1, 1, 1, 1, 1,
0.2414462, 1.606098, 0.1415912, 1, 1, 1, 1, 1,
0.2442658, -1.549021, 3.860357, 1, 1, 1, 1, 1,
0.2470932, 0.1948984, 0.5311542, 1, 1, 1, 1, 1,
0.2482933, 0.2787262, 1.439692, 1, 1, 1, 1, 1,
0.2486251, -0.6170933, 3.683174, 1, 1, 1, 1, 1,
0.2493298, -0.28919, 2.522588, 1, 1, 1, 1, 1,
0.2556071, -0.2740262, 1.073733, 1, 1, 1, 1, 1,
0.2590148, 2.109583, 0.6362168, 1, 1, 1, 1, 1,
0.2646615, 0.4144945, -0.6461587, 1, 1, 1, 1, 1,
0.2647423, 0.3370695, -0.8394955, 1, 1, 1, 1, 1,
0.2661636, 0.5852419, 2.994065, 1, 1, 1, 1, 1,
0.2679873, 1.975747, 0.1660584, 1, 1, 1, 1, 1,
0.2683404, 0.001444756, 3.435464, 1, 1, 1, 1, 1,
0.2713069, 0.1216295, 0.7611217, 0, 0, 1, 1, 1,
0.2735061, 1.21241, -0.06928713, 1, 0, 0, 1, 1,
0.2740871, 0.04425779, 1.966356, 1, 0, 0, 1, 1,
0.2747073, -0.02732838, 2.61091, 1, 0, 0, 1, 1,
0.275328, 0.2094241, 2.701222, 1, 0, 0, 1, 1,
0.2806273, 1.810322, -0.5161963, 1, 0, 0, 1, 1,
0.2807556, -0.9174194, 2.736981, 0, 0, 0, 1, 1,
0.2840745, 0.6138837, 1.009619, 0, 0, 0, 1, 1,
0.2897254, 0.1176065, 1.855406, 0, 0, 0, 1, 1,
0.2899503, 0.359749, -0.001908462, 0, 0, 0, 1, 1,
0.2919713, -1.047734, 4.323443, 0, 0, 0, 1, 1,
0.2948565, -1.122747, 1.200272, 0, 0, 0, 1, 1,
0.2964413, 1.08878, -0.05643466, 0, 0, 0, 1, 1,
0.2986594, 2.057405, 1.140042, 1, 1, 1, 1, 1,
0.3032342, -0.752019, 3.833068, 1, 1, 1, 1, 1,
0.3039079, 0.4551962, 1.213784, 1, 1, 1, 1, 1,
0.3081258, -1.663621, 1.646663, 1, 1, 1, 1, 1,
0.3143875, -1.402798, 2.862842, 1, 1, 1, 1, 1,
0.3157448, -0.8780576, 1.733174, 1, 1, 1, 1, 1,
0.3164629, 1.497176, -1.019874, 1, 1, 1, 1, 1,
0.3170946, 1.838883, -0.2680623, 1, 1, 1, 1, 1,
0.3175209, -0.4094749, 1.838401, 1, 1, 1, 1, 1,
0.3178887, -0.9181488, 2.875341, 1, 1, 1, 1, 1,
0.321536, -0.292934, 1.734221, 1, 1, 1, 1, 1,
0.3238244, 0.5654642, 1.267424, 1, 1, 1, 1, 1,
0.3259362, 1.376653, 0.3152928, 1, 1, 1, 1, 1,
0.3259728, 1.374554, -0.8866163, 1, 1, 1, 1, 1,
0.3334461, -2.338944, 1.653962, 1, 1, 1, 1, 1,
0.3349625, 1.874213, 1.252437, 0, 0, 1, 1, 1,
0.339115, 0.6108795, 0.3300715, 1, 0, 0, 1, 1,
0.3423062, 1.375583, 0.8097692, 1, 0, 0, 1, 1,
0.3507294, -1.154751, 3.9299, 1, 0, 0, 1, 1,
0.3586563, -1.985483, 2.615501, 1, 0, 0, 1, 1,
0.3597213, -1.142408, 3.183123, 1, 0, 0, 1, 1,
0.3610413, 1.094085, 0.940154, 0, 0, 0, 1, 1,
0.3630314, 0.7556375, 1.071637, 0, 0, 0, 1, 1,
0.3665489, 0.9019583, 1.015684, 0, 0, 0, 1, 1,
0.3679037, 1.388464, -0.3516266, 0, 0, 0, 1, 1,
0.3681697, 0.1688146, 2.71565, 0, 0, 0, 1, 1,
0.3687453, 0.812578, 1.577303, 0, 0, 0, 1, 1,
0.3699426, -1.238916, 2.806787, 0, 0, 0, 1, 1,
0.3734074, 0.8385596, 0.2235418, 1, 1, 1, 1, 1,
0.3734368, 0.86689, -0.1071245, 1, 1, 1, 1, 1,
0.3738359, 1.244639, -1.297397, 1, 1, 1, 1, 1,
0.3771747, -0.1568456, 2.679588, 1, 1, 1, 1, 1,
0.37754, -0.8480178, 1.346824, 1, 1, 1, 1, 1,
0.3801279, -1.105218, 3.088211, 1, 1, 1, 1, 1,
0.3833206, -0.3324827, 2.371923, 1, 1, 1, 1, 1,
0.3843527, -0.4244579, 2.503294, 1, 1, 1, 1, 1,
0.3903978, -0.3058881, 2.12618, 1, 1, 1, 1, 1,
0.3931458, 2.232065, 0.5595571, 1, 1, 1, 1, 1,
0.3933197, 1.414493, 0.4871678, 1, 1, 1, 1, 1,
0.3961281, 0.3270571, 2.917862, 1, 1, 1, 1, 1,
0.3984063, -1.04262, 2.914914, 1, 1, 1, 1, 1,
0.4046712, -1.76734, 1.945394, 1, 1, 1, 1, 1,
0.4046932, -0.177697, 1.146988, 1, 1, 1, 1, 1,
0.4059222, -1.026047, 4.754405, 0, 0, 1, 1, 1,
0.409355, 0.02595355, -0.1219939, 1, 0, 0, 1, 1,
0.4104546, 0.3130234, 2.365913, 1, 0, 0, 1, 1,
0.411859, -1.162664, 3.366231, 1, 0, 0, 1, 1,
0.4124803, 2.048317, 1.216025, 1, 0, 0, 1, 1,
0.4151192, -0.7987682, 1.87277, 1, 0, 0, 1, 1,
0.4247631, -0.7718295, 2.661316, 0, 0, 0, 1, 1,
0.4312333, 0.4255621, -0.8200954, 0, 0, 0, 1, 1,
0.4354932, 0.04635639, 2.080814, 0, 0, 0, 1, 1,
0.435828, -0.3379789, 0.2897172, 0, 0, 0, 1, 1,
0.4389183, -0.9978014, 2.537864, 0, 0, 0, 1, 1,
0.440361, 0.1923207, 0.5106027, 0, 0, 0, 1, 1,
0.4412502, -0.7876258, 1.33335, 0, 0, 0, 1, 1,
0.442017, -0.1792938, 1.71333, 1, 1, 1, 1, 1,
0.4446191, 1.639554, 0.2327575, 1, 1, 1, 1, 1,
0.4457261, -0.2950239, 2.373288, 1, 1, 1, 1, 1,
0.4470292, 0.1106268, 1.2862, 1, 1, 1, 1, 1,
0.4492548, 0.9134935, 1.827613, 1, 1, 1, 1, 1,
0.4523803, -0.3777867, 1.021331, 1, 1, 1, 1, 1,
0.4532402, 1.662111, -0.09347084, 1, 1, 1, 1, 1,
0.461312, -0.01286509, 2.300337, 1, 1, 1, 1, 1,
0.4629299, -0.6364308, 2.159758, 1, 1, 1, 1, 1,
0.4633623, 0.2089737, 2.816268, 1, 1, 1, 1, 1,
0.4670022, -0.3911611, 2.175528, 1, 1, 1, 1, 1,
0.4673342, 0.808135, -0.2580226, 1, 1, 1, 1, 1,
0.4675054, -0.4979465, 2.05064, 1, 1, 1, 1, 1,
0.4695805, -0.4349946, 1.325952, 1, 1, 1, 1, 1,
0.4703124, 1.006804, 0.8530675, 1, 1, 1, 1, 1,
0.4714877, 0.5440066, 0.8947746, 0, 0, 1, 1, 1,
0.4749313, 0.9102113, 1.028649, 1, 0, 0, 1, 1,
0.4782824, -1.283858, 1.867099, 1, 0, 0, 1, 1,
0.4832924, -0.272373, 2.115973, 1, 0, 0, 1, 1,
0.4858662, -1.786761, 2.406612, 1, 0, 0, 1, 1,
0.4861925, 0.6638325, 0.5767745, 1, 0, 0, 1, 1,
0.4986156, -2.069456, 0.308848, 0, 0, 0, 1, 1,
0.4991778, 1.315598, -0.5304111, 0, 0, 0, 1, 1,
0.5030775, -0.1711743, 1.980923, 0, 0, 0, 1, 1,
0.5049685, 0.4185292, 1.176927, 0, 0, 0, 1, 1,
0.5101102, -0.6215988, 0.2684039, 0, 0, 0, 1, 1,
0.5170545, 0.7414601, 0.6286027, 0, 0, 0, 1, 1,
0.5183288, 0.04982552, -0.5476947, 0, 0, 0, 1, 1,
0.518334, 0.5041509, 2.623842, 1, 1, 1, 1, 1,
0.5204193, -1.202609, 3.074737, 1, 1, 1, 1, 1,
0.5261943, -1.577382, 1.725617, 1, 1, 1, 1, 1,
0.5265733, -0.04515762, 1.943387, 1, 1, 1, 1, 1,
0.527473, 1.497613, 2.1367, 1, 1, 1, 1, 1,
0.5315667, 0.401456, -0.06377681, 1, 1, 1, 1, 1,
0.5330783, 0.8521159, 2.295055, 1, 1, 1, 1, 1,
0.5349953, -0.04068182, -0.3693706, 1, 1, 1, 1, 1,
0.536758, -0.8415577, 2.039736, 1, 1, 1, 1, 1,
0.5386778, -0.1735723, 1.386435, 1, 1, 1, 1, 1,
0.5453888, 0.4736727, -1.118371, 1, 1, 1, 1, 1,
0.5634935, -1.139701, 2.705755, 1, 1, 1, 1, 1,
0.5685714, 0.9302454, -0.6292034, 1, 1, 1, 1, 1,
0.5697641, -0.762271, 2.601069, 1, 1, 1, 1, 1,
0.5784619, 0.768586, 2.949134, 1, 1, 1, 1, 1,
0.5805198, -1.1119, 4.06931, 0, 0, 1, 1, 1,
0.581641, -0.3055266, 1.87161, 1, 0, 0, 1, 1,
0.5823516, -0.1635121, 1.522367, 1, 0, 0, 1, 1,
0.5849072, -0.952413, 3.99867, 1, 0, 0, 1, 1,
0.5861827, 0.7670015, 1.757743, 1, 0, 0, 1, 1,
0.5885874, -0.2906054, 2.073592, 1, 0, 0, 1, 1,
0.5889788, 0.1177453, 3.066306, 0, 0, 0, 1, 1,
0.5891032, 2.437086, -0.61945, 0, 0, 0, 1, 1,
0.589734, -0.623857, 0.4518939, 0, 0, 0, 1, 1,
0.5910701, 1.804662, -0.07024932, 0, 0, 0, 1, 1,
0.5961873, -1.860069, 2.499386, 0, 0, 0, 1, 1,
0.6019433, 0.3113201, 1.892951, 0, 0, 0, 1, 1,
0.6024683, -0.01974293, 1.57098, 0, 0, 0, 1, 1,
0.6026762, 0.4882576, 1.750211, 1, 1, 1, 1, 1,
0.6027644, 0.02244735, 0.5212517, 1, 1, 1, 1, 1,
0.6077771, 1.440882, 0.5205944, 1, 1, 1, 1, 1,
0.6079902, -0.0352841, 1.613865, 1, 1, 1, 1, 1,
0.6130573, -0.4063877, 2.126487, 1, 1, 1, 1, 1,
0.6142974, 0.8499756, 0.2230694, 1, 1, 1, 1, 1,
0.6163293, -0.6112426, 1.329672, 1, 1, 1, 1, 1,
0.6214817, -1.260223, 2.569879, 1, 1, 1, 1, 1,
0.6241843, 0.5967159, 1.082639, 1, 1, 1, 1, 1,
0.6246738, -0.03005466, -0.1138227, 1, 1, 1, 1, 1,
0.6284272, 0.4138411, 0.8063567, 1, 1, 1, 1, 1,
0.6358586, -0.2959358, 3.330452, 1, 1, 1, 1, 1,
0.6374339, -1.190992, 2.368052, 1, 1, 1, 1, 1,
0.6391183, -0.3984664, 2.494649, 1, 1, 1, 1, 1,
0.6416994, 1.365467, 0.4977525, 1, 1, 1, 1, 1,
0.6420193, 0.159905, 1.479416, 0, 0, 1, 1, 1,
0.6454747, 0.6147932, -0.5272124, 1, 0, 0, 1, 1,
0.6470574, 2.398135, 0.3198386, 1, 0, 0, 1, 1,
0.648385, -0.3730987, 1.853829, 1, 0, 0, 1, 1,
0.6497303, 1.01593, 0.198597, 1, 0, 0, 1, 1,
0.6498383, -0.4303786, 1.360221, 1, 0, 0, 1, 1,
0.6516255, -0.9259528, 3.275327, 0, 0, 0, 1, 1,
0.6552264, 0.6374165, 0.7213543, 0, 0, 0, 1, 1,
0.6558841, -0.6532398, 1.91142, 0, 0, 0, 1, 1,
0.6611867, 0.05696905, 0.818665, 0, 0, 0, 1, 1,
0.6619617, -0.3059811, 3.265151, 0, 0, 0, 1, 1,
0.6620919, -0.566675, 3.03525, 0, 0, 0, 1, 1,
0.6632276, -0.6302409, 2.918901, 0, 0, 0, 1, 1,
0.6706086, -0.679985, 0.3425695, 1, 1, 1, 1, 1,
0.6707287, -0.3062454, 2.059872, 1, 1, 1, 1, 1,
0.672223, 0.5081543, 1.367826, 1, 1, 1, 1, 1,
0.6766801, 1.333463, 0.5928926, 1, 1, 1, 1, 1,
0.681178, 0.7959687, 0.6614662, 1, 1, 1, 1, 1,
0.6825357, 0.8743965, 1.173099, 1, 1, 1, 1, 1,
0.6828046, -0.3856939, 2.835513, 1, 1, 1, 1, 1,
0.6852137, -1.992014, 2.741723, 1, 1, 1, 1, 1,
0.686029, 1.148795, 0.8387198, 1, 1, 1, 1, 1,
0.6874291, -0.1604473, 2.032179, 1, 1, 1, 1, 1,
0.6883254, 1.95844, -0.5699411, 1, 1, 1, 1, 1,
0.6883321, -1.339832, 0.8740529, 1, 1, 1, 1, 1,
0.6901066, -0.05281927, 2.9518, 1, 1, 1, 1, 1,
0.6906517, 0.727145, 0.5210942, 1, 1, 1, 1, 1,
0.6909548, -2.173765, 2.814285, 1, 1, 1, 1, 1,
0.6974285, 1.125191, 1.263322, 0, 0, 1, 1, 1,
0.6975105, -0.1027857, 1.36385, 1, 0, 0, 1, 1,
0.7004086, 0.3668005, 1.820511, 1, 0, 0, 1, 1,
0.7062482, 0.2456532, 1.229359, 1, 0, 0, 1, 1,
0.7121013, -0.9942815, 3.668665, 1, 0, 0, 1, 1,
0.7142153, 0.6181718, -0.04072546, 1, 0, 0, 1, 1,
0.7154459, -0.2767475, 0.5163394, 0, 0, 0, 1, 1,
0.7165555, -0.2695286, 2.019788, 0, 0, 0, 1, 1,
0.7211145, -1.000136, 3.146565, 0, 0, 0, 1, 1,
0.7215978, -0.2424538, 2.293573, 0, 0, 0, 1, 1,
0.7270222, -1.052868, 3.888032, 0, 0, 0, 1, 1,
0.7292966, -0.651462, 3.169787, 0, 0, 0, 1, 1,
0.7304661, 0.1727139, 0.8397323, 0, 0, 0, 1, 1,
0.7305883, 1.740421, 0.4123842, 1, 1, 1, 1, 1,
0.7329311, -0.4325241, 0.1983821, 1, 1, 1, 1, 1,
0.7339938, -0.5389481, 2.473939, 1, 1, 1, 1, 1,
0.7348822, -2.222217, 1.483284, 1, 1, 1, 1, 1,
0.7364051, -0.7388208, 1.873441, 1, 1, 1, 1, 1,
0.7370642, 1.132565, -0.4971014, 1, 1, 1, 1, 1,
0.7381095, -1.222558, 1.939945, 1, 1, 1, 1, 1,
0.742562, 1.201624, 0.1603093, 1, 1, 1, 1, 1,
0.7454627, 0.7383947, 0.4376465, 1, 1, 1, 1, 1,
0.748986, -0.4454893, 0.7143487, 1, 1, 1, 1, 1,
0.7506098, -0.7863032, 0.3103306, 1, 1, 1, 1, 1,
0.7547113, 0.3356663, 1.388048, 1, 1, 1, 1, 1,
0.7570958, 0.7381799, 2.857426, 1, 1, 1, 1, 1,
0.7658796, 1.177246, 0.1164991, 1, 1, 1, 1, 1,
0.7664631, 0.5435073, 1.86524, 1, 1, 1, 1, 1,
0.7674287, -2.426149, 3.741045, 0, 0, 1, 1, 1,
0.7734053, 1.395131, 0.6282575, 1, 0, 0, 1, 1,
0.7764177, 0.8416772, 0.5951509, 1, 0, 0, 1, 1,
0.7766392, -0.4357592, 1.404703, 1, 0, 0, 1, 1,
0.7769046, 2.449011, 0.005370053, 1, 0, 0, 1, 1,
0.7780832, -1.067639, 0.9906942, 1, 0, 0, 1, 1,
0.7902883, -0.2946983, 1.994759, 0, 0, 0, 1, 1,
0.7973213, -1.137836, 2.156589, 0, 0, 0, 1, 1,
0.8004692, -0.1760634, -1.509384, 0, 0, 0, 1, 1,
0.8017044, -0.3099817, 2.369039, 0, 0, 0, 1, 1,
0.8017179, 0.789462, -0.2831956, 0, 0, 0, 1, 1,
0.8029009, -0.4006306, 2.174986, 0, 0, 0, 1, 1,
0.8044479, 0.6485801, 1.661473, 0, 0, 0, 1, 1,
0.8117843, -2.755991, 2.085844, 1, 1, 1, 1, 1,
0.8184396, -0.4473349, 0.8216184, 1, 1, 1, 1, 1,
0.8206163, 2.053588, -0.110632, 1, 1, 1, 1, 1,
0.8246613, -1.582939, 1.60232, 1, 1, 1, 1, 1,
0.8262077, -1.628202, 3.780355, 1, 1, 1, 1, 1,
0.8266864, -1.652078, 1.668926, 1, 1, 1, 1, 1,
0.8328634, 0.344937, 2.680423, 1, 1, 1, 1, 1,
0.8331305, 1.275943, 2.064412, 1, 1, 1, 1, 1,
0.8340777, 0.376796, 0.1995375, 1, 1, 1, 1, 1,
0.8341958, -2.239756, 2.11804, 1, 1, 1, 1, 1,
0.8349011, -0.5409489, 2.301537, 1, 1, 1, 1, 1,
0.8360898, 0.5231862, 2.824365, 1, 1, 1, 1, 1,
0.838634, -0.5524368, 0.4059214, 1, 1, 1, 1, 1,
0.8403375, -0.01788762, 1.688248, 1, 1, 1, 1, 1,
0.8560082, 0.5840497, 0.9955205, 1, 1, 1, 1, 1,
0.8597453, -0.1110172, 0.9316201, 0, 0, 1, 1, 1,
0.8630151, -0.2532753, 3.65027, 1, 0, 0, 1, 1,
0.8664947, 0.07267841, 2.779506, 1, 0, 0, 1, 1,
0.8666958, -0.5463514, 2.544369, 1, 0, 0, 1, 1,
0.8671856, -1.290671, 2.174531, 1, 0, 0, 1, 1,
0.8675195, -0.8408368, 2.191095, 1, 0, 0, 1, 1,
0.8692918, -1.287992, 2.271636, 0, 0, 0, 1, 1,
0.8698201, 0.4542884, 0.242186, 0, 0, 0, 1, 1,
0.8705345, -0.8132121, 2.676584, 0, 0, 0, 1, 1,
0.8765932, 0.3138814, 1.231446, 0, 0, 0, 1, 1,
0.8787495, 0.3813339, 1.643348, 0, 0, 0, 1, 1,
0.8789403, -1.129448, 3.228181, 0, 0, 0, 1, 1,
0.8805971, -0.5179387, 1.283942, 0, 0, 0, 1, 1,
0.8899438, -2.828692, 3.756245, 1, 1, 1, 1, 1,
0.8911648, -1.277928, 2.9575, 1, 1, 1, 1, 1,
0.8921045, -0.07698778, 2.371858, 1, 1, 1, 1, 1,
0.8974717, -0.2714287, 2.757523, 1, 1, 1, 1, 1,
0.9018377, -0.8091133, 2.147375, 1, 1, 1, 1, 1,
0.902136, 0.4725019, 0.476171, 1, 1, 1, 1, 1,
0.9112715, 0.9786187, 2.512738, 1, 1, 1, 1, 1,
0.9112815, -0.3652302, 0.4837191, 1, 1, 1, 1, 1,
0.9124587, -0.2327137, 0.2191438, 1, 1, 1, 1, 1,
0.9126933, 0.5657324, 1.953203, 1, 1, 1, 1, 1,
0.9197572, -1.818728, 3.029275, 1, 1, 1, 1, 1,
0.9284074, 0.8030676, 1.128094, 1, 1, 1, 1, 1,
0.9352509, -0.5649502, 1.790047, 1, 1, 1, 1, 1,
0.9366205, -1.453487, 2.764833, 1, 1, 1, 1, 1,
0.938012, -0.2266339, 1.050732, 1, 1, 1, 1, 1,
0.9412857, 0.4786291, -0.0635575, 0, 0, 1, 1, 1,
0.9416387, -0.3383383, 2.36002, 1, 0, 0, 1, 1,
0.9431201, 0.1211831, 0.5942034, 1, 0, 0, 1, 1,
0.944934, -2.438547, 1.525291, 1, 0, 0, 1, 1,
0.9462532, 0.9360756, 0.4445974, 1, 0, 0, 1, 1,
0.9484612, 0.1165906, 1.411955, 1, 0, 0, 1, 1,
0.9484913, 0.7549258, 0.1661616, 0, 0, 0, 1, 1,
0.9506196, 0.8837346, 2.890725, 0, 0, 0, 1, 1,
0.9582457, -1.509343, 3.66897, 0, 0, 0, 1, 1,
0.9690219, -1.271266, 3.623393, 0, 0, 0, 1, 1,
0.9743661, -0.6306261, 1.734782, 0, 0, 0, 1, 1,
0.9824923, 0.005710918, 3.318523, 0, 0, 0, 1, 1,
0.9875121, 0.4518066, 1.114122, 0, 0, 0, 1, 1,
0.9877074, -0.7778969, 2.316125, 1, 1, 1, 1, 1,
0.993022, 0.3072071, 2.087682, 1, 1, 1, 1, 1,
0.996736, 0.0272548, 2.157626, 1, 1, 1, 1, 1,
1.014255, -0.5230847, 1.535126, 1, 1, 1, 1, 1,
1.016439, 1.481653, -1.090719, 1, 1, 1, 1, 1,
1.019692, 1.315214, 1.856356, 1, 1, 1, 1, 1,
1.02017, 1.525775, 1.018896, 1, 1, 1, 1, 1,
1.024472, -0.6583309, 2.239778, 1, 1, 1, 1, 1,
1.027749, -0.1121658, 1.267589, 1, 1, 1, 1, 1,
1.028515, -0.3914914, 0.8832132, 1, 1, 1, 1, 1,
1.03682, 0.4882132, 2.501845, 1, 1, 1, 1, 1,
1.046995, -0.5574506, 3.981955, 1, 1, 1, 1, 1,
1.047324, -1.167231, 2.380569, 1, 1, 1, 1, 1,
1.04753, -1.176059, 2.689979, 1, 1, 1, 1, 1,
1.064197, -0.5080402, 0.6315961, 1, 1, 1, 1, 1,
1.070802, 0.3477091, 0.6175477, 0, 0, 1, 1, 1,
1.075407, -0.8132053, 2.765197, 1, 0, 0, 1, 1,
1.077789, 2.577399, -2.258153, 1, 0, 0, 1, 1,
1.092122, -0.3204627, 0.6952188, 1, 0, 0, 1, 1,
1.095668, -1.296993, 1.989808, 1, 0, 0, 1, 1,
1.096917, 0.114402, 2.572519, 1, 0, 0, 1, 1,
1.103395, -0.7522638, 3.259679, 0, 0, 0, 1, 1,
1.110801, 2.353763, 0.9259707, 0, 0, 0, 1, 1,
1.113187, -1.407433, 2.679286, 0, 0, 0, 1, 1,
1.113285, -1.292462, 2.952877, 0, 0, 0, 1, 1,
1.114491, 1.826351, 1.038083, 0, 0, 0, 1, 1,
1.121067, -1.261065, 1.592714, 0, 0, 0, 1, 1,
1.123111, 0.4120933, 1.772923, 0, 0, 0, 1, 1,
1.124874, -1.851202, 3.133761, 1, 1, 1, 1, 1,
1.126805, -0.6016835, 3.263491, 1, 1, 1, 1, 1,
1.133392, 1.454747, 0.4957767, 1, 1, 1, 1, 1,
1.153219, 0.6419876, 1.586317, 1, 1, 1, 1, 1,
1.154286, -0.120441, 2.473334, 1, 1, 1, 1, 1,
1.162803, 1.781816, 1.231208, 1, 1, 1, 1, 1,
1.164599, -0.2441166, 0.7260805, 1, 1, 1, 1, 1,
1.165737, 1.831645, 2.966636, 1, 1, 1, 1, 1,
1.169199, -1.147702, 2.045473, 1, 1, 1, 1, 1,
1.175648, 1.045884, 0.6588441, 1, 1, 1, 1, 1,
1.177194, -1.700588, 2.876241, 1, 1, 1, 1, 1,
1.177757, -0.8462642, 1.607348, 1, 1, 1, 1, 1,
1.179169, 2.546577, 1.448516, 1, 1, 1, 1, 1,
1.185119, 0.7194474, 0.1638098, 1, 1, 1, 1, 1,
1.188969, -0.3909138, 2.16482, 1, 1, 1, 1, 1,
1.19135, 2.254518, 0.4754407, 0, 0, 1, 1, 1,
1.204234, 0.3750885, 0.4711971, 1, 0, 0, 1, 1,
1.205066, -2.476728, 2.175525, 1, 0, 0, 1, 1,
1.209395, -0.5981904, 2.724682, 1, 0, 0, 1, 1,
1.220332, -0.7703598, 2.011347, 1, 0, 0, 1, 1,
1.231282, 1.076223, 1.400087, 1, 0, 0, 1, 1,
1.23293, 1.092042, 0.9367754, 0, 0, 0, 1, 1,
1.24077, -0.9800069, 2.695351, 0, 0, 0, 1, 1,
1.242604, -0.3105496, 3.106095, 0, 0, 0, 1, 1,
1.250128, 0.4532559, 1.047152, 0, 0, 0, 1, 1,
1.250987, -1.744037, 0.5033606, 0, 0, 0, 1, 1,
1.255124, 0.5248891, 2.655718, 0, 0, 0, 1, 1,
1.256045, 2.088342, 1.248114, 0, 0, 0, 1, 1,
1.26086, 0.5679046, 1.24505, 1, 1, 1, 1, 1,
1.261903, -1.542487, 2.77476, 1, 1, 1, 1, 1,
1.267267, -0.1906752, 1.669386, 1, 1, 1, 1, 1,
1.29207, -2.48536, 2.275299, 1, 1, 1, 1, 1,
1.29599, -0.1970001, 3.342733, 1, 1, 1, 1, 1,
1.302737, -0.9078864, 2.866813, 1, 1, 1, 1, 1,
1.304666, -0.9723126, 3.028294, 1, 1, 1, 1, 1,
1.319144, 0.3198361, 2.335058, 1, 1, 1, 1, 1,
1.340132, 0.5052891, 1.833619, 1, 1, 1, 1, 1,
1.342911, 0.03970568, 1.414914, 1, 1, 1, 1, 1,
1.347273, -1.226031, 2.214526, 1, 1, 1, 1, 1,
1.355525, -0.9805522, 1.380912, 1, 1, 1, 1, 1,
1.36299, 0.86537, -0.4771246, 1, 1, 1, 1, 1,
1.373113, 0.2871244, -0.894009, 1, 1, 1, 1, 1,
1.387464, -2.772891, 3.706509, 1, 1, 1, 1, 1,
1.40178, -0.2613205, 0.4867561, 0, 0, 1, 1, 1,
1.405989, -0.6644683, 2.707345, 1, 0, 0, 1, 1,
1.410465, 0.06492825, 0.6124636, 1, 0, 0, 1, 1,
1.413967, 0.2119585, 3.104527, 1, 0, 0, 1, 1,
1.427833, 0.5103993, 2.112433, 1, 0, 0, 1, 1,
1.431509, 0.8559865, -1.243392, 1, 0, 0, 1, 1,
1.442598, 0.5443251, 2.043388, 0, 0, 0, 1, 1,
1.467433, -0.0333719, -0.5912071, 0, 0, 0, 1, 1,
1.476303, 1.524181, -0.1557824, 0, 0, 0, 1, 1,
1.481484, 0.5643404, 2.380752, 0, 0, 0, 1, 1,
1.505962, -1.70399, 1.572373, 0, 0, 0, 1, 1,
1.515903, 0.3033529, 0.5893171, 0, 0, 0, 1, 1,
1.519592, 0.1133826, 1.490893, 0, 0, 0, 1, 1,
1.525673, -0.1679131, 2.235638, 1, 1, 1, 1, 1,
1.534057, 0.8795004, 0.7069978, 1, 1, 1, 1, 1,
1.558611, 0.4476306, 2.166694, 1, 1, 1, 1, 1,
1.563135, 0.1022865, 0.7013428, 1, 1, 1, 1, 1,
1.570693, 1.03568, 1.312461, 1, 1, 1, 1, 1,
1.577246, 2.418099, 2.776958, 1, 1, 1, 1, 1,
1.578517, 0.2765384, 2.714561, 1, 1, 1, 1, 1,
1.588433, 1.877391, 0.05116769, 1, 1, 1, 1, 1,
1.591551, -0.9082181, 0.6064405, 1, 1, 1, 1, 1,
1.600834, 0.7216352, 2.447999, 1, 1, 1, 1, 1,
1.605059, 0.7509464, 2.861415, 1, 1, 1, 1, 1,
1.607965, -1.486951, 1.257755, 1, 1, 1, 1, 1,
1.612327, -0.420244, 0.8574513, 1, 1, 1, 1, 1,
1.624802, -1.632737, 2.226994, 1, 1, 1, 1, 1,
1.653526, -0.2023307, -0.5759134, 1, 1, 1, 1, 1,
1.65996, 0.3632681, -0.6206845, 0, 0, 1, 1, 1,
1.675894, -1.190135, 0.607639, 1, 0, 0, 1, 1,
1.67949, 0.390329, 1.631907, 1, 0, 0, 1, 1,
1.681928, -1.53393, 2.142416, 1, 0, 0, 1, 1,
1.685616, -1.326313, -0.2024029, 1, 0, 0, 1, 1,
1.691903, 1.270897, 2.846273, 1, 0, 0, 1, 1,
1.695123, 1.771504, 2.421502, 0, 0, 0, 1, 1,
1.700608, -1.933307, 1.247638, 0, 0, 0, 1, 1,
1.767934, -0.4065272, 3.177948, 0, 0, 0, 1, 1,
1.774983, 1.113003, 2.223718, 0, 0, 0, 1, 1,
1.778565, -0.8024824, 1.576176, 0, 0, 0, 1, 1,
1.782771, 1.279806, 1.639463, 0, 0, 0, 1, 1,
1.783108, 0.582813, 1.6434, 0, 0, 0, 1, 1,
1.790839, 1.431699, 1.822426, 1, 1, 1, 1, 1,
1.807236, -0.1614118, 0.7287626, 1, 1, 1, 1, 1,
1.813573, -0.2867373, 1.683442, 1, 1, 1, 1, 1,
1.820712, 0.7782102, 1.172928, 1, 1, 1, 1, 1,
1.850469, -0.09161389, 1.41095, 1, 1, 1, 1, 1,
1.851185, -1.606383, 2.930783, 1, 1, 1, 1, 1,
1.863815, -0.114554, 1.807072, 1, 1, 1, 1, 1,
1.865388, 0.646406, 1.685492, 1, 1, 1, 1, 1,
1.891826, 0.03262649, 2.437604, 1, 1, 1, 1, 1,
1.919616, -0.5636398, 1.395569, 1, 1, 1, 1, 1,
1.931813, -0.7704484, 2.423322, 1, 1, 1, 1, 1,
1.941214, 1.103621, 1.552073, 1, 1, 1, 1, 1,
1.954523, 0.01538498, -0.419753, 1, 1, 1, 1, 1,
2.00016, 0.2455144, 1.545368, 1, 1, 1, 1, 1,
2.020115, 0.7569422, 1.595958, 1, 1, 1, 1, 1,
2.030795, 0.4513794, 1.585531, 0, 0, 1, 1, 1,
2.04437, -1.932426, 1.491464, 1, 0, 0, 1, 1,
2.067984, 0.2268097, 0.7322931, 1, 0, 0, 1, 1,
2.094012, 0.2880124, 1.110335, 1, 0, 0, 1, 1,
2.120026, 0.2238035, 2.918735, 1, 0, 0, 1, 1,
2.121077, 0.7426244, 1.544637, 1, 0, 0, 1, 1,
2.175301, 0.7964174, 1.510148, 0, 0, 0, 1, 1,
2.183766, -2.145914, 3.083989, 0, 0, 0, 1, 1,
2.185448, 0.2448885, 1.181121, 0, 0, 0, 1, 1,
2.189684, -0.2715832, 2.227942, 0, 0, 0, 1, 1,
2.244784, -0.5335937, 1.395615, 0, 0, 0, 1, 1,
2.256288, -1.089804, 0.2064244, 0, 0, 0, 1, 1,
2.345492, 0.4386629, 1.289082, 0, 0, 0, 1, 1,
2.485826, -0.231821, 0.4011113, 1, 1, 1, 1, 1,
2.503138, -0.7856462, 2.284164, 1, 1, 1, 1, 1,
2.504198, -1.019329, 1.441774, 1, 1, 1, 1, 1,
2.584094, -0.4394594, 1.986476, 1, 1, 1, 1, 1,
2.67904, 0.1192384, 1.979588, 1, 1, 1, 1, 1,
2.78122, 0.4262365, 2.199715, 1, 1, 1, 1, 1,
2.790736, 0.362278, 2.086277, 1, 1, 1, 1, 1
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
var radius = 8.966723;
var distance = 31.49524;
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
mvMatrix.translate( 0.2038661, -0.05420065, 0.1173863 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.49524);
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
