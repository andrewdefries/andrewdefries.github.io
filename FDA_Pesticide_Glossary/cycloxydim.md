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
-2.586548, -0.9216139, -2.227212, 1, 0, 0, 1,
-2.58225, -0.2768239, 0.2566351, 1, 0.007843138, 0, 1,
-2.422201, -0.08172777, -2.483927, 1, 0.01176471, 0, 1,
-2.398945, -0.2337095, -1.579129, 1, 0.01960784, 0, 1,
-2.33164, 2.033215, -0.7945544, 1, 0.02352941, 0, 1,
-2.259947, -2.124106, -2.907585, 1, 0.03137255, 0, 1,
-2.250178, -0.4982111, -0.4472637, 1, 0.03529412, 0, 1,
-2.215562, 2.649747, 0.647214, 1, 0.04313726, 0, 1,
-2.180977, -0.3754185, -1.874677, 1, 0.04705882, 0, 1,
-2.159652, 1.081378, -0.9299144, 1, 0.05490196, 0, 1,
-2.159078, -0.2165058, 0.07029685, 1, 0.05882353, 0, 1,
-2.146139, 0.6438645, -0.2195471, 1, 0.06666667, 0, 1,
-2.144656, -0.4154728, 1.355192, 1, 0.07058824, 0, 1,
-2.112606, -0.9169634, -0.5296707, 1, 0.07843138, 0, 1,
-2.060791, 0.1021683, -1.949385, 1, 0.08235294, 0, 1,
-2.033158, -0.8011833, -1.863114, 1, 0.09019608, 0, 1,
-1.997499, -0.509581, -1.453122, 1, 0.09411765, 0, 1,
-1.980249, 0.08979409, -0.4485324, 1, 0.1019608, 0, 1,
-1.895527, 1.30764, -1.711216, 1, 0.1098039, 0, 1,
-1.893866, -0.9107271, -0.6960819, 1, 0.1137255, 0, 1,
-1.871111, -0.9288519, -2.053268, 1, 0.1215686, 0, 1,
-1.861724, -0.218355, -2.397922, 1, 0.1254902, 0, 1,
-1.830938, -0.6910654, -3.033868, 1, 0.1333333, 0, 1,
-1.824036, -1.181876, -0.1670541, 1, 0.1372549, 0, 1,
-1.823865, 1.694676, -1.453312, 1, 0.145098, 0, 1,
-1.819818, 0.2156798, -2.346504, 1, 0.1490196, 0, 1,
-1.780728, -1.37946, -2.711244, 1, 0.1568628, 0, 1,
-1.770626, 0.3728439, 0.1644545, 1, 0.1607843, 0, 1,
-1.767686, 0.5942465, -1.183551, 1, 0.1686275, 0, 1,
-1.743355, -1.339059, -2.348483, 1, 0.172549, 0, 1,
-1.736901, -0.1325459, -1.503921, 1, 0.1803922, 0, 1,
-1.730377, 2.5427, 0.8913566, 1, 0.1843137, 0, 1,
-1.727926, 0.2435931, -0.5904319, 1, 0.1921569, 0, 1,
-1.725726, -2.31376, -2.701235, 1, 0.1960784, 0, 1,
-1.722838, -0.8481846, -2.529477, 1, 0.2039216, 0, 1,
-1.719945, 1.212345, -0.8409571, 1, 0.2117647, 0, 1,
-1.698065, -1.348881, -2.603142, 1, 0.2156863, 0, 1,
-1.686352, -0.9409552, -2.492782, 1, 0.2235294, 0, 1,
-1.671013, -2.215186, -2.778985, 1, 0.227451, 0, 1,
-1.650798, 2.215159, -0.07277562, 1, 0.2352941, 0, 1,
-1.644951, -0.6655275, -1.70948, 1, 0.2392157, 0, 1,
-1.638644, 0.3596959, 0.8257142, 1, 0.2470588, 0, 1,
-1.625907, 0.2665264, -1.461226, 1, 0.2509804, 0, 1,
-1.614138, -1.984255, -1.525773, 1, 0.2588235, 0, 1,
-1.612885, -0.138073, -1.466656, 1, 0.2627451, 0, 1,
-1.592542, -0.04037521, -3.208836, 1, 0.2705882, 0, 1,
-1.592487, 0.125789, -2.222485, 1, 0.2745098, 0, 1,
-1.590756, 1.747176, -0.2977383, 1, 0.282353, 0, 1,
-1.579581, 0.260993, -1.869508, 1, 0.2862745, 0, 1,
-1.572693, -1.178591, -2.768198, 1, 0.2941177, 0, 1,
-1.565155, 0.652078, -3.237329, 1, 0.3019608, 0, 1,
-1.557843, -1.024725, -2.773718, 1, 0.3058824, 0, 1,
-1.556739, 0.6835692, -2.283947, 1, 0.3137255, 0, 1,
-1.541599, 0.8155996, 0.1651585, 1, 0.3176471, 0, 1,
-1.52349, 0.09588091, -1.091069, 1, 0.3254902, 0, 1,
-1.516014, 0.07758518, -1.131513, 1, 0.3294118, 0, 1,
-1.504229, -1.537985, -2.636058, 1, 0.3372549, 0, 1,
-1.499002, 0.2508109, -1.288392, 1, 0.3411765, 0, 1,
-1.480619, -0.1137334, -2.100164, 1, 0.3490196, 0, 1,
-1.474738, -1.233811, -1.925709, 1, 0.3529412, 0, 1,
-1.47429, -0.9390885, -3.412284, 1, 0.3607843, 0, 1,
-1.464444, 1.035835, -0.3386435, 1, 0.3647059, 0, 1,
-1.439668, -0.4494829, -1.841884, 1, 0.372549, 0, 1,
-1.428847, 1.550105, -0.4581139, 1, 0.3764706, 0, 1,
-1.414184, 0.08225794, -1.833605, 1, 0.3843137, 0, 1,
-1.410624, 0.4898514, -2.453361, 1, 0.3882353, 0, 1,
-1.406346, 1.891613, -0.7040378, 1, 0.3960784, 0, 1,
-1.39819, 0.6270363, -2.48627, 1, 0.4039216, 0, 1,
-1.392594, 0.6179773, -2.235975, 1, 0.4078431, 0, 1,
-1.387311, 0.2941616, -1.725489, 1, 0.4156863, 0, 1,
-1.37235, -0.9501822, -1.652953, 1, 0.4196078, 0, 1,
-1.372167, 0.7424256, -0.6407105, 1, 0.427451, 0, 1,
-1.371123, 0.6782967, -0.3466501, 1, 0.4313726, 0, 1,
-1.365601, 0.7031975, 0.3514699, 1, 0.4392157, 0, 1,
-1.347785, -0.1204615, -2.606766, 1, 0.4431373, 0, 1,
-1.347056, -0.3173696, -3.352806, 1, 0.4509804, 0, 1,
-1.345357, 0.3031963, -0.1208323, 1, 0.454902, 0, 1,
-1.343204, -0.7287999, -2.063949, 1, 0.4627451, 0, 1,
-1.337012, -0.06779784, -0.541115, 1, 0.4666667, 0, 1,
-1.331545, 0.6072767, -2.537021, 1, 0.4745098, 0, 1,
-1.331306, -1.382005, 0.1850592, 1, 0.4784314, 0, 1,
-1.326704, -0.8299647, -4.207264, 1, 0.4862745, 0, 1,
-1.324803, -0.2319383, -0.8065464, 1, 0.4901961, 0, 1,
-1.310721, 0.237336, -3.006558, 1, 0.4980392, 0, 1,
-1.308225, -1.839082, -4.230237, 1, 0.5058824, 0, 1,
-1.286775, 0.5624791, -1.282037, 1, 0.509804, 0, 1,
-1.285581, 1.064234, -2.640943, 1, 0.5176471, 0, 1,
-1.281493, 1.089063, -2.000819, 1, 0.5215687, 0, 1,
-1.280168, 1.090871, -1.274126, 1, 0.5294118, 0, 1,
-1.278228, 0.9054874, -1.168776, 1, 0.5333334, 0, 1,
-1.276781, 0.1410224, -3.163225, 1, 0.5411765, 0, 1,
-1.270341, 0.08113211, 0.2590185, 1, 0.5450981, 0, 1,
-1.269587, 0.2921649, -0.5234063, 1, 0.5529412, 0, 1,
-1.268787, -2.222513, -2.692738, 1, 0.5568628, 0, 1,
-1.264565, 0.4407673, -1.079144, 1, 0.5647059, 0, 1,
-1.251712, -1.587187, -2.313178, 1, 0.5686275, 0, 1,
-1.249889, 1.748977, 0.2193367, 1, 0.5764706, 0, 1,
-1.244997, 0.8411339, 0.7670021, 1, 0.5803922, 0, 1,
-1.23489, 0.6046576, -0.3112882, 1, 0.5882353, 0, 1,
-1.232172, -1.028914, -1.621383, 1, 0.5921569, 0, 1,
-1.228596, -0.04455739, -0.4381451, 1, 0.6, 0, 1,
-1.225812, 1.363981, -1.108963, 1, 0.6078432, 0, 1,
-1.219973, 1.234186, -0.5143128, 1, 0.6117647, 0, 1,
-1.213971, 0.4974824, -0.5918847, 1, 0.6196079, 0, 1,
-1.212211, 2.118423, -0.3756771, 1, 0.6235294, 0, 1,
-1.207766, 0.9125423, -0.2683408, 1, 0.6313726, 0, 1,
-1.190724, -0.9610302, -1.990007, 1, 0.6352941, 0, 1,
-1.18936, -0.2068735, -2.636623, 1, 0.6431373, 0, 1,
-1.183564, -1.68374, -2.828715, 1, 0.6470588, 0, 1,
-1.182616, -0.04311309, -1.954373, 1, 0.654902, 0, 1,
-1.181938, 0.6917637, -0.3482402, 1, 0.6588235, 0, 1,
-1.180104, 0.4392484, -1.295087, 1, 0.6666667, 0, 1,
-1.175161, 0.1668954, -1.557244, 1, 0.6705883, 0, 1,
-1.170609, 1.3244, 0.7597683, 1, 0.6784314, 0, 1,
-1.170043, 0.4836744, -0.5439656, 1, 0.682353, 0, 1,
-1.167781, -0.8053737, -1.938824, 1, 0.6901961, 0, 1,
-1.166397, -1.004362, -1.98772, 1, 0.6941177, 0, 1,
-1.164303, 0.6085116, -0.240163, 1, 0.7019608, 0, 1,
-1.162203, 0.4265361, -1.781587, 1, 0.7098039, 0, 1,
-1.156591, -2.356843, -1.619103, 1, 0.7137255, 0, 1,
-1.151528, 0.9637356, -1.340077, 1, 0.7215686, 0, 1,
-1.150988, -0.1491218, -1.797989, 1, 0.7254902, 0, 1,
-1.144302, 0.4300388, -2.191887, 1, 0.7333333, 0, 1,
-1.138764, 2.350173, 1.157542, 1, 0.7372549, 0, 1,
-1.129661, -1.97645, -1.882858, 1, 0.7450981, 0, 1,
-1.120563, 0.4075125, -0.503114, 1, 0.7490196, 0, 1,
-1.120347, 0.4075138, -2.293381, 1, 0.7568628, 0, 1,
-1.112511, -0.04500176, -0.7465928, 1, 0.7607843, 0, 1,
-1.110719, 0.3642973, -0.8598744, 1, 0.7686275, 0, 1,
-1.1106, -1.688553, -2.51587, 1, 0.772549, 0, 1,
-1.105218, 1.060509, -0.3847853, 1, 0.7803922, 0, 1,
-1.100494, -1.196725, -2.104904, 1, 0.7843137, 0, 1,
-1.100387, -0.1465492, -0.6768509, 1, 0.7921569, 0, 1,
-1.09655, -2.034949, -1.610582, 1, 0.7960784, 0, 1,
-1.096022, 0.328916, -1.345198, 1, 0.8039216, 0, 1,
-1.094583, 1.172377, -0.1805441, 1, 0.8117647, 0, 1,
-1.088355, -0.5030738, -1.935751, 1, 0.8156863, 0, 1,
-1.085253, -0.01474073, -2.030282, 1, 0.8235294, 0, 1,
-1.081999, 2.062206, -0.9393542, 1, 0.827451, 0, 1,
-1.079234, 0.4371749, -0.5379074, 1, 0.8352941, 0, 1,
-1.0772, 0.6059595, -0.3820485, 1, 0.8392157, 0, 1,
-1.073041, -1.530781, -1.675858, 1, 0.8470588, 0, 1,
-1.068392, -0.8147969, -2.150373, 1, 0.8509804, 0, 1,
-1.066401, -0.4074353, -0.2368541, 1, 0.8588235, 0, 1,
-1.063728, 1.276545, 0.6559591, 1, 0.8627451, 0, 1,
-1.062603, 1.792136, -1.004455, 1, 0.8705882, 0, 1,
-1.058526, -0.6482635, -1.501683, 1, 0.8745098, 0, 1,
-1.057245, -0.3666389, -0.863774, 1, 0.8823529, 0, 1,
-1.048881, 0.03542243, -2.352348, 1, 0.8862745, 0, 1,
-1.048499, 1.485364, -0.2747629, 1, 0.8941177, 0, 1,
-1.047702, -1.242193, -1.993118, 1, 0.8980392, 0, 1,
-1.044186, 0.08147456, -2.852612, 1, 0.9058824, 0, 1,
-1.043223, -1.31795, -1.886987, 1, 0.9137255, 0, 1,
-1.043029, 0.08104628, -2.313165, 1, 0.9176471, 0, 1,
-1.042275, -0.4652835, -2.695641, 1, 0.9254902, 0, 1,
-1.041908, -0.6432557, -4.508636, 1, 0.9294118, 0, 1,
-1.03803, -0.2557294, -0.9786721, 1, 0.9372549, 0, 1,
-1.037309, -1.423682, -1.921632, 1, 0.9411765, 0, 1,
-1.027454, -1.309379, -3.017061, 1, 0.9490196, 0, 1,
-1.025349, -0.9165242, -0.9067716, 1, 0.9529412, 0, 1,
-1.024909, -1.36555, -1.70749, 1, 0.9607843, 0, 1,
-1.016006, 1.352548, -0.77541, 1, 0.9647059, 0, 1,
-1.013714, 1.624525, -0.5145237, 1, 0.972549, 0, 1,
-1.007052, 1.082771, -1.552152, 1, 0.9764706, 0, 1,
-0.9988672, -0.03095944, -1.392911, 1, 0.9843137, 0, 1,
-0.9907631, 0.8366323, -2.922173, 1, 0.9882353, 0, 1,
-0.9783617, -0.6108941, -3.020953, 1, 0.9960784, 0, 1,
-0.9772459, -0.2533667, -0.9802161, 0.9960784, 1, 0, 1,
-0.9752225, -0.2007948, -0.9931484, 0.9921569, 1, 0, 1,
-0.9715155, -0.6412332, -1.76502, 0.9843137, 1, 0, 1,
-0.9692982, -0.7754341, -2.477184, 0.9803922, 1, 0, 1,
-0.9682121, 0.4308539, -0.9329755, 0.972549, 1, 0, 1,
-0.9667163, -1.926984, -2.324685, 0.9686275, 1, 0, 1,
-0.9619486, -0.512156, -2.886797, 0.9607843, 1, 0, 1,
-0.9573529, -0.7744398, -1.784687, 0.9568627, 1, 0, 1,
-0.9527889, 0.2971791, -2.881642, 0.9490196, 1, 0, 1,
-0.9519895, -0.5170282, -2.577417, 0.945098, 1, 0, 1,
-0.9470648, -1.678601, -3.705943, 0.9372549, 1, 0, 1,
-0.9356095, -0.2332719, -1.241118, 0.9333333, 1, 0, 1,
-0.9338579, 3.624484, -0.8906156, 0.9254902, 1, 0, 1,
-0.9332657, -0.2829657, -3.091761, 0.9215686, 1, 0, 1,
-0.9303214, 0.4440306, -2.023237, 0.9137255, 1, 0, 1,
-0.9293071, -0.8977335, -2.208065, 0.9098039, 1, 0, 1,
-0.9288538, 0.1833485, -2.485441, 0.9019608, 1, 0, 1,
-0.9287124, 1.034035, 0.1647991, 0.8941177, 1, 0, 1,
-0.9280189, -3.109935, -3.300995, 0.8901961, 1, 0, 1,
-0.9247615, 0.9782189, -0.4768361, 0.8823529, 1, 0, 1,
-0.9176343, -0.375461, -1.834769, 0.8784314, 1, 0, 1,
-0.9151158, -0.3895214, -1.701762, 0.8705882, 1, 0, 1,
-0.9071254, 0.6319228, -2.481251, 0.8666667, 1, 0, 1,
-0.8911945, 0.6917638, -0.3373711, 0.8588235, 1, 0, 1,
-0.8908038, 1.56764, -0.5085281, 0.854902, 1, 0, 1,
-0.8847409, 0.1799011, -2.297881, 0.8470588, 1, 0, 1,
-0.8809734, 1.730509, -0.2982517, 0.8431373, 1, 0, 1,
-0.8806875, -0.4558503, -2.615641, 0.8352941, 1, 0, 1,
-0.8682595, -0.6626086, -3.563965, 0.8313726, 1, 0, 1,
-0.8646056, 1.135269, 0.09838818, 0.8235294, 1, 0, 1,
-0.8631786, 0.106009, -0.371742, 0.8196079, 1, 0, 1,
-0.8579162, 0.067517, -2.364961, 0.8117647, 1, 0, 1,
-0.8524099, -0.4686831, -1.644902, 0.8078431, 1, 0, 1,
-0.8444994, 1.475326, -1.90301, 0.8, 1, 0, 1,
-0.8395261, 0.482479, 0.19198, 0.7921569, 1, 0, 1,
-0.8361561, 1.999062, -1.795046, 0.7882353, 1, 0, 1,
-0.8354464, -1.24657, -1.713298, 0.7803922, 1, 0, 1,
-0.8320917, -0.2923939, -3.054322, 0.7764706, 1, 0, 1,
-0.8202839, -1.263637, -1.959532, 0.7686275, 1, 0, 1,
-0.8194737, 0.9337465, -1.385027, 0.7647059, 1, 0, 1,
-0.8170315, 0.1982542, -0.9415926, 0.7568628, 1, 0, 1,
-0.8119312, -1.199898, -2.36382, 0.7529412, 1, 0, 1,
-0.8044204, -0.1147353, -0.09811606, 0.7450981, 1, 0, 1,
-0.8043154, -0.1767187, -2.688132, 0.7411765, 1, 0, 1,
-0.7991809, 0.5067036, -0.2287679, 0.7333333, 1, 0, 1,
-0.7947412, -0.5174932, -2.043529, 0.7294118, 1, 0, 1,
-0.7932442, 0.4623812, -3.260974, 0.7215686, 1, 0, 1,
-0.7925357, 0.6025807, -1.08891, 0.7176471, 1, 0, 1,
-0.7910531, 0.7960189, 0.141623, 0.7098039, 1, 0, 1,
-0.7867677, -0.5231728, -2.895896, 0.7058824, 1, 0, 1,
-0.7857345, 0.6236808, -0.7724758, 0.6980392, 1, 0, 1,
-0.7804447, -1.256435, -4.033886, 0.6901961, 1, 0, 1,
-0.7660855, 0.148132, -1.334821, 0.6862745, 1, 0, 1,
-0.7660136, -0.456389, -3.103714, 0.6784314, 1, 0, 1,
-0.7642844, -1.326998, -2.769506, 0.6745098, 1, 0, 1,
-0.7642727, -0.6455393, -2.042992, 0.6666667, 1, 0, 1,
-0.7642049, 0.05973975, -1.901039, 0.6627451, 1, 0, 1,
-0.7633, 0.171772, -1.843637, 0.654902, 1, 0, 1,
-0.7615964, 0.8996077, -3.842716, 0.6509804, 1, 0, 1,
-0.7575079, 0.02578617, -2.775666, 0.6431373, 1, 0, 1,
-0.7547252, 1.182124, 0.2720152, 0.6392157, 1, 0, 1,
-0.7477595, 0.9781818, -1.104206, 0.6313726, 1, 0, 1,
-0.7468984, 0.4193825, -0.1287897, 0.627451, 1, 0, 1,
-0.7458113, -1.7044, -2.517131, 0.6196079, 1, 0, 1,
-0.741208, -1.041784, -1.076014, 0.6156863, 1, 0, 1,
-0.7398506, -1.038741, -2.521878, 0.6078432, 1, 0, 1,
-0.7336829, 0.8243952, -1.290927, 0.6039216, 1, 0, 1,
-0.7285281, 2.39061, -0.6951351, 0.5960785, 1, 0, 1,
-0.7152368, 0.1761449, 0.3062722, 0.5882353, 1, 0, 1,
-0.7132297, 0.3194841, -1.447007, 0.5843138, 1, 0, 1,
-0.7113134, 0.4640336, -1.92433, 0.5764706, 1, 0, 1,
-0.7079164, 0.08331807, -0.7210944, 0.572549, 1, 0, 1,
-0.7001426, -0.4222128, -1.387451, 0.5647059, 1, 0, 1,
-0.6958824, 1.040802, -0.8351519, 0.5607843, 1, 0, 1,
-0.6898566, 0.1045304, -2.963623, 0.5529412, 1, 0, 1,
-0.6796175, 0.781578, -0.3987108, 0.5490196, 1, 0, 1,
-0.6793658, 0.3633004, -1.655396, 0.5411765, 1, 0, 1,
-0.6785031, -0.1610776, -1.108246, 0.5372549, 1, 0, 1,
-0.676891, 0.8216438, 0.1210657, 0.5294118, 1, 0, 1,
-0.6749569, -1.129153, -2.134141, 0.5254902, 1, 0, 1,
-0.6747963, 1.167958, -0.5043225, 0.5176471, 1, 0, 1,
-0.6704919, 0.4054597, -0.951884, 0.5137255, 1, 0, 1,
-0.6680834, 0.6664104, -1.511706, 0.5058824, 1, 0, 1,
-0.667856, -2.528962, -2.09967, 0.5019608, 1, 0, 1,
-0.6667007, -0.4430847, 0.3943149, 0.4941176, 1, 0, 1,
-0.6537993, -0.8485542, -4.095936, 0.4862745, 1, 0, 1,
-0.6503146, -1.050767, -2.581977, 0.4823529, 1, 0, 1,
-0.6470037, 0.6373729, 0.1719711, 0.4745098, 1, 0, 1,
-0.6442057, 0.1078842, -0.1183614, 0.4705882, 1, 0, 1,
-0.6412182, -0.0007024192, -2.177392, 0.4627451, 1, 0, 1,
-0.6388909, 1.108661, -1.618107, 0.4588235, 1, 0, 1,
-0.638743, -0.6002715, -2.96458, 0.4509804, 1, 0, 1,
-0.6377957, 1.429976, 0.9510005, 0.4470588, 1, 0, 1,
-0.6369049, 1.012336, -0.7497375, 0.4392157, 1, 0, 1,
-0.6360481, -0.4328524, -1.261893, 0.4352941, 1, 0, 1,
-0.6337337, -0.6797008, -1.884333, 0.427451, 1, 0, 1,
-0.6322756, 0.972074, -0.4298081, 0.4235294, 1, 0, 1,
-0.6317376, -1.340297, -0.6054956, 0.4156863, 1, 0, 1,
-0.6312427, 1.106192, -2.060279, 0.4117647, 1, 0, 1,
-0.621511, 1.776963, -0.8950402, 0.4039216, 1, 0, 1,
-0.621084, -1.128433, -1.734049, 0.3960784, 1, 0, 1,
-0.6204058, 1.214149, 2.239182, 0.3921569, 1, 0, 1,
-0.6182042, -0.8260462, -3.991667, 0.3843137, 1, 0, 1,
-0.6178496, -1.363554, -2.558928, 0.3803922, 1, 0, 1,
-0.6165106, -1.921695, -4.139305, 0.372549, 1, 0, 1,
-0.6154487, 0.7988597, -1.137094, 0.3686275, 1, 0, 1,
-0.6104217, -0.5338957, -0.07344609, 0.3607843, 1, 0, 1,
-0.6077608, 0.9720868, 0.4207813, 0.3568628, 1, 0, 1,
-0.6063157, -0.01229393, -0.1290595, 0.3490196, 1, 0, 1,
-0.6055008, -1.740052, -2.903346, 0.345098, 1, 0, 1,
-0.6033314, -2.03845, -2.610308, 0.3372549, 1, 0, 1,
-0.6028487, 0.4846438, -1.771659, 0.3333333, 1, 0, 1,
-0.6012912, 0.357152, -0.1081236, 0.3254902, 1, 0, 1,
-0.5866684, -0.3636588, -2.516689, 0.3215686, 1, 0, 1,
-0.5866309, 0.7348391, 2.203738, 0.3137255, 1, 0, 1,
-0.5842496, 1.82646, 2.967908, 0.3098039, 1, 0, 1,
-0.5830992, -0.09379772, -0.9048771, 0.3019608, 1, 0, 1,
-0.5761745, 0.0950339, -1.689101, 0.2941177, 1, 0, 1,
-0.573738, 1.105924, 1.149733, 0.2901961, 1, 0, 1,
-0.57262, -0.1003755, -0.6349492, 0.282353, 1, 0, 1,
-0.5716825, -0.4919799, -2.902865, 0.2784314, 1, 0, 1,
-0.5716442, 1.572351, 1.942267, 0.2705882, 1, 0, 1,
-0.5664932, -1.038741, -4.759807, 0.2666667, 1, 0, 1,
-0.5661102, 0.8325899, 1.167552, 0.2588235, 1, 0, 1,
-0.5638574, -0.01496261, -2.316396, 0.254902, 1, 0, 1,
-0.5502518, -0.05494857, -1.985952, 0.2470588, 1, 0, 1,
-0.5421714, 0.1896998, -0.5363972, 0.2431373, 1, 0, 1,
-0.5401924, -0.4159766, -2.130511, 0.2352941, 1, 0, 1,
-0.5369291, 1.194106, 0.6962464, 0.2313726, 1, 0, 1,
-0.5284992, -1.11939, -3.814713, 0.2235294, 1, 0, 1,
-0.5276338, -0.02247156, -0.4324327, 0.2196078, 1, 0, 1,
-0.527504, 2.461615, 0.5618413, 0.2117647, 1, 0, 1,
-0.5265876, -1.493279, -2.385098, 0.2078431, 1, 0, 1,
-0.5258954, -1.194672, -3.050272, 0.2, 1, 0, 1,
-0.5207317, 1.040133, -1.012913, 0.1921569, 1, 0, 1,
-0.5200709, -0.03485803, -1.072328, 0.1882353, 1, 0, 1,
-0.5182132, 0.4327982, -0.5248218, 0.1803922, 1, 0, 1,
-0.516001, -1.536173, -3.660843, 0.1764706, 1, 0, 1,
-0.5144634, 0.004268975, -1.187463, 0.1686275, 1, 0, 1,
-0.5125387, -0.9689059, -1.893272, 0.1647059, 1, 0, 1,
-0.5124443, -1.473564, -1.159081, 0.1568628, 1, 0, 1,
-0.5121084, -0.299253, -2.094479, 0.1529412, 1, 0, 1,
-0.5118893, 2.635168, 0.5681404, 0.145098, 1, 0, 1,
-0.5095946, -0.7864524, -4.014633, 0.1411765, 1, 0, 1,
-0.5002624, 0.7964552, -0.5390097, 0.1333333, 1, 0, 1,
-0.4945657, -0.9857519, -0.3080157, 0.1294118, 1, 0, 1,
-0.4927881, -0.1807607, -2.152273, 0.1215686, 1, 0, 1,
-0.492324, -0.005588633, -1.673127, 0.1176471, 1, 0, 1,
-0.4862297, 0.8297751, -2.132574, 0.1098039, 1, 0, 1,
-0.480534, -1.080201, -3.807582, 0.1058824, 1, 0, 1,
-0.4780634, 1.185304, -1.455878, 0.09803922, 1, 0, 1,
-0.4723723, -0.2117259, -1.432291, 0.09019608, 1, 0, 1,
-0.4696674, -0.1600359, -2.377658, 0.08627451, 1, 0, 1,
-0.4695165, 1.391985, -0.8133065, 0.07843138, 1, 0, 1,
-0.4616109, 0.0911064, -1.704755, 0.07450981, 1, 0, 1,
-0.4537124, -0.2599993, -3.715222, 0.06666667, 1, 0, 1,
-0.4486779, -1.510223, -3.109591, 0.0627451, 1, 0, 1,
-0.4411941, 1.384507, -0.7336873, 0.05490196, 1, 0, 1,
-0.4380556, -0.8086153, -2.512576, 0.05098039, 1, 0, 1,
-0.433418, -1.796532, -3.492989, 0.04313726, 1, 0, 1,
-0.4310134, -0.5549449, -3.4249, 0.03921569, 1, 0, 1,
-0.4294628, -0.768855, -1.314277, 0.03137255, 1, 0, 1,
-0.4271812, -0.3239911, -2.774403, 0.02745098, 1, 0, 1,
-0.4257271, 1.254697, 1.58209, 0.01960784, 1, 0, 1,
-0.4230241, 0.2358508, -0.7375671, 0.01568628, 1, 0, 1,
-0.4220613, 0.8640232, -1.599637, 0.007843138, 1, 0, 1,
-0.4185548, -0.7087928, -2.108313, 0.003921569, 1, 0, 1,
-0.4145918, -0.7866308, -3.311359, 0, 1, 0.003921569, 1,
-0.4086519, -0.686586, -3.148511, 0, 1, 0.01176471, 1,
-0.4038838, 0.3172092, -2.314811, 0, 1, 0.01568628, 1,
-0.4013141, 1.080901, 0.3258257, 0, 1, 0.02352941, 1,
-0.4009559, -0.7229428, -3.487558, 0, 1, 0.02745098, 1,
-0.3990362, -0.3026415, -1.99536, 0, 1, 0.03529412, 1,
-0.3973588, -0.7689469, -4.63462, 0, 1, 0.03921569, 1,
-0.3964208, -0.2511179, -2.750158, 0, 1, 0.04705882, 1,
-0.3954388, -1.035997, -2.658139, 0, 1, 0.05098039, 1,
-0.3916513, 1.007513, -4.21147, 0, 1, 0.05882353, 1,
-0.39017, -0.1524358, -2.708383, 0, 1, 0.0627451, 1,
-0.3842649, 0.05650404, -1.77922, 0, 1, 0.07058824, 1,
-0.3839816, 0.6053078, -1.490197, 0, 1, 0.07450981, 1,
-0.3785657, 1.26564, -2.83831, 0, 1, 0.08235294, 1,
-0.3746894, -0.5612947, -4.290988, 0, 1, 0.08627451, 1,
-0.3722993, 0.2410709, -1.548847, 0, 1, 0.09411765, 1,
-0.3705178, 0.8146824, -1.852262, 0, 1, 0.1019608, 1,
-0.3685615, 0.9175882, 0.4294686, 0, 1, 0.1058824, 1,
-0.3571965, -0.5608848, -1.351895, 0, 1, 0.1137255, 1,
-0.3543336, 1.669402, -2.002683, 0, 1, 0.1176471, 1,
-0.3513522, -1.942877, -5.296456, 0, 1, 0.1254902, 1,
-0.3471859, 0.2669345, -0.007310377, 0, 1, 0.1294118, 1,
-0.3374974, 0.419657, -1.639338, 0, 1, 0.1372549, 1,
-0.3363903, 1.470235, 0.5218997, 0, 1, 0.1411765, 1,
-0.335704, -0.04555511, -1.355848, 0, 1, 0.1490196, 1,
-0.3349207, 0.4964351, 0.4842583, 0, 1, 0.1529412, 1,
-0.3340624, -1.581513, -4.317442, 0, 1, 0.1607843, 1,
-0.3277548, -1.182929, -3.978416, 0, 1, 0.1647059, 1,
-0.3236369, 0.2255386, -0.9261314, 0, 1, 0.172549, 1,
-0.3204919, -0.5219715, -2.438715, 0, 1, 0.1764706, 1,
-0.319066, 0.1558966, -0.9218746, 0, 1, 0.1843137, 1,
-0.314413, 0.9228759, -0.6126899, 0, 1, 0.1882353, 1,
-0.3114785, -1.03786, -2.185083, 0, 1, 0.1960784, 1,
-0.3103894, -0.06776226, -1.540495, 0, 1, 0.2039216, 1,
-0.3079346, 0.04013553, -1.997571, 0, 1, 0.2078431, 1,
-0.3029303, -1.489579, -4.490045, 0, 1, 0.2156863, 1,
-0.3027402, -1.174712, -3.806095, 0, 1, 0.2196078, 1,
-0.3022656, -1.850128, -3.134216, 0, 1, 0.227451, 1,
-0.2994188, 0.8459672, -0.2909769, 0, 1, 0.2313726, 1,
-0.2992306, 0.9460634, 1.189208, 0, 1, 0.2392157, 1,
-0.299087, -1.889461, -2.468385, 0, 1, 0.2431373, 1,
-0.2926929, 2.155344, 0.4753412, 0, 1, 0.2509804, 1,
-0.2893455, 0.3163389, -0.3923588, 0, 1, 0.254902, 1,
-0.2876624, -0.05284507, -0.1803098, 0, 1, 0.2627451, 1,
-0.2870234, -1.23472, -2.652778, 0, 1, 0.2666667, 1,
-0.2849386, 0.8480085, -2.314206, 0, 1, 0.2745098, 1,
-0.2819129, -0.8976511, -2.878152, 0, 1, 0.2784314, 1,
-0.2730854, 0.05586657, -1.512734, 0, 1, 0.2862745, 1,
-0.2705728, -0.604326, -3.762639, 0, 1, 0.2901961, 1,
-0.2674867, -1.061222, -4.173764, 0, 1, 0.2980392, 1,
-0.2655989, -0.8963245, -3.085927, 0, 1, 0.3058824, 1,
-0.2645466, 0.4755214, -1.13859, 0, 1, 0.3098039, 1,
-0.2628683, -0.5139635, -2.891008, 0, 1, 0.3176471, 1,
-0.2574465, 1.609586, -1.464266, 0, 1, 0.3215686, 1,
-0.2567226, -0.5552985, -2.346314, 0, 1, 0.3294118, 1,
-0.2535596, 0.05256946, -1.587683, 0, 1, 0.3333333, 1,
-0.2452289, 0.532942, -0.7056003, 0, 1, 0.3411765, 1,
-0.2435324, -0.4656603, -1.94884, 0, 1, 0.345098, 1,
-0.241737, -0.03502214, -1.654424, 0, 1, 0.3529412, 1,
-0.2397606, 0.07380888, -1.670844, 0, 1, 0.3568628, 1,
-0.2349076, 1.473357, 1.011378, 0, 1, 0.3647059, 1,
-0.2335122, 0.5377062, -1.911999, 0, 1, 0.3686275, 1,
-0.2332291, 1.637951, -0.2733832, 0, 1, 0.3764706, 1,
-0.2313861, 0.764865, -0.03115818, 0, 1, 0.3803922, 1,
-0.2302307, 1.469878, -0.09781253, 0, 1, 0.3882353, 1,
-0.2300226, 0.1662313, 0.4211518, 0, 1, 0.3921569, 1,
-0.2290338, 0.5327423, -0.959365, 0, 1, 0.4, 1,
-0.228586, -0.2006118, -1.7254, 0, 1, 0.4078431, 1,
-0.2274368, 0.3817278, -1.591513, 0, 1, 0.4117647, 1,
-0.2212769, -0.008784292, -1.321301, 0, 1, 0.4196078, 1,
-0.2176437, 0.7528633, 0.1171892, 0, 1, 0.4235294, 1,
-0.2143809, 0.984004, -0.366293, 0, 1, 0.4313726, 1,
-0.2141387, -0.9581933, -2.134889, 0, 1, 0.4352941, 1,
-0.2134658, 0.7124206, -0.1229561, 0, 1, 0.4431373, 1,
-0.2088711, 1.253033, 0.7236641, 0, 1, 0.4470588, 1,
-0.2071205, -0.4092382, -2.967668, 0, 1, 0.454902, 1,
-0.20681, 0.5489141, 0.5755954, 0, 1, 0.4588235, 1,
-0.2051211, -1.778668, -3.801277, 0, 1, 0.4666667, 1,
-0.2041434, 1.834041, 0.1194422, 0, 1, 0.4705882, 1,
-0.2001991, -1.430655, -3.329069, 0, 1, 0.4784314, 1,
-0.2001431, -0.7920325, -2.802685, 0, 1, 0.4823529, 1,
-0.1934224, -0.2383123, -2.447377, 0, 1, 0.4901961, 1,
-0.1898603, -0.5991169, -2.273776, 0, 1, 0.4941176, 1,
-0.184633, 0.7501829, -0.3352681, 0, 1, 0.5019608, 1,
-0.1834888, -1.071493, -3.56226, 0, 1, 0.509804, 1,
-0.181286, -0.4389369, -3.852423, 0, 1, 0.5137255, 1,
-0.181018, -0.2905306, -2.829015, 0, 1, 0.5215687, 1,
-0.1792226, 1.794366, -0.593026, 0, 1, 0.5254902, 1,
-0.1788328, 0.5506202, -1.527669, 0, 1, 0.5333334, 1,
-0.1765068, 0.5309437, -1.122951, 0, 1, 0.5372549, 1,
-0.175333, -1.051123, -2.110416, 0, 1, 0.5450981, 1,
-0.1729164, -1.469239, -2.594119, 0, 1, 0.5490196, 1,
-0.1724179, -0.5127918, -2.765938, 0, 1, 0.5568628, 1,
-0.1704244, 0.2321272, -0.1742104, 0, 1, 0.5607843, 1,
-0.1654643, 1.594708, 0.3100639, 0, 1, 0.5686275, 1,
-0.1653931, -0.01602337, -1.967901, 0, 1, 0.572549, 1,
-0.1650808, -1.355292, -2.990754, 0, 1, 0.5803922, 1,
-0.1589953, 0.04842774, -3.288596, 0, 1, 0.5843138, 1,
-0.1554224, -0.2609965, -3.363601, 0, 1, 0.5921569, 1,
-0.1524934, 1.471496, 0.9563464, 0, 1, 0.5960785, 1,
-0.1524403, -0.07741274, -2.539748, 0, 1, 0.6039216, 1,
-0.1511229, -1.843949, -4.580983, 0, 1, 0.6117647, 1,
-0.1447568, -0.855467, -2.970294, 0, 1, 0.6156863, 1,
-0.1409768, 0.1380875, -1.234605, 0, 1, 0.6235294, 1,
-0.1393532, -0.0933536, -3.047876, 0, 1, 0.627451, 1,
-0.1365851, 1.563791, -1.524647, 0, 1, 0.6352941, 1,
-0.1360159, -1.186319, -4.569354, 0, 1, 0.6392157, 1,
-0.1331376, -1.017372, -1.782064, 0, 1, 0.6470588, 1,
-0.1328096, 0.9784989, 0.4292452, 0, 1, 0.6509804, 1,
-0.1296702, 1.19658, -0.1339969, 0, 1, 0.6588235, 1,
-0.1294783, 0.4656377, -1.51123, 0, 1, 0.6627451, 1,
-0.1290757, 0.620644, 0.295915, 0, 1, 0.6705883, 1,
-0.1255484, -1.611821, -4.184949, 0, 1, 0.6745098, 1,
-0.1239373, -0.4228774, -4.130282, 0, 1, 0.682353, 1,
-0.1222596, -1.122906, -3.314397, 0, 1, 0.6862745, 1,
-0.1206744, -0.3890288, -3.442108, 0, 1, 0.6941177, 1,
-0.1205493, -0.007214759, -0.6609148, 0, 1, 0.7019608, 1,
-0.1190904, -0.9399982, -1.477924, 0, 1, 0.7058824, 1,
-0.1168375, 0.2847603, 0.2531024, 0, 1, 0.7137255, 1,
-0.1159498, -0.8761827, -3.442199, 0, 1, 0.7176471, 1,
-0.1140501, 0.991355, -1.046953, 0, 1, 0.7254902, 1,
-0.1132116, 1.226976, 0.9568275, 0, 1, 0.7294118, 1,
-0.1099073, 2.05258, -0.6345382, 0, 1, 0.7372549, 1,
-0.1090138, -0.6204757, -2.883675, 0, 1, 0.7411765, 1,
-0.1077013, -1.686039, -3.935339, 0, 1, 0.7490196, 1,
-0.102923, 0.156171, -2.604632, 0, 1, 0.7529412, 1,
-0.09920526, -0.5684987, -2.985124, 0, 1, 0.7607843, 1,
-0.09885499, -0.4412356, -2.035931, 0, 1, 0.7647059, 1,
-0.09828104, -0.2299452, -5.781361, 0, 1, 0.772549, 1,
-0.09795845, 0.1124797, -0.2389134, 0, 1, 0.7764706, 1,
-0.09715659, 1.117495, -0.685665, 0, 1, 0.7843137, 1,
-0.09292635, 0.07753657, -2.043471, 0, 1, 0.7882353, 1,
-0.08666357, 0.286039, -0.9671476, 0, 1, 0.7960784, 1,
-0.0800163, 0.8402298, 0.4503001, 0, 1, 0.8039216, 1,
-0.07998957, 0.8499261, -0.7590095, 0, 1, 0.8078431, 1,
-0.07680787, 0.3160862, -0.4677057, 0, 1, 0.8156863, 1,
-0.07567944, -0.5823107, -2.309345, 0, 1, 0.8196079, 1,
-0.07412431, -0.6115768, -2.74489, 0, 1, 0.827451, 1,
-0.0700928, -0.2539182, -2.515975, 0, 1, 0.8313726, 1,
-0.06704895, 0.5635191, 0.08698636, 0, 1, 0.8392157, 1,
-0.0658441, -0.7567461, -3.74141, 0, 1, 0.8431373, 1,
-0.06539718, -0.05387747, -3.722663, 0, 1, 0.8509804, 1,
-0.06346828, 0.3844903, 0.8742666, 0, 1, 0.854902, 1,
-0.05864792, 0.2785898, -0.7300014, 0, 1, 0.8627451, 1,
-0.05829627, 1.77853, 2.658563, 0, 1, 0.8666667, 1,
-0.05589426, -0.4699782, -2.995317, 0, 1, 0.8745098, 1,
-0.05430932, -1.499381, -4.373395, 0, 1, 0.8784314, 1,
-0.05319285, -1.070689, -2.523813, 0, 1, 0.8862745, 1,
-0.04989212, -2.22332, -2.98252, 0, 1, 0.8901961, 1,
-0.04733864, -0.9672685, -1.958766, 0, 1, 0.8980392, 1,
-0.0448096, -1.182788, -3.040101, 0, 1, 0.9058824, 1,
-0.04390403, -1.012417, -2.616394, 0, 1, 0.9098039, 1,
-0.0437578, -2.183902, -2.776784, 0, 1, 0.9176471, 1,
-0.04214491, 0.3701262, -0.8067062, 0, 1, 0.9215686, 1,
-0.04103235, 0.1402767, 0.09945656, 0, 1, 0.9294118, 1,
-0.03517134, 1.720725, 1.388878, 0, 1, 0.9333333, 1,
-0.03449401, -1.349743, -2.120678, 0, 1, 0.9411765, 1,
-0.03090456, -0.6025231, -3.159271, 0, 1, 0.945098, 1,
-0.03001008, 1.88171, -0.04937361, 0, 1, 0.9529412, 1,
-0.02939004, -0.4087428, -1.96263, 0, 1, 0.9568627, 1,
-0.02711986, -1.201859, -3.372392, 0, 1, 0.9647059, 1,
-0.01888939, -0.1994763, -3.205239, 0, 1, 0.9686275, 1,
-0.01870258, -1.585138, -0.9098205, 0, 1, 0.9764706, 1,
-0.01835541, 1.67003, -2.045031, 0, 1, 0.9803922, 1,
-0.01556405, 0.5538453, -0.3537744, 0, 1, 0.9882353, 1,
-0.01100338, 1.835083, 0.358682, 0, 1, 0.9921569, 1,
-0.00816309, 1.481578, 0.616625, 0, 1, 1, 1,
0.0006248159, -1.643421, 1.941141, 0, 0.9921569, 1, 1,
0.002315493, -0.5558578, 2.547342, 0, 0.9882353, 1, 1,
0.002375109, -2.014909, 2.550398, 0, 0.9803922, 1, 1,
0.01165358, -1.817973, 1.919006, 0, 0.9764706, 1, 1,
0.01312133, -1.505942, 4.378049, 0, 0.9686275, 1, 1,
0.01399719, 0.3634379, 0.9845496, 0, 0.9647059, 1, 1,
0.01746839, -0.04092428, 3.9759, 0, 0.9568627, 1, 1,
0.01758938, -0.6350945, 3.572338, 0, 0.9529412, 1, 1,
0.02125339, -0.8637932, 2.174012, 0, 0.945098, 1, 1,
0.0235275, 0.4161026, -0.3847807, 0, 0.9411765, 1, 1,
0.0269286, -1.003868, 2.875294, 0, 0.9333333, 1, 1,
0.02697916, 0.8195698, 0.7453825, 0, 0.9294118, 1, 1,
0.02714712, 1.573014, 0.6623579, 0, 0.9215686, 1, 1,
0.02769768, 1.243611, -1.228865, 0, 0.9176471, 1, 1,
0.02775053, 1.258526, -0.844633, 0, 0.9098039, 1, 1,
0.02877341, 0.512834, 0.4788667, 0, 0.9058824, 1, 1,
0.03265647, -2.041973, 3.298731, 0, 0.8980392, 1, 1,
0.03638409, -0.3488994, 4.19777, 0, 0.8901961, 1, 1,
0.04034, 0.08746483, 1.156592, 0, 0.8862745, 1, 1,
0.0420237, 0.8502643, 1.051815, 0, 0.8784314, 1, 1,
0.04449611, -0.2207943, 1.761054, 0, 0.8745098, 1, 1,
0.0463741, -0.3700522, 2.963096, 0, 0.8666667, 1, 1,
0.04868076, 1.778848, 0.8518323, 0, 0.8627451, 1, 1,
0.04902805, -0.6716964, 3.068585, 0, 0.854902, 1, 1,
0.05228375, 0.9833387, 0.1915398, 0, 0.8509804, 1, 1,
0.05443018, 1.688245, 0.09122318, 0, 0.8431373, 1, 1,
0.05653147, 0.0329678, 2.072437, 0, 0.8392157, 1, 1,
0.05850615, 0.2757876, -0.03764663, 0, 0.8313726, 1, 1,
0.05970021, 0.1651238, -0.313148, 0, 0.827451, 1, 1,
0.06102754, -1.290929, 5.772607, 0, 0.8196079, 1, 1,
0.07189319, -0.5292633, 2.706346, 0, 0.8156863, 1, 1,
0.07251386, 0.8565376, -1.100261, 0, 0.8078431, 1, 1,
0.07311927, 1.705953, -0.1857132, 0, 0.8039216, 1, 1,
0.07464135, -0.1194216, 2.036213, 0, 0.7960784, 1, 1,
0.07916763, -1.320293, 3.627393, 0, 0.7882353, 1, 1,
0.07935843, 2.174773, 0.5692544, 0, 0.7843137, 1, 1,
0.08211232, -0.1770162, 4.271892, 0, 0.7764706, 1, 1,
0.0893119, -0.8954028, 3.76976, 0, 0.772549, 1, 1,
0.09255317, -1.344058, 0.3788372, 0, 0.7647059, 1, 1,
0.0931099, -0.5666947, 2.630849, 0, 0.7607843, 1, 1,
0.09811132, -0.593217, 2.859013, 0, 0.7529412, 1, 1,
0.1034756, 0.01019159, 0.2038713, 0, 0.7490196, 1, 1,
0.1049051, -0.8026593, 4.17899, 0, 0.7411765, 1, 1,
0.1093767, 0.09395126, 0.7000675, 0, 0.7372549, 1, 1,
0.1105186, -1.81943, 3.691443, 0, 0.7294118, 1, 1,
0.1177664, -1.206918, 3.826307, 0, 0.7254902, 1, 1,
0.1178392, 1.52079, 0.7994429, 0, 0.7176471, 1, 1,
0.1213963, 0.7277244, 1.931699, 0, 0.7137255, 1, 1,
0.1220313, 0.5639642, -2.317935, 0, 0.7058824, 1, 1,
0.1238845, 1.352652, 0.9587538, 0, 0.6980392, 1, 1,
0.1249864, 0.6071747, -0.6358401, 0, 0.6941177, 1, 1,
0.1276798, -0.9650361, 2.104762, 0, 0.6862745, 1, 1,
0.1289684, 0.533102, -0.3420561, 0, 0.682353, 1, 1,
0.1304501, 0.1364378, 0.6523112, 0, 0.6745098, 1, 1,
0.1310058, 0.5914875, -0.3612002, 0, 0.6705883, 1, 1,
0.1352637, 0.3060027, -0.1260956, 0, 0.6627451, 1, 1,
0.1362135, -0.4796475, 2.33798, 0, 0.6588235, 1, 1,
0.1371524, 0.3802336, 0.7047358, 0, 0.6509804, 1, 1,
0.1375448, -0.4200859, 1.777512, 0, 0.6470588, 1, 1,
0.1381716, -1.298016, 2.701079, 0, 0.6392157, 1, 1,
0.1411688, -1.023099, 3.180764, 0, 0.6352941, 1, 1,
0.1448539, -0.5190959, 3.643467, 0, 0.627451, 1, 1,
0.1454352, 0.2420657, 0.3049413, 0, 0.6235294, 1, 1,
0.1482085, 0.868499, -1.537088, 0, 0.6156863, 1, 1,
0.1510196, 0.659445, -1.195737, 0, 0.6117647, 1, 1,
0.1540194, -0.01134718, 2.980977, 0, 0.6039216, 1, 1,
0.157484, 0.3065918, 1.041793, 0, 0.5960785, 1, 1,
0.1582981, 0.1104891, 0.2457096, 0, 0.5921569, 1, 1,
0.1594401, -1.178849, 3.216407, 0, 0.5843138, 1, 1,
0.1646572, -0.05612482, 2.412031, 0, 0.5803922, 1, 1,
0.166228, 0.1799932, -0.8684667, 0, 0.572549, 1, 1,
0.1694134, 1.683741, -0.4069002, 0, 0.5686275, 1, 1,
0.1705217, -2.054728, 3.244799, 0, 0.5607843, 1, 1,
0.1722474, 0.4751294, 1.460462, 0, 0.5568628, 1, 1,
0.175708, -1.06547, 3.191001, 0, 0.5490196, 1, 1,
0.1780455, 0.3399165, 0.4720431, 0, 0.5450981, 1, 1,
0.1785441, 0.4429158, 1.25837, 0, 0.5372549, 1, 1,
0.182574, 0.5532129, 0.1515888, 0, 0.5333334, 1, 1,
0.1833429, 1.391484, 0.264595, 0, 0.5254902, 1, 1,
0.1864002, 0.01942686, 1.579751, 0, 0.5215687, 1, 1,
0.1920098, -0.4566328, 1.274186, 0, 0.5137255, 1, 1,
0.1932968, -0.5229816, 2.422292, 0, 0.509804, 1, 1,
0.2004807, 0.9507616, 0.2626772, 0, 0.5019608, 1, 1,
0.2008422, 0.1931773, -0.4308752, 0, 0.4941176, 1, 1,
0.2011969, -0.8802136, 4.889729, 0, 0.4901961, 1, 1,
0.202602, -0.1760391, 2.305842, 0, 0.4823529, 1, 1,
0.2029012, -0.2628348, 3.342057, 0, 0.4784314, 1, 1,
0.204516, -0.9605327, 2.557163, 0, 0.4705882, 1, 1,
0.205976, 0.06220251, 1.663534, 0, 0.4666667, 1, 1,
0.2126391, -0.4634212, 3.553964, 0, 0.4588235, 1, 1,
0.2140707, -0.2886802, 1.845072, 0, 0.454902, 1, 1,
0.2205293, -1.122322, 2.424897, 0, 0.4470588, 1, 1,
0.2233889, 0.5061377, -1.201752, 0, 0.4431373, 1, 1,
0.2253853, 0.1872013, 3.469609, 0, 0.4352941, 1, 1,
0.2270085, -0.03547642, 0.1272791, 0, 0.4313726, 1, 1,
0.2286321, -1.058062, 1.568854, 0, 0.4235294, 1, 1,
0.2303798, 0.4788719, 0.9860233, 0, 0.4196078, 1, 1,
0.2339997, -0.460896, 2.491999, 0, 0.4117647, 1, 1,
0.2352797, -3.20235, 3.543166, 0, 0.4078431, 1, 1,
0.2396072, 0.7949772, 0.9487566, 0, 0.4, 1, 1,
0.2415994, 0.4712118, 1.029246, 0, 0.3921569, 1, 1,
0.2424669, 0.2144668, 0.3942382, 0, 0.3882353, 1, 1,
0.2427321, -1.162295, 3.42846, 0, 0.3803922, 1, 1,
0.2435759, 3.261642, -0.1112465, 0, 0.3764706, 1, 1,
0.2504035, 0.1069872, 0.4905527, 0, 0.3686275, 1, 1,
0.2518002, -1.605541, 2.05705, 0, 0.3647059, 1, 1,
0.2530384, -0.6348847, 3.568955, 0, 0.3568628, 1, 1,
0.253788, -1.919158, 1.942829, 0, 0.3529412, 1, 1,
0.2645729, -1.231791, 4.288123, 0, 0.345098, 1, 1,
0.2656724, 0.04251338, 0.7121547, 0, 0.3411765, 1, 1,
0.2670234, 0.4319316, 1.076254, 0, 0.3333333, 1, 1,
0.2717279, -0.9020825, 5.111692, 0, 0.3294118, 1, 1,
0.2725254, 0.05374593, 2.059443, 0, 0.3215686, 1, 1,
0.2761407, 1.103102, -0.3586498, 0, 0.3176471, 1, 1,
0.2800738, 0.2344574, 0.7482653, 0, 0.3098039, 1, 1,
0.280578, -2.355031, 3.327809, 0, 0.3058824, 1, 1,
0.2815161, 0.3125251, -0.06329888, 0, 0.2980392, 1, 1,
0.2855709, -0.7227579, 2.62277, 0, 0.2901961, 1, 1,
0.2865653, 0.8912635, 1.103151, 0, 0.2862745, 1, 1,
0.2874562, 0.09194946, 0.6764284, 0, 0.2784314, 1, 1,
0.2949003, 1.587926, 1.456029, 0, 0.2745098, 1, 1,
0.2979161, -0.7372007, 4.231935, 0, 0.2666667, 1, 1,
0.3004917, -0.2397841, 2.663254, 0, 0.2627451, 1, 1,
0.3016416, 0.2210266, 1.549158, 0, 0.254902, 1, 1,
0.3053784, 0.01380226, 1.085688, 0, 0.2509804, 1, 1,
0.3076738, -1.141925, 1.624179, 0, 0.2431373, 1, 1,
0.3080202, -0.04910925, 3.800294, 0, 0.2392157, 1, 1,
0.3129494, 0.8717199, -1.445344, 0, 0.2313726, 1, 1,
0.3153779, -0.285295, 2.236162, 0, 0.227451, 1, 1,
0.3156005, -0.5824685, 2.014858, 0, 0.2196078, 1, 1,
0.3219231, 0.3506363, -1.157114, 0, 0.2156863, 1, 1,
0.3343962, -1.038647, 0.7459911, 0, 0.2078431, 1, 1,
0.3355407, -1.310373, 3.401105, 0, 0.2039216, 1, 1,
0.3371765, 0.2781624, -0.08810762, 0, 0.1960784, 1, 1,
0.340297, -0.2318504, 1.223094, 0, 0.1882353, 1, 1,
0.3405213, 0.4245292, 0.6658328, 0, 0.1843137, 1, 1,
0.3491767, -1.561105, 3.613064, 0, 0.1764706, 1, 1,
0.3524976, 0.07155256, 0.4148754, 0, 0.172549, 1, 1,
0.3543005, -0.2577577, 2.376117, 0, 0.1647059, 1, 1,
0.359174, 0.6364644, 0.151801, 0, 0.1607843, 1, 1,
0.3597254, -1.812119, 4.554277, 0, 0.1529412, 1, 1,
0.3701729, 1.198073, 0.5382947, 0, 0.1490196, 1, 1,
0.3708624, -0.09354767, 2.252526, 0, 0.1411765, 1, 1,
0.3715807, 0.7688851, 1.457549, 0, 0.1372549, 1, 1,
0.3726509, 0.7395898, -0.2990779, 0, 0.1294118, 1, 1,
0.373988, 0.4726205, 2.022189, 0, 0.1254902, 1, 1,
0.3753117, 0.4352564, 0.3787393, 0, 0.1176471, 1, 1,
0.3798963, 0.0224633, 1.522253, 0, 0.1137255, 1, 1,
0.3805565, 0.9300951, -0.8671612, 0, 0.1058824, 1, 1,
0.3824249, -0.7883945, 3.599379, 0, 0.09803922, 1, 1,
0.3848331, 0.3873746, 1.834595, 0, 0.09411765, 1, 1,
0.3858171, -0.6289051, 2.168079, 0, 0.08627451, 1, 1,
0.3870149, 1.280458, 1.073349, 0, 0.08235294, 1, 1,
0.3887027, 1.49172, 1.462217, 0, 0.07450981, 1, 1,
0.3901795, -0.4505337, 3.630808, 0, 0.07058824, 1, 1,
0.3908091, -1.70813, 1.250996, 0, 0.0627451, 1, 1,
0.3923192, -0.3188896, 4.033681, 0, 0.05882353, 1, 1,
0.4005169, -1.696719, 1.526107, 0, 0.05098039, 1, 1,
0.4020919, -0.4801034, 0.9566811, 0, 0.04705882, 1, 1,
0.4035248, -0.07958087, -0.07212881, 0, 0.03921569, 1, 1,
0.4149747, -0.3852277, 1.453306, 0, 0.03529412, 1, 1,
0.4171861, -1.408645, 3.469415, 0, 0.02745098, 1, 1,
0.4216686, -2.096246, 2.853717, 0, 0.02352941, 1, 1,
0.4274785, 1.260128, -0.299815, 0, 0.01568628, 1, 1,
0.4280372, -0.5217388, 3.005677, 0, 0.01176471, 1, 1,
0.4307397, 0.6315318, -0.8960088, 0, 0.003921569, 1, 1,
0.4308358, 0.4269733, 0.5054331, 0.003921569, 0, 1, 1,
0.4342914, -2.323907, 3.660054, 0.007843138, 0, 1, 1,
0.4398539, -1.117622, 2.513238, 0.01568628, 0, 1, 1,
0.4462017, -1.0528, 3.562672, 0.01960784, 0, 1, 1,
0.4489585, 2.493735, -0.8052367, 0.02745098, 0, 1, 1,
0.456593, -1.161091, 3.259268, 0.03137255, 0, 1, 1,
0.4596146, -1.477298, 1.870133, 0.03921569, 0, 1, 1,
0.4614992, -0.3829191, 2.663106, 0.04313726, 0, 1, 1,
0.4684478, -0.9753109, 2.378953, 0.05098039, 0, 1, 1,
0.4697651, 1.028268, 0.9538033, 0.05490196, 0, 1, 1,
0.4727521, 0.717623, 0.14691, 0.0627451, 0, 1, 1,
0.4850099, 0.4163195, 2.514083, 0.06666667, 0, 1, 1,
0.4883588, 0.07489633, 0.3409841, 0.07450981, 0, 1, 1,
0.4940813, 0.1261569, 2.104372, 0.07843138, 0, 1, 1,
0.5004328, -0.2506208, 0.937871, 0.08627451, 0, 1, 1,
0.5096678, 0.365047, 2.732833, 0.09019608, 0, 1, 1,
0.5133563, -0.6308148, 1.912997, 0.09803922, 0, 1, 1,
0.5148804, -0.6799362, 2.116814, 0.1058824, 0, 1, 1,
0.5166354, -0.009901389, 3.022853, 0.1098039, 0, 1, 1,
0.5191031, -0.6197649, 2.900151, 0.1176471, 0, 1, 1,
0.5203534, -0.3272896, 1.974611, 0.1215686, 0, 1, 1,
0.5216141, -1.12897, 3.496308, 0.1294118, 0, 1, 1,
0.5223416, 0.9162596, -0.5108685, 0.1333333, 0, 1, 1,
0.5237006, -0.8697836, 2.842676, 0.1411765, 0, 1, 1,
0.5253226, -0.4697535, 1.52011, 0.145098, 0, 1, 1,
0.5282742, 1.634505, -0.2280838, 0.1529412, 0, 1, 1,
0.5288928, -0.4145878, 2.59449, 0.1568628, 0, 1, 1,
0.5306473, -1.469064, 3.26927, 0.1647059, 0, 1, 1,
0.5311044, -0.4240943, 1.986287, 0.1686275, 0, 1, 1,
0.5311896, 1.515289, -0.4378282, 0.1764706, 0, 1, 1,
0.5312255, -0.07505126, 2.230419, 0.1803922, 0, 1, 1,
0.5334768, -0.5198674, 3.552577, 0.1882353, 0, 1, 1,
0.534131, -0.09863973, 1.559171, 0.1921569, 0, 1, 1,
0.5346436, -0.08127974, 0.05085806, 0.2, 0, 1, 1,
0.535911, -0.3967806, 1.340149, 0.2078431, 0, 1, 1,
0.5373604, 0.9507829, 1.970301, 0.2117647, 0, 1, 1,
0.5378543, -0.2231567, 2.183729, 0.2196078, 0, 1, 1,
0.5459636, -0.04603115, 2.434226, 0.2235294, 0, 1, 1,
0.5477022, 0.07633731, 0.6281603, 0.2313726, 0, 1, 1,
0.5539379, -1.010823, 3.326363, 0.2352941, 0, 1, 1,
0.5568907, 0.9977564, 1.121807, 0.2431373, 0, 1, 1,
0.565096, -0.3833617, 3.831034, 0.2470588, 0, 1, 1,
0.5659672, -0.9617766, 2.676918, 0.254902, 0, 1, 1,
0.5692493, -0.3260093, 1.35468, 0.2588235, 0, 1, 1,
0.5719209, -0.3264225, 2.896, 0.2666667, 0, 1, 1,
0.5880504, -1.045283, 2.584292, 0.2705882, 0, 1, 1,
0.5889341, -1.361333, 0.4745907, 0.2784314, 0, 1, 1,
0.5948426, -0.7001675, 2.695067, 0.282353, 0, 1, 1,
0.596383, 0.2587008, 1.198609, 0.2901961, 0, 1, 1,
0.6003162, 0.4793614, 3.649426, 0.2941177, 0, 1, 1,
0.6043788, 0.1264715, 0.2825322, 0.3019608, 0, 1, 1,
0.6059377, 0.4201928, 1.018932, 0.3098039, 0, 1, 1,
0.6105233, -1.012248, 2.517287, 0.3137255, 0, 1, 1,
0.614107, 0.7941692, 1.490327, 0.3215686, 0, 1, 1,
0.6183828, 0.9634656, -0.08178025, 0.3254902, 0, 1, 1,
0.6196213, 2.618471, 0.3769637, 0.3333333, 0, 1, 1,
0.6256291, 0.1540915, -0.4299602, 0.3372549, 0, 1, 1,
0.627148, 0.3642242, 1.989191, 0.345098, 0, 1, 1,
0.6279292, 1.030995, 2.099284, 0.3490196, 0, 1, 1,
0.6329042, 0.3828957, -0.5346799, 0.3568628, 0, 1, 1,
0.636138, 0.8215372, 0.62633, 0.3607843, 0, 1, 1,
0.6496769, -2.00111, 3.332407, 0.3686275, 0, 1, 1,
0.653202, 0.843999, 0.5746741, 0.372549, 0, 1, 1,
0.6562009, 0.6106411, 1.16864, 0.3803922, 0, 1, 1,
0.6565329, 1.593477, 0.3552631, 0.3843137, 0, 1, 1,
0.659104, -1.052444, 4.671939, 0.3921569, 0, 1, 1,
0.6597943, 0.9698243, 1.821269, 0.3960784, 0, 1, 1,
0.6618046, -0.3718368, 2.526913, 0.4039216, 0, 1, 1,
0.6620961, -0.2917137, 1.316947, 0.4117647, 0, 1, 1,
0.6627649, 1.20413, 1.938366, 0.4156863, 0, 1, 1,
0.6628928, 0.709467, 1.809275, 0.4235294, 0, 1, 1,
0.6659999, -0.4708927, 3.467687, 0.427451, 0, 1, 1,
0.6726411, -1.503882, 0.6805131, 0.4352941, 0, 1, 1,
0.6793735, -1.094328, 1.20167, 0.4392157, 0, 1, 1,
0.6815364, 1.422795, -0.1186903, 0.4470588, 0, 1, 1,
0.6850285, -1.171517, 1.708717, 0.4509804, 0, 1, 1,
0.6912792, -1.505173, 3.786844, 0.4588235, 0, 1, 1,
0.6935473, -0.1094847, 1.461332, 0.4627451, 0, 1, 1,
0.699311, -0.464387, 2.845204, 0.4705882, 0, 1, 1,
0.6998381, 0.2925903, 0.2853286, 0.4745098, 0, 1, 1,
0.7103513, -0.8919945, 1.303477, 0.4823529, 0, 1, 1,
0.7131441, -0.6388281, 3.553876, 0.4862745, 0, 1, 1,
0.7159075, 0.1407094, 2.874655, 0.4941176, 0, 1, 1,
0.7222449, 0.171047, 0.7666891, 0.5019608, 0, 1, 1,
0.722469, -0.9766647, 2.886747, 0.5058824, 0, 1, 1,
0.7236064, 0.04007574, 2.380297, 0.5137255, 0, 1, 1,
0.7245616, -1.651825, 3.803823, 0.5176471, 0, 1, 1,
0.7257184, -0.9178483, 1.327333, 0.5254902, 0, 1, 1,
0.7269066, 0.6492819, 2.061672, 0.5294118, 0, 1, 1,
0.7358279, -1.209841, 3.751163, 0.5372549, 0, 1, 1,
0.736351, -0.6409829, 3.57975, 0.5411765, 0, 1, 1,
0.7375101, -0.3444957, 0.7518288, 0.5490196, 0, 1, 1,
0.738226, 0.6838641, 0.6398157, 0.5529412, 0, 1, 1,
0.7405196, 0.9113272, 1.795315, 0.5607843, 0, 1, 1,
0.7429022, -1.653431, 2.090448, 0.5647059, 0, 1, 1,
0.7431111, -0.7986887, 1.493259, 0.572549, 0, 1, 1,
0.7480989, 0.1055329, 1.114089, 0.5764706, 0, 1, 1,
0.7512524, -1.514856, 3.185158, 0.5843138, 0, 1, 1,
0.7522613, -1.107642, 1.302466, 0.5882353, 0, 1, 1,
0.75266, -2.783929, 4.319427, 0.5960785, 0, 1, 1,
0.7531479, -1.076096, 3.918458, 0.6039216, 0, 1, 1,
0.7546421, -0.6486802, 2.977691, 0.6078432, 0, 1, 1,
0.7575476, 0.8560881, 0.3229926, 0.6156863, 0, 1, 1,
0.7615914, 0.4829327, 0.7969149, 0.6196079, 0, 1, 1,
0.7641218, -0.7460272, 1.54031, 0.627451, 0, 1, 1,
0.7647799, 0.6915517, -0.06287377, 0.6313726, 0, 1, 1,
0.7655112, 0.4325258, 0.9862909, 0.6392157, 0, 1, 1,
0.7661419, -0.5709426, 1.886058, 0.6431373, 0, 1, 1,
0.7725023, 0.5959323, 2.13147, 0.6509804, 0, 1, 1,
0.7772601, -0.745397, 2.051379, 0.654902, 0, 1, 1,
0.7791944, -1.498306, 3.238364, 0.6627451, 0, 1, 1,
0.7810894, -0.2919186, 0.04025667, 0.6666667, 0, 1, 1,
0.7822611, 0.8571688, -1.616053, 0.6745098, 0, 1, 1,
0.782671, 1.014552, -0.4050209, 0.6784314, 0, 1, 1,
0.7848399, -0.251226, 0.7535837, 0.6862745, 0, 1, 1,
0.7861882, 0.9816735, 2.679353, 0.6901961, 0, 1, 1,
0.7947493, -0.5260004, 0.319311, 0.6980392, 0, 1, 1,
0.8003715, 0.9551607, 0.597546, 0.7058824, 0, 1, 1,
0.8024732, 0.2498719, 1.326364, 0.7098039, 0, 1, 1,
0.8051087, 0.5715457, 1.834798, 0.7176471, 0, 1, 1,
0.8053634, -0.8311159, 1.612853, 0.7215686, 0, 1, 1,
0.8059152, -0.7695996, 1.925657, 0.7294118, 0, 1, 1,
0.8109806, 0.9216874, 0.757466, 0.7333333, 0, 1, 1,
0.8135982, -1.026882, 3.072049, 0.7411765, 0, 1, 1,
0.8138829, -0.6974577, 1.809556, 0.7450981, 0, 1, 1,
0.8180524, -0.2029648, 2.283886, 0.7529412, 0, 1, 1,
0.820819, -0.8784867, 0.9420708, 0.7568628, 0, 1, 1,
0.8216215, 0.8070686, 0.827114, 0.7647059, 0, 1, 1,
0.8267156, 0.6236626, 0.5597304, 0.7686275, 0, 1, 1,
0.8329336, -1.264217, 2.649103, 0.7764706, 0, 1, 1,
0.8334447, 0.007614343, 0.9261279, 0.7803922, 0, 1, 1,
0.838134, -0.8389814, 1.01668, 0.7882353, 0, 1, 1,
0.8387907, 0.4848472, -0.8657861, 0.7921569, 0, 1, 1,
0.8421064, -1.125126, 2.545301, 0.8, 0, 1, 1,
0.8506222, -0.9054925, 1.735157, 0.8078431, 0, 1, 1,
0.8511481, -1.028086, 2.528005, 0.8117647, 0, 1, 1,
0.8578516, 0.3413747, 0.630756, 0.8196079, 0, 1, 1,
0.8584803, -1.836802, 3.832852, 0.8235294, 0, 1, 1,
0.8606091, 0.3879062, 0.1481152, 0.8313726, 0, 1, 1,
0.8636283, 2.127877, 1.561872, 0.8352941, 0, 1, 1,
0.8638352, -0.7931044, 0.823253, 0.8431373, 0, 1, 1,
0.8639923, 0.7267649, 1.596257, 0.8470588, 0, 1, 1,
0.8677272, -1.552879, 3.607882, 0.854902, 0, 1, 1,
0.8710582, -2.54343, 3.209393, 0.8588235, 0, 1, 1,
0.871965, 1.902173, -0.2260219, 0.8666667, 0, 1, 1,
0.8748092, 0.4001119, -0.9433452, 0.8705882, 0, 1, 1,
0.8756553, -1.065875, 3.060758, 0.8784314, 0, 1, 1,
0.8757109, 0.9430768, -0.1781451, 0.8823529, 0, 1, 1,
0.880929, 1.786136, 1.185386, 0.8901961, 0, 1, 1,
0.8896766, -0.8164619, 2.124011, 0.8941177, 0, 1, 1,
0.895947, -0.005223821, 1.719738, 0.9019608, 0, 1, 1,
0.8961655, 0.8435742, 1.656201, 0.9098039, 0, 1, 1,
0.8963513, -0.3554364, 2.65775, 0.9137255, 0, 1, 1,
0.9009209, -0.7210791, 1.872799, 0.9215686, 0, 1, 1,
0.9091277, -1.121961, 2.537854, 0.9254902, 0, 1, 1,
0.9125018, 1.97937, -0.09265655, 0.9333333, 0, 1, 1,
0.9160042, 1.119182, 0.8785696, 0.9372549, 0, 1, 1,
0.9273291, -0.8554101, 1.100756, 0.945098, 0, 1, 1,
0.9275614, 1.583046, -0.9385636, 0.9490196, 0, 1, 1,
0.9368554, -0.432694, 2.950513, 0.9568627, 0, 1, 1,
0.9417956, 0.3827975, 1.926731, 0.9607843, 0, 1, 1,
0.9437041, -0.5192701, 1.914006, 0.9686275, 0, 1, 1,
0.949992, -0.8681557, 2.413518, 0.972549, 0, 1, 1,
0.9509875, 0.6168956, 0.2156641, 0.9803922, 0, 1, 1,
0.9527588, 0.2607587, 1.679352, 0.9843137, 0, 1, 1,
0.9542927, 0.000229147, 1.133105, 0.9921569, 0, 1, 1,
0.9558535, -0.9832098, 1.7356, 0.9960784, 0, 1, 1,
0.9607026, 1.211199, 2.083242, 1, 0, 0.9960784, 1,
0.9668649, 0.5096369, 0.04221886, 1, 0, 0.9882353, 1,
0.9686803, -0.9759626, 2.326037, 1, 0, 0.9843137, 1,
0.9758948, 0.1275434, 1.404603, 1, 0, 0.9764706, 1,
0.9785371, -0.1242073, 0.1116985, 1, 0, 0.972549, 1,
0.9856333, 0.4500903, 0.6358504, 1, 0, 0.9647059, 1,
0.9929807, 1.251764, 0.7749919, 1, 0, 0.9607843, 1,
1.000766, 0.6949422, 1.582598, 1, 0, 0.9529412, 1,
1.005233, 1.069663, 1.549584, 1, 0, 0.9490196, 1,
1.009115, -1.38306, 2.083794, 1, 0, 0.9411765, 1,
1.018048, -0.6507646, -0.2531797, 1, 0, 0.9372549, 1,
1.044825, -0.6217915, 3.446982, 1, 0, 0.9294118, 1,
1.049017, 1.768665, 1.218697, 1, 0, 0.9254902, 1,
1.054293, -0.1179982, 1.332155, 1, 0, 0.9176471, 1,
1.055288, 0.5739124, 1.097117, 1, 0, 0.9137255, 1,
1.056925, -0.8015894, 0.5689548, 1, 0, 0.9058824, 1,
1.06156, 0.2594104, 1.490001, 1, 0, 0.9019608, 1,
1.062626, 0.04329914, 1.139081, 1, 0, 0.8941177, 1,
1.06646, 2.266553, 0.2408005, 1, 0, 0.8862745, 1,
1.067551, 0.5912054, 1.367628, 1, 0, 0.8823529, 1,
1.068935, -0.9274412, 3.8303, 1, 0, 0.8745098, 1,
1.069499, 1.78561, 0.5590598, 1, 0, 0.8705882, 1,
1.076074, -0.7654489, 2.212461, 1, 0, 0.8627451, 1,
1.077871, -1.88218, 3.458339, 1, 0, 0.8588235, 1,
1.079137, 0.8121468, 1.322665, 1, 0, 0.8509804, 1,
1.084426, -0.6564631, 0.5272429, 1, 0, 0.8470588, 1,
1.090529, 1.100401, 2.826051, 1, 0, 0.8392157, 1,
1.092272, -0.5414189, 2.983093, 1, 0, 0.8352941, 1,
1.094072, 0.2064969, 0.925783, 1, 0, 0.827451, 1,
1.09686, -0.804416, 1.891006, 1, 0, 0.8235294, 1,
1.110262, 0.5147145, 2.396128, 1, 0, 0.8156863, 1,
1.113916, -0.1147969, 1.586064, 1, 0, 0.8117647, 1,
1.114938, 1.82566, 0.4272284, 1, 0, 0.8039216, 1,
1.116248, -0.8591744, 2.993934, 1, 0, 0.7960784, 1,
1.116623, -0.0368532, 1.988725, 1, 0, 0.7921569, 1,
1.123659, 1.436724, 1.010893, 1, 0, 0.7843137, 1,
1.124078, 1.061621, 1.502022, 1, 0, 0.7803922, 1,
1.129575, -0.3730921, -1.112653, 1, 0, 0.772549, 1,
1.130485, -1.504279, 3.730429, 1, 0, 0.7686275, 1,
1.136341, -0.1018604, 1.55999, 1, 0, 0.7607843, 1,
1.145348, -0.9527155, 1.849904, 1, 0, 0.7568628, 1,
1.159384, -0.2032657, 0.08807982, 1, 0, 0.7490196, 1,
1.159519, 1.753268, 0.5272304, 1, 0, 0.7450981, 1,
1.162196, -1.101854, 1.823504, 1, 0, 0.7372549, 1,
1.169763, 1.733177, -0.5417129, 1, 0, 0.7333333, 1,
1.172611, -0.6162516, 0.8478663, 1, 0, 0.7254902, 1,
1.178454, 0.586558, 1.096128, 1, 0, 0.7215686, 1,
1.17891, 0.1555159, 1.149823, 1, 0, 0.7137255, 1,
1.184211, -0.2695673, 1.272051, 1, 0, 0.7098039, 1,
1.184984, -0.01350005, 2.04857, 1, 0, 0.7019608, 1,
1.185962, 0.1311292, 1.289505, 1, 0, 0.6941177, 1,
1.191988, -0.4454213, 2.003045, 1, 0, 0.6901961, 1,
1.202449, -1.521561, 2.869941, 1, 0, 0.682353, 1,
1.204286, -0.4772021, 0.9626473, 1, 0, 0.6784314, 1,
1.204577, 1.818553, 0.3436197, 1, 0, 0.6705883, 1,
1.212555, -1.866361, 1.621303, 1, 0, 0.6666667, 1,
1.214532, -0.7213638, 1.815428, 1, 0, 0.6588235, 1,
1.221753, 0.8859166, 2.698667, 1, 0, 0.654902, 1,
1.23729, -0.6047847, 1.812486, 1, 0, 0.6470588, 1,
1.240694, 0.6633967, 3.245164, 1, 0, 0.6431373, 1,
1.243228, -0.6362193, 2.835208, 1, 0, 0.6352941, 1,
1.244224, -0.9656785, 3.280378, 1, 0, 0.6313726, 1,
1.247896, 0.3368012, 3.236746, 1, 0, 0.6235294, 1,
1.248853, 0.9662204, 0.5314012, 1, 0, 0.6196079, 1,
1.249926, 1.563226, 0.5969308, 1, 0, 0.6117647, 1,
1.257589, -0.6523668, 2.298519, 1, 0, 0.6078432, 1,
1.257774, -1.955777, 0.5336896, 1, 0, 0.6, 1,
1.25811, -0.2782698, -0.8344775, 1, 0, 0.5921569, 1,
1.258762, -0.9863489, 3.40149, 1, 0, 0.5882353, 1,
1.264019, 2.797493, -0.5324435, 1, 0, 0.5803922, 1,
1.268228, -0.01101091, 2.072306, 1, 0, 0.5764706, 1,
1.270544, -0.2426024, 0.3175406, 1, 0, 0.5686275, 1,
1.278931, -0.5248538, 2.974485, 1, 0, 0.5647059, 1,
1.293882, -0.07108894, 1.230052, 1, 0, 0.5568628, 1,
1.297905, 0.3589207, 1.971468, 1, 0, 0.5529412, 1,
1.299145, 0.2434013, 1.006414, 1, 0, 0.5450981, 1,
1.301983, -0.4093671, 0.3231574, 1, 0, 0.5411765, 1,
1.328268, -0.6440182, 2.098515, 1, 0, 0.5333334, 1,
1.328519, 0.5234642, 2.414121, 1, 0, 0.5294118, 1,
1.332017, -1.046378, 2.630563, 1, 0, 0.5215687, 1,
1.341073, -0.8596767, 1.107253, 1, 0, 0.5176471, 1,
1.345811, 1.045452, -0.3779985, 1, 0, 0.509804, 1,
1.353155, 0.7388423, 0.7334573, 1, 0, 0.5058824, 1,
1.364312, -0.1279406, 1.539223, 1, 0, 0.4980392, 1,
1.367456, 1.390997, 1.882001, 1, 0, 0.4901961, 1,
1.368355, 0.3639249, 1.989958, 1, 0, 0.4862745, 1,
1.375138, -0.9078957, 2.188102, 1, 0, 0.4784314, 1,
1.375234, -0.49291, 1.768348, 1, 0, 0.4745098, 1,
1.379605, 0.9272388, 0.8670157, 1, 0, 0.4666667, 1,
1.383636, -2.471507, 2.130998, 1, 0, 0.4627451, 1,
1.386696, 0.4436994, 1.098051, 1, 0, 0.454902, 1,
1.390602, -1.232448, 2.434097, 1, 0, 0.4509804, 1,
1.396091, -0.721739, 2.632709, 1, 0, 0.4431373, 1,
1.410249, -0.02801046, 3.206616, 1, 0, 0.4392157, 1,
1.411379, -0.7985606, 2.204659, 1, 0, 0.4313726, 1,
1.416268, 0.5008134, 0.4225141, 1, 0, 0.427451, 1,
1.424269, -1.415048, 3.820974, 1, 0, 0.4196078, 1,
1.43353, -0.8421814, -0.4807269, 1, 0, 0.4156863, 1,
1.436819, -0.528706, 2.661486, 1, 0, 0.4078431, 1,
1.439225, 0.3119124, 0.7783234, 1, 0, 0.4039216, 1,
1.444843, -1.058273, 2.825625, 1, 0, 0.3960784, 1,
1.446014, 0.1050327, 0.8741233, 1, 0, 0.3882353, 1,
1.448843, 1.687153, -0.2686226, 1, 0, 0.3843137, 1,
1.464252, -0.4122761, 2.158798, 1, 0, 0.3764706, 1,
1.475454, -0.08669817, 1.295819, 1, 0, 0.372549, 1,
1.503907, 1.301782, 0.6274235, 1, 0, 0.3647059, 1,
1.506739, 0.6996671, 1.497048, 1, 0, 0.3607843, 1,
1.507938, 1.687757, 0.1640333, 1, 0, 0.3529412, 1,
1.525186, 0.2683958, 1.014174, 1, 0, 0.3490196, 1,
1.531452, 0.1209418, 1.483096, 1, 0, 0.3411765, 1,
1.558575, 0.5954348, 0.1276789, 1, 0, 0.3372549, 1,
1.563907, 0.6576259, 0.8879232, 1, 0, 0.3294118, 1,
1.572418, -0.1059329, 1.096291, 1, 0, 0.3254902, 1,
1.583669, 0.9850202, -1.173559, 1, 0, 0.3176471, 1,
1.593516, -1.098647, 2.421274, 1, 0, 0.3137255, 1,
1.595767, -0.9301742, 3.246042, 1, 0, 0.3058824, 1,
1.597827, 0.7865759, 1.733487, 1, 0, 0.2980392, 1,
1.60625, -1.504954, 0.7638904, 1, 0, 0.2941177, 1,
1.632554, 1.09826, 1.07035, 1, 0, 0.2862745, 1,
1.657137, 0.1268781, 1.998572, 1, 0, 0.282353, 1,
1.670385, -0.5623907, 2.444901, 1, 0, 0.2745098, 1,
1.746455, -0.1899233, 0.1029629, 1, 0, 0.2705882, 1,
1.755145, 0.8291252, 0.5809392, 1, 0, 0.2627451, 1,
1.763746, 0.2156367, 0.2339715, 1, 0, 0.2588235, 1,
1.786337, 1.017022, 2.220814, 1, 0, 0.2509804, 1,
1.792405, 1.680932, 0.4471339, 1, 0, 0.2470588, 1,
1.797176, 0.7453321, -0.1770076, 1, 0, 0.2392157, 1,
1.807542, 1.304061, 0.4263007, 1, 0, 0.2352941, 1,
1.818592, -1.112122, 1.971791, 1, 0, 0.227451, 1,
1.819483, 1.410454, 0.7020416, 1, 0, 0.2235294, 1,
1.834538, -0.589357, 0.4848851, 1, 0, 0.2156863, 1,
1.864512, -0.257979, 2.925389, 1, 0, 0.2117647, 1,
1.871477, 0.4591298, 1.430457, 1, 0, 0.2039216, 1,
1.881413, 1.080487, 0.5670547, 1, 0, 0.1960784, 1,
1.93044, -0.2030906, 0.5281636, 1, 0, 0.1921569, 1,
1.934971, 0.5780736, -1.076522, 1, 0, 0.1843137, 1,
1.936702, -0.07301373, 3.274478, 1, 0, 0.1803922, 1,
1.952641, 0.9914734, 0.8590289, 1, 0, 0.172549, 1,
1.964733, 0.7020625, 2.61997, 1, 0, 0.1686275, 1,
1.965796, 0.4418946, 0.3011079, 1, 0, 0.1607843, 1,
1.977605, 2.130236, -0.8989962, 1, 0, 0.1568628, 1,
1.978095, -1.40297, 1.1233, 1, 0, 0.1490196, 1,
1.984235, 0.9751348, 0.420573, 1, 0, 0.145098, 1,
2.041636, 0.2978812, 1.209329, 1, 0, 0.1372549, 1,
2.047476, -0.4734465, 2.302737, 1, 0, 0.1333333, 1,
2.089331, -2.204766, 1.666952, 1, 0, 0.1254902, 1,
2.092757, 0.5864085, 1.227938, 1, 0, 0.1215686, 1,
2.099706, -0.246683, 0.6907234, 1, 0, 0.1137255, 1,
2.109058, -0.008894576, 0.9849234, 1, 0, 0.1098039, 1,
2.13888, -1.763789, 2.563151, 1, 0, 0.1019608, 1,
2.139737, -1.053753, -0.4962397, 1, 0, 0.09411765, 1,
2.178124, -0.6246721, 2.133046, 1, 0, 0.09019608, 1,
2.212184, -0.558152, 3.969836, 1, 0, 0.08235294, 1,
2.213364, 0.247924, -0.5638067, 1, 0, 0.07843138, 1,
2.307599, -0.4931344, 2.297879, 1, 0, 0.07058824, 1,
2.324033, 1.763537, 1.885084, 1, 0, 0.06666667, 1,
2.365005, 0.400207, 2.591223, 1, 0, 0.05882353, 1,
2.384586, -1.398893, 0.2733972, 1, 0, 0.05490196, 1,
2.424307, -2.125267, 2.79273, 1, 0, 0.04705882, 1,
2.536513, -0.1911163, 0.9117151, 1, 0, 0.04313726, 1,
2.616515, -0.4755875, 2.292484, 1, 0, 0.03529412, 1,
2.745012, 0.543258, -0.8680791, 1, 0, 0.03137255, 1,
2.747401, -1.032486, 2.534644, 1, 0, 0.02352941, 1,
2.900869, 0.1776107, 2.998935, 1, 0, 0.01960784, 1,
2.916025, 0.1070022, 0.5261139, 1, 0, 0.01176471, 1,
3.613296, 0.4749227, 1.448329, 1, 0, 0.007843138, 1
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
0.5133737, -4.359498, -7.739758, 0, -0.5, 0.5, 0.5,
0.5133737, -4.359498, -7.739758, 1, -0.5, 0.5, 0.5,
0.5133737, -4.359498, -7.739758, 1, 1.5, 0.5, 0.5,
0.5133737, -4.359498, -7.739758, 0, 1.5, 0.5, 0.5
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
-3.637422, 0.2110671, -7.739758, 0, -0.5, 0.5, 0.5,
-3.637422, 0.2110671, -7.739758, 1, -0.5, 0.5, 0.5,
-3.637422, 0.2110671, -7.739758, 1, 1.5, 0.5, 0.5,
-3.637422, 0.2110671, -7.739758, 0, 1.5, 0.5, 0.5
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
-3.637422, -4.359498, -0.00437665, 0, -0.5, 0.5, 0.5,
-3.637422, -4.359498, -0.00437665, 1, -0.5, 0.5, 0.5,
-3.637422, -4.359498, -0.00437665, 1, 1.5, 0.5, 0.5,
-3.637422, -4.359498, -0.00437665, 0, 1.5, 0.5, 0.5
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
-2, -3.304752, -5.95467,
3, -3.304752, -5.95467,
-2, -3.304752, -5.95467,
-2, -3.480543, -6.252185,
-1, -3.304752, -5.95467,
-1, -3.480543, -6.252185,
0, -3.304752, -5.95467,
0, -3.480543, -6.252185,
1, -3.304752, -5.95467,
1, -3.480543, -6.252185,
2, -3.304752, -5.95467,
2, -3.480543, -6.252185,
3, -3.304752, -5.95467,
3, -3.480543, -6.252185
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
-2, -3.832125, -6.847214, 0, -0.5, 0.5, 0.5,
-2, -3.832125, -6.847214, 1, -0.5, 0.5, 0.5,
-2, -3.832125, -6.847214, 1, 1.5, 0.5, 0.5,
-2, -3.832125, -6.847214, 0, 1.5, 0.5, 0.5,
-1, -3.832125, -6.847214, 0, -0.5, 0.5, 0.5,
-1, -3.832125, -6.847214, 1, -0.5, 0.5, 0.5,
-1, -3.832125, -6.847214, 1, 1.5, 0.5, 0.5,
-1, -3.832125, -6.847214, 0, 1.5, 0.5, 0.5,
0, -3.832125, -6.847214, 0, -0.5, 0.5, 0.5,
0, -3.832125, -6.847214, 1, -0.5, 0.5, 0.5,
0, -3.832125, -6.847214, 1, 1.5, 0.5, 0.5,
0, -3.832125, -6.847214, 0, 1.5, 0.5, 0.5,
1, -3.832125, -6.847214, 0, -0.5, 0.5, 0.5,
1, -3.832125, -6.847214, 1, -0.5, 0.5, 0.5,
1, -3.832125, -6.847214, 1, 1.5, 0.5, 0.5,
1, -3.832125, -6.847214, 0, 1.5, 0.5, 0.5,
2, -3.832125, -6.847214, 0, -0.5, 0.5, 0.5,
2, -3.832125, -6.847214, 1, -0.5, 0.5, 0.5,
2, -3.832125, -6.847214, 1, 1.5, 0.5, 0.5,
2, -3.832125, -6.847214, 0, 1.5, 0.5, 0.5,
3, -3.832125, -6.847214, 0, -0.5, 0.5, 0.5,
3, -3.832125, -6.847214, 1, -0.5, 0.5, 0.5,
3, -3.832125, -6.847214, 1, 1.5, 0.5, 0.5,
3, -3.832125, -6.847214, 0, 1.5, 0.5, 0.5
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
-2.679546, -3, -5.95467,
-2.679546, 3, -5.95467,
-2.679546, -3, -5.95467,
-2.839192, -3, -6.252185,
-2.679546, -2, -5.95467,
-2.839192, -2, -6.252185,
-2.679546, -1, -5.95467,
-2.839192, -1, -6.252185,
-2.679546, 0, -5.95467,
-2.839192, 0, -6.252185,
-2.679546, 1, -5.95467,
-2.839192, 1, -6.252185,
-2.679546, 2, -5.95467,
-2.839192, 2, -6.252185,
-2.679546, 3, -5.95467,
-2.839192, 3, -6.252185
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
-3.158484, -3, -6.847214, 0, -0.5, 0.5, 0.5,
-3.158484, -3, -6.847214, 1, -0.5, 0.5, 0.5,
-3.158484, -3, -6.847214, 1, 1.5, 0.5, 0.5,
-3.158484, -3, -6.847214, 0, 1.5, 0.5, 0.5,
-3.158484, -2, -6.847214, 0, -0.5, 0.5, 0.5,
-3.158484, -2, -6.847214, 1, -0.5, 0.5, 0.5,
-3.158484, -2, -6.847214, 1, 1.5, 0.5, 0.5,
-3.158484, -2, -6.847214, 0, 1.5, 0.5, 0.5,
-3.158484, -1, -6.847214, 0, -0.5, 0.5, 0.5,
-3.158484, -1, -6.847214, 1, -0.5, 0.5, 0.5,
-3.158484, -1, -6.847214, 1, 1.5, 0.5, 0.5,
-3.158484, -1, -6.847214, 0, 1.5, 0.5, 0.5,
-3.158484, 0, -6.847214, 0, -0.5, 0.5, 0.5,
-3.158484, 0, -6.847214, 1, -0.5, 0.5, 0.5,
-3.158484, 0, -6.847214, 1, 1.5, 0.5, 0.5,
-3.158484, 0, -6.847214, 0, 1.5, 0.5, 0.5,
-3.158484, 1, -6.847214, 0, -0.5, 0.5, 0.5,
-3.158484, 1, -6.847214, 1, -0.5, 0.5, 0.5,
-3.158484, 1, -6.847214, 1, 1.5, 0.5, 0.5,
-3.158484, 1, -6.847214, 0, 1.5, 0.5, 0.5,
-3.158484, 2, -6.847214, 0, -0.5, 0.5, 0.5,
-3.158484, 2, -6.847214, 1, -0.5, 0.5, 0.5,
-3.158484, 2, -6.847214, 1, 1.5, 0.5, 0.5,
-3.158484, 2, -6.847214, 0, 1.5, 0.5, 0.5,
-3.158484, 3, -6.847214, 0, -0.5, 0.5, 0.5,
-3.158484, 3, -6.847214, 1, -0.5, 0.5, 0.5,
-3.158484, 3, -6.847214, 1, 1.5, 0.5, 0.5,
-3.158484, 3, -6.847214, 0, 1.5, 0.5, 0.5
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
-2.679546, -3.304752, -4,
-2.679546, -3.304752, 4,
-2.679546, -3.304752, -4,
-2.839192, -3.480543, -4,
-2.679546, -3.304752, -2,
-2.839192, -3.480543, -2,
-2.679546, -3.304752, 0,
-2.839192, -3.480543, 0,
-2.679546, -3.304752, 2,
-2.839192, -3.480543, 2,
-2.679546, -3.304752, 4,
-2.839192, -3.480543, 4
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
-3.158484, -3.832125, -4, 0, -0.5, 0.5, 0.5,
-3.158484, -3.832125, -4, 1, -0.5, 0.5, 0.5,
-3.158484, -3.832125, -4, 1, 1.5, 0.5, 0.5,
-3.158484, -3.832125, -4, 0, 1.5, 0.5, 0.5,
-3.158484, -3.832125, -2, 0, -0.5, 0.5, 0.5,
-3.158484, -3.832125, -2, 1, -0.5, 0.5, 0.5,
-3.158484, -3.832125, -2, 1, 1.5, 0.5, 0.5,
-3.158484, -3.832125, -2, 0, 1.5, 0.5, 0.5,
-3.158484, -3.832125, 0, 0, -0.5, 0.5, 0.5,
-3.158484, -3.832125, 0, 1, -0.5, 0.5, 0.5,
-3.158484, -3.832125, 0, 1, 1.5, 0.5, 0.5,
-3.158484, -3.832125, 0, 0, 1.5, 0.5, 0.5,
-3.158484, -3.832125, 2, 0, -0.5, 0.5, 0.5,
-3.158484, -3.832125, 2, 1, -0.5, 0.5, 0.5,
-3.158484, -3.832125, 2, 1, 1.5, 0.5, 0.5,
-3.158484, -3.832125, 2, 0, 1.5, 0.5, 0.5,
-3.158484, -3.832125, 4, 0, -0.5, 0.5, 0.5,
-3.158484, -3.832125, 4, 1, -0.5, 0.5, 0.5,
-3.158484, -3.832125, 4, 1, 1.5, 0.5, 0.5,
-3.158484, -3.832125, 4, 0, 1.5, 0.5, 0.5
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
-2.679546, -3.304752, -5.95467,
-2.679546, 3.726886, -5.95467,
-2.679546, -3.304752, 5.945917,
-2.679546, 3.726886, 5.945917,
-2.679546, -3.304752, -5.95467,
-2.679546, -3.304752, 5.945917,
-2.679546, 3.726886, -5.95467,
-2.679546, 3.726886, 5.945917,
-2.679546, -3.304752, -5.95467,
3.706293, -3.304752, -5.95467,
-2.679546, -3.304752, 5.945917,
3.706293, -3.304752, 5.945917,
-2.679546, 3.726886, -5.95467,
3.706293, 3.726886, -5.95467,
-2.679546, 3.726886, 5.945917,
3.706293, 3.726886, 5.945917,
3.706293, -3.304752, -5.95467,
3.706293, 3.726886, -5.95467,
3.706293, -3.304752, 5.945917,
3.706293, 3.726886, 5.945917,
3.706293, -3.304752, -5.95467,
3.706293, -3.304752, 5.945917,
3.706293, 3.726886, -5.95467,
3.706293, 3.726886, 5.945917
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
var radius = 8.130665;
var distance = 36.17425;
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
mvMatrix.translate( -0.5133737, -0.2110671, 0.00437665 );
mvMatrix.scale( 1.376645, 1.250211, 0.7387059 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.17425);
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
cycloxydim<-read.table("cycloxydim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cycloxydim$V2
```

```
## Error in eval(expr, envir, enclos): object 'cycloxydim' not found
```

```r
y<-cycloxydim$V3
```

```
## Error in eval(expr, envir, enclos): object 'cycloxydim' not found
```

```r
z<-cycloxydim$V4
```

```
## Error in eval(expr, envir, enclos): object 'cycloxydim' not found
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
-2.586548, -0.9216139, -2.227212, 0, 0, 1, 1, 1,
-2.58225, -0.2768239, 0.2566351, 1, 0, 0, 1, 1,
-2.422201, -0.08172777, -2.483927, 1, 0, 0, 1, 1,
-2.398945, -0.2337095, -1.579129, 1, 0, 0, 1, 1,
-2.33164, 2.033215, -0.7945544, 1, 0, 0, 1, 1,
-2.259947, -2.124106, -2.907585, 1, 0, 0, 1, 1,
-2.250178, -0.4982111, -0.4472637, 0, 0, 0, 1, 1,
-2.215562, 2.649747, 0.647214, 0, 0, 0, 1, 1,
-2.180977, -0.3754185, -1.874677, 0, 0, 0, 1, 1,
-2.159652, 1.081378, -0.9299144, 0, 0, 0, 1, 1,
-2.159078, -0.2165058, 0.07029685, 0, 0, 0, 1, 1,
-2.146139, 0.6438645, -0.2195471, 0, 0, 0, 1, 1,
-2.144656, -0.4154728, 1.355192, 0, 0, 0, 1, 1,
-2.112606, -0.9169634, -0.5296707, 1, 1, 1, 1, 1,
-2.060791, 0.1021683, -1.949385, 1, 1, 1, 1, 1,
-2.033158, -0.8011833, -1.863114, 1, 1, 1, 1, 1,
-1.997499, -0.509581, -1.453122, 1, 1, 1, 1, 1,
-1.980249, 0.08979409, -0.4485324, 1, 1, 1, 1, 1,
-1.895527, 1.30764, -1.711216, 1, 1, 1, 1, 1,
-1.893866, -0.9107271, -0.6960819, 1, 1, 1, 1, 1,
-1.871111, -0.9288519, -2.053268, 1, 1, 1, 1, 1,
-1.861724, -0.218355, -2.397922, 1, 1, 1, 1, 1,
-1.830938, -0.6910654, -3.033868, 1, 1, 1, 1, 1,
-1.824036, -1.181876, -0.1670541, 1, 1, 1, 1, 1,
-1.823865, 1.694676, -1.453312, 1, 1, 1, 1, 1,
-1.819818, 0.2156798, -2.346504, 1, 1, 1, 1, 1,
-1.780728, -1.37946, -2.711244, 1, 1, 1, 1, 1,
-1.770626, 0.3728439, 0.1644545, 1, 1, 1, 1, 1,
-1.767686, 0.5942465, -1.183551, 0, 0, 1, 1, 1,
-1.743355, -1.339059, -2.348483, 1, 0, 0, 1, 1,
-1.736901, -0.1325459, -1.503921, 1, 0, 0, 1, 1,
-1.730377, 2.5427, 0.8913566, 1, 0, 0, 1, 1,
-1.727926, 0.2435931, -0.5904319, 1, 0, 0, 1, 1,
-1.725726, -2.31376, -2.701235, 1, 0, 0, 1, 1,
-1.722838, -0.8481846, -2.529477, 0, 0, 0, 1, 1,
-1.719945, 1.212345, -0.8409571, 0, 0, 0, 1, 1,
-1.698065, -1.348881, -2.603142, 0, 0, 0, 1, 1,
-1.686352, -0.9409552, -2.492782, 0, 0, 0, 1, 1,
-1.671013, -2.215186, -2.778985, 0, 0, 0, 1, 1,
-1.650798, 2.215159, -0.07277562, 0, 0, 0, 1, 1,
-1.644951, -0.6655275, -1.70948, 0, 0, 0, 1, 1,
-1.638644, 0.3596959, 0.8257142, 1, 1, 1, 1, 1,
-1.625907, 0.2665264, -1.461226, 1, 1, 1, 1, 1,
-1.614138, -1.984255, -1.525773, 1, 1, 1, 1, 1,
-1.612885, -0.138073, -1.466656, 1, 1, 1, 1, 1,
-1.592542, -0.04037521, -3.208836, 1, 1, 1, 1, 1,
-1.592487, 0.125789, -2.222485, 1, 1, 1, 1, 1,
-1.590756, 1.747176, -0.2977383, 1, 1, 1, 1, 1,
-1.579581, 0.260993, -1.869508, 1, 1, 1, 1, 1,
-1.572693, -1.178591, -2.768198, 1, 1, 1, 1, 1,
-1.565155, 0.652078, -3.237329, 1, 1, 1, 1, 1,
-1.557843, -1.024725, -2.773718, 1, 1, 1, 1, 1,
-1.556739, 0.6835692, -2.283947, 1, 1, 1, 1, 1,
-1.541599, 0.8155996, 0.1651585, 1, 1, 1, 1, 1,
-1.52349, 0.09588091, -1.091069, 1, 1, 1, 1, 1,
-1.516014, 0.07758518, -1.131513, 1, 1, 1, 1, 1,
-1.504229, -1.537985, -2.636058, 0, 0, 1, 1, 1,
-1.499002, 0.2508109, -1.288392, 1, 0, 0, 1, 1,
-1.480619, -0.1137334, -2.100164, 1, 0, 0, 1, 1,
-1.474738, -1.233811, -1.925709, 1, 0, 0, 1, 1,
-1.47429, -0.9390885, -3.412284, 1, 0, 0, 1, 1,
-1.464444, 1.035835, -0.3386435, 1, 0, 0, 1, 1,
-1.439668, -0.4494829, -1.841884, 0, 0, 0, 1, 1,
-1.428847, 1.550105, -0.4581139, 0, 0, 0, 1, 1,
-1.414184, 0.08225794, -1.833605, 0, 0, 0, 1, 1,
-1.410624, 0.4898514, -2.453361, 0, 0, 0, 1, 1,
-1.406346, 1.891613, -0.7040378, 0, 0, 0, 1, 1,
-1.39819, 0.6270363, -2.48627, 0, 0, 0, 1, 1,
-1.392594, 0.6179773, -2.235975, 0, 0, 0, 1, 1,
-1.387311, 0.2941616, -1.725489, 1, 1, 1, 1, 1,
-1.37235, -0.9501822, -1.652953, 1, 1, 1, 1, 1,
-1.372167, 0.7424256, -0.6407105, 1, 1, 1, 1, 1,
-1.371123, 0.6782967, -0.3466501, 1, 1, 1, 1, 1,
-1.365601, 0.7031975, 0.3514699, 1, 1, 1, 1, 1,
-1.347785, -0.1204615, -2.606766, 1, 1, 1, 1, 1,
-1.347056, -0.3173696, -3.352806, 1, 1, 1, 1, 1,
-1.345357, 0.3031963, -0.1208323, 1, 1, 1, 1, 1,
-1.343204, -0.7287999, -2.063949, 1, 1, 1, 1, 1,
-1.337012, -0.06779784, -0.541115, 1, 1, 1, 1, 1,
-1.331545, 0.6072767, -2.537021, 1, 1, 1, 1, 1,
-1.331306, -1.382005, 0.1850592, 1, 1, 1, 1, 1,
-1.326704, -0.8299647, -4.207264, 1, 1, 1, 1, 1,
-1.324803, -0.2319383, -0.8065464, 1, 1, 1, 1, 1,
-1.310721, 0.237336, -3.006558, 1, 1, 1, 1, 1,
-1.308225, -1.839082, -4.230237, 0, 0, 1, 1, 1,
-1.286775, 0.5624791, -1.282037, 1, 0, 0, 1, 1,
-1.285581, 1.064234, -2.640943, 1, 0, 0, 1, 1,
-1.281493, 1.089063, -2.000819, 1, 0, 0, 1, 1,
-1.280168, 1.090871, -1.274126, 1, 0, 0, 1, 1,
-1.278228, 0.9054874, -1.168776, 1, 0, 0, 1, 1,
-1.276781, 0.1410224, -3.163225, 0, 0, 0, 1, 1,
-1.270341, 0.08113211, 0.2590185, 0, 0, 0, 1, 1,
-1.269587, 0.2921649, -0.5234063, 0, 0, 0, 1, 1,
-1.268787, -2.222513, -2.692738, 0, 0, 0, 1, 1,
-1.264565, 0.4407673, -1.079144, 0, 0, 0, 1, 1,
-1.251712, -1.587187, -2.313178, 0, 0, 0, 1, 1,
-1.249889, 1.748977, 0.2193367, 0, 0, 0, 1, 1,
-1.244997, 0.8411339, 0.7670021, 1, 1, 1, 1, 1,
-1.23489, 0.6046576, -0.3112882, 1, 1, 1, 1, 1,
-1.232172, -1.028914, -1.621383, 1, 1, 1, 1, 1,
-1.228596, -0.04455739, -0.4381451, 1, 1, 1, 1, 1,
-1.225812, 1.363981, -1.108963, 1, 1, 1, 1, 1,
-1.219973, 1.234186, -0.5143128, 1, 1, 1, 1, 1,
-1.213971, 0.4974824, -0.5918847, 1, 1, 1, 1, 1,
-1.212211, 2.118423, -0.3756771, 1, 1, 1, 1, 1,
-1.207766, 0.9125423, -0.2683408, 1, 1, 1, 1, 1,
-1.190724, -0.9610302, -1.990007, 1, 1, 1, 1, 1,
-1.18936, -0.2068735, -2.636623, 1, 1, 1, 1, 1,
-1.183564, -1.68374, -2.828715, 1, 1, 1, 1, 1,
-1.182616, -0.04311309, -1.954373, 1, 1, 1, 1, 1,
-1.181938, 0.6917637, -0.3482402, 1, 1, 1, 1, 1,
-1.180104, 0.4392484, -1.295087, 1, 1, 1, 1, 1,
-1.175161, 0.1668954, -1.557244, 0, 0, 1, 1, 1,
-1.170609, 1.3244, 0.7597683, 1, 0, 0, 1, 1,
-1.170043, 0.4836744, -0.5439656, 1, 0, 0, 1, 1,
-1.167781, -0.8053737, -1.938824, 1, 0, 0, 1, 1,
-1.166397, -1.004362, -1.98772, 1, 0, 0, 1, 1,
-1.164303, 0.6085116, -0.240163, 1, 0, 0, 1, 1,
-1.162203, 0.4265361, -1.781587, 0, 0, 0, 1, 1,
-1.156591, -2.356843, -1.619103, 0, 0, 0, 1, 1,
-1.151528, 0.9637356, -1.340077, 0, 0, 0, 1, 1,
-1.150988, -0.1491218, -1.797989, 0, 0, 0, 1, 1,
-1.144302, 0.4300388, -2.191887, 0, 0, 0, 1, 1,
-1.138764, 2.350173, 1.157542, 0, 0, 0, 1, 1,
-1.129661, -1.97645, -1.882858, 0, 0, 0, 1, 1,
-1.120563, 0.4075125, -0.503114, 1, 1, 1, 1, 1,
-1.120347, 0.4075138, -2.293381, 1, 1, 1, 1, 1,
-1.112511, -0.04500176, -0.7465928, 1, 1, 1, 1, 1,
-1.110719, 0.3642973, -0.8598744, 1, 1, 1, 1, 1,
-1.1106, -1.688553, -2.51587, 1, 1, 1, 1, 1,
-1.105218, 1.060509, -0.3847853, 1, 1, 1, 1, 1,
-1.100494, -1.196725, -2.104904, 1, 1, 1, 1, 1,
-1.100387, -0.1465492, -0.6768509, 1, 1, 1, 1, 1,
-1.09655, -2.034949, -1.610582, 1, 1, 1, 1, 1,
-1.096022, 0.328916, -1.345198, 1, 1, 1, 1, 1,
-1.094583, 1.172377, -0.1805441, 1, 1, 1, 1, 1,
-1.088355, -0.5030738, -1.935751, 1, 1, 1, 1, 1,
-1.085253, -0.01474073, -2.030282, 1, 1, 1, 1, 1,
-1.081999, 2.062206, -0.9393542, 1, 1, 1, 1, 1,
-1.079234, 0.4371749, -0.5379074, 1, 1, 1, 1, 1,
-1.0772, 0.6059595, -0.3820485, 0, 0, 1, 1, 1,
-1.073041, -1.530781, -1.675858, 1, 0, 0, 1, 1,
-1.068392, -0.8147969, -2.150373, 1, 0, 0, 1, 1,
-1.066401, -0.4074353, -0.2368541, 1, 0, 0, 1, 1,
-1.063728, 1.276545, 0.6559591, 1, 0, 0, 1, 1,
-1.062603, 1.792136, -1.004455, 1, 0, 0, 1, 1,
-1.058526, -0.6482635, -1.501683, 0, 0, 0, 1, 1,
-1.057245, -0.3666389, -0.863774, 0, 0, 0, 1, 1,
-1.048881, 0.03542243, -2.352348, 0, 0, 0, 1, 1,
-1.048499, 1.485364, -0.2747629, 0, 0, 0, 1, 1,
-1.047702, -1.242193, -1.993118, 0, 0, 0, 1, 1,
-1.044186, 0.08147456, -2.852612, 0, 0, 0, 1, 1,
-1.043223, -1.31795, -1.886987, 0, 0, 0, 1, 1,
-1.043029, 0.08104628, -2.313165, 1, 1, 1, 1, 1,
-1.042275, -0.4652835, -2.695641, 1, 1, 1, 1, 1,
-1.041908, -0.6432557, -4.508636, 1, 1, 1, 1, 1,
-1.03803, -0.2557294, -0.9786721, 1, 1, 1, 1, 1,
-1.037309, -1.423682, -1.921632, 1, 1, 1, 1, 1,
-1.027454, -1.309379, -3.017061, 1, 1, 1, 1, 1,
-1.025349, -0.9165242, -0.9067716, 1, 1, 1, 1, 1,
-1.024909, -1.36555, -1.70749, 1, 1, 1, 1, 1,
-1.016006, 1.352548, -0.77541, 1, 1, 1, 1, 1,
-1.013714, 1.624525, -0.5145237, 1, 1, 1, 1, 1,
-1.007052, 1.082771, -1.552152, 1, 1, 1, 1, 1,
-0.9988672, -0.03095944, -1.392911, 1, 1, 1, 1, 1,
-0.9907631, 0.8366323, -2.922173, 1, 1, 1, 1, 1,
-0.9783617, -0.6108941, -3.020953, 1, 1, 1, 1, 1,
-0.9772459, -0.2533667, -0.9802161, 1, 1, 1, 1, 1,
-0.9752225, -0.2007948, -0.9931484, 0, 0, 1, 1, 1,
-0.9715155, -0.6412332, -1.76502, 1, 0, 0, 1, 1,
-0.9692982, -0.7754341, -2.477184, 1, 0, 0, 1, 1,
-0.9682121, 0.4308539, -0.9329755, 1, 0, 0, 1, 1,
-0.9667163, -1.926984, -2.324685, 1, 0, 0, 1, 1,
-0.9619486, -0.512156, -2.886797, 1, 0, 0, 1, 1,
-0.9573529, -0.7744398, -1.784687, 0, 0, 0, 1, 1,
-0.9527889, 0.2971791, -2.881642, 0, 0, 0, 1, 1,
-0.9519895, -0.5170282, -2.577417, 0, 0, 0, 1, 1,
-0.9470648, -1.678601, -3.705943, 0, 0, 0, 1, 1,
-0.9356095, -0.2332719, -1.241118, 0, 0, 0, 1, 1,
-0.9338579, 3.624484, -0.8906156, 0, 0, 0, 1, 1,
-0.9332657, -0.2829657, -3.091761, 0, 0, 0, 1, 1,
-0.9303214, 0.4440306, -2.023237, 1, 1, 1, 1, 1,
-0.9293071, -0.8977335, -2.208065, 1, 1, 1, 1, 1,
-0.9288538, 0.1833485, -2.485441, 1, 1, 1, 1, 1,
-0.9287124, 1.034035, 0.1647991, 1, 1, 1, 1, 1,
-0.9280189, -3.109935, -3.300995, 1, 1, 1, 1, 1,
-0.9247615, 0.9782189, -0.4768361, 1, 1, 1, 1, 1,
-0.9176343, -0.375461, -1.834769, 1, 1, 1, 1, 1,
-0.9151158, -0.3895214, -1.701762, 1, 1, 1, 1, 1,
-0.9071254, 0.6319228, -2.481251, 1, 1, 1, 1, 1,
-0.8911945, 0.6917638, -0.3373711, 1, 1, 1, 1, 1,
-0.8908038, 1.56764, -0.5085281, 1, 1, 1, 1, 1,
-0.8847409, 0.1799011, -2.297881, 1, 1, 1, 1, 1,
-0.8809734, 1.730509, -0.2982517, 1, 1, 1, 1, 1,
-0.8806875, -0.4558503, -2.615641, 1, 1, 1, 1, 1,
-0.8682595, -0.6626086, -3.563965, 1, 1, 1, 1, 1,
-0.8646056, 1.135269, 0.09838818, 0, 0, 1, 1, 1,
-0.8631786, 0.106009, -0.371742, 1, 0, 0, 1, 1,
-0.8579162, 0.067517, -2.364961, 1, 0, 0, 1, 1,
-0.8524099, -0.4686831, -1.644902, 1, 0, 0, 1, 1,
-0.8444994, 1.475326, -1.90301, 1, 0, 0, 1, 1,
-0.8395261, 0.482479, 0.19198, 1, 0, 0, 1, 1,
-0.8361561, 1.999062, -1.795046, 0, 0, 0, 1, 1,
-0.8354464, -1.24657, -1.713298, 0, 0, 0, 1, 1,
-0.8320917, -0.2923939, -3.054322, 0, 0, 0, 1, 1,
-0.8202839, -1.263637, -1.959532, 0, 0, 0, 1, 1,
-0.8194737, 0.9337465, -1.385027, 0, 0, 0, 1, 1,
-0.8170315, 0.1982542, -0.9415926, 0, 0, 0, 1, 1,
-0.8119312, -1.199898, -2.36382, 0, 0, 0, 1, 1,
-0.8044204, -0.1147353, -0.09811606, 1, 1, 1, 1, 1,
-0.8043154, -0.1767187, -2.688132, 1, 1, 1, 1, 1,
-0.7991809, 0.5067036, -0.2287679, 1, 1, 1, 1, 1,
-0.7947412, -0.5174932, -2.043529, 1, 1, 1, 1, 1,
-0.7932442, 0.4623812, -3.260974, 1, 1, 1, 1, 1,
-0.7925357, 0.6025807, -1.08891, 1, 1, 1, 1, 1,
-0.7910531, 0.7960189, 0.141623, 1, 1, 1, 1, 1,
-0.7867677, -0.5231728, -2.895896, 1, 1, 1, 1, 1,
-0.7857345, 0.6236808, -0.7724758, 1, 1, 1, 1, 1,
-0.7804447, -1.256435, -4.033886, 1, 1, 1, 1, 1,
-0.7660855, 0.148132, -1.334821, 1, 1, 1, 1, 1,
-0.7660136, -0.456389, -3.103714, 1, 1, 1, 1, 1,
-0.7642844, -1.326998, -2.769506, 1, 1, 1, 1, 1,
-0.7642727, -0.6455393, -2.042992, 1, 1, 1, 1, 1,
-0.7642049, 0.05973975, -1.901039, 1, 1, 1, 1, 1,
-0.7633, 0.171772, -1.843637, 0, 0, 1, 1, 1,
-0.7615964, 0.8996077, -3.842716, 1, 0, 0, 1, 1,
-0.7575079, 0.02578617, -2.775666, 1, 0, 0, 1, 1,
-0.7547252, 1.182124, 0.2720152, 1, 0, 0, 1, 1,
-0.7477595, 0.9781818, -1.104206, 1, 0, 0, 1, 1,
-0.7468984, 0.4193825, -0.1287897, 1, 0, 0, 1, 1,
-0.7458113, -1.7044, -2.517131, 0, 0, 0, 1, 1,
-0.741208, -1.041784, -1.076014, 0, 0, 0, 1, 1,
-0.7398506, -1.038741, -2.521878, 0, 0, 0, 1, 1,
-0.7336829, 0.8243952, -1.290927, 0, 0, 0, 1, 1,
-0.7285281, 2.39061, -0.6951351, 0, 0, 0, 1, 1,
-0.7152368, 0.1761449, 0.3062722, 0, 0, 0, 1, 1,
-0.7132297, 0.3194841, -1.447007, 0, 0, 0, 1, 1,
-0.7113134, 0.4640336, -1.92433, 1, 1, 1, 1, 1,
-0.7079164, 0.08331807, -0.7210944, 1, 1, 1, 1, 1,
-0.7001426, -0.4222128, -1.387451, 1, 1, 1, 1, 1,
-0.6958824, 1.040802, -0.8351519, 1, 1, 1, 1, 1,
-0.6898566, 0.1045304, -2.963623, 1, 1, 1, 1, 1,
-0.6796175, 0.781578, -0.3987108, 1, 1, 1, 1, 1,
-0.6793658, 0.3633004, -1.655396, 1, 1, 1, 1, 1,
-0.6785031, -0.1610776, -1.108246, 1, 1, 1, 1, 1,
-0.676891, 0.8216438, 0.1210657, 1, 1, 1, 1, 1,
-0.6749569, -1.129153, -2.134141, 1, 1, 1, 1, 1,
-0.6747963, 1.167958, -0.5043225, 1, 1, 1, 1, 1,
-0.6704919, 0.4054597, -0.951884, 1, 1, 1, 1, 1,
-0.6680834, 0.6664104, -1.511706, 1, 1, 1, 1, 1,
-0.667856, -2.528962, -2.09967, 1, 1, 1, 1, 1,
-0.6667007, -0.4430847, 0.3943149, 1, 1, 1, 1, 1,
-0.6537993, -0.8485542, -4.095936, 0, 0, 1, 1, 1,
-0.6503146, -1.050767, -2.581977, 1, 0, 0, 1, 1,
-0.6470037, 0.6373729, 0.1719711, 1, 0, 0, 1, 1,
-0.6442057, 0.1078842, -0.1183614, 1, 0, 0, 1, 1,
-0.6412182, -0.0007024192, -2.177392, 1, 0, 0, 1, 1,
-0.6388909, 1.108661, -1.618107, 1, 0, 0, 1, 1,
-0.638743, -0.6002715, -2.96458, 0, 0, 0, 1, 1,
-0.6377957, 1.429976, 0.9510005, 0, 0, 0, 1, 1,
-0.6369049, 1.012336, -0.7497375, 0, 0, 0, 1, 1,
-0.6360481, -0.4328524, -1.261893, 0, 0, 0, 1, 1,
-0.6337337, -0.6797008, -1.884333, 0, 0, 0, 1, 1,
-0.6322756, 0.972074, -0.4298081, 0, 0, 0, 1, 1,
-0.6317376, -1.340297, -0.6054956, 0, 0, 0, 1, 1,
-0.6312427, 1.106192, -2.060279, 1, 1, 1, 1, 1,
-0.621511, 1.776963, -0.8950402, 1, 1, 1, 1, 1,
-0.621084, -1.128433, -1.734049, 1, 1, 1, 1, 1,
-0.6204058, 1.214149, 2.239182, 1, 1, 1, 1, 1,
-0.6182042, -0.8260462, -3.991667, 1, 1, 1, 1, 1,
-0.6178496, -1.363554, -2.558928, 1, 1, 1, 1, 1,
-0.6165106, -1.921695, -4.139305, 1, 1, 1, 1, 1,
-0.6154487, 0.7988597, -1.137094, 1, 1, 1, 1, 1,
-0.6104217, -0.5338957, -0.07344609, 1, 1, 1, 1, 1,
-0.6077608, 0.9720868, 0.4207813, 1, 1, 1, 1, 1,
-0.6063157, -0.01229393, -0.1290595, 1, 1, 1, 1, 1,
-0.6055008, -1.740052, -2.903346, 1, 1, 1, 1, 1,
-0.6033314, -2.03845, -2.610308, 1, 1, 1, 1, 1,
-0.6028487, 0.4846438, -1.771659, 1, 1, 1, 1, 1,
-0.6012912, 0.357152, -0.1081236, 1, 1, 1, 1, 1,
-0.5866684, -0.3636588, -2.516689, 0, 0, 1, 1, 1,
-0.5866309, 0.7348391, 2.203738, 1, 0, 0, 1, 1,
-0.5842496, 1.82646, 2.967908, 1, 0, 0, 1, 1,
-0.5830992, -0.09379772, -0.9048771, 1, 0, 0, 1, 1,
-0.5761745, 0.0950339, -1.689101, 1, 0, 0, 1, 1,
-0.573738, 1.105924, 1.149733, 1, 0, 0, 1, 1,
-0.57262, -0.1003755, -0.6349492, 0, 0, 0, 1, 1,
-0.5716825, -0.4919799, -2.902865, 0, 0, 0, 1, 1,
-0.5716442, 1.572351, 1.942267, 0, 0, 0, 1, 1,
-0.5664932, -1.038741, -4.759807, 0, 0, 0, 1, 1,
-0.5661102, 0.8325899, 1.167552, 0, 0, 0, 1, 1,
-0.5638574, -0.01496261, -2.316396, 0, 0, 0, 1, 1,
-0.5502518, -0.05494857, -1.985952, 0, 0, 0, 1, 1,
-0.5421714, 0.1896998, -0.5363972, 1, 1, 1, 1, 1,
-0.5401924, -0.4159766, -2.130511, 1, 1, 1, 1, 1,
-0.5369291, 1.194106, 0.6962464, 1, 1, 1, 1, 1,
-0.5284992, -1.11939, -3.814713, 1, 1, 1, 1, 1,
-0.5276338, -0.02247156, -0.4324327, 1, 1, 1, 1, 1,
-0.527504, 2.461615, 0.5618413, 1, 1, 1, 1, 1,
-0.5265876, -1.493279, -2.385098, 1, 1, 1, 1, 1,
-0.5258954, -1.194672, -3.050272, 1, 1, 1, 1, 1,
-0.5207317, 1.040133, -1.012913, 1, 1, 1, 1, 1,
-0.5200709, -0.03485803, -1.072328, 1, 1, 1, 1, 1,
-0.5182132, 0.4327982, -0.5248218, 1, 1, 1, 1, 1,
-0.516001, -1.536173, -3.660843, 1, 1, 1, 1, 1,
-0.5144634, 0.004268975, -1.187463, 1, 1, 1, 1, 1,
-0.5125387, -0.9689059, -1.893272, 1, 1, 1, 1, 1,
-0.5124443, -1.473564, -1.159081, 1, 1, 1, 1, 1,
-0.5121084, -0.299253, -2.094479, 0, 0, 1, 1, 1,
-0.5118893, 2.635168, 0.5681404, 1, 0, 0, 1, 1,
-0.5095946, -0.7864524, -4.014633, 1, 0, 0, 1, 1,
-0.5002624, 0.7964552, -0.5390097, 1, 0, 0, 1, 1,
-0.4945657, -0.9857519, -0.3080157, 1, 0, 0, 1, 1,
-0.4927881, -0.1807607, -2.152273, 1, 0, 0, 1, 1,
-0.492324, -0.005588633, -1.673127, 0, 0, 0, 1, 1,
-0.4862297, 0.8297751, -2.132574, 0, 0, 0, 1, 1,
-0.480534, -1.080201, -3.807582, 0, 0, 0, 1, 1,
-0.4780634, 1.185304, -1.455878, 0, 0, 0, 1, 1,
-0.4723723, -0.2117259, -1.432291, 0, 0, 0, 1, 1,
-0.4696674, -0.1600359, -2.377658, 0, 0, 0, 1, 1,
-0.4695165, 1.391985, -0.8133065, 0, 0, 0, 1, 1,
-0.4616109, 0.0911064, -1.704755, 1, 1, 1, 1, 1,
-0.4537124, -0.2599993, -3.715222, 1, 1, 1, 1, 1,
-0.4486779, -1.510223, -3.109591, 1, 1, 1, 1, 1,
-0.4411941, 1.384507, -0.7336873, 1, 1, 1, 1, 1,
-0.4380556, -0.8086153, -2.512576, 1, 1, 1, 1, 1,
-0.433418, -1.796532, -3.492989, 1, 1, 1, 1, 1,
-0.4310134, -0.5549449, -3.4249, 1, 1, 1, 1, 1,
-0.4294628, -0.768855, -1.314277, 1, 1, 1, 1, 1,
-0.4271812, -0.3239911, -2.774403, 1, 1, 1, 1, 1,
-0.4257271, 1.254697, 1.58209, 1, 1, 1, 1, 1,
-0.4230241, 0.2358508, -0.7375671, 1, 1, 1, 1, 1,
-0.4220613, 0.8640232, -1.599637, 1, 1, 1, 1, 1,
-0.4185548, -0.7087928, -2.108313, 1, 1, 1, 1, 1,
-0.4145918, -0.7866308, -3.311359, 1, 1, 1, 1, 1,
-0.4086519, -0.686586, -3.148511, 1, 1, 1, 1, 1,
-0.4038838, 0.3172092, -2.314811, 0, 0, 1, 1, 1,
-0.4013141, 1.080901, 0.3258257, 1, 0, 0, 1, 1,
-0.4009559, -0.7229428, -3.487558, 1, 0, 0, 1, 1,
-0.3990362, -0.3026415, -1.99536, 1, 0, 0, 1, 1,
-0.3973588, -0.7689469, -4.63462, 1, 0, 0, 1, 1,
-0.3964208, -0.2511179, -2.750158, 1, 0, 0, 1, 1,
-0.3954388, -1.035997, -2.658139, 0, 0, 0, 1, 1,
-0.3916513, 1.007513, -4.21147, 0, 0, 0, 1, 1,
-0.39017, -0.1524358, -2.708383, 0, 0, 0, 1, 1,
-0.3842649, 0.05650404, -1.77922, 0, 0, 0, 1, 1,
-0.3839816, 0.6053078, -1.490197, 0, 0, 0, 1, 1,
-0.3785657, 1.26564, -2.83831, 0, 0, 0, 1, 1,
-0.3746894, -0.5612947, -4.290988, 0, 0, 0, 1, 1,
-0.3722993, 0.2410709, -1.548847, 1, 1, 1, 1, 1,
-0.3705178, 0.8146824, -1.852262, 1, 1, 1, 1, 1,
-0.3685615, 0.9175882, 0.4294686, 1, 1, 1, 1, 1,
-0.3571965, -0.5608848, -1.351895, 1, 1, 1, 1, 1,
-0.3543336, 1.669402, -2.002683, 1, 1, 1, 1, 1,
-0.3513522, -1.942877, -5.296456, 1, 1, 1, 1, 1,
-0.3471859, 0.2669345, -0.007310377, 1, 1, 1, 1, 1,
-0.3374974, 0.419657, -1.639338, 1, 1, 1, 1, 1,
-0.3363903, 1.470235, 0.5218997, 1, 1, 1, 1, 1,
-0.335704, -0.04555511, -1.355848, 1, 1, 1, 1, 1,
-0.3349207, 0.4964351, 0.4842583, 1, 1, 1, 1, 1,
-0.3340624, -1.581513, -4.317442, 1, 1, 1, 1, 1,
-0.3277548, -1.182929, -3.978416, 1, 1, 1, 1, 1,
-0.3236369, 0.2255386, -0.9261314, 1, 1, 1, 1, 1,
-0.3204919, -0.5219715, -2.438715, 1, 1, 1, 1, 1,
-0.319066, 0.1558966, -0.9218746, 0, 0, 1, 1, 1,
-0.314413, 0.9228759, -0.6126899, 1, 0, 0, 1, 1,
-0.3114785, -1.03786, -2.185083, 1, 0, 0, 1, 1,
-0.3103894, -0.06776226, -1.540495, 1, 0, 0, 1, 1,
-0.3079346, 0.04013553, -1.997571, 1, 0, 0, 1, 1,
-0.3029303, -1.489579, -4.490045, 1, 0, 0, 1, 1,
-0.3027402, -1.174712, -3.806095, 0, 0, 0, 1, 1,
-0.3022656, -1.850128, -3.134216, 0, 0, 0, 1, 1,
-0.2994188, 0.8459672, -0.2909769, 0, 0, 0, 1, 1,
-0.2992306, 0.9460634, 1.189208, 0, 0, 0, 1, 1,
-0.299087, -1.889461, -2.468385, 0, 0, 0, 1, 1,
-0.2926929, 2.155344, 0.4753412, 0, 0, 0, 1, 1,
-0.2893455, 0.3163389, -0.3923588, 0, 0, 0, 1, 1,
-0.2876624, -0.05284507, -0.1803098, 1, 1, 1, 1, 1,
-0.2870234, -1.23472, -2.652778, 1, 1, 1, 1, 1,
-0.2849386, 0.8480085, -2.314206, 1, 1, 1, 1, 1,
-0.2819129, -0.8976511, -2.878152, 1, 1, 1, 1, 1,
-0.2730854, 0.05586657, -1.512734, 1, 1, 1, 1, 1,
-0.2705728, -0.604326, -3.762639, 1, 1, 1, 1, 1,
-0.2674867, -1.061222, -4.173764, 1, 1, 1, 1, 1,
-0.2655989, -0.8963245, -3.085927, 1, 1, 1, 1, 1,
-0.2645466, 0.4755214, -1.13859, 1, 1, 1, 1, 1,
-0.2628683, -0.5139635, -2.891008, 1, 1, 1, 1, 1,
-0.2574465, 1.609586, -1.464266, 1, 1, 1, 1, 1,
-0.2567226, -0.5552985, -2.346314, 1, 1, 1, 1, 1,
-0.2535596, 0.05256946, -1.587683, 1, 1, 1, 1, 1,
-0.2452289, 0.532942, -0.7056003, 1, 1, 1, 1, 1,
-0.2435324, -0.4656603, -1.94884, 1, 1, 1, 1, 1,
-0.241737, -0.03502214, -1.654424, 0, 0, 1, 1, 1,
-0.2397606, 0.07380888, -1.670844, 1, 0, 0, 1, 1,
-0.2349076, 1.473357, 1.011378, 1, 0, 0, 1, 1,
-0.2335122, 0.5377062, -1.911999, 1, 0, 0, 1, 1,
-0.2332291, 1.637951, -0.2733832, 1, 0, 0, 1, 1,
-0.2313861, 0.764865, -0.03115818, 1, 0, 0, 1, 1,
-0.2302307, 1.469878, -0.09781253, 0, 0, 0, 1, 1,
-0.2300226, 0.1662313, 0.4211518, 0, 0, 0, 1, 1,
-0.2290338, 0.5327423, -0.959365, 0, 0, 0, 1, 1,
-0.228586, -0.2006118, -1.7254, 0, 0, 0, 1, 1,
-0.2274368, 0.3817278, -1.591513, 0, 0, 0, 1, 1,
-0.2212769, -0.008784292, -1.321301, 0, 0, 0, 1, 1,
-0.2176437, 0.7528633, 0.1171892, 0, 0, 0, 1, 1,
-0.2143809, 0.984004, -0.366293, 1, 1, 1, 1, 1,
-0.2141387, -0.9581933, -2.134889, 1, 1, 1, 1, 1,
-0.2134658, 0.7124206, -0.1229561, 1, 1, 1, 1, 1,
-0.2088711, 1.253033, 0.7236641, 1, 1, 1, 1, 1,
-0.2071205, -0.4092382, -2.967668, 1, 1, 1, 1, 1,
-0.20681, 0.5489141, 0.5755954, 1, 1, 1, 1, 1,
-0.2051211, -1.778668, -3.801277, 1, 1, 1, 1, 1,
-0.2041434, 1.834041, 0.1194422, 1, 1, 1, 1, 1,
-0.2001991, -1.430655, -3.329069, 1, 1, 1, 1, 1,
-0.2001431, -0.7920325, -2.802685, 1, 1, 1, 1, 1,
-0.1934224, -0.2383123, -2.447377, 1, 1, 1, 1, 1,
-0.1898603, -0.5991169, -2.273776, 1, 1, 1, 1, 1,
-0.184633, 0.7501829, -0.3352681, 1, 1, 1, 1, 1,
-0.1834888, -1.071493, -3.56226, 1, 1, 1, 1, 1,
-0.181286, -0.4389369, -3.852423, 1, 1, 1, 1, 1,
-0.181018, -0.2905306, -2.829015, 0, 0, 1, 1, 1,
-0.1792226, 1.794366, -0.593026, 1, 0, 0, 1, 1,
-0.1788328, 0.5506202, -1.527669, 1, 0, 0, 1, 1,
-0.1765068, 0.5309437, -1.122951, 1, 0, 0, 1, 1,
-0.175333, -1.051123, -2.110416, 1, 0, 0, 1, 1,
-0.1729164, -1.469239, -2.594119, 1, 0, 0, 1, 1,
-0.1724179, -0.5127918, -2.765938, 0, 0, 0, 1, 1,
-0.1704244, 0.2321272, -0.1742104, 0, 0, 0, 1, 1,
-0.1654643, 1.594708, 0.3100639, 0, 0, 0, 1, 1,
-0.1653931, -0.01602337, -1.967901, 0, 0, 0, 1, 1,
-0.1650808, -1.355292, -2.990754, 0, 0, 0, 1, 1,
-0.1589953, 0.04842774, -3.288596, 0, 0, 0, 1, 1,
-0.1554224, -0.2609965, -3.363601, 0, 0, 0, 1, 1,
-0.1524934, 1.471496, 0.9563464, 1, 1, 1, 1, 1,
-0.1524403, -0.07741274, -2.539748, 1, 1, 1, 1, 1,
-0.1511229, -1.843949, -4.580983, 1, 1, 1, 1, 1,
-0.1447568, -0.855467, -2.970294, 1, 1, 1, 1, 1,
-0.1409768, 0.1380875, -1.234605, 1, 1, 1, 1, 1,
-0.1393532, -0.0933536, -3.047876, 1, 1, 1, 1, 1,
-0.1365851, 1.563791, -1.524647, 1, 1, 1, 1, 1,
-0.1360159, -1.186319, -4.569354, 1, 1, 1, 1, 1,
-0.1331376, -1.017372, -1.782064, 1, 1, 1, 1, 1,
-0.1328096, 0.9784989, 0.4292452, 1, 1, 1, 1, 1,
-0.1296702, 1.19658, -0.1339969, 1, 1, 1, 1, 1,
-0.1294783, 0.4656377, -1.51123, 1, 1, 1, 1, 1,
-0.1290757, 0.620644, 0.295915, 1, 1, 1, 1, 1,
-0.1255484, -1.611821, -4.184949, 1, 1, 1, 1, 1,
-0.1239373, -0.4228774, -4.130282, 1, 1, 1, 1, 1,
-0.1222596, -1.122906, -3.314397, 0, 0, 1, 1, 1,
-0.1206744, -0.3890288, -3.442108, 1, 0, 0, 1, 1,
-0.1205493, -0.007214759, -0.6609148, 1, 0, 0, 1, 1,
-0.1190904, -0.9399982, -1.477924, 1, 0, 0, 1, 1,
-0.1168375, 0.2847603, 0.2531024, 1, 0, 0, 1, 1,
-0.1159498, -0.8761827, -3.442199, 1, 0, 0, 1, 1,
-0.1140501, 0.991355, -1.046953, 0, 0, 0, 1, 1,
-0.1132116, 1.226976, 0.9568275, 0, 0, 0, 1, 1,
-0.1099073, 2.05258, -0.6345382, 0, 0, 0, 1, 1,
-0.1090138, -0.6204757, -2.883675, 0, 0, 0, 1, 1,
-0.1077013, -1.686039, -3.935339, 0, 0, 0, 1, 1,
-0.102923, 0.156171, -2.604632, 0, 0, 0, 1, 1,
-0.09920526, -0.5684987, -2.985124, 0, 0, 0, 1, 1,
-0.09885499, -0.4412356, -2.035931, 1, 1, 1, 1, 1,
-0.09828104, -0.2299452, -5.781361, 1, 1, 1, 1, 1,
-0.09795845, 0.1124797, -0.2389134, 1, 1, 1, 1, 1,
-0.09715659, 1.117495, -0.685665, 1, 1, 1, 1, 1,
-0.09292635, 0.07753657, -2.043471, 1, 1, 1, 1, 1,
-0.08666357, 0.286039, -0.9671476, 1, 1, 1, 1, 1,
-0.0800163, 0.8402298, 0.4503001, 1, 1, 1, 1, 1,
-0.07998957, 0.8499261, -0.7590095, 1, 1, 1, 1, 1,
-0.07680787, 0.3160862, -0.4677057, 1, 1, 1, 1, 1,
-0.07567944, -0.5823107, -2.309345, 1, 1, 1, 1, 1,
-0.07412431, -0.6115768, -2.74489, 1, 1, 1, 1, 1,
-0.0700928, -0.2539182, -2.515975, 1, 1, 1, 1, 1,
-0.06704895, 0.5635191, 0.08698636, 1, 1, 1, 1, 1,
-0.0658441, -0.7567461, -3.74141, 1, 1, 1, 1, 1,
-0.06539718, -0.05387747, -3.722663, 1, 1, 1, 1, 1,
-0.06346828, 0.3844903, 0.8742666, 0, 0, 1, 1, 1,
-0.05864792, 0.2785898, -0.7300014, 1, 0, 0, 1, 1,
-0.05829627, 1.77853, 2.658563, 1, 0, 0, 1, 1,
-0.05589426, -0.4699782, -2.995317, 1, 0, 0, 1, 1,
-0.05430932, -1.499381, -4.373395, 1, 0, 0, 1, 1,
-0.05319285, -1.070689, -2.523813, 1, 0, 0, 1, 1,
-0.04989212, -2.22332, -2.98252, 0, 0, 0, 1, 1,
-0.04733864, -0.9672685, -1.958766, 0, 0, 0, 1, 1,
-0.0448096, -1.182788, -3.040101, 0, 0, 0, 1, 1,
-0.04390403, -1.012417, -2.616394, 0, 0, 0, 1, 1,
-0.0437578, -2.183902, -2.776784, 0, 0, 0, 1, 1,
-0.04214491, 0.3701262, -0.8067062, 0, 0, 0, 1, 1,
-0.04103235, 0.1402767, 0.09945656, 0, 0, 0, 1, 1,
-0.03517134, 1.720725, 1.388878, 1, 1, 1, 1, 1,
-0.03449401, -1.349743, -2.120678, 1, 1, 1, 1, 1,
-0.03090456, -0.6025231, -3.159271, 1, 1, 1, 1, 1,
-0.03001008, 1.88171, -0.04937361, 1, 1, 1, 1, 1,
-0.02939004, -0.4087428, -1.96263, 1, 1, 1, 1, 1,
-0.02711986, -1.201859, -3.372392, 1, 1, 1, 1, 1,
-0.01888939, -0.1994763, -3.205239, 1, 1, 1, 1, 1,
-0.01870258, -1.585138, -0.9098205, 1, 1, 1, 1, 1,
-0.01835541, 1.67003, -2.045031, 1, 1, 1, 1, 1,
-0.01556405, 0.5538453, -0.3537744, 1, 1, 1, 1, 1,
-0.01100338, 1.835083, 0.358682, 1, 1, 1, 1, 1,
-0.00816309, 1.481578, 0.616625, 1, 1, 1, 1, 1,
0.0006248159, -1.643421, 1.941141, 1, 1, 1, 1, 1,
0.002315493, -0.5558578, 2.547342, 1, 1, 1, 1, 1,
0.002375109, -2.014909, 2.550398, 1, 1, 1, 1, 1,
0.01165358, -1.817973, 1.919006, 0, 0, 1, 1, 1,
0.01312133, -1.505942, 4.378049, 1, 0, 0, 1, 1,
0.01399719, 0.3634379, 0.9845496, 1, 0, 0, 1, 1,
0.01746839, -0.04092428, 3.9759, 1, 0, 0, 1, 1,
0.01758938, -0.6350945, 3.572338, 1, 0, 0, 1, 1,
0.02125339, -0.8637932, 2.174012, 1, 0, 0, 1, 1,
0.0235275, 0.4161026, -0.3847807, 0, 0, 0, 1, 1,
0.0269286, -1.003868, 2.875294, 0, 0, 0, 1, 1,
0.02697916, 0.8195698, 0.7453825, 0, 0, 0, 1, 1,
0.02714712, 1.573014, 0.6623579, 0, 0, 0, 1, 1,
0.02769768, 1.243611, -1.228865, 0, 0, 0, 1, 1,
0.02775053, 1.258526, -0.844633, 0, 0, 0, 1, 1,
0.02877341, 0.512834, 0.4788667, 0, 0, 0, 1, 1,
0.03265647, -2.041973, 3.298731, 1, 1, 1, 1, 1,
0.03638409, -0.3488994, 4.19777, 1, 1, 1, 1, 1,
0.04034, 0.08746483, 1.156592, 1, 1, 1, 1, 1,
0.0420237, 0.8502643, 1.051815, 1, 1, 1, 1, 1,
0.04449611, -0.2207943, 1.761054, 1, 1, 1, 1, 1,
0.0463741, -0.3700522, 2.963096, 1, 1, 1, 1, 1,
0.04868076, 1.778848, 0.8518323, 1, 1, 1, 1, 1,
0.04902805, -0.6716964, 3.068585, 1, 1, 1, 1, 1,
0.05228375, 0.9833387, 0.1915398, 1, 1, 1, 1, 1,
0.05443018, 1.688245, 0.09122318, 1, 1, 1, 1, 1,
0.05653147, 0.0329678, 2.072437, 1, 1, 1, 1, 1,
0.05850615, 0.2757876, -0.03764663, 1, 1, 1, 1, 1,
0.05970021, 0.1651238, -0.313148, 1, 1, 1, 1, 1,
0.06102754, -1.290929, 5.772607, 1, 1, 1, 1, 1,
0.07189319, -0.5292633, 2.706346, 1, 1, 1, 1, 1,
0.07251386, 0.8565376, -1.100261, 0, 0, 1, 1, 1,
0.07311927, 1.705953, -0.1857132, 1, 0, 0, 1, 1,
0.07464135, -0.1194216, 2.036213, 1, 0, 0, 1, 1,
0.07916763, -1.320293, 3.627393, 1, 0, 0, 1, 1,
0.07935843, 2.174773, 0.5692544, 1, 0, 0, 1, 1,
0.08211232, -0.1770162, 4.271892, 1, 0, 0, 1, 1,
0.0893119, -0.8954028, 3.76976, 0, 0, 0, 1, 1,
0.09255317, -1.344058, 0.3788372, 0, 0, 0, 1, 1,
0.0931099, -0.5666947, 2.630849, 0, 0, 0, 1, 1,
0.09811132, -0.593217, 2.859013, 0, 0, 0, 1, 1,
0.1034756, 0.01019159, 0.2038713, 0, 0, 0, 1, 1,
0.1049051, -0.8026593, 4.17899, 0, 0, 0, 1, 1,
0.1093767, 0.09395126, 0.7000675, 0, 0, 0, 1, 1,
0.1105186, -1.81943, 3.691443, 1, 1, 1, 1, 1,
0.1177664, -1.206918, 3.826307, 1, 1, 1, 1, 1,
0.1178392, 1.52079, 0.7994429, 1, 1, 1, 1, 1,
0.1213963, 0.7277244, 1.931699, 1, 1, 1, 1, 1,
0.1220313, 0.5639642, -2.317935, 1, 1, 1, 1, 1,
0.1238845, 1.352652, 0.9587538, 1, 1, 1, 1, 1,
0.1249864, 0.6071747, -0.6358401, 1, 1, 1, 1, 1,
0.1276798, -0.9650361, 2.104762, 1, 1, 1, 1, 1,
0.1289684, 0.533102, -0.3420561, 1, 1, 1, 1, 1,
0.1304501, 0.1364378, 0.6523112, 1, 1, 1, 1, 1,
0.1310058, 0.5914875, -0.3612002, 1, 1, 1, 1, 1,
0.1352637, 0.3060027, -0.1260956, 1, 1, 1, 1, 1,
0.1362135, -0.4796475, 2.33798, 1, 1, 1, 1, 1,
0.1371524, 0.3802336, 0.7047358, 1, 1, 1, 1, 1,
0.1375448, -0.4200859, 1.777512, 1, 1, 1, 1, 1,
0.1381716, -1.298016, 2.701079, 0, 0, 1, 1, 1,
0.1411688, -1.023099, 3.180764, 1, 0, 0, 1, 1,
0.1448539, -0.5190959, 3.643467, 1, 0, 0, 1, 1,
0.1454352, 0.2420657, 0.3049413, 1, 0, 0, 1, 1,
0.1482085, 0.868499, -1.537088, 1, 0, 0, 1, 1,
0.1510196, 0.659445, -1.195737, 1, 0, 0, 1, 1,
0.1540194, -0.01134718, 2.980977, 0, 0, 0, 1, 1,
0.157484, 0.3065918, 1.041793, 0, 0, 0, 1, 1,
0.1582981, 0.1104891, 0.2457096, 0, 0, 0, 1, 1,
0.1594401, -1.178849, 3.216407, 0, 0, 0, 1, 1,
0.1646572, -0.05612482, 2.412031, 0, 0, 0, 1, 1,
0.166228, 0.1799932, -0.8684667, 0, 0, 0, 1, 1,
0.1694134, 1.683741, -0.4069002, 0, 0, 0, 1, 1,
0.1705217, -2.054728, 3.244799, 1, 1, 1, 1, 1,
0.1722474, 0.4751294, 1.460462, 1, 1, 1, 1, 1,
0.175708, -1.06547, 3.191001, 1, 1, 1, 1, 1,
0.1780455, 0.3399165, 0.4720431, 1, 1, 1, 1, 1,
0.1785441, 0.4429158, 1.25837, 1, 1, 1, 1, 1,
0.182574, 0.5532129, 0.1515888, 1, 1, 1, 1, 1,
0.1833429, 1.391484, 0.264595, 1, 1, 1, 1, 1,
0.1864002, 0.01942686, 1.579751, 1, 1, 1, 1, 1,
0.1920098, -0.4566328, 1.274186, 1, 1, 1, 1, 1,
0.1932968, -0.5229816, 2.422292, 1, 1, 1, 1, 1,
0.2004807, 0.9507616, 0.2626772, 1, 1, 1, 1, 1,
0.2008422, 0.1931773, -0.4308752, 1, 1, 1, 1, 1,
0.2011969, -0.8802136, 4.889729, 1, 1, 1, 1, 1,
0.202602, -0.1760391, 2.305842, 1, 1, 1, 1, 1,
0.2029012, -0.2628348, 3.342057, 1, 1, 1, 1, 1,
0.204516, -0.9605327, 2.557163, 0, 0, 1, 1, 1,
0.205976, 0.06220251, 1.663534, 1, 0, 0, 1, 1,
0.2126391, -0.4634212, 3.553964, 1, 0, 0, 1, 1,
0.2140707, -0.2886802, 1.845072, 1, 0, 0, 1, 1,
0.2205293, -1.122322, 2.424897, 1, 0, 0, 1, 1,
0.2233889, 0.5061377, -1.201752, 1, 0, 0, 1, 1,
0.2253853, 0.1872013, 3.469609, 0, 0, 0, 1, 1,
0.2270085, -0.03547642, 0.1272791, 0, 0, 0, 1, 1,
0.2286321, -1.058062, 1.568854, 0, 0, 0, 1, 1,
0.2303798, 0.4788719, 0.9860233, 0, 0, 0, 1, 1,
0.2339997, -0.460896, 2.491999, 0, 0, 0, 1, 1,
0.2352797, -3.20235, 3.543166, 0, 0, 0, 1, 1,
0.2396072, 0.7949772, 0.9487566, 0, 0, 0, 1, 1,
0.2415994, 0.4712118, 1.029246, 1, 1, 1, 1, 1,
0.2424669, 0.2144668, 0.3942382, 1, 1, 1, 1, 1,
0.2427321, -1.162295, 3.42846, 1, 1, 1, 1, 1,
0.2435759, 3.261642, -0.1112465, 1, 1, 1, 1, 1,
0.2504035, 0.1069872, 0.4905527, 1, 1, 1, 1, 1,
0.2518002, -1.605541, 2.05705, 1, 1, 1, 1, 1,
0.2530384, -0.6348847, 3.568955, 1, 1, 1, 1, 1,
0.253788, -1.919158, 1.942829, 1, 1, 1, 1, 1,
0.2645729, -1.231791, 4.288123, 1, 1, 1, 1, 1,
0.2656724, 0.04251338, 0.7121547, 1, 1, 1, 1, 1,
0.2670234, 0.4319316, 1.076254, 1, 1, 1, 1, 1,
0.2717279, -0.9020825, 5.111692, 1, 1, 1, 1, 1,
0.2725254, 0.05374593, 2.059443, 1, 1, 1, 1, 1,
0.2761407, 1.103102, -0.3586498, 1, 1, 1, 1, 1,
0.2800738, 0.2344574, 0.7482653, 1, 1, 1, 1, 1,
0.280578, -2.355031, 3.327809, 0, 0, 1, 1, 1,
0.2815161, 0.3125251, -0.06329888, 1, 0, 0, 1, 1,
0.2855709, -0.7227579, 2.62277, 1, 0, 0, 1, 1,
0.2865653, 0.8912635, 1.103151, 1, 0, 0, 1, 1,
0.2874562, 0.09194946, 0.6764284, 1, 0, 0, 1, 1,
0.2949003, 1.587926, 1.456029, 1, 0, 0, 1, 1,
0.2979161, -0.7372007, 4.231935, 0, 0, 0, 1, 1,
0.3004917, -0.2397841, 2.663254, 0, 0, 0, 1, 1,
0.3016416, 0.2210266, 1.549158, 0, 0, 0, 1, 1,
0.3053784, 0.01380226, 1.085688, 0, 0, 0, 1, 1,
0.3076738, -1.141925, 1.624179, 0, 0, 0, 1, 1,
0.3080202, -0.04910925, 3.800294, 0, 0, 0, 1, 1,
0.3129494, 0.8717199, -1.445344, 0, 0, 0, 1, 1,
0.3153779, -0.285295, 2.236162, 1, 1, 1, 1, 1,
0.3156005, -0.5824685, 2.014858, 1, 1, 1, 1, 1,
0.3219231, 0.3506363, -1.157114, 1, 1, 1, 1, 1,
0.3343962, -1.038647, 0.7459911, 1, 1, 1, 1, 1,
0.3355407, -1.310373, 3.401105, 1, 1, 1, 1, 1,
0.3371765, 0.2781624, -0.08810762, 1, 1, 1, 1, 1,
0.340297, -0.2318504, 1.223094, 1, 1, 1, 1, 1,
0.3405213, 0.4245292, 0.6658328, 1, 1, 1, 1, 1,
0.3491767, -1.561105, 3.613064, 1, 1, 1, 1, 1,
0.3524976, 0.07155256, 0.4148754, 1, 1, 1, 1, 1,
0.3543005, -0.2577577, 2.376117, 1, 1, 1, 1, 1,
0.359174, 0.6364644, 0.151801, 1, 1, 1, 1, 1,
0.3597254, -1.812119, 4.554277, 1, 1, 1, 1, 1,
0.3701729, 1.198073, 0.5382947, 1, 1, 1, 1, 1,
0.3708624, -0.09354767, 2.252526, 1, 1, 1, 1, 1,
0.3715807, 0.7688851, 1.457549, 0, 0, 1, 1, 1,
0.3726509, 0.7395898, -0.2990779, 1, 0, 0, 1, 1,
0.373988, 0.4726205, 2.022189, 1, 0, 0, 1, 1,
0.3753117, 0.4352564, 0.3787393, 1, 0, 0, 1, 1,
0.3798963, 0.0224633, 1.522253, 1, 0, 0, 1, 1,
0.3805565, 0.9300951, -0.8671612, 1, 0, 0, 1, 1,
0.3824249, -0.7883945, 3.599379, 0, 0, 0, 1, 1,
0.3848331, 0.3873746, 1.834595, 0, 0, 0, 1, 1,
0.3858171, -0.6289051, 2.168079, 0, 0, 0, 1, 1,
0.3870149, 1.280458, 1.073349, 0, 0, 0, 1, 1,
0.3887027, 1.49172, 1.462217, 0, 0, 0, 1, 1,
0.3901795, -0.4505337, 3.630808, 0, 0, 0, 1, 1,
0.3908091, -1.70813, 1.250996, 0, 0, 0, 1, 1,
0.3923192, -0.3188896, 4.033681, 1, 1, 1, 1, 1,
0.4005169, -1.696719, 1.526107, 1, 1, 1, 1, 1,
0.4020919, -0.4801034, 0.9566811, 1, 1, 1, 1, 1,
0.4035248, -0.07958087, -0.07212881, 1, 1, 1, 1, 1,
0.4149747, -0.3852277, 1.453306, 1, 1, 1, 1, 1,
0.4171861, -1.408645, 3.469415, 1, 1, 1, 1, 1,
0.4216686, -2.096246, 2.853717, 1, 1, 1, 1, 1,
0.4274785, 1.260128, -0.299815, 1, 1, 1, 1, 1,
0.4280372, -0.5217388, 3.005677, 1, 1, 1, 1, 1,
0.4307397, 0.6315318, -0.8960088, 1, 1, 1, 1, 1,
0.4308358, 0.4269733, 0.5054331, 1, 1, 1, 1, 1,
0.4342914, -2.323907, 3.660054, 1, 1, 1, 1, 1,
0.4398539, -1.117622, 2.513238, 1, 1, 1, 1, 1,
0.4462017, -1.0528, 3.562672, 1, 1, 1, 1, 1,
0.4489585, 2.493735, -0.8052367, 1, 1, 1, 1, 1,
0.456593, -1.161091, 3.259268, 0, 0, 1, 1, 1,
0.4596146, -1.477298, 1.870133, 1, 0, 0, 1, 1,
0.4614992, -0.3829191, 2.663106, 1, 0, 0, 1, 1,
0.4684478, -0.9753109, 2.378953, 1, 0, 0, 1, 1,
0.4697651, 1.028268, 0.9538033, 1, 0, 0, 1, 1,
0.4727521, 0.717623, 0.14691, 1, 0, 0, 1, 1,
0.4850099, 0.4163195, 2.514083, 0, 0, 0, 1, 1,
0.4883588, 0.07489633, 0.3409841, 0, 0, 0, 1, 1,
0.4940813, 0.1261569, 2.104372, 0, 0, 0, 1, 1,
0.5004328, -0.2506208, 0.937871, 0, 0, 0, 1, 1,
0.5096678, 0.365047, 2.732833, 0, 0, 0, 1, 1,
0.5133563, -0.6308148, 1.912997, 0, 0, 0, 1, 1,
0.5148804, -0.6799362, 2.116814, 0, 0, 0, 1, 1,
0.5166354, -0.009901389, 3.022853, 1, 1, 1, 1, 1,
0.5191031, -0.6197649, 2.900151, 1, 1, 1, 1, 1,
0.5203534, -0.3272896, 1.974611, 1, 1, 1, 1, 1,
0.5216141, -1.12897, 3.496308, 1, 1, 1, 1, 1,
0.5223416, 0.9162596, -0.5108685, 1, 1, 1, 1, 1,
0.5237006, -0.8697836, 2.842676, 1, 1, 1, 1, 1,
0.5253226, -0.4697535, 1.52011, 1, 1, 1, 1, 1,
0.5282742, 1.634505, -0.2280838, 1, 1, 1, 1, 1,
0.5288928, -0.4145878, 2.59449, 1, 1, 1, 1, 1,
0.5306473, -1.469064, 3.26927, 1, 1, 1, 1, 1,
0.5311044, -0.4240943, 1.986287, 1, 1, 1, 1, 1,
0.5311896, 1.515289, -0.4378282, 1, 1, 1, 1, 1,
0.5312255, -0.07505126, 2.230419, 1, 1, 1, 1, 1,
0.5334768, -0.5198674, 3.552577, 1, 1, 1, 1, 1,
0.534131, -0.09863973, 1.559171, 1, 1, 1, 1, 1,
0.5346436, -0.08127974, 0.05085806, 0, 0, 1, 1, 1,
0.535911, -0.3967806, 1.340149, 1, 0, 0, 1, 1,
0.5373604, 0.9507829, 1.970301, 1, 0, 0, 1, 1,
0.5378543, -0.2231567, 2.183729, 1, 0, 0, 1, 1,
0.5459636, -0.04603115, 2.434226, 1, 0, 0, 1, 1,
0.5477022, 0.07633731, 0.6281603, 1, 0, 0, 1, 1,
0.5539379, -1.010823, 3.326363, 0, 0, 0, 1, 1,
0.5568907, 0.9977564, 1.121807, 0, 0, 0, 1, 1,
0.565096, -0.3833617, 3.831034, 0, 0, 0, 1, 1,
0.5659672, -0.9617766, 2.676918, 0, 0, 0, 1, 1,
0.5692493, -0.3260093, 1.35468, 0, 0, 0, 1, 1,
0.5719209, -0.3264225, 2.896, 0, 0, 0, 1, 1,
0.5880504, -1.045283, 2.584292, 0, 0, 0, 1, 1,
0.5889341, -1.361333, 0.4745907, 1, 1, 1, 1, 1,
0.5948426, -0.7001675, 2.695067, 1, 1, 1, 1, 1,
0.596383, 0.2587008, 1.198609, 1, 1, 1, 1, 1,
0.6003162, 0.4793614, 3.649426, 1, 1, 1, 1, 1,
0.6043788, 0.1264715, 0.2825322, 1, 1, 1, 1, 1,
0.6059377, 0.4201928, 1.018932, 1, 1, 1, 1, 1,
0.6105233, -1.012248, 2.517287, 1, 1, 1, 1, 1,
0.614107, 0.7941692, 1.490327, 1, 1, 1, 1, 1,
0.6183828, 0.9634656, -0.08178025, 1, 1, 1, 1, 1,
0.6196213, 2.618471, 0.3769637, 1, 1, 1, 1, 1,
0.6256291, 0.1540915, -0.4299602, 1, 1, 1, 1, 1,
0.627148, 0.3642242, 1.989191, 1, 1, 1, 1, 1,
0.6279292, 1.030995, 2.099284, 1, 1, 1, 1, 1,
0.6329042, 0.3828957, -0.5346799, 1, 1, 1, 1, 1,
0.636138, 0.8215372, 0.62633, 1, 1, 1, 1, 1,
0.6496769, -2.00111, 3.332407, 0, 0, 1, 1, 1,
0.653202, 0.843999, 0.5746741, 1, 0, 0, 1, 1,
0.6562009, 0.6106411, 1.16864, 1, 0, 0, 1, 1,
0.6565329, 1.593477, 0.3552631, 1, 0, 0, 1, 1,
0.659104, -1.052444, 4.671939, 1, 0, 0, 1, 1,
0.6597943, 0.9698243, 1.821269, 1, 0, 0, 1, 1,
0.6618046, -0.3718368, 2.526913, 0, 0, 0, 1, 1,
0.6620961, -0.2917137, 1.316947, 0, 0, 0, 1, 1,
0.6627649, 1.20413, 1.938366, 0, 0, 0, 1, 1,
0.6628928, 0.709467, 1.809275, 0, 0, 0, 1, 1,
0.6659999, -0.4708927, 3.467687, 0, 0, 0, 1, 1,
0.6726411, -1.503882, 0.6805131, 0, 0, 0, 1, 1,
0.6793735, -1.094328, 1.20167, 0, 0, 0, 1, 1,
0.6815364, 1.422795, -0.1186903, 1, 1, 1, 1, 1,
0.6850285, -1.171517, 1.708717, 1, 1, 1, 1, 1,
0.6912792, -1.505173, 3.786844, 1, 1, 1, 1, 1,
0.6935473, -0.1094847, 1.461332, 1, 1, 1, 1, 1,
0.699311, -0.464387, 2.845204, 1, 1, 1, 1, 1,
0.6998381, 0.2925903, 0.2853286, 1, 1, 1, 1, 1,
0.7103513, -0.8919945, 1.303477, 1, 1, 1, 1, 1,
0.7131441, -0.6388281, 3.553876, 1, 1, 1, 1, 1,
0.7159075, 0.1407094, 2.874655, 1, 1, 1, 1, 1,
0.7222449, 0.171047, 0.7666891, 1, 1, 1, 1, 1,
0.722469, -0.9766647, 2.886747, 1, 1, 1, 1, 1,
0.7236064, 0.04007574, 2.380297, 1, 1, 1, 1, 1,
0.7245616, -1.651825, 3.803823, 1, 1, 1, 1, 1,
0.7257184, -0.9178483, 1.327333, 1, 1, 1, 1, 1,
0.7269066, 0.6492819, 2.061672, 1, 1, 1, 1, 1,
0.7358279, -1.209841, 3.751163, 0, 0, 1, 1, 1,
0.736351, -0.6409829, 3.57975, 1, 0, 0, 1, 1,
0.7375101, -0.3444957, 0.7518288, 1, 0, 0, 1, 1,
0.738226, 0.6838641, 0.6398157, 1, 0, 0, 1, 1,
0.7405196, 0.9113272, 1.795315, 1, 0, 0, 1, 1,
0.7429022, -1.653431, 2.090448, 1, 0, 0, 1, 1,
0.7431111, -0.7986887, 1.493259, 0, 0, 0, 1, 1,
0.7480989, 0.1055329, 1.114089, 0, 0, 0, 1, 1,
0.7512524, -1.514856, 3.185158, 0, 0, 0, 1, 1,
0.7522613, -1.107642, 1.302466, 0, 0, 0, 1, 1,
0.75266, -2.783929, 4.319427, 0, 0, 0, 1, 1,
0.7531479, -1.076096, 3.918458, 0, 0, 0, 1, 1,
0.7546421, -0.6486802, 2.977691, 0, 0, 0, 1, 1,
0.7575476, 0.8560881, 0.3229926, 1, 1, 1, 1, 1,
0.7615914, 0.4829327, 0.7969149, 1, 1, 1, 1, 1,
0.7641218, -0.7460272, 1.54031, 1, 1, 1, 1, 1,
0.7647799, 0.6915517, -0.06287377, 1, 1, 1, 1, 1,
0.7655112, 0.4325258, 0.9862909, 1, 1, 1, 1, 1,
0.7661419, -0.5709426, 1.886058, 1, 1, 1, 1, 1,
0.7725023, 0.5959323, 2.13147, 1, 1, 1, 1, 1,
0.7772601, -0.745397, 2.051379, 1, 1, 1, 1, 1,
0.7791944, -1.498306, 3.238364, 1, 1, 1, 1, 1,
0.7810894, -0.2919186, 0.04025667, 1, 1, 1, 1, 1,
0.7822611, 0.8571688, -1.616053, 1, 1, 1, 1, 1,
0.782671, 1.014552, -0.4050209, 1, 1, 1, 1, 1,
0.7848399, -0.251226, 0.7535837, 1, 1, 1, 1, 1,
0.7861882, 0.9816735, 2.679353, 1, 1, 1, 1, 1,
0.7947493, -0.5260004, 0.319311, 1, 1, 1, 1, 1,
0.8003715, 0.9551607, 0.597546, 0, 0, 1, 1, 1,
0.8024732, 0.2498719, 1.326364, 1, 0, 0, 1, 1,
0.8051087, 0.5715457, 1.834798, 1, 0, 0, 1, 1,
0.8053634, -0.8311159, 1.612853, 1, 0, 0, 1, 1,
0.8059152, -0.7695996, 1.925657, 1, 0, 0, 1, 1,
0.8109806, 0.9216874, 0.757466, 1, 0, 0, 1, 1,
0.8135982, -1.026882, 3.072049, 0, 0, 0, 1, 1,
0.8138829, -0.6974577, 1.809556, 0, 0, 0, 1, 1,
0.8180524, -0.2029648, 2.283886, 0, 0, 0, 1, 1,
0.820819, -0.8784867, 0.9420708, 0, 0, 0, 1, 1,
0.8216215, 0.8070686, 0.827114, 0, 0, 0, 1, 1,
0.8267156, 0.6236626, 0.5597304, 0, 0, 0, 1, 1,
0.8329336, -1.264217, 2.649103, 0, 0, 0, 1, 1,
0.8334447, 0.007614343, 0.9261279, 1, 1, 1, 1, 1,
0.838134, -0.8389814, 1.01668, 1, 1, 1, 1, 1,
0.8387907, 0.4848472, -0.8657861, 1, 1, 1, 1, 1,
0.8421064, -1.125126, 2.545301, 1, 1, 1, 1, 1,
0.8506222, -0.9054925, 1.735157, 1, 1, 1, 1, 1,
0.8511481, -1.028086, 2.528005, 1, 1, 1, 1, 1,
0.8578516, 0.3413747, 0.630756, 1, 1, 1, 1, 1,
0.8584803, -1.836802, 3.832852, 1, 1, 1, 1, 1,
0.8606091, 0.3879062, 0.1481152, 1, 1, 1, 1, 1,
0.8636283, 2.127877, 1.561872, 1, 1, 1, 1, 1,
0.8638352, -0.7931044, 0.823253, 1, 1, 1, 1, 1,
0.8639923, 0.7267649, 1.596257, 1, 1, 1, 1, 1,
0.8677272, -1.552879, 3.607882, 1, 1, 1, 1, 1,
0.8710582, -2.54343, 3.209393, 1, 1, 1, 1, 1,
0.871965, 1.902173, -0.2260219, 1, 1, 1, 1, 1,
0.8748092, 0.4001119, -0.9433452, 0, 0, 1, 1, 1,
0.8756553, -1.065875, 3.060758, 1, 0, 0, 1, 1,
0.8757109, 0.9430768, -0.1781451, 1, 0, 0, 1, 1,
0.880929, 1.786136, 1.185386, 1, 0, 0, 1, 1,
0.8896766, -0.8164619, 2.124011, 1, 0, 0, 1, 1,
0.895947, -0.005223821, 1.719738, 1, 0, 0, 1, 1,
0.8961655, 0.8435742, 1.656201, 0, 0, 0, 1, 1,
0.8963513, -0.3554364, 2.65775, 0, 0, 0, 1, 1,
0.9009209, -0.7210791, 1.872799, 0, 0, 0, 1, 1,
0.9091277, -1.121961, 2.537854, 0, 0, 0, 1, 1,
0.9125018, 1.97937, -0.09265655, 0, 0, 0, 1, 1,
0.9160042, 1.119182, 0.8785696, 0, 0, 0, 1, 1,
0.9273291, -0.8554101, 1.100756, 0, 0, 0, 1, 1,
0.9275614, 1.583046, -0.9385636, 1, 1, 1, 1, 1,
0.9368554, -0.432694, 2.950513, 1, 1, 1, 1, 1,
0.9417956, 0.3827975, 1.926731, 1, 1, 1, 1, 1,
0.9437041, -0.5192701, 1.914006, 1, 1, 1, 1, 1,
0.949992, -0.8681557, 2.413518, 1, 1, 1, 1, 1,
0.9509875, 0.6168956, 0.2156641, 1, 1, 1, 1, 1,
0.9527588, 0.2607587, 1.679352, 1, 1, 1, 1, 1,
0.9542927, 0.000229147, 1.133105, 1, 1, 1, 1, 1,
0.9558535, -0.9832098, 1.7356, 1, 1, 1, 1, 1,
0.9607026, 1.211199, 2.083242, 1, 1, 1, 1, 1,
0.9668649, 0.5096369, 0.04221886, 1, 1, 1, 1, 1,
0.9686803, -0.9759626, 2.326037, 1, 1, 1, 1, 1,
0.9758948, 0.1275434, 1.404603, 1, 1, 1, 1, 1,
0.9785371, -0.1242073, 0.1116985, 1, 1, 1, 1, 1,
0.9856333, 0.4500903, 0.6358504, 1, 1, 1, 1, 1,
0.9929807, 1.251764, 0.7749919, 0, 0, 1, 1, 1,
1.000766, 0.6949422, 1.582598, 1, 0, 0, 1, 1,
1.005233, 1.069663, 1.549584, 1, 0, 0, 1, 1,
1.009115, -1.38306, 2.083794, 1, 0, 0, 1, 1,
1.018048, -0.6507646, -0.2531797, 1, 0, 0, 1, 1,
1.044825, -0.6217915, 3.446982, 1, 0, 0, 1, 1,
1.049017, 1.768665, 1.218697, 0, 0, 0, 1, 1,
1.054293, -0.1179982, 1.332155, 0, 0, 0, 1, 1,
1.055288, 0.5739124, 1.097117, 0, 0, 0, 1, 1,
1.056925, -0.8015894, 0.5689548, 0, 0, 0, 1, 1,
1.06156, 0.2594104, 1.490001, 0, 0, 0, 1, 1,
1.062626, 0.04329914, 1.139081, 0, 0, 0, 1, 1,
1.06646, 2.266553, 0.2408005, 0, 0, 0, 1, 1,
1.067551, 0.5912054, 1.367628, 1, 1, 1, 1, 1,
1.068935, -0.9274412, 3.8303, 1, 1, 1, 1, 1,
1.069499, 1.78561, 0.5590598, 1, 1, 1, 1, 1,
1.076074, -0.7654489, 2.212461, 1, 1, 1, 1, 1,
1.077871, -1.88218, 3.458339, 1, 1, 1, 1, 1,
1.079137, 0.8121468, 1.322665, 1, 1, 1, 1, 1,
1.084426, -0.6564631, 0.5272429, 1, 1, 1, 1, 1,
1.090529, 1.100401, 2.826051, 1, 1, 1, 1, 1,
1.092272, -0.5414189, 2.983093, 1, 1, 1, 1, 1,
1.094072, 0.2064969, 0.925783, 1, 1, 1, 1, 1,
1.09686, -0.804416, 1.891006, 1, 1, 1, 1, 1,
1.110262, 0.5147145, 2.396128, 1, 1, 1, 1, 1,
1.113916, -0.1147969, 1.586064, 1, 1, 1, 1, 1,
1.114938, 1.82566, 0.4272284, 1, 1, 1, 1, 1,
1.116248, -0.8591744, 2.993934, 1, 1, 1, 1, 1,
1.116623, -0.0368532, 1.988725, 0, 0, 1, 1, 1,
1.123659, 1.436724, 1.010893, 1, 0, 0, 1, 1,
1.124078, 1.061621, 1.502022, 1, 0, 0, 1, 1,
1.129575, -0.3730921, -1.112653, 1, 0, 0, 1, 1,
1.130485, -1.504279, 3.730429, 1, 0, 0, 1, 1,
1.136341, -0.1018604, 1.55999, 1, 0, 0, 1, 1,
1.145348, -0.9527155, 1.849904, 0, 0, 0, 1, 1,
1.159384, -0.2032657, 0.08807982, 0, 0, 0, 1, 1,
1.159519, 1.753268, 0.5272304, 0, 0, 0, 1, 1,
1.162196, -1.101854, 1.823504, 0, 0, 0, 1, 1,
1.169763, 1.733177, -0.5417129, 0, 0, 0, 1, 1,
1.172611, -0.6162516, 0.8478663, 0, 0, 0, 1, 1,
1.178454, 0.586558, 1.096128, 0, 0, 0, 1, 1,
1.17891, 0.1555159, 1.149823, 1, 1, 1, 1, 1,
1.184211, -0.2695673, 1.272051, 1, 1, 1, 1, 1,
1.184984, -0.01350005, 2.04857, 1, 1, 1, 1, 1,
1.185962, 0.1311292, 1.289505, 1, 1, 1, 1, 1,
1.191988, -0.4454213, 2.003045, 1, 1, 1, 1, 1,
1.202449, -1.521561, 2.869941, 1, 1, 1, 1, 1,
1.204286, -0.4772021, 0.9626473, 1, 1, 1, 1, 1,
1.204577, 1.818553, 0.3436197, 1, 1, 1, 1, 1,
1.212555, -1.866361, 1.621303, 1, 1, 1, 1, 1,
1.214532, -0.7213638, 1.815428, 1, 1, 1, 1, 1,
1.221753, 0.8859166, 2.698667, 1, 1, 1, 1, 1,
1.23729, -0.6047847, 1.812486, 1, 1, 1, 1, 1,
1.240694, 0.6633967, 3.245164, 1, 1, 1, 1, 1,
1.243228, -0.6362193, 2.835208, 1, 1, 1, 1, 1,
1.244224, -0.9656785, 3.280378, 1, 1, 1, 1, 1,
1.247896, 0.3368012, 3.236746, 0, 0, 1, 1, 1,
1.248853, 0.9662204, 0.5314012, 1, 0, 0, 1, 1,
1.249926, 1.563226, 0.5969308, 1, 0, 0, 1, 1,
1.257589, -0.6523668, 2.298519, 1, 0, 0, 1, 1,
1.257774, -1.955777, 0.5336896, 1, 0, 0, 1, 1,
1.25811, -0.2782698, -0.8344775, 1, 0, 0, 1, 1,
1.258762, -0.9863489, 3.40149, 0, 0, 0, 1, 1,
1.264019, 2.797493, -0.5324435, 0, 0, 0, 1, 1,
1.268228, -0.01101091, 2.072306, 0, 0, 0, 1, 1,
1.270544, -0.2426024, 0.3175406, 0, 0, 0, 1, 1,
1.278931, -0.5248538, 2.974485, 0, 0, 0, 1, 1,
1.293882, -0.07108894, 1.230052, 0, 0, 0, 1, 1,
1.297905, 0.3589207, 1.971468, 0, 0, 0, 1, 1,
1.299145, 0.2434013, 1.006414, 1, 1, 1, 1, 1,
1.301983, -0.4093671, 0.3231574, 1, 1, 1, 1, 1,
1.328268, -0.6440182, 2.098515, 1, 1, 1, 1, 1,
1.328519, 0.5234642, 2.414121, 1, 1, 1, 1, 1,
1.332017, -1.046378, 2.630563, 1, 1, 1, 1, 1,
1.341073, -0.8596767, 1.107253, 1, 1, 1, 1, 1,
1.345811, 1.045452, -0.3779985, 1, 1, 1, 1, 1,
1.353155, 0.7388423, 0.7334573, 1, 1, 1, 1, 1,
1.364312, -0.1279406, 1.539223, 1, 1, 1, 1, 1,
1.367456, 1.390997, 1.882001, 1, 1, 1, 1, 1,
1.368355, 0.3639249, 1.989958, 1, 1, 1, 1, 1,
1.375138, -0.9078957, 2.188102, 1, 1, 1, 1, 1,
1.375234, -0.49291, 1.768348, 1, 1, 1, 1, 1,
1.379605, 0.9272388, 0.8670157, 1, 1, 1, 1, 1,
1.383636, -2.471507, 2.130998, 1, 1, 1, 1, 1,
1.386696, 0.4436994, 1.098051, 0, 0, 1, 1, 1,
1.390602, -1.232448, 2.434097, 1, 0, 0, 1, 1,
1.396091, -0.721739, 2.632709, 1, 0, 0, 1, 1,
1.410249, -0.02801046, 3.206616, 1, 0, 0, 1, 1,
1.411379, -0.7985606, 2.204659, 1, 0, 0, 1, 1,
1.416268, 0.5008134, 0.4225141, 1, 0, 0, 1, 1,
1.424269, -1.415048, 3.820974, 0, 0, 0, 1, 1,
1.43353, -0.8421814, -0.4807269, 0, 0, 0, 1, 1,
1.436819, -0.528706, 2.661486, 0, 0, 0, 1, 1,
1.439225, 0.3119124, 0.7783234, 0, 0, 0, 1, 1,
1.444843, -1.058273, 2.825625, 0, 0, 0, 1, 1,
1.446014, 0.1050327, 0.8741233, 0, 0, 0, 1, 1,
1.448843, 1.687153, -0.2686226, 0, 0, 0, 1, 1,
1.464252, -0.4122761, 2.158798, 1, 1, 1, 1, 1,
1.475454, -0.08669817, 1.295819, 1, 1, 1, 1, 1,
1.503907, 1.301782, 0.6274235, 1, 1, 1, 1, 1,
1.506739, 0.6996671, 1.497048, 1, 1, 1, 1, 1,
1.507938, 1.687757, 0.1640333, 1, 1, 1, 1, 1,
1.525186, 0.2683958, 1.014174, 1, 1, 1, 1, 1,
1.531452, 0.1209418, 1.483096, 1, 1, 1, 1, 1,
1.558575, 0.5954348, 0.1276789, 1, 1, 1, 1, 1,
1.563907, 0.6576259, 0.8879232, 1, 1, 1, 1, 1,
1.572418, -0.1059329, 1.096291, 1, 1, 1, 1, 1,
1.583669, 0.9850202, -1.173559, 1, 1, 1, 1, 1,
1.593516, -1.098647, 2.421274, 1, 1, 1, 1, 1,
1.595767, -0.9301742, 3.246042, 1, 1, 1, 1, 1,
1.597827, 0.7865759, 1.733487, 1, 1, 1, 1, 1,
1.60625, -1.504954, 0.7638904, 1, 1, 1, 1, 1,
1.632554, 1.09826, 1.07035, 0, 0, 1, 1, 1,
1.657137, 0.1268781, 1.998572, 1, 0, 0, 1, 1,
1.670385, -0.5623907, 2.444901, 1, 0, 0, 1, 1,
1.746455, -0.1899233, 0.1029629, 1, 0, 0, 1, 1,
1.755145, 0.8291252, 0.5809392, 1, 0, 0, 1, 1,
1.763746, 0.2156367, 0.2339715, 1, 0, 0, 1, 1,
1.786337, 1.017022, 2.220814, 0, 0, 0, 1, 1,
1.792405, 1.680932, 0.4471339, 0, 0, 0, 1, 1,
1.797176, 0.7453321, -0.1770076, 0, 0, 0, 1, 1,
1.807542, 1.304061, 0.4263007, 0, 0, 0, 1, 1,
1.818592, -1.112122, 1.971791, 0, 0, 0, 1, 1,
1.819483, 1.410454, 0.7020416, 0, 0, 0, 1, 1,
1.834538, -0.589357, 0.4848851, 0, 0, 0, 1, 1,
1.864512, -0.257979, 2.925389, 1, 1, 1, 1, 1,
1.871477, 0.4591298, 1.430457, 1, 1, 1, 1, 1,
1.881413, 1.080487, 0.5670547, 1, 1, 1, 1, 1,
1.93044, -0.2030906, 0.5281636, 1, 1, 1, 1, 1,
1.934971, 0.5780736, -1.076522, 1, 1, 1, 1, 1,
1.936702, -0.07301373, 3.274478, 1, 1, 1, 1, 1,
1.952641, 0.9914734, 0.8590289, 1, 1, 1, 1, 1,
1.964733, 0.7020625, 2.61997, 1, 1, 1, 1, 1,
1.965796, 0.4418946, 0.3011079, 1, 1, 1, 1, 1,
1.977605, 2.130236, -0.8989962, 1, 1, 1, 1, 1,
1.978095, -1.40297, 1.1233, 1, 1, 1, 1, 1,
1.984235, 0.9751348, 0.420573, 1, 1, 1, 1, 1,
2.041636, 0.2978812, 1.209329, 1, 1, 1, 1, 1,
2.047476, -0.4734465, 2.302737, 1, 1, 1, 1, 1,
2.089331, -2.204766, 1.666952, 1, 1, 1, 1, 1,
2.092757, 0.5864085, 1.227938, 0, 0, 1, 1, 1,
2.099706, -0.246683, 0.6907234, 1, 0, 0, 1, 1,
2.109058, -0.008894576, 0.9849234, 1, 0, 0, 1, 1,
2.13888, -1.763789, 2.563151, 1, 0, 0, 1, 1,
2.139737, -1.053753, -0.4962397, 1, 0, 0, 1, 1,
2.178124, -0.6246721, 2.133046, 1, 0, 0, 1, 1,
2.212184, -0.558152, 3.969836, 0, 0, 0, 1, 1,
2.213364, 0.247924, -0.5638067, 0, 0, 0, 1, 1,
2.307599, -0.4931344, 2.297879, 0, 0, 0, 1, 1,
2.324033, 1.763537, 1.885084, 0, 0, 0, 1, 1,
2.365005, 0.400207, 2.591223, 0, 0, 0, 1, 1,
2.384586, -1.398893, 0.2733972, 0, 0, 0, 1, 1,
2.424307, -2.125267, 2.79273, 0, 0, 0, 1, 1,
2.536513, -0.1911163, 0.9117151, 1, 1, 1, 1, 1,
2.616515, -0.4755875, 2.292484, 1, 1, 1, 1, 1,
2.745012, 0.543258, -0.8680791, 1, 1, 1, 1, 1,
2.747401, -1.032486, 2.534644, 1, 1, 1, 1, 1,
2.900869, 0.1776107, 2.998935, 1, 1, 1, 1, 1,
2.916025, 0.1070022, 0.5261139, 1, 1, 1, 1, 1,
3.613296, 0.4749227, 1.448329, 1, 1, 1, 1, 1
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
var radius = 9.973981;
var distance = 35.03319;
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
mvMatrix.translate( -0.5133736, -0.2110672, 0.00437665 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.03319);
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