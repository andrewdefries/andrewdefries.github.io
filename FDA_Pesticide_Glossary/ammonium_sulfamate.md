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
-3.436454, 1.28852, -1.748282, 1, 0, 0, 1,
-3.18355, -0.1565153, 0.2422578, 1, 0.007843138, 0, 1,
-3.025078, -0.4806895, -2.004802, 1, 0.01176471, 0, 1,
-2.920455, -0.9220037, -2.093817, 1, 0.01960784, 0, 1,
-2.88598, 1.00271, -1.200659, 1, 0.02352941, 0, 1,
-2.466917, -1.578851, -2.4267, 1, 0.03137255, 0, 1,
-2.442747, 0.7675405, -0.9044738, 1, 0.03529412, 0, 1,
-2.438204, 2.252537, -3.247401, 1, 0.04313726, 0, 1,
-2.383361, -0.4623561, -2.129086, 1, 0.04705882, 0, 1,
-2.382472, 1.792549, -0.847595, 1, 0.05490196, 0, 1,
-2.301477, -2.204278, -2.998045, 1, 0.05882353, 0, 1,
-2.249115, -0.4621181, -2.195496, 1, 0.06666667, 0, 1,
-2.245086, -1.890426, -2.527032, 1, 0.07058824, 0, 1,
-2.189168, -0.5734787, -1.429298, 1, 0.07843138, 0, 1,
-2.107497, 1.478309, -3.251698, 1, 0.08235294, 0, 1,
-2.098783, 0.4117485, -1.091889, 1, 0.09019608, 0, 1,
-2.088185, 1.020301, -2.280107, 1, 0.09411765, 0, 1,
-2.080585, 0.3576776, -3.493877, 1, 0.1019608, 0, 1,
-2.047894, 0.4447204, -0.3698128, 1, 0.1098039, 0, 1,
-2.028567, -0.0248296, -0.1011174, 1, 0.1137255, 0, 1,
-2.001139, 0.8517821, -1.013822, 1, 0.1215686, 0, 1,
-1.943369, 0.6483268, -1.513747, 1, 0.1254902, 0, 1,
-1.933561, 1.064915, -1.879629, 1, 0.1333333, 0, 1,
-1.925366, 0.2965041, -2.704915, 1, 0.1372549, 0, 1,
-1.900883, -1.261294, -1.360887, 1, 0.145098, 0, 1,
-1.858732, -0.8000193, -3.323114, 1, 0.1490196, 0, 1,
-1.856615, 1.251083, 0.2430483, 1, 0.1568628, 0, 1,
-1.803916, 0.7649499, -1.180541, 1, 0.1607843, 0, 1,
-1.799813, -0.7457151, -2.77248, 1, 0.1686275, 0, 1,
-1.797824, -0.1631544, 0.5695281, 1, 0.172549, 0, 1,
-1.791919, -0.02470913, -2.927202, 1, 0.1803922, 0, 1,
-1.774059, -0.7094764, 0.6811855, 1, 0.1843137, 0, 1,
-1.762753, -0.1646262, -2.454816, 1, 0.1921569, 0, 1,
-1.753298, 0.9436949, -2.030715, 1, 0.1960784, 0, 1,
-1.725195, 0.6924107, -0.9991387, 1, 0.2039216, 0, 1,
-1.69239, -0.5111566, 0.0267208, 1, 0.2117647, 0, 1,
-1.67788, -0.4759162, -1.239121, 1, 0.2156863, 0, 1,
-1.668979, -0.5176021, -0.4994667, 1, 0.2235294, 0, 1,
-1.655388, 1.351158, -0.3066081, 1, 0.227451, 0, 1,
-1.653213, -0.3434404, -3.793108, 1, 0.2352941, 0, 1,
-1.649635, -0.459255, -1.58475, 1, 0.2392157, 0, 1,
-1.646994, 0.1934343, -2.299715, 1, 0.2470588, 0, 1,
-1.646722, 1.686884, -1.320374, 1, 0.2509804, 0, 1,
-1.643865, 2.391428, -0.4439576, 1, 0.2588235, 0, 1,
-1.632067, 1.353987, -0.8791243, 1, 0.2627451, 0, 1,
-1.61975, 0.6560615, -0.09772899, 1, 0.2705882, 0, 1,
-1.615791, 0.7325289, -1.235686, 1, 0.2745098, 0, 1,
-1.612254, 1.756836, 0.7670981, 1, 0.282353, 0, 1,
-1.598696, 0.1987024, -1.212982, 1, 0.2862745, 0, 1,
-1.589787, 1.208934, 0.5215011, 1, 0.2941177, 0, 1,
-1.572958, -0.31672, -1.595308, 1, 0.3019608, 0, 1,
-1.570274, -1.165615, -2.6747, 1, 0.3058824, 0, 1,
-1.562375, -0.1444889, -2.451758, 1, 0.3137255, 0, 1,
-1.549174, -0.6047435, -1.862522, 1, 0.3176471, 0, 1,
-1.534818, 0.07466879, -2.425061, 1, 0.3254902, 0, 1,
-1.524729, 0.2764989, -0.9456661, 1, 0.3294118, 0, 1,
-1.504573, -0.12701, -2.121212, 1, 0.3372549, 0, 1,
-1.500714, -0.3988447, -1.598364, 1, 0.3411765, 0, 1,
-1.489913, 0.5152759, -2.192137, 1, 0.3490196, 0, 1,
-1.48866, -1.289837, -1.69455, 1, 0.3529412, 0, 1,
-1.470324, -0.03751473, -1.842471, 1, 0.3607843, 0, 1,
-1.468539, -0.2186175, -2.328778, 1, 0.3647059, 0, 1,
-1.462357, -0.8379909, -1.18732, 1, 0.372549, 0, 1,
-1.459338, 0.3462636, -0.9418656, 1, 0.3764706, 0, 1,
-1.459073, -0.7846829, -2.089117, 1, 0.3843137, 0, 1,
-1.454731, 0.5779704, -2.469569, 1, 0.3882353, 0, 1,
-1.440713, 0.5705988, -2.801906, 1, 0.3960784, 0, 1,
-1.440464, -0.4178841, -1.642585, 1, 0.4039216, 0, 1,
-1.439744, -0.414849, -0.5297108, 1, 0.4078431, 0, 1,
-1.423059, 1.928333, -1.952557, 1, 0.4156863, 0, 1,
-1.420349, -0.4027875, -3.763366, 1, 0.4196078, 0, 1,
-1.4106, 0.3302274, -1.629409, 1, 0.427451, 0, 1,
-1.41043, -1.049038, -1.907252, 1, 0.4313726, 0, 1,
-1.404368, -0.5520713, -1.527281, 1, 0.4392157, 0, 1,
-1.401167, -1.403095, -1.743665, 1, 0.4431373, 0, 1,
-1.400497, 0.3472356, -2.477244, 1, 0.4509804, 0, 1,
-1.398172, 1.035118, -1.220472, 1, 0.454902, 0, 1,
-1.397308, -1.288555, -0.8969, 1, 0.4627451, 0, 1,
-1.389012, 1.84929, -0.2750339, 1, 0.4666667, 0, 1,
-1.372024, -1.183647, -1.980211, 1, 0.4745098, 0, 1,
-1.367366, 0.1506469, -1.67737, 1, 0.4784314, 0, 1,
-1.366583, 1.376133, -1.771434, 1, 0.4862745, 0, 1,
-1.36443, 1.361316, 0.4518655, 1, 0.4901961, 0, 1,
-1.356565, 0.3529377, 0.5649457, 1, 0.4980392, 0, 1,
-1.356403, 1.065921, -0.5294109, 1, 0.5058824, 0, 1,
-1.345879, -0.3037148, -1.503289, 1, 0.509804, 0, 1,
-1.344254, 2.841955, -1.133553, 1, 0.5176471, 0, 1,
-1.342167, 0.4064693, 0.4511734, 1, 0.5215687, 0, 1,
-1.34144, -1.899673, -2.355664, 1, 0.5294118, 0, 1,
-1.33949, 0.5849336, -1.62542, 1, 0.5333334, 0, 1,
-1.329032, 0.8365474, 1.684804, 1, 0.5411765, 0, 1,
-1.327104, 0.7269909, -0.7696356, 1, 0.5450981, 0, 1,
-1.321305, 0.5997508, -1.627815, 1, 0.5529412, 0, 1,
-1.320531, 0.8031935, 0.1654368, 1, 0.5568628, 0, 1,
-1.313038, 0.3705164, -0.9548919, 1, 0.5647059, 0, 1,
-1.304057, -0.2986136, -3.091351, 1, 0.5686275, 0, 1,
-1.299792, -0.09616703, -0.3237407, 1, 0.5764706, 0, 1,
-1.299287, 1.856064, -0.9439898, 1, 0.5803922, 0, 1,
-1.296524, -0.4012661, -0.840726, 1, 0.5882353, 0, 1,
-1.293684, -0.2018249, -1.272925, 1, 0.5921569, 0, 1,
-1.288543, 1.192773, 0.02154572, 1, 0.6, 0, 1,
-1.284808, 0.1213229, -2.194566, 1, 0.6078432, 0, 1,
-1.279375, -0.1516567, -0.6297587, 1, 0.6117647, 0, 1,
-1.273843, -0.5044502, -1.888199, 1, 0.6196079, 0, 1,
-1.251471, 0.543631, -0.3911774, 1, 0.6235294, 0, 1,
-1.249358, -0.6375582, -2.490727, 1, 0.6313726, 0, 1,
-1.238732, -0.3960039, -1.037531, 1, 0.6352941, 0, 1,
-1.232855, 0.981793, -1.664289, 1, 0.6431373, 0, 1,
-1.232847, 0.001954501, -0.9086026, 1, 0.6470588, 0, 1,
-1.232082, 0.4760641, -0.9187192, 1, 0.654902, 0, 1,
-1.226847, 2.235321, 0.459626, 1, 0.6588235, 0, 1,
-1.226665, 0.5430179, -1.131307, 1, 0.6666667, 0, 1,
-1.222153, -0.8376216, -2.013424, 1, 0.6705883, 0, 1,
-1.220002, 0.272518, -0.7467154, 1, 0.6784314, 0, 1,
-1.21997, -0.8682081, -0.643702, 1, 0.682353, 0, 1,
-1.218878, -1.009875, -3.065355, 1, 0.6901961, 0, 1,
-1.215855, -7.816027e-05, 0.8407506, 1, 0.6941177, 0, 1,
-1.213146, 0.8416821, -1.167974, 1, 0.7019608, 0, 1,
-1.199409, -0.8491984, 0.4748918, 1, 0.7098039, 0, 1,
-1.183407, 1.159858, -1.199262, 1, 0.7137255, 0, 1,
-1.1809, 0.2608837, -1.571369, 1, 0.7215686, 0, 1,
-1.16984, 0.2203398, -1.942078, 1, 0.7254902, 0, 1,
-1.168975, 0.04360548, -1.230315, 1, 0.7333333, 0, 1,
-1.164186, 0.1437946, -1.473071, 1, 0.7372549, 0, 1,
-1.16276, -0.07214922, -0.2221263, 1, 0.7450981, 0, 1,
-1.148893, -1.418628, -2.455332, 1, 0.7490196, 0, 1,
-1.147509, -1.710326, -3.185543, 1, 0.7568628, 0, 1,
-1.147494, -2.654629, -2.068264, 1, 0.7607843, 0, 1,
-1.146916, -0.02607228, -0.7940498, 1, 0.7686275, 0, 1,
-1.143292, -0.5108749, -2.818073, 1, 0.772549, 0, 1,
-1.135483, 0.5276465, -0.9713521, 1, 0.7803922, 0, 1,
-1.13101, -0.2678317, -0.8737996, 1, 0.7843137, 0, 1,
-1.130527, 2.235413, -1.732624, 1, 0.7921569, 0, 1,
-1.126049, -0.775242, -1.992682, 1, 0.7960784, 0, 1,
-1.125314, -2.217706, -4.340257, 1, 0.8039216, 0, 1,
-1.120709, 0.06440752, -0.9119118, 1, 0.8117647, 0, 1,
-1.112093, 0.3044338, -3.093213, 1, 0.8156863, 0, 1,
-1.106456, 0.9214619, -1.269757, 1, 0.8235294, 0, 1,
-1.0963, 1.103973, -1.545942, 1, 0.827451, 0, 1,
-1.089653, -0.4608642, -2.524295, 1, 0.8352941, 0, 1,
-1.080218, 0.8306065, -1.210139, 1, 0.8392157, 0, 1,
-1.07734, 0.256164, -2.024145, 1, 0.8470588, 0, 1,
-1.069993, 2.512532, -1.37575, 1, 0.8509804, 0, 1,
-1.064442, -0.2595607, -1.56323, 1, 0.8588235, 0, 1,
-1.063763, -0.09566417, -3.162153, 1, 0.8627451, 0, 1,
-1.050159, 0.7577249, -3.138768, 1, 0.8705882, 0, 1,
-1.049636, -1.389178, -2.540726, 1, 0.8745098, 0, 1,
-1.048606, -1.036489, -3.660647, 1, 0.8823529, 0, 1,
-1.039031, -1.662366, -3.642799, 1, 0.8862745, 0, 1,
-1.038886, 1.321517, -1.297387, 1, 0.8941177, 0, 1,
-1.036749, -1.235567, -2.352067, 1, 0.8980392, 0, 1,
-1.036193, 0.6152075, 0.122608, 1, 0.9058824, 0, 1,
-1.035891, -0.3815254, -2.141123, 1, 0.9137255, 0, 1,
-1.026575, 0.9543675, -1.938621, 1, 0.9176471, 0, 1,
-1.021411, -0.3383385, -1.628396, 1, 0.9254902, 0, 1,
-1.019646, 0.729445, -0.8525555, 1, 0.9294118, 0, 1,
-1.015539, -1.577599, -2.016201, 1, 0.9372549, 0, 1,
-1.013737, 0.4516108, -0.5450426, 1, 0.9411765, 0, 1,
-1.013732, 1.422005, -1.655631, 1, 0.9490196, 0, 1,
-1.013656, -2.150947, -2.081669, 1, 0.9529412, 0, 1,
-0.9967014, 0.3502693, -1.800954, 1, 0.9607843, 0, 1,
-0.9948153, 0.9918553, -2.010238, 1, 0.9647059, 0, 1,
-0.9947461, 0.6436324, -0.2292127, 1, 0.972549, 0, 1,
-0.9924762, 0.1976653, -0.9399632, 1, 0.9764706, 0, 1,
-0.9924573, -0.5801736, -2.874697, 1, 0.9843137, 0, 1,
-0.9878235, -1.954257, -4.4956, 1, 0.9882353, 0, 1,
-0.9842511, -0.1659983, -0.6552106, 1, 0.9960784, 0, 1,
-0.9827743, 0.6277426, -0.07141816, 0.9960784, 1, 0, 1,
-0.9690062, -1.138534, -0.6141616, 0.9921569, 1, 0, 1,
-0.9683097, -0.2195731, -1.950541, 0.9843137, 1, 0, 1,
-0.9651168, 1.349706, 0.714309, 0.9803922, 1, 0, 1,
-0.9612951, 0.5065966, -2.796811, 0.972549, 1, 0, 1,
-0.9596987, 0.6037934, -0.5884327, 0.9686275, 1, 0, 1,
-0.9556168, 0.6018801, -1.125173, 0.9607843, 1, 0, 1,
-0.9444647, -0.5233395, -2.33797, 0.9568627, 1, 0, 1,
-0.9434519, -0.4766091, -2.304647, 0.9490196, 1, 0, 1,
-0.9434482, -0.5491166, -2.296964, 0.945098, 1, 0, 1,
-0.9375213, 0.4681611, 0.1087009, 0.9372549, 1, 0, 1,
-0.9251879, 0.8561081, -1.90691, 0.9333333, 1, 0, 1,
-0.9236452, -1.02229, -3.78204, 0.9254902, 1, 0, 1,
-0.9223421, -0.1028544, -2.698722, 0.9215686, 1, 0, 1,
-0.9214885, -0.6157754, -2.820993, 0.9137255, 1, 0, 1,
-0.9192764, -1.05258, -4.064884, 0.9098039, 1, 0, 1,
-0.9129176, 0.1009705, -1.029554, 0.9019608, 1, 0, 1,
-0.9066661, -1.469049, -3.852108, 0.8941177, 1, 0, 1,
-0.9010196, -0.8252817, -3.355124, 0.8901961, 1, 0, 1,
-0.9004059, 0.8705152, 0.5395365, 0.8823529, 1, 0, 1,
-0.8987098, 0.5286843, -1.676352, 0.8784314, 1, 0, 1,
-0.8973858, -2.517536, -3.144739, 0.8705882, 1, 0, 1,
-0.8961748, 0.8064395, 0.1334056, 0.8666667, 1, 0, 1,
-0.8931827, -0.7596038, -2.49121, 0.8588235, 1, 0, 1,
-0.8905113, -0.2734352, -1.160258, 0.854902, 1, 0, 1,
-0.8902372, -0.6152219, -2.184032, 0.8470588, 1, 0, 1,
-0.8880005, 0.03406663, -2.350374, 0.8431373, 1, 0, 1,
-0.8817618, 0.9107978, -1.454261, 0.8352941, 1, 0, 1,
-0.880739, -0.5736758, -2.810991, 0.8313726, 1, 0, 1,
-0.8773182, -0.08787815, -2.374003, 0.8235294, 1, 0, 1,
-0.8715355, 2.508555, -2.022069, 0.8196079, 1, 0, 1,
-0.8710431, -1.061876, -2.912318, 0.8117647, 1, 0, 1,
-0.8636356, -0.3505474, -0.8445005, 0.8078431, 1, 0, 1,
-0.860669, -0.3759185, -1.857151, 0.8, 1, 0, 1,
-0.858997, -1.242208, -1.68673, 0.7921569, 1, 0, 1,
-0.8571418, 0.3889157, 1.0114, 0.7882353, 1, 0, 1,
-0.8528623, 0.5779842, -0.6600414, 0.7803922, 1, 0, 1,
-0.8481669, -0.03890705, -1.451517, 0.7764706, 1, 0, 1,
-0.8395833, 0.3752084, -0.788016, 0.7686275, 1, 0, 1,
-0.8366362, -0.5668835, -2.420831, 0.7647059, 1, 0, 1,
-0.8351067, 1.268447, -2.166748, 0.7568628, 1, 0, 1,
-0.8313359, -0.05282426, -0.2848947, 0.7529412, 1, 0, 1,
-0.8278987, 0.2082807, -1.392101, 0.7450981, 1, 0, 1,
-0.8262123, 2.04226, 0.8847886, 0.7411765, 1, 0, 1,
-0.8132703, 0.1265955, -1.63131, 0.7333333, 1, 0, 1,
-0.8102157, -0.6802315, -2.455825, 0.7294118, 1, 0, 1,
-0.8093445, 0.1727307, -1.571829, 0.7215686, 1, 0, 1,
-0.8034422, -0.5724415, -1.72408, 0.7176471, 1, 0, 1,
-0.798157, -2.155521, -2.210975, 0.7098039, 1, 0, 1,
-0.7937727, 1.679845, -0.7242985, 0.7058824, 1, 0, 1,
-0.78926, 0.2017116, -0.1967416, 0.6980392, 1, 0, 1,
-0.7891012, -0.8727238, -3.344141, 0.6901961, 1, 0, 1,
-0.7880086, 0.4550442, -0.8071302, 0.6862745, 1, 0, 1,
-0.7760634, -0.5131565, -1.391843, 0.6784314, 1, 0, 1,
-0.7739683, -1.281076, -3.070255, 0.6745098, 1, 0, 1,
-0.7654831, -0.3569275, -1.96639, 0.6666667, 1, 0, 1,
-0.765255, -0.1381685, -2.80522, 0.6627451, 1, 0, 1,
-0.7647606, -0.988845, -0.8633129, 0.654902, 1, 0, 1,
-0.7606236, -0.6509696, -2.646779, 0.6509804, 1, 0, 1,
-0.7577838, 0.9548537, -1.066302, 0.6431373, 1, 0, 1,
-0.7576983, 0.3158568, -0.9355098, 0.6392157, 1, 0, 1,
-0.7566838, -1.458353, -3.211957, 0.6313726, 1, 0, 1,
-0.7519079, -0.1323039, -2.641031, 0.627451, 1, 0, 1,
-0.7499128, -0.1094886, -0.3286251, 0.6196079, 1, 0, 1,
-0.7474099, 0.3595059, 0.8104201, 0.6156863, 1, 0, 1,
-0.7446693, 0.9867225, -0.2755601, 0.6078432, 1, 0, 1,
-0.7435563, -0.6216397, -1.981787, 0.6039216, 1, 0, 1,
-0.7426132, -0.6496028, -1.898516, 0.5960785, 1, 0, 1,
-0.7342473, 0.1110542, 0.9906858, 0.5882353, 1, 0, 1,
-0.7325211, 0.1321968, -0.7415589, 0.5843138, 1, 0, 1,
-0.7318601, 0.6676418, 1.501772, 0.5764706, 1, 0, 1,
-0.7291809, -0.80054, -0.6742305, 0.572549, 1, 0, 1,
-0.7229393, -1.043125, -1.62652, 0.5647059, 1, 0, 1,
-0.7129985, 0.1055476, -2.197181, 0.5607843, 1, 0, 1,
-0.7118867, -0.463167, -2.625628, 0.5529412, 1, 0, 1,
-0.7020398, -0.04721117, -0.6325071, 0.5490196, 1, 0, 1,
-0.6951532, 0.6851445, -0.1769881, 0.5411765, 1, 0, 1,
-0.6903353, -1.274841, -1.62248, 0.5372549, 1, 0, 1,
-0.685905, 0.5450933, -0.248495, 0.5294118, 1, 0, 1,
-0.6839268, 0.7545534, -0.7542918, 0.5254902, 1, 0, 1,
-0.6838261, -0.2960971, -1.743291, 0.5176471, 1, 0, 1,
-0.6796972, 1.366381, -1.458922, 0.5137255, 1, 0, 1,
-0.676186, 3.238811, -0.2722993, 0.5058824, 1, 0, 1,
-0.671911, -2.18412, -3.787891, 0.5019608, 1, 0, 1,
-0.6611164, 0.758957, -0.1176079, 0.4941176, 1, 0, 1,
-0.6575693, 0.8292338, 1.495181, 0.4862745, 1, 0, 1,
-0.6560739, 0.9694353, -1.655867, 0.4823529, 1, 0, 1,
-0.6409214, 1.171356, 0.7900893, 0.4745098, 1, 0, 1,
-0.6387722, 1.839445, 0.7919044, 0.4705882, 1, 0, 1,
-0.6342259, -1.756571, -3.920936, 0.4627451, 1, 0, 1,
-0.6342203, 0.04290432, -0.8870161, 0.4588235, 1, 0, 1,
-0.6319417, 1.519809, -0.1438063, 0.4509804, 1, 0, 1,
-0.6309901, -0.3634035, -1.581576, 0.4470588, 1, 0, 1,
-0.6276855, 0.5544677, -0.1001674, 0.4392157, 1, 0, 1,
-0.6267956, 0.9516499, 0.9930924, 0.4352941, 1, 0, 1,
-0.6238708, 2.254673, 0.5388979, 0.427451, 1, 0, 1,
-0.6217036, 1.394729, 0.3454759, 0.4235294, 1, 0, 1,
-0.6215663, 0.1689232, -1.36232, 0.4156863, 1, 0, 1,
-0.6195518, 0.1960656, -0.9526393, 0.4117647, 1, 0, 1,
-0.6137675, 1.265705, -0.1095173, 0.4039216, 1, 0, 1,
-0.606167, -1.115799, -3.488227, 0.3960784, 1, 0, 1,
-0.6058836, 0.6725703, -1.316676, 0.3921569, 1, 0, 1,
-0.6049794, -0.4146472, -3.112206, 0.3843137, 1, 0, 1,
-0.6031407, -0.6513688, -2.952961, 0.3803922, 1, 0, 1,
-0.5956258, 0.8282162, -1.51834, 0.372549, 1, 0, 1,
-0.5858436, 0.574589, -0.7718975, 0.3686275, 1, 0, 1,
-0.5850407, 2.176182, -0.5287107, 0.3607843, 1, 0, 1,
-0.5841806, 0.6599289, -0.9224045, 0.3568628, 1, 0, 1,
-0.5759885, 0.7208019, -0.819532, 0.3490196, 1, 0, 1,
-0.5735582, -1.75667, -2.921312, 0.345098, 1, 0, 1,
-0.5734825, 0.1229754, -0.8163255, 0.3372549, 1, 0, 1,
-0.5727745, 1.259911, -0.6816266, 0.3333333, 1, 0, 1,
-0.561103, 0.2691824, -1.720298, 0.3254902, 1, 0, 1,
-0.5592377, -0.558189, -2.907585, 0.3215686, 1, 0, 1,
-0.5580514, -1.333241, -1.283091, 0.3137255, 1, 0, 1,
-0.5573456, -1.648113, -4.257575, 0.3098039, 1, 0, 1,
-0.5549451, 0.8924109, -1.054481, 0.3019608, 1, 0, 1,
-0.5545554, -0.4957738, -1.665442, 0.2941177, 1, 0, 1,
-0.5535592, -0.7201706, -2.411536, 0.2901961, 1, 0, 1,
-0.5527794, 1.678187, 0.6381503, 0.282353, 1, 0, 1,
-0.5517642, -0.335844, -2.389521, 0.2784314, 1, 0, 1,
-0.5514921, -0.5059334, -3.344299, 0.2705882, 1, 0, 1,
-0.5489826, -0.6616678, -2.471778, 0.2666667, 1, 0, 1,
-0.5461371, -1.06168, -2.839329, 0.2588235, 1, 0, 1,
-0.5459549, -2.124412, -6.407463, 0.254902, 1, 0, 1,
-0.5400931, 0.4482861, -0.5260178, 0.2470588, 1, 0, 1,
-0.539396, -2.109765, -2.8009, 0.2431373, 1, 0, 1,
-0.5379395, 0.741221, -0.3515206, 0.2352941, 1, 0, 1,
-0.5307153, -0.1293512, -1.976197, 0.2313726, 1, 0, 1,
-0.5302153, 0.8197529, 1.728086, 0.2235294, 1, 0, 1,
-0.5283917, 0.8452435, -0.3732662, 0.2196078, 1, 0, 1,
-0.5279796, -0.1631416, -2.356827, 0.2117647, 1, 0, 1,
-0.5278385, 0.1813463, -1.282927, 0.2078431, 1, 0, 1,
-0.5269889, 0.1683387, 0.5543621, 0.2, 1, 0, 1,
-0.5165759, -1.578859, -3.151135, 0.1921569, 1, 0, 1,
-0.5147681, 1.43022, -0.6619362, 0.1882353, 1, 0, 1,
-0.5136226, 1.385068, -0.0988675, 0.1803922, 1, 0, 1,
-0.5094761, 0.1444749, -1.529686, 0.1764706, 1, 0, 1,
-0.5084183, 0.6402464, -0.4133169, 0.1686275, 1, 0, 1,
-0.5063378, 1.591589, 0.01344752, 0.1647059, 1, 0, 1,
-0.5062419, -0.192539, -1.792999, 0.1568628, 1, 0, 1,
-0.5033011, -0.4519242, -1.494768, 0.1529412, 1, 0, 1,
-0.5012986, 1.083545, -1.016364, 0.145098, 1, 0, 1,
-0.5006267, -0.06782625, -2.005673, 0.1411765, 1, 0, 1,
-0.4979764, 0.6511195, -2.290403, 0.1333333, 1, 0, 1,
-0.4914498, -0.2660086, -2.105393, 0.1294118, 1, 0, 1,
-0.4912918, -0.3094716, -3.08338, 0.1215686, 1, 0, 1,
-0.490776, 2.72129, 0.001825695, 0.1176471, 1, 0, 1,
-0.4862359, 0.6045241, 1.74194, 0.1098039, 1, 0, 1,
-0.4861445, -0.8653556, -4.208064, 0.1058824, 1, 0, 1,
-0.4834452, 2.402155, -1.632389, 0.09803922, 1, 0, 1,
-0.4827125, 0.6439388, -1.125659, 0.09019608, 1, 0, 1,
-0.482246, 2.187887, -1.626605, 0.08627451, 1, 0, 1,
-0.4814354, -0.6392865, -2.36506, 0.07843138, 1, 0, 1,
-0.4803173, 0.2679242, -1.900383, 0.07450981, 1, 0, 1,
-0.4788819, -1.712547, -3.562999, 0.06666667, 1, 0, 1,
-0.473562, 0.7120221, -0.4189449, 0.0627451, 1, 0, 1,
-0.4724624, 1.250957, -0.08299556, 0.05490196, 1, 0, 1,
-0.4712702, -1.783213, -1.545318, 0.05098039, 1, 0, 1,
-0.4692568, -0.01363708, 0.00711449, 0.04313726, 1, 0, 1,
-0.4639847, 1.263484, -1.959124, 0.03921569, 1, 0, 1,
-0.4631745, -2.107432, -1.643287, 0.03137255, 1, 0, 1,
-0.4512223, 1.978525, -2.036494, 0.02745098, 1, 0, 1,
-0.448618, 1.275454, -0.6452269, 0.01960784, 1, 0, 1,
-0.4448763, -0.998709, -2.516315, 0.01568628, 1, 0, 1,
-0.4446799, 2.312168, 0.8012438, 0.007843138, 1, 0, 1,
-0.4442773, 0.3683617, -2.919849, 0.003921569, 1, 0, 1,
-0.4422438, -0.7942114, -2.078062, 0, 1, 0.003921569, 1,
-0.4374821, 0.6913683, -1.188496, 0, 1, 0.01176471, 1,
-0.4362889, 1.416159, 0.4977638, 0, 1, 0.01568628, 1,
-0.434756, -1.7954, -3.780419, 0, 1, 0.02352941, 1,
-0.4342896, -1.91868, -2.691851, 0, 1, 0.02745098, 1,
-0.4340003, 1.048922, -0.3659435, 0, 1, 0.03529412, 1,
-0.4305283, -0.2544923, -1.929192, 0, 1, 0.03921569, 1,
-0.4279456, 0.5932665, 0.3364151, 0, 1, 0.04705882, 1,
-0.4261473, -0.7621291, -0.6936778, 0, 1, 0.05098039, 1,
-0.4240299, 1.2773, -0.9056256, 0, 1, 0.05882353, 1,
-0.4117106, 0.8825783, -0.7958758, 0, 1, 0.0627451, 1,
-0.4075112, 2.004044, -2.074478, 0, 1, 0.07058824, 1,
-0.4066556, 0.4730464, -0.945446, 0, 1, 0.07450981, 1,
-0.4054789, 0.3050647, -2.382392, 0, 1, 0.08235294, 1,
-0.4031264, -1.282789, -3.924304, 0, 1, 0.08627451, 1,
-0.4020181, -0.3533284, -2.711558, 0, 1, 0.09411765, 1,
-0.4013401, -0.1755512, -1.333424, 0, 1, 0.1019608, 1,
-0.3976904, -0.6621642, -3.350007, 0, 1, 0.1058824, 1,
-0.3903439, 0.5480632, -1.842124, 0, 1, 0.1137255, 1,
-0.3891833, -2.45049, -4.198282, 0, 1, 0.1176471, 1,
-0.3880696, -0.4792199, -4.092734, 0, 1, 0.1254902, 1,
-0.3874658, 0.2324769, -1.218036, 0, 1, 0.1294118, 1,
-0.3859646, 0.9447995, 0.6110296, 0, 1, 0.1372549, 1,
-0.3857019, -0.04518912, -2.735627, 0, 1, 0.1411765, 1,
-0.3815032, -1.313231, -3.612769, 0, 1, 0.1490196, 1,
-0.3791502, 0.01616237, -1.906353, 0, 1, 0.1529412, 1,
-0.3777006, -0.5449081, -2.599496, 0, 1, 0.1607843, 1,
-0.3772907, 1.388137, -2.302193, 0, 1, 0.1647059, 1,
-0.3767591, -0.8635052, -2.550873, 0, 1, 0.172549, 1,
-0.3761606, 1.937361, 0.243637, 0, 1, 0.1764706, 1,
-0.375398, -0.4197997, -1.689861, 0, 1, 0.1843137, 1,
-0.374943, 0.6781586, -1.67033, 0, 1, 0.1882353, 1,
-0.3741187, -0.6897061, -2.594195, 0, 1, 0.1960784, 1,
-0.3703319, -0.4779606, -2.805577, 0, 1, 0.2039216, 1,
-0.3668312, -0.1169611, -1.945271, 0, 1, 0.2078431, 1,
-0.3562147, 0.3798443, 0.1968986, 0, 1, 0.2156863, 1,
-0.3541965, 1.288119, -1.575687, 0, 1, 0.2196078, 1,
-0.3519413, 0.08392637, -3.683234, 0, 1, 0.227451, 1,
-0.3415533, 1.52726, -1.407646, 0, 1, 0.2313726, 1,
-0.3341686, -0.9313651, -2.023886, 0, 1, 0.2392157, 1,
-0.3307256, 0.4722123, -1.256482, 0, 1, 0.2431373, 1,
-0.3173034, -2.303318, -5.50822, 0, 1, 0.2509804, 1,
-0.3157597, -0.2062896, -1.243666, 0, 1, 0.254902, 1,
-0.3117981, 0.4292921, -0.7853349, 0, 1, 0.2627451, 1,
-0.3091075, 1.375577, 0.849494, 0, 1, 0.2666667, 1,
-0.3036201, 0.2647933, 1.633989, 0, 1, 0.2745098, 1,
-0.3013037, -0.409775, -3.135838, 0, 1, 0.2784314, 1,
-0.2992164, 0.4656229, 0.7046635, 0, 1, 0.2862745, 1,
-0.2955754, 2.150661, 0.246903, 0, 1, 0.2901961, 1,
-0.2919725, 0.7939078, 0.7187442, 0, 1, 0.2980392, 1,
-0.2905385, -0.01000306, -0.8303415, 0, 1, 0.3058824, 1,
-0.2878945, 0.2997578, -1.136548, 0, 1, 0.3098039, 1,
-0.2852493, 0.6694759, -1.030466, 0, 1, 0.3176471, 1,
-0.2836978, 0.5885361, 0.1481599, 0, 1, 0.3215686, 1,
-0.2795365, 0.4837419, 0.5870075, 0, 1, 0.3294118, 1,
-0.2747031, -1.078827, -2.578472, 0, 1, 0.3333333, 1,
-0.2738687, 0.961469, 0.191667, 0, 1, 0.3411765, 1,
-0.2731926, 0.1416781, -2.799265, 0, 1, 0.345098, 1,
-0.2727333, 2.356873, -0.5036753, 0, 1, 0.3529412, 1,
-0.2707026, 0.4441499, -1.098084, 0, 1, 0.3568628, 1,
-0.2706752, 0.1558708, -2.543749, 0, 1, 0.3647059, 1,
-0.2691438, 1.983768, -1.439604, 0, 1, 0.3686275, 1,
-0.2691281, -0.1215026, -1.05781, 0, 1, 0.3764706, 1,
-0.2680638, 0.4363308, -1.083129, 0, 1, 0.3803922, 1,
-0.267177, -0.4986158, -2.328882, 0, 1, 0.3882353, 1,
-0.2663972, 0.5627239, -0.9120077, 0, 1, 0.3921569, 1,
-0.2633935, 0.02708068, -1.762694, 0, 1, 0.4, 1,
-0.2549335, 0.3862669, 0.1368153, 0, 1, 0.4078431, 1,
-0.2539009, 1.393315, 0.1687935, 0, 1, 0.4117647, 1,
-0.2508198, -0.5402514, -1.771339, 0, 1, 0.4196078, 1,
-0.2484718, -0.9025683, -2.907023, 0, 1, 0.4235294, 1,
-0.2439996, -2.132978, -3.369832, 0, 1, 0.4313726, 1,
-0.2427096, 0.1069985, -2.443383, 0, 1, 0.4352941, 1,
-0.2382626, 1.028887, -0.3014775, 0, 1, 0.4431373, 1,
-0.2353752, -1.992948, -4.442657, 0, 1, 0.4470588, 1,
-0.2347191, 0.4684452, 0.7864337, 0, 1, 0.454902, 1,
-0.2327887, -0.3928396, -2.229013, 0, 1, 0.4588235, 1,
-0.2324529, 0.7581814, 1.349922, 0, 1, 0.4666667, 1,
-0.2298883, -2.306216, -2.535786, 0, 1, 0.4705882, 1,
-0.2218866, 1.623328, -0.9743445, 0, 1, 0.4784314, 1,
-0.2209154, -0.9362464, -2.519598, 0, 1, 0.4823529, 1,
-0.2191115, -0.5177261, -1.7728, 0, 1, 0.4901961, 1,
-0.2165781, 1.364486, -1.762123, 0, 1, 0.4941176, 1,
-0.2156833, -0.1724909, -2.437397, 0, 1, 0.5019608, 1,
-0.2133097, -0.953178, -3.791657, 0, 1, 0.509804, 1,
-0.2114511, 1.514175, -0.9096757, 0, 1, 0.5137255, 1,
-0.2093345, 1.085778, 0.5991709, 0, 1, 0.5215687, 1,
-0.205694, 0.6606146, -0.7277724, 0, 1, 0.5254902, 1,
-0.1966472, 0.5077863, 1.3994, 0, 1, 0.5333334, 1,
-0.192481, 0.04368569, -0.8415265, 0, 1, 0.5372549, 1,
-0.1908911, 0.8227745, 0.7308298, 0, 1, 0.5450981, 1,
-0.1877579, 1.653439, -1.487702, 0, 1, 0.5490196, 1,
-0.1872098, -0.4016874, -2.278621, 0, 1, 0.5568628, 1,
-0.1864987, 0.8101634, -0.877664, 0, 1, 0.5607843, 1,
-0.1838843, 0.7087084, -0.130466, 0, 1, 0.5686275, 1,
-0.1794711, -0.6028619, -3.661517, 0, 1, 0.572549, 1,
-0.1719573, 2.306994, 1.227247, 0, 1, 0.5803922, 1,
-0.1657492, -0.7316251, -2.248615, 0, 1, 0.5843138, 1,
-0.1643882, -0.2277401, -1.856016, 0, 1, 0.5921569, 1,
-0.1578284, 0.3633283, -0.7618249, 0, 1, 0.5960785, 1,
-0.1557066, 1.559475, -0.7766442, 0, 1, 0.6039216, 1,
-0.1545905, 0.6735871, -1.943723, 0, 1, 0.6117647, 1,
-0.1519814, -0.6703322, -2.580855, 0, 1, 0.6156863, 1,
-0.1446285, 1.559506, -0.8267484, 0, 1, 0.6235294, 1,
-0.1401996, 0.8651249, -0.9531362, 0, 1, 0.627451, 1,
-0.1333458, -0.1902233, -4.538888, 0, 1, 0.6352941, 1,
-0.1249149, -0.1629173, -2.007954, 0, 1, 0.6392157, 1,
-0.1218301, 0.2139369, 0.6272309, 0, 1, 0.6470588, 1,
-0.1197934, -0.6142798, -3.253052, 0, 1, 0.6509804, 1,
-0.1197659, -0.1110887, -2.150646, 0, 1, 0.6588235, 1,
-0.1179718, -1.241167, -1.68184, 0, 1, 0.6627451, 1,
-0.1133922, -1.034872, -1.513184, 0, 1, 0.6705883, 1,
-0.1095572, 0.4973936, 0.4022281, 0, 1, 0.6745098, 1,
-0.1094913, 0.7188355, -1.460763, 0, 1, 0.682353, 1,
-0.1094887, 2.26897, -0.4512648, 0, 1, 0.6862745, 1,
-0.1081572, -0.4194675, -3.163352, 0, 1, 0.6941177, 1,
-0.1047546, 0.5452503, -0.9683396, 0, 1, 0.7019608, 1,
-0.1019605, 0.1984082, -0.665704, 0, 1, 0.7058824, 1,
-0.09906242, -0.2606489, -2.519503, 0, 1, 0.7137255, 1,
-0.09518468, -0.5210384, -3.525647, 0, 1, 0.7176471, 1,
-0.09258398, -1.082079, -2.423479, 0, 1, 0.7254902, 1,
-0.09032989, 0.1666283, -0.6972144, 0, 1, 0.7294118, 1,
-0.08954739, -1.668841, -2.30552, 0, 1, 0.7372549, 1,
-0.08878063, -0.6854599, -3.81137, 0, 1, 0.7411765, 1,
-0.0878939, -0.537419, -5.930358, 0, 1, 0.7490196, 1,
-0.08741383, -0.705452, -3.291895, 0, 1, 0.7529412, 1,
-0.08605536, -0.3669142, -0.7526277, 0, 1, 0.7607843, 1,
-0.07515275, -1.045013, -2.588459, 0, 1, 0.7647059, 1,
-0.07273662, 0.6656372, -0.7516325, 0, 1, 0.772549, 1,
-0.07215136, 0.1096949, 0.5022629, 0, 1, 0.7764706, 1,
-0.07211764, -0.1740245, -2.694025, 0, 1, 0.7843137, 1,
-0.07125598, -2.261167, -3.388906, 0, 1, 0.7882353, 1,
-0.06968106, 0.4860129, 0.229462, 0, 1, 0.7960784, 1,
-0.06566788, -0.7383766, -2.9507, 0, 1, 0.8039216, 1,
-0.0637226, 1.592744, -1.755767, 0, 1, 0.8078431, 1,
-0.05733637, -0.9384161, -4.708246, 0, 1, 0.8156863, 1,
-0.05666484, 0.4765779, 1.620846, 0, 1, 0.8196079, 1,
-0.05620385, -0.351547, -2.882489, 0, 1, 0.827451, 1,
-0.05395009, 0.134176, -1.544762, 0, 1, 0.8313726, 1,
-0.05388277, 0.7616354, -0.193462, 0, 1, 0.8392157, 1,
-0.05367365, -0.4294074, -1.865226, 0, 1, 0.8431373, 1,
-0.05347902, -3.855725, -3.531842, 0, 1, 0.8509804, 1,
-0.05255944, -0.2303278, -1.080052, 0, 1, 0.854902, 1,
-0.04848018, 0.2011606, 0.309229, 0, 1, 0.8627451, 1,
-0.04773584, -0.3002071, -3.312603, 0, 1, 0.8666667, 1,
-0.04509276, 0.1936686, -0.9732951, 0, 1, 0.8745098, 1,
-0.04340633, 1.948126, -1.784016, 0, 1, 0.8784314, 1,
-0.03887476, 0.6638689, -0.111576, 0, 1, 0.8862745, 1,
-0.03817517, -0.09945969, -3.579465, 0, 1, 0.8901961, 1,
-0.0368193, -0.4785342, -4.269261, 0, 1, 0.8980392, 1,
-0.03176993, 0.5176684, -0.3493868, 0, 1, 0.9058824, 1,
-0.02984479, -1.062928, -2.777621, 0, 1, 0.9098039, 1,
-0.02394974, 0.8970777, 0.2242092, 0, 1, 0.9176471, 1,
-0.02207492, 1.941278, 0.2257967, 0, 1, 0.9215686, 1,
-0.02078223, -1.287196, -4.60049, 0, 1, 0.9294118, 1,
-0.0203094, -1.442631, -4.13427, 0, 1, 0.9333333, 1,
-0.01998974, -0.6114638, -2.430957, 0, 1, 0.9411765, 1,
-0.01805192, 1.503276, -0.9293574, 0, 1, 0.945098, 1,
-0.01692901, 1.527343, 1.78668, 0, 1, 0.9529412, 1,
-0.01613119, -0.5838442, -3.321005, 0, 1, 0.9568627, 1,
-0.01600738, -0.4689958, -1.295827, 0, 1, 0.9647059, 1,
-0.01173512, -0.5686604, -2.769332, 0, 1, 0.9686275, 1,
-0.01140121, -0.4368028, -3.824069, 0, 1, 0.9764706, 1,
-0.007725853, -0.433957, -2.517525, 0, 1, 0.9803922, 1,
-0.007069577, -0.7583356, -3.742531, 0, 1, 0.9882353, 1,
-0.005557755, 0.2647018, 0.9623339, 0, 1, 0.9921569, 1,
-0.005435409, -1.015574, -4.150344, 0, 1, 1, 1,
0.0001375714, 0.8173727, 0.1950022, 0, 0.9921569, 1, 1,
0.002010113, -0.7777279, 3.470681, 0, 0.9882353, 1, 1,
0.007182108, -2.911504, 4.778234, 0, 0.9803922, 1, 1,
0.008938172, -2.113313, 3.641449, 0, 0.9764706, 1, 1,
0.01229059, -0.2873865, 4.025715, 0, 0.9686275, 1, 1,
0.0127436, 0.6746363, -1.82733, 0, 0.9647059, 1, 1,
0.01833662, -0.2573444, 2.981505, 0, 0.9568627, 1, 1,
0.02399128, 0.4697341, -0.3149442, 0, 0.9529412, 1, 1,
0.0267986, 1.796948, 0.3176379, 0, 0.945098, 1, 1,
0.03682519, -1.144208, 3.11175, 0, 0.9411765, 1, 1,
0.03763535, 0.9223014, -1.552257, 0, 0.9333333, 1, 1,
0.04671445, 0.05987904, 0.3524957, 0, 0.9294118, 1, 1,
0.04725843, -0.8308265, 4.417276, 0, 0.9215686, 1, 1,
0.05000114, -0.6080762, 4.821636, 0, 0.9176471, 1, 1,
0.05169147, -0.8412345, 2.927423, 0, 0.9098039, 1, 1,
0.05266031, -1.639155, 3.737703, 0, 0.9058824, 1, 1,
0.05554577, 0.7443426, 0.2692672, 0, 0.8980392, 1, 1,
0.05936323, 0.07050835, 0.94662, 0, 0.8901961, 1, 1,
0.06302949, 1.401708, 0.7106627, 0, 0.8862745, 1, 1,
0.06360962, 0.9760587, -1.163082, 0, 0.8784314, 1, 1,
0.07416897, -0.8641681, 3.018544, 0, 0.8745098, 1, 1,
0.07777371, -1.835155, 2.711422, 0, 0.8666667, 1, 1,
0.07990962, 0.9228747, -0.1014482, 0, 0.8627451, 1, 1,
0.08091203, 0.2067969, -0.4265418, 0, 0.854902, 1, 1,
0.08151042, -0.2356603, 2.590216, 0, 0.8509804, 1, 1,
0.08223442, 0.1696484, 1.125477, 0, 0.8431373, 1, 1,
0.08224725, 0.6198733, 0.01084083, 0, 0.8392157, 1, 1,
0.08338379, -0.2128644, 2.210207, 0, 0.8313726, 1, 1,
0.08839669, -0.4698052, 3.010502, 0, 0.827451, 1, 1,
0.09020591, 0.8055481, -0.4189753, 0, 0.8196079, 1, 1,
0.09222803, -0.5402989, 3.282189, 0, 0.8156863, 1, 1,
0.09661173, -0.5337958, 3.44662, 0, 0.8078431, 1, 1,
0.09707999, -0.1089203, 1.871109, 0, 0.8039216, 1, 1,
0.09887985, 0.1783121, 1.355113, 0, 0.7960784, 1, 1,
0.1063559, -1.014445, 4.377389, 0, 0.7882353, 1, 1,
0.1076423, 1.769722, 0.2380095, 0, 0.7843137, 1, 1,
0.1080613, 0.9928808, -0.5672292, 0, 0.7764706, 1, 1,
0.1123874, 1.055419, -0.3022168, 0, 0.772549, 1, 1,
0.1137145, -0.7451953, 2.72532, 0, 0.7647059, 1, 1,
0.1175784, -0.8322936, 1.168262, 0, 0.7607843, 1, 1,
0.1189079, 0.2734664, -0.2823105, 0, 0.7529412, 1, 1,
0.1196269, -1.113357, 1.300752, 0, 0.7490196, 1, 1,
0.1200135, -0.4333281, 2.274645, 0, 0.7411765, 1, 1,
0.1214898, -0.5359523, 3.451559, 0, 0.7372549, 1, 1,
0.1221722, 0.712043, -0.06709409, 0, 0.7294118, 1, 1,
0.124477, 1.083462, 1.389594, 0, 0.7254902, 1, 1,
0.1260576, 0.4532658, 0.5640153, 0, 0.7176471, 1, 1,
0.1309831, -0.9654976, 3.249725, 0, 0.7137255, 1, 1,
0.13223, -0.5706142, 3.055743, 0, 0.7058824, 1, 1,
0.1331092, 0.01825309, 1.1311, 0, 0.6980392, 1, 1,
0.1344643, 2.321524, 0.8500609, 0, 0.6941177, 1, 1,
0.1435589, 0.1260914, 0.2173477, 0, 0.6862745, 1, 1,
0.1441131, -0.5823243, 1.343977, 0, 0.682353, 1, 1,
0.1447825, 0.387467, 0.2711936, 0, 0.6745098, 1, 1,
0.1470199, 1.414365, -0.6981177, 0, 0.6705883, 1, 1,
0.1479561, -0.1837286, 2.395148, 0, 0.6627451, 1, 1,
0.1514276, 0.8555142, 0.8625282, 0, 0.6588235, 1, 1,
0.1547483, 1.152097, -0.5393615, 0, 0.6509804, 1, 1,
0.1550557, 0.4936425, 0.1266054, 0, 0.6470588, 1, 1,
0.1568773, -0.9668851, 1.507515, 0, 0.6392157, 1, 1,
0.1575658, 0.5528053, -0.3192307, 0, 0.6352941, 1, 1,
0.1584496, -1.982565, 1.356922, 0, 0.627451, 1, 1,
0.1704105, 0.3885162, -0.08857343, 0, 0.6235294, 1, 1,
0.1737415, 0.457721, 2.100169, 0, 0.6156863, 1, 1,
0.1738182, -1.957398, 1.661329, 0, 0.6117647, 1, 1,
0.1752984, -0.8791152, 2.930971, 0, 0.6039216, 1, 1,
0.177795, -0.118108, 2.003583, 0, 0.5960785, 1, 1,
0.1792895, 0.7882381, 1.284172, 0, 0.5921569, 1, 1,
0.1802474, -0.01446459, 2.093864, 0, 0.5843138, 1, 1,
0.1860567, -0.6942922, 2.544903, 0, 0.5803922, 1, 1,
0.190746, 1.145296, 1.65006, 0, 0.572549, 1, 1,
0.1913108, -1.086599, 3.292405, 0, 0.5686275, 1, 1,
0.1913597, -1.603405, 3.522314, 0, 0.5607843, 1, 1,
0.1919818, 0.6768641, -1.097662, 0, 0.5568628, 1, 1,
0.1927289, -0.006984166, 0.7857129, 0, 0.5490196, 1, 1,
0.1932319, 0.9334581, -0.3833704, 0, 0.5450981, 1, 1,
0.1943958, -0.8557279, 2.615935, 0, 0.5372549, 1, 1,
0.1969087, 0.1273923, 1.324124, 0, 0.5333334, 1, 1,
0.2005081, -0.1129555, 4.402577, 0, 0.5254902, 1, 1,
0.2019285, 0.9189627, -1.147879, 0, 0.5215687, 1, 1,
0.2046419, -0.4308406, 3.381976, 0, 0.5137255, 1, 1,
0.2051491, -0.2972554, 1.711405, 0, 0.509804, 1, 1,
0.2053655, -0.7649663, 2.821652, 0, 0.5019608, 1, 1,
0.2073705, 0.5231843, -0.4886211, 0, 0.4941176, 1, 1,
0.2091265, -1.149827, 2.148026, 0, 0.4901961, 1, 1,
0.2174152, 0.2591027, -0.3638107, 0, 0.4823529, 1, 1,
0.2259309, 0.5480315, 1.032879, 0, 0.4784314, 1, 1,
0.2290723, 0.02625394, 2.637475, 0, 0.4705882, 1, 1,
0.2311309, -1.060912, 3.326292, 0, 0.4666667, 1, 1,
0.2331271, -1.090588, 1.87765, 0, 0.4588235, 1, 1,
0.2354455, 2.419776, -1.623333, 0, 0.454902, 1, 1,
0.2380952, 0.7529808, -0.1070774, 0, 0.4470588, 1, 1,
0.2405933, 0.3249453, 2.117883, 0, 0.4431373, 1, 1,
0.242926, 0.2791054, 1.302425, 0, 0.4352941, 1, 1,
0.2512451, -0.6580013, 3.944547, 0, 0.4313726, 1, 1,
0.2536793, -0.08952335, 0.7939371, 0, 0.4235294, 1, 1,
0.2547501, 0.7374233, -0.3929827, 0, 0.4196078, 1, 1,
0.261413, -0.495771, 6.159497, 0, 0.4117647, 1, 1,
0.2634439, 0.3292687, 0.5472392, 0, 0.4078431, 1, 1,
0.2639433, -1.200593, 4.51315, 0, 0.4, 1, 1,
0.2671191, -0.1425754, 2.655051, 0, 0.3921569, 1, 1,
0.2706257, -0.9365165, 2.572879, 0, 0.3882353, 1, 1,
0.2739334, 1.246278, -0.5815626, 0, 0.3803922, 1, 1,
0.2748665, -1.727274, 1.881518, 0, 0.3764706, 1, 1,
0.2780176, 1.004209, -0.8310409, 0, 0.3686275, 1, 1,
0.2781326, -0.5943465, 1.413658, 0, 0.3647059, 1, 1,
0.282121, -1.742091, 2.457782, 0, 0.3568628, 1, 1,
0.2855029, -0.7265455, 1.741008, 0, 0.3529412, 1, 1,
0.2869834, 0.7757418, 1.049893, 0, 0.345098, 1, 1,
0.2874003, 0.4735247, 0.04000655, 0, 0.3411765, 1, 1,
0.2879578, -0.2541567, 1.583068, 0, 0.3333333, 1, 1,
0.2885373, -2.63706, 2.440153, 0, 0.3294118, 1, 1,
0.2891099, -0.445343, 2.168309, 0, 0.3215686, 1, 1,
0.2895699, -1.196045, 2.504227, 0, 0.3176471, 1, 1,
0.295413, -1.277776, 3.276059, 0, 0.3098039, 1, 1,
0.295646, -2.254113, 4.700241, 0, 0.3058824, 1, 1,
0.2957958, -0.7966896, 3.345202, 0, 0.2980392, 1, 1,
0.2960561, -0.0335452, 0.7404223, 0, 0.2901961, 1, 1,
0.3001632, -0.02473959, 1.339734, 0, 0.2862745, 1, 1,
0.3049975, -1.046546, 2.608493, 0, 0.2784314, 1, 1,
0.3056385, -0.1768028, 2.677868, 0, 0.2745098, 1, 1,
0.3070046, -0.330206, 3.620069, 0, 0.2666667, 1, 1,
0.307375, 1.047121, -1.772723, 0, 0.2627451, 1, 1,
0.3078544, 0.1816583, 0.1874597, 0, 0.254902, 1, 1,
0.3110538, 0.5112944, 1.383821, 0, 0.2509804, 1, 1,
0.3158115, -0.854946, 2.781443, 0, 0.2431373, 1, 1,
0.3159355, -0.1017577, 1.642101, 0, 0.2392157, 1, 1,
0.320296, -0.501195, 1.796147, 0, 0.2313726, 1, 1,
0.3231892, -0.03817582, 0.4751326, 0, 0.227451, 1, 1,
0.3250998, -1.926724, 2.829813, 0, 0.2196078, 1, 1,
0.3263264, 0.4140402, -1.3294, 0, 0.2156863, 1, 1,
0.3291694, -0.1961771, 3.328938, 0, 0.2078431, 1, 1,
0.3305592, -1.213721, 2.750994, 0, 0.2039216, 1, 1,
0.3310793, 1.084261, -0.4175329, 0, 0.1960784, 1, 1,
0.3310913, -2.216064, 2.019165, 0, 0.1882353, 1, 1,
0.3325131, 0.5544175, 0.7052768, 0, 0.1843137, 1, 1,
0.3395654, 1.151471, 2.080085, 0, 0.1764706, 1, 1,
0.3440768, 0.9400561, 1.346881, 0, 0.172549, 1, 1,
0.3446915, 0.3635558, 2.080178, 0, 0.1647059, 1, 1,
0.3470425, -0.9905565, 3.864314, 0, 0.1607843, 1, 1,
0.3471382, -1.432756, 2.926657, 0, 0.1529412, 1, 1,
0.3525153, 0.4043714, -0.7577798, 0, 0.1490196, 1, 1,
0.3572965, -1.080071, 2.071931, 0, 0.1411765, 1, 1,
0.3627397, -1.084845, 1.957398, 0, 0.1372549, 1, 1,
0.3627401, 0.8914015, 1.480482, 0, 0.1294118, 1, 1,
0.3661219, -2.24723, 1.863552, 0, 0.1254902, 1, 1,
0.3685258, -2.153858, 3.846246, 0, 0.1176471, 1, 1,
0.370804, -0.06731352, 1.74913, 0, 0.1137255, 1, 1,
0.3781844, 1.521942, 2.071949, 0, 0.1058824, 1, 1,
0.3788559, -0.4715333, 2.677987, 0, 0.09803922, 1, 1,
0.3795804, 1.20856, 0.2046554, 0, 0.09411765, 1, 1,
0.3804087, -1.871269, 3.710544, 0, 0.08627451, 1, 1,
0.3812689, 0.4125854, 0.01884977, 0, 0.08235294, 1, 1,
0.3831298, 0.05048105, 1.689979, 0, 0.07450981, 1, 1,
0.383254, -1.063094, 2.495924, 0, 0.07058824, 1, 1,
0.3857895, -0.4725644, 2.080023, 0, 0.0627451, 1, 1,
0.3867048, 0.9160472, 1.224766, 0, 0.05882353, 1, 1,
0.3878082, 0.4998807, 0.9203919, 0, 0.05098039, 1, 1,
0.3892399, -0.3921084, 3.973317, 0, 0.04705882, 1, 1,
0.3922925, 1.262443, -0.6192842, 0, 0.03921569, 1, 1,
0.3931329, -0.6105331, 0.7265856, 0, 0.03529412, 1, 1,
0.3954811, -0.5123475, 3.585774, 0, 0.02745098, 1, 1,
0.3984346, -0.1097141, 3.630422, 0, 0.02352941, 1, 1,
0.3984431, -0.4918735, 3.237511, 0, 0.01568628, 1, 1,
0.4006214, 0.9352542, 1.246794, 0, 0.01176471, 1, 1,
0.405167, -1.098339, 1.068247, 0, 0.003921569, 1, 1,
0.4104689, 0.5848857, 0.9944664, 0.003921569, 0, 1, 1,
0.4133463, 1.091128, 0.6751611, 0.007843138, 0, 1, 1,
0.416794, 0.8839986, -0.1148585, 0.01568628, 0, 1, 1,
0.4211757, 1.569989, 0.08977316, 0.01960784, 0, 1, 1,
0.4225322, 1.238506, -1.282124, 0.02745098, 0, 1, 1,
0.4280698, 1.276152, -0.07092217, 0.03137255, 0, 1, 1,
0.4312383, 1.014502, 0.9122203, 0.03921569, 0, 1, 1,
0.4320662, -0.3205068, 2.193779, 0.04313726, 0, 1, 1,
0.4532766, -0.1575127, 3.714454, 0.05098039, 0, 1, 1,
0.454964, -0.6330222, 2.644098, 0.05490196, 0, 1, 1,
0.4580402, 1.350065, 1.662426, 0.0627451, 0, 1, 1,
0.4582427, -0.5410683, 2.758524, 0.06666667, 0, 1, 1,
0.4598388, -0.9949141, 2.263174, 0.07450981, 0, 1, 1,
0.4675871, -1.605469, 3.850102, 0.07843138, 0, 1, 1,
0.4699406, -0.7188897, 0.4887959, 0.08627451, 0, 1, 1,
0.4705426, -1.30925, 4.264651, 0.09019608, 0, 1, 1,
0.4756938, -1.115219, 2.960116, 0.09803922, 0, 1, 1,
0.4768911, 0.5686191, 0.4046732, 0.1058824, 0, 1, 1,
0.4805414, -0.03337359, 2.258606, 0.1098039, 0, 1, 1,
0.4810736, 0.9764988, 0.9641521, 0.1176471, 0, 1, 1,
0.4851113, 0.02774975, -0.2717491, 0.1215686, 0, 1, 1,
0.4865036, 1.357098, 0.4926566, 0.1294118, 0, 1, 1,
0.4874898, 0.5667223, 2.095652, 0.1333333, 0, 1, 1,
0.4922741, -0.9329636, 2.764772, 0.1411765, 0, 1, 1,
0.4928641, 1.781915, -0.9196712, 0.145098, 0, 1, 1,
0.496168, -0.2653736, 2.337884, 0.1529412, 0, 1, 1,
0.4973938, -0.1578846, 1.719758, 0.1568628, 0, 1, 1,
0.498756, -0.4111308, 2.123982, 0.1647059, 0, 1, 1,
0.5023457, -2.522827, 2.730642, 0.1686275, 0, 1, 1,
0.503678, -0.5699796, 1.374995, 0.1764706, 0, 1, 1,
0.5041873, -0.5897695, 0.9913141, 0.1803922, 0, 1, 1,
0.5056335, 0.2730367, -0.3207752, 0.1882353, 0, 1, 1,
0.5096636, -0.06215704, 0.7611776, 0.1921569, 0, 1, 1,
0.5098472, -0.1912067, 2.3421, 0.2, 0, 1, 1,
0.5102713, -0.2008721, 1.004299, 0.2078431, 0, 1, 1,
0.5108425, 0.1176619, -0.923684, 0.2117647, 0, 1, 1,
0.5114018, -1.847584, 3.610465, 0.2196078, 0, 1, 1,
0.5154657, -1.392054, 2.744903, 0.2235294, 0, 1, 1,
0.5189229, -0.1906478, 3.223994, 0.2313726, 0, 1, 1,
0.5237734, -0.1342981, 3.058265, 0.2352941, 0, 1, 1,
0.5266759, 1.3221, 0.5446436, 0.2431373, 0, 1, 1,
0.5279685, 0.5366514, 0.3051753, 0.2470588, 0, 1, 1,
0.5358868, 0.8756126, -0.3004712, 0.254902, 0, 1, 1,
0.5367306, -0.1294848, 2.62135, 0.2588235, 0, 1, 1,
0.54088, 1.067524, -0.1194649, 0.2666667, 0, 1, 1,
0.5411198, -0.4271243, 2.319744, 0.2705882, 0, 1, 1,
0.54342, 0.7234954, 1.415485, 0.2784314, 0, 1, 1,
0.5435688, 0.1948974, 1.295066, 0.282353, 0, 1, 1,
0.5449612, 1.229371, 0.1058813, 0.2901961, 0, 1, 1,
0.5506883, -1.931473, 3.867124, 0.2941177, 0, 1, 1,
0.5539256, -0.4771092, 3.208689, 0.3019608, 0, 1, 1,
0.5566968, -2.203406, 3.864917, 0.3098039, 0, 1, 1,
0.5640401, 1.630314, 0.0216657, 0.3137255, 0, 1, 1,
0.5731738, 0.5195647, -0.2955247, 0.3215686, 0, 1, 1,
0.5753472, 1.076672, 0.6505767, 0.3254902, 0, 1, 1,
0.579639, -0.003709098, 1.783859, 0.3333333, 0, 1, 1,
0.5797756, 0.2548933, 0.6134089, 0.3372549, 0, 1, 1,
0.5823202, -1.707789, 2.220206, 0.345098, 0, 1, 1,
0.5827517, -0.5141034, 3.050361, 0.3490196, 0, 1, 1,
0.5833407, -0.7862076, 4.208769, 0.3568628, 0, 1, 1,
0.5850021, -0.6879321, 4.054367, 0.3607843, 0, 1, 1,
0.5855038, -0.3929533, 1.401695, 0.3686275, 0, 1, 1,
0.5868149, -1.12626, 2.099227, 0.372549, 0, 1, 1,
0.5877525, -0.2956624, 3.462128, 0.3803922, 0, 1, 1,
0.5934004, -2.152454, 3.366532, 0.3843137, 0, 1, 1,
0.5934013, 0.6877328, 0.09267332, 0.3921569, 0, 1, 1,
0.5956472, -0.1354462, 0.9824612, 0.3960784, 0, 1, 1,
0.5992473, -1.590293, 3.662512, 0.4039216, 0, 1, 1,
0.6081846, 2.032576, -0.08442002, 0.4117647, 0, 1, 1,
0.6097887, 0.003127436, -0.9917162, 0.4156863, 0, 1, 1,
0.6130722, 0.1850525, 0.3826165, 0.4235294, 0, 1, 1,
0.6134053, 0.6671391, 0.0030708, 0.427451, 0, 1, 1,
0.6141161, -0.3576211, 2.153245, 0.4352941, 0, 1, 1,
0.6162192, -0.8278256, 3.700062, 0.4392157, 0, 1, 1,
0.6180134, 0.09112979, 2.064121, 0.4470588, 0, 1, 1,
0.6217852, 0.0540742, 2.007604, 0.4509804, 0, 1, 1,
0.6243657, 0.7412409, 0.2000735, 0.4588235, 0, 1, 1,
0.6252128, 0.9080846, 1.218177, 0.4627451, 0, 1, 1,
0.6303236, 0.7561874, 0.9236766, 0.4705882, 0, 1, 1,
0.6306307, -0.6084975, 0.3450854, 0.4745098, 0, 1, 1,
0.6319019, 0.02203031, 0.1665161, 0.4823529, 0, 1, 1,
0.6325573, 0.815647, 2.243225, 0.4862745, 0, 1, 1,
0.636109, -0.120457, 1.491022, 0.4941176, 0, 1, 1,
0.6371226, 0.4961886, 0.6378869, 0.5019608, 0, 1, 1,
0.6510766, -1.676977, 3.274561, 0.5058824, 0, 1, 1,
0.6543827, -1.131779, 3.254233, 0.5137255, 0, 1, 1,
0.6619729, 0.6195094, 0.5627223, 0.5176471, 0, 1, 1,
0.6629924, 0.9990599, 0.4497966, 0.5254902, 0, 1, 1,
0.68157, 0.9429918, 1.047901, 0.5294118, 0, 1, 1,
0.6862643, -0.4975094, 0.7558941, 0.5372549, 0, 1, 1,
0.6932529, 0.6735713, 1.257584, 0.5411765, 0, 1, 1,
0.6937333, 0.06484893, 1.806559, 0.5490196, 0, 1, 1,
0.6958174, 0.8945016, 0.02333253, 0.5529412, 0, 1, 1,
0.6963894, -0.1677875, 2.2831, 0.5607843, 0, 1, 1,
0.7020462, -1.913976, 2.904148, 0.5647059, 0, 1, 1,
0.7034565, 1.152185, 2.598834, 0.572549, 0, 1, 1,
0.7049282, 1.868938, -0.9475735, 0.5764706, 0, 1, 1,
0.7117834, 0.233191, 0.1969956, 0.5843138, 0, 1, 1,
0.7147714, 1.285687, 0.5874884, 0.5882353, 0, 1, 1,
0.715655, 0.6140392, 0.7998278, 0.5960785, 0, 1, 1,
0.7173249, 1.092908, 1.003655, 0.6039216, 0, 1, 1,
0.7197331, 0.2799099, 1.871377, 0.6078432, 0, 1, 1,
0.7240529, 1.132125, 1.997452, 0.6156863, 0, 1, 1,
0.727119, 0.4191509, -0.2164314, 0.6196079, 0, 1, 1,
0.731644, 1.596563, 1.116791, 0.627451, 0, 1, 1,
0.7332858, 0.4819397, -0.02558901, 0.6313726, 0, 1, 1,
0.7451361, -0.924427, 2.763844, 0.6392157, 0, 1, 1,
0.7506273, -2.079661, 0.3444403, 0.6431373, 0, 1, 1,
0.7515131, 1.001358, 0.05857168, 0.6509804, 0, 1, 1,
0.7556961, -1.131187, 2.062665, 0.654902, 0, 1, 1,
0.7569591, 1.373409, 0.6717193, 0.6627451, 0, 1, 1,
0.7832305, -0.3909988, 1.965455, 0.6666667, 0, 1, 1,
0.7834091, 0.2384601, 0.1958532, 0.6745098, 0, 1, 1,
0.7836385, 0.4624302, -0.5321159, 0.6784314, 0, 1, 1,
0.7856976, -0.3411045, 2.930963, 0.6862745, 0, 1, 1,
0.7875481, 1.207628, 1.033672, 0.6901961, 0, 1, 1,
0.7961406, 0.7664691, 0.4520834, 0.6980392, 0, 1, 1,
0.7999936, -0.7549533, 3.014577, 0.7058824, 0, 1, 1,
0.8008031, 0.9689896, -0.823012, 0.7098039, 0, 1, 1,
0.8033192, 1.085197, -0.1385425, 0.7176471, 0, 1, 1,
0.803974, -1.181903, 2.356366, 0.7215686, 0, 1, 1,
0.8059371, -1.060472, 1.228595, 0.7294118, 0, 1, 1,
0.8059657, 0.4888594, 2.353064, 0.7333333, 0, 1, 1,
0.8218988, -0.9077815, 2.53258, 0.7411765, 0, 1, 1,
0.8343708, 0.6675953, 0.7883129, 0.7450981, 0, 1, 1,
0.8364402, 0.4514173, 1.946482, 0.7529412, 0, 1, 1,
0.8364457, -1.348288, 2.456006, 0.7568628, 0, 1, 1,
0.8406482, -1.394312, 2.632412, 0.7647059, 0, 1, 1,
0.8419015, 2.220623, 1.376349, 0.7686275, 0, 1, 1,
0.8527886, -0.4757299, 1.028219, 0.7764706, 0, 1, 1,
0.8529896, 0.849672, -0.9199947, 0.7803922, 0, 1, 1,
0.8609717, 1.734983, 1.89737, 0.7882353, 0, 1, 1,
0.8614215, 0.388569, 1.053602, 0.7921569, 0, 1, 1,
0.8640481, -0.7570767, 2.072623, 0.8, 0, 1, 1,
0.8655385, -0.5108271, 1.624137, 0.8078431, 0, 1, 1,
0.8710752, 0.5293151, 1.45349, 0.8117647, 0, 1, 1,
0.8723717, 0.0822758, 0.9491091, 0.8196079, 0, 1, 1,
0.8755913, -0.6818658, 2.704963, 0.8235294, 0, 1, 1,
0.8866253, 1.684149, -0.01360886, 0.8313726, 0, 1, 1,
0.887113, 0.589931, 2.11985, 0.8352941, 0, 1, 1,
0.8879887, -0.7957764, 1.704207, 0.8431373, 0, 1, 1,
0.8892992, 1.251331, 0.6385821, 0.8470588, 0, 1, 1,
0.8914701, -0.81577, 4.048071, 0.854902, 0, 1, 1,
0.891522, 1.55779, 0.4145278, 0.8588235, 0, 1, 1,
0.8916059, 0.6714883, 0.007260268, 0.8666667, 0, 1, 1,
0.8923067, 1.137419, -0.5460646, 0.8705882, 0, 1, 1,
0.8966829, -1.040443, 3.012454, 0.8784314, 0, 1, 1,
0.8998862, 0.5774828, 2.232937, 0.8823529, 0, 1, 1,
0.9042969, 0.1359458, 0.7159565, 0.8901961, 0, 1, 1,
0.905227, 0.04875903, -0.7912613, 0.8941177, 0, 1, 1,
0.9060698, -0.2022822, 0.9697138, 0.9019608, 0, 1, 1,
0.9063035, -0.7830817, 0.8239191, 0.9098039, 0, 1, 1,
0.9069744, -1.006055, 3.448449, 0.9137255, 0, 1, 1,
0.908637, 0.254419, -0.5473371, 0.9215686, 0, 1, 1,
0.9109377, 1.034642, 1.191392, 0.9254902, 0, 1, 1,
0.9117631, -0.7918039, 3.184646, 0.9333333, 0, 1, 1,
0.9123179, 0.1376081, 3.276617, 0.9372549, 0, 1, 1,
0.9127386, 0.3515533, -0.8311128, 0.945098, 0, 1, 1,
0.9156632, -1.379005, 1.639797, 0.9490196, 0, 1, 1,
0.9265383, -0.8729141, 2.410761, 0.9568627, 0, 1, 1,
0.9282321, 0.5844343, 2.312551, 0.9607843, 0, 1, 1,
0.9430597, 0.6812407, 0.08866347, 0.9686275, 0, 1, 1,
0.9433703, -0.73081, 2.51674, 0.972549, 0, 1, 1,
0.9454749, -0.1767188, 1.159672, 0.9803922, 0, 1, 1,
0.9511671, -2.11273, 3.519865, 0.9843137, 0, 1, 1,
0.9545673, 0.6853678, 0.3364421, 0.9921569, 0, 1, 1,
0.9548575, -0.2109916, 2.346966, 0.9960784, 0, 1, 1,
0.9561992, -0.7610099, 1.89019, 1, 0, 0.9960784, 1,
0.9571846, -0.8100158, 1.728787, 1, 0, 0.9882353, 1,
0.9574012, 0.8341292, -0.4774518, 1, 0, 0.9843137, 1,
0.9578515, 0.05692509, 3.084903, 1, 0, 0.9764706, 1,
0.9659457, -1.247484, 1.816708, 1, 0, 0.972549, 1,
0.966001, 2.508568, 1.494401, 1, 0, 0.9647059, 1,
0.9670468, 1.456146, 1.733832, 1, 0, 0.9607843, 1,
0.9705458, 1.343822, 0.3936342, 1, 0, 0.9529412, 1,
0.9775688, -1.926596, 3.382563, 1, 0, 0.9490196, 1,
0.9825765, -0.6607543, 1.898677, 1, 0, 0.9411765, 1,
0.9886882, 0.4131764, 1.815978, 1, 0, 0.9372549, 1,
0.9918826, -1.918093, 1.121878, 1, 0, 0.9294118, 1,
0.9933043, -0.4343133, 1.843926, 1, 0, 0.9254902, 1,
0.9949923, 0.03990988, 1.958768, 1, 0, 0.9176471, 1,
0.9967807, 0.1140985, 1.316765, 1, 0, 0.9137255, 1,
1.00215, -0.7729847, 1.446766, 1, 0, 0.9058824, 1,
1.008047, 0.01513735, 3.172726, 1, 0, 0.9019608, 1,
1.012527, 0.4108335, -0.3075372, 1, 0, 0.8941177, 1,
1.019485, 0.317961, 0.1790058, 1, 0, 0.8862745, 1,
1.03042, -0.4223608, 1.071074, 1, 0, 0.8823529, 1,
1.032376, 0.1478542, 1.62612, 1, 0, 0.8745098, 1,
1.042127, -0.02911814, 0.6964607, 1, 0, 0.8705882, 1,
1.045728, 0.8866754, 0.2077522, 1, 0, 0.8627451, 1,
1.053681, 0.4873971, 0.1446171, 1, 0, 0.8588235, 1,
1.057535, -1.499048, 4.438401, 1, 0, 0.8509804, 1,
1.061242, -0.4178242, 2.613056, 1, 0, 0.8470588, 1,
1.062144, 0.08815898, -0.3672188, 1, 0, 0.8392157, 1,
1.075112, -2.298635, 1.469273, 1, 0, 0.8352941, 1,
1.07813, 1.456545, 1.688023, 1, 0, 0.827451, 1,
1.097286, -0.1293381, 0.4022754, 1, 0, 0.8235294, 1,
1.09736, -1.130577, 4.519621, 1, 0, 0.8156863, 1,
1.098156, 2.074698, -0.7178242, 1, 0, 0.8117647, 1,
1.100798, -0.9367782, 1.747677, 1, 0, 0.8039216, 1,
1.101895, 0.4706863, 1.904673, 1, 0, 0.7960784, 1,
1.102116, -0.5667927, 3.181608, 1, 0, 0.7921569, 1,
1.109461, 0.6967698, -0.2309663, 1, 0, 0.7843137, 1,
1.114557, 0.4417962, 2.062646, 1, 0, 0.7803922, 1,
1.120367, 0.9115146, 1.156808, 1, 0, 0.772549, 1,
1.122949, -1.452263, 0.1486075, 1, 0, 0.7686275, 1,
1.131313, 0.02626837, 0.6340804, 1, 0, 0.7607843, 1,
1.137972, -0.04780223, 3.658599, 1, 0, 0.7568628, 1,
1.14523, 1.331185, 1.447336, 1, 0, 0.7490196, 1,
1.148664, -1.155117, 2.320835, 1, 0, 0.7450981, 1,
1.154793, 1.614647, 0.2032477, 1, 0, 0.7372549, 1,
1.158846, -0.1175741, 1.656049, 1, 0, 0.7333333, 1,
1.162863, -0.03492181, 1.708522, 1, 0, 0.7254902, 1,
1.165973, 0.7535371, 0.6548813, 1, 0, 0.7215686, 1,
1.16891, 1.166123, 0.09425819, 1, 0, 0.7137255, 1,
1.172223, -1.53734, 2.461818, 1, 0, 0.7098039, 1,
1.172916, 0.8201755, 1.586919, 1, 0, 0.7019608, 1,
1.197937, 0.8825588, 0.3375006, 1, 0, 0.6941177, 1,
1.201501, 0.6987253, 0.7897555, 1, 0, 0.6901961, 1,
1.203924, 0.6369078, -0.01800414, 1, 0, 0.682353, 1,
1.207061, 0.8962569, 0.004998716, 1, 0, 0.6784314, 1,
1.235503, -0.3808703, 0.4531879, 1, 0, 0.6705883, 1,
1.241547, 0.07016503, 2.127596, 1, 0, 0.6666667, 1,
1.255796, 0.6121519, 0.3419327, 1, 0, 0.6588235, 1,
1.262241, 0.6322547, 1.962134, 1, 0, 0.654902, 1,
1.264928, 0.04758196, 3.154589, 1, 0, 0.6470588, 1,
1.271326, 0.1719592, 2.637736, 1, 0, 0.6431373, 1,
1.278237, 0.5490155, 1.769264, 1, 0, 0.6352941, 1,
1.280096, 0.05040852, 2.612465, 1, 0, 0.6313726, 1,
1.281532, -0.5577499, 1.173861, 1, 0, 0.6235294, 1,
1.281544, 0.2609785, 1.750649, 1, 0, 0.6196079, 1,
1.28494, 2.351375, -0.3585023, 1, 0, 0.6117647, 1,
1.288677, -0.5256417, 1.930267, 1, 0, 0.6078432, 1,
1.288966, 1.102765, 2.438675, 1, 0, 0.6, 1,
1.295887, 1.90033, 0.1640989, 1, 0, 0.5921569, 1,
1.302993, 1.501508, 0.109262, 1, 0, 0.5882353, 1,
1.303936, 0.1187044, 0.6280711, 1, 0, 0.5803922, 1,
1.304478, -0.002481181, 1.37698, 1, 0, 0.5764706, 1,
1.305221, 0.489107, 0.9126442, 1, 0, 0.5686275, 1,
1.322202, 0.215383, 1.781971, 1, 0, 0.5647059, 1,
1.32374, 0.2913572, 3.098215, 1, 0, 0.5568628, 1,
1.336308, -0.2936039, 0.66971, 1, 0, 0.5529412, 1,
1.33701, 0.4776467, 1.600209, 1, 0, 0.5450981, 1,
1.345281, -1.633805, 1.702033, 1, 0, 0.5411765, 1,
1.351429, 1.872442, -1.137387, 1, 0, 0.5333334, 1,
1.364741, 0.1722456, 1.435629, 1, 0, 0.5294118, 1,
1.368674, -1.731546, 2.830338, 1, 0, 0.5215687, 1,
1.38586, -0.2332387, 1.157572, 1, 0, 0.5176471, 1,
1.393371, 0.1435212, 0.2794964, 1, 0, 0.509804, 1,
1.393883, 0.7859322, 3.094536, 1, 0, 0.5058824, 1,
1.396785, 0.8038874, 1.205889, 1, 0, 0.4980392, 1,
1.397288, -0.2177563, 3.229629, 1, 0, 0.4901961, 1,
1.398554, 1.171095, -1.969893, 1, 0, 0.4862745, 1,
1.403002, -1.355737, 2.241627, 1, 0, 0.4784314, 1,
1.403222, -0.1978502, 0.4453534, 1, 0, 0.4745098, 1,
1.404218, -1.222061, 4.005646, 1, 0, 0.4666667, 1,
1.407632, -0.7097617, 1.542204, 1, 0, 0.4627451, 1,
1.412613, 0.95363, 1.10836, 1, 0, 0.454902, 1,
1.421124, 0.7410095, 1.205513, 1, 0, 0.4509804, 1,
1.424522, -0.05176572, 2.874243, 1, 0, 0.4431373, 1,
1.42465, 0.2063732, 1.567172, 1, 0, 0.4392157, 1,
1.42714, 0.2985972, 1.512716, 1, 0, 0.4313726, 1,
1.443419, 0.5248145, 0.3213815, 1, 0, 0.427451, 1,
1.443585, -0.3267892, 1.512566, 1, 0, 0.4196078, 1,
1.447817, -0.5313377, 2.082702, 1, 0, 0.4156863, 1,
1.451909, -0.697603, 0.7446955, 1, 0, 0.4078431, 1,
1.457344, -0.7278442, 3.023834, 1, 0, 0.4039216, 1,
1.466572, 0.2914781, 0.9793586, 1, 0, 0.3960784, 1,
1.46778, 0.05101492, 0.8887303, 1, 0, 0.3882353, 1,
1.470838, 0.4386888, 0.86949, 1, 0, 0.3843137, 1,
1.481062, -0.5567645, 2.911375, 1, 0, 0.3764706, 1,
1.492453, -1.19776, 1.406962, 1, 0, 0.372549, 1,
1.499559, 0.4344144, 0.5184119, 1, 0, 0.3647059, 1,
1.50751, -1.191572, 1.34716, 1, 0, 0.3607843, 1,
1.508091, -1.291998, 4.068902, 1, 0, 0.3529412, 1,
1.523485, -0.1896399, 2.610924, 1, 0, 0.3490196, 1,
1.531731, -0.2449517, 1.402176, 1, 0, 0.3411765, 1,
1.537193, -0.307739, 2.838518, 1, 0, 0.3372549, 1,
1.539753, 0.06626117, 2.47003, 1, 0, 0.3294118, 1,
1.544633, 0.778958, 3.869116, 1, 0, 0.3254902, 1,
1.552465, 0.8676426, 1.344385, 1, 0, 0.3176471, 1,
1.573983, -0.7538188, 2.744692, 1, 0, 0.3137255, 1,
1.579022, 0.9462835, 0.6037979, 1, 0, 0.3058824, 1,
1.592312, -1.289639, 3.660558, 1, 0, 0.2980392, 1,
1.595266, -0.8950068, 1.784069, 1, 0, 0.2941177, 1,
1.602735, 1.582838, 0.03069254, 1, 0, 0.2862745, 1,
1.606577, -0.6815384, 1.098339, 1, 0, 0.282353, 1,
1.648867, 1.25472, 1.195706, 1, 0, 0.2745098, 1,
1.652617, 1.262018, 0.6792517, 1, 0, 0.2705882, 1,
1.655535, 1.200825, 0.3737178, 1, 0, 0.2627451, 1,
1.664587, -0.5393801, 1.941744, 1, 0, 0.2588235, 1,
1.671443, 1.951021, 1.747363, 1, 0, 0.2509804, 1,
1.699318, 0.6452947, 1.930223, 1, 0, 0.2470588, 1,
1.744061, -0.7226666, 0.7409245, 1, 0, 0.2392157, 1,
1.785087, -1.5034, 2.144454, 1, 0, 0.2352941, 1,
1.793074, 0.3204513, 0.4432156, 1, 0, 0.227451, 1,
1.794671, 0.3360333, 2.404613, 1, 0, 0.2235294, 1,
1.802662, 0.04030331, 2.484552, 1, 0, 0.2156863, 1,
1.805107, 1.128206, 0.09101121, 1, 0, 0.2117647, 1,
1.809782, 0.8552235, 1.734213, 1, 0, 0.2039216, 1,
1.837723, 1.148179, 1.770411, 1, 0, 0.1960784, 1,
1.839404, -0.7103331, 2.717616, 1, 0, 0.1921569, 1,
1.847147, -0.2538363, 2.013078, 1, 0, 0.1843137, 1,
1.850869, 1.089929, 0.8423756, 1, 0, 0.1803922, 1,
1.865216, -0.06177155, 2.365203, 1, 0, 0.172549, 1,
1.872839, -0.1918732, 2.24789, 1, 0, 0.1686275, 1,
1.882841, -3.211955, 1.408368, 1, 0, 0.1607843, 1,
1.886956, -0.1841216, 0.4195667, 1, 0, 0.1568628, 1,
1.967226, 0.88759, 1.307389, 1, 0, 0.1490196, 1,
1.979447, -1.508662, 2.374157, 1, 0, 0.145098, 1,
1.991534, -1.440463, 3.093958, 1, 0, 0.1372549, 1,
2.010534, 0.3840207, 2.479969, 1, 0, 0.1333333, 1,
2.020609, -0.07081483, 0.3470719, 1, 0, 0.1254902, 1,
2.033656, -0.5685553, 2.950639, 1, 0, 0.1215686, 1,
2.038547, 0.3246914, 1.910976, 1, 0, 0.1137255, 1,
2.071107, -1.624953, 1.203874, 1, 0, 0.1098039, 1,
2.123591, -0.6335472, 1.799367, 1, 0, 0.1019608, 1,
2.138446, -1.926963, 2.588873, 1, 0, 0.09411765, 1,
2.192139, 0.7047276, -1.035562, 1, 0, 0.09019608, 1,
2.262601, 0.2054724, 0.08752712, 1, 0, 0.08235294, 1,
2.31919, 1.404447, 0.01041082, 1, 0, 0.07843138, 1,
2.367858, -1.18364, 2.265119, 1, 0, 0.07058824, 1,
2.4066, 0.0588047, 1.840482, 1, 0, 0.06666667, 1,
2.44626, -0.7688468, 2.213109, 1, 0, 0.05882353, 1,
2.486537, -1.223338, 3.467215, 1, 0, 0.05490196, 1,
2.511604, 1.298329, 0.8757548, 1, 0, 0.04705882, 1,
2.558304, -0.348264, 0.4836855, 1, 0, 0.04313726, 1,
2.615165, -0.6111972, 2.126675, 1, 0, 0.03529412, 1,
2.639916, -1.190625, 3.013328, 1, 0, 0.03137255, 1,
2.768395, -0.9726414, 2.914429, 1, 0, 0.02352941, 1,
2.810857, -1.800853, 1.975177, 1, 0, 0.01960784, 1,
2.881064, 2.077296, 2.428932, 1, 0, 0.01176471, 1,
3.347271, 0.7364098, 0.04783832, 1, 0, 0.007843138, 1
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
-0.04459131, -5.058248, -8.537562, 0, -0.5, 0.5, 0.5,
-0.04459131, -5.058248, -8.537562, 1, -0.5, 0.5, 0.5,
-0.04459131, -5.058248, -8.537562, 1, 1.5, 0.5, 0.5,
-0.04459131, -5.058248, -8.537562, 0, 1.5, 0.5, 0.5
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
-4.586296, -0.308457, -8.537562, 0, -0.5, 0.5, 0.5,
-4.586296, -0.308457, -8.537562, 1, -0.5, 0.5, 0.5,
-4.586296, -0.308457, -8.537562, 1, 1.5, 0.5, 0.5,
-4.586296, -0.308457, -8.537562, 0, 1.5, 0.5, 0.5
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
-4.586296, -5.058248, -0.1239829, 0, -0.5, 0.5, 0.5,
-4.586296, -5.058248, -0.1239829, 1, -0.5, 0.5, 0.5,
-4.586296, -5.058248, -0.1239829, 1, 1.5, 0.5, 0.5,
-4.586296, -5.058248, -0.1239829, 0, 1.5, 0.5, 0.5
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
-3, -3.962143, -6.595967,
3, -3.962143, -6.595967,
-3, -3.962143, -6.595967,
-3, -4.144827, -6.919566,
-2, -3.962143, -6.595967,
-2, -4.144827, -6.919566,
-1, -3.962143, -6.595967,
-1, -4.144827, -6.919566,
0, -3.962143, -6.595967,
0, -4.144827, -6.919566,
1, -3.962143, -6.595967,
1, -4.144827, -6.919566,
2, -3.962143, -6.595967,
2, -4.144827, -6.919566,
3, -3.962143, -6.595967,
3, -4.144827, -6.919566
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
-3, -4.510195, -7.566765, 0, -0.5, 0.5, 0.5,
-3, -4.510195, -7.566765, 1, -0.5, 0.5, 0.5,
-3, -4.510195, -7.566765, 1, 1.5, 0.5, 0.5,
-3, -4.510195, -7.566765, 0, 1.5, 0.5, 0.5,
-2, -4.510195, -7.566765, 0, -0.5, 0.5, 0.5,
-2, -4.510195, -7.566765, 1, -0.5, 0.5, 0.5,
-2, -4.510195, -7.566765, 1, 1.5, 0.5, 0.5,
-2, -4.510195, -7.566765, 0, 1.5, 0.5, 0.5,
-1, -4.510195, -7.566765, 0, -0.5, 0.5, 0.5,
-1, -4.510195, -7.566765, 1, -0.5, 0.5, 0.5,
-1, -4.510195, -7.566765, 1, 1.5, 0.5, 0.5,
-1, -4.510195, -7.566765, 0, 1.5, 0.5, 0.5,
0, -4.510195, -7.566765, 0, -0.5, 0.5, 0.5,
0, -4.510195, -7.566765, 1, -0.5, 0.5, 0.5,
0, -4.510195, -7.566765, 1, 1.5, 0.5, 0.5,
0, -4.510195, -7.566765, 0, 1.5, 0.5, 0.5,
1, -4.510195, -7.566765, 0, -0.5, 0.5, 0.5,
1, -4.510195, -7.566765, 1, -0.5, 0.5, 0.5,
1, -4.510195, -7.566765, 1, 1.5, 0.5, 0.5,
1, -4.510195, -7.566765, 0, 1.5, 0.5, 0.5,
2, -4.510195, -7.566765, 0, -0.5, 0.5, 0.5,
2, -4.510195, -7.566765, 1, -0.5, 0.5, 0.5,
2, -4.510195, -7.566765, 1, 1.5, 0.5, 0.5,
2, -4.510195, -7.566765, 0, 1.5, 0.5, 0.5,
3, -4.510195, -7.566765, 0, -0.5, 0.5, 0.5,
3, -4.510195, -7.566765, 1, -0.5, 0.5, 0.5,
3, -4.510195, -7.566765, 1, 1.5, 0.5, 0.5,
3, -4.510195, -7.566765, 0, 1.5, 0.5, 0.5
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
-3.53821, -2, -6.595967,
-3.53821, 2, -6.595967,
-3.53821, -2, -6.595967,
-3.712891, -2, -6.919566,
-3.53821, 0, -6.595967,
-3.712891, 0, -6.919566,
-3.53821, 2, -6.595967,
-3.712891, 2, -6.919566
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
"0",
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
-4.062253, -2, -7.566765, 0, -0.5, 0.5, 0.5,
-4.062253, -2, -7.566765, 1, -0.5, 0.5, 0.5,
-4.062253, -2, -7.566765, 1, 1.5, 0.5, 0.5,
-4.062253, -2, -7.566765, 0, 1.5, 0.5, 0.5,
-4.062253, 0, -7.566765, 0, -0.5, 0.5, 0.5,
-4.062253, 0, -7.566765, 1, -0.5, 0.5, 0.5,
-4.062253, 0, -7.566765, 1, 1.5, 0.5, 0.5,
-4.062253, 0, -7.566765, 0, 1.5, 0.5, 0.5,
-4.062253, 2, -7.566765, 0, -0.5, 0.5, 0.5,
-4.062253, 2, -7.566765, 1, -0.5, 0.5, 0.5,
-4.062253, 2, -7.566765, 1, 1.5, 0.5, 0.5,
-4.062253, 2, -7.566765, 0, 1.5, 0.5, 0.5
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
-3.53821, -3.962143, -6,
-3.53821, -3.962143, 6,
-3.53821, -3.962143, -6,
-3.712891, -4.144827, -6,
-3.53821, -3.962143, -4,
-3.712891, -4.144827, -4,
-3.53821, -3.962143, -2,
-3.712891, -4.144827, -2,
-3.53821, -3.962143, 0,
-3.712891, -4.144827, 0,
-3.53821, -3.962143, 2,
-3.712891, -4.144827, 2,
-3.53821, -3.962143, 4,
-3.712891, -4.144827, 4,
-3.53821, -3.962143, 6,
-3.712891, -4.144827, 6
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
"-6",
"-4",
"-2",
"0",
"2",
"4",
"6"
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
-4.062253, -4.510195, -6, 0, -0.5, 0.5, 0.5,
-4.062253, -4.510195, -6, 1, -0.5, 0.5, 0.5,
-4.062253, -4.510195, -6, 1, 1.5, 0.5, 0.5,
-4.062253, -4.510195, -6, 0, 1.5, 0.5, 0.5,
-4.062253, -4.510195, -4, 0, -0.5, 0.5, 0.5,
-4.062253, -4.510195, -4, 1, -0.5, 0.5, 0.5,
-4.062253, -4.510195, -4, 1, 1.5, 0.5, 0.5,
-4.062253, -4.510195, -4, 0, 1.5, 0.5, 0.5,
-4.062253, -4.510195, -2, 0, -0.5, 0.5, 0.5,
-4.062253, -4.510195, -2, 1, -0.5, 0.5, 0.5,
-4.062253, -4.510195, -2, 1, 1.5, 0.5, 0.5,
-4.062253, -4.510195, -2, 0, 1.5, 0.5, 0.5,
-4.062253, -4.510195, 0, 0, -0.5, 0.5, 0.5,
-4.062253, -4.510195, 0, 1, -0.5, 0.5, 0.5,
-4.062253, -4.510195, 0, 1, 1.5, 0.5, 0.5,
-4.062253, -4.510195, 0, 0, 1.5, 0.5, 0.5,
-4.062253, -4.510195, 2, 0, -0.5, 0.5, 0.5,
-4.062253, -4.510195, 2, 1, -0.5, 0.5, 0.5,
-4.062253, -4.510195, 2, 1, 1.5, 0.5, 0.5,
-4.062253, -4.510195, 2, 0, 1.5, 0.5, 0.5,
-4.062253, -4.510195, 4, 0, -0.5, 0.5, 0.5,
-4.062253, -4.510195, 4, 1, -0.5, 0.5, 0.5,
-4.062253, -4.510195, 4, 1, 1.5, 0.5, 0.5,
-4.062253, -4.510195, 4, 0, 1.5, 0.5, 0.5,
-4.062253, -4.510195, 6, 0, -0.5, 0.5, 0.5,
-4.062253, -4.510195, 6, 1, -0.5, 0.5, 0.5,
-4.062253, -4.510195, 6, 1, 1.5, 0.5, 0.5,
-4.062253, -4.510195, 6, 0, 1.5, 0.5, 0.5
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
-3.53821, -3.962143, -6.595967,
-3.53821, 3.345229, -6.595967,
-3.53821, -3.962143, 6.348001,
-3.53821, 3.345229, 6.348001,
-3.53821, -3.962143, -6.595967,
-3.53821, -3.962143, 6.348001,
-3.53821, 3.345229, -6.595967,
-3.53821, 3.345229, 6.348001,
-3.53821, -3.962143, -6.595967,
3.449027, -3.962143, -6.595967,
-3.53821, -3.962143, 6.348001,
3.449027, -3.962143, 6.348001,
-3.53821, 3.345229, -6.595967,
3.449027, 3.345229, -6.595967,
-3.53821, 3.345229, 6.348001,
3.449027, 3.345229, 6.348001,
3.449027, -3.962143, -6.595967,
3.449027, 3.345229, -6.595967,
3.449027, -3.962143, 6.348001,
3.449027, 3.345229, 6.348001,
3.449027, -3.962143, -6.595967,
3.449027, -3.962143, 6.348001,
3.449027, 3.345229, -6.595967,
3.449027, 3.345229, 6.348001
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
var radius = 8.770385;
var distance = 39.02043;
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
mvMatrix.translate( 0.04459131, 0.308457, 0.1239829 );
mvMatrix.scale( 1.357148, 1.297691, 0.732597 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -39.02043);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
ammonium_sulfamate<-read.table("ammonium_sulfamate.xyz")
```

```
## Error in read.table("ammonium_sulfamate.xyz"): no lines available in input
```

```r
x<-ammonium_sulfamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamate' not found
```

```r
y<-ammonium_sulfamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamate' not found
```

```r
z<-ammonium_sulfamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamate' not found
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
-3.436454, 1.28852, -1.748282, 0, 0, 1, 1, 1,
-3.18355, -0.1565153, 0.2422578, 1, 0, 0, 1, 1,
-3.025078, -0.4806895, -2.004802, 1, 0, 0, 1, 1,
-2.920455, -0.9220037, -2.093817, 1, 0, 0, 1, 1,
-2.88598, 1.00271, -1.200659, 1, 0, 0, 1, 1,
-2.466917, -1.578851, -2.4267, 1, 0, 0, 1, 1,
-2.442747, 0.7675405, -0.9044738, 0, 0, 0, 1, 1,
-2.438204, 2.252537, -3.247401, 0, 0, 0, 1, 1,
-2.383361, -0.4623561, -2.129086, 0, 0, 0, 1, 1,
-2.382472, 1.792549, -0.847595, 0, 0, 0, 1, 1,
-2.301477, -2.204278, -2.998045, 0, 0, 0, 1, 1,
-2.249115, -0.4621181, -2.195496, 0, 0, 0, 1, 1,
-2.245086, -1.890426, -2.527032, 0, 0, 0, 1, 1,
-2.189168, -0.5734787, -1.429298, 1, 1, 1, 1, 1,
-2.107497, 1.478309, -3.251698, 1, 1, 1, 1, 1,
-2.098783, 0.4117485, -1.091889, 1, 1, 1, 1, 1,
-2.088185, 1.020301, -2.280107, 1, 1, 1, 1, 1,
-2.080585, 0.3576776, -3.493877, 1, 1, 1, 1, 1,
-2.047894, 0.4447204, -0.3698128, 1, 1, 1, 1, 1,
-2.028567, -0.0248296, -0.1011174, 1, 1, 1, 1, 1,
-2.001139, 0.8517821, -1.013822, 1, 1, 1, 1, 1,
-1.943369, 0.6483268, -1.513747, 1, 1, 1, 1, 1,
-1.933561, 1.064915, -1.879629, 1, 1, 1, 1, 1,
-1.925366, 0.2965041, -2.704915, 1, 1, 1, 1, 1,
-1.900883, -1.261294, -1.360887, 1, 1, 1, 1, 1,
-1.858732, -0.8000193, -3.323114, 1, 1, 1, 1, 1,
-1.856615, 1.251083, 0.2430483, 1, 1, 1, 1, 1,
-1.803916, 0.7649499, -1.180541, 1, 1, 1, 1, 1,
-1.799813, -0.7457151, -2.77248, 0, 0, 1, 1, 1,
-1.797824, -0.1631544, 0.5695281, 1, 0, 0, 1, 1,
-1.791919, -0.02470913, -2.927202, 1, 0, 0, 1, 1,
-1.774059, -0.7094764, 0.6811855, 1, 0, 0, 1, 1,
-1.762753, -0.1646262, -2.454816, 1, 0, 0, 1, 1,
-1.753298, 0.9436949, -2.030715, 1, 0, 0, 1, 1,
-1.725195, 0.6924107, -0.9991387, 0, 0, 0, 1, 1,
-1.69239, -0.5111566, 0.0267208, 0, 0, 0, 1, 1,
-1.67788, -0.4759162, -1.239121, 0, 0, 0, 1, 1,
-1.668979, -0.5176021, -0.4994667, 0, 0, 0, 1, 1,
-1.655388, 1.351158, -0.3066081, 0, 0, 0, 1, 1,
-1.653213, -0.3434404, -3.793108, 0, 0, 0, 1, 1,
-1.649635, -0.459255, -1.58475, 0, 0, 0, 1, 1,
-1.646994, 0.1934343, -2.299715, 1, 1, 1, 1, 1,
-1.646722, 1.686884, -1.320374, 1, 1, 1, 1, 1,
-1.643865, 2.391428, -0.4439576, 1, 1, 1, 1, 1,
-1.632067, 1.353987, -0.8791243, 1, 1, 1, 1, 1,
-1.61975, 0.6560615, -0.09772899, 1, 1, 1, 1, 1,
-1.615791, 0.7325289, -1.235686, 1, 1, 1, 1, 1,
-1.612254, 1.756836, 0.7670981, 1, 1, 1, 1, 1,
-1.598696, 0.1987024, -1.212982, 1, 1, 1, 1, 1,
-1.589787, 1.208934, 0.5215011, 1, 1, 1, 1, 1,
-1.572958, -0.31672, -1.595308, 1, 1, 1, 1, 1,
-1.570274, -1.165615, -2.6747, 1, 1, 1, 1, 1,
-1.562375, -0.1444889, -2.451758, 1, 1, 1, 1, 1,
-1.549174, -0.6047435, -1.862522, 1, 1, 1, 1, 1,
-1.534818, 0.07466879, -2.425061, 1, 1, 1, 1, 1,
-1.524729, 0.2764989, -0.9456661, 1, 1, 1, 1, 1,
-1.504573, -0.12701, -2.121212, 0, 0, 1, 1, 1,
-1.500714, -0.3988447, -1.598364, 1, 0, 0, 1, 1,
-1.489913, 0.5152759, -2.192137, 1, 0, 0, 1, 1,
-1.48866, -1.289837, -1.69455, 1, 0, 0, 1, 1,
-1.470324, -0.03751473, -1.842471, 1, 0, 0, 1, 1,
-1.468539, -0.2186175, -2.328778, 1, 0, 0, 1, 1,
-1.462357, -0.8379909, -1.18732, 0, 0, 0, 1, 1,
-1.459338, 0.3462636, -0.9418656, 0, 0, 0, 1, 1,
-1.459073, -0.7846829, -2.089117, 0, 0, 0, 1, 1,
-1.454731, 0.5779704, -2.469569, 0, 0, 0, 1, 1,
-1.440713, 0.5705988, -2.801906, 0, 0, 0, 1, 1,
-1.440464, -0.4178841, -1.642585, 0, 0, 0, 1, 1,
-1.439744, -0.414849, -0.5297108, 0, 0, 0, 1, 1,
-1.423059, 1.928333, -1.952557, 1, 1, 1, 1, 1,
-1.420349, -0.4027875, -3.763366, 1, 1, 1, 1, 1,
-1.4106, 0.3302274, -1.629409, 1, 1, 1, 1, 1,
-1.41043, -1.049038, -1.907252, 1, 1, 1, 1, 1,
-1.404368, -0.5520713, -1.527281, 1, 1, 1, 1, 1,
-1.401167, -1.403095, -1.743665, 1, 1, 1, 1, 1,
-1.400497, 0.3472356, -2.477244, 1, 1, 1, 1, 1,
-1.398172, 1.035118, -1.220472, 1, 1, 1, 1, 1,
-1.397308, -1.288555, -0.8969, 1, 1, 1, 1, 1,
-1.389012, 1.84929, -0.2750339, 1, 1, 1, 1, 1,
-1.372024, -1.183647, -1.980211, 1, 1, 1, 1, 1,
-1.367366, 0.1506469, -1.67737, 1, 1, 1, 1, 1,
-1.366583, 1.376133, -1.771434, 1, 1, 1, 1, 1,
-1.36443, 1.361316, 0.4518655, 1, 1, 1, 1, 1,
-1.356565, 0.3529377, 0.5649457, 1, 1, 1, 1, 1,
-1.356403, 1.065921, -0.5294109, 0, 0, 1, 1, 1,
-1.345879, -0.3037148, -1.503289, 1, 0, 0, 1, 1,
-1.344254, 2.841955, -1.133553, 1, 0, 0, 1, 1,
-1.342167, 0.4064693, 0.4511734, 1, 0, 0, 1, 1,
-1.34144, -1.899673, -2.355664, 1, 0, 0, 1, 1,
-1.33949, 0.5849336, -1.62542, 1, 0, 0, 1, 1,
-1.329032, 0.8365474, 1.684804, 0, 0, 0, 1, 1,
-1.327104, 0.7269909, -0.7696356, 0, 0, 0, 1, 1,
-1.321305, 0.5997508, -1.627815, 0, 0, 0, 1, 1,
-1.320531, 0.8031935, 0.1654368, 0, 0, 0, 1, 1,
-1.313038, 0.3705164, -0.9548919, 0, 0, 0, 1, 1,
-1.304057, -0.2986136, -3.091351, 0, 0, 0, 1, 1,
-1.299792, -0.09616703, -0.3237407, 0, 0, 0, 1, 1,
-1.299287, 1.856064, -0.9439898, 1, 1, 1, 1, 1,
-1.296524, -0.4012661, -0.840726, 1, 1, 1, 1, 1,
-1.293684, -0.2018249, -1.272925, 1, 1, 1, 1, 1,
-1.288543, 1.192773, 0.02154572, 1, 1, 1, 1, 1,
-1.284808, 0.1213229, -2.194566, 1, 1, 1, 1, 1,
-1.279375, -0.1516567, -0.6297587, 1, 1, 1, 1, 1,
-1.273843, -0.5044502, -1.888199, 1, 1, 1, 1, 1,
-1.251471, 0.543631, -0.3911774, 1, 1, 1, 1, 1,
-1.249358, -0.6375582, -2.490727, 1, 1, 1, 1, 1,
-1.238732, -0.3960039, -1.037531, 1, 1, 1, 1, 1,
-1.232855, 0.981793, -1.664289, 1, 1, 1, 1, 1,
-1.232847, 0.001954501, -0.9086026, 1, 1, 1, 1, 1,
-1.232082, 0.4760641, -0.9187192, 1, 1, 1, 1, 1,
-1.226847, 2.235321, 0.459626, 1, 1, 1, 1, 1,
-1.226665, 0.5430179, -1.131307, 1, 1, 1, 1, 1,
-1.222153, -0.8376216, -2.013424, 0, 0, 1, 1, 1,
-1.220002, 0.272518, -0.7467154, 1, 0, 0, 1, 1,
-1.21997, -0.8682081, -0.643702, 1, 0, 0, 1, 1,
-1.218878, -1.009875, -3.065355, 1, 0, 0, 1, 1,
-1.215855, -7.816027e-05, 0.8407506, 1, 0, 0, 1, 1,
-1.213146, 0.8416821, -1.167974, 1, 0, 0, 1, 1,
-1.199409, -0.8491984, 0.4748918, 0, 0, 0, 1, 1,
-1.183407, 1.159858, -1.199262, 0, 0, 0, 1, 1,
-1.1809, 0.2608837, -1.571369, 0, 0, 0, 1, 1,
-1.16984, 0.2203398, -1.942078, 0, 0, 0, 1, 1,
-1.168975, 0.04360548, -1.230315, 0, 0, 0, 1, 1,
-1.164186, 0.1437946, -1.473071, 0, 0, 0, 1, 1,
-1.16276, -0.07214922, -0.2221263, 0, 0, 0, 1, 1,
-1.148893, -1.418628, -2.455332, 1, 1, 1, 1, 1,
-1.147509, -1.710326, -3.185543, 1, 1, 1, 1, 1,
-1.147494, -2.654629, -2.068264, 1, 1, 1, 1, 1,
-1.146916, -0.02607228, -0.7940498, 1, 1, 1, 1, 1,
-1.143292, -0.5108749, -2.818073, 1, 1, 1, 1, 1,
-1.135483, 0.5276465, -0.9713521, 1, 1, 1, 1, 1,
-1.13101, -0.2678317, -0.8737996, 1, 1, 1, 1, 1,
-1.130527, 2.235413, -1.732624, 1, 1, 1, 1, 1,
-1.126049, -0.775242, -1.992682, 1, 1, 1, 1, 1,
-1.125314, -2.217706, -4.340257, 1, 1, 1, 1, 1,
-1.120709, 0.06440752, -0.9119118, 1, 1, 1, 1, 1,
-1.112093, 0.3044338, -3.093213, 1, 1, 1, 1, 1,
-1.106456, 0.9214619, -1.269757, 1, 1, 1, 1, 1,
-1.0963, 1.103973, -1.545942, 1, 1, 1, 1, 1,
-1.089653, -0.4608642, -2.524295, 1, 1, 1, 1, 1,
-1.080218, 0.8306065, -1.210139, 0, 0, 1, 1, 1,
-1.07734, 0.256164, -2.024145, 1, 0, 0, 1, 1,
-1.069993, 2.512532, -1.37575, 1, 0, 0, 1, 1,
-1.064442, -0.2595607, -1.56323, 1, 0, 0, 1, 1,
-1.063763, -0.09566417, -3.162153, 1, 0, 0, 1, 1,
-1.050159, 0.7577249, -3.138768, 1, 0, 0, 1, 1,
-1.049636, -1.389178, -2.540726, 0, 0, 0, 1, 1,
-1.048606, -1.036489, -3.660647, 0, 0, 0, 1, 1,
-1.039031, -1.662366, -3.642799, 0, 0, 0, 1, 1,
-1.038886, 1.321517, -1.297387, 0, 0, 0, 1, 1,
-1.036749, -1.235567, -2.352067, 0, 0, 0, 1, 1,
-1.036193, 0.6152075, 0.122608, 0, 0, 0, 1, 1,
-1.035891, -0.3815254, -2.141123, 0, 0, 0, 1, 1,
-1.026575, 0.9543675, -1.938621, 1, 1, 1, 1, 1,
-1.021411, -0.3383385, -1.628396, 1, 1, 1, 1, 1,
-1.019646, 0.729445, -0.8525555, 1, 1, 1, 1, 1,
-1.015539, -1.577599, -2.016201, 1, 1, 1, 1, 1,
-1.013737, 0.4516108, -0.5450426, 1, 1, 1, 1, 1,
-1.013732, 1.422005, -1.655631, 1, 1, 1, 1, 1,
-1.013656, -2.150947, -2.081669, 1, 1, 1, 1, 1,
-0.9967014, 0.3502693, -1.800954, 1, 1, 1, 1, 1,
-0.9948153, 0.9918553, -2.010238, 1, 1, 1, 1, 1,
-0.9947461, 0.6436324, -0.2292127, 1, 1, 1, 1, 1,
-0.9924762, 0.1976653, -0.9399632, 1, 1, 1, 1, 1,
-0.9924573, -0.5801736, -2.874697, 1, 1, 1, 1, 1,
-0.9878235, -1.954257, -4.4956, 1, 1, 1, 1, 1,
-0.9842511, -0.1659983, -0.6552106, 1, 1, 1, 1, 1,
-0.9827743, 0.6277426, -0.07141816, 1, 1, 1, 1, 1,
-0.9690062, -1.138534, -0.6141616, 0, 0, 1, 1, 1,
-0.9683097, -0.2195731, -1.950541, 1, 0, 0, 1, 1,
-0.9651168, 1.349706, 0.714309, 1, 0, 0, 1, 1,
-0.9612951, 0.5065966, -2.796811, 1, 0, 0, 1, 1,
-0.9596987, 0.6037934, -0.5884327, 1, 0, 0, 1, 1,
-0.9556168, 0.6018801, -1.125173, 1, 0, 0, 1, 1,
-0.9444647, -0.5233395, -2.33797, 0, 0, 0, 1, 1,
-0.9434519, -0.4766091, -2.304647, 0, 0, 0, 1, 1,
-0.9434482, -0.5491166, -2.296964, 0, 0, 0, 1, 1,
-0.9375213, 0.4681611, 0.1087009, 0, 0, 0, 1, 1,
-0.9251879, 0.8561081, -1.90691, 0, 0, 0, 1, 1,
-0.9236452, -1.02229, -3.78204, 0, 0, 0, 1, 1,
-0.9223421, -0.1028544, -2.698722, 0, 0, 0, 1, 1,
-0.9214885, -0.6157754, -2.820993, 1, 1, 1, 1, 1,
-0.9192764, -1.05258, -4.064884, 1, 1, 1, 1, 1,
-0.9129176, 0.1009705, -1.029554, 1, 1, 1, 1, 1,
-0.9066661, -1.469049, -3.852108, 1, 1, 1, 1, 1,
-0.9010196, -0.8252817, -3.355124, 1, 1, 1, 1, 1,
-0.9004059, 0.8705152, 0.5395365, 1, 1, 1, 1, 1,
-0.8987098, 0.5286843, -1.676352, 1, 1, 1, 1, 1,
-0.8973858, -2.517536, -3.144739, 1, 1, 1, 1, 1,
-0.8961748, 0.8064395, 0.1334056, 1, 1, 1, 1, 1,
-0.8931827, -0.7596038, -2.49121, 1, 1, 1, 1, 1,
-0.8905113, -0.2734352, -1.160258, 1, 1, 1, 1, 1,
-0.8902372, -0.6152219, -2.184032, 1, 1, 1, 1, 1,
-0.8880005, 0.03406663, -2.350374, 1, 1, 1, 1, 1,
-0.8817618, 0.9107978, -1.454261, 1, 1, 1, 1, 1,
-0.880739, -0.5736758, -2.810991, 1, 1, 1, 1, 1,
-0.8773182, -0.08787815, -2.374003, 0, 0, 1, 1, 1,
-0.8715355, 2.508555, -2.022069, 1, 0, 0, 1, 1,
-0.8710431, -1.061876, -2.912318, 1, 0, 0, 1, 1,
-0.8636356, -0.3505474, -0.8445005, 1, 0, 0, 1, 1,
-0.860669, -0.3759185, -1.857151, 1, 0, 0, 1, 1,
-0.858997, -1.242208, -1.68673, 1, 0, 0, 1, 1,
-0.8571418, 0.3889157, 1.0114, 0, 0, 0, 1, 1,
-0.8528623, 0.5779842, -0.6600414, 0, 0, 0, 1, 1,
-0.8481669, -0.03890705, -1.451517, 0, 0, 0, 1, 1,
-0.8395833, 0.3752084, -0.788016, 0, 0, 0, 1, 1,
-0.8366362, -0.5668835, -2.420831, 0, 0, 0, 1, 1,
-0.8351067, 1.268447, -2.166748, 0, 0, 0, 1, 1,
-0.8313359, -0.05282426, -0.2848947, 0, 0, 0, 1, 1,
-0.8278987, 0.2082807, -1.392101, 1, 1, 1, 1, 1,
-0.8262123, 2.04226, 0.8847886, 1, 1, 1, 1, 1,
-0.8132703, 0.1265955, -1.63131, 1, 1, 1, 1, 1,
-0.8102157, -0.6802315, -2.455825, 1, 1, 1, 1, 1,
-0.8093445, 0.1727307, -1.571829, 1, 1, 1, 1, 1,
-0.8034422, -0.5724415, -1.72408, 1, 1, 1, 1, 1,
-0.798157, -2.155521, -2.210975, 1, 1, 1, 1, 1,
-0.7937727, 1.679845, -0.7242985, 1, 1, 1, 1, 1,
-0.78926, 0.2017116, -0.1967416, 1, 1, 1, 1, 1,
-0.7891012, -0.8727238, -3.344141, 1, 1, 1, 1, 1,
-0.7880086, 0.4550442, -0.8071302, 1, 1, 1, 1, 1,
-0.7760634, -0.5131565, -1.391843, 1, 1, 1, 1, 1,
-0.7739683, -1.281076, -3.070255, 1, 1, 1, 1, 1,
-0.7654831, -0.3569275, -1.96639, 1, 1, 1, 1, 1,
-0.765255, -0.1381685, -2.80522, 1, 1, 1, 1, 1,
-0.7647606, -0.988845, -0.8633129, 0, 0, 1, 1, 1,
-0.7606236, -0.6509696, -2.646779, 1, 0, 0, 1, 1,
-0.7577838, 0.9548537, -1.066302, 1, 0, 0, 1, 1,
-0.7576983, 0.3158568, -0.9355098, 1, 0, 0, 1, 1,
-0.7566838, -1.458353, -3.211957, 1, 0, 0, 1, 1,
-0.7519079, -0.1323039, -2.641031, 1, 0, 0, 1, 1,
-0.7499128, -0.1094886, -0.3286251, 0, 0, 0, 1, 1,
-0.7474099, 0.3595059, 0.8104201, 0, 0, 0, 1, 1,
-0.7446693, 0.9867225, -0.2755601, 0, 0, 0, 1, 1,
-0.7435563, -0.6216397, -1.981787, 0, 0, 0, 1, 1,
-0.7426132, -0.6496028, -1.898516, 0, 0, 0, 1, 1,
-0.7342473, 0.1110542, 0.9906858, 0, 0, 0, 1, 1,
-0.7325211, 0.1321968, -0.7415589, 0, 0, 0, 1, 1,
-0.7318601, 0.6676418, 1.501772, 1, 1, 1, 1, 1,
-0.7291809, -0.80054, -0.6742305, 1, 1, 1, 1, 1,
-0.7229393, -1.043125, -1.62652, 1, 1, 1, 1, 1,
-0.7129985, 0.1055476, -2.197181, 1, 1, 1, 1, 1,
-0.7118867, -0.463167, -2.625628, 1, 1, 1, 1, 1,
-0.7020398, -0.04721117, -0.6325071, 1, 1, 1, 1, 1,
-0.6951532, 0.6851445, -0.1769881, 1, 1, 1, 1, 1,
-0.6903353, -1.274841, -1.62248, 1, 1, 1, 1, 1,
-0.685905, 0.5450933, -0.248495, 1, 1, 1, 1, 1,
-0.6839268, 0.7545534, -0.7542918, 1, 1, 1, 1, 1,
-0.6838261, -0.2960971, -1.743291, 1, 1, 1, 1, 1,
-0.6796972, 1.366381, -1.458922, 1, 1, 1, 1, 1,
-0.676186, 3.238811, -0.2722993, 1, 1, 1, 1, 1,
-0.671911, -2.18412, -3.787891, 1, 1, 1, 1, 1,
-0.6611164, 0.758957, -0.1176079, 1, 1, 1, 1, 1,
-0.6575693, 0.8292338, 1.495181, 0, 0, 1, 1, 1,
-0.6560739, 0.9694353, -1.655867, 1, 0, 0, 1, 1,
-0.6409214, 1.171356, 0.7900893, 1, 0, 0, 1, 1,
-0.6387722, 1.839445, 0.7919044, 1, 0, 0, 1, 1,
-0.6342259, -1.756571, -3.920936, 1, 0, 0, 1, 1,
-0.6342203, 0.04290432, -0.8870161, 1, 0, 0, 1, 1,
-0.6319417, 1.519809, -0.1438063, 0, 0, 0, 1, 1,
-0.6309901, -0.3634035, -1.581576, 0, 0, 0, 1, 1,
-0.6276855, 0.5544677, -0.1001674, 0, 0, 0, 1, 1,
-0.6267956, 0.9516499, 0.9930924, 0, 0, 0, 1, 1,
-0.6238708, 2.254673, 0.5388979, 0, 0, 0, 1, 1,
-0.6217036, 1.394729, 0.3454759, 0, 0, 0, 1, 1,
-0.6215663, 0.1689232, -1.36232, 0, 0, 0, 1, 1,
-0.6195518, 0.1960656, -0.9526393, 1, 1, 1, 1, 1,
-0.6137675, 1.265705, -0.1095173, 1, 1, 1, 1, 1,
-0.606167, -1.115799, -3.488227, 1, 1, 1, 1, 1,
-0.6058836, 0.6725703, -1.316676, 1, 1, 1, 1, 1,
-0.6049794, -0.4146472, -3.112206, 1, 1, 1, 1, 1,
-0.6031407, -0.6513688, -2.952961, 1, 1, 1, 1, 1,
-0.5956258, 0.8282162, -1.51834, 1, 1, 1, 1, 1,
-0.5858436, 0.574589, -0.7718975, 1, 1, 1, 1, 1,
-0.5850407, 2.176182, -0.5287107, 1, 1, 1, 1, 1,
-0.5841806, 0.6599289, -0.9224045, 1, 1, 1, 1, 1,
-0.5759885, 0.7208019, -0.819532, 1, 1, 1, 1, 1,
-0.5735582, -1.75667, -2.921312, 1, 1, 1, 1, 1,
-0.5734825, 0.1229754, -0.8163255, 1, 1, 1, 1, 1,
-0.5727745, 1.259911, -0.6816266, 1, 1, 1, 1, 1,
-0.561103, 0.2691824, -1.720298, 1, 1, 1, 1, 1,
-0.5592377, -0.558189, -2.907585, 0, 0, 1, 1, 1,
-0.5580514, -1.333241, -1.283091, 1, 0, 0, 1, 1,
-0.5573456, -1.648113, -4.257575, 1, 0, 0, 1, 1,
-0.5549451, 0.8924109, -1.054481, 1, 0, 0, 1, 1,
-0.5545554, -0.4957738, -1.665442, 1, 0, 0, 1, 1,
-0.5535592, -0.7201706, -2.411536, 1, 0, 0, 1, 1,
-0.5527794, 1.678187, 0.6381503, 0, 0, 0, 1, 1,
-0.5517642, -0.335844, -2.389521, 0, 0, 0, 1, 1,
-0.5514921, -0.5059334, -3.344299, 0, 0, 0, 1, 1,
-0.5489826, -0.6616678, -2.471778, 0, 0, 0, 1, 1,
-0.5461371, -1.06168, -2.839329, 0, 0, 0, 1, 1,
-0.5459549, -2.124412, -6.407463, 0, 0, 0, 1, 1,
-0.5400931, 0.4482861, -0.5260178, 0, 0, 0, 1, 1,
-0.539396, -2.109765, -2.8009, 1, 1, 1, 1, 1,
-0.5379395, 0.741221, -0.3515206, 1, 1, 1, 1, 1,
-0.5307153, -0.1293512, -1.976197, 1, 1, 1, 1, 1,
-0.5302153, 0.8197529, 1.728086, 1, 1, 1, 1, 1,
-0.5283917, 0.8452435, -0.3732662, 1, 1, 1, 1, 1,
-0.5279796, -0.1631416, -2.356827, 1, 1, 1, 1, 1,
-0.5278385, 0.1813463, -1.282927, 1, 1, 1, 1, 1,
-0.5269889, 0.1683387, 0.5543621, 1, 1, 1, 1, 1,
-0.5165759, -1.578859, -3.151135, 1, 1, 1, 1, 1,
-0.5147681, 1.43022, -0.6619362, 1, 1, 1, 1, 1,
-0.5136226, 1.385068, -0.0988675, 1, 1, 1, 1, 1,
-0.5094761, 0.1444749, -1.529686, 1, 1, 1, 1, 1,
-0.5084183, 0.6402464, -0.4133169, 1, 1, 1, 1, 1,
-0.5063378, 1.591589, 0.01344752, 1, 1, 1, 1, 1,
-0.5062419, -0.192539, -1.792999, 1, 1, 1, 1, 1,
-0.5033011, -0.4519242, -1.494768, 0, 0, 1, 1, 1,
-0.5012986, 1.083545, -1.016364, 1, 0, 0, 1, 1,
-0.5006267, -0.06782625, -2.005673, 1, 0, 0, 1, 1,
-0.4979764, 0.6511195, -2.290403, 1, 0, 0, 1, 1,
-0.4914498, -0.2660086, -2.105393, 1, 0, 0, 1, 1,
-0.4912918, -0.3094716, -3.08338, 1, 0, 0, 1, 1,
-0.490776, 2.72129, 0.001825695, 0, 0, 0, 1, 1,
-0.4862359, 0.6045241, 1.74194, 0, 0, 0, 1, 1,
-0.4861445, -0.8653556, -4.208064, 0, 0, 0, 1, 1,
-0.4834452, 2.402155, -1.632389, 0, 0, 0, 1, 1,
-0.4827125, 0.6439388, -1.125659, 0, 0, 0, 1, 1,
-0.482246, 2.187887, -1.626605, 0, 0, 0, 1, 1,
-0.4814354, -0.6392865, -2.36506, 0, 0, 0, 1, 1,
-0.4803173, 0.2679242, -1.900383, 1, 1, 1, 1, 1,
-0.4788819, -1.712547, -3.562999, 1, 1, 1, 1, 1,
-0.473562, 0.7120221, -0.4189449, 1, 1, 1, 1, 1,
-0.4724624, 1.250957, -0.08299556, 1, 1, 1, 1, 1,
-0.4712702, -1.783213, -1.545318, 1, 1, 1, 1, 1,
-0.4692568, -0.01363708, 0.00711449, 1, 1, 1, 1, 1,
-0.4639847, 1.263484, -1.959124, 1, 1, 1, 1, 1,
-0.4631745, -2.107432, -1.643287, 1, 1, 1, 1, 1,
-0.4512223, 1.978525, -2.036494, 1, 1, 1, 1, 1,
-0.448618, 1.275454, -0.6452269, 1, 1, 1, 1, 1,
-0.4448763, -0.998709, -2.516315, 1, 1, 1, 1, 1,
-0.4446799, 2.312168, 0.8012438, 1, 1, 1, 1, 1,
-0.4442773, 0.3683617, -2.919849, 1, 1, 1, 1, 1,
-0.4422438, -0.7942114, -2.078062, 1, 1, 1, 1, 1,
-0.4374821, 0.6913683, -1.188496, 1, 1, 1, 1, 1,
-0.4362889, 1.416159, 0.4977638, 0, 0, 1, 1, 1,
-0.434756, -1.7954, -3.780419, 1, 0, 0, 1, 1,
-0.4342896, -1.91868, -2.691851, 1, 0, 0, 1, 1,
-0.4340003, 1.048922, -0.3659435, 1, 0, 0, 1, 1,
-0.4305283, -0.2544923, -1.929192, 1, 0, 0, 1, 1,
-0.4279456, 0.5932665, 0.3364151, 1, 0, 0, 1, 1,
-0.4261473, -0.7621291, -0.6936778, 0, 0, 0, 1, 1,
-0.4240299, 1.2773, -0.9056256, 0, 0, 0, 1, 1,
-0.4117106, 0.8825783, -0.7958758, 0, 0, 0, 1, 1,
-0.4075112, 2.004044, -2.074478, 0, 0, 0, 1, 1,
-0.4066556, 0.4730464, -0.945446, 0, 0, 0, 1, 1,
-0.4054789, 0.3050647, -2.382392, 0, 0, 0, 1, 1,
-0.4031264, -1.282789, -3.924304, 0, 0, 0, 1, 1,
-0.4020181, -0.3533284, -2.711558, 1, 1, 1, 1, 1,
-0.4013401, -0.1755512, -1.333424, 1, 1, 1, 1, 1,
-0.3976904, -0.6621642, -3.350007, 1, 1, 1, 1, 1,
-0.3903439, 0.5480632, -1.842124, 1, 1, 1, 1, 1,
-0.3891833, -2.45049, -4.198282, 1, 1, 1, 1, 1,
-0.3880696, -0.4792199, -4.092734, 1, 1, 1, 1, 1,
-0.3874658, 0.2324769, -1.218036, 1, 1, 1, 1, 1,
-0.3859646, 0.9447995, 0.6110296, 1, 1, 1, 1, 1,
-0.3857019, -0.04518912, -2.735627, 1, 1, 1, 1, 1,
-0.3815032, -1.313231, -3.612769, 1, 1, 1, 1, 1,
-0.3791502, 0.01616237, -1.906353, 1, 1, 1, 1, 1,
-0.3777006, -0.5449081, -2.599496, 1, 1, 1, 1, 1,
-0.3772907, 1.388137, -2.302193, 1, 1, 1, 1, 1,
-0.3767591, -0.8635052, -2.550873, 1, 1, 1, 1, 1,
-0.3761606, 1.937361, 0.243637, 1, 1, 1, 1, 1,
-0.375398, -0.4197997, -1.689861, 0, 0, 1, 1, 1,
-0.374943, 0.6781586, -1.67033, 1, 0, 0, 1, 1,
-0.3741187, -0.6897061, -2.594195, 1, 0, 0, 1, 1,
-0.3703319, -0.4779606, -2.805577, 1, 0, 0, 1, 1,
-0.3668312, -0.1169611, -1.945271, 1, 0, 0, 1, 1,
-0.3562147, 0.3798443, 0.1968986, 1, 0, 0, 1, 1,
-0.3541965, 1.288119, -1.575687, 0, 0, 0, 1, 1,
-0.3519413, 0.08392637, -3.683234, 0, 0, 0, 1, 1,
-0.3415533, 1.52726, -1.407646, 0, 0, 0, 1, 1,
-0.3341686, -0.9313651, -2.023886, 0, 0, 0, 1, 1,
-0.3307256, 0.4722123, -1.256482, 0, 0, 0, 1, 1,
-0.3173034, -2.303318, -5.50822, 0, 0, 0, 1, 1,
-0.3157597, -0.2062896, -1.243666, 0, 0, 0, 1, 1,
-0.3117981, 0.4292921, -0.7853349, 1, 1, 1, 1, 1,
-0.3091075, 1.375577, 0.849494, 1, 1, 1, 1, 1,
-0.3036201, 0.2647933, 1.633989, 1, 1, 1, 1, 1,
-0.3013037, -0.409775, -3.135838, 1, 1, 1, 1, 1,
-0.2992164, 0.4656229, 0.7046635, 1, 1, 1, 1, 1,
-0.2955754, 2.150661, 0.246903, 1, 1, 1, 1, 1,
-0.2919725, 0.7939078, 0.7187442, 1, 1, 1, 1, 1,
-0.2905385, -0.01000306, -0.8303415, 1, 1, 1, 1, 1,
-0.2878945, 0.2997578, -1.136548, 1, 1, 1, 1, 1,
-0.2852493, 0.6694759, -1.030466, 1, 1, 1, 1, 1,
-0.2836978, 0.5885361, 0.1481599, 1, 1, 1, 1, 1,
-0.2795365, 0.4837419, 0.5870075, 1, 1, 1, 1, 1,
-0.2747031, -1.078827, -2.578472, 1, 1, 1, 1, 1,
-0.2738687, 0.961469, 0.191667, 1, 1, 1, 1, 1,
-0.2731926, 0.1416781, -2.799265, 1, 1, 1, 1, 1,
-0.2727333, 2.356873, -0.5036753, 0, 0, 1, 1, 1,
-0.2707026, 0.4441499, -1.098084, 1, 0, 0, 1, 1,
-0.2706752, 0.1558708, -2.543749, 1, 0, 0, 1, 1,
-0.2691438, 1.983768, -1.439604, 1, 0, 0, 1, 1,
-0.2691281, -0.1215026, -1.05781, 1, 0, 0, 1, 1,
-0.2680638, 0.4363308, -1.083129, 1, 0, 0, 1, 1,
-0.267177, -0.4986158, -2.328882, 0, 0, 0, 1, 1,
-0.2663972, 0.5627239, -0.9120077, 0, 0, 0, 1, 1,
-0.2633935, 0.02708068, -1.762694, 0, 0, 0, 1, 1,
-0.2549335, 0.3862669, 0.1368153, 0, 0, 0, 1, 1,
-0.2539009, 1.393315, 0.1687935, 0, 0, 0, 1, 1,
-0.2508198, -0.5402514, -1.771339, 0, 0, 0, 1, 1,
-0.2484718, -0.9025683, -2.907023, 0, 0, 0, 1, 1,
-0.2439996, -2.132978, -3.369832, 1, 1, 1, 1, 1,
-0.2427096, 0.1069985, -2.443383, 1, 1, 1, 1, 1,
-0.2382626, 1.028887, -0.3014775, 1, 1, 1, 1, 1,
-0.2353752, -1.992948, -4.442657, 1, 1, 1, 1, 1,
-0.2347191, 0.4684452, 0.7864337, 1, 1, 1, 1, 1,
-0.2327887, -0.3928396, -2.229013, 1, 1, 1, 1, 1,
-0.2324529, 0.7581814, 1.349922, 1, 1, 1, 1, 1,
-0.2298883, -2.306216, -2.535786, 1, 1, 1, 1, 1,
-0.2218866, 1.623328, -0.9743445, 1, 1, 1, 1, 1,
-0.2209154, -0.9362464, -2.519598, 1, 1, 1, 1, 1,
-0.2191115, -0.5177261, -1.7728, 1, 1, 1, 1, 1,
-0.2165781, 1.364486, -1.762123, 1, 1, 1, 1, 1,
-0.2156833, -0.1724909, -2.437397, 1, 1, 1, 1, 1,
-0.2133097, -0.953178, -3.791657, 1, 1, 1, 1, 1,
-0.2114511, 1.514175, -0.9096757, 1, 1, 1, 1, 1,
-0.2093345, 1.085778, 0.5991709, 0, 0, 1, 1, 1,
-0.205694, 0.6606146, -0.7277724, 1, 0, 0, 1, 1,
-0.1966472, 0.5077863, 1.3994, 1, 0, 0, 1, 1,
-0.192481, 0.04368569, -0.8415265, 1, 0, 0, 1, 1,
-0.1908911, 0.8227745, 0.7308298, 1, 0, 0, 1, 1,
-0.1877579, 1.653439, -1.487702, 1, 0, 0, 1, 1,
-0.1872098, -0.4016874, -2.278621, 0, 0, 0, 1, 1,
-0.1864987, 0.8101634, -0.877664, 0, 0, 0, 1, 1,
-0.1838843, 0.7087084, -0.130466, 0, 0, 0, 1, 1,
-0.1794711, -0.6028619, -3.661517, 0, 0, 0, 1, 1,
-0.1719573, 2.306994, 1.227247, 0, 0, 0, 1, 1,
-0.1657492, -0.7316251, -2.248615, 0, 0, 0, 1, 1,
-0.1643882, -0.2277401, -1.856016, 0, 0, 0, 1, 1,
-0.1578284, 0.3633283, -0.7618249, 1, 1, 1, 1, 1,
-0.1557066, 1.559475, -0.7766442, 1, 1, 1, 1, 1,
-0.1545905, 0.6735871, -1.943723, 1, 1, 1, 1, 1,
-0.1519814, -0.6703322, -2.580855, 1, 1, 1, 1, 1,
-0.1446285, 1.559506, -0.8267484, 1, 1, 1, 1, 1,
-0.1401996, 0.8651249, -0.9531362, 1, 1, 1, 1, 1,
-0.1333458, -0.1902233, -4.538888, 1, 1, 1, 1, 1,
-0.1249149, -0.1629173, -2.007954, 1, 1, 1, 1, 1,
-0.1218301, 0.2139369, 0.6272309, 1, 1, 1, 1, 1,
-0.1197934, -0.6142798, -3.253052, 1, 1, 1, 1, 1,
-0.1197659, -0.1110887, -2.150646, 1, 1, 1, 1, 1,
-0.1179718, -1.241167, -1.68184, 1, 1, 1, 1, 1,
-0.1133922, -1.034872, -1.513184, 1, 1, 1, 1, 1,
-0.1095572, 0.4973936, 0.4022281, 1, 1, 1, 1, 1,
-0.1094913, 0.7188355, -1.460763, 1, 1, 1, 1, 1,
-0.1094887, 2.26897, -0.4512648, 0, 0, 1, 1, 1,
-0.1081572, -0.4194675, -3.163352, 1, 0, 0, 1, 1,
-0.1047546, 0.5452503, -0.9683396, 1, 0, 0, 1, 1,
-0.1019605, 0.1984082, -0.665704, 1, 0, 0, 1, 1,
-0.09906242, -0.2606489, -2.519503, 1, 0, 0, 1, 1,
-0.09518468, -0.5210384, -3.525647, 1, 0, 0, 1, 1,
-0.09258398, -1.082079, -2.423479, 0, 0, 0, 1, 1,
-0.09032989, 0.1666283, -0.6972144, 0, 0, 0, 1, 1,
-0.08954739, -1.668841, -2.30552, 0, 0, 0, 1, 1,
-0.08878063, -0.6854599, -3.81137, 0, 0, 0, 1, 1,
-0.0878939, -0.537419, -5.930358, 0, 0, 0, 1, 1,
-0.08741383, -0.705452, -3.291895, 0, 0, 0, 1, 1,
-0.08605536, -0.3669142, -0.7526277, 0, 0, 0, 1, 1,
-0.07515275, -1.045013, -2.588459, 1, 1, 1, 1, 1,
-0.07273662, 0.6656372, -0.7516325, 1, 1, 1, 1, 1,
-0.07215136, 0.1096949, 0.5022629, 1, 1, 1, 1, 1,
-0.07211764, -0.1740245, -2.694025, 1, 1, 1, 1, 1,
-0.07125598, -2.261167, -3.388906, 1, 1, 1, 1, 1,
-0.06968106, 0.4860129, 0.229462, 1, 1, 1, 1, 1,
-0.06566788, -0.7383766, -2.9507, 1, 1, 1, 1, 1,
-0.0637226, 1.592744, -1.755767, 1, 1, 1, 1, 1,
-0.05733637, -0.9384161, -4.708246, 1, 1, 1, 1, 1,
-0.05666484, 0.4765779, 1.620846, 1, 1, 1, 1, 1,
-0.05620385, -0.351547, -2.882489, 1, 1, 1, 1, 1,
-0.05395009, 0.134176, -1.544762, 1, 1, 1, 1, 1,
-0.05388277, 0.7616354, -0.193462, 1, 1, 1, 1, 1,
-0.05367365, -0.4294074, -1.865226, 1, 1, 1, 1, 1,
-0.05347902, -3.855725, -3.531842, 1, 1, 1, 1, 1,
-0.05255944, -0.2303278, -1.080052, 0, 0, 1, 1, 1,
-0.04848018, 0.2011606, 0.309229, 1, 0, 0, 1, 1,
-0.04773584, -0.3002071, -3.312603, 1, 0, 0, 1, 1,
-0.04509276, 0.1936686, -0.9732951, 1, 0, 0, 1, 1,
-0.04340633, 1.948126, -1.784016, 1, 0, 0, 1, 1,
-0.03887476, 0.6638689, -0.111576, 1, 0, 0, 1, 1,
-0.03817517, -0.09945969, -3.579465, 0, 0, 0, 1, 1,
-0.0368193, -0.4785342, -4.269261, 0, 0, 0, 1, 1,
-0.03176993, 0.5176684, -0.3493868, 0, 0, 0, 1, 1,
-0.02984479, -1.062928, -2.777621, 0, 0, 0, 1, 1,
-0.02394974, 0.8970777, 0.2242092, 0, 0, 0, 1, 1,
-0.02207492, 1.941278, 0.2257967, 0, 0, 0, 1, 1,
-0.02078223, -1.287196, -4.60049, 0, 0, 0, 1, 1,
-0.0203094, -1.442631, -4.13427, 1, 1, 1, 1, 1,
-0.01998974, -0.6114638, -2.430957, 1, 1, 1, 1, 1,
-0.01805192, 1.503276, -0.9293574, 1, 1, 1, 1, 1,
-0.01692901, 1.527343, 1.78668, 1, 1, 1, 1, 1,
-0.01613119, -0.5838442, -3.321005, 1, 1, 1, 1, 1,
-0.01600738, -0.4689958, -1.295827, 1, 1, 1, 1, 1,
-0.01173512, -0.5686604, -2.769332, 1, 1, 1, 1, 1,
-0.01140121, -0.4368028, -3.824069, 1, 1, 1, 1, 1,
-0.007725853, -0.433957, -2.517525, 1, 1, 1, 1, 1,
-0.007069577, -0.7583356, -3.742531, 1, 1, 1, 1, 1,
-0.005557755, 0.2647018, 0.9623339, 1, 1, 1, 1, 1,
-0.005435409, -1.015574, -4.150344, 1, 1, 1, 1, 1,
0.0001375714, 0.8173727, 0.1950022, 1, 1, 1, 1, 1,
0.002010113, -0.7777279, 3.470681, 1, 1, 1, 1, 1,
0.007182108, -2.911504, 4.778234, 1, 1, 1, 1, 1,
0.008938172, -2.113313, 3.641449, 0, 0, 1, 1, 1,
0.01229059, -0.2873865, 4.025715, 1, 0, 0, 1, 1,
0.0127436, 0.6746363, -1.82733, 1, 0, 0, 1, 1,
0.01833662, -0.2573444, 2.981505, 1, 0, 0, 1, 1,
0.02399128, 0.4697341, -0.3149442, 1, 0, 0, 1, 1,
0.0267986, 1.796948, 0.3176379, 1, 0, 0, 1, 1,
0.03682519, -1.144208, 3.11175, 0, 0, 0, 1, 1,
0.03763535, 0.9223014, -1.552257, 0, 0, 0, 1, 1,
0.04671445, 0.05987904, 0.3524957, 0, 0, 0, 1, 1,
0.04725843, -0.8308265, 4.417276, 0, 0, 0, 1, 1,
0.05000114, -0.6080762, 4.821636, 0, 0, 0, 1, 1,
0.05169147, -0.8412345, 2.927423, 0, 0, 0, 1, 1,
0.05266031, -1.639155, 3.737703, 0, 0, 0, 1, 1,
0.05554577, 0.7443426, 0.2692672, 1, 1, 1, 1, 1,
0.05936323, 0.07050835, 0.94662, 1, 1, 1, 1, 1,
0.06302949, 1.401708, 0.7106627, 1, 1, 1, 1, 1,
0.06360962, 0.9760587, -1.163082, 1, 1, 1, 1, 1,
0.07416897, -0.8641681, 3.018544, 1, 1, 1, 1, 1,
0.07777371, -1.835155, 2.711422, 1, 1, 1, 1, 1,
0.07990962, 0.9228747, -0.1014482, 1, 1, 1, 1, 1,
0.08091203, 0.2067969, -0.4265418, 1, 1, 1, 1, 1,
0.08151042, -0.2356603, 2.590216, 1, 1, 1, 1, 1,
0.08223442, 0.1696484, 1.125477, 1, 1, 1, 1, 1,
0.08224725, 0.6198733, 0.01084083, 1, 1, 1, 1, 1,
0.08338379, -0.2128644, 2.210207, 1, 1, 1, 1, 1,
0.08839669, -0.4698052, 3.010502, 1, 1, 1, 1, 1,
0.09020591, 0.8055481, -0.4189753, 1, 1, 1, 1, 1,
0.09222803, -0.5402989, 3.282189, 1, 1, 1, 1, 1,
0.09661173, -0.5337958, 3.44662, 0, 0, 1, 1, 1,
0.09707999, -0.1089203, 1.871109, 1, 0, 0, 1, 1,
0.09887985, 0.1783121, 1.355113, 1, 0, 0, 1, 1,
0.1063559, -1.014445, 4.377389, 1, 0, 0, 1, 1,
0.1076423, 1.769722, 0.2380095, 1, 0, 0, 1, 1,
0.1080613, 0.9928808, -0.5672292, 1, 0, 0, 1, 1,
0.1123874, 1.055419, -0.3022168, 0, 0, 0, 1, 1,
0.1137145, -0.7451953, 2.72532, 0, 0, 0, 1, 1,
0.1175784, -0.8322936, 1.168262, 0, 0, 0, 1, 1,
0.1189079, 0.2734664, -0.2823105, 0, 0, 0, 1, 1,
0.1196269, -1.113357, 1.300752, 0, 0, 0, 1, 1,
0.1200135, -0.4333281, 2.274645, 0, 0, 0, 1, 1,
0.1214898, -0.5359523, 3.451559, 0, 0, 0, 1, 1,
0.1221722, 0.712043, -0.06709409, 1, 1, 1, 1, 1,
0.124477, 1.083462, 1.389594, 1, 1, 1, 1, 1,
0.1260576, 0.4532658, 0.5640153, 1, 1, 1, 1, 1,
0.1309831, -0.9654976, 3.249725, 1, 1, 1, 1, 1,
0.13223, -0.5706142, 3.055743, 1, 1, 1, 1, 1,
0.1331092, 0.01825309, 1.1311, 1, 1, 1, 1, 1,
0.1344643, 2.321524, 0.8500609, 1, 1, 1, 1, 1,
0.1435589, 0.1260914, 0.2173477, 1, 1, 1, 1, 1,
0.1441131, -0.5823243, 1.343977, 1, 1, 1, 1, 1,
0.1447825, 0.387467, 0.2711936, 1, 1, 1, 1, 1,
0.1470199, 1.414365, -0.6981177, 1, 1, 1, 1, 1,
0.1479561, -0.1837286, 2.395148, 1, 1, 1, 1, 1,
0.1514276, 0.8555142, 0.8625282, 1, 1, 1, 1, 1,
0.1547483, 1.152097, -0.5393615, 1, 1, 1, 1, 1,
0.1550557, 0.4936425, 0.1266054, 1, 1, 1, 1, 1,
0.1568773, -0.9668851, 1.507515, 0, 0, 1, 1, 1,
0.1575658, 0.5528053, -0.3192307, 1, 0, 0, 1, 1,
0.1584496, -1.982565, 1.356922, 1, 0, 0, 1, 1,
0.1704105, 0.3885162, -0.08857343, 1, 0, 0, 1, 1,
0.1737415, 0.457721, 2.100169, 1, 0, 0, 1, 1,
0.1738182, -1.957398, 1.661329, 1, 0, 0, 1, 1,
0.1752984, -0.8791152, 2.930971, 0, 0, 0, 1, 1,
0.177795, -0.118108, 2.003583, 0, 0, 0, 1, 1,
0.1792895, 0.7882381, 1.284172, 0, 0, 0, 1, 1,
0.1802474, -0.01446459, 2.093864, 0, 0, 0, 1, 1,
0.1860567, -0.6942922, 2.544903, 0, 0, 0, 1, 1,
0.190746, 1.145296, 1.65006, 0, 0, 0, 1, 1,
0.1913108, -1.086599, 3.292405, 0, 0, 0, 1, 1,
0.1913597, -1.603405, 3.522314, 1, 1, 1, 1, 1,
0.1919818, 0.6768641, -1.097662, 1, 1, 1, 1, 1,
0.1927289, -0.006984166, 0.7857129, 1, 1, 1, 1, 1,
0.1932319, 0.9334581, -0.3833704, 1, 1, 1, 1, 1,
0.1943958, -0.8557279, 2.615935, 1, 1, 1, 1, 1,
0.1969087, 0.1273923, 1.324124, 1, 1, 1, 1, 1,
0.2005081, -0.1129555, 4.402577, 1, 1, 1, 1, 1,
0.2019285, 0.9189627, -1.147879, 1, 1, 1, 1, 1,
0.2046419, -0.4308406, 3.381976, 1, 1, 1, 1, 1,
0.2051491, -0.2972554, 1.711405, 1, 1, 1, 1, 1,
0.2053655, -0.7649663, 2.821652, 1, 1, 1, 1, 1,
0.2073705, 0.5231843, -0.4886211, 1, 1, 1, 1, 1,
0.2091265, -1.149827, 2.148026, 1, 1, 1, 1, 1,
0.2174152, 0.2591027, -0.3638107, 1, 1, 1, 1, 1,
0.2259309, 0.5480315, 1.032879, 1, 1, 1, 1, 1,
0.2290723, 0.02625394, 2.637475, 0, 0, 1, 1, 1,
0.2311309, -1.060912, 3.326292, 1, 0, 0, 1, 1,
0.2331271, -1.090588, 1.87765, 1, 0, 0, 1, 1,
0.2354455, 2.419776, -1.623333, 1, 0, 0, 1, 1,
0.2380952, 0.7529808, -0.1070774, 1, 0, 0, 1, 1,
0.2405933, 0.3249453, 2.117883, 1, 0, 0, 1, 1,
0.242926, 0.2791054, 1.302425, 0, 0, 0, 1, 1,
0.2512451, -0.6580013, 3.944547, 0, 0, 0, 1, 1,
0.2536793, -0.08952335, 0.7939371, 0, 0, 0, 1, 1,
0.2547501, 0.7374233, -0.3929827, 0, 0, 0, 1, 1,
0.261413, -0.495771, 6.159497, 0, 0, 0, 1, 1,
0.2634439, 0.3292687, 0.5472392, 0, 0, 0, 1, 1,
0.2639433, -1.200593, 4.51315, 0, 0, 0, 1, 1,
0.2671191, -0.1425754, 2.655051, 1, 1, 1, 1, 1,
0.2706257, -0.9365165, 2.572879, 1, 1, 1, 1, 1,
0.2739334, 1.246278, -0.5815626, 1, 1, 1, 1, 1,
0.2748665, -1.727274, 1.881518, 1, 1, 1, 1, 1,
0.2780176, 1.004209, -0.8310409, 1, 1, 1, 1, 1,
0.2781326, -0.5943465, 1.413658, 1, 1, 1, 1, 1,
0.282121, -1.742091, 2.457782, 1, 1, 1, 1, 1,
0.2855029, -0.7265455, 1.741008, 1, 1, 1, 1, 1,
0.2869834, 0.7757418, 1.049893, 1, 1, 1, 1, 1,
0.2874003, 0.4735247, 0.04000655, 1, 1, 1, 1, 1,
0.2879578, -0.2541567, 1.583068, 1, 1, 1, 1, 1,
0.2885373, -2.63706, 2.440153, 1, 1, 1, 1, 1,
0.2891099, -0.445343, 2.168309, 1, 1, 1, 1, 1,
0.2895699, -1.196045, 2.504227, 1, 1, 1, 1, 1,
0.295413, -1.277776, 3.276059, 1, 1, 1, 1, 1,
0.295646, -2.254113, 4.700241, 0, 0, 1, 1, 1,
0.2957958, -0.7966896, 3.345202, 1, 0, 0, 1, 1,
0.2960561, -0.0335452, 0.7404223, 1, 0, 0, 1, 1,
0.3001632, -0.02473959, 1.339734, 1, 0, 0, 1, 1,
0.3049975, -1.046546, 2.608493, 1, 0, 0, 1, 1,
0.3056385, -0.1768028, 2.677868, 1, 0, 0, 1, 1,
0.3070046, -0.330206, 3.620069, 0, 0, 0, 1, 1,
0.307375, 1.047121, -1.772723, 0, 0, 0, 1, 1,
0.3078544, 0.1816583, 0.1874597, 0, 0, 0, 1, 1,
0.3110538, 0.5112944, 1.383821, 0, 0, 0, 1, 1,
0.3158115, -0.854946, 2.781443, 0, 0, 0, 1, 1,
0.3159355, -0.1017577, 1.642101, 0, 0, 0, 1, 1,
0.320296, -0.501195, 1.796147, 0, 0, 0, 1, 1,
0.3231892, -0.03817582, 0.4751326, 1, 1, 1, 1, 1,
0.3250998, -1.926724, 2.829813, 1, 1, 1, 1, 1,
0.3263264, 0.4140402, -1.3294, 1, 1, 1, 1, 1,
0.3291694, -0.1961771, 3.328938, 1, 1, 1, 1, 1,
0.3305592, -1.213721, 2.750994, 1, 1, 1, 1, 1,
0.3310793, 1.084261, -0.4175329, 1, 1, 1, 1, 1,
0.3310913, -2.216064, 2.019165, 1, 1, 1, 1, 1,
0.3325131, 0.5544175, 0.7052768, 1, 1, 1, 1, 1,
0.3395654, 1.151471, 2.080085, 1, 1, 1, 1, 1,
0.3440768, 0.9400561, 1.346881, 1, 1, 1, 1, 1,
0.3446915, 0.3635558, 2.080178, 1, 1, 1, 1, 1,
0.3470425, -0.9905565, 3.864314, 1, 1, 1, 1, 1,
0.3471382, -1.432756, 2.926657, 1, 1, 1, 1, 1,
0.3525153, 0.4043714, -0.7577798, 1, 1, 1, 1, 1,
0.3572965, -1.080071, 2.071931, 1, 1, 1, 1, 1,
0.3627397, -1.084845, 1.957398, 0, 0, 1, 1, 1,
0.3627401, 0.8914015, 1.480482, 1, 0, 0, 1, 1,
0.3661219, -2.24723, 1.863552, 1, 0, 0, 1, 1,
0.3685258, -2.153858, 3.846246, 1, 0, 0, 1, 1,
0.370804, -0.06731352, 1.74913, 1, 0, 0, 1, 1,
0.3781844, 1.521942, 2.071949, 1, 0, 0, 1, 1,
0.3788559, -0.4715333, 2.677987, 0, 0, 0, 1, 1,
0.3795804, 1.20856, 0.2046554, 0, 0, 0, 1, 1,
0.3804087, -1.871269, 3.710544, 0, 0, 0, 1, 1,
0.3812689, 0.4125854, 0.01884977, 0, 0, 0, 1, 1,
0.3831298, 0.05048105, 1.689979, 0, 0, 0, 1, 1,
0.383254, -1.063094, 2.495924, 0, 0, 0, 1, 1,
0.3857895, -0.4725644, 2.080023, 0, 0, 0, 1, 1,
0.3867048, 0.9160472, 1.224766, 1, 1, 1, 1, 1,
0.3878082, 0.4998807, 0.9203919, 1, 1, 1, 1, 1,
0.3892399, -0.3921084, 3.973317, 1, 1, 1, 1, 1,
0.3922925, 1.262443, -0.6192842, 1, 1, 1, 1, 1,
0.3931329, -0.6105331, 0.7265856, 1, 1, 1, 1, 1,
0.3954811, -0.5123475, 3.585774, 1, 1, 1, 1, 1,
0.3984346, -0.1097141, 3.630422, 1, 1, 1, 1, 1,
0.3984431, -0.4918735, 3.237511, 1, 1, 1, 1, 1,
0.4006214, 0.9352542, 1.246794, 1, 1, 1, 1, 1,
0.405167, -1.098339, 1.068247, 1, 1, 1, 1, 1,
0.4104689, 0.5848857, 0.9944664, 1, 1, 1, 1, 1,
0.4133463, 1.091128, 0.6751611, 1, 1, 1, 1, 1,
0.416794, 0.8839986, -0.1148585, 1, 1, 1, 1, 1,
0.4211757, 1.569989, 0.08977316, 1, 1, 1, 1, 1,
0.4225322, 1.238506, -1.282124, 1, 1, 1, 1, 1,
0.4280698, 1.276152, -0.07092217, 0, 0, 1, 1, 1,
0.4312383, 1.014502, 0.9122203, 1, 0, 0, 1, 1,
0.4320662, -0.3205068, 2.193779, 1, 0, 0, 1, 1,
0.4532766, -0.1575127, 3.714454, 1, 0, 0, 1, 1,
0.454964, -0.6330222, 2.644098, 1, 0, 0, 1, 1,
0.4580402, 1.350065, 1.662426, 1, 0, 0, 1, 1,
0.4582427, -0.5410683, 2.758524, 0, 0, 0, 1, 1,
0.4598388, -0.9949141, 2.263174, 0, 0, 0, 1, 1,
0.4675871, -1.605469, 3.850102, 0, 0, 0, 1, 1,
0.4699406, -0.7188897, 0.4887959, 0, 0, 0, 1, 1,
0.4705426, -1.30925, 4.264651, 0, 0, 0, 1, 1,
0.4756938, -1.115219, 2.960116, 0, 0, 0, 1, 1,
0.4768911, 0.5686191, 0.4046732, 0, 0, 0, 1, 1,
0.4805414, -0.03337359, 2.258606, 1, 1, 1, 1, 1,
0.4810736, 0.9764988, 0.9641521, 1, 1, 1, 1, 1,
0.4851113, 0.02774975, -0.2717491, 1, 1, 1, 1, 1,
0.4865036, 1.357098, 0.4926566, 1, 1, 1, 1, 1,
0.4874898, 0.5667223, 2.095652, 1, 1, 1, 1, 1,
0.4922741, -0.9329636, 2.764772, 1, 1, 1, 1, 1,
0.4928641, 1.781915, -0.9196712, 1, 1, 1, 1, 1,
0.496168, -0.2653736, 2.337884, 1, 1, 1, 1, 1,
0.4973938, -0.1578846, 1.719758, 1, 1, 1, 1, 1,
0.498756, -0.4111308, 2.123982, 1, 1, 1, 1, 1,
0.5023457, -2.522827, 2.730642, 1, 1, 1, 1, 1,
0.503678, -0.5699796, 1.374995, 1, 1, 1, 1, 1,
0.5041873, -0.5897695, 0.9913141, 1, 1, 1, 1, 1,
0.5056335, 0.2730367, -0.3207752, 1, 1, 1, 1, 1,
0.5096636, -0.06215704, 0.7611776, 1, 1, 1, 1, 1,
0.5098472, -0.1912067, 2.3421, 0, 0, 1, 1, 1,
0.5102713, -0.2008721, 1.004299, 1, 0, 0, 1, 1,
0.5108425, 0.1176619, -0.923684, 1, 0, 0, 1, 1,
0.5114018, -1.847584, 3.610465, 1, 0, 0, 1, 1,
0.5154657, -1.392054, 2.744903, 1, 0, 0, 1, 1,
0.5189229, -0.1906478, 3.223994, 1, 0, 0, 1, 1,
0.5237734, -0.1342981, 3.058265, 0, 0, 0, 1, 1,
0.5266759, 1.3221, 0.5446436, 0, 0, 0, 1, 1,
0.5279685, 0.5366514, 0.3051753, 0, 0, 0, 1, 1,
0.5358868, 0.8756126, -0.3004712, 0, 0, 0, 1, 1,
0.5367306, -0.1294848, 2.62135, 0, 0, 0, 1, 1,
0.54088, 1.067524, -0.1194649, 0, 0, 0, 1, 1,
0.5411198, -0.4271243, 2.319744, 0, 0, 0, 1, 1,
0.54342, 0.7234954, 1.415485, 1, 1, 1, 1, 1,
0.5435688, 0.1948974, 1.295066, 1, 1, 1, 1, 1,
0.5449612, 1.229371, 0.1058813, 1, 1, 1, 1, 1,
0.5506883, -1.931473, 3.867124, 1, 1, 1, 1, 1,
0.5539256, -0.4771092, 3.208689, 1, 1, 1, 1, 1,
0.5566968, -2.203406, 3.864917, 1, 1, 1, 1, 1,
0.5640401, 1.630314, 0.0216657, 1, 1, 1, 1, 1,
0.5731738, 0.5195647, -0.2955247, 1, 1, 1, 1, 1,
0.5753472, 1.076672, 0.6505767, 1, 1, 1, 1, 1,
0.579639, -0.003709098, 1.783859, 1, 1, 1, 1, 1,
0.5797756, 0.2548933, 0.6134089, 1, 1, 1, 1, 1,
0.5823202, -1.707789, 2.220206, 1, 1, 1, 1, 1,
0.5827517, -0.5141034, 3.050361, 1, 1, 1, 1, 1,
0.5833407, -0.7862076, 4.208769, 1, 1, 1, 1, 1,
0.5850021, -0.6879321, 4.054367, 1, 1, 1, 1, 1,
0.5855038, -0.3929533, 1.401695, 0, 0, 1, 1, 1,
0.5868149, -1.12626, 2.099227, 1, 0, 0, 1, 1,
0.5877525, -0.2956624, 3.462128, 1, 0, 0, 1, 1,
0.5934004, -2.152454, 3.366532, 1, 0, 0, 1, 1,
0.5934013, 0.6877328, 0.09267332, 1, 0, 0, 1, 1,
0.5956472, -0.1354462, 0.9824612, 1, 0, 0, 1, 1,
0.5992473, -1.590293, 3.662512, 0, 0, 0, 1, 1,
0.6081846, 2.032576, -0.08442002, 0, 0, 0, 1, 1,
0.6097887, 0.003127436, -0.9917162, 0, 0, 0, 1, 1,
0.6130722, 0.1850525, 0.3826165, 0, 0, 0, 1, 1,
0.6134053, 0.6671391, 0.0030708, 0, 0, 0, 1, 1,
0.6141161, -0.3576211, 2.153245, 0, 0, 0, 1, 1,
0.6162192, -0.8278256, 3.700062, 0, 0, 0, 1, 1,
0.6180134, 0.09112979, 2.064121, 1, 1, 1, 1, 1,
0.6217852, 0.0540742, 2.007604, 1, 1, 1, 1, 1,
0.6243657, 0.7412409, 0.2000735, 1, 1, 1, 1, 1,
0.6252128, 0.9080846, 1.218177, 1, 1, 1, 1, 1,
0.6303236, 0.7561874, 0.9236766, 1, 1, 1, 1, 1,
0.6306307, -0.6084975, 0.3450854, 1, 1, 1, 1, 1,
0.6319019, 0.02203031, 0.1665161, 1, 1, 1, 1, 1,
0.6325573, 0.815647, 2.243225, 1, 1, 1, 1, 1,
0.636109, -0.120457, 1.491022, 1, 1, 1, 1, 1,
0.6371226, 0.4961886, 0.6378869, 1, 1, 1, 1, 1,
0.6510766, -1.676977, 3.274561, 1, 1, 1, 1, 1,
0.6543827, -1.131779, 3.254233, 1, 1, 1, 1, 1,
0.6619729, 0.6195094, 0.5627223, 1, 1, 1, 1, 1,
0.6629924, 0.9990599, 0.4497966, 1, 1, 1, 1, 1,
0.68157, 0.9429918, 1.047901, 1, 1, 1, 1, 1,
0.6862643, -0.4975094, 0.7558941, 0, 0, 1, 1, 1,
0.6932529, 0.6735713, 1.257584, 1, 0, 0, 1, 1,
0.6937333, 0.06484893, 1.806559, 1, 0, 0, 1, 1,
0.6958174, 0.8945016, 0.02333253, 1, 0, 0, 1, 1,
0.6963894, -0.1677875, 2.2831, 1, 0, 0, 1, 1,
0.7020462, -1.913976, 2.904148, 1, 0, 0, 1, 1,
0.7034565, 1.152185, 2.598834, 0, 0, 0, 1, 1,
0.7049282, 1.868938, -0.9475735, 0, 0, 0, 1, 1,
0.7117834, 0.233191, 0.1969956, 0, 0, 0, 1, 1,
0.7147714, 1.285687, 0.5874884, 0, 0, 0, 1, 1,
0.715655, 0.6140392, 0.7998278, 0, 0, 0, 1, 1,
0.7173249, 1.092908, 1.003655, 0, 0, 0, 1, 1,
0.7197331, 0.2799099, 1.871377, 0, 0, 0, 1, 1,
0.7240529, 1.132125, 1.997452, 1, 1, 1, 1, 1,
0.727119, 0.4191509, -0.2164314, 1, 1, 1, 1, 1,
0.731644, 1.596563, 1.116791, 1, 1, 1, 1, 1,
0.7332858, 0.4819397, -0.02558901, 1, 1, 1, 1, 1,
0.7451361, -0.924427, 2.763844, 1, 1, 1, 1, 1,
0.7506273, -2.079661, 0.3444403, 1, 1, 1, 1, 1,
0.7515131, 1.001358, 0.05857168, 1, 1, 1, 1, 1,
0.7556961, -1.131187, 2.062665, 1, 1, 1, 1, 1,
0.7569591, 1.373409, 0.6717193, 1, 1, 1, 1, 1,
0.7832305, -0.3909988, 1.965455, 1, 1, 1, 1, 1,
0.7834091, 0.2384601, 0.1958532, 1, 1, 1, 1, 1,
0.7836385, 0.4624302, -0.5321159, 1, 1, 1, 1, 1,
0.7856976, -0.3411045, 2.930963, 1, 1, 1, 1, 1,
0.7875481, 1.207628, 1.033672, 1, 1, 1, 1, 1,
0.7961406, 0.7664691, 0.4520834, 1, 1, 1, 1, 1,
0.7999936, -0.7549533, 3.014577, 0, 0, 1, 1, 1,
0.8008031, 0.9689896, -0.823012, 1, 0, 0, 1, 1,
0.8033192, 1.085197, -0.1385425, 1, 0, 0, 1, 1,
0.803974, -1.181903, 2.356366, 1, 0, 0, 1, 1,
0.8059371, -1.060472, 1.228595, 1, 0, 0, 1, 1,
0.8059657, 0.4888594, 2.353064, 1, 0, 0, 1, 1,
0.8218988, -0.9077815, 2.53258, 0, 0, 0, 1, 1,
0.8343708, 0.6675953, 0.7883129, 0, 0, 0, 1, 1,
0.8364402, 0.4514173, 1.946482, 0, 0, 0, 1, 1,
0.8364457, -1.348288, 2.456006, 0, 0, 0, 1, 1,
0.8406482, -1.394312, 2.632412, 0, 0, 0, 1, 1,
0.8419015, 2.220623, 1.376349, 0, 0, 0, 1, 1,
0.8527886, -0.4757299, 1.028219, 0, 0, 0, 1, 1,
0.8529896, 0.849672, -0.9199947, 1, 1, 1, 1, 1,
0.8609717, 1.734983, 1.89737, 1, 1, 1, 1, 1,
0.8614215, 0.388569, 1.053602, 1, 1, 1, 1, 1,
0.8640481, -0.7570767, 2.072623, 1, 1, 1, 1, 1,
0.8655385, -0.5108271, 1.624137, 1, 1, 1, 1, 1,
0.8710752, 0.5293151, 1.45349, 1, 1, 1, 1, 1,
0.8723717, 0.0822758, 0.9491091, 1, 1, 1, 1, 1,
0.8755913, -0.6818658, 2.704963, 1, 1, 1, 1, 1,
0.8866253, 1.684149, -0.01360886, 1, 1, 1, 1, 1,
0.887113, 0.589931, 2.11985, 1, 1, 1, 1, 1,
0.8879887, -0.7957764, 1.704207, 1, 1, 1, 1, 1,
0.8892992, 1.251331, 0.6385821, 1, 1, 1, 1, 1,
0.8914701, -0.81577, 4.048071, 1, 1, 1, 1, 1,
0.891522, 1.55779, 0.4145278, 1, 1, 1, 1, 1,
0.8916059, 0.6714883, 0.007260268, 1, 1, 1, 1, 1,
0.8923067, 1.137419, -0.5460646, 0, 0, 1, 1, 1,
0.8966829, -1.040443, 3.012454, 1, 0, 0, 1, 1,
0.8998862, 0.5774828, 2.232937, 1, 0, 0, 1, 1,
0.9042969, 0.1359458, 0.7159565, 1, 0, 0, 1, 1,
0.905227, 0.04875903, -0.7912613, 1, 0, 0, 1, 1,
0.9060698, -0.2022822, 0.9697138, 1, 0, 0, 1, 1,
0.9063035, -0.7830817, 0.8239191, 0, 0, 0, 1, 1,
0.9069744, -1.006055, 3.448449, 0, 0, 0, 1, 1,
0.908637, 0.254419, -0.5473371, 0, 0, 0, 1, 1,
0.9109377, 1.034642, 1.191392, 0, 0, 0, 1, 1,
0.9117631, -0.7918039, 3.184646, 0, 0, 0, 1, 1,
0.9123179, 0.1376081, 3.276617, 0, 0, 0, 1, 1,
0.9127386, 0.3515533, -0.8311128, 0, 0, 0, 1, 1,
0.9156632, -1.379005, 1.639797, 1, 1, 1, 1, 1,
0.9265383, -0.8729141, 2.410761, 1, 1, 1, 1, 1,
0.9282321, 0.5844343, 2.312551, 1, 1, 1, 1, 1,
0.9430597, 0.6812407, 0.08866347, 1, 1, 1, 1, 1,
0.9433703, -0.73081, 2.51674, 1, 1, 1, 1, 1,
0.9454749, -0.1767188, 1.159672, 1, 1, 1, 1, 1,
0.9511671, -2.11273, 3.519865, 1, 1, 1, 1, 1,
0.9545673, 0.6853678, 0.3364421, 1, 1, 1, 1, 1,
0.9548575, -0.2109916, 2.346966, 1, 1, 1, 1, 1,
0.9561992, -0.7610099, 1.89019, 1, 1, 1, 1, 1,
0.9571846, -0.8100158, 1.728787, 1, 1, 1, 1, 1,
0.9574012, 0.8341292, -0.4774518, 1, 1, 1, 1, 1,
0.9578515, 0.05692509, 3.084903, 1, 1, 1, 1, 1,
0.9659457, -1.247484, 1.816708, 1, 1, 1, 1, 1,
0.966001, 2.508568, 1.494401, 1, 1, 1, 1, 1,
0.9670468, 1.456146, 1.733832, 0, 0, 1, 1, 1,
0.9705458, 1.343822, 0.3936342, 1, 0, 0, 1, 1,
0.9775688, -1.926596, 3.382563, 1, 0, 0, 1, 1,
0.9825765, -0.6607543, 1.898677, 1, 0, 0, 1, 1,
0.9886882, 0.4131764, 1.815978, 1, 0, 0, 1, 1,
0.9918826, -1.918093, 1.121878, 1, 0, 0, 1, 1,
0.9933043, -0.4343133, 1.843926, 0, 0, 0, 1, 1,
0.9949923, 0.03990988, 1.958768, 0, 0, 0, 1, 1,
0.9967807, 0.1140985, 1.316765, 0, 0, 0, 1, 1,
1.00215, -0.7729847, 1.446766, 0, 0, 0, 1, 1,
1.008047, 0.01513735, 3.172726, 0, 0, 0, 1, 1,
1.012527, 0.4108335, -0.3075372, 0, 0, 0, 1, 1,
1.019485, 0.317961, 0.1790058, 0, 0, 0, 1, 1,
1.03042, -0.4223608, 1.071074, 1, 1, 1, 1, 1,
1.032376, 0.1478542, 1.62612, 1, 1, 1, 1, 1,
1.042127, -0.02911814, 0.6964607, 1, 1, 1, 1, 1,
1.045728, 0.8866754, 0.2077522, 1, 1, 1, 1, 1,
1.053681, 0.4873971, 0.1446171, 1, 1, 1, 1, 1,
1.057535, -1.499048, 4.438401, 1, 1, 1, 1, 1,
1.061242, -0.4178242, 2.613056, 1, 1, 1, 1, 1,
1.062144, 0.08815898, -0.3672188, 1, 1, 1, 1, 1,
1.075112, -2.298635, 1.469273, 1, 1, 1, 1, 1,
1.07813, 1.456545, 1.688023, 1, 1, 1, 1, 1,
1.097286, -0.1293381, 0.4022754, 1, 1, 1, 1, 1,
1.09736, -1.130577, 4.519621, 1, 1, 1, 1, 1,
1.098156, 2.074698, -0.7178242, 1, 1, 1, 1, 1,
1.100798, -0.9367782, 1.747677, 1, 1, 1, 1, 1,
1.101895, 0.4706863, 1.904673, 1, 1, 1, 1, 1,
1.102116, -0.5667927, 3.181608, 0, 0, 1, 1, 1,
1.109461, 0.6967698, -0.2309663, 1, 0, 0, 1, 1,
1.114557, 0.4417962, 2.062646, 1, 0, 0, 1, 1,
1.120367, 0.9115146, 1.156808, 1, 0, 0, 1, 1,
1.122949, -1.452263, 0.1486075, 1, 0, 0, 1, 1,
1.131313, 0.02626837, 0.6340804, 1, 0, 0, 1, 1,
1.137972, -0.04780223, 3.658599, 0, 0, 0, 1, 1,
1.14523, 1.331185, 1.447336, 0, 0, 0, 1, 1,
1.148664, -1.155117, 2.320835, 0, 0, 0, 1, 1,
1.154793, 1.614647, 0.2032477, 0, 0, 0, 1, 1,
1.158846, -0.1175741, 1.656049, 0, 0, 0, 1, 1,
1.162863, -0.03492181, 1.708522, 0, 0, 0, 1, 1,
1.165973, 0.7535371, 0.6548813, 0, 0, 0, 1, 1,
1.16891, 1.166123, 0.09425819, 1, 1, 1, 1, 1,
1.172223, -1.53734, 2.461818, 1, 1, 1, 1, 1,
1.172916, 0.8201755, 1.586919, 1, 1, 1, 1, 1,
1.197937, 0.8825588, 0.3375006, 1, 1, 1, 1, 1,
1.201501, 0.6987253, 0.7897555, 1, 1, 1, 1, 1,
1.203924, 0.6369078, -0.01800414, 1, 1, 1, 1, 1,
1.207061, 0.8962569, 0.004998716, 1, 1, 1, 1, 1,
1.235503, -0.3808703, 0.4531879, 1, 1, 1, 1, 1,
1.241547, 0.07016503, 2.127596, 1, 1, 1, 1, 1,
1.255796, 0.6121519, 0.3419327, 1, 1, 1, 1, 1,
1.262241, 0.6322547, 1.962134, 1, 1, 1, 1, 1,
1.264928, 0.04758196, 3.154589, 1, 1, 1, 1, 1,
1.271326, 0.1719592, 2.637736, 1, 1, 1, 1, 1,
1.278237, 0.5490155, 1.769264, 1, 1, 1, 1, 1,
1.280096, 0.05040852, 2.612465, 1, 1, 1, 1, 1,
1.281532, -0.5577499, 1.173861, 0, 0, 1, 1, 1,
1.281544, 0.2609785, 1.750649, 1, 0, 0, 1, 1,
1.28494, 2.351375, -0.3585023, 1, 0, 0, 1, 1,
1.288677, -0.5256417, 1.930267, 1, 0, 0, 1, 1,
1.288966, 1.102765, 2.438675, 1, 0, 0, 1, 1,
1.295887, 1.90033, 0.1640989, 1, 0, 0, 1, 1,
1.302993, 1.501508, 0.109262, 0, 0, 0, 1, 1,
1.303936, 0.1187044, 0.6280711, 0, 0, 0, 1, 1,
1.304478, -0.002481181, 1.37698, 0, 0, 0, 1, 1,
1.305221, 0.489107, 0.9126442, 0, 0, 0, 1, 1,
1.322202, 0.215383, 1.781971, 0, 0, 0, 1, 1,
1.32374, 0.2913572, 3.098215, 0, 0, 0, 1, 1,
1.336308, -0.2936039, 0.66971, 0, 0, 0, 1, 1,
1.33701, 0.4776467, 1.600209, 1, 1, 1, 1, 1,
1.345281, -1.633805, 1.702033, 1, 1, 1, 1, 1,
1.351429, 1.872442, -1.137387, 1, 1, 1, 1, 1,
1.364741, 0.1722456, 1.435629, 1, 1, 1, 1, 1,
1.368674, -1.731546, 2.830338, 1, 1, 1, 1, 1,
1.38586, -0.2332387, 1.157572, 1, 1, 1, 1, 1,
1.393371, 0.1435212, 0.2794964, 1, 1, 1, 1, 1,
1.393883, 0.7859322, 3.094536, 1, 1, 1, 1, 1,
1.396785, 0.8038874, 1.205889, 1, 1, 1, 1, 1,
1.397288, -0.2177563, 3.229629, 1, 1, 1, 1, 1,
1.398554, 1.171095, -1.969893, 1, 1, 1, 1, 1,
1.403002, -1.355737, 2.241627, 1, 1, 1, 1, 1,
1.403222, -0.1978502, 0.4453534, 1, 1, 1, 1, 1,
1.404218, -1.222061, 4.005646, 1, 1, 1, 1, 1,
1.407632, -0.7097617, 1.542204, 1, 1, 1, 1, 1,
1.412613, 0.95363, 1.10836, 0, 0, 1, 1, 1,
1.421124, 0.7410095, 1.205513, 1, 0, 0, 1, 1,
1.424522, -0.05176572, 2.874243, 1, 0, 0, 1, 1,
1.42465, 0.2063732, 1.567172, 1, 0, 0, 1, 1,
1.42714, 0.2985972, 1.512716, 1, 0, 0, 1, 1,
1.443419, 0.5248145, 0.3213815, 1, 0, 0, 1, 1,
1.443585, -0.3267892, 1.512566, 0, 0, 0, 1, 1,
1.447817, -0.5313377, 2.082702, 0, 0, 0, 1, 1,
1.451909, -0.697603, 0.7446955, 0, 0, 0, 1, 1,
1.457344, -0.7278442, 3.023834, 0, 0, 0, 1, 1,
1.466572, 0.2914781, 0.9793586, 0, 0, 0, 1, 1,
1.46778, 0.05101492, 0.8887303, 0, 0, 0, 1, 1,
1.470838, 0.4386888, 0.86949, 0, 0, 0, 1, 1,
1.481062, -0.5567645, 2.911375, 1, 1, 1, 1, 1,
1.492453, -1.19776, 1.406962, 1, 1, 1, 1, 1,
1.499559, 0.4344144, 0.5184119, 1, 1, 1, 1, 1,
1.50751, -1.191572, 1.34716, 1, 1, 1, 1, 1,
1.508091, -1.291998, 4.068902, 1, 1, 1, 1, 1,
1.523485, -0.1896399, 2.610924, 1, 1, 1, 1, 1,
1.531731, -0.2449517, 1.402176, 1, 1, 1, 1, 1,
1.537193, -0.307739, 2.838518, 1, 1, 1, 1, 1,
1.539753, 0.06626117, 2.47003, 1, 1, 1, 1, 1,
1.544633, 0.778958, 3.869116, 1, 1, 1, 1, 1,
1.552465, 0.8676426, 1.344385, 1, 1, 1, 1, 1,
1.573983, -0.7538188, 2.744692, 1, 1, 1, 1, 1,
1.579022, 0.9462835, 0.6037979, 1, 1, 1, 1, 1,
1.592312, -1.289639, 3.660558, 1, 1, 1, 1, 1,
1.595266, -0.8950068, 1.784069, 1, 1, 1, 1, 1,
1.602735, 1.582838, 0.03069254, 0, 0, 1, 1, 1,
1.606577, -0.6815384, 1.098339, 1, 0, 0, 1, 1,
1.648867, 1.25472, 1.195706, 1, 0, 0, 1, 1,
1.652617, 1.262018, 0.6792517, 1, 0, 0, 1, 1,
1.655535, 1.200825, 0.3737178, 1, 0, 0, 1, 1,
1.664587, -0.5393801, 1.941744, 1, 0, 0, 1, 1,
1.671443, 1.951021, 1.747363, 0, 0, 0, 1, 1,
1.699318, 0.6452947, 1.930223, 0, 0, 0, 1, 1,
1.744061, -0.7226666, 0.7409245, 0, 0, 0, 1, 1,
1.785087, -1.5034, 2.144454, 0, 0, 0, 1, 1,
1.793074, 0.3204513, 0.4432156, 0, 0, 0, 1, 1,
1.794671, 0.3360333, 2.404613, 0, 0, 0, 1, 1,
1.802662, 0.04030331, 2.484552, 0, 0, 0, 1, 1,
1.805107, 1.128206, 0.09101121, 1, 1, 1, 1, 1,
1.809782, 0.8552235, 1.734213, 1, 1, 1, 1, 1,
1.837723, 1.148179, 1.770411, 1, 1, 1, 1, 1,
1.839404, -0.7103331, 2.717616, 1, 1, 1, 1, 1,
1.847147, -0.2538363, 2.013078, 1, 1, 1, 1, 1,
1.850869, 1.089929, 0.8423756, 1, 1, 1, 1, 1,
1.865216, -0.06177155, 2.365203, 1, 1, 1, 1, 1,
1.872839, -0.1918732, 2.24789, 1, 1, 1, 1, 1,
1.882841, -3.211955, 1.408368, 1, 1, 1, 1, 1,
1.886956, -0.1841216, 0.4195667, 1, 1, 1, 1, 1,
1.967226, 0.88759, 1.307389, 1, 1, 1, 1, 1,
1.979447, -1.508662, 2.374157, 1, 1, 1, 1, 1,
1.991534, -1.440463, 3.093958, 1, 1, 1, 1, 1,
2.010534, 0.3840207, 2.479969, 1, 1, 1, 1, 1,
2.020609, -0.07081483, 0.3470719, 1, 1, 1, 1, 1,
2.033656, -0.5685553, 2.950639, 0, 0, 1, 1, 1,
2.038547, 0.3246914, 1.910976, 1, 0, 0, 1, 1,
2.071107, -1.624953, 1.203874, 1, 0, 0, 1, 1,
2.123591, -0.6335472, 1.799367, 1, 0, 0, 1, 1,
2.138446, -1.926963, 2.588873, 1, 0, 0, 1, 1,
2.192139, 0.7047276, -1.035562, 1, 0, 0, 1, 1,
2.262601, 0.2054724, 0.08752712, 0, 0, 0, 1, 1,
2.31919, 1.404447, 0.01041082, 0, 0, 0, 1, 1,
2.367858, -1.18364, 2.265119, 0, 0, 0, 1, 1,
2.4066, 0.0588047, 1.840482, 0, 0, 0, 1, 1,
2.44626, -0.7688468, 2.213109, 0, 0, 0, 1, 1,
2.486537, -1.223338, 3.467215, 0, 0, 0, 1, 1,
2.511604, 1.298329, 0.8757548, 0, 0, 0, 1, 1,
2.558304, -0.348264, 0.4836855, 1, 1, 1, 1, 1,
2.615165, -0.6111972, 2.126675, 1, 1, 1, 1, 1,
2.639916, -1.190625, 3.013328, 1, 1, 1, 1, 1,
2.768395, -0.9726414, 2.914429, 1, 1, 1, 1, 1,
2.810857, -1.800853, 1.975177, 1, 1, 1, 1, 1,
2.881064, 2.077296, 2.428932, 1, 1, 1, 1, 1,
3.347271, 0.7364098, 0.04783832, 1, 1, 1, 1, 1
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
var radius = 10.60888;
var distance = 37.26324;
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
mvMatrix.translate( 0.04459119, 0.3084569, 0.1239829 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -37.26324);
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
