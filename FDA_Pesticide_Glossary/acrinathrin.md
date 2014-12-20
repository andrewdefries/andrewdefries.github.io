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
-3.980338, 0.1981639, -1.508905, 1, 0, 0, 1,
-3.332396, -0.03906738, -1.579637, 1, 0.007843138, 0, 1,
-2.839436, -2.002362, -2.398473, 1, 0.01176471, 0, 1,
-2.673687, -0.5988494, -2.054946, 1, 0.01960784, 0, 1,
-2.552969, 1.070843, 0.02372122, 1, 0.02352941, 0, 1,
-2.453711, 0.885113, -0.6848508, 1, 0.03137255, 0, 1,
-2.444204, -1.232879, -1.803672, 1, 0.03529412, 0, 1,
-2.439486, 1.402751, -0.0651887, 1, 0.04313726, 0, 1,
-2.403226, 0.2805649, -1.072746, 1, 0.04705882, 0, 1,
-2.379282, 1.236979, 0.1337514, 1, 0.05490196, 0, 1,
-2.360539, -1.265093, -2.172504, 1, 0.05882353, 0, 1,
-2.281434, 2.361689, -0.9020779, 1, 0.06666667, 0, 1,
-2.223296, -1.104927, -0.8917376, 1, 0.07058824, 0, 1,
-2.215508, 1.127437, -3.537418, 1, 0.07843138, 0, 1,
-2.195319, -3.285788, -1.590161, 1, 0.08235294, 0, 1,
-2.18395, -0.3741533, -2.241077, 1, 0.09019608, 0, 1,
-2.179583, 0.5537631, 1.209344, 1, 0.09411765, 0, 1,
-2.164059, -0.1146608, -0.1358566, 1, 0.1019608, 0, 1,
-2.147007, -0.3165396, -2.508649, 1, 0.1098039, 0, 1,
-2.111774, 0.6066829, -1.876344, 1, 0.1137255, 0, 1,
-2.102596, 0.4405224, -0.3932163, 1, 0.1215686, 0, 1,
-2.095727, 0.2665065, -0.6388525, 1, 0.1254902, 0, 1,
-2.088519, -0.9924586, -1.515896, 1, 0.1333333, 0, 1,
-2.064632, -0.7859437, -0.7232704, 1, 0.1372549, 0, 1,
-2.063946, -1.280644, -1.804725, 1, 0.145098, 0, 1,
-2.062562, -0.8453282, -2.429112, 1, 0.1490196, 0, 1,
-2.060132, -0.3441885, -2.365593, 1, 0.1568628, 0, 1,
-2.043393, 2.209988, -2.46435, 1, 0.1607843, 0, 1,
-2.040876, 0.7750055, 0.1710574, 1, 0.1686275, 0, 1,
-2.025112, 1.352686, -0.5350841, 1, 0.172549, 0, 1,
-1.96866, 0.01302187, -3.171095, 1, 0.1803922, 0, 1,
-1.961635, 0.239544, -1.132333, 1, 0.1843137, 0, 1,
-1.884603, 1.792406, -2.170108, 1, 0.1921569, 0, 1,
-1.868414, -0.3229006, -1.609081, 1, 0.1960784, 0, 1,
-1.855666, 1.965699, -2.802219, 1, 0.2039216, 0, 1,
-1.846113, -0.6879558, -1.579078, 1, 0.2117647, 0, 1,
-1.84144, 0.2901863, -0.1957525, 1, 0.2156863, 0, 1,
-1.822469, 0.6000361, -1.965652, 1, 0.2235294, 0, 1,
-1.810219, 1.264173, -0.615721, 1, 0.227451, 0, 1,
-1.793084, -0.3086626, -1.365809, 1, 0.2352941, 0, 1,
-1.787486, 0.08661508, 0.1103347, 1, 0.2392157, 0, 1,
-1.778623, 1.112575, -0.3692297, 1, 0.2470588, 0, 1,
-1.764351, -1.715242, -3.109451, 1, 0.2509804, 0, 1,
-1.760285, 0.2217752, -0.3471138, 1, 0.2588235, 0, 1,
-1.758325, 0.1544609, -1.515197, 1, 0.2627451, 0, 1,
-1.735559, 0.8779646, -0.942633, 1, 0.2705882, 0, 1,
-1.716334, -0.3439473, -1.378106, 1, 0.2745098, 0, 1,
-1.696004, -1.683473, -2.327422, 1, 0.282353, 0, 1,
-1.67855, 1.059324, -0.8295065, 1, 0.2862745, 0, 1,
-1.675553, -0.07429411, -0.9725732, 1, 0.2941177, 0, 1,
-1.626612, 0.1304766, -2.551024, 1, 0.3019608, 0, 1,
-1.608532, -0.1886429, -2.115124, 1, 0.3058824, 0, 1,
-1.60546, -1.870773, -1.334625, 1, 0.3137255, 0, 1,
-1.603967, 0.2569274, -0.3938342, 1, 0.3176471, 0, 1,
-1.585576, 0.3696321, -1.67826, 1, 0.3254902, 0, 1,
-1.581384, 2.147648, -0.5753148, 1, 0.3294118, 0, 1,
-1.562667, -1.944481, -2.524246, 1, 0.3372549, 0, 1,
-1.553841, 0.01497126, -0.8417672, 1, 0.3411765, 0, 1,
-1.553786, -1.369768, -3.298106, 1, 0.3490196, 0, 1,
-1.553046, -0.9142374, -1.820034, 1, 0.3529412, 0, 1,
-1.548137, -1.412104, -1.958959, 1, 0.3607843, 0, 1,
-1.546868, 0.6584689, -2.172748, 1, 0.3647059, 0, 1,
-1.546057, -0.9766657, 0.4856237, 1, 0.372549, 0, 1,
-1.545537, -1.074536, -2.953223, 1, 0.3764706, 0, 1,
-1.533905, -1.175163, -0.4918863, 1, 0.3843137, 0, 1,
-1.523932, -0.6045481, -3.199277, 1, 0.3882353, 0, 1,
-1.512173, 0.8343385, -1.441804, 1, 0.3960784, 0, 1,
-1.509737, -0.1607231, -0.9998163, 1, 0.4039216, 0, 1,
-1.507005, -0.7857749, -1.48833, 1, 0.4078431, 0, 1,
-1.50694, -0.09853198, -0.8390073, 1, 0.4156863, 0, 1,
-1.496796, -0.320183, -3.306729, 1, 0.4196078, 0, 1,
-1.450222, 0.6684155, -1.389655, 1, 0.427451, 0, 1,
-1.434974, -1.373277, -3.18672, 1, 0.4313726, 0, 1,
-1.428646, 0.03519881, -3.709273, 1, 0.4392157, 0, 1,
-1.424234, -0.9259214, -2.420635, 1, 0.4431373, 0, 1,
-1.420814, -0.6079139, -2.25582, 1, 0.4509804, 0, 1,
-1.415757, -0.258125, -0.997109, 1, 0.454902, 0, 1,
-1.409292, 0.4643662, -1.285904, 1, 0.4627451, 0, 1,
-1.407995, 0.8543692, -1.490043, 1, 0.4666667, 0, 1,
-1.407745, 0.9506041, -0.9107537, 1, 0.4745098, 0, 1,
-1.404366, -1.697774, -2.281984, 1, 0.4784314, 0, 1,
-1.381223, -0.4370612, -2.789535, 1, 0.4862745, 0, 1,
-1.368164, 0.6668881, -0.4557573, 1, 0.4901961, 0, 1,
-1.366224, 0.9107676, -0.5868402, 1, 0.4980392, 0, 1,
-1.366166, 1.046847, 0.2582126, 1, 0.5058824, 0, 1,
-1.363461, -2.049729, -3.038516, 1, 0.509804, 0, 1,
-1.362844, 0.1655158, 0.8572671, 1, 0.5176471, 0, 1,
-1.361334, -0.1918518, -0.2933722, 1, 0.5215687, 0, 1,
-1.345621, 0.9192264, -1.497944, 1, 0.5294118, 0, 1,
-1.340947, 1.389116, -0.7398019, 1, 0.5333334, 0, 1,
-1.330256, -0.6698409, -3.246466, 1, 0.5411765, 0, 1,
-1.313488, 2.435766, -0.06095527, 1, 0.5450981, 0, 1,
-1.313359, 1.63328, -1.125442, 1, 0.5529412, 0, 1,
-1.304952, -0.1966945, -1.393002, 1, 0.5568628, 0, 1,
-1.298189, 0.89496, -0.04990028, 1, 0.5647059, 0, 1,
-1.286225, 0.7216753, -0.8008226, 1, 0.5686275, 0, 1,
-1.283554, 0.5823802, -0.4220096, 1, 0.5764706, 0, 1,
-1.281494, 0.5750464, -0.3644535, 1, 0.5803922, 0, 1,
-1.27931, 0.8670553, -0.7683622, 1, 0.5882353, 0, 1,
-1.262316, 0.3579316, -2.578706, 1, 0.5921569, 0, 1,
-1.237233, -0.5813076, -2.157488, 1, 0.6, 0, 1,
-1.225188, 0.8705651, -1.316504, 1, 0.6078432, 0, 1,
-1.225116, -0.5562541, -3.197068, 1, 0.6117647, 0, 1,
-1.219574, -0.0220567, -1.890725, 1, 0.6196079, 0, 1,
-1.212505, -1.675666, -2.548455, 1, 0.6235294, 0, 1,
-1.20811, 0.4802381, -2.063347, 1, 0.6313726, 0, 1,
-1.199964, 1.389954, 0.4179489, 1, 0.6352941, 0, 1,
-1.195018, 2.811775, 1.478411, 1, 0.6431373, 0, 1,
-1.17909, -1.317669, -1.33791, 1, 0.6470588, 0, 1,
-1.177617, 0.7098617, -0.7032145, 1, 0.654902, 0, 1,
-1.177095, 1.056001, -0.206945, 1, 0.6588235, 0, 1,
-1.17519, 1.733318, 1.340672, 1, 0.6666667, 0, 1,
-1.172993, 1.388886, -0.04073935, 1, 0.6705883, 0, 1,
-1.17227, -1.385034, -2.500869, 1, 0.6784314, 0, 1,
-1.161391, 1.170408, -0.1244687, 1, 0.682353, 0, 1,
-1.153005, -0.2753052, -1.186545, 1, 0.6901961, 0, 1,
-1.139337, 0.2612678, -1.221883, 1, 0.6941177, 0, 1,
-1.139033, -0.07730964, -0.779947, 1, 0.7019608, 0, 1,
-1.138387, 0.3813517, -1.369613, 1, 0.7098039, 0, 1,
-1.137607, 0.6535635, -0.7080408, 1, 0.7137255, 0, 1,
-1.137095, 0.001140377, -2.900988, 1, 0.7215686, 0, 1,
-1.133075, 1.021882, -1.730868, 1, 0.7254902, 0, 1,
-1.12144, 1.311417, -0.3572371, 1, 0.7333333, 0, 1,
-1.118776, 0.4955103, -2.100405, 1, 0.7372549, 0, 1,
-1.107954, -0.4135099, -3.442899, 1, 0.7450981, 0, 1,
-1.106563, -0.06101695, -2.073691, 1, 0.7490196, 0, 1,
-1.101896, -0.6755154, -2.160006, 1, 0.7568628, 0, 1,
-1.101508, 0.3072041, -1.110456, 1, 0.7607843, 0, 1,
-1.087309, 0.1999646, -1.67981, 1, 0.7686275, 0, 1,
-1.084696, -1.071, -1.069076, 1, 0.772549, 0, 1,
-1.081079, 0.4026946, -1.28525, 1, 0.7803922, 0, 1,
-1.078289, 1.361737, -0.2483424, 1, 0.7843137, 0, 1,
-1.075353, 1.202603, -0.6471049, 1, 0.7921569, 0, 1,
-1.056297, -1.073308, -2.244736, 1, 0.7960784, 0, 1,
-1.055319, 0.5482041, -0.2424479, 1, 0.8039216, 0, 1,
-1.055205, -0.03736133, -3.568413, 1, 0.8117647, 0, 1,
-1.049147, -0.1225367, -1.603085, 1, 0.8156863, 0, 1,
-1.047156, 1.036821, -0.4439822, 1, 0.8235294, 0, 1,
-1.046962, -0.5103561, -2.116519, 1, 0.827451, 0, 1,
-1.041125, -0.2680099, -1.425467, 1, 0.8352941, 0, 1,
-1.031245, -1.570763, -2.127398, 1, 0.8392157, 0, 1,
-1.016989, -0.7184577, -2.028281, 1, 0.8470588, 0, 1,
-1.001698, -0.6688218, -2.267563, 1, 0.8509804, 0, 1,
-0.9948372, -0.4733036, -1.970996, 1, 0.8588235, 0, 1,
-0.9940562, -1.548662, -2.968098, 1, 0.8627451, 0, 1,
-0.9931712, 2.050839, -0.3646486, 1, 0.8705882, 0, 1,
-0.9924705, -0.1823699, -2.599235, 1, 0.8745098, 0, 1,
-0.9918936, -0.1608737, -1.930631, 1, 0.8823529, 0, 1,
-0.9664792, -0.2263571, -1.576895, 1, 0.8862745, 0, 1,
-0.965925, -1.040968, -1.731467, 1, 0.8941177, 0, 1,
-0.9654471, -0.8041011, -4.515823, 1, 0.8980392, 0, 1,
-0.9639195, 0.91508, -1.732109, 1, 0.9058824, 0, 1,
-0.9582258, 0.7312599, -2.139765, 1, 0.9137255, 0, 1,
-0.957696, -0.4287005, 0.02661382, 1, 0.9176471, 0, 1,
-0.9555405, 1.12416, -0.1092196, 1, 0.9254902, 0, 1,
-0.9510365, -0.6444083, -2.454329, 1, 0.9294118, 0, 1,
-0.9480343, 1.615274, -0.5219762, 1, 0.9372549, 0, 1,
-0.9453937, 1.632575, -0.9790515, 1, 0.9411765, 0, 1,
-0.944275, 0.272187, -2.450193, 1, 0.9490196, 0, 1,
-0.9419757, -0.9792709, -4.442685, 1, 0.9529412, 0, 1,
-0.9337376, 0.6952354, 0.9015442, 1, 0.9607843, 0, 1,
-0.9247821, 1.274384, -0.6294436, 1, 0.9647059, 0, 1,
-0.9185453, 0.4811795, -1.528516, 1, 0.972549, 0, 1,
-0.9132245, -0.2496482, -0.7698173, 1, 0.9764706, 0, 1,
-0.9068551, 0.370681, -1.570679, 1, 0.9843137, 0, 1,
-0.90504, -1.380475, -3.667723, 1, 0.9882353, 0, 1,
-0.8992227, -1.888923, -4.129205, 1, 0.9960784, 0, 1,
-0.8931084, 0.2777382, -0.4513153, 0.9960784, 1, 0, 1,
-0.8888186, -1.200938, -2.104361, 0.9921569, 1, 0, 1,
-0.8844354, -0.05345222, -2.570115, 0.9843137, 1, 0, 1,
-0.8830708, -0.3077499, -2.036922, 0.9803922, 1, 0, 1,
-0.8784676, 0.8729504, -0.3417022, 0.972549, 1, 0, 1,
-0.8717632, -0.5085113, -3.649228, 0.9686275, 1, 0, 1,
-0.8636186, 0.7173709, -1.663059, 0.9607843, 1, 0, 1,
-0.8633168, -0.6918603, -2.157807, 0.9568627, 1, 0, 1,
-0.8616951, 0.5425457, -1.456783, 0.9490196, 1, 0, 1,
-0.8562734, -0.2182147, -4.222099, 0.945098, 1, 0, 1,
-0.8496469, -0.3643047, -3.774236, 0.9372549, 1, 0, 1,
-0.8476868, -0.8372294, -3.52359, 0.9333333, 1, 0, 1,
-0.840116, 0.5502464, -0.4169122, 0.9254902, 1, 0, 1,
-0.8397292, 2.340051, 0.06995069, 0.9215686, 1, 0, 1,
-0.8295247, 2.151208, -1.8558, 0.9137255, 1, 0, 1,
-0.8203384, -1.116807, -2.591935, 0.9098039, 1, 0, 1,
-0.8185273, -0.8969825, -2.775918, 0.9019608, 1, 0, 1,
-0.8164787, 0.7658237, -0.7438088, 0.8941177, 1, 0, 1,
-0.8158169, -0.1079899, -0.5509093, 0.8901961, 1, 0, 1,
-0.8138862, 0.2433845, -0.1445755, 0.8823529, 1, 0, 1,
-0.8084394, -0.4610443, -0.6104069, 0.8784314, 1, 0, 1,
-0.8063019, 0.7004519, 0.3435088, 0.8705882, 1, 0, 1,
-0.8010558, -0.1723829, -1.679067, 0.8666667, 1, 0, 1,
-0.7985387, -0.1881526, -3.012228, 0.8588235, 1, 0, 1,
-0.797553, 0.3598566, -1.414486, 0.854902, 1, 0, 1,
-0.7962495, -0.6285169, -2.937947, 0.8470588, 1, 0, 1,
-0.7919803, -0.01722036, -2.77673, 0.8431373, 1, 0, 1,
-0.7853129, -0.001144076, -2.159079, 0.8352941, 1, 0, 1,
-0.7848301, 1.880771, -0.8889655, 0.8313726, 1, 0, 1,
-0.778772, -0.7975134, -4.331004, 0.8235294, 1, 0, 1,
-0.7781228, -0.4142684, -1.165691, 0.8196079, 1, 0, 1,
-0.7672175, -0.1847918, -3.689357, 0.8117647, 1, 0, 1,
-0.7627437, -0.1836763, -2.754572, 0.8078431, 1, 0, 1,
-0.762508, 0.4103695, -0.3245385, 0.8, 1, 0, 1,
-0.7604919, 0.00148735, 0.03347215, 0.7921569, 1, 0, 1,
-0.7601955, 1.24473, 1.1952, 0.7882353, 1, 0, 1,
-0.7592133, 0.06034215, -0.5374297, 0.7803922, 1, 0, 1,
-0.7575859, -0.4044214, -3.064051, 0.7764706, 1, 0, 1,
-0.7561747, 0.9936341, 0.5357715, 0.7686275, 1, 0, 1,
-0.7559524, -0.6459764, -2.982584, 0.7647059, 1, 0, 1,
-0.7540333, 0.6502929, -0.3167845, 0.7568628, 1, 0, 1,
-0.7513659, 0.3443542, -2.431525, 0.7529412, 1, 0, 1,
-0.7494724, 1.813289, 0.1989665, 0.7450981, 1, 0, 1,
-0.7444882, 0.198909, -0.3993348, 0.7411765, 1, 0, 1,
-0.7441379, -0.3687925, -2.410209, 0.7333333, 1, 0, 1,
-0.7435325, -0.1081648, -1.452188, 0.7294118, 1, 0, 1,
-0.7363277, 1.038785, -0.8988038, 0.7215686, 1, 0, 1,
-0.7357484, -0.02920278, 0.2643083, 0.7176471, 1, 0, 1,
-0.7349648, -0.7084507, -2.846788, 0.7098039, 1, 0, 1,
-0.734258, 2.111257, 1.041561, 0.7058824, 1, 0, 1,
-0.7332674, 0.7356905, -1.474001, 0.6980392, 1, 0, 1,
-0.7301736, -1.181935, -2.612811, 0.6901961, 1, 0, 1,
-0.727176, -1.15368, -3.030385, 0.6862745, 1, 0, 1,
-0.7263599, -0.5473999, -1.016984, 0.6784314, 1, 0, 1,
-0.7259843, 1.413894, 0.4797121, 0.6745098, 1, 0, 1,
-0.70669, 2.552914, 1.500192, 0.6666667, 1, 0, 1,
-0.7035011, 2.311311, -0.9771349, 0.6627451, 1, 0, 1,
-0.7004033, 0.05533291, -2.152938, 0.654902, 1, 0, 1,
-0.6977095, -0.6886628, -2.3477, 0.6509804, 1, 0, 1,
-0.6940817, 0.7878804, -2.110927, 0.6431373, 1, 0, 1,
-0.6925759, -1.774049, -1.756829, 0.6392157, 1, 0, 1,
-0.6910344, -0.06746408, -2.516878, 0.6313726, 1, 0, 1,
-0.6900069, -0.8024492, -2.429112, 0.627451, 1, 0, 1,
-0.6870194, -0.9601887, -3.696604, 0.6196079, 1, 0, 1,
-0.6857783, -2.451606, -3.507213, 0.6156863, 1, 0, 1,
-0.6842121, -0.4970056, -1.369395, 0.6078432, 1, 0, 1,
-0.6836975, 0.597114, -0.7669176, 0.6039216, 1, 0, 1,
-0.6834595, 1.149835, 0.3828598, 0.5960785, 1, 0, 1,
-0.6767389, -0.2080156, -2.564764, 0.5882353, 1, 0, 1,
-0.6759941, 1.290808, 2.038816, 0.5843138, 1, 0, 1,
-0.6733491, 0.227046, -1.264607, 0.5764706, 1, 0, 1,
-0.6691948, 1.340693, -1.936031, 0.572549, 1, 0, 1,
-0.6689677, -0.355552, -1.351747, 0.5647059, 1, 0, 1,
-0.6663908, 0.2177687, -0.8770475, 0.5607843, 1, 0, 1,
-0.6655049, -0.9241796, -2.537852, 0.5529412, 1, 0, 1,
-0.6643355, 0.05611503, -2.95111, 0.5490196, 1, 0, 1,
-0.6631021, -0.007306737, -0.8385978, 0.5411765, 1, 0, 1,
-0.6552012, 0.4297067, -1.700048, 0.5372549, 1, 0, 1,
-0.6523788, 1.205186, 1.588596, 0.5294118, 1, 0, 1,
-0.6436579, -1.352594, -3.676215, 0.5254902, 1, 0, 1,
-0.6421019, 0.4774714, 0.1222601, 0.5176471, 1, 0, 1,
-0.6413632, 0.103837, -2.160426, 0.5137255, 1, 0, 1,
-0.640889, -2.450102, -1.269647, 0.5058824, 1, 0, 1,
-0.6352273, 0.8916056, -0.2925902, 0.5019608, 1, 0, 1,
-0.6351945, 0.68954, -1.017904, 0.4941176, 1, 0, 1,
-0.6338115, -0.571798, -1.606071, 0.4862745, 1, 0, 1,
-0.6224896, -0.2011855, -2.809382, 0.4823529, 1, 0, 1,
-0.6189675, -0.5308692, -0.8947326, 0.4745098, 1, 0, 1,
-0.6171716, -0.1962264, -2.179019, 0.4705882, 1, 0, 1,
-0.6150127, -0.284333, -1.861119, 0.4627451, 1, 0, 1,
-0.6135657, 0.6907216, 0.4301014, 0.4588235, 1, 0, 1,
-0.6090716, -0.7476321, -3.290473, 0.4509804, 1, 0, 1,
-0.6068434, 0.4954401, 2.080301, 0.4470588, 1, 0, 1,
-0.5971206, -0.4279417, -1.366336, 0.4392157, 1, 0, 1,
-0.595191, -0.472403, -1.734275, 0.4352941, 1, 0, 1,
-0.5933505, 0.3724269, -1.343648, 0.427451, 1, 0, 1,
-0.5830488, 0.7668645, -0.8111217, 0.4235294, 1, 0, 1,
-0.5820435, 2.13853, 2.365257, 0.4156863, 1, 0, 1,
-0.5812858, -0.9434404, -2.987905, 0.4117647, 1, 0, 1,
-0.5787657, 1.351852, 1.524679, 0.4039216, 1, 0, 1,
-0.5779617, -1.037672, -1.45093, 0.3960784, 1, 0, 1,
-0.5702087, 0.2953129, -1.181537, 0.3921569, 1, 0, 1,
-0.5663741, 2.39879, 0.8625686, 0.3843137, 1, 0, 1,
-0.5660669, -0.2926782, -2.573527, 0.3803922, 1, 0, 1,
-0.5652021, -0.0006082777, -1.718789, 0.372549, 1, 0, 1,
-0.5613778, -2.6404, -2.803774, 0.3686275, 1, 0, 1,
-0.5604496, -0.1685051, -2.12091, 0.3607843, 1, 0, 1,
-0.5595344, 1.056038, 0.2096532, 0.3568628, 1, 0, 1,
-0.556088, -2.150454, -1.538749, 0.3490196, 1, 0, 1,
-0.5554827, 1.032226, -1.298095, 0.345098, 1, 0, 1,
-0.5467632, -0.422827, -1.722089, 0.3372549, 1, 0, 1,
-0.5429211, -1.288489, -2.629603, 0.3333333, 1, 0, 1,
-0.5412555, 0.1289276, -0.8043498, 0.3254902, 1, 0, 1,
-0.5407228, -0.4539995, -2.327207, 0.3215686, 1, 0, 1,
-0.5394558, -0.2547973, -1.617209, 0.3137255, 1, 0, 1,
-0.5296855, 0.8542515, -1.258152, 0.3098039, 1, 0, 1,
-0.5261106, -0.430091, -2.679115, 0.3019608, 1, 0, 1,
-0.5257999, 0.2332744, -1.417107, 0.2941177, 1, 0, 1,
-0.5176927, -0.35957, -2.308037, 0.2901961, 1, 0, 1,
-0.5169188, -0.006996985, -1.947811, 0.282353, 1, 0, 1,
-0.5167269, 1.470262, -1.445444, 0.2784314, 1, 0, 1,
-0.5126569, -0.8547931, -2.551178, 0.2705882, 1, 0, 1,
-0.5039764, -1.185968, -1.985289, 0.2666667, 1, 0, 1,
-0.4991985, -0.5331964, -1.142986, 0.2588235, 1, 0, 1,
-0.4956636, 1.87935, -0.5552796, 0.254902, 1, 0, 1,
-0.4924043, -0.1076611, -0.8761807, 0.2470588, 1, 0, 1,
-0.4888228, 0.3561174, -1.808494, 0.2431373, 1, 0, 1,
-0.4873957, 0.2445313, -2.278078, 0.2352941, 1, 0, 1,
-0.4850975, -1.477616, -1.829866, 0.2313726, 1, 0, 1,
-0.4773494, 0.8393089, -0.7503422, 0.2235294, 1, 0, 1,
-0.4763577, 0.1512654, -2.077306, 0.2196078, 1, 0, 1,
-0.4759453, -0.9873591, -4.666182, 0.2117647, 1, 0, 1,
-0.4747266, 0.2011348, -1.128653, 0.2078431, 1, 0, 1,
-0.4732853, 0.1974147, -0.8563467, 0.2, 1, 0, 1,
-0.4723094, -0.6728374, -2.094079, 0.1921569, 1, 0, 1,
-0.4639342, -2.218786, -4.847081, 0.1882353, 1, 0, 1,
-0.4537604, 0.4413786, -0.6328959, 0.1803922, 1, 0, 1,
-0.4512696, 0.6340247, -1.583195, 0.1764706, 1, 0, 1,
-0.4479062, -0.563318, -3.377664, 0.1686275, 1, 0, 1,
-0.4474369, -0.2732302, -3.346969, 0.1647059, 1, 0, 1,
-0.446055, -0.3252521, -2.232466, 0.1568628, 1, 0, 1,
-0.4430778, -0.1187304, -1.324807, 0.1529412, 1, 0, 1,
-0.4381239, 0.4238764, -0.2991537, 0.145098, 1, 0, 1,
-0.4367754, 0.1618398, -1.749306, 0.1411765, 1, 0, 1,
-0.4365047, -0.1184647, 0.08718352, 0.1333333, 1, 0, 1,
-0.4354094, 1.072528, -0.7877313, 0.1294118, 1, 0, 1,
-0.4348182, -0.294709, -1.972786, 0.1215686, 1, 0, 1,
-0.433663, 0.2376719, -0.6628858, 0.1176471, 1, 0, 1,
-0.433174, -0.32469, -2.413224, 0.1098039, 1, 0, 1,
-0.4294498, 1.222012, -1.457447, 0.1058824, 1, 0, 1,
-0.428169, -1.117359, -3.320338, 0.09803922, 1, 0, 1,
-0.4272816, -1.845568, -2.194777, 0.09019608, 1, 0, 1,
-0.4250312, 0.8070349, -0.6944417, 0.08627451, 1, 0, 1,
-0.4220462, 0.5625858, -1.620038, 0.07843138, 1, 0, 1,
-0.4170012, -1.850353, -0.007756941, 0.07450981, 1, 0, 1,
-0.4149545, 1.469886, 1.292071, 0.06666667, 1, 0, 1,
-0.4126981, -0.331697, -2.261965, 0.0627451, 1, 0, 1,
-0.4122901, -0.03939644, -2.919415, 0.05490196, 1, 0, 1,
-0.4117948, -1.0955, -2.415606, 0.05098039, 1, 0, 1,
-0.4094159, 1.088143, 0.8585891, 0.04313726, 1, 0, 1,
-0.4089294, 0.9282207, 0.6763764, 0.03921569, 1, 0, 1,
-0.4088173, 0.177497, -0.8705356, 0.03137255, 1, 0, 1,
-0.4058234, 0.1382246, -1.791068, 0.02745098, 1, 0, 1,
-0.4016838, -1.966908, -3.977309, 0.01960784, 1, 0, 1,
-0.3981759, 0.136796, -0.2696217, 0.01568628, 1, 0, 1,
-0.3960872, -2.601763, -2.873592, 0.007843138, 1, 0, 1,
-0.3928012, 0.7341049, -1.753816, 0.003921569, 1, 0, 1,
-0.387897, -0.3552589, -1.084218, 0, 1, 0.003921569, 1,
-0.3817796, 1.04414, -0.8217455, 0, 1, 0.01176471, 1,
-0.3778785, 1.461831, 1.761768, 0, 1, 0.01568628, 1,
-0.375872, -0.2764145, -1.533578, 0, 1, 0.02352941, 1,
-0.370994, 1.422037, -0.04862352, 0, 1, 0.02745098, 1,
-0.3691464, -0.6010072, -2.996291, 0, 1, 0.03529412, 1,
-0.3678517, 1.210916, 0.4857271, 0, 1, 0.03921569, 1,
-0.3657457, -2.643048, -1.943832, 0, 1, 0.04705882, 1,
-0.3649548, -0.1010548, -3.207868, 0, 1, 0.05098039, 1,
-0.3622902, -0.2091649, -2.003249, 0, 1, 0.05882353, 1,
-0.3621038, 0.6502352, -0.7754892, 0, 1, 0.0627451, 1,
-0.3590075, 0.1725728, -2.749891, 0, 1, 0.07058824, 1,
-0.3569624, -0.03916184, -2.786667, 0, 1, 0.07450981, 1,
-0.3555855, 0.6363576, -0.03100817, 0, 1, 0.08235294, 1,
-0.35418, 0.1837228, -2.788978, 0, 1, 0.08627451, 1,
-0.34233, 0.2690892, -1.975249, 0, 1, 0.09411765, 1,
-0.337144, 0.2550701, -1.541128, 0, 1, 0.1019608, 1,
-0.3330129, -1.036501, -2.514269, 0, 1, 0.1058824, 1,
-0.3261287, -0.8218977, -3.262253, 0, 1, 0.1137255, 1,
-0.3162324, -0.03720456, -2.898044, 0, 1, 0.1176471, 1,
-0.3087659, 0.7608807, -1.73748, 0, 1, 0.1254902, 1,
-0.3012933, -0.09574191, -2.186403, 0, 1, 0.1294118, 1,
-0.2984748, 0.8951976, -0.2646779, 0, 1, 0.1372549, 1,
-0.2974143, 1.341931, -0.8881882, 0, 1, 0.1411765, 1,
-0.2963296, 0.6824892, -2.607403, 0, 1, 0.1490196, 1,
-0.2939907, 0.6107065, 0.6337126, 0, 1, 0.1529412, 1,
-0.2930597, 0.4180358, -1.445, 0, 1, 0.1607843, 1,
-0.2924581, -0.8746754, -3.50992, 0, 1, 0.1647059, 1,
-0.2870341, 0.82525, 0.6432737, 0, 1, 0.172549, 1,
-0.2843128, -0.7153148, -2.950253, 0, 1, 0.1764706, 1,
-0.2812609, 1.713685, 1.881897, 0, 1, 0.1843137, 1,
-0.2804042, 2.337239, -0.3897697, 0, 1, 0.1882353, 1,
-0.2721146, 1.013036, -0.236517, 0, 1, 0.1960784, 1,
-0.268073, 1.39461, -0.2945167, 0, 1, 0.2039216, 1,
-0.2649197, -0.4900314, -5.650506, 0, 1, 0.2078431, 1,
-0.2625778, 1.027844, 0.3900728, 0, 1, 0.2156863, 1,
-0.2617454, -0.4002641, -2.59112, 0, 1, 0.2196078, 1,
-0.2553727, -0.2245639, -2.740486, 0, 1, 0.227451, 1,
-0.2535442, -1.483261, -4.936112, 0, 1, 0.2313726, 1,
-0.249566, 0.1534858, -1.344494, 0, 1, 0.2392157, 1,
-0.2492293, -0.08681779, -1.980857, 0, 1, 0.2431373, 1,
-0.2483313, -0.8943859, -1.519412, 0, 1, 0.2509804, 1,
-0.2464697, 0.8864306, 0.04069699, 0, 1, 0.254902, 1,
-0.2446979, 1.360527, 0.6845705, 0, 1, 0.2627451, 1,
-0.2426026, -1.780191, -2.448574, 0, 1, 0.2666667, 1,
-0.2352207, 1.91818, 0.1537041, 0, 1, 0.2745098, 1,
-0.2351331, 0.04979265, -1.796378, 0, 1, 0.2784314, 1,
-0.234668, -0.5047503, -3.473825, 0, 1, 0.2862745, 1,
-0.2332587, 0.866854, -1.648369, 0, 1, 0.2901961, 1,
-0.2332229, 0.09660149, -1.995038, 0, 1, 0.2980392, 1,
-0.2291679, -0.2711278, -1.649438, 0, 1, 0.3058824, 1,
-0.2270752, 1.566755, 1.333443, 0, 1, 0.3098039, 1,
-0.2245363, -0.06476344, -1.3144, 0, 1, 0.3176471, 1,
-0.2223196, -0.2777417, -3.501562, 0, 1, 0.3215686, 1,
-0.2204393, 1.183004, -2.150297, 0, 1, 0.3294118, 1,
-0.2190819, -1.625858, -2.563516, 0, 1, 0.3333333, 1,
-0.2163164, 0.1530497, -2.331708, 0, 1, 0.3411765, 1,
-0.2149424, -0.05036364, -2.292659, 0, 1, 0.345098, 1,
-0.2129973, 0.8304, 1.035209, 0, 1, 0.3529412, 1,
-0.2101426, -0.9575929, -3.486369, 0, 1, 0.3568628, 1,
-0.2082637, -0.9880513, -3.100883, 0, 1, 0.3647059, 1,
-0.2036384, -3.226655, -4.812113, 0, 1, 0.3686275, 1,
-0.2033655, -1.303764, -4.796254, 0, 1, 0.3764706, 1,
-0.203292, 1.557422, 0.1094095, 0, 1, 0.3803922, 1,
-0.2020429, 0.6425236, 0.4467537, 0, 1, 0.3882353, 1,
-0.2014289, -0.04004627, -3.62347, 0, 1, 0.3921569, 1,
-0.1985833, 2.114753, 0.173638, 0, 1, 0.4, 1,
-0.1932494, 1.937355, -0.4805423, 0, 1, 0.4078431, 1,
-0.193095, 0.4968798, -0.9472101, 0, 1, 0.4117647, 1,
-0.1917927, 0.4169848, -0.4572254, 0, 1, 0.4196078, 1,
-0.1885779, -0.4655307, -3.084254, 0, 1, 0.4235294, 1,
-0.1848347, -0.3091048, -2.28411, 0, 1, 0.4313726, 1,
-0.1821191, 1.50581, 0.01750401, 0, 1, 0.4352941, 1,
-0.181958, -0.4257141, -2.824318, 0, 1, 0.4431373, 1,
-0.1814167, -0.6592343, -2.871338, 0, 1, 0.4470588, 1,
-0.1762396, 0.1520857, -0.4145751, 0, 1, 0.454902, 1,
-0.1724488, 0.8253964, -0.1327604, 0, 1, 0.4588235, 1,
-0.1721608, 0.813789, -0.9783518, 0, 1, 0.4666667, 1,
-0.1638936, 0.2834277, -0.1524118, 0, 1, 0.4705882, 1,
-0.162123, 0.3199988, -1.41886, 0, 1, 0.4784314, 1,
-0.1604669, 1.660418, 0.4950455, 0, 1, 0.4823529, 1,
-0.160419, 0.1005675, 0.2601501, 0, 1, 0.4901961, 1,
-0.1594943, -0.1510618, 0.605381, 0, 1, 0.4941176, 1,
-0.1562436, 2.884948, 1.448073, 0, 1, 0.5019608, 1,
-0.1542615, -1.495, -3.406328, 0, 1, 0.509804, 1,
-0.151374, 0.3084221, -2.008736, 0, 1, 0.5137255, 1,
-0.1504256, 0.349321, -0.8350619, 0, 1, 0.5215687, 1,
-0.1480198, -0.5795037, -2.619854, 0, 1, 0.5254902, 1,
-0.1437624, 0.2768026, -0.1891915, 0, 1, 0.5333334, 1,
-0.1363006, -0.7823372, -4.434855, 0, 1, 0.5372549, 1,
-0.1354446, -0.4515293, -1.94017, 0, 1, 0.5450981, 1,
-0.1349378, 0.2093011, -1.677006, 0, 1, 0.5490196, 1,
-0.1331731, -0.9962636, -1.202875, 0, 1, 0.5568628, 1,
-0.1329909, -0.701529, -1.987211, 0, 1, 0.5607843, 1,
-0.1322487, 1.010884, 0.5213157, 0, 1, 0.5686275, 1,
-0.131219, 0.4652069, 0.857468, 0, 1, 0.572549, 1,
-0.1273546, -0.3679826, -3.542481, 0, 1, 0.5803922, 1,
-0.1271968, -0.3789066, -3.53802, 0, 1, 0.5843138, 1,
-0.1258875, 0.3003177, -2.124603, 0, 1, 0.5921569, 1,
-0.1234429, -0.6524035, -3.124913, 0, 1, 0.5960785, 1,
-0.1228652, -0.4812209, -2.578195, 0, 1, 0.6039216, 1,
-0.1224141, 0.8363353, -1.830724, 0, 1, 0.6117647, 1,
-0.1219826, -0.7420589, -3.057965, 0, 1, 0.6156863, 1,
-0.1207592, 1.493618, 0.8302693, 0, 1, 0.6235294, 1,
-0.1190361, -0.7316214, -3.105719, 0, 1, 0.627451, 1,
-0.117517, 0.2898907, -0.926873, 0, 1, 0.6352941, 1,
-0.116567, -0.2667416, -3.823479, 0, 1, 0.6392157, 1,
-0.1145117, -0.2470436, -1.661571, 0, 1, 0.6470588, 1,
-0.1097905, -0.2467471, -2.725114, 0, 1, 0.6509804, 1,
-0.1056084, -1.985235, -3.250394, 0, 1, 0.6588235, 1,
-0.1001116, -1.698074, -3.894828, 0, 1, 0.6627451, 1,
-0.09706673, -0.7141379, -1.04315, 0, 1, 0.6705883, 1,
-0.09490614, -0.027789, -2.154104, 0, 1, 0.6745098, 1,
-0.09476697, 1.039759, 0.4222361, 0, 1, 0.682353, 1,
-0.09245762, 0.02357224, -2.686315, 0, 1, 0.6862745, 1,
-0.09221371, 1.408327, 0.1942095, 0, 1, 0.6941177, 1,
-0.09100469, -1.025093, -1.600357, 0, 1, 0.7019608, 1,
-0.08958579, -1.14085, -4.916453, 0, 1, 0.7058824, 1,
-0.08571725, 0.7404962, -2.587107, 0, 1, 0.7137255, 1,
-0.08302482, -0.4339637, -3.238543, 0, 1, 0.7176471, 1,
-0.07609644, 0.7692037, -2.323363, 0, 1, 0.7254902, 1,
-0.07395345, 0.1688112, -1.919449, 0, 1, 0.7294118, 1,
-0.07263997, 0.1429667, -0.9221513, 0, 1, 0.7372549, 1,
-0.0708141, -0.6421455, -3.090325, 0, 1, 0.7411765, 1,
-0.06798817, 0.5810086, 0.9552655, 0, 1, 0.7490196, 1,
-0.06571612, 1.664519, -0.2951699, 0, 1, 0.7529412, 1,
-0.06352839, -0.4437593, -2.63013, 0, 1, 0.7607843, 1,
-0.05934582, 0.6872442, -0.5905712, 0, 1, 0.7647059, 1,
-0.05698419, -0.1297197, -0.9431996, 0, 1, 0.772549, 1,
-0.04991775, 1.405404, -0.6493377, 0, 1, 0.7764706, 1,
-0.04912133, -0.3398453, -3.859095, 0, 1, 0.7843137, 1,
-0.04604981, 0.2532425, -1.382357, 0, 1, 0.7882353, 1,
-0.04590115, 0.6509141, -0.3662131, 0, 1, 0.7960784, 1,
-0.04067472, 1.750968, -0.07913145, 0, 1, 0.8039216, 1,
-0.03861694, -1.049984, -3.990824, 0, 1, 0.8078431, 1,
-0.038134, 0.6961762, 1.037415, 0, 1, 0.8156863, 1,
-0.03759182, -0.3144032, -4.654923, 0, 1, 0.8196079, 1,
-0.036862, 1.038309, -1.172428, 0, 1, 0.827451, 1,
-0.03535142, -1.381243, -2.249602, 0, 1, 0.8313726, 1,
-0.03357991, -0.9370803, -2.064446, 0, 1, 0.8392157, 1,
-0.03136877, 0.9082285, -0.212326, 0, 1, 0.8431373, 1,
-0.03055211, 0.3232279, -0.04190388, 0, 1, 0.8509804, 1,
-0.02606972, 1.763394, -0.01137396, 0, 1, 0.854902, 1,
-0.0229733, 1.224861, 1.372407, 0, 1, 0.8627451, 1,
-0.02002028, 1.032487, -0.1892682, 0, 1, 0.8666667, 1,
-0.01577051, 1.075318, 1.413106, 0, 1, 0.8745098, 1,
-0.01343917, 0.2621526, 1.219786, 0, 1, 0.8784314, 1,
-0.01171912, 0.4544979, 0.3106768, 0, 1, 0.8862745, 1,
-0.01162371, 0.4504051, -0.3228996, 0, 1, 0.8901961, 1,
-0.01124524, 0.983408, 1.544323, 0, 1, 0.8980392, 1,
-0.006561443, 0.6700074, 1.312086, 0, 1, 0.9058824, 1,
-0.002043413, 0.3082504, -0.3401456, 0, 1, 0.9098039, 1,
-6.144413e-05, 0.4544229, 0.2690866, 0, 1, 0.9176471, 1,
0.002796965, 1.190307, 0.3001547, 0, 1, 0.9215686, 1,
0.004199249, -0.07807419, 2.858243, 0, 1, 0.9294118, 1,
0.006860477, -1.919354, 1.206662, 0, 1, 0.9333333, 1,
0.01041326, -1.475241, 3.5104, 0, 1, 0.9411765, 1,
0.01135442, 0.1810879, 1.896907, 0, 1, 0.945098, 1,
0.01679314, 1.076529, 1.546882, 0, 1, 0.9529412, 1,
0.01804972, 2.130651, 0.1977669, 0, 1, 0.9568627, 1,
0.02144195, -0.2611413, 3.735587, 0, 1, 0.9647059, 1,
0.02201991, -0.6639589, 4.188636, 0, 1, 0.9686275, 1,
0.02254211, 0.9994766, -1.428854, 0, 1, 0.9764706, 1,
0.02439224, -1.999595, 3.783647, 0, 1, 0.9803922, 1,
0.02499671, 0.6593748, 0.5649666, 0, 1, 0.9882353, 1,
0.02567763, -0.4609853, 3.567137, 0, 1, 0.9921569, 1,
0.02599348, 1.105824, -0.848132, 0, 1, 1, 1,
0.02888105, 0.5404489, 1.59072, 0, 0.9921569, 1, 1,
0.02909362, -0.1301111, 3.83334, 0, 0.9882353, 1, 1,
0.03372641, 1.422466, 1.170903, 0, 0.9803922, 1, 1,
0.03558745, 0.9564809, 0.8246332, 0, 0.9764706, 1, 1,
0.03823227, 1.850284, 0.3408771, 0, 0.9686275, 1, 1,
0.04131387, -0.8904881, 1.328046, 0, 0.9647059, 1, 1,
0.04431319, -0.4829086, 1.534138, 0, 0.9568627, 1, 1,
0.04628273, 1.000819, 1.560306, 0, 0.9529412, 1, 1,
0.04867354, -1.905047, 4.220556, 0, 0.945098, 1, 1,
0.04942206, 0.7819505, -2.030726, 0, 0.9411765, 1, 1,
0.05260085, -0.5074406, 2.131871, 0, 0.9333333, 1, 1,
0.05488843, 0.06043833, 0.8599364, 0, 0.9294118, 1, 1,
0.05556227, -1.225607, 3.326992, 0, 0.9215686, 1, 1,
0.05600852, 0.7156929, -0.07957756, 0, 0.9176471, 1, 1,
0.05901975, 1.765813, 0.011866, 0, 0.9098039, 1, 1,
0.06152309, 0.7520451, -0.5121269, 0, 0.9058824, 1, 1,
0.06295247, -0.8151971, 1.384917, 0, 0.8980392, 1, 1,
0.06334797, -0.5930846, -0.03404532, 0, 0.8901961, 1, 1,
0.06335672, -1.705848, 1.525858, 0, 0.8862745, 1, 1,
0.06422649, 1.117407, -0.05251795, 0, 0.8784314, 1, 1,
0.06594732, -1.429358, 2.770937, 0, 0.8745098, 1, 1,
0.06859513, 1.056512, 2.456671, 0, 0.8666667, 1, 1,
0.06966265, -0.3695813, 4.690034, 0, 0.8627451, 1, 1,
0.07099649, -0.7408026, 1.666888, 0, 0.854902, 1, 1,
0.071902, 0.2831085, 0.4560505, 0, 0.8509804, 1, 1,
0.07811479, 1.610662, 0.02975635, 0, 0.8431373, 1, 1,
0.07952651, -0.8422824, 2.194266, 0, 0.8392157, 1, 1,
0.08052898, -0.2196288, 3.134019, 0, 0.8313726, 1, 1,
0.08529346, 1.376262, 0.3568473, 0, 0.827451, 1, 1,
0.09219401, 1.235107, -1.219271, 0, 0.8196079, 1, 1,
0.09941859, 0.2324483, 0.2142351, 0, 0.8156863, 1, 1,
0.1014487, 0.844148, 0.6142242, 0, 0.8078431, 1, 1,
0.1034307, 0.9273938, 1.610948, 0, 0.8039216, 1, 1,
0.1047843, 0.3154032, -0.7614543, 0, 0.7960784, 1, 1,
0.1053993, -1.144756, 4.445516, 0, 0.7882353, 1, 1,
0.1057772, -0.04362658, 3.197371, 0, 0.7843137, 1, 1,
0.1073298, -0.3561186, 2.483944, 0, 0.7764706, 1, 1,
0.1085848, -0.06229346, 1.222988, 0, 0.772549, 1, 1,
0.1085929, -0.7345865, 2.805195, 0, 0.7647059, 1, 1,
0.1151192, 1.802728, 1.459843, 0, 0.7607843, 1, 1,
0.115504, 0.7240185, 0.5638805, 0, 0.7529412, 1, 1,
0.1175241, 0.2775169, 0.7809579, 0, 0.7490196, 1, 1,
0.1181585, 0.5837662, 0.3079315, 0, 0.7411765, 1, 1,
0.1184445, 2.165677, -0.2319146, 0, 0.7372549, 1, 1,
0.1188774, 0.6370274, 1.842797, 0, 0.7294118, 1, 1,
0.1292757, -0.9543574, 2.080773, 0, 0.7254902, 1, 1,
0.1331078, 0.9531026, -0.9928236, 0, 0.7176471, 1, 1,
0.1390249, -2.354603, 3.705691, 0, 0.7137255, 1, 1,
0.1409243, 0.5794486, -2.191366, 0, 0.7058824, 1, 1,
0.1419317, 0.1358993, 2.272223, 0, 0.6980392, 1, 1,
0.1447943, -1.304263, 2.720417, 0, 0.6941177, 1, 1,
0.1475556, -0.3657643, 2.527059, 0, 0.6862745, 1, 1,
0.1514238, 0.5076635, 0.4143199, 0, 0.682353, 1, 1,
0.152203, 3.05227, 0.08083344, 0, 0.6745098, 1, 1,
0.1548076, 0.8830889, 0.6555429, 0, 0.6705883, 1, 1,
0.1595222, 0.4326592, 0.4885228, 0, 0.6627451, 1, 1,
0.1608002, -1.324163, 2.990732, 0, 0.6588235, 1, 1,
0.1609507, -1.552988, 1.649185, 0, 0.6509804, 1, 1,
0.1615467, -0.9997922, 3.877732, 0, 0.6470588, 1, 1,
0.1618483, 0.6449863, -0.2241854, 0, 0.6392157, 1, 1,
0.1624499, 0.8341147, 0.4925461, 0, 0.6352941, 1, 1,
0.1633535, 0.2062031, -0.2948204, 0, 0.627451, 1, 1,
0.1669873, 0.6595635, -0.5582567, 0, 0.6235294, 1, 1,
0.1708867, -1.009368, 3.979334, 0, 0.6156863, 1, 1,
0.1785408, 1.869588, 0.9112533, 0, 0.6117647, 1, 1,
0.1793973, -0.8169744, 3.261674, 0, 0.6039216, 1, 1,
0.1815059, 1.290185, 1.27886, 0, 0.5960785, 1, 1,
0.1849442, 1.18064, -0.02597833, 0, 0.5921569, 1, 1,
0.185618, -1.08152, 2.298386, 0, 0.5843138, 1, 1,
0.1864706, 0.03730749, 2.572152, 0, 0.5803922, 1, 1,
0.1880493, -0.7277971, 3.001265, 0, 0.572549, 1, 1,
0.1895169, -1.429455, 3.485232, 0, 0.5686275, 1, 1,
0.191523, -0.4624928, 3.506126, 0, 0.5607843, 1, 1,
0.195747, -2.064415, 2.361564, 0, 0.5568628, 1, 1,
0.2023551, 1.361337, -1.083925, 0, 0.5490196, 1, 1,
0.2026281, 0.6381152, 1.283649, 0, 0.5450981, 1, 1,
0.2161833, 0.01571177, 1.785208, 0, 0.5372549, 1, 1,
0.2163385, 1.425624, 0.5813788, 0, 0.5333334, 1, 1,
0.2164935, 0.2634197, 0.6294534, 0, 0.5254902, 1, 1,
0.2268664, 0.2575096, 0.676241, 0, 0.5215687, 1, 1,
0.2285744, -0.2067868, 2.281353, 0, 0.5137255, 1, 1,
0.2334788, -2.140176, 3.691223, 0, 0.509804, 1, 1,
0.2359485, -1.816546, 3.013583, 0, 0.5019608, 1, 1,
0.2366754, -0.5458587, 3.651725, 0, 0.4941176, 1, 1,
0.2378723, -1.029011, 2.223527, 0, 0.4901961, 1, 1,
0.2381753, 1.217267, -0.8172377, 0, 0.4823529, 1, 1,
0.2390909, -1.40354, 2.576137, 0, 0.4784314, 1, 1,
0.241527, -0.8140852, 2.4171, 0, 0.4705882, 1, 1,
0.2429542, 0.1280484, 0.5562868, 0, 0.4666667, 1, 1,
0.2438002, -0.434929, 3.540056, 0, 0.4588235, 1, 1,
0.2448992, 1.053833, -0.0459249, 0, 0.454902, 1, 1,
0.2462834, -0.07505645, 3.681178, 0, 0.4470588, 1, 1,
0.2476733, 0.9979542, 0.7756323, 0, 0.4431373, 1, 1,
0.2491376, -1.676307, 2.766933, 0, 0.4352941, 1, 1,
0.2496044, -0.4961052, 2.549581, 0, 0.4313726, 1, 1,
0.2512707, -0.07447495, 3.775449, 0, 0.4235294, 1, 1,
0.2519864, 0.8159392, 0.5441203, 0, 0.4196078, 1, 1,
0.2542098, -0.2317011, 2.433816, 0, 0.4117647, 1, 1,
0.2556854, 0.9781438, 1.232319, 0, 0.4078431, 1, 1,
0.2602387, 0.739931, 0.4950705, 0, 0.4, 1, 1,
0.2605927, -0.3474831, 2.385172, 0, 0.3921569, 1, 1,
0.2657218, 2.285991, 0.6627312, 0, 0.3882353, 1, 1,
0.2668208, -0.8317187, 3.266848, 0, 0.3803922, 1, 1,
0.2674953, -0.3969145, 2.488131, 0, 0.3764706, 1, 1,
0.2719821, -0.1893094, 3.406912, 0, 0.3686275, 1, 1,
0.2769722, -0.862828, 2.625841, 0, 0.3647059, 1, 1,
0.2795686, -0.5531796, 1.841317, 0, 0.3568628, 1, 1,
0.2797109, -0.9194577, 2.945243, 0, 0.3529412, 1, 1,
0.2819313, 1.573687, 0.08212198, 0, 0.345098, 1, 1,
0.2869024, -0.365173, 2.038031, 0, 0.3411765, 1, 1,
0.2875526, -0.7102519, 2.826806, 0, 0.3333333, 1, 1,
0.289841, 0.2839023, -0.6025587, 0, 0.3294118, 1, 1,
0.2898783, -0.0895358, -0.2263534, 0, 0.3215686, 1, 1,
0.2904387, -0.6696506, 3.683481, 0, 0.3176471, 1, 1,
0.2930076, 0.5054701, 0.4452332, 0, 0.3098039, 1, 1,
0.2931413, -1.386786, 2.295808, 0, 0.3058824, 1, 1,
0.2973896, -0.9523224, 2.481538, 0, 0.2980392, 1, 1,
0.298715, -0.2339915, 1.359011, 0, 0.2901961, 1, 1,
0.2996487, -0.9496008, 2.999386, 0, 0.2862745, 1, 1,
0.2997791, -2.466753, 3.219255, 0, 0.2784314, 1, 1,
0.299855, -0.2185687, 0.1993414, 0, 0.2745098, 1, 1,
0.3012953, 1.01931, 2.35535, 0, 0.2666667, 1, 1,
0.303993, -1.128715, 2.828496, 0, 0.2627451, 1, 1,
0.3086529, 1.15602, 1.714885, 0, 0.254902, 1, 1,
0.3121915, -0.476381, 2.795362, 0, 0.2509804, 1, 1,
0.3168629, -2.319323, 5.149443, 0, 0.2431373, 1, 1,
0.3168741, -0.2455925, 2.34331, 0, 0.2392157, 1, 1,
0.3194432, 1.049779, 0.9568324, 0, 0.2313726, 1, 1,
0.3198365, 0.6716322, -0.4331176, 0, 0.227451, 1, 1,
0.3217911, -0.2421178, 1.41666, 0, 0.2196078, 1, 1,
0.3229321, 0.7785508, -1.565973, 0, 0.2156863, 1, 1,
0.3287758, 1.210611, -0.8169916, 0, 0.2078431, 1, 1,
0.3313027, -2.32897, 3.658822, 0, 0.2039216, 1, 1,
0.3319772, -0.9158139, 2.401148, 0, 0.1960784, 1, 1,
0.3351283, -0.2686186, 2.96331, 0, 0.1882353, 1, 1,
0.3356945, 0.08040724, 0.5987568, 0, 0.1843137, 1, 1,
0.34652, -1.049657, 3.636765, 0, 0.1764706, 1, 1,
0.3488284, -0.07676902, 0.2281102, 0, 0.172549, 1, 1,
0.3516413, -1.211321, 1.026764, 0, 0.1647059, 1, 1,
0.3582338, -0.1388808, 1.383848, 0, 0.1607843, 1, 1,
0.358961, 1.145306, 0.9291642, 0, 0.1529412, 1, 1,
0.3613808, 0.3891341, 1.110038, 0, 0.1490196, 1, 1,
0.3690031, 0.7901805, 0.6952991, 0, 0.1411765, 1, 1,
0.3756563, 1.11711, -0.2613168, 0, 0.1372549, 1, 1,
0.3771873, 0.8842402, 1.348258, 0, 0.1294118, 1, 1,
0.3808641, 1.487837, -0.5161097, 0, 0.1254902, 1, 1,
0.3828009, 1.279749, 0.1478499, 0, 0.1176471, 1, 1,
0.3837459, -0.4636382, 0.6792787, 0, 0.1137255, 1, 1,
0.384322, -2.470679, 3.539501, 0, 0.1058824, 1, 1,
0.3844724, -0.5555244, 1.509796, 0, 0.09803922, 1, 1,
0.3852954, 0.9624349, -0.2559159, 0, 0.09411765, 1, 1,
0.3879661, -0.8352798, 3.720219, 0, 0.08627451, 1, 1,
0.3927876, 0.1101034, 0.3863379, 0, 0.08235294, 1, 1,
0.3958864, 0.5368093, 0.04624042, 0, 0.07450981, 1, 1,
0.39693, -0.7554826, 1.739204, 0, 0.07058824, 1, 1,
0.3988479, -1.076935, 2.415222, 0, 0.0627451, 1, 1,
0.4010702, 0.05572382, 1.245628, 0, 0.05882353, 1, 1,
0.4134556, -0.7481129, 2.347324, 0, 0.05098039, 1, 1,
0.4145161, 0.1148248, 0.7116753, 0, 0.04705882, 1, 1,
0.4153279, 0.4117323, 1.479655, 0, 0.03921569, 1, 1,
0.4196582, 0.00950386, 1.281758, 0, 0.03529412, 1, 1,
0.4197781, -0.883404, 3.37435, 0, 0.02745098, 1, 1,
0.4215673, 0.6850664, 1.175175, 0, 0.02352941, 1, 1,
0.4244047, 0.3218934, 0.004857324, 0, 0.01568628, 1, 1,
0.4244252, 1.191702, 0.02313172, 0, 0.01176471, 1, 1,
0.4252554, 1.494079, -1.47623, 0, 0.003921569, 1, 1,
0.4291741, -0.4201035, 0.2201502, 0.003921569, 0, 1, 1,
0.4311086, -1.257152, 1.865354, 0.007843138, 0, 1, 1,
0.4345908, 0.5843707, 1.241806, 0.01568628, 0, 1, 1,
0.4374991, -0.9377157, 2.298696, 0.01960784, 0, 1, 1,
0.4401747, -1.083756, 1.921706, 0.02745098, 0, 1, 1,
0.4422628, -0.1696593, 2.921623, 0.03137255, 0, 1, 1,
0.4429511, 0.004667099, 2.447911, 0.03921569, 0, 1, 1,
0.445533, -1.092788, 4.05511, 0.04313726, 0, 1, 1,
0.4457374, -0.03076315, 2.174966, 0.05098039, 0, 1, 1,
0.4484579, -1.089422, 2.7091, 0.05490196, 0, 1, 1,
0.448794, -1.420816, 2.520627, 0.0627451, 0, 1, 1,
0.4519762, 0.9734507, -1.255833, 0.06666667, 0, 1, 1,
0.4570091, 0.5542693, 1.043126, 0.07450981, 0, 1, 1,
0.4573704, 0.8702653, 0.07914685, 0.07843138, 0, 1, 1,
0.4589025, -1.240027, 1.794593, 0.08627451, 0, 1, 1,
0.4599883, 1.801314, -0.5372477, 0.09019608, 0, 1, 1,
0.4638844, -0.7708651, 3.132016, 0.09803922, 0, 1, 1,
0.4653285, 2.63604, -0.05998385, 0.1058824, 0, 1, 1,
0.4674292, -1.793101, 2.519537, 0.1098039, 0, 1, 1,
0.4696513, 0.02098311, 1.771009, 0.1176471, 0, 1, 1,
0.4703422, -0.05704189, 0.9470965, 0.1215686, 0, 1, 1,
0.4738555, 0.6302455, -0.4385763, 0.1294118, 0, 1, 1,
0.4755924, 0.2419121, -1.577843, 0.1333333, 0, 1, 1,
0.4759092, 0.3989024, 1.585125, 0.1411765, 0, 1, 1,
0.4787399, 2.821829, 0.8044805, 0.145098, 0, 1, 1,
0.4801069, 0.6143417, 2.360606, 0.1529412, 0, 1, 1,
0.4851166, -1.061408, 1.917667, 0.1568628, 0, 1, 1,
0.4888885, 1.027146, 1.834286, 0.1647059, 0, 1, 1,
0.4919659, 0.9593263, -0.1522255, 0.1686275, 0, 1, 1,
0.4924962, -0.2796903, 0.7804731, 0.1764706, 0, 1, 1,
0.4948166, 1.65977, 0.4281172, 0.1803922, 0, 1, 1,
0.4981693, 0.5170416, 1.453699, 0.1882353, 0, 1, 1,
0.5066534, 0.4994568, -0.4012938, 0.1921569, 0, 1, 1,
0.5076306, -2.282053, 2.294375, 0.2, 0, 1, 1,
0.5084045, 0.5999612, -0.7928607, 0.2078431, 0, 1, 1,
0.5102276, -0.6701077, 2.986243, 0.2117647, 0, 1, 1,
0.5176409, 0.5002548, 2.321737, 0.2196078, 0, 1, 1,
0.5217524, -1.671611, 2.023811, 0.2235294, 0, 1, 1,
0.5233093, 0.162053, 0.3564304, 0.2313726, 0, 1, 1,
0.5237517, -0.9726736, 2.110577, 0.2352941, 0, 1, 1,
0.5244949, -0.7170715, 3.390203, 0.2431373, 0, 1, 1,
0.5270653, -1.30682, 2.811503, 0.2470588, 0, 1, 1,
0.5427595, 1.607156, -0.02022423, 0.254902, 0, 1, 1,
0.5447206, 0.5040137, 1.160317, 0.2588235, 0, 1, 1,
0.553208, 0.5526097, -0.9037463, 0.2666667, 0, 1, 1,
0.5581764, 0.6805654, 0.8195044, 0.2705882, 0, 1, 1,
0.5631824, -0.2822095, 2.243277, 0.2784314, 0, 1, 1,
0.5651336, -0.1030073, 1.98068, 0.282353, 0, 1, 1,
0.5655201, 0.3787681, 2.277982, 0.2901961, 0, 1, 1,
0.567562, 1.738795, 1.416945, 0.2941177, 0, 1, 1,
0.5684579, -0.3753122, 1.527117, 0.3019608, 0, 1, 1,
0.5713699, -0.1222834, 1.470419, 0.3098039, 0, 1, 1,
0.5723483, -0.1319329, 1.395566, 0.3137255, 0, 1, 1,
0.5729504, -0.8144048, 2.241726, 0.3215686, 0, 1, 1,
0.5823563, -0.2761389, 1.102962, 0.3254902, 0, 1, 1,
0.5855806, -0.4934436, 2.288108, 0.3333333, 0, 1, 1,
0.5866271, -1.916206, 1.58653, 0.3372549, 0, 1, 1,
0.5932951, 0.5531188, 1.489551, 0.345098, 0, 1, 1,
0.5946756, 1.213466, 0.941763, 0.3490196, 0, 1, 1,
0.5974421, -1.166548, 3.151305, 0.3568628, 0, 1, 1,
0.5989414, 1.297938, 2.182976, 0.3607843, 0, 1, 1,
0.6045022, -1.68814, 2.146298, 0.3686275, 0, 1, 1,
0.6052895, 0.05678989, 2.558674, 0.372549, 0, 1, 1,
0.6081141, -1.576736, 2.760073, 0.3803922, 0, 1, 1,
0.6087053, 0.1024838, 1.644757, 0.3843137, 0, 1, 1,
0.6087777, -1.083156, 2.35009, 0.3921569, 0, 1, 1,
0.6099278, -0.3388216, 2.242968, 0.3960784, 0, 1, 1,
0.6126596, -1.764614, 3.568185, 0.4039216, 0, 1, 1,
0.6160831, -0.4983092, 2.193416, 0.4117647, 0, 1, 1,
0.6167991, 0.6982136, 1.655783, 0.4156863, 0, 1, 1,
0.617599, 0.5252676, 2.000428, 0.4235294, 0, 1, 1,
0.6212687, 0.3938257, 2.972129, 0.427451, 0, 1, 1,
0.6302479, -0.2670371, 1.367983, 0.4352941, 0, 1, 1,
0.6304402, -0.07303368, 0.5238637, 0.4392157, 0, 1, 1,
0.6442501, -0.8626352, 1.793364, 0.4470588, 0, 1, 1,
0.6540855, 0.6869583, 1.171027, 0.4509804, 0, 1, 1,
0.6566287, 0.2802018, -0.5328766, 0.4588235, 0, 1, 1,
0.6603888, -1.577404, 0.8999084, 0.4627451, 0, 1, 1,
0.6629543, 1.536345, 1.535215, 0.4705882, 0, 1, 1,
0.6682386, 0.7392176, 0.8192267, 0.4745098, 0, 1, 1,
0.6685365, 0.5312252, 1.630877, 0.4823529, 0, 1, 1,
0.670015, -0.006506898, 3.618271, 0.4862745, 0, 1, 1,
0.6746061, 1.029944, 0.439305, 0.4941176, 0, 1, 1,
0.6759266, 1.147233, -0.0171026, 0.5019608, 0, 1, 1,
0.6771377, 0.4933075, 0.3068649, 0.5058824, 0, 1, 1,
0.6802611, -0.9760372, 0.5060067, 0.5137255, 0, 1, 1,
0.6803192, 0.8399554, -0.5172395, 0.5176471, 0, 1, 1,
0.6815699, -0.5486974, 2.310549, 0.5254902, 0, 1, 1,
0.6895905, -0.4994336, 2.656689, 0.5294118, 0, 1, 1,
0.7003914, -1.276499, 2.015738, 0.5372549, 0, 1, 1,
0.7053306, 0.3612485, 1.734586, 0.5411765, 0, 1, 1,
0.7059788, 0.2757044, 0.6999109, 0.5490196, 0, 1, 1,
0.7065645, -1.675437, 3.666589, 0.5529412, 0, 1, 1,
0.7086067, -0.2139995, 0.3544722, 0.5607843, 0, 1, 1,
0.7093732, -0.7608113, 0.9683186, 0.5647059, 0, 1, 1,
0.7158259, -1.005078, 3.49706, 0.572549, 0, 1, 1,
0.7161905, 0.7598921, 3.928771, 0.5764706, 0, 1, 1,
0.7202401, -0.8566581, 1.69231, 0.5843138, 0, 1, 1,
0.7212388, -2.916076, 3.579021, 0.5882353, 0, 1, 1,
0.7221993, -0.3527352, 1.696147, 0.5960785, 0, 1, 1,
0.7226674, 1.242526, -0.9858141, 0.6039216, 0, 1, 1,
0.723083, -0.6274866, 3.010831, 0.6078432, 0, 1, 1,
0.7238489, -1.348541, 2.377174, 0.6156863, 0, 1, 1,
0.7272978, -0.1498638, 2.309378, 0.6196079, 0, 1, 1,
0.7274247, -0.851687, 1.348572, 0.627451, 0, 1, 1,
0.7291341, 0.0101679, 0.1487566, 0.6313726, 0, 1, 1,
0.7375777, -1.387123, 3.712906, 0.6392157, 0, 1, 1,
0.7478565, 0.8160331, 0.2166838, 0.6431373, 0, 1, 1,
0.7512121, -1.711558, 2.688542, 0.6509804, 0, 1, 1,
0.7519706, -1.519886, 3.25803, 0.654902, 0, 1, 1,
0.7529092, 0.4352119, -0.6332122, 0.6627451, 0, 1, 1,
0.7595513, -0.6997216, 1.872603, 0.6666667, 0, 1, 1,
0.7619755, 0.4295111, 1.581305, 0.6745098, 0, 1, 1,
0.7638478, 0.6106533, 2.71107, 0.6784314, 0, 1, 1,
0.7688375, 0.4192195, 2.289384, 0.6862745, 0, 1, 1,
0.7696692, 0.6001303, 1.455588, 0.6901961, 0, 1, 1,
0.773025, -0.1260606, 2.400538, 0.6980392, 0, 1, 1,
0.7785364, 2.461837, 0.4852799, 0.7058824, 0, 1, 1,
0.7827439, 0.2074227, 1.322247, 0.7098039, 0, 1, 1,
0.783677, -0.6328186, 2.396019, 0.7176471, 0, 1, 1,
0.7921292, 0.864032, 0.1660211, 0.7215686, 0, 1, 1,
0.7949561, -0.6054363, 3.221118, 0.7294118, 0, 1, 1,
0.8024929, -0.147236, 2.240925, 0.7333333, 0, 1, 1,
0.8055267, -0.9165146, 2.272096, 0.7411765, 0, 1, 1,
0.8057608, -0.406689, 1.460467, 0.7450981, 0, 1, 1,
0.8072231, 1.536597, 1.475137, 0.7529412, 0, 1, 1,
0.8074311, 0.9322703, -0.3519714, 0.7568628, 0, 1, 1,
0.8093635, -2.022447, 2.730167, 0.7647059, 0, 1, 1,
0.8112113, -0.3245743, 1.368381, 0.7686275, 0, 1, 1,
0.8115641, 0.2979726, 0.2693472, 0.7764706, 0, 1, 1,
0.814794, 1.339929, 1.759701, 0.7803922, 0, 1, 1,
0.8168287, 0.8482649, 1.077005, 0.7882353, 0, 1, 1,
0.8199802, 0.4315519, 0.5670967, 0.7921569, 0, 1, 1,
0.8226729, -0.09186579, 3.405792, 0.8, 0, 1, 1,
0.8279732, -0.7639405, 1.393773, 0.8078431, 0, 1, 1,
0.829343, 0.4234402, 1.152664, 0.8117647, 0, 1, 1,
0.8382466, 0.07518324, 1.851369, 0.8196079, 0, 1, 1,
0.8419784, -0.5074741, 2.134636, 0.8235294, 0, 1, 1,
0.8426306, 0.1419355, 0.1077338, 0.8313726, 0, 1, 1,
0.8488866, -1.767307, 2.212746, 0.8352941, 0, 1, 1,
0.8608963, -0.578663, 2.487394, 0.8431373, 0, 1, 1,
0.8614315, -0.8178139, 1.961266, 0.8470588, 0, 1, 1,
0.868224, -0.5763306, 4.408406, 0.854902, 0, 1, 1,
0.8711219, 0.958432, 0.3343287, 0.8588235, 0, 1, 1,
0.8738685, -1.455814, 3.876165, 0.8666667, 0, 1, 1,
0.886371, 0.4488907, 0.4471192, 0.8705882, 0, 1, 1,
0.8909427, -0.8764915, 3.665755, 0.8784314, 0, 1, 1,
0.8991562, -0.6671696, 2.288507, 0.8823529, 0, 1, 1,
0.8993362, 0.04354709, 0.6591576, 0.8901961, 0, 1, 1,
0.9026018, -1.344362, 4.218458, 0.8941177, 0, 1, 1,
0.9036548, 1.315452, 0.727764, 0.9019608, 0, 1, 1,
0.9038142, 2.330131, -1.121902, 0.9098039, 0, 1, 1,
0.9194036, 0.7530743, -0.3772263, 0.9137255, 0, 1, 1,
0.9196613, -0.4827736, 0.6343054, 0.9215686, 0, 1, 1,
0.9257347, 1.395753, 2.328205, 0.9254902, 0, 1, 1,
0.9292288, 0.6523424, 3.227886, 0.9333333, 0, 1, 1,
0.9314299, -0.3040563, 2.021857, 0.9372549, 0, 1, 1,
0.9365281, -0.9525874, 1.909982, 0.945098, 0, 1, 1,
0.9404861, -0.736057, 2.385177, 0.9490196, 0, 1, 1,
0.947701, 0.07282506, 1.690413, 0.9568627, 0, 1, 1,
0.9480476, 0.2400419, 1.099694, 0.9607843, 0, 1, 1,
0.9535394, 0.01500903, 1.926138, 0.9686275, 0, 1, 1,
0.9549905, -1.561231, 1.516098, 0.972549, 0, 1, 1,
0.9558688, -1.146573, 1.764193, 0.9803922, 0, 1, 1,
0.9574751, -0.5041444, 1.743825, 0.9843137, 0, 1, 1,
0.961468, -0.1888415, 2.461692, 0.9921569, 0, 1, 1,
0.9618365, 0.9428489, 0.5642153, 0.9960784, 0, 1, 1,
0.9633111, 0.832912, 0.7249, 1, 0, 0.9960784, 1,
0.9692869, -1.888595, 1.702281, 1, 0, 0.9882353, 1,
0.9835787, 1.863082, 0.2627322, 1, 0, 0.9843137, 1,
0.9853811, -0.4314163, 1.351724, 1, 0, 0.9764706, 1,
0.9882951, -0.669522, 2.283923, 1, 0, 0.972549, 1,
0.9895521, -0.3937834, 0.5870319, 1, 0, 0.9647059, 1,
1.020555, -1.026722, 2.741989, 1, 0, 0.9607843, 1,
1.023586, -0.4368946, 1.764632, 1, 0, 0.9529412, 1,
1.024263, -1.844482, 3.325822, 1, 0, 0.9490196, 1,
1.02657, -0.7423136, 1.809766, 1, 0, 0.9411765, 1,
1.036688, -0.3719689, 1.438831, 1, 0, 0.9372549, 1,
1.042966, 0.7986761, 3.339564, 1, 0, 0.9294118, 1,
1.046667, -1.47462, 1.933675, 1, 0, 0.9254902, 1,
1.051856, 0.147512, 3.165401, 1, 0, 0.9176471, 1,
1.056421, 1.138797, 1.271927, 1, 0, 0.9137255, 1,
1.056433, -0.4761536, 2.027073, 1, 0, 0.9058824, 1,
1.057609, 0.576369, 3.475815, 1, 0, 0.9019608, 1,
1.058468, -0.6969584, 2.251544, 1, 0, 0.8941177, 1,
1.058876, 0.2329059, 0.1796803, 1, 0, 0.8862745, 1,
1.060158, 0.333106, 2.426121, 1, 0, 0.8823529, 1,
1.063658, -1.811475, 1.615545, 1, 0, 0.8745098, 1,
1.065119, 0.1264223, 0.6960923, 1, 0, 0.8705882, 1,
1.068342, 1.888644, 0.7847601, 1, 0, 0.8627451, 1,
1.073079, -0.5662741, 3.040756, 1, 0, 0.8588235, 1,
1.076709, 2.535617, -1.8251, 1, 0, 0.8509804, 1,
1.083683, -0.2444647, 1.737119, 1, 0, 0.8470588, 1,
1.088412, -0.7409033, 1.555524, 1, 0, 0.8392157, 1,
1.089127, 0.2384394, 1.849279, 1, 0, 0.8352941, 1,
1.090731, 0.1934485, 1.023039, 1, 0, 0.827451, 1,
1.093069, -1.126753, 2.893962, 1, 0, 0.8235294, 1,
1.094835, -0.4799353, 2.394997, 1, 0, 0.8156863, 1,
1.106721, 1.329853, 1.145444, 1, 0, 0.8117647, 1,
1.109891, 1.620929, -0.8692713, 1, 0, 0.8039216, 1,
1.110164, -0.5379649, 3.217736, 1, 0, 0.7960784, 1,
1.112886, 0.9989179, 0.985581, 1, 0, 0.7921569, 1,
1.12019, -0.1666014, -0.5544357, 1, 0, 0.7843137, 1,
1.122342, 0.6745676, 2.829205, 1, 0, 0.7803922, 1,
1.122592, 1.186828, 1.450626, 1, 0, 0.772549, 1,
1.126428, -1.158901, 3.728506, 1, 0, 0.7686275, 1,
1.130743, 0.0271462, 1.107775, 1, 0, 0.7607843, 1,
1.13496, 0.695958, 0.6330066, 1, 0, 0.7568628, 1,
1.136239, -0.787245, 2.713791, 1, 0, 0.7490196, 1,
1.138543, 1.162896, 1.339308, 1, 0, 0.7450981, 1,
1.14981, 0.4416421, 1.831942, 1, 0, 0.7372549, 1,
1.152085, 1.605117, 0.5913411, 1, 0, 0.7333333, 1,
1.153573, 0.7965445, 0.6434984, 1, 0, 0.7254902, 1,
1.154185, 0.06547146, 0.5347904, 1, 0, 0.7215686, 1,
1.16435, -0.4588135, -0.7641096, 1, 0, 0.7137255, 1,
1.170693, -0.2503504, -0.4861587, 1, 0, 0.7098039, 1,
1.171932, 0.6468225, 0.779855, 1, 0, 0.7019608, 1,
1.182165, -1.129528, 2.290511, 1, 0, 0.6941177, 1,
1.188994, 0.06051839, 1.544019, 1, 0, 0.6901961, 1,
1.189226, 2.800539, 0.643832, 1, 0, 0.682353, 1,
1.195362, -0.3411904, 0.6813438, 1, 0, 0.6784314, 1,
1.201609, 0.7945046, 2.06723, 1, 0, 0.6705883, 1,
1.202605, -0.240064, 1.934983, 1, 0, 0.6666667, 1,
1.205447, -0.603606, 2.60187, 1, 0, 0.6588235, 1,
1.206602, 0.4388867, 0.07779311, 1, 0, 0.654902, 1,
1.208038, 0.1820311, 1.207808, 1, 0, 0.6470588, 1,
1.217128, 0.2304334, 2.007319, 1, 0, 0.6431373, 1,
1.218415, 0.6005013, 1.361777, 1, 0, 0.6352941, 1,
1.221071, -0.05187994, 0.3635306, 1, 0, 0.6313726, 1,
1.227497, -0.6815644, 3.043396, 1, 0, 0.6235294, 1,
1.232952, -0.6466808, 1.342162, 1, 0, 0.6196079, 1,
1.237895, 1.811489, 0.3019336, 1, 0, 0.6117647, 1,
1.238625, -1.578256, 2.198208, 1, 0, 0.6078432, 1,
1.239381, -1.049963, 1.828338, 1, 0, 0.6, 1,
1.249227, 0.8045078, 1.811061, 1, 0, 0.5921569, 1,
1.250178, -1.017554, -0.2785652, 1, 0, 0.5882353, 1,
1.257534, 1.306181, 1.463707, 1, 0, 0.5803922, 1,
1.257838, -0.4852082, 3.125996, 1, 0, 0.5764706, 1,
1.269824, 1.742856, 0.7311399, 1, 0, 0.5686275, 1,
1.270212, -1.234106, 2.747874, 1, 0, 0.5647059, 1,
1.277725, 2.021557, 1.491255, 1, 0, 0.5568628, 1,
1.294749, -1.183694, 3.118691, 1, 0, 0.5529412, 1,
1.299429, -0.5476328, 2.06834, 1, 0, 0.5450981, 1,
1.3013, -0.8064712, 2.209533, 1, 0, 0.5411765, 1,
1.316575, -1.380346, 2.534502, 1, 0, 0.5333334, 1,
1.318785, 0.8160592, 0.8871464, 1, 0, 0.5294118, 1,
1.319025, -1.585252, -0.1005347, 1, 0, 0.5215687, 1,
1.320956, 0.7093933, 0.08253105, 1, 0, 0.5176471, 1,
1.323549, -0.8505252, 2.398873, 1, 0, 0.509804, 1,
1.339571, -0.06237737, 1.124345, 1, 0, 0.5058824, 1,
1.359651, -0.7491964, 0.8331097, 1, 0, 0.4980392, 1,
1.360002, 1.398092, -1.103189, 1, 0, 0.4901961, 1,
1.363363, -0.02157976, 1.026383, 1, 0, 0.4862745, 1,
1.364604, -0.1077094, 0.5773697, 1, 0, 0.4784314, 1,
1.366089, 0.4540026, -0.5198443, 1, 0, 0.4745098, 1,
1.420769, 0.3968075, -0.4374391, 1, 0, 0.4666667, 1,
1.42264, 0.8614903, 0.3305006, 1, 0, 0.4627451, 1,
1.437153, -0.2498233, 0.2241159, 1, 0, 0.454902, 1,
1.438698, 0.6663569, 0.7893179, 1, 0, 0.4509804, 1,
1.439458, -1.52946, 4.135555, 1, 0, 0.4431373, 1,
1.448592, 1.795288, 0.01440347, 1, 0, 0.4392157, 1,
1.451952, 0.6074525, 0.1273696, 1, 0, 0.4313726, 1,
1.45682, 0.4140711, 1.718913, 1, 0, 0.427451, 1,
1.480045, -1.533865, 4.119626, 1, 0, 0.4196078, 1,
1.485697, 1.93097, 2.158659, 1, 0, 0.4156863, 1,
1.491002, -1.739706, 1.907648, 1, 0, 0.4078431, 1,
1.492262, 0.2052073, 1.4509, 1, 0, 0.4039216, 1,
1.498434, -1.956762, 2.441195, 1, 0, 0.3960784, 1,
1.505341, 0.6557822, 1.219797, 1, 0, 0.3882353, 1,
1.522304, 1.308573, 2.31942, 1, 0, 0.3843137, 1,
1.531642, 0.4597907, 2.323846, 1, 0, 0.3764706, 1,
1.542143, 0.7007784, 0.2200596, 1, 0, 0.372549, 1,
1.55507, 0.4800074, 1.662009, 1, 0, 0.3647059, 1,
1.560432, -0.1954492, 2.418077, 1, 0, 0.3607843, 1,
1.569139, -0.2982377, 2.205133, 1, 0, 0.3529412, 1,
1.581076, 0.3218563, 2.705401, 1, 0, 0.3490196, 1,
1.586965, -1.93519, 3.244827, 1, 0, 0.3411765, 1,
1.590779, 1.931268, 2.359764, 1, 0, 0.3372549, 1,
1.630124, 0.6508567, 1.713419, 1, 0, 0.3294118, 1,
1.633623, -1.520182, 3.336251, 1, 0, 0.3254902, 1,
1.645671, 0.2818061, 1.65404, 1, 0, 0.3176471, 1,
1.648857, 0.7500854, 0.9151708, 1, 0, 0.3137255, 1,
1.664193, -0.3986995, 1.297372, 1, 0, 0.3058824, 1,
1.666375, 1.695974, 3.044607, 1, 0, 0.2980392, 1,
1.666666, -1.182984, 2.002949, 1, 0, 0.2941177, 1,
1.667613, 0.4559497, 0.6457893, 1, 0, 0.2862745, 1,
1.674774, 0.2917731, 2.067117, 1, 0, 0.282353, 1,
1.686155, -1.098598, 0.07679369, 1, 0, 0.2745098, 1,
1.702805, -0.4070407, 2.871069, 1, 0, 0.2705882, 1,
1.723638, 0.8929848, 1.231173, 1, 0, 0.2627451, 1,
1.730264, -0.2686951, -0.0928252, 1, 0, 0.2588235, 1,
1.740873, 1.390243, 0.6396933, 1, 0, 0.2509804, 1,
1.749506, 1.566048, 0.4213988, 1, 0, 0.2470588, 1,
1.74969, 0.2360877, 2.438253, 1, 0, 0.2392157, 1,
1.75384, -0.7249806, 0.997783, 1, 0, 0.2352941, 1,
1.759849, 0.791459, 2.141244, 1, 0, 0.227451, 1,
1.778073, -1.357155, 2.209008, 1, 0, 0.2235294, 1,
1.791575, 1.486555, 1.101324, 1, 0, 0.2156863, 1,
1.851763, -0.6515708, 0.9024938, 1, 0, 0.2117647, 1,
1.854453, -1.699521, 0.6787866, 1, 0, 0.2039216, 1,
1.861987, 1.358916, 1.450227, 1, 0, 0.1960784, 1,
1.880187, 0.2969438, 2.413414, 1, 0, 0.1921569, 1,
1.88145, 0.05738525, 1.945778, 1, 0, 0.1843137, 1,
1.893819, 0.7561129, 1.531568, 1, 0, 0.1803922, 1,
1.913581, 0.2653986, 1.944279, 1, 0, 0.172549, 1,
1.926633, 0.3703197, 3.348702, 1, 0, 0.1686275, 1,
1.936212, -1.829901, 2.592636, 1, 0, 0.1607843, 1,
1.949986, 0.842815, 1.896014, 1, 0, 0.1568628, 1,
1.953252, 0.3963919, 0.7541535, 1, 0, 0.1490196, 1,
1.955804, -0.7432117, 2.200389, 1, 0, 0.145098, 1,
1.965638, -0.08804747, 0.5811734, 1, 0, 0.1372549, 1,
1.96915, -0.01551533, 1.909986, 1, 0, 0.1333333, 1,
1.982099, 1.04924, 1.726523, 1, 0, 0.1254902, 1,
1.988284, 1.155325, 2.793932, 1, 0, 0.1215686, 1,
2.010386, 1.193563, 0.1694191, 1, 0, 0.1137255, 1,
2.039457, -0.3577326, 1.154951, 1, 0, 0.1098039, 1,
2.061148, 0.6025428, 2.375256, 1, 0, 0.1019608, 1,
2.094705, -0.8232563, 3.399279, 1, 0, 0.09411765, 1,
2.111218, -0.264341, 2.865466, 1, 0, 0.09019608, 1,
2.133563, 1.422988, 0.9145763, 1, 0, 0.08235294, 1,
2.182295, -2.138078, 0.9199335, 1, 0, 0.07843138, 1,
2.206213, -0.761948, 1.669116, 1, 0, 0.07058824, 1,
2.269892, 0.8313414, 2.309453, 1, 0, 0.06666667, 1,
2.288842, 0.03800476, 1.87956, 1, 0, 0.05882353, 1,
2.351546, -0.2083562, 0.5459152, 1, 0, 0.05490196, 1,
2.353402, -0.7480962, 1.992305, 1, 0, 0.04705882, 1,
2.378285, 0.3681088, 2.053951, 1, 0, 0.04313726, 1,
2.413239, 0.04702028, 2.745053, 1, 0, 0.03529412, 1,
2.482477, 0.3155962, 2.4977, 1, 0, 0.03137255, 1,
2.573402, 0.07983147, -1.099182, 1, 0, 0.02352941, 1,
2.831772, 0.1720416, 2.716153, 1, 0, 0.01960784, 1,
2.889506, 2.249024, 0.7036083, 1, 0, 0.01176471, 1,
3.018083, -0.1747663, -0.5550799, 1, 0, 0.007843138, 1
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
-0.4811275, -4.360088, -7.481097, 0, -0.5, 0.5, 0.5,
-0.4811275, -4.360088, -7.481097, 1, -0.5, 0.5, 0.5,
-0.4811275, -4.360088, -7.481097, 1, 1.5, 0.5, 0.5,
-0.4811275, -4.360088, -7.481097, 0, 1.5, 0.5, 0.5
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
-5.166571, -0.1167589, -7.481097, 0, -0.5, 0.5, 0.5,
-5.166571, -0.1167589, -7.481097, 1, -0.5, 0.5, 0.5,
-5.166571, -0.1167589, -7.481097, 1, 1.5, 0.5, 0.5,
-5.166571, -0.1167589, -7.481097, 0, 1.5, 0.5, 0.5
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
-5.166571, -4.360088, -0.2505314, 0, -0.5, 0.5, 0.5,
-5.166571, -4.360088, -0.2505314, 1, -0.5, 0.5, 0.5,
-5.166571, -4.360088, -0.2505314, 1, 1.5, 0.5, 0.5,
-5.166571, -4.360088, -0.2505314, 0, 1.5, 0.5, 0.5
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
-3, -3.380858, -5.812505,
3, -3.380858, -5.812505,
-3, -3.380858, -5.812505,
-3, -3.544063, -6.090604,
-2, -3.380858, -5.812505,
-2, -3.544063, -6.090604,
-1, -3.380858, -5.812505,
-1, -3.544063, -6.090604,
0, -3.380858, -5.812505,
0, -3.544063, -6.090604,
1, -3.380858, -5.812505,
1, -3.544063, -6.090604,
2, -3.380858, -5.812505,
2, -3.544063, -6.090604,
3, -3.380858, -5.812505,
3, -3.544063, -6.090604
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
"2",
"3"
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
-3, -3.870473, -6.646801, 0, -0.5, 0.5, 0.5,
-3, -3.870473, -6.646801, 1, -0.5, 0.5, 0.5,
-3, -3.870473, -6.646801, 1, 1.5, 0.5, 0.5,
-3, -3.870473, -6.646801, 0, 1.5, 0.5, 0.5,
-2, -3.870473, -6.646801, 0, -0.5, 0.5, 0.5,
-2, -3.870473, -6.646801, 1, -0.5, 0.5, 0.5,
-2, -3.870473, -6.646801, 1, 1.5, 0.5, 0.5,
-2, -3.870473, -6.646801, 0, 1.5, 0.5, 0.5,
-1, -3.870473, -6.646801, 0, -0.5, 0.5, 0.5,
-1, -3.870473, -6.646801, 1, -0.5, 0.5, 0.5,
-1, -3.870473, -6.646801, 1, 1.5, 0.5, 0.5,
-1, -3.870473, -6.646801, 0, 1.5, 0.5, 0.5,
0, -3.870473, -6.646801, 0, -0.5, 0.5, 0.5,
0, -3.870473, -6.646801, 1, -0.5, 0.5, 0.5,
0, -3.870473, -6.646801, 1, 1.5, 0.5, 0.5,
0, -3.870473, -6.646801, 0, 1.5, 0.5, 0.5,
1, -3.870473, -6.646801, 0, -0.5, 0.5, 0.5,
1, -3.870473, -6.646801, 1, -0.5, 0.5, 0.5,
1, -3.870473, -6.646801, 1, 1.5, 0.5, 0.5,
1, -3.870473, -6.646801, 0, 1.5, 0.5, 0.5,
2, -3.870473, -6.646801, 0, -0.5, 0.5, 0.5,
2, -3.870473, -6.646801, 1, -0.5, 0.5, 0.5,
2, -3.870473, -6.646801, 1, 1.5, 0.5, 0.5,
2, -3.870473, -6.646801, 0, 1.5, 0.5, 0.5,
3, -3.870473, -6.646801, 0, -0.5, 0.5, 0.5,
3, -3.870473, -6.646801, 1, -0.5, 0.5, 0.5,
3, -3.870473, -6.646801, 1, 1.5, 0.5, 0.5,
3, -3.870473, -6.646801, 0, 1.5, 0.5, 0.5
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
-4.085314, -3, -5.812505,
-4.085314, 3, -5.812505,
-4.085314, -3, -5.812505,
-4.265524, -3, -6.090604,
-4.085314, -2, -5.812505,
-4.265524, -2, -6.090604,
-4.085314, -1, -5.812505,
-4.265524, -1, -6.090604,
-4.085314, 0, -5.812505,
-4.265524, 0, -6.090604,
-4.085314, 1, -5.812505,
-4.265524, 1, -6.090604,
-4.085314, 2, -5.812505,
-4.265524, 2, -6.090604,
-4.085314, 3, -5.812505,
-4.265524, 3, -6.090604
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
-4.625942, -3, -6.646801, 0, -0.5, 0.5, 0.5,
-4.625942, -3, -6.646801, 1, -0.5, 0.5, 0.5,
-4.625942, -3, -6.646801, 1, 1.5, 0.5, 0.5,
-4.625942, -3, -6.646801, 0, 1.5, 0.5, 0.5,
-4.625942, -2, -6.646801, 0, -0.5, 0.5, 0.5,
-4.625942, -2, -6.646801, 1, -0.5, 0.5, 0.5,
-4.625942, -2, -6.646801, 1, 1.5, 0.5, 0.5,
-4.625942, -2, -6.646801, 0, 1.5, 0.5, 0.5,
-4.625942, -1, -6.646801, 0, -0.5, 0.5, 0.5,
-4.625942, -1, -6.646801, 1, -0.5, 0.5, 0.5,
-4.625942, -1, -6.646801, 1, 1.5, 0.5, 0.5,
-4.625942, -1, -6.646801, 0, 1.5, 0.5, 0.5,
-4.625942, 0, -6.646801, 0, -0.5, 0.5, 0.5,
-4.625942, 0, -6.646801, 1, -0.5, 0.5, 0.5,
-4.625942, 0, -6.646801, 1, 1.5, 0.5, 0.5,
-4.625942, 0, -6.646801, 0, 1.5, 0.5, 0.5,
-4.625942, 1, -6.646801, 0, -0.5, 0.5, 0.5,
-4.625942, 1, -6.646801, 1, -0.5, 0.5, 0.5,
-4.625942, 1, -6.646801, 1, 1.5, 0.5, 0.5,
-4.625942, 1, -6.646801, 0, 1.5, 0.5, 0.5,
-4.625942, 2, -6.646801, 0, -0.5, 0.5, 0.5,
-4.625942, 2, -6.646801, 1, -0.5, 0.5, 0.5,
-4.625942, 2, -6.646801, 1, 1.5, 0.5, 0.5,
-4.625942, 2, -6.646801, 0, 1.5, 0.5, 0.5,
-4.625942, 3, -6.646801, 0, -0.5, 0.5, 0.5,
-4.625942, 3, -6.646801, 1, -0.5, 0.5, 0.5,
-4.625942, 3, -6.646801, 1, 1.5, 0.5, 0.5,
-4.625942, 3, -6.646801, 0, 1.5, 0.5, 0.5
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
-4.085314, -3.380858, -4,
-4.085314, -3.380858, 4,
-4.085314, -3.380858, -4,
-4.265524, -3.544063, -4,
-4.085314, -3.380858, -2,
-4.265524, -3.544063, -2,
-4.085314, -3.380858, 0,
-4.265524, -3.544063, 0,
-4.085314, -3.380858, 2,
-4.265524, -3.544063, 2,
-4.085314, -3.380858, 4,
-4.265524, -3.544063, 4
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
-4.625942, -3.870473, -4, 0, -0.5, 0.5, 0.5,
-4.625942, -3.870473, -4, 1, -0.5, 0.5, 0.5,
-4.625942, -3.870473, -4, 1, 1.5, 0.5, 0.5,
-4.625942, -3.870473, -4, 0, 1.5, 0.5, 0.5,
-4.625942, -3.870473, -2, 0, -0.5, 0.5, 0.5,
-4.625942, -3.870473, -2, 1, -0.5, 0.5, 0.5,
-4.625942, -3.870473, -2, 1, 1.5, 0.5, 0.5,
-4.625942, -3.870473, -2, 0, 1.5, 0.5, 0.5,
-4.625942, -3.870473, 0, 0, -0.5, 0.5, 0.5,
-4.625942, -3.870473, 0, 1, -0.5, 0.5, 0.5,
-4.625942, -3.870473, 0, 1, 1.5, 0.5, 0.5,
-4.625942, -3.870473, 0, 0, 1.5, 0.5, 0.5,
-4.625942, -3.870473, 2, 0, -0.5, 0.5, 0.5,
-4.625942, -3.870473, 2, 1, -0.5, 0.5, 0.5,
-4.625942, -3.870473, 2, 1, 1.5, 0.5, 0.5,
-4.625942, -3.870473, 2, 0, 1.5, 0.5, 0.5,
-4.625942, -3.870473, 4, 0, -0.5, 0.5, 0.5,
-4.625942, -3.870473, 4, 1, -0.5, 0.5, 0.5,
-4.625942, -3.870473, 4, 1, 1.5, 0.5, 0.5,
-4.625942, -3.870473, 4, 0, 1.5, 0.5, 0.5
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
-4.085314, -3.380858, -5.812505,
-4.085314, 3.147341, -5.812505,
-4.085314, -3.380858, 5.311442,
-4.085314, 3.147341, 5.311442,
-4.085314, -3.380858, -5.812505,
-4.085314, -3.380858, 5.311442,
-4.085314, 3.147341, -5.812505,
-4.085314, 3.147341, 5.311442,
-4.085314, -3.380858, -5.812505,
3.12306, -3.380858, -5.812505,
-4.085314, -3.380858, 5.311442,
3.12306, -3.380858, 5.311442,
-4.085314, 3.147341, -5.812505,
3.12306, 3.147341, -5.812505,
-4.085314, 3.147341, 5.311442,
3.12306, 3.147341, 5.311442,
3.12306, -3.380858, -5.812505,
3.12306, 3.147341, -5.812505,
3.12306, -3.380858, 5.311442,
3.12306, 3.147341, 5.311442,
3.12306, -3.380858, -5.812505,
3.12306, -3.380858, 5.311442,
3.12306, 3.147341, -5.812505,
3.12306, 3.147341, 5.311442
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
var radius = 7.889918;
var distance = 35.10313;
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
mvMatrix.translate( 0.4811275, 0.1167589, 0.2505314 );
mvMatrix.scale( 1.183448, 1.306751, 0.76688 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.10313);
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
acrinathrin<-read.table("acrinathrin.xyz")
```

```
## Error in read.table("acrinathrin.xyz"): no lines available in input
```

```r
x<-acrinathrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'acrinathrin' not found
```

```r
y<-acrinathrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'acrinathrin' not found
```

```r
z<-acrinathrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'acrinathrin' not found
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
-3.980338, 0.1981639, -1.508905, 0, 0, 1, 1, 1,
-3.332396, -0.03906738, -1.579637, 1, 0, 0, 1, 1,
-2.839436, -2.002362, -2.398473, 1, 0, 0, 1, 1,
-2.673687, -0.5988494, -2.054946, 1, 0, 0, 1, 1,
-2.552969, 1.070843, 0.02372122, 1, 0, 0, 1, 1,
-2.453711, 0.885113, -0.6848508, 1, 0, 0, 1, 1,
-2.444204, -1.232879, -1.803672, 0, 0, 0, 1, 1,
-2.439486, 1.402751, -0.0651887, 0, 0, 0, 1, 1,
-2.403226, 0.2805649, -1.072746, 0, 0, 0, 1, 1,
-2.379282, 1.236979, 0.1337514, 0, 0, 0, 1, 1,
-2.360539, -1.265093, -2.172504, 0, 0, 0, 1, 1,
-2.281434, 2.361689, -0.9020779, 0, 0, 0, 1, 1,
-2.223296, -1.104927, -0.8917376, 0, 0, 0, 1, 1,
-2.215508, 1.127437, -3.537418, 1, 1, 1, 1, 1,
-2.195319, -3.285788, -1.590161, 1, 1, 1, 1, 1,
-2.18395, -0.3741533, -2.241077, 1, 1, 1, 1, 1,
-2.179583, 0.5537631, 1.209344, 1, 1, 1, 1, 1,
-2.164059, -0.1146608, -0.1358566, 1, 1, 1, 1, 1,
-2.147007, -0.3165396, -2.508649, 1, 1, 1, 1, 1,
-2.111774, 0.6066829, -1.876344, 1, 1, 1, 1, 1,
-2.102596, 0.4405224, -0.3932163, 1, 1, 1, 1, 1,
-2.095727, 0.2665065, -0.6388525, 1, 1, 1, 1, 1,
-2.088519, -0.9924586, -1.515896, 1, 1, 1, 1, 1,
-2.064632, -0.7859437, -0.7232704, 1, 1, 1, 1, 1,
-2.063946, -1.280644, -1.804725, 1, 1, 1, 1, 1,
-2.062562, -0.8453282, -2.429112, 1, 1, 1, 1, 1,
-2.060132, -0.3441885, -2.365593, 1, 1, 1, 1, 1,
-2.043393, 2.209988, -2.46435, 1, 1, 1, 1, 1,
-2.040876, 0.7750055, 0.1710574, 0, 0, 1, 1, 1,
-2.025112, 1.352686, -0.5350841, 1, 0, 0, 1, 1,
-1.96866, 0.01302187, -3.171095, 1, 0, 0, 1, 1,
-1.961635, 0.239544, -1.132333, 1, 0, 0, 1, 1,
-1.884603, 1.792406, -2.170108, 1, 0, 0, 1, 1,
-1.868414, -0.3229006, -1.609081, 1, 0, 0, 1, 1,
-1.855666, 1.965699, -2.802219, 0, 0, 0, 1, 1,
-1.846113, -0.6879558, -1.579078, 0, 0, 0, 1, 1,
-1.84144, 0.2901863, -0.1957525, 0, 0, 0, 1, 1,
-1.822469, 0.6000361, -1.965652, 0, 0, 0, 1, 1,
-1.810219, 1.264173, -0.615721, 0, 0, 0, 1, 1,
-1.793084, -0.3086626, -1.365809, 0, 0, 0, 1, 1,
-1.787486, 0.08661508, 0.1103347, 0, 0, 0, 1, 1,
-1.778623, 1.112575, -0.3692297, 1, 1, 1, 1, 1,
-1.764351, -1.715242, -3.109451, 1, 1, 1, 1, 1,
-1.760285, 0.2217752, -0.3471138, 1, 1, 1, 1, 1,
-1.758325, 0.1544609, -1.515197, 1, 1, 1, 1, 1,
-1.735559, 0.8779646, -0.942633, 1, 1, 1, 1, 1,
-1.716334, -0.3439473, -1.378106, 1, 1, 1, 1, 1,
-1.696004, -1.683473, -2.327422, 1, 1, 1, 1, 1,
-1.67855, 1.059324, -0.8295065, 1, 1, 1, 1, 1,
-1.675553, -0.07429411, -0.9725732, 1, 1, 1, 1, 1,
-1.626612, 0.1304766, -2.551024, 1, 1, 1, 1, 1,
-1.608532, -0.1886429, -2.115124, 1, 1, 1, 1, 1,
-1.60546, -1.870773, -1.334625, 1, 1, 1, 1, 1,
-1.603967, 0.2569274, -0.3938342, 1, 1, 1, 1, 1,
-1.585576, 0.3696321, -1.67826, 1, 1, 1, 1, 1,
-1.581384, 2.147648, -0.5753148, 1, 1, 1, 1, 1,
-1.562667, -1.944481, -2.524246, 0, 0, 1, 1, 1,
-1.553841, 0.01497126, -0.8417672, 1, 0, 0, 1, 1,
-1.553786, -1.369768, -3.298106, 1, 0, 0, 1, 1,
-1.553046, -0.9142374, -1.820034, 1, 0, 0, 1, 1,
-1.548137, -1.412104, -1.958959, 1, 0, 0, 1, 1,
-1.546868, 0.6584689, -2.172748, 1, 0, 0, 1, 1,
-1.546057, -0.9766657, 0.4856237, 0, 0, 0, 1, 1,
-1.545537, -1.074536, -2.953223, 0, 0, 0, 1, 1,
-1.533905, -1.175163, -0.4918863, 0, 0, 0, 1, 1,
-1.523932, -0.6045481, -3.199277, 0, 0, 0, 1, 1,
-1.512173, 0.8343385, -1.441804, 0, 0, 0, 1, 1,
-1.509737, -0.1607231, -0.9998163, 0, 0, 0, 1, 1,
-1.507005, -0.7857749, -1.48833, 0, 0, 0, 1, 1,
-1.50694, -0.09853198, -0.8390073, 1, 1, 1, 1, 1,
-1.496796, -0.320183, -3.306729, 1, 1, 1, 1, 1,
-1.450222, 0.6684155, -1.389655, 1, 1, 1, 1, 1,
-1.434974, -1.373277, -3.18672, 1, 1, 1, 1, 1,
-1.428646, 0.03519881, -3.709273, 1, 1, 1, 1, 1,
-1.424234, -0.9259214, -2.420635, 1, 1, 1, 1, 1,
-1.420814, -0.6079139, -2.25582, 1, 1, 1, 1, 1,
-1.415757, -0.258125, -0.997109, 1, 1, 1, 1, 1,
-1.409292, 0.4643662, -1.285904, 1, 1, 1, 1, 1,
-1.407995, 0.8543692, -1.490043, 1, 1, 1, 1, 1,
-1.407745, 0.9506041, -0.9107537, 1, 1, 1, 1, 1,
-1.404366, -1.697774, -2.281984, 1, 1, 1, 1, 1,
-1.381223, -0.4370612, -2.789535, 1, 1, 1, 1, 1,
-1.368164, 0.6668881, -0.4557573, 1, 1, 1, 1, 1,
-1.366224, 0.9107676, -0.5868402, 1, 1, 1, 1, 1,
-1.366166, 1.046847, 0.2582126, 0, 0, 1, 1, 1,
-1.363461, -2.049729, -3.038516, 1, 0, 0, 1, 1,
-1.362844, 0.1655158, 0.8572671, 1, 0, 0, 1, 1,
-1.361334, -0.1918518, -0.2933722, 1, 0, 0, 1, 1,
-1.345621, 0.9192264, -1.497944, 1, 0, 0, 1, 1,
-1.340947, 1.389116, -0.7398019, 1, 0, 0, 1, 1,
-1.330256, -0.6698409, -3.246466, 0, 0, 0, 1, 1,
-1.313488, 2.435766, -0.06095527, 0, 0, 0, 1, 1,
-1.313359, 1.63328, -1.125442, 0, 0, 0, 1, 1,
-1.304952, -0.1966945, -1.393002, 0, 0, 0, 1, 1,
-1.298189, 0.89496, -0.04990028, 0, 0, 0, 1, 1,
-1.286225, 0.7216753, -0.8008226, 0, 0, 0, 1, 1,
-1.283554, 0.5823802, -0.4220096, 0, 0, 0, 1, 1,
-1.281494, 0.5750464, -0.3644535, 1, 1, 1, 1, 1,
-1.27931, 0.8670553, -0.7683622, 1, 1, 1, 1, 1,
-1.262316, 0.3579316, -2.578706, 1, 1, 1, 1, 1,
-1.237233, -0.5813076, -2.157488, 1, 1, 1, 1, 1,
-1.225188, 0.8705651, -1.316504, 1, 1, 1, 1, 1,
-1.225116, -0.5562541, -3.197068, 1, 1, 1, 1, 1,
-1.219574, -0.0220567, -1.890725, 1, 1, 1, 1, 1,
-1.212505, -1.675666, -2.548455, 1, 1, 1, 1, 1,
-1.20811, 0.4802381, -2.063347, 1, 1, 1, 1, 1,
-1.199964, 1.389954, 0.4179489, 1, 1, 1, 1, 1,
-1.195018, 2.811775, 1.478411, 1, 1, 1, 1, 1,
-1.17909, -1.317669, -1.33791, 1, 1, 1, 1, 1,
-1.177617, 0.7098617, -0.7032145, 1, 1, 1, 1, 1,
-1.177095, 1.056001, -0.206945, 1, 1, 1, 1, 1,
-1.17519, 1.733318, 1.340672, 1, 1, 1, 1, 1,
-1.172993, 1.388886, -0.04073935, 0, 0, 1, 1, 1,
-1.17227, -1.385034, -2.500869, 1, 0, 0, 1, 1,
-1.161391, 1.170408, -0.1244687, 1, 0, 0, 1, 1,
-1.153005, -0.2753052, -1.186545, 1, 0, 0, 1, 1,
-1.139337, 0.2612678, -1.221883, 1, 0, 0, 1, 1,
-1.139033, -0.07730964, -0.779947, 1, 0, 0, 1, 1,
-1.138387, 0.3813517, -1.369613, 0, 0, 0, 1, 1,
-1.137607, 0.6535635, -0.7080408, 0, 0, 0, 1, 1,
-1.137095, 0.001140377, -2.900988, 0, 0, 0, 1, 1,
-1.133075, 1.021882, -1.730868, 0, 0, 0, 1, 1,
-1.12144, 1.311417, -0.3572371, 0, 0, 0, 1, 1,
-1.118776, 0.4955103, -2.100405, 0, 0, 0, 1, 1,
-1.107954, -0.4135099, -3.442899, 0, 0, 0, 1, 1,
-1.106563, -0.06101695, -2.073691, 1, 1, 1, 1, 1,
-1.101896, -0.6755154, -2.160006, 1, 1, 1, 1, 1,
-1.101508, 0.3072041, -1.110456, 1, 1, 1, 1, 1,
-1.087309, 0.1999646, -1.67981, 1, 1, 1, 1, 1,
-1.084696, -1.071, -1.069076, 1, 1, 1, 1, 1,
-1.081079, 0.4026946, -1.28525, 1, 1, 1, 1, 1,
-1.078289, 1.361737, -0.2483424, 1, 1, 1, 1, 1,
-1.075353, 1.202603, -0.6471049, 1, 1, 1, 1, 1,
-1.056297, -1.073308, -2.244736, 1, 1, 1, 1, 1,
-1.055319, 0.5482041, -0.2424479, 1, 1, 1, 1, 1,
-1.055205, -0.03736133, -3.568413, 1, 1, 1, 1, 1,
-1.049147, -0.1225367, -1.603085, 1, 1, 1, 1, 1,
-1.047156, 1.036821, -0.4439822, 1, 1, 1, 1, 1,
-1.046962, -0.5103561, -2.116519, 1, 1, 1, 1, 1,
-1.041125, -0.2680099, -1.425467, 1, 1, 1, 1, 1,
-1.031245, -1.570763, -2.127398, 0, 0, 1, 1, 1,
-1.016989, -0.7184577, -2.028281, 1, 0, 0, 1, 1,
-1.001698, -0.6688218, -2.267563, 1, 0, 0, 1, 1,
-0.9948372, -0.4733036, -1.970996, 1, 0, 0, 1, 1,
-0.9940562, -1.548662, -2.968098, 1, 0, 0, 1, 1,
-0.9931712, 2.050839, -0.3646486, 1, 0, 0, 1, 1,
-0.9924705, -0.1823699, -2.599235, 0, 0, 0, 1, 1,
-0.9918936, -0.1608737, -1.930631, 0, 0, 0, 1, 1,
-0.9664792, -0.2263571, -1.576895, 0, 0, 0, 1, 1,
-0.965925, -1.040968, -1.731467, 0, 0, 0, 1, 1,
-0.9654471, -0.8041011, -4.515823, 0, 0, 0, 1, 1,
-0.9639195, 0.91508, -1.732109, 0, 0, 0, 1, 1,
-0.9582258, 0.7312599, -2.139765, 0, 0, 0, 1, 1,
-0.957696, -0.4287005, 0.02661382, 1, 1, 1, 1, 1,
-0.9555405, 1.12416, -0.1092196, 1, 1, 1, 1, 1,
-0.9510365, -0.6444083, -2.454329, 1, 1, 1, 1, 1,
-0.9480343, 1.615274, -0.5219762, 1, 1, 1, 1, 1,
-0.9453937, 1.632575, -0.9790515, 1, 1, 1, 1, 1,
-0.944275, 0.272187, -2.450193, 1, 1, 1, 1, 1,
-0.9419757, -0.9792709, -4.442685, 1, 1, 1, 1, 1,
-0.9337376, 0.6952354, 0.9015442, 1, 1, 1, 1, 1,
-0.9247821, 1.274384, -0.6294436, 1, 1, 1, 1, 1,
-0.9185453, 0.4811795, -1.528516, 1, 1, 1, 1, 1,
-0.9132245, -0.2496482, -0.7698173, 1, 1, 1, 1, 1,
-0.9068551, 0.370681, -1.570679, 1, 1, 1, 1, 1,
-0.90504, -1.380475, -3.667723, 1, 1, 1, 1, 1,
-0.8992227, -1.888923, -4.129205, 1, 1, 1, 1, 1,
-0.8931084, 0.2777382, -0.4513153, 1, 1, 1, 1, 1,
-0.8888186, -1.200938, -2.104361, 0, 0, 1, 1, 1,
-0.8844354, -0.05345222, -2.570115, 1, 0, 0, 1, 1,
-0.8830708, -0.3077499, -2.036922, 1, 0, 0, 1, 1,
-0.8784676, 0.8729504, -0.3417022, 1, 0, 0, 1, 1,
-0.8717632, -0.5085113, -3.649228, 1, 0, 0, 1, 1,
-0.8636186, 0.7173709, -1.663059, 1, 0, 0, 1, 1,
-0.8633168, -0.6918603, -2.157807, 0, 0, 0, 1, 1,
-0.8616951, 0.5425457, -1.456783, 0, 0, 0, 1, 1,
-0.8562734, -0.2182147, -4.222099, 0, 0, 0, 1, 1,
-0.8496469, -0.3643047, -3.774236, 0, 0, 0, 1, 1,
-0.8476868, -0.8372294, -3.52359, 0, 0, 0, 1, 1,
-0.840116, 0.5502464, -0.4169122, 0, 0, 0, 1, 1,
-0.8397292, 2.340051, 0.06995069, 0, 0, 0, 1, 1,
-0.8295247, 2.151208, -1.8558, 1, 1, 1, 1, 1,
-0.8203384, -1.116807, -2.591935, 1, 1, 1, 1, 1,
-0.8185273, -0.8969825, -2.775918, 1, 1, 1, 1, 1,
-0.8164787, 0.7658237, -0.7438088, 1, 1, 1, 1, 1,
-0.8158169, -0.1079899, -0.5509093, 1, 1, 1, 1, 1,
-0.8138862, 0.2433845, -0.1445755, 1, 1, 1, 1, 1,
-0.8084394, -0.4610443, -0.6104069, 1, 1, 1, 1, 1,
-0.8063019, 0.7004519, 0.3435088, 1, 1, 1, 1, 1,
-0.8010558, -0.1723829, -1.679067, 1, 1, 1, 1, 1,
-0.7985387, -0.1881526, -3.012228, 1, 1, 1, 1, 1,
-0.797553, 0.3598566, -1.414486, 1, 1, 1, 1, 1,
-0.7962495, -0.6285169, -2.937947, 1, 1, 1, 1, 1,
-0.7919803, -0.01722036, -2.77673, 1, 1, 1, 1, 1,
-0.7853129, -0.001144076, -2.159079, 1, 1, 1, 1, 1,
-0.7848301, 1.880771, -0.8889655, 1, 1, 1, 1, 1,
-0.778772, -0.7975134, -4.331004, 0, 0, 1, 1, 1,
-0.7781228, -0.4142684, -1.165691, 1, 0, 0, 1, 1,
-0.7672175, -0.1847918, -3.689357, 1, 0, 0, 1, 1,
-0.7627437, -0.1836763, -2.754572, 1, 0, 0, 1, 1,
-0.762508, 0.4103695, -0.3245385, 1, 0, 0, 1, 1,
-0.7604919, 0.00148735, 0.03347215, 1, 0, 0, 1, 1,
-0.7601955, 1.24473, 1.1952, 0, 0, 0, 1, 1,
-0.7592133, 0.06034215, -0.5374297, 0, 0, 0, 1, 1,
-0.7575859, -0.4044214, -3.064051, 0, 0, 0, 1, 1,
-0.7561747, 0.9936341, 0.5357715, 0, 0, 0, 1, 1,
-0.7559524, -0.6459764, -2.982584, 0, 0, 0, 1, 1,
-0.7540333, 0.6502929, -0.3167845, 0, 0, 0, 1, 1,
-0.7513659, 0.3443542, -2.431525, 0, 0, 0, 1, 1,
-0.7494724, 1.813289, 0.1989665, 1, 1, 1, 1, 1,
-0.7444882, 0.198909, -0.3993348, 1, 1, 1, 1, 1,
-0.7441379, -0.3687925, -2.410209, 1, 1, 1, 1, 1,
-0.7435325, -0.1081648, -1.452188, 1, 1, 1, 1, 1,
-0.7363277, 1.038785, -0.8988038, 1, 1, 1, 1, 1,
-0.7357484, -0.02920278, 0.2643083, 1, 1, 1, 1, 1,
-0.7349648, -0.7084507, -2.846788, 1, 1, 1, 1, 1,
-0.734258, 2.111257, 1.041561, 1, 1, 1, 1, 1,
-0.7332674, 0.7356905, -1.474001, 1, 1, 1, 1, 1,
-0.7301736, -1.181935, -2.612811, 1, 1, 1, 1, 1,
-0.727176, -1.15368, -3.030385, 1, 1, 1, 1, 1,
-0.7263599, -0.5473999, -1.016984, 1, 1, 1, 1, 1,
-0.7259843, 1.413894, 0.4797121, 1, 1, 1, 1, 1,
-0.70669, 2.552914, 1.500192, 1, 1, 1, 1, 1,
-0.7035011, 2.311311, -0.9771349, 1, 1, 1, 1, 1,
-0.7004033, 0.05533291, -2.152938, 0, 0, 1, 1, 1,
-0.6977095, -0.6886628, -2.3477, 1, 0, 0, 1, 1,
-0.6940817, 0.7878804, -2.110927, 1, 0, 0, 1, 1,
-0.6925759, -1.774049, -1.756829, 1, 0, 0, 1, 1,
-0.6910344, -0.06746408, -2.516878, 1, 0, 0, 1, 1,
-0.6900069, -0.8024492, -2.429112, 1, 0, 0, 1, 1,
-0.6870194, -0.9601887, -3.696604, 0, 0, 0, 1, 1,
-0.6857783, -2.451606, -3.507213, 0, 0, 0, 1, 1,
-0.6842121, -0.4970056, -1.369395, 0, 0, 0, 1, 1,
-0.6836975, 0.597114, -0.7669176, 0, 0, 0, 1, 1,
-0.6834595, 1.149835, 0.3828598, 0, 0, 0, 1, 1,
-0.6767389, -0.2080156, -2.564764, 0, 0, 0, 1, 1,
-0.6759941, 1.290808, 2.038816, 0, 0, 0, 1, 1,
-0.6733491, 0.227046, -1.264607, 1, 1, 1, 1, 1,
-0.6691948, 1.340693, -1.936031, 1, 1, 1, 1, 1,
-0.6689677, -0.355552, -1.351747, 1, 1, 1, 1, 1,
-0.6663908, 0.2177687, -0.8770475, 1, 1, 1, 1, 1,
-0.6655049, -0.9241796, -2.537852, 1, 1, 1, 1, 1,
-0.6643355, 0.05611503, -2.95111, 1, 1, 1, 1, 1,
-0.6631021, -0.007306737, -0.8385978, 1, 1, 1, 1, 1,
-0.6552012, 0.4297067, -1.700048, 1, 1, 1, 1, 1,
-0.6523788, 1.205186, 1.588596, 1, 1, 1, 1, 1,
-0.6436579, -1.352594, -3.676215, 1, 1, 1, 1, 1,
-0.6421019, 0.4774714, 0.1222601, 1, 1, 1, 1, 1,
-0.6413632, 0.103837, -2.160426, 1, 1, 1, 1, 1,
-0.640889, -2.450102, -1.269647, 1, 1, 1, 1, 1,
-0.6352273, 0.8916056, -0.2925902, 1, 1, 1, 1, 1,
-0.6351945, 0.68954, -1.017904, 1, 1, 1, 1, 1,
-0.6338115, -0.571798, -1.606071, 0, 0, 1, 1, 1,
-0.6224896, -0.2011855, -2.809382, 1, 0, 0, 1, 1,
-0.6189675, -0.5308692, -0.8947326, 1, 0, 0, 1, 1,
-0.6171716, -0.1962264, -2.179019, 1, 0, 0, 1, 1,
-0.6150127, -0.284333, -1.861119, 1, 0, 0, 1, 1,
-0.6135657, 0.6907216, 0.4301014, 1, 0, 0, 1, 1,
-0.6090716, -0.7476321, -3.290473, 0, 0, 0, 1, 1,
-0.6068434, 0.4954401, 2.080301, 0, 0, 0, 1, 1,
-0.5971206, -0.4279417, -1.366336, 0, 0, 0, 1, 1,
-0.595191, -0.472403, -1.734275, 0, 0, 0, 1, 1,
-0.5933505, 0.3724269, -1.343648, 0, 0, 0, 1, 1,
-0.5830488, 0.7668645, -0.8111217, 0, 0, 0, 1, 1,
-0.5820435, 2.13853, 2.365257, 0, 0, 0, 1, 1,
-0.5812858, -0.9434404, -2.987905, 1, 1, 1, 1, 1,
-0.5787657, 1.351852, 1.524679, 1, 1, 1, 1, 1,
-0.5779617, -1.037672, -1.45093, 1, 1, 1, 1, 1,
-0.5702087, 0.2953129, -1.181537, 1, 1, 1, 1, 1,
-0.5663741, 2.39879, 0.8625686, 1, 1, 1, 1, 1,
-0.5660669, -0.2926782, -2.573527, 1, 1, 1, 1, 1,
-0.5652021, -0.0006082777, -1.718789, 1, 1, 1, 1, 1,
-0.5613778, -2.6404, -2.803774, 1, 1, 1, 1, 1,
-0.5604496, -0.1685051, -2.12091, 1, 1, 1, 1, 1,
-0.5595344, 1.056038, 0.2096532, 1, 1, 1, 1, 1,
-0.556088, -2.150454, -1.538749, 1, 1, 1, 1, 1,
-0.5554827, 1.032226, -1.298095, 1, 1, 1, 1, 1,
-0.5467632, -0.422827, -1.722089, 1, 1, 1, 1, 1,
-0.5429211, -1.288489, -2.629603, 1, 1, 1, 1, 1,
-0.5412555, 0.1289276, -0.8043498, 1, 1, 1, 1, 1,
-0.5407228, -0.4539995, -2.327207, 0, 0, 1, 1, 1,
-0.5394558, -0.2547973, -1.617209, 1, 0, 0, 1, 1,
-0.5296855, 0.8542515, -1.258152, 1, 0, 0, 1, 1,
-0.5261106, -0.430091, -2.679115, 1, 0, 0, 1, 1,
-0.5257999, 0.2332744, -1.417107, 1, 0, 0, 1, 1,
-0.5176927, -0.35957, -2.308037, 1, 0, 0, 1, 1,
-0.5169188, -0.006996985, -1.947811, 0, 0, 0, 1, 1,
-0.5167269, 1.470262, -1.445444, 0, 0, 0, 1, 1,
-0.5126569, -0.8547931, -2.551178, 0, 0, 0, 1, 1,
-0.5039764, -1.185968, -1.985289, 0, 0, 0, 1, 1,
-0.4991985, -0.5331964, -1.142986, 0, 0, 0, 1, 1,
-0.4956636, 1.87935, -0.5552796, 0, 0, 0, 1, 1,
-0.4924043, -0.1076611, -0.8761807, 0, 0, 0, 1, 1,
-0.4888228, 0.3561174, -1.808494, 1, 1, 1, 1, 1,
-0.4873957, 0.2445313, -2.278078, 1, 1, 1, 1, 1,
-0.4850975, -1.477616, -1.829866, 1, 1, 1, 1, 1,
-0.4773494, 0.8393089, -0.7503422, 1, 1, 1, 1, 1,
-0.4763577, 0.1512654, -2.077306, 1, 1, 1, 1, 1,
-0.4759453, -0.9873591, -4.666182, 1, 1, 1, 1, 1,
-0.4747266, 0.2011348, -1.128653, 1, 1, 1, 1, 1,
-0.4732853, 0.1974147, -0.8563467, 1, 1, 1, 1, 1,
-0.4723094, -0.6728374, -2.094079, 1, 1, 1, 1, 1,
-0.4639342, -2.218786, -4.847081, 1, 1, 1, 1, 1,
-0.4537604, 0.4413786, -0.6328959, 1, 1, 1, 1, 1,
-0.4512696, 0.6340247, -1.583195, 1, 1, 1, 1, 1,
-0.4479062, -0.563318, -3.377664, 1, 1, 1, 1, 1,
-0.4474369, -0.2732302, -3.346969, 1, 1, 1, 1, 1,
-0.446055, -0.3252521, -2.232466, 1, 1, 1, 1, 1,
-0.4430778, -0.1187304, -1.324807, 0, 0, 1, 1, 1,
-0.4381239, 0.4238764, -0.2991537, 1, 0, 0, 1, 1,
-0.4367754, 0.1618398, -1.749306, 1, 0, 0, 1, 1,
-0.4365047, -0.1184647, 0.08718352, 1, 0, 0, 1, 1,
-0.4354094, 1.072528, -0.7877313, 1, 0, 0, 1, 1,
-0.4348182, -0.294709, -1.972786, 1, 0, 0, 1, 1,
-0.433663, 0.2376719, -0.6628858, 0, 0, 0, 1, 1,
-0.433174, -0.32469, -2.413224, 0, 0, 0, 1, 1,
-0.4294498, 1.222012, -1.457447, 0, 0, 0, 1, 1,
-0.428169, -1.117359, -3.320338, 0, 0, 0, 1, 1,
-0.4272816, -1.845568, -2.194777, 0, 0, 0, 1, 1,
-0.4250312, 0.8070349, -0.6944417, 0, 0, 0, 1, 1,
-0.4220462, 0.5625858, -1.620038, 0, 0, 0, 1, 1,
-0.4170012, -1.850353, -0.007756941, 1, 1, 1, 1, 1,
-0.4149545, 1.469886, 1.292071, 1, 1, 1, 1, 1,
-0.4126981, -0.331697, -2.261965, 1, 1, 1, 1, 1,
-0.4122901, -0.03939644, -2.919415, 1, 1, 1, 1, 1,
-0.4117948, -1.0955, -2.415606, 1, 1, 1, 1, 1,
-0.4094159, 1.088143, 0.8585891, 1, 1, 1, 1, 1,
-0.4089294, 0.9282207, 0.6763764, 1, 1, 1, 1, 1,
-0.4088173, 0.177497, -0.8705356, 1, 1, 1, 1, 1,
-0.4058234, 0.1382246, -1.791068, 1, 1, 1, 1, 1,
-0.4016838, -1.966908, -3.977309, 1, 1, 1, 1, 1,
-0.3981759, 0.136796, -0.2696217, 1, 1, 1, 1, 1,
-0.3960872, -2.601763, -2.873592, 1, 1, 1, 1, 1,
-0.3928012, 0.7341049, -1.753816, 1, 1, 1, 1, 1,
-0.387897, -0.3552589, -1.084218, 1, 1, 1, 1, 1,
-0.3817796, 1.04414, -0.8217455, 1, 1, 1, 1, 1,
-0.3778785, 1.461831, 1.761768, 0, 0, 1, 1, 1,
-0.375872, -0.2764145, -1.533578, 1, 0, 0, 1, 1,
-0.370994, 1.422037, -0.04862352, 1, 0, 0, 1, 1,
-0.3691464, -0.6010072, -2.996291, 1, 0, 0, 1, 1,
-0.3678517, 1.210916, 0.4857271, 1, 0, 0, 1, 1,
-0.3657457, -2.643048, -1.943832, 1, 0, 0, 1, 1,
-0.3649548, -0.1010548, -3.207868, 0, 0, 0, 1, 1,
-0.3622902, -0.2091649, -2.003249, 0, 0, 0, 1, 1,
-0.3621038, 0.6502352, -0.7754892, 0, 0, 0, 1, 1,
-0.3590075, 0.1725728, -2.749891, 0, 0, 0, 1, 1,
-0.3569624, -0.03916184, -2.786667, 0, 0, 0, 1, 1,
-0.3555855, 0.6363576, -0.03100817, 0, 0, 0, 1, 1,
-0.35418, 0.1837228, -2.788978, 0, 0, 0, 1, 1,
-0.34233, 0.2690892, -1.975249, 1, 1, 1, 1, 1,
-0.337144, 0.2550701, -1.541128, 1, 1, 1, 1, 1,
-0.3330129, -1.036501, -2.514269, 1, 1, 1, 1, 1,
-0.3261287, -0.8218977, -3.262253, 1, 1, 1, 1, 1,
-0.3162324, -0.03720456, -2.898044, 1, 1, 1, 1, 1,
-0.3087659, 0.7608807, -1.73748, 1, 1, 1, 1, 1,
-0.3012933, -0.09574191, -2.186403, 1, 1, 1, 1, 1,
-0.2984748, 0.8951976, -0.2646779, 1, 1, 1, 1, 1,
-0.2974143, 1.341931, -0.8881882, 1, 1, 1, 1, 1,
-0.2963296, 0.6824892, -2.607403, 1, 1, 1, 1, 1,
-0.2939907, 0.6107065, 0.6337126, 1, 1, 1, 1, 1,
-0.2930597, 0.4180358, -1.445, 1, 1, 1, 1, 1,
-0.2924581, -0.8746754, -3.50992, 1, 1, 1, 1, 1,
-0.2870341, 0.82525, 0.6432737, 1, 1, 1, 1, 1,
-0.2843128, -0.7153148, -2.950253, 1, 1, 1, 1, 1,
-0.2812609, 1.713685, 1.881897, 0, 0, 1, 1, 1,
-0.2804042, 2.337239, -0.3897697, 1, 0, 0, 1, 1,
-0.2721146, 1.013036, -0.236517, 1, 0, 0, 1, 1,
-0.268073, 1.39461, -0.2945167, 1, 0, 0, 1, 1,
-0.2649197, -0.4900314, -5.650506, 1, 0, 0, 1, 1,
-0.2625778, 1.027844, 0.3900728, 1, 0, 0, 1, 1,
-0.2617454, -0.4002641, -2.59112, 0, 0, 0, 1, 1,
-0.2553727, -0.2245639, -2.740486, 0, 0, 0, 1, 1,
-0.2535442, -1.483261, -4.936112, 0, 0, 0, 1, 1,
-0.249566, 0.1534858, -1.344494, 0, 0, 0, 1, 1,
-0.2492293, -0.08681779, -1.980857, 0, 0, 0, 1, 1,
-0.2483313, -0.8943859, -1.519412, 0, 0, 0, 1, 1,
-0.2464697, 0.8864306, 0.04069699, 0, 0, 0, 1, 1,
-0.2446979, 1.360527, 0.6845705, 1, 1, 1, 1, 1,
-0.2426026, -1.780191, -2.448574, 1, 1, 1, 1, 1,
-0.2352207, 1.91818, 0.1537041, 1, 1, 1, 1, 1,
-0.2351331, 0.04979265, -1.796378, 1, 1, 1, 1, 1,
-0.234668, -0.5047503, -3.473825, 1, 1, 1, 1, 1,
-0.2332587, 0.866854, -1.648369, 1, 1, 1, 1, 1,
-0.2332229, 0.09660149, -1.995038, 1, 1, 1, 1, 1,
-0.2291679, -0.2711278, -1.649438, 1, 1, 1, 1, 1,
-0.2270752, 1.566755, 1.333443, 1, 1, 1, 1, 1,
-0.2245363, -0.06476344, -1.3144, 1, 1, 1, 1, 1,
-0.2223196, -0.2777417, -3.501562, 1, 1, 1, 1, 1,
-0.2204393, 1.183004, -2.150297, 1, 1, 1, 1, 1,
-0.2190819, -1.625858, -2.563516, 1, 1, 1, 1, 1,
-0.2163164, 0.1530497, -2.331708, 1, 1, 1, 1, 1,
-0.2149424, -0.05036364, -2.292659, 1, 1, 1, 1, 1,
-0.2129973, 0.8304, 1.035209, 0, 0, 1, 1, 1,
-0.2101426, -0.9575929, -3.486369, 1, 0, 0, 1, 1,
-0.2082637, -0.9880513, -3.100883, 1, 0, 0, 1, 1,
-0.2036384, -3.226655, -4.812113, 1, 0, 0, 1, 1,
-0.2033655, -1.303764, -4.796254, 1, 0, 0, 1, 1,
-0.203292, 1.557422, 0.1094095, 1, 0, 0, 1, 1,
-0.2020429, 0.6425236, 0.4467537, 0, 0, 0, 1, 1,
-0.2014289, -0.04004627, -3.62347, 0, 0, 0, 1, 1,
-0.1985833, 2.114753, 0.173638, 0, 0, 0, 1, 1,
-0.1932494, 1.937355, -0.4805423, 0, 0, 0, 1, 1,
-0.193095, 0.4968798, -0.9472101, 0, 0, 0, 1, 1,
-0.1917927, 0.4169848, -0.4572254, 0, 0, 0, 1, 1,
-0.1885779, -0.4655307, -3.084254, 0, 0, 0, 1, 1,
-0.1848347, -0.3091048, -2.28411, 1, 1, 1, 1, 1,
-0.1821191, 1.50581, 0.01750401, 1, 1, 1, 1, 1,
-0.181958, -0.4257141, -2.824318, 1, 1, 1, 1, 1,
-0.1814167, -0.6592343, -2.871338, 1, 1, 1, 1, 1,
-0.1762396, 0.1520857, -0.4145751, 1, 1, 1, 1, 1,
-0.1724488, 0.8253964, -0.1327604, 1, 1, 1, 1, 1,
-0.1721608, 0.813789, -0.9783518, 1, 1, 1, 1, 1,
-0.1638936, 0.2834277, -0.1524118, 1, 1, 1, 1, 1,
-0.162123, 0.3199988, -1.41886, 1, 1, 1, 1, 1,
-0.1604669, 1.660418, 0.4950455, 1, 1, 1, 1, 1,
-0.160419, 0.1005675, 0.2601501, 1, 1, 1, 1, 1,
-0.1594943, -0.1510618, 0.605381, 1, 1, 1, 1, 1,
-0.1562436, 2.884948, 1.448073, 1, 1, 1, 1, 1,
-0.1542615, -1.495, -3.406328, 1, 1, 1, 1, 1,
-0.151374, 0.3084221, -2.008736, 1, 1, 1, 1, 1,
-0.1504256, 0.349321, -0.8350619, 0, 0, 1, 1, 1,
-0.1480198, -0.5795037, -2.619854, 1, 0, 0, 1, 1,
-0.1437624, 0.2768026, -0.1891915, 1, 0, 0, 1, 1,
-0.1363006, -0.7823372, -4.434855, 1, 0, 0, 1, 1,
-0.1354446, -0.4515293, -1.94017, 1, 0, 0, 1, 1,
-0.1349378, 0.2093011, -1.677006, 1, 0, 0, 1, 1,
-0.1331731, -0.9962636, -1.202875, 0, 0, 0, 1, 1,
-0.1329909, -0.701529, -1.987211, 0, 0, 0, 1, 1,
-0.1322487, 1.010884, 0.5213157, 0, 0, 0, 1, 1,
-0.131219, 0.4652069, 0.857468, 0, 0, 0, 1, 1,
-0.1273546, -0.3679826, -3.542481, 0, 0, 0, 1, 1,
-0.1271968, -0.3789066, -3.53802, 0, 0, 0, 1, 1,
-0.1258875, 0.3003177, -2.124603, 0, 0, 0, 1, 1,
-0.1234429, -0.6524035, -3.124913, 1, 1, 1, 1, 1,
-0.1228652, -0.4812209, -2.578195, 1, 1, 1, 1, 1,
-0.1224141, 0.8363353, -1.830724, 1, 1, 1, 1, 1,
-0.1219826, -0.7420589, -3.057965, 1, 1, 1, 1, 1,
-0.1207592, 1.493618, 0.8302693, 1, 1, 1, 1, 1,
-0.1190361, -0.7316214, -3.105719, 1, 1, 1, 1, 1,
-0.117517, 0.2898907, -0.926873, 1, 1, 1, 1, 1,
-0.116567, -0.2667416, -3.823479, 1, 1, 1, 1, 1,
-0.1145117, -0.2470436, -1.661571, 1, 1, 1, 1, 1,
-0.1097905, -0.2467471, -2.725114, 1, 1, 1, 1, 1,
-0.1056084, -1.985235, -3.250394, 1, 1, 1, 1, 1,
-0.1001116, -1.698074, -3.894828, 1, 1, 1, 1, 1,
-0.09706673, -0.7141379, -1.04315, 1, 1, 1, 1, 1,
-0.09490614, -0.027789, -2.154104, 1, 1, 1, 1, 1,
-0.09476697, 1.039759, 0.4222361, 1, 1, 1, 1, 1,
-0.09245762, 0.02357224, -2.686315, 0, 0, 1, 1, 1,
-0.09221371, 1.408327, 0.1942095, 1, 0, 0, 1, 1,
-0.09100469, -1.025093, -1.600357, 1, 0, 0, 1, 1,
-0.08958579, -1.14085, -4.916453, 1, 0, 0, 1, 1,
-0.08571725, 0.7404962, -2.587107, 1, 0, 0, 1, 1,
-0.08302482, -0.4339637, -3.238543, 1, 0, 0, 1, 1,
-0.07609644, 0.7692037, -2.323363, 0, 0, 0, 1, 1,
-0.07395345, 0.1688112, -1.919449, 0, 0, 0, 1, 1,
-0.07263997, 0.1429667, -0.9221513, 0, 0, 0, 1, 1,
-0.0708141, -0.6421455, -3.090325, 0, 0, 0, 1, 1,
-0.06798817, 0.5810086, 0.9552655, 0, 0, 0, 1, 1,
-0.06571612, 1.664519, -0.2951699, 0, 0, 0, 1, 1,
-0.06352839, -0.4437593, -2.63013, 0, 0, 0, 1, 1,
-0.05934582, 0.6872442, -0.5905712, 1, 1, 1, 1, 1,
-0.05698419, -0.1297197, -0.9431996, 1, 1, 1, 1, 1,
-0.04991775, 1.405404, -0.6493377, 1, 1, 1, 1, 1,
-0.04912133, -0.3398453, -3.859095, 1, 1, 1, 1, 1,
-0.04604981, 0.2532425, -1.382357, 1, 1, 1, 1, 1,
-0.04590115, 0.6509141, -0.3662131, 1, 1, 1, 1, 1,
-0.04067472, 1.750968, -0.07913145, 1, 1, 1, 1, 1,
-0.03861694, -1.049984, -3.990824, 1, 1, 1, 1, 1,
-0.038134, 0.6961762, 1.037415, 1, 1, 1, 1, 1,
-0.03759182, -0.3144032, -4.654923, 1, 1, 1, 1, 1,
-0.036862, 1.038309, -1.172428, 1, 1, 1, 1, 1,
-0.03535142, -1.381243, -2.249602, 1, 1, 1, 1, 1,
-0.03357991, -0.9370803, -2.064446, 1, 1, 1, 1, 1,
-0.03136877, 0.9082285, -0.212326, 1, 1, 1, 1, 1,
-0.03055211, 0.3232279, -0.04190388, 1, 1, 1, 1, 1,
-0.02606972, 1.763394, -0.01137396, 0, 0, 1, 1, 1,
-0.0229733, 1.224861, 1.372407, 1, 0, 0, 1, 1,
-0.02002028, 1.032487, -0.1892682, 1, 0, 0, 1, 1,
-0.01577051, 1.075318, 1.413106, 1, 0, 0, 1, 1,
-0.01343917, 0.2621526, 1.219786, 1, 0, 0, 1, 1,
-0.01171912, 0.4544979, 0.3106768, 1, 0, 0, 1, 1,
-0.01162371, 0.4504051, -0.3228996, 0, 0, 0, 1, 1,
-0.01124524, 0.983408, 1.544323, 0, 0, 0, 1, 1,
-0.006561443, 0.6700074, 1.312086, 0, 0, 0, 1, 1,
-0.002043413, 0.3082504, -0.3401456, 0, 0, 0, 1, 1,
-6.144413e-05, 0.4544229, 0.2690866, 0, 0, 0, 1, 1,
0.002796965, 1.190307, 0.3001547, 0, 0, 0, 1, 1,
0.004199249, -0.07807419, 2.858243, 0, 0, 0, 1, 1,
0.006860477, -1.919354, 1.206662, 1, 1, 1, 1, 1,
0.01041326, -1.475241, 3.5104, 1, 1, 1, 1, 1,
0.01135442, 0.1810879, 1.896907, 1, 1, 1, 1, 1,
0.01679314, 1.076529, 1.546882, 1, 1, 1, 1, 1,
0.01804972, 2.130651, 0.1977669, 1, 1, 1, 1, 1,
0.02144195, -0.2611413, 3.735587, 1, 1, 1, 1, 1,
0.02201991, -0.6639589, 4.188636, 1, 1, 1, 1, 1,
0.02254211, 0.9994766, -1.428854, 1, 1, 1, 1, 1,
0.02439224, -1.999595, 3.783647, 1, 1, 1, 1, 1,
0.02499671, 0.6593748, 0.5649666, 1, 1, 1, 1, 1,
0.02567763, -0.4609853, 3.567137, 1, 1, 1, 1, 1,
0.02599348, 1.105824, -0.848132, 1, 1, 1, 1, 1,
0.02888105, 0.5404489, 1.59072, 1, 1, 1, 1, 1,
0.02909362, -0.1301111, 3.83334, 1, 1, 1, 1, 1,
0.03372641, 1.422466, 1.170903, 1, 1, 1, 1, 1,
0.03558745, 0.9564809, 0.8246332, 0, 0, 1, 1, 1,
0.03823227, 1.850284, 0.3408771, 1, 0, 0, 1, 1,
0.04131387, -0.8904881, 1.328046, 1, 0, 0, 1, 1,
0.04431319, -0.4829086, 1.534138, 1, 0, 0, 1, 1,
0.04628273, 1.000819, 1.560306, 1, 0, 0, 1, 1,
0.04867354, -1.905047, 4.220556, 1, 0, 0, 1, 1,
0.04942206, 0.7819505, -2.030726, 0, 0, 0, 1, 1,
0.05260085, -0.5074406, 2.131871, 0, 0, 0, 1, 1,
0.05488843, 0.06043833, 0.8599364, 0, 0, 0, 1, 1,
0.05556227, -1.225607, 3.326992, 0, 0, 0, 1, 1,
0.05600852, 0.7156929, -0.07957756, 0, 0, 0, 1, 1,
0.05901975, 1.765813, 0.011866, 0, 0, 0, 1, 1,
0.06152309, 0.7520451, -0.5121269, 0, 0, 0, 1, 1,
0.06295247, -0.8151971, 1.384917, 1, 1, 1, 1, 1,
0.06334797, -0.5930846, -0.03404532, 1, 1, 1, 1, 1,
0.06335672, -1.705848, 1.525858, 1, 1, 1, 1, 1,
0.06422649, 1.117407, -0.05251795, 1, 1, 1, 1, 1,
0.06594732, -1.429358, 2.770937, 1, 1, 1, 1, 1,
0.06859513, 1.056512, 2.456671, 1, 1, 1, 1, 1,
0.06966265, -0.3695813, 4.690034, 1, 1, 1, 1, 1,
0.07099649, -0.7408026, 1.666888, 1, 1, 1, 1, 1,
0.071902, 0.2831085, 0.4560505, 1, 1, 1, 1, 1,
0.07811479, 1.610662, 0.02975635, 1, 1, 1, 1, 1,
0.07952651, -0.8422824, 2.194266, 1, 1, 1, 1, 1,
0.08052898, -0.2196288, 3.134019, 1, 1, 1, 1, 1,
0.08529346, 1.376262, 0.3568473, 1, 1, 1, 1, 1,
0.09219401, 1.235107, -1.219271, 1, 1, 1, 1, 1,
0.09941859, 0.2324483, 0.2142351, 1, 1, 1, 1, 1,
0.1014487, 0.844148, 0.6142242, 0, 0, 1, 1, 1,
0.1034307, 0.9273938, 1.610948, 1, 0, 0, 1, 1,
0.1047843, 0.3154032, -0.7614543, 1, 0, 0, 1, 1,
0.1053993, -1.144756, 4.445516, 1, 0, 0, 1, 1,
0.1057772, -0.04362658, 3.197371, 1, 0, 0, 1, 1,
0.1073298, -0.3561186, 2.483944, 1, 0, 0, 1, 1,
0.1085848, -0.06229346, 1.222988, 0, 0, 0, 1, 1,
0.1085929, -0.7345865, 2.805195, 0, 0, 0, 1, 1,
0.1151192, 1.802728, 1.459843, 0, 0, 0, 1, 1,
0.115504, 0.7240185, 0.5638805, 0, 0, 0, 1, 1,
0.1175241, 0.2775169, 0.7809579, 0, 0, 0, 1, 1,
0.1181585, 0.5837662, 0.3079315, 0, 0, 0, 1, 1,
0.1184445, 2.165677, -0.2319146, 0, 0, 0, 1, 1,
0.1188774, 0.6370274, 1.842797, 1, 1, 1, 1, 1,
0.1292757, -0.9543574, 2.080773, 1, 1, 1, 1, 1,
0.1331078, 0.9531026, -0.9928236, 1, 1, 1, 1, 1,
0.1390249, -2.354603, 3.705691, 1, 1, 1, 1, 1,
0.1409243, 0.5794486, -2.191366, 1, 1, 1, 1, 1,
0.1419317, 0.1358993, 2.272223, 1, 1, 1, 1, 1,
0.1447943, -1.304263, 2.720417, 1, 1, 1, 1, 1,
0.1475556, -0.3657643, 2.527059, 1, 1, 1, 1, 1,
0.1514238, 0.5076635, 0.4143199, 1, 1, 1, 1, 1,
0.152203, 3.05227, 0.08083344, 1, 1, 1, 1, 1,
0.1548076, 0.8830889, 0.6555429, 1, 1, 1, 1, 1,
0.1595222, 0.4326592, 0.4885228, 1, 1, 1, 1, 1,
0.1608002, -1.324163, 2.990732, 1, 1, 1, 1, 1,
0.1609507, -1.552988, 1.649185, 1, 1, 1, 1, 1,
0.1615467, -0.9997922, 3.877732, 1, 1, 1, 1, 1,
0.1618483, 0.6449863, -0.2241854, 0, 0, 1, 1, 1,
0.1624499, 0.8341147, 0.4925461, 1, 0, 0, 1, 1,
0.1633535, 0.2062031, -0.2948204, 1, 0, 0, 1, 1,
0.1669873, 0.6595635, -0.5582567, 1, 0, 0, 1, 1,
0.1708867, -1.009368, 3.979334, 1, 0, 0, 1, 1,
0.1785408, 1.869588, 0.9112533, 1, 0, 0, 1, 1,
0.1793973, -0.8169744, 3.261674, 0, 0, 0, 1, 1,
0.1815059, 1.290185, 1.27886, 0, 0, 0, 1, 1,
0.1849442, 1.18064, -0.02597833, 0, 0, 0, 1, 1,
0.185618, -1.08152, 2.298386, 0, 0, 0, 1, 1,
0.1864706, 0.03730749, 2.572152, 0, 0, 0, 1, 1,
0.1880493, -0.7277971, 3.001265, 0, 0, 0, 1, 1,
0.1895169, -1.429455, 3.485232, 0, 0, 0, 1, 1,
0.191523, -0.4624928, 3.506126, 1, 1, 1, 1, 1,
0.195747, -2.064415, 2.361564, 1, 1, 1, 1, 1,
0.2023551, 1.361337, -1.083925, 1, 1, 1, 1, 1,
0.2026281, 0.6381152, 1.283649, 1, 1, 1, 1, 1,
0.2161833, 0.01571177, 1.785208, 1, 1, 1, 1, 1,
0.2163385, 1.425624, 0.5813788, 1, 1, 1, 1, 1,
0.2164935, 0.2634197, 0.6294534, 1, 1, 1, 1, 1,
0.2268664, 0.2575096, 0.676241, 1, 1, 1, 1, 1,
0.2285744, -0.2067868, 2.281353, 1, 1, 1, 1, 1,
0.2334788, -2.140176, 3.691223, 1, 1, 1, 1, 1,
0.2359485, -1.816546, 3.013583, 1, 1, 1, 1, 1,
0.2366754, -0.5458587, 3.651725, 1, 1, 1, 1, 1,
0.2378723, -1.029011, 2.223527, 1, 1, 1, 1, 1,
0.2381753, 1.217267, -0.8172377, 1, 1, 1, 1, 1,
0.2390909, -1.40354, 2.576137, 1, 1, 1, 1, 1,
0.241527, -0.8140852, 2.4171, 0, 0, 1, 1, 1,
0.2429542, 0.1280484, 0.5562868, 1, 0, 0, 1, 1,
0.2438002, -0.434929, 3.540056, 1, 0, 0, 1, 1,
0.2448992, 1.053833, -0.0459249, 1, 0, 0, 1, 1,
0.2462834, -0.07505645, 3.681178, 1, 0, 0, 1, 1,
0.2476733, 0.9979542, 0.7756323, 1, 0, 0, 1, 1,
0.2491376, -1.676307, 2.766933, 0, 0, 0, 1, 1,
0.2496044, -0.4961052, 2.549581, 0, 0, 0, 1, 1,
0.2512707, -0.07447495, 3.775449, 0, 0, 0, 1, 1,
0.2519864, 0.8159392, 0.5441203, 0, 0, 0, 1, 1,
0.2542098, -0.2317011, 2.433816, 0, 0, 0, 1, 1,
0.2556854, 0.9781438, 1.232319, 0, 0, 0, 1, 1,
0.2602387, 0.739931, 0.4950705, 0, 0, 0, 1, 1,
0.2605927, -0.3474831, 2.385172, 1, 1, 1, 1, 1,
0.2657218, 2.285991, 0.6627312, 1, 1, 1, 1, 1,
0.2668208, -0.8317187, 3.266848, 1, 1, 1, 1, 1,
0.2674953, -0.3969145, 2.488131, 1, 1, 1, 1, 1,
0.2719821, -0.1893094, 3.406912, 1, 1, 1, 1, 1,
0.2769722, -0.862828, 2.625841, 1, 1, 1, 1, 1,
0.2795686, -0.5531796, 1.841317, 1, 1, 1, 1, 1,
0.2797109, -0.9194577, 2.945243, 1, 1, 1, 1, 1,
0.2819313, 1.573687, 0.08212198, 1, 1, 1, 1, 1,
0.2869024, -0.365173, 2.038031, 1, 1, 1, 1, 1,
0.2875526, -0.7102519, 2.826806, 1, 1, 1, 1, 1,
0.289841, 0.2839023, -0.6025587, 1, 1, 1, 1, 1,
0.2898783, -0.0895358, -0.2263534, 1, 1, 1, 1, 1,
0.2904387, -0.6696506, 3.683481, 1, 1, 1, 1, 1,
0.2930076, 0.5054701, 0.4452332, 1, 1, 1, 1, 1,
0.2931413, -1.386786, 2.295808, 0, 0, 1, 1, 1,
0.2973896, -0.9523224, 2.481538, 1, 0, 0, 1, 1,
0.298715, -0.2339915, 1.359011, 1, 0, 0, 1, 1,
0.2996487, -0.9496008, 2.999386, 1, 0, 0, 1, 1,
0.2997791, -2.466753, 3.219255, 1, 0, 0, 1, 1,
0.299855, -0.2185687, 0.1993414, 1, 0, 0, 1, 1,
0.3012953, 1.01931, 2.35535, 0, 0, 0, 1, 1,
0.303993, -1.128715, 2.828496, 0, 0, 0, 1, 1,
0.3086529, 1.15602, 1.714885, 0, 0, 0, 1, 1,
0.3121915, -0.476381, 2.795362, 0, 0, 0, 1, 1,
0.3168629, -2.319323, 5.149443, 0, 0, 0, 1, 1,
0.3168741, -0.2455925, 2.34331, 0, 0, 0, 1, 1,
0.3194432, 1.049779, 0.9568324, 0, 0, 0, 1, 1,
0.3198365, 0.6716322, -0.4331176, 1, 1, 1, 1, 1,
0.3217911, -0.2421178, 1.41666, 1, 1, 1, 1, 1,
0.3229321, 0.7785508, -1.565973, 1, 1, 1, 1, 1,
0.3287758, 1.210611, -0.8169916, 1, 1, 1, 1, 1,
0.3313027, -2.32897, 3.658822, 1, 1, 1, 1, 1,
0.3319772, -0.9158139, 2.401148, 1, 1, 1, 1, 1,
0.3351283, -0.2686186, 2.96331, 1, 1, 1, 1, 1,
0.3356945, 0.08040724, 0.5987568, 1, 1, 1, 1, 1,
0.34652, -1.049657, 3.636765, 1, 1, 1, 1, 1,
0.3488284, -0.07676902, 0.2281102, 1, 1, 1, 1, 1,
0.3516413, -1.211321, 1.026764, 1, 1, 1, 1, 1,
0.3582338, -0.1388808, 1.383848, 1, 1, 1, 1, 1,
0.358961, 1.145306, 0.9291642, 1, 1, 1, 1, 1,
0.3613808, 0.3891341, 1.110038, 1, 1, 1, 1, 1,
0.3690031, 0.7901805, 0.6952991, 1, 1, 1, 1, 1,
0.3756563, 1.11711, -0.2613168, 0, 0, 1, 1, 1,
0.3771873, 0.8842402, 1.348258, 1, 0, 0, 1, 1,
0.3808641, 1.487837, -0.5161097, 1, 0, 0, 1, 1,
0.3828009, 1.279749, 0.1478499, 1, 0, 0, 1, 1,
0.3837459, -0.4636382, 0.6792787, 1, 0, 0, 1, 1,
0.384322, -2.470679, 3.539501, 1, 0, 0, 1, 1,
0.3844724, -0.5555244, 1.509796, 0, 0, 0, 1, 1,
0.3852954, 0.9624349, -0.2559159, 0, 0, 0, 1, 1,
0.3879661, -0.8352798, 3.720219, 0, 0, 0, 1, 1,
0.3927876, 0.1101034, 0.3863379, 0, 0, 0, 1, 1,
0.3958864, 0.5368093, 0.04624042, 0, 0, 0, 1, 1,
0.39693, -0.7554826, 1.739204, 0, 0, 0, 1, 1,
0.3988479, -1.076935, 2.415222, 0, 0, 0, 1, 1,
0.4010702, 0.05572382, 1.245628, 1, 1, 1, 1, 1,
0.4134556, -0.7481129, 2.347324, 1, 1, 1, 1, 1,
0.4145161, 0.1148248, 0.7116753, 1, 1, 1, 1, 1,
0.4153279, 0.4117323, 1.479655, 1, 1, 1, 1, 1,
0.4196582, 0.00950386, 1.281758, 1, 1, 1, 1, 1,
0.4197781, -0.883404, 3.37435, 1, 1, 1, 1, 1,
0.4215673, 0.6850664, 1.175175, 1, 1, 1, 1, 1,
0.4244047, 0.3218934, 0.004857324, 1, 1, 1, 1, 1,
0.4244252, 1.191702, 0.02313172, 1, 1, 1, 1, 1,
0.4252554, 1.494079, -1.47623, 1, 1, 1, 1, 1,
0.4291741, -0.4201035, 0.2201502, 1, 1, 1, 1, 1,
0.4311086, -1.257152, 1.865354, 1, 1, 1, 1, 1,
0.4345908, 0.5843707, 1.241806, 1, 1, 1, 1, 1,
0.4374991, -0.9377157, 2.298696, 1, 1, 1, 1, 1,
0.4401747, -1.083756, 1.921706, 1, 1, 1, 1, 1,
0.4422628, -0.1696593, 2.921623, 0, 0, 1, 1, 1,
0.4429511, 0.004667099, 2.447911, 1, 0, 0, 1, 1,
0.445533, -1.092788, 4.05511, 1, 0, 0, 1, 1,
0.4457374, -0.03076315, 2.174966, 1, 0, 0, 1, 1,
0.4484579, -1.089422, 2.7091, 1, 0, 0, 1, 1,
0.448794, -1.420816, 2.520627, 1, 0, 0, 1, 1,
0.4519762, 0.9734507, -1.255833, 0, 0, 0, 1, 1,
0.4570091, 0.5542693, 1.043126, 0, 0, 0, 1, 1,
0.4573704, 0.8702653, 0.07914685, 0, 0, 0, 1, 1,
0.4589025, -1.240027, 1.794593, 0, 0, 0, 1, 1,
0.4599883, 1.801314, -0.5372477, 0, 0, 0, 1, 1,
0.4638844, -0.7708651, 3.132016, 0, 0, 0, 1, 1,
0.4653285, 2.63604, -0.05998385, 0, 0, 0, 1, 1,
0.4674292, -1.793101, 2.519537, 1, 1, 1, 1, 1,
0.4696513, 0.02098311, 1.771009, 1, 1, 1, 1, 1,
0.4703422, -0.05704189, 0.9470965, 1, 1, 1, 1, 1,
0.4738555, 0.6302455, -0.4385763, 1, 1, 1, 1, 1,
0.4755924, 0.2419121, -1.577843, 1, 1, 1, 1, 1,
0.4759092, 0.3989024, 1.585125, 1, 1, 1, 1, 1,
0.4787399, 2.821829, 0.8044805, 1, 1, 1, 1, 1,
0.4801069, 0.6143417, 2.360606, 1, 1, 1, 1, 1,
0.4851166, -1.061408, 1.917667, 1, 1, 1, 1, 1,
0.4888885, 1.027146, 1.834286, 1, 1, 1, 1, 1,
0.4919659, 0.9593263, -0.1522255, 1, 1, 1, 1, 1,
0.4924962, -0.2796903, 0.7804731, 1, 1, 1, 1, 1,
0.4948166, 1.65977, 0.4281172, 1, 1, 1, 1, 1,
0.4981693, 0.5170416, 1.453699, 1, 1, 1, 1, 1,
0.5066534, 0.4994568, -0.4012938, 1, 1, 1, 1, 1,
0.5076306, -2.282053, 2.294375, 0, 0, 1, 1, 1,
0.5084045, 0.5999612, -0.7928607, 1, 0, 0, 1, 1,
0.5102276, -0.6701077, 2.986243, 1, 0, 0, 1, 1,
0.5176409, 0.5002548, 2.321737, 1, 0, 0, 1, 1,
0.5217524, -1.671611, 2.023811, 1, 0, 0, 1, 1,
0.5233093, 0.162053, 0.3564304, 1, 0, 0, 1, 1,
0.5237517, -0.9726736, 2.110577, 0, 0, 0, 1, 1,
0.5244949, -0.7170715, 3.390203, 0, 0, 0, 1, 1,
0.5270653, -1.30682, 2.811503, 0, 0, 0, 1, 1,
0.5427595, 1.607156, -0.02022423, 0, 0, 0, 1, 1,
0.5447206, 0.5040137, 1.160317, 0, 0, 0, 1, 1,
0.553208, 0.5526097, -0.9037463, 0, 0, 0, 1, 1,
0.5581764, 0.6805654, 0.8195044, 0, 0, 0, 1, 1,
0.5631824, -0.2822095, 2.243277, 1, 1, 1, 1, 1,
0.5651336, -0.1030073, 1.98068, 1, 1, 1, 1, 1,
0.5655201, 0.3787681, 2.277982, 1, 1, 1, 1, 1,
0.567562, 1.738795, 1.416945, 1, 1, 1, 1, 1,
0.5684579, -0.3753122, 1.527117, 1, 1, 1, 1, 1,
0.5713699, -0.1222834, 1.470419, 1, 1, 1, 1, 1,
0.5723483, -0.1319329, 1.395566, 1, 1, 1, 1, 1,
0.5729504, -0.8144048, 2.241726, 1, 1, 1, 1, 1,
0.5823563, -0.2761389, 1.102962, 1, 1, 1, 1, 1,
0.5855806, -0.4934436, 2.288108, 1, 1, 1, 1, 1,
0.5866271, -1.916206, 1.58653, 1, 1, 1, 1, 1,
0.5932951, 0.5531188, 1.489551, 1, 1, 1, 1, 1,
0.5946756, 1.213466, 0.941763, 1, 1, 1, 1, 1,
0.5974421, -1.166548, 3.151305, 1, 1, 1, 1, 1,
0.5989414, 1.297938, 2.182976, 1, 1, 1, 1, 1,
0.6045022, -1.68814, 2.146298, 0, 0, 1, 1, 1,
0.6052895, 0.05678989, 2.558674, 1, 0, 0, 1, 1,
0.6081141, -1.576736, 2.760073, 1, 0, 0, 1, 1,
0.6087053, 0.1024838, 1.644757, 1, 0, 0, 1, 1,
0.6087777, -1.083156, 2.35009, 1, 0, 0, 1, 1,
0.6099278, -0.3388216, 2.242968, 1, 0, 0, 1, 1,
0.6126596, -1.764614, 3.568185, 0, 0, 0, 1, 1,
0.6160831, -0.4983092, 2.193416, 0, 0, 0, 1, 1,
0.6167991, 0.6982136, 1.655783, 0, 0, 0, 1, 1,
0.617599, 0.5252676, 2.000428, 0, 0, 0, 1, 1,
0.6212687, 0.3938257, 2.972129, 0, 0, 0, 1, 1,
0.6302479, -0.2670371, 1.367983, 0, 0, 0, 1, 1,
0.6304402, -0.07303368, 0.5238637, 0, 0, 0, 1, 1,
0.6442501, -0.8626352, 1.793364, 1, 1, 1, 1, 1,
0.6540855, 0.6869583, 1.171027, 1, 1, 1, 1, 1,
0.6566287, 0.2802018, -0.5328766, 1, 1, 1, 1, 1,
0.6603888, -1.577404, 0.8999084, 1, 1, 1, 1, 1,
0.6629543, 1.536345, 1.535215, 1, 1, 1, 1, 1,
0.6682386, 0.7392176, 0.8192267, 1, 1, 1, 1, 1,
0.6685365, 0.5312252, 1.630877, 1, 1, 1, 1, 1,
0.670015, -0.006506898, 3.618271, 1, 1, 1, 1, 1,
0.6746061, 1.029944, 0.439305, 1, 1, 1, 1, 1,
0.6759266, 1.147233, -0.0171026, 1, 1, 1, 1, 1,
0.6771377, 0.4933075, 0.3068649, 1, 1, 1, 1, 1,
0.6802611, -0.9760372, 0.5060067, 1, 1, 1, 1, 1,
0.6803192, 0.8399554, -0.5172395, 1, 1, 1, 1, 1,
0.6815699, -0.5486974, 2.310549, 1, 1, 1, 1, 1,
0.6895905, -0.4994336, 2.656689, 1, 1, 1, 1, 1,
0.7003914, -1.276499, 2.015738, 0, 0, 1, 1, 1,
0.7053306, 0.3612485, 1.734586, 1, 0, 0, 1, 1,
0.7059788, 0.2757044, 0.6999109, 1, 0, 0, 1, 1,
0.7065645, -1.675437, 3.666589, 1, 0, 0, 1, 1,
0.7086067, -0.2139995, 0.3544722, 1, 0, 0, 1, 1,
0.7093732, -0.7608113, 0.9683186, 1, 0, 0, 1, 1,
0.7158259, -1.005078, 3.49706, 0, 0, 0, 1, 1,
0.7161905, 0.7598921, 3.928771, 0, 0, 0, 1, 1,
0.7202401, -0.8566581, 1.69231, 0, 0, 0, 1, 1,
0.7212388, -2.916076, 3.579021, 0, 0, 0, 1, 1,
0.7221993, -0.3527352, 1.696147, 0, 0, 0, 1, 1,
0.7226674, 1.242526, -0.9858141, 0, 0, 0, 1, 1,
0.723083, -0.6274866, 3.010831, 0, 0, 0, 1, 1,
0.7238489, -1.348541, 2.377174, 1, 1, 1, 1, 1,
0.7272978, -0.1498638, 2.309378, 1, 1, 1, 1, 1,
0.7274247, -0.851687, 1.348572, 1, 1, 1, 1, 1,
0.7291341, 0.0101679, 0.1487566, 1, 1, 1, 1, 1,
0.7375777, -1.387123, 3.712906, 1, 1, 1, 1, 1,
0.7478565, 0.8160331, 0.2166838, 1, 1, 1, 1, 1,
0.7512121, -1.711558, 2.688542, 1, 1, 1, 1, 1,
0.7519706, -1.519886, 3.25803, 1, 1, 1, 1, 1,
0.7529092, 0.4352119, -0.6332122, 1, 1, 1, 1, 1,
0.7595513, -0.6997216, 1.872603, 1, 1, 1, 1, 1,
0.7619755, 0.4295111, 1.581305, 1, 1, 1, 1, 1,
0.7638478, 0.6106533, 2.71107, 1, 1, 1, 1, 1,
0.7688375, 0.4192195, 2.289384, 1, 1, 1, 1, 1,
0.7696692, 0.6001303, 1.455588, 1, 1, 1, 1, 1,
0.773025, -0.1260606, 2.400538, 1, 1, 1, 1, 1,
0.7785364, 2.461837, 0.4852799, 0, 0, 1, 1, 1,
0.7827439, 0.2074227, 1.322247, 1, 0, 0, 1, 1,
0.783677, -0.6328186, 2.396019, 1, 0, 0, 1, 1,
0.7921292, 0.864032, 0.1660211, 1, 0, 0, 1, 1,
0.7949561, -0.6054363, 3.221118, 1, 0, 0, 1, 1,
0.8024929, -0.147236, 2.240925, 1, 0, 0, 1, 1,
0.8055267, -0.9165146, 2.272096, 0, 0, 0, 1, 1,
0.8057608, -0.406689, 1.460467, 0, 0, 0, 1, 1,
0.8072231, 1.536597, 1.475137, 0, 0, 0, 1, 1,
0.8074311, 0.9322703, -0.3519714, 0, 0, 0, 1, 1,
0.8093635, -2.022447, 2.730167, 0, 0, 0, 1, 1,
0.8112113, -0.3245743, 1.368381, 0, 0, 0, 1, 1,
0.8115641, 0.2979726, 0.2693472, 0, 0, 0, 1, 1,
0.814794, 1.339929, 1.759701, 1, 1, 1, 1, 1,
0.8168287, 0.8482649, 1.077005, 1, 1, 1, 1, 1,
0.8199802, 0.4315519, 0.5670967, 1, 1, 1, 1, 1,
0.8226729, -0.09186579, 3.405792, 1, 1, 1, 1, 1,
0.8279732, -0.7639405, 1.393773, 1, 1, 1, 1, 1,
0.829343, 0.4234402, 1.152664, 1, 1, 1, 1, 1,
0.8382466, 0.07518324, 1.851369, 1, 1, 1, 1, 1,
0.8419784, -0.5074741, 2.134636, 1, 1, 1, 1, 1,
0.8426306, 0.1419355, 0.1077338, 1, 1, 1, 1, 1,
0.8488866, -1.767307, 2.212746, 1, 1, 1, 1, 1,
0.8608963, -0.578663, 2.487394, 1, 1, 1, 1, 1,
0.8614315, -0.8178139, 1.961266, 1, 1, 1, 1, 1,
0.868224, -0.5763306, 4.408406, 1, 1, 1, 1, 1,
0.8711219, 0.958432, 0.3343287, 1, 1, 1, 1, 1,
0.8738685, -1.455814, 3.876165, 1, 1, 1, 1, 1,
0.886371, 0.4488907, 0.4471192, 0, 0, 1, 1, 1,
0.8909427, -0.8764915, 3.665755, 1, 0, 0, 1, 1,
0.8991562, -0.6671696, 2.288507, 1, 0, 0, 1, 1,
0.8993362, 0.04354709, 0.6591576, 1, 0, 0, 1, 1,
0.9026018, -1.344362, 4.218458, 1, 0, 0, 1, 1,
0.9036548, 1.315452, 0.727764, 1, 0, 0, 1, 1,
0.9038142, 2.330131, -1.121902, 0, 0, 0, 1, 1,
0.9194036, 0.7530743, -0.3772263, 0, 0, 0, 1, 1,
0.9196613, -0.4827736, 0.6343054, 0, 0, 0, 1, 1,
0.9257347, 1.395753, 2.328205, 0, 0, 0, 1, 1,
0.9292288, 0.6523424, 3.227886, 0, 0, 0, 1, 1,
0.9314299, -0.3040563, 2.021857, 0, 0, 0, 1, 1,
0.9365281, -0.9525874, 1.909982, 0, 0, 0, 1, 1,
0.9404861, -0.736057, 2.385177, 1, 1, 1, 1, 1,
0.947701, 0.07282506, 1.690413, 1, 1, 1, 1, 1,
0.9480476, 0.2400419, 1.099694, 1, 1, 1, 1, 1,
0.9535394, 0.01500903, 1.926138, 1, 1, 1, 1, 1,
0.9549905, -1.561231, 1.516098, 1, 1, 1, 1, 1,
0.9558688, -1.146573, 1.764193, 1, 1, 1, 1, 1,
0.9574751, -0.5041444, 1.743825, 1, 1, 1, 1, 1,
0.961468, -0.1888415, 2.461692, 1, 1, 1, 1, 1,
0.9618365, 0.9428489, 0.5642153, 1, 1, 1, 1, 1,
0.9633111, 0.832912, 0.7249, 1, 1, 1, 1, 1,
0.9692869, -1.888595, 1.702281, 1, 1, 1, 1, 1,
0.9835787, 1.863082, 0.2627322, 1, 1, 1, 1, 1,
0.9853811, -0.4314163, 1.351724, 1, 1, 1, 1, 1,
0.9882951, -0.669522, 2.283923, 1, 1, 1, 1, 1,
0.9895521, -0.3937834, 0.5870319, 1, 1, 1, 1, 1,
1.020555, -1.026722, 2.741989, 0, 0, 1, 1, 1,
1.023586, -0.4368946, 1.764632, 1, 0, 0, 1, 1,
1.024263, -1.844482, 3.325822, 1, 0, 0, 1, 1,
1.02657, -0.7423136, 1.809766, 1, 0, 0, 1, 1,
1.036688, -0.3719689, 1.438831, 1, 0, 0, 1, 1,
1.042966, 0.7986761, 3.339564, 1, 0, 0, 1, 1,
1.046667, -1.47462, 1.933675, 0, 0, 0, 1, 1,
1.051856, 0.147512, 3.165401, 0, 0, 0, 1, 1,
1.056421, 1.138797, 1.271927, 0, 0, 0, 1, 1,
1.056433, -0.4761536, 2.027073, 0, 0, 0, 1, 1,
1.057609, 0.576369, 3.475815, 0, 0, 0, 1, 1,
1.058468, -0.6969584, 2.251544, 0, 0, 0, 1, 1,
1.058876, 0.2329059, 0.1796803, 0, 0, 0, 1, 1,
1.060158, 0.333106, 2.426121, 1, 1, 1, 1, 1,
1.063658, -1.811475, 1.615545, 1, 1, 1, 1, 1,
1.065119, 0.1264223, 0.6960923, 1, 1, 1, 1, 1,
1.068342, 1.888644, 0.7847601, 1, 1, 1, 1, 1,
1.073079, -0.5662741, 3.040756, 1, 1, 1, 1, 1,
1.076709, 2.535617, -1.8251, 1, 1, 1, 1, 1,
1.083683, -0.2444647, 1.737119, 1, 1, 1, 1, 1,
1.088412, -0.7409033, 1.555524, 1, 1, 1, 1, 1,
1.089127, 0.2384394, 1.849279, 1, 1, 1, 1, 1,
1.090731, 0.1934485, 1.023039, 1, 1, 1, 1, 1,
1.093069, -1.126753, 2.893962, 1, 1, 1, 1, 1,
1.094835, -0.4799353, 2.394997, 1, 1, 1, 1, 1,
1.106721, 1.329853, 1.145444, 1, 1, 1, 1, 1,
1.109891, 1.620929, -0.8692713, 1, 1, 1, 1, 1,
1.110164, -0.5379649, 3.217736, 1, 1, 1, 1, 1,
1.112886, 0.9989179, 0.985581, 0, 0, 1, 1, 1,
1.12019, -0.1666014, -0.5544357, 1, 0, 0, 1, 1,
1.122342, 0.6745676, 2.829205, 1, 0, 0, 1, 1,
1.122592, 1.186828, 1.450626, 1, 0, 0, 1, 1,
1.126428, -1.158901, 3.728506, 1, 0, 0, 1, 1,
1.130743, 0.0271462, 1.107775, 1, 0, 0, 1, 1,
1.13496, 0.695958, 0.6330066, 0, 0, 0, 1, 1,
1.136239, -0.787245, 2.713791, 0, 0, 0, 1, 1,
1.138543, 1.162896, 1.339308, 0, 0, 0, 1, 1,
1.14981, 0.4416421, 1.831942, 0, 0, 0, 1, 1,
1.152085, 1.605117, 0.5913411, 0, 0, 0, 1, 1,
1.153573, 0.7965445, 0.6434984, 0, 0, 0, 1, 1,
1.154185, 0.06547146, 0.5347904, 0, 0, 0, 1, 1,
1.16435, -0.4588135, -0.7641096, 1, 1, 1, 1, 1,
1.170693, -0.2503504, -0.4861587, 1, 1, 1, 1, 1,
1.171932, 0.6468225, 0.779855, 1, 1, 1, 1, 1,
1.182165, -1.129528, 2.290511, 1, 1, 1, 1, 1,
1.188994, 0.06051839, 1.544019, 1, 1, 1, 1, 1,
1.189226, 2.800539, 0.643832, 1, 1, 1, 1, 1,
1.195362, -0.3411904, 0.6813438, 1, 1, 1, 1, 1,
1.201609, 0.7945046, 2.06723, 1, 1, 1, 1, 1,
1.202605, -0.240064, 1.934983, 1, 1, 1, 1, 1,
1.205447, -0.603606, 2.60187, 1, 1, 1, 1, 1,
1.206602, 0.4388867, 0.07779311, 1, 1, 1, 1, 1,
1.208038, 0.1820311, 1.207808, 1, 1, 1, 1, 1,
1.217128, 0.2304334, 2.007319, 1, 1, 1, 1, 1,
1.218415, 0.6005013, 1.361777, 1, 1, 1, 1, 1,
1.221071, -0.05187994, 0.3635306, 1, 1, 1, 1, 1,
1.227497, -0.6815644, 3.043396, 0, 0, 1, 1, 1,
1.232952, -0.6466808, 1.342162, 1, 0, 0, 1, 1,
1.237895, 1.811489, 0.3019336, 1, 0, 0, 1, 1,
1.238625, -1.578256, 2.198208, 1, 0, 0, 1, 1,
1.239381, -1.049963, 1.828338, 1, 0, 0, 1, 1,
1.249227, 0.8045078, 1.811061, 1, 0, 0, 1, 1,
1.250178, -1.017554, -0.2785652, 0, 0, 0, 1, 1,
1.257534, 1.306181, 1.463707, 0, 0, 0, 1, 1,
1.257838, -0.4852082, 3.125996, 0, 0, 0, 1, 1,
1.269824, 1.742856, 0.7311399, 0, 0, 0, 1, 1,
1.270212, -1.234106, 2.747874, 0, 0, 0, 1, 1,
1.277725, 2.021557, 1.491255, 0, 0, 0, 1, 1,
1.294749, -1.183694, 3.118691, 0, 0, 0, 1, 1,
1.299429, -0.5476328, 2.06834, 1, 1, 1, 1, 1,
1.3013, -0.8064712, 2.209533, 1, 1, 1, 1, 1,
1.316575, -1.380346, 2.534502, 1, 1, 1, 1, 1,
1.318785, 0.8160592, 0.8871464, 1, 1, 1, 1, 1,
1.319025, -1.585252, -0.1005347, 1, 1, 1, 1, 1,
1.320956, 0.7093933, 0.08253105, 1, 1, 1, 1, 1,
1.323549, -0.8505252, 2.398873, 1, 1, 1, 1, 1,
1.339571, -0.06237737, 1.124345, 1, 1, 1, 1, 1,
1.359651, -0.7491964, 0.8331097, 1, 1, 1, 1, 1,
1.360002, 1.398092, -1.103189, 1, 1, 1, 1, 1,
1.363363, -0.02157976, 1.026383, 1, 1, 1, 1, 1,
1.364604, -0.1077094, 0.5773697, 1, 1, 1, 1, 1,
1.366089, 0.4540026, -0.5198443, 1, 1, 1, 1, 1,
1.420769, 0.3968075, -0.4374391, 1, 1, 1, 1, 1,
1.42264, 0.8614903, 0.3305006, 1, 1, 1, 1, 1,
1.437153, -0.2498233, 0.2241159, 0, 0, 1, 1, 1,
1.438698, 0.6663569, 0.7893179, 1, 0, 0, 1, 1,
1.439458, -1.52946, 4.135555, 1, 0, 0, 1, 1,
1.448592, 1.795288, 0.01440347, 1, 0, 0, 1, 1,
1.451952, 0.6074525, 0.1273696, 1, 0, 0, 1, 1,
1.45682, 0.4140711, 1.718913, 1, 0, 0, 1, 1,
1.480045, -1.533865, 4.119626, 0, 0, 0, 1, 1,
1.485697, 1.93097, 2.158659, 0, 0, 0, 1, 1,
1.491002, -1.739706, 1.907648, 0, 0, 0, 1, 1,
1.492262, 0.2052073, 1.4509, 0, 0, 0, 1, 1,
1.498434, -1.956762, 2.441195, 0, 0, 0, 1, 1,
1.505341, 0.6557822, 1.219797, 0, 0, 0, 1, 1,
1.522304, 1.308573, 2.31942, 0, 0, 0, 1, 1,
1.531642, 0.4597907, 2.323846, 1, 1, 1, 1, 1,
1.542143, 0.7007784, 0.2200596, 1, 1, 1, 1, 1,
1.55507, 0.4800074, 1.662009, 1, 1, 1, 1, 1,
1.560432, -0.1954492, 2.418077, 1, 1, 1, 1, 1,
1.569139, -0.2982377, 2.205133, 1, 1, 1, 1, 1,
1.581076, 0.3218563, 2.705401, 1, 1, 1, 1, 1,
1.586965, -1.93519, 3.244827, 1, 1, 1, 1, 1,
1.590779, 1.931268, 2.359764, 1, 1, 1, 1, 1,
1.630124, 0.6508567, 1.713419, 1, 1, 1, 1, 1,
1.633623, -1.520182, 3.336251, 1, 1, 1, 1, 1,
1.645671, 0.2818061, 1.65404, 1, 1, 1, 1, 1,
1.648857, 0.7500854, 0.9151708, 1, 1, 1, 1, 1,
1.664193, -0.3986995, 1.297372, 1, 1, 1, 1, 1,
1.666375, 1.695974, 3.044607, 1, 1, 1, 1, 1,
1.666666, -1.182984, 2.002949, 1, 1, 1, 1, 1,
1.667613, 0.4559497, 0.6457893, 0, 0, 1, 1, 1,
1.674774, 0.2917731, 2.067117, 1, 0, 0, 1, 1,
1.686155, -1.098598, 0.07679369, 1, 0, 0, 1, 1,
1.702805, -0.4070407, 2.871069, 1, 0, 0, 1, 1,
1.723638, 0.8929848, 1.231173, 1, 0, 0, 1, 1,
1.730264, -0.2686951, -0.0928252, 1, 0, 0, 1, 1,
1.740873, 1.390243, 0.6396933, 0, 0, 0, 1, 1,
1.749506, 1.566048, 0.4213988, 0, 0, 0, 1, 1,
1.74969, 0.2360877, 2.438253, 0, 0, 0, 1, 1,
1.75384, -0.7249806, 0.997783, 0, 0, 0, 1, 1,
1.759849, 0.791459, 2.141244, 0, 0, 0, 1, 1,
1.778073, -1.357155, 2.209008, 0, 0, 0, 1, 1,
1.791575, 1.486555, 1.101324, 0, 0, 0, 1, 1,
1.851763, -0.6515708, 0.9024938, 1, 1, 1, 1, 1,
1.854453, -1.699521, 0.6787866, 1, 1, 1, 1, 1,
1.861987, 1.358916, 1.450227, 1, 1, 1, 1, 1,
1.880187, 0.2969438, 2.413414, 1, 1, 1, 1, 1,
1.88145, 0.05738525, 1.945778, 1, 1, 1, 1, 1,
1.893819, 0.7561129, 1.531568, 1, 1, 1, 1, 1,
1.913581, 0.2653986, 1.944279, 1, 1, 1, 1, 1,
1.926633, 0.3703197, 3.348702, 1, 1, 1, 1, 1,
1.936212, -1.829901, 2.592636, 1, 1, 1, 1, 1,
1.949986, 0.842815, 1.896014, 1, 1, 1, 1, 1,
1.953252, 0.3963919, 0.7541535, 1, 1, 1, 1, 1,
1.955804, -0.7432117, 2.200389, 1, 1, 1, 1, 1,
1.965638, -0.08804747, 0.5811734, 1, 1, 1, 1, 1,
1.96915, -0.01551533, 1.909986, 1, 1, 1, 1, 1,
1.982099, 1.04924, 1.726523, 1, 1, 1, 1, 1,
1.988284, 1.155325, 2.793932, 0, 0, 1, 1, 1,
2.010386, 1.193563, 0.1694191, 1, 0, 0, 1, 1,
2.039457, -0.3577326, 1.154951, 1, 0, 0, 1, 1,
2.061148, 0.6025428, 2.375256, 1, 0, 0, 1, 1,
2.094705, -0.8232563, 3.399279, 1, 0, 0, 1, 1,
2.111218, -0.264341, 2.865466, 1, 0, 0, 1, 1,
2.133563, 1.422988, 0.9145763, 0, 0, 0, 1, 1,
2.182295, -2.138078, 0.9199335, 0, 0, 0, 1, 1,
2.206213, -0.761948, 1.669116, 0, 0, 0, 1, 1,
2.269892, 0.8313414, 2.309453, 0, 0, 0, 1, 1,
2.288842, 0.03800476, 1.87956, 0, 0, 0, 1, 1,
2.351546, -0.2083562, 0.5459152, 0, 0, 0, 1, 1,
2.353402, -0.7480962, 1.992305, 0, 0, 0, 1, 1,
2.378285, 0.3681088, 2.053951, 1, 1, 1, 1, 1,
2.413239, 0.04702028, 2.745053, 1, 1, 1, 1, 1,
2.482477, 0.3155962, 2.4977, 1, 1, 1, 1, 1,
2.573402, 0.07983147, -1.099182, 1, 1, 1, 1, 1,
2.831772, 0.1720416, 2.716153, 1, 1, 1, 1, 1,
2.889506, 2.249024, 0.7036083, 1, 1, 1, 1, 1,
3.018083, -0.1747663, -0.5550799, 1, 1, 1, 1, 1
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
var radius = 9.751199;
var distance = 34.25067;
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
mvMatrix.translate( 0.4811275, 0.1167588, 0.2505314 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.25067);
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
