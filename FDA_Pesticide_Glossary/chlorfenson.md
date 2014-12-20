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
-3.277676, 1.584871, -1.175932, 1, 0, 0, 1,
-2.91703, 1.689015, 0.7319233, 1, 0.007843138, 0, 1,
-2.79954, 0.158638, -2.048478, 1, 0.01176471, 0, 1,
-2.798402, -1.050607, -1.043447, 1, 0.01960784, 0, 1,
-2.76195, -1.629663, -2.23612, 1, 0.02352941, 0, 1,
-2.712163, 1.522072, -2.025292, 1, 0.03137255, 0, 1,
-2.670612, -0.04449309, -2.086973, 1, 0.03529412, 0, 1,
-2.660821, -1.54037, -3.230515, 1, 0.04313726, 0, 1,
-2.557005, -0.7778646, -0.5478618, 1, 0.04705882, 0, 1,
-2.538585, -0.6844838, -2.289736, 1, 0.05490196, 0, 1,
-2.497316, -0.08040148, -0.6283605, 1, 0.05882353, 0, 1,
-2.320362, 1.14379, 0.3838339, 1, 0.06666667, 0, 1,
-2.283609, -0.4460567, -2.247711, 1, 0.07058824, 0, 1,
-2.282149, -0.4560408, -1.678205, 1, 0.07843138, 0, 1,
-2.22975, 0.8564129, 0.02389293, 1, 0.08235294, 0, 1,
-2.228694, -2.575055, -3.083008, 1, 0.09019608, 0, 1,
-2.172966, -0.03418232, -2.636079, 1, 0.09411765, 0, 1,
-2.165497, -0.1224275, 0.8545389, 1, 0.1019608, 0, 1,
-2.104565, -1.309399, -1.401762, 1, 0.1098039, 0, 1,
-2.090733, 1.6786, -1.065769, 1, 0.1137255, 0, 1,
-2.089957, -0.04557823, -2.243837, 1, 0.1215686, 0, 1,
-2.035157, -0.667161, -1.804454, 1, 0.1254902, 0, 1,
-2.006798, 0.379969, -2.638917, 1, 0.1333333, 0, 1,
-1.978668, -0.5455383, -1.446152, 1, 0.1372549, 0, 1,
-1.970602, 0.1533293, -0.5030811, 1, 0.145098, 0, 1,
-1.953681, -0.07351988, -1.263204, 1, 0.1490196, 0, 1,
-1.939636, 0.2612973, -1.698067, 1, 0.1568628, 0, 1,
-1.903239, -1.852101, -3.402439, 1, 0.1607843, 0, 1,
-1.894934, -0.3900401, -1.818509, 1, 0.1686275, 0, 1,
-1.891638, -1.029448, -2.769912, 1, 0.172549, 0, 1,
-1.88193, 0.04179108, -3.677526, 1, 0.1803922, 0, 1,
-1.814505, 1.238418, -2.075486, 1, 0.1843137, 0, 1,
-1.806315, -0.207941, -1.277866, 1, 0.1921569, 0, 1,
-1.789993, -0.5665363, -2.206441, 1, 0.1960784, 0, 1,
-1.786127, 0.3558213, -2.431118, 1, 0.2039216, 0, 1,
-1.773682, -0.8764724, -2.336141, 1, 0.2117647, 0, 1,
-1.754498, -1.011922, -3.193067, 1, 0.2156863, 0, 1,
-1.730268, 0.4300862, -1.513991, 1, 0.2235294, 0, 1,
-1.728667, -0.279474, -3.254095, 1, 0.227451, 0, 1,
-1.724599, 0.2992135, -1.591213, 1, 0.2352941, 0, 1,
-1.697068, -0.5885768, -1.893348, 1, 0.2392157, 0, 1,
-1.696147, -1.090523, -1.131966, 1, 0.2470588, 0, 1,
-1.681131, -0.08921324, -0.6767406, 1, 0.2509804, 0, 1,
-1.663741, -0.6819671, -1.430357, 1, 0.2588235, 0, 1,
-1.63786, -0.04657828, -2.093224, 1, 0.2627451, 0, 1,
-1.627725, 1.107469, 0.2830021, 1, 0.2705882, 0, 1,
-1.626031, -1.106048, -2.729361, 1, 0.2745098, 0, 1,
-1.605544, 0.4141866, -1.877749, 1, 0.282353, 0, 1,
-1.599096, -0.7683803, -1.619211, 1, 0.2862745, 0, 1,
-1.575489, -1.871696, -2.674501, 1, 0.2941177, 0, 1,
-1.567754, -0.506084, -0.9067579, 1, 0.3019608, 0, 1,
-1.552045, 0.1327473, -1.736697, 1, 0.3058824, 0, 1,
-1.551633, 0.7326899, -2.187413, 1, 0.3137255, 0, 1,
-1.531499, -0.7452406, -0.9455933, 1, 0.3176471, 0, 1,
-1.520895, 0.6179135, -1.804609, 1, 0.3254902, 0, 1,
-1.512273, 0.6178108, -1.577255, 1, 0.3294118, 0, 1,
-1.49518, 1.740493, -0.3867758, 1, 0.3372549, 0, 1,
-1.487417, 0.8532319, -1.469368, 1, 0.3411765, 0, 1,
-1.484732, 0.2616564, -2.070995, 1, 0.3490196, 0, 1,
-1.481475, -0.3384019, -1.610474, 1, 0.3529412, 0, 1,
-1.480665, -1.205261, -3.19295, 1, 0.3607843, 0, 1,
-1.470011, 0.5166532, -0.3467501, 1, 0.3647059, 0, 1,
-1.458244, -1.062509, -0.9578166, 1, 0.372549, 0, 1,
-1.456897, 0.4837833, -0.07665216, 1, 0.3764706, 0, 1,
-1.451556, 0.8847736, -1.001503, 1, 0.3843137, 0, 1,
-1.448331, -0.09200641, -3.707615, 1, 0.3882353, 0, 1,
-1.444109, 1.917749, -1.365571, 1, 0.3960784, 0, 1,
-1.442474, -0.7422049, -3.152599, 1, 0.4039216, 0, 1,
-1.440065, -1.533171, -3.447659, 1, 0.4078431, 0, 1,
-1.4307, -2.041727, -3.647504, 1, 0.4156863, 0, 1,
-1.423449, 2.065572, -0.08727446, 1, 0.4196078, 0, 1,
-1.417281, -0.2052464, -2.283753, 1, 0.427451, 0, 1,
-1.405361, -1.605499, -1.069749, 1, 0.4313726, 0, 1,
-1.397794, 0.434037, -1.654848, 1, 0.4392157, 0, 1,
-1.396881, 1.272593, -1.362757, 1, 0.4431373, 0, 1,
-1.388831, 1.430808, -0.9268348, 1, 0.4509804, 0, 1,
-1.383368, 0.4030799, -2.441454, 1, 0.454902, 0, 1,
-1.379699, -1.327644, 0.5950077, 1, 0.4627451, 0, 1,
-1.37905, 0.2317536, -0.2063599, 1, 0.4666667, 0, 1,
-1.378225, -0.6743838, -2.445815, 1, 0.4745098, 0, 1,
-1.375194, -1.112513, -3.889027, 1, 0.4784314, 0, 1,
-1.368048, -2.14601, -1.717332, 1, 0.4862745, 0, 1,
-1.366294, -0.007014642, -0.06732707, 1, 0.4901961, 0, 1,
-1.352798, 0.8792872, -1.71655, 1, 0.4980392, 0, 1,
-1.325931, 1.612142, -0.6190241, 1, 0.5058824, 0, 1,
-1.320694, -0.8106047, -0.08541776, 1, 0.509804, 0, 1,
-1.317954, -0.008720592, -0.9295664, 1, 0.5176471, 0, 1,
-1.306443, -1.305631, -2.593471, 1, 0.5215687, 0, 1,
-1.302878, 0.9235151, 0.9111527, 1, 0.5294118, 0, 1,
-1.302681, -1.502369, -1.802286, 1, 0.5333334, 0, 1,
-1.283894, -0.9709089, -1.401147, 1, 0.5411765, 0, 1,
-1.275362, 0.8940132, -0.01360869, 1, 0.5450981, 0, 1,
-1.267377, -0.2101389, -2.453549, 1, 0.5529412, 0, 1,
-1.246503, 0.2069599, -2.548728, 1, 0.5568628, 0, 1,
-1.242291, 1.56173, -0.4876681, 1, 0.5647059, 0, 1,
-1.235316, 2.449325, -0.9720787, 1, 0.5686275, 0, 1,
-1.231288, -1.430716, -3.022716, 1, 0.5764706, 0, 1,
-1.221462, -2.013842, -0.4365892, 1, 0.5803922, 0, 1,
-1.215212, 2.401115, 0.5294467, 1, 0.5882353, 0, 1,
-1.215162, -0.7783152, -2.632834, 1, 0.5921569, 0, 1,
-1.213323, -0.1348817, -0.3760679, 1, 0.6, 0, 1,
-1.211114, 0.4274795, -0.5703535, 1, 0.6078432, 0, 1,
-1.208838, 0.1807614, -0.2575656, 1, 0.6117647, 0, 1,
-1.207887, -0.1803059, -2.448683, 1, 0.6196079, 0, 1,
-1.199642, 0.7922952, -0.5367814, 1, 0.6235294, 0, 1,
-1.193073, -0.9264078, -2.737602, 1, 0.6313726, 0, 1,
-1.185485, -1.038915, -2.621453, 1, 0.6352941, 0, 1,
-1.184362, 0.02981521, -0.7905828, 1, 0.6431373, 0, 1,
-1.170827, -1.685243, -3.101592, 1, 0.6470588, 0, 1,
-1.16144, -0.7256088, -4.225836, 1, 0.654902, 0, 1,
-1.153532, -0.485724, -1.470368, 1, 0.6588235, 0, 1,
-1.139796, 1.129437, -0.6700709, 1, 0.6666667, 0, 1,
-1.137632, 1.029525, -1.592097, 1, 0.6705883, 0, 1,
-1.135029, -0.8123714, -1.281734, 1, 0.6784314, 0, 1,
-1.130863, -0.1426121, -1.571814, 1, 0.682353, 0, 1,
-1.128636, -0.2670616, -1.571513, 1, 0.6901961, 0, 1,
-1.125926, 1.992613, -2.116235, 1, 0.6941177, 0, 1,
-1.122831, -0.2846687, -0.9539821, 1, 0.7019608, 0, 1,
-1.119827, -0.4340094, -2.473095, 1, 0.7098039, 0, 1,
-1.096377, 0.3452152, -1.133565, 1, 0.7137255, 0, 1,
-1.094313, -1.603604, -0.7019072, 1, 0.7215686, 0, 1,
-1.087013, 1.311813, -1.874409, 1, 0.7254902, 0, 1,
-1.081849, 0.414582, -2.147017, 1, 0.7333333, 0, 1,
-1.080602, -1.559195, -1.311723, 1, 0.7372549, 0, 1,
-1.078482, 0.376461, -0.2416966, 1, 0.7450981, 0, 1,
-1.07049, 0.5168055, -0.9749606, 1, 0.7490196, 0, 1,
-1.062725, 1.224804, -1.061426, 1, 0.7568628, 0, 1,
-1.059905, 1.235565, -0.1005446, 1, 0.7607843, 0, 1,
-1.057194, -1.145332, -1.309373, 1, 0.7686275, 0, 1,
-1.056241, -0.4637205, -2.069648, 1, 0.772549, 0, 1,
-1.052706, 0.5227554, 0.1703499, 1, 0.7803922, 0, 1,
-1.045791, 0.7215632, -1.562933, 1, 0.7843137, 0, 1,
-1.043658, -0.4977388, -3.139143, 1, 0.7921569, 0, 1,
-1.033182, -1.584653, -3.678366, 1, 0.7960784, 0, 1,
-1.026717, 1.211509, 0.5856776, 1, 0.8039216, 0, 1,
-1.021992, -1.525984, -5.788648, 1, 0.8117647, 0, 1,
-1.019614, 1.265377, -0.06257185, 1, 0.8156863, 0, 1,
-1.019382, 0.2320985, 0.8562605, 1, 0.8235294, 0, 1,
-1.007322, -1.658381, -2.760672, 1, 0.827451, 0, 1,
-1.003174, -0.6146871, -1.525491, 1, 0.8352941, 0, 1,
-1.00316, 1.367507, -1.495573, 1, 0.8392157, 0, 1,
-1.003109, -0.5152255, -2.089878, 1, 0.8470588, 0, 1,
-0.9909247, -0.3247105, -0.5522017, 1, 0.8509804, 0, 1,
-0.9905274, 2.209344, -2.149427, 1, 0.8588235, 0, 1,
-0.988764, -0.5272947, -2.617127, 1, 0.8627451, 0, 1,
-0.9867886, -0.1900233, -2.315343, 1, 0.8705882, 0, 1,
-0.9865808, 0.4871659, -0.2079504, 1, 0.8745098, 0, 1,
-0.9824513, -1.863924, -1.319421, 1, 0.8823529, 0, 1,
-0.9777378, 0.6148754, 0.727371, 1, 0.8862745, 0, 1,
-0.9714994, -1.422451, -3.991229, 1, 0.8941177, 0, 1,
-0.9704915, 0.1029196, -0.930865, 1, 0.8980392, 0, 1,
-0.9679489, -0.3561447, -2.617069, 1, 0.9058824, 0, 1,
-0.9625769, 0.5603654, -0.7180827, 1, 0.9137255, 0, 1,
-0.9616846, 0.3528584, -1.497776, 1, 0.9176471, 0, 1,
-0.9605052, 1.456074, -1.767249, 1, 0.9254902, 0, 1,
-0.9588882, 1.315068, -0.8401832, 1, 0.9294118, 0, 1,
-0.9513842, -0.5364747, -1.892934, 1, 0.9372549, 0, 1,
-0.9503283, 1.905384, -0.5030128, 1, 0.9411765, 0, 1,
-0.9440909, -0.01714198, -2.555327, 1, 0.9490196, 0, 1,
-0.9423233, -0.8963435, -0.6337425, 1, 0.9529412, 0, 1,
-0.9386846, -0.5985821, -1.174205, 1, 0.9607843, 0, 1,
-0.9348282, -0.3801775, -2.985004, 1, 0.9647059, 0, 1,
-0.93141, 0.9446712, 0.8624279, 1, 0.972549, 0, 1,
-0.9272959, -1.891039, -1.556715, 1, 0.9764706, 0, 1,
-0.9250574, 0.3883955, -4.178078, 1, 0.9843137, 0, 1,
-0.9237568, -0.1874295, -0.7240379, 1, 0.9882353, 0, 1,
-0.9227602, 0.8509605, -0.9656679, 1, 0.9960784, 0, 1,
-0.918819, -0.1799865, -2.410467, 0.9960784, 1, 0, 1,
-0.916334, -0.8349996, -3.589533, 0.9921569, 1, 0, 1,
-0.9116436, -1.005877, -1.816096, 0.9843137, 1, 0, 1,
-0.9103462, 1.774991, 0.2838035, 0.9803922, 1, 0, 1,
-0.9078187, 0.1665981, -1.073534, 0.972549, 1, 0, 1,
-0.9061747, 1.143649, -0.2604762, 0.9686275, 1, 0, 1,
-0.9020035, -0.3755669, -1.925707, 0.9607843, 1, 0, 1,
-0.8956242, 0.5970297, -0.6028228, 0.9568627, 1, 0, 1,
-0.8914253, -1.753681, -2.718261, 0.9490196, 1, 0, 1,
-0.8893586, -0.3602107, -3.07542, 0.945098, 1, 0, 1,
-0.8863041, 1.117301, -1.342496, 0.9372549, 1, 0, 1,
-0.8824063, 0.1278815, -2.241033, 0.9333333, 1, 0, 1,
-0.8758363, -0.03347785, -0.23214, 0.9254902, 1, 0, 1,
-0.8681442, 0.1774159, -1.012696, 0.9215686, 1, 0, 1,
-0.8677102, 0.2439341, -0.3282401, 0.9137255, 1, 0, 1,
-0.8667004, -1.12321, -1.244074, 0.9098039, 1, 0, 1,
-0.8649824, 0.7115177, 0.1100275, 0.9019608, 1, 0, 1,
-0.864041, -0.4309544, -1.851719, 0.8941177, 1, 0, 1,
-0.8615581, 0.06047158, -1.840041, 0.8901961, 1, 0, 1,
-0.8587453, 1.21658, -0.2285458, 0.8823529, 1, 0, 1,
-0.8558444, -0.3131001, -3.738574, 0.8784314, 1, 0, 1,
-0.8553184, -0.1557571, -1.573887, 0.8705882, 1, 0, 1,
-0.8539817, 0.07216369, -1.806826, 0.8666667, 1, 0, 1,
-0.8519658, -1.0068, -1.365265, 0.8588235, 1, 0, 1,
-0.8497754, 1.23004, -1.58033, 0.854902, 1, 0, 1,
-0.8494056, 0.2456727, -1.11107, 0.8470588, 1, 0, 1,
-0.8459224, -0.3883119, -1.458683, 0.8431373, 1, 0, 1,
-0.8415472, -1.455351, -2.298802, 0.8352941, 1, 0, 1,
-0.8413748, 2.400953, 0.1125867, 0.8313726, 1, 0, 1,
-0.8412811, 1.410761, -0.7606926, 0.8235294, 1, 0, 1,
-0.8366407, 0.06762308, -2.714793, 0.8196079, 1, 0, 1,
-0.8267123, -1.0786, -2.863548, 0.8117647, 1, 0, 1,
-0.8254544, 0.2752166, -2.446183, 0.8078431, 1, 0, 1,
-0.8246695, -1.987767, -1.907684, 0.8, 1, 0, 1,
-0.8204221, 0.4766272, -0.7663139, 0.7921569, 1, 0, 1,
-0.8160544, -2.348811, -3.057896, 0.7882353, 1, 0, 1,
-0.8144453, 0.4452831, -3.186962, 0.7803922, 1, 0, 1,
-0.8142728, 1.437623, 0.1804216, 0.7764706, 1, 0, 1,
-0.8114079, -0.01482259, -1.715312, 0.7686275, 1, 0, 1,
-0.8096437, -0.7707585, -0.5907355, 0.7647059, 1, 0, 1,
-0.8094206, -0.005413706, -2.188901, 0.7568628, 1, 0, 1,
-0.8086722, 1.218182, -2.012651, 0.7529412, 1, 0, 1,
-0.8072585, -0.01140082, -1.262857, 0.7450981, 1, 0, 1,
-0.7968218, 2.293326, -0.5398401, 0.7411765, 1, 0, 1,
-0.7931085, -0.7612159, -2.81403, 0.7333333, 1, 0, 1,
-0.7920369, 1.351352, 0.1065827, 0.7294118, 1, 0, 1,
-0.7895409, 0.7995472, -1.939743, 0.7215686, 1, 0, 1,
-0.7888814, 1.383087, -0.7594641, 0.7176471, 1, 0, 1,
-0.7839549, 0.6952603, -1.433921, 0.7098039, 1, 0, 1,
-0.7801087, 2.327706, -1.624031, 0.7058824, 1, 0, 1,
-0.7780546, 0.1351073, 0.3474607, 0.6980392, 1, 0, 1,
-0.7738953, 0.7708789, -0.4660004, 0.6901961, 1, 0, 1,
-0.7699209, -0.06616037, -2.339919, 0.6862745, 1, 0, 1,
-0.768445, 0.1107709, -1.497792, 0.6784314, 1, 0, 1,
-0.7652246, -1.321874, -3.687794, 0.6745098, 1, 0, 1,
-0.7596073, 1.004198, 0.02301584, 0.6666667, 1, 0, 1,
-0.7571599, -0.5678811, -2.434244, 0.6627451, 1, 0, 1,
-0.7541406, 0.4036277, -0.4964114, 0.654902, 1, 0, 1,
-0.7519658, -0.9485028, -1.982925, 0.6509804, 1, 0, 1,
-0.7304175, 0.2198032, -1.423352, 0.6431373, 1, 0, 1,
-0.7266324, 0.2754264, 0.1683091, 0.6392157, 1, 0, 1,
-0.7262169, -0.08226147, -1.410159, 0.6313726, 1, 0, 1,
-0.7230576, 0.6996133, -0.8091503, 0.627451, 1, 0, 1,
-0.7222067, 1.370297, 0.8034447, 0.6196079, 1, 0, 1,
-0.7219221, -1.725823, -3.484995, 0.6156863, 1, 0, 1,
-0.7182458, -0.1291082, -3.270942, 0.6078432, 1, 0, 1,
-0.7080947, 1.384651, 1.997614, 0.6039216, 1, 0, 1,
-0.7004336, 0.5654361, -2.735602, 0.5960785, 1, 0, 1,
-0.6944162, -2.169897, -3.84666, 0.5882353, 1, 0, 1,
-0.6933892, -0.4511188, -0.2402862, 0.5843138, 1, 0, 1,
-0.6814516, 0.8953225, 0.4181249, 0.5764706, 1, 0, 1,
-0.6761267, 0.3601249, -0.3421803, 0.572549, 1, 0, 1,
-0.6756671, 0.8940495, -1.622397, 0.5647059, 1, 0, 1,
-0.668053, 0.004468756, -1.906713, 0.5607843, 1, 0, 1,
-0.6637703, 0.7953286, 0.2268186, 0.5529412, 1, 0, 1,
-0.6633406, 0.7234868, 0.4753528, 0.5490196, 1, 0, 1,
-0.6574957, 0.03574536, -0.7377399, 0.5411765, 1, 0, 1,
-0.6542348, 0.5472783, -0.2801084, 0.5372549, 1, 0, 1,
-0.6501036, 1.132447, -0.05195182, 0.5294118, 1, 0, 1,
-0.638128, 0.7394599, -1.039003, 0.5254902, 1, 0, 1,
-0.636363, -0.007282464, -0.6393033, 0.5176471, 1, 0, 1,
-0.6282789, -0.6498884, -3.041087, 0.5137255, 1, 0, 1,
-0.6272013, -1.014531, -0.9457715, 0.5058824, 1, 0, 1,
-0.6211021, -0.02476612, -2.490487, 0.5019608, 1, 0, 1,
-0.619735, -2.53849, -3.6914, 0.4941176, 1, 0, 1,
-0.6133989, -1.439127, -2.025011, 0.4862745, 1, 0, 1,
-0.6036741, 1.487109, -0.01999406, 0.4823529, 1, 0, 1,
-0.5866197, 0.378799, 0.007301039, 0.4745098, 1, 0, 1,
-0.5825396, -0.5636176, -3.097223, 0.4705882, 1, 0, 1,
-0.5813897, 0.03727804, -1.033923, 0.4627451, 1, 0, 1,
-0.579608, -0.1923443, -3.699061, 0.4588235, 1, 0, 1,
-0.5730531, -1.462495, -1.093631, 0.4509804, 1, 0, 1,
-0.5710937, -0.4549903, -4.779163, 0.4470588, 1, 0, 1,
-0.56593, 1.540874, 0.163364, 0.4392157, 1, 0, 1,
-0.5591739, 0.0329373, -2.709075, 0.4352941, 1, 0, 1,
-0.5578052, 1.076796, -1.054036, 0.427451, 1, 0, 1,
-0.555784, -0.3043499, -0.9015732, 0.4235294, 1, 0, 1,
-0.5505291, 1.199314, 0.1439527, 0.4156863, 1, 0, 1,
-0.5501553, -0.4030366, -0.6357853, 0.4117647, 1, 0, 1,
-0.5477194, 0.8180744, 1.227519, 0.4039216, 1, 0, 1,
-0.5470118, -0.3611973, -1.968131, 0.3960784, 1, 0, 1,
-0.5469512, 0.2843122, -1.622114, 0.3921569, 1, 0, 1,
-0.5447507, 1.420564, 0.5594015, 0.3843137, 1, 0, 1,
-0.5422869, 0.07362523, -1.993923, 0.3803922, 1, 0, 1,
-0.5416127, 0.9902778, 0.1111125, 0.372549, 1, 0, 1,
-0.5407868, 1.199454, -0.7148764, 0.3686275, 1, 0, 1,
-0.5395133, -1.765277, -2.479908, 0.3607843, 1, 0, 1,
-0.5378601, -1.72972, -1.353639, 0.3568628, 1, 0, 1,
-0.5372526, -0.00596156, 0.1183237, 0.3490196, 1, 0, 1,
-0.5370992, 0.08025179, -1.233603, 0.345098, 1, 0, 1,
-0.53198, 0.3425007, -2.161862, 0.3372549, 1, 0, 1,
-0.5296277, -0.7583012, -2.000239, 0.3333333, 1, 0, 1,
-0.5271501, 0.8505554, -0.7067065, 0.3254902, 1, 0, 1,
-0.5256914, 0.4784817, -0.2860579, 0.3215686, 1, 0, 1,
-0.5247962, 0.395336, 1.138378, 0.3137255, 1, 0, 1,
-0.5239427, -0.240907, -2.238453, 0.3098039, 1, 0, 1,
-0.5233362, 1.020279, -0.02791491, 0.3019608, 1, 0, 1,
-0.5213766, 0.1718546, -1.748226, 0.2941177, 1, 0, 1,
-0.5199039, 1.406673, 0.7207358, 0.2901961, 1, 0, 1,
-0.5182126, -1.63871, -2.506138, 0.282353, 1, 0, 1,
-0.511217, 0.648096, -2.344496, 0.2784314, 1, 0, 1,
-0.5053055, -0.7543718, -1.276791, 0.2705882, 1, 0, 1,
-0.4982597, -0.657398, -2.599109, 0.2666667, 1, 0, 1,
-0.4958055, 2.455671, -0.1373148, 0.2588235, 1, 0, 1,
-0.4930839, 1.410469, -0.7678404, 0.254902, 1, 0, 1,
-0.4888096, 1.763772, -1.191562, 0.2470588, 1, 0, 1,
-0.4883996, 0.2364531, -0.4793404, 0.2431373, 1, 0, 1,
-0.4876037, 1.453367, -1.358959, 0.2352941, 1, 0, 1,
-0.4849904, -0.274593, -3.057059, 0.2313726, 1, 0, 1,
-0.4790944, 2.977824, -1.730094, 0.2235294, 1, 0, 1,
-0.4767483, -0.6646588, -2.927275, 0.2196078, 1, 0, 1,
-0.4766567, 1.857213, 0.333348, 0.2117647, 1, 0, 1,
-0.4748194, -0.3759026, -2.143061, 0.2078431, 1, 0, 1,
-0.4734666, -0.6468403, -1.46725, 0.2, 1, 0, 1,
-0.4694184, 1.230894, -0.1637552, 0.1921569, 1, 0, 1,
-0.4662128, 0.6537429, -1.004382, 0.1882353, 1, 0, 1,
-0.4608856, 0.4334803, -2.185867, 0.1803922, 1, 0, 1,
-0.4606649, 0.5920305, -1.003515, 0.1764706, 1, 0, 1,
-0.4512771, -0.691983, -2.720721, 0.1686275, 1, 0, 1,
-0.450605, 0.5103726, -2.025799, 0.1647059, 1, 0, 1,
-0.4474054, -0.6101956, -3.727071, 0.1568628, 1, 0, 1,
-0.4465798, -0.5620725, -4.591588, 0.1529412, 1, 0, 1,
-0.4458999, -1.326615, -2.565549, 0.145098, 1, 0, 1,
-0.4447769, -0.08494092, -2.910911, 0.1411765, 1, 0, 1,
-0.4391812, -0.1750407, -3.131356, 0.1333333, 1, 0, 1,
-0.4338633, 0.9770825, -0.815858, 0.1294118, 1, 0, 1,
-0.4323899, 1.73687, -0.4916254, 0.1215686, 1, 0, 1,
-0.4308873, -0.1007432, -3.769769, 0.1176471, 1, 0, 1,
-0.427223, -0.08060578, -2.98073, 0.1098039, 1, 0, 1,
-0.4261054, 0.5025792, -2.896041, 0.1058824, 1, 0, 1,
-0.4250525, -1.308326, -2.196234, 0.09803922, 1, 0, 1,
-0.4239702, -0.6313647, -4.026995, 0.09019608, 1, 0, 1,
-0.4235596, -0.1916516, -1.278119, 0.08627451, 1, 0, 1,
-0.4185891, 0.6926554, -1.599594, 0.07843138, 1, 0, 1,
-0.4185207, 0.1262252, -0.992951, 0.07450981, 1, 0, 1,
-0.4130556, 0.07292635, -2.540567, 0.06666667, 1, 0, 1,
-0.4103131, -0.7776271, -0.2349487, 0.0627451, 1, 0, 1,
-0.4057095, -0.003644324, -0.1742211, 0.05490196, 1, 0, 1,
-0.4048783, 1.141523, -0.190214, 0.05098039, 1, 0, 1,
-0.4036061, 0.7691726, 1.05011, 0.04313726, 1, 0, 1,
-0.4031064, -2.111073, -0.04474929, 0.03921569, 1, 0, 1,
-0.4016505, -0.9891816, -3.188565, 0.03137255, 1, 0, 1,
-0.4001772, 1.527523, 0.9570491, 0.02745098, 1, 0, 1,
-0.3995252, -0.1601543, -2.829903, 0.01960784, 1, 0, 1,
-0.3977192, -0.5195819, -1.796825, 0.01568628, 1, 0, 1,
-0.3940407, 0.5869693, 0.8017373, 0.007843138, 1, 0, 1,
-0.3906043, -0.7935231, -2.303898, 0.003921569, 1, 0, 1,
-0.3904236, -0.8143262, -2.882619, 0, 1, 0.003921569, 1,
-0.383799, 1.680794, -1.260679, 0, 1, 0.01176471, 1,
-0.3837634, 0.197004, -0.6308758, 0, 1, 0.01568628, 1,
-0.3819968, -1.056141, -1.126239, 0, 1, 0.02352941, 1,
-0.3819742, -2.574835, -2.21611, 0, 1, 0.02745098, 1,
-0.3802251, 0.3669602, -0.318884, 0, 1, 0.03529412, 1,
-0.3706757, 0.121809, -0.3238193, 0, 1, 0.03921569, 1,
-0.3691168, -1.09954, -3.311631, 0, 1, 0.04705882, 1,
-0.3616682, 1.285184, -0.4038092, 0, 1, 0.05098039, 1,
-0.3572995, -0.03732595, -1.584353, 0, 1, 0.05882353, 1,
-0.3564644, -1.889769, -2.849306, 0, 1, 0.0627451, 1,
-0.3561894, -1.292713, -3.964092, 0, 1, 0.07058824, 1,
-0.3558286, -0.601085, -2.065269, 0, 1, 0.07450981, 1,
-0.35182, -0.03072947, -1.087971, 0, 1, 0.08235294, 1,
-0.350777, 1.73664, 1.636357, 0, 1, 0.08627451, 1,
-0.3463465, -0.2793344, -0.7249009, 0, 1, 0.09411765, 1,
-0.3413547, -3.420161, -2.048879, 0, 1, 0.1019608, 1,
-0.3393803, 0.4013741, -1.438396, 0, 1, 0.1058824, 1,
-0.3315113, 0.4257785, -0.298186, 0, 1, 0.1137255, 1,
-0.3313525, 0.05135468, 0.136435, 0, 1, 0.1176471, 1,
-0.3304517, 1.540205, -0.6300568, 0, 1, 0.1254902, 1,
-0.330301, -0.7288067, 0.251737, 0, 1, 0.1294118, 1,
-0.3283445, -1.431273, -3.0234, 0, 1, 0.1372549, 1,
-0.3267516, -1.627584, -2.46827, 0, 1, 0.1411765, 1,
-0.3262141, 0.02636846, -0.4292935, 0, 1, 0.1490196, 1,
-0.3250179, -1.956658, -3.395785, 0, 1, 0.1529412, 1,
-0.323848, -0.6450573, -3.841564, 0, 1, 0.1607843, 1,
-0.3218458, -0.3905894, -2.019943, 0, 1, 0.1647059, 1,
-0.3209412, 0.7192244, -1.026107, 0, 1, 0.172549, 1,
-0.3159989, -1.605562, -3.529326, 0, 1, 0.1764706, 1,
-0.3149346, -0.2530148, -1.969659, 0, 1, 0.1843137, 1,
-0.3117562, -0.6029935, -2.808088, 0, 1, 0.1882353, 1,
-0.307314, 0.6985818, -0.4835869, 0, 1, 0.1960784, 1,
-0.3070846, -0.1855017, -2.867461, 0, 1, 0.2039216, 1,
-0.2976123, 0.6053248, -1.46074, 0, 1, 0.2078431, 1,
-0.2949989, 1.280993, -0.6042338, 0, 1, 0.2156863, 1,
-0.2914175, 0.9099166, -0.7104063, 0, 1, 0.2196078, 1,
-0.2891908, -0.3502109, -1.956686, 0, 1, 0.227451, 1,
-0.2867447, -0.1517554, -2.121808, 0, 1, 0.2313726, 1,
-0.2825956, -0.2966588, -1.839012, 0, 1, 0.2392157, 1,
-0.2789331, -0.7249862, -3.496247, 0, 1, 0.2431373, 1,
-0.2787446, 1.345298, 0.1189391, 0, 1, 0.2509804, 1,
-0.2783076, 0.4489584, -0.07417745, 0, 1, 0.254902, 1,
-0.2728612, -0.8640543, -2.217468, 0, 1, 0.2627451, 1,
-0.268749, 1.021972, 0.9325974, 0, 1, 0.2666667, 1,
-0.2645523, 0.4278559, 1.327552, 0, 1, 0.2745098, 1,
-0.260897, 0.1420735, 0.08399958, 0, 1, 0.2784314, 1,
-0.2584635, 1.441372, 0.6870033, 0, 1, 0.2862745, 1,
-0.2543107, -0.6607247, -2.854832, 0, 1, 0.2901961, 1,
-0.2522305, 0.2023802, -1.836001, 0, 1, 0.2980392, 1,
-0.246899, -0.2317087, -3.116544, 0, 1, 0.3058824, 1,
-0.2434603, 0.7251567, 0.2845808, 0, 1, 0.3098039, 1,
-0.2431266, -2.121449, -2.755116, 0, 1, 0.3176471, 1,
-0.2346039, -0.6330565, -2.095186, 0, 1, 0.3215686, 1,
-0.233109, -0.1077693, -2.261841, 0, 1, 0.3294118, 1,
-0.2303994, -0.25883, -4.269651, 0, 1, 0.3333333, 1,
-0.2300927, -1.893105, -4.766239, 0, 1, 0.3411765, 1,
-0.2264979, 1.147066, -0.7002439, 0, 1, 0.345098, 1,
-0.2224001, -1.067539, -2.530803, 0, 1, 0.3529412, 1,
-0.2221172, 0.5154476, -1.973782, 0, 1, 0.3568628, 1,
-0.2156598, -0.4807814, -3.491786, 0, 1, 0.3647059, 1,
-0.2129849, -0.4903091, -3.579211, 0, 1, 0.3686275, 1,
-0.2060463, 1.535578, -2.074046, 0, 1, 0.3764706, 1,
-0.2059429, 1.775897, 0.7662316, 0, 1, 0.3803922, 1,
-0.205324, -0.4141161, -0.6715346, 0, 1, 0.3882353, 1,
-0.1967024, 0.509524, -0.5816529, 0, 1, 0.3921569, 1,
-0.1957542, 0.2069445, -1.839279, 0, 1, 0.4, 1,
-0.1927368, 1.241399, -0.5874454, 0, 1, 0.4078431, 1,
-0.1881258, 0.1896212, -0.5378906, 0, 1, 0.4117647, 1,
-0.175527, -0.9073271, -4.863917, 0, 1, 0.4196078, 1,
-0.1731364, 0.8379014, 0.5518542, 0, 1, 0.4235294, 1,
-0.1717281, -0.1732427, -1.796201, 0, 1, 0.4313726, 1,
-0.1711525, -0.6419025, -2.602777, 0, 1, 0.4352941, 1,
-0.1656692, -0.7528965, -1.703897, 0, 1, 0.4431373, 1,
-0.1632035, 0.5152917, -1.142972, 0, 1, 0.4470588, 1,
-0.1591539, -1.409873, -2.660785, 0, 1, 0.454902, 1,
-0.1574942, 0.8395094, 0.4828112, 0, 1, 0.4588235, 1,
-0.1567491, -0.0591561, -2.067587, 0, 1, 0.4666667, 1,
-0.1551286, -0.4988546, -4.494714, 0, 1, 0.4705882, 1,
-0.1547115, -0.4765056, -2.254524, 0, 1, 0.4784314, 1,
-0.1540903, 0.1313189, -0.5174781, 0, 1, 0.4823529, 1,
-0.1494082, 0.5923346, 0.06338148, 0, 1, 0.4901961, 1,
-0.1461481, -0.4147763, -2.001915, 0, 1, 0.4941176, 1,
-0.1350219, 0.2445536, -1.56875, 0, 1, 0.5019608, 1,
-0.1343875, 1.364878, 0.7171424, 0, 1, 0.509804, 1,
-0.1300979, 0.6750681, 1.048814, 0, 1, 0.5137255, 1,
-0.1271675, -1.851261, -1.820293, 0, 1, 0.5215687, 1,
-0.1248469, -0.3571265, -2.888082, 0, 1, 0.5254902, 1,
-0.1243345, 1.035378, -1.034567, 0, 1, 0.5333334, 1,
-0.1238532, -0.6368273, -2.94042, 0, 1, 0.5372549, 1,
-0.1230634, 1.077166, 0.364815, 0, 1, 0.5450981, 1,
-0.122883, 0.2384353, -0.4428616, 0, 1, 0.5490196, 1,
-0.1228565, 0.3710403, -0.4190712, 0, 1, 0.5568628, 1,
-0.1226335, -1.865263, -3.634983, 0, 1, 0.5607843, 1,
-0.1205984, -0.9546694, -3.915061, 0, 1, 0.5686275, 1,
-0.1185718, 0.4845264, -0.4012904, 0, 1, 0.572549, 1,
-0.1170889, -0.2306815, -2.526415, 0, 1, 0.5803922, 1,
-0.09769023, 1.210763, -1.496984, 0, 1, 0.5843138, 1,
-0.09691424, 0.03189268, -1.746194, 0, 1, 0.5921569, 1,
-0.09687106, -0.5540026, -3.138509, 0, 1, 0.5960785, 1,
-0.08416992, 0.6109751, -1.635515, 0, 1, 0.6039216, 1,
-0.08173162, 0.4335408, 2.4097, 0, 1, 0.6117647, 1,
-0.08066141, 1.209661, -0.8554737, 0, 1, 0.6156863, 1,
-0.07954551, -0.7238113, -2.821827, 0, 1, 0.6235294, 1,
-0.07442797, -0.4658218, -4.535791, 0, 1, 0.627451, 1,
-0.07374015, 0.993654, 0.5615255, 0, 1, 0.6352941, 1,
-0.07195549, 0.7487909, 0.4208438, 0, 1, 0.6392157, 1,
-0.07170277, -0.4507827, -2.062605, 0, 1, 0.6470588, 1,
-0.07157603, -0.9124852, -2.818965, 0, 1, 0.6509804, 1,
-0.07078362, -1.338473, -2.531968, 0, 1, 0.6588235, 1,
-0.06909622, 0.7679385, -0.9025552, 0, 1, 0.6627451, 1,
-0.06646565, 0.5411649, 0.5376523, 0, 1, 0.6705883, 1,
-0.06606881, 1.439582, -0.4634967, 0, 1, 0.6745098, 1,
-0.06099613, -0.2495898, -0.9722634, 0, 1, 0.682353, 1,
-0.05947419, -0.2149193, -2.918921, 0, 1, 0.6862745, 1,
-0.05920582, -0.1971131, -4.307072, 0, 1, 0.6941177, 1,
-0.05353012, -1.313817, -3.582444, 0, 1, 0.7019608, 1,
-0.05029392, -0.2584967, -3.518752, 0, 1, 0.7058824, 1,
-0.05001843, -1.276981, -2.366491, 0, 1, 0.7137255, 1,
-0.0472339, -0.9947066, -2.784431, 0, 1, 0.7176471, 1,
-0.04392618, -0.2322389, -4.309484, 0, 1, 0.7254902, 1,
-0.04215432, -1.069699, -2.389502, 0, 1, 0.7294118, 1,
-0.04209518, 2.019506, -0.1045628, 0, 1, 0.7372549, 1,
-0.03987534, -0.1788654, -2.276656, 0, 1, 0.7411765, 1,
-0.03955764, 0.6794228, 0.7422716, 0, 1, 0.7490196, 1,
-0.02757628, -0.3147136, -1.894549, 0, 1, 0.7529412, 1,
-0.02657475, 0.1778264, 0.2932025, 0, 1, 0.7607843, 1,
-0.02654099, -0.3444739, -3.244559, 0, 1, 0.7647059, 1,
-0.02458339, -0.6886296, -4.375187, 0, 1, 0.772549, 1,
-0.02113641, 0.7664514, -1.086522, 0, 1, 0.7764706, 1,
-0.02081075, 0.3123056, 0.2594053, 0, 1, 0.7843137, 1,
-0.01759822, 1.34183, 2.340586, 0, 1, 0.7882353, 1,
-0.01457987, -1.003043, -4.558868, 0, 1, 0.7960784, 1,
-0.01457641, 1.259471, -0.1889368, 0, 1, 0.8039216, 1,
-0.01446747, -0.6874764, -4.651808, 0, 1, 0.8078431, 1,
-0.01257356, 0.2537055, 0.2214353, 0, 1, 0.8156863, 1,
-0.01178155, -0.1114129, -3.266051, 0, 1, 0.8196079, 1,
-0.01098875, 0.8312491, 0.1941587, 0, 1, 0.827451, 1,
-0.008643676, 1.349995, 1.151573, 0, 1, 0.8313726, 1,
-0.00459678, -0.3995599, -4.038253, 0, 1, 0.8392157, 1,
-0.003850372, 0.03280153, 0.422828, 0, 1, 0.8431373, 1,
-0.002868498, -1.42521, -3.465614, 0, 1, 0.8509804, 1,
-0.002185169, 0.4779375, -0.3080631, 0, 1, 0.854902, 1,
0.00146879, 1.066368, -1.042583, 0, 1, 0.8627451, 1,
0.004453924, -0.1189705, 3.197764, 0, 1, 0.8666667, 1,
0.005526899, -1.692793, 2.248817, 0, 1, 0.8745098, 1,
0.01847254, -1.742408, 4.416546, 0, 1, 0.8784314, 1,
0.0206747, 0.1116206, 0.666176, 0, 1, 0.8862745, 1,
0.02358488, 1.152844, -1.195615, 0, 1, 0.8901961, 1,
0.0295413, -1.481174, 4.506377, 0, 1, 0.8980392, 1,
0.03159904, 0.7425234, -0.4170108, 0, 1, 0.9058824, 1,
0.03432281, -0.8075806, 2.632937, 0, 1, 0.9098039, 1,
0.0516856, 0.2314644, -0.4537466, 0, 1, 0.9176471, 1,
0.05183234, -0.09459104, 1.238077, 0, 1, 0.9215686, 1,
0.05574776, -2.019941, 3.130471, 0, 1, 0.9294118, 1,
0.05627135, 0.8904448, -0.7694443, 0, 1, 0.9333333, 1,
0.05656254, -0.1634822, 4.070106, 0, 1, 0.9411765, 1,
0.05765774, 0.06831709, -1.10955, 0, 1, 0.945098, 1,
0.06623904, 0.01073322, 3.021, 0, 1, 0.9529412, 1,
0.06992137, -0.1679321, 2.322382, 0, 1, 0.9568627, 1,
0.07163948, 0.08442863, 0.4322454, 0, 1, 0.9647059, 1,
0.07248966, -0.5979429, 4.73165, 0, 1, 0.9686275, 1,
0.07707409, 1.245279, -0.5512007, 0, 1, 0.9764706, 1,
0.07725041, 0.4199446, 1.242478, 0, 1, 0.9803922, 1,
0.07992882, -0.2112971, 3.222981, 0, 1, 0.9882353, 1,
0.0805655, 1.437269, -1.931553, 0, 1, 0.9921569, 1,
0.08697607, 1.721047, 0.630247, 0, 1, 1, 1,
0.09472068, -1.284247, 3.397859, 0, 0.9921569, 1, 1,
0.09504897, -0.957564, 4.050476, 0, 0.9882353, 1, 1,
0.09627488, 0.5835958, 0.6614798, 0, 0.9803922, 1, 1,
0.1002646, -1.147456, 1.978171, 0, 0.9764706, 1, 1,
0.1015888, 0.06473044, 3.211637, 0, 0.9686275, 1, 1,
0.1065906, 1.328173, -0.072785, 0, 0.9647059, 1, 1,
0.1074279, 1.388696, -1.746151, 0, 0.9568627, 1, 1,
0.1116308, -0.77828, 2.546683, 0, 0.9529412, 1, 1,
0.1122262, 0.3403658, 1.817514, 0, 0.945098, 1, 1,
0.1139641, -1.530403, 3.742096, 0, 0.9411765, 1, 1,
0.1147564, -0.2308363, 3.186034, 0, 0.9333333, 1, 1,
0.1164042, 0.3793753, 0.7571867, 0, 0.9294118, 1, 1,
0.1175152, -0.2932359, 2.944216, 0, 0.9215686, 1, 1,
0.1182975, -0.2057061, 2.625073, 0, 0.9176471, 1, 1,
0.1225749, -0.5100414, 3.423866, 0, 0.9098039, 1, 1,
0.1273093, -0.1000807, 3.506435, 0, 0.9058824, 1, 1,
0.133694, 0.4556718, 0.4531589, 0, 0.8980392, 1, 1,
0.1365833, -1.414786, 4.322722, 0, 0.8901961, 1, 1,
0.138305, 2.254789, -0.1167882, 0, 0.8862745, 1, 1,
0.1387861, -2.016553, 4.885787, 0, 0.8784314, 1, 1,
0.1392261, -0.3165944, 2.247412, 0, 0.8745098, 1, 1,
0.1445726, 0.5638003, 0.8766236, 0, 0.8666667, 1, 1,
0.1527628, -1.449255, 3.515642, 0, 0.8627451, 1, 1,
0.157382, 1.185444, 1.299879, 0, 0.854902, 1, 1,
0.157468, -0.6873122, 2.677528, 0, 0.8509804, 1, 1,
0.1618087, -0.04276188, 0.03759366, 0, 0.8431373, 1, 1,
0.1641168, -0.7186973, 3.313978, 0, 0.8392157, 1, 1,
0.1669742, -1.245486, 2.194367, 0, 0.8313726, 1, 1,
0.1723026, -0.7363998, 3.162427, 0, 0.827451, 1, 1,
0.1735524, 0.6845529, -0.2539272, 0, 0.8196079, 1, 1,
0.1756154, 0.5979094, 1.570883, 0, 0.8156863, 1, 1,
0.1756428, -2.16898, 4.061141, 0, 0.8078431, 1, 1,
0.1808896, -1.412153, 3.114879, 0, 0.8039216, 1, 1,
0.1841677, 0.6656854, 0.5488724, 0, 0.7960784, 1, 1,
0.1842896, -1.779612, 2.701267, 0, 0.7882353, 1, 1,
0.1881678, 1.914468, -0.4755484, 0, 0.7843137, 1, 1,
0.1936926, -0.02401173, 0.9408913, 0, 0.7764706, 1, 1,
0.2140439, -0.03976332, 2.272888, 0, 0.772549, 1, 1,
0.2145001, -0.2156247, 1.631118, 0, 0.7647059, 1, 1,
0.214982, 0.01659922, -0.3196104, 0, 0.7607843, 1, 1,
0.2169029, -0.07016177, 1.802141, 0, 0.7529412, 1, 1,
0.2184573, 0.6433545, -0.2069588, 0, 0.7490196, 1, 1,
0.2241539, 0.582392, 1.350311, 0, 0.7411765, 1, 1,
0.224191, 0.8348313, 0.5470858, 0, 0.7372549, 1, 1,
0.2287059, -0.4003243, 1.816675, 0, 0.7294118, 1, 1,
0.231104, 0.1539263, -0.4982539, 0, 0.7254902, 1, 1,
0.2332215, 0.3178336, 3.178586, 0, 0.7176471, 1, 1,
0.2363597, -2.197198, 3.070734, 0, 0.7137255, 1, 1,
0.2364064, 0.9816651, 0.5795919, 0, 0.7058824, 1, 1,
0.2375282, 0.9528034, -1.484937, 0, 0.6980392, 1, 1,
0.2375668, -0.519365, 3.445548, 0, 0.6941177, 1, 1,
0.2402915, 2.374978, 1.299188, 0, 0.6862745, 1, 1,
0.2412046, -0.7022588, 5.42879, 0, 0.682353, 1, 1,
0.2422778, 1.349951, -1.088497, 0, 0.6745098, 1, 1,
0.2436651, -0.6219854, 3.70681, 0, 0.6705883, 1, 1,
0.2536629, -1.286705, 4.029244, 0, 0.6627451, 1, 1,
0.2563924, 1.096498, -1.038413, 0, 0.6588235, 1, 1,
0.2585928, 0.648855, -0.7841279, 0, 0.6509804, 1, 1,
0.2624741, 1.939156, -1.127601, 0, 0.6470588, 1, 1,
0.2637002, 2.142682, -0.139726, 0, 0.6392157, 1, 1,
0.26651, -0.7744102, 0.9098497, 0, 0.6352941, 1, 1,
0.2712363, -0.7251768, 2.617815, 0, 0.627451, 1, 1,
0.2715414, -0.7869035, 1.960493, 0, 0.6235294, 1, 1,
0.2718704, -1.53331, 2.639249, 0, 0.6156863, 1, 1,
0.2724092, -1.31986, 2.432937, 0, 0.6117647, 1, 1,
0.2748898, 0.8514, -0.5744244, 0, 0.6039216, 1, 1,
0.2750626, -0.9959164, 2.715027, 0, 0.5960785, 1, 1,
0.2760068, 0.006401473, 0.548324, 0, 0.5921569, 1, 1,
0.2773996, -0.6029298, 2.28168, 0, 0.5843138, 1, 1,
0.2845666, 1.764532, -1.987348, 0, 0.5803922, 1, 1,
0.2869574, 1.060477, -1.37536, 0, 0.572549, 1, 1,
0.2960736, -1.252873, 3.074436, 0, 0.5686275, 1, 1,
0.296542, -2.07076, 3.621963, 0, 0.5607843, 1, 1,
0.2990557, -0.6617306, 3.611145, 0, 0.5568628, 1, 1,
0.2999441, 0.0249084, 2.200124, 0, 0.5490196, 1, 1,
0.307743, -0.8662181, 2.132532, 0, 0.5450981, 1, 1,
0.313031, -1.14622, 1.923062, 0, 0.5372549, 1, 1,
0.3154294, -0.5795243, 4.132065, 0, 0.5333334, 1, 1,
0.3156126, 0.6213436, 1.994137, 0, 0.5254902, 1, 1,
0.3158042, 0.4774733, 0.2659099, 0, 0.5215687, 1, 1,
0.3159647, -1.445662, 2.867303, 0, 0.5137255, 1, 1,
0.3196467, 0.09322168, 1.121446, 0, 0.509804, 1, 1,
0.3200434, 0.9301703, -1.191209, 0, 0.5019608, 1, 1,
0.3200729, -0.8625872, 3.355751, 0, 0.4941176, 1, 1,
0.3365486, 0.1060888, 1.331607, 0, 0.4901961, 1, 1,
0.3367409, -1.622055, 2.338486, 0, 0.4823529, 1, 1,
0.3372452, -0.8084462, 4.375251, 0, 0.4784314, 1, 1,
0.3377711, 0.5353894, -0.1875822, 0, 0.4705882, 1, 1,
0.3401685, -0.1260286, 2.409679, 0, 0.4666667, 1, 1,
0.3402832, 0.9326574, -0.8495343, 0, 0.4588235, 1, 1,
0.3414549, -0.8068888, 3.040319, 0, 0.454902, 1, 1,
0.3436053, 0.4974893, 1.781067, 0, 0.4470588, 1, 1,
0.3501646, -0.9878606, 4.975492, 0, 0.4431373, 1, 1,
0.3506949, -1.01566, 2.929521, 0, 0.4352941, 1, 1,
0.3562232, -1.777531, 1.446386, 0, 0.4313726, 1, 1,
0.3570264, 1.110355, -0.6776236, 0, 0.4235294, 1, 1,
0.3570517, -0.5938798, 1.451255, 0, 0.4196078, 1, 1,
0.3570757, 1.765098, -0.2997123, 0, 0.4117647, 1, 1,
0.3591227, 2.401284, 0.9592661, 0, 0.4078431, 1, 1,
0.3668032, 0.1209111, 0.3232161, 0, 0.4, 1, 1,
0.3726238, 0.6749741, -1.763904, 0, 0.3921569, 1, 1,
0.3740237, 1.548308, 1.02704, 0, 0.3882353, 1, 1,
0.3750377, 0.1848116, 0.7941782, 0, 0.3803922, 1, 1,
0.376258, 0.6348994, 1.31375, 0, 0.3764706, 1, 1,
0.3793858, -0.1308041, 2.399384, 0, 0.3686275, 1, 1,
0.3794061, -0.6219069, 1.036356, 0, 0.3647059, 1, 1,
0.3817918, -1.054989, 3.11956, 0, 0.3568628, 1, 1,
0.3842165, 0.8091234, -0.314238, 0, 0.3529412, 1, 1,
0.3848656, 1.272187, 1.921433, 0, 0.345098, 1, 1,
0.3879628, 0.8373635, -0.240698, 0, 0.3411765, 1, 1,
0.3896603, -1.037619, 1.827466, 0, 0.3333333, 1, 1,
0.3953097, 0.0460182, 1.070663, 0, 0.3294118, 1, 1,
0.3967171, -0.8220056, 2.65102, 0, 0.3215686, 1, 1,
0.3994859, -0.4877743, 2.759519, 0, 0.3176471, 1, 1,
0.3996016, -0.226344, 2.542321, 0, 0.3098039, 1, 1,
0.4013882, -0.7622113, 2.54026, 0, 0.3058824, 1, 1,
0.4055382, -1.591392, 2.92211, 0, 0.2980392, 1, 1,
0.4055825, -0.6732488, 3.395931, 0, 0.2901961, 1, 1,
0.4136255, 1.162503, 0.1365394, 0, 0.2862745, 1, 1,
0.41989, 0.09171697, 0.8482004, 0, 0.2784314, 1, 1,
0.4226821, 0.5477707, 0.8956271, 0, 0.2745098, 1, 1,
0.4321221, -0.2339092, 1.376368, 0, 0.2666667, 1, 1,
0.4331746, -0.003266836, 2.550765, 0, 0.2627451, 1, 1,
0.4341726, 0.4281942, 1.424727, 0, 0.254902, 1, 1,
0.4347514, 0.293665, 1.290444, 0, 0.2509804, 1, 1,
0.4357983, 1.444985, 0.1919992, 0, 0.2431373, 1, 1,
0.4427876, 1.73742, -0.1339139, 0, 0.2392157, 1, 1,
0.4430602, -0.5603949, 2.662442, 0, 0.2313726, 1, 1,
0.4483162, -0.7866908, 1.840055, 0, 0.227451, 1, 1,
0.4531806, 0.900175, 1.476951, 0, 0.2196078, 1, 1,
0.4546563, -0.3321847, 3.22675, 0, 0.2156863, 1, 1,
0.4587862, 0.1238111, 0.9046098, 0, 0.2078431, 1, 1,
0.4610555, -1.346031, 1.93287, 0, 0.2039216, 1, 1,
0.465187, 1.526327, 1.920601, 0, 0.1960784, 1, 1,
0.4671799, -0.6839157, 2.730518, 0, 0.1882353, 1, 1,
0.4687574, -2.326683, 4.4533, 0, 0.1843137, 1, 1,
0.4714402, 0.09612289, 4.48623, 0, 0.1764706, 1, 1,
0.4715471, -0.8131095, 2.107552, 0, 0.172549, 1, 1,
0.4744522, 0.6928613, 1.499235, 0, 0.1647059, 1, 1,
0.4758327, 0.9112402, -0.1182703, 0, 0.1607843, 1, 1,
0.4795367, 0.2722114, 0.9690695, 0, 0.1529412, 1, 1,
0.4797772, 1.251355, -0.05499891, 0, 0.1490196, 1, 1,
0.4823919, -0.6617185, 2.186392, 0, 0.1411765, 1, 1,
0.4838243, 0.8458045, 0.03919877, 0, 0.1372549, 1, 1,
0.4855239, 0.6221729, -0.1685754, 0, 0.1294118, 1, 1,
0.4875238, 1.535982, 0.7454153, 0, 0.1254902, 1, 1,
0.4895227, 0.2469349, 1.04861, 0, 0.1176471, 1, 1,
0.4925384, 1.079191, -0.6372736, 0, 0.1137255, 1, 1,
0.4936689, -1.53748, 1.869611, 0, 0.1058824, 1, 1,
0.4938266, 0.7903004, 1.907247, 0, 0.09803922, 1, 1,
0.4946536, -1.20444, 2.080202, 0, 0.09411765, 1, 1,
0.4971578, 0.7385952, 0.5283133, 0, 0.08627451, 1, 1,
0.5005937, 0.7654562, 2.438937, 0, 0.08235294, 1, 1,
0.5017504, 0.9204873, 2.06399, 0, 0.07450981, 1, 1,
0.5037963, 0.09091647, 0.6974657, 0, 0.07058824, 1, 1,
0.5046034, -0.516684, 1.635058, 0, 0.0627451, 1, 1,
0.5060534, 2.863632, 0.5877407, 0, 0.05882353, 1, 1,
0.5063214, -0.3016011, 3.328994, 0, 0.05098039, 1, 1,
0.5091634, 0.7565699, 3.36555, 0, 0.04705882, 1, 1,
0.5122872, 0.2136717, 1.863326, 0, 0.03921569, 1, 1,
0.5126008, -0.6457247, 1.867396, 0, 0.03529412, 1, 1,
0.5138146, -2.168241, 2.468508, 0, 0.02745098, 1, 1,
0.5169611, 0.01592707, 1.905544, 0, 0.02352941, 1, 1,
0.5178145, 0.512886, -1.049234, 0, 0.01568628, 1, 1,
0.5183983, 0.7311108, 1.614112, 0, 0.01176471, 1, 1,
0.5257134, -0.7749628, 3.892773, 0, 0.003921569, 1, 1,
0.5302643, 1.098361, 1.750918, 0.003921569, 0, 1, 1,
0.5362241, 0.4397054, 0.09260843, 0.007843138, 0, 1, 1,
0.5368534, -0.5534509, 3.105791, 0.01568628, 0, 1, 1,
0.5391822, -1.715839, 3.026089, 0.01960784, 0, 1, 1,
0.5446072, -1.259184, 2.791749, 0.02745098, 0, 1, 1,
0.5452148, 0.5084479, -0.8225518, 0.03137255, 0, 1, 1,
0.5454547, 1.594472, -0.1426745, 0.03921569, 0, 1, 1,
0.5463559, 0.1335992, 0.7989316, 0.04313726, 0, 1, 1,
0.5487214, -2.060323, 2.592305, 0.05098039, 0, 1, 1,
0.5498185, 0.446586, 0.4157213, 0.05490196, 0, 1, 1,
0.5532126, -0.3775282, 1.90638, 0.0627451, 0, 1, 1,
0.5538786, -0.1930795, 1.072402, 0.06666667, 0, 1, 1,
0.5561011, 1.137776, -0.9741995, 0.07450981, 0, 1, 1,
0.557944, -1.262523, 0.7534921, 0.07843138, 0, 1, 1,
0.5582268, 0.1000703, 2.122945, 0.08627451, 0, 1, 1,
0.567231, 1.26323, 1.196804, 0.09019608, 0, 1, 1,
0.575933, 0.9172959, 1.162963, 0.09803922, 0, 1, 1,
0.5812192, 0.01325306, 2.129233, 0.1058824, 0, 1, 1,
0.5850081, 0.1890747, 1.579733, 0.1098039, 0, 1, 1,
0.5909621, -0.2040434, 0.502515, 0.1176471, 0, 1, 1,
0.5938675, -1.51234, 1.334592, 0.1215686, 0, 1, 1,
0.6026603, -0.5814736, 3.520516, 0.1294118, 0, 1, 1,
0.6033549, -0.4119636, 1.988559, 0.1333333, 0, 1, 1,
0.604285, -0.677977, 1.607367, 0.1411765, 0, 1, 1,
0.6109171, 1.432826, -0.2936082, 0.145098, 0, 1, 1,
0.6205318, 0.3022206, 0.7862489, 0.1529412, 0, 1, 1,
0.6301148, -1.110041, 3.058049, 0.1568628, 0, 1, 1,
0.6303315, 0.8084264, 1.581364, 0.1647059, 0, 1, 1,
0.6312466, -1.350275, 3.162333, 0.1686275, 0, 1, 1,
0.6328728, -0.6761417, 3.18823, 0.1764706, 0, 1, 1,
0.6336536, 1.523276, 0.88361, 0.1803922, 0, 1, 1,
0.6355774, -0.1088346, 2.215927, 0.1882353, 0, 1, 1,
0.640874, -0.8746105, 1.713577, 0.1921569, 0, 1, 1,
0.6425272, 1.840556, 0.539949, 0.2, 0, 1, 1,
0.6445891, 0.05599121, 0.6735626, 0.2078431, 0, 1, 1,
0.6446806, -0.4484167, 2.535533, 0.2117647, 0, 1, 1,
0.6452014, -0.2874108, 1.422708, 0.2196078, 0, 1, 1,
0.6481753, 0.018652, 2.490617, 0.2235294, 0, 1, 1,
0.6521423, -0.1819912, 1.838838, 0.2313726, 0, 1, 1,
0.6535907, -0.249525, 3.673428, 0.2352941, 0, 1, 1,
0.6552896, 0.1896344, 2.749776, 0.2431373, 0, 1, 1,
0.6610105, -0.1076726, 2.022012, 0.2470588, 0, 1, 1,
0.6657068, -1.360325, 2.385027, 0.254902, 0, 1, 1,
0.6721575, -0.7629508, 1.938673, 0.2588235, 0, 1, 1,
0.6739339, -0.5138928, 3.595924, 0.2666667, 0, 1, 1,
0.678043, -0.08326107, 2.73867, 0.2705882, 0, 1, 1,
0.6792232, -2.056727, 2.917492, 0.2784314, 0, 1, 1,
0.6792453, 0.7787127, 1.970732, 0.282353, 0, 1, 1,
0.6794357, 0.3223528, 1.738313, 0.2901961, 0, 1, 1,
0.6815412, 0.1720611, 0.4405349, 0.2941177, 0, 1, 1,
0.688054, 0.9607434, 2.688435, 0.3019608, 0, 1, 1,
0.6920114, -1.427797, 2.285614, 0.3098039, 0, 1, 1,
0.6928023, -0.2702499, 2.531715, 0.3137255, 0, 1, 1,
0.6939731, -1.196562, 2.61013, 0.3215686, 0, 1, 1,
0.6949237, 1.446254, 0.5855452, 0.3254902, 0, 1, 1,
0.7073514, 0.4864197, 3.364853, 0.3333333, 0, 1, 1,
0.7091517, -1.05319, 1.3344, 0.3372549, 0, 1, 1,
0.7111989, -0.3330062, 1.219577, 0.345098, 0, 1, 1,
0.7122247, 0.3627667, 2.663755, 0.3490196, 0, 1, 1,
0.7134392, -0.1354505, 2.264187, 0.3568628, 0, 1, 1,
0.716667, -1.224017, 2.516815, 0.3607843, 0, 1, 1,
0.7261914, 1.549874, 1.837695, 0.3686275, 0, 1, 1,
0.7270312, -0.6046768, 2.616296, 0.372549, 0, 1, 1,
0.730011, 0.7949095, -1.22269, 0.3803922, 0, 1, 1,
0.7345422, -1.426633, 2.401098, 0.3843137, 0, 1, 1,
0.7412043, -0.2926179, 2.600225, 0.3921569, 0, 1, 1,
0.7439834, 1.290908, -1.271226, 0.3960784, 0, 1, 1,
0.7441304, -1.508355, 2.560843, 0.4039216, 0, 1, 1,
0.7505841, -0.1241094, 1.78751, 0.4117647, 0, 1, 1,
0.7510681, 0.1125248, 2.369537, 0.4156863, 0, 1, 1,
0.7513986, 0.2607173, 1.696206, 0.4235294, 0, 1, 1,
0.7517986, -0.7472987, 0.4028388, 0.427451, 0, 1, 1,
0.7535592, -0.5362492, 1.271945, 0.4352941, 0, 1, 1,
0.7571844, 0.566368, 1.612837, 0.4392157, 0, 1, 1,
0.7586079, 0.5426279, 1.342982, 0.4470588, 0, 1, 1,
0.7608198, 0.7608096, 0.6505483, 0.4509804, 0, 1, 1,
0.7628169, -2.152655, 3.075815, 0.4588235, 0, 1, 1,
0.7638859, -1.300101, 1.043238, 0.4627451, 0, 1, 1,
0.7678243, -0.9476447, 1.422298, 0.4705882, 0, 1, 1,
0.7734063, -0.8766782, 1.268915, 0.4745098, 0, 1, 1,
0.7790976, -0.353741, 0.3533105, 0.4823529, 0, 1, 1,
0.7793247, 0.99016, 2.311074, 0.4862745, 0, 1, 1,
0.7827383, -0.7237886, 1.999052, 0.4941176, 0, 1, 1,
0.7838778, 0.4762696, -1.159661, 0.5019608, 0, 1, 1,
0.7860349, 0.4510176, -0.03813447, 0.5058824, 0, 1, 1,
0.7886986, 0.3004133, 2.878533, 0.5137255, 0, 1, 1,
0.7906496, 0.1077262, 1.985414, 0.5176471, 0, 1, 1,
0.7918768, -1.072499, 2.155955, 0.5254902, 0, 1, 1,
0.795073, -0.5999064, 2.852087, 0.5294118, 0, 1, 1,
0.7953166, -0.5085578, 1.821719, 0.5372549, 0, 1, 1,
0.7961099, -0.6330879, 1.546428, 0.5411765, 0, 1, 1,
0.7963268, -0.4583187, 2.792233, 0.5490196, 0, 1, 1,
0.8022287, 0.1000315, 0.7667997, 0.5529412, 0, 1, 1,
0.803457, 0.8038352, 1.092006, 0.5607843, 0, 1, 1,
0.8061886, -0.4952411, 1.296767, 0.5647059, 0, 1, 1,
0.8070757, -0.8455237, 3.733684, 0.572549, 0, 1, 1,
0.8129218, -1.774063, 1.482529, 0.5764706, 0, 1, 1,
0.817426, 0.803765, 0.806327, 0.5843138, 0, 1, 1,
0.8242407, 0.6662825, 0.4845162, 0.5882353, 0, 1, 1,
0.8246632, 0.7492124, 1.373728, 0.5960785, 0, 1, 1,
0.8282593, -1.561922, 1.975621, 0.6039216, 0, 1, 1,
0.8328431, -0.4052279, 2.743873, 0.6078432, 0, 1, 1,
0.833951, -0.9346354, 3.400115, 0.6156863, 0, 1, 1,
0.8340515, -3.336969, 2.770447, 0.6196079, 0, 1, 1,
0.8375759, 1.873334, 1.928466, 0.627451, 0, 1, 1,
0.8381187, 1.34268, -0.02628504, 0.6313726, 0, 1, 1,
0.8400487, 1.300215, -0.3075025, 0.6392157, 0, 1, 1,
0.8445012, -1.044148, 2.722977, 0.6431373, 0, 1, 1,
0.8458234, -0.07015368, 0.9300362, 0.6509804, 0, 1, 1,
0.8478063, -0.1860457, 2.642129, 0.654902, 0, 1, 1,
0.8499237, 0.262498, 2.484203, 0.6627451, 0, 1, 1,
0.8570701, 0.4121913, 1.016657, 0.6666667, 0, 1, 1,
0.8572689, 1.159218, -0.6052909, 0.6745098, 0, 1, 1,
0.85727, 0.751857, 0.1657499, 0.6784314, 0, 1, 1,
0.8581107, 0.6700406, 0.2595759, 0.6862745, 0, 1, 1,
0.8591015, 0.9761235, 2.216367, 0.6901961, 0, 1, 1,
0.864181, -1.312214, 1.593523, 0.6980392, 0, 1, 1,
0.8698696, 1.957931, 0.7239954, 0.7058824, 0, 1, 1,
0.8726248, 1.178752, 2.111537, 0.7098039, 0, 1, 1,
0.8746201, 1.537252, 4.09228, 0.7176471, 0, 1, 1,
0.8767421, -1.486339, 2.49014, 0.7215686, 0, 1, 1,
0.8789411, 0.5633318, 1.753836, 0.7294118, 0, 1, 1,
0.8811788, -0.7423884, 0.4530832, 0.7333333, 0, 1, 1,
0.8816241, -0.627245, 2.367869, 0.7411765, 0, 1, 1,
0.8822542, 0.1401063, 2.551266, 0.7450981, 0, 1, 1,
0.8840939, -0.04760388, 1.096307, 0.7529412, 0, 1, 1,
0.8851092, -0.4050927, 2.631526, 0.7568628, 0, 1, 1,
0.889254, 0.5876117, 1.372343, 0.7647059, 0, 1, 1,
0.8907719, 1.053467, 0.5928315, 0.7686275, 0, 1, 1,
0.8910042, -1.954966, 2.323275, 0.7764706, 0, 1, 1,
0.8913537, 0.3272196, 1.957015, 0.7803922, 0, 1, 1,
0.8924294, 0.7680864, 1.815791, 0.7882353, 0, 1, 1,
0.907196, -0.9576089, 2.744361, 0.7921569, 0, 1, 1,
0.9094313, 1.210454, -0.515731, 0.8, 0, 1, 1,
0.9102345, -0.1601627, 3.947999, 0.8078431, 0, 1, 1,
0.9166213, -1.001495, 0.8125927, 0.8117647, 0, 1, 1,
0.9175251, 0.446806, 1.670194, 0.8196079, 0, 1, 1,
0.9234864, -1.477331, 1.743213, 0.8235294, 0, 1, 1,
0.9274994, 0.9302251, 0.8706825, 0.8313726, 0, 1, 1,
0.9280155, -1.161029, 3.450897, 0.8352941, 0, 1, 1,
0.9308165, -0.8389201, 1.396563, 0.8431373, 0, 1, 1,
0.9310536, 0.5063031, 1.22959, 0.8470588, 0, 1, 1,
0.9313034, -0.3957226, 1.627947, 0.854902, 0, 1, 1,
0.9315502, -0.6504835, 1.949904, 0.8588235, 0, 1, 1,
0.9322289, -0.09282803, 2.662186, 0.8666667, 0, 1, 1,
0.9399769, -0.1736105, -0.1899574, 0.8705882, 0, 1, 1,
0.9411719, -0.2096404, 2.096049, 0.8784314, 0, 1, 1,
0.9473765, 0.9173694, -0.101447, 0.8823529, 0, 1, 1,
0.9537054, 0.9923041, 0.325052, 0.8901961, 0, 1, 1,
0.9537425, 0.3005452, 2.010236, 0.8941177, 0, 1, 1,
0.9557312, 0.8823826, 1.185467, 0.9019608, 0, 1, 1,
0.9559246, 0.2606697, 1.607899, 0.9098039, 0, 1, 1,
0.9677806, 1.111079, 0.09943397, 0.9137255, 0, 1, 1,
0.9687617, 0.5900709, 0.9065224, 0.9215686, 0, 1, 1,
0.9687628, -0.6549449, 3.020467, 0.9254902, 0, 1, 1,
0.970206, -0.6768352, 1.886529, 0.9333333, 0, 1, 1,
0.9702089, -0.790749, 2.287721, 0.9372549, 0, 1, 1,
0.9707527, -0.8011374, 1.869195, 0.945098, 0, 1, 1,
0.9747787, 1.783224, -0.6577283, 0.9490196, 0, 1, 1,
0.979234, -1.767654, 0.6837409, 0.9568627, 0, 1, 1,
0.9819383, 0.2789639, 2.523843, 0.9607843, 0, 1, 1,
0.9828854, -1.492916, 2.9274, 0.9686275, 0, 1, 1,
0.9940486, -0.4011176, 2.2037, 0.972549, 0, 1, 1,
1.003614, 1.727513, 1.015458, 0.9803922, 0, 1, 1,
1.006094, 0.06853603, 0.5754718, 0.9843137, 0, 1, 1,
1.011574, -1.144391, 2.020478, 0.9921569, 0, 1, 1,
1.01247, 0.8354326, 1.377049, 0.9960784, 0, 1, 1,
1.019063, 1.031614, 0.1613236, 1, 0, 0.9960784, 1,
1.023391, 1.152372, -0.5393081, 1, 0, 0.9882353, 1,
1.02686, 0.4492748, 2.402899, 1, 0, 0.9843137, 1,
1.027522, -0.4222644, 3.002389, 1, 0, 0.9764706, 1,
1.027622, -1.15459, 1.224245, 1, 0, 0.972549, 1,
1.033929, 0.3013927, 0.4625043, 1, 0, 0.9647059, 1,
1.034258, 0.7111056, 2.238029, 1, 0, 0.9607843, 1,
1.051995, 0.6282412, 1.36259, 1, 0, 0.9529412, 1,
1.053625, 0.2116858, 3.071196, 1, 0, 0.9490196, 1,
1.057867, -0.5873216, 2.456603, 1, 0, 0.9411765, 1,
1.062033, -0.678674, 1.721457, 1, 0, 0.9372549, 1,
1.067616, -0.8962299, 2.406573, 1, 0, 0.9294118, 1,
1.070658, -0.4135734, 1.802228, 1, 0, 0.9254902, 1,
1.072733, 1.268786, 0.3830914, 1, 0, 0.9176471, 1,
1.078773, -0.8397926, 2.573724, 1, 0, 0.9137255, 1,
1.084903, 1.025848, 0.3560135, 1, 0, 0.9058824, 1,
1.088002, -1.024905, 1.844019, 1, 0, 0.9019608, 1,
1.090778, -0.0397468, 2.444864, 1, 0, 0.8941177, 1,
1.09876, -0.3005761, 2.203527, 1, 0, 0.8862745, 1,
1.099733, 0.3613288, 1.036194, 1, 0, 0.8823529, 1,
1.104452, -0.003250507, 3.982116, 1, 0, 0.8745098, 1,
1.108142, 2.232589, 0.7231218, 1, 0, 0.8705882, 1,
1.113271, -0.3659345, 1.46385, 1, 0, 0.8627451, 1,
1.117111, -0.07419971, 4.472356, 1, 0, 0.8588235, 1,
1.132157, -0.5171914, 1.427119, 1, 0, 0.8509804, 1,
1.132385, -1.49437, 2.987621, 1, 0, 0.8470588, 1,
1.141753, 1.865781, -0.8406855, 1, 0, 0.8392157, 1,
1.15512, -1.128926, 3.314895, 1, 0, 0.8352941, 1,
1.163954, -0.7423422, 2.733652, 1, 0, 0.827451, 1,
1.167271, 1.267331, 1.676028, 1, 0, 0.8235294, 1,
1.175048, 0.3650074, 2.112489, 1, 0, 0.8156863, 1,
1.179147, -0.4177109, 1.633092, 1, 0, 0.8117647, 1,
1.194897, -0.6061095, 2.943914, 1, 0, 0.8039216, 1,
1.197268, -0.1916681, 2.37409, 1, 0, 0.7960784, 1,
1.200165, 1.191723, 0.5661255, 1, 0, 0.7921569, 1,
1.203008, -0.5804614, 1.374608, 1, 0, 0.7843137, 1,
1.229032, -0.5910586, 2.313143, 1, 0, 0.7803922, 1,
1.22949, 1.424421, 0.1948584, 1, 0, 0.772549, 1,
1.230501, -0.9531748, 3.531401, 1, 0, 0.7686275, 1,
1.233835, 0.02766952, 0.9857076, 1, 0, 0.7607843, 1,
1.239329, 1.177912, -1.727747, 1, 0, 0.7568628, 1,
1.242338, -0.5436282, 1.403849, 1, 0, 0.7490196, 1,
1.245327, -0.844008, 2.545533, 1, 0, 0.7450981, 1,
1.249502, 0.9806473, 2.131527, 1, 0, 0.7372549, 1,
1.253475, 2.139445, 1.524608, 1, 0, 0.7333333, 1,
1.253711, 0.05507467, 2.700413, 1, 0, 0.7254902, 1,
1.256221, 0.6507297, -0.328775, 1, 0, 0.7215686, 1,
1.259742, 0.4300611, 2.848504, 1, 0, 0.7137255, 1,
1.263154, -2.197264, 4.476974, 1, 0, 0.7098039, 1,
1.269867, 0.5715776, 0.426867, 1, 0, 0.7019608, 1,
1.269984, -0.5213768, 1.815898, 1, 0, 0.6941177, 1,
1.270319, 0.116132, 1.119552, 1, 0, 0.6901961, 1,
1.270726, 1.160934, 1.900977, 1, 0, 0.682353, 1,
1.273639, -1.237409, 2.905071, 1, 0, 0.6784314, 1,
1.273945, 1.078158, -0.1457086, 1, 0, 0.6705883, 1,
1.275684, 0.3139223, 2.172807, 1, 0, 0.6666667, 1,
1.278582, -0.485473, 3.484256, 1, 0, 0.6588235, 1,
1.281504, 0.06428567, 1.708654, 1, 0, 0.654902, 1,
1.285977, -0.8857023, 2.102126, 1, 0, 0.6470588, 1,
1.287266, 0.618002, -1.027422, 1, 0, 0.6431373, 1,
1.298962, -1.113451, 2.852397, 1, 0, 0.6352941, 1,
1.304665, -0.1739894, 2.860604, 1, 0, 0.6313726, 1,
1.308118, 0.3289605, 2.338573, 1, 0, 0.6235294, 1,
1.311606, -0.4980602, 2.25686, 1, 0, 0.6196079, 1,
1.312414, 0.3496803, 0.7621642, 1, 0, 0.6117647, 1,
1.326956, -0.1588921, 2.321802, 1, 0, 0.6078432, 1,
1.327887, -0.197387, 3.093634, 1, 0, 0.6, 1,
1.333601, -0.1622693, 4.21773, 1, 0, 0.5921569, 1,
1.337131, -0.7896594, 2.813868, 1, 0, 0.5882353, 1,
1.339619, 1.278455, 0.4703263, 1, 0, 0.5803922, 1,
1.339832, 1.324851, 2.408364, 1, 0, 0.5764706, 1,
1.344659, 0.06641289, 2.758751, 1, 0, 0.5686275, 1,
1.356427, 1.254138, 2.103024, 1, 0, 0.5647059, 1,
1.357918, -0.5549369, 3.344464, 1, 0, 0.5568628, 1,
1.358328, -0.7723824, 3.09423, 1, 0, 0.5529412, 1,
1.362512, -1.998096, 1.232443, 1, 0, 0.5450981, 1,
1.364282, -1.188463, 1.377829, 1, 0, 0.5411765, 1,
1.386027, -0.7876729, 3.1132, 1, 0, 0.5333334, 1,
1.395489, -1.028825, 2.944808, 1, 0, 0.5294118, 1,
1.399513, -1.353688, 3.127317, 1, 0, 0.5215687, 1,
1.401948, -0.2509544, 2.684366, 1, 0, 0.5176471, 1,
1.402062, 1.809764, 2.43243, 1, 0, 0.509804, 1,
1.403501, 0.9889336, 0.3796051, 1, 0, 0.5058824, 1,
1.407152, 0.709721, 1.305364, 1, 0, 0.4980392, 1,
1.417369, 0.7557741, 1.560272, 1, 0, 0.4901961, 1,
1.418118, 0.6948265, 0.9746321, 1, 0, 0.4862745, 1,
1.432719, 0.4114365, 3.020429, 1, 0, 0.4784314, 1,
1.435407, 0.4297775, 0.9509708, 1, 0, 0.4745098, 1,
1.454317, -1.667828, 2.087687, 1, 0, 0.4666667, 1,
1.455602, -1.204464, 3.099482, 1, 0, 0.4627451, 1,
1.458445, 1.35242, -0.1693701, 1, 0, 0.454902, 1,
1.460419, 1.324569, 2.280698, 1, 0, 0.4509804, 1,
1.462347, 0.2900902, 1.515783, 1, 0, 0.4431373, 1,
1.473222, -0.7722843, 3.178768, 1, 0, 0.4392157, 1,
1.480764, -1.138333, 2.046182, 1, 0, 0.4313726, 1,
1.502762, 0.4216676, 1.877015, 1, 0, 0.427451, 1,
1.504916, -0.3843012, 1.795279, 1, 0, 0.4196078, 1,
1.512214, 0.306908, 1.723957, 1, 0, 0.4156863, 1,
1.51468, -1.088974, 4.264266, 1, 0, 0.4078431, 1,
1.532516, -0.5319414, 2.686765, 1, 0, 0.4039216, 1,
1.540003, 0.8574685, 1.299337, 1, 0, 0.3960784, 1,
1.548621, -0.8009755, 3.137088, 1, 0, 0.3882353, 1,
1.551068, 0.3241349, 0.1984384, 1, 0, 0.3843137, 1,
1.557009, 0.7264421, -0.7674069, 1, 0, 0.3764706, 1,
1.564452, 0.03132753, 0.8072334, 1, 0, 0.372549, 1,
1.56521, -0.7983171, 0.9124727, 1, 0, 0.3647059, 1,
1.56669, -0.05383457, 0.8462723, 1, 0, 0.3607843, 1,
1.57556, -0.5643488, 1.177865, 1, 0, 0.3529412, 1,
1.577597, -0.6421419, -0.251126, 1, 0, 0.3490196, 1,
1.59066, 0.006027034, 1.566026, 1, 0, 0.3411765, 1,
1.594613, 0.5407635, 0.1120402, 1, 0, 0.3372549, 1,
1.597785, 0.1062422, 0.04122324, 1, 0, 0.3294118, 1,
1.599421, -1.400666, 2.491538, 1, 0, 0.3254902, 1,
1.603957, -0.6825212, 0.7112305, 1, 0, 0.3176471, 1,
1.608831, 1.154625, -0.01771509, 1, 0, 0.3137255, 1,
1.609978, -0.104533, 3.578035, 1, 0, 0.3058824, 1,
1.610639, 1.60107, 1.619182, 1, 0, 0.2980392, 1,
1.61925, -0.3302052, 1.080307, 1, 0, 0.2941177, 1,
1.62143, -0.1955643, 1.520173, 1, 0, 0.2862745, 1,
1.664606, 0.7171851, 1.581271, 1, 0, 0.282353, 1,
1.691244, -2.027556, 2.245126, 1, 0, 0.2745098, 1,
1.702002, 1.522296, 0.2171964, 1, 0, 0.2705882, 1,
1.715858, -0.9478335, 3.143597, 1, 0, 0.2627451, 1,
1.718464, 0.4694167, 2.532368, 1, 0, 0.2588235, 1,
1.722885, 1.286075, 0.7185097, 1, 0, 0.2509804, 1,
1.746048, -0.070274, 1.248138, 1, 0, 0.2470588, 1,
1.752082, 1.983461, 1.307615, 1, 0, 0.2392157, 1,
1.754022, 0.476682, 3.096802, 1, 0, 0.2352941, 1,
1.755722, 1.64765, 1.21126, 1, 0, 0.227451, 1,
1.762043, -1.568347, 2.81249, 1, 0, 0.2235294, 1,
1.789726, -1.311248, 1.46382, 1, 0, 0.2156863, 1,
1.790789, -1.435167, 1.965724, 1, 0, 0.2117647, 1,
1.795248, 1.09833, 1.329816, 1, 0, 0.2039216, 1,
1.813797, -0.01244346, 1.85601, 1, 0, 0.1960784, 1,
1.816098, 0.4573674, 1.322016, 1, 0, 0.1921569, 1,
1.819927, 0.6568434, 2.507026, 1, 0, 0.1843137, 1,
1.827189, -0.340573, 3.594252, 1, 0, 0.1803922, 1,
1.836467, -0.3986625, 1.766372, 1, 0, 0.172549, 1,
1.856009, 1.071274, 2.404995, 1, 0, 0.1686275, 1,
1.870814, 1.23192, -1.013327, 1, 0, 0.1607843, 1,
1.877161, -1.315069, 3.462253, 1, 0, 0.1568628, 1,
1.884478, -1.060379, 1.063083, 1, 0, 0.1490196, 1,
1.912586, 0.01821409, 0.9048468, 1, 0, 0.145098, 1,
1.930522, -0.4632708, 1.085136, 1, 0, 0.1372549, 1,
1.950405, -1.066507, 1.029182, 1, 0, 0.1333333, 1,
1.96999, -1.912128, 2.634499, 1, 0, 0.1254902, 1,
2.004952, -0.0004137452, 2.065453, 1, 0, 0.1215686, 1,
2.013413, -0.1039816, 1.796946, 1, 0, 0.1137255, 1,
2.0224, -0.06120915, -0.4027205, 1, 0, 0.1098039, 1,
2.050938, -1.05739, 1.079126, 1, 0, 0.1019608, 1,
2.064613, -1.372154, 2.431649, 1, 0, 0.09411765, 1,
2.095134, 0.2088775, 2.734849, 1, 0, 0.09019608, 1,
2.116674, 2.326801, 0.358925, 1, 0, 0.08235294, 1,
2.128731, -0.4044789, 1.932263, 1, 0, 0.07843138, 1,
2.14766, 0.6702107, 1.15031, 1, 0, 0.07058824, 1,
2.158371, 1.365368, -0.09908347, 1, 0, 0.06666667, 1,
2.166636, 0.2910126, 1.427212, 1, 0, 0.05882353, 1,
2.174031, 0.9055725, -0.1539756, 1, 0, 0.05490196, 1,
2.230463, -0.4280553, 2.042449, 1, 0, 0.04705882, 1,
2.380138, -0.6062424, 3.373115, 1, 0, 0.04313726, 1,
2.403977, 1.249719, 1.557998, 1, 0, 0.03529412, 1,
2.408535, 0.6933815, 0.7109433, 1, 0, 0.03137255, 1,
2.534661, -0.6003722, 0.8445653, 1, 0, 0.02352941, 1,
2.624565, -0.8647252, 2.542635, 1, 0, 0.01960784, 1,
2.737967, 0.0619392, 3.367579, 1, 0, 0.01176471, 1,
2.79645, 0.06131753, 0.6234022, 1, 0, 0.007843138, 1
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
-0.240613, -4.504619, -7.690003, 0, -0.5, 0.5, 0.5,
-0.240613, -4.504619, -7.690003, 1, -0.5, 0.5, 0.5,
-0.240613, -4.504619, -7.690003, 1, 1.5, 0.5, 0.5,
-0.240613, -4.504619, -7.690003, 0, 1.5, 0.5, 0.5
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
-4.307241, -0.2211685, -7.690003, 0, -0.5, 0.5, 0.5,
-4.307241, -0.2211685, -7.690003, 1, -0.5, 0.5, 0.5,
-4.307241, -0.2211685, -7.690003, 1, 1.5, 0.5, 0.5,
-4.307241, -0.2211685, -7.690003, 0, 1.5, 0.5, 0.5
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
-4.307241, -4.504619, -0.179929, 0, -0.5, 0.5, 0.5,
-4.307241, -4.504619, -0.179929, 1, -0.5, 0.5, 0.5,
-4.307241, -4.504619, -0.179929, 1, 1.5, 0.5, 0.5,
-4.307241, -4.504619, -0.179929, 0, 1.5, 0.5, 0.5
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
-3, -3.51613, -5.956909,
2, -3.51613, -5.956909,
-3, -3.51613, -5.956909,
-3, -3.680879, -6.245758,
-2, -3.51613, -5.956909,
-2, -3.680879, -6.245758,
-1, -3.51613, -5.956909,
-1, -3.680879, -6.245758,
0, -3.51613, -5.956909,
0, -3.680879, -6.245758,
1, -3.51613, -5.956909,
1, -3.680879, -6.245758,
2, -3.51613, -5.956909,
2, -3.680879, -6.245758
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
-3, -4.010375, -6.823456, 0, -0.5, 0.5, 0.5,
-3, -4.010375, -6.823456, 1, -0.5, 0.5, 0.5,
-3, -4.010375, -6.823456, 1, 1.5, 0.5, 0.5,
-3, -4.010375, -6.823456, 0, 1.5, 0.5, 0.5,
-2, -4.010375, -6.823456, 0, -0.5, 0.5, 0.5,
-2, -4.010375, -6.823456, 1, -0.5, 0.5, 0.5,
-2, -4.010375, -6.823456, 1, 1.5, 0.5, 0.5,
-2, -4.010375, -6.823456, 0, 1.5, 0.5, 0.5,
-1, -4.010375, -6.823456, 0, -0.5, 0.5, 0.5,
-1, -4.010375, -6.823456, 1, -0.5, 0.5, 0.5,
-1, -4.010375, -6.823456, 1, 1.5, 0.5, 0.5,
-1, -4.010375, -6.823456, 0, 1.5, 0.5, 0.5,
0, -4.010375, -6.823456, 0, -0.5, 0.5, 0.5,
0, -4.010375, -6.823456, 1, -0.5, 0.5, 0.5,
0, -4.010375, -6.823456, 1, 1.5, 0.5, 0.5,
0, -4.010375, -6.823456, 0, 1.5, 0.5, 0.5,
1, -4.010375, -6.823456, 0, -0.5, 0.5, 0.5,
1, -4.010375, -6.823456, 1, -0.5, 0.5, 0.5,
1, -4.010375, -6.823456, 1, 1.5, 0.5, 0.5,
1, -4.010375, -6.823456, 0, 1.5, 0.5, 0.5,
2, -4.010375, -6.823456, 0, -0.5, 0.5, 0.5,
2, -4.010375, -6.823456, 1, -0.5, 0.5, 0.5,
2, -4.010375, -6.823456, 1, 1.5, 0.5, 0.5,
2, -4.010375, -6.823456, 0, 1.5, 0.5, 0.5
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
-3.368788, -3, -5.956909,
-3.368788, 2, -5.956909,
-3.368788, -3, -5.956909,
-3.525197, -3, -6.245758,
-3.368788, -2, -5.956909,
-3.525197, -2, -6.245758,
-3.368788, -1, -5.956909,
-3.525197, -1, -6.245758,
-3.368788, 0, -5.956909,
-3.525197, 0, -6.245758,
-3.368788, 1, -5.956909,
-3.525197, 1, -6.245758,
-3.368788, 2, -5.956909,
-3.525197, 2, -6.245758
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
-3.838015, -3, -6.823456, 0, -0.5, 0.5, 0.5,
-3.838015, -3, -6.823456, 1, -0.5, 0.5, 0.5,
-3.838015, -3, -6.823456, 1, 1.5, 0.5, 0.5,
-3.838015, -3, -6.823456, 0, 1.5, 0.5, 0.5,
-3.838015, -2, -6.823456, 0, -0.5, 0.5, 0.5,
-3.838015, -2, -6.823456, 1, -0.5, 0.5, 0.5,
-3.838015, -2, -6.823456, 1, 1.5, 0.5, 0.5,
-3.838015, -2, -6.823456, 0, 1.5, 0.5, 0.5,
-3.838015, -1, -6.823456, 0, -0.5, 0.5, 0.5,
-3.838015, -1, -6.823456, 1, -0.5, 0.5, 0.5,
-3.838015, -1, -6.823456, 1, 1.5, 0.5, 0.5,
-3.838015, -1, -6.823456, 0, 1.5, 0.5, 0.5,
-3.838015, 0, -6.823456, 0, -0.5, 0.5, 0.5,
-3.838015, 0, -6.823456, 1, -0.5, 0.5, 0.5,
-3.838015, 0, -6.823456, 1, 1.5, 0.5, 0.5,
-3.838015, 0, -6.823456, 0, 1.5, 0.5, 0.5,
-3.838015, 1, -6.823456, 0, -0.5, 0.5, 0.5,
-3.838015, 1, -6.823456, 1, -0.5, 0.5, 0.5,
-3.838015, 1, -6.823456, 1, 1.5, 0.5, 0.5,
-3.838015, 1, -6.823456, 0, 1.5, 0.5, 0.5,
-3.838015, 2, -6.823456, 0, -0.5, 0.5, 0.5,
-3.838015, 2, -6.823456, 1, -0.5, 0.5, 0.5,
-3.838015, 2, -6.823456, 1, 1.5, 0.5, 0.5,
-3.838015, 2, -6.823456, 0, 1.5, 0.5, 0.5
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
-3.368788, -3.51613, -4,
-3.368788, -3.51613, 4,
-3.368788, -3.51613, -4,
-3.525197, -3.680879, -4,
-3.368788, -3.51613, -2,
-3.525197, -3.680879, -2,
-3.368788, -3.51613, 0,
-3.525197, -3.680879, 0,
-3.368788, -3.51613, 2,
-3.525197, -3.680879, 2,
-3.368788, -3.51613, 4,
-3.525197, -3.680879, 4
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
-3.838015, -4.010375, -4, 0, -0.5, 0.5, 0.5,
-3.838015, -4.010375, -4, 1, -0.5, 0.5, 0.5,
-3.838015, -4.010375, -4, 1, 1.5, 0.5, 0.5,
-3.838015, -4.010375, -4, 0, 1.5, 0.5, 0.5,
-3.838015, -4.010375, -2, 0, -0.5, 0.5, 0.5,
-3.838015, -4.010375, -2, 1, -0.5, 0.5, 0.5,
-3.838015, -4.010375, -2, 1, 1.5, 0.5, 0.5,
-3.838015, -4.010375, -2, 0, 1.5, 0.5, 0.5,
-3.838015, -4.010375, 0, 0, -0.5, 0.5, 0.5,
-3.838015, -4.010375, 0, 1, -0.5, 0.5, 0.5,
-3.838015, -4.010375, 0, 1, 1.5, 0.5, 0.5,
-3.838015, -4.010375, 0, 0, 1.5, 0.5, 0.5,
-3.838015, -4.010375, 2, 0, -0.5, 0.5, 0.5,
-3.838015, -4.010375, 2, 1, -0.5, 0.5, 0.5,
-3.838015, -4.010375, 2, 1, 1.5, 0.5, 0.5,
-3.838015, -4.010375, 2, 0, 1.5, 0.5, 0.5,
-3.838015, -4.010375, 4, 0, -0.5, 0.5, 0.5,
-3.838015, -4.010375, 4, 1, -0.5, 0.5, 0.5,
-3.838015, -4.010375, 4, 1, 1.5, 0.5, 0.5,
-3.838015, -4.010375, 4, 0, 1.5, 0.5, 0.5
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
-3.368788, -3.51613, -5.956909,
-3.368788, 3.073793, -5.956909,
-3.368788, -3.51613, 5.597051,
-3.368788, 3.073793, 5.597051,
-3.368788, -3.51613, -5.956909,
-3.368788, -3.51613, 5.597051,
-3.368788, 3.073793, -5.956909,
-3.368788, 3.073793, 5.597051,
-3.368788, -3.51613, -5.956909,
2.887562, -3.51613, -5.956909,
-3.368788, -3.51613, 5.597051,
2.887562, -3.51613, 5.597051,
-3.368788, 3.073793, -5.956909,
2.887562, 3.073793, -5.956909,
-3.368788, 3.073793, 5.597051,
2.887562, 3.073793, 5.597051,
2.887562, -3.51613, -5.956909,
2.887562, 3.073793, -5.956909,
2.887562, -3.51613, 5.597051,
2.887562, 3.073793, 5.597051,
2.887562, -3.51613, -5.956909,
2.887562, -3.51613, 5.597051,
2.887562, 3.073793, -5.956909,
2.887562, 3.073793, 5.597051
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
var radius = 7.849024;
var distance = 34.92119;
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
mvMatrix.translate( 0.240613, 0.2211685, 0.179929 );
mvMatrix.scale( 1.356465, 1.287802, 0.7345117 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.92119);
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
chlorfenson<-read.table("chlorfenson.xyz")
```

```
## Error in read.table("chlorfenson.xyz"): no lines available in input
```

```r
x<-chlorfenson$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorfenson' not found
```

```r
y<-chlorfenson$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorfenson' not found
```

```r
z<-chlorfenson$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorfenson' not found
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
-3.277676, 1.584871, -1.175932, 0, 0, 1, 1, 1,
-2.91703, 1.689015, 0.7319233, 1, 0, 0, 1, 1,
-2.79954, 0.158638, -2.048478, 1, 0, 0, 1, 1,
-2.798402, -1.050607, -1.043447, 1, 0, 0, 1, 1,
-2.76195, -1.629663, -2.23612, 1, 0, 0, 1, 1,
-2.712163, 1.522072, -2.025292, 1, 0, 0, 1, 1,
-2.670612, -0.04449309, -2.086973, 0, 0, 0, 1, 1,
-2.660821, -1.54037, -3.230515, 0, 0, 0, 1, 1,
-2.557005, -0.7778646, -0.5478618, 0, 0, 0, 1, 1,
-2.538585, -0.6844838, -2.289736, 0, 0, 0, 1, 1,
-2.497316, -0.08040148, -0.6283605, 0, 0, 0, 1, 1,
-2.320362, 1.14379, 0.3838339, 0, 0, 0, 1, 1,
-2.283609, -0.4460567, -2.247711, 0, 0, 0, 1, 1,
-2.282149, -0.4560408, -1.678205, 1, 1, 1, 1, 1,
-2.22975, 0.8564129, 0.02389293, 1, 1, 1, 1, 1,
-2.228694, -2.575055, -3.083008, 1, 1, 1, 1, 1,
-2.172966, -0.03418232, -2.636079, 1, 1, 1, 1, 1,
-2.165497, -0.1224275, 0.8545389, 1, 1, 1, 1, 1,
-2.104565, -1.309399, -1.401762, 1, 1, 1, 1, 1,
-2.090733, 1.6786, -1.065769, 1, 1, 1, 1, 1,
-2.089957, -0.04557823, -2.243837, 1, 1, 1, 1, 1,
-2.035157, -0.667161, -1.804454, 1, 1, 1, 1, 1,
-2.006798, 0.379969, -2.638917, 1, 1, 1, 1, 1,
-1.978668, -0.5455383, -1.446152, 1, 1, 1, 1, 1,
-1.970602, 0.1533293, -0.5030811, 1, 1, 1, 1, 1,
-1.953681, -0.07351988, -1.263204, 1, 1, 1, 1, 1,
-1.939636, 0.2612973, -1.698067, 1, 1, 1, 1, 1,
-1.903239, -1.852101, -3.402439, 1, 1, 1, 1, 1,
-1.894934, -0.3900401, -1.818509, 0, 0, 1, 1, 1,
-1.891638, -1.029448, -2.769912, 1, 0, 0, 1, 1,
-1.88193, 0.04179108, -3.677526, 1, 0, 0, 1, 1,
-1.814505, 1.238418, -2.075486, 1, 0, 0, 1, 1,
-1.806315, -0.207941, -1.277866, 1, 0, 0, 1, 1,
-1.789993, -0.5665363, -2.206441, 1, 0, 0, 1, 1,
-1.786127, 0.3558213, -2.431118, 0, 0, 0, 1, 1,
-1.773682, -0.8764724, -2.336141, 0, 0, 0, 1, 1,
-1.754498, -1.011922, -3.193067, 0, 0, 0, 1, 1,
-1.730268, 0.4300862, -1.513991, 0, 0, 0, 1, 1,
-1.728667, -0.279474, -3.254095, 0, 0, 0, 1, 1,
-1.724599, 0.2992135, -1.591213, 0, 0, 0, 1, 1,
-1.697068, -0.5885768, -1.893348, 0, 0, 0, 1, 1,
-1.696147, -1.090523, -1.131966, 1, 1, 1, 1, 1,
-1.681131, -0.08921324, -0.6767406, 1, 1, 1, 1, 1,
-1.663741, -0.6819671, -1.430357, 1, 1, 1, 1, 1,
-1.63786, -0.04657828, -2.093224, 1, 1, 1, 1, 1,
-1.627725, 1.107469, 0.2830021, 1, 1, 1, 1, 1,
-1.626031, -1.106048, -2.729361, 1, 1, 1, 1, 1,
-1.605544, 0.4141866, -1.877749, 1, 1, 1, 1, 1,
-1.599096, -0.7683803, -1.619211, 1, 1, 1, 1, 1,
-1.575489, -1.871696, -2.674501, 1, 1, 1, 1, 1,
-1.567754, -0.506084, -0.9067579, 1, 1, 1, 1, 1,
-1.552045, 0.1327473, -1.736697, 1, 1, 1, 1, 1,
-1.551633, 0.7326899, -2.187413, 1, 1, 1, 1, 1,
-1.531499, -0.7452406, -0.9455933, 1, 1, 1, 1, 1,
-1.520895, 0.6179135, -1.804609, 1, 1, 1, 1, 1,
-1.512273, 0.6178108, -1.577255, 1, 1, 1, 1, 1,
-1.49518, 1.740493, -0.3867758, 0, 0, 1, 1, 1,
-1.487417, 0.8532319, -1.469368, 1, 0, 0, 1, 1,
-1.484732, 0.2616564, -2.070995, 1, 0, 0, 1, 1,
-1.481475, -0.3384019, -1.610474, 1, 0, 0, 1, 1,
-1.480665, -1.205261, -3.19295, 1, 0, 0, 1, 1,
-1.470011, 0.5166532, -0.3467501, 1, 0, 0, 1, 1,
-1.458244, -1.062509, -0.9578166, 0, 0, 0, 1, 1,
-1.456897, 0.4837833, -0.07665216, 0, 0, 0, 1, 1,
-1.451556, 0.8847736, -1.001503, 0, 0, 0, 1, 1,
-1.448331, -0.09200641, -3.707615, 0, 0, 0, 1, 1,
-1.444109, 1.917749, -1.365571, 0, 0, 0, 1, 1,
-1.442474, -0.7422049, -3.152599, 0, 0, 0, 1, 1,
-1.440065, -1.533171, -3.447659, 0, 0, 0, 1, 1,
-1.4307, -2.041727, -3.647504, 1, 1, 1, 1, 1,
-1.423449, 2.065572, -0.08727446, 1, 1, 1, 1, 1,
-1.417281, -0.2052464, -2.283753, 1, 1, 1, 1, 1,
-1.405361, -1.605499, -1.069749, 1, 1, 1, 1, 1,
-1.397794, 0.434037, -1.654848, 1, 1, 1, 1, 1,
-1.396881, 1.272593, -1.362757, 1, 1, 1, 1, 1,
-1.388831, 1.430808, -0.9268348, 1, 1, 1, 1, 1,
-1.383368, 0.4030799, -2.441454, 1, 1, 1, 1, 1,
-1.379699, -1.327644, 0.5950077, 1, 1, 1, 1, 1,
-1.37905, 0.2317536, -0.2063599, 1, 1, 1, 1, 1,
-1.378225, -0.6743838, -2.445815, 1, 1, 1, 1, 1,
-1.375194, -1.112513, -3.889027, 1, 1, 1, 1, 1,
-1.368048, -2.14601, -1.717332, 1, 1, 1, 1, 1,
-1.366294, -0.007014642, -0.06732707, 1, 1, 1, 1, 1,
-1.352798, 0.8792872, -1.71655, 1, 1, 1, 1, 1,
-1.325931, 1.612142, -0.6190241, 0, 0, 1, 1, 1,
-1.320694, -0.8106047, -0.08541776, 1, 0, 0, 1, 1,
-1.317954, -0.008720592, -0.9295664, 1, 0, 0, 1, 1,
-1.306443, -1.305631, -2.593471, 1, 0, 0, 1, 1,
-1.302878, 0.9235151, 0.9111527, 1, 0, 0, 1, 1,
-1.302681, -1.502369, -1.802286, 1, 0, 0, 1, 1,
-1.283894, -0.9709089, -1.401147, 0, 0, 0, 1, 1,
-1.275362, 0.8940132, -0.01360869, 0, 0, 0, 1, 1,
-1.267377, -0.2101389, -2.453549, 0, 0, 0, 1, 1,
-1.246503, 0.2069599, -2.548728, 0, 0, 0, 1, 1,
-1.242291, 1.56173, -0.4876681, 0, 0, 0, 1, 1,
-1.235316, 2.449325, -0.9720787, 0, 0, 0, 1, 1,
-1.231288, -1.430716, -3.022716, 0, 0, 0, 1, 1,
-1.221462, -2.013842, -0.4365892, 1, 1, 1, 1, 1,
-1.215212, 2.401115, 0.5294467, 1, 1, 1, 1, 1,
-1.215162, -0.7783152, -2.632834, 1, 1, 1, 1, 1,
-1.213323, -0.1348817, -0.3760679, 1, 1, 1, 1, 1,
-1.211114, 0.4274795, -0.5703535, 1, 1, 1, 1, 1,
-1.208838, 0.1807614, -0.2575656, 1, 1, 1, 1, 1,
-1.207887, -0.1803059, -2.448683, 1, 1, 1, 1, 1,
-1.199642, 0.7922952, -0.5367814, 1, 1, 1, 1, 1,
-1.193073, -0.9264078, -2.737602, 1, 1, 1, 1, 1,
-1.185485, -1.038915, -2.621453, 1, 1, 1, 1, 1,
-1.184362, 0.02981521, -0.7905828, 1, 1, 1, 1, 1,
-1.170827, -1.685243, -3.101592, 1, 1, 1, 1, 1,
-1.16144, -0.7256088, -4.225836, 1, 1, 1, 1, 1,
-1.153532, -0.485724, -1.470368, 1, 1, 1, 1, 1,
-1.139796, 1.129437, -0.6700709, 1, 1, 1, 1, 1,
-1.137632, 1.029525, -1.592097, 0, 0, 1, 1, 1,
-1.135029, -0.8123714, -1.281734, 1, 0, 0, 1, 1,
-1.130863, -0.1426121, -1.571814, 1, 0, 0, 1, 1,
-1.128636, -0.2670616, -1.571513, 1, 0, 0, 1, 1,
-1.125926, 1.992613, -2.116235, 1, 0, 0, 1, 1,
-1.122831, -0.2846687, -0.9539821, 1, 0, 0, 1, 1,
-1.119827, -0.4340094, -2.473095, 0, 0, 0, 1, 1,
-1.096377, 0.3452152, -1.133565, 0, 0, 0, 1, 1,
-1.094313, -1.603604, -0.7019072, 0, 0, 0, 1, 1,
-1.087013, 1.311813, -1.874409, 0, 0, 0, 1, 1,
-1.081849, 0.414582, -2.147017, 0, 0, 0, 1, 1,
-1.080602, -1.559195, -1.311723, 0, 0, 0, 1, 1,
-1.078482, 0.376461, -0.2416966, 0, 0, 0, 1, 1,
-1.07049, 0.5168055, -0.9749606, 1, 1, 1, 1, 1,
-1.062725, 1.224804, -1.061426, 1, 1, 1, 1, 1,
-1.059905, 1.235565, -0.1005446, 1, 1, 1, 1, 1,
-1.057194, -1.145332, -1.309373, 1, 1, 1, 1, 1,
-1.056241, -0.4637205, -2.069648, 1, 1, 1, 1, 1,
-1.052706, 0.5227554, 0.1703499, 1, 1, 1, 1, 1,
-1.045791, 0.7215632, -1.562933, 1, 1, 1, 1, 1,
-1.043658, -0.4977388, -3.139143, 1, 1, 1, 1, 1,
-1.033182, -1.584653, -3.678366, 1, 1, 1, 1, 1,
-1.026717, 1.211509, 0.5856776, 1, 1, 1, 1, 1,
-1.021992, -1.525984, -5.788648, 1, 1, 1, 1, 1,
-1.019614, 1.265377, -0.06257185, 1, 1, 1, 1, 1,
-1.019382, 0.2320985, 0.8562605, 1, 1, 1, 1, 1,
-1.007322, -1.658381, -2.760672, 1, 1, 1, 1, 1,
-1.003174, -0.6146871, -1.525491, 1, 1, 1, 1, 1,
-1.00316, 1.367507, -1.495573, 0, 0, 1, 1, 1,
-1.003109, -0.5152255, -2.089878, 1, 0, 0, 1, 1,
-0.9909247, -0.3247105, -0.5522017, 1, 0, 0, 1, 1,
-0.9905274, 2.209344, -2.149427, 1, 0, 0, 1, 1,
-0.988764, -0.5272947, -2.617127, 1, 0, 0, 1, 1,
-0.9867886, -0.1900233, -2.315343, 1, 0, 0, 1, 1,
-0.9865808, 0.4871659, -0.2079504, 0, 0, 0, 1, 1,
-0.9824513, -1.863924, -1.319421, 0, 0, 0, 1, 1,
-0.9777378, 0.6148754, 0.727371, 0, 0, 0, 1, 1,
-0.9714994, -1.422451, -3.991229, 0, 0, 0, 1, 1,
-0.9704915, 0.1029196, -0.930865, 0, 0, 0, 1, 1,
-0.9679489, -0.3561447, -2.617069, 0, 0, 0, 1, 1,
-0.9625769, 0.5603654, -0.7180827, 0, 0, 0, 1, 1,
-0.9616846, 0.3528584, -1.497776, 1, 1, 1, 1, 1,
-0.9605052, 1.456074, -1.767249, 1, 1, 1, 1, 1,
-0.9588882, 1.315068, -0.8401832, 1, 1, 1, 1, 1,
-0.9513842, -0.5364747, -1.892934, 1, 1, 1, 1, 1,
-0.9503283, 1.905384, -0.5030128, 1, 1, 1, 1, 1,
-0.9440909, -0.01714198, -2.555327, 1, 1, 1, 1, 1,
-0.9423233, -0.8963435, -0.6337425, 1, 1, 1, 1, 1,
-0.9386846, -0.5985821, -1.174205, 1, 1, 1, 1, 1,
-0.9348282, -0.3801775, -2.985004, 1, 1, 1, 1, 1,
-0.93141, 0.9446712, 0.8624279, 1, 1, 1, 1, 1,
-0.9272959, -1.891039, -1.556715, 1, 1, 1, 1, 1,
-0.9250574, 0.3883955, -4.178078, 1, 1, 1, 1, 1,
-0.9237568, -0.1874295, -0.7240379, 1, 1, 1, 1, 1,
-0.9227602, 0.8509605, -0.9656679, 1, 1, 1, 1, 1,
-0.918819, -0.1799865, -2.410467, 1, 1, 1, 1, 1,
-0.916334, -0.8349996, -3.589533, 0, 0, 1, 1, 1,
-0.9116436, -1.005877, -1.816096, 1, 0, 0, 1, 1,
-0.9103462, 1.774991, 0.2838035, 1, 0, 0, 1, 1,
-0.9078187, 0.1665981, -1.073534, 1, 0, 0, 1, 1,
-0.9061747, 1.143649, -0.2604762, 1, 0, 0, 1, 1,
-0.9020035, -0.3755669, -1.925707, 1, 0, 0, 1, 1,
-0.8956242, 0.5970297, -0.6028228, 0, 0, 0, 1, 1,
-0.8914253, -1.753681, -2.718261, 0, 0, 0, 1, 1,
-0.8893586, -0.3602107, -3.07542, 0, 0, 0, 1, 1,
-0.8863041, 1.117301, -1.342496, 0, 0, 0, 1, 1,
-0.8824063, 0.1278815, -2.241033, 0, 0, 0, 1, 1,
-0.8758363, -0.03347785, -0.23214, 0, 0, 0, 1, 1,
-0.8681442, 0.1774159, -1.012696, 0, 0, 0, 1, 1,
-0.8677102, 0.2439341, -0.3282401, 1, 1, 1, 1, 1,
-0.8667004, -1.12321, -1.244074, 1, 1, 1, 1, 1,
-0.8649824, 0.7115177, 0.1100275, 1, 1, 1, 1, 1,
-0.864041, -0.4309544, -1.851719, 1, 1, 1, 1, 1,
-0.8615581, 0.06047158, -1.840041, 1, 1, 1, 1, 1,
-0.8587453, 1.21658, -0.2285458, 1, 1, 1, 1, 1,
-0.8558444, -0.3131001, -3.738574, 1, 1, 1, 1, 1,
-0.8553184, -0.1557571, -1.573887, 1, 1, 1, 1, 1,
-0.8539817, 0.07216369, -1.806826, 1, 1, 1, 1, 1,
-0.8519658, -1.0068, -1.365265, 1, 1, 1, 1, 1,
-0.8497754, 1.23004, -1.58033, 1, 1, 1, 1, 1,
-0.8494056, 0.2456727, -1.11107, 1, 1, 1, 1, 1,
-0.8459224, -0.3883119, -1.458683, 1, 1, 1, 1, 1,
-0.8415472, -1.455351, -2.298802, 1, 1, 1, 1, 1,
-0.8413748, 2.400953, 0.1125867, 1, 1, 1, 1, 1,
-0.8412811, 1.410761, -0.7606926, 0, 0, 1, 1, 1,
-0.8366407, 0.06762308, -2.714793, 1, 0, 0, 1, 1,
-0.8267123, -1.0786, -2.863548, 1, 0, 0, 1, 1,
-0.8254544, 0.2752166, -2.446183, 1, 0, 0, 1, 1,
-0.8246695, -1.987767, -1.907684, 1, 0, 0, 1, 1,
-0.8204221, 0.4766272, -0.7663139, 1, 0, 0, 1, 1,
-0.8160544, -2.348811, -3.057896, 0, 0, 0, 1, 1,
-0.8144453, 0.4452831, -3.186962, 0, 0, 0, 1, 1,
-0.8142728, 1.437623, 0.1804216, 0, 0, 0, 1, 1,
-0.8114079, -0.01482259, -1.715312, 0, 0, 0, 1, 1,
-0.8096437, -0.7707585, -0.5907355, 0, 0, 0, 1, 1,
-0.8094206, -0.005413706, -2.188901, 0, 0, 0, 1, 1,
-0.8086722, 1.218182, -2.012651, 0, 0, 0, 1, 1,
-0.8072585, -0.01140082, -1.262857, 1, 1, 1, 1, 1,
-0.7968218, 2.293326, -0.5398401, 1, 1, 1, 1, 1,
-0.7931085, -0.7612159, -2.81403, 1, 1, 1, 1, 1,
-0.7920369, 1.351352, 0.1065827, 1, 1, 1, 1, 1,
-0.7895409, 0.7995472, -1.939743, 1, 1, 1, 1, 1,
-0.7888814, 1.383087, -0.7594641, 1, 1, 1, 1, 1,
-0.7839549, 0.6952603, -1.433921, 1, 1, 1, 1, 1,
-0.7801087, 2.327706, -1.624031, 1, 1, 1, 1, 1,
-0.7780546, 0.1351073, 0.3474607, 1, 1, 1, 1, 1,
-0.7738953, 0.7708789, -0.4660004, 1, 1, 1, 1, 1,
-0.7699209, -0.06616037, -2.339919, 1, 1, 1, 1, 1,
-0.768445, 0.1107709, -1.497792, 1, 1, 1, 1, 1,
-0.7652246, -1.321874, -3.687794, 1, 1, 1, 1, 1,
-0.7596073, 1.004198, 0.02301584, 1, 1, 1, 1, 1,
-0.7571599, -0.5678811, -2.434244, 1, 1, 1, 1, 1,
-0.7541406, 0.4036277, -0.4964114, 0, 0, 1, 1, 1,
-0.7519658, -0.9485028, -1.982925, 1, 0, 0, 1, 1,
-0.7304175, 0.2198032, -1.423352, 1, 0, 0, 1, 1,
-0.7266324, 0.2754264, 0.1683091, 1, 0, 0, 1, 1,
-0.7262169, -0.08226147, -1.410159, 1, 0, 0, 1, 1,
-0.7230576, 0.6996133, -0.8091503, 1, 0, 0, 1, 1,
-0.7222067, 1.370297, 0.8034447, 0, 0, 0, 1, 1,
-0.7219221, -1.725823, -3.484995, 0, 0, 0, 1, 1,
-0.7182458, -0.1291082, -3.270942, 0, 0, 0, 1, 1,
-0.7080947, 1.384651, 1.997614, 0, 0, 0, 1, 1,
-0.7004336, 0.5654361, -2.735602, 0, 0, 0, 1, 1,
-0.6944162, -2.169897, -3.84666, 0, 0, 0, 1, 1,
-0.6933892, -0.4511188, -0.2402862, 0, 0, 0, 1, 1,
-0.6814516, 0.8953225, 0.4181249, 1, 1, 1, 1, 1,
-0.6761267, 0.3601249, -0.3421803, 1, 1, 1, 1, 1,
-0.6756671, 0.8940495, -1.622397, 1, 1, 1, 1, 1,
-0.668053, 0.004468756, -1.906713, 1, 1, 1, 1, 1,
-0.6637703, 0.7953286, 0.2268186, 1, 1, 1, 1, 1,
-0.6633406, 0.7234868, 0.4753528, 1, 1, 1, 1, 1,
-0.6574957, 0.03574536, -0.7377399, 1, 1, 1, 1, 1,
-0.6542348, 0.5472783, -0.2801084, 1, 1, 1, 1, 1,
-0.6501036, 1.132447, -0.05195182, 1, 1, 1, 1, 1,
-0.638128, 0.7394599, -1.039003, 1, 1, 1, 1, 1,
-0.636363, -0.007282464, -0.6393033, 1, 1, 1, 1, 1,
-0.6282789, -0.6498884, -3.041087, 1, 1, 1, 1, 1,
-0.6272013, -1.014531, -0.9457715, 1, 1, 1, 1, 1,
-0.6211021, -0.02476612, -2.490487, 1, 1, 1, 1, 1,
-0.619735, -2.53849, -3.6914, 1, 1, 1, 1, 1,
-0.6133989, -1.439127, -2.025011, 0, 0, 1, 1, 1,
-0.6036741, 1.487109, -0.01999406, 1, 0, 0, 1, 1,
-0.5866197, 0.378799, 0.007301039, 1, 0, 0, 1, 1,
-0.5825396, -0.5636176, -3.097223, 1, 0, 0, 1, 1,
-0.5813897, 0.03727804, -1.033923, 1, 0, 0, 1, 1,
-0.579608, -0.1923443, -3.699061, 1, 0, 0, 1, 1,
-0.5730531, -1.462495, -1.093631, 0, 0, 0, 1, 1,
-0.5710937, -0.4549903, -4.779163, 0, 0, 0, 1, 1,
-0.56593, 1.540874, 0.163364, 0, 0, 0, 1, 1,
-0.5591739, 0.0329373, -2.709075, 0, 0, 0, 1, 1,
-0.5578052, 1.076796, -1.054036, 0, 0, 0, 1, 1,
-0.555784, -0.3043499, -0.9015732, 0, 0, 0, 1, 1,
-0.5505291, 1.199314, 0.1439527, 0, 0, 0, 1, 1,
-0.5501553, -0.4030366, -0.6357853, 1, 1, 1, 1, 1,
-0.5477194, 0.8180744, 1.227519, 1, 1, 1, 1, 1,
-0.5470118, -0.3611973, -1.968131, 1, 1, 1, 1, 1,
-0.5469512, 0.2843122, -1.622114, 1, 1, 1, 1, 1,
-0.5447507, 1.420564, 0.5594015, 1, 1, 1, 1, 1,
-0.5422869, 0.07362523, -1.993923, 1, 1, 1, 1, 1,
-0.5416127, 0.9902778, 0.1111125, 1, 1, 1, 1, 1,
-0.5407868, 1.199454, -0.7148764, 1, 1, 1, 1, 1,
-0.5395133, -1.765277, -2.479908, 1, 1, 1, 1, 1,
-0.5378601, -1.72972, -1.353639, 1, 1, 1, 1, 1,
-0.5372526, -0.00596156, 0.1183237, 1, 1, 1, 1, 1,
-0.5370992, 0.08025179, -1.233603, 1, 1, 1, 1, 1,
-0.53198, 0.3425007, -2.161862, 1, 1, 1, 1, 1,
-0.5296277, -0.7583012, -2.000239, 1, 1, 1, 1, 1,
-0.5271501, 0.8505554, -0.7067065, 1, 1, 1, 1, 1,
-0.5256914, 0.4784817, -0.2860579, 0, 0, 1, 1, 1,
-0.5247962, 0.395336, 1.138378, 1, 0, 0, 1, 1,
-0.5239427, -0.240907, -2.238453, 1, 0, 0, 1, 1,
-0.5233362, 1.020279, -0.02791491, 1, 0, 0, 1, 1,
-0.5213766, 0.1718546, -1.748226, 1, 0, 0, 1, 1,
-0.5199039, 1.406673, 0.7207358, 1, 0, 0, 1, 1,
-0.5182126, -1.63871, -2.506138, 0, 0, 0, 1, 1,
-0.511217, 0.648096, -2.344496, 0, 0, 0, 1, 1,
-0.5053055, -0.7543718, -1.276791, 0, 0, 0, 1, 1,
-0.4982597, -0.657398, -2.599109, 0, 0, 0, 1, 1,
-0.4958055, 2.455671, -0.1373148, 0, 0, 0, 1, 1,
-0.4930839, 1.410469, -0.7678404, 0, 0, 0, 1, 1,
-0.4888096, 1.763772, -1.191562, 0, 0, 0, 1, 1,
-0.4883996, 0.2364531, -0.4793404, 1, 1, 1, 1, 1,
-0.4876037, 1.453367, -1.358959, 1, 1, 1, 1, 1,
-0.4849904, -0.274593, -3.057059, 1, 1, 1, 1, 1,
-0.4790944, 2.977824, -1.730094, 1, 1, 1, 1, 1,
-0.4767483, -0.6646588, -2.927275, 1, 1, 1, 1, 1,
-0.4766567, 1.857213, 0.333348, 1, 1, 1, 1, 1,
-0.4748194, -0.3759026, -2.143061, 1, 1, 1, 1, 1,
-0.4734666, -0.6468403, -1.46725, 1, 1, 1, 1, 1,
-0.4694184, 1.230894, -0.1637552, 1, 1, 1, 1, 1,
-0.4662128, 0.6537429, -1.004382, 1, 1, 1, 1, 1,
-0.4608856, 0.4334803, -2.185867, 1, 1, 1, 1, 1,
-0.4606649, 0.5920305, -1.003515, 1, 1, 1, 1, 1,
-0.4512771, -0.691983, -2.720721, 1, 1, 1, 1, 1,
-0.450605, 0.5103726, -2.025799, 1, 1, 1, 1, 1,
-0.4474054, -0.6101956, -3.727071, 1, 1, 1, 1, 1,
-0.4465798, -0.5620725, -4.591588, 0, 0, 1, 1, 1,
-0.4458999, -1.326615, -2.565549, 1, 0, 0, 1, 1,
-0.4447769, -0.08494092, -2.910911, 1, 0, 0, 1, 1,
-0.4391812, -0.1750407, -3.131356, 1, 0, 0, 1, 1,
-0.4338633, 0.9770825, -0.815858, 1, 0, 0, 1, 1,
-0.4323899, 1.73687, -0.4916254, 1, 0, 0, 1, 1,
-0.4308873, -0.1007432, -3.769769, 0, 0, 0, 1, 1,
-0.427223, -0.08060578, -2.98073, 0, 0, 0, 1, 1,
-0.4261054, 0.5025792, -2.896041, 0, 0, 0, 1, 1,
-0.4250525, -1.308326, -2.196234, 0, 0, 0, 1, 1,
-0.4239702, -0.6313647, -4.026995, 0, 0, 0, 1, 1,
-0.4235596, -0.1916516, -1.278119, 0, 0, 0, 1, 1,
-0.4185891, 0.6926554, -1.599594, 0, 0, 0, 1, 1,
-0.4185207, 0.1262252, -0.992951, 1, 1, 1, 1, 1,
-0.4130556, 0.07292635, -2.540567, 1, 1, 1, 1, 1,
-0.4103131, -0.7776271, -0.2349487, 1, 1, 1, 1, 1,
-0.4057095, -0.003644324, -0.1742211, 1, 1, 1, 1, 1,
-0.4048783, 1.141523, -0.190214, 1, 1, 1, 1, 1,
-0.4036061, 0.7691726, 1.05011, 1, 1, 1, 1, 1,
-0.4031064, -2.111073, -0.04474929, 1, 1, 1, 1, 1,
-0.4016505, -0.9891816, -3.188565, 1, 1, 1, 1, 1,
-0.4001772, 1.527523, 0.9570491, 1, 1, 1, 1, 1,
-0.3995252, -0.1601543, -2.829903, 1, 1, 1, 1, 1,
-0.3977192, -0.5195819, -1.796825, 1, 1, 1, 1, 1,
-0.3940407, 0.5869693, 0.8017373, 1, 1, 1, 1, 1,
-0.3906043, -0.7935231, -2.303898, 1, 1, 1, 1, 1,
-0.3904236, -0.8143262, -2.882619, 1, 1, 1, 1, 1,
-0.383799, 1.680794, -1.260679, 1, 1, 1, 1, 1,
-0.3837634, 0.197004, -0.6308758, 0, 0, 1, 1, 1,
-0.3819968, -1.056141, -1.126239, 1, 0, 0, 1, 1,
-0.3819742, -2.574835, -2.21611, 1, 0, 0, 1, 1,
-0.3802251, 0.3669602, -0.318884, 1, 0, 0, 1, 1,
-0.3706757, 0.121809, -0.3238193, 1, 0, 0, 1, 1,
-0.3691168, -1.09954, -3.311631, 1, 0, 0, 1, 1,
-0.3616682, 1.285184, -0.4038092, 0, 0, 0, 1, 1,
-0.3572995, -0.03732595, -1.584353, 0, 0, 0, 1, 1,
-0.3564644, -1.889769, -2.849306, 0, 0, 0, 1, 1,
-0.3561894, -1.292713, -3.964092, 0, 0, 0, 1, 1,
-0.3558286, -0.601085, -2.065269, 0, 0, 0, 1, 1,
-0.35182, -0.03072947, -1.087971, 0, 0, 0, 1, 1,
-0.350777, 1.73664, 1.636357, 0, 0, 0, 1, 1,
-0.3463465, -0.2793344, -0.7249009, 1, 1, 1, 1, 1,
-0.3413547, -3.420161, -2.048879, 1, 1, 1, 1, 1,
-0.3393803, 0.4013741, -1.438396, 1, 1, 1, 1, 1,
-0.3315113, 0.4257785, -0.298186, 1, 1, 1, 1, 1,
-0.3313525, 0.05135468, 0.136435, 1, 1, 1, 1, 1,
-0.3304517, 1.540205, -0.6300568, 1, 1, 1, 1, 1,
-0.330301, -0.7288067, 0.251737, 1, 1, 1, 1, 1,
-0.3283445, -1.431273, -3.0234, 1, 1, 1, 1, 1,
-0.3267516, -1.627584, -2.46827, 1, 1, 1, 1, 1,
-0.3262141, 0.02636846, -0.4292935, 1, 1, 1, 1, 1,
-0.3250179, -1.956658, -3.395785, 1, 1, 1, 1, 1,
-0.323848, -0.6450573, -3.841564, 1, 1, 1, 1, 1,
-0.3218458, -0.3905894, -2.019943, 1, 1, 1, 1, 1,
-0.3209412, 0.7192244, -1.026107, 1, 1, 1, 1, 1,
-0.3159989, -1.605562, -3.529326, 1, 1, 1, 1, 1,
-0.3149346, -0.2530148, -1.969659, 0, 0, 1, 1, 1,
-0.3117562, -0.6029935, -2.808088, 1, 0, 0, 1, 1,
-0.307314, 0.6985818, -0.4835869, 1, 0, 0, 1, 1,
-0.3070846, -0.1855017, -2.867461, 1, 0, 0, 1, 1,
-0.2976123, 0.6053248, -1.46074, 1, 0, 0, 1, 1,
-0.2949989, 1.280993, -0.6042338, 1, 0, 0, 1, 1,
-0.2914175, 0.9099166, -0.7104063, 0, 0, 0, 1, 1,
-0.2891908, -0.3502109, -1.956686, 0, 0, 0, 1, 1,
-0.2867447, -0.1517554, -2.121808, 0, 0, 0, 1, 1,
-0.2825956, -0.2966588, -1.839012, 0, 0, 0, 1, 1,
-0.2789331, -0.7249862, -3.496247, 0, 0, 0, 1, 1,
-0.2787446, 1.345298, 0.1189391, 0, 0, 0, 1, 1,
-0.2783076, 0.4489584, -0.07417745, 0, 0, 0, 1, 1,
-0.2728612, -0.8640543, -2.217468, 1, 1, 1, 1, 1,
-0.268749, 1.021972, 0.9325974, 1, 1, 1, 1, 1,
-0.2645523, 0.4278559, 1.327552, 1, 1, 1, 1, 1,
-0.260897, 0.1420735, 0.08399958, 1, 1, 1, 1, 1,
-0.2584635, 1.441372, 0.6870033, 1, 1, 1, 1, 1,
-0.2543107, -0.6607247, -2.854832, 1, 1, 1, 1, 1,
-0.2522305, 0.2023802, -1.836001, 1, 1, 1, 1, 1,
-0.246899, -0.2317087, -3.116544, 1, 1, 1, 1, 1,
-0.2434603, 0.7251567, 0.2845808, 1, 1, 1, 1, 1,
-0.2431266, -2.121449, -2.755116, 1, 1, 1, 1, 1,
-0.2346039, -0.6330565, -2.095186, 1, 1, 1, 1, 1,
-0.233109, -0.1077693, -2.261841, 1, 1, 1, 1, 1,
-0.2303994, -0.25883, -4.269651, 1, 1, 1, 1, 1,
-0.2300927, -1.893105, -4.766239, 1, 1, 1, 1, 1,
-0.2264979, 1.147066, -0.7002439, 1, 1, 1, 1, 1,
-0.2224001, -1.067539, -2.530803, 0, 0, 1, 1, 1,
-0.2221172, 0.5154476, -1.973782, 1, 0, 0, 1, 1,
-0.2156598, -0.4807814, -3.491786, 1, 0, 0, 1, 1,
-0.2129849, -0.4903091, -3.579211, 1, 0, 0, 1, 1,
-0.2060463, 1.535578, -2.074046, 1, 0, 0, 1, 1,
-0.2059429, 1.775897, 0.7662316, 1, 0, 0, 1, 1,
-0.205324, -0.4141161, -0.6715346, 0, 0, 0, 1, 1,
-0.1967024, 0.509524, -0.5816529, 0, 0, 0, 1, 1,
-0.1957542, 0.2069445, -1.839279, 0, 0, 0, 1, 1,
-0.1927368, 1.241399, -0.5874454, 0, 0, 0, 1, 1,
-0.1881258, 0.1896212, -0.5378906, 0, 0, 0, 1, 1,
-0.175527, -0.9073271, -4.863917, 0, 0, 0, 1, 1,
-0.1731364, 0.8379014, 0.5518542, 0, 0, 0, 1, 1,
-0.1717281, -0.1732427, -1.796201, 1, 1, 1, 1, 1,
-0.1711525, -0.6419025, -2.602777, 1, 1, 1, 1, 1,
-0.1656692, -0.7528965, -1.703897, 1, 1, 1, 1, 1,
-0.1632035, 0.5152917, -1.142972, 1, 1, 1, 1, 1,
-0.1591539, -1.409873, -2.660785, 1, 1, 1, 1, 1,
-0.1574942, 0.8395094, 0.4828112, 1, 1, 1, 1, 1,
-0.1567491, -0.0591561, -2.067587, 1, 1, 1, 1, 1,
-0.1551286, -0.4988546, -4.494714, 1, 1, 1, 1, 1,
-0.1547115, -0.4765056, -2.254524, 1, 1, 1, 1, 1,
-0.1540903, 0.1313189, -0.5174781, 1, 1, 1, 1, 1,
-0.1494082, 0.5923346, 0.06338148, 1, 1, 1, 1, 1,
-0.1461481, -0.4147763, -2.001915, 1, 1, 1, 1, 1,
-0.1350219, 0.2445536, -1.56875, 1, 1, 1, 1, 1,
-0.1343875, 1.364878, 0.7171424, 1, 1, 1, 1, 1,
-0.1300979, 0.6750681, 1.048814, 1, 1, 1, 1, 1,
-0.1271675, -1.851261, -1.820293, 0, 0, 1, 1, 1,
-0.1248469, -0.3571265, -2.888082, 1, 0, 0, 1, 1,
-0.1243345, 1.035378, -1.034567, 1, 0, 0, 1, 1,
-0.1238532, -0.6368273, -2.94042, 1, 0, 0, 1, 1,
-0.1230634, 1.077166, 0.364815, 1, 0, 0, 1, 1,
-0.122883, 0.2384353, -0.4428616, 1, 0, 0, 1, 1,
-0.1228565, 0.3710403, -0.4190712, 0, 0, 0, 1, 1,
-0.1226335, -1.865263, -3.634983, 0, 0, 0, 1, 1,
-0.1205984, -0.9546694, -3.915061, 0, 0, 0, 1, 1,
-0.1185718, 0.4845264, -0.4012904, 0, 0, 0, 1, 1,
-0.1170889, -0.2306815, -2.526415, 0, 0, 0, 1, 1,
-0.09769023, 1.210763, -1.496984, 0, 0, 0, 1, 1,
-0.09691424, 0.03189268, -1.746194, 0, 0, 0, 1, 1,
-0.09687106, -0.5540026, -3.138509, 1, 1, 1, 1, 1,
-0.08416992, 0.6109751, -1.635515, 1, 1, 1, 1, 1,
-0.08173162, 0.4335408, 2.4097, 1, 1, 1, 1, 1,
-0.08066141, 1.209661, -0.8554737, 1, 1, 1, 1, 1,
-0.07954551, -0.7238113, -2.821827, 1, 1, 1, 1, 1,
-0.07442797, -0.4658218, -4.535791, 1, 1, 1, 1, 1,
-0.07374015, 0.993654, 0.5615255, 1, 1, 1, 1, 1,
-0.07195549, 0.7487909, 0.4208438, 1, 1, 1, 1, 1,
-0.07170277, -0.4507827, -2.062605, 1, 1, 1, 1, 1,
-0.07157603, -0.9124852, -2.818965, 1, 1, 1, 1, 1,
-0.07078362, -1.338473, -2.531968, 1, 1, 1, 1, 1,
-0.06909622, 0.7679385, -0.9025552, 1, 1, 1, 1, 1,
-0.06646565, 0.5411649, 0.5376523, 1, 1, 1, 1, 1,
-0.06606881, 1.439582, -0.4634967, 1, 1, 1, 1, 1,
-0.06099613, -0.2495898, -0.9722634, 1, 1, 1, 1, 1,
-0.05947419, -0.2149193, -2.918921, 0, 0, 1, 1, 1,
-0.05920582, -0.1971131, -4.307072, 1, 0, 0, 1, 1,
-0.05353012, -1.313817, -3.582444, 1, 0, 0, 1, 1,
-0.05029392, -0.2584967, -3.518752, 1, 0, 0, 1, 1,
-0.05001843, -1.276981, -2.366491, 1, 0, 0, 1, 1,
-0.0472339, -0.9947066, -2.784431, 1, 0, 0, 1, 1,
-0.04392618, -0.2322389, -4.309484, 0, 0, 0, 1, 1,
-0.04215432, -1.069699, -2.389502, 0, 0, 0, 1, 1,
-0.04209518, 2.019506, -0.1045628, 0, 0, 0, 1, 1,
-0.03987534, -0.1788654, -2.276656, 0, 0, 0, 1, 1,
-0.03955764, 0.6794228, 0.7422716, 0, 0, 0, 1, 1,
-0.02757628, -0.3147136, -1.894549, 0, 0, 0, 1, 1,
-0.02657475, 0.1778264, 0.2932025, 0, 0, 0, 1, 1,
-0.02654099, -0.3444739, -3.244559, 1, 1, 1, 1, 1,
-0.02458339, -0.6886296, -4.375187, 1, 1, 1, 1, 1,
-0.02113641, 0.7664514, -1.086522, 1, 1, 1, 1, 1,
-0.02081075, 0.3123056, 0.2594053, 1, 1, 1, 1, 1,
-0.01759822, 1.34183, 2.340586, 1, 1, 1, 1, 1,
-0.01457987, -1.003043, -4.558868, 1, 1, 1, 1, 1,
-0.01457641, 1.259471, -0.1889368, 1, 1, 1, 1, 1,
-0.01446747, -0.6874764, -4.651808, 1, 1, 1, 1, 1,
-0.01257356, 0.2537055, 0.2214353, 1, 1, 1, 1, 1,
-0.01178155, -0.1114129, -3.266051, 1, 1, 1, 1, 1,
-0.01098875, 0.8312491, 0.1941587, 1, 1, 1, 1, 1,
-0.008643676, 1.349995, 1.151573, 1, 1, 1, 1, 1,
-0.00459678, -0.3995599, -4.038253, 1, 1, 1, 1, 1,
-0.003850372, 0.03280153, 0.422828, 1, 1, 1, 1, 1,
-0.002868498, -1.42521, -3.465614, 1, 1, 1, 1, 1,
-0.002185169, 0.4779375, -0.3080631, 0, 0, 1, 1, 1,
0.00146879, 1.066368, -1.042583, 1, 0, 0, 1, 1,
0.004453924, -0.1189705, 3.197764, 1, 0, 0, 1, 1,
0.005526899, -1.692793, 2.248817, 1, 0, 0, 1, 1,
0.01847254, -1.742408, 4.416546, 1, 0, 0, 1, 1,
0.0206747, 0.1116206, 0.666176, 1, 0, 0, 1, 1,
0.02358488, 1.152844, -1.195615, 0, 0, 0, 1, 1,
0.0295413, -1.481174, 4.506377, 0, 0, 0, 1, 1,
0.03159904, 0.7425234, -0.4170108, 0, 0, 0, 1, 1,
0.03432281, -0.8075806, 2.632937, 0, 0, 0, 1, 1,
0.0516856, 0.2314644, -0.4537466, 0, 0, 0, 1, 1,
0.05183234, -0.09459104, 1.238077, 0, 0, 0, 1, 1,
0.05574776, -2.019941, 3.130471, 0, 0, 0, 1, 1,
0.05627135, 0.8904448, -0.7694443, 1, 1, 1, 1, 1,
0.05656254, -0.1634822, 4.070106, 1, 1, 1, 1, 1,
0.05765774, 0.06831709, -1.10955, 1, 1, 1, 1, 1,
0.06623904, 0.01073322, 3.021, 1, 1, 1, 1, 1,
0.06992137, -0.1679321, 2.322382, 1, 1, 1, 1, 1,
0.07163948, 0.08442863, 0.4322454, 1, 1, 1, 1, 1,
0.07248966, -0.5979429, 4.73165, 1, 1, 1, 1, 1,
0.07707409, 1.245279, -0.5512007, 1, 1, 1, 1, 1,
0.07725041, 0.4199446, 1.242478, 1, 1, 1, 1, 1,
0.07992882, -0.2112971, 3.222981, 1, 1, 1, 1, 1,
0.0805655, 1.437269, -1.931553, 1, 1, 1, 1, 1,
0.08697607, 1.721047, 0.630247, 1, 1, 1, 1, 1,
0.09472068, -1.284247, 3.397859, 1, 1, 1, 1, 1,
0.09504897, -0.957564, 4.050476, 1, 1, 1, 1, 1,
0.09627488, 0.5835958, 0.6614798, 1, 1, 1, 1, 1,
0.1002646, -1.147456, 1.978171, 0, 0, 1, 1, 1,
0.1015888, 0.06473044, 3.211637, 1, 0, 0, 1, 1,
0.1065906, 1.328173, -0.072785, 1, 0, 0, 1, 1,
0.1074279, 1.388696, -1.746151, 1, 0, 0, 1, 1,
0.1116308, -0.77828, 2.546683, 1, 0, 0, 1, 1,
0.1122262, 0.3403658, 1.817514, 1, 0, 0, 1, 1,
0.1139641, -1.530403, 3.742096, 0, 0, 0, 1, 1,
0.1147564, -0.2308363, 3.186034, 0, 0, 0, 1, 1,
0.1164042, 0.3793753, 0.7571867, 0, 0, 0, 1, 1,
0.1175152, -0.2932359, 2.944216, 0, 0, 0, 1, 1,
0.1182975, -0.2057061, 2.625073, 0, 0, 0, 1, 1,
0.1225749, -0.5100414, 3.423866, 0, 0, 0, 1, 1,
0.1273093, -0.1000807, 3.506435, 0, 0, 0, 1, 1,
0.133694, 0.4556718, 0.4531589, 1, 1, 1, 1, 1,
0.1365833, -1.414786, 4.322722, 1, 1, 1, 1, 1,
0.138305, 2.254789, -0.1167882, 1, 1, 1, 1, 1,
0.1387861, -2.016553, 4.885787, 1, 1, 1, 1, 1,
0.1392261, -0.3165944, 2.247412, 1, 1, 1, 1, 1,
0.1445726, 0.5638003, 0.8766236, 1, 1, 1, 1, 1,
0.1527628, -1.449255, 3.515642, 1, 1, 1, 1, 1,
0.157382, 1.185444, 1.299879, 1, 1, 1, 1, 1,
0.157468, -0.6873122, 2.677528, 1, 1, 1, 1, 1,
0.1618087, -0.04276188, 0.03759366, 1, 1, 1, 1, 1,
0.1641168, -0.7186973, 3.313978, 1, 1, 1, 1, 1,
0.1669742, -1.245486, 2.194367, 1, 1, 1, 1, 1,
0.1723026, -0.7363998, 3.162427, 1, 1, 1, 1, 1,
0.1735524, 0.6845529, -0.2539272, 1, 1, 1, 1, 1,
0.1756154, 0.5979094, 1.570883, 1, 1, 1, 1, 1,
0.1756428, -2.16898, 4.061141, 0, 0, 1, 1, 1,
0.1808896, -1.412153, 3.114879, 1, 0, 0, 1, 1,
0.1841677, 0.6656854, 0.5488724, 1, 0, 0, 1, 1,
0.1842896, -1.779612, 2.701267, 1, 0, 0, 1, 1,
0.1881678, 1.914468, -0.4755484, 1, 0, 0, 1, 1,
0.1936926, -0.02401173, 0.9408913, 1, 0, 0, 1, 1,
0.2140439, -0.03976332, 2.272888, 0, 0, 0, 1, 1,
0.2145001, -0.2156247, 1.631118, 0, 0, 0, 1, 1,
0.214982, 0.01659922, -0.3196104, 0, 0, 0, 1, 1,
0.2169029, -0.07016177, 1.802141, 0, 0, 0, 1, 1,
0.2184573, 0.6433545, -0.2069588, 0, 0, 0, 1, 1,
0.2241539, 0.582392, 1.350311, 0, 0, 0, 1, 1,
0.224191, 0.8348313, 0.5470858, 0, 0, 0, 1, 1,
0.2287059, -0.4003243, 1.816675, 1, 1, 1, 1, 1,
0.231104, 0.1539263, -0.4982539, 1, 1, 1, 1, 1,
0.2332215, 0.3178336, 3.178586, 1, 1, 1, 1, 1,
0.2363597, -2.197198, 3.070734, 1, 1, 1, 1, 1,
0.2364064, 0.9816651, 0.5795919, 1, 1, 1, 1, 1,
0.2375282, 0.9528034, -1.484937, 1, 1, 1, 1, 1,
0.2375668, -0.519365, 3.445548, 1, 1, 1, 1, 1,
0.2402915, 2.374978, 1.299188, 1, 1, 1, 1, 1,
0.2412046, -0.7022588, 5.42879, 1, 1, 1, 1, 1,
0.2422778, 1.349951, -1.088497, 1, 1, 1, 1, 1,
0.2436651, -0.6219854, 3.70681, 1, 1, 1, 1, 1,
0.2536629, -1.286705, 4.029244, 1, 1, 1, 1, 1,
0.2563924, 1.096498, -1.038413, 1, 1, 1, 1, 1,
0.2585928, 0.648855, -0.7841279, 1, 1, 1, 1, 1,
0.2624741, 1.939156, -1.127601, 1, 1, 1, 1, 1,
0.2637002, 2.142682, -0.139726, 0, 0, 1, 1, 1,
0.26651, -0.7744102, 0.9098497, 1, 0, 0, 1, 1,
0.2712363, -0.7251768, 2.617815, 1, 0, 0, 1, 1,
0.2715414, -0.7869035, 1.960493, 1, 0, 0, 1, 1,
0.2718704, -1.53331, 2.639249, 1, 0, 0, 1, 1,
0.2724092, -1.31986, 2.432937, 1, 0, 0, 1, 1,
0.2748898, 0.8514, -0.5744244, 0, 0, 0, 1, 1,
0.2750626, -0.9959164, 2.715027, 0, 0, 0, 1, 1,
0.2760068, 0.006401473, 0.548324, 0, 0, 0, 1, 1,
0.2773996, -0.6029298, 2.28168, 0, 0, 0, 1, 1,
0.2845666, 1.764532, -1.987348, 0, 0, 0, 1, 1,
0.2869574, 1.060477, -1.37536, 0, 0, 0, 1, 1,
0.2960736, -1.252873, 3.074436, 0, 0, 0, 1, 1,
0.296542, -2.07076, 3.621963, 1, 1, 1, 1, 1,
0.2990557, -0.6617306, 3.611145, 1, 1, 1, 1, 1,
0.2999441, 0.0249084, 2.200124, 1, 1, 1, 1, 1,
0.307743, -0.8662181, 2.132532, 1, 1, 1, 1, 1,
0.313031, -1.14622, 1.923062, 1, 1, 1, 1, 1,
0.3154294, -0.5795243, 4.132065, 1, 1, 1, 1, 1,
0.3156126, 0.6213436, 1.994137, 1, 1, 1, 1, 1,
0.3158042, 0.4774733, 0.2659099, 1, 1, 1, 1, 1,
0.3159647, -1.445662, 2.867303, 1, 1, 1, 1, 1,
0.3196467, 0.09322168, 1.121446, 1, 1, 1, 1, 1,
0.3200434, 0.9301703, -1.191209, 1, 1, 1, 1, 1,
0.3200729, -0.8625872, 3.355751, 1, 1, 1, 1, 1,
0.3365486, 0.1060888, 1.331607, 1, 1, 1, 1, 1,
0.3367409, -1.622055, 2.338486, 1, 1, 1, 1, 1,
0.3372452, -0.8084462, 4.375251, 1, 1, 1, 1, 1,
0.3377711, 0.5353894, -0.1875822, 0, 0, 1, 1, 1,
0.3401685, -0.1260286, 2.409679, 1, 0, 0, 1, 1,
0.3402832, 0.9326574, -0.8495343, 1, 0, 0, 1, 1,
0.3414549, -0.8068888, 3.040319, 1, 0, 0, 1, 1,
0.3436053, 0.4974893, 1.781067, 1, 0, 0, 1, 1,
0.3501646, -0.9878606, 4.975492, 1, 0, 0, 1, 1,
0.3506949, -1.01566, 2.929521, 0, 0, 0, 1, 1,
0.3562232, -1.777531, 1.446386, 0, 0, 0, 1, 1,
0.3570264, 1.110355, -0.6776236, 0, 0, 0, 1, 1,
0.3570517, -0.5938798, 1.451255, 0, 0, 0, 1, 1,
0.3570757, 1.765098, -0.2997123, 0, 0, 0, 1, 1,
0.3591227, 2.401284, 0.9592661, 0, 0, 0, 1, 1,
0.3668032, 0.1209111, 0.3232161, 0, 0, 0, 1, 1,
0.3726238, 0.6749741, -1.763904, 1, 1, 1, 1, 1,
0.3740237, 1.548308, 1.02704, 1, 1, 1, 1, 1,
0.3750377, 0.1848116, 0.7941782, 1, 1, 1, 1, 1,
0.376258, 0.6348994, 1.31375, 1, 1, 1, 1, 1,
0.3793858, -0.1308041, 2.399384, 1, 1, 1, 1, 1,
0.3794061, -0.6219069, 1.036356, 1, 1, 1, 1, 1,
0.3817918, -1.054989, 3.11956, 1, 1, 1, 1, 1,
0.3842165, 0.8091234, -0.314238, 1, 1, 1, 1, 1,
0.3848656, 1.272187, 1.921433, 1, 1, 1, 1, 1,
0.3879628, 0.8373635, -0.240698, 1, 1, 1, 1, 1,
0.3896603, -1.037619, 1.827466, 1, 1, 1, 1, 1,
0.3953097, 0.0460182, 1.070663, 1, 1, 1, 1, 1,
0.3967171, -0.8220056, 2.65102, 1, 1, 1, 1, 1,
0.3994859, -0.4877743, 2.759519, 1, 1, 1, 1, 1,
0.3996016, -0.226344, 2.542321, 1, 1, 1, 1, 1,
0.4013882, -0.7622113, 2.54026, 0, 0, 1, 1, 1,
0.4055382, -1.591392, 2.92211, 1, 0, 0, 1, 1,
0.4055825, -0.6732488, 3.395931, 1, 0, 0, 1, 1,
0.4136255, 1.162503, 0.1365394, 1, 0, 0, 1, 1,
0.41989, 0.09171697, 0.8482004, 1, 0, 0, 1, 1,
0.4226821, 0.5477707, 0.8956271, 1, 0, 0, 1, 1,
0.4321221, -0.2339092, 1.376368, 0, 0, 0, 1, 1,
0.4331746, -0.003266836, 2.550765, 0, 0, 0, 1, 1,
0.4341726, 0.4281942, 1.424727, 0, 0, 0, 1, 1,
0.4347514, 0.293665, 1.290444, 0, 0, 0, 1, 1,
0.4357983, 1.444985, 0.1919992, 0, 0, 0, 1, 1,
0.4427876, 1.73742, -0.1339139, 0, 0, 0, 1, 1,
0.4430602, -0.5603949, 2.662442, 0, 0, 0, 1, 1,
0.4483162, -0.7866908, 1.840055, 1, 1, 1, 1, 1,
0.4531806, 0.900175, 1.476951, 1, 1, 1, 1, 1,
0.4546563, -0.3321847, 3.22675, 1, 1, 1, 1, 1,
0.4587862, 0.1238111, 0.9046098, 1, 1, 1, 1, 1,
0.4610555, -1.346031, 1.93287, 1, 1, 1, 1, 1,
0.465187, 1.526327, 1.920601, 1, 1, 1, 1, 1,
0.4671799, -0.6839157, 2.730518, 1, 1, 1, 1, 1,
0.4687574, -2.326683, 4.4533, 1, 1, 1, 1, 1,
0.4714402, 0.09612289, 4.48623, 1, 1, 1, 1, 1,
0.4715471, -0.8131095, 2.107552, 1, 1, 1, 1, 1,
0.4744522, 0.6928613, 1.499235, 1, 1, 1, 1, 1,
0.4758327, 0.9112402, -0.1182703, 1, 1, 1, 1, 1,
0.4795367, 0.2722114, 0.9690695, 1, 1, 1, 1, 1,
0.4797772, 1.251355, -0.05499891, 1, 1, 1, 1, 1,
0.4823919, -0.6617185, 2.186392, 1, 1, 1, 1, 1,
0.4838243, 0.8458045, 0.03919877, 0, 0, 1, 1, 1,
0.4855239, 0.6221729, -0.1685754, 1, 0, 0, 1, 1,
0.4875238, 1.535982, 0.7454153, 1, 0, 0, 1, 1,
0.4895227, 0.2469349, 1.04861, 1, 0, 0, 1, 1,
0.4925384, 1.079191, -0.6372736, 1, 0, 0, 1, 1,
0.4936689, -1.53748, 1.869611, 1, 0, 0, 1, 1,
0.4938266, 0.7903004, 1.907247, 0, 0, 0, 1, 1,
0.4946536, -1.20444, 2.080202, 0, 0, 0, 1, 1,
0.4971578, 0.7385952, 0.5283133, 0, 0, 0, 1, 1,
0.5005937, 0.7654562, 2.438937, 0, 0, 0, 1, 1,
0.5017504, 0.9204873, 2.06399, 0, 0, 0, 1, 1,
0.5037963, 0.09091647, 0.6974657, 0, 0, 0, 1, 1,
0.5046034, -0.516684, 1.635058, 0, 0, 0, 1, 1,
0.5060534, 2.863632, 0.5877407, 1, 1, 1, 1, 1,
0.5063214, -0.3016011, 3.328994, 1, 1, 1, 1, 1,
0.5091634, 0.7565699, 3.36555, 1, 1, 1, 1, 1,
0.5122872, 0.2136717, 1.863326, 1, 1, 1, 1, 1,
0.5126008, -0.6457247, 1.867396, 1, 1, 1, 1, 1,
0.5138146, -2.168241, 2.468508, 1, 1, 1, 1, 1,
0.5169611, 0.01592707, 1.905544, 1, 1, 1, 1, 1,
0.5178145, 0.512886, -1.049234, 1, 1, 1, 1, 1,
0.5183983, 0.7311108, 1.614112, 1, 1, 1, 1, 1,
0.5257134, -0.7749628, 3.892773, 1, 1, 1, 1, 1,
0.5302643, 1.098361, 1.750918, 1, 1, 1, 1, 1,
0.5362241, 0.4397054, 0.09260843, 1, 1, 1, 1, 1,
0.5368534, -0.5534509, 3.105791, 1, 1, 1, 1, 1,
0.5391822, -1.715839, 3.026089, 1, 1, 1, 1, 1,
0.5446072, -1.259184, 2.791749, 1, 1, 1, 1, 1,
0.5452148, 0.5084479, -0.8225518, 0, 0, 1, 1, 1,
0.5454547, 1.594472, -0.1426745, 1, 0, 0, 1, 1,
0.5463559, 0.1335992, 0.7989316, 1, 0, 0, 1, 1,
0.5487214, -2.060323, 2.592305, 1, 0, 0, 1, 1,
0.5498185, 0.446586, 0.4157213, 1, 0, 0, 1, 1,
0.5532126, -0.3775282, 1.90638, 1, 0, 0, 1, 1,
0.5538786, -0.1930795, 1.072402, 0, 0, 0, 1, 1,
0.5561011, 1.137776, -0.9741995, 0, 0, 0, 1, 1,
0.557944, -1.262523, 0.7534921, 0, 0, 0, 1, 1,
0.5582268, 0.1000703, 2.122945, 0, 0, 0, 1, 1,
0.567231, 1.26323, 1.196804, 0, 0, 0, 1, 1,
0.575933, 0.9172959, 1.162963, 0, 0, 0, 1, 1,
0.5812192, 0.01325306, 2.129233, 0, 0, 0, 1, 1,
0.5850081, 0.1890747, 1.579733, 1, 1, 1, 1, 1,
0.5909621, -0.2040434, 0.502515, 1, 1, 1, 1, 1,
0.5938675, -1.51234, 1.334592, 1, 1, 1, 1, 1,
0.6026603, -0.5814736, 3.520516, 1, 1, 1, 1, 1,
0.6033549, -0.4119636, 1.988559, 1, 1, 1, 1, 1,
0.604285, -0.677977, 1.607367, 1, 1, 1, 1, 1,
0.6109171, 1.432826, -0.2936082, 1, 1, 1, 1, 1,
0.6205318, 0.3022206, 0.7862489, 1, 1, 1, 1, 1,
0.6301148, -1.110041, 3.058049, 1, 1, 1, 1, 1,
0.6303315, 0.8084264, 1.581364, 1, 1, 1, 1, 1,
0.6312466, -1.350275, 3.162333, 1, 1, 1, 1, 1,
0.6328728, -0.6761417, 3.18823, 1, 1, 1, 1, 1,
0.6336536, 1.523276, 0.88361, 1, 1, 1, 1, 1,
0.6355774, -0.1088346, 2.215927, 1, 1, 1, 1, 1,
0.640874, -0.8746105, 1.713577, 1, 1, 1, 1, 1,
0.6425272, 1.840556, 0.539949, 0, 0, 1, 1, 1,
0.6445891, 0.05599121, 0.6735626, 1, 0, 0, 1, 1,
0.6446806, -0.4484167, 2.535533, 1, 0, 0, 1, 1,
0.6452014, -0.2874108, 1.422708, 1, 0, 0, 1, 1,
0.6481753, 0.018652, 2.490617, 1, 0, 0, 1, 1,
0.6521423, -0.1819912, 1.838838, 1, 0, 0, 1, 1,
0.6535907, -0.249525, 3.673428, 0, 0, 0, 1, 1,
0.6552896, 0.1896344, 2.749776, 0, 0, 0, 1, 1,
0.6610105, -0.1076726, 2.022012, 0, 0, 0, 1, 1,
0.6657068, -1.360325, 2.385027, 0, 0, 0, 1, 1,
0.6721575, -0.7629508, 1.938673, 0, 0, 0, 1, 1,
0.6739339, -0.5138928, 3.595924, 0, 0, 0, 1, 1,
0.678043, -0.08326107, 2.73867, 0, 0, 0, 1, 1,
0.6792232, -2.056727, 2.917492, 1, 1, 1, 1, 1,
0.6792453, 0.7787127, 1.970732, 1, 1, 1, 1, 1,
0.6794357, 0.3223528, 1.738313, 1, 1, 1, 1, 1,
0.6815412, 0.1720611, 0.4405349, 1, 1, 1, 1, 1,
0.688054, 0.9607434, 2.688435, 1, 1, 1, 1, 1,
0.6920114, -1.427797, 2.285614, 1, 1, 1, 1, 1,
0.6928023, -0.2702499, 2.531715, 1, 1, 1, 1, 1,
0.6939731, -1.196562, 2.61013, 1, 1, 1, 1, 1,
0.6949237, 1.446254, 0.5855452, 1, 1, 1, 1, 1,
0.7073514, 0.4864197, 3.364853, 1, 1, 1, 1, 1,
0.7091517, -1.05319, 1.3344, 1, 1, 1, 1, 1,
0.7111989, -0.3330062, 1.219577, 1, 1, 1, 1, 1,
0.7122247, 0.3627667, 2.663755, 1, 1, 1, 1, 1,
0.7134392, -0.1354505, 2.264187, 1, 1, 1, 1, 1,
0.716667, -1.224017, 2.516815, 1, 1, 1, 1, 1,
0.7261914, 1.549874, 1.837695, 0, 0, 1, 1, 1,
0.7270312, -0.6046768, 2.616296, 1, 0, 0, 1, 1,
0.730011, 0.7949095, -1.22269, 1, 0, 0, 1, 1,
0.7345422, -1.426633, 2.401098, 1, 0, 0, 1, 1,
0.7412043, -0.2926179, 2.600225, 1, 0, 0, 1, 1,
0.7439834, 1.290908, -1.271226, 1, 0, 0, 1, 1,
0.7441304, -1.508355, 2.560843, 0, 0, 0, 1, 1,
0.7505841, -0.1241094, 1.78751, 0, 0, 0, 1, 1,
0.7510681, 0.1125248, 2.369537, 0, 0, 0, 1, 1,
0.7513986, 0.2607173, 1.696206, 0, 0, 0, 1, 1,
0.7517986, -0.7472987, 0.4028388, 0, 0, 0, 1, 1,
0.7535592, -0.5362492, 1.271945, 0, 0, 0, 1, 1,
0.7571844, 0.566368, 1.612837, 0, 0, 0, 1, 1,
0.7586079, 0.5426279, 1.342982, 1, 1, 1, 1, 1,
0.7608198, 0.7608096, 0.6505483, 1, 1, 1, 1, 1,
0.7628169, -2.152655, 3.075815, 1, 1, 1, 1, 1,
0.7638859, -1.300101, 1.043238, 1, 1, 1, 1, 1,
0.7678243, -0.9476447, 1.422298, 1, 1, 1, 1, 1,
0.7734063, -0.8766782, 1.268915, 1, 1, 1, 1, 1,
0.7790976, -0.353741, 0.3533105, 1, 1, 1, 1, 1,
0.7793247, 0.99016, 2.311074, 1, 1, 1, 1, 1,
0.7827383, -0.7237886, 1.999052, 1, 1, 1, 1, 1,
0.7838778, 0.4762696, -1.159661, 1, 1, 1, 1, 1,
0.7860349, 0.4510176, -0.03813447, 1, 1, 1, 1, 1,
0.7886986, 0.3004133, 2.878533, 1, 1, 1, 1, 1,
0.7906496, 0.1077262, 1.985414, 1, 1, 1, 1, 1,
0.7918768, -1.072499, 2.155955, 1, 1, 1, 1, 1,
0.795073, -0.5999064, 2.852087, 1, 1, 1, 1, 1,
0.7953166, -0.5085578, 1.821719, 0, 0, 1, 1, 1,
0.7961099, -0.6330879, 1.546428, 1, 0, 0, 1, 1,
0.7963268, -0.4583187, 2.792233, 1, 0, 0, 1, 1,
0.8022287, 0.1000315, 0.7667997, 1, 0, 0, 1, 1,
0.803457, 0.8038352, 1.092006, 1, 0, 0, 1, 1,
0.8061886, -0.4952411, 1.296767, 1, 0, 0, 1, 1,
0.8070757, -0.8455237, 3.733684, 0, 0, 0, 1, 1,
0.8129218, -1.774063, 1.482529, 0, 0, 0, 1, 1,
0.817426, 0.803765, 0.806327, 0, 0, 0, 1, 1,
0.8242407, 0.6662825, 0.4845162, 0, 0, 0, 1, 1,
0.8246632, 0.7492124, 1.373728, 0, 0, 0, 1, 1,
0.8282593, -1.561922, 1.975621, 0, 0, 0, 1, 1,
0.8328431, -0.4052279, 2.743873, 0, 0, 0, 1, 1,
0.833951, -0.9346354, 3.400115, 1, 1, 1, 1, 1,
0.8340515, -3.336969, 2.770447, 1, 1, 1, 1, 1,
0.8375759, 1.873334, 1.928466, 1, 1, 1, 1, 1,
0.8381187, 1.34268, -0.02628504, 1, 1, 1, 1, 1,
0.8400487, 1.300215, -0.3075025, 1, 1, 1, 1, 1,
0.8445012, -1.044148, 2.722977, 1, 1, 1, 1, 1,
0.8458234, -0.07015368, 0.9300362, 1, 1, 1, 1, 1,
0.8478063, -0.1860457, 2.642129, 1, 1, 1, 1, 1,
0.8499237, 0.262498, 2.484203, 1, 1, 1, 1, 1,
0.8570701, 0.4121913, 1.016657, 1, 1, 1, 1, 1,
0.8572689, 1.159218, -0.6052909, 1, 1, 1, 1, 1,
0.85727, 0.751857, 0.1657499, 1, 1, 1, 1, 1,
0.8581107, 0.6700406, 0.2595759, 1, 1, 1, 1, 1,
0.8591015, 0.9761235, 2.216367, 1, 1, 1, 1, 1,
0.864181, -1.312214, 1.593523, 1, 1, 1, 1, 1,
0.8698696, 1.957931, 0.7239954, 0, 0, 1, 1, 1,
0.8726248, 1.178752, 2.111537, 1, 0, 0, 1, 1,
0.8746201, 1.537252, 4.09228, 1, 0, 0, 1, 1,
0.8767421, -1.486339, 2.49014, 1, 0, 0, 1, 1,
0.8789411, 0.5633318, 1.753836, 1, 0, 0, 1, 1,
0.8811788, -0.7423884, 0.4530832, 1, 0, 0, 1, 1,
0.8816241, -0.627245, 2.367869, 0, 0, 0, 1, 1,
0.8822542, 0.1401063, 2.551266, 0, 0, 0, 1, 1,
0.8840939, -0.04760388, 1.096307, 0, 0, 0, 1, 1,
0.8851092, -0.4050927, 2.631526, 0, 0, 0, 1, 1,
0.889254, 0.5876117, 1.372343, 0, 0, 0, 1, 1,
0.8907719, 1.053467, 0.5928315, 0, 0, 0, 1, 1,
0.8910042, -1.954966, 2.323275, 0, 0, 0, 1, 1,
0.8913537, 0.3272196, 1.957015, 1, 1, 1, 1, 1,
0.8924294, 0.7680864, 1.815791, 1, 1, 1, 1, 1,
0.907196, -0.9576089, 2.744361, 1, 1, 1, 1, 1,
0.9094313, 1.210454, -0.515731, 1, 1, 1, 1, 1,
0.9102345, -0.1601627, 3.947999, 1, 1, 1, 1, 1,
0.9166213, -1.001495, 0.8125927, 1, 1, 1, 1, 1,
0.9175251, 0.446806, 1.670194, 1, 1, 1, 1, 1,
0.9234864, -1.477331, 1.743213, 1, 1, 1, 1, 1,
0.9274994, 0.9302251, 0.8706825, 1, 1, 1, 1, 1,
0.9280155, -1.161029, 3.450897, 1, 1, 1, 1, 1,
0.9308165, -0.8389201, 1.396563, 1, 1, 1, 1, 1,
0.9310536, 0.5063031, 1.22959, 1, 1, 1, 1, 1,
0.9313034, -0.3957226, 1.627947, 1, 1, 1, 1, 1,
0.9315502, -0.6504835, 1.949904, 1, 1, 1, 1, 1,
0.9322289, -0.09282803, 2.662186, 1, 1, 1, 1, 1,
0.9399769, -0.1736105, -0.1899574, 0, 0, 1, 1, 1,
0.9411719, -0.2096404, 2.096049, 1, 0, 0, 1, 1,
0.9473765, 0.9173694, -0.101447, 1, 0, 0, 1, 1,
0.9537054, 0.9923041, 0.325052, 1, 0, 0, 1, 1,
0.9537425, 0.3005452, 2.010236, 1, 0, 0, 1, 1,
0.9557312, 0.8823826, 1.185467, 1, 0, 0, 1, 1,
0.9559246, 0.2606697, 1.607899, 0, 0, 0, 1, 1,
0.9677806, 1.111079, 0.09943397, 0, 0, 0, 1, 1,
0.9687617, 0.5900709, 0.9065224, 0, 0, 0, 1, 1,
0.9687628, -0.6549449, 3.020467, 0, 0, 0, 1, 1,
0.970206, -0.6768352, 1.886529, 0, 0, 0, 1, 1,
0.9702089, -0.790749, 2.287721, 0, 0, 0, 1, 1,
0.9707527, -0.8011374, 1.869195, 0, 0, 0, 1, 1,
0.9747787, 1.783224, -0.6577283, 1, 1, 1, 1, 1,
0.979234, -1.767654, 0.6837409, 1, 1, 1, 1, 1,
0.9819383, 0.2789639, 2.523843, 1, 1, 1, 1, 1,
0.9828854, -1.492916, 2.9274, 1, 1, 1, 1, 1,
0.9940486, -0.4011176, 2.2037, 1, 1, 1, 1, 1,
1.003614, 1.727513, 1.015458, 1, 1, 1, 1, 1,
1.006094, 0.06853603, 0.5754718, 1, 1, 1, 1, 1,
1.011574, -1.144391, 2.020478, 1, 1, 1, 1, 1,
1.01247, 0.8354326, 1.377049, 1, 1, 1, 1, 1,
1.019063, 1.031614, 0.1613236, 1, 1, 1, 1, 1,
1.023391, 1.152372, -0.5393081, 1, 1, 1, 1, 1,
1.02686, 0.4492748, 2.402899, 1, 1, 1, 1, 1,
1.027522, -0.4222644, 3.002389, 1, 1, 1, 1, 1,
1.027622, -1.15459, 1.224245, 1, 1, 1, 1, 1,
1.033929, 0.3013927, 0.4625043, 1, 1, 1, 1, 1,
1.034258, 0.7111056, 2.238029, 0, 0, 1, 1, 1,
1.051995, 0.6282412, 1.36259, 1, 0, 0, 1, 1,
1.053625, 0.2116858, 3.071196, 1, 0, 0, 1, 1,
1.057867, -0.5873216, 2.456603, 1, 0, 0, 1, 1,
1.062033, -0.678674, 1.721457, 1, 0, 0, 1, 1,
1.067616, -0.8962299, 2.406573, 1, 0, 0, 1, 1,
1.070658, -0.4135734, 1.802228, 0, 0, 0, 1, 1,
1.072733, 1.268786, 0.3830914, 0, 0, 0, 1, 1,
1.078773, -0.8397926, 2.573724, 0, 0, 0, 1, 1,
1.084903, 1.025848, 0.3560135, 0, 0, 0, 1, 1,
1.088002, -1.024905, 1.844019, 0, 0, 0, 1, 1,
1.090778, -0.0397468, 2.444864, 0, 0, 0, 1, 1,
1.09876, -0.3005761, 2.203527, 0, 0, 0, 1, 1,
1.099733, 0.3613288, 1.036194, 1, 1, 1, 1, 1,
1.104452, -0.003250507, 3.982116, 1, 1, 1, 1, 1,
1.108142, 2.232589, 0.7231218, 1, 1, 1, 1, 1,
1.113271, -0.3659345, 1.46385, 1, 1, 1, 1, 1,
1.117111, -0.07419971, 4.472356, 1, 1, 1, 1, 1,
1.132157, -0.5171914, 1.427119, 1, 1, 1, 1, 1,
1.132385, -1.49437, 2.987621, 1, 1, 1, 1, 1,
1.141753, 1.865781, -0.8406855, 1, 1, 1, 1, 1,
1.15512, -1.128926, 3.314895, 1, 1, 1, 1, 1,
1.163954, -0.7423422, 2.733652, 1, 1, 1, 1, 1,
1.167271, 1.267331, 1.676028, 1, 1, 1, 1, 1,
1.175048, 0.3650074, 2.112489, 1, 1, 1, 1, 1,
1.179147, -0.4177109, 1.633092, 1, 1, 1, 1, 1,
1.194897, -0.6061095, 2.943914, 1, 1, 1, 1, 1,
1.197268, -0.1916681, 2.37409, 1, 1, 1, 1, 1,
1.200165, 1.191723, 0.5661255, 0, 0, 1, 1, 1,
1.203008, -0.5804614, 1.374608, 1, 0, 0, 1, 1,
1.229032, -0.5910586, 2.313143, 1, 0, 0, 1, 1,
1.22949, 1.424421, 0.1948584, 1, 0, 0, 1, 1,
1.230501, -0.9531748, 3.531401, 1, 0, 0, 1, 1,
1.233835, 0.02766952, 0.9857076, 1, 0, 0, 1, 1,
1.239329, 1.177912, -1.727747, 0, 0, 0, 1, 1,
1.242338, -0.5436282, 1.403849, 0, 0, 0, 1, 1,
1.245327, -0.844008, 2.545533, 0, 0, 0, 1, 1,
1.249502, 0.9806473, 2.131527, 0, 0, 0, 1, 1,
1.253475, 2.139445, 1.524608, 0, 0, 0, 1, 1,
1.253711, 0.05507467, 2.700413, 0, 0, 0, 1, 1,
1.256221, 0.6507297, -0.328775, 0, 0, 0, 1, 1,
1.259742, 0.4300611, 2.848504, 1, 1, 1, 1, 1,
1.263154, -2.197264, 4.476974, 1, 1, 1, 1, 1,
1.269867, 0.5715776, 0.426867, 1, 1, 1, 1, 1,
1.269984, -0.5213768, 1.815898, 1, 1, 1, 1, 1,
1.270319, 0.116132, 1.119552, 1, 1, 1, 1, 1,
1.270726, 1.160934, 1.900977, 1, 1, 1, 1, 1,
1.273639, -1.237409, 2.905071, 1, 1, 1, 1, 1,
1.273945, 1.078158, -0.1457086, 1, 1, 1, 1, 1,
1.275684, 0.3139223, 2.172807, 1, 1, 1, 1, 1,
1.278582, -0.485473, 3.484256, 1, 1, 1, 1, 1,
1.281504, 0.06428567, 1.708654, 1, 1, 1, 1, 1,
1.285977, -0.8857023, 2.102126, 1, 1, 1, 1, 1,
1.287266, 0.618002, -1.027422, 1, 1, 1, 1, 1,
1.298962, -1.113451, 2.852397, 1, 1, 1, 1, 1,
1.304665, -0.1739894, 2.860604, 1, 1, 1, 1, 1,
1.308118, 0.3289605, 2.338573, 0, 0, 1, 1, 1,
1.311606, -0.4980602, 2.25686, 1, 0, 0, 1, 1,
1.312414, 0.3496803, 0.7621642, 1, 0, 0, 1, 1,
1.326956, -0.1588921, 2.321802, 1, 0, 0, 1, 1,
1.327887, -0.197387, 3.093634, 1, 0, 0, 1, 1,
1.333601, -0.1622693, 4.21773, 1, 0, 0, 1, 1,
1.337131, -0.7896594, 2.813868, 0, 0, 0, 1, 1,
1.339619, 1.278455, 0.4703263, 0, 0, 0, 1, 1,
1.339832, 1.324851, 2.408364, 0, 0, 0, 1, 1,
1.344659, 0.06641289, 2.758751, 0, 0, 0, 1, 1,
1.356427, 1.254138, 2.103024, 0, 0, 0, 1, 1,
1.357918, -0.5549369, 3.344464, 0, 0, 0, 1, 1,
1.358328, -0.7723824, 3.09423, 0, 0, 0, 1, 1,
1.362512, -1.998096, 1.232443, 1, 1, 1, 1, 1,
1.364282, -1.188463, 1.377829, 1, 1, 1, 1, 1,
1.386027, -0.7876729, 3.1132, 1, 1, 1, 1, 1,
1.395489, -1.028825, 2.944808, 1, 1, 1, 1, 1,
1.399513, -1.353688, 3.127317, 1, 1, 1, 1, 1,
1.401948, -0.2509544, 2.684366, 1, 1, 1, 1, 1,
1.402062, 1.809764, 2.43243, 1, 1, 1, 1, 1,
1.403501, 0.9889336, 0.3796051, 1, 1, 1, 1, 1,
1.407152, 0.709721, 1.305364, 1, 1, 1, 1, 1,
1.417369, 0.7557741, 1.560272, 1, 1, 1, 1, 1,
1.418118, 0.6948265, 0.9746321, 1, 1, 1, 1, 1,
1.432719, 0.4114365, 3.020429, 1, 1, 1, 1, 1,
1.435407, 0.4297775, 0.9509708, 1, 1, 1, 1, 1,
1.454317, -1.667828, 2.087687, 1, 1, 1, 1, 1,
1.455602, -1.204464, 3.099482, 1, 1, 1, 1, 1,
1.458445, 1.35242, -0.1693701, 0, 0, 1, 1, 1,
1.460419, 1.324569, 2.280698, 1, 0, 0, 1, 1,
1.462347, 0.2900902, 1.515783, 1, 0, 0, 1, 1,
1.473222, -0.7722843, 3.178768, 1, 0, 0, 1, 1,
1.480764, -1.138333, 2.046182, 1, 0, 0, 1, 1,
1.502762, 0.4216676, 1.877015, 1, 0, 0, 1, 1,
1.504916, -0.3843012, 1.795279, 0, 0, 0, 1, 1,
1.512214, 0.306908, 1.723957, 0, 0, 0, 1, 1,
1.51468, -1.088974, 4.264266, 0, 0, 0, 1, 1,
1.532516, -0.5319414, 2.686765, 0, 0, 0, 1, 1,
1.540003, 0.8574685, 1.299337, 0, 0, 0, 1, 1,
1.548621, -0.8009755, 3.137088, 0, 0, 0, 1, 1,
1.551068, 0.3241349, 0.1984384, 0, 0, 0, 1, 1,
1.557009, 0.7264421, -0.7674069, 1, 1, 1, 1, 1,
1.564452, 0.03132753, 0.8072334, 1, 1, 1, 1, 1,
1.56521, -0.7983171, 0.9124727, 1, 1, 1, 1, 1,
1.56669, -0.05383457, 0.8462723, 1, 1, 1, 1, 1,
1.57556, -0.5643488, 1.177865, 1, 1, 1, 1, 1,
1.577597, -0.6421419, -0.251126, 1, 1, 1, 1, 1,
1.59066, 0.006027034, 1.566026, 1, 1, 1, 1, 1,
1.594613, 0.5407635, 0.1120402, 1, 1, 1, 1, 1,
1.597785, 0.1062422, 0.04122324, 1, 1, 1, 1, 1,
1.599421, -1.400666, 2.491538, 1, 1, 1, 1, 1,
1.603957, -0.6825212, 0.7112305, 1, 1, 1, 1, 1,
1.608831, 1.154625, -0.01771509, 1, 1, 1, 1, 1,
1.609978, -0.104533, 3.578035, 1, 1, 1, 1, 1,
1.610639, 1.60107, 1.619182, 1, 1, 1, 1, 1,
1.61925, -0.3302052, 1.080307, 1, 1, 1, 1, 1,
1.62143, -0.1955643, 1.520173, 0, 0, 1, 1, 1,
1.664606, 0.7171851, 1.581271, 1, 0, 0, 1, 1,
1.691244, -2.027556, 2.245126, 1, 0, 0, 1, 1,
1.702002, 1.522296, 0.2171964, 1, 0, 0, 1, 1,
1.715858, -0.9478335, 3.143597, 1, 0, 0, 1, 1,
1.718464, 0.4694167, 2.532368, 1, 0, 0, 1, 1,
1.722885, 1.286075, 0.7185097, 0, 0, 0, 1, 1,
1.746048, -0.070274, 1.248138, 0, 0, 0, 1, 1,
1.752082, 1.983461, 1.307615, 0, 0, 0, 1, 1,
1.754022, 0.476682, 3.096802, 0, 0, 0, 1, 1,
1.755722, 1.64765, 1.21126, 0, 0, 0, 1, 1,
1.762043, -1.568347, 2.81249, 0, 0, 0, 1, 1,
1.789726, -1.311248, 1.46382, 0, 0, 0, 1, 1,
1.790789, -1.435167, 1.965724, 1, 1, 1, 1, 1,
1.795248, 1.09833, 1.329816, 1, 1, 1, 1, 1,
1.813797, -0.01244346, 1.85601, 1, 1, 1, 1, 1,
1.816098, 0.4573674, 1.322016, 1, 1, 1, 1, 1,
1.819927, 0.6568434, 2.507026, 1, 1, 1, 1, 1,
1.827189, -0.340573, 3.594252, 1, 1, 1, 1, 1,
1.836467, -0.3986625, 1.766372, 1, 1, 1, 1, 1,
1.856009, 1.071274, 2.404995, 1, 1, 1, 1, 1,
1.870814, 1.23192, -1.013327, 1, 1, 1, 1, 1,
1.877161, -1.315069, 3.462253, 1, 1, 1, 1, 1,
1.884478, -1.060379, 1.063083, 1, 1, 1, 1, 1,
1.912586, 0.01821409, 0.9048468, 1, 1, 1, 1, 1,
1.930522, -0.4632708, 1.085136, 1, 1, 1, 1, 1,
1.950405, -1.066507, 1.029182, 1, 1, 1, 1, 1,
1.96999, -1.912128, 2.634499, 1, 1, 1, 1, 1,
2.004952, -0.0004137452, 2.065453, 0, 0, 1, 1, 1,
2.013413, -0.1039816, 1.796946, 1, 0, 0, 1, 1,
2.0224, -0.06120915, -0.4027205, 1, 0, 0, 1, 1,
2.050938, -1.05739, 1.079126, 1, 0, 0, 1, 1,
2.064613, -1.372154, 2.431649, 1, 0, 0, 1, 1,
2.095134, 0.2088775, 2.734849, 1, 0, 0, 1, 1,
2.116674, 2.326801, 0.358925, 0, 0, 0, 1, 1,
2.128731, -0.4044789, 1.932263, 0, 0, 0, 1, 1,
2.14766, 0.6702107, 1.15031, 0, 0, 0, 1, 1,
2.158371, 1.365368, -0.09908347, 0, 0, 0, 1, 1,
2.166636, 0.2910126, 1.427212, 0, 0, 0, 1, 1,
2.174031, 0.9055725, -0.1539756, 0, 0, 0, 1, 1,
2.230463, -0.4280553, 2.042449, 0, 0, 0, 1, 1,
2.380138, -0.6062424, 3.373115, 1, 1, 1, 1, 1,
2.403977, 1.249719, 1.557998, 1, 1, 1, 1, 1,
2.408535, 0.6933815, 0.7109433, 1, 1, 1, 1, 1,
2.534661, -0.6003722, 0.8445653, 1, 1, 1, 1, 1,
2.624565, -0.8647252, 2.542635, 1, 1, 1, 1, 1,
2.737967, 0.0619392, 3.367579, 1, 1, 1, 1, 1,
2.79645, 0.06131753, 0.6234022, 1, 1, 1, 1, 1
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
var radius = 9.690281;
var distance = 34.0367;
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
mvMatrix.translate( 0.2406131, 0.2211685, 0.179929 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0367);
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
