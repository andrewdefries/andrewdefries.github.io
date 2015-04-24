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
-3.72019, 0.5071791, -1.702601, 1, 0, 0, 1,
-3.606426, -0.2076283, -1.312249, 1, 0.007843138, 0, 1,
-3.298151, -0.0008303705, -1.839582, 1, 0.01176471, 0, 1,
-3.019712, -1.016185, -2.460051, 1, 0.01960784, 0, 1,
-2.900915, 0.4539672, 0.7699976, 1, 0.02352941, 0, 1,
-2.801172, -0.5282287, -2.475123, 1, 0.03137255, 0, 1,
-2.625387, 2.071416, -1.117004, 1, 0.03529412, 0, 1,
-2.524974, 0.965964, -0.8956048, 1, 0.04313726, 0, 1,
-2.523374, -0.6766492, -2.202557, 1, 0.04705882, 0, 1,
-2.490725, 0.7032616, -0.5570394, 1, 0.05490196, 0, 1,
-2.445852, -0.7357647, -1.700083, 1, 0.05882353, 0, 1,
-2.422171, 1.316499, 0.3721924, 1, 0.06666667, 0, 1,
-2.38153, -1.220893, -0.1332552, 1, 0.07058824, 0, 1,
-2.372359, 0.3656646, -0.4430974, 1, 0.07843138, 0, 1,
-2.283035, 0.05054637, 0.4752933, 1, 0.08235294, 0, 1,
-2.254151, 0.5462101, -2.445476, 1, 0.09019608, 0, 1,
-2.198853, -1.121708, -1.724602, 1, 0.09411765, 0, 1,
-2.186809, 1.424296, -1.745514, 1, 0.1019608, 0, 1,
-2.181876, 1.84629, -1.204885, 1, 0.1098039, 0, 1,
-2.16901, 1.513972, -0.411394, 1, 0.1137255, 0, 1,
-2.166185, -0.6786379, -2.282676, 1, 0.1215686, 0, 1,
-2.16127, -0.0297464, -1.210602, 1, 0.1254902, 0, 1,
-2.161071, -0.1206074, -1.097892, 1, 0.1333333, 0, 1,
-2.054759, -1.150241, -2.031247, 1, 0.1372549, 0, 1,
-2.051532, 0.1487109, -0.6991704, 1, 0.145098, 0, 1,
-2.019609, -0.4810419, -1.913584, 1, 0.1490196, 0, 1,
-1.977839, -1.957905, -1.811338, 1, 0.1568628, 0, 1,
-1.941602, -0.1153746, -1.837411, 1, 0.1607843, 0, 1,
-1.880836, 0.8573596, -0.1495065, 1, 0.1686275, 0, 1,
-1.849435, -1.376353, -1.323744, 1, 0.172549, 0, 1,
-1.844645, 1.604872, -0.5863188, 1, 0.1803922, 0, 1,
-1.811933, 0.8760133, -1.317266, 1, 0.1843137, 0, 1,
-1.810241, 0.06169069, -0.9197895, 1, 0.1921569, 0, 1,
-1.795242, 2.147277, -0.5704964, 1, 0.1960784, 0, 1,
-1.789512, 0.3404559, -1.4771, 1, 0.2039216, 0, 1,
-1.783651, 1.097332, -1.142202, 1, 0.2117647, 0, 1,
-1.768148, 0.7560008, -1.27098, 1, 0.2156863, 0, 1,
-1.762186, -1.366826, -2.334749, 1, 0.2235294, 0, 1,
-1.748905, -1.152832, -1.732634, 1, 0.227451, 0, 1,
-1.721477, -0.9325173, -3.136578, 1, 0.2352941, 0, 1,
-1.707056, -0.2256817, -0.7723069, 1, 0.2392157, 0, 1,
-1.702593, -1.317272, -0.3087967, 1, 0.2470588, 0, 1,
-1.699552, 0.6167006, -0.5987918, 1, 0.2509804, 0, 1,
-1.681179, -0.1293667, -2.927721, 1, 0.2588235, 0, 1,
-1.671569, -0.1009328, -1.758368, 1, 0.2627451, 0, 1,
-1.657923, -0.7794383, -1.258123, 1, 0.2705882, 0, 1,
-1.644796, 1.567947, -0.4626828, 1, 0.2745098, 0, 1,
-1.640056, 0.1114758, -0.7292526, 1, 0.282353, 0, 1,
-1.634676, 0.2337372, -2.385914, 1, 0.2862745, 0, 1,
-1.626739, -0.6420821, -2.700477, 1, 0.2941177, 0, 1,
-1.608153, -0.7978002, -0.9391842, 1, 0.3019608, 0, 1,
-1.605597, 1.263589, -0.9142061, 1, 0.3058824, 0, 1,
-1.598675, -0.5427817, -0.7401648, 1, 0.3137255, 0, 1,
-1.597778, 1.108668, 2.27479, 1, 0.3176471, 0, 1,
-1.595313, 0.3079017, -0.245559, 1, 0.3254902, 0, 1,
-1.594645, -0.2642296, -1.318137, 1, 0.3294118, 0, 1,
-1.589578, -0.7078163, -1.510192, 1, 0.3372549, 0, 1,
-1.585082, 0.5499958, -0.6882662, 1, 0.3411765, 0, 1,
-1.572496, -1.221592, -3.45883, 1, 0.3490196, 0, 1,
-1.572495, -0.9650807, -0.3651506, 1, 0.3529412, 0, 1,
-1.56434, 0.5586968, -1.067225, 1, 0.3607843, 0, 1,
-1.547449, -0.3094579, -4.203062, 1, 0.3647059, 0, 1,
-1.545259, 0.7381243, -2.321782, 1, 0.372549, 0, 1,
-1.54018, -0.3635328, -1.703258, 1, 0.3764706, 0, 1,
-1.53799, -0.7205807, -1.415557, 1, 0.3843137, 0, 1,
-1.526708, 0.03316126, -1.192288, 1, 0.3882353, 0, 1,
-1.493355, 1.366125, 0.09288848, 1, 0.3960784, 0, 1,
-1.491489, 0.3140745, -2.117498, 1, 0.4039216, 0, 1,
-1.484213, 0.2368073, -1.367862, 1, 0.4078431, 0, 1,
-1.481548, 0.3944649, -2.620931, 1, 0.4156863, 0, 1,
-1.480669, -1.290628, -1.637887, 1, 0.4196078, 0, 1,
-1.472879, -1.11099, -1.396403, 1, 0.427451, 0, 1,
-1.472258, -0.9176756, -2.771831, 1, 0.4313726, 0, 1,
-1.471566, -0.321164, -0.4614722, 1, 0.4392157, 0, 1,
-1.442485, 0.2985374, -1.142946, 1, 0.4431373, 0, 1,
-1.439671, 0.4633249, -0.1269394, 1, 0.4509804, 0, 1,
-1.4323, 0.9153295, -1.381697, 1, 0.454902, 0, 1,
-1.42959, 1.438167, -0.6114066, 1, 0.4627451, 0, 1,
-1.427142, 0.479845, -1.642796, 1, 0.4666667, 0, 1,
-1.419258, -0.3223584, -0.654165, 1, 0.4745098, 0, 1,
-1.407479, 0.09735959, -2.5772, 1, 0.4784314, 0, 1,
-1.404591, -0.09028499, -2.742857, 1, 0.4862745, 0, 1,
-1.389637, -0.4654537, -1.057907, 1, 0.4901961, 0, 1,
-1.384144, -1.008044, -2.901855, 1, 0.4980392, 0, 1,
-1.380055, -0.4975141, -2.242349, 1, 0.5058824, 0, 1,
-1.37618, 1.018007, -2.514893, 1, 0.509804, 0, 1,
-1.362228, -0.09956682, -1.07127, 1, 0.5176471, 0, 1,
-1.361604, -1.745567, -2.096916, 1, 0.5215687, 0, 1,
-1.356437, 1.145958, -0.8135619, 1, 0.5294118, 0, 1,
-1.344787, -1.358377, -3.447557, 1, 0.5333334, 0, 1,
-1.341154, -1.101941, -2.126621, 1, 0.5411765, 0, 1,
-1.337713, 0.1018013, -2.491728, 1, 0.5450981, 0, 1,
-1.336455, 1.165763, -0.4854817, 1, 0.5529412, 0, 1,
-1.336099, 0.5831219, -0.9002788, 1, 0.5568628, 0, 1,
-1.335844, 0.7751092, -1.183395, 1, 0.5647059, 0, 1,
-1.322649, -0.01297479, -1.338497, 1, 0.5686275, 0, 1,
-1.305961, -0.410123, -3.461396, 1, 0.5764706, 0, 1,
-1.305668, -0.2127895, -1.419653, 1, 0.5803922, 0, 1,
-1.299412, -0.6860281, -1.026143, 1, 0.5882353, 0, 1,
-1.293869, 0.9900828, -1.073244, 1, 0.5921569, 0, 1,
-1.291498, -1.093896, -0.7576534, 1, 0.6, 0, 1,
-1.285265, -0.5138269, -0.6839577, 1, 0.6078432, 0, 1,
-1.279623, 0.8411456, 0.380271, 1, 0.6117647, 0, 1,
-1.269772, -0.1473248, -1.877737, 1, 0.6196079, 0, 1,
-1.269297, 1.220216, -0.6573559, 1, 0.6235294, 0, 1,
-1.267941, 0.9556437, 0.04042993, 1, 0.6313726, 0, 1,
-1.262493, 0.2516739, -1.906061, 1, 0.6352941, 0, 1,
-1.25808, 0.7794465, -1.84898, 1, 0.6431373, 0, 1,
-1.252206, 0.5341766, -1.932443, 1, 0.6470588, 0, 1,
-1.251507, 0.882624, -0.3788596, 1, 0.654902, 0, 1,
-1.250776, 0.4097515, -1.481144, 1, 0.6588235, 0, 1,
-1.250627, 1.153204, 1.306824, 1, 0.6666667, 0, 1,
-1.240145, 0.431431, -1.653427, 1, 0.6705883, 0, 1,
-1.231327, -0.06896397, -1.844653, 1, 0.6784314, 0, 1,
-1.213565, -0.969755, -1.387169, 1, 0.682353, 0, 1,
-1.211929, -1.220026, -3.038031, 1, 0.6901961, 0, 1,
-1.210283, 1.124923, 0.8641889, 1, 0.6941177, 0, 1,
-1.197113, -1.671573, -3.323193, 1, 0.7019608, 0, 1,
-1.192162, 1.445842, -0.677577, 1, 0.7098039, 0, 1,
-1.185326, -0.1201192, -0.9825031, 1, 0.7137255, 0, 1,
-1.180497, -0.2957307, -1.707896, 1, 0.7215686, 0, 1,
-1.179857, -0.4028967, 0.376233, 1, 0.7254902, 0, 1,
-1.174149, -0.6302032, -3.973929, 1, 0.7333333, 0, 1,
-1.160602, -2.191113, -3.020104, 1, 0.7372549, 0, 1,
-1.159381, 0.5656953, -1.620471, 1, 0.7450981, 0, 1,
-1.158877, -0.4048148, -0.2464534, 1, 0.7490196, 0, 1,
-1.157527, 1.432011, -0.8116445, 1, 0.7568628, 0, 1,
-1.147657, -0.5567229, -4.410022, 1, 0.7607843, 0, 1,
-1.142675, -0.8802326, -3.229132, 1, 0.7686275, 0, 1,
-1.137661, 1.060085, 0.364211, 1, 0.772549, 0, 1,
-1.135155, -1.792046, -1.097908, 1, 0.7803922, 0, 1,
-1.134264, -0.03433164, -1.355344, 1, 0.7843137, 0, 1,
-1.129038, -0.3235025, -1.293287, 1, 0.7921569, 0, 1,
-1.126063, 0.2647048, -1.252702, 1, 0.7960784, 0, 1,
-1.109617, -1.278989, -1.466504, 1, 0.8039216, 0, 1,
-1.108805, 0.8406388, 0.8750214, 1, 0.8117647, 0, 1,
-1.089106, -0.3089534, -1.934239, 1, 0.8156863, 0, 1,
-1.088727, 0.720879, -0.0007991503, 1, 0.8235294, 0, 1,
-1.086634, -0.1363934, -0.1782964, 1, 0.827451, 0, 1,
-1.085271, 1.303866, -1.968425, 1, 0.8352941, 0, 1,
-1.08456, -0.4253963, -1.939774, 1, 0.8392157, 0, 1,
-1.083896, 0.7435638, -1.21704, 1, 0.8470588, 0, 1,
-1.081242, 0.6140496, 0.08753555, 1, 0.8509804, 0, 1,
-1.080643, 0.2297934, -0.5984236, 1, 0.8588235, 0, 1,
-1.07401, -0.2241351, -2.080645, 1, 0.8627451, 0, 1,
-1.070333, -0.2580664, -1.472236, 1, 0.8705882, 0, 1,
-1.064985, 1.488684, 0.7481613, 1, 0.8745098, 0, 1,
-1.0514, -3.407666, -2.207629, 1, 0.8823529, 0, 1,
-1.037779, 0.4926561, -0.82772, 1, 0.8862745, 0, 1,
-1.034137, 0.07898226, -2.721521, 1, 0.8941177, 0, 1,
-1.029376, 1.012576, 0.5892166, 1, 0.8980392, 0, 1,
-1.025247, 0.9019593, -0.1227544, 1, 0.9058824, 0, 1,
-1.023069, 1.175987, -0.7499695, 1, 0.9137255, 0, 1,
-1.014785, -0.005300049, 0.08120539, 1, 0.9176471, 0, 1,
-1.014036, 0.4641417, 0.703439, 1, 0.9254902, 0, 1,
-1.011447, 0.6179577, -0.8863715, 1, 0.9294118, 0, 1,
-1.010659, 1.104066, -1.13202, 1, 0.9372549, 0, 1,
-1.01063, 0.1217222, -1.621079, 1, 0.9411765, 0, 1,
-1.008055, -0.4383758, -1.575873, 1, 0.9490196, 0, 1,
-1.000662, 0.9330047, -0.9696627, 1, 0.9529412, 0, 1,
-1.000022, 0.3144192, -2.464704, 1, 0.9607843, 0, 1,
-0.9976982, 0.5365967, -2.968186, 1, 0.9647059, 0, 1,
-0.993311, -2.368712, -2.657599, 1, 0.972549, 0, 1,
-0.9830223, -0.3206328, -1.944865, 1, 0.9764706, 0, 1,
-0.9821044, 0.8873228, -0.4554576, 1, 0.9843137, 0, 1,
-0.9758818, -0.4203758, -2.488603, 1, 0.9882353, 0, 1,
-0.9724256, 0.934168, -0.9409125, 1, 0.9960784, 0, 1,
-0.958379, 1.34768, -1.564195, 0.9960784, 1, 0, 1,
-0.9546632, 0.1773591, -3.220443, 0.9921569, 1, 0, 1,
-0.9438392, 0.5551078, -2.120281, 0.9843137, 1, 0, 1,
-0.940284, 0.2813503, -2.112849, 0.9803922, 1, 0, 1,
-0.9360584, -0.5096889, -1.102234, 0.972549, 1, 0, 1,
-0.9330452, -0.5161549, -1.963928, 0.9686275, 1, 0, 1,
-0.9327089, -1.303239, -1.470213, 0.9607843, 1, 0, 1,
-0.9276147, 0.03796054, -1.493784, 0.9568627, 1, 0, 1,
-0.9234892, -0.8542122, -3.103606, 0.9490196, 1, 0, 1,
-0.9225187, -0.4389642, -1.589789, 0.945098, 1, 0, 1,
-0.9223217, 0.8483172, 1.065942, 0.9372549, 1, 0, 1,
-0.9121199, -1.309793, -1.871743, 0.9333333, 1, 0, 1,
-0.9073433, -0.9226913, -1.012633, 0.9254902, 1, 0, 1,
-0.9056817, -0.6617343, -0.5850332, 0.9215686, 1, 0, 1,
-0.9048105, -1.524234, -2.228308, 0.9137255, 1, 0, 1,
-0.9040157, -0.7226062, -2.910861, 0.9098039, 1, 0, 1,
-0.9017664, -0.03067484, -1.280869, 0.9019608, 1, 0, 1,
-0.8996212, -0.07307, -3.057723, 0.8941177, 1, 0, 1,
-0.8976328, -0.05483125, -1.258025, 0.8901961, 1, 0, 1,
-0.8971853, 0.6436247, -0.1128484, 0.8823529, 1, 0, 1,
-0.8931546, -0.1346977, -2.643025, 0.8784314, 1, 0, 1,
-0.886811, -0.3934571, -2.087483, 0.8705882, 1, 0, 1,
-0.8848658, -1.898668, -3.583996, 0.8666667, 1, 0, 1,
-0.8817027, -0.2328555, 0.2878046, 0.8588235, 1, 0, 1,
-0.8627599, 0.5880293, -1.695624, 0.854902, 1, 0, 1,
-0.8615045, 0.556981, 0.1222545, 0.8470588, 1, 0, 1,
-0.8463907, -0.1255031, -3.694236, 0.8431373, 1, 0, 1,
-0.844718, -0.9925371, -1.913761, 0.8352941, 1, 0, 1,
-0.8386319, 0.6786967, -0.475761, 0.8313726, 1, 0, 1,
-0.8378829, 0.274422, -1.396609, 0.8235294, 1, 0, 1,
-0.8310431, -0.8371575, -1.288429, 0.8196079, 1, 0, 1,
-0.8299996, 1.464307, 0.01031364, 0.8117647, 1, 0, 1,
-0.8288856, -0.00591341, -0.9719784, 0.8078431, 1, 0, 1,
-0.8285813, -0.5164921, -2.108609, 0.8, 1, 0, 1,
-0.8268149, 1.463217, 0.4267341, 0.7921569, 1, 0, 1,
-0.8232872, 0.3665017, -1.58773, 0.7882353, 1, 0, 1,
-0.8154765, 1.196089, -0.5653136, 0.7803922, 1, 0, 1,
-0.8154108, -1.559243, -2.854348, 0.7764706, 1, 0, 1,
-0.8063396, -0.1038423, -1.071183, 0.7686275, 1, 0, 1,
-0.7919225, 1.277318, -1.237058, 0.7647059, 1, 0, 1,
-0.7895633, 1.394956, -0.3930506, 0.7568628, 1, 0, 1,
-0.7839534, 0.9005361, -1.169456, 0.7529412, 1, 0, 1,
-0.7763373, -1.583969, -3.009602, 0.7450981, 1, 0, 1,
-0.774514, 1.619665, 0.4193392, 0.7411765, 1, 0, 1,
-0.7698434, -0.2846471, -2.549577, 0.7333333, 1, 0, 1,
-0.7686745, -0.1107624, -1.544172, 0.7294118, 1, 0, 1,
-0.765567, 0.8073717, -0.1271172, 0.7215686, 1, 0, 1,
-0.7645112, -1.056922, -1.091067, 0.7176471, 1, 0, 1,
-0.7468973, -0.2267205, -0.8416387, 0.7098039, 1, 0, 1,
-0.7464686, -1.946688, -2.39957, 0.7058824, 1, 0, 1,
-0.7386695, -0.8201345, -1.750251, 0.6980392, 1, 0, 1,
-0.7365156, -0.1455873, -2.35566, 0.6901961, 1, 0, 1,
-0.7213668, 0.9118052, -0.6898463, 0.6862745, 1, 0, 1,
-0.7121946, 1.434902, -0.8943145, 0.6784314, 1, 0, 1,
-0.7106548, 0.5268268, 0.5353535, 0.6745098, 1, 0, 1,
-0.7094969, -0.9617021, -0.6936883, 0.6666667, 1, 0, 1,
-0.706718, 1.051251, -1.736835, 0.6627451, 1, 0, 1,
-0.70576, -1.054902, -2.446495, 0.654902, 1, 0, 1,
-0.7054364, 2.404071, -1.19901, 0.6509804, 1, 0, 1,
-0.7053197, 0.1508807, -1.980846, 0.6431373, 1, 0, 1,
-0.7035088, 0.3237714, -0.481956, 0.6392157, 1, 0, 1,
-0.6979598, -0.7344161, -3.046454, 0.6313726, 1, 0, 1,
-0.6978368, -0.2773353, -0.9957769, 0.627451, 1, 0, 1,
-0.6929777, -1.518863, -4.201156, 0.6196079, 1, 0, 1,
-0.6921951, -1.082024, -2.552498, 0.6156863, 1, 0, 1,
-0.6915656, 1.341327, 0.8758561, 0.6078432, 1, 0, 1,
-0.6892589, 0.3550796, -2.087557, 0.6039216, 1, 0, 1,
-0.6855186, 1.287358, -0.08345328, 0.5960785, 1, 0, 1,
-0.6807109, -1.346573, -3.415005, 0.5882353, 1, 0, 1,
-0.6789086, -0.5480062, -3.353494, 0.5843138, 1, 0, 1,
-0.6752063, -1.612248, -4.064682, 0.5764706, 1, 0, 1,
-0.6693386, 1.025352, -1.64426, 0.572549, 1, 0, 1,
-0.6674737, -0.04005539, 0.7263028, 0.5647059, 1, 0, 1,
-0.6647316, -0.8046661, -1.568748, 0.5607843, 1, 0, 1,
-0.659794, -0.7707326, -2.892583, 0.5529412, 1, 0, 1,
-0.6560167, -1.34516, -0.4287997, 0.5490196, 1, 0, 1,
-0.6537647, -0.3388271, -2.970821, 0.5411765, 1, 0, 1,
-0.6536326, -0.08913691, -1.170519, 0.5372549, 1, 0, 1,
-0.6513121, 0.9160661, -1.723617, 0.5294118, 1, 0, 1,
-0.6496138, -0.31184, -0.7622519, 0.5254902, 1, 0, 1,
-0.6493298, 1.156424, -0.817821, 0.5176471, 1, 0, 1,
-0.6354835, -0.5574849, -3.430887, 0.5137255, 1, 0, 1,
-0.6303637, 1.82399, -0.5967065, 0.5058824, 1, 0, 1,
-0.6284105, -1.096103, -2.458097, 0.5019608, 1, 0, 1,
-0.6238291, 0.7381619, -0.3535173, 0.4941176, 1, 0, 1,
-0.6209429, 0.9622292, -0.7838671, 0.4862745, 1, 0, 1,
-0.6198311, -0.1769878, -1.712647, 0.4823529, 1, 0, 1,
-0.6060694, 0.3300273, 0.42943, 0.4745098, 1, 0, 1,
-0.605396, -0.2374697, -1.510003, 0.4705882, 1, 0, 1,
-0.6034617, -0.02210217, -2.147714, 0.4627451, 1, 0, 1,
-0.6021014, 0.3405835, -0.7813107, 0.4588235, 1, 0, 1,
-0.6019192, 0.7641059, -1.702439, 0.4509804, 1, 0, 1,
-0.5926355, -0.2605586, -1.577086, 0.4470588, 1, 0, 1,
-0.5916511, -0.6964436, -3.429166, 0.4392157, 1, 0, 1,
-0.5882791, 0.8829208, -0.8365685, 0.4352941, 1, 0, 1,
-0.5878118, 0.708515, -2.070588, 0.427451, 1, 0, 1,
-0.5875404, -0.9066907, -2.473401, 0.4235294, 1, 0, 1,
-0.5874112, 1.138031, 0.04274365, 0.4156863, 1, 0, 1,
-0.5872118, 1.337661, -1.56139, 0.4117647, 1, 0, 1,
-0.5797901, 1.345271, -0.8826782, 0.4039216, 1, 0, 1,
-0.5736814, -1.808999, -2.452091, 0.3960784, 1, 0, 1,
-0.5730819, -0.2242678, -1.787975, 0.3921569, 1, 0, 1,
-0.5678501, -0.8654897, -1.467613, 0.3843137, 1, 0, 1,
-0.5677053, 0.5132831, -1.612886, 0.3803922, 1, 0, 1,
-0.56536, -0.6743377, -0.6556519, 0.372549, 1, 0, 1,
-0.5610244, 1.194414, -0.2609016, 0.3686275, 1, 0, 1,
-0.5609767, 0.1510638, -1.320983, 0.3607843, 1, 0, 1,
-0.5568519, 1.500937, -1.708526, 0.3568628, 1, 0, 1,
-0.5539967, -1.717446, -2.643491, 0.3490196, 1, 0, 1,
-0.5500497, -1.141485, -2.817293, 0.345098, 1, 0, 1,
-0.5461518, -2.332961, -2.779812, 0.3372549, 1, 0, 1,
-0.5455703, -0.06323574, -1.160619, 0.3333333, 1, 0, 1,
-0.545043, 0.250976, -1.917675, 0.3254902, 1, 0, 1,
-0.5443727, -0.15518, -3.455872, 0.3215686, 1, 0, 1,
-0.5390305, 1.01364, -0.4761252, 0.3137255, 1, 0, 1,
-0.5382915, 0.168768, -1.410242, 0.3098039, 1, 0, 1,
-0.5378813, 1.400558, 0.8731538, 0.3019608, 1, 0, 1,
-0.533889, 0.4010113, -2.398578, 0.2941177, 1, 0, 1,
-0.5306413, -0.9854849, -3.359111, 0.2901961, 1, 0, 1,
-0.5261505, 0.2094519, -2.401599, 0.282353, 1, 0, 1,
-0.5254963, -1.156791, -1.4531, 0.2784314, 1, 0, 1,
-0.5232434, 0.568418, 0.610948, 0.2705882, 1, 0, 1,
-0.5172496, -0.4292516, -2.551546, 0.2666667, 1, 0, 1,
-0.5168778, 0.5141069, -1.161201, 0.2588235, 1, 0, 1,
-0.5163259, -0.5359573, -3.371805, 0.254902, 1, 0, 1,
-0.5102531, -0.9485498, -2.729017, 0.2470588, 1, 0, 1,
-0.5098401, -0.3733981, -1.276547, 0.2431373, 1, 0, 1,
-0.5030067, -1.319134, -4.545401, 0.2352941, 1, 0, 1,
-0.5005533, -0.4265827, -2.463179, 0.2313726, 1, 0, 1,
-0.4989148, -2.1906, -3.511397, 0.2235294, 1, 0, 1,
-0.4988753, -1.147803, -2.481339, 0.2196078, 1, 0, 1,
-0.4963943, 1.59871, 0.5737617, 0.2117647, 1, 0, 1,
-0.4910045, -0.1715083, -1.488912, 0.2078431, 1, 0, 1,
-0.4835429, -2.276576, -2.110271, 0.2, 1, 0, 1,
-0.4813284, 0.420035, 0.488402, 0.1921569, 1, 0, 1,
-0.4787169, -0.5884065, -4.405717, 0.1882353, 1, 0, 1,
-0.4757919, 0.007328046, -0.4384874, 0.1803922, 1, 0, 1,
-0.4757632, 0.05336737, -0.1041014, 0.1764706, 1, 0, 1,
-0.4645021, 0.7486461, 0.7803341, 0.1686275, 1, 0, 1,
-0.4631447, -0.3074245, -2.206352, 0.1647059, 1, 0, 1,
-0.4624066, 1.341459, 0.8829822, 0.1568628, 1, 0, 1,
-0.4519325, -0.1118845, -0.8570287, 0.1529412, 1, 0, 1,
-0.4441839, 0.688269, -0.2254224, 0.145098, 1, 0, 1,
-0.4419832, 0.2091725, -0.7646497, 0.1411765, 1, 0, 1,
-0.4415361, 0.071419, -0.9763451, 0.1333333, 1, 0, 1,
-0.4414455, -1.161565, -2.986053, 0.1294118, 1, 0, 1,
-0.4394886, 0.2795003, -1.828124, 0.1215686, 1, 0, 1,
-0.4350742, -0.5364119, -1.19344, 0.1176471, 1, 0, 1,
-0.4348431, -0.5371001, -1.613623, 0.1098039, 1, 0, 1,
-0.4329615, 0.5835793, -0.8089651, 0.1058824, 1, 0, 1,
-0.4317982, -2.165242, -3.562919, 0.09803922, 1, 0, 1,
-0.4279635, -0.1800064, -0.4277883, 0.09019608, 1, 0, 1,
-0.4273545, -0.9284236, 0.1997454, 0.08627451, 1, 0, 1,
-0.426107, 1.318573, -1.320913, 0.07843138, 1, 0, 1,
-0.4243507, 1.588357, 0.5617284, 0.07450981, 1, 0, 1,
-0.4214334, -0.8329027, -2.657186, 0.06666667, 1, 0, 1,
-0.4204262, -0.380439, -0.09334347, 0.0627451, 1, 0, 1,
-0.4117063, -0.3645284, -2.237824, 0.05490196, 1, 0, 1,
-0.4113102, 1.689447, -0.3633027, 0.05098039, 1, 0, 1,
-0.4100571, 1.27288, -1.399541, 0.04313726, 1, 0, 1,
-0.4097393, -2.724233, -1.194535, 0.03921569, 1, 0, 1,
-0.4086015, 1.085546, -1.60184, 0.03137255, 1, 0, 1,
-0.4051747, -0.6081517, -2.486411, 0.02745098, 1, 0, 1,
-0.3990891, -2.049596, -0.0514317, 0.01960784, 1, 0, 1,
-0.398222, -0.4683732, -3.088525, 0.01568628, 1, 0, 1,
-0.3960214, 0.0225906, -1.14279, 0.007843138, 1, 0, 1,
-0.3943197, 0.5489513, -0.07093367, 0.003921569, 1, 0, 1,
-0.3925106, -1.453637, -3.863919, 0, 1, 0.003921569, 1,
-0.3909058, -1.069439, -3.532774, 0, 1, 0.01176471, 1,
-0.3908157, 0.7951003, 0.8676905, 0, 1, 0.01568628, 1,
-0.3880312, -0.1176058, -1.267762, 0, 1, 0.02352941, 1,
-0.3875217, -0.9269708, -3.064107, 0, 1, 0.02745098, 1,
-0.3820171, -0.32439, -4.058584, 0, 1, 0.03529412, 1,
-0.3799085, -1.041088, -3.009622, 0, 1, 0.03921569, 1,
-0.3779652, 1.27405, -2.026199, 0, 1, 0.04705882, 1,
-0.37641, -0.652128, -1.379401, 0, 1, 0.05098039, 1,
-0.3738949, -0.7809109, -3.263087, 0, 1, 0.05882353, 1,
-0.372964, -0.1239382, -1.551529, 0, 1, 0.0627451, 1,
-0.3688618, 0.1700082, -1.116539, 0, 1, 0.07058824, 1,
-0.3686162, 1.593072, -0.9893629, 0, 1, 0.07450981, 1,
-0.3673631, 0.4130939, 0.08871689, 0, 1, 0.08235294, 1,
-0.3668675, -1.016324, -2.946697, 0, 1, 0.08627451, 1,
-0.3666709, 0.2067596, -1.542788, 0, 1, 0.09411765, 1,
-0.3646222, -1.199273, -2.795413, 0, 1, 0.1019608, 1,
-0.3625205, 0.3246863, -1.053759, 0, 1, 0.1058824, 1,
-0.3560943, -0.6390657, -1.611052, 0, 1, 0.1137255, 1,
-0.3549958, -1.646635, -2.819224, 0, 1, 0.1176471, 1,
-0.3537573, 2.301612, -1.008074, 0, 1, 0.1254902, 1,
-0.3527265, -0.1282291, -0.7692162, 0, 1, 0.1294118, 1,
-0.3522907, -0.6955764, -2.770466, 0, 1, 0.1372549, 1,
-0.3514724, -0.4406839, -2.824205, 0, 1, 0.1411765, 1,
-0.3435215, 1.508325, 1.646576, 0, 1, 0.1490196, 1,
-0.3395796, -1.110282, -2.11331, 0, 1, 0.1529412, 1,
-0.3394408, 0.9424964, -0.4994794, 0, 1, 0.1607843, 1,
-0.3345216, -0.1677194, -2.002995, 0, 1, 0.1647059, 1,
-0.3337439, 0.6836906, -0.8192294, 0, 1, 0.172549, 1,
-0.3320992, -1.34788, -4.418039, 0, 1, 0.1764706, 1,
-0.3315708, -0.4514605, -1.002162, 0, 1, 0.1843137, 1,
-0.3315656, 0.4096993, -1.022254, 0, 1, 0.1882353, 1,
-0.3175088, 0.6900223, -0.3635353, 0, 1, 0.1960784, 1,
-0.3160815, -0.4162634, -1.845104, 0, 1, 0.2039216, 1,
-0.312478, -0.8673076, -3.101911, 0, 1, 0.2078431, 1,
-0.3075845, -2.518359, -3.092253, 0, 1, 0.2156863, 1,
-0.3040666, -1.151884, -3.382343, 0, 1, 0.2196078, 1,
-0.2994643, -0.1552269, -0.2532255, 0, 1, 0.227451, 1,
-0.2993261, 0.6277425, 0.2429354, 0, 1, 0.2313726, 1,
-0.2965885, -1.038885, -3.129078, 0, 1, 0.2392157, 1,
-0.2903099, 0.4917885, -1.067262, 0, 1, 0.2431373, 1,
-0.2875209, 0.7674651, -1.13309, 0, 1, 0.2509804, 1,
-0.2872883, 0.3835347, -0.9128094, 0, 1, 0.254902, 1,
-0.2835951, 0.2280114, -2.047001, 0, 1, 0.2627451, 1,
-0.2802309, 0.1908077, -0.5787138, 0, 1, 0.2666667, 1,
-0.2734087, -0.1243317, -2.709803, 0, 1, 0.2745098, 1,
-0.2727058, -0.4471001, -2.551427, 0, 1, 0.2784314, 1,
-0.2717475, 0.2904313, -1.225555, 0, 1, 0.2862745, 1,
-0.2706118, -2.464448, -3.086751, 0, 1, 0.2901961, 1,
-0.2605503, -0.4300879, -3.554337, 0, 1, 0.2980392, 1,
-0.2511161, -2.184919, -3.991628, 0, 1, 0.3058824, 1,
-0.2421267, 0.1668901, -0.6018594, 0, 1, 0.3098039, 1,
-0.2420622, 0.7503902, -1.431459, 0, 1, 0.3176471, 1,
-0.2407593, -0.4439856, -2.206633, 0, 1, 0.3215686, 1,
-0.2348783, 0.6964459, -0.7696901, 0, 1, 0.3294118, 1,
-0.233842, -1.309968, -2.091956, 0, 1, 0.3333333, 1,
-0.2326381, -0.0588887, -2.021239, 0, 1, 0.3411765, 1,
-0.2324319, 1.161716, -0.4751883, 0, 1, 0.345098, 1,
-0.2295403, -0.2994266, -2.398078, 0, 1, 0.3529412, 1,
-0.2248826, 0.5930151, -0.4366895, 0, 1, 0.3568628, 1,
-0.2219714, 0.4024904, -0.8773155, 0, 1, 0.3647059, 1,
-0.2197483, 0.05356847, -2.928754, 0, 1, 0.3686275, 1,
-0.2151376, 0.1116632, -1.824325, 0, 1, 0.3764706, 1,
-0.2111036, 1.097063, -0.1328608, 0, 1, 0.3803922, 1,
-0.2104626, -0.6632529, -3.439454, 0, 1, 0.3882353, 1,
-0.2103706, -1.08701, -3.667808, 0, 1, 0.3921569, 1,
-0.2050719, -0.4300101, -1.305703, 0, 1, 0.4, 1,
-0.2044915, -0.1083305, -1.997438, 0, 1, 0.4078431, 1,
-0.2028733, -1.669157, -3.601695, 0, 1, 0.4117647, 1,
-0.2011895, 1.80118, 0.4197865, 0, 1, 0.4196078, 1,
-0.1920625, -0.3700162, -2.200742, 0, 1, 0.4235294, 1,
-0.190417, 0.7769294, 0.5272429, 0, 1, 0.4313726, 1,
-0.1849045, 0.9360906, -0.1436023, 0, 1, 0.4352941, 1,
-0.1847914, -1.236216, -4.125288, 0, 1, 0.4431373, 1,
-0.1768038, -0.6848994, -3.277779, 0, 1, 0.4470588, 1,
-0.1651399, -0.4068165, -3.020019, 0, 1, 0.454902, 1,
-0.1637881, 1.945996, -0.2526613, 0, 1, 0.4588235, 1,
-0.1636556, 0.6804228, -0.9523509, 0, 1, 0.4666667, 1,
-0.162486, 0.1964481, -0.6462039, 0, 1, 0.4705882, 1,
-0.1620764, 0.4854163, -1.822505, 0, 1, 0.4784314, 1,
-0.1585321, 0.2125331, -1.090919, 0, 1, 0.4823529, 1,
-0.1566846, -1.496801, -3.389416, 0, 1, 0.4901961, 1,
-0.152268, -0.8448638, -2.548679, 0, 1, 0.4941176, 1,
-0.1475623, 2.088327, 0.09238376, 0, 1, 0.5019608, 1,
-0.1472098, 0.5514544, -1.087348, 0, 1, 0.509804, 1,
-0.1468019, -0.473094, -2.173146, 0, 1, 0.5137255, 1,
-0.1467336, 0.2163124, -2.487763, 0, 1, 0.5215687, 1,
-0.1463401, -0.4898378, -4.473061, 0, 1, 0.5254902, 1,
-0.144984, -0.3062572, -3.272664, 0, 1, 0.5333334, 1,
-0.142865, 1.895889, 1.190939, 0, 1, 0.5372549, 1,
-0.136209, 0.9336792, 0.6523816, 0, 1, 0.5450981, 1,
-0.1358212, 1.122633, -0.446098, 0, 1, 0.5490196, 1,
-0.1340362, 0.2368565, 0.1509337, 0, 1, 0.5568628, 1,
-0.129024, 1.264523, -0.9418426, 0, 1, 0.5607843, 1,
-0.1223727, -1.726796, -2.124231, 0, 1, 0.5686275, 1,
-0.1218368, -1.045752, -2.208276, 0, 1, 0.572549, 1,
-0.1181219, -0.3543302, -4.139868, 0, 1, 0.5803922, 1,
-0.1161114, 0.6416765, 1.450032, 0, 1, 0.5843138, 1,
-0.1155679, 1.0484, -1.328068, 0, 1, 0.5921569, 1,
-0.1121236, 0.4735009, 1.729054, 0, 1, 0.5960785, 1,
-0.1071731, 0.6136609, -0.8144938, 0, 1, 0.6039216, 1,
-0.1071354, 0.6411282, -1.463628, 0, 1, 0.6117647, 1,
-0.1056569, 0.749544, -1.680216, 0, 1, 0.6156863, 1,
-0.09977914, -0.625939, -3.245676, 0, 1, 0.6235294, 1,
-0.0960432, 0.1700597, 1.009502, 0, 1, 0.627451, 1,
-0.09569562, 1.410272, 0.06821845, 0, 1, 0.6352941, 1,
-0.0910034, 1.19623, -0.285158, 0, 1, 0.6392157, 1,
-0.08690084, -1.111454, -2.014116, 0, 1, 0.6470588, 1,
-0.08541575, -1.689323, -3.520315, 0, 1, 0.6509804, 1,
-0.08290303, -0.8560838, -3.032276, 0, 1, 0.6588235, 1,
-0.07638871, 0.03533076, -3.175045, 0, 1, 0.6627451, 1,
-0.07566579, -0.6746051, -2.955691, 0, 1, 0.6705883, 1,
-0.07299572, -0.01719478, -3.37001, 0, 1, 0.6745098, 1,
-0.0694859, 0.3108896, 0.09465139, 0, 1, 0.682353, 1,
-0.06526453, 1.007067, -0.39865, 0, 1, 0.6862745, 1,
-0.06434458, -0.8360756, -2.469676, 0, 1, 0.6941177, 1,
-0.06144651, -2.130299, -3.44585, 0, 1, 0.7019608, 1,
-0.05863884, 0.9225222, -0.3285133, 0, 1, 0.7058824, 1,
-0.058436, 0.07854776, -0.3665687, 0, 1, 0.7137255, 1,
-0.05703254, -0.4508217, -2.239699, 0, 1, 0.7176471, 1,
-0.05647612, 0.6240222, -0.7957637, 0, 1, 0.7254902, 1,
-0.04945419, 1.455882, -1.177064, 0, 1, 0.7294118, 1,
-0.0488762, -2.586024, -2.589184, 0, 1, 0.7372549, 1,
-0.04447632, -0.1852821, -1.445398, 0, 1, 0.7411765, 1,
-0.04261522, -0.3377022, -4.661848, 0, 1, 0.7490196, 1,
-0.04208784, -0.06832177, -1.491093, 0, 1, 0.7529412, 1,
-0.04193395, 2.226414, 1.42923, 0, 1, 0.7607843, 1,
-0.04028778, 0.9784436, -0.6836319, 0, 1, 0.7647059, 1,
-0.03881129, -0.4982265, -4.082254, 0, 1, 0.772549, 1,
-0.03860698, -1.117599, -4.798875, 0, 1, 0.7764706, 1,
-0.03569287, 0.87612, 0.4894789, 0, 1, 0.7843137, 1,
-0.03084231, -1.657706, -1.396909, 0, 1, 0.7882353, 1,
-0.02951141, -0.82172, -3.400269, 0, 1, 0.7960784, 1,
-0.02810255, -0.01472351, -3.433418, 0, 1, 0.8039216, 1,
-0.02011002, -0.179536, -3.538174, 0, 1, 0.8078431, 1,
-0.01960493, 0.8964072, 0.7766144, 0, 1, 0.8156863, 1,
-0.01715514, -1.330551, -3.00556, 0, 1, 0.8196079, 1,
-0.01464124, 0.9044095, -2.83018, 0, 1, 0.827451, 1,
-0.01233204, 0.6164089, 0.4401863, 0, 1, 0.8313726, 1,
-0.01044807, 1.026125, -0.5622917, 0, 1, 0.8392157, 1,
-0.008580026, 0.918615, 1.138622, 0, 1, 0.8431373, 1,
-0.007414095, -0.4153418, -3.582678, 0, 1, 0.8509804, 1,
-0.006920411, 1.697812, 0.9065441, 0, 1, 0.854902, 1,
-0.004218092, -0.05648764, -1.390258, 0, 1, 0.8627451, 1,
-0.002571404, 0.6640202, -0.5679874, 0, 1, 0.8666667, 1,
-0.002436874, 0.06566842, -0.8839407, 0, 1, 0.8745098, 1,
-0.002008528, -1.235745, -3.809997, 0, 1, 0.8784314, 1,
-0.000395768, 1.470664, 0.4359363, 0, 1, 0.8862745, 1,
0.008853253, 0.2378257, 0.1401599, 0, 1, 0.8901961, 1,
0.009159246, 0.1187043, -0.1297811, 0, 1, 0.8980392, 1,
0.009412874, -1.527866, 2.248032, 0, 1, 0.9058824, 1,
0.009881356, -0.1800734, 2.698716, 0, 1, 0.9098039, 1,
0.01410057, 0.006876969, 0.403247, 0, 1, 0.9176471, 1,
0.01756436, 0.6828012, 1.479576, 0, 1, 0.9215686, 1,
0.02705081, -0.2375398, 2.629514, 0, 1, 0.9294118, 1,
0.02743653, -1.18461, 3.97244, 0, 1, 0.9333333, 1,
0.03381499, 0.4045887, -3.35185, 0, 1, 0.9411765, 1,
0.03473201, -0.4523464, 4.896841, 0, 1, 0.945098, 1,
0.03713714, -1.218963, 2.076414, 0, 1, 0.9529412, 1,
0.03997606, 0.3378475, -1.86988, 0, 1, 0.9568627, 1,
0.04049217, -1.289299, 5.119638, 0, 1, 0.9647059, 1,
0.0408622, -1.682086, 2.843405, 0, 1, 0.9686275, 1,
0.04093381, -1.00735, 4.511446, 0, 1, 0.9764706, 1,
0.04102424, 0.6458162, -0.8946247, 0, 1, 0.9803922, 1,
0.04736889, 0.9468054, 0.2585091, 0, 1, 0.9882353, 1,
0.05833458, -0.01724525, 1.110156, 0, 1, 0.9921569, 1,
0.05985115, 0.009665867, 0.9849694, 0, 1, 1, 1,
0.06045277, -0.418667, 0.6993281, 0, 0.9921569, 1, 1,
0.07425085, -1.772332, 4.032122, 0, 0.9882353, 1, 1,
0.07556, -2.102364, 4.859366, 0, 0.9803922, 1, 1,
0.07661545, 1.91632, -0.07286642, 0, 0.9764706, 1, 1,
0.07702003, 0.02880617, 2.462681, 0, 0.9686275, 1, 1,
0.08049268, 1.635882, 0.125001, 0, 0.9647059, 1, 1,
0.08446641, -2.296165, 3.09027, 0, 0.9568627, 1, 1,
0.08620802, -0.8933468, 2.725873, 0, 0.9529412, 1, 1,
0.09292698, 0.4953521, 1.650001, 0, 0.945098, 1, 1,
0.09568511, 0.05334128, 0.9372622, 0, 0.9411765, 1, 1,
0.09631095, 0.6506582, -1.003868, 0, 0.9333333, 1, 1,
0.09718912, -1.21438, 2.907516, 0, 0.9294118, 1, 1,
0.1000372, -0.7565631, 2.402025, 0, 0.9215686, 1, 1,
0.1030441, 1.592784, 0.0112114, 0, 0.9176471, 1, 1,
0.1049473, -0.7117301, 2.115367, 0, 0.9098039, 1, 1,
0.1066809, 0.1225229, 0.9040911, 0, 0.9058824, 1, 1,
0.108333, 1.483773, -0.6796377, 0, 0.8980392, 1, 1,
0.1092124, 1.280507, 0.8193216, 0, 0.8901961, 1, 1,
0.1113012, -2.716669, 2.866589, 0, 0.8862745, 1, 1,
0.1151201, 0.4389957, -1.323764, 0, 0.8784314, 1, 1,
0.1245614, 0.1060478, -0.1686893, 0, 0.8745098, 1, 1,
0.1246709, 1.186525, -1.113802, 0, 0.8666667, 1, 1,
0.1256245, 1.425632, 0.9887496, 0, 0.8627451, 1, 1,
0.1291727, 0.6739784, -0.7602334, 0, 0.854902, 1, 1,
0.1311371, -0.009988338, 0.826539, 0, 0.8509804, 1, 1,
0.1323243, 0.9924943, -1.058095, 0, 0.8431373, 1, 1,
0.1339191, -0.3145681, 1.966611, 0, 0.8392157, 1, 1,
0.1345047, 0.03018045, -0.6371222, 0, 0.8313726, 1, 1,
0.1369099, 0.7398832, 0.3312466, 0, 0.827451, 1, 1,
0.1406797, 2.75167, 0.1347994, 0, 0.8196079, 1, 1,
0.1429841, -0.6887234, 2.669522, 0, 0.8156863, 1, 1,
0.1444492, 1.226477, -0.08594984, 0, 0.8078431, 1, 1,
0.1453747, -0.7268969, 3.137546, 0, 0.8039216, 1, 1,
0.1468066, 3.040541, 0.9679531, 0, 0.7960784, 1, 1,
0.1489628, -0.8068528, 4.290094, 0, 0.7882353, 1, 1,
0.1492674, -0.7974464, 3.910581, 0, 0.7843137, 1, 1,
0.1531048, -0.0666653, 1.081476, 0, 0.7764706, 1, 1,
0.1546777, 0.2749373, -0.451511, 0, 0.772549, 1, 1,
0.1553152, 1.472307, 0.7009395, 0, 0.7647059, 1, 1,
0.1587008, 0.5252391, -0.6216141, 0, 0.7607843, 1, 1,
0.1617906, 1.580027, -1.349613, 0, 0.7529412, 1, 1,
0.1643412, 0.5835741, 0.816052, 0, 0.7490196, 1, 1,
0.1651687, 0.8302975, -0.504678, 0, 0.7411765, 1, 1,
0.1665645, 0.6223966, -0.1208081, 0, 0.7372549, 1, 1,
0.1685946, -0.5024042, 3.776521, 0, 0.7294118, 1, 1,
0.1689844, 0.6200212, -0.04715692, 0, 0.7254902, 1, 1,
0.1696897, 2.264915, 1.941059, 0, 0.7176471, 1, 1,
0.169919, -1.248654, 3.064283, 0, 0.7137255, 1, 1,
0.1703439, 0.1061366, 1.692093, 0, 0.7058824, 1, 1,
0.1739241, -1.614704, 1.919218, 0, 0.6980392, 1, 1,
0.1744567, 0.1586539, 0.1029951, 0, 0.6941177, 1, 1,
0.1751846, 0.5983443, -0.005299212, 0, 0.6862745, 1, 1,
0.1855851, -0.4307067, 2.855679, 0, 0.682353, 1, 1,
0.1911165, 0.4208405, 1.255924, 0, 0.6745098, 1, 1,
0.1935627, 0.4750795, -0.8158188, 0, 0.6705883, 1, 1,
0.1942461, 0.3350049, 0.2214312, 0, 0.6627451, 1, 1,
0.1949244, -0.5976393, 2.00866, 0, 0.6588235, 1, 1,
0.1982289, -0.454289, 1.657456, 0, 0.6509804, 1, 1,
0.202649, 0.9349176, -0.3622085, 0, 0.6470588, 1, 1,
0.2051337, 0.864088, 0.583028, 0, 0.6392157, 1, 1,
0.2084991, 0.4386404, 0.7829373, 0, 0.6352941, 1, 1,
0.2111422, 2.41323, -0.7526547, 0, 0.627451, 1, 1,
0.2121121, 1.652283, 0.1596747, 0, 0.6235294, 1, 1,
0.2125051, 2.142921, 1.088437, 0, 0.6156863, 1, 1,
0.2149581, 0.7556459, 0.342281, 0, 0.6117647, 1, 1,
0.2187445, -0.3550375, 1.33402, 0, 0.6039216, 1, 1,
0.2233927, -0.3162177, 0.6324362, 0, 0.5960785, 1, 1,
0.2244605, 0.4904864, -1.41889, 0, 0.5921569, 1, 1,
0.234431, -0.1220413, 2.946283, 0, 0.5843138, 1, 1,
0.2347408, -0.2032735, 2.262839, 0, 0.5803922, 1, 1,
0.2376513, 0.9673507, 1.602891, 0, 0.572549, 1, 1,
0.2389716, 0.1296201, 2.690499, 0, 0.5686275, 1, 1,
0.244745, -0.02604325, 0.5206895, 0, 0.5607843, 1, 1,
0.2491484, -0.08712327, 2.143386, 0, 0.5568628, 1, 1,
0.2532797, -1.537846, 3.173268, 0, 0.5490196, 1, 1,
0.2605577, 0.119821, 0.05039302, 0, 0.5450981, 1, 1,
0.2619511, -0.255626, 2.693951, 0, 0.5372549, 1, 1,
0.2635981, -0.2486429, 3.436946, 0, 0.5333334, 1, 1,
0.2674027, 1.044269, -1.696036, 0, 0.5254902, 1, 1,
0.272317, 0.7768657, 2.331295, 0, 0.5215687, 1, 1,
0.2752048, -0.7219407, 3.433867, 0, 0.5137255, 1, 1,
0.2768372, 0.6384479, -0.2022151, 0, 0.509804, 1, 1,
0.2830521, -0.448977, 2.97404, 0, 0.5019608, 1, 1,
0.2839895, 0.5713562, 0.7095593, 0, 0.4941176, 1, 1,
0.2856064, 0.1284111, 1.30763, 0, 0.4901961, 1, 1,
0.2869923, -0.7426301, 3.012736, 0, 0.4823529, 1, 1,
0.290271, 0.3319022, -0.7463545, 0, 0.4784314, 1, 1,
0.2917095, -1.478138, 2.07241, 0, 0.4705882, 1, 1,
0.2935252, 0.2737289, 1.004401, 0, 0.4666667, 1, 1,
0.3040205, 0.8105397, 0.9144346, 0, 0.4588235, 1, 1,
0.3062086, -1.17829, 1.231194, 0, 0.454902, 1, 1,
0.307053, 0.2011995, 0.8797417, 0, 0.4470588, 1, 1,
0.307322, -0.6280268, 1.375729, 0, 0.4431373, 1, 1,
0.3156821, 1.541869, 1.426264, 0, 0.4352941, 1, 1,
0.3201313, 0.8973609, 0.5703176, 0, 0.4313726, 1, 1,
0.3203517, 1.105089, 1.321765, 0, 0.4235294, 1, 1,
0.3256663, 0.642585, -0.09552445, 0, 0.4196078, 1, 1,
0.3283881, 0.03065667, 1.415654, 0, 0.4117647, 1, 1,
0.3287576, 0.7243414, 0.8273773, 0, 0.4078431, 1, 1,
0.3362035, -0.14943, 1.965077, 0, 0.4, 1, 1,
0.3453986, -1.272513, 2.577908, 0, 0.3921569, 1, 1,
0.3479071, 1.893118, -1.118998, 0, 0.3882353, 1, 1,
0.3487468, -1.125742, 4.801614, 0, 0.3803922, 1, 1,
0.349206, 1.010846, -0.05516325, 0, 0.3764706, 1, 1,
0.3524384, 0.943435, 0.9003732, 0, 0.3686275, 1, 1,
0.3539662, 0.1989062, 1.569816, 0, 0.3647059, 1, 1,
0.3575615, -0.0521272, 2.660455, 0, 0.3568628, 1, 1,
0.3604192, 1.906292, 0.218914, 0, 0.3529412, 1, 1,
0.3615465, 0.7042778, 1.011901, 0, 0.345098, 1, 1,
0.3660516, -1.044747, 1.405582, 0, 0.3411765, 1, 1,
0.3668306, -0.8765391, 2.024637, 0, 0.3333333, 1, 1,
0.367373, 0.4424671, 0.8682196, 0, 0.3294118, 1, 1,
0.3676401, 0.5501283, 0.9002492, 0, 0.3215686, 1, 1,
0.3705661, -0.005514633, 1.049177, 0, 0.3176471, 1, 1,
0.3728248, 0.5745938, 1.310067, 0, 0.3098039, 1, 1,
0.3804982, -0.2652337, 1.836118, 0, 0.3058824, 1, 1,
0.3820503, 1.397015, 0.02686469, 0, 0.2980392, 1, 1,
0.3866351, -0.06179324, 1.945135, 0, 0.2901961, 1, 1,
0.3873764, -0.5386632, 2.296084, 0, 0.2862745, 1, 1,
0.3885713, 1.087026, -1.282474, 0, 0.2784314, 1, 1,
0.4012155, -1.13599, 2.236946, 0, 0.2745098, 1, 1,
0.4017775, -0.04261083, 0.02793243, 0, 0.2666667, 1, 1,
0.4019043, -0.3485419, 2.661574, 0, 0.2627451, 1, 1,
0.4020009, -0.04523223, 1.513188, 0, 0.254902, 1, 1,
0.4082982, 2.444448, 1.587103, 0, 0.2509804, 1, 1,
0.4167486, 0.2379001, -0.2230942, 0, 0.2431373, 1, 1,
0.4173048, 0.1669313, 1.265724, 0, 0.2392157, 1, 1,
0.4179824, -0.9408101, 1.861045, 0, 0.2313726, 1, 1,
0.4186971, 0.5070688, 1.094477, 0, 0.227451, 1, 1,
0.4332392, -0.6489844, 2.91447, 0, 0.2196078, 1, 1,
0.433992, 0.9664769, 1.260744, 0, 0.2156863, 1, 1,
0.4343508, 0.1202576, 1.701483, 0, 0.2078431, 1, 1,
0.4344587, 0.5204626, 2.322441, 0, 0.2039216, 1, 1,
0.4397244, 0.9759086, -0.4364525, 0, 0.1960784, 1, 1,
0.4415324, -1.841037, 3.189802, 0, 0.1882353, 1, 1,
0.4431228, 0.3554239, 1.797941, 0, 0.1843137, 1, 1,
0.4467594, -0.6784541, 3.710903, 0, 0.1764706, 1, 1,
0.4468431, -0.7150755, 1.492719, 0, 0.172549, 1, 1,
0.4479161, -0.7191911, 2.74926, 0, 0.1647059, 1, 1,
0.4481127, -1.820888, 2.390115, 0, 0.1607843, 1, 1,
0.4506871, 0.8627552, 1.953917, 0, 0.1529412, 1, 1,
0.4514467, 1.977151, 2.256102, 0, 0.1490196, 1, 1,
0.4523016, -0.06393844, 2.997649, 0, 0.1411765, 1, 1,
0.452668, -0.06887735, 4.128831, 0, 0.1372549, 1, 1,
0.4535945, 0.7773256, 0.5778239, 0, 0.1294118, 1, 1,
0.4551331, -0.7646158, 3.012589, 0, 0.1254902, 1, 1,
0.4580644, 0.9887438, 1.244316, 0, 0.1176471, 1, 1,
0.4588039, 0.01578363, 2.261192, 0, 0.1137255, 1, 1,
0.4595847, -0.2730875, 0.02531493, 0, 0.1058824, 1, 1,
0.460484, -0.4021781, 4.695142, 0, 0.09803922, 1, 1,
0.4617238, -0.5256507, 1.293079, 0, 0.09411765, 1, 1,
0.4637405, -0.5415084, 2.345616, 0, 0.08627451, 1, 1,
0.4655973, 0.1814675, -0.6620367, 0, 0.08235294, 1, 1,
0.4687657, -0.907894, 2.262596, 0, 0.07450981, 1, 1,
0.4745004, 0.02391651, 0.7810584, 0, 0.07058824, 1, 1,
0.4752466, -0.1445531, 1.670431, 0, 0.0627451, 1, 1,
0.4762444, 0.9883306, 0.8620033, 0, 0.05882353, 1, 1,
0.4770887, 0.4671046, 0.9791402, 0, 0.05098039, 1, 1,
0.4825186, -0.5882441, 1.944859, 0, 0.04705882, 1, 1,
0.4825651, -1.377787, 1.890654, 0, 0.03921569, 1, 1,
0.4829156, -0.9883185, 2.888469, 0, 0.03529412, 1, 1,
0.4889488, -0.1610729, 0.03442619, 0, 0.02745098, 1, 1,
0.4926865, -2.162007, 3.861926, 0, 0.02352941, 1, 1,
0.4982589, 0.5043535, 0.0262763, 0, 0.01568628, 1, 1,
0.5014645, -0.07980809, 2.298296, 0, 0.01176471, 1, 1,
0.5022399, -0.5515891, 1.761964, 0, 0.003921569, 1, 1,
0.5046128, 0.1148049, 0.41699, 0.003921569, 0, 1, 1,
0.506631, 0.5946769, 1.223782, 0.007843138, 0, 1, 1,
0.5138448, -1.013172, 2.452049, 0.01568628, 0, 1, 1,
0.5196869, -0.4798933, 1.313577, 0.01960784, 0, 1, 1,
0.5220449, -0.4215667, 1.788865, 0.02745098, 0, 1, 1,
0.530773, 0.1496574, 0.9430728, 0.03137255, 0, 1, 1,
0.5331705, 0.3795616, 2.492207, 0.03921569, 0, 1, 1,
0.5337745, 1.519086, -0.6335025, 0.04313726, 0, 1, 1,
0.5371445, -1.722252, 1.322313, 0.05098039, 0, 1, 1,
0.5391066, 0.2374617, 1.494645, 0.05490196, 0, 1, 1,
0.5420728, -0.3610651, 1.899812, 0.0627451, 0, 1, 1,
0.5510226, 0.2258674, 1.518734, 0.06666667, 0, 1, 1,
0.558253, -0.613942, 1.450227, 0.07450981, 0, 1, 1,
0.5622101, 1.353498, 0.3665659, 0.07843138, 0, 1, 1,
0.5659078, 1.282295, 1.451285, 0.08627451, 0, 1, 1,
0.5670154, -0.2114477, 2.706027, 0.09019608, 0, 1, 1,
0.5682888, -0.5564799, 3.677658, 0.09803922, 0, 1, 1,
0.5732642, 0.4974014, -0.07531337, 0.1058824, 0, 1, 1,
0.5742059, -1.957078, 4.077279, 0.1098039, 0, 1, 1,
0.5745038, 1.765079, -0.2054669, 0.1176471, 0, 1, 1,
0.5747054, 0.7813653, 2.090088, 0.1215686, 0, 1, 1,
0.5819734, 0.2496117, 0.6144795, 0.1294118, 0, 1, 1,
0.58757, 0.1297266, 2.292171, 0.1333333, 0, 1, 1,
0.5908278, 0.5155405, -0.4496607, 0.1411765, 0, 1, 1,
0.5970748, 0.2379268, 2.81386, 0.145098, 0, 1, 1,
0.5974201, -0.1742304, 2.509949, 0.1529412, 0, 1, 1,
0.6001394, -2.458364, 3.4263, 0.1568628, 0, 1, 1,
0.6039904, -0.4754794, 1.73534, 0.1647059, 0, 1, 1,
0.6046497, 0.05293506, 2.301079, 0.1686275, 0, 1, 1,
0.6049955, -0.1411103, 0.886929, 0.1764706, 0, 1, 1,
0.6070783, -0.1564402, 3.397103, 0.1803922, 0, 1, 1,
0.612604, 0.8763888, 0.9269331, 0.1882353, 0, 1, 1,
0.6126168, 0.9505153, 0.6103919, 0.1921569, 0, 1, 1,
0.6170979, -1.330784, 3.842914, 0.2, 0, 1, 1,
0.6221724, 1.527702, 2.089317, 0.2078431, 0, 1, 1,
0.6238722, -1.094233, 2.770999, 0.2117647, 0, 1, 1,
0.624555, -0.6048159, 3.468637, 0.2196078, 0, 1, 1,
0.6271369, 0.4724928, 0.3965153, 0.2235294, 0, 1, 1,
0.6276428, 0.769802, 0.7255061, 0.2313726, 0, 1, 1,
0.6301541, -1.067899, 2.970488, 0.2352941, 0, 1, 1,
0.6309504, -0.09677757, 1.150285, 0.2431373, 0, 1, 1,
0.6344796, 0.4617505, -0.06002498, 0.2470588, 0, 1, 1,
0.6365346, -0.02254113, 3.126417, 0.254902, 0, 1, 1,
0.6390941, 0.2977766, 0.8446464, 0.2588235, 0, 1, 1,
0.6436142, 2.064633, -1.317791, 0.2666667, 0, 1, 1,
0.6464717, -0.4526412, 0.1668929, 0.2705882, 0, 1, 1,
0.6483073, 1.525812, 1.991439, 0.2784314, 0, 1, 1,
0.6495621, -0.4115173, 3.025734, 0.282353, 0, 1, 1,
0.6511927, -0.8719769, 2.016261, 0.2901961, 0, 1, 1,
0.6544111, 0.1903343, 1.731721, 0.2941177, 0, 1, 1,
0.6554085, 0.8144703, 0.9022565, 0.3019608, 0, 1, 1,
0.6623265, -0.8161139, 2.622653, 0.3098039, 0, 1, 1,
0.663964, -1.071874, 2.851597, 0.3137255, 0, 1, 1,
0.6640306, -1.475372, 2.386339, 0.3215686, 0, 1, 1,
0.6643261, 1.218103, 1.322969, 0.3254902, 0, 1, 1,
0.6650337, -0.0989107, 1.305653, 0.3333333, 0, 1, 1,
0.6714555, -1.029792, 3.49643, 0.3372549, 0, 1, 1,
0.6745793, -1.446297, 2.791619, 0.345098, 0, 1, 1,
0.6746293, -0.07735494, 1.769556, 0.3490196, 0, 1, 1,
0.6746457, -0.5271808, 3.557957, 0.3568628, 0, 1, 1,
0.6762348, 0.3843813, -0.7577962, 0.3607843, 0, 1, 1,
0.6786067, 0.6356199, 1.85249, 0.3686275, 0, 1, 1,
0.678738, -0.07791723, 0.8005968, 0.372549, 0, 1, 1,
0.6788166, 0.3668527, -0.2199051, 0.3803922, 0, 1, 1,
0.6814764, 0.4127506, -0.2518933, 0.3843137, 0, 1, 1,
0.6873666, -1.185805, 3.004463, 0.3921569, 0, 1, 1,
0.6891924, -1.155567, 2.652961, 0.3960784, 0, 1, 1,
0.6912568, -0.6851671, 3.314626, 0.4039216, 0, 1, 1,
0.6926036, -0.9217237, 3.454653, 0.4117647, 0, 1, 1,
0.6963051, 0.1434529, 2.191479, 0.4156863, 0, 1, 1,
0.6997423, 1.042436, -1.111317, 0.4235294, 0, 1, 1,
0.7004894, 2.111738, -1.016065, 0.427451, 0, 1, 1,
0.7010872, 0.006428386, -0.1767395, 0.4352941, 0, 1, 1,
0.7021495, -0.7258037, 1.167112, 0.4392157, 0, 1, 1,
0.704384, 0.4964263, 0.2503819, 0.4470588, 0, 1, 1,
0.7046962, 0.4691475, 1.735746, 0.4509804, 0, 1, 1,
0.7073967, 0.667178, 0.454315, 0.4588235, 0, 1, 1,
0.7167838, 0.5436623, 1.489015, 0.4627451, 0, 1, 1,
0.7168531, -0.3755818, 1.336066, 0.4705882, 0, 1, 1,
0.719873, 0.7226835, 0.6691165, 0.4745098, 0, 1, 1,
0.7220237, -0.1827531, 3.013574, 0.4823529, 0, 1, 1,
0.7241938, -1.062867, 1.874453, 0.4862745, 0, 1, 1,
0.7256129, -0.4061768, 0.4507793, 0.4941176, 0, 1, 1,
0.7276954, -0.0179258, 1.243463, 0.5019608, 0, 1, 1,
0.7277678, -1.650813, 2.086308, 0.5058824, 0, 1, 1,
0.7279039, -0.4085729, 3.152174, 0.5137255, 0, 1, 1,
0.7298843, 0.596223, 2.236184, 0.5176471, 0, 1, 1,
0.7353386, -0.07827422, 0.04048174, 0.5254902, 0, 1, 1,
0.7353503, 1.258525, 1.86156, 0.5294118, 0, 1, 1,
0.7370874, -0.9156384, 3.737277, 0.5372549, 0, 1, 1,
0.7390545, -0.8496659, 2.097019, 0.5411765, 0, 1, 1,
0.7502772, -1.184316, 1.977236, 0.5490196, 0, 1, 1,
0.7531602, 0.5781351, 2.254691, 0.5529412, 0, 1, 1,
0.7543983, -0.6842918, 1.723617, 0.5607843, 0, 1, 1,
0.7574656, -1.417805, 2.586684, 0.5647059, 0, 1, 1,
0.7635083, 0.4139564, 1.675057, 0.572549, 0, 1, 1,
0.7635856, -0.5096867, 2.338656, 0.5764706, 0, 1, 1,
0.7689509, -0.7358695, 0.2338645, 0.5843138, 0, 1, 1,
0.7691075, -0.9277565, 2.743967, 0.5882353, 0, 1, 1,
0.7705066, 0.4243008, -0.02361772, 0.5960785, 0, 1, 1,
0.7718948, 2.180994, -0.9435122, 0.6039216, 0, 1, 1,
0.7739494, -1.802761, 3.820682, 0.6078432, 0, 1, 1,
0.7808349, 1.616387, 0.4069937, 0.6156863, 0, 1, 1,
0.7853414, -0.5278987, 1.438572, 0.6196079, 0, 1, 1,
0.788289, 0.4277305, 1.437435, 0.627451, 0, 1, 1,
0.7987065, 0.3573935, 1.680758, 0.6313726, 0, 1, 1,
0.8014057, 1.713418, -2.288054, 0.6392157, 0, 1, 1,
0.8043596, -0.5907142, 3.344658, 0.6431373, 0, 1, 1,
0.8065219, -0.3138597, 2.75946, 0.6509804, 0, 1, 1,
0.8068123, -2.301731, 2.978462, 0.654902, 0, 1, 1,
0.8068776, -1.125493, 2.479462, 0.6627451, 0, 1, 1,
0.8086638, 0.1071961, 1.794492, 0.6666667, 0, 1, 1,
0.809431, 0.6594399, 1.585054, 0.6745098, 0, 1, 1,
0.8175592, -0.6835574, 2.515735, 0.6784314, 0, 1, 1,
0.820891, 0.5368863, 1.38344, 0.6862745, 0, 1, 1,
0.8213301, -0.05601378, 0.9583195, 0.6901961, 0, 1, 1,
0.8247342, 0.1195174, 2.913171, 0.6980392, 0, 1, 1,
0.825052, -0.5204017, 2.334397, 0.7058824, 0, 1, 1,
0.8296431, -1.070117, 1.655139, 0.7098039, 0, 1, 1,
0.8307699, -0.3232085, 1.879087, 0.7176471, 0, 1, 1,
0.8335351, -0.3210862, 2.6328, 0.7215686, 0, 1, 1,
0.8347967, -1.366547, 3.053609, 0.7294118, 0, 1, 1,
0.836874, 0.4948183, 0.5368884, 0.7333333, 0, 1, 1,
0.8390505, 0.6720837, 2.457343, 0.7411765, 0, 1, 1,
0.8427542, 0.1216773, 2.468659, 0.7450981, 0, 1, 1,
0.8427706, -0.7054501, 3.352253, 0.7529412, 0, 1, 1,
0.8463648, 0.1493211, 2.260892, 0.7568628, 0, 1, 1,
0.8487198, 1.190529, 0.742184, 0.7647059, 0, 1, 1,
0.850267, 0.01282906, 0.7036816, 0.7686275, 0, 1, 1,
0.8542052, -0.02416644, 0.5762023, 0.7764706, 0, 1, 1,
0.8697942, -0.3063879, 2.581389, 0.7803922, 0, 1, 1,
0.8733775, -0.1938108, 2.503872, 0.7882353, 0, 1, 1,
0.8741517, -0.6091432, 2.342129, 0.7921569, 0, 1, 1,
0.875571, -1.068338, 2.127641, 0.8, 0, 1, 1,
0.8790443, 0.7648562, 1.90924, 0.8078431, 0, 1, 1,
0.8803461, -0.2236854, 0.9168164, 0.8117647, 0, 1, 1,
0.887949, 0.8831949, -0.6960966, 0.8196079, 0, 1, 1,
0.8887852, -0.318841, 2.411979, 0.8235294, 0, 1, 1,
0.8914855, -0.263613, 2.604429, 0.8313726, 0, 1, 1,
0.8974491, 0.2999731, 1.280178, 0.8352941, 0, 1, 1,
0.8982058, 0.7893394, 1.841887, 0.8431373, 0, 1, 1,
0.9069164, 0.4796052, 1.248104, 0.8470588, 0, 1, 1,
0.909084, -0.6244907, 1.362379, 0.854902, 0, 1, 1,
0.9130831, -0.2642279, 2.768338, 0.8588235, 0, 1, 1,
0.9203877, 0.7164299, 1.132172, 0.8666667, 0, 1, 1,
0.9259264, 0.918576, 2.025442, 0.8705882, 0, 1, 1,
0.9282053, 0.6927776, 1.653316, 0.8784314, 0, 1, 1,
0.9317678, 0.1566124, 2.068107, 0.8823529, 0, 1, 1,
0.9347749, -0.5904686, 2.599174, 0.8901961, 0, 1, 1,
0.9351912, -0.5103778, 2.025607, 0.8941177, 0, 1, 1,
0.9352829, -0.8911994, 1.923754, 0.9019608, 0, 1, 1,
0.9356128, -1.493376, 2.773175, 0.9098039, 0, 1, 1,
0.9368826, -0.2840327, 1.814906, 0.9137255, 0, 1, 1,
0.9397294, -0.3655076, 0.4333597, 0.9215686, 0, 1, 1,
0.9402826, -0.5878354, 3.26942, 0.9254902, 0, 1, 1,
0.9416386, 0.18774, 1.942597, 0.9333333, 0, 1, 1,
0.9519817, -0.1671989, 1.064223, 0.9372549, 0, 1, 1,
0.9524896, -0.9986716, 1.147861, 0.945098, 0, 1, 1,
0.9560329, -0.7301101, 3.579964, 0.9490196, 0, 1, 1,
0.9572904, 0.1358139, 3.775575, 0.9568627, 0, 1, 1,
0.9602199, 0.06306781, 0.4873358, 0.9607843, 0, 1, 1,
0.9743095, -1.786813, 2.548558, 0.9686275, 0, 1, 1,
0.9782668, 0.3904109, 2.935609, 0.972549, 0, 1, 1,
0.9828916, -0.643935, 3.879667, 0.9803922, 0, 1, 1,
0.9847068, -0.6911017, 0.657509, 0.9843137, 0, 1, 1,
0.9979402, 0.02462574, 2.156228, 0.9921569, 0, 1, 1,
0.9986379, 0.7177187, 1.462825, 0.9960784, 0, 1, 1,
1.028284, -0.9863238, 2.601099, 1, 0, 0.9960784, 1,
1.033978, 1.585594, -0.7564588, 1, 0, 0.9882353, 1,
1.037422, -1.301447, 1.952785, 1, 0, 0.9843137, 1,
1.038697, -1.854745, 4.021443, 1, 0, 0.9764706, 1,
1.047015, 0.7857036, 1.368696, 1, 0, 0.972549, 1,
1.051119, -0.3936418, 1.681214, 1, 0, 0.9647059, 1,
1.05581, 0.01495003, 1.055236, 1, 0, 0.9607843, 1,
1.055913, -0.1939075, 2.597767, 1, 0, 0.9529412, 1,
1.05605, -0.8154988, 4.063939, 1, 0, 0.9490196, 1,
1.071753, 0.7823803, 0.2295157, 1, 0, 0.9411765, 1,
1.077351, -0.6656151, 1.51744, 1, 0, 0.9372549, 1,
1.080038, -0.4511852, 4.412407, 1, 0, 0.9294118, 1,
1.082814, 0.5702552, 1.337976, 1, 0, 0.9254902, 1,
1.088884, 0.7213605, 0.3234164, 1, 0, 0.9176471, 1,
1.088923, -0.7594518, 1.37811, 1, 0, 0.9137255, 1,
1.090114, -0.8607543, 1.939823, 1, 0, 0.9058824, 1,
1.09264, -0.2331222, 2.557468, 1, 0, 0.9019608, 1,
1.095811, -0.1482692, 1.954372, 1, 0, 0.8941177, 1,
1.1014, -0.802616, 1.767492, 1, 0, 0.8862745, 1,
1.114469, -0.5306283, 1.147563, 1, 0, 0.8823529, 1,
1.115045, -0.7589456, 0.2065787, 1, 0, 0.8745098, 1,
1.123579, 1.008831, 0.6129757, 1, 0, 0.8705882, 1,
1.124342, -0.6411961, 1.61349, 1, 0, 0.8627451, 1,
1.133574, -1.818296, 1.853786, 1, 0, 0.8588235, 1,
1.140548, 1.505352, -0.07547053, 1, 0, 0.8509804, 1,
1.155638, -0.842743, 3.356833, 1, 0, 0.8470588, 1,
1.162211, -0.4016574, 0.6974426, 1, 0, 0.8392157, 1,
1.162412, -0.5011624, 1.898928, 1, 0, 0.8352941, 1,
1.1646, -0.8407826, 4.075237, 1, 0, 0.827451, 1,
1.166613, -0.1692189, 1.803399, 1, 0, 0.8235294, 1,
1.169006, -0.9905301, 3.084509, 1, 0, 0.8156863, 1,
1.17188, -0.7506083, 2.760658, 1, 0, 0.8117647, 1,
1.175256, 1.159328, -0.2065419, 1, 0, 0.8039216, 1,
1.19656, 0.9153347, 0.7677091, 1, 0, 0.7960784, 1,
1.202039, 0.4344262, 0.9741842, 1, 0, 0.7921569, 1,
1.203549, 0.310214, 1.012616, 1, 0, 0.7843137, 1,
1.211674, -0.8770953, 3.869859, 1, 0, 0.7803922, 1,
1.232264, -0.5068225, 0.9755334, 1, 0, 0.772549, 1,
1.234087, -0.07975973, 2.876623, 1, 0, 0.7686275, 1,
1.246958, 0.3225343, 1.916004, 1, 0, 0.7607843, 1,
1.248735, -0.4110589, 1.854154, 1, 0, 0.7568628, 1,
1.254808, -1.522494, 2.331905, 1, 0, 0.7490196, 1,
1.255519, 1.01608, 2.256211, 1, 0, 0.7450981, 1,
1.256124, -0.1747849, 2.153208, 1, 0, 0.7372549, 1,
1.256828, 0.3176016, 0.6534414, 1, 0, 0.7333333, 1,
1.25823, -0.3501541, 1.606215, 1, 0, 0.7254902, 1,
1.258667, -0.04875876, 2.260329, 1, 0, 0.7215686, 1,
1.259031, -0.1027697, 2.92259, 1, 0, 0.7137255, 1,
1.26014, 1.406536, -1.14901, 1, 0, 0.7098039, 1,
1.263568, -0.4574597, 2.279769, 1, 0, 0.7019608, 1,
1.265566, -0.1200684, 2.778205, 1, 0, 0.6941177, 1,
1.269501, -0.3023561, 2.026549, 1, 0, 0.6901961, 1,
1.273277, 0.6994263, 1.541483, 1, 0, 0.682353, 1,
1.27968, -0.0422002, 1.841802, 1, 0, 0.6784314, 1,
1.28917, -1.379773, 1.721527, 1, 0, 0.6705883, 1,
1.291134, 0.6507065, 1.510772, 1, 0, 0.6666667, 1,
1.294392, -0.3367609, 2.679703, 1, 0, 0.6588235, 1,
1.298091, -0.2554765, 1.045753, 1, 0, 0.654902, 1,
1.299325, -0.2335587, 2.898778, 1, 0, 0.6470588, 1,
1.311753, -0.2048802, 2.86509, 1, 0, 0.6431373, 1,
1.332102, 1.643942, 0.3435202, 1, 0, 0.6352941, 1,
1.338865, 0.4778735, 0.4499899, 1, 0, 0.6313726, 1,
1.346433, 0.1458579, -1.071613, 1, 0, 0.6235294, 1,
1.346806, 0.2637393, 3.035089, 1, 0, 0.6196079, 1,
1.348513, -0.5386429, 2.54681, 1, 0, 0.6117647, 1,
1.353301, 0.1782568, 0.03491435, 1, 0, 0.6078432, 1,
1.361547, 0.8788164, 1.780422, 1, 0, 0.6, 1,
1.367175, -0.1651205, 3.666927, 1, 0, 0.5921569, 1,
1.373275, 0.1032238, 0.9341918, 1, 0, 0.5882353, 1,
1.377316, 1.235322, 0.1315817, 1, 0, 0.5803922, 1,
1.381755, 0.1856266, 1.49505, 1, 0, 0.5764706, 1,
1.382792, 0.2132656, 0.9045161, 1, 0, 0.5686275, 1,
1.38743, -0.08144183, 0.9968184, 1, 0, 0.5647059, 1,
1.404292, 1.489614, 1.20059, 1, 0, 0.5568628, 1,
1.41994, 0.4850911, 0.05432677, 1, 0, 0.5529412, 1,
1.420219, -0.07359783, 3.984526, 1, 0, 0.5450981, 1,
1.423882, 0.6635426, 2.371176, 1, 0, 0.5411765, 1,
1.428102, 0.5344882, 2.941615, 1, 0, 0.5333334, 1,
1.447351, -1.09173, 2.888186, 1, 0, 0.5294118, 1,
1.453447, 0.603587, 1.480653, 1, 0, 0.5215687, 1,
1.470205, 0.9531125, 2.501811, 1, 0, 0.5176471, 1,
1.471838, 0.4481876, 0.8681899, 1, 0, 0.509804, 1,
1.475551, 2.072246, -0.4678634, 1, 0, 0.5058824, 1,
1.483645, 0.6037856, 3.174797, 1, 0, 0.4980392, 1,
1.48923, 1.8954, 0.6785861, 1, 0, 0.4901961, 1,
1.491207, -0.1020522, 1.287418, 1, 0, 0.4862745, 1,
1.494656, 1.16894, 2.003983, 1, 0, 0.4784314, 1,
1.503117, -0.1712044, 2.423052, 1, 0, 0.4745098, 1,
1.516587, -0.02441292, 1.132869, 1, 0, 0.4666667, 1,
1.517165, 1.697656, 1.80827, 1, 0, 0.4627451, 1,
1.5265, 0.1765321, 1.108094, 1, 0, 0.454902, 1,
1.528941, -0.3822754, 2.326766, 1, 0, 0.4509804, 1,
1.53015, 1.900651, 1.649574, 1, 0, 0.4431373, 1,
1.534688, 1.237212, 2.457867, 1, 0, 0.4392157, 1,
1.537192, 0.8479734, 2.314181, 1, 0, 0.4313726, 1,
1.53943, -0.7785821, 2.31262, 1, 0, 0.427451, 1,
1.544064, 0.1191768, 3.518223, 1, 0, 0.4196078, 1,
1.545256, 0.409596, 1.085117, 1, 0, 0.4156863, 1,
1.546604, -0.6835001, 3.023063, 1, 0, 0.4078431, 1,
1.555484, -0.6556703, 2.035602, 1, 0, 0.4039216, 1,
1.562001, -0.01989, 1.911472, 1, 0, 0.3960784, 1,
1.580309, -1.223734, 3.111159, 1, 0, 0.3882353, 1,
1.586211, 0.5651312, 0.6350524, 1, 0, 0.3843137, 1,
1.593576, -2.042102, 2.79652, 1, 0, 0.3764706, 1,
1.624436, -0.2104543, 1.684886, 1, 0, 0.372549, 1,
1.630038, -2.663093, 1.504382, 1, 0, 0.3647059, 1,
1.634417, 0.5073752, 2.008894, 1, 0, 0.3607843, 1,
1.635946, -0.4004783, 1.025302, 1, 0, 0.3529412, 1,
1.636117, 1.054446, 1.573557, 1, 0, 0.3490196, 1,
1.638504, 0.2236269, 1.039505, 1, 0, 0.3411765, 1,
1.641616, -1.330206, 2.480607, 1, 0, 0.3372549, 1,
1.70381, -1.252386, 1.717495, 1, 0, 0.3294118, 1,
1.727344, -1.034821, 4.28115, 1, 0, 0.3254902, 1,
1.738931, 1.202343, 3.34976, 1, 0, 0.3176471, 1,
1.755152, -0.1514973, 0.7494656, 1, 0, 0.3137255, 1,
1.75622, 0.3649631, 1.489883, 1, 0, 0.3058824, 1,
1.761068, 0.8421407, 2.000398, 1, 0, 0.2980392, 1,
1.775607, -0.9679444, 2.32204, 1, 0, 0.2941177, 1,
1.80013, -0.8564546, 1.777766, 1, 0, 0.2862745, 1,
1.807926, 2.047624, 0.918838, 1, 0, 0.282353, 1,
1.819883, -0.01500064, 2.165323, 1, 0, 0.2745098, 1,
1.820244, -0.6312202, 0.7289401, 1, 0, 0.2705882, 1,
1.827793, -0.2114673, 1.176959, 1, 0, 0.2627451, 1,
1.828724, 0.1295309, 0.7095469, 1, 0, 0.2588235, 1,
1.834277, 0.1218676, 1.783234, 1, 0, 0.2509804, 1,
1.841031, 0.5616993, 1.585924, 1, 0, 0.2470588, 1,
1.860683, 0.3161211, 2.884803, 1, 0, 0.2392157, 1,
1.865189, -0.03572087, 1.590749, 1, 0, 0.2352941, 1,
1.875201, 0.2537504, -0.08796799, 1, 0, 0.227451, 1,
1.887813, -1.148134, 2.608974, 1, 0, 0.2235294, 1,
1.917964, -0.1276801, 2.740515, 1, 0, 0.2156863, 1,
1.987593, -0.04247468, 2.12747, 1, 0, 0.2117647, 1,
2.017631, 0.8067478, 1.163752, 1, 0, 0.2039216, 1,
2.019796, 0.3553834, 1.826824, 1, 0, 0.1960784, 1,
2.051648, -0.2919021, 2.262217, 1, 0, 0.1921569, 1,
2.066506, 0.7243356, 2.579675, 1, 0, 0.1843137, 1,
2.071295, -0.8739125, 1.216079, 1, 0, 0.1803922, 1,
2.091358, -0.02925034, 1.588516, 1, 0, 0.172549, 1,
2.109179, -0.1492335, 0.3544272, 1, 0, 0.1686275, 1,
2.112056, -1.398973, 3.382575, 1, 0, 0.1607843, 1,
2.114797, 1.250631, 0.8638524, 1, 0, 0.1568628, 1,
2.132423, 0.01787941, 3.015791, 1, 0, 0.1490196, 1,
2.140773, -1.019463, 1.644454, 1, 0, 0.145098, 1,
2.150334, -0.3436157, 2.290217, 1, 0, 0.1372549, 1,
2.152611, -0.7296039, 2.063163, 1, 0, 0.1333333, 1,
2.155694, -0.06704921, 2.758514, 1, 0, 0.1254902, 1,
2.158869, 0.928518, 1.051065, 1, 0, 0.1215686, 1,
2.16544, 1.051333, 0.4157823, 1, 0, 0.1137255, 1,
2.173742, -1.349327, 4.205142, 1, 0, 0.1098039, 1,
2.185191, 0.9652348, 1.38517, 1, 0, 0.1019608, 1,
2.251426, 0.6690975, 1.870305, 1, 0, 0.09411765, 1,
2.259408, -1.483895, 3.548256, 1, 0, 0.09019608, 1,
2.298258, 0.03853498, 0.3289208, 1, 0, 0.08235294, 1,
2.327476, -1.461595, 3.441826, 1, 0, 0.07843138, 1,
2.375312, 0.3410996, -0.6018651, 1, 0, 0.07058824, 1,
2.381118, 0.1686747, 1.800071, 1, 0, 0.06666667, 1,
2.383182, 1.729112, 1.51424, 1, 0, 0.05882353, 1,
2.450018, 0.3110791, 0.3494739, 1, 0, 0.05490196, 1,
2.566323, 1.902084, 2.985227, 1, 0, 0.04705882, 1,
2.581591, 1.54237, -0.2733556, 1, 0, 0.04313726, 1,
2.618656, -0.1111987, 2.698802, 1, 0, 0.03529412, 1,
2.646059, 1.225459, 0.7186254, 1, 0, 0.03137255, 1,
2.759181, -0.5785229, 2.285183, 1, 0, 0.02352941, 1,
2.939977, -0.529927, 0.7836352, 1, 0, 0.01960784, 1,
3.321457, 0.9368422, 2.398908, 1, 0, 0.01176471, 1,
3.484335, 0.03928787, -0.5856063, 1, 0, 0.007843138, 1
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
-0.1179271, -4.500637, -6.480063, 0, -0.5, 0.5, 0.5,
-0.1179271, -4.500637, -6.480063, 1, -0.5, 0.5, 0.5,
-0.1179271, -4.500637, -6.480063, 1, 1.5, 0.5, 0.5,
-0.1179271, -4.500637, -6.480063, 0, 1.5, 0.5, 0.5
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
-4.941357, -0.1835626, -6.480063, 0, -0.5, 0.5, 0.5,
-4.941357, -0.1835626, -6.480063, 1, -0.5, 0.5, 0.5,
-4.941357, -0.1835626, -6.480063, 1, 1.5, 0.5, 0.5,
-4.941357, -0.1835626, -6.480063, 0, 1.5, 0.5, 0.5
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
-4.941357, -4.500637, 0.1603818, 0, -0.5, 0.5, 0.5,
-4.941357, -4.500637, 0.1603818, 1, -0.5, 0.5, 0.5,
-4.941357, -4.500637, 0.1603818, 1, 1.5, 0.5, 0.5,
-4.941357, -4.500637, 0.1603818, 0, 1.5, 0.5, 0.5
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
-2, -3.504389, -4.947652,
2, -3.504389, -4.947652,
-2, -3.504389, -4.947652,
-2, -3.67043, -5.203054,
0, -3.504389, -4.947652,
0, -3.67043, -5.203054,
2, -3.504389, -4.947652,
2, -3.67043, -5.203054
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
-2, -4.002513, -5.713858, 0, -0.5, 0.5, 0.5,
-2, -4.002513, -5.713858, 1, -0.5, 0.5, 0.5,
-2, -4.002513, -5.713858, 1, 1.5, 0.5, 0.5,
-2, -4.002513, -5.713858, 0, 1.5, 0.5, 0.5,
0, -4.002513, -5.713858, 0, -0.5, 0.5, 0.5,
0, -4.002513, -5.713858, 1, -0.5, 0.5, 0.5,
0, -4.002513, -5.713858, 1, 1.5, 0.5, 0.5,
0, -4.002513, -5.713858, 0, 1.5, 0.5, 0.5,
2, -4.002513, -5.713858, 0, -0.5, 0.5, 0.5,
2, -4.002513, -5.713858, 1, -0.5, 0.5, 0.5,
2, -4.002513, -5.713858, 1, 1.5, 0.5, 0.5,
2, -4.002513, -5.713858, 0, 1.5, 0.5, 0.5
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
-3.828258, -3, -4.947652,
-3.828258, 3, -4.947652,
-3.828258, -3, -4.947652,
-4.013774, -3, -5.203054,
-3.828258, -2, -4.947652,
-4.013774, -2, -5.203054,
-3.828258, -1, -4.947652,
-4.013774, -1, -5.203054,
-3.828258, 0, -4.947652,
-4.013774, 0, -5.203054,
-3.828258, 1, -4.947652,
-4.013774, 1, -5.203054,
-3.828258, 2, -4.947652,
-4.013774, 2, -5.203054,
-3.828258, 3, -4.947652,
-4.013774, 3, -5.203054
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
-4.384807, -3, -5.713858, 0, -0.5, 0.5, 0.5,
-4.384807, -3, -5.713858, 1, -0.5, 0.5, 0.5,
-4.384807, -3, -5.713858, 1, 1.5, 0.5, 0.5,
-4.384807, -3, -5.713858, 0, 1.5, 0.5, 0.5,
-4.384807, -2, -5.713858, 0, -0.5, 0.5, 0.5,
-4.384807, -2, -5.713858, 1, -0.5, 0.5, 0.5,
-4.384807, -2, -5.713858, 1, 1.5, 0.5, 0.5,
-4.384807, -2, -5.713858, 0, 1.5, 0.5, 0.5,
-4.384807, -1, -5.713858, 0, -0.5, 0.5, 0.5,
-4.384807, -1, -5.713858, 1, -0.5, 0.5, 0.5,
-4.384807, -1, -5.713858, 1, 1.5, 0.5, 0.5,
-4.384807, -1, -5.713858, 0, 1.5, 0.5, 0.5,
-4.384807, 0, -5.713858, 0, -0.5, 0.5, 0.5,
-4.384807, 0, -5.713858, 1, -0.5, 0.5, 0.5,
-4.384807, 0, -5.713858, 1, 1.5, 0.5, 0.5,
-4.384807, 0, -5.713858, 0, 1.5, 0.5, 0.5,
-4.384807, 1, -5.713858, 0, -0.5, 0.5, 0.5,
-4.384807, 1, -5.713858, 1, -0.5, 0.5, 0.5,
-4.384807, 1, -5.713858, 1, 1.5, 0.5, 0.5,
-4.384807, 1, -5.713858, 0, 1.5, 0.5, 0.5,
-4.384807, 2, -5.713858, 0, -0.5, 0.5, 0.5,
-4.384807, 2, -5.713858, 1, -0.5, 0.5, 0.5,
-4.384807, 2, -5.713858, 1, 1.5, 0.5, 0.5,
-4.384807, 2, -5.713858, 0, 1.5, 0.5, 0.5,
-4.384807, 3, -5.713858, 0, -0.5, 0.5, 0.5,
-4.384807, 3, -5.713858, 1, -0.5, 0.5, 0.5,
-4.384807, 3, -5.713858, 1, 1.5, 0.5, 0.5,
-4.384807, 3, -5.713858, 0, 1.5, 0.5, 0.5
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
-3.828258, -3.504389, -4,
-3.828258, -3.504389, 4,
-3.828258, -3.504389, -4,
-4.013774, -3.67043, -4,
-3.828258, -3.504389, -2,
-4.013774, -3.67043, -2,
-3.828258, -3.504389, 0,
-4.013774, -3.67043, 0,
-3.828258, -3.504389, 2,
-4.013774, -3.67043, 2,
-3.828258, -3.504389, 4,
-4.013774, -3.67043, 4
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
-4.384807, -4.002513, -4, 0, -0.5, 0.5, 0.5,
-4.384807, -4.002513, -4, 1, -0.5, 0.5, 0.5,
-4.384807, -4.002513, -4, 1, 1.5, 0.5, 0.5,
-4.384807, -4.002513, -4, 0, 1.5, 0.5, 0.5,
-4.384807, -4.002513, -2, 0, -0.5, 0.5, 0.5,
-4.384807, -4.002513, -2, 1, -0.5, 0.5, 0.5,
-4.384807, -4.002513, -2, 1, 1.5, 0.5, 0.5,
-4.384807, -4.002513, -2, 0, 1.5, 0.5, 0.5,
-4.384807, -4.002513, 0, 0, -0.5, 0.5, 0.5,
-4.384807, -4.002513, 0, 1, -0.5, 0.5, 0.5,
-4.384807, -4.002513, 0, 1, 1.5, 0.5, 0.5,
-4.384807, -4.002513, 0, 0, 1.5, 0.5, 0.5,
-4.384807, -4.002513, 2, 0, -0.5, 0.5, 0.5,
-4.384807, -4.002513, 2, 1, -0.5, 0.5, 0.5,
-4.384807, -4.002513, 2, 1, 1.5, 0.5, 0.5,
-4.384807, -4.002513, 2, 0, 1.5, 0.5, 0.5,
-4.384807, -4.002513, 4, 0, -0.5, 0.5, 0.5,
-4.384807, -4.002513, 4, 1, -0.5, 0.5, 0.5,
-4.384807, -4.002513, 4, 1, 1.5, 0.5, 0.5,
-4.384807, -4.002513, 4, 0, 1.5, 0.5, 0.5
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
-3.828258, -3.504389, -4.947652,
-3.828258, 3.137264, -4.947652,
-3.828258, -3.504389, 5.268416,
-3.828258, 3.137264, 5.268416,
-3.828258, -3.504389, -4.947652,
-3.828258, -3.504389, 5.268416,
-3.828258, 3.137264, -4.947652,
-3.828258, 3.137264, 5.268416,
-3.828258, -3.504389, -4.947652,
3.592403, -3.504389, -4.947652,
-3.828258, -3.504389, 5.268416,
3.592403, -3.504389, 5.268416,
-3.828258, 3.137264, -4.947652,
3.592403, 3.137264, -4.947652,
-3.828258, 3.137264, 5.268416,
3.592403, 3.137264, 5.268416,
3.592403, -3.504389, -4.947652,
3.592403, 3.137264, -4.947652,
3.592403, -3.504389, 5.268416,
3.592403, 3.137264, 5.268416,
3.592403, -3.504389, -4.947652,
3.592403, -3.504389, 5.268416,
3.592403, 3.137264, -4.947652,
3.592403, 3.137264, 5.268416
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
var radius = 7.618273;
var distance = 33.89456;
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
mvMatrix.translate( 0.1179271, 0.1835626, -0.1603818 );
mvMatrix.scale( 1.110013, 1.240207, 0.8062814 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.89456);
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
benzoylhydrazone<-read.table("benzoylhydrazone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzoylhydrazone$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzoylhydrazone' not found
```

```r
y<-benzoylhydrazone$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzoylhydrazone' not found
```

```r
z<-benzoylhydrazone$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzoylhydrazone' not found
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
-3.72019, 0.5071791, -1.702601, 0, 0, 1, 1, 1,
-3.606426, -0.2076283, -1.312249, 1, 0, 0, 1, 1,
-3.298151, -0.0008303705, -1.839582, 1, 0, 0, 1, 1,
-3.019712, -1.016185, -2.460051, 1, 0, 0, 1, 1,
-2.900915, 0.4539672, 0.7699976, 1, 0, 0, 1, 1,
-2.801172, -0.5282287, -2.475123, 1, 0, 0, 1, 1,
-2.625387, 2.071416, -1.117004, 0, 0, 0, 1, 1,
-2.524974, 0.965964, -0.8956048, 0, 0, 0, 1, 1,
-2.523374, -0.6766492, -2.202557, 0, 0, 0, 1, 1,
-2.490725, 0.7032616, -0.5570394, 0, 0, 0, 1, 1,
-2.445852, -0.7357647, -1.700083, 0, 0, 0, 1, 1,
-2.422171, 1.316499, 0.3721924, 0, 0, 0, 1, 1,
-2.38153, -1.220893, -0.1332552, 0, 0, 0, 1, 1,
-2.372359, 0.3656646, -0.4430974, 1, 1, 1, 1, 1,
-2.283035, 0.05054637, 0.4752933, 1, 1, 1, 1, 1,
-2.254151, 0.5462101, -2.445476, 1, 1, 1, 1, 1,
-2.198853, -1.121708, -1.724602, 1, 1, 1, 1, 1,
-2.186809, 1.424296, -1.745514, 1, 1, 1, 1, 1,
-2.181876, 1.84629, -1.204885, 1, 1, 1, 1, 1,
-2.16901, 1.513972, -0.411394, 1, 1, 1, 1, 1,
-2.166185, -0.6786379, -2.282676, 1, 1, 1, 1, 1,
-2.16127, -0.0297464, -1.210602, 1, 1, 1, 1, 1,
-2.161071, -0.1206074, -1.097892, 1, 1, 1, 1, 1,
-2.054759, -1.150241, -2.031247, 1, 1, 1, 1, 1,
-2.051532, 0.1487109, -0.6991704, 1, 1, 1, 1, 1,
-2.019609, -0.4810419, -1.913584, 1, 1, 1, 1, 1,
-1.977839, -1.957905, -1.811338, 1, 1, 1, 1, 1,
-1.941602, -0.1153746, -1.837411, 1, 1, 1, 1, 1,
-1.880836, 0.8573596, -0.1495065, 0, 0, 1, 1, 1,
-1.849435, -1.376353, -1.323744, 1, 0, 0, 1, 1,
-1.844645, 1.604872, -0.5863188, 1, 0, 0, 1, 1,
-1.811933, 0.8760133, -1.317266, 1, 0, 0, 1, 1,
-1.810241, 0.06169069, -0.9197895, 1, 0, 0, 1, 1,
-1.795242, 2.147277, -0.5704964, 1, 0, 0, 1, 1,
-1.789512, 0.3404559, -1.4771, 0, 0, 0, 1, 1,
-1.783651, 1.097332, -1.142202, 0, 0, 0, 1, 1,
-1.768148, 0.7560008, -1.27098, 0, 0, 0, 1, 1,
-1.762186, -1.366826, -2.334749, 0, 0, 0, 1, 1,
-1.748905, -1.152832, -1.732634, 0, 0, 0, 1, 1,
-1.721477, -0.9325173, -3.136578, 0, 0, 0, 1, 1,
-1.707056, -0.2256817, -0.7723069, 0, 0, 0, 1, 1,
-1.702593, -1.317272, -0.3087967, 1, 1, 1, 1, 1,
-1.699552, 0.6167006, -0.5987918, 1, 1, 1, 1, 1,
-1.681179, -0.1293667, -2.927721, 1, 1, 1, 1, 1,
-1.671569, -0.1009328, -1.758368, 1, 1, 1, 1, 1,
-1.657923, -0.7794383, -1.258123, 1, 1, 1, 1, 1,
-1.644796, 1.567947, -0.4626828, 1, 1, 1, 1, 1,
-1.640056, 0.1114758, -0.7292526, 1, 1, 1, 1, 1,
-1.634676, 0.2337372, -2.385914, 1, 1, 1, 1, 1,
-1.626739, -0.6420821, -2.700477, 1, 1, 1, 1, 1,
-1.608153, -0.7978002, -0.9391842, 1, 1, 1, 1, 1,
-1.605597, 1.263589, -0.9142061, 1, 1, 1, 1, 1,
-1.598675, -0.5427817, -0.7401648, 1, 1, 1, 1, 1,
-1.597778, 1.108668, 2.27479, 1, 1, 1, 1, 1,
-1.595313, 0.3079017, -0.245559, 1, 1, 1, 1, 1,
-1.594645, -0.2642296, -1.318137, 1, 1, 1, 1, 1,
-1.589578, -0.7078163, -1.510192, 0, 0, 1, 1, 1,
-1.585082, 0.5499958, -0.6882662, 1, 0, 0, 1, 1,
-1.572496, -1.221592, -3.45883, 1, 0, 0, 1, 1,
-1.572495, -0.9650807, -0.3651506, 1, 0, 0, 1, 1,
-1.56434, 0.5586968, -1.067225, 1, 0, 0, 1, 1,
-1.547449, -0.3094579, -4.203062, 1, 0, 0, 1, 1,
-1.545259, 0.7381243, -2.321782, 0, 0, 0, 1, 1,
-1.54018, -0.3635328, -1.703258, 0, 0, 0, 1, 1,
-1.53799, -0.7205807, -1.415557, 0, 0, 0, 1, 1,
-1.526708, 0.03316126, -1.192288, 0, 0, 0, 1, 1,
-1.493355, 1.366125, 0.09288848, 0, 0, 0, 1, 1,
-1.491489, 0.3140745, -2.117498, 0, 0, 0, 1, 1,
-1.484213, 0.2368073, -1.367862, 0, 0, 0, 1, 1,
-1.481548, 0.3944649, -2.620931, 1, 1, 1, 1, 1,
-1.480669, -1.290628, -1.637887, 1, 1, 1, 1, 1,
-1.472879, -1.11099, -1.396403, 1, 1, 1, 1, 1,
-1.472258, -0.9176756, -2.771831, 1, 1, 1, 1, 1,
-1.471566, -0.321164, -0.4614722, 1, 1, 1, 1, 1,
-1.442485, 0.2985374, -1.142946, 1, 1, 1, 1, 1,
-1.439671, 0.4633249, -0.1269394, 1, 1, 1, 1, 1,
-1.4323, 0.9153295, -1.381697, 1, 1, 1, 1, 1,
-1.42959, 1.438167, -0.6114066, 1, 1, 1, 1, 1,
-1.427142, 0.479845, -1.642796, 1, 1, 1, 1, 1,
-1.419258, -0.3223584, -0.654165, 1, 1, 1, 1, 1,
-1.407479, 0.09735959, -2.5772, 1, 1, 1, 1, 1,
-1.404591, -0.09028499, -2.742857, 1, 1, 1, 1, 1,
-1.389637, -0.4654537, -1.057907, 1, 1, 1, 1, 1,
-1.384144, -1.008044, -2.901855, 1, 1, 1, 1, 1,
-1.380055, -0.4975141, -2.242349, 0, 0, 1, 1, 1,
-1.37618, 1.018007, -2.514893, 1, 0, 0, 1, 1,
-1.362228, -0.09956682, -1.07127, 1, 0, 0, 1, 1,
-1.361604, -1.745567, -2.096916, 1, 0, 0, 1, 1,
-1.356437, 1.145958, -0.8135619, 1, 0, 0, 1, 1,
-1.344787, -1.358377, -3.447557, 1, 0, 0, 1, 1,
-1.341154, -1.101941, -2.126621, 0, 0, 0, 1, 1,
-1.337713, 0.1018013, -2.491728, 0, 0, 0, 1, 1,
-1.336455, 1.165763, -0.4854817, 0, 0, 0, 1, 1,
-1.336099, 0.5831219, -0.9002788, 0, 0, 0, 1, 1,
-1.335844, 0.7751092, -1.183395, 0, 0, 0, 1, 1,
-1.322649, -0.01297479, -1.338497, 0, 0, 0, 1, 1,
-1.305961, -0.410123, -3.461396, 0, 0, 0, 1, 1,
-1.305668, -0.2127895, -1.419653, 1, 1, 1, 1, 1,
-1.299412, -0.6860281, -1.026143, 1, 1, 1, 1, 1,
-1.293869, 0.9900828, -1.073244, 1, 1, 1, 1, 1,
-1.291498, -1.093896, -0.7576534, 1, 1, 1, 1, 1,
-1.285265, -0.5138269, -0.6839577, 1, 1, 1, 1, 1,
-1.279623, 0.8411456, 0.380271, 1, 1, 1, 1, 1,
-1.269772, -0.1473248, -1.877737, 1, 1, 1, 1, 1,
-1.269297, 1.220216, -0.6573559, 1, 1, 1, 1, 1,
-1.267941, 0.9556437, 0.04042993, 1, 1, 1, 1, 1,
-1.262493, 0.2516739, -1.906061, 1, 1, 1, 1, 1,
-1.25808, 0.7794465, -1.84898, 1, 1, 1, 1, 1,
-1.252206, 0.5341766, -1.932443, 1, 1, 1, 1, 1,
-1.251507, 0.882624, -0.3788596, 1, 1, 1, 1, 1,
-1.250776, 0.4097515, -1.481144, 1, 1, 1, 1, 1,
-1.250627, 1.153204, 1.306824, 1, 1, 1, 1, 1,
-1.240145, 0.431431, -1.653427, 0, 0, 1, 1, 1,
-1.231327, -0.06896397, -1.844653, 1, 0, 0, 1, 1,
-1.213565, -0.969755, -1.387169, 1, 0, 0, 1, 1,
-1.211929, -1.220026, -3.038031, 1, 0, 0, 1, 1,
-1.210283, 1.124923, 0.8641889, 1, 0, 0, 1, 1,
-1.197113, -1.671573, -3.323193, 1, 0, 0, 1, 1,
-1.192162, 1.445842, -0.677577, 0, 0, 0, 1, 1,
-1.185326, -0.1201192, -0.9825031, 0, 0, 0, 1, 1,
-1.180497, -0.2957307, -1.707896, 0, 0, 0, 1, 1,
-1.179857, -0.4028967, 0.376233, 0, 0, 0, 1, 1,
-1.174149, -0.6302032, -3.973929, 0, 0, 0, 1, 1,
-1.160602, -2.191113, -3.020104, 0, 0, 0, 1, 1,
-1.159381, 0.5656953, -1.620471, 0, 0, 0, 1, 1,
-1.158877, -0.4048148, -0.2464534, 1, 1, 1, 1, 1,
-1.157527, 1.432011, -0.8116445, 1, 1, 1, 1, 1,
-1.147657, -0.5567229, -4.410022, 1, 1, 1, 1, 1,
-1.142675, -0.8802326, -3.229132, 1, 1, 1, 1, 1,
-1.137661, 1.060085, 0.364211, 1, 1, 1, 1, 1,
-1.135155, -1.792046, -1.097908, 1, 1, 1, 1, 1,
-1.134264, -0.03433164, -1.355344, 1, 1, 1, 1, 1,
-1.129038, -0.3235025, -1.293287, 1, 1, 1, 1, 1,
-1.126063, 0.2647048, -1.252702, 1, 1, 1, 1, 1,
-1.109617, -1.278989, -1.466504, 1, 1, 1, 1, 1,
-1.108805, 0.8406388, 0.8750214, 1, 1, 1, 1, 1,
-1.089106, -0.3089534, -1.934239, 1, 1, 1, 1, 1,
-1.088727, 0.720879, -0.0007991503, 1, 1, 1, 1, 1,
-1.086634, -0.1363934, -0.1782964, 1, 1, 1, 1, 1,
-1.085271, 1.303866, -1.968425, 1, 1, 1, 1, 1,
-1.08456, -0.4253963, -1.939774, 0, 0, 1, 1, 1,
-1.083896, 0.7435638, -1.21704, 1, 0, 0, 1, 1,
-1.081242, 0.6140496, 0.08753555, 1, 0, 0, 1, 1,
-1.080643, 0.2297934, -0.5984236, 1, 0, 0, 1, 1,
-1.07401, -0.2241351, -2.080645, 1, 0, 0, 1, 1,
-1.070333, -0.2580664, -1.472236, 1, 0, 0, 1, 1,
-1.064985, 1.488684, 0.7481613, 0, 0, 0, 1, 1,
-1.0514, -3.407666, -2.207629, 0, 0, 0, 1, 1,
-1.037779, 0.4926561, -0.82772, 0, 0, 0, 1, 1,
-1.034137, 0.07898226, -2.721521, 0, 0, 0, 1, 1,
-1.029376, 1.012576, 0.5892166, 0, 0, 0, 1, 1,
-1.025247, 0.9019593, -0.1227544, 0, 0, 0, 1, 1,
-1.023069, 1.175987, -0.7499695, 0, 0, 0, 1, 1,
-1.014785, -0.005300049, 0.08120539, 1, 1, 1, 1, 1,
-1.014036, 0.4641417, 0.703439, 1, 1, 1, 1, 1,
-1.011447, 0.6179577, -0.8863715, 1, 1, 1, 1, 1,
-1.010659, 1.104066, -1.13202, 1, 1, 1, 1, 1,
-1.01063, 0.1217222, -1.621079, 1, 1, 1, 1, 1,
-1.008055, -0.4383758, -1.575873, 1, 1, 1, 1, 1,
-1.000662, 0.9330047, -0.9696627, 1, 1, 1, 1, 1,
-1.000022, 0.3144192, -2.464704, 1, 1, 1, 1, 1,
-0.9976982, 0.5365967, -2.968186, 1, 1, 1, 1, 1,
-0.993311, -2.368712, -2.657599, 1, 1, 1, 1, 1,
-0.9830223, -0.3206328, -1.944865, 1, 1, 1, 1, 1,
-0.9821044, 0.8873228, -0.4554576, 1, 1, 1, 1, 1,
-0.9758818, -0.4203758, -2.488603, 1, 1, 1, 1, 1,
-0.9724256, 0.934168, -0.9409125, 1, 1, 1, 1, 1,
-0.958379, 1.34768, -1.564195, 1, 1, 1, 1, 1,
-0.9546632, 0.1773591, -3.220443, 0, 0, 1, 1, 1,
-0.9438392, 0.5551078, -2.120281, 1, 0, 0, 1, 1,
-0.940284, 0.2813503, -2.112849, 1, 0, 0, 1, 1,
-0.9360584, -0.5096889, -1.102234, 1, 0, 0, 1, 1,
-0.9330452, -0.5161549, -1.963928, 1, 0, 0, 1, 1,
-0.9327089, -1.303239, -1.470213, 1, 0, 0, 1, 1,
-0.9276147, 0.03796054, -1.493784, 0, 0, 0, 1, 1,
-0.9234892, -0.8542122, -3.103606, 0, 0, 0, 1, 1,
-0.9225187, -0.4389642, -1.589789, 0, 0, 0, 1, 1,
-0.9223217, 0.8483172, 1.065942, 0, 0, 0, 1, 1,
-0.9121199, -1.309793, -1.871743, 0, 0, 0, 1, 1,
-0.9073433, -0.9226913, -1.012633, 0, 0, 0, 1, 1,
-0.9056817, -0.6617343, -0.5850332, 0, 0, 0, 1, 1,
-0.9048105, -1.524234, -2.228308, 1, 1, 1, 1, 1,
-0.9040157, -0.7226062, -2.910861, 1, 1, 1, 1, 1,
-0.9017664, -0.03067484, -1.280869, 1, 1, 1, 1, 1,
-0.8996212, -0.07307, -3.057723, 1, 1, 1, 1, 1,
-0.8976328, -0.05483125, -1.258025, 1, 1, 1, 1, 1,
-0.8971853, 0.6436247, -0.1128484, 1, 1, 1, 1, 1,
-0.8931546, -0.1346977, -2.643025, 1, 1, 1, 1, 1,
-0.886811, -0.3934571, -2.087483, 1, 1, 1, 1, 1,
-0.8848658, -1.898668, -3.583996, 1, 1, 1, 1, 1,
-0.8817027, -0.2328555, 0.2878046, 1, 1, 1, 1, 1,
-0.8627599, 0.5880293, -1.695624, 1, 1, 1, 1, 1,
-0.8615045, 0.556981, 0.1222545, 1, 1, 1, 1, 1,
-0.8463907, -0.1255031, -3.694236, 1, 1, 1, 1, 1,
-0.844718, -0.9925371, -1.913761, 1, 1, 1, 1, 1,
-0.8386319, 0.6786967, -0.475761, 1, 1, 1, 1, 1,
-0.8378829, 0.274422, -1.396609, 0, 0, 1, 1, 1,
-0.8310431, -0.8371575, -1.288429, 1, 0, 0, 1, 1,
-0.8299996, 1.464307, 0.01031364, 1, 0, 0, 1, 1,
-0.8288856, -0.00591341, -0.9719784, 1, 0, 0, 1, 1,
-0.8285813, -0.5164921, -2.108609, 1, 0, 0, 1, 1,
-0.8268149, 1.463217, 0.4267341, 1, 0, 0, 1, 1,
-0.8232872, 0.3665017, -1.58773, 0, 0, 0, 1, 1,
-0.8154765, 1.196089, -0.5653136, 0, 0, 0, 1, 1,
-0.8154108, -1.559243, -2.854348, 0, 0, 0, 1, 1,
-0.8063396, -0.1038423, -1.071183, 0, 0, 0, 1, 1,
-0.7919225, 1.277318, -1.237058, 0, 0, 0, 1, 1,
-0.7895633, 1.394956, -0.3930506, 0, 0, 0, 1, 1,
-0.7839534, 0.9005361, -1.169456, 0, 0, 0, 1, 1,
-0.7763373, -1.583969, -3.009602, 1, 1, 1, 1, 1,
-0.774514, 1.619665, 0.4193392, 1, 1, 1, 1, 1,
-0.7698434, -0.2846471, -2.549577, 1, 1, 1, 1, 1,
-0.7686745, -0.1107624, -1.544172, 1, 1, 1, 1, 1,
-0.765567, 0.8073717, -0.1271172, 1, 1, 1, 1, 1,
-0.7645112, -1.056922, -1.091067, 1, 1, 1, 1, 1,
-0.7468973, -0.2267205, -0.8416387, 1, 1, 1, 1, 1,
-0.7464686, -1.946688, -2.39957, 1, 1, 1, 1, 1,
-0.7386695, -0.8201345, -1.750251, 1, 1, 1, 1, 1,
-0.7365156, -0.1455873, -2.35566, 1, 1, 1, 1, 1,
-0.7213668, 0.9118052, -0.6898463, 1, 1, 1, 1, 1,
-0.7121946, 1.434902, -0.8943145, 1, 1, 1, 1, 1,
-0.7106548, 0.5268268, 0.5353535, 1, 1, 1, 1, 1,
-0.7094969, -0.9617021, -0.6936883, 1, 1, 1, 1, 1,
-0.706718, 1.051251, -1.736835, 1, 1, 1, 1, 1,
-0.70576, -1.054902, -2.446495, 0, 0, 1, 1, 1,
-0.7054364, 2.404071, -1.19901, 1, 0, 0, 1, 1,
-0.7053197, 0.1508807, -1.980846, 1, 0, 0, 1, 1,
-0.7035088, 0.3237714, -0.481956, 1, 0, 0, 1, 1,
-0.6979598, -0.7344161, -3.046454, 1, 0, 0, 1, 1,
-0.6978368, -0.2773353, -0.9957769, 1, 0, 0, 1, 1,
-0.6929777, -1.518863, -4.201156, 0, 0, 0, 1, 1,
-0.6921951, -1.082024, -2.552498, 0, 0, 0, 1, 1,
-0.6915656, 1.341327, 0.8758561, 0, 0, 0, 1, 1,
-0.6892589, 0.3550796, -2.087557, 0, 0, 0, 1, 1,
-0.6855186, 1.287358, -0.08345328, 0, 0, 0, 1, 1,
-0.6807109, -1.346573, -3.415005, 0, 0, 0, 1, 1,
-0.6789086, -0.5480062, -3.353494, 0, 0, 0, 1, 1,
-0.6752063, -1.612248, -4.064682, 1, 1, 1, 1, 1,
-0.6693386, 1.025352, -1.64426, 1, 1, 1, 1, 1,
-0.6674737, -0.04005539, 0.7263028, 1, 1, 1, 1, 1,
-0.6647316, -0.8046661, -1.568748, 1, 1, 1, 1, 1,
-0.659794, -0.7707326, -2.892583, 1, 1, 1, 1, 1,
-0.6560167, -1.34516, -0.4287997, 1, 1, 1, 1, 1,
-0.6537647, -0.3388271, -2.970821, 1, 1, 1, 1, 1,
-0.6536326, -0.08913691, -1.170519, 1, 1, 1, 1, 1,
-0.6513121, 0.9160661, -1.723617, 1, 1, 1, 1, 1,
-0.6496138, -0.31184, -0.7622519, 1, 1, 1, 1, 1,
-0.6493298, 1.156424, -0.817821, 1, 1, 1, 1, 1,
-0.6354835, -0.5574849, -3.430887, 1, 1, 1, 1, 1,
-0.6303637, 1.82399, -0.5967065, 1, 1, 1, 1, 1,
-0.6284105, -1.096103, -2.458097, 1, 1, 1, 1, 1,
-0.6238291, 0.7381619, -0.3535173, 1, 1, 1, 1, 1,
-0.6209429, 0.9622292, -0.7838671, 0, 0, 1, 1, 1,
-0.6198311, -0.1769878, -1.712647, 1, 0, 0, 1, 1,
-0.6060694, 0.3300273, 0.42943, 1, 0, 0, 1, 1,
-0.605396, -0.2374697, -1.510003, 1, 0, 0, 1, 1,
-0.6034617, -0.02210217, -2.147714, 1, 0, 0, 1, 1,
-0.6021014, 0.3405835, -0.7813107, 1, 0, 0, 1, 1,
-0.6019192, 0.7641059, -1.702439, 0, 0, 0, 1, 1,
-0.5926355, -0.2605586, -1.577086, 0, 0, 0, 1, 1,
-0.5916511, -0.6964436, -3.429166, 0, 0, 0, 1, 1,
-0.5882791, 0.8829208, -0.8365685, 0, 0, 0, 1, 1,
-0.5878118, 0.708515, -2.070588, 0, 0, 0, 1, 1,
-0.5875404, -0.9066907, -2.473401, 0, 0, 0, 1, 1,
-0.5874112, 1.138031, 0.04274365, 0, 0, 0, 1, 1,
-0.5872118, 1.337661, -1.56139, 1, 1, 1, 1, 1,
-0.5797901, 1.345271, -0.8826782, 1, 1, 1, 1, 1,
-0.5736814, -1.808999, -2.452091, 1, 1, 1, 1, 1,
-0.5730819, -0.2242678, -1.787975, 1, 1, 1, 1, 1,
-0.5678501, -0.8654897, -1.467613, 1, 1, 1, 1, 1,
-0.5677053, 0.5132831, -1.612886, 1, 1, 1, 1, 1,
-0.56536, -0.6743377, -0.6556519, 1, 1, 1, 1, 1,
-0.5610244, 1.194414, -0.2609016, 1, 1, 1, 1, 1,
-0.5609767, 0.1510638, -1.320983, 1, 1, 1, 1, 1,
-0.5568519, 1.500937, -1.708526, 1, 1, 1, 1, 1,
-0.5539967, -1.717446, -2.643491, 1, 1, 1, 1, 1,
-0.5500497, -1.141485, -2.817293, 1, 1, 1, 1, 1,
-0.5461518, -2.332961, -2.779812, 1, 1, 1, 1, 1,
-0.5455703, -0.06323574, -1.160619, 1, 1, 1, 1, 1,
-0.545043, 0.250976, -1.917675, 1, 1, 1, 1, 1,
-0.5443727, -0.15518, -3.455872, 0, 0, 1, 1, 1,
-0.5390305, 1.01364, -0.4761252, 1, 0, 0, 1, 1,
-0.5382915, 0.168768, -1.410242, 1, 0, 0, 1, 1,
-0.5378813, 1.400558, 0.8731538, 1, 0, 0, 1, 1,
-0.533889, 0.4010113, -2.398578, 1, 0, 0, 1, 1,
-0.5306413, -0.9854849, -3.359111, 1, 0, 0, 1, 1,
-0.5261505, 0.2094519, -2.401599, 0, 0, 0, 1, 1,
-0.5254963, -1.156791, -1.4531, 0, 0, 0, 1, 1,
-0.5232434, 0.568418, 0.610948, 0, 0, 0, 1, 1,
-0.5172496, -0.4292516, -2.551546, 0, 0, 0, 1, 1,
-0.5168778, 0.5141069, -1.161201, 0, 0, 0, 1, 1,
-0.5163259, -0.5359573, -3.371805, 0, 0, 0, 1, 1,
-0.5102531, -0.9485498, -2.729017, 0, 0, 0, 1, 1,
-0.5098401, -0.3733981, -1.276547, 1, 1, 1, 1, 1,
-0.5030067, -1.319134, -4.545401, 1, 1, 1, 1, 1,
-0.5005533, -0.4265827, -2.463179, 1, 1, 1, 1, 1,
-0.4989148, -2.1906, -3.511397, 1, 1, 1, 1, 1,
-0.4988753, -1.147803, -2.481339, 1, 1, 1, 1, 1,
-0.4963943, 1.59871, 0.5737617, 1, 1, 1, 1, 1,
-0.4910045, -0.1715083, -1.488912, 1, 1, 1, 1, 1,
-0.4835429, -2.276576, -2.110271, 1, 1, 1, 1, 1,
-0.4813284, 0.420035, 0.488402, 1, 1, 1, 1, 1,
-0.4787169, -0.5884065, -4.405717, 1, 1, 1, 1, 1,
-0.4757919, 0.007328046, -0.4384874, 1, 1, 1, 1, 1,
-0.4757632, 0.05336737, -0.1041014, 1, 1, 1, 1, 1,
-0.4645021, 0.7486461, 0.7803341, 1, 1, 1, 1, 1,
-0.4631447, -0.3074245, -2.206352, 1, 1, 1, 1, 1,
-0.4624066, 1.341459, 0.8829822, 1, 1, 1, 1, 1,
-0.4519325, -0.1118845, -0.8570287, 0, 0, 1, 1, 1,
-0.4441839, 0.688269, -0.2254224, 1, 0, 0, 1, 1,
-0.4419832, 0.2091725, -0.7646497, 1, 0, 0, 1, 1,
-0.4415361, 0.071419, -0.9763451, 1, 0, 0, 1, 1,
-0.4414455, -1.161565, -2.986053, 1, 0, 0, 1, 1,
-0.4394886, 0.2795003, -1.828124, 1, 0, 0, 1, 1,
-0.4350742, -0.5364119, -1.19344, 0, 0, 0, 1, 1,
-0.4348431, -0.5371001, -1.613623, 0, 0, 0, 1, 1,
-0.4329615, 0.5835793, -0.8089651, 0, 0, 0, 1, 1,
-0.4317982, -2.165242, -3.562919, 0, 0, 0, 1, 1,
-0.4279635, -0.1800064, -0.4277883, 0, 0, 0, 1, 1,
-0.4273545, -0.9284236, 0.1997454, 0, 0, 0, 1, 1,
-0.426107, 1.318573, -1.320913, 0, 0, 0, 1, 1,
-0.4243507, 1.588357, 0.5617284, 1, 1, 1, 1, 1,
-0.4214334, -0.8329027, -2.657186, 1, 1, 1, 1, 1,
-0.4204262, -0.380439, -0.09334347, 1, 1, 1, 1, 1,
-0.4117063, -0.3645284, -2.237824, 1, 1, 1, 1, 1,
-0.4113102, 1.689447, -0.3633027, 1, 1, 1, 1, 1,
-0.4100571, 1.27288, -1.399541, 1, 1, 1, 1, 1,
-0.4097393, -2.724233, -1.194535, 1, 1, 1, 1, 1,
-0.4086015, 1.085546, -1.60184, 1, 1, 1, 1, 1,
-0.4051747, -0.6081517, -2.486411, 1, 1, 1, 1, 1,
-0.3990891, -2.049596, -0.0514317, 1, 1, 1, 1, 1,
-0.398222, -0.4683732, -3.088525, 1, 1, 1, 1, 1,
-0.3960214, 0.0225906, -1.14279, 1, 1, 1, 1, 1,
-0.3943197, 0.5489513, -0.07093367, 1, 1, 1, 1, 1,
-0.3925106, -1.453637, -3.863919, 1, 1, 1, 1, 1,
-0.3909058, -1.069439, -3.532774, 1, 1, 1, 1, 1,
-0.3908157, 0.7951003, 0.8676905, 0, 0, 1, 1, 1,
-0.3880312, -0.1176058, -1.267762, 1, 0, 0, 1, 1,
-0.3875217, -0.9269708, -3.064107, 1, 0, 0, 1, 1,
-0.3820171, -0.32439, -4.058584, 1, 0, 0, 1, 1,
-0.3799085, -1.041088, -3.009622, 1, 0, 0, 1, 1,
-0.3779652, 1.27405, -2.026199, 1, 0, 0, 1, 1,
-0.37641, -0.652128, -1.379401, 0, 0, 0, 1, 1,
-0.3738949, -0.7809109, -3.263087, 0, 0, 0, 1, 1,
-0.372964, -0.1239382, -1.551529, 0, 0, 0, 1, 1,
-0.3688618, 0.1700082, -1.116539, 0, 0, 0, 1, 1,
-0.3686162, 1.593072, -0.9893629, 0, 0, 0, 1, 1,
-0.3673631, 0.4130939, 0.08871689, 0, 0, 0, 1, 1,
-0.3668675, -1.016324, -2.946697, 0, 0, 0, 1, 1,
-0.3666709, 0.2067596, -1.542788, 1, 1, 1, 1, 1,
-0.3646222, -1.199273, -2.795413, 1, 1, 1, 1, 1,
-0.3625205, 0.3246863, -1.053759, 1, 1, 1, 1, 1,
-0.3560943, -0.6390657, -1.611052, 1, 1, 1, 1, 1,
-0.3549958, -1.646635, -2.819224, 1, 1, 1, 1, 1,
-0.3537573, 2.301612, -1.008074, 1, 1, 1, 1, 1,
-0.3527265, -0.1282291, -0.7692162, 1, 1, 1, 1, 1,
-0.3522907, -0.6955764, -2.770466, 1, 1, 1, 1, 1,
-0.3514724, -0.4406839, -2.824205, 1, 1, 1, 1, 1,
-0.3435215, 1.508325, 1.646576, 1, 1, 1, 1, 1,
-0.3395796, -1.110282, -2.11331, 1, 1, 1, 1, 1,
-0.3394408, 0.9424964, -0.4994794, 1, 1, 1, 1, 1,
-0.3345216, -0.1677194, -2.002995, 1, 1, 1, 1, 1,
-0.3337439, 0.6836906, -0.8192294, 1, 1, 1, 1, 1,
-0.3320992, -1.34788, -4.418039, 1, 1, 1, 1, 1,
-0.3315708, -0.4514605, -1.002162, 0, 0, 1, 1, 1,
-0.3315656, 0.4096993, -1.022254, 1, 0, 0, 1, 1,
-0.3175088, 0.6900223, -0.3635353, 1, 0, 0, 1, 1,
-0.3160815, -0.4162634, -1.845104, 1, 0, 0, 1, 1,
-0.312478, -0.8673076, -3.101911, 1, 0, 0, 1, 1,
-0.3075845, -2.518359, -3.092253, 1, 0, 0, 1, 1,
-0.3040666, -1.151884, -3.382343, 0, 0, 0, 1, 1,
-0.2994643, -0.1552269, -0.2532255, 0, 0, 0, 1, 1,
-0.2993261, 0.6277425, 0.2429354, 0, 0, 0, 1, 1,
-0.2965885, -1.038885, -3.129078, 0, 0, 0, 1, 1,
-0.2903099, 0.4917885, -1.067262, 0, 0, 0, 1, 1,
-0.2875209, 0.7674651, -1.13309, 0, 0, 0, 1, 1,
-0.2872883, 0.3835347, -0.9128094, 0, 0, 0, 1, 1,
-0.2835951, 0.2280114, -2.047001, 1, 1, 1, 1, 1,
-0.2802309, 0.1908077, -0.5787138, 1, 1, 1, 1, 1,
-0.2734087, -0.1243317, -2.709803, 1, 1, 1, 1, 1,
-0.2727058, -0.4471001, -2.551427, 1, 1, 1, 1, 1,
-0.2717475, 0.2904313, -1.225555, 1, 1, 1, 1, 1,
-0.2706118, -2.464448, -3.086751, 1, 1, 1, 1, 1,
-0.2605503, -0.4300879, -3.554337, 1, 1, 1, 1, 1,
-0.2511161, -2.184919, -3.991628, 1, 1, 1, 1, 1,
-0.2421267, 0.1668901, -0.6018594, 1, 1, 1, 1, 1,
-0.2420622, 0.7503902, -1.431459, 1, 1, 1, 1, 1,
-0.2407593, -0.4439856, -2.206633, 1, 1, 1, 1, 1,
-0.2348783, 0.6964459, -0.7696901, 1, 1, 1, 1, 1,
-0.233842, -1.309968, -2.091956, 1, 1, 1, 1, 1,
-0.2326381, -0.0588887, -2.021239, 1, 1, 1, 1, 1,
-0.2324319, 1.161716, -0.4751883, 1, 1, 1, 1, 1,
-0.2295403, -0.2994266, -2.398078, 0, 0, 1, 1, 1,
-0.2248826, 0.5930151, -0.4366895, 1, 0, 0, 1, 1,
-0.2219714, 0.4024904, -0.8773155, 1, 0, 0, 1, 1,
-0.2197483, 0.05356847, -2.928754, 1, 0, 0, 1, 1,
-0.2151376, 0.1116632, -1.824325, 1, 0, 0, 1, 1,
-0.2111036, 1.097063, -0.1328608, 1, 0, 0, 1, 1,
-0.2104626, -0.6632529, -3.439454, 0, 0, 0, 1, 1,
-0.2103706, -1.08701, -3.667808, 0, 0, 0, 1, 1,
-0.2050719, -0.4300101, -1.305703, 0, 0, 0, 1, 1,
-0.2044915, -0.1083305, -1.997438, 0, 0, 0, 1, 1,
-0.2028733, -1.669157, -3.601695, 0, 0, 0, 1, 1,
-0.2011895, 1.80118, 0.4197865, 0, 0, 0, 1, 1,
-0.1920625, -0.3700162, -2.200742, 0, 0, 0, 1, 1,
-0.190417, 0.7769294, 0.5272429, 1, 1, 1, 1, 1,
-0.1849045, 0.9360906, -0.1436023, 1, 1, 1, 1, 1,
-0.1847914, -1.236216, -4.125288, 1, 1, 1, 1, 1,
-0.1768038, -0.6848994, -3.277779, 1, 1, 1, 1, 1,
-0.1651399, -0.4068165, -3.020019, 1, 1, 1, 1, 1,
-0.1637881, 1.945996, -0.2526613, 1, 1, 1, 1, 1,
-0.1636556, 0.6804228, -0.9523509, 1, 1, 1, 1, 1,
-0.162486, 0.1964481, -0.6462039, 1, 1, 1, 1, 1,
-0.1620764, 0.4854163, -1.822505, 1, 1, 1, 1, 1,
-0.1585321, 0.2125331, -1.090919, 1, 1, 1, 1, 1,
-0.1566846, -1.496801, -3.389416, 1, 1, 1, 1, 1,
-0.152268, -0.8448638, -2.548679, 1, 1, 1, 1, 1,
-0.1475623, 2.088327, 0.09238376, 1, 1, 1, 1, 1,
-0.1472098, 0.5514544, -1.087348, 1, 1, 1, 1, 1,
-0.1468019, -0.473094, -2.173146, 1, 1, 1, 1, 1,
-0.1467336, 0.2163124, -2.487763, 0, 0, 1, 1, 1,
-0.1463401, -0.4898378, -4.473061, 1, 0, 0, 1, 1,
-0.144984, -0.3062572, -3.272664, 1, 0, 0, 1, 1,
-0.142865, 1.895889, 1.190939, 1, 0, 0, 1, 1,
-0.136209, 0.9336792, 0.6523816, 1, 0, 0, 1, 1,
-0.1358212, 1.122633, -0.446098, 1, 0, 0, 1, 1,
-0.1340362, 0.2368565, 0.1509337, 0, 0, 0, 1, 1,
-0.129024, 1.264523, -0.9418426, 0, 0, 0, 1, 1,
-0.1223727, -1.726796, -2.124231, 0, 0, 0, 1, 1,
-0.1218368, -1.045752, -2.208276, 0, 0, 0, 1, 1,
-0.1181219, -0.3543302, -4.139868, 0, 0, 0, 1, 1,
-0.1161114, 0.6416765, 1.450032, 0, 0, 0, 1, 1,
-0.1155679, 1.0484, -1.328068, 0, 0, 0, 1, 1,
-0.1121236, 0.4735009, 1.729054, 1, 1, 1, 1, 1,
-0.1071731, 0.6136609, -0.8144938, 1, 1, 1, 1, 1,
-0.1071354, 0.6411282, -1.463628, 1, 1, 1, 1, 1,
-0.1056569, 0.749544, -1.680216, 1, 1, 1, 1, 1,
-0.09977914, -0.625939, -3.245676, 1, 1, 1, 1, 1,
-0.0960432, 0.1700597, 1.009502, 1, 1, 1, 1, 1,
-0.09569562, 1.410272, 0.06821845, 1, 1, 1, 1, 1,
-0.0910034, 1.19623, -0.285158, 1, 1, 1, 1, 1,
-0.08690084, -1.111454, -2.014116, 1, 1, 1, 1, 1,
-0.08541575, -1.689323, -3.520315, 1, 1, 1, 1, 1,
-0.08290303, -0.8560838, -3.032276, 1, 1, 1, 1, 1,
-0.07638871, 0.03533076, -3.175045, 1, 1, 1, 1, 1,
-0.07566579, -0.6746051, -2.955691, 1, 1, 1, 1, 1,
-0.07299572, -0.01719478, -3.37001, 1, 1, 1, 1, 1,
-0.0694859, 0.3108896, 0.09465139, 1, 1, 1, 1, 1,
-0.06526453, 1.007067, -0.39865, 0, 0, 1, 1, 1,
-0.06434458, -0.8360756, -2.469676, 1, 0, 0, 1, 1,
-0.06144651, -2.130299, -3.44585, 1, 0, 0, 1, 1,
-0.05863884, 0.9225222, -0.3285133, 1, 0, 0, 1, 1,
-0.058436, 0.07854776, -0.3665687, 1, 0, 0, 1, 1,
-0.05703254, -0.4508217, -2.239699, 1, 0, 0, 1, 1,
-0.05647612, 0.6240222, -0.7957637, 0, 0, 0, 1, 1,
-0.04945419, 1.455882, -1.177064, 0, 0, 0, 1, 1,
-0.0488762, -2.586024, -2.589184, 0, 0, 0, 1, 1,
-0.04447632, -0.1852821, -1.445398, 0, 0, 0, 1, 1,
-0.04261522, -0.3377022, -4.661848, 0, 0, 0, 1, 1,
-0.04208784, -0.06832177, -1.491093, 0, 0, 0, 1, 1,
-0.04193395, 2.226414, 1.42923, 0, 0, 0, 1, 1,
-0.04028778, 0.9784436, -0.6836319, 1, 1, 1, 1, 1,
-0.03881129, -0.4982265, -4.082254, 1, 1, 1, 1, 1,
-0.03860698, -1.117599, -4.798875, 1, 1, 1, 1, 1,
-0.03569287, 0.87612, 0.4894789, 1, 1, 1, 1, 1,
-0.03084231, -1.657706, -1.396909, 1, 1, 1, 1, 1,
-0.02951141, -0.82172, -3.400269, 1, 1, 1, 1, 1,
-0.02810255, -0.01472351, -3.433418, 1, 1, 1, 1, 1,
-0.02011002, -0.179536, -3.538174, 1, 1, 1, 1, 1,
-0.01960493, 0.8964072, 0.7766144, 1, 1, 1, 1, 1,
-0.01715514, -1.330551, -3.00556, 1, 1, 1, 1, 1,
-0.01464124, 0.9044095, -2.83018, 1, 1, 1, 1, 1,
-0.01233204, 0.6164089, 0.4401863, 1, 1, 1, 1, 1,
-0.01044807, 1.026125, -0.5622917, 1, 1, 1, 1, 1,
-0.008580026, 0.918615, 1.138622, 1, 1, 1, 1, 1,
-0.007414095, -0.4153418, -3.582678, 1, 1, 1, 1, 1,
-0.006920411, 1.697812, 0.9065441, 0, 0, 1, 1, 1,
-0.004218092, -0.05648764, -1.390258, 1, 0, 0, 1, 1,
-0.002571404, 0.6640202, -0.5679874, 1, 0, 0, 1, 1,
-0.002436874, 0.06566842, -0.8839407, 1, 0, 0, 1, 1,
-0.002008528, -1.235745, -3.809997, 1, 0, 0, 1, 1,
-0.000395768, 1.470664, 0.4359363, 1, 0, 0, 1, 1,
0.008853253, 0.2378257, 0.1401599, 0, 0, 0, 1, 1,
0.009159246, 0.1187043, -0.1297811, 0, 0, 0, 1, 1,
0.009412874, -1.527866, 2.248032, 0, 0, 0, 1, 1,
0.009881356, -0.1800734, 2.698716, 0, 0, 0, 1, 1,
0.01410057, 0.006876969, 0.403247, 0, 0, 0, 1, 1,
0.01756436, 0.6828012, 1.479576, 0, 0, 0, 1, 1,
0.02705081, -0.2375398, 2.629514, 0, 0, 0, 1, 1,
0.02743653, -1.18461, 3.97244, 1, 1, 1, 1, 1,
0.03381499, 0.4045887, -3.35185, 1, 1, 1, 1, 1,
0.03473201, -0.4523464, 4.896841, 1, 1, 1, 1, 1,
0.03713714, -1.218963, 2.076414, 1, 1, 1, 1, 1,
0.03997606, 0.3378475, -1.86988, 1, 1, 1, 1, 1,
0.04049217, -1.289299, 5.119638, 1, 1, 1, 1, 1,
0.0408622, -1.682086, 2.843405, 1, 1, 1, 1, 1,
0.04093381, -1.00735, 4.511446, 1, 1, 1, 1, 1,
0.04102424, 0.6458162, -0.8946247, 1, 1, 1, 1, 1,
0.04736889, 0.9468054, 0.2585091, 1, 1, 1, 1, 1,
0.05833458, -0.01724525, 1.110156, 1, 1, 1, 1, 1,
0.05985115, 0.009665867, 0.9849694, 1, 1, 1, 1, 1,
0.06045277, -0.418667, 0.6993281, 1, 1, 1, 1, 1,
0.07425085, -1.772332, 4.032122, 1, 1, 1, 1, 1,
0.07556, -2.102364, 4.859366, 1, 1, 1, 1, 1,
0.07661545, 1.91632, -0.07286642, 0, 0, 1, 1, 1,
0.07702003, 0.02880617, 2.462681, 1, 0, 0, 1, 1,
0.08049268, 1.635882, 0.125001, 1, 0, 0, 1, 1,
0.08446641, -2.296165, 3.09027, 1, 0, 0, 1, 1,
0.08620802, -0.8933468, 2.725873, 1, 0, 0, 1, 1,
0.09292698, 0.4953521, 1.650001, 1, 0, 0, 1, 1,
0.09568511, 0.05334128, 0.9372622, 0, 0, 0, 1, 1,
0.09631095, 0.6506582, -1.003868, 0, 0, 0, 1, 1,
0.09718912, -1.21438, 2.907516, 0, 0, 0, 1, 1,
0.1000372, -0.7565631, 2.402025, 0, 0, 0, 1, 1,
0.1030441, 1.592784, 0.0112114, 0, 0, 0, 1, 1,
0.1049473, -0.7117301, 2.115367, 0, 0, 0, 1, 1,
0.1066809, 0.1225229, 0.9040911, 0, 0, 0, 1, 1,
0.108333, 1.483773, -0.6796377, 1, 1, 1, 1, 1,
0.1092124, 1.280507, 0.8193216, 1, 1, 1, 1, 1,
0.1113012, -2.716669, 2.866589, 1, 1, 1, 1, 1,
0.1151201, 0.4389957, -1.323764, 1, 1, 1, 1, 1,
0.1245614, 0.1060478, -0.1686893, 1, 1, 1, 1, 1,
0.1246709, 1.186525, -1.113802, 1, 1, 1, 1, 1,
0.1256245, 1.425632, 0.9887496, 1, 1, 1, 1, 1,
0.1291727, 0.6739784, -0.7602334, 1, 1, 1, 1, 1,
0.1311371, -0.009988338, 0.826539, 1, 1, 1, 1, 1,
0.1323243, 0.9924943, -1.058095, 1, 1, 1, 1, 1,
0.1339191, -0.3145681, 1.966611, 1, 1, 1, 1, 1,
0.1345047, 0.03018045, -0.6371222, 1, 1, 1, 1, 1,
0.1369099, 0.7398832, 0.3312466, 1, 1, 1, 1, 1,
0.1406797, 2.75167, 0.1347994, 1, 1, 1, 1, 1,
0.1429841, -0.6887234, 2.669522, 1, 1, 1, 1, 1,
0.1444492, 1.226477, -0.08594984, 0, 0, 1, 1, 1,
0.1453747, -0.7268969, 3.137546, 1, 0, 0, 1, 1,
0.1468066, 3.040541, 0.9679531, 1, 0, 0, 1, 1,
0.1489628, -0.8068528, 4.290094, 1, 0, 0, 1, 1,
0.1492674, -0.7974464, 3.910581, 1, 0, 0, 1, 1,
0.1531048, -0.0666653, 1.081476, 1, 0, 0, 1, 1,
0.1546777, 0.2749373, -0.451511, 0, 0, 0, 1, 1,
0.1553152, 1.472307, 0.7009395, 0, 0, 0, 1, 1,
0.1587008, 0.5252391, -0.6216141, 0, 0, 0, 1, 1,
0.1617906, 1.580027, -1.349613, 0, 0, 0, 1, 1,
0.1643412, 0.5835741, 0.816052, 0, 0, 0, 1, 1,
0.1651687, 0.8302975, -0.504678, 0, 0, 0, 1, 1,
0.1665645, 0.6223966, -0.1208081, 0, 0, 0, 1, 1,
0.1685946, -0.5024042, 3.776521, 1, 1, 1, 1, 1,
0.1689844, 0.6200212, -0.04715692, 1, 1, 1, 1, 1,
0.1696897, 2.264915, 1.941059, 1, 1, 1, 1, 1,
0.169919, -1.248654, 3.064283, 1, 1, 1, 1, 1,
0.1703439, 0.1061366, 1.692093, 1, 1, 1, 1, 1,
0.1739241, -1.614704, 1.919218, 1, 1, 1, 1, 1,
0.1744567, 0.1586539, 0.1029951, 1, 1, 1, 1, 1,
0.1751846, 0.5983443, -0.005299212, 1, 1, 1, 1, 1,
0.1855851, -0.4307067, 2.855679, 1, 1, 1, 1, 1,
0.1911165, 0.4208405, 1.255924, 1, 1, 1, 1, 1,
0.1935627, 0.4750795, -0.8158188, 1, 1, 1, 1, 1,
0.1942461, 0.3350049, 0.2214312, 1, 1, 1, 1, 1,
0.1949244, -0.5976393, 2.00866, 1, 1, 1, 1, 1,
0.1982289, -0.454289, 1.657456, 1, 1, 1, 1, 1,
0.202649, 0.9349176, -0.3622085, 1, 1, 1, 1, 1,
0.2051337, 0.864088, 0.583028, 0, 0, 1, 1, 1,
0.2084991, 0.4386404, 0.7829373, 1, 0, 0, 1, 1,
0.2111422, 2.41323, -0.7526547, 1, 0, 0, 1, 1,
0.2121121, 1.652283, 0.1596747, 1, 0, 0, 1, 1,
0.2125051, 2.142921, 1.088437, 1, 0, 0, 1, 1,
0.2149581, 0.7556459, 0.342281, 1, 0, 0, 1, 1,
0.2187445, -0.3550375, 1.33402, 0, 0, 0, 1, 1,
0.2233927, -0.3162177, 0.6324362, 0, 0, 0, 1, 1,
0.2244605, 0.4904864, -1.41889, 0, 0, 0, 1, 1,
0.234431, -0.1220413, 2.946283, 0, 0, 0, 1, 1,
0.2347408, -0.2032735, 2.262839, 0, 0, 0, 1, 1,
0.2376513, 0.9673507, 1.602891, 0, 0, 0, 1, 1,
0.2389716, 0.1296201, 2.690499, 0, 0, 0, 1, 1,
0.244745, -0.02604325, 0.5206895, 1, 1, 1, 1, 1,
0.2491484, -0.08712327, 2.143386, 1, 1, 1, 1, 1,
0.2532797, -1.537846, 3.173268, 1, 1, 1, 1, 1,
0.2605577, 0.119821, 0.05039302, 1, 1, 1, 1, 1,
0.2619511, -0.255626, 2.693951, 1, 1, 1, 1, 1,
0.2635981, -0.2486429, 3.436946, 1, 1, 1, 1, 1,
0.2674027, 1.044269, -1.696036, 1, 1, 1, 1, 1,
0.272317, 0.7768657, 2.331295, 1, 1, 1, 1, 1,
0.2752048, -0.7219407, 3.433867, 1, 1, 1, 1, 1,
0.2768372, 0.6384479, -0.2022151, 1, 1, 1, 1, 1,
0.2830521, -0.448977, 2.97404, 1, 1, 1, 1, 1,
0.2839895, 0.5713562, 0.7095593, 1, 1, 1, 1, 1,
0.2856064, 0.1284111, 1.30763, 1, 1, 1, 1, 1,
0.2869923, -0.7426301, 3.012736, 1, 1, 1, 1, 1,
0.290271, 0.3319022, -0.7463545, 1, 1, 1, 1, 1,
0.2917095, -1.478138, 2.07241, 0, 0, 1, 1, 1,
0.2935252, 0.2737289, 1.004401, 1, 0, 0, 1, 1,
0.3040205, 0.8105397, 0.9144346, 1, 0, 0, 1, 1,
0.3062086, -1.17829, 1.231194, 1, 0, 0, 1, 1,
0.307053, 0.2011995, 0.8797417, 1, 0, 0, 1, 1,
0.307322, -0.6280268, 1.375729, 1, 0, 0, 1, 1,
0.3156821, 1.541869, 1.426264, 0, 0, 0, 1, 1,
0.3201313, 0.8973609, 0.5703176, 0, 0, 0, 1, 1,
0.3203517, 1.105089, 1.321765, 0, 0, 0, 1, 1,
0.3256663, 0.642585, -0.09552445, 0, 0, 0, 1, 1,
0.3283881, 0.03065667, 1.415654, 0, 0, 0, 1, 1,
0.3287576, 0.7243414, 0.8273773, 0, 0, 0, 1, 1,
0.3362035, -0.14943, 1.965077, 0, 0, 0, 1, 1,
0.3453986, -1.272513, 2.577908, 1, 1, 1, 1, 1,
0.3479071, 1.893118, -1.118998, 1, 1, 1, 1, 1,
0.3487468, -1.125742, 4.801614, 1, 1, 1, 1, 1,
0.349206, 1.010846, -0.05516325, 1, 1, 1, 1, 1,
0.3524384, 0.943435, 0.9003732, 1, 1, 1, 1, 1,
0.3539662, 0.1989062, 1.569816, 1, 1, 1, 1, 1,
0.3575615, -0.0521272, 2.660455, 1, 1, 1, 1, 1,
0.3604192, 1.906292, 0.218914, 1, 1, 1, 1, 1,
0.3615465, 0.7042778, 1.011901, 1, 1, 1, 1, 1,
0.3660516, -1.044747, 1.405582, 1, 1, 1, 1, 1,
0.3668306, -0.8765391, 2.024637, 1, 1, 1, 1, 1,
0.367373, 0.4424671, 0.8682196, 1, 1, 1, 1, 1,
0.3676401, 0.5501283, 0.9002492, 1, 1, 1, 1, 1,
0.3705661, -0.005514633, 1.049177, 1, 1, 1, 1, 1,
0.3728248, 0.5745938, 1.310067, 1, 1, 1, 1, 1,
0.3804982, -0.2652337, 1.836118, 0, 0, 1, 1, 1,
0.3820503, 1.397015, 0.02686469, 1, 0, 0, 1, 1,
0.3866351, -0.06179324, 1.945135, 1, 0, 0, 1, 1,
0.3873764, -0.5386632, 2.296084, 1, 0, 0, 1, 1,
0.3885713, 1.087026, -1.282474, 1, 0, 0, 1, 1,
0.4012155, -1.13599, 2.236946, 1, 0, 0, 1, 1,
0.4017775, -0.04261083, 0.02793243, 0, 0, 0, 1, 1,
0.4019043, -0.3485419, 2.661574, 0, 0, 0, 1, 1,
0.4020009, -0.04523223, 1.513188, 0, 0, 0, 1, 1,
0.4082982, 2.444448, 1.587103, 0, 0, 0, 1, 1,
0.4167486, 0.2379001, -0.2230942, 0, 0, 0, 1, 1,
0.4173048, 0.1669313, 1.265724, 0, 0, 0, 1, 1,
0.4179824, -0.9408101, 1.861045, 0, 0, 0, 1, 1,
0.4186971, 0.5070688, 1.094477, 1, 1, 1, 1, 1,
0.4332392, -0.6489844, 2.91447, 1, 1, 1, 1, 1,
0.433992, 0.9664769, 1.260744, 1, 1, 1, 1, 1,
0.4343508, 0.1202576, 1.701483, 1, 1, 1, 1, 1,
0.4344587, 0.5204626, 2.322441, 1, 1, 1, 1, 1,
0.4397244, 0.9759086, -0.4364525, 1, 1, 1, 1, 1,
0.4415324, -1.841037, 3.189802, 1, 1, 1, 1, 1,
0.4431228, 0.3554239, 1.797941, 1, 1, 1, 1, 1,
0.4467594, -0.6784541, 3.710903, 1, 1, 1, 1, 1,
0.4468431, -0.7150755, 1.492719, 1, 1, 1, 1, 1,
0.4479161, -0.7191911, 2.74926, 1, 1, 1, 1, 1,
0.4481127, -1.820888, 2.390115, 1, 1, 1, 1, 1,
0.4506871, 0.8627552, 1.953917, 1, 1, 1, 1, 1,
0.4514467, 1.977151, 2.256102, 1, 1, 1, 1, 1,
0.4523016, -0.06393844, 2.997649, 1, 1, 1, 1, 1,
0.452668, -0.06887735, 4.128831, 0, 0, 1, 1, 1,
0.4535945, 0.7773256, 0.5778239, 1, 0, 0, 1, 1,
0.4551331, -0.7646158, 3.012589, 1, 0, 0, 1, 1,
0.4580644, 0.9887438, 1.244316, 1, 0, 0, 1, 1,
0.4588039, 0.01578363, 2.261192, 1, 0, 0, 1, 1,
0.4595847, -0.2730875, 0.02531493, 1, 0, 0, 1, 1,
0.460484, -0.4021781, 4.695142, 0, 0, 0, 1, 1,
0.4617238, -0.5256507, 1.293079, 0, 0, 0, 1, 1,
0.4637405, -0.5415084, 2.345616, 0, 0, 0, 1, 1,
0.4655973, 0.1814675, -0.6620367, 0, 0, 0, 1, 1,
0.4687657, -0.907894, 2.262596, 0, 0, 0, 1, 1,
0.4745004, 0.02391651, 0.7810584, 0, 0, 0, 1, 1,
0.4752466, -0.1445531, 1.670431, 0, 0, 0, 1, 1,
0.4762444, 0.9883306, 0.8620033, 1, 1, 1, 1, 1,
0.4770887, 0.4671046, 0.9791402, 1, 1, 1, 1, 1,
0.4825186, -0.5882441, 1.944859, 1, 1, 1, 1, 1,
0.4825651, -1.377787, 1.890654, 1, 1, 1, 1, 1,
0.4829156, -0.9883185, 2.888469, 1, 1, 1, 1, 1,
0.4889488, -0.1610729, 0.03442619, 1, 1, 1, 1, 1,
0.4926865, -2.162007, 3.861926, 1, 1, 1, 1, 1,
0.4982589, 0.5043535, 0.0262763, 1, 1, 1, 1, 1,
0.5014645, -0.07980809, 2.298296, 1, 1, 1, 1, 1,
0.5022399, -0.5515891, 1.761964, 1, 1, 1, 1, 1,
0.5046128, 0.1148049, 0.41699, 1, 1, 1, 1, 1,
0.506631, 0.5946769, 1.223782, 1, 1, 1, 1, 1,
0.5138448, -1.013172, 2.452049, 1, 1, 1, 1, 1,
0.5196869, -0.4798933, 1.313577, 1, 1, 1, 1, 1,
0.5220449, -0.4215667, 1.788865, 1, 1, 1, 1, 1,
0.530773, 0.1496574, 0.9430728, 0, 0, 1, 1, 1,
0.5331705, 0.3795616, 2.492207, 1, 0, 0, 1, 1,
0.5337745, 1.519086, -0.6335025, 1, 0, 0, 1, 1,
0.5371445, -1.722252, 1.322313, 1, 0, 0, 1, 1,
0.5391066, 0.2374617, 1.494645, 1, 0, 0, 1, 1,
0.5420728, -0.3610651, 1.899812, 1, 0, 0, 1, 1,
0.5510226, 0.2258674, 1.518734, 0, 0, 0, 1, 1,
0.558253, -0.613942, 1.450227, 0, 0, 0, 1, 1,
0.5622101, 1.353498, 0.3665659, 0, 0, 0, 1, 1,
0.5659078, 1.282295, 1.451285, 0, 0, 0, 1, 1,
0.5670154, -0.2114477, 2.706027, 0, 0, 0, 1, 1,
0.5682888, -0.5564799, 3.677658, 0, 0, 0, 1, 1,
0.5732642, 0.4974014, -0.07531337, 0, 0, 0, 1, 1,
0.5742059, -1.957078, 4.077279, 1, 1, 1, 1, 1,
0.5745038, 1.765079, -0.2054669, 1, 1, 1, 1, 1,
0.5747054, 0.7813653, 2.090088, 1, 1, 1, 1, 1,
0.5819734, 0.2496117, 0.6144795, 1, 1, 1, 1, 1,
0.58757, 0.1297266, 2.292171, 1, 1, 1, 1, 1,
0.5908278, 0.5155405, -0.4496607, 1, 1, 1, 1, 1,
0.5970748, 0.2379268, 2.81386, 1, 1, 1, 1, 1,
0.5974201, -0.1742304, 2.509949, 1, 1, 1, 1, 1,
0.6001394, -2.458364, 3.4263, 1, 1, 1, 1, 1,
0.6039904, -0.4754794, 1.73534, 1, 1, 1, 1, 1,
0.6046497, 0.05293506, 2.301079, 1, 1, 1, 1, 1,
0.6049955, -0.1411103, 0.886929, 1, 1, 1, 1, 1,
0.6070783, -0.1564402, 3.397103, 1, 1, 1, 1, 1,
0.612604, 0.8763888, 0.9269331, 1, 1, 1, 1, 1,
0.6126168, 0.9505153, 0.6103919, 1, 1, 1, 1, 1,
0.6170979, -1.330784, 3.842914, 0, 0, 1, 1, 1,
0.6221724, 1.527702, 2.089317, 1, 0, 0, 1, 1,
0.6238722, -1.094233, 2.770999, 1, 0, 0, 1, 1,
0.624555, -0.6048159, 3.468637, 1, 0, 0, 1, 1,
0.6271369, 0.4724928, 0.3965153, 1, 0, 0, 1, 1,
0.6276428, 0.769802, 0.7255061, 1, 0, 0, 1, 1,
0.6301541, -1.067899, 2.970488, 0, 0, 0, 1, 1,
0.6309504, -0.09677757, 1.150285, 0, 0, 0, 1, 1,
0.6344796, 0.4617505, -0.06002498, 0, 0, 0, 1, 1,
0.6365346, -0.02254113, 3.126417, 0, 0, 0, 1, 1,
0.6390941, 0.2977766, 0.8446464, 0, 0, 0, 1, 1,
0.6436142, 2.064633, -1.317791, 0, 0, 0, 1, 1,
0.6464717, -0.4526412, 0.1668929, 0, 0, 0, 1, 1,
0.6483073, 1.525812, 1.991439, 1, 1, 1, 1, 1,
0.6495621, -0.4115173, 3.025734, 1, 1, 1, 1, 1,
0.6511927, -0.8719769, 2.016261, 1, 1, 1, 1, 1,
0.6544111, 0.1903343, 1.731721, 1, 1, 1, 1, 1,
0.6554085, 0.8144703, 0.9022565, 1, 1, 1, 1, 1,
0.6623265, -0.8161139, 2.622653, 1, 1, 1, 1, 1,
0.663964, -1.071874, 2.851597, 1, 1, 1, 1, 1,
0.6640306, -1.475372, 2.386339, 1, 1, 1, 1, 1,
0.6643261, 1.218103, 1.322969, 1, 1, 1, 1, 1,
0.6650337, -0.0989107, 1.305653, 1, 1, 1, 1, 1,
0.6714555, -1.029792, 3.49643, 1, 1, 1, 1, 1,
0.6745793, -1.446297, 2.791619, 1, 1, 1, 1, 1,
0.6746293, -0.07735494, 1.769556, 1, 1, 1, 1, 1,
0.6746457, -0.5271808, 3.557957, 1, 1, 1, 1, 1,
0.6762348, 0.3843813, -0.7577962, 1, 1, 1, 1, 1,
0.6786067, 0.6356199, 1.85249, 0, 0, 1, 1, 1,
0.678738, -0.07791723, 0.8005968, 1, 0, 0, 1, 1,
0.6788166, 0.3668527, -0.2199051, 1, 0, 0, 1, 1,
0.6814764, 0.4127506, -0.2518933, 1, 0, 0, 1, 1,
0.6873666, -1.185805, 3.004463, 1, 0, 0, 1, 1,
0.6891924, -1.155567, 2.652961, 1, 0, 0, 1, 1,
0.6912568, -0.6851671, 3.314626, 0, 0, 0, 1, 1,
0.6926036, -0.9217237, 3.454653, 0, 0, 0, 1, 1,
0.6963051, 0.1434529, 2.191479, 0, 0, 0, 1, 1,
0.6997423, 1.042436, -1.111317, 0, 0, 0, 1, 1,
0.7004894, 2.111738, -1.016065, 0, 0, 0, 1, 1,
0.7010872, 0.006428386, -0.1767395, 0, 0, 0, 1, 1,
0.7021495, -0.7258037, 1.167112, 0, 0, 0, 1, 1,
0.704384, 0.4964263, 0.2503819, 1, 1, 1, 1, 1,
0.7046962, 0.4691475, 1.735746, 1, 1, 1, 1, 1,
0.7073967, 0.667178, 0.454315, 1, 1, 1, 1, 1,
0.7167838, 0.5436623, 1.489015, 1, 1, 1, 1, 1,
0.7168531, -0.3755818, 1.336066, 1, 1, 1, 1, 1,
0.719873, 0.7226835, 0.6691165, 1, 1, 1, 1, 1,
0.7220237, -0.1827531, 3.013574, 1, 1, 1, 1, 1,
0.7241938, -1.062867, 1.874453, 1, 1, 1, 1, 1,
0.7256129, -0.4061768, 0.4507793, 1, 1, 1, 1, 1,
0.7276954, -0.0179258, 1.243463, 1, 1, 1, 1, 1,
0.7277678, -1.650813, 2.086308, 1, 1, 1, 1, 1,
0.7279039, -0.4085729, 3.152174, 1, 1, 1, 1, 1,
0.7298843, 0.596223, 2.236184, 1, 1, 1, 1, 1,
0.7353386, -0.07827422, 0.04048174, 1, 1, 1, 1, 1,
0.7353503, 1.258525, 1.86156, 1, 1, 1, 1, 1,
0.7370874, -0.9156384, 3.737277, 0, 0, 1, 1, 1,
0.7390545, -0.8496659, 2.097019, 1, 0, 0, 1, 1,
0.7502772, -1.184316, 1.977236, 1, 0, 0, 1, 1,
0.7531602, 0.5781351, 2.254691, 1, 0, 0, 1, 1,
0.7543983, -0.6842918, 1.723617, 1, 0, 0, 1, 1,
0.7574656, -1.417805, 2.586684, 1, 0, 0, 1, 1,
0.7635083, 0.4139564, 1.675057, 0, 0, 0, 1, 1,
0.7635856, -0.5096867, 2.338656, 0, 0, 0, 1, 1,
0.7689509, -0.7358695, 0.2338645, 0, 0, 0, 1, 1,
0.7691075, -0.9277565, 2.743967, 0, 0, 0, 1, 1,
0.7705066, 0.4243008, -0.02361772, 0, 0, 0, 1, 1,
0.7718948, 2.180994, -0.9435122, 0, 0, 0, 1, 1,
0.7739494, -1.802761, 3.820682, 0, 0, 0, 1, 1,
0.7808349, 1.616387, 0.4069937, 1, 1, 1, 1, 1,
0.7853414, -0.5278987, 1.438572, 1, 1, 1, 1, 1,
0.788289, 0.4277305, 1.437435, 1, 1, 1, 1, 1,
0.7987065, 0.3573935, 1.680758, 1, 1, 1, 1, 1,
0.8014057, 1.713418, -2.288054, 1, 1, 1, 1, 1,
0.8043596, -0.5907142, 3.344658, 1, 1, 1, 1, 1,
0.8065219, -0.3138597, 2.75946, 1, 1, 1, 1, 1,
0.8068123, -2.301731, 2.978462, 1, 1, 1, 1, 1,
0.8068776, -1.125493, 2.479462, 1, 1, 1, 1, 1,
0.8086638, 0.1071961, 1.794492, 1, 1, 1, 1, 1,
0.809431, 0.6594399, 1.585054, 1, 1, 1, 1, 1,
0.8175592, -0.6835574, 2.515735, 1, 1, 1, 1, 1,
0.820891, 0.5368863, 1.38344, 1, 1, 1, 1, 1,
0.8213301, -0.05601378, 0.9583195, 1, 1, 1, 1, 1,
0.8247342, 0.1195174, 2.913171, 1, 1, 1, 1, 1,
0.825052, -0.5204017, 2.334397, 0, 0, 1, 1, 1,
0.8296431, -1.070117, 1.655139, 1, 0, 0, 1, 1,
0.8307699, -0.3232085, 1.879087, 1, 0, 0, 1, 1,
0.8335351, -0.3210862, 2.6328, 1, 0, 0, 1, 1,
0.8347967, -1.366547, 3.053609, 1, 0, 0, 1, 1,
0.836874, 0.4948183, 0.5368884, 1, 0, 0, 1, 1,
0.8390505, 0.6720837, 2.457343, 0, 0, 0, 1, 1,
0.8427542, 0.1216773, 2.468659, 0, 0, 0, 1, 1,
0.8427706, -0.7054501, 3.352253, 0, 0, 0, 1, 1,
0.8463648, 0.1493211, 2.260892, 0, 0, 0, 1, 1,
0.8487198, 1.190529, 0.742184, 0, 0, 0, 1, 1,
0.850267, 0.01282906, 0.7036816, 0, 0, 0, 1, 1,
0.8542052, -0.02416644, 0.5762023, 0, 0, 0, 1, 1,
0.8697942, -0.3063879, 2.581389, 1, 1, 1, 1, 1,
0.8733775, -0.1938108, 2.503872, 1, 1, 1, 1, 1,
0.8741517, -0.6091432, 2.342129, 1, 1, 1, 1, 1,
0.875571, -1.068338, 2.127641, 1, 1, 1, 1, 1,
0.8790443, 0.7648562, 1.90924, 1, 1, 1, 1, 1,
0.8803461, -0.2236854, 0.9168164, 1, 1, 1, 1, 1,
0.887949, 0.8831949, -0.6960966, 1, 1, 1, 1, 1,
0.8887852, -0.318841, 2.411979, 1, 1, 1, 1, 1,
0.8914855, -0.263613, 2.604429, 1, 1, 1, 1, 1,
0.8974491, 0.2999731, 1.280178, 1, 1, 1, 1, 1,
0.8982058, 0.7893394, 1.841887, 1, 1, 1, 1, 1,
0.9069164, 0.4796052, 1.248104, 1, 1, 1, 1, 1,
0.909084, -0.6244907, 1.362379, 1, 1, 1, 1, 1,
0.9130831, -0.2642279, 2.768338, 1, 1, 1, 1, 1,
0.9203877, 0.7164299, 1.132172, 1, 1, 1, 1, 1,
0.9259264, 0.918576, 2.025442, 0, 0, 1, 1, 1,
0.9282053, 0.6927776, 1.653316, 1, 0, 0, 1, 1,
0.9317678, 0.1566124, 2.068107, 1, 0, 0, 1, 1,
0.9347749, -0.5904686, 2.599174, 1, 0, 0, 1, 1,
0.9351912, -0.5103778, 2.025607, 1, 0, 0, 1, 1,
0.9352829, -0.8911994, 1.923754, 1, 0, 0, 1, 1,
0.9356128, -1.493376, 2.773175, 0, 0, 0, 1, 1,
0.9368826, -0.2840327, 1.814906, 0, 0, 0, 1, 1,
0.9397294, -0.3655076, 0.4333597, 0, 0, 0, 1, 1,
0.9402826, -0.5878354, 3.26942, 0, 0, 0, 1, 1,
0.9416386, 0.18774, 1.942597, 0, 0, 0, 1, 1,
0.9519817, -0.1671989, 1.064223, 0, 0, 0, 1, 1,
0.9524896, -0.9986716, 1.147861, 0, 0, 0, 1, 1,
0.9560329, -0.7301101, 3.579964, 1, 1, 1, 1, 1,
0.9572904, 0.1358139, 3.775575, 1, 1, 1, 1, 1,
0.9602199, 0.06306781, 0.4873358, 1, 1, 1, 1, 1,
0.9743095, -1.786813, 2.548558, 1, 1, 1, 1, 1,
0.9782668, 0.3904109, 2.935609, 1, 1, 1, 1, 1,
0.9828916, -0.643935, 3.879667, 1, 1, 1, 1, 1,
0.9847068, -0.6911017, 0.657509, 1, 1, 1, 1, 1,
0.9979402, 0.02462574, 2.156228, 1, 1, 1, 1, 1,
0.9986379, 0.7177187, 1.462825, 1, 1, 1, 1, 1,
1.028284, -0.9863238, 2.601099, 1, 1, 1, 1, 1,
1.033978, 1.585594, -0.7564588, 1, 1, 1, 1, 1,
1.037422, -1.301447, 1.952785, 1, 1, 1, 1, 1,
1.038697, -1.854745, 4.021443, 1, 1, 1, 1, 1,
1.047015, 0.7857036, 1.368696, 1, 1, 1, 1, 1,
1.051119, -0.3936418, 1.681214, 1, 1, 1, 1, 1,
1.05581, 0.01495003, 1.055236, 0, 0, 1, 1, 1,
1.055913, -0.1939075, 2.597767, 1, 0, 0, 1, 1,
1.05605, -0.8154988, 4.063939, 1, 0, 0, 1, 1,
1.071753, 0.7823803, 0.2295157, 1, 0, 0, 1, 1,
1.077351, -0.6656151, 1.51744, 1, 0, 0, 1, 1,
1.080038, -0.4511852, 4.412407, 1, 0, 0, 1, 1,
1.082814, 0.5702552, 1.337976, 0, 0, 0, 1, 1,
1.088884, 0.7213605, 0.3234164, 0, 0, 0, 1, 1,
1.088923, -0.7594518, 1.37811, 0, 0, 0, 1, 1,
1.090114, -0.8607543, 1.939823, 0, 0, 0, 1, 1,
1.09264, -0.2331222, 2.557468, 0, 0, 0, 1, 1,
1.095811, -0.1482692, 1.954372, 0, 0, 0, 1, 1,
1.1014, -0.802616, 1.767492, 0, 0, 0, 1, 1,
1.114469, -0.5306283, 1.147563, 1, 1, 1, 1, 1,
1.115045, -0.7589456, 0.2065787, 1, 1, 1, 1, 1,
1.123579, 1.008831, 0.6129757, 1, 1, 1, 1, 1,
1.124342, -0.6411961, 1.61349, 1, 1, 1, 1, 1,
1.133574, -1.818296, 1.853786, 1, 1, 1, 1, 1,
1.140548, 1.505352, -0.07547053, 1, 1, 1, 1, 1,
1.155638, -0.842743, 3.356833, 1, 1, 1, 1, 1,
1.162211, -0.4016574, 0.6974426, 1, 1, 1, 1, 1,
1.162412, -0.5011624, 1.898928, 1, 1, 1, 1, 1,
1.1646, -0.8407826, 4.075237, 1, 1, 1, 1, 1,
1.166613, -0.1692189, 1.803399, 1, 1, 1, 1, 1,
1.169006, -0.9905301, 3.084509, 1, 1, 1, 1, 1,
1.17188, -0.7506083, 2.760658, 1, 1, 1, 1, 1,
1.175256, 1.159328, -0.2065419, 1, 1, 1, 1, 1,
1.19656, 0.9153347, 0.7677091, 1, 1, 1, 1, 1,
1.202039, 0.4344262, 0.9741842, 0, 0, 1, 1, 1,
1.203549, 0.310214, 1.012616, 1, 0, 0, 1, 1,
1.211674, -0.8770953, 3.869859, 1, 0, 0, 1, 1,
1.232264, -0.5068225, 0.9755334, 1, 0, 0, 1, 1,
1.234087, -0.07975973, 2.876623, 1, 0, 0, 1, 1,
1.246958, 0.3225343, 1.916004, 1, 0, 0, 1, 1,
1.248735, -0.4110589, 1.854154, 0, 0, 0, 1, 1,
1.254808, -1.522494, 2.331905, 0, 0, 0, 1, 1,
1.255519, 1.01608, 2.256211, 0, 0, 0, 1, 1,
1.256124, -0.1747849, 2.153208, 0, 0, 0, 1, 1,
1.256828, 0.3176016, 0.6534414, 0, 0, 0, 1, 1,
1.25823, -0.3501541, 1.606215, 0, 0, 0, 1, 1,
1.258667, -0.04875876, 2.260329, 0, 0, 0, 1, 1,
1.259031, -0.1027697, 2.92259, 1, 1, 1, 1, 1,
1.26014, 1.406536, -1.14901, 1, 1, 1, 1, 1,
1.263568, -0.4574597, 2.279769, 1, 1, 1, 1, 1,
1.265566, -0.1200684, 2.778205, 1, 1, 1, 1, 1,
1.269501, -0.3023561, 2.026549, 1, 1, 1, 1, 1,
1.273277, 0.6994263, 1.541483, 1, 1, 1, 1, 1,
1.27968, -0.0422002, 1.841802, 1, 1, 1, 1, 1,
1.28917, -1.379773, 1.721527, 1, 1, 1, 1, 1,
1.291134, 0.6507065, 1.510772, 1, 1, 1, 1, 1,
1.294392, -0.3367609, 2.679703, 1, 1, 1, 1, 1,
1.298091, -0.2554765, 1.045753, 1, 1, 1, 1, 1,
1.299325, -0.2335587, 2.898778, 1, 1, 1, 1, 1,
1.311753, -0.2048802, 2.86509, 1, 1, 1, 1, 1,
1.332102, 1.643942, 0.3435202, 1, 1, 1, 1, 1,
1.338865, 0.4778735, 0.4499899, 1, 1, 1, 1, 1,
1.346433, 0.1458579, -1.071613, 0, 0, 1, 1, 1,
1.346806, 0.2637393, 3.035089, 1, 0, 0, 1, 1,
1.348513, -0.5386429, 2.54681, 1, 0, 0, 1, 1,
1.353301, 0.1782568, 0.03491435, 1, 0, 0, 1, 1,
1.361547, 0.8788164, 1.780422, 1, 0, 0, 1, 1,
1.367175, -0.1651205, 3.666927, 1, 0, 0, 1, 1,
1.373275, 0.1032238, 0.9341918, 0, 0, 0, 1, 1,
1.377316, 1.235322, 0.1315817, 0, 0, 0, 1, 1,
1.381755, 0.1856266, 1.49505, 0, 0, 0, 1, 1,
1.382792, 0.2132656, 0.9045161, 0, 0, 0, 1, 1,
1.38743, -0.08144183, 0.9968184, 0, 0, 0, 1, 1,
1.404292, 1.489614, 1.20059, 0, 0, 0, 1, 1,
1.41994, 0.4850911, 0.05432677, 0, 0, 0, 1, 1,
1.420219, -0.07359783, 3.984526, 1, 1, 1, 1, 1,
1.423882, 0.6635426, 2.371176, 1, 1, 1, 1, 1,
1.428102, 0.5344882, 2.941615, 1, 1, 1, 1, 1,
1.447351, -1.09173, 2.888186, 1, 1, 1, 1, 1,
1.453447, 0.603587, 1.480653, 1, 1, 1, 1, 1,
1.470205, 0.9531125, 2.501811, 1, 1, 1, 1, 1,
1.471838, 0.4481876, 0.8681899, 1, 1, 1, 1, 1,
1.475551, 2.072246, -0.4678634, 1, 1, 1, 1, 1,
1.483645, 0.6037856, 3.174797, 1, 1, 1, 1, 1,
1.48923, 1.8954, 0.6785861, 1, 1, 1, 1, 1,
1.491207, -0.1020522, 1.287418, 1, 1, 1, 1, 1,
1.494656, 1.16894, 2.003983, 1, 1, 1, 1, 1,
1.503117, -0.1712044, 2.423052, 1, 1, 1, 1, 1,
1.516587, -0.02441292, 1.132869, 1, 1, 1, 1, 1,
1.517165, 1.697656, 1.80827, 1, 1, 1, 1, 1,
1.5265, 0.1765321, 1.108094, 0, 0, 1, 1, 1,
1.528941, -0.3822754, 2.326766, 1, 0, 0, 1, 1,
1.53015, 1.900651, 1.649574, 1, 0, 0, 1, 1,
1.534688, 1.237212, 2.457867, 1, 0, 0, 1, 1,
1.537192, 0.8479734, 2.314181, 1, 0, 0, 1, 1,
1.53943, -0.7785821, 2.31262, 1, 0, 0, 1, 1,
1.544064, 0.1191768, 3.518223, 0, 0, 0, 1, 1,
1.545256, 0.409596, 1.085117, 0, 0, 0, 1, 1,
1.546604, -0.6835001, 3.023063, 0, 0, 0, 1, 1,
1.555484, -0.6556703, 2.035602, 0, 0, 0, 1, 1,
1.562001, -0.01989, 1.911472, 0, 0, 0, 1, 1,
1.580309, -1.223734, 3.111159, 0, 0, 0, 1, 1,
1.586211, 0.5651312, 0.6350524, 0, 0, 0, 1, 1,
1.593576, -2.042102, 2.79652, 1, 1, 1, 1, 1,
1.624436, -0.2104543, 1.684886, 1, 1, 1, 1, 1,
1.630038, -2.663093, 1.504382, 1, 1, 1, 1, 1,
1.634417, 0.5073752, 2.008894, 1, 1, 1, 1, 1,
1.635946, -0.4004783, 1.025302, 1, 1, 1, 1, 1,
1.636117, 1.054446, 1.573557, 1, 1, 1, 1, 1,
1.638504, 0.2236269, 1.039505, 1, 1, 1, 1, 1,
1.641616, -1.330206, 2.480607, 1, 1, 1, 1, 1,
1.70381, -1.252386, 1.717495, 1, 1, 1, 1, 1,
1.727344, -1.034821, 4.28115, 1, 1, 1, 1, 1,
1.738931, 1.202343, 3.34976, 1, 1, 1, 1, 1,
1.755152, -0.1514973, 0.7494656, 1, 1, 1, 1, 1,
1.75622, 0.3649631, 1.489883, 1, 1, 1, 1, 1,
1.761068, 0.8421407, 2.000398, 1, 1, 1, 1, 1,
1.775607, -0.9679444, 2.32204, 1, 1, 1, 1, 1,
1.80013, -0.8564546, 1.777766, 0, 0, 1, 1, 1,
1.807926, 2.047624, 0.918838, 1, 0, 0, 1, 1,
1.819883, -0.01500064, 2.165323, 1, 0, 0, 1, 1,
1.820244, -0.6312202, 0.7289401, 1, 0, 0, 1, 1,
1.827793, -0.2114673, 1.176959, 1, 0, 0, 1, 1,
1.828724, 0.1295309, 0.7095469, 1, 0, 0, 1, 1,
1.834277, 0.1218676, 1.783234, 0, 0, 0, 1, 1,
1.841031, 0.5616993, 1.585924, 0, 0, 0, 1, 1,
1.860683, 0.3161211, 2.884803, 0, 0, 0, 1, 1,
1.865189, -0.03572087, 1.590749, 0, 0, 0, 1, 1,
1.875201, 0.2537504, -0.08796799, 0, 0, 0, 1, 1,
1.887813, -1.148134, 2.608974, 0, 0, 0, 1, 1,
1.917964, -0.1276801, 2.740515, 0, 0, 0, 1, 1,
1.987593, -0.04247468, 2.12747, 1, 1, 1, 1, 1,
2.017631, 0.8067478, 1.163752, 1, 1, 1, 1, 1,
2.019796, 0.3553834, 1.826824, 1, 1, 1, 1, 1,
2.051648, -0.2919021, 2.262217, 1, 1, 1, 1, 1,
2.066506, 0.7243356, 2.579675, 1, 1, 1, 1, 1,
2.071295, -0.8739125, 1.216079, 1, 1, 1, 1, 1,
2.091358, -0.02925034, 1.588516, 1, 1, 1, 1, 1,
2.109179, -0.1492335, 0.3544272, 1, 1, 1, 1, 1,
2.112056, -1.398973, 3.382575, 1, 1, 1, 1, 1,
2.114797, 1.250631, 0.8638524, 1, 1, 1, 1, 1,
2.132423, 0.01787941, 3.015791, 1, 1, 1, 1, 1,
2.140773, -1.019463, 1.644454, 1, 1, 1, 1, 1,
2.150334, -0.3436157, 2.290217, 1, 1, 1, 1, 1,
2.152611, -0.7296039, 2.063163, 1, 1, 1, 1, 1,
2.155694, -0.06704921, 2.758514, 1, 1, 1, 1, 1,
2.158869, 0.928518, 1.051065, 0, 0, 1, 1, 1,
2.16544, 1.051333, 0.4157823, 1, 0, 0, 1, 1,
2.173742, -1.349327, 4.205142, 1, 0, 0, 1, 1,
2.185191, 0.9652348, 1.38517, 1, 0, 0, 1, 1,
2.251426, 0.6690975, 1.870305, 1, 0, 0, 1, 1,
2.259408, -1.483895, 3.548256, 1, 0, 0, 1, 1,
2.298258, 0.03853498, 0.3289208, 0, 0, 0, 1, 1,
2.327476, -1.461595, 3.441826, 0, 0, 0, 1, 1,
2.375312, 0.3410996, -0.6018651, 0, 0, 0, 1, 1,
2.381118, 0.1686747, 1.800071, 0, 0, 0, 1, 1,
2.383182, 1.729112, 1.51424, 0, 0, 0, 1, 1,
2.450018, 0.3110791, 0.3494739, 0, 0, 0, 1, 1,
2.566323, 1.902084, 2.985227, 0, 0, 0, 1, 1,
2.581591, 1.54237, -0.2733556, 1, 1, 1, 1, 1,
2.618656, -0.1111987, 2.698802, 1, 1, 1, 1, 1,
2.646059, 1.225459, 0.7186254, 1, 1, 1, 1, 1,
2.759181, -0.5785229, 2.285183, 1, 1, 1, 1, 1,
2.939977, -0.529927, 0.7836352, 1, 1, 1, 1, 1,
3.321457, 0.9368422, 2.398908, 1, 1, 1, 1, 1,
3.484335, 0.03928787, -0.5856063, 1, 1, 1, 1, 1
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
var radius = 9.496805;
var distance = 33.35712;
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
mvMatrix.translate( 0.1179271, 0.1835628, -0.1603818 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.35712);
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