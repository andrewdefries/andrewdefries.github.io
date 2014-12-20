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
-2.971042, 1.270943, -0.1867284, 1, 0, 0, 1,
-2.827725, 0.4293867, -1.707799, 1, 0.007843138, 0, 1,
-2.700194, -0.1452418, -1.784865, 1, 0.01176471, 0, 1,
-2.585313, -0.6804256, -2.862805, 1, 0.01960784, 0, 1,
-2.565897, 0.2618198, -0.6746617, 1, 0.02352941, 0, 1,
-2.451605, -1.156191, -3.164598, 1, 0.03137255, 0, 1,
-2.398014, -0.9173616, -1.391674, 1, 0.03529412, 0, 1,
-2.383336, 0.4758707, -0.6511878, 1, 0.04313726, 0, 1,
-2.382928, -1.770221, 0.2887118, 1, 0.04705882, 0, 1,
-2.271194, 1.101714, 0.2214655, 1, 0.05490196, 0, 1,
-2.2555, 1.074439, 0.1729038, 1, 0.05882353, 0, 1,
-2.212919, -0.3119864, -2.480802, 1, 0.06666667, 0, 1,
-2.190518, -0.9370985, -3.107426, 1, 0.07058824, 0, 1,
-2.189571, 0.9606106, -0.9807396, 1, 0.07843138, 0, 1,
-2.18898, 1.276512, -2.233597, 1, 0.08235294, 0, 1,
-2.185652, -0.5639286, -0.1637859, 1, 0.09019608, 0, 1,
-2.150498, 0.07488006, -1.625631, 1, 0.09411765, 0, 1,
-2.09765, 3.068182, -0.8070266, 1, 0.1019608, 0, 1,
-2.089218, 1.475643, 0.6542209, 1, 0.1098039, 0, 1,
-2.059687, 1.061263, -0.892327, 1, 0.1137255, 0, 1,
-2.044796, -0.0154829, -1.416969, 1, 0.1215686, 0, 1,
-2.02804, 0.2211037, -2.09862, 1, 0.1254902, 0, 1,
-2.023565, 0.2203834, -2.411823, 1, 0.1333333, 0, 1,
-1.998972, -1.11997, -1.617765, 1, 0.1372549, 0, 1,
-1.984048, 0.9035171, 0.160242, 1, 0.145098, 0, 1,
-1.976247, -0.5177196, -1.662448, 1, 0.1490196, 0, 1,
-1.973086, -0.2084605, -2.563442, 1, 0.1568628, 0, 1,
-1.972184, 0.1996539, -1.03807, 1, 0.1607843, 0, 1,
-1.964736, 0.7890676, -0.6653949, 1, 0.1686275, 0, 1,
-1.961358, -0.007794681, -0.8020686, 1, 0.172549, 0, 1,
-1.953867, 0.7286718, -2.356785, 1, 0.1803922, 0, 1,
-1.937207, -0.6550735, -1.791706, 1, 0.1843137, 0, 1,
-1.933763, -0.02191991, -0.3263921, 1, 0.1921569, 0, 1,
-1.921074, 0.5362561, 0.882395, 1, 0.1960784, 0, 1,
-1.890569, 1.760703, -1.500319, 1, 0.2039216, 0, 1,
-1.85052, -1.504684, -3.413396, 1, 0.2117647, 0, 1,
-1.817059, 0.2771774, 0.1431648, 1, 0.2156863, 0, 1,
-1.816992, -0.2214749, -1.788313, 1, 0.2235294, 0, 1,
-1.816025, 1.622582, -1.743201, 1, 0.227451, 0, 1,
-1.807817, 0.5977477, -1.892899, 1, 0.2352941, 0, 1,
-1.78841, 0.3344587, -0.3144561, 1, 0.2392157, 0, 1,
-1.787652, -0.670037, -2.461642, 1, 0.2470588, 0, 1,
-1.776631, 1.673944, -1.493208, 1, 0.2509804, 0, 1,
-1.764257, -1.674785, -4.617742, 1, 0.2588235, 0, 1,
-1.759168, 1.199274, 0.7290921, 1, 0.2627451, 0, 1,
-1.755689, -2.376943, -3.769954, 1, 0.2705882, 0, 1,
-1.755059, 1.042692, -0.9237338, 1, 0.2745098, 0, 1,
-1.750551, -1.081464, -1.356852, 1, 0.282353, 0, 1,
-1.73712, 0.8689517, -2.667241, 1, 0.2862745, 0, 1,
-1.715206, -0.4501023, -0.3922727, 1, 0.2941177, 0, 1,
-1.686714, -0.01304706, -3.254053, 1, 0.3019608, 0, 1,
-1.672709, 2.178073, -2.002831, 1, 0.3058824, 0, 1,
-1.650534, -0.4348873, -4.35867, 1, 0.3137255, 0, 1,
-1.649646, 0.7786457, -2.523208, 1, 0.3176471, 0, 1,
-1.644433, -1.27228, -2.578527, 1, 0.3254902, 0, 1,
-1.620916, -0.1905728, -2.056845, 1, 0.3294118, 0, 1,
-1.602959, -1.082085, -1.471901, 1, 0.3372549, 0, 1,
-1.602231, 1.945643, 0.07299709, 1, 0.3411765, 0, 1,
-1.59454, -0.6675044, -1.492749, 1, 0.3490196, 0, 1,
-1.593033, -1.587545, -2.134741, 1, 0.3529412, 0, 1,
-1.577931, -0.1014205, -2.657647, 1, 0.3607843, 0, 1,
-1.554684, 0.05581146, 0.4144768, 1, 0.3647059, 0, 1,
-1.55447, 0.126435, -1.902979, 1, 0.372549, 0, 1,
-1.549969, -0.4593264, -0.5169441, 1, 0.3764706, 0, 1,
-1.548674, 0.1256751, -0.4602804, 1, 0.3843137, 0, 1,
-1.545474, 0.08990969, -1.613305, 1, 0.3882353, 0, 1,
-1.542619, 1.019794, -0.4500768, 1, 0.3960784, 0, 1,
-1.534882, 0.386315, -2.562197, 1, 0.4039216, 0, 1,
-1.53459, -0.9681058, -1.370892, 1, 0.4078431, 0, 1,
-1.515335, -0.5428606, -3.755759, 1, 0.4156863, 0, 1,
-1.51059, 0.9226623, 0.2618027, 1, 0.4196078, 0, 1,
-1.50861, 0.7348836, 0.1998497, 1, 0.427451, 0, 1,
-1.496057, -1.863315, -1.790699, 1, 0.4313726, 0, 1,
-1.472264, 0.9800497, -1.158597, 1, 0.4392157, 0, 1,
-1.470708, -0.6259063, -1.836016, 1, 0.4431373, 0, 1,
-1.465662, 0.5777627, -2.650543, 1, 0.4509804, 0, 1,
-1.465024, -0.134812, -2.107499, 1, 0.454902, 0, 1,
-1.464127, 0.6090789, -1.969737, 1, 0.4627451, 0, 1,
-1.44631, 0.4330797, -3.172037, 1, 0.4666667, 0, 1,
-1.4314, -1.021154, -3.242375, 1, 0.4745098, 0, 1,
-1.420777, 0.2960302, -2.450155, 1, 0.4784314, 0, 1,
-1.416546, -1.058285, -2.651927, 1, 0.4862745, 0, 1,
-1.412549, -0.3346923, -1.612469, 1, 0.4901961, 0, 1,
-1.401704, -0.6346691, -2.567806, 1, 0.4980392, 0, 1,
-1.36038, 0.05945747, -1.635579, 1, 0.5058824, 0, 1,
-1.35341, 0.5471954, -1.25144, 1, 0.509804, 0, 1,
-1.352361, 1.013281, -1.654141, 1, 0.5176471, 0, 1,
-1.351264, 0.14409, -1.795937, 1, 0.5215687, 0, 1,
-1.34181, -1.034016, -1.594816, 1, 0.5294118, 0, 1,
-1.340925, 0.2700826, -0.4060321, 1, 0.5333334, 0, 1,
-1.338945, -1.077719, -3.272192, 1, 0.5411765, 0, 1,
-1.328006, -0.3737545, -1.465529, 1, 0.5450981, 0, 1,
-1.327014, 0.1200289, -0.9900478, 1, 0.5529412, 0, 1,
-1.326316, 0.2758676, -2.67933, 1, 0.5568628, 0, 1,
-1.318932, 1.038201, -2.398885, 1, 0.5647059, 0, 1,
-1.312556, -1.528116, -3.306705, 1, 0.5686275, 0, 1,
-1.311014, -0.668538, -1.778555, 1, 0.5764706, 0, 1,
-1.289586, -1.365914, -3.255267, 1, 0.5803922, 0, 1,
-1.288886, -2.147725, -3.006345, 1, 0.5882353, 0, 1,
-1.284069, 0.290304, -1.031336, 1, 0.5921569, 0, 1,
-1.270718, -1.110276, -2.365561, 1, 0.6, 0, 1,
-1.268784, -1.085543, -0.7892007, 1, 0.6078432, 0, 1,
-1.265166, -0.5441749, -3.370125, 1, 0.6117647, 0, 1,
-1.265114, 0.1178999, -2.621466, 1, 0.6196079, 0, 1,
-1.264268, -0.5101023, -2.618537, 1, 0.6235294, 0, 1,
-1.25976, 0.1586479, -2.327979, 1, 0.6313726, 0, 1,
-1.253688, 2.273491, -0.7227997, 1, 0.6352941, 0, 1,
-1.25084, 0.6600869, -3.032341, 1, 0.6431373, 0, 1,
-1.250053, 0.5128832, -0.963913, 1, 0.6470588, 0, 1,
-1.248429, -0.6126781, -1.344803, 1, 0.654902, 0, 1,
-1.247977, -1.443336, -2.698007, 1, 0.6588235, 0, 1,
-1.244638, 2.253899, -0.7045407, 1, 0.6666667, 0, 1,
-1.242429, 0.4854981, -2.499985, 1, 0.6705883, 0, 1,
-1.237783, 0.7415857, -0.9455346, 1, 0.6784314, 0, 1,
-1.23679, 0.2516847, -0.3804449, 1, 0.682353, 0, 1,
-1.234036, -0.7539693, -1.692936, 1, 0.6901961, 0, 1,
-1.232747, 1.28836, 0.1716869, 1, 0.6941177, 0, 1,
-1.232508, 0.1070587, -0.7545153, 1, 0.7019608, 0, 1,
-1.230007, 0.02486364, -0.9096901, 1, 0.7098039, 0, 1,
-1.226269, -0.7152624, -1.771518, 1, 0.7137255, 0, 1,
-1.2249, -1.427971, -0.5149659, 1, 0.7215686, 0, 1,
-1.220618, -0.9392621, -2.876954, 1, 0.7254902, 0, 1,
-1.215102, 0.622066, -3.152728, 1, 0.7333333, 0, 1,
-1.21427, -0.03252603, -1.259246, 1, 0.7372549, 0, 1,
-1.20947, 0.05349844, -1.892993, 1, 0.7450981, 0, 1,
-1.20921, -0.2955029, -2.851422, 1, 0.7490196, 0, 1,
-1.203799, -0.5343531, -2.831143, 1, 0.7568628, 0, 1,
-1.194103, -1.062036, -3.267158, 1, 0.7607843, 0, 1,
-1.185047, 0.1335223, -3.216659, 1, 0.7686275, 0, 1,
-1.184635, -0.283327, -1.384954, 1, 0.772549, 0, 1,
-1.182512, 1.508164, 1.913231, 1, 0.7803922, 0, 1,
-1.175154, 0.7290404, -0.2853695, 1, 0.7843137, 0, 1,
-1.169316, 0.1006176, -0.5321851, 1, 0.7921569, 0, 1,
-1.159285, 0.3287333, -2.269078, 1, 0.7960784, 0, 1,
-1.156509, -0.1071915, -1.05656, 1, 0.8039216, 0, 1,
-1.155689, -1.222788, -2.598872, 1, 0.8117647, 0, 1,
-1.153343, 0.6738831, -1.601912, 1, 0.8156863, 0, 1,
-1.14882, 1.088571, -0.2373364, 1, 0.8235294, 0, 1,
-1.143948, -1.02999, -1.336122, 1, 0.827451, 0, 1,
-1.138125, -1.552091, -4.437401, 1, 0.8352941, 0, 1,
-1.130292, 0.459842, 0.4473721, 1, 0.8392157, 0, 1,
-1.128849, -0.6124398, -0.2060083, 1, 0.8470588, 0, 1,
-1.118899, 0.5459701, -0.9082951, 1, 0.8509804, 0, 1,
-1.115164, -0.3398757, -1.697063, 1, 0.8588235, 0, 1,
-1.113932, 0.7448897, -2.984621, 1, 0.8627451, 0, 1,
-1.111985, 0.2269251, -2.197349, 1, 0.8705882, 0, 1,
-1.107574, 0.8596636, -1.818786, 1, 0.8745098, 0, 1,
-1.104749, 0.4112047, -1.131862, 1, 0.8823529, 0, 1,
-1.081892, 1.717275, 1.140384, 1, 0.8862745, 0, 1,
-1.077919, 0.8488879, -0.9527535, 1, 0.8941177, 0, 1,
-1.07783, 0.8306991, -0.6701988, 1, 0.8980392, 0, 1,
-1.076519, 0.06345535, -0.4093812, 1, 0.9058824, 0, 1,
-1.074291, 1.774896, -2.873162, 1, 0.9137255, 0, 1,
-1.070952, -0.1143411, -2.963684, 1, 0.9176471, 0, 1,
-1.068594, 0.2594733, -1.295322, 1, 0.9254902, 0, 1,
-1.068185, -1.246902, -4.00716, 1, 0.9294118, 0, 1,
-1.058869, -0.1923755, -2.643383, 1, 0.9372549, 0, 1,
-1.057118, 0.1063836, -0.4641116, 1, 0.9411765, 0, 1,
-1.05558, 0.2062982, -1.008508, 1, 0.9490196, 0, 1,
-1.04914, -0.8528189, -2.55146, 1, 0.9529412, 0, 1,
-1.047752, 2.537898, -1.462832, 1, 0.9607843, 0, 1,
-1.043176, 0.9362175, -2.218733, 1, 0.9647059, 0, 1,
-1.041194, 0.7651728, -1.151596, 1, 0.972549, 0, 1,
-1.036004, 0.08406171, -0.8289221, 1, 0.9764706, 0, 1,
-1.035871, -0.606774, -0.7800307, 1, 0.9843137, 0, 1,
-1.031826, -0.5001285, -1.94019, 1, 0.9882353, 0, 1,
-1.030441, 0.3227768, -1.184424, 1, 0.9960784, 0, 1,
-1.027181, 1.439022, -1.585012, 0.9960784, 1, 0, 1,
-1.023525, 0.7124172, -1.237203, 0.9921569, 1, 0, 1,
-0.9969891, 0.5156767, -1.968112, 0.9843137, 1, 0, 1,
-0.9966012, -1.677549, -2.404332, 0.9803922, 1, 0, 1,
-0.9960498, -0.274099, -1.999612, 0.972549, 1, 0, 1,
-0.9880801, -0.4621854, -1.633393, 0.9686275, 1, 0, 1,
-0.9831338, 0.04522632, -0.5043191, 0.9607843, 1, 0, 1,
-0.9712514, -0.08128349, -3.432878, 0.9568627, 1, 0, 1,
-0.9708933, 1.302434, -0.1821654, 0.9490196, 1, 0, 1,
-0.9680107, -0.4397495, -0.4104682, 0.945098, 1, 0, 1,
-0.9673682, 1.582898, -1.189078, 0.9372549, 1, 0, 1,
-0.953665, -2.28864, -2.829038, 0.9333333, 1, 0, 1,
-0.9515801, 1.681678, -0.5397645, 0.9254902, 1, 0, 1,
-0.9450192, 1.690596, 0.5652158, 0.9215686, 1, 0, 1,
-0.9428253, 0.5735571, -0.630289, 0.9137255, 1, 0, 1,
-0.9356887, 1.006905, 0.6947206, 0.9098039, 1, 0, 1,
-0.9354699, -0.04605747, -1.983062, 0.9019608, 1, 0, 1,
-0.9335837, -1.275559, -1.488482, 0.8941177, 1, 0, 1,
-0.9316661, 0.01356228, -1.263586, 0.8901961, 1, 0, 1,
-0.9286683, -0.2784604, -1.878042, 0.8823529, 1, 0, 1,
-0.9279876, 2.20172, -2.21278, 0.8784314, 1, 0, 1,
-0.9236734, -0.3813451, -1.478965, 0.8705882, 1, 0, 1,
-0.9168834, -2.087047, -1.935091, 0.8666667, 1, 0, 1,
-0.9164075, 0.06195851, 0.04104615, 0.8588235, 1, 0, 1,
-0.9082006, 1.465796, -0.4200001, 0.854902, 1, 0, 1,
-0.9069861, 0.4685737, 0.8827094, 0.8470588, 1, 0, 1,
-0.8882821, 0.3311642, -1.885124, 0.8431373, 1, 0, 1,
-0.8854551, -0.6143469, -0.7795472, 0.8352941, 1, 0, 1,
-0.8798043, 1.647455, 0.4618889, 0.8313726, 1, 0, 1,
-0.8749772, 0.5796398, -1.043445, 0.8235294, 1, 0, 1,
-0.8660979, 0.1237438, -1.743436, 0.8196079, 1, 0, 1,
-0.8605272, -0.5224331, -0.05684802, 0.8117647, 1, 0, 1,
-0.8528762, -1.181555, -3.225204, 0.8078431, 1, 0, 1,
-0.850315, 1.818645, 1.655765, 0.8, 1, 0, 1,
-0.8502173, -2.30466, -3.703358, 0.7921569, 1, 0, 1,
-0.8435643, 1.541009, -0.2678955, 0.7882353, 1, 0, 1,
-0.8430035, 0.7720217, 1.5048, 0.7803922, 1, 0, 1,
-0.8344803, -1.695444, -3.674216, 0.7764706, 1, 0, 1,
-0.8303311, 0.3043817, -2.114963, 0.7686275, 1, 0, 1,
-0.8298441, 0.1451038, -1.249863, 0.7647059, 1, 0, 1,
-0.8295934, -0.169066, -2.223426, 0.7568628, 1, 0, 1,
-0.8270022, 1.697939, -0.005565328, 0.7529412, 1, 0, 1,
-0.8199898, 0.158928, -0.6033242, 0.7450981, 1, 0, 1,
-0.8199875, 2.041955, -0.2454989, 0.7411765, 1, 0, 1,
-0.8147533, -0.5781122, -1.09115, 0.7333333, 1, 0, 1,
-0.8122991, -0.4599505, -1.411468, 0.7294118, 1, 0, 1,
-0.8014449, -1.099952, -3.085773, 0.7215686, 1, 0, 1,
-0.7996373, 0.0300823, -3.799078, 0.7176471, 1, 0, 1,
-0.7989513, -1.761566, -1.848042, 0.7098039, 1, 0, 1,
-0.7972568, 0.3638597, -0.2387321, 0.7058824, 1, 0, 1,
-0.7845491, -1.988452, -2.905392, 0.6980392, 1, 0, 1,
-0.783388, -1.733381, -4.610022, 0.6901961, 1, 0, 1,
-0.7812995, 1.55865, 0.008295942, 0.6862745, 1, 0, 1,
-0.7811247, -0.9372142, -2.642154, 0.6784314, 1, 0, 1,
-0.7769879, 0.2029282, -2.524319, 0.6745098, 1, 0, 1,
-0.7736436, 0.1102661, -1.777422, 0.6666667, 1, 0, 1,
-0.7688124, -0.1646177, -4.568706, 0.6627451, 1, 0, 1,
-0.7639384, -2.086507, -2.466466, 0.654902, 1, 0, 1,
-0.759402, 0.7317814, -0.7159583, 0.6509804, 1, 0, 1,
-0.7581763, 0.5084186, -1.694777, 0.6431373, 1, 0, 1,
-0.75373, 1.56965, -1.00283, 0.6392157, 1, 0, 1,
-0.7495185, -0.5987189, -4.4331, 0.6313726, 1, 0, 1,
-0.7473839, -0.360543, -2.15267, 0.627451, 1, 0, 1,
-0.7400216, 1.076686, -1.097373, 0.6196079, 1, 0, 1,
-0.739892, 0.3582536, -1.306908, 0.6156863, 1, 0, 1,
-0.7393096, -1.494608, -3.620287, 0.6078432, 1, 0, 1,
-0.7369109, 0.3245365, -2.00862, 0.6039216, 1, 0, 1,
-0.7365292, 1.497141, 0.3982121, 0.5960785, 1, 0, 1,
-0.7305603, -0.4839187, -2.553836, 0.5882353, 1, 0, 1,
-0.7179803, -0.6599575, -2.587833, 0.5843138, 1, 0, 1,
-0.7149004, 0.5766867, 0.9678991, 0.5764706, 1, 0, 1,
-0.7114646, -0.2188643, -2.089151, 0.572549, 1, 0, 1,
-0.7108235, -2.529572, -3.387224, 0.5647059, 1, 0, 1,
-0.7104862, -0.5679775, -3.437656, 0.5607843, 1, 0, 1,
-0.7097823, 0.779582, -2.055587, 0.5529412, 1, 0, 1,
-0.7096727, -1.01593, -1.397289, 0.5490196, 1, 0, 1,
-0.706611, -0.2619961, -1.58079, 0.5411765, 1, 0, 1,
-0.7057322, -0.2653112, -2.119221, 0.5372549, 1, 0, 1,
-0.7005885, 1.083291, -0.4360977, 0.5294118, 1, 0, 1,
-0.6999463, 1.207623, -0.1996686, 0.5254902, 1, 0, 1,
-0.6983413, 0.2149231, -1.936897, 0.5176471, 1, 0, 1,
-0.6974777, 0.4160129, -1.44033, 0.5137255, 1, 0, 1,
-0.6907665, 1.242686, -0.2240297, 0.5058824, 1, 0, 1,
-0.6884318, 2.073653, -1.535306, 0.5019608, 1, 0, 1,
-0.6724885, -0.9437019, -1.9041, 0.4941176, 1, 0, 1,
-0.6683813, -3.201745, -2.440461, 0.4862745, 1, 0, 1,
-0.6681812, 0.1231387, -1.861782, 0.4823529, 1, 0, 1,
-0.6680878, -1.905065, -2.109291, 0.4745098, 1, 0, 1,
-0.6670205, 1.123737, 1.258969, 0.4705882, 1, 0, 1,
-0.6629058, 0.828559, -1.253587, 0.4627451, 1, 0, 1,
-0.6605476, 0.5255544, -0.2312953, 0.4588235, 1, 0, 1,
-0.6600283, -1.168904, -4.22936, 0.4509804, 1, 0, 1,
-0.6596715, -1.529807, -2.714913, 0.4470588, 1, 0, 1,
-0.6532676, 0.09715078, -2.487576, 0.4392157, 1, 0, 1,
-0.6502944, 1.21021, -0.5852929, 0.4352941, 1, 0, 1,
-0.6424889, -0.1995881, -1.69208, 0.427451, 1, 0, 1,
-0.6423745, -0.003309112, -0.4662151, 0.4235294, 1, 0, 1,
-0.6365675, 0.07766265, -2.704746, 0.4156863, 1, 0, 1,
-0.6362497, -0.4140404, -2.00259, 0.4117647, 1, 0, 1,
-0.6302059, -0.9818377, -1.98164, 0.4039216, 1, 0, 1,
-0.6294094, 1.773997, -0.1226062, 0.3960784, 1, 0, 1,
-0.6247464, 0.047898, -0.2835983, 0.3921569, 1, 0, 1,
-0.6234301, 0.3759162, 0.4105051, 0.3843137, 1, 0, 1,
-0.6214491, 1.950685, 0.7060902, 0.3803922, 1, 0, 1,
-0.6183417, -0.281823, -0.9383622, 0.372549, 1, 0, 1,
-0.61695, 0.4505346, -1.174644, 0.3686275, 1, 0, 1,
-0.6166313, 0.04247568, -1.108048, 0.3607843, 1, 0, 1,
-0.615365, -0.8870972, -4.121075, 0.3568628, 1, 0, 1,
-0.6103619, 0.1092839, -3.94745, 0.3490196, 1, 0, 1,
-0.6099801, -1.214578, -3.469822, 0.345098, 1, 0, 1,
-0.6090887, -1.969106, -3.892642, 0.3372549, 1, 0, 1,
-0.6053128, -0.7785692, -1.435807, 0.3333333, 1, 0, 1,
-0.600966, -0.5168847, -1.685441, 0.3254902, 1, 0, 1,
-0.5956194, 0.7866766, -0.7807854, 0.3215686, 1, 0, 1,
-0.5951555, -0.4358472, -2.134298, 0.3137255, 1, 0, 1,
-0.5912064, 0.3716569, 0.1294922, 0.3098039, 1, 0, 1,
-0.5884918, 0.305494, -1.196807, 0.3019608, 1, 0, 1,
-0.5854661, -0.1221105, -1.088166, 0.2941177, 1, 0, 1,
-0.582121, -0.495449, -2.562811, 0.2901961, 1, 0, 1,
-0.5804887, -0.8064866, -2.181669, 0.282353, 1, 0, 1,
-0.579411, -0.4825755, -0.8044134, 0.2784314, 1, 0, 1,
-0.5783304, -0.50445, -4.355056, 0.2705882, 1, 0, 1,
-0.5714126, 0.3212361, -2.990491, 0.2666667, 1, 0, 1,
-0.5699481, -0.3382718, -3.614783, 0.2588235, 1, 0, 1,
-0.5674138, -1.213015, -3.24102, 0.254902, 1, 0, 1,
-0.5671634, -1.831534, -2.436808, 0.2470588, 1, 0, 1,
-0.5596601, -0.9480107, -3.554916, 0.2431373, 1, 0, 1,
-0.5594249, -2.354887, -2.660616, 0.2352941, 1, 0, 1,
-0.5532779, 1.928262, 0.9780834, 0.2313726, 1, 0, 1,
-0.5515555, 0.3831156, -0.5400831, 0.2235294, 1, 0, 1,
-0.5509053, 1.259084, 0.7047719, 0.2196078, 1, 0, 1,
-0.5496485, 1.321486, 0.7928576, 0.2117647, 1, 0, 1,
-0.5484101, 0.4349134, -0.267624, 0.2078431, 1, 0, 1,
-0.5455198, -2.164383, -2.601958, 0.2, 1, 0, 1,
-0.5385809, -1.018229, -3.591042, 0.1921569, 1, 0, 1,
-0.5380381, 0.886246, -0.1707251, 0.1882353, 1, 0, 1,
-0.5372141, 1.74932, -0.1096286, 0.1803922, 1, 0, 1,
-0.5348989, -0.1064411, -0.7567425, 0.1764706, 1, 0, 1,
-0.5343704, 0.4281456, -2.964466, 0.1686275, 1, 0, 1,
-0.5327091, 0.6470843, -1.652456, 0.1647059, 1, 0, 1,
-0.5319543, 0.1897855, -1.481809, 0.1568628, 1, 0, 1,
-0.5278009, 0.6400007, 0.6643987, 0.1529412, 1, 0, 1,
-0.52375, 0.4598844, -1.435611, 0.145098, 1, 0, 1,
-0.5117975, -1.084164, -2.369261, 0.1411765, 1, 0, 1,
-0.5116336, 0.0516707, -1.533468, 0.1333333, 1, 0, 1,
-0.5094266, 1.128075, -0.6896445, 0.1294118, 1, 0, 1,
-0.5052366, -0.8242261, -2.499667, 0.1215686, 1, 0, 1,
-0.5026345, -0.1309708, -3.048352, 0.1176471, 1, 0, 1,
-0.5025865, -0.5555045, -3.982922, 0.1098039, 1, 0, 1,
-0.5003743, -1.779632, -2.734755, 0.1058824, 1, 0, 1,
-0.4972171, -1.708598, -3.86895, 0.09803922, 1, 0, 1,
-0.4961817, 0.06083577, -0.2846927, 0.09019608, 1, 0, 1,
-0.4930933, -0.04104698, -0.7202958, 0.08627451, 1, 0, 1,
-0.4930467, -0.331887, -2.219295, 0.07843138, 1, 0, 1,
-0.4914164, -1.020548, -1.101617, 0.07450981, 1, 0, 1,
-0.488548, 1.624108, -0.03150817, 0.06666667, 1, 0, 1,
-0.4806886, -0.3899495, -1.2265, 0.0627451, 1, 0, 1,
-0.4795013, -0.4615259, -2.324403, 0.05490196, 1, 0, 1,
-0.4692057, -0.05725391, -1.018913, 0.05098039, 1, 0, 1,
-0.4680427, -0.2645029, -2.006821, 0.04313726, 1, 0, 1,
-0.4667132, -0.3497925, -2.084367, 0.03921569, 1, 0, 1,
-0.4658162, 0.7112629, -0.3276381, 0.03137255, 1, 0, 1,
-0.4645937, 1.574546, 0.1828597, 0.02745098, 1, 0, 1,
-0.4639419, 1.871882, 0.3965572, 0.01960784, 1, 0, 1,
-0.4594946, 1.217365, -1.685699, 0.01568628, 1, 0, 1,
-0.4594736, 0.1953271, 0.3891558, 0.007843138, 1, 0, 1,
-0.4566098, -0.1579372, -1.982651, 0.003921569, 1, 0, 1,
-0.4561672, 0.006618856, -0.600485, 0, 1, 0.003921569, 1,
-0.4532819, 0.2463412, -1.178449, 0, 1, 0.01176471, 1,
-0.4493069, -1.029301, -3.774662, 0, 1, 0.01568628, 1,
-0.4482741, 0.08328149, -1.10674, 0, 1, 0.02352941, 1,
-0.4480845, -0.9649625, -3.253402, 0, 1, 0.02745098, 1,
-0.4436358, 0.4886433, -0.5530918, 0, 1, 0.03529412, 1,
-0.4433323, 0.8851377, -1.912937, 0, 1, 0.03921569, 1,
-0.4419849, 0.7190162, -1.039364, 0, 1, 0.04705882, 1,
-0.4327647, 0.7380292, 0.07638557, 0, 1, 0.05098039, 1,
-0.4317739, 0.09839828, -1.644352, 0, 1, 0.05882353, 1,
-0.4314775, -1.066955, -2.988554, 0, 1, 0.0627451, 1,
-0.4300056, -0.1911007, -2.986162, 0, 1, 0.07058824, 1,
-0.4289928, 0.6015882, 0.4774702, 0, 1, 0.07450981, 1,
-0.4276739, 0.4128138, 0.6687557, 0, 1, 0.08235294, 1,
-0.424695, -1.072473, -2.547126, 0, 1, 0.08627451, 1,
-0.4223531, -1.195225, -4.495594, 0, 1, 0.09411765, 1,
-0.4192347, 1.581412, -1.488893, 0, 1, 0.1019608, 1,
-0.41784, 0.7821082, 0.001172903, 0, 1, 0.1058824, 1,
-0.4154573, 2.360961, 1.522259, 0, 1, 0.1137255, 1,
-0.4145298, -1.316078, -4.815291, 0, 1, 0.1176471, 1,
-0.4143859, 0.2948492, -0.6942584, 0, 1, 0.1254902, 1,
-0.4131812, -0.3226642, -2.55438, 0, 1, 0.1294118, 1,
-0.4115172, -1.227779, -2.049116, 0, 1, 0.1372549, 1,
-0.4114245, -0.2245067, -1.701121, 0, 1, 0.1411765, 1,
-0.4037659, -0.2457167, -3.610997, 0, 1, 0.1490196, 1,
-0.3982955, -1.089574, -3.346171, 0, 1, 0.1529412, 1,
-0.3978875, 0.2703744, 0.4124994, 0, 1, 0.1607843, 1,
-0.3976286, 1.492666, 0.2299075, 0, 1, 0.1647059, 1,
-0.3951616, 1.340101, -0.4442525, 0, 1, 0.172549, 1,
-0.3920694, 0.5660487, -1.619758, 0, 1, 0.1764706, 1,
-0.3916477, 0.6071016, -1.232205, 0, 1, 0.1843137, 1,
-0.3877192, 0.8022013, -0.7396419, 0, 1, 0.1882353, 1,
-0.3847021, -0.1691291, -2.136192, 0, 1, 0.1960784, 1,
-0.3764975, -1.373081, -4.991181, 0, 1, 0.2039216, 1,
-0.3724229, 0.8755505, 0.6776515, 0, 1, 0.2078431, 1,
-0.37011, -0.3764604, -1.785354, 0, 1, 0.2156863, 1,
-0.3650933, -0.1728189, -2.249229, 0, 1, 0.2196078, 1,
-0.3642878, 1.036496, 0.2871988, 0, 1, 0.227451, 1,
-0.363201, 1.129897, 0.3328706, 0, 1, 0.2313726, 1,
-0.3622319, -1.631961, -4.007834, 0, 1, 0.2392157, 1,
-0.3608777, 0.6086078, -0.1039152, 0, 1, 0.2431373, 1,
-0.3582647, 0.3646002, -0.8467494, 0, 1, 0.2509804, 1,
-0.3530853, 0.3689249, -0.784061, 0, 1, 0.254902, 1,
-0.3477565, 0.7378997, -1.670025, 0, 1, 0.2627451, 1,
-0.3451455, 1.740322, 0.2895238, 0, 1, 0.2666667, 1,
-0.3442558, 1.53565, 0.9666903, 0, 1, 0.2745098, 1,
-0.3435675, -1.130309, -1.150714, 0, 1, 0.2784314, 1,
-0.339134, 2.354755, 0.2771213, 0, 1, 0.2862745, 1,
-0.3347456, 0.2692166, -1.266516, 0, 1, 0.2901961, 1,
-0.3310584, -0.1165861, -2.040407, 0, 1, 0.2980392, 1,
-0.3303055, 0.2383481, 0.01460026, 0, 1, 0.3058824, 1,
-0.3294927, 0.817555, 1.226031, 0, 1, 0.3098039, 1,
-0.3292717, 0.106207, -1.027857, 0, 1, 0.3176471, 1,
-0.3284283, 0.3131831, -0.4530256, 0, 1, 0.3215686, 1,
-0.3279555, -0.6249331, -1.767952, 0, 1, 0.3294118, 1,
-0.3228552, 0.02073679, -1.556096, 0, 1, 0.3333333, 1,
-0.3208262, -0.244188, -1.714588, 0, 1, 0.3411765, 1,
-0.3174246, 1.804781, -0.219486, 0, 1, 0.345098, 1,
-0.3140712, 1.592568, -2.072523, 0, 1, 0.3529412, 1,
-0.3112258, 0.399778, -1.037056, 0, 1, 0.3568628, 1,
-0.310701, -0.787774, -1.276873, 0, 1, 0.3647059, 1,
-0.3090687, 0.3023988, 0.2476042, 0, 1, 0.3686275, 1,
-0.307279, -0.6955789, -2.072169, 0, 1, 0.3764706, 1,
-0.3041799, 0.91095, 0.09043097, 0, 1, 0.3803922, 1,
-0.3000555, -0.7324024, -3.7328, 0, 1, 0.3882353, 1,
-0.2969826, -0.4655794, -1.697841, 0, 1, 0.3921569, 1,
-0.2961112, -2.268492, -3.174599, 0, 1, 0.4, 1,
-0.2935705, 0.769638, -1.26428, 0, 1, 0.4078431, 1,
-0.2924343, -0.005963407, -1.687147, 0, 1, 0.4117647, 1,
-0.2901129, 1.147992, -0.6556499, 0, 1, 0.4196078, 1,
-0.2802998, -0.6276215, -2.768687, 0, 1, 0.4235294, 1,
-0.2799592, 0.6727571, -0.2292132, 0, 1, 0.4313726, 1,
-0.2762833, -1.575879, -3.198126, 0, 1, 0.4352941, 1,
-0.2693151, -0.6640347, -3.190358, 0, 1, 0.4431373, 1,
-0.2664565, -1.941951, -4.406744, 0, 1, 0.4470588, 1,
-0.2611194, 1.554889, 0.2921617, 0, 1, 0.454902, 1,
-0.2606879, 1.196594, -1.524643, 0, 1, 0.4588235, 1,
-0.2605793, 0.9535671, -1.040956, 0, 1, 0.4666667, 1,
-0.2573532, -1.055189, -2.611423, 0, 1, 0.4705882, 1,
-0.2500342, -0.9061037, -2.73224, 0, 1, 0.4784314, 1,
-0.2476797, 0.7850724, -0.5877519, 0, 1, 0.4823529, 1,
-0.2410937, -1.327189, -2.436196, 0, 1, 0.4901961, 1,
-0.237732, 1.169642, -1.121597, 0, 1, 0.4941176, 1,
-0.2359141, 1.918027, -0.3386457, 0, 1, 0.5019608, 1,
-0.2355753, 1.877233, -0.2210853, 0, 1, 0.509804, 1,
-0.233038, 0.5500288, -0.6489359, 0, 1, 0.5137255, 1,
-0.2148284, 0.2471434, -0.8109434, 0, 1, 0.5215687, 1,
-0.2087852, 0.6387156, 0.3213336, 0, 1, 0.5254902, 1,
-0.2080167, 1.593163, -0.4514169, 0, 1, 0.5333334, 1,
-0.2070367, -0.8411982, -2.915375, 0, 1, 0.5372549, 1,
-0.2070356, 1.046323, 0.432345, 0, 1, 0.5450981, 1,
-0.1987435, 0.275895, -1.284616, 0, 1, 0.5490196, 1,
-0.1972152, 0.8603877, -1.703781, 0, 1, 0.5568628, 1,
-0.197115, -0.06687545, -1.279719, 0, 1, 0.5607843, 1,
-0.1965178, 0.401565, -1.906872, 0, 1, 0.5686275, 1,
-0.1960102, 0.6364906, -0.6903965, 0, 1, 0.572549, 1,
-0.1897168, 0.8012688, -0.4122814, 0, 1, 0.5803922, 1,
-0.1894058, -0.70994, -2.980422, 0, 1, 0.5843138, 1,
-0.1870998, 0.01530762, 0.6165419, 0, 1, 0.5921569, 1,
-0.1868935, -0.7110057, -1.322573, 0, 1, 0.5960785, 1,
-0.1845125, -0.06902938, -4.236043, 0, 1, 0.6039216, 1,
-0.1843246, 1.950804, -1.464191, 0, 1, 0.6117647, 1,
-0.1827707, -0.4063005, -2.960892, 0, 1, 0.6156863, 1,
-0.1821029, -2.75696, -3.013297, 0, 1, 0.6235294, 1,
-0.1812429, 1.108092, -0.3256605, 0, 1, 0.627451, 1,
-0.1793567, -2.136247, -4.280314, 0, 1, 0.6352941, 1,
-0.178332, 0.5763944, -0.7522867, 0, 1, 0.6392157, 1,
-0.1744943, -0.06042589, -1.153239, 0, 1, 0.6470588, 1,
-0.1742166, 0.3427004, 0.1056829, 0, 1, 0.6509804, 1,
-0.1718691, 0.1638425, -0.9314177, 0, 1, 0.6588235, 1,
-0.1713732, -0.763096, -4.716836, 0, 1, 0.6627451, 1,
-0.1686087, -1.891891, -2.246188, 0, 1, 0.6705883, 1,
-0.1683602, 2.05153, 0.3798979, 0, 1, 0.6745098, 1,
-0.1655024, -0.5611725, -3.933461, 0, 1, 0.682353, 1,
-0.1620162, -0.8588827, -3.262341, 0, 1, 0.6862745, 1,
-0.1595054, 1.04025, -1.397189, 0, 1, 0.6941177, 1,
-0.154805, 1.841081, 0.9424668, 0, 1, 0.7019608, 1,
-0.1434748, 0.4681131, -0.7983268, 0, 1, 0.7058824, 1,
-0.1399637, -0.379497, -1.816668, 0, 1, 0.7137255, 1,
-0.1389656, 0.0959435, -0.3098449, 0, 1, 0.7176471, 1,
-0.1377725, -0.6252756, -3.07605, 0, 1, 0.7254902, 1,
-0.1376344, 1.17066, 0.6394191, 0, 1, 0.7294118, 1,
-0.1362192, -0.01267814, -2.518739, 0, 1, 0.7372549, 1,
-0.1230692, 1.421261, -0.4103955, 0, 1, 0.7411765, 1,
-0.118423, 0.9998185, -0.976117, 0, 1, 0.7490196, 1,
-0.1138521, 2.008341, 2.385201, 0, 1, 0.7529412, 1,
-0.1091773, 0.183577, 1.097801, 0, 1, 0.7607843, 1,
-0.1088772, -0.483497, -3.547807, 0, 1, 0.7647059, 1,
-0.1051485, 1.066633, 0.4823391, 0, 1, 0.772549, 1,
-0.1006565, 0.1740039, -0.1970137, 0, 1, 0.7764706, 1,
-0.09917225, 0.8566533, -0.1233926, 0, 1, 0.7843137, 1,
-0.09870691, -1.245845, -3.327642, 0, 1, 0.7882353, 1,
-0.08578742, 0.7000837, 0.2498702, 0, 1, 0.7960784, 1,
-0.08095685, -1.779662, -2.93483, 0, 1, 0.8039216, 1,
-0.07993441, 1.195355, 0.01669466, 0, 1, 0.8078431, 1,
-0.07976594, 0.1989974, -0.8550335, 0, 1, 0.8156863, 1,
-0.07708938, 1.266592, 1.689076, 0, 1, 0.8196079, 1,
-0.07642184, 0.7943516, -0.9796491, 0, 1, 0.827451, 1,
-0.07533782, -0.8566611, -1.961457, 0, 1, 0.8313726, 1,
-0.07464854, -0.8528278, -2.106317, 0, 1, 0.8392157, 1,
-0.07370688, 0.6212099, 0.1047099, 0, 1, 0.8431373, 1,
-0.07322054, -0.4525857, -3.298057, 0, 1, 0.8509804, 1,
-0.07100376, -1.562199, -1.804801, 0, 1, 0.854902, 1,
-0.06906902, -1.580031, -4.814984, 0, 1, 0.8627451, 1,
-0.06351303, -1.217342, -2.230192, 0, 1, 0.8666667, 1,
-0.06287339, -1.374341, -0.8401814, 0, 1, 0.8745098, 1,
-0.05605123, 0.1586089, -1.228525, 0, 1, 0.8784314, 1,
-0.05379271, -1.537303, -3.524755, 0, 1, 0.8862745, 1,
-0.04896423, 0.6989149, 1.016108, 0, 1, 0.8901961, 1,
-0.04685066, 1.748945, -1.324035, 0, 1, 0.8980392, 1,
-0.04559191, -0.02675016, -2.91259, 0, 1, 0.9058824, 1,
-0.04292406, -0.0114665, -2.257125, 0, 1, 0.9098039, 1,
-0.0416834, -0.0386151, -2.759177, 0, 1, 0.9176471, 1,
-0.0391761, -0.5610856, -2.260698, 0, 1, 0.9215686, 1,
-0.03818089, -1.305655, -3.634474, 0, 1, 0.9294118, 1,
-0.03805982, -0.5914346, -3.894871, 0, 1, 0.9333333, 1,
-0.03247995, -0.4892524, -2.077505, 0, 1, 0.9411765, 1,
-0.03191744, -1.337313, -3.234967, 0, 1, 0.945098, 1,
-0.0271008, 0.2015869, -0.7587463, 0, 1, 0.9529412, 1,
-0.0237236, -1.012408, -3.322566, 0, 1, 0.9568627, 1,
-0.02338415, 0.4375363, -2.187071, 0, 1, 0.9647059, 1,
-0.01980581, 0.5542713, 0.1578014, 0, 1, 0.9686275, 1,
-0.01833145, -0.810435, -3.637606, 0, 1, 0.9764706, 1,
-0.01816115, -0.2017045, -2.396221, 0, 1, 0.9803922, 1,
-0.01718584, -1.096621, -1.144813, 0, 1, 0.9882353, 1,
-0.0112512, -1.325493, -1.713337, 0, 1, 0.9921569, 1,
-0.01065969, -1.027048, -3.167508, 0, 1, 1, 1,
-0.01058352, -0.05083608, -3.89274, 0, 0.9921569, 1, 1,
-0.007288374, -0.08901519, -3.324684, 0, 0.9882353, 1, 1,
-0.003626855, -0.05897506, -2.205771, 0, 0.9803922, 1, 1,
-0.0002889407, -1.601305, -3.704467, 0, 0.9764706, 1, 1,
0.002986501, 1.477244, -0.1177805, 0, 0.9686275, 1, 1,
0.003548041, 0.3400809, -0.09895233, 0, 0.9647059, 1, 1,
0.008086547, -2.298036, 3.898439, 0, 0.9568627, 1, 1,
0.00861102, -0.5823035, 2.387968, 0, 0.9529412, 1, 1,
0.009702962, 0.9070664, -0.06710346, 0, 0.945098, 1, 1,
0.01144646, 0.6753118, 0.5294692, 0, 0.9411765, 1, 1,
0.01306485, 0.5378403, 1.170439, 0, 0.9333333, 1, 1,
0.01366758, 0.1576893, 0.123574, 0, 0.9294118, 1, 1,
0.01376725, -1.60468, 3.06923, 0, 0.9215686, 1, 1,
0.01646975, -0.8769979, 3.972379, 0, 0.9176471, 1, 1,
0.01738831, 0.7078264, 0.6541701, 0, 0.9098039, 1, 1,
0.01914603, -0.3932664, 2.605746, 0, 0.9058824, 1, 1,
0.02187094, 0.2196593, 0.4489617, 0, 0.8980392, 1, 1,
0.0238949, -1.114979, 3.320527, 0, 0.8901961, 1, 1,
0.02426313, 0.3748309, 0.9867436, 0, 0.8862745, 1, 1,
0.0246365, -0.4462062, 4.19623, 0, 0.8784314, 1, 1,
0.02719248, -0.8279932, 2.261088, 0, 0.8745098, 1, 1,
0.02838415, -0.1579115, 2.589652, 0, 0.8666667, 1, 1,
0.02990484, -0.01150626, 0.7460627, 0, 0.8627451, 1, 1,
0.03484006, -0.1693542, 1.902489, 0, 0.854902, 1, 1,
0.03599428, -0.8865089, 3.909668, 0, 0.8509804, 1, 1,
0.03662265, 0.6636821, -0.96896, 0, 0.8431373, 1, 1,
0.04474841, -0.6508739, 0.9504665, 0, 0.8392157, 1, 1,
0.04652701, 0.3396815, -0.4045898, 0, 0.8313726, 1, 1,
0.0527233, 0.4571559, 1.057313, 0, 0.827451, 1, 1,
0.05406326, 0.6481307, 0.1162443, 0, 0.8196079, 1, 1,
0.06814376, -0.3405026, 2.320847, 0, 0.8156863, 1, 1,
0.06879957, -0.994901, 2.350986, 0, 0.8078431, 1, 1,
0.07035992, -0.6408585, 2.243365, 0, 0.8039216, 1, 1,
0.07382366, 1.448011, 0.01848694, 0, 0.7960784, 1, 1,
0.07405902, 0.4821934, -1.018146, 0, 0.7882353, 1, 1,
0.07428302, 0.25275, -1.508147, 0, 0.7843137, 1, 1,
0.07753193, 0.1546763, 0.6661975, 0, 0.7764706, 1, 1,
0.07948533, -0.05520587, 1.62635, 0, 0.772549, 1, 1,
0.09104813, -0.1232837, 2.58496, 0, 0.7647059, 1, 1,
0.09480694, 1.64235, 1.143889, 0, 0.7607843, 1, 1,
0.09749824, -0.3968372, 3.602318, 0, 0.7529412, 1, 1,
0.09942133, -1.1917, 2.507743, 0, 0.7490196, 1, 1,
0.1002378, -1.486281, 2.377988, 0, 0.7411765, 1, 1,
0.1019877, -0.3919549, 0.4331162, 0, 0.7372549, 1, 1,
0.1111832, 1.757686, -0.4359734, 0, 0.7294118, 1, 1,
0.1130148, 0.5867539, 1.699654, 0, 0.7254902, 1, 1,
0.1143325, 1.191301, 1.28144, 0, 0.7176471, 1, 1,
0.1180887, -0.06274734, 2.354017, 0, 0.7137255, 1, 1,
0.1187777, 2.278855, 1.598076, 0, 0.7058824, 1, 1,
0.1252214, -0.4269022, -0.4153965, 0, 0.6980392, 1, 1,
0.1258238, 0.9845247, 1.199677, 0, 0.6941177, 1, 1,
0.1268734, -1.168762, 1.302031, 0, 0.6862745, 1, 1,
0.1271068, -0.9085801, 3.897348, 0, 0.682353, 1, 1,
0.1293014, -0.6189356, 0.9458182, 0, 0.6745098, 1, 1,
0.1296384, 0.4222527, -0.5854581, 0, 0.6705883, 1, 1,
0.1347121, 1.341723, -0.6893514, 0, 0.6627451, 1, 1,
0.1371693, 0.5679742, -1.810265, 0, 0.6588235, 1, 1,
0.1386133, 0.4496191, 1.837117, 0, 0.6509804, 1, 1,
0.1391185, -0.926075, 3.409522, 0, 0.6470588, 1, 1,
0.145102, -1.202836, 3.316026, 0, 0.6392157, 1, 1,
0.1455419, -0.884914, 4.735192, 0, 0.6352941, 1, 1,
0.1485702, 1.705597, 1.574916, 0, 0.627451, 1, 1,
0.1515816, 0.001552795, 1.154558, 0, 0.6235294, 1, 1,
0.1522143, -0.4635828, 2.495603, 0, 0.6156863, 1, 1,
0.1535778, 2.019534, -1.698704, 0, 0.6117647, 1, 1,
0.1641003, 2.488545, 0.1257671, 0, 0.6039216, 1, 1,
0.1649553, 0.2050698, 1.491337, 0, 0.5960785, 1, 1,
0.1651388, 1.775395, -1.583971, 0, 0.5921569, 1, 1,
0.1687936, 1.444264, 1.888367, 0, 0.5843138, 1, 1,
0.1701286, -0.1303211, 3.433749, 0, 0.5803922, 1, 1,
0.1717711, -0.3405834, 2.671803, 0, 0.572549, 1, 1,
0.182863, 1.781752, 0.7690073, 0, 0.5686275, 1, 1,
0.1852353, -0.509712, 2.174467, 0, 0.5607843, 1, 1,
0.1877096, 0.6195596, -0.637467, 0, 0.5568628, 1, 1,
0.188447, -1.155554, 3.564134, 0, 0.5490196, 1, 1,
0.1922349, 0.3250271, 2.103979, 0, 0.5450981, 1, 1,
0.1940489, 0.7065899, -0.4017942, 0, 0.5372549, 1, 1,
0.2010759, 0.8971367, 0.7284172, 0, 0.5333334, 1, 1,
0.207718, 0.5332617, -1.732399, 0, 0.5254902, 1, 1,
0.2103609, 0.1134937, -0.2763194, 0, 0.5215687, 1, 1,
0.2117275, 0.4520167, 1.142739, 0, 0.5137255, 1, 1,
0.2162853, 0.9746675, 2.002785, 0, 0.509804, 1, 1,
0.2169081, -1.310223, 3.017588, 0, 0.5019608, 1, 1,
0.2175238, 0.8709688, 0.4430923, 0, 0.4941176, 1, 1,
0.219418, 1.479271, 0.557246, 0, 0.4901961, 1, 1,
0.2230948, -0.6156346, 2.603493, 0, 0.4823529, 1, 1,
0.2246743, 0.2975589, -0.4218261, 0, 0.4784314, 1, 1,
0.2280395, -0.5369204, 4.132582, 0, 0.4705882, 1, 1,
0.2299796, -1.546698, 3.194517, 0, 0.4666667, 1, 1,
0.2303873, 2.358266, 1.200844, 0, 0.4588235, 1, 1,
0.2309555, -0.9642853, 4.250731, 0, 0.454902, 1, 1,
0.2315685, 0.2982602, 1.434117, 0, 0.4470588, 1, 1,
0.2327116, -2.739338, 1.767329, 0, 0.4431373, 1, 1,
0.2369132, -1.629165, 3.245005, 0, 0.4352941, 1, 1,
0.2398668, -0.07337675, 1.282004, 0, 0.4313726, 1, 1,
0.2440663, 0.2718678, 3.295455, 0, 0.4235294, 1, 1,
0.2449186, 1.160842, 1.041232, 0, 0.4196078, 1, 1,
0.2460012, 1.84754, -1.147575, 0, 0.4117647, 1, 1,
0.2511, 0.02738537, 1.317984, 0, 0.4078431, 1, 1,
0.2536028, 0.2695059, 3.414281, 0, 0.4, 1, 1,
0.2559941, -1.402599, 3.094771, 0, 0.3921569, 1, 1,
0.2594794, 0.1698567, 1.718363, 0, 0.3882353, 1, 1,
0.2609351, 0.03095005, 1.444199, 0, 0.3803922, 1, 1,
0.2609548, -0.250513, 3.294676, 0, 0.3764706, 1, 1,
0.2635264, 0.6746624, 1.577827, 0, 0.3686275, 1, 1,
0.2692678, 0.1648231, 0.2966891, 0, 0.3647059, 1, 1,
0.272954, -0.24433, 1.748041, 0, 0.3568628, 1, 1,
0.2785199, -0.774295, 2.369998, 0, 0.3529412, 1, 1,
0.2808869, -3.411316, 2.585342, 0, 0.345098, 1, 1,
0.2819163, -0.09624547, 1.019841, 0, 0.3411765, 1, 1,
0.2847794, -0.346198, 2.34429, 0, 0.3333333, 1, 1,
0.2859535, 0.2945165, -0.2164259, 0, 0.3294118, 1, 1,
0.2863436, -2.132414, 1.517537, 0, 0.3215686, 1, 1,
0.2885829, -0.9813425, 3.233014, 0, 0.3176471, 1, 1,
0.2903512, -2.258112, 3.535769, 0, 0.3098039, 1, 1,
0.2906811, 0.3660462, 0.05947002, 0, 0.3058824, 1, 1,
0.2923732, 0.4367058, 0.3750038, 0, 0.2980392, 1, 1,
0.2927181, -1.207686, 1.512404, 0, 0.2901961, 1, 1,
0.2948447, -2.453288, 3.472862, 0, 0.2862745, 1, 1,
0.2949656, 2.497469, -0.1798658, 0, 0.2784314, 1, 1,
0.2953709, 0.8595366, 0.2040504, 0, 0.2745098, 1, 1,
0.2959999, 0.6188706, 1.34354, 0, 0.2666667, 1, 1,
0.2961104, 0.9279234, 1.060363, 0, 0.2627451, 1, 1,
0.297783, 1.137878, 0.591139, 0, 0.254902, 1, 1,
0.2978812, 0.3134761, 1.573912, 0, 0.2509804, 1, 1,
0.3008534, 1.838438, 0.6703328, 0, 0.2431373, 1, 1,
0.3019005, -0.51053, 2.754407, 0, 0.2392157, 1, 1,
0.3053983, -1.63992, 4.829147, 0, 0.2313726, 1, 1,
0.3055511, -0.4722161, 2.665263, 0, 0.227451, 1, 1,
0.3058262, 0.2661019, 0.1048048, 0, 0.2196078, 1, 1,
0.3072762, 0.3353781, -0.5802291, 0, 0.2156863, 1, 1,
0.307924, 0.2928554, 1.084505, 0, 0.2078431, 1, 1,
0.3087215, -0.6667082, 3.285352, 0, 0.2039216, 1, 1,
0.3104124, -1.000582, 1.226676, 0, 0.1960784, 1, 1,
0.3160646, 0.8674339, 0.9336558, 0, 0.1882353, 1, 1,
0.3176238, 0.2636113, 0.1734018, 0, 0.1843137, 1, 1,
0.3213102, 1.646916, -0.009722151, 0, 0.1764706, 1, 1,
0.3248021, 0.3636141, 0.4909221, 0, 0.172549, 1, 1,
0.3262864, 0.1399118, 1.929748, 0, 0.1647059, 1, 1,
0.3267418, 1.963047, -1.062549, 0, 0.1607843, 1, 1,
0.3277874, 1.11087, 1.090677, 0, 0.1529412, 1, 1,
0.3280681, 0.02513201, 0.9453962, 0, 0.1490196, 1, 1,
0.328823, 0.7560039, 0.9946696, 0, 0.1411765, 1, 1,
0.3293568, 0.1209062, 2.993898, 0, 0.1372549, 1, 1,
0.3302445, 0.4333673, 1.034683, 0, 0.1294118, 1, 1,
0.3325059, 2.393829, 0.8086418, 0, 0.1254902, 1, 1,
0.3338226, -1.746768, 3.402085, 0, 0.1176471, 1, 1,
0.3373925, -1.260761, 2.649642, 0, 0.1137255, 1, 1,
0.3374111, -0.03885737, 2.646903, 0, 0.1058824, 1, 1,
0.3391778, -0.4896284, 1.083299, 0, 0.09803922, 1, 1,
0.3409595, -0.9293777, 3.064913, 0, 0.09411765, 1, 1,
0.3446746, -0.2828523, 2.614796, 0, 0.08627451, 1, 1,
0.3491013, -0.4158579, 1.57055, 0, 0.08235294, 1, 1,
0.3504661, -0.2006319, 0.2082158, 0, 0.07450981, 1, 1,
0.351433, 1.776549, -0.9839067, 0, 0.07058824, 1, 1,
0.3514982, 1.09814, -0.05536015, 0, 0.0627451, 1, 1,
0.3527936, -0.2791161, 0.7133421, 0, 0.05882353, 1, 1,
0.3542292, -0.6730015, 3.148452, 0, 0.05098039, 1, 1,
0.3549485, 0.7769748, 1.555598, 0, 0.04705882, 1, 1,
0.3596424, -0.4442935, 2.819228, 0, 0.03921569, 1, 1,
0.3609171, -0.9978307, 1.562021, 0, 0.03529412, 1, 1,
0.3644476, 0.3233901, 2.111814, 0, 0.02745098, 1, 1,
0.3649541, -0.6285916, 1.2049, 0, 0.02352941, 1, 1,
0.3653641, -1.90121, 3.636688, 0, 0.01568628, 1, 1,
0.3753287, 1.678493, 1.055706, 0, 0.01176471, 1, 1,
0.3777461, -0.5682455, 1.473746, 0, 0.003921569, 1, 1,
0.3788225, -0.561471, 3.23972, 0.003921569, 0, 1, 1,
0.3814051, 0.9358485, 1.599994, 0.007843138, 0, 1, 1,
0.3879291, 1.828375, 0.3257644, 0.01568628, 0, 1, 1,
0.388307, 0.5038995, 2.466979, 0.01960784, 0, 1, 1,
0.3885182, -0.1918727, 1.229112, 0.02745098, 0, 1, 1,
0.3887178, 1.519189, 2.417399, 0.03137255, 0, 1, 1,
0.3889687, 0.8158326, -0.7073599, 0.03921569, 0, 1, 1,
0.3901748, 0.9265494, 0.4052501, 0.04313726, 0, 1, 1,
0.3973085, -1.045598, 4.769773, 0.05098039, 0, 1, 1,
0.4004076, 0.3801262, 1.319298, 0.05490196, 0, 1, 1,
0.405028, -0.3469946, 0.6761971, 0.0627451, 0, 1, 1,
0.4053361, -1.516358, 2.731282, 0.06666667, 0, 1, 1,
0.4060244, 0.2913711, 1.597245, 0.07450981, 0, 1, 1,
0.4106495, 0.5084794, 1.044204, 0.07843138, 0, 1, 1,
0.4112354, 0.248671, 0.5851949, 0.08627451, 0, 1, 1,
0.4117752, 1.824477, -1.643393, 0.09019608, 0, 1, 1,
0.4164757, 0.8427392, 1.200302, 0.09803922, 0, 1, 1,
0.4174108, -0.5501993, 0.8170388, 0.1058824, 0, 1, 1,
0.4174417, -0.778819, 2.065283, 0.1098039, 0, 1, 1,
0.4278947, 1.864586, -0.3733192, 0.1176471, 0, 1, 1,
0.4320447, 0.06137902, 0.7827439, 0.1215686, 0, 1, 1,
0.4335565, 0.7117658, -0.5320507, 0.1294118, 0, 1, 1,
0.4336543, 1.055048, 0.126276, 0.1333333, 0, 1, 1,
0.4338742, 0.3535064, 1.172562, 0.1411765, 0, 1, 1,
0.4344073, -0.003213376, 2.383788, 0.145098, 0, 1, 1,
0.4350772, -0.1648805, 1.151265, 0.1529412, 0, 1, 1,
0.4382857, 0.8640026, 0.08379529, 0.1568628, 0, 1, 1,
0.4393679, 0.5651512, 1.028354, 0.1647059, 0, 1, 1,
0.4395857, -2.365053, 1.831501, 0.1686275, 0, 1, 1,
0.4398786, -0.615749, 2.795154, 0.1764706, 0, 1, 1,
0.4456955, -0.2538147, 2.125865, 0.1803922, 0, 1, 1,
0.4506288, 0.4081928, -0.5514309, 0.1882353, 0, 1, 1,
0.4510689, -0.05488695, 1.328895, 0.1921569, 0, 1, 1,
0.4513447, -1.134384, 2.494636, 0.2, 0, 1, 1,
0.4656411, 0.9798216, 1.670466, 0.2078431, 0, 1, 1,
0.4662772, 0.3163422, 1.569928, 0.2117647, 0, 1, 1,
0.4702066, 0.47373, 0.6042654, 0.2196078, 0, 1, 1,
0.4704043, -0.06110025, 0.4365003, 0.2235294, 0, 1, 1,
0.4736047, -0.8851355, 2.823706, 0.2313726, 0, 1, 1,
0.4744913, 1.097373, 1.28344, 0.2352941, 0, 1, 1,
0.48075, 0.4123358, 0.5328823, 0.2431373, 0, 1, 1,
0.4881015, -1.639097, 2.322109, 0.2470588, 0, 1, 1,
0.4881276, 1.048432, -0.350831, 0.254902, 0, 1, 1,
0.490904, 0.4016902, 2.290306, 0.2588235, 0, 1, 1,
0.4915209, 1.106352, 0.664146, 0.2666667, 0, 1, 1,
0.4958047, -1.034701, 1.149234, 0.2705882, 0, 1, 1,
0.5007982, 0.779093, 1.429584, 0.2784314, 0, 1, 1,
0.501756, -1.592701, 3.322537, 0.282353, 0, 1, 1,
0.5018717, -2.473141, 1.329743, 0.2901961, 0, 1, 1,
0.5024711, -0.1831954, -0.114275, 0.2941177, 0, 1, 1,
0.5032923, 1.177817, -0.6231744, 0.3019608, 0, 1, 1,
0.5152818, 2.17945, 1.146669, 0.3098039, 0, 1, 1,
0.522508, -0.2428536, 1.55233, 0.3137255, 0, 1, 1,
0.5267595, -0.8837798, 1.184046, 0.3215686, 0, 1, 1,
0.5411255, -0.6058589, 2.806236, 0.3254902, 0, 1, 1,
0.5483264, -0.7691945, 2.593507, 0.3333333, 0, 1, 1,
0.5518219, -0.9798864, 0.5393882, 0.3372549, 0, 1, 1,
0.5518311, 0.756834, 2.203394, 0.345098, 0, 1, 1,
0.5626665, -0.9764867, 2.887741, 0.3490196, 0, 1, 1,
0.5651656, -0.4648744, 2.883896, 0.3568628, 0, 1, 1,
0.5661815, -0.2030018, 1.729693, 0.3607843, 0, 1, 1,
0.5667991, -1.046077, 3.369781, 0.3686275, 0, 1, 1,
0.5697059, -1.548502, 2.582381, 0.372549, 0, 1, 1,
0.577516, -0.8189155, 2.077047, 0.3803922, 0, 1, 1,
0.5787761, 1.60538, -0.7560661, 0.3843137, 0, 1, 1,
0.5788748, -0.2183269, 3.552482, 0.3921569, 0, 1, 1,
0.582148, 0.5186822, 1.427711, 0.3960784, 0, 1, 1,
0.5866296, -0.003619431, 0.9417585, 0.4039216, 0, 1, 1,
0.5886773, 1.070801, 1.184241, 0.4117647, 0, 1, 1,
0.59158, -0.4880466, 4.076221, 0.4156863, 0, 1, 1,
0.5936914, -0.7351707, 2.488057, 0.4235294, 0, 1, 1,
0.6067588, 0.8137414, -0.2666133, 0.427451, 0, 1, 1,
0.6073022, 1.290964, 0.7104244, 0.4352941, 0, 1, 1,
0.6113898, 0.5442753, -1.376808, 0.4392157, 0, 1, 1,
0.6148205, -0.8858583, 1.152009, 0.4470588, 0, 1, 1,
0.6205295, 0.9053072, 0.2006733, 0.4509804, 0, 1, 1,
0.6225821, -0.2405765, 1.484344, 0.4588235, 0, 1, 1,
0.6240409, 0.5986573, -0.431944, 0.4627451, 0, 1, 1,
0.6244802, -2.287475, 2.441459, 0.4705882, 0, 1, 1,
0.6275526, -1.058498, 1.104247, 0.4745098, 0, 1, 1,
0.627811, -0.2136347, 1.37497, 0.4823529, 0, 1, 1,
0.6283318, 0.5937279, 1.857852, 0.4862745, 0, 1, 1,
0.6319397, 1.228409, 1.443766, 0.4941176, 0, 1, 1,
0.6321298, -1.007927, 1.821558, 0.5019608, 0, 1, 1,
0.6409951, -0.2154076, 1.850562, 0.5058824, 0, 1, 1,
0.6419406, 0.7564873, -0.2571653, 0.5137255, 0, 1, 1,
0.6439978, -0.957584, 3.731048, 0.5176471, 0, 1, 1,
0.6479416, 1.12219, 1.426362, 0.5254902, 0, 1, 1,
0.6610473, -0.5253894, 2.803481, 0.5294118, 0, 1, 1,
0.6643878, 0.07441631, 0.9956204, 0.5372549, 0, 1, 1,
0.6684593, -1.181081, 1.834289, 0.5411765, 0, 1, 1,
0.6728806, -0.2436474, 1.374563, 0.5490196, 0, 1, 1,
0.6808863, 0.156994, 0.9732697, 0.5529412, 0, 1, 1,
0.6835705, 0.1639672, 3.648239, 0.5607843, 0, 1, 1,
0.6858345, -0.4077077, 1.612895, 0.5647059, 0, 1, 1,
0.6918414, -1.19045, 1.865842, 0.572549, 0, 1, 1,
0.6940404, 1.43758, 1.296546, 0.5764706, 0, 1, 1,
0.6993733, 0.1518434, 2.504875, 0.5843138, 0, 1, 1,
0.7025953, 0.2524578, 0.9591479, 0.5882353, 0, 1, 1,
0.704909, 1.445542, 0.1587998, 0.5960785, 0, 1, 1,
0.7080191, 1.404091, 0.8170891, 0.6039216, 0, 1, 1,
0.7151681, -0.3624371, 2.549989, 0.6078432, 0, 1, 1,
0.7257804, 0.6404458, 1.502559, 0.6156863, 0, 1, 1,
0.7359878, -0.02528392, 1.773724, 0.6196079, 0, 1, 1,
0.7378694, 1.391653, 0.06638546, 0.627451, 0, 1, 1,
0.7391521, -0.4337827, 1.658456, 0.6313726, 0, 1, 1,
0.7458284, 0.3071405, 2.015373, 0.6392157, 0, 1, 1,
0.7490315, -0.4134389, 2.382854, 0.6431373, 0, 1, 1,
0.7505051, -0.5358093, 3.268806, 0.6509804, 0, 1, 1,
0.7520618, -0.5022999, 1.815614, 0.654902, 0, 1, 1,
0.7526587, -1.130134, 1.403549, 0.6627451, 0, 1, 1,
0.7559858, -1.479248, 2.107186, 0.6666667, 0, 1, 1,
0.7603021, -0.2711015, 2.038457, 0.6745098, 0, 1, 1,
0.7726988, 0.06119526, 0.2691054, 0.6784314, 0, 1, 1,
0.7765302, 0.2080409, 0.4961531, 0.6862745, 0, 1, 1,
0.7774682, 0.5210151, 0.625833, 0.6901961, 0, 1, 1,
0.7781577, -1.479895, 1.880507, 0.6980392, 0, 1, 1,
0.7796961, 0.966804, 0.7239732, 0.7058824, 0, 1, 1,
0.7824171, -0.4750498, 2.238799, 0.7098039, 0, 1, 1,
0.7892592, -1.539487, 1.583828, 0.7176471, 0, 1, 1,
0.7900608, 0.06495003, 3.529419, 0.7215686, 0, 1, 1,
0.7970752, -0.06370071, 2.540312, 0.7294118, 0, 1, 1,
0.805841, -0.7441009, 3.233857, 0.7333333, 0, 1, 1,
0.8087748, 1.333518, 1.198335, 0.7411765, 0, 1, 1,
0.8113768, -0.1308178, 1.438094, 0.7450981, 0, 1, 1,
0.8139791, -1.386238, -0.3762131, 0.7529412, 0, 1, 1,
0.8166651, -0.5871827, 3.04057, 0.7568628, 0, 1, 1,
0.82337, -0.3022999, -0.4640881, 0.7647059, 0, 1, 1,
0.8242246, 0.01238013, 1.639607, 0.7686275, 0, 1, 1,
0.8254301, -0.3829095, 2.705808, 0.7764706, 0, 1, 1,
0.8308972, 0.9305431, 1.601084, 0.7803922, 0, 1, 1,
0.8326734, 2.454448, 1.062398, 0.7882353, 0, 1, 1,
0.8341272, 1.225468, 1.450943, 0.7921569, 0, 1, 1,
0.8454595, -0.3531847, 2.003834, 0.8, 0, 1, 1,
0.8457688, -0.01850334, 0.2813739, 0.8078431, 0, 1, 1,
0.846236, 0.8005684, 2.0149, 0.8117647, 0, 1, 1,
0.8520738, 2.866991, 0.1843999, 0.8196079, 0, 1, 1,
0.8524261, -1.368957, 1.597006, 0.8235294, 0, 1, 1,
0.8541036, 0.2507239, 3.042581, 0.8313726, 0, 1, 1,
0.8576127, 0.4365463, -0.6567612, 0.8352941, 0, 1, 1,
0.8601005, 0.8097283, 0.7078077, 0.8431373, 0, 1, 1,
0.8616297, 0.6583462, -0.01543847, 0.8470588, 0, 1, 1,
0.8643081, 0.533275, 0.09376979, 0.854902, 0, 1, 1,
0.8652699, -0.4482816, 4.020275, 0.8588235, 0, 1, 1,
0.8666447, 0.4911928, -0.7235095, 0.8666667, 0, 1, 1,
0.8724048, 1.215196, 1.051324, 0.8705882, 0, 1, 1,
0.8758913, 0.6032856, 0.909844, 0.8784314, 0, 1, 1,
0.8774303, 0.01803532, 0.4887677, 0.8823529, 0, 1, 1,
0.8774697, 0.2650465, 0.5074807, 0.8901961, 0, 1, 1,
0.8834032, -0.4669228, 0.637922, 0.8941177, 0, 1, 1,
0.8932602, -0.3062809, 1.216587, 0.9019608, 0, 1, 1,
0.8937182, -0.4911639, 2.453168, 0.9098039, 0, 1, 1,
0.8946791, 0.8983274, 0.9426734, 0.9137255, 0, 1, 1,
0.9041378, -0.588945, 2.511909, 0.9215686, 0, 1, 1,
0.9085818, -0.1173803, 1.82289, 0.9254902, 0, 1, 1,
0.9100098, 1.595942, 0.5928173, 0.9333333, 0, 1, 1,
0.9119062, 0.9747857, 0.8401771, 0.9372549, 0, 1, 1,
0.9125606, 2.062399, 0.746533, 0.945098, 0, 1, 1,
0.9179698, -0.4296915, 1.176204, 0.9490196, 0, 1, 1,
0.9328102, -1.39059, 4.135569, 0.9568627, 0, 1, 1,
0.9345107, -0.3748237, 2.106263, 0.9607843, 0, 1, 1,
0.9345506, -0.1955311, 0.3486778, 0.9686275, 0, 1, 1,
0.9377824, 0.6061557, 0.9667166, 0.972549, 0, 1, 1,
0.9528642, -0.5793321, 0.7806993, 0.9803922, 0, 1, 1,
0.953048, -0.7885587, 1.767727, 0.9843137, 0, 1, 1,
0.9562447, -0.2001278, 2.333467, 0.9921569, 0, 1, 1,
0.9573301, -0.8171111, 0.3080415, 0.9960784, 0, 1, 1,
0.9590228, -0.02501282, 1.369825, 1, 0, 0.9960784, 1,
0.9615831, -0.2790753, 0.538768, 1, 0, 0.9882353, 1,
0.9617364, -1.123821, 1.808466, 1, 0, 0.9843137, 1,
0.962927, 0.9611111, -0.07993084, 1, 0, 0.9764706, 1,
0.9738323, -1.920009, 1.517083, 1, 0, 0.972549, 1,
0.9804844, -1.223188, 3.028994, 1, 0, 0.9647059, 1,
0.987483, -0.1327994, 0.8189685, 1, 0, 0.9607843, 1,
1.013494, -1.369649, 2.508301, 1, 0, 0.9529412, 1,
1.025044, -0.8700572, 2.677758, 1, 0, 0.9490196, 1,
1.04078, 1.454146, 0.4815521, 1, 0, 0.9411765, 1,
1.041082, 0.2173901, 1.729381, 1, 0, 0.9372549, 1,
1.049026, -0.5765411, 1.985535, 1, 0, 0.9294118, 1,
1.050778, -1.168658, 1.662314, 1, 0, 0.9254902, 1,
1.056511, 2.337407, -1.012853, 1, 0, 0.9176471, 1,
1.057589, 0.3764304, -0.5548761, 1, 0, 0.9137255, 1,
1.062199, -0.06011397, 0.7567775, 1, 0, 0.9058824, 1,
1.06482, 2.222582, -0.03432834, 1, 0, 0.9019608, 1,
1.076595, 0.4759769, 1.31409, 1, 0, 0.8941177, 1,
1.080082, 0.03827416, 1.566504, 1, 0, 0.8862745, 1,
1.080153, 0.03351615, 1.415595, 1, 0, 0.8823529, 1,
1.081234, 0.4419376, 1.937763, 1, 0, 0.8745098, 1,
1.084789, 0.6516638, 1.741903, 1, 0, 0.8705882, 1,
1.087701, -1.188504, 0.383667, 1, 0, 0.8627451, 1,
1.090891, 2.182071, -0.02621636, 1, 0, 0.8588235, 1,
1.094419, 1.020635, -0.2103825, 1, 0, 0.8509804, 1,
1.106072, 1.625269, -0.1983183, 1, 0, 0.8470588, 1,
1.106766, 0.3088942, 2.473255, 1, 0, 0.8392157, 1,
1.107046, -0.1536562, 2.108313, 1, 0, 0.8352941, 1,
1.111603, -0.9544666, 2.90753, 1, 0, 0.827451, 1,
1.116126, 0.974595, 0.8826008, 1, 0, 0.8235294, 1,
1.118721, 0.8126538, 1.025472, 1, 0, 0.8156863, 1,
1.131667, 1.04484, 0.6251674, 1, 0, 0.8117647, 1,
1.137545, -0.2377791, 3.418041, 1, 0, 0.8039216, 1,
1.138324, 0.9827482, 0.3267123, 1, 0, 0.7960784, 1,
1.141949, 0.6151577, 0.6785407, 1, 0, 0.7921569, 1,
1.144137, -1.546839, 3.952406, 1, 0, 0.7843137, 1,
1.149143, 0.2244338, 0.8707721, 1, 0, 0.7803922, 1,
1.152687, 0.2995423, 1.708368, 1, 0, 0.772549, 1,
1.153779, -0.868426, 2.201706, 1, 0, 0.7686275, 1,
1.160607, -0.2524731, 1.825272, 1, 0, 0.7607843, 1,
1.161739, -0.1682495, 2.479913, 1, 0, 0.7568628, 1,
1.165227, -0.7610488, 3.251057, 1, 0, 0.7490196, 1,
1.16555, -0.7254788, 2.245529, 1, 0, 0.7450981, 1,
1.17441, 0.09003572, 1.628222, 1, 0, 0.7372549, 1,
1.176034, -1.346118, 2.576282, 1, 0, 0.7333333, 1,
1.183035, -0.06077181, 0.9411852, 1, 0, 0.7254902, 1,
1.184316, -1.092325, 4.306934, 1, 0, 0.7215686, 1,
1.184975, 1.931774, -0.9477599, 1, 0, 0.7137255, 1,
1.185191, -1.877063, 0.8351369, 1, 0, 0.7098039, 1,
1.1885, -2.401811, 2.015713, 1, 0, 0.7019608, 1,
1.19084, 1.554491, 1.407714, 1, 0, 0.6941177, 1,
1.192413, -1.888319, 1.938323, 1, 0, 0.6901961, 1,
1.194651, -1.958633, 3.093316, 1, 0, 0.682353, 1,
1.196149, -0.717531, 3.278299, 1, 0, 0.6784314, 1,
1.197198, -0.4697897, 2.245355, 1, 0, 0.6705883, 1,
1.204243, -0.7283194, 1.787998, 1, 0, 0.6666667, 1,
1.206188, -1.283493, 4.187352, 1, 0, 0.6588235, 1,
1.207777, 2.321593, 0.08784913, 1, 0, 0.654902, 1,
1.212956, 0.1198453, 1.708704, 1, 0, 0.6470588, 1,
1.216939, 0.5376351, 1.625209, 1, 0, 0.6431373, 1,
1.221117, -0.1236205, 2.918319, 1, 0, 0.6352941, 1,
1.223689, -1.288816, 1.528127, 1, 0, 0.6313726, 1,
1.22922, 0.4064609, 0.7334502, 1, 0, 0.6235294, 1,
1.232809, -1.140765, 0.8870003, 1, 0, 0.6196079, 1,
1.23655, -0.2942963, 2.833206, 1, 0, 0.6117647, 1,
1.240438, 1.221776, 0.7864613, 1, 0, 0.6078432, 1,
1.241924, 1.379303, 0.3802304, 1, 0, 0.6, 1,
1.242432, 0.08714984, 0.8278591, 1, 0, 0.5921569, 1,
1.242953, 2.098345, -0.8952277, 1, 0, 0.5882353, 1,
1.253433, 0.4800713, 2.645784, 1, 0, 0.5803922, 1,
1.266927, 1.247923, -1.166194, 1, 0, 0.5764706, 1,
1.271402, -0.3869154, 2.319556, 1, 0, 0.5686275, 1,
1.275851, -0.04317838, 1.116172, 1, 0, 0.5647059, 1,
1.281641, 0.09743644, 0.6109841, 1, 0, 0.5568628, 1,
1.285168, -0.5149752, 3.617797, 1, 0, 0.5529412, 1,
1.298622, -0.5853614, 1.756144, 1, 0, 0.5450981, 1,
1.31123, 0.8825971, 0.7526279, 1, 0, 0.5411765, 1,
1.3153, -0.3794766, 3.422453, 1, 0, 0.5333334, 1,
1.31923, -0.136072, 0.7585195, 1, 0, 0.5294118, 1,
1.320418, -0.1045936, 2.249271, 1, 0, 0.5215687, 1,
1.326965, -1.420567, 1.734797, 1, 0, 0.5176471, 1,
1.327973, 0.09248754, 2.430838, 1, 0, 0.509804, 1,
1.327988, 1.354481, 1.773048, 1, 0, 0.5058824, 1,
1.333816, 1.61848, 0.6207755, 1, 0, 0.4980392, 1,
1.333855, -0.8388187, 1.94961, 1, 0, 0.4901961, 1,
1.33656, 0.7499332, 3.667626, 1, 0, 0.4862745, 1,
1.344745, 0.3985952, 1.454214, 1, 0, 0.4784314, 1,
1.348201, 1.870039, -0.5085398, 1, 0, 0.4745098, 1,
1.359311, -0.2528922, 0.3531583, 1, 0, 0.4666667, 1,
1.372656, 0.2528892, 1.182427, 1, 0, 0.4627451, 1,
1.37522, 0.1201473, 2.243695, 1, 0, 0.454902, 1,
1.385872, -0.410558, 1.70405, 1, 0, 0.4509804, 1,
1.404841, -0.1088668, 1.958621, 1, 0, 0.4431373, 1,
1.405024, 0.8635901, 1.428226, 1, 0, 0.4392157, 1,
1.427528, -1.419643, 1.880936, 1, 0, 0.4313726, 1,
1.427532, -0.3890752, 1.556921, 1, 0, 0.427451, 1,
1.430347, 1.216681, -0.430624, 1, 0, 0.4196078, 1,
1.442029, -0.1164851, 2.547716, 1, 0, 0.4156863, 1,
1.444941, 1.106549, 1.689733, 1, 0, 0.4078431, 1,
1.450321, -0.9218669, 2.605127, 1, 0, 0.4039216, 1,
1.451827, 0.3281983, 3.667774, 1, 0, 0.3960784, 1,
1.46895, 0.0880542, 1.279726, 1, 0, 0.3882353, 1,
1.483838, 0.2531424, 0.225248, 1, 0, 0.3843137, 1,
1.493769, -1.413476, 4.462202, 1, 0, 0.3764706, 1,
1.495245, -0.7946412, 2.571428, 1, 0, 0.372549, 1,
1.496104, 0.5239098, 2.091339, 1, 0, 0.3647059, 1,
1.501973, -0.5197789, 2.470966, 1, 0, 0.3607843, 1,
1.524883, 0.8613708, 0.6413925, 1, 0, 0.3529412, 1,
1.527608, 0.8390175, 0.6195542, 1, 0, 0.3490196, 1,
1.532555, -0.5926423, 1.647142, 1, 0, 0.3411765, 1,
1.536632, 0.05832314, 1.02449, 1, 0, 0.3372549, 1,
1.541663, -1.31685, 2.91785, 1, 0, 0.3294118, 1,
1.542493, -0.6863021, 0.7989554, 1, 0, 0.3254902, 1,
1.54736, 0.03133173, 2.535007, 1, 0, 0.3176471, 1,
1.57079, -1.550415, 1.137755, 1, 0, 0.3137255, 1,
1.589128, -0.1927156, 1.672954, 1, 0, 0.3058824, 1,
1.592375, -0.5352541, 1.958377, 1, 0, 0.2980392, 1,
1.601437, 0.7567979, 0.8082627, 1, 0, 0.2941177, 1,
1.605339, 2.120831, 2.007691, 1, 0, 0.2862745, 1,
1.605735, -1.375904, 3.114713, 1, 0, 0.282353, 1,
1.607768, -0.3183077, 3.821856, 1, 0, 0.2745098, 1,
1.62628, -1.073279, 2.374832, 1, 0, 0.2705882, 1,
1.6367, -0.4475076, 1.833669, 1, 0, 0.2627451, 1,
1.659028, -0.235549, 1.560922, 1, 0, 0.2588235, 1,
1.669968, -0.3966271, 2.806377, 1, 0, 0.2509804, 1,
1.679081, 1.12428, 0.7627839, 1, 0, 0.2470588, 1,
1.683363, 0.6986775, 0.2841442, 1, 0, 0.2392157, 1,
1.708035, 0.3218204, 0.215466, 1, 0, 0.2352941, 1,
1.717399, 0.571655, 2.549946, 1, 0, 0.227451, 1,
1.718904, 0.4798285, 0.4518175, 1, 0, 0.2235294, 1,
1.719451, -0.03536363, 0.7168537, 1, 0, 0.2156863, 1,
1.739595, 0.5053657, 1.777793, 1, 0, 0.2117647, 1,
1.76812, -0.1218381, 0.5915582, 1, 0, 0.2039216, 1,
1.774207, 0.8265326, 0.7774639, 1, 0, 0.1960784, 1,
1.812683, 1.734733, -0.5420813, 1, 0, 0.1921569, 1,
1.814033, 0.5747961, -0.5526525, 1, 0, 0.1843137, 1,
1.821995, -0.180296, 2.057729, 1, 0, 0.1803922, 1,
1.850363, 1.602499, 1.528306, 1, 0, 0.172549, 1,
1.85321, -0.08627217, -0.5267578, 1, 0, 0.1686275, 1,
1.86991, -0.6287664, 1.439701, 1, 0, 0.1607843, 1,
1.878716, 0.7234806, -0.05193064, 1, 0, 0.1568628, 1,
1.884486, -0.4369495, 1.056032, 1, 0, 0.1490196, 1,
1.903723, -0.1910939, 0.942968, 1, 0, 0.145098, 1,
1.93459, 0.373065, 1.821585, 1, 0, 0.1372549, 1,
1.94662, 0.2893196, 0.8080078, 1, 0, 0.1333333, 1,
1.970375, -0.1278134, 2.330768, 1, 0, 0.1254902, 1,
1.990302, -1.365712, 2.303167, 1, 0, 0.1215686, 1,
2.000703, -0.1657619, 1.020787, 1, 0, 0.1137255, 1,
2.033334, -0.8362113, 1.948458, 1, 0, 0.1098039, 1,
2.118602, -1.272131, 1.543136, 1, 0, 0.1019608, 1,
2.140903, 0.6857018, 2.037684, 1, 0, 0.09411765, 1,
2.196163, 0.6901966, 1.54203, 1, 0, 0.09019608, 1,
2.197598, 1.148291, 0.5251734, 1, 0, 0.08235294, 1,
2.374455, 1.414985, 1.558439, 1, 0, 0.07843138, 1,
2.398746, -0.4008829, 1.38142, 1, 0, 0.07058824, 1,
2.41249, -1.407359, 2.620621, 1, 0, 0.06666667, 1,
2.450506, -0.6469424, -1.00097, 1, 0, 0.05882353, 1,
2.467873, -0.0200852, 1.442794, 1, 0, 0.05490196, 1,
2.488809, -1.679458, 1.614858, 1, 0, 0.04705882, 1,
2.501352, -0.09803381, 2.62891, 1, 0, 0.04313726, 1,
2.529369, -1.227574, 0.7289956, 1, 0, 0.03529412, 1,
2.532828, -1.353882, 2.760354, 1, 0, 0.03137255, 1,
2.733981, 0.2873675, 2.221817, 1, 0, 0.02352941, 1,
2.831044, 0.841942, 2.078363, 1, 0, 0.01960784, 1,
2.906846, 0.9248691, -0.8386343, 1, 0, 0.01176471, 1,
3.042386, 0.08494375, 1.689816, 1, 0, 0.007843138, 1
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
0.03567195, -4.509591, -6.655726, 0, -0.5, 0.5, 0.5,
0.03567195, -4.509591, -6.655726, 1, -0.5, 0.5, 0.5,
0.03567195, -4.509591, -6.655726, 1, 1.5, 0.5, 0.5,
0.03567195, -4.509591, -6.655726, 0, 1.5, 0.5, 0.5
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
-3.990318, -0.1715671, -6.655726, 0, -0.5, 0.5, 0.5,
-3.990318, -0.1715671, -6.655726, 1, -0.5, 0.5, 0.5,
-3.990318, -0.1715671, -6.655726, 1, 1.5, 0.5, 0.5,
-3.990318, -0.1715671, -6.655726, 0, 1.5, 0.5, 0.5
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
-3.990318, -4.509591, -0.08101702, 0, -0.5, 0.5, 0.5,
-3.990318, -4.509591, -0.08101702, 1, -0.5, 0.5, 0.5,
-3.990318, -4.509591, -0.08101702, 1, 1.5, 0.5, 0.5,
-3.990318, -4.509591, -0.08101702, 0, 1.5, 0.5, 0.5
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
-2, -3.508509, -5.138486,
3, -3.508509, -5.138486,
-2, -3.508509, -5.138486,
-2, -3.675356, -5.391359,
-1, -3.508509, -5.138486,
-1, -3.675356, -5.391359,
0, -3.508509, -5.138486,
0, -3.675356, -5.391359,
1, -3.508509, -5.138486,
1, -3.675356, -5.391359,
2, -3.508509, -5.138486,
2, -3.675356, -5.391359,
3, -3.508509, -5.138486,
3, -3.675356, -5.391359
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
-2, -4.00905, -5.897106, 0, -0.5, 0.5, 0.5,
-2, -4.00905, -5.897106, 1, -0.5, 0.5, 0.5,
-2, -4.00905, -5.897106, 1, 1.5, 0.5, 0.5,
-2, -4.00905, -5.897106, 0, 1.5, 0.5, 0.5,
-1, -4.00905, -5.897106, 0, -0.5, 0.5, 0.5,
-1, -4.00905, -5.897106, 1, -0.5, 0.5, 0.5,
-1, -4.00905, -5.897106, 1, 1.5, 0.5, 0.5,
-1, -4.00905, -5.897106, 0, 1.5, 0.5, 0.5,
0, -4.00905, -5.897106, 0, -0.5, 0.5, 0.5,
0, -4.00905, -5.897106, 1, -0.5, 0.5, 0.5,
0, -4.00905, -5.897106, 1, 1.5, 0.5, 0.5,
0, -4.00905, -5.897106, 0, 1.5, 0.5, 0.5,
1, -4.00905, -5.897106, 0, -0.5, 0.5, 0.5,
1, -4.00905, -5.897106, 1, -0.5, 0.5, 0.5,
1, -4.00905, -5.897106, 1, 1.5, 0.5, 0.5,
1, -4.00905, -5.897106, 0, 1.5, 0.5, 0.5,
2, -4.00905, -5.897106, 0, -0.5, 0.5, 0.5,
2, -4.00905, -5.897106, 1, -0.5, 0.5, 0.5,
2, -4.00905, -5.897106, 1, 1.5, 0.5, 0.5,
2, -4.00905, -5.897106, 0, 1.5, 0.5, 0.5,
3, -4.00905, -5.897106, 0, -0.5, 0.5, 0.5,
3, -4.00905, -5.897106, 1, -0.5, 0.5, 0.5,
3, -4.00905, -5.897106, 1, 1.5, 0.5, 0.5,
3, -4.00905, -5.897106, 0, 1.5, 0.5, 0.5
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
-3.061243, -3, -5.138486,
-3.061243, 3, -5.138486,
-3.061243, -3, -5.138486,
-3.216089, -3, -5.391359,
-3.061243, -2, -5.138486,
-3.216089, -2, -5.391359,
-3.061243, -1, -5.138486,
-3.216089, -1, -5.391359,
-3.061243, 0, -5.138486,
-3.216089, 0, -5.391359,
-3.061243, 1, -5.138486,
-3.216089, 1, -5.391359,
-3.061243, 2, -5.138486,
-3.216089, 2, -5.391359,
-3.061243, 3, -5.138486,
-3.216089, 3, -5.391359
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
-3.52578, -3, -5.897106, 0, -0.5, 0.5, 0.5,
-3.52578, -3, -5.897106, 1, -0.5, 0.5, 0.5,
-3.52578, -3, -5.897106, 1, 1.5, 0.5, 0.5,
-3.52578, -3, -5.897106, 0, 1.5, 0.5, 0.5,
-3.52578, -2, -5.897106, 0, -0.5, 0.5, 0.5,
-3.52578, -2, -5.897106, 1, -0.5, 0.5, 0.5,
-3.52578, -2, -5.897106, 1, 1.5, 0.5, 0.5,
-3.52578, -2, -5.897106, 0, 1.5, 0.5, 0.5,
-3.52578, -1, -5.897106, 0, -0.5, 0.5, 0.5,
-3.52578, -1, -5.897106, 1, -0.5, 0.5, 0.5,
-3.52578, -1, -5.897106, 1, 1.5, 0.5, 0.5,
-3.52578, -1, -5.897106, 0, 1.5, 0.5, 0.5,
-3.52578, 0, -5.897106, 0, -0.5, 0.5, 0.5,
-3.52578, 0, -5.897106, 1, -0.5, 0.5, 0.5,
-3.52578, 0, -5.897106, 1, 1.5, 0.5, 0.5,
-3.52578, 0, -5.897106, 0, 1.5, 0.5, 0.5,
-3.52578, 1, -5.897106, 0, -0.5, 0.5, 0.5,
-3.52578, 1, -5.897106, 1, -0.5, 0.5, 0.5,
-3.52578, 1, -5.897106, 1, 1.5, 0.5, 0.5,
-3.52578, 1, -5.897106, 0, 1.5, 0.5, 0.5,
-3.52578, 2, -5.897106, 0, -0.5, 0.5, 0.5,
-3.52578, 2, -5.897106, 1, -0.5, 0.5, 0.5,
-3.52578, 2, -5.897106, 1, 1.5, 0.5, 0.5,
-3.52578, 2, -5.897106, 0, 1.5, 0.5, 0.5,
-3.52578, 3, -5.897106, 0, -0.5, 0.5, 0.5,
-3.52578, 3, -5.897106, 1, -0.5, 0.5, 0.5,
-3.52578, 3, -5.897106, 1, 1.5, 0.5, 0.5,
-3.52578, 3, -5.897106, 0, 1.5, 0.5, 0.5
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
-3.061243, -3.508509, -4,
-3.061243, -3.508509, 4,
-3.061243, -3.508509, -4,
-3.216089, -3.675356, -4,
-3.061243, -3.508509, -2,
-3.216089, -3.675356, -2,
-3.061243, -3.508509, 0,
-3.216089, -3.675356, 0,
-3.061243, -3.508509, 2,
-3.216089, -3.675356, 2,
-3.061243, -3.508509, 4,
-3.216089, -3.675356, 4
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
-3.52578, -4.00905, -4, 0, -0.5, 0.5, 0.5,
-3.52578, -4.00905, -4, 1, -0.5, 0.5, 0.5,
-3.52578, -4.00905, -4, 1, 1.5, 0.5, 0.5,
-3.52578, -4.00905, -4, 0, 1.5, 0.5, 0.5,
-3.52578, -4.00905, -2, 0, -0.5, 0.5, 0.5,
-3.52578, -4.00905, -2, 1, -0.5, 0.5, 0.5,
-3.52578, -4.00905, -2, 1, 1.5, 0.5, 0.5,
-3.52578, -4.00905, -2, 0, 1.5, 0.5, 0.5,
-3.52578, -4.00905, 0, 0, -0.5, 0.5, 0.5,
-3.52578, -4.00905, 0, 1, -0.5, 0.5, 0.5,
-3.52578, -4.00905, 0, 1, 1.5, 0.5, 0.5,
-3.52578, -4.00905, 0, 0, 1.5, 0.5, 0.5,
-3.52578, -4.00905, 2, 0, -0.5, 0.5, 0.5,
-3.52578, -4.00905, 2, 1, -0.5, 0.5, 0.5,
-3.52578, -4.00905, 2, 1, 1.5, 0.5, 0.5,
-3.52578, -4.00905, 2, 0, 1.5, 0.5, 0.5,
-3.52578, -4.00905, 4, 0, -0.5, 0.5, 0.5,
-3.52578, -4.00905, 4, 1, -0.5, 0.5, 0.5,
-3.52578, -4.00905, 4, 1, 1.5, 0.5, 0.5,
-3.52578, -4.00905, 4, 0, 1.5, 0.5, 0.5
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
-3.061243, -3.508509, -5.138486,
-3.061243, 3.165375, -5.138486,
-3.061243, -3.508509, 4.976452,
-3.061243, 3.165375, 4.976452,
-3.061243, -3.508509, -5.138486,
-3.061243, -3.508509, 4.976452,
-3.061243, 3.165375, -5.138486,
-3.061243, 3.165375, 4.976452,
-3.061243, -3.508509, -5.138486,
3.132587, -3.508509, -5.138486,
-3.061243, -3.508509, 4.976452,
3.132587, -3.508509, 4.976452,
-3.061243, 3.165375, -5.138486,
3.132587, 3.165375, -5.138486,
-3.061243, 3.165375, 4.976452,
3.132587, 3.165375, 4.976452,
3.132587, -3.508509, -5.138486,
3.132587, 3.165375, -5.138486,
3.132587, -3.508509, 4.976452,
3.132587, 3.165375, 4.976452,
3.132587, -3.508509, -5.138486,
3.132587, -3.508509, 4.976452,
3.132587, 3.165375, -5.138486,
3.132587, 3.165375, 4.976452
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
var radius = 7.267164;
var distance = 32.33244;
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
mvMatrix.translate( -0.03567195, 0.1715671, 0.08101702 );
mvMatrix.scale( 1.268585, 1.177336, 0.7768115 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.33244);
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
ammonium_iron_methyl<-read.table("ammonium_iron_methyl.xyz", skip=1)
```

```
## Error in read.table("ammonium_iron_methyl.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-ammonium_iron_methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_iron_methyl' not found
```

```r
y<-ammonium_iron_methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_iron_methyl' not found
```

```r
z<-ammonium_iron_methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_iron_methyl' not found
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
-2.971042, 1.270943, -0.1867284, 0, 0, 1, 1, 1,
-2.827725, 0.4293867, -1.707799, 1, 0, 0, 1, 1,
-2.700194, -0.1452418, -1.784865, 1, 0, 0, 1, 1,
-2.585313, -0.6804256, -2.862805, 1, 0, 0, 1, 1,
-2.565897, 0.2618198, -0.6746617, 1, 0, 0, 1, 1,
-2.451605, -1.156191, -3.164598, 1, 0, 0, 1, 1,
-2.398014, -0.9173616, -1.391674, 0, 0, 0, 1, 1,
-2.383336, 0.4758707, -0.6511878, 0, 0, 0, 1, 1,
-2.382928, -1.770221, 0.2887118, 0, 0, 0, 1, 1,
-2.271194, 1.101714, 0.2214655, 0, 0, 0, 1, 1,
-2.2555, 1.074439, 0.1729038, 0, 0, 0, 1, 1,
-2.212919, -0.3119864, -2.480802, 0, 0, 0, 1, 1,
-2.190518, -0.9370985, -3.107426, 0, 0, 0, 1, 1,
-2.189571, 0.9606106, -0.9807396, 1, 1, 1, 1, 1,
-2.18898, 1.276512, -2.233597, 1, 1, 1, 1, 1,
-2.185652, -0.5639286, -0.1637859, 1, 1, 1, 1, 1,
-2.150498, 0.07488006, -1.625631, 1, 1, 1, 1, 1,
-2.09765, 3.068182, -0.8070266, 1, 1, 1, 1, 1,
-2.089218, 1.475643, 0.6542209, 1, 1, 1, 1, 1,
-2.059687, 1.061263, -0.892327, 1, 1, 1, 1, 1,
-2.044796, -0.0154829, -1.416969, 1, 1, 1, 1, 1,
-2.02804, 0.2211037, -2.09862, 1, 1, 1, 1, 1,
-2.023565, 0.2203834, -2.411823, 1, 1, 1, 1, 1,
-1.998972, -1.11997, -1.617765, 1, 1, 1, 1, 1,
-1.984048, 0.9035171, 0.160242, 1, 1, 1, 1, 1,
-1.976247, -0.5177196, -1.662448, 1, 1, 1, 1, 1,
-1.973086, -0.2084605, -2.563442, 1, 1, 1, 1, 1,
-1.972184, 0.1996539, -1.03807, 1, 1, 1, 1, 1,
-1.964736, 0.7890676, -0.6653949, 0, 0, 1, 1, 1,
-1.961358, -0.007794681, -0.8020686, 1, 0, 0, 1, 1,
-1.953867, 0.7286718, -2.356785, 1, 0, 0, 1, 1,
-1.937207, -0.6550735, -1.791706, 1, 0, 0, 1, 1,
-1.933763, -0.02191991, -0.3263921, 1, 0, 0, 1, 1,
-1.921074, 0.5362561, 0.882395, 1, 0, 0, 1, 1,
-1.890569, 1.760703, -1.500319, 0, 0, 0, 1, 1,
-1.85052, -1.504684, -3.413396, 0, 0, 0, 1, 1,
-1.817059, 0.2771774, 0.1431648, 0, 0, 0, 1, 1,
-1.816992, -0.2214749, -1.788313, 0, 0, 0, 1, 1,
-1.816025, 1.622582, -1.743201, 0, 0, 0, 1, 1,
-1.807817, 0.5977477, -1.892899, 0, 0, 0, 1, 1,
-1.78841, 0.3344587, -0.3144561, 0, 0, 0, 1, 1,
-1.787652, -0.670037, -2.461642, 1, 1, 1, 1, 1,
-1.776631, 1.673944, -1.493208, 1, 1, 1, 1, 1,
-1.764257, -1.674785, -4.617742, 1, 1, 1, 1, 1,
-1.759168, 1.199274, 0.7290921, 1, 1, 1, 1, 1,
-1.755689, -2.376943, -3.769954, 1, 1, 1, 1, 1,
-1.755059, 1.042692, -0.9237338, 1, 1, 1, 1, 1,
-1.750551, -1.081464, -1.356852, 1, 1, 1, 1, 1,
-1.73712, 0.8689517, -2.667241, 1, 1, 1, 1, 1,
-1.715206, -0.4501023, -0.3922727, 1, 1, 1, 1, 1,
-1.686714, -0.01304706, -3.254053, 1, 1, 1, 1, 1,
-1.672709, 2.178073, -2.002831, 1, 1, 1, 1, 1,
-1.650534, -0.4348873, -4.35867, 1, 1, 1, 1, 1,
-1.649646, 0.7786457, -2.523208, 1, 1, 1, 1, 1,
-1.644433, -1.27228, -2.578527, 1, 1, 1, 1, 1,
-1.620916, -0.1905728, -2.056845, 1, 1, 1, 1, 1,
-1.602959, -1.082085, -1.471901, 0, 0, 1, 1, 1,
-1.602231, 1.945643, 0.07299709, 1, 0, 0, 1, 1,
-1.59454, -0.6675044, -1.492749, 1, 0, 0, 1, 1,
-1.593033, -1.587545, -2.134741, 1, 0, 0, 1, 1,
-1.577931, -0.1014205, -2.657647, 1, 0, 0, 1, 1,
-1.554684, 0.05581146, 0.4144768, 1, 0, 0, 1, 1,
-1.55447, 0.126435, -1.902979, 0, 0, 0, 1, 1,
-1.549969, -0.4593264, -0.5169441, 0, 0, 0, 1, 1,
-1.548674, 0.1256751, -0.4602804, 0, 0, 0, 1, 1,
-1.545474, 0.08990969, -1.613305, 0, 0, 0, 1, 1,
-1.542619, 1.019794, -0.4500768, 0, 0, 0, 1, 1,
-1.534882, 0.386315, -2.562197, 0, 0, 0, 1, 1,
-1.53459, -0.9681058, -1.370892, 0, 0, 0, 1, 1,
-1.515335, -0.5428606, -3.755759, 1, 1, 1, 1, 1,
-1.51059, 0.9226623, 0.2618027, 1, 1, 1, 1, 1,
-1.50861, 0.7348836, 0.1998497, 1, 1, 1, 1, 1,
-1.496057, -1.863315, -1.790699, 1, 1, 1, 1, 1,
-1.472264, 0.9800497, -1.158597, 1, 1, 1, 1, 1,
-1.470708, -0.6259063, -1.836016, 1, 1, 1, 1, 1,
-1.465662, 0.5777627, -2.650543, 1, 1, 1, 1, 1,
-1.465024, -0.134812, -2.107499, 1, 1, 1, 1, 1,
-1.464127, 0.6090789, -1.969737, 1, 1, 1, 1, 1,
-1.44631, 0.4330797, -3.172037, 1, 1, 1, 1, 1,
-1.4314, -1.021154, -3.242375, 1, 1, 1, 1, 1,
-1.420777, 0.2960302, -2.450155, 1, 1, 1, 1, 1,
-1.416546, -1.058285, -2.651927, 1, 1, 1, 1, 1,
-1.412549, -0.3346923, -1.612469, 1, 1, 1, 1, 1,
-1.401704, -0.6346691, -2.567806, 1, 1, 1, 1, 1,
-1.36038, 0.05945747, -1.635579, 0, 0, 1, 1, 1,
-1.35341, 0.5471954, -1.25144, 1, 0, 0, 1, 1,
-1.352361, 1.013281, -1.654141, 1, 0, 0, 1, 1,
-1.351264, 0.14409, -1.795937, 1, 0, 0, 1, 1,
-1.34181, -1.034016, -1.594816, 1, 0, 0, 1, 1,
-1.340925, 0.2700826, -0.4060321, 1, 0, 0, 1, 1,
-1.338945, -1.077719, -3.272192, 0, 0, 0, 1, 1,
-1.328006, -0.3737545, -1.465529, 0, 0, 0, 1, 1,
-1.327014, 0.1200289, -0.9900478, 0, 0, 0, 1, 1,
-1.326316, 0.2758676, -2.67933, 0, 0, 0, 1, 1,
-1.318932, 1.038201, -2.398885, 0, 0, 0, 1, 1,
-1.312556, -1.528116, -3.306705, 0, 0, 0, 1, 1,
-1.311014, -0.668538, -1.778555, 0, 0, 0, 1, 1,
-1.289586, -1.365914, -3.255267, 1, 1, 1, 1, 1,
-1.288886, -2.147725, -3.006345, 1, 1, 1, 1, 1,
-1.284069, 0.290304, -1.031336, 1, 1, 1, 1, 1,
-1.270718, -1.110276, -2.365561, 1, 1, 1, 1, 1,
-1.268784, -1.085543, -0.7892007, 1, 1, 1, 1, 1,
-1.265166, -0.5441749, -3.370125, 1, 1, 1, 1, 1,
-1.265114, 0.1178999, -2.621466, 1, 1, 1, 1, 1,
-1.264268, -0.5101023, -2.618537, 1, 1, 1, 1, 1,
-1.25976, 0.1586479, -2.327979, 1, 1, 1, 1, 1,
-1.253688, 2.273491, -0.7227997, 1, 1, 1, 1, 1,
-1.25084, 0.6600869, -3.032341, 1, 1, 1, 1, 1,
-1.250053, 0.5128832, -0.963913, 1, 1, 1, 1, 1,
-1.248429, -0.6126781, -1.344803, 1, 1, 1, 1, 1,
-1.247977, -1.443336, -2.698007, 1, 1, 1, 1, 1,
-1.244638, 2.253899, -0.7045407, 1, 1, 1, 1, 1,
-1.242429, 0.4854981, -2.499985, 0, 0, 1, 1, 1,
-1.237783, 0.7415857, -0.9455346, 1, 0, 0, 1, 1,
-1.23679, 0.2516847, -0.3804449, 1, 0, 0, 1, 1,
-1.234036, -0.7539693, -1.692936, 1, 0, 0, 1, 1,
-1.232747, 1.28836, 0.1716869, 1, 0, 0, 1, 1,
-1.232508, 0.1070587, -0.7545153, 1, 0, 0, 1, 1,
-1.230007, 0.02486364, -0.9096901, 0, 0, 0, 1, 1,
-1.226269, -0.7152624, -1.771518, 0, 0, 0, 1, 1,
-1.2249, -1.427971, -0.5149659, 0, 0, 0, 1, 1,
-1.220618, -0.9392621, -2.876954, 0, 0, 0, 1, 1,
-1.215102, 0.622066, -3.152728, 0, 0, 0, 1, 1,
-1.21427, -0.03252603, -1.259246, 0, 0, 0, 1, 1,
-1.20947, 0.05349844, -1.892993, 0, 0, 0, 1, 1,
-1.20921, -0.2955029, -2.851422, 1, 1, 1, 1, 1,
-1.203799, -0.5343531, -2.831143, 1, 1, 1, 1, 1,
-1.194103, -1.062036, -3.267158, 1, 1, 1, 1, 1,
-1.185047, 0.1335223, -3.216659, 1, 1, 1, 1, 1,
-1.184635, -0.283327, -1.384954, 1, 1, 1, 1, 1,
-1.182512, 1.508164, 1.913231, 1, 1, 1, 1, 1,
-1.175154, 0.7290404, -0.2853695, 1, 1, 1, 1, 1,
-1.169316, 0.1006176, -0.5321851, 1, 1, 1, 1, 1,
-1.159285, 0.3287333, -2.269078, 1, 1, 1, 1, 1,
-1.156509, -0.1071915, -1.05656, 1, 1, 1, 1, 1,
-1.155689, -1.222788, -2.598872, 1, 1, 1, 1, 1,
-1.153343, 0.6738831, -1.601912, 1, 1, 1, 1, 1,
-1.14882, 1.088571, -0.2373364, 1, 1, 1, 1, 1,
-1.143948, -1.02999, -1.336122, 1, 1, 1, 1, 1,
-1.138125, -1.552091, -4.437401, 1, 1, 1, 1, 1,
-1.130292, 0.459842, 0.4473721, 0, 0, 1, 1, 1,
-1.128849, -0.6124398, -0.2060083, 1, 0, 0, 1, 1,
-1.118899, 0.5459701, -0.9082951, 1, 0, 0, 1, 1,
-1.115164, -0.3398757, -1.697063, 1, 0, 0, 1, 1,
-1.113932, 0.7448897, -2.984621, 1, 0, 0, 1, 1,
-1.111985, 0.2269251, -2.197349, 1, 0, 0, 1, 1,
-1.107574, 0.8596636, -1.818786, 0, 0, 0, 1, 1,
-1.104749, 0.4112047, -1.131862, 0, 0, 0, 1, 1,
-1.081892, 1.717275, 1.140384, 0, 0, 0, 1, 1,
-1.077919, 0.8488879, -0.9527535, 0, 0, 0, 1, 1,
-1.07783, 0.8306991, -0.6701988, 0, 0, 0, 1, 1,
-1.076519, 0.06345535, -0.4093812, 0, 0, 0, 1, 1,
-1.074291, 1.774896, -2.873162, 0, 0, 0, 1, 1,
-1.070952, -0.1143411, -2.963684, 1, 1, 1, 1, 1,
-1.068594, 0.2594733, -1.295322, 1, 1, 1, 1, 1,
-1.068185, -1.246902, -4.00716, 1, 1, 1, 1, 1,
-1.058869, -0.1923755, -2.643383, 1, 1, 1, 1, 1,
-1.057118, 0.1063836, -0.4641116, 1, 1, 1, 1, 1,
-1.05558, 0.2062982, -1.008508, 1, 1, 1, 1, 1,
-1.04914, -0.8528189, -2.55146, 1, 1, 1, 1, 1,
-1.047752, 2.537898, -1.462832, 1, 1, 1, 1, 1,
-1.043176, 0.9362175, -2.218733, 1, 1, 1, 1, 1,
-1.041194, 0.7651728, -1.151596, 1, 1, 1, 1, 1,
-1.036004, 0.08406171, -0.8289221, 1, 1, 1, 1, 1,
-1.035871, -0.606774, -0.7800307, 1, 1, 1, 1, 1,
-1.031826, -0.5001285, -1.94019, 1, 1, 1, 1, 1,
-1.030441, 0.3227768, -1.184424, 1, 1, 1, 1, 1,
-1.027181, 1.439022, -1.585012, 1, 1, 1, 1, 1,
-1.023525, 0.7124172, -1.237203, 0, 0, 1, 1, 1,
-0.9969891, 0.5156767, -1.968112, 1, 0, 0, 1, 1,
-0.9966012, -1.677549, -2.404332, 1, 0, 0, 1, 1,
-0.9960498, -0.274099, -1.999612, 1, 0, 0, 1, 1,
-0.9880801, -0.4621854, -1.633393, 1, 0, 0, 1, 1,
-0.9831338, 0.04522632, -0.5043191, 1, 0, 0, 1, 1,
-0.9712514, -0.08128349, -3.432878, 0, 0, 0, 1, 1,
-0.9708933, 1.302434, -0.1821654, 0, 0, 0, 1, 1,
-0.9680107, -0.4397495, -0.4104682, 0, 0, 0, 1, 1,
-0.9673682, 1.582898, -1.189078, 0, 0, 0, 1, 1,
-0.953665, -2.28864, -2.829038, 0, 0, 0, 1, 1,
-0.9515801, 1.681678, -0.5397645, 0, 0, 0, 1, 1,
-0.9450192, 1.690596, 0.5652158, 0, 0, 0, 1, 1,
-0.9428253, 0.5735571, -0.630289, 1, 1, 1, 1, 1,
-0.9356887, 1.006905, 0.6947206, 1, 1, 1, 1, 1,
-0.9354699, -0.04605747, -1.983062, 1, 1, 1, 1, 1,
-0.9335837, -1.275559, -1.488482, 1, 1, 1, 1, 1,
-0.9316661, 0.01356228, -1.263586, 1, 1, 1, 1, 1,
-0.9286683, -0.2784604, -1.878042, 1, 1, 1, 1, 1,
-0.9279876, 2.20172, -2.21278, 1, 1, 1, 1, 1,
-0.9236734, -0.3813451, -1.478965, 1, 1, 1, 1, 1,
-0.9168834, -2.087047, -1.935091, 1, 1, 1, 1, 1,
-0.9164075, 0.06195851, 0.04104615, 1, 1, 1, 1, 1,
-0.9082006, 1.465796, -0.4200001, 1, 1, 1, 1, 1,
-0.9069861, 0.4685737, 0.8827094, 1, 1, 1, 1, 1,
-0.8882821, 0.3311642, -1.885124, 1, 1, 1, 1, 1,
-0.8854551, -0.6143469, -0.7795472, 1, 1, 1, 1, 1,
-0.8798043, 1.647455, 0.4618889, 1, 1, 1, 1, 1,
-0.8749772, 0.5796398, -1.043445, 0, 0, 1, 1, 1,
-0.8660979, 0.1237438, -1.743436, 1, 0, 0, 1, 1,
-0.8605272, -0.5224331, -0.05684802, 1, 0, 0, 1, 1,
-0.8528762, -1.181555, -3.225204, 1, 0, 0, 1, 1,
-0.850315, 1.818645, 1.655765, 1, 0, 0, 1, 1,
-0.8502173, -2.30466, -3.703358, 1, 0, 0, 1, 1,
-0.8435643, 1.541009, -0.2678955, 0, 0, 0, 1, 1,
-0.8430035, 0.7720217, 1.5048, 0, 0, 0, 1, 1,
-0.8344803, -1.695444, -3.674216, 0, 0, 0, 1, 1,
-0.8303311, 0.3043817, -2.114963, 0, 0, 0, 1, 1,
-0.8298441, 0.1451038, -1.249863, 0, 0, 0, 1, 1,
-0.8295934, -0.169066, -2.223426, 0, 0, 0, 1, 1,
-0.8270022, 1.697939, -0.005565328, 0, 0, 0, 1, 1,
-0.8199898, 0.158928, -0.6033242, 1, 1, 1, 1, 1,
-0.8199875, 2.041955, -0.2454989, 1, 1, 1, 1, 1,
-0.8147533, -0.5781122, -1.09115, 1, 1, 1, 1, 1,
-0.8122991, -0.4599505, -1.411468, 1, 1, 1, 1, 1,
-0.8014449, -1.099952, -3.085773, 1, 1, 1, 1, 1,
-0.7996373, 0.0300823, -3.799078, 1, 1, 1, 1, 1,
-0.7989513, -1.761566, -1.848042, 1, 1, 1, 1, 1,
-0.7972568, 0.3638597, -0.2387321, 1, 1, 1, 1, 1,
-0.7845491, -1.988452, -2.905392, 1, 1, 1, 1, 1,
-0.783388, -1.733381, -4.610022, 1, 1, 1, 1, 1,
-0.7812995, 1.55865, 0.008295942, 1, 1, 1, 1, 1,
-0.7811247, -0.9372142, -2.642154, 1, 1, 1, 1, 1,
-0.7769879, 0.2029282, -2.524319, 1, 1, 1, 1, 1,
-0.7736436, 0.1102661, -1.777422, 1, 1, 1, 1, 1,
-0.7688124, -0.1646177, -4.568706, 1, 1, 1, 1, 1,
-0.7639384, -2.086507, -2.466466, 0, 0, 1, 1, 1,
-0.759402, 0.7317814, -0.7159583, 1, 0, 0, 1, 1,
-0.7581763, 0.5084186, -1.694777, 1, 0, 0, 1, 1,
-0.75373, 1.56965, -1.00283, 1, 0, 0, 1, 1,
-0.7495185, -0.5987189, -4.4331, 1, 0, 0, 1, 1,
-0.7473839, -0.360543, -2.15267, 1, 0, 0, 1, 1,
-0.7400216, 1.076686, -1.097373, 0, 0, 0, 1, 1,
-0.739892, 0.3582536, -1.306908, 0, 0, 0, 1, 1,
-0.7393096, -1.494608, -3.620287, 0, 0, 0, 1, 1,
-0.7369109, 0.3245365, -2.00862, 0, 0, 0, 1, 1,
-0.7365292, 1.497141, 0.3982121, 0, 0, 0, 1, 1,
-0.7305603, -0.4839187, -2.553836, 0, 0, 0, 1, 1,
-0.7179803, -0.6599575, -2.587833, 0, 0, 0, 1, 1,
-0.7149004, 0.5766867, 0.9678991, 1, 1, 1, 1, 1,
-0.7114646, -0.2188643, -2.089151, 1, 1, 1, 1, 1,
-0.7108235, -2.529572, -3.387224, 1, 1, 1, 1, 1,
-0.7104862, -0.5679775, -3.437656, 1, 1, 1, 1, 1,
-0.7097823, 0.779582, -2.055587, 1, 1, 1, 1, 1,
-0.7096727, -1.01593, -1.397289, 1, 1, 1, 1, 1,
-0.706611, -0.2619961, -1.58079, 1, 1, 1, 1, 1,
-0.7057322, -0.2653112, -2.119221, 1, 1, 1, 1, 1,
-0.7005885, 1.083291, -0.4360977, 1, 1, 1, 1, 1,
-0.6999463, 1.207623, -0.1996686, 1, 1, 1, 1, 1,
-0.6983413, 0.2149231, -1.936897, 1, 1, 1, 1, 1,
-0.6974777, 0.4160129, -1.44033, 1, 1, 1, 1, 1,
-0.6907665, 1.242686, -0.2240297, 1, 1, 1, 1, 1,
-0.6884318, 2.073653, -1.535306, 1, 1, 1, 1, 1,
-0.6724885, -0.9437019, -1.9041, 1, 1, 1, 1, 1,
-0.6683813, -3.201745, -2.440461, 0, 0, 1, 1, 1,
-0.6681812, 0.1231387, -1.861782, 1, 0, 0, 1, 1,
-0.6680878, -1.905065, -2.109291, 1, 0, 0, 1, 1,
-0.6670205, 1.123737, 1.258969, 1, 0, 0, 1, 1,
-0.6629058, 0.828559, -1.253587, 1, 0, 0, 1, 1,
-0.6605476, 0.5255544, -0.2312953, 1, 0, 0, 1, 1,
-0.6600283, -1.168904, -4.22936, 0, 0, 0, 1, 1,
-0.6596715, -1.529807, -2.714913, 0, 0, 0, 1, 1,
-0.6532676, 0.09715078, -2.487576, 0, 0, 0, 1, 1,
-0.6502944, 1.21021, -0.5852929, 0, 0, 0, 1, 1,
-0.6424889, -0.1995881, -1.69208, 0, 0, 0, 1, 1,
-0.6423745, -0.003309112, -0.4662151, 0, 0, 0, 1, 1,
-0.6365675, 0.07766265, -2.704746, 0, 0, 0, 1, 1,
-0.6362497, -0.4140404, -2.00259, 1, 1, 1, 1, 1,
-0.6302059, -0.9818377, -1.98164, 1, 1, 1, 1, 1,
-0.6294094, 1.773997, -0.1226062, 1, 1, 1, 1, 1,
-0.6247464, 0.047898, -0.2835983, 1, 1, 1, 1, 1,
-0.6234301, 0.3759162, 0.4105051, 1, 1, 1, 1, 1,
-0.6214491, 1.950685, 0.7060902, 1, 1, 1, 1, 1,
-0.6183417, -0.281823, -0.9383622, 1, 1, 1, 1, 1,
-0.61695, 0.4505346, -1.174644, 1, 1, 1, 1, 1,
-0.6166313, 0.04247568, -1.108048, 1, 1, 1, 1, 1,
-0.615365, -0.8870972, -4.121075, 1, 1, 1, 1, 1,
-0.6103619, 0.1092839, -3.94745, 1, 1, 1, 1, 1,
-0.6099801, -1.214578, -3.469822, 1, 1, 1, 1, 1,
-0.6090887, -1.969106, -3.892642, 1, 1, 1, 1, 1,
-0.6053128, -0.7785692, -1.435807, 1, 1, 1, 1, 1,
-0.600966, -0.5168847, -1.685441, 1, 1, 1, 1, 1,
-0.5956194, 0.7866766, -0.7807854, 0, 0, 1, 1, 1,
-0.5951555, -0.4358472, -2.134298, 1, 0, 0, 1, 1,
-0.5912064, 0.3716569, 0.1294922, 1, 0, 0, 1, 1,
-0.5884918, 0.305494, -1.196807, 1, 0, 0, 1, 1,
-0.5854661, -0.1221105, -1.088166, 1, 0, 0, 1, 1,
-0.582121, -0.495449, -2.562811, 1, 0, 0, 1, 1,
-0.5804887, -0.8064866, -2.181669, 0, 0, 0, 1, 1,
-0.579411, -0.4825755, -0.8044134, 0, 0, 0, 1, 1,
-0.5783304, -0.50445, -4.355056, 0, 0, 0, 1, 1,
-0.5714126, 0.3212361, -2.990491, 0, 0, 0, 1, 1,
-0.5699481, -0.3382718, -3.614783, 0, 0, 0, 1, 1,
-0.5674138, -1.213015, -3.24102, 0, 0, 0, 1, 1,
-0.5671634, -1.831534, -2.436808, 0, 0, 0, 1, 1,
-0.5596601, -0.9480107, -3.554916, 1, 1, 1, 1, 1,
-0.5594249, -2.354887, -2.660616, 1, 1, 1, 1, 1,
-0.5532779, 1.928262, 0.9780834, 1, 1, 1, 1, 1,
-0.5515555, 0.3831156, -0.5400831, 1, 1, 1, 1, 1,
-0.5509053, 1.259084, 0.7047719, 1, 1, 1, 1, 1,
-0.5496485, 1.321486, 0.7928576, 1, 1, 1, 1, 1,
-0.5484101, 0.4349134, -0.267624, 1, 1, 1, 1, 1,
-0.5455198, -2.164383, -2.601958, 1, 1, 1, 1, 1,
-0.5385809, -1.018229, -3.591042, 1, 1, 1, 1, 1,
-0.5380381, 0.886246, -0.1707251, 1, 1, 1, 1, 1,
-0.5372141, 1.74932, -0.1096286, 1, 1, 1, 1, 1,
-0.5348989, -0.1064411, -0.7567425, 1, 1, 1, 1, 1,
-0.5343704, 0.4281456, -2.964466, 1, 1, 1, 1, 1,
-0.5327091, 0.6470843, -1.652456, 1, 1, 1, 1, 1,
-0.5319543, 0.1897855, -1.481809, 1, 1, 1, 1, 1,
-0.5278009, 0.6400007, 0.6643987, 0, 0, 1, 1, 1,
-0.52375, 0.4598844, -1.435611, 1, 0, 0, 1, 1,
-0.5117975, -1.084164, -2.369261, 1, 0, 0, 1, 1,
-0.5116336, 0.0516707, -1.533468, 1, 0, 0, 1, 1,
-0.5094266, 1.128075, -0.6896445, 1, 0, 0, 1, 1,
-0.5052366, -0.8242261, -2.499667, 1, 0, 0, 1, 1,
-0.5026345, -0.1309708, -3.048352, 0, 0, 0, 1, 1,
-0.5025865, -0.5555045, -3.982922, 0, 0, 0, 1, 1,
-0.5003743, -1.779632, -2.734755, 0, 0, 0, 1, 1,
-0.4972171, -1.708598, -3.86895, 0, 0, 0, 1, 1,
-0.4961817, 0.06083577, -0.2846927, 0, 0, 0, 1, 1,
-0.4930933, -0.04104698, -0.7202958, 0, 0, 0, 1, 1,
-0.4930467, -0.331887, -2.219295, 0, 0, 0, 1, 1,
-0.4914164, -1.020548, -1.101617, 1, 1, 1, 1, 1,
-0.488548, 1.624108, -0.03150817, 1, 1, 1, 1, 1,
-0.4806886, -0.3899495, -1.2265, 1, 1, 1, 1, 1,
-0.4795013, -0.4615259, -2.324403, 1, 1, 1, 1, 1,
-0.4692057, -0.05725391, -1.018913, 1, 1, 1, 1, 1,
-0.4680427, -0.2645029, -2.006821, 1, 1, 1, 1, 1,
-0.4667132, -0.3497925, -2.084367, 1, 1, 1, 1, 1,
-0.4658162, 0.7112629, -0.3276381, 1, 1, 1, 1, 1,
-0.4645937, 1.574546, 0.1828597, 1, 1, 1, 1, 1,
-0.4639419, 1.871882, 0.3965572, 1, 1, 1, 1, 1,
-0.4594946, 1.217365, -1.685699, 1, 1, 1, 1, 1,
-0.4594736, 0.1953271, 0.3891558, 1, 1, 1, 1, 1,
-0.4566098, -0.1579372, -1.982651, 1, 1, 1, 1, 1,
-0.4561672, 0.006618856, -0.600485, 1, 1, 1, 1, 1,
-0.4532819, 0.2463412, -1.178449, 1, 1, 1, 1, 1,
-0.4493069, -1.029301, -3.774662, 0, 0, 1, 1, 1,
-0.4482741, 0.08328149, -1.10674, 1, 0, 0, 1, 1,
-0.4480845, -0.9649625, -3.253402, 1, 0, 0, 1, 1,
-0.4436358, 0.4886433, -0.5530918, 1, 0, 0, 1, 1,
-0.4433323, 0.8851377, -1.912937, 1, 0, 0, 1, 1,
-0.4419849, 0.7190162, -1.039364, 1, 0, 0, 1, 1,
-0.4327647, 0.7380292, 0.07638557, 0, 0, 0, 1, 1,
-0.4317739, 0.09839828, -1.644352, 0, 0, 0, 1, 1,
-0.4314775, -1.066955, -2.988554, 0, 0, 0, 1, 1,
-0.4300056, -0.1911007, -2.986162, 0, 0, 0, 1, 1,
-0.4289928, 0.6015882, 0.4774702, 0, 0, 0, 1, 1,
-0.4276739, 0.4128138, 0.6687557, 0, 0, 0, 1, 1,
-0.424695, -1.072473, -2.547126, 0, 0, 0, 1, 1,
-0.4223531, -1.195225, -4.495594, 1, 1, 1, 1, 1,
-0.4192347, 1.581412, -1.488893, 1, 1, 1, 1, 1,
-0.41784, 0.7821082, 0.001172903, 1, 1, 1, 1, 1,
-0.4154573, 2.360961, 1.522259, 1, 1, 1, 1, 1,
-0.4145298, -1.316078, -4.815291, 1, 1, 1, 1, 1,
-0.4143859, 0.2948492, -0.6942584, 1, 1, 1, 1, 1,
-0.4131812, -0.3226642, -2.55438, 1, 1, 1, 1, 1,
-0.4115172, -1.227779, -2.049116, 1, 1, 1, 1, 1,
-0.4114245, -0.2245067, -1.701121, 1, 1, 1, 1, 1,
-0.4037659, -0.2457167, -3.610997, 1, 1, 1, 1, 1,
-0.3982955, -1.089574, -3.346171, 1, 1, 1, 1, 1,
-0.3978875, 0.2703744, 0.4124994, 1, 1, 1, 1, 1,
-0.3976286, 1.492666, 0.2299075, 1, 1, 1, 1, 1,
-0.3951616, 1.340101, -0.4442525, 1, 1, 1, 1, 1,
-0.3920694, 0.5660487, -1.619758, 1, 1, 1, 1, 1,
-0.3916477, 0.6071016, -1.232205, 0, 0, 1, 1, 1,
-0.3877192, 0.8022013, -0.7396419, 1, 0, 0, 1, 1,
-0.3847021, -0.1691291, -2.136192, 1, 0, 0, 1, 1,
-0.3764975, -1.373081, -4.991181, 1, 0, 0, 1, 1,
-0.3724229, 0.8755505, 0.6776515, 1, 0, 0, 1, 1,
-0.37011, -0.3764604, -1.785354, 1, 0, 0, 1, 1,
-0.3650933, -0.1728189, -2.249229, 0, 0, 0, 1, 1,
-0.3642878, 1.036496, 0.2871988, 0, 0, 0, 1, 1,
-0.363201, 1.129897, 0.3328706, 0, 0, 0, 1, 1,
-0.3622319, -1.631961, -4.007834, 0, 0, 0, 1, 1,
-0.3608777, 0.6086078, -0.1039152, 0, 0, 0, 1, 1,
-0.3582647, 0.3646002, -0.8467494, 0, 0, 0, 1, 1,
-0.3530853, 0.3689249, -0.784061, 0, 0, 0, 1, 1,
-0.3477565, 0.7378997, -1.670025, 1, 1, 1, 1, 1,
-0.3451455, 1.740322, 0.2895238, 1, 1, 1, 1, 1,
-0.3442558, 1.53565, 0.9666903, 1, 1, 1, 1, 1,
-0.3435675, -1.130309, -1.150714, 1, 1, 1, 1, 1,
-0.339134, 2.354755, 0.2771213, 1, 1, 1, 1, 1,
-0.3347456, 0.2692166, -1.266516, 1, 1, 1, 1, 1,
-0.3310584, -0.1165861, -2.040407, 1, 1, 1, 1, 1,
-0.3303055, 0.2383481, 0.01460026, 1, 1, 1, 1, 1,
-0.3294927, 0.817555, 1.226031, 1, 1, 1, 1, 1,
-0.3292717, 0.106207, -1.027857, 1, 1, 1, 1, 1,
-0.3284283, 0.3131831, -0.4530256, 1, 1, 1, 1, 1,
-0.3279555, -0.6249331, -1.767952, 1, 1, 1, 1, 1,
-0.3228552, 0.02073679, -1.556096, 1, 1, 1, 1, 1,
-0.3208262, -0.244188, -1.714588, 1, 1, 1, 1, 1,
-0.3174246, 1.804781, -0.219486, 1, 1, 1, 1, 1,
-0.3140712, 1.592568, -2.072523, 0, 0, 1, 1, 1,
-0.3112258, 0.399778, -1.037056, 1, 0, 0, 1, 1,
-0.310701, -0.787774, -1.276873, 1, 0, 0, 1, 1,
-0.3090687, 0.3023988, 0.2476042, 1, 0, 0, 1, 1,
-0.307279, -0.6955789, -2.072169, 1, 0, 0, 1, 1,
-0.3041799, 0.91095, 0.09043097, 1, 0, 0, 1, 1,
-0.3000555, -0.7324024, -3.7328, 0, 0, 0, 1, 1,
-0.2969826, -0.4655794, -1.697841, 0, 0, 0, 1, 1,
-0.2961112, -2.268492, -3.174599, 0, 0, 0, 1, 1,
-0.2935705, 0.769638, -1.26428, 0, 0, 0, 1, 1,
-0.2924343, -0.005963407, -1.687147, 0, 0, 0, 1, 1,
-0.2901129, 1.147992, -0.6556499, 0, 0, 0, 1, 1,
-0.2802998, -0.6276215, -2.768687, 0, 0, 0, 1, 1,
-0.2799592, 0.6727571, -0.2292132, 1, 1, 1, 1, 1,
-0.2762833, -1.575879, -3.198126, 1, 1, 1, 1, 1,
-0.2693151, -0.6640347, -3.190358, 1, 1, 1, 1, 1,
-0.2664565, -1.941951, -4.406744, 1, 1, 1, 1, 1,
-0.2611194, 1.554889, 0.2921617, 1, 1, 1, 1, 1,
-0.2606879, 1.196594, -1.524643, 1, 1, 1, 1, 1,
-0.2605793, 0.9535671, -1.040956, 1, 1, 1, 1, 1,
-0.2573532, -1.055189, -2.611423, 1, 1, 1, 1, 1,
-0.2500342, -0.9061037, -2.73224, 1, 1, 1, 1, 1,
-0.2476797, 0.7850724, -0.5877519, 1, 1, 1, 1, 1,
-0.2410937, -1.327189, -2.436196, 1, 1, 1, 1, 1,
-0.237732, 1.169642, -1.121597, 1, 1, 1, 1, 1,
-0.2359141, 1.918027, -0.3386457, 1, 1, 1, 1, 1,
-0.2355753, 1.877233, -0.2210853, 1, 1, 1, 1, 1,
-0.233038, 0.5500288, -0.6489359, 1, 1, 1, 1, 1,
-0.2148284, 0.2471434, -0.8109434, 0, 0, 1, 1, 1,
-0.2087852, 0.6387156, 0.3213336, 1, 0, 0, 1, 1,
-0.2080167, 1.593163, -0.4514169, 1, 0, 0, 1, 1,
-0.2070367, -0.8411982, -2.915375, 1, 0, 0, 1, 1,
-0.2070356, 1.046323, 0.432345, 1, 0, 0, 1, 1,
-0.1987435, 0.275895, -1.284616, 1, 0, 0, 1, 1,
-0.1972152, 0.8603877, -1.703781, 0, 0, 0, 1, 1,
-0.197115, -0.06687545, -1.279719, 0, 0, 0, 1, 1,
-0.1965178, 0.401565, -1.906872, 0, 0, 0, 1, 1,
-0.1960102, 0.6364906, -0.6903965, 0, 0, 0, 1, 1,
-0.1897168, 0.8012688, -0.4122814, 0, 0, 0, 1, 1,
-0.1894058, -0.70994, -2.980422, 0, 0, 0, 1, 1,
-0.1870998, 0.01530762, 0.6165419, 0, 0, 0, 1, 1,
-0.1868935, -0.7110057, -1.322573, 1, 1, 1, 1, 1,
-0.1845125, -0.06902938, -4.236043, 1, 1, 1, 1, 1,
-0.1843246, 1.950804, -1.464191, 1, 1, 1, 1, 1,
-0.1827707, -0.4063005, -2.960892, 1, 1, 1, 1, 1,
-0.1821029, -2.75696, -3.013297, 1, 1, 1, 1, 1,
-0.1812429, 1.108092, -0.3256605, 1, 1, 1, 1, 1,
-0.1793567, -2.136247, -4.280314, 1, 1, 1, 1, 1,
-0.178332, 0.5763944, -0.7522867, 1, 1, 1, 1, 1,
-0.1744943, -0.06042589, -1.153239, 1, 1, 1, 1, 1,
-0.1742166, 0.3427004, 0.1056829, 1, 1, 1, 1, 1,
-0.1718691, 0.1638425, -0.9314177, 1, 1, 1, 1, 1,
-0.1713732, -0.763096, -4.716836, 1, 1, 1, 1, 1,
-0.1686087, -1.891891, -2.246188, 1, 1, 1, 1, 1,
-0.1683602, 2.05153, 0.3798979, 1, 1, 1, 1, 1,
-0.1655024, -0.5611725, -3.933461, 1, 1, 1, 1, 1,
-0.1620162, -0.8588827, -3.262341, 0, 0, 1, 1, 1,
-0.1595054, 1.04025, -1.397189, 1, 0, 0, 1, 1,
-0.154805, 1.841081, 0.9424668, 1, 0, 0, 1, 1,
-0.1434748, 0.4681131, -0.7983268, 1, 0, 0, 1, 1,
-0.1399637, -0.379497, -1.816668, 1, 0, 0, 1, 1,
-0.1389656, 0.0959435, -0.3098449, 1, 0, 0, 1, 1,
-0.1377725, -0.6252756, -3.07605, 0, 0, 0, 1, 1,
-0.1376344, 1.17066, 0.6394191, 0, 0, 0, 1, 1,
-0.1362192, -0.01267814, -2.518739, 0, 0, 0, 1, 1,
-0.1230692, 1.421261, -0.4103955, 0, 0, 0, 1, 1,
-0.118423, 0.9998185, -0.976117, 0, 0, 0, 1, 1,
-0.1138521, 2.008341, 2.385201, 0, 0, 0, 1, 1,
-0.1091773, 0.183577, 1.097801, 0, 0, 0, 1, 1,
-0.1088772, -0.483497, -3.547807, 1, 1, 1, 1, 1,
-0.1051485, 1.066633, 0.4823391, 1, 1, 1, 1, 1,
-0.1006565, 0.1740039, -0.1970137, 1, 1, 1, 1, 1,
-0.09917225, 0.8566533, -0.1233926, 1, 1, 1, 1, 1,
-0.09870691, -1.245845, -3.327642, 1, 1, 1, 1, 1,
-0.08578742, 0.7000837, 0.2498702, 1, 1, 1, 1, 1,
-0.08095685, -1.779662, -2.93483, 1, 1, 1, 1, 1,
-0.07993441, 1.195355, 0.01669466, 1, 1, 1, 1, 1,
-0.07976594, 0.1989974, -0.8550335, 1, 1, 1, 1, 1,
-0.07708938, 1.266592, 1.689076, 1, 1, 1, 1, 1,
-0.07642184, 0.7943516, -0.9796491, 1, 1, 1, 1, 1,
-0.07533782, -0.8566611, -1.961457, 1, 1, 1, 1, 1,
-0.07464854, -0.8528278, -2.106317, 1, 1, 1, 1, 1,
-0.07370688, 0.6212099, 0.1047099, 1, 1, 1, 1, 1,
-0.07322054, -0.4525857, -3.298057, 1, 1, 1, 1, 1,
-0.07100376, -1.562199, -1.804801, 0, 0, 1, 1, 1,
-0.06906902, -1.580031, -4.814984, 1, 0, 0, 1, 1,
-0.06351303, -1.217342, -2.230192, 1, 0, 0, 1, 1,
-0.06287339, -1.374341, -0.8401814, 1, 0, 0, 1, 1,
-0.05605123, 0.1586089, -1.228525, 1, 0, 0, 1, 1,
-0.05379271, -1.537303, -3.524755, 1, 0, 0, 1, 1,
-0.04896423, 0.6989149, 1.016108, 0, 0, 0, 1, 1,
-0.04685066, 1.748945, -1.324035, 0, 0, 0, 1, 1,
-0.04559191, -0.02675016, -2.91259, 0, 0, 0, 1, 1,
-0.04292406, -0.0114665, -2.257125, 0, 0, 0, 1, 1,
-0.0416834, -0.0386151, -2.759177, 0, 0, 0, 1, 1,
-0.0391761, -0.5610856, -2.260698, 0, 0, 0, 1, 1,
-0.03818089, -1.305655, -3.634474, 0, 0, 0, 1, 1,
-0.03805982, -0.5914346, -3.894871, 1, 1, 1, 1, 1,
-0.03247995, -0.4892524, -2.077505, 1, 1, 1, 1, 1,
-0.03191744, -1.337313, -3.234967, 1, 1, 1, 1, 1,
-0.0271008, 0.2015869, -0.7587463, 1, 1, 1, 1, 1,
-0.0237236, -1.012408, -3.322566, 1, 1, 1, 1, 1,
-0.02338415, 0.4375363, -2.187071, 1, 1, 1, 1, 1,
-0.01980581, 0.5542713, 0.1578014, 1, 1, 1, 1, 1,
-0.01833145, -0.810435, -3.637606, 1, 1, 1, 1, 1,
-0.01816115, -0.2017045, -2.396221, 1, 1, 1, 1, 1,
-0.01718584, -1.096621, -1.144813, 1, 1, 1, 1, 1,
-0.0112512, -1.325493, -1.713337, 1, 1, 1, 1, 1,
-0.01065969, -1.027048, -3.167508, 1, 1, 1, 1, 1,
-0.01058352, -0.05083608, -3.89274, 1, 1, 1, 1, 1,
-0.007288374, -0.08901519, -3.324684, 1, 1, 1, 1, 1,
-0.003626855, -0.05897506, -2.205771, 1, 1, 1, 1, 1,
-0.0002889407, -1.601305, -3.704467, 0, 0, 1, 1, 1,
0.002986501, 1.477244, -0.1177805, 1, 0, 0, 1, 1,
0.003548041, 0.3400809, -0.09895233, 1, 0, 0, 1, 1,
0.008086547, -2.298036, 3.898439, 1, 0, 0, 1, 1,
0.00861102, -0.5823035, 2.387968, 1, 0, 0, 1, 1,
0.009702962, 0.9070664, -0.06710346, 1, 0, 0, 1, 1,
0.01144646, 0.6753118, 0.5294692, 0, 0, 0, 1, 1,
0.01306485, 0.5378403, 1.170439, 0, 0, 0, 1, 1,
0.01366758, 0.1576893, 0.123574, 0, 0, 0, 1, 1,
0.01376725, -1.60468, 3.06923, 0, 0, 0, 1, 1,
0.01646975, -0.8769979, 3.972379, 0, 0, 0, 1, 1,
0.01738831, 0.7078264, 0.6541701, 0, 0, 0, 1, 1,
0.01914603, -0.3932664, 2.605746, 0, 0, 0, 1, 1,
0.02187094, 0.2196593, 0.4489617, 1, 1, 1, 1, 1,
0.0238949, -1.114979, 3.320527, 1, 1, 1, 1, 1,
0.02426313, 0.3748309, 0.9867436, 1, 1, 1, 1, 1,
0.0246365, -0.4462062, 4.19623, 1, 1, 1, 1, 1,
0.02719248, -0.8279932, 2.261088, 1, 1, 1, 1, 1,
0.02838415, -0.1579115, 2.589652, 1, 1, 1, 1, 1,
0.02990484, -0.01150626, 0.7460627, 1, 1, 1, 1, 1,
0.03484006, -0.1693542, 1.902489, 1, 1, 1, 1, 1,
0.03599428, -0.8865089, 3.909668, 1, 1, 1, 1, 1,
0.03662265, 0.6636821, -0.96896, 1, 1, 1, 1, 1,
0.04474841, -0.6508739, 0.9504665, 1, 1, 1, 1, 1,
0.04652701, 0.3396815, -0.4045898, 1, 1, 1, 1, 1,
0.0527233, 0.4571559, 1.057313, 1, 1, 1, 1, 1,
0.05406326, 0.6481307, 0.1162443, 1, 1, 1, 1, 1,
0.06814376, -0.3405026, 2.320847, 1, 1, 1, 1, 1,
0.06879957, -0.994901, 2.350986, 0, 0, 1, 1, 1,
0.07035992, -0.6408585, 2.243365, 1, 0, 0, 1, 1,
0.07382366, 1.448011, 0.01848694, 1, 0, 0, 1, 1,
0.07405902, 0.4821934, -1.018146, 1, 0, 0, 1, 1,
0.07428302, 0.25275, -1.508147, 1, 0, 0, 1, 1,
0.07753193, 0.1546763, 0.6661975, 1, 0, 0, 1, 1,
0.07948533, -0.05520587, 1.62635, 0, 0, 0, 1, 1,
0.09104813, -0.1232837, 2.58496, 0, 0, 0, 1, 1,
0.09480694, 1.64235, 1.143889, 0, 0, 0, 1, 1,
0.09749824, -0.3968372, 3.602318, 0, 0, 0, 1, 1,
0.09942133, -1.1917, 2.507743, 0, 0, 0, 1, 1,
0.1002378, -1.486281, 2.377988, 0, 0, 0, 1, 1,
0.1019877, -0.3919549, 0.4331162, 0, 0, 0, 1, 1,
0.1111832, 1.757686, -0.4359734, 1, 1, 1, 1, 1,
0.1130148, 0.5867539, 1.699654, 1, 1, 1, 1, 1,
0.1143325, 1.191301, 1.28144, 1, 1, 1, 1, 1,
0.1180887, -0.06274734, 2.354017, 1, 1, 1, 1, 1,
0.1187777, 2.278855, 1.598076, 1, 1, 1, 1, 1,
0.1252214, -0.4269022, -0.4153965, 1, 1, 1, 1, 1,
0.1258238, 0.9845247, 1.199677, 1, 1, 1, 1, 1,
0.1268734, -1.168762, 1.302031, 1, 1, 1, 1, 1,
0.1271068, -0.9085801, 3.897348, 1, 1, 1, 1, 1,
0.1293014, -0.6189356, 0.9458182, 1, 1, 1, 1, 1,
0.1296384, 0.4222527, -0.5854581, 1, 1, 1, 1, 1,
0.1347121, 1.341723, -0.6893514, 1, 1, 1, 1, 1,
0.1371693, 0.5679742, -1.810265, 1, 1, 1, 1, 1,
0.1386133, 0.4496191, 1.837117, 1, 1, 1, 1, 1,
0.1391185, -0.926075, 3.409522, 1, 1, 1, 1, 1,
0.145102, -1.202836, 3.316026, 0, 0, 1, 1, 1,
0.1455419, -0.884914, 4.735192, 1, 0, 0, 1, 1,
0.1485702, 1.705597, 1.574916, 1, 0, 0, 1, 1,
0.1515816, 0.001552795, 1.154558, 1, 0, 0, 1, 1,
0.1522143, -0.4635828, 2.495603, 1, 0, 0, 1, 1,
0.1535778, 2.019534, -1.698704, 1, 0, 0, 1, 1,
0.1641003, 2.488545, 0.1257671, 0, 0, 0, 1, 1,
0.1649553, 0.2050698, 1.491337, 0, 0, 0, 1, 1,
0.1651388, 1.775395, -1.583971, 0, 0, 0, 1, 1,
0.1687936, 1.444264, 1.888367, 0, 0, 0, 1, 1,
0.1701286, -0.1303211, 3.433749, 0, 0, 0, 1, 1,
0.1717711, -0.3405834, 2.671803, 0, 0, 0, 1, 1,
0.182863, 1.781752, 0.7690073, 0, 0, 0, 1, 1,
0.1852353, -0.509712, 2.174467, 1, 1, 1, 1, 1,
0.1877096, 0.6195596, -0.637467, 1, 1, 1, 1, 1,
0.188447, -1.155554, 3.564134, 1, 1, 1, 1, 1,
0.1922349, 0.3250271, 2.103979, 1, 1, 1, 1, 1,
0.1940489, 0.7065899, -0.4017942, 1, 1, 1, 1, 1,
0.2010759, 0.8971367, 0.7284172, 1, 1, 1, 1, 1,
0.207718, 0.5332617, -1.732399, 1, 1, 1, 1, 1,
0.2103609, 0.1134937, -0.2763194, 1, 1, 1, 1, 1,
0.2117275, 0.4520167, 1.142739, 1, 1, 1, 1, 1,
0.2162853, 0.9746675, 2.002785, 1, 1, 1, 1, 1,
0.2169081, -1.310223, 3.017588, 1, 1, 1, 1, 1,
0.2175238, 0.8709688, 0.4430923, 1, 1, 1, 1, 1,
0.219418, 1.479271, 0.557246, 1, 1, 1, 1, 1,
0.2230948, -0.6156346, 2.603493, 1, 1, 1, 1, 1,
0.2246743, 0.2975589, -0.4218261, 1, 1, 1, 1, 1,
0.2280395, -0.5369204, 4.132582, 0, 0, 1, 1, 1,
0.2299796, -1.546698, 3.194517, 1, 0, 0, 1, 1,
0.2303873, 2.358266, 1.200844, 1, 0, 0, 1, 1,
0.2309555, -0.9642853, 4.250731, 1, 0, 0, 1, 1,
0.2315685, 0.2982602, 1.434117, 1, 0, 0, 1, 1,
0.2327116, -2.739338, 1.767329, 1, 0, 0, 1, 1,
0.2369132, -1.629165, 3.245005, 0, 0, 0, 1, 1,
0.2398668, -0.07337675, 1.282004, 0, 0, 0, 1, 1,
0.2440663, 0.2718678, 3.295455, 0, 0, 0, 1, 1,
0.2449186, 1.160842, 1.041232, 0, 0, 0, 1, 1,
0.2460012, 1.84754, -1.147575, 0, 0, 0, 1, 1,
0.2511, 0.02738537, 1.317984, 0, 0, 0, 1, 1,
0.2536028, 0.2695059, 3.414281, 0, 0, 0, 1, 1,
0.2559941, -1.402599, 3.094771, 1, 1, 1, 1, 1,
0.2594794, 0.1698567, 1.718363, 1, 1, 1, 1, 1,
0.2609351, 0.03095005, 1.444199, 1, 1, 1, 1, 1,
0.2609548, -0.250513, 3.294676, 1, 1, 1, 1, 1,
0.2635264, 0.6746624, 1.577827, 1, 1, 1, 1, 1,
0.2692678, 0.1648231, 0.2966891, 1, 1, 1, 1, 1,
0.272954, -0.24433, 1.748041, 1, 1, 1, 1, 1,
0.2785199, -0.774295, 2.369998, 1, 1, 1, 1, 1,
0.2808869, -3.411316, 2.585342, 1, 1, 1, 1, 1,
0.2819163, -0.09624547, 1.019841, 1, 1, 1, 1, 1,
0.2847794, -0.346198, 2.34429, 1, 1, 1, 1, 1,
0.2859535, 0.2945165, -0.2164259, 1, 1, 1, 1, 1,
0.2863436, -2.132414, 1.517537, 1, 1, 1, 1, 1,
0.2885829, -0.9813425, 3.233014, 1, 1, 1, 1, 1,
0.2903512, -2.258112, 3.535769, 1, 1, 1, 1, 1,
0.2906811, 0.3660462, 0.05947002, 0, 0, 1, 1, 1,
0.2923732, 0.4367058, 0.3750038, 1, 0, 0, 1, 1,
0.2927181, -1.207686, 1.512404, 1, 0, 0, 1, 1,
0.2948447, -2.453288, 3.472862, 1, 0, 0, 1, 1,
0.2949656, 2.497469, -0.1798658, 1, 0, 0, 1, 1,
0.2953709, 0.8595366, 0.2040504, 1, 0, 0, 1, 1,
0.2959999, 0.6188706, 1.34354, 0, 0, 0, 1, 1,
0.2961104, 0.9279234, 1.060363, 0, 0, 0, 1, 1,
0.297783, 1.137878, 0.591139, 0, 0, 0, 1, 1,
0.2978812, 0.3134761, 1.573912, 0, 0, 0, 1, 1,
0.3008534, 1.838438, 0.6703328, 0, 0, 0, 1, 1,
0.3019005, -0.51053, 2.754407, 0, 0, 0, 1, 1,
0.3053983, -1.63992, 4.829147, 0, 0, 0, 1, 1,
0.3055511, -0.4722161, 2.665263, 1, 1, 1, 1, 1,
0.3058262, 0.2661019, 0.1048048, 1, 1, 1, 1, 1,
0.3072762, 0.3353781, -0.5802291, 1, 1, 1, 1, 1,
0.307924, 0.2928554, 1.084505, 1, 1, 1, 1, 1,
0.3087215, -0.6667082, 3.285352, 1, 1, 1, 1, 1,
0.3104124, -1.000582, 1.226676, 1, 1, 1, 1, 1,
0.3160646, 0.8674339, 0.9336558, 1, 1, 1, 1, 1,
0.3176238, 0.2636113, 0.1734018, 1, 1, 1, 1, 1,
0.3213102, 1.646916, -0.009722151, 1, 1, 1, 1, 1,
0.3248021, 0.3636141, 0.4909221, 1, 1, 1, 1, 1,
0.3262864, 0.1399118, 1.929748, 1, 1, 1, 1, 1,
0.3267418, 1.963047, -1.062549, 1, 1, 1, 1, 1,
0.3277874, 1.11087, 1.090677, 1, 1, 1, 1, 1,
0.3280681, 0.02513201, 0.9453962, 1, 1, 1, 1, 1,
0.328823, 0.7560039, 0.9946696, 1, 1, 1, 1, 1,
0.3293568, 0.1209062, 2.993898, 0, 0, 1, 1, 1,
0.3302445, 0.4333673, 1.034683, 1, 0, 0, 1, 1,
0.3325059, 2.393829, 0.8086418, 1, 0, 0, 1, 1,
0.3338226, -1.746768, 3.402085, 1, 0, 0, 1, 1,
0.3373925, -1.260761, 2.649642, 1, 0, 0, 1, 1,
0.3374111, -0.03885737, 2.646903, 1, 0, 0, 1, 1,
0.3391778, -0.4896284, 1.083299, 0, 0, 0, 1, 1,
0.3409595, -0.9293777, 3.064913, 0, 0, 0, 1, 1,
0.3446746, -0.2828523, 2.614796, 0, 0, 0, 1, 1,
0.3491013, -0.4158579, 1.57055, 0, 0, 0, 1, 1,
0.3504661, -0.2006319, 0.2082158, 0, 0, 0, 1, 1,
0.351433, 1.776549, -0.9839067, 0, 0, 0, 1, 1,
0.3514982, 1.09814, -0.05536015, 0, 0, 0, 1, 1,
0.3527936, -0.2791161, 0.7133421, 1, 1, 1, 1, 1,
0.3542292, -0.6730015, 3.148452, 1, 1, 1, 1, 1,
0.3549485, 0.7769748, 1.555598, 1, 1, 1, 1, 1,
0.3596424, -0.4442935, 2.819228, 1, 1, 1, 1, 1,
0.3609171, -0.9978307, 1.562021, 1, 1, 1, 1, 1,
0.3644476, 0.3233901, 2.111814, 1, 1, 1, 1, 1,
0.3649541, -0.6285916, 1.2049, 1, 1, 1, 1, 1,
0.3653641, -1.90121, 3.636688, 1, 1, 1, 1, 1,
0.3753287, 1.678493, 1.055706, 1, 1, 1, 1, 1,
0.3777461, -0.5682455, 1.473746, 1, 1, 1, 1, 1,
0.3788225, -0.561471, 3.23972, 1, 1, 1, 1, 1,
0.3814051, 0.9358485, 1.599994, 1, 1, 1, 1, 1,
0.3879291, 1.828375, 0.3257644, 1, 1, 1, 1, 1,
0.388307, 0.5038995, 2.466979, 1, 1, 1, 1, 1,
0.3885182, -0.1918727, 1.229112, 1, 1, 1, 1, 1,
0.3887178, 1.519189, 2.417399, 0, 0, 1, 1, 1,
0.3889687, 0.8158326, -0.7073599, 1, 0, 0, 1, 1,
0.3901748, 0.9265494, 0.4052501, 1, 0, 0, 1, 1,
0.3973085, -1.045598, 4.769773, 1, 0, 0, 1, 1,
0.4004076, 0.3801262, 1.319298, 1, 0, 0, 1, 1,
0.405028, -0.3469946, 0.6761971, 1, 0, 0, 1, 1,
0.4053361, -1.516358, 2.731282, 0, 0, 0, 1, 1,
0.4060244, 0.2913711, 1.597245, 0, 0, 0, 1, 1,
0.4106495, 0.5084794, 1.044204, 0, 0, 0, 1, 1,
0.4112354, 0.248671, 0.5851949, 0, 0, 0, 1, 1,
0.4117752, 1.824477, -1.643393, 0, 0, 0, 1, 1,
0.4164757, 0.8427392, 1.200302, 0, 0, 0, 1, 1,
0.4174108, -0.5501993, 0.8170388, 0, 0, 0, 1, 1,
0.4174417, -0.778819, 2.065283, 1, 1, 1, 1, 1,
0.4278947, 1.864586, -0.3733192, 1, 1, 1, 1, 1,
0.4320447, 0.06137902, 0.7827439, 1, 1, 1, 1, 1,
0.4335565, 0.7117658, -0.5320507, 1, 1, 1, 1, 1,
0.4336543, 1.055048, 0.126276, 1, 1, 1, 1, 1,
0.4338742, 0.3535064, 1.172562, 1, 1, 1, 1, 1,
0.4344073, -0.003213376, 2.383788, 1, 1, 1, 1, 1,
0.4350772, -0.1648805, 1.151265, 1, 1, 1, 1, 1,
0.4382857, 0.8640026, 0.08379529, 1, 1, 1, 1, 1,
0.4393679, 0.5651512, 1.028354, 1, 1, 1, 1, 1,
0.4395857, -2.365053, 1.831501, 1, 1, 1, 1, 1,
0.4398786, -0.615749, 2.795154, 1, 1, 1, 1, 1,
0.4456955, -0.2538147, 2.125865, 1, 1, 1, 1, 1,
0.4506288, 0.4081928, -0.5514309, 1, 1, 1, 1, 1,
0.4510689, -0.05488695, 1.328895, 1, 1, 1, 1, 1,
0.4513447, -1.134384, 2.494636, 0, 0, 1, 1, 1,
0.4656411, 0.9798216, 1.670466, 1, 0, 0, 1, 1,
0.4662772, 0.3163422, 1.569928, 1, 0, 0, 1, 1,
0.4702066, 0.47373, 0.6042654, 1, 0, 0, 1, 1,
0.4704043, -0.06110025, 0.4365003, 1, 0, 0, 1, 1,
0.4736047, -0.8851355, 2.823706, 1, 0, 0, 1, 1,
0.4744913, 1.097373, 1.28344, 0, 0, 0, 1, 1,
0.48075, 0.4123358, 0.5328823, 0, 0, 0, 1, 1,
0.4881015, -1.639097, 2.322109, 0, 0, 0, 1, 1,
0.4881276, 1.048432, -0.350831, 0, 0, 0, 1, 1,
0.490904, 0.4016902, 2.290306, 0, 0, 0, 1, 1,
0.4915209, 1.106352, 0.664146, 0, 0, 0, 1, 1,
0.4958047, -1.034701, 1.149234, 0, 0, 0, 1, 1,
0.5007982, 0.779093, 1.429584, 1, 1, 1, 1, 1,
0.501756, -1.592701, 3.322537, 1, 1, 1, 1, 1,
0.5018717, -2.473141, 1.329743, 1, 1, 1, 1, 1,
0.5024711, -0.1831954, -0.114275, 1, 1, 1, 1, 1,
0.5032923, 1.177817, -0.6231744, 1, 1, 1, 1, 1,
0.5152818, 2.17945, 1.146669, 1, 1, 1, 1, 1,
0.522508, -0.2428536, 1.55233, 1, 1, 1, 1, 1,
0.5267595, -0.8837798, 1.184046, 1, 1, 1, 1, 1,
0.5411255, -0.6058589, 2.806236, 1, 1, 1, 1, 1,
0.5483264, -0.7691945, 2.593507, 1, 1, 1, 1, 1,
0.5518219, -0.9798864, 0.5393882, 1, 1, 1, 1, 1,
0.5518311, 0.756834, 2.203394, 1, 1, 1, 1, 1,
0.5626665, -0.9764867, 2.887741, 1, 1, 1, 1, 1,
0.5651656, -0.4648744, 2.883896, 1, 1, 1, 1, 1,
0.5661815, -0.2030018, 1.729693, 1, 1, 1, 1, 1,
0.5667991, -1.046077, 3.369781, 0, 0, 1, 1, 1,
0.5697059, -1.548502, 2.582381, 1, 0, 0, 1, 1,
0.577516, -0.8189155, 2.077047, 1, 0, 0, 1, 1,
0.5787761, 1.60538, -0.7560661, 1, 0, 0, 1, 1,
0.5788748, -0.2183269, 3.552482, 1, 0, 0, 1, 1,
0.582148, 0.5186822, 1.427711, 1, 0, 0, 1, 1,
0.5866296, -0.003619431, 0.9417585, 0, 0, 0, 1, 1,
0.5886773, 1.070801, 1.184241, 0, 0, 0, 1, 1,
0.59158, -0.4880466, 4.076221, 0, 0, 0, 1, 1,
0.5936914, -0.7351707, 2.488057, 0, 0, 0, 1, 1,
0.6067588, 0.8137414, -0.2666133, 0, 0, 0, 1, 1,
0.6073022, 1.290964, 0.7104244, 0, 0, 0, 1, 1,
0.6113898, 0.5442753, -1.376808, 0, 0, 0, 1, 1,
0.6148205, -0.8858583, 1.152009, 1, 1, 1, 1, 1,
0.6205295, 0.9053072, 0.2006733, 1, 1, 1, 1, 1,
0.6225821, -0.2405765, 1.484344, 1, 1, 1, 1, 1,
0.6240409, 0.5986573, -0.431944, 1, 1, 1, 1, 1,
0.6244802, -2.287475, 2.441459, 1, 1, 1, 1, 1,
0.6275526, -1.058498, 1.104247, 1, 1, 1, 1, 1,
0.627811, -0.2136347, 1.37497, 1, 1, 1, 1, 1,
0.6283318, 0.5937279, 1.857852, 1, 1, 1, 1, 1,
0.6319397, 1.228409, 1.443766, 1, 1, 1, 1, 1,
0.6321298, -1.007927, 1.821558, 1, 1, 1, 1, 1,
0.6409951, -0.2154076, 1.850562, 1, 1, 1, 1, 1,
0.6419406, 0.7564873, -0.2571653, 1, 1, 1, 1, 1,
0.6439978, -0.957584, 3.731048, 1, 1, 1, 1, 1,
0.6479416, 1.12219, 1.426362, 1, 1, 1, 1, 1,
0.6610473, -0.5253894, 2.803481, 1, 1, 1, 1, 1,
0.6643878, 0.07441631, 0.9956204, 0, 0, 1, 1, 1,
0.6684593, -1.181081, 1.834289, 1, 0, 0, 1, 1,
0.6728806, -0.2436474, 1.374563, 1, 0, 0, 1, 1,
0.6808863, 0.156994, 0.9732697, 1, 0, 0, 1, 1,
0.6835705, 0.1639672, 3.648239, 1, 0, 0, 1, 1,
0.6858345, -0.4077077, 1.612895, 1, 0, 0, 1, 1,
0.6918414, -1.19045, 1.865842, 0, 0, 0, 1, 1,
0.6940404, 1.43758, 1.296546, 0, 0, 0, 1, 1,
0.6993733, 0.1518434, 2.504875, 0, 0, 0, 1, 1,
0.7025953, 0.2524578, 0.9591479, 0, 0, 0, 1, 1,
0.704909, 1.445542, 0.1587998, 0, 0, 0, 1, 1,
0.7080191, 1.404091, 0.8170891, 0, 0, 0, 1, 1,
0.7151681, -0.3624371, 2.549989, 0, 0, 0, 1, 1,
0.7257804, 0.6404458, 1.502559, 1, 1, 1, 1, 1,
0.7359878, -0.02528392, 1.773724, 1, 1, 1, 1, 1,
0.7378694, 1.391653, 0.06638546, 1, 1, 1, 1, 1,
0.7391521, -0.4337827, 1.658456, 1, 1, 1, 1, 1,
0.7458284, 0.3071405, 2.015373, 1, 1, 1, 1, 1,
0.7490315, -0.4134389, 2.382854, 1, 1, 1, 1, 1,
0.7505051, -0.5358093, 3.268806, 1, 1, 1, 1, 1,
0.7520618, -0.5022999, 1.815614, 1, 1, 1, 1, 1,
0.7526587, -1.130134, 1.403549, 1, 1, 1, 1, 1,
0.7559858, -1.479248, 2.107186, 1, 1, 1, 1, 1,
0.7603021, -0.2711015, 2.038457, 1, 1, 1, 1, 1,
0.7726988, 0.06119526, 0.2691054, 1, 1, 1, 1, 1,
0.7765302, 0.2080409, 0.4961531, 1, 1, 1, 1, 1,
0.7774682, 0.5210151, 0.625833, 1, 1, 1, 1, 1,
0.7781577, -1.479895, 1.880507, 1, 1, 1, 1, 1,
0.7796961, 0.966804, 0.7239732, 0, 0, 1, 1, 1,
0.7824171, -0.4750498, 2.238799, 1, 0, 0, 1, 1,
0.7892592, -1.539487, 1.583828, 1, 0, 0, 1, 1,
0.7900608, 0.06495003, 3.529419, 1, 0, 0, 1, 1,
0.7970752, -0.06370071, 2.540312, 1, 0, 0, 1, 1,
0.805841, -0.7441009, 3.233857, 1, 0, 0, 1, 1,
0.8087748, 1.333518, 1.198335, 0, 0, 0, 1, 1,
0.8113768, -0.1308178, 1.438094, 0, 0, 0, 1, 1,
0.8139791, -1.386238, -0.3762131, 0, 0, 0, 1, 1,
0.8166651, -0.5871827, 3.04057, 0, 0, 0, 1, 1,
0.82337, -0.3022999, -0.4640881, 0, 0, 0, 1, 1,
0.8242246, 0.01238013, 1.639607, 0, 0, 0, 1, 1,
0.8254301, -0.3829095, 2.705808, 0, 0, 0, 1, 1,
0.8308972, 0.9305431, 1.601084, 1, 1, 1, 1, 1,
0.8326734, 2.454448, 1.062398, 1, 1, 1, 1, 1,
0.8341272, 1.225468, 1.450943, 1, 1, 1, 1, 1,
0.8454595, -0.3531847, 2.003834, 1, 1, 1, 1, 1,
0.8457688, -0.01850334, 0.2813739, 1, 1, 1, 1, 1,
0.846236, 0.8005684, 2.0149, 1, 1, 1, 1, 1,
0.8520738, 2.866991, 0.1843999, 1, 1, 1, 1, 1,
0.8524261, -1.368957, 1.597006, 1, 1, 1, 1, 1,
0.8541036, 0.2507239, 3.042581, 1, 1, 1, 1, 1,
0.8576127, 0.4365463, -0.6567612, 1, 1, 1, 1, 1,
0.8601005, 0.8097283, 0.7078077, 1, 1, 1, 1, 1,
0.8616297, 0.6583462, -0.01543847, 1, 1, 1, 1, 1,
0.8643081, 0.533275, 0.09376979, 1, 1, 1, 1, 1,
0.8652699, -0.4482816, 4.020275, 1, 1, 1, 1, 1,
0.8666447, 0.4911928, -0.7235095, 1, 1, 1, 1, 1,
0.8724048, 1.215196, 1.051324, 0, 0, 1, 1, 1,
0.8758913, 0.6032856, 0.909844, 1, 0, 0, 1, 1,
0.8774303, 0.01803532, 0.4887677, 1, 0, 0, 1, 1,
0.8774697, 0.2650465, 0.5074807, 1, 0, 0, 1, 1,
0.8834032, -0.4669228, 0.637922, 1, 0, 0, 1, 1,
0.8932602, -0.3062809, 1.216587, 1, 0, 0, 1, 1,
0.8937182, -0.4911639, 2.453168, 0, 0, 0, 1, 1,
0.8946791, 0.8983274, 0.9426734, 0, 0, 0, 1, 1,
0.9041378, -0.588945, 2.511909, 0, 0, 0, 1, 1,
0.9085818, -0.1173803, 1.82289, 0, 0, 0, 1, 1,
0.9100098, 1.595942, 0.5928173, 0, 0, 0, 1, 1,
0.9119062, 0.9747857, 0.8401771, 0, 0, 0, 1, 1,
0.9125606, 2.062399, 0.746533, 0, 0, 0, 1, 1,
0.9179698, -0.4296915, 1.176204, 1, 1, 1, 1, 1,
0.9328102, -1.39059, 4.135569, 1, 1, 1, 1, 1,
0.9345107, -0.3748237, 2.106263, 1, 1, 1, 1, 1,
0.9345506, -0.1955311, 0.3486778, 1, 1, 1, 1, 1,
0.9377824, 0.6061557, 0.9667166, 1, 1, 1, 1, 1,
0.9528642, -0.5793321, 0.7806993, 1, 1, 1, 1, 1,
0.953048, -0.7885587, 1.767727, 1, 1, 1, 1, 1,
0.9562447, -0.2001278, 2.333467, 1, 1, 1, 1, 1,
0.9573301, -0.8171111, 0.3080415, 1, 1, 1, 1, 1,
0.9590228, -0.02501282, 1.369825, 1, 1, 1, 1, 1,
0.9615831, -0.2790753, 0.538768, 1, 1, 1, 1, 1,
0.9617364, -1.123821, 1.808466, 1, 1, 1, 1, 1,
0.962927, 0.9611111, -0.07993084, 1, 1, 1, 1, 1,
0.9738323, -1.920009, 1.517083, 1, 1, 1, 1, 1,
0.9804844, -1.223188, 3.028994, 1, 1, 1, 1, 1,
0.987483, -0.1327994, 0.8189685, 0, 0, 1, 1, 1,
1.013494, -1.369649, 2.508301, 1, 0, 0, 1, 1,
1.025044, -0.8700572, 2.677758, 1, 0, 0, 1, 1,
1.04078, 1.454146, 0.4815521, 1, 0, 0, 1, 1,
1.041082, 0.2173901, 1.729381, 1, 0, 0, 1, 1,
1.049026, -0.5765411, 1.985535, 1, 0, 0, 1, 1,
1.050778, -1.168658, 1.662314, 0, 0, 0, 1, 1,
1.056511, 2.337407, -1.012853, 0, 0, 0, 1, 1,
1.057589, 0.3764304, -0.5548761, 0, 0, 0, 1, 1,
1.062199, -0.06011397, 0.7567775, 0, 0, 0, 1, 1,
1.06482, 2.222582, -0.03432834, 0, 0, 0, 1, 1,
1.076595, 0.4759769, 1.31409, 0, 0, 0, 1, 1,
1.080082, 0.03827416, 1.566504, 0, 0, 0, 1, 1,
1.080153, 0.03351615, 1.415595, 1, 1, 1, 1, 1,
1.081234, 0.4419376, 1.937763, 1, 1, 1, 1, 1,
1.084789, 0.6516638, 1.741903, 1, 1, 1, 1, 1,
1.087701, -1.188504, 0.383667, 1, 1, 1, 1, 1,
1.090891, 2.182071, -0.02621636, 1, 1, 1, 1, 1,
1.094419, 1.020635, -0.2103825, 1, 1, 1, 1, 1,
1.106072, 1.625269, -0.1983183, 1, 1, 1, 1, 1,
1.106766, 0.3088942, 2.473255, 1, 1, 1, 1, 1,
1.107046, -0.1536562, 2.108313, 1, 1, 1, 1, 1,
1.111603, -0.9544666, 2.90753, 1, 1, 1, 1, 1,
1.116126, 0.974595, 0.8826008, 1, 1, 1, 1, 1,
1.118721, 0.8126538, 1.025472, 1, 1, 1, 1, 1,
1.131667, 1.04484, 0.6251674, 1, 1, 1, 1, 1,
1.137545, -0.2377791, 3.418041, 1, 1, 1, 1, 1,
1.138324, 0.9827482, 0.3267123, 1, 1, 1, 1, 1,
1.141949, 0.6151577, 0.6785407, 0, 0, 1, 1, 1,
1.144137, -1.546839, 3.952406, 1, 0, 0, 1, 1,
1.149143, 0.2244338, 0.8707721, 1, 0, 0, 1, 1,
1.152687, 0.2995423, 1.708368, 1, 0, 0, 1, 1,
1.153779, -0.868426, 2.201706, 1, 0, 0, 1, 1,
1.160607, -0.2524731, 1.825272, 1, 0, 0, 1, 1,
1.161739, -0.1682495, 2.479913, 0, 0, 0, 1, 1,
1.165227, -0.7610488, 3.251057, 0, 0, 0, 1, 1,
1.16555, -0.7254788, 2.245529, 0, 0, 0, 1, 1,
1.17441, 0.09003572, 1.628222, 0, 0, 0, 1, 1,
1.176034, -1.346118, 2.576282, 0, 0, 0, 1, 1,
1.183035, -0.06077181, 0.9411852, 0, 0, 0, 1, 1,
1.184316, -1.092325, 4.306934, 0, 0, 0, 1, 1,
1.184975, 1.931774, -0.9477599, 1, 1, 1, 1, 1,
1.185191, -1.877063, 0.8351369, 1, 1, 1, 1, 1,
1.1885, -2.401811, 2.015713, 1, 1, 1, 1, 1,
1.19084, 1.554491, 1.407714, 1, 1, 1, 1, 1,
1.192413, -1.888319, 1.938323, 1, 1, 1, 1, 1,
1.194651, -1.958633, 3.093316, 1, 1, 1, 1, 1,
1.196149, -0.717531, 3.278299, 1, 1, 1, 1, 1,
1.197198, -0.4697897, 2.245355, 1, 1, 1, 1, 1,
1.204243, -0.7283194, 1.787998, 1, 1, 1, 1, 1,
1.206188, -1.283493, 4.187352, 1, 1, 1, 1, 1,
1.207777, 2.321593, 0.08784913, 1, 1, 1, 1, 1,
1.212956, 0.1198453, 1.708704, 1, 1, 1, 1, 1,
1.216939, 0.5376351, 1.625209, 1, 1, 1, 1, 1,
1.221117, -0.1236205, 2.918319, 1, 1, 1, 1, 1,
1.223689, -1.288816, 1.528127, 1, 1, 1, 1, 1,
1.22922, 0.4064609, 0.7334502, 0, 0, 1, 1, 1,
1.232809, -1.140765, 0.8870003, 1, 0, 0, 1, 1,
1.23655, -0.2942963, 2.833206, 1, 0, 0, 1, 1,
1.240438, 1.221776, 0.7864613, 1, 0, 0, 1, 1,
1.241924, 1.379303, 0.3802304, 1, 0, 0, 1, 1,
1.242432, 0.08714984, 0.8278591, 1, 0, 0, 1, 1,
1.242953, 2.098345, -0.8952277, 0, 0, 0, 1, 1,
1.253433, 0.4800713, 2.645784, 0, 0, 0, 1, 1,
1.266927, 1.247923, -1.166194, 0, 0, 0, 1, 1,
1.271402, -0.3869154, 2.319556, 0, 0, 0, 1, 1,
1.275851, -0.04317838, 1.116172, 0, 0, 0, 1, 1,
1.281641, 0.09743644, 0.6109841, 0, 0, 0, 1, 1,
1.285168, -0.5149752, 3.617797, 0, 0, 0, 1, 1,
1.298622, -0.5853614, 1.756144, 1, 1, 1, 1, 1,
1.31123, 0.8825971, 0.7526279, 1, 1, 1, 1, 1,
1.3153, -0.3794766, 3.422453, 1, 1, 1, 1, 1,
1.31923, -0.136072, 0.7585195, 1, 1, 1, 1, 1,
1.320418, -0.1045936, 2.249271, 1, 1, 1, 1, 1,
1.326965, -1.420567, 1.734797, 1, 1, 1, 1, 1,
1.327973, 0.09248754, 2.430838, 1, 1, 1, 1, 1,
1.327988, 1.354481, 1.773048, 1, 1, 1, 1, 1,
1.333816, 1.61848, 0.6207755, 1, 1, 1, 1, 1,
1.333855, -0.8388187, 1.94961, 1, 1, 1, 1, 1,
1.33656, 0.7499332, 3.667626, 1, 1, 1, 1, 1,
1.344745, 0.3985952, 1.454214, 1, 1, 1, 1, 1,
1.348201, 1.870039, -0.5085398, 1, 1, 1, 1, 1,
1.359311, -0.2528922, 0.3531583, 1, 1, 1, 1, 1,
1.372656, 0.2528892, 1.182427, 1, 1, 1, 1, 1,
1.37522, 0.1201473, 2.243695, 0, 0, 1, 1, 1,
1.385872, -0.410558, 1.70405, 1, 0, 0, 1, 1,
1.404841, -0.1088668, 1.958621, 1, 0, 0, 1, 1,
1.405024, 0.8635901, 1.428226, 1, 0, 0, 1, 1,
1.427528, -1.419643, 1.880936, 1, 0, 0, 1, 1,
1.427532, -0.3890752, 1.556921, 1, 0, 0, 1, 1,
1.430347, 1.216681, -0.430624, 0, 0, 0, 1, 1,
1.442029, -0.1164851, 2.547716, 0, 0, 0, 1, 1,
1.444941, 1.106549, 1.689733, 0, 0, 0, 1, 1,
1.450321, -0.9218669, 2.605127, 0, 0, 0, 1, 1,
1.451827, 0.3281983, 3.667774, 0, 0, 0, 1, 1,
1.46895, 0.0880542, 1.279726, 0, 0, 0, 1, 1,
1.483838, 0.2531424, 0.225248, 0, 0, 0, 1, 1,
1.493769, -1.413476, 4.462202, 1, 1, 1, 1, 1,
1.495245, -0.7946412, 2.571428, 1, 1, 1, 1, 1,
1.496104, 0.5239098, 2.091339, 1, 1, 1, 1, 1,
1.501973, -0.5197789, 2.470966, 1, 1, 1, 1, 1,
1.524883, 0.8613708, 0.6413925, 1, 1, 1, 1, 1,
1.527608, 0.8390175, 0.6195542, 1, 1, 1, 1, 1,
1.532555, -0.5926423, 1.647142, 1, 1, 1, 1, 1,
1.536632, 0.05832314, 1.02449, 1, 1, 1, 1, 1,
1.541663, -1.31685, 2.91785, 1, 1, 1, 1, 1,
1.542493, -0.6863021, 0.7989554, 1, 1, 1, 1, 1,
1.54736, 0.03133173, 2.535007, 1, 1, 1, 1, 1,
1.57079, -1.550415, 1.137755, 1, 1, 1, 1, 1,
1.589128, -0.1927156, 1.672954, 1, 1, 1, 1, 1,
1.592375, -0.5352541, 1.958377, 1, 1, 1, 1, 1,
1.601437, 0.7567979, 0.8082627, 1, 1, 1, 1, 1,
1.605339, 2.120831, 2.007691, 0, 0, 1, 1, 1,
1.605735, -1.375904, 3.114713, 1, 0, 0, 1, 1,
1.607768, -0.3183077, 3.821856, 1, 0, 0, 1, 1,
1.62628, -1.073279, 2.374832, 1, 0, 0, 1, 1,
1.6367, -0.4475076, 1.833669, 1, 0, 0, 1, 1,
1.659028, -0.235549, 1.560922, 1, 0, 0, 1, 1,
1.669968, -0.3966271, 2.806377, 0, 0, 0, 1, 1,
1.679081, 1.12428, 0.7627839, 0, 0, 0, 1, 1,
1.683363, 0.6986775, 0.2841442, 0, 0, 0, 1, 1,
1.708035, 0.3218204, 0.215466, 0, 0, 0, 1, 1,
1.717399, 0.571655, 2.549946, 0, 0, 0, 1, 1,
1.718904, 0.4798285, 0.4518175, 0, 0, 0, 1, 1,
1.719451, -0.03536363, 0.7168537, 0, 0, 0, 1, 1,
1.739595, 0.5053657, 1.777793, 1, 1, 1, 1, 1,
1.76812, -0.1218381, 0.5915582, 1, 1, 1, 1, 1,
1.774207, 0.8265326, 0.7774639, 1, 1, 1, 1, 1,
1.812683, 1.734733, -0.5420813, 1, 1, 1, 1, 1,
1.814033, 0.5747961, -0.5526525, 1, 1, 1, 1, 1,
1.821995, -0.180296, 2.057729, 1, 1, 1, 1, 1,
1.850363, 1.602499, 1.528306, 1, 1, 1, 1, 1,
1.85321, -0.08627217, -0.5267578, 1, 1, 1, 1, 1,
1.86991, -0.6287664, 1.439701, 1, 1, 1, 1, 1,
1.878716, 0.7234806, -0.05193064, 1, 1, 1, 1, 1,
1.884486, -0.4369495, 1.056032, 1, 1, 1, 1, 1,
1.903723, -0.1910939, 0.942968, 1, 1, 1, 1, 1,
1.93459, 0.373065, 1.821585, 1, 1, 1, 1, 1,
1.94662, 0.2893196, 0.8080078, 1, 1, 1, 1, 1,
1.970375, -0.1278134, 2.330768, 1, 1, 1, 1, 1,
1.990302, -1.365712, 2.303167, 0, 0, 1, 1, 1,
2.000703, -0.1657619, 1.020787, 1, 0, 0, 1, 1,
2.033334, -0.8362113, 1.948458, 1, 0, 0, 1, 1,
2.118602, -1.272131, 1.543136, 1, 0, 0, 1, 1,
2.140903, 0.6857018, 2.037684, 1, 0, 0, 1, 1,
2.196163, 0.6901966, 1.54203, 1, 0, 0, 1, 1,
2.197598, 1.148291, 0.5251734, 0, 0, 0, 1, 1,
2.374455, 1.414985, 1.558439, 0, 0, 0, 1, 1,
2.398746, -0.4008829, 1.38142, 0, 0, 0, 1, 1,
2.41249, -1.407359, 2.620621, 0, 0, 0, 1, 1,
2.450506, -0.6469424, -1.00097, 0, 0, 0, 1, 1,
2.467873, -0.0200852, 1.442794, 0, 0, 0, 1, 1,
2.488809, -1.679458, 1.614858, 0, 0, 0, 1, 1,
2.501352, -0.09803381, 2.62891, 1, 1, 1, 1, 1,
2.529369, -1.227574, 0.7289956, 1, 1, 1, 1, 1,
2.532828, -1.353882, 2.760354, 1, 1, 1, 1, 1,
2.733981, 0.2873675, 2.221817, 1, 1, 1, 1, 1,
2.831044, 0.841942, 2.078363, 1, 1, 1, 1, 1,
2.906846, 0.9248691, -0.8386343, 1, 1, 1, 1, 1,
3.042386, 0.08494375, 1.689816, 1, 1, 1, 1, 1
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
var radius = 9.134589;
var distance = 32.08485;
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
mvMatrix.translate( -0.03567195, 0.171567, 0.08101702 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.08485);
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
