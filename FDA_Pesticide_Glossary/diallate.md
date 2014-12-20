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
-3.94344, 1.673234, -0.1420638, 1, 0, 0, 1,
-3.13942, 1.859768, -2.613766, 1, 0.007843138, 0, 1,
-2.710098, 0.3891095, -0.8692961, 1, 0.01176471, 0, 1,
-2.677418, 1.478585, 0.6770426, 1, 0.01960784, 0, 1,
-2.659104, 0.2357192, -1.373181, 1, 0.02352941, 0, 1,
-2.61822, -1.225002, -2.149534, 1, 0.03137255, 0, 1,
-2.572254, -1.318147, -0.6791431, 1, 0.03529412, 0, 1,
-2.557411, -0.2110675, -1.666534, 1, 0.04313726, 0, 1,
-2.536224, -0.7116928, -0.7239966, 1, 0.04705882, 0, 1,
-2.5217, -1.902955, -2.498853, 1, 0.05490196, 0, 1,
-2.517432, 0.3836882, -0.9294319, 1, 0.05882353, 0, 1,
-2.517398, 1.242513, -1.11206, 1, 0.06666667, 0, 1,
-2.268013, -0.08569641, -0.1365334, 1, 0.07058824, 0, 1,
-2.249356, -0.8452395, -3.182991, 1, 0.07843138, 0, 1,
-2.184109, -2.222726, -2.225324, 1, 0.08235294, 0, 1,
-2.132775, -1.524015, -2.386637, 1, 0.09019608, 0, 1,
-2.124153, -0.01495693, -1.608081, 1, 0.09411765, 0, 1,
-2.11938, 0.9325398, -1.586703, 1, 0.1019608, 0, 1,
-2.045127, -1.277366, -4.186986, 1, 0.1098039, 0, 1,
-2.041723, -1.526924, -2.17253, 1, 0.1137255, 0, 1,
-2.019521, -0.9506803, 0.1413121, 1, 0.1215686, 0, 1,
-1.954795, -0.3891834, -0.8647137, 1, 0.1254902, 0, 1,
-1.949529, 1.593636, -0.2335288, 1, 0.1333333, 0, 1,
-1.93081, -0.5366854, -1.769952, 1, 0.1372549, 0, 1,
-1.927889, 0.1026596, -1.086316, 1, 0.145098, 0, 1,
-1.922777, 0.3418494, -0.235212, 1, 0.1490196, 0, 1,
-1.919995, 1.466217, -1.170759, 1, 0.1568628, 0, 1,
-1.896986, -0.4793985, -1.807781, 1, 0.1607843, 0, 1,
-1.866957, -0.6103787, -1.495869, 1, 0.1686275, 0, 1,
-1.866264, 1.944658, -0.09577698, 1, 0.172549, 0, 1,
-1.84969, 1.678288, -1.16178, 1, 0.1803922, 0, 1,
-1.820133, -1.088882, -1.811848, 1, 0.1843137, 0, 1,
-1.794879, -1.458107, -2.597202, 1, 0.1921569, 0, 1,
-1.78469, 1.532396, -0.03703899, 1, 0.1960784, 0, 1,
-1.754783, 1.760755, -0.5813417, 1, 0.2039216, 0, 1,
-1.753312, 0.9318596, -1.84486, 1, 0.2117647, 0, 1,
-1.752195, -0.08855335, -2.186138, 1, 0.2156863, 0, 1,
-1.742183, 0.05394156, -1.11664, 1, 0.2235294, 0, 1,
-1.711378, 0.3735178, -0.2659402, 1, 0.227451, 0, 1,
-1.70882, 0.372788, -2.982757, 1, 0.2352941, 0, 1,
-1.702314, -0.2598718, -2.214711, 1, 0.2392157, 0, 1,
-1.68656, 1.217734, -0.3261652, 1, 0.2470588, 0, 1,
-1.677379, -1.49878, -3.53284, 1, 0.2509804, 0, 1,
-1.668868, 1.321532, -0.8748519, 1, 0.2588235, 0, 1,
-1.668077, 0.6182773, -0.8752761, 1, 0.2627451, 0, 1,
-1.66292, 0.2812749, -0.8044754, 1, 0.2705882, 0, 1,
-1.659186, -0.7975093, -1.531109, 1, 0.2745098, 0, 1,
-1.65876, 0.2834898, -1.229447, 1, 0.282353, 0, 1,
-1.653933, -1.247273, -4.062644, 1, 0.2862745, 0, 1,
-1.653567, 2.486955, -0.3630139, 1, 0.2941177, 0, 1,
-1.641027, -2.020762, -3.391983, 1, 0.3019608, 0, 1,
-1.639847, -0.8455486, -1.650803, 1, 0.3058824, 0, 1,
-1.620276, 0.2640892, -2.890072, 1, 0.3137255, 0, 1,
-1.617626, -1.471901, -3.302024, 1, 0.3176471, 0, 1,
-1.615932, 1.223042, -1.565202, 1, 0.3254902, 0, 1,
-1.586427, -0.2534966, -1.720064, 1, 0.3294118, 0, 1,
-1.573729, 0.3454221, -3.239981, 1, 0.3372549, 0, 1,
-1.567803, -0.5665768, -1.311681, 1, 0.3411765, 0, 1,
-1.567682, 1.349839, -1.000722, 1, 0.3490196, 0, 1,
-1.567671, 0.214805, -3.186611, 1, 0.3529412, 0, 1,
-1.554202, -0.1999265, -2.147109, 1, 0.3607843, 0, 1,
-1.548029, -0.8385146, -4.058532, 1, 0.3647059, 0, 1,
-1.547889, 1.224833, -1.450104, 1, 0.372549, 0, 1,
-1.542637, 2.269733, -1.736377, 1, 0.3764706, 0, 1,
-1.542619, 0.7903618, -0.9012278, 1, 0.3843137, 0, 1,
-1.528022, 1.532646, -0.5531378, 1, 0.3882353, 0, 1,
-1.509921, 0.9051544, -2.528502, 1, 0.3960784, 0, 1,
-1.502972, 0.7700124, -2.507489, 1, 0.4039216, 0, 1,
-1.497494, 0.1814936, -1.990204, 1, 0.4078431, 0, 1,
-1.491901, 0.8806574, -2.022857, 1, 0.4156863, 0, 1,
-1.482804, -0.5048856, -0.9196205, 1, 0.4196078, 0, 1,
-1.458215, 1.289018, -0.4789515, 1, 0.427451, 0, 1,
-1.437448, -0.1056488, -3.004475, 1, 0.4313726, 0, 1,
-1.43642, 0.09900219, -1.241671, 1, 0.4392157, 0, 1,
-1.43135, 0.8195114, -0.4958766, 1, 0.4431373, 0, 1,
-1.4175, -0.9601465, -2.183603, 1, 0.4509804, 0, 1,
-1.41649, -0.2987026, -1.687468, 1, 0.454902, 0, 1,
-1.413589, -0.3089419, 0.08927882, 1, 0.4627451, 0, 1,
-1.411628, 1.105623, -2.026265, 1, 0.4666667, 0, 1,
-1.407919, 0.1422149, -2.173732, 1, 0.4745098, 0, 1,
-1.402726, 1.21836, -0.04817863, 1, 0.4784314, 0, 1,
-1.39589, 1.779469, -0.2527371, 1, 0.4862745, 0, 1,
-1.382977, 0.1176394, -1.448488, 1, 0.4901961, 0, 1,
-1.380006, 2.340878, -1.78714, 1, 0.4980392, 0, 1,
-1.373236, 0.06119925, -1.084447, 1, 0.5058824, 0, 1,
-1.366671, -0.8141465, -3.985998, 1, 0.509804, 0, 1,
-1.359572, -0.5802215, -2.800479, 1, 0.5176471, 0, 1,
-1.348567, -0.2298906, -3.374128, 1, 0.5215687, 0, 1,
-1.348324, -0.7818082, -2.318874, 1, 0.5294118, 0, 1,
-1.333667, -0.1151635, -2.098891, 1, 0.5333334, 0, 1,
-1.326795, -2.774195, -3.300718, 1, 0.5411765, 0, 1,
-1.325738, 1.329837, -0.1874928, 1, 0.5450981, 0, 1,
-1.310683, 0.3058382, -2.292866, 1, 0.5529412, 0, 1,
-1.310043, -1.861527, -1.387403, 1, 0.5568628, 0, 1,
-1.299989, -1.110787, -2.402802, 1, 0.5647059, 0, 1,
-1.295645, -1.583796, -1.997222, 1, 0.5686275, 0, 1,
-1.275252, -2.735114, -3.976677, 1, 0.5764706, 0, 1,
-1.272638, 0.1645748, -3.477794, 1, 0.5803922, 0, 1,
-1.266257, -0.7617429, -3.088938, 1, 0.5882353, 0, 1,
-1.255184, -0.09829139, -2.738423, 1, 0.5921569, 0, 1,
-1.241088, 0.5802483, -0.9622701, 1, 0.6, 0, 1,
-1.240537, 0.6406128, 0.5424384, 1, 0.6078432, 0, 1,
-1.237907, 2.173866, -1.434377, 1, 0.6117647, 0, 1,
-1.237405, 0.1053298, -1.908273, 1, 0.6196079, 0, 1,
-1.233793, -0.1789857, -2.480035, 1, 0.6235294, 0, 1,
-1.230394, 1.404055, -2.135142, 1, 0.6313726, 0, 1,
-1.22965, -0.6484345, -0.8668225, 1, 0.6352941, 0, 1,
-1.227424, -0.2413474, -2.602638, 1, 0.6431373, 0, 1,
-1.226695, 0.4126622, -2.472496, 1, 0.6470588, 0, 1,
-1.226626, 0.05532929, -2.978618, 1, 0.654902, 0, 1,
-1.219693, 2.063825, -0.3340873, 1, 0.6588235, 0, 1,
-1.21388, 0.9207627, -0.307909, 1, 0.6666667, 0, 1,
-1.208082, -1.214238, -3.031956, 1, 0.6705883, 0, 1,
-1.206251, -0.7661607, -2.206534, 1, 0.6784314, 0, 1,
-1.202544, 0.9750291, -1.7387, 1, 0.682353, 0, 1,
-1.201357, 0.2112586, -0.8561163, 1, 0.6901961, 0, 1,
-1.187603, 1.175364, -1.501023, 1, 0.6941177, 0, 1,
-1.183144, 1.471527, -1.771495, 1, 0.7019608, 0, 1,
-1.182209, -0.1292971, -3.266487, 1, 0.7098039, 0, 1,
-1.173005, 0.5048456, -1.550303, 1, 0.7137255, 0, 1,
-1.17206, 0.8471931, -2.07809, 1, 0.7215686, 0, 1,
-1.17077, -0.867385, -1.124218, 1, 0.7254902, 0, 1,
-1.169742, -0.03208478, 0.04090837, 1, 0.7333333, 0, 1,
-1.164141, -2.461458, -3.395723, 1, 0.7372549, 0, 1,
-1.163833, 0.3580681, -2.077235, 1, 0.7450981, 0, 1,
-1.163535, 0.1476986, -1.755083, 1, 0.7490196, 0, 1,
-1.160909, 0.2929431, -2.243874, 1, 0.7568628, 0, 1,
-1.159006, -0.2846128, -1.826398, 1, 0.7607843, 0, 1,
-1.152856, -1.393563, -2.818023, 1, 0.7686275, 0, 1,
-1.142896, 0.6733219, -0.4402361, 1, 0.772549, 0, 1,
-1.141108, -0.7452847, -3.974852, 1, 0.7803922, 0, 1,
-1.108423, -0.4732594, -1.72078, 1, 0.7843137, 0, 1,
-1.099341, -1.176765, -1.21615, 1, 0.7921569, 0, 1,
-1.098783, 0.1477852, -3.332405, 1, 0.7960784, 0, 1,
-1.092752, -0.395377, -0.422316, 1, 0.8039216, 0, 1,
-1.088571, 0.4802508, -1.956218, 1, 0.8117647, 0, 1,
-1.086786, -0.1863552, -1.367039, 1, 0.8156863, 0, 1,
-1.085603, -1.057342, -2.459949, 1, 0.8235294, 0, 1,
-1.070864, -1.626622, -1.623501, 1, 0.827451, 0, 1,
-1.062584, 2.367383, 0.02886031, 1, 0.8352941, 0, 1,
-1.053025, 0.1524706, -0.5559089, 1, 0.8392157, 0, 1,
-1.048537, -0.1698973, -2.742804, 1, 0.8470588, 0, 1,
-1.033547, 2.006669, -0.5251049, 1, 0.8509804, 0, 1,
-1.032263, -1.419848, -2.786001, 1, 0.8588235, 0, 1,
-1.030939, 1.41281, -0.3258077, 1, 0.8627451, 0, 1,
-1.028541, 0.3362611, -1.897307, 1, 0.8705882, 0, 1,
-1.021117, 0.9689859, 0.7912726, 1, 0.8745098, 0, 1,
-1.017297, -0.4981432, -1.371906, 1, 0.8823529, 0, 1,
-1.008213, -0.5798159, -1.517905, 1, 0.8862745, 0, 1,
-1.007797, -0.5016285, -1.455011, 1, 0.8941177, 0, 1,
-1.005713, -0.9632825, -1.324217, 1, 0.8980392, 0, 1,
-0.9998205, 0.2838713, -1.46762, 1, 0.9058824, 0, 1,
-0.99898, -0.548387, -1.531544, 1, 0.9137255, 0, 1,
-0.9982965, -0.4982474, -2.352328, 1, 0.9176471, 0, 1,
-0.9882169, -1.369873, -1.367355, 1, 0.9254902, 0, 1,
-0.9860227, -0.1398237, -0.5987247, 1, 0.9294118, 0, 1,
-0.9822152, -1.231407, -1.436765, 1, 0.9372549, 0, 1,
-0.978976, -0.8705876, -3.316872, 1, 0.9411765, 0, 1,
-0.9772612, 0.2760908, -2.537608, 1, 0.9490196, 0, 1,
-0.9745795, -0.2874356, 0.05602994, 1, 0.9529412, 0, 1,
-0.9721393, -0.8357691, -1.626536, 1, 0.9607843, 0, 1,
-0.9704118, 0.2997285, -2.139133, 1, 0.9647059, 0, 1,
-0.9662985, 0.9139598, -0.4602997, 1, 0.972549, 0, 1,
-0.9618409, 1.078583, -1.35444, 1, 0.9764706, 0, 1,
-0.9616711, 0.4647089, -1.482692, 1, 0.9843137, 0, 1,
-0.9509155, 0.3252819, -1.808154, 1, 0.9882353, 0, 1,
-0.9452748, -0.7210141, -2.695322, 1, 0.9960784, 0, 1,
-0.9416416, -0.4642022, -1.957913, 0.9960784, 1, 0, 1,
-0.94099, 0.2533046, -2.677997, 0.9921569, 1, 0, 1,
-0.9369084, 1.412652, -1.248633, 0.9843137, 1, 0, 1,
-0.9315888, 0.503114, -1.90591, 0.9803922, 1, 0, 1,
-0.9275239, 1.298721, 0.62333, 0.972549, 1, 0, 1,
-0.9268205, 0.5023749, -1.594971, 0.9686275, 1, 0, 1,
-0.9266427, 0.0539462, 0.1332593, 0.9607843, 1, 0, 1,
-0.9212276, 0.4824347, -3.099188, 0.9568627, 1, 0, 1,
-0.92083, -0.01345288, -2.271559, 0.9490196, 1, 0, 1,
-0.9208105, 0.5966298, 0.03916837, 0.945098, 1, 0, 1,
-0.9169545, 0.4157436, -1.049311, 0.9372549, 1, 0, 1,
-0.9090192, -0.8779928, -2.872853, 0.9333333, 1, 0, 1,
-0.908131, -0.8501446, -0.7638719, 0.9254902, 1, 0, 1,
-0.9028449, 1.797199, 1.04626, 0.9215686, 1, 0, 1,
-0.8987422, 0.5573047, 0.131295, 0.9137255, 1, 0, 1,
-0.8907933, 0.4742789, -0.6663992, 0.9098039, 1, 0, 1,
-0.8907394, -1.284604, -2.969218, 0.9019608, 1, 0, 1,
-0.888315, 1.320628, 1.488643, 0.8941177, 1, 0, 1,
-0.885415, 1.695215, -0.5175576, 0.8901961, 1, 0, 1,
-0.8827368, 0.7982468, -0.6972096, 0.8823529, 1, 0, 1,
-0.8791145, -0.3289685, -1.856932, 0.8784314, 1, 0, 1,
-0.8789966, 0.8132339, -0.5713909, 0.8705882, 1, 0, 1,
-0.8778207, 1.300543, -1.791917, 0.8666667, 1, 0, 1,
-0.8762372, -0.4286355, -3.021969, 0.8588235, 1, 0, 1,
-0.8747331, -1.186244, -1.700763, 0.854902, 1, 0, 1,
-0.874418, -1.190512, -1.48536, 0.8470588, 1, 0, 1,
-0.8684302, -0.2236203, -1.273602, 0.8431373, 1, 0, 1,
-0.8635574, -1.121528, -4.2423, 0.8352941, 1, 0, 1,
-0.8630133, -1.613892, -1.673825, 0.8313726, 1, 0, 1,
-0.856638, 0.6232812, 0.2289571, 0.8235294, 1, 0, 1,
-0.8550686, 0.2014144, 0.1959493, 0.8196079, 1, 0, 1,
-0.8434941, 0.2681898, -2.181852, 0.8117647, 1, 0, 1,
-0.8408347, 1.508275, -0.7742078, 0.8078431, 1, 0, 1,
-0.8383902, -0.3542441, -3.138578, 0.8, 1, 0, 1,
-0.8381612, 1.486511, -0.8427675, 0.7921569, 1, 0, 1,
-0.8366549, 0.6520039, -0.2292683, 0.7882353, 1, 0, 1,
-0.8344399, -0.6128485, -1.631467, 0.7803922, 1, 0, 1,
-0.8265878, -0.07375249, -2.718135, 0.7764706, 1, 0, 1,
-0.8256029, 0.6007779, -1.702725, 0.7686275, 1, 0, 1,
-0.8146074, 1.217418, -1.304823, 0.7647059, 1, 0, 1,
-0.8133594, 2.806443, -0.808697, 0.7568628, 1, 0, 1,
-0.8102272, 1.508686, -0.2463803, 0.7529412, 1, 0, 1,
-0.8095102, 2.048725, -0.1246254, 0.7450981, 1, 0, 1,
-0.8051665, -0.09170239, 0.5813913, 0.7411765, 1, 0, 1,
-0.8019987, -0.2651086, -2.392113, 0.7333333, 1, 0, 1,
-0.7960762, 1.252017, -0.7113084, 0.7294118, 1, 0, 1,
-0.7890083, 0.9873214, -0.6298687, 0.7215686, 1, 0, 1,
-0.7875385, 1.615795, -1.71141, 0.7176471, 1, 0, 1,
-0.7854943, 0.3923539, 0.2766595, 0.7098039, 1, 0, 1,
-0.7833756, -0.006475571, -2.659795, 0.7058824, 1, 0, 1,
-0.7785564, 1.011097, -2.768214, 0.6980392, 1, 0, 1,
-0.7748234, -0.9950169, -2.112375, 0.6901961, 1, 0, 1,
-0.7691559, -0.6652094, -1.408437, 0.6862745, 1, 0, 1,
-0.7648636, 0.1462895, -1.882576, 0.6784314, 1, 0, 1,
-0.7641419, 0.3420181, -0.4002811, 0.6745098, 1, 0, 1,
-0.7596104, -1.490119, -1.836206, 0.6666667, 1, 0, 1,
-0.7561133, 0.6174374, 0.1305403, 0.6627451, 1, 0, 1,
-0.7518739, -0.6153144, -1.545111, 0.654902, 1, 0, 1,
-0.7505081, -0.514261, -1.162925, 0.6509804, 1, 0, 1,
-0.7504039, 0.167443, 0.6423832, 0.6431373, 1, 0, 1,
-0.7493087, -0.05223845, 0.1438052, 0.6392157, 1, 0, 1,
-0.7463866, -0.111481, -0.1164466, 0.6313726, 1, 0, 1,
-0.7460617, -0.7021505, -3.196321, 0.627451, 1, 0, 1,
-0.7441797, -1.322063, -2.52218, 0.6196079, 1, 0, 1,
-0.7409426, 0.2701885, -0.4894423, 0.6156863, 1, 0, 1,
-0.7363978, -1.197038, -2.931636, 0.6078432, 1, 0, 1,
-0.7345479, -1.850446, -4.422785, 0.6039216, 1, 0, 1,
-0.7278672, -0.6130393, -3.374016, 0.5960785, 1, 0, 1,
-0.7256118, -1.028584, -2.044104, 0.5882353, 1, 0, 1,
-0.7225246, 2.141737, 2.279411, 0.5843138, 1, 0, 1,
-0.7215992, -0.7023214, -3.623446, 0.5764706, 1, 0, 1,
-0.7202194, -0.800467, -3.070166, 0.572549, 1, 0, 1,
-0.7200438, -0.04314639, -2.457872, 0.5647059, 1, 0, 1,
-0.7191682, -0.4682242, -1.172498, 0.5607843, 1, 0, 1,
-0.7167895, -0.8890154, -1.564033, 0.5529412, 1, 0, 1,
-0.7128969, -0.355831, -2.903416, 0.5490196, 1, 0, 1,
-0.7111409, 0.1982372, -0.01494537, 0.5411765, 1, 0, 1,
-0.7110924, -0.279052, -2.435098, 0.5372549, 1, 0, 1,
-0.7103158, 1.519202, -0.2821993, 0.5294118, 1, 0, 1,
-0.7078952, -1.40916, -2.141539, 0.5254902, 1, 0, 1,
-0.7075912, 1.875243, -0.769978, 0.5176471, 1, 0, 1,
-0.7008141, 0.5617375, -1.433389, 0.5137255, 1, 0, 1,
-0.6997219, 0.04903836, -0.4297781, 0.5058824, 1, 0, 1,
-0.6967213, 2.101333, -2.324242, 0.5019608, 1, 0, 1,
-0.6965263, 0.06772303, -2.357193, 0.4941176, 1, 0, 1,
-0.6957892, -0.9377218, -3.346361, 0.4862745, 1, 0, 1,
-0.6934436, -0.7363877, -1.489331, 0.4823529, 1, 0, 1,
-0.6913333, -0.8953505, -0.09170194, 0.4745098, 1, 0, 1,
-0.6912774, 1.347868, -0.857441, 0.4705882, 1, 0, 1,
-0.6801023, -2.25763, -2.52259, 0.4627451, 1, 0, 1,
-0.6758104, -0.1750222, -1.0075, 0.4588235, 1, 0, 1,
-0.6721364, -1.364585, -2.934088, 0.4509804, 1, 0, 1,
-0.6719157, 0.6686099, -2.363954, 0.4470588, 1, 0, 1,
-0.6685486, 2.218825, -1.555036, 0.4392157, 1, 0, 1,
-0.6652643, 0.3945195, -1.105984, 0.4352941, 1, 0, 1,
-0.66344, 0.3474459, -1.084012, 0.427451, 1, 0, 1,
-0.6627834, -0.2307832, -1.327598, 0.4235294, 1, 0, 1,
-0.6627697, 0.0878384, -1.671688, 0.4156863, 1, 0, 1,
-0.661386, 0.4413087, -1.212482, 0.4117647, 1, 0, 1,
-0.6458576, -0.3566462, -3.910847, 0.4039216, 1, 0, 1,
-0.6454693, -0.5523297, -3.911912, 0.3960784, 1, 0, 1,
-0.6352476, 0.4952671, -1.715293, 0.3921569, 1, 0, 1,
-0.6323797, -1.006541, -4.505849, 0.3843137, 1, 0, 1,
-0.6298733, -1.39367, -3.702984, 0.3803922, 1, 0, 1,
-0.6279832, -1.270239, -2.957263, 0.372549, 1, 0, 1,
-0.6253883, 0.859266, -1.639526, 0.3686275, 1, 0, 1,
-0.6138706, 0.6513086, -0.582577, 0.3607843, 1, 0, 1,
-0.6065275, 1.049511, -0.4498276, 0.3568628, 1, 0, 1,
-0.6050192, -0.2809474, -3.983288, 0.3490196, 1, 0, 1,
-0.6015674, -1.282752, -3.070301, 0.345098, 1, 0, 1,
-0.5978148, -0.8787283, -3.331496, 0.3372549, 1, 0, 1,
-0.5958521, -0.1646388, -0.3967221, 0.3333333, 1, 0, 1,
-0.594171, 0.00323465, -3.378112, 0.3254902, 1, 0, 1,
-0.591731, -0.3098364, -1.645181, 0.3215686, 1, 0, 1,
-0.5880286, 1.572963, -0.1078176, 0.3137255, 1, 0, 1,
-0.5848009, -0.5036501, -1.374282, 0.3098039, 1, 0, 1,
-0.5839484, -0.9367382, -1.906058, 0.3019608, 1, 0, 1,
-0.5831656, -0.854871, -1.177586, 0.2941177, 1, 0, 1,
-0.581844, 1.222243, 0.2420703, 0.2901961, 1, 0, 1,
-0.5754916, -0.6524976, -3.717966, 0.282353, 1, 0, 1,
-0.5728939, -0.4472782, -4.108366, 0.2784314, 1, 0, 1,
-0.572072, -0.03754332, -1.978606, 0.2705882, 1, 0, 1,
-0.5691351, 1.763374, -1.485862, 0.2666667, 1, 0, 1,
-0.5602575, -0.432861, -1.758888, 0.2588235, 1, 0, 1,
-0.5575577, 0.3886234, -1.023829, 0.254902, 1, 0, 1,
-0.5538204, -0.0160406, -2.129532, 0.2470588, 1, 0, 1,
-0.5520545, -1.001646, -2.247114, 0.2431373, 1, 0, 1,
-0.5483034, 0.3045675, -0.58053, 0.2352941, 1, 0, 1,
-0.5460143, 1.659207, -1.03702, 0.2313726, 1, 0, 1,
-0.5453147, -0.1105587, -3.442317, 0.2235294, 1, 0, 1,
-0.5373392, 0.9850592, -0.6366634, 0.2196078, 1, 0, 1,
-0.5372558, 0.50093, -0.8604563, 0.2117647, 1, 0, 1,
-0.5340112, 0.3313192, -1.40155, 0.2078431, 1, 0, 1,
-0.5310727, 0.3845356, -0.9191624, 0.2, 1, 0, 1,
-0.5265214, 1.384405, 0.2663312, 0.1921569, 1, 0, 1,
-0.5201192, 0.5606976, -0.4849215, 0.1882353, 1, 0, 1,
-0.5197029, 0.5716782, 1.20831, 0.1803922, 1, 0, 1,
-0.5179778, 0.9374589, -0.1795221, 0.1764706, 1, 0, 1,
-0.5131013, -0.4428415, -3.29572, 0.1686275, 1, 0, 1,
-0.5099874, 0.1376865, -3.220297, 0.1647059, 1, 0, 1,
-0.5045599, -0.3927517, -1.210459, 0.1568628, 1, 0, 1,
-0.50078, -1.288805, -1.474312, 0.1529412, 1, 0, 1,
-0.4934263, 0.6276352, -2.359501, 0.145098, 1, 0, 1,
-0.4912804, -0.8473756, -1.753195, 0.1411765, 1, 0, 1,
-0.4866309, -0.2481223, -0.7971241, 0.1333333, 1, 0, 1,
-0.4861736, -0.9615497, -2.982279, 0.1294118, 1, 0, 1,
-0.4830621, -0.5195127, -2.070576, 0.1215686, 1, 0, 1,
-0.4826976, 1.063021, 0.2523865, 0.1176471, 1, 0, 1,
-0.475958, 2.653888, -0.8973706, 0.1098039, 1, 0, 1,
-0.4688857, 0.6705666, -0.9006902, 0.1058824, 1, 0, 1,
-0.4640797, -0.2821737, 0.342097, 0.09803922, 1, 0, 1,
-0.4633547, -0.715681, -4.017773, 0.09019608, 1, 0, 1,
-0.4621647, -0.6396706, -1.599931, 0.08627451, 1, 0, 1,
-0.4617973, 0.4357443, -0.9685193, 0.07843138, 1, 0, 1,
-0.4587694, -0.0853317, -1.037506, 0.07450981, 1, 0, 1,
-0.4577009, 0.1023233, -2.630748, 0.06666667, 1, 0, 1,
-0.4558111, 1.013615, -2.112439, 0.0627451, 1, 0, 1,
-0.4556431, 1.279639, -0.4536332, 0.05490196, 1, 0, 1,
-0.4514313, 1.247157, -0.06349609, 0.05098039, 1, 0, 1,
-0.4483633, 1.674954, 1.317725, 0.04313726, 1, 0, 1,
-0.447613, -0.1202959, -3.041038, 0.03921569, 1, 0, 1,
-0.4445805, -0.2694498, -1.185715, 0.03137255, 1, 0, 1,
-0.4385461, 0.8476893, -1.28689, 0.02745098, 1, 0, 1,
-0.4354001, 1.513168, -1.095276, 0.01960784, 1, 0, 1,
-0.4349725, -0.04804068, -0.6879708, 0.01568628, 1, 0, 1,
-0.4340858, 0.5312344, -0.6748704, 0.007843138, 1, 0, 1,
-0.4338898, 0.5188001, -0.3409247, 0.003921569, 1, 0, 1,
-0.4306228, 0.4771355, -1.76581, 0, 1, 0.003921569, 1,
-0.4267431, 0.02362664, -2.194361, 0, 1, 0.01176471, 1,
-0.4255635, -0.2891545, -2.745581, 0, 1, 0.01568628, 1,
-0.4199836, -1.829634, -2.821385, 0, 1, 0.02352941, 1,
-0.4196874, 0.6273782, -0.2537998, 0, 1, 0.02745098, 1,
-0.4146107, 0.7062551, -1.413006, 0, 1, 0.03529412, 1,
-0.412677, 1.088283, -0.9787924, 0, 1, 0.03921569, 1,
-0.4086722, -0.5023682, -2.353272, 0, 1, 0.04705882, 1,
-0.4062746, 0.1983494, -1.162102, 0, 1, 0.05098039, 1,
-0.4019336, -0.2756017, -1.612627, 0, 1, 0.05882353, 1,
-0.3999403, -0.1525695, -2.072733, 0, 1, 0.0627451, 1,
-0.3971333, 0.2338724, -0.5857277, 0, 1, 0.07058824, 1,
-0.3942784, -1.278025, -3.040652, 0, 1, 0.07450981, 1,
-0.3894305, 1.40887, -1.368378, 0, 1, 0.08235294, 1,
-0.3846756, -0.496452, -3.420115, 0, 1, 0.08627451, 1,
-0.3844607, 2.10242, 1.917003, 0, 1, 0.09411765, 1,
-0.3777025, -1.175811, -0.507816, 0, 1, 0.1019608, 1,
-0.3737627, 0.3586673, -1.246501, 0, 1, 0.1058824, 1,
-0.3733163, -0.3564568, -0.6176174, 0, 1, 0.1137255, 1,
-0.3723602, -2.676504, -3.148016, 0, 1, 0.1176471, 1,
-0.3713082, 1.792162, -1.636353, 0, 1, 0.1254902, 1,
-0.3702341, 1.226931, 0.2621269, 0, 1, 0.1294118, 1,
-0.3681521, -1.260396, -1.59205, 0, 1, 0.1372549, 1,
-0.3665782, 0.7980528, 2.852753, 0, 1, 0.1411765, 1,
-0.3651497, 0.4483713, 0.487116, 0, 1, 0.1490196, 1,
-0.3629968, 1.559297, 0.1008511, 0, 1, 0.1529412, 1,
-0.3513614, -0.422708, 0.2582631, 0, 1, 0.1607843, 1,
-0.3458516, 1.318298, 1.242772, 0, 1, 0.1647059, 1,
-0.3416108, 0.6799225, -0.4219836, 0, 1, 0.172549, 1,
-0.3362697, -1.819298, -2.489313, 0, 1, 0.1764706, 1,
-0.3328448, 0.7482914, -2.437092, 0, 1, 0.1843137, 1,
-0.3314816, -0.7705753, -3.423191, 0, 1, 0.1882353, 1,
-0.3306429, 0.3287164, -1.522307, 0, 1, 0.1960784, 1,
-0.327766, 0.2972946, 0.6612064, 0, 1, 0.2039216, 1,
-0.3213606, -0.992104, -2.795032, 0, 1, 0.2078431, 1,
-0.3159642, -0.298883, -3.535161, 0, 1, 0.2156863, 1,
-0.3153279, 1.399009, -0.5547065, 0, 1, 0.2196078, 1,
-0.3142701, -1.372197, -1.732978, 0, 1, 0.227451, 1,
-0.3138318, 0.05300073, -1.978039, 0, 1, 0.2313726, 1,
-0.3115907, -0.03564857, -1.81223, 0, 1, 0.2392157, 1,
-0.3100199, -0.2767397, -2.767832, 0, 1, 0.2431373, 1,
-0.3086614, -0.7388378, -3.400862, 0, 1, 0.2509804, 1,
-0.3065661, -0.9216979, -1.575378, 0, 1, 0.254902, 1,
-0.3039775, 1.201662, -0.05076482, 0, 1, 0.2627451, 1,
-0.2961833, -0.1240929, -0.8472364, 0, 1, 0.2666667, 1,
-0.2910082, 0.7010282, 1.664698, 0, 1, 0.2745098, 1,
-0.2883983, -0.5705746, -1.891332, 0, 1, 0.2784314, 1,
-0.2881348, -0.1824965, -1.572398, 0, 1, 0.2862745, 1,
-0.287838, -0.8884152, -2.010764, 0, 1, 0.2901961, 1,
-0.2871172, 0.1998519, -1.734948, 0, 1, 0.2980392, 1,
-0.278499, -0.4351687, -1.987357, 0, 1, 0.3058824, 1,
-0.277136, 0.9119675, -2.526218, 0, 1, 0.3098039, 1,
-0.2741583, -0.5084347, -1.747417, 0, 1, 0.3176471, 1,
-0.2729017, 0.5352166, -0.02899195, 0, 1, 0.3215686, 1,
-0.2726914, -0.312245, -0.7279499, 0, 1, 0.3294118, 1,
-0.271263, -0.5259304, -1.769458, 0, 1, 0.3333333, 1,
-0.2690466, 0.1078613, -2.989721, 0, 1, 0.3411765, 1,
-0.2685358, -0.4611085, -2.522728, 0, 1, 0.345098, 1,
-0.2664494, 0.8540186, 0.003327846, 0, 1, 0.3529412, 1,
-0.2654309, -0.5356926, -2.532997, 0, 1, 0.3568628, 1,
-0.2652762, 0.5761372, 0.858052, 0, 1, 0.3647059, 1,
-0.2649456, 0.510281, -0.5704105, 0, 1, 0.3686275, 1,
-0.2633179, -0.5985484, -2.136855, 0, 1, 0.3764706, 1,
-0.2571723, -1.59106, -1.35186, 0, 1, 0.3803922, 1,
-0.2549704, 2.346174, 0.7469597, 0, 1, 0.3882353, 1,
-0.2543757, 0.3671161, 0.1345928, 0, 1, 0.3921569, 1,
-0.2521099, 1.277625, -0.2437061, 0, 1, 0.4, 1,
-0.2511862, -0.1734498, -1.466456, 0, 1, 0.4078431, 1,
-0.2482473, 0.1471505, -1.108606, 0, 1, 0.4117647, 1,
-0.2436436, 0.3359694, -0.3644948, 0, 1, 0.4196078, 1,
-0.240849, -1.070442, -2.776232, 0, 1, 0.4235294, 1,
-0.2376375, 1.198839, -1.267468, 0, 1, 0.4313726, 1,
-0.2348167, 0.5804911, -0.660621, 0, 1, 0.4352941, 1,
-0.2311739, 0.1698452, -0.6682211, 0, 1, 0.4431373, 1,
-0.2278014, 0.9317495, 1.285065, 0, 1, 0.4470588, 1,
-0.226885, 0.2903193, 1.27132, 0, 1, 0.454902, 1,
-0.2158958, 1.621579, 2.093193, 0, 1, 0.4588235, 1,
-0.2127324, 0.3598192, -0.009166635, 0, 1, 0.4666667, 1,
-0.2088588, -0.4211414, -1.193938, 0, 1, 0.4705882, 1,
-0.2087897, 1.591763, -1.550602, 0, 1, 0.4784314, 1,
-0.2057857, -0.318896, -3.166133, 0, 1, 0.4823529, 1,
-0.2017479, -1.221863, -4.146251, 0, 1, 0.4901961, 1,
-0.198375, -1.032106, -4.801927, 0, 1, 0.4941176, 1,
-0.1959321, 0.3473638, 1.285392, 0, 1, 0.5019608, 1,
-0.1950254, -0.8410506, -4.426448, 0, 1, 0.509804, 1,
-0.192677, 0.2368516, -1.48313, 0, 1, 0.5137255, 1,
-0.1906093, -1.083701, -4.402132, 0, 1, 0.5215687, 1,
-0.1838139, -0.6976653, -2.246501, 0, 1, 0.5254902, 1,
-0.1772943, -0.6900975, -1.875238, 0, 1, 0.5333334, 1,
-0.1712818, -0.9996403, -4.624548, 0, 1, 0.5372549, 1,
-0.1701479, 0.1863488, -2.507241, 0, 1, 0.5450981, 1,
-0.1693612, 1.951164, 0.09896159, 0, 1, 0.5490196, 1,
-0.1662073, 0.9608218, -0.2940145, 0, 1, 0.5568628, 1,
-0.16167, -1.865908, -1.990038, 0, 1, 0.5607843, 1,
-0.157257, -1.170495, -4.087209, 0, 1, 0.5686275, 1,
-0.1494511, -0.7949771, -4.247955, 0, 1, 0.572549, 1,
-0.1417877, 1.163665, 0.1522601, 0, 1, 0.5803922, 1,
-0.1408238, 1.337207, -0.7557057, 0, 1, 0.5843138, 1,
-0.1387953, -1.556864, -3.768448, 0, 1, 0.5921569, 1,
-0.1384157, 0.2591741, 0.2736459, 0, 1, 0.5960785, 1,
-0.1372732, 0.3083415, -1.177636, 0, 1, 0.6039216, 1,
-0.1354117, 1.05215, -1.80669, 0, 1, 0.6117647, 1,
-0.1348893, 1.754932, -0.3628395, 0, 1, 0.6156863, 1,
-0.131234, 1.64465, 0.1618523, 0, 1, 0.6235294, 1,
-0.1311141, -0.5254637, -2.258382, 0, 1, 0.627451, 1,
-0.1303412, -0.6162946, -3.876646, 0, 1, 0.6352941, 1,
-0.1288842, -1.453085, -1.667938, 0, 1, 0.6392157, 1,
-0.1287437, -0.5942419, -2.749145, 0, 1, 0.6470588, 1,
-0.1049966, 0.7392911, -0.1098425, 0, 1, 0.6509804, 1,
-0.1026201, -0.1084321, -2.528203, 0, 1, 0.6588235, 1,
-0.09742528, -1.05929, -2.507868, 0, 1, 0.6627451, 1,
-0.08807587, -0.7910941, -3.363372, 0, 1, 0.6705883, 1,
-0.07370132, -1.138107, -3.764835, 0, 1, 0.6745098, 1,
-0.05608417, -1.087251, -3.514739, 0, 1, 0.682353, 1,
-0.04794914, 0.766932, 0.6572852, 0, 1, 0.6862745, 1,
-0.03941574, 0.8089151, 1.843239, 0, 1, 0.6941177, 1,
-0.03813543, -0.9492781, -2.361339, 0, 1, 0.7019608, 1,
-0.03751518, 0.5381453, -3.475202, 0, 1, 0.7058824, 1,
-0.03748511, 1.22651, -0.5875947, 0, 1, 0.7137255, 1,
-0.03496607, 0.0758405, -1.848471, 0, 1, 0.7176471, 1,
-0.02797731, 2.004246, -0.8130962, 0, 1, 0.7254902, 1,
-0.02690748, 0.6155906, -0.2151847, 0, 1, 0.7294118, 1,
-0.02668422, -0.1395764, -3.716749, 0, 1, 0.7372549, 1,
-0.02250253, -0.1106946, -2.514887, 0, 1, 0.7411765, 1,
-0.01807369, 0.4343506, -0.231257, 0, 1, 0.7490196, 1,
-0.01708132, 1.795338, -1.507803, 0, 1, 0.7529412, 1,
-0.01162468, 0.298309, -0.5566667, 0, 1, 0.7607843, 1,
-0.01059767, 0.4276611, 0.2016046, 0, 1, 0.7647059, 1,
-0.01058342, 1.501015, 0.4970129, 0, 1, 0.772549, 1,
-0.009377864, -0.4888406, -3.24554, 0, 1, 0.7764706, 1,
-0.00738324, -0.556124, -1.897264, 0, 1, 0.7843137, 1,
-0.006828903, 0.7937139, -0.5359198, 0, 1, 0.7882353, 1,
-0.002756358, -1.257661, -4.216199, 0, 1, 0.7960784, 1,
-0.0025595, 0.6670899, 1.045474, 0, 1, 0.8039216, 1,
-0.001986505, 0.03630498, -0.501638, 0, 1, 0.8078431, 1,
0.008387028, -0.7380484, 3.342299, 0, 1, 0.8156863, 1,
0.009370756, -0.06458304, 2.92158, 0, 1, 0.8196079, 1,
0.01118391, 0.297283, 0.2615224, 0, 1, 0.827451, 1,
0.01499205, -1.372966, 2.598456, 0, 1, 0.8313726, 1,
0.01521335, 0.002163543, 0.9723458, 0, 1, 0.8392157, 1,
0.01745008, -0.1310102, 2.985452, 0, 1, 0.8431373, 1,
0.01857095, 1.207783, -0.1546987, 0, 1, 0.8509804, 1,
0.02019709, 0.4157, 1.753592, 0, 1, 0.854902, 1,
0.02113657, -1.195694, 3.474998, 0, 1, 0.8627451, 1,
0.0213145, -1.111838, 0.5764386, 0, 1, 0.8666667, 1,
0.02200351, 0.4079096, -0.7579123, 0, 1, 0.8745098, 1,
0.03080199, -0.09075725, 2.620022, 0, 1, 0.8784314, 1,
0.03220845, -0.6017874, 3.775936, 0, 1, 0.8862745, 1,
0.03260171, -0.4697537, 3.403623, 0, 1, 0.8901961, 1,
0.03275979, 1.197755, -1.148845, 0, 1, 0.8980392, 1,
0.03396252, 2.518243, 0.7558144, 0, 1, 0.9058824, 1,
0.03644544, 0.5713837, 0.5889024, 0, 1, 0.9098039, 1,
0.04127894, -0.4757166, 2.624431, 0, 1, 0.9176471, 1,
0.04400301, -0.07404421, 2.872579, 0, 1, 0.9215686, 1,
0.04644113, 1.542871, -1.647579, 0, 1, 0.9294118, 1,
0.04681323, 0.6194547, -1.063059, 0, 1, 0.9333333, 1,
0.05249503, -0.9671775, 3.574076, 0, 1, 0.9411765, 1,
0.05273611, -0.7599089, 3.677195, 0, 1, 0.945098, 1,
0.05313199, -1.822154, 3.941791, 0, 1, 0.9529412, 1,
0.05559893, 1.057476, 0.02975481, 0, 1, 0.9568627, 1,
0.05734671, 0.2784497, 0.5293535, 0, 1, 0.9647059, 1,
0.06037551, 0.2548285, -0.06781298, 0, 1, 0.9686275, 1,
0.06256333, 0.739009, -0.4255036, 0, 1, 0.9764706, 1,
0.06400666, 0.7547939, -0.4373804, 0, 1, 0.9803922, 1,
0.06405339, 1.565253, -1.269931, 0, 1, 0.9882353, 1,
0.0645781, 1.40983, -0.4474158, 0, 1, 0.9921569, 1,
0.06467862, 1.784313, -1.149079, 0, 1, 1, 1,
0.06695242, -0.504614, 3.104201, 0, 0.9921569, 1, 1,
0.06717318, 1.523964, 0.1320778, 0, 0.9882353, 1, 1,
0.06792533, 1.062089, -0.3835894, 0, 0.9803922, 1, 1,
0.06854645, 0.3655991, 1.597224, 0, 0.9764706, 1, 1,
0.06907856, -0.5182024, 2.172048, 0, 0.9686275, 1, 1,
0.07238463, -0.7162178, 5.078805, 0, 0.9647059, 1, 1,
0.07656381, 0.06295065, 0.3586509, 0, 0.9568627, 1, 1,
0.07748932, 0.7803842, 0.0002688704, 0, 0.9529412, 1, 1,
0.08325326, -0.602913, 1.35421, 0, 0.945098, 1, 1,
0.08512858, 0.394552, -1.510976, 0, 0.9411765, 1, 1,
0.08666449, 1.240984, 0.5894551, 0, 0.9333333, 1, 1,
0.09309357, -0.3892919, 1.369176, 0, 0.9294118, 1, 1,
0.09424771, 0.257023, 0.6885625, 0, 0.9215686, 1, 1,
0.09653341, -2.592373, 3.981537, 0, 0.9176471, 1, 1,
0.09735049, -0.7770528, 3.653945, 0, 0.9098039, 1, 1,
0.09987078, 0.2933613, 1.298181, 0, 0.9058824, 1, 1,
0.1003171, 1.52826, -0.9291148, 0, 0.8980392, 1, 1,
0.1005685, -2.250661, 2.605558, 0, 0.8901961, 1, 1,
0.1043752, -0.05090069, 1.488861, 0, 0.8862745, 1, 1,
0.112746, -0.752731, 5.210655, 0, 0.8784314, 1, 1,
0.114292, 2.366636, -0.9881811, 0, 0.8745098, 1, 1,
0.1212003, -0.4987938, 4.754442, 0, 0.8666667, 1, 1,
0.1216353, -1.314463, 2.994595, 0, 0.8627451, 1, 1,
0.1240974, 1.079576, 0.3542468, 0, 0.854902, 1, 1,
0.1242999, -0.619597, 2.034816, 0, 0.8509804, 1, 1,
0.1275338, 0.8195097, -0.3720363, 0, 0.8431373, 1, 1,
0.128309, 0.04188876, 2.283086, 0, 0.8392157, 1, 1,
0.1288619, -0.4371949, 3.140039, 0, 0.8313726, 1, 1,
0.1294623, 0.72484, 0.7300073, 0, 0.827451, 1, 1,
0.1316314, 0.4656476, -0.9081127, 0, 0.8196079, 1, 1,
0.1325374, -1.209216, 2.085985, 0, 0.8156863, 1, 1,
0.1473153, -2.072972, 4.930269, 0, 0.8078431, 1, 1,
0.1480739, 0.4225535, 0.0625947, 0, 0.8039216, 1, 1,
0.1519742, -1.607629, 3.323929, 0, 0.7960784, 1, 1,
0.159868, -0.1376664, 0.7409081, 0, 0.7882353, 1, 1,
0.162086, 0.01881382, 1.073943, 0, 0.7843137, 1, 1,
0.1631376, -0.8477072, 1.906774, 0, 0.7764706, 1, 1,
0.1646946, -0.01411408, 1.557175, 0, 0.772549, 1, 1,
0.1707444, -2.571077, 2.80919, 0, 0.7647059, 1, 1,
0.1762701, 1.016753, -0.5605528, 0, 0.7607843, 1, 1,
0.1886915, -0.7910669, 1.352066, 0, 0.7529412, 1, 1,
0.1929682, 1.438199, -0.4565212, 0, 0.7490196, 1, 1,
0.1955749, 0.7948212, -0.1686901, 0, 0.7411765, 1, 1,
0.2009906, 0.8249039, 0.2367558, 0, 0.7372549, 1, 1,
0.2017948, -0.8213285, 2.530467, 0, 0.7294118, 1, 1,
0.2065485, -0.414563, 2.49396, 0, 0.7254902, 1, 1,
0.2127225, -0.8195094, 2.652023, 0, 0.7176471, 1, 1,
0.2127921, -0.07535625, 1.047639, 0, 0.7137255, 1, 1,
0.2147354, 1.618788, 0.2979889, 0, 0.7058824, 1, 1,
0.2150155, -1.528413, 2.360488, 0, 0.6980392, 1, 1,
0.2152714, 0.3999861, 0.5620559, 0, 0.6941177, 1, 1,
0.2159329, 0.4829867, 0.09427268, 0, 0.6862745, 1, 1,
0.2211978, -1.038097, 2.156056, 0, 0.682353, 1, 1,
0.2222491, 0.6157846, 0.8120279, 0, 0.6745098, 1, 1,
0.231791, -0.710373, 2.086079, 0, 0.6705883, 1, 1,
0.2350184, 0.09717201, 0.5002879, 0, 0.6627451, 1, 1,
0.2351268, 0.1995298, 1.590504, 0, 0.6588235, 1, 1,
0.2382941, 1.656622, 0.4351354, 0, 0.6509804, 1, 1,
0.2408017, -0.5823351, 2.541918, 0, 0.6470588, 1, 1,
0.2461108, -0.5615792, 2.579138, 0, 0.6392157, 1, 1,
0.2466183, 1.042361, -0.2341601, 0, 0.6352941, 1, 1,
0.2468704, 0.08052526, 0.142433, 0, 0.627451, 1, 1,
0.2478665, 1.400614, 1.015884, 0, 0.6235294, 1, 1,
0.2479883, 1.235724, -1.470036, 0, 0.6156863, 1, 1,
0.248597, 0.8668424, -1.258378, 0, 0.6117647, 1, 1,
0.251543, 0.2578594, 0.278827, 0, 0.6039216, 1, 1,
0.2533664, 0.9702752, 0.6065476, 0, 0.5960785, 1, 1,
0.2537666, -0.8204955, 2.814801, 0, 0.5921569, 1, 1,
0.2549688, 1.866844, -1.410196, 0, 0.5843138, 1, 1,
0.2558663, 0.3160582, 2.9149, 0, 0.5803922, 1, 1,
0.2558754, -1.155519, 3.626107, 0, 0.572549, 1, 1,
0.2576681, -0.4845836, 2.353144, 0, 0.5686275, 1, 1,
0.2583546, -0.4671087, 2.58093, 0, 0.5607843, 1, 1,
0.2626024, -0.4323364, 2.664222, 0, 0.5568628, 1, 1,
0.265508, -0.1878966, 3.379619, 0, 0.5490196, 1, 1,
0.266597, -0.8410937, 2.601536, 0, 0.5450981, 1, 1,
0.2723056, -1.124916, 2.881316, 0, 0.5372549, 1, 1,
0.2740013, 1.559014, 1.5091, 0, 0.5333334, 1, 1,
0.2786507, 0.07029767, 1.547225, 0, 0.5254902, 1, 1,
0.2786621, 0.5609819, -0.3916056, 0, 0.5215687, 1, 1,
0.2788495, -2.367125, 2.259883, 0, 0.5137255, 1, 1,
0.2827648, -0.4908857, 2.959168, 0, 0.509804, 1, 1,
0.2832813, -0.1260944, 1.472901, 0, 0.5019608, 1, 1,
0.283798, -0.2560718, 1.159049, 0, 0.4941176, 1, 1,
0.2843991, 0.3072499, 1.120303, 0, 0.4901961, 1, 1,
0.2845541, -0.7716786, 3.513963, 0, 0.4823529, 1, 1,
0.2868192, 0.16361, 0.03819603, 0, 0.4784314, 1, 1,
0.2873649, 0.5828106, 0.0571877, 0, 0.4705882, 1, 1,
0.289121, -0.9515731, 3.870919, 0, 0.4666667, 1, 1,
0.2929348, -0.1681905, 3.981588, 0, 0.4588235, 1, 1,
0.2993536, -0.3000247, 1.516989, 0, 0.454902, 1, 1,
0.3004194, -0.7742192, 2.654925, 0, 0.4470588, 1, 1,
0.3015385, 0.2183444, 1.591027, 0, 0.4431373, 1, 1,
0.3071168, -0.8584392, 1.14068, 0, 0.4352941, 1, 1,
0.3074613, -0.190543, 0.2555945, 0, 0.4313726, 1, 1,
0.3087837, -0.5481653, 0.6336421, 0, 0.4235294, 1, 1,
0.3116229, -0.4211047, 2.015214, 0, 0.4196078, 1, 1,
0.3154188, 0.467496, -0.328592, 0, 0.4117647, 1, 1,
0.3156177, 2.206548, -0.528824, 0, 0.4078431, 1, 1,
0.3168687, -0.1102872, 2.267015, 0, 0.4, 1, 1,
0.316947, -0.004996159, 2.002658, 0, 0.3921569, 1, 1,
0.3196687, 2.948677, -0.1493702, 0, 0.3882353, 1, 1,
0.3259018, -0.09546915, 0.6019184, 0, 0.3803922, 1, 1,
0.3273549, 0.06321701, -0.7626386, 0, 0.3764706, 1, 1,
0.3323089, 1.49536, -0.07455154, 0, 0.3686275, 1, 1,
0.3325768, 0.3941128, 0.7264261, 0, 0.3647059, 1, 1,
0.336381, -0.3564272, 1.904594, 0, 0.3568628, 1, 1,
0.3390098, 1.293422, -0.9091005, 0, 0.3529412, 1, 1,
0.3432862, 1.198243, 1.472289, 0, 0.345098, 1, 1,
0.3515936, -1.012034, 1.948456, 0, 0.3411765, 1, 1,
0.3525086, 1.996207, 0.6845262, 0, 0.3333333, 1, 1,
0.3525907, 0.580204, 0.9950862, 0, 0.3294118, 1, 1,
0.3549287, -0.1929571, 0.5512375, 0, 0.3215686, 1, 1,
0.3549292, 0.1292746, 0.8713142, 0, 0.3176471, 1, 1,
0.356508, 1.575966, -0.6000752, 0, 0.3098039, 1, 1,
0.3565944, 0.4069609, 0.8104361, 0, 0.3058824, 1, 1,
0.3571341, 0.183841, 0.3655906, 0, 0.2980392, 1, 1,
0.3574422, -0.2920346, 2.16444, 0, 0.2901961, 1, 1,
0.3645145, -0.4808399, 4.383584, 0, 0.2862745, 1, 1,
0.3657374, 1.229198, 1.18118, 0, 0.2784314, 1, 1,
0.3685064, -0.2564818, 4.959071, 0, 0.2745098, 1, 1,
0.3765365, -0.3339378, 2.627096, 0, 0.2666667, 1, 1,
0.3824066, -0.3422489, 2.475667, 0, 0.2627451, 1, 1,
0.3828675, 1.396534, 0.006960202, 0, 0.254902, 1, 1,
0.3850077, -2.085444, 2.963134, 0, 0.2509804, 1, 1,
0.3859264, -2.322822, 4.198009, 0, 0.2431373, 1, 1,
0.3860859, 0.3665423, 0.4448428, 0, 0.2392157, 1, 1,
0.3899816, 0.0005643131, 3.314564, 0, 0.2313726, 1, 1,
0.3906367, 0.9863105, -0.5320027, 0, 0.227451, 1, 1,
0.3912979, -0.5642306, 1.785017, 0, 0.2196078, 1, 1,
0.3957303, 2.728589, 0.8049126, 0, 0.2156863, 1, 1,
0.3984092, -0.875293, 3.248284, 0, 0.2078431, 1, 1,
0.3987582, 0.6459869, 0.5240408, 0, 0.2039216, 1, 1,
0.4004998, -0.4385931, 2.028619, 0, 0.1960784, 1, 1,
0.4029543, -0.9755854, 1.430679, 0, 0.1882353, 1, 1,
0.4030049, 0.4737925, -0.2062749, 0, 0.1843137, 1, 1,
0.4048908, 1.587271, 1.158628, 0, 0.1764706, 1, 1,
0.4057567, -0.2182689, 1.268421, 0, 0.172549, 1, 1,
0.4067757, -0.3538585, 3.226985, 0, 0.1647059, 1, 1,
0.4091104, 0.09868053, 0.04404175, 0, 0.1607843, 1, 1,
0.4118604, 0.9025338, 1.598401, 0, 0.1529412, 1, 1,
0.4129476, 0.299559, 1.452037, 0, 0.1490196, 1, 1,
0.4186454, 1.058812, 0.8953186, 0, 0.1411765, 1, 1,
0.4199644, 1.949541, 1.175013, 0, 0.1372549, 1, 1,
0.4217472, 0.3016933, 1.869872, 0, 0.1294118, 1, 1,
0.4249126, -0.05375102, 1.395874, 0, 0.1254902, 1, 1,
0.4254721, -0.3514161, 2.099472, 0, 0.1176471, 1, 1,
0.425581, 1.350606, -0.1605398, 0, 0.1137255, 1, 1,
0.4372489, 0.1463472, 0.9475779, 0, 0.1058824, 1, 1,
0.440887, -2.910365, 1.750257, 0, 0.09803922, 1, 1,
0.4424058, -1.44488, 2.913502, 0, 0.09411765, 1, 1,
0.4468871, 0.5206891, 0.3983859, 0, 0.08627451, 1, 1,
0.4481299, -0.5659692, -0.1123873, 0, 0.08235294, 1, 1,
0.451096, 0.9001322, -0.1337535, 0, 0.07450981, 1, 1,
0.4556135, 0.7379299, 0.3255307, 0, 0.07058824, 1, 1,
0.4562468, 0.5696762, 1.727092, 0, 0.0627451, 1, 1,
0.4569609, 0.870622, -0.4776247, 0, 0.05882353, 1, 1,
0.4575131, -0.2693908, 0.460153, 0, 0.05098039, 1, 1,
0.4588225, -0.7587619, 1.509554, 0, 0.04705882, 1, 1,
0.4673349, 1.179055, -0.3101504, 0, 0.03921569, 1, 1,
0.4683091, 1.560957, 0.02792718, 0, 0.03529412, 1, 1,
0.4684724, -0.7602804, 2.141303, 0, 0.02745098, 1, 1,
0.4701303, -2.612682, 3.262666, 0, 0.02352941, 1, 1,
0.4719548, -0.8338276, 0.02377445, 0, 0.01568628, 1, 1,
0.4746316, -0.9785302, 0.6639984, 0, 0.01176471, 1, 1,
0.4747378, 0.6794686, 0.5762329, 0, 0.003921569, 1, 1,
0.4765114, -0.5139911, 2.798342, 0.003921569, 0, 1, 1,
0.4765502, -1.267152, 3.48625, 0.007843138, 0, 1, 1,
0.4772978, 0.5304578, -0.06519908, 0.01568628, 0, 1, 1,
0.4784981, -0.486304, 2.011778, 0.01960784, 0, 1, 1,
0.4795255, 1.131452, -0.5998774, 0.02745098, 0, 1, 1,
0.4795261, 0.2218027, 0.2943618, 0.03137255, 0, 1, 1,
0.4828002, 0.6682977, 1.757114, 0.03921569, 0, 1, 1,
0.4838147, -0.1127212, 4.504568, 0.04313726, 0, 1, 1,
0.4883702, -0.406913, 0.2688253, 0.05098039, 0, 1, 1,
0.4889654, -1.464104, 2.011827, 0.05490196, 0, 1, 1,
0.4891823, 0.4538707, 2.023571, 0.0627451, 0, 1, 1,
0.4899104, 1.275323, 2.442196, 0.06666667, 0, 1, 1,
0.490036, -0.007888241, 0.4270962, 0.07450981, 0, 1, 1,
0.4937427, -2.06822, 3.564103, 0.07843138, 0, 1, 1,
0.4940766, -0.6104705, 3.72477, 0.08627451, 0, 1, 1,
0.4953077, -0.1064511, -0.2587221, 0.09019608, 0, 1, 1,
0.4960878, 1.623029, 2.558634, 0.09803922, 0, 1, 1,
0.4965318, 1.115038, -0.6344332, 0.1058824, 0, 1, 1,
0.4981407, -1.081365, 1.393672, 0.1098039, 0, 1, 1,
0.5003214, -0.9709716, 1.838056, 0.1176471, 0, 1, 1,
0.503288, -0.510341, 1.738263, 0.1215686, 0, 1, 1,
0.5060271, 0.4621402, -0.6795107, 0.1294118, 0, 1, 1,
0.5065875, 0.2527016, -0.6616152, 0.1333333, 0, 1, 1,
0.5072961, 0.6666847, 1.027574, 0.1411765, 0, 1, 1,
0.5078633, 1.77251, 1.257466, 0.145098, 0, 1, 1,
0.5082507, 0.836365, 0.7635858, 0.1529412, 0, 1, 1,
0.5084683, 1.4099, -0.5030144, 0.1568628, 0, 1, 1,
0.5110667, -2.164358, 3.100093, 0.1647059, 0, 1, 1,
0.5149757, 0.8968428, -1.294589, 0.1686275, 0, 1, 1,
0.5159608, 0.3321696, 1.756825, 0.1764706, 0, 1, 1,
0.5166807, 0.1553674, 1.879556, 0.1803922, 0, 1, 1,
0.5185834, -0.3528266, 1.713588, 0.1882353, 0, 1, 1,
0.5197948, 0.2834398, 2.989697, 0.1921569, 0, 1, 1,
0.5230466, 0.0296315, 2.001889, 0.2, 0, 1, 1,
0.5297558, 0.3502111, 0.1113604, 0.2078431, 0, 1, 1,
0.5302519, -1.246914, 1.697712, 0.2117647, 0, 1, 1,
0.5332966, -2.813188, 2.782536, 0.2196078, 0, 1, 1,
0.5348855, 0.1485559, 0.5341155, 0.2235294, 0, 1, 1,
0.5411999, -0.1604225, 2.469704, 0.2313726, 0, 1, 1,
0.5486192, -2.060956, 3.605877, 0.2352941, 0, 1, 1,
0.5508373, 0.8124782, 1.378289, 0.2431373, 0, 1, 1,
0.5517493, 1.700689, 0.5504831, 0.2470588, 0, 1, 1,
0.5521626, 1.317919, -0.2259883, 0.254902, 0, 1, 1,
0.5561839, -0.1655425, 0.8704197, 0.2588235, 0, 1, 1,
0.5567491, -1.446166, 3.134962, 0.2666667, 0, 1, 1,
0.5574462, -1.38069, 2.493084, 0.2705882, 0, 1, 1,
0.5599393, 1.426483, 2.059585, 0.2784314, 0, 1, 1,
0.5661149, 0.673719, 0.9045292, 0.282353, 0, 1, 1,
0.5698886, 0.0395725, 2.092376, 0.2901961, 0, 1, 1,
0.5705529, -2.010415, 2.119102, 0.2941177, 0, 1, 1,
0.5745983, 0.3528819, 1.671652, 0.3019608, 0, 1, 1,
0.5764277, -1.250064, 1.771188, 0.3098039, 0, 1, 1,
0.5797508, -0.4344321, 2.550552, 0.3137255, 0, 1, 1,
0.5835917, -1.400019, 2.851191, 0.3215686, 0, 1, 1,
0.5917867, 1.012139, -0.08477648, 0.3254902, 0, 1, 1,
0.5956469, 0.4024196, 1.042562, 0.3333333, 0, 1, 1,
0.6028081, -1.654084, 5.481696, 0.3372549, 0, 1, 1,
0.6047816, 0.8999771, 0.5561146, 0.345098, 0, 1, 1,
0.6088011, -0.1064117, 3.262146, 0.3490196, 0, 1, 1,
0.6098372, -0.2987777, 1.940956, 0.3568628, 0, 1, 1,
0.6238647, -0.457036, 2.797077, 0.3607843, 0, 1, 1,
0.6270232, 0.5703015, 0.3138629, 0.3686275, 0, 1, 1,
0.6277002, -0.2565763, 2.932665, 0.372549, 0, 1, 1,
0.6282454, -0.6929751, 0.3084857, 0.3803922, 0, 1, 1,
0.6288764, 0.6537353, 1.168219, 0.3843137, 0, 1, 1,
0.6320096, 2.032923, 0.074205, 0.3921569, 0, 1, 1,
0.636126, -0.8476719, 2.471282, 0.3960784, 0, 1, 1,
0.6405903, -0.321327, 1.953441, 0.4039216, 0, 1, 1,
0.6421705, -0.5793759, 2.881152, 0.4117647, 0, 1, 1,
0.644302, -0.9981037, 3.701872, 0.4156863, 0, 1, 1,
0.645876, -0.1861729, 1.037657, 0.4235294, 0, 1, 1,
0.6494192, -0.4298697, 2.584786, 0.427451, 0, 1, 1,
0.6503056, -0.1254603, 1.875087, 0.4352941, 0, 1, 1,
0.6546584, -0.3206341, 1.771278, 0.4392157, 0, 1, 1,
0.6562523, -2.311682, 2.826303, 0.4470588, 0, 1, 1,
0.6579762, 1.850657, 0.3473959, 0.4509804, 0, 1, 1,
0.6585274, 0.7781782, -0.3516733, 0.4588235, 0, 1, 1,
0.6594673, 0.5440318, 0.130319, 0.4627451, 0, 1, 1,
0.6616932, -1.615173, 2.217925, 0.4705882, 0, 1, 1,
0.6719305, 0.03016859, 1.379877, 0.4745098, 0, 1, 1,
0.6734877, -0.04581877, 1.471711, 0.4823529, 0, 1, 1,
0.6752094, -0.6706998, 1.449253, 0.4862745, 0, 1, 1,
0.679517, -0.09041383, 2.561654, 0.4941176, 0, 1, 1,
0.6839221, 0.939321, 0.3224679, 0.5019608, 0, 1, 1,
0.6866087, 1.436908, 0.3115366, 0.5058824, 0, 1, 1,
0.6919688, 0.9573917, -0.1073451, 0.5137255, 0, 1, 1,
0.6935368, 0.917757, 1.234868, 0.5176471, 0, 1, 1,
0.7002922, 1.087445, -0.09739398, 0.5254902, 0, 1, 1,
0.7007986, -0.07804161, -0.1080111, 0.5294118, 0, 1, 1,
0.700915, 1.024114, 1.164482, 0.5372549, 0, 1, 1,
0.7053071, 0.8068878, 1.019991, 0.5411765, 0, 1, 1,
0.7129701, -0.1637664, 0.7495999, 0.5490196, 0, 1, 1,
0.7313872, 1.193008, 1.310483, 0.5529412, 0, 1, 1,
0.7356224, -1.038249, 2.593877, 0.5607843, 0, 1, 1,
0.7369646, -0.8062217, 0.6044359, 0.5647059, 0, 1, 1,
0.737896, -0.792486, 4.609757, 0.572549, 0, 1, 1,
0.7429228, 1.579605, -0.3058639, 0.5764706, 0, 1, 1,
0.7444093, -1.077891, 1.563584, 0.5843138, 0, 1, 1,
0.7535682, -0.4204114, 1.233466, 0.5882353, 0, 1, 1,
0.7657502, -1.131258, 1.989666, 0.5960785, 0, 1, 1,
0.7661577, 0.6302922, -0.26142, 0.6039216, 0, 1, 1,
0.7723137, -0.5065946, 3.139823, 0.6078432, 0, 1, 1,
0.774571, -0.8451591, 2.207119, 0.6156863, 0, 1, 1,
0.7752141, -0.8365124, 2.166149, 0.6196079, 0, 1, 1,
0.7821262, -1.050674, 3.207815, 0.627451, 0, 1, 1,
0.7854433, 1.571136, -0.4704645, 0.6313726, 0, 1, 1,
0.7963484, -0.6166946, 2.544643, 0.6392157, 0, 1, 1,
0.7999119, 1.099532, -0.1859559, 0.6431373, 0, 1, 1,
0.8030258, 1.272565, 0.3459841, 0.6509804, 0, 1, 1,
0.8051659, 0.2549732, 2.486158, 0.654902, 0, 1, 1,
0.8069379, 0.244606, 0.2834456, 0.6627451, 0, 1, 1,
0.8081059, -0.09968295, -0.2372582, 0.6666667, 0, 1, 1,
0.8243445, -0.02355968, 1.458785, 0.6745098, 0, 1, 1,
0.8296235, -0.5500346, 2.977318, 0.6784314, 0, 1, 1,
0.8352123, -1.291767, 2.452256, 0.6862745, 0, 1, 1,
0.8441802, 1.164505, 0.8916472, 0.6901961, 0, 1, 1,
0.8456748, 0.8651485, 1.633639, 0.6980392, 0, 1, 1,
0.846446, -2.028077, 2.720792, 0.7058824, 0, 1, 1,
0.852523, 0.2013471, -0.004886782, 0.7098039, 0, 1, 1,
0.8569562, -1.200646, 1.850289, 0.7176471, 0, 1, 1,
0.8590448, -0.2314971, 1.421268, 0.7215686, 0, 1, 1,
0.8670961, 1.669637, 1.025854, 0.7294118, 0, 1, 1,
0.8677204, 1.255425, 1.1768, 0.7333333, 0, 1, 1,
0.8774863, 0.904082, -0.5922419, 0.7411765, 0, 1, 1,
0.8789161, -0.03968779, 1.305177, 0.7450981, 0, 1, 1,
0.884791, -0.8977399, 3.153564, 0.7529412, 0, 1, 1,
0.8866447, 0.3243939, 0.9273461, 0.7568628, 0, 1, 1,
0.897355, -0.3519022, 2.702344, 0.7647059, 0, 1, 1,
0.9003372, 1.246285, 0.7266917, 0.7686275, 0, 1, 1,
0.9030855, -1.42632, 1.829868, 0.7764706, 0, 1, 1,
0.9047042, 0.01706748, 0.8475263, 0.7803922, 0, 1, 1,
0.9097104, 0.6986895, 0.8916393, 0.7882353, 0, 1, 1,
0.9118654, 0.3926979, 1.205379, 0.7921569, 0, 1, 1,
0.9137474, 0.2762955, 2.330851, 0.8, 0, 1, 1,
0.9158877, 1.379814, -0.7312472, 0.8078431, 0, 1, 1,
0.9186538, 0.4527562, -0.5063126, 0.8117647, 0, 1, 1,
0.9211832, -0.859424, 4.009111, 0.8196079, 0, 1, 1,
0.9267448, 1.19683, 0.433205, 0.8235294, 0, 1, 1,
0.9293623, -1.271648, 4.282123, 0.8313726, 0, 1, 1,
0.9360141, -0.821718, 1.990707, 0.8352941, 0, 1, 1,
0.9422068, 0.6085309, 2.752004, 0.8431373, 0, 1, 1,
0.9489913, -1.892201, 3.137515, 0.8470588, 0, 1, 1,
0.9502212, -0.8376915, 4.109279, 0.854902, 0, 1, 1,
0.9533611, 1.301074, 1.462301, 0.8588235, 0, 1, 1,
0.9586831, 0.8563006, 1.937001, 0.8666667, 0, 1, 1,
0.9592606, 0.9669517, -0.4832547, 0.8705882, 0, 1, 1,
0.9601598, 0.6375448, 1.337547, 0.8784314, 0, 1, 1,
0.9634104, 0.4095656, 0.4045594, 0.8823529, 0, 1, 1,
0.9655977, 0.09383895, -0.8001491, 0.8901961, 0, 1, 1,
0.9663033, 0.6382163, -0.3530185, 0.8941177, 0, 1, 1,
0.9734411, 1.447981, 0.6797251, 0.9019608, 0, 1, 1,
0.9808438, -1.256539, 1.106418, 0.9098039, 0, 1, 1,
0.9861282, -0.9321992, 2.080593, 0.9137255, 0, 1, 1,
0.9959861, -0.2002662, 1.081338, 0.9215686, 0, 1, 1,
1.000414, 1.629716, -0.912554, 0.9254902, 0, 1, 1,
1.00129, 1.124112, 1.620789, 0.9333333, 0, 1, 1,
1.004617, -0.6328963, 3.381324, 0.9372549, 0, 1, 1,
1.019961, 0.5965203, 1.922422, 0.945098, 0, 1, 1,
1.024602, 1.00234, 0.1158684, 0.9490196, 0, 1, 1,
1.028751, -0.1272915, 1.469333, 0.9568627, 0, 1, 1,
1.034511, -0.507836, 1.227919, 0.9607843, 0, 1, 1,
1.042376, 0.3115513, 2.487364, 0.9686275, 0, 1, 1,
1.045279, -0.07783267, 2.799263, 0.972549, 0, 1, 1,
1.047946, -1.366635, 0.805619, 0.9803922, 0, 1, 1,
1.053236, 1.925631, 2.491065, 0.9843137, 0, 1, 1,
1.054469, -1.777299, 3.765906, 0.9921569, 0, 1, 1,
1.05921, -0.6408367, 1.452663, 0.9960784, 0, 1, 1,
1.060584, 0.4130206, 1.669595, 1, 0, 0.9960784, 1,
1.063703, 1.146018, 1.392448, 1, 0, 0.9882353, 1,
1.070713, 0.5807133, 0.156347, 1, 0, 0.9843137, 1,
1.080909, -1.427035, 2.464533, 1, 0, 0.9764706, 1,
1.081631, -1.573204, 3.613328, 1, 0, 0.972549, 1,
1.082081, -1.233821, 2.792974, 1, 0, 0.9647059, 1,
1.084975, 1.510952, 0.5201886, 1, 0, 0.9607843, 1,
1.106651, 2.850936, -2.076679, 1, 0, 0.9529412, 1,
1.108248, 0.1505456, -1.150868, 1, 0, 0.9490196, 1,
1.113558, -1.145114, 1.020944, 1, 0, 0.9411765, 1,
1.114819, 0.4615951, 2.592499, 1, 0, 0.9372549, 1,
1.126644, -0.4024671, 1.885583, 1, 0, 0.9294118, 1,
1.127444, 1.049059, 0.7843351, 1, 0, 0.9254902, 1,
1.13227, 2.056141, 0.6484541, 1, 0, 0.9176471, 1,
1.133572, -1.828906, 3.046026, 1, 0, 0.9137255, 1,
1.138733, -0.008018434, 1.892848, 1, 0, 0.9058824, 1,
1.142562, -0.1878306, 3.919453, 1, 0, 0.9019608, 1,
1.143297, 1.351872, 0.4531478, 1, 0, 0.8941177, 1,
1.157091, -0.4418978, 2.764889, 1, 0, 0.8862745, 1,
1.158355, 0.02310612, 1.660488, 1, 0, 0.8823529, 1,
1.168657, 0.2677835, 0.5809681, 1, 0, 0.8745098, 1,
1.173908, 0.2898505, 0.6545992, 1, 0, 0.8705882, 1,
1.188826, 0.8012631, 0.620773, 1, 0, 0.8627451, 1,
1.196164, 1.341937, -0.6637503, 1, 0, 0.8588235, 1,
1.202243, 1.579639, 1.198723, 1, 0, 0.8509804, 1,
1.222737, -0.6555493, 4.107388, 1, 0, 0.8470588, 1,
1.22688, -0.6965791, 4.069326, 1, 0, 0.8392157, 1,
1.245338, -0.4300208, 3.178244, 1, 0, 0.8352941, 1,
1.247123, 1.218107, 1.85487, 1, 0, 0.827451, 1,
1.247651, 1.50872, 0.7136098, 1, 0, 0.8235294, 1,
1.249797, 1.142761, 0.04649537, 1, 0, 0.8156863, 1,
1.25439, 1.449476, 1.312056, 1, 0, 0.8117647, 1,
1.258162, 0.5351912, 0.1002865, 1, 0, 0.8039216, 1,
1.262774, -1.099555, 1.673698, 1, 0, 0.7960784, 1,
1.273484, 0.2805641, 1.363919, 1, 0, 0.7921569, 1,
1.278095, 1.988452, 0.5891829, 1, 0, 0.7843137, 1,
1.280519, 0.2434173, 2.755973, 1, 0, 0.7803922, 1,
1.281718, -0.06961003, 2.839972, 1, 0, 0.772549, 1,
1.303242, -0.896934, 1.824389, 1, 0, 0.7686275, 1,
1.306309, -0.08180694, 2.577453, 1, 0, 0.7607843, 1,
1.312562, 1.251446, 0.4906669, 1, 0, 0.7568628, 1,
1.318269, -0.3063845, 3.168132, 1, 0, 0.7490196, 1,
1.325942, 0.5992506, 2.354112, 1, 0, 0.7450981, 1,
1.326704, -0.870495, 2.934994, 1, 0, 0.7372549, 1,
1.32962, 0.846355, 1.594573, 1, 0, 0.7333333, 1,
1.334846, 1.09131, 2.173921, 1, 0, 0.7254902, 1,
1.337754, 0.6764315, 2.549219, 1, 0, 0.7215686, 1,
1.34191, -0.17483, 1.295813, 1, 0, 0.7137255, 1,
1.346237, 0.03382698, -0.2412634, 1, 0, 0.7098039, 1,
1.349475, -0.8052694, 1.53305, 1, 0, 0.7019608, 1,
1.369101, 0.5346299, 1.53355, 1, 0, 0.6941177, 1,
1.371878, -0.1408895, 2.199719, 1, 0, 0.6901961, 1,
1.374182, -0.04252643, 2.048445, 1, 0, 0.682353, 1,
1.376685, 0.1756381, 0.1388811, 1, 0, 0.6784314, 1,
1.378045, 0.9838509, -0.1209063, 1, 0, 0.6705883, 1,
1.381631, 0.8298262, 0.09313169, 1, 0, 0.6666667, 1,
1.382329, 1.133312, 1.913899, 1, 0, 0.6588235, 1,
1.383388, -0.04726548, 4.270248, 1, 0, 0.654902, 1,
1.385681, 0.4143614, 1.856451, 1, 0, 0.6470588, 1,
1.389666, 0.6470441, 0.5866218, 1, 0, 0.6431373, 1,
1.392965, 0.3790171, -0.09384649, 1, 0, 0.6352941, 1,
1.398485, -0.3076169, 0.5935417, 1, 0, 0.6313726, 1,
1.403893, -0.3131432, 2.538985, 1, 0, 0.6235294, 1,
1.418343, -0.565485, 1.298823, 1, 0, 0.6196079, 1,
1.423907, -0.4983942, 2.230089, 1, 0, 0.6117647, 1,
1.425806, 0.5613535, 1.573834, 1, 0, 0.6078432, 1,
1.432839, -0.7257856, 1.1594, 1, 0, 0.6, 1,
1.435227, 0.3783959, 1.944389, 1, 0, 0.5921569, 1,
1.43551, -1.413881, 1.496811, 1, 0, 0.5882353, 1,
1.445108, -1.04102, 3.483687, 1, 0, 0.5803922, 1,
1.445926, 0.03206613, 1.320465, 1, 0, 0.5764706, 1,
1.456115, -0.1564563, 1.696059, 1, 0, 0.5686275, 1,
1.459558, -0.4505194, 2.542318, 1, 0, 0.5647059, 1,
1.4598, -2.480633, 1.39981, 1, 0, 0.5568628, 1,
1.463033, -0.8908169, 0.8478838, 1, 0, 0.5529412, 1,
1.481684, -0.3759367, 1.696992, 1, 0, 0.5450981, 1,
1.486761, -0.7722939, 0.03885138, 1, 0, 0.5411765, 1,
1.490842, -0.7499397, 2.63619, 1, 0, 0.5333334, 1,
1.498207, -1.162003, 3.131282, 1, 0, 0.5294118, 1,
1.51179, -1.579896, 2.209435, 1, 0, 0.5215687, 1,
1.520545, 0.8650869, 0.3785137, 1, 0, 0.5176471, 1,
1.522278, -0.2870601, 1.956822, 1, 0, 0.509804, 1,
1.52229, 0.3696706, 1.228022, 1, 0, 0.5058824, 1,
1.529684, 0.1473249, 1.476587, 1, 0, 0.4980392, 1,
1.539002, -0.7813792, 1.432203, 1, 0, 0.4901961, 1,
1.548416, 0.3894763, 0.2776443, 1, 0, 0.4862745, 1,
1.549724, -1.140742, 2.587624, 1, 0, 0.4784314, 1,
1.556106, 0.3392676, 0.05741243, 1, 0, 0.4745098, 1,
1.558834, 2.5667, 0.5298809, 1, 0, 0.4666667, 1,
1.566163, 0.3025354, 0.2010633, 1, 0, 0.4627451, 1,
1.567913, -1.698354, 2.79383, 1, 0, 0.454902, 1,
1.578888, -2.251663, 2.237009, 1, 0, 0.4509804, 1,
1.578908, 2.225144, 0.08713409, 1, 0, 0.4431373, 1,
1.5816, 0.1851682, 0.4479226, 1, 0, 0.4392157, 1,
1.582657, 0.3303517, -1.027261, 1, 0, 0.4313726, 1,
1.583086, -0.03811539, 1.057677, 1, 0, 0.427451, 1,
1.585317, -1.551293, 2.741677, 1, 0, 0.4196078, 1,
1.593239, 0.3321878, 0.9485549, 1, 0, 0.4156863, 1,
1.607316, -0.8113598, 1.481641, 1, 0, 0.4078431, 1,
1.611413, 0.3782714, -0.008289049, 1, 0, 0.4039216, 1,
1.621222, -0.1090891, 3.364706, 1, 0, 0.3960784, 1,
1.624143, 0.9986411, 0.4732655, 1, 0, 0.3882353, 1,
1.62481, -0.5745895, 2.299623, 1, 0, 0.3843137, 1,
1.628474, -1.030878, 3.240028, 1, 0, 0.3764706, 1,
1.649581, 1.60243, 1.62466, 1, 0, 0.372549, 1,
1.659576, 0.4589016, 0.07965622, 1, 0, 0.3647059, 1,
1.664999, 0.7821408, 1.195545, 1, 0, 0.3607843, 1,
1.678657, 1.612089, -0.3682716, 1, 0, 0.3529412, 1,
1.683625, 0.5450309, 2.579126, 1, 0, 0.3490196, 1,
1.703067, -2.343962, 5.079491, 1, 0, 0.3411765, 1,
1.714688, 0.4293194, 3.395928, 1, 0, 0.3372549, 1,
1.715419, -0.2525139, 1.109891, 1, 0, 0.3294118, 1,
1.718037, -0.7036382, 2.258223, 1, 0, 0.3254902, 1,
1.723233, -1.658992, 3.407792, 1, 0, 0.3176471, 1,
1.730031, -0.6588318, 2.651434, 1, 0, 0.3137255, 1,
1.760046, 0.4661744, 1.714908, 1, 0, 0.3058824, 1,
1.77077, -0.8866938, 1.106818, 1, 0, 0.2980392, 1,
1.786203, -0.8905233, 2.045926, 1, 0, 0.2941177, 1,
1.79885, 0.3512513, 1.068286, 1, 0, 0.2862745, 1,
1.802774, -0.6477627, 2.357298, 1, 0, 0.282353, 1,
1.80319, -0.4362405, 1.748551, 1, 0, 0.2745098, 1,
1.807871, 0.7077444, -0.008750845, 1, 0, 0.2705882, 1,
1.810801, -0.1587852, 1.021782, 1, 0, 0.2627451, 1,
1.816592, -2.0934, 1.438321, 1, 0, 0.2588235, 1,
1.832432, -0.5761366, 2.632453, 1, 0, 0.2509804, 1,
1.858526, 2.025162, 2.390437, 1, 0, 0.2470588, 1,
1.859686, -0.6009423, 2.706105, 1, 0, 0.2392157, 1,
1.864276, 0.5758464, 2.050256, 1, 0, 0.2352941, 1,
1.870534, -0.5850421, 0.3469953, 1, 0, 0.227451, 1,
1.875971, 2.852803, -0.2604232, 1, 0, 0.2235294, 1,
1.876355, -2.440174, 1.368092, 1, 0, 0.2156863, 1,
1.877605, -1.325909, 3.677315, 1, 0, 0.2117647, 1,
1.881983, 1.497726, 1.319568, 1, 0, 0.2039216, 1,
1.883928, -0.6214897, 0.9627581, 1, 0, 0.1960784, 1,
1.886144, 0.4620668, 1.737451, 1, 0, 0.1921569, 1,
1.8924, -0.9450575, 2.137727, 1, 0, 0.1843137, 1,
1.895294, -1.105983, 1.890489, 1, 0, 0.1803922, 1,
1.896964, -0.57896, 3.278751, 1, 0, 0.172549, 1,
1.902091, -0.1584805, 1.123854, 1, 0, 0.1686275, 1,
1.902234, 0.1195743, 2.350884, 1, 0, 0.1607843, 1,
1.910152, -0.5718105, 3.687749, 1, 0, 0.1568628, 1,
1.917434, -1.813031, 1.825086, 1, 0, 0.1490196, 1,
1.918125, -0.1508181, 3.786188, 1, 0, 0.145098, 1,
1.920921, 0.6429371, 2.218641, 1, 0, 0.1372549, 1,
1.980459, 0.8105785, 1.359559, 1, 0, 0.1333333, 1,
1.987659, 1.233868, 0.7499749, 1, 0, 0.1254902, 1,
1.993739, -0.8220181, 1.509876, 1, 0, 0.1215686, 1,
2.000683, 1.050059, 2.214594, 1, 0, 0.1137255, 1,
2.099048, 1.006589, -0.2322031, 1, 0, 0.1098039, 1,
2.124715, 0.9585001, 2.61272, 1, 0, 0.1019608, 1,
2.125552, 3.030581, 0.7884285, 1, 0, 0.09411765, 1,
2.127337, -0.1004057, 0.4051008, 1, 0, 0.09019608, 1,
2.128385, 0.05586537, 2.010137, 1, 0, 0.08235294, 1,
2.20776, -1.021606, 2.66747, 1, 0, 0.07843138, 1,
2.257628, -1.113257, 2.765148, 1, 0, 0.07058824, 1,
2.283951, 0.2342245, 2.388029, 1, 0, 0.06666667, 1,
2.324801, -0.6905209, 1.871231, 1, 0, 0.05882353, 1,
2.325041, -1.038796, 1.296376, 1, 0, 0.05490196, 1,
2.35279, 0.01934687, 2.318978, 1, 0, 0.04705882, 1,
2.466995, 1.041098, 0.3339089, 1, 0, 0.04313726, 1,
2.472922, 1.036012, -0.3066299, 1, 0, 0.03529412, 1,
2.612096, 0.2548743, 1.140592, 1, 0, 0.03137255, 1,
2.722098, -1.592947, 0.8860596, 1, 0, 0.02352941, 1,
2.780467, 0.4859632, 0.8154005, 1, 0, 0.01960784, 1,
2.880732, 1.536333, 1.896996, 1, 0, 0.01176471, 1,
3.338403, -1.705698, 1.355429, 1, 0, 0.007843138, 1
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
-0.302519, -3.917356, -6.545001, 0, -0.5, 0.5, 0.5,
-0.302519, -3.917356, -6.545001, 1, -0.5, 0.5, 0.5,
-0.302519, -3.917356, -6.545001, 1, 1.5, 0.5, 0.5,
-0.302519, -3.917356, -6.545001, 0, 1.5, 0.5, 0.5
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
-5.177713, 0.06010795, -6.545001, 0, -0.5, 0.5, 0.5,
-5.177713, 0.06010795, -6.545001, 1, -0.5, 0.5, 0.5,
-5.177713, 0.06010795, -6.545001, 1, 1.5, 0.5, 0.5,
-5.177713, 0.06010795, -6.545001, 0, 1.5, 0.5, 0.5
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
-5.177713, -3.917356, 0.3398843, 0, -0.5, 0.5, 0.5,
-5.177713, -3.917356, 0.3398843, 1, -0.5, 0.5, 0.5,
-5.177713, -3.917356, 0.3398843, 1, 1.5, 0.5, 0.5,
-5.177713, -3.917356, 0.3398843, 0, 1.5, 0.5, 0.5
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
-2, -2.999479, -4.956182,
2, -2.999479, -4.956182,
-2, -2.999479, -4.956182,
-2, -3.152459, -5.220985,
0, -2.999479, -4.956182,
0, -3.152459, -5.220985,
2, -2.999479, -4.956182,
2, -3.152459, -5.220985
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
-2, -3.458417, -5.750591, 0, -0.5, 0.5, 0.5,
-2, -3.458417, -5.750591, 1, -0.5, 0.5, 0.5,
-2, -3.458417, -5.750591, 1, 1.5, 0.5, 0.5,
-2, -3.458417, -5.750591, 0, 1.5, 0.5, 0.5,
0, -3.458417, -5.750591, 0, -0.5, 0.5, 0.5,
0, -3.458417, -5.750591, 1, -0.5, 0.5, 0.5,
0, -3.458417, -5.750591, 1, 1.5, 0.5, 0.5,
0, -3.458417, -5.750591, 0, 1.5, 0.5, 0.5,
2, -3.458417, -5.750591, 0, -0.5, 0.5, 0.5,
2, -3.458417, -5.750591, 1, -0.5, 0.5, 0.5,
2, -3.458417, -5.750591, 1, 1.5, 0.5, 0.5,
2, -3.458417, -5.750591, 0, 1.5, 0.5, 0.5
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
-4.052668, -2, -4.956182,
-4.052668, 3, -4.956182,
-4.052668, -2, -4.956182,
-4.240176, -2, -5.220985,
-4.052668, -1, -4.956182,
-4.240176, -1, -5.220985,
-4.052668, 0, -4.956182,
-4.240176, 0, -5.220985,
-4.052668, 1, -4.956182,
-4.240176, 1, -5.220985,
-4.052668, 2, -4.956182,
-4.240176, 2, -5.220985,
-4.052668, 3, -4.956182,
-4.240176, 3, -5.220985
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
-4.615191, -2, -5.750591, 0, -0.5, 0.5, 0.5,
-4.615191, -2, -5.750591, 1, -0.5, 0.5, 0.5,
-4.615191, -2, -5.750591, 1, 1.5, 0.5, 0.5,
-4.615191, -2, -5.750591, 0, 1.5, 0.5, 0.5,
-4.615191, -1, -5.750591, 0, -0.5, 0.5, 0.5,
-4.615191, -1, -5.750591, 1, -0.5, 0.5, 0.5,
-4.615191, -1, -5.750591, 1, 1.5, 0.5, 0.5,
-4.615191, -1, -5.750591, 0, 1.5, 0.5, 0.5,
-4.615191, 0, -5.750591, 0, -0.5, 0.5, 0.5,
-4.615191, 0, -5.750591, 1, -0.5, 0.5, 0.5,
-4.615191, 0, -5.750591, 1, 1.5, 0.5, 0.5,
-4.615191, 0, -5.750591, 0, 1.5, 0.5, 0.5,
-4.615191, 1, -5.750591, 0, -0.5, 0.5, 0.5,
-4.615191, 1, -5.750591, 1, -0.5, 0.5, 0.5,
-4.615191, 1, -5.750591, 1, 1.5, 0.5, 0.5,
-4.615191, 1, -5.750591, 0, 1.5, 0.5, 0.5,
-4.615191, 2, -5.750591, 0, -0.5, 0.5, 0.5,
-4.615191, 2, -5.750591, 1, -0.5, 0.5, 0.5,
-4.615191, 2, -5.750591, 1, 1.5, 0.5, 0.5,
-4.615191, 2, -5.750591, 0, 1.5, 0.5, 0.5,
-4.615191, 3, -5.750591, 0, -0.5, 0.5, 0.5,
-4.615191, 3, -5.750591, 1, -0.5, 0.5, 0.5,
-4.615191, 3, -5.750591, 1, 1.5, 0.5, 0.5,
-4.615191, 3, -5.750591, 0, 1.5, 0.5, 0.5
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
-4.052668, -2.999479, -4,
-4.052668, -2.999479, 4,
-4.052668, -2.999479, -4,
-4.240176, -3.152459, -4,
-4.052668, -2.999479, -2,
-4.240176, -3.152459, -2,
-4.052668, -2.999479, 0,
-4.240176, -3.152459, 0,
-4.052668, -2.999479, 2,
-4.240176, -3.152459, 2,
-4.052668, -2.999479, 4,
-4.240176, -3.152459, 4
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
-4.615191, -3.458417, -4, 0, -0.5, 0.5, 0.5,
-4.615191, -3.458417, -4, 1, -0.5, 0.5, 0.5,
-4.615191, -3.458417, -4, 1, 1.5, 0.5, 0.5,
-4.615191, -3.458417, -4, 0, 1.5, 0.5, 0.5,
-4.615191, -3.458417, -2, 0, -0.5, 0.5, 0.5,
-4.615191, -3.458417, -2, 1, -0.5, 0.5, 0.5,
-4.615191, -3.458417, -2, 1, 1.5, 0.5, 0.5,
-4.615191, -3.458417, -2, 0, 1.5, 0.5, 0.5,
-4.615191, -3.458417, 0, 0, -0.5, 0.5, 0.5,
-4.615191, -3.458417, 0, 1, -0.5, 0.5, 0.5,
-4.615191, -3.458417, 0, 1, 1.5, 0.5, 0.5,
-4.615191, -3.458417, 0, 0, 1.5, 0.5, 0.5,
-4.615191, -3.458417, 2, 0, -0.5, 0.5, 0.5,
-4.615191, -3.458417, 2, 1, -0.5, 0.5, 0.5,
-4.615191, -3.458417, 2, 1, 1.5, 0.5, 0.5,
-4.615191, -3.458417, 2, 0, 1.5, 0.5, 0.5,
-4.615191, -3.458417, 4, 0, -0.5, 0.5, 0.5,
-4.615191, -3.458417, 4, 1, -0.5, 0.5, 0.5,
-4.615191, -3.458417, 4, 1, 1.5, 0.5, 0.5,
-4.615191, -3.458417, 4, 0, 1.5, 0.5, 0.5
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
-4.052668, -2.999479, -4.956182,
-4.052668, 3.119695, -4.956182,
-4.052668, -2.999479, 5.63595,
-4.052668, 3.119695, 5.63595,
-4.052668, -2.999479, -4.956182,
-4.052668, -2.999479, 5.63595,
-4.052668, 3.119695, -4.956182,
-4.052668, 3.119695, 5.63595,
-4.052668, -2.999479, -4.956182,
3.44763, -2.999479, -4.956182,
-4.052668, -2.999479, 5.63595,
3.44763, -2.999479, 5.63595,
-4.052668, 3.119695, -4.956182,
3.44763, 3.119695, -4.956182,
-4.052668, 3.119695, 5.63595,
3.44763, 3.119695, 5.63595,
3.44763, -2.999479, -4.956182,
3.44763, 3.119695, -4.956182,
3.44763, -2.999479, 5.63595,
3.44763, 3.119695, 5.63595,
3.44763, -2.999479, -4.956182,
3.44763, -2.999479, 5.63595,
3.44763, 3.119695, -4.956182,
3.44763, 3.119695, 5.63595
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
var radius = 7.662054;
var distance = 34.08934;
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
mvMatrix.translate( 0.302519, -0.06010795, -0.3398843 );
mvMatrix.scale( 1.104538, 1.353837, 0.7821243 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.08934);
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
diallate<-read.table("diallate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diallate$V2
```

```
## Error in eval(expr, envir, enclos): object 'diallate' not found
```

```r
y<-diallate$V3
```

```
## Error in eval(expr, envir, enclos): object 'diallate' not found
```

```r
z<-diallate$V4
```

```
## Error in eval(expr, envir, enclos): object 'diallate' not found
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
-3.94344, 1.673234, -0.1420638, 0, 0, 1, 1, 1,
-3.13942, 1.859768, -2.613766, 1, 0, 0, 1, 1,
-2.710098, 0.3891095, -0.8692961, 1, 0, 0, 1, 1,
-2.677418, 1.478585, 0.6770426, 1, 0, 0, 1, 1,
-2.659104, 0.2357192, -1.373181, 1, 0, 0, 1, 1,
-2.61822, -1.225002, -2.149534, 1, 0, 0, 1, 1,
-2.572254, -1.318147, -0.6791431, 0, 0, 0, 1, 1,
-2.557411, -0.2110675, -1.666534, 0, 0, 0, 1, 1,
-2.536224, -0.7116928, -0.7239966, 0, 0, 0, 1, 1,
-2.5217, -1.902955, -2.498853, 0, 0, 0, 1, 1,
-2.517432, 0.3836882, -0.9294319, 0, 0, 0, 1, 1,
-2.517398, 1.242513, -1.11206, 0, 0, 0, 1, 1,
-2.268013, -0.08569641, -0.1365334, 0, 0, 0, 1, 1,
-2.249356, -0.8452395, -3.182991, 1, 1, 1, 1, 1,
-2.184109, -2.222726, -2.225324, 1, 1, 1, 1, 1,
-2.132775, -1.524015, -2.386637, 1, 1, 1, 1, 1,
-2.124153, -0.01495693, -1.608081, 1, 1, 1, 1, 1,
-2.11938, 0.9325398, -1.586703, 1, 1, 1, 1, 1,
-2.045127, -1.277366, -4.186986, 1, 1, 1, 1, 1,
-2.041723, -1.526924, -2.17253, 1, 1, 1, 1, 1,
-2.019521, -0.9506803, 0.1413121, 1, 1, 1, 1, 1,
-1.954795, -0.3891834, -0.8647137, 1, 1, 1, 1, 1,
-1.949529, 1.593636, -0.2335288, 1, 1, 1, 1, 1,
-1.93081, -0.5366854, -1.769952, 1, 1, 1, 1, 1,
-1.927889, 0.1026596, -1.086316, 1, 1, 1, 1, 1,
-1.922777, 0.3418494, -0.235212, 1, 1, 1, 1, 1,
-1.919995, 1.466217, -1.170759, 1, 1, 1, 1, 1,
-1.896986, -0.4793985, -1.807781, 1, 1, 1, 1, 1,
-1.866957, -0.6103787, -1.495869, 0, 0, 1, 1, 1,
-1.866264, 1.944658, -0.09577698, 1, 0, 0, 1, 1,
-1.84969, 1.678288, -1.16178, 1, 0, 0, 1, 1,
-1.820133, -1.088882, -1.811848, 1, 0, 0, 1, 1,
-1.794879, -1.458107, -2.597202, 1, 0, 0, 1, 1,
-1.78469, 1.532396, -0.03703899, 1, 0, 0, 1, 1,
-1.754783, 1.760755, -0.5813417, 0, 0, 0, 1, 1,
-1.753312, 0.9318596, -1.84486, 0, 0, 0, 1, 1,
-1.752195, -0.08855335, -2.186138, 0, 0, 0, 1, 1,
-1.742183, 0.05394156, -1.11664, 0, 0, 0, 1, 1,
-1.711378, 0.3735178, -0.2659402, 0, 0, 0, 1, 1,
-1.70882, 0.372788, -2.982757, 0, 0, 0, 1, 1,
-1.702314, -0.2598718, -2.214711, 0, 0, 0, 1, 1,
-1.68656, 1.217734, -0.3261652, 1, 1, 1, 1, 1,
-1.677379, -1.49878, -3.53284, 1, 1, 1, 1, 1,
-1.668868, 1.321532, -0.8748519, 1, 1, 1, 1, 1,
-1.668077, 0.6182773, -0.8752761, 1, 1, 1, 1, 1,
-1.66292, 0.2812749, -0.8044754, 1, 1, 1, 1, 1,
-1.659186, -0.7975093, -1.531109, 1, 1, 1, 1, 1,
-1.65876, 0.2834898, -1.229447, 1, 1, 1, 1, 1,
-1.653933, -1.247273, -4.062644, 1, 1, 1, 1, 1,
-1.653567, 2.486955, -0.3630139, 1, 1, 1, 1, 1,
-1.641027, -2.020762, -3.391983, 1, 1, 1, 1, 1,
-1.639847, -0.8455486, -1.650803, 1, 1, 1, 1, 1,
-1.620276, 0.2640892, -2.890072, 1, 1, 1, 1, 1,
-1.617626, -1.471901, -3.302024, 1, 1, 1, 1, 1,
-1.615932, 1.223042, -1.565202, 1, 1, 1, 1, 1,
-1.586427, -0.2534966, -1.720064, 1, 1, 1, 1, 1,
-1.573729, 0.3454221, -3.239981, 0, 0, 1, 1, 1,
-1.567803, -0.5665768, -1.311681, 1, 0, 0, 1, 1,
-1.567682, 1.349839, -1.000722, 1, 0, 0, 1, 1,
-1.567671, 0.214805, -3.186611, 1, 0, 0, 1, 1,
-1.554202, -0.1999265, -2.147109, 1, 0, 0, 1, 1,
-1.548029, -0.8385146, -4.058532, 1, 0, 0, 1, 1,
-1.547889, 1.224833, -1.450104, 0, 0, 0, 1, 1,
-1.542637, 2.269733, -1.736377, 0, 0, 0, 1, 1,
-1.542619, 0.7903618, -0.9012278, 0, 0, 0, 1, 1,
-1.528022, 1.532646, -0.5531378, 0, 0, 0, 1, 1,
-1.509921, 0.9051544, -2.528502, 0, 0, 0, 1, 1,
-1.502972, 0.7700124, -2.507489, 0, 0, 0, 1, 1,
-1.497494, 0.1814936, -1.990204, 0, 0, 0, 1, 1,
-1.491901, 0.8806574, -2.022857, 1, 1, 1, 1, 1,
-1.482804, -0.5048856, -0.9196205, 1, 1, 1, 1, 1,
-1.458215, 1.289018, -0.4789515, 1, 1, 1, 1, 1,
-1.437448, -0.1056488, -3.004475, 1, 1, 1, 1, 1,
-1.43642, 0.09900219, -1.241671, 1, 1, 1, 1, 1,
-1.43135, 0.8195114, -0.4958766, 1, 1, 1, 1, 1,
-1.4175, -0.9601465, -2.183603, 1, 1, 1, 1, 1,
-1.41649, -0.2987026, -1.687468, 1, 1, 1, 1, 1,
-1.413589, -0.3089419, 0.08927882, 1, 1, 1, 1, 1,
-1.411628, 1.105623, -2.026265, 1, 1, 1, 1, 1,
-1.407919, 0.1422149, -2.173732, 1, 1, 1, 1, 1,
-1.402726, 1.21836, -0.04817863, 1, 1, 1, 1, 1,
-1.39589, 1.779469, -0.2527371, 1, 1, 1, 1, 1,
-1.382977, 0.1176394, -1.448488, 1, 1, 1, 1, 1,
-1.380006, 2.340878, -1.78714, 1, 1, 1, 1, 1,
-1.373236, 0.06119925, -1.084447, 0, 0, 1, 1, 1,
-1.366671, -0.8141465, -3.985998, 1, 0, 0, 1, 1,
-1.359572, -0.5802215, -2.800479, 1, 0, 0, 1, 1,
-1.348567, -0.2298906, -3.374128, 1, 0, 0, 1, 1,
-1.348324, -0.7818082, -2.318874, 1, 0, 0, 1, 1,
-1.333667, -0.1151635, -2.098891, 1, 0, 0, 1, 1,
-1.326795, -2.774195, -3.300718, 0, 0, 0, 1, 1,
-1.325738, 1.329837, -0.1874928, 0, 0, 0, 1, 1,
-1.310683, 0.3058382, -2.292866, 0, 0, 0, 1, 1,
-1.310043, -1.861527, -1.387403, 0, 0, 0, 1, 1,
-1.299989, -1.110787, -2.402802, 0, 0, 0, 1, 1,
-1.295645, -1.583796, -1.997222, 0, 0, 0, 1, 1,
-1.275252, -2.735114, -3.976677, 0, 0, 0, 1, 1,
-1.272638, 0.1645748, -3.477794, 1, 1, 1, 1, 1,
-1.266257, -0.7617429, -3.088938, 1, 1, 1, 1, 1,
-1.255184, -0.09829139, -2.738423, 1, 1, 1, 1, 1,
-1.241088, 0.5802483, -0.9622701, 1, 1, 1, 1, 1,
-1.240537, 0.6406128, 0.5424384, 1, 1, 1, 1, 1,
-1.237907, 2.173866, -1.434377, 1, 1, 1, 1, 1,
-1.237405, 0.1053298, -1.908273, 1, 1, 1, 1, 1,
-1.233793, -0.1789857, -2.480035, 1, 1, 1, 1, 1,
-1.230394, 1.404055, -2.135142, 1, 1, 1, 1, 1,
-1.22965, -0.6484345, -0.8668225, 1, 1, 1, 1, 1,
-1.227424, -0.2413474, -2.602638, 1, 1, 1, 1, 1,
-1.226695, 0.4126622, -2.472496, 1, 1, 1, 1, 1,
-1.226626, 0.05532929, -2.978618, 1, 1, 1, 1, 1,
-1.219693, 2.063825, -0.3340873, 1, 1, 1, 1, 1,
-1.21388, 0.9207627, -0.307909, 1, 1, 1, 1, 1,
-1.208082, -1.214238, -3.031956, 0, 0, 1, 1, 1,
-1.206251, -0.7661607, -2.206534, 1, 0, 0, 1, 1,
-1.202544, 0.9750291, -1.7387, 1, 0, 0, 1, 1,
-1.201357, 0.2112586, -0.8561163, 1, 0, 0, 1, 1,
-1.187603, 1.175364, -1.501023, 1, 0, 0, 1, 1,
-1.183144, 1.471527, -1.771495, 1, 0, 0, 1, 1,
-1.182209, -0.1292971, -3.266487, 0, 0, 0, 1, 1,
-1.173005, 0.5048456, -1.550303, 0, 0, 0, 1, 1,
-1.17206, 0.8471931, -2.07809, 0, 0, 0, 1, 1,
-1.17077, -0.867385, -1.124218, 0, 0, 0, 1, 1,
-1.169742, -0.03208478, 0.04090837, 0, 0, 0, 1, 1,
-1.164141, -2.461458, -3.395723, 0, 0, 0, 1, 1,
-1.163833, 0.3580681, -2.077235, 0, 0, 0, 1, 1,
-1.163535, 0.1476986, -1.755083, 1, 1, 1, 1, 1,
-1.160909, 0.2929431, -2.243874, 1, 1, 1, 1, 1,
-1.159006, -0.2846128, -1.826398, 1, 1, 1, 1, 1,
-1.152856, -1.393563, -2.818023, 1, 1, 1, 1, 1,
-1.142896, 0.6733219, -0.4402361, 1, 1, 1, 1, 1,
-1.141108, -0.7452847, -3.974852, 1, 1, 1, 1, 1,
-1.108423, -0.4732594, -1.72078, 1, 1, 1, 1, 1,
-1.099341, -1.176765, -1.21615, 1, 1, 1, 1, 1,
-1.098783, 0.1477852, -3.332405, 1, 1, 1, 1, 1,
-1.092752, -0.395377, -0.422316, 1, 1, 1, 1, 1,
-1.088571, 0.4802508, -1.956218, 1, 1, 1, 1, 1,
-1.086786, -0.1863552, -1.367039, 1, 1, 1, 1, 1,
-1.085603, -1.057342, -2.459949, 1, 1, 1, 1, 1,
-1.070864, -1.626622, -1.623501, 1, 1, 1, 1, 1,
-1.062584, 2.367383, 0.02886031, 1, 1, 1, 1, 1,
-1.053025, 0.1524706, -0.5559089, 0, 0, 1, 1, 1,
-1.048537, -0.1698973, -2.742804, 1, 0, 0, 1, 1,
-1.033547, 2.006669, -0.5251049, 1, 0, 0, 1, 1,
-1.032263, -1.419848, -2.786001, 1, 0, 0, 1, 1,
-1.030939, 1.41281, -0.3258077, 1, 0, 0, 1, 1,
-1.028541, 0.3362611, -1.897307, 1, 0, 0, 1, 1,
-1.021117, 0.9689859, 0.7912726, 0, 0, 0, 1, 1,
-1.017297, -0.4981432, -1.371906, 0, 0, 0, 1, 1,
-1.008213, -0.5798159, -1.517905, 0, 0, 0, 1, 1,
-1.007797, -0.5016285, -1.455011, 0, 0, 0, 1, 1,
-1.005713, -0.9632825, -1.324217, 0, 0, 0, 1, 1,
-0.9998205, 0.2838713, -1.46762, 0, 0, 0, 1, 1,
-0.99898, -0.548387, -1.531544, 0, 0, 0, 1, 1,
-0.9982965, -0.4982474, -2.352328, 1, 1, 1, 1, 1,
-0.9882169, -1.369873, -1.367355, 1, 1, 1, 1, 1,
-0.9860227, -0.1398237, -0.5987247, 1, 1, 1, 1, 1,
-0.9822152, -1.231407, -1.436765, 1, 1, 1, 1, 1,
-0.978976, -0.8705876, -3.316872, 1, 1, 1, 1, 1,
-0.9772612, 0.2760908, -2.537608, 1, 1, 1, 1, 1,
-0.9745795, -0.2874356, 0.05602994, 1, 1, 1, 1, 1,
-0.9721393, -0.8357691, -1.626536, 1, 1, 1, 1, 1,
-0.9704118, 0.2997285, -2.139133, 1, 1, 1, 1, 1,
-0.9662985, 0.9139598, -0.4602997, 1, 1, 1, 1, 1,
-0.9618409, 1.078583, -1.35444, 1, 1, 1, 1, 1,
-0.9616711, 0.4647089, -1.482692, 1, 1, 1, 1, 1,
-0.9509155, 0.3252819, -1.808154, 1, 1, 1, 1, 1,
-0.9452748, -0.7210141, -2.695322, 1, 1, 1, 1, 1,
-0.9416416, -0.4642022, -1.957913, 1, 1, 1, 1, 1,
-0.94099, 0.2533046, -2.677997, 0, 0, 1, 1, 1,
-0.9369084, 1.412652, -1.248633, 1, 0, 0, 1, 1,
-0.9315888, 0.503114, -1.90591, 1, 0, 0, 1, 1,
-0.9275239, 1.298721, 0.62333, 1, 0, 0, 1, 1,
-0.9268205, 0.5023749, -1.594971, 1, 0, 0, 1, 1,
-0.9266427, 0.0539462, 0.1332593, 1, 0, 0, 1, 1,
-0.9212276, 0.4824347, -3.099188, 0, 0, 0, 1, 1,
-0.92083, -0.01345288, -2.271559, 0, 0, 0, 1, 1,
-0.9208105, 0.5966298, 0.03916837, 0, 0, 0, 1, 1,
-0.9169545, 0.4157436, -1.049311, 0, 0, 0, 1, 1,
-0.9090192, -0.8779928, -2.872853, 0, 0, 0, 1, 1,
-0.908131, -0.8501446, -0.7638719, 0, 0, 0, 1, 1,
-0.9028449, 1.797199, 1.04626, 0, 0, 0, 1, 1,
-0.8987422, 0.5573047, 0.131295, 1, 1, 1, 1, 1,
-0.8907933, 0.4742789, -0.6663992, 1, 1, 1, 1, 1,
-0.8907394, -1.284604, -2.969218, 1, 1, 1, 1, 1,
-0.888315, 1.320628, 1.488643, 1, 1, 1, 1, 1,
-0.885415, 1.695215, -0.5175576, 1, 1, 1, 1, 1,
-0.8827368, 0.7982468, -0.6972096, 1, 1, 1, 1, 1,
-0.8791145, -0.3289685, -1.856932, 1, 1, 1, 1, 1,
-0.8789966, 0.8132339, -0.5713909, 1, 1, 1, 1, 1,
-0.8778207, 1.300543, -1.791917, 1, 1, 1, 1, 1,
-0.8762372, -0.4286355, -3.021969, 1, 1, 1, 1, 1,
-0.8747331, -1.186244, -1.700763, 1, 1, 1, 1, 1,
-0.874418, -1.190512, -1.48536, 1, 1, 1, 1, 1,
-0.8684302, -0.2236203, -1.273602, 1, 1, 1, 1, 1,
-0.8635574, -1.121528, -4.2423, 1, 1, 1, 1, 1,
-0.8630133, -1.613892, -1.673825, 1, 1, 1, 1, 1,
-0.856638, 0.6232812, 0.2289571, 0, 0, 1, 1, 1,
-0.8550686, 0.2014144, 0.1959493, 1, 0, 0, 1, 1,
-0.8434941, 0.2681898, -2.181852, 1, 0, 0, 1, 1,
-0.8408347, 1.508275, -0.7742078, 1, 0, 0, 1, 1,
-0.8383902, -0.3542441, -3.138578, 1, 0, 0, 1, 1,
-0.8381612, 1.486511, -0.8427675, 1, 0, 0, 1, 1,
-0.8366549, 0.6520039, -0.2292683, 0, 0, 0, 1, 1,
-0.8344399, -0.6128485, -1.631467, 0, 0, 0, 1, 1,
-0.8265878, -0.07375249, -2.718135, 0, 0, 0, 1, 1,
-0.8256029, 0.6007779, -1.702725, 0, 0, 0, 1, 1,
-0.8146074, 1.217418, -1.304823, 0, 0, 0, 1, 1,
-0.8133594, 2.806443, -0.808697, 0, 0, 0, 1, 1,
-0.8102272, 1.508686, -0.2463803, 0, 0, 0, 1, 1,
-0.8095102, 2.048725, -0.1246254, 1, 1, 1, 1, 1,
-0.8051665, -0.09170239, 0.5813913, 1, 1, 1, 1, 1,
-0.8019987, -0.2651086, -2.392113, 1, 1, 1, 1, 1,
-0.7960762, 1.252017, -0.7113084, 1, 1, 1, 1, 1,
-0.7890083, 0.9873214, -0.6298687, 1, 1, 1, 1, 1,
-0.7875385, 1.615795, -1.71141, 1, 1, 1, 1, 1,
-0.7854943, 0.3923539, 0.2766595, 1, 1, 1, 1, 1,
-0.7833756, -0.006475571, -2.659795, 1, 1, 1, 1, 1,
-0.7785564, 1.011097, -2.768214, 1, 1, 1, 1, 1,
-0.7748234, -0.9950169, -2.112375, 1, 1, 1, 1, 1,
-0.7691559, -0.6652094, -1.408437, 1, 1, 1, 1, 1,
-0.7648636, 0.1462895, -1.882576, 1, 1, 1, 1, 1,
-0.7641419, 0.3420181, -0.4002811, 1, 1, 1, 1, 1,
-0.7596104, -1.490119, -1.836206, 1, 1, 1, 1, 1,
-0.7561133, 0.6174374, 0.1305403, 1, 1, 1, 1, 1,
-0.7518739, -0.6153144, -1.545111, 0, 0, 1, 1, 1,
-0.7505081, -0.514261, -1.162925, 1, 0, 0, 1, 1,
-0.7504039, 0.167443, 0.6423832, 1, 0, 0, 1, 1,
-0.7493087, -0.05223845, 0.1438052, 1, 0, 0, 1, 1,
-0.7463866, -0.111481, -0.1164466, 1, 0, 0, 1, 1,
-0.7460617, -0.7021505, -3.196321, 1, 0, 0, 1, 1,
-0.7441797, -1.322063, -2.52218, 0, 0, 0, 1, 1,
-0.7409426, 0.2701885, -0.4894423, 0, 0, 0, 1, 1,
-0.7363978, -1.197038, -2.931636, 0, 0, 0, 1, 1,
-0.7345479, -1.850446, -4.422785, 0, 0, 0, 1, 1,
-0.7278672, -0.6130393, -3.374016, 0, 0, 0, 1, 1,
-0.7256118, -1.028584, -2.044104, 0, 0, 0, 1, 1,
-0.7225246, 2.141737, 2.279411, 0, 0, 0, 1, 1,
-0.7215992, -0.7023214, -3.623446, 1, 1, 1, 1, 1,
-0.7202194, -0.800467, -3.070166, 1, 1, 1, 1, 1,
-0.7200438, -0.04314639, -2.457872, 1, 1, 1, 1, 1,
-0.7191682, -0.4682242, -1.172498, 1, 1, 1, 1, 1,
-0.7167895, -0.8890154, -1.564033, 1, 1, 1, 1, 1,
-0.7128969, -0.355831, -2.903416, 1, 1, 1, 1, 1,
-0.7111409, 0.1982372, -0.01494537, 1, 1, 1, 1, 1,
-0.7110924, -0.279052, -2.435098, 1, 1, 1, 1, 1,
-0.7103158, 1.519202, -0.2821993, 1, 1, 1, 1, 1,
-0.7078952, -1.40916, -2.141539, 1, 1, 1, 1, 1,
-0.7075912, 1.875243, -0.769978, 1, 1, 1, 1, 1,
-0.7008141, 0.5617375, -1.433389, 1, 1, 1, 1, 1,
-0.6997219, 0.04903836, -0.4297781, 1, 1, 1, 1, 1,
-0.6967213, 2.101333, -2.324242, 1, 1, 1, 1, 1,
-0.6965263, 0.06772303, -2.357193, 1, 1, 1, 1, 1,
-0.6957892, -0.9377218, -3.346361, 0, 0, 1, 1, 1,
-0.6934436, -0.7363877, -1.489331, 1, 0, 0, 1, 1,
-0.6913333, -0.8953505, -0.09170194, 1, 0, 0, 1, 1,
-0.6912774, 1.347868, -0.857441, 1, 0, 0, 1, 1,
-0.6801023, -2.25763, -2.52259, 1, 0, 0, 1, 1,
-0.6758104, -0.1750222, -1.0075, 1, 0, 0, 1, 1,
-0.6721364, -1.364585, -2.934088, 0, 0, 0, 1, 1,
-0.6719157, 0.6686099, -2.363954, 0, 0, 0, 1, 1,
-0.6685486, 2.218825, -1.555036, 0, 0, 0, 1, 1,
-0.6652643, 0.3945195, -1.105984, 0, 0, 0, 1, 1,
-0.66344, 0.3474459, -1.084012, 0, 0, 0, 1, 1,
-0.6627834, -0.2307832, -1.327598, 0, 0, 0, 1, 1,
-0.6627697, 0.0878384, -1.671688, 0, 0, 0, 1, 1,
-0.661386, 0.4413087, -1.212482, 1, 1, 1, 1, 1,
-0.6458576, -0.3566462, -3.910847, 1, 1, 1, 1, 1,
-0.6454693, -0.5523297, -3.911912, 1, 1, 1, 1, 1,
-0.6352476, 0.4952671, -1.715293, 1, 1, 1, 1, 1,
-0.6323797, -1.006541, -4.505849, 1, 1, 1, 1, 1,
-0.6298733, -1.39367, -3.702984, 1, 1, 1, 1, 1,
-0.6279832, -1.270239, -2.957263, 1, 1, 1, 1, 1,
-0.6253883, 0.859266, -1.639526, 1, 1, 1, 1, 1,
-0.6138706, 0.6513086, -0.582577, 1, 1, 1, 1, 1,
-0.6065275, 1.049511, -0.4498276, 1, 1, 1, 1, 1,
-0.6050192, -0.2809474, -3.983288, 1, 1, 1, 1, 1,
-0.6015674, -1.282752, -3.070301, 1, 1, 1, 1, 1,
-0.5978148, -0.8787283, -3.331496, 1, 1, 1, 1, 1,
-0.5958521, -0.1646388, -0.3967221, 1, 1, 1, 1, 1,
-0.594171, 0.00323465, -3.378112, 1, 1, 1, 1, 1,
-0.591731, -0.3098364, -1.645181, 0, 0, 1, 1, 1,
-0.5880286, 1.572963, -0.1078176, 1, 0, 0, 1, 1,
-0.5848009, -0.5036501, -1.374282, 1, 0, 0, 1, 1,
-0.5839484, -0.9367382, -1.906058, 1, 0, 0, 1, 1,
-0.5831656, -0.854871, -1.177586, 1, 0, 0, 1, 1,
-0.581844, 1.222243, 0.2420703, 1, 0, 0, 1, 1,
-0.5754916, -0.6524976, -3.717966, 0, 0, 0, 1, 1,
-0.5728939, -0.4472782, -4.108366, 0, 0, 0, 1, 1,
-0.572072, -0.03754332, -1.978606, 0, 0, 0, 1, 1,
-0.5691351, 1.763374, -1.485862, 0, 0, 0, 1, 1,
-0.5602575, -0.432861, -1.758888, 0, 0, 0, 1, 1,
-0.5575577, 0.3886234, -1.023829, 0, 0, 0, 1, 1,
-0.5538204, -0.0160406, -2.129532, 0, 0, 0, 1, 1,
-0.5520545, -1.001646, -2.247114, 1, 1, 1, 1, 1,
-0.5483034, 0.3045675, -0.58053, 1, 1, 1, 1, 1,
-0.5460143, 1.659207, -1.03702, 1, 1, 1, 1, 1,
-0.5453147, -0.1105587, -3.442317, 1, 1, 1, 1, 1,
-0.5373392, 0.9850592, -0.6366634, 1, 1, 1, 1, 1,
-0.5372558, 0.50093, -0.8604563, 1, 1, 1, 1, 1,
-0.5340112, 0.3313192, -1.40155, 1, 1, 1, 1, 1,
-0.5310727, 0.3845356, -0.9191624, 1, 1, 1, 1, 1,
-0.5265214, 1.384405, 0.2663312, 1, 1, 1, 1, 1,
-0.5201192, 0.5606976, -0.4849215, 1, 1, 1, 1, 1,
-0.5197029, 0.5716782, 1.20831, 1, 1, 1, 1, 1,
-0.5179778, 0.9374589, -0.1795221, 1, 1, 1, 1, 1,
-0.5131013, -0.4428415, -3.29572, 1, 1, 1, 1, 1,
-0.5099874, 0.1376865, -3.220297, 1, 1, 1, 1, 1,
-0.5045599, -0.3927517, -1.210459, 1, 1, 1, 1, 1,
-0.50078, -1.288805, -1.474312, 0, 0, 1, 1, 1,
-0.4934263, 0.6276352, -2.359501, 1, 0, 0, 1, 1,
-0.4912804, -0.8473756, -1.753195, 1, 0, 0, 1, 1,
-0.4866309, -0.2481223, -0.7971241, 1, 0, 0, 1, 1,
-0.4861736, -0.9615497, -2.982279, 1, 0, 0, 1, 1,
-0.4830621, -0.5195127, -2.070576, 1, 0, 0, 1, 1,
-0.4826976, 1.063021, 0.2523865, 0, 0, 0, 1, 1,
-0.475958, 2.653888, -0.8973706, 0, 0, 0, 1, 1,
-0.4688857, 0.6705666, -0.9006902, 0, 0, 0, 1, 1,
-0.4640797, -0.2821737, 0.342097, 0, 0, 0, 1, 1,
-0.4633547, -0.715681, -4.017773, 0, 0, 0, 1, 1,
-0.4621647, -0.6396706, -1.599931, 0, 0, 0, 1, 1,
-0.4617973, 0.4357443, -0.9685193, 0, 0, 0, 1, 1,
-0.4587694, -0.0853317, -1.037506, 1, 1, 1, 1, 1,
-0.4577009, 0.1023233, -2.630748, 1, 1, 1, 1, 1,
-0.4558111, 1.013615, -2.112439, 1, 1, 1, 1, 1,
-0.4556431, 1.279639, -0.4536332, 1, 1, 1, 1, 1,
-0.4514313, 1.247157, -0.06349609, 1, 1, 1, 1, 1,
-0.4483633, 1.674954, 1.317725, 1, 1, 1, 1, 1,
-0.447613, -0.1202959, -3.041038, 1, 1, 1, 1, 1,
-0.4445805, -0.2694498, -1.185715, 1, 1, 1, 1, 1,
-0.4385461, 0.8476893, -1.28689, 1, 1, 1, 1, 1,
-0.4354001, 1.513168, -1.095276, 1, 1, 1, 1, 1,
-0.4349725, -0.04804068, -0.6879708, 1, 1, 1, 1, 1,
-0.4340858, 0.5312344, -0.6748704, 1, 1, 1, 1, 1,
-0.4338898, 0.5188001, -0.3409247, 1, 1, 1, 1, 1,
-0.4306228, 0.4771355, -1.76581, 1, 1, 1, 1, 1,
-0.4267431, 0.02362664, -2.194361, 1, 1, 1, 1, 1,
-0.4255635, -0.2891545, -2.745581, 0, 0, 1, 1, 1,
-0.4199836, -1.829634, -2.821385, 1, 0, 0, 1, 1,
-0.4196874, 0.6273782, -0.2537998, 1, 0, 0, 1, 1,
-0.4146107, 0.7062551, -1.413006, 1, 0, 0, 1, 1,
-0.412677, 1.088283, -0.9787924, 1, 0, 0, 1, 1,
-0.4086722, -0.5023682, -2.353272, 1, 0, 0, 1, 1,
-0.4062746, 0.1983494, -1.162102, 0, 0, 0, 1, 1,
-0.4019336, -0.2756017, -1.612627, 0, 0, 0, 1, 1,
-0.3999403, -0.1525695, -2.072733, 0, 0, 0, 1, 1,
-0.3971333, 0.2338724, -0.5857277, 0, 0, 0, 1, 1,
-0.3942784, -1.278025, -3.040652, 0, 0, 0, 1, 1,
-0.3894305, 1.40887, -1.368378, 0, 0, 0, 1, 1,
-0.3846756, -0.496452, -3.420115, 0, 0, 0, 1, 1,
-0.3844607, 2.10242, 1.917003, 1, 1, 1, 1, 1,
-0.3777025, -1.175811, -0.507816, 1, 1, 1, 1, 1,
-0.3737627, 0.3586673, -1.246501, 1, 1, 1, 1, 1,
-0.3733163, -0.3564568, -0.6176174, 1, 1, 1, 1, 1,
-0.3723602, -2.676504, -3.148016, 1, 1, 1, 1, 1,
-0.3713082, 1.792162, -1.636353, 1, 1, 1, 1, 1,
-0.3702341, 1.226931, 0.2621269, 1, 1, 1, 1, 1,
-0.3681521, -1.260396, -1.59205, 1, 1, 1, 1, 1,
-0.3665782, 0.7980528, 2.852753, 1, 1, 1, 1, 1,
-0.3651497, 0.4483713, 0.487116, 1, 1, 1, 1, 1,
-0.3629968, 1.559297, 0.1008511, 1, 1, 1, 1, 1,
-0.3513614, -0.422708, 0.2582631, 1, 1, 1, 1, 1,
-0.3458516, 1.318298, 1.242772, 1, 1, 1, 1, 1,
-0.3416108, 0.6799225, -0.4219836, 1, 1, 1, 1, 1,
-0.3362697, -1.819298, -2.489313, 1, 1, 1, 1, 1,
-0.3328448, 0.7482914, -2.437092, 0, 0, 1, 1, 1,
-0.3314816, -0.7705753, -3.423191, 1, 0, 0, 1, 1,
-0.3306429, 0.3287164, -1.522307, 1, 0, 0, 1, 1,
-0.327766, 0.2972946, 0.6612064, 1, 0, 0, 1, 1,
-0.3213606, -0.992104, -2.795032, 1, 0, 0, 1, 1,
-0.3159642, -0.298883, -3.535161, 1, 0, 0, 1, 1,
-0.3153279, 1.399009, -0.5547065, 0, 0, 0, 1, 1,
-0.3142701, -1.372197, -1.732978, 0, 0, 0, 1, 1,
-0.3138318, 0.05300073, -1.978039, 0, 0, 0, 1, 1,
-0.3115907, -0.03564857, -1.81223, 0, 0, 0, 1, 1,
-0.3100199, -0.2767397, -2.767832, 0, 0, 0, 1, 1,
-0.3086614, -0.7388378, -3.400862, 0, 0, 0, 1, 1,
-0.3065661, -0.9216979, -1.575378, 0, 0, 0, 1, 1,
-0.3039775, 1.201662, -0.05076482, 1, 1, 1, 1, 1,
-0.2961833, -0.1240929, -0.8472364, 1, 1, 1, 1, 1,
-0.2910082, 0.7010282, 1.664698, 1, 1, 1, 1, 1,
-0.2883983, -0.5705746, -1.891332, 1, 1, 1, 1, 1,
-0.2881348, -0.1824965, -1.572398, 1, 1, 1, 1, 1,
-0.287838, -0.8884152, -2.010764, 1, 1, 1, 1, 1,
-0.2871172, 0.1998519, -1.734948, 1, 1, 1, 1, 1,
-0.278499, -0.4351687, -1.987357, 1, 1, 1, 1, 1,
-0.277136, 0.9119675, -2.526218, 1, 1, 1, 1, 1,
-0.2741583, -0.5084347, -1.747417, 1, 1, 1, 1, 1,
-0.2729017, 0.5352166, -0.02899195, 1, 1, 1, 1, 1,
-0.2726914, -0.312245, -0.7279499, 1, 1, 1, 1, 1,
-0.271263, -0.5259304, -1.769458, 1, 1, 1, 1, 1,
-0.2690466, 0.1078613, -2.989721, 1, 1, 1, 1, 1,
-0.2685358, -0.4611085, -2.522728, 1, 1, 1, 1, 1,
-0.2664494, 0.8540186, 0.003327846, 0, 0, 1, 1, 1,
-0.2654309, -0.5356926, -2.532997, 1, 0, 0, 1, 1,
-0.2652762, 0.5761372, 0.858052, 1, 0, 0, 1, 1,
-0.2649456, 0.510281, -0.5704105, 1, 0, 0, 1, 1,
-0.2633179, -0.5985484, -2.136855, 1, 0, 0, 1, 1,
-0.2571723, -1.59106, -1.35186, 1, 0, 0, 1, 1,
-0.2549704, 2.346174, 0.7469597, 0, 0, 0, 1, 1,
-0.2543757, 0.3671161, 0.1345928, 0, 0, 0, 1, 1,
-0.2521099, 1.277625, -0.2437061, 0, 0, 0, 1, 1,
-0.2511862, -0.1734498, -1.466456, 0, 0, 0, 1, 1,
-0.2482473, 0.1471505, -1.108606, 0, 0, 0, 1, 1,
-0.2436436, 0.3359694, -0.3644948, 0, 0, 0, 1, 1,
-0.240849, -1.070442, -2.776232, 0, 0, 0, 1, 1,
-0.2376375, 1.198839, -1.267468, 1, 1, 1, 1, 1,
-0.2348167, 0.5804911, -0.660621, 1, 1, 1, 1, 1,
-0.2311739, 0.1698452, -0.6682211, 1, 1, 1, 1, 1,
-0.2278014, 0.9317495, 1.285065, 1, 1, 1, 1, 1,
-0.226885, 0.2903193, 1.27132, 1, 1, 1, 1, 1,
-0.2158958, 1.621579, 2.093193, 1, 1, 1, 1, 1,
-0.2127324, 0.3598192, -0.009166635, 1, 1, 1, 1, 1,
-0.2088588, -0.4211414, -1.193938, 1, 1, 1, 1, 1,
-0.2087897, 1.591763, -1.550602, 1, 1, 1, 1, 1,
-0.2057857, -0.318896, -3.166133, 1, 1, 1, 1, 1,
-0.2017479, -1.221863, -4.146251, 1, 1, 1, 1, 1,
-0.198375, -1.032106, -4.801927, 1, 1, 1, 1, 1,
-0.1959321, 0.3473638, 1.285392, 1, 1, 1, 1, 1,
-0.1950254, -0.8410506, -4.426448, 1, 1, 1, 1, 1,
-0.192677, 0.2368516, -1.48313, 1, 1, 1, 1, 1,
-0.1906093, -1.083701, -4.402132, 0, 0, 1, 1, 1,
-0.1838139, -0.6976653, -2.246501, 1, 0, 0, 1, 1,
-0.1772943, -0.6900975, -1.875238, 1, 0, 0, 1, 1,
-0.1712818, -0.9996403, -4.624548, 1, 0, 0, 1, 1,
-0.1701479, 0.1863488, -2.507241, 1, 0, 0, 1, 1,
-0.1693612, 1.951164, 0.09896159, 1, 0, 0, 1, 1,
-0.1662073, 0.9608218, -0.2940145, 0, 0, 0, 1, 1,
-0.16167, -1.865908, -1.990038, 0, 0, 0, 1, 1,
-0.157257, -1.170495, -4.087209, 0, 0, 0, 1, 1,
-0.1494511, -0.7949771, -4.247955, 0, 0, 0, 1, 1,
-0.1417877, 1.163665, 0.1522601, 0, 0, 0, 1, 1,
-0.1408238, 1.337207, -0.7557057, 0, 0, 0, 1, 1,
-0.1387953, -1.556864, -3.768448, 0, 0, 0, 1, 1,
-0.1384157, 0.2591741, 0.2736459, 1, 1, 1, 1, 1,
-0.1372732, 0.3083415, -1.177636, 1, 1, 1, 1, 1,
-0.1354117, 1.05215, -1.80669, 1, 1, 1, 1, 1,
-0.1348893, 1.754932, -0.3628395, 1, 1, 1, 1, 1,
-0.131234, 1.64465, 0.1618523, 1, 1, 1, 1, 1,
-0.1311141, -0.5254637, -2.258382, 1, 1, 1, 1, 1,
-0.1303412, -0.6162946, -3.876646, 1, 1, 1, 1, 1,
-0.1288842, -1.453085, -1.667938, 1, 1, 1, 1, 1,
-0.1287437, -0.5942419, -2.749145, 1, 1, 1, 1, 1,
-0.1049966, 0.7392911, -0.1098425, 1, 1, 1, 1, 1,
-0.1026201, -0.1084321, -2.528203, 1, 1, 1, 1, 1,
-0.09742528, -1.05929, -2.507868, 1, 1, 1, 1, 1,
-0.08807587, -0.7910941, -3.363372, 1, 1, 1, 1, 1,
-0.07370132, -1.138107, -3.764835, 1, 1, 1, 1, 1,
-0.05608417, -1.087251, -3.514739, 1, 1, 1, 1, 1,
-0.04794914, 0.766932, 0.6572852, 0, 0, 1, 1, 1,
-0.03941574, 0.8089151, 1.843239, 1, 0, 0, 1, 1,
-0.03813543, -0.9492781, -2.361339, 1, 0, 0, 1, 1,
-0.03751518, 0.5381453, -3.475202, 1, 0, 0, 1, 1,
-0.03748511, 1.22651, -0.5875947, 1, 0, 0, 1, 1,
-0.03496607, 0.0758405, -1.848471, 1, 0, 0, 1, 1,
-0.02797731, 2.004246, -0.8130962, 0, 0, 0, 1, 1,
-0.02690748, 0.6155906, -0.2151847, 0, 0, 0, 1, 1,
-0.02668422, -0.1395764, -3.716749, 0, 0, 0, 1, 1,
-0.02250253, -0.1106946, -2.514887, 0, 0, 0, 1, 1,
-0.01807369, 0.4343506, -0.231257, 0, 0, 0, 1, 1,
-0.01708132, 1.795338, -1.507803, 0, 0, 0, 1, 1,
-0.01162468, 0.298309, -0.5566667, 0, 0, 0, 1, 1,
-0.01059767, 0.4276611, 0.2016046, 1, 1, 1, 1, 1,
-0.01058342, 1.501015, 0.4970129, 1, 1, 1, 1, 1,
-0.009377864, -0.4888406, -3.24554, 1, 1, 1, 1, 1,
-0.00738324, -0.556124, -1.897264, 1, 1, 1, 1, 1,
-0.006828903, 0.7937139, -0.5359198, 1, 1, 1, 1, 1,
-0.002756358, -1.257661, -4.216199, 1, 1, 1, 1, 1,
-0.0025595, 0.6670899, 1.045474, 1, 1, 1, 1, 1,
-0.001986505, 0.03630498, -0.501638, 1, 1, 1, 1, 1,
0.008387028, -0.7380484, 3.342299, 1, 1, 1, 1, 1,
0.009370756, -0.06458304, 2.92158, 1, 1, 1, 1, 1,
0.01118391, 0.297283, 0.2615224, 1, 1, 1, 1, 1,
0.01499205, -1.372966, 2.598456, 1, 1, 1, 1, 1,
0.01521335, 0.002163543, 0.9723458, 1, 1, 1, 1, 1,
0.01745008, -0.1310102, 2.985452, 1, 1, 1, 1, 1,
0.01857095, 1.207783, -0.1546987, 1, 1, 1, 1, 1,
0.02019709, 0.4157, 1.753592, 0, 0, 1, 1, 1,
0.02113657, -1.195694, 3.474998, 1, 0, 0, 1, 1,
0.0213145, -1.111838, 0.5764386, 1, 0, 0, 1, 1,
0.02200351, 0.4079096, -0.7579123, 1, 0, 0, 1, 1,
0.03080199, -0.09075725, 2.620022, 1, 0, 0, 1, 1,
0.03220845, -0.6017874, 3.775936, 1, 0, 0, 1, 1,
0.03260171, -0.4697537, 3.403623, 0, 0, 0, 1, 1,
0.03275979, 1.197755, -1.148845, 0, 0, 0, 1, 1,
0.03396252, 2.518243, 0.7558144, 0, 0, 0, 1, 1,
0.03644544, 0.5713837, 0.5889024, 0, 0, 0, 1, 1,
0.04127894, -0.4757166, 2.624431, 0, 0, 0, 1, 1,
0.04400301, -0.07404421, 2.872579, 0, 0, 0, 1, 1,
0.04644113, 1.542871, -1.647579, 0, 0, 0, 1, 1,
0.04681323, 0.6194547, -1.063059, 1, 1, 1, 1, 1,
0.05249503, -0.9671775, 3.574076, 1, 1, 1, 1, 1,
0.05273611, -0.7599089, 3.677195, 1, 1, 1, 1, 1,
0.05313199, -1.822154, 3.941791, 1, 1, 1, 1, 1,
0.05559893, 1.057476, 0.02975481, 1, 1, 1, 1, 1,
0.05734671, 0.2784497, 0.5293535, 1, 1, 1, 1, 1,
0.06037551, 0.2548285, -0.06781298, 1, 1, 1, 1, 1,
0.06256333, 0.739009, -0.4255036, 1, 1, 1, 1, 1,
0.06400666, 0.7547939, -0.4373804, 1, 1, 1, 1, 1,
0.06405339, 1.565253, -1.269931, 1, 1, 1, 1, 1,
0.0645781, 1.40983, -0.4474158, 1, 1, 1, 1, 1,
0.06467862, 1.784313, -1.149079, 1, 1, 1, 1, 1,
0.06695242, -0.504614, 3.104201, 1, 1, 1, 1, 1,
0.06717318, 1.523964, 0.1320778, 1, 1, 1, 1, 1,
0.06792533, 1.062089, -0.3835894, 1, 1, 1, 1, 1,
0.06854645, 0.3655991, 1.597224, 0, 0, 1, 1, 1,
0.06907856, -0.5182024, 2.172048, 1, 0, 0, 1, 1,
0.07238463, -0.7162178, 5.078805, 1, 0, 0, 1, 1,
0.07656381, 0.06295065, 0.3586509, 1, 0, 0, 1, 1,
0.07748932, 0.7803842, 0.0002688704, 1, 0, 0, 1, 1,
0.08325326, -0.602913, 1.35421, 1, 0, 0, 1, 1,
0.08512858, 0.394552, -1.510976, 0, 0, 0, 1, 1,
0.08666449, 1.240984, 0.5894551, 0, 0, 0, 1, 1,
0.09309357, -0.3892919, 1.369176, 0, 0, 0, 1, 1,
0.09424771, 0.257023, 0.6885625, 0, 0, 0, 1, 1,
0.09653341, -2.592373, 3.981537, 0, 0, 0, 1, 1,
0.09735049, -0.7770528, 3.653945, 0, 0, 0, 1, 1,
0.09987078, 0.2933613, 1.298181, 0, 0, 0, 1, 1,
0.1003171, 1.52826, -0.9291148, 1, 1, 1, 1, 1,
0.1005685, -2.250661, 2.605558, 1, 1, 1, 1, 1,
0.1043752, -0.05090069, 1.488861, 1, 1, 1, 1, 1,
0.112746, -0.752731, 5.210655, 1, 1, 1, 1, 1,
0.114292, 2.366636, -0.9881811, 1, 1, 1, 1, 1,
0.1212003, -0.4987938, 4.754442, 1, 1, 1, 1, 1,
0.1216353, -1.314463, 2.994595, 1, 1, 1, 1, 1,
0.1240974, 1.079576, 0.3542468, 1, 1, 1, 1, 1,
0.1242999, -0.619597, 2.034816, 1, 1, 1, 1, 1,
0.1275338, 0.8195097, -0.3720363, 1, 1, 1, 1, 1,
0.128309, 0.04188876, 2.283086, 1, 1, 1, 1, 1,
0.1288619, -0.4371949, 3.140039, 1, 1, 1, 1, 1,
0.1294623, 0.72484, 0.7300073, 1, 1, 1, 1, 1,
0.1316314, 0.4656476, -0.9081127, 1, 1, 1, 1, 1,
0.1325374, -1.209216, 2.085985, 1, 1, 1, 1, 1,
0.1473153, -2.072972, 4.930269, 0, 0, 1, 1, 1,
0.1480739, 0.4225535, 0.0625947, 1, 0, 0, 1, 1,
0.1519742, -1.607629, 3.323929, 1, 0, 0, 1, 1,
0.159868, -0.1376664, 0.7409081, 1, 0, 0, 1, 1,
0.162086, 0.01881382, 1.073943, 1, 0, 0, 1, 1,
0.1631376, -0.8477072, 1.906774, 1, 0, 0, 1, 1,
0.1646946, -0.01411408, 1.557175, 0, 0, 0, 1, 1,
0.1707444, -2.571077, 2.80919, 0, 0, 0, 1, 1,
0.1762701, 1.016753, -0.5605528, 0, 0, 0, 1, 1,
0.1886915, -0.7910669, 1.352066, 0, 0, 0, 1, 1,
0.1929682, 1.438199, -0.4565212, 0, 0, 0, 1, 1,
0.1955749, 0.7948212, -0.1686901, 0, 0, 0, 1, 1,
0.2009906, 0.8249039, 0.2367558, 0, 0, 0, 1, 1,
0.2017948, -0.8213285, 2.530467, 1, 1, 1, 1, 1,
0.2065485, -0.414563, 2.49396, 1, 1, 1, 1, 1,
0.2127225, -0.8195094, 2.652023, 1, 1, 1, 1, 1,
0.2127921, -0.07535625, 1.047639, 1, 1, 1, 1, 1,
0.2147354, 1.618788, 0.2979889, 1, 1, 1, 1, 1,
0.2150155, -1.528413, 2.360488, 1, 1, 1, 1, 1,
0.2152714, 0.3999861, 0.5620559, 1, 1, 1, 1, 1,
0.2159329, 0.4829867, 0.09427268, 1, 1, 1, 1, 1,
0.2211978, -1.038097, 2.156056, 1, 1, 1, 1, 1,
0.2222491, 0.6157846, 0.8120279, 1, 1, 1, 1, 1,
0.231791, -0.710373, 2.086079, 1, 1, 1, 1, 1,
0.2350184, 0.09717201, 0.5002879, 1, 1, 1, 1, 1,
0.2351268, 0.1995298, 1.590504, 1, 1, 1, 1, 1,
0.2382941, 1.656622, 0.4351354, 1, 1, 1, 1, 1,
0.2408017, -0.5823351, 2.541918, 1, 1, 1, 1, 1,
0.2461108, -0.5615792, 2.579138, 0, 0, 1, 1, 1,
0.2466183, 1.042361, -0.2341601, 1, 0, 0, 1, 1,
0.2468704, 0.08052526, 0.142433, 1, 0, 0, 1, 1,
0.2478665, 1.400614, 1.015884, 1, 0, 0, 1, 1,
0.2479883, 1.235724, -1.470036, 1, 0, 0, 1, 1,
0.248597, 0.8668424, -1.258378, 1, 0, 0, 1, 1,
0.251543, 0.2578594, 0.278827, 0, 0, 0, 1, 1,
0.2533664, 0.9702752, 0.6065476, 0, 0, 0, 1, 1,
0.2537666, -0.8204955, 2.814801, 0, 0, 0, 1, 1,
0.2549688, 1.866844, -1.410196, 0, 0, 0, 1, 1,
0.2558663, 0.3160582, 2.9149, 0, 0, 0, 1, 1,
0.2558754, -1.155519, 3.626107, 0, 0, 0, 1, 1,
0.2576681, -0.4845836, 2.353144, 0, 0, 0, 1, 1,
0.2583546, -0.4671087, 2.58093, 1, 1, 1, 1, 1,
0.2626024, -0.4323364, 2.664222, 1, 1, 1, 1, 1,
0.265508, -0.1878966, 3.379619, 1, 1, 1, 1, 1,
0.266597, -0.8410937, 2.601536, 1, 1, 1, 1, 1,
0.2723056, -1.124916, 2.881316, 1, 1, 1, 1, 1,
0.2740013, 1.559014, 1.5091, 1, 1, 1, 1, 1,
0.2786507, 0.07029767, 1.547225, 1, 1, 1, 1, 1,
0.2786621, 0.5609819, -0.3916056, 1, 1, 1, 1, 1,
0.2788495, -2.367125, 2.259883, 1, 1, 1, 1, 1,
0.2827648, -0.4908857, 2.959168, 1, 1, 1, 1, 1,
0.2832813, -0.1260944, 1.472901, 1, 1, 1, 1, 1,
0.283798, -0.2560718, 1.159049, 1, 1, 1, 1, 1,
0.2843991, 0.3072499, 1.120303, 1, 1, 1, 1, 1,
0.2845541, -0.7716786, 3.513963, 1, 1, 1, 1, 1,
0.2868192, 0.16361, 0.03819603, 1, 1, 1, 1, 1,
0.2873649, 0.5828106, 0.0571877, 0, 0, 1, 1, 1,
0.289121, -0.9515731, 3.870919, 1, 0, 0, 1, 1,
0.2929348, -0.1681905, 3.981588, 1, 0, 0, 1, 1,
0.2993536, -0.3000247, 1.516989, 1, 0, 0, 1, 1,
0.3004194, -0.7742192, 2.654925, 1, 0, 0, 1, 1,
0.3015385, 0.2183444, 1.591027, 1, 0, 0, 1, 1,
0.3071168, -0.8584392, 1.14068, 0, 0, 0, 1, 1,
0.3074613, -0.190543, 0.2555945, 0, 0, 0, 1, 1,
0.3087837, -0.5481653, 0.6336421, 0, 0, 0, 1, 1,
0.3116229, -0.4211047, 2.015214, 0, 0, 0, 1, 1,
0.3154188, 0.467496, -0.328592, 0, 0, 0, 1, 1,
0.3156177, 2.206548, -0.528824, 0, 0, 0, 1, 1,
0.3168687, -0.1102872, 2.267015, 0, 0, 0, 1, 1,
0.316947, -0.004996159, 2.002658, 1, 1, 1, 1, 1,
0.3196687, 2.948677, -0.1493702, 1, 1, 1, 1, 1,
0.3259018, -0.09546915, 0.6019184, 1, 1, 1, 1, 1,
0.3273549, 0.06321701, -0.7626386, 1, 1, 1, 1, 1,
0.3323089, 1.49536, -0.07455154, 1, 1, 1, 1, 1,
0.3325768, 0.3941128, 0.7264261, 1, 1, 1, 1, 1,
0.336381, -0.3564272, 1.904594, 1, 1, 1, 1, 1,
0.3390098, 1.293422, -0.9091005, 1, 1, 1, 1, 1,
0.3432862, 1.198243, 1.472289, 1, 1, 1, 1, 1,
0.3515936, -1.012034, 1.948456, 1, 1, 1, 1, 1,
0.3525086, 1.996207, 0.6845262, 1, 1, 1, 1, 1,
0.3525907, 0.580204, 0.9950862, 1, 1, 1, 1, 1,
0.3549287, -0.1929571, 0.5512375, 1, 1, 1, 1, 1,
0.3549292, 0.1292746, 0.8713142, 1, 1, 1, 1, 1,
0.356508, 1.575966, -0.6000752, 1, 1, 1, 1, 1,
0.3565944, 0.4069609, 0.8104361, 0, 0, 1, 1, 1,
0.3571341, 0.183841, 0.3655906, 1, 0, 0, 1, 1,
0.3574422, -0.2920346, 2.16444, 1, 0, 0, 1, 1,
0.3645145, -0.4808399, 4.383584, 1, 0, 0, 1, 1,
0.3657374, 1.229198, 1.18118, 1, 0, 0, 1, 1,
0.3685064, -0.2564818, 4.959071, 1, 0, 0, 1, 1,
0.3765365, -0.3339378, 2.627096, 0, 0, 0, 1, 1,
0.3824066, -0.3422489, 2.475667, 0, 0, 0, 1, 1,
0.3828675, 1.396534, 0.006960202, 0, 0, 0, 1, 1,
0.3850077, -2.085444, 2.963134, 0, 0, 0, 1, 1,
0.3859264, -2.322822, 4.198009, 0, 0, 0, 1, 1,
0.3860859, 0.3665423, 0.4448428, 0, 0, 0, 1, 1,
0.3899816, 0.0005643131, 3.314564, 0, 0, 0, 1, 1,
0.3906367, 0.9863105, -0.5320027, 1, 1, 1, 1, 1,
0.3912979, -0.5642306, 1.785017, 1, 1, 1, 1, 1,
0.3957303, 2.728589, 0.8049126, 1, 1, 1, 1, 1,
0.3984092, -0.875293, 3.248284, 1, 1, 1, 1, 1,
0.3987582, 0.6459869, 0.5240408, 1, 1, 1, 1, 1,
0.4004998, -0.4385931, 2.028619, 1, 1, 1, 1, 1,
0.4029543, -0.9755854, 1.430679, 1, 1, 1, 1, 1,
0.4030049, 0.4737925, -0.2062749, 1, 1, 1, 1, 1,
0.4048908, 1.587271, 1.158628, 1, 1, 1, 1, 1,
0.4057567, -0.2182689, 1.268421, 1, 1, 1, 1, 1,
0.4067757, -0.3538585, 3.226985, 1, 1, 1, 1, 1,
0.4091104, 0.09868053, 0.04404175, 1, 1, 1, 1, 1,
0.4118604, 0.9025338, 1.598401, 1, 1, 1, 1, 1,
0.4129476, 0.299559, 1.452037, 1, 1, 1, 1, 1,
0.4186454, 1.058812, 0.8953186, 1, 1, 1, 1, 1,
0.4199644, 1.949541, 1.175013, 0, 0, 1, 1, 1,
0.4217472, 0.3016933, 1.869872, 1, 0, 0, 1, 1,
0.4249126, -0.05375102, 1.395874, 1, 0, 0, 1, 1,
0.4254721, -0.3514161, 2.099472, 1, 0, 0, 1, 1,
0.425581, 1.350606, -0.1605398, 1, 0, 0, 1, 1,
0.4372489, 0.1463472, 0.9475779, 1, 0, 0, 1, 1,
0.440887, -2.910365, 1.750257, 0, 0, 0, 1, 1,
0.4424058, -1.44488, 2.913502, 0, 0, 0, 1, 1,
0.4468871, 0.5206891, 0.3983859, 0, 0, 0, 1, 1,
0.4481299, -0.5659692, -0.1123873, 0, 0, 0, 1, 1,
0.451096, 0.9001322, -0.1337535, 0, 0, 0, 1, 1,
0.4556135, 0.7379299, 0.3255307, 0, 0, 0, 1, 1,
0.4562468, 0.5696762, 1.727092, 0, 0, 0, 1, 1,
0.4569609, 0.870622, -0.4776247, 1, 1, 1, 1, 1,
0.4575131, -0.2693908, 0.460153, 1, 1, 1, 1, 1,
0.4588225, -0.7587619, 1.509554, 1, 1, 1, 1, 1,
0.4673349, 1.179055, -0.3101504, 1, 1, 1, 1, 1,
0.4683091, 1.560957, 0.02792718, 1, 1, 1, 1, 1,
0.4684724, -0.7602804, 2.141303, 1, 1, 1, 1, 1,
0.4701303, -2.612682, 3.262666, 1, 1, 1, 1, 1,
0.4719548, -0.8338276, 0.02377445, 1, 1, 1, 1, 1,
0.4746316, -0.9785302, 0.6639984, 1, 1, 1, 1, 1,
0.4747378, 0.6794686, 0.5762329, 1, 1, 1, 1, 1,
0.4765114, -0.5139911, 2.798342, 1, 1, 1, 1, 1,
0.4765502, -1.267152, 3.48625, 1, 1, 1, 1, 1,
0.4772978, 0.5304578, -0.06519908, 1, 1, 1, 1, 1,
0.4784981, -0.486304, 2.011778, 1, 1, 1, 1, 1,
0.4795255, 1.131452, -0.5998774, 1, 1, 1, 1, 1,
0.4795261, 0.2218027, 0.2943618, 0, 0, 1, 1, 1,
0.4828002, 0.6682977, 1.757114, 1, 0, 0, 1, 1,
0.4838147, -0.1127212, 4.504568, 1, 0, 0, 1, 1,
0.4883702, -0.406913, 0.2688253, 1, 0, 0, 1, 1,
0.4889654, -1.464104, 2.011827, 1, 0, 0, 1, 1,
0.4891823, 0.4538707, 2.023571, 1, 0, 0, 1, 1,
0.4899104, 1.275323, 2.442196, 0, 0, 0, 1, 1,
0.490036, -0.007888241, 0.4270962, 0, 0, 0, 1, 1,
0.4937427, -2.06822, 3.564103, 0, 0, 0, 1, 1,
0.4940766, -0.6104705, 3.72477, 0, 0, 0, 1, 1,
0.4953077, -0.1064511, -0.2587221, 0, 0, 0, 1, 1,
0.4960878, 1.623029, 2.558634, 0, 0, 0, 1, 1,
0.4965318, 1.115038, -0.6344332, 0, 0, 0, 1, 1,
0.4981407, -1.081365, 1.393672, 1, 1, 1, 1, 1,
0.5003214, -0.9709716, 1.838056, 1, 1, 1, 1, 1,
0.503288, -0.510341, 1.738263, 1, 1, 1, 1, 1,
0.5060271, 0.4621402, -0.6795107, 1, 1, 1, 1, 1,
0.5065875, 0.2527016, -0.6616152, 1, 1, 1, 1, 1,
0.5072961, 0.6666847, 1.027574, 1, 1, 1, 1, 1,
0.5078633, 1.77251, 1.257466, 1, 1, 1, 1, 1,
0.5082507, 0.836365, 0.7635858, 1, 1, 1, 1, 1,
0.5084683, 1.4099, -0.5030144, 1, 1, 1, 1, 1,
0.5110667, -2.164358, 3.100093, 1, 1, 1, 1, 1,
0.5149757, 0.8968428, -1.294589, 1, 1, 1, 1, 1,
0.5159608, 0.3321696, 1.756825, 1, 1, 1, 1, 1,
0.5166807, 0.1553674, 1.879556, 1, 1, 1, 1, 1,
0.5185834, -0.3528266, 1.713588, 1, 1, 1, 1, 1,
0.5197948, 0.2834398, 2.989697, 1, 1, 1, 1, 1,
0.5230466, 0.0296315, 2.001889, 0, 0, 1, 1, 1,
0.5297558, 0.3502111, 0.1113604, 1, 0, 0, 1, 1,
0.5302519, -1.246914, 1.697712, 1, 0, 0, 1, 1,
0.5332966, -2.813188, 2.782536, 1, 0, 0, 1, 1,
0.5348855, 0.1485559, 0.5341155, 1, 0, 0, 1, 1,
0.5411999, -0.1604225, 2.469704, 1, 0, 0, 1, 1,
0.5486192, -2.060956, 3.605877, 0, 0, 0, 1, 1,
0.5508373, 0.8124782, 1.378289, 0, 0, 0, 1, 1,
0.5517493, 1.700689, 0.5504831, 0, 0, 0, 1, 1,
0.5521626, 1.317919, -0.2259883, 0, 0, 0, 1, 1,
0.5561839, -0.1655425, 0.8704197, 0, 0, 0, 1, 1,
0.5567491, -1.446166, 3.134962, 0, 0, 0, 1, 1,
0.5574462, -1.38069, 2.493084, 0, 0, 0, 1, 1,
0.5599393, 1.426483, 2.059585, 1, 1, 1, 1, 1,
0.5661149, 0.673719, 0.9045292, 1, 1, 1, 1, 1,
0.5698886, 0.0395725, 2.092376, 1, 1, 1, 1, 1,
0.5705529, -2.010415, 2.119102, 1, 1, 1, 1, 1,
0.5745983, 0.3528819, 1.671652, 1, 1, 1, 1, 1,
0.5764277, -1.250064, 1.771188, 1, 1, 1, 1, 1,
0.5797508, -0.4344321, 2.550552, 1, 1, 1, 1, 1,
0.5835917, -1.400019, 2.851191, 1, 1, 1, 1, 1,
0.5917867, 1.012139, -0.08477648, 1, 1, 1, 1, 1,
0.5956469, 0.4024196, 1.042562, 1, 1, 1, 1, 1,
0.6028081, -1.654084, 5.481696, 1, 1, 1, 1, 1,
0.6047816, 0.8999771, 0.5561146, 1, 1, 1, 1, 1,
0.6088011, -0.1064117, 3.262146, 1, 1, 1, 1, 1,
0.6098372, -0.2987777, 1.940956, 1, 1, 1, 1, 1,
0.6238647, -0.457036, 2.797077, 1, 1, 1, 1, 1,
0.6270232, 0.5703015, 0.3138629, 0, 0, 1, 1, 1,
0.6277002, -0.2565763, 2.932665, 1, 0, 0, 1, 1,
0.6282454, -0.6929751, 0.3084857, 1, 0, 0, 1, 1,
0.6288764, 0.6537353, 1.168219, 1, 0, 0, 1, 1,
0.6320096, 2.032923, 0.074205, 1, 0, 0, 1, 1,
0.636126, -0.8476719, 2.471282, 1, 0, 0, 1, 1,
0.6405903, -0.321327, 1.953441, 0, 0, 0, 1, 1,
0.6421705, -0.5793759, 2.881152, 0, 0, 0, 1, 1,
0.644302, -0.9981037, 3.701872, 0, 0, 0, 1, 1,
0.645876, -0.1861729, 1.037657, 0, 0, 0, 1, 1,
0.6494192, -0.4298697, 2.584786, 0, 0, 0, 1, 1,
0.6503056, -0.1254603, 1.875087, 0, 0, 0, 1, 1,
0.6546584, -0.3206341, 1.771278, 0, 0, 0, 1, 1,
0.6562523, -2.311682, 2.826303, 1, 1, 1, 1, 1,
0.6579762, 1.850657, 0.3473959, 1, 1, 1, 1, 1,
0.6585274, 0.7781782, -0.3516733, 1, 1, 1, 1, 1,
0.6594673, 0.5440318, 0.130319, 1, 1, 1, 1, 1,
0.6616932, -1.615173, 2.217925, 1, 1, 1, 1, 1,
0.6719305, 0.03016859, 1.379877, 1, 1, 1, 1, 1,
0.6734877, -0.04581877, 1.471711, 1, 1, 1, 1, 1,
0.6752094, -0.6706998, 1.449253, 1, 1, 1, 1, 1,
0.679517, -0.09041383, 2.561654, 1, 1, 1, 1, 1,
0.6839221, 0.939321, 0.3224679, 1, 1, 1, 1, 1,
0.6866087, 1.436908, 0.3115366, 1, 1, 1, 1, 1,
0.6919688, 0.9573917, -0.1073451, 1, 1, 1, 1, 1,
0.6935368, 0.917757, 1.234868, 1, 1, 1, 1, 1,
0.7002922, 1.087445, -0.09739398, 1, 1, 1, 1, 1,
0.7007986, -0.07804161, -0.1080111, 1, 1, 1, 1, 1,
0.700915, 1.024114, 1.164482, 0, 0, 1, 1, 1,
0.7053071, 0.8068878, 1.019991, 1, 0, 0, 1, 1,
0.7129701, -0.1637664, 0.7495999, 1, 0, 0, 1, 1,
0.7313872, 1.193008, 1.310483, 1, 0, 0, 1, 1,
0.7356224, -1.038249, 2.593877, 1, 0, 0, 1, 1,
0.7369646, -0.8062217, 0.6044359, 1, 0, 0, 1, 1,
0.737896, -0.792486, 4.609757, 0, 0, 0, 1, 1,
0.7429228, 1.579605, -0.3058639, 0, 0, 0, 1, 1,
0.7444093, -1.077891, 1.563584, 0, 0, 0, 1, 1,
0.7535682, -0.4204114, 1.233466, 0, 0, 0, 1, 1,
0.7657502, -1.131258, 1.989666, 0, 0, 0, 1, 1,
0.7661577, 0.6302922, -0.26142, 0, 0, 0, 1, 1,
0.7723137, -0.5065946, 3.139823, 0, 0, 0, 1, 1,
0.774571, -0.8451591, 2.207119, 1, 1, 1, 1, 1,
0.7752141, -0.8365124, 2.166149, 1, 1, 1, 1, 1,
0.7821262, -1.050674, 3.207815, 1, 1, 1, 1, 1,
0.7854433, 1.571136, -0.4704645, 1, 1, 1, 1, 1,
0.7963484, -0.6166946, 2.544643, 1, 1, 1, 1, 1,
0.7999119, 1.099532, -0.1859559, 1, 1, 1, 1, 1,
0.8030258, 1.272565, 0.3459841, 1, 1, 1, 1, 1,
0.8051659, 0.2549732, 2.486158, 1, 1, 1, 1, 1,
0.8069379, 0.244606, 0.2834456, 1, 1, 1, 1, 1,
0.8081059, -0.09968295, -0.2372582, 1, 1, 1, 1, 1,
0.8243445, -0.02355968, 1.458785, 1, 1, 1, 1, 1,
0.8296235, -0.5500346, 2.977318, 1, 1, 1, 1, 1,
0.8352123, -1.291767, 2.452256, 1, 1, 1, 1, 1,
0.8441802, 1.164505, 0.8916472, 1, 1, 1, 1, 1,
0.8456748, 0.8651485, 1.633639, 1, 1, 1, 1, 1,
0.846446, -2.028077, 2.720792, 0, 0, 1, 1, 1,
0.852523, 0.2013471, -0.004886782, 1, 0, 0, 1, 1,
0.8569562, -1.200646, 1.850289, 1, 0, 0, 1, 1,
0.8590448, -0.2314971, 1.421268, 1, 0, 0, 1, 1,
0.8670961, 1.669637, 1.025854, 1, 0, 0, 1, 1,
0.8677204, 1.255425, 1.1768, 1, 0, 0, 1, 1,
0.8774863, 0.904082, -0.5922419, 0, 0, 0, 1, 1,
0.8789161, -0.03968779, 1.305177, 0, 0, 0, 1, 1,
0.884791, -0.8977399, 3.153564, 0, 0, 0, 1, 1,
0.8866447, 0.3243939, 0.9273461, 0, 0, 0, 1, 1,
0.897355, -0.3519022, 2.702344, 0, 0, 0, 1, 1,
0.9003372, 1.246285, 0.7266917, 0, 0, 0, 1, 1,
0.9030855, -1.42632, 1.829868, 0, 0, 0, 1, 1,
0.9047042, 0.01706748, 0.8475263, 1, 1, 1, 1, 1,
0.9097104, 0.6986895, 0.8916393, 1, 1, 1, 1, 1,
0.9118654, 0.3926979, 1.205379, 1, 1, 1, 1, 1,
0.9137474, 0.2762955, 2.330851, 1, 1, 1, 1, 1,
0.9158877, 1.379814, -0.7312472, 1, 1, 1, 1, 1,
0.9186538, 0.4527562, -0.5063126, 1, 1, 1, 1, 1,
0.9211832, -0.859424, 4.009111, 1, 1, 1, 1, 1,
0.9267448, 1.19683, 0.433205, 1, 1, 1, 1, 1,
0.9293623, -1.271648, 4.282123, 1, 1, 1, 1, 1,
0.9360141, -0.821718, 1.990707, 1, 1, 1, 1, 1,
0.9422068, 0.6085309, 2.752004, 1, 1, 1, 1, 1,
0.9489913, -1.892201, 3.137515, 1, 1, 1, 1, 1,
0.9502212, -0.8376915, 4.109279, 1, 1, 1, 1, 1,
0.9533611, 1.301074, 1.462301, 1, 1, 1, 1, 1,
0.9586831, 0.8563006, 1.937001, 1, 1, 1, 1, 1,
0.9592606, 0.9669517, -0.4832547, 0, 0, 1, 1, 1,
0.9601598, 0.6375448, 1.337547, 1, 0, 0, 1, 1,
0.9634104, 0.4095656, 0.4045594, 1, 0, 0, 1, 1,
0.9655977, 0.09383895, -0.8001491, 1, 0, 0, 1, 1,
0.9663033, 0.6382163, -0.3530185, 1, 0, 0, 1, 1,
0.9734411, 1.447981, 0.6797251, 1, 0, 0, 1, 1,
0.9808438, -1.256539, 1.106418, 0, 0, 0, 1, 1,
0.9861282, -0.9321992, 2.080593, 0, 0, 0, 1, 1,
0.9959861, -0.2002662, 1.081338, 0, 0, 0, 1, 1,
1.000414, 1.629716, -0.912554, 0, 0, 0, 1, 1,
1.00129, 1.124112, 1.620789, 0, 0, 0, 1, 1,
1.004617, -0.6328963, 3.381324, 0, 0, 0, 1, 1,
1.019961, 0.5965203, 1.922422, 0, 0, 0, 1, 1,
1.024602, 1.00234, 0.1158684, 1, 1, 1, 1, 1,
1.028751, -0.1272915, 1.469333, 1, 1, 1, 1, 1,
1.034511, -0.507836, 1.227919, 1, 1, 1, 1, 1,
1.042376, 0.3115513, 2.487364, 1, 1, 1, 1, 1,
1.045279, -0.07783267, 2.799263, 1, 1, 1, 1, 1,
1.047946, -1.366635, 0.805619, 1, 1, 1, 1, 1,
1.053236, 1.925631, 2.491065, 1, 1, 1, 1, 1,
1.054469, -1.777299, 3.765906, 1, 1, 1, 1, 1,
1.05921, -0.6408367, 1.452663, 1, 1, 1, 1, 1,
1.060584, 0.4130206, 1.669595, 1, 1, 1, 1, 1,
1.063703, 1.146018, 1.392448, 1, 1, 1, 1, 1,
1.070713, 0.5807133, 0.156347, 1, 1, 1, 1, 1,
1.080909, -1.427035, 2.464533, 1, 1, 1, 1, 1,
1.081631, -1.573204, 3.613328, 1, 1, 1, 1, 1,
1.082081, -1.233821, 2.792974, 1, 1, 1, 1, 1,
1.084975, 1.510952, 0.5201886, 0, 0, 1, 1, 1,
1.106651, 2.850936, -2.076679, 1, 0, 0, 1, 1,
1.108248, 0.1505456, -1.150868, 1, 0, 0, 1, 1,
1.113558, -1.145114, 1.020944, 1, 0, 0, 1, 1,
1.114819, 0.4615951, 2.592499, 1, 0, 0, 1, 1,
1.126644, -0.4024671, 1.885583, 1, 0, 0, 1, 1,
1.127444, 1.049059, 0.7843351, 0, 0, 0, 1, 1,
1.13227, 2.056141, 0.6484541, 0, 0, 0, 1, 1,
1.133572, -1.828906, 3.046026, 0, 0, 0, 1, 1,
1.138733, -0.008018434, 1.892848, 0, 0, 0, 1, 1,
1.142562, -0.1878306, 3.919453, 0, 0, 0, 1, 1,
1.143297, 1.351872, 0.4531478, 0, 0, 0, 1, 1,
1.157091, -0.4418978, 2.764889, 0, 0, 0, 1, 1,
1.158355, 0.02310612, 1.660488, 1, 1, 1, 1, 1,
1.168657, 0.2677835, 0.5809681, 1, 1, 1, 1, 1,
1.173908, 0.2898505, 0.6545992, 1, 1, 1, 1, 1,
1.188826, 0.8012631, 0.620773, 1, 1, 1, 1, 1,
1.196164, 1.341937, -0.6637503, 1, 1, 1, 1, 1,
1.202243, 1.579639, 1.198723, 1, 1, 1, 1, 1,
1.222737, -0.6555493, 4.107388, 1, 1, 1, 1, 1,
1.22688, -0.6965791, 4.069326, 1, 1, 1, 1, 1,
1.245338, -0.4300208, 3.178244, 1, 1, 1, 1, 1,
1.247123, 1.218107, 1.85487, 1, 1, 1, 1, 1,
1.247651, 1.50872, 0.7136098, 1, 1, 1, 1, 1,
1.249797, 1.142761, 0.04649537, 1, 1, 1, 1, 1,
1.25439, 1.449476, 1.312056, 1, 1, 1, 1, 1,
1.258162, 0.5351912, 0.1002865, 1, 1, 1, 1, 1,
1.262774, -1.099555, 1.673698, 1, 1, 1, 1, 1,
1.273484, 0.2805641, 1.363919, 0, 0, 1, 1, 1,
1.278095, 1.988452, 0.5891829, 1, 0, 0, 1, 1,
1.280519, 0.2434173, 2.755973, 1, 0, 0, 1, 1,
1.281718, -0.06961003, 2.839972, 1, 0, 0, 1, 1,
1.303242, -0.896934, 1.824389, 1, 0, 0, 1, 1,
1.306309, -0.08180694, 2.577453, 1, 0, 0, 1, 1,
1.312562, 1.251446, 0.4906669, 0, 0, 0, 1, 1,
1.318269, -0.3063845, 3.168132, 0, 0, 0, 1, 1,
1.325942, 0.5992506, 2.354112, 0, 0, 0, 1, 1,
1.326704, -0.870495, 2.934994, 0, 0, 0, 1, 1,
1.32962, 0.846355, 1.594573, 0, 0, 0, 1, 1,
1.334846, 1.09131, 2.173921, 0, 0, 0, 1, 1,
1.337754, 0.6764315, 2.549219, 0, 0, 0, 1, 1,
1.34191, -0.17483, 1.295813, 1, 1, 1, 1, 1,
1.346237, 0.03382698, -0.2412634, 1, 1, 1, 1, 1,
1.349475, -0.8052694, 1.53305, 1, 1, 1, 1, 1,
1.369101, 0.5346299, 1.53355, 1, 1, 1, 1, 1,
1.371878, -0.1408895, 2.199719, 1, 1, 1, 1, 1,
1.374182, -0.04252643, 2.048445, 1, 1, 1, 1, 1,
1.376685, 0.1756381, 0.1388811, 1, 1, 1, 1, 1,
1.378045, 0.9838509, -0.1209063, 1, 1, 1, 1, 1,
1.381631, 0.8298262, 0.09313169, 1, 1, 1, 1, 1,
1.382329, 1.133312, 1.913899, 1, 1, 1, 1, 1,
1.383388, -0.04726548, 4.270248, 1, 1, 1, 1, 1,
1.385681, 0.4143614, 1.856451, 1, 1, 1, 1, 1,
1.389666, 0.6470441, 0.5866218, 1, 1, 1, 1, 1,
1.392965, 0.3790171, -0.09384649, 1, 1, 1, 1, 1,
1.398485, -0.3076169, 0.5935417, 1, 1, 1, 1, 1,
1.403893, -0.3131432, 2.538985, 0, 0, 1, 1, 1,
1.418343, -0.565485, 1.298823, 1, 0, 0, 1, 1,
1.423907, -0.4983942, 2.230089, 1, 0, 0, 1, 1,
1.425806, 0.5613535, 1.573834, 1, 0, 0, 1, 1,
1.432839, -0.7257856, 1.1594, 1, 0, 0, 1, 1,
1.435227, 0.3783959, 1.944389, 1, 0, 0, 1, 1,
1.43551, -1.413881, 1.496811, 0, 0, 0, 1, 1,
1.445108, -1.04102, 3.483687, 0, 0, 0, 1, 1,
1.445926, 0.03206613, 1.320465, 0, 0, 0, 1, 1,
1.456115, -0.1564563, 1.696059, 0, 0, 0, 1, 1,
1.459558, -0.4505194, 2.542318, 0, 0, 0, 1, 1,
1.4598, -2.480633, 1.39981, 0, 0, 0, 1, 1,
1.463033, -0.8908169, 0.8478838, 0, 0, 0, 1, 1,
1.481684, -0.3759367, 1.696992, 1, 1, 1, 1, 1,
1.486761, -0.7722939, 0.03885138, 1, 1, 1, 1, 1,
1.490842, -0.7499397, 2.63619, 1, 1, 1, 1, 1,
1.498207, -1.162003, 3.131282, 1, 1, 1, 1, 1,
1.51179, -1.579896, 2.209435, 1, 1, 1, 1, 1,
1.520545, 0.8650869, 0.3785137, 1, 1, 1, 1, 1,
1.522278, -0.2870601, 1.956822, 1, 1, 1, 1, 1,
1.52229, 0.3696706, 1.228022, 1, 1, 1, 1, 1,
1.529684, 0.1473249, 1.476587, 1, 1, 1, 1, 1,
1.539002, -0.7813792, 1.432203, 1, 1, 1, 1, 1,
1.548416, 0.3894763, 0.2776443, 1, 1, 1, 1, 1,
1.549724, -1.140742, 2.587624, 1, 1, 1, 1, 1,
1.556106, 0.3392676, 0.05741243, 1, 1, 1, 1, 1,
1.558834, 2.5667, 0.5298809, 1, 1, 1, 1, 1,
1.566163, 0.3025354, 0.2010633, 1, 1, 1, 1, 1,
1.567913, -1.698354, 2.79383, 0, 0, 1, 1, 1,
1.578888, -2.251663, 2.237009, 1, 0, 0, 1, 1,
1.578908, 2.225144, 0.08713409, 1, 0, 0, 1, 1,
1.5816, 0.1851682, 0.4479226, 1, 0, 0, 1, 1,
1.582657, 0.3303517, -1.027261, 1, 0, 0, 1, 1,
1.583086, -0.03811539, 1.057677, 1, 0, 0, 1, 1,
1.585317, -1.551293, 2.741677, 0, 0, 0, 1, 1,
1.593239, 0.3321878, 0.9485549, 0, 0, 0, 1, 1,
1.607316, -0.8113598, 1.481641, 0, 0, 0, 1, 1,
1.611413, 0.3782714, -0.008289049, 0, 0, 0, 1, 1,
1.621222, -0.1090891, 3.364706, 0, 0, 0, 1, 1,
1.624143, 0.9986411, 0.4732655, 0, 0, 0, 1, 1,
1.62481, -0.5745895, 2.299623, 0, 0, 0, 1, 1,
1.628474, -1.030878, 3.240028, 1, 1, 1, 1, 1,
1.649581, 1.60243, 1.62466, 1, 1, 1, 1, 1,
1.659576, 0.4589016, 0.07965622, 1, 1, 1, 1, 1,
1.664999, 0.7821408, 1.195545, 1, 1, 1, 1, 1,
1.678657, 1.612089, -0.3682716, 1, 1, 1, 1, 1,
1.683625, 0.5450309, 2.579126, 1, 1, 1, 1, 1,
1.703067, -2.343962, 5.079491, 1, 1, 1, 1, 1,
1.714688, 0.4293194, 3.395928, 1, 1, 1, 1, 1,
1.715419, -0.2525139, 1.109891, 1, 1, 1, 1, 1,
1.718037, -0.7036382, 2.258223, 1, 1, 1, 1, 1,
1.723233, -1.658992, 3.407792, 1, 1, 1, 1, 1,
1.730031, -0.6588318, 2.651434, 1, 1, 1, 1, 1,
1.760046, 0.4661744, 1.714908, 1, 1, 1, 1, 1,
1.77077, -0.8866938, 1.106818, 1, 1, 1, 1, 1,
1.786203, -0.8905233, 2.045926, 1, 1, 1, 1, 1,
1.79885, 0.3512513, 1.068286, 0, 0, 1, 1, 1,
1.802774, -0.6477627, 2.357298, 1, 0, 0, 1, 1,
1.80319, -0.4362405, 1.748551, 1, 0, 0, 1, 1,
1.807871, 0.7077444, -0.008750845, 1, 0, 0, 1, 1,
1.810801, -0.1587852, 1.021782, 1, 0, 0, 1, 1,
1.816592, -2.0934, 1.438321, 1, 0, 0, 1, 1,
1.832432, -0.5761366, 2.632453, 0, 0, 0, 1, 1,
1.858526, 2.025162, 2.390437, 0, 0, 0, 1, 1,
1.859686, -0.6009423, 2.706105, 0, 0, 0, 1, 1,
1.864276, 0.5758464, 2.050256, 0, 0, 0, 1, 1,
1.870534, -0.5850421, 0.3469953, 0, 0, 0, 1, 1,
1.875971, 2.852803, -0.2604232, 0, 0, 0, 1, 1,
1.876355, -2.440174, 1.368092, 0, 0, 0, 1, 1,
1.877605, -1.325909, 3.677315, 1, 1, 1, 1, 1,
1.881983, 1.497726, 1.319568, 1, 1, 1, 1, 1,
1.883928, -0.6214897, 0.9627581, 1, 1, 1, 1, 1,
1.886144, 0.4620668, 1.737451, 1, 1, 1, 1, 1,
1.8924, -0.9450575, 2.137727, 1, 1, 1, 1, 1,
1.895294, -1.105983, 1.890489, 1, 1, 1, 1, 1,
1.896964, -0.57896, 3.278751, 1, 1, 1, 1, 1,
1.902091, -0.1584805, 1.123854, 1, 1, 1, 1, 1,
1.902234, 0.1195743, 2.350884, 1, 1, 1, 1, 1,
1.910152, -0.5718105, 3.687749, 1, 1, 1, 1, 1,
1.917434, -1.813031, 1.825086, 1, 1, 1, 1, 1,
1.918125, -0.1508181, 3.786188, 1, 1, 1, 1, 1,
1.920921, 0.6429371, 2.218641, 1, 1, 1, 1, 1,
1.980459, 0.8105785, 1.359559, 1, 1, 1, 1, 1,
1.987659, 1.233868, 0.7499749, 1, 1, 1, 1, 1,
1.993739, -0.8220181, 1.509876, 0, 0, 1, 1, 1,
2.000683, 1.050059, 2.214594, 1, 0, 0, 1, 1,
2.099048, 1.006589, -0.2322031, 1, 0, 0, 1, 1,
2.124715, 0.9585001, 2.61272, 1, 0, 0, 1, 1,
2.125552, 3.030581, 0.7884285, 1, 0, 0, 1, 1,
2.127337, -0.1004057, 0.4051008, 1, 0, 0, 1, 1,
2.128385, 0.05586537, 2.010137, 0, 0, 0, 1, 1,
2.20776, -1.021606, 2.66747, 0, 0, 0, 1, 1,
2.257628, -1.113257, 2.765148, 0, 0, 0, 1, 1,
2.283951, 0.2342245, 2.388029, 0, 0, 0, 1, 1,
2.324801, -0.6905209, 1.871231, 0, 0, 0, 1, 1,
2.325041, -1.038796, 1.296376, 0, 0, 0, 1, 1,
2.35279, 0.01934687, 2.318978, 0, 0, 0, 1, 1,
2.466995, 1.041098, 0.3339089, 1, 1, 1, 1, 1,
2.472922, 1.036012, -0.3066299, 1, 1, 1, 1, 1,
2.612096, 0.2548743, 1.140592, 1, 1, 1, 1, 1,
2.722098, -1.592947, 0.8860596, 1, 1, 1, 1, 1,
2.780467, 0.4859632, 0.8154005, 1, 1, 1, 1, 1,
2.880732, 1.536333, 1.896996, 1, 1, 1, 1, 1,
3.338403, -1.705698, 1.355429, 1, 1, 1, 1, 1
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
var radius = 9.527845;
var distance = 33.46615;
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
mvMatrix.translate( 0.3025188, -0.06010795, -0.3398843 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.46615);
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
