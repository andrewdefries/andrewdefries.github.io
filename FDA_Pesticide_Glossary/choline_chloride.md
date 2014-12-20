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
-2.604641, -0.6099574, -1.89475, 1, 0, 0, 1,
-2.599303, 0.07925934, -2.642226, 1, 0.007843138, 0, 1,
-2.590925, -0.3340599, -4.350606, 1, 0.01176471, 0, 1,
-2.500586, -0.02519016, -1.694374, 1, 0.01960784, 0, 1,
-2.404738, 0.01576713, 0.1643031, 1, 0.02352941, 0, 1,
-2.309668, 0.8845888, -0.2703381, 1, 0.03137255, 0, 1,
-2.294434, 0.6336961, 0.004266511, 1, 0.03529412, 0, 1,
-2.272327, 0.09067506, -1.522386, 1, 0.04313726, 0, 1,
-2.251919, 0.254909, -1.227311, 1, 0.04705882, 0, 1,
-2.248415, -0.2505999, -3.101981, 1, 0.05490196, 0, 1,
-2.232059, 0.3885208, -1.117901, 1, 0.05882353, 0, 1,
-2.225211, 0.5306023, -2.167345, 1, 0.06666667, 0, 1,
-2.212414, 1.633406, -0.315734, 1, 0.07058824, 0, 1,
-2.168203, -0.4923619, -2.388335, 1, 0.07843138, 0, 1,
-2.161527, -0.2242909, -1.579591, 1, 0.08235294, 0, 1,
-2.152946, 0.2452756, -0.8917287, 1, 0.09019608, 0, 1,
-2.151025, 0.1909082, -0.6162248, 1, 0.09411765, 0, 1,
-2.145558, -0.1883133, -2.356851, 1, 0.1019608, 0, 1,
-2.135847, -0.7219555, 0.5595282, 1, 0.1098039, 0, 1,
-2.124165, -1.632229, -1.247479, 1, 0.1137255, 0, 1,
-2.108133, -0.7248588, -1.617281, 1, 0.1215686, 0, 1,
-2.086366, 1.310695, -0.9323533, 1, 0.1254902, 0, 1,
-2.000489, 1.643504, 1.243693, 1, 0.1333333, 0, 1,
-1.977758, -0.4604684, 1.57878, 1, 0.1372549, 0, 1,
-1.973358, 1.296649, -1.669218, 1, 0.145098, 0, 1,
-1.97276, -0.3787591, -2.149094, 1, 0.1490196, 0, 1,
-1.970598, -2.065537, -3.555849, 1, 0.1568628, 0, 1,
-1.964132, -0.1057505, -0.8619112, 1, 0.1607843, 0, 1,
-1.953622, -1.321342, -2.313749, 1, 0.1686275, 0, 1,
-1.935608, -0.3570072, -1.879932, 1, 0.172549, 0, 1,
-1.927337, -0.6513325, -2.50574, 1, 0.1803922, 0, 1,
-1.865698, -1.358252, -2.169622, 1, 0.1843137, 0, 1,
-1.842535, -1.180302, -4.101064, 1, 0.1921569, 0, 1,
-1.84245, 0.07106083, -0.8242981, 1, 0.1960784, 0, 1,
-1.824488, 0.4846744, -1.371444, 1, 0.2039216, 0, 1,
-1.82337, 1.395995, -0.9425349, 1, 0.2117647, 0, 1,
-1.8227, 1.003954, -0.04471206, 1, 0.2156863, 0, 1,
-1.773604, 0.8066848, -2.741155, 1, 0.2235294, 0, 1,
-1.755909, -0.8351325, -3.73615, 1, 0.227451, 0, 1,
-1.716536, 0.3713115, -2.391448, 1, 0.2352941, 0, 1,
-1.715671, -2.061315, -0.7814619, 1, 0.2392157, 0, 1,
-1.706953, -1.378976, -1.581923, 1, 0.2470588, 0, 1,
-1.704567, 0.3457906, -1.493016, 1, 0.2509804, 0, 1,
-1.695322, 0.1367484, -3.501625, 1, 0.2588235, 0, 1,
-1.685925, 0.1819803, -0.2982176, 1, 0.2627451, 0, 1,
-1.684894, -0.7766615, -2.132756, 1, 0.2705882, 0, 1,
-1.68451, 0.3164935, -0.9705979, 1, 0.2745098, 0, 1,
-1.684133, 0.3129737, -2.84673, 1, 0.282353, 0, 1,
-1.67913, 0.01035133, -1.701727, 1, 0.2862745, 0, 1,
-1.671017, -0.1570424, -0.7070811, 1, 0.2941177, 0, 1,
-1.669914, -0.08015621, -3.653692, 1, 0.3019608, 0, 1,
-1.656104, -0.1695731, -2.360548, 1, 0.3058824, 0, 1,
-1.650944, -1.19108, -1.107029, 1, 0.3137255, 0, 1,
-1.650134, -1.197533, -3.380689, 1, 0.3176471, 0, 1,
-1.648534, 1.38108, 0.6556578, 1, 0.3254902, 0, 1,
-1.643803, -0.1567753, -0.5784408, 1, 0.3294118, 0, 1,
-1.643057, 1.203993, -1.139077, 1, 0.3372549, 0, 1,
-1.631598, 0.844168, -1.997186, 1, 0.3411765, 0, 1,
-1.624621, 0.1488557, -2.299982, 1, 0.3490196, 0, 1,
-1.619138, -0.6634253, -2.059202, 1, 0.3529412, 0, 1,
-1.614951, -0.6269861, -2.812071, 1, 0.3607843, 0, 1,
-1.613956, 1.242015, -0.1979622, 1, 0.3647059, 0, 1,
-1.610217, -1.08881, -2.590969, 1, 0.372549, 0, 1,
-1.60341, -1.559588, -3.117381, 1, 0.3764706, 0, 1,
-1.601165, 0.01388182, -4.946687, 1, 0.3843137, 0, 1,
-1.58133, 0.4659922, -1.133827, 1, 0.3882353, 0, 1,
-1.57466, 1.943521, -1.135768, 1, 0.3960784, 0, 1,
-1.574296, -2.050354, -3.963955, 1, 0.4039216, 0, 1,
-1.565487, -1.598046, -3.319896, 1, 0.4078431, 0, 1,
-1.553961, -0.3870152, -1.371715, 1, 0.4156863, 0, 1,
-1.545404, -0.2588427, -1.301026, 1, 0.4196078, 0, 1,
-1.527971, 0.9063568, 0.1852486, 1, 0.427451, 0, 1,
-1.519888, 1.36549, -0.9666622, 1, 0.4313726, 0, 1,
-1.517855, -1.893329, -1.427751, 1, 0.4392157, 0, 1,
-1.517765, -0.7684982, -0.7592413, 1, 0.4431373, 0, 1,
-1.506137, 0.1904017, -0.4270565, 1, 0.4509804, 0, 1,
-1.504972, 0.539542, -0.5873046, 1, 0.454902, 0, 1,
-1.491597, 0.789133, -1.155913, 1, 0.4627451, 0, 1,
-1.475183, -1.01719, -3.154252, 1, 0.4666667, 0, 1,
-1.475009, 0.5524129, -1.747987, 1, 0.4745098, 0, 1,
-1.470783, -1.076422, -1.332429, 1, 0.4784314, 0, 1,
-1.461242, -0.5490819, -3.042764, 1, 0.4862745, 0, 1,
-1.459734, 0.1391745, -1.229844, 1, 0.4901961, 0, 1,
-1.459271, -0.6742471, -3.08672, 1, 0.4980392, 0, 1,
-1.446791, 0.6808506, -0.565703, 1, 0.5058824, 0, 1,
-1.436963, 0.1065865, -1.416128, 1, 0.509804, 0, 1,
-1.413222, -0.6807767, -3.213986, 1, 0.5176471, 0, 1,
-1.407906, -0.2878856, -1.141895, 1, 0.5215687, 0, 1,
-1.399309, -0.7432156, -2.702463, 1, 0.5294118, 0, 1,
-1.393551, -0.3635478, -1.075905, 1, 0.5333334, 0, 1,
-1.387263, -0.2334397, -3.163766, 1, 0.5411765, 0, 1,
-1.383916, 1.857876, 1.221721, 1, 0.5450981, 0, 1,
-1.380635, 1.719163, -1.408369, 1, 0.5529412, 0, 1,
-1.375297, 0.08452082, 0.7288108, 1, 0.5568628, 0, 1,
-1.3708, 0.2628637, -0.8186926, 1, 0.5647059, 0, 1,
-1.369286, -0.6995052, -1.677865, 1, 0.5686275, 0, 1,
-1.361476, -0.2228838, -2.34005, 1, 0.5764706, 0, 1,
-1.352124, 0.5698577, -0.9066935, 1, 0.5803922, 0, 1,
-1.35168, 0.5772744, 0.4779337, 1, 0.5882353, 0, 1,
-1.341104, -0.9311586, -2.477832, 1, 0.5921569, 0, 1,
-1.336976, -1.032727, -2.675261, 1, 0.6, 0, 1,
-1.333435, -0.2437511, -2.230765, 1, 0.6078432, 0, 1,
-1.3322, -0.8116909, -2.284575, 1, 0.6117647, 0, 1,
-1.326727, -0.9366786, -1.085411, 1, 0.6196079, 0, 1,
-1.317987, -0.08176633, -2.33171, 1, 0.6235294, 0, 1,
-1.316691, 0.9019281, -0.3712573, 1, 0.6313726, 0, 1,
-1.309683, -0.402957, -1.696385, 1, 0.6352941, 0, 1,
-1.30949, -0.6060664, -1.679648, 1, 0.6431373, 0, 1,
-1.307226, 0.428266, -3.45342, 1, 0.6470588, 0, 1,
-1.28813, -0.7049353, -2.536596, 1, 0.654902, 0, 1,
-1.285035, -0.0381338, -2.602523, 1, 0.6588235, 0, 1,
-1.275354, -1.102987, -2.351857, 1, 0.6666667, 0, 1,
-1.264891, 0.06536809, -1.130757, 1, 0.6705883, 0, 1,
-1.261629, 0.3643706, -1.638703, 1, 0.6784314, 0, 1,
-1.261135, 0.2320117, -2.679509, 1, 0.682353, 0, 1,
-1.261105, 0.1723286, -1.764746, 1, 0.6901961, 0, 1,
-1.260738, -1.224265, -2.392305, 1, 0.6941177, 0, 1,
-1.253722, -0.009937354, -1.172002, 1, 0.7019608, 0, 1,
-1.241434, 0.4602283, -1.713151, 1, 0.7098039, 0, 1,
-1.236962, -0.7957445, -1.763705, 1, 0.7137255, 0, 1,
-1.230649, 0.1782497, -1.271886, 1, 0.7215686, 0, 1,
-1.23001, 1.138009, -0.1614205, 1, 0.7254902, 0, 1,
-1.22968, 0.1293446, -0.7468739, 1, 0.7333333, 0, 1,
-1.229077, 0.5791005, -1.651993, 1, 0.7372549, 0, 1,
-1.219439, 1.525876, -0.8576832, 1, 0.7450981, 0, 1,
-1.21891, 0.5387732, -0.7843215, 1, 0.7490196, 0, 1,
-1.216088, -1.001788, -3.728454, 1, 0.7568628, 0, 1,
-1.201178, -0.2634297, -2.193121, 1, 0.7607843, 0, 1,
-1.183368, -1.652951, -3.271956, 1, 0.7686275, 0, 1,
-1.180997, 0.8940868, -0.7035636, 1, 0.772549, 0, 1,
-1.180372, 0.3554735, -1.146614, 1, 0.7803922, 0, 1,
-1.168375, 0.355154, -2.356652, 1, 0.7843137, 0, 1,
-1.167232, 1.861379, -1.532912, 1, 0.7921569, 0, 1,
-1.166048, 0.3633758, -2.572723, 1, 0.7960784, 0, 1,
-1.165693, 0.0592661, -1.253353, 1, 0.8039216, 0, 1,
-1.152161, 0.2518156, -1.978575, 1, 0.8117647, 0, 1,
-1.148304, 0.1469201, -1.888658, 1, 0.8156863, 0, 1,
-1.1473, 0.6540874, -1.780821, 1, 0.8235294, 0, 1,
-1.146227, -0.4151468, -1.629873, 1, 0.827451, 0, 1,
-1.127355, -0.09243286, -0.3207405, 1, 0.8352941, 0, 1,
-1.1192, 0.02774572, -1.469908, 1, 0.8392157, 0, 1,
-1.11033, -0.7288883, -3.48205, 1, 0.8470588, 0, 1,
-1.108587, 1.762158, -1.011229, 1, 0.8509804, 0, 1,
-1.1065, 0.5239878, -0.8288314, 1, 0.8588235, 0, 1,
-1.106411, 1.190723, -1.775925, 1, 0.8627451, 0, 1,
-1.105843, -0.574884, -2.449724, 1, 0.8705882, 0, 1,
-1.10466, -0.8749359, -2.520804, 1, 0.8745098, 0, 1,
-1.101557, -0.2913626, -2.65488, 1, 0.8823529, 0, 1,
-1.095979, 0.2639086, -0.1534519, 1, 0.8862745, 0, 1,
-1.095225, -1.449218, -2.938414, 1, 0.8941177, 0, 1,
-1.090503, 0.120179, 1.453286, 1, 0.8980392, 0, 1,
-1.089176, 0.331465, -2.145616, 1, 0.9058824, 0, 1,
-1.089067, 0.420591, -0.8162594, 1, 0.9137255, 0, 1,
-1.084954, -1.378113, -1.906884, 1, 0.9176471, 0, 1,
-1.083403, -0.3630134, -2.488418, 1, 0.9254902, 0, 1,
-1.083399, -0.7414671, -2.724262, 1, 0.9294118, 0, 1,
-1.081475, -0.2061581, -2.070766, 1, 0.9372549, 0, 1,
-1.080293, -1.784073, -1.513383, 1, 0.9411765, 0, 1,
-1.079033, 0.2737942, 0.2611186, 1, 0.9490196, 0, 1,
-1.076575, -0.7761621, -2.312339, 1, 0.9529412, 0, 1,
-1.075929, 0.8258094, -0.5114236, 1, 0.9607843, 0, 1,
-1.069139, 0.0792793, -2.697116, 1, 0.9647059, 0, 1,
-1.069137, -1.123859, -2.138543, 1, 0.972549, 0, 1,
-1.051064, -1.796303, -2.114334, 1, 0.9764706, 0, 1,
-1.045707, 0.5965372, -0.7205487, 1, 0.9843137, 0, 1,
-1.044641, 0.2761042, -3.007338, 1, 0.9882353, 0, 1,
-1.037586, 0.424539, -0.4537809, 1, 0.9960784, 0, 1,
-1.0257, -0.2370243, -3.454425, 0.9960784, 1, 0, 1,
-1.02189, 0.8778289, -0.006525836, 0.9921569, 1, 0, 1,
-1.021147, -0.9065302, -3.874469, 0.9843137, 1, 0, 1,
-1.020672, 0.3597482, -0.384915, 0.9803922, 1, 0, 1,
-1.009524, -0.04100897, -2.243806, 0.972549, 1, 0, 1,
-1.008297, -0.09631451, -1.104108, 0.9686275, 1, 0, 1,
-1.003184, 0.924514, -2.828429, 0.9607843, 1, 0, 1,
-0.9935814, -2.215541, 0.217685, 0.9568627, 1, 0, 1,
-0.9897752, 0.8542665, -2.458502, 0.9490196, 1, 0, 1,
-0.9879143, 1.002596, 0.1072584, 0.945098, 1, 0, 1,
-0.9665652, -1.244345, -2.221073, 0.9372549, 1, 0, 1,
-0.9649193, -0.3727316, -1.418471, 0.9333333, 1, 0, 1,
-0.9643071, 0.1803413, -1.127574, 0.9254902, 1, 0, 1,
-0.9615248, 0.09358393, -1.349344, 0.9215686, 1, 0, 1,
-0.9610979, -0.442991, -3.257963, 0.9137255, 1, 0, 1,
-0.9599205, 0.459582, -0.1630808, 0.9098039, 1, 0, 1,
-0.9595858, -0.7791309, -3.285957, 0.9019608, 1, 0, 1,
-0.9530287, 0.3850591, -0.8303393, 0.8941177, 1, 0, 1,
-0.9413183, -0.1475438, -2.627192, 0.8901961, 1, 0, 1,
-0.9386649, 1.509938, -0.8244237, 0.8823529, 1, 0, 1,
-0.9361046, 1.222328, -0.9182752, 0.8784314, 1, 0, 1,
-0.9326479, 0.8672874, -2.343797, 0.8705882, 1, 0, 1,
-0.9313796, 0.3147509, -0.8141437, 0.8666667, 1, 0, 1,
-0.9292735, 1.174619, 0.4382504, 0.8588235, 1, 0, 1,
-0.9264726, 0.05961296, -2.021363, 0.854902, 1, 0, 1,
-0.9240986, -0.8272242, -2.149877, 0.8470588, 1, 0, 1,
-0.9236026, 1.143001, -1.340445, 0.8431373, 1, 0, 1,
-0.9179208, 0.2474943, -1.870026, 0.8352941, 1, 0, 1,
-0.914943, -0.6031519, -1.149956, 0.8313726, 1, 0, 1,
-0.9133626, 0.8161122, -1.355598, 0.8235294, 1, 0, 1,
-0.9127902, -0.7073218, -1.922132, 0.8196079, 1, 0, 1,
-0.9083254, -0.7094235, -1.461461, 0.8117647, 1, 0, 1,
-0.9057046, -1.446577, -3.585363, 0.8078431, 1, 0, 1,
-0.9052266, -0.1266747, -2.147373, 0.8, 1, 0, 1,
-0.899613, -0.2952155, -3.189085, 0.7921569, 1, 0, 1,
-0.8972024, 0.04416165, -0.3809331, 0.7882353, 1, 0, 1,
-0.8926193, 0.206424, -2.361787, 0.7803922, 1, 0, 1,
-0.8863867, 0.7609138, -0.4043152, 0.7764706, 1, 0, 1,
-0.8856655, 0.6701738, -0.3962518, 0.7686275, 1, 0, 1,
-0.8829141, 1.190015, -1.547924, 0.7647059, 1, 0, 1,
-0.8766069, -0.2168441, -1.700659, 0.7568628, 1, 0, 1,
-0.8750869, -0.5169227, -1.122761, 0.7529412, 1, 0, 1,
-0.872218, -0.6595854, -2.661079, 0.7450981, 1, 0, 1,
-0.8605226, -0.5603663, -3.163122, 0.7411765, 1, 0, 1,
-0.8533913, 0.4622415, 0.3097971, 0.7333333, 1, 0, 1,
-0.8501019, -0.1735986, -0.1549689, 0.7294118, 1, 0, 1,
-0.8475655, 1.468445, -2.865968, 0.7215686, 1, 0, 1,
-0.8461167, 1.397034, -0.6081117, 0.7176471, 1, 0, 1,
-0.8406075, -1.372701, -3.512992, 0.7098039, 1, 0, 1,
-0.8386709, -1.191868, -2.763019, 0.7058824, 1, 0, 1,
-0.8344076, -0.04319242, -2.374367, 0.6980392, 1, 0, 1,
-0.8337049, -2.205746, -2.643644, 0.6901961, 1, 0, 1,
-0.8322216, 0.09965162, -2.341788, 0.6862745, 1, 0, 1,
-0.8265568, 1.427371, -1.376732, 0.6784314, 1, 0, 1,
-0.825573, -0.6040726, -0.6160281, 0.6745098, 1, 0, 1,
-0.8236513, 1.526706, 0.2330411, 0.6666667, 1, 0, 1,
-0.82192, -1.043229, -2.083005, 0.6627451, 1, 0, 1,
-0.8094866, 0.1468169, -0.9478086, 0.654902, 1, 0, 1,
-0.8071764, 1.901025, -1.154296, 0.6509804, 1, 0, 1,
-0.8010942, -0.8518246, -2.070527, 0.6431373, 1, 0, 1,
-0.7890416, -0.7954997, -2.350356, 0.6392157, 1, 0, 1,
-0.7879033, -0.2736662, -1.104953, 0.6313726, 1, 0, 1,
-0.783208, 0.9678198, -0.231236, 0.627451, 1, 0, 1,
-0.7821077, 0.6462157, -0.7880908, 0.6196079, 1, 0, 1,
-0.7734972, -0.1933941, -1.007579, 0.6156863, 1, 0, 1,
-0.7734686, 0.0932314, -1.791058, 0.6078432, 1, 0, 1,
-0.7690057, -1.149813, -1.597259, 0.6039216, 1, 0, 1,
-0.7651656, 0.454479, -1.669542, 0.5960785, 1, 0, 1,
-0.7643065, -0.7658522, -2.880125, 0.5882353, 1, 0, 1,
-0.7618412, 0.5491688, 0.07144492, 0.5843138, 1, 0, 1,
-0.7614277, -0.500688, -3.204984, 0.5764706, 1, 0, 1,
-0.7585331, 1.135616, -1.452696, 0.572549, 1, 0, 1,
-0.7560468, -0.7782552, -2.458454, 0.5647059, 1, 0, 1,
-0.7535897, -0.2462819, 0.2324239, 0.5607843, 1, 0, 1,
-0.7492841, -0.422556, -1.670365, 0.5529412, 1, 0, 1,
-0.7490212, 0.6207644, -1.276214, 0.5490196, 1, 0, 1,
-0.7471712, 0.7406746, -1.930065, 0.5411765, 1, 0, 1,
-0.7394634, 0.9655253, -1.353647, 0.5372549, 1, 0, 1,
-0.7388839, -0.6979483, -1.129877, 0.5294118, 1, 0, 1,
-0.7329895, 0.5529354, -0.9906446, 0.5254902, 1, 0, 1,
-0.7314363, -0.2027006, -2.769277, 0.5176471, 1, 0, 1,
-0.7292726, -0.6621813, -2.257008, 0.5137255, 1, 0, 1,
-0.7255262, -0.1542386, -2.463259, 0.5058824, 1, 0, 1,
-0.7254314, 0.1761917, -1.462201, 0.5019608, 1, 0, 1,
-0.7244946, 0.7134466, -0.07319923, 0.4941176, 1, 0, 1,
-0.720157, -1.577533, -3.453358, 0.4862745, 1, 0, 1,
-0.7159491, 1.219645, -0.8043547, 0.4823529, 1, 0, 1,
-0.7128631, 0.9237257, -1.373818, 0.4745098, 1, 0, 1,
-0.710036, -0.8911536, -1.550377, 0.4705882, 1, 0, 1,
-0.7086417, 1.036735, -2.306283, 0.4627451, 1, 0, 1,
-0.7077605, 1.134838, -2.426217, 0.4588235, 1, 0, 1,
-0.7037053, -1.962239, -0.1801278, 0.4509804, 1, 0, 1,
-0.7016027, -0.5195695, -1.678003, 0.4470588, 1, 0, 1,
-0.7008074, 1.367567, -1.964674, 0.4392157, 1, 0, 1,
-0.6997109, -0.9876757, -3.736288, 0.4352941, 1, 0, 1,
-0.6987335, -1.042336, -3.219237, 0.427451, 1, 0, 1,
-0.696917, -0.497725, -2.580622, 0.4235294, 1, 0, 1,
-0.6942707, -1.314694, -3.429527, 0.4156863, 1, 0, 1,
-0.6918049, 0.244531, -2.039604, 0.4117647, 1, 0, 1,
-0.6808389, 0.1813105, -2.145945, 0.4039216, 1, 0, 1,
-0.6758718, 0.9716417, -1.328872, 0.3960784, 1, 0, 1,
-0.6690659, -0.5400737, -2.283337, 0.3921569, 1, 0, 1,
-0.6684862, 1.187609, -0.05300594, 0.3843137, 1, 0, 1,
-0.6638874, 1.479437, 1.410466, 0.3803922, 1, 0, 1,
-0.6604464, 3.573937, -1.694474, 0.372549, 1, 0, 1,
-0.6603428, 1.320641, -1.821429, 0.3686275, 1, 0, 1,
-0.6520702, -0.4131278, -1.157867, 0.3607843, 1, 0, 1,
-0.6492903, -0.8716375, -2.616456, 0.3568628, 1, 0, 1,
-0.649273, 0.5542572, 0.3276712, 0.3490196, 1, 0, 1,
-0.6364362, 0.265528, -0.04735848, 0.345098, 1, 0, 1,
-0.6340898, 0.2076307, -0.9257397, 0.3372549, 1, 0, 1,
-0.627534, -1.206598, 0.3210762, 0.3333333, 1, 0, 1,
-0.6216301, 1.40705, -1.035389, 0.3254902, 1, 0, 1,
-0.6201377, 0.8792639, -0.719652, 0.3215686, 1, 0, 1,
-0.6181661, 0.1770798, 0.6438802, 0.3137255, 1, 0, 1,
-0.6156984, 1.57031, 0.2535253, 0.3098039, 1, 0, 1,
-0.6123641, -0.5408208, -3.246121, 0.3019608, 1, 0, 1,
-0.610134, 0.4482267, 0.2561108, 0.2941177, 1, 0, 1,
-0.6084513, -1.58444, -2.288753, 0.2901961, 1, 0, 1,
-0.6018727, 0.531131, -0.4173702, 0.282353, 1, 0, 1,
-0.6010596, -2.452607, -3.046272, 0.2784314, 1, 0, 1,
-0.5981053, 1.461844, 0.01728641, 0.2705882, 1, 0, 1,
-0.5921692, 1.44134, 0.02814207, 0.2666667, 1, 0, 1,
-0.5909126, -0.3821082, -2.629723, 0.2588235, 1, 0, 1,
-0.5904734, -0.6610992, -1.919056, 0.254902, 1, 0, 1,
-0.578109, -0.5740882, -1.979972, 0.2470588, 1, 0, 1,
-0.5634913, 0.7509, -2.201231, 0.2431373, 1, 0, 1,
-0.5587203, 0.1001199, -0.4136187, 0.2352941, 1, 0, 1,
-0.5466673, 0.7483981, -1.327304, 0.2313726, 1, 0, 1,
-0.5442668, 1.281795, -1.74399, 0.2235294, 1, 0, 1,
-0.5430133, 0.4508049, -2.393766, 0.2196078, 1, 0, 1,
-0.5352635, -1.224433, -2.979751, 0.2117647, 1, 0, 1,
-0.5349755, -1.251582, -2.793859, 0.2078431, 1, 0, 1,
-0.5342591, -0.5513817, -2.764023, 0.2, 1, 0, 1,
-0.5242572, -1.116739, -2.46635, 0.1921569, 1, 0, 1,
-0.5214967, -1.952995, -2.602822, 0.1882353, 1, 0, 1,
-0.5172774, 1.481734, -1.964119, 0.1803922, 1, 0, 1,
-0.510693, -0.9010254, -2.14974, 0.1764706, 1, 0, 1,
-0.5061513, -1.077361, -4.424854, 0.1686275, 1, 0, 1,
-0.504627, 0.3108737, -0.5901726, 0.1647059, 1, 0, 1,
-0.5000592, -0.2659844, -2.789824, 0.1568628, 1, 0, 1,
-0.4965847, -0.3673936, -2.838, 0.1529412, 1, 0, 1,
-0.4965568, 0.7371921, -0.4072432, 0.145098, 1, 0, 1,
-0.4944988, -0.3628996, -2.097808, 0.1411765, 1, 0, 1,
-0.4930435, 1.376885, -1.279245, 0.1333333, 1, 0, 1,
-0.49197, -1.540803, -3.545826, 0.1294118, 1, 0, 1,
-0.4844746, -0.08830187, -2.114582, 0.1215686, 1, 0, 1,
-0.478447, 0.1491288, -1.831748, 0.1176471, 1, 0, 1,
-0.4741847, -0.1926428, -1.056044, 0.1098039, 1, 0, 1,
-0.4685649, -2.010329, -3.984047, 0.1058824, 1, 0, 1,
-0.4676431, -1.318973, -3.324859, 0.09803922, 1, 0, 1,
-0.4674949, 0.9143131, -1.111765, 0.09019608, 1, 0, 1,
-0.461241, -0.3615532, -3.243521, 0.08627451, 1, 0, 1,
-0.4606983, 0.7628488, 0.1787481, 0.07843138, 1, 0, 1,
-0.4604476, 0.3589981, 0.3090517, 0.07450981, 1, 0, 1,
-0.4592707, 1.562233, -0.04422652, 0.06666667, 1, 0, 1,
-0.4584655, -0.4127316, -2.140419, 0.0627451, 1, 0, 1,
-0.4533528, -0.5300928, -2.031501, 0.05490196, 1, 0, 1,
-0.4497098, 1.28546, -2.270499, 0.05098039, 1, 0, 1,
-0.4481546, -0.5478442, -1.72372, 0.04313726, 1, 0, 1,
-0.4481311, 0.6574735, -0.8066354, 0.03921569, 1, 0, 1,
-0.4480637, -1.040888, -1.773783, 0.03137255, 1, 0, 1,
-0.4431479, 0.2720668, -1.46088, 0.02745098, 1, 0, 1,
-0.4378207, -0.5731976, -0.3670571, 0.01960784, 1, 0, 1,
-0.4341215, -0.3859028, -2.656541, 0.01568628, 1, 0, 1,
-0.4338224, 0.5021922, -1.910988, 0.007843138, 1, 0, 1,
-0.4315604, -0.2886182, -1.907914, 0.003921569, 1, 0, 1,
-0.4286199, -1.042803, -1.997357, 0, 1, 0.003921569, 1,
-0.4176403, -0.7322416, -1.785055, 0, 1, 0.01176471, 1,
-0.4171833, -0.1958168, -3.066988, 0, 1, 0.01568628, 1,
-0.4158659, -1.224723, -5.238468, 0, 1, 0.02352941, 1,
-0.4113075, -0.329217, -3.435032, 0, 1, 0.02745098, 1,
-0.407645, 1.494257, -1.29495, 0, 1, 0.03529412, 1,
-0.4019341, -0.2165641, 0.1269915, 0, 1, 0.03921569, 1,
-0.3978038, 0.6855689, 0.119963, 0, 1, 0.04705882, 1,
-0.3896293, -0.3676919, -4.596056, 0, 1, 0.05098039, 1,
-0.3885433, -1.098143, -1.374719, 0, 1, 0.05882353, 1,
-0.3872541, 0.2154538, 0.8715115, 0, 1, 0.0627451, 1,
-0.3850633, 1.704581, -2.876204, 0, 1, 0.07058824, 1,
-0.3838469, -0.3511346, -1.41879, 0, 1, 0.07450981, 1,
-0.3772839, 0.7830762, 1.566224, 0, 1, 0.08235294, 1,
-0.3771906, 0.4994314, -0.3243641, 0, 1, 0.08627451, 1,
-0.3753935, 0.1050429, 0.003884244, 0, 1, 0.09411765, 1,
-0.3739567, 1.084366, 0.9959223, 0, 1, 0.1019608, 1,
-0.3723598, -1.29653, -2.429341, 0, 1, 0.1058824, 1,
-0.3681339, 0.4881231, -0.1161164, 0, 1, 0.1137255, 1,
-0.364782, -0.9906542, -1.799991, 0, 1, 0.1176471, 1,
-0.3611848, -0.07011962, -2.436702, 0, 1, 0.1254902, 1,
-0.3574457, 0.96061, 1.647849, 0, 1, 0.1294118, 1,
-0.3549192, 0.2321248, -1.072492, 0, 1, 0.1372549, 1,
-0.3540787, -0.8182291, -3.271152, 0, 1, 0.1411765, 1,
-0.3531548, -0.07971978, -1.831995, 0, 1, 0.1490196, 1,
-0.3509049, -1.240917, -3.560303, 0, 1, 0.1529412, 1,
-0.3451381, -1.97178, -1.95757, 0, 1, 0.1607843, 1,
-0.3385912, -0.617393, -3.363239, 0, 1, 0.1647059, 1,
-0.3362707, 0.4224068, -0.08973354, 0, 1, 0.172549, 1,
-0.3325208, -0.4112441, -1.539336, 0, 1, 0.1764706, 1,
-0.3317212, 0.3808432, -0.7249237, 0, 1, 0.1843137, 1,
-0.326297, 0.8454583, 0.8363082, 0, 1, 0.1882353, 1,
-0.3226374, 0.58869, -0.2610447, 0, 1, 0.1960784, 1,
-0.3202433, 0.8178464, -0.7106887, 0, 1, 0.2039216, 1,
-0.3159202, -0.8383576, -2.672882, 0, 1, 0.2078431, 1,
-0.3155744, -0.6818275, -3.016116, 0, 1, 0.2156863, 1,
-0.3113264, -0.859891, -0.4842528, 0, 1, 0.2196078, 1,
-0.3070591, 1.333969, 1.105318, 0, 1, 0.227451, 1,
-0.3051962, -0.1254357, -1.490104, 0, 1, 0.2313726, 1,
-0.2992085, -0.8729851, -2.449018, 0, 1, 0.2392157, 1,
-0.2923127, 1.554995, -1.541653, 0, 1, 0.2431373, 1,
-0.2919631, 0.6411537, -1.024673, 0, 1, 0.2509804, 1,
-0.288357, 1.259887, -1.259212, 0, 1, 0.254902, 1,
-0.2859204, -0.1193908, -2.89412, 0, 1, 0.2627451, 1,
-0.2827184, 0.1555873, -0.8234525, 0, 1, 0.2666667, 1,
-0.2826182, -0.06962599, -2.070448, 0, 1, 0.2745098, 1,
-0.2824426, -0.09760484, 0.341439, 0, 1, 0.2784314, 1,
-0.2813083, -0.0188645, -4.427813, 0, 1, 0.2862745, 1,
-0.2805778, 0.5116049, 0.605272, 0, 1, 0.2901961, 1,
-0.2779379, 1.37307, -0.5962079, 0, 1, 0.2980392, 1,
-0.2707428, -1.060281, -1.986279, 0, 1, 0.3058824, 1,
-0.2693656, 0.01815643, 0.001389951, 0, 1, 0.3098039, 1,
-0.2686402, -0.1738263, -2.696446, 0, 1, 0.3176471, 1,
-0.2594818, 0.7757195, -0.8289258, 0, 1, 0.3215686, 1,
-0.2583407, -1.019133, -2.342785, 0, 1, 0.3294118, 1,
-0.2551726, 0.5720924, -0.5792132, 0, 1, 0.3333333, 1,
-0.2546796, 0.2539824, -0.2738545, 0, 1, 0.3411765, 1,
-0.2525827, -0.9722332, -3.800407, 0, 1, 0.345098, 1,
-0.2505125, -0.505388, -2.889278, 0, 1, 0.3529412, 1,
-0.2491917, -0.7717379, -3.523308, 0, 1, 0.3568628, 1,
-0.2482408, 0.2592392, 0.9679959, 0, 1, 0.3647059, 1,
-0.2395888, -1.013687, -2.035778, 0, 1, 0.3686275, 1,
-0.2368526, -0.9841706, -3.25052, 0, 1, 0.3764706, 1,
-0.2276728, 1.857578, -0.7470871, 0, 1, 0.3803922, 1,
-0.2248257, 1.640023, -0.1627858, 0, 1, 0.3882353, 1,
-0.2245736, -0.7882859, -3.858825, 0, 1, 0.3921569, 1,
-0.2229069, -1.568315, -4.845185, 0, 1, 0.4, 1,
-0.2222285, -0.3414993, -3.194348, 0, 1, 0.4078431, 1,
-0.2165238, 1.10307, -0.3826309, 0, 1, 0.4117647, 1,
-0.2150562, -1.220856, -3.867242, 0, 1, 0.4196078, 1,
-0.204161, -1.070524, -3.699981, 0, 1, 0.4235294, 1,
-0.1984392, -0.6216047, -3.244077, 0, 1, 0.4313726, 1,
-0.1954558, 0.5393799, -1.751765, 0, 1, 0.4352941, 1,
-0.1916843, -0.3816898, -3.52251, 0, 1, 0.4431373, 1,
-0.1828641, 0.4457119, -1.038862, 0, 1, 0.4470588, 1,
-0.1811282, 0.6656987, -0.3026777, 0, 1, 0.454902, 1,
-0.1807198, 1.356748, -1.375026, 0, 1, 0.4588235, 1,
-0.1805479, -1.491946, -4.648673, 0, 1, 0.4666667, 1,
-0.1758991, 0.6296493, 1.3569, 0, 1, 0.4705882, 1,
-0.1700993, 0.878652, 0.003681468, 0, 1, 0.4784314, 1,
-0.1683507, 1.209641, 1.227665, 0, 1, 0.4823529, 1,
-0.1674583, 1.674329, 0.6807008, 0, 1, 0.4901961, 1,
-0.1663403, 0.4338642, -0.1246753, 0, 1, 0.4941176, 1,
-0.1653848, 0.640168, -0.5197636, 0, 1, 0.5019608, 1,
-0.16199, 0.9035109, -1.947055, 0, 1, 0.509804, 1,
-0.1608912, 0.7960208, 0.9582434, 0, 1, 0.5137255, 1,
-0.1601406, -0.5427151, -3.122334, 0, 1, 0.5215687, 1,
-0.1595961, -0.1846425, -2.761926, 0, 1, 0.5254902, 1,
-0.1590984, 0.7402585, -0.6685679, 0, 1, 0.5333334, 1,
-0.1583411, 0.1231669, -1.859028, 0, 1, 0.5372549, 1,
-0.1559872, 0.2221646, -1.610692, 0, 1, 0.5450981, 1,
-0.1542981, -0.4072478, -3.784477, 0, 1, 0.5490196, 1,
-0.1531775, 0.6124007, 0.65285, 0, 1, 0.5568628, 1,
-0.152847, 1.727986, 1.479046, 0, 1, 0.5607843, 1,
-0.1484095, 0.2110834, -0.1340807, 0, 1, 0.5686275, 1,
-0.1452004, 0.6063288, 0.3884839, 0, 1, 0.572549, 1,
-0.1340542, -1.111725, -1.388979, 0, 1, 0.5803922, 1,
-0.12449, -1.203726, -1.407283, 0, 1, 0.5843138, 1,
-0.1241865, -0.7305259, -1.850319, 0, 1, 0.5921569, 1,
-0.1224425, 1.433411, -1.832395, 0, 1, 0.5960785, 1,
-0.1200431, -1.397375, -2.843514, 0, 1, 0.6039216, 1,
-0.1194567, -0.970314, -3.005815, 0, 1, 0.6117647, 1,
-0.1144993, 0.2353006, 0.05017776, 0, 1, 0.6156863, 1,
-0.1141859, -0.6733691, -3.361363, 0, 1, 0.6235294, 1,
-0.1114053, 0.6745335, -0.05962905, 0, 1, 0.627451, 1,
-0.1110135, -0.8163413, -3.032767, 0, 1, 0.6352941, 1,
-0.1110119, 0.7797156, -0.6504103, 0, 1, 0.6392157, 1,
-0.1089028, -1.413231, -3.604725, 0, 1, 0.6470588, 1,
-0.08717607, 1.246372, -1.097316, 0, 1, 0.6509804, 1,
-0.08709901, 0.6020265, -0.6288435, 0, 1, 0.6588235, 1,
-0.08482683, 1.285758, -0.0001534761, 0, 1, 0.6627451, 1,
-0.08464663, -0.6962234, -1.885768, 0, 1, 0.6705883, 1,
-0.08404982, 0.541621, -0.0208859, 0, 1, 0.6745098, 1,
-0.08155128, 0.0530653, -2.313874, 0, 1, 0.682353, 1,
-0.07990038, 2.103324, -0.1652544, 0, 1, 0.6862745, 1,
-0.07846578, 0.2162751, 0.4961755, 0, 1, 0.6941177, 1,
-0.07845962, 0.7774081, 0.6038762, 0, 1, 0.7019608, 1,
-0.07697017, -0.7724226, -3.686582, 0, 1, 0.7058824, 1,
-0.07338711, -0.7502815, -2.990439, 0, 1, 0.7137255, 1,
-0.07269315, 1.1269, 0.3092718, 0, 1, 0.7176471, 1,
-0.0693774, 0.9209121, -0.8169905, 0, 1, 0.7254902, 1,
-0.0686829, -0.4944264, -2.545577, 0, 1, 0.7294118, 1,
-0.06767568, -1.769414, -2.718075, 0, 1, 0.7372549, 1,
-0.06340447, -0.2941933, -3.83251, 0, 1, 0.7411765, 1,
-0.06292072, -0.6980233, -3.904994, 0, 1, 0.7490196, 1,
-0.06026788, 1.65008, -1.924862, 0, 1, 0.7529412, 1,
-0.05480759, 1.020667, -0.5526267, 0, 1, 0.7607843, 1,
-0.05451923, 0.2915525, 0.4766689, 0, 1, 0.7647059, 1,
-0.05368272, 0.5786012, -0.1849243, 0, 1, 0.772549, 1,
-0.05254566, -1.569487, -4.73307, 0, 1, 0.7764706, 1,
-0.0508097, -1.65698, -4.649736, 0, 1, 0.7843137, 1,
-0.05026104, 1.199866, -0.396705, 0, 1, 0.7882353, 1,
-0.04590677, -1.279907, -2.766372, 0, 1, 0.7960784, 1,
-0.04303676, 1.053734, 0.5506077, 0, 1, 0.8039216, 1,
-0.04068739, 0.2123777, -0.9551511, 0, 1, 0.8078431, 1,
-0.04002309, -0.3087245, -1.807554, 0, 1, 0.8156863, 1,
-0.02606344, 0.7104029, -0.3287358, 0, 1, 0.8196079, 1,
-0.02453077, -1.098839, -3.139692, 0, 1, 0.827451, 1,
-0.02084396, 1.68318, 2.061372, 0, 1, 0.8313726, 1,
-0.02001073, 1.545844, 0.2942987, 0, 1, 0.8392157, 1,
-0.01747326, 0.5776011, -0.2133563, 0, 1, 0.8431373, 1,
-0.01746351, 1.970195, -0.01710654, 0, 1, 0.8509804, 1,
-0.01716318, 0.3248759, -1.016235, 0, 1, 0.854902, 1,
-0.01704989, 0.6121227, -0.5149763, 0, 1, 0.8627451, 1,
-0.01574079, 0.6658854, -0.3964274, 0, 1, 0.8666667, 1,
-0.01137335, 0.220385, -0.2946173, 0, 1, 0.8745098, 1,
-0.004434341, -0.2538993, -3.836269, 0, 1, 0.8784314, 1,
-0.002526595, 1.521546, 1.022196, 0, 1, 0.8862745, 1,
-0.001285667, -0.8895125, -3.669341, 0, 1, 0.8901961, 1,
-0.00117892, -0.09373808, -3.313567, 0, 1, 0.8980392, 1,
0.0004232242, -1.132485, 3.258556, 0, 1, 0.9058824, 1,
0.001072632, 0.03992441, -1.077807, 0, 1, 0.9098039, 1,
0.004443747, 0.2326123, 1.345726, 0, 1, 0.9176471, 1,
0.005283533, -0.8942266, 4.314095, 0, 1, 0.9215686, 1,
0.009098032, -1.717742, 3.84985, 0, 1, 0.9294118, 1,
0.009880839, -1.272334, 5.073593, 0, 1, 0.9333333, 1,
0.01001841, -1.394484, 2.843811, 0, 1, 0.9411765, 1,
0.01055208, 0.1386199, -1.163608, 0, 1, 0.945098, 1,
0.01172713, 0.2580301, -0.6594173, 0, 1, 0.9529412, 1,
0.01179283, 0.5145458, 0.2570996, 0, 1, 0.9568627, 1,
0.01461233, 0.4642075, -2.199596, 0, 1, 0.9647059, 1,
0.01690804, 0.5416618, -0.3119754, 0, 1, 0.9686275, 1,
0.01833861, -0.4015907, 6.174308, 0, 1, 0.9764706, 1,
0.0192478, -0.4270043, 2.325649, 0, 1, 0.9803922, 1,
0.01947337, -0.3717795, 3.897428, 0, 1, 0.9882353, 1,
0.0212295, -0.06857926, 3.064672, 0, 1, 0.9921569, 1,
0.03215188, -0.7640247, 2.48341, 0, 1, 1, 1,
0.03266526, -0.2357128, 3.295596, 0, 0.9921569, 1, 1,
0.03547327, 0.5665204, -1.029767, 0, 0.9882353, 1, 1,
0.03725022, -0.9255105, 4.104415, 0, 0.9803922, 1, 1,
0.03824015, 1.454509, 0.04453547, 0, 0.9764706, 1, 1,
0.04096875, -1.430044, 3.817986, 0, 0.9686275, 1, 1,
0.04345185, -0.6602116, 2.366067, 0, 0.9647059, 1, 1,
0.04616798, -0.01007269, 2.044605, 0, 0.9568627, 1, 1,
0.04622765, 0.3346579, -0.8483423, 0, 0.9529412, 1, 1,
0.05287601, 0.353394, 0.7797555, 0, 0.945098, 1, 1,
0.05425972, 2.37401, -0.3094571, 0, 0.9411765, 1, 1,
0.05578367, -1.199501, 3.515938, 0, 0.9333333, 1, 1,
0.06080943, 0.2591198, 1.245664, 0, 0.9294118, 1, 1,
0.0635112, 0.8041872, 1.293534, 0, 0.9215686, 1, 1,
0.06591952, -1.559375, 1.860406, 0, 0.9176471, 1, 1,
0.06634795, -1.108821, 4.200749, 0, 0.9098039, 1, 1,
0.06728175, 0.100712, 2.943708, 0, 0.9058824, 1, 1,
0.07047638, -0.8397426, 2.409399, 0, 0.8980392, 1, 1,
0.07226582, -0.3476034, 3.81718, 0, 0.8901961, 1, 1,
0.07496484, 0.01462686, 0.477558, 0, 0.8862745, 1, 1,
0.07709195, 0.5467309, -0.6099066, 0, 0.8784314, 1, 1,
0.07733342, -1.55154, 3.122062, 0, 0.8745098, 1, 1,
0.07757266, 1.284825, 0.9603673, 0, 0.8666667, 1, 1,
0.08043978, -0.7351338, 2.395647, 0, 0.8627451, 1, 1,
0.08274788, -0.4336201, 3.544677, 0, 0.854902, 1, 1,
0.08607334, -0.8169224, 3.179284, 0, 0.8509804, 1, 1,
0.08855618, 0.8661935, 0.5336475, 0, 0.8431373, 1, 1,
0.08981099, 0.02509185, 0.3404753, 0, 0.8392157, 1, 1,
0.09329941, 0.7362359, -0.9048219, 0, 0.8313726, 1, 1,
0.09814048, -0.212189, 2.346061, 0, 0.827451, 1, 1,
0.09852444, 1.137251, -1.589419, 0, 0.8196079, 1, 1,
0.09892282, -0.6916853, 2.272766, 0, 0.8156863, 1, 1,
0.09968213, 0.5634561, 0.556765, 0, 0.8078431, 1, 1,
0.1060431, 0.771798, 2.017555, 0, 0.8039216, 1, 1,
0.1065093, -0.9346517, 4.546755, 0, 0.7960784, 1, 1,
0.1065503, -0.1676157, 1.32775, 0, 0.7882353, 1, 1,
0.1088973, -1.59524, 1.921353, 0, 0.7843137, 1, 1,
0.1106654, 0.4990234, 1.399579, 0, 0.7764706, 1, 1,
0.1109443, -1.414726, 2.867998, 0, 0.772549, 1, 1,
0.1120979, 0.4086315, 0.1657462, 0, 0.7647059, 1, 1,
0.1123358, -0.07391712, 3.751008, 0, 0.7607843, 1, 1,
0.1128198, 0.8852715, -1.748016, 0, 0.7529412, 1, 1,
0.1284536, 0.7245283, 0.6901719, 0, 0.7490196, 1, 1,
0.1285334, -1.927212, 3.09673, 0, 0.7411765, 1, 1,
0.1302623, -0.8618785, 1.468989, 0, 0.7372549, 1, 1,
0.1353246, -0.4895043, 1.680174, 0, 0.7294118, 1, 1,
0.1360816, -0.5024831, 2.954388, 0, 0.7254902, 1, 1,
0.136134, 0.939209, -0.8247043, 0, 0.7176471, 1, 1,
0.138067, -0.5798569, 5.052608, 0, 0.7137255, 1, 1,
0.1423795, -0.6104413, 3.053644, 0, 0.7058824, 1, 1,
0.1434968, -0.7723528, 4.632215, 0, 0.6980392, 1, 1,
0.1472133, 0.2591724, 0.08692438, 0, 0.6941177, 1, 1,
0.148724, 0.2357312, 0.3098067, 0, 0.6862745, 1, 1,
0.152052, -1.551866, 1.959007, 0, 0.682353, 1, 1,
0.1550216, -0.507526, 1.726237, 0, 0.6745098, 1, 1,
0.1618184, 0.05679252, 1.943114, 0, 0.6705883, 1, 1,
0.1640762, -0.4862133, 4.059124, 0, 0.6627451, 1, 1,
0.165334, -0.1467974, 1.379549, 0, 0.6588235, 1, 1,
0.1686431, -0.5009165, 2.828959, 0, 0.6509804, 1, 1,
0.1693102, -0.5515018, 2.033526, 0, 0.6470588, 1, 1,
0.1724904, -0.6104057, 2.441582, 0, 0.6392157, 1, 1,
0.1805406, -1.574933, 1.753305, 0, 0.6352941, 1, 1,
0.1837749, -1.091621, 3.039525, 0, 0.627451, 1, 1,
0.1851541, -3.19366, 4.203054, 0, 0.6235294, 1, 1,
0.1851695, 1.906277, -0.1315581, 0, 0.6156863, 1, 1,
0.1861465, -0.7912717, 2.196521, 0, 0.6117647, 1, 1,
0.1868336, 0.2453754, 1.508519, 0, 0.6039216, 1, 1,
0.188985, -0.01895631, 0.9894159, 0, 0.5960785, 1, 1,
0.1891342, 0.4791116, -0.2988445, 0, 0.5921569, 1, 1,
0.1892506, -0.6686978, 4.467427, 0, 0.5843138, 1, 1,
0.1898411, 0.4057072, 0.6609082, 0, 0.5803922, 1, 1,
0.1908285, 0.9710847, 2.254221, 0, 0.572549, 1, 1,
0.1924152, 1.327567, -1.435583, 0, 0.5686275, 1, 1,
0.1939066, -0.3216943, 2.017213, 0, 0.5607843, 1, 1,
0.1943465, 1.160089, 0.4151881, 0, 0.5568628, 1, 1,
0.1984383, 1.341125, -0.3674256, 0, 0.5490196, 1, 1,
0.1996129, 1.789516, 1.347142, 0, 0.5450981, 1, 1,
0.200313, -0.6983937, 2.706367, 0, 0.5372549, 1, 1,
0.2011582, 0.6332686, 1.723413, 0, 0.5333334, 1, 1,
0.2029793, 0.1619915, 0.7135581, 0, 0.5254902, 1, 1,
0.2082708, 0.3609706, -0.5155213, 0, 0.5215687, 1, 1,
0.208292, -0.6958406, 2.785686, 0, 0.5137255, 1, 1,
0.211576, 0.6348302, -0.1414076, 0, 0.509804, 1, 1,
0.2123329, -0.08781821, 1.008545, 0, 0.5019608, 1, 1,
0.214481, 1.2408, -0.6096655, 0, 0.4941176, 1, 1,
0.215598, 0.4230547, -0.2763406, 0, 0.4901961, 1, 1,
0.2173195, 0.1633524, -0.6070203, 0, 0.4823529, 1, 1,
0.2206488, -0.1391324, 1.208341, 0, 0.4784314, 1, 1,
0.2259847, -0.1668219, 1.032993, 0, 0.4705882, 1, 1,
0.2325178, 1.064156, 0.8686761, 0, 0.4666667, 1, 1,
0.2327196, -0.8904431, 2.058276, 0, 0.4588235, 1, 1,
0.2369583, -0.2284349, 2.809935, 0, 0.454902, 1, 1,
0.2398853, -0.1489724, 3.298687, 0, 0.4470588, 1, 1,
0.2411279, 0.424885, 0.2881487, 0, 0.4431373, 1, 1,
0.2418167, 1.91504, -0.4711441, 0, 0.4352941, 1, 1,
0.2444495, 0.3189714, 0.1218526, 0, 0.4313726, 1, 1,
0.2454, 0.02025905, 1.287039, 0, 0.4235294, 1, 1,
0.2456326, -0.2138825, 2.540812, 0, 0.4196078, 1, 1,
0.2475074, 0.3932174, 1.895908, 0, 0.4117647, 1, 1,
0.2487562, 0.3635248, -0.8725645, 0, 0.4078431, 1, 1,
0.2493682, -0.05816226, 1.617057, 0, 0.4, 1, 1,
0.2502562, 1.060054, 0.7546112, 0, 0.3921569, 1, 1,
0.2518154, 0.8310722, 2.169485, 0, 0.3882353, 1, 1,
0.2525446, 0.5248241, 0.2658494, 0, 0.3803922, 1, 1,
0.2531091, 0.7569914, -0.5853133, 0, 0.3764706, 1, 1,
0.2531689, -1.208616, 3.936028, 0, 0.3686275, 1, 1,
0.2564709, 0.9030401, -0.419733, 0, 0.3647059, 1, 1,
0.2608507, 0.4067827, 2.637713, 0, 0.3568628, 1, 1,
0.2623491, 0.3107832, 1.462426, 0, 0.3529412, 1, 1,
0.2640484, -0.5498484, 3.662015, 0, 0.345098, 1, 1,
0.2659507, 0.6645854, -0.3291404, 0, 0.3411765, 1, 1,
0.2668438, 0.5872243, 0.4003231, 0, 0.3333333, 1, 1,
0.2705246, 1.044255, -0.7592242, 0, 0.3294118, 1, 1,
0.271037, 0.8789406, 1.048144, 0, 0.3215686, 1, 1,
0.2716269, -1.214087, 3.580285, 0, 0.3176471, 1, 1,
0.2734817, 0.1356093, 2.379685, 0, 0.3098039, 1, 1,
0.2765151, -0.193572, 4.068139, 0, 0.3058824, 1, 1,
0.2767935, -1.550122, 3.709236, 0, 0.2980392, 1, 1,
0.276817, -0.2072879, 2.350977, 0, 0.2901961, 1, 1,
0.2773178, 1.518552, 0.3347015, 0, 0.2862745, 1, 1,
0.2831604, 2.149687, 0.1300773, 0, 0.2784314, 1, 1,
0.2833977, -1.172363, 3.774254, 0, 0.2745098, 1, 1,
0.2874651, -1.541806, 1.579815, 0, 0.2666667, 1, 1,
0.2896196, -0.02357051, 1.959422, 0, 0.2627451, 1, 1,
0.2906971, 0.3305055, 0.06748868, 0, 0.254902, 1, 1,
0.2910135, 3.306583, 0.2426914, 0, 0.2509804, 1, 1,
0.2954837, 1.298654, -0.7678931, 0, 0.2431373, 1, 1,
0.2961636, -0.8548662, 2.971173, 0, 0.2392157, 1, 1,
0.2974768, 0.1118513, 2.416923, 0, 0.2313726, 1, 1,
0.3008321, -1.569962, 1.79791, 0, 0.227451, 1, 1,
0.3008876, 0.3425633, 0.4244434, 0, 0.2196078, 1, 1,
0.305432, -2.203144, 3.067179, 0, 0.2156863, 1, 1,
0.3081698, 0.114339, 0.8798281, 0, 0.2078431, 1, 1,
0.3087737, -0.8841558, 2.649571, 0, 0.2039216, 1, 1,
0.3103845, 1.806893, -0.5279016, 0, 0.1960784, 1, 1,
0.3107062, -0.06630661, 0.9063314, 0, 0.1882353, 1, 1,
0.3137281, 1.22929, 0.2486453, 0, 0.1843137, 1, 1,
0.3154245, -0.1316485, 2.633577, 0, 0.1764706, 1, 1,
0.3201933, 0.6011609, -0.1303329, 0, 0.172549, 1, 1,
0.3208751, -1.027387, 3.871531, 0, 0.1647059, 1, 1,
0.3213509, -1.036625, 1.945271, 0, 0.1607843, 1, 1,
0.3243446, 0.3025629, 1.61204, 0, 0.1529412, 1, 1,
0.3302497, 1.11131, -1.431703, 0, 0.1490196, 1, 1,
0.3326198, -0.04379065, 0.05670853, 0, 0.1411765, 1, 1,
0.3402384, 0.8630164, -0.1178319, 0, 0.1372549, 1, 1,
0.3406608, 0.3893148, 2.186081, 0, 0.1294118, 1, 1,
0.3409298, -1.683257, 3.560968, 0, 0.1254902, 1, 1,
0.3436432, -0.4350203, 3.124327, 0, 0.1176471, 1, 1,
0.3436953, 0.3658449, 0.2852798, 0, 0.1137255, 1, 1,
0.3447948, 0.340314, 0.6927535, 0, 0.1058824, 1, 1,
0.3473828, -1.207899, 4.04162, 0, 0.09803922, 1, 1,
0.3484597, 0.5452205, 1.653415, 0, 0.09411765, 1, 1,
0.3500892, 0.2673543, 0.2111207, 0, 0.08627451, 1, 1,
0.3534957, 2.14829, 0.1300699, 0, 0.08235294, 1, 1,
0.3538302, 0.7097394, 1.325582, 0, 0.07450981, 1, 1,
0.3546826, 0.08812851, 1.608675, 0, 0.07058824, 1, 1,
0.3567836, -0.4244842, 1.010907, 0, 0.0627451, 1, 1,
0.3573842, 0.1810345, 0.6654207, 0, 0.05882353, 1, 1,
0.3661833, -1.514277, 1.247659, 0, 0.05098039, 1, 1,
0.3690055, -1.318695, 1.97886, 0, 0.04705882, 1, 1,
0.3754451, -0.5752158, 1.767412, 0, 0.03921569, 1, 1,
0.3775045, -0.08098476, 0.7483649, 0, 0.03529412, 1, 1,
0.3785613, -1.530272, 3.261858, 0, 0.02745098, 1, 1,
0.3798954, 0.1456301, 0.554503, 0, 0.02352941, 1, 1,
0.3834292, -1.473954, 2.62155, 0, 0.01568628, 1, 1,
0.3867543, -0.4495055, 2.640674, 0, 0.01176471, 1, 1,
0.3927955, -1.874426, 4.458498, 0, 0.003921569, 1, 1,
0.396414, -0.3064905, 2.86627, 0.003921569, 0, 1, 1,
0.4012924, -0.9011602, 2.347542, 0.007843138, 0, 1, 1,
0.4041512, 0.2038587, 0.7463553, 0.01568628, 0, 1, 1,
0.4123696, -0.5085058, 2.30205, 0.01960784, 0, 1, 1,
0.4123832, -1.58316, 2.748382, 0.02745098, 0, 1, 1,
0.4132945, 0.2028041, 3.383248, 0.03137255, 0, 1, 1,
0.4135491, -0.8211102, 2.337635, 0.03921569, 0, 1, 1,
0.4156948, 0.6894796, 0.7618002, 0.04313726, 0, 1, 1,
0.4180473, -1.028449, 3.287968, 0.05098039, 0, 1, 1,
0.4222405, 1.137452, 0.2591245, 0.05490196, 0, 1, 1,
0.4243206, 1.001053, -0.04824894, 0.0627451, 0, 1, 1,
0.4268608, 0.5114666, 0.3044327, 0.06666667, 0, 1, 1,
0.431468, 1.574253, -2.482367, 0.07450981, 0, 1, 1,
0.4330692, 0.2862989, 1.665109, 0.07843138, 0, 1, 1,
0.4337873, -0.1199306, 0.6973717, 0.08627451, 0, 1, 1,
0.4339501, 0.8065529, 2.673298, 0.09019608, 0, 1, 1,
0.4353667, 1.397879, -0.5531146, 0.09803922, 0, 1, 1,
0.4428367, 0.6323562, 2.117876, 0.1058824, 0, 1, 1,
0.4433495, 1.065381, -1.106468, 0.1098039, 0, 1, 1,
0.4476008, 0.5812401, 0.9560722, 0.1176471, 0, 1, 1,
0.4576399, 0.04348566, 1.663397, 0.1215686, 0, 1, 1,
0.4663076, -0.5971882, 2.065934, 0.1294118, 0, 1, 1,
0.471908, -0.7312033, 0.3438889, 0.1333333, 0, 1, 1,
0.4724531, 0.5584396, 0.3222929, 0.1411765, 0, 1, 1,
0.4732913, -1.384271, 3.934802, 0.145098, 0, 1, 1,
0.4743591, 0.7510196, -0.9883524, 0.1529412, 0, 1, 1,
0.4774543, 0.8966342, -0.01468237, 0.1568628, 0, 1, 1,
0.4801215, -1.677729, 1.665146, 0.1647059, 0, 1, 1,
0.4841295, 1.813467, 1.425776, 0.1686275, 0, 1, 1,
0.4841942, 0.2945957, 1.104702, 0.1764706, 0, 1, 1,
0.4842487, 1.916575, -1.163079, 0.1803922, 0, 1, 1,
0.4861139, -0.2008719, 3.083302, 0.1882353, 0, 1, 1,
0.4865416, 1.27458, 0.8031442, 0.1921569, 0, 1, 1,
0.4881413, 0.07799318, 1.644933, 0.2, 0, 1, 1,
0.4895357, -2.217281, 1.843074, 0.2078431, 0, 1, 1,
0.4897325, 1.656405, 0.3579614, 0.2117647, 0, 1, 1,
0.4903677, -0.06890357, 0.2320545, 0.2196078, 0, 1, 1,
0.4910268, 0.3332206, 2.74068, 0.2235294, 0, 1, 1,
0.502188, -3.004474, 3.907212, 0.2313726, 0, 1, 1,
0.5038466, 0.01677761, 0.9728445, 0.2352941, 0, 1, 1,
0.5087649, 0.7431666, 0.7886292, 0.2431373, 0, 1, 1,
0.5114626, 1.214853, 1.561724, 0.2470588, 0, 1, 1,
0.516195, 0.6028851, 0.1372116, 0.254902, 0, 1, 1,
0.5173734, -2.607153, 1.383138, 0.2588235, 0, 1, 1,
0.5216371, 1.57259, -0.8691885, 0.2666667, 0, 1, 1,
0.5308648, -0.3312228, 0.7807724, 0.2705882, 0, 1, 1,
0.5311875, -1.855492, 1.307931, 0.2784314, 0, 1, 1,
0.5329476, 0.4743518, -0.1807269, 0.282353, 0, 1, 1,
0.5341851, 1.564726, 1.668718, 0.2901961, 0, 1, 1,
0.5378074, -2.383372, 4.055106, 0.2941177, 0, 1, 1,
0.5409201, 0.6317951, 0.04429097, 0.3019608, 0, 1, 1,
0.543337, 1.913705, 1.058894, 0.3098039, 0, 1, 1,
0.5453541, -0.5787438, 2.50177, 0.3137255, 0, 1, 1,
0.5455323, -1.19671, 2.217334, 0.3215686, 0, 1, 1,
0.5470335, -0.102873, 1.310079, 0.3254902, 0, 1, 1,
0.5472575, -0.3917637, 1.20383, 0.3333333, 0, 1, 1,
0.5545362, 0.2645017, 2.05053, 0.3372549, 0, 1, 1,
0.5586635, 0.8223492, 0.6490338, 0.345098, 0, 1, 1,
0.5589519, 0.8269799, 0.7649113, 0.3490196, 0, 1, 1,
0.5649911, -1.098703, 1.639635, 0.3568628, 0, 1, 1,
0.5659397, 0.6814542, -0.7867883, 0.3607843, 0, 1, 1,
0.5690398, -0.5759801, 3.458194, 0.3686275, 0, 1, 1,
0.5786562, 0.6872092, -1.626538, 0.372549, 0, 1, 1,
0.5839412, -1.644709, 3.816058, 0.3803922, 0, 1, 1,
0.5840402, 0.5588456, -1.137925, 0.3843137, 0, 1, 1,
0.5863665, -0.8552426, 2.46086, 0.3921569, 0, 1, 1,
0.5870221, -2.446054, 3.884256, 0.3960784, 0, 1, 1,
0.5890344, 2.726997, 0.625497, 0.4039216, 0, 1, 1,
0.5900064, -0.3997098, 0.9351817, 0.4117647, 0, 1, 1,
0.5944881, -0.8042731, 1.168732, 0.4156863, 0, 1, 1,
0.5969918, 1.423048, 0.1408769, 0.4235294, 0, 1, 1,
0.6005769, -0.1739158, 1.941963, 0.427451, 0, 1, 1,
0.6103284, 0.4187922, -1.428947, 0.4352941, 0, 1, 1,
0.6120947, -0.7254169, 2.604097, 0.4392157, 0, 1, 1,
0.6221626, 0.3429583, 1.322759, 0.4470588, 0, 1, 1,
0.6232807, 0.6712191, 2.928429, 0.4509804, 0, 1, 1,
0.6241683, 0.492336, 1.259802, 0.4588235, 0, 1, 1,
0.629878, -0.2602644, 3.075942, 0.4627451, 0, 1, 1,
0.6305343, 0.113969, 0.8351226, 0.4705882, 0, 1, 1,
0.6316962, 0.6435126, -0.1461612, 0.4745098, 0, 1, 1,
0.6418107, -0.7174232, 0.8872041, 0.4823529, 0, 1, 1,
0.6443332, -0.2742653, 2.955452, 0.4862745, 0, 1, 1,
0.6516274, 0.448314, 0.8631332, 0.4941176, 0, 1, 1,
0.6574906, 2.574372, -0.4915135, 0.5019608, 0, 1, 1,
0.6659545, 0.4847117, 1.300157, 0.5058824, 0, 1, 1,
0.666801, -1.001486, -0.03191666, 0.5137255, 0, 1, 1,
0.6675299, -0.02694227, -0.4342764, 0.5176471, 0, 1, 1,
0.6675988, 0.7900203, 1.003524, 0.5254902, 0, 1, 1,
0.6732623, 0.7404757, 0.9786667, 0.5294118, 0, 1, 1,
0.676928, -0.02758099, 1.80475, 0.5372549, 0, 1, 1,
0.6780626, 0.7948587, 1.904806, 0.5411765, 0, 1, 1,
0.6792561, 0.5225271, 1.880088, 0.5490196, 0, 1, 1,
0.6851054, -0.6777247, 1.563065, 0.5529412, 0, 1, 1,
0.6853313, -0.006941519, 1.115085, 0.5607843, 0, 1, 1,
0.6867991, -0.297391, 1.91265, 0.5647059, 0, 1, 1,
0.6884601, 0.2068596, 2.325419, 0.572549, 0, 1, 1,
0.6900654, 0.02045403, 1.253128, 0.5764706, 0, 1, 1,
0.6924009, 0.3570484, 1.956987, 0.5843138, 0, 1, 1,
0.6940565, -0.5355132, 1.066059, 0.5882353, 0, 1, 1,
0.697806, 0.3135956, 2.799752, 0.5960785, 0, 1, 1,
0.7066036, 0.5331926, 1.184636, 0.6039216, 0, 1, 1,
0.7067193, -0.5916269, 1.513795, 0.6078432, 0, 1, 1,
0.7100381, 0.2945816, 1.729749, 0.6156863, 0, 1, 1,
0.7101214, 0.7501342, 1.37911, 0.6196079, 0, 1, 1,
0.7140702, 2.049265, 1.715909, 0.627451, 0, 1, 1,
0.7187485, 0.2845566, 2.166028, 0.6313726, 0, 1, 1,
0.719075, -0.7679994, 1.397605, 0.6392157, 0, 1, 1,
0.719928, 0.6955563, 0.9305831, 0.6431373, 0, 1, 1,
0.7222016, -0.3310059, 1.178913, 0.6509804, 0, 1, 1,
0.7285717, 0.2500837, 1.533365, 0.654902, 0, 1, 1,
0.7292982, -1.802902, 1.580397, 0.6627451, 0, 1, 1,
0.7295603, 0.5647492, -0.4594724, 0.6666667, 0, 1, 1,
0.731635, -0.6750515, 0.2705888, 0.6745098, 0, 1, 1,
0.7327672, -0.5800083, 3.222152, 0.6784314, 0, 1, 1,
0.7356675, 0.1755645, 2.836862, 0.6862745, 0, 1, 1,
0.735978, -0.5286668, 1.671155, 0.6901961, 0, 1, 1,
0.7431093, -0.4081149, 5.157228, 0.6980392, 0, 1, 1,
0.7536052, 1.068671, -0.04802407, 0.7058824, 0, 1, 1,
0.7568276, -0.03976637, 1.255771, 0.7098039, 0, 1, 1,
0.7601482, -1.345059, 0.9043433, 0.7176471, 0, 1, 1,
0.7602544, 0.005000616, 2.700923, 0.7215686, 0, 1, 1,
0.7633594, 0.6133471, 0.6516106, 0.7294118, 0, 1, 1,
0.7700754, -0.8145943, 2.396473, 0.7333333, 0, 1, 1,
0.7703708, 0.724495, 0.6914389, 0.7411765, 0, 1, 1,
0.773653, 0.895562, 1.849612, 0.7450981, 0, 1, 1,
0.7765272, -0.8645852, 3.168775, 0.7529412, 0, 1, 1,
0.7775932, 0.1577455, 1.932793, 0.7568628, 0, 1, 1,
0.7837973, -1.456808, 2.770189, 0.7647059, 0, 1, 1,
0.7843591, 1.660599, 1.8023, 0.7686275, 0, 1, 1,
0.7847738, 0.681721, 0.5341127, 0.7764706, 0, 1, 1,
0.7849817, -0.3458919, 2.638275, 0.7803922, 0, 1, 1,
0.7898564, -0.2412366, 0.0239922, 0.7882353, 0, 1, 1,
0.7932035, -1.0375, 2.034722, 0.7921569, 0, 1, 1,
0.798704, -0.5753294, 2.728475, 0.8, 0, 1, 1,
0.7988557, 0.2021725, 1.799793, 0.8078431, 0, 1, 1,
0.803883, 0.1937114, 1.249866, 0.8117647, 0, 1, 1,
0.8068308, -1.503932, 2.907388, 0.8196079, 0, 1, 1,
0.8142337, -0.8833623, 1.485035, 0.8235294, 0, 1, 1,
0.814949, 0.2156002, 1.547875, 0.8313726, 0, 1, 1,
0.8166586, 1.329722, 1.609639, 0.8352941, 0, 1, 1,
0.8220728, 1.089956, 0.6737912, 0.8431373, 0, 1, 1,
0.8233463, 0.3304296, 0.1413584, 0.8470588, 0, 1, 1,
0.8277411, 1.401956, 0.8834338, 0.854902, 0, 1, 1,
0.8374887, -1.939727, 3.383889, 0.8588235, 0, 1, 1,
0.8446805, 0.8564135, 0.1524715, 0.8666667, 0, 1, 1,
0.8487019, 0.2149938, 1.781395, 0.8705882, 0, 1, 1,
0.8638161, -0.7357651, 2.273417, 0.8784314, 0, 1, 1,
0.8638777, 1.03349, 1.787634, 0.8823529, 0, 1, 1,
0.8750048, 0.1208633, 1.7611, 0.8901961, 0, 1, 1,
0.8842337, 0.2834366, 1.997741, 0.8941177, 0, 1, 1,
0.8853334, 1.102057, -0.1383612, 0.9019608, 0, 1, 1,
0.8861139, 0.04336143, 3.315295, 0.9098039, 0, 1, 1,
0.891679, -1.352114, 3.845927, 0.9137255, 0, 1, 1,
0.8917931, 0.08731215, -0.8135712, 0.9215686, 0, 1, 1,
0.8973525, 1.170265, 1.098376, 0.9254902, 0, 1, 1,
0.8978556, -1.473412, 2.674201, 0.9333333, 0, 1, 1,
0.9045731, -0.6225234, 0.7491761, 0.9372549, 0, 1, 1,
0.9060643, 0.4564087, 0.2676883, 0.945098, 0, 1, 1,
0.9154993, -1.087797, 0.06299112, 0.9490196, 0, 1, 1,
0.9170557, 0.9916564, -0.2783861, 0.9568627, 0, 1, 1,
0.9268146, 0.3746869, 2.327231, 0.9607843, 0, 1, 1,
0.9291218, 0.4654894, 2.71007, 0.9686275, 0, 1, 1,
0.9293605, 0.2697805, 2.978222, 0.972549, 0, 1, 1,
0.9361974, -0.1460322, 1.331931, 0.9803922, 0, 1, 1,
0.936847, -1.002262, 2.783107, 0.9843137, 0, 1, 1,
0.9373582, -0.1412824, 2.709826, 0.9921569, 0, 1, 1,
0.9445179, 0.1730722, 1.012965, 0.9960784, 0, 1, 1,
0.9492351, -1.804737, 2.028705, 1, 0, 0.9960784, 1,
0.9533351, 2.418196, -0.7534303, 1, 0, 0.9882353, 1,
0.9533787, -1.110141, 3.434217, 1, 0, 0.9843137, 1,
0.9534608, 0.769065, 1.271914, 1, 0, 0.9764706, 1,
0.9543142, 0.9091571, 0.9414109, 1, 0, 0.972549, 1,
0.9556376, -1.779489, 4.995641, 1, 0, 0.9647059, 1,
0.9686472, 0.02360776, 1.752131, 1, 0, 0.9607843, 1,
0.9701953, 2.087675, -0.8851743, 1, 0, 0.9529412, 1,
0.9754235, 0.2503296, 1.133543, 1, 0, 0.9490196, 1,
0.9766113, 0.1389867, 1.287198, 1, 0, 0.9411765, 1,
0.9787788, -0.3818074, 1.644188, 1, 0, 0.9372549, 1,
0.9893036, 0.5330262, 3.296684, 1, 0, 0.9294118, 1,
0.9915664, -0.4517892, 3.690295, 1, 0, 0.9254902, 1,
0.9931672, -0.04323523, 1.228631, 1, 0, 0.9176471, 1,
0.9963227, 1.117859, 0.5544229, 1, 0, 0.9137255, 1,
1.002748, 0.1533392, 2.035546, 1, 0, 0.9058824, 1,
1.006781, -0.4616514, 1.084961, 1, 0, 0.9019608, 1,
1.009028, -0.1294773, 2.586327, 1, 0, 0.8941177, 1,
1.011713, -1.18352, 0.1891512, 1, 0, 0.8862745, 1,
1.012702, 0.009743913, 0.4263974, 1, 0, 0.8823529, 1,
1.014706, 0.7989545, 1.421745, 1, 0, 0.8745098, 1,
1.018216, 0.6001356, 1.434762, 1, 0, 0.8705882, 1,
1.025403, 0.4377965, 1.9108, 1, 0, 0.8627451, 1,
1.026774, -2.684623, 4.049195, 1, 0, 0.8588235, 1,
1.02761, -0.1741021, 0.1966967, 1, 0, 0.8509804, 1,
1.041709, 0.3001436, 1.442618, 1, 0, 0.8470588, 1,
1.047613, -0.6907212, 2.622507, 1, 0, 0.8392157, 1,
1.047667, -0.5318902, -0.2120173, 1, 0, 0.8352941, 1,
1.054175, -1.032996, 2.026858, 1, 0, 0.827451, 1,
1.055945, -0.7422501, 3.405272, 1, 0, 0.8235294, 1,
1.071731, 1.85987, 1.894117, 1, 0, 0.8156863, 1,
1.076954, 0.3539394, 0.2843427, 1, 0, 0.8117647, 1,
1.078462, -1.054671, 2.023049, 1, 0, 0.8039216, 1,
1.082507, -0.1576523, 1.192724, 1, 0, 0.7960784, 1,
1.08266, 1.290033, 1.451928, 1, 0, 0.7921569, 1,
1.083657, 1.072957, 1.644442, 1, 0, 0.7843137, 1,
1.087552, -1.099127, 4.879097, 1, 0, 0.7803922, 1,
1.091741, -0.9961438, 3.771826, 1, 0, 0.772549, 1,
1.093877, 0.535751, 1.33008, 1, 0, 0.7686275, 1,
1.099181, 0.8009715, 1.361841, 1, 0, 0.7607843, 1,
1.112957, -0.1409401, 1.961598, 1, 0, 0.7568628, 1,
1.118587, 0.497277, 0.6429765, 1, 0, 0.7490196, 1,
1.119848, 0.06646993, 2.119096, 1, 0, 0.7450981, 1,
1.128465, 0.04830283, 1.954422, 1, 0, 0.7372549, 1,
1.131388, -1.186181, 2.490361, 1, 0, 0.7333333, 1,
1.146774, -0.3239874, 1.224645, 1, 0, 0.7254902, 1,
1.148636, -0.7636614, 0.9071012, 1, 0, 0.7215686, 1,
1.149376, 0.2344295, 1.253956, 1, 0, 0.7137255, 1,
1.151708, 0.02114987, 1.934384, 1, 0, 0.7098039, 1,
1.15295, -0.4214496, 4.481686, 1, 0, 0.7019608, 1,
1.162985, -0.9931697, 3.553947, 1, 0, 0.6941177, 1,
1.164085, -0.2525153, 3.082495, 1, 0, 0.6901961, 1,
1.16657, -0.03002561, 2.926771, 1, 0, 0.682353, 1,
1.170034, 0.852796, 0.3333715, 1, 0, 0.6784314, 1,
1.172581, -1.107429, 1.019054, 1, 0, 0.6705883, 1,
1.179707, 1.617911, 2.952608, 1, 0, 0.6666667, 1,
1.192704, 1.359728, -0.1855557, 1, 0, 0.6588235, 1,
1.196725, -0.145349, 3.226454, 1, 0, 0.654902, 1,
1.198195, 0.1406396, 2.159785, 1, 0, 0.6470588, 1,
1.206775, -0.3101914, 3.800987, 1, 0, 0.6431373, 1,
1.208927, -0.757611, 2.055791, 1, 0, 0.6352941, 1,
1.212845, 1.378513, -0.5109931, 1, 0, 0.6313726, 1,
1.214624, 0.5978655, 0.9079785, 1, 0, 0.6235294, 1,
1.217609, -1.179264, 1.672593, 1, 0, 0.6196079, 1,
1.221871, -0.6092305, 1.775382, 1, 0, 0.6117647, 1,
1.229948, -0.6471109, 2.183363, 1, 0, 0.6078432, 1,
1.230417, -0.3881481, 0.5297791, 1, 0, 0.6, 1,
1.237639, 1.203184, 0.4865227, 1, 0, 0.5921569, 1,
1.243673, 0.2165435, 0.7285403, 1, 0, 0.5882353, 1,
1.245029, -0.4787243, 2.96248, 1, 0, 0.5803922, 1,
1.257326, -0.9580161, 3.511853, 1, 0, 0.5764706, 1,
1.265818, -0.2715372, 2.393041, 1, 0, 0.5686275, 1,
1.267835, -0.5460122, 1.601658, 1, 0, 0.5647059, 1,
1.268643, -0.9875123, 2.895694, 1, 0, 0.5568628, 1,
1.26957, 0.9571269, -1.398745, 1, 0, 0.5529412, 1,
1.277782, 0.3260075, 2.216022, 1, 0, 0.5450981, 1,
1.282662, 0.06386201, 2.300311, 1, 0, 0.5411765, 1,
1.282945, 0.2109794, -0.07628424, 1, 0, 0.5333334, 1,
1.284708, 0.3772908, 2.047583, 1, 0, 0.5294118, 1,
1.293467, -2.157458, 3.370707, 1, 0, 0.5215687, 1,
1.307943, 0.4834754, 1.894032, 1, 0, 0.5176471, 1,
1.30928, -0.2834056, 1.242142, 1, 0, 0.509804, 1,
1.312509, 0.1834699, -0.09134851, 1, 0, 0.5058824, 1,
1.322456, -1.007748, 3.512365, 1, 0, 0.4980392, 1,
1.326037, 1.648559, 0.6452531, 1, 0, 0.4901961, 1,
1.334582, 1.373347, 0.6153864, 1, 0, 0.4862745, 1,
1.336236, -0.5611718, 2.362152, 1, 0, 0.4784314, 1,
1.338407, 1.450346, 0.9384828, 1, 0, 0.4745098, 1,
1.341959, -1.953896, 3.005235, 1, 0, 0.4666667, 1,
1.342288, 0.4968848, 0.902777, 1, 0, 0.4627451, 1,
1.353556, 0.7521757, 2.576316, 1, 0, 0.454902, 1,
1.359061, -0.7024814, 1.403046, 1, 0, 0.4509804, 1,
1.368563, -1.787087, 2.095078, 1, 0, 0.4431373, 1,
1.379404, -1.483697, 3.811963, 1, 0, 0.4392157, 1,
1.380397, -1.047926, 2.505422, 1, 0, 0.4313726, 1,
1.391992, -0.534871, 2.409427, 1, 0, 0.427451, 1,
1.421617, -1.19048, 2.97567, 1, 0, 0.4196078, 1,
1.431587, 0.07120194, 2.952602, 1, 0, 0.4156863, 1,
1.432166, 0.692993, 1.624917, 1, 0, 0.4078431, 1,
1.432554, 1.345508, 1.331219, 1, 0, 0.4039216, 1,
1.435438, 1.284159, 0.9545346, 1, 0, 0.3960784, 1,
1.435737, 1.436556, -0.0385719, 1, 0, 0.3882353, 1,
1.443255, -2.063443, 4.107265, 1, 0, 0.3843137, 1,
1.44517, -0.2834583, 0.9975401, 1, 0, 0.3764706, 1,
1.449315, -1.058138, 3.494056, 1, 0, 0.372549, 1,
1.451243, -0.4428985, 1.711098, 1, 0, 0.3647059, 1,
1.45331, -1.650236, 3.121001, 1, 0, 0.3607843, 1,
1.456209, 0.7125421, 0.4767661, 1, 0, 0.3529412, 1,
1.463187, -1.848819, 1.995826, 1, 0, 0.3490196, 1,
1.469337, 0.5757678, -0.5166022, 1, 0, 0.3411765, 1,
1.472198, -0.4576204, 0.2404049, 1, 0, 0.3372549, 1,
1.48527, -0.1727242, 2.718965, 1, 0, 0.3294118, 1,
1.49881, -0.6926706, 2.525486, 1, 0, 0.3254902, 1,
1.499672, -0.823459, 2.604091, 1, 0, 0.3176471, 1,
1.50991, -1.900492, 2.225095, 1, 0, 0.3137255, 1,
1.51068, 0.05022792, 2.054434, 1, 0, 0.3058824, 1,
1.511603, -2.028256, 3.133867, 1, 0, 0.2980392, 1,
1.537711, 0.3764221, 0.677116, 1, 0, 0.2941177, 1,
1.539541, 0.5677289, 2.144542, 1, 0, 0.2862745, 1,
1.545082, 1.03213, 1.366187, 1, 0, 0.282353, 1,
1.556824, 0.4587896, 2.494163, 1, 0, 0.2745098, 1,
1.559985, 1.403544, 0.9525618, 1, 0, 0.2705882, 1,
1.569764, -0.307198, 2.804454, 1, 0, 0.2627451, 1,
1.590011, 0.2758704, 0.9351153, 1, 0, 0.2588235, 1,
1.601693, 0.7990336, 1.312614, 1, 0, 0.2509804, 1,
1.608056, 1.182743, -0.4840818, 1, 0, 0.2470588, 1,
1.626952, 0.6831453, 1.315619, 1, 0, 0.2392157, 1,
1.628684, 0.1967166, 2.562752, 1, 0, 0.2352941, 1,
1.630026, 0.2377673, 0.9280167, 1, 0, 0.227451, 1,
1.640677, 0.5971136, 0.9017334, 1, 0, 0.2235294, 1,
1.645679, 0.154832, 2.352436, 1, 0, 0.2156863, 1,
1.652244, 0.5934753, 2.324923, 1, 0, 0.2117647, 1,
1.652954, -0.3321155, 1.385146, 1, 0, 0.2039216, 1,
1.666885, 1.475209, -2.670845, 1, 0, 0.1960784, 1,
1.673075, 1.437097, 1.023501, 1, 0, 0.1921569, 1,
1.698178, 1.023375, 0.6219807, 1, 0, 0.1843137, 1,
1.728219, 0.02078277, 0.4059227, 1, 0, 0.1803922, 1,
1.736147, 0.7706018, 0.1918736, 1, 0, 0.172549, 1,
1.799816, 1.620504, 1.509107, 1, 0, 0.1686275, 1,
1.819655, 0.3017434, -0.8174326, 1, 0, 0.1607843, 1,
1.866319, -0.1129343, 2.774632, 1, 0, 0.1568628, 1,
1.891809, -0.8335751, 2.264806, 1, 0, 0.1490196, 1,
1.898852, -0.3749048, 1.469055, 1, 0, 0.145098, 1,
1.909221, -0.645654, 1.226492, 1, 0, 0.1372549, 1,
1.940499, 0.300753, 0.8918051, 1, 0, 0.1333333, 1,
1.941409, 0.09080373, 1.869116, 1, 0, 0.1254902, 1,
1.947083, -0.4041772, 1.71959, 1, 0, 0.1215686, 1,
1.961376, 1.526002, 0.6250581, 1, 0, 0.1137255, 1,
1.978687, 0.4262875, 1.859291, 1, 0, 0.1098039, 1,
2.074268, 0.8032116, 0.531224, 1, 0, 0.1019608, 1,
2.082417, -0.7769343, 0.1526081, 1, 0, 0.09411765, 1,
2.087233, 0.4413094, 1.030893, 1, 0, 0.09019608, 1,
2.11638, 0.5155004, 1.928179, 1, 0, 0.08235294, 1,
2.124089, 0.1162878, -0.436601, 1, 0, 0.07843138, 1,
2.156721, -0.7048252, 0.6137571, 1, 0, 0.07058824, 1,
2.164492, -1.244037, 1.173519, 1, 0, 0.06666667, 1,
2.294518, 1.4699, 0.009271846, 1, 0, 0.05882353, 1,
2.317542, -0.7326428, 0.7474065, 1, 0, 0.05490196, 1,
2.330861, 0.3744017, 2.668919, 1, 0, 0.04705882, 1,
2.366369, 0.2024346, 1.715676, 1, 0, 0.04313726, 1,
2.411473, 0.0184087, 0.03012813, 1, 0, 0.03529412, 1,
2.442065, 1.120094, 0.5362583, 1, 0, 0.03137255, 1,
2.463899, -0.5889972, 0.5969634, 1, 0, 0.02352941, 1,
2.476934, 0.9392707, 2.407614, 1, 0, 0.01960784, 1,
2.607982, 0.9332428, 1.600451, 1, 0, 0.01176471, 1,
2.804183, 0.2183953, 1.370033, 1, 0, 0.007843138, 1
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
0.09977114, -4.340767, -7.172933, 0, -0.5, 0.5, 0.5,
0.09977114, -4.340767, -7.172933, 1, -0.5, 0.5, 0.5,
0.09977114, -4.340767, -7.172933, 1, 1.5, 0.5, 0.5,
0.09977114, -4.340767, -7.172933, 0, 1.5, 0.5, 0.5
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
-3.521437, 0.1901388, -7.172933, 0, -0.5, 0.5, 0.5,
-3.521437, 0.1901388, -7.172933, 1, -0.5, 0.5, 0.5,
-3.521437, 0.1901388, -7.172933, 1, 1.5, 0.5, 0.5,
-3.521437, 0.1901388, -7.172933, 0, 1.5, 0.5, 0.5
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
-3.521437, -4.340767, 0.4679201, 0, -0.5, 0.5, 0.5,
-3.521437, -4.340767, 0.4679201, 1, -0.5, 0.5, 0.5,
-3.521437, -4.340767, 0.4679201, 1, 1.5, 0.5, 0.5,
-3.521437, -4.340767, 0.4679201, 0, 1.5, 0.5, 0.5
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
-2, -3.295174, -5.409659,
2, -3.295174, -5.409659,
-2, -3.295174, -5.409659,
-2, -3.469439, -5.703538,
-1, -3.295174, -5.409659,
-1, -3.469439, -5.703538,
0, -3.295174, -5.409659,
0, -3.469439, -5.703538,
1, -3.295174, -5.409659,
1, -3.469439, -5.703538,
2, -3.295174, -5.409659,
2, -3.469439, -5.703538
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
-2, -3.817971, -6.291296, 0, -0.5, 0.5, 0.5,
-2, -3.817971, -6.291296, 1, -0.5, 0.5, 0.5,
-2, -3.817971, -6.291296, 1, 1.5, 0.5, 0.5,
-2, -3.817971, -6.291296, 0, 1.5, 0.5, 0.5,
-1, -3.817971, -6.291296, 0, -0.5, 0.5, 0.5,
-1, -3.817971, -6.291296, 1, -0.5, 0.5, 0.5,
-1, -3.817971, -6.291296, 1, 1.5, 0.5, 0.5,
-1, -3.817971, -6.291296, 0, 1.5, 0.5, 0.5,
0, -3.817971, -6.291296, 0, -0.5, 0.5, 0.5,
0, -3.817971, -6.291296, 1, -0.5, 0.5, 0.5,
0, -3.817971, -6.291296, 1, 1.5, 0.5, 0.5,
0, -3.817971, -6.291296, 0, 1.5, 0.5, 0.5,
1, -3.817971, -6.291296, 0, -0.5, 0.5, 0.5,
1, -3.817971, -6.291296, 1, -0.5, 0.5, 0.5,
1, -3.817971, -6.291296, 1, 1.5, 0.5, 0.5,
1, -3.817971, -6.291296, 0, 1.5, 0.5, 0.5,
2, -3.817971, -6.291296, 0, -0.5, 0.5, 0.5,
2, -3.817971, -6.291296, 1, -0.5, 0.5, 0.5,
2, -3.817971, -6.291296, 1, 1.5, 0.5, 0.5,
2, -3.817971, -6.291296, 0, 1.5, 0.5, 0.5
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
-2.685774, -3, -5.409659,
-2.685774, 3, -5.409659,
-2.685774, -3, -5.409659,
-2.825051, -3, -5.703538,
-2.685774, -2, -5.409659,
-2.825051, -2, -5.703538,
-2.685774, -1, -5.409659,
-2.825051, -1, -5.703538,
-2.685774, 0, -5.409659,
-2.825051, 0, -5.703538,
-2.685774, 1, -5.409659,
-2.825051, 1, -5.703538,
-2.685774, 2, -5.409659,
-2.825051, 2, -5.703538,
-2.685774, 3, -5.409659,
-2.825051, 3, -5.703538
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
-3.103605, -3, -6.291296, 0, -0.5, 0.5, 0.5,
-3.103605, -3, -6.291296, 1, -0.5, 0.5, 0.5,
-3.103605, -3, -6.291296, 1, 1.5, 0.5, 0.5,
-3.103605, -3, -6.291296, 0, 1.5, 0.5, 0.5,
-3.103605, -2, -6.291296, 0, -0.5, 0.5, 0.5,
-3.103605, -2, -6.291296, 1, -0.5, 0.5, 0.5,
-3.103605, -2, -6.291296, 1, 1.5, 0.5, 0.5,
-3.103605, -2, -6.291296, 0, 1.5, 0.5, 0.5,
-3.103605, -1, -6.291296, 0, -0.5, 0.5, 0.5,
-3.103605, -1, -6.291296, 1, -0.5, 0.5, 0.5,
-3.103605, -1, -6.291296, 1, 1.5, 0.5, 0.5,
-3.103605, -1, -6.291296, 0, 1.5, 0.5, 0.5,
-3.103605, 0, -6.291296, 0, -0.5, 0.5, 0.5,
-3.103605, 0, -6.291296, 1, -0.5, 0.5, 0.5,
-3.103605, 0, -6.291296, 1, 1.5, 0.5, 0.5,
-3.103605, 0, -6.291296, 0, 1.5, 0.5, 0.5,
-3.103605, 1, -6.291296, 0, -0.5, 0.5, 0.5,
-3.103605, 1, -6.291296, 1, -0.5, 0.5, 0.5,
-3.103605, 1, -6.291296, 1, 1.5, 0.5, 0.5,
-3.103605, 1, -6.291296, 0, 1.5, 0.5, 0.5,
-3.103605, 2, -6.291296, 0, -0.5, 0.5, 0.5,
-3.103605, 2, -6.291296, 1, -0.5, 0.5, 0.5,
-3.103605, 2, -6.291296, 1, 1.5, 0.5, 0.5,
-3.103605, 2, -6.291296, 0, 1.5, 0.5, 0.5,
-3.103605, 3, -6.291296, 0, -0.5, 0.5, 0.5,
-3.103605, 3, -6.291296, 1, -0.5, 0.5, 0.5,
-3.103605, 3, -6.291296, 1, 1.5, 0.5, 0.5,
-3.103605, 3, -6.291296, 0, 1.5, 0.5, 0.5
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
-2.685774, -3.295174, -4,
-2.685774, -3.295174, 6,
-2.685774, -3.295174, -4,
-2.825051, -3.469439, -4,
-2.685774, -3.295174, -2,
-2.825051, -3.469439, -2,
-2.685774, -3.295174, 0,
-2.825051, -3.469439, 0,
-2.685774, -3.295174, 2,
-2.825051, -3.469439, 2,
-2.685774, -3.295174, 4,
-2.825051, -3.469439, 4,
-2.685774, -3.295174, 6,
-2.825051, -3.469439, 6
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
-3.103605, -3.817971, -4, 0, -0.5, 0.5, 0.5,
-3.103605, -3.817971, -4, 1, -0.5, 0.5, 0.5,
-3.103605, -3.817971, -4, 1, 1.5, 0.5, 0.5,
-3.103605, -3.817971, -4, 0, 1.5, 0.5, 0.5,
-3.103605, -3.817971, -2, 0, -0.5, 0.5, 0.5,
-3.103605, -3.817971, -2, 1, -0.5, 0.5, 0.5,
-3.103605, -3.817971, -2, 1, 1.5, 0.5, 0.5,
-3.103605, -3.817971, -2, 0, 1.5, 0.5, 0.5,
-3.103605, -3.817971, 0, 0, -0.5, 0.5, 0.5,
-3.103605, -3.817971, 0, 1, -0.5, 0.5, 0.5,
-3.103605, -3.817971, 0, 1, 1.5, 0.5, 0.5,
-3.103605, -3.817971, 0, 0, 1.5, 0.5, 0.5,
-3.103605, -3.817971, 2, 0, -0.5, 0.5, 0.5,
-3.103605, -3.817971, 2, 1, -0.5, 0.5, 0.5,
-3.103605, -3.817971, 2, 1, 1.5, 0.5, 0.5,
-3.103605, -3.817971, 2, 0, 1.5, 0.5, 0.5,
-3.103605, -3.817971, 4, 0, -0.5, 0.5, 0.5,
-3.103605, -3.817971, 4, 1, -0.5, 0.5, 0.5,
-3.103605, -3.817971, 4, 1, 1.5, 0.5, 0.5,
-3.103605, -3.817971, 4, 0, 1.5, 0.5, 0.5,
-3.103605, -3.817971, 6, 0, -0.5, 0.5, 0.5,
-3.103605, -3.817971, 6, 1, -0.5, 0.5, 0.5,
-3.103605, -3.817971, 6, 1, 1.5, 0.5, 0.5,
-3.103605, -3.817971, 6, 0, 1.5, 0.5, 0.5
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
-2.685774, -3.295174, -5.409659,
-2.685774, 3.675451, -5.409659,
-2.685774, -3.295174, 6.3455,
-2.685774, 3.675451, 6.3455,
-2.685774, -3.295174, -5.409659,
-2.685774, -3.295174, 6.3455,
-2.685774, 3.675451, -5.409659,
-2.685774, 3.675451, 6.3455,
-2.685774, -3.295174, -5.409659,
2.885316, -3.295174, -5.409659,
-2.685774, -3.295174, 6.3455,
2.885316, -3.295174, 6.3455,
-2.685774, 3.675451, -5.409659,
2.885316, 3.675451, -5.409659,
-2.685774, 3.675451, 6.3455,
2.885316, 3.675451, 6.3455,
2.885316, -3.295174, -5.409659,
2.885316, 3.675451, -5.409659,
2.885316, -3.295174, 6.3455,
2.885316, 3.675451, 6.3455,
2.885316, -3.295174, -5.409659,
2.885316, -3.295174, 6.3455,
2.885316, 3.675451, -5.409659,
2.885316, 3.675451, 6.3455
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
var radius = 7.8807;
var distance = 35.06212;
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
mvMatrix.translate( -0.09977114, -0.1901388, -0.4679201 );
mvMatrix.scale( 1.529462, 1.222382, 0.7248534 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.06212);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
choline_chloride<-read.table("choline_chloride.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-choline_chloride$V2
```

```
## Error in eval(expr, envir, enclos): object 'choline_chloride' not found
```

```r
y<-choline_chloride$V3
```

```
## Error in eval(expr, envir, enclos): object 'choline_chloride' not found
```

```r
z<-choline_chloride$V4
```

```
## Error in eval(expr, envir, enclos): object 'choline_chloride' not found
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
-2.604641, -0.6099574, -1.89475, 0, 0, 1, 1, 1,
-2.599303, 0.07925934, -2.642226, 1, 0, 0, 1, 1,
-2.590925, -0.3340599, -4.350606, 1, 0, 0, 1, 1,
-2.500586, -0.02519016, -1.694374, 1, 0, 0, 1, 1,
-2.404738, 0.01576713, 0.1643031, 1, 0, 0, 1, 1,
-2.309668, 0.8845888, -0.2703381, 1, 0, 0, 1, 1,
-2.294434, 0.6336961, 0.004266511, 0, 0, 0, 1, 1,
-2.272327, 0.09067506, -1.522386, 0, 0, 0, 1, 1,
-2.251919, 0.254909, -1.227311, 0, 0, 0, 1, 1,
-2.248415, -0.2505999, -3.101981, 0, 0, 0, 1, 1,
-2.232059, 0.3885208, -1.117901, 0, 0, 0, 1, 1,
-2.225211, 0.5306023, -2.167345, 0, 0, 0, 1, 1,
-2.212414, 1.633406, -0.315734, 0, 0, 0, 1, 1,
-2.168203, -0.4923619, -2.388335, 1, 1, 1, 1, 1,
-2.161527, -0.2242909, -1.579591, 1, 1, 1, 1, 1,
-2.152946, 0.2452756, -0.8917287, 1, 1, 1, 1, 1,
-2.151025, 0.1909082, -0.6162248, 1, 1, 1, 1, 1,
-2.145558, -0.1883133, -2.356851, 1, 1, 1, 1, 1,
-2.135847, -0.7219555, 0.5595282, 1, 1, 1, 1, 1,
-2.124165, -1.632229, -1.247479, 1, 1, 1, 1, 1,
-2.108133, -0.7248588, -1.617281, 1, 1, 1, 1, 1,
-2.086366, 1.310695, -0.9323533, 1, 1, 1, 1, 1,
-2.000489, 1.643504, 1.243693, 1, 1, 1, 1, 1,
-1.977758, -0.4604684, 1.57878, 1, 1, 1, 1, 1,
-1.973358, 1.296649, -1.669218, 1, 1, 1, 1, 1,
-1.97276, -0.3787591, -2.149094, 1, 1, 1, 1, 1,
-1.970598, -2.065537, -3.555849, 1, 1, 1, 1, 1,
-1.964132, -0.1057505, -0.8619112, 1, 1, 1, 1, 1,
-1.953622, -1.321342, -2.313749, 0, 0, 1, 1, 1,
-1.935608, -0.3570072, -1.879932, 1, 0, 0, 1, 1,
-1.927337, -0.6513325, -2.50574, 1, 0, 0, 1, 1,
-1.865698, -1.358252, -2.169622, 1, 0, 0, 1, 1,
-1.842535, -1.180302, -4.101064, 1, 0, 0, 1, 1,
-1.84245, 0.07106083, -0.8242981, 1, 0, 0, 1, 1,
-1.824488, 0.4846744, -1.371444, 0, 0, 0, 1, 1,
-1.82337, 1.395995, -0.9425349, 0, 0, 0, 1, 1,
-1.8227, 1.003954, -0.04471206, 0, 0, 0, 1, 1,
-1.773604, 0.8066848, -2.741155, 0, 0, 0, 1, 1,
-1.755909, -0.8351325, -3.73615, 0, 0, 0, 1, 1,
-1.716536, 0.3713115, -2.391448, 0, 0, 0, 1, 1,
-1.715671, -2.061315, -0.7814619, 0, 0, 0, 1, 1,
-1.706953, -1.378976, -1.581923, 1, 1, 1, 1, 1,
-1.704567, 0.3457906, -1.493016, 1, 1, 1, 1, 1,
-1.695322, 0.1367484, -3.501625, 1, 1, 1, 1, 1,
-1.685925, 0.1819803, -0.2982176, 1, 1, 1, 1, 1,
-1.684894, -0.7766615, -2.132756, 1, 1, 1, 1, 1,
-1.68451, 0.3164935, -0.9705979, 1, 1, 1, 1, 1,
-1.684133, 0.3129737, -2.84673, 1, 1, 1, 1, 1,
-1.67913, 0.01035133, -1.701727, 1, 1, 1, 1, 1,
-1.671017, -0.1570424, -0.7070811, 1, 1, 1, 1, 1,
-1.669914, -0.08015621, -3.653692, 1, 1, 1, 1, 1,
-1.656104, -0.1695731, -2.360548, 1, 1, 1, 1, 1,
-1.650944, -1.19108, -1.107029, 1, 1, 1, 1, 1,
-1.650134, -1.197533, -3.380689, 1, 1, 1, 1, 1,
-1.648534, 1.38108, 0.6556578, 1, 1, 1, 1, 1,
-1.643803, -0.1567753, -0.5784408, 1, 1, 1, 1, 1,
-1.643057, 1.203993, -1.139077, 0, 0, 1, 1, 1,
-1.631598, 0.844168, -1.997186, 1, 0, 0, 1, 1,
-1.624621, 0.1488557, -2.299982, 1, 0, 0, 1, 1,
-1.619138, -0.6634253, -2.059202, 1, 0, 0, 1, 1,
-1.614951, -0.6269861, -2.812071, 1, 0, 0, 1, 1,
-1.613956, 1.242015, -0.1979622, 1, 0, 0, 1, 1,
-1.610217, -1.08881, -2.590969, 0, 0, 0, 1, 1,
-1.60341, -1.559588, -3.117381, 0, 0, 0, 1, 1,
-1.601165, 0.01388182, -4.946687, 0, 0, 0, 1, 1,
-1.58133, 0.4659922, -1.133827, 0, 0, 0, 1, 1,
-1.57466, 1.943521, -1.135768, 0, 0, 0, 1, 1,
-1.574296, -2.050354, -3.963955, 0, 0, 0, 1, 1,
-1.565487, -1.598046, -3.319896, 0, 0, 0, 1, 1,
-1.553961, -0.3870152, -1.371715, 1, 1, 1, 1, 1,
-1.545404, -0.2588427, -1.301026, 1, 1, 1, 1, 1,
-1.527971, 0.9063568, 0.1852486, 1, 1, 1, 1, 1,
-1.519888, 1.36549, -0.9666622, 1, 1, 1, 1, 1,
-1.517855, -1.893329, -1.427751, 1, 1, 1, 1, 1,
-1.517765, -0.7684982, -0.7592413, 1, 1, 1, 1, 1,
-1.506137, 0.1904017, -0.4270565, 1, 1, 1, 1, 1,
-1.504972, 0.539542, -0.5873046, 1, 1, 1, 1, 1,
-1.491597, 0.789133, -1.155913, 1, 1, 1, 1, 1,
-1.475183, -1.01719, -3.154252, 1, 1, 1, 1, 1,
-1.475009, 0.5524129, -1.747987, 1, 1, 1, 1, 1,
-1.470783, -1.076422, -1.332429, 1, 1, 1, 1, 1,
-1.461242, -0.5490819, -3.042764, 1, 1, 1, 1, 1,
-1.459734, 0.1391745, -1.229844, 1, 1, 1, 1, 1,
-1.459271, -0.6742471, -3.08672, 1, 1, 1, 1, 1,
-1.446791, 0.6808506, -0.565703, 0, 0, 1, 1, 1,
-1.436963, 0.1065865, -1.416128, 1, 0, 0, 1, 1,
-1.413222, -0.6807767, -3.213986, 1, 0, 0, 1, 1,
-1.407906, -0.2878856, -1.141895, 1, 0, 0, 1, 1,
-1.399309, -0.7432156, -2.702463, 1, 0, 0, 1, 1,
-1.393551, -0.3635478, -1.075905, 1, 0, 0, 1, 1,
-1.387263, -0.2334397, -3.163766, 0, 0, 0, 1, 1,
-1.383916, 1.857876, 1.221721, 0, 0, 0, 1, 1,
-1.380635, 1.719163, -1.408369, 0, 0, 0, 1, 1,
-1.375297, 0.08452082, 0.7288108, 0, 0, 0, 1, 1,
-1.3708, 0.2628637, -0.8186926, 0, 0, 0, 1, 1,
-1.369286, -0.6995052, -1.677865, 0, 0, 0, 1, 1,
-1.361476, -0.2228838, -2.34005, 0, 0, 0, 1, 1,
-1.352124, 0.5698577, -0.9066935, 1, 1, 1, 1, 1,
-1.35168, 0.5772744, 0.4779337, 1, 1, 1, 1, 1,
-1.341104, -0.9311586, -2.477832, 1, 1, 1, 1, 1,
-1.336976, -1.032727, -2.675261, 1, 1, 1, 1, 1,
-1.333435, -0.2437511, -2.230765, 1, 1, 1, 1, 1,
-1.3322, -0.8116909, -2.284575, 1, 1, 1, 1, 1,
-1.326727, -0.9366786, -1.085411, 1, 1, 1, 1, 1,
-1.317987, -0.08176633, -2.33171, 1, 1, 1, 1, 1,
-1.316691, 0.9019281, -0.3712573, 1, 1, 1, 1, 1,
-1.309683, -0.402957, -1.696385, 1, 1, 1, 1, 1,
-1.30949, -0.6060664, -1.679648, 1, 1, 1, 1, 1,
-1.307226, 0.428266, -3.45342, 1, 1, 1, 1, 1,
-1.28813, -0.7049353, -2.536596, 1, 1, 1, 1, 1,
-1.285035, -0.0381338, -2.602523, 1, 1, 1, 1, 1,
-1.275354, -1.102987, -2.351857, 1, 1, 1, 1, 1,
-1.264891, 0.06536809, -1.130757, 0, 0, 1, 1, 1,
-1.261629, 0.3643706, -1.638703, 1, 0, 0, 1, 1,
-1.261135, 0.2320117, -2.679509, 1, 0, 0, 1, 1,
-1.261105, 0.1723286, -1.764746, 1, 0, 0, 1, 1,
-1.260738, -1.224265, -2.392305, 1, 0, 0, 1, 1,
-1.253722, -0.009937354, -1.172002, 1, 0, 0, 1, 1,
-1.241434, 0.4602283, -1.713151, 0, 0, 0, 1, 1,
-1.236962, -0.7957445, -1.763705, 0, 0, 0, 1, 1,
-1.230649, 0.1782497, -1.271886, 0, 0, 0, 1, 1,
-1.23001, 1.138009, -0.1614205, 0, 0, 0, 1, 1,
-1.22968, 0.1293446, -0.7468739, 0, 0, 0, 1, 1,
-1.229077, 0.5791005, -1.651993, 0, 0, 0, 1, 1,
-1.219439, 1.525876, -0.8576832, 0, 0, 0, 1, 1,
-1.21891, 0.5387732, -0.7843215, 1, 1, 1, 1, 1,
-1.216088, -1.001788, -3.728454, 1, 1, 1, 1, 1,
-1.201178, -0.2634297, -2.193121, 1, 1, 1, 1, 1,
-1.183368, -1.652951, -3.271956, 1, 1, 1, 1, 1,
-1.180997, 0.8940868, -0.7035636, 1, 1, 1, 1, 1,
-1.180372, 0.3554735, -1.146614, 1, 1, 1, 1, 1,
-1.168375, 0.355154, -2.356652, 1, 1, 1, 1, 1,
-1.167232, 1.861379, -1.532912, 1, 1, 1, 1, 1,
-1.166048, 0.3633758, -2.572723, 1, 1, 1, 1, 1,
-1.165693, 0.0592661, -1.253353, 1, 1, 1, 1, 1,
-1.152161, 0.2518156, -1.978575, 1, 1, 1, 1, 1,
-1.148304, 0.1469201, -1.888658, 1, 1, 1, 1, 1,
-1.1473, 0.6540874, -1.780821, 1, 1, 1, 1, 1,
-1.146227, -0.4151468, -1.629873, 1, 1, 1, 1, 1,
-1.127355, -0.09243286, -0.3207405, 1, 1, 1, 1, 1,
-1.1192, 0.02774572, -1.469908, 0, 0, 1, 1, 1,
-1.11033, -0.7288883, -3.48205, 1, 0, 0, 1, 1,
-1.108587, 1.762158, -1.011229, 1, 0, 0, 1, 1,
-1.1065, 0.5239878, -0.8288314, 1, 0, 0, 1, 1,
-1.106411, 1.190723, -1.775925, 1, 0, 0, 1, 1,
-1.105843, -0.574884, -2.449724, 1, 0, 0, 1, 1,
-1.10466, -0.8749359, -2.520804, 0, 0, 0, 1, 1,
-1.101557, -0.2913626, -2.65488, 0, 0, 0, 1, 1,
-1.095979, 0.2639086, -0.1534519, 0, 0, 0, 1, 1,
-1.095225, -1.449218, -2.938414, 0, 0, 0, 1, 1,
-1.090503, 0.120179, 1.453286, 0, 0, 0, 1, 1,
-1.089176, 0.331465, -2.145616, 0, 0, 0, 1, 1,
-1.089067, 0.420591, -0.8162594, 0, 0, 0, 1, 1,
-1.084954, -1.378113, -1.906884, 1, 1, 1, 1, 1,
-1.083403, -0.3630134, -2.488418, 1, 1, 1, 1, 1,
-1.083399, -0.7414671, -2.724262, 1, 1, 1, 1, 1,
-1.081475, -0.2061581, -2.070766, 1, 1, 1, 1, 1,
-1.080293, -1.784073, -1.513383, 1, 1, 1, 1, 1,
-1.079033, 0.2737942, 0.2611186, 1, 1, 1, 1, 1,
-1.076575, -0.7761621, -2.312339, 1, 1, 1, 1, 1,
-1.075929, 0.8258094, -0.5114236, 1, 1, 1, 1, 1,
-1.069139, 0.0792793, -2.697116, 1, 1, 1, 1, 1,
-1.069137, -1.123859, -2.138543, 1, 1, 1, 1, 1,
-1.051064, -1.796303, -2.114334, 1, 1, 1, 1, 1,
-1.045707, 0.5965372, -0.7205487, 1, 1, 1, 1, 1,
-1.044641, 0.2761042, -3.007338, 1, 1, 1, 1, 1,
-1.037586, 0.424539, -0.4537809, 1, 1, 1, 1, 1,
-1.0257, -0.2370243, -3.454425, 1, 1, 1, 1, 1,
-1.02189, 0.8778289, -0.006525836, 0, 0, 1, 1, 1,
-1.021147, -0.9065302, -3.874469, 1, 0, 0, 1, 1,
-1.020672, 0.3597482, -0.384915, 1, 0, 0, 1, 1,
-1.009524, -0.04100897, -2.243806, 1, 0, 0, 1, 1,
-1.008297, -0.09631451, -1.104108, 1, 0, 0, 1, 1,
-1.003184, 0.924514, -2.828429, 1, 0, 0, 1, 1,
-0.9935814, -2.215541, 0.217685, 0, 0, 0, 1, 1,
-0.9897752, 0.8542665, -2.458502, 0, 0, 0, 1, 1,
-0.9879143, 1.002596, 0.1072584, 0, 0, 0, 1, 1,
-0.9665652, -1.244345, -2.221073, 0, 0, 0, 1, 1,
-0.9649193, -0.3727316, -1.418471, 0, 0, 0, 1, 1,
-0.9643071, 0.1803413, -1.127574, 0, 0, 0, 1, 1,
-0.9615248, 0.09358393, -1.349344, 0, 0, 0, 1, 1,
-0.9610979, -0.442991, -3.257963, 1, 1, 1, 1, 1,
-0.9599205, 0.459582, -0.1630808, 1, 1, 1, 1, 1,
-0.9595858, -0.7791309, -3.285957, 1, 1, 1, 1, 1,
-0.9530287, 0.3850591, -0.8303393, 1, 1, 1, 1, 1,
-0.9413183, -0.1475438, -2.627192, 1, 1, 1, 1, 1,
-0.9386649, 1.509938, -0.8244237, 1, 1, 1, 1, 1,
-0.9361046, 1.222328, -0.9182752, 1, 1, 1, 1, 1,
-0.9326479, 0.8672874, -2.343797, 1, 1, 1, 1, 1,
-0.9313796, 0.3147509, -0.8141437, 1, 1, 1, 1, 1,
-0.9292735, 1.174619, 0.4382504, 1, 1, 1, 1, 1,
-0.9264726, 0.05961296, -2.021363, 1, 1, 1, 1, 1,
-0.9240986, -0.8272242, -2.149877, 1, 1, 1, 1, 1,
-0.9236026, 1.143001, -1.340445, 1, 1, 1, 1, 1,
-0.9179208, 0.2474943, -1.870026, 1, 1, 1, 1, 1,
-0.914943, -0.6031519, -1.149956, 1, 1, 1, 1, 1,
-0.9133626, 0.8161122, -1.355598, 0, 0, 1, 1, 1,
-0.9127902, -0.7073218, -1.922132, 1, 0, 0, 1, 1,
-0.9083254, -0.7094235, -1.461461, 1, 0, 0, 1, 1,
-0.9057046, -1.446577, -3.585363, 1, 0, 0, 1, 1,
-0.9052266, -0.1266747, -2.147373, 1, 0, 0, 1, 1,
-0.899613, -0.2952155, -3.189085, 1, 0, 0, 1, 1,
-0.8972024, 0.04416165, -0.3809331, 0, 0, 0, 1, 1,
-0.8926193, 0.206424, -2.361787, 0, 0, 0, 1, 1,
-0.8863867, 0.7609138, -0.4043152, 0, 0, 0, 1, 1,
-0.8856655, 0.6701738, -0.3962518, 0, 0, 0, 1, 1,
-0.8829141, 1.190015, -1.547924, 0, 0, 0, 1, 1,
-0.8766069, -0.2168441, -1.700659, 0, 0, 0, 1, 1,
-0.8750869, -0.5169227, -1.122761, 0, 0, 0, 1, 1,
-0.872218, -0.6595854, -2.661079, 1, 1, 1, 1, 1,
-0.8605226, -0.5603663, -3.163122, 1, 1, 1, 1, 1,
-0.8533913, 0.4622415, 0.3097971, 1, 1, 1, 1, 1,
-0.8501019, -0.1735986, -0.1549689, 1, 1, 1, 1, 1,
-0.8475655, 1.468445, -2.865968, 1, 1, 1, 1, 1,
-0.8461167, 1.397034, -0.6081117, 1, 1, 1, 1, 1,
-0.8406075, -1.372701, -3.512992, 1, 1, 1, 1, 1,
-0.8386709, -1.191868, -2.763019, 1, 1, 1, 1, 1,
-0.8344076, -0.04319242, -2.374367, 1, 1, 1, 1, 1,
-0.8337049, -2.205746, -2.643644, 1, 1, 1, 1, 1,
-0.8322216, 0.09965162, -2.341788, 1, 1, 1, 1, 1,
-0.8265568, 1.427371, -1.376732, 1, 1, 1, 1, 1,
-0.825573, -0.6040726, -0.6160281, 1, 1, 1, 1, 1,
-0.8236513, 1.526706, 0.2330411, 1, 1, 1, 1, 1,
-0.82192, -1.043229, -2.083005, 1, 1, 1, 1, 1,
-0.8094866, 0.1468169, -0.9478086, 0, 0, 1, 1, 1,
-0.8071764, 1.901025, -1.154296, 1, 0, 0, 1, 1,
-0.8010942, -0.8518246, -2.070527, 1, 0, 0, 1, 1,
-0.7890416, -0.7954997, -2.350356, 1, 0, 0, 1, 1,
-0.7879033, -0.2736662, -1.104953, 1, 0, 0, 1, 1,
-0.783208, 0.9678198, -0.231236, 1, 0, 0, 1, 1,
-0.7821077, 0.6462157, -0.7880908, 0, 0, 0, 1, 1,
-0.7734972, -0.1933941, -1.007579, 0, 0, 0, 1, 1,
-0.7734686, 0.0932314, -1.791058, 0, 0, 0, 1, 1,
-0.7690057, -1.149813, -1.597259, 0, 0, 0, 1, 1,
-0.7651656, 0.454479, -1.669542, 0, 0, 0, 1, 1,
-0.7643065, -0.7658522, -2.880125, 0, 0, 0, 1, 1,
-0.7618412, 0.5491688, 0.07144492, 0, 0, 0, 1, 1,
-0.7614277, -0.500688, -3.204984, 1, 1, 1, 1, 1,
-0.7585331, 1.135616, -1.452696, 1, 1, 1, 1, 1,
-0.7560468, -0.7782552, -2.458454, 1, 1, 1, 1, 1,
-0.7535897, -0.2462819, 0.2324239, 1, 1, 1, 1, 1,
-0.7492841, -0.422556, -1.670365, 1, 1, 1, 1, 1,
-0.7490212, 0.6207644, -1.276214, 1, 1, 1, 1, 1,
-0.7471712, 0.7406746, -1.930065, 1, 1, 1, 1, 1,
-0.7394634, 0.9655253, -1.353647, 1, 1, 1, 1, 1,
-0.7388839, -0.6979483, -1.129877, 1, 1, 1, 1, 1,
-0.7329895, 0.5529354, -0.9906446, 1, 1, 1, 1, 1,
-0.7314363, -0.2027006, -2.769277, 1, 1, 1, 1, 1,
-0.7292726, -0.6621813, -2.257008, 1, 1, 1, 1, 1,
-0.7255262, -0.1542386, -2.463259, 1, 1, 1, 1, 1,
-0.7254314, 0.1761917, -1.462201, 1, 1, 1, 1, 1,
-0.7244946, 0.7134466, -0.07319923, 1, 1, 1, 1, 1,
-0.720157, -1.577533, -3.453358, 0, 0, 1, 1, 1,
-0.7159491, 1.219645, -0.8043547, 1, 0, 0, 1, 1,
-0.7128631, 0.9237257, -1.373818, 1, 0, 0, 1, 1,
-0.710036, -0.8911536, -1.550377, 1, 0, 0, 1, 1,
-0.7086417, 1.036735, -2.306283, 1, 0, 0, 1, 1,
-0.7077605, 1.134838, -2.426217, 1, 0, 0, 1, 1,
-0.7037053, -1.962239, -0.1801278, 0, 0, 0, 1, 1,
-0.7016027, -0.5195695, -1.678003, 0, 0, 0, 1, 1,
-0.7008074, 1.367567, -1.964674, 0, 0, 0, 1, 1,
-0.6997109, -0.9876757, -3.736288, 0, 0, 0, 1, 1,
-0.6987335, -1.042336, -3.219237, 0, 0, 0, 1, 1,
-0.696917, -0.497725, -2.580622, 0, 0, 0, 1, 1,
-0.6942707, -1.314694, -3.429527, 0, 0, 0, 1, 1,
-0.6918049, 0.244531, -2.039604, 1, 1, 1, 1, 1,
-0.6808389, 0.1813105, -2.145945, 1, 1, 1, 1, 1,
-0.6758718, 0.9716417, -1.328872, 1, 1, 1, 1, 1,
-0.6690659, -0.5400737, -2.283337, 1, 1, 1, 1, 1,
-0.6684862, 1.187609, -0.05300594, 1, 1, 1, 1, 1,
-0.6638874, 1.479437, 1.410466, 1, 1, 1, 1, 1,
-0.6604464, 3.573937, -1.694474, 1, 1, 1, 1, 1,
-0.6603428, 1.320641, -1.821429, 1, 1, 1, 1, 1,
-0.6520702, -0.4131278, -1.157867, 1, 1, 1, 1, 1,
-0.6492903, -0.8716375, -2.616456, 1, 1, 1, 1, 1,
-0.649273, 0.5542572, 0.3276712, 1, 1, 1, 1, 1,
-0.6364362, 0.265528, -0.04735848, 1, 1, 1, 1, 1,
-0.6340898, 0.2076307, -0.9257397, 1, 1, 1, 1, 1,
-0.627534, -1.206598, 0.3210762, 1, 1, 1, 1, 1,
-0.6216301, 1.40705, -1.035389, 1, 1, 1, 1, 1,
-0.6201377, 0.8792639, -0.719652, 0, 0, 1, 1, 1,
-0.6181661, 0.1770798, 0.6438802, 1, 0, 0, 1, 1,
-0.6156984, 1.57031, 0.2535253, 1, 0, 0, 1, 1,
-0.6123641, -0.5408208, -3.246121, 1, 0, 0, 1, 1,
-0.610134, 0.4482267, 0.2561108, 1, 0, 0, 1, 1,
-0.6084513, -1.58444, -2.288753, 1, 0, 0, 1, 1,
-0.6018727, 0.531131, -0.4173702, 0, 0, 0, 1, 1,
-0.6010596, -2.452607, -3.046272, 0, 0, 0, 1, 1,
-0.5981053, 1.461844, 0.01728641, 0, 0, 0, 1, 1,
-0.5921692, 1.44134, 0.02814207, 0, 0, 0, 1, 1,
-0.5909126, -0.3821082, -2.629723, 0, 0, 0, 1, 1,
-0.5904734, -0.6610992, -1.919056, 0, 0, 0, 1, 1,
-0.578109, -0.5740882, -1.979972, 0, 0, 0, 1, 1,
-0.5634913, 0.7509, -2.201231, 1, 1, 1, 1, 1,
-0.5587203, 0.1001199, -0.4136187, 1, 1, 1, 1, 1,
-0.5466673, 0.7483981, -1.327304, 1, 1, 1, 1, 1,
-0.5442668, 1.281795, -1.74399, 1, 1, 1, 1, 1,
-0.5430133, 0.4508049, -2.393766, 1, 1, 1, 1, 1,
-0.5352635, -1.224433, -2.979751, 1, 1, 1, 1, 1,
-0.5349755, -1.251582, -2.793859, 1, 1, 1, 1, 1,
-0.5342591, -0.5513817, -2.764023, 1, 1, 1, 1, 1,
-0.5242572, -1.116739, -2.46635, 1, 1, 1, 1, 1,
-0.5214967, -1.952995, -2.602822, 1, 1, 1, 1, 1,
-0.5172774, 1.481734, -1.964119, 1, 1, 1, 1, 1,
-0.510693, -0.9010254, -2.14974, 1, 1, 1, 1, 1,
-0.5061513, -1.077361, -4.424854, 1, 1, 1, 1, 1,
-0.504627, 0.3108737, -0.5901726, 1, 1, 1, 1, 1,
-0.5000592, -0.2659844, -2.789824, 1, 1, 1, 1, 1,
-0.4965847, -0.3673936, -2.838, 0, 0, 1, 1, 1,
-0.4965568, 0.7371921, -0.4072432, 1, 0, 0, 1, 1,
-0.4944988, -0.3628996, -2.097808, 1, 0, 0, 1, 1,
-0.4930435, 1.376885, -1.279245, 1, 0, 0, 1, 1,
-0.49197, -1.540803, -3.545826, 1, 0, 0, 1, 1,
-0.4844746, -0.08830187, -2.114582, 1, 0, 0, 1, 1,
-0.478447, 0.1491288, -1.831748, 0, 0, 0, 1, 1,
-0.4741847, -0.1926428, -1.056044, 0, 0, 0, 1, 1,
-0.4685649, -2.010329, -3.984047, 0, 0, 0, 1, 1,
-0.4676431, -1.318973, -3.324859, 0, 0, 0, 1, 1,
-0.4674949, 0.9143131, -1.111765, 0, 0, 0, 1, 1,
-0.461241, -0.3615532, -3.243521, 0, 0, 0, 1, 1,
-0.4606983, 0.7628488, 0.1787481, 0, 0, 0, 1, 1,
-0.4604476, 0.3589981, 0.3090517, 1, 1, 1, 1, 1,
-0.4592707, 1.562233, -0.04422652, 1, 1, 1, 1, 1,
-0.4584655, -0.4127316, -2.140419, 1, 1, 1, 1, 1,
-0.4533528, -0.5300928, -2.031501, 1, 1, 1, 1, 1,
-0.4497098, 1.28546, -2.270499, 1, 1, 1, 1, 1,
-0.4481546, -0.5478442, -1.72372, 1, 1, 1, 1, 1,
-0.4481311, 0.6574735, -0.8066354, 1, 1, 1, 1, 1,
-0.4480637, -1.040888, -1.773783, 1, 1, 1, 1, 1,
-0.4431479, 0.2720668, -1.46088, 1, 1, 1, 1, 1,
-0.4378207, -0.5731976, -0.3670571, 1, 1, 1, 1, 1,
-0.4341215, -0.3859028, -2.656541, 1, 1, 1, 1, 1,
-0.4338224, 0.5021922, -1.910988, 1, 1, 1, 1, 1,
-0.4315604, -0.2886182, -1.907914, 1, 1, 1, 1, 1,
-0.4286199, -1.042803, -1.997357, 1, 1, 1, 1, 1,
-0.4176403, -0.7322416, -1.785055, 1, 1, 1, 1, 1,
-0.4171833, -0.1958168, -3.066988, 0, 0, 1, 1, 1,
-0.4158659, -1.224723, -5.238468, 1, 0, 0, 1, 1,
-0.4113075, -0.329217, -3.435032, 1, 0, 0, 1, 1,
-0.407645, 1.494257, -1.29495, 1, 0, 0, 1, 1,
-0.4019341, -0.2165641, 0.1269915, 1, 0, 0, 1, 1,
-0.3978038, 0.6855689, 0.119963, 1, 0, 0, 1, 1,
-0.3896293, -0.3676919, -4.596056, 0, 0, 0, 1, 1,
-0.3885433, -1.098143, -1.374719, 0, 0, 0, 1, 1,
-0.3872541, 0.2154538, 0.8715115, 0, 0, 0, 1, 1,
-0.3850633, 1.704581, -2.876204, 0, 0, 0, 1, 1,
-0.3838469, -0.3511346, -1.41879, 0, 0, 0, 1, 1,
-0.3772839, 0.7830762, 1.566224, 0, 0, 0, 1, 1,
-0.3771906, 0.4994314, -0.3243641, 0, 0, 0, 1, 1,
-0.3753935, 0.1050429, 0.003884244, 1, 1, 1, 1, 1,
-0.3739567, 1.084366, 0.9959223, 1, 1, 1, 1, 1,
-0.3723598, -1.29653, -2.429341, 1, 1, 1, 1, 1,
-0.3681339, 0.4881231, -0.1161164, 1, 1, 1, 1, 1,
-0.364782, -0.9906542, -1.799991, 1, 1, 1, 1, 1,
-0.3611848, -0.07011962, -2.436702, 1, 1, 1, 1, 1,
-0.3574457, 0.96061, 1.647849, 1, 1, 1, 1, 1,
-0.3549192, 0.2321248, -1.072492, 1, 1, 1, 1, 1,
-0.3540787, -0.8182291, -3.271152, 1, 1, 1, 1, 1,
-0.3531548, -0.07971978, -1.831995, 1, 1, 1, 1, 1,
-0.3509049, -1.240917, -3.560303, 1, 1, 1, 1, 1,
-0.3451381, -1.97178, -1.95757, 1, 1, 1, 1, 1,
-0.3385912, -0.617393, -3.363239, 1, 1, 1, 1, 1,
-0.3362707, 0.4224068, -0.08973354, 1, 1, 1, 1, 1,
-0.3325208, -0.4112441, -1.539336, 1, 1, 1, 1, 1,
-0.3317212, 0.3808432, -0.7249237, 0, 0, 1, 1, 1,
-0.326297, 0.8454583, 0.8363082, 1, 0, 0, 1, 1,
-0.3226374, 0.58869, -0.2610447, 1, 0, 0, 1, 1,
-0.3202433, 0.8178464, -0.7106887, 1, 0, 0, 1, 1,
-0.3159202, -0.8383576, -2.672882, 1, 0, 0, 1, 1,
-0.3155744, -0.6818275, -3.016116, 1, 0, 0, 1, 1,
-0.3113264, -0.859891, -0.4842528, 0, 0, 0, 1, 1,
-0.3070591, 1.333969, 1.105318, 0, 0, 0, 1, 1,
-0.3051962, -0.1254357, -1.490104, 0, 0, 0, 1, 1,
-0.2992085, -0.8729851, -2.449018, 0, 0, 0, 1, 1,
-0.2923127, 1.554995, -1.541653, 0, 0, 0, 1, 1,
-0.2919631, 0.6411537, -1.024673, 0, 0, 0, 1, 1,
-0.288357, 1.259887, -1.259212, 0, 0, 0, 1, 1,
-0.2859204, -0.1193908, -2.89412, 1, 1, 1, 1, 1,
-0.2827184, 0.1555873, -0.8234525, 1, 1, 1, 1, 1,
-0.2826182, -0.06962599, -2.070448, 1, 1, 1, 1, 1,
-0.2824426, -0.09760484, 0.341439, 1, 1, 1, 1, 1,
-0.2813083, -0.0188645, -4.427813, 1, 1, 1, 1, 1,
-0.2805778, 0.5116049, 0.605272, 1, 1, 1, 1, 1,
-0.2779379, 1.37307, -0.5962079, 1, 1, 1, 1, 1,
-0.2707428, -1.060281, -1.986279, 1, 1, 1, 1, 1,
-0.2693656, 0.01815643, 0.001389951, 1, 1, 1, 1, 1,
-0.2686402, -0.1738263, -2.696446, 1, 1, 1, 1, 1,
-0.2594818, 0.7757195, -0.8289258, 1, 1, 1, 1, 1,
-0.2583407, -1.019133, -2.342785, 1, 1, 1, 1, 1,
-0.2551726, 0.5720924, -0.5792132, 1, 1, 1, 1, 1,
-0.2546796, 0.2539824, -0.2738545, 1, 1, 1, 1, 1,
-0.2525827, -0.9722332, -3.800407, 1, 1, 1, 1, 1,
-0.2505125, -0.505388, -2.889278, 0, 0, 1, 1, 1,
-0.2491917, -0.7717379, -3.523308, 1, 0, 0, 1, 1,
-0.2482408, 0.2592392, 0.9679959, 1, 0, 0, 1, 1,
-0.2395888, -1.013687, -2.035778, 1, 0, 0, 1, 1,
-0.2368526, -0.9841706, -3.25052, 1, 0, 0, 1, 1,
-0.2276728, 1.857578, -0.7470871, 1, 0, 0, 1, 1,
-0.2248257, 1.640023, -0.1627858, 0, 0, 0, 1, 1,
-0.2245736, -0.7882859, -3.858825, 0, 0, 0, 1, 1,
-0.2229069, -1.568315, -4.845185, 0, 0, 0, 1, 1,
-0.2222285, -0.3414993, -3.194348, 0, 0, 0, 1, 1,
-0.2165238, 1.10307, -0.3826309, 0, 0, 0, 1, 1,
-0.2150562, -1.220856, -3.867242, 0, 0, 0, 1, 1,
-0.204161, -1.070524, -3.699981, 0, 0, 0, 1, 1,
-0.1984392, -0.6216047, -3.244077, 1, 1, 1, 1, 1,
-0.1954558, 0.5393799, -1.751765, 1, 1, 1, 1, 1,
-0.1916843, -0.3816898, -3.52251, 1, 1, 1, 1, 1,
-0.1828641, 0.4457119, -1.038862, 1, 1, 1, 1, 1,
-0.1811282, 0.6656987, -0.3026777, 1, 1, 1, 1, 1,
-0.1807198, 1.356748, -1.375026, 1, 1, 1, 1, 1,
-0.1805479, -1.491946, -4.648673, 1, 1, 1, 1, 1,
-0.1758991, 0.6296493, 1.3569, 1, 1, 1, 1, 1,
-0.1700993, 0.878652, 0.003681468, 1, 1, 1, 1, 1,
-0.1683507, 1.209641, 1.227665, 1, 1, 1, 1, 1,
-0.1674583, 1.674329, 0.6807008, 1, 1, 1, 1, 1,
-0.1663403, 0.4338642, -0.1246753, 1, 1, 1, 1, 1,
-0.1653848, 0.640168, -0.5197636, 1, 1, 1, 1, 1,
-0.16199, 0.9035109, -1.947055, 1, 1, 1, 1, 1,
-0.1608912, 0.7960208, 0.9582434, 1, 1, 1, 1, 1,
-0.1601406, -0.5427151, -3.122334, 0, 0, 1, 1, 1,
-0.1595961, -0.1846425, -2.761926, 1, 0, 0, 1, 1,
-0.1590984, 0.7402585, -0.6685679, 1, 0, 0, 1, 1,
-0.1583411, 0.1231669, -1.859028, 1, 0, 0, 1, 1,
-0.1559872, 0.2221646, -1.610692, 1, 0, 0, 1, 1,
-0.1542981, -0.4072478, -3.784477, 1, 0, 0, 1, 1,
-0.1531775, 0.6124007, 0.65285, 0, 0, 0, 1, 1,
-0.152847, 1.727986, 1.479046, 0, 0, 0, 1, 1,
-0.1484095, 0.2110834, -0.1340807, 0, 0, 0, 1, 1,
-0.1452004, 0.6063288, 0.3884839, 0, 0, 0, 1, 1,
-0.1340542, -1.111725, -1.388979, 0, 0, 0, 1, 1,
-0.12449, -1.203726, -1.407283, 0, 0, 0, 1, 1,
-0.1241865, -0.7305259, -1.850319, 0, 0, 0, 1, 1,
-0.1224425, 1.433411, -1.832395, 1, 1, 1, 1, 1,
-0.1200431, -1.397375, -2.843514, 1, 1, 1, 1, 1,
-0.1194567, -0.970314, -3.005815, 1, 1, 1, 1, 1,
-0.1144993, 0.2353006, 0.05017776, 1, 1, 1, 1, 1,
-0.1141859, -0.6733691, -3.361363, 1, 1, 1, 1, 1,
-0.1114053, 0.6745335, -0.05962905, 1, 1, 1, 1, 1,
-0.1110135, -0.8163413, -3.032767, 1, 1, 1, 1, 1,
-0.1110119, 0.7797156, -0.6504103, 1, 1, 1, 1, 1,
-0.1089028, -1.413231, -3.604725, 1, 1, 1, 1, 1,
-0.08717607, 1.246372, -1.097316, 1, 1, 1, 1, 1,
-0.08709901, 0.6020265, -0.6288435, 1, 1, 1, 1, 1,
-0.08482683, 1.285758, -0.0001534761, 1, 1, 1, 1, 1,
-0.08464663, -0.6962234, -1.885768, 1, 1, 1, 1, 1,
-0.08404982, 0.541621, -0.0208859, 1, 1, 1, 1, 1,
-0.08155128, 0.0530653, -2.313874, 1, 1, 1, 1, 1,
-0.07990038, 2.103324, -0.1652544, 0, 0, 1, 1, 1,
-0.07846578, 0.2162751, 0.4961755, 1, 0, 0, 1, 1,
-0.07845962, 0.7774081, 0.6038762, 1, 0, 0, 1, 1,
-0.07697017, -0.7724226, -3.686582, 1, 0, 0, 1, 1,
-0.07338711, -0.7502815, -2.990439, 1, 0, 0, 1, 1,
-0.07269315, 1.1269, 0.3092718, 1, 0, 0, 1, 1,
-0.0693774, 0.9209121, -0.8169905, 0, 0, 0, 1, 1,
-0.0686829, -0.4944264, -2.545577, 0, 0, 0, 1, 1,
-0.06767568, -1.769414, -2.718075, 0, 0, 0, 1, 1,
-0.06340447, -0.2941933, -3.83251, 0, 0, 0, 1, 1,
-0.06292072, -0.6980233, -3.904994, 0, 0, 0, 1, 1,
-0.06026788, 1.65008, -1.924862, 0, 0, 0, 1, 1,
-0.05480759, 1.020667, -0.5526267, 0, 0, 0, 1, 1,
-0.05451923, 0.2915525, 0.4766689, 1, 1, 1, 1, 1,
-0.05368272, 0.5786012, -0.1849243, 1, 1, 1, 1, 1,
-0.05254566, -1.569487, -4.73307, 1, 1, 1, 1, 1,
-0.0508097, -1.65698, -4.649736, 1, 1, 1, 1, 1,
-0.05026104, 1.199866, -0.396705, 1, 1, 1, 1, 1,
-0.04590677, -1.279907, -2.766372, 1, 1, 1, 1, 1,
-0.04303676, 1.053734, 0.5506077, 1, 1, 1, 1, 1,
-0.04068739, 0.2123777, -0.9551511, 1, 1, 1, 1, 1,
-0.04002309, -0.3087245, -1.807554, 1, 1, 1, 1, 1,
-0.02606344, 0.7104029, -0.3287358, 1, 1, 1, 1, 1,
-0.02453077, -1.098839, -3.139692, 1, 1, 1, 1, 1,
-0.02084396, 1.68318, 2.061372, 1, 1, 1, 1, 1,
-0.02001073, 1.545844, 0.2942987, 1, 1, 1, 1, 1,
-0.01747326, 0.5776011, -0.2133563, 1, 1, 1, 1, 1,
-0.01746351, 1.970195, -0.01710654, 1, 1, 1, 1, 1,
-0.01716318, 0.3248759, -1.016235, 0, 0, 1, 1, 1,
-0.01704989, 0.6121227, -0.5149763, 1, 0, 0, 1, 1,
-0.01574079, 0.6658854, -0.3964274, 1, 0, 0, 1, 1,
-0.01137335, 0.220385, -0.2946173, 1, 0, 0, 1, 1,
-0.004434341, -0.2538993, -3.836269, 1, 0, 0, 1, 1,
-0.002526595, 1.521546, 1.022196, 1, 0, 0, 1, 1,
-0.001285667, -0.8895125, -3.669341, 0, 0, 0, 1, 1,
-0.00117892, -0.09373808, -3.313567, 0, 0, 0, 1, 1,
0.0004232242, -1.132485, 3.258556, 0, 0, 0, 1, 1,
0.001072632, 0.03992441, -1.077807, 0, 0, 0, 1, 1,
0.004443747, 0.2326123, 1.345726, 0, 0, 0, 1, 1,
0.005283533, -0.8942266, 4.314095, 0, 0, 0, 1, 1,
0.009098032, -1.717742, 3.84985, 0, 0, 0, 1, 1,
0.009880839, -1.272334, 5.073593, 1, 1, 1, 1, 1,
0.01001841, -1.394484, 2.843811, 1, 1, 1, 1, 1,
0.01055208, 0.1386199, -1.163608, 1, 1, 1, 1, 1,
0.01172713, 0.2580301, -0.6594173, 1, 1, 1, 1, 1,
0.01179283, 0.5145458, 0.2570996, 1, 1, 1, 1, 1,
0.01461233, 0.4642075, -2.199596, 1, 1, 1, 1, 1,
0.01690804, 0.5416618, -0.3119754, 1, 1, 1, 1, 1,
0.01833861, -0.4015907, 6.174308, 1, 1, 1, 1, 1,
0.0192478, -0.4270043, 2.325649, 1, 1, 1, 1, 1,
0.01947337, -0.3717795, 3.897428, 1, 1, 1, 1, 1,
0.0212295, -0.06857926, 3.064672, 1, 1, 1, 1, 1,
0.03215188, -0.7640247, 2.48341, 1, 1, 1, 1, 1,
0.03266526, -0.2357128, 3.295596, 1, 1, 1, 1, 1,
0.03547327, 0.5665204, -1.029767, 1, 1, 1, 1, 1,
0.03725022, -0.9255105, 4.104415, 1, 1, 1, 1, 1,
0.03824015, 1.454509, 0.04453547, 0, 0, 1, 1, 1,
0.04096875, -1.430044, 3.817986, 1, 0, 0, 1, 1,
0.04345185, -0.6602116, 2.366067, 1, 0, 0, 1, 1,
0.04616798, -0.01007269, 2.044605, 1, 0, 0, 1, 1,
0.04622765, 0.3346579, -0.8483423, 1, 0, 0, 1, 1,
0.05287601, 0.353394, 0.7797555, 1, 0, 0, 1, 1,
0.05425972, 2.37401, -0.3094571, 0, 0, 0, 1, 1,
0.05578367, -1.199501, 3.515938, 0, 0, 0, 1, 1,
0.06080943, 0.2591198, 1.245664, 0, 0, 0, 1, 1,
0.0635112, 0.8041872, 1.293534, 0, 0, 0, 1, 1,
0.06591952, -1.559375, 1.860406, 0, 0, 0, 1, 1,
0.06634795, -1.108821, 4.200749, 0, 0, 0, 1, 1,
0.06728175, 0.100712, 2.943708, 0, 0, 0, 1, 1,
0.07047638, -0.8397426, 2.409399, 1, 1, 1, 1, 1,
0.07226582, -0.3476034, 3.81718, 1, 1, 1, 1, 1,
0.07496484, 0.01462686, 0.477558, 1, 1, 1, 1, 1,
0.07709195, 0.5467309, -0.6099066, 1, 1, 1, 1, 1,
0.07733342, -1.55154, 3.122062, 1, 1, 1, 1, 1,
0.07757266, 1.284825, 0.9603673, 1, 1, 1, 1, 1,
0.08043978, -0.7351338, 2.395647, 1, 1, 1, 1, 1,
0.08274788, -0.4336201, 3.544677, 1, 1, 1, 1, 1,
0.08607334, -0.8169224, 3.179284, 1, 1, 1, 1, 1,
0.08855618, 0.8661935, 0.5336475, 1, 1, 1, 1, 1,
0.08981099, 0.02509185, 0.3404753, 1, 1, 1, 1, 1,
0.09329941, 0.7362359, -0.9048219, 1, 1, 1, 1, 1,
0.09814048, -0.212189, 2.346061, 1, 1, 1, 1, 1,
0.09852444, 1.137251, -1.589419, 1, 1, 1, 1, 1,
0.09892282, -0.6916853, 2.272766, 1, 1, 1, 1, 1,
0.09968213, 0.5634561, 0.556765, 0, 0, 1, 1, 1,
0.1060431, 0.771798, 2.017555, 1, 0, 0, 1, 1,
0.1065093, -0.9346517, 4.546755, 1, 0, 0, 1, 1,
0.1065503, -0.1676157, 1.32775, 1, 0, 0, 1, 1,
0.1088973, -1.59524, 1.921353, 1, 0, 0, 1, 1,
0.1106654, 0.4990234, 1.399579, 1, 0, 0, 1, 1,
0.1109443, -1.414726, 2.867998, 0, 0, 0, 1, 1,
0.1120979, 0.4086315, 0.1657462, 0, 0, 0, 1, 1,
0.1123358, -0.07391712, 3.751008, 0, 0, 0, 1, 1,
0.1128198, 0.8852715, -1.748016, 0, 0, 0, 1, 1,
0.1284536, 0.7245283, 0.6901719, 0, 0, 0, 1, 1,
0.1285334, -1.927212, 3.09673, 0, 0, 0, 1, 1,
0.1302623, -0.8618785, 1.468989, 0, 0, 0, 1, 1,
0.1353246, -0.4895043, 1.680174, 1, 1, 1, 1, 1,
0.1360816, -0.5024831, 2.954388, 1, 1, 1, 1, 1,
0.136134, 0.939209, -0.8247043, 1, 1, 1, 1, 1,
0.138067, -0.5798569, 5.052608, 1, 1, 1, 1, 1,
0.1423795, -0.6104413, 3.053644, 1, 1, 1, 1, 1,
0.1434968, -0.7723528, 4.632215, 1, 1, 1, 1, 1,
0.1472133, 0.2591724, 0.08692438, 1, 1, 1, 1, 1,
0.148724, 0.2357312, 0.3098067, 1, 1, 1, 1, 1,
0.152052, -1.551866, 1.959007, 1, 1, 1, 1, 1,
0.1550216, -0.507526, 1.726237, 1, 1, 1, 1, 1,
0.1618184, 0.05679252, 1.943114, 1, 1, 1, 1, 1,
0.1640762, -0.4862133, 4.059124, 1, 1, 1, 1, 1,
0.165334, -0.1467974, 1.379549, 1, 1, 1, 1, 1,
0.1686431, -0.5009165, 2.828959, 1, 1, 1, 1, 1,
0.1693102, -0.5515018, 2.033526, 1, 1, 1, 1, 1,
0.1724904, -0.6104057, 2.441582, 0, 0, 1, 1, 1,
0.1805406, -1.574933, 1.753305, 1, 0, 0, 1, 1,
0.1837749, -1.091621, 3.039525, 1, 0, 0, 1, 1,
0.1851541, -3.19366, 4.203054, 1, 0, 0, 1, 1,
0.1851695, 1.906277, -0.1315581, 1, 0, 0, 1, 1,
0.1861465, -0.7912717, 2.196521, 1, 0, 0, 1, 1,
0.1868336, 0.2453754, 1.508519, 0, 0, 0, 1, 1,
0.188985, -0.01895631, 0.9894159, 0, 0, 0, 1, 1,
0.1891342, 0.4791116, -0.2988445, 0, 0, 0, 1, 1,
0.1892506, -0.6686978, 4.467427, 0, 0, 0, 1, 1,
0.1898411, 0.4057072, 0.6609082, 0, 0, 0, 1, 1,
0.1908285, 0.9710847, 2.254221, 0, 0, 0, 1, 1,
0.1924152, 1.327567, -1.435583, 0, 0, 0, 1, 1,
0.1939066, -0.3216943, 2.017213, 1, 1, 1, 1, 1,
0.1943465, 1.160089, 0.4151881, 1, 1, 1, 1, 1,
0.1984383, 1.341125, -0.3674256, 1, 1, 1, 1, 1,
0.1996129, 1.789516, 1.347142, 1, 1, 1, 1, 1,
0.200313, -0.6983937, 2.706367, 1, 1, 1, 1, 1,
0.2011582, 0.6332686, 1.723413, 1, 1, 1, 1, 1,
0.2029793, 0.1619915, 0.7135581, 1, 1, 1, 1, 1,
0.2082708, 0.3609706, -0.5155213, 1, 1, 1, 1, 1,
0.208292, -0.6958406, 2.785686, 1, 1, 1, 1, 1,
0.211576, 0.6348302, -0.1414076, 1, 1, 1, 1, 1,
0.2123329, -0.08781821, 1.008545, 1, 1, 1, 1, 1,
0.214481, 1.2408, -0.6096655, 1, 1, 1, 1, 1,
0.215598, 0.4230547, -0.2763406, 1, 1, 1, 1, 1,
0.2173195, 0.1633524, -0.6070203, 1, 1, 1, 1, 1,
0.2206488, -0.1391324, 1.208341, 1, 1, 1, 1, 1,
0.2259847, -0.1668219, 1.032993, 0, 0, 1, 1, 1,
0.2325178, 1.064156, 0.8686761, 1, 0, 0, 1, 1,
0.2327196, -0.8904431, 2.058276, 1, 0, 0, 1, 1,
0.2369583, -0.2284349, 2.809935, 1, 0, 0, 1, 1,
0.2398853, -0.1489724, 3.298687, 1, 0, 0, 1, 1,
0.2411279, 0.424885, 0.2881487, 1, 0, 0, 1, 1,
0.2418167, 1.91504, -0.4711441, 0, 0, 0, 1, 1,
0.2444495, 0.3189714, 0.1218526, 0, 0, 0, 1, 1,
0.2454, 0.02025905, 1.287039, 0, 0, 0, 1, 1,
0.2456326, -0.2138825, 2.540812, 0, 0, 0, 1, 1,
0.2475074, 0.3932174, 1.895908, 0, 0, 0, 1, 1,
0.2487562, 0.3635248, -0.8725645, 0, 0, 0, 1, 1,
0.2493682, -0.05816226, 1.617057, 0, 0, 0, 1, 1,
0.2502562, 1.060054, 0.7546112, 1, 1, 1, 1, 1,
0.2518154, 0.8310722, 2.169485, 1, 1, 1, 1, 1,
0.2525446, 0.5248241, 0.2658494, 1, 1, 1, 1, 1,
0.2531091, 0.7569914, -0.5853133, 1, 1, 1, 1, 1,
0.2531689, -1.208616, 3.936028, 1, 1, 1, 1, 1,
0.2564709, 0.9030401, -0.419733, 1, 1, 1, 1, 1,
0.2608507, 0.4067827, 2.637713, 1, 1, 1, 1, 1,
0.2623491, 0.3107832, 1.462426, 1, 1, 1, 1, 1,
0.2640484, -0.5498484, 3.662015, 1, 1, 1, 1, 1,
0.2659507, 0.6645854, -0.3291404, 1, 1, 1, 1, 1,
0.2668438, 0.5872243, 0.4003231, 1, 1, 1, 1, 1,
0.2705246, 1.044255, -0.7592242, 1, 1, 1, 1, 1,
0.271037, 0.8789406, 1.048144, 1, 1, 1, 1, 1,
0.2716269, -1.214087, 3.580285, 1, 1, 1, 1, 1,
0.2734817, 0.1356093, 2.379685, 1, 1, 1, 1, 1,
0.2765151, -0.193572, 4.068139, 0, 0, 1, 1, 1,
0.2767935, -1.550122, 3.709236, 1, 0, 0, 1, 1,
0.276817, -0.2072879, 2.350977, 1, 0, 0, 1, 1,
0.2773178, 1.518552, 0.3347015, 1, 0, 0, 1, 1,
0.2831604, 2.149687, 0.1300773, 1, 0, 0, 1, 1,
0.2833977, -1.172363, 3.774254, 1, 0, 0, 1, 1,
0.2874651, -1.541806, 1.579815, 0, 0, 0, 1, 1,
0.2896196, -0.02357051, 1.959422, 0, 0, 0, 1, 1,
0.2906971, 0.3305055, 0.06748868, 0, 0, 0, 1, 1,
0.2910135, 3.306583, 0.2426914, 0, 0, 0, 1, 1,
0.2954837, 1.298654, -0.7678931, 0, 0, 0, 1, 1,
0.2961636, -0.8548662, 2.971173, 0, 0, 0, 1, 1,
0.2974768, 0.1118513, 2.416923, 0, 0, 0, 1, 1,
0.3008321, -1.569962, 1.79791, 1, 1, 1, 1, 1,
0.3008876, 0.3425633, 0.4244434, 1, 1, 1, 1, 1,
0.305432, -2.203144, 3.067179, 1, 1, 1, 1, 1,
0.3081698, 0.114339, 0.8798281, 1, 1, 1, 1, 1,
0.3087737, -0.8841558, 2.649571, 1, 1, 1, 1, 1,
0.3103845, 1.806893, -0.5279016, 1, 1, 1, 1, 1,
0.3107062, -0.06630661, 0.9063314, 1, 1, 1, 1, 1,
0.3137281, 1.22929, 0.2486453, 1, 1, 1, 1, 1,
0.3154245, -0.1316485, 2.633577, 1, 1, 1, 1, 1,
0.3201933, 0.6011609, -0.1303329, 1, 1, 1, 1, 1,
0.3208751, -1.027387, 3.871531, 1, 1, 1, 1, 1,
0.3213509, -1.036625, 1.945271, 1, 1, 1, 1, 1,
0.3243446, 0.3025629, 1.61204, 1, 1, 1, 1, 1,
0.3302497, 1.11131, -1.431703, 1, 1, 1, 1, 1,
0.3326198, -0.04379065, 0.05670853, 1, 1, 1, 1, 1,
0.3402384, 0.8630164, -0.1178319, 0, 0, 1, 1, 1,
0.3406608, 0.3893148, 2.186081, 1, 0, 0, 1, 1,
0.3409298, -1.683257, 3.560968, 1, 0, 0, 1, 1,
0.3436432, -0.4350203, 3.124327, 1, 0, 0, 1, 1,
0.3436953, 0.3658449, 0.2852798, 1, 0, 0, 1, 1,
0.3447948, 0.340314, 0.6927535, 1, 0, 0, 1, 1,
0.3473828, -1.207899, 4.04162, 0, 0, 0, 1, 1,
0.3484597, 0.5452205, 1.653415, 0, 0, 0, 1, 1,
0.3500892, 0.2673543, 0.2111207, 0, 0, 0, 1, 1,
0.3534957, 2.14829, 0.1300699, 0, 0, 0, 1, 1,
0.3538302, 0.7097394, 1.325582, 0, 0, 0, 1, 1,
0.3546826, 0.08812851, 1.608675, 0, 0, 0, 1, 1,
0.3567836, -0.4244842, 1.010907, 0, 0, 0, 1, 1,
0.3573842, 0.1810345, 0.6654207, 1, 1, 1, 1, 1,
0.3661833, -1.514277, 1.247659, 1, 1, 1, 1, 1,
0.3690055, -1.318695, 1.97886, 1, 1, 1, 1, 1,
0.3754451, -0.5752158, 1.767412, 1, 1, 1, 1, 1,
0.3775045, -0.08098476, 0.7483649, 1, 1, 1, 1, 1,
0.3785613, -1.530272, 3.261858, 1, 1, 1, 1, 1,
0.3798954, 0.1456301, 0.554503, 1, 1, 1, 1, 1,
0.3834292, -1.473954, 2.62155, 1, 1, 1, 1, 1,
0.3867543, -0.4495055, 2.640674, 1, 1, 1, 1, 1,
0.3927955, -1.874426, 4.458498, 1, 1, 1, 1, 1,
0.396414, -0.3064905, 2.86627, 1, 1, 1, 1, 1,
0.4012924, -0.9011602, 2.347542, 1, 1, 1, 1, 1,
0.4041512, 0.2038587, 0.7463553, 1, 1, 1, 1, 1,
0.4123696, -0.5085058, 2.30205, 1, 1, 1, 1, 1,
0.4123832, -1.58316, 2.748382, 1, 1, 1, 1, 1,
0.4132945, 0.2028041, 3.383248, 0, 0, 1, 1, 1,
0.4135491, -0.8211102, 2.337635, 1, 0, 0, 1, 1,
0.4156948, 0.6894796, 0.7618002, 1, 0, 0, 1, 1,
0.4180473, -1.028449, 3.287968, 1, 0, 0, 1, 1,
0.4222405, 1.137452, 0.2591245, 1, 0, 0, 1, 1,
0.4243206, 1.001053, -0.04824894, 1, 0, 0, 1, 1,
0.4268608, 0.5114666, 0.3044327, 0, 0, 0, 1, 1,
0.431468, 1.574253, -2.482367, 0, 0, 0, 1, 1,
0.4330692, 0.2862989, 1.665109, 0, 0, 0, 1, 1,
0.4337873, -0.1199306, 0.6973717, 0, 0, 0, 1, 1,
0.4339501, 0.8065529, 2.673298, 0, 0, 0, 1, 1,
0.4353667, 1.397879, -0.5531146, 0, 0, 0, 1, 1,
0.4428367, 0.6323562, 2.117876, 0, 0, 0, 1, 1,
0.4433495, 1.065381, -1.106468, 1, 1, 1, 1, 1,
0.4476008, 0.5812401, 0.9560722, 1, 1, 1, 1, 1,
0.4576399, 0.04348566, 1.663397, 1, 1, 1, 1, 1,
0.4663076, -0.5971882, 2.065934, 1, 1, 1, 1, 1,
0.471908, -0.7312033, 0.3438889, 1, 1, 1, 1, 1,
0.4724531, 0.5584396, 0.3222929, 1, 1, 1, 1, 1,
0.4732913, -1.384271, 3.934802, 1, 1, 1, 1, 1,
0.4743591, 0.7510196, -0.9883524, 1, 1, 1, 1, 1,
0.4774543, 0.8966342, -0.01468237, 1, 1, 1, 1, 1,
0.4801215, -1.677729, 1.665146, 1, 1, 1, 1, 1,
0.4841295, 1.813467, 1.425776, 1, 1, 1, 1, 1,
0.4841942, 0.2945957, 1.104702, 1, 1, 1, 1, 1,
0.4842487, 1.916575, -1.163079, 1, 1, 1, 1, 1,
0.4861139, -0.2008719, 3.083302, 1, 1, 1, 1, 1,
0.4865416, 1.27458, 0.8031442, 1, 1, 1, 1, 1,
0.4881413, 0.07799318, 1.644933, 0, 0, 1, 1, 1,
0.4895357, -2.217281, 1.843074, 1, 0, 0, 1, 1,
0.4897325, 1.656405, 0.3579614, 1, 0, 0, 1, 1,
0.4903677, -0.06890357, 0.2320545, 1, 0, 0, 1, 1,
0.4910268, 0.3332206, 2.74068, 1, 0, 0, 1, 1,
0.502188, -3.004474, 3.907212, 1, 0, 0, 1, 1,
0.5038466, 0.01677761, 0.9728445, 0, 0, 0, 1, 1,
0.5087649, 0.7431666, 0.7886292, 0, 0, 0, 1, 1,
0.5114626, 1.214853, 1.561724, 0, 0, 0, 1, 1,
0.516195, 0.6028851, 0.1372116, 0, 0, 0, 1, 1,
0.5173734, -2.607153, 1.383138, 0, 0, 0, 1, 1,
0.5216371, 1.57259, -0.8691885, 0, 0, 0, 1, 1,
0.5308648, -0.3312228, 0.7807724, 0, 0, 0, 1, 1,
0.5311875, -1.855492, 1.307931, 1, 1, 1, 1, 1,
0.5329476, 0.4743518, -0.1807269, 1, 1, 1, 1, 1,
0.5341851, 1.564726, 1.668718, 1, 1, 1, 1, 1,
0.5378074, -2.383372, 4.055106, 1, 1, 1, 1, 1,
0.5409201, 0.6317951, 0.04429097, 1, 1, 1, 1, 1,
0.543337, 1.913705, 1.058894, 1, 1, 1, 1, 1,
0.5453541, -0.5787438, 2.50177, 1, 1, 1, 1, 1,
0.5455323, -1.19671, 2.217334, 1, 1, 1, 1, 1,
0.5470335, -0.102873, 1.310079, 1, 1, 1, 1, 1,
0.5472575, -0.3917637, 1.20383, 1, 1, 1, 1, 1,
0.5545362, 0.2645017, 2.05053, 1, 1, 1, 1, 1,
0.5586635, 0.8223492, 0.6490338, 1, 1, 1, 1, 1,
0.5589519, 0.8269799, 0.7649113, 1, 1, 1, 1, 1,
0.5649911, -1.098703, 1.639635, 1, 1, 1, 1, 1,
0.5659397, 0.6814542, -0.7867883, 1, 1, 1, 1, 1,
0.5690398, -0.5759801, 3.458194, 0, 0, 1, 1, 1,
0.5786562, 0.6872092, -1.626538, 1, 0, 0, 1, 1,
0.5839412, -1.644709, 3.816058, 1, 0, 0, 1, 1,
0.5840402, 0.5588456, -1.137925, 1, 0, 0, 1, 1,
0.5863665, -0.8552426, 2.46086, 1, 0, 0, 1, 1,
0.5870221, -2.446054, 3.884256, 1, 0, 0, 1, 1,
0.5890344, 2.726997, 0.625497, 0, 0, 0, 1, 1,
0.5900064, -0.3997098, 0.9351817, 0, 0, 0, 1, 1,
0.5944881, -0.8042731, 1.168732, 0, 0, 0, 1, 1,
0.5969918, 1.423048, 0.1408769, 0, 0, 0, 1, 1,
0.6005769, -0.1739158, 1.941963, 0, 0, 0, 1, 1,
0.6103284, 0.4187922, -1.428947, 0, 0, 0, 1, 1,
0.6120947, -0.7254169, 2.604097, 0, 0, 0, 1, 1,
0.6221626, 0.3429583, 1.322759, 1, 1, 1, 1, 1,
0.6232807, 0.6712191, 2.928429, 1, 1, 1, 1, 1,
0.6241683, 0.492336, 1.259802, 1, 1, 1, 1, 1,
0.629878, -0.2602644, 3.075942, 1, 1, 1, 1, 1,
0.6305343, 0.113969, 0.8351226, 1, 1, 1, 1, 1,
0.6316962, 0.6435126, -0.1461612, 1, 1, 1, 1, 1,
0.6418107, -0.7174232, 0.8872041, 1, 1, 1, 1, 1,
0.6443332, -0.2742653, 2.955452, 1, 1, 1, 1, 1,
0.6516274, 0.448314, 0.8631332, 1, 1, 1, 1, 1,
0.6574906, 2.574372, -0.4915135, 1, 1, 1, 1, 1,
0.6659545, 0.4847117, 1.300157, 1, 1, 1, 1, 1,
0.666801, -1.001486, -0.03191666, 1, 1, 1, 1, 1,
0.6675299, -0.02694227, -0.4342764, 1, 1, 1, 1, 1,
0.6675988, 0.7900203, 1.003524, 1, 1, 1, 1, 1,
0.6732623, 0.7404757, 0.9786667, 1, 1, 1, 1, 1,
0.676928, -0.02758099, 1.80475, 0, 0, 1, 1, 1,
0.6780626, 0.7948587, 1.904806, 1, 0, 0, 1, 1,
0.6792561, 0.5225271, 1.880088, 1, 0, 0, 1, 1,
0.6851054, -0.6777247, 1.563065, 1, 0, 0, 1, 1,
0.6853313, -0.006941519, 1.115085, 1, 0, 0, 1, 1,
0.6867991, -0.297391, 1.91265, 1, 0, 0, 1, 1,
0.6884601, 0.2068596, 2.325419, 0, 0, 0, 1, 1,
0.6900654, 0.02045403, 1.253128, 0, 0, 0, 1, 1,
0.6924009, 0.3570484, 1.956987, 0, 0, 0, 1, 1,
0.6940565, -0.5355132, 1.066059, 0, 0, 0, 1, 1,
0.697806, 0.3135956, 2.799752, 0, 0, 0, 1, 1,
0.7066036, 0.5331926, 1.184636, 0, 0, 0, 1, 1,
0.7067193, -0.5916269, 1.513795, 0, 0, 0, 1, 1,
0.7100381, 0.2945816, 1.729749, 1, 1, 1, 1, 1,
0.7101214, 0.7501342, 1.37911, 1, 1, 1, 1, 1,
0.7140702, 2.049265, 1.715909, 1, 1, 1, 1, 1,
0.7187485, 0.2845566, 2.166028, 1, 1, 1, 1, 1,
0.719075, -0.7679994, 1.397605, 1, 1, 1, 1, 1,
0.719928, 0.6955563, 0.9305831, 1, 1, 1, 1, 1,
0.7222016, -0.3310059, 1.178913, 1, 1, 1, 1, 1,
0.7285717, 0.2500837, 1.533365, 1, 1, 1, 1, 1,
0.7292982, -1.802902, 1.580397, 1, 1, 1, 1, 1,
0.7295603, 0.5647492, -0.4594724, 1, 1, 1, 1, 1,
0.731635, -0.6750515, 0.2705888, 1, 1, 1, 1, 1,
0.7327672, -0.5800083, 3.222152, 1, 1, 1, 1, 1,
0.7356675, 0.1755645, 2.836862, 1, 1, 1, 1, 1,
0.735978, -0.5286668, 1.671155, 1, 1, 1, 1, 1,
0.7431093, -0.4081149, 5.157228, 1, 1, 1, 1, 1,
0.7536052, 1.068671, -0.04802407, 0, 0, 1, 1, 1,
0.7568276, -0.03976637, 1.255771, 1, 0, 0, 1, 1,
0.7601482, -1.345059, 0.9043433, 1, 0, 0, 1, 1,
0.7602544, 0.005000616, 2.700923, 1, 0, 0, 1, 1,
0.7633594, 0.6133471, 0.6516106, 1, 0, 0, 1, 1,
0.7700754, -0.8145943, 2.396473, 1, 0, 0, 1, 1,
0.7703708, 0.724495, 0.6914389, 0, 0, 0, 1, 1,
0.773653, 0.895562, 1.849612, 0, 0, 0, 1, 1,
0.7765272, -0.8645852, 3.168775, 0, 0, 0, 1, 1,
0.7775932, 0.1577455, 1.932793, 0, 0, 0, 1, 1,
0.7837973, -1.456808, 2.770189, 0, 0, 0, 1, 1,
0.7843591, 1.660599, 1.8023, 0, 0, 0, 1, 1,
0.7847738, 0.681721, 0.5341127, 0, 0, 0, 1, 1,
0.7849817, -0.3458919, 2.638275, 1, 1, 1, 1, 1,
0.7898564, -0.2412366, 0.0239922, 1, 1, 1, 1, 1,
0.7932035, -1.0375, 2.034722, 1, 1, 1, 1, 1,
0.798704, -0.5753294, 2.728475, 1, 1, 1, 1, 1,
0.7988557, 0.2021725, 1.799793, 1, 1, 1, 1, 1,
0.803883, 0.1937114, 1.249866, 1, 1, 1, 1, 1,
0.8068308, -1.503932, 2.907388, 1, 1, 1, 1, 1,
0.8142337, -0.8833623, 1.485035, 1, 1, 1, 1, 1,
0.814949, 0.2156002, 1.547875, 1, 1, 1, 1, 1,
0.8166586, 1.329722, 1.609639, 1, 1, 1, 1, 1,
0.8220728, 1.089956, 0.6737912, 1, 1, 1, 1, 1,
0.8233463, 0.3304296, 0.1413584, 1, 1, 1, 1, 1,
0.8277411, 1.401956, 0.8834338, 1, 1, 1, 1, 1,
0.8374887, -1.939727, 3.383889, 1, 1, 1, 1, 1,
0.8446805, 0.8564135, 0.1524715, 1, 1, 1, 1, 1,
0.8487019, 0.2149938, 1.781395, 0, 0, 1, 1, 1,
0.8638161, -0.7357651, 2.273417, 1, 0, 0, 1, 1,
0.8638777, 1.03349, 1.787634, 1, 0, 0, 1, 1,
0.8750048, 0.1208633, 1.7611, 1, 0, 0, 1, 1,
0.8842337, 0.2834366, 1.997741, 1, 0, 0, 1, 1,
0.8853334, 1.102057, -0.1383612, 1, 0, 0, 1, 1,
0.8861139, 0.04336143, 3.315295, 0, 0, 0, 1, 1,
0.891679, -1.352114, 3.845927, 0, 0, 0, 1, 1,
0.8917931, 0.08731215, -0.8135712, 0, 0, 0, 1, 1,
0.8973525, 1.170265, 1.098376, 0, 0, 0, 1, 1,
0.8978556, -1.473412, 2.674201, 0, 0, 0, 1, 1,
0.9045731, -0.6225234, 0.7491761, 0, 0, 0, 1, 1,
0.9060643, 0.4564087, 0.2676883, 0, 0, 0, 1, 1,
0.9154993, -1.087797, 0.06299112, 1, 1, 1, 1, 1,
0.9170557, 0.9916564, -0.2783861, 1, 1, 1, 1, 1,
0.9268146, 0.3746869, 2.327231, 1, 1, 1, 1, 1,
0.9291218, 0.4654894, 2.71007, 1, 1, 1, 1, 1,
0.9293605, 0.2697805, 2.978222, 1, 1, 1, 1, 1,
0.9361974, -0.1460322, 1.331931, 1, 1, 1, 1, 1,
0.936847, -1.002262, 2.783107, 1, 1, 1, 1, 1,
0.9373582, -0.1412824, 2.709826, 1, 1, 1, 1, 1,
0.9445179, 0.1730722, 1.012965, 1, 1, 1, 1, 1,
0.9492351, -1.804737, 2.028705, 1, 1, 1, 1, 1,
0.9533351, 2.418196, -0.7534303, 1, 1, 1, 1, 1,
0.9533787, -1.110141, 3.434217, 1, 1, 1, 1, 1,
0.9534608, 0.769065, 1.271914, 1, 1, 1, 1, 1,
0.9543142, 0.9091571, 0.9414109, 1, 1, 1, 1, 1,
0.9556376, -1.779489, 4.995641, 1, 1, 1, 1, 1,
0.9686472, 0.02360776, 1.752131, 0, 0, 1, 1, 1,
0.9701953, 2.087675, -0.8851743, 1, 0, 0, 1, 1,
0.9754235, 0.2503296, 1.133543, 1, 0, 0, 1, 1,
0.9766113, 0.1389867, 1.287198, 1, 0, 0, 1, 1,
0.9787788, -0.3818074, 1.644188, 1, 0, 0, 1, 1,
0.9893036, 0.5330262, 3.296684, 1, 0, 0, 1, 1,
0.9915664, -0.4517892, 3.690295, 0, 0, 0, 1, 1,
0.9931672, -0.04323523, 1.228631, 0, 0, 0, 1, 1,
0.9963227, 1.117859, 0.5544229, 0, 0, 0, 1, 1,
1.002748, 0.1533392, 2.035546, 0, 0, 0, 1, 1,
1.006781, -0.4616514, 1.084961, 0, 0, 0, 1, 1,
1.009028, -0.1294773, 2.586327, 0, 0, 0, 1, 1,
1.011713, -1.18352, 0.1891512, 0, 0, 0, 1, 1,
1.012702, 0.009743913, 0.4263974, 1, 1, 1, 1, 1,
1.014706, 0.7989545, 1.421745, 1, 1, 1, 1, 1,
1.018216, 0.6001356, 1.434762, 1, 1, 1, 1, 1,
1.025403, 0.4377965, 1.9108, 1, 1, 1, 1, 1,
1.026774, -2.684623, 4.049195, 1, 1, 1, 1, 1,
1.02761, -0.1741021, 0.1966967, 1, 1, 1, 1, 1,
1.041709, 0.3001436, 1.442618, 1, 1, 1, 1, 1,
1.047613, -0.6907212, 2.622507, 1, 1, 1, 1, 1,
1.047667, -0.5318902, -0.2120173, 1, 1, 1, 1, 1,
1.054175, -1.032996, 2.026858, 1, 1, 1, 1, 1,
1.055945, -0.7422501, 3.405272, 1, 1, 1, 1, 1,
1.071731, 1.85987, 1.894117, 1, 1, 1, 1, 1,
1.076954, 0.3539394, 0.2843427, 1, 1, 1, 1, 1,
1.078462, -1.054671, 2.023049, 1, 1, 1, 1, 1,
1.082507, -0.1576523, 1.192724, 1, 1, 1, 1, 1,
1.08266, 1.290033, 1.451928, 0, 0, 1, 1, 1,
1.083657, 1.072957, 1.644442, 1, 0, 0, 1, 1,
1.087552, -1.099127, 4.879097, 1, 0, 0, 1, 1,
1.091741, -0.9961438, 3.771826, 1, 0, 0, 1, 1,
1.093877, 0.535751, 1.33008, 1, 0, 0, 1, 1,
1.099181, 0.8009715, 1.361841, 1, 0, 0, 1, 1,
1.112957, -0.1409401, 1.961598, 0, 0, 0, 1, 1,
1.118587, 0.497277, 0.6429765, 0, 0, 0, 1, 1,
1.119848, 0.06646993, 2.119096, 0, 0, 0, 1, 1,
1.128465, 0.04830283, 1.954422, 0, 0, 0, 1, 1,
1.131388, -1.186181, 2.490361, 0, 0, 0, 1, 1,
1.146774, -0.3239874, 1.224645, 0, 0, 0, 1, 1,
1.148636, -0.7636614, 0.9071012, 0, 0, 0, 1, 1,
1.149376, 0.2344295, 1.253956, 1, 1, 1, 1, 1,
1.151708, 0.02114987, 1.934384, 1, 1, 1, 1, 1,
1.15295, -0.4214496, 4.481686, 1, 1, 1, 1, 1,
1.162985, -0.9931697, 3.553947, 1, 1, 1, 1, 1,
1.164085, -0.2525153, 3.082495, 1, 1, 1, 1, 1,
1.16657, -0.03002561, 2.926771, 1, 1, 1, 1, 1,
1.170034, 0.852796, 0.3333715, 1, 1, 1, 1, 1,
1.172581, -1.107429, 1.019054, 1, 1, 1, 1, 1,
1.179707, 1.617911, 2.952608, 1, 1, 1, 1, 1,
1.192704, 1.359728, -0.1855557, 1, 1, 1, 1, 1,
1.196725, -0.145349, 3.226454, 1, 1, 1, 1, 1,
1.198195, 0.1406396, 2.159785, 1, 1, 1, 1, 1,
1.206775, -0.3101914, 3.800987, 1, 1, 1, 1, 1,
1.208927, -0.757611, 2.055791, 1, 1, 1, 1, 1,
1.212845, 1.378513, -0.5109931, 1, 1, 1, 1, 1,
1.214624, 0.5978655, 0.9079785, 0, 0, 1, 1, 1,
1.217609, -1.179264, 1.672593, 1, 0, 0, 1, 1,
1.221871, -0.6092305, 1.775382, 1, 0, 0, 1, 1,
1.229948, -0.6471109, 2.183363, 1, 0, 0, 1, 1,
1.230417, -0.3881481, 0.5297791, 1, 0, 0, 1, 1,
1.237639, 1.203184, 0.4865227, 1, 0, 0, 1, 1,
1.243673, 0.2165435, 0.7285403, 0, 0, 0, 1, 1,
1.245029, -0.4787243, 2.96248, 0, 0, 0, 1, 1,
1.257326, -0.9580161, 3.511853, 0, 0, 0, 1, 1,
1.265818, -0.2715372, 2.393041, 0, 0, 0, 1, 1,
1.267835, -0.5460122, 1.601658, 0, 0, 0, 1, 1,
1.268643, -0.9875123, 2.895694, 0, 0, 0, 1, 1,
1.26957, 0.9571269, -1.398745, 0, 0, 0, 1, 1,
1.277782, 0.3260075, 2.216022, 1, 1, 1, 1, 1,
1.282662, 0.06386201, 2.300311, 1, 1, 1, 1, 1,
1.282945, 0.2109794, -0.07628424, 1, 1, 1, 1, 1,
1.284708, 0.3772908, 2.047583, 1, 1, 1, 1, 1,
1.293467, -2.157458, 3.370707, 1, 1, 1, 1, 1,
1.307943, 0.4834754, 1.894032, 1, 1, 1, 1, 1,
1.30928, -0.2834056, 1.242142, 1, 1, 1, 1, 1,
1.312509, 0.1834699, -0.09134851, 1, 1, 1, 1, 1,
1.322456, -1.007748, 3.512365, 1, 1, 1, 1, 1,
1.326037, 1.648559, 0.6452531, 1, 1, 1, 1, 1,
1.334582, 1.373347, 0.6153864, 1, 1, 1, 1, 1,
1.336236, -0.5611718, 2.362152, 1, 1, 1, 1, 1,
1.338407, 1.450346, 0.9384828, 1, 1, 1, 1, 1,
1.341959, -1.953896, 3.005235, 1, 1, 1, 1, 1,
1.342288, 0.4968848, 0.902777, 1, 1, 1, 1, 1,
1.353556, 0.7521757, 2.576316, 0, 0, 1, 1, 1,
1.359061, -0.7024814, 1.403046, 1, 0, 0, 1, 1,
1.368563, -1.787087, 2.095078, 1, 0, 0, 1, 1,
1.379404, -1.483697, 3.811963, 1, 0, 0, 1, 1,
1.380397, -1.047926, 2.505422, 1, 0, 0, 1, 1,
1.391992, -0.534871, 2.409427, 1, 0, 0, 1, 1,
1.421617, -1.19048, 2.97567, 0, 0, 0, 1, 1,
1.431587, 0.07120194, 2.952602, 0, 0, 0, 1, 1,
1.432166, 0.692993, 1.624917, 0, 0, 0, 1, 1,
1.432554, 1.345508, 1.331219, 0, 0, 0, 1, 1,
1.435438, 1.284159, 0.9545346, 0, 0, 0, 1, 1,
1.435737, 1.436556, -0.0385719, 0, 0, 0, 1, 1,
1.443255, -2.063443, 4.107265, 0, 0, 0, 1, 1,
1.44517, -0.2834583, 0.9975401, 1, 1, 1, 1, 1,
1.449315, -1.058138, 3.494056, 1, 1, 1, 1, 1,
1.451243, -0.4428985, 1.711098, 1, 1, 1, 1, 1,
1.45331, -1.650236, 3.121001, 1, 1, 1, 1, 1,
1.456209, 0.7125421, 0.4767661, 1, 1, 1, 1, 1,
1.463187, -1.848819, 1.995826, 1, 1, 1, 1, 1,
1.469337, 0.5757678, -0.5166022, 1, 1, 1, 1, 1,
1.472198, -0.4576204, 0.2404049, 1, 1, 1, 1, 1,
1.48527, -0.1727242, 2.718965, 1, 1, 1, 1, 1,
1.49881, -0.6926706, 2.525486, 1, 1, 1, 1, 1,
1.499672, -0.823459, 2.604091, 1, 1, 1, 1, 1,
1.50991, -1.900492, 2.225095, 1, 1, 1, 1, 1,
1.51068, 0.05022792, 2.054434, 1, 1, 1, 1, 1,
1.511603, -2.028256, 3.133867, 1, 1, 1, 1, 1,
1.537711, 0.3764221, 0.677116, 1, 1, 1, 1, 1,
1.539541, 0.5677289, 2.144542, 0, 0, 1, 1, 1,
1.545082, 1.03213, 1.366187, 1, 0, 0, 1, 1,
1.556824, 0.4587896, 2.494163, 1, 0, 0, 1, 1,
1.559985, 1.403544, 0.9525618, 1, 0, 0, 1, 1,
1.569764, -0.307198, 2.804454, 1, 0, 0, 1, 1,
1.590011, 0.2758704, 0.9351153, 1, 0, 0, 1, 1,
1.601693, 0.7990336, 1.312614, 0, 0, 0, 1, 1,
1.608056, 1.182743, -0.4840818, 0, 0, 0, 1, 1,
1.626952, 0.6831453, 1.315619, 0, 0, 0, 1, 1,
1.628684, 0.1967166, 2.562752, 0, 0, 0, 1, 1,
1.630026, 0.2377673, 0.9280167, 0, 0, 0, 1, 1,
1.640677, 0.5971136, 0.9017334, 0, 0, 0, 1, 1,
1.645679, 0.154832, 2.352436, 0, 0, 0, 1, 1,
1.652244, 0.5934753, 2.324923, 1, 1, 1, 1, 1,
1.652954, -0.3321155, 1.385146, 1, 1, 1, 1, 1,
1.666885, 1.475209, -2.670845, 1, 1, 1, 1, 1,
1.673075, 1.437097, 1.023501, 1, 1, 1, 1, 1,
1.698178, 1.023375, 0.6219807, 1, 1, 1, 1, 1,
1.728219, 0.02078277, 0.4059227, 1, 1, 1, 1, 1,
1.736147, 0.7706018, 0.1918736, 1, 1, 1, 1, 1,
1.799816, 1.620504, 1.509107, 1, 1, 1, 1, 1,
1.819655, 0.3017434, -0.8174326, 1, 1, 1, 1, 1,
1.866319, -0.1129343, 2.774632, 1, 1, 1, 1, 1,
1.891809, -0.8335751, 2.264806, 1, 1, 1, 1, 1,
1.898852, -0.3749048, 1.469055, 1, 1, 1, 1, 1,
1.909221, -0.645654, 1.226492, 1, 1, 1, 1, 1,
1.940499, 0.300753, 0.8918051, 1, 1, 1, 1, 1,
1.941409, 0.09080373, 1.869116, 1, 1, 1, 1, 1,
1.947083, -0.4041772, 1.71959, 0, 0, 1, 1, 1,
1.961376, 1.526002, 0.6250581, 1, 0, 0, 1, 1,
1.978687, 0.4262875, 1.859291, 1, 0, 0, 1, 1,
2.074268, 0.8032116, 0.531224, 1, 0, 0, 1, 1,
2.082417, -0.7769343, 0.1526081, 1, 0, 0, 1, 1,
2.087233, 0.4413094, 1.030893, 1, 0, 0, 1, 1,
2.11638, 0.5155004, 1.928179, 0, 0, 0, 1, 1,
2.124089, 0.1162878, -0.436601, 0, 0, 0, 1, 1,
2.156721, -0.7048252, 0.6137571, 0, 0, 0, 1, 1,
2.164492, -1.244037, 1.173519, 0, 0, 0, 1, 1,
2.294518, 1.4699, 0.009271846, 0, 0, 0, 1, 1,
2.317542, -0.7326428, 0.7474065, 0, 0, 0, 1, 1,
2.330861, 0.3744017, 2.668919, 0, 0, 0, 1, 1,
2.366369, 0.2024346, 1.715676, 1, 1, 1, 1, 1,
2.411473, 0.0184087, 0.03012813, 1, 1, 1, 1, 1,
2.442065, 1.120094, 0.5362583, 1, 1, 1, 1, 1,
2.463899, -0.5889972, 0.5969634, 1, 1, 1, 1, 1,
2.476934, 0.9392707, 2.407614, 1, 1, 1, 1, 1,
2.607982, 0.9332428, 1.600451, 1, 1, 1, 1, 1,
2.804183, 0.2183953, 1.370033, 1, 1, 1, 1, 1
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
var radius = 9.709704;
var distance = 34.10492;
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
mvMatrix.translate( -0.09977114, -0.1901388, -0.4679201 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.10492);
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
