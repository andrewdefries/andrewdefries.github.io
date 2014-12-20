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
-3.067506, 0.07341114, -2.076247, 1, 0, 0, 1,
-2.855228, 0.07708122, -1.42883, 1, 0.007843138, 0, 1,
-2.811718, -0.07902624, -1.662802, 1, 0.01176471, 0, 1,
-2.744236, 0.8582666, -3.217026, 1, 0.01960784, 0, 1,
-2.663399, -0.2586012, -1.990745, 1, 0.02352941, 0, 1,
-2.604599, 0.6419848, -2.846142, 1, 0.03137255, 0, 1,
-2.578621, -0.496092, -0.6995152, 1, 0.03529412, 0, 1,
-2.490451, 1.109313, -0.3593134, 1, 0.04313726, 0, 1,
-2.488087, 0.0691549, -3.384381, 1, 0.04705882, 0, 1,
-2.395145, 1.342733, -2.336616, 1, 0.05490196, 0, 1,
-2.368575, -0.409731, -1.907236, 1, 0.05882353, 0, 1,
-2.360941, 1.158088, -1.191288, 1, 0.06666667, 0, 1,
-2.315011, 0.57167, -1.235509, 1, 0.07058824, 0, 1,
-2.306472, 1.15882, -2.248753, 1, 0.07843138, 0, 1,
-2.240555, 0.5132321, -0.03885021, 1, 0.08235294, 0, 1,
-2.240186, 0.6568236, -0.4320841, 1, 0.09019608, 0, 1,
-2.175346, -0.02241963, -4.001216, 1, 0.09411765, 0, 1,
-2.159481, 0.2599088, -2.18989, 1, 0.1019608, 0, 1,
-2.143969, -1.067089, -2.493771, 1, 0.1098039, 0, 1,
-2.11341, 0.294022, -0.3686106, 1, 0.1137255, 0, 1,
-2.07143, -1.351174, -1.947289, 1, 0.1215686, 0, 1,
-2.0501, 1.113237, -1.464134, 1, 0.1254902, 0, 1,
-2.047413, -0.2721693, -0.5306486, 1, 0.1333333, 0, 1,
-2.039566, 1.449103, -1.484634, 1, 0.1372549, 0, 1,
-2.036406, -0.6948423, -1.242096, 1, 0.145098, 0, 1,
-2.01981, -0.2512136, -1.156015, 1, 0.1490196, 0, 1,
-2.019371, -0.543642, -2.198311, 1, 0.1568628, 0, 1,
-2.012307, -1.01302, -2.186766, 1, 0.1607843, 0, 1,
-2.011062, -1.15157, -2.529481, 1, 0.1686275, 0, 1,
-2.006917, -1.406061, -1.651929, 1, 0.172549, 0, 1,
-2.002458, -0.4597804, -1.964521, 1, 0.1803922, 0, 1,
-1.996618, 0.6704707, -2.786043, 1, 0.1843137, 0, 1,
-1.984352, -2.097626, -3.994914, 1, 0.1921569, 0, 1,
-1.980132, -1.381319, -2.204997, 1, 0.1960784, 0, 1,
-1.88129, 0.04101468, -2.423849, 1, 0.2039216, 0, 1,
-1.858436, 0.9764236, -1.256919, 1, 0.2117647, 0, 1,
-1.851146, 0.3748106, -2.178082, 1, 0.2156863, 0, 1,
-1.84208, 5.913494e-05, -0.05150182, 1, 0.2235294, 0, 1,
-1.837906, 0.8658143, -2.699815, 1, 0.227451, 0, 1,
-1.820491, -0.4245234, -1.396458, 1, 0.2352941, 0, 1,
-1.818552, 1.236755, 1.163896, 1, 0.2392157, 0, 1,
-1.793798, 2.318706, -0.2652164, 1, 0.2470588, 0, 1,
-1.793233, 0.01678001, -2.841356, 1, 0.2509804, 0, 1,
-1.774692, 1.118513, -0.6033748, 1, 0.2588235, 0, 1,
-1.773854, -1.501479, -2.294173, 1, 0.2627451, 0, 1,
-1.769243, 1.095019, -1.977791, 1, 0.2705882, 0, 1,
-1.755278, -0.7928933, -1.534048, 1, 0.2745098, 0, 1,
-1.747722, -0.2560899, -1.541115, 1, 0.282353, 0, 1,
-1.712579, -0.2227989, -0.8042762, 1, 0.2862745, 0, 1,
-1.698106, 0.7688991, -0.2107788, 1, 0.2941177, 0, 1,
-1.695917, 0.2113232, -0.375041, 1, 0.3019608, 0, 1,
-1.677238, 0.2940406, -0.1696126, 1, 0.3058824, 0, 1,
-1.675496, 0.2812022, -1.8954, 1, 0.3137255, 0, 1,
-1.662322, 1.22833, -1.476601, 1, 0.3176471, 0, 1,
-1.66204, 0.6050677, -2.518363, 1, 0.3254902, 0, 1,
-1.660632, 1.351915, -1.271613, 1, 0.3294118, 0, 1,
-1.656084, 0.8867503, -0.9031886, 1, 0.3372549, 0, 1,
-1.650865, -0.05290392, -0.1537438, 1, 0.3411765, 0, 1,
-1.622876, -0.0471755, -4.144262, 1, 0.3490196, 0, 1,
-1.612901, -0.3955025, -2.186279, 1, 0.3529412, 0, 1,
-1.610664, -1.180794, -4.861651, 1, 0.3607843, 0, 1,
-1.608515, 0.05051728, -1.960047, 1, 0.3647059, 0, 1,
-1.607759, -0.6799323, -1.443097, 1, 0.372549, 0, 1,
-1.605894, -1.157031, -0.3873042, 1, 0.3764706, 0, 1,
-1.586717, 1.960712, 0.3424735, 1, 0.3843137, 0, 1,
-1.572271, -0.3966727, -1.044644, 1, 0.3882353, 0, 1,
-1.551417, -1.599689, -2.77261, 1, 0.3960784, 0, 1,
-1.540289, -1.346896, -3.909792, 1, 0.4039216, 0, 1,
-1.515403, 0.4140433, -0.7260997, 1, 0.4078431, 0, 1,
-1.511013, 0.1102549, -1.309867, 1, 0.4156863, 0, 1,
-1.505314, -0.06417271, -2.735759, 1, 0.4196078, 0, 1,
-1.504972, 2.297266, -0.9574478, 1, 0.427451, 0, 1,
-1.504897, -0.3547449, -1.423742, 1, 0.4313726, 0, 1,
-1.503019, -1.39682, -1.484596, 1, 0.4392157, 0, 1,
-1.491866, -0.7152964, -1.669248, 1, 0.4431373, 0, 1,
-1.487487, 0.02637626, -1.193399, 1, 0.4509804, 0, 1,
-1.481571, -0.3337553, -0.9624764, 1, 0.454902, 0, 1,
-1.480407, 0.9561751, 0.4705169, 1, 0.4627451, 0, 1,
-1.479733, 1.616543, -0.1718856, 1, 0.4666667, 0, 1,
-1.455434, -2.331451, -1.175115, 1, 0.4745098, 0, 1,
-1.453132, -0.257662, -1.504715, 1, 0.4784314, 0, 1,
-1.446909, 0.5203352, -2.093254, 1, 0.4862745, 0, 1,
-1.438528, 1.514403, 0.9207317, 1, 0.4901961, 0, 1,
-1.436073, -1.789998, -1.096986, 1, 0.4980392, 0, 1,
-1.420246, 1.524315, -1.960636, 1, 0.5058824, 0, 1,
-1.413948, -0.8670794, -1.364347, 1, 0.509804, 0, 1,
-1.411679, -0.1267949, -1.31416, 1, 0.5176471, 0, 1,
-1.40904, 1.656197, -2.307583, 1, 0.5215687, 0, 1,
-1.396678, -1.352155, -1.24397, 1, 0.5294118, 0, 1,
-1.385779, 1.583126, 0.6567731, 1, 0.5333334, 0, 1,
-1.383455, -0.7734481, -2.772136, 1, 0.5411765, 0, 1,
-1.377833, 1.395384, -2.384132, 1, 0.5450981, 0, 1,
-1.372552, -0.2882911, -1.243348, 1, 0.5529412, 0, 1,
-1.368531, -2.02561, -2.024669, 1, 0.5568628, 0, 1,
-1.364326, 0.9171855, -1.371449, 1, 0.5647059, 0, 1,
-1.34791, -0.4148853, -2.378881, 1, 0.5686275, 0, 1,
-1.343142, -0.3273565, -1.645577, 1, 0.5764706, 0, 1,
-1.341525, 0.6982512, -0.07904551, 1, 0.5803922, 0, 1,
-1.33537, -0.2706336, -3.158134, 1, 0.5882353, 0, 1,
-1.332959, 0.8446137, -1.898605, 1, 0.5921569, 0, 1,
-1.329599, 0.5839107, -1.371959, 1, 0.6, 0, 1,
-1.323505, -1.588715, -2.296695, 1, 0.6078432, 0, 1,
-1.316828, -0.4456541, -2.65847, 1, 0.6117647, 0, 1,
-1.314194, -0.9322427, -3.897358, 1, 0.6196079, 0, 1,
-1.31247, 0.3519657, -1.422781, 1, 0.6235294, 0, 1,
-1.307159, 0.05155185, -1.667933, 1, 0.6313726, 0, 1,
-1.302977, 1.31573, -0.9789556, 1, 0.6352941, 0, 1,
-1.299444, -0.3935032, -0.00844689, 1, 0.6431373, 0, 1,
-1.293093, 1.41777, -1.758884, 1, 0.6470588, 0, 1,
-1.291425, -0.3038796, -1.92088, 1, 0.654902, 0, 1,
-1.280901, -0.04134184, -0.7735274, 1, 0.6588235, 0, 1,
-1.261572, 1.630358, 0.1134129, 1, 0.6666667, 0, 1,
-1.256405, 0.9092877, -1.104069, 1, 0.6705883, 0, 1,
-1.243887, 1.227247, -1.254079, 1, 0.6784314, 0, 1,
-1.240659, 1.043978, 1.188272, 1, 0.682353, 0, 1,
-1.240355, 0.633778, -1.063018, 1, 0.6901961, 0, 1,
-1.240276, 0.49188, 0.5479628, 1, 0.6941177, 0, 1,
-1.226728, 0.8990361, -0.9631507, 1, 0.7019608, 0, 1,
-1.221789, 1.179688, 0.0005439071, 1, 0.7098039, 0, 1,
-1.195537, 0.515554, -0.9516137, 1, 0.7137255, 0, 1,
-1.186545, 0.3592879, -1.106753, 1, 0.7215686, 0, 1,
-1.182526, 0.2952483, -1.637465, 1, 0.7254902, 0, 1,
-1.176632, -1.376673, -2.09927, 1, 0.7333333, 0, 1,
-1.173667, 1.396091, -0.8103015, 1, 0.7372549, 0, 1,
-1.151348, 0.3786927, -0.3459039, 1, 0.7450981, 0, 1,
-1.148254, -1.217664, -2.461539, 1, 0.7490196, 0, 1,
-1.146553, 0.6970034, -0.3630522, 1, 0.7568628, 0, 1,
-1.140873, -0.1354648, -1.176242, 1, 0.7607843, 0, 1,
-1.139544, 1.168969, -2.23745, 1, 0.7686275, 0, 1,
-1.133916, -0.8238055, -2.666709, 1, 0.772549, 0, 1,
-1.133508, -0.9195603, -1.744932, 1, 0.7803922, 0, 1,
-1.124547, 0.6341634, -1.206698, 1, 0.7843137, 0, 1,
-1.117758, -0.06392748, -0.5852848, 1, 0.7921569, 0, 1,
-1.107618, 0.2528718, 1.49362, 1, 0.7960784, 0, 1,
-1.102724, 1.009713, -0.4603698, 1, 0.8039216, 0, 1,
-1.096243, -0.6274142, -3.352945, 1, 0.8117647, 0, 1,
-1.094684, 0.07492627, -2.356892, 1, 0.8156863, 0, 1,
-1.093735, 1.761915, -1.039959, 1, 0.8235294, 0, 1,
-1.078333, -0.7603081, -2.998706, 1, 0.827451, 0, 1,
-1.076282, -1.700576, -2.516264, 1, 0.8352941, 0, 1,
-1.072979, -0.2966112, -4.783597, 1, 0.8392157, 0, 1,
-1.063804, 1.328105, -0.1013682, 1, 0.8470588, 0, 1,
-1.060986, -1.188204, -2.76798, 1, 0.8509804, 0, 1,
-1.059645, -1.249899, -0.8809983, 1, 0.8588235, 0, 1,
-1.05844, 0.6172881, -0.4322503, 1, 0.8627451, 0, 1,
-1.04758, -0.6584355, -1.204357, 1, 0.8705882, 0, 1,
-1.0454, 0.07538889, -1.680305, 1, 0.8745098, 0, 1,
-1.045135, -0.9381033, -1.261075, 1, 0.8823529, 0, 1,
-1.041771, 1.821078, -0.9052659, 1, 0.8862745, 0, 1,
-1.038676, 1.349934, -1.639742, 1, 0.8941177, 0, 1,
-1.033034, 0.201865, -2.763654, 1, 0.8980392, 0, 1,
-1.031539, -0.6007164, -1.620685, 1, 0.9058824, 0, 1,
-1.030571, 1.808846, -1.203706, 1, 0.9137255, 0, 1,
-1.022484, 1.363527, 0.2476932, 1, 0.9176471, 0, 1,
-1.016216, -0.314892, 0.703753, 1, 0.9254902, 0, 1,
-1.004166, -1.399361, -3.379571, 1, 0.9294118, 0, 1,
-1.002681, -0.3314877, -3.974774, 1, 0.9372549, 0, 1,
-0.9973197, 0.259082, -1.764964, 1, 0.9411765, 0, 1,
-0.9908524, -0.6630539, -2.186334, 1, 0.9490196, 0, 1,
-0.98835, 0.8742192, -2.380933, 1, 0.9529412, 0, 1,
-0.9858087, -0.139646, -3.80936, 1, 0.9607843, 0, 1,
-0.969241, -0.2428306, -1.442972, 1, 0.9647059, 0, 1,
-0.9689232, 0.2520189, -1.189605, 1, 0.972549, 0, 1,
-0.9606879, -2.755814, -2.152727, 1, 0.9764706, 0, 1,
-0.9603406, 2.12626, 2.046057, 1, 0.9843137, 0, 1,
-0.9597023, 0.05503889, -0.5758312, 1, 0.9882353, 0, 1,
-0.958442, -0.7278183, -2.804631, 1, 0.9960784, 0, 1,
-0.9579936, 1.175223, -0.2028646, 0.9960784, 1, 0, 1,
-0.9559191, -1.255614, -2.248052, 0.9921569, 1, 0, 1,
-0.9517219, 0.03925969, -1.310059, 0.9843137, 1, 0, 1,
-0.9475724, 1.776401, -0.2539968, 0.9803922, 1, 0, 1,
-0.9469326, -0.8955657, -2.948869, 0.972549, 1, 0, 1,
-0.9464436, 0.2166933, -3.15317, 0.9686275, 1, 0, 1,
-0.9448598, 0.07165311, -0.03862371, 0.9607843, 1, 0, 1,
-0.941086, -0.7269756, -1.670755, 0.9568627, 1, 0, 1,
-0.9337948, 0.6976156, 0.05602299, 0.9490196, 1, 0, 1,
-0.9104671, -0.09145418, -1.418953, 0.945098, 1, 0, 1,
-0.9074183, -0.6920178, -3.589013, 0.9372549, 1, 0, 1,
-0.9030446, 0.8991664, -0.1361105, 0.9333333, 1, 0, 1,
-0.8984076, 0.626843, 0.3878183, 0.9254902, 1, 0, 1,
-0.8955452, -0.3107314, -1.212744, 0.9215686, 1, 0, 1,
-0.8925541, -1.464754, -2.356826, 0.9137255, 1, 0, 1,
-0.8855735, 0.02561673, -0.851428, 0.9098039, 1, 0, 1,
-0.8803961, -0.6933187, -2.820638, 0.9019608, 1, 0, 1,
-0.8752189, -0.5290041, -2.951771, 0.8941177, 1, 0, 1,
-0.8728645, -0.8234585, -3.863993, 0.8901961, 1, 0, 1,
-0.8693924, 0.5317951, -1.013196, 0.8823529, 1, 0, 1,
-0.8690624, 0.0009309271, -3.236578, 0.8784314, 1, 0, 1,
-0.8678331, 1.74194, -0.7587824, 0.8705882, 1, 0, 1,
-0.8665676, 1.142689, -0.3213867, 0.8666667, 1, 0, 1,
-0.8662112, -1.31716, -1.541825, 0.8588235, 1, 0, 1,
-0.8653425, -0.5150146, -1.439543, 0.854902, 1, 0, 1,
-0.8643255, -0.7288881, -0.0761149, 0.8470588, 1, 0, 1,
-0.861122, -1.551795, -4.105384, 0.8431373, 1, 0, 1,
-0.86107, 0.9571769, -0.7537377, 0.8352941, 1, 0, 1,
-0.8581529, 1.5335, 0.3019535, 0.8313726, 1, 0, 1,
-0.8571632, -2.946694, -3.0732, 0.8235294, 1, 0, 1,
-0.8567789, 1.587969, -2.22922, 0.8196079, 1, 0, 1,
-0.8539174, -0.04563587, -0.9031279, 0.8117647, 1, 0, 1,
-0.8479599, -0.08133034, -1.12036, 0.8078431, 1, 0, 1,
-0.845406, -1.122868, -1.638609, 0.8, 1, 0, 1,
-0.8433006, 0.1192026, -1.228086, 0.7921569, 1, 0, 1,
-0.8292059, 0.2025869, -1.176193, 0.7882353, 1, 0, 1,
-0.8262237, 0.4864483, -0.4645305, 0.7803922, 1, 0, 1,
-0.8235245, 0.1360745, -1.362438, 0.7764706, 1, 0, 1,
-0.8211281, -0.9384513, -3.81647, 0.7686275, 1, 0, 1,
-0.8163738, 1.038887, -0.4539444, 0.7647059, 1, 0, 1,
-0.8158982, 0.09204224, -1.343057, 0.7568628, 1, 0, 1,
-0.8144159, -0.1856835, -3.048863, 0.7529412, 1, 0, 1,
-0.8127025, 1.655081, -1.176077, 0.7450981, 1, 0, 1,
-0.8096191, 0.08012058, -2.107608, 0.7411765, 1, 0, 1,
-0.8080989, -0.3420453, -1.590391, 0.7333333, 1, 0, 1,
-0.8078645, -2.677358, -3.394301, 0.7294118, 1, 0, 1,
-0.7970608, -0.7157046, -4.179996, 0.7215686, 1, 0, 1,
-0.7960001, 0.01883871, -3.169446, 0.7176471, 1, 0, 1,
-0.7958876, -1.093147, -2.549694, 0.7098039, 1, 0, 1,
-0.7954163, 0.5586228, -1.562142, 0.7058824, 1, 0, 1,
-0.795229, -0.1309, -2.779395, 0.6980392, 1, 0, 1,
-0.7929233, 0.6582925, -0.3621832, 0.6901961, 1, 0, 1,
-0.7898881, 0.5635998, -2.030849, 0.6862745, 1, 0, 1,
-0.7875539, -0.5924293, -4.065513, 0.6784314, 1, 0, 1,
-0.7817474, 0.767243, -0.2462098, 0.6745098, 1, 0, 1,
-0.7814786, 0.6926448, -1.03019, 0.6666667, 1, 0, 1,
-0.7813926, 1.19367, -2.046376, 0.6627451, 1, 0, 1,
-0.7794051, 1.271109, -0.4854357, 0.654902, 1, 0, 1,
-0.7780533, 0.1785616, -1.035142, 0.6509804, 1, 0, 1,
-0.7749177, 0.2585227, -0.9202011, 0.6431373, 1, 0, 1,
-0.7614202, 0.3338341, -0.9412724, 0.6392157, 1, 0, 1,
-0.7531431, -0.108858, -2.477939, 0.6313726, 1, 0, 1,
-0.7525987, 1.823125, -0.1625219, 0.627451, 1, 0, 1,
-0.7508655, -1.339688, -1.655836, 0.6196079, 1, 0, 1,
-0.7497818, -0.04369284, -1.491229, 0.6156863, 1, 0, 1,
-0.7457458, 0.7168915, -1.300992, 0.6078432, 1, 0, 1,
-0.7438825, -1.052922, -2.817057, 0.6039216, 1, 0, 1,
-0.7438762, 1.240714, -1.653915, 0.5960785, 1, 0, 1,
-0.7431453, -0.1013259, -1.574388, 0.5882353, 1, 0, 1,
-0.7407155, -0.8485789, -2.547488, 0.5843138, 1, 0, 1,
-0.7371987, 0.03936218, -0.6184357, 0.5764706, 1, 0, 1,
-0.7322696, -0.3649126, -1.792027, 0.572549, 1, 0, 1,
-0.7305998, -1.957458, -2.915506, 0.5647059, 1, 0, 1,
-0.7273019, -0.7722041, -1.712162, 0.5607843, 1, 0, 1,
-0.7268648, -0.3837681, -2.755527, 0.5529412, 1, 0, 1,
-0.7181871, 0.5832842, -0.7616822, 0.5490196, 1, 0, 1,
-0.7172462, 0.6942549, -1.702668, 0.5411765, 1, 0, 1,
-0.714097, 1.202102, -0.8094101, 0.5372549, 1, 0, 1,
-0.7092729, -0.1147202, -2.849421, 0.5294118, 1, 0, 1,
-0.7080256, -1.702569, -2.566517, 0.5254902, 1, 0, 1,
-0.7069948, 0.1187137, -1.121145, 0.5176471, 1, 0, 1,
-0.7069902, 1.00076, -0.5132427, 0.5137255, 1, 0, 1,
-0.705794, -0.3295138, -2.283149, 0.5058824, 1, 0, 1,
-0.7050598, -1.63551, -4.057633, 0.5019608, 1, 0, 1,
-0.7016146, 0.6659142, 0.3099384, 0.4941176, 1, 0, 1,
-0.7008489, -2.141541, -2.306573, 0.4862745, 1, 0, 1,
-0.7004061, -0.8739782, -3.107624, 0.4823529, 1, 0, 1,
-0.7001309, 0.829338, 0.4252626, 0.4745098, 1, 0, 1,
-0.6995445, 0.7550703, -1.283112, 0.4705882, 1, 0, 1,
-0.6995274, -0.8304452, -1.698973, 0.4627451, 1, 0, 1,
-0.6904421, 0.3569714, -0.008306651, 0.4588235, 1, 0, 1,
-0.6828786, -1.022646, -3.283095, 0.4509804, 1, 0, 1,
-0.6795522, 0.5517522, 0.6103817, 0.4470588, 1, 0, 1,
-0.6775367, -0.6996922, -3.042871, 0.4392157, 1, 0, 1,
-0.6759982, 0.2873462, -1.854183, 0.4352941, 1, 0, 1,
-0.6735321, 0.8489494, -0.6429605, 0.427451, 1, 0, 1,
-0.6728168, -0.0896906, -1.501673, 0.4235294, 1, 0, 1,
-0.6716298, 0.5772486, -1.159407, 0.4156863, 1, 0, 1,
-0.670046, -2.435467, -2.551159, 0.4117647, 1, 0, 1,
-0.6675303, -0.3940479, -0.5384923, 0.4039216, 1, 0, 1,
-0.6669511, 0.8508996, -0.7582331, 0.3960784, 1, 0, 1,
-0.664108, -1.68683, -3.511431, 0.3921569, 1, 0, 1,
-0.6618613, 1.248834, -2.314465, 0.3843137, 1, 0, 1,
-0.6602778, -0.7151784, -3.050386, 0.3803922, 1, 0, 1,
-0.6579316, -0.3726908, -2.066572, 0.372549, 1, 0, 1,
-0.6539353, -0.7686157, -1.875548, 0.3686275, 1, 0, 1,
-0.646367, 0.7288203, -0.02226571, 0.3607843, 1, 0, 1,
-0.6417852, -0.9054049, -2.594844, 0.3568628, 1, 0, 1,
-0.6383759, 1.955831, 0.1784018, 0.3490196, 1, 0, 1,
-0.6369271, 1.556546, 0.9769203, 0.345098, 1, 0, 1,
-0.6368126, 1.806438, 1.531583, 0.3372549, 1, 0, 1,
-0.6330888, 0.8983059, -1.08951, 0.3333333, 1, 0, 1,
-0.6279613, -0.3870403, -2.036793, 0.3254902, 1, 0, 1,
-0.6274629, -1.560552, -1.493547, 0.3215686, 1, 0, 1,
-0.621883, -0.6582647, -0.9844668, 0.3137255, 1, 0, 1,
-0.6182894, 1.555161, -1.051488, 0.3098039, 1, 0, 1,
-0.6100722, 0.9026151, 0.9295151, 0.3019608, 1, 0, 1,
-0.6086183, 0.5156292, -1.40249, 0.2941177, 1, 0, 1,
-0.6075083, 0.6571241, -0.5645614, 0.2901961, 1, 0, 1,
-0.6041633, -2.773123, -2.659811, 0.282353, 1, 0, 1,
-0.5992832, 0.9954574, -0.5916288, 0.2784314, 1, 0, 1,
-0.5990936, 0.1710247, 0.3301335, 0.2705882, 1, 0, 1,
-0.5967277, -0.2189845, -1.363687, 0.2666667, 1, 0, 1,
-0.5938178, 0.3838477, -1.024265, 0.2588235, 1, 0, 1,
-0.5856187, 0.06917693, -1.438471, 0.254902, 1, 0, 1,
-0.5848568, 0.2689237, -1.216298, 0.2470588, 1, 0, 1,
-0.5828162, 0.4701795, -0.6773258, 0.2431373, 1, 0, 1,
-0.5782445, 1.809419, 0.2494669, 0.2352941, 1, 0, 1,
-0.5772588, 0.8763937, 0.2080952, 0.2313726, 1, 0, 1,
-0.5762298, 1.629418, -0.0244967, 0.2235294, 1, 0, 1,
-0.5730891, 0.1042635, -1.111339, 0.2196078, 1, 0, 1,
-0.5706201, 0.5116535, -0.3580934, 0.2117647, 1, 0, 1,
-0.5686237, 0.8427802, 0.5185437, 0.2078431, 1, 0, 1,
-0.560312, 1.495879, -0.1330265, 0.2, 1, 0, 1,
-0.5581796, -0.2219105, -2.376808, 0.1921569, 1, 0, 1,
-0.5488544, 0.2249857, -1.101755, 0.1882353, 1, 0, 1,
-0.545276, 1.070305, -0.7041206, 0.1803922, 1, 0, 1,
-0.5450513, 0.07694652, -2.408363, 0.1764706, 1, 0, 1,
-0.5360908, 0.5589587, -1.799532, 0.1686275, 1, 0, 1,
-0.5360788, -0.1129009, -1.672509, 0.1647059, 1, 0, 1,
-0.5350428, 0.2352974, 0.2449723, 0.1568628, 1, 0, 1,
-0.5334132, -0.374272, -4.589507, 0.1529412, 1, 0, 1,
-0.5318843, 1.105959, -0.3280107, 0.145098, 1, 0, 1,
-0.5317129, -0.7831925, -2.87572, 0.1411765, 1, 0, 1,
-0.5240367, -1.043471, -4.52853, 0.1333333, 1, 0, 1,
-0.523813, 1.481667, 0.05292102, 0.1294118, 1, 0, 1,
-0.5234744, 0.5820535, 0.5755273, 0.1215686, 1, 0, 1,
-0.5153211, -0.3312142, -1.876832, 0.1176471, 1, 0, 1,
-0.5145459, 1.01826, 0.2325145, 0.1098039, 1, 0, 1,
-0.513225, -1.05371, -2.809909, 0.1058824, 1, 0, 1,
-0.5063053, 0.01116916, -1.0081, 0.09803922, 1, 0, 1,
-0.5039987, 0.7262411, -0.7400464, 0.09019608, 1, 0, 1,
-0.5016202, 1.908255, 1.02153, 0.08627451, 1, 0, 1,
-0.5000374, -0.8675377, -3.86912, 0.07843138, 1, 0, 1,
-0.498014, 0.3960509, -1.248454, 0.07450981, 1, 0, 1,
-0.4964625, 0.09794089, -0.8631619, 0.06666667, 1, 0, 1,
-0.4945852, 1.676535, -2.465241, 0.0627451, 1, 0, 1,
-0.4939085, -0.1343871, -3.575636, 0.05490196, 1, 0, 1,
-0.4935318, 1.743522, -1.467409, 0.05098039, 1, 0, 1,
-0.49274, 1.196467, -1.973355, 0.04313726, 1, 0, 1,
-0.4892026, 1.33132, -1.196563, 0.03921569, 1, 0, 1,
-0.4816713, -0.1066004, -1.801876, 0.03137255, 1, 0, 1,
-0.481589, 0.7065259, -2.147684, 0.02745098, 1, 0, 1,
-0.4787268, -0.6366485, -1.478686, 0.01960784, 1, 0, 1,
-0.4751288, 0.2474358, -1.306246, 0.01568628, 1, 0, 1,
-0.4748994, 0.8997467, 0.9084415, 0.007843138, 1, 0, 1,
-0.4690492, -1.960373, -2.651627, 0.003921569, 1, 0, 1,
-0.4609262, 1.364145, -1.060893, 0, 1, 0.003921569, 1,
-0.458381, -1.21896, -3.83927, 0, 1, 0.01176471, 1,
-0.4580737, -0.3670347, -3.023807, 0, 1, 0.01568628, 1,
-0.4563105, 0.3204175, -2.566056, 0, 1, 0.02352941, 1,
-0.4546285, -1.918211, -2.44987, 0, 1, 0.02745098, 1,
-0.4511748, 0.3718896, -0.3908824, 0, 1, 0.03529412, 1,
-0.4493086, 0.01349546, -0.7489781, 0, 1, 0.03921569, 1,
-0.4474984, -2.796479, -4.502735, 0, 1, 0.04705882, 1,
-0.4446753, 0.7537116, -0.7838473, 0, 1, 0.05098039, 1,
-0.4442738, -0.7878076, -1.88847, 0, 1, 0.05882353, 1,
-0.442452, 0.8774831, -0.2899288, 0, 1, 0.0627451, 1,
-0.4421163, 0.9174737, -0.06644337, 0, 1, 0.07058824, 1,
-0.4415484, -0.5014269, 0.01342236, 0, 1, 0.07450981, 1,
-0.4369445, 1.134792, -0.5405675, 0, 1, 0.08235294, 1,
-0.4365285, -1.00022, -2.858339, 0, 1, 0.08627451, 1,
-0.4361679, -0.6170701, -3.176284, 0, 1, 0.09411765, 1,
-0.4336385, 2.347721, -2.299552, 0, 1, 0.1019608, 1,
-0.4329451, 0.0250847, -0.8388103, 0, 1, 0.1058824, 1,
-0.4329103, 0.3777237, 0.3542905, 0, 1, 0.1137255, 1,
-0.4325856, 0.9134709, 2.302161, 0, 1, 0.1176471, 1,
-0.431837, -0.2152726, -1.261468, 0, 1, 0.1254902, 1,
-0.4301786, 1.216796, 0.1286199, 0, 1, 0.1294118, 1,
-0.42311, -1.357588, -1.733234, 0, 1, 0.1372549, 1,
-0.4180006, -0.1515107, -1.244493, 0, 1, 0.1411765, 1,
-0.4163985, -2.744934, -3.319491, 0, 1, 0.1490196, 1,
-0.4145709, 0.1920372, -0.4554883, 0, 1, 0.1529412, 1,
-0.4088887, -0.1835696, -1.80753, 0, 1, 0.1607843, 1,
-0.4057171, 1.077005, -0.8712533, 0, 1, 0.1647059, 1,
-0.403437, -0.2313768, -3.191498, 0, 1, 0.172549, 1,
-0.3966615, 0.7551299, 0.09525552, 0, 1, 0.1764706, 1,
-0.3966518, 0.2716634, -2.61988, 0, 1, 0.1843137, 1,
-0.3894787, -0.2223859, -3.107848, 0, 1, 0.1882353, 1,
-0.3869651, 0.4434031, -0.1844114, 0, 1, 0.1960784, 1,
-0.3865647, 2.710563, 1.135422, 0, 1, 0.2039216, 1,
-0.3785456, -1.316107, -2.972986, 0, 1, 0.2078431, 1,
-0.3766161, 1.974068, 0.9030744, 0, 1, 0.2156863, 1,
-0.3765104, -2.103646, -4.360364, 0, 1, 0.2196078, 1,
-0.3759667, -0.8646035, -2.257317, 0, 1, 0.227451, 1,
-0.3680988, 0.6671997, -1.894457, 0, 1, 0.2313726, 1,
-0.3648951, -0.9895276, -2.941519, 0, 1, 0.2392157, 1,
-0.3644851, -1.679114, -5.530354, 0, 1, 0.2431373, 1,
-0.3644249, -2.454551, 0.5756668, 0, 1, 0.2509804, 1,
-0.3640663, -0.9484594, -1.856485, 0, 1, 0.254902, 1,
-0.3634478, -0.1286338, -3.095415, 0, 1, 0.2627451, 1,
-0.3588199, 2.804826, 1.05697, 0, 1, 0.2666667, 1,
-0.3531924, -0.1986482, -1.74332, 0, 1, 0.2745098, 1,
-0.352341, 0.4902715, -0.721448, 0, 1, 0.2784314, 1,
-0.3392626, 1.081423, -0.2774077, 0, 1, 0.2862745, 1,
-0.3367418, -0.5840786, -2.839193, 0, 1, 0.2901961, 1,
-0.3358211, 1.382487, -0.76313, 0, 1, 0.2980392, 1,
-0.3350409, 0.158984, -1.140509, 0, 1, 0.3058824, 1,
-0.3330854, 1.088685, -0.6106511, 0, 1, 0.3098039, 1,
-0.3315668, 0.6147963, 0.7858699, 0, 1, 0.3176471, 1,
-0.3223695, 1.716095, -0.3774223, 0, 1, 0.3215686, 1,
-0.3207611, 0.1168557, -1.367206, 0, 1, 0.3294118, 1,
-0.3102704, 1.346595, 0.6571868, 0, 1, 0.3333333, 1,
-0.303168, -0.2255576, -3.883422, 0, 1, 0.3411765, 1,
-0.3014589, -0.281652, -1.352338, 0, 1, 0.345098, 1,
-0.2975138, 0.02545986, -0.9565181, 0, 1, 0.3529412, 1,
-0.296378, -0.7112036, -2.186547, 0, 1, 0.3568628, 1,
-0.2920454, -0.6316597, -1.512289, 0, 1, 0.3647059, 1,
-0.2890663, 0.5703343, 0.01630775, 0, 1, 0.3686275, 1,
-0.2836877, -1.063546, -4.161486, 0, 1, 0.3764706, 1,
-0.2724428, 0.8918791, -0.4135158, 0, 1, 0.3803922, 1,
-0.2717655, -0.05175943, -0.6455222, 0, 1, 0.3882353, 1,
-0.271271, 0.6609246, -1.723039, 0, 1, 0.3921569, 1,
-0.2712115, -1.107331, -1.642596, 0, 1, 0.4, 1,
-0.2705735, -0.4576382, -3.270005, 0, 1, 0.4078431, 1,
-0.2635975, -0.5409457, -2.260454, 0, 1, 0.4117647, 1,
-0.2596278, -2.300709, -1.130217, 0, 1, 0.4196078, 1,
-0.2551691, -0.8568485, -3.268583, 0, 1, 0.4235294, 1,
-0.2548565, 1.388588, -0.504137, 0, 1, 0.4313726, 1,
-0.2529222, 0.2446123, -0.08634368, 0, 1, 0.4352941, 1,
-0.2523304, -0.1445879, -2.002915, 0, 1, 0.4431373, 1,
-0.2519368, 1.097474, -1.060417, 0, 1, 0.4470588, 1,
-0.2512048, 0.07017516, -1.742162, 0, 1, 0.454902, 1,
-0.2440011, -0.7858242, -1.759356, 0, 1, 0.4588235, 1,
-0.2424748, 0.767828, 1.28711, 0, 1, 0.4666667, 1,
-0.2268355, -1.547554, -2.953309, 0, 1, 0.4705882, 1,
-0.2248852, -1.019288, -3.463778, 0, 1, 0.4784314, 1,
-0.2244406, -1.091431, -4.105595, 0, 1, 0.4823529, 1,
-0.2239693, 0.2340172, 0.6791587, 0, 1, 0.4901961, 1,
-0.2213141, -0.004312306, -0.8948501, 0, 1, 0.4941176, 1,
-0.2209705, -0.4047728, -3.411803, 0, 1, 0.5019608, 1,
-0.2170428, 1.341484, 0.1203147, 0, 1, 0.509804, 1,
-0.2162985, -1.458381, -3.147717, 0, 1, 0.5137255, 1,
-0.2107634, -0.8057837, -3.240116, 0, 1, 0.5215687, 1,
-0.2101402, -0.9920952, -3.358589, 0, 1, 0.5254902, 1,
-0.2041959, 0.3099981, -1.506361, 0, 1, 0.5333334, 1,
-0.2033923, -0.5657355, -3.642141, 0, 1, 0.5372549, 1,
-0.1993917, 2.435433, 0.8688641, 0, 1, 0.5450981, 1,
-0.1988176, 0.0029633, -2.192339, 0, 1, 0.5490196, 1,
-0.198677, 1.288716, 0.07915683, 0, 1, 0.5568628, 1,
-0.1950247, -0.8712474, -2.095896, 0, 1, 0.5607843, 1,
-0.1918105, 0.9284866, -0.07925287, 0, 1, 0.5686275, 1,
-0.1910353, 0.5889429, -1.176616, 0, 1, 0.572549, 1,
-0.1889717, -0.2838039, -1.334688, 0, 1, 0.5803922, 1,
-0.1889565, -0.5349764, -3.098074, 0, 1, 0.5843138, 1,
-0.1877027, 0.6070814, -0.1334983, 0, 1, 0.5921569, 1,
-0.1874248, 0.5825607, 0.3704382, 0, 1, 0.5960785, 1,
-0.1744059, -0.06227059, -1.010959, 0, 1, 0.6039216, 1,
-0.1725194, -0.7921832, -2.86193, 0, 1, 0.6117647, 1,
-0.1696283, -0.2176063, -2.666617, 0, 1, 0.6156863, 1,
-0.165261, 1.439668, 0.4404951, 0, 1, 0.6235294, 1,
-0.1650801, -1.148011, -3.189775, 0, 1, 0.627451, 1,
-0.1637515, -2.72609, -4.371408, 0, 1, 0.6352941, 1,
-0.1620198, -0.400734, -2.8626, 0, 1, 0.6392157, 1,
-0.1618168, -0.04331043, -2.074521, 0, 1, 0.6470588, 1,
-0.157687, -0.1826037, -2.003263, 0, 1, 0.6509804, 1,
-0.1530669, 0.5609078, 0.2729182, 0, 1, 0.6588235, 1,
-0.1479676, 0.3668305, -0.09941882, 0, 1, 0.6627451, 1,
-0.1475728, -0.2320693, -1.443513, 0, 1, 0.6705883, 1,
-0.1444355, 0.4322233, -0.8509651, 0, 1, 0.6745098, 1,
-0.1435396, 0.08779354, -0.1670464, 0, 1, 0.682353, 1,
-0.1414156, -0.536024, -3.521419, 0, 1, 0.6862745, 1,
-0.1355116, 1.687604, 0.6090718, 0, 1, 0.6941177, 1,
-0.1344143, -1.123951, -3.675626, 0, 1, 0.7019608, 1,
-0.1313035, 0.6439029, -0.1913262, 0, 1, 0.7058824, 1,
-0.1312463, 0.4208321, -1.826672, 0, 1, 0.7137255, 1,
-0.1295072, 0.3133905, 0.5481367, 0, 1, 0.7176471, 1,
-0.1285838, 0.2450803, 0.2754622, 0, 1, 0.7254902, 1,
-0.1172729, -0.3962136, -2.855132, 0, 1, 0.7294118, 1,
-0.1143272, -0.871523, -2.419749, 0, 1, 0.7372549, 1,
-0.1137314, -1.747155, -3.279059, 0, 1, 0.7411765, 1,
-0.1114771, -1.86649, -3.060343, 0, 1, 0.7490196, 1,
-0.1090915, -0.7652387, -4.600836, 0, 1, 0.7529412, 1,
-0.1081527, 1.169242, 0.09072787, 0, 1, 0.7607843, 1,
-0.1068761, -0.7640911, -3.271253, 0, 1, 0.7647059, 1,
-0.1002697, 1.157073, -1.050072, 0, 1, 0.772549, 1,
-0.09567378, -0.2446272, -0.7510808, 0, 1, 0.7764706, 1,
-0.09474736, 0.107906, -0.5305899, 0, 1, 0.7843137, 1,
-0.09459253, -0.6073967, -4.415754, 0, 1, 0.7882353, 1,
-0.09426728, 0.3285516, -1.637397, 0, 1, 0.7960784, 1,
-0.09315783, 0.162473, -0.5967056, 0, 1, 0.8039216, 1,
-0.08867628, -1.687047, -3.246259, 0, 1, 0.8078431, 1,
-0.08677884, -0.413332, -2.484606, 0, 1, 0.8156863, 1,
-0.0838687, -1.037669, -2.963629, 0, 1, 0.8196079, 1,
-0.08003654, 0.287984, 0.06711697, 0, 1, 0.827451, 1,
-0.0796574, -0.5540629, -3.882154, 0, 1, 0.8313726, 1,
-0.07919488, 0.3535061, -1.16754, 0, 1, 0.8392157, 1,
-0.07649045, -1.103772, -2.726183, 0, 1, 0.8431373, 1,
-0.06764001, 0.1292779, -1.028457, 0, 1, 0.8509804, 1,
-0.06752699, -0.3644448, -0.6819316, 0, 1, 0.854902, 1,
-0.06745288, -0.05066231, -0.9223574, 0, 1, 0.8627451, 1,
-0.06584468, -0.02041114, -2.38428, 0, 1, 0.8666667, 1,
-0.06494589, 0.9362927, 1.38455, 0, 1, 0.8745098, 1,
-0.06405545, 1.241627, 2.16254, 0, 1, 0.8784314, 1,
-0.06362256, 0.9319721, -0.1734498, 0, 1, 0.8862745, 1,
-0.05871895, -0.2788955, -3.216988, 0, 1, 0.8901961, 1,
-0.05680725, 0.552137, 0.8641413, 0, 1, 0.8980392, 1,
-0.05576214, 1.078636, -0.1186081, 0, 1, 0.9058824, 1,
-0.0534899, 0.4617305, -1.446074, 0, 1, 0.9098039, 1,
-0.05239664, -0.1013874, -1.527868, 0, 1, 0.9176471, 1,
-0.04985325, 0.9546026, -0.402145, 0, 1, 0.9215686, 1,
-0.0482688, -0.4288773, -4.155959, 0, 1, 0.9294118, 1,
-0.0477225, 1.343205, 0.5382407, 0, 1, 0.9333333, 1,
-0.0475603, -0.5138197, -3.121092, 0, 1, 0.9411765, 1,
-0.03841656, 0.2423654, -0.478973, 0, 1, 0.945098, 1,
-0.0280531, 0.2403911, -0.7642679, 0, 1, 0.9529412, 1,
-0.02697365, -0.2972355, -4.801705, 0, 1, 0.9568627, 1,
-0.02577397, 0.5204043, 0.08350904, 0, 1, 0.9647059, 1,
-0.02153645, -0.2698649, -3.025049, 0, 1, 0.9686275, 1,
-0.01714169, 1.380105, 0.2917892, 0, 1, 0.9764706, 1,
-0.0140261, -1.672936, -2.113382, 0, 1, 0.9803922, 1,
-0.01170701, 0.8272879, 1.67608, 0, 1, 0.9882353, 1,
-0.01142911, 0.2026497, -0.5034231, 0, 1, 0.9921569, 1,
-0.01085157, -1.051129, -1.144712, 0, 1, 1, 1,
-0.007614241, 0.3884284, 0.4216368, 0, 0.9921569, 1, 1,
-0.0007945713, -0.4413145, -2.919431, 0, 0.9882353, 1, 1,
0.002253623, 0.1029687, 0.9440386, 0, 0.9803922, 1, 1,
0.002626612, -0.6720976, 3.951996, 0, 0.9764706, 1, 1,
0.008041102, -1.262806, 2.413263, 0, 0.9686275, 1, 1,
0.0105672, -0.8369125, 5.466631, 0, 0.9647059, 1, 1,
0.01255951, 0.3819636, -0.6438184, 0, 0.9568627, 1, 1,
0.01680714, 0.5519267, -0.5850925, 0, 0.9529412, 1, 1,
0.02081108, -1.497192, 1.57976, 0, 0.945098, 1, 1,
0.02718678, -1.135074, 4.117457, 0, 0.9411765, 1, 1,
0.02725382, 0.5714859, 0.9700863, 0, 0.9333333, 1, 1,
0.03021466, -1.021035, 3.677838, 0, 0.9294118, 1, 1,
0.03121412, -0.5062261, 1.815914, 0, 0.9215686, 1, 1,
0.03376204, -0.1500096, 2.850001, 0, 0.9176471, 1, 1,
0.0337753, -0.2552641, 1.415119, 0, 0.9098039, 1, 1,
0.0343423, 1.610529, 0.02454861, 0, 0.9058824, 1, 1,
0.03458149, 0.4045984, -0.3422323, 0, 0.8980392, 1, 1,
0.03536676, 0.2967418, -0.3079489, 0, 0.8901961, 1, 1,
0.04370054, -0.796931, 2.08674, 0, 0.8862745, 1, 1,
0.04797044, -0.211911, 2.727566, 0, 0.8784314, 1, 1,
0.04841707, 0.5693352, 0.8828055, 0, 0.8745098, 1, 1,
0.05332509, -0.4222712, 2.88399, 0, 0.8666667, 1, 1,
0.05469856, 1.044269, -1.631047, 0, 0.8627451, 1, 1,
0.05473569, -0.2119563, 4.108543, 0, 0.854902, 1, 1,
0.05719582, 0.307837, -0.1761199, 0, 0.8509804, 1, 1,
0.05906564, -0.5136079, 3.803898, 0, 0.8431373, 1, 1,
0.06662409, 0.3433249, 0.5447356, 0, 0.8392157, 1, 1,
0.06857917, 0.6599761, 2.005101, 0, 0.8313726, 1, 1,
0.07821277, 1.487868, 0.1317454, 0, 0.827451, 1, 1,
0.0792927, 0.5056358, 0.1491412, 0, 0.8196079, 1, 1,
0.08214556, -0.2952002, 4.232887, 0, 0.8156863, 1, 1,
0.09152465, -0.8272928, 1.577742, 0, 0.8078431, 1, 1,
0.09183806, 0.4235208, 1.65268, 0, 0.8039216, 1, 1,
0.09336922, -1.736094, 3.5793, 0, 0.7960784, 1, 1,
0.0944901, 1.343593, 2.454916, 0, 0.7882353, 1, 1,
0.09810273, 0.9076588, -0.1483209, 0, 0.7843137, 1, 1,
0.09870447, -0.5974917, 1.682901, 0, 0.7764706, 1, 1,
0.1009343, 0.2935593, -0.550262, 0, 0.772549, 1, 1,
0.1020175, 0.5765938, 0.4080861, 0, 0.7647059, 1, 1,
0.1046988, 1.185818, 2.024253, 0, 0.7607843, 1, 1,
0.1083773, 0.1555809, 2.079497, 0, 0.7529412, 1, 1,
0.1146991, -1.457541, 2.705911, 0, 0.7490196, 1, 1,
0.1174729, -0.7761756, 1.48972, 0, 0.7411765, 1, 1,
0.1211639, 0.9029915, -0.7535843, 0, 0.7372549, 1, 1,
0.1223619, 0.2333374, 0.02088859, 0, 0.7294118, 1, 1,
0.1240667, -0.2354125, 3.412172, 0, 0.7254902, 1, 1,
0.1260512, -1.582821, 2.227657, 0, 0.7176471, 1, 1,
0.1335343, 0.1457738, 2.957071, 0, 0.7137255, 1, 1,
0.1447205, -1.509276, 3.430067, 0, 0.7058824, 1, 1,
0.1470598, -1.461035, 2.276667, 0, 0.6980392, 1, 1,
0.1479995, 0.1300697, 2.294427, 0, 0.6941177, 1, 1,
0.1513385, -0.3701016, 4.244691, 0, 0.6862745, 1, 1,
0.1523076, -1.114631, 3.215444, 0, 0.682353, 1, 1,
0.1546269, 0.01666285, 1.563561, 0, 0.6745098, 1, 1,
0.1570874, -0.7564825, 3.054863, 0, 0.6705883, 1, 1,
0.1584626, 0.3670866, 0.2619175, 0, 0.6627451, 1, 1,
0.158682, 1.38543, 0.9722806, 0, 0.6588235, 1, 1,
0.1602752, -1.448387, 2.066447, 0, 0.6509804, 1, 1,
0.1608204, -1.076743, 3.692567, 0, 0.6470588, 1, 1,
0.1637848, -1.70304, 5.08549, 0, 0.6392157, 1, 1,
0.1657101, 1.802326, 0.1750069, 0, 0.6352941, 1, 1,
0.1687391, -0.300935, 1.581339, 0, 0.627451, 1, 1,
0.1704573, -0.9283805, 3.0875, 0, 0.6235294, 1, 1,
0.1706658, 0.1018826, 0.2578095, 0, 0.6156863, 1, 1,
0.1818045, -1.471401, 1.322534, 0, 0.6117647, 1, 1,
0.1841915, -1.430494, 0.8086578, 0, 0.6039216, 1, 1,
0.1842825, -1.207147, 6.102474, 0, 0.5960785, 1, 1,
0.1867344, 0.1692471, -1.031236, 0, 0.5921569, 1, 1,
0.1928512, 0.5368989, -0.3710875, 0, 0.5843138, 1, 1,
0.1928861, 1.116216, 0.06774756, 0, 0.5803922, 1, 1,
0.195198, -0.8119533, 2.779022, 0, 0.572549, 1, 1,
0.1952499, 1.163512, -0.1777094, 0, 0.5686275, 1, 1,
0.2069239, 0.03953101, 0.8937154, 0, 0.5607843, 1, 1,
0.2071446, -1.135678, 3.199898, 0, 0.5568628, 1, 1,
0.209332, -2.19025, 2.527444, 0, 0.5490196, 1, 1,
0.209693, 1.237227, 0.1874202, 0, 0.5450981, 1, 1,
0.2108843, 0.3959999, 0.2486458, 0, 0.5372549, 1, 1,
0.2112953, -0.478811, 2.25478, 0, 0.5333334, 1, 1,
0.2172141, 0.7729226, 0.9915701, 0, 0.5254902, 1, 1,
0.2243421, 0.07799653, 1.643751, 0, 0.5215687, 1, 1,
0.2291092, 0.8696969, 2.238083, 0, 0.5137255, 1, 1,
0.231681, -0.1155046, 4.632713, 0, 0.509804, 1, 1,
0.2330915, -2.093856, 2.470704, 0, 0.5019608, 1, 1,
0.2351399, -1.50196, 3.828429, 0, 0.4941176, 1, 1,
0.2378592, -0.728811, 0.314467, 0, 0.4901961, 1, 1,
0.2415835, 0.7506627, 0.6611979, 0, 0.4823529, 1, 1,
0.2422302, 0.274086, 0.9900298, 0, 0.4784314, 1, 1,
0.2554087, 1.805807, 0.2753771, 0, 0.4705882, 1, 1,
0.2555859, 0.2136048, -0.002479533, 0, 0.4666667, 1, 1,
0.2570611, -1.478472, 3.230864, 0, 0.4588235, 1, 1,
0.2597762, 0.2231155, 1.185726, 0, 0.454902, 1, 1,
0.2612017, 0.4406098, 1.560633, 0, 0.4470588, 1, 1,
0.2625801, 0.4097981, 1.779777, 0, 0.4431373, 1, 1,
0.2696251, -0.1998726, 1.219231, 0, 0.4352941, 1, 1,
0.2698707, 0.4201921, 0.1122179, 0, 0.4313726, 1, 1,
0.2703347, 0.4796941, 1.810888, 0, 0.4235294, 1, 1,
0.2727128, -1.538417, 2.451267, 0, 0.4196078, 1, 1,
0.2728273, -1.927572, 3.071621, 0, 0.4117647, 1, 1,
0.2757088, -1.307833, 1.288999, 0, 0.4078431, 1, 1,
0.2770211, 0.7948743, -0.7727289, 0, 0.4, 1, 1,
0.2781528, -0.1484161, 2.125539, 0, 0.3921569, 1, 1,
0.2791919, -0.7038234, 2.39632, 0, 0.3882353, 1, 1,
0.2798071, -2.019344, 2.902704, 0, 0.3803922, 1, 1,
0.2839389, 0.1902215, 1.555844, 0, 0.3764706, 1, 1,
0.2854656, -1.169587, 3.824795, 0, 0.3686275, 1, 1,
0.289952, -1.30523, 3.192986, 0, 0.3647059, 1, 1,
0.2923635, -1.488988, 3.616574, 0, 0.3568628, 1, 1,
0.2935251, 0.8880525, 0.9188799, 0, 0.3529412, 1, 1,
0.2945777, 0.8408325, 1.188665, 0, 0.345098, 1, 1,
0.300979, -0.8809564, 2.693293, 0, 0.3411765, 1, 1,
0.302199, -0.8029544, 1.339548, 0, 0.3333333, 1, 1,
0.3073047, 0.01254446, 2.048193, 0, 0.3294118, 1, 1,
0.3077278, -0.3256838, 2.295152, 0, 0.3215686, 1, 1,
0.3084936, 0.4365413, 3.238894, 0, 0.3176471, 1, 1,
0.3179592, 1.466942, -0.5864741, 0, 0.3098039, 1, 1,
0.3253438, 0.6717797, 1.389921, 0, 0.3058824, 1, 1,
0.3276916, 0.3776522, 2.692827, 0, 0.2980392, 1, 1,
0.3305598, 0.6188699, 0.6415944, 0, 0.2901961, 1, 1,
0.3321382, -0.563823, 3.544768, 0, 0.2862745, 1, 1,
0.3335393, 0.8597136, -0.2649734, 0, 0.2784314, 1, 1,
0.3349121, 1.701612, 1.18959, 0, 0.2745098, 1, 1,
0.3388451, -0.6869639, 3.824599, 0, 0.2666667, 1, 1,
0.3422158, 0.758892, 0.2806906, 0, 0.2627451, 1, 1,
0.3424768, -0.6000476, 1.573139, 0, 0.254902, 1, 1,
0.348046, -1.134988, 4.660301, 0, 0.2509804, 1, 1,
0.3549754, 1.706139, 0.5927265, 0, 0.2431373, 1, 1,
0.3558683, 0.469295, 2.253616, 0, 0.2392157, 1, 1,
0.3558728, 0.9230394, 1.665296, 0, 0.2313726, 1, 1,
0.3611322, -0.454361, 2.563761, 0, 0.227451, 1, 1,
0.3637607, -0.08839511, 2.593915, 0, 0.2196078, 1, 1,
0.3641891, 0.1314263, 3.018216, 0, 0.2156863, 1, 1,
0.3727116, 0.9865782, 0.02258284, 0, 0.2078431, 1, 1,
0.377398, -0.9454073, 4.532408, 0, 0.2039216, 1, 1,
0.3818212, -1.045485, 1.958824, 0, 0.1960784, 1, 1,
0.3826765, 0.6543552, -1.286363, 0, 0.1882353, 1, 1,
0.3841012, 0.298484, 1.581172, 0, 0.1843137, 1, 1,
0.3856764, 0.7291776, 0.3647055, 0, 0.1764706, 1, 1,
0.3861291, -0.851353, 2.551932, 0, 0.172549, 1, 1,
0.3873494, -0.9700171, 3.322087, 0, 0.1647059, 1, 1,
0.3873659, -0.4845088, 4.099101, 0, 0.1607843, 1, 1,
0.3892147, -0.4945182, 2.362623, 0, 0.1529412, 1, 1,
0.389738, 0.8200132, -0.3461344, 0, 0.1490196, 1, 1,
0.3928174, -0.05970922, 1.565008, 0, 0.1411765, 1, 1,
0.3930396, 1.406331, -0.006142774, 0, 0.1372549, 1, 1,
0.3935669, -0.1732054, 1.821608, 0, 0.1294118, 1, 1,
0.394069, 0.7019707, 0.9505875, 0, 0.1254902, 1, 1,
0.3981554, -1.074155, 0.7236158, 0, 0.1176471, 1, 1,
0.4009617, 0.7787803, 0.0408711, 0, 0.1137255, 1, 1,
0.4010278, -1.609821, 2.50075, 0, 0.1058824, 1, 1,
0.4026221, 0.3270157, 0.6855714, 0, 0.09803922, 1, 1,
0.4036708, 0.7943152, 2.370205, 0, 0.09411765, 1, 1,
0.4053984, 0.3095859, 0.9957398, 0, 0.08627451, 1, 1,
0.4055464, 0.637221, -0.9397024, 0, 0.08235294, 1, 1,
0.4056638, 0.1100897, 0.04693326, 0, 0.07450981, 1, 1,
0.4073384, -0.820143, 3.338431, 0, 0.07058824, 1, 1,
0.4087331, -1.172924, 3.450359, 0, 0.0627451, 1, 1,
0.4091036, 0.8776413, 1.428321, 0, 0.05882353, 1, 1,
0.4103066, -0.2099759, 2.248555, 0, 0.05098039, 1, 1,
0.4108999, 0.3230259, 1.735247, 0, 0.04705882, 1, 1,
0.4144569, -0.1393038, 2.950497, 0, 0.03921569, 1, 1,
0.4174463, 0.1325758, 2.10501, 0, 0.03529412, 1, 1,
0.4212929, -0.2515428, 1.026752, 0, 0.02745098, 1, 1,
0.4233198, -0.6218892, 2.478059, 0, 0.02352941, 1, 1,
0.4252945, -0.8755024, 0.7407117, 0, 0.01568628, 1, 1,
0.427073, 1.181584, -0.7495655, 0, 0.01176471, 1, 1,
0.427299, -0.7037633, 2.090615, 0, 0.003921569, 1, 1,
0.4285908, -0.7630235, 3.274276, 0.003921569, 0, 1, 1,
0.4306158, 0.6481206, -0.1348478, 0.007843138, 0, 1, 1,
0.4311084, 0.06960499, 1.635298, 0.01568628, 0, 1, 1,
0.4403976, -0.5022366, 2.422163, 0.01960784, 0, 1, 1,
0.4447447, 0.619113, 0.4591428, 0.02745098, 0, 1, 1,
0.4502574, -0.2016809, 0.9650704, 0.03137255, 0, 1, 1,
0.454919, -0.3262672, 0.8269793, 0.03921569, 0, 1, 1,
0.4556979, 0.06248046, 0.4900425, 0.04313726, 0, 1, 1,
0.4564994, 1.066693, -0.5272321, 0.05098039, 0, 1, 1,
0.4569073, -0.4579608, 3.473647, 0.05490196, 0, 1, 1,
0.4679614, -0.8447946, 2.863326, 0.0627451, 0, 1, 1,
0.4733782, -0.06836796, 2.614499, 0.06666667, 0, 1, 1,
0.4750008, 0.2823234, 0.5218103, 0.07450981, 0, 1, 1,
0.4761532, -0.250104, 2.576128, 0.07843138, 0, 1, 1,
0.4763013, -1.987109, 3.330977, 0.08627451, 0, 1, 1,
0.4784507, -0.2810886, 1.858925, 0.09019608, 0, 1, 1,
0.4861203, -0.5271546, 0.2009093, 0.09803922, 0, 1, 1,
0.4901071, -0.5950145, 1.447887, 0.1058824, 0, 1, 1,
0.490776, -0.2462167, 3.414135, 0.1098039, 0, 1, 1,
0.4989921, 0.8282355, -0.0683226, 0.1176471, 0, 1, 1,
0.5083539, 0.01607596, 1.695411, 0.1215686, 0, 1, 1,
0.5096822, 0.5740942, 0.4774966, 0.1294118, 0, 1, 1,
0.5151601, 0.1930828, 0.03126775, 0.1333333, 0, 1, 1,
0.5152442, -0.05274417, 0.1500753, 0.1411765, 0, 1, 1,
0.5160846, -0.7614558, 3.285799, 0.145098, 0, 1, 1,
0.5205045, 0.08004501, 1.790872, 0.1529412, 0, 1, 1,
0.522781, -1.787084, 3.627346, 0.1568628, 0, 1, 1,
0.5235073, -0.3797808, 2.688786, 0.1647059, 0, 1, 1,
0.5242751, -1.040936, 3.14486, 0.1686275, 0, 1, 1,
0.5262982, 1.827332, 1.29386, 0.1764706, 0, 1, 1,
0.5263425, 0.4139668, 0.1405461, 0.1803922, 0, 1, 1,
0.527271, -1.369828, 2.374775, 0.1882353, 0, 1, 1,
0.5275283, 0.5191228, -0.3120923, 0.1921569, 0, 1, 1,
0.5275727, -0.811976, 1.213668, 0.2, 0, 1, 1,
0.5445897, 0.9466396, -0.6968457, 0.2078431, 0, 1, 1,
0.5452088, 0.4492076, 0.6575785, 0.2117647, 0, 1, 1,
0.5458987, 0.8639556, -1.038988, 0.2196078, 0, 1, 1,
0.548862, 0.5825664, 0.7364671, 0.2235294, 0, 1, 1,
0.5578573, -0.6182865, 3.071357, 0.2313726, 0, 1, 1,
0.5585482, -1.430937, 2.145179, 0.2352941, 0, 1, 1,
0.5588506, 1.324156, -0.3398737, 0.2431373, 0, 1, 1,
0.5605865, 0.3837153, 1.195272, 0.2470588, 0, 1, 1,
0.5611366, 0.3211629, -0.4354611, 0.254902, 0, 1, 1,
0.5614886, -0.8592505, 2.486475, 0.2588235, 0, 1, 1,
0.5618454, 0.5738166, 0.03462052, 0.2666667, 0, 1, 1,
0.564033, -1.5183, 3.61955, 0.2705882, 0, 1, 1,
0.5670251, 1.084862, 1.05257, 0.2784314, 0, 1, 1,
0.5705687, 0.6162047, 1.303686, 0.282353, 0, 1, 1,
0.5739797, -0.2319524, 2.893543, 0.2901961, 0, 1, 1,
0.5745386, -1.045994, 3.141643, 0.2941177, 0, 1, 1,
0.5766624, 0.7252899, 0.1933679, 0.3019608, 0, 1, 1,
0.578571, -0.01588987, 3.430456, 0.3098039, 0, 1, 1,
0.5840651, -0.2522826, 1.866996, 0.3137255, 0, 1, 1,
0.5863089, -1.32743, 3.11078, 0.3215686, 0, 1, 1,
0.5872619, 0.6743906, 0.9533548, 0.3254902, 0, 1, 1,
0.5898418, -1.046777, 3.715172, 0.3333333, 0, 1, 1,
0.5937172, -0.7025823, 2.842207, 0.3372549, 0, 1, 1,
0.5949113, -0.7824951, 0.6108157, 0.345098, 0, 1, 1,
0.6003152, -0.1054771, 0.7989182, 0.3490196, 0, 1, 1,
0.6007162, -0.976979, 0.7760994, 0.3568628, 0, 1, 1,
0.6021858, -0.4578903, 1.200109, 0.3607843, 0, 1, 1,
0.6029484, 1.565393, 1.519103, 0.3686275, 0, 1, 1,
0.605831, -1.709216, 5.240539, 0.372549, 0, 1, 1,
0.6176476, -2.39217, 2.678761, 0.3803922, 0, 1, 1,
0.6189123, 0.05781806, 0.5042493, 0.3843137, 0, 1, 1,
0.6330888, 0.4160509, 0.2076903, 0.3921569, 0, 1, 1,
0.6386998, -2.288071, 1.450579, 0.3960784, 0, 1, 1,
0.6440942, 0.9260344, 0.2919184, 0.4039216, 0, 1, 1,
0.6463459, -0.7572871, 0.6915338, 0.4117647, 0, 1, 1,
0.6480917, -0.1567189, 1.490821, 0.4156863, 0, 1, 1,
0.6506141, -0.3052595, 2.57281, 0.4235294, 0, 1, 1,
0.6508074, 1.905459, 0.1629139, 0.427451, 0, 1, 1,
0.6561267, -0.9438105, 0.7928238, 0.4352941, 0, 1, 1,
0.6581155, 0.5895182, 0.927096, 0.4392157, 0, 1, 1,
0.6590833, -0.2556662, 3.055823, 0.4470588, 0, 1, 1,
0.6622662, -0.5179689, 4.430965, 0.4509804, 0, 1, 1,
0.6645215, -0.3729647, 3.49434, 0.4588235, 0, 1, 1,
0.6655328, -0.2252553, 3.446364, 0.4627451, 0, 1, 1,
0.6737553, -0.4933598, 1.873822, 0.4705882, 0, 1, 1,
0.6769413, 0.4350621, 0.688346, 0.4745098, 0, 1, 1,
0.6814545, 0.7412325, 2.638402, 0.4823529, 0, 1, 1,
0.6829303, -0.1661914, 2.510241, 0.4862745, 0, 1, 1,
0.6842142, 1.705298, -0.255505, 0.4941176, 0, 1, 1,
0.6855516, -0.4616419, 3.764172, 0.5019608, 0, 1, 1,
0.6895722, 0.3503238, 1.883201, 0.5058824, 0, 1, 1,
0.692661, -2.087315, 4.611628, 0.5137255, 0, 1, 1,
0.6980976, -0.5707895, 3.766126, 0.5176471, 0, 1, 1,
0.7121312, -0.825395, 3.867326, 0.5254902, 0, 1, 1,
0.71292, -1.078297, 2.978806, 0.5294118, 0, 1, 1,
0.7145312, 0.8457647, 0.2950779, 0.5372549, 0, 1, 1,
0.7166258, -0.1287589, 0.926329, 0.5411765, 0, 1, 1,
0.7214657, -0.2796218, 3.496624, 0.5490196, 0, 1, 1,
0.7306603, -1.448652, 1.449461, 0.5529412, 0, 1, 1,
0.7324272, 0.8342402, 1.720222, 0.5607843, 0, 1, 1,
0.7330511, 2.451196, 0.7639663, 0.5647059, 0, 1, 1,
0.7367799, 0.6036174, 1.989114, 0.572549, 0, 1, 1,
0.7402965, 1.20556, 1.957917, 0.5764706, 0, 1, 1,
0.7434846, 0.9054117, 0.01666038, 0.5843138, 0, 1, 1,
0.7455395, -1.675372, 3.917972, 0.5882353, 0, 1, 1,
0.7465339, 0.9939489, -0.2052643, 0.5960785, 0, 1, 1,
0.747954, 1.320228, 0.2676664, 0.6039216, 0, 1, 1,
0.7516121, -0.5831225, 2.613793, 0.6078432, 0, 1, 1,
0.7655726, 1.372395, 1.388421, 0.6156863, 0, 1, 1,
0.7731779, 0.5172213, 0.4090944, 0.6196079, 0, 1, 1,
0.7801697, 0.7636147, 1.376369, 0.627451, 0, 1, 1,
0.7836483, -0.9374394, 1.51426, 0.6313726, 0, 1, 1,
0.7898152, -1.80885, 2.033301, 0.6392157, 0, 1, 1,
0.7908698, -0.966102, 4.352879, 0.6431373, 0, 1, 1,
0.7967773, 0.7744672, -0.5243232, 0.6509804, 0, 1, 1,
0.8030178, -0.4104618, 2.606827, 0.654902, 0, 1, 1,
0.804395, 0.7276713, 0.2801082, 0.6627451, 0, 1, 1,
0.805803, -0.9204314, 1.532614, 0.6666667, 0, 1, 1,
0.8146431, 1.005272, -0.7464941, 0.6745098, 0, 1, 1,
0.8173584, -0.695286, 2.193671, 0.6784314, 0, 1, 1,
0.8175226, -0.8621072, 1.496907, 0.6862745, 0, 1, 1,
0.8184348, -0.5426116, 3.701152, 0.6901961, 0, 1, 1,
0.8222088, -0.3950471, 2.397206, 0.6980392, 0, 1, 1,
0.8245437, -1.207814, 2.099936, 0.7058824, 0, 1, 1,
0.8380874, -0.3737657, 2.097735, 0.7098039, 0, 1, 1,
0.8405727, 1.873629, -0.7114636, 0.7176471, 0, 1, 1,
0.8415943, 0.2524343, 3.316308, 0.7215686, 0, 1, 1,
0.8424335, 0.01452726, 1.927286, 0.7294118, 0, 1, 1,
0.8434321, 0.8614324, 1.3914, 0.7333333, 0, 1, 1,
0.8447097, 0.9909024, -0.1951898, 0.7411765, 0, 1, 1,
0.8468809, 0.6073566, 0.08197119, 0.7450981, 0, 1, 1,
0.849611, 0.5788137, 1.258249, 0.7529412, 0, 1, 1,
0.8540387, 0.1318536, 1.429086, 0.7568628, 0, 1, 1,
0.8577939, -1.663841, 3.561128, 0.7647059, 0, 1, 1,
0.8580776, -0.0231498, 2.184399, 0.7686275, 0, 1, 1,
0.8598489, 0.4894429, 1.442582, 0.7764706, 0, 1, 1,
0.8754061, 1.079059, 0.9151653, 0.7803922, 0, 1, 1,
0.8760394, -0.4797246, 2.426411, 0.7882353, 0, 1, 1,
0.8839496, 1.040245, -0.6345201, 0.7921569, 0, 1, 1,
0.8984584, 0.2461742, 1.25535, 0.8, 0, 1, 1,
0.9030764, 0.4151756, 0.03883833, 0.8078431, 0, 1, 1,
0.9087844, 0.463045, -1.162242, 0.8117647, 0, 1, 1,
0.9122123, -0.4152425, 1.151037, 0.8196079, 0, 1, 1,
0.9150023, 0.6093253, 2.060004, 0.8235294, 0, 1, 1,
0.9295326, 2.229287, 0.1845457, 0.8313726, 0, 1, 1,
0.9385324, 1.960052, -1.203689, 0.8352941, 0, 1, 1,
0.9386017, 1.078585, -0.9251516, 0.8431373, 0, 1, 1,
0.9477753, 1.487532, -1.247404, 0.8470588, 0, 1, 1,
0.9498141, 0.950691, -1.163124, 0.854902, 0, 1, 1,
0.9499063, -1.693235, 0.9804591, 0.8588235, 0, 1, 1,
0.9505358, -0.4755622, 1.297756, 0.8666667, 0, 1, 1,
0.953573, -1.530904, 3.466389, 0.8705882, 0, 1, 1,
0.9605945, 0.3603553, 1.055052, 0.8784314, 0, 1, 1,
0.9678298, -0.8412415, 3.069714, 0.8823529, 0, 1, 1,
0.9738036, 1.288937, 0.6255116, 0.8901961, 0, 1, 1,
0.9751903, 0.4433785, -0.5247034, 0.8941177, 0, 1, 1,
0.9772052, 1.193341, 0.8600572, 0.9019608, 0, 1, 1,
0.9784145, -0.8349154, 2.069319, 0.9098039, 0, 1, 1,
0.9800612, 1.42702, 1.675057, 0.9137255, 0, 1, 1,
0.9827825, 0.763211, 1.721834, 0.9215686, 0, 1, 1,
0.9887773, -0.2693861, 3.46913, 0.9254902, 0, 1, 1,
0.9963635, 1.556003, 2.116715, 0.9333333, 0, 1, 1,
0.9984115, -0.9400481, 1.700979, 0.9372549, 0, 1, 1,
1.003662, 0.1558706, -1.114967, 0.945098, 0, 1, 1,
1.006196, -0.2259634, 2.086472, 0.9490196, 0, 1, 1,
1.007431, -1.929754, 1.862645, 0.9568627, 0, 1, 1,
1.009914, -1.031442, 2.822206, 0.9607843, 0, 1, 1,
1.027144, -0.2103304, 2.904541, 0.9686275, 0, 1, 1,
1.029147, 0.5672128, 1.356756, 0.972549, 0, 1, 1,
1.030924, -1.108124, 3.144468, 0.9803922, 0, 1, 1,
1.039405, -0.4214786, 1.404035, 0.9843137, 0, 1, 1,
1.050478, 0.0105675, 1.557497, 0.9921569, 0, 1, 1,
1.050733, -0.04717056, 2.653951, 0.9960784, 0, 1, 1,
1.055539, -0.6415575, 3.337536, 1, 0, 0.9960784, 1,
1.062396, -0.4582253, 0.2937618, 1, 0, 0.9882353, 1,
1.063422, 1.673824, 1.116068, 1, 0, 0.9843137, 1,
1.063882, -1.417159, 1.910555, 1, 0, 0.9764706, 1,
1.064994, -1.023297, 2.584258, 1, 0, 0.972549, 1,
1.069298, -0.4454365, 4.169983, 1, 0, 0.9647059, 1,
1.07529, -0.2465403, 0.4875898, 1, 0, 0.9607843, 1,
1.09025, -0.1121445, 1.544773, 1, 0, 0.9529412, 1,
1.091407, 0.06001899, 2.196962, 1, 0, 0.9490196, 1,
1.092455, 1.58578, 0.8750146, 1, 0, 0.9411765, 1,
1.093419, 0.05926293, 0.742665, 1, 0, 0.9372549, 1,
1.096339, -0.063601, 1.666444, 1, 0, 0.9294118, 1,
1.101304, 1.156784, 0.7149842, 1, 0, 0.9254902, 1,
1.107625, 1.027046, 0.2332076, 1, 0, 0.9176471, 1,
1.110451, 0.04214855, 2.091199, 1, 0, 0.9137255, 1,
1.110777, -0.2954162, 1.149577, 1, 0, 0.9058824, 1,
1.111764, 0.05571987, 2.264042, 1, 0, 0.9019608, 1,
1.112236, -0.7706251, 1.672302, 1, 0, 0.8941177, 1,
1.117278, 1.535887, 1.843919, 1, 0, 0.8862745, 1,
1.122247, -0.09118614, 1.446348, 1, 0, 0.8823529, 1,
1.12325, -0.6607541, 2.094118, 1, 0, 0.8745098, 1,
1.123813, 1.08139, 0.06779458, 1, 0, 0.8705882, 1,
1.124723, 0.8090129, 1.547678, 1, 0, 0.8627451, 1,
1.125049, 1.275483, 2.752743, 1, 0, 0.8588235, 1,
1.131247, -1.823947, 2.582227, 1, 0, 0.8509804, 1,
1.137814, 0.02654636, 1.944032, 1, 0, 0.8470588, 1,
1.139483, -2.080764, 1.84893, 1, 0, 0.8392157, 1,
1.15092, -1.003287, 1.846598, 1, 0, 0.8352941, 1,
1.155529, -1.687943, 2.146783, 1, 0, 0.827451, 1,
1.156332, -1.133045, 1.32318, 1, 0, 0.8235294, 1,
1.167493, -0.7035527, 1.517033, 1, 0, 0.8156863, 1,
1.168095, 0.7831435, 1.925244, 1, 0, 0.8117647, 1,
1.169764, -1.146017, 1.155557, 1, 0, 0.8039216, 1,
1.176767, -0.3636763, 2.202177, 1, 0, 0.7960784, 1,
1.180218, 1.314533, -0.0203908, 1, 0, 0.7921569, 1,
1.18064, 0.4829142, 1.751511, 1, 0, 0.7843137, 1,
1.183885, -0.08841379, 2.697196, 1, 0, 0.7803922, 1,
1.191938, 0.7359339, 1.61357, 1, 0, 0.772549, 1,
1.194784, -0.248573, 1.125253, 1, 0, 0.7686275, 1,
1.196582, 0.5885081, 2.082614, 1, 0, 0.7607843, 1,
1.203251, 0.8776645, 0.3012601, 1, 0, 0.7568628, 1,
1.212145, 2.337926, 1.129347, 1, 0, 0.7490196, 1,
1.214257, 1.597082, -0.5232717, 1, 0, 0.7450981, 1,
1.21575, -0.1740104, 2.723685, 1, 0, 0.7372549, 1,
1.219543, 1.315627, 1.479326, 1, 0, 0.7333333, 1,
1.241252, 0.01444629, 2.309221, 1, 0, 0.7254902, 1,
1.244359, -0.2988163, 0.7679449, 1, 0, 0.7215686, 1,
1.24742, -1.02496, 1.425431, 1, 0, 0.7137255, 1,
1.251458, 1.631084, 1.479468, 1, 0, 0.7098039, 1,
1.264328, 0.07082526, 2.726514, 1, 0, 0.7019608, 1,
1.268781, 0.05520351, 1.94346, 1, 0, 0.6941177, 1,
1.274898, -0.6619928, 0.684383, 1, 0, 0.6901961, 1,
1.27784, 0.6252916, 0.8006331, 1, 0, 0.682353, 1,
1.280803, 0.06540306, -0.5988062, 1, 0, 0.6784314, 1,
1.287996, -0.2040482, 2.111724, 1, 0, 0.6705883, 1,
1.297197, -2.043602, 2.503664, 1, 0, 0.6666667, 1,
1.300735, -1.134538, 1.149753, 1, 0, 0.6588235, 1,
1.303695, 0.4514503, 1.155869, 1, 0, 0.654902, 1,
1.304815, 0.1481441, 2.248516, 1, 0, 0.6470588, 1,
1.311281, 0.2801201, 2.360151, 1, 0, 0.6431373, 1,
1.312567, 0.7531325, 0.9440838, 1, 0, 0.6352941, 1,
1.315367, -0.7305155, 2.925487, 1, 0, 0.6313726, 1,
1.321714, -0.3263163, 2.12039, 1, 0, 0.6235294, 1,
1.329861, 0.05881068, 2.627199, 1, 0, 0.6196079, 1,
1.330889, -1.076912, 2.567379, 1, 0, 0.6117647, 1,
1.333215, 2.021581, 0.02199582, 1, 0, 0.6078432, 1,
1.333996, -0.9244184, 2.931178, 1, 0, 0.6, 1,
1.334801, 0.440911, 1.102908, 1, 0, 0.5921569, 1,
1.340614, -0.9193884, 3.445724, 1, 0, 0.5882353, 1,
1.345076, 0.3661017, 0.8723694, 1, 0, 0.5803922, 1,
1.347673, 1.145789, 0.9347539, 1, 0, 0.5764706, 1,
1.356289, -1.217605, 2.885337, 1, 0, 0.5686275, 1,
1.366797, 0.3945605, 3.328202, 1, 0, 0.5647059, 1,
1.36714, 1.429789, 0.2763465, 1, 0, 0.5568628, 1,
1.368366, -0.1329703, 0.2574531, 1, 0, 0.5529412, 1,
1.373861, -2.60203, 3.414678, 1, 0, 0.5450981, 1,
1.377545, 1.002943, -0.04328079, 1, 0, 0.5411765, 1,
1.382979, 0.7342426, 1.421927, 1, 0, 0.5333334, 1,
1.386405, -0.8927264, 3.040795, 1, 0, 0.5294118, 1,
1.390471, -0.003163846, 2.152153, 1, 0, 0.5215687, 1,
1.410051, 3.539655, 1.262643, 1, 0, 0.5176471, 1,
1.411716, 1.082325, 3.763595, 1, 0, 0.509804, 1,
1.42593, -0.3292946, 2.039191, 1, 0, 0.5058824, 1,
1.458975, 0.5163754, 1.806009, 1, 0, 0.4980392, 1,
1.467506, 0.1657019, 2.652373, 1, 0, 0.4901961, 1,
1.498347, 0.001749145, 1.676865, 1, 0, 0.4862745, 1,
1.501408, 0.5168981, -0.3630403, 1, 0, 0.4784314, 1,
1.501774, -0.6602672, 0.06339649, 1, 0, 0.4745098, 1,
1.506589, 0.7309922, 1.555132, 1, 0, 0.4666667, 1,
1.512344, -1.295179, 4.214679, 1, 0, 0.4627451, 1,
1.512375, 0.2064684, 0.4155707, 1, 0, 0.454902, 1,
1.516362, -0.2552361, 2.410855, 1, 0, 0.4509804, 1,
1.519016, -0.4880558, 3.908423, 1, 0, 0.4431373, 1,
1.522758, -1.111098, 0.3323824, 1, 0, 0.4392157, 1,
1.533916, 0.9337286, 2.11827, 1, 0, 0.4313726, 1,
1.535852, 2.160577, -1.037947, 1, 0, 0.427451, 1,
1.56495, 0.671757, 0.1736755, 1, 0, 0.4196078, 1,
1.566019, 0.6655167, 2.019065, 1, 0, 0.4156863, 1,
1.582912, -2.149716, 0.693824, 1, 0, 0.4078431, 1,
1.600399, 1.394906, -0.4273254, 1, 0, 0.4039216, 1,
1.601931, -1.264782, 2.372426, 1, 0, 0.3960784, 1,
1.606017, 0.6334215, 1.721066, 1, 0, 0.3882353, 1,
1.632817, -1.000519, 2.262364, 1, 0, 0.3843137, 1,
1.637817, 1.516025, -0.03555616, 1, 0, 0.3764706, 1,
1.652893, 0.386695, 1.32189, 1, 0, 0.372549, 1,
1.655068, -0.5376419, 0.9720581, 1, 0, 0.3647059, 1,
1.658659, -1.351985, 3.152586, 1, 0, 0.3607843, 1,
1.664914, 0.9310485, 0.1985718, 1, 0, 0.3529412, 1,
1.6707, 0.2938846, 1.665205, 1, 0, 0.3490196, 1,
1.678602, 0.1600341, 2.041791, 1, 0, 0.3411765, 1,
1.684775, 0.1549234, 0.2519684, 1, 0, 0.3372549, 1,
1.69545, 0.2094797, 1.60616, 1, 0, 0.3294118, 1,
1.698715, 0.4239542, 1.262171, 1, 0, 0.3254902, 1,
1.70797, 1.190057, -0.4351063, 1, 0, 0.3176471, 1,
1.719799, -1.508154, 3.045516, 1, 0, 0.3137255, 1,
1.720725, 2.043805, -0.5298951, 1, 0, 0.3058824, 1,
1.730608, 0.1703394, 2.508743, 1, 0, 0.2980392, 1,
1.734656, 0.07663487, 0.9178084, 1, 0, 0.2941177, 1,
1.735775, -0.2780647, 2.732018, 1, 0, 0.2862745, 1,
1.736898, 0.6277921, 1.182357, 1, 0, 0.282353, 1,
1.737942, -1.725376, 1.06556, 1, 0, 0.2745098, 1,
1.749856, -1.009089, 2.726484, 1, 0, 0.2705882, 1,
1.759759, 1.615578, 1.68642, 1, 0, 0.2627451, 1,
1.760124, -1.834962, 0.05473315, 1, 0, 0.2588235, 1,
1.765243, 0.5777287, 0.8069493, 1, 0, 0.2509804, 1,
1.795183, 0.8505009, 1.799711, 1, 0, 0.2470588, 1,
1.801694, 1.867399, 1.82843, 1, 0, 0.2392157, 1,
1.838415, -0.6017203, 2.401593, 1, 0, 0.2352941, 1,
1.850542, 1.71698, 1.842362, 1, 0, 0.227451, 1,
1.857869, 1.320346, 0.9198022, 1, 0, 0.2235294, 1,
1.868051, 0.9286016, 0.8821848, 1, 0, 0.2156863, 1,
1.876234, -1.542644, 2.079363, 1, 0, 0.2117647, 1,
1.889659, 0.9994825, 0.6298465, 1, 0, 0.2039216, 1,
1.896986, 0.9770979, 1.473953, 1, 0, 0.1960784, 1,
1.900961, -1.307822, 1.858199, 1, 0, 0.1921569, 1,
1.906455, -1.101699, 2.89215, 1, 0, 0.1843137, 1,
1.908101, 0.3561251, 1.042826, 1, 0, 0.1803922, 1,
1.928737, -1.173619, 2.75043, 1, 0, 0.172549, 1,
1.937787, -0.3157985, 1.426833, 1, 0, 0.1686275, 1,
1.938968, 0.1903478, 0.9028748, 1, 0, 0.1607843, 1,
1.959871, -1.687705, 0.02635043, 1, 0, 0.1568628, 1,
2.057271, -0.6351923, 0.2320212, 1, 0, 0.1490196, 1,
2.081091, -0.7696017, 2.527301, 1, 0, 0.145098, 1,
2.10876, 0.8912153, -1.071155, 1, 0, 0.1372549, 1,
2.111655, -0.7051696, 1.83584, 1, 0, 0.1333333, 1,
2.112163, -0.260346, 1.77309, 1, 0, 0.1254902, 1,
2.125662, 0.8005346, 1.823761, 1, 0, 0.1215686, 1,
2.125974, 0.9809737, 0.8455074, 1, 0, 0.1137255, 1,
2.130928, 0.492377, 1.14955, 1, 0, 0.1098039, 1,
2.146847, 0.2726425, 1.02976, 1, 0, 0.1019608, 1,
2.149633, -1.30745, 1.655458, 1, 0, 0.09411765, 1,
2.151028, 0.1902834, 2.34821, 1, 0, 0.09019608, 1,
2.166442, 0.1793801, 2.980507, 1, 0, 0.08235294, 1,
2.229208, 0.3075716, 0.3201374, 1, 0, 0.07843138, 1,
2.2416, 0.5523561, 1.921854, 1, 0, 0.07058824, 1,
2.286105, 0.3322133, 0.3473173, 1, 0, 0.06666667, 1,
2.312028, 1.942771, 0.4848569, 1, 0, 0.05882353, 1,
2.360011, 0.7429969, 0.7806153, 1, 0, 0.05490196, 1,
2.389066, -0.2928967, 2.215186, 1, 0, 0.04705882, 1,
2.436384, -1.959618, 1.190187, 1, 0, 0.04313726, 1,
2.451517, 0.1116917, 2.578496, 1, 0, 0.03529412, 1,
2.564866, 1.26941, 3.186373, 1, 0, 0.03137255, 1,
2.745531, 1.188883, 1.47365, 1, 0, 0.02352941, 1,
2.795823, 0.3070567, 0.1086474, 1, 0, 0.01960784, 1,
3.083089, -2.480238, 0.9480633, 1, 0, 0.01176471, 1,
3.08844, -1.148814, 2.646084, 1, 0, 0.007843138, 1
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
0.01046705, -4.04613, -7.502118, 0, -0.5, 0.5, 0.5,
0.01046705, -4.04613, -7.502118, 1, -0.5, 0.5, 0.5,
0.01046705, -4.04613, -7.502118, 1, 1.5, 0.5, 0.5,
0.01046705, -4.04613, -7.502118, 0, 1.5, 0.5, 0.5
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
-4.110939, 0.2964805, -7.502118, 0, -0.5, 0.5, 0.5,
-4.110939, 0.2964805, -7.502118, 1, -0.5, 0.5, 0.5,
-4.110939, 0.2964805, -7.502118, 1, 1.5, 0.5, 0.5,
-4.110939, 0.2964805, -7.502118, 0, 1.5, 0.5, 0.5
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
-4.110939, -4.04613, 0.2860599, 0, -0.5, 0.5, 0.5,
-4.110939, -4.04613, 0.2860599, 1, -0.5, 0.5, 0.5,
-4.110939, -4.04613, 0.2860599, 1, 1.5, 0.5, 0.5,
-4.110939, -4.04613, 0.2860599, 0, 1.5, 0.5, 0.5
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
-3, -3.043989, -5.704846,
3, -3.043989, -5.704846,
-3, -3.043989, -5.704846,
-3, -3.211013, -6.004392,
-2, -3.043989, -5.704846,
-2, -3.211013, -6.004392,
-1, -3.043989, -5.704846,
-1, -3.211013, -6.004392,
0, -3.043989, -5.704846,
0, -3.211013, -6.004392,
1, -3.043989, -5.704846,
1, -3.211013, -6.004392,
2, -3.043989, -5.704846,
2, -3.211013, -6.004392,
3, -3.043989, -5.704846,
3, -3.211013, -6.004392
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
-3, -3.54506, -6.603482, 0, -0.5, 0.5, 0.5,
-3, -3.54506, -6.603482, 1, -0.5, 0.5, 0.5,
-3, -3.54506, -6.603482, 1, 1.5, 0.5, 0.5,
-3, -3.54506, -6.603482, 0, 1.5, 0.5, 0.5,
-2, -3.54506, -6.603482, 0, -0.5, 0.5, 0.5,
-2, -3.54506, -6.603482, 1, -0.5, 0.5, 0.5,
-2, -3.54506, -6.603482, 1, 1.5, 0.5, 0.5,
-2, -3.54506, -6.603482, 0, 1.5, 0.5, 0.5,
-1, -3.54506, -6.603482, 0, -0.5, 0.5, 0.5,
-1, -3.54506, -6.603482, 1, -0.5, 0.5, 0.5,
-1, -3.54506, -6.603482, 1, 1.5, 0.5, 0.5,
-1, -3.54506, -6.603482, 0, 1.5, 0.5, 0.5,
0, -3.54506, -6.603482, 0, -0.5, 0.5, 0.5,
0, -3.54506, -6.603482, 1, -0.5, 0.5, 0.5,
0, -3.54506, -6.603482, 1, 1.5, 0.5, 0.5,
0, -3.54506, -6.603482, 0, 1.5, 0.5, 0.5,
1, -3.54506, -6.603482, 0, -0.5, 0.5, 0.5,
1, -3.54506, -6.603482, 1, -0.5, 0.5, 0.5,
1, -3.54506, -6.603482, 1, 1.5, 0.5, 0.5,
1, -3.54506, -6.603482, 0, 1.5, 0.5, 0.5,
2, -3.54506, -6.603482, 0, -0.5, 0.5, 0.5,
2, -3.54506, -6.603482, 1, -0.5, 0.5, 0.5,
2, -3.54506, -6.603482, 1, 1.5, 0.5, 0.5,
2, -3.54506, -6.603482, 0, 1.5, 0.5, 0.5,
3, -3.54506, -6.603482, 0, -0.5, 0.5, 0.5,
3, -3.54506, -6.603482, 1, -0.5, 0.5, 0.5,
3, -3.54506, -6.603482, 1, 1.5, 0.5, 0.5,
3, -3.54506, -6.603482, 0, 1.5, 0.5, 0.5
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
-3.159845, -2, -5.704846,
-3.159845, 3, -5.704846,
-3.159845, -2, -5.704846,
-3.318361, -2, -6.004392,
-3.159845, -1, -5.704846,
-3.318361, -1, -6.004392,
-3.159845, 0, -5.704846,
-3.318361, 0, -6.004392,
-3.159845, 1, -5.704846,
-3.318361, 1, -6.004392,
-3.159845, 2, -5.704846,
-3.318361, 2, -6.004392,
-3.159845, 3, -5.704846,
-3.318361, 3, -6.004392
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
-3.635392, -2, -6.603482, 0, -0.5, 0.5, 0.5,
-3.635392, -2, -6.603482, 1, -0.5, 0.5, 0.5,
-3.635392, -2, -6.603482, 1, 1.5, 0.5, 0.5,
-3.635392, -2, -6.603482, 0, 1.5, 0.5, 0.5,
-3.635392, -1, -6.603482, 0, -0.5, 0.5, 0.5,
-3.635392, -1, -6.603482, 1, -0.5, 0.5, 0.5,
-3.635392, -1, -6.603482, 1, 1.5, 0.5, 0.5,
-3.635392, -1, -6.603482, 0, 1.5, 0.5, 0.5,
-3.635392, 0, -6.603482, 0, -0.5, 0.5, 0.5,
-3.635392, 0, -6.603482, 1, -0.5, 0.5, 0.5,
-3.635392, 0, -6.603482, 1, 1.5, 0.5, 0.5,
-3.635392, 0, -6.603482, 0, 1.5, 0.5, 0.5,
-3.635392, 1, -6.603482, 0, -0.5, 0.5, 0.5,
-3.635392, 1, -6.603482, 1, -0.5, 0.5, 0.5,
-3.635392, 1, -6.603482, 1, 1.5, 0.5, 0.5,
-3.635392, 1, -6.603482, 0, 1.5, 0.5, 0.5,
-3.635392, 2, -6.603482, 0, -0.5, 0.5, 0.5,
-3.635392, 2, -6.603482, 1, -0.5, 0.5, 0.5,
-3.635392, 2, -6.603482, 1, 1.5, 0.5, 0.5,
-3.635392, 2, -6.603482, 0, 1.5, 0.5, 0.5,
-3.635392, 3, -6.603482, 0, -0.5, 0.5, 0.5,
-3.635392, 3, -6.603482, 1, -0.5, 0.5, 0.5,
-3.635392, 3, -6.603482, 1, 1.5, 0.5, 0.5,
-3.635392, 3, -6.603482, 0, 1.5, 0.5, 0.5
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
-3.159845, -3.043989, -4,
-3.159845, -3.043989, 6,
-3.159845, -3.043989, -4,
-3.318361, -3.211013, -4,
-3.159845, -3.043989, -2,
-3.318361, -3.211013, -2,
-3.159845, -3.043989, 0,
-3.318361, -3.211013, 0,
-3.159845, -3.043989, 2,
-3.318361, -3.211013, 2,
-3.159845, -3.043989, 4,
-3.318361, -3.211013, 4,
-3.159845, -3.043989, 6,
-3.318361, -3.211013, 6
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
-3.635392, -3.54506, -4, 0, -0.5, 0.5, 0.5,
-3.635392, -3.54506, -4, 1, -0.5, 0.5, 0.5,
-3.635392, -3.54506, -4, 1, 1.5, 0.5, 0.5,
-3.635392, -3.54506, -4, 0, 1.5, 0.5, 0.5,
-3.635392, -3.54506, -2, 0, -0.5, 0.5, 0.5,
-3.635392, -3.54506, -2, 1, -0.5, 0.5, 0.5,
-3.635392, -3.54506, -2, 1, 1.5, 0.5, 0.5,
-3.635392, -3.54506, -2, 0, 1.5, 0.5, 0.5,
-3.635392, -3.54506, 0, 0, -0.5, 0.5, 0.5,
-3.635392, -3.54506, 0, 1, -0.5, 0.5, 0.5,
-3.635392, -3.54506, 0, 1, 1.5, 0.5, 0.5,
-3.635392, -3.54506, 0, 0, 1.5, 0.5, 0.5,
-3.635392, -3.54506, 2, 0, -0.5, 0.5, 0.5,
-3.635392, -3.54506, 2, 1, -0.5, 0.5, 0.5,
-3.635392, -3.54506, 2, 1, 1.5, 0.5, 0.5,
-3.635392, -3.54506, 2, 0, 1.5, 0.5, 0.5,
-3.635392, -3.54506, 4, 0, -0.5, 0.5, 0.5,
-3.635392, -3.54506, 4, 1, -0.5, 0.5, 0.5,
-3.635392, -3.54506, 4, 1, 1.5, 0.5, 0.5,
-3.635392, -3.54506, 4, 0, 1.5, 0.5, 0.5,
-3.635392, -3.54506, 6, 0, -0.5, 0.5, 0.5,
-3.635392, -3.54506, 6, 1, -0.5, 0.5, 0.5,
-3.635392, -3.54506, 6, 1, 1.5, 0.5, 0.5,
-3.635392, -3.54506, 6, 0, 1.5, 0.5, 0.5
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
-3.159845, -3.043989, -5.704846,
-3.159845, 3.63695, -5.704846,
-3.159845, -3.043989, 6.276966,
-3.159845, 3.63695, 6.276966,
-3.159845, -3.043989, -5.704846,
-3.159845, -3.043989, 6.276966,
-3.159845, 3.63695, -5.704846,
-3.159845, 3.63695, 6.276966,
-3.159845, -3.043989, -5.704846,
3.180779, -3.043989, -5.704846,
-3.159845, -3.043989, 6.276966,
3.180779, -3.043989, 6.276966,
-3.159845, 3.63695, -5.704846,
3.180779, 3.63695, -5.704846,
-3.159845, 3.63695, 6.276966,
3.180779, 3.63695, 6.276966,
3.180779, -3.043989, -5.704846,
3.180779, 3.63695, -5.704846,
3.180779, -3.043989, 6.276966,
3.180779, 3.63695, 6.276966,
3.180779, -3.043989, -5.704846,
3.180779, -3.043989, 6.276966,
3.180779, 3.63695, -5.704846,
3.180779, 3.63695, 6.276966
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
var radius = 8.07004;
var distance = 35.90452;
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
mvMatrix.translate( -0.01046705, -0.2964805, -0.2860599 );
mvMatrix.scale( 1.376124, 1.306027, 0.7282275 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.90452);
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
calcium_arsenate_cal<-read.table("calcium_arsenate_cal.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-calcium_arsenate_cal$V2
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_cal' not found
```

```r
y<-calcium_arsenate_cal$V3
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_cal' not found
```

```r
z<-calcium_arsenate_cal$V4
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_cal' not found
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
-3.067506, 0.07341114, -2.076247, 0, 0, 1, 1, 1,
-2.855228, 0.07708122, -1.42883, 1, 0, 0, 1, 1,
-2.811718, -0.07902624, -1.662802, 1, 0, 0, 1, 1,
-2.744236, 0.8582666, -3.217026, 1, 0, 0, 1, 1,
-2.663399, -0.2586012, -1.990745, 1, 0, 0, 1, 1,
-2.604599, 0.6419848, -2.846142, 1, 0, 0, 1, 1,
-2.578621, -0.496092, -0.6995152, 0, 0, 0, 1, 1,
-2.490451, 1.109313, -0.3593134, 0, 0, 0, 1, 1,
-2.488087, 0.0691549, -3.384381, 0, 0, 0, 1, 1,
-2.395145, 1.342733, -2.336616, 0, 0, 0, 1, 1,
-2.368575, -0.409731, -1.907236, 0, 0, 0, 1, 1,
-2.360941, 1.158088, -1.191288, 0, 0, 0, 1, 1,
-2.315011, 0.57167, -1.235509, 0, 0, 0, 1, 1,
-2.306472, 1.15882, -2.248753, 1, 1, 1, 1, 1,
-2.240555, 0.5132321, -0.03885021, 1, 1, 1, 1, 1,
-2.240186, 0.6568236, -0.4320841, 1, 1, 1, 1, 1,
-2.175346, -0.02241963, -4.001216, 1, 1, 1, 1, 1,
-2.159481, 0.2599088, -2.18989, 1, 1, 1, 1, 1,
-2.143969, -1.067089, -2.493771, 1, 1, 1, 1, 1,
-2.11341, 0.294022, -0.3686106, 1, 1, 1, 1, 1,
-2.07143, -1.351174, -1.947289, 1, 1, 1, 1, 1,
-2.0501, 1.113237, -1.464134, 1, 1, 1, 1, 1,
-2.047413, -0.2721693, -0.5306486, 1, 1, 1, 1, 1,
-2.039566, 1.449103, -1.484634, 1, 1, 1, 1, 1,
-2.036406, -0.6948423, -1.242096, 1, 1, 1, 1, 1,
-2.01981, -0.2512136, -1.156015, 1, 1, 1, 1, 1,
-2.019371, -0.543642, -2.198311, 1, 1, 1, 1, 1,
-2.012307, -1.01302, -2.186766, 1, 1, 1, 1, 1,
-2.011062, -1.15157, -2.529481, 0, 0, 1, 1, 1,
-2.006917, -1.406061, -1.651929, 1, 0, 0, 1, 1,
-2.002458, -0.4597804, -1.964521, 1, 0, 0, 1, 1,
-1.996618, 0.6704707, -2.786043, 1, 0, 0, 1, 1,
-1.984352, -2.097626, -3.994914, 1, 0, 0, 1, 1,
-1.980132, -1.381319, -2.204997, 1, 0, 0, 1, 1,
-1.88129, 0.04101468, -2.423849, 0, 0, 0, 1, 1,
-1.858436, 0.9764236, -1.256919, 0, 0, 0, 1, 1,
-1.851146, 0.3748106, -2.178082, 0, 0, 0, 1, 1,
-1.84208, 5.913494e-05, -0.05150182, 0, 0, 0, 1, 1,
-1.837906, 0.8658143, -2.699815, 0, 0, 0, 1, 1,
-1.820491, -0.4245234, -1.396458, 0, 0, 0, 1, 1,
-1.818552, 1.236755, 1.163896, 0, 0, 0, 1, 1,
-1.793798, 2.318706, -0.2652164, 1, 1, 1, 1, 1,
-1.793233, 0.01678001, -2.841356, 1, 1, 1, 1, 1,
-1.774692, 1.118513, -0.6033748, 1, 1, 1, 1, 1,
-1.773854, -1.501479, -2.294173, 1, 1, 1, 1, 1,
-1.769243, 1.095019, -1.977791, 1, 1, 1, 1, 1,
-1.755278, -0.7928933, -1.534048, 1, 1, 1, 1, 1,
-1.747722, -0.2560899, -1.541115, 1, 1, 1, 1, 1,
-1.712579, -0.2227989, -0.8042762, 1, 1, 1, 1, 1,
-1.698106, 0.7688991, -0.2107788, 1, 1, 1, 1, 1,
-1.695917, 0.2113232, -0.375041, 1, 1, 1, 1, 1,
-1.677238, 0.2940406, -0.1696126, 1, 1, 1, 1, 1,
-1.675496, 0.2812022, -1.8954, 1, 1, 1, 1, 1,
-1.662322, 1.22833, -1.476601, 1, 1, 1, 1, 1,
-1.66204, 0.6050677, -2.518363, 1, 1, 1, 1, 1,
-1.660632, 1.351915, -1.271613, 1, 1, 1, 1, 1,
-1.656084, 0.8867503, -0.9031886, 0, 0, 1, 1, 1,
-1.650865, -0.05290392, -0.1537438, 1, 0, 0, 1, 1,
-1.622876, -0.0471755, -4.144262, 1, 0, 0, 1, 1,
-1.612901, -0.3955025, -2.186279, 1, 0, 0, 1, 1,
-1.610664, -1.180794, -4.861651, 1, 0, 0, 1, 1,
-1.608515, 0.05051728, -1.960047, 1, 0, 0, 1, 1,
-1.607759, -0.6799323, -1.443097, 0, 0, 0, 1, 1,
-1.605894, -1.157031, -0.3873042, 0, 0, 0, 1, 1,
-1.586717, 1.960712, 0.3424735, 0, 0, 0, 1, 1,
-1.572271, -0.3966727, -1.044644, 0, 0, 0, 1, 1,
-1.551417, -1.599689, -2.77261, 0, 0, 0, 1, 1,
-1.540289, -1.346896, -3.909792, 0, 0, 0, 1, 1,
-1.515403, 0.4140433, -0.7260997, 0, 0, 0, 1, 1,
-1.511013, 0.1102549, -1.309867, 1, 1, 1, 1, 1,
-1.505314, -0.06417271, -2.735759, 1, 1, 1, 1, 1,
-1.504972, 2.297266, -0.9574478, 1, 1, 1, 1, 1,
-1.504897, -0.3547449, -1.423742, 1, 1, 1, 1, 1,
-1.503019, -1.39682, -1.484596, 1, 1, 1, 1, 1,
-1.491866, -0.7152964, -1.669248, 1, 1, 1, 1, 1,
-1.487487, 0.02637626, -1.193399, 1, 1, 1, 1, 1,
-1.481571, -0.3337553, -0.9624764, 1, 1, 1, 1, 1,
-1.480407, 0.9561751, 0.4705169, 1, 1, 1, 1, 1,
-1.479733, 1.616543, -0.1718856, 1, 1, 1, 1, 1,
-1.455434, -2.331451, -1.175115, 1, 1, 1, 1, 1,
-1.453132, -0.257662, -1.504715, 1, 1, 1, 1, 1,
-1.446909, 0.5203352, -2.093254, 1, 1, 1, 1, 1,
-1.438528, 1.514403, 0.9207317, 1, 1, 1, 1, 1,
-1.436073, -1.789998, -1.096986, 1, 1, 1, 1, 1,
-1.420246, 1.524315, -1.960636, 0, 0, 1, 1, 1,
-1.413948, -0.8670794, -1.364347, 1, 0, 0, 1, 1,
-1.411679, -0.1267949, -1.31416, 1, 0, 0, 1, 1,
-1.40904, 1.656197, -2.307583, 1, 0, 0, 1, 1,
-1.396678, -1.352155, -1.24397, 1, 0, 0, 1, 1,
-1.385779, 1.583126, 0.6567731, 1, 0, 0, 1, 1,
-1.383455, -0.7734481, -2.772136, 0, 0, 0, 1, 1,
-1.377833, 1.395384, -2.384132, 0, 0, 0, 1, 1,
-1.372552, -0.2882911, -1.243348, 0, 0, 0, 1, 1,
-1.368531, -2.02561, -2.024669, 0, 0, 0, 1, 1,
-1.364326, 0.9171855, -1.371449, 0, 0, 0, 1, 1,
-1.34791, -0.4148853, -2.378881, 0, 0, 0, 1, 1,
-1.343142, -0.3273565, -1.645577, 0, 0, 0, 1, 1,
-1.341525, 0.6982512, -0.07904551, 1, 1, 1, 1, 1,
-1.33537, -0.2706336, -3.158134, 1, 1, 1, 1, 1,
-1.332959, 0.8446137, -1.898605, 1, 1, 1, 1, 1,
-1.329599, 0.5839107, -1.371959, 1, 1, 1, 1, 1,
-1.323505, -1.588715, -2.296695, 1, 1, 1, 1, 1,
-1.316828, -0.4456541, -2.65847, 1, 1, 1, 1, 1,
-1.314194, -0.9322427, -3.897358, 1, 1, 1, 1, 1,
-1.31247, 0.3519657, -1.422781, 1, 1, 1, 1, 1,
-1.307159, 0.05155185, -1.667933, 1, 1, 1, 1, 1,
-1.302977, 1.31573, -0.9789556, 1, 1, 1, 1, 1,
-1.299444, -0.3935032, -0.00844689, 1, 1, 1, 1, 1,
-1.293093, 1.41777, -1.758884, 1, 1, 1, 1, 1,
-1.291425, -0.3038796, -1.92088, 1, 1, 1, 1, 1,
-1.280901, -0.04134184, -0.7735274, 1, 1, 1, 1, 1,
-1.261572, 1.630358, 0.1134129, 1, 1, 1, 1, 1,
-1.256405, 0.9092877, -1.104069, 0, 0, 1, 1, 1,
-1.243887, 1.227247, -1.254079, 1, 0, 0, 1, 1,
-1.240659, 1.043978, 1.188272, 1, 0, 0, 1, 1,
-1.240355, 0.633778, -1.063018, 1, 0, 0, 1, 1,
-1.240276, 0.49188, 0.5479628, 1, 0, 0, 1, 1,
-1.226728, 0.8990361, -0.9631507, 1, 0, 0, 1, 1,
-1.221789, 1.179688, 0.0005439071, 0, 0, 0, 1, 1,
-1.195537, 0.515554, -0.9516137, 0, 0, 0, 1, 1,
-1.186545, 0.3592879, -1.106753, 0, 0, 0, 1, 1,
-1.182526, 0.2952483, -1.637465, 0, 0, 0, 1, 1,
-1.176632, -1.376673, -2.09927, 0, 0, 0, 1, 1,
-1.173667, 1.396091, -0.8103015, 0, 0, 0, 1, 1,
-1.151348, 0.3786927, -0.3459039, 0, 0, 0, 1, 1,
-1.148254, -1.217664, -2.461539, 1, 1, 1, 1, 1,
-1.146553, 0.6970034, -0.3630522, 1, 1, 1, 1, 1,
-1.140873, -0.1354648, -1.176242, 1, 1, 1, 1, 1,
-1.139544, 1.168969, -2.23745, 1, 1, 1, 1, 1,
-1.133916, -0.8238055, -2.666709, 1, 1, 1, 1, 1,
-1.133508, -0.9195603, -1.744932, 1, 1, 1, 1, 1,
-1.124547, 0.6341634, -1.206698, 1, 1, 1, 1, 1,
-1.117758, -0.06392748, -0.5852848, 1, 1, 1, 1, 1,
-1.107618, 0.2528718, 1.49362, 1, 1, 1, 1, 1,
-1.102724, 1.009713, -0.4603698, 1, 1, 1, 1, 1,
-1.096243, -0.6274142, -3.352945, 1, 1, 1, 1, 1,
-1.094684, 0.07492627, -2.356892, 1, 1, 1, 1, 1,
-1.093735, 1.761915, -1.039959, 1, 1, 1, 1, 1,
-1.078333, -0.7603081, -2.998706, 1, 1, 1, 1, 1,
-1.076282, -1.700576, -2.516264, 1, 1, 1, 1, 1,
-1.072979, -0.2966112, -4.783597, 0, 0, 1, 1, 1,
-1.063804, 1.328105, -0.1013682, 1, 0, 0, 1, 1,
-1.060986, -1.188204, -2.76798, 1, 0, 0, 1, 1,
-1.059645, -1.249899, -0.8809983, 1, 0, 0, 1, 1,
-1.05844, 0.6172881, -0.4322503, 1, 0, 0, 1, 1,
-1.04758, -0.6584355, -1.204357, 1, 0, 0, 1, 1,
-1.0454, 0.07538889, -1.680305, 0, 0, 0, 1, 1,
-1.045135, -0.9381033, -1.261075, 0, 0, 0, 1, 1,
-1.041771, 1.821078, -0.9052659, 0, 0, 0, 1, 1,
-1.038676, 1.349934, -1.639742, 0, 0, 0, 1, 1,
-1.033034, 0.201865, -2.763654, 0, 0, 0, 1, 1,
-1.031539, -0.6007164, -1.620685, 0, 0, 0, 1, 1,
-1.030571, 1.808846, -1.203706, 0, 0, 0, 1, 1,
-1.022484, 1.363527, 0.2476932, 1, 1, 1, 1, 1,
-1.016216, -0.314892, 0.703753, 1, 1, 1, 1, 1,
-1.004166, -1.399361, -3.379571, 1, 1, 1, 1, 1,
-1.002681, -0.3314877, -3.974774, 1, 1, 1, 1, 1,
-0.9973197, 0.259082, -1.764964, 1, 1, 1, 1, 1,
-0.9908524, -0.6630539, -2.186334, 1, 1, 1, 1, 1,
-0.98835, 0.8742192, -2.380933, 1, 1, 1, 1, 1,
-0.9858087, -0.139646, -3.80936, 1, 1, 1, 1, 1,
-0.969241, -0.2428306, -1.442972, 1, 1, 1, 1, 1,
-0.9689232, 0.2520189, -1.189605, 1, 1, 1, 1, 1,
-0.9606879, -2.755814, -2.152727, 1, 1, 1, 1, 1,
-0.9603406, 2.12626, 2.046057, 1, 1, 1, 1, 1,
-0.9597023, 0.05503889, -0.5758312, 1, 1, 1, 1, 1,
-0.958442, -0.7278183, -2.804631, 1, 1, 1, 1, 1,
-0.9579936, 1.175223, -0.2028646, 1, 1, 1, 1, 1,
-0.9559191, -1.255614, -2.248052, 0, 0, 1, 1, 1,
-0.9517219, 0.03925969, -1.310059, 1, 0, 0, 1, 1,
-0.9475724, 1.776401, -0.2539968, 1, 0, 0, 1, 1,
-0.9469326, -0.8955657, -2.948869, 1, 0, 0, 1, 1,
-0.9464436, 0.2166933, -3.15317, 1, 0, 0, 1, 1,
-0.9448598, 0.07165311, -0.03862371, 1, 0, 0, 1, 1,
-0.941086, -0.7269756, -1.670755, 0, 0, 0, 1, 1,
-0.9337948, 0.6976156, 0.05602299, 0, 0, 0, 1, 1,
-0.9104671, -0.09145418, -1.418953, 0, 0, 0, 1, 1,
-0.9074183, -0.6920178, -3.589013, 0, 0, 0, 1, 1,
-0.9030446, 0.8991664, -0.1361105, 0, 0, 0, 1, 1,
-0.8984076, 0.626843, 0.3878183, 0, 0, 0, 1, 1,
-0.8955452, -0.3107314, -1.212744, 0, 0, 0, 1, 1,
-0.8925541, -1.464754, -2.356826, 1, 1, 1, 1, 1,
-0.8855735, 0.02561673, -0.851428, 1, 1, 1, 1, 1,
-0.8803961, -0.6933187, -2.820638, 1, 1, 1, 1, 1,
-0.8752189, -0.5290041, -2.951771, 1, 1, 1, 1, 1,
-0.8728645, -0.8234585, -3.863993, 1, 1, 1, 1, 1,
-0.8693924, 0.5317951, -1.013196, 1, 1, 1, 1, 1,
-0.8690624, 0.0009309271, -3.236578, 1, 1, 1, 1, 1,
-0.8678331, 1.74194, -0.7587824, 1, 1, 1, 1, 1,
-0.8665676, 1.142689, -0.3213867, 1, 1, 1, 1, 1,
-0.8662112, -1.31716, -1.541825, 1, 1, 1, 1, 1,
-0.8653425, -0.5150146, -1.439543, 1, 1, 1, 1, 1,
-0.8643255, -0.7288881, -0.0761149, 1, 1, 1, 1, 1,
-0.861122, -1.551795, -4.105384, 1, 1, 1, 1, 1,
-0.86107, 0.9571769, -0.7537377, 1, 1, 1, 1, 1,
-0.8581529, 1.5335, 0.3019535, 1, 1, 1, 1, 1,
-0.8571632, -2.946694, -3.0732, 0, 0, 1, 1, 1,
-0.8567789, 1.587969, -2.22922, 1, 0, 0, 1, 1,
-0.8539174, -0.04563587, -0.9031279, 1, 0, 0, 1, 1,
-0.8479599, -0.08133034, -1.12036, 1, 0, 0, 1, 1,
-0.845406, -1.122868, -1.638609, 1, 0, 0, 1, 1,
-0.8433006, 0.1192026, -1.228086, 1, 0, 0, 1, 1,
-0.8292059, 0.2025869, -1.176193, 0, 0, 0, 1, 1,
-0.8262237, 0.4864483, -0.4645305, 0, 0, 0, 1, 1,
-0.8235245, 0.1360745, -1.362438, 0, 0, 0, 1, 1,
-0.8211281, -0.9384513, -3.81647, 0, 0, 0, 1, 1,
-0.8163738, 1.038887, -0.4539444, 0, 0, 0, 1, 1,
-0.8158982, 0.09204224, -1.343057, 0, 0, 0, 1, 1,
-0.8144159, -0.1856835, -3.048863, 0, 0, 0, 1, 1,
-0.8127025, 1.655081, -1.176077, 1, 1, 1, 1, 1,
-0.8096191, 0.08012058, -2.107608, 1, 1, 1, 1, 1,
-0.8080989, -0.3420453, -1.590391, 1, 1, 1, 1, 1,
-0.8078645, -2.677358, -3.394301, 1, 1, 1, 1, 1,
-0.7970608, -0.7157046, -4.179996, 1, 1, 1, 1, 1,
-0.7960001, 0.01883871, -3.169446, 1, 1, 1, 1, 1,
-0.7958876, -1.093147, -2.549694, 1, 1, 1, 1, 1,
-0.7954163, 0.5586228, -1.562142, 1, 1, 1, 1, 1,
-0.795229, -0.1309, -2.779395, 1, 1, 1, 1, 1,
-0.7929233, 0.6582925, -0.3621832, 1, 1, 1, 1, 1,
-0.7898881, 0.5635998, -2.030849, 1, 1, 1, 1, 1,
-0.7875539, -0.5924293, -4.065513, 1, 1, 1, 1, 1,
-0.7817474, 0.767243, -0.2462098, 1, 1, 1, 1, 1,
-0.7814786, 0.6926448, -1.03019, 1, 1, 1, 1, 1,
-0.7813926, 1.19367, -2.046376, 1, 1, 1, 1, 1,
-0.7794051, 1.271109, -0.4854357, 0, 0, 1, 1, 1,
-0.7780533, 0.1785616, -1.035142, 1, 0, 0, 1, 1,
-0.7749177, 0.2585227, -0.9202011, 1, 0, 0, 1, 1,
-0.7614202, 0.3338341, -0.9412724, 1, 0, 0, 1, 1,
-0.7531431, -0.108858, -2.477939, 1, 0, 0, 1, 1,
-0.7525987, 1.823125, -0.1625219, 1, 0, 0, 1, 1,
-0.7508655, -1.339688, -1.655836, 0, 0, 0, 1, 1,
-0.7497818, -0.04369284, -1.491229, 0, 0, 0, 1, 1,
-0.7457458, 0.7168915, -1.300992, 0, 0, 0, 1, 1,
-0.7438825, -1.052922, -2.817057, 0, 0, 0, 1, 1,
-0.7438762, 1.240714, -1.653915, 0, 0, 0, 1, 1,
-0.7431453, -0.1013259, -1.574388, 0, 0, 0, 1, 1,
-0.7407155, -0.8485789, -2.547488, 0, 0, 0, 1, 1,
-0.7371987, 0.03936218, -0.6184357, 1, 1, 1, 1, 1,
-0.7322696, -0.3649126, -1.792027, 1, 1, 1, 1, 1,
-0.7305998, -1.957458, -2.915506, 1, 1, 1, 1, 1,
-0.7273019, -0.7722041, -1.712162, 1, 1, 1, 1, 1,
-0.7268648, -0.3837681, -2.755527, 1, 1, 1, 1, 1,
-0.7181871, 0.5832842, -0.7616822, 1, 1, 1, 1, 1,
-0.7172462, 0.6942549, -1.702668, 1, 1, 1, 1, 1,
-0.714097, 1.202102, -0.8094101, 1, 1, 1, 1, 1,
-0.7092729, -0.1147202, -2.849421, 1, 1, 1, 1, 1,
-0.7080256, -1.702569, -2.566517, 1, 1, 1, 1, 1,
-0.7069948, 0.1187137, -1.121145, 1, 1, 1, 1, 1,
-0.7069902, 1.00076, -0.5132427, 1, 1, 1, 1, 1,
-0.705794, -0.3295138, -2.283149, 1, 1, 1, 1, 1,
-0.7050598, -1.63551, -4.057633, 1, 1, 1, 1, 1,
-0.7016146, 0.6659142, 0.3099384, 1, 1, 1, 1, 1,
-0.7008489, -2.141541, -2.306573, 0, 0, 1, 1, 1,
-0.7004061, -0.8739782, -3.107624, 1, 0, 0, 1, 1,
-0.7001309, 0.829338, 0.4252626, 1, 0, 0, 1, 1,
-0.6995445, 0.7550703, -1.283112, 1, 0, 0, 1, 1,
-0.6995274, -0.8304452, -1.698973, 1, 0, 0, 1, 1,
-0.6904421, 0.3569714, -0.008306651, 1, 0, 0, 1, 1,
-0.6828786, -1.022646, -3.283095, 0, 0, 0, 1, 1,
-0.6795522, 0.5517522, 0.6103817, 0, 0, 0, 1, 1,
-0.6775367, -0.6996922, -3.042871, 0, 0, 0, 1, 1,
-0.6759982, 0.2873462, -1.854183, 0, 0, 0, 1, 1,
-0.6735321, 0.8489494, -0.6429605, 0, 0, 0, 1, 1,
-0.6728168, -0.0896906, -1.501673, 0, 0, 0, 1, 1,
-0.6716298, 0.5772486, -1.159407, 0, 0, 0, 1, 1,
-0.670046, -2.435467, -2.551159, 1, 1, 1, 1, 1,
-0.6675303, -0.3940479, -0.5384923, 1, 1, 1, 1, 1,
-0.6669511, 0.8508996, -0.7582331, 1, 1, 1, 1, 1,
-0.664108, -1.68683, -3.511431, 1, 1, 1, 1, 1,
-0.6618613, 1.248834, -2.314465, 1, 1, 1, 1, 1,
-0.6602778, -0.7151784, -3.050386, 1, 1, 1, 1, 1,
-0.6579316, -0.3726908, -2.066572, 1, 1, 1, 1, 1,
-0.6539353, -0.7686157, -1.875548, 1, 1, 1, 1, 1,
-0.646367, 0.7288203, -0.02226571, 1, 1, 1, 1, 1,
-0.6417852, -0.9054049, -2.594844, 1, 1, 1, 1, 1,
-0.6383759, 1.955831, 0.1784018, 1, 1, 1, 1, 1,
-0.6369271, 1.556546, 0.9769203, 1, 1, 1, 1, 1,
-0.6368126, 1.806438, 1.531583, 1, 1, 1, 1, 1,
-0.6330888, 0.8983059, -1.08951, 1, 1, 1, 1, 1,
-0.6279613, -0.3870403, -2.036793, 1, 1, 1, 1, 1,
-0.6274629, -1.560552, -1.493547, 0, 0, 1, 1, 1,
-0.621883, -0.6582647, -0.9844668, 1, 0, 0, 1, 1,
-0.6182894, 1.555161, -1.051488, 1, 0, 0, 1, 1,
-0.6100722, 0.9026151, 0.9295151, 1, 0, 0, 1, 1,
-0.6086183, 0.5156292, -1.40249, 1, 0, 0, 1, 1,
-0.6075083, 0.6571241, -0.5645614, 1, 0, 0, 1, 1,
-0.6041633, -2.773123, -2.659811, 0, 0, 0, 1, 1,
-0.5992832, 0.9954574, -0.5916288, 0, 0, 0, 1, 1,
-0.5990936, 0.1710247, 0.3301335, 0, 0, 0, 1, 1,
-0.5967277, -0.2189845, -1.363687, 0, 0, 0, 1, 1,
-0.5938178, 0.3838477, -1.024265, 0, 0, 0, 1, 1,
-0.5856187, 0.06917693, -1.438471, 0, 0, 0, 1, 1,
-0.5848568, 0.2689237, -1.216298, 0, 0, 0, 1, 1,
-0.5828162, 0.4701795, -0.6773258, 1, 1, 1, 1, 1,
-0.5782445, 1.809419, 0.2494669, 1, 1, 1, 1, 1,
-0.5772588, 0.8763937, 0.2080952, 1, 1, 1, 1, 1,
-0.5762298, 1.629418, -0.0244967, 1, 1, 1, 1, 1,
-0.5730891, 0.1042635, -1.111339, 1, 1, 1, 1, 1,
-0.5706201, 0.5116535, -0.3580934, 1, 1, 1, 1, 1,
-0.5686237, 0.8427802, 0.5185437, 1, 1, 1, 1, 1,
-0.560312, 1.495879, -0.1330265, 1, 1, 1, 1, 1,
-0.5581796, -0.2219105, -2.376808, 1, 1, 1, 1, 1,
-0.5488544, 0.2249857, -1.101755, 1, 1, 1, 1, 1,
-0.545276, 1.070305, -0.7041206, 1, 1, 1, 1, 1,
-0.5450513, 0.07694652, -2.408363, 1, 1, 1, 1, 1,
-0.5360908, 0.5589587, -1.799532, 1, 1, 1, 1, 1,
-0.5360788, -0.1129009, -1.672509, 1, 1, 1, 1, 1,
-0.5350428, 0.2352974, 0.2449723, 1, 1, 1, 1, 1,
-0.5334132, -0.374272, -4.589507, 0, 0, 1, 1, 1,
-0.5318843, 1.105959, -0.3280107, 1, 0, 0, 1, 1,
-0.5317129, -0.7831925, -2.87572, 1, 0, 0, 1, 1,
-0.5240367, -1.043471, -4.52853, 1, 0, 0, 1, 1,
-0.523813, 1.481667, 0.05292102, 1, 0, 0, 1, 1,
-0.5234744, 0.5820535, 0.5755273, 1, 0, 0, 1, 1,
-0.5153211, -0.3312142, -1.876832, 0, 0, 0, 1, 1,
-0.5145459, 1.01826, 0.2325145, 0, 0, 0, 1, 1,
-0.513225, -1.05371, -2.809909, 0, 0, 0, 1, 1,
-0.5063053, 0.01116916, -1.0081, 0, 0, 0, 1, 1,
-0.5039987, 0.7262411, -0.7400464, 0, 0, 0, 1, 1,
-0.5016202, 1.908255, 1.02153, 0, 0, 0, 1, 1,
-0.5000374, -0.8675377, -3.86912, 0, 0, 0, 1, 1,
-0.498014, 0.3960509, -1.248454, 1, 1, 1, 1, 1,
-0.4964625, 0.09794089, -0.8631619, 1, 1, 1, 1, 1,
-0.4945852, 1.676535, -2.465241, 1, 1, 1, 1, 1,
-0.4939085, -0.1343871, -3.575636, 1, 1, 1, 1, 1,
-0.4935318, 1.743522, -1.467409, 1, 1, 1, 1, 1,
-0.49274, 1.196467, -1.973355, 1, 1, 1, 1, 1,
-0.4892026, 1.33132, -1.196563, 1, 1, 1, 1, 1,
-0.4816713, -0.1066004, -1.801876, 1, 1, 1, 1, 1,
-0.481589, 0.7065259, -2.147684, 1, 1, 1, 1, 1,
-0.4787268, -0.6366485, -1.478686, 1, 1, 1, 1, 1,
-0.4751288, 0.2474358, -1.306246, 1, 1, 1, 1, 1,
-0.4748994, 0.8997467, 0.9084415, 1, 1, 1, 1, 1,
-0.4690492, -1.960373, -2.651627, 1, 1, 1, 1, 1,
-0.4609262, 1.364145, -1.060893, 1, 1, 1, 1, 1,
-0.458381, -1.21896, -3.83927, 1, 1, 1, 1, 1,
-0.4580737, -0.3670347, -3.023807, 0, 0, 1, 1, 1,
-0.4563105, 0.3204175, -2.566056, 1, 0, 0, 1, 1,
-0.4546285, -1.918211, -2.44987, 1, 0, 0, 1, 1,
-0.4511748, 0.3718896, -0.3908824, 1, 0, 0, 1, 1,
-0.4493086, 0.01349546, -0.7489781, 1, 0, 0, 1, 1,
-0.4474984, -2.796479, -4.502735, 1, 0, 0, 1, 1,
-0.4446753, 0.7537116, -0.7838473, 0, 0, 0, 1, 1,
-0.4442738, -0.7878076, -1.88847, 0, 0, 0, 1, 1,
-0.442452, 0.8774831, -0.2899288, 0, 0, 0, 1, 1,
-0.4421163, 0.9174737, -0.06644337, 0, 0, 0, 1, 1,
-0.4415484, -0.5014269, 0.01342236, 0, 0, 0, 1, 1,
-0.4369445, 1.134792, -0.5405675, 0, 0, 0, 1, 1,
-0.4365285, -1.00022, -2.858339, 0, 0, 0, 1, 1,
-0.4361679, -0.6170701, -3.176284, 1, 1, 1, 1, 1,
-0.4336385, 2.347721, -2.299552, 1, 1, 1, 1, 1,
-0.4329451, 0.0250847, -0.8388103, 1, 1, 1, 1, 1,
-0.4329103, 0.3777237, 0.3542905, 1, 1, 1, 1, 1,
-0.4325856, 0.9134709, 2.302161, 1, 1, 1, 1, 1,
-0.431837, -0.2152726, -1.261468, 1, 1, 1, 1, 1,
-0.4301786, 1.216796, 0.1286199, 1, 1, 1, 1, 1,
-0.42311, -1.357588, -1.733234, 1, 1, 1, 1, 1,
-0.4180006, -0.1515107, -1.244493, 1, 1, 1, 1, 1,
-0.4163985, -2.744934, -3.319491, 1, 1, 1, 1, 1,
-0.4145709, 0.1920372, -0.4554883, 1, 1, 1, 1, 1,
-0.4088887, -0.1835696, -1.80753, 1, 1, 1, 1, 1,
-0.4057171, 1.077005, -0.8712533, 1, 1, 1, 1, 1,
-0.403437, -0.2313768, -3.191498, 1, 1, 1, 1, 1,
-0.3966615, 0.7551299, 0.09525552, 1, 1, 1, 1, 1,
-0.3966518, 0.2716634, -2.61988, 0, 0, 1, 1, 1,
-0.3894787, -0.2223859, -3.107848, 1, 0, 0, 1, 1,
-0.3869651, 0.4434031, -0.1844114, 1, 0, 0, 1, 1,
-0.3865647, 2.710563, 1.135422, 1, 0, 0, 1, 1,
-0.3785456, -1.316107, -2.972986, 1, 0, 0, 1, 1,
-0.3766161, 1.974068, 0.9030744, 1, 0, 0, 1, 1,
-0.3765104, -2.103646, -4.360364, 0, 0, 0, 1, 1,
-0.3759667, -0.8646035, -2.257317, 0, 0, 0, 1, 1,
-0.3680988, 0.6671997, -1.894457, 0, 0, 0, 1, 1,
-0.3648951, -0.9895276, -2.941519, 0, 0, 0, 1, 1,
-0.3644851, -1.679114, -5.530354, 0, 0, 0, 1, 1,
-0.3644249, -2.454551, 0.5756668, 0, 0, 0, 1, 1,
-0.3640663, -0.9484594, -1.856485, 0, 0, 0, 1, 1,
-0.3634478, -0.1286338, -3.095415, 1, 1, 1, 1, 1,
-0.3588199, 2.804826, 1.05697, 1, 1, 1, 1, 1,
-0.3531924, -0.1986482, -1.74332, 1, 1, 1, 1, 1,
-0.352341, 0.4902715, -0.721448, 1, 1, 1, 1, 1,
-0.3392626, 1.081423, -0.2774077, 1, 1, 1, 1, 1,
-0.3367418, -0.5840786, -2.839193, 1, 1, 1, 1, 1,
-0.3358211, 1.382487, -0.76313, 1, 1, 1, 1, 1,
-0.3350409, 0.158984, -1.140509, 1, 1, 1, 1, 1,
-0.3330854, 1.088685, -0.6106511, 1, 1, 1, 1, 1,
-0.3315668, 0.6147963, 0.7858699, 1, 1, 1, 1, 1,
-0.3223695, 1.716095, -0.3774223, 1, 1, 1, 1, 1,
-0.3207611, 0.1168557, -1.367206, 1, 1, 1, 1, 1,
-0.3102704, 1.346595, 0.6571868, 1, 1, 1, 1, 1,
-0.303168, -0.2255576, -3.883422, 1, 1, 1, 1, 1,
-0.3014589, -0.281652, -1.352338, 1, 1, 1, 1, 1,
-0.2975138, 0.02545986, -0.9565181, 0, 0, 1, 1, 1,
-0.296378, -0.7112036, -2.186547, 1, 0, 0, 1, 1,
-0.2920454, -0.6316597, -1.512289, 1, 0, 0, 1, 1,
-0.2890663, 0.5703343, 0.01630775, 1, 0, 0, 1, 1,
-0.2836877, -1.063546, -4.161486, 1, 0, 0, 1, 1,
-0.2724428, 0.8918791, -0.4135158, 1, 0, 0, 1, 1,
-0.2717655, -0.05175943, -0.6455222, 0, 0, 0, 1, 1,
-0.271271, 0.6609246, -1.723039, 0, 0, 0, 1, 1,
-0.2712115, -1.107331, -1.642596, 0, 0, 0, 1, 1,
-0.2705735, -0.4576382, -3.270005, 0, 0, 0, 1, 1,
-0.2635975, -0.5409457, -2.260454, 0, 0, 0, 1, 1,
-0.2596278, -2.300709, -1.130217, 0, 0, 0, 1, 1,
-0.2551691, -0.8568485, -3.268583, 0, 0, 0, 1, 1,
-0.2548565, 1.388588, -0.504137, 1, 1, 1, 1, 1,
-0.2529222, 0.2446123, -0.08634368, 1, 1, 1, 1, 1,
-0.2523304, -0.1445879, -2.002915, 1, 1, 1, 1, 1,
-0.2519368, 1.097474, -1.060417, 1, 1, 1, 1, 1,
-0.2512048, 0.07017516, -1.742162, 1, 1, 1, 1, 1,
-0.2440011, -0.7858242, -1.759356, 1, 1, 1, 1, 1,
-0.2424748, 0.767828, 1.28711, 1, 1, 1, 1, 1,
-0.2268355, -1.547554, -2.953309, 1, 1, 1, 1, 1,
-0.2248852, -1.019288, -3.463778, 1, 1, 1, 1, 1,
-0.2244406, -1.091431, -4.105595, 1, 1, 1, 1, 1,
-0.2239693, 0.2340172, 0.6791587, 1, 1, 1, 1, 1,
-0.2213141, -0.004312306, -0.8948501, 1, 1, 1, 1, 1,
-0.2209705, -0.4047728, -3.411803, 1, 1, 1, 1, 1,
-0.2170428, 1.341484, 0.1203147, 1, 1, 1, 1, 1,
-0.2162985, -1.458381, -3.147717, 1, 1, 1, 1, 1,
-0.2107634, -0.8057837, -3.240116, 0, 0, 1, 1, 1,
-0.2101402, -0.9920952, -3.358589, 1, 0, 0, 1, 1,
-0.2041959, 0.3099981, -1.506361, 1, 0, 0, 1, 1,
-0.2033923, -0.5657355, -3.642141, 1, 0, 0, 1, 1,
-0.1993917, 2.435433, 0.8688641, 1, 0, 0, 1, 1,
-0.1988176, 0.0029633, -2.192339, 1, 0, 0, 1, 1,
-0.198677, 1.288716, 0.07915683, 0, 0, 0, 1, 1,
-0.1950247, -0.8712474, -2.095896, 0, 0, 0, 1, 1,
-0.1918105, 0.9284866, -0.07925287, 0, 0, 0, 1, 1,
-0.1910353, 0.5889429, -1.176616, 0, 0, 0, 1, 1,
-0.1889717, -0.2838039, -1.334688, 0, 0, 0, 1, 1,
-0.1889565, -0.5349764, -3.098074, 0, 0, 0, 1, 1,
-0.1877027, 0.6070814, -0.1334983, 0, 0, 0, 1, 1,
-0.1874248, 0.5825607, 0.3704382, 1, 1, 1, 1, 1,
-0.1744059, -0.06227059, -1.010959, 1, 1, 1, 1, 1,
-0.1725194, -0.7921832, -2.86193, 1, 1, 1, 1, 1,
-0.1696283, -0.2176063, -2.666617, 1, 1, 1, 1, 1,
-0.165261, 1.439668, 0.4404951, 1, 1, 1, 1, 1,
-0.1650801, -1.148011, -3.189775, 1, 1, 1, 1, 1,
-0.1637515, -2.72609, -4.371408, 1, 1, 1, 1, 1,
-0.1620198, -0.400734, -2.8626, 1, 1, 1, 1, 1,
-0.1618168, -0.04331043, -2.074521, 1, 1, 1, 1, 1,
-0.157687, -0.1826037, -2.003263, 1, 1, 1, 1, 1,
-0.1530669, 0.5609078, 0.2729182, 1, 1, 1, 1, 1,
-0.1479676, 0.3668305, -0.09941882, 1, 1, 1, 1, 1,
-0.1475728, -0.2320693, -1.443513, 1, 1, 1, 1, 1,
-0.1444355, 0.4322233, -0.8509651, 1, 1, 1, 1, 1,
-0.1435396, 0.08779354, -0.1670464, 1, 1, 1, 1, 1,
-0.1414156, -0.536024, -3.521419, 0, 0, 1, 1, 1,
-0.1355116, 1.687604, 0.6090718, 1, 0, 0, 1, 1,
-0.1344143, -1.123951, -3.675626, 1, 0, 0, 1, 1,
-0.1313035, 0.6439029, -0.1913262, 1, 0, 0, 1, 1,
-0.1312463, 0.4208321, -1.826672, 1, 0, 0, 1, 1,
-0.1295072, 0.3133905, 0.5481367, 1, 0, 0, 1, 1,
-0.1285838, 0.2450803, 0.2754622, 0, 0, 0, 1, 1,
-0.1172729, -0.3962136, -2.855132, 0, 0, 0, 1, 1,
-0.1143272, -0.871523, -2.419749, 0, 0, 0, 1, 1,
-0.1137314, -1.747155, -3.279059, 0, 0, 0, 1, 1,
-0.1114771, -1.86649, -3.060343, 0, 0, 0, 1, 1,
-0.1090915, -0.7652387, -4.600836, 0, 0, 0, 1, 1,
-0.1081527, 1.169242, 0.09072787, 0, 0, 0, 1, 1,
-0.1068761, -0.7640911, -3.271253, 1, 1, 1, 1, 1,
-0.1002697, 1.157073, -1.050072, 1, 1, 1, 1, 1,
-0.09567378, -0.2446272, -0.7510808, 1, 1, 1, 1, 1,
-0.09474736, 0.107906, -0.5305899, 1, 1, 1, 1, 1,
-0.09459253, -0.6073967, -4.415754, 1, 1, 1, 1, 1,
-0.09426728, 0.3285516, -1.637397, 1, 1, 1, 1, 1,
-0.09315783, 0.162473, -0.5967056, 1, 1, 1, 1, 1,
-0.08867628, -1.687047, -3.246259, 1, 1, 1, 1, 1,
-0.08677884, -0.413332, -2.484606, 1, 1, 1, 1, 1,
-0.0838687, -1.037669, -2.963629, 1, 1, 1, 1, 1,
-0.08003654, 0.287984, 0.06711697, 1, 1, 1, 1, 1,
-0.0796574, -0.5540629, -3.882154, 1, 1, 1, 1, 1,
-0.07919488, 0.3535061, -1.16754, 1, 1, 1, 1, 1,
-0.07649045, -1.103772, -2.726183, 1, 1, 1, 1, 1,
-0.06764001, 0.1292779, -1.028457, 1, 1, 1, 1, 1,
-0.06752699, -0.3644448, -0.6819316, 0, 0, 1, 1, 1,
-0.06745288, -0.05066231, -0.9223574, 1, 0, 0, 1, 1,
-0.06584468, -0.02041114, -2.38428, 1, 0, 0, 1, 1,
-0.06494589, 0.9362927, 1.38455, 1, 0, 0, 1, 1,
-0.06405545, 1.241627, 2.16254, 1, 0, 0, 1, 1,
-0.06362256, 0.9319721, -0.1734498, 1, 0, 0, 1, 1,
-0.05871895, -0.2788955, -3.216988, 0, 0, 0, 1, 1,
-0.05680725, 0.552137, 0.8641413, 0, 0, 0, 1, 1,
-0.05576214, 1.078636, -0.1186081, 0, 0, 0, 1, 1,
-0.0534899, 0.4617305, -1.446074, 0, 0, 0, 1, 1,
-0.05239664, -0.1013874, -1.527868, 0, 0, 0, 1, 1,
-0.04985325, 0.9546026, -0.402145, 0, 0, 0, 1, 1,
-0.0482688, -0.4288773, -4.155959, 0, 0, 0, 1, 1,
-0.0477225, 1.343205, 0.5382407, 1, 1, 1, 1, 1,
-0.0475603, -0.5138197, -3.121092, 1, 1, 1, 1, 1,
-0.03841656, 0.2423654, -0.478973, 1, 1, 1, 1, 1,
-0.0280531, 0.2403911, -0.7642679, 1, 1, 1, 1, 1,
-0.02697365, -0.2972355, -4.801705, 1, 1, 1, 1, 1,
-0.02577397, 0.5204043, 0.08350904, 1, 1, 1, 1, 1,
-0.02153645, -0.2698649, -3.025049, 1, 1, 1, 1, 1,
-0.01714169, 1.380105, 0.2917892, 1, 1, 1, 1, 1,
-0.0140261, -1.672936, -2.113382, 1, 1, 1, 1, 1,
-0.01170701, 0.8272879, 1.67608, 1, 1, 1, 1, 1,
-0.01142911, 0.2026497, -0.5034231, 1, 1, 1, 1, 1,
-0.01085157, -1.051129, -1.144712, 1, 1, 1, 1, 1,
-0.007614241, 0.3884284, 0.4216368, 1, 1, 1, 1, 1,
-0.0007945713, -0.4413145, -2.919431, 1, 1, 1, 1, 1,
0.002253623, 0.1029687, 0.9440386, 1, 1, 1, 1, 1,
0.002626612, -0.6720976, 3.951996, 0, 0, 1, 1, 1,
0.008041102, -1.262806, 2.413263, 1, 0, 0, 1, 1,
0.0105672, -0.8369125, 5.466631, 1, 0, 0, 1, 1,
0.01255951, 0.3819636, -0.6438184, 1, 0, 0, 1, 1,
0.01680714, 0.5519267, -0.5850925, 1, 0, 0, 1, 1,
0.02081108, -1.497192, 1.57976, 1, 0, 0, 1, 1,
0.02718678, -1.135074, 4.117457, 0, 0, 0, 1, 1,
0.02725382, 0.5714859, 0.9700863, 0, 0, 0, 1, 1,
0.03021466, -1.021035, 3.677838, 0, 0, 0, 1, 1,
0.03121412, -0.5062261, 1.815914, 0, 0, 0, 1, 1,
0.03376204, -0.1500096, 2.850001, 0, 0, 0, 1, 1,
0.0337753, -0.2552641, 1.415119, 0, 0, 0, 1, 1,
0.0343423, 1.610529, 0.02454861, 0, 0, 0, 1, 1,
0.03458149, 0.4045984, -0.3422323, 1, 1, 1, 1, 1,
0.03536676, 0.2967418, -0.3079489, 1, 1, 1, 1, 1,
0.04370054, -0.796931, 2.08674, 1, 1, 1, 1, 1,
0.04797044, -0.211911, 2.727566, 1, 1, 1, 1, 1,
0.04841707, 0.5693352, 0.8828055, 1, 1, 1, 1, 1,
0.05332509, -0.4222712, 2.88399, 1, 1, 1, 1, 1,
0.05469856, 1.044269, -1.631047, 1, 1, 1, 1, 1,
0.05473569, -0.2119563, 4.108543, 1, 1, 1, 1, 1,
0.05719582, 0.307837, -0.1761199, 1, 1, 1, 1, 1,
0.05906564, -0.5136079, 3.803898, 1, 1, 1, 1, 1,
0.06662409, 0.3433249, 0.5447356, 1, 1, 1, 1, 1,
0.06857917, 0.6599761, 2.005101, 1, 1, 1, 1, 1,
0.07821277, 1.487868, 0.1317454, 1, 1, 1, 1, 1,
0.0792927, 0.5056358, 0.1491412, 1, 1, 1, 1, 1,
0.08214556, -0.2952002, 4.232887, 1, 1, 1, 1, 1,
0.09152465, -0.8272928, 1.577742, 0, 0, 1, 1, 1,
0.09183806, 0.4235208, 1.65268, 1, 0, 0, 1, 1,
0.09336922, -1.736094, 3.5793, 1, 0, 0, 1, 1,
0.0944901, 1.343593, 2.454916, 1, 0, 0, 1, 1,
0.09810273, 0.9076588, -0.1483209, 1, 0, 0, 1, 1,
0.09870447, -0.5974917, 1.682901, 1, 0, 0, 1, 1,
0.1009343, 0.2935593, -0.550262, 0, 0, 0, 1, 1,
0.1020175, 0.5765938, 0.4080861, 0, 0, 0, 1, 1,
0.1046988, 1.185818, 2.024253, 0, 0, 0, 1, 1,
0.1083773, 0.1555809, 2.079497, 0, 0, 0, 1, 1,
0.1146991, -1.457541, 2.705911, 0, 0, 0, 1, 1,
0.1174729, -0.7761756, 1.48972, 0, 0, 0, 1, 1,
0.1211639, 0.9029915, -0.7535843, 0, 0, 0, 1, 1,
0.1223619, 0.2333374, 0.02088859, 1, 1, 1, 1, 1,
0.1240667, -0.2354125, 3.412172, 1, 1, 1, 1, 1,
0.1260512, -1.582821, 2.227657, 1, 1, 1, 1, 1,
0.1335343, 0.1457738, 2.957071, 1, 1, 1, 1, 1,
0.1447205, -1.509276, 3.430067, 1, 1, 1, 1, 1,
0.1470598, -1.461035, 2.276667, 1, 1, 1, 1, 1,
0.1479995, 0.1300697, 2.294427, 1, 1, 1, 1, 1,
0.1513385, -0.3701016, 4.244691, 1, 1, 1, 1, 1,
0.1523076, -1.114631, 3.215444, 1, 1, 1, 1, 1,
0.1546269, 0.01666285, 1.563561, 1, 1, 1, 1, 1,
0.1570874, -0.7564825, 3.054863, 1, 1, 1, 1, 1,
0.1584626, 0.3670866, 0.2619175, 1, 1, 1, 1, 1,
0.158682, 1.38543, 0.9722806, 1, 1, 1, 1, 1,
0.1602752, -1.448387, 2.066447, 1, 1, 1, 1, 1,
0.1608204, -1.076743, 3.692567, 1, 1, 1, 1, 1,
0.1637848, -1.70304, 5.08549, 0, 0, 1, 1, 1,
0.1657101, 1.802326, 0.1750069, 1, 0, 0, 1, 1,
0.1687391, -0.300935, 1.581339, 1, 0, 0, 1, 1,
0.1704573, -0.9283805, 3.0875, 1, 0, 0, 1, 1,
0.1706658, 0.1018826, 0.2578095, 1, 0, 0, 1, 1,
0.1818045, -1.471401, 1.322534, 1, 0, 0, 1, 1,
0.1841915, -1.430494, 0.8086578, 0, 0, 0, 1, 1,
0.1842825, -1.207147, 6.102474, 0, 0, 0, 1, 1,
0.1867344, 0.1692471, -1.031236, 0, 0, 0, 1, 1,
0.1928512, 0.5368989, -0.3710875, 0, 0, 0, 1, 1,
0.1928861, 1.116216, 0.06774756, 0, 0, 0, 1, 1,
0.195198, -0.8119533, 2.779022, 0, 0, 0, 1, 1,
0.1952499, 1.163512, -0.1777094, 0, 0, 0, 1, 1,
0.2069239, 0.03953101, 0.8937154, 1, 1, 1, 1, 1,
0.2071446, -1.135678, 3.199898, 1, 1, 1, 1, 1,
0.209332, -2.19025, 2.527444, 1, 1, 1, 1, 1,
0.209693, 1.237227, 0.1874202, 1, 1, 1, 1, 1,
0.2108843, 0.3959999, 0.2486458, 1, 1, 1, 1, 1,
0.2112953, -0.478811, 2.25478, 1, 1, 1, 1, 1,
0.2172141, 0.7729226, 0.9915701, 1, 1, 1, 1, 1,
0.2243421, 0.07799653, 1.643751, 1, 1, 1, 1, 1,
0.2291092, 0.8696969, 2.238083, 1, 1, 1, 1, 1,
0.231681, -0.1155046, 4.632713, 1, 1, 1, 1, 1,
0.2330915, -2.093856, 2.470704, 1, 1, 1, 1, 1,
0.2351399, -1.50196, 3.828429, 1, 1, 1, 1, 1,
0.2378592, -0.728811, 0.314467, 1, 1, 1, 1, 1,
0.2415835, 0.7506627, 0.6611979, 1, 1, 1, 1, 1,
0.2422302, 0.274086, 0.9900298, 1, 1, 1, 1, 1,
0.2554087, 1.805807, 0.2753771, 0, 0, 1, 1, 1,
0.2555859, 0.2136048, -0.002479533, 1, 0, 0, 1, 1,
0.2570611, -1.478472, 3.230864, 1, 0, 0, 1, 1,
0.2597762, 0.2231155, 1.185726, 1, 0, 0, 1, 1,
0.2612017, 0.4406098, 1.560633, 1, 0, 0, 1, 1,
0.2625801, 0.4097981, 1.779777, 1, 0, 0, 1, 1,
0.2696251, -0.1998726, 1.219231, 0, 0, 0, 1, 1,
0.2698707, 0.4201921, 0.1122179, 0, 0, 0, 1, 1,
0.2703347, 0.4796941, 1.810888, 0, 0, 0, 1, 1,
0.2727128, -1.538417, 2.451267, 0, 0, 0, 1, 1,
0.2728273, -1.927572, 3.071621, 0, 0, 0, 1, 1,
0.2757088, -1.307833, 1.288999, 0, 0, 0, 1, 1,
0.2770211, 0.7948743, -0.7727289, 0, 0, 0, 1, 1,
0.2781528, -0.1484161, 2.125539, 1, 1, 1, 1, 1,
0.2791919, -0.7038234, 2.39632, 1, 1, 1, 1, 1,
0.2798071, -2.019344, 2.902704, 1, 1, 1, 1, 1,
0.2839389, 0.1902215, 1.555844, 1, 1, 1, 1, 1,
0.2854656, -1.169587, 3.824795, 1, 1, 1, 1, 1,
0.289952, -1.30523, 3.192986, 1, 1, 1, 1, 1,
0.2923635, -1.488988, 3.616574, 1, 1, 1, 1, 1,
0.2935251, 0.8880525, 0.9188799, 1, 1, 1, 1, 1,
0.2945777, 0.8408325, 1.188665, 1, 1, 1, 1, 1,
0.300979, -0.8809564, 2.693293, 1, 1, 1, 1, 1,
0.302199, -0.8029544, 1.339548, 1, 1, 1, 1, 1,
0.3073047, 0.01254446, 2.048193, 1, 1, 1, 1, 1,
0.3077278, -0.3256838, 2.295152, 1, 1, 1, 1, 1,
0.3084936, 0.4365413, 3.238894, 1, 1, 1, 1, 1,
0.3179592, 1.466942, -0.5864741, 1, 1, 1, 1, 1,
0.3253438, 0.6717797, 1.389921, 0, 0, 1, 1, 1,
0.3276916, 0.3776522, 2.692827, 1, 0, 0, 1, 1,
0.3305598, 0.6188699, 0.6415944, 1, 0, 0, 1, 1,
0.3321382, -0.563823, 3.544768, 1, 0, 0, 1, 1,
0.3335393, 0.8597136, -0.2649734, 1, 0, 0, 1, 1,
0.3349121, 1.701612, 1.18959, 1, 0, 0, 1, 1,
0.3388451, -0.6869639, 3.824599, 0, 0, 0, 1, 1,
0.3422158, 0.758892, 0.2806906, 0, 0, 0, 1, 1,
0.3424768, -0.6000476, 1.573139, 0, 0, 0, 1, 1,
0.348046, -1.134988, 4.660301, 0, 0, 0, 1, 1,
0.3549754, 1.706139, 0.5927265, 0, 0, 0, 1, 1,
0.3558683, 0.469295, 2.253616, 0, 0, 0, 1, 1,
0.3558728, 0.9230394, 1.665296, 0, 0, 0, 1, 1,
0.3611322, -0.454361, 2.563761, 1, 1, 1, 1, 1,
0.3637607, -0.08839511, 2.593915, 1, 1, 1, 1, 1,
0.3641891, 0.1314263, 3.018216, 1, 1, 1, 1, 1,
0.3727116, 0.9865782, 0.02258284, 1, 1, 1, 1, 1,
0.377398, -0.9454073, 4.532408, 1, 1, 1, 1, 1,
0.3818212, -1.045485, 1.958824, 1, 1, 1, 1, 1,
0.3826765, 0.6543552, -1.286363, 1, 1, 1, 1, 1,
0.3841012, 0.298484, 1.581172, 1, 1, 1, 1, 1,
0.3856764, 0.7291776, 0.3647055, 1, 1, 1, 1, 1,
0.3861291, -0.851353, 2.551932, 1, 1, 1, 1, 1,
0.3873494, -0.9700171, 3.322087, 1, 1, 1, 1, 1,
0.3873659, -0.4845088, 4.099101, 1, 1, 1, 1, 1,
0.3892147, -0.4945182, 2.362623, 1, 1, 1, 1, 1,
0.389738, 0.8200132, -0.3461344, 1, 1, 1, 1, 1,
0.3928174, -0.05970922, 1.565008, 1, 1, 1, 1, 1,
0.3930396, 1.406331, -0.006142774, 0, 0, 1, 1, 1,
0.3935669, -0.1732054, 1.821608, 1, 0, 0, 1, 1,
0.394069, 0.7019707, 0.9505875, 1, 0, 0, 1, 1,
0.3981554, -1.074155, 0.7236158, 1, 0, 0, 1, 1,
0.4009617, 0.7787803, 0.0408711, 1, 0, 0, 1, 1,
0.4010278, -1.609821, 2.50075, 1, 0, 0, 1, 1,
0.4026221, 0.3270157, 0.6855714, 0, 0, 0, 1, 1,
0.4036708, 0.7943152, 2.370205, 0, 0, 0, 1, 1,
0.4053984, 0.3095859, 0.9957398, 0, 0, 0, 1, 1,
0.4055464, 0.637221, -0.9397024, 0, 0, 0, 1, 1,
0.4056638, 0.1100897, 0.04693326, 0, 0, 0, 1, 1,
0.4073384, -0.820143, 3.338431, 0, 0, 0, 1, 1,
0.4087331, -1.172924, 3.450359, 0, 0, 0, 1, 1,
0.4091036, 0.8776413, 1.428321, 1, 1, 1, 1, 1,
0.4103066, -0.2099759, 2.248555, 1, 1, 1, 1, 1,
0.4108999, 0.3230259, 1.735247, 1, 1, 1, 1, 1,
0.4144569, -0.1393038, 2.950497, 1, 1, 1, 1, 1,
0.4174463, 0.1325758, 2.10501, 1, 1, 1, 1, 1,
0.4212929, -0.2515428, 1.026752, 1, 1, 1, 1, 1,
0.4233198, -0.6218892, 2.478059, 1, 1, 1, 1, 1,
0.4252945, -0.8755024, 0.7407117, 1, 1, 1, 1, 1,
0.427073, 1.181584, -0.7495655, 1, 1, 1, 1, 1,
0.427299, -0.7037633, 2.090615, 1, 1, 1, 1, 1,
0.4285908, -0.7630235, 3.274276, 1, 1, 1, 1, 1,
0.4306158, 0.6481206, -0.1348478, 1, 1, 1, 1, 1,
0.4311084, 0.06960499, 1.635298, 1, 1, 1, 1, 1,
0.4403976, -0.5022366, 2.422163, 1, 1, 1, 1, 1,
0.4447447, 0.619113, 0.4591428, 1, 1, 1, 1, 1,
0.4502574, -0.2016809, 0.9650704, 0, 0, 1, 1, 1,
0.454919, -0.3262672, 0.8269793, 1, 0, 0, 1, 1,
0.4556979, 0.06248046, 0.4900425, 1, 0, 0, 1, 1,
0.4564994, 1.066693, -0.5272321, 1, 0, 0, 1, 1,
0.4569073, -0.4579608, 3.473647, 1, 0, 0, 1, 1,
0.4679614, -0.8447946, 2.863326, 1, 0, 0, 1, 1,
0.4733782, -0.06836796, 2.614499, 0, 0, 0, 1, 1,
0.4750008, 0.2823234, 0.5218103, 0, 0, 0, 1, 1,
0.4761532, -0.250104, 2.576128, 0, 0, 0, 1, 1,
0.4763013, -1.987109, 3.330977, 0, 0, 0, 1, 1,
0.4784507, -0.2810886, 1.858925, 0, 0, 0, 1, 1,
0.4861203, -0.5271546, 0.2009093, 0, 0, 0, 1, 1,
0.4901071, -0.5950145, 1.447887, 0, 0, 0, 1, 1,
0.490776, -0.2462167, 3.414135, 1, 1, 1, 1, 1,
0.4989921, 0.8282355, -0.0683226, 1, 1, 1, 1, 1,
0.5083539, 0.01607596, 1.695411, 1, 1, 1, 1, 1,
0.5096822, 0.5740942, 0.4774966, 1, 1, 1, 1, 1,
0.5151601, 0.1930828, 0.03126775, 1, 1, 1, 1, 1,
0.5152442, -0.05274417, 0.1500753, 1, 1, 1, 1, 1,
0.5160846, -0.7614558, 3.285799, 1, 1, 1, 1, 1,
0.5205045, 0.08004501, 1.790872, 1, 1, 1, 1, 1,
0.522781, -1.787084, 3.627346, 1, 1, 1, 1, 1,
0.5235073, -0.3797808, 2.688786, 1, 1, 1, 1, 1,
0.5242751, -1.040936, 3.14486, 1, 1, 1, 1, 1,
0.5262982, 1.827332, 1.29386, 1, 1, 1, 1, 1,
0.5263425, 0.4139668, 0.1405461, 1, 1, 1, 1, 1,
0.527271, -1.369828, 2.374775, 1, 1, 1, 1, 1,
0.5275283, 0.5191228, -0.3120923, 1, 1, 1, 1, 1,
0.5275727, -0.811976, 1.213668, 0, 0, 1, 1, 1,
0.5445897, 0.9466396, -0.6968457, 1, 0, 0, 1, 1,
0.5452088, 0.4492076, 0.6575785, 1, 0, 0, 1, 1,
0.5458987, 0.8639556, -1.038988, 1, 0, 0, 1, 1,
0.548862, 0.5825664, 0.7364671, 1, 0, 0, 1, 1,
0.5578573, -0.6182865, 3.071357, 1, 0, 0, 1, 1,
0.5585482, -1.430937, 2.145179, 0, 0, 0, 1, 1,
0.5588506, 1.324156, -0.3398737, 0, 0, 0, 1, 1,
0.5605865, 0.3837153, 1.195272, 0, 0, 0, 1, 1,
0.5611366, 0.3211629, -0.4354611, 0, 0, 0, 1, 1,
0.5614886, -0.8592505, 2.486475, 0, 0, 0, 1, 1,
0.5618454, 0.5738166, 0.03462052, 0, 0, 0, 1, 1,
0.564033, -1.5183, 3.61955, 0, 0, 0, 1, 1,
0.5670251, 1.084862, 1.05257, 1, 1, 1, 1, 1,
0.5705687, 0.6162047, 1.303686, 1, 1, 1, 1, 1,
0.5739797, -0.2319524, 2.893543, 1, 1, 1, 1, 1,
0.5745386, -1.045994, 3.141643, 1, 1, 1, 1, 1,
0.5766624, 0.7252899, 0.1933679, 1, 1, 1, 1, 1,
0.578571, -0.01588987, 3.430456, 1, 1, 1, 1, 1,
0.5840651, -0.2522826, 1.866996, 1, 1, 1, 1, 1,
0.5863089, -1.32743, 3.11078, 1, 1, 1, 1, 1,
0.5872619, 0.6743906, 0.9533548, 1, 1, 1, 1, 1,
0.5898418, -1.046777, 3.715172, 1, 1, 1, 1, 1,
0.5937172, -0.7025823, 2.842207, 1, 1, 1, 1, 1,
0.5949113, -0.7824951, 0.6108157, 1, 1, 1, 1, 1,
0.6003152, -0.1054771, 0.7989182, 1, 1, 1, 1, 1,
0.6007162, -0.976979, 0.7760994, 1, 1, 1, 1, 1,
0.6021858, -0.4578903, 1.200109, 1, 1, 1, 1, 1,
0.6029484, 1.565393, 1.519103, 0, 0, 1, 1, 1,
0.605831, -1.709216, 5.240539, 1, 0, 0, 1, 1,
0.6176476, -2.39217, 2.678761, 1, 0, 0, 1, 1,
0.6189123, 0.05781806, 0.5042493, 1, 0, 0, 1, 1,
0.6330888, 0.4160509, 0.2076903, 1, 0, 0, 1, 1,
0.6386998, -2.288071, 1.450579, 1, 0, 0, 1, 1,
0.6440942, 0.9260344, 0.2919184, 0, 0, 0, 1, 1,
0.6463459, -0.7572871, 0.6915338, 0, 0, 0, 1, 1,
0.6480917, -0.1567189, 1.490821, 0, 0, 0, 1, 1,
0.6506141, -0.3052595, 2.57281, 0, 0, 0, 1, 1,
0.6508074, 1.905459, 0.1629139, 0, 0, 0, 1, 1,
0.6561267, -0.9438105, 0.7928238, 0, 0, 0, 1, 1,
0.6581155, 0.5895182, 0.927096, 0, 0, 0, 1, 1,
0.6590833, -0.2556662, 3.055823, 1, 1, 1, 1, 1,
0.6622662, -0.5179689, 4.430965, 1, 1, 1, 1, 1,
0.6645215, -0.3729647, 3.49434, 1, 1, 1, 1, 1,
0.6655328, -0.2252553, 3.446364, 1, 1, 1, 1, 1,
0.6737553, -0.4933598, 1.873822, 1, 1, 1, 1, 1,
0.6769413, 0.4350621, 0.688346, 1, 1, 1, 1, 1,
0.6814545, 0.7412325, 2.638402, 1, 1, 1, 1, 1,
0.6829303, -0.1661914, 2.510241, 1, 1, 1, 1, 1,
0.6842142, 1.705298, -0.255505, 1, 1, 1, 1, 1,
0.6855516, -0.4616419, 3.764172, 1, 1, 1, 1, 1,
0.6895722, 0.3503238, 1.883201, 1, 1, 1, 1, 1,
0.692661, -2.087315, 4.611628, 1, 1, 1, 1, 1,
0.6980976, -0.5707895, 3.766126, 1, 1, 1, 1, 1,
0.7121312, -0.825395, 3.867326, 1, 1, 1, 1, 1,
0.71292, -1.078297, 2.978806, 1, 1, 1, 1, 1,
0.7145312, 0.8457647, 0.2950779, 0, 0, 1, 1, 1,
0.7166258, -0.1287589, 0.926329, 1, 0, 0, 1, 1,
0.7214657, -0.2796218, 3.496624, 1, 0, 0, 1, 1,
0.7306603, -1.448652, 1.449461, 1, 0, 0, 1, 1,
0.7324272, 0.8342402, 1.720222, 1, 0, 0, 1, 1,
0.7330511, 2.451196, 0.7639663, 1, 0, 0, 1, 1,
0.7367799, 0.6036174, 1.989114, 0, 0, 0, 1, 1,
0.7402965, 1.20556, 1.957917, 0, 0, 0, 1, 1,
0.7434846, 0.9054117, 0.01666038, 0, 0, 0, 1, 1,
0.7455395, -1.675372, 3.917972, 0, 0, 0, 1, 1,
0.7465339, 0.9939489, -0.2052643, 0, 0, 0, 1, 1,
0.747954, 1.320228, 0.2676664, 0, 0, 0, 1, 1,
0.7516121, -0.5831225, 2.613793, 0, 0, 0, 1, 1,
0.7655726, 1.372395, 1.388421, 1, 1, 1, 1, 1,
0.7731779, 0.5172213, 0.4090944, 1, 1, 1, 1, 1,
0.7801697, 0.7636147, 1.376369, 1, 1, 1, 1, 1,
0.7836483, -0.9374394, 1.51426, 1, 1, 1, 1, 1,
0.7898152, -1.80885, 2.033301, 1, 1, 1, 1, 1,
0.7908698, -0.966102, 4.352879, 1, 1, 1, 1, 1,
0.7967773, 0.7744672, -0.5243232, 1, 1, 1, 1, 1,
0.8030178, -0.4104618, 2.606827, 1, 1, 1, 1, 1,
0.804395, 0.7276713, 0.2801082, 1, 1, 1, 1, 1,
0.805803, -0.9204314, 1.532614, 1, 1, 1, 1, 1,
0.8146431, 1.005272, -0.7464941, 1, 1, 1, 1, 1,
0.8173584, -0.695286, 2.193671, 1, 1, 1, 1, 1,
0.8175226, -0.8621072, 1.496907, 1, 1, 1, 1, 1,
0.8184348, -0.5426116, 3.701152, 1, 1, 1, 1, 1,
0.8222088, -0.3950471, 2.397206, 1, 1, 1, 1, 1,
0.8245437, -1.207814, 2.099936, 0, 0, 1, 1, 1,
0.8380874, -0.3737657, 2.097735, 1, 0, 0, 1, 1,
0.8405727, 1.873629, -0.7114636, 1, 0, 0, 1, 1,
0.8415943, 0.2524343, 3.316308, 1, 0, 0, 1, 1,
0.8424335, 0.01452726, 1.927286, 1, 0, 0, 1, 1,
0.8434321, 0.8614324, 1.3914, 1, 0, 0, 1, 1,
0.8447097, 0.9909024, -0.1951898, 0, 0, 0, 1, 1,
0.8468809, 0.6073566, 0.08197119, 0, 0, 0, 1, 1,
0.849611, 0.5788137, 1.258249, 0, 0, 0, 1, 1,
0.8540387, 0.1318536, 1.429086, 0, 0, 0, 1, 1,
0.8577939, -1.663841, 3.561128, 0, 0, 0, 1, 1,
0.8580776, -0.0231498, 2.184399, 0, 0, 0, 1, 1,
0.8598489, 0.4894429, 1.442582, 0, 0, 0, 1, 1,
0.8754061, 1.079059, 0.9151653, 1, 1, 1, 1, 1,
0.8760394, -0.4797246, 2.426411, 1, 1, 1, 1, 1,
0.8839496, 1.040245, -0.6345201, 1, 1, 1, 1, 1,
0.8984584, 0.2461742, 1.25535, 1, 1, 1, 1, 1,
0.9030764, 0.4151756, 0.03883833, 1, 1, 1, 1, 1,
0.9087844, 0.463045, -1.162242, 1, 1, 1, 1, 1,
0.9122123, -0.4152425, 1.151037, 1, 1, 1, 1, 1,
0.9150023, 0.6093253, 2.060004, 1, 1, 1, 1, 1,
0.9295326, 2.229287, 0.1845457, 1, 1, 1, 1, 1,
0.9385324, 1.960052, -1.203689, 1, 1, 1, 1, 1,
0.9386017, 1.078585, -0.9251516, 1, 1, 1, 1, 1,
0.9477753, 1.487532, -1.247404, 1, 1, 1, 1, 1,
0.9498141, 0.950691, -1.163124, 1, 1, 1, 1, 1,
0.9499063, -1.693235, 0.9804591, 1, 1, 1, 1, 1,
0.9505358, -0.4755622, 1.297756, 1, 1, 1, 1, 1,
0.953573, -1.530904, 3.466389, 0, 0, 1, 1, 1,
0.9605945, 0.3603553, 1.055052, 1, 0, 0, 1, 1,
0.9678298, -0.8412415, 3.069714, 1, 0, 0, 1, 1,
0.9738036, 1.288937, 0.6255116, 1, 0, 0, 1, 1,
0.9751903, 0.4433785, -0.5247034, 1, 0, 0, 1, 1,
0.9772052, 1.193341, 0.8600572, 1, 0, 0, 1, 1,
0.9784145, -0.8349154, 2.069319, 0, 0, 0, 1, 1,
0.9800612, 1.42702, 1.675057, 0, 0, 0, 1, 1,
0.9827825, 0.763211, 1.721834, 0, 0, 0, 1, 1,
0.9887773, -0.2693861, 3.46913, 0, 0, 0, 1, 1,
0.9963635, 1.556003, 2.116715, 0, 0, 0, 1, 1,
0.9984115, -0.9400481, 1.700979, 0, 0, 0, 1, 1,
1.003662, 0.1558706, -1.114967, 0, 0, 0, 1, 1,
1.006196, -0.2259634, 2.086472, 1, 1, 1, 1, 1,
1.007431, -1.929754, 1.862645, 1, 1, 1, 1, 1,
1.009914, -1.031442, 2.822206, 1, 1, 1, 1, 1,
1.027144, -0.2103304, 2.904541, 1, 1, 1, 1, 1,
1.029147, 0.5672128, 1.356756, 1, 1, 1, 1, 1,
1.030924, -1.108124, 3.144468, 1, 1, 1, 1, 1,
1.039405, -0.4214786, 1.404035, 1, 1, 1, 1, 1,
1.050478, 0.0105675, 1.557497, 1, 1, 1, 1, 1,
1.050733, -0.04717056, 2.653951, 1, 1, 1, 1, 1,
1.055539, -0.6415575, 3.337536, 1, 1, 1, 1, 1,
1.062396, -0.4582253, 0.2937618, 1, 1, 1, 1, 1,
1.063422, 1.673824, 1.116068, 1, 1, 1, 1, 1,
1.063882, -1.417159, 1.910555, 1, 1, 1, 1, 1,
1.064994, -1.023297, 2.584258, 1, 1, 1, 1, 1,
1.069298, -0.4454365, 4.169983, 1, 1, 1, 1, 1,
1.07529, -0.2465403, 0.4875898, 0, 0, 1, 1, 1,
1.09025, -0.1121445, 1.544773, 1, 0, 0, 1, 1,
1.091407, 0.06001899, 2.196962, 1, 0, 0, 1, 1,
1.092455, 1.58578, 0.8750146, 1, 0, 0, 1, 1,
1.093419, 0.05926293, 0.742665, 1, 0, 0, 1, 1,
1.096339, -0.063601, 1.666444, 1, 0, 0, 1, 1,
1.101304, 1.156784, 0.7149842, 0, 0, 0, 1, 1,
1.107625, 1.027046, 0.2332076, 0, 0, 0, 1, 1,
1.110451, 0.04214855, 2.091199, 0, 0, 0, 1, 1,
1.110777, -0.2954162, 1.149577, 0, 0, 0, 1, 1,
1.111764, 0.05571987, 2.264042, 0, 0, 0, 1, 1,
1.112236, -0.7706251, 1.672302, 0, 0, 0, 1, 1,
1.117278, 1.535887, 1.843919, 0, 0, 0, 1, 1,
1.122247, -0.09118614, 1.446348, 1, 1, 1, 1, 1,
1.12325, -0.6607541, 2.094118, 1, 1, 1, 1, 1,
1.123813, 1.08139, 0.06779458, 1, 1, 1, 1, 1,
1.124723, 0.8090129, 1.547678, 1, 1, 1, 1, 1,
1.125049, 1.275483, 2.752743, 1, 1, 1, 1, 1,
1.131247, -1.823947, 2.582227, 1, 1, 1, 1, 1,
1.137814, 0.02654636, 1.944032, 1, 1, 1, 1, 1,
1.139483, -2.080764, 1.84893, 1, 1, 1, 1, 1,
1.15092, -1.003287, 1.846598, 1, 1, 1, 1, 1,
1.155529, -1.687943, 2.146783, 1, 1, 1, 1, 1,
1.156332, -1.133045, 1.32318, 1, 1, 1, 1, 1,
1.167493, -0.7035527, 1.517033, 1, 1, 1, 1, 1,
1.168095, 0.7831435, 1.925244, 1, 1, 1, 1, 1,
1.169764, -1.146017, 1.155557, 1, 1, 1, 1, 1,
1.176767, -0.3636763, 2.202177, 1, 1, 1, 1, 1,
1.180218, 1.314533, -0.0203908, 0, 0, 1, 1, 1,
1.18064, 0.4829142, 1.751511, 1, 0, 0, 1, 1,
1.183885, -0.08841379, 2.697196, 1, 0, 0, 1, 1,
1.191938, 0.7359339, 1.61357, 1, 0, 0, 1, 1,
1.194784, -0.248573, 1.125253, 1, 0, 0, 1, 1,
1.196582, 0.5885081, 2.082614, 1, 0, 0, 1, 1,
1.203251, 0.8776645, 0.3012601, 0, 0, 0, 1, 1,
1.212145, 2.337926, 1.129347, 0, 0, 0, 1, 1,
1.214257, 1.597082, -0.5232717, 0, 0, 0, 1, 1,
1.21575, -0.1740104, 2.723685, 0, 0, 0, 1, 1,
1.219543, 1.315627, 1.479326, 0, 0, 0, 1, 1,
1.241252, 0.01444629, 2.309221, 0, 0, 0, 1, 1,
1.244359, -0.2988163, 0.7679449, 0, 0, 0, 1, 1,
1.24742, -1.02496, 1.425431, 1, 1, 1, 1, 1,
1.251458, 1.631084, 1.479468, 1, 1, 1, 1, 1,
1.264328, 0.07082526, 2.726514, 1, 1, 1, 1, 1,
1.268781, 0.05520351, 1.94346, 1, 1, 1, 1, 1,
1.274898, -0.6619928, 0.684383, 1, 1, 1, 1, 1,
1.27784, 0.6252916, 0.8006331, 1, 1, 1, 1, 1,
1.280803, 0.06540306, -0.5988062, 1, 1, 1, 1, 1,
1.287996, -0.2040482, 2.111724, 1, 1, 1, 1, 1,
1.297197, -2.043602, 2.503664, 1, 1, 1, 1, 1,
1.300735, -1.134538, 1.149753, 1, 1, 1, 1, 1,
1.303695, 0.4514503, 1.155869, 1, 1, 1, 1, 1,
1.304815, 0.1481441, 2.248516, 1, 1, 1, 1, 1,
1.311281, 0.2801201, 2.360151, 1, 1, 1, 1, 1,
1.312567, 0.7531325, 0.9440838, 1, 1, 1, 1, 1,
1.315367, -0.7305155, 2.925487, 1, 1, 1, 1, 1,
1.321714, -0.3263163, 2.12039, 0, 0, 1, 1, 1,
1.329861, 0.05881068, 2.627199, 1, 0, 0, 1, 1,
1.330889, -1.076912, 2.567379, 1, 0, 0, 1, 1,
1.333215, 2.021581, 0.02199582, 1, 0, 0, 1, 1,
1.333996, -0.9244184, 2.931178, 1, 0, 0, 1, 1,
1.334801, 0.440911, 1.102908, 1, 0, 0, 1, 1,
1.340614, -0.9193884, 3.445724, 0, 0, 0, 1, 1,
1.345076, 0.3661017, 0.8723694, 0, 0, 0, 1, 1,
1.347673, 1.145789, 0.9347539, 0, 0, 0, 1, 1,
1.356289, -1.217605, 2.885337, 0, 0, 0, 1, 1,
1.366797, 0.3945605, 3.328202, 0, 0, 0, 1, 1,
1.36714, 1.429789, 0.2763465, 0, 0, 0, 1, 1,
1.368366, -0.1329703, 0.2574531, 0, 0, 0, 1, 1,
1.373861, -2.60203, 3.414678, 1, 1, 1, 1, 1,
1.377545, 1.002943, -0.04328079, 1, 1, 1, 1, 1,
1.382979, 0.7342426, 1.421927, 1, 1, 1, 1, 1,
1.386405, -0.8927264, 3.040795, 1, 1, 1, 1, 1,
1.390471, -0.003163846, 2.152153, 1, 1, 1, 1, 1,
1.410051, 3.539655, 1.262643, 1, 1, 1, 1, 1,
1.411716, 1.082325, 3.763595, 1, 1, 1, 1, 1,
1.42593, -0.3292946, 2.039191, 1, 1, 1, 1, 1,
1.458975, 0.5163754, 1.806009, 1, 1, 1, 1, 1,
1.467506, 0.1657019, 2.652373, 1, 1, 1, 1, 1,
1.498347, 0.001749145, 1.676865, 1, 1, 1, 1, 1,
1.501408, 0.5168981, -0.3630403, 1, 1, 1, 1, 1,
1.501774, -0.6602672, 0.06339649, 1, 1, 1, 1, 1,
1.506589, 0.7309922, 1.555132, 1, 1, 1, 1, 1,
1.512344, -1.295179, 4.214679, 1, 1, 1, 1, 1,
1.512375, 0.2064684, 0.4155707, 0, 0, 1, 1, 1,
1.516362, -0.2552361, 2.410855, 1, 0, 0, 1, 1,
1.519016, -0.4880558, 3.908423, 1, 0, 0, 1, 1,
1.522758, -1.111098, 0.3323824, 1, 0, 0, 1, 1,
1.533916, 0.9337286, 2.11827, 1, 0, 0, 1, 1,
1.535852, 2.160577, -1.037947, 1, 0, 0, 1, 1,
1.56495, 0.671757, 0.1736755, 0, 0, 0, 1, 1,
1.566019, 0.6655167, 2.019065, 0, 0, 0, 1, 1,
1.582912, -2.149716, 0.693824, 0, 0, 0, 1, 1,
1.600399, 1.394906, -0.4273254, 0, 0, 0, 1, 1,
1.601931, -1.264782, 2.372426, 0, 0, 0, 1, 1,
1.606017, 0.6334215, 1.721066, 0, 0, 0, 1, 1,
1.632817, -1.000519, 2.262364, 0, 0, 0, 1, 1,
1.637817, 1.516025, -0.03555616, 1, 1, 1, 1, 1,
1.652893, 0.386695, 1.32189, 1, 1, 1, 1, 1,
1.655068, -0.5376419, 0.9720581, 1, 1, 1, 1, 1,
1.658659, -1.351985, 3.152586, 1, 1, 1, 1, 1,
1.664914, 0.9310485, 0.1985718, 1, 1, 1, 1, 1,
1.6707, 0.2938846, 1.665205, 1, 1, 1, 1, 1,
1.678602, 0.1600341, 2.041791, 1, 1, 1, 1, 1,
1.684775, 0.1549234, 0.2519684, 1, 1, 1, 1, 1,
1.69545, 0.2094797, 1.60616, 1, 1, 1, 1, 1,
1.698715, 0.4239542, 1.262171, 1, 1, 1, 1, 1,
1.70797, 1.190057, -0.4351063, 1, 1, 1, 1, 1,
1.719799, -1.508154, 3.045516, 1, 1, 1, 1, 1,
1.720725, 2.043805, -0.5298951, 1, 1, 1, 1, 1,
1.730608, 0.1703394, 2.508743, 1, 1, 1, 1, 1,
1.734656, 0.07663487, 0.9178084, 1, 1, 1, 1, 1,
1.735775, -0.2780647, 2.732018, 0, 0, 1, 1, 1,
1.736898, 0.6277921, 1.182357, 1, 0, 0, 1, 1,
1.737942, -1.725376, 1.06556, 1, 0, 0, 1, 1,
1.749856, -1.009089, 2.726484, 1, 0, 0, 1, 1,
1.759759, 1.615578, 1.68642, 1, 0, 0, 1, 1,
1.760124, -1.834962, 0.05473315, 1, 0, 0, 1, 1,
1.765243, 0.5777287, 0.8069493, 0, 0, 0, 1, 1,
1.795183, 0.8505009, 1.799711, 0, 0, 0, 1, 1,
1.801694, 1.867399, 1.82843, 0, 0, 0, 1, 1,
1.838415, -0.6017203, 2.401593, 0, 0, 0, 1, 1,
1.850542, 1.71698, 1.842362, 0, 0, 0, 1, 1,
1.857869, 1.320346, 0.9198022, 0, 0, 0, 1, 1,
1.868051, 0.9286016, 0.8821848, 0, 0, 0, 1, 1,
1.876234, -1.542644, 2.079363, 1, 1, 1, 1, 1,
1.889659, 0.9994825, 0.6298465, 1, 1, 1, 1, 1,
1.896986, 0.9770979, 1.473953, 1, 1, 1, 1, 1,
1.900961, -1.307822, 1.858199, 1, 1, 1, 1, 1,
1.906455, -1.101699, 2.89215, 1, 1, 1, 1, 1,
1.908101, 0.3561251, 1.042826, 1, 1, 1, 1, 1,
1.928737, -1.173619, 2.75043, 1, 1, 1, 1, 1,
1.937787, -0.3157985, 1.426833, 1, 1, 1, 1, 1,
1.938968, 0.1903478, 0.9028748, 1, 1, 1, 1, 1,
1.959871, -1.687705, 0.02635043, 1, 1, 1, 1, 1,
2.057271, -0.6351923, 0.2320212, 1, 1, 1, 1, 1,
2.081091, -0.7696017, 2.527301, 1, 1, 1, 1, 1,
2.10876, 0.8912153, -1.071155, 1, 1, 1, 1, 1,
2.111655, -0.7051696, 1.83584, 1, 1, 1, 1, 1,
2.112163, -0.260346, 1.77309, 1, 1, 1, 1, 1,
2.125662, 0.8005346, 1.823761, 0, 0, 1, 1, 1,
2.125974, 0.9809737, 0.8455074, 1, 0, 0, 1, 1,
2.130928, 0.492377, 1.14955, 1, 0, 0, 1, 1,
2.146847, 0.2726425, 1.02976, 1, 0, 0, 1, 1,
2.149633, -1.30745, 1.655458, 1, 0, 0, 1, 1,
2.151028, 0.1902834, 2.34821, 1, 0, 0, 1, 1,
2.166442, 0.1793801, 2.980507, 0, 0, 0, 1, 1,
2.229208, 0.3075716, 0.3201374, 0, 0, 0, 1, 1,
2.2416, 0.5523561, 1.921854, 0, 0, 0, 1, 1,
2.286105, 0.3322133, 0.3473173, 0, 0, 0, 1, 1,
2.312028, 1.942771, 0.4848569, 0, 0, 0, 1, 1,
2.360011, 0.7429969, 0.7806153, 0, 0, 0, 1, 1,
2.389066, -0.2928967, 2.215186, 0, 0, 0, 1, 1,
2.436384, -1.959618, 1.190187, 1, 1, 1, 1, 1,
2.451517, 0.1116917, 2.578496, 1, 1, 1, 1, 1,
2.564866, 1.26941, 3.186373, 1, 1, 1, 1, 1,
2.745531, 1.188883, 1.47365, 1, 1, 1, 1, 1,
2.795823, 0.3070567, 0.1086474, 1, 1, 1, 1, 1,
3.083089, -2.480238, 0.9480633, 1, 1, 1, 1, 1,
3.08844, -1.148814, 2.646084, 1, 1, 1, 1, 1
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
var radius = 9.90598;
var distance = 34.79434;
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
mvMatrix.translate( -0.01046705, -0.2964804, -0.2860599 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.79434);
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
