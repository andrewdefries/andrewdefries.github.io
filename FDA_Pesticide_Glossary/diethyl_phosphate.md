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
-2.917001, 0.05432138, -1.115437, 1, 0, 0, 1,
-2.695238, 1.392375, -0.1218524, 1, 0.007843138, 0, 1,
-2.54866, 1.475619, -1.172791, 1, 0.01176471, 0, 1,
-2.526316, -0.3798848, -1.510504, 1, 0.01960784, 0, 1,
-2.496805, 2.53883, 0.74229, 1, 0.02352941, 0, 1,
-2.467092, -0.2295976, -1.974478, 1, 0.03137255, 0, 1,
-2.391114, 0.8340476, -4.085502, 1, 0.03529412, 0, 1,
-2.288802, 0.9029222, -0.9448131, 1, 0.04313726, 0, 1,
-2.266607, -0.2219918, -2.229985, 1, 0.04705882, 0, 1,
-2.262375, 0.8754693, -1.227703, 1, 0.05490196, 0, 1,
-2.240356, 0.1619134, -0.2753854, 1, 0.05882353, 0, 1,
-2.224623, 0.3353201, -1.253165, 1, 0.06666667, 0, 1,
-2.196944, 0.0006805477, -1.462066, 1, 0.07058824, 0, 1,
-2.182358, -0.3441081, -1.167869, 1, 0.07843138, 0, 1,
-2.164099, 0.3126489, -2.253372, 1, 0.08235294, 0, 1,
-2.126626, -1.28335, -0.8330134, 1, 0.09019608, 0, 1,
-2.121125, 0.994969, -1.791604, 1, 0.09411765, 0, 1,
-2.113218, -1.585255, -2.282981, 1, 0.1019608, 0, 1,
-2.085544, 0.5792365, -1.838713, 1, 0.1098039, 0, 1,
-2.080188, 0.8241992, -0.9752234, 1, 0.1137255, 0, 1,
-2.061656, -2.154129, -1.657311, 1, 0.1215686, 0, 1,
-2.050748, 0.1228809, -2.211945, 1, 0.1254902, 0, 1,
-2.049947, -0.1931096, -1.647052, 1, 0.1333333, 0, 1,
-2.04428, -1.36394, -1.864201, 1, 0.1372549, 0, 1,
-2.008716, -2.788231, -3.353299, 1, 0.145098, 0, 1,
-2.002989, 0.6979829, -1.553407, 1, 0.1490196, 0, 1,
-2.002532, 1.467067, -0.9766884, 1, 0.1568628, 0, 1,
-1.973748, 0.6909399, -0.9313622, 1, 0.1607843, 0, 1,
-1.972512, -0.8274133, -2.64951, 1, 0.1686275, 0, 1,
-1.946672, 0.00060045, -0.4302283, 1, 0.172549, 0, 1,
-1.934598, -0.4444956, -1.728657, 1, 0.1803922, 0, 1,
-1.924845, 1.126217, -2.694233, 1, 0.1843137, 0, 1,
-1.916467, 0.4981065, -0.7133846, 1, 0.1921569, 0, 1,
-1.900588, 1.574146, -0.277721, 1, 0.1960784, 0, 1,
-1.87308, 0.1302617, -2.079222, 1, 0.2039216, 0, 1,
-1.870588, 1.616578, -1.432441, 1, 0.2117647, 0, 1,
-1.870405, 0.211596, -1.101879, 1, 0.2156863, 0, 1,
-1.868298, 0.9976453, -0.8946285, 1, 0.2235294, 0, 1,
-1.865649, 0.5913673, -2.948907, 1, 0.227451, 0, 1,
-1.863163, 0.3470277, -1.182686, 1, 0.2352941, 0, 1,
-1.838511, 1.069605, 0.9937304, 1, 0.2392157, 0, 1,
-1.795314, 0.5008987, -1.511821, 1, 0.2470588, 0, 1,
-1.781213, -0.3874686, -0.1526487, 1, 0.2509804, 0, 1,
-1.781189, -1.203034, -4.086145, 1, 0.2588235, 0, 1,
-1.773468, 1.586903, -0.6404462, 1, 0.2627451, 0, 1,
-1.740974, 2.417315, -0.4620105, 1, 0.2705882, 0, 1,
-1.737755, 0.1345465, -0.9078165, 1, 0.2745098, 0, 1,
-1.724828, 0.01962966, -1.246862, 1, 0.282353, 0, 1,
-1.724599, 1.08913, -1.140865, 1, 0.2862745, 0, 1,
-1.708938, 0.9532116, 0.07796104, 1, 0.2941177, 0, 1,
-1.703605, -0.4159996, -1.429081, 1, 0.3019608, 0, 1,
-1.700161, -0.292188, -3.755513, 1, 0.3058824, 0, 1,
-1.6982, 0.8050922, -0.7048953, 1, 0.3137255, 0, 1,
-1.684788, -0.4546753, -4.053212, 1, 0.3176471, 0, 1,
-1.670395, 0.04116415, -3.346954, 1, 0.3254902, 0, 1,
-1.668354, 0.37713, -0.92419, 1, 0.3294118, 0, 1,
-1.636863, 1.666239, 1.022659, 1, 0.3372549, 0, 1,
-1.624135, 1.731929, -0.8736688, 1, 0.3411765, 0, 1,
-1.620314, -1.214527, -0.4309425, 1, 0.3490196, 0, 1,
-1.613128, -0.006917445, -1.877587, 1, 0.3529412, 0, 1,
-1.608098, 0.190416, -0.9256525, 1, 0.3607843, 0, 1,
-1.604312, -0.3822564, -2.020415, 1, 0.3647059, 0, 1,
-1.600647, -1.56643, -1.793726, 1, 0.372549, 0, 1,
-1.596886, -0.700173, -3.066683, 1, 0.3764706, 0, 1,
-1.584975, -0.4515709, -0.2121208, 1, 0.3843137, 0, 1,
-1.572218, -1.209123, -3.238181, 1, 0.3882353, 0, 1,
-1.568904, -0.3577131, -2.558204, 1, 0.3960784, 0, 1,
-1.54842, 0.3559431, -1.990421, 1, 0.4039216, 0, 1,
-1.547161, 0.639242, -1.220896, 1, 0.4078431, 0, 1,
-1.543648, 2.255483, 0.04256903, 1, 0.4156863, 0, 1,
-1.540622, 1.026741, 0.6953954, 1, 0.4196078, 0, 1,
-1.538934, -0.6585281, -0.5166357, 1, 0.427451, 0, 1,
-1.525726, 0.9222373, -1.177886, 1, 0.4313726, 0, 1,
-1.508716, 0.7705453, -0.7303069, 1, 0.4392157, 0, 1,
-1.498675, -0.1147469, -1.626624, 1, 0.4431373, 0, 1,
-1.495739, 0.7052816, -1.222766, 1, 0.4509804, 0, 1,
-1.483142, -0.8838191, -3.376056, 1, 0.454902, 0, 1,
-1.482542, -0.4169132, -3.039121, 1, 0.4627451, 0, 1,
-1.481881, 1.223048, -0.8678451, 1, 0.4666667, 0, 1,
-1.4726, 0.4326203, -1.236922, 1, 0.4745098, 0, 1,
-1.466717, 1.341334, -2.439128, 1, 0.4784314, 0, 1,
-1.422167, -1.741264, -3.935104, 1, 0.4862745, 0, 1,
-1.415684, -0.760082, -1.385501, 1, 0.4901961, 0, 1,
-1.399605, -1.141277, -2.8336, 1, 0.4980392, 0, 1,
-1.398949, 0.8844559, -1.336127, 1, 0.5058824, 0, 1,
-1.397309, -2.337241, -2.579967, 1, 0.509804, 0, 1,
-1.391594, -1.428785, -1.504135, 1, 0.5176471, 0, 1,
-1.388621, 1.241593, -0.2573609, 1, 0.5215687, 0, 1,
-1.388447, -0.02222905, -0.3317837, 1, 0.5294118, 0, 1,
-1.380505, 1.490464, -1.291109, 1, 0.5333334, 0, 1,
-1.372404, -0.2557016, -2.26739, 1, 0.5411765, 0, 1,
-1.371791, -0.8518496, -2.381298, 1, 0.5450981, 0, 1,
-1.368313, -0.5567557, -0.2981835, 1, 0.5529412, 0, 1,
-1.356501, 0.2858117, -1.690672, 1, 0.5568628, 0, 1,
-1.347608, -0.6398014, -2.937502, 1, 0.5647059, 0, 1,
-1.347113, -0.4916112, -1.384425, 1, 0.5686275, 0, 1,
-1.327892, -0.4287258, -1.547034, 1, 0.5764706, 0, 1,
-1.32782, -1.030111, -2.994257, 1, 0.5803922, 0, 1,
-1.323977, -2.248581, -0.6497644, 1, 0.5882353, 0, 1,
-1.323613, 0.1338277, -2.262096, 1, 0.5921569, 0, 1,
-1.317992, 1.2201, -2.546801, 1, 0.6, 0, 1,
-1.289677, 3.1545, -0.4338045, 1, 0.6078432, 0, 1,
-1.278653, -0.2515467, -1.581651, 1, 0.6117647, 0, 1,
-1.263696, 0.7499791, 0.1081741, 1, 0.6196079, 0, 1,
-1.240021, 1.132537, -2.164043, 1, 0.6235294, 0, 1,
-1.229188, 0.3360706, -0.007905963, 1, 0.6313726, 0, 1,
-1.222754, 0.1662702, -0.4057521, 1, 0.6352941, 0, 1,
-1.217678, -0.4085449, -3.012, 1, 0.6431373, 0, 1,
-1.211794, -1.653899, -2.214039, 1, 0.6470588, 0, 1,
-1.21132, 0.006813799, -1.789517, 1, 0.654902, 0, 1,
-1.203803, -2.548633, -1.852592, 1, 0.6588235, 0, 1,
-1.201074, 1.19422, -1.335802, 1, 0.6666667, 0, 1,
-1.200711, -0.2859235, -3.391271, 1, 0.6705883, 0, 1,
-1.199545, -0.5858675, 1.074036, 1, 0.6784314, 0, 1,
-1.197408, -1.069245, -2.894277, 1, 0.682353, 0, 1,
-1.188619, -1.894141, -2.69547, 1, 0.6901961, 0, 1,
-1.182729, 1.287644, -0.9665299, 1, 0.6941177, 0, 1,
-1.180131, -0.1788728, -1.805419, 1, 0.7019608, 0, 1,
-1.178986, 0.4209549, -1.009626, 1, 0.7098039, 0, 1,
-1.176261, -0.141274, -1.074793, 1, 0.7137255, 0, 1,
-1.173198, -0.7232919, -0.8828592, 1, 0.7215686, 0, 1,
-1.171197, -0.7360412, -2.566864, 1, 0.7254902, 0, 1,
-1.167621, 0.1318502, -2.22438, 1, 0.7333333, 0, 1,
-1.160399, 1.54813, -1.178012, 1, 0.7372549, 0, 1,
-1.154622, -1.920696, -2.768963, 1, 0.7450981, 0, 1,
-1.154207, 0.8291411, -0.6438265, 1, 0.7490196, 0, 1,
-1.148722, -0.7186593, -2.376274, 1, 0.7568628, 0, 1,
-1.142332, 1.094898, -0.9933785, 1, 0.7607843, 0, 1,
-1.135457, 1.485549, -1.295103, 1, 0.7686275, 0, 1,
-1.132421, 1.636297, 0.3328304, 1, 0.772549, 0, 1,
-1.114304, 1.182149, -0.6649721, 1, 0.7803922, 0, 1,
-1.112445, -1.713651, -1.31814, 1, 0.7843137, 0, 1,
-1.111215, -1.980501, -3.822931, 1, 0.7921569, 0, 1,
-1.108065, 0.6272897, -2.433041, 1, 0.7960784, 0, 1,
-1.104921, -0.08121045, -2.176246, 1, 0.8039216, 0, 1,
-1.102765, 0.1676236, -1.786175, 1, 0.8117647, 0, 1,
-1.101427, -0.5356353, -4.30842, 1, 0.8156863, 0, 1,
-1.10051, 0.9491583, -1.505967, 1, 0.8235294, 0, 1,
-1.096598, 0.2857622, -1.123664, 1, 0.827451, 0, 1,
-1.09538, -1.589161, -2.901656, 1, 0.8352941, 0, 1,
-1.095075, 1.917084, -0.2102801, 1, 0.8392157, 0, 1,
-1.091083, 0.3567225, -1.807829, 1, 0.8470588, 0, 1,
-1.090712, 0.03550731, -2.185853, 1, 0.8509804, 0, 1,
-1.086498, -0.6059121, -4.407022, 1, 0.8588235, 0, 1,
-1.086269, 0.9391774, -1.042683, 1, 0.8627451, 0, 1,
-1.07869, 0.372592, -2.166432, 1, 0.8705882, 0, 1,
-1.077124, 0.5963519, -3.110325, 1, 0.8745098, 0, 1,
-1.076975, -0.2703327, -3.246289, 1, 0.8823529, 0, 1,
-1.076466, -1.532525, -3.432191, 1, 0.8862745, 0, 1,
-1.058941, 0.5906411, -0.3999706, 1, 0.8941177, 0, 1,
-1.058338, -1.05553, -2.540527, 1, 0.8980392, 0, 1,
-1.053804, -0.3277374, -0.945433, 1, 0.9058824, 0, 1,
-1.047475, -1.100558, -1.238708, 1, 0.9137255, 0, 1,
-1.044381, -0.5716251, -2.319813, 1, 0.9176471, 0, 1,
-1.042843, -0.7868578, -2.209182, 1, 0.9254902, 0, 1,
-1.02847, 0.9068376, -0.5538992, 1, 0.9294118, 0, 1,
-1.02192, 1.54508, -0.1193375, 1, 0.9372549, 0, 1,
-1.018343, 0.3276243, 0.9848815, 1, 0.9411765, 0, 1,
-1.012147, 0.4091531, -3.048217, 1, 0.9490196, 0, 1,
-1.010535, 0.002411391, -2.267463, 1, 0.9529412, 0, 1,
-1.009632, -1.110406, -2.790324, 1, 0.9607843, 0, 1,
-1.00897, -0.6393005, -3.096431, 1, 0.9647059, 0, 1,
-1.007447, -0.4795031, -3.29226, 1, 0.972549, 0, 1,
-0.9963664, 0.9817424, 0.1785235, 1, 0.9764706, 0, 1,
-0.9882841, -0.1837443, -1.305813, 1, 0.9843137, 0, 1,
-0.9879287, 0.4522019, -0.2403725, 1, 0.9882353, 0, 1,
-0.9863251, 0.6816671, -0.7731554, 1, 0.9960784, 0, 1,
-0.9814104, 0.2770082, -3.025967, 0.9960784, 1, 0, 1,
-0.9782577, -1.162936, -1.782392, 0.9921569, 1, 0, 1,
-0.9617553, -0.1517479, -0.514836, 0.9843137, 1, 0, 1,
-0.955905, 0.4041609, -0.02510679, 0.9803922, 1, 0, 1,
-0.9516602, -0.4584585, -1.669909, 0.972549, 1, 0, 1,
-0.9438725, 0.5841037, -1.372208, 0.9686275, 1, 0, 1,
-0.9400878, -1.519586, -2.955487, 0.9607843, 1, 0, 1,
-0.9318143, -0.4753214, -3.651068, 0.9568627, 1, 0, 1,
-0.9303961, 1.291155, -2.198304, 0.9490196, 1, 0, 1,
-0.9282606, 0.9248059, -3.099147, 0.945098, 1, 0, 1,
-0.9244127, -0.4851404, -1.674696, 0.9372549, 1, 0, 1,
-0.9203913, 1.56278, -0.7555302, 0.9333333, 1, 0, 1,
-0.9141065, -0.5626235, -3.115444, 0.9254902, 1, 0, 1,
-0.913187, -1.009668, -4.664698, 0.9215686, 1, 0, 1,
-0.9118658, -0.9792636, -2.610252, 0.9137255, 1, 0, 1,
-0.9016922, -0.1358417, -0.7421356, 0.9098039, 1, 0, 1,
-0.8995197, 1.143986, -1.169735, 0.9019608, 1, 0, 1,
-0.8943712, 1.931138, -0.4570763, 0.8941177, 1, 0, 1,
-0.8929288, 0.8154916, -0.3468284, 0.8901961, 1, 0, 1,
-0.8916935, 0.914885, -1.115532, 0.8823529, 1, 0, 1,
-0.8816271, -0.5934429, -1.535961, 0.8784314, 1, 0, 1,
-0.8627026, -0.369209, -1.144465, 0.8705882, 1, 0, 1,
-0.8507175, -0.2488106, -3.016467, 0.8666667, 1, 0, 1,
-0.8504491, 1.376866, -0.5891758, 0.8588235, 1, 0, 1,
-0.8456416, 1.085746, 0.8067102, 0.854902, 1, 0, 1,
-0.8449683, -0.3217629, 0.9163642, 0.8470588, 1, 0, 1,
-0.8421865, -1.465275, -0.9518766, 0.8431373, 1, 0, 1,
-0.841434, 0.8155565, -0.134887, 0.8352941, 1, 0, 1,
-0.8405324, 0.5159164, -0.7185727, 0.8313726, 1, 0, 1,
-0.8315834, -1.030732, -3.945284, 0.8235294, 1, 0, 1,
-0.8311725, -1.061358, -1.651253, 0.8196079, 1, 0, 1,
-0.8299476, -0.8917432, -4.701982, 0.8117647, 1, 0, 1,
-0.8276024, -0.01251272, -1.397768, 0.8078431, 1, 0, 1,
-0.813143, -0.2180338, -2.312581, 0.8, 1, 0, 1,
-0.812534, -1.539317, -1.972344, 0.7921569, 1, 0, 1,
-0.8088766, -1.188275, 0.4168221, 0.7882353, 1, 0, 1,
-0.8072128, 0.6633008, -0.7098552, 0.7803922, 1, 0, 1,
-0.8059415, 0.2617372, -3.733845, 0.7764706, 1, 0, 1,
-0.7992558, 0.2416894, -0.6048983, 0.7686275, 1, 0, 1,
-0.7950205, -0.5220487, -1.224295, 0.7647059, 1, 0, 1,
-0.7932575, 1.818077, -0.2602431, 0.7568628, 1, 0, 1,
-0.7926334, 0.5548651, -0.3473215, 0.7529412, 1, 0, 1,
-0.7903306, -0.9386647, -1.600395, 0.7450981, 1, 0, 1,
-0.7899199, -1.001178, -3.396972, 0.7411765, 1, 0, 1,
-0.788264, 0.68042, -0.1810674, 0.7333333, 1, 0, 1,
-0.7866867, -0.1685002, -1.446479, 0.7294118, 1, 0, 1,
-0.7842378, 1.417443, -1.169982, 0.7215686, 1, 0, 1,
-0.7823868, 0.4840279, -0.9730892, 0.7176471, 1, 0, 1,
-0.7821653, 2.222777, -0.3477564, 0.7098039, 1, 0, 1,
-0.7784805, 0.07177132, -1.508797, 0.7058824, 1, 0, 1,
-0.7727662, 0.7784607, -0.2075135, 0.6980392, 1, 0, 1,
-0.7724178, -0.2633954, -1.294756, 0.6901961, 1, 0, 1,
-0.7716962, 0.5146846, -2.059447, 0.6862745, 1, 0, 1,
-0.7697225, 0.3242898, -0.7751021, 0.6784314, 1, 0, 1,
-0.7621676, -1.417333, -2.781071, 0.6745098, 1, 0, 1,
-0.7580662, -0.9073995, -2.578644, 0.6666667, 1, 0, 1,
-0.7521312, 1.350505, -0.5806043, 0.6627451, 1, 0, 1,
-0.7467411, -0.06378346, -0.8446539, 0.654902, 1, 0, 1,
-0.7427688, -0.04728609, -1.341259, 0.6509804, 1, 0, 1,
-0.7408204, 0.4515669, -1.238193, 0.6431373, 1, 0, 1,
-0.7399884, 0.3120354, -1.221933, 0.6392157, 1, 0, 1,
-0.7351155, 0.3778225, -0.5537877, 0.6313726, 1, 0, 1,
-0.7348402, -1.258412, -5.330091, 0.627451, 1, 0, 1,
-0.7335415, -0.6439078, -3.5005, 0.6196079, 1, 0, 1,
-0.7311365, -0.2493975, -4.400727, 0.6156863, 1, 0, 1,
-0.7302297, -0.3623964, -3.67151, 0.6078432, 1, 0, 1,
-0.727155, -1.307975, -3.067787, 0.6039216, 1, 0, 1,
-0.7240179, -1.186947, -3.059303, 0.5960785, 1, 0, 1,
-0.7239785, 0.03930009, -1.090415, 0.5882353, 1, 0, 1,
-0.723947, 0.01453082, -1.491237, 0.5843138, 1, 0, 1,
-0.7086015, -0.05544999, -1.424397, 0.5764706, 1, 0, 1,
-0.7064148, -0.2757681, -0.3699847, 0.572549, 1, 0, 1,
-0.7052612, -0.4703741, -3.081844, 0.5647059, 1, 0, 1,
-0.6998336, -0.4616346, -1.781566, 0.5607843, 1, 0, 1,
-0.6993682, -1.560893, -1.301731, 0.5529412, 1, 0, 1,
-0.6993251, -1.330055, -2.133779, 0.5490196, 1, 0, 1,
-0.6958525, -1.624307, -3.649189, 0.5411765, 1, 0, 1,
-0.6943142, 0.1397486, -0.1421867, 0.5372549, 1, 0, 1,
-0.6907807, -2.265885, -1.884251, 0.5294118, 1, 0, 1,
-0.6891761, 0.04549796, -2.527221, 0.5254902, 1, 0, 1,
-0.687535, -0.4052501, -4.239827, 0.5176471, 1, 0, 1,
-0.6872005, 0.1587191, -1.604076, 0.5137255, 1, 0, 1,
-0.6816525, -0.9302544, -1.052435, 0.5058824, 1, 0, 1,
-0.681155, 0.01341947, -0.3450879, 0.5019608, 1, 0, 1,
-0.6782058, -0.3344308, -2.53759, 0.4941176, 1, 0, 1,
-0.6747452, 0.2135295, -0.8648137, 0.4862745, 1, 0, 1,
-0.6715407, -1.059649, -2.129473, 0.4823529, 1, 0, 1,
-0.6695595, -0.538338, -1.809313, 0.4745098, 1, 0, 1,
-0.6682556, 0.07811965, -2.191841, 0.4705882, 1, 0, 1,
-0.6632975, 1.28087, -0.3077939, 0.4627451, 1, 0, 1,
-0.6620709, -0.5672587, -3.003366, 0.4588235, 1, 0, 1,
-0.6598782, 1.837986, -0.1260254, 0.4509804, 1, 0, 1,
-0.6548784, -2.493681, -4.391176, 0.4470588, 1, 0, 1,
-0.6540986, 0.1502601, -0.5003599, 0.4392157, 1, 0, 1,
-0.6390918, -0.1018364, -2.485786, 0.4352941, 1, 0, 1,
-0.635639, 0.05124914, -2.69482, 0.427451, 1, 0, 1,
-0.6351416, 1.642618, -1.336258, 0.4235294, 1, 0, 1,
-0.6343277, 0.008014848, -0.5713918, 0.4156863, 1, 0, 1,
-0.6213098, -0.5247161, -4.622159, 0.4117647, 1, 0, 1,
-0.6169478, 0.4693142, -1.273798, 0.4039216, 1, 0, 1,
-0.6145705, 0.06353796, -1.237018, 0.3960784, 1, 0, 1,
-0.6091809, -2.53101, -2.532723, 0.3921569, 1, 0, 1,
-0.6081371, -0.23354, -2.848094, 0.3843137, 1, 0, 1,
-0.6080894, 0.3765264, -1.400479, 0.3803922, 1, 0, 1,
-0.6051943, 0.5072681, -1.537052, 0.372549, 1, 0, 1,
-0.5986328, 0.4132711, -0.6764559, 0.3686275, 1, 0, 1,
-0.5951489, -0.7038258, -2.743064, 0.3607843, 1, 0, 1,
-0.5893955, 0.8464592, -1.148123, 0.3568628, 1, 0, 1,
-0.5855724, 0.02289501, -0.7388033, 0.3490196, 1, 0, 1,
-0.5816051, 0.2149919, -0.1670073, 0.345098, 1, 0, 1,
-0.578968, -0.6429152, -1.887283, 0.3372549, 1, 0, 1,
-0.5734391, -0.008331232, -0.6557373, 0.3333333, 1, 0, 1,
-0.5720066, -1.831413, -4.694075, 0.3254902, 1, 0, 1,
-0.5714268, -2.363081, -3.457727, 0.3215686, 1, 0, 1,
-0.5708026, -1.637927, -2.052119, 0.3137255, 1, 0, 1,
-0.5664204, 0.4463431, -2.243665, 0.3098039, 1, 0, 1,
-0.5662398, 0.5821304, -0.7000985, 0.3019608, 1, 0, 1,
-0.5658296, -0.5784428, -3.507896, 0.2941177, 1, 0, 1,
-0.5621142, -0.4554223, -1.33272, 0.2901961, 1, 0, 1,
-0.5601485, -1.108103, -2.222116, 0.282353, 1, 0, 1,
-0.5583115, 0.6098524, -0.5760974, 0.2784314, 1, 0, 1,
-0.5560976, 0.1197326, -3.51238, 0.2705882, 1, 0, 1,
-0.5554758, 0.28125, -1.472502, 0.2666667, 1, 0, 1,
-0.5537896, -0.2513367, -3.755861, 0.2588235, 1, 0, 1,
-0.553408, -0.3796436, -2.715971, 0.254902, 1, 0, 1,
-0.5463188, -0.3223269, -2.210436, 0.2470588, 1, 0, 1,
-0.5462656, -0.4125839, -2.846832, 0.2431373, 1, 0, 1,
-0.5417389, 0.7459456, -1.428876, 0.2352941, 1, 0, 1,
-0.5368833, 2.262853, -0.5797855, 0.2313726, 1, 0, 1,
-0.5349247, -0.6004446, -1.487964, 0.2235294, 1, 0, 1,
-0.5343808, 0.08751084, -0.3336372, 0.2196078, 1, 0, 1,
-0.5311244, 0.7385021, -2.083163, 0.2117647, 1, 0, 1,
-0.5302764, 0.3052568, -1.46508, 0.2078431, 1, 0, 1,
-0.528604, -0.6792065, -1.54672, 0.2, 1, 0, 1,
-0.5250929, 1.314213, -0.6204736, 0.1921569, 1, 0, 1,
-0.5200679, -0.2914252, -3.225788, 0.1882353, 1, 0, 1,
-0.5159955, 0.759901, 0.6212645, 0.1803922, 1, 0, 1,
-0.5135181, -1.182693, -3.841101, 0.1764706, 1, 0, 1,
-0.512761, -0.571523, -3.310975, 0.1686275, 1, 0, 1,
-0.5125578, -0.3940756, -3.045426, 0.1647059, 1, 0, 1,
-0.5123873, -1.431968, -3.259676, 0.1568628, 1, 0, 1,
-0.5123752, 2.568258, 0.5636427, 0.1529412, 1, 0, 1,
-0.5111293, -1.320377, -3.087256, 0.145098, 1, 0, 1,
-0.5104313, 1.552237, -0.1467094, 0.1411765, 1, 0, 1,
-0.5065091, -1.446706, -2.20348, 0.1333333, 1, 0, 1,
-0.5054587, -0.08539197, -1.374869, 0.1294118, 1, 0, 1,
-0.5035015, -0.3693255, -3.372845, 0.1215686, 1, 0, 1,
-0.4967975, 1.777566, 2.032405, 0.1176471, 1, 0, 1,
-0.4959287, -0.09456725, -3.306005, 0.1098039, 1, 0, 1,
-0.4916271, -0.01122436, -0.3200307, 0.1058824, 1, 0, 1,
-0.4862051, 0.4778583, -1.610335, 0.09803922, 1, 0, 1,
-0.4844539, -0.7060582, -3.195702, 0.09019608, 1, 0, 1,
-0.4840951, 0.2173505, -1.219515, 0.08627451, 1, 0, 1,
-0.4835171, 0.9197331, -1.884422, 0.07843138, 1, 0, 1,
-0.4823668, -1.888087, -3.8071, 0.07450981, 1, 0, 1,
-0.4809837, -2.02437, -1.775764, 0.06666667, 1, 0, 1,
-0.4808049, 0.6611962, 0.1393294, 0.0627451, 1, 0, 1,
-0.4785837, -0.2509792, -2.980579, 0.05490196, 1, 0, 1,
-0.4783691, -0.8488173, -4.031046, 0.05098039, 1, 0, 1,
-0.4751356, -0.188548, -1.668444, 0.04313726, 1, 0, 1,
-0.4718883, -1.636236, -2.410395, 0.03921569, 1, 0, 1,
-0.4711858, 0.5530561, -0.9384782, 0.03137255, 1, 0, 1,
-0.4691271, -1.402139, -2.479541, 0.02745098, 1, 0, 1,
-0.4570827, -0.5619094, -3.392475, 0.01960784, 1, 0, 1,
-0.455823, -1.219085, -1.894625, 0.01568628, 1, 0, 1,
-0.4520823, 1.053389, -0.4304383, 0.007843138, 1, 0, 1,
-0.446203, 1.599931, -1.191474, 0.003921569, 1, 0, 1,
-0.4425812, 0.2149055, -0.9405659, 0, 1, 0.003921569, 1,
-0.4414096, 0.7866119, 0.45273, 0, 1, 0.01176471, 1,
-0.4362309, -0.2651615, -1.221392, 0, 1, 0.01568628, 1,
-0.43335, 0.2441897, -1.100412, 0, 1, 0.02352941, 1,
-0.4308181, 1.347107, 0.1279223, 0, 1, 0.02745098, 1,
-0.4235341, 0.4064342, -1.79394, 0, 1, 0.03529412, 1,
-0.4122551, 1.796724, -0.1591339, 0, 1, 0.03921569, 1,
-0.40765, -2.263999, -2.256937, 0, 1, 0.04705882, 1,
-0.4042208, -1.040205, -3.195097, 0, 1, 0.05098039, 1,
-0.3975847, -0.3536547, -1.58843, 0, 1, 0.05882353, 1,
-0.3964584, 0.2651573, 0.2172705, 0, 1, 0.0627451, 1,
-0.3942931, -0.5214753, -2.453004, 0, 1, 0.07058824, 1,
-0.3922949, -0.673357, -2.212964, 0, 1, 0.07450981, 1,
-0.3826218, -0.7449945, -3.175439, 0, 1, 0.08235294, 1,
-0.3810991, 1.313978, -0.3425905, 0, 1, 0.08627451, 1,
-0.3806131, 1.769045, 0.1210158, 0, 1, 0.09411765, 1,
-0.3771213, -0.3130327, -0.4682746, 0, 1, 0.1019608, 1,
-0.3745456, -1.00286, -2.78883, 0, 1, 0.1058824, 1,
-0.3716416, 0.8058489, -0.4777707, 0, 1, 0.1137255, 1,
-0.3705914, 0.02399398, -0.7808482, 0, 1, 0.1176471, 1,
-0.3675205, -1.398503, -2.563364, 0, 1, 0.1254902, 1,
-0.365936, 1.259005, -0.6501522, 0, 1, 0.1294118, 1,
-0.36454, -0.3122656, -3.024221, 0, 1, 0.1372549, 1,
-0.3644605, 1.97438, -0.3340302, 0, 1, 0.1411765, 1,
-0.3622423, -1.324503, -3.495275, 0, 1, 0.1490196, 1,
-0.3614659, 1.623411, -1.214201, 0, 1, 0.1529412, 1,
-0.3534023, 1.770656, 0.1397485, 0, 1, 0.1607843, 1,
-0.3515179, -0.7555311, -3.338223, 0, 1, 0.1647059, 1,
-0.3505463, -0.6480633, -4.526049, 0, 1, 0.172549, 1,
-0.3503781, 1.291234, -1.329954, 0, 1, 0.1764706, 1,
-0.3488091, -0.8479472, -3.541919, 0, 1, 0.1843137, 1,
-0.3471631, -1.55726, -4.541041, 0, 1, 0.1882353, 1,
-0.3471204, -0.750652, -3.56834, 0, 1, 0.1960784, 1,
-0.3468458, -0.2685276, -0.2733689, 0, 1, 0.2039216, 1,
-0.3462945, -0.3980062, -1.743465, 0, 1, 0.2078431, 1,
-0.3425151, -0.4150724, -0.5492715, 0, 1, 0.2156863, 1,
-0.3400097, -0.4549164, -2.234823, 0, 1, 0.2196078, 1,
-0.3382657, -0.5726258, -2.903806, 0, 1, 0.227451, 1,
-0.3367767, -0.263367, -3.6431, 0, 1, 0.2313726, 1,
-0.3352752, -0.6714084, -3.216039, 0, 1, 0.2392157, 1,
-0.3341886, 0.666493, 0.2028881, 0, 1, 0.2431373, 1,
-0.3259823, -2.010057, -2.482604, 0, 1, 0.2509804, 1,
-0.3244403, -0.8683385, -3.974724, 0, 1, 0.254902, 1,
-0.3175597, -0.4824413, -2.199623, 0, 1, 0.2627451, 1,
-0.3170075, -1.294259, -1.224986, 0, 1, 0.2666667, 1,
-0.3116089, -2.021265, -3.119655, 0, 1, 0.2745098, 1,
-0.3098131, -1.433376, -3.313415, 0, 1, 0.2784314, 1,
-0.3096401, 0.6678109, -0.4923358, 0, 1, 0.2862745, 1,
-0.3094885, 0.7053207, -4.215945, 0, 1, 0.2901961, 1,
-0.3081665, -0.7301632, -3.346403, 0, 1, 0.2980392, 1,
-0.3047824, 0.396491, -0.5462005, 0, 1, 0.3058824, 1,
-0.3023814, -0.8838186, -1.91164, 0, 1, 0.3098039, 1,
-0.2992583, 0.5653138, -0.6100262, 0, 1, 0.3176471, 1,
-0.2954056, -3.775683, -0.2743247, 0, 1, 0.3215686, 1,
-0.2935988, 0.336741, -0.409668, 0, 1, 0.3294118, 1,
-0.2897447, 0.03354416, -2.430057, 0, 1, 0.3333333, 1,
-0.2850086, 0.6798402, 0.2476169, 0, 1, 0.3411765, 1,
-0.2807413, 0.4727741, 0.1016947, 0, 1, 0.345098, 1,
-0.2803803, -0.2911874, -3.417641, 0, 1, 0.3529412, 1,
-0.2785889, -0.009509387, -1.298677, 0, 1, 0.3568628, 1,
-0.2748114, -2.515368, -2.045897, 0, 1, 0.3647059, 1,
-0.2738155, -0.2054378, -2.402786, 0, 1, 0.3686275, 1,
-0.2732148, 0.6888458, -0.3692572, 0, 1, 0.3764706, 1,
-0.2717611, -1.256324, -1.598928, 0, 1, 0.3803922, 1,
-0.2709786, 0.813829, -0.5962508, 0, 1, 0.3882353, 1,
-0.2697999, 0.4076971, 0.2943381, 0, 1, 0.3921569, 1,
-0.2683488, -1.14451, -2.779618, 0, 1, 0.4, 1,
-0.2676592, -0.5301237, -3.06163, 0, 1, 0.4078431, 1,
-0.2675794, 0.7109322, -0.6187037, 0, 1, 0.4117647, 1,
-0.2672532, 1.405184, 0.976829, 0, 1, 0.4196078, 1,
-0.2660951, -1.118073, -3.961863, 0, 1, 0.4235294, 1,
-0.2659363, 1.724965, 0.2271365, 0, 1, 0.4313726, 1,
-0.2607038, 0.6630749, 1.565921, 0, 1, 0.4352941, 1,
-0.2606205, 0.8492296, 0.4871794, 0, 1, 0.4431373, 1,
-0.2574939, 0.2741767, -1.101708, 0, 1, 0.4470588, 1,
-0.2541851, -0.5643896, -3.671959, 0, 1, 0.454902, 1,
-0.2534323, -0.01640351, -2.940668, 0, 1, 0.4588235, 1,
-0.2515264, -0.5368842, -3.304917, 0, 1, 0.4666667, 1,
-0.250612, -0.02577933, -2.270315, 0, 1, 0.4705882, 1,
-0.2466224, -0.006935939, -2.012051, 0, 1, 0.4784314, 1,
-0.2436369, -0.3447477, -2.235765, 0, 1, 0.4823529, 1,
-0.2402592, -0.7875927, -2.031891, 0, 1, 0.4901961, 1,
-0.2397351, -0.3855382, -0.8336253, 0, 1, 0.4941176, 1,
-0.2392429, 0.408545, -0.5727227, 0, 1, 0.5019608, 1,
-0.2379587, -0.66527, -3.582865, 0, 1, 0.509804, 1,
-0.2349725, 2.261061, 0.07529265, 0, 1, 0.5137255, 1,
-0.2302049, -1.861282, -1.765018, 0, 1, 0.5215687, 1,
-0.2283092, 0.914106, -0.2551242, 0, 1, 0.5254902, 1,
-0.2261285, -1.191958, -3.220348, 0, 1, 0.5333334, 1,
-0.2239554, 0.08625418, -0.8957561, 0, 1, 0.5372549, 1,
-0.221291, 1.280769, -2.407691, 0, 1, 0.5450981, 1,
-0.2205826, 2.767128, 0.002025391, 0, 1, 0.5490196, 1,
-0.2160118, -0.3736109, -3.356376, 0, 1, 0.5568628, 1,
-0.2140137, -0.9506131, -3.491449, 0, 1, 0.5607843, 1,
-0.213699, -0.4976209, -4.936296, 0, 1, 0.5686275, 1,
-0.2125395, 0.3106089, 0.2502724, 0, 1, 0.572549, 1,
-0.2091991, -1.023161, -1.581139, 0, 1, 0.5803922, 1,
-0.2080646, 1.189706, -0.1716825, 0, 1, 0.5843138, 1,
-0.2068667, -0.7533525, -1.150478, 0, 1, 0.5921569, 1,
-0.205691, 1.429018, -0.750162, 0, 1, 0.5960785, 1,
-0.2043666, 0.06406879, -1.355444, 0, 1, 0.6039216, 1,
-0.2037599, 0.7126161, -1.354846, 0, 1, 0.6117647, 1,
-0.2015734, -0.5443505, -4.03417, 0, 1, 0.6156863, 1,
-0.2007495, -0.02851771, -3.61624, 0, 1, 0.6235294, 1,
-0.1990844, -1.827556, -1.319023, 0, 1, 0.627451, 1,
-0.1989094, 0.1647027, -0.7805967, 0, 1, 0.6352941, 1,
-0.1943974, 0.194695, -0.4814211, 0, 1, 0.6392157, 1,
-0.1906028, 0.3347782, -0.8658755, 0, 1, 0.6470588, 1,
-0.1872798, -0.6425521, -1.136543, 0, 1, 0.6509804, 1,
-0.1866894, -0.2958301, -1.823603, 0, 1, 0.6588235, 1,
-0.1853186, 0.6858206, 0.7225829, 0, 1, 0.6627451, 1,
-0.1849435, 0.1452971, -0.3187782, 0, 1, 0.6705883, 1,
-0.1712627, -0.1592534, -1.251494, 0, 1, 0.6745098, 1,
-0.1708016, 0.6381158, -0.8750365, 0, 1, 0.682353, 1,
-0.1650565, -1.23717, -3.079289, 0, 1, 0.6862745, 1,
-0.1644674, -1.683897, -3.189438, 0, 1, 0.6941177, 1,
-0.159624, 0.1395447, -1.054444, 0, 1, 0.7019608, 1,
-0.1557501, -0.7980328, -3.769726, 0, 1, 0.7058824, 1,
-0.1546408, -1.49172, -4.314343, 0, 1, 0.7137255, 1,
-0.1536747, -1.056353, -2.299749, 0, 1, 0.7176471, 1,
-0.1491106, -0.6108555, -3.74554, 0, 1, 0.7254902, 1,
-0.1491047, -1.685551, -3.20549, 0, 1, 0.7294118, 1,
-0.1484629, -0.5445341, -2.780566, 0, 1, 0.7372549, 1,
-0.1450001, -0.3554058, -2.44517, 0, 1, 0.7411765, 1,
-0.1440362, 2.048301, -0.9853134, 0, 1, 0.7490196, 1,
-0.1424306, 0.3145311, -1.072182, 0, 1, 0.7529412, 1,
-0.1351782, 0.3393054, -1.66302, 0, 1, 0.7607843, 1,
-0.1341417, -0.8480775, -2.28161, 0, 1, 0.7647059, 1,
-0.1305167, -0.9915839, -1.367375, 0, 1, 0.772549, 1,
-0.1299253, -0.5021319, -2.781275, 0, 1, 0.7764706, 1,
-0.1295734, 1.017155, -0.1494727, 0, 1, 0.7843137, 1,
-0.1290143, -0.1589891, -3.484801, 0, 1, 0.7882353, 1,
-0.1271853, 1.911052, -0.6771149, 0, 1, 0.7960784, 1,
-0.1236583, -0.1915843, -2.700899, 0, 1, 0.8039216, 1,
-0.1222437, -0.4592667, -3.164206, 0, 1, 0.8078431, 1,
-0.1207376, 0.645748, -2.023307, 0, 1, 0.8156863, 1,
-0.115135, 0.5046999, 1.063183, 0, 1, 0.8196079, 1,
-0.1110279, 0.2004091, -1.578247, 0, 1, 0.827451, 1,
-0.1050032, 2.751517, -0.5693139, 0, 1, 0.8313726, 1,
-0.1022824, 1.079786, -1.802343, 0, 1, 0.8392157, 1,
-0.09975128, -1.455806, -2.474769, 0, 1, 0.8431373, 1,
-0.09847801, 0.9239734, -0.02978311, 0, 1, 0.8509804, 1,
-0.09772123, 0.507938, -0.5708981, 0, 1, 0.854902, 1,
-0.09147196, -2.087258, -5.075646, 0, 1, 0.8627451, 1,
-0.09091912, -0.9316952, -5.330894, 0, 1, 0.8666667, 1,
-0.08845774, -1.028919, -2.946887, 0, 1, 0.8745098, 1,
-0.08587085, -0.3150433, -3.574687, 0, 1, 0.8784314, 1,
-0.0858375, -1.541263, -3.652281, 0, 1, 0.8862745, 1,
-0.0818378, 0.243146, -1.494633, 0, 1, 0.8901961, 1,
-0.07987155, -1.61243, -2.24362, 0, 1, 0.8980392, 1,
-0.07907033, -1.55502, -3.921742, 0, 1, 0.9058824, 1,
-0.07838133, -0.4180556, -4.589546, 0, 1, 0.9098039, 1,
-0.07282195, 0.21802, 0.2063338, 0, 1, 0.9176471, 1,
-0.07222919, -0.01018428, -2.139683, 0, 1, 0.9215686, 1,
-0.06962194, -0.702808, -3.559532, 0, 1, 0.9294118, 1,
-0.06893913, -1.878663, -3.704978, 0, 1, 0.9333333, 1,
-0.05668209, 0.5697749, 1.729793, 0, 1, 0.9411765, 1,
-0.05612442, 0.4809834, -0.2963888, 0, 1, 0.945098, 1,
-0.05400084, -0.3332465, -3.160104, 0, 1, 0.9529412, 1,
-0.05056081, 1.114038, 0.9908399, 0, 1, 0.9568627, 1,
-0.05029613, -0.7430005, -3.098396, 0, 1, 0.9647059, 1,
-0.04598529, 0.03070549, -0.1943631, 0, 1, 0.9686275, 1,
-0.04540906, 0.1720794, 0.7436129, 0, 1, 0.9764706, 1,
-0.04393362, 0.04690199, -0.3108064, 0, 1, 0.9803922, 1,
-0.04226195, -0.6620758, -2.779364, 0, 1, 0.9882353, 1,
-0.03894904, -0.5567771, -4.094286, 0, 1, 0.9921569, 1,
-0.0384266, 1.119272, 0.6929284, 0, 1, 1, 1,
-0.03556418, -0.204825, -2.108964, 0, 0.9921569, 1, 1,
-0.03481774, 0.7321419, 0.4257563, 0, 0.9882353, 1, 1,
-0.03381971, 0.7150737, 1.007852, 0, 0.9803922, 1, 1,
-0.02764932, -1.206413, -3.799718, 0, 0.9764706, 1, 1,
-0.02746837, 0.5721701, 0.9427258, 0, 0.9686275, 1, 1,
-0.02669016, 0.957531, -1.166361, 0, 0.9647059, 1, 1,
-0.02560724, -1.41426, -3.775953, 0, 0.9568627, 1, 1,
-0.02105638, -0.1530974, -2.873908, 0, 0.9529412, 1, 1,
-0.01965725, -1.482561, -4.515443, 0, 0.945098, 1, 1,
-0.01901826, 0.8047853, -0.9653304, 0, 0.9411765, 1, 1,
-0.01900987, -1.195292, -2.525377, 0, 0.9333333, 1, 1,
-0.01735848, 1.637671, -0.6434114, 0, 0.9294118, 1, 1,
-0.008167021, -1.74803, -3.76186, 0, 0.9215686, 1, 1,
-0.003083432, 0.2762944, 0.6790302, 0, 0.9176471, 1, 1,
-0.001576631, 0.08304747, 0.09009423, 0, 0.9098039, 1, 1,
0.002840057, 0.8368468, -0.5539251, 0, 0.9058824, 1, 1,
0.003424725, -1.083481, 2.800405, 0, 0.8980392, 1, 1,
0.004485652, -0.6524779, 4.070069, 0, 0.8901961, 1, 1,
0.004515543, 1.126, 0.6160007, 0, 0.8862745, 1, 1,
0.01009864, 0.6520787, -1.271891, 0, 0.8784314, 1, 1,
0.01047918, -1.716264, 2.378789, 0, 0.8745098, 1, 1,
0.01106136, 0.7639175, 0.9782463, 0, 0.8666667, 1, 1,
0.01278073, -0.5205793, 3.823458, 0, 0.8627451, 1, 1,
0.01304534, -0.2471526, 4.922471, 0, 0.854902, 1, 1,
0.01381899, 1.003982, -2.048257, 0, 0.8509804, 1, 1,
0.01417215, -1.08977, 4.186426, 0, 0.8431373, 1, 1,
0.01549784, -0.7736982, 4.53235, 0, 0.8392157, 1, 1,
0.01687391, 2.053061, -1.48964, 0, 0.8313726, 1, 1,
0.01735409, -1.517647, 2.204603, 0, 0.827451, 1, 1,
0.02155925, 2.038939, -0.2519184, 0, 0.8196079, 1, 1,
0.02451041, -0.4954389, 4.226254, 0, 0.8156863, 1, 1,
0.02464498, -0.3727279, 1.583453, 0, 0.8078431, 1, 1,
0.02677391, -0.6093609, 1.946095, 0, 0.8039216, 1, 1,
0.02956023, -0.5501358, 0.9978762, 0, 0.7960784, 1, 1,
0.03061887, -0.7541267, 2.818732, 0, 0.7882353, 1, 1,
0.04034014, -0.4785624, 1.624075, 0, 0.7843137, 1, 1,
0.0423039, -0.1069449, 3.903939, 0, 0.7764706, 1, 1,
0.04448389, -0.177809, 3.987684, 0, 0.772549, 1, 1,
0.04824506, 1.183792, -1.012094, 0, 0.7647059, 1, 1,
0.04987169, -0.02697026, 2.915334, 0, 0.7607843, 1, 1,
0.05330528, -0.783382, 4.25699, 0, 0.7529412, 1, 1,
0.05419849, 0.3925664, -0.6093962, 0, 0.7490196, 1, 1,
0.05779324, 1.255305, -1.003145, 0, 0.7411765, 1, 1,
0.06858542, 0.5281741, 0.1266638, 0, 0.7372549, 1, 1,
0.06896553, 0.5297729, 0.1177644, 0, 0.7294118, 1, 1,
0.07503591, -0.3392799, 2.685694, 0, 0.7254902, 1, 1,
0.07608658, -2.201986, 1.783744, 0, 0.7176471, 1, 1,
0.07660646, -0.1431006, 2.736006, 0, 0.7137255, 1, 1,
0.07661866, -0.5795902, 5.161171, 0, 0.7058824, 1, 1,
0.08327911, -0.5459353, 5.349829, 0, 0.6980392, 1, 1,
0.08787104, 0.05798021, 1.937059, 0, 0.6941177, 1, 1,
0.08939527, 0.5752691, 0.7823354, 0, 0.6862745, 1, 1,
0.09127212, 1.637308, 1.946565, 0, 0.682353, 1, 1,
0.09154908, -0.2190707, 3.333889, 0, 0.6745098, 1, 1,
0.09279347, -0.9348441, 3.02372, 0, 0.6705883, 1, 1,
0.09413496, -0.3766948, 3.004817, 0, 0.6627451, 1, 1,
0.09564494, -0.3343042, 0.5831198, 0, 0.6588235, 1, 1,
0.09683459, 0.6929973, -0.5437104, 0, 0.6509804, 1, 1,
0.1018988, -0.8455763, 4.052448, 0, 0.6470588, 1, 1,
0.1031234, -0.7728331, 2.769302, 0, 0.6392157, 1, 1,
0.1056399, -1.459241, -0.3204294, 0, 0.6352941, 1, 1,
0.1116082, -0.3499528, 2.765903, 0, 0.627451, 1, 1,
0.117877, 0.9235424, -0.1984437, 0, 0.6235294, 1, 1,
0.1182975, 1.26738, 1.152245, 0, 0.6156863, 1, 1,
0.1229179, 0.6238828, 0.3920111, 0, 0.6117647, 1, 1,
0.1286825, -0.02366998, 2.600853, 0, 0.6039216, 1, 1,
0.1294328, -1.651571, 3.729229, 0, 0.5960785, 1, 1,
0.1347354, -0.9788297, 4.48896, 0, 0.5921569, 1, 1,
0.1396785, -0.25795, 2.549867, 0, 0.5843138, 1, 1,
0.1411743, -1.032877, 5.185832, 0, 0.5803922, 1, 1,
0.1420044, -0.4625148, 4.200372, 0, 0.572549, 1, 1,
0.1441218, -0.1758272, 2.400639, 0, 0.5686275, 1, 1,
0.1477021, -0.380828, 3.037286, 0, 0.5607843, 1, 1,
0.1482277, 1.664646, -0.1365504, 0, 0.5568628, 1, 1,
0.1544916, -0.6462551, 2.733982, 0, 0.5490196, 1, 1,
0.1578199, 0.9743802, 0.3018681, 0, 0.5450981, 1, 1,
0.171936, -0.1693639, 2.786557, 0, 0.5372549, 1, 1,
0.1796896, 0.3360345, -0.2299632, 0, 0.5333334, 1, 1,
0.1797421, -0.7348813, 3.174411, 0, 0.5254902, 1, 1,
0.1807733, 0.04157938, 1.03743, 0, 0.5215687, 1, 1,
0.1863602, -0.3988885, 4.111199, 0, 0.5137255, 1, 1,
0.1872755, -0.428266, 3.136579, 0, 0.509804, 1, 1,
0.1894599, 1.250678, -0.3602754, 0, 0.5019608, 1, 1,
0.1901441, -0.1996418, 4.67976, 0, 0.4941176, 1, 1,
0.1914147, 0.6894494, -1.27394, 0, 0.4901961, 1, 1,
0.1954479, 0.1180954, -0.8713909, 0, 0.4823529, 1, 1,
0.2009553, 0.6115135, 1.02468, 0, 0.4784314, 1, 1,
0.2017878, 0.2838629, 0.9001592, 0, 0.4705882, 1, 1,
0.2062719, -0.6436973, 1.925467, 0, 0.4666667, 1, 1,
0.2066831, -0.5219389, 3.494525, 0, 0.4588235, 1, 1,
0.2067752, 0.1923297, -0.6243111, 0, 0.454902, 1, 1,
0.207067, -0.5718631, 3.066522, 0, 0.4470588, 1, 1,
0.2076638, -1.132675, 2.740233, 0, 0.4431373, 1, 1,
0.2137971, -0.05173197, 1.471957, 0, 0.4352941, 1, 1,
0.2192345, -1.801823, 4.145261, 0, 0.4313726, 1, 1,
0.2214171, -0.2135438, 1.207464, 0, 0.4235294, 1, 1,
0.2272967, 0.4296905, 1.019481, 0, 0.4196078, 1, 1,
0.2290072, -0.6963181, 3.47006, 0, 0.4117647, 1, 1,
0.2299138, -1.307047, 4.024185, 0, 0.4078431, 1, 1,
0.2347229, 0.04786586, 1.324233, 0, 0.4, 1, 1,
0.236618, -0.9657059, 1.296321, 0, 0.3921569, 1, 1,
0.24338, -0.08267261, 0.3119414, 0, 0.3882353, 1, 1,
0.2439481, 0.04291864, 1.328988, 0, 0.3803922, 1, 1,
0.2447687, 0.5406568, 1.883182, 0, 0.3764706, 1, 1,
0.250701, -1.209325, 1.612692, 0, 0.3686275, 1, 1,
0.2509636, -1.456224, 1.816035, 0, 0.3647059, 1, 1,
0.2584074, 0.6261076, -0.5994054, 0, 0.3568628, 1, 1,
0.2586987, 0.8266622, 0.3345615, 0, 0.3529412, 1, 1,
0.2603698, 1.347007, -0.377159, 0, 0.345098, 1, 1,
0.2624847, 1.180662, 0.159768, 0, 0.3411765, 1, 1,
0.2626371, 1.252861, -1.978901, 0, 0.3333333, 1, 1,
0.2628575, -0.07383525, 0.9986948, 0, 0.3294118, 1, 1,
0.2636379, -0.7329039, 4.045525, 0, 0.3215686, 1, 1,
0.2666131, 1.631557, -1.120407, 0, 0.3176471, 1, 1,
0.2696673, 0.9465293, -2.760943, 0, 0.3098039, 1, 1,
0.2699358, -0.1797702, 1.599712, 0, 0.3058824, 1, 1,
0.2769941, -0.5405433, 1.692759, 0, 0.2980392, 1, 1,
0.2771537, 0.04111606, 2.168174, 0, 0.2901961, 1, 1,
0.2808912, 0.4102682, 2.318207, 0, 0.2862745, 1, 1,
0.2826972, -1.418165, 3.986406, 0, 0.2784314, 1, 1,
0.2827553, 0.5134175, -0.2851599, 0, 0.2745098, 1, 1,
0.2862163, 0.09542202, 1.683174, 0, 0.2666667, 1, 1,
0.2874447, -0.5724921, 3.07925, 0, 0.2627451, 1, 1,
0.2950998, -0.9230887, 6.051755, 0, 0.254902, 1, 1,
0.298522, 0.5383129, -0.4825653, 0, 0.2509804, 1, 1,
0.298931, 0.4415024, -1.121811, 0, 0.2431373, 1, 1,
0.3085051, 1.438294, -0.3468161, 0, 0.2392157, 1, 1,
0.3087909, -0.138544, 1.004426, 0, 0.2313726, 1, 1,
0.3094953, 0.1357991, 1.84051, 0, 0.227451, 1, 1,
0.3112472, 0.7931923, -0.8829098, 0, 0.2196078, 1, 1,
0.3115681, 1.773649, 0.8155062, 0, 0.2156863, 1, 1,
0.315417, 1.290548, -0.4768329, 0, 0.2078431, 1, 1,
0.318844, -1.329228, 3.731306, 0, 0.2039216, 1, 1,
0.3189281, 0.8206279, -0.08417206, 0, 0.1960784, 1, 1,
0.3232341, 1.037555, 1.714981, 0, 0.1882353, 1, 1,
0.3236928, 1.200412, 0.4481509, 0, 0.1843137, 1, 1,
0.3283765, 0.3005684, 1.366485, 0, 0.1764706, 1, 1,
0.3313105, 0.8982564, 0.531972, 0, 0.172549, 1, 1,
0.3332398, -1.078709, 2.766128, 0, 0.1647059, 1, 1,
0.3340129, 0.4051644, 0.8108647, 0, 0.1607843, 1, 1,
0.3345416, 0.4068683, -0.9907888, 0, 0.1529412, 1, 1,
0.3352004, 1.969936, 0.7296853, 0, 0.1490196, 1, 1,
0.3413043, 0.3566989, 0.5151392, 0, 0.1411765, 1, 1,
0.3438266, 0.7722858, 0.9618629, 0, 0.1372549, 1, 1,
0.3481951, -1.317686, 4.04738, 0, 0.1294118, 1, 1,
0.3522828, 0.9787793, 0.04760733, 0, 0.1254902, 1, 1,
0.3561396, 0.6830471, 1.382958, 0, 0.1176471, 1, 1,
0.3568794, 0.893634, 0.6401697, 0, 0.1137255, 1, 1,
0.3625738, -0.7257772, 0.67136, 0, 0.1058824, 1, 1,
0.3643745, 2.099458, 0.1192664, 0, 0.09803922, 1, 1,
0.3665042, 0.7360228, 0.823973, 0, 0.09411765, 1, 1,
0.3671977, 0.2884997, 2.132215, 0, 0.08627451, 1, 1,
0.3675571, 0.4324138, 0.5855738, 0, 0.08235294, 1, 1,
0.3704774, 0.311464, 0.5793726, 0, 0.07450981, 1, 1,
0.3719942, 0.3586265, 1.64823, 0, 0.07058824, 1, 1,
0.3726231, -0.2945997, 1.982616, 0, 0.0627451, 1, 1,
0.3730811, 0.8106928, -1.536636, 0, 0.05882353, 1, 1,
0.3739539, -1.106928, 3.075649, 0, 0.05098039, 1, 1,
0.375115, 0.7003128, 0.5169708, 0, 0.04705882, 1, 1,
0.3812428, -0.5429649, 1.769557, 0, 0.03921569, 1, 1,
0.383653, 1.166114, 0.395711, 0, 0.03529412, 1, 1,
0.3971747, 0.6236696, 1.355744, 0, 0.02745098, 1, 1,
0.3987514, 1.612867, 0.2373022, 0, 0.02352941, 1, 1,
0.400858, 0.4250157, 0.8485516, 0, 0.01568628, 1, 1,
0.4050039, -0.8517217, 2.332392, 0, 0.01176471, 1, 1,
0.407987, 0.08603001, 2.748689, 0, 0.003921569, 1, 1,
0.4080514, -0.6089439, 1.557194, 0.003921569, 0, 1, 1,
0.4124585, -0.7200948, 4.147759, 0.007843138, 0, 1, 1,
0.4132415, 0.1360761, 0.7191954, 0.01568628, 0, 1, 1,
0.4193752, 0.2230531, -1.203099, 0.01960784, 0, 1, 1,
0.4195405, -1.312829, 3.598037, 0.02745098, 0, 1, 1,
0.4195599, 0.5502293, -0.4252859, 0.03137255, 0, 1, 1,
0.4202057, 0.3051467, -0.06689691, 0.03921569, 0, 1, 1,
0.4289101, 0.1347659, 2.429583, 0.04313726, 0, 1, 1,
0.4364834, -0.1504619, 1.681101, 0.05098039, 0, 1, 1,
0.4368355, -3.109436, 3.0508, 0.05490196, 0, 1, 1,
0.4402527, 0.877546, -0.977601, 0.0627451, 0, 1, 1,
0.4421812, 1.432474, 1.066357, 0.06666667, 0, 1, 1,
0.4477741, -0.06319013, 2.867612, 0.07450981, 0, 1, 1,
0.4477865, -1.338358, 3.621161, 0.07843138, 0, 1, 1,
0.4536112, 0.4845192, 0.6142058, 0.08627451, 0, 1, 1,
0.4614398, -0.1234015, 1.256417, 0.09019608, 0, 1, 1,
0.4624094, -0.08630713, 3.794578, 0.09803922, 0, 1, 1,
0.4624311, -1.576745, 2.534166, 0.1058824, 0, 1, 1,
0.4682735, -0.260014, 0.3557509, 0.1098039, 0, 1, 1,
0.4702375, 0.4117516, 1.508421, 0.1176471, 0, 1, 1,
0.4703739, -0.1721886, 2.815418, 0.1215686, 0, 1, 1,
0.4711926, 0.3595814, 0.9555615, 0.1294118, 0, 1, 1,
0.4720309, -0.7307367, 0.5954393, 0.1333333, 0, 1, 1,
0.4807216, 1.406963, 1.420153, 0.1411765, 0, 1, 1,
0.482227, -0.4019843, 2.268508, 0.145098, 0, 1, 1,
0.4878747, 0.5788287, 0.09664268, 0.1529412, 0, 1, 1,
0.4923031, -1.876003, 1.542574, 0.1568628, 0, 1, 1,
0.4934525, 0.8943703, 1.013461, 0.1647059, 0, 1, 1,
0.4937712, 1.148165, 0.4524866, 0.1686275, 0, 1, 1,
0.4962086, -1.630633, 2.703542, 0.1764706, 0, 1, 1,
0.4963382, 1.37334, 0.04539212, 0.1803922, 0, 1, 1,
0.5006486, -0.3401493, 0.9957389, 0.1882353, 0, 1, 1,
0.5040209, -1.031558, 1.64672, 0.1921569, 0, 1, 1,
0.5056693, 0.4876537, 1.175693, 0.2, 0, 1, 1,
0.506914, 0.7888954, 0.8276289, 0.2078431, 0, 1, 1,
0.5103394, -0.8912271, 4.509314, 0.2117647, 0, 1, 1,
0.5136642, 1.20784, 0.1879072, 0.2196078, 0, 1, 1,
0.5142996, 0.1718541, 0.777426, 0.2235294, 0, 1, 1,
0.5149621, -0.3089132, 3.795121, 0.2313726, 0, 1, 1,
0.5153502, 1.593559, -0.6759452, 0.2352941, 0, 1, 1,
0.5250384, -0.738787, 2.569883, 0.2431373, 0, 1, 1,
0.5292256, -1.093248, 2.702218, 0.2470588, 0, 1, 1,
0.5307311, 0.6828589, 0.1256256, 0.254902, 0, 1, 1,
0.531296, 1.162505, 0.1413075, 0.2588235, 0, 1, 1,
0.5357603, -0.07053971, 2.263618, 0.2666667, 0, 1, 1,
0.5363226, -1.130233, 2.878314, 0.2705882, 0, 1, 1,
0.5376012, -0.6557004, 2.742966, 0.2784314, 0, 1, 1,
0.5450673, -0.7851278, 3.953275, 0.282353, 0, 1, 1,
0.5465282, -0.3515914, 2.964677, 0.2901961, 0, 1, 1,
0.547185, 0.3544101, 0.6795965, 0.2941177, 0, 1, 1,
0.5555938, -1.047941, 3.387365, 0.3019608, 0, 1, 1,
0.5670033, 0.4104584, 1.34841, 0.3098039, 0, 1, 1,
0.5689214, -1.729505, 2.663857, 0.3137255, 0, 1, 1,
0.5712091, -0.3370065, 0.343655, 0.3215686, 0, 1, 1,
0.5712384, 1.203032, -0.785023, 0.3254902, 0, 1, 1,
0.5731694, -2.029766, 4.200371, 0.3333333, 0, 1, 1,
0.5765029, 0.05567122, 1.197981, 0.3372549, 0, 1, 1,
0.5866717, 0.115511, 0.9392012, 0.345098, 0, 1, 1,
0.5883308, -0.5039234, 4.112279, 0.3490196, 0, 1, 1,
0.5887265, -0.919165, 1.358121, 0.3568628, 0, 1, 1,
0.5892109, 0.7015783, 1.948905, 0.3607843, 0, 1, 1,
0.5927486, -0.2704056, 5.060521, 0.3686275, 0, 1, 1,
0.5934688, 1.120518, 1.816625, 0.372549, 0, 1, 1,
0.5941429, -0.2251627, 2.208643, 0.3803922, 0, 1, 1,
0.6012057, -0.2691365, 2.442165, 0.3843137, 0, 1, 1,
0.6036168, 0.1722796, 2.032905, 0.3921569, 0, 1, 1,
0.6124086, 0.7834359, -0.2551041, 0.3960784, 0, 1, 1,
0.6139356, -1.59548, 3.247815, 0.4039216, 0, 1, 1,
0.6160505, 1.107473, 0.1017622, 0.4117647, 0, 1, 1,
0.6189885, 0.5020316, 0.3993849, 0.4156863, 0, 1, 1,
0.6221498, -0.3465181, 2.040937, 0.4235294, 0, 1, 1,
0.6248704, 1.419727, 0.6648193, 0.427451, 0, 1, 1,
0.6280053, -1.157334, 0.9104491, 0.4352941, 0, 1, 1,
0.6308714, -0.5593134, 3.949463, 0.4392157, 0, 1, 1,
0.637903, -1.421802, 4.616451, 0.4470588, 0, 1, 1,
0.6386827, -0.01940846, 0.7389966, 0.4509804, 0, 1, 1,
0.6415454, -1.146226, 2.233947, 0.4588235, 0, 1, 1,
0.6498475, 0.09069825, 1.496308, 0.4627451, 0, 1, 1,
0.6514301, -1.301591, 3.698427, 0.4705882, 0, 1, 1,
0.6521905, 0.6563945, 2.356782, 0.4745098, 0, 1, 1,
0.6522271, 0.275609, 1.198847, 0.4823529, 0, 1, 1,
0.6586282, 1.37384, -0.6850587, 0.4862745, 0, 1, 1,
0.6617951, -0.7285493, 1.97414, 0.4941176, 0, 1, 1,
0.6628016, 0.7286554, -0.432616, 0.5019608, 0, 1, 1,
0.6642749, -0.1658867, 2.014638, 0.5058824, 0, 1, 1,
0.6662397, -0.6668533, 1.38995, 0.5137255, 0, 1, 1,
0.667679, -0.2399595, 3.353895, 0.5176471, 0, 1, 1,
0.670201, 0.02458166, 3.369161, 0.5254902, 0, 1, 1,
0.6706839, 2.09094, 0.6863078, 0.5294118, 0, 1, 1,
0.6750666, 0.7723895, -0.08498629, 0.5372549, 0, 1, 1,
0.6776342, 1.540989, 0.1515731, 0.5411765, 0, 1, 1,
0.6781474, -0.3583269, 2.924863, 0.5490196, 0, 1, 1,
0.6808539, -1.156749, 2.929277, 0.5529412, 0, 1, 1,
0.6848575, -0.2773541, 1.654494, 0.5607843, 0, 1, 1,
0.6898211, -0.2624643, 0.9188147, 0.5647059, 0, 1, 1,
0.6920452, 1.230894, 0.5625942, 0.572549, 0, 1, 1,
0.6925189, 0.820492, 0.8796505, 0.5764706, 0, 1, 1,
0.7097707, 0.1908934, 3.343251, 0.5843138, 0, 1, 1,
0.7106096, -1.069528, 2.078714, 0.5882353, 0, 1, 1,
0.720918, 2.207301, -0.1064678, 0.5960785, 0, 1, 1,
0.725149, 0.1492883, 0.5276933, 0.6039216, 0, 1, 1,
0.7276925, 0.2521461, 0.6173421, 0.6078432, 0, 1, 1,
0.7285241, -1.119104, 2.162389, 0.6156863, 0, 1, 1,
0.7333591, 0.2697284, 0.07573901, 0.6196079, 0, 1, 1,
0.7342674, 0.3905305, 2.271114, 0.627451, 0, 1, 1,
0.7363272, 0.2117198, 0.7583432, 0.6313726, 0, 1, 1,
0.7444758, -0.1028189, 1.918848, 0.6392157, 0, 1, 1,
0.7474242, -0.1996245, 0.7953929, 0.6431373, 0, 1, 1,
0.747515, 1.056377, 2.274574, 0.6509804, 0, 1, 1,
0.7489496, 0.08589598, 0.7832657, 0.654902, 0, 1, 1,
0.7499087, -0.3200668, 2.572724, 0.6627451, 0, 1, 1,
0.7508472, 0.2835291, 0.4894777, 0.6666667, 0, 1, 1,
0.7509789, 0.7848268, 1.259049, 0.6745098, 0, 1, 1,
0.7531552, 0.1773547, 1.399091, 0.6784314, 0, 1, 1,
0.7573159, 1.065811, 0.1482019, 0.6862745, 0, 1, 1,
0.7738152, -0.08969202, 2.106368, 0.6901961, 0, 1, 1,
0.7801771, 0.8145503, 0.4365917, 0.6980392, 0, 1, 1,
0.7820197, 0.450128, 0.5100802, 0.7058824, 0, 1, 1,
0.7859237, 1.105092, 0.3048996, 0.7098039, 0, 1, 1,
0.7859356, -0.2336806, 1.289557, 0.7176471, 0, 1, 1,
0.7861684, 1.119724, 0.2849138, 0.7215686, 0, 1, 1,
0.7869225, -0.9081706, 3.897987, 0.7294118, 0, 1, 1,
0.7877662, 0.2349975, -0.7536126, 0.7333333, 0, 1, 1,
0.7949026, 0.1805118, 1.327718, 0.7411765, 0, 1, 1,
0.8040859, -0.8513018, 1.893632, 0.7450981, 0, 1, 1,
0.8057641, -0.471177, 3.599974, 0.7529412, 0, 1, 1,
0.8062658, 0.3284743, 2.778643, 0.7568628, 0, 1, 1,
0.8073823, 0.2351942, 0.1581182, 0.7647059, 0, 1, 1,
0.8116479, -0.8996242, 3.302732, 0.7686275, 0, 1, 1,
0.8140841, 0.7837091, 2.337387, 0.7764706, 0, 1, 1,
0.8232098, 0.5231051, -0.1939765, 0.7803922, 0, 1, 1,
0.824098, 0.6784961, 0.0807367, 0.7882353, 0, 1, 1,
0.8303822, -1.650604, 3.192736, 0.7921569, 0, 1, 1,
0.8325857, -1.56199, 2.699568, 0.8, 0, 1, 1,
0.8354466, -1.538975, 3.8933, 0.8078431, 0, 1, 1,
0.841379, -2.319511, 2.154532, 0.8117647, 0, 1, 1,
0.8416909, 0.5207376, 0.4820253, 0.8196079, 0, 1, 1,
0.8492405, 0.8672454, 1.09463, 0.8235294, 0, 1, 1,
0.8503139, -1.14092, 1.478232, 0.8313726, 0, 1, 1,
0.8545166, -0.08417057, 2.524534, 0.8352941, 0, 1, 1,
0.8556232, -0.9394292, 2.782842, 0.8431373, 0, 1, 1,
0.8575678, 0.4544877, 0.5739583, 0.8470588, 0, 1, 1,
0.8587478, -1.324755, 1.959982, 0.854902, 0, 1, 1,
0.8690367, -1.290906, 3.303026, 0.8588235, 0, 1, 1,
0.8802177, 1.033764, 1.795042, 0.8666667, 0, 1, 1,
0.8803442, 0.388311, 0.9598042, 0.8705882, 0, 1, 1,
0.8901927, 0.06299126, 1.474412, 0.8784314, 0, 1, 1,
0.8902221, -0.222758, 2.164234, 0.8823529, 0, 1, 1,
0.8920295, -0.3318255, 1.588028, 0.8901961, 0, 1, 1,
0.8969451, -1.585359, 0.986195, 0.8941177, 0, 1, 1,
0.9021938, 0.03791365, 1.5093, 0.9019608, 0, 1, 1,
0.9130191, -0.4252038, 0.9542562, 0.9098039, 0, 1, 1,
0.9194437, -2.2308, 3.414416, 0.9137255, 0, 1, 1,
0.9225266, 1.325699, 0.03011057, 0.9215686, 0, 1, 1,
0.932299, 1.771575, -0.8489028, 0.9254902, 0, 1, 1,
0.9386543, 0.05522037, 1.671218, 0.9333333, 0, 1, 1,
0.9393172, 0.1538993, 1.362963, 0.9372549, 0, 1, 1,
0.9455284, 0.1613937, 0.4706004, 0.945098, 0, 1, 1,
0.9491213, -0.2496974, 1.040428, 0.9490196, 0, 1, 1,
0.9514959, 0.005977976, 1.960808, 0.9568627, 0, 1, 1,
0.9536543, -0.8197923, 2.957155, 0.9607843, 0, 1, 1,
0.9681264, 1.318534, 0.1332139, 0.9686275, 0, 1, 1,
0.9688264, -0.876808, 3.142892, 0.972549, 0, 1, 1,
0.9703018, 0.4739754, 0.6191502, 0.9803922, 0, 1, 1,
0.9731963, -1.955706, 3.466405, 0.9843137, 0, 1, 1,
0.9737136, 1.097625, 2.502892, 0.9921569, 0, 1, 1,
0.9881718, -0.4014195, 1.16098, 0.9960784, 0, 1, 1,
0.9947367, -1.345694, 3.100355, 1, 0, 0.9960784, 1,
1.002798, 1.442556, 1.307491, 1, 0, 0.9882353, 1,
1.003042, 0.3427436, 1.176114, 1, 0, 0.9843137, 1,
1.003667, 0.6616362, 1.313464, 1, 0, 0.9764706, 1,
1.003826, 0.02259705, 0.4124456, 1, 0, 0.972549, 1,
1.028327, -0.5507032, 1.99411, 1, 0, 0.9647059, 1,
1.029837, 0.9044272, 1.299497, 1, 0, 0.9607843, 1,
1.0321, 0.8041793, -0.3849686, 1, 0, 0.9529412, 1,
1.035773, 1.118916, -0.3245674, 1, 0, 0.9490196, 1,
1.041241, 0.7614346, 0.6912503, 1, 0, 0.9411765, 1,
1.042637, 0.02625067, 1.34214, 1, 0, 0.9372549, 1,
1.043083, 0.5706413, 0.6792896, 1, 0, 0.9294118, 1,
1.046401, 0.9243098, -0.0293859, 1, 0, 0.9254902, 1,
1.047309, -0.9154489, 2.554313, 1, 0, 0.9176471, 1,
1.049384, -1.740264, 2.699995, 1, 0, 0.9137255, 1,
1.055505, -0.8781518, 1.521613, 1, 0, 0.9058824, 1,
1.057444, 0.3603658, 1.849501, 1, 0, 0.9019608, 1,
1.059159, -0.8693489, 2.886416, 1, 0, 0.8941177, 1,
1.072562, -0.2289938, 0.2186256, 1, 0, 0.8862745, 1,
1.082509, -2.211333, 2.925053, 1, 0, 0.8823529, 1,
1.083088, -0.681097, 1.868508, 1, 0, 0.8745098, 1,
1.083914, 1.805909, -0.961807, 1, 0, 0.8705882, 1,
1.090224, 1.867084, -0.6198502, 1, 0, 0.8627451, 1,
1.092208, -0.2652794, 1.994318, 1, 0, 0.8588235, 1,
1.092371, 1.643558, -0.4899453, 1, 0, 0.8509804, 1,
1.110111, -1.620201, 2.83926, 1, 0, 0.8470588, 1,
1.113552, -0.2376158, 1.363424, 1, 0, 0.8392157, 1,
1.114288, -1.498529, 1.928257, 1, 0, 0.8352941, 1,
1.11846, 0.9935665, 0.8611485, 1, 0, 0.827451, 1,
1.12148, -1.121042, 1.516251, 1, 0, 0.8235294, 1,
1.123103, -0.894533, 1.871688, 1, 0, 0.8156863, 1,
1.124945, -1.232894, 4.217103, 1, 0, 0.8117647, 1,
1.129688, -0.3005901, 1.793797, 1, 0, 0.8039216, 1,
1.130642, 0.2080154, -0.6209986, 1, 0, 0.7960784, 1,
1.138342, 0.7783577, 2.30797, 1, 0, 0.7921569, 1,
1.139132, 0.4529854, 1.250047, 1, 0, 0.7843137, 1,
1.139248, -0.781206, 3.100011, 1, 0, 0.7803922, 1,
1.147461, 0.1212747, 0.1095381, 1, 0, 0.772549, 1,
1.15471, -0.6871716, 3.254856, 1, 0, 0.7686275, 1,
1.157846, -1.516872, 0.4626568, 1, 0, 0.7607843, 1,
1.158164, -1.321972, 1.714339, 1, 0, 0.7568628, 1,
1.158955, -1.35123, 0.06476624, 1, 0, 0.7490196, 1,
1.162402, 1.45499, 1.920325, 1, 0, 0.7450981, 1,
1.163405, -0.5317314, 2.886651, 1, 0, 0.7372549, 1,
1.171047, -1.977302, 3.600576, 1, 0, 0.7333333, 1,
1.174934, 0.6792856, 0.7195857, 1, 0, 0.7254902, 1,
1.181341, 1.851955, 0.4716139, 1, 0, 0.7215686, 1,
1.181764, -0.5152916, 2.550427, 1, 0, 0.7137255, 1,
1.188395, -0.18692, 1.119779, 1, 0, 0.7098039, 1,
1.2024, 0.3211734, 2.197747, 1, 0, 0.7019608, 1,
1.205052, 1.053608, 0.8258865, 1, 0, 0.6941177, 1,
1.216773, -0.5728383, 1.37432, 1, 0, 0.6901961, 1,
1.217622, -0.4433476, 0.7934433, 1, 0, 0.682353, 1,
1.221176, -0.6342684, 1.048656, 1, 0, 0.6784314, 1,
1.235594, -1.51546, 3.931998, 1, 0, 0.6705883, 1,
1.247147, 0.6037399, -0.3062214, 1, 0, 0.6666667, 1,
1.248589, 1.852958, 0.2169161, 1, 0, 0.6588235, 1,
1.256296, 0.8398104, 1.103824, 1, 0, 0.654902, 1,
1.256521, -0.5750565, 1.930925, 1, 0, 0.6470588, 1,
1.260673, 0.1709665, 2.834675, 1, 0, 0.6431373, 1,
1.264434, -0.8558635, 3.30366, 1, 0, 0.6352941, 1,
1.265849, 0.05112114, 1.855197, 1, 0, 0.6313726, 1,
1.273455, -0.08019844, 0.5473313, 1, 0, 0.6235294, 1,
1.275543, 1.477298, 1.201876, 1, 0, 0.6196079, 1,
1.283869, 1.483799, 1.129233, 1, 0, 0.6117647, 1,
1.288388, -1.383082, 3.60635, 1, 0, 0.6078432, 1,
1.291178, 1.082679, 1.501972, 1, 0, 0.6, 1,
1.291996, 0.5981836, 1.960201, 1, 0, 0.5921569, 1,
1.294787, -1.001202, 1.968785, 1, 0, 0.5882353, 1,
1.299341, -1.168926, 2.059355, 1, 0, 0.5803922, 1,
1.304883, -0.6135976, 2.335209, 1, 0, 0.5764706, 1,
1.309962, 0.1797198, 1.403589, 1, 0, 0.5686275, 1,
1.31128, -0.4517294, 2.809493, 1, 0, 0.5647059, 1,
1.311905, -0.01754397, -0.04792093, 1, 0, 0.5568628, 1,
1.315241, -1.156089, 0.623889, 1, 0, 0.5529412, 1,
1.317492, 0.495198, 2.705951, 1, 0, 0.5450981, 1,
1.320542, 0.06634926, 2.769077, 1, 0, 0.5411765, 1,
1.32615, -0.1052727, 2.63764, 1, 0, 0.5333334, 1,
1.328104, -1.318775, 4.041925, 1, 0, 0.5294118, 1,
1.334656, -0.2246509, 1.952876, 1, 0, 0.5215687, 1,
1.341796, -0.2070165, 1.716809, 1, 0, 0.5176471, 1,
1.359445, -1.305362, 1.45064, 1, 0, 0.509804, 1,
1.365997, -0.6522912, 2.585001, 1, 0, 0.5058824, 1,
1.366845, 0.6751477, 0.1037441, 1, 0, 0.4980392, 1,
1.376626, 0.2812539, -0.2278146, 1, 0, 0.4901961, 1,
1.392521, -0.2909192, 2.519394, 1, 0, 0.4862745, 1,
1.403848, -2.061489, 1.710704, 1, 0, 0.4784314, 1,
1.409904, 1.079975, -0.7977239, 1, 0, 0.4745098, 1,
1.414635, 1.565226, 0.4810477, 1, 0, 0.4666667, 1,
1.416362, -0.1910307, 2.034878, 1, 0, 0.4627451, 1,
1.419441, 0.08819382, 1.899887, 1, 0, 0.454902, 1,
1.421273, -2.805601, 4.271209, 1, 0, 0.4509804, 1,
1.434509, 0.3482454, 0.4089654, 1, 0, 0.4431373, 1,
1.44683, -1.339142, 1.582428, 1, 0, 0.4392157, 1,
1.466397, 0.8166302, 1.664695, 1, 0, 0.4313726, 1,
1.475318, 0.1113507, 2.735339, 1, 0, 0.427451, 1,
1.477754, 0.8297084, 2.0384, 1, 0, 0.4196078, 1,
1.481162, 1.371413, 0.3267072, 1, 0, 0.4156863, 1,
1.488505, 1.820199, 0.624953, 1, 0, 0.4078431, 1,
1.499218, 0.03409085, 1.534427, 1, 0, 0.4039216, 1,
1.508336, -2.442218, 2.629201, 1, 0, 0.3960784, 1,
1.512171, -2.049643, 2.169359, 1, 0, 0.3882353, 1,
1.513517, 1.427461, 1.157945, 1, 0, 0.3843137, 1,
1.517549, 0.4384546, 2.23578, 1, 0, 0.3764706, 1,
1.526864, 0.8318183, 0.5225076, 1, 0, 0.372549, 1,
1.557382, -2.297935, 2.592052, 1, 0, 0.3647059, 1,
1.558751, 0.6397909, 0.04751349, 1, 0, 0.3607843, 1,
1.562459, 1.362751, 3.035185, 1, 0, 0.3529412, 1,
1.56831, -1.06364, 2.479683, 1, 0, 0.3490196, 1,
1.578408, -1.099662, 1.506272, 1, 0, 0.3411765, 1,
1.581443, 0.465697, 1.46226, 1, 0, 0.3372549, 1,
1.587841, -0.250368, 0.3906862, 1, 0, 0.3294118, 1,
1.606487, -0.8925595, 2.694526, 1, 0, 0.3254902, 1,
1.611636, 1.235038, -1.449643, 1, 0, 0.3176471, 1,
1.613392, 0.4207729, 2.936228, 1, 0, 0.3137255, 1,
1.61493, -1.143266, 2.13568, 1, 0, 0.3058824, 1,
1.615126, 0.7347603, 3.011273, 1, 0, 0.2980392, 1,
1.616316, 0.6003345, 0.4592858, 1, 0, 0.2941177, 1,
1.632936, -0.6928348, 2.094522, 1, 0, 0.2862745, 1,
1.637607, 0.6107123, 1.999683, 1, 0, 0.282353, 1,
1.641636, -0.7926756, 4.191547, 1, 0, 0.2745098, 1,
1.650459, 0.8781321, 1.868599, 1, 0, 0.2705882, 1,
1.659557, 1.245777, 2.453849, 1, 0, 0.2627451, 1,
1.683906, -0.7199801, 2.599758, 1, 0, 0.2588235, 1,
1.701079, 0.01193743, 3.297376, 1, 0, 0.2509804, 1,
1.711845, -0.3534344, 2.171347, 1, 0, 0.2470588, 1,
1.712025, 0.839746, 1.791906, 1, 0, 0.2392157, 1,
1.723358, 0.4844261, 1.787641, 1, 0, 0.2352941, 1,
1.752515, -0.5799063, 3.238529, 1, 0, 0.227451, 1,
1.764733, 0.6794814, 0.09161278, 1, 0, 0.2235294, 1,
1.766441, 0.1055364, 0.06042377, 1, 0, 0.2156863, 1,
1.78529, 1.456195, -0.2524962, 1, 0, 0.2117647, 1,
1.789206, -0.9102004, 2.076015, 1, 0, 0.2039216, 1,
1.793226, 1.253866, 1.324375, 1, 0, 0.1960784, 1,
1.823927, -0.2882545, 0.5673173, 1, 0, 0.1921569, 1,
1.836884, -0.1291906, 3.932328, 1, 0, 0.1843137, 1,
1.850403, -0.5965628, 2.796091, 1, 0, 0.1803922, 1,
1.852988, 0.9376441, 1.8687, 1, 0, 0.172549, 1,
1.853419, -0.6625829, 1.340093, 1, 0, 0.1686275, 1,
1.8553, 0.7880456, 1.342638, 1, 0, 0.1607843, 1,
1.892875, -0.09509175, 0.6853685, 1, 0, 0.1568628, 1,
1.895679, -1.370414, 2.121821, 1, 0, 0.1490196, 1,
1.910262, 1.120943, 1.958676, 1, 0, 0.145098, 1,
1.913452, -0.1795181, -0.4004903, 1, 0, 0.1372549, 1,
1.957862, -0.7738315, 1.256071, 1, 0, 0.1333333, 1,
2.023138, 1.021571, -0.5868465, 1, 0, 0.1254902, 1,
2.067048, 0.5046285, 1.05325, 1, 0, 0.1215686, 1,
2.08209, 0.6379527, 2.770576, 1, 0, 0.1137255, 1,
2.108626, 0.3995558, 2.286722, 1, 0, 0.1098039, 1,
2.115109, -0.845844, 1.228246, 1, 0, 0.1019608, 1,
2.118622, -0.6422738, 0.7376201, 1, 0, 0.09411765, 1,
2.122715, 0.1193237, 2.159007, 1, 0, 0.09019608, 1,
2.153614, -1.688195, 2.765028, 1, 0, 0.08235294, 1,
2.159406, 2.342753, 1.929119, 1, 0, 0.07843138, 1,
2.230983, 0.0349225, 0.766086, 1, 0, 0.07058824, 1,
2.234745, 0.7129619, 1.032372, 1, 0, 0.06666667, 1,
2.279194, 1.272725, 0.5498387, 1, 0, 0.05882353, 1,
2.299476, 1.10095, 0.6013163, 1, 0, 0.05490196, 1,
2.368878, 0.5952812, 2.143054, 1, 0, 0.04705882, 1,
2.408614, -0.1503154, 0.2610935, 1, 0, 0.04313726, 1,
2.447939, -0.5378011, 3.673893, 1, 0, 0.03529412, 1,
2.620286, 1.234798, 0.2744849, 1, 0, 0.03137255, 1,
2.673538, 0.9192174, 2.706027, 1, 0, 0.02352941, 1,
2.929115, -1.324552, 1.551723, 1, 0, 0.01960784, 1,
2.968718, 0.3168841, 0.7904903, 1, 0, 0.01176471, 1,
3.355854, 0.5915, 2.880001, 1, 0, 0.007843138, 1
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
0.2194268, -4.950349, -7.260252, 0, -0.5, 0.5, 0.5,
0.2194268, -4.950349, -7.260252, 1, -0.5, 0.5, 0.5,
0.2194268, -4.950349, -7.260252, 1, 1.5, 0.5, 0.5,
0.2194268, -4.950349, -7.260252, 0, 1.5, 0.5, 0.5
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
-3.980249, -0.3105919, -7.260252, 0, -0.5, 0.5, 0.5,
-3.980249, -0.3105919, -7.260252, 1, -0.5, 0.5, 0.5,
-3.980249, -0.3105919, -7.260252, 1, 1.5, 0.5, 0.5,
-3.980249, -0.3105919, -7.260252, 0, 1.5, 0.5, 0.5
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
-3.980249, -4.950349, 0.360431, 0, -0.5, 0.5, 0.5,
-3.980249, -4.950349, 0.360431, 1, -0.5, 0.5, 0.5,
-3.980249, -4.950349, 0.360431, 1, 1.5, 0.5, 0.5,
-3.980249, -4.950349, 0.360431, 0, 1.5, 0.5, 0.5
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
-2, -3.879636, -5.501633,
3, -3.879636, -5.501633,
-2, -3.879636, -5.501633,
-2, -4.058088, -5.794736,
-1, -3.879636, -5.501633,
-1, -4.058088, -5.794736,
0, -3.879636, -5.501633,
0, -4.058088, -5.794736,
1, -3.879636, -5.501633,
1, -4.058088, -5.794736,
2, -3.879636, -5.501633,
2, -4.058088, -5.794736,
3, -3.879636, -5.501633,
3, -4.058088, -5.794736
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
-2, -4.414993, -6.380943, 0, -0.5, 0.5, 0.5,
-2, -4.414993, -6.380943, 1, -0.5, 0.5, 0.5,
-2, -4.414993, -6.380943, 1, 1.5, 0.5, 0.5,
-2, -4.414993, -6.380943, 0, 1.5, 0.5, 0.5,
-1, -4.414993, -6.380943, 0, -0.5, 0.5, 0.5,
-1, -4.414993, -6.380943, 1, -0.5, 0.5, 0.5,
-1, -4.414993, -6.380943, 1, 1.5, 0.5, 0.5,
-1, -4.414993, -6.380943, 0, 1.5, 0.5, 0.5,
0, -4.414993, -6.380943, 0, -0.5, 0.5, 0.5,
0, -4.414993, -6.380943, 1, -0.5, 0.5, 0.5,
0, -4.414993, -6.380943, 1, 1.5, 0.5, 0.5,
0, -4.414993, -6.380943, 0, 1.5, 0.5, 0.5,
1, -4.414993, -6.380943, 0, -0.5, 0.5, 0.5,
1, -4.414993, -6.380943, 1, -0.5, 0.5, 0.5,
1, -4.414993, -6.380943, 1, 1.5, 0.5, 0.5,
1, -4.414993, -6.380943, 0, 1.5, 0.5, 0.5,
2, -4.414993, -6.380943, 0, -0.5, 0.5, 0.5,
2, -4.414993, -6.380943, 1, -0.5, 0.5, 0.5,
2, -4.414993, -6.380943, 1, 1.5, 0.5, 0.5,
2, -4.414993, -6.380943, 0, 1.5, 0.5, 0.5,
3, -4.414993, -6.380943, 0, -0.5, 0.5, 0.5,
3, -4.414993, -6.380943, 1, -0.5, 0.5, 0.5,
3, -4.414993, -6.380943, 1, 1.5, 0.5, 0.5,
3, -4.414993, -6.380943, 0, 1.5, 0.5, 0.5
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
-3.011093, -3, -5.501633,
-3.011093, 3, -5.501633,
-3.011093, -3, -5.501633,
-3.172619, -3, -5.794736,
-3.011093, -2, -5.501633,
-3.172619, -2, -5.794736,
-3.011093, -1, -5.501633,
-3.172619, -1, -5.794736,
-3.011093, 0, -5.501633,
-3.172619, 0, -5.794736,
-3.011093, 1, -5.501633,
-3.172619, 1, -5.794736,
-3.011093, 2, -5.501633,
-3.172619, 2, -5.794736,
-3.011093, 3, -5.501633,
-3.172619, 3, -5.794736
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
-3.495671, -3, -6.380943, 0, -0.5, 0.5, 0.5,
-3.495671, -3, -6.380943, 1, -0.5, 0.5, 0.5,
-3.495671, -3, -6.380943, 1, 1.5, 0.5, 0.5,
-3.495671, -3, -6.380943, 0, 1.5, 0.5, 0.5,
-3.495671, -2, -6.380943, 0, -0.5, 0.5, 0.5,
-3.495671, -2, -6.380943, 1, -0.5, 0.5, 0.5,
-3.495671, -2, -6.380943, 1, 1.5, 0.5, 0.5,
-3.495671, -2, -6.380943, 0, 1.5, 0.5, 0.5,
-3.495671, -1, -6.380943, 0, -0.5, 0.5, 0.5,
-3.495671, -1, -6.380943, 1, -0.5, 0.5, 0.5,
-3.495671, -1, -6.380943, 1, 1.5, 0.5, 0.5,
-3.495671, -1, -6.380943, 0, 1.5, 0.5, 0.5,
-3.495671, 0, -6.380943, 0, -0.5, 0.5, 0.5,
-3.495671, 0, -6.380943, 1, -0.5, 0.5, 0.5,
-3.495671, 0, -6.380943, 1, 1.5, 0.5, 0.5,
-3.495671, 0, -6.380943, 0, 1.5, 0.5, 0.5,
-3.495671, 1, -6.380943, 0, -0.5, 0.5, 0.5,
-3.495671, 1, -6.380943, 1, -0.5, 0.5, 0.5,
-3.495671, 1, -6.380943, 1, 1.5, 0.5, 0.5,
-3.495671, 1, -6.380943, 0, 1.5, 0.5, 0.5,
-3.495671, 2, -6.380943, 0, -0.5, 0.5, 0.5,
-3.495671, 2, -6.380943, 1, -0.5, 0.5, 0.5,
-3.495671, 2, -6.380943, 1, 1.5, 0.5, 0.5,
-3.495671, 2, -6.380943, 0, 1.5, 0.5, 0.5,
-3.495671, 3, -6.380943, 0, -0.5, 0.5, 0.5,
-3.495671, 3, -6.380943, 1, -0.5, 0.5, 0.5,
-3.495671, 3, -6.380943, 1, 1.5, 0.5, 0.5,
-3.495671, 3, -6.380943, 0, 1.5, 0.5, 0.5
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
-3.011093, -3.879636, -4,
-3.011093, -3.879636, 6,
-3.011093, -3.879636, -4,
-3.172619, -4.058088, -4,
-3.011093, -3.879636, -2,
-3.172619, -4.058088, -2,
-3.011093, -3.879636, 0,
-3.172619, -4.058088, 0,
-3.011093, -3.879636, 2,
-3.172619, -4.058088, 2,
-3.011093, -3.879636, 4,
-3.172619, -4.058088, 4,
-3.011093, -3.879636, 6,
-3.172619, -4.058088, 6
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
-3.495671, -4.414993, -4, 0, -0.5, 0.5, 0.5,
-3.495671, -4.414993, -4, 1, -0.5, 0.5, 0.5,
-3.495671, -4.414993, -4, 1, 1.5, 0.5, 0.5,
-3.495671, -4.414993, -4, 0, 1.5, 0.5, 0.5,
-3.495671, -4.414993, -2, 0, -0.5, 0.5, 0.5,
-3.495671, -4.414993, -2, 1, -0.5, 0.5, 0.5,
-3.495671, -4.414993, -2, 1, 1.5, 0.5, 0.5,
-3.495671, -4.414993, -2, 0, 1.5, 0.5, 0.5,
-3.495671, -4.414993, 0, 0, -0.5, 0.5, 0.5,
-3.495671, -4.414993, 0, 1, -0.5, 0.5, 0.5,
-3.495671, -4.414993, 0, 1, 1.5, 0.5, 0.5,
-3.495671, -4.414993, 0, 0, 1.5, 0.5, 0.5,
-3.495671, -4.414993, 2, 0, -0.5, 0.5, 0.5,
-3.495671, -4.414993, 2, 1, -0.5, 0.5, 0.5,
-3.495671, -4.414993, 2, 1, 1.5, 0.5, 0.5,
-3.495671, -4.414993, 2, 0, 1.5, 0.5, 0.5,
-3.495671, -4.414993, 4, 0, -0.5, 0.5, 0.5,
-3.495671, -4.414993, 4, 1, -0.5, 0.5, 0.5,
-3.495671, -4.414993, 4, 1, 1.5, 0.5, 0.5,
-3.495671, -4.414993, 4, 0, 1.5, 0.5, 0.5,
-3.495671, -4.414993, 6, 0, -0.5, 0.5, 0.5,
-3.495671, -4.414993, 6, 1, -0.5, 0.5, 0.5,
-3.495671, -4.414993, 6, 1, 1.5, 0.5, 0.5,
-3.495671, -4.414993, 6, 0, 1.5, 0.5, 0.5
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
-3.011093, -3.879636, -5.501633,
-3.011093, 3.258452, -5.501633,
-3.011093, -3.879636, 6.222495,
-3.011093, 3.258452, 6.222495,
-3.011093, -3.879636, -5.501633,
-3.011093, -3.879636, 6.222495,
-3.011093, 3.258452, -5.501633,
-3.011093, 3.258452, 6.222495,
-3.011093, -3.879636, -5.501633,
3.449947, -3.879636, -5.501633,
-3.011093, -3.879636, 6.222495,
3.449947, -3.879636, 6.222495,
-3.011093, 3.258452, -5.501633,
3.449947, 3.258452, -5.501633,
-3.011093, 3.258452, 6.222495,
3.449947, 3.258452, 6.222495,
3.449947, -3.879636, -5.501633,
3.449947, 3.258452, -5.501633,
3.449947, -3.879636, 6.222495,
3.449947, 3.258452, 6.222495,
3.449947, -3.879636, -5.501633,
3.449947, -3.879636, 6.222495,
3.449947, 3.258452, -5.501633,
3.449947, 3.258452, 6.222495
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
var radius = 8.100901;
var distance = 36.04182;
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
mvMatrix.translate( -0.2194268, 0.3105919, -0.360431 );
mvMatrix.scale( 1.355641, 1.227059, 0.7470793 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.04182);
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
diethyl_phosphate<-read.table("diethyl_phosphate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diethyl_phosphate$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_phosphate' not found
```

```r
y<-diethyl_phosphate$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_phosphate' not found
```

```r
z<-diethyl_phosphate$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_phosphate' not found
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
-2.917001, 0.05432138, -1.115437, 0, 0, 1, 1, 1,
-2.695238, 1.392375, -0.1218524, 1, 0, 0, 1, 1,
-2.54866, 1.475619, -1.172791, 1, 0, 0, 1, 1,
-2.526316, -0.3798848, -1.510504, 1, 0, 0, 1, 1,
-2.496805, 2.53883, 0.74229, 1, 0, 0, 1, 1,
-2.467092, -0.2295976, -1.974478, 1, 0, 0, 1, 1,
-2.391114, 0.8340476, -4.085502, 0, 0, 0, 1, 1,
-2.288802, 0.9029222, -0.9448131, 0, 0, 0, 1, 1,
-2.266607, -0.2219918, -2.229985, 0, 0, 0, 1, 1,
-2.262375, 0.8754693, -1.227703, 0, 0, 0, 1, 1,
-2.240356, 0.1619134, -0.2753854, 0, 0, 0, 1, 1,
-2.224623, 0.3353201, -1.253165, 0, 0, 0, 1, 1,
-2.196944, 0.0006805477, -1.462066, 0, 0, 0, 1, 1,
-2.182358, -0.3441081, -1.167869, 1, 1, 1, 1, 1,
-2.164099, 0.3126489, -2.253372, 1, 1, 1, 1, 1,
-2.126626, -1.28335, -0.8330134, 1, 1, 1, 1, 1,
-2.121125, 0.994969, -1.791604, 1, 1, 1, 1, 1,
-2.113218, -1.585255, -2.282981, 1, 1, 1, 1, 1,
-2.085544, 0.5792365, -1.838713, 1, 1, 1, 1, 1,
-2.080188, 0.8241992, -0.9752234, 1, 1, 1, 1, 1,
-2.061656, -2.154129, -1.657311, 1, 1, 1, 1, 1,
-2.050748, 0.1228809, -2.211945, 1, 1, 1, 1, 1,
-2.049947, -0.1931096, -1.647052, 1, 1, 1, 1, 1,
-2.04428, -1.36394, -1.864201, 1, 1, 1, 1, 1,
-2.008716, -2.788231, -3.353299, 1, 1, 1, 1, 1,
-2.002989, 0.6979829, -1.553407, 1, 1, 1, 1, 1,
-2.002532, 1.467067, -0.9766884, 1, 1, 1, 1, 1,
-1.973748, 0.6909399, -0.9313622, 1, 1, 1, 1, 1,
-1.972512, -0.8274133, -2.64951, 0, 0, 1, 1, 1,
-1.946672, 0.00060045, -0.4302283, 1, 0, 0, 1, 1,
-1.934598, -0.4444956, -1.728657, 1, 0, 0, 1, 1,
-1.924845, 1.126217, -2.694233, 1, 0, 0, 1, 1,
-1.916467, 0.4981065, -0.7133846, 1, 0, 0, 1, 1,
-1.900588, 1.574146, -0.277721, 1, 0, 0, 1, 1,
-1.87308, 0.1302617, -2.079222, 0, 0, 0, 1, 1,
-1.870588, 1.616578, -1.432441, 0, 0, 0, 1, 1,
-1.870405, 0.211596, -1.101879, 0, 0, 0, 1, 1,
-1.868298, 0.9976453, -0.8946285, 0, 0, 0, 1, 1,
-1.865649, 0.5913673, -2.948907, 0, 0, 0, 1, 1,
-1.863163, 0.3470277, -1.182686, 0, 0, 0, 1, 1,
-1.838511, 1.069605, 0.9937304, 0, 0, 0, 1, 1,
-1.795314, 0.5008987, -1.511821, 1, 1, 1, 1, 1,
-1.781213, -0.3874686, -0.1526487, 1, 1, 1, 1, 1,
-1.781189, -1.203034, -4.086145, 1, 1, 1, 1, 1,
-1.773468, 1.586903, -0.6404462, 1, 1, 1, 1, 1,
-1.740974, 2.417315, -0.4620105, 1, 1, 1, 1, 1,
-1.737755, 0.1345465, -0.9078165, 1, 1, 1, 1, 1,
-1.724828, 0.01962966, -1.246862, 1, 1, 1, 1, 1,
-1.724599, 1.08913, -1.140865, 1, 1, 1, 1, 1,
-1.708938, 0.9532116, 0.07796104, 1, 1, 1, 1, 1,
-1.703605, -0.4159996, -1.429081, 1, 1, 1, 1, 1,
-1.700161, -0.292188, -3.755513, 1, 1, 1, 1, 1,
-1.6982, 0.8050922, -0.7048953, 1, 1, 1, 1, 1,
-1.684788, -0.4546753, -4.053212, 1, 1, 1, 1, 1,
-1.670395, 0.04116415, -3.346954, 1, 1, 1, 1, 1,
-1.668354, 0.37713, -0.92419, 1, 1, 1, 1, 1,
-1.636863, 1.666239, 1.022659, 0, 0, 1, 1, 1,
-1.624135, 1.731929, -0.8736688, 1, 0, 0, 1, 1,
-1.620314, -1.214527, -0.4309425, 1, 0, 0, 1, 1,
-1.613128, -0.006917445, -1.877587, 1, 0, 0, 1, 1,
-1.608098, 0.190416, -0.9256525, 1, 0, 0, 1, 1,
-1.604312, -0.3822564, -2.020415, 1, 0, 0, 1, 1,
-1.600647, -1.56643, -1.793726, 0, 0, 0, 1, 1,
-1.596886, -0.700173, -3.066683, 0, 0, 0, 1, 1,
-1.584975, -0.4515709, -0.2121208, 0, 0, 0, 1, 1,
-1.572218, -1.209123, -3.238181, 0, 0, 0, 1, 1,
-1.568904, -0.3577131, -2.558204, 0, 0, 0, 1, 1,
-1.54842, 0.3559431, -1.990421, 0, 0, 0, 1, 1,
-1.547161, 0.639242, -1.220896, 0, 0, 0, 1, 1,
-1.543648, 2.255483, 0.04256903, 1, 1, 1, 1, 1,
-1.540622, 1.026741, 0.6953954, 1, 1, 1, 1, 1,
-1.538934, -0.6585281, -0.5166357, 1, 1, 1, 1, 1,
-1.525726, 0.9222373, -1.177886, 1, 1, 1, 1, 1,
-1.508716, 0.7705453, -0.7303069, 1, 1, 1, 1, 1,
-1.498675, -0.1147469, -1.626624, 1, 1, 1, 1, 1,
-1.495739, 0.7052816, -1.222766, 1, 1, 1, 1, 1,
-1.483142, -0.8838191, -3.376056, 1, 1, 1, 1, 1,
-1.482542, -0.4169132, -3.039121, 1, 1, 1, 1, 1,
-1.481881, 1.223048, -0.8678451, 1, 1, 1, 1, 1,
-1.4726, 0.4326203, -1.236922, 1, 1, 1, 1, 1,
-1.466717, 1.341334, -2.439128, 1, 1, 1, 1, 1,
-1.422167, -1.741264, -3.935104, 1, 1, 1, 1, 1,
-1.415684, -0.760082, -1.385501, 1, 1, 1, 1, 1,
-1.399605, -1.141277, -2.8336, 1, 1, 1, 1, 1,
-1.398949, 0.8844559, -1.336127, 0, 0, 1, 1, 1,
-1.397309, -2.337241, -2.579967, 1, 0, 0, 1, 1,
-1.391594, -1.428785, -1.504135, 1, 0, 0, 1, 1,
-1.388621, 1.241593, -0.2573609, 1, 0, 0, 1, 1,
-1.388447, -0.02222905, -0.3317837, 1, 0, 0, 1, 1,
-1.380505, 1.490464, -1.291109, 1, 0, 0, 1, 1,
-1.372404, -0.2557016, -2.26739, 0, 0, 0, 1, 1,
-1.371791, -0.8518496, -2.381298, 0, 0, 0, 1, 1,
-1.368313, -0.5567557, -0.2981835, 0, 0, 0, 1, 1,
-1.356501, 0.2858117, -1.690672, 0, 0, 0, 1, 1,
-1.347608, -0.6398014, -2.937502, 0, 0, 0, 1, 1,
-1.347113, -0.4916112, -1.384425, 0, 0, 0, 1, 1,
-1.327892, -0.4287258, -1.547034, 0, 0, 0, 1, 1,
-1.32782, -1.030111, -2.994257, 1, 1, 1, 1, 1,
-1.323977, -2.248581, -0.6497644, 1, 1, 1, 1, 1,
-1.323613, 0.1338277, -2.262096, 1, 1, 1, 1, 1,
-1.317992, 1.2201, -2.546801, 1, 1, 1, 1, 1,
-1.289677, 3.1545, -0.4338045, 1, 1, 1, 1, 1,
-1.278653, -0.2515467, -1.581651, 1, 1, 1, 1, 1,
-1.263696, 0.7499791, 0.1081741, 1, 1, 1, 1, 1,
-1.240021, 1.132537, -2.164043, 1, 1, 1, 1, 1,
-1.229188, 0.3360706, -0.007905963, 1, 1, 1, 1, 1,
-1.222754, 0.1662702, -0.4057521, 1, 1, 1, 1, 1,
-1.217678, -0.4085449, -3.012, 1, 1, 1, 1, 1,
-1.211794, -1.653899, -2.214039, 1, 1, 1, 1, 1,
-1.21132, 0.006813799, -1.789517, 1, 1, 1, 1, 1,
-1.203803, -2.548633, -1.852592, 1, 1, 1, 1, 1,
-1.201074, 1.19422, -1.335802, 1, 1, 1, 1, 1,
-1.200711, -0.2859235, -3.391271, 0, 0, 1, 1, 1,
-1.199545, -0.5858675, 1.074036, 1, 0, 0, 1, 1,
-1.197408, -1.069245, -2.894277, 1, 0, 0, 1, 1,
-1.188619, -1.894141, -2.69547, 1, 0, 0, 1, 1,
-1.182729, 1.287644, -0.9665299, 1, 0, 0, 1, 1,
-1.180131, -0.1788728, -1.805419, 1, 0, 0, 1, 1,
-1.178986, 0.4209549, -1.009626, 0, 0, 0, 1, 1,
-1.176261, -0.141274, -1.074793, 0, 0, 0, 1, 1,
-1.173198, -0.7232919, -0.8828592, 0, 0, 0, 1, 1,
-1.171197, -0.7360412, -2.566864, 0, 0, 0, 1, 1,
-1.167621, 0.1318502, -2.22438, 0, 0, 0, 1, 1,
-1.160399, 1.54813, -1.178012, 0, 0, 0, 1, 1,
-1.154622, -1.920696, -2.768963, 0, 0, 0, 1, 1,
-1.154207, 0.8291411, -0.6438265, 1, 1, 1, 1, 1,
-1.148722, -0.7186593, -2.376274, 1, 1, 1, 1, 1,
-1.142332, 1.094898, -0.9933785, 1, 1, 1, 1, 1,
-1.135457, 1.485549, -1.295103, 1, 1, 1, 1, 1,
-1.132421, 1.636297, 0.3328304, 1, 1, 1, 1, 1,
-1.114304, 1.182149, -0.6649721, 1, 1, 1, 1, 1,
-1.112445, -1.713651, -1.31814, 1, 1, 1, 1, 1,
-1.111215, -1.980501, -3.822931, 1, 1, 1, 1, 1,
-1.108065, 0.6272897, -2.433041, 1, 1, 1, 1, 1,
-1.104921, -0.08121045, -2.176246, 1, 1, 1, 1, 1,
-1.102765, 0.1676236, -1.786175, 1, 1, 1, 1, 1,
-1.101427, -0.5356353, -4.30842, 1, 1, 1, 1, 1,
-1.10051, 0.9491583, -1.505967, 1, 1, 1, 1, 1,
-1.096598, 0.2857622, -1.123664, 1, 1, 1, 1, 1,
-1.09538, -1.589161, -2.901656, 1, 1, 1, 1, 1,
-1.095075, 1.917084, -0.2102801, 0, 0, 1, 1, 1,
-1.091083, 0.3567225, -1.807829, 1, 0, 0, 1, 1,
-1.090712, 0.03550731, -2.185853, 1, 0, 0, 1, 1,
-1.086498, -0.6059121, -4.407022, 1, 0, 0, 1, 1,
-1.086269, 0.9391774, -1.042683, 1, 0, 0, 1, 1,
-1.07869, 0.372592, -2.166432, 1, 0, 0, 1, 1,
-1.077124, 0.5963519, -3.110325, 0, 0, 0, 1, 1,
-1.076975, -0.2703327, -3.246289, 0, 0, 0, 1, 1,
-1.076466, -1.532525, -3.432191, 0, 0, 0, 1, 1,
-1.058941, 0.5906411, -0.3999706, 0, 0, 0, 1, 1,
-1.058338, -1.05553, -2.540527, 0, 0, 0, 1, 1,
-1.053804, -0.3277374, -0.945433, 0, 0, 0, 1, 1,
-1.047475, -1.100558, -1.238708, 0, 0, 0, 1, 1,
-1.044381, -0.5716251, -2.319813, 1, 1, 1, 1, 1,
-1.042843, -0.7868578, -2.209182, 1, 1, 1, 1, 1,
-1.02847, 0.9068376, -0.5538992, 1, 1, 1, 1, 1,
-1.02192, 1.54508, -0.1193375, 1, 1, 1, 1, 1,
-1.018343, 0.3276243, 0.9848815, 1, 1, 1, 1, 1,
-1.012147, 0.4091531, -3.048217, 1, 1, 1, 1, 1,
-1.010535, 0.002411391, -2.267463, 1, 1, 1, 1, 1,
-1.009632, -1.110406, -2.790324, 1, 1, 1, 1, 1,
-1.00897, -0.6393005, -3.096431, 1, 1, 1, 1, 1,
-1.007447, -0.4795031, -3.29226, 1, 1, 1, 1, 1,
-0.9963664, 0.9817424, 0.1785235, 1, 1, 1, 1, 1,
-0.9882841, -0.1837443, -1.305813, 1, 1, 1, 1, 1,
-0.9879287, 0.4522019, -0.2403725, 1, 1, 1, 1, 1,
-0.9863251, 0.6816671, -0.7731554, 1, 1, 1, 1, 1,
-0.9814104, 0.2770082, -3.025967, 1, 1, 1, 1, 1,
-0.9782577, -1.162936, -1.782392, 0, 0, 1, 1, 1,
-0.9617553, -0.1517479, -0.514836, 1, 0, 0, 1, 1,
-0.955905, 0.4041609, -0.02510679, 1, 0, 0, 1, 1,
-0.9516602, -0.4584585, -1.669909, 1, 0, 0, 1, 1,
-0.9438725, 0.5841037, -1.372208, 1, 0, 0, 1, 1,
-0.9400878, -1.519586, -2.955487, 1, 0, 0, 1, 1,
-0.9318143, -0.4753214, -3.651068, 0, 0, 0, 1, 1,
-0.9303961, 1.291155, -2.198304, 0, 0, 0, 1, 1,
-0.9282606, 0.9248059, -3.099147, 0, 0, 0, 1, 1,
-0.9244127, -0.4851404, -1.674696, 0, 0, 0, 1, 1,
-0.9203913, 1.56278, -0.7555302, 0, 0, 0, 1, 1,
-0.9141065, -0.5626235, -3.115444, 0, 0, 0, 1, 1,
-0.913187, -1.009668, -4.664698, 0, 0, 0, 1, 1,
-0.9118658, -0.9792636, -2.610252, 1, 1, 1, 1, 1,
-0.9016922, -0.1358417, -0.7421356, 1, 1, 1, 1, 1,
-0.8995197, 1.143986, -1.169735, 1, 1, 1, 1, 1,
-0.8943712, 1.931138, -0.4570763, 1, 1, 1, 1, 1,
-0.8929288, 0.8154916, -0.3468284, 1, 1, 1, 1, 1,
-0.8916935, 0.914885, -1.115532, 1, 1, 1, 1, 1,
-0.8816271, -0.5934429, -1.535961, 1, 1, 1, 1, 1,
-0.8627026, -0.369209, -1.144465, 1, 1, 1, 1, 1,
-0.8507175, -0.2488106, -3.016467, 1, 1, 1, 1, 1,
-0.8504491, 1.376866, -0.5891758, 1, 1, 1, 1, 1,
-0.8456416, 1.085746, 0.8067102, 1, 1, 1, 1, 1,
-0.8449683, -0.3217629, 0.9163642, 1, 1, 1, 1, 1,
-0.8421865, -1.465275, -0.9518766, 1, 1, 1, 1, 1,
-0.841434, 0.8155565, -0.134887, 1, 1, 1, 1, 1,
-0.8405324, 0.5159164, -0.7185727, 1, 1, 1, 1, 1,
-0.8315834, -1.030732, -3.945284, 0, 0, 1, 1, 1,
-0.8311725, -1.061358, -1.651253, 1, 0, 0, 1, 1,
-0.8299476, -0.8917432, -4.701982, 1, 0, 0, 1, 1,
-0.8276024, -0.01251272, -1.397768, 1, 0, 0, 1, 1,
-0.813143, -0.2180338, -2.312581, 1, 0, 0, 1, 1,
-0.812534, -1.539317, -1.972344, 1, 0, 0, 1, 1,
-0.8088766, -1.188275, 0.4168221, 0, 0, 0, 1, 1,
-0.8072128, 0.6633008, -0.7098552, 0, 0, 0, 1, 1,
-0.8059415, 0.2617372, -3.733845, 0, 0, 0, 1, 1,
-0.7992558, 0.2416894, -0.6048983, 0, 0, 0, 1, 1,
-0.7950205, -0.5220487, -1.224295, 0, 0, 0, 1, 1,
-0.7932575, 1.818077, -0.2602431, 0, 0, 0, 1, 1,
-0.7926334, 0.5548651, -0.3473215, 0, 0, 0, 1, 1,
-0.7903306, -0.9386647, -1.600395, 1, 1, 1, 1, 1,
-0.7899199, -1.001178, -3.396972, 1, 1, 1, 1, 1,
-0.788264, 0.68042, -0.1810674, 1, 1, 1, 1, 1,
-0.7866867, -0.1685002, -1.446479, 1, 1, 1, 1, 1,
-0.7842378, 1.417443, -1.169982, 1, 1, 1, 1, 1,
-0.7823868, 0.4840279, -0.9730892, 1, 1, 1, 1, 1,
-0.7821653, 2.222777, -0.3477564, 1, 1, 1, 1, 1,
-0.7784805, 0.07177132, -1.508797, 1, 1, 1, 1, 1,
-0.7727662, 0.7784607, -0.2075135, 1, 1, 1, 1, 1,
-0.7724178, -0.2633954, -1.294756, 1, 1, 1, 1, 1,
-0.7716962, 0.5146846, -2.059447, 1, 1, 1, 1, 1,
-0.7697225, 0.3242898, -0.7751021, 1, 1, 1, 1, 1,
-0.7621676, -1.417333, -2.781071, 1, 1, 1, 1, 1,
-0.7580662, -0.9073995, -2.578644, 1, 1, 1, 1, 1,
-0.7521312, 1.350505, -0.5806043, 1, 1, 1, 1, 1,
-0.7467411, -0.06378346, -0.8446539, 0, 0, 1, 1, 1,
-0.7427688, -0.04728609, -1.341259, 1, 0, 0, 1, 1,
-0.7408204, 0.4515669, -1.238193, 1, 0, 0, 1, 1,
-0.7399884, 0.3120354, -1.221933, 1, 0, 0, 1, 1,
-0.7351155, 0.3778225, -0.5537877, 1, 0, 0, 1, 1,
-0.7348402, -1.258412, -5.330091, 1, 0, 0, 1, 1,
-0.7335415, -0.6439078, -3.5005, 0, 0, 0, 1, 1,
-0.7311365, -0.2493975, -4.400727, 0, 0, 0, 1, 1,
-0.7302297, -0.3623964, -3.67151, 0, 0, 0, 1, 1,
-0.727155, -1.307975, -3.067787, 0, 0, 0, 1, 1,
-0.7240179, -1.186947, -3.059303, 0, 0, 0, 1, 1,
-0.7239785, 0.03930009, -1.090415, 0, 0, 0, 1, 1,
-0.723947, 0.01453082, -1.491237, 0, 0, 0, 1, 1,
-0.7086015, -0.05544999, -1.424397, 1, 1, 1, 1, 1,
-0.7064148, -0.2757681, -0.3699847, 1, 1, 1, 1, 1,
-0.7052612, -0.4703741, -3.081844, 1, 1, 1, 1, 1,
-0.6998336, -0.4616346, -1.781566, 1, 1, 1, 1, 1,
-0.6993682, -1.560893, -1.301731, 1, 1, 1, 1, 1,
-0.6993251, -1.330055, -2.133779, 1, 1, 1, 1, 1,
-0.6958525, -1.624307, -3.649189, 1, 1, 1, 1, 1,
-0.6943142, 0.1397486, -0.1421867, 1, 1, 1, 1, 1,
-0.6907807, -2.265885, -1.884251, 1, 1, 1, 1, 1,
-0.6891761, 0.04549796, -2.527221, 1, 1, 1, 1, 1,
-0.687535, -0.4052501, -4.239827, 1, 1, 1, 1, 1,
-0.6872005, 0.1587191, -1.604076, 1, 1, 1, 1, 1,
-0.6816525, -0.9302544, -1.052435, 1, 1, 1, 1, 1,
-0.681155, 0.01341947, -0.3450879, 1, 1, 1, 1, 1,
-0.6782058, -0.3344308, -2.53759, 1, 1, 1, 1, 1,
-0.6747452, 0.2135295, -0.8648137, 0, 0, 1, 1, 1,
-0.6715407, -1.059649, -2.129473, 1, 0, 0, 1, 1,
-0.6695595, -0.538338, -1.809313, 1, 0, 0, 1, 1,
-0.6682556, 0.07811965, -2.191841, 1, 0, 0, 1, 1,
-0.6632975, 1.28087, -0.3077939, 1, 0, 0, 1, 1,
-0.6620709, -0.5672587, -3.003366, 1, 0, 0, 1, 1,
-0.6598782, 1.837986, -0.1260254, 0, 0, 0, 1, 1,
-0.6548784, -2.493681, -4.391176, 0, 0, 0, 1, 1,
-0.6540986, 0.1502601, -0.5003599, 0, 0, 0, 1, 1,
-0.6390918, -0.1018364, -2.485786, 0, 0, 0, 1, 1,
-0.635639, 0.05124914, -2.69482, 0, 0, 0, 1, 1,
-0.6351416, 1.642618, -1.336258, 0, 0, 0, 1, 1,
-0.6343277, 0.008014848, -0.5713918, 0, 0, 0, 1, 1,
-0.6213098, -0.5247161, -4.622159, 1, 1, 1, 1, 1,
-0.6169478, 0.4693142, -1.273798, 1, 1, 1, 1, 1,
-0.6145705, 0.06353796, -1.237018, 1, 1, 1, 1, 1,
-0.6091809, -2.53101, -2.532723, 1, 1, 1, 1, 1,
-0.6081371, -0.23354, -2.848094, 1, 1, 1, 1, 1,
-0.6080894, 0.3765264, -1.400479, 1, 1, 1, 1, 1,
-0.6051943, 0.5072681, -1.537052, 1, 1, 1, 1, 1,
-0.5986328, 0.4132711, -0.6764559, 1, 1, 1, 1, 1,
-0.5951489, -0.7038258, -2.743064, 1, 1, 1, 1, 1,
-0.5893955, 0.8464592, -1.148123, 1, 1, 1, 1, 1,
-0.5855724, 0.02289501, -0.7388033, 1, 1, 1, 1, 1,
-0.5816051, 0.2149919, -0.1670073, 1, 1, 1, 1, 1,
-0.578968, -0.6429152, -1.887283, 1, 1, 1, 1, 1,
-0.5734391, -0.008331232, -0.6557373, 1, 1, 1, 1, 1,
-0.5720066, -1.831413, -4.694075, 1, 1, 1, 1, 1,
-0.5714268, -2.363081, -3.457727, 0, 0, 1, 1, 1,
-0.5708026, -1.637927, -2.052119, 1, 0, 0, 1, 1,
-0.5664204, 0.4463431, -2.243665, 1, 0, 0, 1, 1,
-0.5662398, 0.5821304, -0.7000985, 1, 0, 0, 1, 1,
-0.5658296, -0.5784428, -3.507896, 1, 0, 0, 1, 1,
-0.5621142, -0.4554223, -1.33272, 1, 0, 0, 1, 1,
-0.5601485, -1.108103, -2.222116, 0, 0, 0, 1, 1,
-0.5583115, 0.6098524, -0.5760974, 0, 0, 0, 1, 1,
-0.5560976, 0.1197326, -3.51238, 0, 0, 0, 1, 1,
-0.5554758, 0.28125, -1.472502, 0, 0, 0, 1, 1,
-0.5537896, -0.2513367, -3.755861, 0, 0, 0, 1, 1,
-0.553408, -0.3796436, -2.715971, 0, 0, 0, 1, 1,
-0.5463188, -0.3223269, -2.210436, 0, 0, 0, 1, 1,
-0.5462656, -0.4125839, -2.846832, 1, 1, 1, 1, 1,
-0.5417389, 0.7459456, -1.428876, 1, 1, 1, 1, 1,
-0.5368833, 2.262853, -0.5797855, 1, 1, 1, 1, 1,
-0.5349247, -0.6004446, -1.487964, 1, 1, 1, 1, 1,
-0.5343808, 0.08751084, -0.3336372, 1, 1, 1, 1, 1,
-0.5311244, 0.7385021, -2.083163, 1, 1, 1, 1, 1,
-0.5302764, 0.3052568, -1.46508, 1, 1, 1, 1, 1,
-0.528604, -0.6792065, -1.54672, 1, 1, 1, 1, 1,
-0.5250929, 1.314213, -0.6204736, 1, 1, 1, 1, 1,
-0.5200679, -0.2914252, -3.225788, 1, 1, 1, 1, 1,
-0.5159955, 0.759901, 0.6212645, 1, 1, 1, 1, 1,
-0.5135181, -1.182693, -3.841101, 1, 1, 1, 1, 1,
-0.512761, -0.571523, -3.310975, 1, 1, 1, 1, 1,
-0.5125578, -0.3940756, -3.045426, 1, 1, 1, 1, 1,
-0.5123873, -1.431968, -3.259676, 1, 1, 1, 1, 1,
-0.5123752, 2.568258, 0.5636427, 0, 0, 1, 1, 1,
-0.5111293, -1.320377, -3.087256, 1, 0, 0, 1, 1,
-0.5104313, 1.552237, -0.1467094, 1, 0, 0, 1, 1,
-0.5065091, -1.446706, -2.20348, 1, 0, 0, 1, 1,
-0.5054587, -0.08539197, -1.374869, 1, 0, 0, 1, 1,
-0.5035015, -0.3693255, -3.372845, 1, 0, 0, 1, 1,
-0.4967975, 1.777566, 2.032405, 0, 0, 0, 1, 1,
-0.4959287, -0.09456725, -3.306005, 0, 0, 0, 1, 1,
-0.4916271, -0.01122436, -0.3200307, 0, 0, 0, 1, 1,
-0.4862051, 0.4778583, -1.610335, 0, 0, 0, 1, 1,
-0.4844539, -0.7060582, -3.195702, 0, 0, 0, 1, 1,
-0.4840951, 0.2173505, -1.219515, 0, 0, 0, 1, 1,
-0.4835171, 0.9197331, -1.884422, 0, 0, 0, 1, 1,
-0.4823668, -1.888087, -3.8071, 1, 1, 1, 1, 1,
-0.4809837, -2.02437, -1.775764, 1, 1, 1, 1, 1,
-0.4808049, 0.6611962, 0.1393294, 1, 1, 1, 1, 1,
-0.4785837, -0.2509792, -2.980579, 1, 1, 1, 1, 1,
-0.4783691, -0.8488173, -4.031046, 1, 1, 1, 1, 1,
-0.4751356, -0.188548, -1.668444, 1, 1, 1, 1, 1,
-0.4718883, -1.636236, -2.410395, 1, 1, 1, 1, 1,
-0.4711858, 0.5530561, -0.9384782, 1, 1, 1, 1, 1,
-0.4691271, -1.402139, -2.479541, 1, 1, 1, 1, 1,
-0.4570827, -0.5619094, -3.392475, 1, 1, 1, 1, 1,
-0.455823, -1.219085, -1.894625, 1, 1, 1, 1, 1,
-0.4520823, 1.053389, -0.4304383, 1, 1, 1, 1, 1,
-0.446203, 1.599931, -1.191474, 1, 1, 1, 1, 1,
-0.4425812, 0.2149055, -0.9405659, 1, 1, 1, 1, 1,
-0.4414096, 0.7866119, 0.45273, 1, 1, 1, 1, 1,
-0.4362309, -0.2651615, -1.221392, 0, 0, 1, 1, 1,
-0.43335, 0.2441897, -1.100412, 1, 0, 0, 1, 1,
-0.4308181, 1.347107, 0.1279223, 1, 0, 0, 1, 1,
-0.4235341, 0.4064342, -1.79394, 1, 0, 0, 1, 1,
-0.4122551, 1.796724, -0.1591339, 1, 0, 0, 1, 1,
-0.40765, -2.263999, -2.256937, 1, 0, 0, 1, 1,
-0.4042208, -1.040205, -3.195097, 0, 0, 0, 1, 1,
-0.3975847, -0.3536547, -1.58843, 0, 0, 0, 1, 1,
-0.3964584, 0.2651573, 0.2172705, 0, 0, 0, 1, 1,
-0.3942931, -0.5214753, -2.453004, 0, 0, 0, 1, 1,
-0.3922949, -0.673357, -2.212964, 0, 0, 0, 1, 1,
-0.3826218, -0.7449945, -3.175439, 0, 0, 0, 1, 1,
-0.3810991, 1.313978, -0.3425905, 0, 0, 0, 1, 1,
-0.3806131, 1.769045, 0.1210158, 1, 1, 1, 1, 1,
-0.3771213, -0.3130327, -0.4682746, 1, 1, 1, 1, 1,
-0.3745456, -1.00286, -2.78883, 1, 1, 1, 1, 1,
-0.3716416, 0.8058489, -0.4777707, 1, 1, 1, 1, 1,
-0.3705914, 0.02399398, -0.7808482, 1, 1, 1, 1, 1,
-0.3675205, -1.398503, -2.563364, 1, 1, 1, 1, 1,
-0.365936, 1.259005, -0.6501522, 1, 1, 1, 1, 1,
-0.36454, -0.3122656, -3.024221, 1, 1, 1, 1, 1,
-0.3644605, 1.97438, -0.3340302, 1, 1, 1, 1, 1,
-0.3622423, -1.324503, -3.495275, 1, 1, 1, 1, 1,
-0.3614659, 1.623411, -1.214201, 1, 1, 1, 1, 1,
-0.3534023, 1.770656, 0.1397485, 1, 1, 1, 1, 1,
-0.3515179, -0.7555311, -3.338223, 1, 1, 1, 1, 1,
-0.3505463, -0.6480633, -4.526049, 1, 1, 1, 1, 1,
-0.3503781, 1.291234, -1.329954, 1, 1, 1, 1, 1,
-0.3488091, -0.8479472, -3.541919, 0, 0, 1, 1, 1,
-0.3471631, -1.55726, -4.541041, 1, 0, 0, 1, 1,
-0.3471204, -0.750652, -3.56834, 1, 0, 0, 1, 1,
-0.3468458, -0.2685276, -0.2733689, 1, 0, 0, 1, 1,
-0.3462945, -0.3980062, -1.743465, 1, 0, 0, 1, 1,
-0.3425151, -0.4150724, -0.5492715, 1, 0, 0, 1, 1,
-0.3400097, -0.4549164, -2.234823, 0, 0, 0, 1, 1,
-0.3382657, -0.5726258, -2.903806, 0, 0, 0, 1, 1,
-0.3367767, -0.263367, -3.6431, 0, 0, 0, 1, 1,
-0.3352752, -0.6714084, -3.216039, 0, 0, 0, 1, 1,
-0.3341886, 0.666493, 0.2028881, 0, 0, 0, 1, 1,
-0.3259823, -2.010057, -2.482604, 0, 0, 0, 1, 1,
-0.3244403, -0.8683385, -3.974724, 0, 0, 0, 1, 1,
-0.3175597, -0.4824413, -2.199623, 1, 1, 1, 1, 1,
-0.3170075, -1.294259, -1.224986, 1, 1, 1, 1, 1,
-0.3116089, -2.021265, -3.119655, 1, 1, 1, 1, 1,
-0.3098131, -1.433376, -3.313415, 1, 1, 1, 1, 1,
-0.3096401, 0.6678109, -0.4923358, 1, 1, 1, 1, 1,
-0.3094885, 0.7053207, -4.215945, 1, 1, 1, 1, 1,
-0.3081665, -0.7301632, -3.346403, 1, 1, 1, 1, 1,
-0.3047824, 0.396491, -0.5462005, 1, 1, 1, 1, 1,
-0.3023814, -0.8838186, -1.91164, 1, 1, 1, 1, 1,
-0.2992583, 0.5653138, -0.6100262, 1, 1, 1, 1, 1,
-0.2954056, -3.775683, -0.2743247, 1, 1, 1, 1, 1,
-0.2935988, 0.336741, -0.409668, 1, 1, 1, 1, 1,
-0.2897447, 0.03354416, -2.430057, 1, 1, 1, 1, 1,
-0.2850086, 0.6798402, 0.2476169, 1, 1, 1, 1, 1,
-0.2807413, 0.4727741, 0.1016947, 1, 1, 1, 1, 1,
-0.2803803, -0.2911874, -3.417641, 0, 0, 1, 1, 1,
-0.2785889, -0.009509387, -1.298677, 1, 0, 0, 1, 1,
-0.2748114, -2.515368, -2.045897, 1, 0, 0, 1, 1,
-0.2738155, -0.2054378, -2.402786, 1, 0, 0, 1, 1,
-0.2732148, 0.6888458, -0.3692572, 1, 0, 0, 1, 1,
-0.2717611, -1.256324, -1.598928, 1, 0, 0, 1, 1,
-0.2709786, 0.813829, -0.5962508, 0, 0, 0, 1, 1,
-0.2697999, 0.4076971, 0.2943381, 0, 0, 0, 1, 1,
-0.2683488, -1.14451, -2.779618, 0, 0, 0, 1, 1,
-0.2676592, -0.5301237, -3.06163, 0, 0, 0, 1, 1,
-0.2675794, 0.7109322, -0.6187037, 0, 0, 0, 1, 1,
-0.2672532, 1.405184, 0.976829, 0, 0, 0, 1, 1,
-0.2660951, -1.118073, -3.961863, 0, 0, 0, 1, 1,
-0.2659363, 1.724965, 0.2271365, 1, 1, 1, 1, 1,
-0.2607038, 0.6630749, 1.565921, 1, 1, 1, 1, 1,
-0.2606205, 0.8492296, 0.4871794, 1, 1, 1, 1, 1,
-0.2574939, 0.2741767, -1.101708, 1, 1, 1, 1, 1,
-0.2541851, -0.5643896, -3.671959, 1, 1, 1, 1, 1,
-0.2534323, -0.01640351, -2.940668, 1, 1, 1, 1, 1,
-0.2515264, -0.5368842, -3.304917, 1, 1, 1, 1, 1,
-0.250612, -0.02577933, -2.270315, 1, 1, 1, 1, 1,
-0.2466224, -0.006935939, -2.012051, 1, 1, 1, 1, 1,
-0.2436369, -0.3447477, -2.235765, 1, 1, 1, 1, 1,
-0.2402592, -0.7875927, -2.031891, 1, 1, 1, 1, 1,
-0.2397351, -0.3855382, -0.8336253, 1, 1, 1, 1, 1,
-0.2392429, 0.408545, -0.5727227, 1, 1, 1, 1, 1,
-0.2379587, -0.66527, -3.582865, 1, 1, 1, 1, 1,
-0.2349725, 2.261061, 0.07529265, 1, 1, 1, 1, 1,
-0.2302049, -1.861282, -1.765018, 0, 0, 1, 1, 1,
-0.2283092, 0.914106, -0.2551242, 1, 0, 0, 1, 1,
-0.2261285, -1.191958, -3.220348, 1, 0, 0, 1, 1,
-0.2239554, 0.08625418, -0.8957561, 1, 0, 0, 1, 1,
-0.221291, 1.280769, -2.407691, 1, 0, 0, 1, 1,
-0.2205826, 2.767128, 0.002025391, 1, 0, 0, 1, 1,
-0.2160118, -0.3736109, -3.356376, 0, 0, 0, 1, 1,
-0.2140137, -0.9506131, -3.491449, 0, 0, 0, 1, 1,
-0.213699, -0.4976209, -4.936296, 0, 0, 0, 1, 1,
-0.2125395, 0.3106089, 0.2502724, 0, 0, 0, 1, 1,
-0.2091991, -1.023161, -1.581139, 0, 0, 0, 1, 1,
-0.2080646, 1.189706, -0.1716825, 0, 0, 0, 1, 1,
-0.2068667, -0.7533525, -1.150478, 0, 0, 0, 1, 1,
-0.205691, 1.429018, -0.750162, 1, 1, 1, 1, 1,
-0.2043666, 0.06406879, -1.355444, 1, 1, 1, 1, 1,
-0.2037599, 0.7126161, -1.354846, 1, 1, 1, 1, 1,
-0.2015734, -0.5443505, -4.03417, 1, 1, 1, 1, 1,
-0.2007495, -0.02851771, -3.61624, 1, 1, 1, 1, 1,
-0.1990844, -1.827556, -1.319023, 1, 1, 1, 1, 1,
-0.1989094, 0.1647027, -0.7805967, 1, 1, 1, 1, 1,
-0.1943974, 0.194695, -0.4814211, 1, 1, 1, 1, 1,
-0.1906028, 0.3347782, -0.8658755, 1, 1, 1, 1, 1,
-0.1872798, -0.6425521, -1.136543, 1, 1, 1, 1, 1,
-0.1866894, -0.2958301, -1.823603, 1, 1, 1, 1, 1,
-0.1853186, 0.6858206, 0.7225829, 1, 1, 1, 1, 1,
-0.1849435, 0.1452971, -0.3187782, 1, 1, 1, 1, 1,
-0.1712627, -0.1592534, -1.251494, 1, 1, 1, 1, 1,
-0.1708016, 0.6381158, -0.8750365, 1, 1, 1, 1, 1,
-0.1650565, -1.23717, -3.079289, 0, 0, 1, 1, 1,
-0.1644674, -1.683897, -3.189438, 1, 0, 0, 1, 1,
-0.159624, 0.1395447, -1.054444, 1, 0, 0, 1, 1,
-0.1557501, -0.7980328, -3.769726, 1, 0, 0, 1, 1,
-0.1546408, -1.49172, -4.314343, 1, 0, 0, 1, 1,
-0.1536747, -1.056353, -2.299749, 1, 0, 0, 1, 1,
-0.1491106, -0.6108555, -3.74554, 0, 0, 0, 1, 1,
-0.1491047, -1.685551, -3.20549, 0, 0, 0, 1, 1,
-0.1484629, -0.5445341, -2.780566, 0, 0, 0, 1, 1,
-0.1450001, -0.3554058, -2.44517, 0, 0, 0, 1, 1,
-0.1440362, 2.048301, -0.9853134, 0, 0, 0, 1, 1,
-0.1424306, 0.3145311, -1.072182, 0, 0, 0, 1, 1,
-0.1351782, 0.3393054, -1.66302, 0, 0, 0, 1, 1,
-0.1341417, -0.8480775, -2.28161, 1, 1, 1, 1, 1,
-0.1305167, -0.9915839, -1.367375, 1, 1, 1, 1, 1,
-0.1299253, -0.5021319, -2.781275, 1, 1, 1, 1, 1,
-0.1295734, 1.017155, -0.1494727, 1, 1, 1, 1, 1,
-0.1290143, -0.1589891, -3.484801, 1, 1, 1, 1, 1,
-0.1271853, 1.911052, -0.6771149, 1, 1, 1, 1, 1,
-0.1236583, -0.1915843, -2.700899, 1, 1, 1, 1, 1,
-0.1222437, -0.4592667, -3.164206, 1, 1, 1, 1, 1,
-0.1207376, 0.645748, -2.023307, 1, 1, 1, 1, 1,
-0.115135, 0.5046999, 1.063183, 1, 1, 1, 1, 1,
-0.1110279, 0.2004091, -1.578247, 1, 1, 1, 1, 1,
-0.1050032, 2.751517, -0.5693139, 1, 1, 1, 1, 1,
-0.1022824, 1.079786, -1.802343, 1, 1, 1, 1, 1,
-0.09975128, -1.455806, -2.474769, 1, 1, 1, 1, 1,
-0.09847801, 0.9239734, -0.02978311, 1, 1, 1, 1, 1,
-0.09772123, 0.507938, -0.5708981, 0, 0, 1, 1, 1,
-0.09147196, -2.087258, -5.075646, 1, 0, 0, 1, 1,
-0.09091912, -0.9316952, -5.330894, 1, 0, 0, 1, 1,
-0.08845774, -1.028919, -2.946887, 1, 0, 0, 1, 1,
-0.08587085, -0.3150433, -3.574687, 1, 0, 0, 1, 1,
-0.0858375, -1.541263, -3.652281, 1, 0, 0, 1, 1,
-0.0818378, 0.243146, -1.494633, 0, 0, 0, 1, 1,
-0.07987155, -1.61243, -2.24362, 0, 0, 0, 1, 1,
-0.07907033, -1.55502, -3.921742, 0, 0, 0, 1, 1,
-0.07838133, -0.4180556, -4.589546, 0, 0, 0, 1, 1,
-0.07282195, 0.21802, 0.2063338, 0, 0, 0, 1, 1,
-0.07222919, -0.01018428, -2.139683, 0, 0, 0, 1, 1,
-0.06962194, -0.702808, -3.559532, 0, 0, 0, 1, 1,
-0.06893913, -1.878663, -3.704978, 1, 1, 1, 1, 1,
-0.05668209, 0.5697749, 1.729793, 1, 1, 1, 1, 1,
-0.05612442, 0.4809834, -0.2963888, 1, 1, 1, 1, 1,
-0.05400084, -0.3332465, -3.160104, 1, 1, 1, 1, 1,
-0.05056081, 1.114038, 0.9908399, 1, 1, 1, 1, 1,
-0.05029613, -0.7430005, -3.098396, 1, 1, 1, 1, 1,
-0.04598529, 0.03070549, -0.1943631, 1, 1, 1, 1, 1,
-0.04540906, 0.1720794, 0.7436129, 1, 1, 1, 1, 1,
-0.04393362, 0.04690199, -0.3108064, 1, 1, 1, 1, 1,
-0.04226195, -0.6620758, -2.779364, 1, 1, 1, 1, 1,
-0.03894904, -0.5567771, -4.094286, 1, 1, 1, 1, 1,
-0.0384266, 1.119272, 0.6929284, 1, 1, 1, 1, 1,
-0.03556418, -0.204825, -2.108964, 1, 1, 1, 1, 1,
-0.03481774, 0.7321419, 0.4257563, 1, 1, 1, 1, 1,
-0.03381971, 0.7150737, 1.007852, 1, 1, 1, 1, 1,
-0.02764932, -1.206413, -3.799718, 0, 0, 1, 1, 1,
-0.02746837, 0.5721701, 0.9427258, 1, 0, 0, 1, 1,
-0.02669016, 0.957531, -1.166361, 1, 0, 0, 1, 1,
-0.02560724, -1.41426, -3.775953, 1, 0, 0, 1, 1,
-0.02105638, -0.1530974, -2.873908, 1, 0, 0, 1, 1,
-0.01965725, -1.482561, -4.515443, 1, 0, 0, 1, 1,
-0.01901826, 0.8047853, -0.9653304, 0, 0, 0, 1, 1,
-0.01900987, -1.195292, -2.525377, 0, 0, 0, 1, 1,
-0.01735848, 1.637671, -0.6434114, 0, 0, 0, 1, 1,
-0.008167021, -1.74803, -3.76186, 0, 0, 0, 1, 1,
-0.003083432, 0.2762944, 0.6790302, 0, 0, 0, 1, 1,
-0.001576631, 0.08304747, 0.09009423, 0, 0, 0, 1, 1,
0.002840057, 0.8368468, -0.5539251, 0, 0, 0, 1, 1,
0.003424725, -1.083481, 2.800405, 1, 1, 1, 1, 1,
0.004485652, -0.6524779, 4.070069, 1, 1, 1, 1, 1,
0.004515543, 1.126, 0.6160007, 1, 1, 1, 1, 1,
0.01009864, 0.6520787, -1.271891, 1, 1, 1, 1, 1,
0.01047918, -1.716264, 2.378789, 1, 1, 1, 1, 1,
0.01106136, 0.7639175, 0.9782463, 1, 1, 1, 1, 1,
0.01278073, -0.5205793, 3.823458, 1, 1, 1, 1, 1,
0.01304534, -0.2471526, 4.922471, 1, 1, 1, 1, 1,
0.01381899, 1.003982, -2.048257, 1, 1, 1, 1, 1,
0.01417215, -1.08977, 4.186426, 1, 1, 1, 1, 1,
0.01549784, -0.7736982, 4.53235, 1, 1, 1, 1, 1,
0.01687391, 2.053061, -1.48964, 1, 1, 1, 1, 1,
0.01735409, -1.517647, 2.204603, 1, 1, 1, 1, 1,
0.02155925, 2.038939, -0.2519184, 1, 1, 1, 1, 1,
0.02451041, -0.4954389, 4.226254, 1, 1, 1, 1, 1,
0.02464498, -0.3727279, 1.583453, 0, 0, 1, 1, 1,
0.02677391, -0.6093609, 1.946095, 1, 0, 0, 1, 1,
0.02956023, -0.5501358, 0.9978762, 1, 0, 0, 1, 1,
0.03061887, -0.7541267, 2.818732, 1, 0, 0, 1, 1,
0.04034014, -0.4785624, 1.624075, 1, 0, 0, 1, 1,
0.0423039, -0.1069449, 3.903939, 1, 0, 0, 1, 1,
0.04448389, -0.177809, 3.987684, 0, 0, 0, 1, 1,
0.04824506, 1.183792, -1.012094, 0, 0, 0, 1, 1,
0.04987169, -0.02697026, 2.915334, 0, 0, 0, 1, 1,
0.05330528, -0.783382, 4.25699, 0, 0, 0, 1, 1,
0.05419849, 0.3925664, -0.6093962, 0, 0, 0, 1, 1,
0.05779324, 1.255305, -1.003145, 0, 0, 0, 1, 1,
0.06858542, 0.5281741, 0.1266638, 0, 0, 0, 1, 1,
0.06896553, 0.5297729, 0.1177644, 1, 1, 1, 1, 1,
0.07503591, -0.3392799, 2.685694, 1, 1, 1, 1, 1,
0.07608658, -2.201986, 1.783744, 1, 1, 1, 1, 1,
0.07660646, -0.1431006, 2.736006, 1, 1, 1, 1, 1,
0.07661866, -0.5795902, 5.161171, 1, 1, 1, 1, 1,
0.08327911, -0.5459353, 5.349829, 1, 1, 1, 1, 1,
0.08787104, 0.05798021, 1.937059, 1, 1, 1, 1, 1,
0.08939527, 0.5752691, 0.7823354, 1, 1, 1, 1, 1,
0.09127212, 1.637308, 1.946565, 1, 1, 1, 1, 1,
0.09154908, -0.2190707, 3.333889, 1, 1, 1, 1, 1,
0.09279347, -0.9348441, 3.02372, 1, 1, 1, 1, 1,
0.09413496, -0.3766948, 3.004817, 1, 1, 1, 1, 1,
0.09564494, -0.3343042, 0.5831198, 1, 1, 1, 1, 1,
0.09683459, 0.6929973, -0.5437104, 1, 1, 1, 1, 1,
0.1018988, -0.8455763, 4.052448, 1, 1, 1, 1, 1,
0.1031234, -0.7728331, 2.769302, 0, 0, 1, 1, 1,
0.1056399, -1.459241, -0.3204294, 1, 0, 0, 1, 1,
0.1116082, -0.3499528, 2.765903, 1, 0, 0, 1, 1,
0.117877, 0.9235424, -0.1984437, 1, 0, 0, 1, 1,
0.1182975, 1.26738, 1.152245, 1, 0, 0, 1, 1,
0.1229179, 0.6238828, 0.3920111, 1, 0, 0, 1, 1,
0.1286825, -0.02366998, 2.600853, 0, 0, 0, 1, 1,
0.1294328, -1.651571, 3.729229, 0, 0, 0, 1, 1,
0.1347354, -0.9788297, 4.48896, 0, 0, 0, 1, 1,
0.1396785, -0.25795, 2.549867, 0, 0, 0, 1, 1,
0.1411743, -1.032877, 5.185832, 0, 0, 0, 1, 1,
0.1420044, -0.4625148, 4.200372, 0, 0, 0, 1, 1,
0.1441218, -0.1758272, 2.400639, 0, 0, 0, 1, 1,
0.1477021, -0.380828, 3.037286, 1, 1, 1, 1, 1,
0.1482277, 1.664646, -0.1365504, 1, 1, 1, 1, 1,
0.1544916, -0.6462551, 2.733982, 1, 1, 1, 1, 1,
0.1578199, 0.9743802, 0.3018681, 1, 1, 1, 1, 1,
0.171936, -0.1693639, 2.786557, 1, 1, 1, 1, 1,
0.1796896, 0.3360345, -0.2299632, 1, 1, 1, 1, 1,
0.1797421, -0.7348813, 3.174411, 1, 1, 1, 1, 1,
0.1807733, 0.04157938, 1.03743, 1, 1, 1, 1, 1,
0.1863602, -0.3988885, 4.111199, 1, 1, 1, 1, 1,
0.1872755, -0.428266, 3.136579, 1, 1, 1, 1, 1,
0.1894599, 1.250678, -0.3602754, 1, 1, 1, 1, 1,
0.1901441, -0.1996418, 4.67976, 1, 1, 1, 1, 1,
0.1914147, 0.6894494, -1.27394, 1, 1, 1, 1, 1,
0.1954479, 0.1180954, -0.8713909, 1, 1, 1, 1, 1,
0.2009553, 0.6115135, 1.02468, 1, 1, 1, 1, 1,
0.2017878, 0.2838629, 0.9001592, 0, 0, 1, 1, 1,
0.2062719, -0.6436973, 1.925467, 1, 0, 0, 1, 1,
0.2066831, -0.5219389, 3.494525, 1, 0, 0, 1, 1,
0.2067752, 0.1923297, -0.6243111, 1, 0, 0, 1, 1,
0.207067, -0.5718631, 3.066522, 1, 0, 0, 1, 1,
0.2076638, -1.132675, 2.740233, 1, 0, 0, 1, 1,
0.2137971, -0.05173197, 1.471957, 0, 0, 0, 1, 1,
0.2192345, -1.801823, 4.145261, 0, 0, 0, 1, 1,
0.2214171, -0.2135438, 1.207464, 0, 0, 0, 1, 1,
0.2272967, 0.4296905, 1.019481, 0, 0, 0, 1, 1,
0.2290072, -0.6963181, 3.47006, 0, 0, 0, 1, 1,
0.2299138, -1.307047, 4.024185, 0, 0, 0, 1, 1,
0.2347229, 0.04786586, 1.324233, 0, 0, 0, 1, 1,
0.236618, -0.9657059, 1.296321, 1, 1, 1, 1, 1,
0.24338, -0.08267261, 0.3119414, 1, 1, 1, 1, 1,
0.2439481, 0.04291864, 1.328988, 1, 1, 1, 1, 1,
0.2447687, 0.5406568, 1.883182, 1, 1, 1, 1, 1,
0.250701, -1.209325, 1.612692, 1, 1, 1, 1, 1,
0.2509636, -1.456224, 1.816035, 1, 1, 1, 1, 1,
0.2584074, 0.6261076, -0.5994054, 1, 1, 1, 1, 1,
0.2586987, 0.8266622, 0.3345615, 1, 1, 1, 1, 1,
0.2603698, 1.347007, -0.377159, 1, 1, 1, 1, 1,
0.2624847, 1.180662, 0.159768, 1, 1, 1, 1, 1,
0.2626371, 1.252861, -1.978901, 1, 1, 1, 1, 1,
0.2628575, -0.07383525, 0.9986948, 1, 1, 1, 1, 1,
0.2636379, -0.7329039, 4.045525, 1, 1, 1, 1, 1,
0.2666131, 1.631557, -1.120407, 1, 1, 1, 1, 1,
0.2696673, 0.9465293, -2.760943, 1, 1, 1, 1, 1,
0.2699358, -0.1797702, 1.599712, 0, 0, 1, 1, 1,
0.2769941, -0.5405433, 1.692759, 1, 0, 0, 1, 1,
0.2771537, 0.04111606, 2.168174, 1, 0, 0, 1, 1,
0.2808912, 0.4102682, 2.318207, 1, 0, 0, 1, 1,
0.2826972, -1.418165, 3.986406, 1, 0, 0, 1, 1,
0.2827553, 0.5134175, -0.2851599, 1, 0, 0, 1, 1,
0.2862163, 0.09542202, 1.683174, 0, 0, 0, 1, 1,
0.2874447, -0.5724921, 3.07925, 0, 0, 0, 1, 1,
0.2950998, -0.9230887, 6.051755, 0, 0, 0, 1, 1,
0.298522, 0.5383129, -0.4825653, 0, 0, 0, 1, 1,
0.298931, 0.4415024, -1.121811, 0, 0, 0, 1, 1,
0.3085051, 1.438294, -0.3468161, 0, 0, 0, 1, 1,
0.3087909, -0.138544, 1.004426, 0, 0, 0, 1, 1,
0.3094953, 0.1357991, 1.84051, 1, 1, 1, 1, 1,
0.3112472, 0.7931923, -0.8829098, 1, 1, 1, 1, 1,
0.3115681, 1.773649, 0.8155062, 1, 1, 1, 1, 1,
0.315417, 1.290548, -0.4768329, 1, 1, 1, 1, 1,
0.318844, -1.329228, 3.731306, 1, 1, 1, 1, 1,
0.3189281, 0.8206279, -0.08417206, 1, 1, 1, 1, 1,
0.3232341, 1.037555, 1.714981, 1, 1, 1, 1, 1,
0.3236928, 1.200412, 0.4481509, 1, 1, 1, 1, 1,
0.3283765, 0.3005684, 1.366485, 1, 1, 1, 1, 1,
0.3313105, 0.8982564, 0.531972, 1, 1, 1, 1, 1,
0.3332398, -1.078709, 2.766128, 1, 1, 1, 1, 1,
0.3340129, 0.4051644, 0.8108647, 1, 1, 1, 1, 1,
0.3345416, 0.4068683, -0.9907888, 1, 1, 1, 1, 1,
0.3352004, 1.969936, 0.7296853, 1, 1, 1, 1, 1,
0.3413043, 0.3566989, 0.5151392, 1, 1, 1, 1, 1,
0.3438266, 0.7722858, 0.9618629, 0, 0, 1, 1, 1,
0.3481951, -1.317686, 4.04738, 1, 0, 0, 1, 1,
0.3522828, 0.9787793, 0.04760733, 1, 0, 0, 1, 1,
0.3561396, 0.6830471, 1.382958, 1, 0, 0, 1, 1,
0.3568794, 0.893634, 0.6401697, 1, 0, 0, 1, 1,
0.3625738, -0.7257772, 0.67136, 1, 0, 0, 1, 1,
0.3643745, 2.099458, 0.1192664, 0, 0, 0, 1, 1,
0.3665042, 0.7360228, 0.823973, 0, 0, 0, 1, 1,
0.3671977, 0.2884997, 2.132215, 0, 0, 0, 1, 1,
0.3675571, 0.4324138, 0.5855738, 0, 0, 0, 1, 1,
0.3704774, 0.311464, 0.5793726, 0, 0, 0, 1, 1,
0.3719942, 0.3586265, 1.64823, 0, 0, 0, 1, 1,
0.3726231, -0.2945997, 1.982616, 0, 0, 0, 1, 1,
0.3730811, 0.8106928, -1.536636, 1, 1, 1, 1, 1,
0.3739539, -1.106928, 3.075649, 1, 1, 1, 1, 1,
0.375115, 0.7003128, 0.5169708, 1, 1, 1, 1, 1,
0.3812428, -0.5429649, 1.769557, 1, 1, 1, 1, 1,
0.383653, 1.166114, 0.395711, 1, 1, 1, 1, 1,
0.3971747, 0.6236696, 1.355744, 1, 1, 1, 1, 1,
0.3987514, 1.612867, 0.2373022, 1, 1, 1, 1, 1,
0.400858, 0.4250157, 0.8485516, 1, 1, 1, 1, 1,
0.4050039, -0.8517217, 2.332392, 1, 1, 1, 1, 1,
0.407987, 0.08603001, 2.748689, 1, 1, 1, 1, 1,
0.4080514, -0.6089439, 1.557194, 1, 1, 1, 1, 1,
0.4124585, -0.7200948, 4.147759, 1, 1, 1, 1, 1,
0.4132415, 0.1360761, 0.7191954, 1, 1, 1, 1, 1,
0.4193752, 0.2230531, -1.203099, 1, 1, 1, 1, 1,
0.4195405, -1.312829, 3.598037, 1, 1, 1, 1, 1,
0.4195599, 0.5502293, -0.4252859, 0, 0, 1, 1, 1,
0.4202057, 0.3051467, -0.06689691, 1, 0, 0, 1, 1,
0.4289101, 0.1347659, 2.429583, 1, 0, 0, 1, 1,
0.4364834, -0.1504619, 1.681101, 1, 0, 0, 1, 1,
0.4368355, -3.109436, 3.0508, 1, 0, 0, 1, 1,
0.4402527, 0.877546, -0.977601, 1, 0, 0, 1, 1,
0.4421812, 1.432474, 1.066357, 0, 0, 0, 1, 1,
0.4477741, -0.06319013, 2.867612, 0, 0, 0, 1, 1,
0.4477865, -1.338358, 3.621161, 0, 0, 0, 1, 1,
0.4536112, 0.4845192, 0.6142058, 0, 0, 0, 1, 1,
0.4614398, -0.1234015, 1.256417, 0, 0, 0, 1, 1,
0.4624094, -0.08630713, 3.794578, 0, 0, 0, 1, 1,
0.4624311, -1.576745, 2.534166, 0, 0, 0, 1, 1,
0.4682735, -0.260014, 0.3557509, 1, 1, 1, 1, 1,
0.4702375, 0.4117516, 1.508421, 1, 1, 1, 1, 1,
0.4703739, -0.1721886, 2.815418, 1, 1, 1, 1, 1,
0.4711926, 0.3595814, 0.9555615, 1, 1, 1, 1, 1,
0.4720309, -0.7307367, 0.5954393, 1, 1, 1, 1, 1,
0.4807216, 1.406963, 1.420153, 1, 1, 1, 1, 1,
0.482227, -0.4019843, 2.268508, 1, 1, 1, 1, 1,
0.4878747, 0.5788287, 0.09664268, 1, 1, 1, 1, 1,
0.4923031, -1.876003, 1.542574, 1, 1, 1, 1, 1,
0.4934525, 0.8943703, 1.013461, 1, 1, 1, 1, 1,
0.4937712, 1.148165, 0.4524866, 1, 1, 1, 1, 1,
0.4962086, -1.630633, 2.703542, 1, 1, 1, 1, 1,
0.4963382, 1.37334, 0.04539212, 1, 1, 1, 1, 1,
0.5006486, -0.3401493, 0.9957389, 1, 1, 1, 1, 1,
0.5040209, -1.031558, 1.64672, 1, 1, 1, 1, 1,
0.5056693, 0.4876537, 1.175693, 0, 0, 1, 1, 1,
0.506914, 0.7888954, 0.8276289, 1, 0, 0, 1, 1,
0.5103394, -0.8912271, 4.509314, 1, 0, 0, 1, 1,
0.5136642, 1.20784, 0.1879072, 1, 0, 0, 1, 1,
0.5142996, 0.1718541, 0.777426, 1, 0, 0, 1, 1,
0.5149621, -0.3089132, 3.795121, 1, 0, 0, 1, 1,
0.5153502, 1.593559, -0.6759452, 0, 0, 0, 1, 1,
0.5250384, -0.738787, 2.569883, 0, 0, 0, 1, 1,
0.5292256, -1.093248, 2.702218, 0, 0, 0, 1, 1,
0.5307311, 0.6828589, 0.1256256, 0, 0, 0, 1, 1,
0.531296, 1.162505, 0.1413075, 0, 0, 0, 1, 1,
0.5357603, -0.07053971, 2.263618, 0, 0, 0, 1, 1,
0.5363226, -1.130233, 2.878314, 0, 0, 0, 1, 1,
0.5376012, -0.6557004, 2.742966, 1, 1, 1, 1, 1,
0.5450673, -0.7851278, 3.953275, 1, 1, 1, 1, 1,
0.5465282, -0.3515914, 2.964677, 1, 1, 1, 1, 1,
0.547185, 0.3544101, 0.6795965, 1, 1, 1, 1, 1,
0.5555938, -1.047941, 3.387365, 1, 1, 1, 1, 1,
0.5670033, 0.4104584, 1.34841, 1, 1, 1, 1, 1,
0.5689214, -1.729505, 2.663857, 1, 1, 1, 1, 1,
0.5712091, -0.3370065, 0.343655, 1, 1, 1, 1, 1,
0.5712384, 1.203032, -0.785023, 1, 1, 1, 1, 1,
0.5731694, -2.029766, 4.200371, 1, 1, 1, 1, 1,
0.5765029, 0.05567122, 1.197981, 1, 1, 1, 1, 1,
0.5866717, 0.115511, 0.9392012, 1, 1, 1, 1, 1,
0.5883308, -0.5039234, 4.112279, 1, 1, 1, 1, 1,
0.5887265, -0.919165, 1.358121, 1, 1, 1, 1, 1,
0.5892109, 0.7015783, 1.948905, 1, 1, 1, 1, 1,
0.5927486, -0.2704056, 5.060521, 0, 0, 1, 1, 1,
0.5934688, 1.120518, 1.816625, 1, 0, 0, 1, 1,
0.5941429, -0.2251627, 2.208643, 1, 0, 0, 1, 1,
0.6012057, -0.2691365, 2.442165, 1, 0, 0, 1, 1,
0.6036168, 0.1722796, 2.032905, 1, 0, 0, 1, 1,
0.6124086, 0.7834359, -0.2551041, 1, 0, 0, 1, 1,
0.6139356, -1.59548, 3.247815, 0, 0, 0, 1, 1,
0.6160505, 1.107473, 0.1017622, 0, 0, 0, 1, 1,
0.6189885, 0.5020316, 0.3993849, 0, 0, 0, 1, 1,
0.6221498, -0.3465181, 2.040937, 0, 0, 0, 1, 1,
0.6248704, 1.419727, 0.6648193, 0, 0, 0, 1, 1,
0.6280053, -1.157334, 0.9104491, 0, 0, 0, 1, 1,
0.6308714, -0.5593134, 3.949463, 0, 0, 0, 1, 1,
0.637903, -1.421802, 4.616451, 1, 1, 1, 1, 1,
0.6386827, -0.01940846, 0.7389966, 1, 1, 1, 1, 1,
0.6415454, -1.146226, 2.233947, 1, 1, 1, 1, 1,
0.6498475, 0.09069825, 1.496308, 1, 1, 1, 1, 1,
0.6514301, -1.301591, 3.698427, 1, 1, 1, 1, 1,
0.6521905, 0.6563945, 2.356782, 1, 1, 1, 1, 1,
0.6522271, 0.275609, 1.198847, 1, 1, 1, 1, 1,
0.6586282, 1.37384, -0.6850587, 1, 1, 1, 1, 1,
0.6617951, -0.7285493, 1.97414, 1, 1, 1, 1, 1,
0.6628016, 0.7286554, -0.432616, 1, 1, 1, 1, 1,
0.6642749, -0.1658867, 2.014638, 1, 1, 1, 1, 1,
0.6662397, -0.6668533, 1.38995, 1, 1, 1, 1, 1,
0.667679, -0.2399595, 3.353895, 1, 1, 1, 1, 1,
0.670201, 0.02458166, 3.369161, 1, 1, 1, 1, 1,
0.6706839, 2.09094, 0.6863078, 1, 1, 1, 1, 1,
0.6750666, 0.7723895, -0.08498629, 0, 0, 1, 1, 1,
0.6776342, 1.540989, 0.1515731, 1, 0, 0, 1, 1,
0.6781474, -0.3583269, 2.924863, 1, 0, 0, 1, 1,
0.6808539, -1.156749, 2.929277, 1, 0, 0, 1, 1,
0.6848575, -0.2773541, 1.654494, 1, 0, 0, 1, 1,
0.6898211, -0.2624643, 0.9188147, 1, 0, 0, 1, 1,
0.6920452, 1.230894, 0.5625942, 0, 0, 0, 1, 1,
0.6925189, 0.820492, 0.8796505, 0, 0, 0, 1, 1,
0.7097707, 0.1908934, 3.343251, 0, 0, 0, 1, 1,
0.7106096, -1.069528, 2.078714, 0, 0, 0, 1, 1,
0.720918, 2.207301, -0.1064678, 0, 0, 0, 1, 1,
0.725149, 0.1492883, 0.5276933, 0, 0, 0, 1, 1,
0.7276925, 0.2521461, 0.6173421, 0, 0, 0, 1, 1,
0.7285241, -1.119104, 2.162389, 1, 1, 1, 1, 1,
0.7333591, 0.2697284, 0.07573901, 1, 1, 1, 1, 1,
0.7342674, 0.3905305, 2.271114, 1, 1, 1, 1, 1,
0.7363272, 0.2117198, 0.7583432, 1, 1, 1, 1, 1,
0.7444758, -0.1028189, 1.918848, 1, 1, 1, 1, 1,
0.7474242, -0.1996245, 0.7953929, 1, 1, 1, 1, 1,
0.747515, 1.056377, 2.274574, 1, 1, 1, 1, 1,
0.7489496, 0.08589598, 0.7832657, 1, 1, 1, 1, 1,
0.7499087, -0.3200668, 2.572724, 1, 1, 1, 1, 1,
0.7508472, 0.2835291, 0.4894777, 1, 1, 1, 1, 1,
0.7509789, 0.7848268, 1.259049, 1, 1, 1, 1, 1,
0.7531552, 0.1773547, 1.399091, 1, 1, 1, 1, 1,
0.7573159, 1.065811, 0.1482019, 1, 1, 1, 1, 1,
0.7738152, -0.08969202, 2.106368, 1, 1, 1, 1, 1,
0.7801771, 0.8145503, 0.4365917, 1, 1, 1, 1, 1,
0.7820197, 0.450128, 0.5100802, 0, 0, 1, 1, 1,
0.7859237, 1.105092, 0.3048996, 1, 0, 0, 1, 1,
0.7859356, -0.2336806, 1.289557, 1, 0, 0, 1, 1,
0.7861684, 1.119724, 0.2849138, 1, 0, 0, 1, 1,
0.7869225, -0.9081706, 3.897987, 1, 0, 0, 1, 1,
0.7877662, 0.2349975, -0.7536126, 1, 0, 0, 1, 1,
0.7949026, 0.1805118, 1.327718, 0, 0, 0, 1, 1,
0.8040859, -0.8513018, 1.893632, 0, 0, 0, 1, 1,
0.8057641, -0.471177, 3.599974, 0, 0, 0, 1, 1,
0.8062658, 0.3284743, 2.778643, 0, 0, 0, 1, 1,
0.8073823, 0.2351942, 0.1581182, 0, 0, 0, 1, 1,
0.8116479, -0.8996242, 3.302732, 0, 0, 0, 1, 1,
0.8140841, 0.7837091, 2.337387, 0, 0, 0, 1, 1,
0.8232098, 0.5231051, -0.1939765, 1, 1, 1, 1, 1,
0.824098, 0.6784961, 0.0807367, 1, 1, 1, 1, 1,
0.8303822, -1.650604, 3.192736, 1, 1, 1, 1, 1,
0.8325857, -1.56199, 2.699568, 1, 1, 1, 1, 1,
0.8354466, -1.538975, 3.8933, 1, 1, 1, 1, 1,
0.841379, -2.319511, 2.154532, 1, 1, 1, 1, 1,
0.8416909, 0.5207376, 0.4820253, 1, 1, 1, 1, 1,
0.8492405, 0.8672454, 1.09463, 1, 1, 1, 1, 1,
0.8503139, -1.14092, 1.478232, 1, 1, 1, 1, 1,
0.8545166, -0.08417057, 2.524534, 1, 1, 1, 1, 1,
0.8556232, -0.9394292, 2.782842, 1, 1, 1, 1, 1,
0.8575678, 0.4544877, 0.5739583, 1, 1, 1, 1, 1,
0.8587478, -1.324755, 1.959982, 1, 1, 1, 1, 1,
0.8690367, -1.290906, 3.303026, 1, 1, 1, 1, 1,
0.8802177, 1.033764, 1.795042, 1, 1, 1, 1, 1,
0.8803442, 0.388311, 0.9598042, 0, 0, 1, 1, 1,
0.8901927, 0.06299126, 1.474412, 1, 0, 0, 1, 1,
0.8902221, -0.222758, 2.164234, 1, 0, 0, 1, 1,
0.8920295, -0.3318255, 1.588028, 1, 0, 0, 1, 1,
0.8969451, -1.585359, 0.986195, 1, 0, 0, 1, 1,
0.9021938, 0.03791365, 1.5093, 1, 0, 0, 1, 1,
0.9130191, -0.4252038, 0.9542562, 0, 0, 0, 1, 1,
0.9194437, -2.2308, 3.414416, 0, 0, 0, 1, 1,
0.9225266, 1.325699, 0.03011057, 0, 0, 0, 1, 1,
0.932299, 1.771575, -0.8489028, 0, 0, 0, 1, 1,
0.9386543, 0.05522037, 1.671218, 0, 0, 0, 1, 1,
0.9393172, 0.1538993, 1.362963, 0, 0, 0, 1, 1,
0.9455284, 0.1613937, 0.4706004, 0, 0, 0, 1, 1,
0.9491213, -0.2496974, 1.040428, 1, 1, 1, 1, 1,
0.9514959, 0.005977976, 1.960808, 1, 1, 1, 1, 1,
0.9536543, -0.8197923, 2.957155, 1, 1, 1, 1, 1,
0.9681264, 1.318534, 0.1332139, 1, 1, 1, 1, 1,
0.9688264, -0.876808, 3.142892, 1, 1, 1, 1, 1,
0.9703018, 0.4739754, 0.6191502, 1, 1, 1, 1, 1,
0.9731963, -1.955706, 3.466405, 1, 1, 1, 1, 1,
0.9737136, 1.097625, 2.502892, 1, 1, 1, 1, 1,
0.9881718, -0.4014195, 1.16098, 1, 1, 1, 1, 1,
0.9947367, -1.345694, 3.100355, 1, 1, 1, 1, 1,
1.002798, 1.442556, 1.307491, 1, 1, 1, 1, 1,
1.003042, 0.3427436, 1.176114, 1, 1, 1, 1, 1,
1.003667, 0.6616362, 1.313464, 1, 1, 1, 1, 1,
1.003826, 0.02259705, 0.4124456, 1, 1, 1, 1, 1,
1.028327, -0.5507032, 1.99411, 1, 1, 1, 1, 1,
1.029837, 0.9044272, 1.299497, 0, 0, 1, 1, 1,
1.0321, 0.8041793, -0.3849686, 1, 0, 0, 1, 1,
1.035773, 1.118916, -0.3245674, 1, 0, 0, 1, 1,
1.041241, 0.7614346, 0.6912503, 1, 0, 0, 1, 1,
1.042637, 0.02625067, 1.34214, 1, 0, 0, 1, 1,
1.043083, 0.5706413, 0.6792896, 1, 0, 0, 1, 1,
1.046401, 0.9243098, -0.0293859, 0, 0, 0, 1, 1,
1.047309, -0.9154489, 2.554313, 0, 0, 0, 1, 1,
1.049384, -1.740264, 2.699995, 0, 0, 0, 1, 1,
1.055505, -0.8781518, 1.521613, 0, 0, 0, 1, 1,
1.057444, 0.3603658, 1.849501, 0, 0, 0, 1, 1,
1.059159, -0.8693489, 2.886416, 0, 0, 0, 1, 1,
1.072562, -0.2289938, 0.2186256, 0, 0, 0, 1, 1,
1.082509, -2.211333, 2.925053, 1, 1, 1, 1, 1,
1.083088, -0.681097, 1.868508, 1, 1, 1, 1, 1,
1.083914, 1.805909, -0.961807, 1, 1, 1, 1, 1,
1.090224, 1.867084, -0.6198502, 1, 1, 1, 1, 1,
1.092208, -0.2652794, 1.994318, 1, 1, 1, 1, 1,
1.092371, 1.643558, -0.4899453, 1, 1, 1, 1, 1,
1.110111, -1.620201, 2.83926, 1, 1, 1, 1, 1,
1.113552, -0.2376158, 1.363424, 1, 1, 1, 1, 1,
1.114288, -1.498529, 1.928257, 1, 1, 1, 1, 1,
1.11846, 0.9935665, 0.8611485, 1, 1, 1, 1, 1,
1.12148, -1.121042, 1.516251, 1, 1, 1, 1, 1,
1.123103, -0.894533, 1.871688, 1, 1, 1, 1, 1,
1.124945, -1.232894, 4.217103, 1, 1, 1, 1, 1,
1.129688, -0.3005901, 1.793797, 1, 1, 1, 1, 1,
1.130642, 0.2080154, -0.6209986, 1, 1, 1, 1, 1,
1.138342, 0.7783577, 2.30797, 0, 0, 1, 1, 1,
1.139132, 0.4529854, 1.250047, 1, 0, 0, 1, 1,
1.139248, -0.781206, 3.100011, 1, 0, 0, 1, 1,
1.147461, 0.1212747, 0.1095381, 1, 0, 0, 1, 1,
1.15471, -0.6871716, 3.254856, 1, 0, 0, 1, 1,
1.157846, -1.516872, 0.4626568, 1, 0, 0, 1, 1,
1.158164, -1.321972, 1.714339, 0, 0, 0, 1, 1,
1.158955, -1.35123, 0.06476624, 0, 0, 0, 1, 1,
1.162402, 1.45499, 1.920325, 0, 0, 0, 1, 1,
1.163405, -0.5317314, 2.886651, 0, 0, 0, 1, 1,
1.171047, -1.977302, 3.600576, 0, 0, 0, 1, 1,
1.174934, 0.6792856, 0.7195857, 0, 0, 0, 1, 1,
1.181341, 1.851955, 0.4716139, 0, 0, 0, 1, 1,
1.181764, -0.5152916, 2.550427, 1, 1, 1, 1, 1,
1.188395, -0.18692, 1.119779, 1, 1, 1, 1, 1,
1.2024, 0.3211734, 2.197747, 1, 1, 1, 1, 1,
1.205052, 1.053608, 0.8258865, 1, 1, 1, 1, 1,
1.216773, -0.5728383, 1.37432, 1, 1, 1, 1, 1,
1.217622, -0.4433476, 0.7934433, 1, 1, 1, 1, 1,
1.221176, -0.6342684, 1.048656, 1, 1, 1, 1, 1,
1.235594, -1.51546, 3.931998, 1, 1, 1, 1, 1,
1.247147, 0.6037399, -0.3062214, 1, 1, 1, 1, 1,
1.248589, 1.852958, 0.2169161, 1, 1, 1, 1, 1,
1.256296, 0.8398104, 1.103824, 1, 1, 1, 1, 1,
1.256521, -0.5750565, 1.930925, 1, 1, 1, 1, 1,
1.260673, 0.1709665, 2.834675, 1, 1, 1, 1, 1,
1.264434, -0.8558635, 3.30366, 1, 1, 1, 1, 1,
1.265849, 0.05112114, 1.855197, 1, 1, 1, 1, 1,
1.273455, -0.08019844, 0.5473313, 0, 0, 1, 1, 1,
1.275543, 1.477298, 1.201876, 1, 0, 0, 1, 1,
1.283869, 1.483799, 1.129233, 1, 0, 0, 1, 1,
1.288388, -1.383082, 3.60635, 1, 0, 0, 1, 1,
1.291178, 1.082679, 1.501972, 1, 0, 0, 1, 1,
1.291996, 0.5981836, 1.960201, 1, 0, 0, 1, 1,
1.294787, -1.001202, 1.968785, 0, 0, 0, 1, 1,
1.299341, -1.168926, 2.059355, 0, 0, 0, 1, 1,
1.304883, -0.6135976, 2.335209, 0, 0, 0, 1, 1,
1.309962, 0.1797198, 1.403589, 0, 0, 0, 1, 1,
1.31128, -0.4517294, 2.809493, 0, 0, 0, 1, 1,
1.311905, -0.01754397, -0.04792093, 0, 0, 0, 1, 1,
1.315241, -1.156089, 0.623889, 0, 0, 0, 1, 1,
1.317492, 0.495198, 2.705951, 1, 1, 1, 1, 1,
1.320542, 0.06634926, 2.769077, 1, 1, 1, 1, 1,
1.32615, -0.1052727, 2.63764, 1, 1, 1, 1, 1,
1.328104, -1.318775, 4.041925, 1, 1, 1, 1, 1,
1.334656, -0.2246509, 1.952876, 1, 1, 1, 1, 1,
1.341796, -0.2070165, 1.716809, 1, 1, 1, 1, 1,
1.359445, -1.305362, 1.45064, 1, 1, 1, 1, 1,
1.365997, -0.6522912, 2.585001, 1, 1, 1, 1, 1,
1.366845, 0.6751477, 0.1037441, 1, 1, 1, 1, 1,
1.376626, 0.2812539, -0.2278146, 1, 1, 1, 1, 1,
1.392521, -0.2909192, 2.519394, 1, 1, 1, 1, 1,
1.403848, -2.061489, 1.710704, 1, 1, 1, 1, 1,
1.409904, 1.079975, -0.7977239, 1, 1, 1, 1, 1,
1.414635, 1.565226, 0.4810477, 1, 1, 1, 1, 1,
1.416362, -0.1910307, 2.034878, 1, 1, 1, 1, 1,
1.419441, 0.08819382, 1.899887, 0, 0, 1, 1, 1,
1.421273, -2.805601, 4.271209, 1, 0, 0, 1, 1,
1.434509, 0.3482454, 0.4089654, 1, 0, 0, 1, 1,
1.44683, -1.339142, 1.582428, 1, 0, 0, 1, 1,
1.466397, 0.8166302, 1.664695, 1, 0, 0, 1, 1,
1.475318, 0.1113507, 2.735339, 1, 0, 0, 1, 1,
1.477754, 0.8297084, 2.0384, 0, 0, 0, 1, 1,
1.481162, 1.371413, 0.3267072, 0, 0, 0, 1, 1,
1.488505, 1.820199, 0.624953, 0, 0, 0, 1, 1,
1.499218, 0.03409085, 1.534427, 0, 0, 0, 1, 1,
1.508336, -2.442218, 2.629201, 0, 0, 0, 1, 1,
1.512171, -2.049643, 2.169359, 0, 0, 0, 1, 1,
1.513517, 1.427461, 1.157945, 0, 0, 0, 1, 1,
1.517549, 0.4384546, 2.23578, 1, 1, 1, 1, 1,
1.526864, 0.8318183, 0.5225076, 1, 1, 1, 1, 1,
1.557382, -2.297935, 2.592052, 1, 1, 1, 1, 1,
1.558751, 0.6397909, 0.04751349, 1, 1, 1, 1, 1,
1.562459, 1.362751, 3.035185, 1, 1, 1, 1, 1,
1.56831, -1.06364, 2.479683, 1, 1, 1, 1, 1,
1.578408, -1.099662, 1.506272, 1, 1, 1, 1, 1,
1.581443, 0.465697, 1.46226, 1, 1, 1, 1, 1,
1.587841, -0.250368, 0.3906862, 1, 1, 1, 1, 1,
1.606487, -0.8925595, 2.694526, 1, 1, 1, 1, 1,
1.611636, 1.235038, -1.449643, 1, 1, 1, 1, 1,
1.613392, 0.4207729, 2.936228, 1, 1, 1, 1, 1,
1.61493, -1.143266, 2.13568, 1, 1, 1, 1, 1,
1.615126, 0.7347603, 3.011273, 1, 1, 1, 1, 1,
1.616316, 0.6003345, 0.4592858, 1, 1, 1, 1, 1,
1.632936, -0.6928348, 2.094522, 0, 0, 1, 1, 1,
1.637607, 0.6107123, 1.999683, 1, 0, 0, 1, 1,
1.641636, -0.7926756, 4.191547, 1, 0, 0, 1, 1,
1.650459, 0.8781321, 1.868599, 1, 0, 0, 1, 1,
1.659557, 1.245777, 2.453849, 1, 0, 0, 1, 1,
1.683906, -0.7199801, 2.599758, 1, 0, 0, 1, 1,
1.701079, 0.01193743, 3.297376, 0, 0, 0, 1, 1,
1.711845, -0.3534344, 2.171347, 0, 0, 0, 1, 1,
1.712025, 0.839746, 1.791906, 0, 0, 0, 1, 1,
1.723358, 0.4844261, 1.787641, 0, 0, 0, 1, 1,
1.752515, -0.5799063, 3.238529, 0, 0, 0, 1, 1,
1.764733, 0.6794814, 0.09161278, 0, 0, 0, 1, 1,
1.766441, 0.1055364, 0.06042377, 0, 0, 0, 1, 1,
1.78529, 1.456195, -0.2524962, 1, 1, 1, 1, 1,
1.789206, -0.9102004, 2.076015, 1, 1, 1, 1, 1,
1.793226, 1.253866, 1.324375, 1, 1, 1, 1, 1,
1.823927, -0.2882545, 0.5673173, 1, 1, 1, 1, 1,
1.836884, -0.1291906, 3.932328, 1, 1, 1, 1, 1,
1.850403, -0.5965628, 2.796091, 1, 1, 1, 1, 1,
1.852988, 0.9376441, 1.8687, 1, 1, 1, 1, 1,
1.853419, -0.6625829, 1.340093, 1, 1, 1, 1, 1,
1.8553, 0.7880456, 1.342638, 1, 1, 1, 1, 1,
1.892875, -0.09509175, 0.6853685, 1, 1, 1, 1, 1,
1.895679, -1.370414, 2.121821, 1, 1, 1, 1, 1,
1.910262, 1.120943, 1.958676, 1, 1, 1, 1, 1,
1.913452, -0.1795181, -0.4004903, 1, 1, 1, 1, 1,
1.957862, -0.7738315, 1.256071, 1, 1, 1, 1, 1,
2.023138, 1.021571, -0.5868465, 1, 1, 1, 1, 1,
2.067048, 0.5046285, 1.05325, 0, 0, 1, 1, 1,
2.08209, 0.6379527, 2.770576, 1, 0, 0, 1, 1,
2.108626, 0.3995558, 2.286722, 1, 0, 0, 1, 1,
2.115109, -0.845844, 1.228246, 1, 0, 0, 1, 1,
2.118622, -0.6422738, 0.7376201, 1, 0, 0, 1, 1,
2.122715, 0.1193237, 2.159007, 1, 0, 0, 1, 1,
2.153614, -1.688195, 2.765028, 0, 0, 0, 1, 1,
2.159406, 2.342753, 1.929119, 0, 0, 0, 1, 1,
2.230983, 0.0349225, 0.766086, 0, 0, 0, 1, 1,
2.234745, 0.7129619, 1.032372, 0, 0, 0, 1, 1,
2.279194, 1.272725, 0.5498387, 0, 0, 0, 1, 1,
2.299476, 1.10095, 0.6013163, 0, 0, 0, 1, 1,
2.368878, 0.5952812, 2.143054, 0, 0, 0, 1, 1,
2.408614, -0.1503154, 0.2610935, 1, 1, 1, 1, 1,
2.447939, -0.5378011, 3.673893, 1, 1, 1, 1, 1,
2.620286, 1.234798, 0.2744849, 1, 1, 1, 1, 1,
2.673538, 0.9192174, 2.706027, 1, 1, 1, 1, 1,
2.929115, -1.324552, 1.551723, 1, 1, 1, 1, 1,
2.968718, 0.3168841, 0.7904903, 1, 1, 1, 1, 1,
3.355854, 0.5915, 2.880001, 1, 1, 1, 1, 1
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
var radius = 9.950039;
var distance = 34.94909;
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
mvMatrix.translate( -0.2194268, 0.3105919, -0.360431 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.94909);
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
