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
-3.102865, -2.053584, -0.7017234, 1, 0, 0, 1,
-2.840518, -1.23465, -2.686753, 1, 0.007843138, 0, 1,
-2.70158, -2.096682, -4.182223, 1, 0.01176471, 0, 1,
-2.598768, 0.3251699, -2.002827, 1, 0.01960784, 0, 1,
-2.582206, 0.8800882, -0.8703285, 1, 0.02352941, 0, 1,
-2.531688, -0.3749435, -1.248192, 1, 0.03137255, 0, 1,
-2.420959, -0.5997292, -1.2982, 1, 0.03529412, 0, 1,
-2.363461, 0.8567477, -1.935229, 1, 0.04313726, 0, 1,
-2.329668, 1.954373, -2.066326, 1, 0.04705882, 0, 1,
-2.307861, 1.272807, -0.2892978, 1, 0.05490196, 0, 1,
-2.282653, 0.678261, -0.4003994, 1, 0.05882353, 0, 1,
-2.282454, -0.9912892, -1.313069, 1, 0.06666667, 0, 1,
-2.261381, -0.2768563, -2.585922, 1, 0.07058824, 0, 1,
-2.256341, 1.558926, -1.411306, 1, 0.07843138, 0, 1,
-2.23504, -0.685215, -2.042454, 1, 0.08235294, 0, 1,
-2.189756, 1.02838, -1.87532, 1, 0.09019608, 0, 1,
-2.187885, 1.84195, 0.8030576, 1, 0.09411765, 0, 1,
-2.185886, 1.012458, -0.6763856, 1, 0.1019608, 0, 1,
-2.178154, -0.2070159, -1.623273, 1, 0.1098039, 0, 1,
-2.172553, 2.017716, -1.202814, 1, 0.1137255, 0, 1,
-2.158248, 0.4479954, -1.642169, 1, 0.1215686, 0, 1,
-2.131516, -0.305477, -0.5614578, 1, 0.1254902, 0, 1,
-2.108849, -0.1936599, -0.9527857, 1, 0.1333333, 0, 1,
-1.988075, 2.058416, 0.5425949, 1, 0.1372549, 0, 1,
-1.983423, 0.5985388, -0.06621211, 1, 0.145098, 0, 1,
-1.953389, 1.020011, -3.345391, 1, 0.1490196, 0, 1,
-1.930272, 0.4081361, -1.792061, 1, 0.1568628, 0, 1,
-1.920229, -0.4905494, -1.331543, 1, 0.1607843, 0, 1,
-1.888917, -0.1328971, -0.5863186, 1, 0.1686275, 0, 1,
-1.884692, 0.9786273, 0.02104772, 1, 0.172549, 0, 1,
-1.880935, -0.3547878, -1.119743, 1, 0.1803922, 0, 1,
-1.880259, -0.5753264, -2.194685, 1, 0.1843137, 0, 1,
-1.877904, 0.08166627, -0.3972672, 1, 0.1921569, 0, 1,
-1.871692, -1.38208, -1.951161, 1, 0.1960784, 0, 1,
-1.871406, 0.2294825, -2.075051, 1, 0.2039216, 0, 1,
-1.867495, -1.309668, -1.119566, 1, 0.2117647, 0, 1,
-1.862653, -0.6558546, -2.426891, 1, 0.2156863, 0, 1,
-1.850234, -0.28064, -3.432122, 1, 0.2235294, 0, 1,
-1.847153, 0.9688354, -0.2892777, 1, 0.227451, 0, 1,
-1.835102, -0.5213641, -5.012589, 1, 0.2352941, 0, 1,
-1.816348, -0.3501585, -3.381694, 1, 0.2392157, 0, 1,
-1.808489, 0.466775, -0.7421262, 1, 0.2470588, 0, 1,
-1.79009, -0.07749338, -2.623473, 1, 0.2509804, 0, 1,
-1.787833, 0.3837814, -0.4864996, 1, 0.2588235, 0, 1,
-1.780147, 1.100338, -0.2457028, 1, 0.2627451, 0, 1,
-1.778853, 0.5874881, -1.350315, 1, 0.2705882, 0, 1,
-1.767692, 1.561714, -1.351953, 1, 0.2745098, 0, 1,
-1.761302, 1.289186, -0.254196, 1, 0.282353, 0, 1,
-1.760289, -1.06861, -0.5296919, 1, 0.2862745, 0, 1,
-1.759259, 0.79084, -0.7576529, 1, 0.2941177, 0, 1,
-1.752329, -0.9526879, -2.012102, 1, 0.3019608, 0, 1,
-1.741078, 1.224261, -2.458736, 1, 0.3058824, 0, 1,
-1.739106, 0.02735681, -1.014173, 1, 0.3137255, 0, 1,
-1.721126, -0.2127464, -1.665838, 1, 0.3176471, 0, 1,
-1.716566, -0.1023686, -3.959615, 1, 0.3254902, 0, 1,
-1.700411, -2.412432, -2.207589, 1, 0.3294118, 0, 1,
-1.686615, -0.8566192, -0.8164765, 1, 0.3372549, 0, 1,
-1.677427, 3.235852, -0.1430447, 1, 0.3411765, 0, 1,
-1.651345, -0.2943268, -2.099054, 1, 0.3490196, 0, 1,
-1.640794, 2.078754, -1.592246, 1, 0.3529412, 0, 1,
-1.637441, 1.419578, -0.8294939, 1, 0.3607843, 0, 1,
-1.636468, -0.1190885, -1.781881, 1, 0.3647059, 0, 1,
-1.630727, -0.2756774, -2.035347, 1, 0.372549, 0, 1,
-1.611606, 0.04968593, -2.01123, 1, 0.3764706, 0, 1,
-1.609462, -0.928825, -3.447701, 1, 0.3843137, 0, 1,
-1.607673, 0.9415795, -3.152465, 1, 0.3882353, 0, 1,
-1.601801, 1.144603, -3.054763, 1, 0.3960784, 0, 1,
-1.572652, 0.1429891, -1.44952, 1, 0.4039216, 0, 1,
-1.568992, -2.339955, -2.430527, 1, 0.4078431, 0, 1,
-1.541025, -0.7648746, -1.113016, 1, 0.4156863, 0, 1,
-1.540627, -1.014874, -3.803867, 1, 0.4196078, 0, 1,
-1.529959, 0.01532328, -2.148607, 1, 0.427451, 0, 1,
-1.515971, 0.530964, -0.5573971, 1, 0.4313726, 0, 1,
-1.514938, 0.07294689, -1.087331, 1, 0.4392157, 0, 1,
-1.509018, 0.9224898, -0.6551954, 1, 0.4431373, 0, 1,
-1.493469, 0.4107802, -1.49151, 1, 0.4509804, 0, 1,
-1.483568, 0.4494851, -2.494914, 1, 0.454902, 0, 1,
-1.48241, 0.5323628, -0.6931853, 1, 0.4627451, 0, 1,
-1.468181, -0.5534179, -2.743612, 1, 0.4666667, 0, 1,
-1.465762, 0.8262867, -0.09870394, 1, 0.4745098, 0, 1,
-1.449563, -0.05703377, -0.514337, 1, 0.4784314, 0, 1,
-1.442206, -1.815429, -1.869609, 1, 0.4862745, 0, 1,
-1.440094, 0.9380336, 0.02908006, 1, 0.4901961, 0, 1,
-1.422768, -0.07921357, -2.539488, 1, 0.4980392, 0, 1,
-1.419952, -0.4476741, -1.191512, 1, 0.5058824, 0, 1,
-1.408296, 1.055016, -2.508196, 1, 0.509804, 0, 1,
-1.386837, 0.05980574, -1.564126, 1, 0.5176471, 0, 1,
-1.370931, 0.7625206, -0.2706909, 1, 0.5215687, 0, 1,
-1.36947, 0.3396112, -2.671696, 1, 0.5294118, 0, 1,
-1.365261, -1.414823, -1.066054, 1, 0.5333334, 0, 1,
-1.362033, -0.5387096, -0.9778543, 1, 0.5411765, 0, 1,
-1.35105, 0.01960107, -0.2358742, 1, 0.5450981, 0, 1,
-1.35024, 0.1031313, -1.472399, 1, 0.5529412, 0, 1,
-1.339054, 0.3891366, -0.7191144, 1, 0.5568628, 0, 1,
-1.335002, 0.3043313, -0.913096, 1, 0.5647059, 0, 1,
-1.334658, 0.004694501, -2.192381, 1, 0.5686275, 0, 1,
-1.318433, -1.805373, -1.330228, 1, 0.5764706, 0, 1,
-1.301918, -0.9573163, -2.411186, 1, 0.5803922, 0, 1,
-1.284045, 1.039962, -0.1501007, 1, 0.5882353, 0, 1,
-1.281136, 0.5221009, -0.6522738, 1, 0.5921569, 0, 1,
-1.278786, -1.069003, -2.640636, 1, 0.6, 0, 1,
-1.27858, 0.8277718, -2.885336, 1, 0.6078432, 0, 1,
-1.274705, -1.945433, -3.551415, 1, 0.6117647, 0, 1,
-1.272637, 1.703512, -1.474647, 1, 0.6196079, 0, 1,
-1.267349, -0.08845722, -1.237663, 1, 0.6235294, 0, 1,
-1.261016, 0.4059102, -0.9701643, 1, 0.6313726, 0, 1,
-1.260076, 0.4014527, -1.663085, 1, 0.6352941, 0, 1,
-1.25739, -0.824626, -3.152874, 1, 0.6431373, 0, 1,
-1.255346, -1.869891, -3.173796, 1, 0.6470588, 0, 1,
-1.252484, -0.469634, -1.99819, 1, 0.654902, 0, 1,
-1.250333, 0.999786, -1.643339, 1, 0.6588235, 0, 1,
-1.246086, -1.337122, -2.030711, 1, 0.6666667, 0, 1,
-1.23604, -0.7561281, -2.804421, 1, 0.6705883, 0, 1,
-1.23357, 0.5924949, -1.463605, 1, 0.6784314, 0, 1,
-1.233229, 3.39455, -0.3567482, 1, 0.682353, 0, 1,
-1.229664, 1.000087, -2.585409, 1, 0.6901961, 0, 1,
-1.228017, -0.7097456, -2.733889, 1, 0.6941177, 0, 1,
-1.220927, -0.6555083, -2.475812, 1, 0.7019608, 0, 1,
-1.21798, 0.3545826, -1.022922, 1, 0.7098039, 0, 1,
-1.215776, 0.5252301, -2.0477, 1, 0.7137255, 0, 1,
-1.213073, -0.7567171, -2.748422, 1, 0.7215686, 0, 1,
-1.187788, 1.256322, 1.324928, 1, 0.7254902, 0, 1,
-1.172223, 0.04910495, 1.293959, 1, 0.7333333, 0, 1,
-1.171344, 0.5149295, -1.206549, 1, 0.7372549, 0, 1,
-1.163893, -0.1166207, -2.447644, 1, 0.7450981, 0, 1,
-1.159963, -1.038251, -0.6499372, 1, 0.7490196, 0, 1,
-1.158942, 2.726514, -0.6709641, 1, 0.7568628, 0, 1,
-1.157962, -0.5453629, -3.137878, 1, 0.7607843, 0, 1,
-1.157946, -0.8628752, -0.7621261, 1, 0.7686275, 0, 1,
-1.154397, 1.242143, 0.8581215, 1, 0.772549, 0, 1,
-1.153635, -2.869783, -2.172002, 1, 0.7803922, 0, 1,
-1.153215, -0.3783971, -3.613067, 1, 0.7843137, 0, 1,
-1.14581, 0.1764842, -2.402735, 1, 0.7921569, 0, 1,
-1.143676, 1.23702, -2.312557, 1, 0.7960784, 0, 1,
-1.140588, 0.05237649, -2.190814, 1, 0.8039216, 0, 1,
-1.137672, -0.7899778, -2.940182, 1, 0.8117647, 0, 1,
-1.135907, -0.09122051, -3.618565, 1, 0.8156863, 0, 1,
-1.113533, -1.410141, -2.478982, 1, 0.8235294, 0, 1,
-1.099562, 0.7602104, -0.7859469, 1, 0.827451, 0, 1,
-1.098767, -0.1317723, -2.152638, 1, 0.8352941, 0, 1,
-1.096734, 1.270287, -0.5577029, 1, 0.8392157, 0, 1,
-1.096354, -0.3666663, -0.943659, 1, 0.8470588, 0, 1,
-1.087538, -0.9846861, -3.219567, 1, 0.8509804, 0, 1,
-1.086774, -0.9913162, -2.553443, 1, 0.8588235, 0, 1,
-1.081358, 0.3073978, -2.394073, 1, 0.8627451, 0, 1,
-1.074219, -1.174424, 0.5411019, 1, 0.8705882, 0, 1,
-1.069227, -1.131666, -2.460208, 1, 0.8745098, 0, 1,
-1.051593, -0.07676967, -0.7515216, 1, 0.8823529, 0, 1,
-1.046978, -1.410124, -3.665658, 1, 0.8862745, 0, 1,
-1.046616, -1.766715, -3.513682, 1, 0.8941177, 0, 1,
-1.045637, 0.7110726, 0.5545084, 1, 0.8980392, 0, 1,
-1.040413, -1.062061, -3.080069, 1, 0.9058824, 0, 1,
-1.037886, -0.9353068, -3.140751, 1, 0.9137255, 0, 1,
-1.032534, 2.620533, 0.08498386, 1, 0.9176471, 0, 1,
-1.024399, -1.011801, -2.540454, 1, 0.9254902, 0, 1,
-1.020929, 0.1228539, -1.671804, 1, 0.9294118, 0, 1,
-1.015159, -0.4693529, -3.901371, 1, 0.9372549, 0, 1,
-1.011765, 1.608836, -2.115472, 1, 0.9411765, 0, 1,
-1.000159, 1.78542, -0.1323154, 1, 0.9490196, 0, 1,
-0.9983555, 1.145577, -1.964596, 1, 0.9529412, 0, 1,
-0.9979289, -0.9061001, -3.219516, 1, 0.9607843, 0, 1,
-0.9957084, 0.3878276, -2.462171, 1, 0.9647059, 0, 1,
-0.9927266, -0.6791242, -2.598132, 1, 0.972549, 0, 1,
-0.9891661, 0.2257779, -1.423764, 1, 0.9764706, 0, 1,
-0.9725897, -1.910997, -3.405272, 1, 0.9843137, 0, 1,
-0.970317, 0.4988858, -1.823524, 1, 0.9882353, 0, 1,
-0.9686462, 1.235877, -1.158046, 1, 0.9960784, 0, 1,
-0.968098, -0.2320151, 0.3520945, 0.9960784, 1, 0, 1,
-0.9654753, 0.5600144, -2.635154, 0.9921569, 1, 0, 1,
-0.9574826, -0.3919446, -1.766939, 0.9843137, 1, 0, 1,
-0.9553195, -1.953812, -0.7641215, 0.9803922, 1, 0, 1,
-0.9501467, -1.288677, -2.121941, 0.972549, 1, 0, 1,
-0.9495894, 0.1650957, -1.121579, 0.9686275, 1, 0, 1,
-0.9473466, 1.046294, -1.951163, 0.9607843, 1, 0, 1,
-0.9442194, -1.83322, -1.495594, 0.9568627, 1, 0, 1,
-0.9437315, 0.9745107, 0.2773839, 0.9490196, 1, 0, 1,
-0.941739, 1.874607, -0.4041999, 0.945098, 1, 0, 1,
-0.9397275, 0.8356349, -0.9495925, 0.9372549, 1, 0, 1,
-0.9396201, 0.3483249, -1.979187, 0.9333333, 1, 0, 1,
-0.9316499, -0.9929476, -1.634946, 0.9254902, 1, 0, 1,
-0.9243006, -1.284673, -2.050847, 0.9215686, 1, 0, 1,
-0.9183757, -0.128843, -0.4332758, 0.9137255, 1, 0, 1,
-0.9143938, 0.1550601, -0.4583077, 0.9098039, 1, 0, 1,
-0.9117327, 1.298384, -0.6091478, 0.9019608, 1, 0, 1,
-0.9110147, 0.4783438, 0.6403717, 0.8941177, 1, 0, 1,
-0.9079687, 1.577224, -0.653082, 0.8901961, 1, 0, 1,
-0.902799, 0.4672675, -1.028586, 0.8823529, 1, 0, 1,
-0.9027399, 0.7654763, 0.5514244, 0.8784314, 1, 0, 1,
-0.9012988, 0.4860692, -1.362872, 0.8705882, 1, 0, 1,
-0.8994917, -0.6536722, -2.851787, 0.8666667, 1, 0, 1,
-0.8914868, 0.6475822, 0.0711574, 0.8588235, 1, 0, 1,
-0.8888456, -2.633711, -3.200963, 0.854902, 1, 0, 1,
-0.8759105, -0.2148926, -4.010409, 0.8470588, 1, 0, 1,
-0.8739999, 0.35081, -0.2186476, 0.8431373, 1, 0, 1,
-0.8699563, -0.2513143, -4.30277, 0.8352941, 1, 0, 1,
-0.8697087, -0.7467108, -2.099995, 0.8313726, 1, 0, 1,
-0.8675732, -0.5558036, -2.092064, 0.8235294, 1, 0, 1,
-0.8671121, 0.6380965, -1.855491, 0.8196079, 1, 0, 1,
-0.866535, -1.370994, -1.58487, 0.8117647, 1, 0, 1,
-0.8566939, -0.6853542, -2.584546, 0.8078431, 1, 0, 1,
-0.8562773, -0.6685542, -0.2139629, 0.8, 1, 0, 1,
-0.8469641, -0.2239701, -1.796847, 0.7921569, 1, 0, 1,
-0.8433039, 0.8030088, -2.06276, 0.7882353, 1, 0, 1,
-0.8405902, 1.754197, 0.3496306, 0.7803922, 1, 0, 1,
-0.8393265, -0.434586, -1.936948, 0.7764706, 1, 0, 1,
-0.8381419, -0.1723631, -0.1978974, 0.7686275, 1, 0, 1,
-0.8345889, -1.328836, -1.750937, 0.7647059, 1, 0, 1,
-0.8321074, -0.5655916, -3.520841, 0.7568628, 1, 0, 1,
-0.8270609, 0.2818816, -3.411762, 0.7529412, 1, 0, 1,
-0.8222061, -0.4773621, -2.055961, 0.7450981, 1, 0, 1,
-0.8221217, 0.323374, -0.07276094, 0.7411765, 1, 0, 1,
-0.8180985, 0.6302202, 1.054033, 0.7333333, 1, 0, 1,
-0.8134651, -0.06923983, -2.056918, 0.7294118, 1, 0, 1,
-0.8101965, 0.09583984, -1.556723, 0.7215686, 1, 0, 1,
-0.8088169, 1.971725, -1.934818, 0.7176471, 1, 0, 1,
-0.8010852, 2.040621, -2.405065, 0.7098039, 1, 0, 1,
-0.7959312, -0.07365472, -0.6726468, 0.7058824, 1, 0, 1,
-0.7935443, 1.167101, -0.4966935, 0.6980392, 1, 0, 1,
-0.7904024, 0.02827904, -0.2235123, 0.6901961, 1, 0, 1,
-0.7825142, -1.143752, -3.103177, 0.6862745, 1, 0, 1,
-0.7774231, -1.679181, -2.19893, 0.6784314, 1, 0, 1,
-0.7764646, 0.7889267, -0.2368952, 0.6745098, 1, 0, 1,
-0.7728174, -0.6130079, -1.343154, 0.6666667, 1, 0, 1,
-0.769958, 0.758431, -1.954941, 0.6627451, 1, 0, 1,
-0.7598074, -0.6540341, -1.98531, 0.654902, 1, 0, 1,
-0.7586718, 2.834503, 1.144605, 0.6509804, 1, 0, 1,
-0.7521702, -0.5086613, -0.5319922, 0.6431373, 1, 0, 1,
-0.7421775, 0.7561839, 0.3076446, 0.6392157, 1, 0, 1,
-0.741737, 0.5340627, -1.667915, 0.6313726, 1, 0, 1,
-0.7383873, 1.246046, 0.7782726, 0.627451, 1, 0, 1,
-0.7383451, 0.2372107, -1.211948, 0.6196079, 1, 0, 1,
-0.7368674, -1.263131, -1.52265, 0.6156863, 1, 0, 1,
-0.7344865, 0.2838362, -1.533172, 0.6078432, 1, 0, 1,
-0.7344284, -0.09098399, -1.160979, 0.6039216, 1, 0, 1,
-0.733211, -0.05897627, -0.07345824, 0.5960785, 1, 0, 1,
-0.7324147, 1.97475, 1.052639, 0.5882353, 1, 0, 1,
-0.7280667, 0.225189, -1.93494, 0.5843138, 1, 0, 1,
-0.7273336, 1.603562, -1.687184, 0.5764706, 1, 0, 1,
-0.7097489, -1.600295, -1.477163, 0.572549, 1, 0, 1,
-0.7072158, 0.1222487, -0.9847624, 0.5647059, 1, 0, 1,
-0.7065486, 0.2117823, -1.645966, 0.5607843, 1, 0, 1,
-0.6890409, 0.4430616, -0.6341933, 0.5529412, 1, 0, 1,
-0.686976, -0.9822894, -2.854352, 0.5490196, 1, 0, 1,
-0.6839937, -0.4454098, -1.265408, 0.5411765, 1, 0, 1,
-0.6836044, 0.8024983, -0.4996832, 0.5372549, 1, 0, 1,
-0.6774661, 0.1571133, -1.376303, 0.5294118, 1, 0, 1,
-0.6763534, 0.0239938, -0.5297568, 0.5254902, 1, 0, 1,
-0.6748942, 1.739722, -1.350093, 0.5176471, 1, 0, 1,
-0.6726004, -0.4451454, -2.744608, 0.5137255, 1, 0, 1,
-0.6720886, 0.8614991, -0.6978086, 0.5058824, 1, 0, 1,
-0.6719404, -0.8117212, -3.06128, 0.5019608, 1, 0, 1,
-0.6709667, -1.123954, 0.8446777, 0.4941176, 1, 0, 1,
-0.6630568, 0.518463, -0.3679466, 0.4862745, 1, 0, 1,
-0.6628183, 0.432938, -1.294157, 0.4823529, 1, 0, 1,
-0.6616007, -0.5548136, -1.538267, 0.4745098, 1, 0, 1,
-0.6613253, 0.9273688, -1.32907, 0.4705882, 1, 0, 1,
-0.6555331, 0.5034549, -1.343805, 0.4627451, 1, 0, 1,
-0.6538374, -1.277527, -2.646053, 0.4588235, 1, 0, 1,
-0.6499342, -0.02191687, -1.333933, 0.4509804, 1, 0, 1,
-0.6485862, 0.8180039, -0.8922457, 0.4470588, 1, 0, 1,
-0.6478774, 0.9608366, -0.616316, 0.4392157, 1, 0, 1,
-0.6445845, -0.7424947, -1.935826, 0.4352941, 1, 0, 1,
-0.6376315, 1.100662, -0.06568193, 0.427451, 1, 0, 1,
-0.6375095, 0.390636, 0.2183848, 0.4235294, 1, 0, 1,
-0.6324297, -0.730056, -2.274893, 0.4156863, 1, 0, 1,
-0.6313309, 0.9055113, -0.9217659, 0.4117647, 1, 0, 1,
-0.6263028, -0.2442061, -1.055962, 0.4039216, 1, 0, 1,
-0.6258559, -1.299319, -1.65333, 0.3960784, 1, 0, 1,
-0.6207638, -0.05978106, -1.516491, 0.3921569, 1, 0, 1,
-0.6148753, -1.430396, -2.815602, 0.3843137, 1, 0, 1,
-0.6135612, -0.3263152, -2.805429, 0.3803922, 1, 0, 1,
-0.6128156, 0.1836491, -2.490576, 0.372549, 1, 0, 1,
-0.6088163, -0.8080004, -2.351277, 0.3686275, 1, 0, 1,
-0.6078489, 1.103456, 0.529545, 0.3607843, 1, 0, 1,
-0.6068255, -0.9988366, -3.226059, 0.3568628, 1, 0, 1,
-0.6055181, -1.529851, -3.336395, 0.3490196, 1, 0, 1,
-0.5977981, 0.5866914, -1.828531, 0.345098, 1, 0, 1,
-0.5957623, 0.7198243, -0.9561222, 0.3372549, 1, 0, 1,
-0.5943236, -0.7546294, -1.700933, 0.3333333, 1, 0, 1,
-0.5940076, -0.2224468, -2.879427, 0.3254902, 1, 0, 1,
-0.5924854, 1.281432, -2.389362, 0.3215686, 1, 0, 1,
-0.5884278, 0.001914018, -2.572375, 0.3137255, 1, 0, 1,
-0.5866893, 1.066387, -1.081807, 0.3098039, 1, 0, 1,
-0.5831494, -0.9107878, -1.890901, 0.3019608, 1, 0, 1,
-0.5819321, 0.1434914, -1.308784, 0.2941177, 1, 0, 1,
-0.581875, 0.5899268, -0.9678528, 0.2901961, 1, 0, 1,
-0.5818747, 1.313348, -0.1865731, 0.282353, 1, 0, 1,
-0.5815311, 0.5150217, -0.9687508, 0.2784314, 1, 0, 1,
-0.5814517, -0.07184004, 0.6939535, 0.2705882, 1, 0, 1,
-0.5802565, 1.013021, 0.6444677, 0.2666667, 1, 0, 1,
-0.5751451, -1.664201, -4.207589, 0.2588235, 1, 0, 1,
-0.5745008, 0.4805494, -1.190279, 0.254902, 1, 0, 1,
-0.5742747, -0.4839653, -2.129472, 0.2470588, 1, 0, 1,
-0.5714373, 0.4454751, -0.5539973, 0.2431373, 1, 0, 1,
-0.5701376, 1.042685, -2.19734, 0.2352941, 1, 0, 1,
-0.5693111, -0.4809223, -1.4982, 0.2313726, 1, 0, 1,
-0.5641386, -0.1918884, -0.8080047, 0.2235294, 1, 0, 1,
-0.562716, 0.2648508, -1.194592, 0.2196078, 1, 0, 1,
-0.5625351, 0.4744019, -1.276798, 0.2117647, 1, 0, 1,
-0.5619431, -0.7009315, -3.253979, 0.2078431, 1, 0, 1,
-0.5594305, 0.3220855, -1.195125, 0.2, 1, 0, 1,
-0.5591814, 0.2711848, -0.6027416, 0.1921569, 1, 0, 1,
-0.5585845, -0.470457, -1.447121, 0.1882353, 1, 0, 1,
-0.554787, 0.4695826, -0.4628676, 0.1803922, 1, 0, 1,
-0.5539476, 0.08149065, -1.088295, 0.1764706, 1, 0, 1,
-0.5484889, 1.193628, -1.208741, 0.1686275, 1, 0, 1,
-0.5458865, 0.7408212, -2.009948, 0.1647059, 1, 0, 1,
-0.545446, -0.1160287, -2.805407, 0.1568628, 1, 0, 1,
-0.5454064, -0.004824444, -2.114817, 0.1529412, 1, 0, 1,
-0.5440908, -0.9516152, -1.361452, 0.145098, 1, 0, 1,
-0.5415355, 1.188119, 0.4751658, 0.1411765, 1, 0, 1,
-0.5394467, -0.2963574, -0.37512, 0.1333333, 1, 0, 1,
-0.5393918, -0.1651449, -1.684944, 0.1294118, 1, 0, 1,
-0.5372885, 0.4546301, 0.3042078, 0.1215686, 1, 0, 1,
-0.5323144, -0.0457524, -0.3752915, 0.1176471, 1, 0, 1,
-0.5227172, 1.496604, 1.425757, 0.1098039, 1, 0, 1,
-0.5210372, 0.5396672, -0.1326348, 0.1058824, 1, 0, 1,
-0.5206065, 0.4996568, -1.233834, 0.09803922, 1, 0, 1,
-0.5169076, 0.491175, -1.605999, 0.09019608, 1, 0, 1,
-0.5165682, -1.264371, -0.848249, 0.08627451, 1, 0, 1,
-0.5152146, -0.9968832, -2.893527, 0.07843138, 1, 0, 1,
-0.5117109, -0.06259171, -1.633095, 0.07450981, 1, 0, 1,
-0.5091743, -0.1645684, -2.758705, 0.06666667, 1, 0, 1,
-0.5088541, -1.492228, -4.355701, 0.0627451, 1, 0, 1,
-0.5081085, 0.2982116, -0.3330675, 0.05490196, 1, 0, 1,
-0.5051466, 0.7896857, -1.006613, 0.05098039, 1, 0, 1,
-0.5048967, 0.2156879, -0.3630745, 0.04313726, 1, 0, 1,
-0.5048551, 1.098299, 0.8905584, 0.03921569, 1, 0, 1,
-0.5023649, 0.1952524, -0.4540326, 0.03137255, 1, 0, 1,
-0.4916482, -0.9983131, -2.804916, 0.02745098, 1, 0, 1,
-0.4883583, 0.7545299, -0.3820993, 0.01960784, 1, 0, 1,
-0.4807056, -1.564911, -2.150994, 0.01568628, 1, 0, 1,
-0.4678859, -1.096244, -3.697512, 0.007843138, 1, 0, 1,
-0.4655856, -0.4244286, -1.86155, 0.003921569, 1, 0, 1,
-0.4616037, -0.1088409, -2.998446, 0, 1, 0.003921569, 1,
-0.4603455, 1.784672, -0.3311094, 0, 1, 0.01176471, 1,
-0.4541618, 1.132026, 0.321858, 0, 1, 0.01568628, 1,
-0.451662, 1.357205, -0.6393575, 0, 1, 0.02352941, 1,
-0.449951, -0.7302911, -3.676316, 0, 1, 0.02745098, 1,
-0.449562, 1.174448, -0.3708351, 0, 1, 0.03529412, 1,
-0.44809, -1.649591, -3.865743, 0, 1, 0.03921569, 1,
-0.443, 1.543953, 0.3895877, 0, 1, 0.04705882, 1,
-0.4424427, -1.011262, -2.943324, 0, 1, 0.05098039, 1,
-0.4410048, -0.9733337, -1.619453, 0, 1, 0.05882353, 1,
-0.4359747, -0.5996768, -1.339708, 0, 1, 0.0627451, 1,
-0.4342361, -1.032919, -1.253372, 0, 1, 0.07058824, 1,
-0.4300852, 0.2480707, -1.175204, 0, 1, 0.07450981, 1,
-0.4218808, -1.022097, -3.612122, 0, 1, 0.08235294, 1,
-0.4195705, -0.5988804, -1.471188, 0, 1, 0.08627451, 1,
-0.4119998, 1.535783, -0.5039907, 0, 1, 0.09411765, 1,
-0.3974211, 0.18145, -0.2801709, 0, 1, 0.1019608, 1,
-0.3928833, -0.1949162, -2.705372, 0, 1, 0.1058824, 1,
-0.3833599, 0.8919753, -0.8255244, 0, 1, 0.1137255, 1,
-0.3825805, -0.6271537, -2.967835, 0, 1, 0.1176471, 1,
-0.3733182, -2.789965, -2.802165, 0, 1, 0.1254902, 1,
-0.3730315, -0.4974613, -2.085594, 0, 1, 0.1294118, 1,
-0.3716948, -0.2522155, -3.585995, 0, 1, 0.1372549, 1,
-0.3671516, -0.5809648, -0.8706, 0, 1, 0.1411765, 1,
-0.367101, -0.1773487, -3.773343, 0, 1, 0.1490196, 1,
-0.3645517, -0.6222618, -1.096456, 0, 1, 0.1529412, 1,
-0.3645165, 0.4630685, -1.93238, 0, 1, 0.1607843, 1,
-0.3636562, 0.3353855, -0.6830645, 0, 1, 0.1647059, 1,
-0.3618186, -0.7517279, -3.681115, 0, 1, 0.172549, 1,
-0.3593585, -2.33176, -3.652232, 0, 1, 0.1764706, 1,
-0.3589405, 1.550978, -1.940115, 0, 1, 0.1843137, 1,
-0.357827, 1.067621, 0.2559604, 0, 1, 0.1882353, 1,
-0.3499114, 1.658237, -0.3467861, 0, 1, 0.1960784, 1,
-0.3497666, -0.9456919, -1.345433, 0, 1, 0.2039216, 1,
-0.3486662, -0.7040967, -4.23129, 0, 1, 0.2078431, 1,
-0.3462978, 0.3945312, -2.425515, 0, 1, 0.2156863, 1,
-0.3436467, -0.7577249, -2.047651, 0, 1, 0.2196078, 1,
-0.332645, 1.238569, 0.3237986, 0, 1, 0.227451, 1,
-0.3267459, -1.416844, -3.770513, 0, 1, 0.2313726, 1,
-0.3218929, 0.8927053, -0.6917542, 0, 1, 0.2392157, 1,
-0.3190361, -2.355464, -3.245204, 0, 1, 0.2431373, 1,
-0.3175565, -0.9108726, -1.595736, 0, 1, 0.2509804, 1,
-0.3058827, -0.3480595, -3.767022, 0, 1, 0.254902, 1,
-0.3044973, 0.8698653, 1.19212, 0, 1, 0.2627451, 1,
-0.3022264, 0.2011123, -1.796212, 0, 1, 0.2666667, 1,
-0.2955014, -0.3368021, -3.264285, 0, 1, 0.2745098, 1,
-0.2951598, 1.236822, -1.46734, 0, 1, 0.2784314, 1,
-0.2924289, -0.09070364, -1.105541, 0, 1, 0.2862745, 1,
-0.2863301, -0.09257741, -1.831338, 0, 1, 0.2901961, 1,
-0.2840338, 1.400404, 0.3723149, 0, 1, 0.2980392, 1,
-0.2795516, -1.761082, -2.847655, 0, 1, 0.3058824, 1,
-0.2756103, -0.6159801, -1.874802, 0, 1, 0.3098039, 1,
-0.2743016, -0.3940766, -2.039393, 0, 1, 0.3176471, 1,
-0.2741594, -0.6643259, -3.214248, 0, 1, 0.3215686, 1,
-0.2738689, -0.5326206, -3.443781, 0, 1, 0.3294118, 1,
-0.2734729, 0.1393285, -2.381181, 0, 1, 0.3333333, 1,
-0.2724974, -0.1641174, -1.005076, 0, 1, 0.3411765, 1,
-0.2704665, -1.615255, -3.005964, 0, 1, 0.345098, 1,
-0.2629353, 1.106995, -0.06574158, 0, 1, 0.3529412, 1,
-0.2538333, 0.2262159, 0.005836927, 0, 1, 0.3568628, 1,
-0.2499872, -0.5361254, -3.151803, 0, 1, 0.3647059, 1,
-0.2475283, 0.1986399, 0.2153733, 0, 1, 0.3686275, 1,
-0.2438756, 0.6038277, -1.215685, 0, 1, 0.3764706, 1,
-0.2433837, -0.4282803, -3.747871, 0, 1, 0.3803922, 1,
-0.2407665, 0.5166134, 0.1774663, 0, 1, 0.3882353, 1,
-0.2391917, -0.4724557, -3.180238, 0, 1, 0.3921569, 1,
-0.2376198, -1.126725, -3.223582, 0, 1, 0.4, 1,
-0.2346084, 0.03876954, -2.154476, 0, 1, 0.4078431, 1,
-0.2289923, -0.1750325, -2.514405, 0, 1, 0.4117647, 1,
-0.2279821, -0.199087, -0.6779425, 0, 1, 0.4196078, 1,
-0.2236725, -0.6108466, -3.217168, 0, 1, 0.4235294, 1,
-0.2219275, 1.216903, -0.8387036, 0, 1, 0.4313726, 1,
-0.2200265, -2.719348, -2.775469, 0, 1, 0.4352941, 1,
-0.2187404, -0.4376912, -2.669175, 0, 1, 0.4431373, 1,
-0.2185749, 0.1815862, -0.2135241, 0, 1, 0.4470588, 1,
-0.2157556, -0.6671081, -3.851123, 0, 1, 0.454902, 1,
-0.2154837, -1.38334, -3.0495, 0, 1, 0.4588235, 1,
-0.2143377, 0.02328664, -0.5321332, 0, 1, 0.4666667, 1,
-0.2113808, -0.303112, -1.340069, 0, 1, 0.4705882, 1,
-0.2110724, -0.2141647, -0.8103154, 0, 1, 0.4784314, 1,
-0.2064275, -0.3309792, -2.221514, 0, 1, 0.4823529, 1,
-0.2034092, -0.1865945, -3.552271, 0, 1, 0.4901961, 1,
-0.2030154, 2.343142, 0.1002528, 0, 1, 0.4941176, 1,
-0.1965245, 1.541828, 0.06152476, 0, 1, 0.5019608, 1,
-0.1957491, 1.469104, -0.4218834, 0, 1, 0.509804, 1,
-0.1834164, 0.847409, -2.880514, 0, 1, 0.5137255, 1,
-0.1787769, 0.5902632, -0.9059598, 0, 1, 0.5215687, 1,
-0.1750378, 1.276278, 0.1497982, 0, 1, 0.5254902, 1,
-0.1664248, -0.4707552, -1.366506, 0, 1, 0.5333334, 1,
-0.165204, -0.5899795, -2.800756, 0, 1, 0.5372549, 1,
-0.1642531, 0.8141231, -0.6400819, 0, 1, 0.5450981, 1,
-0.1640197, 2.954443, 0.9452485, 0, 1, 0.5490196, 1,
-0.163515, -1.975197, -3.07055, 0, 1, 0.5568628, 1,
-0.1619002, 1.064301, 0.2050324, 0, 1, 0.5607843, 1,
-0.1614194, -2.241523, -2.694083, 0, 1, 0.5686275, 1,
-0.1600364, 0.8229879, -0.8080997, 0, 1, 0.572549, 1,
-0.1595218, -0.3938049, -3.58983, 0, 1, 0.5803922, 1,
-0.1570705, 1.074645, 0.9367124, 0, 1, 0.5843138, 1,
-0.1568621, 0.05526509, -0.3862582, 0, 1, 0.5921569, 1,
-0.1520692, -0.2020812, -3.946414, 0, 1, 0.5960785, 1,
-0.1503252, 0.2050333, -0.7499728, 0, 1, 0.6039216, 1,
-0.1488527, -0.3003238, -2.764546, 0, 1, 0.6117647, 1,
-0.1441797, 1.064685, -0.6362283, 0, 1, 0.6156863, 1,
-0.139285, 0.3322022, 0.324685, 0, 1, 0.6235294, 1,
-0.1392126, 0.9538407, -0.4981667, 0, 1, 0.627451, 1,
-0.1385519, -1.845699, -2.707732, 0, 1, 0.6352941, 1,
-0.1341526, -0.4239131, -2.507147, 0, 1, 0.6392157, 1,
-0.1310056, 0.1228153, -1.23195, 0, 1, 0.6470588, 1,
-0.1282407, 1.384735, -2.650203, 0, 1, 0.6509804, 1,
-0.1275164, 1.586488, -1.131119, 0, 1, 0.6588235, 1,
-0.1274337, 1.072822, -1.904114, 0, 1, 0.6627451, 1,
-0.1255914, -0.8286555, -2.599838, 0, 1, 0.6705883, 1,
-0.125498, -1.040725, -3.265865, 0, 1, 0.6745098, 1,
-0.1230665, -0.9642122, -2.663185, 0, 1, 0.682353, 1,
-0.1223835, 1.777412, -0.3920267, 0, 1, 0.6862745, 1,
-0.1218463, -0.1565889, -4.020376, 0, 1, 0.6941177, 1,
-0.1201673, -0.6335995, -2.084626, 0, 1, 0.7019608, 1,
-0.119883, -0.4306939, -0.9923974, 0, 1, 0.7058824, 1,
-0.1147746, 1.790559, -0.2139654, 0, 1, 0.7137255, 1,
-0.1146084, 0.4452331, -0.1429199, 0, 1, 0.7176471, 1,
-0.1143148, 1.516528, -0.521639, 0, 1, 0.7254902, 1,
-0.1122267, 0.15556, -0.3779992, 0, 1, 0.7294118, 1,
-0.1073655, -0.7029411, -2.787885, 0, 1, 0.7372549, 1,
-0.1056441, 1.22586, -0.35835, 0, 1, 0.7411765, 1,
-0.1047304, 0.2062671, -0.8210159, 0, 1, 0.7490196, 1,
-0.1046727, -1.617285, -2.267086, 0, 1, 0.7529412, 1,
-0.104449, 1.327535, 0.4977805, 0, 1, 0.7607843, 1,
-0.1007499, -0.7947648, -4.081284, 0, 1, 0.7647059, 1,
-0.1006279, -0.451443, -2.826893, 0, 1, 0.772549, 1,
-0.1004847, 1.411063, -0.4035039, 0, 1, 0.7764706, 1,
-0.09863062, -1.424924, -2.963845, 0, 1, 0.7843137, 1,
-0.0915779, -0.272804, -4.882732, 0, 1, 0.7882353, 1,
-0.08757893, 1.168591, -0.8918506, 0, 1, 0.7960784, 1,
-0.08506019, 0.3266098, 0.3861826, 0, 1, 0.8039216, 1,
-0.08405413, 0.4616404, -1.730614, 0, 1, 0.8078431, 1,
-0.08290847, -0.6792793, -4.724559, 0, 1, 0.8156863, 1,
-0.08161865, -1.315438, -3.215812, 0, 1, 0.8196079, 1,
-0.080763, 0.2825297, 0.7079529, 0, 1, 0.827451, 1,
-0.07750633, 0.3227621, -0.007175984, 0, 1, 0.8313726, 1,
-0.07027182, 1.545718, -1.860165, 0, 1, 0.8392157, 1,
-0.06548215, 2.050892, -1.313155, 0, 1, 0.8431373, 1,
-0.05945843, 1.281315, -0.2584375, 0, 1, 0.8509804, 1,
-0.05893604, -1.177832, -3.648491, 0, 1, 0.854902, 1,
-0.05463655, 0.2110662, 0.4653169, 0, 1, 0.8627451, 1,
-0.0539051, 1.149755, -1.195547, 0, 1, 0.8666667, 1,
-0.05312112, 1.501687, 0.7570444, 0, 1, 0.8745098, 1,
-0.05172841, 1.246562, 0.2093374, 0, 1, 0.8784314, 1,
-0.05098068, 1.053322, -2.467696, 0, 1, 0.8862745, 1,
-0.05043288, -0.03342054, -1.602459, 0, 1, 0.8901961, 1,
-0.04759712, -0.6064331, -3.200741, 0, 1, 0.8980392, 1,
-0.04681842, -0.1633384, -3.653425, 0, 1, 0.9058824, 1,
-0.0408085, 1.101067, -0.8876995, 0, 1, 0.9098039, 1,
-0.0391723, 0.5377294, -0.2895828, 0, 1, 0.9176471, 1,
-0.03513798, -0.5220743, -2.496063, 0, 1, 0.9215686, 1,
-0.03191131, 0.7620529, -1.03802, 0, 1, 0.9294118, 1,
-0.0298562, 1.301668, -0.4866126, 0, 1, 0.9333333, 1,
-0.02730876, 0.7140175, -0.08573325, 0, 1, 0.9411765, 1,
-0.02610209, -2.502165, -1.012984, 0, 1, 0.945098, 1,
-0.02521374, 0.06929544, -0.9116933, 0, 1, 0.9529412, 1,
-0.0241328, -0.8536988, -0.5679722, 0, 1, 0.9568627, 1,
-0.02386564, -1.136463, -2.562922, 0, 1, 0.9647059, 1,
-0.02292408, -0.9986153, -4.481359, 0, 1, 0.9686275, 1,
-0.01989878, 0.05225992, -0.8754799, 0, 1, 0.9764706, 1,
-0.01986892, 0.003463075, 0.6491849, 0, 1, 0.9803922, 1,
-0.01672295, -0.2280518, -4.515486, 0, 1, 0.9882353, 1,
-0.01379662, 0.891538, -1.779758, 0, 1, 0.9921569, 1,
-0.01132631, -1.486923, -2.329417, 0, 1, 1, 1,
-0.01121627, -0.3349206, -2.486718, 0, 0.9921569, 1, 1,
-0.008291537, -0.6146358, -3.638825, 0, 0.9882353, 1, 1,
-0.006767734, 0.8706376, -2.947275, 0, 0.9803922, 1, 1,
-0.006578031, -0.1167232, -3.715556, 0, 0.9764706, 1, 1,
-0.004296503, -0.3040446, -2.616783, 0, 0.9686275, 1, 1,
0.001387836, 0.1299251, -1.405421, 0, 0.9647059, 1, 1,
0.002700747, 1.435398, 1.315054, 0, 0.9568627, 1, 1,
0.00282555, 0.2840423, 1.673363, 0, 0.9529412, 1, 1,
0.003177258, -0.6758487, 3.145822, 0, 0.945098, 1, 1,
0.003333451, -1.301041, 3.510491, 0, 0.9411765, 1, 1,
0.01022475, 1.186906, -0.2067727, 0, 0.9333333, 1, 1,
0.01170987, 0.5082123, -0.2612821, 0, 0.9294118, 1, 1,
0.01312425, -0.4816257, 2.984545, 0, 0.9215686, 1, 1,
0.013281, 2.348115, -0.8524148, 0, 0.9176471, 1, 1,
0.01627992, 0.2752421, 0.8193371, 0, 0.9098039, 1, 1,
0.02083968, 1.46159, 0.3726022, 0, 0.9058824, 1, 1,
0.02357135, 0.3317361, -0.9228991, 0, 0.8980392, 1, 1,
0.03169833, 0.1911668, -0.2384547, 0, 0.8901961, 1, 1,
0.03366367, 1.80251, -1.256074, 0, 0.8862745, 1, 1,
0.03856493, 0.628485, 0.2046526, 0, 0.8784314, 1, 1,
0.03982272, -0.6892037, 2.834804, 0, 0.8745098, 1, 1,
0.04083616, -0.292734, 2.102251, 0, 0.8666667, 1, 1,
0.04188789, -1.199272, 2.287739, 0, 0.8627451, 1, 1,
0.04582874, -0.08963002, 3.572522, 0, 0.854902, 1, 1,
0.04691668, -1.061403, 3.767553, 0, 0.8509804, 1, 1,
0.05148204, 0.2271492, 1.731944, 0, 0.8431373, 1, 1,
0.05436016, -2.15253, 2.503731, 0, 0.8392157, 1, 1,
0.0590071, -0.4413477, 2.413393, 0, 0.8313726, 1, 1,
0.06183856, -0.437459, 3.299862, 0, 0.827451, 1, 1,
0.06714323, -0.7909024, 3.279756, 0, 0.8196079, 1, 1,
0.0684304, -0.02295262, 1.826759, 0, 0.8156863, 1, 1,
0.07135861, 0.2226246, 0.332652, 0, 0.8078431, 1, 1,
0.08314924, 0.2702473, -1.421044, 0, 0.8039216, 1, 1,
0.08596762, -0.03780366, 2.948118, 0, 0.7960784, 1, 1,
0.08735929, 0.9043586, 0.270764, 0, 0.7882353, 1, 1,
0.08779164, -0.3611163, 3.269027, 0, 0.7843137, 1, 1,
0.09474629, -0.6195914, 3.428601, 0, 0.7764706, 1, 1,
0.0984854, 0.3254049, -0.4087931, 0, 0.772549, 1, 1,
0.1016248, 0.3275242, -0.06596461, 0, 0.7647059, 1, 1,
0.1016672, 0.603831, -0.1873045, 0, 0.7607843, 1, 1,
0.1033756, 1.266489, -0.4514098, 0, 0.7529412, 1, 1,
0.1080498, 0.269452, 1.020219, 0, 0.7490196, 1, 1,
0.1101553, -0.1605336, 2.590446, 0, 0.7411765, 1, 1,
0.110327, -0.4506762, 3.429615, 0, 0.7372549, 1, 1,
0.1111432, 0.1897316, 1.326379, 0, 0.7294118, 1, 1,
0.1134753, -0.4330249, 1.017516, 0, 0.7254902, 1, 1,
0.1137833, 0.6336501, 0.3958086, 0, 0.7176471, 1, 1,
0.1140808, -0.8104402, 2.528925, 0, 0.7137255, 1, 1,
0.1368495, -0.6495277, 2.772927, 0, 0.7058824, 1, 1,
0.1374207, 1.757244, -1.020906, 0, 0.6980392, 1, 1,
0.1398228, -0.6607217, 3.672992, 0, 0.6941177, 1, 1,
0.140735, -0.181833, 2.22419, 0, 0.6862745, 1, 1,
0.1416987, -0.7447524, 3.525415, 0, 0.682353, 1, 1,
0.1426154, 0.5963706, -2.117224, 0, 0.6745098, 1, 1,
0.1454656, 2.327848, -1.2541, 0, 0.6705883, 1, 1,
0.1504212, 1.208158, 0.3674335, 0, 0.6627451, 1, 1,
0.1530623, -0.3356494, 3.763974, 0, 0.6588235, 1, 1,
0.1537059, 0.2600605, -0.5327188, 0, 0.6509804, 1, 1,
0.15495, -1.897514, 4.476602, 0, 0.6470588, 1, 1,
0.1570442, 0.7597708, -1.642627, 0, 0.6392157, 1, 1,
0.1572221, 0.5143633, 0.7256534, 0, 0.6352941, 1, 1,
0.1578946, 0.218945, -0.5119905, 0, 0.627451, 1, 1,
0.1601586, 1.444855, 0.8660227, 0, 0.6235294, 1, 1,
0.161045, 1.042941, 2.425324, 0, 0.6156863, 1, 1,
0.1617504, 0.3291938, -0.1067567, 0, 0.6117647, 1, 1,
0.1619942, -1.480595, 3.731735, 0, 0.6039216, 1, 1,
0.1632746, -0.614159, 3.137908, 0, 0.5960785, 1, 1,
0.1675236, 1.764708, -1.11134, 0, 0.5921569, 1, 1,
0.1713349, 0.1005925, 2.658129, 0, 0.5843138, 1, 1,
0.1733525, -1.887436, 3.720663, 0, 0.5803922, 1, 1,
0.1763791, -0.2212981, 2.385694, 0, 0.572549, 1, 1,
0.1814781, 0.222727, 0.2059775, 0, 0.5686275, 1, 1,
0.1830869, -0.8527763, 2.987108, 0, 0.5607843, 1, 1,
0.1852375, 0.07785343, 2.595856, 0, 0.5568628, 1, 1,
0.185329, 0.8295462, -0.4153706, 0, 0.5490196, 1, 1,
0.1854569, -2.000981, 2.622357, 0, 0.5450981, 1, 1,
0.187994, -0.4668598, 2.549929, 0, 0.5372549, 1, 1,
0.1952018, 0.3771506, 1.283316, 0, 0.5333334, 1, 1,
0.1996928, -0.977747, 1.106112, 0, 0.5254902, 1, 1,
0.2030365, 0.1598617, 0.2453066, 0, 0.5215687, 1, 1,
0.2033001, -1.141877, 4.87789, 0, 0.5137255, 1, 1,
0.2046934, -1.431779, 2.580729, 0, 0.509804, 1, 1,
0.2065048, 0.2333843, 1.299948, 0, 0.5019608, 1, 1,
0.2074284, -0.327132, 2.798904, 0, 0.4941176, 1, 1,
0.2090962, -0.6545183, 3.196837, 0, 0.4901961, 1, 1,
0.2099843, 0.3315814, 1.627445, 0, 0.4823529, 1, 1,
0.2129621, -1.757593, 3.060986, 0, 0.4784314, 1, 1,
0.2158889, 0.4988622, 0.8111756, 0, 0.4705882, 1, 1,
0.2182576, 1.302181, 0.9257831, 0, 0.4666667, 1, 1,
0.2209977, -1.052486, 2.096861, 0, 0.4588235, 1, 1,
0.2213617, 1.506143, 1.297664, 0, 0.454902, 1, 1,
0.2213672, -0.2680497, 1.419387, 0, 0.4470588, 1, 1,
0.2235147, 0.154373, -0.07942763, 0, 0.4431373, 1, 1,
0.2311514, -1.080828, 2.633719, 0, 0.4352941, 1, 1,
0.2366255, 0.2653406, -0.6730922, 0, 0.4313726, 1, 1,
0.2406971, -0.7632709, 2.350249, 0, 0.4235294, 1, 1,
0.2414142, 0.9529482, -1.76172, 0, 0.4196078, 1, 1,
0.2491447, 1.249613, -1.06332, 0, 0.4117647, 1, 1,
0.2556472, 1.762097, 1.014935, 0, 0.4078431, 1, 1,
0.257694, -1.303929, 2.0211, 0, 0.4, 1, 1,
0.2620648, 0.8854339, -0.05291498, 0, 0.3921569, 1, 1,
0.2647706, -1.028498, 0.5024068, 0, 0.3882353, 1, 1,
0.2665142, -1.599479, 3.729059, 0, 0.3803922, 1, 1,
0.2708303, -0.9379351, 2.944712, 0, 0.3764706, 1, 1,
0.2733106, 1.262069, 0.2063721, 0, 0.3686275, 1, 1,
0.2816896, 0.1557455, 0.4688264, 0, 0.3647059, 1, 1,
0.2825729, -0.5145146, 2.068422, 0, 0.3568628, 1, 1,
0.2843277, -1.023347, 1.166564, 0, 0.3529412, 1, 1,
0.2887302, -0.5870995, 2.785782, 0, 0.345098, 1, 1,
0.2905373, -0.2579784, 2.884847, 0, 0.3411765, 1, 1,
0.2937495, -0.009369271, 2.164543, 0, 0.3333333, 1, 1,
0.2952299, 1.912403, -0.9708934, 0, 0.3294118, 1, 1,
0.2957089, 1.96618, -0.6610047, 0, 0.3215686, 1, 1,
0.2958677, 2.863501, 1.78615, 0, 0.3176471, 1, 1,
0.2984741, -0.8869622, 3.269987, 0, 0.3098039, 1, 1,
0.3089442, 0.6301493, 1.958636, 0, 0.3058824, 1, 1,
0.3093649, -2.006547, 0.7299426, 0, 0.2980392, 1, 1,
0.3105467, 0.004343722, 1.535312, 0, 0.2901961, 1, 1,
0.3112832, -0.1134578, 1.408763, 0, 0.2862745, 1, 1,
0.3117039, -1.270493, 1.47927, 0, 0.2784314, 1, 1,
0.3130754, 1.698894, 1.593856, 0, 0.2745098, 1, 1,
0.3186457, 1.402911, 0.3621244, 0, 0.2666667, 1, 1,
0.320837, -0.4734786, 2.233605, 0, 0.2627451, 1, 1,
0.3213058, -1.93586, 4.114692, 0, 0.254902, 1, 1,
0.3215303, -0.2034083, 0.5713789, 0, 0.2509804, 1, 1,
0.3315199, -0.3696879, 0.7289909, 0, 0.2431373, 1, 1,
0.3330284, 0.7477064, 0.510321, 0, 0.2392157, 1, 1,
0.3333184, -0.4195858, 3.077401, 0, 0.2313726, 1, 1,
0.3343708, -0.03189339, 2.575077, 0, 0.227451, 1, 1,
0.3389542, -0.09201317, 1.68455, 0, 0.2196078, 1, 1,
0.3396271, 1.18889, 0.5078682, 0, 0.2156863, 1, 1,
0.3437991, 0.7055575, 1.480523, 0, 0.2078431, 1, 1,
0.3470525, 0.4777817, 1.442124, 0, 0.2039216, 1, 1,
0.3483966, 1.026613, 1.06247, 0, 0.1960784, 1, 1,
0.3516179, -0.2184543, 1.756952, 0, 0.1882353, 1, 1,
0.3521723, -1.163268, 3.300903, 0, 0.1843137, 1, 1,
0.3539682, 0.5336511, -0.5723587, 0, 0.1764706, 1, 1,
0.3549494, -0.1661576, 1.279586, 0, 0.172549, 1, 1,
0.3577227, 1.401547, 0.02034761, 0, 0.1647059, 1, 1,
0.3615812, -0.6668382, 4.581605, 0, 0.1607843, 1, 1,
0.3664631, 0.8177347, 0.5805814, 0, 0.1529412, 1, 1,
0.3707002, -0.04327783, 1.949665, 0, 0.1490196, 1, 1,
0.3726486, -0.2911337, 3.505111, 0, 0.1411765, 1, 1,
0.3732399, 0.547825, -0.3627795, 0, 0.1372549, 1, 1,
0.3744753, 0.8591098, 0.1353102, 0, 0.1294118, 1, 1,
0.3777419, -0.332781, 2.035855, 0, 0.1254902, 1, 1,
0.3779723, -0.7190514, 3.958813, 0, 0.1176471, 1, 1,
0.3847663, 0.6797274, -0.2571465, 0, 0.1137255, 1, 1,
0.3856179, -0.9345269, 4.847284, 0, 0.1058824, 1, 1,
0.388464, 0.02036431, 0.252047, 0, 0.09803922, 1, 1,
0.3910284, -0.2750219, 3.287261, 0, 0.09411765, 1, 1,
0.3915316, -0.4730924, 2.330598, 0, 0.08627451, 1, 1,
0.3943144, 0.2534333, -0.1251513, 0, 0.08235294, 1, 1,
0.3958508, -1.319937, 1.267723, 0, 0.07450981, 1, 1,
0.3979077, 0.5582986, 1.236654, 0, 0.07058824, 1, 1,
0.3988622, -0.824928, 0.7976611, 0, 0.0627451, 1, 1,
0.3989996, 0.8958101, -0.7310594, 0, 0.05882353, 1, 1,
0.3991487, -1.21464, 2.065173, 0, 0.05098039, 1, 1,
0.3991945, -0.06010621, 1.219977, 0, 0.04705882, 1, 1,
0.4005338, -1.021459, 2.372401, 0, 0.03921569, 1, 1,
0.4045447, -0.606469, 4.327126, 0, 0.03529412, 1, 1,
0.4046129, -0.5438042, 2.180341, 0, 0.02745098, 1, 1,
0.4095953, 0.3928555, 0.3952322, 0, 0.02352941, 1, 1,
0.4096553, 0.6274123, 0.7515243, 0, 0.01568628, 1, 1,
0.4156632, 0.9115978, 1.382398, 0, 0.01176471, 1, 1,
0.422174, -0.5681853, 2.803011, 0, 0.003921569, 1, 1,
0.4230375, -0.5526319, 3.175119, 0.003921569, 0, 1, 1,
0.4242417, 0.5312376, 0.5751898, 0.007843138, 0, 1, 1,
0.4245149, 0.6907996, 2.647538, 0.01568628, 0, 1, 1,
0.4247149, -0.7732261, 1.867575, 0.01960784, 0, 1, 1,
0.4249591, -0.1181576, 2.28715, 0.02745098, 0, 1, 1,
0.4276895, -1.953004, 3.274531, 0.03137255, 0, 1, 1,
0.4289944, -0.5671616, 1.247391, 0.03921569, 0, 1, 1,
0.4344863, 0.3993885, 1.763554, 0.04313726, 0, 1, 1,
0.4377919, -0.7515466, 1.792505, 0.05098039, 0, 1, 1,
0.4486403, -0.9820926, 2.647904, 0.05490196, 0, 1, 1,
0.4488768, 0.5252732, 1.353318, 0.0627451, 0, 1, 1,
0.4488947, 0.3994875, 0.1804316, 0.06666667, 0, 1, 1,
0.4616104, 0.3094444, 2.42495, 0.07450981, 0, 1, 1,
0.4658034, 0.9133151, 1.15015, 0.07843138, 0, 1, 1,
0.4713034, -0.5527819, 3.457474, 0.08627451, 0, 1, 1,
0.4794319, 0.6010824, 0.5001437, 0.09019608, 0, 1, 1,
0.4810988, 0.1844251, 1.401886, 0.09803922, 0, 1, 1,
0.4815189, 0.2374638, 0.2376127, 0.1058824, 0, 1, 1,
0.4846992, -1.266658, 3.701539, 0.1098039, 0, 1, 1,
0.4849033, 0.1475191, 0.5346192, 0.1176471, 0, 1, 1,
0.4887804, 1.296044, 0.6941106, 0.1215686, 0, 1, 1,
0.4914488, 1.181642, 0.9885666, 0.1294118, 0, 1, 1,
0.5004122, 0.5225862, -0.4160886, 0.1333333, 0, 1, 1,
0.5041834, -0.07029533, 0.8267612, 0.1411765, 0, 1, 1,
0.5063114, -0.548791, 2.951623, 0.145098, 0, 1, 1,
0.506475, -1.482892, 3.282646, 0.1529412, 0, 1, 1,
0.5065827, -1.740389, 1.079251, 0.1568628, 0, 1, 1,
0.5081605, -0.5433302, 3.362359, 0.1647059, 0, 1, 1,
0.509275, 0.5563962, 1.512733, 0.1686275, 0, 1, 1,
0.5093316, 0.08667216, 2.105196, 0.1764706, 0, 1, 1,
0.5118846, -0.7093721, 0.3745176, 0.1803922, 0, 1, 1,
0.5132806, -2.085628, 0.3049631, 0.1882353, 0, 1, 1,
0.5153383, 0.7887623, 0.3940608, 0.1921569, 0, 1, 1,
0.5154282, 1.249444, -1.527986, 0.2, 0, 1, 1,
0.5162836, 1.45512, 0.1991982, 0.2078431, 0, 1, 1,
0.5163719, 0.09038925, 2.357224, 0.2117647, 0, 1, 1,
0.5178005, -0.3313616, 2.183629, 0.2196078, 0, 1, 1,
0.520049, 1.377635, -1.610229, 0.2235294, 0, 1, 1,
0.5217599, 0.2432701, 1.52991, 0.2313726, 0, 1, 1,
0.5247067, -1.43507, 4.611845, 0.2352941, 0, 1, 1,
0.5266122, -0.9984205, 2.680774, 0.2431373, 0, 1, 1,
0.5287464, -0.4410384, 2.075652, 0.2470588, 0, 1, 1,
0.5289313, 0.2001482, 2.126611, 0.254902, 0, 1, 1,
0.5333843, -0.3319829, 0.3022898, 0.2588235, 0, 1, 1,
0.5370641, -1.273652, 1.154191, 0.2666667, 0, 1, 1,
0.5376042, 0.757269, 1.357671, 0.2705882, 0, 1, 1,
0.5393604, 1.745151, 0.6095645, 0.2784314, 0, 1, 1,
0.5435579, -2.621557, 2.068925, 0.282353, 0, 1, 1,
0.5444142, -0.3091348, 2.521084, 0.2901961, 0, 1, 1,
0.5447167, 0.3428262, 1.525168, 0.2941177, 0, 1, 1,
0.5475436, 0.7042608, 0.5642756, 0.3019608, 0, 1, 1,
0.5589893, -0.5160344, 0.7424241, 0.3098039, 0, 1, 1,
0.5604779, 0.3845366, 1.491717, 0.3137255, 0, 1, 1,
0.5625194, 0.06513261, 1.687111, 0.3215686, 0, 1, 1,
0.5648563, -1.012248, 2.984132, 0.3254902, 0, 1, 1,
0.5651474, 0.1579731, 2.242507, 0.3333333, 0, 1, 1,
0.5677041, -0.4931298, 2.006942, 0.3372549, 0, 1, 1,
0.5701404, -3.168291, 3.590326, 0.345098, 0, 1, 1,
0.5734233, -0.3440975, 4.06577, 0.3490196, 0, 1, 1,
0.5737144, 0.3531059, 2.044, 0.3568628, 0, 1, 1,
0.5750934, 0.07440111, 2.183859, 0.3607843, 0, 1, 1,
0.5785654, -0.9729012, 2.120834, 0.3686275, 0, 1, 1,
0.5794446, 0.09802153, 1.323483, 0.372549, 0, 1, 1,
0.5816896, -1.47857, 2.92641, 0.3803922, 0, 1, 1,
0.5828494, 0.0008824736, 1.748292, 0.3843137, 0, 1, 1,
0.5930451, 1.17023, 1.209999, 0.3921569, 0, 1, 1,
0.5940251, 0.3826235, 1.417928, 0.3960784, 0, 1, 1,
0.6011959, -1.185925, 3.994698, 0.4039216, 0, 1, 1,
0.6019422, 0.2718059, 0.9662629, 0.4117647, 0, 1, 1,
0.602726, 0.4744463, -0.8940896, 0.4156863, 0, 1, 1,
0.6046756, 0.3311415, 0.5161808, 0.4235294, 0, 1, 1,
0.6066792, -1.66189, 2.237233, 0.427451, 0, 1, 1,
0.6120269, 0.3393095, -0.0535236, 0.4352941, 0, 1, 1,
0.6144561, 0.6791134, -0.3157084, 0.4392157, 0, 1, 1,
0.6150836, -0.2474174, 1.779793, 0.4470588, 0, 1, 1,
0.6184621, -0.2405054, 1.762286, 0.4509804, 0, 1, 1,
0.6197028, 1.940761, 0.3055947, 0.4588235, 0, 1, 1,
0.6198611, -0.1449965, 1.59502, 0.4627451, 0, 1, 1,
0.622294, 1.103972, 0.1249702, 0.4705882, 0, 1, 1,
0.6253547, -0.07638329, 2.5102, 0.4745098, 0, 1, 1,
0.6308432, 0.2116695, 0.5469496, 0.4823529, 0, 1, 1,
0.6349927, -0.01627637, 1.465557, 0.4862745, 0, 1, 1,
0.6391487, -0.9351522, 3.39402, 0.4941176, 0, 1, 1,
0.6455822, -0.3383263, 2.339863, 0.5019608, 0, 1, 1,
0.6458423, 0.5363325, -1.01254, 0.5058824, 0, 1, 1,
0.6464346, -0.6237442, 2.775013, 0.5137255, 0, 1, 1,
0.649717, 2.128644, -0.7668641, 0.5176471, 0, 1, 1,
0.6511796, -1.041051, 1.469792, 0.5254902, 0, 1, 1,
0.6523675, 0.1930243, 0.5581823, 0.5294118, 0, 1, 1,
0.6561837, -0.6213461, 3.181098, 0.5372549, 0, 1, 1,
0.657834, -0.2137807, 1.899207, 0.5411765, 0, 1, 1,
0.6596162, 0.6921995, 2.194209, 0.5490196, 0, 1, 1,
0.6616319, 1.039215, -0.2063164, 0.5529412, 0, 1, 1,
0.6681126, 0.1006726, 3.369088, 0.5607843, 0, 1, 1,
0.6685889, -0.348204, 1.895358, 0.5647059, 0, 1, 1,
0.669903, -0.9875035, 1.868055, 0.572549, 0, 1, 1,
0.6701638, 0.02361402, 1.130979, 0.5764706, 0, 1, 1,
0.6703493, 0.09426878, -0.736167, 0.5843138, 0, 1, 1,
0.6780653, 1.782848, -0.7707224, 0.5882353, 0, 1, 1,
0.6782622, 0.1127963, 2.555064, 0.5960785, 0, 1, 1,
0.6848067, 0.2937998, 0.8507351, 0.6039216, 0, 1, 1,
0.6862531, -0.7836571, 3.5603, 0.6078432, 0, 1, 1,
0.6880937, 1.566064, 0.01712787, 0.6156863, 0, 1, 1,
0.6910813, 0.6691697, 0.400035, 0.6196079, 0, 1, 1,
0.6914893, -1.216333, 2.381537, 0.627451, 0, 1, 1,
0.6924917, 0.1495008, 0.6694111, 0.6313726, 0, 1, 1,
0.6953275, -1.183675, 2.418506, 0.6392157, 0, 1, 1,
0.7007714, -1.516987, 2.654802, 0.6431373, 0, 1, 1,
0.7008759, 0.1073678, -0.2546181, 0.6509804, 0, 1, 1,
0.7012308, 1.009994, -0.4658434, 0.654902, 0, 1, 1,
0.7054301, 1.003315, 0.1602882, 0.6627451, 0, 1, 1,
0.7077857, -0.6660762, -0.04565603, 0.6666667, 0, 1, 1,
0.7082128, 0.3556974, 2.562565, 0.6745098, 0, 1, 1,
0.7086485, -0.6455386, 2.542767, 0.6784314, 0, 1, 1,
0.7111808, -1.915292, 3.168025, 0.6862745, 0, 1, 1,
0.7176428, -0.09900545, 3.194562, 0.6901961, 0, 1, 1,
0.7215002, -0.5116359, 2.417547, 0.6980392, 0, 1, 1,
0.7260028, 1.552498, 2.37752, 0.7058824, 0, 1, 1,
0.7312532, -2.315038, 3.879887, 0.7098039, 0, 1, 1,
0.7339852, -0.3190742, 2.109099, 0.7176471, 0, 1, 1,
0.7350127, -0.05128904, 1.853987, 0.7215686, 0, 1, 1,
0.7365593, 0.4909652, -0.4406992, 0.7294118, 0, 1, 1,
0.7498786, 0.9504407, -0.0322787, 0.7333333, 0, 1, 1,
0.7509969, -2.502832, 2.538651, 0.7411765, 0, 1, 1,
0.7591031, 0.8990833, 1.132091, 0.7450981, 0, 1, 1,
0.7641379, -1.811837, 1.195757, 0.7529412, 0, 1, 1,
0.766619, -1.142683, 2.187626, 0.7568628, 0, 1, 1,
0.7666594, -0.8200744, 1.149408, 0.7647059, 0, 1, 1,
0.7720913, 0.888914, -0.4141698, 0.7686275, 0, 1, 1,
0.7773926, -1.522822, 2.869064, 0.7764706, 0, 1, 1,
0.7810524, -0.2503991, 2.296951, 0.7803922, 0, 1, 1,
0.7829732, -0.7927718, 2.044207, 0.7882353, 0, 1, 1,
0.7868541, -0.8971961, 2.612894, 0.7921569, 0, 1, 1,
0.7909018, -0.814841, 2.06971, 0.8, 0, 1, 1,
0.7929527, -0.4841587, 1.286273, 0.8078431, 0, 1, 1,
0.7982605, 0.4378485, -0.7376576, 0.8117647, 0, 1, 1,
0.7989692, -0.7738778, 3.941911, 0.8196079, 0, 1, 1,
0.8001711, 1.575783, 1.790935, 0.8235294, 0, 1, 1,
0.8035072, -1.30867, 2.312583, 0.8313726, 0, 1, 1,
0.8184725, -0.5492731, 2.990864, 0.8352941, 0, 1, 1,
0.8283084, 0.6518436, -0.7040415, 0.8431373, 0, 1, 1,
0.8294586, 0.565174, 1.754283, 0.8470588, 0, 1, 1,
0.8306689, -1.642923, 3.610436, 0.854902, 0, 1, 1,
0.8342917, 1.613344, -0.6393734, 0.8588235, 0, 1, 1,
0.8379045, -1.419997, 3.165441, 0.8666667, 0, 1, 1,
0.8391327, -1.0942, 2.212804, 0.8705882, 0, 1, 1,
0.845999, -0.6074923, 2.914483, 0.8784314, 0, 1, 1,
0.8483663, -0.7509857, 2.435983, 0.8823529, 0, 1, 1,
0.8517177, -1.06469, 3.868556, 0.8901961, 0, 1, 1,
0.8559822, 0.0306554, 1.132648, 0.8941177, 0, 1, 1,
0.8567125, 0.6812364, 1.046509, 0.9019608, 0, 1, 1,
0.8620369, -2.474739, 2.922242, 0.9098039, 0, 1, 1,
0.8639621, -0.1281541, 2.815247, 0.9137255, 0, 1, 1,
0.8645455, 0.169711, 2.658597, 0.9215686, 0, 1, 1,
0.8718486, 0.03094529, 0.6884593, 0.9254902, 0, 1, 1,
0.8794087, 0.7604536, -0.5744757, 0.9333333, 0, 1, 1,
0.9002693, -0.8098125, 3.247517, 0.9372549, 0, 1, 1,
0.9006408, 1.848419, -0.1272719, 0.945098, 0, 1, 1,
0.9006777, 1.920424, 0.6671463, 0.9490196, 0, 1, 1,
0.9013228, 0.01824928, 0.9275224, 0.9568627, 0, 1, 1,
0.9022535, 0.06284864, 0.7077209, 0.9607843, 0, 1, 1,
0.9068349, -0.127403, 0.1915576, 0.9686275, 0, 1, 1,
0.9090966, 0.1135466, 1.066379, 0.972549, 0, 1, 1,
0.9244988, 0.1564514, -0.0002440985, 0.9803922, 0, 1, 1,
0.9312023, -0.5859827, 1.321553, 0.9843137, 0, 1, 1,
0.9323449, 1.881176, 2.017312, 0.9921569, 0, 1, 1,
0.9323513, 0.2552544, 1.833651, 0.9960784, 0, 1, 1,
0.9337647, 0.222643, 0.4581796, 1, 0, 0.9960784, 1,
0.9413404, -0.746928, 2.160569, 1, 0, 0.9882353, 1,
0.9506245, 2.086677, 0.5135859, 1, 0, 0.9843137, 1,
0.9537353, 1.248405, -0.3213965, 1, 0, 0.9764706, 1,
0.9656321, 1.251992, 0.2483492, 1, 0, 0.972549, 1,
0.9676899, 0.1528556, 0.4705719, 1, 0, 0.9647059, 1,
0.9695393, 0.1730495, 1.344213, 1, 0, 0.9607843, 1,
0.9723186, -0.208399, 3.133976, 1, 0, 0.9529412, 1,
0.9730703, 0.566151, 1.41344, 1, 0, 0.9490196, 1,
0.9786567, 0.1397501, 0.3983612, 1, 0, 0.9411765, 1,
0.978963, -0.3021597, 3.175249, 1, 0, 0.9372549, 1,
0.9822531, 1.456966, 0.09058104, 1, 0, 0.9294118, 1,
0.9825059, -0.8779935, 1.201159, 1, 0, 0.9254902, 1,
0.9882851, 0.3737726, 1.464696, 1, 0, 0.9176471, 1,
0.988297, -0.6440183, 3.109473, 1, 0, 0.9137255, 1,
0.9897783, -2.541436, 3.361876, 1, 0, 0.9058824, 1,
0.9966637, 1.052942, 1.145633, 1, 0, 0.9019608, 1,
0.9994719, -1.395034, 2.53813, 1, 0, 0.8941177, 1,
1.000648, 1.743768, 0.2012239, 1, 0, 0.8862745, 1,
1.00254, 1.065722, 1.801601, 1, 0, 0.8823529, 1,
1.005592, 0.1286409, -0.5377311, 1, 0, 0.8745098, 1,
1.007128, -0.3674701, 1.944877, 1, 0, 0.8705882, 1,
1.015166, -0.5108666, 1.189073, 1, 0, 0.8627451, 1,
1.015721, -0.02450545, 2.66739, 1, 0, 0.8588235, 1,
1.022759, 0.9651108, 0.273233, 1, 0, 0.8509804, 1,
1.023811, -0.1797022, 0.6530135, 1, 0, 0.8470588, 1,
1.035758, -0.1486219, 1.764573, 1, 0, 0.8392157, 1,
1.046123, -0.5703387, 1.932741, 1, 0, 0.8352941, 1,
1.050418, 0.5348859, 2.578293, 1, 0, 0.827451, 1,
1.058178, -0.4164037, 1.606431, 1, 0, 0.8235294, 1,
1.05867, 0.4159558, 2.774303, 1, 0, 0.8156863, 1,
1.058938, -1.305299, 2.665781, 1, 0, 0.8117647, 1,
1.067537, -1.688831, 3.596226, 1, 0, 0.8039216, 1,
1.070297, 0.8330777, 0.9054872, 1, 0, 0.7960784, 1,
1.078203, -0.4920237, 2.382921, 1, 0, 0.7921569, 1,
1.082149, -1.085677, 2.109209, 1, 0, 0.7843137, 1,
1.088721, 0.2907858, 1.580002, 1, 0, 0.7803922, 1,
1.093192, -1.061457, 1.474237, 1, 0, 0.772549, 1,
1.093219, -0.04606896, 0.7216014, 1, 0, 0.7686275, 1,
1.096741, 0.05041325, 1.190186, 1, 0, 0.7607843, 1,
1.097354, 1.16096, 1.089988, 1, 0, 0.7568628, 1,
1.10699, -0.04772355, 2.01466, 1, 0, 0.7490196, 1,
1.107334, -1.475899, 3.261855, 1, 0, 0.7450981, 1,
1.11205, -0.07336514, 1.19558, 1, 0, 0.7372549, 1,
1.113173, -0.442079, 2.990513, 1, 0, 0.7333333, 1,
1.115294, 0.7501745, 0.6286023, 1, 0, 0.7254902, 1,
1.120509, -1.534378, 0.9157386, 1, 0, 0.7215686, 1,
1.129922, 0.9017004, 2.305422, 1, 0, 0.7137255, 1,
1.133129, 0.325758, 1.083749, 1, 0, 0.7098039, 1,
1.149114, 0.2656797, 1.221425, 1, 0, 0.7019608, 1,
1.172788, 1.164966, -0.4942622, 1, 0, 0.6941177, 1,
1.181035, 1.104036, 0.2987486, 1, 0, 0.6901961, 1,
1.18332, 0.3942302, 2.280455, 1, 0, 0.682353, 1,
1.184323, 1.594559, 0.5308214, 1, 0, 0.6784314, 1,
1.18714, -0.6166607, 4.136627, 1, 0, 0.6705883, 1,
1.190914, 0.6867011, 1.228843, 1, 0, 0.6666667, 1,
1.193839, -1.063033, 0.6269245, 1, 0, 0.6588235, 1,
1.203849, 2.525828, 0.7775028, 1, 0, 0.654902, 1,
1.205185, -1.197032, 3.581913, 1, 0, 0.6470588, 1,
1.205929, -0.5296426, 2.635405, 1, 0, 0.6431373, 1,
1.225466, 0.5878738, -0.6806421, 1, 0, 0.6352941, 1,
1.233441, -1.300462, 3.834595, 1, 0, 0.6313726, 1,
1.235664, -0.3224858, 4.459538, 1, 0, 0.6235294, 1,
1.238781, 0.4589919, 1.310024, 1, 0, 0.6196079, 1,
1.245676, -0.1931119, 1.646755, 1, 0, 0.6117647, 1,
1.245862, 0.4065117, 1.766171, 1, 0, 0.6078432, 1,
1.245885, -0.2254869, 0.2675136, 1, 0, 0.6, 1,
1.247087, 0.3711487, 0.5149547, 1, 0, 0.5921569, 1,
1.24834, 0.1115303, 2.581462, 1, 0, 0.5882353, 1,
1.255001, 0.3623361, 0.9906963, 1, 0, 0.5803922, 1,
1.255138, -0.6993128, 0.4164491, 1, 0, 0.5764706, 1,
1.257256, -1.327582, 3.354168, 1, 0, 0.5686275, 1,
1.257321, -0.6475142, 3.099839, 1, 0, 0.5647059, 1,
1.266841, -1.184968, 4.105168, 1, 0, 0.5568628, 1,
1.273894, 2.259134, -0.6674488, 1, 0, 0.5529412, 1,
1.279014, -0.6181548, 2.65162, 1, 0, 0.5450981, 1,
1.308433, 0.8047664, 0.05594152, 1, 0, 0.5411765, 1,
1.327762, 1.53913, 2.750677, 1, 0, 0.5333334, 1,
1.360932, -0.0717293, 2.2789, 1, 0, 0.5294118, 1,
1.364491, 1.366608, 0.03850953, 1, 0, 0.5215687, 1,
1.369025, 0.2551782, 0.4831516, 1, 0, 0.5176471, 1,
1.3948, -1.89241, 3.684207, 1, 0, 0.509804, 1,
1.395511, 0.5497141, 0.8344846, 1, 0, 0.5058824, 1,
1.396387, -2.56909, 2.981137, 1, 0, 0.4980392, 1,
1.404578, -0.8102565, 1.234226, 1, 0, 0.4901961, 1,
1.447162, 0.7788822, 0.3430412, 1, 0, 0.4862745, 1,
1.458197, 0.3553486, 1.530287, 1, 0, 0.4784314, 1,
1.459672, -0.2091225, 1.635795, 1, 0, 0.4745098, 1,
1.462749, 0.197815, 1.329453, 1, 0, 0.4666667, 1,
1.46464, -1.931321, 4.237224, 1, 0, 0.4627451, 1,
1.464698, -0.06177176, 3.049505, 1, 0, 0.454902, 1,
1.465291, 0.7320571, 2.145159, 1, 0, 0.4509804, 1,
1.486399, 0.279907, 2.265323, 1, 0, 0.4431373, 1,
1.49701, 0.02362661, 1.134831, 1, 0, 0.4392157, 1,
1.499571, 0.288353, 1.0756, 1, 0, 0.4313726, 1,
1.502722, 1.119683, 0.2440429, 1, 0, 0.427451, 1,
1.514025, 0.727976, 0.1480234, 1, 0, 0.4196078, 1,
1.514344, 0.6292254, 1.593899, 1, 0, 0.4156863, 1,
1.53782, 0.8677933, 3.857233, 1, 0, 0.4078431, 1,
1.538158, -0.9799973, 0.6524962, 1, 0, 0.4039216, 1,
1.544196, -1.135057, 1.266065, 1, 0, 0.3960784, 1,
1.546181, -0.2042399, 2.108658, 1, 0, 0.3882353, 1,
1.546263, -0.8381432, 3.104315, 1, 0, 0.3843137, 1,
1.553388, 0.2994521, 1.409433, 1, 0, 0.3764706, 1,
1.574973, -0.582647, 2.327077, 1, 0, 0.372549, 1,
1.594717, -1.218445, 1.72052, 1, 0, 0.3647059, 1,
1.599777, -0.176646, 1.918546, 1, 0, 0.3607843, 1,
1.601695, 0.6224077, 0.3681752, 1, 0, 0.3529412, 1,
1.602969, 0.5180006, 2.247735, 1, 0, 0.3490196, 1,
1.619143, -0.1975274, 1.165634, 1, 0, 0.3411765, 1,
1.620046, -2.638978, 3.079531, 1, 0, 0.3372549, 1,
1.632289, -1.356576, 1.001421, 1, 0, 0.3294118, 1,
1.634994, 0.2334256, 0.8879377, 1, 0, 0.3254902, 1,
1.637673, 0.2929108, 2.489037, 1, 0, 0.3176471, 1,
1.64814, 1.518933, 1.421166, 1, 0, 0.3137255, 1,
1.655251, -0.4604874, 1.119307, 1, 0, 0.3058824, 1,
1.665213, -0.9983552, 1.639214, 1, 0, 0.2980392, 1,
1.674688, 1.116018, 1.194717, 1, 0, 0.2941177, 1,
1.676236, 1.571091, 1.392905, 1, 0, 0.2862745, 1,
1.683718, 2.621647, 0.5433422, 1, 0, 0.282353, 1,
1.700825, 0.5516472, 0.1474867, 1, 0, 0.2745098, 1,
1.701853, 0.7527621, 1.946553, 1, 0, 0.2705882, 1,
1.70286, 1.06634, 0.6077625, 1, 0, 0.2627451, 1,
1.703338, 0.4680316, 0.6583152, 1, 0, 0.2588235, 1,
1.716766, -1.19209, 2.272618, 1, 0, 0.2509804, 1,
1.727488, 1.751106, 1.409038, 1, 0, 0.2470588, 1,
1.740467, 1.078152, 1.936404, 1, 0, 0.2392157, 1,
1.745827, -1.197796, 1.5301, 1, 0, 0.2352941, 1,
1.776504, 0.8654441, 2.637845, 1, 0, 0.227451, 1,
1.786222, -0.6199985, 2.194467, 1, 0, 0.2235294, 1,
1.806745, 0.5043816, 1.970606, 1, 0, 0.2156863, 1,
1.80946, 0.09114243, 0.9799627, 1, 0, 0.2117647, 1,
1.82405, 0.3293082, 0.3528562, 1, 0, 0.2039216, 1,
1.825812, -1.006925, 2.753881, 1, 0, 0.1960784, 1,
1.865224, -0.1949775, 1.608104, 1, 0, 0.1921569, 1,
1.869274, 0.667797, 1.984916, 1, 0, 0.1843137, 1,
1.886897, -1.592892, 3.156482, 1, 0, 0.1803922, 1,
1.892363, -1.405192, 2.285024, 1, 0, 0.172549, 1,
1.916973, -1.808086, 0.6530435, 1, 0, 0.1686275, 1,
1.921305, 1.32383, 0.267428, 1, 0, 0.1607843, 1,
1.928527, 1.356343, 0.6709296, 1, 0, 0.1568628, 1,
1.967754, 0.1041899, 2.947575, 1, 0, 0.1490196, 1,
1.993922, -0.03627327, 1.594542, 1, 0, 0.145098, 1,
2.01793, 0.2085194, 0.229262, 1, 0, 0.1372549, 1,
2.048041, 0.1625817, 2.556644, 1, 0, 0.1333333, 1,
2.064765, 0.8688312, -0.1569832, 1, 0, 0.1254902, 1,
2.097092, 0.7809883, 0.7846053, 1, 0, 0.1215686, 1,
2.10153, 0.07065377, 0.1490833, 1, 0, 0.1137255, 1,
2.136777, 1.2346, 1.192307, 1, 0, 0.1098039, 1,
2.148504, 0.6830918, 1.533206, 1, 0, 0.1019608, 1,
2.160466, 0.6975755, 1.237748, 1, 0, 0.09411765, 1,
2.161104, -0.550346, 1.667835, 1, 0, 0.09019608, 1,
2.180122, 1.174399, 0.9041756, 1, 0, 0.08235294, 1,
2.207667, 0.3986614, 2.86227, 1, 0, 0.07843138, 1,
2.222311, -0.2413202, 2.08693, 1, 0, 0.07058824, 1,
2.231918, -1.325642, 3.527819, 1, 0, 0.06666667, 1,
2.235202, -1.294121, 1.909945, 1, 0, 0.05882353, 1,
2.315462, -0.4506104, 2.188024, 1, 0, 0.05490196, 1,
2.32193, -0.7331626, 1.144255, 1, 0, 0.04705882, 1,
2.379634, 0.2486167, 3.667488, 1, 0, 0.04313726, 1,
2.416955, 0.0733537, 2.135217, 1, 0, 0.03529412, 1,
2.495681, 0.03540798, 2.334773, 1, 0, 0.03137255, 1,
2.525163, 0.006839944, 3.167536, 1, 0, 0.02352941, 1,
2.752431, 0.01125506, 1.230006, 1, 0, 0.01960784, 1,
3.031167, 0.2737625, 3.246851, 1, 0, 0.01176471, 1,
3.459528, -0.2939164, 1.156792, 1, 0, 0.007843138, 1
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
0.1783315, -4.280692, -6.689026, 0, -0.5, 0.5, 0.5,
0.1783315, -4.280692, -6.689026, 1, -0.5, 0.5, 0.5,
0.1783315, -4.280692, -6.689026, 1, 1.5, 0.5, 0.5,
0.1783315, -4.280692, -6.689026, 0, 1.5, 0.5, 0.5
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
-4.215191, 0.1131295, -6.689026, 0, -0.5, 0.5, 0.5,
-4.215191, 0.1131295, -6.689026, 1, -0.5, 0.5, 0.5,
-4.215191, 0.1131295, -6.689026, 1, 1.5, 0.5, 0.5,
-4.215191, 0.1131295, -6.689026, 0, 1.5, 0.5, 0.5
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
-4.215191, -4.280692, -0.06734967, 0, -0.5, 0.5, 0.5,
-4.215191, -4.280692, -0.06734967, 1, -0.5, 0.5, 0.5,
-4.215191, -4.280692, -0.06734967, 1, 1.5, 0.5, 0.5,
-4.215191, -4.280692, -0.06734967, 0, 1.5, 0.5, 0.5
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
-3, -3.266733, -5.160947,
3, -3.266733, -5.160947,
-3, -3.266733, -5.160947,
-3, -3.435726, -5.415627,
-2, -3.266733, -5.160947,
-2, -3.435726, -5.415627,
-1, -3.266733, -5.160947,
-1, -3.435726, -5.415627,
0, -3.266733, -5.160947,
0, -3.435726, -5.415627,
1, -3.266733, -5.160947,
1, -3.435726, -5.415627,
2, -3.266733, -5.160947,
2, -3.435726, -5.415627,
3, -3.266733, -5.160947,
3, -3.435726, -5.415627
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
-3, -3.773713, -5.924986, 0, -0.5, 0.5, 0.5,
-3, -3.773713, -5.924986, 1, -0.5, 0.5, 0.5,
-3, -3.773713, -5.924986, 1, 1.5, 0.5, 0.5,
-3, -3.773713, -5.924986, 0, 1.5, 0.5, 0.5,
-2, -3.773713, -5.924986, 0, -0.5, 0.5, 0.5,
-2, -3.773713, -5.924986, 1, -0.5, 0.5, 0.5,
-2, -3.773713, -5.924986, 1, 1.5, 0.5, 0.5,
-2, -3.773713, -5.924986, 0, 1.5, 0.5, 0.5,
-1, -3.773713, -5.924986, 0, -0.5, 0.5, 0.5,
-1, -3.773713, -5.924986, 1, -0.5, 0.5, 0.5,
-1, -3.773713, -5.924986, 1, 1.5, 0.5, 0.5,
-1, -3.773713, -5.924986, 0, 1.5, 0.5, 0.5,
0, -3.773713, -5.924986, 0, -0.5, 0.5, 0.5,
0, -3.773713, -5.924986, 1, -0.5, 0.5, 0.5,
0, -3.773713, -5.924986, 1, 1.5, 0.5, 0.5,
0, -3.773713, -5.924986, 0, 1.5, 0.5, 0.5,
1, -3.773713, -5.924986, 0, -0.5, 0.5, 0.5,
1, -3.773713, -5.924986, 1, -0.5, 0.5, 0.5,
1, -3.773713, -5.924986, 1, 1.5, 0.5, 0.5,
1, -3.773713, -5.924986, 0, 1.5, 0.5, 0.5,
2, -3.773713, -5.924986, 0, -0.5, 0.5, 0.5,
2, -3.773713, -5.924986, 1, -0.5, 0.5, 0.5,
2, -3.773713, -5.924986, 1, 1.5, 0.5, 0.5,
2, -3.773713, -5.924986, 0, 1.5, 0.5, 0.5,
3, -3.773713, -5.924986, 0, -0.5, 0.5, 0.5,
3, -3.773713, -5.924986, 1, -0.5, 0.5, 0.5,
3, -3.773713, -5.924986, 1, 1.5, 0.5, 0.5,
3, -3.773713, -5.924986, 0, 1.5, 0.5, 0.5
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
-3.201301, -3, -5.160947,
-3.201301, 3, -5.160947,
-3.201301, -3, -5.160947,
-3.370283, -3, -5.415627,
-3.201301, -2, -5.160947,
-3.370283, -2, -5.415627,
-3.201301, -1, -5.160947,
-3.370283, -1, -5.415627,
-3.201301, 0, -5.160947,
-3.370283, 0, -5.415627,
-3.201301, 1, -5.160947,
-3.370283, 1, -5.415627,
-3.201301, 2, -5.160947,
-3.370283, 2, -5.415627,
-3.201301, 3, -5.160947,
-3.370283, 3, -5.415627
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
-3.708246, -3, -5.924986, 0, -0.5, 0.5, 0.5,
-3.708246, -3, -5.924986, 1, -0.5, 0.5, 0.5,
-3.708246, -3, -5.924986, 1, 1.5, 0.5, 0.5,
-3.708246, -3, -5.924986, 0, 1.5, 0.5, 0.5,
-3.708246, -2, -5.924986, 0, -0.5, 0.5, 0.5,
-3.708246, -2, -5.924986, 1, -0.5, 0.5, 0.5,
-3.708246, -2, -5.924986, 1, 1.5, 0.5, 0.5,
-3.708246, -2, -5.924986, 0, 1.5, 0.5, 0.5,
-3.708246, -1, -5.924986, 0, -0.5, 0.5, 0.5,
-3.708246, -1, -5.924986, 1, -0.5, 0.5, 0.5,
-3.708246, -1, -5.924986, 1, 1.5, 0.5, 0.5,
-3.708246, -1, -5.924986, 0, 1.5, 0.5, 0.5,
-3.708246, 0, -5.924986, 0, -0.5, 0.5, 0.5,
-3.708246, 0, -5.924986, 1, -0.5, 0.5, 0.5,
-3.708246, 0, -5.924986, 1, 1.5, 0.5, 0.5,
-3.708246, 0, -5.924986, 0, 1.5, 0.5, 0.5,
-3.708246, 1, -5.924986, 0, -0.5, 0.5, 0.5,
-3.708246, 1, -5.924986, 1, -0.5, 0.5, 0.5,
-3.708246, 1, -5.924986, 1, 1.5, 0.5, 0.5,
-3.708246, 1, -5.924986, 0, 1.5, 0.5, 0.5,
-3.708246, 2, -5.924986, 0, -0.5, 0.5, 0.5,
-3.708246, 2, -5.924986, 1, -0.5, 0.5, 0.5,
-3.708246, 2, -5.924986, 1, 1.5, 0.5, 0.5,
-3.708246, 2, -5.924986, 0, 1.5, 0.5, 0.5,
-3.708246, 3, -5.924986, 0, -0.5, 0.5, 0.5,
-3.708246, 3, -5.924986, 1, -0.5, 0.5, 0.5,
-3.708246, 3, -5.924986, 1, 1.5, 0.5, 0.5,
-3.708246, 3, -5.924986, 0, 1.5, 0.5, 0.5
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
-3.201301, -3.266733, -4,
-3.201301, -3.266733, 4,
-3.201301, -3.266733, -4,
-3.370283, -3.435726, -4,
-3.201301, -3.266733, -2,
-3.370283, -3.435726, -2,
-3.201301, -3.266733, 0,
-3.370283, -3.435726, 0,
-3.201301, -3.266733, 2,
-3.370283, -3.435726, 2,
-3.201301, -3.266733, 4,
-3.370283, -3.435726, 4
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
-3.708246, -3.773713, -4, 0, -0.5, 0.5, 0.5,
-3.708246, -3.773713, -4, 1, -0.5, 0.5, 0.5,
-3.708246, -3.773713, -4, 1, 1.5, 0.5, 0.5,
-3.708246, -3.773713, -4, 0, 1.5, 0.5, 0.5,
-3.708246, -3.773713, -2, 0, -0.5, 0.5, 0.5,
-3.708246, -3.773713, -2, 1, -0.5, 0.5, 0.5,
-3.708246, -3.773713, -2, 1, 1.5, 0.5, 0.5,
-3.708246, -3.773713, -2, 0, 1.5, 0.5, 0.5,
-3.708246, -3.773713, 0, 0, -0.5, 0.5, 0.5,
-3.708246, -3.773713, 0, 1, -0.5, 0.5, 0.5,
-3.708246, -3.773713, 0, 1, 1.5, 0.5, 0.5,
-3.708246, -3.773713, 0, 0, 1.5, 0.5, 0.5,
-3.708246, -3.773713, 2, 0, -0.5, 0.5, 0.5,
-3.708246, -3.773713, 2, 1, -0.5, 0.5, 0.5,
-3.708246, -3.773713, 2, 1, 1.5, 0.5, 0.5,
-3.708246, -3.773713, 2, 0, 1.5, 0.5, 0.5,
-3.708246, -3.773713, 4, 0, -0.5, 0.5, 0.5,
-3.708246, -3.773713, 4, 1, -0.5, 0.5, 0.5,
-3.708246, -3.773713, 4, 1, 1.5, 0.5, 0.5,
-3.708246, -3.773713, 4, 0, 1.5, 0.5, 0.5
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
-3.201301, -3.266733, -5.160947,
-3.201301, 3.492992, -5.160947,
-3.201301, -3.266733, 5.026248,
-3.201301, 3.492992, 5.026248,
-3.201301, -3.266733, -5.160947,
-3.201301, -3.266733, 5.026248,
-3.201301, 3.492992, -5.160947,
-3.201301, 3.492992, 5.026248,
-3.201301, -3.266733, -5.160947,
3.557964, -3.266733, -5.160947,
-3.201301, -3.266733, 5.026248,
3.557964, -3.266733, 5.026248,
-3.201301, 3.492992, -5.160947,
3.557964, 3.492992, -5.160947,
-3.201301, 3.492992, 5.026248,
3.557964, 3.492992, 5.026248,
3.557964, -3.266733, -5.160947,
3.557964, 3.492992, -5.160947,
3.557964, -3.266733, 5.026248,
3.557964, 3.492992, 5.026248,
3.557964, -3.266733, -5.160947,
3.557964, -3.266733, 5.026248,
3.557964, 3.492992, -5.160947,
3.557964, 3.492992, 5.026248
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
var radius = 7.459701;
var distance = 33.18905;
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
mvMatrix.translate( -0.1783315, -0.1131295, 0.06734967 );
mvMatrix.scale( 1.193262, 1.193181, 0.7917366 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.18905);
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

