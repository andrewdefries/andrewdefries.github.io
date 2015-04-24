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
-3.662286, -1.023495, -1.97628, 1, 0, 0, 1,
-3.395862, 1.241585, -2.277583, 1, 0.007843138, 0, 1,
-3.303205, -0.4063817, -3.260594, 1, 0.01176471, 0, 1,
-2.764107, 1.028953, -2.467249, 1, 0.01960784, 0, 1,
-2.71019, 0.5566971, -0.9000869, 1, 0.02352941, 0, 1,
-2.63291, 1.759858, -2.356903, 1, 0.03137255, 0, 1,
-2.593924, 0.4731793, -0.9210547, 1, 0.03529412, 0, 1,
-2.586714, 0.4171185, -0.9712999, 1, 0.04313726, 0, 1,
-2.450392, 0.748667, -3.636386, 1, 0.04705882, 0, 1,
-2.377416, 0.0242737, -2.178658, 1, 0.05490196, 0, 1,
-2.31949, 0.917829, -1.070267, 1, 0.05882353, 0, 1,
-2.247983, -0.1865074, -2.276718, 1, 0.06666667, 0, 1,
-2.243017, -1.040746, -0.4920644, 1, 0.07058824, 0, 1,
-2.179631, 0.9679934, -0.07828198, 1, 0.07843138, 0, 1,
-2.172383, -0.2005944, -0.9102967, 1, 0.08235294, 0, 1,
-2.151977, -1.100505, -1.049664, 1, 0.09019608, 0, 1,
-2.148899, 1.330155, -1.127244, 1, 0.09411765, 0, 1,
-2.120004, -0.0500907, -1.235039, 1, 0.1019608, 0, 1,
-2.089816, 0.3085479, -0.8040244, 1, 0.1098039, 0, 1,
-2.059646, -1.247098, -2.497843, 1, 0.1137255, 0, 1,
-2.045671, -0.819023, -2.440732, 1, 0.1215686, 0, 1,
-2.043868, -0.1385807, -2.477705, 1, 0.1254902, 0, 1,
-1.989133, -0.4173103, -0.5775182, 1, 0.1333333, 0, 1,
-1.988566, 0.008404966, -0.1927273, 1, 0.1372549, 0, 1,
-1.954271, 0.1880732, -1.475595, 1, 0.145098, 0, 1,
-1.934752, 0.3129103, -2.281265, 1, 0.1490196, 0, 1,
-1.926746, 0.05028423, -0.8909422, 1, 0.1568628, 0, 1,
-1.925425, -0.2219081, -3.384585, 1, 0.1607843, 0, 1,
-1.924547, 1.091138, -1.242384, 1, 0.1686275, 0, 1,
-1.88033, 0.9217846, 0.06608226, 1, 0.172549, 0, 1,
-1.879682, -1.413075, -2.245698, 1, 0.1803922, 0, 1,
-1.876765, -0.04938873, -2.311916, 1, 0.1843137, 0, 1,
-1.848237, -0.1460863, -2.691563, 1, 0.1921569, 0, 1,
-1.837971, -0.4858626, -0.2554962, 1, 0.1960784, 0, 1,
-1.814999, 2.082211, 0.3257325, 1, 0.2039216, 0, 1,
-1.803817, 1.789145, 0.1836761, 1, 0.2117647, 0, 1,
-1.80349, -1.641237, -2.742791, 1, 0.2156863, 0, 1,
-1.761025, 1.346303, -1.222854, 1, 0.2235294, 0, 1,
-1.752834, 0.8096972, -2.482208, 1, 0.227451, 0, 1,
-1.73526, 1.362528, 0.1246479, 1, 0.2352941, 0, 1,
-1.732334, 0.8308429, -0.5863323, 1, 0.2392157, 0, 1,
-1.715632, -1.770999, -1.60008, 1, 0.2470588, 0, 1,
-1.713627, 0.5104139, -1.074384, 1, 0.2509804, 0, 1,
-1.707773, 0.6253213, 0.1589355, 1, 0.2588235, 0, 1,
-1.705393, -0.7644933, -2.289824, 1, 0.2627451, 0, 1,
-1.700478, 1.461467, -1.536011, 1, 0.2705882, 0, 1,
-1.695778, -1.175815, -1.095412, 1, 0.2745098, 0, 1,
-1.686891, -1.588757, -4.370344, 1, 0.282353, 0, 1,
-1.663702, 0.5689334, -1.390741, 1, 0.2862745, 0, 1,
-1.654076, 0.9342821, -1.283092, 1, 0.2941177, 0, 1,
-1.648756, -1.081126, -2.760398, 1, 0.3019608, 0, 1,
-1.647774, -0.4743743, -3.068062, 1, 0.3058824, 0, 1,
-1.647484, -0.4000042, -1.570728, 1, 0.3137255, 0, 1,
-1.644001, -1.262985, -1.48356, 1, 0.3176471, 0, 1,
-1.64179, 0.7569364, -0.875098, 1, 0.3254902, 0, 1,
-1.636595, 0.3892471, -1.786151, 1, 0.3294118, 0, 1,
-1.631084, -0.6111783, -2.333551, 1, 0.3372549, 0, 1,
-1.629307, 0.4031924, 0.8749916, 1, 0.3411765, 0, 1,
-1.608673, -0.5752293, -1.283083, 1, 0.3490196, 0, 1,
-1.600052, -0.6103051, -0.7850993, 1, 0.3529412, 0, 1,
-1.592078, 0.6286268, -2.120602, 1, 0.3607843, 0, 1,
-1.582737, -0.5040783, -1.597681, 1, 0.3647059, 0, 1,
-1.569375, -0.1849889, -2.502852, 1, 0.372549, 0, 1,
-1.56838, 0.4292253, -1.952559, 1, 0.3764706, 0, 1,
-1.566088, -0.3403209, -2.487942, 1, 0.3843137, 0, 1,
-1.558468, 0.3586091, -1.392898, 1, 0.3882353, 0, 1,
-1.545501, -1.307122, -1.979129, 1, 0.3960784, 0, 1,
-1.541892, 0.9983582, -1.05433, 1, 0.4039216, 0, 1,
-1.516735, -0.932945, -2.214744, 1, 0.4078431, 0, 1,
-1.513302, 0.4325949, 0.1387011, 1, 0.4156863, 0, 1,
-1.510631, -0.8032824, -2.608519, 1, 0.4196078, 0, 1,
-1.503685, 0.3965063, -1.22234, 1, 0.427451, 0, 1,
-1.502353, 0.9015658, -1.610452, 1, 0.4313726, 0, 1,
-1.498186, 0.4474342, -0.3986083, 1, 0.4392157, 0, 1,
-1.497628, 0.2603279, -2.261695, 1, 0.4431373, 0, 1,
-1.487411, 0.1580024, -1.840496, 1, 0.4509804, 0, 1,
-1.48434, -1.543134, -2.818879, 1, 0.454902, 0, 1,
-1.460806, 0.7809248, 0.3175202, 1, 0.4627451, 0, 1,
-1.460592, 1.781213, -0.1838735, 1, 0.4666667, 0, 1,
-1.459932, -0.3399565, -0.3778536, 1, 0.4745098, 0, 1,
-1.454506, -1.883483, -2.336084, 1, 0.4784314, 0, 1,
-1.444207, -0.3620823, -0.927395, 1, 0.4862745, 0, 1,
-1.434711, -1.148299, -3.826582, 1, 0.4901961, 0, 1,
-1.432674, -0.3887314, -0.5374374, 1, 0.4980392, 0, 1,
-1.428381, -0.4296319, -2.028585, 1, 0.5058824, 0, 1,
-1.413735, -0.6814467, -2.118726, 1, 0.509804, 0, 1,
-1.40777, -0.3782924, -1.98558, 1, 0.5176471, 0, 1,
-1.384577, 0.4204052, -1.671872, 1, 0.5215687, 0, 1,
-1.376569, 0.5439567, -1.808922, 1, 0.5294118, 0, 1,
-1.370533, -1.998473, -4.757525, 1, 0.5333334, 0, 1,
-1.367304, -0.5596343, -1.816565, 1, 0.5411765, 0, 1,
-1.365435, -0.4684779, -1.892161, 1, 0.5450981, 0, 1,
-1.364726, -0.8283982, -1.082209, 1, 0.5529412, 0, 1,
-1.354887, 0.2424472, -1.27386, 1, 0.5568628, 0, 1,
-1.352842, -1.201586, -2.971689, 1, 0.5647059, 0, 1,
-1.344814, 0.6910842, -2.186865, 1, 0.5686275, 0, 1,
-1.328499, -0.741848, -1.78359, 1, 0.5764706, 0, 1,
-1.32602, -1.133916, -2.166885, 1, 0.5803922, 0, 1,
-1.323044, 0.8337379, -0.9534274, 1, 0.5882353, 0, 1,
-1.318881, -0.7559462, -0.9202852, 1, 0.5921569, 0, 1,
-1.314688, -0.2805521, -1.452311, 1, 0.6, 0, 1,
-1.311249, -0.2920279, -1.927508, 1, 0.6078432, 0, 1,
-1.310234, 0.3556135, -0.5796221, 1, 0.6117647, 0, 1,
-1.293126, 0.892455, -0.509739, 1, 0.6196079, 0, 1,
-1.28972, -1.412361, -1.512069, 1, 0.6235294, 0, 1,
-1.285875, -1.015185, -1.00802, 1, 0.6313726, 0, 1,
-1.284973, -1.129854, -3.36231, 1, 0.6352941, 0, 1,
-1.284218, -1.716221, -2.219568, 1, 0.6431373, 0, 1,
-1.283309, 0.9056951, -2.571408, 1, 0.6470588, 0, 1,
-1.266401, -2.243561, -3.432554, 1, 0.654902, 0, 1,
-1.25733, -0.07030547, -2.78811, 1, 0.6588235, 0, 1,
-1.245628, -1.447359, -1.408939, 1, 0.6666667, 0, 1,
-1.243427, -1.395628, -3.709213, 1, 0.6705883, 0, 1,
-1.236701, 1.696091, 1.104177, 1, 0.6784314, 0, 1,
-1.235939, 0.4413877, -1.379405, 1, 0.682353, 0, 1,
-1.235482, 0.3691689, -1.55726, 1, 0.6901961, 0, 1,
-1.232006, 0.432306, -1.150369, 1, 0.6941177, 0, 1,
-1.222863, -0.5385765, -4.097703, 1, 0.7019608, 0, 1,
-1.217707, -1.011073, -2.797496, 1, 0.7098039, 0, 1,
-1.216426, 0.4416818, -0.9434406, 1, 0.7137255, 0, 1,
-1.206531, -1.041449, -0.9391155, 1, 0.7215686, 0, 1,
-1.204941, -0.2056836, -2.751321, 1, 0.7254902, 0, 1,
-1.185609, -0.1630362, -2.046705, 1, 0.7333333, 0, 1,
-1.17923, -0.6560772, -1.107471, 1, 0.7372549, 0, 1,
-1.178516, 0.8530714, -0.5393084, 1, 0.7450981, 0, 1,
-1.171894, 1.024545, -1.03973, 1, 0.7490196, 0, 1,
-1.171034, 1.044473, -2.500667, 1, 0.7568628, 0, 1,
-1.169856, 0.4295535, -0.3907844, 1, 0.7607843, 0, 1,
-1.16259, 0.4737723, -0.7151421, 1, 0.7686275, 0, 1,
-1.16096, -0.4458927, -1.487512, 1, 0.772549, 0, 1,
-1.16058, 0.1129975, -1.615203, 1, 0.7803922, 0, 1,
-1.156268, -0.625012, -0.9844548, 1, 0.7843137, 0, 1,
-1.145399, -1.858301, -3.527893, 1, 0.7921569, 0, 1,
-1.140123, -2.114031, -3.711979, 1, 0.7960784, 0, 1,
-1.135847, -0.7229444, -2.360159, 1, 0.8039216, 0, 1,
-1.111436, 1.45514, -0.2703286, 1, 0.8117647, 0, 1,
-1.100027, -0.888982, -3.676059, 1, 0.8156863, 0, 1,
-1.086378, -0.7497737, -2.368093, 1, 0.8235294, 0, 1,
-1.083041, 0.7669721, -1.96646, 1, 0.827451, 0, 1,
-1.078339, -0.5272269, -1.372308, 1, 0.8352941, 0, 1,
-1.072399, -0.1267607, -2.316135, 1, 0.8392157, 0, 1,
-1.068515, 0.5797313, -0.3653619, 1, 0.8470588, 0, 1,
-1.064447, -0.5145556, -1.701368, 1, 0.8509804, 0, 1,
-1.058568, 0.5106059, 0.7605475, 1, 0.8588235, 0, 1,
-1.055306, 1.52268, -0.8361935, 1, 0.8627451, 0, 1,
-1.052889, 1.139127, -0.5410137, 1, 0.8705882, 0, 1,
-1.051031, -1.001566, -1.582478, 1, 0.8745098, 0, 1,
-1.045358, -1.35699, -1.634443, 1, 0.8823529, 0, 1,
-1.044875, -0.4043395, -2.376196, 1, 0.8862745, 0, 1,
-1.036413, 0.6958737, -0.06717075, 1, 0.8941177, 0, 1,
-1.033658, 0.0811032, -0.1056054, 1, 0.8980392, 0, 1,
-1.024731, -0.9030484, -0.5134245, 1, 0.9058824, 0, 1,
-1.023597, -0.143988, -3.41077, 1, 0.9137255, 0, 1,
-1.019358, -0.2693073, -1.559922, 1, 0.9176471, 0, 1,
-1.017534, -3.513451, -1.328655, 1, 0.9254902, 0, 1,
-1.013359, -1.839727, -2.081062, 1, 0.9294118, 0, 1,
-1.010901, 0.6592538, -0.332309, 1, 0.9372549, 0, 1,
-1.009248, 0.2003441, -2.245171, 1, 0.9411765, 0, 1,
-1.005972, -0.558476, -1.366113, 1, 0.9490196, 0, 1,
-1.00252, -0.2523482, -0.7625856, 1, 0.9529412, 0, 1,
-1.000467, 0.1501887, -3.342843, 1, 0.9607843, 0, 1,
-0.9884939, -1.219373, -1.348217, 1, 0.9647059, 0, 1,
-0.9812126, 1.995193, -1.082802, 1, 0.972549, 0, 1,
-0.9788013, 0.84626, -1.547584, 1, 0.9764706, 0, 1,
-0.9767015, 0.4549675, -2.124195, 1, 0.9843137, 0, 1,
-0.972554, -1.093386, -3.105314, 1, 0.9882353, 0, 1,
-0.9672765, -1.357701, -3.36874, 1, 0.9960784, 0, 1,
-0.9645602, -0.3444952, -1.910578, 0.9960784, 1, 0, 1,
-0.9633621, -1.16277, -2.321412, 0.9921569, 1, 0, 1,
-0.9626887, -0.9147519, -1.717268, 0.9843137, 1, 0, 1,
-0.9625499, -1.464452, -2.832115, 0.9803922, 1, 0, 1,
-0.9549816, 1.108321, 0.02976243, 0.972549, 1, 0, 1,
-0.9545658, -0.09023039, 0.1090186, 0.9686275, 1, 0, 1,
-0.9521684, -1.630538, -2.298475, 0.9607843, 1, 0, 1,
-0.9494981, 2.595297, 0.6486031, 0.9568627, 1, 0, 1,
-0.9475538, 0.0795045, -1.776009, 0.9490196, 1, 0, 1,
-0.9430797, -0.7173222, -2.412384, 0.945098, 1, 0, 1,
-0.9342428, 0.1740383, -0.475513, 0.9372549, 1, 0, 1,
-0.9336025, -0.2875015, -1.632609, 0.9333333, 1, 0, 1,
-0.9317237, 0.3241498, -3.335167, 0.9254902, 1, 0, 1,
-0.9292905, -0.1868937, -2.023769, 0.9215686, 1, 0, 1,
-0.9287537, -1.201726, -2.767313, 0.9137255, 1, 0, 1,
-0.9244003, -0.8788663, -0.7352001, 0.9098039, 1, 0, 1,
-0.9107732, 1.029426, 0.7232523, 0.9019608, 1, 0, 1,
-0.9105189, 2.186931, -0.3006908, 0.8941177, 1, 0, 1,
-0.9088628, -1.446191, -3.86011, 0.8901961, 1, 0, 1,
-0.9052343, 0.3732678, -0.1802176, 0.8823529, 1, 0, 1,
-0.8994405, -0.5637017, -3.524823, 0.8784314, 1, 0, 1,
-0.8989968, -1.213673, -1.031909, 0.8705882, 1, 0, 1,
-0.8920233, 0.8157654, 0.6813269, 0.8666667, 1, 0, 1,
-0.8915564, 2.156832, -1.368814, 0.8588235, 1, 0, 1,
-0.8869373, 0.72598, 0.07260282, 0.854902, 1, 0, 1,
-0.8857678, -0.2654096, -2.910553, 0.8470588, 1, 0, 1,
-0.8847468, -1.326019, -3.593057, 0.8431373, 1, 0, 1,
-0.8828083, -0.5190538, -1.164277, 0.8352941, 1, 0, 1,
-0.8823943, -0.6015542, -0.3732358, 0.8313726, 1, 0, 1,
-0.8800635, 0.1592761, -2.563335, 0.8235294, 1, 0, 1,
-0.8797439, -0.1213805, -2.392648, 0.8196079, 1, 0, 1,
-0.8784188, -1.674094, -4.289276, 0.8117647, 1, 0, 1,
-0.8651388, -0.5617935, -1.894563, 0.8078431, 1, 0, 1,
-0.8457667, -0.2574127, -1.163906, 0.8, 1, 0, 1,
-0.8432448, 0.7954829, -2.328315, 0.7921569, 1, 0, 1,
-0.8415504, -1.743395, -1.469523, 0.7882353, 1, 0, 1,
-0.8346879, -0.2224114, -1.764376, 0.7803922, 1, 0, 1,
-0.8332911, 1.311755, 0.6271769, 0.7764706, 1, 0, 1,
-0.8309085, 1.749425, 0.1042725, 0.7686275, 1, 0, 1,
-0.8305327, -0.4717259, -2.425369, 0.7647059, 1, 0, 1,
-0.8292427, 0.724561, -0.3889869, 0.7568628, 1, 0, 1,
-0.8288598, -0.4983971, -2.438512, 0.7529412, 1, 0, 1,
-0.8278376, -0.5943175, -0.7568125, 0.7450981, 1, 0, 1,
-0.8159173, -0.4864601, -2.674018, 0.7411765, 1, 0, 1,
-0.8154943, 0.04423628, -0.8053932, 0.7333333, 1, 0, 1,
-0.8056022, 1.03837, -0.01102346, 0.7294118, 1, 0, 1,
-0.8049449, 0.9700058, -0.2048989, 0.7215686, 1, 0, 1,
-0.8017938, 0.8521755, -0.5163605, 0.7176471, 1, 0, 1,
-0.7892699, 0.8577172, -0.6446111, 0.7098039, 1, 0, 1,
-0.7790574, -0.3201874, -2.211609, 0.7058824, 1, 0, 1,
-0.7789494, -0.6341641, -2.612197, 0.6980392, 1, 0, 1,
-0.7667644, -0.3348656, -0.02737273, 0.6901961, 1, 0, 1,
-0.7666975, 0.0852655, -0.2625376, 0.6862745, 1, 0, 1,
-0.7659404, -0.09475737, -3.58583, 0.6784314, 1, 0, 1,
-0.7651763, -0.1214547, -1.74315, 0.6745098, 1, 0, 1,
-0.7647395, -2.064595, -3.662432, 0.6666667, 1, 0, 1,
-0.7585681, 0.06637944, -1.300788, 0.6627451, 1, 0, 1,
-0.7561795, -0.07887473, -4.118632, 0.654902, 1, 0, 1,
-0.7552693, 0.9269654, -0.8632083, 0.6509804, 1, 0, 1,
-0.7524471, 0.3024962, -2.357075, 0.6431373, 1, 0, 1,
-0.7510163, 0.008513432, -1.982388, 0.6392157, 1, 0, 1,
-0.7469596, 0.2335982, -0.4585237, 0.6313726, 1, 0, 1,
-0.7459182, -0.6191143, -2.983976, 0.627451, 1, 0, 1,
-0.7422074, -0.6856009, -1.098673, 0.6196079, 1, 0, 1,
-0.7188936, -0.699078, -2.243637, 0.6156863, 1, 0, 1,
-0.7125767, -0.1831759, -2.60396, 0.6078432, 1, 0, 1,
-0.7096624, -1.16277, -1.241334, 0.6039216, 1, 0, 1,
-0.7094154, 1.399261, 0.9616413, 0.5960785, 1, 0, 1,
-0.7067329, -0.4464729, -2.741408, 0.5882353, 1, 0, 1,
-0.7057255, 0.9540384, -0.9815128, 0.5843138, 1, 0, 1,
-0.7025712, 0.6603574, -1.64114, 0.5764706, 1, 0, 1,
-0.6968774, -1.599858, -2.529105, 0.572549, 1, 0, 1,
-0.694741, 0.05633678, -1.826864, 0.5647059, 1, 0, 1,
-0.6920204, -1.056373, -3.073484, 0.5607843, 1, 0, 1,
-0.6882958, -1.097013, -2.996691, 0.5529412, 1, 0, 1,
-0.6824313, 0.1548632, -1.799233, 0.5490196, 1, 0, 1,
-0.6773049, -0.2797043, -1.678113, 0.5411765, 1, 0, 1,
-0.6735448, -1.725624, -1.195545, 0.5372549, 1, 0, 1,
-0.6720175, -1.832398, -1.807552, 0.5294118, 1, 0, 1,
-0.6704553, 1.263577, -2.329051, 0.5254902, 1, 0, 1,
-0.6675568, -1.135458, -1.969368, 0.5176471, 1, 0, 1,
-0.6653028, -1.524125, -3.505616, 0.5137255, 1, 0, 1,
-0.6577736, -0.4375049, -1.379759, 0.5058824, 1, 0, 1,
-0.6568838, -0.280851, -2.620253, 0.5019608, 1, 0, 1,
-0.6563888, -1.386738, -3.720722, 0.4941176, 1, 0, 1,
-0.6536511, 1.917252, -1.120011, 0.4862745, 1, 0, 1,
-0.6530301, -1.883047, -2.705406, 0.4823529, 1, 0, 1,
-0.6525947, -0.6175561, -0.3803418, 0.4745098, 1, 0, 1,
-0.6512068, -0.986259, -0.9374564, 0.4705882, 1, 0, 1,
-0.6499927, -1.511505, -1.86041, 0.4627451, 1, 0, 1,
-0.6298372, 0.6646306, -0.4543146, 0.4588235, 1, 0, 1,
-0.627323, -1.868815, -3.074146, 0.4509804, 1, 0, 1,
-0.6220142, 1.019665, -0.8985397, 0.4470588, 1, 0, 1,
-0.6219858, 0.8091978, -0.4307042, 0.4392157, 1, 0, 1,
-0.6200427, -0.7520826, -2.136282, 0.4352941, 1, 0, 1,
-0.6199811, -1.556415, -2.779175, 0.427451, 1, 0, 1,
-0.6179733, -0.7663913, -2.104139, 0.4235294, 1, 0, 1,
-0.6116347, 0.5101528, -2.298748, 0.4156863, 1, 0, 1,
-0.6108599, 1.385727, -0.7026668, 0.4117647, 1, 0, 1,
-0.6070139, 2.127011, 0.7624617, 0.4039216, 1, 0, 1,
-0.6060061, -0.1717721, -2.843442, 0.3960784, 1, 0, 1,
-0.596397, 0.3599695, -1.615791, 0.3921569, 1, 0, 1,
-0.5838161, 0.7748362, -1.593757, 0.3843137, 1, 0, 1,
-0.5832546, -3.01411, -2.275246, 0.3803922, 1, 0, 1,
-0.5830976, -0.8402504, -3.957612, 0.372549, 1, 0, 1,
-0.5809296, 0.6035715, -1.193633, 0.3686275, 1, 0, 1,
-0.570439, 0.2282494, -1.984534, 0.3607843, 1, 0, 1,
-0.569266, 0.8289701, 1.083319, 0.3568628, 1, 0, 1,
-0.5621381, -0.4422773, -1.802574, 0.3490196, 1, 0, 1,
-0.5604371, -1.241943, -1.702486, 0.345098, 1, 0, 1,
-0.5603862, 1.289507, 1.363158, 0.3372549, 1, 0, 1,
-0.5572007, 1.242199, -0.8566342, 0.3333333, 1, 0, 1,
-0.5522115, 0.04237564, -0.9774488, 0.3254902, 1, 0, 1,
-0.5480881, 0.7507221, -0.2415273, 0.3215686, 1, 0, 1,
-0.5475913, 0.06619239, -1.915934, 0.3137255, 1, 0, 1,
-0.5471144, -0.262654, -2.938055, 0.3098039, 1, 0, 1,
-0.5437712, -0.1098636, -4.164147, 0.3019608, 1, 0, 1,
-0.5404552, -2.123136, -4.684104, 0.2941177, 1, 0, 1,
-0.5317513, 0.6145315, -0.6067683, 0.2901961, 1, 0, 1,
-0.5286323, -1.955232, -3.239687, 0.282353, 1, 0, 1,
-0.5213798, -2.053353, -2.474344, 0.2784314, 1, 0, 1,
-0.5156483, -0.3439859, -2.594803, 0.2705882, 1, 0, 1,
-0.5136636, -0.09940625, -1.147846, 0.2666667, 1, 0, 1,
-0.5132453, -0.9747451, -2.427638, 0.2588235, 1, 0, 1,
-0.5127554, 0.4649469, 0.084565, 0.254902, 1, 0, 1,
-0.5113815, 2.352775, 0.0788247, 0.2470588, 1, 0, 1,
-0.5073799, 0.0309025, -3.262034, 0.2431373, 1, 0, 1,
-0.5042274, 0.5689494, -1.358491, 0.2352941, 1, 0, 1,
-0.5017446, -0.3089423, -1.547874, 0.2313726, 1, 0, 1,
-0.4955343, -0.1185194, -1.114759, 0.2235294, 1, 0, 1,
-0.4940468, 0.9386965, -1.771038, 0.2196078, 1, 0, 1,
-0.4919459, -0.2956872, -0.5765608, 0.2117647, 1, 0, 1,
-0.4883009, -0.2935482, -1.005119, 0.2078431, 1, 0, 1,
-0.4867618, -0.02474554, -0.852098, 0.2, 1, 0, 1,
-0.4855777, -0.1607817, -1.718357, 0.1921569, 1, 0, 1,
-0.4791867, -0.1862009, -3.024068, 0.1882353, 1, 0, 1,
-0.4781539, -0.4149662, -3.329468, 0.1803922, 1, 0, 1,
-0.4721574, -0.1675028, -0.0262914, 0.1764706, 1, 0, 1,
-0.4677898, -1.417823, -2.948462, 0.1686275, 1, 0, 1,
-0.4663803, -0.1692603, -1.777486, 0.1647059, 1, 0, 1,
-0.4657609, -1.388288, -3.053068, 0.1568628, 1, 0, 1,
-0.457156, 1.62238, -1.329035, 0.1529412, 1, 0, 1,
-0.4570652, -0.8533537, -2.099902, 0.145098, 1, 0, 1,
-0.4567028, -0.8554671, -0.3887965, 0.1411765, 1, 0, 1,
-0.4563422, -1.177096, -3.223236, 0.1333333, 1, 0, 1,
-0.4536065, 0.06815098, 0.162191, 0.1294118, 1, 0, 1,
-0.4535361, -0.9767945, -1.843825, 0.1215686, 1, 0, 1,
-0.4503491, 0.5405371, -1.565809, 0.1176471, 1, 0, 1,
-0.4421485, -1.537057, -4.107758, 0.1098039, 1, 0, 1,
-0.4411594, -0.9431648, -3.983893, 0.1058824, 1, 0, 1,
-0.4394926, 0.2612677, -2.364463, 0.09803922, 1, 0, 1,
-0.4393301, -2.233401, -2.473526, 0.09019608, 1, 0, 1,
-0.4371375, 0.4999904, -0.09292223, 0.08627451, 1, 0, 1,
-0.4354971, 0.4213564, 0.1685991, 0.07843138, 1, 0, 1,
-0.4354093, -1.205535, -2.907383, 0.07450981, 1, 0, 1,
-0.4324264, 0.1696819, -1.65676, 0.06666667, 1, 0, 1,
-0.4323346, -2.576688, -2.937669, 0.0627451, 1, 0, 1,
-0.425689, 0.7725504, -0.233087, 0.05490196, 1, 0, 1,
-0.4180017, -1.457809, -3.356024, 0.05098039, 1, 0, 1,
-0.4070621, 2.126442, 1.109186, 0.04313726, 1, 0, 1,
-0.4058703, 0.4951666, -1.739684, 0.03921569, 1, 0, 1,
-0.4035983, -0.482395, -3.358925, 0.03137255, 1, 0, 1,
-0.4001811, -0.5197051, -1.800159, 0.02745098, 1, 0, 1,
-0.3995697, -0.5023158, -2.79747, 0.01960784, 1, 0, 1,
-0.398951, -0.8713413, -5.055387, 0.01568628, 1, 0, 1,
-0.3987554, 0.2902749, -0.4276069, 0.007843138, 1, 0, 1,
-0.393617, 0.3028046, -0.6842188, 0.003921569, 1, 0, 1,
-0.3930264, 0.77255, -1.539642, 0, 1, 0.003921569, 1,
-0.3883135, 0.7945316, -1.659754, 0, 1, 0.01176471, 1,
-0.3866532, -0.03051038, -2.020666, 0, 1, 0.01568628, 1,
-0.3851359, 0.04320786, -2.433483, 0, 1, 0.02352941, 1,
-0.3794196, -0.5695725, -2.774307, 0, 1, 0.02745098, 1,
-0.3773113, 0.9162019, 0.04994758, 0, 1, 0.03529412, 1,
-0.3718819, 0.2305825, -1.909631, 0, 1, 0.03921569, 1,
-0.3717647, -0.6621782, -4.221057, 0, 1, 0.04705882, 1,
-0.3710207, 0.770655, -0.32661, 0, 1, 0.05098039, 1,
-0.3653804, -1.00917, -3.725373, 0, 1, 0.05882353, 1,
-0.3629828, -0.3482736, -1.833002, 0, 1, 0.0627451, 1,
-0.3621668, -0.008794733, -1.068575, 0, 1, 0.07058824, 1,
-0.3574292, -0.1842149, -3.040385, 0, 1, 0.07450981, 1,
-0.3494782, 0.7295603, 0.5661818, 0, 1, 0.08235294, 1,
-0.3489099, 1.236913, 0.3295753, 0, 1, 0.08627451, 1,
-0.3482743, 1.024788, -1.440718, 0, 1, 0.09411765, 1,
-0.3458522, 0.7651494, -0.5925279, 0, 1, 0.1019608, 1,
-0.3442553, 1.682715, 1.876631, 0, 1, 0.1058824, 1,
-0.3433742, -2.035918, -2.391689, 0, 1, 0.1137255, 1,
-0.3419833, 1.592759, 0.5987017, 0, 1, 0.1176471, 1,
-0.338948, 1.051317, -0.7148525, 0, 1, 0.1254902, 1,
-0.3364609, -0.01602625, 0.05384383, 0, 1, 0.1294118, 1,
-0.3342659, 0.4233714, 0.6908945, 0, 1, 0.1372549, 1,
-0.3325899, 1.133352, -1.373576, 0, 1, 0.1411765, 1,
-0.3324437, -1.183679, -2.22769, 0, 1, 0.1490196, 1,
-0.3304549, 0.6631841, -1.319729, 0, 1, 0.1529412, 1,
-0.3249595, -0.4407063, -2.630154, 0, 1, 0.1607843, 1,
-0.3241145, 1.286206, -0.3038689, 0, 1, 0.1647059, 1,
-0.3150769, -1.292103, -1.188841, 0, 1, 0.172549, 1,
-0.3124544, 1.030046, -1.188857, 0, 1, 0.1764706, 1,
-0.309772, -0.7214515, -3.972463, 0, 1, 0.1843137, 1,
-0.3097385, -1.822227, -2.369989, 0, 1, 0.1882353, 1,
-0.3087803, -0.2865088, -0.4780101, 0, 1, 0.1960784, 1,
-0.3020984, 1.157913, 0.4628339, 0, 1, 0.2039216, 1,
-0.3016341, -0.5382305, -2.771318, 0, 1, 0.2078431, 1,
-0.2990443, -2.859149, -2.547764, 0, 1, 0.2156863, 1,
-0.296536, 0.3268745, -0.4002572, 0, 1, 0.2196078, 1,
-0.2932793, 0.9245266, -1.617049, 0, 1, 0.227451, 1,
-0.2898988, -0.08750341, -2.042399, 0, 1, 0.2313726, 1,
-0.2895503, -0.8184988, -1.123548, 0, 1, 0.2392157, 1,
-0.2839424, -0.288963, -2.111612, 0, 1, 0.2431373, 1,
-0.2815414, -1.046629, -3.221869, 0, 1, 0.2509804, 1,
-0.2810456, -0.4157457, -2.018014, 0, 1, 0.254902, 1,
-0.2802107, -1.436241, -3.415673, 0, 1, 0.2627451, 1,
-0.2790342, -0.3046955, -1.785971, 0, 1, 0.2666667, 1,
-0.2784372, -1.618013, -3.243065, 0, 1, 0.2745098, 1,
-0.2674282, -0.9702693, -3.449486, 0, 1, 0.2784314, 1,
-0.2663996, -0.9881999, -3.007041, 0, 1, 0.2862745, 1,
-0.2619586, 0.7589822, -1.681908, 0, 1, 0.2901961, 1,
-0.2607886, 1.387847, -2.560983, 0, 1, 0.2980392, 1,
-0.2588123, -0.01930746, -2.860404, 0, 1, 0.3058824, 1,
-0.2587392, 2.205408, 0.378676, 0, 1, 0.3098039, 1,
-0.2585319, 0.8387287, -2.211903, 0, 1, 0.3176471, 1,
-0.2582166, -1.023195, -1.846869, 0, 1, 0.3215686, 1,
-0.2576478, -1.865104, -1.973886, 0, 1, 0.3294118, 1,
-0.2571241, 0.01451369, -1.590605, 0, 1, 0.3333333, 1,
-0.2535432, -0.9612368, -3.609623, 0, 1, 0.3411765, 1,
-0.2492554, 0.5259497, 0.502019, 0, 1, 0.345098, 1,
-0.2487627, 1.183509, 0.6380829, 0, 1, 0.3529412, 1,
-0.2469892, 0.3325473, -2.26188, 0, 1, 0.3568628, 1,
-0.2468284, 0.8239452, -1.280996, 0, 1, 0.3647059, 1,
-0.2464796, -1.216913, -1.960876, 0, 1, 0.3686275, 1,
-0.2454679, -0.9481847, -1.008787, 0, 1, 0.3764706, 1,
-0.2449763, 1.303662, 1.282915, 0, 1, 0.3803922, 1,
-0.2438526, 1.61313, 0.7704857, 0, 1, 0.3882353, 1,
-0.2396069, 0.02707066, -2.535686, 0, 1, 0.3921569, 1,
-0.233011, 0.9574983, 2.306298, 0, 1, 0.4, 1,
-0.2314919, -0.2314687, -0.1727733, 0, 1, 0.4078431, 1,
-0.2314338, -0.01768577, -1.120051, 0, 1, 0.4117647, 1,
-0.2264083, 0.1569549, 1.898173, 0, 1, 0.4196078, 1,
-0.2244146, -0.9396374, 0.07701642, 0, 1, 0.4235294, 1,
-0.2176998, 0.04353078, -2.997407, 0, 1, 0.4313726, 1,
-0.2158801, 1.647657, -0.166617, 0, 1, 0.4352941, 1,
-0.2127745, 1.477536, 0.693446, 0, 1, 0.4431373, 1,
-0.2096742, -0.8615702, -3.392673, 0, 1, 0.4470588, 1,
-0.2062361, 2.121364, 0.84863, 0, 1, 0.454902, 1,
-0.2044144, -0.01895258, -1.993077, 0, 1, 0.4588235, 1,
-0.203861, 0.1002638, -2.95587, 0, 1, 0.4666667, 1,
-0.2037385, 1.101534, 0.3413667, 0, 1, 0.4705882, 1,
-0.2023707, 0.1671309, -1.295559, 0, 1, 0.4784314, 1,
-0.1993238, -0.2989584, -1.178504, 0, 1, 0.4823529, 1,
-0.1902199, -2.04198, -4.060904, 0, 1, 0.4901961, 1,
-0.1901539, 0.3888389, 1.860717, 0, 1, 0.4941176, 1,
-0.1877072, -1.616938, -3.16745, 0, 1, 0.5019608, 1,
-0.183342, -1.677674, -3.711657, 0, 1, 0.509804, 1,
-0.1670681, 1.429344, 0.4782219, 0, 1, 0.5137255, 1,
-0.1659055, -0.8148651, -3.94309, 0, 1, 0.5215687, 1,
-0.1611003, 0.8895673, -0.01504707, 0, 1, 0.5254902, 1,
-0.1594286, -0.3574867, -1.906591, 0, 1, 0.5333334, 1,
-0.1577422, -0.3917347, -2.561566, 0, 1, 0.5372549, 1,
-0.157027, -2.312397, -3.1794, 0, 1, 0.5450981, 1,
-0.1551668, -0.6753286, -1.992424, 0, 1, 0.5490196, 1,
-0.1549287, -1.633829, -4.175037, 0, 1, 0.5568628, 1,
-0.1541584, 0.6420581, -0.1749347, 0, 1, 0.5607843, 1,
-0.1508228, 0.0503694, -1.86461, 0, 1, 0.5686275, 1,
-0.1474963, -1.344774, -2.456052, 0, 1, 0.572549, 1,
-0.1443334, 0.1124419, -0.3268979, 0, 1, 0.5803922, 1,
-0.1422877, 0.322621, -0.7714821, 0, 1, 0.5843138, 1,
-0.1388129, -0.7227827, -3.498211, 0, 1, 0.5921569, 1,
-0.1364832, -0.6272085, -2.814177, 0, 1, 0.5960785, 1,
-0.1361678, 0.6397239, 2.268284, 0, 1, 0.6039216, 1,
-0.133792, 1.777204, -0.3468945, 0, 1, 0.6117647, 1,
-0.125488, -0.3388191, -3.857617, 0, 1, 0.6156863, 1,
-0.1230316, -1.882211, -4.66322, 0, 1, 0.6235294, 1,
-0.1209966, 0.6245193, -0.5051544, 0, 1, 0.627451, 1,
-0.119643, -0.7523468, -2.665306, 0, 1, 0.6352941, 1,
-0.1164575, 0.4360057, -0.8449955, 0, 1, 0.6392157, 1,
-0.1123767, -0.7936245, -3.970691, 0, 1, 0.6470588, 1,
-0.1077926, -0.3332871, -3.089181, 0, 1, 0.6509804, 1,
-0.1034787, -1.185354, -4.475434, 0, 1, 0.6588235, 1,
-0.1010088, -0.5630111, -3.640597, 0, 1, 0.6627451, 1,
-0.1007814, -1.62534, -2.431756, 0, 1, 0.6705883, 1,
-0.09964282, -0.7718845, -2.032533, 0, 1, 0.6745098, 1,
-0.09523069, -0.02934355, -1.880099, 0, 1, 0.682353, 1,
-0.09256571, 0.2920752, -0.5320622, 0, 1, 0.6862745, 1,
-0.09220499, 1.971464, 0.2794102, 0, 1, 0.6941177, 1,
-0.0911985, 0.2035382, -1.141108, 0, 1, 0.7019608, 1,
-0.08747721, 1.524248, -0.9865964, 0, 1, 0.7058824, 1,
-0.08656595, -0.2691422, -2.163325, 0, 1, 0.7137255, 1,
-0.08622955, 0.3355963, -0.5454464, 0, 1, 0.7176471, 1,
-0.07916905, 0.1030411, -1.052927, 0, 1, 0.7254902, 1,
-0.07166899, 1.637294, 0.01679041, 0, 1, 0.7294118, 1,
-0.06870509, -0.4717032, -1.846595, 0, 1, 0.7372549, 1,
-0.06726337, -0.6627423, -2.556965, 0, 1, 0.7411765, 1,
-0.06550808, -0.7412476, -3.795446, 0, 1, 0.7490196, 1,
-0.06411081, -1.375105, -3.915279, 0, 1, 0.7529412, 1,
-0.05949377, -0.2398619, -2.658811, 0, 1, 0.7607843, 1,
-0.05773989, 2.014954, -0.8136683, 0, 1, 0.7647059, 1,
-0.05544459, -1.51955, -1.846234, 0, 1, 0.772549, 1,
-0.05389326, 0.6093664, 0.7843722, 0, 1, 0.7764706, 1,
-0.05251484, -0.6745911, -2.798804, 0, 1, 0.7843137, 1,
-0.04989588, -0.1817497, -0.9999972, 0, 1, 0.7882353, 1,
-0.04521369, -1.147701, -2.969936, 0, 1, 0.7960784, 1,
-0.04308012, 0.352677, -0.3285418, 0, 1, 0.8039216, 1,
-0.03963032, 0.7720748, -1.957722, 0, 1, 0.8078431, 1,
-0.03919821, 0.5487043, 2.224974, 0, 1, 0.8156863, 1,
-0.03880973, -0.3527308, -3.242767, 0, 1, 0.8196079, 1,
-0.03786109, -0.4828357, -1.718537, 0, 1, 0.827451, 1,
-0.03701528, -0.1600142, -4.058937, 0, 1, 0.8313726, 1,
-0.03590515, 0.533071, 0.3125252, 0, 1, 0.8392157, 1,
-0.03568674, -0.3106351, -2.938293, 0, 1, 0.8431373, 1,
-0.03524866, 1.260954, -2.448173, 0, 1, 0.8509804, 1,
-0.03224184, -0.9535632, -4.182574, 0, 1, 0.854902, 1,
-0.02876018, -1.091489, -3.872707, 0, 1, 0.8627451, 1,
-0.02844102, 0.5144815, -0.1649475, 0, 1, 0.8666667, 1,
-0.0279892, -1.113918, -2.779036, 0, 1, 0.8745098, 1,
-0.02707528, -0.8997903, -1.797815, 0, 1, 0.8784314, 1,
-0.02538318, -0.9134663, -3.141706, 0, 1, 0.8862745, 1,
-0.02355696, -0.03445816, -3.281934, 0, 1, 0.8901961, 1,
-0.01516489, 0.6342547, -1.06525, 0, 1, 0.8980392, 1,
-0.01183743, 1.512842, -0.8837656, 0, 1, 0.9058824, 1,
-0.01101701, 1.683261, 0.01836416, 0, 1, 0.9098039, 1,
-0.008537808, 0.484874, 1.146113, 0, 1, 0.9176471, 1,
-0.008209749, 0.8344868, 0.8937068, 0, 1, 0.9215686, 1,
-0.002488865, 0.2168624, 0.469342, 0, 1, 0.9294118, 1,
0.001453676, -0.3018129, 1.870224, 0, 1, 0.9333333, 1,
0.002298869, -0.4380096, 4.257423, 0, 1, 0.9411765, 1,
0.004466819, 1.768766, -2.311286, 0, 1, 0.945098, 1,
0.004674674, 0.5793048, -0.2708946, 0, 1, 0.9529412, 1,
0.007806043, 2.829314, -0.9876133, 0, 1, 0.9568627, 1,
0.009346681, 0.5907863, 0.4024712, 0, 1, 0.9647059, 1,
0.009958627, -0.2775745, 3.888068, 0, 1, 0.9686275, 1,
0.01725491, -1.815828, 2.177529, 0, 1, 0.9764706, 1,
0.0196874, -0.06992158, 3.141342, 0, 1, 0.9803922, 1,
0.02330321, -1.109691, 2.793179, 0, 1, 0.9882353, 1,
0.02449943, -0.4039685, 3.249736, 0, 1, 0.9921569, 1,
0.0279149, 0.3761468, 1.140691, 0, 1, 1, 1,
0.02818872, -0.2292835, 3.917313, 0, 0.9921569, 1, 1,
0.03047685, -0.4075893, 1.510145, 0, 0.9882353, 1, 1,
0.03147792, -0.3667613, 2.781157, 0, 0.9803922, 1, 1,
0.03376943, 0.3079671, -0.4343979, 0, 0.9764706, 1, 1,
0.03644264, -0.06494142, 1.656317, 0, 0.9686275, 1, 1,
0.03656508, -0.008237344, 0.9427293, 0, 0.9647059, 1, 1,
0.03714616, -1.362151, 3.346881, 0, 0.9568627, 1, 1,
0.03783206, -0.5170081, 2.169083, 0, 0.9529412, 1, 1,
0.04013404, -1.7892, 2.011481, 0, 0.945098, 1, 1,
0.04146769, -0.7250012, 4.057345, 0, 0.9411765, 1, 1,
0.04226347, -0.9096257, 2.953168, 0, 0.9333333, 1, 1,
0.04263549, 1.476614, -0.6112865, 0, 0.9294118, 1, 1,
0.04459639, 0.9050226, 0.308678, 0, 0.9215686, 1, 1,
0.04464437, 0.08355349, 0.681685, 0, 0.9176471, 1, 1,
0.04546501, 1.830906, 2.105713, 0, 0.9098039, 1, 1,
0.04759511, 0.4672399, 1.534448, 0, 0.9058824, 1, 1,
0.05125425, -0.7130457, 2.406275, 0, 0.8980392, 1, 1,
0.05133158, 2.081606, -1.501916, 0, 0.8901961, 1, 1,
0.05230894, 0.2486275, -1.481396, 0, 0.8862745, 1, 1,
0.05512648, -0.2433932, 2.892462, 0, 0.8784314, 1, 1,
0.05918713, 0.5275858, 0.5874125, 0, 0.8745098, 1, 1,
0.06589206, 0.1813608, 0.4144689, 0, 0.8666667, 1, 1,
0.0681769, 0.9759101, -0.3753192, 0, 0.8627451, 1, 1,
0.07171224, 0.3888364, -0.7421523, 0, 0.854902, 1, 1,
0.07533021, 1.557585, -1.347639, 0, 0.8509804, 1, 1,
0.0781188, 0.1904459, 0.6004252, 0, 0.8431373, 1, 1,
0.08245402, 0.6128677, 0.09523429, 0, 0.8392157, 1, 1,
0.08670751, -0.9276488, 2.318027, 0, 0.8313726, 1, 1,
0.08788269, -0.4716035, 4.530019, 0, 0.827451, 1, 1,
0.08877032, 1.791313, 0.02349964, 0, 0.8196079, 1, 1,
0.08978866, -0.09647009, 2.676231, 0, 0.8156863, 1, 1,
0.09397842, -0.524706, 2.742204, 0, 0.8078431, 1, 1,
0.09410802, -0.5963809, 4.641947, 0, 0.8039216, 1, 1,
0.09496001, -0.7008355, 3.101188, 0, 0.7960784, 1, 1,
0.09584943, 1.346061, -1.028027, 0, 0.7882353, 1, 1,
0.100708, 0.01226154, 0.2568725, 0, 0.7843137, 1, 1,
0.1042474, 0.7132629, 0.9926307, 0, 0.7764706, 1, 1,
0.1046405, 1.317158, -0.8380492, 0, 0.772549, 1, 1,
0.1069695, -0.1078447, 1.032279, 0, 0.7647059, 1, 1,
0.111925, 1.114465, 0.507822, 0, 0.7607843, 1, 1,
0.1131324, 0.05838032, 2.051092, 0, 0.7529412, 1, 1,
0.1143344, 0.5546389, 0.1248306, 0, 0.7490196, 1, 1,
0.1168346, 0.2476662, 0.8593146, 0, 0.7411765, 1, 1,
0.1183324, -0.5892919, 4.369463, 0, 0.7372549, 1, 1,
0.1187321, 1.340099, -0.4901393, 0, 0.7294118, 1, 1,
0.1198044, -1.200968, 3.875304, 0, 0.7254902, 1, 1,
0.120652, -0.0417131, 0.9151113, 0, 0.7176471, 1, 1,
0.123793, 0.02518095, -0.3393382, 0, 0.7137255, 1, 1,
0.1240627, -0.4938076, 3.233448, 0, 0.7058824, 1, 1,
0.1263189, -1.524178, 2.333792, 0, 0.6980392, 1, 1,
0.1295501, -0.1299789, 1.188176, 0, 0.6941177, 1, 1,
0.1303323, -0.1300519, 3.899544, 0, 0.6862745, 1, 1,
0.1334317, -0.4118255, 4.325697, 0, 0.682353, 1, 1,
0.1380185, 1.735876, 0.1300464, 0, 0.6745098, 1, 1,
0.1434726, -1.198887, 2.066422, 0, 0.6705883, 1, 1,
0.1525946, -0.145141, 2.456227, 0, 0.6627451, 1, 1,
0.1558346, -0.8253555, 3.38517, 0, 0.6588235, 1, 1,
0.1606304, -0.07191676, 1.084726, 0, 0.6509804, 1, 1,
0.1625637, -0.8274361, 3.792491, 0, 0.6470588, 1, 1,
0.1644134, 0.01143092, -0.1000482, 0, 0.6392157, 1, 1,
0.1649319, 0.7859351, 0.2810321, 0, 0.6352941, 1, 1,
0.1680785, 0.9779647, 0.4974652, 0, 0.627451, 1, 1,
0.1692571, -0.5903405, 2.827958, 0, 0.6235294, 1, 1,
0.1717804, -0.5851064, 2.726352, 0, 0.6156863, 1, 1,
0.1720859, -0.5183992, 3.668257, 0, 0.6117647, 1, 1,
0.1732139, 0.343085, 0.4639977, 0, 0.6039216, 1, 1,
0.1826325, 0.2277152, 0.8439983, 0, 0.5960785, 1, 1,
0.1857374, -0.3665788, 2.946049, 0, 0.5921569, 1, 1,
0.1877901, 0.3465346, 1.513843, 0, 0.5843138, 1, 1,
0.1888042, -0.8997135, 1.586261, 0, 0.5803922, 1, 1,
0.1942239, -1.062961, 2.753588, 0, 0.572549, 1, 1,
0.1969733, 0.2662058, 0.6225483, 0, 0.5686275, 1, 1,
0.1969797, 1.400461, 1.028863, 0, 0.5607843, 1, 1,
0.1984172, 0.6001788, 0.4262151, 0, 0.5568628, 1, 1,
0.2026492, -2.342553, 2.973753, 0, 0.5490196, 1, 1,
0.2027489, 0.673476, 0.09890762, 0, 0.5450981, 1, 1,
0.2044565, -1.498348, 1.786826, 0, 0.5372549, 1, 1,
0.206603, 0.5855829, -0.3600444, 0, 0.5333334, 1, 1,
0.2091101, 0.672356, 1.05094, 0, 0.5254902, 1, 1,
0.2114006, -0.614839, 1.787633, 0, 0.5215687, 1, 1,
0.2146246, 0.3608534, -0.5450894, 0, 0.5137255, 1, 1,
0.2146393, -0.2143106, 2.084667, 0, 0.509804, 1, 1,
0.2171355, -0.3905186, 2.475042, 0, 0.5019608, 1, 1,
0.2237156, 1.209322, -1.05922, 0, 0.4941176, 1, 1,
0.2265648, 0.6849571, -0.2645705, 0, 0.4901961, 1, 1,
0.229054, 0.7737511, -0.621567, 0, 0.4823529, 1, 1,
0.2355088, 0.1555885, 0.9871328, 0, 0.4784314, 1, 1,
0.2363043, 0.2180209, 1.639656, 0, 0.4705882, 1, 1,
0.2388894, 1.089136, 0.9515404, 0, 0.4666667, 1, 1,
0.2388988, -0.1042047, 1.241444, 0, 0.4588235, 1, 1,
0.2395857, -0.2865986, 2.04918, 0, 0.454902, 1, 1,
0.2429291, -0.2418795, 3.608494, 0, 0.4470588, 1, 1,
0.2445389, 0.6962481, -0.6818306, 0, 0.4431373, 1, 1,
0.2456967, 0.7256736, -0.5605386, 0, 0.4352941, 1, 1,
0.2458405, 1.426226, -1.052023, 0, 0.4313726, 1, 1,
0.2518142, -0.09534457, 2.52265, 0, 0.4235294, 1, 1,
0.2563318, -0.7405339, 2.499118, 0, 0.4196078, 1, 1,
0.258399, 1.391498, -0.1610402, 0, 0.4117647, 1, 1,
0.2684353, 0.1305092, 1.0084, 0, 0.4078431, 1, 1,
0.2712414, 1.558537, 0.3707538, 0, 0.4, 1, 1,
0.2720222, 1.295976, -1.309673, 0, 0.3921569, 1, 1,
0.2738422, 1.104721, -0.1331983, 0, 0.3882353, 1, 1,
0.2804086, 0.8001875, -1.240685, 0, 0.3803922, 1, 1,
0.2811966, 0.6228658, -2.404202, 0, 0.3764706, 1, 1,
0.2817495, 0.05066176, 3.457813, 0, 0.3686275, 1, 1,
0.2844391, -1.569565, 4.232493, 0, 0.3647059, 1, 1,
0.2855332, -0.1634184, 0.8222851, 0, 0.3568628, 1, 1,
0.2874756, 1.650224, -0.5214358, 0, 0.3529412, 1, 1,
0.2886839, -0.826914, 3.177288, 0, 0.345098, 1, 1,
0.2891994, 2.420187, -0.4797339, 0, 0.3411765, 1, 1,
0.2912838, -0.423402, 2.735176, 0, 0.3333333, 1, 1,
0.2923615, 0.08181188, 2.7307, 0, 0.3294118, 1, 1,
0.2945227, -2.962641, 3.74825, 0, 0.3215686, 1, 1,
0.3021953, -2.02756, 2.57742, 0, 0.3176471, 1, 1,
0.3053667, -2.39889, 2.449641, 0, 0.3098039, 1, 1,
0.3059241, 0.2278702, 0.8942585, 0, 0.3058824, 1, 1,
0.309907, -1.129999, 2.988857, 0, 0.2980392, 1, 1,
0.324281, -0.4616883, 1.484861, 0, 0.2901961, 1, 1,
0.3245676, -0.6249894, 2.58237, 0, 0.2862745, 1, 1,
0.3249267, -1.206845, 2.267244, 0, 0.2784314, 1, 1,
0.3284358, -0.002683214, 0.5875148, 0, 0.2745098, 1, 1,
0.3337326, 0.4451531, 1.724199, 0, 0.2666667, 1, 1,
0.3387468, -0.2250519, 1.176642, 0, 0.2627451, 1, 1,
0.3408949, 0.2690598, 1.745713, 0, 0.254902, 1, 1,
0.3438953, 0.7084395, -1.365255, 0, 0.2509804, 1, 1,
0.3472246, 0.9488651, -0.4591449, 0, 0.2431373, 1, 1,
0.3520854, -0.289066, 1.287026, 0, 0.2392157, 1, 1,
0.3523849, -0.3703346, 2.434544, 0, 0.2313726, 1, 1,
0.3540372, -0.1035867, 0.5278901, 0, 0.227451, 1, 1,
0.355238, 0.004331617, 3.018495, 0, 0.2196078, 1, 1,
0.3555059, -1.651856, 2.760156, 0, 0.2156863, 1, 1,
0.3621793, 0.7083673, 0.3821186, 0, 0.2078431, 1, 1,
0.362341, 0.2380628, 1.06949, 0, 0.2039216, 1, 1,
0.3634741, 1.335299, 1.294565, 0, 0.1960784, 1, 1,
0.3638546, -0.6579574, 1.99455, 0, 0.1882353, 1, 1,
0.3670524, 0.7149525, 0.9585812, 0, 0.1843137, 1, 1,
0.3673626, -0.5756161, 4.247533, 0, 0.1764706, 1, 1,
0.3710769, -0.4984303, 3.776325, 0, 0.172549, 1, 1,
0.3748059, 0.9346577, -0.700919, 0, 0.1647059, 1, 1,
0.374819, -0.4705752, 0.5118346, 0, 0.1607843, 1, 1,
0.3778954, 0.6649083, 0.1442135, 0, 0.1529412, 1, 1,
0.3840147, 0.9394189, 0.9896401, 0, 0.1490196, 1, 1,
0.3853907, -1.162842, 2.792037, 0, 0.1411765, 1, 1,
0.3858486, 0.5198953, 2.791125, 0, 0.1372549, 1, 1,
0.3878936, 0.6201301, 1.104203, 0, 0.1294118, 1, 1,
0.3933294, -1.544246, 3.152297, 0, 0.1254902, 1, 1,
0.3949537, -1.182707, 3.767395, 0, 0.1176471, 1, 1,
0.403733, -0.06767031, 1.341292, 0, 0.1137255, 1, 1,
0.4047419, 0.216917, -0.6956965, 0, 0.1058824, 1, 1,
0.4047476, 0.8022485, -0.06387492, 0, 0.09803922, 1, 1,
0.4072413, 0.02949187, 2.634666, 0, 0.09411765, 1, 1,
0.4136279, 0.5657524, 0.9174084, 0, 0.08627451, 1, 1,
0.4142995, 0.7105412, 2.184286, 0, 0.08235294, 1, 1,
0.4149754, 2.301666, -0.07389213, 0, 0.07450981, 1, 1,
0.4194331, 0.4852138, 2.171196, 0, 0.07058824, 1, 1,
0.4194537, -0.4618442, 2.948352, 0, 0.0627451, 1, 1,
0.4268738, 0.7192482, 2.406436, 0, 0.05882353, 1, 1,
0.4274352, -1.59492, 4.233819, 0, 0.05098039, 1, 1,
0.433994, -1.02439, 1.907512, 0, 0.04705882, 1, 1,
0.4368331, 0.6045672, 2.139856, 0, 0.03921569, 1, 1,
0.4377479, 1.09157, 1.238873, 0, 0.03529412, 1, 1,
0.4399416, -0.02969346, 2.208136, 0, 0.02745098, 1, 1,
0.4420618, 0.6146818, -1.113727, 0, 0.02352941, 1, 1,
0.4441999, 0.8865261, 0.2750938, 0, 0.01568628, 1, 1,
0.4478946, -0.2092256, 1.393397, 0, 0.01176471, 1, 1,
0.4488781, 0.07304557, 1.201746, 0, 0.003921569, 1, 1,
0.4541743, 0.0269829, 0.4231486, 0.003921569, 0, 1, 1,
0.4554833, 0.3106572, 1.607252, 0.007843138, 0, 1, 1,
0.4570883, -0.6512693, 2.858421, 0.01568628, 0, 1, 1,
0.4580424, -0.5817306, 3.494134, 0.01960784, 0, 1, 1,
0.458688, -1.167551, 2.840364, 0.02745098, 0, 1, 1,
0.4606941, -0.9566015, 0.858067, 0.03137255, 0, 1, 1,
0.4662524, 2.287443, -0.02538681, 0.03921569, 0, 1, 1,
0.467525, -1.709647, 1.651583, 0.04313726, 0, 1, 1,
0.4683286, -0.4576823, 2.398999, 0.05098039, 0, 1, 1,
0.4698871, 0.4237565, 0.2545845, 0.05490196, 0, 1, 1,
0.4732914, 0.7503098, -0.2151411, 0.0627451, 0, 1, 1,
0.4737967, 0.6620685, 0.2574135, 0.06666667, 0, 1, 1,
0.4738116, -0.3517036, 1.081563, 0.07450981, 0, 1, 1,
0.4793546, -1.081905, 1.412916, 0.07843138, 0, 1, 1,
0.4824794, -0.2371253, 0.7148107, 0.08627451, 0, 1, 1,
0.4867552, 0.4439896, -0.2883928, 0.09019608, 0, 1, 1,
0.4974691, -0.6218575, 1.147601, 0.09803922, 0, 1, 1,
0.4989614, -0.7065023, 1.408585, 0.1058824, 0, 1, 1,
0.5049769, -0.1957464, 0.4820686, 0.1098039, 0, 1, 1,
0.5056182, -0.7626034, 3.729954, 0.1176471, 0, 1, 1,
0.5083076, -1.247122, 1.14987, 0.1215686, 0, 1, 1,
0.522508, 0.4217268, -0.0401107, 0.1294118, 0, 1, 1,
0.5228335, -2.375826, 4.307248, 0.1333333, 0, 1, 1,
0.5267748, -0.6035749, 4.083467, 0.1411765, 0, 1, 1,
0.5274209, 0.4955715, -0.02762996, 0.145098, 0, 1, 1,
0.5289197, 1.974851, -2.404391, 0.1529412, 0, 1, 1,
0.5296255, -0.1734072, 1.631223, 0.1568628, 0, 1, 1,
0.5308014, 0.7903792, 0.371989, 0.1647059, 0, 1, 1,
0.5350055, -0.9135156, 2.020911, 0.1686275, 0, 1, 1,
0.5358514, -1.299281, 2.212539, 0.1764706, 0, 1, 1,
0.5360808, -1.616341, 2.931554, 0.1803922, 0, 1, 1,
0.5366315, 0.8966832, 1.363113, 0.1882353, 0, 1, 1,
0.5424595, 2.247516, 0.7276402, 0.1921569, 0, 1, 1,
0.5526294, 1.526652, 0.3832467, 0.2, 0, 1, 1,
0.5529471, 0.3535103, -0.204104, 0.2078431, 0, 1, 1,
0.5542474, -0.6654217, 2.596769, 0.2117647, 0, 1, 1,
0.5566736, 1.271815, 0.6122414, 0.2196078, 0, 1, 1,
0.5596005, 1.35464, 1.165624, 0.2235294, 0, 1, 1,
0.5604638, 1.117467, 1.043421, 0.2313726, 0, 1, 1,
0.5677952, -1.125308, 2.543551, 0.2352941, 0, 1, 1,
0.5772502, 0.1929203, 1.413331, 0.2431373, 0, 1, 1,
0.5896858, -0.7128556, 2.447795, 0.2470588, 0, 1, 1,
0.5935762, 0.03815811, 1.259898, 0.254902, 0, 1, 1,
0.5978459, 1.564283, -2.186058, 0.2588235, 0, 1, 1,
0.6012781, 1.322014, -0.2089902, 0.2666667, 0, 1, 1,
0.6125146, 0.9026589, 2.054427, 0.2705882, 0, 1, 1,
0.6126643, 0.1994148, 1.713587, 0.2784314, 0, 1, 1,
0.6126699, 1.345235, 0.3422039, 0.282353, 0, 1, 1,
0.6160278, -1.053235, 1.926023, 0.2901961, 0, 1, 1,
0.6170328, -0.6078005, 2.476702, 0.2941177, 0, 1, 1,
0.6173922, 2.148128, -1.525733, 0.3019608, 0, 1, 1,
0.6193969, -0.4890441, 4.418825, 0.3098039, 0, 1, 1,
0.6227245, 1.101044, -0.8466775, 0.3137255, 0, 1, 1,
0.6259687, 1.78167, 2.241086, 0.3215686, 0, 1, 1,
0.6276785, 0.2356663, 1.051835, 0.3254902, 0, 1, 1,
0.6322762, -1.208471, 4.779768, 0.3333333, 0, 1, 1,
0.6358009, 0.9077301, 1.486354, 0.3372549, 0, 1, 1,
0.6402454, 0.3964941, -0.5673131, 0.345098, 0, 1, 1,
0.6457458, -0.1135169, 1.860679, 0.3490196, 0, 1, 1,
0.6520901, 0.5924423, 0.5803522, 0.3568628, 0, 1, 1,
0.6600778, -1.575998, 3.791884, 0.3607843, 0, 1, 1,
0.6603649, 0.1460608, 0.2179735, 0.3686275, 0, 1, 1,
0.6608603, 0.7029749, 0.4275748, 0.372549, 0, 1, 1,
0.6622937, 1.443564, -1.413548, 0.3803922, 0, 1, 1,
0.6629007, -1.959054, 4.012997, 0.3843137, 0, 1, 1,
0.663353, 0.3681645, 0.7481586, 0.3921569, 0, 1, 1,
0.6651403, 0.2336449, 2.549316, 0.3960784, 0, 1, 1,
0.665888, -0.1149245, 1.797202, 0.4039216, 0, 1, 1,
0.66706, 0.3204415, 0.4752056, 0.4117647, 0, 1, 1,
0.6672405, -2.124949, 1.494877, 0.4156863, 0, 1, 1,
0.6686077, 0.3677016, 2.261806, 0.4235294, 0, 1, 1,
0.6810007, -0.1454444, 1.805668, 0.427451, 0, 1, 1,
0.6827492, -0.09957787, 1.456553, 0.4352941, 0, 1, 1,
0.6860809, -0.5867115, 1.203558, 0.4392157, 0, 1, 1,
0.6867436, -1.255011, 2.459953, 0.4470588, 0, 1, 1,
0.6894893, 0.05133597, 2.213605, 0.4509804, 0, 1, 1,
0.6943612, -0.4217584, -0.2747407, 0.4588235, 0, 1, 1,
0.6950582, -1.47542, 4.056669, 0.4627451, 0, 1, 1,
0.6953599, 1.100364, 2.662741, 0.4705882, 0, 1, 1,
0.6975234, 0.02792098, 2.097847, 0.4745098, 0, 1, 1,
0.6985426, -0.8098961, 1.330623, 0.4823529, 0, 1, 1,
0.7029555, -1.228601, 2.20918, 0.4862745, 0, 1, 1,
0.7134193, 0.721381, 0.3030689, 0.4941176, 0, 1, 1,
0.7147814, 1.471685, -0.8073666, 0.5019608, 0, 1, 1,
0.7183145, 0.9628064, 0.6921291, 0.5058824, 0, 1, 1,
0.7250385, -0.3544627, 4.078225, 0.5137255, 0, 1, 1,
0.7253534, -0.5075636, 3.439662, 0.5176471, 0, 1, 1,
0.7270138, -1.523618, 2.091286, 0.5254902, 0, 1, 1,
0.7446227, 0.2358915, 0.9269759, 0.5294118, 0, 1, 1,
0.7495101, -0.450672, 1.038422, 0.5372549, 0, 1, 1,
0.7498937, 0.4069212, 1.901482, 0.5411765, 0, 1, 1,
0.7505479, 2.630926, -0.3387748, 0.5490196, 0, 1, 1,
0.7620233, -0.9564263, 2.295271, 0.5529412, 0, 1, 1,
0.7631672, 0.6086087, -0.4135178, 0.5607843, 0, 1, 1,
0.7707119, 1.022745, 1.022891, 0.5647059, 0, 1, 1,
0.7721909, -1.864255, 3.391627, 0.572549, 0, 1, 1,
0.7748546, -0.1908114, 0.9136313, 0.5764706, 0, 1, 1,
0.782343, -0.08207979, 1.616125, 0.5843138, 0, 1, 1,
0.78679, 0.1867307, 2.113863, 0.5882353, 0, 1, 1,
0.7881314, 0.9083217, 1.168865, 0.5960785, 0, 1, 1,
0.7927131, 0.2241481, 1.95565, 0.6039216, 0, 1, 1,
0.7928721, -0.4450994, 1.928083, 0.6078432, 0, 1, 1,
0.793287, 0.6151096, -0.5783335, 0.6156863, 0, 1, 1,
0.7950625, -1.227007, 3.301559, 0.6196079, 0, 1, 1,
0.7985666, 1.320042, -0.3218821, 0.627451, 0, 1, 1,
0.8002146, -1.007689, 1.626971, 0.6313726, 0, 1, 1,
0.8072196, 0.3113082, 1.10164, 0.6392157, 0, 1, 1,
0.8087041, 0.7534263, 2.17168, 0.6431373, 0, 1, 1,
0.8113214, -1.844314, 2.580461, 0.6509804, 0, 1, 1,
0.8158346, -0.4191795, 2.595202, 0.654902, 0, 1, 1,
0.8185766, 0.7173916, 0.4377763, 0.6627451, 0, 1, 1,
0.8249949, 1.019691, 1.205183, 0.6666667, 0, 1, 1,
0.8292436, 0.0934578, 2.49028, 0.6745098, 0, 1, 1,
0.8310763, -0.6105386, 5.874522, 0.6784314, 0, 1, 1,
0.8314599, -0.9062062, 2.253116, 0.6862745, 0, 1, 1,
0.8334679, -1.101307, 3.604798, 0.6901961, 0, 1, 1,
0.8341453, -1.470589, 2.00869, 0.6980392, 0, 1, 1,
0.8344762, 1.481429, 0.7589928, 0.7058824, 0, 1, 1,
0.8360404, -0.2287243, 2.221052, 0.7098039, 0, 1, 1,
0.8367287, -1.082337, 1.970905, 0.7176471, 0, 1, 1,
0.8395692, 0.44808, -0.1430133, 0.7215686, 0, 1, 1,
0.8461606, -0.05118651, 2.663085, 0.7294118, 0, 1, 1,
0.8471437, 0.0003112805, 1.631914, 0.7333333, 0, 1, 1,
0.848353, -0.7248239, 2.539825, 0.7411765, 0, 1, 1,
0.8523225, -0.472404, 3.104885, 0.7450981, 0, 1, 1,
0.854305, 0.5343027, 1.379729, 0.7529412, 0, 1, 1,
0.8547031, 1.171398, 3.061904, 0.7568628, 0, 1, 1,
0.8572701, -1.040034, 3.822759, 0.7647059, 0, 1, 1,
0.8595938, -1.230072, 2.760914, 0.7686275, 0, 1, 1,
0.8641525, -1.321679, 4.654617, 0.7764706, 0, 1, 1,
0.866292, -0.936204, 3.204058, 0.7803922, 0, 1, 1,
0.8695295, 0.8307506, 1.58485, 0.7882353, 0, 1, 1,
0.8734836, 0.7870899, 1.728497, 0.7921569, 0, 1, 1,
0.8755857, 0.5551491, 1.208348, 0.8, 0, 1, 1,
0.8786889, -0.61995, 0.8312073, 0.8078431, 0, 1, 1,
0.8801894, -1.320232, 2.366121, 0.8117647, 0, 1, 1,
0.8812291, 0.6166952, 3.202374, 0.8196079, 0, 1, 1,
0.8819613, -0.5045148, 1.495514, 0.8235294, 0, 1, 1,
0.8951476, 1.182596, 0.5623666, 0.8313726, 0, 1, 1,
0.8991939, -0.4730839, 2.150504, 0.8352941, 0, 1, 1,
0.9013077, -2.458027, 2.999419, 0.8431373, 0, 1, 1,
0.9017956, -2.171622, 2.369176, 0.8470588, 0, 1, 1,
0.9018529, 0.2796994, 0.4468324, 0.854902, 0, 1, 1,
0.906337, 0.3581027, -0.3690316, 0.8588235, 0, 1, 1,
0.9090566, -0.937259, 0.7050809, 0.8666667, 0, 1, 1,
0.9105105, 0.9852276, 0.508121, 0.8705882, 0, 1, 1,
0.9166803, 0.06083235, 1.00902, 0.8784314, 0, 1, 1,
0.9184477, 0.7311954, 0.8431147, 0.8823529, 0, 1, 1,
0.9226598, -0.4665932, 4.132396, 0.8901961, 0, 1, 1,
0.922863, 1.685521, 1.34359, 0.8941177, 0, 1, 1,
0.9239204, -1.248816, 0.4806683, 0.9019608, 0, 1, 1,
0.9261605, 0.9983033, 0.8386559, 0.9098039, 0, 1, 1,
0.9262389, 1.249399, 0.9423034, 0.9137255, 0, 1, 1,
0.9285445, 0.06812529, 2.197628, 0.9215686, 0, 1, 1,
0.9311159, 0.2692797, 2.493935, 0.9254902, 0, 1, 1,
0.9395893, 1.551819, 0.3420491, 0.9333333, 0, 1, 1,
0.9426271, 0.9466605, -0.2649621, 0.9372549, 0, 1, 1,
0.9443581, -1.08753, 2.279717, 0.945098, 0, 1, 1,
0.945395, -0.4716474, 2.390486, 0.9490196, 0, 1, 1,
0.947305, 1.530158, 0.3012167, 0.9568627, 0, 1, 1,
0.9475498, -1.293642, 2.535085, 0.9607843, 0, 1, 1,
0.9531104, 0.03032685, 2.524671, 0.9686275, 0, 1, 1,
0.9542744, 0.9544377, 0.2234243, 0.972549, 0, 1, 1,
0.9542885, -0.270279, 0.6641212, 0.9803922, 0, 1, 1,
0.9566597, 0.5098058, 1.220179, 0.9843137, 0, 1, 1,
0.9574096, 0.1078129, -0.1991682, 0.9921569, 0, 1, 1,
0.9615713, -0.4712666, 2.497254, 0.9960784, 0, 1, 1,
0.9618917, 1.261153, 0.45273, 1, 0, 0.9960784, 1,
0.963036, 0.9478357, 0.857603, 1, 0, 0.9882353, 1,
0.9636172, 0.212308, 1.163773, 1, 0, 0.9843137, 1,
0.9710839, -0.2613738, 2.160022, 1, 0, 0.9764706, 1,
0.9750213, -0.9763103, 1.897186, 1, 0, 0.972549, 1,
0.9764276, -1.362511, 2.822928, 1, 0, 0.9647059, 1,
0.9773157, 0.1510032, 2.351829, 1, 0, 0.9607843, 1,
0.9780464, 0.5686171, 0.4593477, 1, 0, 0.9529412, 1,
0.978848, -0.9953233, 1.316301, 1, 0, 0.9490196, 1,
0.9805894, -0.5637584, 3.149197, 1, 0, 0.9411765, 1,
0.986118, 0.2347422, 0.954731, 1, 0, 0.9372549, 1,
0.9913946, -0.2057354, 3.130512, 1, 0, 0.9294118, 1,
0.9930355, -0.533118, 1.860276, 1, 0, 0.9254902, 1,
0.995793, 1.105211, 1.416772, 1, 0, 0.9176471, 1,
1.008661, 0.055597, 2.389718, 1, 0, 0.9137255, 1,
1.01088, -0.6208958, 1.364261, 1, 0, 0.9058824, 1,
1.017814, -1.487668, 4.066914, 1, 0, 0.9019608, 1,
1.02329, 0.1655416, 0.2782504, 1, 0, 0.8941177, 1,
1.024807, -1.366842, 3.70144, 1, 0, 0.8862745, 1,
1.026423, -0.5120567, 1.901602, 1, 0, 0.8823529, 1,
1.032059, 0.9503023, -0.5523099, 1, 0, 0.8745098, 1,
1.033341, 0.044636, 2.224303, 1, 0, 0.8705882, 1,
1.041667, -0.3233823, 1.333996, 1, 0, 0.8627451, 1,
1.052952, 0.2405984, 1.007631, 1, 0, 0.8588235, 1,
1.05456, 0.2432183, 1.456968, 1, 0, 0.8509804, 1,
1.055057, 1.526844, 0.6072913, 1, 0, 0.8470588, 1,
1.058941, 0.031759, 3.564793, 1, 0, 0.8392157, 1,
1.05925, -0.6726405, 3.94383, 1, 0, 0.8352941, 1,
1.064041, 0.6055875, 2.093781, 1, 0, 0.827451, 1,
1.082797, -1.750742, 2.720085, 1, 0, 0.8235294, 1,
1.085448, 0.1652474, 2.169858, 1, 0, 0.8156863, 1,
1.091665, 1.651224, 1.970585, 1, 0, 0.8117647, 1,
1.094462, -0.377809, 3.647659, 1, 0, 0.8039216, 1,
1.096923, -0.3068719, 2.255951, 1, 0, 0.7960784, 1,
1.100971, 1.088303, -0.9979045, 1, 0, 0.7921569, 1,
1.101387, -0.04756093, 1.23733, 1, 0, 0.7843137, 1,
1.10453, -1.203688, 3.055557, 1, 0, 0.7803922, 1,
1.104541, -1.23053, 3.35095, 1, 0, 0.772549, 1,
1.106936, -0.813015, 2.176831, 1, 0, 0.7686275, 1,
1.114186, 0.4364147, 1.027897, 1, 0, 0.7607843, 1,
1.117236, -0.9116659, 1.301794, 1, 0, 0.7568628, 1,
1.12343, 0.1672018, 0.2033264, 1, 0, 0.7490196, 1,
1.125023, 0.08612207, 1.040279, 1, 0, 0.7450981, 1,
1.14477, 0.205334, 4.57388, 1, 0, 0.7372549, 1,
1.149216, -2.563795, 1.781616, 1, 0, 0.7333333, 1,
1.149327, 0.01658249, 0.9958928, 1, 0, 0.7254902, 1,
1.152416, -0.4389272, 0.159762, 1, 0, 0.7215686, 1,
1.157513, 0.3651778, 0.8780787, 1, 0, 0.7137255, 1,
1.166991, 0.8727961, -0.4530287, 1, 0, 0.7098039, 1,
1.170201, -0.5966086, 2.652137, 1, 0, 0.7019608, 1,
1.171518, -0.4176825, 2.868725, 1, 0, 0.6941177, 1,
1.176006, 1.507272, 0.4540133, 1, 0, 0.6901961, 1,
1.176169, 0.3855847, 0.04802867, 1, 0, 0.682353, 1,
1.194356, -2.687912, 4.022077, 1, 0, 0.6784314, 1,
1.200983, 0.1372661, 1.478313, 1, 0, 0.6705883, 1,
1.201993, 0.5039771, 0.9299671, 1, 0, 0.6666667, 1,
1.20877, 0.6244115, 2.649482, 1, 0, 0.6588235, 1,
1.21042, 0.4506041, 0.595073, 1, 0, 0.654902, 1,
1.210597, 2.009845, 2.134974, 1, 0, 0.6470588, 1,
1.215742, -0.07899248, 1.727916, 1, 0, 0.6431373, 1,
1.222662, 1.777588, 0.5630727, 1, 0, 0.6352941, 1,
1.226339, -1.018851, 2.747265, 1, 0, 0.6313726, 1,
1.22922, 1.596906, 0.9156267, 1, 0, 0.6235294, 1,
1.251626, -0.8195953, 2.753302, 1, 0, 0.6196079, 1,
1.252107, 0.4248827, 1.612141, 1, 0, 0.6117647, 1,
1.262876, -0.09384772, 1.648537, 1, 0, 0.6078432, 1,
1.268434, -0.1663704, 1.991861, 1, 0, 0.6, 1,
1.269467, 1.588937, 0.9833461, 1, 0, 0.5921569, 1,
1.269566, -0.8380298, 2.02134, 1, 0, 0.5882353, 1,
1.271773, 0.6735239, 1.873337, 1, 0, 0.5803922, 1,
1.271927, 1.16344, -1.065213, 1, 0, 0.5764706, 1,
1.27989, -0.5191866, 1.32419, 1, 0, 0.5686275, 1,
1.283905, 0.5378563, 1.632929, 1, 0, 0.5647059, 1,
1.28935, 0.4224218, 2.040638, 1, 0, 0.5568628, 1,
1.299766, -0.4035499, 1.943474, 1, 0, 0.5529412, 1,
1.300588, 0.5343884, 1.052677, 1, 0, 0.5450981, 1,
1.314853, -1.064975, 2.289653, 1, 0, 0.5411765, 1,
1.320045, 0.6836934, -0.8790128, 1, 0, 0.5333334, 1,
1.324229, 2.136502, -1.063965, 1, 0, 0.5294118, 1,
1.326928, 0.5335644, 1.448874, 1, 0, 0.5215687, 1,
1.338152, -1.769923, 2.446485, 1, 0, 0.5176471, 1,
1.351399, -0.3755394, 2.408067, 1, 0, 0.509804, 1,
1.356022, 1.227143, 1.253964, 1, 0, 0.5058824, 1,
1.366099, -0.04770793, 2.580856, 1, 0, 0.4980392, 1,
1.371328, 1.194668, 0.9735071, 1, 0, 0.4901961, 1,
1.376845, 1.770857, 0.09384476, 1, 0, 0.4862745, 1,
1.37703, 0.2650156, 0.9793735, 1, 0, 0.4784314, 1,
1.381727, -2.031147, 1.497472, 1, 0, 0.4745098, 1,
1.389085, 0.1566171, 1.417016, 1, 0, 0.4666667, 1,
1.38955, 1.117914, -0.1948541, 1, 0, 0.4627451, 1,
1.392514, -1.885807, 1.807411, 1, 0, 0.454902, 1,
1.393371, -0.9639198, 1.428395, 1, 0, 0.4509804, 1,
1.396078, 0.4273223, 0.5124783, 1, 0, 0.4431373, 1,
1.396782, 0.6241108, 1.879376, 1, 0, 0.4392157, 1,
1.404257, 0.499512, 0.7051235, 1, 0, 0.4313726, 1,
1.413126, 0.2735254, 0.337247, 1, 0, 0.427451, 1,
1.416181, -0.3073584, 2.933331, 1, 0, 0.4196078, 1,
1.42047, 0.6904904, -0.002596988, 1, 0, 0.4156863, 1,
1.445682, 1.109186, 2.156955, 1, 0, 0.4078431, 1,
1.454421, -0.3016825, 2.477252, 1, 0, 0.4039216, 1,
1.454887, -1.161615, 4.026693, 1, 0, 0.3960784, 1,
1.455416, -1.689695, 2.999449, 1, 0, 0.3882353, 1,
1.456238, -0.2502872, 2.206063, 1, 0, 0.3843137, 1,
1.465409, 0.3363271, 0.4264627, 1, 0, 0.3764706, 1,
1.478939, -0.4290147, 2.686355, 1, 0, 0.372549, 1,
1.487459, -0.1564617, 2.273331, 1, 0, 0.3647059, 1,
1.498895, 0.9013639, 0.6486786, 1, 0, 0.3607843, 1,
1.501969, -1.80837, 2.643666, 1, 0, 0.3529412, 1,
1.504767, 0.5304619, 1.474953, 1, 0, 0.3490196, 1,
1.536759, 0.3727496, 1.579366, 1, 0, 0.3411765, 1,
1.543301, -0.3933684, 2.404232, 1, 0, 0.3372549, 1,
1.547007, -0.7878944, 2.195634, 1, 0, 0.3294118, 1,
1.547722, -0.2988867, 0.1446593, 1, 0, 0.3254902, 1,
1.548124, 0.2661745, 1.167032, 1, 0, 0.3176471, 1,
1.554537, 0.5345461, 0.6462179, 1, 0, 0.3137255, 1,
1.567359, 1.477074, 1.115498, 1, 0, 0.3058824, 1,
1.607112, -0.681435, 3.166338, 1, 0, 0.2980392, 1,
1.620002, -1.309021, 3.67987, 1, 0, 0.2941177, 1,
1.621616, 0.6185995, -0.4077165, 1, 0, 0.2862745, 1,
1.630796, -0.4092687, 1.593412, 1, 0, 0.282353, 1,
1.631997, -0.4308957, 2.392527, 1, 0, 0.2745098, 1,
1.651147, -0.4033074, 1.580862, 1, 0, 0.2705882, 1,
1.664577, -0.1286292, 2.839864, 1, 0, 0.2627451, 1,
1.669204, 0.09768829, 2.13117, 1, 0, 0.2588235, 1,
1.683643, -1.96893, 2.967855, 1, 0, 0.2509804, 1,
1.69508, -0.6341261, 0.1988555, 1, 0, 0.2470588, 1,
1.750748, -1.396391, 2.260963, 1, 0, 0.2392157, 1,
1.753904, -0.6825742, 0.3021202, 1, 0, 0.2352941, 1,
1.758255, -1.220113, 0.1344098, 1, 0, 0.227451, 1,
1.790187, 0.5322839, 0.8437508, 1, 0, 0.2235294, 1,
1.810455, -0.6031309, 3.807512, 1, 0, 0.2156863, 1,
1.823672, 0.9162098, 1.546577, 1, 0, 0.2117647, 1,
1.858084, -0.03819098, 1.995687, 1, 0, 0.2039216, 1,
1.867327, -0.6891699, 1.918753, 1, 0, 0.1960784, 1,
1.867567, 0.6116757, 2.306089, 1, 0, 0.1921569, 1,
1.879656, 0.9624642, 0.3425735, 1, 0, 0.1843137, 1,
1.901063, 0.4392576, 2.502086, 1, 0, 0.1803922, 1,
1.917024, 0.5461385, 2.518808, 1, 0, 0.172549, 1,
1.950104, 3.316096, 2.087877, 1, 0, 0.1686275, 1,
1.956459, -0.4006613, 2.250047, 1, 0, 0.1607843, 1,
1.968783, 1.327801, 0.1768614, 1, 0, 0.1568628, 1,
1.986974, 1.022932, 1.355312, 1, 0, 0.1490196, 1,
2.051417, -1.452842, 2.502242, 1, 0, 0.145098, 1,
2.05753, -0.4207953, 2.232468, 1, 0, 0.1372549, 1,
2.06125, 0.9536468, 2.259094, 1, 0, 0.1333333, 1,
2.093873, 1.194821, 0.6401021, 1, 0, 0.1254902, 1,
2.110301, -0.471491, 3.463829, 1, 0, 0.1215686, 1,
2.117269, 0.5471764, 0.8185937, 1, 0, 0.1137255, 1,
2.131743, 0.4867128, 2.379442, 1, 0, 0.1098039, 1,
2.157528, 0.5699195, 0.2041531, 1, 0, 0.1019608, 1,
2.160574, 1.050479, 1.222463, 1, 0, 0.09411765, 1,
2.201783, -1.095422, 1.371666, 1, 0, 0.09019608, 1,
2.240869, -0.9450259, 3.002782, 1, 0, 0.08235294, 1,
2.306785, 0.7221112, 1.470756, 1, 0, 0.07843138, 1,
2.327327, 0.1030887, 2.100038, 1, 0, 0.07058824, 1,
2.347952, 0.9804652, 0.1748854, 1, 0, 0.06666667, 1,
2.366087, -1.791341, 1.192961, 1, 0, 0.05882353, 1,
2.409326, 0.9020059, 0.3934744, 1, 0, 0.05490196, 1,
2.424221, -0.4574672, 1.221979, 1, 0, 0.04705882, 1,
2.490268, -0.8850558, 3.398197, 1, 0, 0.04313726, 1,
2.520285, 0.3571499, 2.094807, 1, 0, 0.03529412, 1,
2.539106, -0.9780581, 0.02307185, 1, 0, 0.03137255, 1,
2.546384, -0.5655094, 2.223374, 1, 0, 0.02352941, 1,
2.717949, -1.307542, 1.374655, 1, 0, 0.01960784, 1,
2.752651, 0.5632497, 2.236979, 1, 0, 0.01176471, 1,
3.753959, 1.789613, 1.115786, 1, 0, 0.007843138, 1
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
0.04583645, -4.671059, -6.908007, 0, -0.5, 0.5, 0.5,
0.04583645, -4.671059, -6.908007, 1, -0.5, 0.5, 0.5,
0.04583645, -4.671059, -6.908007, 1, 1.5, 0.5, 0.5,
0.04583645, -4.671059, -6.908007, 0, 1.5, 0.5, 0.5
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
-4.919339, -0.09867716, -6.908007, 0, -0.5, 0.5, 0.5,
-4.919339, -0.09867716, -6.908007, 1, -0.5, 0.5, 0.5,
-4.919339, -0.09867716, -6.908007, 1, 1.5, 0.5, 0.5,
-4.919339, -0.09867716, -6.908007, 0, 1.5, 0.5, 0.5
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
-4.919339, -4.671059, 0.4095674, 0, -0.5, 0.5, 0.5,
-4.919339, -4.671059, 0.4095674, 1, -0.5, 0.5, 0.5,
-4.919339, -4.671059, 0.4095674, 1, 1.5, 0.5, 0.5,
-4.919339, -4.671059, 0.4095674, 0, 1.5, 0.5, 0.5
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
-2, -3.615894, -5.219336,
2, -3.615894, -5.219336,
-2, -3.615894, -5.219336,
-2, -3.791755, -5.500781,
0, -3.615894, -5.219336,
0, -3.791755, -5.500781,
2, -3.615894, -5.219336,
2, -3.791755, -5.500781
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
-2, -4.143476, -6.063671, 0, -0.5, 0.5, 0.5,
-2, -4.143476, -6.063671, 1, -0.5, 0.5, 0.5,
-2, -4.143476, -6.063671, 1, 1.5, 0.5, 0.5,
-2, -4.143476, -6.063671, 0, 1.5, 0.5, 0.5,
0, -4.143476, -6.063671, 0, -0.5, 0.5, 0.5,
0, -4.143476, -6.063671, 1, -0.5, 0.5, 0.5,
0, -4.143476, -6.063671, 1, 1.5, 0.5, 0.5,
0, -4.143476, -6.063671, 0, 1.5, 0.5, 0.5,
2, -4.143476, -6.063671, 0, -0.5, 0.5, 0.5,
2, -4.143476, -6.063671, 1, -0.5, 0.5, 0.5,
2, -4.143476, -6.063671, 1, 1.5, 0.5, 0.5,
2, -4.143476, -6.063671, 0, 1.5, 0.5, 0.5
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
-3.77353, -3, -5.219336,
-3.77353, 3, -5.219336,
-3.77353, -3, -5.219336,
-3.964498, -3, -5.500781,
-3.77353, -2, -5.219336,
-3.964498, -2, -5.500781,
-3.77353, -1, -5.219336,
-3.964498, -1, -5.500781,
-3.77353, 0, -5.219336,
-3.964498, 0, -5.500781,
-3.77353, 1, -5.219336,
-3.964498, 1, -5.500781,
-3.77353, 2, -5.219336,
-3.964498, 2, -5.500781,
-3.77353, 3, -5.219336,
-3.964498, 3, -5.500781
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
-4.346435, -3, -6.063671, 0, -0.5, 0.5, 0.5,
-4.346435, -3, -6.063671, 1, -0.5, 0.5, 0.5,
-4.346435, -3, -6.063671, 1, 1.5, 0.5, 0.5,
-4.346435, -3, -6.063671, 0, 1.5, 0.5, 0.5,
-4.346435, -2, -6.063671, 0, -0.5, 0.5, 0.5,
-4.346435, -2, -6.063671, 1, -0.5, 0.5, 0.5,
-4.346435, -2, -6.063671, 1, 1.5, 0.5, 0.5,
-4.346435, -2, -6.063671, 0, 1.5, 0.5, 0.5,
-4.346435, -1, -6.063671, 0, -0.5, 0.5, 0.5,
-4.346435, -1, -6.063671, 1, -0.5, 0.5, 0.5,
-4.346435, -1, -6.063671, 1, 1.5, 0.5, 0.5,
-4.346435, -1, -6.063671, 0, 1.5, 0.5, 0.5,
-4.346435, 0, -6.063671, 0, -0.5, 0.5, 0.5,
-4.346435, 0, -6.063671, 1, -0.5, 0.5, 0.5,
-4.346435, 0, -6.063671, 1, 1.5, 0.5, 0.5,
-4.346435, 0, -6.063671, 0, 1.5, 0.5, 0.5,
-4.346435, 1, -6.063671, 0, -0.5, 0.5, 0.5,
-4.346435, 1, -6.063671, 1, -0.5, 0.5, 0.5,
-4.346435, 1, -6.063671, 1, 1.5, 0.5, 0.5,
-4.346435, 1, -6.063671, 0, 1.5, 0.5, 0.5,
-4.346435, 2, -6.063671, 0, -0.5, 0.5, 0.5,
-4.346435, 2, -6.063671, 1, -0.5, 0.5, 0.5,
-4.346435, 2, -6.063671, 1, 1.5, 0.5, 0.5,
-4.346435, 2, -6.063671, 0, 1.5, 0.5, 0.5,
-4.346435, 3, -6.063671, 0, -0.5, 0.5, 0.5,
-4.346435, 3, -6.063671, 1, -0.5, 0.5, 0.5,
-4.346435, 3, -6.063671, 1, 1.5, 0.5, 0.5,
-4.346435, 3, -6.063671, 0, 1.5, 0.5, 0.5
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
-3.77353, -3.615894, -4,
-3.77353, -3.615894, 4,
-3.77353, -3.615894, -4,
-3.964498, -3.791755, -4,
-3.77353, -3.615894, -2,
-3.964498, -3.791755, -2,
-3.77353, -3.615894, 0,
-3.964498, -3.791755, 0,
-3.77353, -3.615894, 2,
-3.964498, -3.791755, 2,
-3.77353, -3.615894, 4,
-3.964498, -3.791755, 4
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
-4.346435, -4.143476, -4, 0, -0.5, 0.5, 0.5,
-4.346435, -4.143476, -4, 1, -0.5, 0.5, 0.5,
-4.346435, -4.143476, -4, 1, 1.5, 0.5, 0.5,
-4.346435, -4.143476, -4, 0, 1.5, 0.5, 0.5,
-4.346435, -4.143476, -2, 0, -0.5, 0.5, 0.5,
-4.346435, -4.143476, -2, 1, -0.5, 0.5, 0.5,
-4.346435, -4.143476, -2, 1, 1.5, 0.5, 0.5,
-4.346435, -4.143476, -2, 0, 1.5, 0.5, 0.5,
-4.346435, -4.143476, 0, 0, -0.5, 0.5, 0.5,
-4.346435, -4.143476, 0, 1, -0.5, 0.5, 0.5,
-4.346435, -4.143476, 0, 1, 1.5, 0.5, 0.5,
-4.346435, -4.143476, 0, 0, 1.5, 0.5, 0.5,
-4.346435, -4.143476, 2, 0, -0.5, 0.5, 0.5,
-4.346435, -4.143476, 2, 1, -0.5, 0.5, 0.5,
-4.346435, -4.143476, 2, 1, 1.5, 0.5, 0.5,
-4.346435, -4.143476, 2, 0, 1.5, 0.5, 0.5,
-4.346435, -4.143476, 4, 0, -0.5, 0.5, 0.5,
-4.346435, -4.143476, 4, 1, -0.5, 0.5, 0.5,
-4.346435, -4.143476, 4, 1, 1.5, 0.5, 0.5,
-4.346435, -4.143476, 4, 0, 1.5, 0.5, 0.5
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
-3.77353, -3.615894, -5.219336,
-3.77353, 3.41854, -5.219336,
-3.77353, -3.615894, 6.03847,
-3.77353, 3.41854, 6.03847,
-3.77353, -3.615894, -5.219336,
-3.77353, -3.615894, 6.03847,
-3.77353, 3.41854, -5.219336,
-3.77353, 3.41854, 6.03847,
-3.77353, -3.615894, -5.219336,
3.865202, -3.615894, -5.219336,
-3.77353, -3.615894, 6.03847,
3.865202, -3.615894, 6.03847,
-3.77353, 3.41854, -5.219336,
3.865202, 3.41854, -5.219336,
-3.77353, 3.41854, 6.03847,
3.865202, 3.41854, 6.03847,
3.865202, -3.615894, -5.219336,
3.865202, 3.41854, -5.219336,
3.865202, -3.615894, 6.03847,
3.865202, 3.41854, 6.03847,
3.865202, -3.615894, -5.219336,
3.865202, -3.615894, 6.03847,
3.865202, 3.41854, -5.219336,
3.865202, 3.41854, 6.03847
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
var radius = 8.178304;
var distance = 36.3862;
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
mvMatrix.translate( -0.04583645, 0.09867716, -0.4095674 );
mvMatrix.scale( 1.157593, 1.257037, 0.7854587 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.3862);
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
fentin<-read.table("fentin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fentin$V2
```

```
## Error in eval(expr, envir, enclos): object 'fentin' not found
```

```r
y<-fentin$V3
```

```
## Error in eval(expr, envir, enclos): object 'fentin' not found
```

```r
z<-fentin$V4
```

```
## Error in eval(expr, envir, enclos): object 'fentin' not found
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
-3.662286, -1.023495, -1.97628, 0, 0, 1, 1, 1,
-3.395862, 1.241585, -2.277583, 1, 0, 0, 1, 1,
-3.303205, -0.4063817, -3.260594, 1, 0, 0, 1, 1,
-2.764107, 1.028953, -2.467249, 1, 0, 0, 1, 1,
-2.71019, 0.5566971, -0.9000869, 1, 0, 0, 1, 1,
-2.63291, 1.759858, -2.356903, 1, 0, 0, 1, 1,
-2.593924, 0.4731793, -0.9210547, 0, 0, 0, 1, 1,
-2.586714, 0.4171185, -0.9712999, 0, 0, 0, 1, 1,
-2.450392, 0.748667, -3.636386, 0, 0, 0, 1, 1,
-2.377416, 0.0242737, -2.178658, 0, 0, 0, 1, 1,
-2.31949, 0.917829, -1.070267, 0, 0, 0, 1, 1,
-2.247983, -0.1865074, -2.276718, 0, 0, 0, 1, 1,
-2.243017, -1.040746, -0.4920644, 0, 0, 0, 1, 1,
-2.179631, 0.9679934, -0.07828198, 1, 1, 1, 1, 1,
-2.172383, -0.2005944, -0.9102967, 1, 1, 1, 1, 1,
-2.151977, -1.100505, -1.049664, 1, 1, 1, 1, 1,
-2.148899, 1.330155, -1.127244, 1, 1, 1, 1, 1,
-2.120004, -0.0500907, -1.235039, 1, 1, 1, 1, 1,
-2.089816, 0.3085479, -0.8040244, 1, 1, 1, 1, 1,
-2.059646, -1.247098, -2.497843, 1, 1, 1, 1, 1,
-2.045671, -0.819023, -2.440732, 1, 1, 1, 1, 1,
-2.043868, -0.1385807, -2.477705, 1, 1, 1, 1, 1,
-1.989133, -0.4173103, -0.5775182, 1, 1, 1, 1, 1,
-1.988566, 0.008404966, -0.1927273, 1, 1, 1, 1, 1,
-1.954271, 0.1880732, -1.475595, 1, 1, 1, 1, 1,
-1.934752, 0.3129103, -2.281265, 1, 1, 1, 1, 1,
-1.926746, 0.05028423, -0.8909422, 1, 1, 1, 1, 1,
-1.925425, -0.2219081, -3.384585, 1, 1, 1, 1, 1,
-1.924547, 1.091138, -1.242384, 0, 0, 1, 1, 1,
-1.88033, 0.9217846, 0.06608226, 1, 0, 0, 1, 1,
-1.879682, -1.413075, -2.245698, 1, 0, 0, 1, 1,
-1.876765, -0.04938873, -2.311916, 1, 0, 0, 1, 1,
-1.848237, -0.1460863, -2.691563, 1, 0, 0, 1, 1,
-1.837971, -0.4858626, -0.2554962, 1, 0, 0, 1, 1,
-1.814999, 2.082211, 0.3257325, 0, 0, 0, 1, 1,
-1.803817, 1.789145, 0.1836761, 0, 0, 0, 1, 1,
-1.80349, -1.641237, -2.742791, 0, 0, 0, 1, 1,
-1.761025, 1.346303, -1.222854, 0, 0, 0, 1, 1,
-1.752834, 0.8096972, -2.482208, 0, 0, 0, 1, 1,
-1.73526, 1.362528, 0.1246479, 0, 0, 0, 1, 1,
-1.732334, 0.8308429, -0.5863323, 0, 0, 0, 1, 1,
-1.715632, -1.770999, -1.60008, 1, 1, 1, 1, 1,
-1.713627, 0.5104139, -1.074384, 1, 1, 1, 1, 1,
-1.707773, 0.6253213, 0.1589355, 1, 1, 1, 1, 1,
-1.705393, -0.7644933, -2.289824, 1, 1, 1, 1, 1,
-1.700478, 1.461467, -1.536011, 1, 1, 1, 1, 1,
-1.695778, -1.175815, -1.095412, 1, 1, 1, 1, 1,
-1.686891, -1.588757, -4.370344, 1, 1, 1, 1, 1,
-1.663702, 0.5689334, -1.390741, 1, 1, 1, 1, 1,
-1.654076, 0.9342821, -1.283092, 1, 1, 1, 1, 1,
-1.648756, -1.081126, -2.760398, 1, 1, 1, 1, 1,
-1.647774, -0.4743743, -3.068062, 1, 1, 1, 1, 1,
-1.647484, -0.4000042, -1.570728, 1, 1, 1, 1, 1,
-1.644001, -1.262985, -1.48356, 1, 1, 1, 1, 1,
-1.64179, 0.7569364, -0.875098, 1, 1, 1, 1, 1,
-1.636595, 0.3892471, -1.786151, 1, 1, 1, 1, 1,
-1.631084, -0.6111783, -2.333551, 0, 0, 1, 1, 1,
-1.629307, 0.4031924, 0.8749916, 1, 0, 0, 1, 1,
-1.608673, -0.5752293, -1.283083, 1, 0, 0, 1, 1,
-1.600052, -0.6103051, -0.7850993, 1, 0, 0, 1, 1,
-1.592078, 0.6286268, -2.120602, 1, 0, 0, 1, 1,
-1.582737, -0.5040783, -1.597681, 1, 0, 0, 1, 1,
-1.569375, -0.1849889, -2.502852, 0, 0, 0, 1, 1,
-1.56838, 0.4292253, -1.952559, 0, 0, 0, 1, 1,
-1.566088, -0.3403209, -2.487942, 0, 0, 0, 1, 1,
-1.558468, 0.3586091, -1.392898, 0, 0, 0, 1, 1,
-1.545501, -1.307122, -1.979129, 0, 0, 0, 1, 1,
-1.541892, 0.9983582, -1.05433, 0, 0, 0, 1, 1,
-1.516735, -0.932945, -2.214744, 0, 0, 0, 1, 1,
-1.513302, 0.4325949, 0.1387011, 1, 1, 1, 1, 1,
-1.510631, -0.8032824, -2.608519, 1, 1, 1, 1, 1,
-1.503685, 0.3965063, -1.22234, 1, 1, 1, 1, 1,
-1.502353, 0.9015658, -1.610452, 1, 1, 1, 1, 1,
-1.498186, 0.4474342, -0.3986083, 1, 1, 1, 1, 1,
-1.497628, 0.2603279, -2.261695, 1, 1, 1, 1, 1,
-1.487411, 0.1580024, -1.840496, 1, 1, 1, 1, 1,
-1.48434, -1.543134, -2.818879, 1, 1, 1, 1, 1,
-1.460806, 0.7809248, 0.3175202, 1, 1, 1, 1, 1,
-1.460592, 1.781213, -0.1838735, 1, 1, 1, 1, 1,
-1.459932, -0.3399565, -0.3778536, 1, 1, 1, 1, 1,
-1.454506, -1.883483, -2.336084, 1, 1, 1, 1, 1,
-1.444207, -0.3620823, -0.927395, 1, 1, 1, 1, 1,
-1.434711, -1.148299, -3.826582, 1, 1, 1, 1, 1,
-1.432674, -0.3887314, -0.5374374, 1, 1, 1, 1, 1,
-1.428381, -0.4296319, -2.028585, 0, 0, 1, 1, 1,
-1.413735, -0.6814467, -2.118726, 1, 0, 0, 1, 1,
-1.40777, -0.3782924, -1.98558, 1, 0, 0, 1, 1,
-1.384577, 0.4204052, -1.671872, 1, 0, 0, 1, 1,
-1.376569, 0.5439567, -1.808922, 1, 0, 0, 1, 1,
-1.370533, -1.998473, -4.757525, 1, 0, 0, 1, 1,
-1.367304, -0.5596343, -1.816565, 0, 0, 0, 1, 1,
-1.365435, -0.4684779, -1.892161, 0, 0, 0, 1, 1,
-1.364726, -0.8283982, -1.082209, 0, 0, 0, 1, 1,
-1.354887, 0.2424472, -1.27386, 0, 0, 0, 1, 1,
-1.352842, -1.201586, -2.971689, 0, 0, 0, 1, 1,
-1.344814, 0.6910842, -2.186865, 0, 0, 0, 1, 1,
-1.328499, -0.741848, -1.78359, 0, 0, 0, 1, 1,
-1.32602, -1.133916, -2.166885, 1, 1, 1, 1, 1,
-1.323044, 0.8337379, -0.9534274, 1, 1, 1, 1, 1,
-1.318881, -0.7559462, -0.9202852, 1, 1, 1, 1, 1,
-1.314688, -0.2805521, -1.452311, 1, 1, 1, 1, 1,
-1.311249, -0.2920279, -1.927508, 1, 1, 1, 1, 1,
-1.310234, 0.3556135, -0.5796221, 1, 1, 1, 1, 1,
-1.293126, 0.892455, -0.509739, 1, 1, 1, 1, 1,
-1.28972, -1.412361, -1.512069, 1, 1, 1, 1, 1,
-1.285875, -1.015185, -1.00802, 1, 1, 1, 1, 1,
-1.284973, -1.129854, -3.36231, 1, 1, 1, 1, 1,
-1.284218, -1.716221, -2.219568, 1, 1, 1, 1, 1,
-1.283309, 0.9056951, -2.571408, 1, 1, 1, 1, 1,
-1.266401, -2.243561, -3.432554, 1, 1, 1, 1, 1,
-1.25733, -0.07030547, -2.78811, 1, 1, 1, 1, 1,
-1.245628, -1.447359, -1.408939, 1, 1, 1, 1, 1,
-1.243427, -1.395628, -3.709213, 0, 0, 1, 1, 1,
-1.236701, 1.696091, 1.104177, 1, 0, 0, 1, 1,
-1.235939, 0.4413877, -1.379405, 1, 0, 0, 1, 1,
-1.235482, 0.3691689, -1.55726, 1, 0, 0, 1, 1,
-1.232006, 0.432306, -1.150369, 1, 0, 0, 1, 1,
-1.222863, -0.5385765, -4.097703, 1, 0, 0, 1, 1,
-1.217707, -1.011073, -2.797496, 0, 0, 0, 1, 1,
-1.216426, 0.4416818, -0.9434406, 0, 0, 0, 1, 1,
-1.206531, -1.041449, -0.9391155, 0, 0, 0, 1, 1,
-1.204941, -0.2056836, -2.751321, 0, 0, 0, 1, 1,
-1.185609, -0.1630362, -2.046705, 0, 0, 0, 1, 1,
-1.17923, -0.6560772, -1.107471, 0, 0, 0, 1, 1,
-1.178516, 0.8530714, -0.5393084, 0, 0, 0, 1, 1,
-1.171894, 1.024545, -1.03973, 1, 1, 1, 1, 1,
-1.171034, 1.044473, -2.500667, 1, 1, 1, 1, 1,
-1.169856, 0.4295535, -0.3907844, 1, 1, 1, 1, 1,
-1.16259, 0.4737723, -0.7151421, 1, 1, 1, 1, 1,
-1.16096, -0.4458927, -1.487512, 1, 1, 1, 1, 1,
-1.16058, 0.1129975, -1.615203, 1, 1, 1, 1, 1,
-1.156268, -0.625012, -0.9844548, 1, 1, 1, 1, 1,
-1.145399, -1.858301, -3.527893, 1, 1, 1, 1, 1,
-1.140123, -2.114031, -3.711979, 1, 1, 1, 1, 1,
-1.135847, -0.7229444, -2.360159, 1, 1, 1, 1, 1,
-1.111436, 1.45514, -0.2703286, 1, 1, 1, 1, 1,
-1.100027, -0.888982, -3.676059, 1, 1, 1, 1, 1,
-1.086378, -0.7497737, -2.368093, 1, 1, 1, 1, 1,
-1.083041, 0.7669721, -1.96646, 1, 1, 1, 1, 1,
-1.078339, -0.5272269, -1.372308, 1, 1, 1, 1, 1,
-1.072399, -0.1267607, -2.316135, 0, 0, 1, 1, 1,
-1.068515, 0.5797313, -0.3653619, 1, 0, 0, 1, 1,
-1.064447, -0.5145556, -1.701368, 1, 0, 0, 1, 1,
-1.058568, 0.5106059, 0.7605475, 1, 0, 0, 1, 1,
-1.055306, 1.52268, -0.8361935, 1, 0, 0, 1, 1,
-1.052889, 1.139127, -0.5410137, 1, 0, 0, 1, 1,
-1.051031, -1.001566, -1.582478, 0, 0, 0, 1, 1,
-1.045358, -1.35699, -1.634443, 0, 0, 0, 1, 1,
-1.044875, -0.4043395, -2.376196, 0, 0, 0, 1, 1,
-1.036413, 0.6958737, -0.06717075, 0, 0, 0, 1, 1,
-1.033658, 0.0811032, -0.1056054, 0, 0, 0, 1, 1,
-1.024731, -0.9030484, -0.5134245, 0, 0, 0, 1, 1,
-1.023597, -0.143988, -3.41077, 0, 0, 0, 1, 1,
-1.019358, -0.2693073, -1.559922, 1, 1, 1, 1, 1,
-1.017534, -3.513451, -1.328655, 1, 1, 1, 1, 1,
-1.013359, -1.839727, -2.081062, 1, 1, 1, 1, 1,
-1.010901, 0.6592538, -0.332309, 1, 1, 1, 1, 1,
-1.009248, 0.2003441, -2.245171, 1, 1, 1, 1, 1,
-1.005972, -0.558476, -1.366113, 1, 1, 1, 1, 1,
-1.00252, -0.2523482, -0.7625856, 1, 1, 1, 1, 1,
-1.000467, 0.1501887, -3.342843, 1, 1, 1, 1, 1,
-0.9884939, -1.219373, -1.348217, 1, 1, 1, 1, 1,
-0.9812126, 1.995193, -1.082802, 1, 1, 1, 1, 1,
-0.9788013, 0.84626, -1.547584, 1, 1, 1, 1, 1,
-0.9767015, 0.4549675, -2.124195, 1, 1, 1, 1, 1,
-0.972554, -1.093386, -3.105314, 1, 1, 1, 1, 1,
-0.9672765, -1.357701, -3.36874, 1, 1, 1, 1, 1,
-0.9645602, -0.3444952, -1.910578, 1, 1, 1, 1, 1,
-0.9633621, -1.16277, -2.321412, 0, 0, 1, 1, 1,
-0.9626887, -0.9147519, -1.717268, 1, 0, 0, 1, 1,
-0.9625499, -1.464452, -2.832115, 1, 0, 0, 1, 1,
-0.9549816, 1.108321, 0.02976243, 1, 0, 0, 1, 1,
-0.9545658, -0.09023039, 0.1090186, 1, 0, 0, 1, 1,
-0.9521684, -1.630538, -2.298475, 1, 0, 0, 1, 1,
-0.9494981, 2.595297, 0.6486031, 0, 0, 0, 1, 1,
-0.9475538, 0.0795045, -1.776009, 0, 0, 0, 1, 1,
-0.9430797, -0.7173222, -2.412384, 0, 0, 0, 1, 1,
-0.9342428, 0.1740383, -0.475513, 0, 0, 0, 1, 1,
-0.9336025, -0.2875015, -1.632609, 0, 0, 0, 1, 1,
-0.9317237, 0.3241498, -3.335167, 0, 0, 0, 1, 1,
-0.9292905, -0.1868937, -2.023769, 0, 0, 0, 1, 1,
-0.9287537, -1.201726, -2.767313, 1, 1, 1, 1, 1,
-0.9244003, -0.8788663, -0.7352001, 1, 1, 1, 1, 1,
-0.9107732, 1.029426, 0.7232523, 1, 1, 1, 1, 1,
-0.9105189, 2.186931, -0.3006908, 1, 1, 1, 1, 1,
-0.9088628, -1.446191, -3.86011, 1, 1, 1, 1, 1,
-0.9052343, 0.3732678, -0.1802176, 1, 1, 1, 1, 1,
-0.8994405, -0.5637017, -3.524823, 1, 1, 1, 1, 1,
-0.8989968, -1.213673, -1.031909, 1, 1, 1, 1, 1,
-0.8920233, 0.8157654, 0.6813269, 1, 1, 1, 1, 1,
-0.8915564, 2.156832, -1.368814, 1, 1, 1, 1, 1,
-0.8869373, 0.72598, 0.07260282, 1, 1, 1, 1, 1,
-0.8857678, -0.2654096, -2.910553, 1, 1, 1, 1, 1,
-0.8847468, -1.326019, -3.593057, 1, 1, 1, 1, 1,
-0.8828083, -0.5190538, -1.164277, 1, 1, 1, 1, 1,
-0.8823943, -0.6015542, -0.3732358, 1, 1, 1, 1, 1,
-0.8800635, 0.1592761, -2.563335, 0, 0, 1, 1, 1,
-0.8797439, -0.1213805, -2.392648, 1, 0, 0, 1, 1,
-0.8784188, -1.674094, -4.289276, 1, 0, 0, 1, 1,
-0.8651388, -0.5617935, -1.894563, 1, 0, 0, 1, 1,
-0.8457667, -0.2574127, -1.163906, 1, 0, 0, 1, 1,
-0.8432448, 0.7954829, -2.328315, 1, 0, 0, 1, 1,
-0.8415504, -1.743395, -1.469523, 0, 0, 0, 1, 1,
-0.8346879, -0.2224114, -1.764376, 0, 0, 0, 1, 1,
-0.8332911, 1.311755, 0.6271769, 0, 0, 0, 1, 1,
-0.8309085, 1.749425, 0.1042725, 0, 0, 0, 1, 1,
-0.8305327, -0.4717259, -2.425369, 0, 0, 0, 1, 1,
-0.8292427, 0.724561, -0.3889869, 0, 0, 0, 1, 1,
-0.8288598, -0.4983971, -2.438512, 0, 0, 0, 1, 1,
-0.8278376, -0.5943175, -0.7568125, 1, 1, 1, 1, 1,
-0.8159173, -0.4864601, -2.674018, 1, 1, 1, 1, 1,
-0.8154943, 0.04423628, -0.8053932, 1, 1, 1, 1, 1,
-0.8056022, 1.03837, -0.01102346, 1, 1, 1, 1, 1,
-0.8049449, 0.9700058, -0.2048989, 1, 1, 1, 1, 1,
-0.8017938, 0.8521755, -0.5163605, 1, 1, 1, 1, 1,
-0.7892699, 0.8577172, -0.6446111, 1, 1, 1, 1, 1,
-0.7790574, -0.3201874, -2.211609, 1, 1, 1, 1, 1,
-0.7789494, -0.6341641, -2.612197, 1, 1, 1, 1, 1,
-0.7667644, -0.3348656, -0.02737273, 1, 1, 1, 1, 1,
-0.7666975, 0.0852655, -0.2625376, 1, 1, 1, 1, 1,
-0.7659404, -0.09475737, -3.58583, 1, 1, 1, 1, 1,
-0.7651763, -0.1214547, -1.74315, 1, 1, 1, 1, 1,
-0.7647395, -2.064595, -3.662432, 1, 1, 1, 1, 1,
-0.7585681, 0.06637944, -1.300788, 1, 1, 1, 1, 1,
-0.7561795, -0.07887473, -4.118632, 0, 0, 1, 1, 1,
-0.7552693, 0.9269654, -0.8632083, 1, 0, 0, 1, 1,
-0.7524471, 0.3024962, -2.357075, 1, 0, 0, 1, 1,
-0.7510163, 0.008513432, -1.982388, 1, 0, 0, 1, 1,
-0.7469596, 0.2335982, -0.4585237, 1, 0, 0, 1, 1,
-0.7459182, -0.6191143, -2.983976, 1, 0, 0, 1, 1,
-0.7422074, -0.6856009, -1.098673, 0, 0, 0, 1, 1,
-0.7188936, -0.699078, -2.243637, 0, 0, 0, 1, 1,
-0.7125767, -0.1831759, -2.60396, 0, 0, 0, 1, 1,
-0.7096624, -1.16277, -1.241334, 0, 0, 0, 1, 1,
-0.7094154, 1.399261, 0.9616413, 0, 0, 0, 1, 1,
-0.7067329, -0.4464729, -2.741408, 0, 0, 0, 1, 1,
-0.7057255, 0.9540384, -0.9815128, 0, 0, 0, 1, 1,
-0.7025712, 0.6603574, -1.64114, 1, 1, 1, 1, 1,
-0.6968774, -1.599858, -2.529105, 1, 1, 1, 1, 1,
-0.694741, 0.05633678, -1.826864, 1, 1, 1, 1, 1,
-0.6920204, -1.056373, -3.073484, 1, 1, 1, 1, 1,
-0.6882958, -1.097013, -2.996691, 1, 1, 1, 1, 1,
-0.6824313, 0.1548632, -1.799233, 1, 1, 1, 1, 1,
-0.6773049, -0.2797043, -1.678113, 1, 1, 1, 1, 1,
-0.6735448, -1.725624, -1.195545, 1, 1, 1, 1, 1,
-0.6720175, -1.832398, -1.807552, 1, 1, 1, 1, 1,
-0.6704553, 1.263577, -2.329051, 1, 1, 1, 1, 1,
-0.6675568, -1.135458, -1.969368, 1, 1, 1, 1, 1,
-0.6653028, -1.524125, -3.505616, 1, 1, 1, 1, 1,
-0.6577736, -0.4375049, -1.379759, 1, 1, 1, 1, 1,
-0.6568838, -0.280851, -2.620253, 1, 1, 1, 1, 1,
-0.6563888, -1.386738, -3.720722, 1, 1, 1, 1, 1,
-0.6536511, 1.917252, -1.120011, 0, 0, 1, 1, 1,
-0.6530301, -1.883047, -2.705406, 1, 0, 0, 1, 1,
-0.6525947, -0.6175561, -0.3803418, 1, 0, 0, 1, 1,
-0.6512068, -0.986259, -0.9374564, 1, 0, 0, 1, 1,
-0.6499927, -1.511505, -1.86041, 1, 0, 0, 1, 1,
-0.6298372, 0.6646306, -0.4543146, 1, 0, 0, 1, 1,
-0.627323, -1.868815, -3.074146, 0, 0, 0, 1, 1,
-0.6220142, 1.019665, -0.8985397, 0, 0, 0, 1, 1,
-0.6219858, 0.8091978, -0.4307042, 0, 0, 0, 1, 1,
-0.6200427, -0.7520826, -2.136282, 0, 0, 0, 1, 1,
-0.6199811, -1.556415, -2.779175, 0, 0, 0, 1, 1,
-0.6179733, -0.7663913, -2.104139, 0, 0, 0, 1, 1,
-0.6116347, 0.5101528, -2.298748, 0, 0, 0, 1, 1,
-0.6108599, 1.385727, -0.7026668, 1, 1, 1, 1, 1,
-0.6070139, 2.127011, 0.7624617, 1, 1, 1, 1, 1,
-0.6060061, -0.1717721, -2.843442, 1, 1, 1, 1, 1,
-0.596397, 0.3599695, -1.615791, 1, 1, 1, 1, 1,
-0.5838161, 0.7748362, -1.593757, 1, 1, 1, 1, 1,
-0.5832546, -3.01411, -2.275246, 1, 1, 1, 1, 1,
-0.5830976, -0.8402504, -3.957612, 1, 1, 1, 1, 1,
-0.5809296, 0.6035715, -1.193633, 1, 1, 1, 1, 1,
-0.570439, 0.2282494, -1.984534, 1, 1, 1, 1, 1,
-0.569266, 0.8289701, 1.083319, 1, 1, 1, 1, 1,
-0.5621381, -0.4422773, -1.802574, 1, 1, 1, 1, 1,
-0.5604371, -1.241943, -1.702486, 1, 1, 1, 1, 1,
-0.5603862, 1.289507, 1.363158, 1, 1, 1, 1, 1,
-0.5572007, 1.242199, -0.8566342, 1, 1, 1, 1, 1,
-0.5522115, 0.04237564, -0.9774488, 1, 1, 1, 1, 1,
-0.5480881, 0.7507221, -0.2415273, 0, 0, 1, 1, 1,
-0.5475913, 0.06619239, -1.915934, 1, 0, 0, 1, 1,
-0.5471144, -0.262654, -2.938055, 1, 0, 0, 1, 1,
-0.5437712, -0.1098636, -4.164147, 1, 0, 0, 1, 1,
-0.5404552, -2.123136, -4.684104, 1, 0, 0, 1, 1,
-0.5317513, 0.6145315, -0.6067683, 1, 0, 0, 1, 1,
-0.5286323, -1.955232, -3.239687, 0, 0, 0, 1, 1,
-0.5213798, -2.053353, -2.474344, 0, 0, 0, 1, 1,
-0.5156483, -0.3439859, -2.594803, 0, 0, 0, 1, 1,
-0.5136636, -0.09940625, -1.147846, 0, 0, 0, 1, 1,
-0.5132453, -0.9747451, -2.427638, 0, 0, 0, 1, 1,
-0.5127554, 0.4649469, 0.084565, 0, 0, 0, 1, 1,
-0.5113815, 2.352775, 0.0788247, 0, 0, 0, 1, 1,
-0.5073799, 0.0309025, -3.262034, 1, 1, 1, 1, 1,
-0.5042274, 0.5689494, -1.358491, 1, 1, 1, 1, 1,
-0.5017446, -0.3089423, -1.547874, 1, 1, 1, 1, 1,
-0.4955343, -0.1185194, -1.114759, 1, 1, 1, 1, 1,
-0.4940468, 0.9386965, -1.771038, 1, 1, 1, 1, 1,
-0.4919459, -0.2956872, -0.5765608, 1, 1, 1, 1, 1,
-0.4883009, -0.2935482, -1.005119, 1, 1, 1, 1, 1,
-0.4867618, -0.02474554, -0.852098, 1, 1, 1, 1, 1,
-0.4855777, -0.1607817, -1.718357, 1, 1, 1, 1, 1,
-0.4791867, -0.1862009, -3.024068, 1, 1, 1, 1, 1,
-0.4781539, -0.4149662, -3.329468, 1, 1, 1, 1, 1,
-0.4721574, -0.1675028, -0.0262914, 1, 1, 1, 1, 1,
-0.4677898, -1.417823, -2.948462, 1, 1, 1, 1, 1,
-0.4663803, -0.1692603, -1.777486, 1, 1, 1, 1, 1,
-0.4657609, -1.388288, -3.053068, 1, 1, 1, 1, 1,
-0.457156, 1.62238, -1.329035, 0, 0, 1, 1, 1,
-0.4570652, -0.8533537, -2.099902, 1, 0, 0, 1, 1,
-0.4567028, -0.8554671, -0.3887965, 1, 0, 0, 1, 1,
-0.4563422, -1.177096, -3.223236, 1, 0, 0, 1, 1,
-0.4536065, 0.06815098, 0.162191, 1, 0, 0, 1, 1,
-0.4535361, -0.9767945, -1.843825, 1, 0, 0, 1, 1,
-0.4503491, 0.5405371, -1.565809, 0, 0, 0, 1, 1,
-0.4421485, -1.537057, -4.107758, 0, 0, 0, 1, 1,
-0.4411594, -0.9431648, -3.983893, 0, 0, 0, 1, 1,
-0.4394926, 0.2612677, -2.364463, 0, 0, 0, 1, 1,
-0.4393301, -2.233401, -2.473526, 0, 0, 0, 1, 1,
-0.4371375, 0.4999904, -0.09292223, 0, 0, 0, 1, 1,
-0.4354971, 0.4213564, 0.1685991, 0, 0, 0, 1, 1,
-0.4354093, -1.205535, -2.907383, 1, 1, 1, 1, 1,
-0.4324264, 0.1696819, -1.65676, 1, 1, 1, 1, 1,
-0.4323346, -2.576688, -2.937669, 1, 1, 1, 1, 1,
-0.425689, 0.7725504, -0.233087, 1, 1, 1, 1, 1,
-0.4180017, -1.457809, -3.356024, 1, 1, 1, 1, 1,
-0.4070621, 2.126442, 1.109186, 1, 1, 1, 1, 1,
-0.4058703, 0.4951666, -1.739684, 1, 1, 1, 1, 1,
-0.4035983, -0.482395, -3.358925, 1, 1, 1, 1, 1,
-0.4001811, -0.5197051, -1.800159, 1, 1, 1, 1, 1,
-0.3995697, -0.5023158, -2.79747, 1, 1, 1, 1, 1,
-0.398951, -0.8713413, -5.055387, 1, 1, 1, 1, 1,
-0.3987554, 0.2902749, -0.4276069, 1, 1, 1, 1, 1,
-0.393617, 0.3028046, -0.6842188, 1, 1, 1, 1, 1,
-0.3930264, 0.77255, -1.539642, 1, 1, 1, 1, 1,
-0.3883135, 0.7945316, -1.659754, 1, 1, 1, 1, 1,
-0.3866532, -0.03051038, -2.020666, 0, 0, 1, 1, 1,
-0.3851359, 0.04320786, -2.433483, 1, 0, 0, 1, 1,
-0.3794196, -0.5695725, -2.774307, 1, 0, 0, 1, 1,
-0.3773113, 0.9162019, 0.04994758, 1, 0, 0, 1, 1,
-0.3718819, 0.2305825, -1.909631, 1, 0, 0, 1, 1,
-0.3717647, -0.6621782, -4.221057, 1, 0, 0, 1, 1,
-0.3710207, 0.770655, -0.32661, 0, 0, 0, 1, 1,
-0.3653804, -1.00917, -3.725373, 0, 0, 0, 1, 1,
-0.3629828, -0.3482736, -1.833002, 0, 0, 0, 1, 1,
-0.3621668, -0.008794733, -1.068575, 0, 0, 0, 1, 1,
-0.3574292, -0.1842149, -3.040385, 0, 0, 0, 1, 1,
-0.3494782, 0.7295603, 0.5661818, 0, 0, 0, 1, 1,
-0.3489099, 1.236913, 0.3295753, 0, 0, 0, 1, 1,
-0.3482743, 1.024788, -1.440718, 1, 1, 1, 1, 1,
-0.3458522, 0.7651494, -0.5925279, 1, 1, 1, 1, 1,
-0.3442553, 1.682715, 1.876631, 1, 1, 1, 1, 1,
-0.3433742, -2.035918, -2.391689, 1, 1, 1, 1, 1,
-0.3419833, 1.592759, 0.5987017, 1, 1, 1, 1, 1,
-0.338948, 1.051317, -0.7148525, 1, 1, 1, 1, 1,
-0.3364609, -0.01602625, 0.05384383, 1, 1, 1, 1, 1,
-0.3342659, 0.4233714, 0.6908945, 1, 1, 1, 1, 1,
-0.3325899, 1.133352, -1.373576, 1, 1, 1, 1, 1,
-0.3324437, -1.183679, -2.22769, 1, 1, 1, 1, 1,
-0.3304549, 0.6631841, -1.319729, 1, 1, 1, 1, 1,
-0.3249595, -0.4407063, -2.630154, 1, 1, 1, 1, 1,
-0.3241145, 1.286206, -0.3038689, 1, 1, 1, 1, 1,
-0.3150769, -1.292103, -1.188841, 1, 1, 1, 1, 1,
-0.3124544, 1.030046, -1.188857, 1, 1, 1, 1, 1,
-0.309772, -0.7214515, -3.972463, 0, 0, 1, 1, 1,
-0.3097385, -1.822227, -2.369989, 1, 0, 0, 1, 1,
-0.3087803, -0.2865088, -0.4780101, 1, 0, 0, 1, 1,
-0.3020984, 1.157913, 0.4628339, 1, 0, 0, 1, 1,
-0.3016341, -0.5382305, -2.771318, 1, 0, 0, 1, 1,
-0.2990443, -2.859149, -2.547764, 1, 0, 0, 1, 1,
-0.296536, 0.3268745, -0.4002572, 0, 0, 0, 1, 1,
-0.2932793, 0.9245266, -1.617049, 0, 0, 0, 1, 1,
-0.2898988, -0.08750341, -2.042399, 0, 0, 0, 1, 1,
-0.2895503, -0.8184988, -1.123548, 0, 0, 0, 1, 1,
-0.2839424, -0.288963, -2.111612, 0, 0, 0, 1, 1,
-0.2815414, -1.046629, -3.221869, 0, 0, 0, 1, 1,
-0.2810456, -0.4157457, -2.018014, 0, 0, 0, 1, 1,
-0.2802107, -1.436241, -3.415673, 1, 1, 1, 1, 1,
-0.2790342, -0.3046955, -1.785971, 1, 1, 1, 1, 1,
-0.2784372, -1.618013, -3.243065, 1, 1, 1, 1, 1,
-0.2674282, -0.9702693, -3.449486, 1, 1, 1, 1, 1,
-0.2663996, -0.9881999, -3.007041, 1, 1, 1, 1, 1,
-0.2619586, 0.7589822, -1.681908, 1, 1, 1, 1, 1,
-0.2607886, 1.387847, -2.560983, 1, 1, 1, 1, 1,
-0.2588123, -0.01930746, -2.860404, 1, 1, 1, 1, 1,
-0.2587392, 2.205408, 0.378676, 1, 1, 1, 1, 1,
-0.2585319, 0.8387287, -2.211903, 1, 1, 1, 1, 1,
-0.2582166, -1.023195, -1.846869, 1, 1, 1, 1, 1,
-0.2576478, -1.865104, -1.973886, 1, 1, 1, 1, 1,
-0.2571241, 0.01451369, -1.590605, 1, 1, 1, 1, 1,
-0.2535432, -0.9612368, -3.609623, 1, 1, 1, 1, 1,
-0.2492554, 0.5259497, 0.502019, 1, 1, 1, 1, 1,
-0.2487627, 1.183509, 0.6380829, 0, 0, 1, 1, 1,
-0.2469892, 0.3325473, -2.26188, 1, 0, 0, 1, 1,
-0.2468284, 0.8239452, -1.280996, 1, 0, 0, 1, 1,
-0.2464796, -1.216913, -1.960876, 1, 0, 0, 1, 1,
-0.2454679, -0.9481847, -1.008787, 1, 0, 0, 1, 1,
-0.2449763, 1.303662, 1.282915, 1, 0, 0, 1, 1,
-0.2438526, 1.61313, 0.7704857, 0, 0, 0, 1, 1,
-0.2396069, 0.02707066, -2.535686, 0, 0, 0, 1, 1,
-0.233011, 0.9574983, 2.306298, 0, 0, 0, 1, 1,
-0.2314919, -0.2314687, -0.1727733, 0, 0, 0, 1, 1,
-0.2314338, -0.01768577, -1.120051, 0, 0, 0, 1, 1,
-0.2264083, 0.1569549, 1.898173, 0, 0, 0, 1, 1,
-0.2244146, -0.9396374, 0.07701642, 0, 0, 0, 1, 1,
-0.2176998, 0.04353078, -2.997407, 1, 1, 1, 1, 1,
-0.2158801, 1.647657, -0.166617, 1, 1, 1, 1, 1,
-0.2127745, 1.477536, 0.693446, 1, 1, 1, 1, 1,
-0.2096742, -0.8615702, -3.392673, 1, 1, 1, 1, 1,
-0.2062361, 2.121364, 0.84863, 1, 1, 1, 1, 1,
-0.2044144, -0.01895258, -1.993077, 1, 1, 1, 1, 1,
-0.203861, 0.1002638, -2.95587, 1, 1, 1, 1, 1,
-0.2037385, 1.101534, 0.3413667, 1, 1, 1, 1, 1,
-0.2023707, 0.1671309, -1.295559, 1, 1, 1, 1, 1,
-0.1993238, -0.2989584, -1.178504, 1, 1, 1, 1, 1,
-0.1902199, -2.04198, -4.060904, 1, 1, 1, 1, 1,
-0.1901539, 0.3888389, 1.860717, 1, 1, 1, 1, 1,
-0.1877072, -1.616938, -3.16745, 1, 1, 1, 1, 1,
-0.183342, -1.677674, -3.711657, 1, 1, 1, 1, 1,
-0.1670681, 1.429344, 0.4782219, 1, 1, 1, 1, 1,
-0.1659055, -0.8148651, -3.94309, 0, 0, 1, 1, 1,
-0.1611003, 0.8895673, -0.01504707, 1, 0, 0, 1, 1,
-0.1594286, -0.3574867, -1.906591, 1, 0, 0, 1, 1,
-0.1577422, -0.3917347, -2.561566, 1, 0, 0, 1, 1,
-0.157027, -2.312397, -3.1794, 1, 0, 0, 1, 1,
-0.1551668, -0.6753286, -1.992424, 1, 0, 0, 1, 1,
-0.1549287, -1.633829, -4.175037, 0, 0, 0, 1, 1,
-0.1541584, 0.6420581, -0.1749347, 0, 0, 0, 1, 1,
-0.1508228, 0.0503694, -1.86461, 0, 0, 0, 1, 1,
-0.1474963, -1.344774, -2.456052, 0, 0, 0, 1, 1,
-0.1443334, 0.1124419, -0.3268979, 0, 0, 0, 1, 1,
-0.1422877, 0.322621, -0.7714821, 0, 0, 0, 1, 1,
-0.1388129, -0.7227827, -3.498211, 0, 0, 0, 1, 1,
-0.1364832, -0.6272085, -2.814177, 1, 1, 1, 1, 1,
-0.1361678, 0.6397239, 2.268284, 1, 1, 1, 1, 1,
-0.133792, 1.777204, -0.3468945, 1, 1, 1, 1, 1,
-0.125488, -0.3388191, -3.857617, 1, 1, 1, 1, 1,
-0.1230316, -1.882211, -4.66322, 1, 1, 1, 1, 1,
-0.1209966, 0.6245193, -0.5051544, 1, 1, 1, 1, 1,
-0.119643, -0.7523468, -2.665306, 1, 1, 1, 1, 1,
-0.1164575, 0.4360057, -0.8449955, 1, 1, 1, 1, 1,
-0.1123767, -0.7936245, -3.970691, 1, 1, 1, 1, 1,
-0.1077926, -0.3332871, -3.089181, 1, 1, 1, 1, 1,
-0.1034787, -1.185354, -4.475434, 1, 1, 1, 1, 1,
-0.1010088, -0.5630111, -3.640597, 1, 1, 1, 1, 1,
-0.1007814, -1.62534, -2.431756, 1, 1, 1, 1, 1,
-0.09964282, -0.7718845, -2.032533, 1, 1, 1, 1, 1,
-0.09523069, -0.02934355, -1.880099, 1, 1, 1, 1, 1,
-0.09256571, 0.2920752, -0.5320622, 0, 0, 1, 1, 1,
-0.09220499, 1.971464, 0.2794102, 1, 0, 0, 1, 1,
-0.0911985, 0.2035382, -1.141108, 1, 0, 0, 1, 1,
-0.08747721, 1.524248, -0.9865964, 1, 0, 0, 1, 1,
-0.08656595, -0.2691422, -2.163325, 1, 0, 0, 1, 1,
-0.08622955, 0.3355963, -0.5454464, 1, 0, 0, 1, 1,
-0.07916905, 0.1030411, -1.052927, 0, 0, 0, 1, 1,
-0.07166899, 1.637294, 0.01679041, 0, 0, 0, 1, 1,
-0.06870509, -0.4717032, -1.846595, 0, 0, 0, 1, 1,
-0.06726337, -0.6627423, -2.556965, 0, 0, 0, 1, 1,
-0.06550808, -0.7412476, -3.795446, 0, 0, 0, 1, 1,
-0.06411081, -1.375105, -3.915279, 0, 0, 0, 1, 1,
-0.05949377, -0.2398619, -2.658811, 0, 0, 0, 1, 1,
-0.05773989, 2.014954, -0.8136683, 1, 1, 1, 1, 1,
-0.05544459, -1.51955, -1.846234, 1, 1, 1, 1, 1,
-0.05389326, 0.6093664, 0.7843722, 1, 1, 1, 1, 1,
-0.05251484, -0.6745911, -2.798804, 1, 1, 1, 1, 1,
-0.04989588, -0.1817497, -0.9999972, 1, 1, 1, 1, 1,
-0.04521369, -1.147701, -2.969936, 1, 1, 1, 1, 1,
-0.04308012, 0.352677, -0.3285418, 1, 1, 1, 1, 1,
-0.03963032, 0.7720748, -1.957722, 1, 1, 1, 1, 1,
-0.03919821, 0.5487043, 2.224974, 1, 1, 1, 1, 1,
-0.03880973, -0.3527308, -3.242767, 1, 1, 1, 1, 1,
-0.03786109, -0.4828357, -1.718537, 1, 1, 1, 1, 1,
-0.03701528, -0.1600142, -4.058937, 1, 1, 1, 1, 1,
-0.03590515, 0.533071, 0.3125252, 1, 1, 1, 1, 1,
-0.03568674, -0.3106351, -2.938293, 1, 1, 1, 1, 1,
-0.03524866, 1.260954, -2.448173, 1, 1, 1, 1, 1,
-0.03224184, -0.9535632, -4.182574, 0, 0, 1, 1, 1,
-0.02876018, -1.091489, -3.872707, 1, 0, 0, 1, 1,
-0.02844102, 0.5144815, -0.1649475, 1, 0, 0, 1, 1,
-0.0279892, -1.113918, -2.779036, 1, 0, 0, 1, 1,
-0.02707528, -0.8997903, -1.797815, 1, 0, 0, 1, 1,
-0.02538318, -0.9134663, -3.141706, 1, 0, 0, 1, 1,
-0.02355696, -0.03445816, -3.281934, 0, 0, 0, 1, 1,
-0.01516489, 0.6342547, -1.06525, 0, 0, 0, 1, 1,
-0.01183743, 1.512842, -0.8837656, 0, 0, 0, 1, 1,
-0.01101701, 1.683261, 0.01836416, 0, 0, 0, 1, 1,
-0.008537808, 0.484874, 1.146113, 0, 0, 0, 1, 1,
-0.008209749, 0.8344868, 0.8937068, 0, 0, 0, 1, 1,
-0.002488865, 0.2168624, 0.469342, 0, 0, 0, 1, 1,
0.001453676, -0.3018129, 1.870224, 1, 1, 1, 1, 1,
0.002298869, -0.4380096, 4.257423, 1, 1, 1, 1, 1,
0.004466819, 1.768766, -2.311286, 1, 1, 1, 1, 1,
0.004674674, 0.5793048, -0.2708946, 1, 1, 1, 1, 1,
0.007806043, 2.829314, -0.9876133, 1, 1, 1, 1, 1,
0.009346681, 0.5907863, 0.4024712, 1, 1, 1, 1, 1,
0.009958627, -0.2775745, 3.888068, 1, 1, 1, 1, 1,
0.01725491, -1.815828, 2.177529, 1, 1, 1, 1, 1,
0.0196874, -0.06992158, 3.141342, 1, 1, 1, 1, 1,
0.02330321, -1.109691, 2.793179, 1, 1, 1, 1, 1,
0.02449943, -0.4039685, 3.249736, 1, 1, 1, 1, 1,
0.0279149, 0.3761468, 1.140691, 1, 1, 1, 1, 1,
0.02818872, -0.2292835, 3.917313, 1, 1, 1, 1, 1,
0.03047685, -0.4075893, 1.510145, 1, 1, 1, 1, 1,
0.03147792, -0.3667613, 2.781157, 1, 1, 1, 1, 1,
0.03376943, 0.3079671, -0.4343979, 0, 0, 1, 1, 1,
0.03644264, -0.06494142, 1.656317, 1, 0, 0, 1, 1,
0.03656508, -0.008237344, 0.9427293, 1, 0, 0, 1, 1,
0.03714616, -1.362151, 3.346881, 1, 0, 0, 1, 1,
0.03783206, -0.5170081, 2.169083, 1, 0, 0, 1, 1,
0.04013404, -1.7892, 2.011481, 1, 0, 0, 1, 1,
0.04146769, -0.7250012, 4.057345, 0, 0, 0, 1, 1,
0.04226347, -0.9096257, 2.953168, 0, 0, 0, 1, 1,
0.04263549, 1.476614, -0.6112865, 0, 0, 0, 1, 1,
0.04459639, 0.9050226, 0.308678, 0, 0, 0, 1, 1,
0.04464437, 0.08355349, 0.681685, 0, 0, 0, 1, 1,
0.04546501, 1.830906, 2.105713, 0, 0, 0, 1, 1,
0.04759511, 0.4672399, 1.534448, 0, 0, 0, 1, 1,
0.05125425, -0.7130457, 2.406275, 1, 1, 1, 1, 1,
0.05133158, 2.081606, -1.501916, 1, 1, 1, 1, 1,
0.05230894, 0.2486275, -1.481396, 1, 1, 1, 1, 1,
0.05512648, -0.2433932, 2.892462, 1, 1, 1, 1, 1,
0.05918713, 0.5275858, 0.5874125, 1, 1, 1, 1, 1,
0.06589206, 0.1813608, 0.4144689, 1, 1, 1, 1, 1,
0.0681769, 0.9759101, -0.3753192, 1, 1, 1, 1, 1,
0.07171224, 0.3888364, -0.7421523, 1, 1, 1, 1, 1,
0.07533021, 1.557585, -1.347639, 1, 1, 1, 1, 1,
0.0781188, 0.1904459, 0.6004252, 1, 1, 1, 1, 1,
0.08245402, 0.6128677, 0.09523429, 1, 1, 1, 1, 1,
0.08670751, -0.9276488, 2.318027, 1, 1, 1, 1, 1,
0.08788269, -0.4716035, 4.530019, 1, 1, 1, 1, 1,
0.08877032, 1.791313, 0.02349964, 1, 1, 1, 1, 1,
0.08978866, -0.09647009, 2.676231, 1, 1, 1, 1, 1,
0.09397842, -0.524706, 2.742204, 0, 0, 1, 1, 1,
0.09410802, -0.5963809, 4.641947, 1, 0, 0, 1, 1,
0.09496001, -0.7008355, 3.101188, 1, 0, 0, 1, 1,
0.09584943, 1.346061, -1.028027, 1, 0, 0, 1, 1,
0.100708, 0.01226154, 0.2568725, 1, 0, 0, 1, 1,
0.1042474, 0.7132629, 0.9926307, 1, 0, 0, 1, 1,
0.1046405, 1.317158, -0.8380492, 0, 0, 0, 1, 1,
0.1069695, -0.1078447, 1.032279, 0, 0, 0, 1, 1,
0.111925, 1.114465, 0.507822, 0, 0, 0, 1, 1,
0.1131324, 0.05838032, 2.051092, 0, 0, 0, 1, 1,
0.1143344, 0.5546389, 0.1248306, 0, 0, 0, 1, 1,
0.1168346, 0.2476662, 0.8593146, 0, 0, 0, 1, 1,
0.1183324, -0.5892919, 4.369463, 0, 0, 0, 1, 1,
0.1187321, 1.340099, -0.4901393, 1, 1, 1, 1, 1,
0.1198044, -1.200968, 3.875304, 1, 1, 1, 1, 1,
0.120652, -0.0417131, 0.9151113, 1, 1, 1, 1, 1,
0.123793, 0.02518095, -0.3393382, 1, 1, 1, 1, 1,
0.1240627, -0.4938076, 3.233448, 1, 1, 1, 1, 1,
0.1263189, -1.524178, 2.333792, 1, 1, 1, 1, 1,
0.1295501, -0.1299789, 1.188176, 1, 1, 1, 1, 1,
0.1303323, -0.1300519, 3.899544, 1, 1, 1, 1, 1,
0.1334317, -0.4118255, 4.325697, 1, 1, 1, 1, 1,
0.1380185, 1.735876, 0.1300464, 1, 1, 1, 1, 1,
0.1434726, -1.198887, 2.066422, 1, 1, 1, 1, 1,
0.1525946, -0.145141, 2.456227, 1, 1, 1, 1, 1,
0.1558346, -0.8253555, 3.38517, 1, 1, 1, 1, 1,
0.1606304, -0.07191676, 1.084726, 1, 1, 1, 1, 1,
0.1625637, -0.8274361, 3.792491, 1, 1, 1, 1, 1,
0.1644134, 0.01143092, -0.1000482, 0, 0, 1, 1, 1,
0.1649319, 0.7859351, 0.2810321, 1, 0, 0, 1, 1,
0.1680785, 0.9779647, 0.4974652, 1, 0, 0, 1, 1,
0.1692571, -0.5903405, 2.827958, 1, 0, 0, 1, 1,
0.1717804, -0.5851064, 2.726352, 1, 0, 0, 1, 1,
0.1720859, -0.5183992, 3.668257, 1, 0, 0, 1, 1,
0.1732139, 0.343085, 0.4639977, 0, 0, 0, 1, 1,
0.1826325, 0.2277152, 0.8439983, 0, 0, 0, 1, 1,
0.1857374, -0.3665788, 2.946049, 0, 0, 0, 1, 1,
0.1877901, 0.3465346, 1.513843, 0, 0, 0, 1, 1,
0.1888042, -0.8997135, 1.586261, 0, 0, 0, 1, 1,
0.1942239, -1.062961, 2.753588, 0, 0, 0, 1, 1,
0.1969733, 0.2662058, 0.6225483, 0, 0, 0, 1, 1,
0.1969797, 1.400461, 1.028863, 1, 1, 1, 1, 1,
0.1984172, 0.6001788, 0.4262151, 1, 1, 1, 1, 1,
0.2026492, -2.342553, 2.973753, 1, 1, 1, 1, 1,
0.2027489, 0.673476, 0.09890762, 1, 1, 1, 1, 1,
0.2044565, -1.498348, 1.786826, 1, 1, 1, 1, 1,
0.206603, 0.5855829, -0.3600444, 1, 1, 1, 1, 1,
0.2091101, 0.672356, 1.05094, 1, 1, 1, 1, 1,
0.2114006, -0.614839, 1.787633, 1, 1, 1, 1, 1,
0.2146246, 0.3608534, -0.5450894, 1, 1, 1, 1, 1,
0.2146393, -0.2143106, 2.084667, 1, 1, 1, 1, 1,
0.2171355, -0.3905186, 2.475042, 1, 1, 1, 1, 1,
0.2237156, 1.209322, -1.05922, 1, 1, 1, 1, 1,
0.2265648, 0.6849571, -0.2645705, 1, 1, 1, 1, 1,
0.229054, 0.7737511, -0.621567, 1, 1, 1, 1, 1,
0.2355088, 0.1555885, 0.9871328, 1, 1, 1, 1, 1,
0.2363043, 0.2180209, 1.639656, 0, 0, 1, 1, 1,
0.2388894, 1.089136, 0.9515404, 1, 0, 0, 1, 1,
0.2388988, -0.1042047, 1.241444, 1, 0, 0, 1, 1,
0.2395857, -0.2865986, 2.04918, 1, 0, 0, 1, 1,
0.2429291, -0.2418795, 3.608494, 1, 0, 0, 1, 1,
0.2445389, 0.6962481, -0.6818306, 1, 0, 0, 1, 1,
0.2456967, 0.7256736, -0.5605386, 0, 0, 0, 1, 1,
0.2458405, 1.426226, -1.052023, 0, 0, 0, 1, 1,
0.2518142, -0.09534457, 2.52265, 0, 0, 0, 1, 1,
0.2563318, -0.7405339, 2.499118, 0, 0, 0, 1, 1,
0.258399, 1.391498, -0.1610402, 0, 0, 0, 1, 1,
0.2684353, 0.1305092, 1.0084, 0, 0, 0, 1, 1,
0.2712414, 1.558537, 0.3707538, 0, 0, 0, 1, 1,
0.2720222, 1.295976, -1.309673, 1, 1, 1, 1, 1,
0.2738422, 1.104721, -0.1331983, 1, 1, 1, 1, 1,
0.2804086, 0.8001875, -1.240685, 1, 1, 1, 1, 1,
0.2811966, 0.6228658, -2.404202, 1, 1, 1, 1, 1,
0.2817495, 0.05066176, 3.457813, 1, 1, 1, 1, 1,
0.2844391, -1.569565, 4.232493, 1, 1, 1, 1, 1,
0.2855332, -0.1634184, 0.8222851, 1, 1, 1, 1, 1,
0.2874756, 1.650224, -0.5214358, 1, 1, 1, 1, 1,
0.2886839, -0.826914, 3.177288, 1, 1, 1, 1, 1,
0.2891994, 2.420187, -0.4797339, 1, 1, 1, 1, 1,
0.2912838, -0.423402, 2.735176, 1, 1, 1, 1, 1,
0.2923615, 0.08181188, 2.7307, 1, 1, 1, 1, 1,
0.2945227, -2.962641, 3.74825, 1, 1, 1, 1, 1,
0.3021953, -2.02756, 2.57742, 1, 1, 1, 1, 1,
0.3053667, -2.39889, 2.449641, 1, 1, 1, 1, 1,
0.3059241, 0.2278702, 0.8942585, 0, 0, 1, 1, 1,
0.309907, -1.129999, 2.988857, 1, 0, 0, 1, 1,
0.324281, -0.4616883, 1.484861, 1, 0, 0, 1, 1,
0.3245676, -0.6249894, 2.58237, 1, 0, 0, 1, 1,
0.3249267, -1.206845, 2.267244, 1, 0, 0, 1, 1,
0.3284358, -0.002683214, 0.5875148, 1, 0, 0, 1, 1,
0.3337326, 0.4451531, 1.724199, 0, 0, 0, 1, 1,
0.3387468, -0.2250519, 1.176642, 0, 0, 0, 1, 1,
0.3408949, 0.2690598, 1.745713, 0, 0, 0, 1, 1,
0.3438953, 0.7084395, -1.365255, 0, 0, 0, 1, 1,
0.3472246, 0.9488651, -0.4591449, 0, 0, 0, 1, 1,
0.3520854, -0.289066, 1.287026, 0, 0, 0, 1, 1,
0.3523849, -0.3703346, 2.434544, 0, 0, 0, 1, 1,
0.3540372, -0.1035867, 0.5278901, 1, 1, 1, 1, 1,
0.355238, 0.004331617, 3.018495, 1, 1, 1, 1, 1,
0.3555059, -1.651856, 2.760156, 1, 1, 1, 1, 1,
0.3621793, 0.7083673, 0.3821186, 1, 1, 1, 1, 1,
0.362341, 0.2380628, 1.06949, 1, 1, 1, 1, 1,
0.3634741, 1.335299, 1.294565, 1, 1, 1, 1, 1,
0.3638546, -0.6579574, 1.99455, 1, 1, 1, 1, 1,
0.3670524, 0.7149525, 0.9585812, 1, 1, 1, 1, 1,
0.3673626, -0.5756161, 4.247533, 1, 1, 1, 1, 1,
0.3710769, -0.4984303, 3.776325, 1, 1, 1, 1, 1,
0.3748059, 0.9346577, -0.700919, 1, 1, 1, 1, 1,
0.374819, -0.4705752, 0.5118346, 1, 1, 1, 1, 1,
0.3778954, 0.6649083, 0.1442135, 1, 1, 1, 1, 1,
0.3840147, 0.9394189, 0.9896401, 1, 1, 1, 1, 1,
0.3853907, -1.162842, 2.792037, 1, 1, 1, 1, 1,
0.3858486, 0.5198953, 2.791125, 0, 0, 1, 1, 1,
0.3878936, 0.6201301, 1.104203, 1, 0, 0, 1, 1,
0.3933294, -1.544246, 3.152297, 1, 0, 0, 1, 1,
0.3949537, -1.182707, 3.767395, 1, 0, 0, 1, 1,
0.403733, -0.06767031, 1.341292, 1, 0, 0, 1, 1,
0.4047419, 0.216917, -0.6956965, 1, 0, 0, 1, 1,
0.4047476, 0.8022485, -0.06387492, 0, 0, 0, 1, 1,
0.4072413, 0.02949187, 2.634666, 0, 0, 0, 1, 1,
0.4136279, 0.5657524, 0.9174084, 0, 0, 0, 1, 1,
0.4142995, 0.7105412, 2.184286, 0, 0, 0, 1, 1,
0.4149754, 2.301666, -0.07389213, 0, 0, 0, 1, 1,
0.4194331, 0.4852138, 2.171196, 0, 0, 0, 1, 1,
0.4194537, -0.4618442, 2.948352, 0, 0, 0, 1, 1,
0.4268738, 0.7192482, 2.406436, 1, 1, 1, 1, 1,
0.4274352, -1.59492, 4.233819, 1, 1, 1, 1, 1,
0.433994, -1.02439, 1.907512, 1, 1, 1, 1, 1,
0.4368331, 0.6045672, 2.139856, 1, 1, 1, 1, 1,
0.4377479, 1.09157, 1.238873, 1, 1, 1, 1, 1,
0.4399416, -0.02969346, 2.208136, 1, 1, 1, 1, 1,
0.4420618, 0.6146818, -1.113727, 1, 1, 1, 1, 1,
0.4441999, 0.8865261, 0.2750938, 1, 1, 1, 1, 1,
0.4478946, -0.2092256, 1.393397, 1, 1, 1, 1, 1,
0.4488781, 0.07304557, 1.201746, 1, 1, 1, 1, 1,
0.4541743, 0.0269829, 0.4231486, 1, 1, 1, 1, 1,
0.4554833, 0.3106572, 1.607252, 1, 1, 1, 1, 1,
0.4570883, -0.6512693, 2.858421, 1, 1, 1, 1, 1,
0.4580424, -0.5817306, 3.494134, 1, 1, 1, 1, 1,
0.458688, -1.167551, 2.840364, 1, 1, 1, 1, 1,
0.4606941, -0.9566015, 0.858067, 0, 0, 1, 1, 1,
0.4662524, 2.287443, -0.02538681, 1, 0, 0, 1, 1,
0.467525, -1.709647, 1.651583, 1, 0, 0, 1, 1,
0.4683286, -0.4576823, 2.398999, 1, 0, 0, 1, 1,
0.4698871, 0.4237565, 0.2545845, 1, 0, 0, 1, 1,
0.4732914, 0.7503098, -0.2151411, 1, 0, 0, 1, 1,
0.4737967, 0.6620685, 0.2574135, 0, 0, 0, 1, 1,
0.4738116, -0.3517036, 1.081563, 0, 0, 0, 1, 1,
0.4793546, -1.081905, 1.412916, 0, 0, 0, 1, 1,
0.4824794, -0.2371253, 0.7148107, 0, 0, 0, 1, 1,
0.4867552, 0.4439896, -0.2883928, 0, 0, 0, 1, 1,
0.4974691, -0.6218575, 1.147601, 0, 0, 0, 1, 1,
0.4989614, -0.7065023, 1.408585, 0, 0, 0, 1, 1,
0.5049769, -0.1957464, 0.4820686, 1, 1, 1, 1, 1,
0.5056182, -0.7626034, 3.729954, 1, 1, 1, 1, 1,
0.5083076, -1.247122, 1.14987, 1, 1, 1, 1, 1,
0.522508, 0.4217268, -0.0401107, 1, 1, 1, 1, 1,
0.5228335, -2.375826, 4.307248, 1, 1, 1, 1, 1,
0.5267748, -0.6035749, 4.083467, 1, 1, 1, 1, 1,
0.5274209, 0.4955715, -0.02762996, 1, 1, 1, 1, 1,
0.5289197, 1.974851, -2.404391, 1, 1, 1, 1, 1,
0.5296255, -0.1734072, 1.631223, 1, 1, 1, 1, 1,
0.5308014, 0.7903792, 0.371989, 1, 1, 1, 1, 1,
0.5350055, -0.9135156, 2.020911, 1, 1, 1, 1, 1,
0.5358514, -1.299281, 2.212539, 1, 1, 1, 1, 1,
0.5360808, -1.616341, 2.931554, 1, 1, 1, 1, 1,
0.5366315, 0.8966832, 1.363113, 1, 1, 1, 1, 1,
0.5424595, 2.247516, 0.7276402, 1, 1, 1, 1, 1,
0.5526294, 1.526652, 0.3832467, 0, 0, 1, 1, 1,
0.5529471, 0.3535103, -0.204104, 1, 0, 0, 1, 1,
0.5542474, -0.6654217, 2.596769, 1, 0, 0, 1, 1,
0.5566736, 1.271815, 0.6122414, 1, 0, 0, 1, 1,
0.5596005, 1.35464, 1.165624, 1, 0, 0, 1, 1,
0.5604638, 1.117467, 1.043421, 1, 0, 0, 1, 1,
0.5677952, -1.125308, 2.543551, 0, 0, 0, 1, 1,
0.5772502, 0.1929203, 1.413331, 0, 0, 0, 1, 1,
0.5896858, -0.7128556, 2.447795, 0, 0, 0, 1, 1,
0.5935762, 0.03815811, 1.259898, 0, 0, 0, 1, 1,
0.5978459, 1.564283, -2.186058, 0, 0, 0, 1, 1,
0.6012781, 1.322014, -0.2089902, 0, 0, 0, 1, 1,
0.6125146, 0.9026589, 2.054427, 0, 0, 0, 1, 1,
0.6126643, 0.1994148, 1.713587, 1, 1, 1, 1, 1,
0.6126699, 1.345235, 0.3422039, 1, 1, 1, 1, 1,
0.6160278, -1.053235, 1.926023, 1, 1, 1, 1, 1,
0.6170328, -0.6078005, 2.476702, 1, 1, 1, 1, 1,
0.6173922, 2.148128, -1.525733, 1, 1, 1, 1, 1,
0.6193969, -0.4890441, 4.418825, 1, 1, 1, 1, 1,
0.6227245, 1.101044, -0.8466775, 1, 1, 1, 1, 1,
0.6259687, 1.78167, 2.241086, 1, 1, 1, 1, 1,
0.6276785, 0.2356663, 1.051835, 1, 1, 1, 1, 1,
0.6322762, -1.208471, 4.779768, 1, 1, 1, 1, 1,
0.6358009, 0.9077301, 1.486354, 1, 1, 1, 1, 1,
0.6402454, 0.3964941, -0.5673131, 1, 1, 1, 1, 1,
0.6457458, -0.1135169, 1.860679, 1, 1, 1, 1, 1,
0.6520901, 0.5924423, 0.5803522, 1, 1, 1, 1, 1,
0.6600778, -1.575998, 3.791884, 1, 1, 1, 1, 1,
0.6603649, 0.1460608, 0.2179735, 0, 0, 1, 1, 1,
0.6608603, 0.7029749, 0.4275748, 1, 0, 0, 1, 1,
0.6622937, 1.443564, -1.413548, 1, 0, 0, 1, 1,
0.6629007, -1.959054, 4.012997, 1, 0, 0, 1, 1,
0.663353, 0.3681645, 0.7481586, 1, 0, 0, 1, 1,
0.6651403, 0.2336449, 2.549316, 1, 0, 0, 1, 1,
0.665888, -0.1149245, 1.797202, 0, 0, 0, 1, 1,
0.66706, 0.3204415, 0.4752056, 0, 0, 0, 1, 1,
0.6672405, -2.124949, 1.494877, 0, 0, 0, 1, 1,
0.6686077, 0.3677016, 2.261806, 0, 0, 0, 1, 1,
0.6810007, -0.1454444, 1.805668, 0, 0, 0, 1, 1,
0.6827492, -0.09957787, 1.456553, 0, 0, 0, 1, 1,
0.6860809, -0.5867115, 1.203558, 0, 0, 0, 1, 1,
0.6867436, -1.255011, 2.459953, 1, 1, 1, 1, 1,
0.6894893, 0.05133597, 2.213605, 1, 1, 1, 1, 1,
0.6943612, -0.4217584, -0.2747407, 1, 1, 1, 1, 1,
0.6950582, -1.47542, 4.056669, 1, 1, 1, 1, 1,
0.6953599, 1.100364, 2.662741, 1, 1, 1, 1, 1,
0.6975234, 0.02792098, 2.097847, 1, 1, 1, 1, 1,
0.6985426, -0.8098961, 1.330623, 1, 1, 1, 1, 1,
0.7029555, -1.228601, 2.20918, 1, 1, 1, 1, 1,
0.7134193, 0.721381, 0.3030689, 1, 1, 1, 1, 1,
0.7147814, 1.471685, -0.8073666, 1, 1, 1, 1, 1,
0.7183145, 0.9628064, 0.6921291, 1, 1, 1, 1, 1,
0.7250385, -0.3544627, 4.078225, 1, 1, 1, 1, 1,
0.7253534, -0.5075636, 3.439662, 1, 1, 1, 1, 1,
0.7270138, -1.523618, 2.091286, 1, 1, 1, 1, 1,
0.7446227, 0.2358915, 0.9269759, 1, 1, 1, 1, 1,
0.7495101, -0.450672, 1.038422, 0, 0, 1, 1, 1,
0.7498937, 0.4069212, 1.901482, 1, 0, 0, 1, 1,
0.7505479, 2.630926, -0.3387748, 1, 0, 0, 1, 1,
0.7620233, -0.9564263, 2.295271, 1, 0, 0, 1, 1,
0.7631672, 0.6086087, -0.4135178, 1, 0, 0, 1, 1,
0.7707119, 1.022745, 1.022891, 1, 0, 0, 1, 1,
0.7721909, -1.864255, 3.391627, 0, 0, 0, 1, 1,
0.7748546, -0.1908114, 0.9136313, 0, 0, 0, 1, 1,
0.782343, -0.08207979, 1.616125, 0, 0, 0, 1, 1,
0.78679, 0.1867307, 2.113863, 0, 0, 0, 1, 1,
0.7881314, 0.9083217, 1.168865, 0, 0, 0, 1, 1,
0.7927131, 0.2241481, 1.95565, 0, 0, 0, 1, 1,
0.7928721, -0.4450994, 1.928083, 0, 0, 0, 1, 1,
0.793287, 0.6151096, -0.5783335, 1, 1, 1, 1, 1,
0.7950625, -1.227007, 3.301559, 1, 1, 1, 1, 1,
0.7985666, 1.320042, -0.3218821, 1, 1, 1, 1, 1,
0.8002146, -1.007689, 1.626971, 1, 1, 1, 1, 1,
0.8072196, 0.3113082, 1.10164, 1, 1, 1, 1, 1,
0.8087041, 0.7534263, 2.17168, 1, 1, 1, 1, 1,
0.8113214, -1.844314, 2.580461, 1, 1, 1, 1, 1,
0.8158346, -0.4191795, 2.595202, 1, 1, 1, 1, 1,
0.8185766, 0.7173916, 0.4377763, 1, 1, 1, 1, 1,
0.8249949, 1.019691, 1.205183, 1, 1, 1, 1, 1,
0.8292436, 0.0934578, 2.49028, 1, 1, 1, 1, 1,
0.8310763, -0.6105386, 5.874522, 1, 1, 1, 1, 1,
0.8314599, -0.9062062, 2.253116, 1, 1, 1, 1, 1,
0.8334679, -1.101307, 3.604798, 1, 1, 1, 1, 1,
0.8341453, -1.470589, 2.00869, 1, 1, 1, 1, 1,
0.8344762, 1.481429, 0.7589928, 0, 0, 1, 1, 1,
0.8360404, -0.2287243, 2.221052, 1, 0, 0, 1, 1,
0.8367287, -1.082337, 1.970905, 1, 0, 0, 1, 1,
0.8395692, 0.44808, -0.1430133, 1, 0, 0, 1, 1,
0.8461606, -0.05118651, 2.663085, 1, 0, 0, 1, 1,
0.8471437, 0.0003112805, 1.631914, 1, 0, 0, 1, 1,
0.848353, -0.7248239, 2.539825, 0, 0, 0, 1, 1,
0.8523225, -0.472404, 3.104885, 0, 0, 0, 1, 1,
0.854305, 0.5343027, 1.379729, 0, 0, 0, 1, 1,
0.8547031, 1.171398, 3.061904, 0, 0, 0, 1, 1,
0.8572701, -1.040034, 3.822759, 0, 0, 0, 1, 1,
0.8595938, -1.230072, 2.760914, 0, 0, 0, 1, 1,
0.8641525, -1.321679, 4.654617, 0, 0, 0, 1, 1,
0.866292, -0.936204, 3.204058, 1, 1, 1, 1, 1,
0.8695295, 0.8307506, 1.58485, 1, 1, 1, 1, 1,
0.8734836, 0.7870899, 1.728497, 1, 1, 1, 1, 1,
0.8755857, 0.5551491, 1.208348, 1, 1, 1, 1, 1,
0.8786889, -0.61995, 0.8312073, 1, 1, 1, 1, 1,
0.8801894, -1.320232, 2.366121, 1, 1, 1, 1, 1,
0.8812291, 0.6166952, 3.202374, 1, 1, 1, 1, 1,
0.8819613, -0.5045148, 1.495514, 1, 1, 1, 1, 1,
0.8951476, 1.182596, 0.5623666, 1, 1, 1, 1, 1,
0.8991939, -0.4730839, 2.150504, 1, 1, 1, 1, 1,
0.9013077, -2.458027, 2.999419, 1, 1, 1, 1, 1,
0.9017956, -2.171622, 2.369176, 1, 1, 1, 1, 1,
0.9018529, 0.2796994, 0.4468324, 1, 1, 1, 1, 1,
0.906337, 0.3581027, -0.3690316, 1, 1, 1, 1, 1,
0.9090566, -0.937259, 0.7050809, 1, 1, 1, 1, 1,
0.9105105, 0.9852276, 0.508121, 0, 0, 1, 1, 1,
0.9166803, 0.06083235, 1.00902, 1, 0, 0, 1, 1,
0.9184477, 0.7311954, 0.8431147, 1, 0, 0, 1, 1,
0.9226598, -0.4665932, 4.132396, 1, 0, 0, 1, 1,
0.922863, 1.685521, 1.34359, 1, 0, 0, 1, 1,
0.9239204, -1.248816, 0.4806683, 1, 0, 0, 1, 1,
0.9261605, 0.9983033, 0.8386559, 0, 0, 0, 1, 1,
0.9262389, 1.249399, 0.9423034, 0, 0, 0, 1, 1,
0.9285445, 0.06812529, 2.197628, 0, 0, 0, 1, 1,
0.9311159, 0.2692797, 2.493935, 0, 0, 0, 1, 1,
0.9395893, 1.551819, 0.3420491, 0, 0, 0, 1, 1,
0.9426271, 0.9466605, -0.2649621, 0, 0, 0, 1, 1,
0.9443581, -1.08753, 2.279717, 0, 0, 0, 1, 1,
0.945395, -0.4716474, 2.390486, 1, 1, 1, 1, 1,
0.947305, 1.530158, 0.3012167, 1, 1, 1, 1, 1,
0.9475498, -1.293642, 2.535085, 1, 1, 1, 1, 1,
0.9531104, 0.03032685, 2.524671, 1, 1, 1, 1, 1,
0.9542744, 0.9544377, 0.2234243, 1, 1, 1, 1, 1,
0.9542885, -0.270279, 0.6641212, 1, 1, 1, 1, 1,
0.9566597, 0.5098058, 1.220179, 1, 1, 1, 1, 1,
0.9574096, 0.1078129, -0.1991682, 1, 1, 1, 1, 1,
0.9615713, -0.4712666, 2.497254, 1, 1, 1, 1, 1,
0.9618917, 1.261153, 0.45273, 1, 1, 1, 1, 1,
0.963036, 0.9478357, 0.857603, 1, 1, 1, 1, 1,
0.9636172, 0.212308, 1.163773, 1, 1, 1, 1, 1,
0.9710839, -0.2613738, 2.160022, 1, 1, 1, 1, 1,
0.9750213, -0.9763103, 1.897186, 1, 1, 1, 1, 1,
0.9764276, -1.362511, 2.822928, 1, 1, 1, 1, 1,
0.9773157, 0.1510032, 2.351829, 0, 0, 1, 1, 1,
0.9780464, 0.5686171, 0.4593477, 1, 0, 0, 1, 1,
0.978848, -0.9953233, 1.316301, 1, 0, 0, 1, 1,
0.9805894, -0.5637584, 3.149197, 1, 0, 0, 1, 1,
0.986118, 0.2347422, 0.954731, 1, 0, 0, 1, 1,
0.9913946, -0.2057354, 3.130512, 1, 0, 0, 1, 1,
0.9930355, -0.533118, 1.860276, 0, 0, 0, 1, 1,
0.995793, 1.105211, 1.416772, 0, 0, 0, 1, 1,
1.008661, 0.055597, 2.389718, 0, 0, 0, 1, 1,
1.01088, -0.6208958, 1.364261, 0, 0, 0, 1, 1,
1.017814, -1.487668, 4.066914, 0, 0, 0, 1, 1,
1.02329, 0.1655416, 0.2782504, 0, 0, 0, 1, 1,
1.024807, -1.366842, 3.70144, 0, 0, 0, 1, 1,
1.026423, -0.5120567, 1.901602, 1, 1, 1, 1, 1,
1.032059, 0.9503023, -0.5523099, 1, 1, 1, 1, 1,
1.033341, 0.044636, 2.224303, 1, 1, 1, 1, 1,
1.041667, -0.3233823, 1.333996, 1, 1, 1, 1, 1,
1.052952, 0.2405984, 1.007631, 1, 1, 1, 1, 1,
1.05456, 0.2432183, 1.456968, 1, 1, 1, 1, 1,
1.055057, 1.526844, 0.6072913, 1, 1, 1, 1, 1,
1.058941, 0.031759, 3.564793, 1, 1, 1, 1, 1,
1.05925, -0.6726405, 3.94383, 1, 1, 1, 1, 1,
1.064041, 0.6055875, 2.093781, 1, 1, 1, 1, 1,
1.082797, -1.750742, 2.720085, 1, 1, 1, 1, 1,
1.085448, 0.1652474, 2.169858, 1, 1, 1, 1, 1,
1.091665, 1.651224, 1.970585, 1, 1, 1, 1, 1,
1.094462, -0.377809, 3.647659, 1, 1, 1, 1, 1,
1.096923, -0.3068719, 2.255951, 1, 1, 1, 1, 1,
1.100971, 1.088303, -0.9979045, 0, 0, 1, 1, 1,
1.101387, -0.04756093, 1.23733, 1, 0, 0, 1, 1,
1.10453, -1.203688, 3.055557, 1, 0, 0, 1, 1,
1.104541, -1.23053, 3.35095, 1, 0, 0, 1, 1,
1.106936, -0.813015, 2.176831, 1, 0, 0, 1, 1,
1.114186, 0.4364147, 1.027897, 1, 0, 0, 1, 1,
1.117236, -0.9116659, 1.301794, 0, 0, 0, 1, 1,
1.12343, 0.1672018, 0.2033264, 0, 0, 0, 1, 1,
1.125023, 0.08612207, 1.040279, 0, 0, 0, 1, 1,
1.14477, 0.205334, 4.57388, 0, 0, 0, 1, 1,
1.149216, -2.563795, 1.781616, 0, 0, 0, 1, 1,
1.149327, 0.01658249, 0.9958928, 0, 0, 0, 1, 1,
1.152416, -0.4389272, 0.159762, 0, 0, 0, 1, 1,
1.157513, 0.3651778, 0.8780787, 1, 1, 1, 1, 1,
1.166991, 0.8727961, -0.4530287, 1, 1, 1, 1, 1,
1.170201, -0.5966086, 2.652137, 1, 1, 1, 1, 1,
1.171518, -0.4176825, 2.868725, 1, 1, 1, 1, 1,
1.176006, 1.507272, 0.4540133, 1, 1, 1, 1, 1,
1.176169, 0.3855847, 0.04802867, 1, 1, 1, 1, 1,
1.194356, -2.687912, 4.022077, 1, 1, 1, 1, 1,
1.200983, 0.1372661, 1.478313, 1, 1, 1, 1, 1,
1.201993, 0.5039771, 0.9299671, 1, 1, 1, 1, 1,
1.20877, 0.6244115, 2.649482, 1, 1, 1, 1, 1,
1.21042, 0.4506041, 0.595073, 1, 1, 1, 1, 1,
1.210597, 2.009845, 2.134974, 1, 1, 1, 1, 1,
1.215742, -0.07899248, 1.727916, 1, 1, 1, 1, 1,
1.222662, 1.777588, 0.5630727, 1, 1, 1, 1, 1,
1.226339, -1.018851, 2.747265, 1, 1, 1, 1, 1,
1.22922, 1.596906, 0.9156267, 0, 0, 1, 1, 1,
1.251626, -0.8195953, 2.753302, 1, 0, 0, 1, 1,
1.252107, 0.4248827, 1.612141, 1, 0, 0, 1, 1,
1.262876, -0.09384772, 1.648537, 1, 0, 0, 1, 1,
1.268434, -0.1663704, 1.991861, 1, 0, 0, 1, 1,
1.269467, 1.588937, 0.9833461, 1, 0, 0, 1, 1,
1.269566, -0.8380298, 2.02134, 0, 0, 0, 1, 1,
1.271773, 0.6735239, 1.873337, 0, 0, 0, 1, 1,
1.271927, 1.16344, -1.065213, 0, 0, 0, 1, 1,
1.27989, -0.5191866, 1.32419, 0, 0, 0, 1, 1,
1.283905, 0.5378563, 1.632929, 0, 0, 0, 1, 1,
1.28935, 0.4224218, 2.040638, 0, 0, 0, 1, 1,
1.299766, -0.4035499, 1.943474, 0, 0, 0, 1, 1,
1.300588, 0.5343884, 1.052677, 1, 1, 1, 1, 1,
1.314853, -1.064975, 2.289653, 1, 1, 1, 1, 1,
1.320045, 0.6836934, -0.8790128, 1, 1, 1, 1, 1,
1.324229, 2.136502, -1.063965, 1, 1, 1, 1, 1,
1.326928, 0.5335644, 1.448874, 1, 1, 1, 1, 1,
1.338152, -1.769923, 2.446485, 1, 1, 1, 1, 1,
1.351399, -0.3755394, 2.408067, 1, 1, 1, 1, 1,
1.356022, 1.227143, 1.253964, 1, 1, 1, 1, 1,
1.366099, -0.04770793, 2.580856, 1, 1, 1, 1, 1,
1.371328, 1.194668, 0.9735071, 1, 1, 1, 1, 1,
1.376845, 1.770857, 0.09384476, 1, 1, 1, 1, 1,
1.37703, 0.2650156, 0.9793735, 1, 1, 1, 1, 1,
1.381727, -2.031147, 1.497472, 1, 1, 1, 1, 1,
1.389085, 0.1566171, 1.417016, 1, 1, 1, 1, 1,
1.38955, 1.117914, -0.1948541, 1, 1, 1, 1, 1,
1.392514, -1.885807, 1.807411, 0, 0, 1, 1, 1,
1.393371, -0.9639198, 1.428395, 1, 0, 0, 1, 1,
1.396078, 0.4273223, 0.5124783, 1, 0, 0, 1, 1,
1.396782, 0.6241108, 1.879376, 1, 0, 0, 1, 1,
1.404257, 0.499512, 0.7051235, 1, 0, 0, 1, 1,
1.413126, 0.2735254, 0.337247, 1, 0, 0, 1, 1,
1.416181, -0.3073584, 2.933331, 0, 0, 0, 1, 1,
1.42047, 0.6904904, -0.002596988, 0, 0, 0, 1, 1,
1.445682, 1.109186, 2.156955, 0, 0, 0, 1, 1,
1.454421, -0.3016825, 2.477252, 0, 0, 0, 1, 1,
1.454887, -1.161615, 4.026693, 0, 0, 0, 1, 1,
1.455416, -1.689695, 2.999449, 0, 0, 0, 1, 1,
1.456238, -0.2502872, 2.206063, 0, 0, 0, 1, 1,
1.465409, 0.3363271, 0.4264627, 1, 1, 1, 1, 1,
1.478939, -0.4290147, 2.686355, 1, 1, 1, 1, 1,
1.487459, -0.1564617, 2.273331, 1, 1, 1, 1, 1,
1.498895, 0.9013639, 0.6486786, 1, 1, 1, 1, 1,
1.501969, -1.80837, 2.643666, 1, 1, 1, 1, 1,
1.504767, 0.5304619, 1.474953, 1, 1, 1, 1, 1,
1.536759, 0.3727496, 1.579366, 1, 1, 1, 1, 1,
1.543301, -0.3933684, 2.404232, 1, 1, 1, 1, 1,
1.547007, -0.7878944, 2.195634, 1, 1, 1, 1, 1,
1.547722, -0.2988867, 0.1446593, 1, 1, 1, 1, 1,
1.548124, 0.2661745, 1.167032, 1, 1, 1, 1, 1,
1.554537, 0.5345461, 0.6462179, 1, 1, 1, 1, 1,
1.567359, 1.477074, 1.115498, 1, 1, 1, 1, 1,
1.607112, -0.681435, 3.166338, 1, 1, 1, 1, 1,
1.620002, -1.309021, 3.67987, 1, 1, 1, 1, 1,
1.621616, 0.6185995, -0.4077165, 0, 0, 1, 1, 1,
1.630796, -0.4092687, 1.593412, 1, 0, 0, 1, 1,
1.631997, -0.4308957, 2.392527, 1, 0, 0, 1, 1,
1.651147, -0.4033074, 1.580862, 1, 0, 0, 1, 1,
1.664577, -0.1286292, 2.839864, 1, 0, 0, 1, 1,
1.669204, 0.09768829, 2.13117, 1, 0, 0, 1, 1,
1.683643, -1.96893, 2.967855, 0, 0, 0, 1, 1,
1.69508, -0.6341261, 0.1988555, 0, 0, 0, 1, 1,
1.750748, -1.396391, 2.260963, 0, 0, 0, 1, 1,
1.753904, -0.6825742, 0.3021202, 0, 0, 0, 1, 1,
1.758255, -1.220113, 0.1344098, 0, 0, 0, 1, 1,
1.790187, 0.5322839, 0.8437508, 0, 0, 0, 1, 1,
1.810455, -0.6031309, 3.807512, 0, 0, 0, 1, 1,
1.823672, 0.9162098, 1.546577, 1, 1, 1, 1, 1,
1.858084, -0.03819098, 1.995687, 1, 1, 1, 1, 1,
1.867327, -0.6891699, 1.918753, 1, 1, 1, 1, 1,
1.867567, 0.6116757, 2.306089, 1, 1, 1, 1, 1,
1.879656, 0.9624642, 0.3425735, 1, 1, 1, 1, 1,
1.901063, 0.4392576, 2.502086, 1, 1, 1, 1, 1,
1.917024, 0.5461385, 2.518808, 1, 1, 1, 1, 1,
1.950104, 3.316096, 2.087877, 1, 1, 1, 1, 1,
1.956459, -0.4006613, 2.250047, 1, 1, 1, 1, 1,
1.968783, 1.327801, 0.1768614, 1, 1, 1, 1, 1,
1.986974, 1.022932, 1.355312, 1, 1, 1, 1, 1,
2.051417, -1.452842, 2.502242, 1, 1, 1, 1, 1,
2.05753, -0.4207953, 2.232468, 1, 1, 1, 1, 1,
2.06125, 0.9536468, 2.259094, 1, 1, 1, 1, 1,
2.093873, 1.194821, 0.6401021, 1, 1, 1, 1, 1,
2.110301, -0.471491, 3.463829, 0, 0, 1, 1, 1,
2.117269, 0.5471764, 0.8185937, 1, 0, 0, 1, 1,
2.131743, 0.4867128, 2.379442, 1, 0, 0, 1, 1,
2.157528, 0.5699195, 0.2041531, 1, 0, 0, 1, 1,
2.160574, 1.050479, 1.222463, 1, 0, 0, 1, 1,
2.201783, -1.095422, 1.371666, 1, 0, 0, 1, 1,
2.240869, -0.9450259, 3.002782, 0, 0, 0, 1, 1,
2.306785, 0.7221112, 1.470756, 0, 0, 0, 1, 1,
2.327327, 0.1030887, 2.100038, 0, 0, 0, 1, 1,
2.347952, 0.9804652, 0.1748854, 0, 0, 0, 1, 1,
2.366087, -1.791341, 1.192961, 0, 0, 0, 1, 1,
2.409326, 0.9020059, 0.3934744, 0, 0, 0, 1, 1,
2.424221, -0.4574672, 1.221979, 0, 0, 0, 1, 1,
2.490268, -0.8850558, 3.398197, 1, 1, 1, 1, 1,
2.520285, 0.3571499, 2.094807, 1, 1, 1, 1, 1,
2.539106, -0.9780581, 0.02307185, 1, 1, 1, 1, 1,
2.546384, -0.5655094, 2.223374, 1, 1, 1, 1, 1,
2.717949, -1.307542, 1.374655, 1, 1, 1, 1, 1,
2.752651, 0.5632497, 2.236979, 1, 1, 1, 1, 1,
3.753959, 1.789613, 1.115786, 1, 1, 1, 1, 1
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
var radius = 10.04874;
var distance = 35.29578;
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
mvMatrix.translate( -0.04583645, 0.09867716, -0.4095674 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.29578);
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