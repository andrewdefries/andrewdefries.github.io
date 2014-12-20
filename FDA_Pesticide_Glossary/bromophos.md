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
-3.13317, -0.8358406, -0.5856948, 1, 0, 0, 1,
-2.988545, 1.089326, -0.1534331, 1, 0.007843138, 0, 1,
-2.981017, 0.5256405, 0.2075862, 1, 0.01176471, 0, 1,
-2.93211, -0.06457532, -0.9553782, 1, 0.01960784, 0, 1,
-2.748199, 1.744071, -1.595197, 1, 0.02352941, 0, 1,
-2.724611, -1.144528, -3.129707, 1, 0.03137255, 0, 1,
-2.64059, -0.4916593, -2.964123, 1, 0.03529412, 0, 1,
-2.485397, 0.9783337, -3.629539, 1, 0.04313726, 0, 1,
-2.47146, -1.650556, -2.278893, 1, 0.04705882, 0, 1,
-2.455456, 0.6798812, -0.5792542, 1, 0.05490196, 0, 1,
-2.423554, 0.9093097, -0.3331626, 1, 0.05882353, 0, 1,
-2.42186, 1.849272, -2.705428, 1, 0.06666667, 0, 1,
-2.279953, -0.5544237, -2.622911, 1, 0.07058824, 0, 1,
-2.246827, 1.714434, -1.431726, 1, 0.07843138, 0, 1,
-2.23145, -0.8325965, 0.246876, 1, 0.08235294, 0, 1,
-2.209362, 0.06520119, -1.273666, 1, 0.09019608, 0, 1,
-2.187517, -0.6527843, -1.241916, 1, 0.09411765, 0, 1,
-2.173587, -0.6789657, -2.227423, 1, 0.1019608, 0, 1,
-2.156113, -1.361374, -1.199179, 1, 0.1098039, 0, 1,
-2.131294, 0.9786596, -1.770968, 1, 0.1137255, 0, 1,
-2.130932, -0.1861926, -0.8764467, 1, 0.1215686, 0, 1,
-2.091563, 1.360436, -0.4603232, 1, 0.1254902, 0, 1,
-2.088542, -0.9100462, -1.27623, 1, 0.1333333, 0, 1,
-2.07946, 0.2392544, -1.589098, 1, 0.1372549, 0, 1,
-2.079402, 0.791594, 0.2204743, 1, 0.145098, 0, 1,
-2.065212, -0.4199568, -2.317006, 1, 0.1490196, 0, 1,
-2.0638, 0.4110801, -1.85625, 1, 0.1568628, 0, 1,
-2.037248, -0.8196967, -2.541567, 1, 0.1607843, 0, 1,
-2.02477, -1.266308, -0.7687111, 1, 0.1686275, 0, 1,
-2.011682, 1.165651, -0.601396, 1, 0.172549, 0, 1,
-1.997329, 0.2897598, -2.428466, 1, 0.1803922, 0, 1,
-1.990786, 1.516228, -1.463925, 1, 0.1843137, 0, 1,
-1.957969, -0.470566, -2.952487, 1, 0.1921569, 0, 1,
-1.957825, -1.431714, -4.066627, 1, 0.1960784, 0, 1,
-1.956663, -0.4777672, -1.596489, 1, 0.2039216, 0, 1,
-1.904209, 1.385881, -0.6379832, 1, 0.2117647, 0, 1,
-1.893397, 0.9969387, -1.109749, 1, 0.2156863, 0, 1,
-1.867615, 0.02461276, -1.123579, 1, 0.2235294, 0, 1,
-1.857855, -0.923139, -2.638346, 1, 0.227451, 0, 1,
-1.804675, -0.7136291, -2.772353, 1, 0.2352941, 0, 1,
-1.794168, 2.430878, -1.292588, 1, 0.2392157, 0, 1,
-1.773388, 1.64914, -1.338115, 1, 0.2470588, 0, 1,
-1.756091, 1.552937, 1.186465, 1, 0.2509804, 0, 1,
-1.735046, 0.8493304, -0.758766, 1, 0.2588235, 0, 1,
-1.734038, 1.046869, 0.67466, 1, 0.2627451, 0, 1,
-1.722346, 1.07595, -0.2926804, 1, 0.2705882, 0, 1,
-1.712216, -1.391567, -3.044334, 1, 0.2745098, 0, 1,
-1.701046, 0.7627929, 1.241656, 1, 0.282353, 0, 1,
-1.68935, 1.730618, -1.552657, 1, 0.2862745, 0, 1,
-1.677575, 0.3997651, -1.109442, 1, 0.2941177, 0, 1,
-1.675059, -0.8707405, -2.019589, 1, 0.3019608, 0, 1,
-1.63666, 0.1269165, -1.642424, 1, 0.3058824, 0, 1,
-1.60981, -0.803821, -2.234389, 1, 0.3137255, 0, 1,
-1.609357, 1.308833, -0.3358794, 1, 0.3176471, 0, 1,
-1.604784, -0.200597, -1.780994, 1, 0.3254902, 0, 1,
-1.599941, 0.4451524, -0.4201781, 1, 0.3294118, 0, 1,
-1.596843, 1.387431, -1.624066, 1, 0.3372549, 0, 1,
-1.59071, -1.280239, -0.671602, 1, 0.3411765, 0, 1,
-1.584329, -2.627858, -2.585724, 1, 0.3490196, 0, 1,
-1.582577, 1.324354, -1.687118, 1, 0.3529412, 0, 1,
-1.57769, -1.32595, -2.136857, 1, 0.3607843, 0, 1,
-1.577593, 0.5814244, -0.7424263, 1, 0.3647059, 0, 1,
-1.565343, -0.03350216, -2.689342, 1, 0.372549, 0, 1,
-1.56038, -1.201092, -2.166407, 1, 0.3764706, 0, 1,
-1.556698, 0.4810708, -2.110698, 1, 0.3843137, 0, 1,
-1.551842, 0.2457779, 0.3602586, 1, 0.3882353, 0, 1,
-1.543407, -0.02016208, -1.302223, 1, 0.3960784, 0, 1,
-1.542539, 0.9642313, -0.9013484, 1, 0.4039216, 0, 1,
-1.53687, 0.8860407, -1.40375, 1, 0.4078431, 0, 1,
-1.521117, -2.290725, -2.772235, 1, 0.4156863, 0, 1,
-1.515112, 1.85199, -0.128626, 1, 0.4196078, 0, 1,
-1.511737, -1.075561, -1.766081, 1, 0.427451, 0, 1,
-1.503601, -1.140992, -3.783397, 1, 0.4313726, 0, 1,
-1.488784, 0.6200757, 0.1117863, 1, 0.4392157, 0, 1,
-1.488622, -0.3113036, -0.528357, 1, 0.4431373, 0, 1,
-1.481216, 2.114913, -1.979573, 1, 0.4509804, 0, 1,
-1.463643, -0.8954219, -4.275929, 1, 0.454902, 0, 1,
-1.456383, 0.7172252, -0.8479895, 1, 0.4627451, 0, 1,
-1.452341, -2.012649, -2.200286, 1, 0.4666667, 0, 1,
-1.44773, 0.6454526, -0.798393, 1, 0.4745098, 0, 1,
-1.441112, 1.127535, -0.5393431, 1, 0.4784314, 0, 1,
-1.411932, 0.2128894, -0.8910011, 1, 0.4862745, 0, 1,
-1.409322, -0.06695989, -1.793959, 1, 0.4901961, 0, 1,
-1.394502, 1.347639, -1.241071, 1, 0.4980392, 0, 1,
-1.386762, 0.4352672, -1.056549, 1, 0.5058824, 0, 1,
-1.386111, 1.699615, -0.1084994, 1, 0.509804, 0, 1,
-1.384169, -0.1144219, -2.081671, 1, 0.5176471, 0, 1,
-1.378614, -0.6340567, -2.564831, 1, 0.5215687, 0, 1,
-1.37545, 0.295251, -2.027173, 1, 0.5294118, 0, 1,
-1.370105, 0.1202167, -1.033423, 1, 0.5333334, 0, 1,
-1.329787, -0.4655546, -1.052612, 1, 0.5411765, 0, 1,
-1.329248, 0.9312133, -2.46809, 1, 0.5450981, 0, 1,
-1.328737, 0.4000738, -1.446696, 1, 0.5529412, 0, 1,
-1.324528, -1.376311, -2.226605, 1, 0.5568628, 0, 1,
-1.319131, 1.816224, -0.6962693, 1, 0.5647059, 0, 1,
-1.316378, -0.8204309, -1.036634, 1, 0.5686275, 0, 1,
-1.309264, 0.2270231, 0.05745254, 1, 0.5764706, 0, 1,
-1.300474, -1.604399, -3.973689, 1, 0.5803922, 0, 1,
-1.300216, -1.356738, -1.669711, 1, 0.5882353, 0, 1,
-1.295674, -0.5543258, -3.49437, 1, 0.5921569, 0, 1,
-1.290036, -1.831973, -1.517615, 1, 0.6, 0, 1,
-1.285594, -1.071061, -2.411016, 1, 0.6078432, 0, 1,
-1.281724, 0.3804173, 0.6189508, 1, 0.6117647, 0, 1,
-1.279244, -2.627127, -1.598998, 1, 0.6196079, 0, 1,
-1.276051, 1.176818, 0.2173945, 1, 0.6235294, 0, 1,
-1.262469, 1.027068, -0.4025451, 1, 0.6313726, 0, 1,
-1.256409, -0.1678164, -0.8172543, 1, 0.6352941, 0, 1,
-1.255109, 0.9351622, -2.749518, 1, 0.6431373, 0, 1,
-1.239718, 1.328646, -2.287895, 1, 0.6470588, 0, 1,
-1.237859, 0.2786635, -2.230552, 1, 0.654902, 0, 1,
-1.223943, 0.7427461, -0.02234222, 1, 0.6588235, 0, 1,
-1.223587, 0.2457755, -1.09701, 1, 0.6666667, 0, 1,
-1.210262, 0.01245477, -2.261421, 1, 0.6705883, 0, 1,
-1.210107, -1.001619, -1.178068, 1, 0.6784314, 0, 1,
-1.198107, -1.123037, -2.095924, 1, 0.682353, 0, 1,
-1.197864, -0.4513897, -2.604525, 1, 0.6901961, 0, 1,
-1.195675, -0.6679243, -0.6328743, 1, 0.6941177, 0, 1,
-1.194553, 1.609966, -2.214872, 1, 0.7019608, 0, 1,
-1.188416, 0.9218093, -1.051694, 1, 0.7098039, 0, 1,
-1.186621, 2.22365, -1.243988, 1, 0.7137255, 0, 1,
-1.174189, -0.4384988, -2.34375, 1, 0.7215686, 0, 1,
-1.172381, 0.862059, -1.429654, 1, 0.7254902, 0, 1,
-1.168119, -1.217097, -2.784333, 1, 0.7333333, 0, 1,
-1.16804, -0.7569061, -3.308883, 1, 0.7372549, 0, 1,
-1.166227, 1.605427, -0.4248348, 1, 0.7450981, 0, 1,
-1.163017, -0.1670309, -2.842735, 1, 0.7490196, 0, 1,
-1.134839, -0.9737638, -3.285796, 1, 0.7568628, 0, 1,
-1.124836, -0.7628362, -1.638725, 1, 0.7607843, 0, 1,
-1.121517, 0.437229, 0.5344653, 1, 0.7686275, 0, 1,
-1.114331, -0.728187, -0.410717, 1, 0.772549, 0, 1,
-1.114201, -1.97269, -3.283694, 1, 0.7803922, 0, 1,
-1.112084, -0.5154185, -1.245526, 1, 0.7843137, 0, 1,
-1.10882, -0.831119, -3.058847, 1, 0.7921569, 0, 1,
-1.107338, 0.7530696, -3.559751, 1, 0.7960784, 0, 1,
-1.102615, 0.2215481, -0.2171571, 1, 0.8039216, 0, 1,
-1.095864, -0.5243757, -0.6598088, 1, 0.8117647, 0, 1,
-1.090958, 0.6185616, 0.2275635, 1, 0.8156863, 0, 1,
-1.08428, -0.2213311, -1.970907, 1, 0.8235294, 0, 1,
-1.083047, -0.1840064, -2.86195, 1, 0.827451, 0, 1,
-1.081013, -0.6338688, -1.034364, 1, 0.8352941, 0, 1,
-1.073124, -0.4160214, -2.032328, 1, 0.8392157, 0, 1,
-1.070964, -0.2953984, -1.634339, 1, 0.8470588, 0, 1,
-1.067788, -1.45421, -1.653031, 1, 0.8509804, 0, 1,
-1.062054, -0.04024529, -0.8366034, 1, 0.8588235, 0, 1,
-1.058415, -0.5931143, -1.437465, 1, 0.8627451, 0, 1,
-1.057804, -1.900225, -3.58978, 1, 0.8705882, 0, 1,
-1.047217, 0.540813, 0.8765646, 1, 0.8745098, 0, 1,
-1.037891, 0.6376491, -0.1062284, 1, 0.8823529, 0, 1,
-1.033891, 0.1947711, -0.6179618, 1, 0.8862745, 0, 1,
-1.033723, -0.76946, -3.764857, 1, 0.8941177, 0, 1,
-1.031326, -0.1808183, -1.581147, 1, 0.8980392, 0, 1,
-1.029243, 0.2135247, -3.825437, 1, 0.9058824, 0, 1,
-1.028517, 0.6628157, -1.513577, 1, 0.9137255, 0, 1,
-1.028429, 0.2739276, -2.087879, 1, 0.9176471, 0, 1,
-1.024647, -0.09876788, -2.060535, 1, 0.9254902, 0, 1,
-1.021566, 0.9813946, -1.666523, 1, 0.9294118, 0, 1,
-1.00979, 0.0184719, -2.326817, 1, 0.9372549, 0, 1,
-1.009587, -0.03443023, -2.335474, 1, 0.9411765, 0, 1,
-1.006754, -0.06937575, -2.184829, 1, 0.9490196, 0, 1,
-0.997866, 0.2702172, -1.974947, 1, 0.9529412, 0, 1,
-0.9863246, -0.3239707, -2.665742, 1, 0.9607843, 0, 1,
-0.9783083, -1.036816, -2.65775, 1, 0.9647059, 0, 1,
-0.9746431, -1.135994, -0.8504775, 1, 0.972549, 0, 1,
-0.9718745, -0.3866124, -1.227073, 1, 0.9764706, 0, 1,
-0.969721, -0.1495878, -1.9241, 1, 0.9843137, 0, 1,
-0.9481452, -0.7701857, -2.849939, 1, 0.9882353, 0, 1,
-0.9437401, -1.321749, -1.618373, 1, 0.9960784, 0, 1,
-0.940836, 0.9165299, -0.9578639, 0.9960784, 1, 0, 1,
-0.9350002, -0.9867786, -1.082471, 0.9921569, 1, 0, 1,
-0.9323763, 0.3638301, -1.507125, 0.9843137, 1, 0, 1,
-0.9322577, 0.4656447, -1.882027, 0.9803922, 1, 0, 1,
-0.9278519, -0.8683832, -2.425542, 0.972549, 1, 0, 1,
-0.9237068, 0.04877776, -0.470874, 0.9686275, 1, 0, 1,
-0.9219544, -0.6195425, -1.874042, 0.9607843, 1, 0, 1,
-0.9190179, 0.02609763, -1.57275, 0.9568627, 1, 0, 1,
-0.9185412, -0.4563091, -3.094485, 0.9490196, 1, 0, 1,
-0.9158411, -1.336781, -1.000719, 0.945098, 1, 0, 1,
-0.9139643, 1.736383, -0.1028851, 0.9372549, 1, 0, 1,
-0.9096961, -1.384356, -2.634944, 0.9333333, 1, 0, 1,
-0.9090108, 0.002268938, -1.154759, 0.9254902, 1, 0, 1,
-0.8940636, 0.3611545, 0.3053927, 0.9215686, 1, 0, 1,
-0.8895445, 1.894994, -0.1727663, 0.9137255, 1, 0, 1,
-0.884903, 1.092978, -1.43679, 0.9098039, 1, 0, 1,
-0.8847199, -0.02016071, -0.7940246, 0.9019608, 1, 0, 1,
-0.8838362, 0.3820567, -2.122089, 0.8941177, 1, 0, 1,
-0.8832187, -0.1337964, -2.959707, 0.8901961, 1, 0, 1,
-0.882409, -0.545751, -2.905927, 0.8823529, 1, 0, 1,
-0.8781698, -0.4566356, -2.103062, 0.8784314, 1, 0, 1,
-0.8770931, 1.568627, -0.3785264, 0.8705882, 1, 0, 1,
-0.8770174, 0.7889992, -2.374296, 0.8666667, 1, 0, 1,
-0.868851, -0.3386475, -2.081225, 0.8588235, 1, 0, 1,
-0.860936, 2.255557, -1.018226, 0.854902, 1, 0, 1,
-0.8565841, 0.301754, -1.483852, 0.8470588, 1, 0, 1,
-0.8535187, 0.9772475, 0.751533, 0.8431373, 1, 0, 1,
-0.8519604, -0.5526168, 0.6131009, 0.8352941, 1, 0, 1,
-0.8498625, 0.6417444, -0.696696, 0.8313726, 1, 0, 1,
-0.8493445, -1.10726, 0.1158692, 0.8235294, 1, 0, 1,
-0.8492193, 1.586308, -0.9867123, 0.8196079, 1, 0, 1,
-0.8475807, -1.146344, -1.75503, 0.8117647, 1, 0, 1,
-0.8424055, -0.9792965, -1.645746, 0.8078431, 1, 0, 1,
-0.8419487, 0.9247136, 0.7973602, 0.8, 1, 0, 1,
-0.8389981, 1.011657, 0.4728021, 0.7921569, 1, 0, 1,
-0.833773, 1.24425, -0.8788064, 0.7882353, 1, 0, 1,
-0.8245432, 0.6288024, -1.522779, 0.7803922, 1, 0, 1,
-0.8222338, -0.6828256, -2.007072, 0.7764706, 1, 0, 1,
-0.8074971, 0.4219368, -0.6397212, 0.7686275, 1, 0, 1,
-0.8029572, -1.114838, -2.142931, 0.7647059, 1, 0, 1,
-0.8021498, -1.751001, -2.935039, 0.7568628, 1, 0, 1,
-0.7998639, -0.553259, -1.846007, 0.7529412, 1, 0, 1,
-0.797821, 2.249927, -0.02947433, 0.7450981, 1, 0, 1,
-0.7917801, 0.4931382, -0.5238547, 0.7411765, 1, 0, 1,
-0.7773584, -0.8949075, -1.666259, 0.7333333, 1, 0, 1,
-0.7756933, 0.1425388, -2.20933, 0.7294118, 1, 0, 1,
-0.7751084, -0.04373179, -1.000738, 0.7215686, 1, 0, 1,
-0.7743757, 0.8966563, 0.2433544, 0.7176471, 1, 0, 1,
-0.7703893, 0.6514096, -1.718078, 0.7098039, 1, 0, 1,
-0.7694224, 0.4708183, 0.3476556, 0.7058824, 1, 0, 1,
-0.7683679, -1.425752, -4.164646, 0.6980392, 1, 0, 1,
-0.7652534, 0.3157929, -1.363609, 0.6901961, 1, 0, 1,
-0.7582472, -0.4541084, -2.673378, 0.6862745, 1, 0, 1,
-0.7569581, 0.04085982, -0.192467, 0.6784314, 1, 0, 1,
-0.7495556, -0.4017873, -3.491896, 0.6745098, 1, 0, 1,
-0.7463326, 0.5062335, -0.7819409, 0.6666667, 1, 0, 1,
-0.7395946, 0.7353176, -2.049099, 0.6627451, 1, 0, 1,
-0.7371287, 0.5887628, 0.04440317, 0.654902, 1, 0, 1,
-0.7359731, 1.296299, -1.026921, 0.6509804, 1, 0, 1,
-0.7308662, 1.191031, -0.4877437, 0.6431373, 1, 0, 1,
-0.7282553, 0.2329398, -1.235462, 0.6392157, 1, 0, 1,
-0.7211308, 0.2205379, -1.039084, 0.6313726, 1, 0, 1,
-0.719717, -1.683064, -2.141171, 0.627451, 1, 0, 1,
-0.7150916, -0.7308615, -0.127287, 0.6196079, 1, 0, 1,
-0.7127945, 2.208126, 0.2096539, 0.6156863, 1, 0, 1,
-0.712006, -1.06372, -3.274103, 0.6078432, 1, 0, 1,
-0.7112253, 1.282458, 1.094466, 0.6039216, 1, 0, 1,
-0.7101631, 1.932353, -1.58804, 0.5960785, 1, 0, 1,
-0.7030593, 0.1171497, -1.289047, 0.5882353, 1, 0, 1,
-0.6976344, 2.354886, -0.3148155, 0.5843138, 1, 0, 1,
-0.6966953, -1.574184, -2.161093, 0.5764706, 1, 0, 1,
-0.6962197, -0.5342304, -4.322962, 0.572549, 1, 0, 1,
-0.6941074, -0.2695151, -2.539275, 0.5647059, 1, 0, 1,
-0.6891256, 0.2219932, -1.099409, 0.5607843, 1, 0, 1,
-0.6868733, 0.9325115, -1.707085, 0.5529412, 1, 0, 1,
-0.6853686, -0.7930881, -1.510904, 0.5490196, 1, 0, 1,
-0.6818749, -0.1798901, -0.7967351, 0.5411765, 1, 0, 1,
-0.6801794, 1.530177, -3.119899, 0.5372549, 1, 0, 1,
-0.6794932, -0.2053728, -3.314125, 0.5294118, 1, 0, 1,
-0.6705583, 0.372072, -2.00389, 0.5254902, 1, 0, 1,
-0.6683415, 1.514051, -0.5801908, 0.5176471, 1, 0, 1,
-0.6653233, -1.002757, -2.825289, 0.5137255, 1, 0, 1,
-0.6611246, 0.6971487, -0.09140422, 0.5058824, 1, 0, 1,
-0.650533, -0.3761697, -0.7879074, 0.5019608, 1, 0, 1,
-0.6500583, -1.047929, -1.109343, 0.4941176, 1, 0, 1,
-0.6498049, -0.7126046, -2.781489, 0.4862745, 1, 0, 1,
-0.6482325, 1.26158, 1.748014, 0.4823529, 1, 0, 1,
-0.6409978, -0.5231056, -3.398993, 0.4745098, 1, 0, 1,
-0.6402465, 1.544531, -0.8112086, 0.4705882, 1, 0, 1,
-0.6400166, 1.261221, 0.7311361, 0.4627451, 1, 0, 1,
-0.6368647, -0.8679778, -3.285833, 0.4588235, 1, 0, 1,
-0.6265415, -0.4459926, -2.008444, 0.4509804, 1, 0, 1,
-0.6241454, -0.8038234, -0.3820427, 0.4470588, 1, 0, 1,
-0.6230295, -1.539462, -2.119646, 0.4392157, 1, 0, 1,
-0.6187893, -1.076231, -3.34081, 0.4352941, 1, 0, 1,
-0.6165344, -0.005326457, -2.451178, 0.427451, 1, 0, 1,
-0.6150847, 2.176622, -0.2039886, 0.4235294, 1, 0, 1,
-0.6124221, 0.7299451, -3.961947, 0.4156863, 1, 0, 1,
-0.6116067, 2.436853, -0.9705163, 0.4117647, 1, 0, 1,
-0.6110854, 1.056977, 0.2482307, 0.4039216, 1, 0, 1,
-0.6109461, 0.1480801, -0.961192, 0.3960784, 1, 0, 1,
-0.5993115, 2.132499, 1.173123, 0.3921569, 1, 0, 1,
-0.5861174, -1.269437, -1.778976, 0.3843137, 1, 0, 1,
-0.5856978, -1.256797, -2.172414, 0.3803922, 1, 0, 1,
-0.5800369, 0.5730728, -2.368763, 0.372549, 1, 0, 1,
-0.5787663, 0.08495502, -1.863117, 0.3686275, 1, 0, 1,
-0.5766722, 0.883637, -0.7072881, 0.3607843, 1, 0, 1,
-0.5752673, 0.2322851, -1.501794, 0.3568628, 1, 0, 1,
-0.5740938, 0.4689549, -0.9713258, 0.3490196, 1, 0, 1,
-0.5727674, 1.004877, -1.183833, 0.345098, 1, 0, 1,
-0.5655449, 0.1233455, -1.213227, 0.3372549, 1, 0, 1,
-0.5654415, 0.1294822, 0.8176882, 0.3333333, 1, 0, 1,
-0.5639882, -0.781007, -3.614542, 0.3254902, 1, 0, 1,
-0.5638094, -0.8732913, -0.5323065, 0.3215686, 1, 0, 1,
-0.5631315, -0.9456315, -2.51482, 0.3137255, 1, 0, 1,
-0.5618713, 0.1015932, -0.1140871, 0.3098039, 1, 0, 1,
-0.5575706, 0.804762, -1.051646, 0.3019608, 1, 0, 1,
-0.5497611, 1.674373, 0.8990147, 0.2941177, 1, 0, 1,
-0.5431497, 0.8598179, -0.03082885, 0.2901961, 1, 0, 1,
-0.5416821, -0.980725, -2.79577, 0.282353, 1, 0, 1,
-0.5398278, -1.374786, -1.008915, 0.2784314, 1, 0, 1,
-0.5368294, 0.5886825, 0.5053273, 0.2705882, 1, 0, 1,
-0.528687, 0.8477977, -1.150694, 0.2666667, 1, 0, 1,
-0.527982, -0.2331619, -2.579144, 0.2588235, 1, 0, 1,
-0.5150164, -0.07298517, -1.784088, 0.254902, 1, 0, 1,
-0.5140471, -2.040285, -4.376076, 0.2470588, 1, 0, 1,
-0.5085261, 0.1287646, -0.2131502, 0.2431373, 1, 0, 1,
-0.5067867, -0.1902574, -1.732442, 0.2352941, 1, 0, 1,
-0.5056232, 1.199243, -1.711963, 0.2313726, 1, 0, 1,
-0.4984646, 0.4904486, -0.8239259, 0.2235294, 1, 0, 1,
-0.4979134, 2.027176, -0.8819568, 0.2196078, 1, 0, 1,
-0.4964209, -1.573126, -3.247154, 0.2117647, 1, 0, 1,
-0.4963754, 1.086905, 2.063245, 0.2078431, 1, 0, 1,
-0.4903995, -0.6067165, -4.308691, 0.2, 1, 0, 1,
-0.4903763, 1.167131, -0.1154082, 0.1921569, 1, 0, 1,
-0.4868974, -0.3945004, -1.066414, 0.1882353, 1, 0, 1,
-0.4847346, -2.142093, -3.914582, 0.1803922, 1, 0, 1,
-0.4834908, 0.8241633, -2.260691, 0.1764706, 1, 0, 1,
-0.4825813, 0.561092, -1.505846, 0.1686275, 1, 0, 1,
-0.4824418, -0.04545455, -2.049852, 0.1647059, 1, 0, 1,
-0.4779433, 1.938611, 0.1201343, 0.1568628, 1, 0, 1,
-0.4765951, -1.319228, -4.431108, 0.1529412, 1, 0, 1,
-0.4745705, -1.242245, -3.049254, 0.145098, 1, 0, 1,
-0.4725909, 0.6014694, 1.654393, 0.1411765, 1, 0, 1,
-0.4712285, 0.8823872, -0.8457112, 0.1333333, 1, 0, 1,
-0.4691176, 0.04145307, -1.391709, 0.1294118, 1, 0, 1,
-0.4650244, -0.5607501, -2.66443, 0.1215686, 1, 0, 1,
-0.463275, 2.547786, 0.2251812, 0.1176471, 1, 0, 1,
-0.4587772, -1.38572, -2.583454, 0.1098039, 1, 0, 1,
-0.458136, 0.2572145, -0.2360238, 0.1058824, 1, 0, 1,
-0.4576347, 1.487411, -0.242154, 0.09803922, 1, 0, 1,
-0.4421638, -0.3382633, -3.504003, 0.09019608, 1, 0, 1,
-0.4421315, -1.905457, -3.446371, 0.08627451, 1, 0, 1,
-0.4415565, -0.4300652, -2.667529, 0.07843138, 1, 0, 1,
-0.44126, -0.2782543, -3.374902, 0.07450981, 1, 0, 1,
-0.4355158, -0.327947, -2.730024, 0.06666667, 1, 0, 1,
-0.4324849, 0.7802313, -0.4887142, 0.0627451, 1, 0, 1,
-0.430865, 1.62719, -0.1024597, 0.05490196, 1, 0, 1,
-0.4291154, 1.4523, 0.8717638, 0.05098039, 1, 0, 1,
-0.4251743, -0.5596901, -2.133722, 0.04313726, 1, 0, 1,
-0.4234581, -2.386024, -1.549451, 0.03921569, 1, 0, 1,
-0.4233432, -0.5620928, -5.194787, 0.03137255, 1, 0, 1,
-0.4223165, 0.9026387, -1.417226, 0.02745098, 1, 0, 1,
-0.4210474, -0.260581, -2.093957, 0.01960784, 1, 0, 1,
-0.4192398, 0.8533238, -0.6363487, 0.01568628, 1, 0, 1,
-0.4137559, -0.3306891, -1.670659, 0.007843138, 1, 0, 1,
-0.4109013, 0.01491136, -1.962803, 0.003921569, 1, 0, 1,
-0.410527, 0.01862706, -0.4217346, 0, 1, 0.003921569, 1,
-0.4097393, -1.258959, -2.457646, 0, 1, 0.01176471, 1,
-0.4024382, -0.2157103, -0.09654828, 0, 1, 0.01568628, 1,
-0.4022543, 0.8534409, -0.9148149, 0, 1, 0.02352941, 1,
-0.4004806, 1.12152, -0.7501743, 0, 1, 0.02745098, 1,
-0.3992742, -1.078127, -2.811214, 0, 1, 0.03529412, 1,
-0.3971945, -1.196503, -3.321835, 0, 1, 0.03921569, 1,
-0.395556, -1.043415, -4.978341, 0, 1, 0.04705882, 1,
-0.3933568, 0.2112815, -2.256259, 0, 1, 0.05098039, 1,
-0.3925698, -0.3907363, -1.393761, 0, 1, 0.05882353, 1,
-0.3917393, -1.981247, -1.847935, 0, 1, 0.0627451, 1,
-0.3915462, 0.09728318, -1.778225, 0, 1, 0.07058824, 1,
-0.3867724, 0.7689749, -0.7032485, 0, 1, 0.07450981, 1,
-0.3835185, 0.6010319, -0.7631673, 0, 1, 0.08235294, 1,
-0.3834868, 1.941949, 0.4328838, 0, 1, 0.08627451, 1,
-0.3819588, 0.8707594, 1.637828, 0, 1, 0.09411765, 1,
-0.3785697, -0.006646457, -1.828618, 0, 1, 0.1019608, 1,
-0.3782327, -0.03871938, -2.821035, 0, 1, 0.1058824, 1,
-0.3778592, -0.9137512, -3.635859, 0, 1, 0.1137255, 1,
-0.3712801, 1.189936, -0.4511164, 0, 1, 0.1176471, 1,
-0.363732, 1.274973, -1.157061, 0, 1, 0.1254902, 1,
-0.3607614, -0.6868895, -4.22999, 0, 1, 0.1294118, 1,
-0.3605873, -0.2215092, -0.9232937, 0, 1, 0.1372549, 1,
-0.3566444, 0.4288566, -0.0475033, 0, 1, 0.1411765, 1,
-0.3561242, -1.273022, -1.33531, 0, 1, 0.1490196, 1,
-0.3524355, -1.010214, -0.8859328, 0, 1, 0.1529412, 1,
-0.3518583, -0.6101044, -2.487676, 0, 1, 0.1607843, 1,
-0.3478394, 0.976142, -1.176877, 0, 1, 0.1647059, 1,
-0.3452474, 0.02445688, -0.4060743, 0, 1, 0.172549, 1,
-0.3367853, 1.050097, 0.8834513, 0, 1, 0.1764706, 1,
-0.3273189, 1.540304, 0.925621, 0, 1, 0.1843137, 1,
-0.3248931, 0.7194459, 1.513264, 0, 1, 0.1882353, 1,
-0.3242218, 0.6143514, 0.3810323, 0, 1, 0.1960784, 1,
-0.3140698, -0.4562161, -4.538906, 0, 1, 0.2039216, 1,
-0.3131935, -0.2440859, -0.3220066, 0, 1, 0.2078431, 1,
-0.3130657, 1.102691, 0.3648285, 0, 1, 0.2156863, 1,
-0.3106514, -1.070333, -4.04576, 0, 1, 0.2196078, 1,
-0.3099553, 1.12851, -0.2765083, 0, 1, 0.227451, 1,
-0.3049849, 0.7044394, -0.07610057, 0, 1, 0.2313726, 1,
-0.3015226, 0.6236227, -0.4660232, 0, 1, 0.2392157, 1,
-0.2998399, -0.4211753, -3.151525, 0, 1, 0.2431373, 1,
-0.2986777, -0.668281, -3.952388, 0, 1, 0.2509804, 1,
-0.2915241, -0.2289413, -1.854712, 0, 1, 0.254902, 1,
-0.289725, 1.677097, 0.7982724, 0, 1, 0.2627451, 1,
-0.2879378, -0.2208892, -3.104535, 0, 1, 0.2666667, 1,
-0.2872256, 0.605864, -2.369839, 0, 1, 0.2745098, 1,
-0.2751603, 0.1570103, -1.880492, 0, 1, 0.2784314, 1,
-0.2751145, -0.4223632, -2.265915, 0, 1, 0.2862745, 1,
-0.275069, 1.225641, 1.381121, 0, 1, 0.2901961, 1,
-0.2748102, 0.678345, -0.7110415, 0, 1, 0.2980392, 1,
-0.2728212, -0.452813, -3.188413, 0, 1, 0.3058824, 1,
-0.2714038, 0.2238879, -1.872963, 0, 1, 0.3098039, 1,
-0.266987, -0.4964123, -2.944935, 0, 1, 0.3176471, 1,
-0.2669123, -0.5595249, -2.566724, 0, 1, 0.3215686, 1,
-0.2642038, 0.5504379, 0.2869213, 0, 1, 0.3294118, 1,
-0.2626941, -1.032341, -3.552856, 0, 1, 0.3333333, 1,
-0.2624576, -0.1246949, -2.550481, 0, 1, 0.3411765, 1,
-0.2620521, 0.9704009, -1.132412, 0, 1, 0.345098, 1,
-0.2612454, 0.7780817, -1.105982, 0, 1, 0.3529412, 1,
-0.2598136, -1.343639, -4.417564, 0, 1, 0.3568628, 1,
-0.2586776, -0.8832737, -2.307088, 0, 1, 0.3647059, 1,
-0.2536286, 1.612547, -0.8267979, 0, 1, 0.3686275, 1,
-0.2526551, 1.392152, -0.5627521, 0, 1, 0.3764706, 1,
-0.2521574, -0.7496737, -2.963572, 0, 1, 0.3803922, 1,
-0.2376007, -1.04134, -2.286083, 0, 1, 0.3882353, 1,
-0.2366891, -0.005109313, 0.7481073, 0, 1, 0.3921569, 1,
-0.2352868, 0.3713035, -0.7371103, 0, 1, 0.4, 1,
-0.2304936, 0.3562868, 0.08477324, 0, 1, 0.4078431, 1,
-0.2228924, -0.2601075, -1.808498, 0, 1, 0.4117647, 1,
-0.2219805, -2.076296, -1.89581, 0, 1, 0.4196078, 1,
-0.221675, 0.1250072, 0.4581594, 0, 1, 0.4235294, 1,
-0.2151824, 0.4303308, -0.8055349, 0, 1, 0.4313726, 1,
-0.2149016, 0.7938441, 0.01094349, 0, 1, 0.4352941, 1,
-0.2124459, 0.7497, -1.04219, 0, 1, 0.4431373, 1,
-0.2099057, 0.868393, 0.1306503, 0, 1, 0.4470588, 1,
-0.2094766, -0.2852916, -2.010555, 0, 1, 0.454902, 1,
-0.208917, 0.5806801, -1.122803, 0, 1, 0.4588235, 1,
-0.2088227, 0.1030375, -1.196756, 0, 1, 0.4666667, 1,
-0.203653, 0.7782328, -1.73174, 0, 1, 0.4705882, 1,
-0.2031621, 0.8429527, 0.09778231, 0, 1, 0.4784314, 1,
-0.2024824, -0.6128268, -4.103583, 0, 1, 0.4823529, 1,
-0.2002264, 0.0834074, 0.07691596, 0, 1, 0.4901961, 1,
-0.1996929, 1.411993, 0.420672, 0, 1, 0.4941176, 1,
-0.1985278, 1.894752, -0.1556775, 0, 1, 0.5019608, 1,
-0.1960431, 0.04893051, -1.160438, 0, 1, 0.509804, 1,
-0.1956894, 0.1075126, -1.932954, 0, 1, 0.5137255, 1,
-0.1901551, 0.9448063, 0.3401661, 0, 1, 0.5215687, 1,
-0.1885877, 0.9398534, 0.7643722, 0, 1, 0.5254902, 1,
-0.1869193, 0.2190446, -1.168576, 0, 1, 0.5333334, 1,
-0.1868543, -0.6985732, -1.928803, 0, 1, 0.5372549, 1,
-0.1763982, 1.165928, -1.003556, 0, 1, 0.5450981, 1,
-0.1734576, 0.6400971, 0.6472089, 0, 1, 0.5490196, 1,
-0.1694043, 0.3790667, 1.567559, 0, 1, 0.5568628, 1,
-0.1693448, -0.2594966, -2.879834, 0, 1, 0.5607843, 1,
-0.1612836, 0.8359303, -0.151542, 0, 1, 0.5686275, 1,
-0.1609536, -0.08104898, -2.566766, 0, 1, 0.572549, 1,
-0.1592148, -0.1538697, -3.102746, 0, 1, 0.5803922, 1,
-0.1552167, -0.6223273, -1.884365, 0, 1, 0.5843138, 1,
-0.1533916, -0.3606218, -1.61739, 0, 1, 0.5921569, 1,
-0.1513681, -0.5126097, -1.783658, 0, 1, 0.5960785, 1,
-0.1498028, -0.7151446, -3.246853, 0, 1, 0.6039216, 1,
-0.1425043, 0.5932384, -0.4281702, 0, 1, 0.6117647, 1,
-0.1385798, 0.670285, 0.687823, 0, 1, 0.6156863, 1,
-0.137913, -0.9229809, -3.126292, 0, 1, 0.6235294, 1,
-0.1345976, -0.9504975, -3.499066, 0, 1, 0.627451, 1,
-0.1345587, 0.9354083, -0.3012498, 0, 1, 0.6352941, 1,
-0.1331349, 0.07875618, 0.2224342, 0, 1, 0.6392157, 1,
-0.1324442, 0.21522, -0.8652331, 0, 1, 0.6470588, 1,
-0.1288553, 0.03494988, -1.896514, 0, 1, 0.6509804, 1,
-0.1254574, 1.499754, -1.618443, 0, 1, 0.6588235, 1,
-0.1253198, 0.04051528, -1.623844, 0, 1, 0.6627451, 1,
-0.1222525, 0.8323022, -0.3081703, 0, 1, 0.6705883, 1,
-0.121548, 0.2004292, -0.03114222, 0, 1, 0.6745098, 1,
-0.1206411, -0.7331333, -2.764831, 0, 1, 0.682353, 1,
-0.1195691, 1.119994, -0.1625717, 0, 1, 0.6862745, 1,
-0.1167153, -0.1622776, -2.497271, 0, 1, 0.6941177, 1,
-0.1131382, 0.07729357, -1.179509, 0, 1, 0.7019608, 1,
-0.1127213, 0.4782306, -2.113718, 0, 1, 0.7058824, 1,
-0.1080089, -0.1994915, -3.622126, 0, 1, 0.7137255, 1,
-0.1064994, -0.1519495, -2.500784, 0, 1, 0.7176471, 1,
-0.1026916, 0.3289225, -1.269675, 0, 1, 0.7254902, 1,
-0.1021859, -0.6028615, -2.447563, 0, 1, 0.7294118, 1,
-0.09830907, -1.004867, -3.47226, 0, 1, 0.7372549, 1,
-0.09686034, 0.426239, 0.4519643, 0, 1, 0.7411765, 1,
-0.09619787, 0.843313, 1.068192, 0, 1, 0.7490196, 1,
-0.09582101, -0.8648284, -2.740209, 0, 1, 0.7529412, 1,
-0.0933414, -1.098819, -2.641773, 0, 1, 0.7607843, 1,
-0.0930964, 0.1088727, -1.231928, 0, 1, 0.7647059, 1,
-0.09034912, -0.1086677, -1.915593, 0, 1, 0.772549, 1,
-0.09014794, 0.2668665, -0.3034369, 0, 1, 0.7764706, 1,
-0.08674926, -0.4471656, -1.545881, 0, 1, 0.7843137, 1,
-0.08210313, 0.1908992, 0.1376231, 0, 1, 0.7882353, 1,
-0.08135374, -0.229681, -3.573673, 0, 1, 0.7960784, 1,
-0.0765205, 1.27064, -0.9628397, 0, 1, 0.8039216, 1,
-0.07578295, 1.647724, 1.466235, 0, 1, 0.8078431, 1,
-0.06724011, -0.7013754, -1.835281, 0, 1, 0.8156863, 1,
-0.06431138, 1.206048, -1.223747, 0, 1, 0.8196079, 1,
-0.06409701, 0.9070077, -0.6172131, 0, 1, 0.827451, 1,
-0.06303772, 0.6272594, 0.9072972, 0, 1, 0.8313726, 1,
-0.06089064, -0.282734, -3.090714, 0, 1, 0.8392157, 1,
-0.06044872, -0.9660141, -3.274577, 0, 1, 0.8431373, 1,
-0.0584589, 2.268811, 2.146445, 0, 1, 0.8509804, 1,
-0.0578573, -0.7580413, -2.323259, 0, 1, 0.854902, 1,
-0.05758173, 0.394687, 0.3777627, 0, 1, 0.8627451, 1,
-0.05674861, -1.572402, -3.522545, 0, 1, 0.8666667, 1,
-0.05648931, 0.05692755, -1.850591, 0, 1, 0.8745098, 1,
-0.0530397, -0.3986453, -1.854932, 0, 1, 0.8784314, 1,
-0.05292972, 0.5319837, 0.0813299, 0, 1, 0.8862745, 1,
-0.0433789, 1.611902, 1.713107, 0, 1, 0.8901961, 1,
-0.04333964, 0.3501764, 0.388138, 0, 1, 0.8980392, 1,
-0.04092677, 0.491285, -0.2656048, 0, 1, 0.9058824, 1,
-0.04029383, -0.3703644, -2.337877, 0, 1, 0.9098039, 1,
-0.03517963, -1.94656, -3.325439, 0, 1, 0.9176471, 1,
-0.03403991, 0.0939157, -0.006761036, 0, 1, 0.9215686, 1,
-0.03381995, 1.319563, -0.4989295, 0, 1, 0.9294118, 1,
-0.0320989, -0.9806867, -4.054079, 0, 1, 0.9333333, 1,
-0.03015489, 0.8008992, -0.4973025, 0, 1, 0.9411765, 1,
-0.02471762, -0.7260902, -2.490402, 0, 1, 0.945098, 1,
-0.02350883, -0.2333435, -5.004362, 0, 1, 0.9529412, 1,
-0.0199043, 0.5437129, 1.869162, 0, 1, 0.9568627, 1,
-0.01899829, -1.491572, -3.393739, 0, 1, 0.9647059, 1,
-0.01741469, 0.9406592, -0.3638147, 0, 1, 0.9686275, 1,
-0.01545639, -2.082639, -0.7397108, 0, 1, 0.9764706, 1,
-0.01383219, -1.176715, -3.694928, 0, 1, 0.9803922, 1,
-0.01299108, 0.368722, 0.2247834, 0, 1, 0.9882353, 1,
-0.01280059, 1.73875, -0.4448299, 0, 1, 0.9921569, 1,
-0.01193333, 1.162049, 0.990625, 0, 1, 1, 1,
-0.01050687, 2.132898, 0.3589329, 0, 0.9921569, 1, 1,
-0.006822144, 0.3520358, -1.523087, 0, 0.9882353, 1, 1,
-0.001144159, -0.692745, -3.128813, 0, 0.9803922, 1, 1,
0.009085312, -2.109245, 3.529525, 0, 0.9764706, 1, 1,
0.01146777, 0.7466763, 0.1271405, 0, 0.9686275, 1, 1,
0.0151196, -1.008605, 2.402348, 0, 0.9647059, 1, 1,
0.02145653, 2.155149, 0.3919871, 0, 0.9568627, 1, 1,
0.02247158, 0.3490167, 0.6661049, 0, 0.9529412, 1, 1,
0.02566333, 1.558327, 0.3179487, 0, 0.945098, 1, 1,
0.03476654, 0.3466105, 0.5432461, 0, 0.9411765, 1, 1,
0.03552403, 0.5774578, -0.7407699, 0, 0.9333333, 1, 1,
0.03923951, 0.8928737, -1.440232, 0, 0.9294118, 1, 1,
0.03941308, 0.9179924, 0.7347284, 0, 0.9215686, 1, 1,
0.04052067, 1.01646, 1.423311, 0, 0.9176471, 1, 1,
0.04260541, -0.02990793, 1.435383, 0, 0.9098039, 1, 1,
0.04265961, -1.05437, 1.742631, 0, 0.9058824, 1, 1,
0.04329097, -0.09041133, 2.678046, 0, 0.8980392, 1, 1,
0.05092416, -0.7421824, 4.825336, 0, 0.8901961, 1, 1,
0.05107646, -0.6929501, 3.336506, 0, 0.8862745, 1, 1,
0.05152228, 1.481373, -1.062344, 0, 0.8784314, 1, 1,
0.05242738, -1.037382, 0.9809696, 0, 0.8745098, 1, 1,
0.05294494, -0.6532383, 5.782608, 0, 0.8666667, 1, 1,
0.06402338, -2.248199, 3.586164, 0, 0.8627451, 1, 1,
0.06415132, -0.3820493, 2.542342, 0, 0.854902, 1, 1,
0.066817, 1.150789, -0.4035413, 0, 0.8509804, 1, 1,
0.06711812, 0.731678, 0.9622397, 0, 0.8431373, 1, 1,
0.07282966, 0.988959, 2.297738, 0, 0.8392157, 1, 1,
0.07297808, 2.484564, -1.647802, 0, 0.8313726, 1, 1,
0.07311598, 1.063041, 1.108152, 0, 0.827451, 1, 1,
0.07452209, -0.985711, 1.555964, 0, 0.8196079, 1, 1,
0.07537455, 0.4225864, 1.354124, 0, 0.8156863, 1, 1,
0.07774463, 0.454674, 1.016347, 0, 0.8078431, 1, 1,
0.07940887, 0.2700071, -0.5305598, 0, 0.8039216, 1, 1,
0.08551684, -0.1639424, 1.031617, 0, 0.7960784, 1, 1,
0.08971117, -0.3877249, 4.457472, 0, 0.7882353, 1, 1,
0.09059437, -0.4566773, 4.188205, 0, 0.7843137, 1, 1,
0.09895875, -0.3804209, 2.437371, 0, 0.7764706, 1, 1,
0.09898847, -0.2734722, 2.412161, 0, 0.772549, 1, 1,
0.100012, -0.1321029, 4.685366, 0, 0.7647059, 1, 1,
0.1002247, 0.8723373, -1.371023, 0, 0.7607843, 1, 1,
0.1003264, 1.061951, -1.090194, 0, 0.7529412, 1, 1,
0.1029608, 0.6831809, 0.4993296, 0, 0.7490196, 1, 1,
0.1081255, 0.2964166, 1.485603, 0, 0.7411765, 1, 1,
0.1088611, 2.151819, -0.02728591, 0, 0.7372549, 1, 1,
0.1093444, -1.121872, 4.386928, 0, 0.7294118, 1, 1,
0.1105894, 0.1409159, 3.175212, 0, 0.7254902, 1, 1,
0.1119194, -0.8034661, 3.600689, 0, 0.7176471, 1, 1,
0.1168158, 0.8824024, -0.9781851, 0, 0.7137255, 1, 1,
0.1179452, -1.211955, 4.458702, 0, 0.7058824, 1, 1,
0.1228041, -2.368561, 3.646723, 0, 0.6980392, 1, 1,
0.1231749, 0.8927154, -0.949549, 0, 0.6941177, 1, 1,
0.1252863, 0.7272245, 2.181691, 0, 0.6862745, 1, 1,
0.1253511, 0.774695, -0.8910024, 0, 0.682353, 1, 1,
0.1268289, -0.3359824, 3.480097, 0, 0.6745098, 1, 1,
0.1275956, 1.588013, 0.2989298, 0, 0.6705883, 1, 1,
0.1294414, 0.4629071, 1.920343, 0, 0.6627451, 1, 1,
0.1300127, -0.2684815, 3.282129, 0, 0.6588235, 1, 1,
0.1309314, -0.4592726, 3.48285, 0, 0.6509804, 1, 1,
0.1313038, 0.9480067, 2.287819, 0, 0.6470588, 1, 1,
0.1313596, 0.944757, -0.8338891, 0, 0.6392157, 1, 1,
0.131877, 0.6450555, -0.4842411, 0, 0.6352941, 1, 1,
0.1355161, 0.7936711, -1.417879, 0, 0.627451, 1, 1,
0.1355787, -1.325137, 2.201353, 0, 0.6235294, 1, 1,
0.1378002, 0.8941761, 0.6276041, 0, 0.6156863, 1, 1,
0.1404518, 0.4254622, -0.8569617, 0, 0.6117647, 1, 1,
0.1425246, 0.3161224, -0.5289611, 0, 0.6039216, 1, 1,
0.1470685, -1.130806, 2.064273, 0, 0.5960785, 1, 1,
0.1486378, -0.4802877, 2.226449, 0, 0.5921569, 1, 1,
0.1525541, 1.652985, 1.078725, 0, 0.5843138, 1, 1,
0.155751, -1.288597, 2.81965, 0, 0.5803922, 1, 1,
0.1563994, -0.1077968, 1.143072, 0, 0.572549, 1, 1,
0.1609426, 1.188196, -0.9348984, 0, 0.5686275, 1, 1,
0.1695393, -0.2669498, 3.912704, 0, 0.5607843, 1, 1,
0.1714244, -0.710979, 2.915033, 0, 0.5568628, 1, 1,
0.1718929, -1.234181, 3.696806, 0, 0.5490196, 1, 1,
0.1753352, 0.3815174, -0.1109011, 0, 0.5450981, 1, 1,
0.1806358, -0.06415072, 0.8285999, 0, 0.5372549, 1, 1,
0.180699, -0.2421353, 3.453263, 0, 0.5333334, 1, 1,
0.1814836, 0.08002906, -0.5639251, 0, 0.5254902, 1, 1,
0.1825982, -0.6940179, 3.171655, 0, 0.5215687, 1, 1,
0.1853054, 0.5098712, 1.094292, 0, 0.5137255, 1, 1,
0.1888576, -0.6510758, 3.307465, 0, 0.509804, 1, 1,
0.1901225, -0.07132743, 1.484756, 0, 0.5019608, 1, 1,
0.1928166, -2.089486, 2.840778, 0, 0.4941176, 1, 1,
0.1937217, 0.317464, -0.1176188, 0, 0.4901961, 1, 1,
0.1955761, -0.08640123, 2.786021, 0, 0.4823529, 1, 1,
0.1963365, 0.01859007, 1.182942, 0, 0.4784314, 1, 1,
0.1969869, 0.3905572, 0.3454251, 0, 0.4705882, 1, 1,
0.2053781, 0.9787608, 1.321987, 0, 0.4666667, 1, 1,
0.2074287, 0.6333992, -0.9182945, 0, 0.4588235, 1, 1,
0.2083583, 1.687309, 0.2528294, 0, 0.454902, 1, 1,
0.2083801, 0.3421249, 1.797625, 0, 0.4470588, 1, 1,
0.2095405, -0.8984459, 3.286652, 0, 0.4431373, 1, 1,
0.2096147, -1.202474, 2.637648, 0, 0.4352941, 1, 1,
0.2155608, 0.6633843, 0.9768707, 0, 0.4313726, 1, 1,
0.216942, 0.6185184, 0.9858609, 0, 0.4235294, 1, 1,
0.2172945, -0.7950763, 3.376033, 0, 0.4196078, 1, 1,
0.2174301, 1.431927, -1.706282, 0, 0.4117647, 1, 1,
0.2197464, -0.2876171, 2.683083, 0, 0.4078431, 1, 1,
0.2206667, -0.4329361, 4.132155, 0, 0.4, 1, 1,
0.2211659, 0.4402448, 1.775906, 0, 0.3921569, 1, 1,
0.2251039, -1.00363, 3.831962, 0, 0.3882353, 1, 1,
0.2254793, 0.1093885, 1.509225, 0, 0.3803922, 1, 1,
0.2302639, -1.874821, 4.750934, 0, 0.3764706, 1, 1,
0.2308091, 0.8007595, 1.326168, 0, 0.3686275, 1, 1,
0.2313962, 0.3234887, 1.713453, 0, 0.3647059, 1, 1,
0.2356614, -1.137262, 3.902966, 0, 0.3568628, 1, 1,
0.2385044, 0.8969945, -0.04663663, 0, 0.3529412, 1, 1,
0.2386713, -0.651779, 2.690397, 0, 0.345098, 1, 1,
0.2459359, 0.9389687, 0.3469843, 0, 0.3411765, 1, 1,
0.2464504, -1.699898, 0.9141787, 0, 0.3333333, 1, 1,
0.2592298, 0.8557777, 0.2206087, 0, 0.3294118, 1, 1,
0.2642553, 0.5954384, 0.2828479, 0, 0.3215686, 1, 1,
0.2644067, -0.7385497, 3.376449, 0, 0.3176471, 1, 1,
0.2661642, 1.738925, 0.2828761, 0, 0.3098039, 1, 1,
0.2677727, -3.216335, 3.956444, 0, 0.3058824, 1, 1,
0.2746575, 0.5950036, 1.295793, 0, 0.2980392, 1, 1,
0.2756092, 0.8777087, -0.05493695, 0, 0.2901961, 1, 1,
0.2816612, 0.1103772, 0.9975145, 0, 0.2862745, 1, 1,
0.2822354, -0.7539715, 1.243291, 0, 0.2784314, 1, 1,
0.2842283, 0.2619487, 0.5286368, 0, 0.2745098, 1, 1,
0.2854918, 0.1992749, -0.5899473, 0, 0.2666667, 1, 1,
0.2948074, 0.4636265, 2.083124, 0, 0.2627451, 1, 1,
0.2950162, -1.76547, 3.914825, 0, 0.254902, 1, 1,
0.2960142, 0.1189526, 0.8266904, 0, 0.2509804, 1, 1,
0.2964418, -0.3451991, 3.475021, 0, 0.2431373, 1, 1,
0.2996078, 0.652778, -0.1303195, 0, 0.2392157, 1, 1,
0.3000697, -0.6516744, 1.845351, 0, 0.2313726, 1, 1,
0.3057501, -1.736531, 4.274856, 0, 0.227451, 1, 1,
0.3060072, -0.4850045, 2.357052, 0, 0.2196078, 1, 1,
0.3065476, 0.216044, 1.931764, 0, 0.2156863, 1, 1,
0.3086097, -0.5117564, 2.808514, 0, 0.2078431, 1, 1,
0.3104782, -0.3403549, 2.134529, 0, 0.2039216, 1, 1,
0.3126885, 0.3039878, -0.2020437, 0, 0.1960784, 1, 1,
0.3140963, 2.113247, 0.05957991, 0, 0.1882353, 1, 1,
0.3150581, -0.5851275, 2.021764, 0, 0.1843137, 1, 1,
0.3188043, 0.4460888, 1.09147, 0, 0.1764706, 1, 1,
0.3190728, 0.6103637, 0.8957778, 0, 0.172549, 1, 1,
0.3193218, -0.3235835, 1.941751, 0, 0.1647059, 1, 1,
0.3222157, 0.9206143, 1.777141, 0, 0.1607843, 1, 1,
0.3226397, 0.1855275, 2.229128, 0, 0.1529412, 1, 1,
0.3251909, -1.803618, 1.651992, 0, 0.1490196, 1, 1,
0.3282867, -0.9267831, 3.37571, 0, 0.1411765, 1, 1,
0.3283719, 0.08026372, 1.735842, 0, 0.1372549, 1, 1,
0.3303666, -0.05274213, 1.822541, 0, 0.1294118, 1, 1,
0.3308371, -0.4732259, 2.594202, 0, 0.1254902, 1, 1,
0.3326266, -0.2165496, 1.434412, 0, 0.1176471, 1, 1,
0.3357319, 0.4504278, 1.612968, 0, 0.1137255, 1, 1,
0.340446, -0.86292, 1.51663, 0, 0.1058824, 1, 1,
0.3416251, 1.968891, 0.8762581, 0, 0.09803922, 1, 1,
0.3421178, 0.7952185, 0.2239773, 0, 0.09411765, 1, 1,
0.3460938, -1.687409, 4.000514, 0, 0.08627451, 1, 1,
0.3509034, -0.7310013, 3.054555, 0, 0.08235294, 1, 1,
0.361769, -1.389578, 4.382773, 0, 0.07450981, 1, 1,
0.3619615, 1.32177, 0.1084099, 0, 0.07058824, 1, 1,
0.3633328, 0.70639, 0.1302029, 0, 0.0627451, 1, 1,
0.364178, -0.7417036, 1.610034, 0, 0.05882353, 1, 1,
0.3643808, 0.2963822, 2.805024, 0, 0.05098039, 1, 1,
0.3660432, -0.2458534, 2.468644, 0, 0.04705882, 1, 1,
0.3666262, -0.1727095, 3.517986, 0, 0.03921569, 1, 1,
0.3673265, -0.7626354, 1.716458, 0, 0.03529412, 1, 1,
0.3703326, -0.9970644, 3.057864, 0, 0.02745098, 1, 1,
0.3744704, 1.066476, -0.199342, 0, 0.02352941, 1, 1,
0.3754371, 0.5794308, -0.4286084, 0, 0.01568628, 1, 1,
0.3761402, -0.5453616, -0.7274755, 0, 0.01176471, 1, 1,
0.3875081, -0.3419228, 0.07786091, 0, 0.003921569, 1, 1,
0.3957694, 0.50932, 1.191423, 0.003921569, 0, 1, 1,
0.3966261, -0.152261, 2.891631, 0.007843138, 0, 1, 1,
0.3987548, -0.9621558, 4.042703, 0.01568628, 0, 1, 1,
0.3994266, 1.079738, 0.7703504, 0.01960784, 0, 1, 1,
0.4006645, -0.02143946, 1.138201, 0.02745098, 0, 1, 1,
0.4008109, 1.465462, 1.843959, 0.03137255, 0, 1, 1,
0.4020581, -0.4111159, 3.654279, 0.03921569, 0, 1, 1,
0.4061872, -1.869552, 3.680666, 0.04313726, 0, 1, 1,
0.4071011, -0.5404323, 3.538621, 0.05098039, 0, 1, 1,
0.4078623, -1.784762, 3.435319, 0.05490196, 0, 1, 1,
0.41099, 0.3219532, -0.316368, 0.0627451, 0, 1, 1,
0.4113191, -0.4841573, 3.434127, 0.06666667, 0, 1, 1,
0.4154871, -0.4207344, 2.27757, 0.07450981, 0, 1, 1,
0.4212714, -1.359073, 4.188978, 0.07843138, 0, 1, 1,
0.4220548, -0.2600628, 3.799312, 0.08627451, 0, 1, 1,
0.422628, 0.852331, -2.082543, 0.09019608, 0, 1, 1,
0.4269041, 0.3985764, 0.831861, 0.09803922, 0, 1, 1,
0.4280969, 0.6461973, 0.3422127, 0.1058824, 0, 1, 1,
0.4294251, 0.3093113, -0.01143634, 0.1098039, 0, 1, 1,
0.4351622, -0.9665866, 3.043393, 0.1176471, 0, 1, 1,
0.4368633, 0.2220403, 0.6950607, 0.1215686, 0, 1, 1,
0.4369139, 0.08894523, -1.495563, 0.1294118, 0, 1, 1,
0.443721, 0.9441038, 1.656684, 0.1333333, 0, 1, 1,
0.4442567, -1.294075, 4.493384, 0.1411765, 0, 1, 1,
0.446637, 0.2467687, 0.3848077, 0.145098, 0, 1, 1,
0.452231, -1.268193, 3.581193, 0.1529412, 0, 1, 1,
0.4558784, -0.6083538, 2.562245, 0.1568628, 0, 1, 1,
0.4602487, 0.4819409, 0.6757364, 0.1647059, 0, 1, 1,
0.4625966, 0.7420165, 1.248822, 0.1686275, 0, 1, 1,
0.4676368, 0.1375352, -0.1883072, 0.1764706, 0, 1, 1,
0.4680333, 0.08933276, 0.5318368, 0.1803922, 0, 1, 1,
0.4694041, 2.878742, 0.002670166, 0.1882353, 0, 1, 1,
0.4759761, 1.845682, 0.1403938, 0.1921569, 0, 1, 1,
0.4773037, 1.551604, 0.4985175, 0.2, 0, 1, 1,
0.4782649, -1.068823, 2.508993, 0.2078431, 0, 1, 1,
0.4802389, -0.09169088, 1.345734, 0.2117647, 0, 1, 1,
0.4827628, 0.9719443, 0.4947642, 0.2196078, 0, 1, 1,
0.482764, -0.0005648664, -0.4097403, 0.2235294, 0, 1, 1,
0.4872929, -0.4079643, 1.55877, 0.2313726, 0, 1, 1,
0.4918177, -1.581695, 2.402634, 0.2352941, 0, 1, 1,
0.4938658, -0.1466108, 1.298059, 0.2431373, 0, 1, 1,
0.495443, -0.7056506, 2.553228, 0.2470588, 0, 1, 1,
0.4961847, -0.6462879, 2.16684, 0.254902, 0, 1, 1,
0.5005304, -2.001225, 0.8255368, 0.2588235, 0, 1, 1,
0.5007986, -0.5165114, 3.030769, 0.2666667, 0, 1, 1,
0.5011817, -0.7610013, 0.7987744, 0.2705882, 0, 1, 1,
0.5016301, 0.1892637, 0.3619439, 0.2784314, 0, 1, 1,
0.5074408, -0.2236928, 1.428368, 0.282353, 0, 1, 1,
0.5079541, -0.06102668, -0.07571074, 0.2901961, 0, 1, 1,
0.508697, -1.017924, 5.554676, 0.2941177, 0, 1, 1,
0.5103039, 0.1794175, 1.564118, 0.3019608, 0, 1, 1,
0.5140612, 0.2834942, 0.5992605, 0.3098039, 0, 1, 1,
0.5158916, 0.9771399, -0.2631577, 0.3137255, 0, 1, 1,
0.5192432, -0.002506971, 0.8713961, 0.3215686, 0, 1, 1,
0.5286993, -0.2101339, 1.313014, 0.3254902, 0, 1, 1,
0.5292991, 0.5821943, -1.430901, 0.3333333, 0, 1, 1,
0.5338412, -0.8281887, 1.063484, 0.3372549, 0, 1, 1,
0.5354741, 0.1498188, 2.296921, 0.345098, 0, 1, 1,
0.5389482, 0.01630032, 2.525356, 0.3490196, 0, 1, 1,
0.5395743, -0.8271928, 1.032735, 0.3568628, 0, 1, 1,
0.5403591, -0.7776866, 3.616306, 0.3607843, 0, 1, 1,
0.5426731, -0.9486081, 3.716727, 0.3686275, 0, 1, 1,
0.5487734, 0.3542031, 0.7572802, 0.372549, 0, 1, 1,
0.5491824, -0.5446844, 0.7767783, 0.3803922, 0, 1, 1,
0.5492201, 0.01363067, 2.667715, 0.3843137, 0, 1, 1,
0.5579245, 0.7302207, 1.953563, 0.3921569, 0, 1, 1,
0.5586793, 0.688881, 0.1485807, 0.3960784, 0, 1, 1,
0.5588016, 0.7965477, 0.9599951, 0.4039216, 0, 1, 1,
0.5611391, 1.734532, -0.6588437, 0.4117647, 0, 1, 1,
0.5620542, -1.019699, 2.179676, 0.4156863, 0, 1, 1,
0.5660857, 0.3267641, 1.100328, 0.4235294, 0, 1, 1,
0.5708804, -0.1252993, 1.511593, 0.427451, 0, 1, 1,
0.5775746, -1.517925, 1.416681, 0.4352941, 0, 1, 1,
0.5784362, -1.187461, 1.787692, 0.4392157, 0, 1, 1,
0.5786613, 1.972684, 0.355175, 0.4470588, 0, 1, 1,
0.5887084, 0.7815828, 1.644562, 0.4509804, 0, 1, 1,
0.5895447, -1.102148, 2.159755, 0.4588235, 0, 1, 1,
0.5903448, 1.592953, 0.2929726, 0.4627451, 0, 1, 1,
0.5906698, -0.8389053, 4.226256, 0.4705882, 0, 1, 1,
0.5925547, -1.59861, 2.854457, 0.4745098, 0, 1, 1,
0.5965816, -0.9413919, 2.672141, 0.4823529, 0, 1, 1,
0.6047595, -1.49913, 3.406345, 0.4862745, 0, 1, 1,
0.6070188, 0.7637939, 1.68543, 0.4941176, 0, 1, 1,
0.6099467, 0.2095581, 1.997665, 0.5019608, 0, 1, 1,
0.613765, -0.6209272, 3.13511, 0.5058824, 0, 1, 1,
0.6146093, -0.4266611, 1.12886, 0.5137255, 0, 1, 1,
0.6170955, 0.9228898, 1.127213, 0.5176471, 0, 1, 1,
0.6182578, -2.026521, 3.799514, 0.5254902, 0, 1, 1,
0.6220192, 0.9466395, 1.162314, 0.5294118, 0, 1, 1,
0.6222114, 0.8753747, 0.8893036, 0.5372549, 0, 1, 1,
0.62442, -1.715792, 2.558462, 0.5411765, 0, 1, 1,
0.6273875, -1.277623, 3.901942, 0.5490196, 0, 1, 1,
0.6289696, -0.2124073, 1.989608, 0.5529412, 0, 1, 1,
0.6331113, -1.641999, 1.227697, 0.5607843, 0, 1, 1,
0.6485382, -0.2316075, 1.837091, 0.5647059, 0, 1, 1,
0.6511549, 0.1688605, 0.4556428, 0.572549, 0, 1, 1,
0.6514632, -0.7442182, 1.27177, 0.5764706, 0, 1, 1,
0.6543747, 1.056661, 2.337124, 0.5843138, 0, 1, 1,
0.6546981, 1.036434, 0.2241416, 0.5882353, 0, 1, 1,
0.6573026, 1.664675, -2.133069, 0.5960785, 0, 1, 1,
0.6606252, -1.991956, 4.078145, 0.6039216, 0, 1, 1,
0.6640542, 1.262349, 0.8819482, 0.6078432, 0, 1, 1,
0.6668465, 0.79131, 1.119122, 0.6156863, 0, 1, 1,
0.6675255, -1.239038, 2.66743, 0.6196079, 0, 1, 1,
0.6695952, 0.3329546, 2.244003, 0.627451, 0, 1, 1,
0.6700443, 1.405582, -0.9091739, 0.6313726, 0, 1, 1,
0.6740007, -1.557987, 3.981794, 0.6392157, 0, 1, 1,
0.674307, 1.141246, 1.561216, 0.6431373, 0, 1, 1,
0.6844501, -0.2661517, 3.047062, 0.6509804, 0, 1, 1,
0.6916101, -0.02572506, 1.296816, 0.654902, 0, 1, 1,
0.69432, 0.6735744, 0.9725963, 0.6627451, 0, 1, 1,
0.6963546, -0.1295001, 2.671753, 0.6666667, 0, 1, 1,
0.6991655, -0.9461843, 1.986367, 0.6745098, 0, 1, 1,
0.7016548, -2.274983, 3.03566, 0.6784314, 0, 1, 1,
0.702002, -0.3148552, -0.9604236, 0.6862745, 0, 1, 1,
0.7067378, -0.5465681, 1.916036, 0.6901961, 0, 1, 1,
0.7119376, 0.2601605, 2.833506, 0.6980392, 0, 1, 1,
0.7193589, 0.9275984, 0.8726513, 0.7058824, 0, 1, 1,
0.7214408, 0.5891133, -0.6857719, 0.7098039, 0, 1, 1,
0.7248254, 2.584996, 0.488093, 0.7176471, 0, 1, 1,
0.726693, -0.5705056, 1.664836, 0.7215686, 0, 1, 1,
0.7274274, -1.493183, 2.298637, 0.7294118, 0, 1, 1,
0.730797, 0.08996541, 1.904396, 0.7333333, 0, 1, 1,
0.7313559, 0.09464189, 0.9892514, 0.7411765, 0, 1, 1,
0.7431342, 1.079155, 1.342845, 0.7450981, 0, 1, 1,
0.7439402, -0.7088346, 1.778352, 0.7529412, 0, 1, 1,
0.7545436, 0.8401152, 0.4799111, 0.7568628, 0, 1, 1,
0.75661, 0.2080004, 1.077775, 0.7647059, 0, 1, 1,
0.7602131, -0.5813774, 2.253628, 0.7686275, 0, 1, 1,
0.7618833, -0.1789796, 2.894119, 0.7764706, 0, 1, 1,
0.7694362, 0.4724547, 0.9073719, 0.7803922, 0, 1, 1,
0.7730389, 0.3747946, 1.580408, 0.7882353, 0, 1, 1,
0.7734421, -0.4410957, 1.480873, 0.7921569, 0, 1, 1,
0.7749934, 1.129296, -1.516112, 0.8, 0, 1, 1,
0.77804, -0.3581131, 2.737262, 0.8078431, 0, 1, 1,
0.7783543, 1.195936, 0.7269309, 0.8117647, 0, 1, 1,
0.7942383, 0.2588404, 1.862299, 0.8196079, 0, 1, 1,
0.8059354, 0.3725665, 0.5614976, 0.8235294, 0, 1, 1,
0.8061235, -0.9317312, 3.537126, 0.8313726, 0, 1, 1,
0.8122004, -0.04180909, 2.299804, 0.8352941, 0, 1, 1,
0.8191703, -1.479237, 4.296529, 0.8431373, 0, 1, 1,
0.8224117, -1.239216, 2.147341, 0.8470588, 0, 1, 1,
0.8259665, -0.8046653, 2.457074, 0.854902, 0, 1, 1,
0.8283531, 2.315855, -0.1166923, 0.8588235, 0, 1, 1,
0.8287247, -0.2622351, 1.103675, 0.8666667, 0, 1, 1,
0.836516, 1.25083, 1.325142, 0.8705882, 0, 1, 1,
0.8382078, 0.209633, 0.6405629, 0.8784314, 0, 1, 1,
0.8391799, 0.09563539, 0.4160726, 0.8823529, 0, 1, 1,
0.840485, -0.1110611, 2.022586, 0.8901961, 0, 1, 1,
0.8483447, -1.426653, 3.769655, 0.8941177, 0, 1, 1,
0.8568813, -1.191689, 2.56357, 0.9019608, 0, 1, 1,
0.8601236, 1.095667, -0.1905572, 0.9098039, 0, 1, 1,
0.8613873, -0.5810041, 3.421645, 0.9137255, 0, 1, 1,
0.8684548, 1.105218, 0.3944137, 0.9215686, 0, 1, 1,
0.8704264, 0.9103291, 1.428318, 0.9254902, 0, 1, 1,
0.8711197, 2.157008, 0.6326619, 0.9333333, 0, 1, 1,
0.8789043, -0.06177532, 2.490803, 0.9372549, 0, 1, 1,
0.8816267, 1.351253, 1.798653, 0.945098, 0, 1, 1,
0.8839257, 0.1346112, -0.04018554, 0.9490196, 0, 1, 1,
0.8858598, 0.1169626, -0.5743832, 0.9568627, 0, 1, 1,
0.8947311, -2.705392, 3.464329, 0.9607843, 0, 1, 1,
0.897719, 0.8526679, 1.289001, 0.9686275, 0, 1, 1,
0.9023628, 0.3864875, -0.4938295, 0.972549, 0, 1, 1,
0.9037909, -0.6221008, 1.169642, 0.9803922, 0, 1, 1,
0.9054765, -1.290406, 3.658919, 0.9843137, 0, 1, 1,
0.9088653, 0.3727235, -0.2684787, 0.9921569, 0, 1, 1,
0.9145498, -0.1558949, 2.90161, 0.9960784, 0, 1, 1,
0.9146734, 0.1960942, 2.169662, 1, 0, 0.9960784, 1,
0.9150704, 1.491221, -0.3747193, 1, 0, 0.9882353, 1,
0.9210214, 0.9324386, 0.6453601, 1, 0, 0.9843137, 1,
0.9252253, 0.4602476, 0.8641093, 1, 0, 0.9764706, 1,
0.9258914, 1.498037, 0.709927, 1, 0, 0.972549, 1,
0.9584989, 1.614567, -0.2624984, 1, 0, 0.9647059, 1,
0.9682057, 1.392299, -1.723147, 1, 0, 0.9607843, 1,
0.9781169, 1.10887, -0.1121899, 1, 0, 0.9529412, 1,
0.9825217, -0.7728146, 4.266445, 1, 0, 0.9490196, 1,
0.9845645, 1.123777, 0.9741701, 1, 0, 0.9411765, 1,
0.9881161, 0.2456903, 0.9901533, 1, 0, 0.9372549, 1,
0.9957542, -0.02410247, -0.3641239, 1, 0, 0.9294118, 1,
1.00124, -1.334241, 5.743095, 1, 0, 0.9254902, 1,
1.002609, 0.2436502, -0.5981427, 1, 0, 0.9176471, 1,
1.014856, -0.5838372, 1.648091, 1, 0, 0.9137255, 1,
1.016129, 0.09543078, 1.749482, 1, 0, 0.9058824, 1,
1.017164, -1.212088, 1.820469, 1, 0, 0.9019608, 1,
1.017777, -1.275284, 3.019849, 1, 0, 0.8941177, 1,
1.018778, 1.668398, -0.670028, 1, 0, 0.8862745, 1,
1.019986, -0.06496286, 2.609809, 1, 0, 0.8823529, 1,
1.0218, -1.847752, 3.445504, 1, 0, 0.8745098, 1,
1.030187, 0.5549636, -0.1548235, 1, 0, 0.8705882, 1,
1.037727, -2.179332, -0.1980327, 1, 0, 0.8627451, 1,
1.037837, -0.6018203, 1.483424, 1, 0, 0.8588235, 1,
1.037944, 0.171341, 1.975436, 1, 0, 0.8509804, 1,
1.041965, 0.4717084, 0.1651848, 1, 0, 0.8470588, 1,
1.046392, -0.05951453, 0.3297293, 1, 0, 0.8392157, 1,
1.052792, 2.410034, 0.4275967, 1, 0, 0.8352941, 1,
1.054658, -1.268956, 3.491198, 1, 0, 0.827451, 1,
1.056992, 0.03538512, -1.043237, 1, 0, 0.8235294, 1,
1.057554, -0.6242385, 2.727136, 1, 0, 0.8156863, 1,
1.06172, 1.677704, 1.067251, 1, 0, 0.8117647, 1,
1.064312, 0.5448684, 0.6981271, 1, 0, 0.8039216, 1,
1.070361, 1.030588, -0.5372636, 1, 0, 0.7960784, 1,
1.078855, -1.42736, 3.325961, 1, 0, 0.7921569, 1,
1.083593, -0.236154, 0.6571499, 1, 0, 0.7843137, 1,
1.09891, -0.6910241, 1.561451, 1, 0, 0.7803922, 1,
1.100049, 0.366634, 1.395674, 1, 0, 0.772549, 1,
1.101092, -1.004783, 0.998232, 1, 0, 0.7686275, 1,
1.111898, -0.4543138, 0.1919909, 1, 0, 0.7607843, 1,
1.120111, 1.164712, 0.7840808, 1, 0, 0.7568628, 1,
1.136082, 1.145986, -0.2696026, 1, 0, 0.7490196, 1,
1.142073, 1.594591, 0.9261146, 1, 0, 0.7450981, 1,
1.150403, -0.4135619, 1.760727, 1, 0, 0.7372549, 1,
1.159312, 0.34733, 2.171026, 1, 0, 0.7333333, 1,
1.174234, 0.400369, 1.63255, 1, 0, 0.7254902, 1,
1.183098, 0.4237575, 0.6345578, 1, 0, 0.7215686, 1,
1.189867, -0.2105969, 4.105822, 1, 0, 0.7137255, 1,
1.190175, 1.98601, -0.03486468, 1, 0, 0.7098039, 1,
1.191546, 0.9366143, 0.3442273, 1, 0, 0.7019608, 1,
1.205703, 0.8687989, 1.272585, 1, 0, 0.6941177, 1,
1.208623, -0.9164748, 2.207224, 1, 0, 0.6901961, 1,
1.209303, -0.9775066, 3.313284, 1, 0, 0.682353, 1,
1.209661, -0.2297384, 1.392045, 1, 0, 0.6784314, 1,
1.215447, -0.6710018, 3.234494, 1, 0, 0.6705883, 1,
1.21648, 0.05361842, 0.8166429, 1, 0, 0.6666667, 1,
1.220851, -0.5934303, 2.683921, 1, 0, 0.6588235, 1,
1.224439, -1.042285, 2.509807, 1, 0, 0.654902, 1,
1.225866, -0.01974626, 3.816691, 1, 0, 0.6470588, 1,
1.231575, 0.8371317, 0.56301, 1, 0, 0.6431373, 1,
1.236055, 0.1638824, 0.6902347, 1, 0, 0.6352941, 1,
1.259858, 0.9532891, 2.732754, 1, 0, 0.6313726, 1,
1.263958, -0.05835317, 0.6029013, 1, 0, 0.6235294, 1,
1.285713, 1.18808, -0.6552141, 1, 0, 0.6196079, 1,
1.28883, 1.484113, 0.6037845, 1, 0, 0.6117647, 1,
1.293871, 0.5580721, 1.907583, 1, 0, 0.6078432, 1,
1.295977, -0.7669334, 3.467911, 1, 0, 0.6, 1,
1.308457, 0.4972154, 2.034196, 1, 0, 0.5921569, 1,
1.309955, -1.076866, 2.572359, 1, 0, 0.5882353, 1,
1.32032, -0.3216778, 2.750049, 1, 0, 0.5803922, 1,
1.32627, -0.645259, 1.513969, 1, 0, 0.5764706, 1,
1.331272, 0.2901877, 2.343734, 1, 0, 0.5686275, 1,
1.33567, -0.03340139, 1.908204, 1, 0, 0.5647059, 1,
1.348731, -0.7787749, 1.943771, 1, 0, 0.5568628, 1,
1.354282, -0.576969, 1.884913, 1, 0, 0.5529412, 1,
1.354871, -0.3545502, 2.780912, 1, 0, 0.5450981, 1,
1.369866, 0.09768035, 0.8796551, 1, 0, 0.5411765, 1,
1.383085, -0.4664453, 0.1867379, 1, 0, 0.5333334, 1,
1.410988, -0.1509016, 3.694408, 1, 0, 0.5294118, 1,
1.457323, -0.1290157, 2.055521, 1, 0, 0.5215687, 1,
1.46179, 0.839027, 0.8810297, 1, 0, 0.5176471, 1,
1.46583, 0.6138923, 0.7107047, 1, 0, 0.509804, 1,
1.47281, -0.04614868, 2.604662, 1, 0, 0.5058824, 1,
1.483106, 1.299255, 1.061522, 1, 0, 0.4980392, 1,
1.483389, 1.32991, -0.5230174, 1, 0, 0.4901961, 1,
1.489763, -1.303371, 2.151309, 1, 0, 0.4862745, 1,
1.491122, -0.3282472, 2.394004, 1, 0, 0.4784314, 1,
1.496809, 0.9598622, 0.5343608, 1, 0, 0.4745098, 1,
1.50496, 0.7576031, 1.71956, 1, 0, 0.4666667, 1,
1.508026, 0.6218755, 2.243358, 1, 0, 0.4627451, 1,
1.511885, 0.45497, 0.5192277, 1, 0, 0.454902, 1,
1.515705, -1.366129, 2.398823, 1, 0, 0.4509804, 1,
1.517512, 0.9408532, -0.0165795, 1, 0, 0.4431373, 1,
1.526621, -0.2836103, -1.04054, 1, 0, 0.4392157, 1,
1.540098, -0.5396694, 0.6805081, 1, 0, 0.4313726, 1,
1.544004, 1.622856, 0.4575887, 1, 0, 0.427451, 1,
1.544641, 0.3655789, 1.884987, 1, 0, 0.4196078, 1,
1.561643, -1.256396, 2.137468, 1, 0, 0.4156863, 1,
1.569735, 1.134038, 0.8758237, 1, 0, 0.4078431, 1,
1.574761, -0.05907268, -0.4321278, 1, 0, 0.4039216, 1,
1.584625, 0.1327951, 1.77772, 1, 0, 0.3960784, 1,
1.587649, 1.653139, 0.3257813, 1, 0, 0.3882353, 1,
1.608152, 0.5687542, 0.4223638, 1, 0, 0.3843137, 1,
1.624882, -0.6395921, 3.546786, 1, 0, 0.3764706, 1,
1.632729, 0.6772245, 0.9937692, 1, 0, 0.372549, 1,
1.633114, 0.5730663, 1.188276, 1, 0, 0.3647059, 1,
1.636416, 1.781387, 1.655087, 1, 0, 0.3607843, 1,
1.647203, 0.6902631, 2.381545, 1, 0, 0.3529412, 1,
1.651811, -0.802087, 2.082813, 1, 0, 0.3490196, 1,
1.652619, -1.416266, 2.820216, 1, 0, 0.3411765, 1,
1.661424, 0.6763849, 0.7086803, 1, 0, 0.3372549, 1,
1.707412, 0.6065882, 0.9582096, 1, 0, 0.3294118, 1,
1.71624, 0.4533506, 0.4855567, 1, 0, 0.3254902, 1,
1.716334, 1.125469, 1.066464, 1, 0, 0.3176471, 1,
1.720218, 0.751081, 0.5492877, 1, 0, 0.3137255, 1,
1.724301, 0.7850162, 0.7923639, 1, 0, 0.3058824, 1,
1.726082, 0.6934435, 1.758974, 1, 0, 0.2980392, 1,
1.729144, 0.1362335, 0.4868092, 1, 0, 0.2941177, 1,
1.752909, 0.6676348, 1.73886, 1, 0, 0.2862745, 1,
1.769072, -0.02081544, 1.905962, 1, 0, 0.282353, 1,
1.778731, 0.6258971, 1.150639, 1, 0, 0.2745098, 1,
1.800038, 0.6055219, 0.1074016, 1, 0, 0.2705882, 1,
1.806018, 0.7737041, 0.6746126, 1, 0, 0.2627451, 1,
1.821239, 1.216709, 2.264081, 1, 0, 0.2588235, 1,
1.857028, -0.6091256, 1.836766, 1, 0, 0.2509804, 1,
1.872417, -0.08185522, 1.61757, 1, 0, 0.2470588, 1,
1.874402, -0.8762633, 2.223541, 1, 0, 0.2392157, 1,
1.87551, -0.2155944, 1.814153, 1, 0, 0.2352941, 1,
1.893549, -0.2996534, 3.151428, 1, 0, 0.227451, 1,
1.912927, -1.160529, 1.428808, 1, 0, 0.2235294, 1,
1.923469, 2.336484, 0.6626331, 1, 0, 0.2156863, 1,
1.929672, -1.519872, 3.507232, 1, 0, 0.2117647, 1,
1.939551, -0.7062253, 2.463209, 1, 0, 0.2039216, 1,
1.972838, 0.9099956, -0.3951309, 1, 0, 0.1960784, 1,
1.974856, 0.6337715, 1.444223, 1, 0, 0.1921569, 1,
1.986793, -0.4573983, 2.969908, 1, 0, 0.1843137, 1,
2.011904, 0.3226737, 0.5032507, 1, 0, 0.1803922, 1,
2.022599, -1.772682, 2.288996, 1, 0, 0.172549, 1,
2.031686, 0.3189323, 1.774761, 1, 0, 0.1686275, 1,
2.042129, 1.399064, 1.561049, 1, 0, 0.1607843, 1,
2.052544, 0.2269651, 0.6311136, 1, 0, 0.1568628, 1,
2.059863, 1.63076, 2.979333, 1, 0, 0.1490196, 1,
2.08966, -1.043764, 3.052699, 1, 0, 0.145098, 1,
2.092513, -0.1418511, 1.295145, 1, 0, 0.1372549, 1,
2.095921, 0.6985069, 1.642945, 1, 0, 0.1333333, 1,
2.098879, -2.647924, 2.050369, 1, 0, 0.1254902, 1,
2.108639, 0.1281534, 1.477575, 1, 0, 0.1215686, 1,
2.11033, -0.3465611, 0.7530141, 1, 0, 0.1137255, 1,
2.119543, 1.158417, 1.322761, 1, 0, 0.1098039, 1,
2.197453, -1.240344, 2.26016, 1, 0, 0.1019608, 1,
2.213315, 0.5329583, 1.852928, 1, 0, 0.09411765, 1,
2.274615, 1.791194, 0.7869489, 1, 0, 0.09019608, 1,
2.324825, -1.349837, 1.616207, 1, 0, 0.08235294, 1,
2.335659, -0.4461907, 0.993437, 1, 0, 0.07843138, 1,
2.376079, -1.223616, 3.156471, 1, 0, 0.07058824, 1,
2.377315, 1.054786, 1.364364, 1, 0, 0.06666667, 1,
2.480448, -0.3370999, 1.814624, 1, 0, 0.05882353, 1,
2.536108, 2.430354, 0.785763, 1, 0, 0.05490196, 1,
2.544404, 0.2302679, 2.500542, 1, 0, 0.04705882, 1,
2.549215, 1.638674, 2.018698, 1, 0, 0.04313726, 1,
2.556171, 0.3720497, 1.183409, 1, 0, 0.03529412, 1,
2.650954, -1.38431, 0.3003206, 1, 0, 0.03137255, 1,
2.747166, -0.1930532, 1.758694, 1, 0, 0.02352941, 1,
2.897804, -0.3726465, 2.06576, 1, 0, 0.01960784, 1,
3.279277, 1.110465, 1.917743, 1, 0, 0.01176471, 1,
3.394791, 1.08113, 0.9151665, 1, 0, 0.007843138, 1
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
0.1308106, -4.249451, -7.055455, 0, -0.5, 0.5, 0.5,
0.1308106, -4.249451, -7.055455, 1, -0.5, 0.5, 0.5,
0.1308106, -4.249451, -7.055455, 1, 1.5, 0.5, 0.5,
0.1308106, -4.249451, -7.055455, 0, 1.5, 0.5, 0.5
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
-4.239659, -0.1687967, -7.055455, 0, -0.5, 0.5, 0.5,
-4.239659, -0.1687967, -7.055455, 1, -0.5, 0.5, 0.5,
-4.239659, -0.1687967, -7.055455, 1, 1.5, 0.5, 0.5,
-4.239659, -0.1687967, -7.055455, 0, 1.5, 0.5, 0.5
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
-4.239659, -4.249451, 0.2939103, 0, -0.5, 0.5, 0.5,
-4.239659, -4.249451, 0.2939103, 1, -0.5, 0.5, 0.5,
-4.239659, -4.249451, 0.2939103, 1, 1.5, 0.5, 0.5,
-4.239659, -4.249451, 0.2939103, 0, 1.5, 0.5, 0.5
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
-3, -3.307761, -5.359448,
3, -3.307761, -5.359448,
-3, -3.307761, -5.359448,
-3, -3.46471, -5.642116,
-2, -3.307761, -5.359448,
-2, -3.46471, -5.642116,
-1, -3.307761, -5.359448,
-1, -3.46471, -5.642116,
0, -3.307761, -5.359448,
0, -3.46471, -5.642116,
1, -3.307761, -5.359448,
1, -3.46471, -5.642116,
2, -3.307761, -5.359448,
2, -3.46471, -5.642116,
3, -3.307761, -5.359448,
3, -3.46471, -5.642116
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
-3, -3.778606, -6.207452, 0, -0.5, 0.5, 0.5,
-3, -3.778606, -6.207452, 1, -0.5, 0.5, 0.5,
-3, -3.778606, -6.207452, 1, 1.5, 0.5, 0.5,
-3, -3.778606, -6.207452, 0, 1.5, 0.5, 0.5,
-2, -3.778606, -6.207452, 0, -0.5, 0.5, 0.5,
-2, -3.778606, -6.207452, 1, -0.5, 0.5, 0.5,
-2, -3.778606, -6.207452, 1, 1.5, 0.5, 0.5,
-2, -3.778606, -6.207452, 0, 1.5, 0.5, 0.5,
-1, -3.778606, -6.207452, 0, -0.5, 0.5, 0.5,
-1, -3.778606, -6.207452, 1, -0.5, 0.5, 0.5,
-1, -3.778606, -6.207452, 1, 1.5, 0.5, 0.5,
-1, -3.778606, -6.207452, 0, 1.5, 0.5, 0.5,
0, -3.778606, -6.207452, 0, -0.5, 0.5, 0.5,
0, -3.778606, -6.207452, 1, -0.5, 0.5, 0.5,
0, -3.778606, -6.207452, 1, 1.5, 0.5, 0.5,
0, -3.778606, -6.207452, 0, 1.5, 0.5, 0.5,
1, -3.778606, -6.207452, 0, -0.5, 0.5, 0.5,
1, -3.778606, -6.207452, 1, -0.5, 0.5, 0.5,
1, -3.778606, -6.207452, 1, 1.5, 0.5, 0.5,
1, -3.778606, -6.207452, 0, 1.5, 0.5, 0.5,
2, -3.778606, -6.207452, 0, -0.5, 0.5, 0.5,
2, -3.778606, -6.207452, 1, -0.5, 0.5, 0.5,
2, -3.778606, -6.207452, 1, 1.5, 0.5, 0.5,
2, -3.778606, -6.207452, 0, 1.5, 0.5, 0.5,
3, -3.778606, -6.207452, 0, -0.5, 0.5, 0.5,
3, -3.778606, -6.207452, 1, -0.5, 0.5, 0.5,
3, -3.778606, -6.207452, 1, 1.5, 0.5, 0.5,
3, -3.778606, -6.207452, 0, 1.5, 0.5, 0.5
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
-3.231089, -3, -5.359448,
-3.231089, 2, -5.359448,
-3.231089, -3, -5.359448,
-3.399184, -3, -5.642116,
-3.231089, -2, -5.359448,
-3.399184, -2, -5.642116,
-3.231089, -1, -5.359448,
-3.399184, -1, -5.642116,
-3.231089, 0, -5.359448,
-3.399184, 0, -5.642116,
-3.231089, 1, -5.359448,
-3.399184, 1, -5.642116,
-3.231089, 2, -5.359448,
-3.399184, 2, -5.642116
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
-3.735374, -3, -6.207452, 0, -0.5, 0.5, 0.5,
-3.735374, -3, -6.207452, 1, -0.5, 0.5, 0.5,
-3.735374, -3, -6.207452, 1, 1.5, 0.5, 0.5,
-3.735374, -3, -6.207452, 0, 1.5, 0.5, 0.5,
-3.735374, -2, -6.207452, 0, -0.5, 0.5, 0.5,
-3.735374, -2, -6.207452, 1, -0.5, 0.5, 0.5,
-3.735374, -2, -6.207452, 1, 1.5, 0.5, 0.5,
-3.735374, -2, -6.207452, 0, 1.5, 0.5, 0.5,
-3.735374, -1, -6.207452, 0, -0.5, 0.5, 0.5,
-3.735374, -1, -6.207452, 1, -0.5, 0.5, 0.5,
-3.735374, -1, -6.207452, 1, 1.5, 0.5, 0.5,
-3.735374, -1, -6.207452, 0, 1.5, 0.5, 0.5,
-3.735374, 0, -6.207452, 0, -0.5, 0.5, 0.5,
-3.735374, 0, -6.207452, 1, -0.5, 0.5, 0.5,
-3.735374, 0, -6.207452, 1, 1.5, 0.5, 0.5,
-3.735374, 0, -6.207452, 0, 1.5, 0.5, 0.5,
-3.735374, 1, -6.207452, 0, -0.5, 0.5, 0.5,
-3.735374, 1, -6.207452, 1, -0.5, 0.5, 0.5,
-3.735374, 1, -6.207452, 1, 1.5, 0.5, 0.5,
-3.735374, 1, -6.207452, 0, 1.5, 0.5, 0.5,
-3.735374, 2, -6.207452, 0, -0.5, 0.5, 0.5,
-3.735374, 2, -6.207452, 1, -0.5, 0.5, 0.5,
-3.735374, 2, -6.207452, 1, 1.5, 0.5, 0.5,
-3.735374, 2, -6.207452, 0, 1.5, 0.5, 0.5
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
-3.231089, -3.307761, -4,
-3.231089, -3.307761, 4,
-3.231089, -3.307761, -4,
-3.399184, -3.46471, -4,
-3.231089, -3.307761, -2,
-3.399184, -3.46471, -2,
-3.231089, -3.307761, 0,
-3.399184, -3.46471, 0,
-3.231089, -3.307761, 2,
-3.399184, -3.46471, 2,
-3.231089, -3.307761, 4,
-3.399184, -3.46471, 4
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
-3.735374, -3.778606, -4, 0, -0.5, 0.5, 0.5,
-3.735374, -3.778606, -4, 1, -0.5, 0.5, 0.5,
-3.735374, -3.778606, -4, 1, 1.5, 0.5, 0.5,
-3.735374, -3.778606, -4, 0, 1.5, 0.5, 0.5,
-3.735374, -3.778606, -2, 0, -0.5, 0.5, 0.5,
-3.735374, -3.778606, -2, 1, -0.5, 0.5, 0.5,
-3.735374, -3.778606, -2, 1, 1.5, 0.5, 0.5,
-3.735374, -3.778606, -2, 0, 1.5, 0.5, 0.5,
-3.735374, -3.778606, 0, 0, -0.5, 0.5, 0.5,
-3.735374, -3.778606, 0, 1, -0.5, 0.5, 0.5,
-3.735374, -3.778606, 0, 1, 1.5, 0.5, 0.5,
-3.735374, -3.778606, 0, 0, 1.5, 0.5, 0.5,
-3.735374, -3.778606, 2, 0, -0.5, 0.5, 0.5,
-3.735374, -3.778606, 2, 1, -0.5, 0.5, 0.5,
-3.735374, -3.778606, 2, 1, 1.5, 0.5, 0.5,
-3.735374, -3.778606, 2, 0, 1.5, 0.5, 0.5,
-3.735374, -3.778606, 4, 0, -0.5, 0.5, 0.5,
-3.735374, -3.778606, 4, 1, -0.5, 0.5, 0.5,
-3.735374, -3.778606, 4, 1, 1.5, 0.5, 0.5,
-3.735374, -3.778606, 4, 0, 1.5, 0.5, 0.5
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
-3.231089, -3.307761, -5.359448,
-3.231089, 2.970168, -5.359448,
-3.231089, -3.307761, 5.947268,
-3.231089, 2.970168, 5.947268,
-3.231089, -3.307761, -5.359448,
-3.231089, -3.307761, 5.947268,
-3.231089, 2.970168, -5.359448,
-3.231089, 2.970168, 5.947268,
-3.231089, -3.307761, -5.359448,
3.492711, -3.307761, -5.359448,
-3.231089, -3.307761, 5.947268,
3.492711, -3.307761, 5.947268,
-3.231089, 2.970168, -5.359448,
3.492711, 2.970168, -5.359448,
-3.231089, 2.970168, 5.947268,
3.492711, 2.970168, 5.947268,
3.492711, -3.307761, -5.359448,
3.492711, 2.970168, -5.359448,
3.492711, -3.307761, 5.947268,
3.492711, 2.970168, 5.947268,
3.492711, -3.307761, -5.359448,
3.492711, -3.307761, 5.947268,
3.492711, 2.970168, -5.359448,
3.492711, 2.970168, 5.947268
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
var radius = 7.783373;
var distance = 34.62911;
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
mvMatrix.translate( -0.1308106, 0.1687967, -0.2939103 );
mvMatrix.scale( 1.251604, 1.340495, 0.7442952 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.62911);
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
bromophos<-read.table("bromophos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bromophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromophos' not found
```

```r
y<-bromophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromophos' not found
```

```r
z<-bromophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromophos' not found
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
-3.13317, -0.8358406, -0.5856948, 0, 0, 1, 1, 1,
-2.988545, 1.089326, -0.1534331, 1, 0, 0, 1, 1,
-2.981017, 0.5256405, 0.2075862, 1, 0, 0, 1, 1,
-2.93211, -0.06457532, -0.9553782, 1, 0, 0, 1, 1,
-2.748199, 1.744071, -1.595197, 1, 0, 0, 1, 1,
-2.724611, -1.144528, -3.129707, 1, 0, 0, 1, 1,
-2.64059, -0.4916593, -2.964123, 0, 0, 0, 1, 1,
-2.485397, 0.9783337, -3.629539, 0, 0, 0, 1, 1,
-2.47146, -1.650556, -2.278893, 0, 0, 0, 1, 1,
-2.455456, 0.6798812, -0.5792542, 0, 0, 0, 1, 1,
-2.423554, 0.9093097, -0.3331626, 0, 0, 0, 1, 1,
-2.42186, 1.849272, -2.705428, 0, 0, 0, 1, 1,
-2.279953, -0.5544237, -2.622911, 0, 0, 0, 1, 1,
-2.246827, 1.714434, -1.431726, 1, 1, 1, 1, 1,
-2.23145, -0.8325965, 0.246876, 1, 1, 1, 1, 1,
-2.209362, 0.06520119, -1.273666, 1, 1, 1, 1, 1,
-2.187517, -0.6527843, -1.241916, 1, 1, 1, 1, 1,
-2.173587, -0.6789657, -2.227423, 1, 1, 1, 1, 1,
-2.156113, -1.361374, -1.199179, 1, 1, 1, 1, 1,
-2.131294, 0.9786596, -1.770968, 1, 1, 1, 1, 1,
-2.130932, -0.1861926, -0.8764467, 1, 1, 1, 1, 1,
-2.091563, 1.360436, -0.4603232, 1, 1, 1, 1, 1,
-2.088542, -0.9100462, -1.27623, 1, 1, 1, 1, 1,
-2.07946, 0.2392544, -1.589098, 1, 1, 1, 1, 1,
-2.079402, 0.791594, 0.2204743, 1, 1, 1, 1, 1,
-2.065212, -0.4199568, -2.317006, 1, 1, 1, 1, 1,
-2.0638, 0.4110801, -1.85625, 1, 1, 1, 1, 1,
-2.037248, -0.8196967, -2.541567, 1, 1, 1, 1, 1,
-2.02477, -1.266308, -0.7687111, 0, 0, 1, 1, 1,
-2.011682, 1.165651, -0.601396, 1, 0, 0, 1, 1,
-1.997329, 0.2897598, -2.428466, 1, 0, 0, 1, 1,
-1.990786, 1.516228, -1.463925, 1, 0, 0, 1, 1,
-1.957969, -0.470566, -2.952487, 1, 0, 0, 1, 1,
-1.957825, -1.431714, -4.066627, 1, 0, 0, 1, 1,
-1.956663, -0.4777672, -1.596489, 0, 0, 0, 1, 1,
-1.904209, 1.385881, -0.6379832, 0, 0, 0, 1, 1,
-1.893397, 0.9969387, -1.109749, 0, 0, 0, 1, 1,
-1.867615, 0.02461276, -1.123579, 0, 0, 0, 1, 1,
-1.857855, -0.923139, -2.638346, 0, 0, 0, 1, 1,
-1.804675, -0.7136291, -2.772353, 0, 0, 0, 1, 1,
-1.794168, 2.430878, -1.292588, 0, 0, 0, 1, 1,
-1.773388, 1.64914, -1.338115, 1, 1, 1, 1, 1,
-1.756091, 1.552937, 1.186465, 1, 1, 1, 1, 1,
-1.735046, 0.8493304, -0.758766, 1, 1, 1, 1, 1,
-1.734038, 1.046869, 0.67466, 1, 1, 1, 1, 1,
-1.722346, 1.07595, -0.2926804, 1, 1, 1, 1, 1,
-1.712216, -1.391567, -3.044334, 1, 1, 1, 1, 1,
-1.701046, 0.7627929, 1.241656, 1, 1, 1, 1, 1,
-1.68935, 1.730618, -1.552657, 1, 1, 1, 1, 1,
-1.677575, 0.3997651, -1.109442, 1, 1, 1, 1, 1,
-1.675059, -0.8707405, -2.019589, 1, 1, 1, 1, 1,
-1.63666, 0.1269165, -1.642424, 1, 1, 1, 1, 1,
-1.60981, -0.803821, -2.234389, 1, 1, 1, 1, 1,
-1.609357, 1.308833, -0.3358794, 1, 1, 1, 1, 1,
-1.604784, -0.200597, -1.780994, 1, 1, 1, 1, 1,
-1.599941, 0.4451524, -0.4201781, 1, 1, 1, 1, 1,
-1.596843, 1.387431, -1.624066, 0, 0, 1, 1, 1,
-1.59071, -1.280239, -0.671602, 1, 0, 0, 1, 1,
-1.584329, -2.627858, -2.585724, 1, 0, 0, 1, 1,
-1.582577, 1.324354, -1.687118, 1, 0, 0, 1, 1,
-1.57769, -1.32595, -2.136857, 1, 0, 0, 1, 1,
-1.577593, 0.5814244, -0.7424263, 1, 0, 0, 1, 1,
-1.565343, -0.03350216, -2.689342, 0, 0, 0, 1, 1,
-1.56038, -1.201092, -2.166407, 0, 0, 0, 1, 1,
-1.556698, 0.4810708, -2.110698, 0, 0, 0, 1, 1,
-1.551842, 0.2457779, 0.3602586, 0, 0, 0, 1, 1,
-1.543407, -0.02016208, -1.302223, 0, 0, 0, 1, 1,
-1.542539, 0.9642313, -0.9013484, 0, 0, 0, 1, 1,
-1.53687, 0.8860407, -1.40375, 0, 0, 0, 1, 1,
-1.521117, -2.290725, -2.772235, 1, 1, 1, 1, 1,
-1.515112, 1.85199, -0.128626, 1, 1, 1, 1, 1,
-1.511737, -1.075561, -1.766081, 1, 1, 1, 1, 1,
-1.503601, -1.140992, -3.783397, 1, 1, 1, 1, 1,
-1.488784, 0.6200757, 0.1117863, 1, 1, 1, 1, 1,
-1.488622, -0.3113036, -0.528357, 1, 1, 1, 1, 1,
-1.481216, 2.114913, -1.979573, 1, 1, 1, 1, 1,
-1.463643, -0.8954219, -4.275929, 1, 1, 1, 1, 1,
-1.456383, 0.7172252, -0.8479895, 1, 1, 1, 1, 1,
-1.452341, -2.012649, -2.200286, 1, 1, 1, 1, 1,
-1.44773, 0.6454526, -0.798393, 1, 1, 1, 1, 1,
-1.441112, 1.127535, -0.5393431, 1, 1, 1, 1, 1,
-1.411932, 0.2128894, -0.8910011, 1, 1, 1, 1, 1,
-1.409322, -0.06695989, -1.793959, 1, 1, 1, 1, 1,
-1.394502, 1.347639, -1.241071, 1, 1, 1, 1, 1,
-1.386762, 0.4352672, -1.056549, 0, 0, 1, 1, 1,
-1.386111, 1.699615, -0.1084994, 1, 0, 0, 1, 1,
-1.384169, -0.1144219, -2.081671, 1, 0, 0, 1, 1,
-1.378614, -0.6340567, -2.564831, 1, 0, 0, 1, 1,
-1.37545, 0.295251, -2.027173, 1, 0, 0, 1, 1,
-1.370105, 0.1202167, -1.033423, 1, 0, 0, 1, 1,
-1.329787, -0.4655546, -1.052612, 0, 0, 0, 1, 1,
-1.329248, 0.9312133, -2.46809, 0, 0, 0, 1, 1,
-1.328737, 0.4000738, -1.446696, 0, 0, 0, 1, 1,
-1.324528, -1.376311, -2.226605, 0, 0, 0, 1, 1,
-1.319131, 1.816224, -0.6962693, 0, 0, 0, 1, 1,
-1.316378, -0.8204309, -1.036634, 0, 0, 0, 1, 1,
-1.309264, 0.2270231, 0.05745254, 0, 0, 0, 1, 1,
-1.300474, -1.604399, -3.973689, 1, 1, 1, 1, 1,
-1.300216, -1.356738, -1.669711, 1, 1, 1, 1, 1,
-1.295674, -0.5543258, -3.49437, 1, 1, 1, 1, 1,
-1.290036, -1.831973, -1.517615, 1, 1, 1, 1, 1,
-1.285594, -1.071061, -2.411016, 1, 1, 1, 1, 1,
-1.281724, 0.3804173, 0.6189508, 1, 1, 1, 1, 1,
-1.279244, -2.627127, -1.598998, 1, 1, 1, 1, 1,
-1.276051, 1.176818, 0.2173945, 1, 1, 1, 1, 1,
-1.262469, 1.027068, -0.4025451, 1, 1, 1, 1, 1,
-1.256409, -0.1678164, -0.8172543, 1, 1, 1, 1, 1,
-1.255109, 0.9351622, -2.749518, 1, 1, 1, 1, 1,
-1.239718, 1.328646, -2.287895, 1, 1, 1, 1, 1,
-1.237859, 0.2786635, -2.230552, 1, 1, 1, 1, 1,
-1.223943, 0.7427461, -0.02234222, 1, 1, 1, 1, 1,
-1.223587, 0.2457755, -1.09701, 1, 1, 1, 1, 1,
-1.210262, 0.01245477, -2.261421, 0, 0, 1, 1, 1,
-1.210107, -1.001619, -1.178068, 1, 0, 0, 1, 1,
-1.198107, -1.123037, -2.095924, 1, 0, 0, 1, 1,
-1.197864, -0.4513897, -2.604525, 1, 0, 0, 1, 1,
-1.195675, -0.6679243, -0.6328743, 1, 0, 0, 1, 1,
-1.194553, 1.609966, -2.214872, 1, 0, 0, 1, 1,
-1.188416, 0.9218093, -1.051694, 0, 0, 0, 1, 1,
-1.186621, 2.22365, -1.243988, 0, 0, 0, 1, 1,
-1.174189, -0.4384988, -2.34375, 0, 0, 0, 1, 1,
-1.172381, 0.862059, -1.429654, 0, 0, 0, 1, 1,
-1.168119, -1.217097, -2.784333, 0, 0, 0, 1, 1,
-1.16804, -0.7569061, -3.308883, 0, 0, 0, 1, 1,
-1.166227, 1.605427, -0.4248348, 0, 0, 0, 1, 1,
-1.163017, -0.1670309, -2.842735, 1, 1, 1, 1, 1,
-1.134839, -0.9737638, -3.285796, 1, 1, 1, 1, 1,
-1.124836, -0.7628362, -1.638725, 1, 1, 1, 1, 1,
-1.121517, 0.437229, 0.5344653, 1, 1, 1, 1, 1,
-1.114331, -0.728187, -0.410717, 1, 1, 1, 1, 1,
-1.114201, -1.97269, -3.283694, 1, 1, 1, 1, 1,
-1.112084, -0.5154185, -1.245526, 1, 1, 1, 1, 1,
-1.10882, -0.831119, -3.058847, 1, 1, 1, 1, 1,
-1.107338, 0.7530696, -3.559751, 1, 1, 1, 1, 1,
-1.102615, 0.2215481, -0.2171571, 1, 1, 1, 1, 1,
-1.095864, -0.5243757, -0.6598088, 1, 1, 1, 1, 1,
-1.090958, 0.6185616, 0.2275635, 1, 1, 1, 1, 1,
-1.08428, -0.2213311, -1.970907, 1, 1, 1, 1, 1,
-1.083047, -0.1840064, -2.86195, 1, 1, 1, 1, 1,
-1.081013, -0.6338688, -1.034364, 1, 1, 1, 1, 1,
-1.073124, -0.4160214, -2.032328, 0, 0, 1, 1, 1,
-1.070964, -0.2953984, -1.634339, 1, 0, 0, 1, 1,
-1.067788, -1.45421, -1.653031, 1, 0, 0, 1, 1,
-1.062054, -0.04024529, -0.8366034, 1, 0, 0, 1, 1,
-1.058415, -0.5931143, -1.437465, 1, 0, 0, 1, 1,
-1.057804, -1.900225, -3.58978, 1, 0, 0, 1, 1,
-1.047217, 0.540813, 0.8765646, 0, 0, 0, 1, 1,
-1.037891, 0.6376491, -0.1062284, 0, 0, 0, 1, 1,
-1.033891, 0.1947711, -0.6179618, 0, 0, 0, 1, 1,
-1.033723, -0.76946, -3.764857, 0, 0, 0, 1, 1,
-1.031326, -0.1808183, -1.581147, 0, 0, 0, 1, 1,
-1.029243, 0.2135247, -3.825437, 0, 0, 0, 1, 1,
-1.028517, 0.6628157, -1.513577, 0, 0, 0, 1, 1,
-1.028429, 0.2739276, -2.087879, 1, 1, 1, 1, 1,
-1.024647, -0.09876788, -2.060535, 1, 1, 1, 1, 1,
-1.021566, 0.9813946, -1.666523, 1, 1, 1, 1, 1,
-1.00979, 0.0184719, -2.326817, 1, 1, 1, 1, 1,
-1.009587, -0.03443023, -2.335474, 1, 1, 1, 1, 1,
-1.006754, -0.06937575, -2.184829, 1, 1, 1, 1, 1,
-0.997866, 0.2702172, -1.974947, 1, 1, 1, 1, 1,
-0.9863246, -0.3239707, -2.665742, 1, 1, 1, 1, 1,
-0.9783083, -1.036816, -2.65775, 1, 1, 1, 1, 1,
-0.9746431, -1.135994, -0.8504775, 1, 1, 1, 1, 1,
-0.9718745, -0.3866124, -1.227073, 1, 1, 1, 1, 1,
-0.969721, -0.1495878, -1.9241, 1, 1, 1, 1, 1,
-0.9481452, -0.7701857, -2.849939, 1, 1, 1, 1, 1,
-0.9437401, -1.321749, -1.618373, 1, 1, 1, 1, 1,
-0.940836, 0.9165299, -0.9578639, 1, 1, 1, 1, 1,
-0.9350002, -0.9867786, -1.082471, 0, 0, 1, 1, 1,
-0.9323763, 0.3638301, -1.507125, 1, 0, 0, 1, 1,
-0.9322577, 0.4656447, -1.882027, 1, 0, 0, 1, 1,
-0.9278519, -0.8683832, -2.425542, 1, 0, 0, 1, 1,
-0.9237068, 0.04877776, -0.470874, 1, 0, 0, 1, 1,
-0.9219544, -0.6195425, -1.874042, 1, 0, 0, 1, 1,
-0.9190179, 0.02609763, -1.57275, 0, 0, 0, 1, 1,
-0.9185412, -0.4563091, -3.094485, 0, 0, 0, 1, 1,
-0.9158411, -1.336781, -1.000719, 0, 0, 0, 1, 1,
-0.9139643, 1.736383, -0.1028851, 0, 0, 0, 1, 1,
-0.9096961, -1.384356, -2.634944, 0, 0, 0, 1, 1,
-0.9090108, 0.002268938, -1.154759, 0, 0, 0, 1, 1,
-0.8940636, 0.3611545, 0.3053927, 0, 0, 0, 1, 1,
-0.8895445, 1.894994, -0.1727663, 1, 1, 1, 1, 1,
-0.884903, 1.092978, -1.43679, 1, 1, 1, 1, 1,
-0.8847199, -0.02016071, -0.7940246, 1, 1, 1, 1, 1,
-0.8838362, 0.3820567, -2.122089, 1, 1, 1, 1, 1,
-0.8832187, -0.1337964, -2.959707, 1, 1, 1, 1, 1,
-0.882409, -0.545751, -2.905927, 1, 1, 1, 1, 1,
-0.8781698, -0.4566356, -2.103062, 1, 1, 1, 1, 1,
-0.8770931, 1.568627, -0.3785264, 1, 1, 1, 1, 1,
-0.8770174, 0.7889992, -2.374296, 1, 1, 1, 1, 1,
-0.868851, -0.3386475, -2.081225, 1, 1, 1, 1, 1,
-0.860936, 2.255557, -1.018226, 1, 1, 1, 1, 1,
-0.8565841, 0.301754, -1.483852, 1, 1, 1, 1, 1,
-0.8535187, 0.9772475, 0.751533, 1, 1, 1, 1, 1,
-0.8519604, -0.5526168, 0.6131009, 1, 1, 1, 1, 1,
-0.8498625, 0.6417444, -0.696696, 1, 1, 1, 1, 1,
-0.8493445, -1.10726, 0.1158692, 0, 0, 1, 1, 1,
-0.8492193, 1.586308, -0.9867123, 1, 0, 0, 1, 1,
-0.8475807, -1.146344, -1.75503, 1, 0, 0, 1, 1,
-0.8424055, -0.9792965, -1.645746, 1, 0, 0, 1, 1,
-0.8419487, 0.9247136, 0.7973602, 1, 0, 0, 1, 1,
-0.8389981, 1.011657, 0.4728021, 1, 0, 0, 1, 1,
-0.833773, 1.24425, -0.8788064, 0, 0, 0, 1, 1,
-0.8245432, 0.6288024, -1.522779, 0, 0, 0, 1, 1,
-0.8222338, -0.6828256, -2.007072, 0, 0, 0, 1, 1,
-0.8074971, 0.4219368, -0.6397212, 0, 0, 0, 1, 1,
-0.8029572, -1.114838, -2.142931, 0, 0, 0, 1, 1,
-0.8021498, -1.751001, -2.935039, 0, 0, 0, 1, 1,
-0.7998639, -0.553259, -1.846007, 0, 0, 0, 1, 1,
-0.797821, 2.249927, -0.02947433, 1, 1, 1, 1, 1,
-0.7917801, 0.4931382, -0.5238547, 1, 1, 1, 1, 1,
-0.7773584, -0.8949075, -1.666259, 1, 1, 1, 1, 1,
-0.7756933, 0.1425388, -2.20933, 1, 1, 1, 1, 1,
-0.7751084, -0.04373179, -1.000738, 1, 1, 1, 1, 1,
-0.7743757, 0.8966563, 0.2433544, 1, 1, 1, 1, 1,
-0.7703893, 0.6514096, -1.718078, 1, 1, 1, 1, 1,
-0.7694224, 0.4708183, 0.3476556, 1, 1, 1, 1, 1,
-0.7683679, -1.425752, -4.164646, 1, 1, 1, 1, 1,
-0.7652534, 0.3157929, -1.363609, 1, 1, 1, 1, 1,
-0.7582472, -0.4541084, -2.673378, 1, 1, 1, 1, 1,
-0.7569581, 0.04085982, -0.192467, 1, 1, 1, 1, 1,
-0.7495556, -0.4017873, -3.491896, 1, 1, 1, 1, 1,
-0.7463326, 0.5062335, -0.7819409, 1, 1, 1, 1, 1,
-0.7395946, 0.7353176, -2.049099, 1, 1, 1, 1, 1,
-0.7371287, 0.5887628, 0.04440317, 0, 0, 1, 1, 1,
-0.7359731, 1.296299, -1.026921, 1, 0, 0, 1, 1,
-0.7308662, 1.191031, -0.4877437, 1, 0, 0, 1, 1,
-0.7282553, 0.2329398, -1.235462, 1, 0, 0, 1, 1,
-0.7211308, 0.2205379, -1.039084, 1, 0, 0, 1, 1,
-0.719717, -1.683064, -2.141171, 1, 0, 0, 1, 1,
-0.7150916, -0.7308615, -0.127287, 0, 0, 0, 1, 1,
-0.7127945, 2.208126, 0.2096539, 0, 0, 0, 1, 1,
-0.712006, -1.06372, -3.274103, 0, 0, 0, 1, 1,
-0.7112253, 1.282458, 1.094466, 0, 0, 0, 1, 1,
-0.7101631, 1.932353, -1.58804, 0, 0, 0, 1, 1,
-0.7030593, 0.1171497, -1.289047, 0, 0, 0, 1, 1,
-0.6976344, 2.354886, -0.3148155, 0, 0, 0, 1, 1,
-0.6966953, -1.574184, -2.161093, 1, 1, 1, 1, 1,
-0.6962197, -0.5342304, -4.322962, 1, 1, 1, 1, 1,
-0.6941074, -0.2695151, -2.539275, 1, 1, 1, 1, 1,
-0.6891256, 0.2219932, -1.099409, 1, 1, 1, 1, 1,
-0.6868733, 0.9325115, -1.707085, 1, 1, 1, 1, 1,
-0.6853686, -0.7930881, -1.510904, 1, 1, 1, 1, 1,
-0.6818749, -0.1798901, -0.7967351, 1, 1, 1, 1, 1,
-0.6801794, 1.530177, -3.119899, 1, 1, 1, 1, 1,
-0.6794932, -0.2053728, -3.314125, 1, 1, 1, 1, 1,
-0.6705583, 0.372072, -2.00389, 1, 1, 1, 1, 1,
-0.6683415, 1.514051, -0.5801908, 1, 1, 1, 1, 1,
-0.6653233, -1.002757, -2.825289, 1, 1, 1, 1, 1,
-0.6611246, 0.6971487, -0.09140422, 1, 1, 1, 1, 1,
-0.650533, -0.3761697, -0.7879074, 1, 1, 1, 1, 1,
-0.6500583, -1.047929, -1.109343, 1, 1, 1, 1, 1,
-0.6498049, -0.7126046, -2.781489, 0, 0, 1, 1, 1,
-0.6482325, 1.26158, 1.748014, 1, 0, 0, 1, 1,
-0.6409978, -0.5231056, -3.398993, 1, 0, 0, 1, 1,
-0.6402465, 1.544531, -0.8112086, 1, 0, 0, 1, 1,
-0.6400166, 1.261221, 0.7311361, 1, 0, 0, 1, 1,
-0.6368647, -0.8679778, -3.285833, 1, 0, 0, 1, 1,
-0.6265415, -0.4459926, -2.008444, 0, 0, 0, 1, 1,
-0.6241454, -0.8038234, -0.3820427, 0, 0, 0, 1, 1,
-0.6230295, -1.539462, -2.119646, 0, 0, 0, 1, 1,
-0.6187893, -1.076231, -3.34081, 0, 0, 0, 1, 1,
-0.6165344, -0.005326457, -2.451178, 0, 0, 0, 1, 1,
-0.6150847, 2.176622, -0.2039886, 0, 0, 0, 1, 1,
-0.6124221, 0.7299451, -3.961947, 0, 0, 0, 1, 1,
-0.6116067, 2.436853, -0.9705163, 1, 1, 1, 1, 1,
-0.6110854, 1.056977, 0.2482307, 1, 1, 1, 1, 1,
-0.6109461, 0.1480801, -0.961192, 1, 1, 1, 1, 1,
-0.5993115, 2.132499, 1.173123, 1, 1, 1, 1, 1,
-0.5861174, -1.269437, -1.778976, 1, 1, 1, 1, 1,
-0.5856978, -1.256797, -2.172414, 1, 1, 1, 1, 1,
-0.5800369, 0.5730728, -2.368763, 1, 1, 1, 1, 1,
-0.5787663, 0.08495502, -1.863117, 1, 1, 1, 1, 1,
-0.5766722, 0.883637, -0.7072881, 1, 1, 1, 1, 1,
-0.5752673, 0.2322851, -1.501794, 1, 1, 1, 1, 1,
-0.5740938, 0.4689549, -0.9713258, 1, 1, 1, 1, 1,
-0.5727674, 1.004877, -1.183833, 1, 1, 1, 1, 1,
-0.5655449, 0.1233455, -1.213227, 1, 1, 1, 1, 1,
-0.5654415, 0.1294822, 0.8176882, 1, 1, 1, 1, 1,
-0.5639882, -0.781007, -3.614542, 1, 1, 1, 1, 1,
-0.5638094, -0.8732913, -0.5323065, 0, 0, 1, 1, 1,
-0.5631315, -0.9456315, -2.51482, 1, 0, 0, 1, 1,
-0.5618713, 0.1015932, -0.1140871, 1, 0, 0, 1, 1,
-0.5575706, 0.804762, -1.051646, 1, 0, 0, 1, 1,
-0.5497611, 1.674373, 0.8990147, 1, 0, 0, 1, 1,
-0.5431497, 0.8598179, -0.03082885, 1, 0, 0, 1, 1,
-0.5416821, -0.980725, -2.79577, 0, 0, 0, 1, 1,
-0.5398278, -1.374786, -1.008915, 0, 0, 0, 1, 1,
-0.5368294, 0.5886825, 0.5053273, 0, 0, 0, 1, 1,
-0.528687, 0.8477977, -1.150694, 0, 0, 0, 1, 1,
-0.527982, -0.2331619, -2.579144, 0, 0, 0, 1, 1,
-0.5150164, -0.07298517, -1.784088, 0, 0, 0, 1, 1,
-0.5140471, -2.040285, -4.376076, 0, 0, 0, 1, 1,
-0.5085261, 0.1287646, -0.2131502, 1, 1, 1, 1, 1,
-0.5067867, -0.1902574, -1.732442, 1, 1, 1, 1, 1,
-0.5056232, 1.199243, -1.711963, 1, 1, 1, 1, 1,
-0.4984646, 0.4904486, -0.8239259, 1, 1, 1, 1, 1,
-0.4979134, 2.027176, -0.8819568, 1, 1, 1, 1, 1,
-0.4964209, -1.573126, -3.247154, 1, 1, 1, 1, 1,
-0.4963754, 1.086905, 2.063245, 1, 1, 1, 1, 1,
-0.4903995, -0.6067165, -4.308691, 1, 1, 1, 1, 1,
-0.4903763, 1.167131, -0.1154082, 1, 1, 1, 1, 1,
-0.4868974, -0.3945004, -1.066414, 1, 1, 1, 1, 1,
-0.4847346, -2.142093, -3.914582, 1, 1, 1, 1, 1,
-0.4834908, 0.8241633, -2.260691, 1, 1, 1, 1, 1,
-0.4825813, 0.561092, -1.505846, 1, 1, 1, 1, 1,
-0.4824418, -0.04545455, -2.049852, 1, 1, 1, 1, 1,
-0.4779433, 1.938611, 0.1201343, 1, 1, 1, 1, 1,
-0.4765951, -1.319228, -4.431108, 0, 0, 1, 1, 1,
-0.4745705, -1.242245, -3.049254, 1, 0, 0, 1, 1,
-0.4725909, 0.6014694, 1.654393, 1, 0, 0, 1, 1,
-0.4712285, 0.8823872, -0.8457112, 1, 0, 0, 1, 1,
-0.4691176, 0.04145307, -1.391709, 1, 0, 0, 1, 1,
-0.4650244, -0.5607501, -2.66443, 1, 0, 0, 1, 1,
-0.463275, 2.547786, 0.2251812, 0, 0, 0, 1, 1,
-0.4587772, -1.38572, -2.583454, 0, 0, 0, 1, 1,
-0.458136, 0.2572145, -0.2360238, 0, 0, 0, 1, 1,
-0.4576347, 1.487411, -0.242154, 0, 0, 0, 1, 1,
-0.4421638, -0.3382633, -3.504003, 0, 0, 0, 1, 1,
-0.4421315, -1.905457, -3.446371, 0, 0, 0, 1, 1,
-0.4415565, -0.4300652, -2.667529, 0, 0, 0, 1, 1,
-0.44126, -0.2782543, -3.374902, 1, 1, 1, 1, 1,
-0.4355158, -0.327947, -2.730024, 1, 1, 1, 1, 1,
-0.4324849, 0.7802313, -0.4887142, 1, 1, 1, 1, 1,
-0.430865, 1.62719, -0.1024597, 1, 1, 1, 1, 1,
-0.4291154, 1.4523, 0.8717638, 1, 1, 1, 1, 1,
-0.4251743, -0.5596901, -2.133722, 1, 1, 1, 1, 1,
-0.4234581, -2.386024, -1.549451, 1, 1, 1, 1, 1,
-0.4233432, -0.5620928, -5.194787, 1, 1, 1, 1, 1,
-0.4223165, 0.9026387, -1.417226, 1, 1, 1, 1, 1,
-0.4210474, -0.260581, -2.093957, 1, 1, 1, 1, 1,
-0.4192398, 0.8533238, -0.6363487, 1, 1, 1, 1, 1,
-0.4137559, -0.3306891, -1.670659, 1, 1, 1, 1, 1,
-0.4109013, 0.01491136, -1.962803, 1, 1, 1, 1, 1,
-0.410527, 0.01862706, -0.4217346, 1, 1, 1, 1, 1,
-0.4097393, -1.258959, -2.457646, 1, 1, 1, 1, 1,
-0.4024382, -0.2157103, -0.09654828, 0, 0, 1, 1, 1,
-0.4022543, 0.8534409, -0.9148149, 1, 0, 0, 1, 1,
-0.4004806, 1.12152, -0.7501743, 1, 0, 0, 1, 1,
-0.3992742, -1.078127, -2.811214, 1, 0, 0, 1, 1,
-0.3971945, -1.196503, -3.321835, 1, 0, 0, 1, 1,
-0.395556, -1.043415, -4.978341, 1, 0, 0, 1, 1,
-0.3933568, 0.2112815, -2.256259, 0, 0, 0, 1, 1,
-0.3925698, -0.3907363, -1.393761, 0, 0, 0, 1, 1,
-0.3917393, -1.981247, -1.847935, 0, 0, 0, 1, 1,
-0.3915462, 0.09728318, -1.778225, 0, 0, 0, 1, 1,
-0.3867724, 0.7689749, -0.7032485, 0, 0, 0, 1, 1,
-0.3835185, 0.6010319, -0.7631673, 0, 0, 0, 1, 1,
-0.3834868, 1.941949, 0.4328838, 0, 0, 0, 1, 1,
-0.3819588, 0.8707594, 1.637828, 1, 1, 1, 1, 1,
-0.3785697, -0.006646457, -1.828618, 1, 1, 1, 1, 1,
-0.3782327, -0.03871938, -2.821035, 1, 1, 1, 1, 1,
-0.3778592, -0.9137512, -3.635859, 1, 1, 1, 1, 1,
-0.3712801, 1.189936, -0.4511164, 1, 1, 1, 1, 1,
-0.363732, 1.274973, -1.157061, 1, 1, 1, 1, 1,
-0.3607614, -0.6868895, -4.22999, 1, 1, 1, 1, 1,
-0.3605873, -0.2215092, -0.9232937, 1, 1, 1, 1, 1,
-0.3566444, 0.4288566, -0.0475033, 1, 1, 1, 1, 1,
-0.3561242, -1.273022, -1.33531, 1, 1, 1, 1, 1,
-0.3524355, -1.010214, -0.8859328, 1, 1, 1, 1, 1,
-0.3518583, -0.6101044, -2.487676, 1, 1, 1, 1, 1,
-0.3478394, 0.976142, -1.176877, 1, 1, 1, 1, 1,
-0.3452474, 0.02445688, -0.4060743, 1, 1, 1, 1, 1,
-0.3367853, 1.050097, 0.8834513, 1, 1, 1, 1, 1,
-0.3273189, 1.540304, 0.925621, 0, 0, 1, 1, 1,
-0.3248931, 0.7194459, 1.513264, 1, 0, 0, 1, 1,
-0.3242218, 0.6143514, 0.3810323, 1, 0, 0, 1, 1,
-0.3140698, -0.4562161, -4.538906, 1, 0, 0, 1, 1,
-0.3131935, -0.2440859, -0.3220066, 1, 0, 0, 1, 1,
-0.3130657, 1.102691, 0.3648285, 1, 0, 0, 1, 1,
-0.3106514, -1.070333, -4.04576, 0, 0, 0, 1, 1,
-0.3099553, 1.12851, -0.2765083, 0, 0, 0, 1, 1,
-0.3049849, 0.7044394, -0.07610057, 0, 0, 0, 1, 1,
-0.3015226, 0.6236227, -0.4660232, 0, 0, 0, 1, 1,
-0.2998399, -0.4211753, -3.151525, 0, 0, 0, 1, 1,
-0.2986777, -0.668281, -3.952388, 0, 0, 0, 1, 1,
-0.2915241, -0.2289413, -1.854712, 0, 0, 0, 1, 1,
-0.289725, 1.677097, 0.7982724, 1, 1, 1, 1, 1,
-0.2879378, -0.2208892, -3.104535, 1, 1, 1, 1, 1,
-0.2872256, 0.605864, -2.369839, 1, 1, 1, 1, 1,
-0.2751603, 0.1570103, -1.880492, 1, 1, 1, 1, 1,
-0.2751145, -0.4223632, -2.265915, 1, 1, 1, 1, 1,
-0.275069, 1.225641, 1.381121, 1, 1, 1, 1, 1,
-0.2748102, 0.678345, -0.7110415, 1, 1, 1, 1, 1,
-0.2728212, -0.452813, -3.188413, 1, 1, 1, 1, 1,
-0.2714038, 0.2238879, -1.872963, 1, 1, 1, 1, 1,
-0.266987, -0.4964123, -2.944935, 1, 1, 1, 1, 1,
-0.2669123, -0.5595249, -2.566724, 1, 1, 1, 1, 1,
-0.2642038, 0.5504379, 0.2869213, 1, 1, 1, 1, 1,
-0.2626941, -1.032341, -3.552856, 1, 1, 1, 1, 1,
-0.2624576, -0.1246949, -2.550481, 1, 1, 1, 1, 1,
-0.2620521, 0.9704009, -1.132412, 1, 1, 1, 1, 1,
-0.2612454, 0.7780817, -1.105982, 0, 0, 1, 1, 1,
-0.2598136, -1.343639, -4.417564, 1, 0, 0, 1, 1,
-0.2586776, -0.8832737, -2.307088, 1, 0, 0, 1, 1,
-0.2536286, 1.612547, -0.8267979, 1, 0, 0, 1, 1,
-0.2526551, 1.392152, -0.5627521, 1, 0, 0, 1, 1,
-0.2521574, -0.7496737, -2.963572, 1, 0, 0, 1, 1,
-0.2376007, -1.04134, -2.286083, 0, 0, 0, 1, 1,
-0.2366891, -0.005109313, 0.7481073, 0, 0, 0, 1, 1,
-0.2352868, 0.3713035, -0.7371103, 0, 0, 0, 1, 1,
-0.2304936, 0.3562868, 0.08477324, 0, 0, 0, 1, 1,
-0.2228924, -0.2601075, -1.808498, 0, 0, 0, 1, 1,
-0.2219805, -2.076296, -1.89581, 0, 0, 0, 1, 1,
-0.221675, 0.1250072, 0.4581594, 0, 0, 0, 1, 1,
-0.2151824, 0.4303308, -0.8055349, 1, 1, 1, 1, 1,
-0.2149016, 0.7938441, 0.01094349, 1, 1, 1, 1, 1,
-0.2124459, 0.7497, -1.04219, 1, 1, 1, 1, 1,
-0.2099057, 0.868393, 0.1306503, 1, 1, 1, 1, 1,
-0.2094766, -0.2852916, -2.010555, 1, 1, 1, 1, 1,
-0.208917, 0.5806801, -1.122803, 1, 1, 1, 1, 1,
-0.2088227, 0.1030375, -1.196756, 1, 1, 1, 1, 1,
-0.203653, 0.7782328, -1.73174, 1, 1, 1, 1, 1,
-0.2031621, 0.8429527, 0.09778231, 1, 1, 1, 1, 1,
-0.2024824, -0.6128268, -4.103583, 1, 1, 1, 1, 1,
-0.2002264, 0.0834074, 0.07691596, 1, 1, 1, 1, 1,
-0.1996929, 1.411993, 0.420672, 1, 1, 1, 1, 1,
-0.1985278, 1.894752, -0.1556775, 1, 1, 1, 1, 1,
-0.1960431, 0.04893051, -1.160438, 1, 1, 1, 1, 1,
-0.1956894, 0.1075126, -1.932954, 1, 1, 1, 1, 1,
-0.1901551, 0.9448063, 0.3401661, 0, 0, 1, 1, 1,
-0.1885877, 0.9398534, 0.7643722, 1, 0, 0, 1, 1,
-0.1869193, 0.2190446, -1.168576, 1, 0, 0, 1, 1,
-0.1868543, -0.6985732, -1.928803, 1, 0, 0, 1, 1,
-0.1763982, 1.165928, -1.003556, 1, 0, 0, 1, 1,
-0.1734576, 0.6400971, 0.6472089, 1, 0, 0, 1, 1,
-0.1694043, 0.3790667, 1.567559, 0, 0, 0, 1, 1,
-0.1693448, -0.2594966, -2.879834, 0, 0, 0, 1, 1,
-0.1612836, 0.8359303, -0.151542, 0, 0, 0, 1, 1,
-0.1609536, -0.08104898, -2.566766, 0, 0, 0, 1, 1,
-0.1592148, -0.1538697, -3.102746, 0, 0, 0, 1, 1,
-0.1552167, -0.6223273, -1.884365, 0, 0, 0, 1, 1,
-0.1533916, -0.3606218, -1.61739, 0, 0, 0, 1, 1,
-0.1513681, -0.5126097, -1.783658, 1, 1, 1, 1, 1,
-0.1498028, -0.7151446, -3.246853, 1, 1, 1, 1, 1,
-0.1425043, 0.5932384, -0.4281702, 1, 1, 1, 1, 1,
-0.1385798, 0.670285, 0.687823, 1, 1, 1, 1, 1,
-0.137913, -0.9229809, -3.126292, 1, 1, 1, 1, 1,
-0.1345976, -0.9504975, -3.499066, 1, 1, 1, 1, 1,
-0.1345587, 0.9354083, -0.3012498, 1, 1, 1, 1, 1,
-0.1331349, 0.07875618, 0.2224342, 1, 1, 1, 1, 1,
-0.1324442, 0.21522, -0.8652331, 1, 1, 1, 1, 1,
-0.1288553, 0.03494988, -1.896514, 1, 1, 1, 1, 1,
-0.1254574, 1.499754, -1.618443, 1, 1, 1, 1, 1,
-0.1253198, 0.04051528, -1.623844, 1, 1, 1, 1, 1,
-0.1222525, 0.8323022, -0.3081703, 1, 1, 1, 1, 1,
-0.121548, 0.2004292, -0.03114222, 1, 1, 1, 1, 1,
-0.1206411, -0.7331333, -2.764831, 1, 1, 1, 1, 1,
-0.1195691, 1.119994, -0.1625717, 0, 0, 1, 1, 1,
-0.1167153, -0.1622776, -2.497271, 1, 0, 0, 1, 1,
-0.1131382, 0.07729357, -1.179509, 1, 0, 0, 1, 1,
-0.1127213, 0.4782306, -2.113718, 1, 0, 0, 1, 1,
-0.1080089, -0.1994915, -3.622126, 1, 0, 0, 1, 1,
-0.1064994, -0.1519495, -2.500784, 1, 0, 0, 1, 1,
-0.1026916, 0.3289225, -1.269675, 0, 0, 0, 1, 1,
-0.1021859, -0.6028615, -2.447563, 0, 0, 0, 1, 1,
-0.09830907, -1.004867, -3.47226, 0, 0, 0, 1, 1,
-0.09686034, 0.426239, 0.4519643, 0, 0, 0, 1, 1,
-0.09619787, 0.843313, 1.068192, 0, 0, 0, 1, 1,
-0.09582101, -0.8648284, -2.740209, 0, 0, 0, 1, 1,
-0.0933414, -1.098819, -2.641773, 0, 0, 0, 1, 1,
-0.0930964, 0.1088727, -1.231928, 1, 1, 1, 1, 1,
-0.09034912, -0.1086677, -1.915593, 1, 1, 1, 1, 1,
-0.09014794, 0.2668665, -0.3034369, 1, 1, 1, 1, 1,
-0.08674926, -0.4471656, -1.545881, 1, 1, 1, 1, 1,
-0.08210313, 0.1908992, 0.1376231, 1, 1, 1, 1, 1,
-0.08135374, -0.229681, -3.573673, 1, 1, 1, 1, 1,
-0.0765205, 1.27064, -0.9628397, 1, 1, 1, 1, 1,
-0.07578295, 1.647724, 1.466235, 1, 1, 1, 1, 1,
-0.06724011, -0.7013754, -1.835281, 1, 1, 1, 1, 1,
-0.06431138, 1.206048, -1.223747, 1, 1, 1, 1, 1,
-0.06409701, 0.9070077, -0.6172131, 1, 1, 1, 1, 1,
-0.06303772, 0.6272594, 0.9072972, 1, 1, 1, 1, 1,
-0.06089064, -0.282734, -3.090714, 1, 1, 1, 1, 1,
-0.06044872, -0.9660141, -3.274577, 1, 1, 1, 1, 1,
-0.0584589, 2.268811, 2.146445, 1, 1, 1, 1, 1,
-0.0578573, -0.7580413, -2.323259, 0, 0, 1, 1, 1,
-0.05758173, 0.394687, 0.3777627, 1, 0, 0, 1, 1,
-0.05674861, -1.572402, -3.522545, 1, 0, 0, 1, 1,
-0.05648931, 0.05692755, -1.850591, 1, 0, 0, 1, 1,
-0.0530397, -0.3986453, -1.854932, 1, 0, 0, 1, 1,
-0.05292972, 0.5319837, 0.0813299, 1, 0, 0, 1, 1,
-0.0433789, 1.611902, 1.713107, 0, 0, 0, 1, 1,
-0.04333964, 0.3501764, 0.388138, 0, 0, 0, 1, 1,
-0.04092677, 0.491285, -0.2656048, 0, 0, 0, 1, 1,
-0.04029383, -0.3703644, -2.337877, 0, 0, 0, 1, 1,
-0.03517963, -1.94656, -3.325439, 0, 0, 0, 1, 1,
-0.03403991, 0.0939157, -0.006761036, 0, 0, 0, 1, 1,
-0.03381995, 1.319563, -0.4989295, 0, 0, 0, 1, 1,
-0.0320989, -0.9806867, -4.054079, 1, 1, 1, 1, 1,
-0.03015489, 0.8008992, -0.4973025, 1, 1, 1, 1, 1,
-0.02471762, -0.7260902, -2.490402, 1, 1, 1, 1, 1,
-0.02350883, -0.2333435, -5.004362, 1, 1, 1, 1, 1,
-0.0199043, 0.5437129, 1.869162, 1, 1, 1, 1, 1,
-0.01899829, -1.491572, -3.393739, 1, 1, 1, 1, 1,
-0.01741469, 0.9406592, -0.3638147, 1, 1, 1, 1, 1,
-0.01545639, -2.082639, -0.7397108, 1, 1, 1, 1, 1,
-0.01383219, -1.176715, -3.694928, 1, 1, 1, 1, 1,
-0.01299108, 0.368722, 0.2247834, 1, 1, 1, 1, 1,
-0.01280059, 1.73875, -0.4448299, 1, 1, 1, 1, 1,
-0.01193333, 1.162049, 0.990625, 1, 1, 1, 1, 1,
-0.01050687, 2.132898, 0.3589329, 1, 1, 1, 1, 1,
-0.006822144, 0.3520358, -1.523087, 1, 1, 1, 1, 1,
-0.001144159, -0.692745, -3.128813, 1, 1, 1, 1, 1,
0.009085312, -2.109245, 3.529525, 0, 0, 1, 1, 1,
0.01146777, 0.7466763, 0.1271405, 1, 0, 0, 1, 1,
0.0151196, -1.008605, 2.402348, 1, 0, 0, 1, 1,
0.02145653, 2.155149, 0.3919871, 1, 0, 0, 1, 1,
0.02247158, 0.3490167, 0.6661049, 1, 0, 0, 1, 1,
0.02566333, 1.558327, 0.3179487, 1, 0, 0, 1, 1,
0.03476654, 0.3466105, 0.5432461, 0, 0, 0, 1, 1,
0.03552403, 0.5774578, -0.7407699, 0, 0, 0, 1, 1,
0.03923951, 0.8928737, -1.440232, 0, 0, 0, 1, 1,
0.03941308, 0.9179924, 0.7347284, 0, 0, 0, 1, 1,
0.04052067, 1.01646, 1.423311, 0, 0, 0, 1, 1,
0.04260541, -0.02990793, 1.435383, 0, 0, 0, 1, 1,
0.04265961, -1.05437, 1.742631, 0, 0, 0, 1, 1,
0.04329097, -0.09041133, 2.678046, 1, 1, 1, 1, 1,
0.05092416, -0.7421824, 4.825336, 1, 1, 1, 1, 1,
0.05107646, -0.6929501, 3.336506, 1, 1, 1, 1, 1,
0.05152228, 1.481373, -1.062344, 1, 1, 1, 1, 1,
0.05242738, -1.037382, 0.9809696, 1, 1, 1, 1, 1,
0.05294494, -0.6532383, 5.782608, 1, 1, 1, 1, 1,
0.06402338, -2.248199, 3.586164, 1, 1, 1, 1, 1,
0.06415132, -0.3820493, 2.542342, 1, 1, 1, 1, 1,
0.066817, 1.150789, -0.4035413, 1, 1, 1, 1, 1,
0.06711812, 0.731678, 0.9622397, 1, 1, 1, 1, 1,
0.07282966, 0.988959, 2.297738, 1, 1, 1, 1, 1,
0.07297808, 2.484564, -1.647802, 1, 1, 1, 1, 1,
0.07311598, 1.063041, 1.108152, 1, 1, 1, 1, 1,
0.07452209, -0.985711, 1.555964, 1, 1, 1, 1, 1,
0.07537455, 0.4225864, 1.354124, 1, 1, 1, 1, 1,
0.07774463, 0.454674, 1.016347, 0, 0, 1, 1, 1,
0.07940887, 0.2700071, -0.5305598, 1, 0, 0, 1, 1,
0.08551684, -0.1639424, 1.031617, 1, 0, 0, 1, 1,
0.08971117, -0.3877249, 4.457472, 1, 0, 0, 1, 1,
0.09059437, -0.4566773, 4.188205, 1, 0, 0, 1, 1,
0.09895875, -0.3804209, 2.437371, 1, 0, 0, 1, 1,
0.09898847, -0.2734722, 2.412161, 0, 0, 0, 1, 1,
0.100012, -0.1321029, 4.685366, 0, 0, 0, 1, 1,
0.1002247, 0.8723373, -1.371023, 0, 0, 0, 1, 1,
0.1003264, 1.061951, -1.090194, 0, 0, 0, 1, 1,
0.1029608, 0.6831809, 0.4993296, 0, 0, 0, 1, 1,
0.1081255, 0.2964166, 1.485603, 0, 0, 0, 1, 1,
0.1088611, 2.151819, -0.02728591, 0, 0, 0, 1, 1,
0.1093444, -1.121872, 4.386928, 1, 1, 1, 1, 1,
0.1105894, 0.1409159, 3.175212, 1, 1, 1, 1, 1,
0.1119194, -0.8034661, 3.600689, 1, 1, 1, 1, 1,
0.1168158, 0.8824024, -0.9781851, 1, 1, 1, 1, 1,
0.1179452, -1.211955, 4.458702, 1, 1, 1, 1, 1,
0.1228041, -2.368561, 3.646723, 1, 1, 1, 1, 1,
0.1231749, 0.8927154, -0.949549, 1, 1, 1, 1, 1,
0.1252863, 0.7272245, 2.181691, 1, 1, 1, 1, 1,
0.1253511, 0.774695, -0.8910024, 1, 1, 1, 1, 1,
0.1268289, -0.3359824, 3.480097, 1, 1, 1, 1, 1,
0.1275956, 1.588013, 0.2989298, 1, 1, 1, 1, 1,
0.1294414, 0.4629071, 1.920343, 1, 1, 1, 1, 1,
0.1300127, -0.2684815, 3.282129, 1, 1, 1, 1, 1,
0.1309314, -0.4592726, 3.48285, 1, 1, 1, 1, 1,
0.1313038, 0.9480067, 2.287819, 1, 1, 1, 1, 1,
0.1313596, 0.944757, -0.8338891, 0, 0, 1, 1, 1,
0.131877, 0.6450555, -0.4842411, 1, 0, 0, 1, 1,
0.1355161, 0.7936711, -1.417879, 1, 0, 0, 1, 1,
0.1355787, -1.325137, 2.201353, 1, 0, 0, 1, 1,
0.1378002, 0.8941761, 0.6276041, 1, 0, 0, 1, 1,
0.1404518, 0.4254622, -0.8569617, 1, 0, 0, 1, 1,
0.1425246, 0.3161224, -0.5289611, 0, 0, 0, 1, 1,
0.1470685, -1.130806, 2.064273, 0, 0, 0, 1, 1,
0.1486378, -0.4802877, 2.226449, 0, 0, 0, 1, 1,
0.1525541, 1.652985, 1.078725, 0, 0, 0, 1, 1,
0.155751, -1.288597, 2.81965, 0, 0, 0, 1, 1,
0.1563994, -0.1077968, 1.143072, 0, 0, 0, 1, 1,
0.1609426, 1.188196, -0.9348984, 0, 0, 0, 1, 1,
0.1695393, -0.2669498, 3.912704, 1, 1, 1, 1, 1,
0.1714244, -0.710979, 2.915033, 1, 1, 1, 1, 1,
0.1718929, -1.234181, 3.696806, 1, 1, 1, 1, 1,
0.1753352, 0.3815174, -0.1109011, 1, 1, 1, 1, 1,
0.1806358, -0.06415072, 0.8285999, 1, 1, 1, 1, 1,
0.180699, -0.2421353, 3.453263, 1, 1, 1, 1, 1,
0.1814836, 0.08002906, -0.5639251, 1, 1, 1, 1, 1,
0.1825982, -0.6940179, 3.171655, 1, 1, 1, 1, 1,
0.1853054, 0.5098712, 1.094292, 1, 1, 1, 1, 1,
0.1888576, -0.6510758, 3.307465, 1, 1, 1, 1, 1,
0.1901225, -0.07132743, 1.484756, 1, 1, 1, 1, 1,
0.1928166, -2.089486, 2.840778, 1, 1, 1, 1, 1,
0.1937217, 0.317464, -0.1176188, 1, 1, 1, 1, 1,
0.1955761, -0.08640123, 2.786021, 1, 1, 1, 1, 1,
0.1963365, 0.01859007, 1.182942, 1, 1, 1, 1, 1,
0.1969869, 0.3905572, 0.3454251, 0, 0, 1, 1, 1,
0.2053781, 0.9787608, 1.321987, 1, 0, 0, 1, 1,
0.2074287, 0.6333992, -0.9182945, 1, 0, 0, 1, 1,
0.2083583, 1.687309, 0.2528294, 1, 0, 0, 1, 1,
0.2083801, 0.3421249, 1.797625, 1, 0, 0, 1, 1,
0.2095405, -0.8984459, 3.286652, 1, 0, 0, 1, 1,
0.2096147, -1.202474, 2.637648, 0, 0, 0, 1, 1,
0.2155608, 0.6633843, 0.9768707, 0, 0, 0, 1, 1,
0.216942, 0.6185184, 0.9858609, 0, 0, 0, 1, 1,
0.2172945, -0.7950763, 3.376033, 0, 0, 0, 1, 1,
0.2174301, 1.431927, -1.706282, 0, 0, 0, 1, 1,
0.2197464, -0.2876171, 2.683083, 0, 0, 0, 1, 1,
0.2206667, -0.4329361, 4.132155, 0, 0, 0, 1, 1,
0.2211659, 0.4402448, 1.775906, 1, 1, 1, 1, 1,
0.2251039, -1.00363, 3.831962, 1, 1, 1, 1, 1,
0.2254793, 0.1093885, 1.509225, 1, 1, 1, 1, 1,
0.2302639, -1.874821, 4.750934, 1, 1, 1, 1, 1,
0.2308091, 0.8007595, 1.326168, 1, 1, 1, 1, 1,
0.2313962, 0.3234887, 1.713453, 1, 1, 1, 1, 1,
0.2356614, -1.137262, 3.902966, 1, 1, 1, 1, 1,
0.2385044, 0.8969945, -0.04663663, 1, 1, 1, 1, 1,
0.2386713, -0.651779, 2.690397, 1, 1, 1, 1, 1,
0.2459359, 0.9389687, 0.3469843, 1, 1, 1, 1, 1,
0.2464504, -1.699898, 0.9141787, 1, 1, 1, 1, 1,
0.2592298, 0.8557777, 0.2206087, 1, 1, 1, 1, 1,
0.2642553, 0.5954384, 0.2828479, 1, 1, 1, 1, 1,
0.2644067, -0.7385497, 3.376449, 1, 1, 1, 1, 1,
0.2661642, 1.738925, 0.2828761, 1, 1, 1, 1, 1,
0.2677727, -3.216335, 3.956444, 0, 0, 1, 1, 1,
0.2746575, 0.5950036, 1.295793, 1, 0, 0, 1, 1,
0.2756092, 0.8777087, -0.05493695, 1, 0, 0, 1, 1,
0.2816612, 0.1103772, 0.9975145, 1, 0, 0, 1, 1,
0.2822354, -0.7539715, 1.243291, 1, 0, 0, 1, 1,
0.2842283, 0.2619487, 0.5286368, 1, 0, 0, 1, 1,
0.2854918, 0.1992749, -0.5899473, 0, 0, 0, 1, 1,
0.2948074, 0.4636265, 2.083124, 0, 0, 0, 1, 1,
0.2950162, -1.76547, 3.914825, 0, 0, 0, 1, 1,
0.2960142, 0.1189526, 0.8266904, 0, 0, 0, 1, 1,
0.2964418, -0.3451991, 3.475021, 0, 0, 0, 1, 1,
0.2996078, 0.652778, -0.1303195, 0, 0, 0, 1, 1,
0.3000697, -0.6516744, 1.845351, 0, 0, 0, 1, 1,
0.3057501, -1.736531, 4.274856, 1, 1, 1, 1, 1,
0.3060072, -0.4850045, 2.357052, 1, 1, 1, 1, 1,
0.3065476, 0.216044, 1.931764, 1, 1, 1, 1, 1,
0.3086097, -0.5117564, 2.808514, 1, 1, 1, 1, 1,
0.3104782, -0.3403549, 2.134529, 1, 1, 1, 1, 1,
0.3126885, 0.3039878, -0.2020437, 1, 1, 1, 1, 1,
0.3140963, 2.113247, 0.05957991, 1, 1, 1, 1, 1,
0.3150581, -0.5851275, 2.021764, 1, 1, 1, 1, 1,
0.3188043, 0.4460888, 1.09147, 1, 1, 1, 1, 1,
0.3190728, 0.6103637, 0.8957778, 1, 1, 1, 1, 1,
0.3193218, -0.3235835, 1.941751, 1, 1, 1, 1, 1,
0.3222157, 0.9206143, 1.777141, 1, 1, 1, 1, 1,
0.3226397, 0.1855275, 2.229128, 1, 1, 1, 1, 1,
0.3251909, -1.803618, 1.651992, 1, 1, 1, 1, 1,
0.3282867, -0.9267831, 3.37571, 1, 1, 1, 1, 1,
0.3283719, 0.08026372, 1.735842, 0, 0, 1, 1, 1,
0.3303666, -0.05274213, 1.822541, 1, 0, 0, 1, 1,
0.3308371, -0.4732259, 2.594202, 1, 0, 0, 1, 1,
0.3326266, -0.2165496, 1.434412, 1, 0, 0, 1, 1,
0.3357319, 0.4504278, 1.612968, 1, 0, 0, 1, 1,
0.340446, -0.86292, 1.51663, 1, 0, 0, 1, 1,
0.3416251, 1.968891, 0.8762581, 0, 0, 0, 1, 1,
0.3421178, 0.7952185, 0.2239773, 0, 0, 0, 1, 1,
0.3460938, -1.687409, 4.000514, 0, 0, 0, 1, 1,
0.3509034, -0.7310013, 3.054555, 0, 0, 0, 1, 1,
0.361769, -1.389578, 4.382773, 0, 0, 0, 1, 1,
0.3619615, 1.32177, 0.1084099, 0, 0, 0, 1, 1,
0.3633328, 0.70639, 0.1302029, 0, 0, 0, 1, 1,
0.364178, -0.7417036, 1.610034, 1, 1, 1, 1, 1,
0.3643808, 0.2963822, 2.805024, 1, 1, 1, 1, 1,
0.3660432, -0.2458534, 2.468644, 1, 1, 1, 1, 1,
0.3666262, -0.1727095, 3.517986, 1, 1, 1, 1, 1,
0.3673265, -0.7626354, 1.716458, 1, 1, 1, 1, 1,
0.3703326, -0.9970644, 3.057864, 1, 1, 1, 1, 1,
0.3744704, 1.066476, -0.199342, 1, 1, 1, 1, 1,
0.3754371, 0.5794308, -0.4286084, 1, 1, 1, 1, 1,
0.3761402, -0.5453616, -0.7274755, 1, 1, 1, 1, 1,
0.3875081, -0.3419228, 0.07786091, 1, 1, 1, 1, 1,
0.3957694, 0.50932, 1.191423, 1, 1, 1, 1, 1,
0.3966261, -0.152261, 2.891631, 1, 1, 1, 1, 1,
0.3987548, -0.9621558, 4.042703, 1, 1, 1, 1, 1,
0.3994266, 1.079738, 0.7703504, 1, 1, 1, 1, 1,
0.4006645, -0.02143946, 1.138201, 1, 1, 1, 1, 1,
0.4008109, 1.465462, 1.843959, 0, 0, 1, 1, 1,
0.4020581, -0.4111159, 3.654279, 1, 0, 0, 1, 1,
0.4061872, -1.869552, 3.680666, 1, 0, 0, 1, 1,
0.4071011, -0.5404323, 3.538621, 1, 0, 0, 1, 1,
0.4078623, -1.784762, 3.435319, 1, 0, 0, 1, 1,
0.41099, 0.3219532, -0.316368, 1, 0, 0, 1, 1,
0.4113191, -0.4841573, 3.434127, 0, 0, 0, 1, 1,
0.4154871, -0.4207344, 2.27757, 0, 0, 0, 1, 1,
0.4212714, -1.359073, 4.188978, 0, 0, 0, 1, 1,
0.4220548, -0.2600628, 3.799312, 0, 0, 0, 1, 1,
0.422628, 0.852331, -2.082543, 0, 0, 0, 1, 1,
0.4269041, 0.3985764, 0.831861, 0, 0, 0, 1, 1,
0.4280969, 0.6461973, 0.3422127, 0, 0, 0, 1, 1,
0.4294251, 0.3093113, -0.01143634, 1, 1, 1, 1, 1,
0.4351622, -0.9665866, 3.043393, 1, 1, 1, 1, 1,
0.4368633, 0.2220403, 0.6950607, 1, 1, 1, 1, 1,
0.4369139, 0.08894523, -1.495563, 1, 1, 1, 1, 1,
0.443721, 0.9441038, 1.656684, 1, 1, 1, 1, 1,
0.4442567, -1.294075, 4.493384, 1, 1, 1, 1, 1,
0.446637, 0.2467687, 0.3848077, 1, 1, 1, 1, 1,
0.452231, -1.268193, 3.581193, 1, 1, 1, 1, 1,
0.4558784, -0.6083538, 2.562245, 1, 1, 1, 1, 1,
0.4602487, 0.4819409, 0.6757364, 1, 1, 1, 1, 1,
0.4625966, 0.7420165, 1.248822, 1, 1, 1, 1, 1,
0.4676368, 0.1375352, -0.1883072, 1, 1, 1, 1, 1,
0.4680333, 0.08933276, 0.5318368, 1, 1, 1, 1, 1,
0.4694041, 2.878742, 0.002670166, 1, 1, 1, 1, 1,
0.4759761, 1.845682, 0.1403938, 1, 1, 1, 1, 1,
0.4773037, 1.551604, 0.4985175, 0, 0, 1, 1, 1,
0.4782649, -1.068823, 2.508993, 1, 0, 0, 1, 1,
0.4802389, -0.09169088, 1.345734, 1, 0, 0, 1, 1,
0.4827628, 0.9719443, 0.4947642, 1, 0, 0, 1, 1,
0.482764, -0.0005648664, -0.4097403, 1, 0, 0, 1, 1,
0.4872929, -0.4079643, 1.55877, 1, 0, 0, 1, 1,
0.4918177, -1.581695, 2.402634, 0, 0, 0, 1, 1,
0.4938658, -0.1466108, 1.298059, 0, 0, 0, 1, 1,
0.495443, -0.7056506, 2.553228, 0, 0, 0, 1, 1,
0.4961847, -0.6462879, 2.16684, 0, 0, 0, 1, 1,
0.5005304, -2.001225, 0.8255368, 0, 0, 0, 1, 1,
0.5007986, -0.5165114, 3.030769, 0, 0, 0, 1, 1,
0.5011817, -0.7610013, 0.7987744, 0, 0, 0, 1, 1,
0.5016301, 0.1892637, 0.3619439, 1, 1, 1, 1, 1,
0.5074408, -0.2236928, 1.428368, 1, 1, 1, 1, 1,
0.5079541, -0.06102668, -0.07571074, 1, 1, 1, 1, 1,
0.508697, -1.017924, 5.554676, 1, 1, 1, 1, 1,
0.5103039, 0.1794175, 1.564118, 1, 1, 1, 1, 1,
0.5140612, 0.2834942, 0.5992605, 1, 1, 1, 1, 1,
0.5158916, 0.9771399, -0.2631577, 1, 1, 1, 1, 1,
0.5192432, -0.002506971, 0.8713961, 1, 1, 1, 1, 1,
0.5286993, -0.2101339, 1.313014, 1, 1, 1, 1, 1,
0.5292991, 0.5821943, -1.430901, 1, 1, 1, 1, 1,
0.5338412, -0.8281887, 1.063484, 1, 1, 1, 1, 1,
0.5354741, 0.1498188, 2.296921, 1, 1, 1, 1, 1,
0.5389482, 0.01630032, 2.525356, 1, 1, 1, 1, 1,
0.5395743, -0.8271928, 1.032735, 1, 1, 1, 1, 1,
0.5403591, -0.7776866, 3.616306, 1, 1, 1, 1, 1,
0.5426731, -0.9486081, 3.716727, 0, 0, 1, 1, 1,
0.5487734, 0.3542031, 0.7572802, 1, 0, 0, 1, 1,
0.5491824, -0.5446844, 0.7767783, 1, 0, 0, 1, 1,
0.5492201, 0.01363067, 2.667715, 1, 0, 0, 1, 1,
0.5579245, 0.7302207, 1.953563, 1, 0, 0, 1, 1,
0.5586793, 0.688881, 0.1485807, 1, 0, 0, 1, 1,
0.5588016, 0.7965477, 0.9599951, 0, 0, 0, 1, 1,
0.5611391, 1.734532, -0.6588437, 0, 0, 0, 1, 1,
0.5620542, -1.019699, 2.179676, 0, 0, 0, 1, 1,
0.5660857, 0.3267641, 1.100328, 0, 0, 0, 1, 1,
0.5708804, -0.1252993, 1.511593, 0, 0, 0, 1, 1,
0.5775746, -1.517925, 1.416681, 0, 0, 0, 1, 1,
0.5784362, -1.187461, 1.787692, 0, 0, 0, 1, 1,
0.5786613, 1.972684, 0.355175, 1, 1, 1, 1, 1,
0.5887084, 0.7815828, 1.644562, 1, 1, 1, 1, 1,
0.5895447, -1.102148, 2.159755, 1, 1, 1, 1, 1,
0.5903448, 1.592953, 0.2929726, 1, 1, 1, 1, 1,
0.5906698, -0.8389053, 4.226256, 1, 1, 1, 1, 1,
0.5925547, -1.59861, 2.854457, 1, 1, 1, 1, 1,
0.5965816, -0.9413919, 2.672141, 1, 1, 1, 1, 1,
0.6047595, -1.49913, 3.406345, 1, 1, 1, 1, 1,
0.6070188, 0.7637939, 1.68543, 1, 1, 1, 1, 1,
0.6099467, 0.2095581, 1.997665, 1, 1, 1, 1, 1,
0.613765, -0.6209272, 3.13511, 1, 1, 1, 1, 1,
0.6146093, -0.4266611, 1.12886, 1, 1, 1, 1, 1,
0.6170955, 0.9228898, 1.127213, 1, 1, 1, 1, 1,
0.6182578, -2.026521, 3.799514, 1, 1, 1, 1, 1,
0.6220192, 0.9466395, 1.162314, 1, 1, 1, 1, 1,
0.6222114, 0.8753747, 0.8893036, 0, 0, 1, 1, 1,
0.62442, -1.715792, 2.558462, 1, 0, 0, 1, 1,
0.6273875, -1.277623, 3.901942, 1, 0, 0, 1, 1,
0.6289696, -0.2124073, 1.989608, 1, 0, 0, 1, 1,
0.6331113, -1.641999, 1.227697, 1, 0, 0, 1, 1,
0.6485382, -0.2316075, 1.837091, 1, 0, 0, 1, 1,
0.6511549, 0.1688605, 0.4556428, 0, 0, 0, 1, 1,
0.6514632, -0.7442182, 1.27177, 0, 0, 0, 1, 1,
0.6543747, 1.056661, 2.337124, 0, 0, 0, 1, 1,
0.6546981, 1.036434, 0.2241416, 0, 0, 0, 1, 1,
0.6573026, 1.664675, -2.133069, 0, 0, 0, 1, 1,
0.6606252, -1.991956, 4.078145, 0, 0, 0, 1, 1,
0.6640542, 1.262349, 0.8819482, 0, 0, 0, 1, 1,
0.6668465, 0.79131, 1.119122, 1, 1, 1, 1, 1,
0.6675255, -1.239038, 2.66743, 1, 1, 1, 1, 1,
0.6695952, 0.3329546, 2.244003, 1, 1, 1, 1, 1,
0.6700443, 1.405582, -0.9091739, 1, 1, 1, 1, 1,
0.6740007, -1.557987, 3.981794, 1, 1, 1, 1, 1,
0.674307, 1.141246, 1.561216, 1, 1, 1, 1, 1,
0.6844501, -0.2661517, 3.047062, 1, 1, 1, 1, 1,
0.6916101, -0.02572506, 1.296816, 1, 1, 1, 1, 1,
0.69432, 0.6735744, 0.9725963, 1, 1, 1, 1, 1,
0.6963546, -0.1295001, 2.671753, 1, 1, 1, 1, 1,
0.6991655, -0.9461843, 1.986367, 1, 1, 1, 1, 1,
0.7016548, -2.274983, 3.03566, 1, 1, 1, 1, 1,
0.702002, -0.3148552, -0.9604236, 1, 1, 1, 1, 1,
0.7067378, -0.5465681, 1.916036, 1, 1, 1, 1, 1,
0.7119376, 0.2601605, 2.833506, 1, 1, 1, 1, 1,
0.7193589, 0.9275984, 0.8726513, 0, 0, 1, 1, 1,
0.7214408, 0.5891133, -0.6857719, 1, 0, 0, 1, 1,
0.7248254, 2.584996, 0.488093, 1, 0, 0, 1, 1,
0.726693, -0.5705056, 1.664836, 1, 0, 0, 1, 1,
0.7274274, -1.493183, 2.298637, 1, 0, 0, 1, 1,
0.730797, 0.08996541, 1.904396, 1, 0, 0, 1, 1,
0.7313559, 0.09464189, 0.9892514, 0, 0, 0, 1, 1,
0.7431342, 1.079155, 1.342845, 0, 0, 0, 1, 1,
0.7439402, -0.7088346, 1.778352, 0, 0, 0, 1, 1,
0.7545436, 0.8401152, 0.4799111, 0, 0, 0, 1, 1,
0.75661, 0.2080004, 1.077775, 0, 0, 0, 1, 1,
0.7602131, -0.5813774, 2.253628, 0, 0, 0, 1, 1,
0.7618833, -0.1789796, 2.894119, 0, 0, 0, 1, 1,
0.7694362, 0.4724547, 0.9073719, 1, 1, 1, 1, 1,
0.7730389, 0.3747946, 1.580408, 1, 1, 1, 1, 1,
0.7734421, -0.4410957, 1.480873, 1, 1, 1, 1, 1,
0.7749934, 1.129296, -1.516112, 1, 1, 1, 1, 1,
0.77804, -0.3581131, 2.737262, 1, 1, 1, 1, 1,
0.7783543, 1.195936, 0.7269309, 1, 1, 1, 1, 1,
0.7942383, 0.2588404, 1.862299, 1, 1, 1, 1, 1,
0.8059354, 0.3725665, 0.5614976, 1, 1, 1, 1, 1,
0.8061235, -0.9317312, 3.537126, 1, 1, 1, 1, 1,
0.8122004, -0.04180909, 2.299804, 1, 1, 1, 1, 1,
0.8191703, -1.479237, 4.296529, 1, 1, 1, 1, 1,
0.8224117, -1.239216, 2.147341, 1, 1, 1, 1, 1,
0.8259665, -0.8046653, 2.457074, 1, 1, 1, 1, 1,
0.8283531, 2.315855, -0.1166923, 1, 1, 1, 1, 1,
0.8287247, -0.2622351, 1.103675, 1, 1, 1, 1, 1,
0.836516, 1.25083, 1.325142, 0, 0, 1, 1, 1,
0.8382078, 0.209633, 0.6405629, 1, 0, 0, 1, 1,
0.8391799, 0.09563539, 0.4160726, 1, 0, 0, 1, 1,
0.840485, -0.1110611, 2.022586, 1, 0, 0, 1, 1,
0.8483447, -1.426653, 3.769655, 1, 0, 0, 1, 1,
0.8568813, -1.191689, 2.56357, 1, 0, 0, 1, 1,
0.8601236, 1.095667, -0.1905572, 0, 0, 0, 1, 1,
0.8613873, -0.5810041, 3.421645, 0, 0, 0, 1, 1,
0.8684548, 1.105218, 0.3944137, 0, 0, 0, 1, 1,
0.8704264, 0.9103291, 1.428318, 0, 0, 0, 1, 1,
0.8711197, 2.157008, 0.6326619, 0, 0, 0, 1, 1,
0.8789043, -0.06177532, 2.490803, 0, 0, 0, 1, 1,
0.8816267, 1.351253, 1.798653, 0, 0, 0, 1, 1,
0.8839257, 0.1346112, -0.04018554, 1, 1, 1, 1, 1,
0.8858598, 0.1169626, -0.5743832, 1, 1, 1, 1, 1,
0.8947311, -2.705392, 3.464329, 1, 1, 1, 1, 1,
0.897719, 0.8526679, 1.289001, 1, 1, 1, 1, 1,
0.9023628, 0.3864875, -0.4938295, 1, 1, 1, 1, 1,
0.9037909, -0.6221008, 1.169642, 1, 1, 1, 1, 1,
0.9054765, -1.290406, 3.658919, 1, 1, 1, 1, 1,
0.9088653, 0.3727235, -0.2684787, 1, 1, 1, 1, 1,
0.9145498, -0.1558949, 2.90161, 1, 1, 1, 1, 1,
0.9146734, 0.1960942, 2.169662, 1, 1, 1, 1, 1,
0.9150704, 1.491221, -0.3747193, 1, 1, 1, 1, 1,
0.9210214, 0.9324386, 0.6453601, 1, 1, 1, 1, 1,
0.9252253, 0.4602476, 0.8641093, 1, 1, 1, 1, 1,
0.9258914, 1.498037, 0.709927, 1, 1, 1, 1, 1,
0.9584989, 1.614567, -0.2624984, 1, 1, 1, 1, 1,
0.9682057, 1.392299, -1.723147, 0, 0, 1, 1, 1,
0.9781169, 1.10887, -0.1121899, 1, 0, 0, 1, 1,
0.9825217, -0.7728146, 4.266445, 1, 0, 0, 1, 1,
0.9845645, 1.123777, 0.9741701, 1, 0, 0, 1, 1,
0.9881161, 0.2456903, 0.9901533, 1, 0, 0, 1, 1,
0.9957542, -0.02410247, -0.3641239, 1, 0, 0, 1, 1,
1.00124, -1.334241, 5.743095, 0, 0, 0, 1, 1,
1.002609, 0.2436502, -0.5981427, 0, 0, 0, 1, 1,
1.014856, -0.5838372, 1.648091, 0, 0, 0, 1, 1,
1.016129, 0.09543078, 1.749482, 0, 0, 0, 1, 1,
1.017164, -1.212088, 1.820469, 0, 0, 0, 1, 1,
1.017777, -1.275284, 3.019849, 0, 0, 0, 1, 1,
1.018778, 1.668398, -0.670028, 0, 0, 0, 1, 1,
1.019986, -0.06496286, 2.609809, 1, 1, 1, 1, 1,
1.0218, -1.847752, 3.445504, 1, 1, 1, 1, 1,
1.030187, 0.5549636, -0.1548235, 1, 1, 1, 1, 1,
1.037727, -2.179332, -0.1980327, 1, 1, 1, 1, 1,
1.037837, -0.6018203, 1.483424, 1, 1, 1, 1, 1,
1.037944, 0.171341, 1.975436, 1, 1, 1, 1, 1,
1.041965, 0.4717084, 0.1651848, 1, 1, 1, 1, 1,
1.046392, -0.05951453, 0.3297293, 1, 1, 1, 1, 1,
1.052792, 2.410034, 0.4275967, 1, 1, 1, 1, 1,
1.054658, -1.268956, 3.491198, 1, 1, 1, 1, 1,
1.056992, 0.03538512, -1.043237, 1, 1, 1, 1, 1,
1.057554, -0.6242385, 2.727136, 1, 1, 1, 1, 1,
1.06172, 1.677704, 1.067251, 1, 1, 1, 1, 1,
1.064312, 0.5448684, 0.6981271, 1, 1, 1, 1, 1,
1.070361, 1.030588, -0.5372636, 1, 1, 1, 1, 1,
1.078855, -1.42736, 3.325961, 0, 0, 1, 1, 1,
1.083593, -0.236154, 0.6571499, 1, 0, 0, 1, 1,
1.09891, -0.6910241, 1.561451, 1, 0, 0, 1, 1,
1.100049, 0.366634, 1.395674, 1, 0, 0, 1, 1,
1.101092, -1.004783, 0.998232, 1, 0, 0, 1, 1,
1.111898, -0.4543138, 0.1919909, 1, 0, 0, 1, 1,
1.120111, 1.164712, 0.7840808, 0, 0, 0, 1, 1,
1.136082, 1.145986, -0.2696026, 0, 0, 0, 1, 1,
1.142073, 1.594591, 0.9261146, 0, 0, 0, 1, 1,
1.150403, -0.4135619, 1.760727, 0, 0, 0, 1, 1,
1.159312, 0.34733, 2.171026, 0, 0, 0, 1, 1,
1.174234, 0.400369, 1.63255, 0, 0, 0, 1, 1,
1.183098, 0.4237575, 0.6345578, 0, 0, 0, 1, 1,
1.189867, -0.2105969, 4.105822, 1, 1, 1, 1, 1,
1.190175, 1.98601, -0.03486468, 1, 1, 1, 1, 1,
1.191546, 0.9366143, 0.3442273, 1, 1, 1, 1, 1,
1.205703, 0.8687989, 1.272585, 1, 1, 1, 1, 1,
1.208623, -0.9164748, 2.207224, 1, 1, 1, 1, 1,
1.209303, -0.9775066, 3.313284, 1, 1, 1, 1, 1,
1.209661, -0.2297384, 1.392045, 1, 1, 1, 1, 1,
1.215447, -0.6710018, 3.234494, 1, 1, 1, 1, 1,
1.21648, 0.05361842, 0.8166429, 1, 1, 1, 1, 1,
1.220851, -0.5934303, 2.683921, 1, 1, 1, 1, 1,
1.224439, -1.042285, 2.509807, 1, 1, 1, 1, 1,
1.225866, -0.01974626, 3.816691, 1, 1, 1, 1, 1,
1.231575, 0.8371317, 0.56301, 1, 1, 1, 1, 1,
1.236055, 0.1638824, 0.6902347, 1, 1, 1, 1, 1,
1.259858, 0.9532891, 2.732754, 1, 1, 1, 1, 1,
1.263958, -0.05835317, 0.6029013, 0, 0, 1, 1, 1,
1.285713, 1.18808, -0.6552141, 1, 0, 0, 1, 1,
1.28883, 1.484113, 0.6037845, 1, 0, 0, 1, 1,
1.293871, 0.5580721, 1.907583, 1, 0, 0, 1, 1,
1.295977, -0.7669334, 3.467911, 1, 0, 0, 1, 1,
1.308457, 0.4972154, 2.034196, 1, 0, 0, 1, 1,
1.309955, -1.076866, 2.572359, 0, 0, 0, 1, 1,
1.32032, -0.3216778, 2.750049, 0, 0, 0, 1, 1,
1.32627, -0.645259, 1.513969, 0, 0, 0, 1, 1,
1.331272, 0.2901877, 2.343734, 0, 0, 0, 1, 1,
1.33567, -0.03340139, 1.908204, 0, 0, 0, 1, 1,
1.348731, -0.7787749, 1.943771, 0, 0, 0, 1, 1,
1.354282, -0.576969, 1.884913, 0, 0, 0, 1, 1,
1.354871, -0.3545502, 2.780912, 1, 1, 1, 1, 1,
1.369866, 0.09768035, 0.8796551, 1, 1, 1, 1, 1,
1.383085, -0.4664453, 0.1867379, 1, 1, 1, 1, 1,
1.410988, -0.1509016, 3.694408, 1, 1, 1, 1, 1,
1.457323, -0.1290157, 2.055521, 1, 1, 1, 1, 1,
1.46179, 0.839027, 0.8810297, 1, 1, 1, 1, 1,
1.46583, 0.6138923, 0.7107047, 1, 1, 1, 1, 1,
1.47281, -0.04614868, 2.604662, 1, 1, 1, 1, 1,
1.483106, 1.299255, 1.061522, 1, 1, 1, 1, 1,
1.483389, 1.32991, -0.5230174, 1, 1, 1, 1, 1,
1.489763, -1.303371, 2.151309, 1, 1, 1, 1, 1,
1.491122, -0.3282472, 2.394004, 1, 1, 1, 1, 1,
1.496809, 0.9598622, 0.5343608, 1, 1, 1, 1, 1,
1.50496, 0.7576031, 1.71956, 1, 1, 1, 1, 1,
1.508026, 0.6218755, 2.243358, 1, 1, 1, 1, 1,
1.511885, 0.45497, 0.5192277, 0, 0, 1, 1, 1,
1.515705, -1.366129, 2.398823, 1, 0, 0, 1, 1,
1.517512, 0.9408532, -0.0165795, 1, 0, 0, 1, 1,
1.526621, -0.2836103, -1.04054, 1, 0, 0, 1, 1,
1.540098, -0.5396694, 0.6805081, 1, 0, 0, 1, 1,
1.544004, 1.622856, 0.4575887, 1, 0, 0, 1, 1,
1.544641, 0.3655789, 1.884987, 0, 0, 0, 1, 1,
1.561643, -1.256396, 2.137468, 0, 0, 0, 1, 1,
1.569735, 1.134038, 0.8758237, 0, 0, 0, 1, 1,
1.574761, -0.05907268, -0.4321278, 0, 0, 0, 1, 1,
1.584625, 0.1327951, 1.77772, 0, 0, 0, 1, 1,
1.587649, 1.653139, 0.3257813, 0, 0, 0, 1, 1,
1.608152, 0.5687542, 0.4223638, 0, 0, 0, 1, 1,
1.624882, -0.6395921, 3.546786, 1, 1, 1, 1, 1,
1.632729, 0.6772245, 0.9937692, 1, 1, 1, 1, 1,
1.633114, 0.5730663, 1.188276, 1, 1, 1, 1, 1,
1.636416, 1.781387, 1.655087, 1, 1, 1, 1, 1,
1.647203, 0.6902631, 2.381545, 1, 1, 1, 1, 1,
1.651811, -0.802087, 2.082813, 1, 1, 1, 1, 1,
1.652619, -1.416266, 2.820216, 1, 1, 1, 1, 1,
1.661424, 0.6763849, 0.7086803, 1, 1, 1, 1, 1,
1.707412, 0.6065882, 0.9582096, 1, 1, 1, 1, 1,
1.71624, 0.4533506, 0.4855567, 1, 1, 1, 1, 1,
1.716334, 1.125469, 1.066464, 1, 1, 1, 1, 1,
1.720218, 0.751081, 0.5492877, 1, 1, 1, 1, 1,
1.724301, 0.7850162, 0.7923639, 1, 1, 1, 1, 1,
1.726082, 0.6934435, 1.758974, 1, 1, 1, 1, 1,
1.729144, 0.1362335, 0.4868092, 1, 1, 1, 1, 1,
1.752909, 0.6676348, 1.73886, 0, 0, 1, 1, 1,
1.769072, -0.02081544, 1.905962, 1, 0, 0, 1, 1,
1.778731, 0.6258971, 1.150639, 1, 0, 0, 1, 1,
1.800038, 0.6055219, 0.1074016, 1, 0, 0, 1, 1,
1.806018, 0.7737041, 0.6746126, 1, 0, 0, 1, 1,
1.821239, 1.216709, 2.264081, 1, 0, 0, 1, 1,
1.857028, -0.6091256, 1.836766, 0, 0, 0, 1, 1,
1.872417, -0.08185522, 1.61757, 0, 0, 0, 1, 1,
1.874402, -0.8762633, 2.223541, 0, 0, 0, 1, 1,
1.87551, -0.2155944, 1.814153, 0, 0, 0, 1, 1,
1.893549, -0.2996534, 3.151428, 0, 0, 0, 1, 1,
1.912927, -1.160529, 1.428808, 0, 0, 0, 1, 1,
1.923469, 2.336484, 0.6626331, 0, 0, 0, 1, 1,
1.929672, -1.519872, 3.507232, 1, 1, 1, 1, 1,
1.939551, -0.7062253, 2.463209, 1, 1, 1, 1, 1,
1.972838, 0.9099956, -0.3951309, 1, 1, 1, 1, 1,
1.974856, 0.6337715, 1.444223, 1, 1, 1, 1, 1,
1.986793, -0.4573983, 2.969908, 1, 1, 1, 1, 1,
2.011904, 0.3226737, 0.5032507, 1, 1, 1, 1, 1,
2.022599, -1.772682, 2.288996, 1, 1, 1, 1, 1,
2.031686, 0.3189323, 1.774761, 1, 1, 1, 1, 1,
2.042129, 1.399064, 1.561049, 1, 1, 1, 1, 1,
2.052544, 0.2269651, 0.6311136, 1, 1, 1, 1, 1,
2.059863, 1.63076, 2.979333, 1, 1, 1, 1, 1,
2.08966, -1.043764, 3.052699, 1, 1, 1, 1, 1,
2.092513, -0.1418511, 1.295145, 1, 1, 1, 1, 1,
2.095921, 0.6985069, 1.642945, 1, 1, 1, 1, 1,
2.098879, -2.647924, 2.050369, 1, 1, 1, 1, 1,
2.108639, 0.1281534, 1.477575, 0, 0, 1, 1, 1,
2.11033, -0.3465611, 0.7530141, 1, 0, 0, 1, 1,
2.119543, 1.158417, 1.322761, 1, 0, 0, 1, 1,
2.197453, -1.240344, 2.26016, 1, 0, 0, 1, 1,
2.213315, 0.5329583, 1.852928, 1, 0, 0, 1, 1,
2.274615, 1.791194, 0.7869489, 1, 0, 0, 1, 1,
2.324825, -1.349837, 1.616207, 0, 0, 0, 1, 1,
2.335659, -0.4461907, 0.993437, 0, 0, 0, 1, 1,
2.376079, -1.223616, 3.156471, 0, 0, 0, 1, 1,
2.377315, 1.054786, 1.364364, 0, 0, 0, 1, 1,
2.480448, -0.3370999, 1.814624, 0, 0, 0, 1, 1,
2.536108, 2.430354, 0.785763, 0, 0, 0, 1, 1,
2.544404, 0.2302679, 2.500542, 0, 0, 0, 1, 1,
2.549215, 1.638674, 2.018698, 1, 1, 1, 1, 1,
2.556171, 0.3720497, 1.183409, 1, 1, 1, 1, 1,
2.650954, -1.38431, 0.3003206, 1, 1, 1, 1, 1,
2.747166, -0.1930532, 1.758694, 1, 1, 1, 1, 1,
2.897804, -0.3726465, 2.06576, 1, 1, 1, 1, 1,
3.279277, 1.110465, 1.917743, 1, 1, 1, 1, 1,
3.394791, 1.08113, 0.9151665, 1, 1, 1, 1, 1
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
var radius = 9.631585;
var distance = 33.83053;
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
mvMatrix.translate( -0.1308105, 0.1687968, -0.2939103 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.83053);
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
