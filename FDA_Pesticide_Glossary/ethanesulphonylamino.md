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
-3.601211, -2.01588, -2.700618, 1, 0, 0, 1,
-3.351451, -1.312552, -2.117557, 1, 0.007843138, 0, 1,
-3.26514, -1.164136, -2.015107, 1, 0.01176471, 0, 1,
-2.925363, -0.5156919, -1.969246, 1, 0.01960784, 0, 1,
-2.828248, 2.403376, 0.3241207, 1, 0.02352941, 0, 1,
-2.725433, -1.078035, -1.63862, 1, 0.03137255, 0, 1,
-2.510635, 1.018546, -1.907848, 1, 0.03529412, 0, 1,
-2.4821, -1.799942, -2.134256, 1, 0.04313726, 0, 1,
-2.38386, 0.5060017, -3.494804, 1, 0.04705882, 0, 1,
-2.383727, 1.762606, -2.378734, 1, 0.05490196, 0, 1,
-2.368493, -0.4696623, -3.618769, 1, 0.05882353, 0, 1,
-2.362013, 0.3423744, -2.045367, 1, 0.06666667, 0, 1,
-2.326856, 0.4535661, -1.865293, 1, 0.07058824, 0, 1,
-2.308029, 0.4131904, -0.004050356, 1, 0.07843138, 0, 1,
-2.270261, -1.493066, -2.350685, 1, 0.08235294, 0, 1,
-2.195284, 1.360709, 0.4244224, 1, 0.09019608, 0, 1,
-2.190566, 0.5565036, -0.3524058, 1, 0.09411765, 0, 1,
-2.158655, -0.02731829, -3.390707, 1, 0.1019608, 0, 1,
-2.103575, 0.3191451, -1.23279, 1, 0.1098039, 0, 1,
-2.103109, 0.01596916, -2.432377, 1, 0.1137255, 0, 1,
-2.10265, -0.4159102, -2.18306, 1, 0.1215686, 0, 1,
-2.053157, -0.07509169, -0.1822505, 1, 0.1254902, 0, 1,
-2.048482, -0.8663845, -1.502641, 1, 0.1333333, 0, 1,
-1.97699, 0.2393807, -2.164047, 1, 0.1372549, 0, 1,
-1.976853, 0.1648506, -1.5526, 1, 0.145098, 0, 1,
-1.909401, -0.5414588, -0.4954742, 1, 0.1490196, 0, 1,
-1.904686, -0.6580586, -1.975227, 1, 0.1568628, 0, 1,
-1.896809, 0.8698486, -1.487165, 1, 0.1607843, 0, 1,
-1.886961, 0.3218689, -2.653832, 1, 0.1686275, 0, 1,
-1.885898, 1.067616, -1.716065, 1, 0.172549, 0, 1,
-1.858204, -1.308771, -3.286972, 1, 0.1803922, 0, 1,
-1.846174, -0.851087, -2.275903, 1, 0.1843137, 0, 1,
-1.816172, -1.216965, -4.812709, 1, 0.1921569, 0, 1,
-1.807701, -0.1604024, -2.265992, 1, 0.1960784, 0, 1,
-1.802927, 0.3282134, -3.012306, 1, 0.2039216, 0, 1,
-1.787184, 0.4766245, -1.648986, 1, 0.2117647, 0, 1,
-1.782138, 1.34957, -0.2728645, 1, 0.2156863, 0, 1,
-1.774937, 0.4237224, -1.665533, 1, 0.2235294, 0, 1,
-1.768848, -0.6096355, -1.432826, 1, 0.227451, 0, 1,
-1.757457, 0.7774376, -2.850255, 1, 0.2352941, 0, 1,
-1.73824, 2.245973, 2.249705, 1, 0.2392157, 0, 1,
-1.73729, -1.638159, -3.018946, 1, 0.2470588, 0, 1,
-1.736814, -1.050394, -2.557354, 1, 0.2509804, 0, 1,
-1.735944, -1.039321, -2.491583, 1, 0.2588235, 0, 1,
-1.731029, -0.5016549, -1.574363, 1, 0.2627451, 0, 1,
-1.730044, -0.01205235, -0.7177526, 1, 0.2705882, 0, 1,
-1.72929, 1.189934, -1.733223, 1, 0.2745098, 0, 1,
-1.68646, 0.5859022, -2.548331, 1, 0.282353, 0, 1,
-1.67951, -0.7935334, -1.482326, 1, 0.2862745, 0, 1,
-1.66759, 0.4387438, -0.7524827, 1, 0.2941177, 0, 1,
-1.665554, -0.5026443, -1.705223, 1, 0.3019608, 0, 1,
-1.655081, -0.5667775, -2.791742, 1, 0.3058824, 0, 1,
-1.648243, -0.5518507, -1.204805, 1, 0.3137255, 0, 1,
-1.639374, -0.1843508, -3.595308, 1, 0.3176471, 0, 1,
-1.63754, -1.258798, -3.455484, 1, 0.3254902, 0, 1,
-1.635343, 0.6285816, 0.4057996, 1, 0.3294118, 0, 1,
-1.633751, 0.5777079, -0.9033092, 1, 0.3372549, 0, 1,
-1.632298, 0.8249515, -1.441245, 1, 0.3411765, 0, 1,
-1.610101, 1.404883, 0.1015255, 1, 0.3490196, 0, 1,
-1.602275, -0.2956161, -0.7848938, 1, 0.3529412, 0, 1,
-1.587623, -0.02893984, -0.8742108, 1, 0.3607843, 0, 1,
-1.581161, 1.146977, -1.368641, 1, 0.3647059, 0, 1,
-1.579416, 0.335438, -0.3115892, 1, 0.372549, 0, 1,
-1.576784, 0.5125838, -1.283989, 1, 0.3764706, 0, 1,
-1.574742, -0.3719516, -2.804747, 1, 0.3843137, 0, 1,
-1.574508, 0.4256504, -0.4191212, 1, 0.3882353, 0, 1,
-1.566906, -0.2817843, -3.21007, 1, 0.3960784, 0, 1,
-1.564935, -0.1384402, -1.61833, 1, 0.4039216, 0, 1,
-1.558118, -1.56799, -0.5823823, 1, 0.4078431, 0, 1,
-1.547262, -1.354316, -1.006231, 1, 0.4156863, 0, 1,
-1.540356, -1.602003, -3.631233, 1, 0.4196078, 0, 1,
-1.535592, 0.842193, -2.670874, 1, 0.427451, 0, 1,
-1.534209, 1.440421, -0.5780981, 1, 0.4313726, 0, 1,
-1.523008, 1.855525, -1.091387, 1, 0.4392157, 0, 1,
-1.51844, -0.07894336, -2.036863, 1, 0.4431373, 0, 1,
-1.518126, 0.6591293, -2.507255, 1, 0.4509804, 0, 1,
-1.513463, 1.05003, -0.4722956, 1, 0.454902, 0, 1,
-1.51047, 1.354635, -1.592622, 1, 0.4627451, 0, 1,
-1.510112, 1.611805, 0.3427177, 1, 0.4666667, 0, 1,
-1.506702, -0.3663986, -3.630775, 1, 0.4745098, 0, 1,
-1.499053, -0.07120921, -2.002822, 1, 0.4784314, 0, 1,
-1.47791, 0.2010047, -0.1214859, 1, 0.4862745, 0, 1,
-1.47176, -0.7930343, -0.1000561, 1, 0.4901961, 0, 1,
-1.467926, -0.5622025, -1.325871, 1, 0.4980392, 0, 1,
-1.456931, -0.2768778, -0.4820485, 1, 0.5058824, 0, 1,
-1.455915, -2.762625, -2.997849, 1, 0.509804, 0, 1,
-1.4554, 1.729134, -1.119406, 1, 0.5176471, 0, 1,
-1.451777, -1.214314, -3.83765, 1, 0.5215687, 0, 1,
-1.446463, -0.171444, -2.367892, 1, 0.5294118, 0, 1,
-1.442528, -1.347745, -0.6287002, 1, 0.5333334, 0, 1,
-1.439183, -0.04720129, -1.134265, 1, 0.5411765, 0, 1,
-1.438689, 0.3547873, -0.7167316, 1, 0.5450981, 0, 1,
-1.435359, 2.012564, 0.1619077, 1, 0.5529412, 0, 1,
-1.435223, 2.243192, 0.344862, 1, 0.5568628, 0, 1,
-1.435151, -0.01520167, -2.999039, 1, 0.5647059, 0, 1,
-1.430063, 0.6638541, -0.4070207, 1, 0.5686275, 0, 1,
-1.425651, 1.291071, -0.714167, 1, 0.5764706, 0, 1,
-1.420762, 0.8928452, -1.231178, 1, 0.5803922, 0, 1,
-1.417703, 0.5041358, 0.3848762, 1, 0.5882353, 0, 1,
-1.410747, 0.976851, -3.078308, 1, 0.5921569, 0, 1,
-1.405811, -0.8963971, -3.283691, 1, 0.6, 0, 1,
-1.403602, -0.1250867, -3.053764, 1, 0.6078432, 0, 1,
-1.399622, -0.589541, 0.1305824, 1, 0.6117647, 0, 1,
-1.394296, 0.007514544, -2.50109, 1, 0.6196079, 0, 1,
-1.393184, -0.1824664, -3.352035, 1, 0.6235294, 0, 1,
-1.389372, 0.07845685, -0.6963019, 1, 0.6313726, 0, 1,
-1.387065, -1.419308, -3.304149, 1, 0.6352941, 0, 1,
-1.385533, 0.4408353, -0.6820774, 1, 0.6431373, 0, 1,
-1.379758, 0.8341606, -0.6833652, 1, 0.6470588, 0, 1,
-1.376062, -0.1528107, -2.359125, 1, 0.654902, 0, 1,
-1.376051, 0.4131893, -2.846646, 1, 0.6588235, 0, 1,
-1.350104, 0.4045527, -0.8080798, 1, 0.6666667, 0, 1,
-1.3472, 0.916943, -1.111732, 1, 0.6705883, 0, 1,
-1.321196, -0.5554868, -1.405959, 1, 0.6784314, 0, 1,
-1.319163, -0.8392042, -3.187135, 1, 0.682353, 0, 1,
-1.316687, 0.00230391, -2.378813, 1, 0.6901961, 0, 1,
-1.311265, -2.057598, -2.744879, 1, 0.6941177, 0, 1,
-1.307703, -0.7299015, -0.05241733, 1, 0.7019608, 0, 1,
-1.298093, 0.1926585, -0.132129, 1, 0.7098039, 0, 1,
-1.296794, 1.209118, -1.543176, 1, 0.7137255, 0, 1,
-1.293998, 0.3992174, -1.112311, 1, 0.7215686, 0, 1,
-1.291186, -1.503411, -2.353346, 1, 0.7254902, 0, 1,
-1.28053, -0.5500668, -3.309265, 1, 0.7333333, 0, 1,
-1.278684, 0.92799, -0.6729504, 1, 0.7372549, 0, 1,
-1.271171, -0.8624043, -2.592634, 1, 0.7450981, 0, 1,
-1.268854, -1.391512, -1.84065, 1, 0.7490196, 0, 1,
-1.268711, 1.016354, -0.07749387, 1, 0.7568628, 0, 1,
-1.262865, 0.01771065, -0.8586583, 1, 0.7607843, 0, 1,
-1.260127, -0.2900169, -0.6721185, 1, 0.7686275, 0, 1,
-1.255609, -0.0951103, -3.316249, 1, 0.772549, 0, 1,
-1.251216, -0.0730873, -1.776227, 1, 0.7803922, 0, 1,
-1.247428, -1.829212, -1.417395, 1, 0.7843137, 0, 1,
-1.243139, -1.29028, -3.598578, 1, 0.7921569, 0, 1,
-1.242425, -0.8190457, -3.433951, 1, 0.7960784, 0, 1,
-1.239974, -0.8196471, -1.843233, 1, 0.8039216, 0, 1,
-1.22949, -0.2323367, -1.537757, 1, 0.8117647, 0, 1,
-1.226882, -0.7703716, -2.837951, 1, 0.8156863, 0, 1,
-1.225056, -0.1478283, -1.789082, 1, 0.8235294, 0, 1,
-1.21821, -0.1442997, -1.210279, 1, 0.827451, 0, 1,
-1.207218, -0.2560488, -2.197044, 1, 0.8352941, 0, 1,
-1.198196, 1.0604, 0.09266129, 1, 0.8392157, 0, 1,
-1.194686, 0.7579377, -0.4699105, 1, 0.8470588, 0, 1,
-1.188016, -0.7447884, -0.7927449, 1, 0.8509804, 0, 1,
-1.173426, 0.1855936, -2.197497, 1, 0.8588235, 0, 1,
-1.166596, -0.2470074, -2.406677, 1, 0.8627451, 0, 1,
-1.164546, 1.973088, -0.717293, 1, 0.8705882, 0, 1,
-1.162976, 2.130537, -0.6157893, 1, 0.8745098, 0, 1,
-1.158779, 1.158503, -0.2929282, 1, 0.8823529, 0, 1,
-1.154986, -1.495465, -3.603234, 1, 0.8862745, 0, 1,
-1.144496, -0.5545146, 0.2161377, 1, 0.8941177, 0, 1,
-1.141963, -1.439292, -1.850502, 1, 0.8980392, 0, 1,
-1.133512, 1.337194, -1.111058, 1, 0.9058824, 0, 1,
-1.125672, 0.6412418, -0.6373286, 1, 0.9137255, 0, 1,
-1.122183, 0.1050001, -3.095265, 1, 0.9176471, 0, 1,
-1.121539, 0.4048588, -2.620329, 1, 0.9254902, 0, 1,
-1.120375, 1.848695, -1.715298, 1, 0.9294118, 0, 1,
-1.116681, -0.8064198, -1.513656, 1, 0.9372549, 0, 1,
-1.111463, -0.2987182, -2.268233, 1, 0.9411765, 0, 1,
-1.109832, -0.6351321, -2.41864, 1, 0.9490196, 0, 1,
-1.102916, -0.2220166, -1.608534, 1, 0.9529412, 0, 1,
-1.101589, -0.08634566, -3.05118, 1, 0.9607843, 0, 1,
-1.096767, 0.2604717, 0.4906993, 1, 0.9647059, 0, 1,
-1.08971, -0.8335662, 0.3398425, 1, 0.972549, 0, 1,
-1.089185, -0.02690337, -2.810546, 1, 0.9764706, 0, 1,
-1.087042, -0.3229204, -0.5511503, 1, 0.9843137, 0, 1,
-1.084515, -0.2360474, -1.040677, 1, 0.9882353, 0, 1,
-1.078918, 1.114587, -0.2139005, 1, 0.9960784, 0, 1,
-1.058518, -0.3488816, -1.433852, 0.9960784, 1, 0, 1,
-1.054445, 1.905807, 0.6807537, 0.9921569, 1, 0, 1,
-1.050976, 1.456372, 0.7469442, 0.9843137, 1, 0, 1,
-1.050554, -0.494532, -2.456986, 0.9803922, 1, 0, 1,
-1.04198, 0.8344716, -1.556071, 0.972549, 1, 0, 1,
-1.041422, -1.078796, -1.649088, 0.9686275, 1, 0, 1,
-1.036768, 0.1403391, -2.578367, 0.9607843, 1, 0, 1,
-1.02154, 1.062762, -1.453995, 0.9568627, 1, 0, 1,
-1.016033, 0.296954, -1.69571, 0.9490196, 1, 0, 1,
-1.015738, -0.9239917, -2.39473, 0.945098, 1, 0, 1,
-1.013033, 0.9640334, -1.111316, 0.9372549, 1, 0, 1,
-1.007362, -1.903566, -2.29145, 0.9333333, 1, 0, 1,
-1.002306, 1.091073, -1.076247, 0.9254902, 1, 0, 1,
-0.9992378, -0.2444682, -2.128866, 0.9215686, 1, 0, 1,
-0.9829202, -0.4549048, -1.514315, 0.9137255, 1, 0, 1,
-0.9797347, -0.04920803, -1.858935, 0.9098039, 1, 0, 1,
-0.9796945, -0.466834, -3.248479, 0.9019608, 1, 0, 1,
-0.9787158, -1.704582, -3.397043, 0.8941177, 1, 0, 1,
-0.9764954, -1.188769, -2.054344, 0.8901961, 1, 0, 1,
-0.9761345, 0.5724971, -0.8041705, 0.8823529, 1, 0, 1,
-0.9744079, -0.1967762, -1.269057, 0.8784314, 1, 0, 1,
-0.9670076, 1.358258, -0.6396914, 0.8705882, 1, 0, 1,
-0.9629019, -1.316281, -2.588559, 0.8666667, 1, 0, 1,
-0.9582396, 0.335011, -2.947087, 0.8588235, 1, 0, 1,
-0.9559706, -0.08939683, -2.482239, 0.854902, 1, 0, 1,
-0.9550238, 0.873015, -2.881678, 0.8470588, 1, 0, 1,
-0.9534172, 0.1526984, 0.1747211, 0.8431373, 1, 0, 1,
-0.9469007, -0.238298, -1.98919, 0.8352941, 1, 0, 1,
-0.9379455, -0.9561973, -3.379953, 0.8313726, 1, 0, 1,
-0.9289702, -0.4549189, -2.591128, 0.8235294, 1, 0, 1,
-0.9133203, 0.07870778, -0.1289743, 0.8196079, 1, 0, 1,
-0.8945406, -1.174116, -2.164281, 0.8117647, 1, 0, 1,
-0.8925366, -0.5168663, -2.178357, 0.8078431, 1, 0, 1,
-0.8922677, 0.3963832, -0.1797721, 0.8, 1, 0, 1,
-0.8884452, 0.5135093, -1.389522, 0.7921569, 1, 0, 1,
-0.8828416, 1.106667, 0.1027049, 0.7882353, 1, 0, 1,
-0.8800021, -0.5601996, -1.455669, 0.7803922, 1, 0, 1,
-0.8763029, -0.5268379, -1.767063, 0.7764706, 1, 0, 1,
-0.8752303, 2.054858, -0.492452, 0.7686275, 1, 0, 1,
-0.8710544, -0.2600596, -0.4251045, 0.7647059, 1, 0, 1,
-0.8695472, -0.7622046, -0.9585932, 0.7568628, 1, 0, 1,
-0.8664995, 0.2615874, -0.9251893, 0.7529412, 1, 0, 1,
-0.8643495, -1.433696, -1.804652, 0.7450981, 1, 0, 1,
-0.8633621, 0.2773434, -0.8544109, 0.7411765, 1, 0, 1,
-0.8619485, -1.064106, -4.337107, 0.7333333, 1, 0, 1,
-0.8570933, -1.477592, -2.522795, 0.7294118, 1, 0, 1,
-0.8523166, 0.729979, -1.05753, 0.7215686, 1, 0, 1,
-0.8490075, -0.4033858, -1.924397, 0.7176471, 1, 0, 1,
-0.8485363, 1.739037, -0.8442722, 0.7098039, 1, 0, 1,
-0.8476169, 1.697092, -1.074382, 0.7058824, 1, 0, 1,
-0.8335492, -1.470132, -1.774427, 0.6980392, 1, 0, 1,
-0.8285352, 0.2244767, -1.187314, 0.6901961, 1, 0, 1,
-0.827531, -0.530867, -4.150313, 0.6862745, 1, 0, 1,
-0.8233977, -0.5594931, -0.7186116, 0.6784314, 1, 0, 1,
-0.822538, 0.4017249, -0.2454564, 0.6745098, 1, 0, 1,
-0.8184897, -1.808102, -4.231814, 0.6666667, 1, 0, 1,
-0.8181708, 1.952266, -1.030663, 0.6627451, 1, 0, 1,
-0.813605, -0.629487, -1.270612, 0.654902, 1, 0, 1,
-0.8133519, 0.9658107, -0.03735202, 0.6509804, 1, 0, 1,
-0.8133094, 1.385388, 0.9360409, 0.6431373, 1, 0, 1,
-0.8129176, 0.2881964, 0.0487974, 0.6392157, 1, 0, 1,
-0.8117587, -0.8444017, -3.472049, 0.6313726, 1, 0, 1,
-0.810152, 0.7066798, 0.2847502, 0.627451, 1, 0, 1,
-0.8071845, 0.7506079, -0.9173815, 0.6196079, 1, 0, 1,
-0.798942, -1.405709, -3.210073, 0.6156863, 1, 0, 1,
-0.7947391, -1.705791, -2.347834, 0.6078432, 1, 0, 1,
-0.7933666, -1.251335, -2.182441, 0.6039216, 1, 0, 1,
-0.7890838, -0.2599691, -2.290945, 0.5960785, 1, 0, 1,
-0.7883424, 0.8680112, -0.5473486, 0.5882353, 1, 0, 1,
-0.7874357, 0.2579148, -2.578752, 0.5843138, 1, 0, 1,
-0.781647, 1.234626, -0.5932493, 0.5764706, 1, 0, 1,
-0.7697564, -1.065629, -1.988311, 0.572549, 1, 0, 1,
-0.7579527, -0.8719863, -0.9476207, 0.5647059, 1, 0, 1,
-0.7558926, 0.2012584, -1.910046, 0.5607843, 1, 0, 1,
-0.7523955, 0.1706739, -1.475291, 0.5529412, 1, 0, 1,
-0.7466599, 1.810524, -1.400631, 0.5490196, 1, 0, 1,
-0.7453277, 0.5227128, -4.369471, 0.5411765, 1, 0, 1,
-0.7439745, -0.7672097, -2.825642, 0.5372549, 1, 0, 1,
-0.7390501, 1.375175, -1.050847, 0.5294118, 1, 0, 1,
-0.7370185, -0.6337272, -5.024446, 0.5254902, 1, 0, 1,
-0.736724, 2.452554, 0.7437373, 0.5176471, 1, 0, 1,
-0.7322866, 0.7551291, -0.9375389, 0.5137255, 1, 0, 1,
-0.7321693, -2.522426, -2.87663, 0.5058824, 1, 0, 1,
-0.7283344, -0.8218375, -2.828867, 0.5019608, 1, 0, 1,
-0.7102233, 0.2285413, -1.960204, 0.4941176, 1, 0, 1,
-0.7096432, 0.8855183, -1.135184, 0.4862745, 1, 0, 1,
-0.6917602, 1.143938, -1.465079, 0.4823529, 1, 0, 1,
-0.687242, -0.526745, -2.616615, 0.4745098, 1, 0, 1,
-0.6859291, -0.2826606, -1.214492, 0.4705882, 1, 0, 1,
-0.6790521, 0.3786749, -2.16727, 0.4627451, 1, 0, 1,
-0.6769767, -0.2443279, -1.54484, 0.4588235, 1, 0, 1,
-0.6766698, -0.8965181, -2.798553, 0.4509804, 1, 0, 1,
-0.6759095, -1.353308, -1.7003, 0.4470588, 1, 0, 1,
-0.675722, 1.77505, 0.6628938, 0.4392157, 1, 0, 1,
-0.6742813, 0.3085317, 0.0295145, 0.4352941, 1, 0, 1,
-0.6738028, -0.2113904, -1.966004, 0.427451, 1, 0, 1,
-0.6715649, 0.4875716, -1.4141, 0.4235294, 1, 0, 1,
-0.6677546, -2.23492, -3.057265, 0.4156863, 1, 0, 1,
-0.6609774, 0.6902508, 0.6068056, 0.4117647, 1, 0, 1,
-0.6575145, 1.045529, -0.7546568, 0.4039216, 1, 0, 1,
-0.6559041, 0.8151979, -1.153764, 0.3960784, 1, 0, 1,
-0.6548119, -0.4491487, -1.546496, 0.3921569, 1, 0, 1,
-0.654779, 1.753005, 1.768422, 0.3843137, 1, 0, 1,
-0.6497809, 0.4538077, -1.285609, 0.3803922, 1, 0, 1,
-0.6487643, 0.4875766, -2.823247, 0.372549, 1, 0, 1,
-0.6457576, 1.482599, -0.1693604, 0.3686275, 1, 0, 1,
-0.6432569, -1.690976, -3.284115, 0.3607843, 1, 0, 1,
-0.643178, 0.3928857, -1.390072, 0.3568628, 1, 0, 1,
-0.6421297, -0.4339956, -2.485836, 0.3490196, 1, 0, 1,
-0.6419378, 0.01203427, -1.33654, 0.345098, 1, 0, 1,
-0.6412956, -0.0573927, -2.296263, 0.3372549, 1, 0, 1,
-0.6389394, -0.6571197, -2.274288, 0.3333333, 1, 0, 1,
-0.6373391, -0.570376, 0.07153251, 0.3254902, 1, 0, 1,
-0.6308275, -0.2060608, -1.555352, 0.3215686, 1, 0, 1,
-0.6304277, 2.142372, 1.525705, 0.3137255, 1, 0, 1,
-0.6151929, -0.1490052, -1.174922, 0.3098039, 1, 0, 1,
-0.6116903, 0.4095179, -2.402356, 0.3019608, 1, 0, 1,
-0.6079327, -1.178145, -3.120286, 0.2941177, 1, 0, 1,
-0.6074761, 1.892335, -0.4087693, 0.2901961, 1, 0, 1,
-0.5983879, -0.2632451, -1.923838, 0.282353, 1, 0, 1,
-0.5967671, 1.619051, 0.09324855, 0.2784314, 1, 0, 1,
-0.594241, -0.1025791, -2.771844, 0.2705882, 1, 0, 1,
-0.5903504, -2.614012, -4.133527, 0.2666667, 1, 0, 1,
-0.587204, 1.433782, -1.20234, 0.2588235, 1, 0, 1,
-0.5867476, 1.052991, -0.5937551, 0.254902, 1, 0, 1,
-0.5865185, -0.1879256, -2.964157, 0.2470588, 1, 0, 1,
-0.5826969, 0.2867047, -3.140981, 0.2431373, 1, 0, 1,
-0.5805366, 0.2066323, -1.231723, 0.2352941, 1, 0, 1,
-0.5799937, -2.194111, -3.729656, 0.2313726, 1, 0, 1,
-0.5783756, 0.04435348, -1.329995, 0.2235294, 1, 0, 1,
-0.5716951, -0.1811779, -1.655533, 0.2196078, 1, 0, 1,
-0.5709681, 1.220406, -2.142162, 0.2117647, 1, 0, 1,
-0.5696437, 0.6540074, -0.6838392, 0.2078431, 1, 0, 1,
-0.5691292, 0.2281286, -1.269287, 0.2, 1, 0, 1,
-0.5680058, -1.512647, -1.601663, 0.1921569, 1, 0, 1,
-0.5650758, 0.2868406, 0.1905626, 0.1882353, 1, 0, 1,
-0.5648065, -1.661358, -4.723636, 0.1803922, 1, 0, 1,
-0.5638821, 0.5362154, -2.198353, 0.1764706, 1, 0, 1,
-0.5629624, -0.766017, -2.682601, 0.1686275, 1, 0, 1,
-0.562869, 1.479427, 0.2962625, 0.1647059, 1, 0, 1,
-0.5626209, -0.3798852, -1.746394, 0.1568628, 1, 0, 1,
-0.5554622, 0.6007181, -1.248769, 0.1529412, 1, 0, 1,
-0.5535476, -0.1500449, -3.133457, 0.145098, 1, 0, 1,
-0.5511785, -2.055328, -2.586817, 0.1411765, 1, 0, 1,
-0.545464, 0.5319945, 1.153492, 0.1333333, 1, 0, 1,
-0.5425932, -0.5031851, -1.609151, 0.1294118, 1, 0, 1,
-0.5419744, 1.070163, -1.048829, 0.1215686, 1, 0, 1,
-0.5369341, -0.7188414, -3.731193, 0.1176471, 1, 0, 1,
-0.5332711, -0.1115519, -2.124455, 0.1098039, 1, 0, 1,
-0.5229651, 1.904096, -0.1223544, 0.1058824, 1, 0, 1,
-0.5208207, -1.935446, -4.867629, 0.09803922, 1, 0, 1,
-0.5202574, -0.5396883, -2.660876, 0.09019608, 1, 0, 1,
-0.5171329, 0.3331613, -1.760765, 0.08627451, 1, 0, 1,
-0.5102237, 0.4823195, -0.7896683, 0.07843138, 1, 0, 1,
-0.5099483, 1.743485, -0.6861968, 0.07450981, 1, 0, 1,
-0.509612, 0.9475232, 0.6954222, 0.06666667, 1, 0, 1,
-0.5080846, -0.7938201, -4.377244, 0.0627451, 1, 0, 1,
-0.5080337, 0.4472909, -1.398089, 0.05490196, 1, 0, 1,
-0.5063108, -1.046152, -3.178025, 0.05098039, 1, 0, 1,
-0.5036297, -2.156531, -3.56865, 0.04313726, 1, 0, 1,
-0.4998166, 0.3540561, -1.266647, 0.03921569, 1, 0, 1,
-0.4976357, 0.3614627, -1.137925, 0.03137255, 1, 0, 1,
-0.4965621, 0.8290077, 0.4234616, 0.02745098, 1, 0, 1,
-0.4945506, -1.278222, -3.722438, 0.01960784, 1, 0, 1,
-0.4936296, 1.178518, -0.9163113, 0.01568628, 1, 0, 1,
-0.4923922, 0.8621002, 1.207636, 0.007843138, 1, 0, 1,
-0.4919996, 0.04983447, -0.9140872, 0.003921569, 1, 0, 1,
-0.4806169, 0.1399668, -1.02125, 0, 1, 0.003921569, 1,
-0.4710204, -0.6566296, -2.682218, 0, 1, 0.01176471, 1,
-0.4659972, 0.5913156, -1.643954, 0, 1, 0.01568628, 1,
-0.4650163, -1.171028, -2.695229, 0, 1, 0.02352941, 1,
-0.4633927, 1.694149, 0.6740524, 0, 1, 0.02745098, 1,
-0.4626639, -0.05687197, -0.4924819, 0, 1, 0.03529412, 1,
-0.4571725, 1.174315, 0.82042, 0, 1, 0.03921569, 1,
-0.4570277, -0.248453, -0.8294814, 0, 1, 0.04705882, 1,
-0.4534055, 2.515596, -0.9079501, 0, 1, 0.05098039, 1,
-0.4509167, -1.473737, -4.122522, 0, 1, 0.05882353, 1,
-0.4491325, 1.09861, -0.757251, 0, 1, 0.0627451, 1,
-0.4419078, 0.5619738, 0.1685446, 0, 1, 0.07058824, 1,
-0.4417664, 1.101516, 0.3787721, 0, 1, 0.07450981, 1,
-0.4388968, -0.1260685, -3.178348, 0, 1, 0.08235294, 1,
-0.4324579, -1.305665, -1.879786, 0, 1, 0.08627451, 1,
-0.430133, 0.4965545, -1.04142, 0, 1, 0.09411765, 1,
-0.4282627, -0.9143723, -1.563504, 0, 1, 0.1019608, 1,
-0.4256705, 0.5462321, -1.207857, 0, 1, 0.1058824, 1,
-0.424527, 0.9135571, -0.8658896, 0, 1, 0.1137255, 1,
-0.4194714, -0.40188, 0.5432904, 0, 1, 0.1176471, 1,
-0.4150326, -0.3095208, -2.043023, 0, 1, 0.1254902, 1,
-0.4088383, -0.7268526, -4.033094, 0, 1, 0.1294118, 1,
-0.4078004, -0.2670417, -2.141402, 0, 1, 0.1372549, 1,
-0.4001301, 0.3841212, -0.8222485, 0, 1, 0.1411765, 1,
-0.3961261, -0.2408351, -2.282149, 0, 1, 0.1490196, 1,
-0.3944042, -1.107305, -2.455966, 0, 1, 0.1529412, 1,
-0.3940403, 0.7355813, -0.07321558, 0, 1, 0.1607843, 1,
-0.3939203, -0.3695435, -1.450506, 0, 1, 0.1647059, 1,
-0.3935325, 1.315783, -0.1730473, 0, 1, 0.172549, 1,
-0.3933226, 0.3289154, -1.719398, 0, 1, 0.1764706, 1,
-0.3926623, 0.7706375, -0.651767, 0, 1, 0.1843137, 1,
-0.3924588, -1.603925, -2.058289, 0, 1, 0.1882353, 1,
-0.3891899, 0.6084782, -0.1946457, 0, 1, 0.1960784, 1,
-0.3888783, 0.7834384, -0.2192578, 0, 1, 0.2039216, 1,
-0.3885216, 0.1821424, -0.7629817, 0, 1, 0.2078431, 1,
-0.3851777, 0.5014653, -0.1735383, 0, 1, 0.2156863, 1,
-0.3824783, 0.1844443, -1.37969, 0, 1, 0.2196078, 1,
-0.376775, -0.6161408, -2.565089, 0, 1, 0.227451, 1,
-0.3753564, 1.07891, -0.2823508, 0, 1, 0.2313726, 1,
-0.374359, 0.3343897, -1.40384, 0, 1, 0.2392157, 1,
-0.3700411, 1.004218, -2.753045, 0, 1, 0.2431373, 1,
-0.3670004, -0.1238184, -0.1862978, 0, 1, 0.2509804, 1,
-0.3642075, -0.3183501, -2.094679, 0, 1, 0.254902, 1,
-0.3555471, 0.05466863, -1.309444, 0, 1, 0.2627451, 1,
-0.3548656, -0.2290287, -4.216137, 0, 1, 0.2666667, 1,
-0.3520081, -1.484907, -3.374825, 0, 1, 0.2745098, 1,
-0.3519168, 0.3272663, 0.242692, 0, 1, 0.2784314, 1,
-0.3510305, 1.390785, 1.031481, 0, 1, 0.2862745, 1,
-0.3473489, -0.8595308, -2.687401, 0, 1, 0.2901961, 1,
-0.3463902, -1.528428, -2.771801, 0, 1, 0.2980392, 1,
-0.3458142, 1.114339, -1.341474, 0, 1, 0.3058824, 1,
-0.3456506, 0.1066353, -2.064846, 0, 1, 0.3098039, 1,
-0.3430327, 0.2041002, -1.451281, 0, 1, 0.3176471, 1,
-0.3376577, 0.7655835, -0.8694111, 0, 1, 0.3215686, 1,
-0.332642, -1.445089, -0.9690356, 0, 1, 0.3294118, 1,
-0.3237597, 1.537979, -0.5550833, 0, 1, 0.3333333, 1,
-0.314934, -0.05208183, -1.986914, 0, 1, 0.3411765, 1,
-0.3148996, -0.882699, -3.58573, 0, 1, 0.345098, 1,
-0.314099, 1.156347, -0.6838919, 0, 1, 0.3529412, 1,
-0.3128065, 0.8175509, 0.45871, 0, 1, 0.3568628, 1,
-0.3107295, -0.3816292, -3.736999, 0, 1, 0.3647059, 1,
-0.3068316, -0.04499247, -1.566322, 0, 1, 0.3686275, 1,
-0.3047573, -1.496605, -3.647072, 0, 1, 0.3764706, 1,
-0.2999677, 1.411948, -1.480779, 0, 1, 0.3803922, 1,
-0.295289, 0.6755269, 0.4400406, 0, 1, 0.3882353, 1,
-0.2931794, 0.5216605, 0.002465304, 0, 1, 0.3921569, 1,
-0.2922824, 0.4480619, -2.586224, 0, 1, 0.4, 1,
-0.2916839, -0.06017991, -1.991484, 0, 1, 0.4078431, 1,
-0.2860669, -0.1567028, -1.137398, 0, 1, 0.4117647, 1,
-0.2834886, 0.5172522, -0.03986068, 0, 1, 0.4196078, 1,
-0.2816327, 0.655765, -0.685694, 0, 1, 0.4235294, 1,
-0.2801014, -0.6987956, -2.572989, 0, 1, 0.4313726, 1,
-0.2794895, -2.915109, -3.67084, 0, 1, 0.4352941, 1,
-0.2782696, -0.8843268, -2.937261, 0, 1, 0.4431373, 1,
-0.2759011, -1.677694, -4.54916, 0, 1, 0.4470588, 1,
-0.2729574, -0.5693724, -1.99366, 0, 1, 0.454902, 1,
-0.2727677, 0.6242038, 0.2101865, 0, 1, 0.4588235, 1,
-0.2680784, -1.411527, -4.519493, 0, 1, 0.4666667, 1,
-0.2670389, 0.07830771, -0.6067154, 0, 1, 0.4705882, 1,
-0.2653171, -0.6213683, -3.159533, 0, 1, 0.4784314, 1,
-0.2649325, 0.8081567, -0.3825437, 0, 1, 0.4823529, 1,
-0.2634108, -0.528161, -3.429021, 0, 1, 0.4901961, 1,
-0.2579822, -0.1909893, -2.514957, 0, 1, 0.4941176, 1,
-0.2579695, 1.545358, 1.618044, 0, 1, 0.5019608, 1,
-0.2556224, 0.6029879, 1.125199, 0, 1, 0.509804, 1,
-0.2540577, -0.1892944, -1.093869, 0, 1, 0.5137255, 1,
-0.2524393, -0.3221218, -2.047195, 0, 1, 0.5215687, 1,
-0.2439454, 1.439319, -0.408702, 0, 1, 0.5254902, 1,
-0.2433804, -0.5510178, -1.491882, 0, 1, 0.5333334, 1,
-0.2375065, 0.04701738, -0.3895261, 0, 1, 0.5372549, 1,
-0.2333561, 0.8589791, -0.04820878, 0, 1, 0.5450981, 1,
-0.2316388, -1.401642, -4.671679, 0, 1, 0.5490196, 1,
-0.2315174, -0.3827338, -1.983428, 0, 1, 0.5568628, 1,
-0.2306049, -1.378631, -3.637011, 0, 1, 0.5607843, 1,
-0.2263194, -0.1278545, -1.305934, 0, 1, 0.5686275, 1,
-0.2251399, 1.9651, -1.08543, 0, 1, 0.572549, 1,
-0.2237302, -0.03075094, -2.507924, 0, 1, 0.5803922, 1,
-0.2227287, -0.6869516, -3.171801, 0, 1, 0.5843138, 1,
-0.220301, 0.3079255, -0.524245, 0, 1, 0.5921569, 1,
-0.2184924, -1.422124, -2.15269, 0, 1, 0.5960785, 1,
-0.2181384, 1.214237, -1.48438, 0, 1, 0.6039216, 1,
-0.2142879, -0.6204609, -3.661677, 0, 1, 0.6117647, 1,
-0.2136985, -0.4383712, -4.301702, 0, 1, 0.6156863, 1,
-0.2136951, 2.229132, 1.625262, 0, 1, 0.6235294, 1,
-0.2115148, -2.103602, -3.471497, 0, 1, 0.627451, 1,
-0.2112873, -0.7956587, -3.285192, 0, 1, 0.6352941, 1,
-0.207702, 1.148059, 0.7046871, 0, 1, 0.6392157, 1,
-0.2036187, 0.1562867, -0.8202822, 0, 1, 0.6470588, 1,
-0.2006842, -0.7885919, -3.451965, 0, 1, 0.6509804, 1,
-0.2004811, -2.977111, -2.393941, 0, 1, 0.6588235, 1,
-0.1974052, -0.1127901, -1.148234, 0, 1, 0.6627451, 1,
-0.1911104, -0.1456743, -1.501468, 0, 1, 0.6705883, 1,
-0.1873791, 2.030504, 0.4681585, 0, 1, 0.6745098, 1,
-0.1845276, -0.5079501, -2.17695, 0, 1, 0.682353, 1,
-0.1819583, -1.460693, -3.145389, 0, 1, 0.6862745, 1,
-0.1803137, 0.3976044, 0.2822694, 0, 1, 0.6941177, 1,
-0.1789397, -1.883254, -3.302578, 0, 1, 0.7019608, 1,
-0.1785069, 0.04246045, -3.309585, 0, 1, 0.7058824, 1,
-0.1782145, -1.220495, -5.09524, 0, 1, 0.7137255, 1,
-0.1670122, -0.89274, -1.616646, 0, 1, 0.7176471, 1,
-0.1629869, 0.7426792, 1.899853, 0, 1, 0.7254902, 1,
-0.1618101, -1.034758, -2.477047, 0, 1, 0.7294118, 1,
-0.159877, 0.2764364, 0.2959011, 0, 1, 0.7372549, 1,
-0.1557473, 0.1691882, -0.4382268, 0, 1, 0.7411765, 1,
-0.1553585, 1.276478, -1.051912, 0, 1, 0.7490196, 1,
-0.1520975, 0.7081727, -1.700127, 0, 1, 0.7529412, 1,
-0.1519089, -1.292724, -3.029469, 0, 1, 0.7607843, 1,
-0.1500782, 1.08179, -2.094534, 0, 1, 0.7647059, 1,
-0.1437476, 0.05317089, 0.6506377, 0, 1, 0.772549, 1,
-0.1430642, -0.1344184, -4.080533, 0, 1, 0.7764706, 1,
-0.142058, 1.771196, 0.5273857, 0, 1, 0.7843137, 1,
-0.1412479, 0.4219472, 0.6340597, 0, 1, 0.7882353, 1,
-0.1372041, -1.219769, -4.72057, 0, 1, 0.7960784, 1,
-0.1360997, 0.3324065, -1.137664, 0, 1, 0.8039216, 1,
-0.1333609, -1.399533, -1.493123, 0, 1, 0.8078431, 1,
-0.1321329, 0.1298306, -1.308269, 0, 1, 0.8156863, 1,
-0.128015, 0.05548714, -1.789829, 0, 1, 0.8196079, 1,
-0.1275294, -1.846977, -3.178744, 0, 1, 0.827451, 1,
-0.1241278, -0.7326534, -4.470493, 0, 1, 0.8313726, 1,
-0.1236809, 0.5290571, -0.434171, 0, 1, 0.8392157, 1,
-0.1208652, 0.6503391, -1.202441, 0, 1, 0.8431373, 1,
-0.1202952, -0.9502639, -3.216596, 0, 1, 0.8509804, 1,
-0.1179738, 1.103065, 0.6635568, 0, 1, 0.854902, 1,
-0.1139953, 0.9680855, 0.1383167, 0, 1, 0.8627451, 1,
-0.1134721, -0.1928409, -2.206951, 0, 1, 0.8666667, 1,
-0.1090981, 0.293495, -0.5433422, 0, 1, 0.8745098, 1,
-0.1080626, -0.5787247, -4.789677, 0, 1, 0.8784314, 1,
-0.106013, 0.4842955, -1.047165, 0, 1, 0.8862745, 1,
-0.1038453, -0.1496812, -1.120666, 0, 1, 0.8901961, 1,
-0.1029874, -0.7745427, -2.868482, 0, 1, 0.8980392, 1,
-0.09930808, -1.361136, -1.960256, 0, 1, 0.9058824, 1,
-0.0837588, 0.2545667, 1.015734, 0, 1, 0.9098039, 1,
-0.08103313, -0.993295, -4.466528, 0, 1, 0.9176471, 1,
-0.08076383, 0.6239345, -0.7741158, 0, 1, 0.9215686, 1,
-0.07803801, 0.2253527, 0.9287736, 0, 1, 0.9294118, 1,
-0.07593096, 0.0938585, 0.9665768, 0, 1, 0.9333333, 1,
-0.0753423, -0.9256459, -3.509551, 0, 1, 0.9411765, 1,
-0.07071287, -0.2292257, -4.707577, 0, 1, 0.945098, 1,
-0.0675901, -0.2662162, -4.037617, 0, 1, 0.9529412, 1,
-0.06635924, 0.05679422, -0.2194248, 0, 1, 0.9568627, 1,
-0.06495272, -0.1288772, -0.6857063, 0, 1, 0.9647059, 1,
-0.06386406, 0.423658, 1.409223, 0, 1, 0.9686275, 1,
-0.06222518, -0.1104443, -2.128067, 0, 1, 0.9764706, 1,
-0.06207394, -0.8854952, -1.882277, 0, 1, 0.9803922, 1,
-0.06003004, -0.8195263, -4.223986, 0, 1, 0.9882353, 1,
-0.05762475, 0.04843248, -0.5928299, 0, 1, 0.9921569, 1,
-0.05688853, -0.6024188, -2.161374, 0, 1, 1, 1,
-0.05576768, 1.918495, 2.298552, 0, 0.9921569, 1, 1,
-0.05572941, 0.1009696, -2.011346, 0, 0.9882353, 1, 1,
-0.05249278, 0.3868116, -0.5459498, 0, 0.9803922, 1, 1,
-0.05091392, 1.594565, -0.2424588, 0, 0.9764706, 1, 1,
-0.05021517, -0.4761454, -2.157569, 0, 0.9686275, 1, 1,
-0.05013525, -1.560625, -5.18029, 0, 0.9647059, 1, 1,
-0.0495039, 0.2322306, 0.3437062, 0, 0.9568627, 1, 1,
-0.04224074, -1.481095, -3.012074, 0, 0.9529412, 1, 1,
-0.03870395, 0.9025356, 0.7815149, 0, 0.945098, 1, 1,
-0.03520929, 0.3249082, -1.21946, 0, 0.9411765, 1, 1,
-0.0322532, -0.3566725, -2.489913, 0, 0.9333333, 1, 1,
-0.0284365, 0.2309058, -1.96281, 0, 0.9294118, 1, 1,
-0.02819329, 0.5925756, 0.3680577, 0, 0.9215686, 1, 1,
-0.02495189, 0.03888769, -1.44313, 0, 0.9176471, 1, 1,
-0.02462685, -0.7247045, -2.045542, 0, 0.9098039, 1, 1,
-0.02170657, -1.791796, -4.20199, 0, 0.9058824, 1, 1,
-0.02166307, -0.3755972, -2.196754, 0, 0.8980392, 1, 1,
-0.01945884, 0.6081388, -0.4469708, 0, 0.8901961, 1, 1,
-0.0188808, 0.252167, -0.4409015, 0, 0.8862745, 1, 1,
-0.01607785, -0.4589289, -2.45583, 0, 0.8784314, 1, 1,
-0.01193842, -0.4618956, -4.379951, 0, 0.8745098, 1, 1,
-0.0116613, 0.1369879, 0.5817428, 0, 0.8666667, 1, 1,
-0.01154366, -1.56918, -2.750329, 0, 0.8627451, 1, 1,
-0.009186784, 0.8177955, 1.329773, 0, 0.854902, 1, 1,
-0.007593311, 0.04722079, 0.027075, 0, 0.8509804, 1, 1,
-0.006694266, 0.08686603, -2.250111, 0, 0.8431373, 1, 1,
-0.006599615, 0.9684723, 0.1439365, 0, 0.8392157, 1, 1,
-4.478419e-05, 0.2865736, -1.757845, 0, 0.8313726, 1, 1,
0.008808482, -0.2678122, 4.147952, 0, 0.827451, 1, 1,
0.009142267, -0.7564445, 2.608051, 0, 0.8196079, 1, 1,
0.00947143, 0.1180063, -0.4103895, 0, 0.8156863, 1, 1,
0.01131788, 0.3473088, 0.2673281, 0, 0.8078431, 1, 1,
0.01298148, -0.6688053, 4.317226, 0, 0.8039216, 1, 1,
0.01326026, -1.539404, 3.176368, 0, 0.7960784, 1, 1,
0.0152148, -1.109071, 3.905319, 0, 0.7882353, 1, 1,
0.01717392, 1.067609, -0.07840856, 0, 0.7843137, 1, 1,
0.02197669, 0.8787857, -0.1062795, 0, 0.7764706, 1, 1,
0.03363954, -0.6462384, 4.085366, 0, 0.772549, 1, 1,
0.03643686, 2.588296, 0.07967931, 0, 0.7647059, 1, 1,
0.0452585, -1.057637, 2.303608, 0, 0.7607843, 1, 1,
0.04584813, -0.02204915, 2.834596, 0, 0.7529412, 1, 1,
0.04734462, -0.2110615, 3.124011, 0, 0.7490196, 1, 1,
0.04954505, -0.1013298, 3.142394, 0, 0.7411765, 1, 1,
0.0546518, -0.4383175, 2.96351, 0, 0.7372549, 1, 1,
0.05487221, 0.9612899, 0.1123085, 0, 0.7294118, 1, 1,
0.05528304, 1.454982, -0.5712028, 0, 0.7254902, 1, 1,
0.05626504, 0.1435151, 0.6960487, 0, 0.7176471, 1, 1,
0.05889665, 1.975697, -0.6587106, 0, 0.7137255, 1, 1,
0.06439392, -0.3403378, 4.506975, 0, 0.7058824, 1, 1,
0.06654335, 1.10922, 0.6964692, 0, 0.6980392, 1, 1,
0.06920031, -1.349033, 2.338392, 0, 0.6941177, 1, 1,
0.0728633, -0.669166, 4.32169, 0, 0.6862745, 1, 1,
0.07331465, -0.4795718, 3.677407, 0, 0.682353, 1, 1,
0.0734278, 0.6939304, -2.043581, 0, 0.6745098, 1, 1,
0.07476458, 0.9103973, 0.4871552, 0, 0.6705883, 1, 1,
0.07600618, 0.7212264, 0.08114661, 0, 0.6627451, 1, 1,
0.07736954, 1.192089, -0.3175717, 0, 0.6588235, 1, 1,
0.07778338, -0.07528347, 2.536345, 0, 0.6509804, 1, 1,
0.0791354, -1.234982, 1.745493, 0, 0.6470588, 1, 1,
0.08147502, 1.328479, 0.3477497, 0, 0.6392157, 1, 1,
0.0819898, -0.4257274, 3.89257, 0, 0.6352941, 1, 1,
0.08239223, 0.1929382, -0.3309343, 0, 0.627451, 1, 1,
0.08494177, -0.4483629, 3.024945, 0, 0.6235294, 1, 1,
0.0900216, -0.09192473, 0.9047757, 0, 0.6156863, 1, 1,
0.09116831, -1.730749, 3.42686, 0, 0.6117647, 1, 1,
0.09307807, 1.819245, 0.4727038, 0, 0.6039216, 1, 1,
0.09480315, -0.1621603, 2.093688, 0, 0.5960785, 1, 1,
0.0953069, 1.261537, 1.601034, 0, 0.5921569, 1, 1,
0.09836464, -0.9124988, 4.236543, 0, 0.5843138, 1, 1,
0.09973942, -0.6639958, 3.679849, 0, 0.5803922, 1, 1,
0.1030622, 2.202516, -0.5680147, 0, 0.572549, 1, 1,
0.1032264, -0.07999013, 3.971598, 0, 0.5686275, 1, 1,
0.1080573, -0.9679567, 2.805218, 0, 0.5607843, 1, 1,
0.1112119, -0.577047, 4.68078, 0, 0.5568628, 1, 1,
0.1130582, 0.2636969, 0.5356411, 0, 0.5490196, 1, 1,
0.1152734, 0.2040098, 0.8589898, 0, 0.5450981, 1, 1,
0.1156728, -1.092965, 2.871047, 0, 0.5372549, 1, 1,
0.1174243, -2.087014, 3.450865, 0, 0.5333334, 1, 1,
0.1215138, 0.7517631, -0.5267418, 0, 0.5254902, 1, 1,
0.1304092, 1.549047, -0.5268056, 0, 0.5215687, 1, 1,
0.1316663, -0.3314581, 2.480808, 0, 0.5137255, 1, 1,
0.1329368, 1.695371, 1.67796, 0, 0.509804, 1, 1,
0.1368464, -0.3862568, 3.613101, 0, 0.5019608, 1, 1,
0.1391232, -1.177402, 2.014204, 0, 0.4941176, 1, 1,
0.1420248, 1.696917, 1.282373, 0, 0.4901961, 1, 1,
0.1428209, 0.4401245, 0.5558253, 0, 0.4823529, 1, 1,
0.1429903, -1.10559, 3.75373, 0, 0.4784314, 1, 1,
0.1456362, 0.1337232, -0.8306991, 0, 0.4705882, 1, 1,
0.1460463, -0.3230843, -0.0791181, 0, 0.4666667, 1, 1,
0.1461658, -0.5324948, 3.78239, 0, 0.4588235, 1, 1,
0.1467612, -0.8839597, 1.772535, 0, 0.454902, 1, 1,
0.1504091, -0.4704969, 2.954989, 0, 0.4470588, 1, 1,
0.1514678, -0.7446668, 2.566653, 0, 0.4431373, 1, 1,
0.1549255, 0.6194512, 1.216507, 0, 0.4352941, 1, 1,
0.1563699, 0.4204046, 0.178194, 0, 0.4313726, 1, 1,
0.1577456, -0.6508424, 1.184958, 0, 0.4235294, 1, 1,
0.1674407, -0.4694884, 2.253188, 0, 0.4196078, 1, 1,
0.1679435, -0.4629301, 2.071978, 0, 0.4117647, 1, 1,
0.169539, 0.1094813, 2.49615, 0, 0.4078431, 1, 1,
0.1701118, 3.064229, 1.007936, 0, 0.4, 1, 1,
0.1704981, -0.24424, 2.390024, 0, 0.3921569, 1, 1,
0.1734097, 0.1901977, 1.525939, 0, 0.3882353, 1, 1,
0.1756589, -0.6814023, 1.974029, 0, 0.3803922, 1, 1,
0.1765519, -1.206809, 1.96035, 0, 0.3764706, 1, 1,
0.1810351, 1.96703, 1.686039, 0, 0.3686275, 1, 1,
0.1814089, 1.396486, -0.7393235, 0, 0.3647059, 1, 1,
0.1861552, 1.56331, -1.170297, 0, 0.3568628, 1, 1,
0.1872835, 1.110921, 1.456828, 0, 0.3529412, 1, 1,
0.1875027, -0.9723591, 1.400892, 0, 0.345098, 1, 1,
0.1900242, 0.8562757, 0.2695907, 0, 0.3411765, 1, 1,
0.1928096, 1.152886, 0.606348, 0, 0.3333333, 1, 1,
0.1967101, -0.2345161, 2.224546, 0, 0.3294118, 1, 1,
0.1995274, 2.02691, 2.01119, 0, 0.3215686, 1, 1,
0.2019238, -0.996511, 1.88377, 0, 0.3176471, 1, 1,
0.2033995, -0.7088921, 2.032635, 0, 0.3098039, 1, 1,
0.2044115, -0.1783147, 2.568809, 0, 0.3058824, 1, 1,
0.2078153, 0.4104864, 0.4621271, 0, 0.2980392, 1, 1,
0.2111051, -0.6964478, 2.210348, 0, 0.2901961, 1, 1,
0.2165122, -1.004502, 2.672196, 0, 0.2862745, 1, 1,
0.2195473, 1.03597, 0.9718423, 0, 0.2784314, 1, 1,
0.2199986, 0.3530251, 1.860774, 0, 0.2745098, 1, 1,
0.2201743, -0.5306199, 2.68737, 0, 0.2666667, 1, 1,
0.2212074, 0.3559978, 1.209246, 0, 0.2627451, 1, 1,
0.2283422, 0.1769803, 1.350772, 0, 0.254902, 1, 1,
0.2295189, 1.3611, -0.9735156, 0, 0.2509804, 1, 1,
0.2358938, -0.8376922, 2.477552, 0, 0.2431373, 1, 1,
0.2426081, 1.117134, -0.3679661, 0, 0.2392157, 1, 1,
0.2443805, -0.9753392, 3.578469, 0, 0.2313726, 1, 1,
0.2454568, 2.049712, -0.05970667, 0, 0.227451, 1, 1,
0.2463478, 1.40607, -2.128074, 0, 0.2196078, 1, 1,
0.24646, -0.5404329, 2.313591, 0, 0.2156863, 1, 1,
0.2479022, -0.6061949, 3.252353, 0, 0.2078431, 1, 1,
0.2496781, -0.8014867, 2.123675, 0, 0.2039216, 1, 1,
0.2514528, -0.7569016, 4.423569, 0, 0.1960784, 1, 1,
0.2545972, 0.9180697, 0.779419, 0, 0.1882353, 1, 1,
0.2557156, 0.8765733, -1.07949, 0, 0.1843137, 1, 1,
0.2585807, -0.9508265, 1.146186, 0, 0.1764706, 1, 1,
0.2679569, -0.3735262, 0.687327, 0, 0.172549, 1, 1,
0.2753583, -1.889936, 3.029422, 0, 0.1647059, 1, 1,
0.2755797, -0.005713196, 1.388772, 0, 0.1607843, 1, 1,
0.276317, -0.6355734, 4.086748, 0, 0.1529412, 1, 1,
0.2764863, 0.2348038, 1.747615, 0, 0.1490196, 1, 1,
0.277551, 1.028055, 0.2193209, 0, 0.1411765, 1, 1,
0.2800772, -0.7166739, 2.075501, 0, 0.1372549, 1, 1,
0.2863085, -0.4985427, 2.870403, 0, 0.1294118, 1, 1,
0.2881747, -0.2068949, 3.858342, 0, 0.1254902, 1, 1,
0.294403, 0.6428686, 0.06564719, 0, 0.1176471, 1, 1,
0.2979606, -0.377116, 0.6959975, 0, 0.1137255, 1, 1,
0.3014769, 1.528679, -0.0927214, 0, 0.1058824, 1, 1,
0.3023762, 0.87194, -0.2328739, 0, 0.09803922, 1, 1,
0.3102772, 0.738093, -0.3376569, 0, 0.09411765, 1, 1,
0.3149596, -1.115718, 2.582383, 0, 0.08627451, 1, 1,
0.3327556, -0.1189243, 1.099887, 0, 0.08235294, 1, 1,
0.33913, 1.120914, 0.5319415, 0, 0.07450981, 1, 1,
0.3398343, -0.7931852, 3.166958, 0, 0.07058824, 1, 1,
0.3405693, 0.7995306, -0.7710381, 0, 0.0627451, 1, 1,
0.343179, -0.8861904, 3.934364, 0, 0.05882353, 1, 1,
0.3446518, -0.9598793, 1.85136, 0, 0.05098039, 1, 1,
0.3469656, -1.020497, 2.563442, 0, 0.04705882, 1, 1,
0.3488719, 1.121481, 0.5594423, 0, 0.03921569, 1, 1,
0.3501557, -0.002328264, 2.586667, 0, 0.03529412, 1, 1,
0.3549208, -0.2817471, 2.547191, 0, 0.02745098, 1, 1,
0.3556179, 0.87077, 0.4246337, 0, 0.02352941, 1, 1,
0.3587253, -0.9763712, 0.7574615, 0, 0.01568628, 1, 1,
0.3644604, 1.684001, 1.920159, 0, 0.01176471, 1, 1,
0.3655694, 0.115607, 0.6282107, 0, 0.003921569, 1, 1,
0.3663857, 1.478534, 0.8561567, 0.003921569, 0, 1, 1,
0.3718349, -2.416295, 2.38165, 0.007843138, 0, 1, 1,
0.3720304, 0.1543673, -0.2543508, 0.01568628, 0, 1, 1,
0.3732223, 2.541415, -0.8378084, 0.01960784, 0, 1, 1,
0.3763123, 0.2271386, 0.7886541, 0.02745098, 0, 1, 1,
0.377082, 1.109239, 0.9223489, 0.03137255, 0, 1, 1,
0.3784189, -1.912747, 2.932936, 0.03921569, 0, 1, 1,
0.3796298, 0.3705751, 0.3942366, 0.04313726, 0, 1, 1,
0.3898609, -0.2367736, 2.578023, 0.05098039, 0, 1, 1,
0.3909339, -0.3823, 2.757145, 0.05490196, 0, 1, 1,
0.3931061, -0.3497528, 4.464176, 0.0627451, 0, 1, 1,
0.4080718, -1.083363, 3.724481, 0.06666667, 0, 1, 1,
0.4110056, -1.609748, 1.280624, 0.07450981, 0, 1, 1,
0.4128382, 1.300937, 0.6335151, 0.07843138, 0, 1, 1,
0.4139967, -0.230702, 2.437078, 0.08627451, 0, 1, 1,
0.4253302, 1.327644, 0.4514385, 0.09019608, 0, 1, 1,
0.43903, -0.5889394, 3.286372, 0.09803922, 0, 1, 1,
0.4404468, -1.341924, 3.116623, 0.1058824, 0, 1, 1,
0.4412189, -0.3587134, 0.8577018, 0.1098039, 0, 1, 1,
0.4413174, -0.7573131, 1.20406, 0.1176471, 0, 1, 1,
0.445156, 0.7214037, 2.039257, 0.1215686, 0, 1, 1,
0.445181, -0.395451, 2.549681, 0.1294118, 0, 1, 1,
0.4460088, 0.3425978, -0.4683684, 0.1333333, 0, 1, 1,
0.4464597, -0.1209155, 1.926564, 0.1411765, 0, 1, 1,
0.448091, 1.669207, 0.628955, 0.145098, 0, 1, 1,
0.4496159, 0.865492, -0.6773109, 0.1529412, 0, 1, 1,
0.45665, -0.6155944, 1.875423, 0.1568628, 0, 1, 1,
0.4570281, 1.244871, 2.286209, 0.1647059, 0, 1, 1,
0.4638528, -1.831967, 1.332993, 0.1686275, 0, 1, 1,
0.4642819, 1.704592, 0.4596319, 0.1764706, 0, 1, 1,
0.4661182, 1.415601, 0.3876728, 0.1803922, 0, 1, 1,
0.4677212, 1.187908, 1.087685, 0.1882353, 0, 1, 1,
0.4724328, 0.00031889, 3.694062, 0.1921569, 0, 1, 1,
0.4729328, -0.06049543, 0.6421424, 0.2, 0, 1, 1,
0.4759613, -0.4639909, 3.545125, 0.2078431, 0, 1, 1,
0.4772857, 1.408785, -0.3806053, 0.2117647, 0, 1, 1,
0.484744, -0.1604191, 2.686621, 0.2196078, 0, 1, 1,
0.4852581, -0.4541384, 1.34981, 0.2235294, 0, 1, 1,
0.4853961, -0.2940317, 2.956066, 0.2313726, 0, 1, 1,
0.4863097, 1.478352, 0.8102813, 0.2352941, 0, 1, 1,
0.4886798, -1.11269, 1.40424, 0.2431373, 0, 1, 1,
0.4971532, -1.029939, 2.750709, 0.2470588, 0, 1, 1,
0.497358, -0.1596687, 1.857862, 0.254902, 0, 1, 1,
0.4987614, -1.421496, 3.26811, 0.2588235, 0, 1, 1,
0.5034842, -1.13052, 4.233354, 0.2666667, 0, 1, 1,
0.5039756, -1.829251, 3.841778, 0.2705882, 0, 1, 1,
0.5052502, 0.01276335, 2.503243, 0.2784314, 0, 1, 1,
0.505715, 1.796787, 0.05509885, 0.282353, 0, 1, 1,
0.5058537, -1.254487, 2.203393, 0.2901961, 0, 1, 1,
0.5113663, -0.127903, 1.932198, 0.2941177, 0, 1, 1,
0.5137817, -0.05668905, 2.472319, 0.3019608, 0, 1, 1,
0.5233051, -1.825435, 2.066959, 0.3098039, 0, 1, 1,
0.5270959, 1.124741, -0.3094335, 0.3137255, 0, 1, 1,
0.5271705, 0.02081867, 1.902724, 0.3215686, 0, 1, 1,
0.5315119, 0.1247987, 2.012872, 0.3254902, 0, 1, 1,
0.5364091, 1.380089, 0.1406925, 0.3333333, 0, 1, 1,
0.539697, 1.167734, 0.9503097, 0.3372549, 0, 1, 1,
0.5428281, 0.2099981, 0.3763877, 0.345098, 0, 1, 1,
0.5480635, -0.0211469, 0.6551793, 0.3490196, 0, 1, 1,
0.5515386, -1.801021, 3.277297, 0.3568628, 0, 1, 1,
0.556785, 0.8015987, 1.573161, 0.3607843, 0, 1, 1,
0.567358, 0.3748084, 2.62005, 0.3686275, 0, 1, 1,
0.5676646, -2.099441, 2.853997, 0.372549, 0, 1, 1,
0.5738843, 0.8487424, 0.1175809, 0.3803922, 0, 1, 1,
0.5753173, -1.645672, 3.505197, 0.3843137, 0, 1, 1,
0.5859443, -0.1466229, 3.333738, 0.3921569, 0, 1, 1,
0.5901629, -0.01879475, 1.075881, 0.3960784, 0, 1, 1,
0.5931141, 0.825706, 1.596394, 0.4039216, 0, 1, 1,
0.5937818, -0.8291888, 3.641897, 0.4117647, 0, 1, 1,
0.5948752, -0.2747231, 0.7836921, 0.4156863, 0, 1, 1,
0.5993167, 0.8214661, -0.04765465, 0.4235294, 0, 1, 1,
0.6047443, 0.6811281, 0.1402954, 0.427451, 0, 1, 1,
0.6077372, 0.1341904, 2.302704, 0.4352941, 0, 1, 1,
0.613005, -0.4890513, 4.573436, 0.4392157, 0, 1, 1,
0.6219369, 0.9486773, -0.5061664, 0.4470588, 0, 1, 1,
0.6238481, -0.579687, 1.587448, 0.4509804, 0, 1, 1,
0.6309048, 0.7022384, 1.154049, 0.4588235, 0, 1, 1,
0.6317125, 0.7191483, -0.2929587, 0.4627451, 0, 1, 1,
0.632192, 0.329008, 0.974852, 0.4705882, 0, 1, 1,
0.6340446, -0.4044888, 2.354488, 0.4745098, 0, 1, 1,
0.6359779, -1.110045, 0.3171744, 0.4823529, 0, 1, 1,
0.6386848, -0.3151844, 1.398944, 0.4862745, 0, 1, 1,
0.6489976, -2.073684, 3.989621, 0.4941176, 0, 1, 1,
0.6514416, -0.4926726, 1.579212, 0.5019608, 0, 1, 1,
0.6521978, -0.3623872, 1.375406, 0.5058824, 0, 1, 1,
0.6578493, 1.40778, 3.280725, 0.5137255, 0, 1, 1,
0.6591433, 0.1554214, 0.9388301, 0.5176471, 0, 1, 1,
0.6594974, 0.4325556, 2.125484, 0.5254902, 0, 1, 1,
0.6603442, 1.420652, 0.2024573, 0.5294118, 0, 1, 1,
0.6626849, 0.1468202, 2.076612, 0.5372549, 0, 1, 1,
0.6649107, -0.8667099, 3.04416, 0.5411765, 0, 1, 1,
0.6676406, 0.4242808, 1.405754, 0.5490196, 0, 1, 1,
0.6677824, 0.2104466, 1.34241, 0.5529412, 0, 1, 1,
0.6677982, -0.5367595, 3.312718, 0.5607843, 0, 1, 1,
0.6820494, -0.1427951, 0.7777034, 0.5647059, 0, 1, 1,
0.682117, 0.6493975, 1.429576, 0.572549, 0, 1, 1,
0.6912827, -1.581918, 2.775832, 0.5764706, 0, 1, 1,
0.693204, -1.014994, 2.502354, 0.5843138, 0, 1, 1,
0.6943019, -1.580976, 1.719381, 0.5882353, 0, 1, 1,
0.6958432, -0.6881692, 2.534493, 0.5960785, 0, 1, 1,
0.7053408, -1.294183, 1.78919, 0.6039216, 0, 1, 1,
0.70581, 0.7401515, -1.299963, 0.6078432, 0, 1, 1,
0.7130404, -0.7256256, 0.5329781, 0.6156863, 0, 1, 1,
0.7145193, -0.09204847, 2.337218, 0.6196079, 0, 1, 1,
0.7150372, 0.7754947, -0.1659267, 0.627451, 0, 1, 1,
0.7158104, -2.098963, 3.171735, 0.6313726, 0, 1, 1,
0.7279732, 2.929026, 0.9375256, 0.6392157, 0, 1, 1,
0.7296777, -0.1231623, 1.210325, 0.6431373, 0, 1, 1,
0.7420106, -0.04483329, 0.05742792, 0.6509804, 0, 1, 1,
0.7429488, -0.2115137, 1.586454, 0.654902, 0, 1, 1,
0.7436633, -0.8794531, 2.192789, 0.6627451, 0, 1, 1,
0.7441663, 1.453911, -0.8148401, 0.6666667, 0, 1, 1,
0.7483051, 0.9482371, -0.1137832, 0.6745098, 0, 1, 1,
0.7537113, -1.168081, 2.352333, 0.6784314, 0, 1, 1,
0.758121, -0.7451427, 2.487457, 0.6862745, 0, 1, 1,
0.760282, -0.09066147, 1.337288, 0.6901961, 0, 1, 1,
0.776149, -0.2429793, 0.6896247, 0.6980392, 0, 1, 1,
0.7771912, 0.2661233, -0.3606775, 0.7058824, 0, 1, 1,
0.7796158, 0.02811605, 1.567977, 0.7098039, 0, 1, 1,
0.7868434, -1.396492, 1.89086, 0.7176471, 0, 1, 1,
0.7883331, 0.4383173, 0.1130713, 0.7215686, 0, 1, 1,
0.7898531, 0.2833885, 1.044157, 0.7294118, 0, 1, 1,
0.7944303, -0.5401453, 2.676962, 0.7333333, 0, 1, 1,
0.7958199, -0.2994569, 2.382067, 0.7411765, 0, 1, 1,
0.7959336, 1.125292, 1.432644, 0.7450981, 0, 1, 1,
0.7992021, -0.3072407, 1.915237, 0.7529412, 0, 1, 1,
0.8048123, 1.564053, 0.4053172, 0.7568628, 0, 1, 1,
0.806184, 1.179153, 2.169012, 0.7647059, 0, 1, 1,
0.8063619, -2.08327, 3.435584, 0.7686275, 0, 1, 1,
0.807619, 0.1828051, 1.377252, 0.7764706, 0, 1, 1,
0.8094137, -0.9937194, 0.7771206, 0.7803922, 0, 1, 1,
0.8117506, 0.5221829, 0.9907491, 0.7882353, 0, 1, 1,
0.8309009, 0.7665673, 0.9349568, 0.7921569, 0, 1, 1,
0.8392937, 0.09572764, 1.025335, 0.8, 0, 1, 1,
0.8397312, -0.8291855, 2.361625, 0.8078431, 0, 1, 1,
0.8400059, 0.1950798, 1.090076, 0.8117647, 0, 1, 1,
0.8460254, -1.002535, 1.443217, 0.8196079, 0, 1, 1,
0.8485344, -1.043174, 1.487628, 0.8235294, 0, 1, 1,
0.8542481, 1.555523, 0.9100342, 0.8313726, 0, 1, 1,
0.8550208, -0.4262846, 2.608567, 0.8352941, 0, 1, 1,
0.8550664, 0.03883403, -0.04534055, 0.8431373, 0, 1, 1,
0.8622302, -1.319151, 2.17538, 0.8470588, 0, 1, 1,
0.8701631, 0.3205582, 1.853505, 0.854902, 0, 1, 1,
0.8709632, 0.2033997, 1.637907, 0.8588235, 0, 1, 1,
0.8756648, 0.256283, 1.233388, 0.8666667, 0, 1, 1,
0.8764294, 0.9702373, 0.4506816, 0.8705882, 0, 1, 1,
0.8813671, 1.207722, 0.557583, 0.8784314, 0, 1, 1,
0.8903012, -1.531229, 0.3299201, 0.8823529, 0, 1, 1,
0.8933384, -2.860381, 2.711819, 0.8901961, 0, 1, 1,
0.8944444, -0.2521927, 1.916237, 0.8941177, 0, 1, 1,
0.8964745, 1.44567, -0.1426603, 0.9019608, 0, 1, 1,
0.9027952, 0.7652338, 0.7754195, 0.9098039, 0, 1, 1,
0.9037906, 2.153366, -0.4235904, 0.9137255, 0, 1, 1,
0.9091675, 1.271839, 1.464904, 0.9215686, 0, 1, 1,
0.9113212, -1.433182, 2.822085, 0.9254902, 0, 1, 1,
0.9191993, 0.590661, 0.1853717, 0.9333333, 0, 1, 1,
0.9256536, 0.06797344, 3.367166, 0.9372549, 0, 1, 1,
0.934548, 0.06690405, 1.263744, 0.945098, 0, 1, 1,
0.9355118, -1.218825, 1.91721, 0.9490196, 0, 1, 1,
0.93918, 0.1180913, 1.333025, 0.9568627, 0, 1, 1,
0.9418575, 1.49466, 1.934405, 0.9607843, 0, 1, 1,
0.9488949, -0.005678592, 1.593634, 0.9686275, 0, 1, 1,
0.9494461, 0.9217409, 1.057291, 0.972549, 0, 1, 1,
0.952329, 1.001209, -0.4106776, 0.9803922, 0, 1, 1,
0.9527327, -1.450732, 0.8964968, 0.9843137, 0, 1, 1,
0.9536336, 0.1801556, 2.548857, 0.9921569, 0, 1, 1,
0.9649195, 1.448437, -1.275144, 0.9960784, 0, 1, 1,
0.9702686, 0.6784386, 0.2589423, 1, 0, 0.9960784, 1,
0.9876662, 0.9468026, 1.359061, 1, 0, 0.9882353, 1,
0.9926097, 0.6062261, 0.3675319, 1, 0, 0.9843137, 1,
0.9946578, 1.128205, -0.4341868, 1, 0, 0.9764706, 1,
0.9954162, 0.9313048, 2.448821, 1, 0, 0.972549, 1,
1.010171, 0.933703, -1.12198, 1, 0, 0.9647059, 1,
1.01118, 1.076253, 1.673248, 1, 0, 0.9607843, 1,
1.011775, -1.769531, 1.828001, 1, 0, 0.9529412, 1,
1.012651, -0.9606848, 1.97947, 1, 0, 0.9490196, 1,
1.012792, -2.171349, 2.069009, 1, 0, 0.9411765, 1,
1.015713, 1.072207, -0.4000818, 1, 0, 0.9372549, 1,
1.019411, -0.1013558, -0.3871926, 1, 0, 0.9294118, 1,
1.021295, -0.1264194, 2.067707, 1, 0, 0.9254902, 1,
1.022862, 0.2442433, 1.530791, 1, 0, 0.9176471, 1,
1.026004, -1.431633, 2.156434, 1, 0, 0.9137255, 1,
1.027546, 0.659668, 2.501674, 1, 0, 0.9058824, 1,
1.031144, 0.6146265, 0.8744457, 1, 0, 0.9019608, 1,
1.035817, -0.6455069, 2.581655, 1, 0, 0.8941177, 1,
1.036704, 0.7985355, 1.676243, 1, 0, 0.8862745, 1,
1.039441, 0.1753703, 2.079009, 1, 0, 0.8823529, 1,
1.046776, 0.8023742, 1.679228, 1, 0, 0.8745098, 1,
1.063065, -0.3910665, 1.828808, 1, 0, 0.8705882, 1,
1.063222, 1.060114, 1.25385, 1, 0, 0.8627451, 1,
1.065566, -0.2598245, 1.763525, 1, 0, 0.8588235, 1,
1.073697, -0.6472962, 2.71227, 1, 0, 0.8509804, 1,
1.076857, 1.064353, 2.874962, 1, 0, 0.8470588, 1,
1.077817, -0.9664108, 3.222461, 1, 0, 0.8392157, 1,
1.080849, 1.001273, -0.01072728, 1, 0, 0.8352941, 1,
1.083303, 0.9495237, 0.5406866, 1, 0, 0.827451, 1,
1.094154, -2.343637, 2.791076, 1, 0, 0.8235294, 1,
1.101057, 0.5990629, 0.4917504, 1, 0, 0.8156863, 1,
1.120814, 0.6276817, -0.643881, 1, 0, 0.8117647, 1,
1.12491, -0.8312888, 1.911372, 1, 0, 0.8039216, 1,
1.127957, 0.2976722, 1.576908, 1, 0, 0.7960784, 1,
1.130975, -0.9882028, 2.485947, 1, 0, 0.7921569, 1,
1.131501, -0.9604629, 0.8403144, 1, 0, 0.7843137, 1,
1.134917, 0.4483106, 0.5416779, 1, 0, 0.7803922, 1,
1.139841, -0.1159921, 1.143383, 1, 0, 0.772549, 1,
1.141544, 0.8547003, -0.2299174, 1, 0, 0.7686275, 1,
1.14298, -0.4405356, 2.338254, 1, 0, 0.7607843, 1,
1.156569, -0.9072173, 3.376105, 1, 0, 0.7568628, 1,
1.164334, -0.4995465, 2.735474, 1, 0, 0.7490196, 1,
1.166569, -0.6677408, 0.4739559, 1, 0, 0.7450981, 1,
1.170467, -0.9670155, 1.694841, 1, 0, 0.7372549, 1,
1.170714, -1.116485, 2.553033, 1, 0, 0.7333333, 1,
1.188149, 0.1628349, 2.112193, 1, 0, 0.7254902, 1,
1.189031, 1.154655, 1.305687, 1, 0, 0.7215686, 1,
1.193828, -0.8146016, 3.743636, 1, 0, 0.7137255, 1,
1.200953, 0.9139836, 0.758724, 1, 0, 0.7098039, 1,
1.203001, 0.06804588, 1.355937, 1, 0, 0.7019608, 1,
1.209015, 1.721874, 1.442638, 1, 0, 0.6941177, 1,
1.215467, -0.9248227, 2.638632, 1, 0, 0.6901961, 1,
1.217159, 1.558396, 0.417907, 1, 0, 0.682353, 1,
1.230142, 0.3181503, 0.984767, 1, 0, 0.6784314, 1,
1.241407, 0.7099522, 0.5683391, 1, 0, 0.6705883, 1,
1.246818, 0.97974, 1.828283, 1, 0, 0.6666667, 1,
1.25021, -1.05534, 1.891504, 1, 0, 0.6588235, 1,
1.254242, 0.05414556, 3.144332, 1, 0, 0.654902, 1,
1.261014, -1.334977, 1.560836, 1, 0, 0.6470588, 1,
1.272323, 2.091793, 0.5992313, 1, 0, 0.6431373, 1,
1.276015, 0.3536505, 0.8470733, 1, 0, 0.6352941, 1,
1.278288, 0.004432375, 2.378082, 1, 0, 0.6313726, 1,
1.2875, -0.8024505, 2.57472, 1, 0, 0.6235294, 1,
1.307681, 1.067497, 0.08891583, 1, 0, 0.6196079, 1,
1.320498, 2.902945, 2.268711, 1, 0, 0.6117647, 1,
1.330637, -0.730184, 0.740706, 1, 0, 0.6078432, 1,
1.335171, -0.04137494, 0.4372331, 1, 0, 0.6, 1,
1.340526, 1.069269, 0.6432201, 1, 0, 0.5921569, 1,
1.355712, -1.255229, 2.038089, 1, 0, 0.5882353, 1,
1.361754, 0.6108639, -0.05355663, 1, 0, 0.5803922, 1,
1.361807, -0.7785732, 3.194368, 1, 0, 0.5764706, 1,
1.371979, 0.3323688, 3.058546, 1, 0, 0.5686275, 1,
1.382945, 0.06173479, 2.445482, 1, 0, 0.5647059, 1,
1.390643, 0.1860425, 0.1823842, 1, 0, 0.5568628, 1,
1.394539, -0.4883073, 1.282843, 1, 0, 0.5529412, 1,
1.397608, -1.977785, 2.937182, 1, 0, 0.5450981, 1,
1.403068, -0.08637302, 0.1743354, 1, 0, 0.5411765, 1,
1.431036, 0.5801849, 1.894769, 1, 0, 0.5333334, 1,
1.431561, -1.093736, 2.336642, 1, 0, 0.5294118, 1,
1.434279, 1.586131, 1.664082, 1, 0, 0.5215687, 1,
1.434572, -1.204237, 1.720436, 1, 0, 0.5176471, 1,
1.43565, -0.7924088, 1.008546, 1, 0, 0.509804, 1,
1.440146, -0.234431, 4.378561, 1, 0, 0.5058824, 1,
1.446333, -0.2507371, -0.631853, 1, 0, 0.4980392, 1,
1.449043, -0.8173915, 2.536815, 1, 0, 0.4901961, 1,
1.453776, -0.2492887, 3.888019, 1, 0, 0.4862745, 1,
1.462466, -1.166755, 2.142308, 1, 0, 0.4784314, 1,
1.464923, 0.4667614, 2.5751, 1, 0, 0.4745098, 1,
1.469402, -2.633144, 2.974418, 1, 0, 0.4666667, 1,
1.473739, -2.727027, 3.801091, 1, 0, 0.4627451, 1,
1.474888, -1.127038, 1.592851, 1, 0, 0.454902, 1,
1.476397, 1.407026, 0.7259815, 1, 0, 0.4509804, 1,
1.482213, -0.4949804, 2.804203, 1, 0, 0.4431373, 1,
1.485916, 0.9292805, -0.3080018, 1, 0, 0.4392157, 1,
1.486451, -1.544481, 2.131099, 1, 0, 0.4313726, 1,
1.488494, 0.5405104, 1.929587, 1, 0, 0.427451, 1,
1.508732, -0.09700376, 1.196221, 1, 0, 0.4196078, 1,
1.513193, 0.2702344, 1.760327, 1, 0, 0.4156863, 1,
1.536772, -2.077003, 3.353445, 1, 0, 0.4078431, 1,
1.549676, 0.8995649, 0.9624565, 1, 0, 0.4039216, 1,
1.565197, -0.3613656, 2.45102, 1, 0, 0.3960784, 1,
1.576047, -0.8826578, 1.762143, 1, 0, 0.3882353, 1,
1.580987, 2.024322, -0.05103585, 1, 0, 0.3843137, 1,
1.581992, -0.1810692, 3.328974, 1, 0, 0.3764706, 1,
1.58224, 0.6898298, -0.7624638, 1, 0, 0.372549, 1,
1.588366, 0.8326886, 1.803112, 1, 0, 0.3647059, 1,
1.591709, 0.5519896, -0.3376906, 1, 0, 0.3607843, 1,
1.600798, 1.710608, -1.289951, 1, 0, 0.3529412, 1,
1.608397, -2.363101, 2.36564, 1, 0, 0.3490196, 1,
1.608673, -0.9489763, 3.19606, 1, 0, 0.3411765, 1,
1.612736, -0.8657058, 1.803396, 1, 0, 0.3372549, 1,
1.616577, -0.2648007, 0.9047567, 1, 0, 0.3294118, 1,
1.623926, -1.592661, 0.7903294, 1, 0, 0.3254902, 1,
1.643889, -0.03979518, 1.654902, 1, 0, 0.3176471, 1,
1.682696, -0.4646638, 0.8440303, 1, 0, 0.3137255, 1,
1.702768, 0.8549767, 0.3367515, 1, 0, 0.3058824, 1,
1.717162, -1.659976, 3.018538, 1, 0, 0.2980392, 1,
1.719329, -1.100347, 2.890111, 1, 0, 0.2941177, 1,
1.74526, -0.8719062, 0.7148847, 1, 0, 0.2862745, 1,
1.767095, -0.7094865, 2.606462, 1, 0, 0.282353, 1,
1.770033, -0.5976923, 1.666077, 1, 0, 0.2745098, 1,
1.778292, -0.1789166, 1.73812, 1, 0, 0.2705882, 1,
1.778641, 0.3898952, 1.984201, 1, 0, 0.2627451, 1,
1.803576, 1.067518, 1.249544, 1, 0, 0.2588235, 1,
1.826841, -1.626553, 1.43439, 1, 0, 0.2509804, 1,
1.840986, 0.5041271, 0.2320427, 1, 0, 0.2470588, 1,
1.843649, -0.05808488, 1.49374, 1, 0, 0.2392157, 1,
1.865617, 1.37102, -0.3343035, 1, 0, 0.2352941, 1,
1.869059, 0.6712247, 0.2230457, 1, 0, 0.227451, 1,
1.892898, 0.8428274, -0.6143207, 1, 0, 0.2235294, 1,
1.893015, -0.8311105, 1.466946, 1, 0, 0.2156863, 1,
1.895502, 0.9830804, 0.6494094, 1, 0, 0.2117647, 1,
1.896515, 0.08759534, 1.527402, 1, 0, 0.2039216, 1,
1.904025, 0.01750885, 0.4976343, 1, 0, 0.1960784, 1,
1.905821, -1.100881, 2.914998, 1, 0, 0.1921569, 1,
1.942419, 0.2168995, 1.081382, 1, 0, 0.1843137, 1,
1.971634, 0.188393, 0.2909264, 1, 0, 0.1803922, 1,
1.979197, 0.7254397, 2.392212, 1, 0, 0.172549, 1,
1.991095, -1.130209, 2.445204, 1, 0, 0.1686275, 1,
2.02985, 0.8359936, 0.7535831, 1, 0, 0.1607843, 1,
2.047738, -0.3072278, 1.978558, 1, 0, 0.1568628, 1,
2.087872, 0.6538311, 0.8913299, 1, 0, 0.1490196, 1,
2.097354, 1.559092, -0.2566563, 1, 0, 0.145098, 1,
2.108384, 1.358576, 1.573754, 1, 0, 0.1372549, 1,
2.111742, 0.5549994, 1.999647, 1, 0, 0.1333333, 1,
2.117263, 0.07677747, 1.982441, 1, 0, 0.1254902, 1,
2.125119, 0.4626685, 3.090302, 1, 0, 0.1215686, 1,
2.128788, -0.5863962, -0.1258469, 1, 0, 0.1137255, 1,
2.157562, 0.9201193, 0.8781847, 1, 0, 0.1098039, 1,
2.174734, -0.6947245, 3.187607, 1, 0, 0.1019608, 1,
2.180565, 0.5362906, 2.44292, 1, 0, 0.09411765, 1,
2.195081, -1.239834, 3.518901, 1, 0, 0.09019608, 1,
2.218801, 0.2214155, 2.459945, 1, 0, 0.08235294, 1,
2.274895, 0.5253149, 1.640601, 1, 0, 0.07843138, 1,
2.306704, 0.3166485, -0.2757232, 1, 0, 0.07058824, 1,
2.338306, -1.82088, 2.205519, 1, 0, 0.06666667, 1,
2.362584, 2.223263, 0.5030202, 1, 0, 0.05882353, 1,
2.422717, -1.161574, 1.934927, 1, 0, 0.05490196, 1,
2.499126, 0.2080992, 3.019406, 1, 0, 0.04705882, 1,
2.505152, 1.907032, 2.187236, 1, 0, 0.04313726, 1,
2.573644, -1.178196, 2.478442, 1, 0, 0.03529412, 1,
2.623022, 0.02417451, 0.6332323, 1, 0, 0.03137255, 1,
2.70178, -1.028498, 3.188959, 1, 0, 0.02352941, 1,
2.723658, 0.2291225, 0.7576898, 1, 0, 0.01960784, 1,
2.780221, 0.4454178, 2.876512, 1, 0, 0.01176471, 1,
2.787062, 0.2968016, 0.4353016, 1, 0, 0.007843138, 1
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
-0.4070745, -4.001119, -6.851742, 0, -0.5, 0.5, 0.5,
-0.4070745, -4.001119, -6.851742, 1, -0.5, 0.5, 0.5,
-0.4070745, -4.001119, -6.851742, 1, 1.5, 0.5, 0.5,
-0.4070745, -4.001119, -6.851742, 0, 1.5, 0.5, 0.5
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
-4.684023, 0.04355896, -6.851742, 0, -0.5, 0.5, 0.5,
-4.684023, 0.04355896, -6.851742, 1, -0.5, 0.5, 0.5,
-4.684023, 0.04355896, -6.851742, 1, 1.5, 0.5, 0.5,
-4.684023, 0.04355896, -6.851742, 0, 1.5, 0.5, 0.5
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
-4.684023, -4.001119, -0.2497549, 0, -0.5, 0.5, 0.5,
-4.684023, -4.001119, -0.2497549, 1, -0.5, 0.5, 0.5,
-4.684023, -4.001119, -0.2497549, 1, 1.5, 0.5, 0.5,
-4.684023, -4.001119, -0.2497549, 0, 1.5, 0.5, 0.5
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
-3, -3.067731, -5.328206,
2, -3.067731, -5.328206,
-3, -3.067731, -5.328206,
-3, -3.223296, -5.582129,
-2, -3.067731, -5.328206,
-2, -3.223296, -5.582129,
-1, -3.067731, -5.328206,
-1, -3.223296, -5.582129,
0, -3.067731, -5.328206,
0, -3.223296, -5.582129,
1, -3.067731, -5.328206,
1, -3.223296, -5.582129,
2, -3.067731, -5.328206,
2, -3.223296, -5.582129
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
-3, -3.534425, -6.089974, 0, -0.5, 0.5, 0.5,
-3, -3.534425, -6.089974, 1, -0.5, 0.5, 0.5,
-3, -3.534425, -6.089974, 1, 1.5, 0.5, 0.5,
-3, -3.534425, -6.089974, 0, 1.5, 0.5, 0.5,
-2, -3.534425, -6.089974, 0, -0.5, 0.5, 0.5,
-2, -3.534425, -6.089974, 1, -0.5, 0.5, 0.5,
-2, -3.534425, -6.089974, 1, 1.5, 0.5, 0.5,
-2, -3.534425, -6.089974, 0, 1.5, 0.5, 0.5,
-1, -3.534425, -6.089974, 0, -0.5, 0.5, 0.5,
-1, -3.534425, -6.089974, 1, -0.5, 0.5, 0.5,
-1, -3.534425, -6.089974, 1, 1.5, 0.5, 0.5,
-1, -3.534425, -6.089974, 0, 1.5, 0.5, 0.5,
0, -3.534425, -6.089974, 0, -0.5, 0.5, 0.5,
0, -3.534425, -6.089974, 1, -0.5, 0.5, 0.5,
0, -3.534425, -6.089974, 1, 1.5, 0.5, 0.5,
0, -3.534425, -6.089974, 0, 1.5, 0.5, 0.5,
1, -3.534425, -6.089974, 0, -0.5, 0.5, 0.5,
1, -3.534425, -6.089974, 1, -0.5, 0.5, 0.5,
1, -3.534425, -6.089974, 1, 1.5, 0.5, 0.5,
1, -3.534425, -6.089974, 0, 1.5, 0.5, 0.5,
2, -3.534425, -6.089974, 0, -0.5, 0.5, 0.5,
2, -3.534425, -6.089974, 1, -0.5, 0.5, 0.5,
2, -3.534425, -6.089974, 1, 1.5, 0.5, 0.5,
2, -3.534425, -6.089974, 0, 1.5, 0.5, 0.5
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
-3.697035, -2, -5.328206,
-3.697035, 3, -5.328206,
-3.697035, -2, -5.328206,
-3.861533, -2, -5.582129,
-3.697035, -1, -5.328206,
-3.861533, -1, -5.582129,
-3.697035, 0, -5.328206,
-3.861533, 0, -5.582129,
-3.697035, 1, -5.328206,
-3.861533, 1, -5.582129,
-3.697035, 2, -5.328206,
-3.861533, 2, -5.582129,
-3.697035, 3, -5.328206,
-3.861533, 3, -5.582129
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
-4.190529, -2, -6.089974, 0, -0.5, 0.5, 0.5,
-4.190529, -2, -6.089974, 1, -0.5, 0.5, 0.5,
-4.190529, -2, -6.089974, 1, 1.5, 0.5, 0.5,
-4.190529, -2, -6.089974, 0, 1.5, 0.5, 0.5,
-4.190529, -1, -6.089974, 0, -0.5, 0.5, 0.5,
-4.190529, -1, -6.089974, 1, -0.5, 0.5, 0.5,
-4.190529, -1, -6.089974, 1, 1.5, 0.5, 0.5,
-4.190529, -1, -6.089974, 0, 1.5, 0.5, 0.5,
-4.190529, 0, -6.089974, 0, -0.5, 0.5, 0.5,
-4.190529, 0, -6.089974, 1, -0.5, 0.5, 0.5,
-4.190529, 0, -6.089974, 1, 1.5, 0.5, 0.5,
-4.190529, 0, -6.089974, 0, 1.5, 0.5, 0.5,
-4.190529, 1, -6.089974, 0, -0.5, 0.5, 0.5,
-4.190529, 1, -6.089974, 1, -0.5, 0.5, 0.5,
-4.190529, 1, -6.089974, 1, 1.5, 0.5, 0.5,
-4.190529, 1, -6.089974, 0, 1.5, 0.5, 0.5,
-4.190529, 2, -6.089974, 0, -0.5, 0.5, 0.5,
-4.190529, 2, -6.089974, 1, -0.5, 0.5, 0.5,
-4.190529, 2, -6.089974, 1, 1.5, 0.5, 0.5,
-4.190529, 2, -6.089974, 0, 1.5, 0.5, 0.5,
-4.190529, 3, -6.089974, 0, -0.5, 0.5, 0.5,
-4.190529, 3, -6.089974, 1, -0.5, 0.5, 0.5,
-4.190529, 3, -6.089974, 1, 1.5, 0.5, 0.5,
-4.190529, 3, -6.089974, 0, 1.5, 0.5, 0.5
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
-3.697035, -3.067731, -4,
-3.697035, -3.067731, 4,
-3.697035, -3.067731, -4,
-3.861533, -3.223296, -4,
-3.697035, -3.067731, -2,
-3.861533, -3.223296, -2,
-3.697035, -3.067731, 0,
-3.861533, -3.223296, 0,
-3.697035, -3.067731, 2,
-3.861533, -3.223296, 2,
-3.697035, -3.067731, 4,
-3.861533, -3.223296, 4
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
-4.190529, -3.534425, -4, 0, -0.5, 0.5, 0.5,
-4.190529, -3.534425, -4, 1, -0.5, 0.5, 0.5,
-4.190529, -3.534425, -4, 1, 1.5, 0.5, 0.5,
-4.190529, -3.534425, -4, 0, 1.5, 0.5, 0.5,
-4.190529, -3.534425, -2, 0, -0.5, 0.5, 0.5,
-4.190529, -3.534425, -2, 1, -0.5, 0.5, 0.5,
-4.190529, -3.534425, -2, 1, 1.5, 0.5, 0.5,
-4.190529, -3.534425, -2, 0, 1.5, 0.5, 0.5,
-4.190529, -3.534425, 0, 0, -0.5, 0.5, 0.5,
-4.190529, -3.534425, 0, 1, -0.5, 0.5, 0.5,
-4.190529, -3.534425, 0, 1, 1.5, 0.5, 0.5,
-4.190529, -3.534425, 0, 0, 1.5, 0.5, 0.5,
-4.190529, -3.534425, 2, 0, -0.5, 0.5, 0.5,
-4.190529, -3.534425, 2, 1, -0.5, 0.5, 0.5,
-4.190529, -3.534425, 2, 1, 1.5, 0.5, 0.5,
-4.190529, -3.534425, 2, 0, 1.5, 0.5, 0.5,
-4.190529, -3.534425, 4, 0, -0.5, 0.5, 0.5,
-4.190529, -3.534425, 4, 1, -0.5, 0.5, 0.5,
-4.190529, -3.534425, 4, 1, 1.5, 0.5, 0.5,
-4.190529, -3.534425, 4, 0, 1.5, 0.5, 0.5
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
-3.697035, -3.067731, -5.328206,
-3.697035, 3.154849, -5.328206,
-3.697035, -3.067731, 4.828696,
-3.697035, 3.154849, 4.828696,
-3.697035, -3.067731, -5.328206,
-3.697035, -3.067731, 4.828696,
-3.697035, 3.154849, -5.328206,
-3.697035, 3.154849, 4.828696,
-3.697035, -3.067731, -5.328206,
2.882886, -3.067731, -5.328206,
-3.697035, -3.067731, 4.828696,
2.882886, -3.067731, 4.828696,
-3.697035, 3.154849, -5.328206,
2.882886, 3.154849, -5.328206,
-3.697035, 3.154849, 4.828696,
2.882886, 3.154849, 4.828696,
2.882886, -3.067731, -5.328206,
2.882886, 3.154849, -5.328206,
2.882886, -3.067731, 4.828696,
2.882886, 3.154849, 4.828696,
2.882886, -3.067731, -5.328206,
2.882886, -3.067731, 4.828696,
2.882886, 3.154849, -5.328206,
2.882886, 3.154849, 4.828696
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
var radius = 7.266425;
var distance = 32.32914;
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
mvMatrix.translate( 0.4070745, -0.04355896, 0.2497549 );
mvMatrix.scale( 1.194027, 1.262595, 0.7735233 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.32914);
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
ethanesulphonylamino<-read.table("ethanesulphonylamino.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethanesulphonylamino$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethanesulphonylamino' not found
```

```r
y<-ethanesulphonylamino$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethanesulphonylamino' not found
```

```r
z<-ethanesulphonylamino$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethanesulphonylamino' not found
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
-3.601211, -2.01588, -2.700618, 0, 0, 1, 1, 1,
-3.351451, -1.312552, -2.117557, 1, 0, 0, 1, 1,
-3.26514, -1.164136, -2.015107, 1, 0, 0, 1, 1,
-2.925363, -0.5156919, -1.969246, 1, 0, 0, 1, 1,
-2.828248, 2.403376, 0.3241207, 1, 0, 0, 1, 1,
-2.725433, -1.078035, -1.63862, 1, 0, 0, 1, 1,
-2.510635, 1.018546, -1.907848, 0, 0, 0, 1, 1,
-2.4821, -1.799942, -2.134256, 0, 0, 0, 1, 1,
-2.38386, 0.5060017, -3.494804, 0, 0, 0, 1, 1,
-2.383727, 1.762606, -2.378734, 0, 0, 0, 1, 1,
-2.368493, -0.4696623, -3.618769, 0, 0, 0, 1, 1,
-2.362013, 0.3423744, -2.045367, 0, 0, 0, 1, 1,
-2.326856, 0.4535661, -1.865293, 0, 0, 0, 1, 1,
-2.308029, 0.4131904, -0.004050356, 1, 1, 1, 1, 1,
-2.270261, -1.493066, -2.350685, 1, 1, 1, 1, 1,
-2.195284, 1.360709, 0.4244224, 1, 1, 1, 1, 1,
-2.190566, 0.5565036, -0.3524058, 1, 1, 1, 1, 1,
-2.158655, -0.02731829, -3.390707, 1, 1, 1, 1, 1,
-2.103575, 0.3191451, -1.23279, 1, 1, 1, 1, 1,
-2.103109, 0.01596916, -2.432377, 1, 1, 1, 1, 1,
-2.10265, -0.4159102, -2.18306, 1, 1, 1, 1, 1,
-2.053157, -0.07509169, -0.1822505, 1, 1, 1, 1, 1,
-2.048482, -0.8663845, -1.502641, 1, 1, 1, 1, 1,
-1.97699, 0.2393807, -2.164047, 1, 1, 1, 1, 1,
-1.976853, 0.1648506, -1.5526, 1, 1, 1, 1, 1,
-1.909401, -0.5414588, -0.4954742, 1, 1, 1, 1, 1,
-1.904686, -0.6580586, -1.975227, 1, 1, 1, 1, 1,
-1.896809, 0.8698486, -1.487165, 1, 1, 1, 1, 1,
-1.886961, 0.3218689, -2.653832, 0, 0, 1, 1, 1,
-1.885898, 1.067616, -1.716065, 1, 0, 0, 1, 1,
-1.858204, -1.308771, -3.286972, 1, 0, 0, 1, 1,
-1.846174, -0.851087, -2.275903, 1, 0, 0, 1, 1,
-1.816172, -1.216965, -4.812709, 1, 0, 0, 1, 1,
-1.807701, -0.1604024, -2.265992, 1, 0, 0, 1, 1,
-1.802927, 0.3282134, -3.012306, 0, 0, 0, 1, 1,
-1.787184, 0.4766245, -1.648986, 0, 0, 0, 1, 1,
-1.782138, 1.34957, -0.2728645, 0, 0, 0, 1, 1,
-1.774937, 0.4237224, -1.665533, 0, 0, 0, 1, 1,
-1.768848, -0.6096355, -1.432826, 0, 0, 0, 1, 1,
-1.757457, 0.7774376, -2.850255, 0, 0, 0, 1, 1,
-1.73824, 2.245973, 2.249705, 0, 0, 0, 1, 1,
-1.73729, -1.638159, -3.018946, 1, 1, 1, 1, 1,
-1.736814, -1.050394, -2.557354, 1, 1, 1, 1, 1,
-1.735944, -1.039321, -2.491583, 1, 1, 1, 1, 1,
-1.731029, -0.5016549, -1.574363, 1, 1, 1, 1, 1,
-1.730044, -0.01205235, -0.7177526, 1, 1, 1, 1, 1,
-1.72929, 1.189934, -1.733223, 1, 1, 1, 1, 1,
-1.68646, 0.5859022, -2.548331, 1, 1, 1, 1, 1,
-1.67951, -0.7935334, -1.482326, 1, 1, 1, 1, 1,
-1.66759, 0.4387438, -0.7524827, 1, 1, 1, 1, 1,
-1.665554, -0.5026443, -1.705223, 1, 1, 1, 1, 1,
-1.655081, -0.5667775, -2.791742, 1, 1, 1, 1, 1,
-1.648243, -0.5518507, -1.204805, 1, 1, 1, 1, 1,
-1.639374, -0.1843508, -3.595308, 1, 1, 1, 1, 1,
-1.63754, -1.258798, -3.455484, 1, 1, 1, 1, 1,
-1.635343, 0.6285816, 0.4057996, 1, 1, 1, 1, 1,
-1.633751, 0.5777079, -0.9033092, 0, 0, 1, 1, 1,
-1.632298, 0.8249515, -1.441245, 1, 0, 0, 1, 1,
-1.610101, 1.404883, 0.1015255, 1, 0, 0, 1, 1,
-1.602275, -0.2956161, -0.7848938, 1, 0, 0, 1, 1,
-1.587623, -0.02893984, -0.8742108, 1, 0, 0, 1, 1,
-1.581161, 1.146977, -1.368641, 1, 0, 0, 1, 1,
-1.579416, 0.335438, -0.3115892, 0, 0, 0, 1, 1,
-1.576784, 0.5125838, -1.283989, 0, 0, 0, 1, 1,
-1.574742, -0.3719516, -2.804747, 0, 0, 0, 1, 1,
-1.574508, 0.4256504, -0.4191212, 0, 0, 0, 1, 1,
-1.566906, -0.2817843, -3.21007, 0, 0, 0, 1, 1,
-1.564935, -0.1384402, -1.61833, 0, 0, 0, 1, 1,
-1.558118, -1.56799, -0.5823823, 0, 0, 0, 1, 1,
-1.547262, -1.354316, -1.006231, 1, 1, 1, 1, 1,
-1.540356, -1.602003, -3.631233, 1, 1, 1, 1, 1,
-1.535592, 0.842193, -2.670874, 1, 1, 1, 1, 1,
-1.534209, 1.440421, -0.5780981, 1, 1, 1, 1, 1,
-1.523008, 1.855525, -1.091387, 1, 1, 1, 1, 1,
-1.51844, -0.07894336, -2.036863, 1, 1, 1, 1, 1,
-1.518126, 0.6591293, -2.507255, 1, 1, 1, 1, 1,
-1.513463, 1.05003, -0.4722956, 1, 1, 1, 1, 1,
-1.51047, 1.354635, -1.592622, 1, 1, 1, 1, 1,
-1.510112, 1.611805, 0.3427177, 1, 1, 1, 1, 1,
-1.506702, -0.3663986, -3.630775, 1, 1, 1, 1, 1,
-1.499053, -0.07120921, -2.002822, 1, 1, 1, 1, 1,
-1.47791, 0.2010047, -0.1214859, 1, 1, 1, 1, 1,
-1.47176, -0.7930343, -0.1000561, 1, 1, 1, 1, 1,
-1.467926, -0.5622025, -1.325871, 1, 1, 1, 1, 1,
-1.456931, -0.2768778, -0.4820485, 0, 0, 1, 1, 1,
-1.455915, -2.762625, -2.997849, 1, 0, 0, 1, 1,
-1.4554, 1.729134, -1.119406, 1, 0, 0, 1, 1,
-1.451777, -1.214314, -3.83765, 1, 0, 0, 1, 1,
-1.446463, -0.171444, -2.367892, 1, 0, 0, 1, 1,
-1.442528, -1.347745, -0.6287002, 1, 0, 0, 1, 1,
-1.439183, -0.04720129, -1.134265, 0, 0, 0, 1, 1,
-1.438689, 0.3547873, -0.7167316, 0, 0, 0, 1, 1,
-1.435359, 2.012564, 0.1619077, 0, 0, 0, 1, 1,
-1.435223, 2.243192, 0.344862, 0, 0, 0, 1, 1,
-1.435151, -0.01520167, -2.999039, 0, 0, 0, 1, 1,
-1.430063, 0.6638541, -0.4070207, 0, 0, 0, 1, 1,
-1.425651, 1.291071, -0.714167, 0, 0, 0, 1, 1,
-1.420762, 0.8928452, -1.231178, 1, 1, 1, 1, 1,
-1.417703, 0.5041358, 0.3848762, 1, 1, 1, 1, 1,
-1.410747, 0.976851, -3.078308, 1, 1, 1, 1, 1,
-1.405811, -0.8963971, -3.283691, 1, 1, 1, 1, 1,
-1.403602, -0.1250867, -3.053764, 1, 1, 1, 1, 1,
-1.399622, -0.589541, 0.1305824, 1, 1, 1, 1, 1,
-1.394296, 0.007514544, -2.50109, 1, 1, 1, 1, 1,
-1.393184, -0.1824664, -3.352035, 1, 1, 1, 1, 1,
-1.389372, 0.07845685, -0.6963019, 1, 1, 1, 1, 1,
-1.387065, -1.419308, -3.304149, 1, 1, 1, 1, 1,
-1.385533, 0.4408353, -0.6820774, 1, 1, 1, 1, 1,
-1.379758, 0.8341606, -0.6833652, 1, 1, 1, 1, 1,
-1.376062, -0.1528107, -2.359125, 1, 1, 1, 1, 1,
-1.376051, 0.4131893, -2.846646, 1, 1, 1, 1, 1,
-1.350104, 0.4045527, -0.8080798, 1, 1, 1, 1, 1,
-1.3472, 0.916943, -1.111732, 0, 0, 1, 1, 1,
-1.321196, -0.5554868, -1.405959, 1, 0, 0, 1, 1,
-1.319163, -0.8392042, -3.187135, 1, 0, 0, 1, 1,
-1.316687, 0.00230391, -2.378813, 1, 0, 0, 1, 1,
-1.311265, -2.057598, -2.744879, 1, 0, 0, 1, 1,
-1.307703, -0.7299015, -0.05241733, 1, 0, 0, 1, 1,
-1.298093, 0.1926585, -0.132129, 0, 0, 0, 1, 1,
-1.296794, 1.209118, -1.543176, 0, 0, 0, 1, 1,
-1.293998, 0.3992174, -1.112311, 0, 0, 0, 1, 1,
-1.291186, -1.503411, -2.353346, 0, 0, 0, 1, 1,
-1.28053, -0.5500668, -3.309265, 0, 0, 0, 1, 1,
-1.278684, 0.92799, -0.6729504, 0, 0, 0, 1, 1,
-1.271171, -0.8624043, -2.592634, 0, 0, 0, 1, 1,
-1.268854, -1.391512, -1.84065, 1, 1, 1, 1, 1,
-1.268711, 1.016354, -0.07749387, 1, 1, 1, 1, 1,
-1.262865, 0.01771065, -0.8586583, 1, 1, 1, 1, 1,
-1.260127, -0.2900169, -0.6721185, 1, 1, 1, 1, 1,
-1.255609, -0.0951103, -3.316249, 1, 1, 1, 1, 1,
-1.251216, -0.0730873, -1.776227, 1, 1, 1, 1, 1,
-1.247428, -1.829212, -1.417395, 1, 1, 1, 1, 1,
-1.243139, -1.29028, -3.598578, 1, 1, 1, 1, 1,
-1.242425, -0.8190457, -3.433951, 1, 1, 1, 1, 1,
-1.239974, -0.8196471, -1.843233, 1, 1, 1, 1, 1,
-1.22949, -0.2323367, -1.537757, 1, 1, 1, 1, 1,
-1.226882, -0.7703716, -2.837951, 1, 1, 1, 1, 1,
-1.225056, -0.1478283, -1.789082, 1, 1, 1, 1, 1,
-1.21821, -0.1442997, -1.210279, 1, 1, 1, 1, 1,
-1.207218, -0.2560488, -2.197044, 1, 1, 1, 1, 1,
-1.198196, 1.0604, 0.09266129, 0, 0, 1, 1, 1,
-1.194686, 0.7579377, -0.4699105, 1, 0, 0, 1, 1,
-1.188016, -0.7447884, -0.7927449, 1, 0, 0, 1, 1,
-1.173426, 0.1855936, -2.197497, 1, 0, 0, 1, 1,
-1.166596, -0.2470074, -2.406677, 1, 0, 0, 1, 1,
-1.164546, 1.973088, -0.717293, 1, 0, 0, 1, 1,
-1.162976, 2.130537, -0.6157893, 0, 0, 0, 1, 1,
-1.158779, 1.158503, -0.2929282, 0, 0, 0, 1, 1,
-1.154986, -1.495465, -3.603234, 0, 0, 0, 1, 1,
-1.144496, -0.5545146, 0.2161377, 0, 0, 0, 1, 1,
-1.141963, -1.439292, -1.850502, 0, 0, 0, 1, 1,
-1.133512, 1.337194, -1.111058, 0, 0, 0, 1, 1,
-1.125672, 0.6412418, -0.6373286, 0, 0, 0, 1, 1,
-1.122183, 0.1050001, -3.095265, 1, 1, 1, 1, 1,
-1.121539, 0.4048588, -2.620329, 1, 1, 1, 1, 1,
-1.120375, 1.848695, -1.715298, 1, 1, 1, 1, 1,
-1.116681, -0.8064198, -1.513656, 1, 1, 1, 1, 1,
-1.111463, -0.2987182, -2.268233, 1, 1, 1, 1, 1,
-1.109832, -0.6351321, -2.41864, 1, 1, 1, 1, 1,
-1.102916, -0.2220166, -1.608534, 1, 1, 1, 1, 1,
-1.101589, -0.08634566, -3.05118, 1, 1, 1, 1, 1,
-1.096767, 0.2604717, 0.4906993, 1, 1, 1, 1, 1,
-1.08971, -0.8335662, 0.3398425, 1, 1, 1, 1, 1,
-1.089185, -0.02690337, -2.810546, 1, 1, 1, 1, 1,
-1.087042, -0.3229204, -0.5511503, 1, 1, 1, 1, 1,
-1.084515, -0.2360474, -1.040677, 1, 1, 1, 1, 1,
-1.078918, 1.114587, -0.2139005, 1, 1, 1, 1, 1,
-1.058518, -0.3488816, -1.433852, 1, 1, 1, 1, 1,
-1.054445, 1.905807, 0.6807537, 0, 0, 1, 1, 1,
-1.050976, 1.456372, 0.7469442, 1, 0, 0, 1, 1,
-1.050554, -0.494532, -2.456986, 1, 0, 0, 1, 1,
-1.04198, 0.8344716, -1.556071, 1, 0, 0, 1, 1,
-1.041422, -1.078796, -1.649088, 1, 0, 0, 1, 1,
-1.036768, 0.1403391, -2.578367, 1, 0, 0, 1, 1,
-1.02154, 1.062762, -1.453995, 0, 0, 0, 1, 1,
-1.016033, 0.296954, -1.69571, 0, 0, 0, 1, 1,
-1.015738, -0.9239917, -2.39473, 0, 0, 0, 1, 1,
-1.013033, 0.9640334, -1.111316, 0, 0, 0, 1, 1,
-1.007362, -1.903566, -2.29145, 0, 0, 0, 1, 1,
-1.002306, 1.091073, -1.076247, 0, 0, 0, 1, 1,
-0.9992378, -0.2444682, -2.128866, 0, 0, 0, 1, 1,
-0.9829202, -0.4549048, -1.514315, 1, 1, 1, 1, 1,
-0.9797347, -0.04920803, -1.858935, 1, 1, 1, 1, 1,
-0.9796945, -0.466834, -3.248479, 1, 1, 1, 1, 1,
-0.9787158, -1.704582, -3.397043, 1, 1, 1, 1, 1,
-0.9764954, -1.188769, -2.054344, 1, 1, 1, 1, 1,
-0.9761345, 0.5724971, -0.8041705, 1, 1, 1, 1, 1,
-0.9744079, -0.1967762, -1.269057, 1, 1, 1, 1, 1,
-0.9670076, 1.358258, -0.6396914, 1, 1, 1, 1, 1,
-0.9629019, -1.316281, -2.588559, 1, 1, 1, 1, 1,
-0.9582396, 0.335011, -2.947087, 1, 1, 1, 1, 1,
-0.9559706, -0.08939683, -2.482239, 1, 1, 1, 1, 1,
-0.9550238, 0.873015, -2.881678, 1, 1, 1, 1, 1,
-0.9534172, 0.1526984, 0.1747211, 1, 1, 1, 1, 1,
-0.9469007, -0.238298, -1.98919, 1, 1, 1, 1, 1,
-0.9379455, -0.9561973, -3.379953, 1, 1, 1, 1, 1,
-0.9289702, -0.4549189, -2.591128, 0, 0, 1, 1, 1,
-0.9133203, 0.07870778, -0.1289743, 1, 0, 0, 1, 1,
-0.8945406, -1.174116, -2.164281, 1, 0, 0, 1, 1,
-0.8925366, -0.5168663, -2.178357, 1, 0, 0, 1, 1,
-0.8922677, 0.3963832, -0.1797721, 1, 0, 0, 1, 1,
-0.8884452, 0.5135093, -1.389522, 1, 0, 0, 1, 1,
-0.8828416, 1.106667, 0.1027049, 0, 0, 0, 1, 1,
-0.8800021, -0.5601996, -1.455669, 0, 0, 0, 1, 1,
-0.8763029, -0.5268379, -1.767063, 0, 0, 0, 1, 1,
-0.8752303, 2.054858, -0.492452, 0, 0, 0, 1, 1,
-0.8710544, -0.2600596, -0.4251045, 0, 0, 0, 1, 1,
-0.8695472, -0.7622046, -0.9585932, 0, 0, 0, 1, 1,
-0.8664995, 0.2615874, -0.9251893, 0, 0, 0, 1, 1,
-0.8643495, -1.433696, -1.804652, 1, 1, 1, 1, 1,
-0.8633621, 0.2773434, -0.8544109, 1, 1, 1, 1, 1,
-0.8619485, -1.064106, -4.337107, 1, 1, 1, 1, 1,
-0.8570933, -1.477592, -2.522795, 1, 1, 1, 1, 1,
-0.8523166, 0.729979, -1.05753, 1, 1, 1, 1, 1,
-0.8490075, -0.4033858, -1.924397, 1, 1, 1, 1, 1,
-0.8485363, 1.739037, -0.8442722, 1, 1, 1, 1, 1,
-0.8476169, 1.697092, -1.074382, 1, 1, 1, 1, 1,
-0.8335492, -1.470132, -1.774427, 1, 1, 1, 1, 1,
-0.8285352, 0.2244767, -1.187314, 1, 1, 1, 1, 1,
-0.827531, -0.530867, -4.150313, 1, 1, 1, 1, 1,
-0.8233977, -0.5594931, -0.7186116, 1, 1, 1, 1, 1,
-0.822538, 0.4017249, -0.2454564, 1, 1, 1, 1, 1,
-0.8184897, -1.808102, -4.231814, 1, 1, 1, 1, 1,
-0.8181708, 1.952266, -1.030663, 1, 1, 1, 1, 1,
-0.813605, -0.629487, -1.270612, 0, 0, 1, 1, 1,
-0.8133519, 0.9658107, -0.03735202, 1, 0, 0, 1, 1,
-0.8133094, 1.385388, 0.9360409, 1, 0, 0, 1, 1,
-0.8129176, 0.2881964, 0.0487974, 1, 0, 0, 1, 1,
-0.8117587, -0.8444017, -3.472049, 1, 0, 0, 1, 1,
-0.810152, 0.7066798, 0.2847502, 1, 0, 0, 1, 1,
-0.8071845, 0.7506079, -0.9173815, 0, 0, 0, 1, 1,
-0.798942, -1.405709, -3.210073, 0, 0, 0, 1, 1,
-0.7947391, -1.705791, -2.347834, 0, 0, 0, 1, 1,
-0.7933666, -1.251335, -2.182441, 0, 0, 0, 1, 1,
-0.7890838, -0.2599691, -2.290945, 0, 0, 0, 1, 1,
-0.7883424, 0.8680112, -0.5473486, 0, 0, 0, 1, 1,
-0.7874357, 0.2579148, -2.578752, 0, 0, 0, 1, 1,
-0.781647, 1.234626, -0.5932493, 1, 1, 1, 1, 1,
-0.7697564, -1.065629, -1.988311, 1, 1, 1, 1, 1,
-0.7579527, -0.8719863, -0.9476207, 1, 1, 1, 1, 1,
-0.7558926, 0.2012584, -1.910046, 1, 1, 1, 1, 1,
-0.7523955, 0.1706739, -1.475291, 1, 1, 1, 1, 1,
-0.7466599, 1.810524, -1.400631, 1, 1, 1, 1, 1,
-0.7453277, 0.5227128, -4.369471, 1, 1, 1, 1, 1,
-0.7439745, -0.7672097, -2.825642, 1, 1, 1, 1, 1,
-0.7390501, 1.375175, -1.050847, 1, 1, 1, 1, 1,
-0.7370185, -0.6337272, -5.024446, 1, 1, 1, 1, 1,
-0.736724, 2.452554, 0.7437373, 1, 1, 1, 1, 1,
-0.7322866, 0.7551291, -0.9375389, 1, 1, 1, 1, 1,
-0.7321693, -2.522426, -2.87663, 1, 1, 1, 1, 1,
-0.7283344, -0.8218375, -2.828867, 1, 1, 1, 1, 1,
-0.7102233, 0.2285413, -1.960204, 1, 1, 1, 1, 1,
-0.7096432, 0.8855183, -1.135184, 0, 0, 1, 1, 1,
-0.6917602, 1.143938, -1.465079, 1, 0, 0, 1, 1,
-0.687242, -0.526745, -2.616615, 1, 0, 0, 1, 1,
-0.6859291, -0.2826606, -1.214492, 1, 0, 0, 1, 1,
-0.6790521, 0.3786749, -2.16727, 1, 0, 0, 1, 1,
-0.6769767, -0.2443279, -1.54484, 1, 0, 0, 1, 1,
-0.6766698, -0.8965181, -2.798553, 0, 0, 0, 1, 1,
-0.6759095, -1.353308, -1.7003, 0, 0, 0, 1, 1,
-0.675722, 1.77505, 0.6628938, 0, 0, 0, 1, 1,
-0.6742813, 0.3085317, 0.0295145, 0, 0, 0, 1, 1,
-0.6738028, -0.2113904, -1.966004, 0, 0, 0, 1, 1,
-0.6715649, 0.4875716, -1.4141, 0, 0, 0, 1, 1,
-0.6677546, -2.23492, -3.057265, 0, 0, 0, 1, 1,
-0.6609774, 0.6902508, 0.6068056, 1, 1, 1, 1, 1,
-0.6575145, 1.045529, -0.7546568, 1, 1, 1, 1, 1,
-0.6559041, 0.8151979, -1.153764, 1, 1, 1, 1, 1,
-0.6548119, -0.4491487, -1.546496, 1, 1, 1, 1, 1,
-0.654779, 1.753005, 1.768422, 1, 1, 1, 1, 1,
-0.6497809, 0.4538077, -1.285609, 1, 1, 1, 1, 1,
-0.6487643, 0.4875766, -2.823247, 1, 1, 1, 1, 1,
-0.6457576, 1.482599, -0.1693604, 1, 1, 1, 1, 1,
-0.6432569, -1.690976, -3.284115, 1, 1, 1, 1, 1,
-0.643178, 0.3928857, -1.390072, 1, 1, 1, 1, 1,
-0.6421297, -0.4339956, -2.485836, 1, 1, 1, 1, 1,
-0.6419378, 0.01203427, -1.33654, 1, 1, 1, 1, 1,
-0.6412956, -0.0573927, -2.296263, 1, 1, 1, 1, 1,
-0.6389394, -0.6571197, -2.274288, 1, 1, 1, 1, 1,
-0.6373391, -0.570376, 0.07153251, 1, 1, 1, 1, 1,
-0.6308275, -0.2060608, -1.555352, 0, 0, 1, 1, 1,
-0.6304277, 2.142372, 1.525705, 1, 0, 0, 1, 1,
-0.6151929, -0.1490052, -1.174922, 1, 0, 0, 1, 1,
-0.6116903, 0.4095179, -2.402356, 1, 0, 0, 1, 1,
-0.6079327, -1.178145, -3.120286, 1, 0, 0, 1, 1,
-0.6074761, 1.892335, -0.4087693, 1, 0, 0, 1, 1,
-0.5983879, -0.2632451, -1.923838, 0, 0, 0, 1, 1,
-0.5967671, 1.619051, 0.09324855, 0, 0, 0, 1, 1,
-0.594241, -0.1025791, -2.771844, 0, 0, 0, 1, 1,
-0.5903504, -2.614012, -4.133527, 0, 0, 0, 1, 1,
-0.587204, 1.433782, -1.20234, 0, 0, 0, 1, 1,
-0.5867476, 1.052991, -0.5937551, 0, 0, 0, 1, 1,
-0.5865185, -0.1879256, -2.964157, 0, 0, 0, 1, 1,
-0.5826969, 0.2867047, -3.140981, 1, 1, 1, 1, 1,
-0.5805366, 0.2066323, -1.231723, 1, 1, 1, 1, 1,
-0.5799937, -2.194111, -3.729656, 1, 1, 1, 1, 1,
-0.5783756, 0.04435348, -1.329995, 1, 1, 1, 1, 1,
-0.5716951, -0.1811779, -1.655533, 1, 1, 1, 1, 1,
-0.5709681, 1.220406, -2.142162, 1, 1, 1, 1, 1,
-0.5696437, 0.6540074, -0.6838392, 1, 1, 1, 1, 1,
-0.5691292, 0.2281286, -1.269287, 1, 1, 1, 1, 1,
-0.5680058, -1.512647, -1.601663, 1, 1, 1, 1, 1,
-0.5650758, 0.2868406, 0.1905626, 1, 1, 1, 1, 1,
-0.5648065, -1.661358, -4.723636, 1, 1, 1, 1, 1,
-0.5638821, 0.5362154, -2.198353, 1, 1, 1, 1, 1,
-0.5629624, -0.766017, -2.682601, 1, 1, 1, 1, 1,
-0.562869, 1.479427, 0.2962625, 1, 1, 1, 1, 1,
-0.5626209, -0.3798852, -1.746394, 1, 1, 1, 1, 1,
-0.5554622, 0.6007181, -1.248769, 0, 0, 1, 1, 1,
-0.5535476, -0.1500449, -3.133457, 1, 0, 0, 1, 1,
-0.5511785, -2.055328, -2.586817, 1, 0, 0, 1, 1,
-0.545464, 0.5319945, 1.153492, 1, 0, 0, 1, 1,
-0.5425932, -0.5031851, -1.609151, 1, 0, 0, 1, 1,
-0.5419744, 1.070163, -1.048829, 1, 0, 0, 1, 1,
-0.5369341, -0.7188414, -3.731193, 0, 0, 0, 1, 1,
-0.5332711, -0.1115519, -2.124455, 0, 0, 0, 1, 1,
-0.5229651, 1.904096, -0.1223544, 0, 0, 0, 1, 1,
-0.5208207, -1.935446, -4.867629, 0, 0, 0, 1, 1,
-0.5202574, -0.5396883, -2.660876, 0, 0, 0, 1, 1,
-0.5171329, 0.3331613, -1.760765, 0, 0, 0, 1, 1,
-0.5102237, 0.4823195, -0.7896683, 0, 0, 0, 1, 1,
-0.5099483, 1.743485, -0.6861968, 1, 1, 1, 1, 1,
-0.509612, 0.9475232, 0.6954222, 1, 1, 1, 1, 1,
-0.5080846, -0.7938201, -4.377244, 1, 1, 1, 1, 1,
-0.5080337, 0.4472909, -1.398089, 1, 1, 1, 1, 1,
-0.5063108, -1.046152, -3.178025, 1, 1, 1, 1, 1,
-0.5036297, -2.156531, -3.56865, 1, 1, 1, 1, 1,
-0.4998166, 0.3540561, -1.266647, 1, 1, 1, 1, 1,
-0.4976357, 0.3614627, -1.137925, 1, 1, 1, 1, 1,
-0.4965621, 0.8290077, 0.4234616, 1, 1, 1, 1, 1,
-0.4945506, -1.278222, -3.722438, 1, 1, 1, 1, 1,
-0.4936296, 1.178518, -0.9163113, 1, 1, 1, 1, 1,
-0.4923922, 0.8621002, 1.207636, 1, 1, 1, 1, 1,
-0.4919996, 0.04983447, -0.9140872, 1, 1, 1, 1, 1,
-0.4806169, 0.1399668, -1.02125, 1, 1, 1, 1, 1,
-0.4710204, -0.6566296, -2.682218, 1, 1, 1, 1, 1,
-0.4659972, 0.5913156, -1.643954, 0, 0, 1, 1, 1,
-0.4650163, -1.171028, -2.695229, 1, 0, 0, 1, 1,
-0.4633927, 1.694149, 0.6740524, 1, 0, 0, 1, 1,
-0.4626639, -0.05687197, -0.4924819, 1, 0, 0, 1, 1,
-0.4571725, 1.174315, 0.82042, 1, 0, 0, 1, 1,
-0.4570277, -0.248453, -0.8294814, 1, 0, 0, 1, 1,
-0.4534055, 2.515596, -0.9079501, 0, 0, 0, 1, 1,
-0.4509167, -1.473737, -4.122522, 0, 0, 0, 1, 1,
-0.4491325, 1.09861, -0.757251, 0, 0, 0, 1, 1,
-0.4419078, 0.5619738, 0.1685446, 0, 0, 0, 1, 1,
-0.4417664, 1.101516, 0.3787721, 0, 0, 0, 1, 1,
-0.4388968, -0.1260685, -3.178348, 0, 0, 0, 1, 1,
-0.4324579, -1.305665, -1.879786, 0, 0, 0, 1, 1,
-0.430133, 0.4965545, -1.04142, 1, 1, 1, 1, 1,
-0.4282627, -0.9143723, -1.563504, 1, 1, 1, 1, 1,
-0.4256705, 0.5462321, -1.207857, 1, 1, 1, 1, 1,
-0.424527, 0.9135571, -0.8658896, 1, 1, 1, 1, 1,
-0.4194714, -0.40188, 0.5432904, 1, 1, 1, 1, 1,
-0.4150326, -0.3095208, -2.043023, 1, 1, 1, 1, 1,
-0.4088383, -0.7268526, -4.033094, 1, 1, 1, 1, 1,
-0.4078004, -0.2670417, -2.141402, 1, 1, 1, 1, 1,
-0.4001301, 0.3841212, -0.8222485, 1, 1, 1, 1, 1,
-0.3961261, -0.2408351, -2.282149, 1, 1, 1, 1, 1,
-0.3944042, -1.107305, -2.455966, 1, 1, 1, 1, 1,
-0.3940403, 0.7355813, -0.07321558, 1, 1, 1, 1, 1,
-0.3939203, -0.3695435, -1.450506, 1, 1, 1, 1, 1,
-0.3935325, 1.315783, -0.1730473, 1, 1, 1, 1, 1,
-0.3933226, 0.3289154, -1.719398, 1, 1, 1, 1, 1,
-0.3926623, 0.7706375, -0.651767, 0, 0, 1, 1, 1,
-0.3924588, -1.603925, -2.058289, 1, 0, 0, 1, 1,
-0.3891899, 0.6084782, -0.1946457, 1, 0, 0, 1, 1,
-0.3888783, 0.7834384, -0.2192578, 1, 0, 0, 1, 1,
-0.3885216, 0.1821424, -0.7629817, 1, 0, 0, 1, 1,
-0.3851777, 0.5014653, -0.1735383, 1, 0, 0, 1, 1,
-0.3824783, 0.1844443, -1.37969, 0, 0, 0, 1, 1,
-0.376775, -0.6161408, -2.565089, 0, 0, 0, 1, 1,
-0.3753564, 1.07891, -0.2823508, 0, 0, 0, 1, 1,
-0.374359, 0.3343897, -1.40384, 0, 0, 0, 1, 1,
-0.3700411, 1.004218, -2.753045, 0, 0, 0, 1, 1,
-0.3670004, -0.1238184, -0.1862978, 0, 0, 0, 1, 1,
-0.3642075, -0.3183501, -2.094679, 0, 0, 0, 1, 1,
-0.3555471, 0.05466863, -1.309444, 1, 1, 1, 1, 1,
-0.3548656, -0.2290287, -4.216137, 1, 1, 1, 1, 1,
-0.3520081, -1.484907, -3.374825, 1, 1, 1, 1, 1,
-0.3519168, 0.3272663, 0.242692, 1, 1, 1, 1, 1,
-0.3510305, 1.390785, 1.031481, 1, 1, 1, 1, 1,
-0.3473489, -0.8595308, -2.687401, 1, 1, 1, 1, 1,
-0.3463902, -1.528428, -2.771801, 1, 1, 1, 1, 1,
-0.3458142, 1.114339, -1.341474, 1, 1, 1, 1, 1,
-0.3456506, 0.1066353, -2.064846, 1, 1, 1, 1, 1,
-0.3430327, 0.2041002, -1.451281, 1, 1, 1, 1, 1,
-0.3376577, 0.7655835, -0.8694111, 1, 1, 1, 1, 1,
-0.332642, -1.445089, -0.9690356, 1, 1, 1, 1, 1,
-0.3237597, 1.537979, -0.5550833, 1, 1, 1, 1, 1,
-0.314934, -0.05208183, -1.986914, 1, 1, 1, 1, 1,
-0.3148996, -0.882699, -3.58573, 1, 1, 1, 1, 1,
-0.314099, 1.156347, -0.6838919, 0, 0, 1, 1, 1,
-0.3128065, 0.8175509, 0.45871, 1, 0, 0, 1, 1,
-0.3107295, -0.3816292, -3.736999, 1, 0, 0, 1, 1,
-0.3068316, -0.04499247, -1.566322, 1, 0, 0, 1, 1,
-0.3047573, -1.496605, -3.647072, 1, 0, 0, 1, 1,
-0.2999677, 1.411948, -1.480779, 1, 0, 0, 1, 1,
-0.295289, 0.6755269, 0.4400406, 0, 0, 0, 1, 1,
-0.2931794, 0.5216605, 0.002465304, 0, 0, 0, 1, 1,
-0.2922824, 0.4480619, -2.586224, 0, 0, 0, 1, 1,
-0.2916839, -0.06017991, -1.991484, 0, 0, 0, 1, 1,
-0.2860669, -0.1567028, -1.137398, 0, 0, 0, 1, 1,
-0.2834886, 0.5172522, -0.03986068, 0, 0, 0, 1, 1,
-0.2816327, 0.655765, -0.685694, 0, 0, 0, 1, 1,
-0.2801014, -0.6987956, -2.572989, 1, 1, 1, 1, 1,
-0.2794895, -2.915109, -3.67084, 1, 1, 1, 1, 1,
-0.2782696, -0.8843268, -2.937261, 1, 1, 1, 1, 1,
-0.2759011, -1.677694, -4.54916, 1, 1, 1, 1, 1,
-0.2729574, -0.5693724, -1.99366, 1, 1, 1, 1, 1,
-0.2727677, 0.6242038, 0.2101865, 1, 1, 1, 1, 1,
-0.2680784, -1.411527, -4.519493, 1, 1, 1, 1, 1,
-0.2670389, 0.07830771, -0.6067154, 1, 1, 1, 1, 1,
-0.2653171, -0.6213683, -3.159533, 1, 1, 1, 1, 1,
-0.2649325, 0.8081567, -0.3825437, 1, 1, 1, 1, 1,
-0.2634108, -0.528161, -3.429021, 1, 1, 1, 1, 1,
-0.2579822, -0.1909893, -2.514957, 1, 1, 1, 1, 1,
-0.2579695, 1.545358, 1.618044, 1, 1, 1, 1, 1,
-0.2556224, 0.6029879, 1.125199, 1, 1, 1, 1, 1,
-0.2540577, -0.1892944, -1.093869, 1, 1, 1, 1, 1,
-0.2524393, -0.3221218, -2.047195, 0, 0, 1, 1, 1,
-0.2439454, 1.439319, -0.408702, 1, 0, 0, 1, 1,
-0.2433804, -0.5510178, -1.491882, 1, 0, 0, 1, 1,
-0.2375065, 0.04701738, -0.3895261, 1, 0, 0, 1, 1,
-0.2333561, 0.8589791, -0.04820878, 1, 0, 0, 1, 1,
-0.2316388, -1.401642, -4.671679, 1, 0, 0, 1, 1,
-0.2315174, -0.3827338, -1.983428, 0, 0, 0, 1, 1,
-0.2306049, -1.378631, -3.637011, 0, 0, 0, 1, 1,
-0.2263194, -0.1278545, -1.305934, 0, 0, 0, 1, 1,
-0.2251399, 1.9651, -1.08543, 0, 0, 0, 1, 1,
-0.2237302, -0.03075094, -2.507924, 0, 0, 0, 1, 1,
-0.2227287, -0.6869516, -3.171801, 0, 0, 0, 1, 1,
-0.220301, 0.3079255, -0.524245, 0, 0, 0, 1, 1,
-0.2184924, -1.422124, -2.15269, 1, 1, 1, 1, 1,
-0.2181384, 1.214237, -1.48438, 1, 1, 1, 1, 1,
-0.2142879, -0.6204609, -3.661677, 1, 1, 1, 1, 1,
-0.2136985, -0.4383712, -4.301702, 1, 1, 1, 1, 1,
-0.2136951, 2.229132, 1.625262, 1, 1, 1, 1, 1,
-0.2115148, -2.103602, -3.471497, 1, 1, 1, 1, 1,
-0.2112873, -0.7956587, -3.285192, 1, 1, 1, 1, 1,
-0.207702, 1.148059, 0.7046871, 1, 1, 1, 1, 1,
-0.2036187, 0.1562867, -0.8202822, 1, 1, 1, 1, 1,
-0.2006842, -0.7885919, -3.451965, 1, 1, 1, 1, 1,
-0.2004811, -2.977111, -2.393941, 1, 1, 1, 1, 1,
-0.1974052, -0.1127901, -1.148234, 1, 1, 1, 1, 1,
-0.1911104, -0.1456743, -1.501468, 1, 1, 1, 1, 1,
-0.1873791, 2.030504, 0.4681585, 1, 1, 1, 1, 1,
-0.1845276, -0.5079501, -2.17695, 1, 1, 1, 1, 1,
-0.1819583, -1.460693, -3.145389, 0, 0, 1, 1, 1,
-0.1803137, 0.3976044, 0.2822694, 1, 0, 0, 1, 1,
-0.1789397, -1.883254, -3.302578, 1, 0, 0, 1, 1,
-0.1785069, 0.04246045, -3.309585, 1, 0, 0, 1, 1,
-0.1782145, -1.220495, -5.09524, 1, 0, 0, 1, 1,
-0.1670122, -0.89274, -1.616646, 1, 0, 0, 1, 1,
-0.1629869, 0.7426792, 1.899853, 0, 0, 0, 1, 1,
-0.1618101, -1.034758, -2.477047, 0, 0, 0, 1, 1,
-0.159877, 0.2764364, 0.2959011, 0, 0, 0, 1, 1,
-0.1557473, 0.1691882, -0.4382268, 0, 0, 0, 1, 1,
-0.1553585, 1.276478, -1.051912, 0, 0, 0, 1, 1,
-0.1520975, 0.7081727, -1.700127, 0, 0, 0, 1, 1,
-0.1519089, -1.292724, -3.029469, 0, 0, 0, 1, 1,
-0.1500782, 1.08179, -2.094534, 1, 1, 1, 1, 1,
-0.1437476, 0.05317089, 0.6506377, 1, 1, 1, 1, 1,
-0.1430642, -0.1344184, -4.080533, 1, 1, 1, 1, 1,
-0.142058, 1.771196, 0.5273857, 1, 1, 1, 1, 1,
-0.1412479, 0.4219472, 0.6340597, 1, 1, 1, 1, 1,
-0.1372041, -1.219769, -4.72057, 1, 1, 1, 1, 1,
-0.1360997, 0.3324065, -1.137664, 1, 1, 1, 1, 1,
-0.1333609, -1.399533, -1.493123, 1, 1, 1, 1, 1,
-0.1321329, 0.1298306, -1.308269, 1, 1, 1, 1, 1,
-0.128015, 0.05548714, -1.789829, 1, 1, 1, 1, 1,
-0.1275294, -1.846977, -3.178744, 1, 1, 1, 1, 1,
-0.1241278, -0.7326534, -4.470493, 1, 1, 1, 1, 1,
-0.1236809, 0.5290571, -0.434171, 1, 1, 1, 1, 1,
-0.1208652, 0.6503391, -1.202441, 1, 1, 1, 1, 1,
-0.1202952, -0.9502639, -3.216596, 1, 1, 1, 1, 1,
-0.1179738, 1.103065, 0.6635568, 0, 0, 1, 1, 1,
-0.1139953, 0.9680855, 0.1383167, 1, 0, 0, 1, 1,
-0.1134721, -0.1928409, -2.206951, 1, 0, 0, 1, 1,
-0.1090981, 0.293495, -0.5433422, 1, 0, 0, 1, 1,
-0.1080626, -0.5787247, -4.789677, 1, 0, 0, 1, 1,
-0.106013, 0.4842955, -1.047165, 1, 0, 0, 1, 1,
-0.1038453, -0.1496812, -1.120666, 0, 0, 0, 1, 1,
-0.1029874, -0.7745427, -2.868482, 0, 0, 0, 1, 1,
-0.09930808, -1.361136, -1.960256, 0, 0, 0, 1, 1,
-0.0837588, 0.2545667, 1.015734, 0, 0, 0, 1, 1,
-0.08103313, -0.993295, -4.466528, 0, 0, 0, 1, 1,
-0.08076383, 0.6239345, -0.7741158, 0, 0, 0, 1, 1,
-0.07803801, 0.2253527, 0.9287736, 0, 0, 0, 1, 1,
-0.07593096, 0.0938585, 0.9665768, 1, 1, 1, 1, 1,
-0.0753423, -0.9256459, -3.509551, 1, 1, 1, 1, 1,
-0.07071287, -0.2292257, -4.707577, 1, 1, 1, 1, 1,
-0.0675901, -0.2662162, -4.037617, 1, 1, 1, 1, 1,
-0.06635924, 0.05679422, -0.2194248, 1, 1, 1, 1, 1,
-0.06495272, -0.1288772, -0.6857063, 1, 1, 1, 1, 1,
-0.06386406, 0.423658, 1.409223, 1, 1, 1, 1, 1,
-0.06222518, -0.1104443, -2.128067, 1, 1, 1, 1, 1,
-0.06207394, -0.8854952, -1.882277, 1, 1, 1, 1, 1,
-0.06003004, -0.8195263, -4.223986, 1, 1, 1, 1, 1,
-0.05762475, 0.04843248, -0.5928299, 1, 1, 1, 1, 1,
-0.05688853, -0.6024188, -2.161374, 1, 1, 1, 1, 1,
-0.05576768, 1.918495, 2.298552, 1, 1, 1, 1, 1,
-0.05572941, 0.1009696, -2.011346, 1, 1, 1, 1, 1,
-0.05249278, 0.3868116, -0.5459498, 1, 1, 1, 1, 1,
-0.05091392, 1.594565, -0.2424588, 0, 0, 1, 1, 1,
-0.05021517, -0.4761454, -2.157569, 1, 0, 0, 1, 1,
-0.05013525, -1.560625, -5.18029, 1, 0, 0, 1, 1,
-0.0495039, 0.2322306, 0.3437062, 1, 0, 0, 1, 1,
-0.04224074, -1.481095, -3.012074, 1, 0, 0, 1, 1,
-0.03870395, 0.9025356, 0.7815149, 1, 0, 0, 1, 1,
-0.03520929, 0.3249082, -1.21946, 0, 0, 0, 1, 1,
-0.0322532, -0.3566725, -2.489913, 0, 0, 0, 1, 1,
-0.0284365, 0.2309058, -1.96281, 0, 0, 0, 1, 1,
-0.02819329, 0.5925756, 0.3680577, 0, 0, 0, 1, 1,
-0.02495189, 0.03888769, -1.44313, 0, 0, 0, 1, 1,
-0.02462685, -0.7247045, -2.045542, 0, 0, 0, 1, 1,
-0.02170657, -1.791796, -4.20199, 0, 0, 0, 1, 1,
-0.02166307, -0.3755972, -2.196754, 1, 1, 1, 1, 1,
-0.01945884, 0.6081388, -0.4469708, 1, 1, 1, 1, 1,
-0.0188808, 0.252167, -0.4409015, 1, 1, 1, 1, 1,
-0.01607785, -0.4589289, -2.45583, 1, 1, 1, 1, 1,
-0.01193842, -0.4618956, -4.379951, 1, 1, 1, 1, 1,
-0.0116613, 0.1369879, 0.5817428, 1, 1, 1, 1, 1,
-0.01154366, -1.56918, -2.750329, 1, 1, 1, 1, 1,
-0.009186784, 0.8177955, 1.329773, 1, 1, 1, 1, 1,
-0.007593311, 0.04722079, 0.027075, 1, 1, 1, 1, 1,
-0.006694266, 0.08686603, -2.250111, 1, 1, 1, 1, 1,
-0.006599615, 0.9684723, 0.1439365, 1, 1, 1, 1, 1,
-4.478419e-05, 0.2865736, -1.757845, 1, 1, 1, 1, 1,
0.008808482, -0.2678122, 4.147952, 1, 1, 1, 1, 1,
0.009142267, -0.7564445, 2.608051, 1, 1, 1, 1, 1,
0.00947143, 0.1180063, -0.4103895, 1, 1, 1, 1, 1,
0.01131788, 0.3473088, 0.2673281, 0, 0, 1, 1, 1,
0.01298148, -0.6688053, 4.317226, 1, 0, 0, 1, 1,
0.01326026, -1.539404, 3.176368, 1, 0, 0, 1, 1,
0.0152148, -1.109071, 3.905319, 1, 0, 0, 1, 1,
0.01717392, 1.067609, -0.07840856, 1, 0, 0, 1, 1,
0.02197669, 0.8787857, -0.1062795, 1, 0, 0, 1, 1,
0.03363954, -0.6462384, 4.085366, 0, 0, 0, 1, 1,
0.03643686, 2.588296, 0.07967931, 0, 0, 0, 1, 1,
0.0452585, -1.057637, 2.303608, 0, 0, 0, 1, 1,
0.04584813, -0.02204915, 2.834596, 0, 0, 0, 1, 1,
0.04734462, -0.2110615, 3.124011, 0, 0, 0, 1, 1,
0.04954505, -0.1013298, 3.142394, 0, 0, 0, 1, 1,
0.0546518, -0.4383175, 2.96351, 0, 0, 0, 1, 1,
0.05487221, 0.9612899, 0.1123085, 1, 1, 1, 1, 1,
0.05528304, 1.454982, -0.5712028, 1, 1, 1, 1, 1,
0.05626504, 0.1435151, 0.6960487, 1, 1, 1, 1, 1,
0.05889665, 1.975697, -0.6587106, 1, 1, 1, 1, 1,
0.06439392, -0.3403378, 4.506975, 1, 1, 1, 1, 1,
0.06654335, 1.10922, 0.6964692, 1, 1, 1, 1, 1,
0.06920031, -1.349033, 2.338392, 1, 1, 1, 1, 1,
0.0728633, -0.669166, 4.32169, 1, 1, 1, 1, 1,
0.07331465, -0.4795718, 3.677407, 1, 1, 1, 1, 1,
0.0734278, 0.6939304, -2.043581, 1, 1, 1, 1, 1,
0.07476458, 0.9103973, 0.4871552, 1, 1, 1, 1, 1,
0.07600618, 0.7212264, 0.08114661, 1, 1, 1, 1, 1,
0.07736954, 1.192089, -0.3175717, 1, 1, 1, 1, 1,
0.07778338, -0.07528347, 2.536345, 1, 1, 1, 1, 1,
0.0791354, -1.234982, 1.745493, 1, 1, 1, 1, 1,
0.08147502, 1.328479, 0.3477497, 0, 0, 1, 1, 1,
0.0819898, -0.4257274, 3.89257, 1, 0, 0, 1, 1,
0.08239223, 0.1929382, -0.3309343, 1, 0, 0, 1, 1,
0.08494177, -0.4483629, 3.024945, 1, 0, 0, 1, 1,
0.0900216, -0.09192473, 0.9047757, 1, 0, 0, 1, 1,
0.09116831, -1.730749, 3.42686, 1, 0, 0, 1, 1,
0.09307807, 1.819245, 0.4727038, 0, 0, 0, 1, 1,
0.09480315, -0.1621603, 2.093688, 0, 0, 0, 1, 1,
0.0953069, 1.261537, 1.601034, 0, 0, 0, 1, 1,
0.09836464, -0.9124988, 4.236543, 0, 0, 0, 1, 1,
0.09973942, -0.6639958, 3.679849, 0, 0, 0, 1, 1,
0.1030622, 2.202516, -0.5680147, 0, 0, 0, 1, 1,
0.1032264, -0.07999013, 3.971598, 0, 0, 0, 1, 1,
0.1080573, -0.9679567, 2.805218, 1, 1, 1, 1, 1,
0.1112119, -0.577047, 4.68078, 1, 1, 1, 1, 1,
0.1130582, 0.2636969, 0.5356411, 1, 1, 1, 1, 1,
0.1152734, 0.2040098, 0.8589898, 1, 1, 1, 1, 1,
0.1156728, -1.092965, 2.871047, 1, 1, 1, 1, 1,
0.1174243, -2.087014, 3.450865, 1, 1, 1, 1, 1,
0.1215138, 0.7517631, -0.5267418, 1, 1, 1, 1, 1,
0.1304092, 1.549047, -0.5268056, 1, 1, 1, 1, 1,
0.1316663, -0.3314581, 2.480808, 1, 1, 1, 1, 1,
0.1329368, 1.695371, 1.67796, 1, 1, 1, 1, 1,
0.1368464, -0.3862568, 3.613101, 1, 1, 1, 1, 1,
0.1391232, -1.177402, 2.014204, 1, 1, 1, 1, 1,
0.1420248, 1.696917, 1.282373, 1, 1, 1, 1, 1,
0.1428209, 0.4401245, 0.5558253, 1, 1, 1, 1, 1,
0.1429903, -1.10559, 3.75373, 1, 1, 1, 1, 1,
0.1456362, 0.1337232, -0.8306991, 0, 0, 1, 1, 1,
0.1460463, -0.3230843, -0.0791181, 1, 0, 0, 1, 1,
0.1461658, -0.5324948, 3.78239, 1, 0, 0, 1, 1,
0.1467612, -0.8839597, 1.772535, 1, 0, 0, 1, 1,
0.1504091, -0.4704969, 2.954989, 1, 0, 0, 1, 1,
0.1514678, -0.7446668, 2.566653, 1, 0, 0, 1, 1,
0.1549255, 0.6194512, 1.216507, 0, 0, 0, 1, 1,
0.1563699, 0.4204046, 0.178194, 0, 0, 0, 1, 1,
0.1577456, -0.6508424, 1.184958, 0, 0, 0, 1, 1,
0.1674407, -0.4694884, 2.253188, 0, 0, 0, 1, 1,
0.1679435, -0.4629301, 2.071978, 0, 0, 0, 1, 1,
0.169539, 0.1094813, 2.49615, 0, 0, 0, 1, 1,
0.1701118, 3.064229, 1.007936, 0, 0, 0, 1, 1,
0.1704981, -0.24424, 2.390024, 1, 1, 1, 1, 1,
0.1734097, 0.1901977, 1.525939, 1, 1, 1, 1, 1,
0.1756589, -0.6814023, 1.974029, 1, 1, 1, 1, 1,
0.1765519, -1.206809, 1.96035, 1, 1, 1, 1, 1,
0.1810351, 1.96703, 1.686039, 1, 1, 1, 1, 1,
0.1814089, 1.396486, -0.7393235, 1, 1, 1, 1, 1,
0.1861552, 1.56331, -1.170297, 1, 1, 1, 1, 1,
0.1872835, 1.110921, 1.456828, 1, 1, 1, 1, 1,
0.1875027, -0.9723591, 1.400892, 1, 1, 1, 1, 1,
0.1900242, 0.8562757, 0.2695907, 1, 1, 1, 1, 1,
0.1928096, 1.152886, 0.606348, 1, 1, 1, 1, 1,
0.1967101, -0.2345161, 2.224546, 1, 1, 1, 1, 1,
0.1995274, 2.02691, 2.01119, 1, 1, 1, 1, 1,
0.2019238, -0.996511, 1.88377, 1, 1, 1, 1, 1,
0.2033995, -0.7088921, 2.032635, 1, 1, 1, 1, 1,
0.2044115, -0.1783147, 2.568809, 0, 0, 1, 1, 1,
0.2078153, 0.4104864, 0.4621271, 1, 0, 0, 1, 1,
0.2111051, -0.6964478, 2.210348, 1, 0, 0, 1, 1,
0.2165122, -1.004502, 2.672196, 1, 0, 0, 1, 1,
0.2195473, 1.03597, 0.9718423, 1, 0, 0, 1, 1,
0.2199986, 0.3530251, 1.860774, 1, 0, 0, 1, 1,
0.2201743, -0.5306199, 2.68737, 0, 0, 0, 1, 1,
0.2212074, 0.3559978, 1.209246, 0, 0, 0, 1, 1,
0.2283422, 0.1769803, 1.350772, 0, 0, 0, 1, 1,
0.2295189, 1.3611, -0.9735156, 0, 0, 0, 1, 1,
0.2358938, -0.8376922, 2.477552, 0, 0, 0, 1, 1,
0.2426081, 1.117134, -0.3679661, 0, 0, 0, 1, 1,
0.2443805, -0.9753392, 3.578469, 0, 0, 0, 1, 1,
0.2454568, 2.049712, -0.05970667, 1, 1, 1, 1, 1,
0.2463478, 1.40607, -2.128074, 1, 1, 1, 1, 1,
0.24646, -0.5404329, 2.313591, 1, 1, 1, 1, 1,
0.2479022, -0.6061949, 3.252353, 1, 1, 1, 1, 1,
0.2496781, -0.8014867, 2.123675, 1, 1, 1, 1, 1,
0.2514528, -0.7569016, 4.423569, 1, 1, 1, 1, 1,
0.2545972, 0.9180697, 0.779419, 1, 1, 1, 1, 1,
0.2557156, 0.8765733, -1.07949, 1, 1, 1, 1, 1,
0.2585807, -0.9508265, 1.146186, 1, 1, 1, 1, 1,
0.2679569, -0.3735262, 0.687327, 1, 1, 1, 1, 1,
0.2753583, -1.889936, 3.029422, 1, 1, 1, 1, 1,
0.2755797, -0.005713196, 1.388772, 1, 1, 1, 1, 1,
0.276317, -0.6355734, 4.086748, 1, 1, 1, 1, 1,
0.2764863, 0.2348038, 1.747615, 1, 1, 1, 1, 1,
0.277551, 1.028055, 0.2193209, 1, 1, 1, 1, 1,
0.2800772, -0.7166739, 2.075501, 0, 0, 1, 1, 1,
0.2863085, -0.4985427, 2.870403, 1, 0, 0, 1, 1,
0.2881747, -0.2068949, 3.858342, 1, 0, 0, 1, 1,
0.294403, 0.6428686, 0.06564719, 1, 0, 0, 1, 1,
0.2979606, -0.377116, 0.6959975, 1, 0, 0, 1, 1,
0.3014769, 1.528679, -0.0927214, 1, 0, 0, 1, 1,
0.3023762, 0.87194, -0.2328739, 0, 0, 0, 1, 1,
0.3102772, 0.738093, -0.3376569, 0, 0, 0, 1, 1,
0.3149596, -1.115718, 2.582383, 0, 0, 0, 1, 1,
0.3327556, -0.1189243, 1.099887, 0, 0, 0, 1, 1,
0.33913, 1.120914, 0.5319415, 0, 0, 0, 1, 1,
0.3398343, -0.7931852, 3.166958, 0, 0, 0, 1, 1,
0.3405693, 0.7995306, -0.7710381, 0, 0, 0, 1, 1,
0.343179, -0.8861904, 3.934364, 1, 1, 1, 1, 1,
0.3446518, -0.9598793, 1.85136, 1, 1, 1, 1, 1,
0.3469656, -1.020497, 2.563442, 1, 1, 1, 1, 1,
0.3488719, 1.121481, 0.5594423, 1, 1, 1, 1, 1,
0.3501557, -0.002328264, 2.586667, 1, 1, 1, 1, 1,
0.3549208, -0.2817471, 2.547191, 1, 1, 1, 1, 1,
0.3556179, 0.87077, 0.4246337, 1, 1, 1, 1, 1,
0.3587253, -0.9763712, 0.7574615, 1, 1, 1, 1, 1,
0.3644604, 1.684001, 1.920159, 1, 1, 1, 1, 1,
0.3655694, 0.115607, 0.6282107, 1, 1, 1, 1, 1,
0.3663857, 1.478534, 0.8561567, 1, 1, 1, 1, 1,
0.3718349, -2.416295, 2.38165, 1, 1, 1, 1, 1,
0.3720304, 0.1543673, -0.2543508, 1, 1, 1, 1, 1,
0.3732223, 2.541415, -0.8378084, 1, 1, 1, 1, 1,
0.3763123, 0.2271386, 0.7886541, 1, 1, 1, 1, 1,
0.377082, 1.109239, 0.9223489, 0, 0, 1, 1, 1,
0.3784189, -1.912747, 2.932936, 1, 0, 0, 1, 1,
0.3796298, 0.3705751, 0.3942366, 1, 0, 0, 1, 1,
0.3898609, -0.2367736, 2.578023, 1, 0, 0, 1, 1,
0.3909339, -0.3823, 2.757145, 1, 0, 0, 1, 1,
0.3931061, -0.3497528, 4.464176, 1, 0, 0, 1, 1,
0.4080718, -1.083363, 3.724481, 0, 0, 0, 1, 1,
0.4110056, -1.609748, 1.280624, 0, 0, 0, 1, 1,
0.4128382, 1.300937, 0.6335151, 0, 0, 0, 1, 1,
0.4139967, -0.230702, 2.437078, 0, 0, 0, 1, 1,
0.4253302, 1.327644, 0.4514385, 0, 0, 0, 1, 1,
0.43903, -0.5889394, 3.286372, 0, 0, 0, 1, 1,
0.4404468, -1.341924, 3.116623, 0, 0, 0, 1, 1,
0.4412189, -0.3587134, 0.8577018, 1, 1, 1, 1, 1,
0.4413174, -0.7573131, 1.20406, 1, 1, 1, 1, 1,
0.445156, 0.7214037, 2.039257, 1, 1, 1, 1, 1,
0.445181, -0.395451, 2.549681, 1, 1, 1, 1, 1,
0.4460088, 0.3425978, -0.4683684, 1, 1, 1, 1, 1,
0.4464597, -0.1209155, 1.926564, 1, 1, 1, 1, 1,
0.448091, 1.669207, 0.628955, 1, 1, 1, 1, 1,
0.4496159, 0.865492, -0.6773109, 1, 1, 1, 1, 1,
0.45665, -0.6155944, 1.875423, 1, 1, 1, 1, 1,
0.4570281, 1.244871, 2.286209, 1, 1, 1, 1, 1,
0.4638528, -1.831967, 1.332993, 1, 1, 1, 1, 1,
0.4642819, 1.704592, 0.4596319, 1, 1, 1, 1, 1,
0.4661182, 1.415601, 0.3876728, 1, 1, 1, 1, 1,
0.4677212, 1.187908, 1.087685, 1, 1, 1, 1, 1,
0.4724328, 0.00031889, 3.694062, 1, 1, 1, 1, 1,
0.4729328, -0.06049543, 0.6421424, 0, 0, 1, 1, 1,
0.4759613, -0.4639909, 3.545125, 1, 0, 0, 1, 1,
0.4772857, 1.408785, -0.3806053, 1, 0, 0, 1, 1,
0.484744, -0.1604191, 2.686621, 1, 0, 0, 1, 1,
0.4852581, -0.4541384, 1.34981, 1, 0, 0, 1, 1,
0.4853961, -0.2940317, 2.956066, 1, 0, 0, 1, 1,
0.4863097, 1.478352, 0.8102813, 0, 0, 0, 1, 1,
0.4886798, -1.11269, 1.40424, 0, 0, 0, 1, 1,
0.4971532, -1.029939, 2.750709, 0, 0, 0, 1, 1,
0.497358, -0.1596687, 1.857862, 0, 0, 0, 1, 1,
0.4987614, -1.421496, 3.26811, 0, 0, 0, 1, 1,
0.5034842, -1.13052, 4.233354, 0, 0, 0, 1, 1,
0.5039756, -1.829251, 3.841778, 0, 0, 0, 1, 1,
0.5052502, 0.01276335, 2.503243, 1, 1, 1, 1, 1,
0.505715, 1.796787, 0.05509885, 1, 1, 1, 1, 1,
0.5058537, -1.254487, 2.203393, 1, 1, 1, 1, 1,
0.5113663, -0.127903, 1.932198, 1, 1, 1, 1, 1,
0.5137817, -0.05668905, 2.472319, 1, 1, 1, 1, 1,
0.5233051, -1.825435, 2.066959, 1, 1, 1, 1, 1,
0.5270959, 1.124741, -0.3094335, 1, 1, 1, 1, 1,
0.5271705, 0.02081867, 1.902724, 1, 1, 1, 1, 1,
0.5315119, 0.1247987, 2.012872, 1, 1, 1, 1, 1,
0.5364091, 1.380089, 0.1406925, 1, 1, 1, 1, 1,
0.539697, 1.167734, 0.9503097, 1, 1, 1, 1, 1,
0.5428281, 0.2099981, 0.3763877, 1, 1, 1, 1, 1,
0.5480635, -0.0211469, 0.6551793, 1, 1, 1, 1, 1,
0.5515386, -1.801021, 3.277297, 1, 1, 1, 1, 1,
0.556785, 0.8015987, 1.573161, 1, 1, 1, 1, 1,
0.567358, 0.3748084, 2.62005, 0, 0, 1, 1, 1,
0.5676646, -2.099441, 2.853997, 1, 0, 0, 1, 1,
0.5738843, 0.8487424, 0.1175809, 1, 0, 0, 1, 1,
0.5753173, -1.645672, 3.505197, 1, 0, 0, 1, 1,
0.5859443, -0.1466229, 3.333738, 1, 0, 0, 1, 1,
0.5901629, -0.01879475, 1.075881, 1, 0, 0, 1, 1,
0.5931141, 0.825706, 1.596394, 0, 0, 0, 1, 1,
0.5937818, -0.8291888, 3.641897, 0, 0, 0, 1, 1,
0.5948752, -0.2747231, 0.7836921, 0, 0, 0, 1, 1,
0.5993167, 0.8214661, -0.04765465, 0, 0, 0, 1, 1,
0.6047443, 0.6811281, 0.1402954, 0, 0, 0, 1, 1,
0.6077372, 0.1341904, 2.302704, 0, 0, 0, 1, 1,
0.613005, -0.4890513, 4.573436, 0, 0, 0, 1, 1,
0.6219369, 0.9486773, -0.5061664, 1, 1, 1, 1, 1,
0.6238481, -0.579687, 1.587448, 1, 1, 1, 1, 1,
0.6309048, 0.7022384, 1.154049, 1, 1, 1, 1, 1,
0.6317125, 0.7191483, -0.2929587, 1, 1, 1, 1, 1,
0.632192, 0.329008, 0.974852, 1, 1, 1, 1, 1,
0.6340446, -0.4044888, 2.354488, 1, 1, 1, 1, 1,
0.6359779, -1.110045, 0.3171744, 1, 1, 1, 1, 1,
0.6386848, -0.3151844, 1.398944, 1, 1, 1, 1, 1,
0.6489976, -2.073684, 3.989621, 1, 1, 1, 1, 1,
0.6514416, -0.4926726, 1.579212, 1, 1, 1, 1, 1,
0.6521978, -0.3623872, 1.375406, 1, 1, 1, 1, 1,
0.6578493, 1.40778, 3.280725, 1, 1, 1, 1, 1,
0.6591433, 0.1554214, 0.9388301, 1, 1, 1, 1, 1,
0.6594974, 0.4325556, 2.125484, 1, 1, 1, 1, 1,
0.6603442, 1.420652, 0.2024573, 1, 1, 1, 1, 1,
0.6626849, 0.1468202, 2.076612, 0, 0, 1, 1, 1,
0.6649107, -0.8667099, 3.04416, 1, 0, 0, 1, 1,
0.6676406, 0.4242808, 1.405754, 1, 0, 0, 1, 1,
0.6677824, 0.2104466, 1.34241, 1, 0, 0, 1, 1,
0.6677982, -0.5367595, 3.312718, 1, 0, 0, 1, 1,
0.6820494, -0.1427951, 0.7777034, 1, 0, 0, 1, 1,
0.682117, 0.6493975, 1.429576, 0, 0, 0, 1, 1,
0.6912827, -1.581918, 2.775832, 0, 0, 0, 1, 1,
0.693204, -1.014994, 2.502354, 0, 0, 0, 1, 1,
0.6943019, -1.580976, 1.719381, 0, 0, 0, 1, 1,
0.6958432, -0.6881692, 2.534493, 0, 0, 0, 1, 1,
0.7053408, -1.294183, 1.78919, 0, 0, 0, 1, 1,
0.70581, 0.7401515, -1.299963, 0, 0, 0, 1, 1,
0.7130404, -0.7256256, 0.5329781, 1, 1, 1, 1, 1,
0.7145193, -0.09204847, 2.337218, 1, 1, 1, 1, 1,
0.7150372, 0.7754947, -0.1659267, 1, 1, 1, 1, 1,
0.7158104, -2.098963, 3.171735, 1, 1, 1, 1, 1,
0.7279732, 2.929026, 0.9375256, 1, 1, 1, 1, 1,
0.7296777, -0.1231623, 1.210325, 1, 1, 1, 1, 1,
0.7420106, -0.04483329, 0.05742792, 1, 1, 1, 1, 1,
0.7429488, -0.2115137, 1.586454, 1, 1, 1, 1, 1,
0.7436633, -0.8794531, 2.192789, 1, 1, 1, 1, 1,
0.7441663, 1.453911, -0.8148401, 1, 1, 1, 1, 1,
0.7483051, 0.9482371, -0.1137832, 1, 1, 1, 1, 1,
0.7537113, -1.168081, 2.352333, 1, 1, 1, 1, 1,
0.758121, -0.7451427, 2.487457, 1, 1, 1, 1, 1,
0.760282, -0.09066147, 1.337288, 1, 1, 1, 1, 1,
0.776149, -0.2429793, 0.6896247, 1, 1, 1, 1, 1,
0.7771912, 0.2661233, -0.3606775, 0, 0, 1, 1, 1,
0.7796158, 0.02811605, 1.567977, 1, 0, 0, 1, 1,
0.7868434, -1.396492, 1.89086, 1, 0, 0, 1, 1,
0.7883331, 0.4383173, 0.1130713, 1, 0, 0, 1, 1,
0.7898531, 0.2833885, 1.044157, 1, 0, 0, 1, 1,
0.7944303, -0.5401453, 2.676962, 1, 0, 0, 1, 1,
0.7958199, -0.2994569, 2.382067, 0, 0, 0, 1, 1,
0.7959336, 1.125292, 1.432644, 0, 0, 0, 1, 1,
0.7992021, -0.3072407, 1.915237, 0, 0, 0, 1, 1,
0.8048123, 1.564053, 0.4053172, 0, 0, 0, 1, 1,
0.806184, 1.179153, 2.169012, 0, 0, 0, 1, 1,
0.8063619, -2.08327, 3.435584, 0, 0, 0, 1, 1,
0.807619, 0.1828051, 1.377252, 0, 0, 0, 1, 1,
0.8094137, -0.9937194, 0.7771206, 1, 1, 1, 1, 1,
0.8117506, 0.5221829, 0.9907491, 1, 1, 1, 1, 1,
0.8309009, 0.7665673, 0.9349568, 1, 1, 1, 1, 1,
0.8392937, 0.09572764, 1.025335, 1, 1, 1, 1, 1,
0.8397312, -0.8291855, 2.361625, 1, 1, 1, 1, 1,
0.8400059, 0.1950798, 1.090076, 1, 1, 1, 1, 1,
0.8460254, -1.002535, 1.443217, 1, 1, 1, 1, 1,
0.8485344, -1.043174, 1.487628, 1, 1, 1, 1, 1,
0.8542481, 1.555523, 0.9100342, 1, 1, 1, 1, 1,
0.8550208, -0.4262846, 2.608567, 1, 1, 1, 1, 1,
0.8550664, 0.03883403, -0.04534055, 1, 1, 1, 1, 1,
0.8622302, -1.319151, 2.17538, 1, 1, 1, 1, 1,
0.8701631, 0.3205582, 1.853505, 1, 1, 1, 1, 1,
0.8709632, 0.2033997, 1.637907, 1, 1, 1, 1, 1,
0.8756648, 0.256283, 1.233388, 1, 1, 1, 1, 1,
0.8764294, 0.9702373, 0.4506816, 0, 0, 1, 1, 1,
0.8813671, 1.207722, 0.557583, 1, 0, 0, 1, 1,
0.8903012, -1.531229, 0.3299201, 1, 0, 0, 1, 1,
0.8933384, -2.860381, 2.711819, 1, 0, 0, 1, 1,
0.8944444, -0.2521927, 1.916237, 1, 0, 0, 1, 1,
0.8964745, 1.44567, -0.1426603, 1, 0, 0, 1, 1,
0.9027952, 0.7652338, 0.7754195, 0, 0, 0, 1, 1,
0.9037906, 2.153366, -0.4235904, 0, 0, 0, 1, 1,
0.9091675, 1.271839, 1.464904, 0, 0, 0, 1, 1,
0.9113212, -1.433182, 2.822085, 0, 0, 0, 1, 1,
0.9191993, 0.590661, 0.1853717, 0, 0, 0, 1, 1,
0.9256536, 0.06797344, 3.367166, 0, 0, 0, 1, 1,
0.934548, 0.06690405, 1.263744, 0, 0, 0, 1, 1,
0.9355118, -1.218825, 1.91721, 1, 1, 1, 1, 1,
0.93918, 0.1180913, 1.333025, 1, 1, 1, 1, 1,
0.9418575, 1.49466, 1.934405, 1, 1, 1, 1, 1,
0.9488949, -0.005678592, 1.593634, 1, 1, 1, 1, 1,
0.9494461, 0.9217409, 1.057291, 1, 1, 1, 1, 1,
0.952329, 1.001209, -0.4106776, 1, 1, 1, 1, 1,
0.9527327, -1.450732, 0.8964968, 1, 1, 1, 1, 1,
0.9536336, 0.1801556, 2.548857, 1, 1, 1, 1, 1,
0.9649195, 1.448437, -1.275144, 1, 1, 1, 1, 1,
0.9702686, 0.6784386, 0.2589423, 1, 1, 1, 1, 1,
0.9876662, 0.9468026, 1.359061, 1, 1, 1, 1, 1,
0.9926097, 0.6062261, 0.3675319, 1, 1, 1, 1, 1,
0.9946578, 1.128205, -0.4341868, 1, 1, 1, 1, 1,
0.9954162, 0.9313048, 2.448821, 1, 1, 1, 1, 1,
1.010171, 0.933703, -1.12198, 1, 1, 1, 1, 1,
1.01118, 1.076253, 1.673248, 0, 0, 1, 1, 1,
1.011775, -1.769531, 1.828001, 1, 0, 0, 1, 1,
1.012651, -0.9606848, 1.97947, 1, 0, 0, 1, 1,
1.012792, -2.171349, 2.069009, 1, 0, 0, 1, 1,
1.015713, 1.072207, -0.4000818, 1, 0, 0, 1, 1,
1.019411, -0.1013558, -0.3871926, 1, 0, 0, 1, 1,
1.021295, -0.1264194, 2.067707, 0, 0, 0, 1, 1,
1.022862, 0.2442433, 1.530791, 0, 0, 0, 1, 1,
1.026004, -1.431633, 2.156434, 0, 0, 0, 1, 1,
1.027546, 0.659668, 2.501674, 0, 0, 0, 1, 1,
1.031144, 0.6146265, 0.8744457, 0, 0, 0, 1, 1,
1.035817, -0.6455069, 2.581655, 0, 0, 0, 1, 1,
1.036704, 0.7985355, 1.676243, 0, 0, 0, 1, 1,
1.039441, 0.1753703, 2.079009, 1, 1, 1, 1, 1,
1.046776, 0.8023742, 1.679228, 1, 1, 1, 1, 1,
1.063065, -0.3910665, 1.828808, 1, 1, 1, 1, 1,
1.063222, 1.060114, 1.25385, 1, 1, 1, 1, 1,
1.065566, -0.2598245, 1.763525, 1, 1, 1, 1, 1,
1.073697, -0.6472962, 2.71227, 1, 1, 1, 1, 1,
1.076857, 1.064353, 2.874962, 1, 1, 1, 1, 1,
1.077817, -0.9664108, 3.222461, 1, 1, 1, 1, 1,
1.080849, 1.001273, -0.01072728, 1, 1, 1, 1, 1,
1.083303, 0.9495237, 0.5406866, 1, 1, 1, 1, 1,
1.094154, -2.343637, 2.791076, 1, 1, 1, 1, 1,
1.101057, 0.5990629, 0.4917504, 1, 1, 1, 1, 1,
1.120814, 0.6276817, -0.643881, 1, 1, 1, 1, 1,
1.12491, -0.8312888, 1.911372, 1, 1, 1, 1, 1,
1.127957, 0.2976722, 1.576908, 1, 1, 1, 1, 1,
1.130975, -0.9882028, 2.485947, 0, 0, 1, 1, 1,
1.131501, -0.9604629, 0.8403144, 1, 0, 0, 1, 1,
1.134917, 0.4483106, 0.5416779, 1, 0, 0, 1, 1,
1.139841, -0.1159921, 1.143383, 1, 0, 0, 1, 1,
1.141544, 0.8547003, -0.2299174, 1, 0, 0, 1, 1,
1.14298, -0.4405356, 2.338254, 1, 0, 0, 1, 1,
1.156569, -0.9072173, 3.376105, 0, 0, 0, 1, 1,
1.164334, -0.4995465, 2.735474, 0, 0, 0, 1, 1,
1.166569, -0.6677408, 0.4739559, 0, 0, 0, 1, 1,
1.170467, -0.9670155, 1.694841, 0, 0, 0, 1, 1,
1.170714, -1.116485, 2.553033, 0, 0, 0, 1, 1,
1.188149, 0.1628349, 2.112193, 0, 0, 0, 1, 1,
1.189031, 1.154655, 1.305687, 0, 0, 0, 1, 1,
1.193828, -0.8146016, 3.743636, 1, 1, 1, 1, 1,
1.200953, 0.9139836, 0.758724, 1, 1, 1, 1, 1,
1.203001, 0.06804588, 1.355937, 1, 1, 1, 1, 1,
1.209015, 1.721874, 1.442638, 1, 1, 1, 1, 1,
1.215467, -0.9248227, 2.638632, 1, 1, 1, 1, 1,
1.217159, 1.558396, 0.417907, 1, 1, 1, 1, 1,
1.230142, 0.3181503, 0.984767, 1, 1, 1, 1, 1,
1.241407, 0.7099522, 0.5683391, 1, 1, 1, 1, 1,
1.246818, 0.97974, 1.828283, 1, 1, 1, 1, 1,
1.25021, -1.05534, 1.891504, 1, 1, 1, 1, 1,
1.254242, 0.05414556, 3.144332, 1, 1, 1, 1, 1,
1.261014, -1.334977, 1.560836, 1, 1, 1, 1, 1,
1.272323, 2.091793, 0.5992313, 1, 1, 1, 1, 1,
1.276015, 0.3536505, 0.8470733, 1, 1, 1, 1, 1,
1.278288, 0.004432375, 2.378082, 1, 1, 1, 1, 1,
1.2875, -0.8024505, 2.57472, 0, 0, 1, 1, 1,
1.307681, 1.067497, 0.08891583, 1, 0, 0, 1, 1,
1.320498, 2.902945, 2.268711, 1, 0, 0, 1, 1,
1.330637, -0.730184, 0.740706, 1, 0, 0, 1, 1,
1.335171, -0.04137494, 0.4372331, 1, 0, 0, 1, 1,
1.340526, 1.069269, 0.6432201, 1, 0, 0, 1, 1,
1.355712, -1.255229, 2.038089, 0, 0, 0, 1, 1,
1.361754, 0.6108639, -0.05355663, 0, 0, 0, 1, 1,
1.361807, -0.7785732, 3.194368, 0, 0, 0, 1, 1,
1.371979, 0.3323688, 3.058546, 0, 0, 0, 1, 1,
1.382945, 0.06173479, 2.445482, 0, 0, 0, 1, 1,
1.390643, 0.1860425, 0.1823842, 0, 0, 0, 1, 1,
1.394539, -0.4883073, 1.282843, 0, 0, 0, 1, 1,
1.397608, -1.977785, 2.937182, 1, 1, 1, 1, 1,
1.403068, -0.08637302, 0.1743354, 1, 1, 1, 1, 1,
1.431036, 0.5801849, 1.894769, 1, 1, 1, 1, 1,
1.431561, -1.093736, 2.336642, 1, 1, 1, 1, 1,
1.434279, 1.586131, 1.664082, 1, 1, 1, 1, 1,
1.434572, -1.204237, 1.720436, 1, 1, 1, 1, 1,
1.43565, -0.7924088, 1.008546, 1, 1, 1, 1, 1,
1.440146, -0.234431, 4.378561, 1, 1, 1, 1, 1,
1.446333, -0.2507371, -0.631853, 1, 1, 1, 1, 1,
1.449043, -0.8173915, 2.536815, 1, 1, 1, 1, 1,
1.453776, -0.2492887, 3.888019, 1, 1, 1, 1, 1,
1.462466, -1.166755, 2.142308, 1, 1, 1, 1, 1,
1.464923, 0.4667614, 2.5751, 1, 1, 1, 1, 1,
1.469402, -2.633144, 2.974418, 1, 1, 1, 1, 1,
1.473739, -2.727027, 3.801091, 1, 1, 1, 1, 1,
1.474888, -1.127038, 1.592851, 0, 0, 1, 1, 1,
1.476397, 1.407026, 0.7259815, 1, 0, 0, 1, 1,
1.482213, -0.4949804, 2.804203, 1, 0, 0, 1, 1,
1.485916, 0.9292805, -0.3080018, 1, 0, 0, 1, 1,
1.486451, -1.544481, 2.131099, 1, 0, 0, 1, 1,
1.488494, 0.5405104, 1.929587, 1, 0, 0, 1, 1,
1.508732, -0.09700376, 1.196221, 0, 0, 0, 1, 1,
1.513193, 0.2702344, 1.760327, 0, 0, 0, 1, 1,
1.536772, -2.077003, 3.353445, 0, 0, 0, 1, 1,
1.549676, 0.8995649, 0.9624565, 0, 0, 0, 1, 1,
1.565197, -0.3613656, 2.45102, 0, 0, 0, 1, 1,
1.576047, -0.8826578, 1.762143, 0, 0, 0, 1, 1,
1.580987, 2.024322, -0.05103585, 0, 0, 0, 1, 1,
1.581992, -0.1810692, 3.328974, 1, 1, 1, 1, 1,
1.58224, 0.6898298, -0.7624638, 1, 1, 1, 1, 1,
1.588366, 0.8326886, 1.803112, 1, 1, 1, 1, 1,
1.591709, 0.5519896, -0.3376906, 1, 1, 1, 1, 1,
1.600798, 1.710608, -1.289951, 1, 1, 1, 1, 1,
1.608397, -2.363101, 2.36564, 1, 1, 1, 1, 1,
1.608673, -0.9489763, 3.19606, 1, 1, 1, 1, 1,
1.612736, -0.8657058, 1.803396, 1, 1, 1, 1, 1,
1.616577, -0.2648007, 0.9047567, 1, 1, 1, 1, 1,
1.623926, -1.592661, 0.7903294, 1, 1, 1, 1, 1,
1.643889, -0.03979518, 1.654902, 1, 1, 1, 1, 1,
1.682696, -0.4646638, 0.8440303, 1, 1, 1, 1, 1,
1.702768, 0.8549767, 0.3367515, 1, 1, 1, 1, 1,
1.717162, -1.659976, 3.018538, 1, 1, 1, 1, 1,
1.719329, -1.100347, 2.890111, 1, 1, 1, 1, 1,
1.74526, -0.8719062, 0.7148847, 0, 0, 1, 1, 1,
1.767095, -0.7094865, 2.606462, 1, 0, 0, 1, 1,
1.770033, -0.5976923, 1.666077, 1, 0, 0, 1, 1,
1.778292, -0.1789166, 1.73812, 1, 0, 0, 1, 1,
1.778641, 0.3898952, 1.984201, 1, 0, 0, 1, 1,
1.803576, 1.067518, 1.249544, 1, 0, 0, 1, 1,
1.826841, -1.626553, 1.43439, 0, 0, 0, 1, 1,
1.840986, 0.5041271, 0.2320427, 0, 0, 0, 1, 1,
1.843649, -0.05808488, 1.49374, 0, 0, 0, 1, 1,
1.865617, 1.37102, -0.3343035, 0, 0, 0, 1, 1,
1.869059, 0.6712247, 0.2230457, 0, 0, 0, 1, 1,
1.892898, 0.8428274, -0.6143207, 0, 0, 0, 1, 1,
1.893015, -0.8311105, 1.466946, 0, 0, 0, 1, 1,
1.895502, 0.9830804, 0.6494094, 1, 1, 1, 1, 1,
1.896515, 0.08759534, 1.527402, 1, 1, 1, 1, 1,
1.904025, 0.01750885, 0.4976343, 1, 1, 1, 1, 1,
1.905821, -1.100881, 2.914998, 1, 1, 1, 1, 1,
1.942419, 0.2168995, 1.081382, 1, 1, 1, 1, 1,
1.971634, 0.188393, 0.2909264, 1, 1, 1, 1, 1,
1.979197, 0.7254397, 2.392212, 1, 1, 1, 1, 1,
1.991095, -1.130209, 2.445204, 1, 1, 1, 1, 1,
2.02985, 0.8359936, 0.7535831, 1, 1, 1, 1, 1,
2.047738, -0.3072278, 1.978558, 1, 1, 1, 1, 1,
2.087872, 0.6538311, 0.8913299, 1, 1, 1, 1, 1,
2.097354, 1.559092, -0.2566563, 1, 1, 1, 1, 1,
2.108384, 1.358576, 1.573754, 1, 1, 1, 1, 1,
2.111742, 0.5549994, 1.999647, 1, 1, 1, 1, 1,
2.117263, 0.07677747, 1.982441, 1, 1, 1, 1, 1,
2.125119, 0.4626685, 3.090302, 0, 0, 1, 1, 1,
2.128788, -0.5863962, -0.1258469, 1, 0, 0, 1, 1,
2.157562, 0.9201193, 0.8781847, 1, 0, 0, 1, 1,
2.174734, -0.6947245, 3.187607, 1, 0, 0, 1, 1,
2.180565, 0.5362906, 2.44292, 1, 0, 0, 1, 1,
2.195081, -1.239834, 3.518901, 1, 0, 0, 1, 1,
2.218801, 0.2214155, 2.459945, 0, 0, 0, 1, 1,
2.274895, 0.5253149, 1.640601, 0, 0, 0, 1, 1,
2.306704, 0.3166485, -0.2757232, 0, 0, 0, 1, 1,
2.338306, -1.82088, 2.205519, 0, 0, 0, 1, 1,
2.362584, 2.223263, 0.5030202, 0, 0, 0, 1, 1,
2.422717, -1.161574, 1.934927, 0, 0, 0, 1, 1,
2.499126, 0.2080992, 3.019406, 0, 0, 0, 1, 1,
2.505152, 1.907032, 2.187236, 1, 1, 1, 1, 1,
2.573644, -1.178196, 2.478442, 1, 1, 1, 1, 1,
2.623022, 0.02417451, 0.6332323, 1, 1, 1, 1, 1,
2.70178, -1.028498, 3.188959, 1, 1, 1, 1, 1,
2.723658, 0.2291225, 0.7576898, 1, 1, 1, 1, 1,
2.780221, 0.4454178, 2.876512, 1, 1, 1, 1, 1,
2.787062, 0.2968016, 0.4353016, 1, 1, 1, 1, 1
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
var radius = 9.132506;
var distance = 32.07754;
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
mvMatrix.translate( 0.4070743, -0.04355884, 0.2497549 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.07754);
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
