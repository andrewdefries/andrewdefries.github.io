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
-3.483128, -0.2594897, -0.9574422, 1, 0, 0, 1,
-3.219276, 0.298043, 0.09091851, 1, 0.007843138, 0, 1,
-3.21752, -1.4015, -3.105606, 1, 0.01176471, 0, 1,
-2.958591, -1.525837, -3.673312, 1, 0.01960784, 0, 1,
-2.863753, 0.3403167, -1.491593, 1, 0.02352941, 0, 1,
-2.743513, -0.9498457, -2.036236, 1, 0.03137255, 0, 1,
-2.585381, 0.3761295, -0.518046, 1, 0.03529412, 0, 1,
-2.475966, 1.405935, -1.888226, 1, 0.04313726, 0, 1,
-2.434367, -1.762459, -1.560438, 1, 0.04705882, 0, 1,
-2.392519, 0.6408479, -0.2150588, 1, 0.05490196, 0, 1,
-2.285686, -0.7023659, -1.70795, 1, 0.05882353, 0, 1,
-2.275307, 0.2390235, 0.05654698, 1, 0.06666667, 0, 1,
-2.148983, -0.6410334, -3.318291, 1, 0.07058824, 0, 1,
-2.129778, 0.04905418, -2.702189, 1, 0.07843138, 0, 1,
-2.125835, 3.131315, 0.05437532, 1, 0.08235294, 0, 1,
-2.111226, -0.7824562, -1.770819, 1, 0.09019608, 0, 1,
-2.052955, 0.9162816, -1.847037, 1, 0.09411765, 0, 1,
-2.052177, -1.311196, -1.446771, 1, 0.1019608, 0, 1,
-2.02918, 0.3746401, -3.028529, 1, 0.1098039, 0, 1,
-2.017862, -0.6991931, -1.839365, 1, 0.1137255, 0, 1,
-2.017412, 0.297406, -0.2745995, 1, 0.1215686, 0, 1,
-1.965246, 0.4488567, -0.8073599, 1, 0.1254902, 0, 1,
-1.924206, -0.274979, -2.402805, 1, 0.1333333, 0, 1,
-1.910945, -1.415337, -0.9640114, 1, 0.1372549, 0, 1,
-1.898079, -2.312855, -1.839937, 1, 0.145098, 0, 1,
-1.896777, 0.5313139, -1.466695, 1, 0.1490196, 0, 1,
-1.89355, 0.301043, 0.222176, 1, 0.1568628, 0, 1,
-1.869043, -1.331872, -2.840122, 1, 0.1607843, 0, 1,
-1.842374, 2.499923, -2.101979, 1, 0.1686275, 0, 1,
-1.834747, 1.216417, -1.360967, 1, 0.172549, 0, 1,
-1.832005, 1.197258, 0.1889601, 1, 0.1803922, 0, 1,
-1.805983, 0.1039412, -3.377897, 1, 0.1843137, 0, 1,
-1.792132, -0.5124994, -0.8895659, 1, 0.1921569, 0, 1,
-1.756169, -0.619014, -2.090382, 1, 0.1960784, 0, 1,
-1.716685, -0.412492, -1.910203, 1, 0.2039216, 0, 1,
-1.713528, 0.1865758, -1.410869, 1, 0.2117647, 0, 1,
-1.711541, 0.8290825, -1.375352, 1, 0.2156863, 0, 1,
-1.704037, -0.3031354, -1.47259, 1, 0.2235294, 0, 1,
-1.690583, -1.583522, -3.604804, 1, 0.227451, 0, 1,
-1.669961, 1.969276, -1.097202, 1, 0.2352941, 0, 1,
-1.651639, 0.06647258, -0.9852776, 1, 0.2392157, 0, 1,
-1.649816, 1.496265, -0.8855733, 1, 0.2470588, 0, 1,
-1.6409, 1.916002, -0.7089655, 1, 0.2509804, 0, 1,
-1.621469, -1.296974, -1.270214, 1, 0.2588235, 0, 1,
-1.603961, 0.704277, -0.6159887, 1, 0.2627451, 0, 1,
-1.579636, -0.4232369, -1.464833, 1, 0.2705882, 0, 1,
-1.564378, -0.8996606, -0.9685379, 1, 0.2745098, 0, 1,
-1.563074, 0.01942017, -3.88574, 1, 0.282353, 0, 1,
-1.554484, -1.679749, -0.9903446, 1, 0.2862745, 0, 1,
-1.553301, -0.6680087, -1.696749, 1, 0.2941177, 0, 1,
-1.544543, 0.4616822, -2.99569, 1, 0.3019608, 0, 1,
-1.532565, -0.9820551, -2.4008, 1, 0.3058824, 0, 1,
-1.530518, -0.9179032, -2.196476, 1, 0.3137255, 0, 1,
-1.509822, 0.5245141, -0.6116546, 1, 0.3176471, 0, 1,
-1.507045, -0.3466102, -2.436101, 1, 0.3254902, 0, 1,
-1.498648, 2.429896, 0.7759095, 1, 0.3294118, 0, 1,
-1.481499, 0.3990558, -1.828814, 1, 0.3372549, 0, 1,
-1.477131, -0.8350244, -0.2885593, 1, 0.3411765, 0, 1,
-1.467806, -0.1038176, -1.265229, 1, 0.3490196, 0, 1,
-1.463659, 1.002294, -2.30776, 1, 0.3529412, 0, 1,
-1.45968, 2.335835, -1.990082, 1, 0.3607843, 0, 1,
-1.459612, 0.4774142, -1.17841, 1, 0.3647059, 0, 1,
-1.457712, -0.1769365, -1.50647, 1, 0.372549, 0, 1,
-1.446324, -0.9883064, -3.459197, 1, 0.3764706, 0, 1,
-1.435769, -0.7178634, -0.7555013, 1, 0.3843137, 0, 1,
-1.418623, 0.113826, -1.23876, 1, 0.3882353, 0, 1,
-1.41595, -0.5788453, -0.4691863, 1, 0.3960784, 0, 1,
-1.415767, 0.5851793, -1.332957, 1, 0.4039216, 0, 1,
-1.413105, -2.107211, -2.067547, 1, 0.4078431, 0, 1,
-1.407728, 0.6914518, -1.411305, 1, 0.4156863, 0, 1,
-1.403099, -0.5463173, -2.733092, 1, 0.4196078, 0, 1,
-1.401923, 0.6096442, -1.266365, 1, 0.427451, 0, 1,
-1.400496, -0.3447102, -2.764481, 1, 0.4313726, 0, 1,
-1.382665, -0.9458008, -3.356555, 1, 0.4392157, 0, 1,
-1.381008, -1.706995, -4.831758, 1, 0.4431373, 0, 1,
-1.379158, 0.6012336, -1.036427, 1, 0.4509804, 0, 1,
-1.373941, -0.6353771, -3.103738, 1, 0.454902, 0, 1,
-1.37339, 0.2677475, -1.159101, 1, 0.4627451, 0, 1,
-1.371243, 1.403245, -2.718688, 1, 0.4666667, 0, 1,
-1.367003, -2.972095, -1.975609, 1, 0.4745098, 0, 1,
-1.360743, 1.632804, 0.02442457, 1, 0.4784314, 0, 1,
-1.359751, -1.001766, -2.423657, 1, 0.4862745, 0, 1,
-1.357968, 0.2961801, -2.004888, 1, 0.4901961, 0, 1,
-1.350536, 0.1433796, -0.7529882, 1, 0.4980392, 0, 1,
-1.350458, -0.5333681, -0.7508683, 1, 0.5058824, 0, 1,
-1.348741, -0.804123, -3.388586, 1, 0.509804, 0, 1,
-1.343944, 0.0300436, -0.1359693, 1, 0.5176471, 0, 1,
-1.339206, 0.5849684, -1.693977, 1, 0.5215687, 0, 1,
-1.325975, 0.5152869, -1.238069, 1, 0.5294118, 0, 1,
-1.320043, 0.1317419, -0.06517249, 1, 0.5333334, 0, 1,
-1.314839, 0.1944682, -1.68835, 1, 0.5411765, 0, 1,
-1.299179, -0.8895774, -3.220901, 1, 0.5450981, 0, 1,
-1.284072, 0.9813341, 0.4425539, 1, 0.5529412, 0, 1,
-1.283878, 0.3786373, -1.373118, 1, 0.5568628, 0, 1,
-1.277166, 0.01006113, -1.610841, 1, 0.5647059, 0, 1,
-1.275049, -0.5250982, -1.924662, 1, 0.5686275, 0, 1,
-1.27445, -0.3316079, -1.604419, 1, 0.5764706, 0, 1,
-1.2699, -0.0001357528, -0.2197363, 1, 0.5803922, 0, 1,
-1.262763, 0.7089891, -2.316583, 1, 0.5882353, 0, 1,
-1.260295, -0.5726651, -0.2862253, 1, 0.5921569, 0, 1,
-1.260142, 0.3441567, -3.15852, 1, 0.6, 0, 1,
-1.248357, 1.411903, 0.05767556, 1, 0.6078432, 0, 1,
-1.238221, -1.42622, -1.765726, 1, 0.6117647, 0, 1,
-1.236013, -0.5098755, -1.2432, 1, 0.6196079, 0, 1,
-1.228311, -0.6070667, -1.465369, 1, 0.6235294, 0, 1,
-1.227983, 1.115321, -2.147319, 1, 0.6313726, 0, 1,
-1.221239, -0.6987659, -0.3163964, 1, 0.6352941, 0, 1,
-1.218898, -1.732524, -2.824941, 1, 0.6431373, 0, 1,
-1.218137, 1.041582, 1.153599, 1, 0.6470588, 0, 1,
-1.214059, 0.2059215, -0.7703168, 1, 0.654902, 0, 1,
-1.208387, 1.369902, -1.20275, 1, 0.6588235, 0, 1,
-1.206291, -0.1542459, -0.2164656, 1, 0.6666667, 0, 1,
-1.205976, 1.2567, 0.5425963, 1, 0.6705883, 0, 1,
-1.202886, 0.8381016, -0.7924187, 1, 0.6784314, 0, 1,
-1.196271, 0.5936279, -1.459217, 1, 0.682353, 0, 1,
-1.196113, 0.3662454, -1.506009, 1, 0.6901961, 0, 1,
-1.191455, 0.3563731, -1.820485, 1, 0.6941177, 0, 1,
-1.189603, 0.7307716, -0.3465344, 1, 0.7019608, 0, 1,
-1.189438, -0.3705903, -2.378916, 1, 0.7098039, 0, 1,
-1.188504, -0.5020909, -3.078728, 1, 0.7137255, 0, 1,
-1.188127, 1.428083, -0.02163036, 1, 0.7215686, 0, 1,
-1.184639, 0.3891807, -1.996928, 1, 0.7254902, 0, 1,
-1.182251, -0.3385818, -1.118066, 1, 0.7333333, 0, 1,
-1.178387, -1.285605, -2.219985, 1, 0.7372549, 0, 1,
-1.175578, 0.2826238, -1.402851, 1, 0.7450981, 0, 1,
-1.173127, -1.886952, -2.380729, 1, 0.7490196, 0, 1,
-1.170151, 0.1065843, -1.991998, 1, 0.7568628, 0, 1,
-1.166295, -1.833717, -2.433358, 1, 0.7607843, 0, 1,
-1.161166, -1.729085, -0.8760992, 1, 0.7686275, 0, 1,
-1.16014, -0.9323483, -1.9928, 1, 0.772549, 0, 1,
-1.159376, 0.04200575, -0.2860088, 1, 0.7803922, 0, 1,
-1.157738, 0.340128, -2.665838, 1, 0.7843137, 0, 1,
-1.157694, 0.5368996, -2.909245, 1, 0.7921569, 0, 1,
-1.149126, -1.069676, -2.658048, 1, 0.7960784, 0, 1,
-1.141923, 0.4526932, -0.9310809, 1, 0.8039216, 0, 1,
-1.140166, -1.359831, -2.909376, 1, 0.8117647, 0, 1,
-1.140035, 1.294969, 1.311634, 1, 0.8156863, 0, 1,
-1.135583, 0.248447, -2.134167, 1, 0.8235294, 0, 1,
-1.131948, 0.6471938, -1.756145, 1, 0.827451, 0, 1,
-1.130496, -0.4781083, -1.747415, 1, 0.8352941, 0, 1,
-1.129286, -1.048104, -2.10016, 1, 0.8392157, 0, 1,
-1.128541, -0.3745628, -2.883267, 1, 0.8470588, 0, 1,
-1.122107, -0.09160517, -1.182838, 1, 0.8509804, 0, 1,
-1.12104, 1.343295, -1.242931, 1, 0.8588235, 0, 1,
-1.119583, -0.3735512, -1.206223, 1, 0.8627451, 0, 1,
-1.112698, 0.9568436, -1.709643, 1, 0.8705882, 0, 1,
-1.111469, 0.3769008, -0.2615266, 1, 0.8745098, 0, 1,
-1.108734, -0.2359641, -1.240451, 1, 0.8823529, 0, 1,
-1.108647, -0.6964989, -0.1325081, 1, 0.8862745, 0, 1,
-1.10845, -0.913657, -4.057937, 1, 0.8941177, 0, 1,
-1.106472, -0.6555478, -3.692199, 1, 0.8980392, 0, 1,
-1.105592, 0.251874, -2.141422, 1, 0.9058824, 0, 1,
-1.102355, 1.522048, 0.1734823, 1, 0.9137255, 0, 1,
-1.101746, -0.6065192, -3.127757, 1, 0.9176471, 0, 1,
-1.088873, 0.06110412, -2.63405, 1, 0.9254902, 0, 1,
-1.087, -0.2599911, -2.953821, 1, 0.9294118, 0, 1,
-1.084343, -2.439392, -1.520186, 1, 0.9372549, 0, 1,
-1.083229, -0.7802395, -1.840142, 1, 0.9411765, 0, 1,
-1.07821, 0.3749893, -1.770529, 1, 0.9490196, 0, 1,
-1.077633, -0.6569859, -2.849056, 1, 0.9529412, 0, 1,
-1.074474, -0.2806337, -1.99814, 1, 0.9607843, 0, 1,
-1.074337, -0.9580636, -3.593831, 1, 0.9647059, 0, 1,
-1.073877, -0.676764, -4.223785, 1, 0.972549, 0, 1,
-1.064255, 0.1061888, -2.302363, 1, 0.9764706, 0, 1,
-1.060404, -0.8555816, -3.214188, 1, 0.9843137, 0, 1,
-1.058465, -1.577579, -2.563584, 1, 0.9882353, 0, 1,
-1.052787, 1.02571, -1.835404, 1, 0.9960784, 0, 1,
-1.050062, 1.41883, -0.809865, 0.9960784, 1, 0, 1,
-1.047405, -1.430279, -1.14787, 0.9921569, 1, 0, 1,
-1.042875, 0.2048408, -0.5424148, 0.9843137, 1, 0, 1,
-1.04071, 0.2243257, -0.4527367, 0.9803922, 1, 0, 1,
-1.034132, 0.6706216, -0.7040806, 0.972549, 1, 0, 1,
-1.029722, -0.3359097, -1.199831, 0.9686275, 1, 0, 1,
-1.028463, -0.8501284, -2.971299, 0.9607843, 1, 0, 1,
-1.025375, 0.8551567, -1.700513, 0.9568627, 1, 0, 1,
-1.021977, -0.1717229, -1.135879, 0.9490196, 1, 0, 1,
-1.01329, 0.3179079, -2.014386, 0.945098, 1, 0, 1,
-0.9943495, 0.8524759, -1.451627, 0.9372549, 1, 0, 1,
-0.9922611, 0.3630383, -1.139834, 0.9333333, 1, 0, 1,
-0.9880714, -0.6085356, -1.934337, 0.9254902, 1, 0, 1,
-0.9860064, 1.128756, 0.1602704, 0.9215686, 1, 0, 1,
-0.9858365, -1.028015, -2.357729, 0.9137255, 1, 0, 1,
-0.9772957, -0.3035288, -3.305171, 0.9098039, 1, 0, 1,
-0.9743178, -0.2851394, -1.826787, 0.9019608, 1, 0, 1,
-0.9711672, 0.8571427, -1.868899, 0.8941177, 1, 0, 1,
-0.9706099, 0.8472531, -1.507282, 0.8901961, 1, 0, 1,
-0.9702649, -0.6351871, -3.563318, 0.8823529, 1, 0, 1,
-0.9672732, -1.759733, -3.274208, 0.8784314, 1, 0, 1,
-0.9604344, -0.9187032, -2.884442, 0.8705882, 1, 0, 1,
-0.9574901, 0.4457725, -1.382952, 0.8666667, 1, 0, 1,
-0.9518684, 1.125408, -1.43523, 0.8588235, 1, 0, 1,
-0.9482129, 1.105079, -2.520149, 0.854902, 1, 0, 1,
-0.9449842, 0.5712707, -0.2364931, 0.8470588, 1, 0, 1,
-0.9396303, -0.5138137, -2.696461, 0.8431373, 1, 0, 1,
-0.9360706, -0.7346268, -1.747857, 0.8352941, 1, 0, 1,
-0.9340757, 0.7286027, -0.09978683, 0.8313726, 1, 0, 1,
-0.928106, 0.7148428, 0.3484818, 0.8235294, 1, 0, 1,
-0.9217216, -0.5079014, -2.682148, 0.8196079, 1, 0, 1,
-0.9206996, -0.3020054, -2.724612, 0.8117647, 1, 0, 1,
-0.9144754, -0.7189627, -1.324012, 0.8078431, 1, 0, 1,
-0.9064103, -0.7302617, -3.579697, 0.8, 1, 0, 1,
-0.8900539, 0.07970962, -0.3035764, 0.7921569, 1, 0, 1,
-0.8854846, -0.0182112, -3.186012, 0.7882353, 1, 0, 1,
-0.884963, -1.510224, -0.3899896, 0.7803922, 1, 0, 1,
-0.8795987, 0.4004859, -0.2579212, 0.7764706, 1, 0, 1,
-0.8753459, -1.840716, -2.741286, 0.7686275, 1, 0, 1,
-0.874093, 0.9187508, -0.9984925, 0.7647059, 1, 0, 1,
-0.8738335, 0.4327601, -1.283024, 0.7568628, 1, 0, 1,
-0.8713495, -0.2460834, -1.245588, 0.7529412, 1, 0, 1,
-0.8706206, 0.2602901, -2.139622, 0.7450981, 1, 0, 1,
-0.8687551, 1.226128, -0.3588649, 0.7411765, 1, 0, 1,
-0.8661203, -0.2781356, -2.595114, 0.7333333, 1, 0, 1,
-0.8548955, -1.467245, -3.452278, 0.7294118, 1, 0, 1,
-0.8497917, -1.068628, -2.758891, 0.7215686, 1, 0, 1,
-0.8481874, 1.388622, -0.6290586, 0.7176471, 1, 0, 1,
-0.8183873, 0.1824094, -3.44928, 0.7098039, 1, 0, 1,
-0.8163162, 2.421137, -0.9779847, 0.7058824, 1, 0, 1,
-0.8069476, 0.3596435, -3.429683, 0.6980392, 1, 0, 1,
-0.8057947, 0.4908713, -1.12448, 0.6901961, 1, 0, 1,
-0.8030814, -0.06017738, -0.7420241, 0.6862745, 1, 0, 1,
-0.7995257, -1.786075, -3.845495, 0.6784314, 1, 0, 1,
-0.7989725, -0.5438567, -2.059004, 0.6745098, 1, 0, 1,
-0.7960018, 0.7739671, -1.456249, 0.6666667, 1, 0, 1,
-0.7938139, 0.3447747, -0.9129168, 0.6627451, 1, 0, 1,
-0.7907376, 0.9063198, 1.020838, 0.654902, 1, 0, 1,
-0.7907074, -0.1875786, -1.975979, 0.6509804, 1, 0, 1,
-0.7883677, -0.4453615, -0.7459918, 0.6431373, 1, 0, 1,
-0.7859899, 1.124006, -0.9890385, 0.6392157, 1, 0, 1,
-0.774658, 0.5518497, -0.7041804, 0.6313726, 1, 0, 1,
-0.7730257, 0.7515836, 1.398298, 0.627451, 1, 0, 1,
-0.7677578, -1.514949, -4.095272, 0.6196079, 1, 0, 1,
-0.7605582, 0.4856304, -1.069113, 0.6156863, 1, 0, 1,
-0.7576712, 0.1592117, -4.23336, 0.6078432, 1, 0, 1,
-0.7552476, -0.9864532, -3.388326, 0.6039216, 1, 0, 1,
-0.7535413, -0.7721263, -2.029322, 0.5960785, 1, 0, 1,
-0.7453826, 0.3288607, -0.3277968, 0.5882353, 1, 0, 1,
-0.744873, -0.32919, -0.9628857, 0.5843138, 1, 0, 1,
-0.7435595, -1.395481, -1.19501, 0.5764706, 1, 0, 1,
-0.7420522, 0.1594755, -2.096895, 0.572549, 1, 0, 1,
-0.7419078, -0.9343725, -2.494867, 0.5647059, 1, 0, 1,
-0.7361643, -0.211606, -4.177588, 0.5607843, 1, 0, 1,
-0.7321193, -0.1502908, 0.2094937, 0.5529412, 1, 0, 1,
-0.7265151, 0.8172563, -1.182966, 0.5490196, 1, 0, 1,
-0.7238027, 0.1223196, -2.270543, 0.5411765, 1, 0, 1,
-0.71207, -0.9215227, -3.208166, 0.5372549, 1, 0, 1,
-0.7112876, 1.031762, 0.4923688, 0.5294118, 1, 0, 1,
-0.7090378, 0.1957288, -0.71188, 0.5254902, 1, 0, 1,
-0.7025513, 0.3019225, -1.673633, 0.5176471, 1, 0, 1,
-0.6943716, -0.160445, -0.3790003, 0.5137255, 1, 0, 1,
-0.6937613, 1.308027, -1.289806, 0.5058824, 1, 0, 1,
-0.6915823, 2.011528, -0.5558164, 0.5019608, 1, 0, 1,
-0.6908581, 0.3271546, 0.1847636, 0.4941176, 1, 0, 1,
-0.689694, 1.136685, -0.04875744, 0.4862745, 1, 0, 1,
-0.685349, 0.2311576, -0.3935523, 0.4823529, 1, 0, 1,
-0.6838812, -0.01837227, -2.624319, 0.4745098, 1, 0, 1,
-0.6833663, -2.574377, -1.853868, 0.4705882, 1, 0, 1,
-0.6785672, -0.6516201, -3.208888, 0.4627451, 1, 0, 1,
-0.6766024, 1.853518, 0.09577753, 0.4588235, 1, 0, 1,
-0.6761937, 1.386915, -0.4750851, 0.4509804, 1, 0, 1,
-0.6730467, 0.8236054, -1.046426, 0.4470588, 1, 0, 1,
-0.6715384, -0.7500313, -4.895771, 0.4392157, 1, 0, 1,
-0.6646827, 0.05765335, -1.337459, 0.4352941, 1, 0, 1,
-0.6645406, 1.045578, -2.767345, 0.427451, 1, 0, 1,
-0.6628136, -1.178011, -2.733526, 0.4235294, 1, 0, 1,
-0.6620556, 1.0011, -1.269483, 0.4156863, 1, 0, 1,
-0.6589963, 0.4248258, -1.007463, 0.4117647, 1, 0, 1,
-0.6570278, -0.3229581, -1.026983, 0.4039216, 1, 0, 1,
-0.6565806, 0.7192558, -1.748319, 0.3960784, 1, 0, 1,
-0.6562826, 1.822883, 0.2952693, 0.3921569, 1, 0, 1,
-0.6454019, -0.5672219, -3.853717, 0.3843137, 1, 0, 1,
-0.643965, -0.05891835, -2.41627, 0.3803922, 1, 0, 1,
-0.628838, 2.286459, -1.422062, 0.372549, 1, 0, 1,
-0.6214124, -0.326109, -2.916818, 0.3686275, 1, 0, 1,
-0.618507, -0.1048293, -0.3540131, 0.3607843, 1, 0, 1,
-0.6147709, -0.1431011, -2.535308, 0.3568628, 1, 0, 1,
-0.6137991, 1.279054, -0.952127, 0.3490196, 1, 0, 1,
-0.6129629, -0.3758423, -1.901421, 0.345098, 1, 0, 1,
-0.6118481, -2.058861, -3.571961, 0.3372549, 1, 0, 1,
-0.6101348, 0.9940168, -0.3333941, 0.3333333, 1, 0, 1,
-0.6092692, 1.073426, -1.45298, 0.3254902, 1, 0, 1,
-0.6083279, 0.1650161, -1.535462, 0.3215686, 1, 0, 1,
-0.6050625, -0.9427214, -3.329379, 0.3137255, 1, 0, 1,
-0.5912785, 0.08717969, -2.652666, 0.3098039, 1, 0, 1,
-0.5898706, 0.3120394, -1.218644, 0.3019608, 1, 0, 1,
-0.5869926, -0.3773264, -0.3430985, 0.2941177, 1, 0, 1,
-0.5827032, 0.8305598, -0.5230342, 0.2901961, 1, 0, 1,
-0.5780374, -1.170058, -2.739392, 0.282353, 1, 0, 1,
-0.5771547, 0.3024033, -1.413664, 0.2784314, 1, 0, 1,
-0.5768471, -0.7083172, -2.407772, 0.2705882, 1, 0, 1,
-0.570903, 0.2485982, -2.537754, 0.2666667, 1, 0, 1,
-0.5699269, -0.1880335, -3.274236, 0.2588235, 1, 0, 1,
-0.5678045, 0.3495245, -0.6724454, 0.254902, 1, 0, 1,
-0.565307, 0.7228811, -0.5976055, 0.2470588, 1, 0, 1,
-0.5640163, 0.8630181, -2.019167, 0.2431373, 1, 0, 1,
-0.5627261, -0.4264995, -1.252734, 0.2352941, 1, 0, 1,
-0.5588097, 0.03086663, -0.7828201, 0.2313726, 1, 0, 1,
-0.5539002, 0.5575473, -1.590128, 0.2235294, 1, 0, 1,
-0.553592, 0.0007006571, -0.2409052, 0.2196078, 1, 0, 1,
-0.5517204, -0.01388769, -1.523986, 0.2117647, 1, 0, 1,
-0.5497925, -2.000296, -2.86774, 0.2078431, 1, 0, 1,
-0.5487621, -0.2674437, -3.00088, 0.2, 1, 0, 1,
-0.5375642, 1.800678, -0.1347955, 0.1921569, 1, 0, 1,
-0.5366423, -0.9489202, -2.747454, 0.1882353, 1, 0, 1,
-0.5366182, -1.109762, -2.485667, 0.1803922, 1, 0, 1,
-0.5363079, -0.300748, -2.207096, 0.1764706, 1, 0, 1,
-0.5342035, 2.31415, -0.5573066, 0.1686275, 1, 0, 1,
-0.5316405, 0.3209725, -0.4173596, 0.1647059, 1, 0, 1,
-0.527986, -0.2864434, -0.7034228, 0.1568628, 1, 0, 1,
-0.5277921, 0.372826, -0.9258753, 0.1529412, 1, 0, 1,
-0.5275725, -0.6639255, -1.269216, 0.145098, 1, 0, 1,
-0.5249575, 0.9813489, -0.9831152, 0.1411765, 1, 0, 1,
-0.5226291, -0.5390093, -2.654444, 0.1333333, 1, 0, 1,
-0.5160478, 1.681674, 0.0400032, 0.1294118, 1, 0, 1,
-0.514325, 1.118715, 0.7599758, 0.1215686, 1, 0, 1,
-0.4966874, -0.05297478, -2.867121, 0.1176471, 1, 0, 1,
-0.4961948, -0.5665525, -2.357564, 0.1098039, 1, 0, 1,
-0.4917185, 0.5237436, -2.412312, 0.1058824, 1, 0, 1,
-0.4892383, 1.448411, -0.178927, 0.09803922, 1, 0, 1,
-0.4877394, 0.1877716, 0.05580038, 0.09019608, 1, 0, 1,
-0.4874507, -0.2839849, -1.213905, 0.08627451, 1, 0, 1,
-0.4848594, -1.158331, -3.225051, 0.07843138, 1, 0, 1,
-0.4840948, -0.270666, -2.008082, 0.07450981, 1, 0, 1,
-0.4824265, 0.5984238, -1.002793, 0.06666667, 1, 0, 1,
-0.4816022, 0.6965542, -0.5271443, 0.0627451, 1, 0, 1,
-0.4812844, -0.4521581, -2.005547, 0.05490196, 1, 0, 1,
-0.4797319, -0.3833032, -2.626281, 0.05098039, 1, 0, 1,
-0.4749393, -0.194612, -0.4354971, 0.04313726, 1, 0, 1,
-0.4711546, 0.52982, -0.4266163, 0.03921569, 1, 0, 1,
-0.4704028, 0.1596942, -1.854066, 0.03137255, 1, 0, 1,
-0.4619756, -0.7612606, -3.155018, 0.02745098, 1, 0, 1,
-0.4616238, -0.0616417, -1.059136, 0.01960784, 1, 0, 1,
-0.4557129, 2.000912, 1.582404, 0.01568628, 1, 0, 1,
-0.4542405, -1.750666, -2.226012, 0.007843138, 1, 0, 1,
-0.4538903, 0.6302149, -0.1620315, 0.003921569, 1, 0, 1,
-0.4536095, 0.9182994, -0.09044861, 0, 1, 0.003921569, 1,
-0.4477417, -1.050676, -4.876023, 0, 1, 0.01176471, 1,
-0.4467802, 0.3741624, -2.537515, 0, 1, 0.01568628, 1,
-0.4434758, -0.7881095, -2.586172, 0, 1, 0.02352941, 1,
-0.4409686, 1.053648, -1.717327, 0, 1, 0.02745098, 1,
-0.4406507, 1.234079, -1.341356, 0, 1, 0.03529412, 1,
-0.4383403, 1.391718, 0.7178267, 0, 1, 0.03921569, 1,
-0.4373928, 1.062025, -0.6916557, 0, 1, 0.04705882, 1,
-0.4336171, -0.5005386, -1.646003, 0, 1, 0.05098039, 1,
-0.4326367, -0.42718, -2.593823, 0, 1, 0.05882353, 1,
-0.4258416, -1.439898, -4.174313, 0, 1, 0.0627451, 1,
-0.4255476, 1.3882, -0.8368835, 0, 1, 0.07058824, 1,
-0.4245938, -0.7434716, -4.358789, 0, 1, 0.07450981, 1,
-0.4244298, -0.1274086, -1.063021, 0, 1, 0.08235294, 1,
-0.4197462, -0.6241072, -2.006792, 0, 1, 0.08627451, 1,
-0.4153276, -0.04209463, -2.880068, 0, 1, 0.09411765, 1,
-0.4132941, 1.449137, -0.6685982, 0, 1, 0.1019608, 1,
-0.4102142, 1.677759, -0.3481561, 0, 1, 0.1058824, 1,
-0.4084589, 0.2862009, -1.980605, 0, 1, 0.1137255, 1,
-0.4071513, 0.3281399, -0.7341461, 0, 1, 0.1176471, 1,
-0.4057901, 1.101575, 0.483288, 0, 1, 0.1254902, 1,
-0.4035047, 0.624228, -0.1315377, 0, 1, 0.1294118, 1,
-0.4031066, -0.1202744, -1.418003, 0, 1, 0.1372549, 1,
-0.4012308, -0.7541966, -4.643044, 0, 1, 0.1411765, 1,
-0.3983639, -1.861775, -3.272134, 0, 1, 0.1490196, 1,
-0.3897143, 1.384503, -0.6910354, 0, 1, 0.1529412, 1,
-0.3881986, -0.2949115, -2.283989, 0, 1, 0.1607843, 1,
-0.382051, 0.3641986, 0.6632359, 0, 1, 0.1647059, 1,
-0.3819987, -0.5903001, -1.419913, 0, 1, 0.172549, 1,
-0.3782034, 0.9665701, -1.719207, 0, 1, 0.1764706, 1,
-0.3773758, -1.350074, -1.164555, 0, 1, 0.1843137, 1,
-0.3765322, -0.2897664, -2.985096, 0, 1, 0.1882353, 1,
-0.3668488, 0.8238035, 0.6869668, 0, 1, 0.1960784, 1,
-0.366389, -1.772287, -3.463806, 0, 1, 0.2039216, 1,
-0.3645559, -0.3638722, -2.734428, 0, 1, 0.2078431, 1,
-0.3612192, 1.010418, -1.192047, 0, 1, 0.2156863, 1,
-0.343789, -1.458982, -2.001491, 0, 1, 0.2196078, 1,
-0.3436233, 0.7986349, 0.1713858, 0, 1, 0.227451, 1,
-0.3430744, 0.4415252, -1.761339, 0, 1, 0.2313726, 1,
-0.3394816, -2.518045, -1.922044, 0, 1, 0.2392157, 1,
-0.3390055, 1.015504, 0.2421427, 0, 1, 0.2431373, 1,
-0.338483, 0.4318877, -0.6822863, 0, 1, 0.2509804, 1,
-0.3250671, 0.9384807, -0.113478, 0, 1, 0.254902, 1,
-0.3250643, 1.724736, 0.5427, 0, 1, 0.2627451, 1,
-0.3216098, -1.328949, -2.112314, 0, 1, 0.2666667, 1,
-0.3196132, 0.9437984, -1.33401, 0, 1, 0.2745098, 1,
-0.3194723, -0.6104532, -2.94848, 0, 1, 0.2784314, 1,
-0.3110254, -0.477556, -4.445108, 0, 1, 0.2862745, 1,
-0.3092414, 0.1195924, -1.381312, 0, 1, 0.2901961, 1,
-0.3048362, -0.4499155, -2.414315, 0, 1, 0.2980392, 1,
-0.3046107, -0.6348252, -3.382596, 0, 1, 0.3058824, 1,
-0.2996123, 0.5019844, -0.7656621, 0, 1, 0.3098039, 1,
-0.2994395, -0.5090213, -1.893535, 0, 1, 0.3176471, 1,
-0.2991349, -0.207279, -3.783773, 0, 1, 0.3215686, 1,
-0.298261, 0.9886584, -1.022094, 0, 1, 0.3294118, 1,
-0.2953944, 0.5095684, -0.4761904, 0, 1, 0.3333333, 1,
-0.2945452, 0.2252436, -2.757165, 0, 1, 0.3411765, 1,
-0.2939237, -1.337118, -2.878366, 0, 1, 0.345098, 1,
-0.2937788, -1.509551, -2.024592, 0, 1, 0.3529412, 1,
-0.287834, 0.3799105, -0.03900953, 0, 1, 0.3568628, 1,
-0.2868723, -0.3155421, -3.175653, 0, 1, 0.3647059, 1,
-0.2822567, -0.3594431, -1.32533, 0, 1, 0.3686275, 1,
-0.2805117, -0.746579, -1.608217, 0, 1, 0.3764706, 1,
-0.2707807, -0.9217985, -2.643069, 0, 1, 0.3803922, 1,
-0.2618224, -0.8270019, -3.051288, 0, 1, 0.3882353, 1,
-0.2615198, 1.311682, -1.882638, 0, 1, 0.3921569, 1,
-0.2591968, -0.4224674, -1.954235, 0, 1, 0.4, 1,
-0.2566249, -0.02405611, -1.485351, 0, 1, 0.4078431, 1,
-0.2566167, -0.9268205, -4.751915, 0, 1, 0.4117647, 1,
-0.2555287, 0.9814293, 2.053771, 0, 1, 0.4196078, 1,
-0.2544909, 0.8959693, -1.457641, 0, 1, 0.4235294, 1,
-0.249301, 0.4584331, -0.4746633, 0, 1, 0.4313726, 1,
-0.2492381, 0.4483249, -0.5187066, 0, 1, 0.4352941, 1,
-0.247832, -0.1702803, -1.86083, 0, 1, 0.4431373, 1,
-0.2472519, -1.06884, -3.321902, 0, 1, 0.4470588, 1,
-0.2468968, 1.626239, -0.5697697, 0, 1, 0.454902, 1,
-0.2467354, 0.2148953, -2.12257, 0, 1, 0.4588235, 1,
-0.2441418, -0.1983062, -3.283123, 0, 1, 0.4666667, 1,
-0.2428005, -1.848332, -3.041202, 0, 1, 0.4705882, 1,
-0.2424464, 0.2762779, 0.7625931, 0, 1, 0.4784314, 1,
-0.2417724, 1.125795, 0.394302, 0, 1, 0.4823529, 1,
-0.2330606, 0.9726445, 0.4083246, 0, 1, 0.4901961, 1,
-0.2255728, 0.6704978, 1.316016, 0, 1, 0.4941176, 1,
-0.2247064, 0.007630123, -1.931934, 0, 1, 0.5019608, 1,
-0.2211397, 0.6201007, 1.802675, 0, 1, 0.509804, 1,
-0.2180109, 0.04701149, -2.399796, 0, 1, 0.5137255, 1,
-0.2143685, -0.08560494, -1.639442, 0, 1, 0.5215687, 1,
-0.2135278, 0.7391524, -1.689286, 0, 1, 0.5254902, 1,
-0.2031933, 0.9131314, 1.848902, 0, 1, 0.5333334, 1,
-0.201956, 0.4946521, 0.5143366, 0, 1, 0.5372549, 1,
-0.1984478, 1.392098, 0.6718906, 0, 1, 0.5450981, 1,
-0.1944765, 0.0207386, -1.896127, 0, 1, 0.5490196, 1,
-0.1895833, 0.7425191, -0.4068004, 0, 1, 0.5568628, 1,
-0.1890462, 0.2543369, -3.983165, 0, 1, 0.5607843, 1,
-0.1870287, 0.4644009, 1.909853, 0, 1, 0.5686275, 1,
-0.1854428, -1.262749, -2.905145, 0, 1, 0.572549, 1,
-0.1852568, -0.08218232, -1.281299, 0, 1, 0.5803922, 1,
-0.1832863, 1.698017, 0.5720887, 0, 1, 0.5843138, 1,
-0.182796, -0.5658049, -4.03226, 0, 1, 0.5921569, 1,
-0.1826229, 0.2457041, -2.071537, 0, 1, 0.5960785, 1,
-0.1814109, -0.3302749, -2.626854, 0, 1, 0.6039216, 1,
-0.1810396, 0.7127628, 0.3176184, 0, 1, 0.6117647, 1,
-0.1773835, 0.1379157, -1.550126, 0, 1, 0.6156863, 1,
-0.1742292, 0.6339054, 0.3438977, 0, 1, 0.6235294, 1,
-0.1736799, -1.287375, -3.241827, 0, 1, 0.627451, 1,
-0.1731199, -0.6981896, -1.845204, 0, 1, 0.6352941, 1,
-0.1729273, 1.576386, 0.1321122, 0, 1, 0.6392157, 1,
-0.1712965, 0.4410084, 0.6530245, 0, 1, 0.6470588, 1,
-0.1593815, 0.5939903, 0.23898, 0, 1, 0.6509804, 1,
-0.1584297, -0.5456088, -2.255665, 0, 1, 0.6588235, 1,
-0.1577659, -1.249434, -4.691928, 0, 1, 0.6627451, 1,
-0.1488487, 0.1804832, 0.2272848, 0, 1, 0.6705883, 1,
-0.146491, -0.4902931, -2.720145, 0, 1, 0.6745098, 1,
-0.1459979, -0.1222554, -2.368443, 0, 1, 0.682353, 1,
-0.1385413, -0.4579732, -2.960802, 0, 1, 0.6862745, 1,
-0.1359394, 0.8129614, -0.2292755, 0, 1, 0.6941177, 1,
-0.1340741, -0.2009158, -2.102973, 0, 1, 0.7019608, 1,
-0.1301222, -0.9675039, -4.306058, 0, 1, 0.7058824, 1,
-0.1272548, -0.09223352, -2.419291, 0, 1, 0.7137255, 1,
-0.1268873, -1.270199, -2.0857, 0, 1, 0.7176471, 1,
-0.1267952, -0.2082975, -1.45741, 0, 1, 0.7254902, 1,
-0.1187173, 0.1631337, -1.200986, 0, 1, 0.7294118, 1,
-0.1181502, 0.02194474, -1.466977, 0, 1, 0.7372549, 1,
-0.1163488, -1.194124, -2.084433, 0, 1, 0.7411765, 1,
-0.115206, -3.247751, -3.995186, 0, 1, 0.7490196, 1,
-0.1132988, 2.950703, 0.7590759, 0, 1, 0.7529412, 1,
-0.1131026, -0.5649883, -1.92837, 0, 1, 0.7607843, 1,
-0.1087442, 0.04555526, -0.48549, 0, 1, 0.7647059, 1,
-0.1084745, -0.01162811, -2.327739, 0, 1, 0.772549, 1,
-0.1049534, 0.2020332, -0.7404716, 0, 1, 0.7764706, 1,
-0.09880321, 0.9669946, 0.1688515, 0, 1, 0.7843137, 1,
-0.09763063, -0.2450757, -3.123053, 0, 1, 0.7882353, 1,
-0.09274948, -0.1779596, -1.046535, 0, 1, 0.7960784, 1,
-0.08831624, 0.7758684, -0.3169836, 0, 1, 0.8039216, 1,
-0.08613067, -0.9309277, -2.935886, 0, 1, 0.8078431, 1,
-0.08381444, -0.9742191, -3.035091, 0, 1, 0.8156863, 1,
-0.08096893, 1.544415, 0.05000207, 0, 1, 0.8196079, 1,
-0.07808429, -0.9278779, -4.432766, 0, 1, 0.827451, 1,
-0.07434408, -0.1632899, -0.9412333, 0, 1, 0.8313726, 1,
-0.07035777, -0.04792366, -3.861186, 0, 1, 0.8392157, 1,
-0.06937192, -0.5084866, -3.764303, 0, 1, 0.8431373, 1,
-0.06906725, -2.097839, -2.897885, 0, 1, 0.8509804, 1,
-0.06371704, -0.0469791, -3.238789, 0, 1, 0.854902, 1,
-0.06364718, 0.738001, 0.4444249, 0, 1, 0.8627451, 1,
-0.06045636, -2.232773, -4.535741, 0, 1, 0.8666667, 1,
-0.05847096, 1.037501, -1.322359, 0, 1, 0.8745098, 1,
-0.05584535, 0.3076678, -0.3397891, 0, 1, 0.8784314, 1,
-0.05351513, 0.9361483, 0.3189324, 0, 1, 0.8862745, 1,
-0.05188437, 2.37491, 0.8231982, 0, 1, 0.8901961, 1,
-0.05024688, -1.265916, -3.02147, 0, 1, 0.8980392, 1,
-0.04897612, -0.5718905, -2.617705, 0, 1, 0.9058824, 1,
-0.04845006, 0.2190878, 0.6106794, 0, 1, 0.9098039, 1,
-0.03868908, -0.6088842, -2.471098, 0, 1, 0.9176471, 1,
-0.03617148, 0.5706769, 0.1653711, 0, 1, 0.9215686, 1,
-0.03345648, 0.7213687, 0.006353069, 0, 1, 0.9294118, 1,
-0.0277997, 1.081082, -0.4899131, 0, 1, 0.9333333, 1,
-0.02513918, -0.86593, -3.551625, 0, 1, 0.9411765, 1,
-0.0219817, 2.17153, -0.7438458, 0, 1, 0.945098, 1,
-0.01712084, 0.349083, -1.41809, 0, 1, 0.9529412, 1,
-0.01637973, -0.8087381, -2.280575, 0, 1, 0.9568627, 1,
-0.01177623, 0.003433571, -2.258033, 0, 1, 0.9647059, 1,
-0.007537426, -0.7943916, -3.670524, 0, 1, 0.9686275, 1,
-0.00702979, 0.6058746, -0.47684, 0, 1, 0.9764706, 1,
-0.004219109, 1.343633, -0.04429843, 0, 1, 0.9803922, 1,
-0.003464242, 0.1880516, 0.5663934, 0, 1, 0.9882353, 1,
0.0007911366, -0.6147212, 4.312303, 0, 1, 0.9921569, 1,
0.003040158, -0.9756025, 0.3428598, 0, 1, 1, 1,
0.00330336, -0.7910889, 1.604926, 0, 0.9921569, 1, 1,
0.00412388, 0.3483428, -0.3067115, 0, 0.9882353, 1, 1,
0.004255832, -0.6502885, 5.449625, 0, 0.9803922, 1, 1,
0.005715242, -0.5172305, 3.864713, 0, 0.9764706, 1, 1,
0.01346037, 0.01435717, 1.217529, 0, 0.9686275, 1, 1,
0.01917629, -1.572682, 2.464607, 0, 0.9647059, 1, 1,
0.02330014, 0.5357333, -1.596939, 0, 0.9568627, 1, 1,
0.02334777, 0.3738892, 0.5647216, 0, 0.9529412, 1, 1,
0.02853069, -0.9218609, 2.815662, 0, 0.945098, 1, 1,
0.03251107, 0.6588614, -1.510561, 0, 0.9411765, 1, 1,
0.03263959, -0.0561446, 4.878942, 0, 0.9333333, 1, 1,
0.03345587, 1.156453, 2.036865, 0, 0.9294118, 1, 1,
0.03412516, -0.2971242, 4.945682, 0, 0.9215686, 1, 1,
0.03934131, 1.165263, -1.842773, 0, 0.9176471, 1, 1,
0.04066956, -0.004547419, 2.04085, 0, 0.9098039, 1, 1,
0.04524019, -1.0975, 1.849934, 0, 0.9058824, 1, 1,
0.05241809, -0.6520823, 3.752431, 0, 0.8980392, 1, 1,
0.05530001, 0.245394, -1.275993, 0, 0.8901961, 1, 1,
0.05579232, 0.07563697, 0.8816428, 0, 0.8862745, 1, 1,
0.05694261, -0.6254233, 2.458575, 0, 0.8784314, 1, 1,
0.0578626, 2.308715, 1.342694, 0, 0.8745098, 1, 1,
0.06054773, -0.3596252, 3.381508, 0, 0.8666667, 1, 1,
0.06154257, -0.4339212, 4.079224, 0, 0.8627451, 1, 1,
0.06346592, 0.7199207, 0.6327961, 0, 0.854902, 1, 1,
0.06593139, -1.320717, 3.23456, 0, 0.8509804, 1, 1,
0.07055616, 0.405782, 0.1471209, 0, 0.8431373, 1, 1,
0.07269081, -0.1975275, 0.8575168, 0, 0.8392157, 1, 1,
0.07340476, -1.39195, 0.9028898, 0, 0.8313726, 1, 1,
0.07531606, 2.13183, -0.6351498, 0, 0.827451, 1, 1,
0.07561489, -0.6424422, 2.854695, 0, 0.8196079, 1, 1,
0.07857294, 1.317275, -0.3153279, 0, 0.8156863, 1, 1,
0.08030058, 1.60053, -0.02459223, 0, 0.8078431, 1, 1,
0.08387037, -0.819584, 3.322808, 0, 0.8039216, 1, 1,
0.0906973, 0.6553609, -1.447661, 0, 0.7960784, 1, 1,
0.09282976, -0.1527658, 1.689415, 0, 0.7882353, 1, 1,
0.09371679, -0.08676308, 3.662961, 0, 0.7843137, 1, 1,
0.0940486, 0.8255169, -0.7004269, 0, 0.7764706, 1, 1,
0.09485611, 0.1570975, 0.002244416, 0, 0.772549, 1, 1,
0.09977501, 0.9966983, -0.5070366, 0, 0.7647059, 1, 1,
0.105617, -1.621727, 2.305757, 0, 0.7607843, 1, 1,
0.1111762, 0.6531051, -2.36777, 0, 0.7529412, 1, 1,
0.1129095, -0.985122, 3.458516, 0, 0.7490196, 1, 1,
0.1146899, -0.0732746, -0.1747387, 0, 0.7411765, 1, 1,
0.1176181, 0.7800665, -0.6947066, 0, 0.7372549, 1, 1,
0.1203734, -0.05984884, 1.260255, 0, 0.7294118, 1, 1,
0.120758, -2.297575, 2.234401, 0, 0.7254902, 1, 1,
0.1210625, 1.645431, 0.2930585, 0, 0.7176471, 1, 1,
0.1212008, -0.3779344, 2.935293, 0, 0.7137255, 1, 1,
0.122508, 0.4518945, -1.546016, 0, 0.7058824, 1, 1,
0.125683, -1.877403, 2.937865, 0, 0.6980392, 1, 1,
0.1269835, 0.2245082, 2.025745, 0, 0.6941177, 1, 1,
0.1279254, 0.2549469, 0.8646578, 0, 0.6862745, 1, 1,
0.1308964, -0.1548357, 4.297912, 0, 0.682353, 1, 1,
0.1330587, -1.807995, 2.148687, 0, 0.6745098, 1, 1,
0.1332704, 0.3076321, 1.20613, 0, 0.6705883, 1, 1,
0.1338206, 1.014577, -0.1064495, 0, 0.6627451, 1, 1,
0.1360624, -0.1076279, 3.619984, 0, 0.6588235, 1, 1,
0.1385391, 1.236085, -1.074787, 0, 0.6509804, 1, 1,
0.1401819, -1.327941, 2.588321, 0, 0.6470588, 1, 1,
0.1409742, -0.1444961, 3.018987, 0, 0.6392157, 1, 1,
0.1419303, -2.172762, 3.457574, 0, 0.6352941, 1, 1,
0.1450132, 3.648837, 1.135189, 0, 0.627451, 1, 1,
0.1450351, -0.5498981, 2.444305, 0, 0.6235294, 1, 1,
0.1485076, 1.71112, 0.7622921, 0, 0.6156863, 1, 1,
0.1518543, -1.75447, 2.81004, 0, 0.6117647, 1, 1,
0.152842, -0.5880002, 3.731485, 0, 0.6039216, 1, 1,
0.1584365, 0.9214883, -1.237777, 0, 0.5960785, 1, 1,
0.1630253, 1.431405, -1.001762, 0, 0.5921569, 1, 1,
0.1681241, -0.2266942, 2.770742, 0, 0.5843138, 1, 1,
0.1684502, 0.3619859, -0.06695209, 0, 0.5803922, 1, 1,
0.1804402, -0.09158259, 3.989954, 0, 0.572549, 1, 1,
0.1804446, 0.7402591, -0.2686998, 0, 0.5686275, 1, 1,
0.1847415, -2.823184, 3.150168, 0, 0.5607843, 1, 1,
0.1887151, -0.6945174, 1.933585, 0, 0.5568628, 1, 1,
0.1971172, -1.905534, 5.598057, 0, 0.5490196, 1, 1,
0.1971256, -0.06917936, 1.546238, 0, 0.5450981, 1, 1,
0.1986231, -0.1718309, 3.555259, 0, 0.5372549, 1, 1,
0.2008967, -0.2328979, 3.089163, 0, 0.5333334, 1, 1,
0.2046101, 1.676748, -0.05672131, 0, 0.5254902, 1, 1,
0.206991, -0.7571227, 4.675137, 0, 0.5215687, 1, 1,
0.2079078, 0.3435246, -0.1059243, 0, 0.5137255, 1, 1,
0.20955, -0.4572887, 2.817033, 0, 0.509804, 1, 1,
0.2102579, 0.1844943, -0.3873618, 0, 0.5019608, 1, 1,
0.2113814, -0.4263821, 1.346665, 0, 0.4941176, 1, 1,
0.214066, 1.51923, 0.5965357, 0, 0.4901961, 1, 1,
0.21515, 0.2251529, 1.44986, 0, 0.4823529, 1, 1,
0.2154578, -1.190041, 2.405777, 0, 0.4784314, 1, 1,
0.2190053, -1.831682, 3.285768, 0, 0.4705882, 1, 1,
0.2195962, -0.4207701, 2.303588, 0, 0.4666667, 1, 1,
0.2214976, 0.9088807, 1.123878, 0, 0.4588235, 1, 1,
0.2247978, -0.4880001, 2.994839, 0, 0.454902, 1, 1,
0.227797, -1.219268, 3.56533, 0, 0.4470588, 1, 1,
0.2300837, 1.169254, 0.6698854, 0, 0.4431373, 1, 1,
0.232138, 1.4107, -0.1486706, 0, 0.4352941, 1, 1,
0.2326249, -0.5557668, 2.427543, 0, 0.4313726, 1, 1,
0.2335711, 0.8651562, 1.956485, 0, 0.4235294, 1, 1,
0.2383729, -1.199234, 3.865349, 0, 0.4196078, 1, 1,
0.2420935, -0.4412028, 2.29033, 0, 0.4117647, 1, 1,
0.2503239, -0.4149439, 3.969634, 0, 0.4078431, 1, 1,
0.2535217, -0.5016725, 3.92937, 0, 0.4, 1, 1,
0.2544203, 0.4947202, 0.1235785, 0, 0.3921569, 1, 1,
0.2546513, 1.910724, 1.60793, 0, 0.3882353, 1, 1,
0.2577912, -0.9964452, 3.143902, 0, 0.3803922, 1, 1,
0.2604798, -0.1906164, 3.261593, 0, 0.3764706, 1, 1,
0.2608646, 0.7872476, 1.395689, 0, 0.3686275, 1, 1,
0.261897, -0.9875754, 1.641796, 0, 0.3647059, 1, 1,
0.2626936, 0.9574758, -1.555075, 0, 0.3568628, 1, 1,
0.2629849, -0.09940252, 1.938089, 0, 0.3529412, 1, 1,
0.2659664, -0.6030298, 3.175376, 0, 0.345098, 1, 1,
0.2679388, -0.1036093, 0.6484999, 0, 0.3411765, 1, 1,
0.2684066, -1.012276, 3.493552, 0, 0.3333333, 1, 1,
0.2685858, 0.2347929, 0.9028949, 0, 0.3294118, 1, 1,
0.2704099, 1.484289, -0.9794632, 0, 0.3215686, 1, 1,
0.272957, -0.548093, 2.003038, 0, 0.3176471, 1, 1,
0.2729943, -0.9036956, 2.108973, 0, 0.3098039, 1, 1,
0.2735506, -0.6815358, 2.11535, 0, 0.3058824, 1, 1,
0.2746806, -0.03859341, 1.192852, 0, 0.2980392, 1, 1,
0.281946, 0.2295424, 0.8396672, 0, 0.2901961, 1, 1,
0.2835478, 0.2342778, 0.2353079, 0, 0.2862745, 1, 1,
0.2835662, 1.612619, -0.2537174, 0, 0.2784314, 1, 1,
0.2851456, -0.5911984, 2.725853, 0, 0.2745098, 1, 1,
0.2856498, 0.1594996, 0.3453485, 0, 0.2666667, 1, 1,
0.2924775, 1.517351, 0.3048608, 0, 0.2627451, 1, 1,
0.2946566, 0.1793518, -0.1090878, 0, 0.254902, 1, 1,
0.2973284, -0.4889709, 2.668362, 0, 0.2509804, 1, 1,
0.2985133, 0.482313, 1.017063, 0, 0.2431373, 1, 1,
0.2985855, -2.29889, 2.786021, 0, 0.2392157, 1, 1,
0.3046634, 1.286804, -1.54542, 0, 0.2313726, 1, 1,
0.3087032, 1.292158, -0.3856341, 0, 0.227451, 1, 1,
0.3094611, -1.512894, 2.751938, 0, 0.2196078, 1, 1,
0.3122693, -1.743795, 2.857731, 0, 0.2156863, 1, 1,
0.3122699, 1.411396, 0.7781979, 0, 0.2078431, 1, 1,
0.3177952, 1.119597, 0.4441457, 0, 0.2039216, 1, 1,
0.3201929, -0.1162234, 1.845916, 0, 0.1960784, 1, 1,
0.320614, -0.6705753, 1.841829, 0, 0.1882353, 1, 1,
0.3226751, -1.415258, 2.989939, 0, 0.1843137, 1, 1,
0.3227137, 1.940825, -1.327901, 0, 0.1764706, 1, 1,
0.3292761, -0.9683088, 3.899369, 0, 0.172549, 1, 1,
0.3301362, -0.382408, 3.31634, 0, 0.1647059, 1, 1,
0.3304707, -0.07507206, 1.009834, 0, 0.1607843, 1, 1,
0.3323987, -1.260536, 2.237448, 0, 0.1529412, 1, 1,
0.3353918, -0.2587398, 4.169861, 0, 0.1490196, 1, 1,
0.3359139, 1.351661, -0.7080423, 0, 0.1411765, 1, 1,
0.338187, -1.815345, 3.031464, 0, 0.1372549, 1, 1,
0.3438044, -1.061222, 2.622157, 0, 0.1294118, 1, 1,
0.3476296, 0.8893502, -1.037702, 0, 0.1254902, 1, 1,
0.3532803, -1.114597, 3.192711, 0, 0.1176471, 1, 1,
0.3566389, 0.2542259, -0.7774518, 0, 0.1137255, 1, 1,
0.3601417, -1.407437, 3.915167, 0, 0.1058824, 1, 1,
0.3618546, -0.5888338, 3.496169, 0, 0.09803922, 1, 1,
0.3687263, -0.5519516, 2.257088, 0, 0.09411765, 1, 1,
0.3689443, -0.3252581, 3.023375, 0, 0.08627451, 1, 1,
0.3698791, -0.07554534, 1.47004, 0, 0.08235294, 1, 1,
0.3716308, 0.2049943, 0.8150373, 0, 0.07450981, 1, 1,
0.3727099, -0.8141411, 3.182821, 0, 0.07058824, 1, 1,
0.3769178, 1.638969, -1.08482, 0, 0.0627451, 1, 1,
0.3796432, -0.5747847, 2.160357, 0, 0.05882353, 1, 1,
0.3803747, 0.9923589, 0.147049, 0, 0.05098039, 1, 1,
0.382386, 0.6772226, 1.812963, 0, 0.04705882, 1, 1,
0.3824614, -0.7881433, 4.039069, 0, 0.03921569, 1, 1,
0.3826141, 0.4873545, -0.2706226, 0, 0.03529412, 1, 1,
0.3845303, 0.4679356, 0.9833567, 0, 0.02745098, 1, 1,
0.3857827, 0.1328378, 1.658356, 0, 0.02352941, 1, 1,
0.3895904, 1.160033, -0.6456984, 0, 0.01568628, 1, 1,
0.3896808, 0.1119516, 0.1557488, 0, 0.01176471, 1, 1,
0.3906803, -0.6167796, 1.86789, 0, 0.003921569, 1, 1,
0.3917169, -0.3129132, 1.980413, 0.003921569, 0, 1, 1,
0.3954252, 1.443447, -0.1200047, 0.007843138, 0, 1, 1,
0.397072, 1.344527, -0.7654645, 0.01568628, 0, 1, 1,
0.397509, -0.03612702, 0.4147119, 0.01960784, 0, 1, 1,
0.4014311, 1.45447, -0.1369725, 0.02745098, 0, 1, 1,
0.4038907, 1.164324, -1.204829, 0.03137255, 0, 1, 1,
0.4113231, -1.067688, 2.6242, 0.03921569, 0, 1, 1,
0.414903, -1.170752, 0.9299396, 0.04313726, 0, 1, 1,
0.4178774, -1.922186, 5.161012, 0.05098039, 0, 1, 1,
0.4182122, -0.6114975, 4.622503, 0.05490196, 0, 1, 1,
0.4191705, 0.3488719, 0.1499425, 0.0627451, 0, 1, 1,
0.4290639, -0.09169104, 3.11476, 0.06666667, 0, 1, 1,
0.4324358, -0.4775538, 2.26711, 0.07450981, 0, 1, 1,
0.4394204, 1.056502, -1.198702, 0.07843138, 0, 1, 1,
0.4409944, -1.150661, 2.333613, 0.08627451, 0, 1, 1,
0.4477808, 0.04229408, -0.05011157, 0.09019608, 0, 1, 1,
0.44865, 1.454563, 0.866618, 0.09803922, 0, 1, 1,
0.4557846, 0.9627441, 0.0654761, 0.1058824, 0, 1, 1,
0.4559576, -0.3098671, 2.878262, 0.1098039, 0, 1, 1,
0.4561085, 0.01680169, 0.6795888, 0.1176471, 0, 1, 1,
0.4582735, 1.039529, -0.1908524, 0.1215686, 0, 1, 1,
0.4586467, 0.1175104, 1.598823, 0.1294118, 0, 1, 1,
0.4645417, 0.9697564, 0.5729792, 0.1333333, 0, 1, 1,
0.4674387, -1.254239, 3.145554, 0.1411765, 0, 1, 1,
0.468162, 0.1639111, 0.5657688, 0.145098, 0, 1, 1,
0.4682211, 0.7691355, 0.8413318, 0.1529412, 0, 1, 1,
0.4695009, 2.380048, 0.6577792, 0.1568628, 0, 1, 1,
0.4708513, 0.2852306, -1.129492, 0.1647059, 0, 1, 1,
0.4712227, -0.2624586, 2.996464, 0.1686275, 0, 1, 1,
0.4740357, 0.1965275, 2.174744, 0.1764706, 0, 1, 1,
0.4766054, -1.680425, 3.149976, 0.1803922, 0, 1, 1,
0.4804484, 1.04352, 0.2014384, 0.1882353, 0, 1, 1,
0.4813968, -0.4876708, 2.494635, 0.1921569, 0, 1, 1,
0.4824367, -0.3764019, 2.262738, 0.2, 0, 1, 1,
0.4880123, 0.1352778, 2.670246, 0.2078431, 0, 1, 1,
0.4910378, -1.809669, 4.06077, 0.2117647, 0, 1, 1,
0.4932545, 0.9307346, 1.189917, 0.2196078, 0, 1, 1,
0.4974636, -0.2371064, 1.664487, 0.2235294, 0, 1, 1,
0.4987977, -0.9801153, 2.370831, 0.2313726, 0, 1, 1,
0.5004347, -0.3981282, 3.138988, 0.2352941, 0, 1, 1,
0.5015878, 0.4850947, 0.9799917, 0.2431373, 0, 1, 1,
0.5057226, -0.8551773, 4.214148, 0.2470588, 0, 1, 1,
0.5057275, 1.709733, 1.029754, 0.254902, 0, 1, 1,
0.5124729, 0.9026111, 1.403676, 0.2588235, 0, 1, 1,
0.5136252, -2.936708, 3.933558, 0.2666667, 0, 1, 1,
0.5143997, -0.6756724, 3.172314, 0.2705882, 0, 1, 1,
0.5167836, 0.01205694, 1.197588, 0.2784314, 0, 1, 1,
0.5190781, 1.125633, 0.2391013, 0.282353, 0, 1, 1,
0.5191811, 0.005480371, 2.989111, 0.2901961, 0, 1, 1,
0.5267484, 0.2766963, 1.405906, 0.2941177, 0, 1, 1,
0.5312434, -0.3074016, 3.026026, 0.3019608, 0, 1, 1,
0.5380676, -0.3062788, 2.886594, 0.3098039, 0, 1, 1,
0.5384529, 0.515133, -0.3146971, 0.3137255, 0, 1, 1,
0.5391322, -0.6269821, 1.639741, 0.3215686, 0, 1, 1,
0.5407574, 1.450097, 0.9455942, 0.3254902, 0, 1, 1,
0.5492591, -0.5889701, 0.9475681, 0.3333333, 0, 1, 1,
0.5498447, -0.5769544, 2.85497, 0.3372549, 0, 1, 1,
0.5547802, 0.1388576, 1.624249, 0.345098, 0, 1, 1,
0.5555723, -0.409486, 1.630019, 0.3490196, 0, 1, 1,
0.5666769, 1.237005, 1.774008, 0.3568628, 0, 1, 1,
0.5676742, 0.1517176, -0.8473446, 0.3607843, 0, 1, 1,
0.5742238, 0.02707053, 0.8306289, 0.3686275, 0, 1, 1,
0.5756936, 0.6156637, 0.2792555, 0.372549, 0, 1, 1,
0.5873136, -3.002589, 2.644722, 0.3803922, 0, 1, 1,
0.5898926, 1.043033, 0.41136, 0.3843137, 0, 1, 1,
0.5909683, -1.056583, 1.51933, 0.3921569, 0, 1, 1,
0.5933197, -0.3328163, 1.465204, 0.3960784, 0, 1, 1,
0.5936743, -0.7218552, 1.987012, 0.4039216, 0, 1, 1,
0.5938926, 0.4222231, 0.4999627, 0.4117647, 0, 1, 1,
0.5952891, 0.3729609, 0.6063648, 0.4156863, 0, 1, 1,
0.6004397, 0.1191496, 2.314316, 0.4235294, 0, 1, 1,
0.615546, -0.4989783, 2.822286, 0.427451, 0, 1, 1,
0.6297254, 0.6649598, 0.4348429, 0.4352941, 0, 1, 1,
0.6319681, 0.3366149, 1.629956, 0.4392157, 0, 1, 1,
0.6346778, -2.354019, 0.1338937, 0.4470588, 0, 1, 1,
0.6354005, 1.030972, -0.9202658, 0.4509804, 0, 1, 1,
0.6426238, 0.7012792, 1.156688, 0.4588235, 0, 1, 1,
0.6426699, 1.292978, 0.07862171, 0.4627451, 0, 1, 1,
0.6444126, -0.1762182, 1.012528, 0.4705882, 0, 1, 1,
0.6568433, 0.4575133, 0.1470579, 0.4745098, 0, 1, 1,
0.6579776, -1.427653, 3.465373, 0.4823529, 0, 1, 1,
0.6665465, -0.2187751, 2.028031, 0.4862745, 0, 1, 1,
0.6709753, -0.2943338, 2.09515, 0.4941176, 0, 1, 1,
0.6712464, 0.2504512, 1.926584, 0.5019608, 0, 1, 1,
0.6719196, 0.2184004, 1.569191, 0.5058824, 0, 1, 1,
0.6720552, 1.761646, 0.480056, 0.5137255, 0, 1, 1,
0.6720631, -0.3448234, 1.28871, 0.5176471, 0, 1, 1,
0.6731362, 0.8801517, 0.4919445, 0.5254902, 0, 1, 1,
0.6769677, 2.022325, -0.9630242, 0.5294118, 0, 1, 1,
0.6827014, -1.576207, 2.664633, 0.5372549, 0, 1, 1,
0.6828231, 0.6976137, 0.4092243, 0.5411765, 0, 1, 1,
0.6841291, -3.366459, 2.217876, 0.5490196, 0, 1, 1,
0.6856751, 0.2097551, 1.267725, 0.5529412, 0, 1, 1,
0.6935272, 0.03560396, 1.44006, 0.5607843, 0, 1, 1,
0.6945408, 0.4730838, 1.66428, 0.5647059, 0, 1, 1,
0.6967393, 1.216392, 0.4768059, 0.572549, 0, 1, 1,
0.6980887, -0.5823289, 1.691372, 0.5764706, 0, 1, 1,
0.7016602, 1.21635, 0.3700351, 0.5843138, 0, 1, 1,
0.7033749, -0.369047, 3.803503, 0.5882353, 0, 1, 1,
0.7104008, -2.210244, 2.656966, 0.5960785, 0, 1, 1,
0.7110882, -1.354082, 2.853566, 0.6039216, 0, 1, 1,
0.7142051, 1.050679, -0.01474198, 0.6078432, 0, 1, 1,
0.717085, -0.09876748, 1.901072, 0.6156863, 0, 1, 1,
0.7213154, -0.9589953, 3.739139, 0.6196079, 0, 1, 1,
0.7267129, -0.593504, 2.35501, 0.627451, 0, 1, 1,
0.7320276, -0.3999345, 1.315569, 0.6313726, 0, 1, 1,
0.7424977, 0.04931236, 1.752633, 0.6392157, 0, 1, 1,
0.7425938, -0.1440819, 0.1080778, 0.6431373, 0, 1, 1,
0.7530891, 0.8474599, 1.706837, 0.6509804, 0, 1, 1,
0.7596345, 0.931349, 1.841056, 0.654902, 0, 1, 1,
0.7596577, -1.803185, 2.776083, 0.6627451, 0, 1, 1,
0.7600743, -0.5143578, 1.562047, 0.6666667, 0, 1, 1,
0.7609945, -0.1616993, 2.56461, 0.6745098, 0, 1, 1,
0.7613462, -2.275309, 3.960567, 0.6784314, 0, 1, 1,
0.7614179, 0.09546008, 1.748499, 0.6862745, 0, 1, 1,
0.7620997, 1.847671, -0.1618629, 0.6901961, 0, 1, 1,
0.769403, -1.355644, 0.9423069, 0.6980392, 0, 1, 1,
0.7705797, -0.07695199, 1.537144, 0.7058824, 0, 1, 1,
0.7712569, 0.7054113, 1.396894, 0.7098039, 0, 1, 1,
0.7753125, -1.859638, 1.94071, 0.7176471, 0, 1, 1,
0.7763619, 0.09583049, 0.8635107, 0.7215686, 0, 1, 1,
0.777254, -0.2385123, 3.062453, 0.7294118, 0, 1, 1,
0.7777797, 1.567889, 0.9903548, 0.7333333, 0, 1, 1,
0.782729, 0.8319548, 0.7293705, 0.7411765, 0, 1, 1,
0.7834712, 0.1017798, 1.371669, 0.7450981, 0, 1, 1,
0.7858354, -0.3542642, -0.2605659, 0.7529412, 0, 1, 1,
0.7877292, -0.4358799, 1.834184, 0.7568628, 0, 1, 1,
0.7914362, 0.5391887, 0.2409364, 0.7647059, 0, 1, 1,
0.793445, -0.2268371, 0.1865168, 0.7686275, 0, 1, 1,
0.7942317, 0.904048, 0.05664452, 0.7764706, 0, 1, 1,
0.7942732, 0.8544611, 0.8833649, 0.7803922, 0, 1, 1,
0.7944523, 0.6102226, 1.306059, 0.7882353, 0, 1, 1,
0.7966848, 0.09071345, 2.006466, 0.7921569, 0, 1, 1,
0.812097, -1.345862, 2.406241, 0.8, 0, 1, 1,
0.8130735, -0.9604992, 2.008625, 0.8078431, 0, 1, 1,
0.8163013, 1.00802, 1.745422, 0.8117647, 0, 1, 1,
0.8181162, 1.004184, 2.159377, 0.8196079, 0, 1, 1,
0.8182706, 0.268578, 1.103022, 0.8235294, 0, 1, 1,
0.8190219, -1.687039, 3.401181, 0.8313726, 0, 1, 1,
0.8268315, -0.9082941, 2.593857, 0.8352941, 0, 1, 1,
0.8295989, -1.735132, 3.972485, 0.8431373, 0, 1, 1,
0.8323028, -1.030181, 1.004932, 0.8470588, 0, 1, 1,
0.8342469, -0.4988509, 2.034516, 0.854902, 0, 1, 1,
0.8348953, 0.5674692, 1.39549, 0.8588235, 0, 1, 1,
0.8349383, -0.9397585, 3.538786, 0.8666667, 0, 1, 1,
0.8350514, 0.7011657, 0.8600379, 0.8705882, 0, 1, 1,
0.8385087, 1.044906, 1.192124, 0.8784314, 0, 1, 1,
0.8421036, -0.0258722, 1.680919, 0.8823529, 0, 1, 1,
0.8427058, 1.759261, 1.309663, 0.8901961, 0, 1, 1,
0.8483965, 1.874249, 0.6406173, 0.8941177, 0, 1, 1,
0.8503793, 1.606845, -0.9944748, 0.9019608, 0, 1, 1,
0.8511519, 0.2806406, 0.2972481, 0.9098039, 0, 1, 1,
0.8519545, 0.1023598, 2.11749, 0.9137255, 0, 1, 1,
0.8607422, 0.03655769, 1.722642, 0.9215686, 0, 1, 1,
0.8801585, -0.6718953, 3.580189, 0.9254902, 0, 1, 1,
0.8814947, -0.8424672, 2.056682, 0.9333333, 0, 1, 1,
0.8832251, -0.8907067, 3.195338, 0.9372549, 0, 1, 1,
0.8863562, -0.005064493, 1.005674, 0.945098, 0, 1, 1,
0.8866829, 0.1383166, 0.7835473, 0.9490196, 0, 1, 1,
0.892218, -1.479366, 3.090695, 0.9568627, 0, 1, 1,
0.8952172, -1.316554, 4.525774, 0.9607843, 0, 1, 1,
0.8987887, -1.117707, 2.415425, 0.9686275, 0, 1, 1,
0.8990291, 0.2674141, 2.249263, 0.972549, 0, 1, 1,
0.9014592, 0.2357455, 1.575891, 0.9803922, 0, 1, 1,
0.902988, -0.2711628, 2.451423, 0.9843137, 0, 1, 1,
0.9054631, -1.273697, 1.767818, 0.9921569, 0, 1, 1,
0.9118391, 0.2800083, 1.143177, 0.9960784, 0, 1, 1,
0.9172209, -0.6052409, 3.77698, 1, 0, 0.9960784, 1,
0.9269179, 0.8123874, -0.3120611, 1, 0, 0.9882353, 1,
0.927321, -0.3486475, 0.02473223, 1, 0, 0.9843137, 1,
0.9458572, -0.4899915, 2.558885, 1, 0, 0.9764706, 1,
0.9537878, -0.05955419, 1.824573, 1, 0, 0.972549, 1,
0.9576098, -2.066159, 3.358668, 1, 0, 0.9647059, 1,
0.9592752, -0.2377156, -0.2612966, 1, 0, 0.9607843, 1,
0.961507, -0.6371676, 2.755575, 1, 0, 0.9529412, 1,
0.9640867, 0.1511933, 0.8401692, 1, 0, 0.9490196, 1,
0.9702286, 0.5616853, 2.666643, 1, 0, 0.9411765, 1,
0.9703557, -0.6444548, 3.196187, 1, 0, 0.9372549, 1,
0.9788547, -1.603989, 2.849569, 1, 0, 0.9294118, 1,
0.9865285, -1.564346, 3.868942, 1, 0, 0.9254902, 1,
0.992276, 0.2344249, 2.082897, 1, 0, 0.9176471, 1,
0.9960253, -0.9473074, 2.445528, 1, 0, 0.9137255, 1,
1.00175, -2.09893, 3.73044, 1, 0, 0.9058824, 1,
1.005, 2.1478, -1.124003, 1, 0, 0.9019608, 1,
1.009081, 1.180481, -0.5307086, 1, 0, 0.8941177, 1,
1.01386, 0.10149, 0.5914553, 1, 0, 0.8862745, 1,
1.021802, 0.5943813, 1.036933, 1, 0, 0.8823529, 1,
1.028254, 0.4860691, 0.5422621, 1, 0, 0.8745098, 1,
1.028828, -0.8247396, 1.017087, 1, 0, 0.8705882, 1,
1.033051, 0.9259489, 0.6455788, 1, 0, 0.8627451, 1,
1.05322, -0.1869047, 1.161647, 1, 0, 0.8588235, 1,
1.056406, 2.281592, -0.1372649, 1, 0, 0.8509804, 1,
1.061846, -0.2267375, 1.046938, 1, 0, 0.8470588, 1,
1.068152, 1.346572, 1.631943, 1, 0, 0.8392157, 1,
1.076247, 1.734435, 1.517668, 1, 0, 0.8352941, 1,
1.078105, 3.921243, -0.05164309, 1, 0, 0.827451, 1,
1.093451, 0.8723631, 0.1594877, 1, 0, 0.8235294, 1,
1.100968, -0.3776293, 1.496333, 1, 0, 0.8156863, 1,
1.101878, 1.022157, 2.104695, 1, 0, 0.8117647, 1,
1.104111, 1.395718, 0.8324435, 1, 0, 0.8039216, 1,
1.104601, 0.3198795, 0.1999072, 1, 0, 0.7960784, 1,
1.108421, 0.7766749, -2.175722, 1, 0, 0.7921569, 1,
1.1091, 0.6659427, 2.718909, 1, 0, 0.7843137, 1,
1.113065, 0.1109742, 1.722778, 1, 0, 0.7803922, 1,
1.1231, -0.5249747, 2.412058, 1, 0, 0.772549, 1,
1.125829, 0.3445083, 3.010888, 1, 0, 0.7686275, 1,
1.126442, -0.01202177, 2.96174, 1, 0, 0.7607843, 1,
1.128684, 1.159365, 1.7439, 1, 0, 0.7568628, 1,
1.136798, 0.02651377, 1.740611, 1, 0, 0.7490196, 1,
1.143353, 1.681673, -0.06611094, 1, 0, 0.7450981, 1,
1.146325, 0.6865925, 0.2087196, 1, 0, 0.7372549, 1,
1.156361, -1.647786, 3.306826, 1, 0, 0.7333333, 1,
1.164476, -0.03599486, 1.865715, 1, 0, 0.7254902, 1,
1.176409, 0.6621676, -0.3351926, 1, 0, 0.7215686, 1,
1.183102, -1.012614, 2.002604, 1, 0, 0.7137255, 1,
1.202568, -0.2020818, 2.159086, 1, 0, 0.7098039, 1,
1.208371, 0.3836482, 2.655332, 1, 0, 0.7019608, 1,
1.208472, -1.382047, 2.164925, 1, 0, 0.6941177, 1,
1.209659, -0.06527207, 2.525127, 1, 0, 0.6901961, 1,
1.211024, -1.706541, 2.894578, 1, 0, 0.682353, 1,
1.211315, 0.5287901, 0.2065198, 1, 0, 0.6784314, 1,
1.212183, -0.4147792, 1.829563, 1, 0, 0.6705883, 1,
1.224794, 1.133731, 3.052473, 1, 0, 0.6666667, 1,
1.226465, 0.9672205, -0.01676468, 1, 0, 0.6588235, 1,
1.23437, 0.9871741, 0.8887486, 1, 0, 0.654902, 1,
1.234373, -0.1030185, 0.7750106, 1, 0, 0.6470588, 1,
1.235791, 0.544217, 2.013421, 1, 0, 0.6431373, 1,
1.242227, -0.8306177, 1.078604, 1, 0, 0.6352941, 1,
1.244162, -0.1889911, 0.6447737, 1, 0, 0.6313726, 1,
1.255377, -1.98896, 2.136187, 1, 0, 0.6235294, 1,
1.272542, -0.7510043, 1.601781, 1, 0, 0.6196079, 1,
1.272615, 0.3995501, 0.9693392, 1, 0, 0.6117647, 1,
1.278112, 1.582818, 1.705511, 1, 0, 0.6078432, 1,
1.278214, 0.5067448, 1.9935, 1, 0, 0.6, 1,
1.285896, -1.333728, 1.357774, 1, 0, 0.5921569, 1,
1.293685, 0.2832196, 1.504481, 1, 0, 0.5882353, 1,
1.295776, 0.5668811, 0.7437482, 1, 0, 0.5803922, 1,
1.296731, 1.582498, 0.8147165, 1, 0, 0.5764706, 1,
1.296945, 0.9149818, 0.5756969, 1, 0, 0.5686275, 1,
1.321241, -1.858061, 2.158676, 1, 0, 0.5647059, 1,
1.327131, -0.9325813, 1.924353, 1, 0, 0.5568628, 1,
1.328146, -0.1485688, 1.826622, 1, 0, 0.5529412, 1,
1.350044, -0.8769993, 2.088742, 1, 0, 0.5450981, 1,
1.35385, -1.876449, 3.18838, 1, 0, 0.5411765, 1,
1.36774, -0.2317074, 2.805808, 1, 0, 0.5333334, 1,
1.370241, 1.010545, -0.1678475, 1, 0, 0.5294118, 1,
1.370478, 0.2886351, 3.075207, 1, 0, 0.5215687, 1,
1.370772, -0.1975434, 1.30271, 1, 0, 0.5176471, 1,
1.388053, 0.3497364, 3.142577, 1, 0, 0.509804, 1,
1.393418, 2.53519, 0.3237775, 1, 0, 0.5058824, 1,
1.395916, 0.2929754, 2.19593, 1, 0, 0.4980392, 1,
1.39718, -0.4353093, 3.198697, 1, 0, 0.4901961, 1,
1.397969, 1.502639, 0.0274537, 1, 0, 0.4862745, 1,
1.402545, -1.210657, 1.62574, 1, 0, 0.4784314, 1,
1.442647, 0.1538107, 0.3005922, 1, 0, 0.4745098, 1,
1.450976, 0.754654, 1.833599, 1, 0, 0.4666667, 1,
1.478531, -0.07773396, 1.488841, 1, 0, 0.4627451, 1,
1.48057, -0.334497, 2.448729, 1, 0, 0.454902, 1,
1.482281, -2.331881, 1.939738, 1, 0, 0.4509804, 1,
1.48465, -1.406424, 3.72297, 1, 0, 0.4431373, 1,
1.485829, -0.2007459, 1.740488, 1, 0, 0.4392157, 1,
1.488246, -1.719711, 2.555078, 1, 0, 0.4313726, 1,
1.489741, 1.703668, -0.4198608, 1, 0, 0.427451, 1,
1.505465, 2.005358, 0.2107425, 1, 0, 0.4196078, 1,
1.50555, 0.3461902, 0.1619497, 1, 0, 0.4156863, 1,
1.511153, -0.6090809, 1.018412, 1, 0, 0.4078431, 1,
1.521919, 0.8820361, 2.481951, 1, 0, 0.4039216, 1,
1.541557, -0.5851813, 1.771249, 1, 0, 0.3960784, 1,
1.557034, 0.5310509, 2.738364, 1, 0, 0.3882353, 1,
1.560432, 1.372611, 1.987954, 1, 0, 0.3843137, 1,
1.57022, -1.127763, 2.751368, 1, 0, 0.3764706, 1,
1.571681, -1.206882, 2.992477, 1, 0, 0.372549, 1,
1.589641, 1.337718, -2.614049, 1, 0, 0.3647059, 1,
1.600017, -0.7154487, 2.687515, 1, 0, 0.3607843, 1,
1.604293, 1.536658, 1.076638, 1, 0, 0.3529412, 1,
1.610241, 0.8693013, 2.35097, 1, 0, 0.3490196, 1,
1.611571, -1.948524, 2.229491, 1, 0, 0.3411765, 1,
1.644587, -0.6523864, 2.231666, 1, 0, 0.3372549, 1,
1.645558, -0.04531818, 3.171629, 1, 0, 0.3294118, 1,
1.666925, -0.000755905, 1.829812, 1, 0, 0.3254902, 1,
1.671815, 0.066348, 1.060885, 1, 0, 0.3176471, 1,
1.672967, -1.639702, 3.723384, 1, 0, 0.3137255, 1,
1.683418, -0.7543785, 1.460296, 1, 0, 0.3058824, 1,
1.683953, -1.711077, 0.2798696, 1, 0, 0.2980392, 1,
1.690195, -0.285398, 2.91886, 1, 0, 0.2941177, 1,
1.716414, -0.3538262, 0.749575, 1, 0, 0.2862745, 1,
1.726419, -0.7340976, 1.751271, 1, 0, 0.282353, 1,
1.747371, 0.7170548, 1.457422, 1, 0, 0.2745098, 1,
1.766715, 0.8701882, 1.790678, 1, 0, 0.2705882, 1,
1.781909, 0.1304886, 3.174987, 1, 0, 0.2627451, 1,
1.782019, 0.4659463, 1.112809, 1, 0, 0.2588235, 1,
1.799529, -0.3887674, 2.085848, 1, 0, 0.2509804, 1,
1.830144, -0.6182774, 4.023996, 1, 0, 0.2470588, 1,
1.830994, -0.949612, 2.52115, 1, 0, 0.2392157, 1,
1.865398, -0.7251208, 0.3529058, 1, 0, 0.2352941, 1,
1.872174, 0.8168328, -0.5057392, 1, 0, 0.227451, 1,
1.876752, 0.06001941, 1.616189, 1, 0, 0.2235294, 1,
1.878115, -1.144241, 0.439175, 1, 0, 0.2156863, 1,
1.891152, 0.8247027, 2.073376, 1, 0, 0.2117647, 1,
1.912123, 1.54274, 1.0743, 1, 0, 0.2039216, 1,
1.913179, 1.980878, 0.9043481, 1, 0, 0.1960784, 1,
1.916101, 0.5787598, 0.2006142, 1, 0, 0.1921569, 1,
1.933314, -0.09133529, 1.430589, 1, 0, 0.1843137, 1,
1.970752, 2.099452, 1.050385, 1, 0, 0.1803922, 1,
1.971399, 1.312828, 0.2861075, 1, 0, 0.172549, 1,
1.98691, 0.2490262, 2.57023, 1, 0, 0.1686275, 1,
2.027555, -0.01142297, 1.636392, 1, 0, 0.1607843, 1,
2.027885, 0.8055655, 0.4808911, 1, 0, 0.1568628, 1,
2.079935, 0.4096842, 3.38918, 1, 0, 0.1490196, 1,
2.129327, -1.368739, 1.94289, 1, 0, 0.145098, 1,
2.139354, 0.5336916, 1.683523, 1, 0, 0.1372549, 1,
2.156407, -0.7550208, 3.077479, 1, 0, 0.1333333, 1,
2.157241, 0.8595304, 0.9578605, 1, 0, 0.1254902, 1,
2.198725, -0.04247033, 1.564425, 1, 0, 0.1215686, 1,
2.200633, 0.09198845, 0.6053407, 1, 0, 0.1137255, 1,
2.215513, -0.4656369, 0.9501228, 1, 0, 0.1098039, 1,
2.231035, 0.5048538, 1.554491, 1, 0, 0.1019608, 1,
2.246963, -1.194821, 2.087114, 1, 0, 0.09411765, 1,
2.24984, 1.523167, 0.7592894, 1, 0, 0.09019608, 1,
2.260368, -0.5030087, 1.517237, 1, 0, 0.08235294, 1,
2.337186, -1.313063, 0.3990321, 1, 0, 0.07843138, 1,
2.343761, -1.16225, 0.8360854, 1, 0, 0.07058824, 1,
2.362088, -1.19857, 1.549853, 1, 0, 0.06666667, 1,
2.377761, 1.113915, -0.5474385, 1, 0, 0.05882353, 1,
2.497126, -2.026543, 2.199639, 1, 0, 0.05490196, 1,
2.633452, 1.289316, 1.625597, 1, 0, 0.04705882, 1,
2.64376, -0.02288827, 0.9652462, 1, 0, 0.04313726, 1,
2.645487, 0.2567271, 0.5739499, 1, 0, 0.03529412, 1,
2.842127, 0.8748819, 1.134039, 1, 0, 0.03137255, 1,
2.857986, 1.013753, 0.6779377, 1, 0, 0.02352941, 1,
2.887456, -0.7477761, 0.8978875, 1, 0, 0.01960784, 1,
3.486293, 0.006785329, 2.465587, 1, 0, 0.01176471, 1,
3.621133, 0.3788889, 1.586653, 1, 0, 0.007843138, 1
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
0.06900239, -4.601725, -6.674475, 0, -0.5, 0.5, 0.5,
0.06900239, -4.601725, -6.674475, 1, -0.5, 0.5, 0.5,
0.06900239, -4.601725, -6.674475, 1, 1.5, 0.5, 0.5,
0.06900239, -4.601725, -6.674475, 0, 1.5, 0.5, 0.5
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
-4.6873, 0.277392, -6.674475, 0, -0.5, 0.5, 0.5,
-4.6873, 0.277392, -6.674475, 1, -0.5, 0.5, 0.5,
-4.6873, 0.277392, -6.674475, 1, 1.5, 0.5, 0.5,
-4.6873, 0.277392, -6.674475, 0, 1.5, 0.5, 0.5
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
-4.6873, -4.601725, 0.3511431, 0, -0.5, 0.5, 0.5,
-4.6873, -4.601725, 0.3511431, 1, -0.5, 0.5, 0.5,
-4.6873, -4.601725, 0.3511431, 1, 1.5, 0.5, 0.5,
-4.6873, -4.601725, 0.3511431, 0, 1.5, 0.5, 0.5
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
-2, -3.475775, -5.053178,
2, -3.475775, -5.053178,
-2, -3.475775, -5.053178,
-2, -3.663433, -5.323394,
0, -3.475775, -5.053178,
0, -3.663433, -5.323394,
2, -3.475775, -5.053178,
2, -3.663433, -5.323394
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
-2, -4.03875, -5.863827, 0, -0.5, 0.5, 0.5,
-2, -4.03875, -5.863827, 1, -0.5, 0.5, 0.5,
-2, -4.03875, -5.863827, 1, 1.5, 0.5, 0.5,
-2, -4.03875, -5.863827, 0, 1.5, 0.5, 0.5,
0, -4.03875, -5.863827, 0, -0.5, 0.5, 0.5,
0, -4.03875, -5.863827, 1, -0.5, 0.5, 0.5,
0, -4.03875, -5.863827, 1, 1.5, 0.5, 0.5,
0, -4.03875, -5.863827, 0, 1.5, 0.5, 0.5,
2, -4.03875, -5.863827, 0, -0.5, 0.5, 0.5,
2, -4.03875, -5.863827, 1, -0.5, 0.5, 0.5,
2, -4.03875, -5.863827, 1, 1.5, 0.5, 0.5,
2, -4.03875, -5.863827, 0, 1.5, 0.5, 0.5
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
-3.589692, -2, -5.053178,
-3.589692, 2, -5.053178,
-3.589692, -2, -5.053178,
-3.772627, -2, -5.323394,
-3.589692, 0, -5.053178,
-3.772627, 0, -5.323394,
-3.589692, 2, -5.053178,
-3.772627, 2, -5.323394
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
-4.138496, -2, -5.863827, 0, -0.5, 0.5, 0.5,
-4.138496, -2, -5.863827, 1, -0.5, 0.5, 0.5,
-4.138496, -2, -5.863827, 1, 1.5, 0.5, 0.5,
-4.138496, -2, -5.863827, 0, 1.5, 0.5, 0.5,
-4.138496, 0, -5.863827, 0, -0.5, 0.5, 0.5,
-4.138496, 0, -5.863827, 1, -0.5, 0.5, 0.5,
-4.138496, 0, -5.863827, 1, 1.5, 0.5, 0.5,
-4.138496, 0, -5.863827, 0, 1.5, 0.5, 0.5,
-4.138496, 2, -5.863827, 0, -0.5, 0.5, 0.5,
-4.138496, 2, -5.863827, 1, -0.5, 0.5, 0.5,
-4.138496, 2, -5.863827, 1, 1.5, 0.5, 0.5,
-4.138496, 2, -5.863827, 0, 1.5, 0.5, 0.5
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
-3.589692, -3.475775, -4,
-3.589692, -3.475775, 4,
-3.589692, -3.475775, -4,
-3.772627, -3.663433, -4,
-3.589692, -3.475775, -2,
-3.772627, -3.663433, -2,
-3.589692, -3.475775, 0,
-3.772627, -3.663433, 0,
-3.589692, -3.475775, 2,
-3.772627, -3.663433, 2,
-3.589692, -3.475775, 4,
-3.772627, -3.663433, 4
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
-4.138496, -4.03875, -4, 0, -0.5, 0.5, 0.5,
-4.138496, -4.03875, -4, 1, -0.5, 0.5, 0.5,
-4.138496, -4.03875, -4, 1, 1.5, 0.5, 0.5,
-4.138496, -4.03875, -4, 0, 1.5, 0.5, 0.5,
-4.138496, -4.03875, -2, 0, -0.5, 0.5, 0.5,
-4.138496, -4.03875, -2, 1, -0.5, 0.5, 0.5,
-4.138496, -4.03875, -2, 1, 1.5, 0.5, 0.5,
-4.138496, -4.03875, -2, 0, 1.5, 0.5, 0.5,
-4.138496, -4.03875, 0, 0, -0.5, 0.5, 0.5,
-4.138496, -4.03875, 0, 1, -0.5, 0.5, 0.5,
-4.138496, -4.03875, 0, 1, 1.5, 0.5, 0.5,
-4.138496, -4.03875, 0, 0, 1.5, 0.5, 0.5,
-4.138496, -4.03875, 2, 0, -0.5, 0.5, 0.5,
-4.138496, -4.03875, 2, 1, -0.5, 0.5, 0.5,
-4.138496, -4.03875, 2, 1, 1.5, 0.5, 0.5,
-4.138496, -4.03875, 2, 0, 1.5, 0.5, 0.5,
-4.138496, -4.03875, 4, 0, -0.5, 0.5, 0.5,
-4.138496, -4.03875, 4, 1, -0.5, 0.5, 0.5,
-4.138496, -4.03875, 4, 1, 1.5, 0.5, 0.5,
-4.138496, -4.03875, 4, 0, 1.5, 0.5, 0.5
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
-3.589692, -3.475775, -5.053178,
-3.589692, 4.030559, -5.053178,
-3.589692, -3.475775, 5.755465,
-3.589692, 4.030559, 5.755465,
-3.589692, -3.475775, -5.053178,
-3.589692, -3.475775, 5.755465,
-3.589692, 4.030559, -5.053178,
-3.589692, 4.030559, 5.755465,
-3.589692, -3.475775, -5.053178,
3.727697, -3.475775, -5.053178,
-3.589692, -3.475775, 5.755465,
3.727697, -3.475775, 5.755465,
-3.589692, 4.030559, -5.053178,
3.727697, 4.030559, -5.053178,
-3.589692, 4.030559, 5.755465,
3.727697, 4.030559, 5.755465,
3.727697, -3.475775, -5.053178,
3.727697, 4.030559, -5.053178,
3.727697, -3.475775, 5.755465,
3.727697, 4.030559, 5.755465,
3.727697, -3.475775, -5.053178,
3.727697, -3.475775, 5.755465,
3.727697, 4.030559, -5.053178,
3.727697, 4.030559, 5.755465
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
var radius = 8.040194;
var distance = 35.77173;
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
mvMatrix.translate( -0.06900239, -0.277392, -0.3511431 );
mvMatrix.scale( 1.188022, 1.158117, 0.8042837 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.77173);
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
fenaminosulf<-read.table("fenaminosulf.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenaminosulf$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenaminosulf' not found
```

```r
y<-fenaminosulf$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenaminosulf' not found
```

```r
z<-fenaminosulf$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenaminosulf' not found
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
-3.483128, -0.2594897, -0.9574422, 0, 0, 1, 1, 1,
-3.219276, 0.298043, 0.09091851, 1, 0, 0, 1, 1,
-3.21752, -1.4015, -3.105606, 1, 0, 0, 1, 1,
-2.958591, -1.525837, -3.673312, 1, 0, 0, 1, 1,
-2.863753, 0.3403167, -1.491593, 1, 0, 0, 1, 1,
-2.743513, -0.9498457, -2.036236, 1, 0, 0, 1, 1,
-2.585381, 0.3761295, -0.518046, 0, 0, 0, 1, 1,
-2.475966, 1.405935, -1.888226, 0, 0, 0, 1, 1,
-2.434367, -1.762459, -1.560438, 0, 0, 0, 1, 1,
-2.392519, 0.6408479, -0.2150588, 0, 0, 0, 1, 1,
-2.285686, -0.7023659, -1.70795, 0, 0, 0, 1, 1,
-2.275307, 0.2390235, 0.05654698, 0, 0, 0, 1, 1,
-2.148983, -0.6410334, -3.318291, 0, 0, 0, 1, 1,
-2.129778, 0.04905418, -2.702189, 1, 1, 1, 1, 1,
-2.125835, 3.131315, 0.05437532, 1, 1, 1, 1, 1,
-2.111226, -0.7824562, -1.770819, 1, 1, 1, 1, 1,
-2.052955, 0.9162816, -1.847037, 1, 1, 1, 1, 1,
-2.052177, -1.311196, -1.446771, 1, 1, 1, 1, 1,
-2.02918, 0.3746401, -3.028529, 1, 1, 1, 1, 1,
-2.017862, -0.6991931, -1.839365, 1, 1, 1, 1, 1,
-2.017412, 0.297406, -0.2745995, 1, 1, 1, 1, 1,
-1.965246, 0.4488567, -0.8073599, 1, 1, 1, 1, 1,
-1.924206, -0.274979, -2.402805, 1, 1, 1, 1, 1,
-1.910945, -1.415337, -0.9640114, 1, 1, 1, 1, 1,
-1.898079, -2.312855, -1.839937, 1, 1, 1, 1, 1,
-1.896777, 0.5313139, -1.466695, 1, 1, 1, 1, 1,
-1.89355, 0.301043, 0.222176, 1, 1, 1, 1, 1,
-1.869043, -1.331872, -2.840122, 1, 1, 1, 1, 1,
-1.842374, 2.499923, -2.101979, 0, 0, 1, 1, 1,
-1.834747, 1.216417, -1.360967, 1, 0, 0, 1, 1,
-1.832005, 1.197258, 0.1889601, 1, 0, 0, 1, 1,
-1.805983, 0.1039412, -3.377897, 1, 0, 0, 1, 1,
-1.792132, -0.5124994, -0.8895659, 1, 0, 0, 1, 1,
-1.756169, -0.619014, -2.090382, 1, 0, 0, 1, 1,
-1.716685, -0.412492, -1.910203, 0, 0, 0, 1, 1,
-1.713528, 0.1865758, -1.410869, 0, 0, 0, 1, 1,
-1.711541, 0.8290825, -1.375352, 0, 0, 0, 1, 1,
-1.704037, -0.3031354, -1.47259, 0, 0, 0, 1, 1,
-1.690583, -1.583522, -3.604804, 0, 0, 0, 1, 1,
-1.669961, 1.969276, -1.097202, 0, 0, 0, 1, 1,
-1.651639, 0.06647258, -0.9852776, 0, 0, 0, 1, 1,
-1.649816, 1.496265, -0.8855733, 1, 1, 1, 1, 1,
-1.6409, 1.916002, -0.7089655, 1, 1, 1, 1, 1,
-1.621469, -1.296974, -1.270214, 1, 1, 1, 1, 1,
-1.603961, 0.704277, -0.6159887, 1, 1, 1, 1, 1,
-1.579636, -0.4232369, -1.464833, 1, 1, 1, 1, 1,
-1.564378, -0.8996606, -0.9685379, 1, 1, 1, 1, 1,
-1.563074, 0.01942017, -3.88574, 1, 1, 1, 1, 1,
-1.554484, -1.679749, -0.9903446, 1, 1, 1, 1, 1,
-1.553301, -0.6680087, -1.696749, 1, 1, 1, 1, 1,
-1.544543, 0.4616822, -2.99569, 1, 1, 1, 1, 1,
-1.532565, -0.9820551, -2.4008, 1, 1, 1, 1, 1,
-1.530518, -0.9179032, -2.196476, 1, 1, 1, 1, 1,
-1.509822, 0.5245141, -0.6116546, 1, 1, 1, 1, 1,
-1.507045, -0.3466102, -2.436101, 1, 1, 1, 1, 1,
-1.498648, 2.429896, 0.7759095, 1, 1, 1, 1, 1,
-1.481499, 0.3990558, -1.828814, 0, 0, 1, 1, 1,
-1.477131, -0.8350244, -0.2885593, 1, 0, 0, 1, 1,
-1.467806, -0.1038176, -1.265229, 1, 0, 0, 1, 1,
-1.463659, 1.002294, -2.30776, 1, 0, 0, 1, 1,
-1.45968, 2.335835, -1.990082, 1, 0, 0, 1, 1,
-1.459612, 0.4774142, -1.17841, 1, 0, 0, 1, 1,
-1.457712, -0.1769365, -1.50647, 0, 0, 0, 1, 1,
-1.446324, -0.9883064, -3.459197, 0, 0, 0, 1, 1,
-1.435769, -0.7178634, -0.7555013, 0, 0, 0, 1, 1,
-1.418623, 0.113826, -1.23876, 0, 0, 0, 1, 1,
-1.41595, -0.5788453, -0.4691863, 0, 0, 0, 1, 1,
-1.415767, 0.5851793, -1.332957, 0, 0, 0, 1, 1,
-1.413105, -2.107211, -2.067547, 0, 0, 0, 1, 1,
-1.407728, 0.6914518, -1.411305, 1, 1, 1, 1, 1,
-1.403099, -0.5463173, -2.733092, 1, 1, 1, 1, 1,
-1.401923, 0.6096442, -1.266365, 1, 1, 1, 1, 1,
-1.400496, -0.3447102, -2.764481, 1, 1, 1, 1, 1,
-1.382665, -0.9458008, -3.356555, 1, 1, 1, 1, 1,
-1.381008, -1.706995, -4.831758, 1, 1, 1, 1, 1,
-1.379158, 0.6012336, -1.036427, 1, 1, 1, 1, 1,
-1.373941, -0.6353771, -3.103738, 1, 1, 1, 1, 1,
-1.37339, 0.2677475, -1.159101, 1, 1, 1, 1, 1,
-1.371243, 1.403245, -2.718688, 1, 1, 1, 1, 1,
-1.367003, -2.972095, -1.975609, 1, 1, 1, 1, 1,
-1.360743, 1.632804, 0.02442457, 1, 1, 1, 1, 1,
-1.359751, -1.001766, -2.423657, 1, 1, 1, 1, 1,
-1.357968, 0.2961801, -2.004888, 1, 1, 1, 1, 1,
-1.350536, 0.1433796, -0.7529882, 1, 1, 1, 1, 1,
-1.350458, -0.5333681, -0.7508683, 0, 0, 1, 1, 1,
-1.348741, -0.804123, -3.388586, 1, 0, 0, 1, 1,
-1.343944, 0.0300436, -0.1359693, 1, 0, 0, 1, 1,
-1.339206, 0.5849684, -1.693977, 1, 0, 0, 1, 1,
-1.325975, 0.5152869, -1.238069, 1, 0, 0, 1, 1,
-1.320043, 0.1317419, -0.06517249, 1, 0, 0, 1, 1,
-1.314839, 0.1944682, -1.68835, 0, 0, 0, 1, 1,
-1.299179, -0.8895774, -3.220901, 0, 0, 0, 1, 1,
-1.284072, 0.9813341, 0.4425539, 0, 0, 0, 1, 1,
-1.283878, 0.3786373, -1.373118, 0, 0, 0, 1, 1,
-1.277166, 0.01006113, -1.610841, 0, 0, 0, 1, 1,
-1.275049, -0.5250982, -1.924662, 0, 0, 0, 1, 1,
-1.27445, -0.3316079, -1.604419, 0, 0, 0, 1, 1,
-1.2699, -0.0001357528, -0.2197363, 1, 1, 1, 1, 1,
-1.262763, 0.7089891, -2.316583, 1, 1, 1, 1, 1,
-1.260295, -0.5726651, -0.2862253, 1, 1, 1, 1, 1,
-1.260142, 0.3441567, -3.15852, 1, 1, 1, 1, 1,
-1.248357, 1.411903, 0.05767556, 1, 1, 1, 1, 1,
-1.238221, -1.42622, -1.765726, 1, 1, 1, 1, 1,
-1.236013, -0.5098755, -1.2432, 1, 1, 1, 1, 1,
-1.228311, -0.6070667, -1.465369, 1, 1, 1, 1, 1,
-1.227983, 1.115321, -2.147319, 1, 1, 1, 1, 1,
-1.221239, -0.6987659, -0.3163964, 1, 1, 1, 1, 1,
-1.218898, -1.732524, -2.824941, 1, 1, 1, 1, 1,
-1.218137, 1.041582, 1.153599, 1, 1, 1, 1, 1,
-1.214059, 0.2059215, -0.7703168, 1, 1, 1, 1, 1,
-1.208387, 1.369902, -1.20275, 1, 1, 1, 1, 1,
-1.206291, -0.1542459, -0.2164656, 1, 1, 1, 1, 1,
-1.205976, 1.2567, 0.5425963, 0, 0, 1, 1, 1,
-1.202886, 0.8381016, -0.7924187, 1, 0, 0, 1, 1,
-1.196271, 0.5936279, -1.459217, 1, 0, 0, 1, 1,
-1.196113, 0.3662454, -1.506009, 1, 0, 0, 1, 1,
-1.191455, 0.3563731, -1.820485, 1, 0, 0, 1, 1,
-1.189603, 0.7307716, -0.3465344, 1, 0, 0, 1, 1,
-1.189438, -0.3705903, -2.378916, 0, 0, 0, 1, 1,
-1.188504, -0.5020909, -3.078728, 0, 0, 0, 1, 1,
-1.188127, 1.428083, -0.02163036, 0, 0, 0, 1, 1,
-1.184639, 0.3891807, -1.996928, 0, 0, 0, 1, 1,
-1.182251, -0.3385818, -1.118066, 0, 0, 0, 1, 1,
-1.178387, -1.285605, -2.219985, 0, 0, 0, 1, 1,
-1.175578, 0.2826238, -1.402851, 0, 0, 0, 1, 1,
-1.173127, -1.886952, -2.380729, 1, 1, 1, 1, 1,
-1.170151, 0.1065843, -1.991998, 1, 1, 1, 1, 1,
-1.166295, -1.833717, -2.433358, 1, 1, 1, 1, 1,
-1.161166, -1.729085, -0.8760992, 1, 1, 1, 1, 1,
-1.16014, -0.9323483, -1.9928, 1, 1, 1, 1, 1,
-1.159376, 0.04200575, -0.2860088, 1, 1, 1, 1, 1,
-1.157738, 0.340128, -2.665838, 1, 1, 1, 1, 1,
-1.157694, 0.5368996, -2.909245, 1, 1, 1, 1, 1,
-1.149126, -1.069676, -2.658048, 1, 1, 1, 1, 1,
-1.141923, 0.4526932, -0.9310809, 1, 1, 1, 1, 1,
-1.140166, -1.359831, -2.909376, 1, 1, 1, 1, 1,
-1.140035, 1.294969, 1.311634, 1, 1, 1, 1, 1,
-1.135583, 0.248447, -2.134167, 1, 1, 1, 1, 1,
-1.131948, 0.6471938, -1.756145, 1, 1, 1, 1, 1,
-1.130496, -0.4781083, -1.747415, 1, 1, 1, 1, 1,
-1.129286, -1.048104, -2.10016, 0, 0, 1, 1, 1,
-1.128541, -0.3745628, -2.883267, 1, 0, 0, 1, 1,
-1.122107, -0.09160517, -1.182838, 1, 0, 0, 1, 1,
-1.12104, 1.343295, -1.242931, 1, 0, 0, 1, 1,
-1.119583, -0.3735512, -1.206223, 1, 0, 0, 1, 1,
-1.112698, 0.9568436, -1.709643, 1, 0, 0, 1, 1,
-1.111469, 0.3769008, -0.2615266, 0, 0, 0, 1, 1,
-1.108734, -0.2359641, -1.240451, 0, 0, 0, 1, 1,
-1.108647, -0.6964989, -0.1325081, 0, 0, 0, 1, 1,
-1.10845, -0.913657, -4.057937, 0, 0, 0, 1, 1,
-1.106472, -0.6555478, -3.692199, 0, 0, 0, 1, 1,
-1.105592, 0.251874, -2.141422, 0, 0, 0, 1, 1,
-1.102355, 1.522048, 0.1734823, 0, 0, 0, 1, 1,
-1.101746, -0.6065192, -3.127757, 1, 1, 1, 1, 1,
-1.088873, 0.06110412, -2.63405, 1, 1, 1, 1, 1,
-1.087, -0.2599911, -2.953821, 1, 1, 1, 1, 1,
-1.084343, -2.439392, -1.520186, 1, 1, 1, 1, 1,
-1.083229, -0.7802395, -1.840142, 1, 1, 1, 1, 1,
-1.07821, 0.3749893, -1.770529, 1, 1, 1, 1, 1,
-1.077633, -0.6569859, -2.849056, 1, 1, 1, 1, 1,
-1.074474, -0.2806337, -1.99814, 1, 1, 1, 1, 1,
-1.074337, -0.9580636, -3.593831, 1, 1, 1, 1, 1,
-1.073877, -0.676764, -4.223785, 1, 1, 1, 1, 1,
-1.064255, 0.1061888, -2.302363, 1, 1, 1, 1, 1,
-1.060404, -0.8555816, -3.214188, 1, 1, 1, 1, 1,
-1.058465, -1.577579, -2.563584, 1, 1, 1, 1, 1,
-1.052787, 1.02571, -1.835404, 1, 1, 1, 1, 1,
-1.050062, 1.41883, -0.809865, 1, 1, 1, 1, 1,
-1.047405, -1.430279, -1.14787, 0, 0, 1, 1, 1,
-1.042875, 0.2048408, -0.5424148, 1, 0, 0, 1, 1,
-1.04071, 0.2243257, -0.4527367, 1, 0, 0, 1, 1,
-1.034132, 0.6706216, -0.7040806, 1, 0, 0, 1, 1,
-1.029722, -0.3359097, -1.199831, 1, 0, 0, 1, 1,
-1.028463, -0.8501284, -2.971299, 1, 0, 0, 1, 1,
-1.025375, 0.8551567, -1.700513, 0, 0, 0, 1, 1,
-1.021977, -0.1717229, -1.135879, 0, 0, 0, 1, 1,
-1.01329, 0.3179079, -2.014386, 0, 0, 0, 1, 1,
-0.9943495, 0.8524759, -1.451627, 0, 0, 0, 1, 1,
-0.9922611, 0.3630383, -1.139834, 0, 0, 0, 1, 1,
-0.9880714, -0.6085356, -1.934337, 0, 0, 0, 1, 1,
-0.9860064, 1.128756, 0.1602704, 0, 0, 0, 1, 1,
-0.9858365, -1.028015, -2.357729, 1, 1, 1, 1, 1,
-0.9772957, -0.3035288, -3.305171, 1, 1, 1, 1, 1,
-0.9743178, -0.2851394, -1.826787, 1, 1, 1, 1, 1,
-0.9711672, 0.8571427, -1.868899, 1, 1, 1, 1, 1,
-0.9706099, 0.8472531, -1.507282, 1, 1, 1, 1, 1,
-0.9702649, -0.6351871, -3.563318, 1, 1, 1, 1, 1,
-0.9672732, -1.759733, -3.274208, 1, 1, 1, 1, 1,
-0.9604344, -0.9187032, -2.884442, 1, 1, 1, 1, 1,
-0.9574901, 0.4457725, -1.382952, 1, 1, 1, 1, 1,
-0.9518684, 1.125408, -1.43523, 1, 1, 1, 1, 1,
-0.9482129, 1.105079, -2.520149, 1, 1, 1, 1, 1,
-0.9449842, 0.5712707, -0.2364931, 1, 1, 1, 1, 1,
-0.9396303, -0.5138137, -2.696461, 1, 1, 1, 1, 1,
-0.9360706, -0.7346268, -1.747857, 1, 1, 1, 1, 1,
-0.9340757, 0.7286027, -0.09978683, 1, 1, 1, 1, 1,
-0.928106, 0.7148428, 0.3484818, 0, 0, 1, 1, 1,
-0.9217216, -0.5079014, -2.682148, 1, 0, 0, 1, 1,
-0.9206996, -0.3020054, -2.724612, 1, 0, 0, 1, 1,
-0.9144754, -0.7189627, -1.324012, 1, 0, 0, 1, 1,
-0.9064103, -0.7302617, -3.579697, 1, 0, 0, 1, 1,
-0.8900539, 0.07970962, -0.3035764, 1, 0, 0, 1, 1,
-0.8854846, -0.0182112, -3.186012, 0, 0, 0, 1, 1,
-0.884963, -1.510224, -0.3899896, 0, 0, 0, 1, 1,
-0.8795987, 0.4004859, -0.2579212, 0, 0, 0, 1, 1,
-0.8753459, -1.840716, -2.741286, 0, 0, 0, 1, 1,
-0.874093, 0.9187508, -0.9984925, 0, 0, 0, 1, 1,
-0.8738335, 0.4327601, -1.283024, 0, 0, 0, 1, 1,
-0.8713495, -0.2460834, -1.245588, 0, 0, 0, 1, 1,
-0.8706206, 0.2602901, -2.139622, 1, 1, 1, 1, 1,
-0.8687551, 1.226128, -0.3588649, 1, 1, 1, 1, 1,
-0.8661203, -0.2781356, -2.595114, 1, 1, 1, 1, 1,
-0.8548955, -1.467245, -3.452278, 1, 1, 1, 1, 1,
-0.8497917, -1.068628, -2.758891, 1, 1, 1, 1, 1,
-0.8481874, 1.388622, -0.6290586, 1, 1, 1, 1, 1,
-0.8183873, 0.1824094, -3.44928, 1, 1, 1, 1, 1,
-0.8163162, 2.421137, -0.9779847, 1, 1, 1, 1, 1,
-0.8069476, 0.3596435, -3.429683, 1, 1, 1, 1, 1,
-0.8057947, 0.4908713, -1.12448, 1, 1, 1, 1, 1,
-0.8030814, -0.06017738, -0.7420241, 1, 1, 1, 1, 1,
-0.7995257, -1.786075, -3.845495, 1, 1, 1, 1, 1,
-0.7989725, -0.5438567, -2.059004, 1, 1, 1, 1, 1,
-0.7960018, 0.7739671, -1.456249, 1, 1, 1, 1, 1,
-0.7938139, 0.3447747, -0.9129168, 1, 1, 1, 1, 1,
-0.7907376, 0.9063198, 1.020838, 0, 0, 1, 1, 1,
-0.7907074, -0.1875786, -1.975979, 1, 0, 0, 1, 1,
-0.7883677, -0.4453615, -0.7459918, 1, 0, 0, 1, 1,
-0.7859899, 1.124006, -0.9890385, 1, 0, 0, 1, 1,
-0.774658, 0.5518497, -0.7041804, 1, 0, 0, 1, 1,
-0.7730257, 0.7515836, 1.398298, 1, 0, 0, 1, 1,
-0.7677578, -1.514949, -4.095272, 0, 0, 0, 1, 1,
-0.7605582, 0.4856304, -1.069113, 0, 0, 0, 1, 1,
-0.7576712, 0.1592117, -4.23336, 0, 0, 0, 1, 1,
-0.7552476, -0.9864532, -3.388326, 0, 0, 0, 1, 1,
-0.7535413, -0.7721263, -2.029322, 0, 0, 0, 1, 1,
-0.7453826, 0.3288607, -0.3277968, 0, 0, 0, 1, 1,
-0.744873, -0.32919, -0.9628857, 0, 0, 0, 1, 1,
-0.7435595, -1.395481, -1.19501, 1, 1, 1, 1, 1,
-0.7420522, 0.1594755, -2.096895, 1, 1, 1, 1, 1,
-0.7419078, -0.9343725, -2.494867, 1, 1, 1, 1, 1,
-0.7361643, -0.211606, -4.177588, 1, 1, 1, 1, 1,
-0.7321193, -0.1502908, 0.2094937, 1, 1, 1, 1, 1,
-0.7265151, 0.8172563, -1.182966, 1, 1, 1, 1, 1,
-0.7238027, 0.1223196, -2.270543, 1, 1, 1, 1, 1,
-0.71207, -0.9215227, -3.208166, 1, 1, 1, 1, 1,
-0.7112876, 1.031762, 0.4923688, 1, 1, 1, 1, 1,
-0.7090378, 0.1957288, -0.71188, 1, 1, 1, 1, 1,
-0.7025513, 0.3019225, -1.673633, 1, 1, 1, 1, 1,
-0.6943716, -0.160445, -0.3790003, 1, 1, 1, 1, 1,
-0.6937613, 1.308027, -1.289806, 1, 1, 1, 1, 1,
-0.6915823, 2.011528, -0.5558164, 1, 1, 1, 1, 1,
-0.6908581, 0.3271546, 0.1847636, 1, 1, 1, 1, 1,
-0.689694, 1.136685, -0.04875744, 0, 0, 1, 1, 1,
-0.685349, 0.2311576, -0.3935523, 1, 0, 0, 1, 1,
-0.6838812, -0.01837227, -2.624319, 1, 0, 0, 1, 1,
-0.6833663, -2.574377, -1.853868, 1, 0, 0, 1, 1,
-0.6785672, -0.6516201, -3.208888, 1, 0, 0, 1, 1,
-0.6766024, 1.853518, 0.09577753, 1, 0, 0, 1, 1,
-0.6761937, 1.386915, -0.4750851, 0, 0, 0, 1, 1,
-0.6730467, 0.8236054, -1.046426, 0, 0, 0, 1, 1,
-0.6715384, -0.7500313, -4.895771, 0, 0, 0, 1, 1,
-0.6646827, 0.05765335, -1.337459, 0, 0, 0, 1, 1,
-0.6645406, 1.045578, -2.767345, 0, 0, 0, 1, 1,
-0.6628136, -1.178011, -2.733526, 0, 0, 0, 1, 1,
-0.6620556, 1.0011, -1.269483, 0, 0, 0, 1, 1,
-0.6589963, 0.4248258, -1.007463, 1, 1, 1, 1, 1,
-0.6570278, -0.3229581, -1.026983, 1, 1, 1, 1, 1,
-0.6565806, 0.7192558, -1.748319, 1, 1, 1, 1, 1,
-0.6562826, 1.822883, 0.2952693, 1, 1, 1, 1, 1,
-0.6454019, -0.5672219, -3.853717, 1, 1, 1, 1, 1,
-0.643965, -0.05891835, -2.41627, 1, 1, 1, 1, 1,
-0.628838, 2.286459, -1.422062, 1, 1, 1, 1, 1,
-0.6214124, -0.326109, -2.916818, 1, 1, 1, 1, 1,
-0.618507, -0.1048293, -0.3540131, 1, 1, 1, 1, 1,
-0.6147709, -0.1431011, -2.535308, 1, 1, 1, 1, 1,
-0.6137991, 1.279054, -0.952127, 1, 1, 1, 1, 1,
-0.6129629, -0.3758423, -1.901421, 1, 1, 1, 1, 1,
-0.6118481, -2.058861, -3.571961, 1, 1, 1, 1, 1,
-0.6101348, 0.9940168, -0.3333941, 1, 1, 1, 1, 1,
-0.6092692, 1.073426, -1.45298, 1, 1, 1, 1, 1,
-0.6083279, 0.1650161, -1.535462, 0, 0, 1, 1, 1,
-0.6050625, -0.9427214, -3.329379, 1, 0, 0, 1, 1,
-0.5912785, 0.08717969, -2.652666, 1, 0, 0, 1, 1,
-0.5898706, 0.3120394, -1.218644, 1, 0, 0, 1, 1,
-0.5869926, -0.3773264, -0.3430985, 1, 0, 0, 1, 1,
-0.5827032, 0.8305598, -0.5230342, 1, 0, 0, 1, 1,
-0.5780374, -1.170058, -2.739392, 0, 0, 0, 1, 1,
-0.5771547, 0.3024033, -1.413664, 0, 0, 0, 1, 1,
-0.5768471, -0.7083172, -2.407772, 0, 0, 0, 1, 1,
-0.570903, 0.2485982, -2.537754, 0, 0, 0, 1, 1,
-0.5699269, -0.1880335, -3.274236, 0, 0, 0, 1, 1,
-0.5678045, 0.3495245, -0.6724454, 0, 0, 0, 1, 1,
-0.565307, 0.7228811, -0.5976055, 0, 0, 0, 1, 1,
-0.5640163, 0.8630181, -2.019167, 1, 1, 1, 1, 1,
-0.5627261, -0.4264995, -1.252734, 1, 1, 1, 1, 1,
-0.5588097, 0.03086663, -0.7828201, 1, 1, 1, 1, 1,
-0.5539002, 0.5575473, -1.590128, 1, 1, 1, 1, 1,
-0.553592, 0.0007006571, -0.2409052, 1, 1, 1, 1, 1,
-0.5517204, -0.01388769, -1.523986, 1, 1, 1, 1, 1,
-0.5497925, -2.000296, -2.86774, 1, 1, 1, 1, 1,
-0.5487621, -0.2674437, -3.00088, 1, 1, 1, 1, 1,
-0.5375642, 1.800678, -0.1347955, 1, 1, 1, 1, 1,
-0.5366423, -0.9489202, -2.747454, 1, 1, 1, 1, 1,
-0.5366182, -1.109762, -2.485667, 1, 1, 1, 1, 1,
-0.5363079, -0.300748, -2.207096, 1, 1, 1, 1, 1,
-0.5342035, 2.31415, -0.5573066, 1, 1, 1, 1, 1,
-0.5316405, 0.3209725, -0.4173596, 1, 1, 1, 1, 1,
-0.527986, -0.2864434, -0.7034228, 1, 1, 1, 1, 1,
-0.5277921, 0.372826, -0.9258753, 0, 0, 1, 1, 1,
-0.5275725, -0.6639255, -1.269216, 1, 0, 0, 1, 1,
-0.5249575, 0.9813489, -0.9831152, 1, 0, 0, 1, 1,
-0.5226291, -0.5390093, -2.654444, 1, 0, 0, 1, 1,
-0.5160478, 1.681674, 0.0400032, 1, 0, 0, 1, 1,
-0.514325, 1.118715, 0.7599758, 1, 0, 0, 1, 1,
-0.4966874, -0.05297478, -2.867121, 0, 0, 0, 1, 1,
-0.4961948, -0.5665525, -2.357564, 0, 0, 0, 1, 1,
-0.4917185, 0.5237436, -2.412312, 0, 0, 0, 1, 1,
-0.4892383, 1.448411, -0.178927, 0, 0, 0, 1, 1,
-0.4877394, 0.1877716, 0.05580038, 0, 0, 0, 1, 1,
-0.4874507, -0.2839849, -1.213905, 0, 0, 0, 1, 1,
-0.4848594, -1.158331, -3.225051, 0, 0, 0, 1, 1,
-0.4840948, -0.270666, -2.008082, 1, 1, 1, 1, 1,
-0.4824265, 0.5984238, -1.002793, 1, 1, 1, 1, 1,
-0.4816022, 0.6965542, -0.5271443, 1, 1, 1, 1, 1,
-0.4812844, -0.4521581, -2.005547, 1, 1, 1, 1, 1,
-0.4797319, -0.3833032, -2.626281, 1, 1, 1, 1, 1,
-0.4749393, -0.194612, -0.4354971, 1, 1, 1, 1, 1,
-0.4711546, 0.52982, -0.4266163, 1, 1, 1, 1, 1,
-0.4704028, 0.1596942, -1.854066, 1, 1, 1, 1, 1,
-0.4619756, -0.7612606, -3.155018, 1, 1, 1, 1, 1,
-0.4616238, -0.0616417, -1.059136, 1, 1, 1, 1, 1,
-0.4557129, 2.000912, 1.582404, 1, 1, 1, 1, 1,
-0.4542405, -1.750666, -2.226012, 1, 1, 1, 1, 1,
-0.4538903, 0.6302149, -0.1620315, 1, 1, 1, 1, 1,
-0.4536095, 0.9182994, -0.09044861, 1, 1, 1, 1, 1,
-0.4477417, -1.050676, -4.876023, 1, 1, 1, 1, 1,
-0.4467802, 0.3741624, -2.537515, 0, 0, 1, 1, 1,
-0.4434758, -0.7881095, -2.586172, 1, 0, 0, 1, 1,
-0.4409686, 1.053648, -1.717327, 1, 0, 0, 1, 1,
-0.4406507, 1.234079, -1.341356, 1, 0, 0, 1, 1,
-0.4383403, 1.391718, 0.7178267, 1, 0, 0, 1, 1,
-0.4373928, 1.062025, -0.6916557, 1, 0, 0, 1, 1,
-0.4336171, -0.5005386, -1.646003, 0, 0, 0, 1, 1,
-0.4326367, -0.42718, -2.593823, 0, 0, 0, 1, 1,
-0.4258416, -1.439898, -4.174313, 0, 0, 0, 1, 1,
-0.4255476, 1.3882, -0.8368835, 0, 0, 0, 1, 1,
-0.4245938, -0.7434716, -4.358789, 0, 0, 0, 1, 1,
-0.4244298, -0.1274086, -1.063021, 0, 0, 0, 1, 1,
-0.4197462, -0.6241072, -2.006792, 0, 0, 0, 1, 1,
-0.4153276, -0.04209463, -2.880068, 1, 1, 1, 1, 1,
-0.4132941, 1.449137, -0.6685982, 1, 1, 1, 1, 1,
-0.4102142, 1.677759, -0.3481561, 1, 1, 1, 1, 1,
-0.4084589, 0.2862009, -1.980605, 1, 1, 1, 1, 1,
-0.4071513, 0.3281399, -0.7341461, 1, 1, 1, 1, 1,
-0.4057901, 1.101575, 0.483288, 1, 1, 1, 1, 1,
-0.4035047, 0.624228, -0.1315377, 1, 1, 1, 1, 1,
-0.4031066, -0.1202744, -1.418003, 1, 1, 1, 1, 1,
-0.4012308, -0.7541966, -4.643044, 1, 1, 1, 1, 1,
-0.3983639, -1.861775, -3.272134, 1, 1, 1, 1, 1,
-0.3897143, 1.384503, -0.6910354, 1, 1, 1, 1, 1,
-0.3881986, -0.2949115, -2.283989, 1, 1, 1, 1, 1,
-0.382051, 0.3641986, 0.6632359, 1, 1, 1, 1, 1,
-0.3819987, -0.5903001, -1.419913, 1, 1, 1, 1, 1,
-0.3782034, 0.9665701, -1.719207, 1, 1, 1, 1, 1,
-0.3773758, -1.350074, -1.164555, 0, 0, 1, 1, 1,
-0.3765322, -0.2897664, -2.985096, 1, 0, 0, 1, 1,
-0.3668488, 0.8238035, 0.6869668, 1, 0, 0, 1, 1,
-0.366389, -1.772287, -3.463806, 1, 0, 0, 1, 1,
-0.3645559, -0.3638722, -2.734428, 1, 0, 0, 1, 1,
-0.3612192, 1.010418, -1.192047, 1, 0, 0, 1, 1,
-0.343789, -1.458982, -2.001491, 0, 0, 0, 1, 1,
-0.3436233, 0.7986349, 0.1713858, 0, 0, 0, 1, 1,
-0.3430744, 0.4415252, -1.761339, 0, 0, 0, 1, 1,
-0.3394816, -2.518045, -1.922044, 0, 0, 0, 1, 1,
-0.3390055, 1.015504, 0.2421427, 0, 0, 0, 1, 1,
-0.338483, 0.4318877, -0.6822863, 0, 0, 0, 1, 1,
-0.3250671, 0.9384807, -0.113478, 0, 0, 0, 1, 1,
-0.3250643, 1.724736, 0.5427, 1, 1, 1, 1, 1,
-0.3216098, -1.328949, -2.112314, 1, 1, 1, 1, 1,
-0.3196132, 0.9437984, -1.33401, 1, 1, 1, 1, 1,
-0.3194723, -0.6104532, -2.94848, 1, 1, 1, 1, 1,
-0.3110254, -0.477556, -4.445108, 1, 1, 1, 1, 1,
-0.3092414, 0.1195924, -1.381312, 1, 1, 1, 1, 1,
-0.3048362, -0.4499155, -2.414315, 1, 1, 1, 1, 1,
-0.3046107, -0.6348252, -3.382596, 1, 1, 1, 1, 1,
-0.2996123, 0.5019844, -0.7656621, 1, 1, 1, 1, 1,
-0.2994395, -0.5090213, -1.893535, 1, 1, 1, 1, 1,
-0.2991349, -0.207279, -3.783773, 1, 1, 1, 1, 1,
-0.298261, 0.9886584, -1.022094, 1, 1, 1, 1, 1,
-0.2953944, 0.5095684, -0.4761904, 1, 1, 1, 1, 1,
-0.2945452, 0.2252436, -2.757165, 1, 1, 1, 1, 1,
-0.2939237, -1.337118, -2.878366, 1, 1, 1, 1, 1,
-0.2937788, -1.509551, -2.024592, 0, 0, 1, 1, 1,
-0.287834, 0.3799105, -0.03900953, 1, 0, 0, 1, 1,
-0.2868723, -0.3155421, -3.175653, 1, 0, 0, 1, 1,
-0.2822567, -0.3594431, -1.32533, 1, 0, 0, 1, 1,
-0.2805117, -0.746579, -1.608217, 1, 0, 0, 1, 1,
-0.2707807, -0.9217985, -2.643069, 1, 0, 0, 1, 1,
-0.2618224, -0.8270019, -3.051288, 0, 0, 0, 1, 1,
-0.2615198, 1.311682, -1.882638, 0, 0, 0, 1, 1,
-0.2591968, -0.4224674, -1.954235, 0, 0, 0, 1, 1,
-0.2566249, -0.02405611, -1.485351, 0, 0, 0, 1, 1,
-0.2566167, -0.9268205, -4.751915, 0, 0, 0, 1, 1,
-0.2555287, 0.9814293, 2.053771, 0, 0, 0, 1, 1,
-0.2544909, 0.8959693, -1.457641, 0, 0, 0, 1, 1,
-0.249301, 0.4584331, -0.4746633, 1, 1, 1, 1, 1,
-0.2492381, 0.4483249, -0.5187066, 1, 1, 1, 1, 1,
-0.247832, -0.1702803, -1.86083, 1, 1, 1, 1, 1,
-0.2472519, -1.06884, -3.321902, 1, 1, 1, 1, 1,
-0.2468968, 1.626239, -0.5697697, 1, 1, 1, 1, 1,
-0.2467354, 0.2148953, -2.12257, 1, 1, 1, 1, 1,
-0.2441418, -0.1983062, -3.283123, 1, 1, 1, 1, 1,
-0.2428005, -1.848332, -3.041202, 1, 1, 1, 1, 1,
-0.2424464, 0.2762779, 0.7625931, 1, 1, 1, 1, 1,
-0.2417724, 1.125795, 0.394302, 1, 1, 1, 1, 1,
-0.2330606, 0.9726445, 0.4083246, 1, 1, 1, 1, 1,
-0.2255728, 0.6704978, 1.316016, 1, 1, 1, 1, 1,
-0.2247064, 0.007630123, -1.931934, 1, 1, 1, 1, 1,
-0.2211397, 0.6201007, 1.802675, 1, 1, 1, 1, 1,
-0.2180109, 0.04701149, -2.399796, 1, 1, 1, 1, 1,
-0.2143685, -0.08560494, -1.639442, 0, 0, 1, 1, 1,
-0.2135278, 0.7391524, -1.689286, 1, 0, 0, 1, 1,
-0.2031933, 0.9131314, 1.848902, 1, 0, 0, 1, 1,
-0.201956, 0.4946521, 0.5143366, 1, 0, 0, 1, 1,
-0.1984478, 1.392098, 0.6718906, 1, 0, 0, 1, 1,
-0.1944765, 0.0207386, -1.896127, 1, 0, 0, 1, 1,
-0.1895833, 0.7425191, -0.4068004, 0, 0, 0, 1, 1,
-0.1890462, 0.2543369, -3.983165, 0, 0, 0, 1, 1,
-0.1870287, 0.4644009, 1.909853, 0, 0, 0, 1, 1,
-0.1854428, -1.262749, -2.905145, 0, 0, 0, 1, 1,
-0.1852568, -0.08218232, -1.281299, 0, 0, 0, 1, 1,
-0.1832863, 1.698017, 0.5720887, 0, 0, 0, 1, 1,
-0.182796, -0.5658049, -4.03226, 0, 0, 0, 1, 1,
-0.1826229, 0.2457041, -2.071537, 1, 1, 1, 1, 1,
-0.1814109, -0.3302749, -2.626854, 1, 1, 1, 1, 1,
-0.1810396, 0.7127628, 0.3176184, 1, 1, 1, 1, 1,
-0.1773835, 0.1379157, -1.550126, 1, 1, 1, 1, 1,
-0.1742292, 0.6339054, 0.3438977, 1, 1, 1, 1, 1,
-0.1736799, -1.287375, -3.241827, 1, 1, 1, 1, 1,
-0.1731199, -0.6981896, -1.845204, 1, 1, 1, 1, 1,
-0.1729273, 1.576386, 0.1321122, 1, 1, 1, 1, 1,
-0.1712965, 0.4410084, 0.6530245, 1, 1, 1, 1, 1,
-0.1593815, 0.5939903, 0.23898, 1, 1, 1, 1, 1,
-0.1584297, -0.5456088, -2.255665, 1, 1, 1, 1, 1,
-0.1577659, -1.249434, -4.691928, 1, 1, 1, 1, 1,
-0.1488487, 0.1804832, 0.2272848, 1, 1, 1, 1, 1,
-0.146491, -0.4902931, -2.720145, 1, 1, 1, 1, 1,
-0.1459979, -0.1222554, -2.368443, 1, 1, 1, 1, 1,
-0.1385413, -0.4579732, -2.960802, 0, 0, 1, 1, 1,
-0.1359394, 0.8129614, -0.2292755, 1, 0, 0, 1, 1,
-0.1340741, -0.2009158, -2.102973, 1, 0, 0, 1, 1,
-0.1301222, -0.9675039, -4.306058, 1, 0, 0, 1, 1,
-0.1272548, -0.09223352, -2.419291, 1, 0, 0, 1, 1,
-0.1268873, -1.270199, -2.0857, 1, 0, 0, 1, 1,
-0.1267952, -0.2082975, -1.45741, 0, 0, 0, 1, 1,
-0.1187173, 0.1631337, -1.200986, 0, 0, 0, 1, 1,
-0.1181502, 0.02194474, -1.466977, 0, 0, 0, 1, 1,
-0.1163488, -1.194124, -2.084433, 0, 0, 0, 1, 1,
-0.115206, -3.247751, -3.995186, 0, 0, 0, 1, 1,
-0.1132988, 2.950703, 0.7590759, 0, 0, 0, 1, 1,
-0.1131026, -0.5649883, -1.92837, 0, 0, 0, 1, 1,
-0.1087442, 0.04555526, -0.48549, 1, 1, 1, 1, 1,
-0.1084745, -0.01162811, -2.327739, 1, 1, 1, 1, 1,
-0.1049534, 0.2020332, -0.7404716, 1, 1, 1, 1, 1,
-0.09880321, 0.9669946, 0.1688515, 1, 1, 1, 1, 1,
-0.09763063, -0.2450757, -3.123053, 1, 1, 1, 1, 1,
-0.09274948, -0.1779596, -1.046535, 1, 1, 1, 1, 1,
-0.08831624, 0.7758684, -0.3169836, 1, 1, 1, 1, 1,
-0.08613067, -0.9309277, -2.935886, 1, 1, 1, 1, 1,
-0.08381444, -0.9742191, -3.035091, 1, 1, 1, 1, 1,
-0.08096893, 1.544415, 0.05000207, 1, 1, 1, 1, 1,
-0.07808429, -0.9278779, -4.432766, 1, 1, 1, 1, 1,
-0.07434408, -0.1632899, -0.9412333, 1, 1, 1, 1, 1,
-0.07035777, -0.04792366, -3.861186, 1, 1, 1, 1, 1,
-0.06937192, -0.5084866, -3.764303, 1, 1, 1, 1, 1,
-0.06906725, -2.097839, -2.897885, 1, 1, 1, 1, 1,
-0.06371704, -0.0469791, -3.238789, 0, 0, 1, 1, 1,
-0.06364718, 0.738001, 0.4444249, 1, 0, 0, 1, 1,
-0.06045636, -2.232773, -4.535741, 1, 0, 0, 1, 1,
-0.05847096, 1.037501, -1.322359, 1, 0, 0, 1, 1,
-0.05584535, 0.3076678, -0.3397891, 1, 0, 0, 1, 1,
-0.05351513, 0.9361483, 0.3189324, 1, 0, 0, 1, 1,
-0.05188437, 2.37491, 0.8231982, 0, 0, 0, 1, 1,
-0.05024688, -1.265916, -3.02147, 0, 0, 0, 1, 1,
-0.04897612, -0.5718905, -2.617705, 0, 0, 0, 1, 1,
-0.04845006, 0.2190878, 0.6106794, 0, 0, 0, 1, 1,
-0.03868908, -0.6088842, -2.471098, 0, 0, 0, 1, 1,
-0.03617148, 0.5706769, 0.1653711, 0, 0, 0, 1, 1,
-0.03345648, 0.7213687, 0.006353069, 0, 0, 0, 1, 1,
-0.0277997, 1.081082, -0.4899131, 1, 1, 1, 1, 1,
-0.02513918, -0.86593, -3.551625, 1, 1, 1, 1, 1,
-0.0219817, 2.17153, -0.7438458, 1, 1, 1, 1, 1,
-0.01712084, 0.349083, -1.41809, 1, 1, 1, 1, 1,
-0.01637973, -0.8087381, -2.280575, 1, 1, 1, 1, 1,
-0.01177623, 0.003433571, -2.258033, 1, 1, 1, 1, 1,
-0.007537426, -0.7943916, -3.670524, 1, 1, 1, 1, 1,
-0.00702979, 0.6058746, -0.47684, 1, 1, 1, 1, 1,
-0.004219109, 1.343633, -0.04429843, 1, 1, 1, 1, 1,
-0.003464242, 0.1880516, 0.5663934, 1, 1, 1, 1, 1,
0.0007911366, -0.6147212, 4.312303, 1, 1, 1, 1, 1,
0.003040158, -0.9756025, 0.3428598, 1, 1, 1, 1, 1,
0.00330336, -0.7910889, 1.604926, 1, 1, 1, 1, 1,
0.00412388, 0.3483428, -0.3067115, 1, 1, 1, 1, 1,
0.004255832, -0.6502885, 5.449625, 1, 1, 1, 1, 1,
0.005715242, -0.5172305, 3.864713, 0, 0, 1, 1, 1,
0.01346037, 0.01435717, 1.217529, 1, 0, 0, 1, 1,
0.01917629, -1.572682, 2.464607, 1, 0, 0, 1, 1,
0.02330014, 0.5357333, -1.596939, 1, 0, 0, 1, 1,
0.02334777, 0.3738892, 0.5647216, 1, 0, 0, 1, 1,
0.02853069, -0.9218609, 2.815662, 1, 0, 0, 1, 1,
0.03251107, 0.6588614, -1.510561, 0, 0, 0, 1, 1,
0.03263959, -0.0561446, 4.878942, 0, 0, 0, 1, 1,
0.03345587, 1.156453, 2.036865, 0, 0, 0, 1, 1,
0.03412516, -0.2971242, 4.945682, 0, 0, 0, 1, 1,
0.03934131, 1.165263, -1.842773, 0, 0, 0, 1, 1,
0.04066956, -0.004547419, 2.04085, 0, 0, 0, 1, 1,
0.04524019, -1.0975, 1.849934, 0, 0, 0, 1, 1,
0.05241809, -0.6520823, 3.752431, 1, 1, 1, 1, 1,
0.05530001, 0.245394, -1.275993, 1, 1, 1, 1, 1,
0.05579232, 0.07563697, 0.8816428, 1, 1, 1, 1, 1,
0.05694261, -0.6254233, 2.458575, 1, 1, 1, 1, 1,
0.0578626, 2.308715, 1.342694, 1, 1, 1, 1, 1,
0.06054773, -0.3596252, 3.381508, 1, 1, 1, 1, 1,
0.06154257, -0.4339212, 4.079224, 1, 1, 1, 1, 1,
0.06346592, 0.7199207, 0.6327961, 1, 1, 1, 1, 1,
0.06593139, -1.320717, 3.23456, 1, 1, 1, 1, 1,
0.07055616, 0.405782, 0.1471209, 1, 1, 1, 1, 1,
0.07269081, -0.1975275, 0.8575168, 1, 1, 1, 1, 1,
0.07340476, -1.39195, 0.9028898, 1, 1, 1, 1, 1,
0.07531606, 2.13183, -0.6351498, 1, 1, 1, 1, 1,
0.07561489, -0.6424422, 2.854695, 1, 1, 1, 1, 1,
0.07857294, 1.317275, -0.3153279, 1, 1, 1, 1, 1,
0.08030058, 1.60053, -0.02459223, 0, 0, 1, 1, 1,
0.08387037, -0.819584, 3.322808, 1, 0, 0, 1, 1,
0.0906973, 0.6553609, -1.447661, 1, 0, 0, 1, 1,
0.09282976, -0.1527658, 1.689415, 1, 0, 0, 1, 1,
0.09371679, -0.08676308, 3.662961, 1, 0, 0, 1, 1,
0.0940486, 0.8255169, -0.7004269, 1, 0, 0, 1, 1,
0.09485611, 0.1570975, 0.002244416, 0, 0, 0, 1, 1,
0.09977501, 0.9966983, -0.5070366, 0, 0, 0, 1, 1,
0.105617, -1.621727, 2.305757, 0, 0, 0, 1, 1,
0.1111762, 0.6531051, -2.36777, 0, 0, 0, 1, 1,
0.1129095, -0.985122, 3.458516, 0, 0, 0, 1, 1,
0.1146899, -0.0732746, -0.1747387, 0, 0, 0, 1, 1,
0.1176181, 0.7800665, -0.6947066, 0, 0, 0, 1, 1,
0.1203734, -0.05984884, 1.260255, 1, 1, 1, 1, 1,
0.120758, -2.297575, 2.234401, 1, 1, 1, 1, 1,
0.1210625, 1.645431, 0.2930585, 1, 1, 1, 1, 1,
0.1212008, -0.3779344, 2.935293, 1, 1, 1, 1, 1,
0.122508, 0.4518945, -1.546016, 1, 1, 1, 1, 1,
0.125683, -1.877403, 2.937865, 1, 1, 1, 1, 1,
0.1269835, 0.2245082, 2.025745, 1, 1, 1, 1, 1,
0.1279254, 0.2549469, 0.8646578, 1, 1, 1, 1, 1,
0.1308964, -0.1548357, 4.297912, 1, 1, 1, 1, 1,
0.1330587, -1.807995, 2.148687, 1, 1, 1, 1, 1,
0.1332704, 0.3076321, 1.20613, 1, 1, 1, 1, 1,
0.1338206, 1.014577, -0.1064495, 1, 1, 1, 1, 1,
0.1360624, -0.1076279, 3.619984, 1, 1, 1, 1, 1,
0.1385391, 1.236085, -1.074787, 1, 1, 1, 1, 1,
0.1401819, -1.327941, 2.588321, 1, 1, 1, 1, 1,
0.1409742, -0.1444961, 3.018987, 0, 0, 1, 1, 1,
0.1419303, -2.172762, 3.457574, 1, 0, 0, 1, 1,
0.1450132, 3.648837, 1.135189, 1, 0, 0, 1, 1,
0.1450351, -0.5498981, 2.444305, 1, 0, 0, 1, 1,
0.1485076, 1.71112, 0.7622921, 1, 0, 0, 1, 1,
0.1518543, -1.75447, 2.81004, 1, 0, 0, 1, 1,
0.152842, -0.5880002, 3.731485, 0, 0, 0, 1, 1,
0.1584365, 0.9214883, -1.237777, 0, 0, 0, 1, 1,
0.1630253, 1.431405, -1.001762, 0, 0, 0, 1, 1,
0.1681241, -0.2266942, 2.770742, 0, 0, 0, 1, 1,
0.1684502, 0.3619859, -0.06695209, 0, 0, 0, 1, 1,
0.1804402, -0.09158259, 3.989954, 0, 0, 0, 1, 1,
0.1804446, 0.7402591, -0.2686998, 0, 0, 0, 1, 1,
0.1847415, -2.823184, 3.150168, 1, 1, 1, 1, 1,
0.1887151, -0.6945174, 1.933585, 1, 1, 1, 1, 1,
0.1971172, -1.905534, 5.598057, 1, 1, 1, 1, 1,
0.1971256, -0.06917936, 1.546238, 1, 1, 1, 1, 1,
0.1986231, -0.1718309, 3.555259, 1, 1, 1, 1, 1,
0.2008967, -0.2328979, 3.089163, 1, 1, 1, 1, 1,
0.2046101, 1.676748, -0.05672131, 1, 1, 1, 1, 1,
0.206991, -0.7571227, 4.675137, 1, 1, 1, 1, 1,
0.2079078, 0.3435246, -0.1059243, 1, 1, 1, 1, 1,
0.20955, -0.4572887, 2.817033, 1, 1, 1, 1, 1,
0.2102579, 0.1844943, -0.3873618, 1, 1, 1, 1, 1,
0.2113814, -0.4263821, 1.346665, 1, 1, 1, 1, 1,
0.214066, 1.51923, 0.5965357, 1, 1, 1, 1, 1,
0.21515, 0.2251529, 1.44986, 1, 1, 1, 1, 1,
0.2154578, -1.190041, 2.405777, 1, 1, 1, 1, 1,
0.2190053, -1.831682, 3.285768, 0, 0, 1, 1, 1,
0.2195962, -0.4207701, 2.303588, 1, 0, 0, 1, 1,
0.2214976, 0.9088807, 1.123878, 1, 0, 0, 1, 1,
0.2247978, -0.4880001, 2.994839, 1, 0, 0, 1, 1,
0.227797, -1.219268, 3.56533, 1, 0, 0, 1, 1,
0.2300837, 1.169254, 0.6698854, 1, 0, 0, 1, 1,
0.232138, 1.4107, -0.1486706, 0, 0, 0, 1, 1,
0.2326249, -0.5557668, 2.427543, 0, 0, 0, 1, 1,
0.2335711, 0.8651562, 1.956485, 0, 0, 0, 1, 1,
0.2383729, -1.199234, 3.865349, 0, 0, 0, 1, 1,
0.2420935, -0.4412028, 2.29033, 0, 0, 0, 1, 1,
0.2503239, -0.4149439, 3.969634, 0, 0, 0, 1, 1,
0.2535217, -0.5016725, 3.92937, 0, 0, 0, 1, 1,
0.2544203, 0.4947202, 0.1235785, 1, 1, 1, 1, 1,
0.2546513, 1.910724, 1.60793, 1, 1, 1, 1, 1,
0.2577912, -0.9964452, 3.143902, 1, 1, 1, 1, 1,
0.2604798, -0.1906164, 3.261593, 1, 1, 1, 1, 1,
0.2608646, 0.7872476, 1.395689, 1, 1, 1, 1, 1,
0.261897, -0.9875754, 1.641796, 1, 1, 1, 1, 1,
0.2626936, 0.9574758, -1.555075, 1, 1, 1, 1, 1,
0.2629849, -0.09940252, 1.938089, 1, 1, 1, 1, 1,
0.2659664, -0.6030298, 3.175376, 1, 1, 1, 1, 1,
0.2679388, -0.1036093, 0.6484999, 1, 1, 1, 1, 1,
0.2684066, -1.012276, 3.493552, 1, 1, 1, 1, 1,
0.2685858, 0.2347929, 0.9028949, 1, 1, 1, 1, 1,
0.2704099, 1.484289, -0.9794632, 1, 1, 1, 1, 1,
0.272957, -0.548093, 2.003038, 1, 1, 1, 1, 1,
0.2729943, -0.9036956, 2.108973, 1, 1, 1, 1, 1,
0.2735506, -0.6815358, 2.11535, 0, 0, 1, 1, 1,
0.2746806, -0.03859341, 1.192852, 1, 0, 0, 1, 1,
0.281946, 0.2295424, 0.8396672, 1, 0, 0, 1, 1,
0.2835478, 0.2342778, 0.2353079, 1, 0, 0, 1, 1,
0.2835662, 1.612619, -0.2537174, 1, 0, 0, 1, 1,
0.2851456, -0.5911984, 2.725853, 1, 0, 0, 1, 1,
0.2856498, 0.1594996, 0.3453485, 0, 0, 0, 1, 1,
0.2924775, 1.517351, 0.3048608, 0, 0, 0, 1, 1,
0.2946566, 0.1793518, -0.1090878, 0, 0, 0, 1, 1,
0.2973284, -0.4889709, 2.668362, 0, 0, 0, 1, 1,
0.2985133, 0.482313, 1.017063, 0, 0, 0, 1, 1,
0.2985855, -2.29889, 2.786021, 0, 0, 0, 1, 1,
0.3046634, 1.286804, -1.54542, 0, 0, 0, 1, 1,
0.3087032, 1.292158, -0.3856341, 1, 1, 1, 1, 1,
0.3094611, -1.512894, 2.751938, 1, 1, 1, 1, 1,
0.3122693, -1.743795, 2.857731, 1, 1, 1, 1, 1,
0.3122699, 1.411396, 0.7781979, 1, 1, 1, 1, 1,
0.3177952, 1.119597, 0.4441457, 1, 1, 1, 1, 1,
0.3201929, -0.1162234, 1.845916, 1, 1, 1, 1, 1,
0.320614, -0.6705753, 1.841829, 1, 1, 1, 1, 1,
0.3226751, -1.415258, 2.989939, 1, 1, 1, 1, 1,
0.3227137, 1.940825, -1.327901, 1, 1, 1, 1, 1,
0.3292761, -0.9683088, 3.899369, 1, 1, 1, 1, 1,
0.3301362, -0.382408, 3.31634, 1, 1, 1, 1, 1,
0.3304707, -0.07507206, 1.009834, 1, 1, 1, 1, 1,
0.3323987, -1.260536, 2.237448, 1, 1, 1, 1, 1,
0.3353918, -0.2587398, 4.169861, 1, 1, 1, 1, 1,
0.3359139, 1.351661, -0.7080423, 1, 1, 1, 1, 1,
0.338187, -1.815345, 3.031464, 0, 0, 1, 1, 1,
0.3438044, -1.061222, 2.622157, 1, 0, 0, 1, 1,
0.3476296, 0.8893502, -1.037702, 1, 0, 0, 1, 1,
0.3532803, -1.114597, 3.192711, 1, 0, 0, 1, 1,
0.3566389, 0.2542259, -0.7774518, 1, 0, 0, 1, 1,
0.3601417, -1.407437, 3.915167, 1, 0, 0, 1, 1,
0.3618546, -0.5888338, 3.496169, 0, 0, 0, 1, 1,
0.3687263, -0.5519516, 2.257088, 0, 0, 0, 1, 1,
0.3689443, -0.3252581, 3.023375, 0, 0, 0, 1, 1,
0.3698791, -0.07554534, 1.47004, 0, 0, 0, 1, 1,
0.3716308, 0.2049943, 0.8150373, 0, 0, 0, 1, 1,
0.3727099, -0.8141411, 3.182821, 0, 0, 0, 1, 1,
0.3769178, 1.638969, -1.08482, 0, 0, 0, 1, 1,
0.3796432, -0.5747847, 2.160357, 1, 1, 1, 1, 1,
0.3803747, 0.9923589, 0.147049, 1, 1, 1, 1, 1,
0.382386, 0.6772226, 1.812963, 1, 1, 1, 1, 1,
0.3824614, -0.7881433, 4.039069, 1, 1, 1, 1, 1,
0.3826141, 0.4873545, -0.2706226, 1, 1, 1, 1, 1,
0.3845303, 0.4679356, 0.9833567, 1, 1, 1, 1, 1,
0.3857827, 0.1328378, 1.658356, 1, 1, 1, 1, 1,
0.3895904, 1.160033, -0.6456984, 1, 1, 1, 1, 1,
0.3896808, 0.1119516, 0.1557488, 1, 1, 1, 1, 1,
0.3906803, -0.6167796, 1.86789, 1, 1, 1, 1, 1,
0.3917169, -0.3129132, 1.980413, 1, 1, 1, 1, 1,
0.3954252, 1.443447, -0.1200047, 1, 1, 1, 1, 1,
0.397072, 1.344527, -0.7654645, 1, 1, 1, 1, 1,
0.397509, -0.03612702, 0.4147119, 1, 1, 1, 1, 1,
0.4014311, 1.45447, -0.1369725, 1, 1, 1, 1, 1,
0.4038907, 1.164324, -1.204829, 0, 0, 1, 1, 1,
0.4113231, -1.067688, 2.6242, 1, 0, 0, 1, 1,
0.414903, -1.170752, 0.9299396, 1, 0, 0, 1, 1,
0.4178774, -1.922186, 5.161012, 1, 0, 0, 1, 1,
0.4182122, -0.6114975, 4.622503, 1, 0, 0, 1, 1,
0.4191705, 0.3488719, 0.1499425, 1, 0, 0, 1, 1,
0.4290639, -0.09169104, 3.11476, 0, 0, 0, 1, 1,
0.4324358, -0.4775538, 2.26711, 0, 0, 0, 1, 1,
0.4394204, 1.056502, -1.198702, 0, 0, 0, 1, 1,
0.4409944, -1.150661, 2.333613, 0, 0, 0, 1, 1,
0.4477808, 0.04229408, -0.05011157, 0, 0, 0, 1, 1,
0.44865, 1.454563, 0.866618, 0, 0, 0, 1, 1,
0.4557846, 0.9627441, 0.0654761, 0, 0, 0, 1, 1,
0.4559576, -0.3098671, 2.878262, 1, 1, 1, 1, 1,
0.4561085, 0.01680169, 0.6795888, 1, 1, 1, 1, 1,
0.4582735, 1.039529, -0.1908524, 1, 1, 1, 1, 1,
0.4586467, 0.1175104, 1.598823, 1, 1, 1, 1, 1,
0.4645417, 0.9697564, 0.5729792, 1, 1, 1, 1, 1,
0.4674387, -1.254239, 3.145554, 1, 1, 1, 1, 1,
0.468162, 0.1639111, 0.5657688, 1, 1, 1, 1, 1,
0.4682211, 0.7691355, 0.8413318, 1, 1, 1, 1, 1,
0.4695009, 2.380048, 0.6577792, 1, 1, 1, 1, 1,
0.4708513, 0.2852306, -1.129492, 1, 1, 1, 1, 1,
0.4712227, -0.2624586, 2.996464, 1, 1, 1, 1, 1,
0.4740357, 0.1965275, 2.174744, 1, 1, 1, 1, 1,
0.4766054, -1.680425, 3.149976, 1, 1, 1, 1, 1,
0.4804484, 1.04352, 0.2014384, 1, 1, 1, 1, 1,
0.4813968, -0.4876708, 2.494635, 1, 1, 1, 1, 1,
0.4824367, -0.3764019, 2.262738, 0, 0, 1, 1, 1,
0.4880123, 0.1352778, 2.670246, 1, 0, 0, 1, 1,
0.4910378, -1.809669, 4.06077, 1, 0, 0, 1, 1,
0.4932545, 0.9307346, 1.189917, 1, 0, 0, 1, 1,
0.4974636, -0.2371064, 1.664487, 1, 0, 0, 1, 1,
0.4987977, -0.9801153, 2.370831, 1, 0, 0, 1, 1,
0.5004347, -0.3981282, 3.138988, 0, 0, 0, 1, 1,
0.5015878, 0.4850947, 0.9799917, 0, 0, 0, 1, 1,
0.5057226, -0.8551773, 4.214148, 0, 0, 0, 1, 1,
0.5057275, 1.709733, 1.029754, 0, 0, 0, 1, 1,
0.5124729, 0.9026111, 1.403676, 0, 0, 0, 1, 1,
0.5136252, -2.936708, 3.933558, 0, 0, 0, 1, 1,
0.5143997, -0.6756724, 3.172314, 0, 0, 0, 1, 1,
0.5167836, 0.01205694, 1.197588, 1, 1, 1, 1, 1,
0.5190781, 1.125633, 0.2391013, 1, 1, 1, 1, 1,
0.5191811, 0.005480371, 2.989111, 1, 1, 1, 1, 1,
0.5267484, 0.2766963, 1.405906, 1, 1, 1, 1, 1,
0.5312434, -0.3074016, 3.026026, 1, 1, 1, 1, 1,
0.5380676, -0.3062788, 2.886594, 1, 1, 1, 1, 1,
0.5384529, 0.515133, -0.3146971, 1, 1, 1, 1, 1,
0.5391322, -0.6269821, 1.639741, 1, 1, 1, 1, 1,
0.5407574, 1.450097, 0.9455942, 1, 1, 1, 1, 1,
0.5492591, -0.5889701, 0.9475681, 1, 1, 1, 1, 1,
0.5498447, -0.5769544, 2.85497, 1, 1, 1, 1, 1,
0.5547802, 0.1388576, 1.624249, 1, 1, 1, 1, 1,
0.5555723, -0.409486, 1.630019, 1, 1, 1, 1, 1,
0.5666769, 1.237005, 1.774008, 1, 1, 1, 1, 1,
0.5676742, 0.1517176, -0.8473446, 1, 1, 1, 1, 1,
0.5742238, 0.02707053, 0.8306289, 0, 0, 1, 1, 1,
0.5756936, 0.6156637, 0.2792555, 1, 0, 0, 1, 1,
0.5873136, -3.002589, 2.644722, 1, 0, 0, 1, 1,
0.5898926, 1.043033, 0.41136, 1, 0, 0, 1, 1,
0.5909683, -1.056583, 1.51933, 1, 0, 0, 1, 1,
0.5933197, -0.3328163, 1.465204, 1, 0, 0, 1, 1,
0.5936743, -0.7218552, 1.987012, 0, 0, 0, 1, 1,
0.5938926, 0.4222231, 0.4999627, 0, 0, 0, 1, 1,
0.5952891, 0.3729609, 0.6063648, 0, 0, 0, 1, 1,
0.6004397, 0.1191496, 2.314316, 0, 0, 0, 1, 1,
0.615546, -0.4989783, 2.822286, 0, 0, 0, 1, 1,
0.6297254, 0.6649598, 0.4348429, 0, 0, 0, 1, 1,
0.6319681, 0.3366149, 1.629956, 0, 0, 0, 1, 1,
0.6346778, -2.354019, 0.1338937, 1, 1, 1, 1, 1,
0.6354005, 1.030972, -0.9202658, 1, 1, 1, 1, 1,
0.6426238, 0.7012792, 1.156688, 1, 1, 1, 1, 1,
0.6426699, 1.292978, 0.07862171, 1, 1, 1, 1, 1,
0.6444126, -0.1762182, 1.012528, 1, 1, 1, 1, 1,
0.6568433, 0.4575133, 0.1470579, 1, 1, 1, 1, 1,
0.6579776, -1.427653, 3.465373, 1, 1, 1, 1, 1,
0.6665465, -0.2187751, 2.028031, 1, 1, 1, 1, 1,
0.6709753, -0.2943338, 2.09515, 1, 1, 1, 1, 1,
0.6712464, 0.2504512, 1.926584, 1, 1, 1, 1, 1,
0.6719196, 0.2184004, 1.569191, 1, 1, 1, 1, 1,
0.6720552, 1.761646, 0.480056, 1, 1, 1, 1, 1,
0.6720631, -0.3448234, 1.28871, 1, 1, 1, 1, 1,
0.6731362, 0.8801517, 0.4919445, 1, 1, 1, 1, 1,
0.6769677, 2.022325, -0.9630242, 1, 1, 1, 1, 1,
0.6827014, -1.576207, 2.664633, 0, 0, 1, 1, 1,
0.6828231, 0.6976137, 0.4092243, 1, 0, 0, 1, 1,
0.6841291, -3.366459, 2.217876, 1, 0, 0, 1, 1,
0.6856751, 0.2097551, 1.267725, 1, 0, 0, 1, 1,
0.6935272, 0.03560396, 1.44006, 1, 0, 0, 1, 1,
0.6945408, 0.4730838, 1.66428, 1, 0, 0, 1, 1,
0.6967393, 1.216392, 0.4768059, 0, 0, 0, 1, 1,
0.6980887, -0.5823289, 1.691372, 0, 0, 0, 1, 1,
0.7016602, 1.21635, 0.3700351, 0, 0, 0, 1, 1,
0.7033749, -0.369047, 3.803503, 0, 0, 0, 1, 1,
0.7104008, -2.210244, 2.656966, 0, 0, 0, 1, 1,
0.7110882, -1.354082, 2.853566, 0, 0, 0, 1, 1,
0.7142051, 1.050679, -0.01474198, 0, 0, 0, 1, 1,
0.717085, -0.09876748, 1.901072, 1, 1, 1, 1, 1,
0.7213154, -0.9589953, 3.739139, 1, 1, 1, 1, 1,
0.7267129, -0.593504, 2.35501, 1, 1, 1, 1, 1,
0.7320276, -0.3999345, 1.315569, 1, 1, 1, 1, 1,
0.7424977, 0.04931236, 1.752633, 1, 1, 1, 1, 1,
0.7425938, -0.1440819, 0.1080778, 1, 1, 1, 1, 1,
0.7530891, 0.8474599, 1.706837, 1, 1, 1, 1, 1,
0.7596345, 0.931349, 1.841056, 1, 1, 1, 1, 1,
0.7596577, -1.803185, 2.776083, 1, 1, 1, 1, 1,
0.7600743, -0.5143578, 1.562047, 1, 1, 1, 1, 1,
0.7609945, -0.1616993, 2.56461, 1, 1, 1, 1, 1,
0.7613462, -2.275309, 3.960567, 1, 1, 1, 1, 1,
0.7614179, 0.09546008, 1.748499, 1, 1, 1, 1, 1,
0.7620997, 1.847671, -0.1618629, 1, 1, 1, 1, 1,
0.769403, -1.355644, 0.9423069, 1, 1, 1, 1, 1,
0.7705797, -0.07695199, 1.537144, 0, 0, 1, 1, 1,
0.7712569, 0.7054113, 1.396894, 1, 0, 0, 1, 1,
0.7753125, -1.859638, 1.94071, 1, 0, 0, 1, 1,
0.7763619, 0.09583049, 0.8635107, 1, 0, 0, 1, 1,
0.777254, -0.2385123, 3.062453, 1, 0, 0, 1, 1,
0.7777797, 1.567889, 0.9903548, 1, 0, 0, 1, 1,
0.782729, 0.8319548, 0.7293705, 0, 0, 0, 1, 1,
0.7834712, 0.1017798, 1.371669, 0, 0, 0, 1, 1,
0.7858354, -0.3542642, -0.2605659, 0, 0, 0, 1, 1,
0.7877292, -0.4358799, 1.834184, 0, 0, 0, 1, 1,
0.7914362, 0.5391887, 0.2409364, 0, 0, 0, 1, 1,
0.793445, -0.2268371, 0.1865168, 0, 0, 0, 1, 1,
0.7942317, 0.904048, 0.05664452, 0, 0, 0, 1, 1,
0.7942732, 0.8544611, 0.8833649, 1, 1, 1, 1, 1,
0.7944523, 0.6102226, 1.306059, 1, 1, 1, 1, 1,
0.7966848, 0.09071345, 2.006466, 1, 1, 1, 1, 1,
0.812097, -1.345862, 2.406241, 1, 1, 1, 1, 1,
0.8130735, -0.9604992, 2.008625, 1, 1, 1, 1, 1,
0.8163013, 1.00802, 1.745422, 1, 1, 1, 1, 1,
0.8181162, 1.004184, 2.159377, 1, 1, 1, 1, 1,
0.8182706, 0.268578, 1.103022, 1, 1, 1, 1, 1,
0.8190219, -1.687039, 3.401181, 1, 1, 1, 1, 1,
0.8268315, -0.9082941, 2.593857, 1, 1, 1, 1, 1,
0.8295989, -1.735132, 3.972485, 1, 1, 1, 1, 1,
0.8323028, -1.030181, 1.004932, 1, 1, 1, 1, 1,
0.8342469, -0.4988509, 2.034516, 1, 1, 1, 1, 1,
0.8348953, 0.5674692, 1.39549, 1, 1, 1, 1, 1,
0.8349383, -0.9397585, 3.538786, 1, 1, 1, 1, 1,
0.8350514, 0.7011657, 0.8600379, 0, 0, 1, 1, 1,
0.8385087, 1.044906, 1.192124, 1, 0, 0, 1, 1,
0.8421036, -0.0258722, 1.680919, 1, 0, 0, 1, 1,
0.8427058, 1.759261, 1.309663, 1, 0, 0, 1, 1,
0.8483965, 1.874249, 0.6406173, 1, 0, 0, 1, 1,
0.8503793, 1.606845, -0.9944748, 1, 0, 0, 1, 1,
0.8511519, 0.2806406, 0.2972481, 0, 0, 0, 1, 1,
0.8519545, 0.1023598, 2.11749, 0, 0, 0, 1, 1,
0.8607422, 0.03655769, 1.722642, 0, 0, 0, 1, 1,
0.8801585, -0.6718953, 3.580189, 0, 0, 0, 1, 1,
0.8814947, -0.8424672, 2.056682, 0, 0, 0, 1, 1,
0.8832251, -0.8907067, 3.195338, 0, 0, 0, 1, 1,
0.8863562, -0.005064493, 1.005674, 0, 0, 0, 1, 1,
0.8866829, 0.1383166, 0.7835473, 1, 1, 1, 1, 1,
0.892218, -1.479366, 3.090695, 1, 1, 1, 1, 1,
0.8952172, -1.316554, 4.525774, 1, 1, 1, 1, 1,
0.8987887, -1.117707, 2.415425, 1, 1, 1, 1, 1,
0.8990291, 0.2674141, 2.249263, 1, 1, 1, 1, 1,
0.9014592, 0.2357455, 1.575891, 1, 1, 1, 1, 1,
0.902988, -0.2711628, 2.451423, 1, 1, 1, 1, 1,
0.9054631, -1.273697, 1.767818, 1, 1, 1, 1, 1,
0.9118391, 0.2800083, 1.143177, 1, 1, 1, 1, 1,
0.9172209, -0.6052409, 3.77698, 1, 1, 1, 1, 1,
0.9269179, 0.8123874, -0.3120611, 1, 1, 1, 1, 1,
0.927321, -0.3486475, 0.02473223, 1, 1, 1, 1, 1,
0.9458572, -0.4899915, 2.558885, 1, 1, 1, 1, 1,
0.9537878, -0.05955419, 1.824573, 1, 1, 1, 1, 1,
0.9576098, -2.066159, 3.358668, 1, 1, 1, 1, 1,
0.9592752, -0.2377156, -0.2612966, 0, 0, 1, 1, 1,
0.961507, -0.6371676, 2.755575, 1, 0, 0, 1, 1,
0.9640867, 0.1511933, 0.8401692, 1, 0, 0, 1, 1,
0.9702286, 0.5616853, 2.666643, 1, 0, 0, 1, 1,
0.9703557, -0.6444548, 3.196187, 1, 0, 0, 1, 1,
0.9788547, -1.603989, 2.849569, 1, 0, 0, 1, 1,
0.9865285, -1.564346, 3.868942, 0, 0, 0, 1, 1,
0.992276, 0.2344249, 2.082897, 0, 0, 0, 1, 1,
0.9960253, -0.9473074, 2.445528, 0, 0, 0, 1, 1,
1.00175, -2.09893, 3.73044, 0, 0, 0, 1, 1,
1.005, 2.1478, -1.124003, 0, 0, 0, 1, 1,
1.009081, 1.180481, -0.5307086, 0, 0, 0, 1, 1,
1.01386, 0.10149, 0.5914553, 0, 0, 0, 1, 1,
1.021802, 0.5943813, 1.036933, 1, 1, 1, 1, 1,
1.028254, 0.4860691, 0.5422621, 1, 1, 1, 1, 1,
1.028828, -0.8247396, 1.017087, 1, 1, 1, 1, 1,
1.033051, 0.9259489, 0.6455788, 1, 1, 1, 1, 1,
1.05322, -0.1869047, 1.161647, 1, 1, 1, 1, 1,
1.056406, 2.281592, -0.1372649, 1, 1, 1, 1, 1,
1.061846, -0.2267375, 1.046938, 1, 1, 1, 1, 1,
1.068152, 1.346572, 1.631943, 1, 1, 1, 1, 1,
1.076247, 1.734435, 1.517668, 1, 1, 1, 1, 1,
1.078105, 3.921243, -0.05164309, 1, 1, 1, 1, 1,
1.093451, 0.8723631, 0.1594877, 1, 1, 1, 1, 1,
1.100968, -0.3776293, 1.496333, 1, 1, 1, 1, 1,
1.101878, 1.022157, 2.104695, 1, 1, 1, 1, 1,
1.104111, 1.395718, 0.8324435, 1, 1, 1, 1, 1,
1.104601, 0.3198795, 0.1999072, 1, 1, 1, 1, 1,
1.108421, 0.7766749, -2.175722, 0, 0, 1, 1, 1,
1.1091, 0.6659427, 2.718909, 1, 0, 0, 1, 1,
1.113065, 0.1109742, 1.722778, 1, 0, 0, 1, 1,
1.1231, -0.5249747, 2.412058, 1, 0, 0, 1, 1,
1.125829, 0.3445083, 3.010888, 1, 0, 0, 1, 1,
1.126442, -0.01202177, 2.96174, 1, 0, 0, 1, 1,
1.128684, 1.159365, 1.7439, 0, 0, 0, 1, 1,
1.136798, 0.02651377, 1.740611, 0, 0, 0, 1, 1,
1.143353, 1.681673, -0.06611094, 0, 0, 0, 1, 1,
1.146325, 0.6865925, 0.2087196, 0, 0, 0, 1, 1,
1.156361, -1.647786, 3.306826, 0, 0, 0, 1, 1,
1.164476, -0.03599486, 1.865715, 0, 0, 0, 1, 1,
1.176409, 0.6621676, -0.3351926, 0, 0, 0, 1, 1,
1.183102, -1.012614, 2.002604, 1, 1, 1, 1, 1,
1.202568, -0.2020818, 2.159086, 1, 1, 1, 1, 1,
1.208371, 0.3836482, 2.655332, 1, 1, 1, 1, 1,
1.208472, -1.382047, 2.164925, 1, 1, 1, 1, 1,
1.209659, -0.06527207, 2.525127, 1, 1, 1, 1, 1,
1.211024, -1.706541, 2.894578, 1, 1, 1, 1, 1,
1.211315, 0.5287901, 0.2065198, 1, 1, 1, 1, 1,
1.212183, -0.4147792, 1.829563, 1, 1, 1, 1, 1,
1.224794, 1.133731, 3.052473, 1, 1, 1, 1, 1,
1.226465, 0.9672205, -0.01676468, 1, 1, 1, 1, 1,
1.23437, 0.9871741, 0.8887486, 1, 1, 1, 1, 1,
1.234373, -0.1030185, 0.7750106, 1, 1, 1, 1, 1,
1.235791, 0.544217, 2.013421, 1, 1, 1, 1, 1,
1.242227, -0.8306177, 1.078604, 1, 1, 1, 1, 1,
1.244162, -0.1889911, 0.6447737, 1, 1, 1, 1, 1,
1.255377, -1.98896, 2.136187, 0, 0, 1, 1, 1,
1.272542, -0.7510043, 1.601781, 1, 0, 0, 1, 1,
1.272615, 0.3995501, 0.9693392, 1, 0, 0, 1, 1,
1.278112, 1.582818, 1.705511, 1, 0, 0, 1, 1,
1.278214, 0.5067448, 1.9935, 1, 0, 0, 1, 1,
1.285896, -1.333728, 1.357774, 1, 0, 0, 1, 1,
1.293685, 0.2832196, 1.504481, 0, 0, 0, 1, 1,
1.295776, 0.5668811, 0.7437482, 0, 0, 0, 1, 1,
1.296731, 1.582498, 0.8147165, 0, 0, 0, 1, 1,
1.296945, 0.9149818, 0.5756969, 0, 0, 0, 1, 1,
1.321241, -1.858061, 2.158676, 0, 0, 0, 1, 1,
1.327131, -0.9325813, 1.924353, 0, 0, 0, 1, 1,
1.328146, -0.1485688, 1.826622, 0, 0, 0, 1, 1,
1.350044, -0.8769993, 2.088742, 1, 1, 1, 1, 1,
1.35385, -1.876449, 3.18838, 1, 1, 1, 1, 1,
1.36774, -0.2317074, 2.805808, 1, 1, 1, 1, 1,
1.370241, 1.010545, -0.1678475, 1, 1, 1, 1, 1,
1.370478, 0.2886351, 3.075207, 1, 1, 1, 1, 1,
1.370772, -0.1975434, 1.30271, 1, 1, 1, 1, 1,
1.388053, 0.3497364, 3.142577, 1, 1, 1, 1, 1,
1.393418, 2.53519, 0.3237775, 1, 1, 1, 1, 1,
1.395916, 0.2929754, 2.19593, 1, 1, 1, 1, 1,
1.39718, -0.4353093, 3.198697, 1, 1, 1, 1, 1,
1.397969, 1.502639, 0.0274537, 1, 1, 1, 1, 1,
1.402545, -1.210657, 1.62574, 1, 1, 1, 1, 1,
1.442647, 0.1538107, 0.3005922, 1, 1, 1, 1, 1,
1.450976, 0.754654, 1.833599, 1, 1, 1, 1, 1,
1.478531, -0.07773396, 1.488841, 1, 1, 1, 1, 1,
1.48057, -0.334497, 2.448729, 0, 0, 1, 1, 1,
1.482281, -2.331881, 1.939738, 1, 0, 0, 1, 1,
1.48465, -1.406424, 3.72297, 1, 0, 0, 1, 1,
1.485829, -0.2007459, 1.740488, 1, 0, 0, 1, 1,
1.488246, -1.719711, 2.555078, 1, 0, 0, 1, 1,
1.489741, 1.703668, -0.4198608, 1, 0, 0, 1, 1,
1.505465, 2.005358, 0.2107425, 0, 0, 0, 1, 1,
1.50555, 0.3461902, 0.1619497, 0, 0, 0, 1, 1,
1.511153, -0.6090809, 1.018412, 0, 0, 0, 1, 1,
1.521919, 0.8820361, 2.481951, 0, 0, 0, 1, 1,
1.541557, -0.5851813, 1.771249, 0, 0, 0, 1, 1,
1.557034, 0.5310509, 2.738364, 0, 0, 0, 1, 1,
1.560432, 1.372611, 1.987954, 0, 0, 0, 1, 1,
1.57022, -1.127763, 2.751368, 1, 1, 1, 1, 1,
1.571681, -1.206882, 2.992477, 1, 1, 1, 1, 1,
1.589641, 1.337718, -2.614049, 1, 1, 1, 1, 1,
1.600017, -0.7154487, 2.687515, 1, 1, 1, 1, 1,
1.604293, 1.536658, 1.076638, 1, 1, 1, 1, 1,
1.610241, 0.8693013, 2.35097, 1, 1, 1, 1, 1,
1.611571, -1.948524, 2.229491, 1, 1, 1, 1, 1,
1.644587, -0.6523864, 2.231666, 1, 1, 1, 1, 1,
1.645558, -0.04531818, 3.171629, 1, 1, 1, 1, 1,
1.666925, -0.000755905, 1.829812, 1, 1, 1, 1, 1,
1.671815, 0.066348, 1.060885, 1, 1, 1, 1, 1,
1.672967, -1.639702, 3.723384, 1, 1, 1, 1, 1,
1.683418, -0.7543785, 1.460296, 1, 1, 1, 1, 1,
1.683953, -1.711077, 0.2798696, 1, 1, 1, 1, 1,
1.690195, -0.285398, 2.91886, 1, 1, 1, 1, 1,
1.716414, -0.3538262, 0.749575, 0, 0, 1, 1, 1,
1.726419, -0.7340976, 1.751271, 1, 0, 0, 1, 1,
1.747371, 0.7170548, 1.457422, 1, 0, 0, 1, 1,
1.766715, 0.8701882, 1.790678, 1, 0, 0, 1, 1,
1.781909, 0.1304886, 3.174987, 1, 0, 0, 1, 1,
1.782019, 0.4659463, 1.112809, 1, 0, 0, 1, 1,
1.799529, -0.3887674, 2.085848, 0, 0, 0, 1, 1,
1.830144, -0.6182774, 4.023996, 0, 0, 0, 1, 1,
1.830994, -0.949612, 2.52115, 0, 0, 0, 1, 1,
1.865398, -0.7251208, 0.3529058, 0, 0, 0, 1, 1,
1.872174, 0.8168328, -0.5057392, 0, 0, 0, 1, 1,
1.876752, 0.06001941, 1.616189, 0, 0, 0, 1, 1,
1.878115, -1.144241, 0.439175, 0, 0, 0, 1, 1,
1.891152, 0.8247027, 2.073376, 1, 1, 1, 1, 1,
1.912123, 1.54274, 1.0743, 1, 1, 1, 1, 1,
1.913179, 1.980878, 0.9043481, 1, 1, 1, 1, 1,
1.916101, 0.5787598, 0.2006142, 1, 1, 1, 1, 1,
1.933314, -0.09133529, 1.430589, 1, 1, 1, 1, 1,
1.970752, 2.099452, 1.050385, 1, 1, 1, 1, 1,
1.971399, 1.312828, 0.2861075, 1, 1, 1, 1, 1,
1.98691, 0.2490262, 2.57023, 1, 1, 1, 1, 1,
2.027555, -0.01142297, 1.636392, 1, 1, 1, 1, 1,
2.027885, 0.8055655, 0.4808911, 1, 1, 1, 1, 1,
2.079935, 0.4096842, 3.38918, 1, 1, 1, 1, 1,
2.129327, -1.368739, 1.94289, 1, 1, 1, 1, 1,
2.139354, 0.5336916, 1.683523, 1, 1, 1, 1, 1,
2.156407, -0.7550208, 3.077479, 1, 1, 1, 1, 1,
2.157241, 0.8595304, 0.9578605, 1, 1, 1, 1, 1,
2.198725, -0.04247033, 1.564425, 0, 0, 1, 1, 1,
2.200633, 0.09198845, 0.6053407, 1, 0, 0, 1, 1,
2.215513, -0.4656369, 0.9501228, 1, 0, 0, 1, 1,
2.231035, 0.5048538, 1.554491, 1, 0, 0, 1, 1,
2.246963, -1.194821, 2.087114, 1, 0, 0, 1, 1,
2.24984, 1.523167, 0.7592894, 1, 0, 0, 1, 1,
2.260368, -0.5030087, 1.517237, 0, 0, 0, 1, 1,
2.337186, -1.313063, 0.3990321, 0, 0, 0, 1, 1,
2.343761, -1.16225, 0.8360854, 0, 0, 0, 1, 1,
2.362088, -1.19857, 1.549853, 0, 0, 0, 1, 1,
2.377761, 1.113915, -0.5474385, 0, 0, 0, 1, 1,
2.497126, -2.026543, 2.199639, 0, 0, 0, 1, 1,
2.633452, 1.289316, 1.625597, 0, 0, 0, 1, 1,
2.64376, -0.02288827, 0.9652462, 1, 1, 1, 1, 1,
2.645487, 0.2567271, 0.5739499, 1, 1, 1, 1, 1,
2.842127, 0.8748819, 1.134039, 1, 1, 1, 1, 1,
2.857986, 1.013753, 0.6779377, 1, 1, 1, 1, 1,
2.887456, -0.7477761, 0.8978875, 1, 1, 1, 1, 1,
3.486293, 0.006785329, 2.465587, 1, 1, 1, 1, 1,
3.621133, 0.3788889, 1.586653, 1, 1, 1, 1, 1
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
var radius = 9.918998;
var distance = 34.84006;
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
mvMatrix.translate( -0.06900239, -0.2773921, -0.3511431 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.84006);
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
