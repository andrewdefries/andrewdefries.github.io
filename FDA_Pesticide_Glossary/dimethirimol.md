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
-3.169904, 0.2340796, -2.446964, 1, 0, 0, 1,
-3.109599, -0.4487862, -2.410789, 1, 0.007843138, 0, 1,
-2.97829, 0.6583867, -0.4649268, 1, 0.01176471, 0, 1,
-2.703502, -1.512141, -2.580687, 1, 0.01960784, 0, 1,
-2.618352, 0.1078837, -1.889345, 1, 0.02352941, 0, 1,
-2.550932, -0.7756441, -3.341267, 1, 0.03137255, 0, 1,
-2.396555, -0.1085979, -1.620149, 1, 0.03529412, 0, 1,
-2.393051, 1.320477, -0.2912875, 1, 0.04313726, 0, 1,
-2.3618, -0.2780779, -2.747756, 1, 0.04705882, 0, 1,
-2.343093, 1.107376, -1.206757, 1, 0.05490196, 0, 1,
-2.325043, 2.22844, -1.065665, 1, 0.05882353, 0, 1,
-2.321539, -0.8172204, -0.7337118, 1, 0.06666667, 0, 1,
-2.297618, 1.901796, -0.5776937, 1, 0.07058824, 0, 1,
-2.29708, -0.5106666, -0.2270378, 1, 0.07843138, 0, 1,
-2.255837, -1.030867, -4.559614, 1, 0.08235294, 0, 1,
-2.153714, -0.6214455, -1.747507, 1, 0.09019608, 0, 1,
-2.145507, -1.402688, -1.277278, 1, 0.09411765, 0, 1,
-2.126337, 0.4889154, -0.05607324, 1, 0.1019608, 0, 1,
-2.054254, -0.5007758, -1.396552, 1, 0.1098039, 0, 1,
-2.042175, 0.2387475, -1.785714, 1, 0.1137255, 0, 1,
-2.021976, 0.2865335, 1.508117, 1, 0.1215686, 0, 1,
-2.011818, 0.7004795, -1.110861, 1, 0.1254902, 0, 1,
-2.009789, 2.590106, -1.460913, 1, 0.1333333, 0, 1,
-1.992103, -0.1570252, -2.191206, 1, 0.1372549, 0, 1,
-1.986503, -0.3530306, -1.376605, 1, 0.145098, 0, 1,
-1.972241, -0.944842, -2.88245, 1, 0.1490196, 0, 1,
-1.956049, -0.6268176, -1.653342, 1, 0.1568628, 0, 1,
-1.846179, 0.7794331, 1.377649, 1, 0.1607843, 0, 1,
-1.843843, -1.288941, -2.365427, 1, 0.1686275, 0, 1,
-1.815489, 0.5190997, -1.363868, 1, 0.172549, 0, 1,
-1.80964, -0.02259634, -2.25478, 1, 0.1803922, 0, 1,
-1.807175, -0.547021, -1.547654, 1, 0.1843137, 0, 1,
-1.796907, -1.249826, -1.691846, 1, 0.1921569, 0, 1,
-1.78539, -1.390907, -1.951807, 1, 0.1960784, 0, 1,
-1.78473, -0.3421052, -2.178389, 1, 0.2039216, 0, 1,
-1.783573, 1.383313, 0.9659785, 1, 0.2117647, 0, 1,
-1.780979, -0.2971722, -0.958636, 1, 0.2156863, 0, 1,
-1.774036, 0.6645122, -1.076229, 1, 0.2235294, 0, 1,
-1.759281, -0.9265247, -1.348459, 1, 0.227451, 0, 1,
-1.750292, 0.1317127, -0.1714875, 1, 0.2352941, 0, 1,
-1.739364, -2.136763, -2.394569, 1, 0.2392157, 0, 1,
-1.736543, 0.9181386, -2.321959, 1, 0.2470588, 0, 1,
-1.73487, -0.5046729, -1.17362, 1, 0.2509804, 0, 1,
-1.727084, 0.8214875, -0.9253606, 1, 0.2588235, 0, 1,
-1.712639, -1.042631, -2.024461, 1, 0.2627451, 0, 1,
-1.706417, 1.02106, -1.399156, 1, 0.2705882, 0, 1,
-1.705121, 0.0004334548, -0.2905287, 1, 0.2745098, 0, 1,
-1.690047, 1.045426, -1.090569, 1, 0.282353, 0, 1,
-1.655456, -1.393025, -1.373696, 1, 0.2862745, 0, 1,
-1.617213, 0.4476134, -0.9329531, 1, 0.2941177, 0, 1,
-1.613277, -1.52253, -1.880982, 1, 0.3019608, 0, 1,
-1.603909, -1.513016, -3.078784, 1, 0.3058824, 0, 1,
-1.601281, 1.306274, 0.4353922, 1, 0.3137255, 0, 1,
-1.585035, -1.19062, -2.091094, 1, 0.3176471, 0, 1,
-1.574949, 0.03686692, -2.758789, 1, 0.3254902, 0, 1,
-1.561011, 1.20077, -0.9089326, 1, 0.3294118, 0, 1,
-1.552389, -0.578089, -3.375504, 1, 0.3372549, 0, 1,
-1.532708, -0.9453155, -0.3163481, 1, 0.3411765, 0, 1,
-1.500465, -0.8644649, -2.436419, 1, 0.3490196, 0, 1,
-1.498579, -2.439806, -3.04876, 1, 0.3529412, 0, 1,
-1.496317, 0.5459081, -1.26656, 1, 0.3607843, 0, 1,
-1.491306, -0.5125553, -0.9969364, 1, 0.3647059, 0, 1,
-1.489037, 0.09785903, -0.4461408, 1, 0.372549, 0, 1,
-1.487139, -0.1625716, -4.416207, 1, 0.3764706, 0, 1,
-1.479872, -0.6116369, -1.090393, 1, 0.3843137, 0, 1,
-1.465384, 1.162919, 0.07090463, 1, 0.3882353, 0, 1,
-1.458531, -1.195812, -2.0496, 1, 0.3960784, 0, 1,
-1.451249, -0.7587085, -1.652207, 1, 0.4039216, 0, 1,
-1.449921, -0.3023483, -0.9602478, 1, 0.4078431, 0, 1,
-1.440809, 1.096519, -1.387999, 1, 0.4156863, 0, 1,
-1.434751, -1.549007, -3.186639, 1, 0.4196078, 0, 1,
-1.431657, -1.166827, -3.444885, 1, 0.427451, 0, 1,
-1.429187, 0.421462, -4.329175, 1, 0.4313726, 0, 1,
-1.424249, -0.9555399, -0.3705426, 1, 0.4392157, 0, 1,
-1.423032, -0.8103023, 1.019668, 1, 0.4431373, 0, 1,
-1.417596, -0.2944893, -2.256045, 1, 0.4509804, 0, 1,
-1.39855, -0.1492461, -2.476824, 1, 0.454902, 0, 1,
-1.385448, -1.048733, -2.389884, 1, 0.4627451, 0, 1,
-1.382547, 1.627568, 0.4051551, 1, 0.4666667, 0, 1,
-1.377347, -2.028816, -3.0437, 1, 0.4745098, 0, 1,
-1.376828, -1.103783, -3.413003, 1, 0.4784314, 0, 1,
-1.371513, 0.543705, -0.3324113, 1, 0.4862745, 0, 1,
-1.370492, 0.1644591, -0.3321404, 1, 0.4901961, 0, 1,
-1.366152, 0.07336441, -1.943698, 1, 0.4980392, 0, 1,
-1.363707, -0.6303471, -2.067948, 1, 0.5058824, 0, 1,
-1.36202, 1.161956, -1.0911, 1, 0.509804, 0, 1,
-1.351689, -0.7846885, -2.591719, 1, 0.5176471, 0, 1,
-1.350644, 2.869367, -0.1325061, 1, 0.5215687, 0, 1,
-1.350376, -0.05106716, -2.697526, 1, 0.5294118, 0, 1,
-1.330746, -0.4142376, -2.284538, 1, 0.5333334, 0, 1,
-1.322856, -0.7085205, -2.20734, 1, 0.5411765, 0, 1,
-1.311549, 0.1444404, -0.004597407, 1, 0.5450981, 0, 1,
-1.311477, 0.2997502, -0.8354951, 1, 0.5529412, 0, 1,
-1.307935, 1.687188, -1.093408, 1, 0.5568628, 0, 1,
-1.306394, -1.248796, -3.378264, 1, 0.5647059, 0, 1,
-1.302924, 0.6210997, -1.006955, 1, 0.5686275, 0, 1,
-1.299306, 1.611858, -1.644166, 1, 0.5764706, 0, 1,
-1.297583, -0.9434004, -2.776251, 1, 0.5803922, 0, 1,
-1.294081, -0.7888089, -3.174245, 1, 0.5882353, 0, 1,
-1.275064, -1.048724, -3.693847, 1, 0.5921569, 0, 1,
-1.273696, -0.03272254, -0.6421916, 1, 0.6, 0, 1,
-1.271315, -0.3252341, -4.248087, 1, 0.6078432, 0, 1,
-1.266394, -0.7387441, -1.582207, 1, 0.6117647, 0, 1,
-1.264809, -0.233716, -2.185129, 1, 0.6196079, 0, 1,
-1.263254, 0.679101, -2.24839, 1, 0.6235294, 0, 1,
-1.260062, -0.7284215, 0.3028684, 1, 0.6313726, 0, 1,
-1.260007, -0.9031872, -2.463414, 1, 0.6352941, 0, 1,
-1.23813, -1.708987, -0.9731926, 1, 0.6431373, 0, 1,
-1.233773, -0.742115, -1.019707, 1, 0.6470588, 0, 1,
-1.229385, -0.2996396, -1.437247, 1, 0.654902, 0, 1,
-1.224375, 2.323729, -0.2388339, 1, 0.6588235, 0, 1,
-1.221254, 1.020736, -0.65833, 1, 0.6666667, 0, 1,
-1.219819, 1.563708, 0.7244545, 1, 0.6705883, 0, 1,
-1.217308, 0.8688547, 0.2093674, 1, 0.6784314, 0, 1,
-1.216202, -0.01003332, -3.084419, 1, 0.682353, 0, 1,
-1.211374, 0.3114007, -1.917958, 1, 0.6901961, 0, 1,
-1.21004, -1.725743, -4.37899, 1, 0.6941177, 0, 1,
-1.209827, 1.008367, -0.7263056, 1, 0.7019608, 0, 1,
-1.209291, -0.4133871, -0.5599986, 1, 0.7098039, 0, 1,
-1.199116, 1.577129, -1.528925, 1, 0.7137255, 0, 1,
-1.198704, 0.5810146, -2.433458, 1, 0.7215686, 0, 1,
-1.196922, -0.2319688, -0.07339911, 1, 0.7254902, 0, 1,
-1.194935, -1.093358, -0.7830952, 1, 0.7333333, 0, 1,
-1.185606, -0.2393268, -2.772839, 1, 0.7372549, 0, 1,
-1.181418, -0.3711055, -1.808448, 1, 0.7450981, 0, 1,
-1.174693, 0.7719585, -0.5602909, 1, 0.7490196, 0, 1,
-1.169705, -1.088492, -1.403787, 1, 0.7568628, 0, 1,
-1.161593, -0.2536901, -1.481205, 1, 0.7607843, 0, 1,
-1.15949, 0.1698108, -1.782312, 1, 0.7686275, 0, 1,
-1.159084, 2.136399, -0.1696135, 1, 0.772549, 0, 1,
-1.157615, 0.3818992, -0.5316734, 1, 0.7803922, 0, 1,
-1.149911, 1.83909, -1.308609, 1, 0.7843137, 0, 1,
-1.142003, -1.706429, -3.72335, 1, 0.7921569, 0, 1,
-1.130073, -1.493752, -2.076485, 1, 0.7960784, 0, 1,
-1.128918, -0.7404836, -2.186908, 1, 0.8039216, 0, 1,
-1.115627, 0.9918982, -0.3979261, 1, 0.8117647, 0, 1,
-1.110224, -0.1870479, -2.087372, 1, 0.8156863, 0, 1,
-1.103844, 0.3677937, -1.663878, 1, 0.8235294, 0, 1,
-1.103133, 0.4402219, 0.578023, 1, 0.827451, 0, 1,
-1.097946, -0.1107164, -2.411175, 1, 0.8352941, 0, 1,
-1.095584, 0.008187016, -4.528282, 1, 0.8392157, 0, 1,
-1.090072, -0.9453433, -0.9131005, 1, 0.8470588, 0, 1,
-1.084389, 0.547498, -0.09013657, 1, 0.8509804, 0, 1,
-1.058936, -1.130078, -2.186409, 1, 0.8588235, 0, 1,
-1.058708, 0.0736168, -1.339345, 1, 0.8627451, 0, 1,
-1.056389, 0.6952943, 0.938584, 1, 0.8705882, 0, 1,
-1.053333, 0.1970823, -1.284922, 1, 0.8745098, 0, 1,
-1.049328, 0.1701649, -2.010581, 1, 0.8823529, 0, 1,
-1.044968, -0.1692097, -0.6382648, 1, 0.8862745, 0, 1,
-1.040005, 0.1978102, -2.423819, 1, 0.8941177, 0, 1,
-1.036271, 0.6755313, -0.5396413, 1, 0.8980392, 0, 1,
-1.033639, -0.7938077, -1.688031, 1, 0.9058824, 0, 1,
-1.028296, -0.603122, 0.177638, 1, 0.9137255, 0, 1,
-1.024655, 0.3297098, -0.8600144, 1, 0.9176471, 0, 1,
-1.019981, 1.623107, 1.20229, 1, 0.9254902, 0, 1,
-1.004277, 0.9359074, -2.806521, 1, 0.9294118, 0, 1,
-1.002699, -0.3171324, -0.4565998, 1, 0.9372549, 0, 1,
-1.00174, 0.667804, -1.265373, 1, 0.9411765, 0, 1,
-1.00001, -0.1693991, -2.27415, 1, 0.9490196, 0, 1,
-0.9966039, -2.319927, -3.287668, 1, 0.9529412, 0, 1,
-0.9897555, -0.2119469, -1.451889, 1, 0.9607843, 0, 1,
-0.9890921, -0.6437467, -0.9158821, 1, 0.9647059, 0, 1,
-0.9816592, 0.5769448, -1.679946, 1, 0.972549, 0, 1,
-0.9793657, -0.5950263, -2.075447, 1, 0.9764706, 0, 1,
-0.9712346, 2.865992, 0.9585332, 1, 0.9843137, 0, 1,
-0.9683896, -1.263428, -2.010176, 1, 0.9882353, 0, 1,
-0.9650533, 0.8612965, -1.639715, 1, 0.9960784, 0, 1,
-0.9584512, 0.6327386, -0.7718558, 0.9960784, 1, 0, 1,
-0.9583221, -1.347961, -1.388429, 0.9921569, 1, 0, 1,
-0.9572577, -0.091526, -2.145994, 0.9843137, 1, 0, 1,
-0.9544806, -1.905018, -1.817552, 0.9803922, 1, 0, 1,
-0.9461356, 0.09653635, -2.388215, 0.972549, 1, 0, 1,
-0.9440324, 0.2470111, -2.047771, 0.9686275, 1, 0, 1,
-0.941942, -0.5130543, -2.210479, 0.9607843, 1, 0, 1,
-0.9369102, 1.506244, -0.5611991, 0.9568627, 1, 0, 1,
-0.9276734, -0.3956203, -1.339116, 0.9490196, 1, 0, 1,
-0.9273019, -0.9259243, -2.514139, 0.945098, 1, 0, 1,
-0.9147012, -1.076857, -1.926326, 0.9372549, 1, 0, 1,
-0.9127474, -0.1031433, -3.475331, 0.9333333, 1, 0, 1,
-0.9114496, 1.187038, -0.09517542, 0.9254902, 1, 0, 1,
-0.9108181, -0.09475476, -1.913497, 0.9215686, 1, 0, 1,
-0.9055303, -1.670146, -3.118598, 0.9137255, 1, 0, 1,
-0.9053588, 0.3081225, 0.4502532, 0.9098039, 1, 0, 1,
-0.9044358, 0.2160526, -1.782694, 0.9019608, 1, 0, 1,
-0.9040366, 1.135995, -1.201147, 0.8941177, 1, 0, 1,
-0.9031026, 0.4588068, -0.4861875, 0.8901961, 1, 0, 1,
-0.8973896, -0.200257, -1.734513, 0.8823529, 1, 0, 1,
-0.8958235, -0.6852862, -2.022905, 0.8784314, 1, 0, 1,
-0.8922601, -0.3685011, -0.7832163, 0.8705882, 1, 0, 1,
-0.8899004, 1.423755, -0.5014967, 0.8666667, 1, 0, 1,
-0.8810865, 1.466279, -0.06064595, 0.8588235, 1, 0, 1,
-0.8799537, 1.846341, 1.130076, 0.854902, 1, 0, 1,
-0.8763407, -1.369585, -3.758451, 0.8470588, 1, 0, 1,
-0.8732673, -0.6079303, -1.034634, 0.8431373, 1, 0, 1,
-0.858186, 0.4057572, -0.8834775, 0.8352941, 1, 0, 1,
-0.8514269, -0.239677, -1.60812, 0.8313726, 1, 0, 1,
-0.8500226, -1.468096, -2.506649, 0.8235294, 1, 0, 1,
-0.849805, -0.1869168, -1.644612, 0.8196079, 1, 0, 1,
-0.8448587, 1.701356, -2.026744, 0.8117647, 1, 0, 1,
-0.8370695, 1.104668, -1.028166, 0.8078431, 1, 0, 1,
-0.8353944, 1.73495, -0.265505, 0.8, 1, 0, 1,
-0.825735, -2.125903, -1.001697, 0.7921569, 1, 0, 1,
-0.8225927, -0.7295537, -1.592441, 0.7882353, 1, 0, 1,
-0.8154212, 0.8422375, -0.6930332, 0.7803922, 1, 0, 1,
-0.815297, 0.01046375, -1.679932, 0.7764706, 1, 0, 1,
-0.8130826, 0.9270163, -1.698172, 0.7686275, 1, 0, 1,
-0.8119884, -1.907657, -2.78042, 0.7647059, 1, 0, 1,
-0.8073053, 1.078125, 0.7592533, 0.7568628, 1, 0, 1,
-0.8000209, 0.1588365, -0.6336753, 0.7529412, 1, 0, 1,
-0.793892, -0.2536072, -1.879153, 0.7450981, 1, 0, 1,
-0.7932521, -1.45037, -1.768075, 0.7411765, 1, 0, 1,
-0.7814498, -0.1954218, -2.923627, 0.7333333, 1, 0, 1,
-0.7785503, -0.635501, -1.76, 0.7294118, 1, 0, 1,
-0.7725301, -0.4061956, -2.139745, 0.7215686, 1, 0, 1,
-0.7648984, -0.3196335, 0.1415287, 0.7176471, 1, 0, 1,
-0.7646666, 0.183655, -0.4005223, 0.7098039, 1, 0, 1,
-0.7621492, 0.7632809, -1.993802, 0.7058824, 1, 0, 1,
-0.7581425, -2.247448, -2.506712, 0.6980392, 1, 0, 1,
-0.7580997, -1.521471, -4.014439, 0.6901961, 1, 0, 1,
-0.7489212, -0.9445478, -1.680978, 0.6862745, 1, 0, 1,
-0.740968, 1.14723, -0.1691639, 0.6784314, 1, 0, 1,
-0.7380375, 0.4120753, -1.151595, 0.6745098, 1, 0, 1,
-0.7297339, -0.2162883, -0.4786463, 0.6666667, 1, 0, 1,
-0.7284935, 0.8136662, -2.275531, 0.6627451, 1, 0, 1,
-0.7244871, 1.269946, -1.28948, 0.654902, 1, 0, 1,
-0.7238396, -1.298059, -4.254666, 0.6509804, 1, 0, 1,
-0.7229357, -1.348354, -2.473045, 0.6431373, 1, 0, 1,
-0.7206274, -0.1876132, -2.46073, 0.6392157, 1, 0, 1,
-0.7198297, -0.1227432, -2.504387, 0.6313726, 1, 0, 1,
-0.7192102, 0.589628, -1.855572, 0.627451, 1, 0, 1,
-0.7176504, -1.05159, -1.903815, 0.6196079, 1, 0, 1,
-0.7170669, 0.2351618, -1.840342, 0.6156863, 1, 0, 1,
-0.712998, 0.145889, -0.236089, 0.6078432, 1, 0, 1,
-0.7106163, -1.505775, -3.443344, 0.6039216, 1, 0, 1,
-0.7089198, 1.842054, -1.491646, 0.5960785, 1, 0, 1,
-0.7082469, -0.4311824, -2.763768, 0.5882353, 1, 0, 1,
-0.7076626, 0.008313458, -0.3296856, 0.5843138, 1, 0, 1,
-0.7073373, 1.462096, -1.176599, 0.5764706, 1, 0, 1,
-0.7066895, -2.50604, -2.62324, 0.572549, 1, 0, 1,
-0.7060646, 2.421788, 0.5200651, 0.5647059, 1, 0, 1,
-0.6933772, 1.717421, -1.505252, 0.5607843, 1, 0, 1,
-0.681312, -0.7843347, -3.809931, 0.5529412, 1, 0, 1,
-0.6799829, 0.05414115, -0.5499175, 0.5490196, 1, 0, 1,
-0.6793942, 0.02454242, -2.226132, 0.5411765, 1, 0, 1,
-0.6791085, 2.261998, 1.728745, 0.5372549, 1, 0, 1,
-0.6754203, 1.296342, 0.07766792, 0.5294118, 1, 0, 1,
-0.6729644, 0.8751696, -1.168173, 0.5254902, 1, 0, 1,
-0.6716842, 0.363904, -2.017531, 0.5176471, 1, 0, 1,
-0.6680443, 2.065722, -0.6746256, 0.5137255, 1, 0, 1,
-0.6586082, 0.2064179, -1.571057, 0.5058824, 1, 0, 1,
-0.6564344, -0.2318622, -1.692415, 0.5019608, 1, 0, 1,
-0.6545588, 2.29388, -1.223488, 0.4941176, 1, 0, 1,
-0.6531309, 1.590738, -2.64446, 0.4862745, 1, 0, 1,
-0.6521127, -0.399305, -1.432032, 0.4823529, 1, 0, 1,
-0.6506857, -1.521969, -2.102195, 0.4745098, 1, 0, 1,
-0.6504217, 1.339283, -0.4326975, 0.4705882, 1, 0, 1,
-0.6488866, -1.601967, -2.358789, 0.4627451, 1, 0, 1,
-0.6480134, -1.015373, -1.692179, 0.4588235, 1, 0, 1,
-0.6434165, 0.3790306, -2.907211, 0.4509804, 1, 0, 1,
-0.6408172, -0.5190781, -3.445014, 0.4470588, 1, 0, 1,
-0.6340618, 1.752735, -0.6660629, 0.4392157, 1, 0, 1,
-0.6320882, -0.04834849, -1.171496, 0.4352941, 1, 0, 1,
-0.6310065, -0.1494599, -2.749887, 0.427451, 1, 0, 1,
-0.617636, -0.6806593, -1.239187, 0.4235294, 1, 0, 1,
-0.6168896, -0.3951747, -1.675874, 0.4156863, 1, 0, 1,
-0.6128275, 0.4095054, -0.5012283, 0.4117647, 1, 0, 1,
-0.6061041, -0.2543037, -2.092411, 0.4039216, 1, 0, 1,
-0.602677, -0.04715313, -0.7479324, 0.3960784, 1, 0, 1,
-0.6022532, -0.4865222, -3.703825, 0.3921569, 1, 0, 1,
-0.5946918, -1.370699, -3.623675, 0.3843137, 1, 0, 1,
-0.5946193, 1.377141, 0.0499895, 0.3803922, 1, 0, 1,
-0.5938967, -1.165992, -1.697929, 0.372549, 1, 0, 1,
-0.5916843, 0.3051033, -2.137225, 0.3686275, 1, 0, 1,
-0.5898503, 0.452328, -1.09322, 0.3607843, 1, 0, 1,
-0.5853148, 0.5579208, 1.388372, 0.3568628, 1, 0, 1,
-0.5811962, -0.1497128, -0.3253967, 0.3490196, 1, 0, 1,
-0.5809331, -2.022983, -4.122038, 0.345098, 1, 0, 1,
-0.5793358, -0.9853486, -2.90242, 0.3372549, 1, 0, 1,
-0.5781816, 1.689942, -1.386878, 0.3333333, 1, 0, 1,
-0.5708116, 0.7315149, -0.2022685, 0.3254902, 1, 0, 1,
-0.5640759, -0.805379, -3.097131, 0.3215686, 1, 0, 1,
-0.5620781, 0.7164183, 0.425788, 0.3137255, 1, 0, 1,
-0.5596997, 0.2732148, -1.191424, 0.3098039, 1, 0, 1,
-0.5561132, 0.5965517, -0.4471356, 0.3019608, 1, 0, 1,
-0.5522743, 0.1006902, -2.55359, 0.2941177, 1, 0, 1,
-0.5493382, 1.635004, 0.3015147, 0.2901961, 1, 0, 1,
-0.5454115, -1.694582, -3.391852, 0.282353, 1, 0, 1,
-0.5446617, -1.42532, -1.465486, 0.2784314, 1, 0, 1,
-0.5435289, -1.730252, -1.819677, 0.2705882, 1, 0, 1,
-0.5423316, -1.616696, -2.191381, 0.2666667, 1, 0, 1,
-0.5406128, -0.7370183, -1.675851, 0.2588235, 1, 0, 1,
-0.5391132, -1.263195, -3.553437, 0.254902, 1, 0, 1,
-0.5286252, -0.677082, -0.9954066, 0.2470588, 1, 0, 1,
-0.5275123, 0.04558198, -0.8127602, 0.2431373, 1, 0, 1,
-0.5254093, 1.369352, -1.165543, 0.2352941, 1, 0, 1,
-0.5216718, -0.536163, -1.014242, 0.2313726, 1, 0, 1,
-0.5161197, -0.01418771, -1.358277, 0.2235294, 1, 0, 1,
-0.5160469, -0.3296653, -2.89268, 0.2196078, 1, 0, 1,
-0.5147373, 1.230162, 0.07585979, 0.2117647, 1, 0, 1,
-0.513513, 1.599832, 0.3625351, 0.2078431, 1, 0, 1,
-0.5103192, -1.738256, -2.539504, 0.2, 1, 0, 1,
-0.510285, 0.1463889, -1.674992, 0.1921569, 1, 0, 1,
-0.5084342, 1.045284, -0.1415867, 0.1882353, 1, 0, 1,
-0.4967131, -0.5981208, -1.391331, 0.1803922, 1, 0, 1,
-0.4914643, 2.440994, 0.5837024, 0.1764706, 1, 0, 1,
-0.4913037, 0.6463249, 0.1695348, 0.1686275, 1, 0, 1,
-0.489998, -1.208561, -2.859133, 0.1647059, 1, 0, 1,
-0.4899721, 2.177278, -0.1760397, 0.1568628, 1, 0, 1,
-0.4889914, -0.855334, -4.104652, 0.1529412, 1, 0, 1,
-0.4842175, -0.6852008, -3.170199, 0.145098, 1, 0, 1,
-0.4824183, -0.1735842, -2.593543, 0.1411765, 1, 0, 1,
-0.4720293, 1.742439, 1.077848, 0.1333333, 1, 0, 1,
-0.4675396, -0.8814526, -4.116608, 0.1294118, 1, 0, 1,
-0.4672437, -1.057588, -3.081558, 0.1215686, 1, 0, 1,
-0.4647106, 1.222612, 0.8782899, 0.1176471, 1, 0, 1,
-0.4634412, 0.5849819, -3.605004, 0.1098039, 1, 0, 1,
-0.4626254, 0.1404087, -3.123578, 0.1058824, 1, 0, 1,
-0.4602452, 0.5328292, -1.294108, 0.09803922, 1, 0, 1,
-0.4573771, 1.752195, -1.036579, 0.09019608, 1, 0, 1,
-0.4558209, 1.502185, -1.556629, 0.08627451, 1, 0, 1,
-0.4516143, -0.7829095, -2.370229, 0.07843138, 1, 0, 1,
-0.4498403, 1.362674, -1.676507, 0.07450981, 1, 0, 1,
-0.4416836, 0.6892073, 0.2286651, 0.06666667, 1, 0, 1,
-0.4388131, 0.06127844, -2.675303, 0.0627451, 1, 0, 1,
-0.4368607, 0.4849773, -1.661287, 0.05490196, 1, 0, 1,
-0.4364118, 0.3422856, 1.703823, 0.05098039, 1, 0, 1,
-0.4358885, -0.06012729, -3.712765, 0.04313726, 1, 0, 1,
-0.435168, -0.1222783, -2.041311, 0.03921569, 1, 0, 1,
-0.4327959, -1.686978, -2.790488, 0.03137255, 1, 0, 1,
-0.4288101, 1.930524, 0.5230615, 0.02745098, 1, 0, 1,
-0.4283448, -0.6828517, -2.383377, 0.01960784, 1, 0, 1,
-0.4264123, 0.2233713, -0.7088079, 0.01568628, 1, 0, 1,
-0.4239688, 0.589218, -0.497647, 0.007843138, 1, 0, 1,
-0.4236043, 0.01612764, -1.715032, 0.003921569, 1, 0, 1,
-0.4212736, -0.3559766, -2.403083, 0, 1, 0.003921569, 1,
-0.4210682, 0.6801882, -1.030171, 0, 1, 0.01176471, 1,
-0.4129861, -1.313766, -1.384348, 0, 1, 0.01568628, 1,
-0.4122869, 0.2112911, 0.5096988, 0, 1, 0.02352941, 1,
-0.4024955, 0.5832046, -1.145141, 0, 1, 0.02745098, 1,
-0.4004825, 0.6146663, -0.1857907, 0, 1, 0.03529412, 1,
-0.4000101, 1.293726, -1.087386, 0, 1, 0.03921569, 1,
-0.3987859, -0.866104, -3.003151, 0, 1, 0.04705882, 1,
-0.3978196, -0.6900218, -2.616045, 0, 1, 0.05098039, 1,
-0.3958624, -1.035311, -3.703017, 0, 1, 0.05882353, 1,
-0.3932282, -0.5490981, -2.757222, 0, 1, 0.0627451, 1,
-0.3895831, -1.694982, -3.714966, 0, 1, 0.07058824, 1,
-0.3886633, 0.8612685, -0.01387354, 0, 1, 0.07450981, 1,
-0.3878815, -0.5055502, -4.115179, 0, 1, 0.08235294, 1,
-0.386576, -1.703203, 0.01891935, 0, 1, 0.08627451, 1,
-0.3855695, -0.2229737, -2.787064, 0, 1, 0.09411765, 1,
-0.3840477, 0.2805466, 0.198324, 0, 1, 0.1019608, 1,
-0.3817177, -0.2116505, -3.133811, 0, 1, 0.1058824, 1,
-0.3776983, 0.2140247, 0.4481244, 0, 1, 0.1137255, 1,
-0.3753971, 0.4821227, 0.3297508, 0, 1, 0.1176471, 1,
-0.3735049, -0.01648095, -0.3909091, 0, 1, 0.1254902, 1,
-0.3733894, -1.201756, -1.814206, 0, 1, 0.1294118, 1,
-0.3714976, 0.4177749, 1.419219, 0, 1, 0.1372549, 1,
-0.3666549, -0.002601846, -1.979809, 0, 1, 0.1411765, 1,
-0.3630135, -0.9671999, -4.220052, 0, 1, 0.1490196, 1,
-0.3569848, -0.6358902, -1.453273, 0, 1, 0.1529412, 1,
-0.355541, 0.1959858, -2.157335, 0, 1, 0.1607843, 1,
-0.3484914, 0.161958, -2.893659, 0, 1, 0.1647059, 1,
-0.344012, -1.753642, -3.091199, 0, 1, 0.172549, 1,
-0.3439604, 0.5220564, 0.02907539, 0, 1, 0.1764706, 1,
-0.3402918, -2.009224, -2.707315, 0, 1, 0.1843137, 1,
-0.3390872, 0.7736534, -0.393246, 0, 1, 0.1882353, 1,
-0.3375502, -1.697068, -2.796074, 0, 1, 0.1960784, 1,
-0.3311094, -0.02896399, 0.2448926, 0, 1, 0.2039216, 1,
-0.331074, 0.9908667, -0.1844332, 0, 1, 0.2078431, 1,
-0.3249519, 0.4792733, -0.8946602, 0, 1, 0.2156863, 1,
-0.3236496, -0.5142718, -1.66769, 0, 1, 0.2196078, 1,
-0.322616, 0.2329674, -0.1341234, 0, 1, 0.227451, 1,
-0.3203541, -1.709147, -3.115011, 0, 1, 0.2313726, 1,
-0.3193973, -1.520082, -2.801769, 0, 1, 0.2392157, 1,
-0.3165843, -0.4983523, -3.074467, 0, 1, 0.2431373, 1,
-0.3137881, -1.820675, -2.254026, 0, 1, 0.2509804, 1,
-0.3120299, 1.060801, -0.4928373, 0, 1, 0.254902, 1,
-0.3095709, 1.262829, -0.6076788, 0, 1, 0.2627451, 1,
-0.3067443, 1.297777, -1.599337, 0, 1, 0.2666667, 1,
-0.3064593, 1.944133, -1.710835, 0, 1, 0.2745098, 1,
-0.3036668, 0.04523737, -2.934711, 0, 1, 0.2784314, 1,
-0.298927, 0.7618697, -0.3189157, 0, 1, 0.2862745, 1,
-0.2982257, 1.82655, -1.158517, 0, 1, 0.2901961, 1,
-0.297045, -0.8199447, -2.865842, 0, 1, 0.2980392, 1,
-0.2970235, -0.720235, -2.023727, 0, 1, 0.3058824, 1,
-0.2946502, 1.000269, -0.1355051, 0, 1, 0.3098039, 1,
-0.2928097, 1.278641, -1.198163, 0, 1, 0.3176471, 1,
-0.2906604, 0.4336829, -0.7868494, 0, 1, 0.3215686, 1,
-0.2896419, 0.1152045, -1.886497, 0, 1, 0.3294118, 1,
-0.2894979, 0.8683431, -0.7194411, 0, 1, 0.3333333, 1,
-0.2853961, 0.3302656, -1.002655, 0, 1, 0.3411765, 1,
-0.2792444, 1.230012, 0.6309425, 0, 1, 0.345098, 1,
-0.2769294, -1.485458, -3.407412, 0, 1, 0.3529412, 1,
-0.2701655, 0.3845363, -1.364653, 0, 1, 0.3568628, 1,
-0.268755, 0.2703578, -1.7633, 0, 1, 0.3647059, 1,
-0.264392, -2.47854, -2.550653, 0, 1, 0.3686275, 1,
-0.2607076, 0.7967071, -0.6075792, 0, 1, 0.3764706, 1,
-0.2524207, 0.7637061, 0.6535228, 0, 1, 0.3803922, 1,
-0.2518179, -0.2159396, -2.441912, 0, 1, 0.3882353, 1,
-0.2501475, -0.05392689, -1.707772, 0, 1, 0.3921569, 1,
-0.2489873, 0.5621367, 0.111224, 0, 1, 0.4, 1,
-0.2487522, 1.370069, -0.2499597, 0, 1, 0.4078431, 1,
-0.2478422, 0.247645, -0.9475016, 0, 1, 0.4117647, 1,
-0.2472409, 0.4815705, -1.477515, 0, 1, 0.4196078, 1,
-0.2376199, -0.0388898, -1.463478, 0, 1, 0.4235294, 1,
-0.2357942, -1.01796, -3.971979, 0, 1, 0.4313726, 1,
-0.2295375, -1.45474, -2.788905, 0, 1, 0.4352941, 1,
-0.2270417, 2.102547, 0.6350901, 0, 1, 0.4431373, 1,
-0.2235434, -1.35063, -3.376046, 0, 1, 0.4470588, 1,
-0.219524, 0.3732605, -0.147359, 0, 1, 0.454902, 1,
-0.2150452, -1.95791, -5.60097, 0, 1, 0.4588235, 1,
-0.2129259, 1.338231, -0.1107591, 0, 1, 0.4666667, 1,
-0.2118871, -1.00663, -3.516914, 0, 1, 0.4705882, 1,
-0.2109108, -1.558244, -2.552548, 0, 1, 0.4784314, 1,
-0.208222, 0.2209552, 0.8134343, 0, 1, 0.4823529, 1,
-0.2067372, -1.072824, -3.065253, 0, 1, 0.4901961, 1,
-0.2039493, -0.848891, -2.028202, 0, 1, 0.4941176, 1,
-0.2035615, -0.005273626, -0.5794128, 0, 1, 0.5019608, 1,
-0.2030584, -0.5412558, -3.570587, 0, 1, 0.509804, 1,
-0.201348, -0.381093, -0.777538, 0, 1, 0.5137255, 1,
-0.2013189, 1.067212, 0.8036847, 0, 1, 0.5215687, 1,
-0.1994152, -0.1877496, -2.096468, 0, 1, 0.5254902, 1,
-0.1937898, 0.7299432, 0.2587976, 0, 1, 0.5333334, 1,
-0.1820171, -0.1604587, -2.803312, 0, 1, 0.5372549, 1,
-0.1797935, -1.288198, -2.703778, 0, 1, 0.5450981, 1,
-0.1795928, -0.2115336, -2.344676, 0, 1, 0.5490196, 1,
-0.1772959, 0.1910811, -0.4212531, 0, 1, 0.5568628, 1,
-0.1752519, 0.2532018, -1.207366, 0, 1, 0.5607843, 1,
-0.1742029, 1.196379, 0.1777416, 0, 1, 0.5686275, 1,
-0.172674, 1.372536, -0.1580233, 0, 1, 0.572549, 1,
-0.1669893, -2.618055, -2.355989, 0, 1, 0.5803922, 1,
-0.1656778, 0.7339212, -1.221343, 0, 1, 0.5843138, 1,
-0.1619494, -0.723995, -3.572968, 0, 1, 0.5921569, 1,
-0.1616891, 0.231408, -0.07215678, 0, 1, 0.5960785, 1,
-0.1515239, 0.9392244, -0.04791832, 0, 1, 0.6039216, 1,
-0.1452749, -0.6411243, -2.016917, 0, 1, 0.6117647, 1,
-0.1432933, -0.9080202, -1.49538, 0, 1, 0.6156863, 1,
-0.1424144, -1.07148, -3.347771, 0, 1, 0.6235294, 1,
-0.138333, -0.4681442, -2.048723, 0, 1, 0.627451, 1,
-0.1373334, -1.550042, -3.393588, 0, 1, 0.6352941, 1,
-0.1322108, -0.4289651, -1.499137, 0, 1, 0.6392157, 1,
-0.1282998, -0.6209198, -2.767077, 0, 1, 0.6470588, 1,
-0.1280717, 1.246583, -0.7469254, 0, 1, 0.6509804, 1,
-0.1262535, -0.09741729, -2.73929, 0, 1, 0.6588235, 1,
-0.124168, -0.8862866, -3.774347, 0, 1, 0.6627451, 1,
-0.1236524, -0.08617062, -2.080379, 0, 1, 0.6705883, 1,
-0.1234726, -0.05040492, -3.631971, 0, 1, 0.6745098, 1,
-0.1209014, 1.497711, -0.4325328, 0, 1, 0.682353, 1,
-0.119483, 1.052612, 0.03739802, 0, 1, 0.6862745, 1,
-0.1188482, 0.9042399, -1.44682, 0, 1, 0.6941177, 1,
-0.1159313, -0.6216279, -2.999226, 0, 1, 0.7019608, 1,
-0.1148269, -0.06912968, -3.027366, 0, 1, 0.7058824, 1,
-0.1128205, -2.542737, -3.917559, 0, 1, 0.7137255, 1,
-0.1111881, 1.849489, -0.351333, 0, 1, 0.7176471, 1,
-0.1108913, 0.9079341, 1.653729, 0, 1, 0.7254902, 1,
-0.1100175, 0.2965176, 0.1330335, 0, 1, 0.7294118, 1,
-0.1084068, -1.156171, -3.091581, 0, 1, 0.7372549, 1,
-0.1080067, -2.46483, -3.007432, 0, 1, 0.7411765, 1,
-0.1077387, 1.150397, 2.018852, 0, 1, 0.7490196, 1,
-0.1026103, 0.1906096, -3.061167, 0, 1, 0.7529412, 1,
-0.09347355, -0.2234042, -3.511514, 0, 1, 0.7607843, 1,
-0.09327268, -1.851921, -3.34716, 0, 1, 0.7647059, 1,
-0.09286419, -0.3145091, -3.116737, 0, 1, 0.772549, 1,
-0.09223336, -0.6409037, -4.009286, 0, 1, 0.7764706, 1,
-0.09059524, 1.370286, 0.4628508, 0, 1, 0.7843137, 1,
-0.08998854, 0.1154798, 1.031271, 0, 1, 0.7882353, 1,
-0.08974327, -0.3086767, -1.989791, 0, 1, 0.7960784, 1,
-0.08895673, 1.654628, -0.1743821, 0, 1, 0.8039216, 1,
-0.08498682, -0.0444208, -1.372025, 0, 1, 0.8078431, 1,
-0.0783436, 1.260191, -0.4700469, 0, 1, 0.8156863, 1,
-0.06657714, 0.09452569, -1.314497, 0, 1, 0.8196079, 1,
-0.05097789, 0.4956755, -0.313309, 0, 1, 0.827451, 1,
-0.04704768, 0.1399756, 0.139337, 0, 1, 0.8313726, 1,
-0.03962306, -0.07967924, -4.107713, 0, 1, 0.8392157, 1,
-0.03954006, -0.7460917, -1.676727, 0, 1, 0.8431373, 1,
-0.03880862, -2.139547, -0.5332925, 0, 1, 0.8509804, 1,
-0.03364864, 0.3617691, -0.900113, 0, 1, 0.854902, 1,
-0.03182796, -0.3562344, -3.149368, 0, 1, 0.8627451, 1,
-0.02914774, 1.752503, -0.1809421, 0, 1, 0.8666667, 1,
-0.02894584, 0.5309873, -0.1222262, 0, 1, 0.8745098, 1,
-0.02819631, -2.692316, -2.350392, 0, 1, 0.8784314, 1,
-0.02755591, 0.8796139, -0.5515904, 0, 1, 0.8862745, 1,
-0.0236777, -0.927301, -1.878632, 0, 1, 0.8901961, 1,
-0.01809646, 0.3538, 0.364277, 0, 1, 0.8980392, 1,
-0.01598795, 0.3658071, 0.5748081, 0, 1, 0.9058824, 1,
-0.01363006, 0.5560437, 0.4234798, 0, 1, 0.9098039, 1,
-0.01023984, -2.165334, -4.028631, 0, 1, 0.9176471, 1,
-0.01017387, -0.1211774, -2.562492, 0, 1, 0.9215686, 1,
-0.008624046, -0.05631056, -2.994292, 0, 1, 0.9294118, 1,
-0.005884665, 0.6252842, 0.5609078, 0, 1, 0.9333333, 1,
-0.005828399, 1.673595, -0.8654072, 0, 1, 0.9411765, 1,
-0.003239925, -0.9194354, -2.638716, 0, 1, 0.945098, 1,
-0.002909686, 0.4886205, 1.100831, 0, 1, 0.9529412, 1,
-0.001123658, -0.7833399, -3.568757, 0, 1, 0.9568627, 1,
-0.0003933335, 2.099749, -1.455141, 0, 1, 0.9647059, 1,
0.0009495438, 0.2882083, -0.6588176, 0, 1, 0.9686275, 1,
0.001496678, 1.419486, -0.02567442, 0, 1, 0.9764706, 1,
0.006735967, 1.372916, -0.2939646, 0, 1, 0.9803922, 1,
0.009329963, -0.2552064, 2.681398, 0, 1, 0.9882353, 1,
0.01257474, 0.112829, -0.1566048, 0, 1, 0.9921569, 1,
0.01272897, -0.9639272, 3.193283, 0, 1, 1, 1,
0.01382766, 0.1841287, 0.2801503, 0, 0.9921569, 1, 1,
0.01398615, -1.499333, 4.842735, 0, 0.9882353, 1, 1,
0.01501578, 0.428908, -0.03819977, 0, 0.9803922, 1, 1,
0.01610056, 0.1628253, -0.1271484, 0, 0.9764706, 1, 1,
0.0208759, -1.549364, 4.056196, 0, 0.9686275, 1, 1,
0.02329019, -1.063961, 2.886256, 0, 0.9647059, 1, 1,
0.02500715, 0.3412605, 0.4961517, 0, 0.9568627, 1, 1,
0.02753506, 0.5039884, -0.5451915, 0, 0.9529412, 1, 1,
0.02953441, 0.05146955, 0.7057869, 0, 0.945098, 1, 1,
0.03259216, 0.8326951, 0.6287168, 0, 0.9411765, 1, 1,
0.03602456, -1.029311, 2.885605, 0, 0.9333333, 1, 1,
0.03720555, -0.5963543, 3.43656, 0, 0.9294118, 1, 1,
0.03770695, 1.766498, -0.9144744, 0, 0.9215686, 1, 1,
0.04059942, 1.090275, 0.6575936, 0, 0.9176471, 1, 1,
0.04094076, 0.04223178, 0.5402048, 0, 0.9098039, 1, 1,
0.04537475, -0.08205415, 3.217866, 0, 0.9058824, 1, 1,
0.04641338, -0.1571848, 6.475034, 0, 0.8980392, 1, 1,
0.04715324, -0.3546247, 2.954775, 0, 0.8901961, 1, 1,
0.04825408, -2.619004, 4.493692, 0, 0.8862745, 1, 1,
0.05486002, -1.992173, 3.081218, 0, 0.8784314, 1, 1,
0.05627603, 0.430126, 2.383295, 0, 0.8745098, 1, 1,
0.05714795, 0.1696765, 0.6236987, 0, 0.8666667, 1, 1,
0.06445536, 1.243591, 0.4892776, 0, 0.8627451, 1, 1,
0.06759091, -0.1308669, 2.143876, 0, 0.854902, 1, 1,
0.07078096, 1.154556, 1.429444, 0, 0.8509804, 1, 1,
0.07219593, -1.432955, 1.120112, 0, 0.8431373, 1, 1,
0.07348194, 0.8551843, -1.627877, 0, 0.8392157, 1, 1,
0.07769965, 0.9278511, -0.7571863, 0, 0.8313726, 1, 1,
0.08011206, 0.7818342, -0.6711383, 0, 0.827451, 1, 1,
0.08247215, 0.2130458, -0.6919356, 0, 0.8196079, 1, 1,
0.08289948, 0.4148553, -2.471289, 0, 0.8156863, 1, 1,
0.08624399, -1.235523, 2.183436, 0, 0.8078431, 1, 1,
0.0881789, 0.2389494, 0.04267229, 0, 0.8039216, 1, 1,
0.08926736, 0.1544537, 0.04779376, 0, 0.7960784, 1, 1,
0.09080803, -0.9039615, 3.822992, 0, 0.7882353, 1, 1,
0.0914646, -2.651251, 5.401649, 0, 0.7843137, 1, 1,
0.09369635, -0.4740981, 2.479271, 0, 0.7764706, 1, 1,
0.09937029, 0.9107308, -0.5628564, 0, 0.772549, 1, 1,
0.1046862, 0.2813112, 0.5708806, 0, 0.7647059, 1, 1,
0.1074625, -1.549488, 1.99603, 0, 0.7607843, 1, 1,
0.1091675, 0.3865062, -0.613995, 0, 0.7529412, 1, 1,
0.1096396, -0.5097511, 3.174078, 0, 0.7490196, 1, 1,
0.1097101, -0.822293, 2.621253, 0, 0.7411765, 1, 1,
0.1097574, -1.124562, 3.880747, 0, 0.7372549, 1, 1,
0.111973, -0.2864318, 1.606058, 0, 0.7294118, 1, 1,
0.1122717, 0.1270899, 0.667586, 0, 0.7254902, 1, 1,
0.1158763, 0.4207327, 0.5835443, 0, 0.7176471, 1, 1,
0.1162613, -1.987331, 3.640275, 0, 0.7137255, 1, 1,
0.1174343, -0.4386908, 3.783957, 0, 0.7058824, 1, 1,
0.1188835, 0.6363176, -0.2034689, 0, 0.6980392, 1, 1,
0.1225788, 1.11788, 1.210407, 0, 0.6941177, 1, 1,
0.128515, -1.046858, 1.807632, 0, 0.6862745, 1, 1,
0.1335854, -0.7394185, 3.828047, 0, 0.682353, 1, 1,
0.1350188, -1.39561, 2.03333, 0, 0.6745098, 1, 1,
0.135395, -0.6867947, 2.535635, 0, 0.6705883, 1, 1,
0.1364664, 0.4712518, 1.921152, 0, 0.6627451, 1, 1,
0.1367146, 0.4930023, 0.9469188, 0, 0.6588235, 1, 1,
0.1438234, -1.237337, 2.105486, 0, 0.6509804, 1, 1,
0.1461432, 1.558926, -1.692123, 0, 0.6470588, 1, 1,
0.1472369, 0.1301606, 0.6113892, 0, 0.6392157, 1, 1,
0.1492957, -0.9741279, 5.024869, 0, 0.6352941, 1, 1,
0.1536326, 0.1867943, 0.1004117, 0, 0.627451, 1, 1,
0.1537149, -0.2036507, 5.490907, 0, 0.6235294, 1, 1,
0.1569887, 1.424547, -0.8544677, 0, 0.6156863, 1, 1,
0.1601798, 1.227919, -0.3822421, 0, 0.6117647, 1, 1,
0.1602132, 0.1574362, 1.299342, 0, 0.6039216, 1, 1,
0.1660089, 1.249714, 1.710407, 0, 0.5960785, 1, 1,
0.1672996, -1.570446, 3.436827, 0, 0.5921569, 1, 1,
0.1684566, -0.9905133, 1.331069, 0, 0.5843138, 1, 1,
0.1692552, 1.09981, 0.8478151, 0, 0.5803922, 1, 1,
0.1709115, 0.3564338, 1.300749, 0, 0.572549, 1, 1,
0.1730703, 1.423922, 0.8635052, 0, 0.5686275, 1, 1,
0.1741789, 0.5622569, 1.748438, 0, 0.5607843, 1, 1,
0.176634, -0.400323, 3.304952, 0, 0.5568628, 1, 1,
0.1793136, -0.5808552, 3.351301, 0, 0.5490196, 1, 1,
0.1835475, -0.3649291, 2.713657, 0, 0.5450981, 1, 1,
0.1836435, 0.1061125, -0.1207382, 0, 0.5372549, 1, 1,
0.1847735, -0.08788898, 1.841232, 0, 0.5333334, 1, 1,
0.1918516, 0.5332263, 0.2977815, 0, 0.5254902, 1, 1,
0.1950171, -0.2961006, 2.463435, 0, 0.5215687, 1, 1,
0.2012387, 1.269373, -0.5113745, 0, 0.5137255, 1, 1,
0.2053, -0.6642281, 1.435912, 0, 0.509804, 1, 1,
0.2053391, 0.8540202, -0.1012187, 0, 0.5019608, 1, 1,
0.2058783, -1.150779, 2.892304, 0, 0.4941176, 1, 1,
0.2081133, -0.08972187, 2.272615, 0, 0.4901961, 1, 1,
0.2083929, 1.83804, 0.1607414, 0, 0.4823529, 1, 1,
0.2084262, 0.771829, -0.08998241, 0, 0.4784314, 1, 1,
0.2093582, 1.062453, -0.3969565, 0, 0.4705882, 1, 1,
0.2112591, 1.126008, 1.843296, 0, 0.4666667, 1, 1,
0.2117364, -0.1607677, 0.3023647, 0, 0.4588235, 1, 1,
0.2228547, 0.5751833, 0.5744354, 0, 0.454902, 1, 1,
0.2259219, 0.1260317, 1.866065, 0, 0.4470588, 1, 1,
0.2331685, -0.6402432, 2.902466, 0, 0.4431373, 1, 1,
0.2335359, 1.469239, -0.4698674, 0, 0.4352941, 1, 1,
0.2359951, 0.09494065, 1.423985, 0, 0.4313726, 1, 1,
0.238372, 0.7481352, 0.9934142, 0, 0.4235294, 1, 1,
0.2403593, -0.04409062, 2.808107, 0, 0.4196078, 1, 1,
0.2442923, 0.08960574, 0.5711112, 0, 0.4117647, 1, 1,
0.2451216, 0.4616983, 1.804273, 0, 0.4078431, 1, 1,
0.2486061, 0.4266445, 0.9753973, 0, 0.4, 1, 1,
0.2489365, -0.6701347, 2.524735, 0, 0.3921569, 1, 1,
0.2533284, 0.8495641, 0.7149366, 0, 0.3882353, 1, 1,
0.2572803, 0.8502476, -2.359772, 0, 0.3803922, 1, 1,
0.2641776, -1.226972, 3.528379, 0, 0.3764706, 1, 1,
0.269603, -0.9449061, 2.774964, 0, 0.3686275, 1, 1,
0.2711666, 0.9440742, -2.107666, 0, 0.3647059, 1, 1,
0.2788288, -1.91235, 2.904566, 0, 0.3568628, 1, 1,
0.2814343, 0.03292784, 2.085655, 0, 0.3529412, 1, 1,
0.2889419, 0.2046962, 2.946809, 0, 0.345098, 1, 1,
0.2923481, 0.9227752, 0.213194, 0, 0.3411765, 1, 1,
0.295101, -0.5105721, 2.83997, 0, 0.3333333, 1, 1,
0.2952418, -0.7296383, 0.8658677, 0, 0.3294118, 1, 1,
0.305691, 0.6362981, 1.61438, 0, 0.3215686, 1, 1,
0.3076469, -0.371605, 2.625704, 0, 0.3176471, 1, 1,
0.3089058, -0.6647681, 1.14968, 0, 0.3098039, 1, 1,
0.311083, 0.6680151, 0.7022557, 0, 0.3058824, 1, 1,
0.3117322, 0.5687555, 0.1871496, 0, 0.2980392, 1, 1,
0.3126539, 1.18844, 1.243758, 0, 0.2901961, 1, 1,
0.315168, 1.120575, 0.2006785, 0, 0.2862745, 1, 1,
0.3175643, -0.1742159, 1.640484, 0, 0.2784314, 1, 1,
0.3201165, -0.9681, 4.236694, 0, 0.2745098, 1, 1,
0.3206893, 0.51036, 1.354241, 0, 0.2666667, 1, 1,
0.3219586, -0.05463043, 1.440769, 0, 0.2627451, 1, 1,
0.3300382, -0.3499417, 1.731733, 0, 0.254902, 1, 1,
0.3302895, 0.3086002, 0.3715958, 0, 0.2509804, 1, 1,
0.3348608, 0.828577, -0.1448817, 0, 0.2431373, 1, 1,
0.3368454, -1.508889, 3.58676, 0, 0.2392157, 1, 1,
0.3372129, -0.03708897, 0.6399297, 0, 0.2313726, 1, 1,
0.3372587, -1.015567, 5.872183, 0, 0.227451, 1, 1,
0.3379645, 0.3770273, -0.1609052, 0, 0.2196078, 1, 1,
0.3392418, 0.3331921, -0.09926758, 0, 0.2156863, 1, 1,
0.339242, -0.5963576, 2.775559, 0, 0.2078431, 1, 1,
0.3404625, -1.143367, 1.719983, 0, 0.2039216, 1, 1,
0.340983, -0.8107083, 2.17798, 0, 0.1960784, 1, 1,
0.3431335, 1.022814, -1.572836, 0, 0.1882353, 1, 1,
0.3472695, -1.301717, 4.363221, 0, 0.1843137, 1, 1,
0.3487135, -0.686633, 3.249573, 0, 0.1764706, 1, 1,
0.3547842, 2.259196, -1.542913, 0, 0.172549, 1, 1,
0.3550587, -0.5888155, 2.274889, 0, 0.1647059, 1, 1,
0.3574307, -1.434134, 3.728345, 0, 0.1607843, 1, 1,
0.3593401, -0.1684908, 2.498713, 0, 0.1529412, 1, 1,
0.3604618, 1.390621, -0.04656652, 0, 0.1490196, 1, 1,
0.3618366, -1.184257, 2.393003, 0, 0.1411765, 1, 1,
0.3671541, 0.4932701, 2.904284, 0, 0.1372549, 1, 1,
0.3693781, -1.246978, 4.961868, 0, 0.1294118, 1, 1,
0.3720295, 1.417478, -0.3088631, 0, 0.1254902, 1, 1,
0.3722653, 0.544517, 0.1976582, 0, 0.1176471, 1, 1,
0.3724959, -0.2662249, 1.348834, 0, 0.1137255, 1, 1,
0.3757826, 2.730493, 1.183246, 0, 0.1058824, 1, 1,
0.3859856, 0.9444518, 0.0121564, 0, 0.09803922, 1, 1,
0.392757, -0.06307704, 2.522178, 0, 0.09411765, 1, 1,
0.393198, -0.4971249, 4.003281, 0, 0.08627451, 1, 1,
0.3967037, 0.503769, 0.4956669, 0, 0.08235294, 1, 1,
0.4009883, 1.730236, -0.405152, 0, 0.07450981, 1, 1,
0.4021626, -0.7118151, 2.358756, 0, 0.07058824, 1, 1,
0.4116143, 0.9641147, 1.025655, 0, 0.0627451, 1, 1,
0.4124297, -0.144869, 1.197694, 0, 0.05882353, 1, 1,
0.4128355, 0.04926006, -0.5238868, 0, 0.05098039, 1, 1,
0.4131236, -0.4190764, 2.582253, 0, 0.04705882, 1, 1,
0.4172702, -0.6357445, 2.242653, 0, 0.03921569, 1, 1,
0.4217081, -0.1653863, 3.327066, 0, 0.03529412, 1, 1,
0.4220676, -1.111228, 0.6590363, 0, 0.02745098, 1, 1,
0.4256821, 1.805905, 1.751124, 0, 0.02352941, 1, 1,
0.428333, -0.7598259, 2.085784, 0, 0.01568628, 1, 1,
0.4386435, -1.097225, 4.435044, 0, 0.01176471, 1, 1,
0.43902, -1.285551, 3.802011, 0, 0.003921569, 1, 1,
0.4408305, 0.4915888, 1.051533, 0.003921569, 0, 1, 1,
0.4475892, 1.444598, -1.089041, 0.007843138, 0, 1, 1,
0.4493148, 0.1509999, 0.3742062, 0.01568628, 0, 1, 1,
0.4503403, -0.58273, 1.963412, 0.01960784, 0, 1, 1,
0.4537919, -1.094891, 3.416562, 0.02745098, 0, 1, 1,
0.4550021, -0.3629169, 2.320845, 0.03137255, 0, 1, 1,
0.4574267, -0.6782455, 1.757536, 0.03921569, 0, 1, 1,
0.4576106, 0.7635419, 0.9819258, 0.04313726, 0, 1, 1,
0.4600903, -0.4704427, 3.683122, 0.05098039, 0, 1, 1,
0.4603703, -0.8792372, 3.234566, 0.05490196, 0, 1, 1,
0.462633, -0.6470685, 2.669381, 0.0627451, 0, 1, 1,
0.4639875, -2.726196, 3.480684, 0.06666667, 0, 1, 1,
0.4640059, -0.1776284, 0.3150931, 0.07450981, 0, 1, 1,
0.4640867, -0.5370293, 3.248117, 0.07843138, 0, 1, 1,
0.4641646, -0.6503169, 1.31722, 0.08627451, 0, 1, 1,
0.4647036, 0.5738478, -0.06635095, 0.09019608, 0, 1, 1,
0.4754177, -0.5443459, 3.654596, 0.09803922, 0, 1, 1,
0.477254, -1.030321, 2.673468, 0.1058824, 0, 1, 1,
0.4778845, 0.2962617, 2.617777, 0.1098039, 0, 1, 1,
0.4779033, -0.3409196, 1.371025, 0.1176471, 0, 1, 1,
0.4814969, 1.042384, 1.396609, 0.1215686, 0, 1, 1,
0.4827102, -0.1313554, 2.487477, 0.1294118, 0, 1, 1,
0.4919767, -0.5921489, 3.015126, 0.1333333, 0, 1, 1,
0.4934742, 0.4227402, 0.7473544, 0.1411765, 0, 1, 1,
0.4969687, -0.9060839, 4.441829, 0.145098, 0, 1, 1,
0.4975003, -0.8221995, 1.916576, 0.1529412, 0, 1, 1,
0.4977711, 0.1692907, 2.813544, 0.1568628, 0, 1, 1,
0.4993395, 0.7037244, 2.90742, 0.1647059, 0, 1, 1,
0.5011949, -0.0937404, 1.050842, 0.1686275, 0, 1, 1,
0.5052819, -0.9536662, 3.185185, 0.1764706, 0, 1, 1,
0.5063478, -1.320063, 1.736192, 0.1803922, 0, 1, 1,
0.510687, 1.40686, -1.471499, 0.1882353, 0, 1, 1,
0.5181057, 0.2993853, 0.4466962, 0.1921569, 0, 1, 1,
0.5226555, -1.142267, 3.351047, 0.2, 0, 1, 1,
0.5279267, -1.855664, -0.06004028, 0.2078431, 0, 1, 1,
0.5380309, 0.347177, 0.5659632, 0.2117647, 0, 1, 1,
0.5388166, -0.1553713, 2.467359, 0.2196078, 0, 1, 1,
0.539135, -1.488972, 2.991281, 0.2235294, 0, 1, 1,
0.5431432, -1.149388, 1.96776, 0.2313726, 0, 1, 1,
0.5453789, 2.092704, 0.9944804, 0.2352941, 0, 1, 1,
0.5497146, -0.9510737, 1.818891, 0.2431373, 0, 1, 1,
0.5506272, -1.180811, 2.379914, 0.2470588, 0, 1, 1,
0.5599592, 0.3904308, -0.9371514, 0.254902, 0, 1, 1,
0.5614347, -0.1499534, 0.7505229, 0.2588235, 0, 1, 1,
0.5644535, -1.208937, 2.776882, 0.2666667, 0, 1, 1,
0.56467, -0.5880217, 2.107624, 0.2705882, 0, 1, 1,
0.5668792, 0.6910664, 1.207046, 0.2784314, 0, 1, 1,
0.5681656, 1.338609, -1.016171, 0.282353, 0, 1, 1,
0.5734146, 0.804001, -0.4751765, 0.2901961, 0, 1, 1,
0.5747983, -0.3243803, 1.386922, 0.2941177, 0, 1, 1,
0.5813942, 0.858924, 0.2467905, 0.3019608, 0, 1, 1,
0.5874695, -0.01364337, 3.455002, 0.3098039, 0, 1, 1,
0.5927482, -0.8123094, 3.599198, 0.3137255, 0, 1, 1,
0.5934264, -1.038625, 3.937706, 0.3215686, 0, 1, 1,
0.5996848, 0.3410301, 1.962275, 0.3254902, 0, 1, 1,
0.6006697, 1.51052, -0.472809, 0.3333333, 0, 1, 1,
0.6008958, 2.183636, 0.4952587, 0.3372549, 0, 1, 1,
0.601418, -0.5747277, 2.62343, 0.345098, 0, 1, 1,
0.601503, 1.775827, -0.6715093, 0.3490196, 0, 1, 1,
0.6050471, -0.397925, 1.461522, 0.3568628, 0, 1, 1,
0.6091353, -0.6673842, 1.871555, 0.3607843, 0, 1, 1,
0.6125271, -0.7790135, 2.896309, 0.3686275, 0, 1, 1,
0.6134722, 0.9884108, 3.213005, 0.372549, 0, 1, 1,
0.613744, -0.5665329, 4.167059, 0.3803922, 0, 1, 1,
0.6154318, -0.5426271, 3.356559, 0.3843137, 0, 1, 1,
0.6161068, -0.9036406, 3.674912, 0.3921569, 0, 1, 1,
0.6173729, -0.4646165, 2.433233, 0.3960784, 0, 1, 1,
0.6199804, -0.2895928, 2.669953, 0.4039216, 0, 1, 1,
0.6234514, 2.117509, 0.1291754, 0.4117647, 0, 1, 1,
0.6274123, 0.1003449, 2.183104, 0.4156863, 0, 1, 1,
0.6282902, -0.09265499, 1.793939, 0.4235294, 0, 1, 1,
0.6293572, -0.6130867, 2.194877, 0.427451, 0, 1, 1,
0.6326848, 0.05908369, 0.9854011, 0.4352941, 0, 1, 1,
0.6343058, -1.392745, 0.8636719, 0.4392157, 0, 1, 1,
0.6363785, 0.1074909, 0.4444667, 0.4470588, 0, 1, 1,
0.6422838, -1.348582, 1.128122, 0.4509804, 0, 1, 1,
0.6632074, 0.9791798, 0.3969388, 0.4588235, 0, 1, 1,
0.6659521, -1.436154, 4.334033, 0.4627451, 0, 1, 1,
0.671227, 0.4721401, 2.313652, 0.4705882, 0, 1, 1,
0.6773009, -1.388911, 4.648425, 0.4745098, 0, 1, 1,
0.6853961, -0.8741435, 2.397662, 0.4823529, 0, 1, 1,
0.685985, 1.197617, 0.681384, 0.4862745, 0, 1, 1,
0.6881276, -1.451006, 2.665439, 0.4941176, 0, 1, 1,
0.6911001, 0.172097, 2.079841, 0.5019608, 0, 1, 1,
0.6941625, -0.512977, 1.313871, 0.5058824, 0, 1, 1,
0.7055535, -0.2097245, 1.171862, 0.5137255, 0, 1, 1,
0.7094291, 0.5994444, 0.1387767, 0.5176471, 0, 1, 1,
0.70964, 1.629847, -1.933622, 0.5254902, 0, 1, 1,
0.7117863, -0.197676, 0.3517096, 0.5294118, 0, 1, 1,
0.7152228, 0.07800141, 1.458637, 0.5372549, 0, 1, 1,
0.7198758, 0.002767086, 0.1673263, 0.5411765, 0, 1, 1,
0.7231419, -0.2664432, 3.483181, 0.5490196, 0, 1, 1,
0.7246006, 0.04877209, 1.47337, 0.5529412, 0, 1, 1,
0.7271828, -0.6842616, -0.2809332, 0.5607843, 0, 1, 1,
0.7271829, 0.2066822, 0.9716008, 0.5647059, 0, 1, 1,
0.7286207, -0.2511694, 0.04567673, 0.572549, 0, 1, 1,
0.7312405, 0.7427692, 0.571354, 0.5764706, 0, 1, 1,
0.7402966, -0.1899267, 1.735351, 0.5843138, 0, 1, 1,
0.7438211, 0.7813522, -0.9648989, 0.5882353, 0, 1, 1,
0.7444159, -0.172, -1.739263, 0.5960785, 0, 1, 1,
0.7527327, 0.6207713, 1.147612, 0.6039216, 0, 1, 1,
0.7544656, 1.646933, -0.1735304, 0.6078432, 0, 1, 1,
0.7571109, -1.611845, 2.686037, 0.6156863, 0, 1, 1,
0.7599052, -1.987543, 2.566299, 0.6196079, 0, 1, 1,
0.7637749, 0.8858538, 0.2581573, 0.627451, 0, 1, 1,
0.765685, -0.09647611, 2.213759, 0.6313726, 0, 1, 1,
0.7663717, 0.2429467, 1.790726, 0.6392157, 0, 1, 1,
0.7694751, 0.9759052, 1.141137, 0.6431373, 0, 1, 1,
0.7698135, 1.025753, -0.2803479, 0.6509804, 0, 1, 1,
0.7726184, 2.150728, 1.40995, 0.654902, 0, 1, 1,
0.7727396, -1.665838, 2.735064, 0.6627451, 0, 1, 1,
0.776457, 0.4941548, 1.170542, 0.6666667, 0, 1, 1,
0.7811041, 0.5689675, 0.0253936, 0.6745098, 0, 1, 1,
0.7856749, 1.355211, 0.6126288, 0.6784314, 0, 1, 1,
0.7862724, -1.785556, 0.6633373, 0.6862745, 0, 1, 1,
0.789403, 0.2387192, 0.7588056, 0.6901961, 0, 1, 1,
0.7939658, 0.08448877, 1.467147, 0.6980392, 0, 1, 1,
0.7967687, -0.307024, 0.9632047, 0.7058824, 0, 1, 1,
0.8000782, -0.292736, 0.8730466, 0.7098039, 0, 1, 1,
0.81405, -0.5862103, 3.035683, 0.7176471, 0, 1, 1,
0.8154255, 0.1444103, 1.046629, 0.7215686, 0, 1, 1,
0.8170082, -0.6749111, 1.985028, 0.7294118, 0, 1, 1,
0.8178066, 1.297203, -0.7818077, 0.7333333, 0, 1, 1,
0.8269454, 0.6580251, 1.929667, 0.7411765, 0, 1, 1,
0.8297611, 0.6337558, 1.034948, 0.7450981, 0, 1, 1,
0.8297757, -0.198189, 1.710272, 0.7529412, 0, 1, 1,
0.8355911, -0.2609683, 0.6525355, 0.7568628, 0, 1, 1,
0.8361728, 0.8485984, 0.2473468, 0.7647059, 0, 1, 1,
0.8388769, -1.009289, 3.277651, 0.7686275, 0, 1, 1,
0.850332, 0.7123226, -0.04259443, 0.7764706, 0, 1, 1,
0.8550542, 2.149257, -1.073853, 0.7803922, 0, 1, 1,
0.8576268, -0.03432809, 1.89688, 0.7882353, 0, 1, 1,
0.8600801, -0.2356861, 0.6696971, 0.7921569, 0, 1, 1,
0.8640319, -0.6381236, 3.912309, 0.8, 0, 1, 1,
0.8701183, 1.220766, 2.919582, 0.8078431, 0, 1, 1,
0.8770398, 2.06991, -0.4346633, 0.8117647, 0, 1, 1,
0.8779776, -0.064144, 0.9023933, 0.8196079, 0, 1, 1,
0.8888841, 0.6588855, 1.717507, 0.8235294, 0, 1, 1,
0.8939701, 0.5580121, 1.838631, 0.8313726, 0, 1, 1,
0.8989961, -1.173777, 2.35629, 0.8352941, 0, 1, 1,
0.8999826, 0.823646, 1.075788, 0.8431373, 0, 1, 1,
0.9016327, -1.501217, 2.104416, 0.8470588, 0, 1, 1,
0.9097311, 0.8633515, 3.28382, 0.854902, 0, 1, 1,
0.9161955, -0.1725574, 1.67141, 0.8588235, 0, 1, 1,
0.9173498, -0.3241197, 2.499713, 0.8666667, 0, 1, 1,
0.9182353, -0.3723932, 2.693089, 0.8705882, 0, 1, 1,
0.9297071, 1.063369, 1.255418, 0.8784314, 0, 1, 1,
0.931289, -0.9829242, 2.773194, 0.8823529, 0, 1, 1,
0.9357396, -0.8278062, 4.101763, 0.8901961, 0, 1, 1,
0.940529, -1.257659, 2.652966, 0.8941177, 0, 1, 1,
0.9412798, 0.6515939, 2.048743, 0.9019608, 0, 1, 1,
0.953084, 0.1350849, 1.526693, 0.9098039, 0, 1, 1,
0.9533198, -0.3698544, 2.369483, 0.9137255, 0, 1, 1,
0.9605204, 0.5677668, 0.2424222, 0.9215686, 0, 1, 1,
0.9671414, 0.08350236, 0.3692203, 0.9254902, 0, 1, 1,
0.9688622, -1.869789, 3.144487, 0.9333333, 0, 1, 1,
0.9696656, 1.036851, 0.595668, 0.9372549, 0, 1, 1,
0.972426, 1.187085, 2.439502, 0.945098, 0, 1, 1,
0.9781285, 0.6919212, 2.772003, 0.9490196, 0, 1, 1,
0.9900344, -0.1659493, 0.44943, 0.9568627, 0, 1, 1,
0.990124, -0.02533946, 1.889795, 0.9607843, 0, 1, 1,
0.9996302, 0.2626163, 3.436255, 0.9686275, 0, 1, 1,
1.003488, -0.4337355, -0.06957871, 0.972549, 0, 1, 1,
1.003726, 0.07795582, 1.104746, 0.9803922, 0, 1, 1,
1.005175, -0.6892974, 0.4634133, 0.9843137, 0, 1, 1,
1.007356, -0.779983, 2.039378, 0.9921569, 0, 1, 1,
1.009046, -0.4281057, 1.194157, 0.9960784, 0, 1, 1,
1.010458, -0.4494229, 2.266626, 1, 0, 0.9960784, 1,
1.015747, 1.34786, 0.5847844, 1, 0, 0.9882353, 1,
1.016372, -3.073143, 1.151731, 1, 0, 0.9843137, 1,
1.020238, 1.433101, 1.480394, 1, 0, 0.9764706, 1,
1.020465, 0.9390133, 0.4183747, 1, 0, 0.972549, 1,
1.02682, -0.08164492, 2.904288, 1, 0, 0.9647059, 1,
1.029756, 0.3182565, 0.2796883, 1, 0, 0.9607843, 1,
1.031892, 0.9008742, 0.06458798, 1, 0, 0.9529412, 1,
1.039798, -0.4994258, 1.748146, 1, 0, 0.9490196, 1,
1.040293, -0.717123, 1.302081, 1, 0, 0.9411765, 1,
1.041407, -0.05674917, 1.14997, 1, 0, 0.9372549, 1,
1.042242, 0.6078275, 0.5485301, 1, 0, 0.9294118, 1,
1.043469, 1.306057, 0.8897949, 1, 0, 0.9254902, 1,
1.043613, 0.5975177, 0.09934924, 1, 0, 0.9176471, 1,
1.048174, 0.5539756, 1.157279, 1, 0, 0.9137255, 1,
1.052735, 0.2904721, 1.297955, 1, 0, 0.9058824, 1,
1.05468, -0.4298612, 1.788465, 1, 0, 0.9019608, 1,
1.05842, -0.3088163, 2.471282, 1, 0, 0.8941177, 1,
1.059087, 0.3264475, 2.015512, 1, 0, 0.8862745, 1,
1.061595, -0.1252749, 1.077667, 1, 0, 0.8823529, 1,
1.06191, -1.260027, 2.864366, 1, 0, 0.8745098, 1,
1.062348, 1.182335, 0.5118226, 1, 0, 0.8705882, 1,
1.074872, 0.4275145, 0.3276387, 1, 0, 0.8627451, 1,
1.075314, -1.092676, 2.231926, 1, 0, 0.8588235, 1,
1.078055, 1.026193, 0.5893714, 1, 0, 0.8509804, 1,
1.078532, -0.4775554, 1.766428, 1, 0, 0.8470588, 1,
1.080886, 1.162801, -0.5746304, 1, 0, 0.8392157, 1,
1.087351, -0.6657543, 2.174685, 1, 0, 0.8352941, 1,
1.095779, -0.001376844, 1.583074, 1, 0, 0.827451, 1,
1.095989, -1.193522, 2.229723, 1, 0, 0.8235294, 1,
1.099332, 1.37721, -1.247042, 1, 0, 0.8156863, 1,
1.101112, 0.06492002, 1.246086, 1, 0, 0.8117647, 1,
1.110929, 1.053482, 0.8579023, 1, 0, 0.8039216, 1,
1.114986, -1.383451, 4.140169, 1, 0, 0.7960784, 1,
1.115405, 0.6787508, -0.6130938, 1, 0, 0.7921569, 1,
1.117284, 0.4313829, 1.046835, 1, 0, 0.7843137, 1,
1.119333, -0.9873989, 1.775608, 1, 0, 0.7803922, 1,
1.125056, 1.229357, 1.639473, 1, 0, 0.772549, 1,
1.126965, 2.867948, -0.2812438, 1, 0, 0.7686275, 1,
1.13025, 0.6535576, 2.419019, 1, 0, 0.7607843, 1,
1.135957, 1.6484, -0.3004346, 1, 0, 0.7568628, 1,
1.142476, -0.05379805, 0.7024176, 1, 0, 0.7490196, 1,
1.14822, 1.170051, 1.908818, 1, 0, 0.7450981, 1,
1.154059, 0.05132226, 1.724023, 1, 0, 0.7372549, 1,
1.154761, -0.1396787, 0.993769, 1, 0, 0.7333333, 1,
1.159493, -0.7704831, 2.640341, 1, 0, 0.7254902, 1,
1.159581, -0.8286887, 3.1753, 1, 0, 0.7215686, 1,
1.163528, 0.7431064, 4.780392, 1, 0, 0.7137255, 1,
1.173829, 1.012841, 1.564778, 1, 0, 0.7098039, 1,
1.184345, -0.02940816, 1.957862, 1, 0, 0.7019608, 1,
1.184378, -1.435519, 2.520108, 1, 0, 0.6941177, 1,
1.186241, -1.834755, 2.156013, 1, 0, 0.6901961, 1,
1.187733, 0.6960707, 0.03007849, 1, 0, 0.682353, 1,
1.191758, -0.778843, 3.013917, 1, 0, 0.6784314, 1,
1.193906, -1.757864, 2.176482, 1, 0, 0.6705883, 1,
1.197528, 0.6403689, 1.468055, 1, 0, 0.6666667, 1,
1.200366, 0.5384017, 2.140092, 1, 0, 0.6588235, 1,
1.206763, 0.2114998, 1.568798, 1, 0, 0.654902, 1,
1.230263, -1.222718, 1.226481, 1, 0, 0.6470588, 1,
1.238546, -0.9530097, 3.540069, 1, 0, 0.6431373, 1,
1.242421, -0.8612818, 2.816201, 1, 0, 0.6352941, 1,
1.24583, 0.2352191, 2.762165, 1, 0, 0.6313726, 1,
1.24758, 0.513314, 1.042887, 1, 0, 0.6235294, 1,
1.253859, -1.240933, 2.582098, 1, 0, 0.6196079, 1,
1.256448, -0.04735035, 1.307603, 1, 0, 0.6117647, 1,
1.256904, 0.2657374, 0.1416439, 1, 0, 0.6078432, 1,
1.262445, 0.2083131, 1.649578, 1, 0, 0.6, 1,
1.263503, 1.385505, -0.04930508, 1, 0, 0.5921569, 1,
1.266957, 0.06916776, 0.6097419, 1, 0, 0.5882353, 1,
1.26932, 0.05233452, 1.026821, 1, 0, 0.5803922, 1,
1.274782, -0.9864051, 3.892295, 1, 0, 0.5764706, 1,
1.282925, -0.1072043, 3.244035, 1, 0, 0.5686275, 1,
1.288761, -0.9296471, 1.365171, 1, 0, 0.5647059, 1,
1.305507, 0.2203109, -0.5682063, 1, 0, 0.5568628, 1,
1.328919, -0.7841793, 0.9427274, 1, 0, 0.5529412, 1,
1.329395, 2.039059, 2.44708, 1, 0, 0.5450981, 1,
1.34948, -1.408054, 3.705019, 1, 0, 0.5411765, 1,
1.351386, -1.506787, 4.549452, 1, 0, 0.5333334, 1,
1.352763, -1.450477, 2.511392, 1, 0, 0.5294118, 1,
1.363527, 0.703527, 1.597741, 1, 0, 0.5215687, 1,
1.36623, -1.440136, 4.080394, 1, 0, 0.5176471, 1,
1.368271, -0.3694693, 2.855218, 1, 0, 0.509804, 1,
1.379604, 1.524622, 1.329198, 1, 0, 0.5058824, 1,
1.390404, -2.619672, 3.398815, 1, 0, 0.4980392, 1,
1.391277, -1.624646, 2.332001, 1, 0, 0.4901961, 1,
1.405103, -1.499217, 3.023249, 1, 0, 0.4862745, 1,
1.406717, 1.422079, 2.326133, 1, 0, 0.4784314, 1,
1.420455, 0.5719408, 0.215889, 1, 0, 0.4745098, 1,
1.437673, 0.6995915, -0.354442, 1, 0, 0.4666667, 1,
1.445984, 0.5275142, 1.160429, 1, 0, 0.4627451, 1,
1.450536, -0.2124333, 1.543306, 1, 0, 0.454902, 1,
1.481773, 0.1734606, 2.085426, 1, 0, 0.4509804, 1,
1.483162, -0.02066376, 1.698169, 1, 0, 0.4431373, 1,
1.485921, -1.560929, 2.845323, 1, 0, 0.4392157, 1,
1.487384, -2.042381, 5.185475, 1, 0, 0.4313726, 1,
1.493499, -1.37859, 3.378207, 1, 0, 0.427451, 1,
1.502439, 0.291494, 2.879901, 1, 0, 0.4196078, 1,
1.503802, -0.6888384, 2.190831, 1, 0, 0.4156863, 1,
1.513688, 0.02271136, 2.337289, 1, 0, 0.4078431, 1,
1.525149, 0.3758297, 1.651385, 1, 0, 0.4039216, 1,
1.529432, 1.473487, 1.726899, 1, 0, 0.3960784, 1,
1.529526, 2.429777, 0.1344877, 1, 0, 0.3882353, 1,
1.533212, -1.213721, 2.436001, 1, 0, 0.3843137, 1,
1.537503, 0.5129389, 1.454027, 1, 0, 0.3764706, 1,
1.552732, -0.3394225, 0.9621373, 1, 0, 0.372549, 1,
1.558304, -0.92513, 4.115514, 1, 0, 0.3647059, 1,
1.577286, 0.01852919, 3.061446, 1, 0, 0.3607843, 1,
1.60999, 0.2881571, 1.477244, 1, 0, 0.3529412, 1,
1.628115, -0.1374066, -0.04328613, 1, 0, 0.3490196, 1,
1.63349, -0.1894574, -0.6346102, 1, 0, 0.3411765, 1,
1.636601, 1.480192, -0.1317699, 1, 0, 0.3372549, 1,
1.637606, 1.2195, 0.06086878, 1, 0, 0.3294118, 1,
1.641851, 0.7955245, 0.3671786, 1, 0, 0.3254902, 1,
1.647413, 0.8997133, 1.929922, 1, 0, 0.3176471, 1,
1.647496, -0.487502, 2.124407, 1, 0, 0.3137255, 1,
1.683503, 0.03758493, 2.94895, 1, 0, 0.3058824, 1,
1.687183, 0.06752994, 2.560782, 1, 0, 0.2980392, 1,
1.699637, 0.7744989, 0.7553477, 1, 0, 0.2941177, 1,
1.733182, 2.721149, 0.06523424, 1, 0, 0.2862745, 1,
1.736619, 0.8217469, 0.8531184, 1, 0, 0.282353, 1,
1.740568, 0.7127315, 1.772879, 1, 0, 0.2745098, 1,
1.772613, -1.020448, 3.022205, 1, 0, 0.2705882, 1,
1.774697, 0.9513093, -0.4912289, 1, 0, 0.2627451, 1,
1.787917, -0.412318, -0.3725014, 1, 0, 0.2588235, 1,
1.796345, 0.1767662, 1.23005, 1, 0, 0.2509804, 1,
1.805995, -0.1016641, 0.9739144, 1, 0, 0.2470588, 1,
1.821297, 1.294575, 1.605222, 1, 0, 0.2392157, 1,
1.834931, -1.505985, 3.493233, 1, 0, 0.2352941, 1,
1.839161, 1.409439, 1.114755, 1, 0, 0.227451, 1,
1.843122, -0.8674856, 1.537254, 1, 0, 0.2235294, 1,
1.845817, 0.713011, 1.360749, 1, 0, 0.2156863, 1,
1.861372, 1.026134, 0.6329308, 1, 0, 0.2117647, 1,
1.883458, -0.4006934, 1.334599, 1, 0, 0.2039216, 1,
1.889161, 0.4442014, 0.4346235, 1, 0, 0.1960784, 1,
1.901409, 1.75059, 0.7123824, 1, 0, 0.1921569, 1,
1.913887, 0.1206223, 0.8897598, 1, 0, 0.1843137, 1,
1.9144, 0.5939337, 2.492562, 1, 0, 0.1803922, 1,
1.943564, 1.100684, -0.2129042, 1, 0, 0.172549, 1,
1.946513, -0.4016687, 1.529471, 1, 0, 0.1686275, 1,
1.949556, -0.7817014, 1.255228, 1, 0, 0.1607843, 1,
2.010566, -0.06969862, 4.035743, 1, 0, 0.1568628, 1,
2.013962, -0.5933446, 3.462139, 1, 0, 0.1490196, 1,
2.014406, -0.5646555, 0.07418168, 1, 0, 0.145098, 1,
2.025348, 0.3697557, 0.2999761, 1, 0, 0.1372549, 1,
2.035592, 0.7263917, 0.7491506, 1, 0, 0.1333333, 1,
2.055929, 1.796105, 1.904045, 1, 0, 0.1254902, 1,
2.078507, 0.3664857, 1.724801, 1, 0, 0.1215686, 1,
2.079818, -1.223859, 2.154831, 1, 0, 0.1137255, 1,
2.081796, -0.4732969, 1.822159, 1, 0, 0.1098039, 1,
2.092188, -0.354382, 1.127817, 1, 0, 0.1019608, 1,
2.117581, -1.757031, 3.439544, 1, 0, 0.09411765, 1,
2.117845, -0.004841478, 0.258675, 1, 0, 0.09019608, 1,
2.121923, -2.199906, 2.523909, 1, 0, 0.08235294, 1,
2.12391, -2.387365, 2.059404, 1, 0, 0.07843138, 1,
2.155324, 0.2791793, 2.392442, 1, 0, 0.07058824, 1,
2.253464, -1.742911, 2.552067, 1, 0, 0.06666667, 1,
2.276233, -1.47817, 3.49558, 1, 0, 0.05882353, 1,
2.296293, 0.5710784, 1.343052, 1, 0, 0.05490196, 1,
2.299879, -0.5956706, 1.220812, 1, 0, 0.04705882, 1,
2.30603, 0.9292325, 1.648798, 1, 0, 0.04313726, 1,
2.328896, -1.188142, 2.01371, 1, 0, 0.03529412, 1,
2.334226, -0.377544, 0.5078073, 1, 0, 0.03137255, 1,
2.563301, 0.4489081, 0.799405, 1, 0, 0.02352941, 1,
2.616073, 1.173366, -0.09755247, 1, 0, 0.01960784, 1,
2.888576, 0.3464644, 3.135838, 1, 0, 0.01176471, 1,
2.928577, -1.407056, 2.367096, 1, 0, 0.007843138, 1
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
-0.1206636, -4.080398, -7.647853, 0, -0.5, 0.5, 0.5,
-0.1206636, -4.080398, -7.647853, 1, -0.5, 0.5, 0.5,
-0.1206636, -4.080398, -7.647853, 1, 1.5, 0.5, 0.5,
-0.1206636, -4.080398, -7.647853, 0, 1.5, 0.5, 0.5
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
-4.203597, -0.1018878, -7.647853, 0, -0.5, 0.5, 0.5,
-4.203597, -0.1018878, -7.647853, 1, -0.5, 0.5, 0.5,
-4.203597, -0.1018878, -7.647853, 1, 1.5, 0.5, 0.5,
-4.203597, -0.1018878, -7.647853, 0, 1.5, 0.5, 0.5
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
-4.203597, -4.080398, 0.437032, 0, -0.5, 0.5, 0.5,
-4.203597, -4.080398, 0.437032, 1, -0.5, 0.5, 0.5,
-4.203597, -4.080398, 0.437032, 1, 1.5, 0.5, 0.5,
-4.203597, -4.080398, 0.437032, 0, 1.5, 0.5, 0.5
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
-3, -3.16228, -5.78211,
2, -3.16228, -5.78211,
-3, -3.16228, -5.78211,
-3, -3.3153, -6.093068,
-2, -3.16228, -5.78211,
-2, -3.3153, -6.093068,
-1, -3.16228, -5.78211,
-1, -3.3153, -6.093068,
0, -3.16228, -5.78211,
0, -3.3153, -6.093068,
1, -3.16228, -5.78211,
1, -3.3153, -6.093068,
2, -3.16228, -5.78211,
2, -3.3153, -6.093068
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
-3, -3.621339, -6.714982, 0, -0.5, 0.5, 0.5,
-3, -3.621339, -6.714982, 1, -0.5, 0.5, 0.5,
-3, -3.621339, -6.714982, 1, 1.5, 0.5, 0.5,
-3, -3.621339, -6.714982, 0, 1.5, 0.5, 0.5,
-2, -3.621339, -6.714982, 0, -0.5, 0.5, 0.5,
-2, -3.621339, -6.714982, 1, -0.5, 0.5, 0.5,
-2, -3.621339, -6.714982, 1, 1.5, 0.5, 0.5,
-2, -3.621339, -6.714982, 0, 1.5, 0.5, 0.5,
-1, -3.621339, -6.714982, 0, -0.5, 0.5, 0.5,
-1, -3.621339, -6.714982, 1, -0.5, 0.5, 0.5,
-1, -3.621339, -6.714982, 1, 1.5, 0.5, 0.5,
-1, -3.621339, -6.714982, 0, 1.5, 0.5, 0.5,
0, -3.621339, -6.714982, 0, -0.5, 0.5, 0.5,
0, -3.621339, -6.714982, 1, -0.5, 0.5, 0.5,
0, -3.621339, -6.714982, 1, 1.5, 0.5, 0.5,
0, -3.621339, -6.714982, 0, 1.5, 0.5, 0.5,
1, -3.621339, -6.714982, 0, -0.5, 0.5, 0.5,
1, -3.621339, -6.714982, 1, -0.5, 0.5, 0.5,
1, -3.621339, -6.714982, 1, 1.5, 0.5, 0.5,
1, -3.621339, -6.714982, 0, 1.5, 0.5, 0.5,
2, -3.621339, -6.714982, 0, -0.5, 0.5, 0.5,
2, -3.621339, -6.714982, 1, -0.5, 0.5, 0.5,
2, -3.621339, -6.714982, 1, 1.5, 0.5, 0.5,
2, -3.621339, -6.714982, 0, 1.5, 0.5, 0.5
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
-3.261381, -3, -5.78211,
-3.261381, 2, -5.78211,
-3.261381, -3, -5.78211,
-3.418417, -3, -6.093068,
-3.261381, -2, -5.78211,
-3.418417, -2, -6.093068,
-3.261381, -1, -5.78211,
-3.418417, -1, -6.093068,
-3.261381, 0, -5.78211,
-3.418417, 0, -6.093068,
-3.261381, 1, -5.78211,
-3.418417, 1, -6.093068,
-3.261381, 2, -5.78211,
-3.418417, 2, -6.093068
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
-3.732489, -3, -6.714982, 0, -0.5, 0.5, 0.5,
-3.732489, -3, -6.714982, 1, -0.5, 0.5, 0.5,
-3.732489, -3, -6.714982, 1, 1.5, 0.5, 0.5,
-3.732489, -3, -6.714982, 0, 1.5, 0.5, 0.5,
-3.732489, -2, -6.714982, 0, -0.5, 0.5, 0.5,
-3.732489, -2, -6.714982, 1, -0.5, 0.5, 0.5,
-3.732489, -2, -6.714982, 1, 1.5, 0.5, 0.5,
-3.732489, -2, -6.714982, 0, 1.5, 0.5, 0.5,
-3.732489, -1, -6.714982, 0, -0.5, 0.5, 0.5,
-3.732489, -1, -6.714982, 1, -0.5, 0.5, 0.5,
-3.732489, -1, -6.714982, 1, 1.5, 0.5, 0.5,
-3.732489, -1, -6.714982, 0, 1.5, 0.5, 0.5,
-3.732489, 0, -6.714982, 0, -0.5, 0.5, 0.5,
-3.732489, 0, -6.714982, 1, -0.5, 0.5, 0.5,
-3.732489, 0, -6.714982, 1, 1.5, 0.5, 0.5,
-3.732489, 0, -6.714982, 0, 1.5, 0.5, 0.5,
-3.732489, 1, -6.714982, 0, -0.5, 0.5, 0.5,
-3.732489, 1, -6.714982, 1, -0.5, 0.5, 0.5,
-3.732489, 1, -6.714982, 1, 1.5, 0.5, 0.5,
-3.732489, 1, -6.714982, 0, 1.5, 0.5, 0.5,
-3.732489, 2, -6.714982, 0, -0.5, 0.5, 0.5,
-3.732489, 2, -6.714982, 1, -0.5, 0.5, 0.5,
-3.732489, 2, -6.714982, 1, 1.5, 0.5, 0.5,
-3.732489, 2, -6.714982, 0, 1.5, 0.5, 0.5
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
-3.261381, -3.16228, -4,
-3.261381, -3.16228, 6,
-3.261381, -3.16228, -4,
-3.418417, -3.3153, -4,
-3.261381, -3.16228, -2,
-3.418417, -3.3153, -2,
-3.261381, -3.16228, 0,
-3.418417, -3.3153, 0,
-3.261381, -3.16228, 2,
-3.418417, -3.3153, 2,
-3.261381, -3.16228, 4,
-3.418417, -3.3153, 4,
-3.261381, -3.16228, 6,
-3.418417, -3.3153, 6
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
-3.732489, -3.621339, -4, 0, -0.5, 0.5, 0.5,
-3.732489, -3.621339, -4, 1, -0.5, 0.5, 0.5,
-3.732489, -3.621339, -4, 1, 1.5, 0.5, 0.5,
-3.732489, -3.621339, -4, 0, 1.5, 0.5, 0.5,
-3.732489, -3.621339, -2, 0, -0.5, 0.5, 0.5,
-3.732489, -3.621339, -2, 1, -0.5, 0.5, 0.5,
-3.732489, -3.621339, -2, 1, 1.5, 0.5, 0.5,
-3.732489, -3.621339, -2, 0, 1.5, 0.5, 0.5,
-3.732489, -3.621339, 0, 0, -0.5, 0.5, 0.5,
-3.732489, -3.621339, 0, 1, -0.5, 0.5, 0.5,
-3.732489, -3.621339, 0, 1, 1.5, 0.5, 0.5,
-3.732489, -3.621339, 0, 0, 1.5, 0.5, 0.5,
-3.732489, -3.621339, 2, 0, -0.5, 0.5, 0.5,
-3.732489, -3.621339, 2, 1, -0.5, 0.5, 0.5,
-3.732489, -3.621339, 2, 1, 1.5, 0.5, 0.5,
-3.732489, -3.621339, 2, 0, 1.5, 0.5, 0.5,
-3.732489, -3.621339, 4, 0, -0.5, 0.5, 0.5,
-3.732489, -3.621339, 4, 1, -0.5, 0.5, 0.5,
-3.732489, -3.621339, 4, 1, 1.5, 0.5, 0.5,
-3.732489, -3.621339, 4, 0, 1.5, 0.5, 0.5,
-3.732489, -3.621339, 6, 0, -0.5, 0.5, 0.5,
-3.732489, -3.621339, 6, 1, -0.5, 0.5, 0.5,
-3.732489, -3.621339, 6, 1, 1.5, 0.5, 0.5,
-3.732489, -3.621339, 6, 0, 1.5, 0.5, 0.5
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
-3.261381, -3.16228, -5.78211,
-3.261381, 2.958505, -5.78211,
-3.261381, -3.16228, 6.656174,
-3.261381, 2.958505, 6.656174,
-3.261381, -3.16228, -5.78211,
-3.261381, -3.16228, 6.656174,
-3.261381, 2.958505, -5.78211,
-3.261381, 2.958505, 6.656174,
-3.261381, -3.16228, -5.78211,
3.020054, -3.16228, -5.78211,
-3.261381, -3.16228, 6.656174,
3.020054, -3.16228, 6.656174,
-3.261381, 2.958505, -5.78211,
3.020054, 2.958505, -5.78211,
-3.261381, 2.958505, 6.656174,
3.020054, 2.958505, 6.656174,
3.020054, -3.16228, -5.78211,
3.020054, 2.958505, -5.78211,
3.020054, -3.16228, 6.656174,
3.020054, 2.958505, 6.656174,
3.020054, -3.16228, -5.78211,
3.020054, -3.16228, 6.656174,
3.020054, 2.958505, -5.78211,
3.020054, 2.958505, 6.656174
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
var radius = 8.126886;
var distance = 36.15743;
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
mvMatrix.translate( 0.1206636, 0.1018878, -0.437032 );
mvMatrix.scale( 1.398876, 1.435592, 0.7064437 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.15743);
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
dimethirimol<-read.table("dimethirimol.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethirimol$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethirimol' not found
```

```r
y<-dimethirimol$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethirimol' not found
```

```r
z<-dimethirimol$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethirimol' not found
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
-3.169904, 0.2340796, -2.446964, 0, 0, 1, 1, 1,
-3.109599, -0.4487862, -2.410789, 1, 0, 0, 1, 1,
-2.97829, 0.6583867, -0.4649268, 1, 0, 0, 1, 1,
-2.703502, -1.512141, -2.580687, 1, 0, 0, 1, 1,
-2.618352, 0.1078837, -1.889345, 1, 0, 0, 1, 1,
-2.550932, -0.7756441, -3.341267, 1, 0, 0, 1, 1,
-2.396555, -0.1085979, -1.620149, 0, 0, 0, 1, 1,
-2.393051, 1.320477, -0.2912875, 0, 0, 0, 1, 1,
-2.3618, -0.2780779, -2.747756, 0, 0, 0, 1, 1,
-2.343093, 1.107376, -1.206757, 0, 0, 0, 1, 1,
-2.325043, 2.22844, -1.065665, 0, 0, 0, 1, 1,
-2.321539, -0.8172204, -0.7337118, 0, 0, 0, 1, 1,
-2.297618, 1.901796, -0.5776937, 0, 0, 0, 1, 1,
-2.29708, -0.5106666, -0.2270378, 1, 1, 1, 1, 1,
-2.255837, -1.030867, -4.559614, 1, 1, 1, 1, 1,
-2.153714, -0.6214455, -1.747507, 1, 1, 1, 1, 1,
-2.145507, -1.402688, -1.277278, 1, 1, 1, 1, 1,
-2.126337, 0.4889154, -0.05607324, 1, 1, 1, 1, 1,
-2.054254, -0.5007758, -1.396552, 1, 1, 1, 1, 1,
-2.042175, 0.2387475, -1.785714, 1, 1, 1, 1, 1,
-2.021976, 0.2865335, 1.508117, 1, 1, 1, 1, 1,
-2.011818, 0.7004795, -1.110861, 1, 1, 1, 1, 1,
-2.009789, 2.590106, -1.460913, 1, 1, 1, 1, 1,
-1.992103, -0.1570252, -2.191206, 1, 1, 1, 1, 1,
-1.986503, -0.3530306, -1.376605, 1, 1, 1, 1, 1,
-1.972241, -0.944842, -2.88245, 1, 1, 1, 1, 1,
-1.956049, -0.6268176, -1.653342, 1, 1, 1, 1, 1,
-1.846179, 0.7794331, 1.377649, 1, 1, 1, 1, 1,
-1.843843, -1.288941, -2.365427, 0, 0, 1, 1, 1,
-1.815489, 0.5190997, -1.363868, 1, 0, 0, 1, 1,
-1.80964, -0.02259634, -2.25478, 1, 0, 0, 1, 1,
-1.807175, -0.547021, -1.547654, 1, 0, 0, 1, 1,
-1.796907, -1.249826, -1.691846, 1, 0, 0, 1, 1,
-1.78539, -1.390907, -1.951807, 1, 0, 0, 1, 1,
-1.78473, -0.3421052, -2.178389, 0, 0, 0, 1, 1,
-1.783573, 1.383313, 0.9659785, 0, 0, 0, 1, 1,
-1.780979, -0.2971722, -0.958636, 0, 0, 0, 1, 1,
-1.774036, 0.6645122, -1.076229, 0, 0, 0, 1, 1,
-1.759281, -0.9265247, -1.348459, 0, 0, 0, 1, 1,
-1.750292, 0.1317127, -0.1714875, 0, 0, 0, 1, 1,
-1.739364, -2.136763, -2.394569, 0, 0, 0, 1, 1,
-1.736543, 0.9181386, -2.321959, 1, 1, 1, 1, 1,
-1.73487, -0.5046729, -1.17362, 1, 1, 1, 1, 1,
-1.727084, 0.8214875, -0.9253606, 1, 1, 1, 1, 1,
-1.712639, -1.042631, -2.024461, 1, 1, 1, 1, 1,
-1.706417, 1.02106, -1.399156, 1, 1, 1, 1, 1,
-1.705121, 0.0004334548, -0.2905287, 1, 1, 1, 1, 1,
-1.690047, 1.045426, -1.090569, 1, 1, 1, 1, 1,
-1.655456, -1.393025, -1.373696, 1, 1, 1, 1, 1,
-1.617213, 0.4476134, -0.9329531, 1, 1, 1, 1, 1,
-1.613277, -1.52253, -1.880982, 1, 1, 1, 1, 1,
-1.603909, -1.513016, -3.078784, 1, 1, 1, 1, 1,
-1.601281, 1.306274, 0.4353922, 1, 1, 1, 1, 1,
-1.585035, -1.19062, -2.091094, 1, 1, 1, 1, 1,
-1.574949, 0.03686692, -2.758789, 1, 1, 1, 1, 1,
-1.561011, 1.20077, -0.9089326, 1, 1, 1, 1, 1,
-1.552389, -0.578089, -3.375504, 0, 0, 1, 1, 1,
-1.532708, -0.9453155, -0.3163481, 1, 0, 0, 1, 1,
-1.500465, -0.8644649, -2.436419, 1, 0, 0, 1, 1,
-1.498579, -2.439806, -3.04876, 1, 0, 0, 1, 1,
-1.496317, 0.5459081, -1.26656, 1, 0, 0, 1, 1,
-1.491306, -0.5125553, -0.9969364, 1, 0, 0, 1, 1,
-1.489037, 0.09785903, -0.4461408, 0, 0, 0, 1, 1,
-1.487139, -0.1625716, -4.416207, 0, 0, 0, 1, 1,
-1.479872, -0.6116369, -1.090393, 0, 0, 0, 1, 1,
-1.465384, 1.162919, 0.07090463, 0, 0, 0, 1, 1,
-1.458531, -1.195812, -2.0496, 0, 0, 0, 1, 1,
-1.451249, -0.7587085, -1.652207, 0, 0, 0, 1, 1,
-1.449921, -0.3023483, -0.9602478, 0, 0, 0, 1, 1,
-1.440809, 1.096519, -1.387999, 1, 1, 1, 1, 1,
-1.434751, -1.549007, -3.186639, 1, 1, 1, 1, 1,
-1.431657, -1.166827, -3.444885, 1, 1, 1, 1, 1,
-1.429187, 0.421462, -4.329175, 1, 1, 1, 1, 1,
-1.424249, -0.9555399, -0.3705426, 1, 1, 1, 1, 1,
-1.423032, -0.8103023, 1.019668, 1, 1, 1, 1, 1,
-1.417596, -0.2944893, -2.256045, 1, 1, 1, 1, 1,
-1.39855, -0.1492461, -2.476824, 1, 1, 1, 1, 1,
-1.385448, -1.048733, -2.389884, 1, 1, 1, 1, 1,
-1.382547, 1.627568, 0.4051551, 1, 1, 1, 1, 1,
-1.377347, -2.028816, -3.0437, 1, 1, 1, 1, 1,
-1.376828, -1.103783, -3.413003, 1, 1, 1, 1, 1,
-1.371513, 0.543705, -0.3324113, 1, 1, 1, 1, 1,
-1.370492, 0.1644591, -0.3321404, 1, 1, 1, 1, 1,
-1.366152, 0.07336441, -1.943698, 1, 1, 1, 1, 1,
-1.363707, -0.6303471, -2.067948, 0, 0, 1, 1, 1,
-1.36202, 1.161956, -1.0911, 1, 0, 0, 1, 1,
-1.351689, -0.7846885, -2.591719, 1, 0, 0, 1, 1,
-1.350644, 2.869367, -0.1325061, 1, 0, 0, 1, 1,
-1.350376, -0.05106716, -2.697526, 1, 0, 0, 1, 1,
-1.330746, -0.4142376, -2.284538, 1, 0, 0, 1, 1,
-1.322856, -0.7085205, -2.20734, 0, 0, 0, 1, 1,
-1.311549, 0.1444404, -0.004597407, 0, 0, 0, 1, 1,
-1.311477, 0.2997502, -0.8354951, 0, 0, 0, 1, 1,
-1.307935, 1.687188, -1.093408, 0, 0, 0, 1, 1,
-1.306394, -1.248796, -3.378264, 0, 0, 0, 1, 1,
-1.302924, 0.6210997, -1.006955, 0, 0, 0, 1, 1,
-1.299306, 1.611858, -1.644166, 0, 0, 0, 1, 1,
-1.297583, -0.9434004, -2.776251, 1, 1, 1, 1, 1,
-1.294081, -0.7888089, -3.174245, 1, 1, 1, 1, 1,
-1.275064, -1.048724, -3.693847, 1, 1, 1, 1, 1,
-1.273696, -0.03272254, -0.6421916, 1, 1, 1, 1, 1,
-1.271315, -0.3252341, -4.248087, 1, 1, 1, 1, 1,
-1.266394, -0.7387441, -1.582207, 1, 1, 1, 1, 1,
-1.264809, -0.233716, -2.185129, 1, 1, 1, 1, 1,
-1.263254, 0.679101, -2.24839, 1, 1, 1, 1, 1,
-1.260062, -0.7284215, 0.3028684, 1, 1, 1, 1, 1,
-1.260007, -0.9031872, -2.463414, 1, 1, 1, 1, 1,
-1.23813, -1.708987, -0.9731926, 1, 1, 1, 1, 1,
-1.233773, -0.742115, -1.019707, 1, 1, 1, 1, 1,
-1.229385, -0.2996396, -1.437247, 1, 1, 1, 1, 1,
-1.224375, 2.323729, -0.2388339, 1, 1, 1, 1, 1,
-1.221254, 1.020736, -0.65833, 1, 1, 1, 1, 1,
-1.219819, 1.563708, 0.7244545, 0, 0, 1, 1, 1,
-1.217308, 0.8688547, 0.2093674, 1, 0, 0, 1, 1,
-1.216202, -0.01003332, -3.084419, 1, 0, 0, 1, 1,
-1.211374, 0.3114007, -1.917958, 1, 0, 0, 1, 1,
-1.21004, -1.725743, -4.37899, 1, 0, 0, 1, 1,
-1.209827, 1.008367, -0.7263056, 1, 0, 0, 1, 1,
-1.209291, -0.4133871, -0.5599986, 0, 0, 0, 1, 1,
-1.199116, 1.577129, -1.528925, 0, 0, 0, 1, 1,
-1.198704, 0.5810146, -2.433458, 0, 0, 0, 1, 1,
-1.196922, -0.2319688, -0.07339911, 0, 0, 0, 1, 1,
-1.194935, -1.093358, -0.7830952, 0, 0, 0, 1, 1,
-1.185606, -0.2393268, -2.772839, 0, 0, 0, 1, 1,
-1.181418, -0.3711055, -1.808448, 0, 0, 0, 1, 1,
-1.174693, 0.7719585, -0.5602909, 1, 1, 1, 1, 1,
-1.169705, -1.088492, -1.403787, 1, 1, 1, 1, 1,
-1.161593, -0.2536901, -1.481205, 1, 1, 1, 1, 1,
-1.15949, 0.1698108, -1.782312, 1, 1, 1, 1, 1,
-1.159084, 2.136399, -0.1696135, 1, 1, 1, 1, 1,
-1.157615, 0.3818992, -0.5316734, 1, 1, 1, 1, 1,
-1.149911, 1.83909, -1.308609, 1, 1, 1, 1, 1,
-1.142003, -1.706429, -3.72335, 1, 1, 1, 1, 1,
-1.130073, -1.493752, -2.076485, 1, 1, 1, 1, 1,
-1.128918, -0.7404836, -2.186908, 1, 1, 1, 1, 1,
-1.115627, 0.9918982, -0.3979261, 1, 1, 1, 1, 1,
-1.110224, -0.1870479, -2.087372, 1, 1, 1, 1, 1,
-1.103844, 0.3677937, -1.663878, 1, 1, 1, 1, 1,
-1.103133, 0.4402219, 0.578023, 1, 1, 1, 1, 1,
-1.097946, -0.1107164, -2.411175, 1, 1, 1, 1, 1,
-1.095584, 0.008187016, -4.528282, 0, 0, 1, 1, 1,
-1.090072, -0.9453433, -0.9131005, 1, 0, 0, 1, 1,
-1.084389, 0.547498, -0.09013657, 1, 0, 0, 1, 1,
-1.058936, -1.130078, -2.186409, 1, 0, 0, 1, 1,
-1.058708, 0.0736168, -1.339345, 1, 0, 0, 1, 1,
-1.056389, 0.6952943, 0.938584, 1, 0, 0, 1, 1,
-1.053333, 0.1970823, -1.284922, 0, 0, 0, 1, 1,
-1.049328, 0.1701649, -2.010581, 0, 0, 0, 1, 1,
-1.044968, -0.1692097, -0.6382648, 0, 0, 0, 1, 1,
-1.040005, 0.1978102, -2.423819, 0, 0, 0, 1, 1,
-1.036271, 0.6755313, -0.5396413, 0, 0, 0, 1, 1,
-1.033639, -0.7938077, -1.688031, 0, 0, 0, 1, 1,
-1.028296, -0.603122, 0.177638, 0, 0, 0, 1, 1,
-1.024655, 0.3297098, -0.8600144, 1, 1, 1, 1, 1,
-1.019981, 1.623107, 1.20229, 1, 1, 1, 1, 1,
-1.004277, 0.9359074, -2.806521, 1, 1, 1, 1, 1,
-1.002699, -0.3171324, -0.4565998, 1, 1, 1, 1, 1,
-1.00174, 0.667804, -1.265373, 1, 1, 1, 1, 1,
-1.00001, -0.1693991, -2.27415, 1, 1, 1, 1, 1,
-0.9966039, -2.319927, -3.287668, 1, 1, 1, 1, 1,
-0.9897555, -0.2119469, -1.451889, 1, 1, 1, 1, 1,
-0.9890921, -0.6437467, -0.9158821, 1, 1, 1, 1, 1,
-0.9816592, 0.5769448, -1.679946, 1, 1, 1, 1, 1,
-0.9793657, -0.5950263, -2.075447, 1, 1, 1, 1, 1,
-0.9712346, 2.865992, 0.9585332, 1, 1, 1, 1, 1,
-0.9683896, -1.263428, -2.010176, 1, 1, 1, 1, 1,
-0.9650533, 0.8612965, -1.639715, 1, 1, 1, 1, 1,
-0.9584512, 0.6327386, -0.7718558, 1, 1, 1, 1, 1,
-0.9583221, -1.347961, -1.388429, 0, 0, 1, 1, 1,
-0.9572577, -0.091526, -2.145994, 1, 0, 0, 1, 1,
-0.9544806, -1.905018, -1.817552, 1, 0, 0, 1, 1,
-0.9461356, 0.09653635, -2.388215, 1, 0, 0, 1, 1,
-0.9440324, 0.2470111, -2.047771, 1, 0, 0, 1, 1,
-0.941942, -0.5130543, -2.210479, 1, 0, 0, 1, 1,
-0.9369102, 1.506244, -0.5611991, 0, 0, 0, 1, 1,
-0.9276734, -0.3956203, -1.339116, 0, 0, 0, 1, 1,
-0.9273019, -0.9259243, -2.514139, 0, 0, 0, 1, 1,
-0.9147012, -1.076857, -1.926326, 0, 0, 0, 1, 1,
-0.9127474, -0.1031433, -3.475331, 0, 0, 0, 1, 1,
-0.9114496, 1.187038, -0.09517542, 0, 0, 0, 1, 1,
-0.9108181, -0.09475476, -1.913497, 0, 0, 0, 1, 1,
-0.9055303, -1.670146, -3.118598, 1, 1, 1, 1, 1,
-0.9053588, 0.3081225, 0.4502532, 1, 1, 1, 1, 1,
-0.9044358, 0.2160526, -1.782694, 1, 1, 1, 1, 1,
-0.9040366, 1.135995, -1.201147, 1, 1, 1, 1, 1,
-0.9031026, 0.4588068, -0.4861875, 1, 1, 1, 1, 1,
-0.8973896, -0.200257, -1.734513, 1, 1, 1, 1, 1,
-0.8958235, -0.6852862, -2.022905, 1, 1, 1, 1, 1,
-0.8922601, -0.3685011, -0.7832163, 1, 1, 1, 1, 1,
-0.8899004, 1.423755, -0.5014967, 1, 1, 1, 1, 1,
-0.8810865, 1.466279, -0.06064595, 1, 1, 1, 1, 1,
-0.8799537, 1.846341, 1.130076, 1, 1, 1, 1, 1,
-0.8763407, -1.369585, -3.758451, 1, 1, 1, 1, 1,
-0.8732673, -0.6079303, -1.034634, 1, 1, 1, 1, 1,
-0.858186, 0.4057572, -0.8834775, 1, 1, 1, 1, 1,
-0.8514269, -0.239677, -1.60812, 1, 1, 1, 1, 1,
-0.8500226, -1.468096, -2.506649, 0, 0, 1, 1, 1,
-0.849805, -0.1869168, -1.644612, 1, 0, 0, 1, 1,
-0.8448587, 1.701356, -2.026744, 1, 0, 0, 1, 1,
-0.8370695, 1.104668, -1.028166, 1, 0, 0, 1, 1,
-0.8353944, 1.73495, -0.265505, 1, 0, 0, 1, 1,
-0.825735, -2.125903, -1.001697, 1, 0, 0, 1, 1,
-0.8225927, -0.7295537, -1.592441, 0, 0, 0, 1, 1,
-0.8154212, 0.8422375, -0.6930332, 0, 0, 0, 1, 1,
-0.815297, 0.01046375, -1.679932, 0, 0, 0, 1, 1,
-0.8130826, 0.9270163, -1.698172, 0, 0, 0, 1, 1,
-0.8119884, -1.907657, -2.78042, 0, 0, 0, 1, 1,
-0.8073053, 1.078125, 0.7592533, 0, 0, 0, 1, 1,
-0.8000209, 0.1588365, -0.6336753, 0, 0, 0, 1, 1,
-0.793892, -0.2536072, -1.879153, 1, 1, 1, 1, 1,
-0.7932521, -1.45037, -1.768075, 1, 1, 1, 1, 1,
-0.7814498, -0.1954218, -2.923627, 1, 1, 1, 1, 1,
-0.7785503, -0.635501, -1.76, 1, 1, 1, 1, 1,
-0.7725301, -0.4061956, -2.139745, 1, 1, 1, 1, 1,
-0.7648984, -0.3196335, 0.1415287, 1, 1, 1, 1, 1,
-0.7646666, 0.183655, -0.4005223, 1, 1, 1, 1, 1,
-0.7621492, 0.7632809, -1.993802, 1, 1, 1, 1, 1,
-0.7581425, -2.247448, -2.506712, 1, 1, 1, 1, 1,
-0.7580997, -1.521471, -4.014439, 1, 1, 1, 1, 1,
-0.7489212, -0.9445478, -1.680978, 1, 1, 1, 1, 1,
-0.740968, 1.14723, -0.1691639, 1, 1, 1, 1, 1,
-0.7380375, 0.4120753, -1.151595, 1, 1, 1, 1, 1,
-0.7297339, -0.2162883, -0.4786463, 1, 1, 1, 1, 1,
-0.7284935, 0.8136662, -2.275531, 1, 1, 1, 1, 1,
-0.7244871, 1.269946, -1.28948, 0, 0, 1, 1, 1,
-0.7238396, -1.298059, -4.254666, 1, 0, 0, 1, 1,
-0.7229357, -1.348354, -2.473045, 1, 0, 0, 1, 1,
-0.7206274, -0.1876132, -2.46073, 1, 0, 0, 1, 1,
-0.7198297, -0.1227432, -2.504387, 1, 0, 0, 1, 1,
-0.7192102, 0.589628, -1.855572, 1, 0, 0, 1, 1,
-0.7176504, -1.05159, -1.903815, 0, 0, 0, 1, 1,
-0.7170669, 0.2351618, -1.840342, 0, 0, 0, 1, 1,
-0.712998, 0.145889, -0.236089, 0, 0, 0, 1, 1,
-0.7106163, -1.505775, -3.443344, 0, 0, 0, 1, 1,
-0.7089198, 1.842054, -1.491646, 0, 0, 0, 1, 1,
-0.7082469, -0.4311824, -2.763768, 0, 0, 0, 1, 1,
-0.7076626, 0.008313458, -0.3296856, 0, 0, 0, 1, 1,
-0.7073373, 1.462096, -1.176599, 1, 1, 1, 1, 1,
-0.7066895, -2.50604, -2.62324, 1, 1, 1, 1, 1,
-0.7060646, 2.421788, 0.5200651, 1, 1, 1, 1, 1,
-0.6933772, 1.717421, -1.505252, 1, 1, 1, 1, 1,
-0.681312, -0.7843347, -3.809931, 1, 1, 1, 1, 1,
-0.6799829, 0.05414115, -0.5499175, 1, 1, 1, 1, 1,
-0.6793942, 0.02454242, -2.226132, 1, 1, 1, 1, 1,
-0.6791085, 2.261998, 1.728745, 1, 1, 1, 1, 1,
-0.6754203, 1.296342, 0.07766792, 1, 1, 1, 1, 1,
-0.6729644, 0.8751696, -1.168173, 1, 1, 1, 1, 1,
-0.6716842, 0.363904, -2.017531, 1, 1, 1, 1, 1,
-0.6680443, 2.065722, -0.6746256, 1, 1, 1, 1, 1,
-0.6586082, 0.2064179, -1.571057, 1, 1, 1, 1, 1,
-0.6564344, -0.2318622, -1.692415, 1, 1, 1, 1, 1,
-0.6545588, 2.29388, -1.223488, 1, 1, 1, 1, 1,
-0.6531309, 1.590738, -2.64446, 0, 0, 1, 1, 1,
-0.6521127, -0.399305, -1.432032, 1, 0, 0, 1, 1,
-0.6506857, -1.521969, -2.102195, 1, 0, 0, 1, 1,
-0.6504217, 1.339283, -0.4326975, 1, 0, 0, 1, 1,
-0.6488866, -1.601967, -2.358789, 1, 0, 0, 1, 1,
-0.6480134, -1.015373, -1.692179, 1, 0, 0, 1, 1,
-0.6434165, 0.3790306, -2.907211, 0, 0, 0, 1, 1,
-0.6408172, -0.5190781, -3.445014, 0, 0, 0, 1, 1,
-0.6340618, 1.752735, -0.6660629, 0, 0, 0, 1, 1,
-0.6320882, -0.04834849, -1.171496, 0, 0, 0, 1, 1,
-0.6310065, -0.1494599, -2.749887, 0, 0, 0, 1, 1,
-0.617636, -0.6806593, -1.239187, 0, 0, 0, 1, 1,
-0.6168896, -0.3951747, -1.675874, 0, 0, 0, 1, 1,
-0.6128275, 0.4095054, -0.5012283, 1, 1, 1, 1, 1,
-0.6061041, -0.2543037, -2.092411, 1, 1, 1, 1, 1,
-0.602677, -0.04715313, -0.7479324, 1, 1, 1, 1, 1,
-0.6022532, -0.4865222, -3.703825, 1, 1, 1, 1, 1,
-0.5946918, -1.370699, -3.623675, 1, 1, 1, 1, 1,
-0.5946193, 1.377141, 0.0499895, 1, 1, 1, 1, 1,
-0.5938967, -1.165992, -1.697929, 1, 1, 1, 1, 1,
-0.5916843, 0.3051033, -2.137225, 1, 1, 1, 1, 1,
-0.5898503, 0.452328, -1.09322, 1, 1, 1, 1, 1,
-0.5853148, 0.5579208, 1.388372, 1, 1, 1, 1, 1,
-0.5811962, -0.1497128, -0.3253967, 1, 1, 1, 1, 1,
-0.5809331, -2.022983, -4.122038, 1, 1, 1, 1, 1,
-0.5793358, -0.9853486, -2.90242, 1, 1, 1, 1, 1,
-0.5781816, 1.689942, -1.386878, 1, 1, 1, 1, 1,
-0.5708116, 0.7315149, -0.2022685, 1, 1, 1, 1, 1,
-0.5640759, -0.805379, -3.097131, 0, 0, 1, 1, 1,
-0.5620781, 0.7164183, 0.425788, 1, 0, 0, 1, 1,
-0.5596997, 0.2732148, -1.191424, 1, 0, 0, 1, 1,
-0.5561132, 0.5965517, -0.4471356, 1, 0, 0, 1, 1,
-0.5522743, 0.1006902, -2.55359, 1, 0, 0, 1, 1,
-0.5493382, 1.635004, 0.3015147, 1, 0, 0, 1, 1,
-0.5454115, -1.694582, -3.391852, 0, 0, 0, 1, 1,
-0.5446617, -1.42532, -1.465486, 0, 0, 0, 1, 1,
-0.5435289, -1.730252, -1.819677, 0, 0, 0, 1, 1,
-0.5423316, -1.616696, -2.191381, 0, 0, 0, 1, 1,
-0.5406128, -0.7370183, -1.675851, 0, 0, 0, 1, 1,
-0.5391132, -1.263195, -3.553437, 0, 0, 0, 1, 1,
-0.5286252, -0.677082, -0.9954066, 0, 0, 0, 1, 1,
-0.5275123, 0.04558198, -0.8127602, 1, 1, 1, 1, 1,
-0.5254093, 1.369352, -1.165543, 1, 1, 1, 1, 1,
-0.5216718, -0.536163, -1.014242, 1, 1, 1, 1, 1,
-0.5161197, -0.01418771, -1.358277, 1, 1, 1, 1, 1,
-0.5160469, -0.3296653, -2.89268, 1, 1, 1, 1, 1,
-0.5147373, 1.230162, 0.07585979, 1, 1, 1, 1, 1,
-0.513513, 1.599832, 0.3625351, 1, 1, 1, 1, 1,
-0.5103192, -1.738256, -2.539504, 1, 1, 1, 1, 1,
-0.510285, 0.1463889, -1.674992, 1, 1, 1, 1, 1,
-0.5084342, 1.045284, -0.1415867, 1, 1, 1, 1, 1,
-0.4967131, -0.5981208, -1.391331, 1, 1, 1, 1, 1,
-0.4914643, 2.440994, 0.5837024, 1, 1, 1, 1, 1,
-0.4913037, 0.6463249, 0.1695348, 1, 1, 1, 1, 1,
-0.489998, -1.208561, -2.859133, 1, 1, 1, 1, 1,
-0.4899721, 2.177278, -0.1760397, 1, 1, 1, 1, 1,
-0.4889914, -0.855334, -4.104652, 0, 0, 1, 1, 1,
-0.4842175, -0.6852008, -3.170199, 1, 0, 0, 1, 1,
-0.4824183, -0.1735842, -2.593543, 1, 0, 0, 1, 1,
-0.4720293, 1.742439, 1.077848, 1, 0, 0, 1, 1,
-0.4675396, -0.8814526, -4.116608, 1, 0, 0, 1, 1,
-0.4672437, -1.057588, -3.081558, 1, 0, 0, 1, 1,
-0.4647106, 1.222612, 0.8782899, 0, 0, 0, 1, 1,
-0.4634412, 0.5849819, -3.605004, 0, 0, 0, 1, 1,
-0.4626254, 0.1404087, -3.123578, 0, 0, 0, 1, 1,
-0.4602452, 0.5328292, -1.294108, 0, 0, 0, 1, 1,
-0.4573771, 1.752195, -1.036579, 0, 0, 0, 1, 1,
-0.4558209, 1.502185, -1.556629, 0, 0, 0, 1, 1,
-0.4516143, -0.7829095, -2.370229, 0, 0, 0, 1, 1,
-0.4498403, 1.362674, -1.676507, 1, 1, 1, 1, 1,
-0.4416836, 0.6892073, 0.2286651, 1, 1, 1, 1, 1,
-0.4388131, 0.06127844, -2.675303, 1, 1, 1, 1, 1,
-0.4368607, 0.4849773, -1.661287, 1, 1, 1, 1, 1,
-0.4364118, 0.3422856, 1.703823, 1, 1, 1, 1, 1,
-0.4358885, -0.06012729, -3.712765, 1, 1, 1, 1, 1,
-0.435168, -0.1222783, -2.041311, 1, 1, 1, 1, 1,
-0.4327959, -1.686978, -2.790488, 1, 1, 1, 1, 1,
-0.4288101, 1.930524, 0.5230615, 1, 1, 1, 1, 1,
-0.4283448, -0.6828517, -2.383377, 1, 1, 1, 1, 1,
-0.4264123, 0.2233713, -0.7088079, 1, 1, 1, 1, 1,
-0.4239688, 0.589218, -0.497647, 1, 1, 1, 1, 1,
-0.4236043, 0.01612764, -1.715032, 1, 1, 1, 1, 1,
-0.4212736, -0.3559766, -2.403083, 1, 1, 1, 1, 1,
-0.4210682, 0.6801882, -1.030171, 1, 1, 1, 1, 1,
-0.4129861, -1.313766, -1.384348, 0, 0, 1, 1, 1,
-0.4122869, 0.2112911, 0.5096988, 1, 0, 0, 1, 1,
-0.4024955, 0.5832046, -1.145141, 1, 0, 0, 1, 1,
-0.4004825, 0.6146663, -0.1857907, 1, 0, 0, 1, 1,
-0.4000101, 1.293726, -1.087386, 1, 0, 0, 1, 1,
-0.3987859, -0.866104, -3.003151, 1, 0, 0, 1, 1,
-0.3978196, -0.6900218, -2.616045, 0, 0, 0, 1, 1,
-0.3958624, -1.035311, -3.703017, 0, 0, 0, 1, 1,
-0.3932282, -0.5490981, -2.757222, 0, 0, 0, 1, 1,
-0.3895831, -1.694982, -3.714966, 0, 0, 0, 1, 1,
-0.3886633, 0.8612685, -0.01387354, 0, 0, 0, 1, 1,
-0.3878815, -0.5055502, -4.115179, 0, 0, 0, 1, 1,
-0.386576, -1.703203, 0.01891935, 0, 0, 0, 1, 1,
-0.3855695, -0.2229737, -2.787064, 1, 1, 1, 1, 1,
-0.3840477, 0.2805466, 0.198324, 1, 1, 1, 1, 1,
-0.3817177, -0.2116505, -3.133811, 1, 1, 1, 1, 1,
-0.3776983, 0.2140247, 0.4481244, 1, 1, 1, 1, 1,
-0.3753971, 0.4821227, 0.3297508, 1, 1, 1, 1, 1,
-0.3735049, -0.01648095, -0.3909091, 1, 1, 1, 1, 1,
-0.3733894, -1.201756, -1.814206, 1, 1, 1, 1, 1,
-0.3714976, 0.4177749, 1.419219, 1, 1, 1, 1, 1,
-0.3666549, -0.002601846, -1.979809, 1, 1, 1, 1, 1,
-0.3630135, -0.9671999, -4.220052, 1, 1, 1, 1, 1,
-0.3569848, -0.6358902, -1.453273, 1, 1, 1, 1, 1,
-0.355541, 0.1959858, -2.157335, 1, 1, 1, 1, 1,
-0.3484914, 0.161958, -2.893659, 1, 1, 1, 1, 1,
-0.344012, -1.753642, -3.091199, 1, 1, 1, 1, 1,
-0.3439604, 0.5220564, 0.02907539, 1, 1, 1, 1, 1,
-0.3402918, -2.009224, -2.707315, 0, 0, 1, 1, 1,
-0.3390872, 0.7736534, -0.393246, 1, 0, 0, 1, 1,
-0.3375502, -1.697068, -2.796074, 1, 0, 0, 1, 1,
-0.3311094, -0.02896399, 0.2448926, 1, 0, 0, 1, 1,
-0.331074, 0.9908667, -0.1844332, 1, 0, 0, 1, 1,
-0.3249519, 0.4792733, -0.8946602, 1, 0, 0, 1, 1,
-0.3236496, -0.5142718, -1.66769, 0, 0, 0, 1, 1,
-0.322616, 0.2329674, -0.1341234, 0, 0, 0, 1, 1,
-0.3203541, -1.709147, -3.115011, 0, 0, 0, 1, 1,
-0.3193973, -1.520082, -2.801769, 0, 0, 0, 1, 1,
-0.3165843, -0.4983523, -3.074467, 0, 0, 0, 1, 1,
-0.3137881, -1.820675, -2.254026, 0, 0, 0, 1, 1,
-0.3120299, 1.060801, -0.4928373, 0, 0, 0, 1, 1,
-0.3095709, 1.262829, -0.6076788, 1, 1, 1, 1, 1,
-0.3067443, 1.297777, -1.599337, 1, 1, 1, 1, 1,
-0.3064593, 1.944133, -1.710835, 1, 1, 1, 1, 1,
-0.3036668, 0.04523737, -2.934711, 1, 1, 1, 1, 1,
-0.298927, 0.7618697, -0.3189157, 1, 1, 1, 1, 1,
-0.2982257, 1.82655, -1.158517, 1, 1, 1, 1, 1,
-0.297045, -0.8199447, -2.865842, 1, 1, 1, 1, 1,
-0.2970235, -0.720235, -2.023727, 1, 1, 1, 1, 1,
-0.2946502, 1.000269, -0.1355051, 1, 1, 1, 1, 1,
-0.2928097, 1.278641, -1.198163, 1, 1, 1, 1, 1,
-0.2906604, 0.4336829, -0.7868494, 1, 1, 1, 1, 1,
-0.2896419, 0.1152045, -1.886497, 1, 1, 1, 1, 1,
-0.2894979, 0.8683431, -0.7194411, 1, 1, 1, 1, 1,
-0.2853961, 0.3302656, -1.002655, 1, 1, 1, 1, 1,
-0.2792444, 1.230012, 0.6309425, 1, 1, 1, 1, 1,
-0.2769294, -1.485458, -3.407412, 0, 0, 1, 1, 1,
-0.2701655, 0.3845363, -1.364653, 1, 0, 0, 1, 1,
-0.268755, 0.2703578, -1.7633, 1, 0, 0, 1, 1,
-0.264392, -2.47854, -2.550653, 1, 0, 0, 1, 1,
-0.2607076, 0.7967071, -0.6075792, 1, 0, 0, 1, 1,
-0.2524207, 0.7637061, 0.6535228, 1, 0, 0, 1, 1,
-0.2518179, -0.2159396, -2.441912, 0, 0, 0, 1, 1,
-0.2501475, -0.05392689, -1.707772, 0, 0, 0, 1, 1,
-0.2489873, 0.5621367, 0.111224, 0, 0, 0, 1, 1,
-0.2487522, 1.370069, -0.2499597, 0, 0, 0, 1, 1,
-0.2478422, 0.247645, -0.9475016, 0, 0, 0, 1, 1,
-0.2472409, 0.4815705, -1.477515, 0, 0, 0, 1, 1,
-0.2376199, -0.0388898, -1.463478, 0, 0, 0, 1, 1,
-0.2357942, -1.01796, -3.971979, 1, 1, 1, 1, 1,
-0.2295375, -1.45474, -2.788905, 1, 1, 1, 1, 1,
-0.2270417, 2.102547, 0.6350901, 1, 1, 1, 1, 1,
-0.2235434, -1.35063, -3.376046, 1, 1, 1, 1, 1,
-0.219524, 0.3732605, -0.147359, 1, 1, 1, 1, 1,
-0.2150452, -1.95791, -5.60097, 1, 1, 1, 1, 1,
-0.2129259, 1.338231, -0.1107591, 1, 1, 1, 1, 1,
-0.2118871, -1.00663, -3.516914, 1, 1, 1, 1, 1,
-0.2109108, -1.558244, -2.552548, 1, 1, 1, 1, 1,
-0.208222, 0.2209552, 0.8134343, 1, 1, 1, 1, 1,
-0.2067372, -1.072824, -3.065253, 1, 1, 1, 1, 1,
-0.2039493, -0.848891, -2.028202, 1, 1, 1, 1, 1,
-0.2035615, -0.005273626, -0.5794128, 1, 1, 1, 1, 1,
-0.2030584, -0.5412558, -3.570587, 1, 1, 1, 1, 1,
-0.201348, -0.381093, -0.777538, 1, 1, 1, 1, 1,
-0.2013189, 1.067212, 0.8036847, 0, 0, 1, 1, 1,
-0.1994152, -0.1877496, -2.096468, 1, 0, 0, 1, 1,
-0.1937898, 0.7299432, 0.2587976, 1, 0, 0, 1, 1,
-0.1820171, -0.1604587, -2.803312, 1, 0, 0, 1, 1,
-0.1797935, -1.288198, -2.703778, 1, 0, 0, 1, 1,
-0.1795928, -0.2115336, -2.344676, 1, 0, 0, 1, 1,
-0.1772959, 0.1910811, -0.4212531, 0, 0, 0, 1, 1,
-0.1752519, 0.2532018, -1.207366, 0, 0, 0, 1, 1,
-0.1742029, 1.196379, 0.1777416, 0, 0, 0, 1, 1,
-0.172674, 1.372536, -0.1580233, 0, 0, 0, 1, 1,
-0.1669893, -2.618055, -2.355989, 0, 0, 0, 1, 1,
-0.1656778, 0.7339212, -1.221343, 0, 0, 0, 1, 1,
-0.1619494, -0.723995, -3.572968, 0, 0, 0, 1, 1,
-0.1616891, 0.231408, -0.07215678, 1, 1, 1, 1, 1,
-0.1515239, 0.9392244, -0.04791832, 1, 1, 1, 1, 1,
-0.1452749, -0.6411243, -2.016917, 1, 1, 1, 1, 1,
-0.1432933, -0.9080202, -1.49538, 1, 1, 1, 1, 1,
-0.1424144, -1.07148, -3.347771, 1, 1, 1, 1, 1,
-0.138333, -0.4681442, -2.048723, 1, 1, 1, 1, 1,
-0.1373334, -1.550042, -3.393588, 1, 1, 1, 1, 1,
-0.1322108, -0.4289651, -1.499137, 1, 1, 1, 1, 1,
-0.1282998, -0.6209198, -2.767077, 1, 1, 1, 1, 1,
-0.1280717, 1.246583, -0.7469254, 1, 1, 1, 1, 1,
-0.1262535, -0.09741729, -2.73929, 1, 1, 1, 1, 1,
-0.124168, -0.8862866, -3.774347, 1, 1, 1, 1, 1,
-0.1236524, -0.08617062, -2.080379, 1, 1, 1, 1, 1,
-0.1234726, -0.05040492, -3.631971, 1, 1, 1, 1, 1,
-0.1209014, 1.497711, -0.4325328, 1, 1, 1, 1, 1,
-0.119483, 1.052612, 0.03739802, 0, 0, 1, 1, 1,
-0.1188482, 0.9042399, -1.44682, 1, 0, 0, 1, 1,
-0.1159313, -0.6216279, -2.999226, 1, 0, 0, 1, 1,
-0.1148269, -0.06912968, -3.027366, 1, 0, 0, 1, 1,
-0.1128205, -2.542737, -3.917559, 1, 0, 0, 1, 1,
-0.1111881, 1.849489, -0.351333, 1, 0, 0, 1, 1,
-0.1108913, 0.9079341, 1.653729, 0, 0, 0, 1, 1,
-0.1100175, 0.2965176, 0.1330335, 0, 0, 0, 1, 1,
-0.1084068, -1.156171, -3.091581, 0, 0, 0, 1, 1,
-0.1080067, -2.46483, -3.007432, 0, 0, 0, 1, 1,
-0.1077387, 1.150397, 2.018852, 0, 0, 0, 1, 1,
-0.1026103, 0.1906096, -3.061167, 0, 0, 0, 1, 1,
-0.09347355, -0.2234042, -3.511514, 0, 0, 0, 1, 1,
-0.09327268, -1.851921, -3.34716, 1, 1, 1, 1, 1,
-0.09286419, -0.3145091, -3.116737, 1, 1, 1, 1, 1,
-0.09223336, -0.6409037, -4.009286, 1, 1, 1, 1, 1,
-0.09059524, 1.370286, 0.4628508, 1, 1, 1, 1, 1,
-0.08998854, 0.1154798, 1.031271, 1, 1, 1, 1, 1,
-0.08974327, -0.3086767, -1.989791, 1, 1, 1, 1, 1,
-0.08895673, 1.654628, -0.1743821, 1, 1, 1, 1, 1,
-0.08498682, -0.0444208, -1.372025, 1, 1, 1, 1, 1,
-0.0783436, 1.260191, -0.4700469, 1, 1, 1, 1, 1,
-0.06657714, 0.09452569, -1.314497, 1, 1, 1, 1, 1,
-0.05097789, 0.4956755, -0.313309, 1, 1, 1, 1, 1,
-0.04704768, 0.1399756, 0.139337, 1, 1, 1, 1, 1,
-0.03962306, -0.07967924, -4.107713, 1, 1, 1, 1, 1,
-0.03954006, -0.7460917, -1.676727, 1, 1, 1, 1, 1,
-0.03880862, -2.139547, -0.5332925, 1, 1, 1, 1, 1,
-0.03364864, 0.3617691, -0.900113, 0, 0, 1, 1, 1,
-0.03182796, -0.3562344, -3.149368, 1, 0, 0, 1, 1,
-0.02914774, 1.752503, -0.1809421, 1, 0, 0, 1, 1,
-0.02894584, 0.5309873, -0.1222262, 1, 0, 0, 1, 1,
-0.02819631, -2.692316, -2.350392, 1, 0, 0, 1, 1,
-0.02755591, 0.8796139, -0.5515904, 1, 0, 0, 1, 1,
-0.0236777, -0.927301, -1.878632, 0, 0, 0, 1, 1,
-0.01809646, 0.3538, 0.364277, 0, 0, 0, 1, 1,
-0.01598795, 0.3658071, 0.5748081, 0, 0, 0, 1, 1,
-0.01363006, 0.5560437, 0.4234798, 0, 0, 0, 1, 1,
-0.01023984, -2.165334, -4.028631, 0, 0, 0, 1, 1,
-0.01017387, -0.1211774, -2.562492, 0, 0, 0, 1, 1,
-0.008624046, -0.05631056, -2.994292, 0, 0, 0, 1, 1,
-0.005884665, 0.6252842, 0.5609078, 1, 1, 1, 1, 1,
-0.005828399, 1.673595, -0.8654072, 1, 1, 1, 1, 1,
-0.003239925, -0.9194354, -2.638716, 1, 1, 1, 1, 1,
-0.002909686, 0.4886205, 1.100831, 1, 1, 1, 1, 1,
-0.001123658, -0.7833399, -3.568757, 1, 1, 1, 1, 1,
-0.0003933335, 2.099749, -1.455141, 1, 1, 1, 1, 1,
0.0009495438, 0.2882083, -0.6588176, 1, 1, 1, 1, 1,
0.001496678, 1.419486, -0.02567442, 1, 1, 1, 1, 1,
0.006735967, 1.372916, -0.2939646, 1, 1, 1, 1, 1,
0.009329963, -0.2552064, 2.681398, 1, 1, 1, 1, 1,
0.01257474, 0.112829, -0.1566048, 1, 1, 1, 1, 1,
0.01272897, -0.9639272, 3.193283, 1, 1, 1, 1, 1,
0.01382766, 0.1841287, 0.2801503, 1, 1, 1, 1, 1,
0.01398615, -1.499333, 4.842735, 1, 1, 1, 1, 1,
0.01501578, 0.428908, -0.03819977, 1, 1, 1, 1, 1,
0.01610056, 0.1628253, -0.1271484, 0, 0, 1, 1, 1,
0.0208759, -1.549364, 4.056196, 1, 0, 0, 1, 1,
0.02329019, -1.063961, 2.886256, 1, 0, 0, 1, 1,
0.02500715, 0.3412605, 0.4961517, 1, 0, 0, 1, 1,
0.02753506, 0.5039884, -0.5451915, 1, 0, 0, 1, 1,
0.02953441, 0.05146955, 0.7057869, 1, 0, 0, 1, 1,
0.03259216, 0.8326951, 0.6287168, 0, 0, 0, 1, 1,
0.03602456, -1.029311, 2.885605, 0, 0, 0, 1, 1,
0.03720555, -0.5963543, 3.43656, 0, 0, 0, 1, 1,
0.03770695, 1.766498, -0.9144744, 0, 0, 0, 1, 1,
0.04059942, 1.090275, 0.6575936, 0, 0, 0, 1, 1,
0.04094076, 0.04223178, 0.5402048, 0, 0, 0, 1, 1,
0.04537475, -0.08205415, 3.217866, 0, 0, 0, 1, 1,
0.04641338, -0.1571848, 6.475034, 1, 1, 1, 1, 1,
0.04715324, -0.3546247, 2.954775, 1, 1, 1, 1, 1,
0.04825408, -2.619004, 4.493692, 1, 1, 1, 1, 1,
0.05486002, -1.992173, 3.081218, 1, 1, 1, 1, 1,
0.05627603, 0.430126, 2.383295, 1, 1, 1, 1, 1,
0.05714795, 0.1696765, 0.6236987, 1, 1, 1, 1, 1,
0.06445536, 1.243591, 0.4892776, 1, 1, 1, 1, 1,
0.06759091, -0.1308669, 2.143876, 1, 1, 1, 1, 1,
0.07078096, 1.154556, 1.429444, 1, 1, 1, 1, 1,
0.07219593, -1.432955, 1.120112, 1, 1, 1, 1, 1,
0.07348194, 0.8551843, -1.627877, 1, 1, 1, 1, 1,
0.07769965, 0.9278511, -0.7571863, 1, 1, 1, 1, 1,
0.08011206, 0.7818342, -0.6711383, 1, 1, 1, 1, 1,
0.08247215, 0.2130458, -0.6919356, 1, 1, 1, 1, 1,
0.08289948, 0.4148553, -2.471289, 1, 1, 1, 1, 1,
0.08624399, -1.235523, 2.183436, 0, 0, 1, 1, 1,
0.0881789, 0.2389494, 0.04267229, 1, 0, 0, 1, 1,
0.08926736, 0.1544537, 0.04779376, 1, 0, 0, 1, 1,
0.09080803, -0.9039615, 3.822992, 1, 0, 0, 1, 1,
0.0914646, -2.651251, 5.401649, 1, 0, 0, 1, 1,
0.09369635, -0.4740981, 2.479271, 1, 0, 0, 1, 1,
0.09937029, 0.9107308, -0.5628564, 0, 0, 0, 1, 1,
0.1046862, 0.2813112, 0.5708806, 0, 0, 0, 1, 1,
0.1074625, -1.549488, 1.99603, 0, 0, 0, 1, 1,
0.1091675, 0.3865062, -0.613995, 0, 0, 0, 1, 1,
0.1096396, -0.5097511, 3.174078, 0, 0, 0, 1, 1,
0.1097101, -0.822293, 2.621253, 0, 0, 0, 1, 1,
0.1097574, -1.124562, 3.880747, 0, 0, 0, 1, 1,
0.111973, -0.2864318, 1.606058, 1, 1, 1, 1, 1,
0.1122717, 0.1270899, 0.667586, 1, 1, 1, 1, 1,
0.1158763, 0.4207327, 0.5835443, 1, 1, 1, 1, 1,
0.1162613, -1.987331, 3.640275, 1, 1, 1, 1, 1,
0.1174343, -0.4386908, 3.783957, 1, 1, 1, 1, 1,
0.1188835, 0.6363176, -0.2034689, 1, 1, 1, 1, 1,
0.1225788, 1.11788, 1.210407, 1, 1, 1, 1, 1,
0.128515, -1.046858, 1.807632, 1, 1, 1, 1, 1,
0.1335854, -0.7394185, 3.828047, 1, 1, 1, 1, 1,
0.1350188, -1.39561, 2.03333, 1, 1, 1, 1, 1,
0.135395, -0.6867947, 2.535635, 1, 1, 1, 1, 1,
0.1364664, 0.4712518, 1.921152, 1, 1, 1, 1, 1,
0.1367146, 0.4930023, 0.9469188, 1, 1, 1, 1, 1,
0.1438234, -1.237337, 2.105486, 1, 1, 1, 1, 1,
0.1461432, 1.558926, -1.692123, 1, 1, 1, 1, 1,
0.1472369, 0.1301606, 0.6113892, 0, 0, 1, 1, 1,
0.1492957, -0.9741279, 5.024869, 1, 0, 0, 1, 1,
0.1536326, 0.1867943, 0.1004117, 1, 0, 0, 1, 1,
0.1537149, -0.2036507, 5.490907, 1, 0, 0, 1, 1,
0.1569887, 1.424547, -0.8544677, 1, 0, 0, 1, 1,
0.1601798, 1.227919, -0.3822421, 1, 0, 0, 1, 1,
0.1602132, 0.1574362, 1.299342, 0, 0, 0, 1, 1,
0.1660089, 1.249714, 1.710407, 0, 0, 0, 1, 1,
0.1672996, -1.570446, 3.436827, 0, 0, 0, 1, 1,
0.1684566, -0.9905133, 1.331069, 0, 0, 0, 1, 1,
0.1692552, 1.09981, 0.8478151, 0, 0, 0, 1, 1,
0.1709115, 0.3564338, 1.300749, 0, 0, 0, 1, 1,
0.1730703, 1.423922, 0.8635052, 0, 0, 0, 1, 1,
0.1741789, 0.5622569, 1.748438, 1, 1, 1, 1, 1,
0.176634, -0.400323, 3.304952, 1, 1, 1, 1, 1,
0.1793136, -0.5808552, 3.351301, 1, 1, 1, 1, 1,
0.1835475, -0.3649291, 2.713657, 1, 1, 1, 1, 1,
0.1836435, 0.1061125, -0.1207382, 1, 1, 1, 1, 1,
0.1847735, -0.08788898, 1.841232, 1, 1, 1, 1, 1,
0.1918516, 0.5332263, 0.2977815, 1, 1, 1, 1, 1,
0.1950171, -0.2961006, 2.463435, 1, 1, 1, 1, 1,
0.2012387, 1.269373, -0.5113745, 1, 1, 1, 1, 1,
0.2053, -0.6642281, 1.435912, 1, 1, 1, 1, 1,
0.2053391, 0.8540202, -0.1012187, 1, 1, 1, 1, 1,
0.2058783, -1.150779, 2.892304, 1, 1, 1, 1, 1,
0.2081133, -0.08972187, 2.272615, 1, 1, 1, 1, 1,
0.2083929, 1.83804, 0.1607414, 1, 1, 1, 1, 1,
0.2084262, 0.771829, -0.08998241, 1, 1, 1, 1, 1,
0.2093582, 1.062453, -0.3969565, 0, 0, 1, 1, 1,
0.2112591, 1.126008, 1.843296, 1, 0, 0, 1, 1,
0.2117364, -0.1607677, 0.3023647, 1, 0, 0, 1, 1,
0.2228547, 0.5751833, 0.5744354, 1, 0, 0, 1, 1,
0.2259219, 0.1260317, 1.866065, 1, 0, 0, 1, 1,
0.2331685, -0.6402432, 2.902466, 1, 0, 0, 1, 1,
0.2335359, 1.469239, -0.4698674, 0, 0, 0, 1, 1,
0.2359951, 0.09494065, 1.423985, 0, 0, 0, 1, 1,
0.238372, 0.7481352, 0.9934142, 0, 0, 0, 1, 1,
0.2403593, -0.04409062, 2.808107, 0, 0, 0, 1, 1,
0.2442923, 0.08960574, 0.5711112, 0, 0, 0, 1, 1,
0.2451216, 0.4616983, 1.804273, 0, 0, 0, 1, 1,
0.2486061, 0.4266445, 0.9753973, 0, 0, 0, 1, 1,
0.2489365, -0.6701347, 2.524735, 1, 1, 1, 1, 1,
0.2533284, 0.8495641, 0.7149366, 1, 1, 1, 1, 1,
0.2572803, 0.8502476, -2.359772, 1, 1, 1, 1, 1,
0.2641776, -1.226972, 3.528379, 1, 1, 1, 1, 1,
0.269603, -0.9449061, 2.774964, 1, 1, 1, 1, 1,
0.2711666, 0.9440742, -2.107666, 1, 1, 1, 1, 1,
0.2788288, -1.91235, 2.904566, 1, 1, 1, 1, 1,
0.2814343, 0.03292784, 2.085655, 1, 1, 1, 1, 1,
0.2889419, 0.2046962, 2.946809, 1, 1, 1, 1, 1,
0.2923481, 0.9227752, 0.213194, 1, 1, 1, 1, 1,
0.295101, -0.5105721, 2.83997, 1, 1, 1, 1, 1,
0.2952418, -0.7296383, 0.8658677, 1, 1, 1, 1, 1,
0.305691, 0.6362981, 1.61438, 1, 1, 1, 1, 1,
0.3076469, -0.371605, 2.625704, 1, 1, 1, 1, 1,
0.3089058, -0.6647681, 1.14968, 1, 1, 1, 1, 1,
0.311083, 0.6680151, 0.7022557, 0, 0, 1, 1, 1,
0.3117322, 0.5687555, 0.1871496, 1, 0, 0, 1, 1,
0.3126539, 1.18844, 1.243758, 1, 0, 0, 1, 1,
0.315168, 1.120575, 0.2006785, 1, 0, 0, 1, 1,
0.3175643, -0.1742159, 1.640484, 1, 0, 0, 1, 1,
0.3201165, -0.9681, 4.236694, 1, 0, 0, 1, 1,
0.3206893, 0.51036, 1.354241, 0, 0, 0, 1, 1,
0.3219586, -0.05463043, 1.440769, 0, 0, 0, 1, 1,
0.3300382, -0.3499417, 1.731733, 0, 0, 0, 1, 1,
0.3302895, 0.3086002, 0.3715958, 0, 0, 0, 1, 1,
0.3348608, 0.828577, -0.1448817, 0, 0, 0, 1, 1,
0.3368454, -1.508889, 3.58676, 0, 0, 0, 1, 1,
0.3372129, -0.03708897, 0.6399297, 0, 0, 0, 1, 1,
0.3372587, -1.015567, 5.872183, 1, 1, 1, 1, 1,
0.3379645, 0.3770273, -0.1609052, 1, 1, 1, 1, 1,
0.3392418, 0.3331921, -0.09926758, 1, 1, 1, 1, 1,
0.339242, -0.5963576, 2.775559, 1, 1, 1, 1, 1,
0.3404625, -1.143367, 1.719983, 1, 1, 1, 1, 1,
0.340983, -0.8107083, 2.17798, 1, 1, 1, 1, 1,
0.3431335, 1.022814, -1.572836, 1, 1, 1, 1, 1,
0.3472695, -1.301717, 4.363221, 1, 1, 1, 1, 1,
0.3487135, -0.686633, 3.249573, 1, 1, 1, 1, 1,
0.3547842, 2.259196, -1.542913, 1, 1, 1, 1, 1,
0.3550587, -0.5888155, 2.274889, 1, 1, 1, 1, 1,
0.3574307, -1.434134, 3.728345, 1, 1, 1, 1, 1,
0.3593401, -0.1684908, 2.498713, 1, 1, 1, 1, 1,
0.3604618, 1.390621, -0.04656652, 1, 1, 1, 1, 1,
0.3618366, -1.184257, 2.393003, 1, 1, 1, 1, 1,
0.3671541, 0.4932701, 2.904284, 0, 0, 1, 1, 1,
0.3693781, -1.246978, 4.961868, 1, 0, 0, 1, 1,
0.3720295, 1.417478, -0.3088631, 1, 0, 0, 1, 1,
0.3722653, 0.544517, 0.1976582, 1, 0, 0, 1, 1,
0.3724959, -0.2662249, 1.348834, 1, 0, 0, 1, 1,
0.3757826, 2.730493, 1.183246, 1, 0, 0, 1, 1,
0.3859856, 0.9444518, 0.0121564, 0, 0, 0, 1, 1,
0.392757, -0.06307704, 2.522178, 0, 0, 0, 1, 1,
0.393198, -0.4971249, 4.003281, 0, 0, 0, 1, 1,
0.3967037, 0.503769, 0.4956669, 0, 0, 0, 1, 1,
0.4009883, 1.730236, -0.405152, 0, 0, 0, 1, 1,
0.4021626, -0.7118151, 2.358756, 0, 0, 0, 1, 1,
0.4116143, 0.9641147, 1.025655, 0, 0, 0, 1, 1,
0.4124297, -0.144869, 1.197694, 1, 1, 1, 1, 1,
0.4128355, 0.04926006, -0.5238868, 1, 1, 1, 1, 1,
0.4131236, -0.4190764, 2.582253, 1, 1, 1, 1, 1,
0.4172702, -0.6357445, 2.242653, 1, 1, 1, 1, 1,
0.4217081, -0.1653863, 3.327066, 1, 1, 1, 1, 1,
0.4220676, -1.111228, 0.6590363, 1, 1, 1, 1, 1,
0.4256821, 1.805905, 1.751124, 1, 1, 1, 1, 1,
0.428333, -0.7598259, 2.085784, 1, 1, 1, 1, 1,
0.4386435, -1.097225, 4.435044, 1, 1, 1, 1, 1,
0.43902, -1.285551, 3.802011, 1, 1, 1, 1, 1,
0.4408305, 0.4915888, 1.051533, 1, 1, 1, 1, 1,
0.4475892, 1.444598, -1.089041, 1, 1, 1, 1, 1,
0.4493148, 0.1509999, 0.3742062, 1, 1, 1, 1, 1,
0.4503403, -0.58273, 1.963412, 1, 1, 1, 1, 1,
0.4537919, -1.094891, 3.416562, 1, 1, 1, 1, 1,
0.4550021, -0.3629169, 2.320845, 0, 0, 1, 1, 1,
0.4574267, -0.6782455, 1.757536, 1, 0, 0, 1, 1,
0.4576106, 0.7635419, 0.9819258, 1, 0, 0, 1, 1,
0.4600903, -0.4704427, 3.683122, 1, 0, 0, 1, 1,
0.4603703, -0.8792372, 3.234566, 1, 0, 0, 1, 1,
0.462633, -0.6470685, 2.669381, 1, 0, 0, 1, 1,
0.4639875, -2.726196, 3.480684, 0, 0, 0, 1, 1,
0.4640059, -0.1776284, 0.3150931, 0, 0, 0, 1, 1,
0.4640867, -0.5370293, 3.248117, 0, 0, 0, 1, 1,
0.4641646, -0.6503169, 1.31722, 0, 0, 0, 1, 1,
0.4647036, 0.5738478, -0.06635095, 0, 0, 0, 1, 1,
0.4754177, -0.5443459, 3.654596, 0, 0, 0, 1, 1,
0.477254, -1.030321, 2.673468, 0, 0, 0, 1, 1,
0.4778845, 0.2962617, 2.617777, 1, 1, 1, 1, 1,
0.4779033, -0.3409196, 1.371025, 1, 1, 1, 1, 1,
0.4814969, 1.042384, 1.396609, 1, 1, 1, 1, 1,
0.4827102, -0.1313554, 2.487477, 1, 1, 1, 1, 1,
0.4919767, -0.5921489, 3.015126, 1, 1, 1, 1, 1,
0.4934742, 0.4227402, 0.7473544, 1, 1, 1, 1, 1,
0.4969687, -0.9060839, 4.441829, 1, 1, 1, 1, 1,
0.4975003, -0.8221995, 1.916576, 1, 1, 1, 1, 1,
0.4977711, 0.1692907, 2.813544, 1, 1, 1, 1, 1,
0.4993395, 0.7037244, 2.90742, 1, 1, 1, 1, 1,
0.5011949, -0.0937404, 1.050842, 1, 1, 1, 1, 1,
0.5052819, -0.9536662, 3.185185, 1, 1, 1, 1, 1,
0.5063478, -1.320063, 1.736192, 1, 1, 1, 1, 1,
0.510687, 1.40686, -1.471499, 1, 1, 1, 1, 1,
0.5181057, 0.2993853, 0.4466962, 1, 1, 1, 1, 1,
0.5226555, -1.142267, 3.351047, 0, 0, 1, 1, 1,
0.5279267, -1.855664, -0.06004028, 1, 0, 0, 1, 1,
0.5380309, 0.347177, 0.5659632, 1, 0, 0, 1, 1,
0.5388166, -0.1553713, 2.467359, 1, 0, 0, 1, 1,
0.539135, -1.488972, 2.991281, 1, 0, 0, 1, 1,
0.5431432, -1.149388, 1.96776, 1, 0, 0, 1, 1,
0.5453789, 2.092704, 0.9944804, 0, 0, 0, 1, 1,
0.5497146, -0.9510737, 1.818891, 0, 0, 0, 1, 1,
0.5506272, -1.180811, 2.379914, 0, 0, 0, 1, 1,
0.5599592, 0.3904308, -0.9371514, 0, 0, 0, 1, 1,
0.5614347, -0.1499534, 0.7505229, 0, 0, 0, 1, 1,
0.5644535, -1.208937, 2.776882, 0, 0, 0, 1, 1,
0.56467, -0.5880217, 2.107624, 0, 0, 0, 1, 1,
0.5668792, 0.6910664, 1.207046, 1, 1, 1, 1, 1,
0.5681656, 1.338609, -1.016171, 1, 1, 1, 1, 1,
0.5734146, 0.804001, -0.4751765, 1, 1, 1, 1, 1,
0.5747983, -0.3243803, 1.386922, 1, 1, 1, 1, 1,
0.5813942, 0.858924, 0.2467905, 1, 1, 1, 1, 1,
0.5874695, -0.01364337, 3.455002, 1, 1, 1, 1, 1,
0.5927482, -0.8123094, 3.599198, 1, 1, 1, 1, 1,
0.5934264, -1.038625, 3.937706, 1, 1, 1, 1, 1,
0.5996848, 0.3410301, 1.962275, 1, 1, 1, 1, 1,
0.6006697, 1.51052, -0.472809, 1, 1, 1, 1, 1,
0.6008958, 2.183636, 0.4952587, 1, 1, 1, 1, 1,
0.601418, -0.5747277, 2.62343, 1, 1, 1, 1, 1,
0.601503, 1.775827, -0.6715093, 1, 1, 1, 1, 1,
0.6050471, -0.397925, 1.461522, 1, 1, 1, 1, 1,
0.6091353, -0.6673842, 1.871555, 1, 1, 1, 1, 1,
0.6125271, -0.7790135, 2.896309, 0, 0, 1, 1, 1,
0.6134722, 0.9884108, 3.213005, 1, 0, 0, 1, 1,
0.613744, -0.5665329, 4.167059, 1, 0, 0, 1, 1,
0.6154318, -0.5426271, 3.356559, 1, 0, 0, 1, 1,
0.6161068, -0.9036406, 3.674912, 1, 0, 0, 1, 1,
0.6173729, -0.4646165, 2.433233, 1, 0, 0, 1, 1,
0.6199804, -0.2895928, 2.669953, 0, 0, 0, 1, 1,
0.6234514, 2.117509, 0.1291754, 0, 0, 0, 1, 1,
0.6274123, 0.1003449, 2.183104, 0, 0, 0, 1, 1,
0.6282902, -0.09265499, 1.793939, 0, 0, 0, 1, 1,
0.6293572, -0.6130867, 2.194877, 0, 0, 0, 1, 1,
0.6326848, 0.05908369, 0.9854011, 0, 0, 0, 1, 1,
0.6343058, -1.392745, 0.8636719, 0, 0, 0, 1, 1,
0.6363785, 0.1074909, 0.4444667, 1, 1, 1, 1, 1,
0.6422838, -1.348582, 1.128122, 1, 1, 1, 1, 1,
0.6632074, 0.9791798, 0.3969388, 1, 1, 1, 1, 1,
0.6659521, -1.436154, 4.334033, 1, 1, 1, 1, 1,
0.671227, 0.4721401, 2.313652, 1, 1, 1, 1, 1,
0.6773009, -1.388911, 4.648425, 1, 1, 1, 1, 1,
0.6853961, -0.8741435, 2.397662, 1, 1, 1, 1, 1,
0.685985, 1.197617, 0.681384, 1, 1, 1, 1, 1,
0.6881276, -1.451006, 2.665439, 1, 1, 1, 1, 1,
0.6911001, 0.172097, 2.079841, 1, 1, 1, 1, 1,
0.6941625, -0.512977, 1.313871, 1, 1, 1, 1, 1,
0.7055535, -0.2097245, 1.171862, 1, 1, 1, 1, 1,
0.7094291, 0.5994444, 0.1387767, 1, 1, 1, 1, 1,
0.70964, 1.629847, -1.933622, 1, 1, 1, 1, 1,
0.7117863, -0.197676, 0.3517096, 1, 1, 1, 1, 1,
0.7152228, 0.07800141, 1.458637, 0, 0, 1, 1, 1,
0.7198758, 0.002767086, 0.1673263, 1, 0, 0, 1, 1,
0.7231419, -0.2664432, 3.483181, 1, 0, 0, 1, 1,
0.7246006, 0.04877209, 1.47337, 1, 0, 0, 1, 1,
0.7271828, -0.6842616, -0.2809332, 1, 0, 0, 1, 1,
0.7271829, 0.2066822, 0.9716008, 1, 0, 0, 1, 1,
0.7286207, -0.2511694, 0.04567673, 0, 0, 0, 1, 1,
0.7312405, 0.7427692, 0.571354, 0, 0, 0, 1, 1,
0.7402966, -0.1899267, 1.735351, 0, 0, 0, 1, 1,
0.7438211, 0.7813522, -0.9648989, 0, 0, 0, 1, 1,
0.7444159, -0.172, -1.739263, 0, 0, 0, 1, 1,
0.7527327, 0.6207713, 1.147612, 0, 0, 0, 1, 1,
0.7544656, 1.646933, -0.1735304, 0, 0, 0, 1, 1,
0.7571109, -1.611845, 2.686037, 1, 1, 1, 1, 1,
0.7599052, -1.987543, 2.566299, 1, 1, 1, 1, 1,
0.7637749, 0.8858538, 0.2581573, 1, 1, 1, 1, 1,
0.765685, -0.09647611, 2.213759, 1, 1, 1, 1, 1,
0.7663717, 0.2429467, 1.790726, 1, 1, 1, 1, 1,
0.7694751, 0.9759052, 1.141137, 1, 1, 1, 1, 1,
0.7698135, 1.025753, -0.2803479, 1, 1, 1, 1, 1,
0.7726184, 2.150728, 1.40995, 1, 1, 1, 1, 1,
0.7727396, -1.665838, 2.735064, 1, 1, 1, 1, 1,
0.776457, 0.4941548, 1.170542, 1, 1, 1, 1, 1,
0.7811041, 0.5689675, 0.0253936, 1, 1, 1, 1, 1,
0.7856749, 1.355211, 0.6126288, 1, 1, 1, 1, 1,
0.7862724, -1.785556, 0.6633373, 1, 1, 1, 1, 1,
0.789403, 0.2387192, 0.7588056, 1, 1, 1, 1, 1,
0.7939658, 0.08448877, 1.467147, 1, 1, 1, 1, 1,
0.7967687, -0.307024, 0.9632047, 0, 0, 1, 1, 1,
0.8000782, -0.292736, 0.8730466, 1, 0, 0, 1, 1,
0.81405, -0.5862103, 3.035683, 1, 0, 0, 1, 1,
0.8154255, 0.1444103, 1.046629, 1, 0, 0, 1, 1,
0.8170082, -0.6749111, 1.985028, 1, 0, 0, 1, 1,
0.8178066, 1.297203, -0.7818077, 1, 0, 0, 1, 1,
0.8269454, 0.6580251, 1.929667, 0, 0, 0, 1, 1,
0.8297611, 0.6337558, 1.034948, 0, 0, 0, 1, 1,
0.8297757, -0.198189, 1.710272, 0, 0, 0, 1, 1,
0.8355911, -0.2609683, 0.6525355, 0, 0, 0, 1, 1,
0.8361728, 0.8485984, 0.2473468, 0, 0, 0, 1, 1,
0.8388769, -1.009289, 3.277651, 0, 0, 0, 1, 1,
0.850332, 0.7123226, -0.04259443, 0, 0, 0, 1, 1,
0.8550542, 2.149257, -1.073853, 1, 1, 1, 1, 1,
0.8576268, -0.03432809, 1.89688, 1, 1, 1, 1, 1,
0.8600801, -0.2356861, 0.6696971, 1, 1, 1, 1, 1,
0.8640319, -0.6381236, 3.912309, 1, 1, 1, 1, 1,
0.8701183, 1.220766, 2.919582, 1, 1, 1, 1, 1,
0.8770398, 2.06991, -0.4346633, 1, 1, 1, 1, 1,
0.8779776, -0.064144, 0.9023933, 1, 1, 1, 1, 1,
0.8888841, 0.6588855, 1.717507, 1, 1, 1, 1, 1,
0.8939701, 0.5580121, 1.838631, 1, 1, 1, 1, 1,
0.8989961, -1.173777, 2.35629, 1, 1, 1, 1, 1,
0.8999826, 0.823646, 1.075788, 1, 1, 1, 1, 1,
0.9016327, -1.501217, 2.104416, 1, 1, 1, 1, 1,
0.9097311, 0.8633515, 3.28382, 1, 1, 1, 1, 1,
0.9161955, -0.1725574, 1.67141, 1, 1, 1, 1, 1,
0.9173498, -0.3241197, 2.499713, 1, 1, 1, 1, 1,
0.9182353, -0.3723932, 2.693089, 0, 0, 1, 1, 1,
0.9297071, 1.063369, 1.255418, 1, 0, 0, 1, 1,
0.931289, -0.9829242, 2.773194, 1, 0, 0, 1, 1,
0.9357396, -0.8278062, 4.101763, 1, 0, 0, 1, 1,
0.940529, -1.257659, 2.652966, 1, 0, 0, 1, 1,
0.9412798, 0.6515939, 2.048743, 1, 0, 0, 1, 1,
0.953084, 0.1350849, 1.526693, 0, 0, 0, 1, 1,
0.9533198, -0.3698544, 2.369483, 0, 0, 0, 1, 1,
0.9605204, 0.5677668, 0.2424222, 0, 0, 0, 1, 1,
0.9671414, 0.08350236, 0.3692203, 0, 0, 0, 1, 1,
0.9688622, -1.869789, 3.144487, 0, 0, 0, 1, 1,
0.9696656, 1.036851, 0.595668, 0, 0, 0, 1, 1,
0.972426, 1.187085, 2.439502, 0, 0, 0, 1, 1,
0.9781285, 0.6919212, 2.772003, 1, 1, 1, 1, 1,
0.9900344, -0.1659493, 0.44943, 1, 1, 1, 1, 1,
0.990124, -0.02533946, 1.889795, 1, 1, 1, 1, 1,
0.9996302, 0.2626163, 3.436255, 1, 1, 1, 1, 1,
1.003488, -0.4337355, -0.06957871, 1, 1, 1, 1, 1,
1.003726, 0.07795582, 1.104746, 1, 1, 1, 1, 1,
1.005175, -0.6892974, 0.4634133, 1, 1, 1, 1, 1,
1.007356, -0.779983, 2.039378, 1, 1, 1, 1, 1,
1.009046, -0.4281057, 1.194157, 1, 1, 1, 1, 1,
1.010458, -0.4494229, 2.266626, 1, 1, 1, 1, 1,
1.015747, 1.34786, 0.5847844, 1, 1, 1, 1, 1,
1.016372, -3.073143, 1.151731, 1, 1, 1, 1, 1,
1.020238, 1.433101, 1.480394, 1, 1, 1, 1, 1,
1.020465, 0.9390133, 0.4183747, 1, 1, 1, 1, 1,
1.02682, -0.08164492, 2.904288, 1, 1, 1, 1, 1,
1.029756, 0.3182565, 0.2796883, 0, 0, 1, 1, 1,
1.031892, 0.9008742, 0.06458798, 1, 0, 0, 1, 1,
1.039798, -0.4994258, 1.748146, 1, 0, 0, 1, 1,
1.040293, -0.717123, 1.302081, 1, 0, 0, 1, 1,
1.041407, -0.05674917, 1.14997, 1, 0, 0, 1, 1,
1.042242, 0.6078275, 0.5485301, 1, 0, 0, 1, 1,
1.043469, 1.306057, 0.8897949, 0, 0, 0, 1, 1,
1.043613, 0.5975177, 0.09934924, 0, 0, 0, 1, 1,
1.048174, 0.5539756, 1.157279, 0, 0, 0, 1, 1,
1.052735, 0.2904721, 1.297955, 0, 0, 0, 1, 1,
1.05468, -0.4298612, 1.788465, 0, 0, 0, 1, 1,
1.05842, -0.3088163, 2.471282, 0, 0, 0, 1, 1,
1.059087, 0.3264475, 2.015512, 0, 0, 0, 1, 1,
1.061595, -0.1252749, 1.077667, 1, 1, 1, 1, 1,
1.06191, -1.260027, 2.864366, 1, 1, 1, 1, 1,
1.062348, 1.182335, 0.5118226, 1, 1, 1, 1, 1,
1.074872, 0.4275145, 0.3276387, 1, 1, 1, 1, 1,
1.075314, -1.092676, 2.231926, 1, 1, 1, 1, 1,
1.078055, 1.026193, 0.5893714, 1, 1, 1, 1, 1,
1.078532, -0.4775554, 1.766428, 1, 1, 1, 1, 1,
1.080886, 1.162801, -0.5746304, 1, 1, 1, 1, 1,
1.087351, -0.6657543, 2.174685, 1, 1, 1, 1, 1,
1.095779, -0.001376844, 1.583074, 1, 1, 1, 1, 1,
1.095989, -1.193522, 2.229723, 1, 1, 1, 1, 1,
1.099332, 1.37721, -1.247042, 1, 1, 1, 1, 1,
1.101112, 0.06492002, 1.246086, 1, 1, 1, 1, 1,
1.110929, 1.053482, 0.8579023, 1, 1, 1, 1, 1,
1.114986, -1.383451, 4.140169, 1, 1, 1, 1, 1,
1.115405, 0.6787508, -0.6130938, 0, 0, 1, 1, 1,
1.117284, 0.4313829, 1.046835, 1, 0, 0, 1, 1,
1.119333, -0.9873989, 1.775608, 1, 0, 0, 1, 1,
1.125056, 1.229357, 1.639473, 1, 0, 0, 1, 1,
1.126965, 2.867948, -0.2812438, 1, 0, 0, 1, 1,
1.13025, 0.6535576, 2.419019, 1, 0, 0, 1, 1,
1.135957, 1.6484, -0.3004346, 0, 0, 0, 1, 1,
1.142476, -0.05379805, 0.7024176, 0, 0, 0, 1, 1,
1.14822, 1.170051, 1.908818, 0, 0, 0, 1, 1,
1.154059, 0.05132226, 1.724023, 0, 0, 0, 1, 1,
1.154761, -0.1396787, 0.993769, 0, 0, 0, 1, 1,
1.159493, -0.7704831, 2.640341, 0, 0, 0, 1, 1,
1.159581, -0.8286887, 3.1753, 0, 0, 0, 1, 1,
1.163528, 0.7431064, 4.780392, 1, 1, 1, 1, 1,
1.173829, 1.012841, 1.564778, 1, 1, 1, 1, 1,
1.184345, -0.02940816, 1.957862, 1, 1, 1, 1, 1,
1.184378, -1.435519, 2.520108, 1, 1, 1, 1, 1,
1.186241, -1.834755, 2.156013, 1, 1, 1, 1, 1,
1.187733, 0.6960707, 0.03007849, 1, 1, 1, 1, 1,
1.191758, -0.778843, 3.013917, 1, 1, 1, 1, 1,
1.193906, -1.757864, 2.176482, 1, 1, 1, 1, 1,
1.197528, 0.6403689, 1.468055, 1, 1, 1, 1, 1,
1.200366, 0.5384017, 2.140092, 1, 1, 1, 1, 1,
1.206763, 0.2114998, 1.568798, 1, 1, 1, 1, 1,
1.230263, -1.222718, 1.226481, 1, 1, 1, 1, 1,
1.238546, -0.9530097, 3.540069, 1, 1, 1, 1, 1,
1.242421, -0.8612818, 2.816201, 1, 1, 1, 1, 1,
1.24583, 0.2352191, 2.762165, 1, 1, 1, 1, 1,
1.24758, 0.513314, 1.042887, 0, 0, 1, 1, 1,
1.253859, -1.240933, 2.582098, 1, 0, 0, 1, 1,
1.256448, -0.04735035, 1.307603, 1, 0, 0, 1, 1,
1.256904, 0.2657374, 0.1416439, 1, 0, 0, 1, 1,
1.262445, 0.2083131, 1.649578, 1, 0, 0, 1, 1,
1.263503, 1.385505, -0.04930508, 1, 0, 0, 1, 1,
1.266957, 0.06916776, 0.6097419, 0, 0, 0, 1, 1,
1.26932, 0.05233452, 1.026821, 0, 0, 0, 1, 1,
1.274782, -0.9864051, 3.892295, 0, 0, 0, 1, 1,
1.282925, -0.1072043, 3.244035, 0, 0, 0, 1, 1,
1.288761, -0.9296471, 1.365171, 0, 0, 0, 1, 1,
1.305507, 0.2203109, -0.5682063, 0, 0, 0, 1, 1,
1.328919, -0.7841793, 0.9427274, 0, 0, 0, 1, 1,
1.329395, 2.039059, 2.44708, 1, 1, 1, 1, 1,
1.34948, -1.408054, 3.705019, 1, 1, 1, 1, 1,
1.351386, -1.506787, 4.549452, 1, 1, 1, 1, 1,
1.352763, -1.450477, 2.511392, 1, 1, 1, 1, 1,
1.363527, 0.703527, 1.597741, 1, 1, 1, 1, 1,
1.36623, -1.440136, 4.080394, 1, 1, 1, 1, 1,
1.368271, -0.3694693, 2.855218, 1, 1, 1, 1, 1,
1.379604, 1.524622, 1.329198, 1, 1, 1, 1, 1,
1.390404, -2.619672, 3.398815, 1, 1, 1, 1, 1,
1.391277, -1.624646, 2.332001, 1, 1, 1, 1, 1,
1.405103, -1.499217, 3.023249, 1, 1, 1, 1, 1,
1.406717, 1.422079, 2.326133, 1, 1, 1, 1, 1,
1.420455, 0.5719408, 0.215889, 1, 1, 1, 1, 1,
1.437673, 0.6995915, -0.354442, 1, 1, 1, 1, 1,
1.445984, 0.5275142, 1.160429, 1, 1, 1, 1, 1,
1.450536, -0.2124333, 1.543306, 0, 0, 1, 1, 1,
1.481773, 0.1734606, 2.085426, 1, 0, 0, 1, 1,
1.483162, -0.02066376, 1.698169, 1, 0, 0, 1, 1,
1.485921, -1.560929, 2.845323, 1, 0, 0, 1, 1,
1.487384, -2.042381, 5.185475, 1, 0, 0, 1, 1,
1.493499, -1.37859, 3.378207, 1, 0, 0, 1, 1,
1.502439, 0.291494, 2.879901, 0, 0, 0, 1, 1,
1.503802, -0.6888384, 2.190831, 0, 0, 0, 1, 1,
1.513688, 0.02271136, 2.337289, 0, 0, 0, 1, 1,
1.525149, 0.3758297, 1.651385, 0, 0, 0, 1, 1,
1.529432, 1.473487, 1.726899, 0, 0, 0, 1, 1,
1.529526, 2.429777, 0.1344877, 0, 0, 0, 1, 1,
1.533212, -1.213721, 2.436001, 0, 0, 0, 1, 1,
1.537503, 0.5129389, 1.454027, 1, 1, 1, 1, 1,
1.552732, -0.3394225, 0.9621373, 1, 1, 1, 1, 1,
1.558304, -0.92513, 4.115514, 1, 1, 1, 1, 1,
1.577286, 0.01852919, 3.061446, 1, 1, 1, 1, 1,
1.60999, 0.2881571, 1.477244, 1, 1, 1, 1, 1,
1.628115, -0.1374066, -0.04328613, 1, 1, 1, 1, 1,
1.63349, -0.1894574, -0.6346102, 1, 1, 1, 1, 1,
1.636601, 1.480192, -0.1317699, 1, 1, 1, 1, 1,
1.637606, 1.2195, 0.06086878, 1, 1, 1, 1, 1,
1.641851, 0.7955245, 0.3671786, 1, 1, 1, 1, 1,
1.647413, 0.8997133, 1.929922, 1, 1, 1, 1, 1,
1.647496, -0.487502, 2.124407, 1, 1, 1, 1, 1,
1.683503, 0.03758493, 2.94895, 1, 1, 1, 1, 1,
1.687183, 0.06752994, 2.560782, 1, 1, 1, 1, 1,
1.699637, 0.7744989, 0.7553477, 1, 1, 1, 1, 1,
1.733182, 2.721149, 0.06523424, 0, 0, 1, 1, 1,
1.736619, 0.8217469, 0.8531184, 1, 0, 0, 1, 1,
1.740568, 0.7127315, 1.772879, 1, 0, 0, 1, 1,
1.772613, -1.020448, 3.022205, 1, 0, 0, 1, 1,
1.774697, 0.9513093, -0.4912289, 1, 0, 0, 1, 1,
1.787917, -0.412318, -0.3725014, 1, 0, 0, 1, 1,
1.796345, 0.1767662, 1.23005, 0, 0, 0, 1, 1,
1.805995, -0.1016641, 0.9739144, 0, 0, 0, 1, 1,
1.821297, 1.294575, 1.605222, 0, 0, 0, 1, 1,
1.834931, -1.505985, 3.493233, 0, 0, 0, 1, 1,
1.839161, 1.409439, 1.114755, 0, 0, 0, 1, 1,
1.843122, -0.8674856, 1.537254, 0, 0, 0, 1, 1,
1.845817, 0.713011, 1.360749, 0, 0, 0, 1, 1,
1.861372, 1.026134, 0.6329308, 1, 1, 1, 1, 1,
1.883458, -0.4006934, 1.334599, 1, 1, 1, 1, 1,
1.889161, 0.4442014, 0.4346235, 1, 1, 1, 1, 1,
1.901409, 1.75059, 0.7123824, 1, 1, 1, 1, 1,
1.913887, 0.1206223, 0.8897598, 1, 1, 1, 1, 1,
1.9144, 0.5939337, 2.492562, 1, 1, 1, 1, 1,
1.943564, 1.100684, -0.2129042, 1, 1, 1, 1, 1,
1.946513, -0.4016687, 1.529471, 1, 1, 1, 1, 1,
1.949556, -0.7817014, 1.255228, 1, 1, 1, 1, 1,
2.010566, -0.06969862, 4.035743, 1, 1, 1, 1, 1,
2.013962, -0.5933446, 3.462139, 1, 1, 1, 1, 1,
2.014406, -0.5646555, 0.07418168, 1, 1, 1, 1, 1,
2.025348, 0.3697557, 0.2999761, 1, 1, 1, 1, 1,
2.035592, 0.7263917, 0.7491506, 1, 1, 1, 1, 1,
2.055929, 1.796105, 1.904045, 1, 1, 1, 1, 1,
2.078507, 0.3664857, 1.724801, 0, 0, 1, 1, 1,
2.079818, -1.223859, 2.154831, 1, 0, 0, 1, 1,
2.081796, -0.4732969, 1.822159, 1, 0, 0, 1, 1,
2.092188, -0.354382, 1.127817, 1, 0, 0, 1, 1,
2.117581, -1.757031, 3.439544, 1, 0, 0, 1, 1,
2.117845, -0.004841478, 0.258675, 1, 0, 0, 1, 1,
2.121923, -2.199906, 2.523909, 0, 0, 0, 1, 1,
2.12391, -2.387365, 2.059404, 0, 0, 0, 1, 1,
2.155324, 0.2791793, 2.392442, 0, 0, 0, 1, 1,
2.253464, -1.742911, 2.552067, 0, 0, 0, 1, 1,
2.276233, -1.47817, 3.49558, 0, 0, 0, 1, 1,
2.296293, 0.5710784, 1.343052, 0, 0, 0, 1, 1,
2.299879, -0.5956706, 1.220812, 0, 0, 0, 1, 1,
2.30603, 0.9292325, 1.648798, 1, 1, 1, 1, 1,
2.328896, -1.188142, 2.01371, 1, 1, 1, 1, 1,
2.334226, -0.377544, 0.5078073, 1, 1, 1, 1, 1,
2.563301, 0.4489081, 0.799405, 1, 1, 1, 1, 1,
2.616073, 1.173366, -0.09755247, 1, 1, 1, 1, 1,
2.888576, 0.3464644, 3.135838, 1, 1, 1, 1, 1,
2.928577, -1.407056, 2.367096, 1, 1, 1, 1, 1
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
var radius = 9.942728;
var distance = 34.92341;
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
mvMatrix.translate( 0.1206635, 0.1018879, -0.437032 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.92341);
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
