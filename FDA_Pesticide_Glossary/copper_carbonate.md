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
-3.109453, -3.256018, -0.8889756, 1, 0, 0, 1,
-3.072212, 1.002879, -1.063838, 1, 0.007843138, 0, 1,
-2.878317, 2.893773, -0.6171467, 1, 0.01176471, 0, 1,
-2.712734, 1.493994, -1.61574, 1, 0.01960784, 0, 1,
-2.622272, -0.8608559, -2.330517, 1, 0.02352941, 0, 1,
-2.452856, -0.7769147, -0.6362084, 1, 0.03137255, 0, 1,
-2.37739, 0.411646, -0.002878649, 1, 0.03529412, 0, 1,
-2.35607, -0.8840336, -3.712857, 1, 0.04313726, 0, 1,
-2.22009, 1.13039, 0.288193, 1, 0.04705882, 0, 1,
-2.203685, 0.7203497, -1.46328, 1, 0.05490196, 0, 1,
-2.20268, 0.385749, -0.9284479, 1, 0.05882353, 0, 1,
-2.109875, -0.345737, -2.672104, 1, 0.06666667, 0, 1,
-2.073646, 0.3488512, -0.09090761, 1, 0.07058824, 0, 1,
-2.058199, 1.267344, -1.031303, 1, 0.07843138, 0, 1,
-2.034577, -0.4645759, -1.299134, 1, 0.08235294, 0, 1,
-2.025652, 1.25431, -0.1596386, 1, 0.09019608, 0, 1,
-1.969414, -0.4398458, -1.988972, 1, 0.09411765, 0, 1,
-1.962429, -0.7649698, -0.990483, 1, 0.1019608, 0, 1,
-1.937515, 0.03709597, -1.015853, 1, 0.1098039, 0, 1,
-1.91405, 1.277968, -1.39978, 1, 0.1137255, 0, 1,
-1.908842, -0.5755981, -0.5625184, 1, 0.1215686, 0, 1,
-1.903926, 0.6060619, -0.8054191, 1, 0.1254902, 0, 1,
-1.886127, 0.3142659, -2.236707, 1, 0.1333333, 0, 1,
-1.879069, -0.1361227, -0.5768508, 1, 0.1372549, 0, 1,
-1.864764, 1.301614, -0.925169, 1, 0.145098, 0, 1,
-1.855012, -0.8083748, -0.9930559, 1, 0.1490196, 0, 1,
-1.849818, -0.1437534, -1.24091, 1, 0.1568628, 0, 1,
-1.829803, 0.5687525, -2.511906, 1, 0.1607843, 0, 1,
-1.810768, -0.7536484, -2.276228, 1, 0.1686275, 0, 1,
-1.80594, -0.34367, 0.7345588, 1, 0.172549, 0, 1,
-1.803343, -0.4412356, -1.994031, 1, 0.1803922, 0, 1,
-1.792958, -0.7856519, -1.405006, 1, 0.1843137, 0, 1,
-1.757186, -0.8215689, -1.578428, 1, 0.1921569, 0, 1,
-1.752028, 0.7761667, -1.427527, 1, 0.1960784, 0, 1,
-1.711555, 0.2634348, -3.063181, 1, 0.2039216, 0, 1,
-1.699425, 0.2046666, -1.419134, 1, 0.2117647, 0, 1,
-1.689522, 0.6411632, 1.63453, 1, 0.2156863, 0, 1,
-1.675329, -1.716556, -1.113454, 1, 0.2235294, 0, 1,
-1.655115, -0.3753173, -2.82438, 1, 0.227451, 0, 1,
-1.641824, -0.1426951, -1.494531, 1, 0.2352941, 0, 1,
-1.638637, 0.9174346, -2.162677, 1, 0.2392157, 0, 1,
-1.635887, -1.935976, -2.070602, 1, 0.2470588, 0, 1,
-1.61025, -0.4130232, -1.759424, 1, 0.2509804, 0, 1,
-1.597232, -1.081616, -2.300767, 1, 0.2588235, 0, 1,
-1.593867, -1.652087, -3.057307, 1, 0.2627451, 0, 1,
-1.592, -0.1848572, -3.269033, 1, 0.2705882, 0, 1,
-1.588606, 1.011668, -2.054036, 1, 0.2745098, 0, 1,
-1.55097, 0.1444782, -1.222875, 1, 0.282353, 0, 1,
-1.541475, -1.645741, -3.902352, 1, 0.2862745, 0, 1,
-1.52621, 0.6143738, -1.155379, 1, 0.2941177, 0, 1,
-1.520089, 0.4376943, -1.434344, 1, 0.3019608, 0, 1,
-1.518074, -0.339065, -1.726597, 1, 0.3058824, 0, 1,
-1.499605, -0.04176098, -0.6987475, 1, 0.3137255, 0, 1,
-1.481835, 0.2924901, -1.48634, 1, 0.3176471, 0, 1,
-1.48116, -1.018095, -2.658483, 1, 0.3254902, 0, 1,
-1.478334, -0.5781821, -2.998146, 1, 0.3294118, 0, 1,
-1.464991, -1.51388, -1.930502, 1, 0.3372549, 0, 1,
-1.459183, -0.06166768, -1.342121, 1, 0.3411765, 0, 1,
-1.457271, -0.8185193, -0.7993283, 1, 0.3490196, 0, 1,
-1.451038, 1.087633, -2.214398, 1, 0.3529412, 0, 1,
-1.443771, 1.419093, -1.057741, 1, 0.3607843, 0, 1,
-1.441814, 0.1579003, -1.263709, 1, 0.3647059, 0, 1,
-1.416699, 0.1999699, -1.736065, 1, 0.372549, 0, 1,
-1.410821, -1.145468, -3.623195, 1, 0.3764706, 0, 1,
-1.408883, 0.2018932, -1.460423, 1, 0.3843137, 0, 1,
-1.403404, 0.9404961, -1.894102, 1, 0.3882353, 0, 1,
-1.382149, 0.1131666, -1.159749, 1, 0.3960784, 0, 1,
-1.380922, 2.58892, -0.9506795, 1, 0.4039216, 0, 1,
-1.372159, 0.2292933, -2.119574, 1, 0.4078431, 0, 1,
-1.363232, 1.435863, -0.2637034, 1, 0.4156863, 0, 1,
-1.343017, -0.4098547, -1.742035, 1, 0.4196078, 0, 1,
-1.325355, 0.25435, -1.904624, 1, 0.427451, 0, 1,
-1.317819, -0.1071585, -2.805135, 1, 0.4313726, 0, 1,
-1.29836, -0.6790957, -2.260865, 1, 0.4392157, 0, 1,
-1.292808, 0.1339141, -1.203036, 1, 0.4431373, 0, 1,
-1.289474, 0.7993819, -1.360221, 1, 0.4509804, 0, 1,
-1.285921, -0.6400113, -4.178476, 1, 0.454902, 0, 1,
-1.277826, -0.2267877, -3.829667, 1, 0.4627451, 0, 1,
-1.27663, -0.3859669, -0.5300814, 1, 0.4666667, 0, 1,
-1.238079, -1.70085, -2.192665, 1, 0.4745098, 0, 1,
-1.237809, -0.9848055, -2.83995, 1, 0.4784314, 0, 1,
-1.230722, -0.420966, -1.713028, 1, 0.4862745, 0, 1,
-1.226737, 0.1411971, -0.9485236, 1, 0.4901961, 0, 1,
-1.226732, 2.065392, 2.263108, 1, 0.4980392, 0, 1,
-1.223647, -1.477761, -1.774295, 1, 0.5058824, 0, 1,
-1.207239, -0.3271829, -1.023126, 1, 0.509804, 0, 1,
-1.206781, -0.5537575, -1.795691, 1, 0.5176471, 0, 1,
-1.201543, 1.755718, 0.3544306, 1, 0.5215687, 0, 1,
-1.175615, 0.07469015, -1.607896, 1, 0.5294118, 0, 1,
-1.172612, 0.3025213, 0.5003601, 1, 0.5333334, 0, 1,
-1.163847, 1.092173, 0.2633216, 1, 0.5411765, 0, 1,
-1.163706, -0.6779698, -0.3172954, 1, 0.5450981, 0, 1,
-1.161556, 0.5913433, -0.4214172, 1, 0.5529412, 0, 1,
-1.161055, -0.3182034, -2.578612, 1, 0.5568628, 0, 1,
-1.15067, -1.206262, -1.770777, 1, 0.5647059, 0, 1,
-1.148758, 0.9256467, -0.865049, 1, 0.5686275, 0, 1,
-1.146409, 0.02493534, -0.422694, 1, 0.5764706, 0, 1,
-1.146134, 0.5603659, -1.439819, 1, 0.5803922, 0, 1,
-1.141885, 0.07021427, -1.131528, 1, 0.5882353, 0, 1,
-1.136118, -0.5523806, -2.679567, 1, 0.5921569, 0, 1,
-1.133339, 2.106322, -1.634344, 1, 0.6, 0, 1,
-1.130327, -0.1463836, -2.800107, 1, 0.6078432, 0, 1,
-1.117696, -0.1445272, -2.849268, 1, 0.6117647, 0, 1,
-1.113324, -1.175335, -2.732772, 1, 0.6196079, 0, 1,
-1.113181, 0.1880789, -1.835029, 1, 0.6235294, 0, 1,
-1.107888, -0.625165, -2.782472, 1, 0.6313726, 0, 1,
-1.104558, 1.294106, -0.07405788, 1, 0.6352941, 0, 1,
-1.09992, 0.2904995, -0.4856416, 1, 0.6431373, 0, 1,
-1.098798, -1.525957, -1.030546, 1, 0.6470588, 0, 1,
-1.097912, -0.424332, -2.949666, 1, 0.654902, 0, 1,
-1.093023, 2.191057, -1.121791, 1, 0.6588235, 0, 1,
-1.089602, -1.049191, -3.06611, 1, 0.6666667, 0, 1,
-1.089256, -1.19737, -2.640348, 1, 0.6705883, 0, 1,
-1.088542, 0.1012296, -2.020196, 1, 0.6784314, 0, 1,
-1.085138, -0.8767411, -2.386979, 1, 0.682353, 0, 1,
-1.083001, -0.656224, -1.439437, 1, 0.6901961, 0, 1,
-1.070181, -0.3038079, -1.871934, 1, 0.6941177, 0, 1,
-1.066996, -0.8831161, -1.019391, 1, 0.7019608, 0, 1,
-1.06392, -1.593977, -2.768641, 1, 0.7098039, 0, 1,
-1.063802, 0.9692891, 0.4701985, 1, 0.7137255, 0, 1,
-1.056584, -0.6802362, -1.576544, 1, 0.7215686, 0, 1,
-1.054392, 1.14478, 0.1680422, 1, 0.7254902, 0, 1,
-1.053972, -1.368226, -1.497865, 1, 0.7333333, 0, 1,
-1.048886, 0.23441, -2.720597, 1, 0.7372549, 0, 1,
-1.039567, 0.9543489, 0.04943959, 1, 0.7450981, 0, 1,
-1.035989, 2.825558, -1.061422, 1, 0.7490196, 0, 1,
-1.034292, 1.06049, -0.1830524, 1, 0.7568628, 0, 1,
-1.032207, -0.7230448, -1.221366, 1, 0.7607843, 0, 1,
-1.025302, -0.8600448, -2.025486, 1, 0.7686275, 0, 1,
-1.022397, 0.7676908, -0.6283898, 1, 0.772549, 0, 1,
-1.02085, 1.83219, -1.08888, 1, 0.7803922, 0, 1,
-1.018041, 0.2665791, -3.585437, 1, 0.7843137, 0, 1,
-1.012651, -0.5953928, -3.984645, 1, 0.7921569, 0, 1,
-1.00684, -0.3752488, -2.948073, 1, 0.7960784, 0, 1,
-0.9970218, 0.656786, -0.9297895, 1, 0.8039216, 0, 1,
-0.9934636, -0.719157, -1.923193, 1, 0.8117647, 0, 1,
-0.9931858, 0.9024327, -1.982394, 1, 0.8156863, 0, 1,
-0.9889055, -1.437781, -0.1742548, 1, 0.8235294, 0, 1,
-0.9855034, 3.954232, -0.5104928, 1, 0.827451, 0, 1,
-0.9843273, 0.7277898, -1.285186, 1, 0.8352941, 0, 1,
-0.9788771, 1.269246, -1.293112, 1, 0.8392157, 0, 1,
-0.9772744, -0.6344029, -2.530164, 1, 0.8470588, 0, 1,
-0.9746768, -1.357424, -3.35188, 1, 0.8509804, 0, 1,
-0.9687216, -0.4728952, -1.703869, 1, 0.8588235, 0, 1,
-0.966346, 1.293687, -1.013761, 1, 0.8627451, 0, 1,
-0.9634506, -1.210213, -0.009288324, 1, 0.8705882, 0, 1,
-0.9562369, 0.4853232, -1.968428, 1, 0.8745098, 0, 1,
-0.9485075, 1.690397, 0.1921691, 1, 0.8823529, 0, 1,
-0.9482944, 1.206142, 2.031779, 1, 0.8862745, 0, 1,
-0.9464978, 0.4150154, -3.322013, 1, 0.8941177, 0, 1,
-0.9457591, -0.125675, -1.461496, 1, 0.8980392, 0, 1,
-0.9440546, -0.03752958, -3.263624, 1, 0.9058824, 0, 1,
-0.9435576, -0.7752417, -1.383136, 1, 0.9137255, 0, 1,
-0.9422862, 0.7532941, 0.0207417, 1, 0.9176471, 0, 1,
-0.941996, -0.8315834, -2.922563, 1, 0.9254902, 0, 1,
-0.9335058, -0.2755495, -3.455458, 1, 0.9294118, 0, 1,
-0.9325701, 0.9952366, -0.7418169, 1, 0.9372549, 0, 1,
-0.9292095, -1.546668, -1.261476, 1, 0.9411765, 0, 1,
-0.9258708, -0.02826893, -0.1961881, 1, 0.9490196, 0, 1,
-0.9203069, 1.391615, -0.243871, 1, 0.9529412, 0, 1,
-0.9172504, 1.620188, -0.1091281, 1, 0.9607843, 0, 1,
-0.9147331, 0.07778091, -2.921458, 1, 0.9647059, 0, 1,
-0.9042456, 0.4895693, -0.1087435, 1, 0.972549, 0, 1,
-0.9033389, 0.5512767, -1.739979, 1, 0.9764706, 0, 1,
-0.8983895, 1.157299, -1.125208, 1, 0.9843137, 0, 1,
-0.8973796, 0.6371164, -1.838152, 1, 0.9882353, 0, 1,
-0.8967428, -0.4407189, -1.902081, 1, 0.9960784, 0, 1,
-0.8947742, -0.8023858, -2.452443, 0.9960784, 1, 0, 1,
-0.8928037, 0.2142881, -3.674449, 0.9921569, 1, 0, 1,
-0.8922769, -0.2473871, -2.416142, 0.9843137, 1, 0, 1,
-0.887329, 0.7494597, -2.045283, 0.9803922, 1, 0, 1,
-0.88427, -0.9582394, -1.804705, 0.972549, 1, 0, 1,
-0.8779603, -0.8511413, -2.604463, 0.9686275, 1, 0, 1,
-0.8777055, 0.2253786, -1.570911, 0.9607843, 1, 0, 1,
-0.8774881, 1.479569, -0.7649847, 0.9568627, 1, 0, 1,
-0.8730516, 0.5221117, -1.003559, 0.9490196, 1, 0, 1,
-0.8718292, -1.727223, -2.204629, 0.945098, 1, 0, 1,
-0.8668392, 1.208453, 1.481869, 0.9372549, 1, 0, 1,
-0.8602122, -1.038963, -2.066713, 0.9333333, 1, 0, 1,
-0.8586804, -0.6710786, -3.957753, 0.9254902, 1, 0, 1,
-0.8566873, 0.7476953, -0.7166995, 0.9215686, 1, 0, 1,
-0.8549694, -2.080734, -3.186447, 0.9137255, 1, 0, 1,
-0.8497545, 0.6698537, 0.2210759, 0.9098039, 1, 0, 1,
-0.849556, -1.63056, -4.173463, 0.9019608, 1, 0, 1,
-0.8480546, -0.4322503, -0.2626292, 0.8941177, 1, 0, 1,
-0.8414297, -0.2091484, -1.84062, 0.8901961, 1, 0, 1,
-0.8361893, 0.6493011, -2.18225, 0.8823529, 1, 0, 1,
-0.8336513, 0.1068319, -0.7042368, 0.8784314, 1, 0, 1,
-0.829839, -0.2974276, -2.200448, 0.8705882, 1, 0, 1,
-0.8245503, 1.247033, 1.242225, 0.8666667, 1, 0, 1,
-0.8207115, -0.4584638, -1.634512, 0.8588235, 1, 0, 1,
-0.8120027, 1.411036, 0.1559668, 0.854902, 1, 0, 1,
-0.8085535, 0.5229464, 0.8337324, 0.8470588, 1, 0, 1,
-0.7959868, -0.2397693, -0.9022819, 0.8431373, 1, 0, 1,
-0.7959165, 0.5960925, 0.04626832, 0.8352941, 1, 0, 1,
-0.7884259, 0.2777935, -0.7116761, 0.8313726, 1, 0, 1,
-0.7786202, 0.3474212, -1.466158, 0.8235294, 1, 0, 1,
-0.7783194, -0.2402002, -1.892512, 0.8196079, 1, 0, 1,
-0.7740971, 1.208836, -0.885367, 0.8117647, 1, 0, 1,
-0.7740167, 0.8878606, -0.9664521, 0.8078431, 1, 0, 1,
-0.7724872, -0.2680344, -0.8976465, 0.8, 1, 0, 1,
-0.7684273, -0.7415007, -1.61627, 0.7921569, 1, 0, 1,
-0.7602904, 1.123784, 0.1274983, 0.7882353, 1, 0, 1,
-0.7570673, -0.8955019, -2.238652, 0.7803922, 1, 0, 1,
-0.7547676, 0.411282, -3.583256, 0.7764706, 1, 0, 1,
-0.7538499, -0.4574363, -1.740534, 0.7686275, 1, 0, 1,
-0.750189, -0.6143049, -3.519012, 0.7647059, 1, 0, 1,
-0.7487451, -1.274776, -3.217277, 0.7568628, 1, 0, 1,
-0.7416819, 0.1685574, -1.498984, 0.7529412, 1, 0, 1,
-0.7397711, -1.859714, -4.327143, 0.7450981, 1, 0, 1,
-0.7380748, 1.545062, -2.148011, 0.7411765, 1, 0, 1,
-0.7338679, -0.7961849, -2.473336, 0.7333333, 1, 0, 1,
-0.7324667, -1.146168, -1.985231, 0.7294118, 1, 0, 1,
-0.7320351, 1.084238, -2.117303, 0.7215686, 1, 0, 1,
-0.7281488, -0.7992874, -2.107304, 0.7176471, 1, 0, 1,
-0.7239083, -1.219079, -4.204938, 0.7098039, 1, 0, 1,
-0.7183585, -0.1183898, -0.0609642, 0.7058824, 1, 0, 1,
-0.7145284, -0.2263006, -0.687187, 0.6980392, 1, 0, 1,
-0.7134184, 0.4858853, -1.279401, 0.6901961, 1, 0, 1,
-0.7076147, -0.6252592, -1.803723, 0.6862745, 1, 0, 1,
-0.7054655, -1.269928, -1.913608, 0.6784314, 1, 0, 1,
-0.7007963, -0.1492884, -1.136632, 0.6745098, 1, 0, 1,
-0.7006733, -0.6472368, -2.633174, 0.6666667, 1, 0, 1,
-0.6974793, 1.648993, -1.056833, 0.6627451, 1, 0, 1,
-0.6955434, 1.167171, -0.2573244, 0.654902, 1, 0, 1,
-0.6947571, 0.1948376, -1.265982, 0.6509804, 1, 0, 1,
-0.6936718, 2.516695, -0.1105483, 0.6431373, 1, 0, 1,
-0.6936057, -0.6334398, -0.7065337, 0.6392157, 1, 0, 1,
-0.6820373, -0.68609, -2.682219, 0.6313726, 1, 0, 1,
-0.676845, -0.6318839, -3.153759, 0.627451, 1, 0, 1,
-0.6682219, 0.9407596, -1.00485, 0.6196079, 1, 0, 1,
-0.6659228, 0.1135959, -2.58902, 0.6156863, 1, 0, 1,
-0.6655715, -0.329075, -0.7121987, 0.6078432, 1, 0, 1,
-0.6626226, -0.2413125, -1.407198, 0.6039216, 1, 0, 1,
-0.6556911, -0.1284406, -1.705061, 0.5960785, 1, 0, 1,
-0.6516704, -1.216481, -3.429089, 0.5882353, 1, 0, 1,
-0.6508043, 0.7279627, -0.4091258, 0.5843138, 1, 0, 1,
-0.6487857, 0.2644853, -0.9827673, 0.5764706, 1, 0, 1,
-0.6478101, 0.9384836, -1.39158, 0.572549, 1, 0, 1,
-0.6467581, 0.6291068, -1.434054, 0.5647059, 1, 0, 1,
-0.6410674, -1.001336, -1.614841, 0.5607843, 1, 0, 1,
-0.635078, 0.7930979, -1.062216, 0.5529412, 1, 0, 1,
-0.6310437, 0.7244592, -1.234267, 0.5490196, 1, 0, 1,
-0.6266558, 1.251367, 0.4032187, 0.5411765, 1, 0, 1,
-0.6249142, 0.7747899, -1.772948, 0.5372549, 1, 0, 1,
-0.6240876, 0.6495388, -0.004725055, 0.5294118, 1, 0, 1,
-0.6199182, -1.533122, -2.565254, 0.5254902, 1, 0, 1,
-0.6188067, 0.756849, -0.826867, 0.5176471, 1, 0, 1,
-0.6183237, 1.292517, 0.5088247, 0.5137255, 1, 0, 1,
-0.6154503, -0.2121662, -1.566301, 0.5058824, 1, 0, 1,
-0.6148051, -0.399142, -0.3190169, 0.5019608, 1, 0, 1,
-0.6145703, 0.6214028, -1.129618, 0.4941176, 1, 0, 1,
-0.612516, -1.969887, -2.811312, 0.4862745, 1, 0, 1,
-0.6065857, 1.652546, 0.08825002, 0.4823529, 1, 0, 1,
-0.6046641, -0.9618812, -2.585202, 0.4745098, 1, 0, 1,
-0.6024553, 0.5523543, -0.8816444, 0.4705882, 1, 0, 1,
-0.5952516, 0.4778383, -0.5991859, 0.4627451, 1, 0, 1,
-0.5920798, -0.02034183, -2.151387, 0.4588235, 1, 0, 1,
-0.5906714, -0.3489009, -2.598327, 0.4509804, 1, 0, 1,
-0.5896016, 0.2873488, -0.09706487, 0.4470588, 1, 0, 1,
-0.5870196, 0.3963132, -1.277973, 0.4392157, 1, 0, 1,
-0.5811886, 1.284912, -0.9517971, 0.4352941, 1, 0, 1,
-0.5788296, -0.5278637, -1.288647, 0.427451, 1, 0, 1,
-0.5726786, -0.5353115, -1.882888, 0.4235294, 1, 0, 1,
-0.5721662, 0.3844001, -1.789396, 0.4156863, 1, 0, 1,
-0.5674363, 0.8997845, -2.823911, 0.4117647, 1, 0, 1,
-0.5660778, -0.4485838, -0.626624, 0.4039216, 1, 0, 1,
-0.5608814, 0.7530685, -0.02577875, 0.3960784, 1, 0, 1,
-0.5563858, -0.9594259, -1.701, 0.3921569, 1, 0, 1,
-0.552572, -0.1248191, -2.855763, 0.3843137, 1, 0, 1,
-0.5519348, 1.705117, 0.6832908, 0.3803922, 1, 0, 1,
-0.5505232, 0.01246888, -2.016732, 0.372549, 1, 0, 1,
-0.5501201, -0.5497652, -2.672718, 0.3686275, 1, 0, 1,
-0.5484792, -1.024042, -1.924394, 0.3607843, 1, 0, 1,
-0.545057, 1.493152, 1.087839, 0.3568628, 1, 0, 1,
-0.5413564, 2.381745, 0.3343561, 0.3490196, 1, 0, 1,
-0.5411686, -0.8440438, -2.938798, 0.345098, 1, 0, 1,
-0.5334373, 1.794268, -1.03598, 0.3372549, 1, 0, 1,
-0.5325046, 0.8114886, -0.9942669, 0.3333333, 1, 0, 1,
-0.5312456, 1.06193, 0.2286859, 0.3254902, 1, 0, 1,
-0.5283285, 1.106386, -0.1001997, 0.3215686, 1, 0, 1,
-0.5270628, 0.2930375, -1.83781, 0.3137255, 1, 0, 1,
-0.5264103, 0.7703716, -0.5847774, 0.3098039, 1, 0, 1,
-0.5235437, -0.5618397, -3.508896, 0.3019608, 1, 0, 1,
-0.5235406, 0.6460292, -0.9530768, 0.2941177, 1, 0, 1,
-0.5212739, 0.03533707, -0.8050925, 0.2901961, 1, 0, 1,
-0.5190908, 0.7070493, -2.099758, 0.282353, 1, 0, 1,
-0.5161381, 1.709134, -0.2011648, 0.2784314, 1, 0, 1,
-0.5129877, 0.9537147, -0.2072829, 0.2705882, 1, 0, 1,
-0.5093529, -1.411709, -3.47825, 0.2666667, 1, 0, 1,
-0.5066368, -2.44617, -3.99393, 0.2588235, 1, 0, 1,
-0.5046719, -1.332077, -2.345274, 0.254902, 1, 0, 1,
-0.5021443, 0.4769045, -1.085202, 0.2470588, 1, 0, 1,
-0.4999885, -0.4611686, -2.166065, 0.2431373, 1, 0, 1,
-0.4998924, 0.2503039, -1.676242, 0.2352941, 1, 0, 1,
-0.498394, -1.853169, -2.595054, 0.2313726, 1, 0, 1,
-0.4953222, 1.517026, 0.5789999, 0.2235294, 1, 0, 1,
-0.4945068, 0.09979492, -0.595654, 0.2196078, 1, 0, 1,
-0.4926774, -0.02940433, -2.087594, 0.2117647, 1, 0, 1,
-0.4903378, 0.6023849, -1.614201, 0.2078431, 1, 0, 1,
-0.4883177, -1.175838, -0.4437937, 0.2, 1, 0, 1,
-0.4880069, -0.818934, -3.546171, 0.1921569, 1, 0, 1,
-0.4869464, 2.109884, -1.037894, 0.1882353, 1, 0, 1,
-0.4784658, 0.2504957, -0.07676468, 0.1803922, 1, 0, 1,
-0.4758159, -0.5612631, -2.13909, 0.1764706, 1, 0, 1,
-0.4680271, -0.3586975, -2.68565, 0.1686275, 1, 0, 1,
-0.4678263, -1.387006, -1.163066, 0.1647059, 1, 0, 1,
-0.4664872, 0.2216099, -2.206779, 0.1568628, 1, 0, 1,
-0.4649241, -0.1918999, -2.688641, 0.1529412, 1, 0, 1,
-0.4639805, 0.9251366, 0.4117563, 0.145098, 1, 0, 1,
-0.4631559, -0.1045906, 0.7342774, 0.1411765, 1, 0, 1,
-0.4620411, -0.1022513, -1.308269, 0.1333333, 1, 0, 1,
-0.4619314, -0.8156081, -2.103755, 0.1294118, 1, 0, 1,
-0.4608871, -0.8691702, -3.298757, 0.1215686, 1, 0, 1,
-0.4572414, -0.5386905, -3.176375, 0.1176471, 1, 0, 1,
-0.4552121, 0.225966, 0.09409893, 0.1098039, 1, 0, 1,
-0.4545705, 0.7841849, 0.9979643, 0.1058824, 1, 0, 1,
-0.4464647, 0.9520299, -0.3058937, 0.09803922, 1, 0, 1,
-0.4430578, 0.7143016, -1.455598, 0.09019608, 1, 0, 1,
-0.4412407, 0.403671, 0.2543484, 0.08627451, 1, 0, 1,
-0.4347426, 2.18038, -0.9761285, 0.07843138, 1, 0, 1,
-0.433626, 0.02931646, -1.159849, 0.07450981, 1, 0, 1,
-0.4308989, -0.1362858, -1.209846, 0.06666667, 1, 0, 1,
-0.4284698, -1.721715, -2.0085, 0.0627451, 1, 0, 1,
-0.4249781, -1.107326, -3.639316, 0.05490196, 1, 0, 1,
-0.4215464, 0.5618204, -1.106715, 0.05098039, 1, 0, 1,
-0.4178806, 0.0525215, -0.4065093, 0.04313726, 1, 0, 1,
-0.4163583, -0.1038626, -1.630516, 0.03921569, 1, 0, 1,
-0.4148862, -1.898659, -2.076543, 0.03137255, 1, 0, 1,
-0.4103498, 0.5798526, -0.3214449, 0.02745098, 1, 0, 1,
-0.409855, 0.1819447, 1.023121, 0.01960784, 1, 0, 1,
-0.4098271, -0.1880434, -0.954044, 0.01568628, 1, 0, 1,
-0.4060017, -1.022097, -2.371931, 0.007843138, 1, 0, 1,
-0.402365, 0.9217884, 0.3495731, 0.003921569, 1, 0, 1,
-0.3977975, 0.8030688, -0.8896585, 0, 1, 0.003921569, 1,
-0.3883605, 0.02385461, -1.822633, 0, 1, 0.01176471, 1,
-0.3881407, 0.3718081, -1.138403, 0, 1, 0.01568628, 1,
-0.3857272, 0.03121752, -1.720894, 0, 1, 0.02352941, 1,
-0.3789386, -0.6127183, -1.650373, 0, 1, 0.02745098, 1,
-0.3708966, 1.755924, -0.6660916, 0, 1, 0.03529412, 1,
-0.3695982, 1.642648, -1.184861, 0, 1, 0.03921569, 1,
-0.3673857, 2.549286, -0.4091065, 0, 1, 0.04705882, 1,
-0.3607946, 0.1393695, -2.943203, 0, 1, 0.05098039, 1,
-0.3581772, -1.274744, -4.771555, 0, 1, 0.05882353, 1,
-0.3579449, 0.1621496, 0.2628685, 0, 1, 0.0627451, 1,
-0.3563867, 1.083509, -0.8562842, 0, 1, 0.07058824, 1,
-0.355351, 0.1164016, -0.6924903, 0, 1, 0.07450981, 1,
-0.3543698, -0.4707861, -2.275009, 0, 1, 0.08235294, 1,
-0.3524309, -0.04712834, -0.3201272, 0, 1, 0.08627451, 1,
-0.3519638, -0.03196523, -2.03158, 0, 1, 0.09411765, 1,
-0.3449889, -0.9883896, -3.645586, 0, 1, 0.1019608, 1,
-0.3349775, -0.2938374, -1.324729, 0, 1, 0.1058824, 1,
-0.3346799, 0.1259516, -1.155475, 0, 1, 0.1137255, 1,
-0.3298714, -0.7733863, -2.471551, 0, 1, 0.1176471, 1,
-0.3283498, -2.002277, -1.171802, 0, 1, 0.1254902, 1,
-0.3204782, -0.2922172, -2.584957, 0, 1, 0.1294118, 1,
-0.3145926, 0.8423016, -0.1986144, 0, 1, 0.1372549, 1,
-0.314201, -1.007091, -2.417547, 0, 1, 0.1411765, 1,
-0.3132061, 0.6180587, -1.65494, 0, 1, 0.1490196, 1,
-0.3119157, -0.2336475, -2.798908, 0, 1, 0.1529412, 1,
-0.3099529, 0.04852676, -0.09198397, 0, 1, 0.1607843, 1,
-0.3087472, -1.36187, -2.789283, 0, 1, 0.1647059, 1,
-0.3055074, 1.134576, -0.110991, 0, 1, 0.172549, 1,
-0.2962772, 0.3325769, -2.252002, 0, 1, 0.1764706, 1,
-0.2922781, 0.09394362, -1.473603, 0, 1, 0.1843137, 1,
-0.290019, 0.4818084, 1.013256, 0, 1, 0.1882353, 1,
-0.2899131, -1.401162, -1.545873, 0, 1, 0.1960784, 1,
-0.2891865, -3.302308, -1.938974, 0, 1, 0.2039216, 1,
-0.2822444, 0.1136348, -0.7314524, 0, 1, 0.2078431, 1,
-0.2814977, -1.054967, -4.181, 0, 1, 0.2156863, 1,
-0.2793677, -0.5092241, -2.846998, 0, 1, 0.2196078, 1,
-0.2701409, -0.5781783, -3.070317, 0, 1, 0.227451, 1,
-0.263314, 0.4748091, 1.128627, 0, 1, 0.2313726, 1,
-0.2621195, -0.5440657, -2.531858, 0, 1, 0.2392157, 1,
-0.2608446, 0.115083, -0.3260302, 0, 1, 0.2431373, 1,
-0.2607591, -0.3090115, -3.05058, 0, 1, 0.2509804, 1,
-0.2573245, -1.044008, -2.827183, 0, 1, 0.254902, 1,
-0.2569108, 0.1607105, -0.6510814, 0, 1, 0.2627451, 1,
-0.2557284, -0.1093211, -3.225851, 0, 1, 0.2666667, 1,
-0.2443666, -0.2794169, -2.714157, 0, 1, 0.2745098, 1,
-0.2414603, -1.536072, -3.067823, 0, 1, 0.2784314, 1,
-0.2378198, -0.1015036, -2.398726, 0, 1, 0.2862745, 1,
-0.2364308, 0.182589, -1.770862, 0, 1, 0.2901961, 1,
-0.2294506, -0.9642928, -1.453823, 0, 1, 0.2980392, 1,
-0.2218176, -0.9421987, -2.176564, 0, 1, 0.3058824, 1,
-0.2168298, -0.826196, -2.755911, 0, 1, 0.3098039, 1,
-0.2116511, 0.6673405, 0.09561142, 0, 1, 0.3176471, 1,
-0.2080974, 0.7090433, 0.1994048, 0, 1, 0.3215686, 1,
-0.2029617, -2.142564, -3.74152, 0, 1, 0.3294118, 1,
-0.2028715, -0.02794298, -3.212669, 0, 1, 0.3333333, 1,
-0.2019478, -0.4116568, -1.907011, 0, 1, 0.3411765, 1,
-0.2014138, -0.4180326, -2.340933, 0, 1, 0.345098, 1,
-0.1982647, -0.2372687, -2.377633, 0, 1, 0.3529412, 1,
-0.1976657, 0.1314536, -1.076542, 0, 1, 0.3568628, 1,
-0.1936797, -0.9829421, -3.494555, 0, 1, 0.3647059, 1,
-0.1911511, -0.6209386, -2.380469, 0, 1, 0.3686275, 1,
-0.1883169, 0.6635914, 0.6865215, 0, 1, 0.3764706, 1,
-0.1878214, -0.02305593, -2.721912, 0, 1, 0.3803922, 1,
-0.1826829, -0.420631, -3.329448, 0, 1, 0.3882353, 1,
-0.1821486, 0.4206347, -1.223644, 0, 1, 0.3921569, 1,
-0.1795416, 0.003063178, -1.642221, 0, 1, 0.4, 1,
-0.1766207, 2.520464, -0.6178035, 0, 1, 0.4078431, 1,
-0.1735421, -0.5681844, -2.500342, 0, 1, 0.4117647, 1,
-0.169046, -0.9161072, -2.859453, 0, 1, 0.4196078, 1,
-0.1636496, 0.5561262, 0.5169508, 0, 1, 0.4235294, 1,
-0.1587332, -0.9854721, -2.703672, 0, 1, 0.4313726, 1,
-0.1566145, -0.9173756, -2.784561, 0, 1, 0.4352941, 1,
-0.1553919, 0.02665726, -1.526183, 0, 1, 0.4431373, 1,
-0.1513755, -0.6845636, -3.546927, 0, 1, 0.4470588, 1,
-0.1501212, -0.4670135, -4.794598, 0, 1, 0.454902, 1,
-0.1499796, -0.2635604, -1.940051, 0, 1, 0.4588235, 1,
-0.1453004, 0.5466065, -0.918977, 0, 1, 0.4666667, 1,
-0.1434835, -0.3540345, -2.320671, 0, 1, 0.4705882, 1,
-0.1433746, 1.945893, -1.255487, 0, 1, 0.4784314, 1,
-0.1424474, -0.2053063, -2.874601, 0, 1, 0.4823529, 1,
-0.1397398, -0.8588704, -3.461574, 0, 1, 0.4901961, 1,
-0.1376506, 0.05121094, -3.431806, 0, 1, 0.4941176, 1,
-0.1362765, 0.009118755, -1.643077, 0, 1, 0.5019608, 1,
-0.1355183, 0.8891297, 0.1912673, 0, 1, 0.509804, 1,
-0.1337893, 0.1000986, -1.282164, 0, 1, 0.5137255, 1,
-0.133028, -1.165892, -2.772255, 0, 1, 0.5215687, 1,
-0.1329314, 0.788331, -0.3180171, 0, 1, 0.5254902, 1,
-0.1271026, 0.06183858, -0.1245033, 0, 1, 0.5333334, 1,
-0.127031, -0.9257352, -4.273267, 0, 1, 0.5372549, 1,
-0.1216916, 0.04828283, -2.702384, 0, 1, 0.5450981, 1,
-0.1202657, -0.2522173, -2.938805, 0, 1, 0.5490196, 1,
-0.1136246, -1.57934, -3.191653, 0, 1, 0.5568628, 1,
-0.1093086, -0.2722573, -2.459488, 0, 1, 0.5607843, 1,
-0.1079471, -0.6293431, -2.865942, 0, 1, 0.5686275, 1,
-0.1066763, 1.05802, -0.55182, 0, 1, 0.572549, 1,
-0.1040103, -0.2082126, -1.950613, 0, 1, 0.5803922, 1,
-0.1023636, 0.6679716, -0.1362048, 0, 1, 0.5843138, 1,
-0.1015519, -1.388725, -3.837465, 0, 1, 0.5921569, 1,
-0.1000981, -0.8007046, -4.458993, 0, 1, 0.5960785, 1,
-0.09977829, -0.1952963, -1.879853, 0, 1, 0.6039216, 1,
-0.09259345, -0.9831381, -1.640093, 0, 1, 0.6117647, 1,
-0.09197114, 0.05231877, 0.05534742, 0, 1, 0.6156863, 1,
-0.09108829, -1.104705, -3.293776, 0, 1, 0.6235294, 1,
-0.08869477, -0.4410919, -4.924368, 0, 1, 0.627451, 1,
-0.08012618, -1.318056, -2.817789, 0, 1, 0.6352941, 1,
-0.07973845, -1.036408, -2.1745, 0, 1, 0.6392157, 1,
-0.07941219, -1.022882, -1.81338, 0, 1, 0.6470588, 1,
-0.07879445, 0.7236696, 0.3354607, 0, 1, 0.6509804, 1,
-0.07862906, -0.9116454, -1.902027, 0, 1, 0.6588235, 1,
-0.07411966, 1.658852, -0.3910756, 0, 1, 0.6627451, 1,
-0.07378004, 0.1174184, -0.8748279, 0, 1, 0.6705883, 1,
-0.07233472, -0.6261967, -4.429373, 0, 1, 0.6745098, 1,
-0.07016352, 1.108434, -1.141915, 0, 1, 0.682353, 1,
-0.06939572, 1.413742, 0.04373688, 0, 1, 0.6862745, 1,
-0.06514546, -0.3115769, -3.543051, 0, 1, 0.6941177, 1,
-0.05993503, 1.13554, 0.949253, 0, 1, 0.7019608, 1,
-0.05901063, -1.996066, -4.032232, 0, 1, 0.7058824, 1,
-0.05775539, -0.1362939, -2.953087, 0, 1, 0.7137255, 1,
-0.05441879, 0.03952465, -0.5368905, 0, 1, 0.7176471, 1,
-0.05424756, -1.159586, -0.7957911, 0, 1, 0.7254902, 1,
-0.04566501, -0.4407604, -3.125348, 0, 1, 0.7294118, 1,
-0.04121868, 0.2826554, 1.53544, 0, 1, 0.7372549, 1,
-0.03944956, -1.39967, -4.145253, 0, 1, 0.7411765, 1,
-0.03654164, 0.1397783, -2.124766, 0, 1, 0.7490196, 1,
-0.03603479, -0.3659927, -3.24487, 0, 1, 0.7529412, 1,
-0.03543809, -0.4005852, -3.223656, 0, 1, 0.7607843, 1,
-0.03366635, 0.9640493, 0.7285659, 0, 1, 0.7647059, 1,
-0.0331347, 0.4253934, 1.029541, 0, 1, 0.772549, 1,
-0.03281559, -0.4258792, -3.232767, 0, 1, 0.7764706, 1,
-0.03243003, -0.8141727, -2.720916, 0, 1, 0.7843137, 1,
-0.03154396, -1.302882, -3.008214, 0, 1, 0.7882353, 1,
-0.0192079, -0.06470232, -3.466079, 0, 1, 0.7960784, 1,
-0.01652426, -0.3316189, -3.540245, 0, 1, 0.8039216, 1,
-0.01568763, -0.375143, -1.794189, 0, 1, 0.8078431, 1,
-0.0143113, -1.254768, -2.927174, 0, 1, 0.8156863, 1,
-0.01295572, 1.128865, -1.277699, 0, 1, 0.8196079, 1,
-0.005298771, 0.3648185, -1.644019, 0, 1, 0.827451, 1,
-0.002326541, 0.1877169, -1.192909, 0, 1, 0.8313726, 1,
0.002002478, 1.044391, 0.6345701, 0, 1, 0.8392157, 1,
0.002419672, 0.2160694, 0.5891886, 0, 1, 0.8431373, 1,
0.003921186, -0.1107873, 1.204607, 0, 1, 0.8509804, 1,
0.008890679, 0.01807416, 0.1610086, 0, 1, 0.854902, 1,
0.01605535, -0.06208193, 1.666684, 0, 1, 0.8627451, 1,
0.01628248, -0.7878953, 2.786178, 0, 1, 0.8666667, 1,
0.01877237, 0.3073982, 0.01409422, 0, 1, 0.8745098, 1,
0.02437361, -0.06598751, 3.591817, 0, 1, 0.8784314, 1,
0.02802251, 2.796441, 2.79535, 0, 1, 0.8862745, 1,
0.02864474, 0.8630324, 2.887478, 0, 1, 0.8901961, 1,
0.02865402, 0.6951455, -0.08403021, 0, 1, 0.8980392, 1,
0.03220803, -1.297929, 3.57832, 0, 1, 0.9058824, 1,
0.03596257, 1.825078, 0.4762182, 0, 1, 0.9098039, 1,
0.03794643, 0.6270659, -1.589353, 0, 1, 0.9176471, 1,
0.04440464, 1.731827, 0.1059998, 0, 1, 0.9215686, 1,
0.0460011, 1.516027, -1.525181, 0, 1, 0.9294118, 1,
0.04740858, -0.7641301, 1.937063, 0, 1, 0.9333333, 1,
0.04980588, -0.3663164, 2.430763, 0, 1, 0.9411765, 1,
0.05170652, -0.4922322, 1.574966, 0, 1, 0.945098, 1,
0.05612624, 2.077625, 0.5660875, 0, 1, 0.9529412, 1,
0.05701883, -2.818647, 3.139701, 0, 1, 0.9568627, 1,
0.05857438, 0.001487267, 0.8557335, 0, 1, 0.9647059, 1,
0.06116954, 0.3511909, 0.3036048, 0, 1, 0.9686275, 1,
0.06171551, 0.2677111, 2.067088, 0, 1, 0.9764706, 1,
0.06222756, 1.643041, 0.02157733, 0, 1, 0.9803922, 1,
0.06720307, -0.7938025, 3.716633, 0, 1, 0.9882353, 1,
0.06759433, 0.4596499, -0.3744994, 0, 1, 0.9921569, 1,
0.07185684, -2.624958, 3.468766, 0, 1, 1, 1,
0.07478903, -0.7302606, 3.181673, 0, 0.9921569, 1, 1,
0.07609507, 1.207981, 0.6980723, 0, 0.9882353, 1, 1,
0.07954742, 0.4224153, 0.07647812, 0, 0.9803922, 1, 1,
0.08052842, -0.7160684, 3.315334, 0, 0.9764706, 1, 1,
0.08165108, 0.6782325, 0.4690717, 0, 0.9686275, 1, 1,
0.08261117, -0.5886557, 2.386091, 0, 0.9647059, 1, 1,
0.08510497, -1.472038, 3.039034, 0, 0.9568627, 1, 1,
0.08579776, 0.133859, -0.1762185, 0, 0.9529412, 1, 1,
0.08683091, 0.2599191, 0.1716307, 0, 0.945098, 1, 1,
0.08771426, 1.067134, 2.64329, 0, 0.9411765, 1, 1,
0.09038333, -0.824079, 2.363587, 0, 0.9333333, 1, 1,
0.09117471, 0.373212, 1.532088, 0, 0.9294118, 1, 1,
0.09128197, -0.0973873, 3.681165, 0, 0.9215686, 1, 1,
0.09827278, 0.7478295, 0.4288536, 0, 0.9176471, 1, 1,
0.1014358, -1.298916, 3.664351, 0, 0.9098039, 1, 1,
0.1017939, -0.6668911, 3.236958, 0, 0.9058824, 1, 1,
0.1037701, -0.1503652, 2.941966, 0, 0.8980392, 1, 1,
0.1040883, 0.8908287, -0.842394, 0, 0.8901961, 1, 1,
0.1061432, 0.5141178, 0.8028824, 0, 0.8862745, 1, 1,
0.1069241, -2.145082, 3.090569, 0, 0.8784314, 1, 1,
0.1091249, -0.1545342, 3.251151, 0, 0.8745098, 1, 1,
0.1138005, -0.9681796, 2.768422, 0, 0.8666667, 1, 1,
0.1157196, 2.284881, 1.051833, 0, 0.8627451, 1, 1,
0.1198085, 1.039254, 0.3850793, 0, 0.854902, 1, 1,
0.1205425, -0.2688476, 3.765306, 0, 0.8509804, 1, 1,
0.1246214, 0.8630396, 1.060019, 0, 0.8431373, 1, 1,
0.1249819, -0.6117932, 1.998229, 0, 0.8392157, 1, 1,
0.1272584, 1.165453, 0.8996629, 0, 0.8313726, 1, 1,
0.131384, 0.7264042, 0.9626477, 0, 0.827451, 1, 1,
0.1326609, -1.330443, 3.4197, 0, 0.8196079, 1, 1,
0.13291, 0.4307138, 2.277079, 0, 0.8156863, 1, 1,
0.1337516, -0.5755553, 3.869471, 0, 0.8078431, 1, 1,
0.1380512, -0.1099607, 1.786107, 0, 0.8039216, 1, 1,
0.1406343, 0.6240399, 1.120408, 0, 0.7960784, 1, 1,
0.1475527, 1.679999, 0.3413518, 0, 0.7882353, 1, 1,
0.1479067, 1.288023, -0.3398493, 0, 0.7843137, 1, 1,
0.1507234, -0.3010904, 0.7278686, 0, 0.7764706, 1, 1,
0.1523572, 2.019971, 0.8246135, 0, 0.772549, 1, 1,
0.1588851, -0.6061517, 2.958091, 0, 0.7647059, 1, 1,
0.1609541, -0.85646, 4.487841, 0, 0.7607843, 1, 1,
0.1653097, -0.3062767, 1.667107, 0, 0.7529412, 1, 1,
0.167573, -0.47073, 3.278489, 0, 0.7490196, 1, 1,
0.1675751, -0.7506934, 2.087524, 0, 0.7411765, 1, 1,
0.1685732, 0.02977098, 3.295214, 0, 0.7372549, 1, 1,
0.1742608, 0.4245547, 0.07996698, 0, 0.7294118, 1, 1,
0.175349, 2.287309, -0.464097, 0, 0.7254902, 1, 1,
0.1783095, -0.3230494, 0.9227347, 0, 0.7176471, 1, 1,
0.1811885, 1.864446, 0.2796607, 0, 0.7137255, 1, 1,
0.1812003, -0.8362669, 2.45227, 0, 0.7058824, 1, 1,
0.1891281, 0.1034751, 0.5144427, 0, 0.6980392, 1, 1,
0.189257, 0.4851864, -0.542779, 0, 0.6941177, 1, 1,
0.1897079, -0.7787298, 2.109408, 0, 0.6862745, 1, 1,
0.1947138, 0.2964415, 0.9241321, 0, 0.682353, 1, 1,
0.1967288, 1.323176, -1.253653, 0, 0.6745098, 1, 1,
0.1972424, 0.9531299, 1.156723, 0, 0.6705883, 1, 1,
0.2011923, 0.473808, -0.06782471, 0, 0.6627451, 1, 1,
0.2055357, 1.372677, 0.006993016, 0, 0.6588235, 1, 1,
0.2140829, -0.7796051, 2.006218, 0, 0.6509804, 1, 1,
0.2159875, -2.820842, 4.149337, 0, 0.6470588, 1, 1,
0.2186396, 0.03667676, 2.016817, 0, 0.6392157, 1, 1,
0.2199019, -0.1215605, 0.3422305, 0, 0.6352941, 1, 1,
0.2237479, 0.374959, 0.6841074, 0, 0.627451, 1, 1,
0.225485, 0.003347632, 1.954099, 0, 0.6235294, 1, 1,
0.2352997, -0.3058907, 2.696816, 0, 0.6156863, 1, 1,
0.2354881, 0.7360887, -0.3748564, 0, 0.6117647, 1, 1,
0.2365022, -0.9635734, 4.778009, 0, 0.6039216, 1, 1,
0.2397937, 0.1968216, 1.10881, 0, 0.5960785, 1, 1,
0.2433841, -0.08759237, 1.799179, 0, 0.5921569, 1, 1,
0.2440918, -0.9287201, 1.261144, 0, 0.5843138, 1, 1,
0.2490128, -1.24444, 3.523, 0, 0.5803922, 1, 1,
0.2527243, -1.392251, 2.474221, 0, 0.572549, 1, 1,
0.2529467, 0.9051938, 1.501957, 0, 0.5686275, 1, 1,
0.2577643, 1.277132, -0.8594254, 0, 0.5607843, 1, 1,
0.2577937, -2.524932, 3.519961, 0, 0.5568628, 1, 1,
0.2604881, 1.013089, 0.759986, 0, 0.5490196, 1, 1,
0.2611173, 1.863995, 1.1303, 0, 0.5450981, 1, 1,
0.2614874, -0.5625358, 4.694032, 0, 0.5372549, 1, 1,
0.2670572, 0.1920163, 3.272015, 0, 0.5333334, 1, 1,
0.2720297, -1.526577, 2.503522, 0, 0.5254902, 1, 1,
0.2773516, 0.572471, 0.5546975, 0, 0.5215687, 1, 1,
0.2787025, -1.824003, 3.080128, 0, 0.5137255, 1, 1,
0.284578, -1.156709, 3.670125, 0, 0.509804, 1, 1,
0.2854456, 0.5939332, 0.1821436, 0, 0.5019608, 1, 1,
0.2868569, -0.4277376, 1.96891, 0, 0.4941176, 1, 1,
0.2883512, -0.6791306, 1.445608, 0, 0.4901961, 1, 1,
0.2884811, -0.8783888, 2.43227, 0, 0.4823529, 1, 1,
0.2899373, 1.113663, 0.4252085, 0, 0.4784314, 1, 1,
0.2923305, -1.558474, 4.216039, 0, 0.4705882, 1, 1,
0.3012171, -1.163594, 1.615836, 0, 0.4666667, 1, 1,
0.3019006, -0.2710765, 1.963762, 0, 0.4588235, 1, 1,
0.3046779, 0.06980992, 0.2097872, 0, 0.454902, 1, 1,
0.3090698, 1.832469, 0.439063, 0, 0.4470588, 1, 1,
0.3102402, 0.4436015, -0.5558414, 0, 0.4431373, 1, 1,
0.3107893, -1.603076, 1.839698, 0, 0.4352941, 1, 1,
0.3133861, 1.200727, -0.6986833, 0, 0.4313726, 1, 1,
0.3165991, 1.755211, 0.8299739, 0, 0.4235294, 1, 1,
0.3180486, 1.291634, -0.2994891, 0, 0.4196078, 1, 1,
0.3182023, 0.3850361, 1.278731, 0, 0.4117647, 1, 1,
0.3195953, -0.06581493, 2.207733, 0, 0.4078431, 1, 1,
0.3217549, 1.01605, 0.7393685, 0, 0.4, 1, 1,
0.3217762, 1.522786, 1.568186, 0, 0.3921569, 1, 1,
0.3218665, 0.4878041, 1.566944, 0, 0.3882353, 1, 1,
0.3239037, 1.508351, 0.07567563, 0, 0.3803922, 1, 1,
0.32967, 0.6107683, -1.646689, 0, 0.3764706, 1, 1,
0.3331624, -0.4436169, 1.77515, 0, 0.3686275, 1, 1,
0.3335778, 0.6729492, -0.1157577, 0, 0.3647059, 1, 1,
0.3342621, -1.745529, 1.925766, 0, 0.3568628, 1, 1,
0.3405353, 1.459393, -0.5115508, 0, 0.3529412, 1, 1,
0.3424373, -1.019989, 2.388611, 0, 0.345098, 1, 1,
0.3441107, 0.8472556, 1.691922, 0, 0.3411765, 1, 1,
0.3456222, -0.7443433, 3.112778, 0, 0.3333333, 1, 1,
0.3469058, -0.4648249, 2.826499, 0, 0.3294118, 1, 1,
0.3470713, -1.748061, 3.088632, 0, 0.3215686, 1, 1,
0.3490435, -1.359827, 4.186878, 0, 0.3176471, 1, 1,
0.3508214, -0.1061032, 2.231613, 0, 0.3098039, 1, 1,
0.3579513, 0.1863331, 0.7460666, 0, 0.3058824, 1, 1,
0.3580162, -0.3612894, 1.803421, 0, 0.2980392, 1, 1,
0.3702679, -1.481862, 4.741575, 0, 0.2901961, 1, 1,
0.371193, -1.858238, 3.11247, 0, 0.2862745, 1, 1,
0.3713086, 0.6147917, 0.02165704, 0, 0.2784314, 1, 1,
0.3739537, -0.07779837, 2.177873, 0, 0.2745098, 1, 1,
0.3758683, 1.178018, 1.986464, 0, 0.2666667, 1, 1,
0.3761623, 2.609321, 1.104821, 0, 0.2627451, 1, 1,
0.3839292, -0.7494971, 1.246571, 0, 0.254902, 1, 1,
0.3842793, 0.8135129, -0.5276836, 0, 0.2509804, 1, 1,
0.3908656, -0.4295066, 3.29823, 0, 0.2431373, 1, 1,
0.3912292, 0.6435986, 0.4080928, 0, 0.2392157, 1, 1,
0.3969974, -0.7898526, 2.177951, 0, 0.2313726, 1, 1,
0.4101853, 1.614185, 0.9277802, 0, 0.227451, 1, 1,
0.4115959, 1.867729, -1.871369, 0, 0.2196078, 1, 1,
0.4133624, -0.5198768, 0.08905706, 0, 0.2156863, 1, 1,
0.4139845, -0.2400854, 2.627543, 0, 0.2078431, 1, 1,
0.4142544, 1.859487, -0.037896, 0, 0.2039216, 1, 1,
0.4144938, -0.2795079, 2.120915, 0, 0.1960784, 1, 1,
0.423573, -0.6586949, 2.307633, 0, 0.1882353, 1, 1,
0.4239604, 1.155204, 1.164946, 0, 0.1843137, 1, 1,
0.424617, 2.943653, 2.114187, 0, 0.1764706, 1, 1,
0.4264834, -0.1515947, 0.9783654, 0, 0.172549, 1, 1,
0.4299907, 0.3785434, 1.980242, 0, 0.1647059, 1, 1,
0.4320043, 2.940831, 0.07327856, 0, 0.1607843, 1, 1,
0.4320413, -0.9997387, 5.655354, 0, 0.1529412, 1, 1,
0.4338426, -0.7687872, 3.315062, 0, 0.1490196, 1, 1,
0.4356368, -1.268821, 3.004949, 0, 0.1411765, 1, 1,
0.4376497, 1.12347, 0.8065699, 0, 0.1372549, 1, 1,
0.4388973, 0.08319479, 3.744139, 0, 0.1294118, 1, 1,
0.4413984, -1.727958, 2.259942, 0, 0.1254902, 1, 1,
0.4424284, 0.9563028, 1.932219, 0, 0.1176471, 1, 1,
0.4438543, -1.287073, 2.644351, 0, 0.1137255, 1, 1,
0.4516864, 1.665773, 0.6490224, 0, 0.1058824, 1, 1,
0.451755, -1.184922, 3.411988, 0, 0.09803922, 1, 1,
0.4525484, -0.9125064, 3.056882, 0, 0.09411765, 1, 1,
0.4597544, 0.1209989, -0.1507672, 0, 0.08627451, 1, 1,
0.4631971, -0.6381431, 2.241383, 0, 0.08235294, 1, 1,
0.4705908, -1.111943, 3.752039, 0, 0.07450981, 1, 1,
0.473709, -0.2700646, 1.824575, 0, 0.07058824, 1, 1,
0.47584, 0.2446243, -0.45712, 0, 0.0627451, 1, 1,
0.4776512, 0.1606638, 1.248914, 0, 0.05882353, 1, 1,
0.4784958, 0.4431024, 0.3060619, 0, 0.05098039, 1, 1,
0.4790023, 0.7618611, 1.509067, 0, 0.04705882, 1, 1,
0.4796031, -1.712148, 2.012408, 0, 0.03921569, 1, 1,
0.4820844, -1.180635, 2.53715, 0, 0.03529412, 1, 1,
0.4862469, 0.3683698, 0.6488421, 0, 0.02745098, 1, 1,
0.491516, 1.669549, 1.893448, 0, 0.02352941, 1, 1,
0.493582, -1.001284, 4.51314, 0, 0.01568628, 1, 1,
0.4981785, -0.7212839, 1.816561, 0, 0.01176471, 1, 1,
0.4990745, -0.6404902, 1.421894, 0, 0.003921569, 1, 1,
0.4992622, 0.2034595, 2.068297, 0.003921569, 0, 1, 1,
0.4995531, 0.8401931, -0.04078066, 0.007843138, 0, 1, 1,
0.5072331, 1.187113, -0.2897187, 0.01568628, 0, 1, 1,
0.5102686, 0.7909747, 0.5890937, 0.01960784, 0, 1, 1,
0.5112112, -0.9366127, 2.887674, 0.02745098, 0, 1, 1,
0.518695, 0.5557852, 2.143227, 0.03137255, 0, 1, 1,
0.519612, 0.06502061, 2.036728, 0.03921569, 0, 1, 1,
0.5264865, 0.4571787, 0.1574011, 0.04313726, 0, 1, 1,
0.5269826, 0.3273951, 1.06894, 0.05098039, 0, 1, 1,
0.5283292, 0.5591708, 0.4874159, 0.05490196, 0, 1, 1,
0.530678, -2.268274, 2.245335, 0.0627451, 0, 1, 1,
0.5345042, -1.896251, 2.455815, 0.06666667, 0, 1, 1,
0.540992, -0.2422609, 1.853957, 0.07450981, 0, 1, 1,
0.5436437, -0.2131976, 2.262653, 0.07843138, 0, 1, 1,
0.5439106, -1.918801, 4.251876, 0.08627451, 0, 1, 1,
0.5492878, -0.5964276, 0.2489392, 0.09019608, 0, 1, 1,
0.5538996, 1.790058, 1.062436, 0.09803922, 0, 1, 1,
0.5539454, -0.3000544, 1.972944, 0.1058824, 0, 1, 1,
0.5542881, -2.732855, 3.859882, 0.1098039, 0, 1, 1,
0.554754, 0.02022658, 2.028776, 0.1176471, 0, 1, 1,
0.557059, -0.8277139, 1.791108, 0.1215686, 0, 1, 1,
0.557729, -0.1020214, 3.10331, 0.1294118, 0, 1, 1,
0.5582953, 0.4927659, 0.5039615, 0.1333333, 0, 1, 1,
0.558853, 0.8357196, 1.337861, 0.1411765, 0, 1, 1,
0.5597561, -0.02804415, 2.813489, 0.145098, 0, 1, 1,
0.5652081, -0.6695645, 3.295037, 0.1529412, 0, 1, 1,
0.5711167, 0.3322405, 1.081799, 0.1568628, 0, 1, 1,
0.5731902, 0.8075277, 1.939577, 0.1647059, 0, 1, 1,
0.5750913, -0.5527016, 2.282728, 0.1686275, 0, 1, 1,
0.5764918, 1.064806, -1.310131, 0.1764706, 0, 1, 1,
0.5767271, 0.5618557, 0.8819724, 0.1803922, 0, 1, 1,
0.5771594, 0.4768651, -0.5957926, 0.1882353, 0, 1, 1,
0.580077, 1.451008, 0.1040525, 0.1921569, 0, 1, 1,
0.5820143, -1.271789, 2.507994, 0.2, 0, 1, 1,
0.5828633, -1.837771, 4.41784, 0.2078431, 0, 1, 1,
0.5882273, 0.09335268, 1.548281, 0.2117647, 0, 1, 1,
0.5895029, -1.251434, 3.162883, 0.2196078, 0, 1, 1,
0.5925202, -0.4253029, 2.555683, 0.2235294, 0, 1, 1,
0.5927426, 0.09159766, -1.105332, 0.2313726, 0, 1, 1,
0.6036202, 1.829742, -0.5768386, 0.2352941, 0, 1, 1,
0.6073534, -0.2156174, 3.428632, 0.2431373, 0, 1, 1,
0.6082724, 0.2443611, 4.156608, 0.2470588, 0, 1, 1,
0.6157626, -0.210067, 1.984817, 0.254902, 0, 1, 1,
0.6170043, -0.5899464, 1.772236, 0.2588235, 0, 1, 1,
0.6178979, 0.08423255, 1.817958, 0.2666667, 0, 1, 1,
0.6184552, 0.274878, 0.6900813, 0.2705882, 0, 1, 1,
0.6211137, 0.8878203, 2.180167, 0.2784314, 0, 1, 1,
0.6230679, 2.515247, -1.192469, 0.282353, 0, 1, 1,
0.6311616, 0.5480586, 1.243751, 0.2901961, 0, 1, 1,
0.6369765, 0.8420991, 1.041518, 0.2941177, 0, 1, 1,
0.6396222, 1.263685, 0.4094663, 0.3019608, 0, 1, 1,
0.6432376, 1.319358, 0.2324579, 0.3098039, 0, 1, 1,
0.6437112, 0.8019229, 0.3068568, 0.3137255, 0, 1, 1,
0.6444736, -1.832242, 3.502186, 0.3215686, 0, 1, 1,
0.6465094, -1.304962, 1.893957, 0.3254902, 0, 1, 1,
0.6506988, -0.5004784, 1.458098, 0.3333333, 0, 1, 1,
0.6513203, -0.1270383, 2.669037, 0.3372549, 0, 1, 1,
0.6542185, 0.9737805, 3.360357, 0.345098, 0, 1, 1,
0.657076, 2.352676, 0.2142399, 0.3490196, 0, 1, 1,
0.6590227, 0.1011679, 0.2102843, 0.3568628, 0, 1, 1,
0.6623263, 0.1217507, 2.102159, 0.3607843, 0, 1, 1,
0.6677321, 0.2377084, 2.528722, 0.3686275, 0, 1, 1,
0.6678823, -0.1106715, 0.01602171, 0.372549, 0, 1, 1,
0.6707592, -0.3364006, 2.263988, 0.3803922, 0, 1, 1,
0.6719927, 1.590404, -1.000585, 0.3843137, 0, 1, 1,
0.6808847, -1.681141, 2.524513, 0.3921569, 0, 1, 1,
0.6814539, -0.1716469, 1.637091, 0.3960784, 0, 1, 1,
0.6824428, 1.099962, -0.9459487, 0.4039216, 0, 1, 1,
0.683679, -0.4117089, 4.251985, 0.4117647, 0, 1, 1,
0.6849249, 0.6618229, 0.9472852, 0.4156863, 0, 1, 1,
0.6871383, -0.9666414, 3.436794, 0.4235294, 0, 1, 1,
0.6872588, 0.1629954, 0.83566, 0.427451, 0, 1, 1,
0.6885632, 0.4430937, 1.620925, 0.4352941, 0, 1, 1,
0.6887733, 0.7219901, 0.0296706, 0.4392157, 0, 1, 1,
0.6893461, 0.9104728, 0.3870266, 0.4470588, 0, 1, 1,
0.6898919, -0.593087, 1.784142, 0.4509804, 0, 1, 1,
0.6918049, 0.3281987, 0.4196158, 0.4588235, 0, 1, 1,
0.6925812, 0.7448894, 0.6391234, 0.4627451, 0, 1, 1,
0.6969622, 0.04047173, 2.431916, 0.4705882, 0, 1, 1,
0.6988001, 0.2877526, 1.043097, 0.4745098, 0, 1, 1,
0.7046196, -0.09224274, -0.1199781, 0.4823529, 0, 1, 1,
0.7071466, 0.8258629, 0.9014729, 0.4862745, 0, 1, 1,
0.7088364, 0.7978808, 2.048886, 0.4941176, 0, 1, 1,
0.7130459, -0.7438963, 1.113277, 0.5019608, 0, 1, 1,
0.7146478, -1.692294, 2.904187, 0.5058824, 0, 1, 1,
0.7193543, -0.1081517, 2.805418, 0.5137255, 0, 1, 1,
0.7221177, -2.185952, 2.73439, 0.5176471, 0, 1, 1,
0.7222141, -0.1008682, 1.503464, 0.5254902, 0, 1, 1,
0.7271077, -1.167319, 1.104017, 0.5294118, 0, 1, 1,
0.729153, -0.6482632, 2.968643, 0.5372549, 0, 1, 1,
0.7292252, -0.6813029, 3.983691, 0.5411765, 0, 1, 1,
0.7294163, -0.4433125, 1.941905, 0.5490196, 0, 1, 1,
0.7306605, 0.8843936, 2.919468, 0.5529412, 0, 1, 1,
0.7324354, -1.347404, 3.31133, 0.5607843, 0, 1, 1,
0.7332087, 0.7366872, 1.041825, 0.5647059, 0, 1, 1,
0.7382377, 0.1154537, 0.1574852, 0.572549, 0, 1, 1,
0.7440523, 0.1024609, 2.103249, 0.5764706, 0, 1, 1,
0.7447144, -0.9126871, 1.552944, 0.5843138, 0, 1, 1,
0.7450394, 0.9923736, 0.574586, 0.5882353, 0, 1, 1,
0.7560337, 0.2125382, 1.895514, 0.5960785, 0, 1, 1,
0.757769, 0.6719779, -0.7458481, 0.6039216, 0, 1, 1,
0.7583826, 0.5612979, -1.879996, 0.6078432, 0, 1, 1,
0.7602746, -1.8855, 1.356132, 0.6156863, 0, 1, 1,
0.762953, 0.6354488, -0.4718333, 0.6196079, 0, 1, 1,
0.7629848, 0.3635425, 1.738449, 0.627451, 0, 1, 1,
0.7634627, 2.926705, 1.332184, 0.6313726, 0, 1, 1,
0.7640763, -0.4125349, 2.729316, 0.6392157, 0, 1, 1,
0.7703683, -0.5502456, 3.448614, 0.6431373, 0, 1, 1,
0.7713394, -0.4730941, 3.503968, 0.6509804, 0, 1, 1,
0.7727801, 0.5023537, 0.6826801, 0.654902, 0, 1, 1,
0.7794505, -1.597659, 1.320742, 0.6627451, 0, 1, 1,
0.7805673, 0.9263225, 0.4952896, 0.6666667, 0, 1, 1,
0.7872522, -1.271945, 3.514677, 0.6745098, 0, 1, 1,
0.7890158, 1.2463, 1.268565, 0.6784314, 0, 1, 1,
0.790116, 0.8622881, 0.2216107, 0.6862745, 0, 1, 1,
0.7913776, -0.5189295, 1.668849, 0.6901961, 0, 1, 1,
0.79259, -0.7231815, 4.145237, 0.6980392, 0, 1, 1,
0.8032203, 0.691461, 0.2868339, 0.7058824, 0, 1, 1,
0.8115612, -1.095226, 2.841446, 0.7098039, 0, 1, 1,
0.8150032, -0.877512, 2.709041, 0.7176471, 0, 1, 1,
0.8214184, -0.3093125, 1.843028, 0.7215686, 0, 1, 1,
0.8227311, 0.0431314, 2.662823, 0.7294118, 0, 1, 1,
0.8262985, 1.192356, 0.6640366, 0.7333333, 0, 1, 1,
0.8308702, 1.584605, 0.3951146, 0.7411765, 0, 1, 1,
0.8344937, 0.01300171, 2.610717, 0.7450981, 0, 1, 1,
0.8380381, -1.118778, 3.032502, 0.7529412, 0, 1, 1,
0.8392098, -0.1206492, 1.019281, 0.7568628, 0, 1, 1,
0.8429568, 0.1393806, 1.102803, 0.7647059, 0, 1, 1,
0.845062, 0.8303716, 0.4952771, 0.7686275, 0, 1, 1,
0.8452312, -1.390238, 1.61256, 0.7764706, 0, 1, 1,
0.8521602, 0.9762021, 0.5950799, 0.7803922, 0, 1, 1,
0.8558612, -1.781195, 2.836667, 0.7882353, 0, 1, 1,
0.856312, 0.02148518, 1.451534, 0.7921569, 0, 1, 1,
0.8577588, -0.7957114, 0.07377416, 0.8, 0, 1, 1,
0.863314, 0.3055079, 1.5289, 0.8078431, 0, 1, 1,
0.866612, 0.8198665, 1.5442, 0.8117647, 0, 1, 1,
0.8674093, 0.6548979, 0.2223731, 0.8196079, 0, 1, 1,
0.8793921, 0.3720455, -0.003763083, 0.8235294, 0, 1, 1,
0.8801036, 1.167309, 1.357331, 0.8313726, 0, 1, 1,
0.8820264, 0.5051335, 1.026483, 0.8352941, 0, 1, 1,
0.8856248, -0.5636511, 1.514978, 0.8431373, 0, 1, 1,
0.8889447, 1.809408, 0.01692333, 0.8470588, 0, 1, 1,
0.8901217, 1.516767, 0.8484242, 0.854902, 0, 1, 1,
0.89734, 0.5428426, 1.057835, 0.8588235, 0, 1, 1,
0.8991799, 0.3039682, 0.7611083, 0.8666667, 0, 1, 1,
0.8996078, 0.3503572, -0.1885609, 0.8705882, 0, 1, 1,
0.9015049, 0.6735372, 2.054529, 0.8784314, 0, 1, 1,
0.9022257, -0.8216052, 3.199629, 0.8823529, 0, 1, 1,
0.9023829, 1.377045, -0.08124933, 0.8901961, 0, 1, 1,
0.9041116, 1.48788, 2.116808, 0.8941177, 0, 1, 1,
0.9088016, -0.5065969, 1.514693, 0.9019608, 0, 1, 1,
0.9139213, 1.211576, 0.6801359, 0.9098039, 0, 1, 1,
0.9181548, -1.559975, 1.276318, 0.9137255, 0, 1, 1,
0.9271653, 0.3073414, 0.9317704, 0.9215686, 0, 1, 1,
0.928313, -1.622465, 2.696297, 0.9254902, 0, 1, 1,
0.9292597, 0.5158838, -0.8119919, 0.9333333, 0, 1, 1,
0.9312631, 0.4100619, 1.209008, 0.9372549, 0, 1, 1,
0.9346269, 1.741494, 0.7790387, 0.945098, 0, 1, 1,
0.9377484, -0.4846956, 2.094141, 0.9490196, 0, 1, 1,
0.9401834, 0.6980967, 2.348323, 0.9568627, 0, 1, 1,
0.9403909, 1.565711, 2.035049, 0.9607843, 0, 1, 1,
0.9479728, 0.3926159, 1.863179, 0.9686275, 0, 1, 1,
0.9497901, -0.2165471, 3.294605, 0.972549, 0, 1, 1,
0.9509128, 1.288093, 1.564085, 0.9803922, 0, 1, 1,
0.9552905, 1.350654, 0.3917311, 0.9843137, 0, 1, 1,
0.9698273, 0.9169226, 1.208609, 0.9921569, 0, 1, 1,
0.9741601, -0.08841775, 1.449744, 0.9960784, 0, 1, 1,
0.9810517, 0.3731271, 2.070941, 1, 0, 0.9960784, 1,
0.989645, 0.3132336, 1.266685, 1, 0, 0.9882353, 1,
0.9939475, -0.6751459, 2.440472, 1, 0, 0.9843137, 1,
0.99771, 0.3024837, 0.8812367, 1, 0, 0.9764706, 1,
0.9985802, 0.1851769, -0.8911088, 1, 0, 0.972549, 1,
1.000634, -0.7766886, 3.092134, 1, 0, 0.9647059, 1,
1.001964, -0.1637888, 0.8044835, 1, 0, 0.9607843, 1,
1.019795, -1.043224, 1.766693, 1, 0, 0.9529412, 1,
1.02387, 0.4349926, 1.536542, 1, 0, 0.9490196, 1,
1.024688, -1.137545, 2.598215, 1, 0, 0.9411765, 1,
1.025758, -0.9867558, 1.56953, 1, 0, 0.9372549, 1,
1.029709, -0.02562247, 1.317348, 1, 0, 0.9294118, 1,
1.031272, -1.289072, 2.179935, 1, 0, 0.9254902, 1,
1.038903, 0.7326848, 2.757367, 1, 0, 0.9176471, 1,
1.039904, -1.241515, 1.3681, 1, 0, 0.9137255, 1,
1.042288, 0.2641304, 3.075613, 1, 0, 0.9058824, 1,
1.049781, -0.4970706, 2.333503, 1, 0, 0.9019608, 1,
1.052653, -0.7538833, 1.671978, 1, 0, 0.8941177, 1,
1.055625, 1.651173, 1.207326, 1, 0, 0.8862745, 1,
1.05706, 0.9772975, 0.7546242, 1, 0, 0.8823529, 1,
1.059908, -2.657091, 2.454653, 1, 0, 0.8745098, 1,
1.069592, -0.6717257, 1.681132, 1, 0, 0.8705882, 1,
1.069654, -1.057773, 3.671062, 1, 0, 0.8627451, 1,
1.072802, 2.227526, -0.09565971, 1, 0, 0.8588235, 1,
1.073691, 0.4743922, 2.005523, 1, 0, 0.8509804, 1,
1.074649, -1.399087, 2.848701, 1, 0, 0.8470588, 1,
1.07514, 1.156331, 2.884655, 1, 0, 0.8392157, 1,
1.077589, 2.063772, 0.1017167, 1, 0, 0.8352941, 1,
1.081079, -1.553794, 2.101841, 1, 0, 0.827451, 1,
1.086493, -0.4865173, 2.125265, 1, 0, 0.8235294, 1,
1.086572, -0.2648135, 2.769217, 1, 0, 0.8156863, 1,
1.090548, 1.143495, 0.213663, 1, 0, 0.8117647, 1,
1.101744, -0.5303643, 2.832231, 1, 0, 0.8039216, 1,
1.102152, 0.62712, 1.853713, 1, 0, 0.7960784, 1,
1.106503, 1.619888, 0.5900155, 1, 0, 0.7921569, 1,
1.111299, -0.4422897, 1.080465, 1, 0, 0.7843137, 1,
1.126101, 0.9613227, 1.896693, 1, 0, 0.7803922, 1,
1.132645, 0.9941288, 1.219789, 1, 0, 0.772549, 1,
1.13495, -1.383442, 2.293425, 1, 0, 0.7686275, 1,
1.139586, -1.215833, 2.491659, 1, 0, 0.7607843, 1,
1.140248, -1.534666, 1.988143, 1, 0, 0.7568628, 1,
1.143942, -1.509229, 2.056125, 1, 0, 0.7490196, 1,
1.146785, 1.196882, -0.415093, 1, 0, 0.7450981, 1,
1.148878, -1.948524, 3.245876, 1, 0, 0.7372549, 1,
1.149727, 0.7459815, -0.1601364, 1, 0, 0.7333333, 1,
1.157208, -0.1157562, 2.846657, 1, 0, 0.7254902, 1,
1.158149, -1.284653, 2.565666, 1, 0, 0.7215686, 1,
1.180802, -0.2869551, 3.237418, 1, 0, 0.7137255, 1,
1.188625, 0.1833996, 1.428068, 1, 0, 0.7098039, 1,
1.200488, -1.449705, 2.881375, 1, 0, 0.7019608, 1,
1.204863, 0.2505153, 1.740406, 1, 0, 0.6941177, 1,
1.20691, 1.017933, 0.1460519, 1, 0, 0.6901961, 1,
1.215243, -1.004173, 2.248975, 1, 0, 0.682353, 1,
1.227696, -0.0887439, 3.624017, 1, 0, 0.6784314, 1,
1.228803, -1.024558, 1.881285, 1, 0, 0.6705883, 1,
1.230257, 0.3096021, 0.2575608, 1, 0, 0.6666667, 1,
1.232617, -0.1426939, 2.077694, 1, 0, 0.6588235, 1,
1.241871, -0.4703633, 0.7361863, 1, 0, 0.654902, 1,
1.243256, -1.606009, 2.65397, 1, 0, 0.6470588, 1,
1.244134, -0.6247094, 1.734749, 1, 0, 0.6431373, 1,
1.250085, -0.1063984, 3.086411, 1, 0, 0.6352941, 1,
1.253059, 0.7980822, 1.985814, 1, 0, 0.6313726, 1,
1.261918, 0.4184321, 2.169704, 1, 0, 0.6235294, 1,
1.261923, 0.5500052, 0.1333345, 1, 0, 0.6196079, 1,
1.268286, -0.8916231, 2.107846, 1, 0, 0.6117647, 1,
1.277531, -0.05057316, 0.4420179, 1, 0, 0.6078432, 1,
1.284704, 0.4347534, 1.219378, 1, 0, 0.6, 1,
1.299057, 1.104002, 0.801459, 1, 0, 0.5921569, 1,
1.300173, -1.383036, 2.835745, 1, 0, 0.5882353, 1,
1.301367, -1.026224, 2.868152, 1, 0, 0.5803922, 1,
1.303695, 0.5686296, 1.276152, 1, 0, 0.5764706, 1,
1.309009, -0.6037291, 2.312371, 1, 0, 0.5686275, 1,
1.309561, 0.3674895, 0.3538947, 1, 0, 0.5647059, 1,
1.311267, -1.406346, 2.242172, 1, 0, 0.5568628, 1,
1.312236, -1.248321, 2.415956, 1, 0, 0.5529412, 1,
1.314947, 1.444784, 0.05139461, 1, 0, 0.5450981, 1,
1.315809, 1.212713, 1.657653, 1, 0, 0.5411765, 1,
1.321607, -0.5708532, 1.905663, 1, 0, 0.5333334, 1,
1.324029, 1.174435, 0.1612861, 1, 0, 0.5294118, 1,
1.328267, 1.467244, 0.2944855, 1, 0, 0.5215687, 1,
1.360366, -0.1620925, 0.3056335, 1, 0, 0.5176471, 1,
1.361347, -2.06266, 0.4953473, 1, 0, 0.509804, 1,
1.361441, -1.455786, 3.53702, 1, 0, 0.5058824, 1,
1.361449, -1.664343, 2.507382, 1, 0, 0.4980392, 1,
1.363739, 0.2115373, 0.789469, 1, 0, 0.4901961, 1,
1.370616, 0.438414, -0.07938717, 1, 0, 0.4862745, 1,
1.370909, -1.250693, 1.870333, 1, 0, 0.4784314, 1,
1.372891, -0.4359946, 1.342272, 1, 0, 0.4745098, 1,
1.39949, -0.3201116, 1.55354, 1, 0, 0.4666667, 1,
1.401459, 0.3260638, 0.3232174, 1, 0, 0.4627451, 1,
1.414748, 1.071243, 1.388099, 1, 0, 0.454902, 1,
1.43154, -0.3142788, 2.712092, 1, 0, 0.4509804, 1,
1.438129, -0.8897683, 1.448715, 1, 0, 0.4431373, 1,
1.4512, -0.2106685, 1.357767, 1, 0, 0.4392157, 1,
1.473119, -0.04929973, 2.081153, 1, 0, 0.4313726, 1,
1.481314, -2.555593, 3.496786, 1, 0, 0.427451, 1,
1.491629, 0.2445354, 0.725713, 1, 0, 0.4196078, 1,
1.50871, 0.6922323, 2.729548, 1, 0, 0.4156863, 1,
1.516179, 1.359648, 0.1744198, 1, 0, 0.4078431, 1,
1.5206, 1.596452, 2.296762, 1, 0, 0.4039216, 1,
1.52144, 1.304699, -0.3211742, 1, 0, 0.3960784, 1,
1.541655, -0.2488324, -0.6306044, 1, 0, 0.3882353, 1,
1.541943, 0.7757064, 2.309984, 1, 0, 0.3843137, 1,
1.555214, -0.0758817, 1.565292, 1, 0, 0.3764706, 1,
1.560747, 0.244482, 2.031353, 1, 0, 0.372549, 1,
1.56806, 0.9648771, 0.9682612, 1, 0, 0.3647059, 1,
1.569319, 0.7262679, 1.652178, 1, 0, 0.3607843, 1,
1.579068, 0.5042889, 1.562123, 1, 0, 0.3529412, 1,
1.579358, -1.46006, 1.414951, 1, 0, 0.3490196, 1,
1.590425, -0.399122, 1.301429, 1, 0, 0.3411765, 1,
1.601744, -1.195461, -0.1103175, 1, 0, 0.3372549, 1,
1.602137, 0.5237765, 1.402335, 1, 0, 0.3294118, 1,
1.603055, -0.1696676, 0.9139274, 1, 0, 0.3254902, 1,
1.603744, 1.169134, -1.052376, 1, 0, 0.3176471, 1,
1.614596, 0.7864119, 1.612011, 1, 0, 0.3137255, 1,
1.621148, -0.3640611, -0.2402435, 1, 0, 0.3058824, 1,
1.627791, 1.041964, -0.4054778, 1, 0, 0.2980392, 1,
1.631141, 0.9066963, 2.220224, 1, 0, 0.2941177, 1,
1.642338, -1.41488, 2.035197, 1, 0, 0.2862745, 1,
1.65188, -2.731157, 2.227863, 1, 0, 0.282353, 1,
1.657019, 0.1494762, 2.105777, 1, 0, 0.2745098, 1,
1.661745, 0.3371583, 1.813008, 1, 0, 0.2705882, 1,
1.665846, -0.07328036, 0.08246577, 1, 0, 0.2627451, 1,
1.667492, -0.3901123, 3.99368, 1, 0, 0.2588235, 1,
1.671263, -0.2140379, 2.605293, 1, 0, 0.2509804, 1,
1.677227, -0.2639448, 1.195981, 1, 0, 0.2470588, 1,
1.69013, -0.4838171, 1.427661, 1, 0, 0.2392157, 1,
1.701775, -0.3531508, 0.7575407, 1, 0, 0.2352941, 1,
1.704467, -2.547441, 4.245538, 1, 0, 0.227451, 1,
1.704978, -0.9068093, 1.69433, 1, 0, 0.2235294, 1,
1.714262, 0.3313349, 2.400913, 1, 0, 0.2156863, 1,
1.764815, 1.163939, 1.041607, 1, 0, 0.2117647, 1,
1.76684, -0.9268284, 4.088403, 1, 0, 0.2039216, 1,
1.775048, 0.1184841, 0.4977238, 1, 0, 0.1960784, 1,
1.77976, 0.7382817, 0.630986, 1, 0, 0.1921569, 1,
1.789057, 0.2646695, 0.4595195, 1, 0, 0.1843137, 1,
1.812083, -1.734607, 1.838817, 1, 0, 0.1803922, 1,
1.848112, 0.1038344, 1.731592, 1, 0, 0.172549, 1,
1.866213, -1.58346, 2.480412, 1, 0, 0.1686275, 1,
1.868969, -1.075364, 2.239456, 1, 0, 0.1607843, 1,
1.871428, 0.8721941, -1.585615, 1, 0, 0.1568628, 1,
1.87851, -0.7308505, 1.784773, 1, 0, 0.1490196, 1,
1.89518, -1.783659, 1.403541, 1, 0, 0.145098, 1,
1.931115, -0.001364752, 1.882333, 1, 0, 0.1372549, 1,
1.935103, -1.035267, 1.274409, 1, 0, 0.1333333, 1,
1.953567, 0.8593073, 3.571504, 1, 0, 0.1254902, 1,
1.962876, -0.4675526, 2.789908, 1, 0, 0.1215686, 1,
1.978427, -1.114515, 1.405661, 1, 0, 0.1137255, 1,
1.992673, -0.736701, 2.322281, 1, 0, 0.1098039, 1,
2.006403, 1.153529, 1.742034, 1, 0, 0.1019608, 1,
2.038005, 0.1208894, 0.142416, 1, 0, 0.09411765, 1,
2.145566, 0.7476316, 1.217837, 1, 0, 0.09019608, 1,
2.183067, 1.502401, -0.2397244, 1, 0, 0.08235294, 1,
2.215293, -0.09751007, 1.857316, 1, 0, 0.07843138, 1,
2.234214, -0.8527021, 1.735407, 1, 0, 0.07058824, 1,
2.239581, 0.04849154, 1.265709, 1, 0, 0.06666667, 1,
2.261013, 0.9225501, 1.217769, 1, 0, 0.05882353, 1,
2.294135, 0.3128122, 1.115818, 1, 0, 0.05490196, 1,
2.322636, -1.066681, 2.150358, 1, 0, 0.04705882, 1,
2.403771, -1.07294, 1.129105, 1, 0, 0.04313726, 1,
2.440658, -0.4617334, 1.417224, 1, 0, 0.03529412, 1,
2.570022, 0.5561724, 1.956132, 1, 0, 0.03137255, 1,
2.624409, 0.6354377, 0.724591, 1, 0, 0.02352941, 1,
2.759696, -0.07317901, 2.964666, 1, 0, 0.01960784, 1,
2.949369, 0.171419, 1.998442, 1, 0, 0.01176471, 1,
3.298317, 0.8851908, 3.076177, 1, 0, 0.007843138, 1
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
0.09443212, -4.532291, -6.717631, 0, -0.5, 0.5, 0.5,
0.09443212, -4.532291, -6.717631, 1, -0.5, 0.5, 0.5,
0.09443212, -4.532291, -6.717631, 1, 1.5, 0.5, 0.5,
0.09443212, -4.532291, -6.717631, 0, 1.5, 0.5, 0.5
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
-4.19557, 0.3259621, -6.717631, 0, -0.5, 0.5, 0.5,
-4.19557, 0.3259621, -6.717631, 1, -0.5, 0.5, 0.5,
-4.19557, 0.3259621, -6.717631, 1, 1.5, 0.5, 0.5,
-4.19557, 0.3259621, -6.717631, 0, 1.5, 0.5, 0.5
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
-4.19557, -4.532291, 0.3654928, 0, -0.5, 0.5, 0.5,
-4.19557, -4.532291, 0.3654928, 1, -0.5, 0.5, 0.5,
-4.19557, -4.532291, 0.3654928, 1, 1.5, 0.5, 0.5,
-4.19557, -4.532291, 0.3654928, 0, 1.5, 0.5, 0.5
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
-3, -3.411156, -5.083064,
3, -3.411156, -5.083064,
-3, -3.411156, -5.083064,
-3, -3.598012, -5.355492,
-2, -3.411156, -5.083064,
-2, -3.598012, -5.355492,
-1, -3.411156, -5.083064,
-1, -3.598012, -5.355492,
0, -3.411156, -5.083064,
0, -3.598012, -5.355492,
1, -3.411156, -5.083064,
1, -3.598012, -5.355492,
2, -3.411156, -5.083064,
2, -3.598012, -5.355492,
3, -3.411156, -5.083064,
3, -3.598012, -5.355492
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
-3, -3.971724, -5.900348, 0, -0.5, 0.5, 0.5,
-3, -3.971724, -5.900348, 1, -0.5, 0.5, 0.5,
-3, -3.971724, -5.900348, 1, 1.5, 0.5, 0.5,
-3, -3.971724, -5.900348, 0, 1.5, 0.5, 0.5,
-2, -3.971724, -5.900348, 0, -0.5, 0.5, 0.5,
-2, -3.971724, -5.900348, 1, -0.5, 0.5, 0.5,
-2, -3.971724, -5.900348, 1, 1.5, 0.5, 0.5,
-2, -3.971724, -5.900348, 0, 1.5, 0.5, 0.5,
-1, -3.971724, -5.900348, 0, -0.5, 0.5, 0.5,
-1, -3.971724, -5.900348, 1, -0.5, 0.5, 0.5,
-1, -3.971724, -5.900348, 1, 1.5, 0.5, 0.5,
-1, -3.971724, -5.900348, 0, 1.5, 0.5, 0.5,
0, -3.971724, -5.900348, 0, -0.5, 0.5, 0.5,
0, -3.971724, -5.900348, 1, -0.5, 0.5, 0.5,
0, -3.971724, -5.900348, 1, 1.5, 0.5, 0.5,
0, -3.971724, -5.900348, 0, 1.5, 0.5, 0.5,
1, -3.971724, -5.900348, 0, -0.5, 0.5, 0.5,
1, -3.971724, -5.900348, 1, -0.5, 0.5, 0.5,
1, -3.971724, -5.900348, 1, 1.5, 0.5, 0.5,
1, -3.971724, -5.900348, 0, 1.5, 0.5, 0.5,
2, -3.971724, -5.900348, 0, -0.5, 0.5, 0.5,
2, -3.971724, -5.900348, 1, -0.5, 0.5, 0.5,
2, -3.971724, -5.900348, 1, 1.5, 0.5, 0.5,
2, -3.971724, -5.900348, 0, 1.5, 0.5, 0.5,
3, -3.971724, -5.900348, 0, -0.5, 0.5, 0.5,
3, -3.971724, -5.900348, 1, -0.5, 0.5, 0.5,
3, -3.971724, -5.900348, 1, 1.5, 0.5, 0.5,
3, -3.971724, -5.900348, 0, 1.5, 0.5, 0.5
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
-3.20557, -2, -5.083064,
-3.20557, 2, -5.083064,
-3.20557, -2, -5.083064,
-3.37057, -2, -5.355492,
-3.20557, 0, -5.083064,
-3.37057, 0, -5.355492,
-3.20557, 2, -5.083064,
-3.37057, 2, -5.355492
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
-3.70057, -2, -5.900348, 0, -0.5, 0.5, 0.5,
-3.70057, -2, -5.900348, 1, -0.5, 0.5, 0.5,
-3.70057, -2, -5.900348, 1, 1.5, 0.5, 0.5,
-3.70057, -2, -5.900348, 0, 1.5, 0.5, 0.5,
-3.70057, 0, -5.900348, 0, -0.5, 0.5, 0.5,
-3.70057, 0, -5.900348, 1, -0.5, 0.5, 0.5,
-3.70057, 0, -5.900348, 1, 1.5, 0.5, 0.5,
-3.70057, 0, -5.900348, 0, 1.5, 0.5, 0.5,
-3.70057, 2, -5.900348, 0, -0.5, 0.5, 0.5,
-3.70057, 2, -5.900348, 1, -0.5, 0.5, 0.5,
-3.70057, 2, -5.900348, 1, 1.5, 0.5, 0.5,
-3.70057, 2, -5.900348, 0, 1.5, 0.5, 0.5
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
-3.20557, -3.411156, -4,
-3.20557, -3.411156, 4,
-3.20557, -3.411156, -4,
-3.37057, -3.598012, -4,
-3.20557, -3.411156, -2,
-3.37057, -3.598012, -2,
-3.20557, -3.411156, 0,
-3.37057, -3.598012, 0,
-3.20557, -3.411156, 2,
-3.37057, -3.598012, 2,
-3.20557, -3.411156, 4,
-3.37057, -3.598012, 4
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
-3.70057, -3.971724, -4, 0, -0.5, 0.5, 0.5,
-3.70057, -3.971724, -4, 1, -0.5, 0.5, 0.5,
-3.70057, -3.971724, -4, 1, 1.5, 0.5, 0.5,
-3.70057, -3.971724, -4, 0, 1.5, 0.5, 0.5,
-3.70057, -3.971724, -2, 0, -0.5, 0.5, 0.5,
-3.70057, -3.971724, -2, 1, -0.5, 0.5, 0.5,
-3.70057, -3.971724, -2, 1, 1.5, 0.5, 0.5,
-3.70057, -3.971724, -2, 0, 1.5, 0.5, 0.5,
-3.70057, -3.971724, 0, 0, -0.5, 0.5, 0.5,
-3.70057, -3.971724, 0, 1, -0.5, 0.5, 0.5,
-3.70057, -3.971724, 0, 1, 1.5, 0.5, 0.5,
-3.70057, -3.971724, 0, 0, 1.5, 0.5, 0.5,
-3.70057, -3.971724, 2, 0, -0.5, 0.5, 0.5,
-3.70057, -3.971724, 2, 1, -0.5, 0.5, 0.5,
-3.70057, -3.971724, 2, 1, 1.5, 0.5, 0.5,
-3.70057, -3.971724, 2, 0, 1.5, 0.5, 0.5,
-3.70057, -3.971724, 4, 0, -0.5, 0.5, 0.5,
-3.70057, -3.971724, 4, 1, -0.5, 0.5, 0.5,
-3.70057, -3.971724, 4, 1, 1.5, 0.5, 0.5,
-3.70057, -3.971724, 4, 0, 1.5, 0.5, 0.5
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
-3.20557, -3.411156, -5.083064,
-3.20557, 4.06308, -5.083064,
-3.20557, -3.411156, 5.81405,
-3.20557, 4.06308, 5.81405,
-3.20557, -3.411156, -5.083064,
-3.20557, -3.411156, 5.81405,
-3.20557, 4.06308, -5.083064,
-3.20557, 4.06308, 5.81405,
-3.20557, -3.411156, -5.083064,
3.394434, -3.411156, -5.083064,
-3.20557, -3.411156, 5.81405,
3.394434, -3.411156, 5.81405,
-3.20557, 4.06308, -5.083064,
3.394434, 4.06308, -5.083064,
-3.20557, 4.06308, 5.81405,
3.394434, 4.06308, 5.81405,
3.394434, -3.411156, -5.083064,
3.394434, 4.06308, -5.083064,
3.394434, -3.411156, 5.81405,
3.394434, 4.06308, 5.81405,
3.394434, -3.411156, -5.083064,
3.394434, -3.411156, 5.81405,
3.394434, 4.06308, -5.083064,
3.394434, 4.06308, 5.81405
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
var radius = 7.887227;
var distance = 35.09116;
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
mvMatrix.translate( -0.09443212, -0.3259621, -0.3654928 );
mvMatrix.scale( 1.292094, 1.140963, 0.7825764 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.09116);
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
copper_carbonate<-read.table("copper_carbonate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-copper_carbonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_carbonate' not found
```

```r
y<-copper_carbonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_carbonate' not found
```

```r
z<-copper_carbonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_carbonate' not found
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
-3.109453, -3.256018, -0.8889756, 0, 0, 1, 1, 1,
-3.072212, 1.002879, -1.063838, 1, 0, 0, 1, 1,
-2.878317, 2.893773, -0.6171467, 1, 0, 0, 1, 1,
-2.712734, 1.493994, -1.61574, 1, 0, 0, 1, 1,
-2.622272, -0.8608559, -2.330517, 1, 0, 0, 1, 1,
-2.452856, -0.7769147, -0.6362084, 1, 0, 0, 1, 1,
-2.37739, 0.411646, -0.002878649, 0, 0, 0, 1, 1,
-2.35607, -0.8840336, -3.712857, 0, 0, 0, 1, 1,
-2.22009, 1.13039, 0.288193, 0, 0, 0, 1, 1,
-2.203685, 0.7203497, -1.46328, 0, 0, 0, 1, 1,
-2.20268, 0.385749, -0.9284479, 0, 0, 0, 1, 1,
-2.109875, -0.345737, -2.672104, 0, 0, 0, 1, 1,
-2.073646, 0.3488512, -0.09090761, 0, 0, 0, 1, 1,
-2.058199, 1.267344, -1.031303, 1, 1, 1, 1, 1,
-2.034577, -0.4645759, -1.299134, 1, 1, 1, 1, 1,
-2.025652, 1.25431, -0.1596386, 1, 1, 1, 1, 1,
-1.969414, -0.4398458, -1.988972, 1, 1, 1, 1, 1,
-1.962429, -0.7649698, -0.990483, 1, 1, 1, 1, 1,
-1.937515, 0.03709597, -1.015853, 1, 1, 1, 1, 1,
-1.91405, 1.277968, -1.39978, 1, 1, 1, 1, 1,
-1.908842, -0.5755981, -0.5625184, 1, 1, 1, 1, 1,
-1.903926, 0.6060619, -0.8054191, 1, 1, 1, 1, 1,
-1.886127, 0.3142659, -2.236707, 1, 1, 1, 1, 1,
-1.879069, -0.1361227, -0.5768508, 1, 1, 1, 1, 1,
-1.864764, 1.301614, -0.925169, 1, 1, 1, 1, 1,
-1.855012, -0.8083748, -0.9930559, 1, 1, 1, 1, 1,
-1.849818, -0.1437534, -1.24091, 1, 1, 1, 1, 1,
-1.829803, 0.5687525, -2.511906, 1, 1, 1, 1, 1,
-1.810768, -0.7536484, -2.276228, 0, 0, 1, 1, 1,
-1.80594, -0.34367, 0.7345588, 1, 0, 0, 1, 1,
-1.803343, -0.4412356, -1.994031, 1, 0, 0, 1, 1,
-1.792958, -0.7856519, -1.405006, 1, 0, 0, 1, 1,
-1.757186, -0.8215689, -1.578428, 1, 0, 0, 1, 1,
-1.752028, 0.7761667, -1.427527, 1, 0, 0, 1, 1,
-1.711555, 0.2634348, -3.063181, 0, 0, 0, 1, 1,
-1.699425, 0.2046666, -1.419134, 0, 0, 0, 1, 1,
-1.689522, 0.6411632, 1.63453, 0, 0, 0, 1, 1,
-1.675329, -1.716556, -1.113454, 0, 0, 0, 1, 1,
-1.655115, -0.3753173, -2.82438, 0, 0, 0, 1, 1,
-1.641824, -0.1426951, -1.494531, 0, 0, 0, 1, 1,
-1.638637, 0.9174346, -2.162677, 0, 0, 0, 1, 1,
-1.635887, -1.935976, -2.070602, 1, 1, 1, 1, 1,
-1.61025, -0.4130232, -1.759424, 1, 1, 1, 1, 1,
-1.597232, -1.081616, -2.300767, 1, 1, 1, 1, 1,
-1.593867, -1.652087, -3.057307, 1, 1, 1, 1, 1,
-1.592, -0.1848572, -3.269033, 1, 1, 1, 1, 1,
-1.588606, 1.011668, -2.054036, 1, 1, 1, 1, 1,
-1.55097, 0.1444782, -1.222875, 1, 1, 1, 1, 1,
-1.541475, -1.645741, -3.902352, 1, 1, 1, 1, 1,
-1.52621, 0.6143738, -1.155379, 1, 1, 1, 1, 1,
-1.520089, 0.4376943, -1.434344, 1, 1, 1, 1, 1,
-1.518074, -0.339065, -1.726597, 1, 1, 1, 1, 1,
-1.499605, -0.04176098, -0.6987475, 1, 1, 1, 1, 1,
-1.481835, 0.2924901, -1.48634, 1, 1, 1, 1, 1,
-1.48116, -1.018095, -2.658483, 1, 1, 1, 1, 1,
-1.478334, -0.5781821, -2.998146, 1, 1, 1, 1, 1,
-1.464991, -1.51388, -1.930502, 0, 0, 1, 1, 1,
-1.459183, -0.06166768, -1.342121, 1, 0, 0, 1, 1,
-1.457271, -0.8185193, -0.7993283, 1, 0, 0, 1, 1,
-1.451038, 1.087633, -2.214398, 1, 0, 0, 1, 1,
-1.443771, 1.419093, -1.057741, 1, 0, 0, 1, 1,
-1.441814, 0.1579003, -1.263709, 1, 0, 0, 1, 1,
-1.416699, 0.1999699, -1.736065, 0, 0, 0, 1, 1,
-1.410821, -1.145468, -3.623195, 0, 0, 0, 1, 1,
-1.408883, 0.2018932, -1.460423, 0, 0, 0, 1, 1,
-1.403404, 0.9404961, -1.894102, 0, 0, 0, 1, 1,
-1.382149, 0.1131666, -1.159749, 0, 0, 0, 1, 1,
-1.380922, 2.58892, -0.9506795, 0, 0, 0, 1, 1,
-1.372159, 0.2292933, -2.119574, 0, 0, 0, 1, 1,
-1.363232, 1.435863, -0.2637034, 1, 1, 1, 1, 1,
-1.343017, -0.4098547, -1.742035, 1, 1, 1, 1, 1,
-1.325355, 0.25435, -1.904624, 1, 1, 1, 1, 1,
-1.317819, -0.1071585, -2.805135, 1, 1, 1, 1, 1,
-1.29836, -0.6790957, -2.260865, 1, 1, 1, 1, 1,
-1.292808, 0.1339141, -1.203036, 1, 1, 1, 1, 1,
-1.289474, 0.7993819, -1.360221, 1, 1, 1, 1, 1,
-1.285921, -0.6400113, -4.178476, 1, 1, 1, 1, 1,
-1.277826, -0.2267877, -3.829667, 1, 1, 1, 1, 1,
-1.27663, -0.3859669, -0.5300814, 1, 1, 1, 1, 1,
-1.238079, -1.70085, -2.192665, 1, 1, 1, 1, 1,
-1.237809, -0.9848055, -2.83995, 1, 1, 1, 1, 1,
-1.230722, -0.420966, -1.713028, 1, 1, 1, 1, 1,
-1.226737, 0.1411971, -0.9485236, 1, 1, 1, 1, 1,
-1.226732, 2.065392, 2.263108, 1, 1, 1, 1, 1,
-1.223647, -1.477761, -1.774295, 0, 0, 1, 1, 1,
-1.207239, -0.3271829, -1.023126, 1, 0, 0, 1, 1,
-1.206781, -0.5537575, -1.795691, 1, 0, 0, 1, 1,
-1.201543, 1.755718, 0.3544306, 1, 0, 0, 1, 1,
-1.175615, 0.07469015, -1.607896, 1, 0, 0, 1, 1,
-1.172612, 0.3025213, 0.5003601, 1, 0, 0, 1, 1,
-1.163847, 1.092173, 0.2633216, 0, 0, 0, 1, 1,
-1.163706, -0.6779698, -0.3172954, 0, 0, 0, 1, 1,
-1.161556, 0.5913433, -0.4214172, 0, 0, 0, 1, 1,
-1.161055, -0.3182034, -2.578612, 0, 0, 0, 1, 1,
-1.15067, -1.206262, -1.770777, 0, 0, 0, 1, 1,
-1.148758, 0.9256467, -0.865049, 0, 0, 0, 1, 1,
-1.146409, 0.02493534, -0.422694, 0, 0, 0, 1, 1,
-1.146134, 0.5603659, -1.439819, 1, 1, 1, 1, 1,
-1.141885, 0.07021427, -1.131528, 1, 1, 1, 1, 1,
-1.136118, -0.5523806, -2.679567, 1, 1, 1, 1, 1,
-1.133339, 2.106322, -1.634344, 1, 1, 1, 1, 1,
-1.130327, -0.1463836, -2.800107, 1, 1, 1, 1, 1,
-1.117696, -0.1445272, -2.849268, 1, 1, 1, 1, 1,
-1.113324, -1.175335, -2.732772, 1, 1, 1, 1, 1,
-1.113181, 0.1880789, -1.835029, 1, 1, 1, 1, 1,
-1.107888, -0.625165, -2.782472, 1, 1, 1, 1, 1,
-1.104558, 1.294106, -0.07405788, 1, 1, 1, 1, 1,
-1.09992, 0.2904995, -0.4856416, 1, 1, 1, 1, 1,
-1.098798, -1.525957, -1.030546, 1, 1, 1, 1, 1,
-1.097912, -0.424332, -2.949666, 1, 1, 1, 1, 1,
-1.093023, 2.191057, -1.121791, 1, 1, 1, 1, 1,
-1.089602, -1.049191, -3.06611, 1, 1, 1, 1, 1,
-1.089256, -1.19737, -2.640348, 0, 0, 1, 1, 1,
-1.088542, 0.1012296, -2.020196, 1, 0, 0, 1, 1,
-1.085138, -0.8767411, -2.386979, 1, 0, 0, 1, 1,
-1.083001, -0.656224, -1.439437, 1, 0, 0, 1, 1,
-1.070181, -0.3038079, -1.871934, 1, 0, 0, 1, 1,
-1.066996, -0.8831161, -1.019391, 1, 0, 0, 1, 1,
-1.06392, -1.593977, -2.768641, 0, 0, 0, 1, 1,
-1.063802, 0.9692891, 0.4701985, 0, 0, 0, 1, 1,
-1.056584, -0.6802362, -1.576544, 0, 0, 0, 1, 1,
-1.054392, 1.14478, 0.1680422, 0, 0, 0, 1, 1,
-1.053972, -1.368226, -1.497865, 0, 0, 0, 1, 1,
-1.048886, 0.23441, -2.720597, 0, 0, 0, 1, 1,
-1.039567, 0.9543489, 0.04943959, 0, 0, 0, 1, 1,
-1.035989, 2.825558, -1.061422, 1, 1, 1, 1, 1,
-1.034292, 1.06049, -0.1830524, 1, 1, 1, 1, 1,
-1.032207, -0.7230448, -1.221366, 1, 1, 1, 1, 1,
-1.025302, -0.8600448, -2.025486, 1, 1, 1, 1, 1,
-1.022397, 0.7676908, -0.6283898, 1, 1, 1, 1, 1,
-1.02085, 1.83219, -1.08888, 1, 1, 1, 1, 1,
-1.018041, 0.2665791, -3.585437, 1, 1, 1, 1, 1,
-1.012651, -0.5953928, -3.984645, 1, 1, 1, 1, 1,
-1.00684, -0.3752488, -2.948073, 1, 1, 1, 1, 1,
-0.9970218, 0.656786, -0.9297895, 1, 1, 1, 1, 1,
-0.9934636, -0.719157, -1.923193, 1, 1, 1, 1, 1,
-0.9931858, 0.9024327, -1.982394, 1, 1, 1, 1, 1,
-0.9889055, -1.437781, -0.1742548, 1, 1, 1, 1, 1,
-0.9855034, 3.954232, -0.5104928, 1, 1, 1, 1, 1,
-0.9843273, 0.7277898, -1.285186, 1, 1, 1, 1, 1,
-0.9788771, 1.269246, -1.293112, 0, 0, 1, 1, 1,
-0.9772744, -0.6344029, -2.530164, 1, 0, 0, 1, 1,
-0.9746768, -1.357424, -3.35188, 1, 0, 0, 1, 1,
-0.9687216, -0.4728952, -1.703869, 1, 0, 0, 1, 1,
-0.966346, 1.293687, -1.013761, 1, 0, 0, 1, 1,
-0.9634506, -1.210213, -0.009288324, 1, 0, 0, 1, 1,
-0.9562369, 0.4853232, -1.968428, 0, 0, 0, 1, 1,
-0.9485075, 1.690397, 0.1921691, 0, 0, 0, 1, 1,
-0.9482944, 1.206142, 2.031779, 0, 0, 0, 1, 1,
-0.9464978, 0.4150154, -3.322013, 0, 0, 0, 1, 1,
-0.9457591, -0.125675, -1.461496, 0, 0, 0, 1, 1,
-0.9440546, -0.03752958, -3.263624, 0, 0, 0, 1, 1,
-0.9435576, -0.7752417, -1.383136, 0, 0, 0, 1, 1,
-0.9422862, 0.7532941, 0.0207417, 1, 1, 1, 1, 1,
-0.941996, -0.8315834, -2.922563, 1, 1, 1, 1, 1,
-0.9335058, -0.2755495, -3.455458, 1, 1, 1, 1, 1,
-0.9325701, 0.9952366, -0.7418169, 1, 1, 1, 1, 1,
-0.9292095, -1.546668, -1.261476, 1, 1, 1, 1, 1,
-0.9258708, -0.02826893, -0.1961881, 1, 1, 1, 1, 1,
-0.9203069, 1.391615, -0.243871, 1, 1, 1, 1, 1,
-0.9172504, 1.620188, -0.1091281, 1, 1, 1, 1, 1,
-0.9147331, 0.07778091, -2.921458, 1, 1, 1, 1, 1,
-0.9042456, 0.4895693, -0.1087435, 1, 1, 1, 1, 1,
-0.9033389, 0.5512767, -1.739979, 1, 1, 1, 1, 1,
-0.8983895, 1.157299, -1.125208, 1, 1, 1, 1, 1,
-0.8973796, 0.6371164, -1.838152, 1, 1, 1, 1, 1,
-0.8967428, -0.4407189, -1.902081, 1, 1, 1, 1, 1,
-0.8947742, -0.8023858, -2.452443, 1, 1, 1, 1, 1,
-0.8928037, 0.2142881, -3.674449, 0, 0, 1, 1, 1,
-0.8922769, -0.2473871, -2.416142, 1, 0, 0, 1, 1,
-0.887329, 0.7494597, -2.045283, 1, 0, 0, 1, 1,
-0.88427, -0.9582394, -1.804705, 1, 0, 0, 1, 1,
-0.8779603, -0.8511413, -2.604463, 1, 0, 0, 1, 1,
-0.8777055, 0.2253786, -1.570911, 1, 0, 0, 1, 1,
-0.8774881, 1.479569, -0.7649847, 0, 0, 0, 1, 1,
-0.8730516, 0.5221117, -1.003559, 0, 0, 0, 1, 1,
-0.8718292, -1.727223, -2.204629, 0, 0, 0, 1, 1,
-0.8668392, 1.208453, 1.481869, 0, 0, 0, 1, 1,
-0.8602122, -1.038963, -2.066713, 0, 0, 0, 1, 1,
-0.8586804, -0.6710786, -3.957753, 0, 0, 0, 1, 1,
-0.8566873, 0.7476953, -0.7166995, 0, 0, 0, 1, 1,
-0.8549694, -2.080734, -3.186447, 1, 1, 1, 1, 1,
-0.8497545, 0.6698537, 0.2210759, 1, 1, 1, 1, 1,
-0.849556, -1.63056, -4.173463, 1, 1, 1, 1, 1,
-0.8480546, -0.4322503, -0.2626292, 1, 1, 1, 1, 1,
-0.8414297, -0.2091484, -1.84062, 1, 1, 1, 1, 1,
-0.8361893, 0.6493011, -2.18225, 1, 1, 1, 1, 1,
-0.8336513, 0.1068319, -0.7042368, 1, 1, 1, 1, 1,
-0.829839, -0.2974276, -2.200448, 1, 1, 1, 1, 1,
-0.8245503, 1.247033, 1.242225, 1, 1, 1, 1, 1,
-0.8207115, -0.4584638, -1.634512, 1, 1, 1, 1, 1,
-0.8120027, 1.411036, 0.1559668, 1, 1, 1, 1, 1,
-0.8085535, 0.5229464, 0.8337324, 1, 1, 1, 1, 1,
-0.7959868, -0.2397693, -0.9022819, 1, 1, 1, 1, 1,
-0.7959165, 0.5960925, 0.04626832, 1, 1, 1, 1, 1,
-0.7884259, 0.2777935, -0.7116761, 1, 1, 1, 1, 1,
-0.7786202, 0.3474212, -1.466158, 0, 0, 1, 1, 1,
-0.7783194, -0.2402002, -1.892512, 1, 0, 0, 1, 1,
-0.7740971, 1.208836, -0.885367, 1, 0, 0, 1, 1,
-0.7740167, 0.8878606, -0.9664521, 1, 0, 0, 1, 1,
-0.7724872, -0.2680344, -0.8976465, 1, 0, 0, 1, 1,
-0.7684273, -0.7415007, -1.61627, 1, 0, 0, 1, 1,
-0.7602904, 1.123784, 0.1274983, 0, 0, 0, 1, 1,
-0.7570673, -0.8955019, -2.238652, 0, 0, 0, 1, 1,
-0.7547676, 0.411282, -3.583256, 0, 0, 0, 1, 1,
-0.7538499, -0.4574363, -1.740534, 0, 0, 0, 1, 1,
-0.750189, -0.6143049, -3.519012, 0, 0, 0, 1, 1,
-0.7487451, -1.274776, -3.217277, 0, 0, 0, 1, 1,
-0.7416819, 0.1685574, -1.498984, 0, 0, 0, 1, 1,
-0.7397711, -1.859714, -4.327143, 1, 1, 1, 1, 1,
-0.7380748, 1.545062, -2.148011, 1, 1, 1, 1, 1,
-0.7338679, -0.7961849, -2.473336, 1, 1, 1, 1, 1,
-0.7324667, -1.146168, -1.985231, 1, 1, 1, 1, 1,
-0.7320351, 1.084238, -2.117303, 1, 1, 1, 1, 1,
-0.7281488, -0.7992874, -2.107304, 1, 1, 1, 1, 1,
-0.7239083, -1.219079, -4.204938, 1, 1, 1, 1, 1,
-0.7183585, -0.1183898, -0.0609642, 1, 1, 1, 1, 1,
-0.7145284, -0.2263006, -0.687187, 1, 1, 1, 1, 1,
-0.7134184, 0.4858853, -1.279401, 1, 1, 1, 1, 1,
-0.7076147, -0.6252592, -1.803723, 1, 1, 1, 1, 1,
-0.7054655, -1.269928, -1.913608, 1, 1, 1, 1, 1,
-0.7007963, -0.1492884, -1.136632, 1, 1, 1, 1, 1,
-0.7006733, -0.6472368, -2.633174, 1, 1, 1, 1, 1,
-0.6974793, 1.648993, -1.056833, 1, 1, 1, 1, 1,
-0.6955434, 1.167171, -0.2573244, 0, 0, 1, 1, 1,
-0.6947571, 0.1948376, -1.265982, 1, 0, 0, 1, 1,
-0.6936718, 2.516695, -0.1105483, 1, 0, 0, 1, 1,
-0.6936057, -0.6334398, -0.7065337, 1, 0, 0, 1, 1,
-0.6820373, -0.68609, -2.682219, 1, 0, 0, 1, 1,
-0.676845, -0.6318839, -3.153759, 1, 0, 0, 1, 1,
-0.6682219, 0.9407596, -1.00485, 0, 0, 0, 1, 1,
-0.6659228, 0.1135959, -2.58902, 0, 0, 0, 1, 1,
-0.6655715, -0.329075, -0.7121987, 0, 0, 0, 1, 1,
-0.6626226, -0.2413125, -1.407198, 0, 0, 0, 1, 1,
-0.6556911, -0.1284406, -1.705061, 0, 0, 0, 1, 1,
-0.6516704, -1.216481, -3.429089, 0, 0, 0, 1, 1,
-0.6508043, 0.7279627, -0.4091258, 0, 0, 0, 1, 1,
-0.6487857, 0.2644853, -0.9827673, 1, 1, 1, 1, 1,
-0.6478101, 0.9384836, -1.39158, 1, 1, 1, 1, 1,
-0.6467581, 0.6291068, -1.434054, 1, 1, 1, 1, 1,
-0.6410674, -1.001336, -1.614841, 1, 1, 1, 1, 1,
-0.635078, 0.7930979, -1.062216, 1, 1, 1, 1, 1,
-0.6310437, 0.7244592, -1.234267, 1, 1, 1, 1, 1,
-0.6266558, 1.251367, 0.4032187, 1, 1, 1, 1, 1,
-0.6249142, 0.7747899, -1.772948, 1, 1, 1, 1, 1,
-0.6240876, 0.6495388, -0.004725055, 1, 1, 1, 1, 1,
-0.6199182, -1.533122, -2.565254, 1, 1, 1, 1, 1,
-0.6188067, 0.756849, -0.826867, 1, 1, 1, 1, 1,
-0.6183237, 1.292517, 0.5088247, 1, 1, 1, 1, 1,
-0.6154503, -0.2121662, -1.566301, 1, 1, 1, 1, 1,
-0.6148051, -0.399142, -0.3190169, 1, 1, 1, 1, 1,
-0.6145703, 0.6214028, -1.129618, 1, 1, 1, 1, 1,
-0.612516, -1.969887, -2.811312, 0, 0, 1, 1, 1,
-0.6065857, 1.652546, 0.08825002, 1, 0, 0, 1, 1,
-0.6046641, -0.9618812, -2.585202, 1, 0, 0, 1, 1,
-0.6024553, 0.5523543, -0.8816444, 1, 0, 0, 1, 1,
-0.5952516, 0.4778383, -0.5991859, 1, 0, 0, 1, 1,
-0.5920798, -0.02034183, -2.151387, 1, 0, 0, 1, 1,
-0.5906714, -0.3489009, -2.598327, 0, 0, 0, 1, 1,
-0.5896016, 0.2873488, -0.09706487, 0, 0, 0, 1, 1,
-0.5870196, 0.3963132, -1.277973, 0, 0, 0, 1, 1,
-0.5811886, 1.284912, -0.9517971, 0, 0, 0, 1, 1,
-0.5788296, -0.5278637, -1.288647, 0, 0, 0, 1, 1,
-0.5726786, -0.5353115, -1.882888, 0, 0, 0, 1, 1,
-0.5721662, 0.3844001, -1.789396, 0, 0, 0, 1, 1,
-0.5674363, 0.8997845, -2.823911, 1, 1, 1, 1, 1,
-0.5660778, -0.4485838, -0.626624, 1, 1, 1, 1, 1,
-0.5608814, 0.7530685, -0.02577875, 1, 1, 1, 1, 1,
-0.5563858, -0.9594259, -1.701, 1, 1, 1, 1, 1,
-0.552572, -0.1248191, -2.855763, 1, 1, 1, 1, 1,
-0.5519348, 1.705117, 0.6832908, 1, 1, 1, 1, 1,
-0.5505232, 0.01246888, -2.016732, 1, 1, 1, 1, 1,
-0.5501201, -0.5497652, -2.672718, 1, 1, 1, 1, 1,
-0.5484792, -1.024042, -1.924394, 1, 1, 1, 1, 1,
-0.545057, 1.493152, 1.087839, 1, 1, 1, 1, 1,
-0.5413564, 2.381745, 0.3343561, 1, 1, 1, 1, 1,
-0.5411686, -0.8440438, -2.938798, 1, 1, 1, 1, 1,
-0.5334373, 1.794268, -1.03598, 1, 1, 1, 1, 1,
-0.5325046, 0.8114886, -0.9942669, 1, 1, 1, 1, 1,
-0.5312456, 1.06193, 0.2286859, 1, 1, 1, 1, 1,
-0.5283285, 1.106386, -0.1001997, 0, 0, 1, 1, 1,
-0.5270628, 0.2930375, -1.83781, 1, 0, 0, 1, 1,
-0.5264103, 0.7703716, -0.5847774, 1, 0, 0, 1, 1,
-0.5235437, -0.5618397, -3.508896, 1, 0, 0, 1, 1,
-0.5235406, 0.6460292, -0.9530768, 1, 0, 0, 1, 1,
-0.5212739, 0.03533707, -0.8050925, 1, 0, 0, 1, 1,
-0.5190908, 0.7070493, -2.099758, 0, 0, 0, 1, 1,
-0.5161381, 1.709134, -0.2011648, 0, 0, 0, 1, 1,
-0.5129877, 0.9537147, -0.2072829, 0, 0, 0, 1, 1,
-0.5093529, -1.411709, -3.47825, 0, 0, 0, 1, 1,
-0.5066368, -2.44617, -3.99393, 0, 0, 0, 1, 1,
-0.5046719, -1.332077, -2.345274, 0, 0, 0, 1, 1,
-0.5021443, 0.4769045, -1.085202, 0, 0, 0, 1, 1,
-0.4999885, -0.4611686, -2.166065, 1, 1, 1, 1, 1,
-0.4998924, 0.2503039, -1.676242, 1, 1, 1, 1, 1,
-0.498394, -1.853169, -2.595054, 1, 1, 1, 1, 1,
-0.4953222, 1.517026, 0.5789999, 1, 1, 1, 1, 1,
-0.4945068, 0.09979492, -0.595654, 1, 1, 1, 1, 1,
-0.4926774, -0.02940433, -2.087594, 1, 1, 1, 1, 1,
-0.4903378, 0.6023849, -1.614201, 1, 1, 1, 1, 1,
-0.4883177, -1.175838, -0.4437937, 1, 1, 1, 1, 1,
-0.4880069, -0.818934, -3.546171, 1, 1, 1, 1, 1,
-0.4869464, 2.109884, -1.037894, 1, 1, 1, 1, 1,
-0.4784658, 0.2504957, -0.07676468, 1, 1, 1, 1, 1,
-0.4758159, -0.5612631, -2.13909, 1, 1, 1, 1, 1,
-0.4680271, -0.3586975, -2.68565, 1, 1, 1, 1, 1,
-0.4678263, -1.387006, -1.163066, 1, 1, 1, 1, 1,
-0.4664872, 0.2216099, -2.206779, 1, 1, 1, 1, 1,
-0.4649241, -0.1918999, -2.688641, 0, 0, 1, 1, 1,
-0.4639805, 0.9251366, 0.4117563, 1, 0, 0, 1, 1,
-0.4631559, -0.1045906, 0.7342774, 1, 0, 0, 1, 1,
-0.4620411, -0.1022513, -1.308269, 1, 0, 0, 1, 1,
-0.4619314, -0.8156081, -2.103755, 1, 0, 0, 1, 1,
-0.4608871, -0.8691702, -3.298757, 1, 0, 0, 1, 1,
-0.4572414, -0.5386905, -3.176375, 0, 0, 0, 1, 1,
-0.4552121, 0.225966, 0.09409893, 0, 0, 0, 1, 1,
-0.4545705, 0.7841849, 0.9979643, 0, 0, 0, 1, 1,
-0.4464647, 0.9520299, -0.3058937, 0, 0, 0, 1, 1,
-0.4430578, 0.7143016, -1.455598, 0, 0, 0, 1, 1,
-0.4412407, 0.403671, 0.2543484, 0, 0, 0, 1, 1,
-0.4347426, 2.18038, -0.9761285, 0, 0, 0, 1, 1,
-0.433626, 0.02931646, -1.159849, 1, 1, 1, 1, 1,
-0.4308989, -0.1362858, -1.209846, 1, 1, 1, 1, 1,
-0.4284698, -1.721715, -2.0085, 1, 1, 1, 1, 1,
-0.4249781, -1.107326, -3.639316, 1, 1, 1, 1, 1,
-0.4215464, 0.5618204, -1.106715, 1, 1, 1, 1, 1,
-0.4178806, 0.0525215, -0.4065093, 1, 1, 1, 1, 1,
-0.4163583, -0.1038626, -1.630516, 1, 1, 1, 1, 1,
-0.4148862, -1.898659, -2.076543, 1, 1, 1, 1, 1,
-0.4103498, 0.5798526, -0.3214449, 1, 1, 1, 1, 1,
-0.409855, 0.1819447, 1.023121, 1, 1, 1, 1, 1,
-0.4098271, -0.1880434, -0.954044, 1, 1, 1, 1, 1,
-0.4060017, -1.022097, -2.371931, 1, 1, 1, 1, 1,
-0.402365, 0.9217884, 0.3495731, 1, 1, 1, 1, 1,
-0.3977975, 0.8030688, -0.8896585, 1, 1, 1, 1, 1,
-0.3883605, 0.02385461, -1.822633, 1, 1, 1, 1, 1,
-0.3881407, 0.3718081, -1.138403, 0, 0, 1, 1, 1,
-0.3857272, 0.03121752, -1.720894, 1, 0, 0, 1, 1,
-0.3789386, -0.6127183, -1.650373, 1, 0, 0, 1, 1,
-0.3708966, 1.755924, -0.6660916, 1, 0, 0, 1, 1,
-0.3695982, 1.642648, -1.184861, 1, 0, 0, 1, 1,
-0.3673857, 2.549286, -0.4091065, 1, 0, 0, 1, 1,
-0.3607946, 0.1393695, -2.943203, 0, 0, 0, 1, 1,
-0.3581772, -1.274744, -4.771555, 0, 0, 0, 1, 1,
-0.3579449, 0.1621496, 0.2628685, 0, 0, 0, 1, 1,
-0.3563867, 1.083509, -0.8562842, 0, 0, 0, 1, 1,
-0.355351, 0.1164016, -0.6924903, 0, 0, 0, 1, 1,
-0.3543698, -0.4707861, -2.275009, 0, 0, 0, 1, 1,
-0.3524309, -0.04712834, -0.3201272, 0, 0, 0, 1, 1,
-0.3519638, -0.03196523, -2.03158, 1, 1, 1, 1, 1,
-0.3449889, -0.9883896, -3.645586, 1, 1, 1, 1, 1,
-0.3349775, -0.2938374, -1.324729, 1, 1, 1, 1, 1,
-0.3346799, 0.1259516, -1.155475, 1, 1, 1, 1, 1,
-0.3298714, -0.7733863, -2.471551, 1, 1, 1, 1, 1,
-0.3283498, -2.002277, -1.171802, 1, 1, 1, 1, 1,
-0.3204782, -0.2922172, -2.584957, 1, 1, 1, 1, 1,
-0.3145926, 0.8423016, -0.1986144, 1, 1, 1, 1, 1,
-0.314201, -1.007091, -2.417547, 1, 1, 1, 1, 1,
-0.3132061, 0.6180587, -1.65494, 1, 1, 1, 1, 1,
-0.3119157, -0.2336475, -2.798908, 1, 1, 1, 1, 1,
-0.3099529, 0.04852676, -0.09198397, 1, 1, 1, 1, 1,
-0.3087472, -1.36187, -2.789283, 1, 1, 1, 1, 1,
-0.3055074, 1.134576, -0.110991, 1, 1, 1, 1, 1,
-0.2962772, 0.3325769, -2.252002, 1, 1, 1, 1, 1,
-0.2922781, 0.09394362, -1.473603, 0, 0, 1, 1, 1,
-0.290019, 0.4818084, 1.013256, 1, 0, 0, 1, 1,
-0.2899131, -1.401162, -1.545873, 1, 0, 0, 1, 1,
-0.2891865, -3.302308, -1.938974, 1, 0, 0, 1, 1,
-0.2822444, 0.1136348, -0.7314524, 1, 0, 0, 1, 1,
-0.2814977, -1.054967, -4.181, 1, 0, 0, 1, 1,
-0.2793677, -0.5092241, -2.846998, 0, 0, 0, 1, 1,
-0.2701409, -0.5781783, -3.070317, 0, 0, 0, 1, 1,
-0.263314, 0.4748091, 1.128627, 0, 0, 0, 1, 1,
-0.2621195, -0.5440657, -2.531858, 0, 0, 0, 1, 1,
-0.2608446, 0.115083, -0.3260302, 0, 0, 0, 1, 1,
-0.2607591, -0.3090115, -3.05058, 0, 0, 0, 1, 1,
-0.2573245, -1.044008, -2.827183, 0, 0, 0, 1, 1,
-0.2569108, 0.1607105, -0.6510814, 1, 1, 1, 1, 1,
-0.2557284, -0.1093211, -3.225851, 1, 1, 1, 1, 1,
-0.2443666, -0.2794169, -2.714157, 1, 1, 1, 1, 1,
-0.2414603, -1.536072, -3.067823, 1, 1, 1, 1, 1,
-0.2378198, -0.1015036, -2.398726, 1, 1, 1, 1, 1,
-0.2364308, 0.182589, -1.770862, 1, 1, 1, 1, 1,
-0.2294506, -0.9642928, -1.453823, 1, 1, 1, 1, 1,
-0.2218176, -0.9421987, -2.176564, 1, 1, 1, 1, 1,
-0.2168298, -0.826196, -2.755911, 1, 1, 1, 1, 1,
-0.2116511, 0.6673405, 0.09561142, 1, 1, 1, 1, 1,
-0.2080974, 0.7090433, 0.1994048, 1, 1, 1, 1, 1,
-0.2029617, -2.142564, -3.74152, 1, 1, 1, 1, 1,
-0.2028715, -0.02794298, -3.212669, 1, 1, 1, 1, 1,
-0.2019478, -0.4116568, -1.907011, 1, 1, 1, 1, 1,
-0.2014138, -0.4180326, -2.340933, 1, 1, 1, 1, 1,
-0.1982647, -0.2372687, -2.377633, 0, 0, 1, 1, 1,
-0.1976657, 0.1314536, -1.076542, 1, 0, 0, 1, 1,
-0.1936797, -0.9829421, -3.494555, 1, 0, 0, 1, 1,
-0.1911511, -0.6209386, -2.380469, 1, 0, 0, 1, 1,
-0.1883169, 0.6635914, 0.6865215, 1, 0, 0, 1, 1,
-0.1878214, -0.02305593, -2.721912, 1, 0, 0, 1, 1,
-0.1826829, -0.420631, -3.329448, 0, 0, 0, 1, 1,
-0.1821486, 0.4206347, -1.223644, 0, 0, 0, 1, 1,
-0.1795416, 0.003063178, -1.642221, 0, 0, 0, 1, 1,
-0.1766207, 2.520464, -0.6178035, 0, 0, 0, 1, 1,
-0.1735421, -0.5681844, -2.500342, 0, 0, 0, 1, 1,
-0.169046, -0.9161072, -2.859453, 0, 0, 0, 1, 1,
-0.1636496, 0.5561262, 0.5169508, 0, 0, 0, 1, 1,
-0.1587332, -0.9854721, -2.703672, 1, 1, 1, 1, 1,
-0.1566145, -0.9173756, -2.784561, 1, 1, 1, 1, 1,
-0.1553919, 0.02665726, -1.526183, 1, 1, 1, 1, 1,
-0.1513755, -0.6845636, -3.546927, 1, 1, 1, 1, 1,
-0.1501212, -0.4670135, -4.794598, 1, 1, 1, 1, 1,
-0.1499796, -0.2635604, -1.940051, 1, 1, 1, 1, 1,
-0.1453004, 0.5466065, -0.918977, 1, 1, 1, 1, 1,
-0.1434835, -0.3540345, -2.320671, 1, 1, 1, 1, 1,
-0.1433746, 1.945893, -1.255487, 1, 1, 1, 1, 1,
-0.1424474, -0.2053063, -2.874601, 1, 1, 1, 1, 1,
-0.1397398, -0.8588704, -3.461574, 1, 1, 1, 1, 1,
-0.1376506, 0.05121094, -3.431806, 1, 1, 1, 1, 1,
-0.1362765, 0.009118755, -1.643077, 1, 1, 1, 1, 1,
-0.1355183, 0.8891297, 0.1912673, 1, 1, 1, 1, 1,
-0.1337893, 0.1000986, -1.282164, 1, 1, 1, 1, 1,
-0.133028, -1.165892, -2.772255, 0, 0, 1, 1, 1,
-0.1329314, 0.788331, -0.3180171, 1, 0, 0, 1, 1,
-0.1271026, 0.06183858, -0.1245033, 1, 0, 0, 1, 1,
-0.127031, -0.9257352, -4.273267, 1, 0, 0, 1, 1,
-0.1216916, 0.04828283, -2.702384, 1, 0, 0, 1, 1,
-0.1202657, -0.2522173, -2.938805, 1, 0, 0, 1, 1,
-0.1136246, -1.57934, -3.191653, 0, 0, 0, 1, 1,
-0.1093086, -0.2722573, -2.459488, 0, 0, 0, 1, 1,
-0.1079471, -0.6293431, -2.865942, 0, 0, 0, 1, 1,
-0.1066763, 1.05802, -0.55182, 0, 0, 0, 1, 1,
-0.1040103, -0.2082126, -1.950613, 0, 0, 0, 1, 1,
-0.1023636, 0.6679716, -0.1362048, 0, 0, 0, 1, 1,
-0.1015519, -1.388725, -3.837465, 0, 0, 0, 1, 1,
-0.1000981, -0.8007046, -4.458993, 1, 1, 1, 1, 1,
-0.09977829, -0.1952963, -1.879853, 1, 1, 1, 1, 1,
-0.09259345, -0.9831381, -1.640093, 1, 1, 1, 1, 1,
-0.09197114, 0.05231877, 0.05534742, 1, 1, 1, 1, 1,
-0.09108829, -1.104705, -3.293776, 1, 1, 1, 1, 1,
-0.08869477, -0.4410919, -4.924368, 1, 1, 1, 1, 1,
-0.08012618, -1.318056, -2.817789, 1, 1, 1, 1, 1,
-0.07973845, -1.036408, -2.1745, 1, 1, 1, 1, 1,
-0.07941219, -1.022882, -1.81338, 1, 1, 1, 1, 1,
-0.07879445, 0.7236696, 0.3354607, 1, 1, 1, 1, 1,
-0.07862906, -0.9116454, -1.902027, 1, 1, 1, 1, 1,
-0.07411966, 1.658852, -0.3910756, 1, 1, 1, 1, 1,
-0.07378004, 0.1174184, -0.8748279, 1, 1, 1, 1, 1,
-0.07233472, -0.6261967, -4.429373, 1, 1, 1, 1, 1,
-0.07016352, 1.108434, -1.141915, 1, 1, 1, 1, 1,
-0.06939572, 1.413742, 0.04373688, 0, 0, 1, 1, 1,
-0.06514546, -0.3115769, -3.543051, 1, 0, 0, 1, 1,
-0.05993503, 1.13554, 0.949253, 1, 0, 0, 1, 1,
-0.05901063, -1.996066, -4.032232, 1, 0, 0, 1, 1,
-0.05775539, -0.1362939, -2.953087, 1, 0, 0, 1, 1,
-0.05441879, 0.03952465, -0.5368905, 1, 0, 0, 1, 1,
-0.05424756, -1.159586, -0.7957911, 0, 0, 0, 1, 1,
-0.04566501, -0.4407604, -3.125348, 0, 0, 0, 1, 1,
-0.04121868, 0.2826554, 1.53544, 0, 0, 0, 1, 1,
-0.03944956, -1.39967, -4.145253, 0, 0, 0, 1, 1,
-0.03654164, 0.1397783, -2.124766, 0, 0, 0, 1, 1,
-0.03603479, -0.3659927, -3.24487, 0, 0, 0, 1, 1,
-0.03543809, -0.4005852, -3.223656, 0, 0, 0, 1, 1,
-0.03366635, 0.9640493, 0.7285659, 1, 1, 1, 1, 1,
-0.0331347, 0.4253934, 1.029541, 1, 1, 1, 1, 1,
-0.03281559, -0.4258792, -3.232767, 1, 1, 1, 1, 1,
-0.03243003, -0.8141727, -2.720916, 1, 1, 1, 1, 1,
-0.03154396, -1.302882, -3.008214, 1, 1, 1, 1, 1,
-0.0192079, -0.06470232, -3.466079, 1, 1, 1, 1, 1,
-0.01652426, -0.3316189, -3.540245, 1, 1, 1, 1, 1,
-0.01568763, -0.375143, -1.794189, 1, 1, 1, 1, 1,
-0.0143113, -1.254768, -2.927174, 1, 1, 1, 1, 1,
-0.01295572, 1.128865, -1.277699, 1, 1, 1, 1, 1,
-0.005298771, 0.3648185, -1.644019, 1, 1, 1, 1, 1,
-0.002326541, 0.1877169, -1.192909, 1, 1, 1, 1, 1,
0.002002478, 1.044391, 0.6345701, 1, 1, 1, 1, 1,
0.002419672, 0.2160694, 0.5891886, 1, 1, 1, 1, 1,
0.003921186, -0.1107873, 1.204607, 1, 1, 1, 1, 1,
0.008890679, 0.01807416, 0.1610086, 0, 0, 1, 1, 1,
0.01605535, -0.06208193, 1.666684, 1, 0, 0, 1, 1,
0.01628248, -0.7878953, 2.786178, 1, 0, 0, 1, 1,
0.01877237, 0.3073982, 0.01409422, 1, 0, 0, 1, 1,
0.02437361, -0.06598751, 3.591817, 1, 0, 0, 1, 1,
0.02802251, 2.796441, 2.79535, 1, 0, 0, 1, 1,
0.02864474, 0.8630324, 2.887478, 0, 0, 0, 1, 1,
0.02865402, 0.6951455, -0.08403021, 0, 0, 0, 1, 1,
0.03220803, -1.297929, 3.57832, 0, 0, 0, 1, 1,
0.03596257, 1.825078, 0.4762182, 0, 0, 0, 1, 1,
0.03794643, 0.6270659, -1.589353, 0, 0, 0, 1, 1,
0.04440464, 1.731827, 0.1059998, 0, 0, 0, 1, 1,
0.0460011, 1.516027, -1.525181, 0, 0, 0, 1, 1,
0.04740858, -0.7641301, 1.937063, 1, 1, 1, 1, 1,
0.04980588, -0.3663164, 2.430763, 1, 1, 1, 1, 1,
0.05170652, -0.4922322, 1.574966, 1, 1, 1, 1, 1,
0.05612624, 2.077625, 0.5660875, 1, 1, 1, 1, 1,
0.05701883, -2.818647, 3.139701, 1, 1, 1, 1, 1,
0.05857438, 0.001487267, 0.8557335, 1, 1, 1, 1, 1,
0.06116954, 0.3511909, 0.3036048, 1, 1, 1, 1, 1,
0.06171551, 0.2677111, 2.067088, 1, 1, 1, 1, 1,
0.06222756, 1.643041, 0.02157733, 1, 1, 1, 1, 1,
0.06720307, -0.7938025, 3.716633, 1, 1, 1, 1, 1,
0.06759433, 0.4596499, -0.3744994, 1, 1, 1, 1, 1,
0.07185684, -2.624958, 3.468766, 1, 1, 1, 1, 1,
0.07478903, -0.7302606, 3.181673, 1, 1, 1, 1, 1,
0.07609507, 1.207981, 0.6980723, 1, 1, 1, 1, 1,
0.07954742, 0.4224153, 0.07647812, 1, 1, 1, 1, 1,
0.08052842, -0.7160684, 3.315334, 0, 0, 1, 1, 1,
0.08165108, 0.6782325, 0.4690717, 1, 0, 0, 1, 1,
0.08261117, -0.5886557, 2.386091, 1, 0, 0, 1, 1,
0.08510497, -1.472038, 3.039034, 1, 0, 0, 1, 1,
0.08579776, 0.133859, -0.1762185, 1, 0, 0, 1, 1,
0.08683091, 0.2599191, 0.1716307, 1, 0, 0, 1, 1,
0.08771426, 1.067134, 2.64329, 0, 0, 0, 1, 1,
0.09038333, -0.824079, 2.363587, 0, 0, 0, 1, 1,
0.09117471, 0.373212, 1.532088, 0, 0, 0, 1, 1,
0.09128197, -0.0973873, 3.681165, 0, 0, 0, 1, 1,
0.09827278, 0.7478295, 0.4288536, 0, 0, 0, 1, 1,
0.1014358, -1.298916, 3.664351, 0, 0, 0, 1, 1,
0.1017939, -0.6668911, 3.236958, 0, 0, 0, 1, 1,
0.1037701, -0.1503652, 2.941966, 1, 1, 1, 1, 1,
0.1040883, 0.8908287, -0.842394, 1, 1, 1, 1, 1,
0.1061432, 0.5141178, 0.8028824, 1, 1, 1, 1, 1,
0.1069241, -2.145082, 3.090569, 1, 1, 1, 1, 1,
0.1091249, -0.1545342, 3.251151, 1, 1, 1, 1, 1,
0.1138005, -0.9681796, 2.768422, 1, 1, 1, 1, 1,
0.1157196, 2.284881, 1.051833, 1, 1, 1, 1, 1,
0.1198085, 1.039254, 0.3850793, 1, 1, 1, 1, 1,
0.1205425, -0.2688476, 3.765306, 1, 1, 1, 1, 1,
0.1246214, 0.8630396, 1.060019, 1, 1, 1, 1, 1,
0.1249819, -0.6117932, 1.998229, 1, 1, 1, 1, 1,
0.1272584, 1.165453, 0.8996629, 1, 1, 1, 1, 1,
0.131384, 0.7264042, 0.9626477, 1, 1, 1, 1, 1,
0.1326609, -1.330443, 3.4197, 1, 1, 1, 1, 1,
0.13291, 0.4307138, 2.277079, 1, 1, 1, 1, 1,
0.1337516, -0.5755553, 3.869471, 0, 0, 1, 1, 1,
0.1380512, -0.1099607, 1.786107, 1, 0, 0, 1, 1,
0.1406343, 0.6240399, 1.120408, 1, 0, 0, 1, 1,
0.1475527, 1.679999, 0.3413518, 1, 0, 0, 1, 1,
0.1479067, 1.288023, -0.3398493, 1, 0, 0, 1, 1,
0.1507234, -0.3010904, 0.7278686, 1, 0, 0, 1, 1,
0.1523572, 2.019971, 0.8246135, 0, 0, 0, 1, 1,
0.1588851, -0.6061517, 2.958091, 0, 0, 0, 1, 1,
0.1609541, -0.85646, 4.487841, 0, 0, 0, 1, 1,
0.1653097, -0.3062767, 1.667107, 0, 0, 0, 1, 1,
0.167573, -0.47073, 3.278489, 0, 0, 0, 1, 1,
0.1675751, -0.7506934, 2.087524, 0, 0, 0, 1, 1,
0.1685732, 0.02977098, 3.295214, 0, 0, 0, 1, 1,
0.1742608, 0.4245547, 0.07996698, 1, 1, 1, 1, 1,
0.175349, 2.287309, -0.464097, 1, 1, 1, 1, 1,
0.1783095, -0.3230494, 0.9227347, 1, 1, 1, 1, 1,
0.1811885, 1.864446, 0.2796607, 1, 1, 1, 1, 1,
0.1812003, -0.8362669, 2.45227, 1, 1, 1, 1, 1,
0.1891281, 0.1034751, 0.5144427, 1, 1, 1, 1, 1,
0.189257, 0.4851864, -0.542779, 1, 1, 1, 1, 1,
0.1897079, -0.7787298, 2.109408, 1, 1, 1, 1, 1,
0.1947138, 0.2964415, 0.9241321, 1, 1, 1, 1, 1,
0.1967288, 1.323176, -1.253653, 1, 1, 1, 1, 1,
0.1972424, 0.9531299, 1.156723, 1, 1, 1, 1, 1,
0.2011923, 0.473808, -0.06782471, 1, 1, 1, 1, 1,
0.2055357, 1.372677, 0.006993016, 1, 1, 1, 1, 1,
0.2140829, -0.7796051, 2.006218, 1, 1, 1, 1, 1,
0.2159875, -2.820842, 4.149337, 1, 1, 1, 1, 1,
0.2186396, 0.03667676, 2.016817, 0, 0, 1, 1, 1,
0.2199019, -0.1215605, 0.3422305, 1, 0, 0, 1, 1,
0.2237479, 0.374959, 0.6841074, 1, 0, 0, 1, 1,
0.225485, 0.003347632, 1.954099, 1, 0, 0, 1, 1,
0.2352997, -0.3058907, 2.696816, 1, 0, 0, 1, 1,
0.2354881, 0.7360887, -0.3748564, 1, 0, 0, 1, 1,
0.2365022, -0.9635734, 4.778009, 0, 0, 0, 1, 1,
0.2397937, 0.1968216, 1.10881, 0, 0, 0, 1, 1,
0.2433841, -0.08759237, 1.799179, 0, 0, 0, 1, 1,
0.2440918, -0.9287201, 1.261144, 0, 0, 0, 1, 1,
0.2490128, -1.24444, 3.523, 0, 0, 0, 1, 1,
0.2527243, -1.392251, 2.474221, 0, 0, 0, 1, 1,
0.2529467, 0.9051938, 1.501957, 0, 0, 0, 1, 1,
0.2577643, 1.277132, -0.8594254, 1, 1, 1, 1, 1,
0.2577937, -2.524932, 3.519961, 1, 1, 1, 1, 1,
0.2604881, 1.013089, 0.759986, 1, 1, 1, 1, 1,
0.2611173, 1.863995, 1.1303, 1, 1, 1, 1, 1,
0.2614874, -0.5625358, 4.694032, 1, 1, 1, 1, 1,
0.2670572, 0.1920163, 3.272015, 1, 1, 1, 1, 1,
0.2720297, -1.526577, 2.503522, 1, 1, 1, 1, 1,
0.2773516, 0.572471, 0.5546975, 1, 1, 1, 1, 1,
0.2787025, -1.824003, 3.080128, 1, 1, 1, 1, 1,
0.284578, -1.156709, 3.670125, 1, 1, 1, 1, 1,
0.2854456, 0.5939332, 0.1821436, 1, 1, 1, 1, 1,
0.2868569, -0.4277376, 1.96891, 1, 1, 1, 1, 1,
0.2883512, -0.6791306, 1.445608, 1, 1, 1, 1, 1,
0.2884811, -0.8783888, 2.43227, 1, 1, 1, 1, 1,
0.2899373, 1.113663, 0.4252085, 1, 1, 1, 1, 1,
0.2923305, -1.558474, 4.216039, 0, 0, 1, 1, 1,
0.3012171, -1.163594, 1.615836, 1, 0, 0, 1, 1,
0.3019006, -0.2710765, 1.963762, 1, 0, 0, 1, 1,
0.3046779, 0.06980992, 0.2097872, 1, 0, 0, 1, 1,
0.3090698, 1.832469, 0.439063, 1, 0, 0, 1, 1,
0.3102402, 0.4436015, -0.5558414, 1, 0, 0, 1, 1,
0.3107893, -1.603076, 1.839698, 0, 0, 0, 1, 1,
0.3133861, 1.200727, -0.6986833, 0, 0, 0, 1, 1,
0.3165991, 1.755211, 0.8299739, 0, 0, 0, 1, 1,
0.3180486, 1.291634, -0.2994891, 0, 0, 0, 1, 1,
0.3182023, 0.3850361, 1.278731, 0, 0, 0, 1, 1,
0.3195953, -0.06581493, 2.207733, 0, 0, 0, 1, 1,
0.3217549, 1.01605, 0.7393685, 0, 0, 0, 1, 1,
0.3217762, 1.522786, 1.568186, 1, 1, 1, 1, 1,
0.3218665, 0.4878041, 1.566944, 1, 1, 1, 1, 1,
0.3239037, 1.508351, 0.07567563, 1, 1, 1, 1, 1,
0.32967, 0.6107683, -1.646689, 1, 1, 1, 1, 1,
0.3331624, -0.4436169, 1.77515, 1, 1, 1, 1, 1,
0.3335778, 0.6729492, -0.1157577, 1, 1, 1, 1, 1,
0.3342621, -1.745529, 1.925766, 1, 1, 1, 1, 1,
0.3405353, 1.459393, -0.5115508, 1, 1, 1, 1, 1,
0.3424373, -1.019989, 2.388611, 1, 1, 1, 1, 1,
0.3441107, 0.8472556, 1.691922, 1, 1, 1, 1, 1,
0.3456222, -0.7443433, 3.112778, 1, 1, 1, 1, 1,
0.3469058, -0.4648249, 2.826499, 1, 1, 1, 1, 1,
0.3470713, -1.748061, 3.088632, 1, 1, 1, 1, 1,
0.3490435, -1.359827, 4.186878, 1, 1, 1, 1, 1,
0.3508214, -0.1061032, 2.231613, 1, 1, 1, 1, 1,
0.3579513, 0.1863331, 0.7460666, 0, 0, 1, 1, 1,
0.3580162, -0.3612894, 1.803421, 1, 0, 0, 1, 1,
0.3702679, -1.481862, 4.741575, 1, 0, 0, 1, 1,
0.371193, -1.858238, 3.11247, 1, 0, 0, 1, 1,
0.3713086, 0.6147917, 0.02165704, 1, 0, 0, 1, 1,
0.3739537, -0.07779837, 2.177873, 1, 0, 0, 1, 1,
0.3758683, 1.178018, 1.986464, 0, 0, 0, 1, 1,
0.3761623, 2.609321, 1.104821, 0, 0, 0, 1, 1,
0.3839292, -0.7494971, 1.246571, 0, 0, 0, 1, 1,
0.3842793, 0.8135129, -0.5276836, 0, 0, 0, 1, 1,
0.3908656, -0.4295066, 3.29823, 0, 0, 0, 1, 1,
0.3912292, 0.6435986, 0.4080928, 0, 0, 0, 1, 1,
0.3969974, -0.7898526, 2.177951, 0, 0, 0, 1, 1,
0.4101853, 1.614185, 0.9277802, 1, 1, 1, 1, 1,
0.4115959, 1.867729, -1.871369, 1, 1, 1, 1, 1,
0.4133624, -0.5198768, 0.08905706, 1, 1, 1, 1, 1,
0.4139845, -0.2400854, 2.627543, 1, 1, 1, 1, 1,
0.4142544, 1.859487, -0.037896, 1, 1, 1, 1, 1,
0.4144938, -0.2795079, 2.120915, 1, 1, 1, 1, 1,
0.423573, -0.6586949, 2.307633, 1, 1, 1, 1, 1,
0.4239604, 1.155204, 1.164946, 1, 1, 1, 1, 1,
0.424617, 2.943653, 2.114187, 1, 1, 1, 1, 1,
0.4264834, -0.1515947, 0.9783654, 1, 1, 1, 1, 1,
0.4299907, 0.3785434, 1.980242, 1, 1, 1, 1, 1,
0.4320043, 2.940831, 0.07327856, 1, 1, 1, 1, 1,
0.4320413, -0.9997387, 5.655354, 1, 1, 1, 1, 1,
0.4338426, -0.7687872, 3.315062, 1, 1, 1, 1, 1,
0.4356368, -1.268821, 3.004949, 1, 1, 1, 1, 1,
0.4376497, 1.12347, 0.8065699, 0, 0, 1, 1, 1,
0.4388973, 0.08319479, 3.744139, 1, 0, 0, 1, 1,
0.4413984, -1.727958, 2.259942, 1, 0, 0, 1, 1,
0.4424284, 0.9563028, 1.932219, 1, 0, 0, 1, 1,
0.4438543, -1.287073, 2.644351, 1, 0, 0, 1, 1,
0.4516864, 1.665773, 0.6490224, 1, 0, 0, 1, 1,
0.451755, -1.184922, 3.411988, 0, 0, 0, 1, 1,
0.4525484, -0.9125064, 3.056882, 0, 0, 0, 1, 1,
0.4597544, 0.1209989, -0.1507672, 0, 0, 0, 1, 1,
0.4631971, -0.6381431, 2.241383, 0, 0, 0, 1, 1,
0.4705908, -1.111943, 3.752039, 0, 0, 0, 1, 1,
0.473709, -0.2700646, 1.824575, 0, 0, 0, 1, 1,
0.47584, 0.2446243, -0.45712, 0, 0, 0, 1, 1,
0.4776512, 0.1606638, 1.248914, 1, 1, 1, 1, 1,
0.4784958, 0.4431024, 0.3060619, 1, 1, 1, 1, 1,
0.4790023, 0.7618611, 1.509067, 1, 1, 1, 1, 1,
0.4796031, -1.712148, 2.012408, 1, 1, 1, 1, 1,
0.4820844, -1.180635, 2.53715, 1, 1, 1, 1, 1,
0.4862469, 0.3683698, 0.6488421, 1, 1, 1, 1, 1,
0.491516, 1.669549, 1.893448, 1, 1, 1, 1, 1,
0.493582, -1.001284, 4.51314, 1, 1, 1, 1, 1,
0.4981785, -0.7212839, 1.816561, 1, 1, 1, 1, 1,
0.4990745, -0.6404902, 1.421894, 1, 1, 1, 1, 1,
0.4992622, 0.2034595, 2.068297, 1, 1, 1, 1, 1,
0.4995531, 0.8401931, -0.04078066, 1, 1, 1, 1, 1,
0.5072331, 1.187113, -0.2897187, 1, 1, 1, 1, 1,
0.5102686, 0.7909747, 0.5890937, 1, 1, 1, 1, 1,
0.5112112, -0.9366127, 2.887674, 1, 1, 1, 1, 1,
0.518695, 0.5557852, 2.143227, 0, 0, 1, 1, 1,
0.519612, 0.06502061, 2.036728, 1, 0, 0, 1, 1,
0.5264865, 0.4571787, 0.1574011, 1, 0, 0, 1, 1,
0.5269826, 0.3273951, 1.06894, 1, 0, 0, 1, 1,
0.5283292, 0.5591708, 0.4874159, 1, 0, 0, 1, 1,
0.530678, -2.268274, 2.245335, 1, 0, 0, 1, 1,
0.5345042, -1.896251, 2.455815, 0, 0, 0, 1, 1,
0.540992, -0.2422609, 1.853957, 0, 0, 0, 1, 1,
0.5436437, -0.2131976, 2.262653, 0, 0, 0, 1, 1,
0.5439106, -1.918801, 4.251876, 0, 0, 0, 1, 1,
0.5492878, -0.5964276, 0.2489392, 0, 0, 0, 1, 1,
0.5538996, 1.790058, 1.062436, 0, 0, 0, 1, 1,
0.5539454, -0.3000544, 1.972944, 0, 0, 0, 1, 1,
0.5542881, -2.732855, 3.859882, 1, 1, 1, 1, 1,
0.554754, 0.02022658, 2.028776, 1, 1, 1, 1, 1,
0.557059, -0.8277139, 1.791108, 1, 1, 1, 1, 1,
0.557729, -0.1020214, 3.10331, 1, 1, 1, 1, 1,
0.5582953, 0.4927659, 0.5039615, 1, 1, 1, 1, 1,
0.558853, 0.8357196, 1.337861, 1, 1, 1, 1, 1,
0.5597561, -0.02804415, 2.813489, 1, 1, 1, 1, 1,
0.5652081, -0.6695645, 3.295037, 1, 1, 1, 1, 1,
0.5711167, 0.3322405, 1.081799, 1, 1, 1, 1, 1,
0.5731902, 0.8075277, 1.939577, 1, 1, 1, 1, 1,
0.5750913, -0.5527016, 2.282728, 1, 1, 1, 1, 1,
0.5764918, 1.064806, -1.310131, 1, 1, 1, 1, 1,
0.5767271, 0.5618557, 0.8819724, 1, 1, 1, 1, 1,
0.5771594, 0.4768651, -0.5957926, 1, 1, 1, 1, 1,
0.580077, 1.451008, 0.1040525, 1, 1, 1, 1, 1,
0.5820143, -1.271789, 2.507994, 0, 0, 1, 1, 1,
0.5828633, -1.837771, 4.41784, 1, 0, 0, 1, 1,
0.5882273, 0.09335268, 1.548281, 1, 0, 0, 1, 1,
0.5895029, -1.251434, 3.162883, 1, 0, 0, 1, 1,
0.5925202, -0.4253029, 2.555683, 1, 0, 0, 1, 1,
0.5927426, 0.09159766, -1.105332, 1, 0, 0, 1, 1,
0.6036202, 1.829742, -0.5768386, 0, 0, 0, 1, 1,
0.6073534, -0.2156174, 3.428632, 0, 0, 0, 1, 1,
0.6082724, 0.2443611, 4.156608, 0, 0, 0, 1, 1,
0.6157626, -0.210067, 1.984817, 0, 0, 0, 1, 1,
0.6170043, -0.5899464, 1.772236, 0, 0, 0, 1, 1,
0.6178979, 0.08423255, 1.817958, 0, 0, 0, 1, 1,
0.6184552, 0.274878, 0.6900813, 0, 0, 0, 1, 1,
0.6211137, 0.8878203, 2.180167, 1, 1, 1, 1, 1,
0.6230679, 2.515247, -1.192469, 1, 1, 1, 1, 1,
0.6311616, 0.5480586, 1.243751, 1, 1, 1, 1, 1,
0.6369765, 0.8420991, 1.041518, 1, 1, 1, 1, 1,
0.6396222, 1.263685, 0.4094663, 1, 1, 1, 1, 1,
0.6432376, 1.319358, 0.2324579, 1, 1, 1, 1, 1,
0.6437112, 0.8019229, 0.3068568, 1, 1, 1, 1, 1,
0.6444736, -1.832242, 3.502186, 1, 1, 1, 1, 1,
0.6465094, -1.304962, 1.893957, 1, 1, 1, 1, 1,
0.6506988, -0.5004784, 1.458098, 1, 1, 1, 1, 1,
0.6513203, -0.1270383, 2.669037, 1, 1, 1, 1, 1,
0.6542185, 0.9737805, 3.360357, 1, 1, 1, 1, 1,
0.657076, 2.352676, 0.2142399, 1, 1, 1, 1, 1,
0.6590227, 0.1011679, 0.2102843, 1, 1, 1, 1, 1,
0.6623263, 0.1217507, 2.102159, 1, 1, 1, 1, 1,
0.6677321, 0.2377084, 2.528722, 0, 0, 1, 1, 1,
0.6678823, -0.1106715, 0.01602171, 1, 0, 0, 1, 1,
0.6707592, -0.3364006, 2.263988, 1, 0, 0, 1, 1,
0.6719927, 1.590404, -1.000585, 1, 0, 0, 1, 1,
0.6808847, -1.681141, 2.524513, 1, 0, 0, 1, 1,
0.6814539, -0.1716469, 1.637091, 1, 0, 0, 1, 1,
0.6824428, 1.099962, -0.9459487, 0, 0, 0, 1, 1,
0.683679, -0.4117089, 4.251985, 0, 0, 0, 1, 1,
0.6849249, 0.6618229, 0.9472852, 0, 0, 0, 1, 1,
0.6871383, -0.9666414, 3.436794, 0, 0, 0, 1, 1,
0.6872588, 0.1629954, 0.83566, 0, 0, 0, 1, 1,
0.6885632, 0.4430937, 1.620925, 0, 0, 0, 1, 1,
0.6887733, 0.7219901, 0.0296706, 0, 0, 0, 1, 1,
0.6893461, 0.9104728, 0.3870266, 1, 1, 1, 1, 1,
0.6898919, -0.593087, 1.784142, 1, 1, 1, 1, 1,
0.6918049, 0.3281987, 0.4196158, 1, 1, 1, 1, 1,
0.6925812, 0.7448894, 0.6391234, 1, 1, 1, 1, 1,
0.6969622, 0.04047173, 2.431916, 1, 1, 1, 1, 1,
0.6988001, 0.2877526, 1.043097, 1, 1, 1, 1, 1,
0.7046196, -0.09224274, -0.1199781, 1, 1, 1, 1, 1,
0.7071466, 0.8258629, 0.9014729, 1, 1, 1, 1, 1,
0.7088364, 0.7978808, 2.048886, 1, 1, 1, 1, 1,
0.7130459, -0.7438963, 1.113277, 1, 1, 1, 1, 1,
0.7146478, -1.692294, 2.904187, 1, 1, 1, 1, 1,
0.7193543, -0.1081517, 2.805418, 1, 1, 1, 1, 1,
0.7221177, -2.185952, 2.73439, 1, 1, 1, 1, 1,
0.7222141, -0.1008682, 1.503464, 1, 1, 1, 1, 1,
0.7271077, -1.167319, 1.104017, 1, 1, 1, 1, 1,
0.729153, -0.6482632, 2.968643, 0, 0, 1, 1, 1,
0.7292252, -0.6813029, 3.983691, 1, 0, 0, 1, 1,
0.7294163, -0.4433125, 1.941905, 1, 0, 0, 1, 1,
0.7306605, 0.8843936, 2.919468, 1, 0, 0, 1, 1,
0.7324354, -1.347404, 3.31133, 1, 0, 0, 1, 1,
0.7332087, 0.7366872, 1.041825, 1, 0, 0, 1, 1,
0.7382377, 0.1154537, 0.1574852, 0, 0, 0, 1, 1,
0.7440523, 0.1024609, 2.103249, 0, 0, 0, 1, 1,
0.7447144, -0.9126871, 1.552944, 0, 0, 0, 1, 1,
0.7450394, 0.9923736, 0.574586, 0, 0, 0, 1, 1,
0.7560337, 0.2125382, 1.895514, 0, 0, 0, 1, 1,
0.757769, 0.6719779, -0.7458481, 0, 0, 0, 1, 1,
0.7583826, 0.5612979, -1.879996, 0, 0, 0, 1, 1,
0.7602746, -1.8855, 1.356132, 1, 1, 1, 1, 1,
0.762953, 0.6354488, -0.4718333, 1, 1, 1, 1, 1,
0.7629848, 0.3635425, 1.738449, 1, 1, 1, 1, 1,
0.7634627, 2.926705, 1.332184, 1, 1, 1, 1, 1,
0.7640763, -0.4125349, 2.729316, 1, 1, 1, 1, 1,
0.7703683, -0.5502456, 3.448614, 1, 1, 1, 1, 1,
0.7713394, -0.4730941, 3.503968, 1, 1, 1, 1, 1,
0.7727801, 0.5023537, 0.6826801, 1, 1, 1, 1, 1,
0.7794505, -1.597659, 1.320742, 1, 1, 1, 1, 1,
0.7805673, 0.9263225, 0.4952896, 1, 1, 1, 1, 1,
0.7872522, -1.271945, 3.514677, 1, 1, 1, 1, 1,
0.7890158, 1.2463, 1.268565, 1, 1, 1, 1, 1,
0.790116, 0.8622881, 0.2216107, 1, 1, 1, 1, 1,
0.7913776, -0.5189295, 1.668849, 1, 1, 1, 1, 1,
0.79259, -0.7231815, 4.145237, 1, 1, 1, 1, 1,
0.8032203, 0.691461, 0.2868339, 0, 0, 1, 1, 1,
0.8115612, -1.095226, 2.841446, 1, 0, 0, 1, 1,
0.8150032, -0.877512, 2.709041, 1, 0, 0, 1, 1,
0.8214184, -0.3093125, 1.843028, 1, 0, 0, 1, 1,
0.8227311, 0.0431314, 2.662823, 1, 0, 0, 1, 1,
0.8262985, 1.192356, 0.6640366, 1, 0, 0, 1, 1,
0.8308702, 1.584605, 0.3951146, 0, 0, 0, 1, 1,
0.8344937, 0.01300171, 2.610717, 0, 0, 0, 1, 1,
0.8380381, -1.118778, 3.032502, 0, 0, 0, 1, 1,
0.8392098, -0.1206492, 1.019281, 0, 0, 0, 1, 1,
0.8429568, 0.1393806, 1.102803, 0, 0, 0, 1, 1,
0.845062, 0.8303716, 0.4952771, 0, 0, 0, 1, 1,
0.8452312, -1.390238, 1.61256, 0, 0, 0, 1, 1,
0.8521602, 0.9762021, 0.5950799, 1, 1, 1, 1, 1,
0.8558612, -1.781195, 2.836667, 1, 1, 1, 1, 1,
0.856312, 0.02148518, 1.451534, 1, 1, 1, 1, 1,
0.8577588, -0.7957114, 0.07377416, 1, 1, 1, 1, 1,
0.863314, 0.3055079, 1.5289, 1, 1, 1, 1, 1,
0.866612, 0.8198665, 1.5442, 1, 1, 1, 1, 1,
0.8674093, 0.6548979, 0.2223731, 1, 1, 1, 1, 1,
0.8793921, 0.3720455, -0.003763083, 1, 1, 1, 1, 1,
0.8801036, 1.167309, 1.357331, 1, 1, 1, 1, 1,
0.8820264, 0.5051335, 1.026483, 1, 1, 1, 1, 1,
0.8856248, -0.5636511, 1.514978, 1, 1, 1, 1, 1,
0.8889447, 1.809408, 0.01692333, 1, 1, 1, 1, 1,
0.8901217, 1.516767, 0.8484242, 1, 1, 1, 1, 1,
0.89734, 0.5428426, 1.057835, 1, 1, 1, 1, 1,
0.8991799, 0.3039682, 0.7611083, 1, 1, 1, 1, 1,
0.8996078, 0.3503572, -0.1885609, 0, 0, 1, 1, 1,
0.9015049, 0.6735372, 2.054529, 1, 0, 0, 1, 1,
0.9022257, -0.8216052, 3.199629, 1, 0, 0, 1, 1,
0.9023829, 1.377045, -0.08124933, 1, 0, 0, 1, 1,
0.9041116, 1.48788, 2.116808, 1, 0, 0, 1, 1,
0.9088016, -0.5065969, 1.514693, 1, 0, 0, 1, 1,
0.9139213, 1.211576, 0.6801359, 0, 0, 0, 1, 1,
0.9181548, -1.559975, 1.276318, 0, 0, 0, 1, 1,
0.9271653, 0.3073414, 0.9317704, 0, 0, 0, 1, 1,
0.928313, -1.622465, 2.696297, 0, 0, 0, 1, 1,
0.9292597, 0.5158838, -0.8119919, 0, 0, 0, 1, 1,
0.9312631, 0.4100619, 1.209008, 0, 0, 0, 1, 1,
0.9346269, 1.741494, 0.7790387, 0, 0, 0, 1, 1,
0.9377484, -0.4846956, 2.094141, 1, 1, 1, 1, 1,
0.9401834, 0.6980967, 2.348323, 1, 1, 1, 1, 1,
0.9403909, 1.565711, 2.035049, 1, 1, 1, 1, 1,
0.9479728, 0.3926159, 1.863179, 1, 1, 1, 1, 1,
0.9497901, -0.2165471, 3.294605, 1, 1, 1, 1, 1,
0.9509128, 1.288093, 1.564085, 1, 1, 1, 1, 1,
0.9552905, 1.350654, 0.3917311, 1, 1, 1, 1, 1,
0.9698273, 0.9169226, 1.208609, 1, 1, 1, 1, 1,
0.9741601, -0.08841775, 1.449744, 1, 1, 1, 1, 1,
0.9810517, 0.3731271, 2.070941, 1, 1, 1, 1, 1,
0.989645, 0.3132336, 1.266685, 1, 1, 1, 1, 1,
0.9939475, -0.6751459, 2.440472, 1, 1, 1, 1, 1,
0.99771, 0.3024837, 0.8812367, 1, 1, 1, 1, 1,
0.9985802, 0.1851769, -0.8911088, 1, 1, 1, 1, 1,
1.000634, -0.7766886, 3.092134, 1, 1, 1, 1, 1,
1.001964, -0.1637888, 0.8044835, 0, 0, 1, 1, 1,
1.019795, -1.043224, 1.766693, 1, 0, 0, 1, 1,
1.02387, 0.4349926, 1.536542, 1, 0, 0, 1, 1,
1.024688, -1.137545, 2.598215, 1, 0, 0, 1, 1,
1.025758, -0.9867558, 1.56953, 1, 0, 0, 1, 1,
1.029709, -0.02562247, 1.317348, 1, 0, 0, 1, 1,
1.031272, -1.289072, 2.179935, 0, 0, 0, 1, 1,
1.038903, 0.7326848, 2.757367, 0, 0, 0, 1, 1,
1.039904, -1.241515, 1.3681, 0, 0, 0, 1, 1,
1.042288, 0.2641304, 3.075613, 0, 0, 0, 1, 1,
1.049781, -0.4970706, 2.333503, 0, 0, 0, 1, 1,
1.052653, -0.7538833, 1.671978, 0, 0, 0, 1, 1,
1.055625, 1.651173, 1.207326, 0, 0, 0, 1, 1,
1.05706, 0.9772975, 0.7546242, 1, 1, 1, 1, 1,
1.059908, -2.657091, 2.454653, 1, 1, 1, 1, 1,
1.069592, -0.6717257, 1.681132, 1, 1, 1, 1, 1,
1.069654, -1.057773, 3.671062, 1, 1, 1, 1, 1,
1.072802, 2.227526, -0.09565971, 1, 1, 1, 1, 1,
1.073691, 0.4743922, 2.005523, 1, 1, 1, 1, 1,
1.074649, -1.399087, 2.848701, 1, 1, 1, 1, 1,
1.07514, 1.156331, 2.884655, 1, 1, 1, 1, 1,
1.077589, 2.063772, 0.1017167, 1, 1, 1, 1, 1,
1.081079, -1.553794, 2.101841, 1, 1, 1, 1, 1,
1.086493, -0.4865173, 2.125265, 1, 1, 1, 1, 1,
1.086572, -0.2648135, 2.769217, 1, 1, 1, 1, 1,
1.090548, 1.143495, 0.213663, 1, 1, 1, 1, 1,
1.101744, -0.5303643, 2.832231, 1, 1, 1, 1, 1,
1.102152, 0.62712, 1.853713, 1, 1, 1, 1, 1,
1.106503, 1.619888, 0.5900155, 0, 0, 1, 1, 1,
1.111299, -0.4422897, 1.080465, 1, 0, 0, 1, 1,
1.126101, 0.9613227, 1.896693, 1, 0, 0, 1, 1,
1.132645, 0.9941288, 1.219789, 1, 0, 0, 1, 1,
1.13495, -1.383442, 2.293425, 1, 0, 0, 1, 1,
1.139586, -1.215833, 2.491659, 1, 0, 0, 1, 1,
1.140248, -1.534666, 1.988143, 0, 0, 0, 1, 1,
1.143942, -1.509229, 2.056125, 0, 0, 0, 1, 1,
1.146785, 1.196882, -0.415093, 0, 0, 0, 1, 1,
1.148878, -1.948524, 3.245876, 0, 0, 0, 1, 1,
1.149727, 0.7459815, -0.1601364, 0, 0, 0, 1, 1,
1.157208, -0.1157562, 2.846657, 0, 0, 0, 1, 1,
1.158149, -1.284653, 2.565666, 0, 0, 0, 1, 1,
1.180802, -0.2869551, 3.237418, 1, 1, 1, 1, 1,
1.188625, 0.1833996, 1.428068, 1, 1, 1, 1, 1,
1.200488, -1.449705, 2.881375, 1, 1, 1, 1, 1,
1.204863, 0.2505153, 1.740406, 1, 1, 1, 1, 1,
1.20691, 1.017933, 0.1460519, 1, 1, 1, 1, 1,
1.215243, -1.004173, 2.248975, 1, 1, 1, 1, 1,
1.227696, -0.0887439, 3.624017, 1, 1, 1, 1, 1,
1.228803, -1.024558, 1.881285, 1, 1, 1, 1, 1,
1.230257, 0.3096021, 0.2575608, 1, 1, 1, 1, 1,
1.232617, -0.1426939, 2.077694, 1, 1, 1, 1, 1,
1.241871, -0.4703633, 0.7361863, 1, 1, 1, 1, 1,
1.243256, -1.606009, 2.65397, 1, 1, 1, 1, 1,
1.244134, -0.6247094, 1.734749, 1, 1, 1, 1, 1,
1.250085, -0.1063984, 3.086411, 1, 1, 1, 1, 1,
1.253059, 0.7980822, 1.985814, 1, 1, 1, 1, 1,
1.261918, 0.4184321, 2.169704, 0, 0, 1, 1, 1,
1.261923, 0.5500052, 0.1333345, 1, 0, 0, 1, 1,
1.268286, -0.8916231, 2.107846, 1, 0, 0, 1, 1,
1.277531, -0.05057316, 0.4420179, 1, 0, 0, 1, 1,
1.284704, 0.4347534, 1.219378, 1, 0, 0, 1, 1,
1.299057, 1.104002, 0.801459, 1, 0, 0, 1, 1,
1.300173, -1.383036, 2.835745, 0, 0, 0, 1, 1,
1.301367, -1.026224, 2.868152, 0, 0, 0, 1, 1,
1.303695, 0.5686296, 1.276152, 0, 0, 0, 1, 1,
1.309009, -0.6037291, 2.312371, 0, 0, 0, 1, 1,
1.309561, 0.3674895, 0.3538947, 0, 0, 0, 1, 1,
1.311267, -1.406346, 2.242172, 0, 0, 0, 1, 1,
1.312236, -1.248321, 2.415956, 0, 0, 0, 1, 1,
1.314947, 1.444784, 0.05139461, 1, 1, 1, 1, 1,
1.315809, 1.212713, 1.657653, 1, 1, 1, 1, 1,
1.321607, -0.5708532, 1.905663, 1, 1, 1, 1, 1,
1.324029, 1.174435, 0.1612861, 1, 1, 1, 1, 1,
1.328267, 1.467244, 0.2944855, 1, 1, 1, 1, 1,
1.360366, -0.1620925, 0.3056335, 1, 1, 1, 1, 1,
1.361347, -2.06266, 0.4953473, 1, 1, 1, 1, 1,
1.361441, -1.455786, 3.53702, 1, 1, 1, 1, 1,
1.361449, -1.664343, 2.507382, 1, 1, 1, 1, 1,
1.363739, 0.2115373, 0.789469, 1, 1, 1, 1, 1,
1.370616, 0.438414, -0.07938717, 1, 1, 1, 1, 1,
1.370909, -1.250693, 1.870333, 1, 1, 1, 1, 1,
1.372891, -0.4359946, 1.342272, 1, 1, 1, 1, 1,
1.39949, -0.3201116, 1.55354, 1, 1, 1, 1, 1,
1.401459, 0.3260638, 0.3232174, 1, 1, 1, 1, 1,
1.414748, 1.071243, 1.388099, 0, 0, 1, 1, 1,
1.43154, -0.3142788, 2.712092, 1, 0, 0, 1, 1,
1.438129, -0.8897683, 1.448715, 1, 0, 0, 1, 1,
1.4512, -0.2106685, 1.357767, 1, 0, 0, 1, 1,
1.473119, -0.04929973, 2.081153, 1, 0, 0, 1, 1,
1.481314, -2.555593, 3.496786, 1, 0, 0, 1, 1,
1.491629, 0.2445354, 0.725713, 0, 0, 0, 1, 1,
1.50871, 0.6922323, 2.729548, 0, 0, 0, 1, 1,
1.516179, 1.359648, 0.1744198, 0, 0, 0, 1, 1,
1.5206, 1.596452, 2.296762, 0, 0, 0, 1, 1,
1.52144, 1.304699, -0.3211742, 0, 0, 0, 1, 1,
1.541655, -0.2488324, -0.6306044, 0, 0, 0, 1, 1,
1.541943, 0.7757064, 2.309984, 0, 0, 0, 1, 1,
1.555214, -0.0758817, 1.565292, 1, 1, 1, 1, 1,
1.560747, 0.244482, 2.031353, 1, 1, 1, 1, 1,
1.56806, 0.9648771, 0.9682612, 1, 1, 1, 1, 1,
1.569319, 0.7262679, 1.652178, 1, 1, 1, 1, 1,
1.579068, 0.5042889, 1.562123, 1, 1, 1, 1, 1,
1.579358, -1.46006, 1.414951, 1, 1, 1, 1, 1,
1.590425, -0.399122, 1.301429, 1, 1, 1, 1, 1,
1.601744, -1.195461, -0.1103175, 1, 1, 1, 1, 1,
1.602137, 0.5237765, 1.402335, 1, 1, 1, 1, 1,
1.603055, -0.1696676, 0.9139274, 1, 1, 1, 1, 1,
1.603744, 1.169134, -1.052376, 1, 1, 1, 1, 1,
1.614596, 0.7864119, 1.612011, 1, 1, 1, 1, 1,
1.621148, -0.3640611, -0.2402435, 1, 1, 1, 1, 1,
1.627791, 1.041964, -0.4054778, 1, 1, 1, 1, 1,
1.631141, 0.9066963, 2.220224, 1, 1, 1, 1, 1,
1.642338, -1.41488, 2.035197, 0, 0, 1, 1, 1,
1.65188, -2.731157, 2.227863, 1, 0, 0, 1, 1,
1.657019, 0.1494762, 2.105777, 1, 0, 0, 1, 1,
1.661745, 0.3371583, 1.813008, 1, 0, 0, 1, 1,
1.665846, -0.07328036, 0.08246577, 1, 0, 0, 1, 1,
1.667492, -0.3901123, 3.99368, 1, 0, 0, 1, 1,
1.671263, -0.2140379, 2.605293, 0, 0, 0, 1, 1,
1.677227, -0.2639448, 1.195981, 0, 0, 0, 1, 1,
1.69013, -0.4838171, 1.427661, 0, 0, 0, 1, 1,
1.701775, -0.3531508, 0.7575407, 0, 0, 0, 1, 1,
1.704467, -2.547441, 4.245538, 0, 0, 0, 1, 1,
1.704978, -0.9068093, 1.69433, 0, 0, 0, 1, 1,
1.714262, 0.3313349, 2.400913, 0, 0, 0, 1, 1,
1.764815, 1.163939, 1.041607, 1, 1, 1, 1, 1,
1.76684, -0.9268284, 4.088403, 1, 1, 1, 1, 1,
1.775048, 0.1184841, 0.4977238, 1, 1, 1, 1, 1,
1.77976, 0.7382817, 0.630986, 1, 1, 1, 1, 1,
1.789057, 0.2646695, 0.4595195, 1, 1, 1, 1, 1,
1.812083, -1.734607, 1.838817, 1, 1, 1, 1, 1,
1.848112, 0.1038344, 1.731592, 1, 1, 1, 1, 1,
1.866213, -1.58346, 2.480412, 1, 1, 1, 1, 1,
1.868969, -1.075364, 2.239456, 1, 1, 1, 1, 1,
1.871428, 0.8721941, -1.585615, 1, 1, 1, 1, 1,
1.87851, -0.7308505, 1.784773, 1, 1, 1, 1, 1,
1.89518, -1.783659, 1.403541, 1, 1, 1, 1, 1,
1.931115, -0.001364752, 1.882333, 1, 1, 1, 1, 1,
1.935103, -1.035267, 1.274409, 1, 1, 1, 1, 1,
1.953567, 0.8593073, 3.571504, 1, 1, 1, 1, 1,
1.962876, -0.4675526, 2.789908, 0, 0, 1, 1, 1,
1.978427, -1.114515, 1.405661, 1, 0, 0, 1, 1,
1.992673, -0.736701, 2.322281, 1, 0, 0, 1, 1,
2.006403, 1.153529, 1.742034, 1, 0, 0, 1, 1,
2.038005, 0.1208894, 0.142416, 1, 0, 0, 1, 1,
2.145566, 0.7476316, 1.217837, 1, 0, 0, 1, 1,
2.183067, 1.502401, -0.2397244, 0, 0, 0, 1, 1,
2.215293, -0.09751007, 1.857316, 0, 0, 0, 1, 1,
2.234214, -0.8527021, 1.735407, 0, 0, 0, 1, 1,
2.239581, 0.04849154, 1.265709, 0, 0, 0, 1, 1,
2.261013, 0.9225501, 1.217769, 0, 0, 0, 1, 1,
2.294135, 0.3128122, 1.115818, 0, 0, 0, 1, 1,
2.322636, -1.066681, 2.150358, 0, 0, 0, 1, 1,
2.403771, -1.07294, 1.129105, 1, 1, 1, 1, 1,
2.440658, -0.4617334, 1.417224, 1, 1, 1, 1, 1,
2.570022, 0.5561724, 1.956132, 1, 1, 1, 1, 1,
2.624409, 0.6354377, 0.724591, 1, 1, 1, 1, 1,
2.759696, -0.07317901, 2.964666, 1, 1, 1, 1, 1,
2.949369, 0.171419, 1.998442, 1, 1, 1, 1, 1,
3.298317, 0.8851908, 3.076177, 1, 1, 1, 1, 1
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
var radius = 9.755697;
var distance = 34.26647;
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
mvMatrix.translate( -0.09443188, -0.3259621, -0.3654928 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.26647);
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
