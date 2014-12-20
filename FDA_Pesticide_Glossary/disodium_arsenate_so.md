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
-3.317521, -2.154699, -1.093184, 1, 0, 0, 1,
-2.619916, -1.09597, -1.046565, 1, 0.007843138, 0, 1,
-2.550296, 0.181895, -1.92198, 1, 0.01176471, 0, 1,
-2.537086, 1.753318, -2.659164, 1, 0.01960784, 0, 1,
-2.460679, -2.041977, -3.299088, 1, 0.02352941, 0, 1,
-2.450059, -1.048712, -2.519051, 1, 0.03137255, 0, 1,
-2.236168, 0.2436986, -1.754515, 1, 0.03529412, 0, 1,
-2.212995, -0.03531112, -2.448546, 1, 0.04313726, 0, 1,
-2.17456, 0.2569987, -0.9680462, 1, 0.04705882, 0, 1,
-2.146472, 1.213739, 0.1929508, 1, 0.05490196, 0, 1,
-2.143793, 0.9320568, -1.967577, 1, 0.05882353, 0, 1,
-2.100148, -0.8088587, -2.101985, 1, 0.06666667, 0, 1,
-2.029398, 1.461319, -0.5714543, 1, 0.07058824, 0, 1,
-2.004287, -0.2679257, -1.828904, 1, 0.07843138, 0, 1,
-1.985697, 1.783033, -1.090092, 1, 0.08235294, 0, 1,
-1.957154, 0.3037118, -1.659845, 1, 0.09019608, 0, 1,
-1.945672, 0.1281177, -1.226977, 1, 0.09411765, 0, 1,
-1.943371, -0.002838641, -3.374331, 1, 0.1019608, 0, 1,
-1.873057, 0.3192059, -2.45179, 1, 0.1098039, 0, 1,
-1.855813, 0.3444424, -1.173878, 1, 0.1137255, 0, 1,
-1.854752, -0.2163808, -2.26281, 1, 0.1215686, 0, 1,
-1.839113, -0.4124746, -0.1462877, 1, 0.1254902, 0, 1,
-1.827403, -1.765634, -0.472051, 1, 0.1333333, 0, 1,
-1.810648, -0.7179272, -1.394501, 1, 0.1372549, 0, 1,
-1.808044, -1.875393, -2.698993, 1, 0.145098, 0, 1,
-1.806846, -0.2710348, -0.6504759, 1, 0.1490196, 0, 1,
-1.791192, -0.4778199, -1.110608, 1, 0.1568628, 0, 1,
-1.767112, -0.6758434, -1.513751, 1, 0.1607843, 0, 1,
-1.7405, 0.08598487, -1.019233, 1, 0.1686275, 0, 1,
-1.735064, -1.158018, -1.995888, 1, 0.172549, 0, 1,
-1.734901, -0.0008147387, -1.20205, 1, 0.1803922, 0, 1,
-1.734768, -1.074796, -1.857415, 1, 0.1843137, 0, 1,
-1.734232, -0.8680197, -1.155842, 1, 0.1921569, 0, 1,
-1.732635, -0.420818, -3.033031, 1, 0.1960784, 0, 1,
-1.70704, 0.6579778, -3.107167, 1, 0.2039216, 0, 1,
-1.700073, 0.4262124, -3.180896, 1, 0.2117647, 0, 1,
-1.698655, 0.8385258, -0.4469236, 1, 0.2156863, 0, 1,
-1.688654, 0.6770299, -0.9742756, 1, 0.2235294, 0, 1,
-1.68358, 0.6638889, -0.4921518, 1, 0.227451, 0, 1,
-1.678873, -0.9161508, -1.027678, 1, 0.2352941, 0, 1,
-1.650201, 0.5636094, 0.3333012, 1, 0.2392157, 0, 1,
-1.647958, 1.006692, 1.257753, 1, 0.2470588, 0, 1,
-1.646346, -0.5761984, -2.321113, 1, 0.2509804, 0, 1,
-1.64249, -0.9548798, -2.023873, 1, 0.2588235, 0, 1,
-1.638671, 0.3027206, -3.520374, 1, 0.2627451, 0, 1,
-1.638413, 0.3534361, -1.534022, 1, 0.2705882, 0, 1,
-1.627566, -0.06098611, -1.973853, 1, 0.2745098, 0, 1,
-1.626599, -1.085369, -3.39048, 1, 0.282353, 0, 1,
-1.623691, 1.102705, -2.002348, 1, 0.2862745, 0, 1,
-1.61468, -1.192073, -1.638832, 1, 0.2941177, 0, 1,
-1.612682, -0.04305344, -2.594891, 1, 0.3019608, 0, 1,
-1.590885, 0.4804015, -0.3675556, 1, 0.3058824, 0, 1,
-1.57992, 0.3314381, -1.10112, 1, 0.3137255, 0, 1,
-1.574811, 2.661915, -1.138074, 1, 0.3176471, 0, 1,
-1.553551, 0.3279845, 0.1209273, 1, 0.3254902, 0, 1,
-1.550485, 0.2687066, -0.0002558207, 1, 0.3294118, 0, 1,
-1.520892, 1.386964, 0.125421, 1, 0.3372549, 0, 1,
-1.510239, -1.422228, -2.015376, 1, 0.3411765, 0, 1,
-1.509201, -0.7769458, -2.766724, 1, 0.3490196, 0, 1,
-1.492236, 0.09527823, -0.5023286, 1, 0.3529412, 0, 1,
-1.476259, 0.8291646, -0.7862047, 1, 0.3607843, 0, 1,
-1.460421, 0.2173607, -2.191329, 1, 0.3647059, 0, 1,
-1.460214, -0.4222912, -0.4040369, 1, 0.372549, 0, 1,
-1.447094, 0.400426, -1.59951, 1, 0.3764706, 0, 1,
-1.441978, -1.920412, -2.270386, 1, 0.3843137, 0, 1,
-1.42764, -0.1040805, -0.9999089, 1, 0.3882353, 0, 1,
-1.425984, 0.1514226, -1.247205, 1, 0.3960784, 0, 1,
-1.415506, 0.987313, 1.348584, 1, 0.4039216, 0, 1,
-1.397669, 0.9212227, -0.2303283, 1, 0.4078431, 0, 1,
-1.373053, 0.1952848, -0.4999791, 1, 0.4156863, 0, 1,
-1.362445, 0.8953522, 0.0540129, 1, 0.4196078, 0, 1,
-1.358594, 0.03349654, -1.736054, 1, 0.427451, 0, 1,
-1.354605, 0.6540502, -0.9214904, 1, 0.4313726, 0, 1,
-1.352725, 0.3144616, -0.2899956, 1, 0.4392157, 0, 1,
-1.345581, 0.4749964, -1.06119, 1, 0.4431373, 0, 1,
-1.344752, 0.8393143, -0.4971547, 1, 0.4509804, 0, 1,
-1.310314, 2.632122, -1.57798, 1, 0.454902, 0, 1,
-1.308645, -1.409581, -2.109657, 1, 0.4627451, 0, 1,
-1.289548, -1.5067, -3.217027, 1, 0.4666667, 0, 1,
-1.288029, -2.82098, -0.6736651, 1, 0.4745098, 0, 1,
-1.275624, -0.6546172, -1.461084, 1, 0.4784314, 0, 1,
-1.268457, -0.1471477, -3.511644, 1, 0.4862745, 0, 1,
-1.262871, 0.1528255, -2.937641, 1, 0.4901961, 0, 1,
-1.256721, 0.4775465, 0.60875, 1, 0.4980392, 0, 1,
-1.255969, -0.5526569, -3.395455, 1, 0.5058824, 0, 1,
-1.251056, 0.421131, -1.582989, 1, 0.509804, 0, 1,
-1.250133, -0.4343969, -2.407548, 1, 0.5176471, 0, 1,
-1.249427, -0.02207213, -1.151375, 1, 0.5215687, 0, 1,
-1.242947, -0.8169242, -1.705942, 1, 0.5294118, 0, 1,
-1.232146, 0.1238412, -3.552441, 1, 0.5333334, 0, 1,
-1.230276, -0.1153824, -1.741179, 1, 0.5411765, 0, 1,
-1.228568, -0.669454, -1.861683, 1, 0.5450981, 0, 1,
-1.224962, -0.06786826, 0.6019528, 1, 0.5529412, 0, 1,
-1.217968, -0.09394034, -1.020055, 1, 0.5568628, 0, 1,
-1.203913, -2.982408, -4.010671, 1, 0.5647059, 0, 1,
-1.2033, 1.395174, 1.471115, 1, 0.5686275, 0, 1,
-1.193977, 0.2506514, 0.5655947, 1, 0.5764706, 0, 1,
-1.192831, -1.274371, -2.932776, 1, 0.5803922, 0, 1,
-1.189815, 0.1919808, -1.107247, 1, 0.5882353, 0, 1,
-1.189591, 0.1942556, -0.1958043, 1, 0.5921569, 0, 1,
-1.185416, 0.4789814, -0.299468, 1, 0.6, 0, 1,
-1.17811, -0.7740281, -1.160679, 1, 0.6078432, 0, 1,
-1.174611, 1.06349, -0.3501345, 1, 0.6117647, 0, 1,
-1.173119, 2.946782, 0.137438, 1, 0.6196079, 0, 1,
-1.170641, -0.55282, 0.1787371, 1, 0.6235294, 0, 1,
-1.167716, -0.4439771, -2.034841, 1, 0.6313726, 0, 1,
-1.159211, -0.5296853, -0.9923143, 1, 0.6352941, 0, 1,
-1.15693, -1.023538, -3.483115, 1, 0.6431373, 0, 1,
-1.154711, -0.7424245, -1.222523, 1, 0.6470588, 0, 1,
-1.146073, -0.72277, -1.823696, 1, 0.654902, 0, 1,
-1.135112, -0.1939641, -3.385542, 1, 0.6588235, 0, 1,
-1.133516, -0.9469776, -3.472393, 1, 0.6666667, 0, 1,
-1.130836, 0.7713591, -1.837312, 1, 0.6705883, 0, 1,
-1.130041, 0.3536654, -0.8399827, 1, 0.6784314, 0, 1,
-1.124843, -1.35653, -2.490426, 1, 0.682353, 0, 1,
-1.123571, -0.2637293, -1.792557, 1, 0.6901961, 0, 1,
-1.121046, 0.9627793, -1.164303, 1, 0.6941177, 0, 1,
-1.116332, -1.49351, -2.478956, 1, 0.7019608, 0, 1,
-1.097098, 0.4385448, -1.496367, 1, 0.7098039, 0, 1,
-1.087135, 0.946825, -0.3313095, 1, 0.7137255, 0, 1,
-1.085459, -1.427029, -1.912206, 1, 0.7215686, 0, 1,
-1.082481, 0.5817537, -1.183678, 1, 0.7254902, 0, 1,
-1.081555, 0.1194176, -0.7417727, 1, 0.7333333, 0, 1,
-1.069384, -0.9754725, -2.73158, 1, 0.7372549, 0, 1,
-1.058395, -0.003001723, -0.7695154, 1, 0.7450981, 0, 1,
-1.057188, -0.6576119, -1.786795, 1, 0.7490196, 0, 1,
-1.046342, -0.5870127, -2.52467, 1, 0.7568628, 0, 1,
-1.043535, 0.2096199, -0.6901748, 1, 0.7607843, 0, 1,
-1.027847, -1.323226, -3.355971, 1, 0.7686275, 0, 1,
-1.025691, -2.693446, -1.449578, 1, 0.772549, 0, 1,
-1.02279, 0.6874175, -0.2144106, 1, 0.7803922, 0, 1,
-1.014055, -1.767466, -4.08373, 1, 0.7843137, 0, 1,
-1.013533, 1.245209, -1.525207, 1, 0.7921569, 0, 1,
-1.012782, 0.8502977, -0.7094522, 1, 0.7960784, 0, 1,
-1.012677, 0.6617634, -0.1376711, 1, 0.8039216, 0, 1,
-1.011194, -1.202476, -1.719949, 1, 0.8117647, 0, 1,
-1.009205, 1.059464, -0.7544089, 1, 0.8156863, 0, 1,
-1.001474, -0.9359668, -3.583568, 1, 0.8235294, 0, 1,
-0.9943481, -0.6736135, -2.235683, 1, 0.827451, 0, 1,
-0.9842858, -0.8223088, -3.606784, 1, 0.8352941, 0, 1,
-0.9842553, -0.3178684, -2.665674, 1, 0.8392157, 0, 1,
-0.9802711, -0.2234467, -2.391571, 1, 0.8470588, 0, 1,
-0.9767902, -0.3418786, -0.21779, 1, 0.8509804, 0, 1,
-0.9544293, -0.8869936, -2.71589, 1, 0.8588235, 0, 1,
-0.9536827, 1.186833, -1.753793, 1, 0.8627451, 0, 1,
-0.9536771, -0.6990626, -3.816713, 1, 0.8705882, 0, 1,
-0.9524863, -0.9652684, -2.611314, 1, 0.8745098, 0, 1,
-0.9515712, -0.3780749, -1.557553, 1, 0.8823529, 0, 1,
-0.9455175, -1.021541, -1.751104, 1, 0.8862745, 0, 1,
-0.9441001, -1.394183, -3.058775, 1, 0.8941177, 0, 1,
-0.9277363, -0.4823082, -2.069406, 1, 0.8980392, 0, 1,
-0.9219441, -0.8300047, -1.097943, 1, 0.9058824, 0, 1,
-0.9192491, -1.972797, -1.867668, 1, 0.9137255, 0, 1,
-0.916817, -1.162761, -2.337165, 1, 0.9176471, 0, 1,
-0.9152319, -0.8734984, -1.814385, 1, 0.9254902, 0, 1,
-0.9136833, 0.6065273, 0.2068363, 1, 0.9294118, 0, 1,
-0.908125, -1.045748, -4.364483, 1, 0.9372549, 0, 1,
-0.9071143, 0.07696602, -1.238067, 1, 0.9411765, 0, 1,
-0.9064918, 0.9296907, -0.2799143, 1, 0.9490196, 0, 1,
-0.9054294, 0.8936419, -1.425541, 1, 0.9529412, 0, 1,
-0.9049727, 0.9542909, 0.3437273, 1, 0.9607843, 0, 1,
-0.9048834, -1.346913, -3.339566, 1, 0.9647059, 0, 1,
-0.897213, -2.171733, -2.079421, 1, 0.972549, 0, 1,
-0.8970497, -0.2243062, -1.89296, 1, 0.9764706, 0, 1,
-0.8933792, 0.9772829, -0.9953, 1, 0.9843137, 0, 1,
-0.889132, 0.9046238, -0.8653686, 1, 0.9882353, 0, 1,
-0.8845959, 1.098441, -0.5760153, 1, 0.9960784, 0, 1,
-0.8800071, -1.901656, -3.903294, 0.9960784, 1, 0, 1,
-0.8765292, 0.4846136, -1.505002, 0.9921569, 1, 0, 1,
-0.8745245, -1.249579, -3.880818, 0.9843137, 1, 0, 1,
-0.8701997, -0.06575888, -2.307999, 0.9803922, 1, 0, 1,
-0.8672996, 0.3656144, -0.3939596, 0.972549, 1, 0, 1,
-0.8655465, 1.47211, -2.603441, 0.9686275, 1, 0, 1,
-0.8644611, -0.4128159, -2.432453, 0.9607843, 1, 0, 1,
-0.8639923, -1.825885, -3.069094, 0.9568627, 1, 0, 1,
-0.8638719, 0.8887638, 1.312516, 0.9490196, 1, 0, 1,
-0.8540947, 0.6898103, -0.8006776, 0.945098, 1, 0, 1,
-0.8477749, 0.7204921, -2.915392, 0.9372549, 1, 0, 1,
-0.8460068, -1.356725, -0.7151819, 0.9333333, 1, 0, 1,
-0.8427204, 0.1786249, -0.02398206, 0.9254902, 1, 0, 1,
-0.8412862, -0.600046, -1.471698, 0.9215686, 1, 0, 1,
-0.8390894, -0.3936663, -1.870559, 0.9137255, 1, 0, 1,
-0.8371464, -0.09326298, -2.696323, 0.9098039, 1, 0, 1,
-0.8305047, -2.343412, -3.389587, 0.9019608, 1, 0, 1,
-0.8242884, -1.630043, -3.288977, 0.8941177, 1, 0, 1,
-0.8207438, 1.011441, -0.9047861, 0.8901961, 1, 0, 1,
-0.817863, -1.150259, -3.138959, 0.8823529, 1, 0, 1,
-0.8154193, 0.6584809, 1.425414, 0.8784314, 1, 0, 1,
-0.8134423, -2.109498, -1.166963, 0.8705882, 1, 0, 1,
-0.8116094, 0.6705815, -0.2292055, 0.8666667, 1, 0, 1,
-0.810487, -0.9099155, -3.225015, 0.8588235, 1, 0, 1,
-0.8083879, 0.8950399, -0.6035451, 0.854902, 1, 0, 1,
-0.8075521, -0.2652489, -0.7586941, 0.8470588, 1, 0, 1,
-0.8009878, 0.2923583, -0.06846716, 0.8431373, 1, 0, 1,
-0.7970297, -0.5789208, -1.746761, 0.8352941, 1, 0, 1,
-0.7945933, 1.634393, 0.2039247, 0.8313726, 1, 0, 1,
-0.791371, -0.5785646, -0.4590015, 0.8235294, 1, 0, 1,
-0.7895634, 0.6712548, -0.1114806, 0.8196079, 1, 0, 1,
-0.788527, -1.94304, -5.272776, 0.8117647, 1, 0, 1,
-0.7862744, 1.546515, 1.261077, 0.8078431, 1, 0, 1,
-0.7818494, -1.164215, -2.551929, 0.8, 1, 0, 1,
-0.7795491, -0.197476, -0.7682415, 0.7921569, 1, 0, 1,
-0.7779456, 1.136277, -0.6987023, 0.7882353, 1, 0, 1,
-0.7745883, 2.658958, 0.1870274, 0.7803922, 1, 0, 1,
-0.7717808, 1.484836, -0.9715489, 0.7764706, 1, 0, 1,
-0.7709627, 0.1841451, -1.94742, 0.7686275, 1, 0, 1,
-0.7620415, 0.4307565, -2.198846, 0.7647059, 1, 0, 1,
-0.7559845, -0.7050139, -1.617682, 0.7568628, 1, 0, 1,
-0.7544728, -1.112848, -2.438885, 0.7529412, 1, 0, 1,
-0.7538647, 1.376861, -0.04352125, 0.7450981, 1, 0, 1,
-0.7518067, 1.055486, -1.025779, 0.7411765, 1, 0, 1,
-0.7455309, 1.81467, 2.418917, 0.7333333, 1, 0, 1,
-0.7400814, 0.59213, -0.8529987, 0.7294118, 1, 0, 1,
-0.7378793, 0.009399959, -2.534158, 0.7215686, 1, 0, 1,
-0.7375638, 0.4566873, 0.5047047, 0.7176471, 1, 0, 1,
-0.7361999, 0.1669184, -1.339236, 0.7098039, 1, 0, 1,
-0.7361931, -0.2647735, -1.991376, 0.7058824, 1, 0, 1,
-0.7359882, -0.08892184, -2.198943, 0.6980392, 1, 0, 1,
-0.7324487, 0.8512278, 0.04163889, 0.6901961, 1, 0, 1,
-0.7310265, -0.1910969, -2.018036, 0.6862745, 1, 0, 1,
-0.7306557, 0.4293194, -0.09193034, 0.6784314, 1, 0, 1,
-0.7272296, 0.1680465, -0.6130748, 0.6745098, 1, 0, 1,
-0.7268214, 1.391722, -2.064306, 0.6666667, 1, 0, 1,
-0.7208625, -1.116454, -3.963911, 0.6627451, 1, 0, 1,
-0.71764, 0.7144167, -0.6280766, 0.654902, 1, 0, 1,
-0.7174416, 0.1486056, -2.067585, 0.6509804, 1, 0, 1,
-0.7156841, 0.7448672, 0.2661144, 0.6431373, 1, 0, 1,
-0.7109944, -1.349438, -1.366455, 0.6392157, 1, 0, 1,
-0.7108798, -0.5993292, -2.372382, 0.6313726, 1, 0, 1,
-0.7071412, 0.1413117, -3.613173, 0.627451, 1, 0, 1,
-0.6980276, -0.06412841, -1.844394, 0.6196079, 1, 0, 1,
-0.6912638, -1.794463, -3.812917, 0.6156863, 1, 0, 1,
-0.6892984, -0.7019576, -2.608392, 0.6078432, 1, 0, 1,
-0.6849954, -0.01915932, -2.279937, 0.6039216, 1, 0, 1,
-0.6806285, -0.03063227, -1.457012, 0.5960785, 1, 0, 1,
-0.6733247, -0.1560907, -0.02763245, 0.5882353, 1, 0, 1,
-0.666424, -1.805464, -3.115503, 0.5843138, 1, 0, 1,
-0.6593986, -1.409339, -2.800578, 0.5764706, 1, 0, 1,
-0.6539591, 0.6995404, -2.207422, 0.572549, 1, 0, 1,
-0.6471778, -0.2294168, -2.111205, 0.5647059, 1, 0, 1,
-0.646351, -1.038407, -3.152344, 0.5607843, 1, 0, 1,
-0.6402836, -1.527323, -4.026595, 0.5529412, 1, 0, 1,
-0.6286698, -0.5955477, -2.001162, 0.5490196, 1, 0, 1,
-0.6278788, 0.5580523, -1.602416, 0.5411765, 1, 0, 1,
-0.6249949, 1.311165, 1.19266, 0.5372549, 1, 0, 1,
-0.6248345, 1.797735, 0.355041, 0.5294118, 1, 0, 1,
-0.6168881, -0.676176, -1.959769, 0.5254902, 1, 0, 1,
-0.6159828, 0.2067438, 0.749774, 0.5176471, 1, 0, 1,
-0.6153108, -0.2259343, -2.829036, 0.5137255, 1, 0, 1,
-0.6128016, -1.427106, -3.521491, 0.5058824, 1, 0, 1,
-0.6115444, -1.798701, -3.862499, 0.5019608, 1, 0, 1,
-0.6074907, -1.639358, -5.332286, 0.4941176, 1, 0, 1,
-0.6022031, -1.650762, -2.135933, 0.4862745, 1, 0, 1,
-0.6010491, 0.2529911, -2.214784, 0.4823529, 1, 0, 1,
-0.5985277, -0.8507245, -2.886928, 0.4745098, 1, 0, 1,
-0.5979773, 0.7827306, -0.7102535, 0.4705882, 1, 0, 1,
-0.596782, 0.6616876, -0.4183343, 0.4627451, 1, 0, 1,
-0.5944742, 0.3087433, -0.9079083, 0.4588235, 1, 0, 1,
-0.5938462, -1.286563, -2.864772, 0.4509804, 1, 0, 1,
-0.590372, 0.1049658, -1.581425, 0.4470588, 1, 0, 1,
-0.5894039, 1.063298, -2.828357, 0.4392157, 1, 0, 1,
-0.5886078, 0.06616542, 0.178319, 0.4352941, 1, 0, 1,
-0.5835281, -0.01608698, -1.131453, 0.427451, 1, 0, 1,
-0.5759518, 1.230781, -1.676822, 0.4235294, 1, 0, 1,
-0.572363, 0.8664337, -0.3286356, 0.4156863, 1, 0, 1,
-0.5643859, 0.09082055, -1.775541, 0.4117647, 1, 0, 1,
-0.5604371, -0.7583764, -1.089237, 0.4039216, 1, 0, 1,
-0.5595126, 0.6342432, -0.4537538, 0.3960784, 1, 0, 1,
-0.5521451, -0.3291737, -2.339919, 0.3921569, 1, 0, 1,
-0.5474084, -0.5283654, -3.22305, 0.3843137, 1, 0, 1,
-0.543924, -0.6045988, -2.447435, 0.3803922, 1, 0, 1,
-0.5431023, 0.1288854, -2.238173, 0.372549, 1, 0, 1,
-0.5425462, -1.040285, -1.876197, 0.3686275, 1, 0, 1,
-0.5264071, -0.2705774, -0.6446955, 0.3607843, 1, 0, 1,
-0.5229765, 0.2414825, -1.744647, 0.3568628, 1, 0, 1,
-0.5185415, 1.423453, 1.767762, 0.3490196, 1, 0, 1,
-0.5161902, -1.489552, -3.403012, 0.345098, 1, 0, 1,
-0.5154306, -0.3467862, -2.56815, 0.3372549, 1, 0, 1,
-0.5084084, 1.553347, 0.2630962, 0.3333333, 1, 0, 1,
-0.5075725, 0.2453679, -2.406127, 0.3254902, 1, 0, 1,
-0.5064682, -1.267645, -1.664971, 0.3215686, 1, 0, 1,
-0.5060685, 0.02018349, -1.604728, 0.3137255, 1, 0, 1,
-0.5004447, -2.299276, -2.8961, 0.3098039, 1, 0, 1,
-0.4985562, 1.589948, -0.6754081, 0.3019608, 1, 0, 1,
-0.4939327, -0.3418143, -2.221969, 0.2941177, 1, 0, 1,
-0.4878223, 1.603472, 1.034452, 0.2901961, 1, 0, 1,
-0.4794722, -0.6156405, -2.669884, 0.282353, 1, 0, 1,
-0.474292, -0.2812355, -1.332674, 0.2784314, 1, 0, 1,
-0.4735477, -0.2417472, -0.7532709, 0.2705882, 1, 0, 1,
-0.4681647, -0.8530494, -2.014041, 0.2666667, 1, 0, 1,
-0.4681187, -0.3143958, -1.594406, 0.2588235, 1, 0, 1,
-0.4631225, 0.1696305, 0.7557564, 0.254902, 1, 0, 1,
-0.462541, 0.8283325, 0.3881507, 0.2470588, 1, 0, 1,
-0.4624238, 0.0275244, -1.993287, 0.2431373, 1, 0, 1,
-0.4600246, -2.252335, -1.652196, 0.2352941, 1, 0, 1,
-0.4460969, -0.8370551, -2.733208, 0.2313726, 1, 0, 1,
-0.4444958, -2.732246, -4.749971, 0.2235294, 1, 0, 1,
-0.4435928, 0.3720144, 0.04422753, 0.2196078, 1, 0, 1,
-0.4433648, 1.196347, -0.324284, 0.2117647, 1, 0, 1,
-0.4413897, -1.356969, -2.045248, 0.2078431, 1, 0, 1,
-0.4344041, -0.7498609, -2.318403, 0.2, 1, 0, 1,
-0.4328426, 0.6602104, -1.3311, 0.1921569, 1, 0, 1,
-0.4318483, -0.8224029, -3.761656, 0.1882353, 1, 0, 1,
-0.4291072, -0.5267962, -2.923052, 0.1803922, 1, 0, 1,
-0.4269585, -1.50932, -1.866096, 0.1764706, 1, 0, 1,
-0.4258105, -0.3930503, -1.024465, 0.1686275, 1, 0, 1,
-0.4252889, 0.3436809, -0.1744197, 0.1647059, 1, 0, 1,
-0.4221832, -0.1907862, -3.09351, 0.1568628, 1, 0, 1,
-0.4203219, 1.255881, -1.765516, 0.1529412, 1, 0, 1,
-0.4201905, 0.6305457, -1.265529, 0.145098, 1, 0, 1,
-0.4172293, 0.5471472, -0.2325875, 0.1411765, 1, 0, 1,
-0.4170818, 0.1159222, -1.439065, 0.1333333, 1, 0, 1,
-0.416573, 0.8259837, -0.7611045, 0.1294118, 1, 0, 1,
-0.4147164, 1.048304, -0.3434324, 0.1215686, 1, 0, 1,
-0.4081455, -0.08473585, -0.4403147, 0.1176471, 1, 0, 1,
-0.4078365, 0.7345431, 1.580677, 0.1098039, 1, 0, 1,
-0.4045676, -1.208881, -2.879321, 0.1058824, 1, 0, 1,
-0.4025132, 0.01839693, -1.997576, 0.09803922, 1, 0, 1,
-0.4022564, 0.2681878, -2.591145, 0.09019608, 1, 0, 1,
-0.4008769, 0.8698244, -1.088933, 0.08627451, 1, 0, 1,
-0.396726, -1.549767, -2.491683, 0.07843138, 1, 0, 1,
-0.3947011, 0.9215553, 0.7576575, 0.07450981, 1, 0, 1,
-0.3943303, 0.4041927, 0.1163623, 0.06666667, 1, 0, 1,
-0.3919581, 0.09948937, -0.9531565, 0.0627451, 1, 0, 1,
-0.3874375, -0.6367514, -0.6707004, 0.05490196, 1, 0, 1,
-0.3864577, -1.308812, -3.764714, 0.05098039, 1, 0, 1,
-0.3849125, -1.241587, -4.079031, 0.04313726, 1, 0, 1,
-0.378479, -1.380086, -4.331837, 0.03921569, 1, 0, 1,
-0.3754975, -0.5284086, -1.687351, 0.03137255, 1, 0, 1,
-0.3745682, -0.147445, -2.361816, 0.02745098, 1, 0, 1,
-0.3672177, 0.6622126, -2.03264, 0.01960784, 1, 0, 1,
-0.3665129, -0.3194215, -1.661028, 0.01568628, 1, 0, 1,
-0.3627528, 1.229506, -1.097944, 0.007843138, 1, 0, 1,
-0.3599377, -0.02806736, -0.8846958, 0.003921569, 1, 0, 1,
-0.3595669, -0.4273876, -1.843847, 0, 1, 0.003921569, 1,
-0.3584893, -2.347356, -5.188742, 0, 1, 0.01176471, 1,
-0.3514643, -0.1285947, -3.709693, 0, 1, 0.01568628, 1,
-0.3450409, -1.075511, -3.699749, 0, 1, 0.02352941, 1,
-0.3445863, -0.4394863, -2.830431, 0, 1, 0.02745098, 1,
-0.3380815, 0.9776488, -0.06935989, 0, 1, 0.03529412, 1,
-0.3350579, 0.2891418, -1.714375, 0, 1, 0.03921569, 1,
-0.3276648, -1.426535, -1.411243, 0, 1, 0.04705882, 1,
-0.3267464, 0.9782495, -1.451557, 0, 1, 0.05098039, 1,
-0.3261096, -0.2326108, -3.271996, 0, 1, 0.05882353, 1,
-0.3205325, -1.67222, -2.972915, 0, 1, 0.0627451, 1,
-0.3188061, -1.215715, -4.347116, 0, 1, 0.07058824, 1,
-0.3175369, 0.05854935, -0.979775, 0, 1, 0.07450981, 1,
-0.3168778, 0.08491401, -1.445086, 0, 1, 0.08235294, 1,
-0.3144695, 0.704425, -1.862398, 0, 1, 0.08627451, 1,
-0.3131118, -0.351399, -2.298022, 0, 1, 0.09411765, 1,
-0.3107932, 0.7030007, 0.5674242, 0, 1, 0.1019608, 1,
-0.3089245, 1.735652, -0.5688136, 0, 1, 0.1058824, 1,
-0.3054185, -0.9616092, -2.592295, 0, 1, 0.1137255, 1,
-0.3037919, 0.1399687, 0.05343594, 0, 1, 0.1176471, 1,
-0.3023079, -1.132133, -3.179533, 0, 1, 0.1254902, 1,
-0.3010011, 0.2036103, -3.083834, 0, 1, 0.1294118, 1,
-0.2991869, -0.9742596, -2.639177, 0, 1, 0.1372549, 1,
-0.2989701, 0.3225385, 0.05458616, 0, 1, 0.1411765, 1,
-0.2971657, 1.755188, -0.1815506, 0, 1, 0.1490196, 1,
-0.2958777, 0.1739824, -0.04951581, 0, 1, 0.1529412, 1,
-0.2939974, -0.7854686, -4.184871, 0, 1, 0.1607843, 1,
-0.2918276, 0.8784429, 0.8540644, 0, 1, 0.1647059, 1,
-0.2900109, 0.3991715, 1.51962, 0, 1, 0.172549, 1,
-0.283848, 1.490328, 0.5118083, 0, 1, 0.1764706, 1,
-0.2830662, -0.7406994, -1.941075, 0, 1, 0.1843137, 1,
-0.2823288, -0.1808694, -2.760731, 0, 1, 0.1882353, 1,
-0.2789596, 0.6393781, -0.153445, 0, 1, 0.1960784, 1,
-0.277507, 2.113419, 0.2482785, 0, 1, 0.2039216, 1,
-0.27727, -0.4753675, -1.732662, 0, 1, 0.2078431, 1,
-0.2696705, 1.593503, -0.2431536, 0, 1, 0.2156863, 1,
-0.2645744, -0.7679048, -2.545199, 0, 1, 0.2196078, 1,
-0.2638379, -1.35079, -2.35065, 0, 1, 0.227451, 1,
-0.2629731, -0.5905519, -3.376229, 0, 1, 0.2313726, 1,
-0.2586371, -2.181982, -2.037109, 0, 1, 0.2392157, 1,
-0.2573867, -0.9754502, -2.755643, 0, 1, 0.2431373, 1,
-0.2478909, -1.174211, -3.166314, 0, 1, 0.2509804, 1,
-0.2465857, 0.2507397, -0.9210646, 0, 1, 0.254902, 1,
-0.2434492, 1.417396, 0.6863748, 0, 1, 0.2627451, 1,
-0.2424791, -0.6937394, -2.382385, 0, 1, 0.2666667, 1,
-0.2405958, -0.147735, -2.624944, 0, 1, 0.2745098, 1,
-0.2400116, -1.104653, -3.062418, 0, 1, 0.2784314, 1,
-0.237942, 2.191236, 0.5026594, 0, 1, 0.2862745, 1,
-0.2341397, -1.323625, -2.495175, 0, 1, 0.2901961, 1,
-0.2322925, 1.059644, -0.7608112, 0, 1, 0.2980392, 1,
-0.2309054, -0.2920406, -1.659587, 0, 1, 0.3058824, 1,
-0.2306851, -1.291423, -3.323641, 0, 1, 0.3098039, 1,
-0.2282405, 0.3216259, -0.938756, 0, 1, 0.3176471, 1,
-0.2257077, 0.2737215, 0.173148, 0, 1, 0.3215686, 1,
-0.2249513, 0.1168812, -0.3857066, 0, 1, 0.3294118, 1,
-0.2222446, 1.45293, -0.9168726, 0, 1, 0.3333333, 1,
-0.2202858, 0.4665869, 0.4023911, 0, 1, 0.3411765, 1,
-0.2199997, -1.261878, -1.31965, 0, 1, 0.345098, 1,
-0.2182517, 0.5649641, 1.055294, 0, 1, 0.3529412, 1,
-0.2172849, 2.013486, -0.5484239, 0, 1, 0.3568628, 1,
-0.2153719, 0.5091469, -0.1705876, 0, 1, 0.3647059, 1,
-0.2127714, 0.7101235, -0.7438697, 0, 1, 0.3686275, 1,
-0.2117852, -0.2852216, -1.766991, 0, 1, 0.3764706, 1,
-0.208875, -0.1977975, -0.9701654, 0, 1, 0.3803922, 1,
-0.2068592, 0.3802534, -1.472116, 0, 1, 0.3882353, 1,
-0.2067031, 1.327393, 0.7427211, 0, 1, 0.3921569, 1,
-0.2052422, 0.3891541, -1.462953, 0, 1, 0.4, 1,
-0.2008206, 0.4156812, -0.5846463, 0, 1, 0.4078431, 1,
-0.1935836, 0.5413979, -0.5290343, 0, 1, 0.4117647, 1,
-0.1932395, -0.1629187, -1.298516, 0, 1, 0.4196078, 1,
-0.1915864, -0.5059157, -3.931239, 0, 1, 0.4235294, 1,
-0.1915635, -0.2808699, -2.100755, 0, 1, 0.4313726, 1,
-0.1900129, 1.182728, 0.8616386, 0, 1, 0.4352941, 1,
-0.1821129, 0.4587202, 0.2000757, 0, 1, 0.4431373, 1,
-0.178496, -0.789848, -2.835315, 0, 1, 0.4470588, 1,
-0.17788, 0.3724649, -0.2147805, 0, 1, 0.454902, 1,
-0.1757463, 0.37777, -0.5663967, 0, 1, 0.4588235, 1,
-0.1745881, -0.08764502, -2.010099, 0, 1, 0.4666667, 1,
-0.1706396, 0.4168296, -0.7593727, 0, 1, 0.4705882, 1,
-0.164418, -1.026237, -5.211597, 0, 1, 0.4784314, 1,
-0.1639731, 1.153475, 0.7228041, 0, 1, 0.4823529, 1,
-0.1613069, 0.2970013, -1.78504, 0, 1, 0.4901961, 1,
-0.159557, 1.916191, 0.5045236, 0, 1, 0.4941176, 1,
-0.1571201, -0.01229062, -1.281386, 0, 1, 0.5019608, 1,
-0.1539803, 1.879251, -0.7197075, 0, 1, 0.509804, 1,
-0.1533205, 0.4827446, -2.533374, 0, 1, 0.5137255, 1,
-0.1517302, -2.268373, -2.832118, 0, 1, 0.5215687, 1,
-0.151073, -0.1527799, -2.369597, 0, 1, 0.5254902, 1,
-0.1504985, -0.4131597, -3.89315, 0, 1, 0.5333334, 1,
-0.150117, 0.9061162, -0.555423, 0, 1, 0.5372549, 1,
-0.1492633, 0.2812085, 0.4585887, 0, 1, 0.5450981, 1,
-0.148085, -1.503725, -5.185591, 0, 1, 0.5490196, 1,
-0.1420197, -1.19924, -1.793577, 0, 1, 0.5568628, 1,
-0.1392915, 1.256996, -0.7575374, 0, 1, 0.5607843, 1,
-0.1365226, 1.13806, 0.09811577, 0, 1, 0.5686275, 1,
-0.1360768, 0.4716202, 1.217259, 0, 1, 0.572549, 1,
-0.1330897, -1.977348, -3.94983, 0, 1, 0.5803922, 1,
-0.1310502, 0.4787823, -0.7871915, 0, 1, 0.5843138, 1,
-0.1309365, -0.1364327, -4.773897, 0, 1, 0.5921569, 1,
-0.1227505, -0.5333292, -2.044072, 0, 1, 0.5960785, 1,
-0.1211587, 0.648317, -0.8908172, 0, 1, 0.6039216, 1,
-0.1207377, -0.2104763, -4.121273, 0, 1, 0.6117647, 1,
-0.1204806, 1.663089, -1.041822, 0, 1, 0.6156863, 1,
-0.1141562, 0.2101986, -1.445593, 0, 1, 0.6235294, 1,
-0.1136058, 0.6072181, 0.9889816, 0, 1, 0.627451, 1,
-0.1135675, -1.602536, -2.38057, 0, 1, 0.6352941, 1,
-0.1127943, 0.7618932, 1.570635, 0, 1, 0.6392157, 1,
-0.1034184, -0.06178952, -2.787746, 0, 1, 0.6470588, 1,
-0.1026909, -1.085914, -3.930721, 0, 1, 0.6509804, 1,
-0.1021172, -1.390187, -3.087796, 0, 1, 0.6588235, 1,
-0.1003494, 1.352006, -0.6346515, 0, 1, 0.6627451, 1,
-0.09858542, -0.9399409, -3.71202, 0, 1, 0.6705883, 1,
-0.09123277, -0.8551892, -1.800217, 0, 1, 0.6745098, 1,
-0.09117518, -0.7832305, -2.725478, 0, 1, 0.682353, 1,
-0.09075751, 1.008224, -0.72172, 0, 1, 0.6862745, 1,
-0.08951881, 0.2028857, -0.9010824, 0, 1, 0.6941177, 1,
-0.08806193, -1.271718, -3.940461, 0, 1, 0.7019608, 1,
-0.08521884, 0.6476017, -1.515889, 0, 1, 0.7058824, 1,
-0.08321626, 0.6492809, -1.090752, 0, 1, 0.7137255, 1,
-0.08316933, 0.4610624, -1.301278, 0, 1, 0.7176471, 1,
-0.08139687, -1.613761, -0.3842262, 0, 1, 0.7254902, 1,
-0.07820789, 2.002441, 1.093497, 0, 1, 0.7294118, 1,
-0.07732882, 0.6977963, -1.193178, 0, 1, 0.7372549, 1,
-0.07720739, -2.374446, -3.98143, 0, 1, 0.7411765, 1,
-0.06961735, -1.305362, -2.645374, 0, 1, 0.7490196, 1,
-0.06810068, -0.8019715, -3.285783, 0, 1, 0.7529412, 1,
-0.06061613, -0.3436191, -5.184557, 0, 1, 0.7607843, 1,
-0.05759805, -0.121228, -2.693913, 0, 1, 0.7647059, 1,
-0.05554414, -0.7438556, -2.409429, 0, 1, 0.772549, 1,
-0.05283683, -0.9120184, -4.107308, 0, 1, 0.7764706, 1,
-0.05039849, -0.04406029, -2.80245, 0, 1, 0.7843137, 1,
-0.04935436, 0.1321228, -1.465791, 0, 1, 0.7882353, 1,
-0.04687279, 1.962072, 0.1414813, 0, 1, 0.7960784, 1,
-0.04107001, -0.04948192, -4.026079, 0, 1, 0.8039216, 1,
-0.03830599, 0.9645131, -1.263364, 0, 1, 0.8078431, 1,
-0.03691537, 0.705456, -0.3029686, 0, 1, 0.8156863, 1,
-0.03649232, 0.1947936, -0.2513635, 0, 1, 0.8196079, 1,
-0.03356589, 0.4286626, -1.595877, 0, 1, 0.827451, 1,
-0.03035492, -0.2917539, -3.431686, 0, 1, 0.8313726, 1,
-0.02850624, 1.105905, 1.143588, 0, 1, 0.8392157, 1,
-0.02588623, -1.577292, -2.685503, 0, 1, 0.8431373, 1,
-0.01995648, 0.6894501, 1.801296, 0, 1, 0.8509804, 1,
-0.01953323, 0.1261277, -1.082333, 0, 1, 0.854902, 1,
-0.01943745, -0.06964977, -0.6546646, 0, 1, 0.8627451, 1,
-0.01859914, 0.8964077, 0.228677, 0, 1, 0.8666667, 1,
-0.01534341, 1.177263, -0.04675681, 0, 1, 0.8745098, 1,
-0.005535051, -1.314165, -3.647147, 0, 1, 0.8784314, 1,
-0.003836109, -0.4477976, -2.321647, 0, 1, 0.8862745, 1,
-0.000619757, -0.1885302, -2.713333, 0, 1, 0.8901961, 1,
0.002331984, -0.06545471, 3.324771, 0, 1, 0.8980392, 1,
0.01488091, 0.8499749, 1.402561, 0, 1, 0.9058824, 1,
0.01594281, -1.409632, 3.125042, 0, 1, 0.9098039, 1,
0.01837779, 1.08755, 0.1365812, 0, 1, 0.9176471, 1,
0.02030203, 0.5083807, -1.054244, 0, 1, 0.9215686, 1,
0.02258035, -1.270243, 1.758488, 0, 1, 0.9294118, 1,
0.02449629, 1.134856, 0.6610768, 0, 1, 0.9333333, 1,
0.02757186, -0.6268548, 2.220829, 0, 1, 0.9411765, 1,
0.02785851, 0.7345576, 0.2217912, 0, 1, 0.945098, 1,
0.03767813, -0.1553937, 2.368415, 0, 1, 0.9529412, 1,
0.04238245, -0.7571729, 5.408118, 0, 1, 0.9568627, 1,
0.04613764, 1.428753, 0.07974026, 0, 1, 0.9647059, 1,
0.04803963, -1.007644, 3.696116, 0, 1, 0.9686275, 1,
0.05704564, -0.5077613, 3.321597, 0, 1, 0.9764706, 1,
0.05713215, -1.398539, 3.337468, 0, 1, 0.9803922, 1,
0.05744321, 0.6718645, -0.8167729, 0, 1, 0.9882353, 1,
0.05855741, 0.562561, 0.05677847, 0, 1, 0.9921569, 1,
0.06640428, 2.943552, -0.3495106, 0, 1, 1, 1,
0.06909573, -0.9579387, 2.806229, 0, 0.9921569, 1, 1,
0.06923227, -1.082222, 2.249484, 0, 0.9882353, 1, 1,
0.07042551, -0.1506032, 3.891987, 0, 0.9803922, 1, 1,
0.07241526, -0.5068447, 2.806608, 0, 0.9764706, 1, 1,
0.07703111, 1.118921, 1.226976, 0, 0.9686275, 1, 1,
0.08001938, -2.432042, 2.357132, 0, 0.9647059, 1, 1,
0.08006939, 1.420733, -0.1655035, 0, 0.9568627, 1, 1,
0.08346325, -0.251737, 2.860395, 0, 0.9529412, 1, 1,
0.08490091, 2.584558, 0.4960783, 0, 0.945098, 1, 1,
0.08730096, -0.4915755, 5.398683, 0, 0.9411765, 1, 1,
0.09316459, -2.3111, 3.438645, 0, 0.9333333, 1, 1,
0.09318227, 0.001160943, 2.310343, 0, 0.9294118, 1, 1,
0.09512594, 0.8472407, 0.6201572, 0, 0.9215686, 1, 1,
0.09628197, 0.173222, 0.7010094, 0, 0.9176471, 1, 1,
0.09730797, -0.1413943, 1.347813, 0, 0.9098039, 1, 1,
0.09767906, 0.3862588, 0.1200785, 0, 0.9058824, 1, 1,
0.09840151, 0.3534442, 0.354994, 0, 0.8980392, 1, 1,
0.1000066, -0.8561252, 0.5282028, 0, 0.8901961, 1, 1,
0.1061364, 0.9049491, 0.7697915, 0, 0.8862745, 1, 1,
0.1142033, 0.4646623, 0.6327198, 0, 0.8784314, 1, 1,
0.1156435, 0.352884, -0.5598906, 0, 0.8745098, 1, 1,
0.1168846, -0.8816629, 2.231855, 0, 0.8666667, 1, 1,
0.1182587, 0.6981955, -0.7498704, 0, 0.8627451, 1, 1,
0.121855, 1.276096, -1.783228, 0, 0.854902, 1, 1,
0.1236902, -0.7745923, 0.4670869, 0, 0.8509804, 1, 1,
0.1249644, 2.397854, 0.5317149, 0, 0.8431373, 1, 1,
0.129749, 0.3970257, 0.7380251, 0, 0.8392157, 1, 1,
0.1304142, -0.2242691, 1.82635, 0, 0.8313726, 1, 1,
0.1352677, -0.3460065, 3.050355, 0, 0.827451, 1, 1,
0.1354168, -0.8346123, 4.775417, 0, 0.8196079, 1, 1,
0.1403337, 0.2245685, 1.520915, 0, 0.8156863, 1, 1,
0.141431, -0.4830114, 4.045087, 0, 0.8078431, 1, 1,
0.1439252, 1.393213, 1.827177, 0, 0.8039216, 1, 1,
0.1451599, -0.716747, 1.889405, 0, 0.7960784, 1, 1,
0.1468245, -1.528046, 2.982064, 0, 0.7882353, 1, 1,
0.155805, 0.02303082, 0.8964549, 0, 0.7843137, 1, 1,
0.1575941, -0.3172449, 2.756085, 0, 0.7764706, 1, 1,
0.1589441, -0.9687359, 3.37289, 0, 0.772549, 1, 1,
0.1635076, 0.235895, -0.7110735, 0, 0.7647059, 1, 1,
0.1655732, 0.3782693, 1.059178, 0, 0.7607843, 1, 1,
0.1675483, -1.957618, 1.742573, 0, 0.7529412, 1, 1,
0.1696058, -1.14439, 3.820985, 0, 0.7490196, 1, 1,
0.1716453, -0.03575442, 1.23226, 0, 0.7411765, 1, 1,
0.171803, -0.847006, 3.718079, 0, 0.7372549, 1, 1,
0.1721048, -0.560684, 4.70551, 0, 0.7294118, 1, 1,
0.1741117, -0.04399191, 3.46327, 0, 0.7254902, 1, 1,
0.1771987, 1.088332, 1.711839, 0, 0.7176471, 1, 1,
0.1783892, 0.7455088, 0.4003973, 0, 0.7137255, 1, 1,
0.1805328, -0.6190297, 1.699898, 0, 0.7058824, 1, 1,
0.1821945, 0.2156397, 1.265336, 0, 0.6980392, 1, 1,
0.185002, -0.3431349, 4.90183, 0, 0.6941177, 1, 1,
0.1879162, 0.5735255, 1.366849, 0, 0.6862745, 1, 1,
0.1889424, -0.3288147, 2.633455, 0, 0.682353, 1, 1,
0.1893062, 0.06483126, 0.4534128, 0, 0.6745098, 1, 1,
0.1899439, -1.193954, 3.04325, 0, 0.6705883, 1, 1,
0.1911244, -0.659251, 2.874099, 0, 0.6627451, 1, 1,
0.1961602, -0.4165011, 3.595255, 0, 0.6588235, 1, 1,
0.1972618, -0.03435986, 0.7050348, 0, 0.6509804, 1, 1,
0.197394, -0.05214722, 5.169992, 0, 0.6470588, 1, 1,
0.1978549, 0.1495922, 0.6117574, 0, 0.6392157, 1, 1,
0.1981834, 1.288788, -0.5632992, 0, 0.6352941, 1, 1,
0.2009475, 0.758595, 0.6109048, 0, 0.627451, 1, 1,
0.2032747, -1.88286, 2.756944, 0, 0.6235294, 1, 1,
0.2067972, -1.289852, 2.852178, 0, 0.6156863, 1, 1,
0.2123751, 1.980311, 0.421062, 0, 0.6117647, 1, 1,
0.2210837, -0.6115227, 3.801629, 0, 0.6039216, 1, 1,
0.2212599, 0.995248, 1.33381, 0, 0.5960785, 1, 1,
0.2271868, 0.9265342, 1.123089, 0, 0.5921569, 1, 1,
0.231399, 0.9087343, 1.807575, 0, 0.5843138, 1, 1,
0.234854, -0.1637595, 1.970197, 0, 0.5803922, 1, 1,
0.2370999, -0.9644181, 3.618952, 0, 0.572549, 1, 1,
0.2407574, -0.7861052, 3.511942, 0, 0.5686275, 1, 1,
0.2443925, -0.5686719, 2.675123, 0, 0.5607843, 1, 1,
0.2457365, -0.343517, 1.29394, 0, 0.5568628, 1, 1,
0.2465335, 0.1089725, 2.07022, 0, 0.5490196, 1, 1,
0.2499167, 0.4390842, -0.4731136, 0, 0.5450981, 1, 1,
0.2503549, 0.2517053, 1.994536, 0, 0.5372549, 1, 1,
0.2513224, -1.090016, 3.060056, 0, 0.5333334, 1, 1,
0.2532676, 0.2949596, 0.4740204, 0, 0.5254902, 1, 1,
0.2561306, -1.308726, 2.488256, 0, 0.5215687, 1, 1,
0.2589777, -0.1650144, 2.773577, 0, 0.5137255, 1, 1,
0.2596189, 1.049855, -0.2831218, 0, 0.509804, 1, 1,
0.2598771, 0.2656398, 1.797327, 0, 0.5019608, 1, 1,
0.2622621, -0.1821472, 2.902407, 0, 0.4941176, 1, 1,
0.2661945, -1.949305, 4.334671, 0, 0.4901961, 1, 1,
0.2715383, 2.709054, 0.8890388, 0, 0.4823529, 1, 1,
0.2747563, 0.1995231, 0.4780951, 0, 0.4784314, 1, 1,
0.2844608, -1.803934, 3.444685, 0, 0.4705882, 1, 1,
0.2849445, -1.179346, 5.233965, 0, 0.4666667, 1, 1,
0.2888608, 0.3268682, 0.185011, 0, 0.4588235, 1, 1,
0.2900832, -1.856867, 3.869871, 0, 0.454902, 1, 1,
0.2946361, -0.1736454, 1.431773, 0, 0.4470588, 1, 1,
0.2952092, -0.02464277, 2.351326, 0, 0.4431373, 1, 1,
0.2974926, -0.458649, 2.464268, 0, 0.4352941, 1, 1,
0.302995, 0.5108249, 1.067054, 0, 0.4313726, 1, 1,
0.3047408, -1.642101, 3.616647, 0, 0.4235294, 1, 1,
0.3049805, 2.322729, -0.4683028, 0, 0.4196078, 1, 1,
0.3061158, 0.4350432, 0.09578959, 0, 0.4117647, 1, 1,
0.3094824, -2.900804, 4.735272, 0, 0.4078431, 1, 1,
0.3344592, -0.1543411, -0.3621445, 0, 0.4, 1, 1,
0.335993, -1.287573, 2.768996, 0, 0.3921569, 1, 1,
0.3360623, 0.7130203, 2.568646, 0, 0.3882353, 1, 1,
0.3390659, -0.2416202, 3.264429, 0, 0.3803922, 1, 1,
0.3401858, 0.1393824, 1.416055, 0, 0.3764706, 1, 1,
0.3427666, 0.3748455, 1.378481, 0, 0.3686275, 1, 1,
0.3456495, 1.06475, 2.435497, 0, 0.3647059, 1, 1,
0.3461425, 0.3628537, 1.10632, 0, 0.3568628, 1, 1,
0.3521227, 0.8053679, 0.4520339, 0, 0.3529412, 1, 1,
0.3537508, -0.6042324, 4.343759, 0, 0.345098, 1, 1,
0.3608995, -0.1173646, 1.362537, 0, 0.3411765, 1, 1,
0.3614931, -0.3965923, 1.059659, 0, 0.3333333, 1, 1,
0.3617855, -0.4297782, 2.284304, 0, 0.3294118, 1, 1,
0.3629104, -0.9630945, 2.340967, 0, 0.3215686, 1, 1,
0.3659584, -0.1164277, 1.435692, 0, 0.3176471, 1, 1,
0.367097, -0.3071779, 2.657692, 0, 0.3098039, 1, 1,
0.3709309, 0.5588167, 1.539804, 0, 0.3058824, 1, 1,
0.3777412, -0.4919686, 1.881228, 0, 0.2980392, 1, 1,
0.3779519, 0.7134877, -0.4309422, 0, 0.2901961, 1, 1,
0.3791783, -0.4045167, 1.76465, 0, 0.2862745, 1, 1,
0.3821352, 0.1553019, 0.4034156, 0, 0.2784314, 1, 1,
0.3828061, 2.529526, -1.098141, 0, 0.2745098, 1, 1,
0.383245, 0.6779978, 1.537054, 0, 0.2666667, 1, 1,
0.3845676, 0.05813737, 1.550483, 0, 0.2627451, 1, 1,
0.3860281, -1.197683, 1.223089, 0, 0.254902, 1, 1,
0.3907345, 1.233735, 0.9454096, 0, 0.2509804, 1, 1,
0.3933384, -0.2709889, 3.939344, 0, 0.2431373, 1, 1,
0.3964497, -0.6727761, 4.317655, 0, 0.2392157, 1, 1,
0.3968552, 0.3710689, 1.331508, 0, 0.2313726, 1, 1,
0.4004945, 1.591613, 0.8751571, 0, 0.227451, 1, 1,
0.4009157, -0.1737197, 2.086928, 0, 0.2196078, 1, 1,
0.4032742, -0.6347846, 2.575407, 0, 0.2156863, 1, 1,
0.4065084, -0.1349803, 0.9681044, 0, 0.2078431, 1, 1,
0.407492, -0.6885629, 0.8434033, 0, 0.2039216, 1, 1,
0.4107887, 2.365805, 0.3011844, 0, 0.1960784, 1, 1,
0.4150929, -0.7136854, 3.59071, 0, 0.1882353, 1, 1,
0.4166994, -0.8189106, 2.055533, 0, 0.1843137, 1, 1,
0.4190438, -1.690139, 1.154878, 0, 0.1764706, 1, 1,
0.4197707, -0.7649109, 2.707022, 0, 0.172549, 1, 1,
0.4211684, 0.1860541, 1.220026, 0, 0.1647059, 1, 1,
0.4266828, -1.50489, 3.017139, 0, 0.1607843, 1, 1,
0.4268319, 0.4240285, -0.2077551, 0, 0.1529412, 1, 1,
0.428219, 1.07054, 1.511021, 0, 0.1490196, 1, 1,
0.4309545, 1.812835, 1.302165, 0, 0.1411765, 1, 1,
0.4338521, 0.8196784, -0.2750689, 0, 0.1372549, 1, 1,
0.434307, -1.599884, 3.506033, 0, 0.1294118, 1, 1,
0.4349353, -1.56245, 2.547388, 0, 0.1254902, 1, 1,
0.4357771, 0.08464048, 2.149681, 0, 0.1176471, 1, 1,
0.4452643, 1.353769, 0.1390041, 0, 0.1137255, 1, 1,
0.4462076, -0.1218291, 1.543179, 0, 0.1058824, 1, 1,
0.4514277, 0.1414984, 1.820458, 0, 0.09803922, 1, 1,
0.4529397, 1.210351, -2.155145, 0, 0.09411765, 1, 1,
0.4558201, 0.02790746, 1.461979, 0, 0.08627451, 1, 1,
0.4607971, 1.052688, -0.3401943, 0, 0.08235294, 1, 1,
0.4664199, 0.9848602, 1.384909, 0, 0.07450981, 1, 1,
0.4674794, -0.1952891, 2.074094, 0, 0.07058824, 1, 1,
0.4758379, 0.0774305, 0.2873538, 0, 0.0627451, 1, 1,
0.4813339, 1.033265, -0.8258497, 0, 0.05882353, 1, 1,
0.4835398, -1.266953, 3.209924, 0, 0.05098039, 1, 1,
0.487142, -1.132463, 3.363725, 0, 0.04705882, 1, 1,
0.4885175, -0.7176504, 1.798581, 0, 0.03921569, 1, 1,
0.4899727, 0.01708604, 0.8488564, 0, 0.03529412, 1, 1,
0.4927783, 1.880576, 0.05567586, 0, 0.02745098, 1, 1,
0.4933752, 0.1622221, 0.5140716, 0, 0.02352941, 1, 1,
0.493388, 0.6359302, 0.6278521, 0, 0.01568628, 1, 1,
0.4989006, -1.870751, 2.472824, 0, 0.01176471, 1, 1,
0.506345, -2.676, 2.267399, 0, 0.003921569, 1, 1,
0.5105106, -0.6875473, 3.196129, 0.003921569, 0, 1, 1,
0.5180573, 1.0373, 0.344711, 0.007843138, 0, 1, 1,
0.5182582, 1.704583, -0.1688753, 0.01568628, 0, 1, 1,
0.5202653, 0.02545684, 1.279261, 0.01960784, 0, 1, 1,
0.5239812, 0.6898956, -0.1195118, 0.02745098, 0, 1, 1,
0.5266018, -1.409648, 1.651594, 0.03137255, 0, 1, 1,
0.52819, 2.205475, -1.040171, 0.03921569, 0, 1, 1,
0.5321481, 1.175074, 1.040649, 0.04313726, 0, 1, 1,
0.5325363, -2.07442, 3.32461, 0.05098039, 0, 1, 1,
0.5339062, 0.3109028, 0.8694415, 0.05490196, 0, 1, 1,
0.5343183, -0.509688, 2.20379, 0.0627451, 0, 1, 1,
0.5357636, 0.8288668, -1.086171, 0.06666667, 0, 1, 1,
0.5386606, -0.3216718, 3.152322, 0.07450981, 0, 1, 1,
0.538747, 1.898136, -0.8234707, 0.07843138, 0, 1, 1,
0.5393931, -0.08428051, 1.421509, 0.08627451, 0, 1, 1,
0.5410793, -1.252095, 2.257982, 0.09019608, 0, 1, 1,
0.5410886, -0.3671121, 2.61926, 0.09803922, 0, 1, 1,
0.5425307, 0.09621932, 1.914459, 0.1058824, 0, 1, 1,
0.5462709, -0.2716123, 1.271433, 0.1098039, 0, 1, 1,
0.5470768, -1.757413, 3.839007, 0.1176471, 0, 1, 1,
0.5475144, 1.015217, 1.16374, 0.1215686, 0, 1, 1,
0.5548966, 0.4765463, 0.9170483, 0.1294118, 0, 1, 1,
0.5582394, -0.5624207, 2.474626, 0.1333333, 0, 1, 1,
0.5635584, 1.317631, 0.5335867, 0.1411765, 0, 1, 1,
0.5637213, -0.9109486, 2.899882, 0.145098, 0, 1, 1,
0.5716335, -1.147316, 1.965298, 0.1529412, 0, 1, 1,
0.5725827, 1.488552, 1.539695, 0.1568628, 0, 1, 1,
0.5736329, -1.153153, 3.7528, 0.1647059, 0, 1, 1,
0.5749996, 0.1538816, 1.686068, 0.1686275, 0, 1, 1,
0.5790448, 0.8175164, 1.027673, 0.1764706, 0, 1, 1,
0.5812552, -0.3557093, 3.112087, 0.1803922, 0, 1, 1,
0.5850508, -0.1689542, 0.9316719, 0.1882353, 0, 1, 1,
0.5851839, 1.386787, 1.188758, 0.1921569, 0, 1, 1,
0.5875094, -0.6213603, 1.652469, 0.2, 0, 1, 1,
0.5876191, -0.7033986, 1.62323, 0.2078431, 0, 1, 1,
0.5918535, -0.6458396, 4.797121, 0.2117647, 0, 1, 1,
0.5953708, 1.498835, 2.36607, 0.2196078, 0, 1, 1,
0.6036958, -0.435042, 3.037421, 0.2235294, 0, 1, 1,
0.6047137, 0.9947664, 1.035496, 0.2313726, 0, 1, 1,
0.6068217, -0.3272537, 1.637064, 0.2352941, 0, 1, 1,
0.609767, -1.485586, 4.159589, 0.2431373, 0, 1, 1,
0.614751, 2.559506, 1.317093, 0.2470588, 0, 1, 1,
0.6161458, -0.7312008, 1.365116, 0.254902, 0, 1, 1,
0.616204, -0.827675, 2.760696, 0.2588235, 0, 1, 1,
0.6171694, -0.3420299, 1.58535, 0.2666667, 0, 1, 1,
0.6206784, 0.9987811, 0.7608716, 0.2705882, 0, 1, 1,
0.6208544, 0.614439, 1.937183, 0.2784314, 0, 1, 1,
0.6209032, -0.2863426, 1.100466, 0.282353, 0, 1, 1,
0.6234287, -0.001036732, 2.158084, 0.2901961, 0, 1, 1,
0.6319841, 0.2708463, 1.488077, 0.2941177, 0, 1, 1,
0.6328286, -0.1739381, 1.12752, 0.3019608, 0, 1, 1,
0.6435035, 0.2894747, 1.368656, 0.3098039, 0, 1, 1,
0.6509844, 0.891746, 1.969824, 0.3137255, 0, 1, 1,
0.6534204, 0.896803, 0.07095744, 0.3215686, 0, 1, 1,
0.6540876, -0.4910283, 2.929535, 0.3254902, 0, 1, 1,
0.6566191, -0.07692733, 2.04735, 0.3333333, 0, 1, 1,
0.6577812, 0.3841678, 0.3389035, 0.3372549, 0, 1, 1,
0.6603633, 1.400403, 0.1383268, 0.345098, 0, 1, 1,
0.6631007, 1.089038, 1.571629, 0.3490196, 0, 1, 1,
0.6696104, -1.800772, 2.322832, 0.3568628, 0, 1, 1,
0.6813, -1.603073, 2.081661, 0.3607843, 0, 1, 1,
0.6884427, 2.563021, 1.832832, 0.3686275, 0, 1, 1,
0.6898698, -0.00361525, 0.6698354, 0.372549, 0, 1, 1,
0.6899937, 1.16636, 1.7049, 0.3803922, 0, 1, 1,
0.6941844, -0.5907969, 1.890075, 0.3843137, 0, 1, 1,
0.6972033, -2.067007, 2.55131, 0.3921569, 0, 1, 1,
0.698401, -0.638272, 1.629392, 0.3960784, 0, 1, 1,
0.6995587, 0.07983169, 0.1545273, 0.4039216, 0, 1, 1,
0.7050768, 1.554494, 0.7630418, 0.4117647, 0, 1, 1,
0.7061796, 0.5709601, 0.5484074, 0.4156863, 0, 1, 1,
0.7088333, 0.2469894, 2.557715, 0.4235294, 0, 1, 1,
0.7101672, 0.04259812, 2.235437, 0.427451, 0, 1, 1,
0.7111059, 0.6548774, 0.9982242, 0.4352941, 0, 1, 1,
0.7177944, -3.092007, 3.58315, 0.4392157, 0, 1, 1,
0.7180628, -0.9476767, 1.648561, 0.4470588, 0, 1, 1,
0.7195293, 0.1461999, 1.950318, 0.4509804, 0, 1, 1,
0.7207209, -0.4955285, 3.43446, 0.4588235, 0, 1, 1,
0.7207679, 0.6839366, -1.502262, 0.4627451, 0, 1, 1,
0.7213676, -1.049254, 2.855814, 0.4705882, 0, 1, 1,
0.7237814, -0.4555205, 2.862206, 0.4745098, 0, 1, 1,
0.7247785, 0.355306, 1.717066, 0.4823529, 0, 1, 1,
0.7263255, -0.5596762, 1.147724, 0.4862745, 0, 1, 1,
0.7330453, 0.8184013, 0.7103415, 0.4941176, 0, 1, 1,
0.7455483, -1.857627, 2.781394, 0.5019608, 0, 1, 1,
0.7482694, 0.02256995, 0.09605289, 0.5058824, 0, 1, 1,
0.7555502, -1.721231, 0.7578561, 0.5137255, 0, 1, 1,
0.760436, -0.1032934, 0.6367682, 0.5176471, 0, 1, 1,
0.7660136, 0.415035, 1.615375, 0.5254902, 0, 1, 1,
0.7669277, -0.8834208, 1.88129, 0.5294118, 0, 1, 1,
0.7699947, -0.3774311, 3.570271, 0.5372549, 0, 1, 1,
0.7861935, 0.4717217, 1.701821, 0.5411765, 0, 1, 1,
0.7896866, 0.07833824, 3.458104, 0.5490196, 0, 1, 1,
0.7907041, 0.8635189, 1.122121, 0.5529412, 0, 1, 1,
0.7929654, 0.3976482, 1.553497, 0.5607843, 0, 1, 1,
0.7960792, 1.02832, 0.9233909, 0.5647059, 0, 1, 1,
0.8019922, -0.4070496, 2.080177, 0.572549, 0, 1, 1,
0.8073471, 1.785841, 1.759699, 0.5764706, 0, 1, 1,
0.8168723, 0.8886828, -1.110369, 0.5843138, 0, 1, 1,
0.8203228, 0.1748562, 0.5564172, 0.5882353, 0, 1, 1,
0.8207029, -0.7536888, 1.882999, 0.5960785, 0, 1, 1,
0.8283958, -1.246876, 3.115169, 0.6039216, 0, 1, 1,
0.8296675, 1.693686, 0.8590444, 0.6078432, 0, 1, 1,
0.8297659, 0.4653006, 0.1137239, 0.6156863, 0, 1, 1,
0.8349831, -1.099626, 3.287284, 0.6196079, 0, 1, 1,
0.8386674, 1.497461, 0.5169749, 0.627451, 0, 1, 1,
0.8405022, 0.8229349, 0.6571026, 0.6313726, 0, 1, 1,
0.8406198, 0.1082075, 2.940351, 0.6392157, 0, 1, 1,
0.8412682, 0.3008639, 2.587909, 0.6431373, 0, 1, 1,
0.8449684, 0.5420644, 2.04369, 0.6509804, 0, 1, 1,
0.85409, -0.1216916, 0.9388298, 0.654902, 0, 1, 1,
0.8558365, 0.244284, 2.738388, 0.6627451, 0, 1, 1,
0.8620381, -2.264589, 4.941505, 0.6666667, 0, 1, 1,
0.8680758, 1.56577, -0.915926, 0.6745098, 0, 1, 1,
0.8798642, -1.090767, 1.368829, 0.6784314, 0, 1, 1,
0.8825111, -0.1929769, 2.613338, 0.6862745, 0, 1, 1,
0.8889367, -1.720379, 2.589151, 0.6901961, 0, 1, 1,
0.8911803, 0.5611858, 0.5387648, 0.6980392, 0, 1, 1,
0.8930305, 0.02104096, 1.456745, 0.7058824, 0, 1, 1,
0.8940243, 0.618456, 0.6266103, 0.7098039, 0, 1, 1,
0.8948662, 0.9945863, 1.500869, 0.7176471, 0, 1, 1,
0.8994063, 0.005469821, 0.4209703, 0.7215686, 0, 1, 1,
0.9046572, 0.2974363, 3.324573, 0.7294118, 0, 1, 1,
0.9081371, 1.326527, 0.7354241, 0.7333333, 0, 1, 1,
0.9117568, 0.8620254, -1.012203, 0.7411765, 0, 1, 1,
0.9218879, 0.6043652, -1.563012, 0.7450981, 0, 1, 1,
0.9227685, -1.886182, 3.160013, 0.7529412, 0, 1, 1,
0.9264346, 0.2991982, 1.243769, 0.7568628, 0, 1, 1,
0.9266171, 0.5046349, 0.2578882, 0.7647059, 0, 1, 1,
0.9283749, -0.4441772, 1.608273, 0.7686275, 0, 1, 1,
0.9291639, 0.6987751, -0.2361241, 0.7764706, 0, 1, 1,
0.9331225, -1.851529, 1.618268, 0.7803922, 0, 1, 1,
0.9347529, -0.8219017, 2.280315, 0.7882353, 0, 1, 1,
0.9426685, -0.6857833, 0.5822606, 0.7921569, 0, 1, 1,
0.9429135, 0.2986421, 1.09676, 0.8, 0, 1, 1,
0.9437258, -2.213901, 2.01497, 0.8078431, 0, 1, 1,
0.9466962, 2.206317, -1.816239, 0.8117647, 0, 1, 1,
0.9483694, 0.5184056, 1.594383, 0.8196079, 0, 1, 1,
0.9514125, -0.8576198, 1.354921, 0.8235294, 0, 1, 1,
0.9562421, -0.4022246, 2.11005, 0.8313726, 0, 1, 1,
0.9613983, -0.03333065, 1.266335, 0.8352941, 0, 1, 1,
0.9623808, 0.6770043, 1.175944, 0.8431373, 0, 1, 1,
0.9679937, 0.02591271, 0.8011433, 0.8470588, 0, 1, 1,
0.9763272, -0.2696016, 3.790316, 0.854902, 0, 1, 1,
0.9838376, -0.1890007, 1.990254, 0.8588235, 0, 1, 1,
0.985994, 0.6420639, 0.4095179, 0.8666667, 0, 1, 1,
0.9889048, 0.8270813, 2.415462, 0.8705882, 0, 1, 1,
0.9909053, 0.6948041, 0.8363357, 0.8784314, 0, 1, 1,
0.9919373, 0.8663964, 0.782308, 0.8823529, 0, 1, 1,
0.9928308, -0.9139043, 2.831571, 0.8901961, 0, 1, 1,
0.9963238, 0.1223218, -0.3060966, 0.8941177, 0, 1, 1,
1.002073, 0.7215487, 0.5355086, 0.9019608, 0, 1, 1,
1.002241, -0.16439, 0.9110038, 0.9098039, 0, 1, 1,
1.004102, -1.672211, 1.838738, 0.9137255, 0, 1, 1,
1.012022, -0.1869814, 0.9568049, 0.9215686, 0, 1, 1,
1.012467, -0.124577, 1.98522, 0.9254902, 0, 1, 1,
1.025208, -1.160316, 0.9077131, 0.9333333, 0, 1, 1,
1.027268, -0.06621879, 1.579312, 0.9372549, 0, 1, 1,
1.028098, 1.00281, 1.910817, 0.945098, 0, 1, 1,
1.029982, 0.5901255, -0.3871444, 0.9490196, 0, 1, 1,
1.041502, 0.6680714, 1.723531, 0.9568627, 0, 1, 1,
1.045443, 1.046159, 1.052346, 0.9607843, 0, 1, 1,
1.046493, 1.386914, 1.230886, 0.9686275, 0, 1, 1,
1.04991, -0.6875328, 1.829958, 0.972549, 0, 1, 1,
1.053272, -0.5987783, 0.578679, 0.9803922, 0, 1, 1,
1.057782, 1.443024, 2.700008, 0.9843137, 0, 1, 1,
1.059121, 1.026543, -0.05237493, 0.9921569, 0, 1, 1,
1.060336, 0.9009662, 0.501625, 0.9960784, 0, 1, 1,
1.063763, -0.2563022, 3.900088, 1, 0, 0.9960784, 1,
1.069566, 0.8217696, 1.096367, 1, 0, 0.9882353, 1,
1.070264, -0.4375775, 3.231802, 1, 0, 0.9843137, 1,
1.072225, 1.136544, 0.041375, 1, 0, 0.9764706, 1,
1.074622, 0.8604496, 1.034412, 1, 0, 0.972549, 1,
1.074822, -0.6943287, 1.72844, 1, 0, 0.9647059, 1,
1.074991, -0.2677603, 2.077464, 1, 0, 0.9607843, 1,
1.080814, -1.086064, 0.7380368, 1, 0, 0.9529412, 1,
1.084121, 1.579816, 0.6690857, 1, 0, 0.9490196, 1,
1.088826, -0.4341725, 1.731895, 1, 0, 0.9411765, 1,
1.09048, -1.248442, 1.090139, 1, 0, 0.9372549, 1,
1.095064, 1.854714, -1.079926, 1, 0, 0.9294118, 1,
1.097729, -0.6309565, 4.168766, 1, 0, 0.9254902, 1,
1.102139, 1.394948, 1.414163, 1, 0, 0.9176471, 1,
1.10261, 0.8452727, 1.007654, 1, 0, 0.9137255, 1,
1.106883, -1.708013, 2.816918, 1, 0, 0.9058824, 1,
1.108178, 2.073724, -0.03092978, 1, 0, 0.9019608, 1,
1.113967, -0.900005, 2.801621, 1, 0, 0.8941177, 1,
1.117485, 0.2721265, 0.3482504, 1, 0, 0.8862745, 1,
1.125397, -0.06972471, 0.7475268, 1, 0, 0.8823529, 1,
1.128531, 0.7720454, 1.582805, 1, 0, 0.8745098, 1,
1.132086, 0.7543687, 1.071677, 1, 0, 0.8705882, 1,
1.133386, -0.16109, 1.813954, 1, 0, 0.8627451, 1,
1.139506, -1.878105, 2.616865, 1, 0, 0.8588235, 1,
1.147466, 1.759962, 0.8443348, 1, 0, 0.8509804, 1,
1.150188, 0.6388701, -0.2243539, 1, 0, 0.8470588, 1,
1.152377, -1.567758, 2.82159, 1, 0, 0.8392157, 1,
1.157905, -1.702529, 4.333801, 1, 0, 0.8352941, 1,
1.162308, 1.00544, 1.363491, 1, 0, 0.827451, 1,
1.162473, 2.160327, 1.097384, 1, 0, 0.8235294, 1,
1.167549, 1.272358, 0.08282907, 1, 0, 0.8156863, 1,
1.168497, -0.2250817, 1.884493, 1, 0, 0.8117647, 1,
1.178831, -0.2548729, 2.039126, 1, 0, 0.8039216, 1,
1.179176, 0.08676609, 1.496189, 1, 0, 0.7960784, 1,
1.181364, -0.3004286, 1.311086, 1, 0, 0.7921569, 1,
1.185922, -0.5643985, 2.551934, 1, 0, 0.7843137, 1,
1.191054, -1.512807, 2.076411, 1, 0, 0.7803922, 1,
1.191994, 0.01561733, 0.4235852, 1, 0, 0.772549, 1,
1.195944, 0.2516504, 2.250257, 1, 0, 0.7686275, 1,
1.199106, -0.007312842, 3.048115, 1, 0, 0.7607843, 1,
1.200424, -0.8854258, 2.601305, 1, 0, 0.7568628, 1,
1.201037, 0.2747728, -0.6694283, 1, 0, 0.7490196, 1,
1.20154, 0.1732424, 3.132718, 1, 0, 0.7450981, 1,
1.207244, -1.265817, 2.065568, 1, 0, 0.7372549, 1,
1.219918, -1.275464, 2.674256, 1, 0, 0.7333333, 1,
1.224187, 0.2380222, 1.969518, 1, 0, 0.7254902, 1,
1.224301, -1.218675, 1.446693, 1, 0, 0.7215686, 1,
1.225276, -0.6321453, 2.475691, 1, 0, 0.7137255, 1,
1.237586, 1.214244, 0.7902804, 1, 0, 0.7098039, 1,
1.257511, -1.23848, 2.955305, 1, 0, 0.7019608, 1,
1.257626, 0.4880835, -0.6268172, 1, 0, 0.6941177, 1,
1.259938, -0.2196493, 1.714459, 1, 0, 0.6901961, 1,
1.275271, 1.61511, 0.9674635, 1, 0, 0.682353, 1,
1.27636, -0.1622132, 0.6516616, 1, 0, 0.6784314, 1,
1.278486, -1.710694, 3.235731, 1, 0, 0.6705883, 1,
1.280464, 0.6059687, 1.176666, 1, 0, 0.6666667, 1,
1.289528, -2.434013, 2.230965, 1, 0, 0.6588235, 1,
1.291399, -0.6698417, 1.085225, 1, 0, 0.654902, 1,
1.297262, 1.65622, -0.6709336, 1, 0, 0.6470588, 1,
1.298012, 0.1668188, 1.080351, 1, 0, 0.6431373, 1,
1.298546, 0.4787044, 2.101585, 1, 0, 0.6352941, 1,
1.300678, -0.8653822, 2.743782, 1, 0, 0.6313726, 1,
1.301966, -0.02851656, 0.934293, 1, 0, 0.6235294, 1,
1.307342, -0.05859447, 0.624667, 1, 0, 0.6196079, 1,
1.308026, 0.4230582, -0.08938833, 1, 0, 0.6117647, 1,
1.326006, -0.1410455, 2.098079, 1, 0, 0.6078432, 1,
1.332091, -1.035959, 2.174444, 1, 0, 0.6, 1,
1.332988, 1.152557, -0.8589744, 1, 0, 0.5921569, 1,
1.334576, 0.00583916, 2.138369, 1, 0, 0.5882353, 1,
1.340092, 0.09160526, 1.925859, 1, 0, 0.5803922, 1,
1.349415, 1.547165, -0.2442269, 1, 0, 0.5764706, 1,
1.357678, 1.406094, 1.474807, 1, 0, 0.5686275, 1,
1.373622, 0.1978706, 1.883667, 1, 0, 0.5647059, 1,
1.382009, 0.5506904, 1.222343, 1, 0, 0.5568628, 1,
1.387056, -1.134456, 1.622065, 1, 0, 0.5529412, 1,
1.388355, -2.147824, 2.324777, 1, 0, 0.5450981, 1,
1.415949, 0.2948533, 3.708258, 1, 0, 0.5411765, 1,
1.417683, 0.721581, 1.868724, 1, 0, 0.5333334, 1,
1.422687, -1.057084, 2.403111, 1, 0, 0.5294118, 1,
1.43485, 1.310906, 0.9840853, 1, 0, 0.5215687, 1,
1.436262, -0.2644826, 2.070544, 1, 0, 0.5176471, 1,
1.439433, -0.5531054, 2.954229, 1, 0, 0.509804, 1,
1.442868, -0.06148406, 2.341417, 1, 0, 0.5058824, 1,
1.454816, 0.0884499, 1.126099, 1, 0, 0.4980392, 1,
1.460714, -0.4364627, 2.640421, 1, 0, 0.4901961, 1,
1.462894, -1.072989, 0.7283372, 1, 0, 0.4862745, 1,
1.466372, 1.437356, 2.287028, 1, 0, 0.4784314, 1,
1.467488, 0.2680056, 0.5068821, 1, 0, 0.4745098, 1,
1.472883, -0.4466821, 2.005539, 1, 0, 0.4666667, 1,
1.488819, 1.393623, 2.879125, 1, 0, 0.4627451, 1,
1.506716, 0.4193445, 0.4109802, 1, 0, 0.454902, 1,
1.509627, -0.8522843, 2.694165, 1, 0, 0.4509804, 1,
1.514456, 0.124886, 0.5625318, 1, 0, 0.4431373, 1,
1.545192, -0.7649661, 2.380161, 1, 0, 0.4392157, 1,
1.548454, -1.489278, 4.315366, 1, 0, 0.4313726, 1,
1.549244, 0.7077894, 1.486256, 1, 0, 0.427451, 1,
1.54943, -0.2413795, 1.615401, 1, 0, 0.4196078, 1,
1.55126, -2.227082, 3.700618, 1, 0, 0.4156863, 1,
1.562279, 0.8432775, 0.06995893, 1, 0, 0.4078431, 1,
1.572417, 0.2749519, -0.6024261, 1, 0, 0.4039216, 1,
1.573298, 0.1634465, 4.092501, 1, 0, 0.3960784, 1,
1.579921, 2.664735, 1.295059, 1, 0, 0.3882353, 1,
1.5957, -0.2966234, 2.055551, 1, 0, 0.3843137, 1,
1.601892, 0.1587041, 0.5097133, 1, 0, 0.3764706, 1,
1.605213, -1.692002, 1.179927, 1, 0, 0.372549, 1,
1.615673, 0.8349982, 1.926066, 1, 0, 0.3647059, 1,
1.640602, -0.5243599, 1.395238, 1, 0, 0.3607843, 1,
1.646594, 0.4449621, 1.412956, 1, 0, 0.3529412, 1,
1.65476, 0.292062, 2.131418, 1, 0, 0.3490196, 1,
1.659446, 0.3524151, 0.08828676, 1, 0, 0.3411765, 1,
1.664297, 0.3450379, 0.5550501, 1, 0, 0.3372549, 1,
1.69433, -0.7912828, 3.493929, 1, 0, 0.3294118, 1,
1.716492, 2.77587, 0.8429283, 1, 0, 0.3254902, 1,
1.724039, 0.6052565, 0.8288387, 1, 0, 0.3176471, 1,
1.725013, -0.7968932, 1.514946, 1, 0, 0.3137255, 1,
1.726131, -0.1453107, 0.07664615, 1, 0, 0.3058824, 1,
1.756075, 0.1787953, 1.14834, 1, 0, 0.2980392, 1,
1.770031, -0.01389417, 1.028701, 1, 0, 0.2941177, 1,
1.774937, -0.835609, 2.595831, 1, 0, 0.2862745, 1,
1.78557, -0.8127571, -0.5066683, 1, 0, 0.282353, 1,
1.789597, -0.03799031, 0.5155985, 1, 0, 0.2745098, 1,
1.797358, -0.4883795, 2.122433, 1, 0, 0.2705882, 1,
1.798219, -0.9264318, 2.336582, 1, 0, 0.2627451, 1,
1.81363, 0.568849, -0.5857072, 1, 0, 0.2588235, 1,
1.831028, 2.324341, 1.178135, 1, 0, 0.2509804, 1,
1.838385, 0.4378664, 1.045513, 1, 0, 0.2470588, 1,
1.841741, 0.7509806, 2.398433, 1, 0, 0.2392157, 1,
1.854223, 1.441619, 2.113724, 1, 0, 0.2352941, 1,
1.877263, 1.083022, 1.232231, 1, 0, 0.227451, 1,
1.879295, 1.356281, 1.649002, 1, 0, 0.2235294, 1,
1.88218, -0.4219188, 1.57795, 1, 0, 0.2156863, 1,
1.891978, 1.081974, 1.530668, 1, 0, 0.2117647, 1,
1.89249, -1.179849, 2.055752, 1, 0, 0.2039216, 1,
1.893639, -0.08297612, 0.9123836, 1, 0, 0.1960784, 1,
1.901708, 0.7170084, 1.892107, 1, 0, 0.1921569, 1,
1.903381, 0.6754349, 0.6168032, 1, 0, 0.1843137, 1,
1.907549, 0.9333931, 1.824876, 1, 0, 0.1803922, 1,
1.917676, -0.7166822, 3.090949, 1, 0, 0.172549, 1,
1.919, 1.768463, 1.695644, 1, 0, 0.1686275, 1,
1.926311, 0.5549887, -0.5481995, 1, 0, 0.1607843, 1,
1.926843, -0.4482921, 2.971404, 1, 0, 0.1568628, 1,
1.940876, -1.046259, 2.997302, 1, 0, 0.1490196, 1,
1.94282, -1.551683, 1.894318, 1, 0, 0.145098, 1,
1.947952, 1.141046, 2.045487, 1, 0, 0.1372549, 1,
2.01053, -0.3077893, 2.984682, 1, 0, 0.1333333, 1,
2.02781, 0.218977, 0.04412293, 1, 0, 0.1254902, 1,
2.052143, -0.0406739, 1.800946, 1, 0, 0.1215686, 1,
2.087458, 0.4591944, 0.2082166, 1, 0, 0.1137255, 1,
2.094708, 1.027898, 0.8713436, 1, 0, 0.1098039, 1,
2.106234, 0.01330641, 1.585872, 1, 0, 0.1019608, 1,
2.130568, 0.4517622, 1.403693, 1, 0, 0.09411765, 1,
2.208471, -0.7699358, 1.177035, 1, 0, 0.09019608, 1,
2.293768, 0.9736876, 1.073569, 1, 0, 0.08235294, 1,
2.321769, 1.044276, 1.750113, 1, 0, 0.07843138, 1,
2.34217, -0.1342609, 0.2931873, 1, 0, 0.07058824, 1,
2.344026, 2.360736, -0.01596861, 1, 0, 0.06666667, 1,
2.345816, -0.7782087, 2.466718, 1, 0, 0.05882353, 1,
2.405529, -0.3115175, 2.923044, 1, 0, 0.05490196, 1,
2.450897, 0.6054888, 1.858778, 1, 0, 0.04705882, 1,
2.474349, 1.293711, 2.339451, 1, 0, 0.04313726, 1,
2.5633, -0.6135949, 1.382617, 1, 0, 0.03529412, 1,
2.594635, 1.064851, 1.20975, 1, 0, 0.03137255, 1,
2.616158, -0.9922711, 1.523875, 1, 0, 0.02352941, 1,
2.639167, -0.6567232, 2.280611, 1, 0, 0.01960784, 1,
2.917572, 1.396531, 0.1213411, 1, 0, 0.01176471, 1,
2.933774, 0.4733252, -0.1966744, 1, 0, 0.007843138, 1
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
-0.1918734, -4.115582, -7.152784, 0, -0.5, 0.5, 0.5,
-0.1918734, -4.115582, -7.152784, 1, -0.5, 0.5, 0.5,
-0.1918734, -4.115582, -7.152784, 1, 1.5, 0.5, 0.5,
-0.1918734, -4.115582, -7.152784, 0, 1.5, 0.5, 0.5
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
-4.377116, -0.07261252, -7.152784, 0, -0.5, 0.5, 0.5,
-4.377116, -0.07261252, -7.152784, 1, -0.5, 0.5, 0.5,
-4.377116, -0.07261252, -7.152784, 1, 1.5, 0.5, 0.5,
-4.377116, -0.07261252, -7.152784, 0, 1.5, 0.5, 0.5
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
-4.377116, -4.115582, 0.03791595, 0, -0.5, 0.5, 0.5,
-4.377116, -4.115582, 0.03791595, 1, -0.5, 0.5, 0.5,
-4.377116, -4.115582, 0.03791595, 1, 1.5, 0.5, 0.5,
-4.377116, -4.115582, 0.03791595, 0, 1.5, 0.5, 0.5
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
-3, -3.182589, -5.493392,
2, -3.182589, -5.493392,
-3, -3.182589, -5.493392,
-3, -3.338088, -5.769958,
-2, -3.182589, -5.493392,
-2, -3.338088, -5.769958,
-1, -3.182589, -5.493392,
-1, -3.338088, -5.769958,
0, -3.182589, -5.493392,
0, -3.338088, -5.769958,
1, -3.182589, -5.493392,
1, -3.338088, -5.769958,
2, -3.182589, -5.493392,
2, -3.338088, -5.769958
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
-3, -3.649086, -6.323088, 0, -0.5, 0.5, 0.5,
-3, -3.649086, -6.323088, 1, -0.5, 0.5, 0.5,
-3, -3.649086, -6.323088, 1, 1.5, 0.5, 0.5,
-3, -3.649086, -6.323088, 0, 1.5, 0.5, 0.5,
-2, -3.649086, -6.323088, 0, -0.5, 0.5, 0.5,
-2, -3.649086, -6.323088, 1, -0.5, 0.5, 0.5,
-2, -3.649086, -6.323088, 1, 1.5, 0.5, 0.5,
-2, -3.649086, -6.323088, 0, 1.5, 0.5, 0.5,
-1, -3.649086, -6.323088, 0, -0.5, 0.5, 0.5,
-1, -3.649086, -6.323088, 1, -0.5, 0.5, 0.5,
-1, -3.649086, -6.323088, 1, 1.5, 0.5, 0.5,
-1, -3.649086, -6.323088, 0, 1.5, 0.5, 0.5,
0, -3.649086, -6.323088, 0, -0.5, 0.5, 0.5,
0, -3.649086, -6.323088, 1, -0.5, 0.5, 0.5,
0, -3.649086, -6.323088, 1, 1.5, 0.5, 0.5,
0, -3.649086, -6.323088, 0, 1.5, 0.5, 0.5,
1, -3.649086, -6.323088, 0, -0.5, 0.5, 0.5,
1, -3.649086, -6.323088, 1, -0.5, 0.5, 0.5,
1, -3.649086, -6.323088, 1, 1.5, 0.5, 0.5,
1, -3.649086, -6.323088, 0, 1.5, 0.5, 0.5,
2, -3.649086, -6.323088, 0, -0.5, 0.5, 0.5,
2, -3.649086, -6.323088, 1, -0.5, 0.5, 0.5,
2, -3.649086, -6.323088, 1, 1.5, 0.5, 0.5,
2, -3.649086, -6.323088, 0, 1.5, 0.5, 0.5
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
-3.41129, -3, -5.493392,
-3.41129, 2, -5.493392,
-3.41129, -3, -5.493392,
-3.572261, -3, -5.769958,
-3.41129, -2, -5.493392,
-3.572261, -2, -5.769958,
-3.41129, -1, -5.493392,
-3.572261, -1, -5.769958,
-3.41129, 0, -5.493392,
-3.572261, 0, -5.769958,
-3.41129, 1, -5.493392,
-3.572261, 1, -5.769958,
-3.41129, 2, -5.493392,
-3.572261, 2, -5.769958
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
-3.894203, -3, -6.323088, 0, -0.5, 0.5, 0.5,
-3.894203, -3, -6.323088, 1, -0.5, 0.5, 0.5,
-3.894203, -3, -6.323088, 1, 1.5, 0.5, 0.5,
-3.894203, -3, -6.323088, 0, 1.5, 0.5, 0.5,
-3.894203, -2, -6.323088, 0, -0.5, 0.5, 0.5,
-3.894203, -2, -6.323088, 1, -0.5, 0.5, 0.5,
-3.894203, -2, -6.323088, 1, 1.5, 0.5, 0.5,
-3.894203, -2, -6.323088, 0, 1.5, 0.5, 0.5,
-3.894203, -1, -6.323088, 0, -0.5, 0.5, 0.5,
-3.894203, -1, -6.323088, 1, -0.5, 0.5, 0.5,
-3.894203, -1, -6.323088, 1, 1.5, 0.5, 0.5,
-3.894203, -1, -6.323088, 0, 1.5, 0.5, 0.5,
-3.894203, 0, -6.323088, 0, -0.5, 0.5, 0.5,
-3.894203, 0, -6.323088, 1, -0.5, 0.5, 0.5,
-3.894203, 0, -6.323088, 1, 1.5, 0.5, 0.5,
-3.894203, 0, -6.323088, 0, 1.5, 0.5, 0.5,
-3.894203, 1, -6.323088, 0, -0.5, 0.5, 0.5,
-3.894203, 1, -6.323088, 1, -0.5, 0.5, 0.5,
-3.894203, 1, -6.323088, 1, 1.5, 0.5, 0.5,
-3.894203, 1, -6.323088, 0, 1.5, 0.5, 0.5,
-3.894203, 2, -6.323088, 0, -0.5, 0.5, 0.5,
-3.894203, 2, -6.323088, 1, -0.5, 0.5, 0.5,
-3.894203, 2, -6.323088, 1, 1.5, 0.5, 0.5,
-3.894203, 2, -6.323088, 0, 1.5, 0.5, 0.5
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
-3.41129, -3.182589, -4,
-3.41129, -3.182589, 4,
-3.41129, -3.182589, -4,
-3.572261, -3.338088, -4,
-3.41129, -3.182589, -2,
-3.572261, -3.338088, -2,
-3.41129, -3.182589, 0,
-3.572261, -3.338088, 0,
-3.41129, -3.182589, 2,
-3.572261, -3.338088, 2,
-3.41129, -3.182589, 4,
-3.572261, -3.338088, 4
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
-3.894203, -3.649086, -4, 0, -0.5, 0.5, 0.5,
-3.894203, -3.649086, -4, 1, -0.5, 0.5, 0.5,
-3.894203, -3.649086, -4, 1, 1.5, 0.5, 0.5,
-3.894203, -3.649086, -4, 0, 1.5, 0.5, 0.5,
-3.894203, -3.649086, -2, 0, -0.5, 0.5, 0.5,
-3.894203, -3.649086, -2, 1, -0.5, 0.5, 0.5,
-3.894203, -3.649086, -2, 1, 1.5, 0.5, 0.5,
-3.894203, -3.649086, -2, 0, 1.5, 0.5, 0.5,
-3.894203, -3.649086, 0, 0, -0.5, 0.5, 0.5,
-3.894203, -3.649086, 0, 1, -0.5, 0.5, 0.5,
-3.894203, -3.649086, 0, 1, 1.5, 0.5, 0.5,
-3.894203, -3.649086, 0, 0, 1.5, 0.5, 0.5,
-3.894203, -3.649086, 2, 0, -0.5, 0.5, 0.5,
-3.894203, -3.649086, 2, 1, -0.5, 0.5, 0.5,
-3.894203, -3.649086, 2, 1, 1.5, 0.5, 0.5,
-3.894203, -3.649086, 2, 0, 1.5, 0.5, 0.5,
-3.894203, -3.649086, 4, 0, -0.5, 0.5, 0.5,
-3.894203, -3.649086, 4, 1, -0.5, 0.5, 0.5,
-3.894203, -3.649086, 4, 1, 1.5, 0.5, 0.5,
-3.894203, -3.649086, 4, 0, 1.5, 0.5, 0.5
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
-3.41129, -3.182589, -5.493392,
-3.41129, 3.037364, -5.493392,
-3.41129, -3.182589, 5.569224,
-3.41129, 3.037364, 5.569224,
-3.41129, -3.182589, -5.493392,
-3.41129, -3.182589, 5.569224,
-3.41129, 3.037364, -5.493392,
-3.41129, 3.037364, 5.569224,
-3.41129, -3.182589, -5.493392,
3.027544, -3.182589, -5.493392,
-3.41129, -3.182589, 5.569224,
3.027544, -3.182589, 5.569224,
-3.41129, 3.037364, -5.493392,
3.027544, 3.037364, -5.493392,
-3.41129, 3.037364, 5.569224,
3.027544, 3.037364, 5.569224,
3.027544, -3.182589, -5.493392,
3.027544, 3.037364, -5.493392,
3.027544, -3.182589, 5.569224,
3.027544, 3.037364, 5.569224,
3.027544, -3.182589, -5.493392,
3.027544, -3.182589, 5.569224,
3.027544, 3.037364, -5.493392,
3.027544, 3.037364, 5.569224
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
var radius = 7.5992;
var distance = 33.8097;
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
mvMatrix.translate( 0.1918734, 0.07261252, -0.03791595 );
mvMatrix.scale( 1.27607, 1.320975, 0.742718 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.8097);
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
disodium_arsenate_so<-read.table("disodium_arsenate_so.xyz")
```

```
## Error in read.table("disodium_arsenate_so.xyz"): no lines available in input
```

```r
x<-disodium_arsenate_so$V2
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_so' not found
```

```r
y<-disodium_arsenate_so$V3
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_so' not found
```

```r
z<-disodium_arsenate_so$V4
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_so' not found
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
-3.317521, -2.154699, -1.093184, 0, 0, 1, 1, 1,
-2.619916, -1.09597, -1.046565, 1, 0, 0, 1, 1,
-2.550296, 0.181895, -1.92198, 1, 0, 0, 1, 1,
-2.537086, 1.753318, -2.659164, 1, 0, 0, 1, 1,
-2.460679, -2.041977, -3.299088, 1, 0, 0, 1, 1,
-2.450059, -1.048712, -2.519051, 1, 0, 0, 1, 1,
-2.236168, 0.2436986, -1.754515, 0, 0, 0, 1, 1,
-2.212995, -0.03531112, -2.448546, 0, 0, 0, 1, 1,
-2.17456, 0.2569987, -0.9680462, 0, 0, 0, 1, 1,
-2.146472, 1.213739, 0.1929508, 0, 0, 0, 1, 1,
-2.143793, 0.9320568, -1.967577, 0, 0, 0, 1, 1,
-2.100148, -0.8088587, -2.101985, 0, 0, 0, 1, 1,
-2.029398, 1.461319, -0.5714543, 0, 0, 0, 1, 1,
-2.004287, -0.2679257, -1.828904, 1, 1, 1, 1, 1,
-1.985697, 1.783033, -1.090092, 1, 1, 1, 1, 1,
-1.957154, 0.3037118, -1.659845, 1, 1, 1, 1, 1,
-1.945672, 0.1281177, -1.226977, 1, 1, 1, 1, 1,
-1.943371, -0.002838641, -3.374331, 1, 1, 1, 1, 1,
-1.873057, 0.3192059, -2.45179, 1, 1, 1, 1, 1,
-1.855813, 0.3444424, -1.173878, 1, 1, 1, 1, 1,
-1.854752, -0.2163808, -2.26281, 1, 1, 1, 1, 1,
-1.839113, -0.4124746, -0.1462877, 1, 1, 1, 1, 1,
-1.827403, -1.765634, -0.472051, 1, 1, 1, 1, 1,
-1.810648, -0.7179272, -1.394501, 1, 1, 1, 1, 1,
-1.808044, -1.875393, -2.698993, 1, 1, 1, 1, 1,
-1.806846, -0.2710348, -0.6504759, 1, 1, 1, 1, 1,
-1.791192, -0.4778199, -1.110608, 1, 1, 1, 1, 1,
-1.767112, -0.6758434, -1.513751, 1, 1, 1, 1, 1,
-1.7405, 0.08598487, -1.019233, 0, 0, 1, 1, 1,
-1.735064, -1.158018, -1.995888, 1, 0, 0, 1, 1,
-1.734901, -0.0008147387, -1.20205, 1, 0, 0, 1, 1,
-1.734768, -1.074796, -1.857415, 1, 0, 0, 1, 1,
-1.734232, -0.8680197, -1.155842, 1, 0, 0, 1, 1,
-1.732635, -0.420818, -3.033031, 1, 0, 0, 1, 1,
-1.70704, 0.6579778, -3.107167, 0, 0, 0, 1, 1,
-1.700073, 0.4262124, -3.180896, 0, 0, 0, 1, 1,
-1.698655, 0.8385258, -0.4469236, 0, 0, 0, 1, 1,
-1.688654, 0.6770299, -0.9742756, 0, 0, 0, 1, 1,
-1.68358, 0.6638889, -0.4921518, 0, 0, 0, 1, 1,
-1.678873, -0.9161508, -1.027678, 0, 0, 0, 1, 1,
-1.650201, 0.5636094, 0.3333012, 0, 0, 0, 1, 1,
-1.647958, 1.006692, 1.257753, 1, 1, 1, 1, 1,
-1.646346, -0.5761984, -2.321113, 1, 1, 1, 1, 1,
-1.64249, -0.9548798, -2.023873, 1, 1, 1, 1, 1,
-1.638671, 0.3027206, -3.520374, 1, 1, 1, 1, 1,
-1.638413, 0.3534361, -1.534022, 1, 1, 1, 1, 1,
-1.627566, -0.06098611, -1.973853, 1, 1, 1, 1, 1,
-1.626599, -1.085369, -3.39048, 1, 1, 1, 1, 1,
-1.623691, 1.102705, -2.002348, 1, 1, 1, 1, 1,
-1.61468, -1.192073, -1.638832, 1, 1, 1, 1, 1,
-1.612682, -0.04305344, -2.594891, 1, 1, 1, 1, 1,
-1.590885, 0.4804015, -0.3675556, 1, 1, 1, 1, 1,
-1.57992, 0.3314381, -1.10112, 1, 1, 1, 1, 1,
-1.574811, 2.661915, -1.138074, 1, 1, 1, 1, 1,
-1.553551, 0.3279845, 0.1209273, 1, 1, 1, 1, 1,
-1.550485, 0.2687066, -0.0002558207, 1, 1, 1, 1, 1,
-1.520892, 1.386964, 0.125421, 0, 0, 1, 1, 1,
-1.510239, -1.422228, -2.015376, 1, 0, 0, 1, 1,
-1.509201, -0.7769458, -2.766724, 1, 0, 0, 1, 1,
-1.492236, 0.09527823, -0.5023286, 1, 0, 0, 1, 1,
-1.476259, 0.8291646, -0.7862047, 1, 0, 0, 1, 1,
-1.460421, 0.2173607, -2.191329, 1, 0, 0, 1, 1,
-1.460214, -0.4222912, -0.4040369, 0, 0, 0, 1, 1,
-1.447094, 0.400426, -1.59951, 0, 0, 0, 1, 1,
-1.441978, -1.920412, -2.270386, 0, 0, 0, 1, 1,
-1.42764, -0.1040805, -0.9999089, 0, 0, 0, 1, 1,
-1.425984, 0.1514226, -1.247205, 0, 0, 0, 1, 1,
-1.415506, 0.987313, 1.348584, 0, 0, 0, 1, 1,
-1.397669, 0.9212227, -0.2303283, 0, 0, 0, 1, 1,
-1.373053, 0.1952848, -0.4999791, 1, 1, 1, 1, 1,
-1.362445, 0.8953522, 0.0540129, 1, 1, 1, 1, 1,
-1.358594, 0.03349654, -1.736054, 1, 1, 1, 1, 1,
-1.354605, 0.6540502, -0.9214904, 1, 1, 1, 1, 1,
-1.352725, 0.3144616, -0.2899956, 1, 1, 1, 1, 1,
-1.345581, 0.4749964, -1.06119, 1, 1, 1, 1, 1,
-1.344752, 0.8393143, -0.4971547, 1, 1, 1, 1, 1,
-1.310314, 2.632122, -1.57798, 1, 1, 1, 1, 1,
-1.308645, -1.409581, -2.109657, 1, 1, 1, 1, 1,
-1.289548, -1.5067, -3.217027, 1, 1, 1, 1, 1,
-1.288029, -2.82098, -0.6736651, 1, 1, 1, 1, 1,
-1.275624, -0.6546172, -1.461084, 1, 1, 1, 1, 1,
-1.268457, -0.1471477, -3.511644, 1, 1, 1, 1, 1,
-1.262871, 0.1528255, -2.937641, 1, 1, 1, 1, 1,
-1.256721, 0.4775465, 0.60875, 1, 1, 1, 1, 1,
-1.255969, -0.5526569, -3.395455, 0, 0, 1, 1, 1,
-1.251056, 0.421131, -1.582989, 1, 0, 0, 1, 1,
-1.250133, -0.4343969, -2.407548, 1, 0, 0, 1, 1,
-1.249427, -0.02207213, -1.151375, 1, 0, 0, 1, 1,
-1.242947, -0.8169242, -1.705942, 1, 0, 0, 1, 1,
-1.232146, 0.1238412, -3.552441, 1, 0, 0, 1, 1,
-1.230276, -0.1153824, -1.741179, 0, 0, 0, 1, 1,
-1.228568, -0.669454, -1.861683, 0, 0, 0, 1, 1,
-1.224962, -0.06786826, 0.6019528, 0, 0, 0, 1, 1,
-1.217968, -0.09394034, -1.020055, 0, 0, 0, 1, 1,
-1.203913, -2.982408, -4.010671, 0, 0, 0, 1, 1,
-1.2033, 1.395174, 1.471115, 0, 0, 0, 1, 1,
-1.193977, 0.2506514, 0.5655947, 0, 0, 0, 1, 1,
-1.192831, -1.274371, -2.932776, 1, 1, 1, 1, 1,
-1.189815, 0.1919808, -1.107247, 1, 1, 1, 1, 1,
-1.189591, 0.1942556, -0.1958043, 1, 1, 1, 1, 1,
-1.185416, 0.4789814, -0.299468, 1, 1, 1, 1, 1,
-1.17811, -0.7740281, -1.160679, 1, 1, 1, 1, 1,
-1.174611, 1.06349, -0.3501345, 1, 1, 1, 1, 1,
-1.173119, 2.946782, 0.137438, 1, 1, 1, 1, 1,
-1.170641, -0.55282, 0.1787371, 1, 1, 1, 1, 1,
-1.167716, -0.4439771, -2.034841, 1, 1, 1, 1, 1,
-1.159211, -0.5296853, -0.9923143, 1, 1, 1, 1, 1,
-1.15693, -1.023538, -3.483115, 1, 1, 1, 1, 1,
-1.154711, -0.7424245, -1.222523, 1, 1, 1, 1, 1,
-1.146073, -0.72277, -1.823696, 1, 1, 1, 1, 1,
-1.135112, -0.1939641, -3.385542, 1, 1, 1, 1, 1,
-1.133516, -0.9469776, -3.472393, 1, 1, 1, 1, 1,
-1.130836, 0.7713591, -1.837312, 0, 0, 1, 1, 1,
-1.130041, 0.3536654, -0.8399827, 1, 0, 0, 1, 1,
-1.124843, -1.35653, -2.490426, 1, 0, 0, 1, 1,
-1.123571, -0.2637293, -1.792557, 1, 0, 0, 1, 1,
-1.121046, 0.9627793, -1.164303, 1, 0, 0, 1, 1,
-1.116332, -1.49351, -2.478956, 1, 0, 0, 1, 1,
-1.097098, 0.4385448, -1.496367, 0, 0, 0, 1, 1,
-1.087135, 0.946825, -0.3313095, 0, 0, 0, 1, 1,
-1.085459, -1.427029, -1.912206, 0, 0, 0, 1, 1,
-1.082481, 0.5817537, -1.183678, 0, 0, 0, 1, 1,
-1.081555, 0.1194176, -0.7417727, 0, 0, 0, 1, 1,
-1.069384, -0.9754725, -2.73158, 0, 0, 0, 1, 1,
-1.058395, -0.003001723, -0.7695154, 0, 0, 0, 1, 1,
-1.057188, -0.6576119, -1.786795, 1, 1, 1, 1, 1,
-1.046342, -0.5870127, -2.52467, 1, 1, 1, 1, 1,
-1.043535, 0.2096199, -0.6901748, 1, 1, 1, 1, 1,
-1.027847, -1.323226, -3.355971, 1, 1, 1, 1, 1,
-1.025691, -2.693446, -1.449578, 1, 1, 1, 1, 1,
-1.02279, 0.6874175, -0.2144106, 1, 1, 1, 1, 1,
-1.014055, -1.767466, -4.08373, 1, 1, 1, 1, 1,
-1.013533, 1.245209, -1.525207, 1, 1, 1, 1, 1,
-1.012782, 0.8502977, -0.7094522, 1, 1, 1, 1, 1,
-1.012677, 0.6617634, -0.1376711, 1, 1, 1, 1, 1,
-1.011194, -1.202476, -1.719949, 1, 1, 1, 1, 1,
-1.009205, 1.059464, -0.7544089, 1, 1, 1, 1, 1,
-1.001474, -0.9359668, -3.583568, 1, 1, 1, 1, 1,
-0.9943481, -0.6736135, -2.235683, 1, 1, 1, 1, 1,
-0.9842858, -0.8223088, -3.606784, 1, 1, 1, 1, 1,
-0.9842553, -0.3178684, -2.665674, 0, 0, 1, 1, 1,
-0.9802711, -0.2234467, -2.391571, 1, 0, 0, 1, 1,
-0.9767902, -0.3418786, -0.21779, 1, 0, 0, 1, 1,
-0.9544293, -0.8869936, -2.71589, 1, 0, 0, 1, 1,
-0.9536827, 1.186833, -1.753793, 1, 0, 0, 1, 1,
-0.9536771, -0.6990626, -3.816713, 1, 0, 0, 1, 1,
-0.9524863, -0.9652684, -2.611314, 0, 0, 0, 1, 1,
-0.9515712, -0.3780749, -1.557553, 0, 0, 0, 1, 1,
-0.9455175, -1.021541, -1.751104, 0, 0, 0, 1, 1,
-0.9441001, -1.394183, -3.058775, 0, 0, 0, 1, 1,
-0.9277363, -0.4823082, -2.069406, 0, 0, 0, 1, 1,
-0.9219441, -0.8300047, -1.097943, 0, 0, 0, 1, 1,
-0.9192491, -1.972797, -1.867668, 0, 0, 0, 1, 1,
-0.916817, -1.162761, -2.337165, 1, 1, 1, 1, 1,
-0.9152319, -0.8734984, -1.814385, 1, 1, 1, 1, 1,
-0.9136833, 0.6065273, 0.2068363, 1, 1, 1, 1, 1,
-0.908125, -1.045748, -4.364483, 1, 1, 1, 1, 1,
-0.9071143, 0.07696602, -1.238067, 1, 1, 1, 1, 1,
-0.9064918, 0.9296907, -0.2799143, 1, 1, 1, 1, 1,
-0.9054294, 0.8936419, -1.425541, 1, 1, 1, 1, 1,
-0.9049727, 0.9542909, 0.3437273, 1, 1, 1, 1, 1,
-0.9048834, -1.346913, -3.339566, 1, 1, 1, 1, 1,
-0.897213, -2.171733, -2.079421, 1, 1, 1, 1, 1,
-0.8970497, -0.2243062, -1.89296, 1, 1, 1, 1, 1,
-0.8933792, 0.9772829, -0.9953, 1, 1, 1, 1, 1,
-0.889132, 0.9046238, -0.8653686, 1, 1, 1, 1, 1,
-0.8845959, 1.098441, -0.5760153, 1, 1, 1, 1, 1,
-0.8800071, -1.901656, -3.903294, 1, 1, 1, 1, 1,
-0.8765292, 0.4846136, -1.505002, 0, 0, 1, 1, 1,
-0.8745245, -1.249579, -3.880818, 1, 0, 0, 1, 1,
-0.8701997, -0.06575888, -2.307999, 1, 0, 0, 1, 1,
-0.8672996, 0.3656144, -0.3939596, 1, 0, 0, 1, 1,
-0.8655465, 1.47211, -2.603441, 1, 0, 0, 1, 1,
-0.8644611, -0.4128159, -2.432453, 1, 0, 0, 1, 1,
-0.8639923, -1.825885, -3.069094, 0, 0, 0, 1, 1,
-0.8638719, 0.8887638, 1.312516, 0, 0, 0, 1, 1,
-0.8540947, 0.6898103, -0.8006776, 0, 0, 0, 1, 1,
-0.8477749, 0.7204921, -2.915392, 0, 0, 0, 1, 1,
-0.8460068, -1.356725, -0.7151819, 0, 0, 0, 1, 1,
-0.8427204, 0.1786249, -0.02398206, 0, 0, 0, 1, 1,
-0.8412862, -0.600046, -1.471698, 0, 0, 0, 1, 1,
-0.8390894, -0.3936663, -1.870559, 1, 1, 1, 1, 1,
-0.8371464, -0.09326298, -2.696323, 1, 1, 1, 1, 1,
-0.8305047, -2.343412, -3.389587, 1, 1, 1, 1, 1,
-0.8242884, -1.630043, -3.288977, 1, 1, 1, 1, 1,
-0.8207438, 1.011441, -0.9047861, 1, 1, 1, 1, 1,
-0.817863, -1.150259, -3.138959, 1, 1, 1, 1, 1,
-0.8154193, 0.6584809, 1.425414, 1, 1, 1, 1, 1,
-0.8134423, -2.109498, -1.166963, 1, 1, 1, 1, 1,
-0.8116094, 0.6705815, -0.2292055, 1, 1, 1, 1, 1,
-0.810487, -0.9099155, -3.225015, 1, 1, 1, 1, 1,
-0.8083879, 0.8950399, -0.6035451, 1, 1, 1, 1, 1,
-0.8075521, -0.2652489, -0.7586941, 1, 1, 1, 1, 1,
-0.8009878, 0.2923583, -0.06846716, 1, 1, 1, 1, 1,
-0.7970297, -0.5789208, -1.746761, 1, 1, 1, 1, 1,
-0.7945933, 1.634393, 0.2039247, 1, 1, 1, 1, 1,
-0.791371, -0.5785646, -0.4590015, 0, 0, 1, 1, 1,
-0.7895634, 0.6712548, -0.1114806, 1, 0, 0, 1, 1,
-0.788527, -1.94304, -5.272776, 1, 0, 0, 1, 1,
-0.7862744, 1.546515, 1.261077, 1, 0, 0, 1, 1,
-0.7818494, -1.164215, -2.551929, 1, 0, 0, 1, 1,
-0.7795491, -0.197476, -0.7682415, 1, 0, 0, 1, 1,
-0.7779456, 1.136277, -0.6987023, 0, 0, 0, 1, 1,
-0.7745883, 2.658958, 0.1870274, 0, 0, 0, 1, 1,
-0.7717808, 1.484836, -0.9715489, 0, 0, 0, 1, 1,
-0.7709627, 0.1841451, -1.94742, 0, 0, 0, 1, 1,
-0.7620415, 0.4307565, -2.198846, 0, 0, 0, 1, 1,
-0.7559845, -0.7050139, -1.617682, 0, 0, 0, 1, 1,
-0.7544728, -1.112848, -2.438885, 0, 0, 0, 1, 1,
-0.7538647, 1.376861, -0.04352125, 1, 1, 1, 1, 1,
-0.7518067, 1.055486, -1.025779, 1, 1, 1, 1, 1,
-0.7455309, 1.81467, 2.418917, 1, 1, 1, 1, 1,
-0.7400814, 0.59213, -0.8529987, 1, 1, 1, 1, 1,
-0.7378793, 0.009399959, -2.534158, 1, 1, 1, 1, 1,
-0.7375638, 0.4566873, 0.5047047, 1, 1, 1, 1, 1,
-0.7361999, 0.1669184, -1.339236, 1, 1, 1, 1, 1,
-0.7361931, -0.2647735, -1.991376, 1, 1, 1, 1, 1,
-0.7359882, -0.08892184, -2.198943, 1, 1, 1, 1, 1,
-0.7324487, 0.8512278, 0.04163889, 1, 1, 1, 1, 1,
-0.7310265, -0.1910969, -2.018036, 1, 1, 1, 1, 1,
-0.7306557, 0.4293194, -0.09193034, 1, 1, 1, 1, 1,
-0.7272296, 0.1680465, -0.6130748, 1, 1, 1, 1, 1,
-0.7268214, 1.391722, -2.064306, 1, 1, 1, 1, 1,
-0.7208625, -1.116454, -3.963911, 1, 1, 1, 1, 1,
-0.71764, 0.7144167, -0.6280766, 0, 0, 1, 1, 1,
-0.7174416, 0.1486056, -2.067585, 1, 0, 0, 1, 1,
-0.7156841, 0.7448672, 0.2661144, 1, 0, 0, 1, 1,
-0.7109944, -1.349438, -1.366455, 1, 0, 0, 1, 1,
-0.7108798, -0.5993292, -2.372382, 1, 0, 0, 1, 1,
-0.7071412, 0.1413117, -3.613173, 1, 0, 0, 1, 1,
-0.6980276, -0.06412841, -1.844394, 0, 0, 0, 1, 1,
-0.6912638, -1.794463, -3.812917, 0, 0, 0, 1, 1,
-0.6892984, -0.7019576, -2.608392, 0, 0, 0, 1, 1,
-0.6849954, -0.01915932, -2.279937, 0, 0, 0, 1, 1,
-0.6806285, -0.03063227, -1.457012, 0, 0, 0, 1, 1,
-0.6733247, -0.1560907, -0.02763245, 0, 0, 0, 1, 1,
-0.666424, -1.805464, -3.115503, 0, 0, 0, 1, 1,
-0.6593986, -1.409339, -2.800578, 1, 1, 1, 1, 1,
-0.6539591, 0.6995404, -2.207422, 1, 1, 1, 1, 1,
-0.6471778, -0.2294168, -2.111205, 1, 1, 1, 1, 1,
-0.646351, -1.038407, -3.152344, 1, 1, 1, 1, 1,
-0.6402836, -1.527323, -4.026595, 1, 1, 1, 1, 1,
-0.6286698, -0.5955477, -2.001162, 1, 1, 1, 1, 1,
-0.6278788, 0.5580523, -1.602416, 1, 1, 1, 1, 1,
-0.6249949, 1.311165, 1.19266, 1, 1, 1, 1, 1,
-0.6248345, 1.797735, 0.355041, 1, 1, 1, 1, 1,
-0.6168881, -0.676176, -1.959769, 1, 1, 1, 1, 1,
-0.6159828, 0.2067438, 0.749774, 1, 1, 1, 1, 1,
-0.6153108, -0.2259343, -2.829036, 1, 1, 1, 1, 1,
-0.6128016, -1.427106, -3.521491, 1, 1, 1, 1, 1,
-0.6115444, -1.798701, -3.862499, 1, 1, 1, 1, 1,
-0.6074907, -1.639358, -5.332286, 1, 1, 1, 1, 1,
-0.6022031, -1.650762, -2.135933, 0, 0, 1, 1, 1,
-0.6010491, 0.2529911, -2.214784, 1, 0, 0, 1, 1,
-0.5985277, -0.8507245, -2.886928, 1, 0, 0, 1, 1,
-0.5979773, 0.7827306, -0.7102535, 1, 0, 0, 1, 1,
-0.596782, 0.6616876, -0.4183343, 1, 0, 0, 1, 1,
-0.5944742, 0.3087433, -0.9079083, 1, 0, 0, 1, 1,
-0.5938462, -1.286563, -2.864772, 0, 0, 0, 1, 1,
-0.590372, 0.1049658, -1.581425, 0, 0, 0, 1, 1,
-0.5894039, 1.063298, -2.828357, 0, 0, 0, 1, 1,
-0.5886078, 0.06616542, 0.178319, 0, 0, 0, 1, 1,
-0.5835281, -0.01608698, -1.131453, 0, 0, 0, 1, 1,
-0.5759518, 1.230781, -1.676822, 0, 0, 0, 1, 1,
-0.572363, 0.8664337, -0.3286356, 0, 0, 0, 1, 1,
-0.5643859, 0.09082055, -1.775541, 1, 1, 1, 1, 1,
-0.5604371, -0.7583764, -1.089237, 1, 1, 1, 1, 1,
-0.5595126, 0.6342432, -0.4537538, 1, 1, 1, 1, 1,
-0.5521451, -0.3291737, -2.339919, 1, 1, 1, 1, 1,
-0.5474084, -0.5283654, -3.22305, 1, 1, 1, 1, 1,
-0.543924, -0.6045988, -2.447435, 1, 1, 1, 1, 1,
-0.5431023, 0.1288854, -2.238173, 1, 1, 1, 1, 1,
-0.5425462, -1.040285, -1.876197, 1, 1, 1, 1, 1,
-0.5264071, -0.2705774, -0.6446955, 1, 1, 1, 1, 1,
-0.5229765, 0.2414825, -1.744647, 1, 1, 1, 1, 1,
-0.5185415, 1.423453, 1.767762, 1, 1, 1, 1, 1,
-0.5161902, -1.489552, -3.403012, 1, 1, 1, 1, 1,
-0.5154306, -0.3467862, -2.56815, 1, 1, 1, 1, 1,
-0.5084084, 1.553347, 0.2630962, 1, 1, 1, 1, 1,
-0.5075725, 0.2453679, -2.406127, 1, 1, 1, 1, 1,
-0.5064682, -1.267645, -1.664971, 0, 0, 1, 1, 1,
-0.5060685, 0.02018349, -1.604728, 1, 0, 0, 1, 1,
-0.5004447, -2.299276, -2.8961, 1, 0, 0, 1, 1,
-0.4985562, 1.589948, -0.6754081, 1, 0, 0, 1, 1,
-0.4939327, -0.3418143, -2.221969, 1, 0, 0, 1, 1,
-0.4878223, 1.603472, 1.034452, 1, 0, 0, 1, 1,
-0.4794722, -0.6156405, -2.669884, 0, 0, 0, 1, 1,
-0.474292, -0.2812355, -1.332674, 0, 0, 0, 1, 1,
-0.4735477, -0.2417472, -0.7532709, 0, 0, 0, 1, 1,
-0.4681647, -0.8530494, -2.014041, 0, 0, 0, 1, 1,
-0.4681187, -0.3143958, -1.594406, 0, 0, 0, 1, 1,
-0.4631225, 0.1696305, 0.7557564, 0, 0, 0, 1, 1,
-0.462541, 0.8283325, 0.3881507, 0, 0, 0, 1, 1,
-0.4624238, 0.0275244, -1.993287, 1, 1, 1, 1, 1,
-0.4600246, -2.252335, -1.652196, 1, 1, 1, 1, 1,
-0.4460969, -0.8370551, -2.733208, 1, 1, 1, 1, 1,
-0.4444958, -2.732246, -4.749971, 1, 1, 1, 1, 1,
-0.4435928, 0.3720144, 0.04422753, 1, 1, 1, 1, 1,
-0.4433648, 1.196347, -0.324284, 1, 1, 1, 1, 1,
-0.4413897, -1.356969, -2.045248, 1, 1, 1, 1, 1,
-0.4344041, -0.7498609, -2.318403, 1, 1, 1, 1, 1,
-0.4328426, 0.6602104, -1.3311, 1, 1, 1, 1, 1,
-0.4318483, -0.8224029, -3.761656, 1, 1, 1, 1, 1,
-0.4291072, -0.5267962, -2.923052, 1, 1, 1, 1, 1,
-0.4269585, -1.50932, -1.866096, 1, 1, 1, 1, 1,
-0.4258105, -0.3930503, -1.024465, 1, 1, 1, 1, 1,
-0.4252889, 0.3436809, -0.1744197, 1, 1, 1, 1, 1,
-0.4221832, -0.1907862, -3.09351, 1, 1, 1, 1, 1,
-0.4203219, 1.255881, -1.765516, 0, 0, 1, 1, 1,
-0.4201905, 0.6305457, -1.265529, 1, 0, 0, 1, 1,
-0.4172293, 0.5471472, -0.2325875, 1, 0, 0, 1, 1,
-0.4170818, 0.1159222, -1.439065, 1, 0, 0, 1, 1,
-0.416573, 0.8259837, -0.7611045, 1, 0, 0, 1, 1,
-0.4147164, 1.048304, -0.3434324, 1, 0, 0, 1, 1,
-0.4081455, -0.08473585, -0.4403147, 0, 0, 0, 1, 1,
-0.4078365, 0.7345431, 1.580677, 0, 0, 0, 1, 1,
-0.4045676, -1.208881, -2.879321, 0, 0, 0, 1, 1,
-0.4025132, 0.01839693, -1.997576, 0, 0, 0, 1, 1,
-0.4022564, 0.2681878, -2.591145, 0, 0, 0, 1, 1,
-0.4008769, 0.8698244, -1.088933, 0, 0, 0, 1, 1,
-0.396726, -1.549767, -2.491683, 0, 0, 0, 1, 1,
-0.3947011, 0.9215553, 0.7576575, 1, 1, 1, 1, 1,
-0.3943303, 0.4041927, 0.1163623, 1, 1, 1, 1, 1,
-0.3919581, 0.09948937, -0.9531565, 1, 1, 1, 1, 1,
-0.3874375, -0.6367514, -0.6707004, 1, 1, 1, 1, 1,
-0.3864577, -1.308812, -3.764714, 1, 1, 1, 1, 1,
-0.3849125, -1.241587, -4.079031, 1, 1, 1, 1, 1,
-0.378479, -1.380086, -4.331837, 1, 1, 1, 1, 1,
-0.3754975, -0.5284086, -1.687351, 1, 1, 1, 1, 1,
-0.3745682, -0.147445, -2.361816, 1, 1, 1, 1, 1,
-0.3672177, 0.6622126, -2.03264, 1, 1, 1, 1, 1,
-0.3665129, -0.3194215, -1.661028, 1, 1, 1, 1, 1,
-0.3627528, 1.229506, -1.097944, 1, 1, 1, 1, 1,
-0.3599377, -0.02806736, -0.8846958, 1, 1, 1, 1, 1,
-0.3595669, -0.4273876, -1.843847, 1, 1, 1, 1, 1,
-0.3584893, -2.347356, -5.188742, 1, 1, 1, 1, 1,
-0.3514643, -0.1285947, -3.709693, 0, 0, 1, 1, 1,
-0.3450409, -1.075511, -3.699749, 1, 0, 0, 1, 1,
-0.3445863, -0.4394863, -2.830431, 1, 0, 0, 1, 1,
-0.3380815, 0.9776488, -0.06935989, 1, 0, 0, 1, 1,
-0.3350579, 0.2891418, -1.714375, 1, 0, 0, 1, 1,
-0.3276648, -1.426535, -1.411243, 1, 0, 0, 1, 1,
-0.3267464, 0.9782495, -1.451557, 0, 0, 0, 1, 1,
-0.3261096, -0.2326108, -3.271996, 0, 0, 0, 1, 1,
-0.3205325, -1.67222, -2.972915, 0, 0, 0, 1, 1,
-0.3188061, -1.215715, -4.347116, 0, 0, 0, 1, 1,
-0.3175369, 0.05854935, -0.979775, 0, 0, 0, 1, 1,
-0.3168778, 0.08491401, -1.445086, 0, 0, 0, 1, 1,
-0.3144695, 0.704425, -1.862398, 0, 0, 0, 1, 1,
-0.3131118, -0.351399, -2.298022, 1, 1, 1, 1, 1,
-0.3107932, 0.7030007, 0.5674242, 1, 1, 1, 1, 1,
-0.3089245, 1.735652, -0.5688136, 1, 1, 1, 1, 1,
-0.3054185, -0.9616092, -2.592295, 1, 1, 1, 1, 1,
-0.3037919, 0.1399687, 0.05343594, 1, 1, 1, 1, 1,
-0.3023079, -1.132133, -3.179533, 1, 1, 1, 1, 1,
-0.3010011, 0.2036103, -3.083834, 1, 1, 1, 1, 1,
-0.2991869, -0.9742596, -2.639177, 1, 1, 1, 1, 1,
-0.2989701, 0.3225385, 0.05458616, 1, 1, 1, 1, 1,
-0.2971657, 1.755188, -0.1815506, 1, 1, 1, 1, 1,
-0.2958777, 0.1739824, -0.04951581, 1, 1, 1, 1, 1,
-0.2939974, -0.7854686, -4.184871, 1, 1, 1, 1, 1,
-0.2918276, 0.8784429, 0.8540644, 1, 1, 1, 1, 1,
-0.2900109, 0.3991715, 1.51962, 1, 1, 1, 1, 1,
-0.283848, 1.490328, 0.5118083, 1, 1, 1, 1, 1,
-0.2830662, -0.7406994, -1.941075, 0, 0, 1, 1, 1,
-0.2823288, -0.1808694, -2.760731, 1, 0, 0, 1, 1,
-0.2789596, 0.6393781, -0.153445, 1, 0, 0, 1, 1,
-0.277507, 2.113419, 0.2482785, 1, 0, 0, 1, 1,
-0.27727, -0.4753675, -1.732662, 1, 0, 0, 1, 1,
-0.2696705, 1.593503, -0.2431536, 1, 0, 0, 1, 1,
-0.2645744, -0.7679048, -2.545199, 0, 0, 0, 1, 1,
-0.2638379, -1.35079, -2.35065, 0, 0, 0, 1, 1,
-0.2629731, -0.5905519, -3.376229, 0, 0, 0, 1, 1,
-0.2586371, -2.181982, -2.037109, 0, 0, 0, 1, 1,
-0.2573867, -0.9754502, -2.755643, 0, 0, 0, 1, 1,
-0.2478909, -1.174211, -3.166314, 0, 0, 0, 1, 1,
-0.2465857, 0.2507397, -0.9210646, 0, 0, 0, 1, 1,
-0.2434492, 1.417396, 0.6863748, 1, 1, 1, 1, 1,
-0.2424791, -0.6937394, -2.382385, 1, 1, 1, 1, 1,
-0.2405958, -0.147735, -2.624944, 1, 1, 1, 1, 1,
-0.2400116, -1.104653, -3.062418, 1, 1, 1, 1, 1,
-0.237942, 2.191236, 0.5026594, 1, 1, 1, 1, 1,
-0.2341397, -1.323625, -2.495175, 1, 1, 1, 1, 1,
-0.2322925, 1.059644, -0.7608112, 1, 1, 1, 1, 1,
-0.2309054, -0.2920406, -1.659587, 1, 1, 1, 1, 1,
-0.2306851, -1.291423, -3.323641, 1, 1, 1, 1, 1,
-0.2282405, 0.3216259, -0.938756, 1, 1, 1, 1, 1,
-0.2257077, 0.2737215, 0.173148, 1, 1, 1, 1, 1,
-0.2249513, 0.1168812, -0.3857066, 1, 1, 1, 1, 1,
-0.2222446, 1.45293, -0.9168726, 1, 1, 1, 1, 1,
-0.2202858, 0.4665869, 0.4023911, 1, 1, 1, 1, 1,
-0.2199997, -1.261878, -1.31965, 1, 1, 1, 1, 1,
-0.2182517, 0.5649641, 1.055294, 0, 0, 1, 1, 1,
-0.2172849, 2.013486, -0.5484239, 1, 0, 0, 1, 1,
-0.2153719, 0.5091469, -0.1705876, 1, 0, 0, 1, 1,
-0.2127714, 0.7101235, -0.7438697, 1, 0, 0, 1, 1,
-0.2117852, -0.2852216, -1.766991, 1, 0, 0, 1, 1,
-0.208875, -0.1977975, -0.9701654, 1, 0, 0, 1, 1,
-0.2068592, 0.3802534, -1.472116, 0, 0, 0, 1, 1,
-0.2067031, 1.327393, 0.7427211, 0, 0, 0, 1, 1,
-0.2052422, 0.3891541, -1.462953, 0, 0, 0, 1, 1,
-0.2008206, 0.4156812, -0.5846463, 0, 0, 0, 1, 1,
-0.1935836, 0.5413979, -0.5290343, 0, 0, 0, 1, 1,
-0.1932395, -0.1629187, -1.298516, 0, 0, 0, 1, 1,
-0.1915864, -0.5059157, -3.931239, 0, 0, 0, 1, 1,
-0.1915635, -0.2808699, -2.100755, 1, 1, 1, 1, 1,
-0.1900129, 1.182728, 0.8616386, 1, 1, 1, 1, 1,
-0.1821129, 0.4587202, 0.2000757, 1, 1, 1, 1, 1,
-0.178496, -0.789848, -2.835315, 1, 1, 1, 1, 1,
-0.17788, 0.3724649, -0.2147805, 1, 1, 1, 1, 1,
-0.1757463, 0.37777, -0.5663967, 1, 1, 1, 1, 1,
-0.1745881, -0.08764502, -2.010099, 1, 1, 1, 1, 1,
-0.1706396, 0.4168296, -0.7593727, 1, 1, 1, 1, 1,
-0.164418, -1.026237, -5.211597, 1, 1, 1, 1, 1,
-0.1639731, 1.153475, 0.7228041, 1, 1, 1, 1, 1,
-0.1613069, 0.2970013, -1.78504, 1, 1, 1, 1, 1,
-0.159557, 1.916191, 0.5045236, 1, 1, 1, 1, 1,
-0.1571201, -0.01229062, -1.281386, 1, 1, 1, 1, 1,
-0.1539803, 1.879251, -0.7197075, 1, 1, 1, 1, 1,
-0.1533205, 0.4827446, -2.533374, 1, 1, 1, 1, 1,
-0.1517302, -2.268373, -2.832118, 0, 0, 1, 1, 1,
-0.151073, -0.1527799, -2.369597, 1, 0, 0, 1, 1,
-0.1504985, -0.4131597, -3.89315, 1, 0, 0, 1, 1,
-0.150117, 0.9061162, -0.555423, 1, 0, 0, 1, 1,
-0.1492633, 0.2812085, 0.4585887, 1, 0, 0, 1, 1,
-0.148085, -1.503725, -5.185591, 1, 0, 0, 1, 1,
-0.1420197, -1.19924, -1.793577, 0, 0, 0, 1, 1,
-0.1392915, 1.256996, -0.7575374, 0, 0, 0, 1, 1,
-0.1365226, 1.13806, 0.09811577, 0, 0, 0, 1, 1,
-0.1360768, 0.4716202, 1.217259, 0, 0, 0, 1, 1,
-0.1330897, -1.977348, -3.94983, 0, 0, 0, 1, 1,
-0.1310502, 0.4787823, -0.7871915, 0, 0, 0, 1, 1,
-0.1309365, -0.1364327, -4.773897, 0, 0, 0, 1, 1,
-0.1227505, -0.5333292, -2.044072, 1, 1, 1, 1, 1,
-0.1211587, 0.648317, -0.8908172, 1, 1, 1, 1, 1,
-0.1207377, -0.2104763, -4.121273, 1, 1, 1, 1, 1,
-0.1204806, 1.663089, -1.041822, 1, 1, 1, 1, 1,
-0.1141562, 0.2101986, -1.445593, 1, 1, 1, 1, 1,
-0.1136058, 0.6072181, 0.9889816, 1, 1, 1, 1, 1,
-0.1135675, -1.602536, -2.38057, 1, 1, 1, 1, 1,
-0.1127943, 0.7618932, 1.570635, 1, 1, 1, 1, 1,
-0.1034184, -0.06178952, -2.787746, 1, 1, 1, 1, 1,
-0.1026909, -1.085914, -3.930721, 1, 1, 1, 1, 1,
-0.1021172, -1.390187, -3.087796, 1, 1, 1, 1, 1,
-0.1003494, 1.352006, -0.6346515, 1, 1, 1, 1, 1,
-0.09858542, -0.9399409, -3.71202, 1, 1, 1, 1, 1,
-0.09123277, -0.8551892, -1.800217, 1, 1, 1, 1, 1,
-0.09117518, -0.7832305, -2.725478, 1, 1, 1, 1, 1,
-0.09075751, 1.008224, -0.72172, 0, 0, 1, 1, 1,
-0.08951881, 0.2028857, -0.9010824, 1, 0, 0, 1, 1,
-0.08806193, -1.271718, -3.940461, 1, 0, 0, 1, 1,
-0.08521884, 0.6476017, -1.515889, 1, 0, 0, 1, 1,
-0.08321626, 0.6492809, -1.090752, 1, 0, 0, 1, 1,
-0.08316933, 0.4610624, -1.301278, 1, 0, 0, 1, 1,
-0.08139687, -1.613761, -0.3842262, 0, 0, 0, 1, 1,
-0.07820789, 2.002441, 1.093497, 0, 0, 0, 1, 1,
-0.07732882, 0.6977963, -1.193178, 0, 0, 0, 1, 1,
-0.07720739, -2.374446, -3.98143, 0, 0, 0, 1, 1,
-0.06961735, -1.305362, -2.645374, 0, 0, 0, 1, 1,
-0.06810068, -0.8019715, -3.285783, 0, 0, 0, 1, 1,
-0.06061613, -0.3436191, -5.184557, 0, 0, 0, 1, 1,
-0.05759805, -0.121228, -2.693913, 1, 1, 1, 1, 1,
-0.05554414, -0.7438556, -2.409429, 1, 1, 1, 1, 1,
-0.05283683, -0.9120184, -4.107308, 1, 1, 1, 1, 1,
-0.05039849, -0.04406029, -2.80245, 1, 1, 1, 1, 1,
-0.04935436, 0.1321228, -1.465791, 1, 1, 1, 1, 1,
-0.04687279, 1.962072, 0.1414813, 1, 1, 1, 1, 1,
-0.04107001, -0.04948192, -4.026079, 1, 1, 1, 1, 1,
-0.03830599, 0.9645131, -1.263364, 1, 1, 1, 1, 1,
-0.03691537, 0.705456, -0.3029686, 1, 1, 1, 1, 1,
-0.03649232, 0.1947936, -0.2513635, 1, 1, 1, 1, 1,
-0.03356589, 0.4286626, -1.595877, 1, 1, 1, 1, 1,
-0.03035492, -0.2917539, -3.431686, 1, 1, 1, 1, 1,
-0.02850624, 1.105905, 1.143588, 1, 1, 1, 1, 1,
-0.02588623, -1.577292, -2.685503, 1, 1, 1, 1, 1,
-0.01995648, 0.6894501, 1.801296, 1, 1, 1, 1, 1,
-0.01953323, 0.1261277, -1.082333, 0, 0, 1, 1, 1,
-0.01943745, -0.06964977, -0.6546646, 1, 0, 0, 1, 1,
-0.01859914, 0.8964077, 0.228677, 1, 0, 0, 1, 1,
-0.01534341, 1.177263, -0.04675681, 1, 0, 0, 1, 1,
-0.005535051, -1.314165, -3.647147, 1, 0, 0, 1, 1,
-0.003836109, -0.4477976, -2.321647, 1, 0, 0, 1, 1,
-0.000619757, -0.1885302, -2.713333, 0, 0, 0, 1, 1,
0.002331984, -0.06545471, 3.324771, 0, 0, 0, 1, 1,
0.01488091, 0.8499749, 1.402561, 0, 0, 0, 1, 1,
0.01594281, -1.409632, 3.125042, 0, 0, 0, 1, 1,
0.01837779, 1.08755, 0.1365812, 0, 0, 0, 1, 1,
0.02030203, 0.5083807, -1.054244, 0, 0, 0, 1, 1,
0.02258035, -1.270243, 1.758488, 0, 0, 0, 1, 1,
0.02449629, 1.134856, 0.6610768, 1, 1, 1, 1, 1,
0.02757186, -0.6268548, 2.220829, 1, 1, 1, 1, 1,
0.02785851, 0.7345576, 0.2217912, 1, 1, 1, 1, 1,
0.03767813, -0.1553937, 2.368415, 1, 1, 1, 1, 1,
0.04238245, -0.7571729, 5.408118, 1, 1, 1, 1, 1,
0.04613764, 1.428753, 0.07974026, 1, 1, 1, 1, 1,
0.04803963, -1.007644, 3.696116, 1, 1, 1, 1, 1,
0.05704564, -0.5077613, 3.321597, 1, 1, 1, 1, 1,
0.05713215, -1.398539, 3.337468, 1, 1, 1, 1, 1,
0.05744321, 0.6718645, -0.8167729, 1, 1, 1, 1, 1,
0.05855741, 0.562561, 0.05677847, 1, 1, 1, 1, 1,
0.06640428, 2.943552, -0.3495106, 1, 1, 1, 1, 1,
0.06909573, -0.9579387, 2.806229, 1, 1, 1, 1, 1,
0.06923227, -1.082222, 2.249484, 1, 1, 1, 1, 1,
0.07042551, -0.1506032, 3.891987, 1, 1, 1, 1, 1,
0.07241526, -0.5068447, 2.806608, 0, 0, 1, 1, 1,
0.07703111, 1.118921, 1.226976, 1, 0, 0, 1, 1,
0.08001938, -2.432042, 2.357132, 1, 0, 0, 1, 1,
0.08006939, 1.420733, -0.1655035, 1, 0, 0, 1, 1,
0.08346325, -0.251737, 2.860395, 1, 0, 0, 1, 1,
0.08490091, 2.584558, 0.4960783, 1, 0, 0, 1, 1,
0.08730096, -0.4915755, 5.398683, 0, 0, 0, 1, 1,
0.09316459, -2.3111, 3.438645, 0, 0, 0, 1, 1,
0.09318227, 0.001160943, 2.310343, 0, 0, 0, 1, 1,
0.09512594, 0.8472407, 0.6201572, 0, 0, 0, 1, 1,
0.09628197, 0.173222, 0.7010094, 0, 0, 0, 1, 1,
0.09730797, -0.1413943, 1.347813, 0, 0, 0, 1, 1,
0.09767906, 0.3862588, 0.1200785, 0, 0, 0, 1, 1,
0.09840151, 0.3534442, 0.354994, 1, 1, 1, 1, 1,
0.1000066, -0.8561252, 0.5282028, 1, 1, 1, 1, 1,
0.1061364, 0.9049491, 0.7697915, 1, 1, 1, 1, 1,
0.1142033, 0.4646623, 0.6327198, 1, 1, 1, 1, 1,
0.1156435, 0.352884, -0.5598906, 1, 1, 1, 1, 1,
0.1168846, -0.8816629, 2.231855, 1, 1, 1, 1, 1,
0.1182587, 0.6981955, -0.7498704, 1, 1, 1, 1, 1,
0.121855, 1.276096, -1.783228, 1, 1, 1, 1, 1,
0.1236902, -0.7745923, 0.4670869, 1, 1, 1, 1, 1,
0.1249644, 2.397854, 0.5317149, 1, 1, 1, 1, 1,
0.129749, 0.3970257, 0.7380251, 1, 1, 1, 1, 1,
0.1304142, -0.2242691, 1.82635, 1, 1, 1, 1, 1,
0.1352677, -0.3460065, 3.050355, 1, 1, 1, 1, 1,
0.1354168, -0.8346123, 4.775417, 1, 1, 1, 1, 1,
0.1403337, 0.2245685, 1.520915, 1, 1, 1, 1, 1,
0.141431, -0.4830114, 4.045087, 0, 0, 1, 1, 1,
0.1439252, 1.393213, 1.827177, 1, 0, 0, 1, 1,
0.1451599, -0.716747, 1.889405, 1, 0, 0, 1, 1,
0.1468245, -1.528046, 2.982064, 1, 0, 0, 1, 1,
0.155805, 0.02303082, 0.8964549, 1, 0, 0, 1, 1,
0.1575941, -0.3172449, 2.756085, 1, 0, 0, 1, 1,
0.1589441, -0.9687359, 3.37289, 0, 0, 0, 1, 1,
0.1635076, 0.235895, -0.7110735, 0, 0, 0, 1, 1,
0.1655732, 0.3782693, 1.059178, 0, 0, 0, 1, 1,
0.1675483, -1.957618, 1.742573, 0, 0, 0, 1, 1,
0.1696058, -1.14439, 3.820985, 0, 0, 0, 1, 1,
0.1716453, -0.03575442, 1.23226, 0, 0, 0, 1, 1,
0.171803, -0.847006, 3.718079, 0, 0, 0, 1, 1,
0.1721048, -0.560684, 4.70551, 1, 1, 1, 1, 1,
0.1741117, -0.04399191, 3.46327, 1, 1, 1, 1, 1,
0.1771987, 1.088332, 1.711839, 1, 1, 1, 1, 1,
0.1783892, 0.7455088, 0.4003973, 1, 1, 1, 1, 1,
0.1805328, -0.6190297, 1.699898, 1, 1, 1, 1, 1,
0.1821945, 0.2156397, 1.265336, 1, 1, 1, 1, 1,
0.185002, -0.3431349, 4.90183, 1, 1, 1, 1, 1,
0.1879162, 0.5735255, 1.366849, 1, 1, 1, 1, 1,
0.1889424, -0.3288147, 2.633455, 1, 1, 1, 1, 1,
0.1893062, 0.06483126, 0.4534128, 1, 1, 1, 1, 1,
0.1899439, -1.193954, 3.04325, 1, 1, 1, 1, 1,
0.1911244, -0.659251, 2.874099, 1, 1, 1, 1, 1,
0.1961602, -0.4165011, 3.595255, 1, 1, 1, 1, 1,
0.1972618, -0.03435986, 0.7050348, 1, 1, 1, 1, 1,
0.197394, -0.05214722, 5.169992, 1, 1, 1, 1, 1,
0.1978549, 0.1495922, 0.6117574, 0, 0, 1, 1, 1,
0.1981834, 1.288788, -0.5632992, 1, 0, 0, 1, 1,
0.2009475, 0.758595, 0.6109048, 1, 0, 0, 1, 1,
0.2032747, -1.88286, 2.756944, 1, 0, 0, 1, 1,
0.2067972, -1.289852, 2.852178, 1, 0, 0, 1, 1,
0.2123751, 1.980311, 0.421062, 1, 0, 0, 1, 1,
0.2210837, -0.6115227, 3.801629, 0, 0, 0, 1, 1,
0.2212599, 0.995248, 1.33381, 0, 0, 0, 1, 1,
0.2271868, 0.9265342, 1.123089, 0, 0, 0, 1, 1,
0.231399, 0.9087343, 1.807575, 0, 0, 0, 1, 1,
0.234854, -0.1637595, 1.970197, 0, 0, 0, 1, 1,
0.2370999, -0.9644181, 3.618952, 0, 0, 0, 1, 1,
0.2407574, -0.7861052, 3.511942, 0, 0, 0, 1, 1,
0.2443925, -0.5686719, 2.675123, 1, 1, 1, 1, 1,
0.2457365, -0.343517, 1.29394, 1, 1, 1, 1, 1,
0.2465335, 0.1089725, 2.07022, 1, 1, 1, 1, 1,
0.2499167, 0.4390842, -0.4731136, 1, 1, 1, 1, 1,
0.2503549, 0.2517053, 1.994536, 1, 1, 1, 1, 1,
0.2513224, -1.090016, 3.060056, 1, 1, 1, 1, 1,
0.2532676, 0.2949596, 0.4740204, 1, 1, 1, 1, 1,
0.2561306, -1.308726, 2.488256, 1, 1, 1, 1, 1,
0.2589777, -0.1650144, 2.773577, 1, 1, 1, 1, 1,
0.2596189, 1.049855, -0.2831218, 1, 1, 1, 1, 1,
0.2598771, 0.2656398, 1.797327, 1, 1, 1, 1, 1,
0.2622621, -0.1821472, 2.902407, 1, 1, 1, 1, 1,
0.2661945, -1.949305, 4.334671, 1, 1, 1, 1, 1,
0.2715383, 2.709054, 0.8890388, 1, 1, 1, 1, 1,
0.2747563, 0.1995231, 0.4780951, 1, 1, 1, 1, 1,
0.2844608, -1.803934, 3.444685, 0, 0, 1, 1, 1,
0.2849445, -1.179346, 5.233965, 1, 0, 0, 1, 1,
0.2888608, 0.3268682, 0.185011, 1, 0, 0, 1, 1,
0.2900832, -1.856867, 3.869871, 1, 0, 0, 1, 1,
0.2946361, -0.1736454, 1.431773, 1, 0, 0, 1, 1,
0.2952092, -0.02464277, 2.351326, 1, 0, 0, 1, 1,
0.2974926, -0.458649, 2.464268, 0, 0, 0, 1, 1,
0.302995, 0.5108249, 1.067054, 0, 0, 0, 1, 1,
0.3047408, -1.642101, 3.616647, 0, 0, 0, 1, 1,
0.3049805, 2.322729, -0.4683028, 0, 0, 0, 1, 1,
0.3061158, 0.4350432, 0.09578959, 0, 0, 0, 1, 1,
0.3094824, -2.900804, 4.735272, 0, 0, 0, 1, 1,
0.3344592, -0.1543411, -0.3621445, 0, 0, 0, 1, 1,
0.335993, -1.287573, 2.768996, 1, 1, 1, 1, 1,
0.3360623, 0.7130203, 2.568646, 1, 1, 1, 1, 1,
0.3390659, -0.2416202, 3.264429, 1, 1, 1, 1, 1,
0.3401858, 0.1393824, 1.416055, 1, 1, 1, 1, 1,
0.3427666, 0.3748455, 1.378481, 1, 1, 1, 1, 1,
0.3456495, 1.06475, 2.435497, 1, 1, 1, 1, 1,
0.3461425, 0.3628537, 1.10632, 1, 1, 1, 1, 1,
0.3521227, 0.8053679, 0.4520339, 1, 1, 1, 1, 1,
0.3537508, -0.6042324, 4.343759, 1, 1, 1, 1, 1,
0.3608995, -0.1173646, 1.362537, 1, 1, 1, 1, 1,
0.3614931, -0.3965923, 1.059659, 1, 1, 1, 1, 1,
0.3617855, -0.4297782, 2.284304, 1, 1, 1, 1, 1,
0.3629104, -0.9630945, 2.340967, 1, 1, 1, 1, 1,
0.3659584, -0.1164277, 1.435692, 1, 1, 1, 1, 1,
0.367097, -0.3071779, 2.657692, 1, 1, 1, 1, 1,
0.3709309, 0.5588167, 1.539804, 0, 0, 1, 1, 1,
0.3777412, -0.4919686, 1.881228, 1, 0, 0, 1, 1,
0.3779519, 0.7134877, -0.4309422, 1, 0, 0, 1, 1,
0.3791783, -0.4045167, 1.76465, 1, 0, 0, 1, 1,
0.3821352, 0.1553019, 0.4034156, 1, 0, 0, 1, 1,
0.3828061, 2.529526, -1.098141, 1, 0, 0, 1, 1,
0.383245, 0.6779978, 1.537054, 0, 0, 0, 1, 1,
0.3845676, 0.05813737, 1.550483, 0, 0, 0, 1, 1,
0.3860281, -1.197683, 1.223089, 0, 0, 0, 1, 1,
0.3907345, 1.233735, 0.9454096, 0, 0, 0, 1, 1,
0.3933384, -0.2709889, 3.939344, 0, 0, 0, 1, 1,
0.3964497, -0.6727761, 4.317655, 0, 0, 0, 1, 1,
0.3968552, 0.3710689, 1.331508, 0, 0, 0, 1, 1,
0.4004945, 1.591613, 0.8751571, 1, 1, 1, 1, 1,
0.4009157, -0.1737197, 2.086928, 1, 1, 1, 1, 1,
0.4032742, -0.6347846, 2.575407, 1, 1, 1, 1, 1,
0.4065084, -0.1349803, 0.9681044, 1, 1, 1, 1, 1,
0.407492, -0.6885629, 0.8434033, 1, 1, 1, 1, 1,
0.4107887, 2.365805, 0.3011844, 1, 1, 1, 1, 1,
0.4150929, -0.7136854, 3.59071, 1, 1, 1, 1, 1,
0.4166994, -0.8189106, 2.055533, 1, 1, 1, 1, 1,
0.4190438, -1.690139, 1.154878, 1, 1, 1, 1, 1,
0.4197707, -0.7649109, 2.707022, 1, 1, 1, 1, 1,
0.4211684, 0.1860541, 1.220026, 1, 1, 1, 1, 1,
0.4266828, -1.50489, 3.017139, 1, 1, 1, 1, 1,
0.4268319, 0.4240285, -0.2077551, 1, 1, 1, 1, 1,
0.428219, 1.07054, 1.511021, 1, 1, 1, 1, 1,
0.4309545, 1.812835, 1.302165, 1, 1, 1, 1, 1,
0.4338521, 0.8196784, -0.2750689, 0, 0, 1, 1, 1,
0.434307, -1.599884, 3.506033, 1, 0, 0, 1, 1,
0.4349353, -1.56245, 2.547388, 1, 0, 0, 1, 1,
0.4357771, 0.08464048, 2.149681, 1, 0, 0, 1, 1,
0.4452643, 1.353769, 0.1390041, 1, 0, 0, 1, 1,
0.4462076, -0.1218291, 1.543179, 1, 0, 0, 1, 1,
0.4514277, 0.1414984, 1.820458, 0, 0, 0, 1, 1,
0.4529397, 1.210351, -2.155145, 0, 0, 0, 1, 1,
0.4558201, 0.02790746, 1.461979, 0, 0, 0, 1, 1,
0.4607971, 1.052688, -0.3401943, 0, 0, 0, 1, 1,
0.4664199, 0.9848602, 1.384909, 0, 0, 0, 1, 1,
0.4674794, -0.1952891, 2.074094, 0, 0, 0, 1, 1,
0.4758379, 0.0774305, 0.2873538, 0, 0, 0, 1, 1,
0.4813339, 1.033265, -0.8258497, 1, 1, 1, 1, 1,
0.4835398, -1.266953, 3.209924, 1, 1, 1, 1, 1,
0.487142, -1.132463, 3.363725, 1, 1, 1, 1, 1,
0.4885175, -0.7176504, 1.798581, 1, 1, 1, 1, 1,
0.4899727, 0.01708604, 0.8488564, 1, 1, 1, 1, 1,
0.4927783, 1.880576, 0.05567586, 1, 1, 1, 1, 1,
0.4933752, 0.1622221, 0.5140716, 1, 1, 1, 1, 1,
0.493388, 0.6359302, 0.6278521, 1, 1, 1, 1, 1,
0.4989006, -1.870751, 2.472824, 1, 1, 1, 1, 1,
0.506345, -2.676, 2.267399, 1, 1, 1, 1, 1,
0.5105106, -0.6875473, 3.196129, 1, 1, 1, 1, 1,
0.5180573, 1.0373, 0.344711, 1, 1, 1, 1, 1,
0.5182582, 1.704583, -0.1688753, 1, 1, 1, 1, 1,
0.5202653, 0.02545684, 1.279261, 1, 1, 1, 1, 1,
0.5239812, 0.6898956, -0.1195118, 1, 1, 1, 1, 1,
0.5266018, -1.409648, 1.651594, 0, 0, 1, 1, 1,
0.52819, 2.205475, -1.040171, 1, 0, 0, 1, 1,
0.5321481, 1.175074, 1.040649, 1, 0, 0, 1, 1,
0.5325363, -2.07442, 3.32461, 1, 0, 0, 1, 1,
0.5339062, 0.3109028, 0.8694415, 1, 0, 0, 1, 1,
0.5343183, -0.509688, 2.20379, 1, 0, 0, 1, 1,
0.5357636, 0.8288668, -1.086171, 0, 0, 0, 1, 1,
0.5386606, -0.3216718, 3.152322, 0, 0, 0, 1, 1,
0.538747, 1.898136, -0.8234707, 0, 0, 0, 1, 1,
0.5393931, -0.08428051, 1.421509, 0, 0, 0, 1, 1,
0.5410793, -1.252095, 2.257982, 0, 0, 0, 1, 1,
0.5410886, -0.3671121, 2.61926, 0, 0, 0, 1, 1,
0.5425307, 0.09621932, 1.914459, 0, 0, 0, 1, 1,
0.5462709, -0.2716123, 1.271433, 1, 1, 1, 1, 1,
0.5470768, -1.757413, 3.839007, 1, 1, 1, 1, 1,
0.5475144, 1.015217, 1.16374, 1, 1, 1, 1, 1,
0.5548966, 0.4765463, 0.9170483, 1, 1, 1, 1, 1,
0.5582394, -0.5624207, 2.474626, 1, 1, 1, 1, 1,
0.5635584, 1.317631, 0.5335867, 1, 1, 1, 1, 1,
0.5637213, -0.9109486, 2.899882, 1, 1, 1, 1, 1,
0.5716335, -1.147316, 1.965298, 1, 1, 1, 1, 1,
0.5725827, 1.488552, 1.539695, 1, 1, 1, 1, 1,
0.5736329, -1.153153, 3.7528, 1, 1, 1, 1, 1,
0.5749996, 0.1538816, 1.686068, 1, 1, 1, 1, 1,
0.5790448, 0.8175164, 1.027673, 1, 1, 1, 1, 1,
0.5812552, -0.3557093, 3.112087, 1, 1, 1, 1, 1,
0.5850508, -0.1689542, 0.9316719, 1, 1, 1, 1, 1,
0.5851839, 1.386787, 1.188758, 1, 1, 1, 1, 1,
0.5875094, -0.6213603, 1.652469, 0, 0, 1, 1, 1,
0.5876191, -0.7033986, 1.62323, 1, 0, 0, 1, 1,
0.5918535, -0.6458396, 4.797121, 1, 0, 0, 1, 1,
0.5953708, 1.498835, 2.36607, 1, 0, 0, 1, 1,
0.6036958, -0.435042, 3.037421, 1, 0, 0, 1, 1,
0.6047137, 0.9947664, 1.035496, 1, 0, 0, 1, 1,
0.6068217, -0.3272537, 1.637064, 0, 0, 0, 1, 1,
0.609767, -1.485586, 4.159589, 0, 0, 0, 1, 1,
0.614751, 2.559506, 1.317093, 0, 0, 0, 1, 1,
0.6161458, -0.7312008, 1.365116, 0, 0, 0, 1, 1,
0.616204, -0.827675, 2.760696, 0, 0, 0, 1, 1,
0.6171694, -0.3420299, 1.58535, 0, 0, 0, 1, 1,
0.6206784, 0.9987811, 0.7608716, 0, 0, 0, 1, 1,
0.6208544, 0.614439, 1.937183, 1, 1, 1, 1, 1,
0.6209032, -0.2863426, 1.100466, 1, 1, 1, 1, 1,
0.6234287, -0.001036732, 2.158084, 1, 1, 1, 1, 1,
0.6319841, 0.2708463, 1.488077, 1, 1, 1, 1, 1,
0.6328286, -0.1739381, 1.12752, 1, 1, 1, 1, 1,
0.6435035, 0.2894747, 1.368656, 1, 1, 1, 1, 1,
0.6509844, 0.891746, 1.969824, 1, 1, 1, 1, 1,
0.6534204, 0.896803, 0.07095744, 1, 1, 1, 1, 1,
0.6540876, -0.4910283, 2.929535, 1, 1, 1, 1, 1,
0.6566191, -0.07692733, 2.04735, 1, 1, 1, 1, 1,
0.6577812, 0.3841678, 0.3389035, 1, 1, 1, 1, 1,
0.6603633, 1.400403, 0.1383268, 1, 1, 1, 1, 1,
0.6631007, 1.089038, 1.571629, 1, 1, 1, 1, 1,
0.6696104, -1.800772, 2.322832, 1, 1, 1, 1, 1,
0.6813, -1.603073, 2.081661, 1, 1, 1, 1, 1,
0.6884427, 2.563021, 1.832832, 0, 0, 1, 1, 1,
0.6898698, -0.00361525, 0.6698354, 1, 0, 0, 1, 1,
0.6899937, 1.16636, 1.7049, 1, 0, 0, 1, 1,
0.6941844, -0.5907969, 1.890075, 1, 0, 0, 1, 1,
0.6972033, -2.067007, 2.55131, 1, 0, 0, 1, 1,
0.698401, -0.638272, 1.629392, 1, 0, 0, 1, 1,
0.6995587, 0.07983169, 0.1545273, 0, 0, 0, 1, 1,
0.7050768, 1.554494, 0.7630418, 0, 0, 0, 1, 1,
0.7061796, 0.5709601, 0.5484074, 0, 0, 0, 1, 1,
0.7088333, 0.2469894, 2.557715, 0, 0, 0, 1, 1,
0.7101672, 0.04259812, 2.235437, 0, 0, 0, 1, 1,
0.7111059, 0.6548774, 0.9982242, 0, 0, 0, 1, 1,
0.7177944, -3.092007, 3.58315, 0, 0, 0, 1, 1,
0.7180628, -0.9476767, 1.648561, 1, 1, 1, 1, 1,
0.7195293, 0.1461999, 1.950318, 1, 1, 1, 1, 1,
0.7207209, -0.4955285, 3.43446, 1, 1, 1, 1, 1,
0.7207679, 0.6839366, -1.502262, 1, 1, 1, 1, 1,
0.7213676, -1.049254, 2.855814, 1, 1, 1, 1, 1,
0.7237814, -0.4555205, 2.862206, 1, 1, 1, 1, 1,
0.7247785, 0.355306, 1.717066, 1, 1, 1, 1, 1,
0.7263255, -0.5596762, 1.147724, 1, 1, 1, 1, 1,
0.7330453, 0.8184013, 0.7103415, 1, 1, 1, 1, 1,
0.7455483, -1.857627, 2.781394, 1, 1, 1, 1, 1,
0.7482694, 0.02256995, 0.09605289, 1, 1, 1, 1, 1,
0.7555502, -1.721231, 0.7578561, 1, 1, 1, 1, 1,
0.760436, -0.1032934, 0.6367682, 1, 1, 1, 1, 1,
0.7660136, 0.415035, 1.615375, 1, 1, 1, 1, 1,
0.7669277, -0.8834208, 1.88129, 1, 1, 1, 1, 1,
0.7699947, -0.3774311, 3.570271, 0, 0, 1, 1, 1,
0.7861935, 0.4717217, 1.701821, 1, 0, 0, 1, 1,
0.7896866, 0.07833824, 3.458104, 1, 0, 0, 1, 1,
0.7907041, 0.8635189, 1.122121, 1, 0, 0, 1, 1,
0.7929654, 0.3976482, 1.553497, 1, 0, 0, 1, 1,
0.7960792, 1.02832, 0.9233909, 1, 0, 0, 1, 1,
0.8019922, -0.4070496, 2.080177, 0, 0, 0, 1, 1,
0.8073471, 1.785841, 1.759699, 0, 0, 0, 1, 1,
0.8168723, 0.8886828, -1.110369, 0, 0, 0, 1, 1,
0.8203228, 0.1748562, 0.5564172, 0, 0, 0, 1, 1,
0.8207029, -0.7536888, 1.882999, 0, 0, 0, 1, 1,
0.8283958, -1.246876, 3.115169, 0, 0, 0, 1, 1,
0.8296675, 1.693686, 0.8590444, 0, 0, 0, 1, 1,
0.8297659, 0.4653006, 0.1137239, 1, 1, 1, 1, 1,
0.8349831, -1.099626, 3.287284, 1, 1, 1, 1, 1,
0.8386674, 1.497461, 0.5169749, 1, 1, 1, 1, 1,
0.8405022, 0.8229349, 0.6571026, 1, 1, 1, 1, 1,
0.8406198, 0.1082075, 2.940351, 1, 1, 1, 1, 1,
0.8412682, 0.3008639, 2.587909, 1, 1, 1, 1, 1,
0.8449684, 0.5420644, 2.04369, 1, 1, 1, 1, 1,
0.85409, -0.1216916, 0.9388298, 1, 1, 1, 1, 1,
0.8558365, 0.244284, 2.738388, 1, 1, 1, 1, 1,
0.8620381, -2.264589, 4.941505, 1, 1, 1, 1, 1,
0.8680758, 1.56577, -0.915926, 1, 1, 1, 1, 1,
0.8798642, -1.090767, 1.368829, 1, 1, 1, 1, 1,
0.8825111, -0.1929769, 2.613338, 1, 1, 1, 1, 1,
0.8889367, -1.720379, 2.589151, 1, 1, 1, 1, 1,
0.8911803, 0.5611858, 0.5387648, 1, 1, 1, 1, 1,
0.8930305, 0.02104096, 1.456745, 0, 0, 1, 1, 1,
0.8940243, 0.618456, 0.6266103, 1, 0, 0, 1, 1,
0.8948662, 0.9945863, 1.500869, 1, 0, 0, 1, 1,
0.8994063, 0.005469821, 0.4209703, 1, 0, 0, 1, 1,
0.9046572, 0.2974363, 3.324573, 1, 0, 0, 1, 1,
0.9081371, 1.326527, 0.7354241, 1, 0, 0, 1, 1,
0.9117568, 0.8620254, -1.012203, 0, 0, 0, 1, 1,
0.9218879, 0.6043652, -1.563012, 0, 0, 0, 1, 1,
0.9227685, -1.886182, 3.160013, 0, 0, 0, 1, 1,
0.9264346, 0.2991982, 1.243769, 0, 0, 0, 1, 1,
0.9266171, 0.5046349, 0.2578882, 0, 0, 0, 1, 1,
0.9283749, -0.4441772, 1.608273, 0, 0, 0, 1, 1,
0.9291639, 0.6987751, -0.2361241, 0, 0, 0, 1, 1,
0.9331225, -1.851529, 1.618268, 1, 1, 1, 1, 1,
0.9347529, -0.8219017, 2.280315, 1, 1, 1, 1, 1,
0.9426685, -0.6857833, 0.5822606, 1, 1, 1, 1, 1,
0.9429135, 0.2986421, 1.09676, 1, 1, 1, 1, 1,
0.9437258, -2.213901, 2.01497, 1, 1, 1, 1, 1,
0.9466962, 2.206317, -1.816239, 1, 1, 1, 1, 1,
0.9483694, 0.5184056, 1.594383, 1, 1, 1, 1, 1,
0.9514125, -0.8576198, 1.354921, 1, 1, 1, 1, 1,
0.9562421, -0.4022246, 2.11005, 1, 1, 1, 1, 1,
0.9613983, -0.03333065, 1.266335, 1, 1, 1, 1, 1,
0.9623808, 0.6770043, 1.175944, 1, 1, 1, 1, 1,
0.9679937, 0.02591271, 0.8011433, 1, 1, 1, 1, 1,
0.9763272, -0.2696016, 3.790316, 1, 1, 1, 1, 1,
0.9838376, -0.1890007, 1.990254, 1, 1, 1, 1, 1,
0.985994, 0.6420639, 0.4095179, 1, 1, 1, 1, 1,
0.9889048, 0.8270813, 2.415462, 0, 0, 1, 1, 1,
0.9909053, 0.6948041, 0.8363357, 1, 0, 0, 1, 1,
0.9919373, 0.8663964, 0.782308, 1, 0, 0, 1, 1,
0.9928308, -0.9139043, 2.831571, 1, 0, 0, 1, 1,
0.9963238, 0.1223218, -0.3060966, 1, 0, 0, 1, 1,
1.002073, 0.7215487, 0.5355086, 1, 0, 0, 1, 1,
1.002241, -0.16439, 0.9110038, 0, 0, 0, 1, 1,
1.004102, -1.672211, 1.838738, 0, 0, 0, 1, 1,
1.012022, -0.1869814, 0.9568049, 0, 0, 0, 1, 1,
1.012467, -0.124577, 1.98522, 0, 0, 0, 1, 1,
1.025208, -1.160316, 0.9077131, 0, 0, 0, 1, 1,
1.027268, -0.06621879, 1.579312, 0, 0, 0, 1, 1,
1.028098, 1.00281, 1.910817, 0, 0, 0, 1, 1,
1.029982, 0.5901255, -0.3871444, 1, 1, 1, 1, 1,
1.041502, 0.6680714, 1.723531, 1, 1, 1, 1, 1,
1.045443, 1.046159, 1.052346, 1, 1, 1, 1, 1,
1.046493, 1.386914, 1.230886, 1, 1, 1, 1, 1,
1.04991, -0.6875328, 1.829958, 1, 1, 1, 1, 1,
1.053272, -0.5987783, 0.578679, 1, 1, 1, 1, 1,
1.057782, 1.443024, 2.700008, 1, 1, 1, 1, 1,
1.059121, 1.026543, -0.05237493, 1, 1, 1, 1, 1,
1.060336, 0.9009662, 0.501625, 1, 1, 1, 1, 1,
1.063763, -0.2563022, 3.900088, 1, 1, 1, 1, 1,
1.069566, 0.8217696, 1.096367, 1, 1, 1, 1, 1,
1.070264, -0.4375775, 3.231802, 1, 1, 1, 1, 1,
1.072225, 1.136544, 0.041375, 1, 1, 1, 1, 1,
1.074622, 0.8604496, 1.034412, 1, 1, 1, 1, 1,
1.074822, -0.6943287, 1.72844, 1, 1, 1, 1, 1,
1.074991, -0.2677603, 2.077464, 0, 0, 1, 1, 1,
1.080814, -1.086064, 0.7380368, 1, 0, 0, 1, 1,
1.084121, 1.579816, 0.6690857, 1, 0, 0, 1, 1,
1.088826, -0.4341725, 1.731895, 1, 0, 0, 1, 1,
1.09048, -1.248442, 1.090139, 1, 0, 0, 1, 1,
1.095064, 1.854714, -1.079926, 1, 0, 0, 1, 1,
1.097729, -0.6309565, 4.168766, 0, 0, 0, 1, 1,
1.102139, 1.394948, 1.414163, 0, 0, 0, 1, 1,
1.10261, 0.8452727, 1.007654, 0, 0, 0, 1, 1,
1.106883, -1.708013, 2.816918, 0, 0, 0, 1, 1,
1.108178, 2.073724, -0.03092978, 0, 0, 0, 1, 1,
1.113967, -0.900005, 2.801621, 0, 0, 0, 1, 1,
1.117485, 0.2721265, 0.3482504, 0, 0, 0, 1, 1,
1.125397, -0.06972471, 0.7475268, 1, 1, 1, 1, 1,
1.128531, 0.7720454, 1.582805, 1, 1, 1, 1, 1,
1.132086, 0.7543687, 1.071677, 1, 1, 1, 1, 1,
1.133386, -0.16109, 1.813954, 1, 1, 1, 1, 1,
1.139506, -1.878105, 2.616865, 1, 1, 1, 1, 1,
1.147466, 1.759962, 0.8443348, 1, 1, 1, 1, 1,
1.150188, 0.6388701, -0.2243539, 1, 1, 1, 1, 1,
1.152377, -1.567758, 2.82159, 1, 1, 1, 1, 1,
1.157905, -1.702529, 4.333801, 1, 1, 1, 1, 1,
1.162308, 1.00544, 1.363491, 1, 1, 1, 1, 1,
1.162473, 2.160327, 1.097384, 1, 1, 1, 1, 1,
1.167549, 1.272358, 0.08282907, 1, 1, 1, 1, 1,
1.168497, -0.2250817, 1.884493, 1, 1, 1, 1, 1,
1.178831, -0.2548729, 2.039126, 1, 1, 1, 1, 1,
1.179176, 0.08676609, 1.496189, 1, 1, 1, 1, 1,
1.181364, -0.3004286, 1.311086, 0, 0, 1, 1, 1,
1.185922, -0.5643985, 2.551934, 1, 0, 0, 1, 1,
1.191054, -1.512807, 2.076411, 1, 0, 0, 1, 1,
1.191994, 0.01561733, 0.4235852, 1, 0, 0, 1, 1,
1.195944, 0.2516504, 2.250257, 1, 0, 0, 1, 1,
1.199106, -0.007312842, 3.048115, 1, 0, 0, 1, 1,
1.200424, -0.8854258, 2.601305, 0, 0, 0, 1, 1,
1.201037, 0.2747728, -0.6694283, 0, 0, 0, 1, 1,
1.20154, 0.1732424, 3.132718, 0, 0, 0, 1, 1,
1.207244, -1.265817, 2.065568, 0, 0, 0, 1, 1,
1.219918, -1.275464, 2.674256, 0, 0, 0, 1, 1,
1.224187, 0.2380222, 1.969518, 0, 0, 0, 1, 1,
1.224301, -1.218675, 1.446693, 0, 0, 0, 1, 1,
1.225276, -0.6321453, 2.475691, 1, 1, 1, 1, 1,
1.237586, 1.214244, 0.7902804, 1, 1, 1, 1, 1,
1.257511, -1.23848, 2.955305, 1, 1, 1, 1, 1,
1.257626, 0.4880835, -0.6268172, 1, 1, 1, 1, 1,
1.259938, -0.2196493, 1.714459, 1, 1, 1, 1, 1,
1.275271, 1.61511, 0.9674635, 1, 1, 1, 1, 1,
1.27636, -0.1622132, 0.6516616, 1, 1, 1, 1, 1,
1.278486, -1.710694, 3.235731, 1, 1, 1, 1, 1,
1.280464, 0.6059687, 1.176666, 1, 1, 1, 1, 1,
1.289528, -2.434013, 2.230965, 1, 1, 1, 1, 1,
1.291399, -0.6698417, 1.085225, 1, 1, 1, 1, 1,
1.297262, 1.65622, -0.6709336, 1, 1, 1, 1, 1,
1.298012, 0.1668188, 1.080351, 1, 1, 1, 1, 1,
1.298546, 0.4787044, 2.101585, 1, 1, 1, 1, 1,
1.300678, -0.8653822, 2.743782, 1, 1, 1, 1, 1,
1.301966, -0.02851656, 0.934293, 0, 0, 1, 1, 1,
1.307342, -0.05859447, 0.624667, 1, 0, 0, 1, 1,
1.308026, 0.4230582, -0.08938833, 1, 0, 0, 1, 1,
1.326006, -0.1410455, 2.098079, 1, 0, 0, 1, 1,
1.332091, -1.035959, 2.174444, 1, 0, 0, 1, 1,
1.332988, 1.152557, -0.8589744, 1, 0, 0, 1, 1,
1.334576, 0.00583916, 2.138369, 0, 0, 0, 1, 1,
1.340092, 0.09160526, 1.925859, 0, 0, 0, 1, 1,
1.349415, 1.547165, -0.2442269, 0, 0, 0, 1, 1,
1.357678, 1.406094, 1.474807, 0, 0, 0, 1, 1,
1.373622, 0.1978706, 1.883667, 0, 0, 0, 1, 1,
1.382009, 0.5506904, 1.222343, 0, 0, 0, 1, 1,
1.387056, -1.134456, 1.622065, 0, 0, 0, 1, 1,
1.388355, -2.147824, 2.324777, 1, 1, 1, 1, 1,
1.415949, 0.2948533, 3.708258, 1, 1, 1, 1, 1,
1.417683, 0.721581, 1.868724, 1, 1, 1, 1, 1,
1.422687, -1.057084, 2.403111, 1, 1, 1, 1, 1,
1.43485, 1.310906, 0.9840853, 1, 1, 1, 1, 1,
1.436262, -0.2644826, 2.070544, 1, 1, 1, 1, 1,
1.439433, -0.5531054, 2.954229, 1, 1, 1, 1, 1,
1.442868, -0.06148406, 2.341417, 1, 1, 1, 1, 1,
1.454816, 0.0884499, 1.126099, 1, 1, 1, 1, 1,
1.460714, -0.4364627, 2.640421, 1, 1, 1, 1, 1,
1.462894, -1.072989, 0.7283372, 1, 1, 1, 1, 1,
1.466372, 1.437356, 2.287028, 1, 1, 1, 1, 1,
1.467488, 0.2680056, 0.5068821, 1, 1, 1, 1, 1,
1.472883, -0.4466821, 2.005539, 1, 1, 1, 1, 1,
1.488819, 1.393623, 2.879125, 1, 1, 1, 1, 1,
1.506716, 0.4193445, 0.4109802, 0, 0, 1, 1, 1,
1.509627, -0.8522843, 2.694165, 1, 0, 0, 1, 1,
1.514456, 0.124886, 0.5625318, 1, 0, 0, 1, 1,
1.545192, -0.7649661, 2.380161, 1, 0, 0, 1, 1,
1.548454, -1.489278, 4.315366, 1, 0, 0, 1, 1,
1.549244, 0.7077894, 1.486256, 1, 0, 0, 1, 1,
1.54943, -0.2413795, 1.615401, 0, 0, 0, 1, 1,
1.55126, -2.227082, 3.700618, 0, 0, 0, 1, 1,
1.562279, 0.8432775, 0.06995893, 0, 0, 0, 1, 1,
1.572417, 0.2749519, -0.6024261, 0, 0, 0, 1, 1,
1.573298, 0.1634465, 4.092501, 0, 0, 0, 1, 1,
1.579921, 2.664735, 1.295059, 0, 0, 0, 1, 1,
1.5957, -0.2966234, 2.055551, 0, 0, 0, 1, 1,
1.601892, 0.1587041, 0.5097133, 1, 1, 1, 1, 1,
1.605213, -1.692002, 1.179927, 1, 1, 1, 1, 1,
1.615673, 0.8349982, 1.926066, 1, 1, 1, 1, 1,
1.640602, -0.5243599, 1.395238, 1, 1, 1, 1, 1,
1.646594, 0.4449621, 1.412956, 1, 1, 1, 1, 1,
1.65476, 0.292062, 2.131418, 1, 1, 1, 1, 1,
1.659446, 0.3524151, 0.08828676, 1, 1, 1, 1, 1,
1.664297, 0.3450379, 0.5550501, 1, 1, 1, 1, 1,
1.69433, -0.7912828, 3.493929, 1, 1, 1, 1, 1,
1.716492, 2.77587, 0.8429283, 1, 1, 1, 1, 1,
1.724039, 0.6052565, 0.8288387, 1, 1, 1, 1, 1,
1.725013, -0.7968932, 1.514946, 1, 1, 1, 1, 1,
1.726131, -0.1453107, 0.07664615, 1, 1, 1, 1, 1,
1.756075, 0.1787953, 1.14834, 1, 1, 1, 1, 1,
1.770031, -0.01389417, 1.028701, 1, 1, 1, 1, 1,
1.774937, -0.835609, 2.595831, 0, 0, 1, 1, 1,
1.78557, -0.8127571, -0.5066683, 1, 0, 0, 1, 1,
1.789597, -0.03799031, 0.5155985, 1, 0, 0, 1, 1,
1.797358, -0.4883795, 2.122433, 1, 0, 0, 1, 1,
1.798219, -0.9264318, 2.336582, 1, 0, 0, 1, 1,
1.81363, 0.568849, -0.5857072, 1, 0, 0, 1, 1,
1.831028, 2.324341, 1.178135, 0, 0, 0, 1, 1,
1.838385, 0.4378664, 1.045513, 0, 0, 0, 1, 1,
1.841741, 0.7509806, 2.398433, 0, 0, 0, 1, 1,
1.854223, 1.441619, 2.113724, 0, 0, 0, 1, 1,
1.877263, 1.083022, 1.232231, 0, 0, 0, 1, 1,
1.879295, 1.356281, 1.649002, 0, 0, 0, 1, 1,
1.88218, -0.4219188, 1.57795, 0, 0, 0, 1, 1,
1.891978, 1.081974, 1.530668, 1, 1, 1, 1, 1,
1.89249, -1.179849, 2.055752, 1, 1, 1, 1, 1,
1.893639, -0.08297612, 0.9123836, 1, 1, 1, 1, 1,
1.901708, 0.7170084, 1.892107, 1, 1, 1, 1, 1,
1.903381, 0.6754349, 0.6168032, 1, 1, 1, 1, 1,
1.907549, 0.9333931, 1.824876, 1, 1, 1, 1, 1,
1.917676, -0.7166822, 3.090949, 1, 1, 1, 1, 1,
1.919, 1.768463, 1.695644, 1, 1, 1, 1, 1,
1.926311, 0.5549887, -0.5481995, 1, 1, 1, 1, 1,
1.926843, -0.4482921, 2.971404, 1, 1, 1, 1, 1,
1.940876, -1.046259, 2.997302, 1, 1, 1, 1, 1,
1.94282, -1.551683, 1.894318, 1, 1, 1, 1, 1,
1.947952, 1.141046, 2.045487, 1, 1, 1, 1, 1,
2.01053, -0.3077893, 2.984682, 1, 1, 1, 1, 1,
2.02781, 0.218977, 0.04412293, 1, 1, 1, 1, 1,
2.052143, -0.0406739, 1.800946, 0, 0, 1, 1, 1,
2.087458, 0.4591944, 0.2082166, 1, 0, 0, 1, 1,
2.094708, 1.027898, 0.8713436, 1, 0, 0, 1, 1,
2.106234, 0.01330641, 1.585872, 1, 0, 0, 1, 1,
2.130568, 0.4517622, 1.403693, 1, 0, 0, 1, 1,
2.208471, -0.7699358, 1.177035, 1, 0, 0, 1, 1,
2.293768, 0.9736876, 1.073569, 0, 0, 0, 1, 1,
2.321769, 1.044276, 1.750113, 0, 0, 0, 1, 1,
2.34217, -0.1342609, 0.2931873, 0, 0, 0, 1, 1,
2.344026, 2.360736, -0.01596861, 0, 0, 0, 1, 1,
2.345816, -0.7782087, 2.466718, 0, 0, 0, 1, 1,
2.405529, -0.3115175, 2.923044, 0, 0, 0, 1, 1,
2.450897, 0.6054888, 1.858778, 0, 0, 0, 1, 1,
2.474349, 1.293711, 2.339451, 1, 1, 1, 1, 1,
2.5633, -0.6135949, 1.382617, 1, 1, 1, 1, 1,
2.594635, 1.064851, 1.20975, 1, 1, 1, 1, 1,
2.616158, -0.9922711, 1.523875, 1, 1, 1, 1, 1,
2.639167, -0.6567232, 2.280611, 1, 1, 1, 1, 1,
2.917572, 1.396531, 0.1213411, 1, 1, 1, 1, 1,
2.933774, 0.4733252, -0.1966744, 1, 1, 1, 1, 1
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
var radius = 9.446943;
var distance = 33.18199;
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
mvMatrix.translate( 0.1918734, 0.07261252, -0.03791595 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.18199);
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
