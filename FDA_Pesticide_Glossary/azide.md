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
-3.2249, 0.4706108, -1.896475, 1, 0, 0, 1,
-2.945535, -1.350766, -0.8470072, 1, 0.007843138, 0, 1,
-2.827882, 1.090147, -0.2796997, 1, 0.01176471, 0, 1,
-2.48655, -0.3740146, -1.772283, 1, 0.01960784, 0, 1,
-2.419024, 0.4329013, -1.946277, 1, 0.02352941, 0, 1,
-2.349692, 1.734578, -1.097029, 1, 0.03137255, 0, 1,
-2.335399, 1.418345, -1.514336, 1, 0.03529412, 0, 1,
-2.294263, 0.5219575, -2.197541, 1, 0.04313726, 0, 1,
-2.291995, 0.0008148893, -2.653971, 1, 0.04705882, 0, 1,
-2.254763, -1.199509, -2.346085, 1, 0.05490196, 0, 1,
-2.231102, 0.5318887, -4.272903, 1, 0.05882353, 0, 1,
-2.202409, 1.209957, -1.028336, 1, 0.06666667, 0, 1,
-2.123782, 0.3881246, -1.431878, 1, 0.07058824, 0, 1,
-2.119743, -1.184163, -2.961181, 1, 0.07843138, 0, 1,
-2.111656, 0.2534042, -1.477996, 1, 0.08235294, 0, 1,
-2.107773, 0.309917, -1.487229, 1, 0.09019608, 0, 1,
-2.093429, -0.7340479, -1.362759, 1, 0.09411765, 0, 1,
-2.071816, 0.5595459, -3.184034, 1, 0.1019608, 0, 1,
-2.042825, -0.1401295, -2.496522, 1, 0.1098039, 0, 1,
-2.034368, -0.7768039, -3.355525, 1, 0.1137255, 0, 1,
-2.025616, -1.632741, -2.223922, 1, 0.1215686, 0, 1,
-2.012894, 0.1007746, -2.93469, 1, 0.1254902, 0, 1,
-2.009794, 0.7255812, -1.506909, 1, 0.1333333, 0, 1,
-2.000054, -2.196729, -2.490773, 1, 0.1372549, 0, 1,
-1.949196, 0.9497063, -0.8201047, 1, 0.145098, 0, 1,
-1.937913, 0.768969, -1.746943, 1, 0.1490196, 0, 1,
-1.937278, 0.1864808, -1.449932, 1, 0.1568628, 0, 1,
-1.92853, -0.3572885, -1.345173, 1, 0.1607843, 0, 1,
-1.921453, 0.1908362, -1.522925, 1, 0.1686275, 0, 1,
-1.911971, 0.1439078, -2.29717, 1, 0.172549, 0, 1,
-1.909346, -0.144467, -2.607216, 1, 0.1803922, 0, 1,
-1.870256, 0.8594203, -0.1332217, 1, 0.1843137, 0, 1,
-1.863161, -0.1497877, -1.907296, 1, 0.1921569, 0, 1,
-1.847368, -1.070735, -3.433577, 1, 0.1960784, 0, 1,
-1.838505, -1.268965, -3.509784, 1, 0.2039216, 0, 1,
-1.791665, 0.9281226, -0.8092149, 1, 0.2117647, 0, 1,
-1.78043, 0.1842242, -1.944772, 1, 0.2156863, 0, 1,
-1.763705, -0.01121204, -1.536525, 1, 0.2235294, 0, 1,
-1.753127, 0.1776614, -1.549182, 1, 0.227451, 0, 1,
-1.736051, 0.1298704, -0.7278351, 1, 0.2352941, 0, 1,
-1.733045, 1.823827, 0.274748, 1, 0.2392157, 0, 1,
-1.725101, 0.736489, -0.516637, 1, 0.2470588, 0, 1,
-1.705284, 0.1755615, -3.124913, 1, 0.2509804, 0, 1,
-1.692285, -0.7385757, -0.0595571, 1, 0.2588235, 0, 1,
-1.682464, -1.748589, -2.81883, 1, 0.2627451, 0, 1,
-1.666975, -1.052375, -0.6985029, 1, 0.2705882, 0, 1,
-1.664474, -1.783473, -2.99321, 1, 0.2745098, 0, 1,
-1.645187, -1.365183, -2.644949, 1, 0.282353, 0, 1,
-1.64401, 0.141411, -1.905272, 1, 0.2862745, 0, 1,
-1.609536, 0.5276224, -3.543184, 1, 0.2941177, 0, 1,
-1.594436, -0.6232998, -1.797867, 1, 0.3019608, 0, 1,
-1.572592, -0.03683521, -1.071057, 1, 0.3058824, 0, 1,
-1.563329, -0.3266936, -2.868681, 1, 0.3137255, 0, 1,
-1.548492, -1.037159, -1.262314, 1, 0.3176471, 0, 1,
-1.543381, 0.5337177, -3.709853, 1, 0.3254902, 0, 1,
-1.539602, -0.4096399, -1.352689, 1, 0.3294118, 0, 1,
-1.536083, 0.2940488, -2.707835, 1, 0.3372549, 0, 1,
-1.522051, 0.1151872, 0.01995387, 1, 0.3411765, 0, 1,
-1.520834, 0.05029554, -0.2542626, 1, 0.3490196, 0, 1,
-1.520382, 0.6849824, -1.367313, 1, 0.3529412, 0, 1,
-1.516926, 0.7917664, -0.728056, 1, 0.3607843, 0, 1,
-1.512863, 0.5265537, -1.56848, 1, 0.3647059, 0, 1,
-1.511794, 0.413476, -0.5679621, 1, 0.372549, 0, 1,
-1.493983, 1.524829, -1.361868, 1, 0.3764706, 0, 1,
-1.471621, 1.096866, -0.8419296, 1, 0.3843137, 0, 1,
-1.463849, -0.157172, -1.501198, 1, 0.3882353, 0, 1,
-1.463419, 1.116247, -2.133109, 1, 0.3960784, 0, 1,
-1.461679, -0.6108299, -0.759949, 1, 0.4039216, 0, 1,
-1.456911, 0.5707128, 0.041489, 1, 0.4078431, 0, 1,
-1.446352, 0.5393772, 0.04870348, 1, 0.4156863, 0, 1,
-1.440519, -0.584681, -2.418427, 1, 0.4196078, 0, 1,
-1.439989, -2.842466, -2.306491, 1, 0.427451, 0, 1,
-1.433986, -0.4097261, 0.03559376, 1, 0.4313726, 0, 1,
-1.430281, 0.7365597, -2.256665, 1, 0.4392157, 0, 1,
-1.426107, -0.5266469, -1.622227, 1, 0.4431373, 0, 1,
-1.421758, 1.183897, -2.890457, 1, 0.4509804, 0, 1,
-1.40656, 0.3196536, -0.4652602, 1, 0.454902, 0, 1,
-1.405726, -0.8686544, -2.62032, 1, 0.4627451, 0, 1,
-1.398153, 0.1295497, -2.48914, 1, 0.4666667, 0, 1,
-1.379197, 0.6745837, -1.888771, 1, 0.4745098, 0, 1,
-1.376154, 0.2831319, -0.7766654, 1, 0.4784314, 0, 1,
-1.370538, -1.340122, -4.841277, 1, 0.4862745, 0, 1,
-1.3603, -0.3201502, -2.112679, 1, 0.4901961, 0, 1,
-1.351386, -1.567718, -3.092958, 1, 0.4980392, 0, 1,
-1.34117, -0.2479937, -2.732755, 1, 0.5058824, 0, 1,
-1.336073, -2.24112, -3.367236, 1, 0.509804, 0, 1,
-1.332084, -1.014066, -2.007666, 1, 0.5176471, 0, 1,
-1.331561, -0.6185709, -2.112467, 1, 0.5215687, 0, 1,
-1.331441, -1.626855, -3.319016, 1, 0.5294118, 0, 1,
-1.322575, 0.8188846, -1.146058, 1, 0.5333334, 0, 1,
-1.321415, -0.6435683, -0.8924283, 1, 0.5411765, 0, 1,
-1.320882, 0.7164283, -0.8127726, 1, 0.5450981, 0, 1,
-1.313141, 0.8862185, -1.152074, 1, 0.5529412, 0, 1,
-1.312188, -1.516732, -1.481368, 1, 0.5568628, 0, 1,
-1.30836, -0.3951592, -2.667322, 1, 0.5647059, 0, 1,
-1.304375, 0.281613, 0.4118685, 1, 0.5686275, 0, 1,
-1.294677, -1.705117, -2.386254, 1, 0.5764706, 0, 1,
-1.292011, -1.499243, -1.409754, 1, 0.5803922, 0, 1,
-1.273188, 0.9963501, 0.07611892, 1, 0.5882353, 0, 1,
-1.269518, -1.040828, -2.082101, 1, 0.5921569, 0, 1,
-1.268189, -0.5347976, -2.620031, 1, 0.6, 0, 1,
-1.2669, -1.884811, -2.754483, 1, 0.6078432, 0, 1,
-1.26658, -1.00102, -1.212854, 1, 0.6117647, 0, 1,
-1.266396, -0.1978268, -1.17681, 1, 0.6196079, 0, 1,
-1.260161, 1.802389, -0.6038426, 1, 0.6235294, 0, 1,
-1.257043, 0.7476206, -1.752049, 1, 0.6313726, 0, 1,
-1.250266, 0.3969179, -0.5150259, 1, 0.6352941, 0, 1,
-1.249499, 0.3600489, -1.376047, 1, 0.6431373, 0, 1,
-1.245157, -1.113809, -2.525712, 1, 0.6470588, 0, 1,
-1.241262, -0.5862093, -1.546255, 1, 0.654902, 0, 1,
-1.236569, -1.023716, -1.974948, 1, 0.6588235, 0, 1,
-1.230689, -1.135092, -3.951399, 1, 0.6666667, 0, 1,
-1.229574, -0.7898694, -3.589842, 1, 0.6705883, 0, 1,
-1.22874, -0.7870146, -2.860879, 1, 0.6784314, 0, 1,
-1.226771, 1.914404, 0.03193134, 1, 0.682353, 0, 1,
-1.226095, -0.006246232, -1.740389, 1, 0.6901961, 0, 1,
-1.226079, -0.7160828, -2.499082, 1, 0.6941177, 0, 1,
-1.219909, -0.2980146, -0.6362528, 1, 0.7019608, 0, 1,
-1.214842, 2.26635, -1.379712, 1, 0.7098039, 0, 1,
-1.207644, 1.5299, -1.804814, 1, 0.7137255, 0, 1,
-1.198566, -0.8699459, -2.455397, 1, 0.7215686, 0, 1,
-1.193952, -0.1813143, -0.541028, 1, 0.7254902, 0, 1,
-1.192054, -0.1517843, -1.79001, 1, 0.7333333, 0, 1,
-1.186166, 0.8498867, -3.045289, 1, 0.7372549, 0, 1,
-1.180902, -2.183626, -2.187878, 1, 0.7450981, 0, 1,
-1.175945, -0.01858472, -2.917515, 1, 0.7490196, 0, 1,
-1.172571, 0.2819935, -3.175977, 1, 0.7568628, 0, 1,
-1.169444, -0.1911055, -2.585686, 1, 0.7607843, 0, 1,
-1.167088, 0.8056853, 0.2713362, 1, 0.7686275, 0, 1,
-1.142968, -1.019545, -2.329642, 1, 0.772549, 0, 1,
-1.140204, 0.4775456, -2.453278, 1, 0.7803922, 0, 1,
-1.139239, -1.764829, -1.975947, 1, 0.7843137, 0, 1,
-1.139167, -1.554283, -2.314881, 1, 0.7921569, 0, 1,
-1.136817, 0.6646912, -2.090099, 1, 0.7960784, 0, 1,
-1.135543, -1.563413, -2.388164, 1, 0.8039216, 0, 1,
-1.128088, -0.1010557, -1.409969, 1, 0.8117647, 0, 1,
-1.127468, 0.9710712, -1.392399, 1, 0.8156863, 0, 1,
-1.126508, -0.04281435, -1.693363, 1, 0.8235294, 0, 1,
-1.121695, -1.363786, -5.078109, 1, 0.827451, 0, 1,
-1.112589, -0.03381668, -1.627261, 1, 0.8352941, 0, 1,
-1.096703, -1.455233, -2.291526, 1, 0.8392157, 0, 1,
-1.092169, -0.1315257, -0.09282745, 1, 0.8470588, 0, 1,
-1.087885, 0.5584402, -1.350493, 1, 0.8509804, 0, 1,
-1.074967, 0.9612084, -0.7745575, 1, 0.8588235, 0, 1,
-1.062363, -0.6638882, -1.615725, 1, 0.8627451, 0, 1,
-1.054801, -0.5974029, -1.751117, 1, 0.8705882, 0, 1,
-1.053578, 1.185507, -0.730457, 1, 0.8745098, 0, 1,
-1.049774, 0.8198107, -1.843529, 1, 0.8823529, 0, 1,
-1.049513, 0.7425085, 0.0506527, 1, 0.8862745, 0, 1,
-1.02563, 0.700246, -0.6048832, 1, 0.8941177, 0, 1,
-1.017124, 0.3787982, -0.07589655, 1, 0.8980392, 0, 1,
-1.009454, 0.6141143, -1.789642, 1, 0.9058824, 0, 1,
-1.002202, -2.02016, -1.070042, 1, 0.9137255, 0, 1,
-0.9956084, 0.4465277, 0.3598304, 1, 0.9176471, 0, 1,
-0.989396, 0.3098462, -2.522355, 1, 0.9254902, 0, 1,
-0.9886631, 0.6581835, -0.3534663, 1, 0.9294118, 0, 1,
-0.9880748, 0.6516948, 0.5727964, 1, 0.9372549, 0, 1,
-0.9872922, -0.7300361, -4.510228, 1, 0.9411765, 0, 1,
-0.9869552, 1.710897, -0.8101298, 1, 0.9490196, 0, 1,
-0.9865451, 1.27905, 0.5671692, 1, 0.9529412, 0, 1,
-0.9833382, -1.022072, -1.672862, 1, 0.9607843, 0, 1,
-0.9827401, 0.1255501, -1.128318, 1, 0.9647059, 0, 1,
-0.9776245, -2.164287, -3.942025, 1, 0.972549, 0, 1,
-0.9728056, 0.900131, -2.803355, 1, 0.9764706, 0, 1,
-0.9671849, 1.187703, -1.700135, 1, 0.9843137, 0, 1,
-0.9617035, -3.166899, -3.415749, 1, 0.9882353, 0, 1,
-0.9608285, -0.08053111, -2.865057, 1, 0.9960784, 0, 1,
-0.9551135, -0.9374843, -1.306423, 0.9960784, 1, 0, 1,
-0.9533603, 0.7666832, 0.6847627, 0.9921569, 1, 0, 1,
-0.9515492, 0.9500151, -0.2177299, 0.9843137, 1, 0, 1,
-0.9502323, 1.37585, -0.2664741, 0.9803922, 1, 0, 1,
-0.9468933, 0.2255252, -1.328666, 0.972549, 1, 0, 1,
-0.9435797, -1.012912, -2.797272, 0.9686275, 1, 0, 1,
-0.942736, 0.3770313, -1.322613, 0.9607843, 1, 0, 1,
-0.9409426, -0.5003861, -1.929414, 0.9568627, 1, 0, 1,
-0.9377875, -0.3895278, -1.418374, 0.9490196, 1, 0, 1,
-0.9373168, -0.2741796, -0.6910169, 0.945098, 1, 0, 1,
-0.9351428, -0.1681871, -0.2101503, 0.9372549, 1, 0, 1,
-0.9281521, -0.7104656, -2.076056, 0.9333333, 1, 0, 1,
-0.9201801, -0.3207984, -1.40789, 0.9254902, 1, 0, 1,
-0.8996446, -0.6014416, -2.890904, 0.9215686, 1, 0, 1,
-0.8702271, -0.909345, -1.036807, 0.9137255, 1, 0, 1,
-0.8538389, -1.265684, -1.862156, 0.9098039, 1, 0, 1,
-0.852771, -0.7041011, -2.534368, 0.9019608, 1, 0, 1,
-0.8520262, 0.3717435, -1.136886, 0.8941177, 1, 0, 1,
-0.8504795, -1.670079, -3.313016, 0.8901961, 1, 0, 1,
-0.847967, -0.9831134, -3.541294, 0.8823529, 1, 0, 1,
-0.8438511, -0.2313748, -2.418414, 0.8784314, 1, 0, 1,
-0.8430966, -0.7226661, 0.07299149, 0.8705882, 1, 0, 1,
-0.8386052, 1.15609, -2.360298, 0.8666667, 1, 0, 1,
-0.8242801, -0.1749057, -1.823176, 0.8588235, 1, 0, 1,
-0.8239151, 1.63462, 0.06761401, 0.854902, 1, 0, 1,
-0.8222746, 2.677136, 1.217777, 0.8470588, 1, 0, 1,
-0.8210273, 0.4530097, -1.337481, 0.8431373, 1, 0, 1,
-0.8095905, 1.693697, 1.024039, 0.8352941, 1, 0, 1,
-0.8069953, -1.740512, -0.4688945, 0.8313726, 1, 0, 1,
-0.8026935, 1.908301, -0.2300756, 0.8235294, 1, 0, 1,
-0.7877295, -2.325541, -2.194777, 0.8196079, 1, 0, 1,
-0.7867136, -0.5217872, -3.001131, 0.8117647, 1, 0, 1,
-0.7844961, -0.8494811, -2.817847, 0.8078431, 1, 0, 1,
-0.7725712, -1.627298, -2.100132, 0.8, 1, 0, 1,
-0.7723788, -0.2341332, -3.125572, 0.7921569, 1, 0, 1,
-0.77141, 0.5772023, -3.109716, 0.7882353, 1, 0, 1,
-0.7703118, 1.103969, -0.3774665, 0.7803922, 1, 0, 1,
-0.7698538, 0.8037404, 0.02794643, 0.7764706, 1, 0, 1,
-0.763219, -0.2560715, -3.234509, 0.7686275, 1, 0, 1,
-0.7598387, 0.5647894, 0.6207997, 0.7647059, 1, 0, 1,
-0.7595101, 0.07855706, -0.988775, 0.7568628, 1, 0, 1,
-0.7585228, -0.04430978, -0.5493934, 0.7529412, 1, 0, 1,
-0.755171, -1.653346, -2.371637, 0.7450981, 1, 0, 1,
-0.7539149, -0.9169903, -3.491264, 0.7411765, 1, 0, 1,
-0.7452847, 0.8973857, -1.918715, 0.7333333, 1, 0, 1,
-0.7450333, -1.129498, -3.549778, 0.7294118, 1, 0, 1,
-0.744226, -1.122754, -1.528546, 0.7215686, 1, 0, 1,
-0.7421257, -1.151391, -1.752049, 0.7176471, 1, 0, 1,
-0.7417657, 0.2424131, -0.619855, 0.7098039, 1, 0, 1,
-0.7330137, -0.9145385, -3.929605, 0.7058824, 1, 0, 1,
-0.7277575, -1.498961, -2.411176, 0.6980392, 1, 0, 1,
-0.7165154, 0.2823001, -2.104074, 0.6901961, 1, 0, 1,
-0.7090104, 2.135265, -1.567115, 0.6862745, 1, 0, 1,
-0.7084535, -1.70741, -3.21461, 0.6784314, 1, 0, 1,
-0.703968, 0.6133865, -0.8186743, 0.6745098, 1, 0, 1,
-0.6976646, -0.2847109, -1.236678, 0.6666667, 1, 0, 1,
-0.6939394, 0.5100868, -1.05212, 0.6627451, 1, 0, 1,
-0.6939232, 1.388094, -0.118249, 0.654902, 1, 0, 1,
-0.6912936, 0.4725571, -1.302566, 0.6509804, 1, 0, 1,
-0.6902183, 1.305817, 0.1819821, 0.6431373, 1, 0, 1,
-0.6861016, 1.158136, -0.7093763, 0.6392157, 1, 0, 1,
-0.6838137, -0.1851312, -1.542836, 0.6313726, 1, 0, 1,
-0.68175, -0.6010438, -2.08918, 0.627451, 1, 0, 1,
-0.6809781, -1.296638, -4.569448, 0.6196079, 1, 0, 1,
-0.679814, 0.7249113, -2.281873, 0.6156863, 1, 0, 1,
-0.6794049, -0.651616, -1.637714, 0.6078432, 1, 0, 1,
-0.6750195, 0.408646, -1.441175, 0.6039216, 1, 0, 1,
-0.6717741, -0.7468109, -3.834023, 0.5960785, 1, 0, 1,
-0.6702908, -0.9827444, -3.042776, 0.5882353, 1, 0, 1,
-0.6691725, -0.9935228, -2.847187, 0.5843138, 1, 0, 1,
-0.667248, 0.6303511, 1.556224, 0.5764706, 1, 0, 1,
-0.6667314, -0.7845686, -2.559434, 0.572549, 1, 0, 1,
-0.6638213, -0.5772667, -2.706853, 0.5647059, 1, 0, 1,
-0.6599138, -0.1625866, -3.260605, 0.5607843, 1, 0, 1,
-0.6597021, 0.5076173, -1.160396, 0.5529412, 1, 0, 1,
-0.6593761, 0.003136721, -1.793945, 0.5490196, 1, 0, 1,
-0.6590093, -1.062369, -3.607666, 0.5411765, 1, 0, 1,
-0.6535127, -0.6623778, -2.071957, 0.5372549, 1, 0, 1,
-0.6342443, -0.268241, -1.633457, 0.5294118, 1, 0, 1,
-0.6259283, 1.444854, -1.566682, 0.5254902, 1, 0, 1,
-0.6238519, -1.752536, -2.575742, 0.5176471, 1, 0, 1,
-0.6228995, -0.6385674, -1.786877, 0.5137255, 1, 0, 1,
-0.6207468, -0.4141936, -1.023242, 0.5058824, 1, 0, 1,
-0.6185126, 0.2503549, -2.222358, 0.5019608, 1, 0, 1,
-0.6136566, 2.606214, -0.9854316, 0.4941176, 1, 0, 1,
-0.6120273, 2.050997, 0.703641, 0.4862745, 1, 0, 1,
-0.6089383, -0.140982, -2.793389, 0.4823529, 1, 0, 1,
-0.6079428, -0.6249576, -0.3903716, 0.4745098, 1, 0, 1,
-0.6064223, -0.5810293, -2.388049, 0.4705882, 1, 0, 1,
-0.6062202, 0.7497429, 0.733608, 0.4627451, 1, 0, 1,
-0.602517, -1.795767, -3.035458, 0.4588235, 1, 0, 1,
-0.5999886, 0.5918419, -0.6612009, 0.4509804, 1, 0, 1,
-0.598824, -0.6295397, -0.9315096, 0.4470588, 1, 0, 1,
-0.5986539, -0.9539748, -0.5985021, 0.4392157, 1, 0, 1,
-0.5977487, -0.08860502, -0.8797093, 0.4352941, 1, 0, 1,
-0.5952619, -0.2039155, -1.659614, 0.427451, 1, 0, 1,
-0.5926681, 0.4478635, -2.210142, 0.4235294, 1, 0, 1,
-0.5897369, -0.2247344, -2.182889, 0.4156863, 1, 0, 1,
-0.58738, 0.01878753, -2.908772, 0.4117647, 1, 0, 1,
-0.5870676, -1.324929, -3.022979, 0.4039216, 1, 0, 1,
-0.5845324, -0.4595319, -2.486238, 0.3960784, 1, 0, 1,
-0.570559, -0.5189874, -2.252493, 0.3921569, 1, 0, 1,
-0.5702065, -0.5829738, -3.935402, 0.3843137, 1, 0, 1,
-0.5669174, -0.1171681, -1.853414, 0.3803922, 1, 0, 1,
-0.5660847, 0.5780554, -0.5381571, 0.372549, 1, 0, 1,
-0.5651314, 0.9586413, 0.5648804, 0.3686275, 1, 0, 1,
-0.5636067, -1.621992, -1.671063, 0.3607843, 1, 0, 1,
-0.5630218, 0.5716712, 0.5175403, 0.3568628, 1, 0, 1,
-0.5518886, 0.1075515, -1.033483, 0.3490196, 1, 0, 1,
-0.5484778, 0.7815586, -1.541587, 0.345098, 1, 0, 1,
-0.5484757, 0.08875977, -0.6177304, 0.3372549, 1, 0, 1,
-0.5462511, -0.5351156, -1.394358, 0.3333333, 1, 0, 1,
-0.5452289, -0.3555121, -2.133742, 0.3254902, 1, 0, 1,
-0.5450936, 0.9233043, -0.783296, 0.3215686, 1, 0, 1,
-0.5382043, 1.215485, -1.025711, 0.3137255, 1, 0, 1,
-0.5361218, 0.01609168, -2.547914, 0.3098039, 1, 0, 1,
-0.5356593, 1.526868, 1.632454, 0.3019608, 1, 0, 1,
-0.5317488, -0.1408825, -1.319202, 0.2941177, 1, 0, 1,
-0.5254209, -0.211339, -2.564488, 0.2901961, 1, 0, 1,
-0.5145983, 0.9326542, -2.429245, 0.282353, 1, 0, 1,
-0.508681, -0.1437452, -2.176061, 0.2784314, 1, 0, 1,
-0.5085347, -0.7307582, -2.260318, 0.2705882, 1, 0, 1,
-0.5066872, 0.8901597, 0.6165867, 0.2666667, 1, 0, 1,
-0.5065281, -2.109848, -4.130432, 0.2588235, 1, 0, 1,
-0.5034307, -0.3366779, -1.943043, 0.254902, 1, 0, 1,
-0.4993115, -0.1059202, -2.591413, 0.2470588, 1, 0, 1,
-0.4977251, -1.669486, -3.174903, 0.2431373, 1, 0, 1,
-0.4973773, -0.6960484, -2.71311, 0.2352941, 1, 0, 1,
-0.4947163, 1.800607, -1.715959, 0.2313726, 1, 0, 1,
-0.4925737, -0.1528206, 0.0538134, 0.2235294, 1, 0, 1,
-0.4882311, -0.00556368, -1.176645, 0.2196078, 1, 0, 1,
-0.4864351, -0.6829472, -2.771262, 0.2117647, 1, 0, 1,
-0.4821796, -0.7350411, -3.563067, 0.2078431, 1, 0, 1,
-0.4820877, -0.08500703, -3.101906, 0.2, 1, 0, 1,
-0.4779103, -0.1210684, 0.178326, 0.1921569, 1, 0, 1,
-0.4763145, 0.5232313, 1.451875, 0.1882353, 1, 0, 1,
-0.4730258, -1.280379, -2.329282, 0.1803922, 1, 0, 1,
-0.4702118, 1.112818, 0.5716616, 0.1764706, 1, 0, 1,
-0.4680344, -0.6695701, -2.49189, 0.1686275, 1, 0, 1,
-0.4652936, -0.2937272, -1.754846, 0.1647059, 1, 0, 1,
-0.4650275, -1.977144, -1.73139, 0.1568628, 1, 0, 1,
-0.45842, -1.316875, -3.421268, 0.1529412, 1, 0, 1,
-0.4580432, -1.092162, -2.927245, 0.145098, 1, 0, 1,
-0.4570611, -0.6864362, -2.995502, 0.1411765, 1, 0, 1,
-0.4561466, 0.2310376, -0.6933165, 0.1333333, 1, 0, 1,
-0.4535813, 0.0325037, -1.146705, 0.1294118, 1, 0, 1,
-0.4483088, -1.346763, -3.754434, 0.1215686, 1, 0, 1,
-0.4377631, 1.573816, -0.9424345, 0.1176471, 1, 0, 1,
-0.4337146, 1.687416, 0.4885926, 0.1098039, 1, 0, 1,
-0.4333141, 0.6730777, -2.091396, 0.1058824, 1, 0, 1,
-0.4328983, -0.5753827, -2.261322, 0.09803922, 1, 0, 1,
-0.4307134, -0.495871, -1.436735, 0.09019608, 1, 0, 1,
-0.4234519, -2.358655, -3.321144, 0.08627451, 1, 0, 1,
-0.4222015, 1.063265, -1.796617, 0.07843138, 1, 0, 1,
-0.421441, -0.3147597, -2.261191, 0.07450981, 1, 0, 1,
-0.4204117, -0.7527463, -3.302307, 0.06666667, 1, 0, 1,
-0.418465, -0.04937113, -1.474711, 0.0627451, 1, 0, 1,
-0.4106052, 0.7580923, -1.72198, 0.05490196, 1, 0, 1,
-0.40833, -0.6332654, -2.278011, 0.05098039, 1, 0, 1,
-0.4079255, 0.5675768, 0.2190759, 0.04313726, 1, 0, 1,
-0.4066678, -2.008893, -2.277081, 0.03921569, 1, 0, 1,
-0.4059396, 1.237213, -0.5324636, 0.03137255, 1, 0, 1,
-0.4022337, -1.395882, -0.9983414, 0.02745098, 1, 0, 1,
-0.4019943, 0.6116408, -0.1005684, 0.01960784, 1, 0, 1,
-0.4012554, -1.302287, -1.020149, 0.01568628, 1, 0, 1,
-0.3982266, -0.1679128, -3.361049, 0.007843138, 1, 0, 1,
-0.3958881, 0.1369721, -0.3461052, 0.003921569, 1, 0, 1,
-0.3904032, -0.4787029, -1.740967, 0, 1, 0.003921569, 1,
-0.3868661, 0.05864377, -1.896774, 0, 1, 0.01176471, 1,
-0.3830284, 1.238513, 1.211992, 0, 1, 0.01568628, 1,
-0.3731069, -1.124003, -3.308569, 0, 1, 0.02352941, 1,
-0.3706855, 1.145004, 0.105541, 0, 1, 0.02745098, 1,
-0.3704697, 0.7367262, 0.5026319, 0, 1, 0.03529412, 1,
-0.369357, -0.6453038, -2.967553, 0, 1, 0.03921569, 1,
-0.3688687, 0.6843253, 0.09282125, 0, 1, 0.04705882, 1,
-0.3674204, -1.805822, -4.404677, 0, 1, 0.05098039, 1,
-0.367026, -0.0280824, -1.214723, 0, 1, 0.05882353, 1,
-0.3670102, -1.75278, -2.238878, 0, 1, 0.0627451, 1,
-0.3587899, -1.406127, -3.302935, 0, 1, 0.07058824, 1,
-0.3568177, 0.8754422, -0.6753418, 0, 1, 0.07450981, 1,
-0.3518294, -0.3274625, -0.7217969, 0, 1, 0.08235294, 1,
-0.3494917, 0.1648958, -0.1506768, 0, 1, 0.08627451, 1,
-0.3441715, -1.308178, -2.809038, 0, 1, 0.09411765, 1,
-0.3425734, -0.9165138, -1.082104, 0, 1, 0.1019608, 1,
-0.3421879, 0.6464664, -0.2002402, 0, 1, 0.1058824, 1,
-0.3370881, -0.3028328, -2.028649, 0, 1, 0.1137255, 1,
-0.3253885, 0.7832844, -1.590144, 0, 1, 0.1176471, 1,
-0.3232407, -0.4751484, -2.568247, 0, 1, 0.1254902, 1,
-0.3207991, 0.03637053, -1.455628, 0, 1, 0.1294118, 1,
-0.3194575, -0.1329628, 0.2281088, 0, 1, 0.1372549, 1,
-0.314537, 1.969819, -0.7826558, 0, 1, 0.1411765, 1,
-0.3116418, -0.511071, -2.440675, 0, 1, 0.1490196, 1,
-0.310562, -1.37999, -2.20601, 0, 1, 0.1529412, 1,
-0.3055196, 0.7371156, 0.4465872, 0, 1, 0.1607843, 1,
-0.3002834, 0.4784444, 0.2560057, 0, 1, 0.1647059, 1,
-0.2953057, 1.915791, 0.09775168, 0, 1, 0.172549, 1,
-0.2933437, -0.8073189, -2.403005, 0, 1, 0.1764706, 1,
-0.2922849, -0.4469127, -3.591314, 0, 1, 0.1843137, 1,
-0.2900889, 1.007536, -1.117814, 0, 1, 0.1882353, 1,
-0.2893561, 0.9514806, 0.690027, 0, 1, 0.1960784, 1,
-0.2876228, 0.6057569, -1.351394, 0, 1, 0.2039216, 1,
-0.2844626, -0.04751694, -0.6043824, 0, 1, 0.2078431, 1,
-0.2840634, -0.7021577, -3.48357, 0, 1, 0.2156863, 1,
-0.2814811, -1.47742, -3.253179, 0, 1, 0.2196078, 1,
-0.278217, 0.1893284, -2.436661, 0, 1, 0.227451, 1,
-0.2777876, -0.8011566, -1.97501, 0, 1, 0.2313726, 1,
-0.2723588, 0.2631093, -1.878974, 0, 1, 0.2392157, 1,
-0.2650393, 1.010457, -1.934308, 0, 1, 0.2431373, 1,
-0.2632334, -0.1220401, -1.064055, 0, 1, 0.2509804, 1,
-0.2632248, 1.303913, 0.35647, 0, 1, 0.254902, 1,
-0.2611991, -0.8603431, -2.524738, 0, 1, 0.2627451, 1,
-0.2594408, -0.7402424, -3.09717, 0, 1, 0.2666667, 1,
-0.2584568, -0.9838952, -3.559482, 0, 1, 0.2745098, 1,
-0.2575643, -0.7902063, -3.323609, 0, 1, 0.2784314, 1,
-0.2491711, 0.9315923, -0.8405426, 0, 1, 0.2862745, 1,
-0.248377, -0.6489031, -0.9825245, 0, 1, 0.2901961, 1,
-0.2468394, -0.1195829, -1.272948, 0, 1, 0.2980392, 1,
-0.2461429, 0.9498619, -1.036841, 0, 1, 0.3058824, 1,
-0.2448585, -1.325246, -3.351203, 0, 1, 0.3098039, 1,
-0.2424786, -0.6642807, -3.13568, 0, 1, 0.3176471, 1,
-0.2424298, 1.400439, 0.07258935, 0, 1, 0.3215686, 1,
-0.2424282, 1.118636, -0.007991386, 0, 1, 0.3294118, 1,
-0.2419834, -0.4185417, -1.957775, 0, 1, 0.3333333, 1,
-0.2414867, -0.5958393, -2.254604, 0, 1, 0.3411765, 1,
-0.2384012, -0.3413259, -4.827501, 0, 1, 0.345098, 1,
-0.2357268, -0.6661057, -1.852735, 0, 1, 0.3529412, 1,
-0.232947, -0.6107346, -2.662146, 0, 1, 0.3568628, 1,
-0.232298, -2.118181, -1.297031, 0, 1, 0.3647059, 1,
-0.2321699, -0.3074274, -2.634611, 0, 1, 0.3686275, 1,
-0.2262122, 0.9074665, -1.05356, 0, 1, 0.3764706, 1,
-0.2258045, 0.1995561, -0.6965753, 0, 1, 0.3803922, 1,
-0.2227443, 0.7551348, -2.466779, 0, 1, 0.3882353, 1,
-0.2216408, 0.5929972, -0.2336882, 0, 1, 0.3921569, 1,
-0.2207821, 0.9477333, -0.7881294, 0, 1, 0.4, 1,
-0.2179377, 1.485545, 0.5051469, 0, 1, 0.4078431, 1,
-0.2166198, 1.107833, 0.3996781, 0, 1, 0.4117647, 1,
-0.211189, -0.6903558, -2.061105, 0, 1, 0.4196078, 1,
-0.2084211, 0.1139943, -1.028206, 0, 1, 0.4235294, 1,
-0.2073121, -1.449577, -2.796429, 0, 1, 0.4313726, 1,
-0.2031787, 0.1526818, 1.05432, 0, 1, 0.4352941, 1,
-0.2011984, -0.1685573, -2.51963, 0, 1, 0.4431373, 1,
-0.1985194, 0.4588999, 0.1875424, 0, 1, 0.4470588, 1,
-0.1975115, 0.746742, 0.4590872, 0, 1, 0.454902, 1,
-0.1941086, 0.340845, -1.081766, 0, 1, 0.4588235, 1,
-0.1921628, 0.4430586, -1.758008, 0, 1, 0.4666667, 1,
-0.1903886, -0.8836849, -1.996437, 0, 1, 0.4705882, 1,
-0.189518, -0.5136163, -3.877185, 0, 1, 0.4784314, 1,
-0.1868018, 1.095771, -0.7454098, 0, 1, 0.4823529, 1,
-0.1804553, -1.387022, -2.6203, 0, 1, 0.4901961, 1,
-0.1762781, 1.109682, -1.228418, 0, 1, 0.4941176, 1,
-0.1744755, -1.74377, -1.876327, 0, 1, 0.5019608, 1,
-0.1719562, 0.6739401, -0.6793178, 0, 1, 0.509804, 1,
-0.171179, -0.3924703, -3.377465, 0, 1, 0.5137255, 1,
-0.1678165, 0.2669781, 0.206188, 0, 1, 0.5215687, 1,
-0.1630054, 0.3697244, -1.88754, 0, 1, 0.5254902, 1,
-0.1614002, -0.2747914, -1.762027, 0, 1, 0.5333334, 1,
-0.1592992, 1.664342, -0.2159736, 0, 1, 0.5372549, 1,
-0.1585559, 1.201377, -0.4804217, 0, 1, 0.5450981, 1,
-0.1551348, 0.5122942, -0.3363638, 0, 1, 0.5490196, 1,
-0.1543893, -0.06212244, -1.074075, 0, 1, 0.5568628, 1,
-0.1516595, 0.0002448008, -1.59953, 0, 1, 0.5607843, 1,
-0.1506146, -1.662967, -1.866979, 0, 1, 0.5686275, 1,
-0.1449528, 0.2698448, -1.60083, 0, 1, 0.572549, 1,
-0.1397717, 0.07937145, -0.6897435, 0, 1, 0.5803922, 1,
-0.1324883, 1.057594, 0.8776188, 0, 1, 0.5843138, 1,
-0.1159981, 1.4442, 0.5285658, 0, 1, 0.5921569, 1,
-0.1113105, 0.7695201, 0.8020927, 0, 1, 0.5960785, 1,
-0.1112545, -0.3439889, -4.203519, 0, 1, 0.6039216, 1,
-0.1085048, -0.3709368, -2.970301, 0, 1, 0.6117647, 1,
-0.1062625, -0.9369166, -2.595898, 0, 1, 0.6156863, 1,
-0.1049956, -1.652552, -2.796035, 0, 1, 0.6235294, 1,
-0.1043574, -1.131371, -3.797254, 0, 1, 0.627451, 1,
-0.1029627, 2.169708, -0.2093184, 0, 1, 0.6352941, 1,
-0.1021287, -1.877804, -3.225124, 0, 1, 0.6392157, 1,
-0.1018332, -0.3709921, -2.595961, 0, 1, 0.6470588, 1,
-0.1009846, -0.4051747, -2.099414, 0, 1, 0.6509804, 1,
-0.09641077, 0.8083187, -0.8372432, 0, 1, 0.6588235, 1,
-0.09597131, 0.3972938, 1.590883, 0, 1, 0.6627451, 1,
-0.09410364, 1.467063, -1.562322, 0, 1, 0.6705883, 1,
-0.0901455, -0.7333049, -4.174306, 0, 1, 0.6745098, 1,
-0.08713084, -0.3720331, -2.862296, 0, 1, 0.682353, 1,
-0.08679253, -0.5286618, -2.559129, 0, 1, 0.6862745, 1,
-0.0811161, -0.2812206, -2.241791, 0, 1, 0.6941177, 1,
-0.07583732, -1.21402, -2.751815, 0, 1, 0.7019608, 1,
-0.07552329, 1.335858, 0.4492719, 0, 1, 0.7058824, 1,
-0.07513687, 0.8714131, 1.526792, 0, 1, 0.7137255, 1,
-0.07421581, 0.3849483, -1.546416, 0, 1, 0.7176471, 1,
-0.0727387, 0.06435692, -2.166054, 0, 1, 0.7254902, 1,
-0.07173395, -1.063868, -3.298641, 0, 1, 0.7294118, 1,
-0.07173271, 1.150466, -2.189185, 0, 1, 0.7372549, 1,
-0.06869336, -0.220269, -1.310457, 0, 1, 0.7411765, 1,
-0.06320164, -0.4096292, -2.91138, 0, 1, 0.7490196, 1,
-0.0630139, -0.3923681, -3.53195, 0, 1, 0.7529412, 1,
-0.05876197, 0.4280685, 0.427423, 0, 1, 0.7607843, 1,
-0.05812157, -0.01119914, -1.907008, 0, 1, 0.7647059, 1,
-0.05758454, 0.8567705, 1.208098, 0, 1, 0.772549, 1,
-0.05620917, 0.2780761, 0.8977745, 0, 1, 0.7764706, 1,
-0.05575804, -1.164813, -1.760528, 0, 1, 0.7843137, 1,
-0.05382018, -0.4485677, -3.454155, 0, 1, 0.7882353, 1,
-0.05281037, 0.1550877, -0.2912852, 0, 1, 0.7960784, 1,
-0.05181989, 0.3761438, -0.6707869, 0, 1, 0.8039216, 1,
-0.05157026, -0.1625009, -1.821585, 0, 1, 0.8078431, 1,
-0.05012831, 0.4832385, -0.4773737, 0, 1, 0.8156863, 1,
-0.04972357, -0.2074344, -3.126542, 0, 1, 0.8196079, 1,
-0.04960556, -1.039377, -3.366141, 0, 1, 0.827451, 1,
-0.04589197, -0.1361559, -2.287495, 0, 1, 0.8313726, 1,
-0.03991909, 0.333012, 1.390125, 0, 1, 0.8392157, 1,
-0.03914255, 0.002023386, -0.4425597, 0, 1, 0.8431373, 1,
-0.03521442, -0.6194874, -3.480681, 0, 1, 0.8509804, 1,
-0.02743825, 0.3576204, -0.1971495, 0, 1, 0.854902, 1,
-0.02596727, -1.731419, -3.89771, 0, 1, 0.8627451, 1,
-0.02496551, 0.3578912, -1.453639, 0, 1, 0.8666667, 1,
-0.02341592, -3.014584, -3.569154, 0, 1, 0.8745098, 1,
-0.02332432, -1.39271, -2.935666, 0, 1, 0.8784314, 1,
-0.02323601, 0.4890335, 0.063295, 0, 1, 0.8862745, 1,
-0.02268673, 0.07885864, 0.6350467, 0, 1, 0.8901961, 1,
-0.02262625, -1.744604, -3.264013, 0, 1, 0.8980392, 1,
-0.01916798, 1.333311, -0.1717059, 0, 1, 0.9058824, 1,
-0.018575, -0.7162169, -4.414295, 0, 1, 0.9098039, 1,
-0.01816978, 1.078307, 0.6657919, 0, 1, 0.9176471, 1,
-0.005480811, -1.221845, -2.879922, 0, 1, 0.9215686, 1,
-0.005271816, 0.7843129, -1.18259, 0, 1, 0.9294118, 1,
-0.002562389, -0.1722824, -2.076573, 0, 1, 0.9333333, 1,
-0.001640378, -0.3130695, -2.999345, 0, 1, 0.9411765, 1,
0.0008438542, 0.357334, -1.314763, 0, 1, 0.945098, 1,
0.003225488, 1.046905, 0.1845466, 0, 1, 0.9529412, 1,
0.005419401, 0.3049752, 0.4925047, 0, 1, 0.9568627, 1,
0.009276588, 1.168874, 1.208259, 0, 1, 0.9647059, 1,
0.01413003, -0.6225337, 3.156877, 0, 1, 0.9686275, 1,
0.01902533, -0.8410335, 1.692892, 0, 1, 0.9764706, 1,
0.0209184, -0.4233629, 1.989008, 0, 1, 0.9803922, 1,
0.0238728, -1.286591, 2.78761, 0, 1, 0.9882353, 1,
0.03165352, 1.719636, 0.52006, 0, 1, 0.9921569, 1,
0.03473816, -2.004735, 4.110592, 0, 1, 1, 1,
0.04001567, 1.397608, -0.1781015, 0, 0.9921569, 1, 1,
0.04108999, -1.028942, 2.660882, 0, 0.9882353, 1, 1,
0.04138145, -0.1382897, 3.51919, 0, 0.9803922, 1, 1,
0.04138949, -0.0839208, 3.536111, 0, 0.9764706, 1, 1,
0.04212309, -0.1827298, 2.526048, 0, 0.9686275, 1, 1,
0.04432829, 0.05058624, 0.7187791, 0, 0.9647059, 1, 1,
0.04512857, -0.6873255, 1.896249, 0, 0.9568627, 1, 1,
0.04733227, -0.4029282, 5.739243, 0, 0.9529412, 1, 1,
0.04952371, -0.4303646, 2.539073, 0, 0.945098, 1, 1,
0.05212048, 0.3319474, 0.4988989, 0, 0.9411765, 1, 1,
0.05365882, -1.074058, 1.890746, 0, 0.9333333, 1, 1,
0.0547389, 1.232237, 1.116126, 0, 0.9294118, 1, 1,
0.0553642, -0.3961141, 1.486022, 0, 0.9215686, 1, 1,
0.06045395, -0.3896665, 5.216109, 0, 0.9176471, 1, 1,
0.06292903, -0.512942, 2.449553, 0, 0.9098039, 1, 1,
0.06440245, 0.5833715, 2.01097, 0, 0.9058824, 1, 1,
0.06665485, 1.312141, 0.4348987, 0, 0.8980392, 1, 1,
0.06943657, -0.2337381, 2.334979, 0, 0.8901961, 1, 1,
0.07463091, 0.3842486, 0.5984542, 0, 0.8862745, 1, 1,
0.08389833, 0.6077723, 0.7618423, 0, 0.8784314, 1, 1,
0.08698826, -1.130637, 2.365327, 0, 0.8745098, 1, 1,
0.08793907, -0.2845547, 2.206795, 0, 0.8666667, 1, 1,
0.09031083, -1.499299, 1.467423, 0, 0.8627451, 1, 1,
0.09492054, 0.03392509, 1.313969, 0, 0.854902, 1, 1,
0.09622071, 0.7662945, 0.88188, 0, 0.8509804, 1, 1,
0.09883913, 0.437057, 0.655866, 0, 0.8431373, 1, 1,
0.1031571, 0.3545582, -0.5345964, 0, 0.8392157, 1, 1,
0.1040638, -0.964836, 1.922205, 0, 0.8313726, 1, 1,
0.1043112, -0.1168635, 3.171518, 0, 0.827451, 1, 1,
0.1052064, -0.08761461, 3.478328, 0, 0.8196079, 1, 1,
0.1097718, -1.295931, 2.120342, 0, 0.8156863, 1, 1,
0.1098104, -1.06887, 1.949717, 0, 0.8078431, 1, 1,
0.1102533, -0.4507656, 3.798073, 0, 0.8039216, 1, 1,
0.1152037, 1.208879, -0.6938486, 0, 0.7960784, 1, 1,
0.1184081, 1.119852, -0.8032272, 0, 0.7882353, 1, 1,
0.1189507, -1.461166, 3.960176, 0, 0.7843137, 1, 1,
0.1206575, -1.468814, 2.465105, 0, 0.7764706, 1, 1,
0.1255536, 2.216461, 0.4514643, 0, 0.772549, 1, 1,
0.1257152, -0.4512748, 2.972, 0, 0.7647059, 1, 1,
0.1268323, -0.8173292, 3.617682, 0, 0.7607843, 1, 1,
0.1278685, -1.55947, 4.532688, 0, 0.7529412, 1, 1,
0.1326927, -0.6762242, 3.811858, 0, 0.7490196, 1, 1,
0.1350935, 0.5543637, 0.5347267, 0, 0.7411765, 1, 1,
0.1365302, -0.2250417, 2.346101, 0, 0.7372549, 1, 1,
0.1371923, -0.4516034, 3.518695, 0, 0.7294118, 1, 1,
0.1392415, -0.1003556, 2.402031, 0, 0.7254902, 1, 1,
0.1408681, 1.692308, 1.493454, 0, 0.7176471, 1, 1,
0.1466049, 0.09437031, 2.323246, 0, 0.7137255, 1, 1,
0.149444, 1.144155, -0.03179286, 0, 0.7058824, 1, 1,
0.1528808, -0.2266964, 3.423186, 0, 0.6980392, 1, 1,
0.1560493, -0.4661684, 2.168737, 0, 0.6941177, 1, 1,
0.1621787, 0.2622013, 0.5127664, 0, 0.6862745, 1, 1,
0.1630709, -0.1625643, 0.09583792, 0, 0.682353, 1, 1,
0.164555, 1.438218, -1.131014, 0, 0.6745098, 1, 1,
0.1649449, 0.3464983, -0.0004442181, 0, 0.6705883, 1, 1,
0.1653782, 0.2458521, 0.1290856, 0, 0.6627451, 1, 1,
0.1718203, 0.3478949, 1.934122, 0, 0.6588235, 1, 1,
0.1797137, 2.460315, -0.5343766, 0, 0.6509804, 1, 1,
0.1800503, -0.2878736, 0.594563, 0, 0.6470588, 1, 1,
0.183778, -0.3485025, 2.01972, 0, 0.6392157, 1, 1,
0.1848105, 2.885973, 0.5164139, 0, 0.6352941, 1, 1,
0.1854254, -0.5570828, 2.716113, 0, 0.627451, 1, 1,
0.1862855, -0.3825427, 3.562831, 0, 0.6235294, 1, 1,
0.1867504, -0.5406592, 4.126494, 0, 0.6156863, 1, 1,
0.1881896, -1.053592, 3.096466, 0, 0.6117647, 1, 1,
0.1896601, -0.5734296, 0.7170126, 0, 0.6039216, 1, 1,
0.1945813, 0.8653901, 2.327893, 0, 0.5960785, 1, 1,
0.1946097, -1.219932, 1.865909, 0, 0.5921569, 1, 1,
0.1976457, -0.0108954, 1.57176, 0, 0.5843138, 1, 1,
0.2007001, -0.7637268, 3.454191, 0, 0.5803922, 1, 1,
0.2048707, 1.114785, 1.362074, 0, 0.572549, 1, 1,
0.2054542, -1.562646, 1.57322, 0, 0.5686275, 1, 1,
0.2088148, 0.6923106, 0.414339, 0, 0.5607843, 1, 1,
0.2104595, -1.681614, 2.493268, 0, 0.5568628, 1, 1,
0.2108567, 1.789535, 1.129773, 0, 0.5490196, 1, 1,
0.2115569, -0.2909909, 1.647275, 0, 0.5450981, 1, 1,
0.2117608, -1.377372, 2.497262, 0, 0.5372549, 1, 1,
0.2121523, 0.7948641, 1.737642, 0, 0.5333334, 1, 1,
0.2180522, -0.05023635, 3.469544, 0, 0.5254902, 1, 1,
0.2180926, 0.9721317, 2.289268, 0, 0.5215687, 1, 1,
0.2190629, 0.7853584, 1.869022, 0, 0.5137255, 1, 1,
0.2215634, 0.2338554, 0.8435609, 0, 0.509804, 1, 1,
0.224642, -0.3714672, 3.914439, 0, 0.5019608, 1, 1,
0.2285744, 1.908443, -1.465669, 0, 0.4941176, 1, 1,
0.2338305, -1.277552, 2.295553, 0, 0.4901961, 1, 1,
0.2367259, 0.47953, 1.062357, 0, 0.4823529, 1, 1,
0.2367845, -0.1032819, 0.9998635, 0, 0.4784314, 1, 1,
0.2368283, 0.02771095, 2.050972, 0, 0.4705882, 1, 1,
0.2379059, 1.593384, 1.01632, 0, 0.4666667, 1, 1,
0.2390517, -2.190797, 2.154666, 0, 0.4588235, 1, 1,
0.2394453, -0.04530814, 0.1795229, 0, 0.454902, 1, 1,
0.2480595, 0.05019426, 1.288279, 0, 0.4470588, 1, 1,
0.2486868, -0.3964578, 2.740705, 0, 0.4431373, 1, 1,
0.2492506, -0.2563426, 2.152237, 0, 0.4352941, 1, 1,
0.2591076, -0.2679336, 3.838223, 0, 0.4313726, 1, 1,
0.2591217, 0.8549318, -0.1333319, 0, 0.4235294, 1, 1,
0.2609701, -1.284018, 3.311441, 0, 0.4196078, 1, 1,
0.2611614, 0.05095811, 1.434801, 0, 0.4117647, 1, 1,
0.2617452, 1.829463, 0.2102776, 0, 0.4078431, 1, 1,
0.2686088, -0.8789743, 2.550937, 0, 0.4, 1, 1,
0.2690931, -0.3325199, 2.325909, 0, 0.3921569, 1, 1,
0.2710506, 0.1218118, -0.5697824, 0, 0.3882353, 1, 1,
0.2717275, -0.285796, 2.730126, 0, 0.3803922, 1, 1,
0.2728411, 1.986731, -0.6123115, 0, 0.3764706, 1, 1,
0.2733339, 1.102091, 3.194433, 0, 0.3686275, 1, 1,
0.2786893, 0.7469087, 0.4106718, 0, 0.3647059, 1, 1,
0.2813832, -0.2684278, 1.453333, 0, 0.3568628, 1, 1,
0.2821034, 0.4750282, 0.7407489, 0, 0.3529412, 1, 1,
0.2857194, 0.2510628, 1.292765, 0, 0.345098, 1, 1,
0.2868161, 1.263415, 0.4707611, 0, 0.3411765, 1, 1,
0.2871289, -0.5568857, 3.873234, 0, 0.3333333, 1, 1,
0.2919744, 0.401372, 0.6837002, 0, 0.3294118, 1, 1,
0.2984422, -0.003922127, 0.7783813, 0, 0.3215686, 1, 1,
0.299996, -0.3418697, 2.181946, 0, 0.3176471, 1, 1,
0.3056359, 1.563403, -0.4212975, 0, 0.3098039, 1, 1,
0.306953, 0.8894231, 0.1308236, 0, 0.3058824, 1, 1,
0.3123365, 0.03105682, 1.783719, 0, 0.2980392, 1, 1,
0.3158444, 0.444335, -1.373036, 0, 0.2901961, 1, 1,
0.3161476, 0.6778102, 0.2069013, 0, 0.2862745, 1, 1,
0.3195084, -0.6522035, 1.377481, 0, 0.2784314, 1, 1,
0.3225121, -1.499513, 1.564031, 0, 0.2745098, 1, 1,
0.3233368, -2.770395, 3.599488, 0, 0.2666667, 1, 1,
0.3238516, -1.988146, 2.378091, 0, 0.2627451, 1, 1,
0.3265618, 0.3994004, 0.8339423, 0, 0.254902, 1, 1,
0.3344718, -0.4259419, 2.624939, 0, 0.2509804, 1, 1,
0.3354217, 0.9492969, -0.8524264, 0, 0.2431373, 1, 1,
0.3368303, -0.4067701, 1.392673, 0, 0.2392157, 1, 1,
0.3392576, 0.4757684, 1.994924, 0, 0.2313726, 1, 1,
0.3396737, 2.057734, -0.4990154, 0, 0.227451, 1, 1,
0.3424913, -0.8974478, 1.697876, 0, 0.2196078, 1, 1,
0.3441311, -0.08575763, 0.7016125, 0, 0.2156863, 1, 1,
0.3447297, -0.2345322, 2.053441, 0, 0.2078431, 1, 1,
0.34857, -0.1089887, 2.157208, 0, 0.2039216, 1, 1,
0.3514802, 0.7759749, -2.901972, 0, 0.1960784, 1, 1,
0.3524501, -0.3655852, 2.427635, 0, 0.1882353, 1, 1,
0.354268, -1.665432, 1.339495, 0, 0.1843137, 1, 1,
0.3558306, 0.5086598, -1.119636, 0, 0.1764706, 1, 1,
0.3558964, -0.882145, 2.40139, 0, 0.172549, 1, 1,
0.3570578, 1.566873, 1.539711, 0, 0.1647059, 1, 1,
0.3620268, 0.2521187, 1.710992, 0, 0.1607843, 1, 1,
0.3623395, -0.5690516, 2.11808, 0, 0.1529412, 1, 1,
0.3630057, 2.181697, -0.09606194, 0, 0.1490196, 1, 1,
0.3672867, -0.07797781, -0.2594827, 0, 0.1411765, 1, 1,
0.3698732, 0.001199691, 1.553669, 0, 0.1372549, 1, 1,
0.3703105, 1.23266, -1.105542, 0, 0.1294118, 1, 1,
0.3713246, 0.748559, -0.214433, 0, 0.1254902, 1, 1,
0.3716882, -1.672287, 2.758528, 0, 0.1176471, 1, 1,
0.3748884, 1.968403, -0.3259663, 0, 0.1137255, 1, 1,
0.3762788, 0.8474804, 0.2112471, 0, 0.1058824, 1, 1,
0.3807748, -0.03021003, 2.891268, 0, 0.09803922, 1, 1,
0.3823199, 0.8003917, 0.9474025, 0, 0.09411765, 1, 1,
0.3876567, 1.035432, -0.6909693, 0, 0.08627451, 1, 1,
0.3897524, -0.4176885, 3.115011, 0, 0.08235294, 1, 1,
0.3900159, -1.335125, 1.820248, 0, 0.07450981, 1, 1,
0.3921231, 1.435231, -0.8589206, 0, 0.07058824, 1, 1,
0.3925736, -1.180853, 2.277008, 0, 0.0627451, 1, 1,
0.3942727, -0.7229661, 1.670025, 0, 0.05882353, 1, 1,
0.3961134, 0.943558, 0.6953256, 0, 0.05098039, 1, 1,
0.3969141, 1.090569, -0.2806623, 0, 0.04705882, 1, 1,
0.4034586, -1.45396, 1.134913, 0, 0.03921569, 1, 1,
0.4037283, -1.670736, 2.923754, 0, 0.03529412, 1, 1,
0.404438, -0.8671095, 3.166553, 0, 0.02745098, 1, 1,
0.4058329, -0.2695252, 1.975789, 0, 0.02352941, 1, 1,
0.406517, -1.120012, 3.268097, 0, 0.01568628, 1, 1,
0.4094587, -0.1789769, 0.7646676, 0, 0.01176471, 1, 1,
0.4117808, -0.7753575, 3.273418, 0, 0.003921569, 1, 1,
0.4178287, 1.148376, -1.341242, 0.003921569, 0, 1, 1,
0.418771, -0.9159815, 1.847576, 0.007843138, 0, 1, 1,
0.4197829, 0.545987, 1.509539, 0.01568628, 0, 1, 1,
0.4205215, 0.60106, 0.03028913, 0.01960784, 0, 1, 1,
0.4227346, -1.648939, 2.8397, 0.02745098, 0, 1, 1,
0.4422737, 0.8210758, -0.2390675, 0.03137255, 0, 1, 1,
0.4452483, 1.014644, 1.677607, 0.03921569, 0, 1, 1,
0.4455853, 2.670848, 0.7285203, 0.04313726, 0, 1, 1,
0.4568994, -1.434954, 2.514446, 0.05098039, 0, 1, 1,
0.4584411, -0.1416381, 1.657566, 0.05490196, 0, 1, 1,
0.4631279, 1.804366, -1.747584, 0.0627451, 0, 1, 1,
0.4637779, 0.773011, 0.20689, 0.06666667, 0, 1, 1,
0.464652, 0.005898818, 3.63689, 0.07450981, 0, 1, 1,
0.4717131, 0.3989935, 1.860059, 0.07843138, 0, 1, 1,
0.4781429, 1.218322, 0.03104988, 0.08627451, 0, 1, 1,
0.4867078, -0.7734609, 2.265367, 0.09019608, 0, 1, 1,
0.4875967, 1.487517, 0.3445545, 0.09803922, 0, 1, 1,
0.4876323, 0.7342554, 0.9896876, 0.1058824, 0, 1, 1,
0.4888863, -0.6090264, 1.768106, 0.1098039, 0, 1, 1,
0.4888947, 0.2923636, -0.5241945, 0.1176471, 0, 1, 1,
0.490085, -0.3638263, 2.899593, 0.1215686, 0, 1, 1,
0.4903531, 2.423057, 1.211483, 0.1294118, 0, 1, 1,
0.4933131, -0.0240345, 3.813969, 0.1333333, 0, 1, 1,
0.494589, -0.5910019, 2.611471, 0.1411765, 0, 1, 1,
0.4953972, 1.314309, 0.3935198, 0.145098, 0, 1, 1,
0.4955985, -0.8660358, 2.620566, 0.1529412, 0, 1, 1,
0.4987852, 0.6502923, -0.9525518, 0.1568628, 0, 1, 1,
0.5065876, 1.889477, 0.2859572, 0.1647059, 0, 1, 1,
0.5111724, 2.191213, 0.3366389, 0.1686275, 0, 1, 1,
0.5125022, -0.2723685, 3.812814, 0.1764706, 0, 1, 1,
0.5139912, 0.6469457, -0.4055826, 0.1803922, 0, 1, 1,
0.5168358, 0.1521602, 2.266984, 0.1882353, 0, 1, 1,
0.519129, -0.851859, 1.858679, 0.1921569, 0, 1, 1,
0.5218365, -0.120704, 3.020885, 0.2, 0, 1, 1,
0.52832, -0.9870278, 3.095505, 0.2078431, 0, 1, 1,
0.5320899, 0.8009918, 2.173002, 0.2117647, 0, 1, 1,
0.5333869, 1.550432, 0.4819086, 0.2196078, 0, 1, 1,
0.5336667, -0.3161493, 2.098464, 0.2235294, 0, 1, 1,
0.5354413, -1.044599, 1.994973, 0.2313726, 0, 1, 1,
0.5355111, 0.7003787, -0.2109836, 0.2352941, 0, 1, 1,
0.5384022, -0.638876, 2.717406, 0.2431373, 0, 1, 1,
0.5486892, -0.7704794, 2.774612, 0.2470588, 0, 1, 1,
0.5489702, -1.072352, 2.253189, 0.254902, 0, 1, 1,
0.5594053, -0.7058343, 2.154405, 0.2588235, 0, 1, 1,
0.5599084, 0.2541723, 1.322765, 0.2666667, 0, 1, 1,
0.5609913, 1.679068, 2.119368, 0.2705882, 0, 1, 1,
0.5620035, 0.8470247, 1.36817, 0.2784314, 0, 1, 1,
0.5632424, -0.1254095, 1.282836, 0.282353, 0, 1, 1,
0.5683798, -0.5723966, 1.874375, 0.2901961, 0, 1, 1,
0.5727724, -0.6181682, 1.457271, 0.2941177, 0, 1, 1,
0.5758147, 0.2991683, -0.05478496, 0.3019608, 0, 1, 1,
0.5793714, -0.3822203, 3.846087, 0.3098039, 0, 1, 1,
0.5797687, -1.42293, 3.555514, 0.3137255, 0, 1, 1,
0.5843024, 0.3019744, 0.3845266, 0.3215686, 0, 1, 1,
0.5849523, -0.7787915, 2.142005, 0.3254902, 0, 1, 1,
0.5875951, -1.260757, 3.749883, 0.3333333, 0, 1, 1,
0.5886223, 0.9758623, 0.4839754, 0.3372549, 0, 1, 1,
0.5908782, -0.9316046, 2.49826, 0.345098, 0, 1, 1,
0.5928434, 2.221539, -0.1112518, 0.3490196, 0, 1, 1,
0.59543, -1.414744, 6.057894, 0.3568628, 0, 1, 1,
0.5968201, -1.137023, 5.35037, 0.3607843, 0, 1, 1,
0.6010861, -1.090363, 2.118356, 0.3686275, 0, 1, 1,
0.6024687, -0.4474163, 1.333963, 0.372549, 0, 1, 1,
0.6052002, 0.8537439, 1.357162, 0.3803922, 0, 1, 1,
0.6053631, -0.04417322, -0.2649362, 0.3843137, 0, 1, 1,
0.610702, 1.361879, 0.2645102, 0.3921569, 0, 1, 1,
0.6218216, 0.2866597, 0.2831721, 0.3960784, 0, 1, 1,
0.6221775, -1.188204, 0.6539328, 0.4039216, 0, 1, 1,
0.6223357, -0.00964099, 1.105211, 0.4117647, 0, 1, 1,
0.6316524, 1.117183, 0.3934859, 0.4156863, 0, 1, 1,
0.6330661, 0.7799335, -0.5893249, 0.4235294, 0, 1, 1,
0.6332519, -0.2321762, 3.59019, 0.427451, 0, 1, 1,
0.6376411, 0.3485602, -0.3316905, 0.4352941, 0, 1, 1,
0.638393, -0.1819837, 0.9524926, 0.4392157, 0, 1, 1,
0.6440436, 0.7611722, 0.1224735, 0.4470588, 0, 1, 1,
0.6447938, -2.037218, 3.77255, 0.4509804, 0, 1, 1,
0.6463413, 0.5733257, 0.2986653, 0.4588235, 0, 1, 1,
0.6463791, -0.6902934, 0.9155554, 0.4627451, 0, 1, 1,
0.652316, 0.4171435, 1.863054, 0.4705882, 0, 1, 1,
0.6590322, -1.079673, 3.71653, 0.4745098, 0, 1, 1,
0.6622701, 0.4571595, -0.7145764, 0.4823529, 0, 1, 1,
0.6678395, -0.5276102, 2.620694, 0.4862745, 0, 1, 1,
0.670711, -1.617392, 3.033132, 0.4941176, 0, 1, 1,
0.6772072, -0.1119051, 1.991364, 0.5019608, 0, 1, 1,
0.6830597, -0.3874643, 0.8014802, 0.5058824, 0, 1, 1,
0.6859879, -1.223137, 3.622016, 0.5137255, 0, 1, 1,
0.686678, -0.2212874, 2.0329, 0.5176471, 0, 1, 1,
0.7084833, -0.3096975, 2.076647, 0.5254902, 0, 1, 1,
0.7098014, -2.462413, 2.408915, 0.5294118, 0, 1, 1,
0.7117724, 0.02870824, -0.3481768, 0.5372549, 0, 1, 1,
0.715241, 0.9558799, 0.3227113, 0.5411765, 0, 1, 1,
0.7180624, 0.8016214, 1.204243, 0.5490196, 0, 1, 1,
0.7189899, -0.4998234, 1.579985, 0.5529412, 0, 1, 1,
0.7192774, 0.5394589, 1.615085, 0.5607843, 0, 1, 1,
0.721328, 0.9554921, -0.4826823, 0.5647059, 0, 1, 1,
0.7235386, -0.9119164, 3.538987, 0.572549, 0, 1, 1,
0.7400435, 0.9529796, 3.041122, 0.5764706, 0, 1, 1,
0.7407345, 1.263493, 0.7971241, 0.5843138, 0, 1, 1,
0.7430931, -0.6399485, 1.690827, 0.5882353, 0, 1, 1,
0.743171, 0.6434588, 2.024109, 0.5960785, 0, 1, 1,
0.7469812, -0.3927868, 2.300938, 0.6039216, 0, 1, 1,
0.7474017, 1.683008, -0.9547697, 0.6078432, 0, 1, 1,
0.7514542, -0.2291712, 2.908939, 0.6156863, 0, 1, 1,
0.7545205, 0.5687699, -0.2061954, 0.6196079, 0, 1, 1,
0.7572399, 0.2212386, 0.814939, 0.627451, 0, 1, 1,
0.7617934, -1.15007, 2.966448, 0.6313726, 0, 1, 1,
0.7626938, 0.4642689, 0.8233148, 0.6392157, 0, 1, 1,
0.7633568, 0.1092487, 0.7750909, 0.6431373, 0, 1, 1,
0.7643234, 0.0138717, 1.051079, 0.6509804, 0, 1, 1,
0.7646809, 0.6421192, 1.979836, 0.654902, 0, 1, 1,
0.7719439, -0.6367926, 3.272584, 0.6627451, 0, 1, 1,
0.7737573, 0.9258948, 0.4245161, 0.6666667, 0, 1, 1,
0.7770912, 1.088531, -0.5198503, 0.6745098, 0, 1, 1,
0.777486, -1.453577, 1.181594, 0.6784314, 0, 1, 1,
0.7793214, 0.2395887, 2.521541, 0.6862745, 0, 1, 1,
0.7833048, -0.8987582, 2.192859, 0.6901961, 0, 1, 1,
0.7833538, -0.4809238, 2.066642, 0.6980392, 0, 1, 1,
0.7842115, 0.294594, 1.305532, 0.7058824, 0, 1, 1,
0.7863017, 1.43115, -1.605562, 0.7098039, 0, 1, 1,
0.7904251, 3.063987, -1.447187, 0.7176471, 0, 1, 1,
0.7915197, -0.1132423, 2.445693, 0.7215686, 0, 1, 1,
0.7942373, 0.4740842, 0.232336, 0.7294118, 0, 1, 1,
0.7957129, 0.351464, 2.961205, 0.7333333, 0, 1, 1,
0.7979569, 0.7625762, 2.051883, 0.7411765, 0, 1, 1,
0.7993681, -0.6680541, 2.673038, 0.7450981, 0, 1, 1,
0.8003674, -2.693944, 3.686164, 0.7529412, 0, 1, 1,
0.8022127, 1.510761, 0.1553519, 0.7568628, 0, 1, 1,
0.8052182, -2.020748, 1.221809, 0.7647059, 0, 1, 1,
0.805571, -0.467358, 1.67461, 0.7686275, 0, 1, 1,
0.8089805, 0.2939516, 2.279101, 0.7764706, 0, 1, 1,
0.8094532, -0.7359015, 4.070507, 0.7803922, 0, 1, 1,
0.811022, -0.1603882, 2.773614, 0.7882353, 0, 1, 1,
0.819394, 0.3148166, 1.576626, 0.7921569, 0, 1, 1,
0.8313424, 0.9825815, -0.3934763, 0.8, 0, 1, 1,
0.834778, 0.09859607, 1.48633, 0.8078431, 0, 1, 1,
0.8451092, -1.314603, 2.329564, 0.8117647, 0, 1, 1,
0.8467036, 1.064622, -0.9621304, 0.8196079, 0, 1, 1,
0.8507719, 0.8552108, 0.5020977, 0.8235294, 0, 1, 1,
0.8510869, 0.4592198, -0.02702997, 0.8313726, 0, 1, 1,
0.8577923, 1.474376, 0.5391523, 0.8352941, 0, 1, 1,
0.8591021, -0.8607771, 0.9739124, 0.8431373, 0, 1, 1,
0.8604137, 0.4105587, 1.1922, 0.8470588, 0, 1, 1,
0.8616846, -1.337039, 2.093258, 0.854902, 0, 1, 1,
0.8652954, 0.3920858, 1.20155, 0.8588235, 0, 1, 1,
0.8699406, -0.6526266, 2.666933, 0.8666667, 0, 1, 1,
0.8701385, -2.959421, 2.590721, 0.8705882, 0, 1, 1,
0.8783844, 0.3540736, 0.4044163, 0.8784314, 0, 1, 1,
0.8797453, -1.533139, 3.587982, 0.8823529, 0, 1, 1,
0.8866349, 1.028314, -0.7431765, 0.8901961, 0, 1, 1,
0.8893216, 0.7126974, 1.868034, 0.8941177, 0, 1, 1,
0.8960249, -0.298249, 2.703038, 0.9019608, 0, 1, 1,
0.9003437, 0.8352807, -0.01896745, 0.9098039, 0, 1, 1,
0.9034445, 0.6485693, 0.3122074, 0.9137255, 0, 1, 1,
0.9038635, 0.6386673, 2.495313, 0.9215686, 0, 1, 1,
0.9109665, 1.198066, -0.01298374, 0.9254902, 0, 1, 1,
0.9159012, 1.343647, 1.880269, 0.9333333, 0, 1, 1,
0.9232076, -0.1752132, 2.44252, 0.9372549, 0, 1, 1,
0.9321614, -1.600373, 2.660431, 0.945098, 0, 1, 1,
0.9356802, 0.7253099, 0.976324, 0.9490196, 0, 1, 1,
0.9394248, 1.390563, 1.831369, 0.9568627, 0, 1, 1,
0.9416345, -0.2677746, 1.026256, 0.9607843, 0, 1, 1,
0.9434217, 0.6468582, -0.009881243, 0.9686275, 0, 1, 1,
0.9454556, 0.07927071, 0.8857682, 0.972549, 0, 1, 1,
0.9485383, -0.6518187, 1.995008, 0.9803922, 0, 1, 1,
0.9490643, 0.3678671, 2.545011, 0.9843137, 0, 1, 1,
0.9491463, 1.162174, 2.030154, 0.9921569, 0, 1, 1,
0.9601203, -1.132834, 3.984883, 0.9960784, 0, 1, 1,
0.9756228, 0.773329, 0.5989584, 1, 0, 0.9960784, 1,
0.979452, 0.3532544, 2.326963, 1, 0, 0.9882353, 1,
0.9822771, -0.280412, 2.539912, 1, 0, 0.9843137, 1,
0.9835944, 1.290869, 0.1935021, 1, 0, 0.9764706, 1,
0.991527, -0.965881, 2.274788, 1, 0, 0.972549, 1,
0.9966812, -0.5556883, 1.605443, 1, 0, 0.9647059, 1,
0.9982567, 0.4871404, -1.139668, 1, 0, 0.9607843, 1,
0.9991453, 0.3805682, 1.721974, 1, 0, 0.9529412, 1,
1.008155, 2.134577, -1.843751, 1, 0, 0.9490196, 1,
1.01491, 0.03119036, 2.048958, 1, 0, 0.9411765, 1,
1.014951, -0.4198752, 2.712073, 1, 0, 0.9372549, 1,
1.016358, -0.1025229, 2.825938, 1, 0, 0.9294118, 1,
1.016714, -0.5807156, 1.929422, 1, 0, 0.9254902, 1,
1.030101, 0.2749728, 1.666426, 1, 0, 0.9176471, 1,
1.030884, -0.1497162, 1.441301, 1, 0, 0.9137255, 1,
1.030915, 0.2711405, -0.5362036, 1, 0, 0.9058824, 1,
1.039033, -0.5650829, 3.087748, 1, 0, 0.9019608, 1,
1.03954, -2.177408, 1.587821, 1, 0, 0.8941177, 1,
1.03974, 0.1134948, 2.431466, 1, 0, 0.8862745, 1,
1.053089, -0.172492, 2.139309, 1, 0, 0.8823529, 1,
1.05375, 0.5714055, -0.9012259, 1, 0, 0.8745098, 1,
1.056419, -1.984053, 2.434862, 1, 0, 0.8705882, 1,
1.058623, 1.535799, 0.7868167, 1, 0, 0.8627451, 1,
1.061172, -1.413672, 1.264308, 1, 0, 0.8588235, 1,
1.065471, -0.5243188, 2.591338, 1, 0, 0.8509804, 1,
1.067149, -1.905594, 2.195033, 1, 0, 0.8470588, 1,
1.071077, -0.8294945, 3.227874, 1, 0, 0.8392157, 1,
1.071188, 0.9279532, 0.1348052, 1, 0, 0.8352941, 1,
1.081717, -0.5448236, 1.17955, 1, 0, 0.827451, 1,
1.084986, 1.49772, -0.9372355, 1, 0, 0.8235294, 1,
1.085372, 1.847992, -0.751997, 1, 0, 0.8156863, 1,
1.087909, -2.068088, 2.670784, 1, 0, 0.8117647, 1,
1.091141, 0.8293043, -0.3435178, 1, 0, 0.8039216, 1,
1.09672, 1.259728, -1.35171, 1, 0, 0.7960784, 1,
1.099761, 1.450108, 0.7317178, 1, 0, 0.7921569, 1,
1.117746, 1.959482, -0.9440054, 1, 0, 0.7843137, 1,
1.119391, 0.3924372, 1.779015, 1, 0, 0.7803922, 1,
1.119391, 0.8463751, -0.2227375, 1, 0, 0.772549, 1,
1.121041, -1.87677, 2.939975, 1, 0, 0.7686275, 1,
1.121795, 0.642581, -0.213201, 1, 0, 0.7607843, 1,
1.132779, 0.3598003, 1.361222, 1, 0, 0.7568628, 1,
1.142496, 1.155021, 1.654232, 1, 0, 0.7490196, 1,
1.145212, -0.05238063, 2.988887, 1, 0, 0.7450981, 1,
1.148525, 0.1479023, 1.822131, 1, 0, 0.7372549, 1,
1.158703, 0.6637845, 0.2686136, 1, 0, 0.7333333, 1,
1.168289, 1.125699, 1.303191, 1, 0, 0.7254902, 1,
1.16996, 1.214476, 1.334879, 1, 0, 0.7215686, 1,
1.180037, 0.07709525, 2.352437, 1, 0, 0.7137255, 1,
1.181916, 1.196627, 1.067999, 1, 0, 0.7098039, 1,
1.189136, -0.2547088, 1.967193, 1, 0, 0.7019608, 1,
1.198471, 1.782362, 1.408441, 1, 0, 0.6941177, 1,
1.206529, 0.76278, 0.858389, 1, 0, 0.6901961, 1,
1.222338, -2.038207, 2.971618, 1, 0, 0.682353, 1,
1.22937, -0.7696674, 3.184137, 1, 0, 0.6784314, 1,
1.232653, -1.537183, 1.571362, 1, 0, 0.6705883, 1,
1.238473, 0.3696951, 1.48961, 1, 0, 0.6666667, 1,
1.239479, 0.3945501, 1.400406, 1, 0, 0.6588235, 1,
1.242738, 1.371654, 1.700816, 1, 0, 0.654902, 1,
1.249623, -0.9862618, 2.623111, 1, 0, 0.6470588, 1,
1.250885, 0.7019782, 1.753738, 1, 0, 0.6431373, 1,
1.252294, -0.1579041, 1.352063, 1, 0, 0.6352941, 1,
1.258387, -0.2715322, 2.001732, 1, 0, 0.6313726, 1,
1.259241, 2.289953, 1.356941, 1, 0, 0.6235294, 1,
1.262764, 0.6017961, -0.2262081, 1, 0, 0.6196079, 1,
1.265876, -0.1812717, 2.5449, 1, 0, 0.6117647, 1,
1.271122, 1.350101, 0.1314958, 1, 0, 0.6078432, 1,
1.271193, -0.1981765, 1.312516, 1, 0, 0.6, 1,
1.279046, 1.777971, -0.8503598, 1, 0, 0.5921569, 1,
1.279472, 0.4215473, 0.9391743, 1, 0, 0.5882353, 1,
1.283207, -0.006087194, 0.8199065, 1, 0, 0.5803922, 1,
1.296342, -0.6311325, 0.3380118, 1, 0, 0.5764706, 1,
1.297441, -1.847521, 2.990316, 1, 0, 0.5686275, 1,
1.30499, -0.6315268, 3.826297, 1, 0, 0.5647059, 1,
1.317087, 2.204769, -0.7082662, 1, 0, 0.5568628, 1,
1.319512, -1.254343, 3.576192, 1, 0, 0.5529412, 1,
1.324074, 1.740102, -1.14891, 1, 0, 0.5450981, 1,
1.343139, -1.395569, 1.307841, 1, 0, 0.5411765, 1,
1.343819, -0.4278177, 1.19162, 1, 0, 0.5333334, 1,
1.345061, -1.436057, 3.885032, 1, 0, 0.5294118, 1,
1.345736, 2.043354, 1.097921, 1, 0, 0.5215687, 1,
1.347096, 0.4768001, 1.730569, 1, 0, 0.5176471, 1,
1.362279, 0.7425734, 1.828408, 1, 0, 0.509804, 1,
1.365157, -1.133917, 1.090347, 1, 0, 0.5058824, 1,
1.390522, -0.393094, 2.461805, 1, 0, 0.4980392, 1,
1.392798, -0.452542, 1.448536, 1, 0, 0.4901961, 1,
1.393008, -0.5058312, 2.400303, 1, 0, 0.4862745, 1,
1.406148, 0.7539234, -0.3162941, 1, 0, 0.4784314, 1,
1.41017, 0.5655373, 1.393054, 1, 0, 0.4745098, 1,
1.410708, 0.8427464, 1.14032, 1, 0, 0.4666667, 1,
1.412163, -0.6411886, 1.651759, 1, 0, 0.4627451, 1,
1.416747, -0.2589587, -0.571831, 1, 0, 0.454902, 1,
1.423498, -1.198474, 1.335736, 1, 0, 0.4509804, 1,
1.423745, 0.09614477, 1.19431, 1, 0, 0.4431373, 1,
1.43019, 1.203504, 1.014486, 1, 0, 0.4392157, 1,
1.435164, -0.623816, 2.545406, 1, 0, 0.4313726, 1,
1.437482, -0.4041583, 0.94048, 1, 0, 0.427451, 1,
1.444081, 1.081808, 0.009797161, 1, 0, 0.4196078, 1,
1.446837, 1.526873, 0.9491807, 1, 0, 0.4156863, 1,
1.456827, -0.6821216, 2.529687, 1, 0, 0.4078431, 1,
1.463231, 0.8234414, 2.549696, 1, 0, 0.4039216, 1,
1.471663, 1.286811, 1.766184, 1, 0, 0.3960784, 1,
1.476239, -0.4058903, 0.8418123, 1, 0, 0.3882353, 1,
1.482105, -0.2162206, 0.8653044, 1, 0, 0.3843137, 1,
1.503969, 0.668551, 0.1205832, 1, 0, 0.3764706, 1,
1.505577, -1.39051, 1.845043, 1, 0, 0.372549, 1,
1.510299, -0.1456932, 2.391003, 1, 0, 0.3647059, 1,
1.515319, -0.0006996109, 2.886418, 1, 0, 0.3607843, 1,
1.525597, -1.389349, 2.018024, 1, 0, 0.3529412, 1,
1.542838, 0.1971597, 0.02981428, 1, 0, 0.3490196, 1,
1.546778, 0.2008957, 0.3747039, 1, 0, 0.3411765, 1,
1.550305, -0.2896658, 0.5878414, 1, 0, 0.3372549, 1,
1.558215, 1.132945, 1.643655, 1, 0, 0.3294118, 1,
1.56113, 1.382604, 0.406692, 1, 0, 0.3254902, 1,
1.563139, 0.815456, 1.086088, 1, 0, 0.3176471, 1,
1.566381, 0.02409187, 1.125193, 1, 0, 0.3137255, 1,
1.566682, -0.4410304, 1.99206, 1, 0, 0.3058824, 1,
1.57329, 2.520963, 1.360354, 1, 0, 0.2980392, 1,
1.601884, -0.4249164, 2.798172, 1, 0, 0.2941177, 1,
1.618273, 0.1255457, 2.284922, 1, 0, 0.2862745, 1,
1.63309, -0.2196562, 0.1331672, 1, 0, 0.282353, 1,
1.636427, -1.412396, 2.433215, 1, 0, 0.2745098, 1,
1.692202, 0.2168524, 2.912645, 1, 0, 0.2705882, 1,
1.700232, 1.313543, -1.139602, 1, 0, 0.2627451, 1,
1.710145, 1.052684, -0.244905, 1, 0, 0.2588235, 1,
1.712381, -0.1976362, 1.628687, 1, 0, 0.2509804, 1,
1.726308, -0.4992662, 0.2028051, 1, 0, 0.2470588, 1,
1.732179, -1.167908, 2.910904, 1, 0, 0.2392157, 1,
1.751945, 0.02770978, -0.1410507, 1, 0, 0.2352941, 1,
1.753198, 0.7814644, 0.7342791, 1, 0, 0.227451, 1,
1.763958, -1.038348, 2.36471, 1, 0, 0.2235294, 1,
1.774216, 1.565092, 1.486297, 1, 0, 0.2156863, 1,
1.785273, 1.172925, 0.196966, 1, 0, 0.2117647, 1,
1.809018, -0.08719338, 1.492793, 1, 0, 0.2039216, 1,
1.821333, 0.7303446, 1.608102, 1, 0, 0.1960784, 1,
1.828791, 0.9575375, 0.8334731, 1, 0, 0.1921569, 1,
1.861526, -0.1792777, 0.3388115, 1, 0, 0.1843137, 1,
1.876741, -0.3940603, 1.205943, 1, 0, 0.1803922, 1,
1.888456, 0.4974443, 1.757563, 1, 0, 0.172549, 1,
1.893641, 0.5790603, 0.8181333, 1, 0, 0.1686275, 1,
1.901193, -0.0142638, 2.493027, 1, 0, 0.1607843, 1,
1.906991, -0.3466717, 1.682692, 1, 0, 0.1568628, 1,
1.908044, -0.163662, 1.44912, 1, 0, 0.1490196, 1,
1.91178, 0.7679881, 1.883405, 1, 0, 0.145098, 1,
1.927455, 1.272093, -0.01143995, 1, 0, 0.1372549, 1,
1.949447, 1.305297, 1.407203, 1, 0, 0.1333333, 1,
1.966256, -0.2241917, 2.513059, 1, 0, 0.1254902, 1,
1.980349, 1.760293, 1.348061, 1, 0, 0.1215686, 1,
1.988524, -0.2369367, 0.5055739, 1, 0, 0.1137255, 1,
1.994674, -0.5383543, 1.544828, 1, 0, 0.1098039, 1,
2.004451, -0.8142139, 3.655763, 1, 0, 0.1019608, 1,
2.016158, -0.5235755, 1.492356, 1, 0, 0.09411765, 1,
2.032738, -0.2209139, 2.2403, 1, 0, 0.09019608, 1,
2.096646, 0.4949774, 0.701305, 1, 0, 0.08235294, 1,
2.127645, -0.05288329, 1.665804, 1, 0, 0.07843138, 1,
2.153893, 0.659705, 1.289656, 1, 0, 0.07058824, 1,
2.162732, 1.595523, 0.02416807, 1, 0, 0.06666667, 1,
2.167262, 0.2341223, 1.939385, 1, 0, 0.05882353, 1,
2.192474, -0.8337988, 0.8317484, 1, 0, 0.05490196, 1,
2.204478, -1.723328, 1.614425, 1, 0, 0.04705882, 1,
2.35865, -0.6497194, 4.450011, 1, 0, 0.04313726, 1,
2.444959, -0.05843888, 1.516068, 1, 0, 0.03529412, 1,
2.495246, -1.001025, 2.580335, 1, 0, 0.03137255, 1,
2.52249, -0.2918285, 1.044762, 1, 0, 0.02352941, 1,
2.541255, -0.7938691, 2.05753, 1, 0, 0.01960784, 1,
3.011998, 0.1195858, 1.964599, 1, 0, 0.01176471, 1,
3.0193, 0.3822882, 1.909162, 1, 0, 0.007843138, 1
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
-0.1027997, -4.223034, -6.965662, 0, -0.5, 0.5, 0.5,
-0.1027997, -4.223034, -6.965662, 1, -0.5, 0.5, 0.5,
-0.1027997, -4.223034, -6.965662, 1, 1.5, 0.5, 0.5,
-0.1027997, -4.223034, -6.965662, 0, 1.5, 0.5, 0.5
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
-4.283292, -0.05145609, -6.965662, 0, -0.5, 0.5, 0.5,
-4.283292, -0.05145609, -6.965662, 1, -0.5, 0.5, 0.5,
-4.283292, -0.05145609, -6.965662, 1, 1.5, 0.5, 0.5,
-4.283292, -0.05145609, -6.965662, 0, 1.5, 0.5, 0.5
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
-4.283292, -4.223034, 0.4898927, 0, -0.5, 0.5, 0.5,
-4.283292, -4.223034, 0.4898927, 1, -0.5, 0.5, 0.5,
-4.283292, -4.223034, 0.4898927, 1, 1.5, 0.5, 0.5,
-4.283292, -4.223034, 0.4898927, 0, 1.5, 0.5, 0.5
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
-3, -3.260362, -5.245149,
3, -3.260362, -5.245149,
-3, -3.260362, -5.245149,
-3, -3.420807, -5.531901,
-2, -3.260362, -5.245149,
-2, -3.420807, -5.531901,
-1, -3.260362, -5.245149,
-1, -3.420807, -5.531901,
0, -3.260362, -5.245149,
0, -3.420807, -5.531901,
1, -3.260362, -5.245149,
1, -3.420807, -5.531901,
2, -3.260362, -5.245149,
2, -3.420807, -5.531901,
3, -3.260362, -5.245149,
3, -3.420807, -5.531901
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
-3, -3.741698, -6.105405, 0, -0.5, 0.5, 0.5,
-3, -3.741698, -6.105405, 1, -0.5, 0.5, 0.5,
-3, -3.741698, -6.105405, 1, 1.5, 0.5, 0.5,
-3, -3.741698, -6.105405, 0, 1.5, 0.5, 0.5,
-2, -3.741698, -6.105405, 0, -0.5, 0.5, 0.5,
-2, -3.741698, -6.105405, 1, -0.5, 0.5, 0.5,
-2, -3.741698, -6.105405, 1, 1.5, 0.5, 0.5,
-2, -3.741698, -6.105405, 0, 1.5, 0.5, 0.5,
-1, -3.741698, -6.105405, 0, -0.5, 0.5, 0.5,
-1, -3.741698, -6.105405, 1, -0.5, 0.5, 0.5,
-1, -3.741698, -6.105405, 1, 1.5, 0.5, 0.5,
-1, -3.741698, -6.105405, 0, 1.5, 0.5, 0.5,
0, -3.741698, -6.105405, 0, -0.5, 0.5, 0.5,
0, -3.741698, -6.105405, 1, -0.5, 0.5, 0.5,
0, -3.741698, -6.105405, 1, 1.5, 0.5, 0.5,
0, -3.741698, -6.105405, 0, 1.5, 0.5, 0.5,
1, -3.741698, -6.105405, 0, -0.5, 0.5, 0.5,
1, -3.741698, -6.105405, 1, -0.5, 0.5, 0.5,
1, -3.741698, -6.105405, 1, 1.5, 0.5, 0.5,
1, -3.741698, -6.105405, 0, 1.5, 0.5, 0.5,
2, -3.741698, -6.105405, 0, -0.5, 0.5, 0.5,
2, -3.741698, -6.105405, 1, -0.5, 0.5, 0.5,
2, -3.741698, -6.105405, 1, 1.5, 0.5, 0.5,
2, -3.741698, -6.105405, 0, 1.5, 0.5, 0.5,
3, -3.741698, -6.105405, 0, -0.5, 0.5, 0.5,
3, -3.741698, -6.105405, 1, -0.5, 0.5, 0.5,
3, -3.741698, -6.105405, 1, 1.5, 0.5, 0.5,
3, -3.741698, -6.105405, 0, 1.5, 0.5, 0.5
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
-3.318563, -3, -5.245149,
-3.318563, 3, -5.245149,
-3.318563, -3, -5.245149,
-3.479351, -3, -5.531901,
-3.318563, -2, -5.245149,
-3.479351, -2, -5.531901,
-3.318563, -1, -5.245149,
-3.479351, -1, -5.531901,
-3.318563, 0, -5.245149,
-3.479351, 0, -5.531901,
-3.318563, 1, -5.245149,
-3.479351, 1, -5.531901,
-3.318563, 2, -5.245149,
-3.479351, 2, -5.531901,
-3.318563, 3, -5.245149,
-3.479351, 3, -5.531901
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
-3.800927, -3, -6.105405, 0, -0.5, 0.5, 0.5,
-3.800927, -3, -6.105405, 1, -0.5, 0.5, 0.5,
-3.800927, -3, -6.105405, 1, 1.5, 0.5, 0.5,
-3.800927, -3, -6.105405, 0, 1.5, 0.5, 0.5,
-3.800927, -2, -6.105405, 0, -0.5, 0.5, 0.5,
-3.800927, -2, -6.105405, 1, -0.5, 0.5, 0.5,
-3.800927, -2, -6.105405, 1, 1.5, 0.5, 0.5,
-3.800927, -2, -6.105405, 0, 1.5, 0.5, 0.5,
-3.800927, -1, -6.105405, 0, -0.5, 0.5, 0.5,
-3.800927, -1, -6.105405, 1, -0.5, 0.5, 0.5,
-3.800927, -1, -6.105405, 1, 1.5, 0.5, 0.5,
-3.800927, -1, -6.105405, 0, 1.5, 0.5, 0.5,
-3.800927, 0, -6.105405, 0, -0.5, 0.5, 0.5,
-3.800927, 0, -6.105405, 1, -0.5, 0.5, 0.5,
-3.800927, 0, -6.105405, 1, 1.5, 0.5, 0.5,
-3.800927, 0, -6.105405, 0, 1.5, 0.5, 0.5,
-3.800927, 1, -6.105405, 0, -0.5, 0.5, 0.5,
-3.800927, 1, -6.105405, 1, -0.5, 0.5, 0.5,
-3.800927, 1, -6.105405, 1, 1.5, 0.5, 0.5,
-3.800927, 1, -6.105405, 0, 1.5, 0.5, 0.5,
-3.800927, 2, -6.105405, 0, -0.5, 0.5, 0.5,
-3.800927, 2, -6.105405, 1, -0.5, 0.5, 0.5,
-3.800927, 2, -6.105405, 1, 1.5, 0.5, 0.5,
-3.800927, 2, -6.105405, 0, 1.5, 0.5, 0.5,
-3.800927, 3, -6.105405, 0, -0.5, 0.5, 0.5,
-3.800927, 3, -6.105405, 1, -0.5, 0.5, 0.5,
-3.800927, 3, -6.105405, 1, 1.5, 0.5, 0.5,
-3.800927, 3, -6.105405, 0, 1.5, 0.5, 0.5
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
-3.318563, -3.260362, -4,
-3.318563, -3.260362, 6,
-3.318563, -3.260362, -4,
-3.479351, -3.420807, -4,
-3.318563, -3.260362, -2,
-3.479351, -3.420807, -2,
-3.318563, -3.260362, 0,
-3.479351, -3.420807, 0,
-3.318563, -3.260362, 2,
-3.479351, -3.420807, 2,
-3.318563, -3.260362, 4,
-3.479351, -3.420807, 4,
-3.318563, -3.260362, 6,
-3.479351, -3.420807, 6
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
-3.800927, -3.741698, -4, 0, -0.5, 0.5, 0.5,
-3.800927, -3.741698, -4, 1, -0.5, 0.5, 0.5,
-3.800927, -3.741698, -4, 1, 1.5, 0.5, 0.5,
-3.800927, -3.741698, -4, 0, 1.5, 0.5, 0.5,
-3.800927, -3.741698, -2, 0, -0.5, 0.5, 0.5,
-3.800927, -3.741698, -2, 1, -0.5, 0.5, 0.5,
-3.800927, -3.741698, -2, 1, 1.5, 0.5, 0.5,
-3.800927, -3.741698, -2, 0, 1.5, 0.5, 0.5,
-3.800927, -3.741698, 0, 0, -0.5, 0.5, 0.5,
-3.800927, -3.741698, 0, 1, -0.5, 0.5, 0.5,
-3.800927, -3.741698, 0, 1, 1.5, 0.5, 0.5,
-3.800927, -3.741698, 0, 0, 1.5, 0.5, 0.5,
-3.800927, -3.741698, 2, 0, -0.5, 0.5, 0.5,
-3.800927, -3.741698, 2, 1, -0.5, 0.5, 0.5,
-3.800927, -3.741698, 2, 1, 1.5, 0.5, 0.5,
-3.800927, -3.741698, 2, 0, 1.5, 0.5, 0.5,
-3.800927, -3.741698, 4, 0, -0.5, 0.5, 0.5,
-3.800927, -3.741698, 4, 1, -0.5, 0.5, 0.5,
-3.800927, -3.741698, 4, 1, 1.5, 0.5, 0.5,
-3.800927, -3.741698, 4, 0, 1.5, 0.5, 0.5,
-3.800927, -3.741698, 6, 0, -0.5, 0.5, 0.5,
-3.800927, -3.741698, 6, 1, -0.5, 0.5, 0.5,
-3.800927, -3.741698, 6, 1, 1.5, 0.5, 0.5,
-3.800927, -3.741698, 6, 0, 1.5, 0.5, 0.5
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
-3.318563, -3.260362, -5.245149,
-3.318563, 3.15745, -5.245149,
-3.318563, -3.260362, 6.224934,
-3.318563, 3.15745, 6.224934,
-3.318563, -3.260362, -5.245149,
-3.318563, -3.260362, 6.224934,
-3.318563, 3.15745, -5.245149,
-3.318563, 3.15745, 6.224934,
-3.318563, -3.260362, -5.245149,
3.112963, -3.260362, -5.245149,
-3.318563, -3.260362, 6.224934,
3.112963, -3.260362, 6.224934,
-3.318563, 3.15745, -5.245149,
3.112963, 3.15745, -5.245149,
-3.318563, 3.15745, 6.224934,
3.112963, 3.15745, 6.224934,
3.112963, -3.260362, -5.245149,
3.112963, 3.15745, -5.245149,
3.112963, -3.260362, 6.224934,
3.112963, 3.15745, 6.224934,
3.112963, -3.260362, -5.245149,
3.112963, -3.260362, 6.224934,
3.112963, 3.15745, -5.245149,
3.112963, 3.15745, 6.224934
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
var radius = 7.813573;
var distance = 34.76347;
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
mvMatrix.translate( 0.1027997, 0.05145609, -0.4898927 );
mvMatrix.scale( 1.313559, 1.316366, 0.7365412 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.76347);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
azide<-read.table("azide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-azide$V2
```

```
## Error in eval(expr, envir, enclos): object 'azide' not found
```

```r
y<-azide$V3
```

```
## Error in eval(expr, envir, enclos): object 'azide' not found
```

```r
z<-azide$V4
```

```
## Error in eval(expr, envir, enclos): object 'azide' not found
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
-3.2249, 0.4706108, -1.896475, 0, 0, 1, 1, 1,
-2.945535, -1.350766, -0.8470072, 1, 0, 0, 1, 1,
-2.827882, 1.090147, -0.2796997, 1, 0, 0, 1, 1,
-2.48655, -0.3740146, -1.772283, 1, 0, 0, 1, 1,
-2.419024, 0.4329013, -1.946277, 1, 0, 0, 1, 1,
-2.349692, 1.734578, -1.097029, 1, 0, 0, 1, 1,
-2.335399, 1.418345, -1.514336, 0, 0, 0, 1, 1,
-2.294263, 0.5219575, -2.197541, 0, 0, 0, 1, 1,
-2.291995, 0.0008148893, -2.653971, 0, 0, 0, 1, 1,
-2.254763, -1.199509, -2.346085, 0, 0, 0, 1, 1,
-2.231102, 0.5318887, -4.272903, 0, 0, 0, 1, 1,
-2.202409, 1.209957, -1.028336, 0, 0, 0, 1, 1,
-2.123782, 0.3881246, -1.431878, 0, 0, 0, 1, 1,
-2.119743, -1.184163, -2.961181, 1, 1, 1, 1, 1,
-2.111656, 0.2534042, -1.477996, 1, 1, 1, 1, 1,
-2.107773, 0.309917, -1.487229, 1, 1, 1, 1, 1,
-2.093429, -0.7340479, -1.362759, 1, 1, 1, 1, 1,
-2.071816, 0.5595459, -3.184034, 1, 1, 1, 1, 1,
-2.042825, -0.1401295, -2.496522, 1, 1, 1, 1, 1,
-2.034368, -0.7768039, -3.355525, 1, 1, 1, 1, 1,
-2.025616, -1.632741, -2.223922, 1, 1, 1, 1, 1,
-2.012894, 0.1007746, -2.93469, 1, 1, 1, 1, 1,
-2.009794, 0.7255812, -1.506909, 1, 1, 1, 1, 1,
-2.000054, -2.196729, -2.490773, 1, 1, 1, 1, 1,
-1.949196, 0.9497063, -0.8201047, 1, 1, 1, 1, 1,
-1.937913, 0.768969, -1.746943, 1, 1, 1, 1, 1,
-1.937278, 0.1864808, -1.449932, 1, 1, 1, 1, 1,
-1.92853, -0.3572885, -1.345173, 1, 1, 1, 1, 1,
-1.921453, 0.1908362, -1.522925, 0, 0, 1, 1, 1,
-1.911971, 0.1439078, -2.29717, 1, 0, 0, 1, 1,
-1.909346, -0.144467, -2.607216, 1, 0, 0, 1, 1,
-1.870256, 0.8594203, -0.1332217, 1, 0, 0, 1, 1,
-1.863161, -0.1497877, -1.907296, 1, 0, 0, 1, 1,
-1.847368, -1.070735, -3.433577, 1, 0, 0, 1, 1,
-1.838505, -1.268965, -3.509784, 0, 0, 0, 1, 1,
-1.791665, 0.9281226, -0.8092149, 0, 0, 0, 1, 1,
-1.78043, 0.1842242, -1.944772, 0, 0, 0, 1, 1,
-1.763705, -0.01121204, -1.536525, 0, 0, 0, 1, 1,
-1.753127, 0.1776614, -1.549182, 0, 0, 0, 1, 1,
-1.736051, 0.1298704, -0.7278351, 0, 0, 0, 1, 1,
-1.733045, 1.823827, 0.274748, 0, 0, 0, 1, 1,
-1.725101, 0.736489, -0.516637, 1, 1, 1, 1, 1,
-1.705284, 0.1755615, -3.124913, 1, 1, 1, 1, 1,
-1.692285, -0.7385757, -0.0595571, 1, 1, 1, 1, 1,
-1.682464, -1.748589, -2.81883, 1, 1, 1, 1, 1,
-1.666975, -1.052375, -0.6985029, 1, 1, 1, 1, 1,
-1.664474, -1.783473, -2.99321, 1, 1, 1, 1, 1,
-1.645187, -1.365183, -2.644949, 1, 1, 1, 1, 1,
-1.64401, 0.141411, -1.905272, 1, 1, 1, 1, 1,
-1.609536, 0.5276224, -3.543184, 1, 1, 1, 1, 1,
-1.594436, -0.6232998, -1.797867, 1, 1, 1, 1, 1,
-1.572592, -0.03683521, -1.071057, 1, 1, 1, 1, 1,
-1.563329, -0.3266936, -2.868681, 1, 1, 1, 1, 1,
-1.548492, -1.037159, -1.262314, 1, 1, 1, 1, 1,
-1.543381, 0.5337177, -3.709853, 1, 1, 1, 1, 1,
-1.539602, -0.4096399, -1.352689, 1, 1, 1, 1, 1,
-1.536083, 0.2940488, -2.707835, 0, 0, 1, 1, 1,
-1.522051, 0.1151872, 0.01995387, 1, 0, 0, 1, 1,
-1.520834, 0.05029554, -0.2542626, 1, 0, 0, 1, 1,
-1.520382, 0.6849824, -1.367313, 1, 0, 0, 1, 1,
-1.516926, 0.7917664, -0.728056, 1, 0, 0, 1, 1,
-1.512863, 0.5265537, -1.56848, 1, 0, 0, 1, 1,
-1.511794, 0.413476, -0.5679621, 0, 0, 0, 1, 1,
-1.493983, 1.524829, -1.361868, 0, 0, 0, 1, 1,
-1.471621, 1.096866, -0.8419296, 0, 0, 0, 1, 1,
-1.463849, -0.157172, -1.501198, 0, 0, 0, 1, 1,
-1.463419, 1.116247, -2.133109, 0, 0, 0, 1, 1,
-1.461679, -0.6108299, -0.759949, 0, 0, 0, 1, 1,
-1.456911, 0.5707128, 0.041489, 0, 0, 0, 1, 1,
-1.446352, 0.5393772, 0.04870348, 1, 1, 1, 1, 1,
-1.440519, -0.584681, -2.418427, 1, 1, 1, 1, 1,
-1.439989, -2.842466, -2.306491, 1, 1, 1, 1, 1,
-1.433986, -0.4097261, 0.03559376, 1, 1, 1, 1, 1,
-1.430281, 0.7365597, -2.256665, 1, 1, 1, 1, 1,
-1.426107, -0.5266469, -1.622227, 1, 1, 1, 1, 1,
-1.421758, 1.183897, -2.890457, 1, 1, 1, 1, 1,
-1.40656, 0.3196536, -0.4652602, 1, 1, 1, 1, 1,
-1.405726, -0.8686544, -2.62032, 1, 1, 1, 1, 1,
-1.398153, 0.1295497, -2.48914, 1, 1, 1, 1, 1,
-1.379197, 0.6745837, -1.888771, 1, 1, 1, 1, 1,
-1.376154, 0.2831319, -0.7766654, 1, 1, 1, 1, 1,
-1.370538, -1.340122, -4.841277, 1, 1, 1, 1, 1,
-1.3603, -0.3201502, -2.112679, 1, 1, 1, 1, 1,
-1.351386, -1.567718, -3.092958, 1, 1, 1, 1, 1,
-1.34117, -0.2479937, -2.732755, 0, 0, 1, 1, 1,
-1.336073, -2.24112, -3.367236, 1, 0, 0, 1, 1,
-1.332084, -1.014066, -2.007666, 1, 0, 0, 1, 1,
-1.331561, -0.6185709, -2.112467, 1, 0, 0, 1, 1,
-1.331441, -1.626855, -3.319016, 1, 0, 0, 1, 1,
-1.322575, 0.8188846, -1.146058, 1, 0, 0, 1, 1,
-1.321415, -0.6435683, -0.8924283, 0, 0, 0, 1, 1,
-1.320882, 0.7164283, -0.8127726, 0, 0, 0, 1, 1,
-1.313141, 0.8862185, -1.152074, 0, 0, 0, 1, 1,
-1.312188, -1.516732, -1.481368, 0, 0, 0, 1, 1,
-1.30836, -0.3951592, -2.667322, 0, 0, 0, 1, 1,
-1.304375, 0.281613, 0.4118685, 0, 0, 0, 1, 1,
-1.294677, -1.705117, -2.386254, 0, 0, 0, 1, 1,
-1.292011, -1.499243, -1.409754, 1, 1, 1, 1, 1,
-1.273188, 0.9963501, 0.07611892, 1, 1, 1, 1, 1,
-1.269518, -1.040828, -2.082101, 1, 1, 1, 1, 1,
-1.268189, -0.5347976, -2.620031, 1, 1, 1, 1, 1,
-1.2669, -1.884811, -2.754483, 1, 1, 1, 1, 1,
-1.26658, -1.00102, -1.212854, 1, 1, 1, 1, 1,
-1.266396, -0.1978268, -1.17681, 1, 1, 1, 1, 1,
-1.260161, 1.802389, -0.6038426, 1, 1, 1, 1, 1,
-1.257043, 0.7476206, -1.752049, 1, 1, 1, 1, 1,
-1.250266, 0.3969179, -0.5150259, 1, 1, 1, 1, 1,
-1.249499, 0.3600489, -1.376047, 1, 1, 1, 1, 1,
-1.245157, -1.113809, -2.525712, 1, 1, 1, 1, 1,
-1.241262, -0.5862093, -1.546255, 1, 1, 1, 1, 1,
-1.236569, -1.023716, -1.974948, 1, 1, 1, 1, 1,
-1.230689, -1.135092, -3.951399, 1, 1, 1, 1, 1,
-1.229574, -0.7898694, -3.589842, 0, 0, 1, 1, 1,
-1.22874, -0.7870146, -2.860879, 1, 0, 0, 1, 1,
-1.226771, 1.914404, 0.03193134, 1, 0, 0, 1, 1,
-1.226095, -0.006246232, -1.740389, 1, 0, 0, 1, 1,
-1.226079, -0.7160828, -2.499082, 1, 0, 0, 1, 1,
-1.219909, -0.2980146, -0.6362528, 1, 0, 0, 1, 1,
-1.214842, 2.26635, -1.379712, 0, 0, 0, 1, 1,
-1.207644, 1.5299, -1.804814, 0, 0, 0, 1, 1,
-1.198566, -0.8699459, -2.455397, 0, 0, 0, 1, 1,
-1.193952, -0.1813143, -0.541028, 0, 0, 0, 1, 1,
-1.192054, -0.1517843, -1.79001, 0, 0, 0, 1, 1,
-1.186166, 0.8498867, -3.045289, 0, 0, 0, 1, 1,
-1.180902, -2.183626, -2.187878, 0, 0, 0, 1, 1,
-1.175945, -0.01858472, -2.917515, 1, 1, 1, 1, 1,
-1.172571, 0.2819935, -3.175977, 1, 1, 1, 1, 1,
-1.169444, -0.1911055, -2.585686, 1, 1, 1, 1, 1,
-1.167088, 0.8056853, 0.2713362, 1, 1, 1, 1, 1,
-1.142968, -1.019545, -2.329642, 1, 1, 1, 1, 1,
-1.140204, 0.4775456, -2.453278, 1, 1, 1, 1, 1,
-1.139239, -1.764829, -1.975947, 1, 1, 1, 1, 1,
-1.139167, -1.554283, -2.314881, 1, 1, 1, 1, 1,
-1.136817, 0.6646912, -2.090099, 1, 1, 1, 1, 1,
-1.135543, -1.563413, -2.388164, 1, 1, 1, 1, 1,
-1.128088, -0.1010557, -1.409969, 1, 1, 1, 1, 1,
-1.127468, 0.9710712, -1.392399, 1, 1, 1, 1, 1,
-1.126508, -0.04281435, -1.693363, 1, 1, 1, 1, 1,
-1.121695, -1.363786, -5.078109, 1, 1, 1, 1, 1,
-1.112589, -0.03381668, -1.627261, 1, 1, 1, 1, 1,
-1.096703, -1.455233, -2.291526, 0, 0, 1, 1, 1,
-1.092169, -0.1315257, -0.09282745, 1, 0, 0, 1, 1,
-1.087885, 0.5584402, -1.350493, 1, 0, 0, 1, 1,
-1.074967, 0.9612084, -0.7745575, 1, 0, 0, 1, 1,
-1.062363, -0.6638882, -1.615725, 1, 0, 0, 1, 1,
-1.054801, -0.5974029, -1.751117, 1, 0, 0, 1, 1,
-1.053578, 1.185507, -0.730457, 0, 0, 0, 1, 1,
-1.049774, 0.8198107, -1.843529, 0, 0, 0, 1, 1,
-1.049513, 0.7425085, 0.0506527, 0, 0, 0, 1, 1,
-1.02563, 0.700246, -0.6048832, 0, 0, 0, 1, 1,
-1.017124, 0.3787982, -0.07589655, 0, 0, 0, 1, 1,
-1.009454, 0.6141143, -1.789642, 0, 0, 0, 1, 1,
-1.002202, -2.02016, -1.070042, 0, 0, 0, 1, 1,
-0.9956084, 0.4465277, 0.3598304, 1, 1, 1, 1, 1,
-0.989396, 0.3098462, -2.522355, 1, 1, 1, 1, 1,
-0.9886631, 0.6581835, -0.3534663, 1, 1, 1, 1, 1,
-0.9880748, 0.6516948, 0.5727964, 1, 1, 1, 1, 1,
-0.9872922, -0.7300361, -4.510228, 1, 1, 1, 1, 1,
-0.9869552, 1.710897, -0.8101298, 1, 1, 1, 1, 1,
-0.9865451, 1.27905, 0.5671692, 1, 1, 1, 1, 1,
-0.9833382, -1.022072, -1.672862, 1, 1, 1, 1, 1,
-0.9827401, 0.1255501, -1.128318, 1, 1, 1, 1, 1,
-0.9776245, -2.164287, -3.942025, 1, 1, 1, 1, 1,
-0.9728056, 0.900131, -2.803355, 1, 1, 1, 1, 1,
-0.9671849, 1.187703, -1.700135, 1, 1, 1, 1, 1,
-0.9617035, -3.166899, -3.415749, 1, 1, 1, 1, 1,
-0.9608285, -0.08053111, -2.865057, 1, 1, 1, 1, 1,
-0.9551135, -0.9374843, -1.306423, 1, 1, 1, 1, 1,
-0.9533603, 0.7666832, 0.6847627, 0, 0, 1, 1, 1,
-0.9515492, 0.9500151, -0.2177299, 1, 0, 0, 1, 1,
-0.9502323, 1.37585, -0.2664741, 1, 0, 0, 1, 1,
-0.9468933, 0.2255252, -1.328666, 1, 0, 0, 1, 1,
-0.9435797, -1.012912, -2.797272, 1, 0, 0, 1, 1,
-0.942736, 0.3770313, -1.322613, 1, 0, 0, 1, 1,
-0.9409426, -0.5003861, -1.929414, 0, 0, 0, 1, 1,
-0.9377875, -0.3895278, -1.418374, 0, 0, 0, 1, 1,
-0.9373168, -0.2741796, -0.6910169, 0, 0, 0, 1, 1,
-0.9351428, -0.1681871, -0.2101503, 0, 0, 0, 1, 1,
-0.9281521, -0.7104656, -2.076056, 0, 0, 0, 1, 1,
-0.9201801, -0.3207984, -1.40789, 0, 0, 0, 1, 1,
-0.8996446, -0.6014416, -2.890904, 0, 0, 0, 1, 1,
-0.8702271, -0.909345, -1.036807, 1, 1, 1, 1, 1,
-0.8538389, -1.265684, -1.862156, 1, 1, 1, 1, 1,
-0.852771, -0.7041011, -2.534368, 1, 1, 1, 1, 1,
-0.8520262, 0.3717435, -1.136886, 1, 1, 1, 1, 1,
-0.8504795, -1.670079, -3.313016, 1, 1, 1, 1, 1,
-0.847967, -0.9831134, -3.541294, 1, 1, 1, 1, 1,
-0.8438511, -0.2313748, -2.418414, 1, 1, 1, 1, 1,
-0.8430966, -0.7226661, 0.07299149, 1, 1, 1, 1, 1,
-0.8386052, 1.15609, -2.360298, 1, 1, 1, 1, 1,
-0.8242801, -0.1749057, -1.823176, 1, 1, 1, 1, 1,
-0.8239151, 1.63462, 0.06761401, 1, 1, 1, 1, 1,
-0.8222746, 2.677136, 1.217777, 1, 1, 1, 1, 1,
-0.8210273, 0.4530097, -1.337481, 1, 1, 1, 1, 1,
-0.8095905, 1.693697, 1.024039, 1, 1, 1, 1, 1,
-0.8069953, -1.740512, -0.4688945, 1, 1, 1, 1, 1,
-0.8026935, 1.908301, -0.2300756, 0, 0, 1, 1, 1,
-0.7877295, -2.325541, -2.194777, 1, 0, 0, 1, 1,
-0.7867136, -0.5217872, -3.001131, 1, 0, 0, 1, 1,
-0.7844961, -0.8494811, -2.817847, 1, 0, 0, 1, 1,
-0.7725712, -1.627298, -2.100132, 1, 0, 0, 1, 1,
-0.7723788, -0.2341332, -3.125572, 1, 0, 0, 1, 1,
-0.77141, 0.5772023, -3.109716, 0, 0, 0, 1, 1,
-0.7703118, 1.103969, -0.3774665, 0, 0, 0, 1, 1,
-0.7698538, 0.8037404, 0.02794643, 0, 0, 0, 1, 1,
-0.763219, -0.2560715, -3.234509, 0, 0, 0, 1, 1,
-0.7598387, 0.5647894, 0.6207997, 0, 0, 0, 1, 1,
-0.7595101, 0.07855706, -0.988775, 0, 0, 0, 1, 1,
-0.7585228, -0.04430978, -0.5493934, 0, 0, 0, 1, 1,
-0.755171, -1.653346, -2.371637, 1, 1, 1, 1, 1,
-0.7539149, -0.9169903, -3.491264, 1, 1, 1, 1, 1,
-0.7452847, 0.8973857, -1.918715, 1, 1, 1, 1, 1,
-0.7450333, -1.129498, -3.549778, 1, 1, 1, 1, 1,
-0.744226, -1.122754, -1.528546, 1, 1, 1, 1, 1,
-0.7421257, -1.151391, -1.752049, 1, 1, 1, 1, 1,
-0.7417657, 0.2424131, -0.619855, 1, 1, 1, 1, 1,
-0.7330137, -0.9145385, -3.929605, 1, 1, 1, 1, 1,
-0.7277575, -1.498961, -2.411176, 1, 1, 1, 1, 1,
-0.7165154, 0.2823001, -2.104074, 1, 1, 1, 1, 1,
-0.7090104, 2.135265, -1.567115, 1, 1, 1, 1, 1,
-0.7084535, -1.70741, -3.21461, 1, 1, 1, 1, 1,
-0.703968, 0.6133865, -0.8186743, 1, 1, 1, 1, 1,
-0.6976646, -0.2847109, -1.236678, 1, 1, 1, 1, 1,
-0.6939394, 0.5100868, -1.05212, 1, 1, 1, 1, 1,
-0.6939232, 1.388094, -0.118249, 0, 0, 1, 1, 1,
-0.6912936, 0.4725571, -1.302566, 1, 0, 0, 1, 1,
-0.6902183, 1.305817, 0.1819821, 1, 0, 0, 1, 1,
-0.6861016, 1.158136, -0.7093763, 1, 0, 0, 1, 1,
-0.6838137, -0.1851312, -1.542836, 1, 0, 0, 1, 1,
-0.68175, -0.6010438, -2.08918, 1, 0, 0, 1, 1,
-0.6809781, -1.296638, -4.569448, 0, 0, 0, 1, 1,
-0.679814, 0.7249113, -2.281873, 0, 0, 0, 1, 1,
-0.6794049, -0.651616, -1.637714, 0, 0, 0, 1, 1,
-0.6750195, 0.408646, -1.441175, 0, 0, 0, 1, 1,
-0.6717741, -0.7468109, -3.834023, 0, 0, 0, 1, 1,
-0.6702908, -0.9827444, -3.042776, 0, 0, 0, 1, 1,
-0.6691725, -0.9935228, -2.847187, 0, 0, 0, 1, 1,
-0.667248, 0.6303511, 1.556224, 1, 1, 1, 1, 1,
-0.6667314, -0.7845686, -2.559434, 1, 1, 1, 1, 1,
-0.6638213, -0.5772667, -2.706853, 1, 1, 1, 1, 1,
-0.6599138, -0.1625866, -3.260605, 1, 1, 1, 1, 1,
-0.6597021, 0.5076173, -1.160396, 1, 1, 1, 1, 1,
-0.6593761, 0.003136721, -1.793945, 1, 1, 1, 1, 1,
-0.6590093, -1.062369, -3.607666, 1, 1, 1, 1, 1,
-0.6535127, -0.6623778, -2.071957, 1, 1, 1, 1, 1,
-0.6342443, -0.268241, -1.633457, 1, 1, 1, 1, 1,
-0.6259283, 1.444854, -1.566682, 1, 1, 1, 1, 1,
-0.6238519, -1.752536, -2.575742, 1, 1, 1, 1, 1,
-0.6228995, -0.6385674, -1.786877, 1, 1, 1, 1, 1,
-0.6207468, -0.4141936, -1.023242, 1, 1, 1, 1, 1,
-0.6185126, 0.2503549, -2.222358, 1, 1, 1, 1, 1,
-0.6136566, 2.606214, -0.9854316, 1, 1, 1, 1, 1,
-0.6120273, 2.050997, 0.703641, 0, 0, 1, 1, 1,
-0.6089383, -0.140982, -2.793389, 1, 0, 0, 1, 1,
-0.6079428, -0.6249576, -0.3903716, 1, 0, 0, 1, 1,
-0.6064223, -0.5810293, -2.388049, 1, 0, 0, 1, 1,
-0.6062202, 0.7497429, 0.733608, 1, 0, 0, 1, 1,
-0.602517, -1.795767, -3.035458, 1, 0, 0, 1, 1,
-0.5999886, 0.5918419, -0.6612009, 0, 0, 0, 1, 1,
-0.598824, -0.6295397, -0.9315096, 0, 0, 0, 1, 1,
-0.5986539, -0.9539748, -0.5985021, 0, 0, 0, 1, 1,
-0.5977487, -0.08860502, -0.8797093, 0, 0, 0, 1, 1,
-0.5952619, -0.2039155, -1.659614, 0, 0, 0, 1, 1,
-0.5926681, 0.4478635, -2.210142, 0, 0, 0, 1, 1,
-0.5897369, -0.2247344, -2.182889, 0, 0, 0, 1, 1,
-0.58738, 0.01878753, -2.908772, 1, 1, 1, 1, 1,
-0.5870676, -1.324929, -3.022979, 1, 1, 1, 1, 1,
-0.5845324, -0.4595319, -2.486238, 1, 1, 1, 1, 1,
-0.570559, -0.5189874, -2.252493, 1, 1, 1, 1, 1,
-0.5702065, -0.5829738, -3.935402, 1, 1, 1, 1, 1,
-0.5669174, -0.1171681, -1.853414, 1, 1, 1, 1, 1,
-0.5660847, 0.5780554, -0.5381571, 1, 1, 1, 1, 1,
-0.5651314, 0.9586413, 0.5648804, 1, 1, 1, 1, 1,
-0.5636067, -1.621992, -1.671063, 1, 1, 1, 1, 1,
-0.5630218, 0.5716712, 0.5175403, 1, 1, 1, 1, 1,
-0.5518886, 0.1075515, -1.033483, 1, 1, 1, 1, 1,
-0.5484778, 0.7815586, -1.541587, 1, 1, 1, 1, 1,
-0.5484757, 0.08875977, -0.6177304, 1, 1, 1, 1, 1,
-0.5462511, -0.5351156, -1.394358, 1, 1, 1, 1, 1,
-0.5452289, -0.3555121, -2.133742, 1, 1, 1, 1, 1,
-0.5450936, 0.9233043, -0.783296, 0, 0, 1, 1, 1,
-0.5382043, 1.215485, -1.025711, 1, 0, 0, 1, 1,
-0.5361218, 0.01609168, -2.547914, 1, 0, 0, 1, 1,
-0.5356593, 1.526868, 1.632454, 1, 0, 0, 1, 1,
-0.5317488, -0.1408825, -1.319202, 1, 0, 0, 1, 1,
-0.5254209, -0.211339, -2.564488, 1, 0, 0, 1, 1,
-0.5145983, 0.9326542, -2.429245, 0, 0, 0, 1, 1,
-0.508681, -0.1437452, -2.176061, 0, 0, 0, 1, 1,
-0.5085347, -0.7307582, -2.260318, 0, 0, 0, 1, 1,
-0.5066872, 0.8901597, 0.6165867, 0, 0, 0, 1, 1,
-0.5065281, -2.109848, -4.130432, 0, 0, 0, 1, 1,
-0.5034307, -0.3366779, -1.943043, 0, 0, 0, 1, 1,
-0.4993115, -0.1059202, -2.591413, 0, 0, 0, 1, 1,
-0.4977251, -1.669486, -3.174903, 1, 1, 1, 1, 1,
-0.4973773, -0.6960484, -2.71311, 1, 1, 1, 1, 1,
-0.4947163, 1.800607, -1.715959, 1, 1, 1, 1, 1,
-0.4925737, -0.1528206, 0.0538134, 1, 1, 1, 1, 1,
-0.4882311, -0.00556368, -1.176645, 1, 1, 1, 1, 1,
-0.4864351, -0.6829472, -2.771262, 1, 1, 1, 1, 1,
-0.4821796, -0.7350411, -3.563067, 1, 1, 1, 1, 1,
-0.4820877, -0.08500703, -3.101906, 1, 1, 1, 1, 1,
-0.4779103, -0.1210684, 0.178326, 1, 1, 1, 1, 1,
-0.4763145, 0.5232313, 1.451875, 1, 1, 1, 1, 1,
-0.4730258, -1.280379, -2.329282, 1, 1, 1, 1, 1,
-0.4702118, 1.112818, 0.5716616, 1, 1, 1, 1, 1,
-0.4680344, -0.6695701, -2.49189, 1, 1, 1, 1, 1,
-0.4652936, -0.2937272, -1.754846, 1, 1, 1, 1, 1,
-0.4650275, -1.977144, -1.73139, 1, 1, 1, 1, 1,
-0.45842, -1.316875, -3.421268, 0, 0, 1, 1, 1,
-0.4580432, -1.092162, -2.927245, 1, 0, 0, 1, 1,
-0.4570611, -0.6864362, -2.995502, 1, 0, 0, 1, 1,
-0.4561466, 0.2310376, -0.6933165, 1, 0, 0, 1, 1,
-0.4535813, 0.0325037, -1.146705, 1, 0, 0, 1, 1,
-0.4483088, -1.346763, -3.754434, 1, 0, 0, 1, 1,
-0.4377631, 1.573816, -0.9424345, 0, 0, 0, 1, 1,
-0.4337146, 1.687416, 0.4885926, 0, 0, 0, 1, 1,
-0.4333141, 0.6730777, -2.091396, 0, 0, 0, 1, 1,
-0.4328983, -0.5753827, -2.261322, 0, 0, 0, 1, 1,
-0.4307134, -0.495871, -1.436735, 0, 0, 0, 1, 1,
-0.4234519, -2.358655, -3.321144, 0, 0, 0, 1, 1,
-0.4222015, 1.063265, -1.796617, 0, 0, 0, 1, 1,
-0.421441, -0.3147597, -2.261191, 1, 1, 1, 1, 1,
-0.4204117, -0.7527463, -3.302307, 1, 1, 1, 1, 1,
-0.418465, -0.04937113, -1.474711, 1, 1, 1, 1, 1,
-0.4106052, 0.7580923, -1.72198, 1, 1, 1, 1, 1,
-0.40833, -0.6332654, -2.278011, 1, 1, 1, 1, 1,
-0.4079255, 0.5675768, 0.2190759, 1, 1, 1, 1, 1,
-0.4066678, -2.008893, -2.277081, 1, 1, 1, 1, 1,
-0.4059396, 1.237213, -0.5324636, 1, 1, 1, 1, 1,
-0.4022337, -1.395882, -0.9983414, 1, 1, 1, 1, 1,
-0.4019943, 0.6116408, -0.1005684, 1, 1, 1, 1, 1,
-0.4012554, -1.302287, -1.020149, 1, 1, 1, 1, 1,
-0.3982266, -0.1679128, -3.361049, 1, 1, 1, 1, 1,
-0.3958881, 0.1369721, -0.3461052, 1, 1, 1, 1, 1,
-0.3904032, -0.4787029, -1.740967, 1, 1, 1, 1, 1,
-0.3868661, 0.05864377, -1.896774, 1, 1, 1, 1, 1,
-0.3830284, 1.238513, 1.211992, 0, 0, 1, 1, 1,
-0.3731069, -1.124003, -3.308569, 1, 0, 0, 1, 1,
-0.3706855, 1.145004, 0.105541, 1, 0, 0, 1, 1,
-0.3704697, 0.7367262, 0.5026319, 1, 0, 0, 1, 1,
-0.369357, -0.6453038, -2.967553, 1, 0, 0, 1, 1,
-0.3688687, 0.6843253, 0.09282125, 1, 0, 0, 1, 1,
-0.3674204, -1.805822, -4.404677, 0, 0, 0, 1, 1,
-0.367026, -0.0280824, -1.214723, 0, 0, 0, 1, 1,
-0.3670102, -1.75278, -2.238878, 0, 0, 0, 1, 1,
-0.3587899, -1.406127, -3.302935, 0, 0, 0, 1, 1,
-0.3568177, 0.8754422, -0.6753418, 0, 0, 0, 1, 1,
-0.3518294, -0.3274625, -0.7217969, 0, 0, 0, 1, 1,
-0.3494917, 0.1648958, -0.1506768, 0, 0, 0, 1, 1,
-0.3441715, -1.308178, -2.809038, 1, 1, 1, 1, 1,
-0.3425734, -0.9165138, -1.082104, 1, 1, 1, 1, 1,
-0.3421879, 0.6464664, -0.2002402, 1, 1, 1, 1, 1,
-0.3370881, -0.3028328, -2.028649, 1, 1, 1, 1, 1,
-0.3253885, 0.7832844, -1.590144, 1, 1, 1, 1, 1,
-0.3232407, -0.4751484, -2.568247, 1, 1, 1, 1, 1,
-0.3207991, 0.03637053, -1.455628, 1, 1, 1, 1, 1,
-0.3194575, -0.1329628, 0.2281088, 1, 1, 1, 1, 1,
-0.314537, 1.969819, -0.7826558, 1, 1, 1, 1, 1,
-0.3116418, -0.511071, -2.440675, 1, 1, 1, 1, 1,
-0.310562, -1.37999, -2.20601, 1, 1, 1, 1, 1,
-0.3055196, 0.7371156, 0.4465872, 1, 1, 1, 1, 1,
-0.3002834, 0.4784444, 0.2560057, 1, 1, 1, 1, 1,
-0.2953057, 1.915791, 0.09775168, 1, 1, 1, 1, 1,
-0.2933437, -0.8073189, -2.403005, 1, 1, 1, 1, 1,
-0.2922849, -0.4469127, -3.591314, 0, 0, 1, 1, 1,
-0.2900889, 1.007536, -1.117814, 1, 0, 0, 1, 1,
-0.2893561, 0.9514806, 0.690027, 1, 0, 0, 1, 1,
-0.2876228, 0.6057569, -1.351394, 1, 0, 0, 1, 1,
-0.2844626, -0.04751694, -0.6043824, 1, 0, 0, 1, 1,
-0.2840634, -0.7021577, -3.48357, 1, 0, 0, 1, 1,
-0.2814811, -1.47742, -3.253179, 0, 0, 0, 1, 1,
-0.278217, 0.1893284, -2.436661, 0, 0, 0, 1, 1,
-0.2777876, -0.8011566, -1.97501, 0, 0, 0, 1, 1,
-0.2723588, 0.2631093, -1.878974, 0, 0, 0, 1, 1,
-0.2650393, 1.010457, -1.934308, 0, 0, 0, 1, 1,
-0.2632334, -0.1220401, -1.064055, 0, 0, 0, 1, 1,
-0.2632248, 1.303913, 0.35647, 0, 0, 0, 1, 1,
-0.2611991, -0.8603431, -2.524738, 1, 1, 1, 1, 1,
-0.2594408, -0.7402424, -3.09717, 1, 1, 1, 1, 1,
-0.2584568, -0.9838952, -3.559482, 1, 1, 1, 1, 1,
-0.2575643, -0.7902063, -3.323609, 1, 1, 1, 1, 1,
-0.2491711, 0.9315923, -0.8405426, 1, 1, 1, 1, 1,
-0.248377, -0.6489031, -0.9825245, 1, 1, 1, 1, 1,
-0.2468394, -0.1195829, -1.272948, 1, 1, 1, 1, 1,
-0.2461429, 0.9498619, -1.036841, 1, 1, 1, 1, 1,
-0.2448585, -1.325246, -3.351203, 1, 1, 1, 1, 1,
-0.2424786, -0.6642807, -3.13568, 1, 1, 1, 1, 1,
-0.2424298, 1.400439, 0.07258935, 1, 1, 1, 1, 1,
-0.2424282, 1.118636, -0.007991386, 1, 1, 1, 1, 1,
-0.2419834, -0.4185417, -1.957775, 1, 1, 1, 1, 1,
-0.2414867, -0.5958393, -2.254604, 1, 1, 1, 1, 1,
-0.2384012, -0.3413259, -4.827501, 1, 1, 1, 1, 1,
-0.2357268, -0.6661057, -1.852735, 0, 0, 1, 1, 1,
-0.232947, -0.6107346, -2.662146, 1, 0, 0, 1, 1,
-0.232298, -2.118181, -1.297031, 1, 0, 0, 1, 1,
-0.2321699, -0.3074274, -2.634611, 1, 0, 0, 1, 1,
-0.2262122, 0.9074665, -1.05356, 1, 0, 0, 1, 1,
-0.2258045, 0.1995561, -0.6965753, 1, 0, 0, 1, 1,
-0.2227443, 0.7551348, -2.466779, 0, 0, 0, 1, 1,
-0.2216408, 0.5929972, -0.2336882, 0, 0, 0, 1, 1,
-0.2207821, 0.9477333, -0.7881294, 0, 0, 0, 1, 1,
-0.2179377, 1.485545, 0.5051469, 0, 0, 0, 1, 1,
-0.2166198, 1.107833, 0.3996781, 0, 0, 0, 1, 1,
-0.211189, -0.6903558, -2.061105, 0, 0, 0, 1, 1,
-0.2084211, 0.1139943, -1.028206, 0, 0, 0, 1, 1,
-0.2073121, -1.449577, -2.796429, 1, 1, 1, 1, 1,
-0.2031787, 0.1526818, 1.05432, 1, 1, 1, 1, 1,
-0.2011984, -0.1685573, -2.51963, 1, 1, 1, 1, 1,
-0.1985194, 0.4588999, 0.1875424, 1, 1, 1, 1, 1,
-0.1975115, 0.746742, 0.4590872, 1, 1, 1, 1, 1,
-0.1941086, 0.340845, -1.081766, 1, 1, 1, 1, 1,
-0.1921628, 0.4430586, -1.758008, 1, 1, 1, 1, 1,
-0.1903886, -0.8836849, -1.996437, 1, 1, 1, 1, 1,
-0.189518, -0.5136163, -3.877185, 1, 1, 1, 1, 1,
-0.1868018, 1.095771, -0.7454098, 1, 1, 1, 1, 1,
-0.1804553, -1.387022, -2.6203, 1, 1, 1, 1, 1,
-0.1762781, 1.109682, -1.228418, 1, 1, 1, 1, 1,
-0.1744755, -1.74377, -1.876327, 1, 1, 1, 1, 1,
-0.1719562, 0.6739401, -0.6793178, 1, 1, 1, 1, 1,
-0.171179, -0.3924703, -3.377465, 1, 1, 1, 1, 1,
-0.1678165, 0.2669781, 0.206188, 0, 0, 1, 1, 1,
-0.1630054, 0.3697244, -1.88754, 1, 0, 0, 1, 1,
-0.1614002, -0.2747914, -1.762027, 1, 0, 0, 1, 1,
-0.1592992, 1.664342, -0.2159736, 1, 0, 0, 1, 1,
-0.1585559, 1.201377, -0.4804217, 1, 0, 0, 1, 1,
-0.1551348, 0.5122942, -0.3363638, 1, 0, 0, 1, 1,
-0.1543893, -0.06212244, -1.074075, 0, 0, 0, 1, 1,
-0.1516595, 0.0002448008, -1.59953, 0, 0, 0, 1, 1,
-0.1506146, -1.662967, -1.866979, 0, 0, 0, 1, 1,
-0.1449528, 0.2698448, -1.60083, 0, 0, 0, 1, 1,
-0.1397717, 0.07937145, -0.6897435, 0, 0, 0, 1, 1,
-0.1324883, 1.057594, 0.8776188, 0, 0, 0, 1, 1,
-0.1159981, 1.4442, 0.5285658, 0, 0, 0, 1, 1,
-0.1113105, 0.7695201, 0.8020927, 1, 1, 1, 1, 1,
-0.1112545, -0.3439889, -4.203519, 1, 1, 1, 1, 1,
-0.1085048, -0.3709368, -2.970301, 1, 1, 1, 1, 1,
-0.1062625, -0.9369166, -2.595898, 1, 1, 1, 1, 1,
-0.1049956, -1.652552, -2.796035, 1, 1, 1, 1, 1,
-0.1043574, -1.131371, -3.797254, 1, 1, 1, 1, 1,
-0.1029627, 2.169708, -0.2093184, 1, 1, 1, 1, 1,
-0.1021287, -1.877804, -3.225124, 1, 1, 1, 1, 1,
-0.1018332, -0.3709921, -2.595961, 1, 1, 1, 1, 1,
-0.1009846, -0.4051747, -2.099414, 1, 1, 1, 1, 1,
-0.09641077, 0.8083187, -0.8372432, 1, 1, 1, 1, 1,
-0.09597131, 0.3972938, 1.590883, 1, 1, 1, 1, 1,
-0.09410364, 1.467063, -1.562322, 1, 1, 1, 1, 1,
-0.0901455, -0.7333049, -4.174306, 1, 1, 1, 1, 1,
-0.08713084, -0.3720331, -2.862296, 1, 1, 1, 1, 1,
-0.08679253, -0.5286618, -2.559129, 0, 0, 1, 1, 1,
-0.0811161, -0.2812206, -2.241791, 1, 0, 0, 1, 1,
-0.07583732, -1.21402, -2.751815, 1, 0, 0, 1, 1,
-0.07552329, 1.335858, 0.4492719, 1, 0, 0, 1, 1,
-0.07513687, 0.8714131, 1.526792, 1, 0, 0, 1, 1,
-0.07421581, 0.3849483, -1.546416, 1, 0, 0, 1, 1,
-0.0727387, 0.06435692, -2.166054, 0, 0, 0, 1, 1,
-0.07173395, -1.063868, -3.298641, 0, 0, 0, 1, 1,
-0.07173271, 1.150466, -2.189185, 0, 0, 0, 1, 1,
-0.06869336, -0.220269, -1.310457, 0, 0, 0, 1, 1,
-0.06320164, -0.4096292, -2.91138, 0, 0, 0, 1, 1,
-0.0630139, -0.3923681, -3.53195, 0, 0, 0, 1, 1,
-0.05876197, 0.4280685, 0.427423, 0, 0, 0, 1, 1,
-0.05812157, -0.01119914, -1.907008, 1, 1, 1, 1, 1,
-0.05758454, 0.8567705, 1.208098, 1, 1, 1, 1, 1,
-0.05620917, 0.2780761, 0.8977745, 1, 1, 1, 1, 1,
-0.05575804, -1.164813, -1.760528, 1, 1, 1, 1, 1,
-0.05382018, -0.4485677, -3.454155, 1, 1, 1, 1, 1,
-0.05281037, 0.1550877, -0.2912852, 1, 1, 1, 1, 1,
-0.05181989, 0.3761438, -0.6707869, 1, 1, 1, 1, 1,
-0.05157026, -0.1625009, -1.821585, 1, 1, 1, 1, 1,
-0.05012831, 0.4832385, -0.4773737, 1, 1, 1, 1, 1,
-0.04972357, -0.2074344, -3.126542, 1, 1, 1, 1, 1,
-0.04960556, -1.039377, -3.366141, 1, 1, 1, 1, 1,
-0.04589197, -0.1361559, -2.287495, 1, 1, 1, 1, 1,
-0.03991909, 0.333012, 1.390125, 1, 1, 1, 1, 1,
-0.03914255, 0.002023386, -0.4425597, 1, 1, 1, 1, 1,
-0.03521442, -0.6194874, -3.480681, 1, 1, 1, 1, 1,
-0.02743825, 0.3576204, -0.1971495, 0, 0, 1, 1, 1,
-0.02596727, -1.731419, -3.89771, 1, 0, 0, 1, 1,
-0.02496551, 0.3578912, -1.453639, 1, 0, 0, 1, 1,
-0.02341592, -3.014584, -3.569154, 1, 0, 0, 1, 1,
-0.02332432, -1.39271, -2.935666, 1, 0, 0, 1, 1,
-0.02323601, 0.4890335, 0.063295, 1, 0, 0, 1, 1,
-0.02268673, 0.07885864, 0.6350467, 0, 0, 0, 1, 1,
-0.02262625, -1.744604, -3.264013, 0, 0, 0, 1, 1,
-0.01916798, 1.333311, -0.1717059, 0, 0, 0, 1, 1,
-0.018575, -0.7162169, -4.414295, 0, 0, 0, 1, 1,
-0.01816978, 1.078307, 0.6657919, 0, 0, 0, 1, 1,
-0.005480811, -1.221845, -2.879922, 0, 0, 0, 1, 1,
-0.005271816, 0.7843129, -1.18259, 0, 0, 0, 1, 1,
-0.002562389, -0.1722824, -2.076573, 1, 1, 1, 1, 1,
-0.001640378, -0.3130695, -2.999345, 1, 1, 1, 1, 1,
0.0008438542, 0.357334, -1.314763, 1, 1, 1, 1, 1,
0.003225488, 1.046905, 0.1845466, 1, 1, 1, 1, 1,
0.005419401, 0.3049752, 0.4925047, 1, 1, 1, 1, 1,
0.009276588, 1.168874, 1.208259, 1, 1, 1, 1, 1,
0.01413003, -0.6225337, 3.156877, 1, 1, 1, 1, 1,
0.01902533, -0.8410335, 1.692892, 1, 1, 1, 1, 1,
0.0209184, -0.4233629, 1.989008, 1, 1, 1, 1, 1,
0.0238728, -1.286591, 2.78761, 1, 1, 1, 1, 1,
0.03165352, 1.719636, 0.52006, 1, 1, 1, 1, 1,
0.03473816, -2.004735, 4.110592, 1, 1, 1, 1, 1,
0.04001567, 1.397608, -0.1781015, 1, 1, 1, 1, 1,
0.04108999, -1.028942, 2.660882, 1, 1, 1, 1, 1,
0.04138145, -0.1382897, 3.51919, 1, 1, 1, 1, 1,
0.04138949, -0.0839208, 3.536111, 0, 0, 1, 1, 1,
0.04212309, -0.1827298, 2.526048, 1, 0, 0, 1, 1,
0.04432829, 0.05058624, 0.7187791, 1, 0, 0, 1, 1,
0.04512857, -0.6873255, 1.896249, 1, 0, 0, 1, 1,
0.04733227, -0.4029282, 5.739243, 1, 0, 0, 1, 1,
0.04952371, -0.4303646, 2.539073, 1, 0, 0, 1, 1,
0.05212048, 0.3319474, 0.4988989, 0, 0, 0, 1, 1,
0.05365882, -1.074058, 1.890746, 0, 0, 0, 1, 1,
0.0547389, 1.232237, 1.116126, 0, 0, 0, 1, 1,
0.0553642, -0.3961141, 1.486022, 0, 0, 0, 1, 1,
0.06045395, -0.3896665, 5.216109, 0, 0, 0, 1, 1,
0.06292903, -0.512942, 2.449553, 0, 0, 0, 1, 1,
0.06440245, 0.5833715, 2.01097, 0, 0, 0, 1, 1,
0.06665485, 1.312141, 0.4348987, 1, 1, 1, 1, 1,
0.06943657, -0.2337381, 2.334979, 1, 1, 1, 1, 1,
0.07463091, 0.3842486, 0.5984542, 1, 1, 1, 1, 1,
0.08389833, 0.6077723, 0.7618423, 1, 1, 1, 1, 1,
0.08698826, -1.130637, 2.365327, 1, 1, 1, 1, 1,
0.08793907, -0.2845547, 2.206795, 1, 1, 1, 1, 1,
0.09031083, -1.499299, 1.467423, 1, 1, 1, 1, 1,
0.09492054, 0.03392509, 1.313969, 1, 1, 1, 1, 1,
0.09622071, 0.7662945, 0.88188, 1, 1, 1, 1, 1,
0.09883913, 0.437057, 0.655866, 1, 1, 1, 1, 1,
0.1031571, 0.3545582, -0.5345964, 1, 1, 1, 1, 1,
0.1040638, -0.964836, 1.922205, 1, 1, 1, 1, 1,
0.1043112, -0.1168635, 3.171518, 1, 1, 1, 1, 1,
0.1052064, -0.08761461, 3.478328, 1, 1, 1, 1, 1,
0.1097718, -1.295931, 2.120342, 1, 1, 1, 1, 1,
0.1098104, -1.06887, 1.949717, 0, 0, 1, 1, 1,
0.1102533, -0.4507656, 3.798073, 1, 0, 0, 1, 1,
0.1152037, 1.208879, -0.6938486, 1, 0, 0, 1, 1,
0.1184081, 1.119852, -0.8032272, 1, 0, 0, 1, 1,
0.1189507, -1.461166, 3.960176, 1, 0, 0, 1, 1,
0.1206575, -1.468814, 2.465105, 1, 0, 0, 1, 1,
0.1255536, 2.216461, 0.4514643, 0, 0, 0, 1, 1,
0.1257152, -0.4512748, 2.972, 0, 0, 0, 1, 1,
0.1268323, -0.8173292, 3.617682, 0, 0, 0, 1, 1,
0.1278685, -1.55947, 4.532688, 0, 0, 0, 1, 1,
0.1326927, -0.6762242, 3.811858, 0, 0, 0, 1, 1,
0.1350935, 0.5543637, 0.5347267, 0, 0, 0, 1, 1,
0.1365302, -0.2250417, 2.346101, 0, 0, 0, 1, 1,
0.1371923, -0.4516034, 3.518695, 1, 1, 1, 1, 1,
0.1392415, -0.1003556, 2.402031, 1, 1, 1, 1, 1,
0.1408681, 1.692308, 1.493454, 1, 1, 1, 1, 1,
0.1466049, 0.09437031, 2.323246, 1, 1, 1, 1, 1,
0.149444, 1.144155, -0.03179286, 1, 1, 1, 1, 1,
0.1528808, -0.2266964, 3.423186, 1, 1, 1, 1, 1,
0.1560493, -0.4661684, 2.168737, 1, 1, 1, 1, 1,
0.1621787, 0.2622013, 0.5127664, 1, 1, 1, 1, 1,
0.1630709, -0.1625643, 0.09583792, 1, 1, 1, 1, 1,
0.164555, 1.438218, -1.131014, 1, 1, 1, 1, 1,
0.1649449, 0.3464983, -0.0004442181, 1, 1, 1, 1, 1,
0.1653782, 0.2458521, 0.1290856, 1, 1, 1, 1, 1,
0.1718203, 0.3478949, 1.934122, 1, 1, 1, 1, 1,
0.1797137, 2.460315, -0.5343766, 1, 1, 1, 1, 1,
0.1800503, -0.2878736, 0.594563, 1, 1, 1, 1, 1,
0.183778, -0.3485025, 2.01972, 0, 0, 1, 1, 1,
0.1848105, 2.885973, 0.5164139, 1, 0, 0, 1, 1,
0.1854254, -0.5570828, 2.716113, 1, 0, 0, 1, 1,
0.1862855, -0.3825427, 3.562831, 1, 0, 0, 1, 1,
0.1867504, -0.5406592, 4.126494, 1, 0, 0, 1, 1,
0.1881896, -1.053592, 3.096466, 1, 0, 0, 1, 1,
0.1896601, -0.5734296, 0.7170126, 0, 0, 0, 1, 1,
0.1945813, 0.8653901, 2.327893, 0, 0, 0, 1, 1,
0.1946097, -1.219932, 1.865909, 0, 0, 0, 1, 1,
0.1976457, -0.0108954, 1.57176, 0, 0, 0, 1, 1,
0.2007001, -0.7637268, 3.454191, 0, 0, 0, 1, 1,
0.2048707, 1.114785, 1.362074, 0, 0, 0, 1, 1,
0.2054542, -1.562646, 1.57322, 0, 0, 0, 1, 1,
0.2088148, 0.6923106, 0.414339, 1, 1, 1, 1, 1,
0.2104595, -1.681614, 2.493268, 1, 1, 1, 1, 1,
0.2108567, 1.789535, 1.129773, 1, 1, 1, 1, 1,
0.2115569, -0.2909909, 1.647275, 1, 1, 1, 1, 1,
0.2117608, -1.377372, 2.497262, 1, 1, 1, 1, 1,
0.2121523, 0.7948641, 1.737642, 1, 1, 1, 1, 1,
0.2180522, -0.05023635, 3.469544, 1, 1, 1, 1, 1,
0.2180926, 0.9721317, 2.289268, 1, 1, 1, 1, 1,
0.2190629, 0.7853584, 1.869022, 1, 1, 1, 1, 1,
0.2215634, 0.2338554, 0.8435609, 1, 1, 1, 1, 1,
0.224642, -0.3714672, 3.914439, 1, 1, 1, 1, 1,
0.2285744, 1.908443, -1.465669, 1, 1, 1, 1, 1,
0.2338305, -1.277552, 2.295553, 1, 1, 1, 1, 1,
0.2367259, 0.47953, 1.062357, 1, 1, 1, 1, 1,
0.2367845, -0.1032819, 0.9998635, 1, 1, 1, 1, 1,
0.2368283, 0.02771095, 2.050972, 0, 0, 1, 1, 1,
0.2379059, 1.593384, 1.01632, 1, 0, 0, 1, 1,
0.2390517, -2.190797, 2.154666, 1, 0, 0, 1, 1,
0.2394453, -0.04530814, 0.1795229, 1, 0, 0, 1, 1,
0.2480595, 0.05019426, 1.288279, 1, 0, 0, 1, 1,
0.2486868, -0.3964578, 2.740705, 1, 0, 0, 1, 1,
0.2492506, -0.2563426, 2.152237, 0, 0, 0, 1, 1,
0.2591076, -0.2679336, 3.838223, 0, 0, 0, 1, 1,
0.2591217, 0.8549318, -0.1333319, 0, 0, 0, 1, 1,
0.2609701, -1.284018, 3.311441, 0, 0, 0, 1, 1,
0.2611614, 0.05095811, 1.434801, 0, 0, 0, 1, 1,
0.2617452, 1.829463, 0.2102776, 0, 0, 0, 1, 1,
0.2686088, -0.8789743, 2.550937, 0, 0, 0, 1, 1,
0.2690931, -0.3325199, 2.325909, 1, 1, 1, 1, 1,
0.2710506, 0.1218118, -0.5697824, 1, 1, 1, 1, 1,
0.2717275, -0.285796, 2.730126, 1, 1, 1, 1, 1,
0.2728411, 1.986731, -0.6123115, 1, 1, 1, 1, 1,
0.2733339, 1.102091, 3.194433, 1, 1, 1, 1, 1,
0.2786893, 0.7469087, 0.4106718, 1, 1, 1, 1, 1,
0.2813832, -0.2684278, 1.453333, 1, 1, 1, 1, 1,
0.2821034, 0.4750282, 0.7407489, 1, 1, 1, 1, 1,
0.2857194, 0.2510628, 1.292765, 1, 1, 1, 1, 1,
0.2868161, 1.263415, 0.4707611, 1, 1, 1, 1, 1,
0.2871289, -0.5568857, 3.873234, 1, 1, 1, 1, 1,
0.2919744, 0.401372, 0.6837002, 1, 1, 1, 1, 1,
0.2984422, -0.003922127, 0.7783813, 1, 1, 1, 1, 1,
0.299996, -0.3418697, 2.181946, 1, 1, 1, 1, 1,
0.3056359, 1.563403, -0.4212975, 1, 1, 1, 1, 1,
0.306953, 0.8894231, 0.1308236, 0, 0, 1, 1, 1,
0.3123365, 0.03105682, 1.783719, 1, 0, 0, 1, 1,
0.3158444, 0.444335, -1.373036, 1, 0, 0, 1, 1,
0.3161476, 0.6778102, 0.2069013, 1, 0, 0, 1, 1,
0.3195084, -0.6522035, 1.377481, 1, 0, 0, 1, 1,
0.3225121, -1.499513, 1.564031, 1, 0, 0, 1, 1,
0.3233368, -2.770395, 3.599488, 0, 0, 0, 1, 1,
0.3238516, -1.988146, 2.378091, 0, 0, 0, 1, 1,
0.3265618, 0.3994004, 0.8339423, 0, 0, 0, 1, 1,
0.3344718, -0.4259419, 2.624939, 0, 0, 0, 1, 1,
0.3354217, 0.9492969, -0.8524264, 0, 0, 0, 1, 1,
0.3368303, -0.4067701, 1.392673, 0, 0, 0, 1, 1,
0.3392576, 0.4757684, 1.994924, 0, 0, 0, 1, 1,
0.3396737, 2.057734, -0.4990154, 1, 1, 1, 1, 1,
0.3424913, -0.8974478, 1.697876, 1, 1, 1, 1, 1,
0.3441311, -0.08575763, 0.7016125, 1, 1, 1, 1, 1,
0.3447297, -0.2345322, 2.053441, 1, 1, 1, 1, 1,
0.34857, -0.1089887, 2.157208, 1, 1, 1, 1, 1,
0.3514802, 0.7759749, -2.901972, 1, 1, 1, 1, 1,
0.3524501, -0.3655852, 2.427635, 1, 1, 1, 1, 1,
0.354268, -1.665432, 1.339495, 1, 1, 1, 1, 1,
0.3558306, 0.5086598, -1.119636, 1, 1, 1, 1, 1,
0.3558964, -0.882145, 2.40139, 1, 1, 1, 1, 1,
0.3570578, 1.566873, 1.539711, 1, 1, 1, 1, 1,
0.3620268, 0.2521187, 1.710992, 1, 1, 1, 1, 1,
0.3623395, -0.5690516, 2.11808, 1, 1, 1, 1, 1,
0.3630057, 2.181697, -0.09606194, 1, 1, 1, 1, 1,
0.3672867, -0.07797781, -0.2594827, 1, 1, 1, 1, 1,
0.3698732, 0.001199691, 1.553669, 0, 0, 1, 1, 1,
0.3703105, 1.23266, -1.105542, 1, 0, 0, 1, 1,
0.3713246, 0.748559, -0.214433, 1, 0, 0, 1, 1,
0.3716882, -1.672287, 2.758528, 1, 0, 0, 1, 1,
0.3748884, 1.968403, -0.3259663, 1, 0, 0, 1, 1,
0.3762788, 0.8474804, 0.2112471, 1, 0, 0, 1, 1,
0.3807748, -0.03021003, 2.891268, 0, 0, 0, 1, 1,
0.3823199, 0.8003917, 0.9474025, 0, 0, 0, 1, 1,
0.3876567, 1.035432, -0.6909693, 0, 0, 0, 1, 1,
0.3897524, -0.4176885, 3.115011, 0, 0, 0, 1, 1,
0.3900159, -1.335125, 1.820248, 0, 0, 0, 1, 1,
0.3921231, 1.435231, -0.8589206, 0, 0, 0, 1, 1,
0.3925736, -1.180853, 2.277008, 0, 0, 0, 1, 1,
0.3942727, -0.7229661, 1.670025, 1, 1, 1, 1, 1,
0.3961134, 0.943558, 0.6953256, 1, 1, 1, 1, 1,
0.3969141, 1.090569, -0.2806623, 1, 1, 1, 1, 1,
0.4034586, -1.45396, 1.134913, 1, 1, 1, 1, 1,
0.4037283, -1.670736, 2.923754, 1, 1, 1, 1, 1,
0.404438, -0.8671095, 3.166553, 1, 1, 1, 1, 1,
0.4058329, -0.2695252, 1.975789, 1, 1, 1, 1, 1,
0.406517, -1.120012, 3.268097, 1, 1, 1, 1, 1,
0.4094587, -0.1789769, 0.7646676, 1, 1, 1, 1, 1,
0.4117808, -0.7753575, 3.273418, 1, 1, 1, 1, 1,
0.4178287, 1.148376, -1.341242, 1, 1, 1, 1, 1,
0.418771, -0.9159815, 1.847576, 1, 1, 1, 1, 1,
0.4197829, 0.545987, 1.509539, 1, 1, 1, 1, 1,
0.4205215, 0.60106, 0.03028913, 1, 1, 1, 1, 1,
0.4227346, -1.648939, 2.8397, 1, 1, 1, 1, 1,
0.4422737, 0.8210758, -0.2390675, 0, 0, 1, 1, 1,
0.4452483, 1.014644, 1.677607, 1, 0, 0, 1, 1,
0.4455853, 2.670848, 0.7285203, 1, 0, 0, 1, 1,
0.4568994, -1.434954, 2.514446, 1, 0, 0, 1, 1,
0.4584411, -0.1416381, 1.657566, 1, 0, 0, 1, 1,
0.4631279, 1.804366, -1.747584, 1, 0, 0, 1, 1,
0.4637779, 0.773011, 0.20689, 0, 0, 0, 1, 1,
0.464652, 0.005898818, 3.63689, 0, 0, 0, 1, 1,
0.4717131, 0.3989935, 1.860059, 0, 0, 0, 1, 1,
0.4781429, 1.218322, 0.03104988, 0, 0, 0, 1, 1,
0.4867078, -0.7734609, 2.265367, 0, 0, 0, 1, 1,
0.4875967, 1.487517, 0.3445545, 0, 0, 0, 1, 1,
0.4876323, 0.7342554, 0.9896876, 0, 0, 0, 1, 1,
0.4888863, -0.6090264, 1.768106, 1, 1, 1, 1, 1,
0.4888947, 0.2923636, -0.5241945, 1, 1, 1, 1, 1,
0.490085, -0.3638263, 2.899593, 1, 1, 1, 1, 1,
0.4903531, 2.423057, 1.211483, 1, 1, 1, 1, 1,
0.4933131, -0.0240345, 3.813969, 1, 1, 1, 1, 1,
0.494589, -0.5910019, 2.611471, 1, 1, 1, 1, 1,
0.4953972, 1.314309, 0.3935198, 1, 1, 1, 1, 1,
0.4955985, -0.8660358, 2.620566, 1, 1, 1, 1, 1,
0.4987852, 0.6502923, -0.9525518, 1, 1, 1, 1, 1,
0.5065876, 1.889477, 0.2859572, 1, 1, 1, 1, 1,
0.5111724, 2.191213, 0.3366389, 1, 1, 1, 1, 1,
0.5125022, -0.2723685, 3.812814, 1, 1, 1, 1, 1,
0.5139912, 0.6469457, -0.4055826, 1, 1, 1, 1, 1,
0.5168358, 0.1521602, 2.266984, 1, 1, 1, 1, 1,
0.519129, -0.851859, 1.858679, 1, 1, 1, 1, 1,
0.5218365, -0.120704, 3.020885, 0, 0, 1, 1, 1,
0.52832, -0.9870278, 3.095505, 1, 0, 0, 1, 1,
0.5320899, 0.8009918, 2.173002, 1, 0, 0, 1, 1,
0.5333869, 1.550432, 0.4819086, 1, 0, 0, 1, 1,
0.5336667, -0.3161493, 2.098464, 1, 0, 0, 1, 1,
0.5354413, -1.044599, 1.994973, 1, 0, 0, 1, 1,
0.5355111, 0.7003787, -0.2109836, 0, 0, 0, 1, 1,
0.5384022, -0.638876, 2.717406, 0, 0, 0, 1, 1,
0.5486892, -0.7704794, 2.774612, 0, 0, 0, 1, 1,
0.5489702, -1.072352, 2.253189, 0, 0, 0, 1, 1,
0.5594053, -0.7058343, 2.154405, 0, 0, 0, 1, 1,
0.5599084, 0.2541723, 1.322765, 0, 0, 0, 1, 1,
0.5609913, 1.679068, 2.119368, 0, 0, 0, 1, 1,
0.5620035, 0.8470247, 1.36817, 1, 1, 1, 1, 1,
0.5632424, -0.1254095, 1.282836, 1, 1, 1, 1, 1,
0.5683798, -0.5723966, 1.874375, 1, 1, 1, 1, 1,
0.5727724, -0.6181682, 1.457271, 1, 1, 1, 1, 1,
0.5758147, 0.2991683, -0.05478496, 1, 1, 1, 1, 1,
0.5793714, -0.3822203, 3.846087, 1, 1, 1, 1, 1,
0.5797687, -1.42293, 3.555514, 1, 1, 1, 1, 1,
0.5843024, 0.3019744, 0.3845266, 1, 1, 1, 1, 1,
0.5849523, -0.7787915, 2.142005, 1, 1, 1, 1, 1,
0.5875951, -1.260757, 3.749883, 1, 1, 1, 1, 1,
0.5886223, 0.9758623, 0.4839754, 1, 1, 1, 1, 1,
0.5908782, -0.9316046, 2.49826, 1, 1, 1, 1, 1,
0.5928434, 2.221539, -0.1112518, 1, 1, 1, 1, 1,
0.59543, -1.414744, 6.057894, 1, 1, 1, 1, 1,
0.5968201, -1.137023, 5.35037, 1, 1, 1, 1, 1,
0.6010861, -1.090363, 2.118356, 0, 0, 1, 1, 1,
0.6024687, -0.4474163, 1.333963, 1, 0, 0, 1, 1,
0.6052002, 0.8537439, 1.357162, 1, 0, 0, 1, 1,
0.6053631, -0.04417322, -0.2649362, 1, 0, 0, 1, 1,
0.610702, 1.361879, 0.2645102, 1, 0, 0, 1, 1,
0.6218216, 0.2866597, 0.2831721, 1, 0, 0, 1, 1,
0.6221775, -1.188204, 0.6539328, 0, 0, 0, 1, 1,
0.6223357, -0.00964099, 1.105211, 0, 0, 0, 1, 1,
0.6316524, 1.117183, 0.3934859, 0, 0, 0, 1, 1,
0.6330661, 0.7799335, -0.5893249, 0, 0, 0, 1, 1,
0.6332519, -0.2321762, 3.59019, 0, 0, 0, 1, 1,
0.6376411, 0.3485602, -0.3316905, 0, 0, 0, 1, 1,
0.638393, -0.1819837, 0.9524926, 0, 0, 0, 1, 1,
0.6440436, 0.7611722, 0.1224735, 1, 1, 1, 1, 1,
0.6447938, -2.037218, 3.77255, 1, 1, 1, 1, 1,
0.6463413, 0.5733257, 0.2986653, 1, 1, 1, 1, 1,
0.6463791, -0.6902934, 0.9155554, 1, 1, 1, 1, 1,
0.652316, 0.4171435, 1.863054, 1, 1, 1, 1, 1,
0.6590322, -1.079673, 3.71653, 1, 1, 1, 1, 1,
0.6622701, 0.4571595, -0.7145764, 1, 1, 1, 1, 1,
0.6678395, -0.5276102, 2.620694, 1, 1, 1, 1, 1,
0.670711, -1.617392, 3.033132, 1, 1, 1, 1, 1,
0.6772072, -0.1119051, 1.991364, 1, 1, 1, 1, 1,
0.6830597, -0.3874643, 0.8014802, 1, 1, 1, 1, 1,
0.6859879, -1.223137, 3.622016, 1, 1, 1, 1, 1,
0.686678, -0.2212874, 2.0329, 1, 1, 1, 1, 1,
0.7084833, -0.3096975, 2.076647, 1, 1, 1, 1, 1,
0.7098014, -2.462413, 2.408915, 1, 1, 1, 1, 1,
0.7117724, 0.02870824, -0.3481768, 0, 0, 1, 1, 1,
0.715241, 0.9558799, 0.3227113, 1, 0, 0, 1, 1,
0.7180624, 0.8016214, 1.204243, 1, 0, 0, 1, 1,
0.7189899, -0.4998234, 1.579985, 1, 0, 0, 1, 1,
0.7192774, 0.5394589, 1.615085, 1, 0, 0, 1, 1,
0.721328, 0.9554921, -0.4826823, 1, 0, 0, 1, 1,
0.7235386, -0.9119164, 3.538987, 0, 0, 0, 1, 1,
0.7400435, 0.9529796, 3.041122, 0, 0, 0, 1, 1,
0.7407345, 1.263493, 0.7971241, 0, 0, 0, 1, 1,
0.7430931, -0.6399485, 1.690827, 0, 0, 0, 1, 1,
0.743171, 0.6434588, 2.024109, 0, 0, 0, 1, 1,
0.7469812, -0.3927868, 2.300938, 0, 0, 0, 1, 1,
0.7474017, 1.683008, -0.9547697, 0, 0, 0, 1, 1,
0.7514542, -0.2291712, 2.908939, 1, 1, 1, 1, 1,
0.7545205, 0.5687699, -0.2061954, 1, 1, 1, 1, 1,
0.7572399, 0.2212386, 0.814939, 1, 1, 1, 1, 1,
0.7617934, -1.15007, 2.966448, 1, 1, 1, 1, 1,
0.7626938, 0.4642689, 0.8233148, 1, 1, 1, 1, 1,
0.7633568, 0.1092487, 0.7750909, 1, 1, 1, 1, 1,
0.7643234, 0.0138717, 1.051079, 1, 1, 1, 1, 1,
0.7646809, 0.6421192, 1.979836, 1, 1, 1, 1, 1,
0.7719439, -0.6367926, 3.272584, 1, 1, 1, 1, 1,
0.7737573, 0.9258948, 0.4245161, 1, 1, 1, 1, 1,
0.7770912, 1.088531, -0.5198503, 1, 1, 1, 1, 1,
0.777486, -1.453577, 1.181594, 1, 1, 1, 1, 1,
0.7793214, 0.2395887, 2.521541, 1, 1, 1, 1, 1,
0.7833048, -0.8987582, 2.192859, 1, 1, 1, 1, 1,
0.7833538, -0.4809238, 2.066642, 1, 1, 1, 1, 1,
0.7842115, 0.294594, 1.305532, 0, 0, 1, 1, 1,
0.7863017, 1.43115, -1.605562, 1, 0, 0, 1, 1,
0.7904251, 3.063987, -1.447187, 1, 0, 0, 1, 1,
0.7915197, -0.1132423, 2.445693, 1, 0, 0, 1, 1,
0.7942373, 0.4740842, 0.232336, 1, 0, 0, 1, 1,
0.7957129, 0.351464, 2.961205, 1, 0, 0, 1, 1,
0.7979569, 0.7625762, 2.051883, 0, 0, 0, 1, 1,
0.7993681, -0.6680541, 2.673038, 0, 0, 0, 1, 1,
0.8003674, -2.693944, 3.686164, 0, 0, 0, 1, 1,
0.8022127, 1.510761, 0.1553519, 0, 0, 0, 1, 1,
0.8052182, -2.020748, 1.221809, 0, 0, 0, 1, 1,
0.805571, -0.467358, 1.67461, 0, 0, 0, 1, 1,
0.8089805, 0.2939516, 2.279101, 0, 0, 0, 1, 1,
0.8094532, -0.7359015, 4.070507, 1, 1, 1, 1, 1,
0.811022, -0.1603882, 2.773614, 1, 1, 1, 1, 1,
0.819394, 0.3148166, 1.576626, 1, 1, 1, 1, 1,
0.8313424, 0.9825815, -0.3934763, 1, 1, 1, 1, 1,
0.834778, 0.09859607, 1.48633, 1, 1, 1, 1, 1,
0.8451092, -1.314603, 2.329564, 1, 1, 1, 1, 1,
0.8467036, 1.064622, -0.9621304, 1, 1, 1, 1, 1,
0.8507719, 0.8552108, 0.5020977, 1, 1, 1, 1, 1,
0.8510869, 0.4592198, -0.02702997, 1, 1, 1, 1, 1,
0.8577923, 1.474376, 0.5391523, 1, 1, 1, 1, 1,
0.8591021, -0.8607771, 0.9739124, 1, 1, 1, 1, 1,
0.8604137, 0.4105587, 1.1922, 1, 1, 1, 1, 1,
0.8616846, -1.337039, 2.093258, 1, 1, 1, 1, 1,
0.8652954, 0.3920858, 1.20155, 1, 1, 1, 1, 1,
0.8699406, -0.6526266, 2.666933, 1, 1, 1, 1, 1,
0.8701385, -2.959421, 2.590721, 0, 0, 1, 1, 1,
0.8783844, 0.3540736, 0.4044163, 1, 0, 0, 1, 1,
0.8797453, -1.533139, 3.587982, 1, 0, 0, 1, 1,
0.8866349, 1.028314, -0.7431765, 1, 0, 0, 1, 1,
0.8893216, 0.7126974, 1.868034, 1, 0, 0, 1, 1,
0.8960249, -0.298249, 2.703038, 1, 0, 0, 1, 1,
0.9003437, 0.8352807, -0.01896745, 0, 0, 0, 1, 1,
0.9034445, 0.6485693, 0.3122074, 0, 0, 0, 1, 1,
0.9038635, 0.6386673, 2.495313, 0, 0, 0, 1, 1,
0.9109665, 1.198066, -0.01298374, 0, 0, 0, 1, 1,
0.9159012, 1.343647, 1.880269, 0, 0, 0, 1, 1,
0.9232076, -0.1752132, 2.44252, 0, 0, 0, 1, 1,
0.9321614, -1.600373, 2.660431, 0, 0, 0, 1, 1,
0.9356802, 0.7253099, 0.976324, 1, 1, 1, 1, 1,
0.9394248, 1.390563, 1.831369, 1, 1, 1, 1, 1,
0.9416345, -0.2677746, 1.026256, 1, 1, 1, 1, 1,
0.9434217, 0.6468582, -0.009881243, 1, 1, 1, 1, 1,
0.9454556, 0.07927071, 0.8857682, 1, 1, 1, 1, 1,
0.9485383, -0.6518187, 1.995008, 1, 1, 1, 1, 1,
0.9490643, 0.3678671, 2.545011, 1, 1, 1, 1, 1,
0.9491463, 1.162174, 2.030154, 1, 1, 1, 1, 1,
0.9601203, -1.132834, 3.984883, 1, 1, 1, 1, 1,
0.9756228, 0.773329, 0.5989584, 1, 1, 1, 1, 1,
0.979452, 0.3532544, 2.326963, 1, 1, 1, 1, 1,
0.9822771, -0.280412, 2.539912, 1, 1, 1, 1, 1,
0.9835944, 1.290869, 0.1935021, 1, 1, 1, 1, 1,
0.991527, -0.965881, 2.274788, 1, 1, 1, 1, 1,
0.9966812, -0.5556883, 1.605443, 1, 1, 1, 1, 1,
0.9982567, 0.4871404, -1.139668, 0, 0, 1, 1, 1,
0.9991453, 0.3805682, 1.721974, 1, 0, 0, 1, 1,
1.008155, 2.134577, -1.843751, 1, 0, 0, 1, 1,
1.01491, 0.03119036, 2.048958, 1, 0, 0, 1, 1,
1.014951, -0.4198752, 2.712073, 1, 0, 0, 1, 1,
1.016358, -0.1025229, 2.825938, 1, 0, 0, 1, 1,
1.016714, -0.5807156, 1.929422, 0, 0, 0, 1, 1,
1.030101, 0.2749728, 1.666426, 0, 0, 0, 1, 1,
1.030884, -0.1497162, 1.441301, 0, 0, 0, 1, 1,
1.030915, 0.2711405, -0.5362036, 0, 0, 0, 1, 1,
1.039033, -0.5650829, 3.087748, 0, 0, 0, 1, 1,
1.03954, -2.177408, 1.587821, 0, 0, 0, 1, 1,
1.03974, 0.1134948, 2.431466, 0, 0, 0, 1, 1,
1.053089, -0.172492, 2.139309, 1, 1, 1, 1, 1,
1.05375, 0.5714055, -0.9012259, 1, 1, 1, 1, 1,
1.056419, -1.984053, 2.434862, 1, 1, 1, 1, 1,
1.058623, 1.535799, 0.7868167, 1, 1, 1, 1, 1,
1.061172, -1.413672, 1.264308, 1, 1, 1, 1, 1,
1.065471, -0.5243188, 2.591338, 1, 1, 1, 1, 1,
1.067149, -1.905594, 2.195033, 1, 1, 1, 1, 1,
1.071077, -0.8294945, 3.227874, 1, 1, 1, 1, 1,
1.071188, 0.9279532, 0.1348052, 1, 1, 1, 1, 1,
1.081717, -0.5448236, 1.17955, 1, 1, 1, 1, 1,
1.084986, 1.49772, -0.9372355, 1, 1, 1, 1, 1,
1.085372, 1.847992, -0.751997, 1, 1, 1, 1, 1,
1.087909, -2.068088, 2.670784, 1, 1, 1, 1, 1,
1.091141, 0.8293043, -0.3435178, 1, 1, 1, 1, 1,
1.09672, 1.259728, -1.35171, 1, 1, 1, 1, 1,
1.099761, 1.450108, 0.7317178, 0, 0, 1, 1, 1,
1.117746, 1.959482, -0.9440054, 1, 0, 0, 1, 1,
1.119391, 0.3924372, 1.779015, 1, 0, 0, 1, 1,
1.119391, 0.8463751, -0.2227375, 1, 0, 0, 1, 1,
1.121041, -1.87677, 2.939975, 1, 0, 0, 1, 1,
1.121795, 0.642581, -0.213201, 1, 0, 0, 1, 1,
1.132779, 0.3598003, 1.361222, 0, 0, 0, 1, 1,
1.142496, 1.155021, 1.654232, 0, 0, 0, 1, 1,
1.145212, -0.05238063, 2.988887, 0, 0, 0, 1, 1,
1.148525, 0.1479023, 1.822131, 0, 0, 0, 1, 1,
1.158703, 0.6637845, 0.2686136, 0, 0, 0, 1, 1,
1.168289, 1.125699, 1.303191, 0, 0, 0, 1, 1,
1.16996, 1.214476, 1.334879, 0, 0, 0, 1, 1,
1.180037, 0.07709525, 2.352437, 1, 1, 1, 1, 1,
1.181916, 1.196627, 1.067999, 1, 1, 1, 1, 1,
1.189136, -0.2547088, 1.967193, 1, 1, 1, 1, 1,
1.198471, 1.782362, 1.408441, 1, 1, 1, 1, 1,
1.206529, 0.76278, 0.858389, 1, 1, 1, 1, 1,
1.222338, -2.038207, 2.971618, 1, 1, 1, 1, 1,
1.22937, -0.7696674, 3.184137, 1, 1, 1, 1, 1,
1.232653, -1.537183, 1.571362, 1, 1, 1, 1, 1,
1.238473, 0.3696951, 1.48961, 1, 1, 1, 1, 1,
1.239479, 0.3945501, 1.400406, 1, 1, 1, 1, 1,
1.242738, 1.371654, 1.700816, 1, 1, 1, 1, 1,
1.249623, -0.9862618, 2.623111, 1, 1, 1, 1, 1,
1.250885, 0.7019782, 1.753738, 1, 1, 1, 1, 1,
1.252294, -0.1579041, 1.352063, 1, 1, 1, 1, 1,
1.258387, -0.2715322, 2.001732, 1, 1, 1, 1, 1,
1.259241, 2.289953, 1.356941, 0, 0, 1, 1, 1,
1.262764, 0.6017961, -0.2262081, 1, 0, 0, 1, 1,
1.265876, -0.1812717, 2.5449, 1, 0, 0, 1, 1,
1.271122, 1.350101, 0.1314958, 1, 0, 0, 1, 1,
1.271193, -0.1981765, 1.312516, 1, 0, 0, 1, 1,
1.279046, 1.777971, -0.8503598, 1, 0, 0, 1, 1,
1.279472, 0.4215473, 0.9391743, 0, 0, 0, 1, 1,
1.283207, -0.006087194, 0.8199065, 0, 0, 0, 1, 1,
1.296342, -0.6311325, 0.3380118, 0, 0, 0, 1, 1,
1.297441, -1.847521, 2.990316, 0, 0, 0, 1, 1,
1.30499, -0.6315268, 3.826297, 0, 0, 0, 1, 1,
1.317087, 2.204769, -0.7082662, 0, 0, 0, 1, 1,
1.319512, -1.254343, 3.576192, 0, 0, 0, 1, 1,
1.324074, 1.740102, -1.14891, 1, 1, 1, 1, 1,
1.343139, -1.395569, 1.307841, 1, 1, 1, 1, 1,
1.343819, -0.4278177, 1.19162, 1, 1, 1, 1, 1,
1.345061, -1.436057, 3.885032, 1, 1, 1, 1, 1,
1.345736, 2.043354, 1.097921, 1, 1, 1, 1, 1,
1.347096, 0.4768001, 1.730569, 1, 1, 1, 1, 1,
1.362279, 0.7425734, 1.828408, 1, 1, 1, 1, 1,
1.365157, -1.133917, 1.090347, 1, 1, 1, 1, 1,
1.390522, -0.393094, 2.461805, 1, 1, 1, 1, 1,
1.392798, -0.452542, 1.448536, 1, 1, 1, 1, 1,
1.393008, -0.5058312, 2.400303, 1, 1, 1, 1, 1,
1.406148, 0.7539234, -0.3162941, 1, 1, 1, 1, 1,
1.41017, 0.5655373, 1.393054, 1, 1, 1, 1, 1,
1.410708, 0.8427464, 1.14032, 1, 1, 1, 1, 1,
1.412163, -0.6411886, 1.651759, 1, 1, 1, 1, 1,
1.416747, -0.2589587, -0.571831, 0, 0, 1, 1, 1,
1.423498, -1.198474, 1.335736, 1, 0, 0, 1, 1,
1.423745, 0.09614477, 1.19431, 1, 0, 0, 1, 1,
1.43019, 1.203504, 1.014486, 1, 0, 0, 1, 1,
1.435164, -0.623816, 2.545406, 1, 0, 0, 1, 1,
1.437482, -0.4041583, 0.94048, 1, 0, 0, 1, 1,
1.444081, 1.081808, 0.009797161, 0, 0, 0, 1, 1,
1.446837, 1.526873, 0.9491807, 0, 0, 0, 1, 1,
1.456827, -0.6821216, 2.529687, 0, 0, 0, 1, 1,
1.463231, 0.8234414, 2.549696, 0, 0, 0, 1, 1,
1.471663, 1.286811, 1.766184, 0, 0, 0, 1, 1,
1.476239, -0.4058903, 0.8418123, 0, 0, 0, 1, 1,
1.482105, -0.2162206, 0.8653044, 0, 0, 0, 1, 1,
1.503969, 0.668551, 0.1205832, 1, 1, 1, 1, 1,
1.505577, -1.39051, 1.845043, 1, 1, 1, 1, 1,
1.510299, -0.1456932, 2.391003, 1, 1, 1, 1, 1,
1.515319, -0.0006996109, 2.886418, 1, 1, 1, 1, 1,
1.525597, -1.389349, 2.018024, 1, 1, 1, 1, 1,
1.542838, 0.1971597, 0.02981428, 1, 1, 1, 1, 1,
1.546778, 0.2008957, 0.3747039, 1, 1, 1, 1, 1,
1.550305, -0.2896658, 0.5878414, 1, 1, 1, 1, 1,
1.558215, 1.132945, 1.643655, 1, 1, 1, 1, 1,
1.56113, 1.382604, 0.406692, 1, 1, 1, 1, 1,
1.563139, 0.815456, 1.086088, 1, 1, 1, 1, 1,
1.566381, 0.02409187, 1.125193, 1, 1, 1, 1, 1,
1.566682, -0.4410304, 1.99206, 1, 1, 1, 1, 1,
1.57329, 2.520963, 1.360354, 1, 1, 1, 1, 1,
1.601884, -0.4249164, 2.798172, 1, 1, 1, 1, 1,
1.618273, 0.1255457, 2.284922, 0, 0, 1, 1, 1,
1.63309, -0.2196562, 0.1331672, 1, 0, 0, 1, 1,
1.636427, -1.412396, 2.433215, 1, 0, 0, 1, 1,
1.692202, 0.2168524, 2.912645, 1, 0, 0, 1, 1,
1.700232, 1.313543, -1.139602, 1, 0, 0, 1, 1,
1.710145, 1.052684, -0.244905, 1, 0, 0, 1, 1,
1.712381, -0.1976362, 1.628687, 0, 0, 0, 1, 1,
1.726308, -0.4992662, 0.2028051, 0, 0, 0, 1, 1,
1.732179, -1.167908, 2.910904, 0, 0, 0, 1, 1,
1.751945, 0.02770978, -0.1410507, 0, 0, 0, 1, 1,
1.753198, 0.7814644, 0.7342791, 0, 0, 0, 1, 1,
1.763958, -1.038348, 2.36471, 0, 0, 0, 1, 1,
1.774216, 1.565092, 1.486297, 0, 0, 0, 1, 1,
1.785273, 1.172925, 0.196966, 1, 1, 1, 1, 1,
1.809018, -0.08719338, 1.492793, 1, 1, 1, 1, 1,
1.821333, 0.7303446, 1.608102, 1, 1, 1, 1, 1,
1.828791, 0.9575375, 0.8334731, 1, 1, 1, 1, 1,
1.861526, -0.1792777, 0.3388115, 1, 1, 1, 1, 1,
1.876741, -0.3940603, 1.205943, 1, 1, 1, 1, 1,
1.888456, 0.4974443, 1.757563, 1, 1, 1, 1, 1,
1.893641, 0.5790603, 0.8181333, 1, 1, 1, 1, 1,
1.901193, -0.0142638, 2.493027, 1, 1, 1, 1, 1,
1.906991, -0.3466717, 1.682692, 1, 1, 1, 1, 1,
1.908044, -0.163662, 1.44912, 1, 1, 1, 1, 1,
1.91178, 0.7679881, 1.883405, 1, 1, 1, 1, 1,
1.927455, 1.272093, -0.01143995, 1, 1, 1, 1, 1,
1.949447, 1.305297, 1.407203, 1, 1, 1, 1, 1,
1.966256, -0.2241917, 2.513059, 1, 1, 1, 1, 1,
1.980349, 1.760293, 1.348061, 0, 0, 1, 1, 1,
1.988524, -0.2369367, 0.5055739, 1, 0, 0, 1, 1,
1.994674, -0.5383543, 1.544828, 1, 0, 0, 1, 1,
2.004451, -0.8142139, 3.655763, 1, 0, 0, 1, 1,
2.016158, -0.5235755, 1.492356, 1, 0, 0, 1, 1,
2.032738, -0.2209139, 2.2403, 1, 0, 0, 1, 1,
2.096646, 0.4949774, 0.701305, 0, 0, 0, 1, 1,
2.127645, -0.05288329, 1.665804, 0, 0, 0, 1, 1,
2.153893, 0.659705, 1.289656, 0, 0, 0, 1, 1,
2.162732, 1.595523, 0.02416807, 0, 0, 0, 1, 1,
2.167262, 0.2341223, 1.939385, 0, 0, 0, 1, 1,
2.192474, -0.8337988, 0.8317484, 0, 0, 0, 1, 1,
2.204478, -1.723328, 1.614425, 0, 0, 0, 1, 1,
2.35865, -0.6497194, 4.450011, 1, 1, 1, 1, 1,
2.444959, -0.05843888, 1.516068, 1, 1, 1, 1, 1,
2.495246, -1.001025, 2.580335, 1, 1, 1, 1, 1,
2.52249, -0.2918285, 1.044762, 1, 1, 1, 1, 1,
2.541255, -0.7938691, 2.05753, 1, 1, 1, 1, 1,
3.011998, 0.1195858, 1.964599, 1, 1, 1, 1, 1,
3.0193, 0.3822882, 1.909162, 1, 1, 1, 1, 1
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
var radius = 9.656673;
var distance = 33.91865;
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
mvMatrix.translate( 0.1027997, 0.05145597, -0.4898927 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.91865);
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