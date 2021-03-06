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
-3.655801, 0.7985628, -0.2504355, 1, 0, 0, 1,
-3.525927, -2.460163, -2.440652, 1, 0.007843138, 0, 1,
-3.104916, -0.3872409, -2.258275, 1, 0.01176471, 0, 1,
-3.102122, 0.3478802, -1.34421, 1, 0.01960784, 0, 1,
-2.672101, -1.674664, -2.976704, 1, 0.02352941, 0, 1,
-2.521525, -0.7314119, -4.007443, 1, 0.03137255, 0, 1,
-2.421307, 0.1256489, -2.346049, 1, 0.03529412, 0, 1,
-2.353356, 1.847043, 0.1415135, 1, 0.04313726, 0, 1,
-2.340272, -1.174474, -2.651125, 1, 0.04705882, 0, 1,
-2.311201, -0.6738106, -2.197494, 1, 0.05490196, 0, 1,
-2.165262, 0.398976, -0.8085683, 1, 0.05882353, 0, 1,
-2.157084, -1.629755, -4.381586, 1, 0.06666667, 0, 1,
-2.155275, 0.01477822, -3.923924, 1, 0.07058824, 0, 1,
-2.11242, 1.070864, -0.816838, 1, 0.07843138, 0, 1,
-2.050167, 1.183871, -1.358414, 1, 0.08235294, 0, 1,
-2.026789, -1.035719, -2.24944, 1, 0.09019608, 0, 1,
-2.025201, 1.210196, -0.9122554, 1, 0.09411765, 0, 1,
-2.020012, -2.011031, -2.923055, 1, 0.1019608, 0, 1,
-2.019882, 0.5222862, -1.188667, 1, 0.1098039, 0, 1,
-2.002802, 0.8000067, -0.4039627, 1, 0.1137255, 0, 1,
-1.989979, 0.3506199, 1.022656, 1, 0.1215686, 0, 1,
-1.972513, 0.6006008, -1.087952, 1, 0.1254902, 0, 1,
-1.954457, -1.091981, -1.923301, 1, 0.1333333, 0, 1,
-1.9419, -0.2539831, -1.11864, 1, 0.1372549, 0, 1,
-1.931412, 0.9935797, -1.241706, 1, 0.145098, 0, 1,
-1.874876, -2.646312, -2.1058, 1, 0.1490196, 0, 1,
-1.859006, -1.339287, -0.8076683, 1, 0.1568628, 0, 1,
-1.857003, 1.065825, -1.171738, 1, 0.1607843, 0, 1,
-1.830651, 1.043393, -0.2248573, 1, 0.1686275, 0, 1,
-1.798728, 1.443521, -0.6286308, 1, 0.172549, 0, 1,
-1.787645, -0.1353135, -0.7949733, 1, 0.1803922, 0, 1,
-1.775914, -0.1349652, -3.191721, 1, 0.1843137, 0, 1,
-1.762981, 0.1948145, -0.6527036, 1, 0.1921569, 0, 1,
-1.759897, 0.6154003, -0.6160194, 1, 0.1960784, 0, 1,
-1.752329, -0.7934079, -1.645288, 1, 0.2039216, 0, 1,
-1.747863, -0.14403, -2.711054, 1, 0.2117647, 0, 1,
-1.717291, -0.8718066, -2.533882, 1, 0.2156863, 0, 1,
-1.694983, 0.7736281, -2.523925, 1, 0.2235294, 0, 1,
-1.677215, -1.156349, -2.450801, 1, 0.227451, 0, 1,
-1.663656, -1.029678, -2.537372, 1, 0.2352941, 0, 1,
-1.654506, -0.7678005, -2.695348, 1, 0.2392157, 0, 1,
-1.647078, -0.9218035, -3.20165, 1, 0.2470588, 0, 1,
-1.620059, -0.3490983, -2.430122, 1, 0.2509804, 0, 1,
-1.618109, -1.026466, -4.578504, 1, 0.2588235, 0, 1,
-1.617254, 1.187088, 1.817127, 1, 0.2627451, 0, 1,
-1.558912, 0.4121276, -3.259887, 1, 0.2705882, 0, 1,
-1.542902, 0.7260336, -0.6590453, 1, 0.2745098, 0, 1,
-1.50142, 0.5753353, -2.01814, 1, 0.282353, 0, 1,
-1.499736, -1.463118, -2.378604, 1, 0.2862745, 0, 1,
-1.494801, 0.1003031, -0.5109063, 1, 0.2941177, 0, 1,
-1.470003, 0.5244637, -0.5420299, 1, 0.3019608, 0, 1,
-1.466588, 1.153384, -2.383017, 1, 0.3058824, 0, 1,
-1.464991, -2.200839, -3.002078, 1, 0.3137255, 0, 1,
-1.463018, 1.742533, -0.9289715, 1, 0.3176471, 0, 1,
-1.458835, 0.5270576, -1.734161, 1, 0.3254902, 0, 1,
-1.457569, -0.247566, -1.358971, 1, 0.3294118, 0, 1,
-1.426121, 0.4290411, -1.83785, 1, 0.3372549, 0, 1,
-1.425772, -0.5866459, -2.924461, 1, 0.3411765, 0, 1,
-1.411617, 0.5022828, -2.813077, 1, 0.3490196, 0, 1,
-1.41133, 0.5400645, -2.014751, 1, 0.3529412, 0, 1,
-1.407432, -0.47267, -1.779306, 1, 0.3607843, 0, 1,
-1.392778, 1.045951, -1.278637, 1, 0.3647059, 0, 1,
-1.390382, 0.2985631, -1.33986, 1, 0.372549, 0, 1,
-1.382215, 1.059329, -1.801476, 1, 0.3764706, 0, 1,
-1.376918, -2.083627, -1.723464, 1, 0.3843137, 0, 1,
-1.375368, -1.455158, -1.626832, 1, 0.3882353, 0, 1,
-1.364916, -0.3931942, -2.066049, 1, 0.3960784, 0, 1,
-1.354303, 0.7336626, -0.3221928, 1, 0.4039216, 0, 1,
-1.343377, 0.9637217, -1.646556, 1, 0.4078431, 0, 1,
-1.342836, -2.486026, -1.041638, 1, 0.4156863, 0, 1,
-1.334656, -1.357624, -3.354837, 1, 0.4196078, 0, 1,
-1.326751, 0.03815847, -1.198993, 1, 0.427451, 0, 1,
-1.319872, -0.2678398, -2.535357, 1, 0.4313726, 0, 1,
-1.317992, -0.383884, -2.734778, 1, 0.4392157, 0, 1,
-1.307895, 2.051759, -1.12719, 1, 0.4431373, 0, 1,
-1.306855, 1.140493, -1.892757, 1, 0.4509804, 0, 1,
-1.303332, -0.6411033, -0.09836943, 1, 0.454902, 0, 1,
-1.299724, -2.075224, -3.937906, 1, 0.4627451, 0, 1,
-1.298225, 0.5053456, -2.696118, 1, 0.4666667, 0, 1,
-1.290031, 0.702586, -1.463505, 1, 0.4745098, 0, 1,
-1.284602, 2.292288, -1.716697, 1, 0.4784314, 0, 1,
-1.254709, -2.431216, -1.93033, 1, 0.4862745, 0, 1,
-1.250182, -0.6342176, -1.475382, 1, 0.4901961, 0, 1,
-1.246126, -0.1947652, -0.8484947, 1, 0.4980392, 0, 1,
-1.242241, 0.2809534, -1.1048, 1, 0.5058824, 0, 1,
-1.237208, -0.03320884, -0.4563541, 1, 0.509804, 0, 1,
-1.233745, -1.232437, -3.310139, 1, 0.5176471, 0, 1,
-1.231143, -0.3016901, -1.127399, 1, 0.5215687, 0, 1,
-1.227967, -1.469841, -0.7624775, 1, 0.5294118, 0, 1,
-1.209477, 0.6911631, -0.5002911, 1, 0.5333334, 0, 1,
-1.208543, 2.304815, -0.5274253, 1, 0.5411765, 0, 1,
-1.196769, 1.133741, -1.818598, 1, 0.5450981, 0, 1,
-1.193542, 0.03294225, -1.561566, 1, 0.5529412, 0, 1,
-1.193414, -0.4618166, -2.400169, 1, 0.5568628, 0, 1,
-1.190911, 0.5815811, -2.634895, 1, 0.5647059, 0, 1,
-1.189503, 0.4979572, -1.404294, 1, 0.5686275, 0, 1,
-1.186784, 0.9217854, -2.767282, 1, 0.5764706, 0, 1,
-1.185626, -0.6565984, -0.5062729, 1, 0.5803922, 0, 1,
-1.172201, -0.3449443, -2.833386, 1, 0.5882353, 0, 1,
-1.155322, 0.8860966, -1.934824, 1, 0.5921569, 0, 1,
-1.150203, 0.5381336, -1.119519, 1, 0.6, 0, 1,
-1.145205, -1.740225, -0.3739754, 1, 0.6078432, 0, 1,
-1.134681, 0.5294543, -1.386743, 1, 0.6117647, 0, 1,
-1.122419, 0.8885748, 0.4957455, 1, 0.6196079, 0, 1,
-1.121261, 0.08334522, -2.014695, 1, 0.6235294, 0, 1,
-1.120854, 1.227791, -0.1207451, 1, 0.6313726, 0, 1,
-1.111835, -0.2291199, -0.8888198, 1, 0.6352941, 0, 1,
-1.085918, 2.129453, -1.380628, 1, 0.6431373, 0, 1,
-1.083655, 1.187563, -1.581523, 1, 0.6470588, 0, 1,
-1.078788, 1.451833, -0.2108507, 1, 0.654902, 0, 1,
-1.077716, -0.2070121, -0.4378102, 1, 0.6588235, 0, 1,
-1.077664, -1.964082, -3.008794, 1, 0.6666667, 0, 1,
-1.076335, 0.935036, -0.8456034, 1, 0.6705883, 0, 1,
-1.071205, 0.6507695, -2.655962, 1, 0.6784314, 0, 1,
-1.068614, -0.2438715, -1.931929, 1, 0.682353, 0, 1,
-1.067391, 0.2060127, 0.3335672, 1, 0.6901961, 0, 1,
-1.066577, -1.618411, -2.73601, 1, 0.6941177, 0, 1,
-1.062429, -0.3482515, -2.337697, 1, 0.7019608, 0, 1,
-1.060587, 0.3168845, -0.7420081, 1, 0.7098039, 0, 1,
-1.059505, 0.3645149, -1.594179, 1, 0.7137255, 0, 1,
-1.048151, 3.30765, -0.4496915, 1, 0.7215686, 0, 1,
-1.048011, 0.1131992, -1.813297, 1, 0.7254902, 0, 1,
-1.030777, -1.575715, -0.9103817, 1, 0.7333333, 0, 1,
-1.025561, -0.8487614, -3.196724, 1, 0.7372549, 0, 1,
-1.022646, 0.4180122, -1.990273, 1, 0.7450981, 0, 1,
-1.015678, 0.7914318, -1.679282, 1, 0.7490196, 0, 1,
-1.011243, 2.094249, -1.260843, 1, 0.7568628, 0, 1,
-1.011059, -0.6085532, -1.432464, 1, 0.7607843, 0, 1,
-1.010436, 0.9685561, 0.1120083, 1, 0.7686275, 0, 1,
-1.000186, 0.5285066, 0.08247462, 1, 0.772549, 0, 1,
-0.9911295, -0.3742695, -2.948232, 1, 0.7803922, 0, 1,
-0.9879383, 0.3648615, 0.4113484, 1, 0.7843137, 0, 1,
-0.9848375, 0.8072766, -1.232259, 1, 0.7921569, 0, 1,
-0.9814329, -1.074781, -2.465108, 1, 0.7960784, 0, 1,
-0.9809905, 0.7969679, 0.8191336, 1, 0.8039216, 0, 1,
-0.9794329, -2.431545, -5.17179, 1, 0.8117647, 0, 1,
-0.9746372, -1.469535, -4.232291, 1, 0.8156863, 0, 1,
-0.9746264, 0.9187309, -2.347887, 1, 0.8235294, 0, 1,
-0.9740534, 0.5762684, -0.6451157, 1, 0.827451, 0, 1,
-0.9661263, -0.9050055, -2.624443, 1, 0.8352941, 0, 1,
-0.9653494, 0.7554049, -0.2291681, 1, 0.8392157, 0, 1,
-0.9646669, -1.280457, -2.876001, 1, 0.8470588, 0, 1,
-0.9543071, -0.2324919, -3.146364, 1, 0.8509804, 0, 1,
-0.9523675, -1.284318, -2.977883, 1, 0.8588235, 0, 1,
-0.9510033, 1.685931, -1.123097, 1, 0.8627451, 0, 1,
-0.9479169, 0.4116636, -1.214595, 1, 0.8705882, 0, 1,
-0.9471866, -0.5792869, -1.481063, 1, 0.8745098, 0, 1,
-0.9436224, 0.3722189, -0.134986, 1, 0.8823529, 0, 1,
-0.9430047, 1.157005, -0.0266551, 1, 0.8862745, 0, 1,
-0.9421675, 0.6187969, -0.7157072, 1, 0.8941177, 0, 1,
-0.9399159, -0.5175354, -2.588174, 1, 0.8980392, 0, 1,
-0.9330292, -0.1398318, -1.623889, 1, 0.9058824, 0, 1,
-0.9286208, -0.00608804, -0.9577061, 1, 0.9137255, 0, 1,
-0.9273918, -0.2129361, -0.5577165, 1, 0.9176471, 0, 1,
-0.9268776, 0.311694, -1.661642, 1, 0.9254902, 0, 1,
-0.9258346, 1.614877, 0.1848716, 1, 0.9294118, 0, 1,
-0.9189163, 1.385805, 0.1608755, 1, 0.9372549, 0, 1,
-0.9152869, 0.4045946, -1.827829, 1, 0.9411765, 0, 1,
-0.9072796, 0.1852579, -1.667772, 1, 0.9490196, 0, 1,
-0.9063712, 0.5926216, -1.47832, 1, 0.9529412, 0, 1,
-0.9058703, 0.1486944, -0.797309, 1, 0.9607843, 0, 1,
-0.9029939, 0.1627753, -0.4023882, 1, 0.9647059, 0, 1,
-0.8949412, 1.401438, 1.94921, 1, 0.972549, 0, 1,
-0.8932393, -0.05785259, 0.6986099, 1, 0.9764706, 0, 1,
-0.8899179, 1.215572, -1.538828, 1, 0.9843137, 0, 1,
-0.8889618, -0.07595638, -1.415133, 1, 0.9882353, 0, 1,
-0.8883752, 0.1259651, -1.506209, 1, 0.9960784, 0, 1,
-0.8872048, -0.4567465, -0.6319779, 0.9960784, 1, 0, 1,
-0.8854045, -0.7583515, -3.343739, 0.9921569, 1, 0, 1,
-0.8841811, 0.1171125, -0.3157021, 0.9843137, 1, 0, 1,
-0.8819163, 0.8682502, -1.245333, 0.9803922, 1, 0, 1,
-0.8815087, 0.2729291, 0.4767129, 0.972549, 1, 0, 1,
-0.8813602, 1.133425, -1.493593, 0.9686275, 1, 0, 1,
-0.8807729, 0.3716006, -1.931064, 0.9607843, 1, 0, 1,
-0.8807083, 0.6618367, -1.718479, 0.9568627, 1, 0, 1,
-0.87885, 2.030114, 1.566877, 0.9490196, 1, 0, 1,
-0.8715185, -0.1954037, -1.488252, 0.945098, 1, 0, 1,
-0.8629446, -1.579914, -2.925488, 0.9372549, 1, 0, 1,
-0.8621794, 0.5516741, -1.839778, 0.9333333, 1, 0, 1,
-0.8618014, -0.5258349, -0.7483296, 0.9254902, 1, 0, 1,
-0.86165, -1.17608, -2.836936, 0.9215686, 1, 0, 1,
-0.847389, 0.4075143, -0.8194991, 0.9137255, 1, 0, 1,
-0.8447587, -1.321011, -2.351238, 0.9098039, 1, 0, 1,
-0.8446991, 0.04736762, -1.05572, 0.9019608, 1, 0, 1,
-0.8422595, 2.552016, 0.2048382, 0.8941177, 1, 0, 1,
-0.8409213, -0.9240065, -2.088624, 0.8901961, 1, 0, 1,
-0.8399598, 1.105044, -0.9982493, 0.8823529, 1, 0, 1,
-0.8325349, 1.63603, -1.54026, 0.8784314, 1, 0, 1,
-0.8310193, 0.763132, -2.493337, 0.8705882, 1, 0, 1,
-0.8291505, -0.1138911, -0.2308504, 0.8666667, 1, 0, 1,
-0.8275778, 1.272579, -0.4723445, 0.8588235, 1, 0, 1,
-0.8248039, -0.714158, -2.204845, 0.854902, 1, 0, 1,
-0.8213271, -0.2031651, -2.083803, 0.8470588, 1, 0, 1,
-0.8196843, 0.7054307, -3.118797, 0.8431373, 1, 0, 1,
-0.8195911, 0.568342, -1.068983, 0.8352941, 1, 0, 1,
-0.8186377, 1.383969, 0.03538527, 0.8313726, 1, 0, 1,
-0.8182481, -1.970165, -2.068886, 0.8235294, 1, 0, 1,
-0.8046116, -1.141884, -1.88016, 0.8196079, 1, 0, 1,
-0.7939009, 0.2921941, -0.4735549, 0.8117647, 1, 0, 1,
-0.7923305, -1.233975, -3.05238, 0.8078431, 1, 0, 1,
-0.7882084, -1.296709, -0.5913157, 0.8, 1, 0, 1,
-0.7877059, 1.262069, -0.3503977, 0.7921569, 1, 0, 1,
-0.7864066, -0.9289642, -2.222294, 0.7882353, 1, 0, 1,
-0.7701185, -0.7082802, -0.949902, 0.7803922, 1, 0, 1,
-0.7683162, -0.856089, -1.98202, 0.7764706, 1, 0, 1,
-0.7614288, -1.037097, -2.613636, 0.7686275, 1, 0, 1,
-0.7555287, 2.08506, 0.6557271, 0.7647059, 1, 0, 1,
-0.7550411, 1.496139, -1.14674, 0.7568628, 1, 0, 1,
-0.7539951, -0.07530157, -2.719296, 0.7529412, 1, 0, 1,
-0.7527249, -0.4301947, -2.493239, 0.7450981, 1, 0, 1,
-0.7507643, 0.2830637, -0.05196992, 0.7411765, 1, 0, 1,
-0.7480953, -1.053227, -2.497708, 0.7333333, 1, 0, 1,
-0.7439886, 0.7550372, 0.1225611, 0.7294118, 1, 0, 1,
-0.7439349, 0.1028757, -1.558012, 0.7215686, 1, 0, 1,
-0.7435894, 1.908896, 0.7624487, 0.7176471, 1, 0, 1,
-0.7371567, -0.1715984, -2.727114, 0.7098039, 1, 0, 1,
-0.7355263, -0.4421202, -1.636037, 0.7058824, 1, 0, 1,
-0.7330017, -0.3025056, -1.98506, 0.6980392, 1, 0, 1,
-0.7308825, 0.9747035, 0.1695829, 0.6901961, 1, 0, 1,
-0.7209885, 1.204636, -1.43785, 0.6862745, 1, 0, 1,
-0.7179809, -1.528275, -2.609189, 0.6784314, 1, 0, 1,
-0.7149155, 0.6062213, -1.057943, 0.6745098, 1, 0, 1,
-0.7148709, -0.3248303, -0.8775656, 0.6666667, 1, 0, 1,
-0.7140163, 0.7137259, -2.379208, 0.6627451, 1, 0, 1,
-0.6993452, 0.1078913, -0.4648312, 0.654902, 1, 0, 1,
-0.6984337, 0.2778723, -0.7283829, 0.6509804, 1, 0, 1,
-0.6977919, -0.480801, -2.431466, 0.6431373, 1, 0, 1,
-0.6961941, -0.7488382, -1.841395, 0.6392157, 1, 0, 1,
-0.6940942, 0.306138, -0.01218963, 0.6313726, 1, 0, 1,
-0.6887603, 0.2902628, 0.003604622, 0.627451, 1, 0, 1,
-0.6816327, 0.2264839, -0.05644523, 0.6196079, 1, 0, 1,
-0.6811414, -1.684334, -3.723417, 0.6156863, 1, 0, 1,
-0.6804007, 0.063111, -0.4085892, 0.6078432, 1, 0, 1,
-0.6776156, -0.3033046, -2.889943, 0.6039216, 1, 0, 1,
-0.6747693, -0.3244568, -2.931976, 0.5960785, 1, 0, 1,
-0.6738161, -2.059439, -3.755894, 0.5882353, 1, 0, 1,
-0.6679941, -0.4736643, -1.944717, 0.5843138, 1, 0, 1,
-0.6625834, -0.0864784, -2.180375, 0.5764706, 1, 0, 1,
-0.6576558, 1.027411, -2.609152, 0.572549, 1, 0, 1,
-0.6549836, -0.3439785, -1.129286, 0.5647059, 1, 0, 1,
-0.6495861, -0.1480859, -2.795092, 0.5607843, 1, 0, 1,
-0.6495358, 0.7707011, -1.63879, 0.5529412, 1, 0, 1,
-0.6451817, -0.4059768, -2.585687, 0.5490196, 1, 0, 1,
-0.6427137, 1.280784, -1.097119, 0.5411765, 1, 0, 1,
-0.6415302, -0.5607667, 0.3099861, 0.5372549, 1, 0, 1,
-0.6373891, 0.3148789, -0.9232324, 0.5294118, 1, 0, 1,
-0.6353002, 0.3769721, -1.528553, 0.5254902, 1, 0, 1,
-0.6341948, 0.6857862, -1.690438, 0.5176471, 1, 0, 1,
-0.628772, 0.6094276, 0.2549758, 0.5137255, 1, 0, 1,
-0.6215529, 0.1907825, -2.139366, 0.5058824, 1, 0, 1,
-0.6179413, -0.7616791, -2.425603, 0.5019608, 1, 0, 1,
-0.614176, -0.3462858, -2.310819, 0.4941176, 1, 0, 1,
-0.6141061, -0.3760837, -2.482431, 0.4862745, 1, 0, 1,
-0.6054949, 1.007284, -0.7128559, 0.4823529, 1, 0, 1,
-0.5935791, -1.68951, -2.079558, 0.4745098, 1, 0, 1,
-0.5885372, 0.8095689, 0.3224329, 0.4705882, 1, 0, 1,
-0.5846954, -0.2065484, -3.896254, 0.4627451, 1, 0, 1,
-0.5695277, -0.320793, -2.313163, 0.4588235, 1, 0, 1,
-0.5687464, -1.33855, -2.79894, 0.4509804, 1, 0, 1,
-0.5672209, -0.3338607, -0.1080568, 0.4470588, 1, 0, 1,
-0.5670784, 0.1952838, -0.6978666, 0.4392157, 1, 0, 1,
-0.5653707, 1.149284, -0.1142106, 0.4352941, 1, 0, 1,
-0.5642731, -0.3415312, -3.485465, 0.427451, 1, 0, 1,
-0.5635874, 0.3810944, -1.112422, 0.4235294, 1, 0, 1,
-0.5627906, 0.1014225, -1.663434, 0.4156863, 1, 0, 1,
-0.5599405, 0.7647432, 0.1185685, 0.4117647, 1, 0, 1,
-0.5592354, 0.8405653, 1.869391, 0.4039216, 1, 0, 1,
-0.5575065, 0.7262394, -0.6314322, 0.3960784, 1, 0, 1,
-0.5550427, -0.8573235, -2.76009, 0.3921569, 1, 0, 1,
-0.5514493, 2.424255, -0.8540815, 0.3843137, 1, 0, 1,
-0.5496546, -0.4486424, -2.358622, 0.3803922, 1, 0, 1,
-0.5494375, 0.7039058, 0.007968162, 0.372549, 1, 0, 1,
-0.5487021, -0.09851427, -1.157833, 0.3686275, 1, 0, 1,
-0.5468667, 1.780213, -0.1088742, 0.3607843, 1, 0, 1,
-0.5457439, 0.3165077, -1.247294, 0.3568628, 1, 0, 1,
-0.5430393, 1.646192, -1.007211, 0.3490196, 1, 0, 1,
-0.5423188, 0.3907535, -1.109539, 0.345098, 1, 0, 1,
-0.5392052, 1.852368, -0.9153292, 0.3372549, 1, 0, 1,
-0.5377438, -0.508072, -2.116053, 0.3333333, 1, 0, 1,
-0.5270586, -0.7591235, -0.9180273, 0.3254902, 1, 0, 1,
-0.5264261, 1.126216, -0.2125627, 0.3215686, 1, 0, 1,
-0.5254043, -1.203165, -1.743242, 0.3137255, 1, 0, 1,
-0.5249923, -0.1008719, -1.986115, 0.3098039, 1, 0, 1,
-0.5235094, -0.5214037, -0.2087801, 0.3019608, 1, 0, 1,
-0.5223514, -1.096144, -2.680267, 0.2941177, 1, 0, 1,
-0.5221993, -1.459576, -3.839211, 0.2901961, 1, 0, 1,
-0.5169994, 1.342631, 1.128418, 0.282353, 1, 0, 1,
-0.5100536, -0.7056802, -0.8518379, 0.2784314, 1, 0, 1,
-0.5090272, -1.110747, -1.061078, 0.2705882, 1, 0, 1,
-0.5025262, 0.8436885, -1.082196, 0.2666667, 1, 0, 1,
-0.5022658, 0.01859038, -1.940886, 0.2588235, 1, 0, 1,
-0.4998962, -1.535711, -3.759984, 0.254902, 1, 0, 1,
-0.4991669, 0.2177285, 0.1136469, 0.2470588, 1, 0, 1,
-0.4983341, 0.2308584, -1.137921, 0.2431373, 1, 0, 1,
-0.4967494, 1.136043, -2.447647, 0.2352941, 1, 0, 1,
-0.4960581, 0.4873379, -2.10633, 0.2313726, 1, 0, 1,
-0.4954834, -1.148261, -2.265544, 0.2235294, 1, 0, 1,
-0.495349, 0.2930606, -0.8681748, 0.2196078, 1, 0, 1,
-0.492038, -0.6925301, -2.622366, 0.2117647, 1, 0, 1,
-0.4822879, -0.3325119, -2.068638, 0.2078431, 1, 0, 1,
-0.4817096, -0.06027015, -1.305327, 0.2, 1, 0, 1,
-0.4759618, 1.620842, -1.786649, 0.1921569, 1, 0, 1,
-0.4748825, -0.4648715, -1.853409, 0.1882353, 1, 0, 1,
-0.4746849, 0.7786591, -1.454457, 0.1803922, 1, 0, 1,
-0.4727519, 1.263535, 0.682143, 0.1764706, 1, 0, 1,
-0.472272, 2.70647, -1.593192, 0.1686275, 1, 0, 1,
-0.4711619, 0.1339265, -0.1699594, 0.1647059, 1, 0, 1,
-0.4690459, 0.6459513, -1.104586, 0.1568628, 1, 0, 1,
-0.4688505, -0.9864761, -3.466385, 0.1529412, 1, 0, 1,
-0.4649219, 2.007767, 1.018136, 0.145098, 1, 0, 1,
-0.4594101, -1.279521, -3.234833, 0.1411765, 1, 0, 1,
-0.4586533, 0.3184614, -1.516281, 0.1333333, 1, 0, 1,
-0.4532712, 0.3449883, -1.094282, 0.1294118, 1, 0, 1,
-0.4525373, -0.2134766, -3.291702, 0.1215686, 1, 0, 1,
-0.4524086, -2.577155, -2.699423, 0.1176471, 1, 0, 1,
-0.4509378, -0.8866236, -1.710811, 0.1098039, 1, 0, 1,
-0.4494036, 0.01011086, -0.3673382, 0.1058824, 1, 0, 1,
-0.4457303, 0.2957316, -0.8655616, 0.09803922, 1, 0, 1,
-0.4434775, -1.394693, -2.413359, 0.09019608, 1, 0, 1,
-0.4422495, -0.4336736, -2.30901, 0.08627451, 1, 0, 1,
-0.4412891, 1.090379, 0.2528934, 0.07843138, 1, 0, 1,
-0.4410033, -0.400764, -2.704253, 0.07450981, 1, 0, 1,
-0.4401645, 1.879802, 0.4000171, 0.06666667, 1, 0, 1,
-0.4393666, -1.012931, -3.200256, 0.0627451, 1, 0, 1,
-0.4355337, 1.453326, 1.70139, 0.05490196, 1, 0, 1,
-0.4292341, 1.357251, 0.5082718, 0.05098039, 1, 0, 1,
-0.4290383, 1.145315, 0.08074299, 0.04313726, 1, 0, 1,
-0.4273699, -0.08227266, -0.076846, 0.03921569, 1, 0, 1,
-0.4266645, 0.528636, -0.1740173, 0.03137255, 1, 0, 1,
-0.4260446, -0.1658599, -1.544387, 0.02745098, 1, 0, 1,
-0.4216712, 0.01768684, -0.9764899, 0.01960784, 1, 0, 1,
-0.4201413, -1.92405, -2.731103, 0.01568628, 1, 0, 1,
-0.4185658, -0.7616913, -2.000739, 0.007843138, 1, 0, 1,
-0.4153658, -1.342783, -2.145644, 0.003921569, 1, 0, 1,
-0.4133309, 1.296324, -1.705327, 0, 1, 0.003921569, 1,
-0.4088926, 0.7216322, -1.194024, 0, 1, 0.01176471, 1,
-0.4053566, -0.4160777, -3.353844, 0, 1, 0.01568628, 1,
-0.3941836, 0.7308532, -0.8403521, 0, 1, 0.02352941, 1,
-0.3938337, -0.875341, -3.197648, 0, 1, 0.02745098, 1,
-0.393498, -1.22055, -2.352301, 0, 1, 0.03529412, 1,
-0.3927822, 0.4937549, -0.6954281, 0, 1, 0.03921569, 1,
-0.3884958, 0.9903454, -0.127288, 0, 1, 0.04705882, 1,
-0.3870552, 0.403515, -0.9614352, 0, 1, 0.05098039, 1,
-0.3821603, -0.7209504, -1.8356, 0, 1, 0.05882353, 1,
-0.3785973, 1.838778, 0.5797178, 0, 1, 0.0627451, 1,
-0.3726651, 1.056405, 2.465307, 0, 1, 0.07058824, 1,
-0.3718853, 0.1633501, 0.01477532, 0, 1, 0.07450981, 1,
-0.3683748, 0.5705786, -0.4587829, 0, 1, 0.08235294, 1,
-0.368332, 0.7898269, -0.8055357, 0, 1, 0.08627451, 1,
-0.367066, -1.049047, -2.429274, 0, 1, 0.09411765, 1,
-0.3662388, -1.204051, -3.864375, 0, 1, 0.1019608, 1,
-0.3660384, 1.265162, -1.283979, 0, 1, 0.1058824, 1,
-0.3660295, -0.09594475, -2.265673, 0, 1, 0.1137255, 1,
-0.3641834, 1.093786, 0.6280921, 0, 1, 0.1176471, 1,
-0.3562606, -0.6869009, -3.178879, 0, 1, 0.1254902, 1,
-0.3558914, -0.2334448, -1.813986, 0, 1, 0.1294118, 1,
-0.3555961, -0.3592572, -2.813147, 0, 1, 0.1372549, 1,
-0.3467911, 1.01985, 0.1766854, 0, 1, 0.1411765, 1,
-0.3398567, 0.3626091, -2.789558, 0, 1, 0.1490196, 1,
-0.3374192, -0.08249857, -0.9250732, 0, 1, 0.1529412, 1,
-0.3353131, -0.01951187, -1.622068, 0, 1, 0.1607843, 1,
-0.3334601, 1.225441, -0.504829, 0, 1, 0.1647059, 1,
-0.3297848, 0.3290955, -1.412199, 0, 1, 0.172549, 1,
-0.3230516, -0.02896544, -3.213741, 0, 1, 0.1764706, 1,
-0.3225601, 1.222214, 0.9236535, 0, 1, 0.1843137, 1,
-0.3174624, -0.6748837, -1.607453, 0, 1, 0.1882353, 1,
-0.3150413, 0.2533676, -1.611723, 0, 1, 0.1960784, 1,
-0.3148365, -0.7377017, -2.146477, 0, 1, 0.2039216, 1,
-0.313781, 1.264192, 1.081723, 0, 1, 0.2078431, 1,
-0.3134513, 0.7302335, 0.4178691, 0, 1, 0.2156863, 1,
-0.3109959, -1.005245, -1.849777, 0, 1, 0.2196078, 1,
-0.3081188, -1.217127, -1.968093, 0, 1, 0.227451, 1,
-0.2978039, 0.5237048, -0.6264307, 0, 1, 0.2313726, 1,
-0.292942, -0.9148625, -3.00111, 0, 1, 0.2392157, 1,
-0.2888855, 0.4214469, -0.4405769, 0, 1, 0.2431373, 1,
-0.2865776, 0.1075632, -1.976925, 0, 1, 0.2509804, 1,
-0.2854685, 0.6705988, 0.346045, 0, 1, 0.254902, 1,
-0.276484, -0.496725, -3.908419, 0, 1, 0.2627451, 1,
-0.2686153, -0.2163918, -2.465363, 0, 1, 0.2666667, 1,
-0.2611564, -1.489292, -3.832461, 0, 1, 0.2745098, 1,
-0.2602263, -0.2197127, -2.989447, 0, 1, 0.2784314, 1,
-0.2581497, -0.4780157, -2.711992, 0, 1, 0.2862745, 1,
-0.2497509, 0.1043337, 1.671837, 0, 1, 0.2901961, 1,
-0.2494927, -0.202671, -3.26706, 0, 1, 0.2980392, 1,
-0.2483002, -0.7634975, -1.64706, 0, 1, 0.3058824, 1,
-0.2464684, 1.13582, -1.275055, 0, 1, 0.3098039, 1,
-0.2434186, 0.06131222, -0.3576284, 0, 1, 0.3176471, 1,
-0.231127, -1.127369, -3.394213, 0, 1, 0.3215686, 1,
-0.2265363, 2.195718, 1.25409, 0, 1, 0.3294118, 1,
-0.2238398, 0.2044956, -1.326148, 0, 1, 0.3333333, 1,
-0.2210253, 2.66597, 1.140498, 0, 1, 0.3411765, 1,
-0.2201867, 2.651934, 1.530913, 0, 1, 0.345098, 1,
-0.2168744, -0.4388307, -3.488756, 0, 1, 0.3529412, 1,
-0.2142689, -1.187997, -4.65735, 0, 1, 0.3568628, 1,
-0.2060826, -1.410983, -3.562192, 0, 1, 0.3647059, 1,
-0.2054933, 0.7499174, -0.04031482, 0, 1, 0.3686275, 1,
-0.2042885, -0.5007806, -3.928293, 0, 1, 0.3764706, 1,
-0.2016709, -0.6577176, -3.327866, 0, 1, 0.3803922, 1,
-0.2012879, 1.675453, -1.262665, 0, 1, 0.3882353, 1,
-0.1962886, 0.3692402, -0.8459901, 0, 1, 0.3921569, 1,
-0.1907994, 0.3159927, -2.316916, 0, 1, 0.4, 1,
-0.1855642, 0.5376459, -0.8328182, 0, 1, 0.4078431, 1,
-0.1838483, 0.1517646, 0.1014445, 0, 1, 0.4117647, 1,
-0.1706717, 1.206291, -2.050051, 0, 1, 0.4196078, 1,
-0.167885, -1.109159, -4.078429, 0, 1, 0.4235294, 1,
-0.1675308, 0.3086548, 1.264291, 0, 1, 0.4313726, 1,
-0.1663886, 0.0294538, -1.571888, 0, 1, 0.4352941, 1,
-0.1634403, -0.3146194, -3.727, 0, 1, 0.4431373, 1,
-0.1603877, -0.3570261, -1.222807, 0, 1, 0.4470588, 1,
-0.1590962, 0.9226403, -0.1765388, 0, 1, 0.454902, 1,
-0.1572894, -0.8890976, -2.952936, 0, 1, 0.4588235, 1,
-0.1570753, -0.5933375, -3.360029, 0, 1, 0.4666667, 1,
-0.1550702, 1.205786, 0.04736844, 0, 1, 0.4705882, 1,
-0.1468267, -0.5116962, -4.688782, 0, 1, 0.4784314, 1,
-0.1453039, 1.409182, 0.1114407, 0, 1, 0.4823529, 1,
-0.1445903, -0.07159649, -1.932898, 0, 1, 0.4901961, 1,
-0.1444917, -0.2328857, -2.991005, 0, 1, 0.4941176, 1,
-0.1433336, 2.926025, -0.1170491, 0, 1, 0.5019608, 1,
-0.1424463, -0.6686718, -3.782729, 0, 1, 0.509804, 1,
-0.1391441, -2.037428, -3.121649, 0, 1, 0.5137255, 1,
-0.1354652, 0.6772878, 0.5846835, 0, 1, 0.5215687, 1,
-0.1327519, 1.425246, 0.6684915, 0, 1, 0.5254902, 1,
-0.1302348, 1.172885, -0.2330449, 0, 1, 0.5333334, 1,
-0.1293341, -0.9755916, -2.561475, 0, 1, 0.5372549, 1,
-0.1205137, -0.7218388, -2.021916, 0, 1, 0.5450981, 1,
-0.1197114, -0.6713517, -3.73351, 0, 1, 0.5490196, 1,
-0.1191933, 1.489281, -0.4857536, 0, 1, 0.5568628, 1,
-0.1181452, 1.661796, -0.2325742, 0, 1, 0.5607843, 1,
-0.1163455, 2.211125, -0.08846583, 0, 1, 0.5686275, 1,
-0.115409, -0.7020251, -2.719115, 0, 1, 0.572549, 1,
-0.1144149, -0.7251947, -2.443111, 0, 1, 0.5803922, 1,
-0.1089152, 0.6953115, -0.8933133, 0, 1, 0.5843138, 1,
-0.1082728, -1.824134, -3.555044, 0, 1, 0.5921569, 1,
-0.107207, -0.590643, -3.317701, 0, 1, 0.5960785, 1,
-0.1059455, 1.482721, -1.136971, 0, 1, 0.6039216, 1,
-0.1046961, -0.4972331, -3.464466, 0, 1, 0.6117647, 1,
-0.1035905, -0.8002787, -3.388426, 0, 1, 0.6156863, 1,
-0.1026959, 0.3735617, 0.4405289, 0, 1, 0.6235294, 1,
-0.09337836, 0.5002794, -0.9619961, 0, 1, 0.627451, 1,
-0.08541641, 0.9118687, 0.1872688, 0, 1, 0.6352941, 1,
-0.085378, 1.481758, -1.020938, 0, 1, 0.6392157, 1,
-0.08165715, 0.7987756, -0.2311519, 0, 1, 0.6470588, 1,
-0.08103302, -1.063456, -1.643705, 0, 1, 0.6509804, 1,
-0.07996178, -0.8489025, -3.633811, 0, 1, 0.6588235, 1,
-0.07836427, -1.991641, -1.896495, 0, 1, 0.6627451, 1,
-0.07817972, -0.5427467, -3.253213, 0, 1, 0.6705883, 1,
-0.07734968, 0.8907236, -1.296647, 0, 1, 0.6745098, 1,
-0.07365391, 0.8868765, 0.421312, 0, 1, 0.682353, 1,
-0.07045151, 0.003263971, -0.3629516, 0, 1, 0.6862745, 1,
-0.06834133, 0.9420015, 1.252579, 0, 1, 0.6941177, 1,
-0.06826729, 0.7544431, -0.7796894, 0, 1, 0.7019608, 1,
-0.06102636, -0.73247, -2.355749, 0, 1, 0.7058824, 1,
-0.06074253, -0.8020489, -4.543761, 0, 1, 0.7137255, 1,
-0.05995847, 0.705238, 0.9626238, 0, 1, 0.7176471, 1,
-0.05950375, -0.3930157, -3.676132, 0, 1, 0.7254902, 1,
-0.05901477, -1.942483, -1.898669, 0, 1, 0.7294118, 1,
-0.05591534, 0.7115327, 1.365689, 0, 1, 0.7372549, 1,
-0.05584716, 1.680091, -0.7438183, 0, 1, 0.7411765, 1,
-0.05430627, 0.260617, 1.554698, 0, 1, 0.7490196, 1,
-0.05324646, -1.659328, -4.026588, 0, 1, 0.7529412, 1,
-0.05006298, -0.703468, -5.086596, 0, 1, 0.7607843, 1,
-0.04007693, -0.2750486, -3.195905, 0, 1, 0.7647059, 1,
-0.03779715, 0.1151651, 1.483478, 0, 1, 0.772549, 1,
-0.03643132, -0.216273, -2.285266, 0, 1, 0.7764706, 1,
-0.0267024, 0.5782974, -0.2211999, 0, 1, 0.7843137, 1,
-0.0261992, 1.015402, -0.1879561, 0, 1, 0.7882353, 1,
-0.02588266, 0.9856218, -0.3276426, 0, 1, 0.7960784, 1,
-0.0246651, 0.424082, -1.249111, 0, 1, 0.8039216, 1,
-0.023264, -1.131416, -2.343547, 0, 1, 0.8078431, 1,
-0.02050279, -0.2518875, -2.375349, 0, 1, 0.8156863, 1,
-0.01916375, 0.06657994, 0.4068255, 0, 1, 0.8196079, 1,
-0.01530162, -0.3086331, -2.920682, 0, 1, 0.827451, 1,
-0.01336951, -1.22519, -3.824992, 0, 1, 0.8313726, 1,
-0.01174782, 0.5135238, 0.3997846, 0, 1, 0.8392157, 1,
-0.00362597, -0.05029137, -2.810076, 0, 1, 0.8431373, 1,
-0.003552764, -0.3162523, -3.344454, 0, 1, 0.8509804, 1,
-0.003506972, 0.6383811, 0.8461118, 0, 1, 0.854902, 1,
0.0009706927, 0.3813664, -0.3414958, 0, 1, 0.8627451, 1,
0.001041601, -1.572108, 1.957375, 0, 1, 0.8666667, 1,
0.007640074, 0.8644816, -0.822352, 0, 1, 0.8745098, 1,
0.009454452, 0.0415039, -0.3202668, 0, 1, 0.8784314, 1,
0.01171613, -0.7848226, 1.637352, 0, 1, 0.8862745, 1,
0.02302963, 0.4097728, -0.7418088, 0, 1, 0.8901961, 1,
0.02378118, 0.07065108, -0.1296362, 0, 1, 0.8980392, 1,
0.0290569, -0.8353615, 2.723341, 0, 1, 0.9058824, 1,
0.03135468, -0.2861642, 2.708605, 0, 1, 0.9098039, 1,
0.03573646, -1.777397, 5.406084, 0, 1, 0.9176471, 1,
0.03914337, 0.900121, -1.271529, 0, 1, 0.9215686, 1,
0.04096063, 0.2336549, -2.396911, 0, 1, 0.9294118, 1,
0.04212995, -0.8400388, 3.466193, 0, 1, 0.9333333, 1,
0.04487948, -1.133812, 3.325338, 0, 1, 0.9411765, 1,
0.04842023, -0.7077429, 4.254498, 0, 1, 0.945098, 1,
0.05475717, -0.3372508, 3.241209, 0, 1, 0.9529412, 1,
0.05906853, -1.829776, 2.96332, 0, 1, 0.9568627, 1,
0.05941952, -0.6634651, 2.619887, 0, 1, 0.9647059, 1,
0.06573699, -0.7103252, 2.987071, 0, 1, 0.9686275, 1,
0.06597053, 0.8585055, -0.1814567, 0, 1, 0.9764706, 1,
0.06638546, 0.1756244, -1.380051, 0, 1, 0.9803922, 1,
0.06686051, -2.807325, 3.629715, 0, 1, 0.9882353, 1,
0.06715576, -0.7449851, 3.505957, 0, 1, 0.9921569, 1,
0.0704729, -0.4884613, 1.929316, 0, 1, 1, 1,
0.07261727, 1.84876, 0.282408, 0, 0.9921569, 1, 1,
0.07397854, 0.2354477, 0.1994523, 0, 0.9882353, 1, 1,
0.07487385, 1.106132, -1.098462, 0, 0.9803922, 1, 1,
0.07498056, -1.250846, 1.992801, 0, 0.9764706, 1, 1,
0.0750635, -0.009691553, 0.3309065, 0, 0.9686275, 1, 1,
0.07553734, 1.014325, -1.080088, 0, 0.9647059, 1, 1,
0.07899657, 0.1319708, 1.106088, 0, 0.9568627, 1, 1,
0.0826971, -0.3796241, 3.562581, 0, 0.9529412, 1, 1,
0.08597609, -0.4861875, 1.683412, 0, 0.945098, 1, 1,
0.09093804, -1.13617, 2.199341, 0, 0.9411765, 1, 1,
0.09455689, 0.1020674, -1.509728, 0, 0.9333333, 1, 1,
0.09677634, 1.156412, 0.7527393, 0, 0.9294118, 1, 1,
0.1001399, -1.872257, 3.429358, 0, 0.9215686, 1, 1,
0.1010916, 0.118533, 1.552995, 0, 0.9176471, 1, 1,
0.1072482, -0.06373588, 3.509895, 0, 0.9098039, 1, 1,
0.1073927, -0.8109405, 3.45208, 0, 0.9058824, 1, 1,
0.1079693, -1.130636, 3.638213, 0, 0.8980392, 1, 1,
0.1109027, -0.2164201, 2.545204, 0, 0.8901961, 1, 1,
0.1159017, 0.6336854, -0.4232691, 0, 0.8862745, 1, 1,
0.1181907, 0.9793512, 1.205767, 0, 0.8784314, 1, 1,
0.1185454, 0.0991414, 2.929276, 0, 0.8745098, 1, 1,
0.1196867, 0.1891691, 0.5449473, 0, 0.8666667, 1, 1,
0.1201227, -0.6372091, 0.3790204, 0, 0.8627451, 1, 1,
0.1248666, -1.025757, 1.782541, 0, 0.854902, 1, 1,
0.1308068, -0.6236817, 3.390851, 0, 0.8509804, 1, 1,
0.1317491, 0.01483331, 2.367258, 0, 0.8431373, 1, 1,
0.136431, -0.9108518, 1.591688, 0, 0.8392157, 1, 1,
0.1371117, 2.153232, 0.3564015, 0, 0.8313726, 1, 1,
0.1379638, 0.4186537, 0.1972219, 0, 0.827451, 1, 1,
0.1401372, -0.3800997, 1.486139, 0, 0.8196079, 1, 1,
0.1486632, -0.5143441, 2.205129, 0, 0.8156863, 1, 1,
0.1491408, -0.8265476, 5.622229, 0, 0.8078431, 1, 1,
0.1492602, -0.5140025, 2.762932, 0, 0.8039216, 1, 1,
0.1492609, -1.918654, 3.399699, 0, 0.7960784, 1, 1,
0.1493864, 0.1324827, 0.4758425, 0, 0.7882353, 1, 1,
0.1502641, 0.1438432, 2.175679, 0, 0.7843137, 1, 1,
0.1511496, -1.222931, 3.774574, 0, 0.7764706, 1, 1,
0.1515805, 1.491875, 0.9480813, 0, 0.772549, 1, 1,
0.160897, 1.248177, 1.157351, 0, 0.7647059, 1, 1,
0.1629251, 0.4913529, 0.5926993, 0, 0.7607843, 1, 1,
0.1631364, -0.2985522, 3.26456, 0, 0.7529412, 1, 1,
0.1656736, -0.2049644, 2.65214, 0, 0.7490196, 1, 1,
0.1674128, 0.08094425, 0.2835929, 0, 0.7411765, 1, 1,
0.1687599, 1.138557, 0.6077715, 0, 0.7372549, 1, 1,
0.1725134, -0.7110264, 3.039982, 0, 0.7294118, 1, 1,
0.1727033, -0.7888979, 1.706384, 0, 0.7254902, 1, 1,
0.1742833, 0.2672266, 0.05242286, 0, 0.7176471, 1, 1,
0.1750414, 0.3588086, 0.04870739, 0, 0.7137255, 1, 1,
0.1761845, -1.05345, 3.538077, 0, 0.7058824, 1, 1,
0.1818942, 0.7588607, 0.06921796, 0, 0.6980392, 1, 1,
0.1823204, -0.4976484, 0.564257, 0, 0.6941177, 1, 1,
0.1857558, 0.6221403, -1.423439, 0, 0.6862745, 1, 1,
0.1914225, 0.1786091, 1.068656, 0, 0.682353, 1, 1,
0.1928743, 2.152205, 0.2359885, 0, 0.6745098, 1, 1,
0.1955182, 1.174723, -0.06757473, 0, 0.6705883, 1, 1,
0.1980173, 0.637104, 1.33506, 0, 0.6627451, 1, 1,
0.1981609, -1.288179, 3.073917, 0, 0.6588235, 1, 1,
0.1997894, 1.013211, 0.1062163, 0, 0.6509804, 1, 1,
0.2015761, 0.4651549, 1.331068, 0, 0.6470588, 1, 1,
0.2044647, 0.5756419, -0.6225477, 0, 0.6392157, 1, 1,
0.2050061, -1.185902, 2.378978, 0, 0.6352941, 1, 1,
0.2070468, -1.662917, 2.203796, 0, 0.627451, 1, 1,
0.209813, 0.5814003, 1.439136, 0, 0.6235294, 1, 1,
0.2105565, 1.494589, 1.860036, 0, 0.6156863, 1, 1,
0.2110868, -0.3911468, 2.200112, 0, 0.6117647, 1, 1,
0.2114776, 0.3993059, 2.182372, 0, 0.6039216, 1, 1,
0.2156291, -1.327003, 2.799469, 0, 0.5960785, 1, 1,
0.2190585, 1.732807, 0.8439669, 0, 0.5921569, 1, 1,
0.2229831, -0.742621, 2.364205, 0, 0.5843138, 1, 1,
0.2283364, -0.4380708, 2.132797, 0, 0.5803922, 1, 1,
0.2287465, 0.3248433, 1.427667, 0, 0.572549, 1, 1,
0.2311323, -1.172995, 4.385981, 0, 0.5686275, 1, 1,
0.233284, -0.5014543, 3.628463, 0, 0.5607843, 1, 1,
0.2341473, -0.7844825, 3.370458, 0, 0.5568628, 1, 1,
0.2355251, -0.07750011, 1.549996, 0, 0.5490196, 1, 1,
0.2392774, 1.245231, -2.128712, 0, 0.5450981, 1, 1,
0.2392943, -0.3790168, 2.320711, 0, 0.5372549, 1, 1,
0.240766, 0.5280899, 0.4649051, 0, 0.5333334, 1, 1,
0.2412097, -0.5532307, 3.115376, 0, 0.5254902, 1, 1,
0.24417, 2.391551, -0.6307599, 0, 0.5215687, 1, 1,
0.2449984, -0.2538199, 2.986929, 0, 0.5137255, 1, 1,
0.2467067, -0.7456051, 1.503476, 0, 0.509804, 1, 1,
0.246943, -0.7107041, 3.363889, 0, 0.5019608, 1, 1,
0.2474793, 0.9579902, -0.5336411, 0, 0.4941176, 1, 1,
0.2487283, 1.390826, 0.2849868, 0, 0.4901961, 1, 1,
0.2489304, -0.1423576, 0.3720205, 0, 0.4823529, 1, 1,
0.2552714, -0.0138583, 3.914178, 0, 0.4784314, 1, 1,
0.2582531, 1.265697, -0.0740708, 0, 0.4705882, 1, 1,
0.2600279, 0.4752277, -0.1923522, 0, 0.4666667, 1, 1,
0.2600543, -0.7860797, 3.463729, 0, 0.4588235, 1, 1,
0.260084, -0.5850746, 2.12955, 0, 0.454902, 1, 1,
0.2606737, -0.2415997, 3.168054, 0, 0.4470588, 1, 1,
0.2632321, -0.09526093, 1.709736, 0, 0.4431373, 1, 1,
0.2657142, 1.873427, -0.5927967, 0, 0.4352941, 1, 1,
0.2668338, 0.5438598, -0.1700838, 0, 0.4313726, 1, 1,
0.2690905, 0.7444905, 0.5659238, 0, 0.4235294, 1, 1,
0.270456, 0.5643479, 0.7893938, 0, 0.4196078, 1, 1,
0.271577, 1.424121, 0.4744333, 0, 0.4117647, 1, 1,
0.2722719, -0.9672085, 2.201365, 0, 0.4078431, 1, 1,
0.274812, -0.901615, 3.762733, 0, 0.4, 1, 1,
0.2842006, -0.3149783, 3.278222, 0, 0.3921569, 1, 1,
0.2849875, 1.401474, -0.9783084, 0, 0.3882353, 1, 1,
0.2852491, 0.2473013, 0.4307205, 0, 0.3803922, 1, 1,
0.2893772, 0.4456789, -0.6957398, 0, 0.3764706, 1, 1,
0.2936775, 0.766345, -0.7015939, 0, 0.3686275, 1, 1,
0.2944055, 0.0271838, 1.858436, 0, 0.3647059, 1, 1,
0.2947286, 1.744002, -0.1952523, 0, 0.3568628, 1, 1,
0.2947578, -0.2500923, 4.389863, 0, 0.3529412, 1, 1,
0.2959445, -0.454872, 1.673142, 0, 0.345098, 1, 1,
0.2986987, 0.4138712, -0.6638522, 0, 0.3411765, 1, 1,
0.3046404, 0.1231435, 2.205663, 0, 0.3333333, 1, 1,
0.3083384, -0.6354331, 1.731487, 0, 0.3294118, 1, 1,
0.3086576, -0.09003563, 1.626651, 0, 0.3215686, 1, 1,
0.3113758, 2.013165, -0.7375931, 0, 0.3176471, 1, 1,
0.3127514, 0.8834373, 1.728013, 0, 0.3098039, 1, 1,
0.3176733, -1.347198, 1.716194, 0, 0.3058824, 1, 1,
0.320641, -0.3501896, 3.82217, 0, 0.2980392, 1, 1,
0.3293584, 0.8241582, 0.280253, 0, 0.2901961, 1, 1,
0.3302011, 1.644785, 2.074959, 0, 0.2862745, 1, 1,
0.3321332, -0.596986, 1.167314, 0, 0.2784314, 1, 1,
0.3324512, 2.961236, -0.3245397, 0, 0.2745098, 1, 1,
0.3332649, -1.141856, 1.775235, 0, 0.2666667, 1, 1,
0.3344715, 1.471606, 0.3278147, 0, 0.2627451, 1, 1,
0.3352402, -0.6089857, 2.663245, 0, 0.254902, 1, 1,
0.3355403, -0.04842873, 2.593773, 0, 0.2509804, 1, 1,
0.3356711, 1.374305, -1.62264, 0, 0.2431373, 1, 1,
0.3398885, -0.2172401, 2.053186, 0, 0.2392157, 1, 1,
0.3416322, -0.1555697, 0.677646, 0, 0.2313726, 1, 1,
0.3426322, -1.062227, 2.337154, 0, 0.227451, 1, 1,
0.3434616, -0.01962205, 3.017478, 0, 0.2196078, 1, 1,
0.344485, 0.9102882, -0.2098035, 0, 0.2156863, 1, 1,
0.3449483, -0.8484033, 1.520984, 0, 0.2078431, 1, 1,
0.3452205, 0.04261749, 0.8708842, 0, 0.2039216, 1, 1,
0.3480186, 0.3698312, -0.9566615, 0, 0.1960784, 1, 1,
0.3525328, -0.7226744, 3.055611, 0, 0.1882353, 1, 1,
0.3532918, 1.013242, 1.453297, 0, 0.1843137, 1, 1,
0.3553478, -0.7761651, 2.125496, 0, 0.1764706, 1, 1,
0.355644, -1.208567, 3.28438, 0, 0.172549, 1, 1,
0.3559615, 0.725088, 1.221934, 0, 0.1647059, 1, 1,
0.3561286, 0.02144328, 3.265851, 0, 0.1607843, 1, 1,
0.3584992, -1.437361, 3.92048, 0, 0.1529412, 1, 1,
0.3601604, 0.8403047, 0.2077717, 0, 0.1490196, 1, 1,
0.3617528, -0.5353007, 4.118034, 0, 0.1411765, 1, 1,
0.3676487, -0.3771824, 1.116446, 0, 0.1372549, 1, 1,
0.3755444, 0.8028944, 2.133809, 0, 0.1294118, 1, 1,
0.38864, 1.521171, -0.5256638, 0, 0.1254902, 1, 1,
0.3887431, 0.751202, -0.2438222, 0, 0.1176471, 1, 1,
0.3890531, 0.2551431, 2.554488, 0, 0.1137255, 1, 1,
0.3934251, -0.9984601, 1.817996, 0, 0.1058824, 1, 1,
0.3961515, -0.003527154, 2.085171, 0, 0.09803922, 1, 1,
0.3982327, 0.3490243, 0.4460576, 0, 0.09411765, 1, 1,
0.4003632, -1.183073, 4.444061, 0, 0.08627451, 1, 1,
0.400783, -0.5508529, 3.692385, 0, 0.08235294, 1, 1,
0.4055656, 0.963904, -0.03596855, 0, 0.07450981, 1, 1,
0.4071527, -0.4333869, 1.962765, 0, 0.07058824, 1, 1,
0.4078405, 1.68716, 0.8199324, 0, 0.0627451, 1, 1,
0.4098612, 0.545698, 2.633919, 0, 0.05882353, 1, 1,
0.4113038, 0.7760866, 0.686479, 0, 0.05098039, 1, 1,
0.4122983, 0.3547473, 0.2749871, 0, 0.04705882, 1, 1,
0.4127625, -0.2110909, 1.462309, 0, 0.03921569, 1, 1,
0.4161308, -1.361757, 5.348173, 0, 0.03529412, 1, 1,
0.4211455, -0.9795434, 1.983959, 0, 0.02745098, 1, 1,
0.4239239, -0.2136794, 1.499896, 0, 0.02352941, 1, 1,
0.4310627, -0.4398494, 3.361826, 0, 0.01568628, 1, 1,
0.4361205, -0.3228004, 1.406746, 0, 0.01176471, 1, 1,
0.4431251, 2.340868, 1.315045, 0, 0.003921569, 1, 1,
0.4436886, -0.4392985, 3.842556, 0.003921569, 0, 1, 1,
0.4448384, -0.6556883, 0.5098735, 0.007843138, 0, 1, 1,
0.4518561, 0.6570934, 1.578456, 0.01568628, 0, 1, 1,
0.4561613, 0.4647299, 1.500303, 0.01960784, 0, 1, 1,
0.4591732, -0.04869517, 0.7446123, 0.02745098, 0, 1, 1,
0.4624391, 0.5558426, 0.3358855, 0.03137255, 0, 1, 1,
0.4625249, -2.463782, 3.312352, 0.03921569, 0, 1, 1,
0.4655277, -0.09588397, 0.3538372, 0.04313726, 0, 1, 1,
0.467184, 0.1540522, 1.332181, 0.05098039, 0, 1, 1,
0.4700849, 0.2896045, 0.05625224, 0.05490196, 0, 1, 1,
0.4731643, -1.175061, 1.721761, 0.0627451, 0, 1, 1,
0.4773905, -0.9185807, 1.411318, 0.06666667, 0, 1, 1,
0.4775117, 1.371171, 1.45077, 0.07450981, 0, 1, 1,
0.479343, 0.07994391, 1.066209, 0.07843138, 0, 1, 1,
0.4799116, -1.274222, 3.353166, 0.08627451, 0, 1, 1,
0.4804448, -0.7084356, 2.399382, 0.09019608, 0, 1, 1,
0.4856495, 1.990531, 0.5080249, 0.09803922, 0, 1, 1,
0.5013185, -0.4627707, 2.366621, 0.1058824, 0, 1, 1,
0.5119513, 0.007546074, 1.475838, 0.1098039, 0, 1, 1,
0.5119925, -0.3626657, 3.358501, 0.1176471, 0, 1, 1,
0.5121956, -0.4899808, 1.999951, 0.1215686, 0, 1, 1,
0.5142669, 1.94323, 1.01866, 0.1294118, 0, 1, 1,
0.5178119, -0.05681819, 2.249817, 0.1333333, 0, 1, 1,
0.5190872, 0.4611917, 1.208418, 0.1411765, 0, 1, 1,
0.5200199, -0.693203, 2.96678, 0.145098, 0, 1, 1,
0.5247167, -1.126218, 4.631942, 0.1529412, 0, 1, 1,
0.5258496, -0.6025437, 2.314557, 0.1568628, 0, 1, 1,
0.5262313, -0.006991756, 1.520154, 0.1647059, 0, 1, 1,
0.5266327, -0.5431613, 1.566172, 0.1686275, 0, 1, 1,
0.5268561, -0.8816876, 1.579012, 0.1764706, 0, 1, 1,
0.5284759, -1.095219, 2.489327, 0.1803922, 0, 1, 1,
0.5315726, 0.09075942, 3.478042, 0.1882353, 0, 1, 1,
0.532745, -0.404668, 0.4842004, 0.1921569, 0, 1, 1,
0.5359191, 0.04239818, 0.216666, 0.2, 0, 1, 1,
0.5396106, -0.808419, 4.787845, 0.2078431, 0, 1, 1,
0.5396867, -1.802956, 3.81467, 0.2117647, 0, 1, 1,
0.5451493, -1.031907, 3.477978, 0.2196078, 0, 1, 1,
0.5460964, -0.7536058, 0.8207037, 0.2235294, 0, 1, 1,
0.5541677, -1.642459, 2.412758, 0.2313726, 0, 1, 1,
0.5556952, 0.09637595, 3.330098, 0.2352941, 0, 1, 1,
0.5590039, 0.2603915, 1.273804, 0.2431373, 0, 1, 1,
0.5649067, 1.680954, -0.1008035, 0.2470588, 0, 1, 1,
0.5675755, -0.6106023, 0.9101862, 0.254902, 0, 1, 1,
0.568782, -1.103836, 1.997962, 0.2588235, 0, 1, 1,
0.5723192, 1.539807, 1.980806, 0.2666667, 0, 1, 1,
0.5747184, 0.5885772, 0.03973833, 0.2705882, 0, 1, 1,
0.5753829, -1.126739, 2.283011, 0.2784314, 0, 1, 1,
0.5791799, -0.08564399, 1.061588, 0.282353, 0, 1, 1,
0.5801755, -0.2695649, 1.8507, 0.2901961, 0, 1, 1,
0.5843913, -2.035969, 0.6426781, 0.2941177, 0, 1, 1,
0.5887254, -0.3124084, 2.057842, 0.3019608, 0, 1, 1,
0.5899085, -0.5214775, 2.302304, 0.3098039, 0, 1, 1,
0.5901489, -0.0385349, 3.098509, 0.3137255, 0, 1, 1,
0.590269, 0.8195528, 0.6837597, 0.3215686, 0, 1, 1,
0.5904114, 0.3180789, -0.3762677, 0.3254902, 0, 1, 1,
0.5926055, -0.1112692, 0.411931, 0.3333333, 0, 1, 1,
0.5986972, 0.02859525, 1.853799, 0.3372549, 0, 1, 1,
0.6046637, -2.086319, 3.119764, 0.345098, 0, 1, 1,
0.6050945, -0.8843503, 3.744298, 0.3490196, 0, 1, 1,
0.6089436, -0.239989, 0.3712187, 0.3568628, 0, 1, 1,
0.6163004, -0.1948814, 0.2538803, 0.3607843, 0, 1, 1,
0.6192967, 0.1558688, 3.166512, 0.3686275, 0, 1, 1,
0.6200037, -0.230208, 1.351156, 0.372549, 0, 1, 1,
0.6212645, 0.2415024, 0.6565349, 0.3803922, 0, 1, 1,
0.6213145, -0.2674122, 1.599658, 0.3843137, 0, 1, 1,
0.628029, 0.154525, 0.3600685, 0.3921569, 0, 1, 1,
0.628579, -1.49419, 2.361769, 0.3960784, 0, 1, 1,
0.6317024, -0.8757555, 2.15227, 0.4039216, 0, 1, 1,
0.6324438, 2.197952, -0.5544803, 0.4117647, 0, 1, 1,
0.6394508, -0.4417624, 2.07831, 0.4156863, 0, 1, 1,
0.647806, -2.07698, 4.360352, 0.4235294, 0, 1, 1,
0.6540862, -0.3261525, 2.865218, 0.427451, 0, 1, 1,
0.6548929, 0.9892381, 0.1852729, 0.4352941, 0, 1, 1,
0.6589267, -0.9876414, 2.781719, 0.4392157, 0, 1, 1,
0.6599109, -1.14312, 2.193376, 0.4470588, 0, 1, 1,
0.6613839, -0.2743137, 3.843106, 0.4509804, 0, 1, 1,
0.6724523, 0.5187059, 2.25876, 0.4588235, 0, 1, 1,
0.6730083, -0.4854068, 0.6482576, 0.4627451, 0, 1, 1,
0.6765395, -0.0357759, 1.347639, 0.4705882, 0, 1, 1,
0.6862423, -0.1199196, 2.624822, 0.4745098, 0, 1, 1,
0.6869457, -0.1861293, 0.6785199, 0.4823529, 0, 1, 1,
0.6893815, 2.697311, 1.462343, 0.4862745, 0, 1, 1,
0.6941888, -1.597672, 3.579103, 0.4941176, 0, 1, 1,
0.6978334, -1.742018, 3.541961, 0.5019608, 0, 1, 1,
0.7055697, -0.6094555, 1.971309, 0.5058824, 0, 1, 1,
0.7074889, -0.453113, 1.636109, 0.5137255, 0, 1, 1,
0.7147938, -1.572665, 3.170648, 0.5176471, 0, 1, 1,
0.7152322, -0.7570549, 2.406506, 0.5254902, 0, 1, 1,
0.7160536, -0.1923789, 2.59721, 0.5294118, 0, 1, 1,
0.7322443, 0.4945332, 0.4023657, 0.5372549, 0, 1, 1,
0.7324066, 0.55937, 1.055497, 0.5411765, 0, 1, 1,
0.7329432, 0.4297585, 0.8513703, 0.5490196, 0, 1, 1,
0.7340865, -0.3190763, 2.618755, 0.5529412, 0, 1, 1,
0.7357022, 1.447038, 0.6548759, 0.5607843, 0, 1, 1,
0.737271, 0.6624218, 1.895412, 0.5647059, 0, 1, 1,
0.7539922, -0.2369066, 1.42456, 0.572549, 0, 1, 1,
0.7677204, -0.7948747, 2.061762, 0.5764706, 0, 1, 1,
0.7750556, 1.831268, 0.08050933, 0.5843138, 0, 1, 1,
0.7799591, -1.751959, 2.395676, 0.5882353, 0, 1, 1,
0.7847522, 0.4105034, -0.7587761, 0.5960785, 0, 1, 1,
0.7856311, 1.124606, -0.3947659, 0.6039216, 0, 1, 1,
0.7887471, -0.4315622, 1.498129, 0.6078432, 0, 1, 1,
0.7912695, -1.625443, 3.015288, 0.6156863, 0, 1, 1,
0.7922528, -0.006512489, 2.587278, 0.6196079, 0, 1, 1,
0.7982782, 2.307252, 0.8696995, 0.627451, 0, 1, 1,
0.8033047, 0.08713699, 0.3915609, 0.6313726, 0, 1, 1,
0.8038319, -2.645282, 3.125058, 0.6392157, 0, 1, 1,
0.8079037, -0.376638, 3.388675, 0.6431373, 0, 1, 1,
0.8168195, 0.7118654, 1.43835, 0.6509804, 0, 1, 1,
0.8206854, -0.5105613, 2.035076, 0.654902, 0, 1, 1,
0.8222977, -0.08310451, 2.716766, 0.6627451, 0, 1, 1,
0.8250916, -0.1059364, 1.096783, 0.6666667, 0, 1, 1,
0.8306633, -1.633317, 2.420263, 0.6745098, 0, 1, 1,
0.8348826, 1.607676, 1.839952, 0.6784314, 0, 1, 1,
0.8368819, 2.175159, 0.2841519, 0.6862745, 0, 1, 1,
0.8372441, -1.654882, 1.031079, 0.6901961, 0, 1, 1,
0.838031, -0.791436, 2.783916, 0.6980392, 0, 1, 1,
0.8406911, -1.488124, 2.898045, 0.7058824, 0, 1, 1,
0.8456705, -0.2169639, 0.2332845, 0.7098039, 0, 1, 1,
0.8491314, -0.7511288, 1.751265, 0.7176471, 0, 1, 1,
0.8532631, 1.444018, 1.284284, 0.7215686, 0, 1, 1,
0.8651069, 0.8161311, 1.723548, 0.7294118, 0, 1, 1,
0.8719313, 0.8759133, 0.3742791, 0.7333333, 0, 1, 1,
0.8726162, 0.7347311, 0.6618789, 0.7411765, 0, 1, 1,
0.8771038, 1.127354, 2.430361, 0.7450981, 0, 1, 1,
0.8785712, -0.195803, 3.417315, 0.7529412, 0, 1, 1,
0.878836, 0.04122673, 2.72775, 0.7568628, 0, 1, 1,
0.8878772, 0.7063617, 1.041583, 0.7647059, 0, 1, 1,
0.8916373, 0.7852351, 1.543361, 0.7686275, 0, 1, 1,
0.8924781, -0.3011221, 3.21358, 0.7764706, 0, 1, 1,
0.8961288, 0.5077819, 2.086845, 0.7803922, 0, 1, 1,
0.9008071, 0.9190405, 0.09304646, 0.7882353, 0, 1, 1,
0.9026362, 0.06964366, 2.742052, 0.7921569, 0, 1, 1,
0.9035899, 0.1588044, 1.12275, 0.8, 0, 1, 1,
0.9036311, 0.8016128, 1.024878, 0.8078431, 0, 1, 1,
0.9099081, -0.002541727, 1.838264, 0.8117647, 0, 1, 1,
0.911437, -3.163064, 2.249163, 0.8196079, 0, 1, 1,
0.9115475, 0.6789995, 1.189263, 0.8235294, 0, 1, 1,
0.9125178, 1.062224, -1.570922, 0.8313726, 0, 1, 1,
0.9133828, 0.4024642, -0.5743278, 0.8352941, 0, 1, 1,
0.9149259, -0.7533838, 1.62885, 0.8431373, 0, 1, 1,
0.917058, -0.7444927, 2.161992, 0.8470588, 0, 1, 1,
0.9195379, -0.07481425, 1.788696, 0.854902, 0, 1, 1,
0.9213852, -1.622261, 2.988899, 0.8588235, 0, 1, 1,
0.9240444, -0.6565673, 3.936136, 0.8666667, 0, 1, 1,
0.9254988, 2.209115, 0.9545903, 0.8705882, 0, 1, 1,
0.9270236, 1.51177, -0.5716815, 0.8784314, 0, 1, 1,
0.9282442, -1.446681, 3.953478, 0.8823529, 0, 1, 1,
0.9331614, 0.775717, 1.752726, 0.8901961, 0, 1, 1,
0.9346198, 2.31803, 0.3713548, 0.8941177, 0, 1, 1,
0.9347668, -0.1609516, -0.01602938, 0.9019608, 0, 1, 1,
0.9369442, 0.1749331, 1.81745, 0.9098039, 0, 1, 1,
0.937116, -2.018058, 3.429369, 0.9137255, 0, 1, 1,
0.9446578, 0.696157, -1.007685, 0.9215686, 0, 1, 1,
0.9491032, 0.7632704, 1.178124, 0.9254902, 0, 1, 1,
0.9569316, 0.7249569, 1.462842, 0.9333333, 0, 1, 1,
0.9625076, -1.46821, 1.056311, 0.9372549, 0, 1, 1,
0.9648883, -0.09377757, 2.254805, 0.945098, 0, 1, 1,
0.9689595, -1.678907, 2.253489, 0.9490196, 0, 1, 1,
0.9699436, -1.031812, 0.8446547, 0.9568627, 0, 1, 1,
0.9708329, 1.950521, 1.375716, 0.9607843, 0, 1, 1,
0.9738185, 0.2441778, 2.402779, 0.9686275, 0, 1, 1,
0.9772519, 0.553337, -0.4682053, 0.972549, 0, 1, 1,
0.9773628, 1.555258, -1.514403, 0.9803922, 0, 1, 1,
0.9914047, -1.171988, 3.691383, 0.9843137, 0, 1, 1,
0.9958013, 0.24785, 1.030908, 0.9921569, 0, 1, 1,
1.002586, 0.2675083, 3.658873, 0.9960784, 0, 1, 1,
1.003294, -0.01620917, 3.07894, 1, 0, 0.9960784, 1,
1.005123, -1.258101, 3.207058, 1, 0, 0.9882353, 1,
1.006397, 1.570033, -0.1245422, 1, 0, 0.9843137, 1,
1.006598, 0.3219675, 3.168098, 1, 0, 0.9764706, 1,
1.007324, -0.03804514, 0.9661279, 1, 0, 0.972549, 1,
1.010545, -0.309969, 2.586665, 1, 0, 0.9647059, 1,
1.01391, 1.46903, -0.1739066, 1, 0, 0.9607843, 1,
1.014587, 0.3510869, 1.184924, 1, 0, 0.9529412, 1,
1.015117, 0.4589075, 1.386468, 1, 0, 0.9490196, 1,
1.01857, -0.7169418, 1.982378, 1, 0, 0.9411765, 1,
1.019909, 1.336134, -0.7383419, 1, 0, 0.9372549, 1,
1.028197, -0.2436243, 0.5598191, 1, 0, 0.9294118, 1,
1.03193, 0.2215341, 0.04064082, 1, 0, 0.9254902, 1,
1.035164, 0.248565, 1.522978, 1, 0, 0.9176471, 1,
1.035662, -0.08673687, 2.194551, 1, 0, 0.9137255, 1,
1.048844, -0.03002996, 3.694279, 1, 0, 0.9058824, 1,
1.048883, -0.9967051, 3.510295, 1, 0, 0.9019608, 1,
1.049283, -0.8713311, 2.014046, 1, 0, 0.8941177, 1,
1.05473, 0.9181069, 1.090278, 1, 0, 0.8862745, 1,
1.056401, -0.5495579, 2.56577, 1, 0, 0.8823529, 1,
1.063537, -0.7077155, 3.101012, 1, 0, 0.8745098, 1,
1.067203, -2.023927, 1.887474, 1, 0, 0.8705882, 1,
1.069906, -0.6231498, 3.231688, 1, 0, 0.8627451, 1,
1.070877, -0.6170292, 1.681107, 1, 0, 0.8588235, 1,
1.075268, -0.6056833, 2.1443, 1, 0, 0.8509804, 1,
1.086449, -1.169297, 2.796601, 1, 0, 0.8470588, 1,
1.086654, 1.081684, 0.6818415, 1, 0, 0.8392157, 1,
1.087494, 0.1171845, 1.438041, 1, 0, 0.8352941, 1,
1.101363, 0.1220365, 0.7694024, 1, 0, 0.827451, 1,
1.104124, -0.8000063, 2.61717, 1, 0, 0.8235294, 1,
1.105737, -1.154514, 2.770068, 1, 0, 0.8156863, 1,
1.108664, -0.3033572, 1.607522, 1, 0, 0.8117647, 1,
1.123678, 0.5091231, -0.7604597, 1, 0, 0.8039216, 1,
1.125299, -0.2662725, 1.711353, 1, 0, 0.7960784, 1,
1.126452, -0.6984138, 4.346874, 1, 0, 0.7921569, 1,
1.128399, 0.279357, 3.971918, 1, 0, 0.7843137, 1,
1.131458, -1.244064, 2.565077, 1, 0, 0.7803922, 1,
1.139263, -1.626348, 2.004862, 1, 0, 0.772549, 1,
1.141986, 0.7215005, 2.343774, 1, 0, 0.7686275, 1,
1.146327, 0.1403673, 0.7609484, 1, 0, 0.7607843, 1,
1.150242, -0.1059901, 2.940878, 1, 0, 0.7568628, 1,
1.153536, 1.154649, 0.7887423, 1, 0, 0.7490196, 1,
1.155017, 0.9473323, -0.5635675, 1, 0, 0.7450981, 1,
1.163169, -1.631186, 1.830172, 1, 0, 0.7372549, 1,
1.168103, -0.1972508, 0.2181331, 1, 0, 0.7333333, 1,
1.171968, -1.320053, 2.504994, 1, 0, 0.7254902, 1,
1.173035, 1.149568, 1.730032, 1, 0, 0.7215686, 1,
1.175165, 0.6759942, 1.623122, 1, 0, 0.7137255, 1,
1.181143, -0.8413148, 2.407805, 1, 0, 0.7098039, 1,
1.188559, -1.36519, 3.158543, 1, 0, 0.7019608, 1,
1.190636, 0.9158983, -0.3310923, 1, 0, 0.6941177, 1,
1.192038, -1.018693, 0.5969981, 1, 0, 0.6901961, 1,
1.201626, -0.6194128, 2.345863, 1, 0, 0.682353, 1,
1.207715, -0.6105449, 2.84469, 1, 0, 0.6784314, 1,
1.209621, 0.1897102, 3.158906, 1, 0, 0.6705883, 1,
1.220793, 1.592067, 1.419392, 1, 0, 0.6666667, 1,
1.224777, 1.810303, 1.470383, 1, 0, 0.6588235, 1,
1.230647, -0.5321994, 3.066783, 1, 0, 0.654902, 1,
1.240941, -0.3530416, -0.2800964, 1, 0, 0.6470588, 1,
1.247514, -0.442427, 1.64823, 1, 0, 0.6431373, 1,
1.261112, 0.8526666, 1.320772, 1, 0, 0.6352941, 1,
1.283721, -0.6463276, 2.409483, 1, 0, 0.6313726, 1,
1.291845, -0.7101586, 0.3506289, 1, 0, 0.6235294, 1,
1.292603, 0.4850655, 0.5589092, 1, 0, 0.6196079, 1,
1.297166, -1.666994, 2.741537, 1, 0, 0.6117647, 1,
1.317732, -0.5199508, 1.836926, 1, 0, 0.6078432, 1,
1.321162, 0.5470148, 1.408152, 1, 0, 0.6, 1,
1.326838, 0.650817, -0.05831449, 1, 0, 0.5921569, 1,
1.327755, 0.02260252, 3.096866, 1, 0, 0.5882353, 1,
1.333007, -1.932504, 4.282596, 1, 0, 0.5803922, 1,
1.341985, 0.6335001, 2.429892, 1, 0, 0.5764706, 1,
1.348994, 1.282551, 0.6745219, 1, 0, 0.5686275, 1,
1.349841, -0.4257827, 3.211235, 1, 0, 0.5647059, 1,
1.349848, -1.677303, 0.9649958, 1, 0, 0.5568628, 1,
1.35611, -0.2920731, 1.146455, 1, 0, 0.5529412, 1,
1.358395, -0.3242557, 2.550519, 1, 0, 0.5450981, 1,
1.361741, 0.4329025, 0.4872369, 1, 0, 0.5411765, 1,
1.369028, 1.31986, 3.303294, 1, 0, 0.5333334, 1,
1.370448, -0.4151486, 0.8341153, 1, 0, 0.5294118, 1,
1.372993, 0.8205659, 1.192747, 1, 0, 0.5215687, 1,
1.373088, 0.5150222, 1.319486, 1, 0, 0.5176471, 1,
1.37432, -0.7125123, 0.6461567, 1, 0, 0.509804, 1,
1.37604, -1.046382, 0.9412869, 1, 0, 0.5058824, 1,
1.376057, 1.177091, 0.5251741, 1, 0, 0.4980392, 1,
1.376994, -1.603262, 3.635743, 1, 0, 0.4901961, 1,
1.380147, -1.425379, 2.929371, 1, 0, 0.4862745, 1,
1.398662, -1.052656, 1.859834, 1, 0, 0.4784314, 1,
1.404048, 0.8279737, -0.5393872, 1, 0, 0.4745098, 1,
1.414738, -1.01092, 2.971284, 1, 0, 0.4666667, 1,
1.418336, 1.186009, 0.4490357, 1, 0, 0.4627451, 1,
1.418931, 0.1036752, -0.5849211, 1, 0, 0.454902, 1,
1.424874, 0.5501446, 2.314753, 1, 0, 0.4509804, 1,
1.448935, -1.156077, 1.392617, 1, 0, 0.4431373, 1,
1.450709, 0.01023562, 0.9372823, 1, 0, 0.4392157, 1,
1.458687, -1.099527, 0.7863407, 1, 0, 0.4313726, 1,
1.460217, 0.1596878, 2.730484, 1, 0, 0.427451, 1,
1.466903, -0.9816939, 2.306944, 1, 0, 0.4196078, 1,
1.468706, 0.2279845, -0.1466459, 1, 0, 0.4156863, 1,
1.470547, 1.300051, 0.133597, 1, 0, 0.4078431, 1,
1.473013, -0.797293, 2.366696, 1, 0, 0.4039216, 1,
1.48634, 0.5130891, 3.505763, 1, 0, 0.3960784, 1,
1.493875, -0.6444799, 2.770507, 1, 0, 0.3882353, 1,
1.497027, 0.1302849, 2.398233, 1, 0, 0.3843137, 1,
1.51106, -1.279409, 1.180751, 1, 0, 0.3764706, 1,
1.516025, 1.223863, 2.525935, 1, 0, 0.372549, 1,
1.529099, -1.205273, 1.005014, 1, 0, 0.3647059, 1,
1.529938, 0.2942399, 1.836371, 1, 0, 0.3607843, 1,
1.530538, 0.06526326, 0.4527636, 1, 0, 0.3529412, 1,
1.534584, 0.3957801, 1.110443, 1, 0, 0.3490196, 1,
1.559177, -0.2805003, 1.843495, 1, 0, 0.3411765, 1,
1.577319, -0.3835825, 1.250424, 1, 0, 0.3372549, 1,
1.586352, -0.03077555, 1.645234, 1, 0, 0.3294118, 1,
1.621274, -0.2782172, 3.170795, 1, 0, 0.3254902, 1,
1.623422, 0.3714812, -0.6326503, 1, 0, 0.3176471, 1,
1.628026, 0.5148199, -0.04166526, 1, 0, 0.3137255, 1,
1.640803, -0.7930119, 1.671719, 1, 0, 0.3058824, 1,
1.664199, -0.1377645, 2.174012, 1, 0, 0.2980392, 1,
1.672565, -1.469604, 1.099809, 1, 0, 0.2941177, 1,
1.711422, 1.105697, 2.702374, 1, 0, 0.2862745, 1,
1.729114, -0.6607655, 2.00826, 1, 0, 0.282353, 1,
1.731225, -0.2299183, 2.390456, 1, 0, 0.2745098, 1,
1.732265, 0.2367886, 0.8300538, 1, 0, 0.2705882, 1,
1.736401, -0.3857011, -0.9038096, 1, 0, 0.2627451, 1,
1.740708, 0.01017975, 0.2547241, 1, 0, 0.2588235, 1,
1.742252, 0.3708212, 1.266497, 1, 0, 0.2509804, 1,
1.759616, 0.3291346, -1.255946, 1, 0, 0.2470588, 1,
1.762107, 1.013815, 2.361, 1, 0, 0.2392157, 1,
1.763123, -0.01313989, 1.983001, 1, 0, 0.2352941, 1,
1.766142, 0.785553, 1.048182, 1, 0, 0.227451, 1,
1.767464, -0.1731582, 0.7269357, 1, 0, 0.2235294, 1,
1.770653, -0.5033177, 3.988538, 1, 0, 0.2156863, 1,
1.773172, -0.8544672, 0.769477, 1, 0, 0.2117647, 1,
1.776455, 0.6065801, 1.731644, 1, 0, 0.2039216, 1,
1.805153, -2.126193, 1.248224, 1, 0, 0.1960784, 1,
1.812616, -1.918859, 2.705678, 1, 0, 0.1921569, 1,
1.814058, 2.267595, 1.3511, 1, 0, 0.1843137, 1,
1.837349, -0.004177877, 2.193886, 1, 0, 0.1803922, 1,
1.841186, -0.205949, 0.5848311, 1, 0, 0.172549, 1,
1.872626, 0.1294686, 0.3693971, 1, 0, 0.1686275, 1,
1.891724, -0.2798247, 2.399291, 1, 0, 0.1607843, 1,
1.905955, 0.3545085, 1.126008, 1, 0, 0.1568628, 1,
1.923471, 1.211505, 0.0042137, 1, 0, 0.1490196, 1,
1.932736, 0.1373147, 0.05137993, 1, 0, 0.145098, 1,
1.944043, 1.174427, 0.4299694, 1, 0, 0.1372549, 1,
1.955818, 0.1670719, 0.6228822, 1, 0, 0.1333333, 1,
2.002355, -0.7077438, 2.330014, 1, 0, 0.1254902, 1,
2.023039, 0.4151818, 1.627539, 1, 0, 0.1215686, 1,
2.029782, -0.3952393, 2.532639, 1, 0, 0.1137255, 1,
2.076662, -0.2640217, 1.18571, 1, 0, 0.1098039, 1,
2.110936, 0.159745, 1.59968, 1, 0, 0.1019608, 1,
2.140874, -0.3509303, 1.236812, 1, 0, 0.09411765, 1,
2.158932, -1.031018, 1.672014, 1, 0, 0.09019608, 1,
2.163049, -0.1031907, -0.6465645, 1, 0, 0.08235294, 1,
2.169918, -0.7174416, 2.317181, 1, 0, 0.07843138, 1,
2.184778, -0.7168415, 1.476219, 1, 0, 0.07058824, 1,
2.217657, -0.03255351, 1.570222, 1, 0, 0.06666667, 1,
2.240014, -0.2323677, 1.639179, 1, 0, 0.05882353, 1,
2.265949, 1.28038, 1.624451, 1, 0, 0.05490196, 1,
2.269086, -1.240506, 1.142294, 1, 0, 0.04705882, 1,
2.47496, 0.3181795, 1.017573, 1, 0, 0.04313726, 1,
2.511779, 1.419924, 2.019279, 1, 0, 0.03529412, 1,
2.635005, 0.423947, 1.939617, 1, 0, 0.03137255, 1,
2.723108, -0.02511858, 3.352478, 1, 0, 0.02352941, 1,
2.748719, 0.199578, 0.08498055, 1, 0, 0.01960784, 1,
3.119336, -1.102206, -1.080652, 1, 0, 0.01176471, 1,
3.608331, 1.066298, 1.221365, 1, 0, 0.007843138, 1
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
-0.02373481, -4.259851, -7.001376, 0, -0.5, 0.5, 0.5,
-0.02373481, -4.259851, -7.001376, 1, -0.5, 0.5, 0.5,
-0.02373481, -4.259851, -7.001376, 1, 1.5, 0.5, 0.5,
-0.02373481, -4.259851, -7.001376, 0, 1.5, 0.5, 0.5
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
-4.887071, 0.07229304, -7.001376, 0, -0.5, 0.5, 0.5,
-4.887071, 0.07229304, -7.001376, 1, -0.5, 0.5, 0.5,
-4.887071, 0.07229304, -7.001376, 1, 1.5, 0.5, 0.5,
-4.887071, 0.07229304, -7.001376, 0, 1.5, 0.5, 0.5
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
-4.887071, -4.259851, 0.2252195, 0, -0.5, 0.5, 0.5,
-4.887071, -4.259851, 0.2252195, 1, -0.5, 0.5, 0.5,
-4.887071, -4.259851, 0.2252195, 1, 1.5, 0.5, 0.5,
-4.887071, -4.259851, 0.2252195, 0, 1.5, 0.5, 0.5
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
-2, -3.260125, -5.3337,
2, -3.260125, -5.3337,
-2, -3.260125, -5.3337,
-2, -3.426746, -5.611646,
0, -3.260125, -5.3337,
0, -3.426746, -5.611646,
2, -3.260125, -5.3337,
2, -3.426746, -5.611646
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
-2, -3.759988, -6.167538, 0, -0.5, 0.5, 0.5,
-2, -3.759988, -6.167538, 1, -0.5, 0.5, 0.5,
-2, -3.759988, -6.167538, 1, 1.5, 0.5, 0.5,
-2, -3.759988, -6.167538, 0, 1.5, 0.5, 0.5,
0, -3.759988, -6.167538, 0, -0.5, 0.5, 0.5,
0, -3.759988, -6.167538, 1, -0.5, 0.5, 0.5,
0, -3.759988, -6.167538, 1, 1.5, 0.5, 0.5,
0, -3.759988, -6.167538, 0, 1.5, 0.5, 0.5,
2, -3.759988, -6.167538, 0, -0.5, 0.5, 0.5,
2, -3.759988, -6.167538, 1, -0.5, 0.5, 0.5,
2, -3.759988, -6.167538, 1, 1.5, 0.5, 0.5,
2, -3.759988, -6.167538, 0, 1.5, 0.5, 0.5
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
-3.764763, -3, -5.3337,
-3.764763, 3, -5.3337,
-3.764763, -3, -5.3337,
-3.951814, -3, -5.611646,
-3.764763, -2, -5.3337,
-3.951814, -2, -5.611646,
-3.764763, -1, -5.3337,
-3.951814, -1, -5.611646,
-3.764763, 0, -5.3337,
-3.951814, 0, -5.611646,
-3.764763, 1, -5.3337,
-3.951814, 1, -5.611646,
-3.764763, 2, -5.3337,
-3.951814, 2, -5.611646,
-3.764763, 3, -5.3337,
-3.951814, 3, -5.611646
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
-4.325917, -3, -6.167538, 0, -0.5, 0.5, 0.5,
-4.325917, -3, -6.167538, 1, -0.5, 0.5, 0.5,
-4.325917, -3, -6.167538, 1, 1.5, 0.5, 0.5,
-4.325917, -3, -6.167538, 0, 1.5, 0.5, 0.5,
-4.325917, -2, -6.167538, 0, -0.5, 0.5, 0.5,
-4.325917, -2, -6.167538, 1, -0.5, 0.5, 0.5,
-4.325917, -2, -6.167538, 1, 1.5, 0.5, 0.5,
-4.325917, -2, -6.167538, 0, 1.5, 0.5, 0.5,
-4.325917, -1, -6.167538, 0, -0.5, 0.5, 0.5,
-4.325917, -1, -6.167538, 1, -0.5, 0.5, 0.5,
-4.325917, -1, -6.167538, 1, 1.5, 0.5, 0.5,
-4.325917, -1, -6.167538, 0, 1.5, 0.5, 0.5,
-4.325917, 0, -6.167538, 0, -0.5, 0.5, 0.5,
-4.325917, 0, -6.167538, 1, -0.5, 0.5, 0.5,
-4.325917, 0, -6.167538, 1, 1.5, 0.5, 0.5,
-4.325917, 0, -6.167538, 0, 1.5, 0.5, 0.5,
-4.325917, 1, -6.167538, 0, -0.5, 0.5, 0.5,
-4.325917, 1, -6.167538, 1, -0.5, 0.5, 0.5,
-4.325917, 1, -6.167538, 1, 1.5, 0.5, 0.5,
-4.325917, 1, -6.167538, 0, 1.5, 0.5, 0.5,
-4.325917, 2, -6.167538, 0, -0.5, 0.5, 0.5,
-4.325917, 2, -6.167538, 1, -0.5, 0.5, 0.5,
-4.325917, 2, -6.167538, 1, 1.5, 0.5, 0.5,
-4.325917, 2, -6.167538, 0, 1.5, 0.5, 0.5,
-4.325917, 3, -6.167538, 0, -0.5, 0.5, 0.5,
-4.325917, 3, -6.167538, 1, -0.5, 0.5, 0.5,
-4.325917, 3, -6.167538, 1, 1.5, 0.5, 0.5,
-4.325917, 3, -6.167538, 0, 1.5, 0.5, 0.5
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
-3.764763, -3.260125, -4,
-3.764763, -3.260125, 4,
-3.764763, -3.260125, -4,
-3.951814, -3.426746, -4,
-3.764763, -3.260125, -2,
-3.951814, -3.426746, -2,
-3.764763, -3.260125, 0,
-3.951814, -3.426746, 0,
-3.764763, -3.260125, 2,
-3.951814, -3.426746, 2,
-3.764763, -3.260125, 4,
-3.951814, -3.426746, 4
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
-4.325917, -3.759988, -4, 0, -0.5, 0.5, 0.5,
-4.325917, -3.759988, -4, 1, -0.5, 0.5, 0.5,
-4.325917, -3.759988, -4, 1, 1.5, 0.5, 0.5,
-4.325917, -3.759988, -4, 0, 1.5, 0.5, 0.5,
-4.325917, -3.759988, -2, 0, -0.5, 0.5, 0.5,
-4.325917, -3.759988, -2, 1, -0.5, 0.5, 0.5,
-4.325917, -3.759988, -2, 1, 1.5, 0.5, 0.5,
-4.325917, -3.759988, -2, 0, 1.5, 0.5, 0.5,
-4.325917, -3.759988, 0, 0, -0.5, 0.5, 0.5,
-4.325917, -3.759988, 0, 1, -0.5, 0.5, 0.5,
-4.325917, -3.759988, 0, 1, 1.5, 0.5, 0.5,
-4.325917, -3.759988, 0, 0, 1.5, 0.5, 0.5,
-4.325917, -3.759988, 2, 0, -0.5, 0.5, 0.5,
-4.325917, -3.759988, 2, 1, -0.5, 0.5, 0.5,
-4.325917, -3.759988, 2, 1, 1.5, 0.5, 0.5,
-4.325917, -3.759988, 2, 0, 1.5, 0.5, 0.5,
-4.325917, -3.759988, 4, 0, -0.5, 0.5, 0.5,
-4.325917, -3.759988, 4, 1, -0.5, 0.5, 0.5,
-4.325917, -3.759988, 4, 1, 1.5, 0.5, 0.5,
-4.325917, -3.759988, 4, 0, 1.5, 0.5, 0.5
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
-3.764763, -3.260125, -5.3337,
-3.764763, 3.404711, -5.3337,
-3.764763, -3.260125, 5.784139,
-3.764763, 3.404711, 5.784139,
-3.764763, -3.260125, -5.3337,
-3.764763, -3.260125, 5.784139,
-3.764763, 3.404711, -5.3337,
-3.764763, 3.404711, 5.784139,
-3.764763, -3.260125, -5.3337,
3.717293, -3.260125, -5.3337,
-3.764763, -3.260125, 5.784139,
3.717293, -3.260125, 5.784139,
-3.764763, 3.404711, -5.3337,
3.717293, 3.404711, -5.3337,
-3.764763, 3.404711, 5.784139,
3.717293, 3.404711, 5.784139,
3.717293, -3.260125, -5.3337,
3.717293, 3.404711, -5.3337,
3.717293, -3.260125, 5.784139,
3.717293, 3.404711, 5.784139,
3.717293, -3.260125, -5.3337,
3.717293, -3.260125, 5.784139,
3.717293, 3.404711, -5.3337,
3.717293, 3.404711, 5.784139
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
var radius = 7.992024;
var distance = 35.55742;
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
mvMatrix.translate( 0.02373481, -0.07229304, -0.2252195 );
mvMatrix.scale( 1.154914, 1.296526, 0.7772313 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.55742);
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
flucythrinate<-read.table("flucythrinate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flucythrinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'flucythrinate' not found
```

```r
y<-flucythrinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'flucythrinate' not found
```

```r
z<-flucythrinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'flucythrinate' not found
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
-3.655801, 0.7985628, -0.2504355, 0, 0, 1, 1, 1,
-3.525927, -2.460163, -2.440652, 1, 0, 0, 1, 1,
-3.104916, -0.3872409, -2.258275, 1, 0, 0, 1, 1,
-3.102122, 0.3478802, -1.34421, 1, 0, 0, 1, 1,
-2.672101, -1.674664, -2.976704, 1, 0, 0, 1, 1,
-2.521525, -0.7314119, -4.007443, 1, 0, 0, 1, 1,
-2.421307, 0.1256489, -2.346049, 0, 0, 0, 1, 1,
-2.353356, 1.847043, 0.1415135, 0, 0, 0, 1, 1,
-2.340272, -1.174474, -2.651125, 0, 0, 0, 1, 1,
-2.311201, -0.6738106, -2.197494, 0, 0, 0, 1, 1,
-2.165262, 0.398976, -0.8085683, 0, 0, 0, 1, 1,
-2.157084, -1.629755, -4.381586, 0, 0, 0, 1, 1,
-2.155275, 0.01477822, -3.923924, 0, 0, 0, 1, 1,
-2.11242, 1.070864, -0.816838, 1, 1, 1, 1, 1,
-2.050167, 1.183871, -1.358414, 1, 1, 1, 1, 1,
-2.026789, -1.035719, -2.24944, 1, 1, 1, 1, 1,
-2.025201, 1.210196, -0.9122554, 1, 1, 1, 1, 1,
-2.020012, -2.011031, -2.923055, 1, 1, 1, 1, 1,
-2.019882, 0.5222862, -1.188667, 1, 1, 1, 1, 1,
-2.002802, 0.8000067, -0.4039627, 1, 1, 1, 1, 1,
-1.989979, 0.3506199, 1.022656, 1, 1, 1, 1, 1,
-1.972513, 0.6006008, -1.087952, 1, 1, 1, 1, 1,
-1.954457, -1.091981, -1.923301, 1, 1, 1, 1, 1,
-1.9419, -0.2539831, -1.11864, 1, 1, 1, 1, 1,
-1.931412, 0.9935797, -1.241706, 1, 1, 1, 1, 1,
-1.874876, -2.646312, -2.1058, 1, 1, 1, 1, 1,
-1.859006, -1.339287, -0.8076683, 1, 1, 1, 1, 1,
-1.857003, 1.065825, -1.171738, 1, 1, 1, 1, 1,
-1.830651, 1.043393, -0.2248573, 0, 0, 1, 1, 1,
-1.798728, 1.443521, -0.6286308, 1, 0, 0, 1, 1,
-1.787645, -0.1353135, -0.7949733, 1, 0, 0, 1, 1,
-1.775914, -0.1349652, -3.191721, 1, 0, 0, 1, 1,
-1.762981, 0.1948145, -0.6527036, 1, 0, 0, 1, 1,
-1.759897, 0.6154003, -0.6160194, 1, 0, 0, 1, 1,
-1.752329, -0.7934079, -1.645288, 0, 0, 0, 1, 1,
-1.747863, -0.14403, -2.711054, 0, 0, 0, 1, 1,
-1.717291, -0.8718066, -2.533882, 0, 0, 0, 1, 1,
-1.694983, 0.7736281, -2.523925, 0, 0, 0, 1, 1,
-1.677215, -1.156349, -2.450801, 0, 0, 0, 1, 1,
-1.663656, -1.029678, -2.537372, 0, 0, 0, 1, 1,
-1.654506, -0.7678005, -2.695348, 0, 0, 0, 1, 1,
-1.647078, -0.9218035, -3.20165, 1, 1, 1, 1, 1,
-1.620059, -0.3490983, -2.430122, 1, 1, 1, 1, 1,
-1.618109, -1.026466, -4.578504, 1, 1, 1, 1, 1,
-1.617254, 1.187088, 1.817127, 1, 1, 1, 1, 1,
-1.558912, 0.4121276, -3.259887, 1, 1, 1, 1, 1,
-1.542902, 0.7260336, -0.6590453, 1, 1, 1, 1, 1,
-1.50142, 0.5753353, -2.01814, 1, 1, 1, 1, 1,
-1.499736, -1.463118, -2.378604, 1, 1, 1, 1, 1,
-1.494801, 0.1003031, -0.5109063, 1, 1, 1, 1, 1,
-1.470003, 0.5244637, -0.5420299, 1, 1, 1, 1, 1,
-1.466588, 1.153384, -2.383017, 1, 1, 1, 1, 1,
-1.464991, -2.200839, -3.002078, 1, 1, 1, 1, 1,
-1.463018, 1.742533, -0.9289715, 1, 1, 1, 1, 1,
-1.458835, 0.5270576, -1.734161, 1, 1, 1, 1, 1,
-1.457569, -0.247566, -1.358971, 1, 1, 1, 1, 1,
-1.426121, 0.4290411, -1.83785, 0, 0, 1, 1, 1,
-1.425772, -0.5866459, -2.924461, 1, 0, 0, 1, 1,
-1.411617, 0.5022828, -2.813077, 1, 0, 0, 1, 1,
-1.41133, 0.5400645, -2.014751, 1, 0, 0, 1, 1,
-1.407432, -0.47267, -1.779306, 1, 0, 0, 1, 1,
-1.392778, 1.045951, -1.278637, 1, 0, 0, 1, 1,
-1.390382, 0.2985631, -1.33986, 0, 0, 0, 1, 1,
-1.382215, 1.059329, -1.801476, 0, 0, 0, 1, 1,
-1.376918, -2.083627, -1.723464, 0, 0, 0, 1, 1,
-1.375368, -1.455158, -1.626832, 0, 0, 0, 1, 1,
-1.364916, -0.3931942, -2.066049, 0, 0, 0, 1, 1,
-1.354303, 0.7336626, -0.3221928, 0, 0, 0, 1, 1,
-1.343377, 0.9637217, -1.646556, 0, 0, 0, 1, 1,
-1.342836, -2.486026, -1.041638, 1, 1, 1, 1, 1,
-1.334656, -1.357624, -3.354837, 1, 1, 1, 1, 1,
-1.326751, 0.03815847, -1.198993, 1, 1, 1, 1, 1,
-1.319872, -0.2678398, -2.535357, 1, 1, 1, 1, 1,
-1.317992, -0.383884, -2.734778, 1, 1, 1, 1, 1,
-1.307895, 2.051759, -1.12719, 1, 1, 1, 1, 1,
-1.306855, 1.140493, -1.892757, 1, 1, 1, 1, 1,
-1.303332, -0.6411033, -0.09836943, 1, 1, 1, 1, 1,
-1.299724, -2.075224, -3.937906, 1, 1, 1, 1, 1,
-1.298225, 0.5053456, -2.696118, 1, 1, 1, 1, 1,
-1.290031, 0.702586, -1.463505, 1, 1, 1, 1, 1,
-1.284602, 2.292288, -1.716697, 1, 1, 1, 1, 1,
-1.254709, -2.431216, -1.93033, 1, 1, 1, 1, 1,
-1.250182, -0.6342176, -1.475382, 1, 1, 1, 1, 1,
-1.246126, -0.1947652, -0.8484947, 1, 1, 1, 1, 1,
-1.242241, 0.2809534, -1.1048, 0, 0, 1, 1, 1,
-1.237208, -0.03320884, -0.4563541, 1, 0, 0, 1, 1,
-1.233745, -1.232437, -3.310139, 1, 0, 0, 1, 1,
-1.231143, -0.3016901, -1.127399, 1, 0, 0, 1, 1,
-1.227967, -1.469841, -0.7624775, 1, 0, 0, 1, 1,
-1.209477, 0.6911631, -0.5002911, 1, 0, 0, 1, 1,
-1.208543, 2.304815, -0.5274253, 0, 0, 0, 1, 1,
-1.196769, 1.133741, -1.818598, 0, 0, 0, 1, 1,
-1.193542, 0.03294225, -1.561566, 0, 0, 0, 1, 1,
-1.193414, -0.4618166, -2.400169, 0, 0, 0, 1, 1,
-1.190911, 0.5815811, -2.634895, 0, 0, 0, 1, 1,
-1.189503, 0.4979572, -1.404294, 0, 0, 0, 1, 1,
-1.186784, 0.9217854, -2.767282, 0, 0, 0, 1, 1,
-1.185626, -0.6565984, -0.5062729, 1, 1, 1, 1, 1,
-1.172201, -0.3449443, -2.833386, 1, 1, 1, 1, 1,
-1.155322, 0.8860966, -1.934824, 1, 1, 1, 1, 1,
-1.150203, 0.5381336, -1.119519, 1, 1, 1, 1, 1,
-1.145205, -1.740225, -0.3739754, 1, 1, 1, 1, 1,
-1.134681, 0.5294543, -1.386743, 1, 1, 1, 1, 1,
-1.122419, 0.8885748, 0.4957455, 1, 1, 1, 1, 1,
-1.121261, 0.08334522, -2.014695, 1, 1, 1, 1, 1,
-1.120854, 1.227791, -0.1207451, 1, 1, 1, 1, 1,
-1.111835, -0.2291199, -0.8888198, 1, 1, 1, 1, 1,
-1.085918, 2.129453, -1.380628, 1, 1, 1, 1, 1,
-1.083655, 1.187563, -1.581523, 1, 1, 1, 1, 1,
-1.078788, 1.451833, -0.2108507, 1, 1, 1, 1, 1,
-1.077716, -0.2070121, -0.4378102, 1, 1, 1, 1, 1,
-1.077664, -1.964082, -3.008794, 1, 1, 1, 1, 1,
-1.076335, 0.935036, -0.8456034, 0, 0, 1, 1, 1,
-1.071205, 0.6507695, -2.655962, 1, 0, 0, 1, 1,
-1.068614, -0.2438715, -1.931929, 1, 0, 0, 1, 1,
-1.067391, 0.2060127, 0.3335672, 1, 0, 0, 1, 1,
-1.066577, -1.618411, -2.73601, 1, 0, 0, 1, 1,
-1.062429, -0.3482515, -2.337697, 1, 0, 0, 1, 1,
-1.060587, 0.3168845, -0.7420081, 0, 0, 0, 1, 1,
-1.059505, 0.3645149, -1.594179, 0, 0, 0, 1, 1,
-1.048151, 3.30765, -0.4496915, 0, 0, 0, 1, 1,
-1.048011, 0.1131992, -1.813297, 0, 0, 0, 1, 1,
-1.030777, -1.575715, -0.9103817, 0, 0, 0, 1, 1,
-1.025561, -0.8487614, -3.196724, 0, 0, 0, 1, 1,
-1.022646, 0.4180122, -1.990273, 0, 0, 0, 1, 1,
-1.015678, 0.7914318, -1.679282, 1, 1, 1, 1, 1,
-1.011243, 2.094249, -1.260843, 1, 1, 1, 1, 1,
-1.011059, -0.6085532, -1.432464, 1, 1, 1, 1, 1,
-1.010436, 0.9685561, 0.1120083, 1, 1, 1, 1, 1,
-1.000186, 0.5285066, 0.08247462, 1, 1, 1, 1, 1,
-0.9911295, -0.3742695, -2.948232, 1, 1, 1, 1, 1,
-0.9879383, 0.3648615, 0.4113484, 1, 1, 1, 1, 1,
-0.9848375, 0.8072766, -1.232259, 1, 1, 1, 1, 1,
-0.9814329, -1.074781, -2.465108, 1, 1, 1, 1, 1,
-0.9809905, 0.7969679, 0.8191336, 1, 1, 1, 1, 1,
-0.9794329, -2.431545, -5.17179, 1, 1, 1, 1, 1,
-0.9746372, -1.469535, -4.232291, 1, 1, 1, 1, 1,
-0.9746264, 0.9187309, -2.347887, 1, 1, 1, 1, 1,
-0.9740534, 0.5762684, -0.6451157, 1, 1, 1, 1, 1,
-0.9661263, -0.9050055, -2.624443, 1, 1, 1, 1, 1,
-0.9653494, 0.7554049, -0.2291681, 0, 0, 1, 1, 1,
-0.9646669, -1.280457, -2.876001, 1, 0, 0, 1, 1,
-0.9543071, -0.2324919, -3.146364, 1, 0, 0, 1, 1,
-0.9523675, -1.284318, -2.977883, 1, 0, 0, 1, 1,
-0.9510033, 1.685931, -1.123097, 1, 0, 0, 1, 1,
-0.9479169, 0.4116636, -1.214595, 1, 0, 0, 1, 1,
-0.9471866, -0.5792869, -1.481063, 0, 0, 0, 1, 1,
-0.9436224, 0.3722189, -0.134986, 0, 0, 0, 1, 1,
-0.9430047, 1.157005, -0.0266551, 0, 0, 0, 1, 1,
-0.9421675, 0.6187969, -0.7157072, 0, 0, 0, 1, 1,
-0.9399159, -0.5175354, -2.588174, 0, 0, 0, 1, 1,
-0.9330292, -0.1398318, -1.623889, 0, 0, 0, 1, 1,
-0.9286208, -0.00608804, -0.9577061, 0, 0, 0, 1, 1,
-0.9273918, -0.2129361, -0.5577165, 1, 1, 1, 1, 1,
-0.9268776, 0.311694, -1.661642, 1, 1, 1, 1, 1,
-0.9258346, 1.614877, 0.1848716, 1, 1, 1, 1, 1,
-0.9189163, 1.385805, 0.1608755, 1, 1, 1, 1, 1,
-0.9152869, 0.4045946, -1.827829, 1, 1, 1, 1, 1,
-0.9072796, 0.1852579, -1.667772, 1, 1, 1, 1, 1,
-0.9063712, 0.5926216, -1.47832, 1, 1, 1, 1, 1,
-0.9058703, 0.1486944, -0.797309, 1, 1, 1, 1, 1,
-0.9029939, 0.1627753, -0.4023882, 1, 1, 1, 1, 1,
-0.8949412, 1.401438, 1.94921, 1, 1, 1, 1, 1,
-0.8932393, -0.05785259, 0.6986099, 1, 1, 1, 1, 1,
-0.8899179, 1.215572, -1.538828, 1, 1, 1, 1, 1,
-0.8889618, -0.07595638, -1.415133, 1, 1, 1, 1, 1,
-0.8883752, 0.1259651, -1.506209, 1, 1, 1, 1, 1,
-0.8872048, -0.4567465, -0.6319779, 1, 1, 1, 1, 1,
-0.8854045, -0.7583515, -3.343739, 0, 0, 1, 1, 1,
-0.8841811, 0.1171125, -0.3157021, 1, 0, 0, 1, 1,
-0.8819163, 0.8682502, -1.245333, 1, 0, 0, 1, 1,
-0.8815087, 0.2729291, 0.4767129, 1, 0, 0, 1, 1,
-0.8813602, 1.133425, -1.493593, 1, 0, 0, 1, 1,
-0.8807729, 0.3716006, -1.931064, 1, 0, 0, 1, 1,
-0.8807083, 0.6618367, -1.718479, 0, 0, 0, 1, 1,
-0.87885, 2.030114, 1.566877, 0, 0, 0, 1, 1,
-0.8715185, -0.1954037, -1.488252, 0, 0, 0, 1, 1,
-0.8629446, -1.579914, -2.925488, 0, 0, 0, 1, 1,
-0.8621794, 0.5516741, -1.839778, 0, 0, 0, 1, 1,
-0.8618014, -0.5258349, -0.7483296, 0, 0, 0, 1, 1,
-0.86165, -1.17608, -2.836936, 0, 0, 0, 1, 1,
-0.847389, 0.4075143, -0.8194991, 1, 1, 1, 1, 1,
-0.8447587, -1.321011, -2.351238, 1, 1, 1, 1, 1,
-0.8446991, 0.04736762, -1.05572, 1, 1, 1, 1, 1,
-0.8422595, 2.552016, 0.2048382, 1, 1, 1, 1, 1,
-0.8409213, -0.9240065, -2.088624, 1, 1, 1, 1, 1,
-0.8399598, 1.105044, -0.9982493, 1, 1, 1, 1, 1,
-0.8325349, 1.63603, -1.54026, 1, 1, 1, 1, 1,
-0.8310193, 0.763132, -2.493337, 1, 1, 1, 1, 1,
-0.8291505, -0.1138911, -0.2308504, 1, 1, 1, 1, 1,
-0.8275778, 1.272579, -0.4723445, 1, 1, 1, 1, 1,
-0.8248039, -0.714158, -2.204845, 1, 1, 1, 1, 1,
-0.8213271, -0.2031651, -2.083803, 1, 1, 1, 1, 1,
-0.8196843, 0.7054307, -3.118797, 1, 1, 1, 1, 1,
-0.8195911, 0.568342, -1.068983, 1, 1, 1, 1, 1,
-0.8186377, 1.383969, 0.03538527, 1, 1, 1, 1, 1,
-0.8182481, -1.970165, -2.068886, 0, 0, 1, 1, 1,
-0.8046116, -1.141884, -1.88016, 1, 0, 0, 1, 1,
-0.7939009, 0.2921941, -0.4735549, 1, 0, 0, 1, 1,
-0.7923305, -1.233975, -3.05238, 1, 0, 0, 1, 1,
-0.7882084, -1.296709, -0.5913157, 1, 0, 0, 1, 1,
-0.7877059, 1.262069, -0.3503977, 1, 0, 0, 1, 1,
-0.7864066, -0.9289642, -2.222294, 0, 0, 0, 1, 1,
-0.7701185, -0.7082802, -0.949902, 0, 0, 0, 1, 1,
-0.7683162, -0.856089, -1.98202, 0, 0, 0, 1, 1,
-0.7614288, -1.037097, -2.613636, 0, 0, 0, 1, 1,
-0.7555287, 2.08506, 0.6557271, 0, 0, 0, 1, 1,
-0.7550411, 1.496139, -1.14674, 0, 0, 0, 1, 1,
-0.7539951, -0.07530157, -2.719296, 0, 0, 0, 1, 1,
-0.7527249, -0.4301947, -2.493239, 1, 1, 1, 1, 1,
-0.7507643, 0.2830637, -0.05196992, 1, 1, 1, 1, 1,
-0.7480953, -1.053227, -2.497708, 1, 1, 1, 1, 1,
-0.7439886, 0.7550372, 0.1225611, 1, 1, 1, 1, 1,
-0.7439349, 0.1028757, -1.558012, 1, 1, 1, 1, 1,
-0.7435894, 1.908896, 0.7624487, 1, 1, 1, 1, 1,
-0.7371567, -0.1715984, -2.727114, 1, 1, 1, 1, 1,
-0.7355263, -0.4421202, -1.636037, 1, 1, 1, 1, 1,
-0.7330017, -0.3025056, -1.98506, 1, 1, 1, 1, 1,
-0.7308825, 0.9747035, 0.1695829, 1, 1, 1, 1, 1,
-0.7209885, 1.204636, -1.43785, 1, 1, 1, 1, 1,
-0.7179809, -1.528275, -2.609189, 1, 1, 1, 1, 1,
-0.7149155, 0.6062213, -1.057943, 1, 1, 1, 1, 1,
-0.7148709, -0.3248303, -0.8775656, 1, 1, 1, 1, 1,
-0.7140163, 0.7137259, -2.379208, 1, 1, 1, 1, 1,
-0.6993452, 0.1078913, -0.4648312, 0, 0, 1, 1, 1,
-0.6984337, 0.2778723, -0.7283829, 1, 0, 0, 1, 1,
-0.6977919, -0.480801, -2.431466, 1, 0, 0, 1, 1,
-0.6961941, -0.7488382, -1.841395, 1, 0, 0, 1, 1,
-0.6940942, 0.306138, -0.01218963, 1, 0, 0, 1, 1,
-0.6887603, 0.2902628, 0.003604622, 1, 0, 0, 1, 1,
-0.6816327, 0.2264839, -0.05644523, 0, 0, 0, 1, 1,
-0.6811414, -1.684334, -3.723417, 0, 0, 0, 1, 1,
-0.6804007, 0.063111, -0.4085892, 0, 0, 0, 1, 1,
-0.6776156, -0.3033046, -2.889943, 0, 0, 0, 1, 1,
-0.6747693, -0.3244568, -2.931976, 0, 0, 0, 1, 1,
-0.6738161, -2.059439, -3.755894, 0, 0, 0, 1, 1,
-0.6679941, -0.4736643, -1.944717, 0, 0, 0, 1, 1,
-0.6625834, -0.0864784, -2.180375, 1, 1, 1, 1, 1,
-0.6576558, 1.027411, -2.609152, 1, 1, 1, 1, 1,
-0.6549836, -0.3439785, -1.129286, 1, 1, 1, 1, 1,
-0.6495861, -0.1480859, -2.795092, 1, 1, 1, 1, 1,
-0.6495358, 0.7707011, -1.63879, 1, 1, 1, 1, 1,
-0.6451817, -0.4059768, -2.585687, 1, 1, 1, 1, 1,
-0.6427137, 1.280784, -1.097119, 1, 1, 1, 1, 1,
-0.6415302, -0.5607667, 0.3099861, 1, 1, 1, 1, 1,
-0.6373891, 0.3148789, -0.9232324, 1, 1, 1, 1, 1,
-0.6353002, 0.3769721, -1.528553, 1, 1, 1, 1, 1,
-0.6341948, 0.6857862, -1.690438, 1, 1, 1, 1, 1,
-0.628772, 0.6094276, 0.2549758, 1, 1, 1, 1, 1,
-0.6215529, 0.1907825, -2.139366, 1, 1, 1, 1, 1,
-0.6179413, -0.7616791, -2.425603, 1, 1, 1, 1, 1,
-0.614176, -0.3462858, -2.310819, 1, 1, 1, 1, 1,
-0.6141061, -0.3760837, -2.482431, 0, 0, 1, 1, 1,
-0.6054949, 1.007284, -0.7128559, 1, 0, 0, 1, 1,
-0.5935791, -1.68951, -2.079558, 1, 0, 0, 1, 1,
-0.5885372, 0.8095689, 0.3224329, 1, 0, 0, 1, 1,
-0.5846954, -0.2065484, -3.896254, 1, 0, 0, 1, 1,
-0.5695277, -0.320793, -2.313163, 1, 0, 0, 1, 1,
-0.5687464, -1.33855, -2.79894, 0, 0, 0, 1, 1,
-0.5672209, -0.3338607, -0.1080568, 0, 0, 0, 1, 1,
-0.5670784, 0.1952838, -0.6978666, 0, 0, 0, 1, 1,
-0.5653707, 1.149284, -0.1142106, 0, 0, 0, 1, 1,
-0.5642731, -0.3415312, -3.485465, 0, 0, 0, 1, 1,
-0.5635874, 0.3810944, -1.112422, 0, 0, 0, 1, 1,
-0.5627906, 0.1014225, -1.663434, 0, 0, 0, 1, 1,
-0.5599405, 0.7647432, 0.1185685, 1, 1, 1, 1, 1,
-0.5592354, 0.8405653, 1.869391, 1, 1, 1, 1, 1,
-0.5575065, 0.7262394, -0.6314322, 1, 1, 1, 1, 1,
-0.5550427, -0.8573235, -2.76009, 1, 1, 1, 1, 1,
-0.5514493, 2.424255, -0.8540815, 1, 1, 1, 1, 1,
-0.5496546, -0.4486424, -2.358622, 1, 1, 1, 1, 1,
-0.5494375, 0.7039058, 0.007968162, 1, 1, 1, 1, 1,
-0.5487021, -0.09851427, -1.157833, 1, 1, 1, 1, 1,
-0.5468667, 1.780213, -0.1088742, 1, 1, 1, 1, 1,
-0.5457439, 0.3165077, -1.247294, 1, 1, 1, 1, 1,
-0.5430393, 1.646192, -1.007211, 1, 1, 1, 1, 1,
-0.5423188, 0.3907535, -1.109539, 1, 1, 1, 1, 1,
-0.5392052, 1.852368, -0.9153292, 1, 1, 1, 1, 1,
-0.5377438, -0.508072, -2.116053, 1, 1, 1, 1, 1,
-0.5270586, -0.7591235, -0.9180273, 1, 1, 1, 1, 1,
-0.5264261, 1.126216, -0.2125627, 0, 0, 1, 1, 1,
-0.5254043, -1.203165, -1.743242, 1, 0, 0, 1, 1,
-0.5249923, -0.1008719, -1.986115, 1, 0, 0, 1, 1,
-0.5235094, -0.5214037, -0.2087801, 1, 0, 0, 1, 1,
-0.5223514, -1.096144, -2.680267, 1, 0, 0, 1, 1,
-0.5221993, -1.459576, -3.839211, 1, 0, 0, 1, 1,
-0.5169994, 1.342631, 1.128418, 0, 0, 0, 1, 1,
-0.5100536, -0.7056802, -0.8518379, 0, 0, 0, 1, 1,
-0.5090272, -1.110747, -1.061078, 0, 0, 0, 1, 1,
-0.5025262, 0.8436885, -1.082196, 0, 0, 0, 1, 1,
-0.5022658, 0.01859038, -1.940886, 0, 0, 0, 1, 1,
-0.4998962, -1.535711, -3.759984, 0, 0, 0, 1, 1,
-0.4991669, 0.2177285, 0.1136469, 0, 0, 0, 1, 1,
-0.4983341, 0.2308584, -1.137921, 1, 1, 1, 1, 1,
-0.4967494, 1.136043, -2.447647, 1, 1, 1, 1, 1,
-0.4960581, 0.4873379, -2.10633, 1, 1, 1, 1, 1,
-0.4954834, -1.148261, -2.265544, 1, 1, 1, 1, 1,
-0.495349, 0.2930606, -0.8681748, 1, 1, 1, 1, 1,
-0.492038, -0.6925301, -2.622366, 1, 1, 1, 1, 1,
-0.4822879, -0.3325119, -2.068638, 1, 1, 1, 1, 1,
-0.4817096, -0.06027015, -1.305327, 1, 1, 1, 1, 1,
-0.4759618, 1.620842, -1.786649, 1, 1, 1, 1, 1,
-0.4748825, -0.4648715, -1.853409, 1, 1, 1, 1, 1,
-0.4746849, 0.7786591, -1.454457, 1, 1, 1, 1, 1,
-0.4727519, 1.263535, 0.682143, 1, 1, 1, 1, 1,
-0.472272, 2.70647, -1.593192, 1, 1, 1, 1, 1,
-0.4711619, 0.1339265, -0.1699594, 1, 1, 1, 1, 1,
-0.4690459, 0.6459513, -1.104586, 1, 1, 1, 1, 1,
-0.4688505, -0.9864761, -3.466385, 0, 0, 1, 1, 1,
-0.4649219, 2.007767, 1.018136, 1, 0, 0, 1, 1,
-0.4594101, -1.279521, -3.234833, 1, 0, 0, 1, 1,
-0.4586533, 0.3184614, -1.516281, 1, 0, 0, 1, 1,
-0.4532712, 0.3449883, -1.094282, 1, 0, 0, 1, 1,
-0.4525373, -0.2134766, -3.291702, 1, 0, 0, 1, 1,
-0.4524086, -2.577155, -2.699423, 0, 0, 0, 1, 1,
-0.4509378, -0.8866236, -1.710811, 0, 0, 0, 1, 1,
-0.4494036, 0.01011086, -0.3673382, 0, 0, 0, 1, 1,
-0.4457303, 0.2957316, -0.8655616, 0, 0, 0, 1, 1,
-0.4434775, -1.394693, -2.413359, 0, 0, 0, 1, 1,
-0.4422495, -0.4336736, -2.30901, 0, 0, 0, 1, 1,
-0.4412891, 1.090379, 0.2528934, 0, 0, 0, 1, 1,
-0.4410033, -0.400764, -2.704253, 1, 1, 1, 1, 1,
-0.4401645, 1.879802, 0.4000171, 1, 1, 1, 1, 1,
-0.4393666, -1.012931, -3.200256, 1, 1, 1, 1, 1,
-0.4355337, 1.453326, 1.70139, 1, 1, 1, 1, 1,
-0.4292341, 1.357251, 0.5082718, 1, 1, 1, 1, 1,
-0.4290383, 1.145315, 0.08074299, 1, 1, 1, 1, 1,
-0.4273699, -0.08227266, -0.076846, 1, 1, 1, 1, 1,
-0.4266645, 0.528636, -0.1740173, 1, 1, 1, 1, 1,
-0.4260446, -0.1658599, -1.544387, 1, 1, 1, 1, 1,
-0.4216712, 0.01768684, -0.9764899, 1, 1, 1, 1, 1,
-0.4201413, -1.92405, -2.731103, 1, 1, 1, 1, 1,
-0.4185658, -0.7616913, -2.000739, 1, 1, 1, 1, 1,
-0.4153658, -1.342783, -2.145644, 1, 1, 1, 1, 1,
-0.4133309, 1.296324, -1.705327, 1, 1, 1, 1, 1,
-0.4088926, 0.7216322, -1.194024, 1, 1, 1, 1, 1,
-0.4053566, -0.4160777, -3.353844, 0, 0, 1, 1, 1,
-0.3941836, 0.7308532, -0.8403521, 1, 0, 0, 1, 1,
-0.3938337, -0.875341, -3.197648, 1, 0, 0, 1, 1,
-0.393498, -1.22055, -2.352301, 1, 0, 0, 1, 1,
-0.3927822, 0.4937549, -0.6954281, 1, 0, 0, 1, 1,
-0.3884958, 0.9903454, -0.127288, 1, 0, 0, 1, 1,
-0.3870552, 0.403515, -0.9614352, 0, 0, 0, 1, 1,
-0.3821603, -0.7209504, -1.8356, 0, 0, 0, 1, 1,
-0.3785973, 1.838778, 0.5797178, 0, 0, 0, 1, 1,
-0.3726651, 1.056405, 2.465307, 0, 0, 0, 1, 1,
-0.3718853, 0.1633501, 0.01477532, 0, 0, 0, 1, 1,
-0.3683748, 0.5705786, -0.4587829, 0, 0, 0, 1, 1,
-0.368332, 0.7898269, -0.8055357, 0, 0, 0, 1, 1,
-0.367066, -1.049047, -2.429274, 1, 1, 1, 1, 1,
-0.3662388, -1.204051, -3.864375, 1, 1, 1, 1, 1,
-0.3660384, 1.265162, -1.283979, 1, 1, 1, 1, 1,
-0.3660295, -0.09594475, -2.265673, 1, 1, 1, 1, 1,
-0.3641834, 1.093786, 0.6280921, 1, 1, 1, 1, 1,
-0.3562606, -0.6869009, -3.178879, 1, 1, 1, 1, 1,
-0.3558914, -0.2334448, -1.813986, 1, 1, 1, 1, 1,
-0.3555961, -0.3592572, -2.813147, 1, 1, 1, 1, 1,
-0.3467911, 1.01985, 0.1766854, 1, 1, 1, 1, 1,
-0.3398567, 0.3626091, -2.789558, 1, 1, 1, 1, 1,
-0.3374192, -0.08249857, -0.9250732, 1, 1, 1, 1, 1,
-0.3353131, -0.01951187, -1.622068, 1, 1, 1, 1, 1,
-0.3334601, 1.225441, -0.504829, 1, 1, 1, 1, 1,
-0.3297848, 0.3290955, -1.412199, 1, 1, 1, 1, 1,
-0.3230516, -0.02896544, -3.213741, 1, 1, 1, 1, 1,
-0.3225601, 1.222214, 0.9236535, 0, 0, 1, 1, 1,
-0.3174624, -0.6748837, -1.607453, 1, 0, 0, 1, 1,
-0.3150413, 0.2533676, -1.611723, 1, 0, 0, 1, 1,
-0.3148365, -0.7377017, -2.146477, 1, 0, 0, 1, 1,
-0.313781, 1.264192, 1.081723, 1, 0, 0, 1, 1,
-0.3134513, 0.7302335, 0.4178691, 1, 0, 0, 1, 1,
-0.3109959, -1.005245, -1.849777, 0, 0, 0, 1, 1,
-0.3081188, -1.217127, -1.968093, 0, 0, 0, 1, 1,
-0.2978039, 0.5237048, -0.6264307, 0, 0, 0, 1, 1,
-0.292942, -0.9148625, -3.00111, 0, 0, 0, 1, 1,
-0.2888855, 0.4214469, -0.4405769, 0, 0, 0, 1, 1,
-0.2865776, 0.1075632, -1.976925, 0, 0, 0, 1, 1,
-0.2854685, 0.6705988, 0.346045, 0, 0, 0, 1, 1,
-0.276484, -0.496725, -3.908419, 1, 1, 1, 1, 1,
-0.2686153, -0.2163918, -2.465363, 1, 1, 1, 1, 1,
-0.2611564, -1.489292, -3.832461, 1, 1, 1, 1, 1,
-0.2602263, -0.2197127, -2.989447, 1, 1, 1, 1, 1,
-0.2581497, -0.4780157, -2.711992, 1, 1, 1, 1, 1,
-0.2497509, 0.1043337, 1.671837, 1, 1, 1, 1, 1,
-0.2494927, -0.202671, -3.26706, 1, 1, 1, 1, 1,
-0.2483002, -0.7634975, -1.64706, 1, 1, 1, 1, 1,
-0.2464684, 1.13582, -1.275055, 1, 1, 1, 1, 1,
-0.2434186, 0.06131222, -0.3576284, 1, 1, 1, 1, 1,
-0.231127, -1.127369, -3.394213, 1, 1, 1, 1, 1,
-0.2265363, 2.195718, 1.25409, 1, 1, 1, 1, 1,
-0.2238398, 0.2044956, -1.326148, 1, 1, 1, 1, 1,
-0.2210253, 2.66597, 1.140498, 1, 1, 1, 1, 1,
-0.2201867, 2.651934, 1.530913, 1, 1, 1, 1, 1,
-0.2168744, -0.4388307, -3.488756, 0, 0, 1, 1, 1,
-0.2142689, -1.187997, -4.65735, 1, 0, 0, 1, 1,
-0.2060826, -1.410983, -3.562192, 1, 0, 0, 1, 1,
-0.2054933, 0.7499174, -0.04031482, 1, 0, 0, 1, 1,
-0.2042885, -0.5007806, -3.928293, 1, 0, 0, 1, 1,
-0.2016709, -0.6577176, -3.327866, 1, 0, 0, 1, 1,
-0.2012879, 1.675453, -1.262665, 0, 0, 0, 1, 1,
-0.1962886, 0.3692402, -0.8459901, 0, 0, 0, 1, 1,
-0.1907994, 0.3159927, -2.316916, 0, 0, 0, 1, 1,
-0.1855642, 0.5376459, -0.8328182, 0, 0, 0, 1, 1,
-0.1838483, 0.1517646, 0.1014445, 0, 0, 0, 1, 1,
-0.1706717, 1.206291, -2.050051, 0, 0, 0, 1, 1,
-0.167885, -1.109159, -4.078429, 0, 0, 0, 1, 1,
-0.1675308, 0.3086548, 1.264291, 1, 1, 1, 1, 1,
-0.1663886, 0.0294538, -1.571888, 1, 1, 1, 1, 1,
-0.1634403, -0.3146194, -3.727, 1, 1, 1, 1, 1,
-0.1603877, -0.3570261, -1.222807, 1, 1, 1, 1, 1,
-0.1590962, 0.9226403, -0.1765388, 1, 1, 1, 1, 1,
-0.1572894, -0.8890976, -2.952936, 1, 1, 1, 1, 1,
-0.1570753, -0.5933375, -3.360029, 1, 1, 1, 1, 1,
-0.1550702, 1.205786, 0.04736844, 1, 1, 1, 1, 1,
-0.1468267, -0.5116962, -4.688782, 1, 1, 1, 1, 1,
-0.1453039, 1.409182, 0.1114407, 1, 1, 1, 1, 1,
-0.1445903, -0.07159649, -1.932898, 1, 1, 1, 1, 1,
-0.1444917, -0.2328857, -2.991005, 1, 1, 1, 1, 1,
-0.1433336, 2.926025, -0.1170491, 1, 1, 1, 1, 1,
-0.1424463, -0.6686718, -3.782729, 1, 1, 1, 1, 1,
-0.1391441, -2.037428, -3.121649, 1, 1, 1, 1, 1,
-0.1354652, 0.6772878, 0.5846835, 0, 0, 1, 1, 1,
-0.1327519, 1.425246, 0.6684915, 1, 0, 0, 1, 1,
-0.1302348, 1.172885, -0.2330449, 1, 0, 0, 1, 1,
-0.1293341, -0.9755916, -2.561475, 1, 0, 0, 1, 1,
-0.1205137, -0.7218388, -2.021916, 1, 0, 0, 1, 1,
-0.1197114, -0.6713517, -3.73351, 1, 0, 0, 1, 1,
-0.1191933, 1.489281, -0.4857536, 0, 0, 0, 1, 1,
-0.1181452, 1.661796, -0.2325742, 0, 0, 0, 1, 1,
-0.1163455, 2.211125, -0.08846583, 0, 0, 0, 1, 1,
-0.115409, -0.7020251, -2.719115, 0, 0, 0, 1, 1,
-0.1144149, -0.7251947, -2.443111, 0, 0, 0, 1, 1,
-0.1089152, 0.6953115, -0.8933133, 0, 0, 0, 1, 1,
-0.1082728, -1.824134, -3.555044, 0, 0, 0, 1, 1,
-0.107207, -0.590643, -3.317701, 1, 1, 1, 1, 1,
-0.1059455, 1.482721, -1.136971, 1, 1, 1, 1, 1,
-0.1046961, -0.4972331, -3.464466, 1, 1, 1, 1, 1,
-0.1035905, -0.8002787, -3.388426, 1, 1, 1, 1, 1,
-0.1026959, 0.3735617, 0.4405289, 1, 1, 1, 1, 1,
-0.09337836, 0.5002794, -0.9619961, 1, 1, 1, 1, 1,
-0.08541641, 0.9118687, 0.1872688, 1, 1, 1, 1, 1,
-0.085378, 1.481758, -1.020938, 1, 1, 1, 1, 1,
-0.08165715, 0.7987756, -0.2311519, 1, 1, 1, 1, 1,
-0.08103302, -1.063456, -1.643705, 1, 1, 1, 1, 1,
-0.07996178, -0.8489025, -3.633811, 1, 1, 1, 1, 1,
-0.07836427, -1.991641, -1.896495, 1, 1, 1, 1, 1,
-0.07817972, -0.5427467, -3.253213, 1, 1, 1, 1, 1,
-0.07734968, 0.8907236, -1.296647, 1, 1, 1, 1, 1,
-0.07365391, 0.8868765, 0.421312, 1, 1, 1, 1, 1,
-0.07045151, 0.003263971, -0.3629516, 0, 0, 1, 1, 1,
-0.06834133, 0.9420015, 1.252579, 1, 0, 0, 1, 1,
-0.06826729, 0.7544431, -0.7796894, 1, 0, 0, 1, 1,
-0.06102636, -0.73247, -2.355749, 1, 0, 0, 1, 1,
-0.06074253, -0.8020489, -4.543761, 1, 0, 0, 1, 1,
-0.05995847, 0.705238, 0.9626238, 1, 0, 0, 1, 1,
-0.05950375, -0.3930157, -3.676132, 0, 0, 0, 1, 1,
-0.05901477, -1.942483, -1.898669, 0, 0, 0, 1, 1,
-0.05591534, 0.7115327, 1.365689, 0, 0, 0, 1, 1,
-0.05584716, 1.680091, -0.7438183, 0, 0, 0, 1, 1,
-0.05430627, 0.260617, 1.554698, 0, 0, 0, 1, 1,
-0.05324646, -1.659328, -4.026588, 0, 0, 0, 1, 1,
-0.05006298, -0.703468, -5.086596, 0, 0, 0, 1, 1,
-0.04007693, -0.2750486, -3.195905, 1, 1, 1, 1, 1,
-0.03779715, 0.1151651, 1.483478, 1, 1, 1, 1, 1,
-0.03643132, -0.216273, -2.285266, 1, 1, 1, 1, 1,
-0.0267024, 0.5782974, -0.2211999, 1, 1, 1, 1, 1,
-0.0261992, 1.015402, -0.1879561, 1, 1, 1, 1, 1,
-0.02588266, 0.9856218, -0.3276426, 1, 1, 1, 1, 1,
-0.0246651, 0.424082, -1.249111, 1, 1, 1, 1, 1,
-0.023264, -1.131416, -2.343547, 1, 1, 1, 1, 1,
-0.02050279, -0.2518875, -2.375349, 1, 1, 1, 1, 1,
-0.01916375, 0.06657994, 0.4068255, 1, 1, 1, 1, 1,
-0.01530162, -0.3086331, -2.920682, 1, 1, 1, 1, 1,
-0.01336951, -1.22519, -3.824992, 1, 1, 1, 1, 1,
-0.01174782, 0.5135238, 0.3997846, 1, 1, 1, 1, 1,
-0.00362597, -0.05029137, -2.810076, 1, 1, 1, 1, 1,
-0.003552764, -0.3162523, -3.344454, 1, 1, 1, 1, 1,
-0.003506972, 0.6383811, 0.8461118, 0, 0, 1, 1, 1,
0.0009706927, 0.3813664, -0.3414958, 1, 0, 0, 1, 1,
0.001041601, -1.572108, 1.957375, 1, 0, 0, 1, 1,
0.007640074, 0.8644816, -0.822352, 1, 0, 0, 1, 1,
0.009454452, 0.0415039, -0.3202668, 1, 0, 0, 1, 1,
0.01171613, -0.7848226, 1.637352, 1, 0, 0, 1, 1,
0.02302963, 0.4097728, -0.7418088, 0, 0, 0, 1, 1,
0.02378118, 0.07065108, -0.1296362, 0, 0, 0, 1, 1,
0.0290569, -0.8353615, 2.723341, 0, 0, 0, 1, 1,
0.03135468, -0.2861642, 2.708605, 0, 0, 0, 1, 1,
0.03573646, -1.777397, 5.406084, 0, 0, 0, 1, 1,
0.03914337, 0.900121, -1.271529, 0, 0, 0, 1, 1,
0.04096063, 0.2336549, -2.396911, 0, 0, 0, 1, 1,
0.04212995, -0.8400388, 3.466193, 1, 1, 1, 1, 1,
0.04487948, -1.133812, 3.325338, 1, 1, 1, 1, 1,
0.04842023, -0.7077429, 4.254498, 1, 1, 1, 1, 1,
0.05475717, -0.3372508, 3.241209, 1, 1, 1, 1, 1,
0.05906853, -1.829776, 2.96332, 1, 1, 1, 1, 1,
0.05941952, -0.6634651, 2.619887, 1, 1, 1, 1, 1,
0.06573699, -0.7103252, 2.987071, 1, 1, 1, 1, 1,
0.06597053, 0.8585055, -0.1814567, 1, 1, 1, 1, 1,
0.06638546, 0.1756244, -1.380051, 1, 1, 1, 1, 1,
0.06686051, -2.807325, 3.629715, 1, 1, 1, 1, 1,
0.06715576, -0.7449851, 3.505957, 1, 1, 1, 1, 1,
0.0704729, -0.4884613, 1.929316, 1, 1, 1, 1, 1,
0.07261727, 1.84876, 0.282408, 1, 1, 1, 1, 1,
0.07397854, 0.2354477, 0.1994523, 1, 1, 1, 1, 1,
0.07487385, 1.106132, -1.098462, 1, 1, 1, 1, 1,
0.07498056, -1.250846, 1.992801, 0, 0, 1, 1, 1,
0.0750635, -0.009691553, 0.3309065, 1, 0, 0, 1, 1,
0.07553734, 1.014325, -1.080088, 1, 0, 0, 1, 1,
0.07899657, 0.1319708, 1.106088, 1, 0, 0, 1, 1,
0.0826971, -0.3796241, 3.562581, 1, 0, 0, 1, 1,
0.08597609, -0.4861875, 1.683412, 1, 0, 0, 1, 1,
0.09093804, -1.13617, 2.199341, 0, 0, 0, 1, 1,
0.09455689, 0.1020674, -1.509728, 0, 0, 0, 1, 1,
0.09677634, 1.156412, 0.7527393, 0, 0, 0, 1, 1,
0.1001399, -1.872257, 3.429358, 0, 0, 0, 1, 1,
0.1010916, 0.118533, 1.552995, 0, 0, 0, 1, 1,
0.1072482, -0.06373588, 3.509895, 0, 0, 0, 1, 1,
0.1073927, -0.8109405, 3.45208, 0, 0, 0, 1, 1,
0.1079693, -1.130636, 3.638213, 1, 1, 1, 1, 1,
0.1109027, -0.2164201, 2.545204, 1, 1, 1, 1, 1,
0.1159017, 0.6336854, -0.4232691, 1, 1, 1, 1, 1,
0.1181907, 0.9793512, 1.205767, 1, 1, 1, 1, 1,
0.1185454, 0.0991414, 2.929276, 1, 1, 1, 1, 1,
0.1196867, 0.1891691, 0.5449473, 1, 1, 1, 1, 1,
0.1201227, -0.6372091, 0.3790204, 1, 1, 1, 1, 1,
0.1248666, -1.025757, 1.782541, 1, 1, 1, 1, 1,
0.1308068, -0.6236817, 3.390851, 1, 1, 1, 1, 1,
0.1317491, 0.01483331, 2.367258, 1, 1, 1, 1, 1,
0.136431, -0.9108518, 1.591688, 1, 1, 1, 1, 1,
0.1371117, 2.153232, 0.3564015, 1, 1, 1, 1, 1,
0.1379638, 0.4186537, 0.1972219, 1, 1, 1, 1, 1,
0.1401372, -0.3800997, 1.486139, 1, 1, 1, 1, 1,
0.1486632, -0.5143441, 2.205129, 1, 1, 1, 1, 1,
0.1491408, -0.8265476, 5.622229, 0, 0, 1, 1, 1,
0.1492602, -0.5140025, 2.762932, 1, 0, 0, 1, 1,
0.1492609, -1.918654, 3.399699, 1, 0, 0, 1, 1,
0.1493864, 0.1324827, 0.4758425, 1, 0, 0, 1, 1,
0.1502641, 0.1438432, 2.175679, 1, 0, 0, 1, 1,
0.1511496, -1.222931, 3.774574, 1, 0, 0, 1, 1,
0.1515805, 1.491875, 0.9480813, 0, 0, 0, 1, 1,
0.160897, 1.248177, 1.157351, 0, 0, 0, 1, 1,
0.1629251, 0.4913529, 0.5926993, 0, 0, 0, 1, 1,
0.1631364, -0.2985522, 3.26456, 0, 0, 0, 1, 1,
0.1656736, -0.2049644, 2.65214, 0, 0, 0, 1, 1,
0.1674128, 0.08094425, 0.2835929, 0, 0, 0, 1, 1,
0.1687599, 1.138557, 0.6077715, 0, 0, 0, 1, 1,
0.1725134, -0.7110264, 3.039982, 1, 1, 1, 1, 1,
0.1727033, -0.7888979, 1.706384, 1, 1, 1, 1, 1,
0.1742833, 0.2672266, 0.05242286, 1, 1, 1, 1, 1,
0.1750414, 0.3588086, 0.04870739, 1, 1, 1, 1, 1,
0.1761845, -1.05345, 3.538077, 1, 1, 1, 1, 1,
0.1818942, 0.7588607, 0.06921796, 1, 1, 1, 1, 1,
0.1823204, -0.4976484, 0.564257, 1, 1, 1, 1, 1,
0.1857558, 0.6221403, -1.423439, 1, 1, 1, 1, 1,
0.1914225, 0.1786091, 1.068656, 1, 1, 1, 1, 1,
0.1928743, 2.152205, 0.2359885, 1, 1, 1, 1, 1,
0.1955182, 1.174723, -0.06757473, 1, 1, 1, 1, 1,
0.1980173, 0.637104, 1.33506, 1, 1, 1, 1, 1,
0.1981609, -1.288179, 3.073917, 1, 1, 1, 1, 1,
0.1997894, 1.013211, 0.1062163, 1, 1, 1, 1, 1,
0.2015761, 0.4651549, 1.331068, 1, 1, 1, 1, 1,
0.2044647, 0.5756419, -0.6225477, 0, 0, 1, 1, 1,
0.2050061, -1.185902, 2.378978, 1, 0, 0, 1, 1,
0.2070468, -1.662917, 2.203796, 1, 0, 0, 1, 1,
0.209813, 0.5814003, 1.439136, 1, 0, 0, 1, 1,
0.2105565, 1.494589, 1.860036, 1, 0, 0, 1, 1,
0.2110868, -0.3911468, 2.200112, 1, 0, 0, 1, 1,
0.2114776, 0.3993059, 2.182372, 0, 0, 0, 1, 1,
0.2156291, -1.327003, 2.799469, 0, 0, 0, 1, 1,
0.2190585, 1.732807, 0.8439669, 0, 0, 0, 1, 1,
0.2229831, -0.742621, 2.364205, 0, 0, 0, 1, 1,
0.2283364, -0.4380708, 2.132797, 0, 0, 0, 1, 1,
0.2287465, 0.3248433, 1.427667, 0, 0, 0, 1, 1,
0.2311323, -1.172995, 4.385981, 0, 0, 0, 1, 1,
0.233284, -0.5014543, 3.628463, 1, 1, 1, 1, 1,
0.2341473, -0.7844825, 3.370458, 1, 1, 1, 1, 1,
0.2355251, -0.07750011, 1.549996, 1, 1, 1, 1, 1,
0.2392774, 1.245231, -2.128712, 1, 1, 1, 1, 1,
0.2392943, -0.3790168, 2.320711, 1, 1, 1, 1, 1,
0.240766, 0.5280899, 0.4649051, 1, 1, 1, 1, 1,
0.2412097, -0.5532307, 3.115376, 1, 1, 1, 1, 1,
0.24417, 2.391551, -0.6307599, 1, 1, 1, 1, 1,
0.2449984, -0.2538199, 2.986929, 1, 1, 1, 1, 1,
0.2467067, -0.7456051, 1.503476, 1, 1, 1, 1, 1,
0.246943, -0.7107041, 3.363889, 1, 1, 1, 1, 1,
0.2474793, 0.9579902, -0.5336411, 1, 1, 1, 1, 1,
0.2487283, 1.390826, 0.2849868, 1, 1, 1, 1, 1,
0.2489304, -0.1423576, 0.3720205, 1, 1, 1, 1, 1,
0.2552714, -0.0138583, 3.914178, 1, 1, 1, 1, 1,
0.2582531, 1.265697, -0.0740708, 0, 0, 1, 1, 1,
0.2600279, 0.4752277, -0.1923522, 1, 0, 0, 1, 1,
0.2600543, -0.7860797, 3.463729, 1, 0, 0, 1, 1,
0.260084, -0.5850746, 2.12955, 1, 0, 0, 1, 1,
0.2606737, -0.2415997, 3.168054, 1, 0, 0, 1, 1,
0.2632321, -0.09526093, 1.709736, 1, 0, 0, 1, 1,
0.2657142, 1.873427, -0.5927967, 0, 0, 0, 1, 1,
0.2668338, 0.5438598, -0.1700838, 0, 0, 0, 1, 1,
0.2690905, 0.7444905, 0.5659238, 0, 0, 0, 1, 1,
0.270456, 0.5643479, 0.7893938, 0, 0, 0, 1, 1,
0.271577, 1.424121, 0.4744333, 0, 0, 0, 1, 1,
0.2722719, -0.9672085, 2.201365, 0, 0, 0, 1, 1,
0.274812, -0.901615, 3.762733, 0, 0, 0, 1, 1,
0.2842006, -0.3149783, 3.278222, 1, 1, 1, 1, 1,
0.2849875, 1.401474, -0.9783084, 1, 1, 1, 1, 1,
0.2852491, 0.2473013, 0.4307205, 1, 1, 1, 1, 1,
0.2893772, 0.4456789, -0.6957398, 1, 1, 1, 1, 1,
0.2936775, 0.766345, -0.7015939, 1, 1, 1, 1, 1,
0.2944055, 0.0271838, 1.858436, 1, 1, 1, 1, 1,
0.2947286, 1.744002, -0.1952523, 1, 1, 1, 1, 1,
0.2947578, -0.2500923, 4.389863, 1, 1, 1, 1, 1,
0.2959445, -0.454872, 1.673142, 1, 1, 1, 1, 1,
0.2986987, 0.4138712, -0.6638522, 1, 1, 1, 1, 1,
0.3046404, 0.1231435, 2.205663, 1, 1, 1, 1, 1,
0.3083384, -0.6354331, 1.731487, 1, 1, 1, 1, 1,
0.3086576, -0.09003563, 1.626651, 1, 1, 1, 1, 1,
0.3113758, 2.013165, -0.7375931, 1, 1, 1, 1, 1,
0.3127514, 0.8834373, 1.728013, 1, 1, 1, 1, 1,
0.3176733, -1.347198, 1.716194, 0, 0, 1, 1, 1,
0.320641, -0.3501896, 3.82217, 1, 0, 0, 1, 1,
0.3293584, 0.8241582, 0.280253, 1, 0, 0, 1, 1,
0.3302011, 1.644785, 2.074959, 1, 0, 0, 1, 1,
0.3321332, -0.596986, 1.167314, 1, 0, 0, 1, 1,
0.3324512, 2.961236, -0.3245397, 1, 0, 0, 1, 1,
0.3332649, -1.141856, 1.775235, 0, 0, 0, 1, 1,
0.3344715, 1.471606, 0.3278147, 0, 0, 0, 1, 1,
0.3352402, -0.6089857, 2.663245, 0, 0, 0, 1, 1,
0.3355403, -0.04842873, 2.593773, 0, 0, 0, 1, 1,
0.3356711, 1.374305, -1.62264, 0, 0, 0, 1, 1,
0.3398885, -0.2172401, 2.053186, 0, 0, 0, 1, 1,
0.3416322, -0.1555697, 0.677646, 0, 0, 0, 1, 1,
0.3426322, -1.062227, 2.337154, 1, 1, 1, 1, 1,
0.3434616, -0.01962205, 3.017478, 1, 1, 1, 1, 1,
0.344485, 0.9102882, -0.2098035, 1, 1, 1, 1, 1,
0.3449483, -0.8484033, 1.520984, 1, 1, 1, 1, 1,
0.3452205, 0.04261749, 0.8708842, 1, 1, 1, 1, 1,
0.3480186, 0.3698312, -0.9566615, 1, 1, 1, 1, 1,
0.3525328, -0.7226744, 3.055611, 1, 1, 1, 1, 1,
0.3532918, 1.013242, 1.453297, 1, 1, 1, 1, 1,
0.3553478, -0.7761651, 2.125496, 1, 1, 1, 1, 1,
0.355644, -1.208567, 3.28438, 1, 1, 1, 1, 1,
0.3559615, 0.725088, 1.221934, 1, 1, 1, 1, 1,
0.3561286, 0.02144328, 3.265851, 1, 1, 1, 1, 1,
0.3584992, -1.437361, 3.92048, 1, 1, 1, 1, 1,
0.3601604, 0.8403047, 0.2077717, 1, 1, 1, 1, 1,
0.3617528, -0.5353007, 4.118034, 1, 1, 1, 1, 1,
0.3676487, -0.3771824, 1.116446, 0, 0, 1, 1, 1,
0.3755444, 0.8028944, 2.133809, 1, 0, 0, 1, 1,
0.38864, 1.521171, -0.5256638, 1, 0, 0, 1, 1,
0.3887431, 0.751202, -0.2438222, 1, 0, 0, 1, 1,
0.3890531, 0.2551431, 2.554488, 1, 0, 0, 1, 1,
0.3934251, -0.9984601, 1.817996, 1, 0, 0, 1, 1,
0.3961515, -0.003527154, 2.085171, 0, 0, 0, 1, 1,
0.3982327, 0.3490243, 0.4460576, 0, 0, 0, 1, 1,
0.4003632, -1.183073, 4.444061, 0, 0, 0, 1, 1,
0.400783, -0.5508529, 3.692385, 0, 0, 0, 1, 1,
0.4055656, 0.963904, -0.03596855, 0, 0, 0, 1, 1,
0.4071527, -0.4333869, 1.962765, 0, 0, 0, 1, 1,
0.4078405, 1.68716, 0.8199324, 0, 0, 0, 1, 1,
0.4098612, 0.545698, 2.633919, 1, 1, 1, 1, 1,
0.4113038, 0.7760866, 0.686479, 1, 1, 1, 1, 1,
0.4122983, 0.3547473, 0.2749871, 1, 1, 1, 1, 1,
0.4127625, -0.2110909, 1.462309, 1, 1, 1, 1, 1,
0.4161308, -1.361757, 5.348173, 1, 1, 1, 1, 1,
0.4211455, -0.9795434, 1.983959, 1, 1, 1, 1, 1,
0.4239239, -0.2136794, 1.499896, 1, 1, 1, 1, 1,
0.4310627, -0.4398494, 3.361826, 1, 1, 1, 1, 1,
0.4361205, -0.3228004, 1.406746, 1, 1, 1, 1, 1,
0.4431251, 2.340868, 1.315045, 1, 1, 1, 1, 1,
0.4436886, -0.4392985, 3.842556, 1, 1, 1, 1, 1,
0.4448384, -0.6556883, 0.5098735, 1, 1, 1, 1, 1,
0.4518561, 0.6570934, 1.578456, 1, 1, 1, 1, 1,
0.4561613, 0.4647299, 1.500303, 1, 1, 1, 1, 1,
0.4591732, -0.04869517, 0.7446123, 1, 1, 1, 1, 1,
0.4624391, 0.5558426, 0.3358855, 0, 0, 1, 1, 1,
0.4625249, -2.463782, 3.312352, 1, 0, 0, 1, 1,
0.4655277, -0.09588397, 0.3538372, 1, 0, 0, 1, 1,
0.467184, 0.1540522, 1.332181, 1, 0, 0, 1, 1,
0.4700849, 0.2896045, 0.05625224, 1, 0, 0, 1, 1,
0.4731643, -1.175061, 1.721761, 1, 0, 0, 1, 1,
0.4773905, -0.9185807, 1.411318, 0, 0, 0, 1, 1,
0.4775117, 1.371171, 1.45077, 0, 0, 0, 1, 1,
0.479343, 0.07994391, 1.066209, 0, 0, 0, 1, 1,
0.4799116, -1.274222, 3.353166, 0, 0, 0, 1, 1,
0.4804448, -0.7084356, 2.399382, 0, 0, 0, 1, 1,
0.4856495, 1.990531, 0.5080249, 0, 0, 0, 1, 1,
0.5013185, -0.4627707, 2.366621, 0, 0, 0, 1, 1,
0.5119513, 0.007546074, 1.475838, 1, 1, 1, 1, 1,
0.5119925, -0.3626657, 3.358501, 1, 1, 1, 1, 1,
0.5121956, -0.4899808, 1.999951, 1, 1, 1, 1, 1,
0.5142669, 1.94323, 1.01866, 1, 1, 1, 1, 1,
0.5178119, -0.05681819, 2.249817, 1, 1, 1, 1, 1,
0.5190872, 0.4611917, 1.208418, 1, 1, 1, 1, 1,
0.5200199, -0.693203, 2.96678, 1, 1, 1, 1, 1,
0.5247167, -1.126218, 4.631942, 1, 1, 1, 1, 1,
0.5258496, -0.6025437, 2.314557, 1, 1, 1, 1, 1,
0.5262313, -0.006991756, 1.520154, 1, 1, 1, 1, 1,
0.5266327, -0.5431613, 1.566172, 1, 1, 1, 1, 1,
0.5268561, -0.8816876, 1.579012, 1, 1, 1, 1, 1,
0.5284759, -1.095219, 2.489327, 1, 1, 1, 1, 1,
0.5315726, 0.09075942, 3.478042, 1, 1, 1, 1, 1,
0.532745, -0.404668, 0.4842004, 1, 1, 1, 1, 1,
0.5359191, 0.04239818, 0.216666, 0, 0, 1, 1, 1,
0.5396106, -0.808419, 4.787845, 1, 0, 0, 1, 1,
0.5396867, -1.802956, 3.81467, 1, 0, 0, 1, 1,
0.5451493, -1.031907, 3.477978, 1, 0, 0, 1, 1,
0.5460964, -0.7536058, 0.8207037, 1, 0, 0, 1, 1,
0.5541677, -1.642459, 2.412758, 1, 0, 0, 1, 1,
0.5556952, 0.09637595, 3.330098, 0, 0, 0, 1, 1,
0.5590039, 0.2603915, 1.273804, 0, 0, 0, 1, 1,
0.5649067, 1.680954, -0.1008035, 0, 0, 0, 1, 1,
0.5675755, -0.6106023, 0.9101862, 0, 0, 0, 1, 1,
0.568782, -1.103836, 1.997962, 0, 0, 0, 1, 1,
0.5723192, 1.539807, 1.980806, 0, 0, 0, 1, 1,
0.5747184, 0.5885772, 0.03973833, 0, 0, 0, 1, 1,
0.5753829, -1.126739, 2.283011, 1, 1, 1, 1, 1,
0.5791799, -0.08564399, 1.061588, 1, 1, 1, 1, 1,
0.5801755, -0.2695649, 1.8507, 1, 1, 1, 1, 1,
0.5843913, -2.035969, 0.6426781, 1, 1, 1, 1, 1,
0.5887254, -0.3124084, 2.057842, 1, 1, 1, 1, 1,
0.5899085, -0.5214775, 2.302304, 1, 1, 1, 1, 1,
0.5901489, -0.0385349, 3.098509, 1, 1, 1, 1, 1,
0.590269, 0.8195528, 0.6837597, 1, 1, 1, 1, 1,
0.5904114, 0.3180789, -0.3762677, 1, 1, 1, 1, 1,
0.5926055, -0.1112692, 0.411931, 1, 1, 1, 1, 1,
0.5986972, 0.02859525, 1.853799, 1, 1, 1, 1, 1,
0.6046637, -2.086319, 3.119764, 1, 1, 1, 1, 1,
0.6050945, -0.8843503, 3.744298, 1, 1, 1, 1, 1,
0.6089436, -0.239989, 0.3712187, 1, 1, 1, 1, 1,
0.6163004, -0.1948814, 0.2538803, 1, 1, 1, 1, 1,
0.6192967, 0.1558688, 3.166512, 0, 0, 1, 1, 1,
0.6200037, -0.230208, 1.351156, 1, 0, 0, 1, 1,
0.6212645, 0.2415024, 0.6565349, 1, 0, 0, 1, 1,
0.6213145, -0.2674122, 1.599658, 1, 0, 0, 1, 1,
0.628029, 0.154525, 0.3600685, 1, 0, 0, 1, 1,
0.628579, -1.49419, 2.361769, 1, 0, 0, 1, 1,
0.6317024, -0.8757555, 2.15227, 0, 0, 0, 1, 1,
0.6324438, 2.197952, -0.5544803, 0, 0, 0, 1, 1,
0.6394508, -0.4417624, 2.07831, 0, 0, 0, 1, 1,
0.647806, -2.07698, 4.360352, 0, 0, 0, 1, 1,
0.6540862, -0.3261525, 2.865218, 0, 0, 0, 1, 1,
0.6548929, 0.9892381, 0.1852729, 0, 0, 0, 1, 1,
0.6589267, -0.9876414, 2.781719, 0, 0, 0, 1, 1,
0.6599109, -1.14312, 2.193376, 1, 1, 1, 1, 1,
0.6613839, -0.2743137, 3.843106, 1, 1, 1, 1, 1,
0.6724523, 0.5187059, 2.25876, 1, 1, 1, 1, 1,
0.6730083, -0.4854068, 0.6482576, 1, 1, 1, 1, 1,
0.6765395, -0.0357759, 1.347639, 1, 1, 1, 1, 1,
0.6862423, -0.1199196, 2.624822, 1, 1, 1, 1, 1,
0.6869457, -0.1861293, 0.6785199, 1, 1, 1, 1, 1,
0.6893815, 2.697311, 1.462343, 1, 1, 1, 1, 1,
0.6941888, -1.597672, 3.579103, 1, 1, 1, 1, 1,
0.6978334, -1.742018, 3.541961, 1, 1, 1, 1, 1,
0.7055697, -0.6094555, 1.971309, 1, 1, 1, 1, 1,
0.7074889, -0.453113, 1.636109, 1, 1, 1, 1, 1,
0.7147938, -1.572665, 3.170648, 1, 1, 1, 1, 1,
0.7152322, -0.7570549, 2.406506, 1, 1, 1, 1, 1,
0.7160536, -0.1923789, 2.59721, 1, 1, 1, 1, 1,
0.7322443, 0.4945332, 0.4023657, 0, 0, 1, 1, 1,
0.7324066, 0.55937, 1.055497, 1, 0, 0, 1, 1,
0.7329432, 0.4297585, 0.8513703, 1, 0, 0, 1, 1,
0.7340865, -0.3190763, 2.618755, 1, 0, 0, 1, 1,
0.7357022, 1.447038, 0.6548759, 1, 0, 0, 1, 1,
0.737271, 0.6624218, 1.895412, 1, 0, 0, 1, 1,
0.7539922, -0.2369066, 1.42456, 0, 0, 0, 1, 1,
0.7677204, -0.7948747, 2.061762, 0, 0, 0, 1, 1,
0.7750556, 1.831268, 0.08050933, 0, 0, 0, 1, 1,
0.7799591, -1.751959, 2.395676, 0, 0, 0, 1, 1,
0.7847522, 0.4105034, -0.7587761, 0, 0, 0, 1, 1,
0.7856311, 1.124606, -0.3947659, 0, 0, 0, 1, 1,
0.7887471, -0.4315622, 1.498129, 0, 0, 0, 1, 1,
0.7912695, -1.625443, 3.015288, 1, 1, 1, 1, 1,
0.7922528, -0.006512489, 2.587278, 1, 1, 1, 1, 1,
0.7982782, 2.307252, 0.8696995, 1, 1, 1, 1, 1,
0.8033047, 0.08713699, 0.3915609, 1, 1, 1, 1, 1,
0.8038319, -2.645282, 3.125058, 1, 1, 1, 1, 1,
0.8079037, -0.376638, 3.388675, 1, 1, 1, 1, 1,
0.8168195, 0.7118654, 1.43835, 1, 1, 1, 1, 1,
0.8206854, -0.5105613, 2.035076, 1, 1, 1, 1, 1,
0.8222977, -0.08310451, 2.716766, 1, 1, 1, 1, 1,
0.8250916, -0.1059364, 1.096783, 1, 1, 1, 1, 1,
0.8306633, -1.633317, 2.420263, 1, 1, 1, 1, 1,
0.8348826, 1.607676, 1.839952, 1, 1, 1, 1, 1,
0.8368819, 2.175159, 0.2841519, 1, 1, 1, 1, 1,
0.8372441, -1.654882, 1.031079, 1, 1, 1, 1, 1,
0.838031, -0.791436, 2.783916, 1, 1, 1, 1, 1,
0.8406911, -1.488124, 2.898045, 0, 0, 1, 1, 1,
0.8456705, -0.2169639, 0.2332845, 1, 0, 0, 1, 1,
0.8491314, -0.7511288, 1.751265, 1, 0, 0, 1, 1,
0.8532631, 1.444018, 1.284284, 1, 0, 0, 1, 1,
0.8651069, 0.8161311, 1.723548, 1, 0, 0, 1, 1,
0.8719313, 0.8759133, 0.3742791, 1, 0, 0, 1, 1,
0.8726162, 0.7347311, 0.6618789, 0, 0, 0, 1, 1,
0.8771038, 1.127354, 2.430361, 0, 0, 0, 1, 1,
0.8785712, -0.195803, 3.417315, 0, 0, 0, 1, 1,
0.878836, 0.04122673, 2.72775, 0, 0, 0, 1, 1,
0.8878772, 0.7063617, 1.041583, 0, 0, 0, 1, 1,
0.8916373, 0.7852351, 1.543361, 0, 0, 0, 1, 1,
0.8924781, -0.3011221, 3.21358, 0, 0, 0, 1, 1,
0.8961288, 0.5077819, 2.086845, 1, 1, 1, 1, 1,
0.9008071, 0.9190405, 0.09304646, 1, 1, 1, 1, 1,
0.9026362, 0.06964366, 2.742052, 1, 1, 1, 1, 1,
0.9035899, 0.1588044, 1.12275, 1, 1, 1, 1, 1,
0.9036311, 0.8016128, 1.024878, 1, 1, 1, 1, 1,
0.9099081, -0.002541727, 1.838264, 1, 1, 1, 1, 1,
0.911437, -3.163064, 2.249163, 1, 1, 1, 1, 1,
0.9115475, 0.6789995, 1.189263, 1, 1, 1, 1, 1,
0.9125178, 1.062224, -1.570922, 1, 1, 1, 1, 1,
0.9133828, 0.4024642, -0.5743278, 1, 1, 1, 1, 1,
0.9149259, -0.7533838, 1.62885, 1, 1, 1, 1, 1,
0.917058, -0.7444927, 2.161992, 1, 1, 1, 1, 1,
0.9195379, -0.07481425, 1.788696, 1, 1, 1, 1, 1,
0.9213852, -1.622261, 2.988899, 1, 1, 1, 1, 1,
0.9240444, -0.6565673, 3.936136, 1, 1, 1, 1, 1,
0.9254988, 2.209115, 0.9545903, 0, 0, 1, 1, 1,
0.9270236, 1.51177, -0.5716815, 1, 0, 0, 1, 1,
0.9282442, -1.446681, 3.953478, 1, 0, 0, 1, 1,
0.9331614, 0.775717, 1.752726, 1, 0, 0, 1, 1,
0.9346198, 2.31803, 0.3713548, 1, 0, 0, 1, 1,
0.9347668, -0.1609516, -0.01602938, 1, 0, 0, 1, 1,
0.9369442, 0.1749331, 1.81745, 0, 0, 0, 1, 1,
0.937116, -2.018058, 3.429369, 0, 0, 0, 1, 1,
0.9446578, 0.696157, -1.007685, 0, 0, 0, 1, 1,
0.9491032, 0.7632704, 1.178124, 0, 0, 0, 1, 1,
0.9569316, 0.7249569, 1.462842, 0, 0, 0, 1, 1,
0.9625076, -1.46821, 1.056311, 0, 0, 0, 1, 1,
0.9648883, -0.09377757, 2.254805, 0, 0, 0, 1, 1,
0.9689595, -1.678907, 2.253489, 1, 1, 1, 1, 1,
0.9699436, -1.031812, 0.8446547, 1, 1, 1, 1, 1,
0.9708329, 1.950521, 1.375716, 1, 1, 1, 1, 1,
0.9738185, 0.2441778, 2.402779, 1, 1, 1, 1, 1,
0.9772519, 0.553337, -0.4682053, 1, 1, 1, 1, 1,
0.9773628, 1.555258, -1.514403, 1, 1, 1, 1, 1,
0.9914047, -1.171988, 3.691383, 1, 1, 1, 1, 1,
0.9958013, 0.24785, 1.030908, 1, 1, 1, 1, 1,
1.002586, 0.2675083, 3.658873, 1, 1, 1, 1, 1,
1.003294, -0.01620917, 3.07894, 1, 1, 1, 1, 1,
1.005123, -1.258101, 3.207058, 1, 1, 1, 1, 1,
1.006397, 1.570033, -0.1245422, 1, 1, 1, 1, 1,
1.006598, 0.3219675, 3.168098, 1, 1, 1, 1, 1,
1.007324, -0.03804514, 0.9661279, 1, 1, 1, 1, 1,
1.010545, -0.309969, 2.586665, 1, 1, 1, 1, 1,
1.01391, 1.46903, -0.1739066, 0, 0, 1, 1, 1,
1.014587, 0.3510869, 1.184924, 1, 0, 0, 1, 1,
1.015117, 0.4589075, 1.386468, 1, 0, 0, 1, 1,
1.01857, -0.7169418, 1.982378, 1, 0, 0, 1, 1,
1.019909, 1.336134, -0.7383419, 1, 0, 0, 1, 1,
1.028197, -0.2436243, 0.5598191, 1, 0, 0, 1, 1,
1.03193, 0.2215341, 0.04064082, 0, 0, 0, 1, 1,
1.035164, 0.248565, 1.522978, 0, 0, 0, 1, 1,
1.035662, -0.08673687, 2.194551, 0, 0, 0, 1, 1,
1.048844, -0.03002996, 3.694279, 0, 0, 0, 1, 1,
1.048883, -0.9967051, 3.510295, 0, 0, 0, 1, 1,
1.049283, -0.8713311, 2.014046, 0, 0, 0, 1, 1,
1.05473, 0.9181069, 1.090278, 0, 0, 0, 1, 1,
1.056401, -0.5495579, 2.56577, 1, 1, 1, 1, 1,
1.063537, -0.7077155, 3.101012, 1, 1, 1, 1, 1,
1.067203, -2.023927, 1.887474, 1, 1, 1, 1, 1,
1.069906, -0.6231498, 3.231688, 1, 1, 1, 1, 1,
1.070877, -0.6170292, 1.681107, 1, 1, 1, 1, 1,
1.075268, -0.6056833, 2.1443, 1, 1, 1, 1, 1,
1.086449, -1.169297, 2.796601, 1, 1, 1, 1, 1,
1.086654, 1.081684, 0.6818415, 1, 1, 1, 1, 1,
1.087494, 0.1171845, 1.438041, 1, 1, 1, 1, 1,
1.101363, 0.1220365, 0.7694024, 1, 1, 1, 1, 1,
1.104124, -0.8000063, 2.61717, 1, 1, 1, 1, 1,
1.105737, -1.154514, 2.770068, 1, 1, 1, 1, 1,
1.108664, -0.3033572, 1.607522, 1, 1, 1, 1, 1,
1.123678, 0.5091231, -0.7604597, 1, 1, 1, 1, 1,
1.125299, -0.2662725, 1.711353, 1, 1, 1, 1, 1,
1.126452, -0.6984138, 4.346874, 0, 0, 1, 1, 1,
1.128399, 0.279357, 3.971918, 1, 0, 0, 1, 1,
1.131458, -1.244064, 2.565077, 1, 0, 0, 1, 1,
1.139263, -1.626348, 2.004862, 1, 0, 0, 1, 1,
1.141986, 0.7215005, 2.343774, 1, 0, 0, 1, 1,
1.146327, 0.1403673, 0.7609484, 1, 0, 0, 1, 1,
1.150242, -0.1059901, 2.940878, 0, 0, 0, 1, 1,
1.153536, 1.154649, 0.7887423, 0, 0, 0, 1, 1,
1.155017, 0.9473323, -0.5635675, 0, 0, 0, 1, 1,
1.163169, -1.631186, 1.830172, 0, 0, 0, 1, 1,
1.168103, -0.1972508, 0.2181331, 0, 0, 0, 1, 1,
1.171968, -1.320053, 2.504994, 0, 0, 0, 1, 1,
1.173035, 1.149568, 1.730032, 0, 0, 0, 1, 1,
1.175165, 0.6759942, 1.623122, 1, 1, 1, 1, 1,
1.181143, -0.8413148, 2.407805, 1, 1, 1, 1, 1,
1.188559, -1.36519, 3.158543, 1, 1, 1, 1, 1,
1.190636, 0.9158983, -0.3310923, 1, 1, 1, 1, 1,
1.192038, -1.018693, 0.5969981, 1, 1, 1, 1, 1,
1.201626, -0.6194128, 2.345863, 1, 1, 1, 1, 1,
1.207715, -0.6105449, 2.84469, 1, 1, 1, 1, 1,
1.209621, 0.1897102, 3.158906, 1, 1, 1, 1, 1,
1.220793, 1.592067, 1.419392, 1, 1, 1, 1, 1,
1.224777, 1.810303, 1.470383, 1, 1, 1, 1, 1,
1.230647, -0.5321994, 3.066783, 1, 1, 1, 1, 1,
1.240941, -0.3530416, -0.2800964, 1, 1, 1, 1, 1,
1.247514, -0.442427, 1.64823, 1, 1, 1, 1, 1,
1.261112, 0.8526666, 1.320772, 1, 1, 1, 1, 1,
1.283721, -0.6463276, 2.409483, 1, 1, 1, 1, 1,
1.291845, -0.7101586, 0.3506289, 0, 0, 1, 1, 1,
1.292603, 0.4850655, 0.5589092, 1, 0, 0, 1, 1,
1.297166, -1.666994, 2.741537, 1, 0, 0, 1, 1,
1.317732, -0.5199508, 1.836926, 1, 0, 0, 1, 1,
1.321162, 0.5470148, 1.408152, 1, 0, 0, 1, 1,
1.326838, 0.650817, -0.05831449, 1, 0, 0, 1, 1,
1.327755, 0.02260252, 3.096866, 0, 0, 0, 1, 1,
1.333007, -1.932504, 4.282596, 0, 0, 0, 1, 1,
1.341985, 0.6335001, 2.429892, 0, 0, 0, 1, 1,
1.348994, 1.282551, 0.6745219, 0, 0, 0, 1, 1,
1.349841, -0.4257827, 3.211235, 0, 0, 0, 1, 1,
1.349848, -1.677303, 0.9649958, 0, 0, 0, 1, 1,
1.35611, -0.2920731, 1.146455, 0, 0, 0, 1, 1,
1.358395, -0.3242557, 2.550519, 1, 1, 1, 1, 1,
1.361741, 0.4329025, 0.4872369, 1, 1, 1, 1, 1,
1.369028, 1.31986, 3.303294, 1, 1, 1, 1, 1,
1.370448, -0.4151486, 0.8341153, 1, 1, 1, 1, 1,
1.372993, 0.8205659, 1.192747, 1, 1, 1, 1, 1,
1.373088, 0.5150222, 1.319486, 1, 1, 1, 1, 1,
1.37432, -0.7125123, 0.6461567, 1, 1, 1, 1, 1,
1.37604, -1.046382, 0.9412869, 1, 1, 1, 1, 1,
1.376057, 1.177091, 0.5251741, 1, 1, 1, 1, 1,
1.376994, -1.603262, 3.635743, 1, 1, 1, 1, 1,
1.380147, -1.425379, 2.929371, 1, 1, 1, 1, 1,
1.398662, -1.052656, 1.859834, 1, 1, 1, 1, 1,
1.404048, 0.8279737, -0.5393872, 1, 1, 1, 1, 1,
1.414738, -1.01092, 2.971284, 1, 1, 1, 1, 1,
1.418336, 1.186009, 0.4490357, 1, 1, 1, 1, 1,
1.418931, 0.1036752, -0.5849211, 0, 0, 1, 1, 1,
1.424874, 0.5501446, 2.314753, 1, 0, 0, 1, 1,
1.448935, -1.156077, 1.392617, 1, 0, 0, 1, 1,
1.450709, 0.01023562, 0.9372823, 1, 0, 0, 1, 1,
1.458687, -1.099527, 0.7863407, 1, 0, 0, 1, 1,
1.460217, 0.1596878, 2.730484, 1, 0, 0, 1, 1,
1.466903, -0.9816939, 2.306944, 0, 0, 0, 1, 1,
1.468706, 0.2279845, -0.1466459, 0, 0, 0, 1, 1,
1.470547, 1.300051, 0.133597, 0, 0, 0, 1, 1,
1.473013, -0.797293, 2.366696, 0, 0, 0, 1, 1,
1.48634, 0.5130891, 3.505763, 0, 0, 0, 1, 1,
1.493875, -0.6444799, 2.770507, 0, 0, 0, 1, 1,
1.497027, 0.1302849, 2.398233, 0, 0, 0, 1, 1,
1.51106, -1.279409, 1.180751, 1, 1, 1, 1, 1,
1.516025, 1.223863, 2.525935, 1, 1, 1, 1, 1,
1.529099, -1.205273, 1.005014, 1, 1, 1, 1, 1,
1.529938, 0.2942399, 1.836371, 1, 1, 1, 1, 1,
1.530538, 0.06526326, 0.4527636, 1, 1, 1, 1, 1,
1.534584, 0.3957801, 1.110443, 1, 1, 1, 1, 1,
1.559177, -0.2805003, 1.843495, 1, 1, 1, 1, 1,
1.577319, -0.3835825, 1.250424, 1, 1, 1, 1, 1,
1.586352, -0.03077555, 1.645234, 1, 1, 1, 1, 1,
1.621274, -0.2782172, 3.170795, 1, 1, 1, 1, 1,
1.623422, 0.3714812, -0.6326503, 1, 1, 1, 1, 1,
1.628026, 0.5148199, -0.04166526, 1, 1, 1, 1, 1,
1.640803, -0.7930119, 1.671719, 1, 1, 1, 1, 1,
1.664199, -0.1377645, 2.174012, 1, 1, 1, 1, 1,
1.672565, -1.469604, 1.099809, 1, 1, 1, 1, 1,
1.711422, 1.105697, 2.702374, 0, 0, 1, 1, 1,
1.729114, -0.6607655, 2.00826, 1, 0, 0, 1, 1,
1.731225, -0.2299183, 2.390456, 1, 0, 0, 1, 1,
1.732265, 0.2367886, 0.8300538, 1, 0, 0, 1, 1,
1.736401, -0.3857011, -0.9038096, 1, 0, 0, 1, 1,
1.740708, 0.01017975, 0.2547241, 1, 0, 0, 1, 1,
1.742252, 0.3708212, 1.266497, 0, 0, 0, 1, 1,
1.759616, 0.3291346, -1.255946, 0, 0, 0, 1, 1,
1.762107, 1.013815, 2.361, 0, 0, 0, 1, 1,
1.763123, -0.01313989, 1.983001, 0, 0, 0, 1, 1,
1.766142, 0.785553, 1.048182, 0, 0, 0, 1, 1,
1.767464, -0.1731582, 0.7269357, 0, 0, 0, 1, 1,
1.770653, -0.5033177, 3.988538, 0, 0, 0, 1, 1,
1.773172, -0.8544672, 0.769477, 1, 1, 1, 1, 1,
1.776455, 0.6065801, 1.731644, 1, 1, 1, 1, 1,
1.805153, -2.126193, 1.248224, 1, 1, 1, 1, 1,
1.812616, -1.918859, 2.705678, 1, 1, 1, 1, 1,
1.814058, 2.267595, 1.3511, 1, 1, 1, 1, 1,
1.837349, -0.004177877, 2.193886, 1, 1, 1, 1, 1,
1.841186, -0.205949, 0.5848311, 1, 1, 1, 1, 1,
1.872626, 0.1294686, 0.3693971, 1, 1, 1, 1, 1,
1.891724, -0.2798247, 2.399291, 1, 1, 1, 1, 1,
1.905955, 0.3545085, 1.126008, 1, 1, 1, 1, 1,
1.923471, 1.211505, 0.0042137, 1, 1, 1, 1, 1,
1.932736, 0.1373147, 0.05137993, 1, 1, 1, 1, 1,
1.944043, 1.174427, 0.4299694, 1, 1, 1, 1, 1,
1.955818, 0.1670719, 0.6228822, 1, 1, 1, 1, 1,
2.002355, -0.7077438, 2.330014, 1, 1, 1, 1, 1,
2.023039, 0.4151818, 1.627539, 0, 0, 1, 1, 1,
2.029782, -0.3952393, 2.532639, 1, 0, 0, 1, 1,
2.076662, -0.2640217, 1.18571, 1, 0, 0, 1, 1,
2.110936, 0.159745, 1.59968, 1, 0, 0, 1, 1,
2.140874, -0.3509303, 1.236812, 1, 0, 0, 1, 1,
2.158932, -1.031018, 1.672014, 1, 0, 0, 1, 1,
2.163049, -0.1031907, -0.6465645, 0, 0, 0, 1, 1,
2.169918, -0.7174416, 2.317181, 0, 0, 0, 1, 1,
2.184778, -0.7168415, 1.476219, 0, 0, 0, 1, 1,
2.217657, -0.03255351, 1.570222, 0, 0, 0, 1, 1,
2.240014, -0.2323677, 1.639179, 0, 0, 0, 1, 1,
2.265949, 1.28038, 1.624451, 0, 0, 0, 1, 1,
2.269086, -1.240506, 1.142294, 0, 0, 0, 1, 1,
2.47496, 0.3181795, 1.017573, 1, 1, 1, 1, 1,
2.511779, 1.419924, 2.019279, 1, 1, 1, 1, 1,
2.635005, 0.423947, 1.939617, 1, 1, 1, 1, 1,
2.723108, -0.02511858, 3.352478, 1, 1, 1, 1, 1,
2.748719, 0.199578, 0.08498055, 1, 1, 1, 1, 1,
3.119336, -1.102206, -1.080652, 1, 1, 1, 1, 1,
3.608331, 1.066298, 1.221365, 1, 1, 1, 1, 1
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
var radius = 9.858112;
var distance = 34.6262;
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
mvMatrix.translate( 0.02373481, -0.07229328, -0.2252195 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.6262);
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
