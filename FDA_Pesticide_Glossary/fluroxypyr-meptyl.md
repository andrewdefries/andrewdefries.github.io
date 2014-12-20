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
-2.560234, -0.635129, -2.675323, 1, 0, 0, 1,
-2.520579, 0.4457547, -0.8819563, 1, 0.007843138, 0, 1,
-2.497201, -0.9202037, -2.963897, 1, 0.01176471, 0, 1,
-2.356432, 1.680542, -0.2979544, 1, 0.01960784, 0, 1,
-2.225289, 0.3783793, -0.7265629, 1, 0.02352941, 0, 1,
-2.209566, -0.03573708, -2.995152, 1, 0.03137255, 0, 1,
-2.201272, 0.3579956, -1.319025, 1, 0.03529412, 0, 1,
-2.121707, 0.04121803, -3.665549, 1, 0.04313726, 0, 1,
-2.089681, -0.7246312, -0.2355351, 1, 0.04705882, 0, 1,
-2.058205, -2.083745, -3.636935, 1, 0.05490196, 0, 1,
-2.042717, 0.717357, -0.7325076, 1, 0.05882353, 0, 1,
-2.03709, 2.29971, -0.1857129, 1, 0.06666667, 0, 1,
-2.02527, -0.8939535, -1.802727, 1, 0.07058824, 0, 1,
-2.007712, 1.228533, -0.7546711, 1, 0.07843138, 0, 1,
-1.987665, 0.1009738, -3.498462, 1, 0.08235294, 0, 1,
-1.976906, -1.00433, -2.747339, 1, 0.09019608, 0, 1,
-1.963935, -0.7234197, -1.867794, 1, 0.09411765, 0, 1,
-1.934547, 0.7330087, -2.299679, 1, 0.1019608, 0, 1,
-1.92518, 0.2821726, -0.8543922, 1, 0.1098039, 0, 1,
-1.88896, -0.03624231, -1.848981, 1, 0.1137255, 0, 1,
-1.836654, -0.3564422, -2.128185, 1, 0.1215686, 0, 1,
-1.805506, 0.624809, -0.8220084, 1, 0.1254902, 0, 1,
-1.793141, -0.943444, -0.3957118, 1, 0.1333333, 0, 1,
-1.775621, 3.031175, 0.3865207, 1, 0.1372549, 0, 1,
-1.771278, 1.670702, 1.258074, 1, 0.145098, 0, 1,
-1.770204, 0.2628958, -1.505319, 1, 0.1490196, 0, 1,
-1.766807, 0.8059203, -1.6613, 1, 0.1568628, 0, 1,
-1.761865, 0.4329941, -2.914081, 1, 0.1607843, 0, 1,
-1.751092, -0.2483523, -0.421718, 1, 0.1686275, 0, 1,
-1.746119, -0.9151508, -2.060248, 1, 0.172549, 0, 1,
-1.738598, 0.7992226, -0.691255, 1, 0.1803922, 0, 1,
-1.735511, -0.1226577, -2.426509, 1, 0.1843137, 0, 1,
-1.729451, 0.2418746, -1.172536, 1, 0.1921569, 0, 1,
-1.728827, 2.294951, -1.320197, 1, 0.1960784, 0, 1,
-1.727898, 0.2462669, -0.6315461, 1, 0.2039216, 0, 1,
-1.722822, -0.23113, -1.789388, 1, 0.2117647, 0, 1,
-1.71914, 0.3336205, -0.6912248, 1, 0.2156863, 0, 1,
-1.691504, -0.2720364, 0.4178088, 1, 0.2235294, 0, 1,
-1.68199, 1.208013, -0.5634879, 1, 0.227451, 0, 1,
-1.681262, 0.5039687, -0.1645053, 1, 0.2352941, 0, 1,
-1.672369, -1.439062, -1.922819, 1, 0.2392157, 0, 1,
-1.665891, -1.392351, -3.66095, 1, 0.2470588, 0, 1,
-1.648029, 0.8100316, -2.012002, 1, 0.2509804, 0, 1,
-1.645866, -0.05104712, -0.7991024, 1, 0.2588235, 0, 1,
-1.641943, 0.162348, -1.210858, 1, 0.2627451, 0, 1,
-1.61872, -0.7318017, -2.213512, 1, 0.2705882, 0, 1,
-1.61518, -1.337472, -2.300268, 1, 0.2745098, 0, 1,
-1.612173, 0.9187403, -1.335971, 1, 0.282353, 0, 1,
-1.607995, -0.5444187, -2.694495, 1, 0.2862745, 0, 1,
-1.607396, -2.585406, -1.604446, 1, 0.2941177, 0, 1,
-1.604886, -2.337479, -3.508251, 1, 0.3019608, 0, 1,
-1.592476, -0.0890821, -1.612698, 1, 0.3058824, 0, 1,
-1.566257, 0.2887522, -0.1120502, 1, 0.3137255, 0, 1,
-1.555763, -0.5252775, -3.435582, 1, 0.3176471, 0, 1,
-1.548872, -1.945645, -2.017172, 1, 0.3254902, 0, 1,
-1.541542, 1.558754, -1.114345, 1, 0.3294118, 0, 1,
-1.538915, -2.029932, -2.687155, 1, 0.3372549, 0, 1,
-1.538827, -1.162685, -2.936913, 1, 0.3411765, 0, 1,
-1.528098, 1.925906, -0.8578827, 1, 0.3490196, 0, 1,
-1.511443, 0.6390815, -0.7614868, 1, 0.3529412, 0, 1,
-1.509345, 1.259604, -1.341213, 1, 0.3607843, 0, 1,
-1.501356, 0.427939, -0.04468108, 1, 0.3647059, 0, 1,
-1.492407, -0.1496868, -0.2394751, 1, 0.372549, 0, 1,
-1.468616, -1.688652, -3.770329, 1, 0.3764706, 0, 1,
-1.441155, -0.05673708, -1.978019, 1, 0.3843137, 0, 1,
-1.440621, 0.06733163, 0.2557698, 1, 0.3882353, 0, 1,
-1.437547, 0.2300118, -0.7625366, 1, 0.3960784, 0, 1,
-1.431476, 1.487669, -1.782763, 1, 0.4039216, 0, 1,
-1.431212, -1.072186, -2.389115, 1, 0.4078431, 0, 1,
-1.409265, 0.2968083, -3.147463, 1, 0.4156863, 0, 1,
-1.408722, -0.7708513, -1.797907, 1, 0.4196078, 0, 1,
-1.403981, 0.1394519, -1.181848, 1, 0.427451, 0, 1,
-1.395741, 0.3237975, -0.5476611, 1, 0.4313726, 0, 1,
-1.392396, 1.449071, -0.4373448, 1, 0.4392157, 0, 1,
-1.39169, -0.4267934, -3.532955, 1, 0.4431373, 0, 1,
-1.38999, -2.244057, -2.361855, 1, 0.4509804, 0, 1,
-1.371255, -1.518913, -2.688887, 1, 0.454902, 0, 1,
-1.369369, -0.2329049, -3.645332, 1, 0.4627451, 0, 1,
-1.365706, -0.6749179, -1.841247, 1, 0.4666667, 0, 1,
-1.345246, 0.2405303, -1.977244, 1, 0.4745098, 0, 1,
-1.339697, 0.5754449, -0.8674611, 1, 0.4784314, 0, 1,
-1.337586, 2.181189, 0.584671, 1, 0.4862745, 0, 1,
-1.335894, -0.6558082, -2.887675, 1, 0.4901961, 0, 1,
-1.335737, -1.370121, -2.055554, 1, 0.4980392, 0, 1,
-1.322866, -0.01976626, -0.8797379, 1, 0.5058824, 0, 1,
-1.322359, -0.8175221, -3.437802, 1, 0.509804, 0, 1,
-1.32098, -0.5798593, -4.093812, 1, 0.5176471, 0, 1,
-1.311251, 2.111583, 0.4387968, 1, 0.5215687, 0, 1,
-1.295181, -0.9285165, -4.678671, 1, 0.5294118, 0, 1,
-1.283759, 0.312593, -1.300399, 1, 0.5333334, 0, 1,
-1.282004, 1.24543, -1.617836, 1, 0.5411765, 0, 1,
-1.280187, 0.4975159, -0.08545832, 1, 0.5450981, 0, 1,
-1.274265, -1.04723, -1.855369, 1, 0.5529412, 0, 1,
-1.272908, 0.4901941, -1.21984, 1, 0.5568628, 0, 1,
-1.266722, -1.036182, -3.084117, 1, 0.5647059, 0, 1,
-1.265421, -1.586216, -2.453597, 1, 0.5686275, 0, 1,
-1.261606, -0.5399475, -2.857606, 1, 0.5764706, 0, 1,
-1.248277, -1.503892, -2.071506, 1, 0.5803922, 0, 1,
-1.242016, 0.8477817, -1.012822, 1, 0.5882353, 0, 1,
-1.222958, -0.1413251, -1.70511, 1, 0.5921569, 0, 1,
-1.222136, -0.6507263, -1.580734, 1, 0.6, 0, 1,
-1.218636, -0.2157947, -1.488786, 1, 0.6078432, 0, 1,
-1.216567, 0.1114305, -2.634717, 1, 0.6117647, 0, 1,
-1.21651, 2.049297, 0.05569714, 1, 0.6196079, 0, 1,
-1.213795, -0.7196535, -2.653982, 1, 0.6235294, 0, 1,
-1.210561, 1.101319, 0.8214132, 1, 0.6313726, 0, 1,
-1.201751, 0.7477228, -0.3437788, 1, 0.6352941, 0, 1,
-1.201628, 0.3605925, -2.261105, 1, 0.6431373, 0, 1,
-1.200364, -0.3762314, -1.560587, 1, 0.6470588, 0, 1,
-1.187376, -0.2959813, -2.914524, 1, 0.654902, 0, 1,
-1.185896, -0.814298, -2.917422, 1, 0.6588235, 0, 1,
-1.179611, -0.4459622, -2.384006, 1, 0.6666667, 0, 1,
-1.171073, -0.9443736, -1.59381, 1, 0.6705883, 0, 1,
-1.169188, 0.6096548, -0.8073024, 1, 0.6784314, 0, 1,
-1.158433, -1.419839, -3.31664, 1, 0.682353, 0, 1,
-1.156914, -0.2991699, -1.333704, 1, 0.6901961, 0, 1,
-1.156494, 0.9493673, -2.304967, 1, 0.6941177, 0, 1,
-1.149163, 0.1526815, -0.6624398, 1, 0.7019608, 0, 1,
-1.143624, 0.1414922, -1.233082, 1, 0.7098039, 0, 1,
-1.13452, -1.526659, -3.457083, 1, 0.7137255, 0, 1,
-1.133759, 1.439719, 0.2308724, 1, 0.7215686, 0, 1,
-1.132947, -1.364191, -2.006417, 1, 0.7254902, 0, 1,
-1.128169, 0.274529, -2.323254, 1, 0.7333333, 0, 1,
-1.124437, -1.574304, -2.989969, 1, 0.7372549, 0, 1,
-1.122464, 0.8687286, 0.6218476, 1, 0.7450981, 0, 1,
-1.119025, -2.273613, -2.66572, 1, 0.7490196, 0, 1,
-1.11783, 1.008515, -0.6451117, 1, 0.7568628, 0, 1,
-1.114803, 1.669676, -1.006279, 1, 0.7607843, 0, 1,
-1.096037, 1.531915, -0.6713994, 1, 0.7686275, 0, 1,
-1.089529, 0.9073875, -1.946924, 1, 0.772549, 0, 1,
-1.082954, -0.8328616, -4.858757, 1, 0.7803922, 0, 1,
-1.082845, 0.551381, -0.7854282, 1, 0.7843137, 0, 1,
-1.082133, -0.455062, -3.234227, 1, 0.7921569, 0, 1,
-1.080265, 1.097981, -0.9556312, 1, 0.7960784, 0, 1,
-1.074282, 1.807675, -0.7551792, 1, 0.8039216, 0, 1,
-1.065156, 1.137671, -0.2121733, 1, 0.8117647, 0, 1,
-1.063379, -0.03782951, -2.036729, 1, 0.8156863, 0, 1,
-1.059196, 1.085039, -0.9163803, 1, 0.8235294, 0, 1,
-1.056337, 0.2314323, -0.7566487, 1, 0.827451, 0, 1,
-1.055398, 0.05158406, -3.341074, 1, 0.8352941, 0, 1,
-1.054884, 1.491493, -0.7052159, 1, 0.8392157, 0, 1,
-1.04576, -0.4066436, -1.276762, 1, 0.8470588, 0, 1,
-1.03831, 1.062357, -1.61816, 1, 0.8509804, 0, 1,
-1.037021, -0.3049504, -0.07754432, 1, 0.8588235, 0, 1,
-1.03442, -0.3289657, -0.2844596, 1, 0.8627451, 0, 1,
-1.033904, 1.458873, -1.359851, 1, 0.8705882, 0, 1,
-1.032546, -1.299386, -1.039338, 1, 0.8745098, 0, 1,
-1.01794, -0.8146122, -3.307593, 1, 0.8823529, 0, 1,
-1.014651, -1.027715, -3.339652, 1, 0.8862745, 0, 1,
-1.014622, 0.5509802, -0.8121594, 1, 0.8941177, 0, 1,
-1.012543, -0.873649, -1.468402, 1, 0.8980392, 0, 1,
-1.010957, 0.1752411, -3.562153, 1, 0.9058824, 0, 1,
-1.010449, -0.1148937, -1.806063, 1, 0.9137255, 0, 1,
-0.996563, 2.104948, 0.8176335, 1, 0.9176471, 0, 1,
-0.9936256, -0.3755288, -0.7962463, 1, 0.9254902, 0, 1,
-0.9922502, -0.8208681, -1.586776, 1, 0.9294118, 0, 1,
-0.9890167, -0.5266895, -2.827817, 1, 0.9372549, 0, 1,
-0.9866885, -0.3489488, -2.646921, 1, 0.9411765, 0, 1,
-0.985678, 0.4430261, -1.031751, 1, 0.9490196, 0, 1,
-0.9844524, 0.312112, -1.732292, 1, 0.9529412, 0, 1,
-0.980674, -1.215685, -2.833591, 1, 0.9607843, 0, 1,
-0.978941, 0.6819069, -0.6351906, 1, 0.9647059, 0, 1,
-0.9786307, -1.962897, -2.966238, 1, 0.972549, 0, 1,
-0.9782589, -0.08060379, -0.02219098, 1, 0.9764706, 0, 1,
-0.9779081, 1.863269, -0.3945272, 1, 0.9843137, 0, 1,
-0.975679, -0.7082334, -2.76073, 1, 0.9882353, 0, 1,
-0.9751027, 1.500569, -0.7496879, 1, 0.9960784, 0, 1,
-0.9651876, -1.449517, -2.688828, 0.9960784, 1, 0, 1,
-0.9579934, -0.5915595, -3.780576, 0.9921569, 1, 0, 1,
-0.9576322, 0.617113, 0.2005815, 0.9843137, 1, 0, 1,
-0.9567129, -0.3211571, -2.620095, 0.9803922, 1, 0, 1,
-0.9563521, 0.2098957, -0.2078787, 0.972549, 1, 0, 1,
-0.9525522, -0.8630525, -1.570711, 0.9686275, 1, 0, 1,
-0.9517079, -1.05909, -3.417792, 0.9607843, 1, 0, 1,
-0.948526, 0.6197792, -1.458253, 0.9568627, 1, 0, 1,
-0.9475263, 0.9828659, -0.5172383, 0.9490196, 1, 0, 1,
-0.9456371, 1.197206, -0.3225866, 0.945098, 1, 0, 1,
-0.944943, -0.4781266, -2.427692, 0.9372549, 1, 0, 1,
-0.9365851, 0.8299413, -0.4517647, 0.9333333, 1, 0, 1,
-0.9301437, -1.516853, -2.269953, 0.9254902, 1, 0, 1,
-0.9267029, 1.184466, -0.008130391, 0.9215686, 1, 0, 1,
-0.9262715, 1.262202, -3.568503, 0.9137255, 1, 0, 1,
-0.9239173, 0.180918, -1.64537, 0.9098039, 1, 0, 1,
-0.9226583, 2.113297, -0.2337237, 0.9019608, 1, 0, 1,
-0.909872, -2.080437, -2.990091, 0.8941177, 1, 0, 1,
-0.9055882, 0.02499922, -0.9324504, 0.8901961, 1, 0, 1,
-0.901388, 0.7656702, -1.218885, 0.8823529, 1, 0, 1,
-0.8987374, 1.645126, 0.6928003, 0.8784314, 1, 0, 1,
-0.8984745, -0.6535348, -1.920499, 0.8705882, 1, 0, 1,
-0.89842, -0.7520988, -3.274924, 0.8666667, 1, 0, 1,
-0.8973834, -2.1259, -2.321833, 0.8588235, 1, 0, 1,
-0.8945828, 0.6439979, -0.8159961, 0.854902, 1, 0, 1,
-0.8910632, -0.1145135, -0.6445758, 0.8470588, 1, 0, 1,
-0.8897862, 1.631239, -0.8675067, 0.8431373, 1, 0, 1,
-0.8856364, 1.762908, -1.638015, 0.8352941, 1, 0, 1,
-0.8812847, -0.3977026, -1.465004, 0.8313726, 1, 0, 1,
-0.8809893, -1.597872, -1.53589, 0.8235294, 1, 0, 1,
-0.8763076, -0.9079394, -3.017379, 0.8196079, 1, 0, 1,
-0.8737307, -0.708187, -1.896003, 0.8117647, 1, 0, 1,
-0.8709909, -1.211878, -2.674645, 0.8078431, 1, 0, 1,
-0.8625911, -1.187522, -2.277814, 0.8, 1, 0, 1,
-0.8571769, -1.97443, -3.265307, 0.7921569, 1, 0, 1,
-0.8549264, -0.5539503, -1.998558, 0.7882353, 1, 0, 1,
-0.8516691, -1.439584, -1.9378, 0.7803922, 1, 0, 1,
-0.850774, 0.5060129, -1.06997, 0.7764706, 1, 0, 1,
-0.8474714, -1.021601, -1.05587, 0.7686275, 1, 0, 1,
-0.8454743, 1.176477, -0.8133538, 0.7647059, 1, 0, 1,
-0.842845, -0.3178729, -1.606792, 0.7568628, 1, 0, 1,
-0.8366288, 0.3695688, -2.611509, 0.7529412, 1, 0, 1,
-0.8362546, 1.567504, 0.8669308, 0.7450981, 1, 0, 1,
-0.8358638, 0.8311395, 0.4141486, 0.7411765, 1, 0, 1,
-0.834604, -0.6008197, -1.23368, 0.7333333, 1, 0, 1,
-0.8284108, 1.998088, 0.6590866, 0.7294118, 1, 0, 1,
-0.819531, 1.191304, -0.4175052, 0.7215686, 1, 0, 1,
-0.8076152, 0.06565911, -1.668717, 0.7176471, 1, 0, 1,
-0.8060668, -1.307646, -1.443319, 0.7098039, 1, 0, 1,
-0.798637, -0.5359955, -1.731002, 0.7058824, 1, 0, 1,
-0.7979315, -0.5464441, -2.921226, 0.6980392, 1, 0, 1,
-0.7972014, -0.4996484, -1.703921, 0.6901961, 1, 0, 1,
-0.7969864, 0.9836234, -0.5307775, 0.6862745, 1, 0, 1,
-0.7952932, 1.547925, -1.326975, 0.6784314, 1, 0, 1,
-0.7952292, 0.1377185, -1.890872, 0.6745098, 1, 0, 1,
-0.7850984, -0.8100998, 0.2826464, 0.6666667, 1, 0, 1,
-0.7850651, 1.264585, -1.114911, 0.6627451, 1, 0, 1,
-0.7828946, -0.09325861, -2.466654, 0.654902, 1, 0, 1,
-0.781596, 1.596087, -0.3581606, 0.6509804, 1, 0, 1,
-0.7788167, 0.9928678, -3.103489, 0.6431373, 1, 0, 1,
-0.7733421, -2.006318, -2.901376, 0.6392157, 1, 0, 1,
-0.7667333, -1.178855, -1.273905, 0.6313726, 1, 0, 1,
-0.7593114, -0.6206853, -2.731144, 0.627451, 1, 0, 1,
-0.7558821, -1.166284, -2.752344, 0.6196079, 1, 0, 1,
-0.7523571, 1.430842, 0.2273461, 0.6156863, 1, 0, 1,
-0.7490075, -0.8311016, -1.788983, 0.6078432, 1, 0, 1,
-0.7485394, 1.397741, -0.6656958, 0.6039216, 1, 0, 1,
-0.7481291, -1.083572, -1.585304, 0.5960785, 1, 0, 1,
-0.7481208, 2.10878, 0.2025327, 0.5882353, 1, 0, 1,
-0.735884, 0.6974972, -3.834199, 0.5843138, 1, 0, 1,
-0.7270485, -2.168586, -2.430248, 0.5764706, 1, 0, 1,
-0.7260706, -1.489217, -1.275855, 0.572549, 1, 0, 1,
-0.7245514, -0.1997215, -4.09568, 0.5647059, 1, 0, 1,
-0.7223276, -0.430807, -0.1651454, 0.5607843, 1, 0, 1,
-0.7205502, -1.338112, -2.407796, 0.5529412, 1, 0, 1,
-0.7183022, -0.6051202, -3.234399, 0.5490196, 1, 0, 1,
-0.7179691, 0.8514441, -0.01340892, 0.5411765, 1, 0, 1,
-0.7162459, -0.2510102, -1.069094, 0.5372549, 1, 0, 1,
-0.7042353, -1.145975, -3.463402, 0.5294118, 1, 0, 1,
-0.7039354, 0.7328022, 0.2581127, 0.5254902, 1, 0, 1,
-0.7013052, -0.3152188, -1.895793, 0.5176471, 1, 0, 1,
-0.6979216, -0.2644069, -1.762947, 0.5137255, 1, 0, 1,
-0.6923695, 0.9849554, -1.068783, 0.5058824, 1, 0, 1,
-0.6861697, 0.3065191, -1.540158, 0.5019608, 1, 0, 1,
-0.6844627, 0.4707144, 1.288411, 0.4941176, 1, 0, 1,
-0.683663, 1.015644, -0.2502076, 0.4862745, 1, 0, 1,
-0.679767, -0.7911689, -1.922166, 0.4823529, 1, 0, 1,
-0.6788961, -2.019101, -2.377845, 0.4745098, 1, 0, 1,
-0.6784794, -0.04781811, -0.9279059, 0.4705882, 1, 0, 1,
-0.6766188, -1.104306, -3.016685, 0.4627451, 1, 0, 1,
-0.6760005, -0.4089962, -1.314103, 0.4588235, 1, 0, 1,
-0.6651105, 0.8824288, 0.4468977, 0.4509804, 1, 0, 1,
-0.6651095, -0.8058217, -2.857888, 0.4470588, 1, 0, 1,
-0.6537991, 1.097508, -0.9366616, 0.4392157, 1, 0, 1,
-0.6525106, 0.5791416, -0.8920777, 0.4352941, 1, 0, 1,
-0.6485108, -0.25183, -1.730847, 0.427451, 1, 0, 1,
-0.6453316, 0.3396972, -2.051712, 0.4235294, 1, 0, 1,
-0.6433793, 0.6796446, -0.0343214, 0.4156863, 1, 0, 1,
-0.6355788, 0.8933029, 0.9565124, 0.4117647, 1, 0, 1,
-0.6313993, 0.8845075, -1.285403, 0.4039216, 1, 0, 1,
-0.6309045, -2.601388, -2.457108, 0.3960784, 1, 0, 1,
-0.6303377, -1.18574, -1.781013, 0.3921569, 1, 0, 1,
-0.629568, 0.7374522, -0.6266918, 0.3843137, 1, 0, 1,
-0.6187234, -0.4807112, -1.592346, 0.3803922, 1, 0, 1,
-0.6148075, -1.415707, -3.306729, 0.372549, 1, 0, 1,
-0.6138707, -0.3648743, -1.314645, 0.3686275, 1, 0, 1,
-0.6125385, 0.7913335, -0.3674875, 0.3607843, 1, 0, 1,
-0.6076788, 1.749902, 0.4903017, 0.3568628, 1, 0, 1,
-0.6075906, -1.8839, -3.415668, 0.3490196, 1, 0, 1,
-0.607349, -0.1101408, -1.866758, 0.345098, 1, 0, 1,
-0.6070146, -0.8843243, -2.313926, 0.3372549, 1, 0, 1,
-0.6043056, -1.336172, -3.320651, 0.3333333, 1, 0, 1,
-0.603987, 0.6863056, -0.05963011, 0.3254902, 1, 0, 1,
-0.602062, -0.7010733, -4.140399, 0.3215686, 1, 0, 1,
-0.5981872, -0.7203966, -1.513942, 0.3137255, 1, 0, 1,
-0.5977401, -0.8409333, -2.374822, 0.3098039, 1, 0, 1,
-0.597357, -0.4514042, -1.469868, 0.3019608, 1, 0, 1,
-0.5957042, 1.487097, -0.3874071, 0.2941177, 1, 0, 1,
-0.5921672, -0.7490733, -1.529295, 0.2901961, 1, 0, 1,
-0.5906966, 2.077007, -0.4340119, 0.282353, 1, 0, 1,
-0.5891115, 0.1801852, -2.480049, 0.2784314, 1, 0, 1,
-0.581677, -0.2552174, -2.226614, 0.2705882, 1, 0, 1,
-0.5810989, 0.7498021, 0.3701487, 0.2666667, 1, 0, 1,
-0.5801505, -0.2810623, -2.207394, 0.2588235, 1, 0, 1,
-0.5801131, 1.212636, 0.2624117, 0.254902, 1, 0, 1,
-0.579953, 0.1156983, -1.902223, 0.2470588, 1, 0, 1,
-0.5798429, -0.995354, -2.140861, 0.2431373, 1, 0, 1,
-0.5758693, 0.6586155, -2.563924, 0.2352941, 1, 0, 1,
-0.5719805, -1.107297, -2.651426, 0.2313726, 1, 0, 1,
-0.5663201, 0.8932377, -0.1305803, 0.2235294, 1, 0, 1,
-0.5650408, 0.5616491, -1.869657, 0.2196078, 1, 0, 1,
-0.5607374, -0.1632042, -4.193244, 0.2117647, 1, 0, 1,
-0.5592726, -0.2008383, -1.925291, 0.2078431, 1, 0, 1,
-0.5592196, 0.2653687, -1.02808, 0.2, 1, 0, 1,
-0.5581587, 0.3699635, 0.3638694, 0.1921569, 1, 0, 1,
-0.5579419, 1.940935, 0.3531632, 0.1882353, 1, 0, 1,
-0.5569314, 0.05461605, -0.9005825, 0.1803922, 1, 0, 1,
-0.55573, 0.9087044, -0.9771807, 0.1764706, 1, 0, 1,
-0.5546933, -0.03741731, -0.9220212, 0.1686275, 1, 0, 1,
-0.5482461, 0.1059601, -0.485714, 0.1647059, 1, 0, 1,
-0.5456005, 1.02017, 0.6437806, 0.1568628, 1, 0, 1,
-0.5412518, 1.199026, -1.519811, 0.1529412, 1, 0, 1,
-0.5285572, 0.6682592, -0.4950218, 0.145098, 1, 0, 1,
-0.5239543, 1.309704, 0.7431086, 0.1411765, 1, 0, 1,
-0.5148712, -1.817146, -3.508663, 0.1333333, 1, 0, 1,
-0.5107916, -1.138838, -2.73426, 0.1294118, 1, 0, 1,
-0.5092184, 0.6597207, -2.280819, 0.1215686, 1, 0, 1,
-0.50879, 0.6775607, -1.521537, 0.1176471, 1, 0, 1,
-0.5073705, 1.204672, -0.5897047, 0.1098039, 1, 0, 1,
-0.5034827, -0.05218291, -0.6409171, 0.1058824, 1, 0, 1,
-0.4952773, -0.546483, -2.611379, 0.09803922, 1, 0, 1,
-0.4849406, 0.4255801, -1.428592, 0.09019608, 1, 0, 1,
-0.4849167, -0.06962085, -1.418734, 0.08627451, 1, 0, 1,
-0.4820924, 0.9138212, -2.337136, 0.07843138, 1, 0, 1,
-0.4818541, 0.4761614, -1.511883, 0.07450981, 1, 0, 1,
-0.473616, 0.5883346, 0.7611834, 0.06666667, 1, 0, 1,
-0.4732935, 0.1937783, -2.48374, 0.0627451, 1, 0, 1,
-0.4730374, 0.902893, -1.118205, 0.05490196, 1, 0, 1,
-0.4687024, 0.0513846, -1.154636, 0.05098039, 1, 0, 1,
-0.4635162, -0.3082986, -2.259531, 0.04313726, 1, 0, 1,
-0.4596406, -1.650531, -3.915107, 0.03921569, 1, 0, 1,
-0.4593838, -0.6874928, -3.433501, 0.03137255, 1, 0, 1,
-0.4493949, -2.908967, -0.3478761, 0.02745098, 1, 0, 1,
-0.4479179, 0.7099562, -0.1645523, 0.01960784, 1, 0, 1,
-0.4447066, 1.514675, -0.4114677, 0.01568628, 1, 0, 1,
-0.4444721, 2.149933, -0.4032358, 0.007843138, 1, 0, 1,
-0.4427954, -1.405471, -2.019254, 0.003921569, 1, 0, 1,
-0.4425772, 1.111289, 0.5547369, 0, 1, 0.003921569, 1,
-0.4403643, -0.6587214, -2.503607, 0, 1, 0.01176471, 1,
-0.4362041, -0.5205455, -2.548621, 0, 1, 0.01568628, 1,
-0.4321542, -1.247992, -2.465838, 0, 1, 0.02352941, 1,
-0.4294112, 0.4174704, 0.1609359, 0, 1, 0.02745098, 1,
-0.4286841, -0.8413408, -2.621671, 0, 1, 0.03529412, 1,
-0.4277764, -1.002459, -1.704087, 0, 1, 0.03921569, 1,
-0.4252748, -0.8448511, -2.848908, 0, 1, 0.04705882, 1,
-0.4221492, -1.811249, -2.447635, 0, 1, 0.05098039, 1,
-0.415434, -0.9252901, -4.079736, 0, 1, 0.05882353, 1,
-0.4147125, 1.10348, -1.218063, 0, 1, 0.0627451, 1,
-0.4141898, -0.7753077, -1.571305, 0, 1, 0.07058824, 1,
-0.4081385, -0.8051395, -2.608491, 0, 1, 0.07450981, 1,
-0.405119, -0.395344, -2.644116, 0, 1, 0.08235294, 1,
-0.3933462, 0.4834871, 0.2795832, 0, 1, 0.08627451, 1,
-0.3932488, -0.05560825, -1.694752, 0, 1, 0.09411765, 1,
-0.3916166, 0.4862636, -0.9455748, 0, 1, 0.1019608, 1,
-0.3886302, -0.1552874, -0.2426752, 0, 1, 0.1058824, 1,
-0.3862948, 0.3995671, 0.3580811, 0, 1, 0.1137255, 1,
-0.3862925, 1.880594, -0.07428897, 0, 1, 0.1176471, 1,
-0.3857744, 0.1809163, -0.8385283, 0, 1, 0.1254902, 1,
-0.3789017, -0.5769206, -2.203827, 0, 1, 0.1294118, 1,
-0.3784311, -1.847909, -1.940837, 0, 1, 0.1372549, 1,
-0.3735495, 1.251685, -0.8080947, 0, 1, 0.1411765, 1,
-0.3733824, 0.1096197, -0.7309236, 0, 1, 0.1490196, 1,
-0.3717897, -0.1712871, -0.9818649, 0, 1, 0.1529412, 1,
-0.3716808, -0.4548689, -3.963187, 0, 1, 0.1607843, 1,
-0.3701837, -0.7698195, -2.682574, 0, 1, 0.1647059, 1,
-0.3682662, 0.1817403, 0.2269807, 0, 1, 0.172549, 1,
-0.3647726, -1.362894, -3.071334, 0, 1, 0.1764706, 1,
-0.3637755, -1.353641, -3.228942, 0, 1, 0.1843137, 1,
-0.360746, -0.08481614, -1.922977, 0, 1, 0.1882353, 1,
-0.3584129, 0.537348, -1.031438, 0, 1, 0.1960784, 1,
-0.352526, -1.396895, -1.744815, 0, 1, 0.2039216, 1,
-0.3520888, -1.211965, -0.5503994, 0, 1, 0.2078431, 1,
-0.3506209, 0.7923679, 2.077556, 0, 1, 0.2156863, 1,
-0.3479066, 0.490775, -1.612743, 0, 1, 0.2196078, 1,
-0.3437279, -1.198084, -3.386234, 0, 1, 0.227451, 1,
-0.3357354, 1.508689, 0.6957058, 0, 1, 0.2313726, 1,
-0.3336608, 0.5376057, -0.3415162, 0, 1, 0.2392157, 1,
-0.3330518, 1.443787, 1.647653, 0, 1, 0.2431373, 1,
-0.331842, 0.2561018, -0.4014548, 0, 1, 0.2509804, 1,
-0.3267332, -1.8878, -4.226925, 0, 1, 0.254902, 1,
-0.3221078, -0.4445044, -2.246857, 0, 1, 0.2627451, 1,
-0.3219579, 0.9668663, -0.09885699, 0, 1, 0.2666667, 1,
-0.3213444, -0.7136692, -2.114031, 0, 1, 0.2745098, 1,
-0.3193938, -1.73006, -3.711075, 0, 1, 0.2784314, 1,
-0.3187721, -0.08779398, -1.403217, 0, 1, 0.2862745, 1,
-0.3166823, 0.2079265, 1.386583, 0, 1, 0.2901961, 1,
-0.3118972, -0.5874172, -0.9264053, 0, 1, 0.2980392, 1,
-0.3115605, -0.55337, -2.833164, 0, 1, 0.3058824, 1,
-0.3078942, -0.1765358, -2.649625, 0, 1, 0.3098039, 1,
-0.3052166, 0.1329029, -2.221631, 0, 1, 0.3176471, 1,
-0.3042684, -0.5874551, -2.601124, 0, 1, 0.3215686, 1,
-0.2953809, 1.002462, -1.788438, 0, 1, 0.3294118, 1,
-0.294239, -1.012931, -2.201319, 0, 1, 0.3333333, 1,
-0.2873489, 0.3141491, 0.03060822, 0, 1, 0.3411765, 1,
-0.282431, 0.04381738, -1.875971, 0, 1, 0.345098, 1,
-0.2813425, -0.03343523, -1.108986, 0, 1, 0.3529412, 1,
-0.2779553, -1.048321, -2.042088, 0, 1, 0.3568628, 1,
-0.2720473, -0.5680075, -2.688639, 0, 1, 0.3647059, 1,
-0.2628453, 2.048343, -0.9247594, 0, 1, 0.3686275, 1,
-0.2626077, 1.088205, -0.8972656, 0, 1, 0.3764706, 1,
-0.2624295, -1.104627, -0.5445317, 0, 1, 0.3803922, 1,
-0.2619136, 0.4979094, -1.275688, 0, 1, 0.3882353, 1,
-0.2602081, 1.119793, 1.451079, 0, 1, 0.3921569, 1,
-0.2581273, 0.762423, 0.07489672, 0, 1, 0.4, 1,
-0.2579021, -0.01295179, -1.307788, 0, 1, 0.4078431, 1,
-0.2560669, 0.06872113, -1.635398, 0, 1, 0.4117647, 1,
-0.2476577, -1.489657, -0.1070685, 0, 1, 0.4196078, 1,
-0.2475837, -2.029767, -3.588496, 0, 1, 0.4235294, 1,
-0.2466966, -0.2982435, -1.977406, 0, 1, 0.4313726, 1,
-0.245164, -0.6823539, -1.504638, 0, 1, 0.4352941, 1,
-0.2447217, -0.5055192, -2.165922, 0, 1, 0.4431373, 1,
-0.2434087, 0.528516, -1.061659, 0, 1, 0.4470588, 1,
-0.2434039, -0.2520116, -3.01437, 0, 1, 0.454902, 1,
-0.2375047, 1.369436, -0.2813878, 0, 1, 0.4588235, 1,
-0.2344811, -0.9140372, -2.722113, 0, 1, 0.4666667, 1,
-0.2334889, 0.1076143, -3.378257, 0, 1, 0.4705882, 1,
-0.2326158, -1.539617, -3.725934, 0, 1, 0.4784314, 1,
-0.2277045, -0.7147815, -3.432958, 0, 1, 0.4823529, 1,
-0.227268, -0.4431595, -3.444859, 0, 1, 0.4901961, 1,
-0.2192484, 1.412374, -0.4961409, 0, 1, 0.4941176, 1,
-0.2148221, 0.9029518, -2.187299, 0, 1, 0.5019608, 1,
-0.2080803, -1.344208, -1.995712, 0, 1, 0.509804, 1,
-0.2069283, 2.127056, -0.8630967, 0, 1, 0.5137255, 1,
-0.2060775, -0.3343899, -2.753518, 0, 1, 0.5215687, 1,
-0.2018697, -2.017021, -3.12143, 0, 1, 0.5254902, 1,
-0.1981449, 0.9662731, -0.8661325, 0, 1, 0.5333334, 1,
-0.1968766, 0.284503, -1.673151, 0, 1, 0.5372549, 1,
-0.1966811, 0.2064739, 0.303979, 0, 1, 0.5450981, 1,
-0.1963095, 0.02313402, -1.813122, 0, 1, 0.5490196, 1,
-0.1920977, -0.8778705, -3.127201, 0, 1, 0.5568628, 1,
-0.1899666, 0.9676691, -0.8288198, 0, 1, 0.5607843, 1,
-0.1899447, -0.8931096, -2.314336, 0, 1, 0.5686275, 1,
-0.1888447, 0.8586172, -1.753857, 0, 1, 0.572549, 1,
-0.1864349, 2.057156, -0.4994222, 0, 1, 0.5803922, 1,
-0.185467, -1.614666, -2.417686, 0, 1, 0.5843138, 1,
-0.1854066, 0.5055894, 0.5504251, 0, 1, 0.5921569, 1,
-0.1853585, -0.8357248, -3.951775, 0, 1, 0.5960785, 1,
-0.184627, 1.057496, -0.05444844, 0, 1, 0.6039216, 1,
-0.1834596, 1.497925, -1.59772, 0, 1, 0.6117647, 1,
-0.1808691, 0.4472444, -0.8205955, 0, 1, 0.6156863, 1,
-0.1792694, 0.8313895, 0.2963381, 0, 1, 0.6235294, 1,
-0.1689861, 0.1933298, -0.3903442, 0, 1, 0.627451, 1,
-0.1672289, 1.087823, -0.247673, 0, 1, 0.6352941, 1,
-0.1669438, -1.29892, -2.315642, 0, 1, 0.6392157, 1,
-0.1662427, -0.3467635, -1.055576, 0, 1, 0.6470588, 1,
-0.1573806, -0.4393774, -3.75135, 0, 1, 0.6509804, 1,
-0.1552599, -1.087115, -3.420199, 0, 1, 0.6588235, 1,
-0.1547099, 0.2930908, 1.211154, 0, 1, 0.6627451, 1,
-0.1487631, -1.498205, -4.485813, 0, 1, 0.6705883, 1,
-0.1469914, -0.1175884, -1.575879, 0, 1, 0.6745098, 1,
-0.1457476, -1.382394, -3.181049, 0, 1, 0.682353, 1,
-0.1454129, 1.224461, -0.2555266, 0, 1, 0.6862745, 1,
-0.142202, -0.6507311, -4.056351, 0, 1, 0.6941177, 1,
-0.1411588, 1.871315, 0.5052783, 0, 1, 0.7019608, 1,
-0.1398907, -0.3836074, -3.26131, 0, 1, 0.7058824, 1,
-0.1394516, -0.669364, -3.257902, 0, 1, 0.7137255, 1,
-0.1387735, 0.02683939, -1.860348, 0, 1, 0.7176471, 1,
-0.1362043, -0.66527, -3.717368, 0, 1, 0.7254902, 1,
-0.127966, -1.387765, -3.54666, 0, 1, 0.7294118, 1,
-0.1259689, 1.032168, 0.1614497, 0, 1, 0.7372549, 1,
-0.1239402, 1.482257, 0.06214223, 0, 1, 0.7411765, 1,
-0.1212619, 1.152035, -0.8835394, 0, 1, 0.7490196, 1,
-0.1204377, 0.0933585, -1.594313, 0, 1, 0.7529412, 1,
-0.1155596, 0.9480888, -0.1632877, 0, 1, 0.7607843, 1,
-0.114916, 1.012779, -0.200541, 0, 1, 0.7647059, 1,
-0.1138118, -0.5694966, -4.339477, 0, 1, 0.772549, 1,
-0.1115643, 0.132045, -0.7479544, 0, 1, 0.7764706, 1,
-0.1112778, -1.782699, -2.420478, 0, 1, 0.7843137, 1,
-0.1109386, 0.4170236, 0.6949666, 0, 1, 0.7882353, 1,
-0.1089751, 0.1726986, -2.656172, 0, 1, 0.7960784, 1,
-0.1070342, 0.3761979, -1.045825, 0, 1, 0.8039216, 1,
-0.1064778, 1.850084, -0.08687348, 0, 1, 0.8078431, 1,
-0.1032212, -1.233981, -3.44351, 0, 1, 0.8156863, 1,
-0.1004109, -0.3949585, -3.578923, 0, 1, 0.8196079, 1,
-0.09358495, -1.50397, -4.380258, 0, 1, 0.827451, 1,
-0.08906052, -0.05204663, -1.925228, 0, 1, 0.8313726, 1,
-0.08785649, 0.08531127, -0.7722345, 0, 1, 0.8392157, 1,
-0.08616955, 1.117409, 0.4800763, 0, 1, 0.8431373, 1,
-0.08574498, -0.2979437, -2.257252, 0, 1, 0.8509804, 1,
-0.08453735, 0.7754989, -1.779931, 0, 1, 0.854902, 1,
-0.08431542, 0.08455437, 0.6981137, 0, 1, 0.8627451, 1,
-0.08177205, -1.308018, -3.600211, 0, 1, 0.8666667, 1,
-0.07996085, 0.4438245, 0.06852281, 0, 1, 0.8745098, 1,
-0.07598778, 0.8587889, -0.2933328, 0, 1, 0.8784314, 1,
-0.07513217, -0.6425626, -1.434488, 0, 1, 0.8862745, 1,
-0.07413252, -1.881747, -4.28009, 0, 1, 0.8901961, 1,
-0.07136362, 0.07338162, -1.866345, 0, 1, 0.8980392, 1,
-0.06831042, 0.4822024, -1.603291, 0, 1, 0.9058824, 1,
-0.06677049, 0.525479, -0.001084951, 0, 1, 0.9098039, 1,
-0.06573224, -0.1752157, -2.721804, 0, 1, 0.9176471, 1,
-0.06474537, 0.4740293, 0.3650981, 0, 1, 0.9215686, 1,
-0.06359957, 0.7284727, 0.3449925, 0, 1, 0.9294118, 1,
-0.06221948, -1.48201, -3.290896, 0, 1, 0.9333333, 1,
-0.06184722, 0.4265636, -2.152209, 0, 1, 0.9411765, 1,
-0.05934077, 0.06679688, -0.6388463, 0, 1, 0.945098, 1,
-0.05885839, 0.8211593, -0.4797657, 0, 1, 0.9529412, 1,
-0.05768191, -0.5472426, -1.986164, 0, 1, 0.9568627, 1,
-0.05162241, -0.01086463, -1.422522, 0, 1, 0.9647059, 1,
-0.05060617, 0.2068978, -2.530297, 0, 1, 0.9686275, 1,
-0.05055651, 0.4621978, 0.1937455, 0, 1, 0.9764706, 1,
-0.04976247, 0.315495, 0.06099116, 0, 1, 0.9803922, 1,
-0.04356848, 0.1044302, -0.3785393, 0, 1, 0.9882353, 1,
-0.0429424, -0.8185933, -4.562238, 0, 1, 0.9921569, 1,
-0.04278444, -0.8475875, -2.706533, 0, 1, 1, 1,
-0.04137023, 0.2464228, -0.936682, 0, 0.9921569, 1, 1,
-0.04086289, -0.7152008, -1.670139, 0, 0.9882353, 1, 1,
-0.04072745, 0.6830028, 0.8010191, 0, 0.9803922, 1, 1,
-0.04031047, -1.015389, -2.216321, 0, 0.9764706, 1, 1,
-0.03870163, -1.516977, -3.657855, 0, 0.9686275, 1, 1,
-0.03731115, -0.8817558, -2.734938, 0, 0.9647059, 1, 1,
-0.03685948, -0.7169158, -2.577479, 0, 0.9568627, 1, 1,
-0.03258797, -0.6323963, -1.727632, 0, 0.9529412, 1, 1,
-0.02815654, 0.5024208, -0.3107884, 0, 0.945098, 1, 1,
-0.02736459, -0.7587754, -3.020569, 0, 0.9411765, 1, 1,
-0.02569926, -1.857487, -3.484125, 0, 0.9333333, 1, 1,
-0.0208931, 1.396617, 0.4460003, 0, 0.9294118, 1, 1,
-0.01795355, -0.08937025, -3.409448, 0, 0.9215686, 1, 1,
-0.0148145, 0.01017929, -0.6271725, 0, 0.9176471, 1, 1,
-0.01062217, -1.941549, -5.090483, 0, 0.9098039, 1, 1,
-0.009145298, 0.2203624, -0.2681127, 0, 0.9058824, 1, 1,
-0.008294174, -0.2427569, -4.005248, 0, 0.8980392, 1, 1,
-0.008082295, -0.0312278, -3.082194, 0, 0.8901961, 1, 1,
0.001502282, 1.185793, 0.3245985, 0, 0.8862745, 1, 1,
0.00286891, 0.8810092, -0.6202788, 0, 0.8784314, 1, 1,
0.007143672, -1.611726, 1.698469, 0, 0.8745098, 1, 1,
0.0111321, 0.6943209, -0.9097177, 0, 0.8666667, 1, 1,
0.01113433, 1.289018, -0.3875456, 0, 0.8627451, 1, 1,
0.01405753, -0.602103, 1.936041, 0, 0.854902, 1, 1,
0.02079358, -1.377832, 3.845832, 0, 0.8509804, 1, 1,
0.02105823, -1.163196, 2.870086, 0, 0.8431373, 1, 1,
0.02289223, -0.3473224, 3.608322, 0, 0.8392157, 1, 1,
0.02443847, -0.04025598, 3.442422, 0, 0.8313726, 1, 1,
0.02660301, -0.8839957, 3.970146, 0, 0.827451, 1, 1,
0.02839083, -0.02005822, 1.201745, 0, 0.8196079, 1, 1,
0.02862693, -0.02257324, 2.252694, 0, 0.8156863, 1, 1,
0.02897871, 0.1333633, 0.2143512, 0, 0.8078431, 1, 1,
0.03019891, 0.4273572, -0.2066663, 0, 0.8039216, 1, 1,
0.03503647, -0.7979928, 4.191876, 0, 0.7960784, 1, 1,
0.03581478, -2.649494, 2.977027, 0, 0.7882353, 1, 1,
0.03653905, 0.4185373, -1.700115, 0, 0.7843137, 1, 1,
0.0390404, 0.9446996, -0.6910576, 0, 0.7764706, 1, 1,
0.03905847, -0.9838569, 1.466041, 0, 0.772549, 1, 1,
0.04194799, 0.3519854, 1.314143, 0, 0.7647059, 1, 1,
0.05298206, 0.05913538, -1.427082, 0, 0.7607843, 1, 1,
0.05332937, -0.9377766, 3.7327, 0, 0.7529412, 1, 1,
0.05343234, 1.190508, -0.1202622, 0, 0.7490196, 1, 1,
0.05376225, 0.7790696, 0.2423154, 0, 0.7411765, 1, 1,
0.05543929, 1.569416, -1.332136, 0, 0.7372549, 1, 1,
0.05624387, 0.574379, -1.144292, 0, 0.7294118, 1, 1,
0.06819674, 1.540965, 0.1893293, 0, 0.7254902, 1, 1,
0.06911147, -0.202205, 3.415976, 0, 0.7176471, 1, 1,
0.07048092, 1.51794, 0.4581361, 0, 0.7137255, 1, 1,
0.07663918, 1.124457, -0.8219269, 0, 0.7058824, 1, 1,
0.07799462, -0.5185274, 3.742399, 0, 0.6980392, 1, 1,
0.08869876, -0.9763276, 1.866204, 0, 0.6941177, 1, 1,
0.09057451, -0.4339519, 3.534717, 0, 0.6862745, 1, 1,
0.0971413, -0.1714606, 3.490761, 0, 0.682353, 1, 1,
0.09833588, -0.1415859, 3.20779, 0, 0.6745098, 1, 1,
0.09928498, -0.3033896, 4.04616, 0, 0.6705883, 1, 1,
0.1092564, -0.7676853, 1.708733, 0, 0.6627451, 1, 1,
0.1106979, 0.1073549, 1.529686, 0, 0.6588235, 1, 1,
0.1131845, -1.274855, 2.675665, 0, 0.6509804, 1, 1,
0.1139002, 0.3875389, -0.1089736, 0, 0.6470588, 1, 1,
0.1176924, 1.232225, 0.24725, 0, 0.6392157, 1, 1,
0.1186223, 0.9239376, 0.1261618, 0, 0.6352941, 1, 1,
0.119472, 0.8953591, -0.8098865, 0, 0.627451, 1, 1,
0.1195741, 0.7368831, 1.479091, 0, 0.6235294, 1, 1,
0.1217142, -1.565112, 1.78537, 0, 0.6156863, 1, 1,
0.1308008, 0.8794722, -0.1643443, 0, 0.6117647, 1, 1,
0.1438916, 0.9930645, 0.6623363, 0, 0.6039216, 1, 1,
0.1480557, -0.8352875, 1.393551, 0, 0.5960785, 1, 1,
0.1507211, -0.0612356, 2.627738, 0, 0.5921569, 1, 1,
0.1525458, -0.3332923, 2.516714, 0, 0.5843138, 1, 1,
0.1527802, 0.3529506, -0.5884117, 0, 0.5803922, 1, 1,
0.1567119, -2.407939, 2.539973, 0, 0.572549, 1, 1,
0.1570893, 0.3479002, 0.03805441, 0, 0.5686275, 1, 1,
0.1602224, -0.03709453, 1.821307, 0, 0.5607843, 1, 1,
0.1637911, 0.7164913, 0.02745208, 0, 0.5568628, 1, 1,
0.1655437, -0.2869407, 3.220958, 0, 0.5490196, 1, 1,
0.1758239, -0.2627127, 0.5163091, 0, 0.5450981, 1, 1,
0.17685, 0.5787815, 0.2777227, 0, 0.5372549, 1, 1,
0.1788604, 1.104977, -0.5801054, 0, 0.5333334, 1, 1,
0.1794298, -0.6839343, 3.730457, 0, 0.5254902, 1, 1,
0.1820497, -1.208508, 0.4363463, 0, 0.5215687, 1, 1,
0.1850437, -1.583692, 1.937796, 0, 0.5137255, 1, 1,
0.1880181, -1.012997, 2.414926, 0, 0.509804, 1, 1,
0.1912104, 0.701372, -0.5271983, 0, 0.5019608, 1, 1,
0.1918763, 1.267008, -0.6151323, 0, 0.4941176, 1, 1,
0.1988038, 0.2022154, 0.5163636, 0, 0.4901961, 1, 1,
0.1997764, -0.1070014, 1.564515, 0, 0.4823529, 1, 1,
0.2000287, -0.701865, 2.131154, 0, 0.4784314, 1, 1,
0.2009833, -1.163509, 3.193627, 0, 0.4705882, 1, 1,
0.2026212, 1.308025, -0.4505072, 0, 0.4666667, 1, 1,
0.2031063, -0.08421677, 1.141881, 0, 0.4588235, 1, 1,
0.2054482, 2.167695, -0.2869375, 0, 0.454902, 1, 1,
0.2075535, -1.351791, 2.083512, 0, 0.4470588, 1, 1,
0.210486, -0.3695431, 3.591878, 0, 0.4431373, 1, 1,
0.2122319, 1.170018, -0.03878272, 0, 0.4352941, 1, 1,
0.215042, 0.08084151, 1.63554, 0, 0.4313726, 1, 1,
0.2167349, 2.104497, -1.976447, 0, 0.4235294, 1, 1,
0.2179822, 2.088016, 0.7681273, 0, 0.4196078, 1, 1,
0.2186466, 0.2546423, 1.30242, 0, 0.4117647, 1, 1,
0.21882, -0.5854934, 2.889411, 0, 0.4078431, 1, 1,
0.2205045, -1.558679, 3.254776, 0, 0.4, 1, 1,
0.2222532, -0.4987416, 2.29142, 0, 0.3921569, 1, 1,
0.2226413, 1.664898, -1.397761, 0, 0.3882353, 1, 1,
0.2238333, 0.9592571, 0.3308141, 0, 0.3803922, 1, 1,
0.2251692, -0.2951493, 1.840714, 0, 0.3764706, 1, 1,
0.2252823, 0.3613092, 1.256542, 0, 0.3686275, 1, 1,
0.2272799, 0.5673032, 0.4611946, 0, 0.3647059, 1, 1,
0.2273487, 1.126807, 0.4711785, 0, 0.3568628, 1, 1,
0.2275081, 0.2053795, 0.692314, 0, 0.3529412, 1, 1,
0.2300832, -0.4848324, 3.73495, 0, 0.345098, 1, 1,
0.2324573, 1.079942, 1.554834, 0, 0.3411765, 1, 1,
0.2392204, 0.5777475, 1.341284, 0, 0.3333333, 1, 1,
0.2393431, -0.09342563, 1.394483, 0, 0.3294118, 1, 1,
0.2394976, -0.4695747, 2.938077, 0, 0.3215686, 1, 1,
0.2398104, 2.006087, -0.4213576, 0, 0.3176471, 1, 1,
0.2421843, 1.28466, 1.547936, 0, 0.3098039, 1, 1,
0.2435639, -0.09201381, 1.193678, 0, 0.3058824, 1, 1,
0.244745, 0.7724972, 0.5362268, 0, 0.2980392, 1, 1,
0.2475933, -0.6843996, 3.426771, 0, 0.2901961, 1, 1,
0.2502863, 0.1722219, 0.2451597, 0, 0.2862745, 1, 1,
0.2528606, 2.094998, 0.01144718, 0, 0.2784314, 1, 1,
0.2531979, -1.080465, 3.357255, 0, 0.2745098, 1, 1,
0.2540428, 2.027253, 1.152051, 0, 0.2666667, 1, 1,
0.2558545, 0.5651731, 1.102601, 0, 0.2627451, 1, 1,
0.2575334, 1.275718, 0.8103709, 0, 0.254902, 1, 1,
0.2577943, 0.6257591, 1.545937, 0, 0.2509804, 1, 1,
0.2656378, 1.073175, -0.06516188, 0, 0.2431373, 1, 1,
0.2659151, 1.887457, 1.040124, 0, 0.2392157, 1, 1,
0.2667021, -0.8315995, 3.195684, 0, 0.2313726, 1, 1,
0.2714806, -1.213254, 4.594273, 0, 0.227451, 1, 1,
0.2726808, 0.2918872, -0.901297, 0, 0.2196078, 1, 1,
0.2751785, 0.9271006, 1.440674, 0, 0.2156863, 1, 1,
0.2768095, 0.6134812, 1.918107, 0, 0.2078431, 1, 1,
0.2781803, -0.3854989, 2.17553, 0, 0.2039216, 1, 1,
0.2788307, 0.2345918, -0.8526971, 0, 0.1960784, 1, 1,
0.280714, 1.693444, 1.68899, 0, 0.1882353, 1, 1,
0.2838864, -0.2527267, 3.211071, 0, 0.1843137, 1, 1,
0.2909277, -0.06229495, 1.859929, 0, 0.1764706, 1, 1,
0.2998745, 0.5695451, -0.1604572, 0, 0.172549, 1, 1,
0.3089283, -0.8259006, 3.599154, 0, 0.1647059, 1, 1,
0.3107933, -1.353837, 3.618215, 0, 0.1607843, 1, 1,
0.3137676, -2.286754, 3.141371, 0, 0.1529412, 1, 1,
0.3154341, 0.03029608, 1.785752, 0, 0.1490196, 1, 1,
0.3172159, -1.018962, 3.95982, 0, 0.1411765, 1, 1,
0.3225214, -0.6078241, 3.030153, 0, 0.1372549, 1, 1,
0.3312212, 0.1266747, 1.809587, 0, 0.1294118, 1, 1,
0.3375989, 0.2654809, 1.336451, 0, 0.1254902, 1, 1,
0.3454461, 0.01320441, 3.10357, 0, 0.1176471, 1, 1,
0.3460802, 2.123319, 0.3993527, 0, 0.1137255, 1, 1,
0.3472901, -0.2593767, 2.603444, 0, 0.1058824, 1, 1,
0.3491592, 1.551155, 1.39627, 0, 0.09803922, 1, 1,
0.3519332, 0.3668931, 0.2710491, 0, 0.09411765, 1, 1,
0.3528645, 1.64757, 0.3759717, 0, 0.08627451, 1, 1,
0.3605862, -0.6465723, 4.08649, 0, 0.08235294, 1, 1,
0.3628138, 0.211301, 1.976463, 0, 0.07450981, 1, 1,
0.368024, 0.07729402, -1.305991, 0, 0.07058824, 1, 1,
0.3700143, -0.4421977, 1.823555, 0, 0.0627451, 1, 1,
0.3738644, 0.917667, 0.7456576, 0, 0.05882353, 1, 1,
0.3750227, -0.6579132, 1.934158, 0, 0.05098039, 1, 1,
0.3765421, 0.3496705, 0.1617404, 0, 0.04705882, 1, 1,
0.3769178, -1.40622, 3.824255, 0, 0.03921569, 1, 1,
0.3769825, -0.03501925, 2.792746, 0, 0.03529412, 1, 1,
0.3770403, 0.2130767, 0.6960868, 0, 0.02745098, 1, 1,
0.3783531, 1.179347, -0.8948986, 0, 0.02352941, 1, 1,
0.3801068, 0.08075271, 1.510818, 0, 0.01568628, 1, 1,
0.3805292, -0.9714333, 3.128165, 0, 0.01176471, 1, 1,
0.3807349, -0.8187082, 2.310494, 0, 0.003921569, 1, 1,
0.3894157, -0.9078528, 4.139951, 0.003921569, 0, 1, 1,
0.3999921, -1.420866, 2.258439, 0.007843138, 0, 1, 1,
0.4036548, 1.032195, 0.06115455, 0.01568628, 0, 1, 1,
0.4055662, 0.8806304, -0.1002783, 0.01960784, 0, 1, 1,
0.4059842, 0.5373424, 1.43048, 0.02745098, 0, 1, 1,
0.4103116, -0.5682546, 2.775057, 0.03137255, 0, 1, 1,
0.4144232, -1.261983, 3.177341, 0.03921569, 0, 1, 1,
0.4198326, 0.3001608, 0.4318776, 0.04313726, 0, 1, 1,
0.4206455, 1.32434, 0.5384234, 0.05098039, 0, 1, 1,
0.4250412, 0.6790079, 0.9495823, 0.05490196, 0, 1, 1,
0.4277188, 0.599884, -1.547449, 0.0627451, 0, 1, 1,
0.4288862, 0.5298041, 0.6718986, 0.06666667, 0, 1, 1,
0.4345523, -2.316237, 3.117999, 0.07450981, 0, 1, 1,
0.4360469, 1.578956, 1.063581, 0.07843138, 0, 1, 1,
0.4373546, -0.6339372, 1.881345, 0.08627451, 0, 1, 1,
0.4402218, 0.3586658, -0.1344719, 0.09019608, 0, 1, 1,
0.4421353, 0.417208, -0.3059238, 0.09803922, 0, 1, 1,
0.4434038, 0.4446686, 1.685422, 0.1058824, 0, 1, 1,
0.4437424, 0.1394829, 1.251209, 0.1098039, 0, 1, 1,
0.4554157, 1.034963, -0.970443, 0.1176471, 0, 1, 1,
0.4571927, 0.01490779, 3.650884, 0.1215686, 0, 1, 1,
0.4585746, -1.112015, 1.465368, 0.1294118, 0, 1, 1,
0.4597168, -1.143185, 4.257988, 0.1333333, 0, 1, 1,
0.4627567, -0.178317, 3.959747, 0.1411765, 0, 1, 1,
0.470383, 0.09750804, 1.006414, 0.145098, 0, 1, 1,
0.4708059, 0.01319043, 1.325243, 0.1529412, 0, 1, 1,
0.4722655, -1.342456, 3.028339, 0.1568628, 0, 1, 1,
0.4728436, 0.836701, -0.2441977, 0.1647059, 0, 1, 1,
0.4776565, -0.5402638, 4.216644, 0.1686275, 0, 1, 1,
0.478086, 1.81623, 1.777031, 0.1764706, 0, 1, 1,
0.4825046, 2.433442, 1.652714, 0.1803922, 0, 1, 1,
0.4899006, 0.7998234, -0.08654501, 0.1882353, 0, 1, 1,
0.4927469, 0.7820918, 2.87535, 0.1921569, 0, 1, 1,
0.4931205, -0.3152712, 3.589688, 0.2, 0, 1, 1,
0.4992237, 1.478314, 0.472243, 0.2078431, 0, 1, 1,
0.505617, -1.724104, 2.857415, 0.2117647, 0, 1, 1,
0.5150321, -1.599892, 3.182954, 0.2196078, 0, 1, 1,
0.5193903, -0.2545997, 1.996478, 0.2235294, 0, 1, 1,
0.5217299, 0.836283, -0.1615343, 0.2313726, 0, 1, 1,
0.527231, -0.592538, 0.447876, 0.2352941, 0, 1, 1,
0.5316824, -0.2749417, 1.174338, 0.2431373, 0, 1, 1,
0.5338489, 0.6985798, 0.8768486, 0.2470588, 0, 1, 1,
0.5340347, 0.222606, 1.666598, 0.254902, 0, 1, 1,
0.5357271, 1.124286, 0.4003719, 0.2588235, 0, 1, 1,
0.5357834, -0.1615535, 2.147312, 0.2666667, 0, 1, 1,
0.5389994, 0.05809877, 0.4914482, 0.2705882, 0, 1, 1,
0.5411958, -0.8312096, 2.681732, 0.2784314, 0, 1, 1,
0.5437335, -0.9476722, 2.332618, 0.282353, 0, 1, 1,
0.5454596, -1.778478, 2.951715, 0.2901961, 0, 1, 1,
0.5458916, 0.4971042, 1.288126, 0.2941177, 0, 1, 1,
0.5468016, 1.230352, 0.03309304, 0.3019608, 0, 1, 1,
0.5487143, -2.666587, 1.307678, 0.3098039, 0, 1, 1,
0.5496697, -0.9240984, -0.4291189, 0.3137255, 0, 1, 1,
0.5604669, -0.5854343, 3.248589, 0.3215686, 0, 1, 1,
0.5606511, 0.0462748, 1.497518, 0.3254902, 0, 1, 1,
0.56172, 0.9800607, -0.0247631, 0.3333333, 0, 1, 1,
0.5645143, -0.4972977, 2.443419, 0.3372549, 0, 1, 1,
0.5692975, -0.8465027, 3.074742, 0.345098, 0, 1, 1,
0.5809221, -3.412692, 1.81374, 0.3490196, 0, 1, 1,
0.5847238, -0.1386894, 2.219472, 0.3568628, 0, 1, 1,
0.5861967, 0.105714, 2.083763, 0.3607843, 0, 1, 1,
0.5866999, -0.3600716, 1.14964, 0.3686275, 0, 1, 1,
0.5978096, -0.6097183, 2.607068, 0.372549, 0, 1, 1,
0.5993022, 2.01021, -0.043432, 0.3803922, 0, 1, 1,
0.6005305, 0.3081513, 0.9984816, 0.3843137, 0, 1, 1,
0.6022106, -1.258756, 4.989325, 0.3921569, 0, 1, 1,
0.6038298, 0.2618833, 1.025277, 0.3960784, 0, 1, 1,
0.6043122, -0.7216401, 2.767322, 0.4039216, 0, 1, 1,
0.6051403, 1.241538, 0.5825281, 0.4117647, 0, 1, 1,
0.6088259, -1.137866, 3.42811, 0.4156863, 0, 1, 1,
0.6144534, -1.130497, 3.142246, 0.4235294, 0, 1, 1,
0.6150576, -1.075633, 2.604094, 0.427451, 0, 1, 1,
0.6185537, 0.7522598, 0.4187058, 0.4352941, 0, 1, 1,
0.6232774, -0.2404979, 2.045103, 0.4392157, 0, 1, 1,
0.6293126, -0.287561, 1.583597, 0.4470588, 0, 1, 1,
0.6303169, 0.663655, 1.242836, 0.4509804, 0, 1, 1,
0.6314626, -1.769067, 1.97313, 0.4588235, 0, 1, 1,
0.6325119, 2.397397, -0.4213071, 0.4627451, 0, 1, 1,
0.6327528, 0.1656525, 2.84564, 0.4705882, 0, 1, 1,
0.6338372, 1.732914, 0.41431, 0.4745098, 0, 1, 1,
0.6344369, 1.16534, 2.74681, 0.4823529, 0, 1, 1,
0.6361429, 0.2937873, 1.956865, 0.4862745, 0, 1, 1,
0.6370318, 0.03654574, 1.389366, 0.4941176, 0, 1, 1,
0.6409687, 1.037916, -1.034923, 0.5019608, 0, 1, 1,
0.6413597, 1.020456, -0.235715, 0.5058824, 0, 1, 1,
0.643789, -1.482835, 1.959987, 0.5137255, 0, 1, 1,
0.6462384, 0.07786193, 0.9535661, 0.5176471, 0, 1, 1,
0.6511737, 1.268863, 1.421645, 0.5254902, 0, 1, 1,
0.6538586, 1.077626, 2.475969, 0.5294118, 0, 1, 1,
0.6542457, -0.568558, 3.0317, 0.5372549, 0, 1, 1,
0.6563258, 0.1630664, 0.03558401, 0.5411765, 0, 1, 1,
0.6580012, -1.304601, 3.490898, 0.5490196, 0, 1, 1,
0.6648802, -0.2960607, 2.287462, 0.5529412, 0, 1, 1,
0.6719908, 0.2097175, 0.5374368, 0.5607843, 0, 1, 1,
0.6790867, 1.434363, -0.1529901, 0.5647059, 0, 1, 1,
0.679682, -0.2900751, 0.1364738, 0.572549, 0, 1, 1,
0.6850969, 1.487243, 0.5462942, 0.5764706, 0, 1, 1,
0.6888028, -1.938123, 1.462895, 0.5843138, 0, 1, 1,
0.6922972, -1.140569, 1.01586, 0.5882353, 0, 1, 1,
0.6940348, 0.4202568, 1.801609, 0.5960785, 0, 1, 1,
0.6961317, 0.4405965, 1.175559, 0.6039216, 0, 1, 1,
0.696399, 1.076338, -0.04909355, 0.6078432, 0, 1, 1,
0.6986309, 0.2320987, 1.497785, 0.6156863, 0, 1, 1,
0.699266, -0.3075703, 1.764283, 0.6196079, 0, 1, 1,
0.704658, -0.4857835, 3.750251, 0.627451, 0, 1, 1,
0.7068776, -1.140435, 2.853424, 0.6313726, 0, 1, 1,
0.7096869, 1.615921, 1.003698, 0.6392157, 0, 1, 1,
0.7219634, -0.4775148, 1.167028, 0.6431373, 0, 1, 1,
0.7230332, -0.9951249, 3.223665, 0.6509804, 0, 1, 1,
0.7273214, 0.4587321, 1.326599, 0.654902, 0, 1, 1,
0.7319826, 0.283838, 0.6746778, 0.6627451, 0, 1, 1,
0.7360526, -0.6415782, 2.497856, 0.6666667, 0, 1, 1,
0.7374098, 2.384797, -0.09670761, 0.6745098, 0, 1, 1,
0.7422783, -0.5945944, 4.511786, 0.6784314, 0, 1, 1,
0.7435195, 1.521966, 0.9145931, 0.6862745, 0, 1, 1,
0.7459304, -0.9640588, 1.26939, 0.6901961, 0, 1, 1,
0.7481776, -0.0870572, 1.278961, 0.6980392, 0, 1, 1,
0.7528176, 0.6167448, 0.2418997, 0.7058824, 0, 1, 1,
0.7565594, 1.048083, -0.4860196, 0.7098039, 0, 1, 1,
0.7624838, 0.3642478, 2.810904, 0.7176471, 0, 1, 1,
0.7625518, -2.277893, 2.719477, 0.7215686, 0, 1, 1,
0.7641748, -0.04926557, 1.747617, 0.7294118, 0, 1, 1,
0.7653255, 2.752432, 2.63806, 0.7333333, 0, 1, 1,
0.7697605, -0.1466447, 1.620873, 0.7411765, 0, 1, 1,
0.7708403, 1.263383, -0.1424491, 0.7450981, 0, 1, 1,
0.7718907, -0.5217273, 0.3325097, 0.7529412, 0, 1, 1,
0.7790612, 1.767254, 1.572175, 0.7568628, 0, 1, 1,
0.781348, 0.3252009, 0.6605666, 0.7647059, 0, 1, 1,
0.7868892, 0.06980915, -1.330276, 0.7686275, 0, 1, 1,
0.7885892, 0.06954455, 0.5695245, 0.7764706, 0, 1, 1,
0.7889791, -0.07878184, 1.98284, 0.7803922, 0, 1, 1,
0.7925918, 0.1036605, 2.189418, 0.7882353, 0, 1, 1,
0.7944325, 0.322605, 3.135771, 0.7921569, 0, 1, 1,
0.7977245, 0.1690511, 1.648635, 0.8, 0, 1, 1,
0.7994367, -0.1832976, 2.102305, 0.8078431, 0, 1, 1,
0.8066522, 1.141039, 2.2969, 0.8117647, 0, 1, 1,
0.8084089, -0.9629643, 2.981119, 0.8196079, 0, 1, 1,
0.8202189, 1.592823, 0.4190845, 0.8235294, 0, 1, 1,
0.8206811, -0.3414928, 3.60153, 0.8313726, 0, 1, 1,
0.8225443, -0.888288, 1.701038, 0.8352941, 0, 1, 1,
0.8225451, -0.01097226, 1.415406, 0.8431373, 0, 1, 1,
0.8229939, 0.6931974, 0.3077153, 0.8470588, 0, 1, 1,
0.8230425, 0.03995102, 1.984341, 0.854902, 0, 1, 1,
0.8269173, 1.041309, 1.877962, 0.8588235, 0, 1, 1,
0.8327683, -0.06582499, 2.487002, 0.8666667, 0, 1, 1,
0.833781, -0.2971271, 3.717155, 0.8705882, 0, 1, 1,
0.8365358, -0.5105258, 1.967641, 0.8784314, 0, 1, 1,
0.8372267, -2.141474, 2.598591, 0.8823529, 0, 1, 1,
0.8401479, 0.7753018, 2.117586, 0.8901961, 0, 1, 1,
0.8466265, 0.5468612, 0.4556243, 0.8941177, 0, 1, 1,
0.8488004, 0.2246024, 1.27446, 0.9019608, 0, 1, 1,
0.8543749, 0.3443756, 0.7297642, 0.9098039, 0, 1, 1,
0.8587829, -1.700062, 4.331387, 0.9137255, 0, 1, 1,
0.859966, 0.4939415, -0.7768373, 0.9215686, 0, 1, 1,
0.866981, -0.2067149, 1.33539, 0.9254902, 0, 1, 1,
0.868764, -0.4706459, 2.336658, 0.9333333, 0, 1, 1,
0.8738251, -0.9241167, 3.40706, 0.9372549, 0, 1, 1,
0.8740072, -1.870797, 3.089033, 0.945098, 0, 1, 1,
0.8851715, 0.04834683, 1.42989, 0.9490196, 0, 1, 1,
0.8925738, 0.3416772, -1.587519, 0.9568627, 0, 1, 1,
0.8998427, 0.8957386, 0.408834, 0.9607843, 0, 1, 1,
0.8999124, 0.7919364, 1.043543, 0.9686275, 0, 1, 1,
0.9042533, 0.6543949, -0.4800697, 0.972549, 0, 1, 1,
0.9116724, -1.022497, 3.118764, 0.9803922, 0, 1, 1,
0.9169145, -0.1438737, 0.9127461, 0.9843137, 0, 1, 1,
0.9175453, 1.103132, 0.4887201, 0.9921569, 0, 1, 1,
0.9212985, 0.1413831, -0.04344587, 0.9960784, 0, 1, 1,
0.9313372, 0.3461435, 1.06191, 1, 0, 0.9960784, 1,
0.9331576, 0.8092316, 1.953998, 1, 0, 0.9882353, 1,
0.9484154, 0.3230028, 0.5189096, 1, 0, 0.9843137, 1,
0.9509052, 0.9386545, 0.9230286, 1, 0, 0.9764706, 1,
0.955618, 1.034357, -0.1842237, 1, 0, 0.972549, 1,
0.9574606, 0.5144917, 1.280311, 1, 0, 0.9647059, 1,
0.962316, 0.9506004, 1.940859, 1, 0, 0.9607843, 1,
0.9630227, -1.333389, 3.446361, 1, 0, 0.9529412, 1,
0.9664341, -0.2083692, 1.901661, 1, 0, 0.9490196, 1,
0.966736, -1.061682, 0.7299508, 1, 0, 0.9411765, 1,
0.9677353, -0.6217657, 1.827829, 1, 0, 0.9372549, 1,
0.9691983, 1.208704, -0.07332807, 1, 0, 0.9294118, 1,
0.9701131, -0.8016431, 1.076015, 1, 0, 0.9254902, 1,
0.9721142, 0.3477677, 1.610478, 1, 0, 0.9176471, 1,
0.9762417, 1.131342, 1.491192, 1, 0, 0.9137255, 1,
0.9789113, 0.8348012, 1.709869, 1, 0, 0.9058824, 1,
0.9825285, -0.08321176, 1.693508, 1, 0, 0.9019608, 1,
0.9847222, 0.8691292, 0.6657816, 1, 0, 0.8941177, 1,
0.9872604, -0.2976356, 3.308106, 1, 0, 0.8862745, 1,
0.9905655, -0.7657874, 2.403542, 1, 0, 0.8823529, 1,
0.9968319, 2.457268, 2.06325, 1, 0, 0.8745098, 1,
1.004189, 0.4225921, 0.9263786, 1, 0, 0.8705882, 1,
1.007317, 0.731627, 1.704223, 1, 0, 0.8627451, 1,
1.007428, 0.1136803, 2.215218, 1, 0, 0.8588235, 1,
1.009464, -0.9338072, 2.736724, 1, 0, 0.8509804, 1,
1.015802, -1.012493, 4.199474, 1, 0, 0.8470588, 1,
1.01803, -1.292246, 2.801378, 1, 0, 0.8392157, 1,
1.021221, 0.143995, 2.93404, 1, 0, 0.8352941, 1,
1.021855, 0.3862849, 0.2007338, 1, 0, 0.827451, 1,
1.038371, -0.5894942, 2.26646, 1, 0, 0.8235294, 1,
1.04233, -1.333037, 1.845809, 1, 0, 0.8156863, 1,
1.043706, 0.8474278, 3.188916, 1, 0, 0.8117647, 1,
1.04816, 0.6202897, 0.09990171, 1, 0, 0.8039216, 1,
1.059043, 0.100676, 0.4665991, 1, 0, 0.7960784, 1,
1.060341, 1.403978, 1.00416, 1, 0, 0.7921569, 1,
1.077051, -0.5526875, 1.84271, 1, 0, 0.7843137, 1,
1.086164, -0.3383043, 1.034424, 1, 0, 0.7803922, 1,
1.087175, 0.6892178, 1.867225, 1, 0, 0.772549, 1,
1.092091, -0.02021205, 2.579099, 1, 0, 0.7686275, 1,
1.102537, -0.8782132, 2.283609, 1, 0, 0.7607843, 1,
1.102781, 0.09907678, 2.877444, 1, 0, 0.7568628, 1,
1.104535, 2.325813, 1.246339, 1, 0, 0.7490196, 1,
1.105347, -0.4645013, 0.9957748, 1, 0, 0.7450981, 1,
1.108503, 1.850291, -0.6442048, 1, 0, 0.7372549, 1,
1.113326, -1.228789, 2.630166, 1, 0, 0.7333333, 1,
1.122738, -0.5118152, 0.8968038, 1, 0, 0.7254902, 1,
1.124807, 0.3014545, 1.420572, 1, 0, 0.7215686, 1,
1.1258, -0.2076726, 1.431278, 1, 0, 0.7137255, 1,
1.142374, -0.05832845, -0.5598931, 1, 0, 0.7098039, 1,
1.15688, -0.6332137, 1.789296, 1, 0, 0.7019608, 1,
1.164017, -1.780533, 2.005767, 1, 0, 0.6941177, 1,
1.164314, -0.0687824, 2.338347, 1, 0, 0.6901961, 1,
1.165272, 0.565316, 0.2401556, 1, 0, 0.682353, 1,
1.183724, 0.2735488, 0.4811312, 1, 0, 0.6784314, 1,
1.186488, -0.3639848, 2.558506, 1, 0, 0.6705883, 1,
1.188118, 0.08844933, 1.918652, 1, 0, 0.6666667, 1,
1.191182, -0.04712556, 3.927859, 1, 0, 0.6588235, 1,
1.192111, 0.8813209, 1.329841, 1, 0, 0.654902, 1,
1.193513, -0.6398069, 0.1710099, 1, 0, 0.6470588, 1,
1.19691, 0.8276451, -0.6439439, 1, 0, 0.6431373, 1,
1.208683, -1.661991, 2.49544, 1, 0, 0.6352941, 1,
1.210099, 3.239105, -0.01534855, 1, 0, 0.6313726, 1,
1.21121, -0.9883029, 2.354023, 1, 0, 0.6235294, 1,
1.232256, 0.3751035, 2.602806, 1, 0, 0.6196079, 1,
1.234255, 0.6457335, 1.965369, 1, 0, 0.6117647, 1,
1.24102, 0.7260972, -0.4797533, 1, 0, 0.6078432, 1,
1.243718, -0.2191405, 2.439176, 1, 0, 0.6, 1,
1.24618, -0.4391686, 3.213618, 1, 0, 0.5921569, 1,
1.267149, -1.232382, 4.141538, 1, 0, 0.5882353, 1,
1.27685, -0.2798833, 3.634331, 1, 0, 0.5803922, 1,
1.279218, -1.060055, 3.343324, 1, 0, 0.5764706, 1,
1.280839, 1.523454, 0.8130425, 1, 0, 0.5686275, 1,
1.283525, 0.4418736, 0.7414048, 1, 0, 0.5647059, 1,
1.285369, 0.286328, 2.747272, 1, 0, 0.5568628, 1,
1.304345, 1.554625, 0.4152312, 1, 0, 0.5529412, 1,
1.308489, 1.265345, 1.54426, 1, 0, 0.5450981, 1,
1.315434, 1.495628, -0.1606428, 1, 0, 0.5411765, 1,
1.325063, -0.2318085, 2.897781, 1, 0, 0.5333334, 1,
1.349374, 2.309284, 0.07861538, 1, 0, 0.5294118, 1,
1.356529, 3.205585, -0.8388506, 1, 0, 0.5215687, 1,
1.359674, 2.06563, 0.4107137, 1, 0, 0.5176471, 1,
1.361925, -0.5928451, 2.407385, 1, 0, 0.509804, 1,
1.364415, -0.4116999, 1.86183, 1, 0, 0.5058824, 1,
1.37658, -0.1176979, 2.014195, 1, 0, 0.4980392, 1,
1.406101, 0.2245346, -0.0446502, 1, 0, 0.4901961, 1,
1.407384, 0.01072375, 1.86047, 1, 0, 0.4862745, 1,
1.409047, -0.3436288, 0.6609241, 1, 0, 0.4784314, 1,
1.409885, 1.211261, 1.46462, 1, 0, 0.4745098, 1,
1.410589, -0.9762791, 2.210037, 1, 0, 0.4666667, 1,
1.417993, -0.5353488, 0.960508, 1, 0, 0.4627451, 1,
1.428452, -2.554458, 2.40404, 1, 0, 0.454902, 1,
1.429805, 0.7408434, 1.468058, 1, 0, 0.4509804, 1,
1.430022, -0.6598273, 1.728936, 1, 0, 0.4431373, 1,
1.432249, 0.6086499, 0.9101385, 1, 0, 0.4392157, 1,
1.439795, -1.12834, 1.553803, 1, 0, 0.4313726, 1,
1.441431, -1.811848, 3.182747, 1, 0, 0.427451, 1,
1.44154, 0.2041619, 2.37553, 1, 0, 0.4196078, 1,
1.452762, 0.5822816, 2.988197, 1, 0, 0.4156863, 1,
1.457639, 0.463908, 2.708424, 1, 0, 0.4078431, 1,
1.467108, -0.9906858, 1.809721, 1, 0, 0.4039216, 1,
1.467242, 2.485904, -0.3251096, 1, 0, 0.3960784, 1,
1.470187, -2.117137, 2.967437, 1, 0, 0.3882353, 1,
1.47796, 0.6306505, 0.01751428, 1, 0, 0.3843137, 1,
1.482074, 1.788036, 1.893206, 1, 0, 0.3764706, 1,
1.49984, -2.17134, 3.698943, 1, 0, 0.372549, 1,
1.500732, 0.8698259, 0.3526396, 1, 0, 0.3647059, 1,
1.501737, -0.6105102, 1.515723, 1, 0, 0.3607843, 1,
1.505299, -0.5614544, 2.185742, 1, 0, 0.3529412, 1,
1.509766, 0.1003846, 2.992021, 1, 0, 0.3490196, 1,
1.517388, -0.2697285, -0.3195359, 1, 0, 0.3411765, 1,
1.527137, 0.7645766, 0.02646637, 1, 0, 0.3372549, 1,
1.549038, -1.512949, 3.055436, 1, 0, 0.3294118, 1,
1.5605, -1.108527, 1.213962, 1, 0, 0.3254902, 1,
1.571407, 0.06836237, 0.6340802, 1, 0, 0.3176471, 1,
1.573471, -0.1845318, 3.623873, 1, 0, 0.3137255, 1,
1.591005, -1.001291, 1.633098, 1, 0, 0.3058824, 1,
1.603559, 1.723106, 0.4100745, 1, 0, 0.2980392, 1,
1.633798, 0.9395729, 1.283137, 1, 0, 0.2941177, 1,
1.649354, -0.8767636, 2.186582, 1, 0, 0.2862745, 1,
1.65028, -0.3051682, 3.583966, 1, 0, 0.282353, 1,
1.661676, 0.4906191, 1.786376, 1, 0, 0.2745098, 1,
1.674053, -0.4350224, 2.160632, 1, 0, 0.2705882, 1,
1.684929, -1.509267, 1.0566, 1, 0, 0.2627451, 1,
1.691712, -0.2226641, 2.507489, 1, 0, 0.2588235, 1,
1.700385, -0.3484371, 2.508548, 1, 0, 0.2509804, 1,
1.71901, 1.176134, 1.385473, 1, 0, 0.2470588, 1,
1.727457, -1.092816, 2.091827, 1, 0, 0.2392157, 1,
1.733885, 0.8728974, 0.3322714, 1, 0, 0.2352941, 1,
1.757794, 0.873206, 2.742397, 1, 0, 0.227451, 1,
1.758282, 0.9109725, 0.3871132, 1, 0, 0.2235294, 1,
1.767086, -0.4186341, 1.525115, 1, 0, 0.2156863, 1,
1.782448, -2.212367, 2.313988, 1, 0, 0.2117647, 1,
1.787072, -1.188444, 2.320479, 1, 0, 0.2039216, 1,
1.79489, 0.4517391, 2.56527, 1, 0, 0.1960784, 1,
1.803858, -1.660046, 1.484054, 1, 0, 0.1921569, 1,
1.808148, 0.8118474, 2.801385, 1, 0, 0.1843137, 1,
1.828244, 1.206732, 1.299417, 1, 0, 0.1803922, 1,
1.829066, 1.905712, 1.533465, 1, 0, 0.172549, 1,
1.902733, 0.7376044, 0.6845184, 1, 0, 0.1686275, 1,
1.932022, -0.5200468, 2.363024, 1, 0, 0.1607843, 1,
1.93948, 0.5952038, 1.356954, 1, 0, 0.1568628, 1,
1.966409, 0.5532421, 0.06503444, 1, 0, 0.1490196, 1,
1.978052, 0.1675231, 0.5184183, 1, 0, 0.145098, 1,
1.980632, -0.09659024, 1.535501, 1, 0, 0.1372549, 1,
1.994061, 0.8802808, 1.279998, 1, 0, 0.1333333, 1,
2.001701, 0.7107697, 2.358782, 1, 0, 0.1254902, 1,
2.00289, 0.2213867, 1.502908, 1, 0, 0.1215686, 1,
2.053399, 0.735616, 1.006422, 1, 0, 0.1137255, 1,
2.069907, 0.6185588, 3.202102, 1, 0, 0.1098039, 1,
2.071144, -0.4222596, 1.545838, 1, 0, 0.1019608, 1,
2.078624, -0.4832159, 2.141831, 1, 0, 0.09411765, 1,
2.085971, -0.1446554, 0.5308715, 1, 0, 0.09019608, 1,
2.139573, 1.972358, 1.018923, 1, 0, 0.08235294, 1,
2.15098, -1.882581, 2.480034, 1, 0, 0.07843138, 1,
2.264584, 0.3286411, 1.479434, 1, 0, 0.07058824, 1,
2.272612, -0.2115228, 1.508936, 1, 0, 0.06666667, 1,
2.297416, -0.2135732, 3.588329, 1, 0, 0.05882353, 1,
2.399322, -1.102399, 0.6619645, 1, 0, 0.05490196, 1,
2.52687, 0.8097086, 1.754927, 1, 0, 0.04705882, 1,
2.577478, 1.679506, 0.996801, 1, 0, 0.04313726, 1,
2.638, -0.9593088, 1.354499, 1, 0, 0.03529412, 1,
2.697919, 0.07283368, 0.7728741, 1, 0, 0.03137255, 1,
2.74103, 0.7939895, 0.7373479, 1, 0, 0.02352941, 1,
2.75233, 0.74244, -0.09118161, 1, 0, 0.01960784, 1,
3.047452, 0.310315, 0.7258303, 1, 0, 0.01176471, 1,
3.329173, 1.019542, 2.094255, 1, 0, 0.007843138, 1
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
0.3844693, -4.540171, -6.799011, 0, -0.5, 0.5, 0.5,
0.3844693, -4.540171, -6.799011, 1, -0.5, 0.5, 0.5,
0.3844693, -4.540171, -6.799011, 1, 1.5, 0.5, 0.5,
0.3844693, -4.540171, -6.799011, 0, 1.5, 0.5, 0.5
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
-3.558489, -0.08679366, -6.799011, 0, -0.5, 0.5, 0.5,
-3.558489, -0.08679366, -6.799011, 1, -0.5, 0.5, 0.5,
-3.558489, -0.08679366, -6.799011, 1, 1.5, 0.5, 0.5,
-3.558489, -0.08679366, -6.799011, 0, 1.5, 0.5, 0.5
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
-3.558489, -4.540171, -0.05057931, 0, -0.5, 0.5, 0.5,
-3.558489, -4.540171, -0.05057931, 1, -0.5, 0.5, 0.5,
-3.558489, -4.540171, -0.05057931, 1, 1.5, 0.5, 0.5,
-3.558489, -4.540171, -0.05057931, 0, 1.5, 0.5, 0.5
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
-2, -3.512469, -5.24168,
3, -3.512469, -5.24168,
-2, -3.512469, -5.24168,
-2, -3.683753, -5.501235,
-1, -3.512469, -5.24168,
-1, -3.683753, -5.501235,
0, -3.512469, -5.24168,
0, -3.683753, -5.501235,
1, -3.512469, -5.24168,
1, -3.683753, -5.501235,
2, -3.512469, -5.24168,
2, -3.683753, -5.501235,
3, -3.512469, -5.24168,
3, -3.683753, -5.501235
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
-2, -4.02632, -6.020346, 0, -0.5, 0.5, 0.5,
-2, -4.02632, -6.020346, 1, -0.5, 0.5, 0.5,
-2, -4.02632, -6.020346, 1, 1.5, 0.5, 0.5,
-2, -4.02632, -6.020346, 0, 1.5, 0.5, 0.5,
-1, -4.02632, -6.020346, 0, -0.5, 0.5, 0.5,
-1, -4.02632, -6.020346, 1, -0.5, 0.5, 0.5,
-1, -4.02632, -6.020346, 1, 1.5, 0.5, 0.5,
-1, -4.02632, -6.020346, 0, 1.5, 0.5, 0.5,
0, -4.02632, -6.020346, 0, -0.5, 0.5, 0.5,
0, -4.02632, -6.020346, 1, -0.5, 0.5, 0.5,
0, -4.02632, -6.020346, 1, 1.5, 0.5, 0.5,
0, -4.02632, -6.020346, 0, 1.5, 0.5, 0.5,
1, -4.02632, -6.020346, 0, -0.5, 0.5, 0.5,
1, -4.02632, -6.020346, 1, -0.5, 0.5, 0.5,
1, -4.02632, -6.020346, 1, 1.5, 0.5, 0.5,
1, -4.02632, -6.020346, 0, 1.5, 0.5, 0.5,
2, -4.02632, -6.020346, 0, -0.5, 0.5, 0.5,
2, -4.02632, -6.020346, 1, -0.5, 0.5, 0.5,
2, -4.02632, -6.020346, 1, 1.5, 0.5, 0.5,
2, -4.02632, -6.020346, 0, 1.5, 0.5, 0.5,
3, -4.02632, -6.020346, 0, -0.5, 0.5, 0.5,
3, -4.02632, -6.020346, 1, -0.5, 0.5, 0.5,
3, -4.02632, -6.020346, 1, 1.5, 0.5, 0.5,
3, -4.02632, -6.020346, 0, 1.5, 0.5, 0.5
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
-2.648575, -3, -5.24168,
-2.648575, 3, -5.24168,
-2.648575, -3, -5.24168,
-2.800227, -3, -5.501235,
-2.648575, -2, -5.24168,
-2.800227, -2, -5.501235,
-2.648575, -1, -5.24168,
-2.800227, -1, -5.501235,
-2.648575, 0, -5.24168,
-2.800227, 0, -5.501235,
-2.648575, 1, -5.24168,
-2.800227, 1, -5.501235,
-2.648575, 2, -5.24168,
-2.800227, 2, -5.501235,
-2.648575, 3, -5.24168,
-2.800227, 3, -5.501235
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
-3.103532, -3, -6.020346, 0, -0.5, 0.5, 0.5,
-3.103532, -3, -6.020346, 1, -0.5, 0.5, 0.5,
-3.103532, -3, -6.020346, 1, 1.5, 0.5, 0.5,
-3.103532, -3, -6.020346, 0, 1.5, 0.5, 0.5,
-3.103532, -2, -6.020346, 0, -0.5, 0.5, 0.5,
-3.103532, -2, -6.020346, 1, -0.5, 0.5, 0.5,
-3.103532, -2, -6.020346, 1, 1.5, 0.5, 0.5,
-3.103532, -2, -6.020346, 0, 1.5, 0.5, 0.5,
-3.103532, -1, -6.020346, 0, -0.5, 0.5, 0.5,
-3.103532, -1, -6.020346, 1, -0.5, 0.5, 0.5,
-3.103532, -1, -6.020346, 1, 1.5, 0.5, 0.5,
-3.103532, -1, -6.020346, 0, 1.5, 0.5, 0.5,
-3.103532, 0, -6.020346, 0, -0.5, 0.5, 0.5,
-3.103532, 0, -6.020346, 1, -0.5, 0.5, 0.5,
-3.103532, 0, -6.020346, 1, 1.5, 0.5, 0.5,
-3.103532, 0, -6.020346, 0, 1.5, 0.5, 0.5,
-3.103532, 1, -6.020346, 0, -0.5, 0.5, 0.5,
-3.103532, 1, -6.020346, 1, -0.5, 0.5, 0.5,
-3.103532, 1, -6.020346, 1, 1.5, 0.5, 0.5,
-3.103532, 1, -6.020346, 0, 1.5, 0.5, 0.5,
-3.103532, 2, -6.020346, 0, -0.5, 0.5, 0.5,
-3.103532, 2, -6.020346, 1, -0.5, 0.5, 0.5,
-3.103532, 2, -6.020346, 1, 1.5, 0.5, 0.5,
-3.103532, 2, -6.020346, 0, 1.5, 0.5, 0.5,
-3.103532, 3, -6.020346, 0, -0.5, 0.5, 0.5,
-3.103532, 3, -6.020346, 1, -0.5, 0.5, 0.5,
-3.103532, 3, -6.020346, 1, 1.5, 0.5, 0.5,
-3.103532, 3, -6.020346, 0, 1.5, 0.5, 0.5
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
-2.648575, -3.512469, -4,
-2.648575, -3.512469, 4,
-2.648575, -3.512469, -4,
-2.800227, -3.683753, -4,
-2.648575, -3.512469, -2,
-2.800227, -3.683753, -2,
-2.648575, -3.512469, 0,
-2.800227, -3.683753, 0,
-2.648575, -3.512469, 2,
-2.800227, -3.683753, 2,
-2.648575, -3.512469, 4,
-2.800227, -3.683753, 4
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
-3.103532, -4.02632, -4, 0, -0.5, 0.5, 0.5,
-3.103532, -4.02632, -4, 1, -0.5, 0.5, 0.5,
-3.103532, -4.02632, -4, 1, 1.5, 0.5, 0.5,
-3.103532, -4.02632, -4, 0, 1.5, 0.5, 0.5,
-3.103532, -4.02632, -2, 0, -0.5, 0.5, 0.5,
-3.103532, -4.02632, -2, 1, -0.5, 0.5, 0.5,
-3.103532, -4.02632, -2, 1, 1.5, 0.5, 0.5,
-3.103532, -4.02632, -2, 0, 1.5, 0.5, 0.5,
-3.103532, -4.02632, 0, 0, -0.5, 0.5, 0.5,
-3.103532, -4.02632, 0, 1, -0.5, 0.5, 0.5,
-3.103532, -4.02632, 0, 1, 1.5, 0.5, 0.5,
-3.103532, -4.02632, 0, 0, 1.5, 0.5, 0.5,
-3.103532, -4.02632, 2, 0, -0.5, 0.5, 0.5,
-3.103532, -4.02632, 2, 1, -0.5, 0.5, 0.5,
-3.103532, -4.02632, 2, 1, 1.5, 0.5, 0.5,
-3.103532, -4.02632, 2, 0, 1.5, 0.5, 0.5,
-3.103532, -4.02632, 4, 0, -0.5, 0.5, 0.5,
-3.103532, -4.02632, 4, 1, -0.5, 0.5, 0.5,
-3.103532, -4.02632, 4, 1, 1.5, 0.5, 0.5,
-3.103532, -4.02632, 4, 0, 1.5, 0.5, 0.5
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
-2.648575, -3.512469, -5.24168,
-2.648575, 3.338881, -5.24168,
-2.648575, -3.512469, 5.140522,
-2.648575, 3.338881, 5.140522,
-2.648575, -3.512469, -5.24168,
-2.648575, -3.512469, 5.140522,
-2.648575, 3.338881, -5.24168,
-2.648575, 3.338881, 5.140522,
-2.648575, -3.512469, -5.24168,
3.417514, -3.512469, -5.24168,
-2.648575, -3.512469, 5.140522,
3.417514, -3.512469, 5.140522,
-2.648575, 3.338881, -5.24168,
3.417514, 3.338881, -5.24168,
-2.648575, 3.338881, 5.140522,
3.417514, 3.338881, 5.140522,
3.417514, -3.512469, -5.24168,
3.417514, 3.338881, -5.24168,
3.417514, -3.512469, 5.140522,
3.417514, 3.338881, 5.140522,
3.417514, -3.512469, -5.24168,
3.417514, -3.512469, 5.140522,
3.417514, 3.338881, -5.24168,
3.417514, 3.338881, 5.140522
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
var radius = 7.389963;
var distance = 32.87878;
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
mvMatrix.translate( -0.3844693, 0.08679366, 0.05057931 );
mvMatrix.scale( 1.317187, 1.166219, 0.7696028 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.87878);
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
fluroxypyr-meptyl<-read.table("fluroxypyr-meptyl.xyz")
```

```
## Error in read.table("fluroxypyr-meptyl.xyz"): no lines available in input
```

```r
x<-fluroxypyr-meptyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
```

```r
y<-fluroxypyr-meptyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
```

```r
z<-fluroxypyr-meptyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
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
-2.560234, -0.635129, -2.675323, 0, 0, 1, 1, 1,
-2.520579, 0.4457547, -0.8819563, 1, 0, 0, 1, 1,
-2.497201, -0.9202037, -2.963897, 1, 0, 0, 1, 1,
-2.356432, 1.680542, -0.2979544, 1, 0, 0, 1, 1,
-2.225289, 0.3783793, -0.7265629, 1, 0, 0, 1, 1,
-2.209566, -0.03573708, -2.995152, 1, 0, 0, 1, 1,
-2.201272, 0.3579956, -1.319025, 0, 0, 0, 1, 1,
-2.121707, 0.04121803, -3.665549, 0, 0, 0, 1, 1,
-2.089681, -0.7246312, -0.2355351, 0, 0, 0, 1, 1,
-2.058205, -2.083745, -3.636935, 0, 0, 0, 1, 1,
-2.042717, 0.717357, -0.7325076, 0, 0, 0, 1, 1,
-2.03709, 2.29971, -0.1857129, 0, 0, 0, 1, 1,
-2.02527, -0.8939535, -1.802727, 0, 0, 0, 1, 1,
-2.007712, 1.228533, -0.7546711, 1, 1, 1, 1, 1,
-1.987665, 0.1009738, -3.498462, 1, 1, 1, 1, 1,
-1.976906, -1.00433, -2.747339, 1, 1, 1, 1, 1,
-1.963935, -0.7234197, -1.867794, 1, 1, 1, 1, 1,
-1.934547, 0.7330087, -2.299679, 1, 1, 1, 1, 1,
-1.92518, 0.2821726, -0.8543922, 1, 1, 1, 1, 1,
-1.88896, -0.03624231, -1.848981, 1, 1, 1, 1, 1,
-1.836654, -0.3564422, -2.128185, 1, 1, 1, 1, 1,
-1.805506, 0.624809, -0.8220084, 1, 1, 1, 1, 1,
-1.793141, -0.943444, -0.3957118, 1, 1, 1, 1, 1,
-1.775621, 3.031175, 0.3865207, 1, 1, 1, 1, 1,
-1.771278, 1.670702, 1.258074, 1, 1, 1, 1, 1,
-1.770204, 0.2628958, -1.505319, 1, 1, 1, 1, 1,
-1.766807, 0.8059203, -1.6613, 1, 1, 1, 1, 1,
-1.761865, 0.4329941, -2.914081, 1, 1, 1, 1, 1,
-1.751092, -0.2483523, -0.421718, 0, 0, 1, 1, 1,
-1.746119, -0.9151508, -2.060248, 1, 0, 0, 1, 1,
-1.738598, 0.7992226, -0.691255, 1, 0, 0, 1, 1,
-1.735511, -0.1226577, -2.426509, 1, 0, 0, 1, 1,
-1.729451, 0.2418746, -1.172536, 1, 0, 0, 1, 1,
-1.728827, 2.294951, -1.320197, 1, 0, 0, 1, 1,
-1.727898, 0.2462669, -0.6315461, 0, 0, 0, 1, 1,
-1.722822, -0.23113, -1.789388, 0, 0, 0, 1, 1,
-1.71914, 0.3336205, -0.6912248, 0, 0, 0, 1, 1,
-1.691504, -0.2720364, 0.4178088, 0, 0, 0, 1, 1,
-1.68199, 1.208013, -0.5634879, 0, 0, 0, 1, 1,
-1.681262, 0.5039687, -0.1645053, 0, 0, 0, 1, 1,
-1.672369, -1.439062, -1.922819, 0, 0, 0, 1, 1,
-1.665891, -1.392351, -3.66095, 1, 1, 1, 1, 1,
-1.648029, 0.8100316, -2.012002, 1, 1, 1, 1, 1,
-1.645866, -0.05104712, -0.7991024, 1, 1, 1, 1, 1,
-1.641943, 0.162348, -1.210858, 1, 1, 1, 1, 1,
-1.61872, -0.7318017, -2.213512, 1, 1, 1, 1, 1,
-1.61518, -1.337472, -2.300268, 1, 1, 1, 1, 1,
-1.612173, 0.9187403, -1.335971, 1, 1, 1, 1, 1,
-1.607995, -0.5444187, -2.694495, 1, 1, 1, 1, 1,
-1.607396, -2.585406, -1.604446, 1, 1, 1, 1, 1,
-1.604886, -2.337479, -3.508251, 1, 1, 1, 1, 1,
-1.592476, -0.0890821, -1.612698, 1, 1, 1, 1, 1,
-1.566257, 0.2887522, -0.1120502, 1, 1, 1, 1, 1,
-1.555763, -0.5252775, -3.435582, 1, 1, 1, 1, 1,
-1.548872, -1.945645, -2.017172, 1, 1, 1, 1, 1,
-1.541542, 1.558754, -1.114345, 1, 1, 1, 1, 1,
-1.538915, -2.029932, -2.687155, 0, 0, 1, 1, 1,
-1.538827, -1.162685, -2.936913, 1, 0, 0, 1, 1,
-1.528098, 1.925906, -0.8578827, 1, 0, 0, 1, 1,
-1.511443, 0.6390815, -0.7614868, 1, 0, 0, 1, 1,
-1.509345, 1.259604, -1.341213, 1, 0, 0, 1, 1,
-1.501356, 0.427939, -0.04468108, 1, 0, 0, 1, 1,
-1.492407, -0.1496868, -0.2394751, 0, 0, 0, 1, 1,
-1.468616, -1.688652, -3.770329, 0, 0, 0, 1, 1,
-1.441155, -0.05673708, -1.978019, 0, 0, 0, 1, 1,
-1.440621, 0.06733163, 0.2557698, 0, 0, 0, 1, 1,
-1.437547, 0.2300118, -0.7625366, 0, 0, 0, 1, 1,
-1.431476, 1.487669, -1.782763, 0, 0, 0, 1, 1,
-1.431212, -1.072186, -2.389115, 0, 0, 0, 1, 1,
-1.409265, 0.2968083, -3.147463, 1, 1, 1, 1, 1,
-1.408722, -0.7708513, -1.797907, 1, 1, 1, 1, 1,
-1.403981, 0.1394519, -1.181848, 1, 1, 1, 1, 1,
-1.395741, 0.3237975, -0.5476611, 1, 1, 1, 1, 1,
-1.392396, 1.449071, -0.4373448, 1, 1, 1, 1, 1,
-1.39169, -0.4267934, -3.532955, 1, 1, 1, 1, 1,
-1.38999, -2.244057, -2.361855, 1, 1, 1, 1, 1,
-1.371255, -1.518913, -2.688887, 1, 1, 1, 1, 1,
-1.369369, -0.2329049, -3.645332, 1, 1, 1, 1, 1,
-1.365706, -0.6749179, -1.841247, 1, 1, 1, 1, 1,
-1.345246, 0.2405303, -1.977244, 1, 1, 1, 1, 1,
-1.339697, 0.5754449, -0.8674611, 1, 1, 1, 1, 1,
-1.337586, 2.181189, 0.584671, 1, 1, 1, 1, 1,
-1.335894, -0.6558082, -2.887675, 1, 1, 1, 1, 1,
-1.335737, -1.370121, -2.055554, 1, 1, 1, 1, 1,
-1.322866, -0.01976626, -0.8797379, 0, 0, 1, 1, 1,
-1.322359, -0.8175221, -3.437802, 1, 0, 0, 1, 1,
-1.32098, -0.5798593, -4.093812, 1, 0, 0, 1, 1,
-1.311251, 2.111583, 0.4387968, 1, 0, 0, 1, 1,
-1.295181, -0.9285165, -4.678671, 1, 0, 0, 1, 1,
-1.283759, 0.312593, -1.300399, 1, 0, 0, 1, 1,
-1.282004, 1.24543, -1.617836, 0, 0, 0, 1, 1,
-1.280187, 0.4975159, -0.08545832, 0, 0, 0, 1, 1,
-1.274265, -1.04723, -1.855369, 0, 0, 0, 1, 1,
-1.272908, 0.4901941, -1.21984, 0, 0, 0, 1, 1,
-1.266722, -1.036182, -3.084117, 0, 0, 0, 1, 1,
-1.265421, -1.586216, -2.453597, 0, 0, 0, 1, 1,
-1.261606, -0.5399475, -2.857606, 0, 0, 0, 1, 1,
-1.248277, -1.503892, -2.071506, 1, 1, 1, 1, 1,
-1.242016, 0.8477817, -1.012822, 1, 1, 1, 1, 1,
-1.222958, -0.1413251, -1.70511, 1, 1, 1, 1, 1,
-1.222136, -0.6507263, -1.580734, 1, 1, 1, 1, 1,
-1.218636, -0.2157947, -1.488786, 1, 1, 1, 1, 1,
-1.216567, 0.1114305, -2.634717, 1, 1, 1, 1, 1,
-1.21651, 2.049297, 0.05569714, 1, 1, 1, 1, 1,
-1.213795, -0.7196535, -2.653982, 1, 1, 1, 1, 1,
-1.210561, 1.101319, 0.8214132, 1, 1, 1, 1, 1,
-1.201751, 0.7477228, -0.3437788, 1, 1, 1, 1, 1,
-1.201628, 0.3605925, -2.261105, 1, 1, 1, 1, 1,
-1.200364, -0.3762314, -1.560587, 1, 1, 1, 1, 1,
-1.187376, -0.2959813, -2.914524, 1, 1, 1, 1, 1,
-1.185896, -0.814298, -2.917422, 1, 1, 1, 1, 1,
-1.179611, -0.4459622, -2.384006, 1, 1, 1, 1, 1,
-1.171073, -0.9443736, -1.59381, 0, 0, 1, 1, 1,
-1.169188, 0.6096548, -0.8073024, 1, 0, 0, 1, 1,
-1.158433, -1.419839, -3.31664, 1, 0, 0, 1, 1,
-1.156914, -0.2991699, -1.333704, 1, 0, 0, 1, 1,
-1.156494, 0.9493673, -2.304967, 1, 0, 0, 1, 1,
-1.149163, 0.1526815, -0.6624398, 1, 0, 0, 1, 1,
-1.143624, 0.1414922, -1.233082, 0, 0, 0, 1, 1,
-1.13452, -1.526659, -3.457083, 0, 0, 0, 1, 1,
-1.133759, 1.439719, 0.2308724, 0, 0, 0, 1, 1,
-1.132947, -1.364191, -2.006417, 0, 0, 0, 1, 1,
-1.128169, 0.274529, -2.323254, 0, 0, 0, 1, 1,
-1.124437, -1.574304, -2.989969, 0, 0, 0, 1, 1,
-1.122464, 0.8687286, 0.6218476, 0, 0, 0, 1, 1,
-1.119025, -2.273613, -2.66572, 1, 1, 1, 1, 1,
-1.11783, 1.008515, -0.6451117, 1, 1, 1, 1, 1,
-1.114803, 1.669676, -1.006279, 1, 1, 1, 1, 1,
-1.096037, 1.531915, -0.6713994, 1, 1, 1, 1, 1,
-1.089529, 0.9073875, -1.946924, 1, 1, 1, 1, 1,
-1.082954, -0.8328616, -4.858757, 1, 1, 1, 1, 1,
-1.082845, 0.551381, -0.7854282, 1, 1, 1, 1, 1,
-1.082133, -0.455062, -3.234227, 1, 1, 1, 1, 1,
-1.080265, 1.097981, -0.9556312, 1, 1, 1, 1, 1,
-1.074282, 1.807675, -0.7551792, 1, 1, 1, 1, 1,
-1.065156, 1.137671, -0.2121733, 1, 1, 1, 1, 1,
-1.063379, -0.03782951, -2.036729, 1, 1, 1, 1, 1,
-1.059196, 1.085039, -0.9163803, 1, 1, 1, 1, 1,
-1.056337, 0.2314323, -0.7566487, 1, 1, 1, 1, 1,
-1.055398, 0.05158406, -3.341074, 1, 1, 1, 1, 1,
-1.054884, 1.491493, -0.7052159, 0, 0, 1, 1, 1,
-1.04576, -0.4066436, -1.276762, 1, 0, 0, 1, 1,
-1.03831, 1.062357, -1.61816, 1, 0, 0, 1, 1,
-1.037021, -0.3049504, -0.07754432, 1, 0, 0, 1, 1,
-1.03442, -0.3289657, -0.2844596, 1, 0, 0, 1, 1,
-1.033904, 1.458873, -1.359851, 1, 0, 0, 1, 1,
-1.032546, -1.299386, -1.039338, 0, 0, 0, 1, 1,
-1.01794, -0.8146122, -3.307593, 0, 0, 0, 1, 1,
-1.014651, -1.027715, -3.339652, 0, 0, 0, 1, 1,
-1.014622, 0.5509802, -0.8121594, 0, 0, 0, 1, 1,
-1.012543, -0.873649, -1.468402, 0, 0, 0, 1, 1,
-1.010957, 0.1752411, -3.562153, 0, 0, 0, 1, 1,
-1.010449, -0.1148937, -1.806063, 0, 0, 0, 1, 1,
-0.996563, 2.104948, 0.8176335, 1, 1, 1, 1, 1,
-0.9936256, -0.3755288, -0.7962463, 1, 1, 1, 1, 1,
-0.9922502, -0.8208681, -1.586776, 1, 1, 1, 1, 1,
-0.9890167, -0.5266895, -2.827817, 1, 1, 1, 1, 1,
-0.9866885, -0.3489488, -2.646921, 1, 1, 1, 1, 1,
-0.985678, 0.4430261, -1.031751, 1, 1, 1, 1, 1,
-0.9844524, 0.312112, -1.732292, 1, 1, 1, 1, 1,
-0.980674, -1.215685, -2.833591, 1, 1, 1, 1, 1,
-0.978941, 0.6819069, -0.6351906, 1, 1, 1, 1, 1,
-0.9786307, -1.962897, -2.966238, 1, 1, 1, 1, 1,
-0.9782589, -0.08060379, -0.02219098, 1, 1, 1, 1, 1,
-0.9779081, 1.863269, -0.3945272, 1, 1, 1, 1, 1,
-0.975679, -0.7082334, -2.76073, 1, 1, 1, 1, 1,
-0.9751027, 1.500569, -0.7496879, 1, 1, 1, 1, 1,
-0.9651876, -1.449517, -2.688828, 1, 1, 1, 1, 1,
-0.9579934, -0.5915595, -3.780576, 0, 0, 1, 1, 1,
-0.9576322, 0.617113, 0.2005815, 1, 0, 0, 1, 1,
-0.9567129, -0.3211571, -2.620095, 1, 0, 0, 1, 1,
-0.9563521, 0.2098957, -0.2078787, 1, 0, 0, 1, 1,
-0.9525522, -0.8630525, -1.570711, 1, 0, 0, 1, 1,
-0.9517079, -1.05909, -3.417792, 1, 0, 0, 1, 1,
-0.948526, 0.6197792, -1.458253, 0, 0, 0, 1, 1,
-0.9475263, 0.9828659, -0.5172383, 0, 0, 0, 1, 1,
-0.9456371, 1.197206, -0.3225866, 0, 0, 0, 1, 1,
-0.944943, -0.4781266, -2.427692, 0, 0, 0, 1, 1,
-0.9365851, 0.8299413, -0.4517647, 0, 0, 0, 1, 1,
-0.9301437, -1.516853, -2.269953, 0, 0, 0, 1, 1,
-0.9267029, 1.184466, -0.008130391, 0, 0, 0, 1, 1,
-0.9262715, 1.262202, -3.568503, 1, 1, 1, 1, 1,
-0.9239173, 0.180918, -1.64537, 1, 1, 1, 1, 1,
-0.9226583, 2.113297, -0.2337237, 1, 1, 1, 1, 1,
-0.909872, -2.080437, -2.990091, 1, 1, 1, 1, 1,
-0.9055882, 0.02499922, -0.9324504, 1, 1, 1, 1, 1,
-0.901388, 0.7656702, -1.218885, 1, 1, 1, 1, 1,
-0.8987374, 1.645126, 0.6928003, 1, 1, 1, 1, 1,
-0.8984745, -0.6535348, -1.920499, 1, 1, 1, 1, 1,
-0.89842, -0.7520988, -3.274924, 1, 1, 1, 1, 1,
-0.8973834, -2.1259, -2.321833, 1, 1, 1, 1, 1,
-0.8945828, 0.6439979, -0.8159961, 1, 1, 1, 1, 1,
-0.8910632, -0.1145135, -0.6445758, 1, 1, 1, 1, 1,
-0.8897862, 1.631239, -0.8675067, 1, 1, 1, 1, 1,
-0.8856364, 1.762908, -1.638015, 1, 1, 1, 1, 1,
-0.8812847, -0.3977026, -1.465004, 1, 1, 1, 1, 1,
-0.8809893, -1.597872, -1.53589, 0, 0, 1, 1, 1,
-0.8763076, -0.9079394, -3.017379, 1, 0, 0, 1, 1,
-0.8737307, -0.708187, -1.896003, 1, 0, 0, 1, 1,
-0.8709909, -1.211878, -2.674645, 1, 0, 0, 1, 1,
-0.8625911, -1.187522, -2.277814, 1, 0, 0, 1, 1,
-0.8571769, -1.97443, -3.265307, 1, 0, 0, 1, 1,
-0.8549264, -0.5539503, -1.998558, 0, 0, 0, 1, 1,
-0.8516691, -1.439584, -1.9378, 0, 0, 0, 1, 1,
-0.850774, 0.5060129, -1.06997, 0, 0, 0, 1, 1,
-0.8474714, -1.021601, -1.05587, 0, 0, 0, 1, 1,
-0.8454743, 1.176477, -0.8133538, 0, 0, 0, 1, 1,
-0.842845, -0.3178729, -1.606792, 0, 0, 0, 1, 1,
-0.8366288, 0.3695688, -2.611509, 0, 0, 0, 1, 1,
-0.8362546, 1.567504, 0.8669308, 1, 1, 1, 1, 1,
-0.8358638, 0.8311395, 0.4141486, 1, 1, 1, 1, 1,
-0.834604, -0.6008197, -1.23368, 1, 1, 1, 1, 1,
-0.8284108, 1.998088, 0.6590866, 1, 1, 1, 1, 1,
-0.819531, 1.191304, -0.4175052, 1, 1, 1, 1, 1,
-0.8076152, 0.06565911, -1.668717, 1, 1, 1, 1, 1,
-0.8060668, -1.307646, -1.443319, 1, 1, 1, 1, 1,
-0.798637, -0.5359955, -1.731002, 1, 1, 1, 1, 1,
-0.7979315, -0.5464441, -2.921226, 1, 1, 1, 1, 1,
-0.7972014, -0.4996484, -1.703921, 1, 1, 1, 1, 1,
-0.7969864, 0.9836234, -0.5307775, 1, 1, 1, 1, 1,
-0.7952932, 1.547925, -1.326975, 1, 1, 1, 1, 1,
-0.7952292, 0.1377185, -1.890872, 1, 1, 1, 1, 1,
-0.7850984, -0.8100998, 0.2826464, 1, 1, 1, 1, 1,
-0.7850651, 1.264585, -1.114911, 1, 1, 1, 1, 1,
-0.7828946, -0.09325861, -2.466654, 0, 0, 1, 1, 1,
-0.781596, 1.596087, -0.3581606, 1, 0, 0, 1, 1,
-0.7788167, 0.9928678, -3.103489, 1, 0, 0, 1, 1,
-0.7733421, -2.006318, -2.901376, 1, 0, 0, 1, 1,
-0.7667333, -1.178855, -1.273905, 1, 0, 0, 1, 1,
-0.7593114, -0.6206853, -2.731144, 1, 0, 0, 1, 1,
-0.7558821, -1.166284, -2.752344, 0, 0, 0, 1, 1,
-0.7523571, 1.430842, 0.2273461, 0, 0, 0, 1, 1,
-0.7490075, -0.8311016, -1.788983, 0, 0, 0, 1, 1,
-0.7485394, 1.397741, -0.6656958, 0, 0, 0, 1, 1,
-0.7481291, -1.083572, -1.585304, 0, 0, 0, 1, 1,
-0.7481208, 2.10878, 0.2025327, 0, 0, 0, 1, 1,
-0.735884, 0.6974972, -3.834199, 0, 0, 0, 1, 1,
-0.7270485, -2.168586, -2.430248, 1, 1, 1, 1, 1,
-0.7260706, -1.489217, -1.275855, 1, 1, 1, 1, 1,
-0.7245514, -0.1997215, -4.09568, 1, 1, 1, 1, 1,
-0.7223276, -0.430807, -0.1651454, 1, 1, 1, 1, 1,
-0.7205502, -1.338112, -2.407796, 1, 1, 1, 1, 1,
-0.7183022, -0.6051202, -3.234399, 1, 1, 1, 1, 1,
-0.7179691, 0.8514441, -0.01340892, 1, 1, 1, 1, 1,
-0.7162459, -0.2510102, -1.069094, 1, 1, 1, 1, 1,
-0.7042353, -1.145975, -3.463402, 1, 1, 1, 1, 1,
-0.7039354, 0.7328022, 0.2581127, 1, 1, 1, 1, 1,
-0.7013052, -0.3152188, -1.895793, 1, 1, 1, 1, 1,
-0.6979216, -0.2644069, -1.762947, 1, 1, 1, 1, 1,
-0.6923695, 0.9849554, -1.068783, 1, 1, 1, 1, 1,
-0.6861697, 0.3065191, -1.540158, 1, 1, 1, 1, 1,
-0.6844627, 0.4707144, 1.288411, 1, 1, 1, 1, 1,
-0.683663, 1.015644, -0.2502076, 0, 0, 1, 1, 1,
-0.679767, -0.7911689, -1.922166, 1, 0, 0, 1, 1,
-0.6788961, -2.019101, -2.377845, 1, 0, 0, 1, 1,
-0.6784794, -0.04781811, -0.9279059, 1, 0, 0, 1, 1,
-0.6766188, -1.104306, -3.016685, 1, 0, 0, 1, 1,
-0.6760005, -0.4089962, -1.314103, 1, 0, 0, 1, 1,
-0.6651105, 0.8824288, 0.4468977, 0, 0, 0, 1, 1,
-0.6651095, -0.8058217, -2.857888, 0, 0, 0, 1, 1,
-0.6537991, 1.097508, -0.9366616, 0, 0, 0, 1, 1,
-0.6525106, 0.5791416, -0.8920777, 0, 0, 0, 1, 1,
-0.6485108, -0.25183, -1.730847, 0, 0, 0, 1, 1,
-0.6453316, 0.3396972, -2.051712, 0, 0, 0, 1, 1,
-0.6433793, 0.6796446, -0.0343214, 0, 0, 0, 1, 1,
-0.6355788, 0.8933029, 0.9565124, 1, 1, 1, 1, 1,
-0.6313993, 0.8845075, -1.285403, 1, 1, 1, 1, 1,
-0.6309045, -2.601388, -2.457108, 1, 1, 1, 1, 1,
-0.6303377, -1.18574, -1.781013, 1, 1, 1, 1, 1,
-0.629568, 0.7374522, -0.6266918, 1, 1, 1, 1, 1,
-0.6187234, -0.4807112, -1.592346, 1, 1, 1, 1, 1,
-0.6148075, -1.415707, -3.306729, 1, 1, 1, 1, 1,
-0.6138707, -0.3648743, -1.314645, 1, 1, 1, 1, 1,
-0.6125385, 0.7913335, -0.3674875, 1, 1, 1, 1, 1,
-0.6076788, 1.749902, 0.4903017, 1, 1, 1, 1, 1,
-0.6075906, -1.8839, -3.415668, 1, 1, 1, 1, 1,
-0.607349, -0.1101408, -1.866758, 1, 1, 1, 1, 1,
-0.6070146, -0.8843243, -2.313926, 1, 1, 1, 1, 1,
-0.6043056, -1.336172, -3.320651, 1, 1, 1, 1, 1,
-0.603987, 0.6863056, -0.05963011, 1, 1, 1, 1, 1,
-0.602062, -0.7010733, -4.140399, 0, 0, 1, 1, 1,
-0.5981872, -0.7203966, -1.513942, 1, 0, 0, 1, 1,
-0.5977401, -0.8409333, -2.374822, 1, 0, 0, 1, 1,
-0.597357, -0.4514042, -1.469868, 1, 0, 0, 1, 1,
-0.5957042, 1.487097, -0.3874071, 1, 0, 0, 1, 1,
-0.5921672, -0.7490733, -1.529295, 1, 0, 0, 1, 1,
-0.5906966, 2.077007, -0.4340119, 0, 0, 0, 1, 1,
-0.5891115, 0.1801852, -2.480049, 0, 0, 0, 1, 1,
-0.581677, -0.2552174, -2.226614, 0, 0, 0, 1, 1,
-0.5810989, 0.7498021, 0.3701487, 0, 0, 0, 1, 1,
-0.5801505, -0.2810623, -2.207394, 0, 0, 0, 1, 1,
-0.5801131, 1.212636, 0.2624117, 0, 0, 0, 1, 1,
-0.579953, 0.1156983, -1.902223, 0, 0, 0, 1, 1,
-0.5798429, -0.995354, -2.140861, 1, 1, 1, 1, 1,
-0.5758693, 0.6586155, -2.563924, 1, 1, 1, 1, 1,
-0.5719805, -1.107297, -2.651426, 1, 1, 1, 1, 1,
-0.5663201, 0.8932377, -0.1305803, 1, 1, 1, 1, 1,
-0.5650408, 0.5616491, -1.869657, 1, 1, 1, 1, 1,
-0.5607374, -0.1632042, -4.193244, 1, 1, 1, 1, 1,
-0.5592726, -0.2008383, -1.925291, 1, 1, 1, 1, 1,
-0.5592196, 0.2653687, -1.02808, 1, 1, 1, 1, 1,
-0.5581587, 0.3699635, 0.3638694, 1, 1, 1, 1, 1,
-0.5579419, 1.940935, 0.3531632, 1, 1, 1, 1, 1,
-0.5569314, 0.05461605, -0.9005825, 1, 1, 1, 1, 1,
-0.55573, 0.9087044, -0.9771807, 1, 1, 1, 1, 1,
-0.5546933, -0.03741731, -0.9220212, 1, 1, 1, 1, 1,
-0.5482461, 0.1059601, -0.485714, 1, 1, 1, 1, 1,
-0.5456005, 1.02017, 0.6437806, 1, 1, 1, 1, 1,
-0.5412518, 1.199026, -1.519811, 0, 0, 1, 1, 1,
-0.5285572, 0.6682592, -0.4950218, 1, 0, 0, 1, 1,
-0.5239543, 1.309704, 0.7431086, 1, 0, 0, 1, 1,
-0.5148712, -1.817146, -3.508663, 1, 0, 0, 1, 1,
-0.5107916, -1.138838, -2.73426, 1, 0, 0, 1, 1,
-0.5092184, 0.6597207, -2.280819, 1, 0, 0, 1, 1,
-0.50879, 0.6775607, -1.521537, 0, 0, 0, 1, 1,
-0.5073705, 1.204672, -0.5897047, 0, 0, 0, 1, 1,
-0.5034827, -0.05218291, -0.6409171, 0, 0, 0, 1, 1,
-0.4952773, -0.546483, -2.611379, 0, 0, 0, 1, 1,
-0.4849406, 0.4255801, -1.428592, 0, 0, 0, 1, 1,
-0.4849167, -0.06962085, -1.418734, 0, 0, 0, 1, 1,
-0.4820924, 0.9138212, -2.337136, 0, 0, 0, 1, 1,
-0.4818541, 0.4761614, -1.511883, 1, 1, 1, 1, 1,
-0.473616, 0.5883346, 0.7611834, 1, 1, 1, 1, 1,
-0.4732935, 0.1937783, -2.48374, 1, 1, 1, 1, 1,
-0.4730374, 0.902893, -1.118205, 1, 1, 1, 1, 1,
-0.4687024, 0.0513846, -1.154636, 1, 1, 1, 1, 1,
-0.4635162, -0.3082986, -2.259531, 1, 1, 1, 1, 1,
-0.4596406, -1.650531, -3.915107, 1, 1, 1, 1, 1,
-0.4593838, -0.6874928, -3.433501, 1, 1, 1, 1, 1,
-0.4493949, -2.908967, -0.3478761, 1, 1, 1, 1, 1,
-0.4479179, 0.7099562, -0.1645523, 1, 1, 1, 1, 1,
-0.4447066, 1.514675, -0.4114677, 1, 1, 1, 1, 1,
-0.4444721, 2.149933, -0.4032358, 1, 1, 1, 1, 1,
-0.4427954, -1.405471, -2.019254, 1, 1, 1, 1, 1,
-0.4425772, 1.111289, 0.5547369, 1, 1, 1, 1, 1,
-0.4403643, -0.6587214, -2.503607, 1, 1, 1, 1, 1,
-0.4362041, -0.5205455, -2.548621, 0, 0, 1, 1, 1,
-0.4321542, -1.247992, -2.465838, 1, 0, 0, 1, 1,
-0.4294112, 0.4174704, 0.1609359, 1, 0, 0, 1, 1,
-0.4286841, -0.8413408, -2.621671, 1, 0, 0, 1, 1,
-0.4277764, -1.002459, -1.704087, 1, 0, 0, 1, 1,
-0.4252748, -0.8448511, -2.848908, 1, 0, 0, 1, 1,
-0.4221492, -1.811249, -2.447635, 0, 0, 0, 1, 1,
-0.415434, -0.9252901, -4.079736, 0, 0, 0, 1, 1,
-0.4147125, 1.10348, -1.218063, 0, 0, 0, 1, 1,
-0.4141898, -0.7753077, -1.571305, 0, 0, 0, 1, 1,
-0.4081385, -0.8051395, -2.608491, 0, 0, 0, 1, 1,
-0.405119, -0.395344, -2.644116, 0, 0, 0, 1, 1,
-0.3933462, 0.4834871, 0.2795832, 0, 0, 0, 1, 1,
-0.3932488, -0.05560825, -1.694752, 1, 1, 1, 1, 1,
-0.3916166, 0.4862636, -0.9455748, 1, 1, 1, 1, 1,
-0.3886302, -0.1552874, -0.2426752, 1, 1, 1, 1, 1,
-0.3862948, 0.3995671, 0.3580811, 1, 1, 1, 1, 1,
-0.3862925, 1.880594, -0.07428897, 1, 1, 1, 1, 1,
-0.3857744, 0.1809163, -0.8385283, 1, 1, 1, 1, 1,
-0.3789017, -0.5769206, -2.203827, 1, 1, 1, 1, 1,
-0.3784311, -1.847909, -1.940837, 1, 1, 1, 1, 1,
-0.3735495, 1.251685, -0.8080947, 1, 1, 1, 1, 1,
-0.3733824, 0.1096197, -0.7309236, 1, 1, 1, 1, 1,
-0.3717897, -0.1712871, -0.9818649, 1, 1, 1, 1, 1,
-0.3716808, -0.4548689, -3.963187, 1, 1, 1, 1, 1,
-0.3701837, -0.7698195, -2.682574, 1, 1, 1, 1, 1,
-0.3682662, 0.1817403, 0.2269807, 1, 1, 1, 1, 1,
-0.3647726, -1.362894, -3.071334, 1, 1, 1, 1, 1,
-0.3637755, -1.353641, -3.228942, 0, 0, 1, 1, 1,
-0.360746, -0.08481614, -1.922977, 1, 0, 0, 1, 1,
-0.3584129, 0.537348, -1.031438, 1, 0, 0, 1, 1,
-0.352526, -1.396895, -1.744815, 1, 0, 0, 1, 1,
-0.3520888, -1.211965, -0.5503994, 1, 0, 0, 1, 1,
-0.3506209, 0.7923679, 2.077556, 1, 0, 0, 1, 1,
-0.3479066, 0.490775, -1.612743, 0, 0, 0, 1, 1,
-0.3437279, -1.198084, -3.386234, 0, 0, 0, 1, 1,
-0.3357354, 1.508689, 0.6957058, 0, 0, 0, 1, 1,
-0.3336608, 0.5376057, -0.3415162, 0, 0, 0, 1, 1,
-0.3330518, 1.443787, 1.647653, 0, 0, 0, 1, 1,
-0.331842, 0.2561018, -0.4014548, 0, 0, 0, 1, 1,
-0.3267332, -1.8878, -4.226925, 0, 0, 0, 1, 1,
-0.3221078, -0.4445044, -2.246857, 1, 1, 1, 1, 1,
-0.3219579, 0.9668663, -0.09885699, 1, 1, 1, 1, 1,
-0.3213444, -0.7136692, -2.114031, 1, 1, 1, 1, 1,
-0.3193938, -1.73006, -3.711075, 1, 1, 1, 1, 1,
-0.3187721, -0.08779398, -1.403217, 1, 1, 1, 1, 1,
-0.3166823, 0.2079265, 1.386583, 1, 1, 1, 1, 1,
-0.3118972, -0.5874172, -0.9264053, 1, 1, 1, 1, 1,
-0.3115605, -0.55337, -2.833164, 1, 1, 1, 1, 1,
-0.3078942, -0.1765358, -2.649625, 1, 1, 1, 1, 1,
-0.3052166, 0.1329029, -2.221631, 1, 1, 1, 1, 1,
-0.3042684, -0.5874551, -2.601124, 1, 1, 1, 1, 1,
-0.2953809, 1.002462, -1.788438, 1, 1, 1, 1, 1,
-0.294239, -1.012931, -2.201319, 1, 1, 1, 1, 1,
-0.2873489, 0.3141491, 0.03060822, 1, 1, 1, 1, 1,
-0.282431, 0.04381738, -1.875971, 1, 1, 1, 1, 1,
-0.2813425, -0.03343523, -1.108986, 0, 0, 1, 1, 1,
-0.2779553, -1.048321, -2.042088, 1, 0, 0, 1, 1,
-0.2720473, -0.5680075, -2.688639, 1, 0, 0, 1, 1,
-0.2628453, 2.048343, -0.9247594, 1, 0, 0, 1, 1,
-0.2626077, 1.088205, -0.8972656, 1, 0, 0, 1, 1,
-0.2624295, -1.104627, -0.5445317, 1, 0, 0, 1, 1,
-0.2619136, 0.4979094, -1.275688, 0, 0, 0, 1, 1,
-0.2602081, 1.119793, 1.451079, 0, 0, 0, 1, 1,
-0.2581273, 0.762423, 0.07489672, 0, 0, 0, 1, 1,
-0.2579021, -0.01295179, -1.307788, 0, 0, 0, 1, 1,
-0.2560669, 0.06872113, -1.635398, 0, 0, 0, 1, 1,
-0.2476577, -1.489657, -0.1070685, 0, 0, 0, 1, 1,
-0.2475837, -2.029767, -3.588496, 0, 0, 0, 1, 1,
-0.2466966, -0.2982435, -1.977406, 1, 1, 1, 1, 1,
-0.245164, -0.6823539, -1.504638, 1, 1, 1, 1, 1,
-0.2447217, -0.5055192, -2.165922, 1, 1, 1, 1, 1,
-0.2434087, 0.528516, -1.061659, 1, 1, 1, 1, 1,
-0.2434039, -0.2520116, -3.01437, 1, 1, 1, 1, 1,
-0.2375047, 1.369436, -0.2813878, 1, 1, 1, 1, 1,
-0.2344811, -0.9140372, -2.722113, 1, 1, 1, 1, 1,
-0.2334889, 0.1076143, -3.378257, 1, 1, 1, 1, 1,
-0.2326158, -1.539617, -3.725934, 1, 1, 1, 1, 1,
-0.2277045, -0.7147815, -3.432958, 1, 1, 1, 1, 1,
-0.227268, -0.4431595, -3.444859, 1, 1, 1, 1, 1,
-0.2192484, 1.412374, -0.4961409, 1, 1, 1, 1, 1,
-0.2148221, 0.9029518, -2.187299, 1, 1, 1, 1, 1,
-0.2080803, -1.344208, -1.995712, 1, 1, 1, 1, 1,
-0.2069283, 2.127056, -0.8630967, 1, 1, 1, 1, 1,
-0.2060775, -0.3343899, -2.753518, 0, 0, 1, 1, 1,
-0.2018697, -2.017021, -3.12143, 1, 0, 0, 1, 1,
-0.1981449, 0.9662731, -0.8661325, 1, 0, 0, 1, 1,
-0.1968766, 0.284503, -1.673151, 1, 0, 0, 1, 1,
-0.1966811, 0.2064739, 0.303979, 1, 0, 0, 1, 1,
-0.1963095, 0.02313402, -1.813122, 1, 0, 0, 1, 1,
-0.1920977, -0.8778705, -3.127201, 0, 0, 0, 1, 1,
-0.1899666, 0.9676691, -0.8288198, 0, 0, 0, 1, 1,
-0.1899447, -0.8931096, -2.314336, 0, 0, 0, 1, 1,
-0.1888447, 0.8586172, -1.753857, 0, 0, 0, 1, 1,
-0.1864349, 2.057156, -0.4994222, 0, 0, 0, 1, 1,
-0.185467, -1.614666, -2.417686, 0, 0, 0, 1, 1,
-0.1854066, 0.5055894, 0.5504251, 0, 0, 0, 1, 1,
-0.1853585, -0.8357248, -3.951775, 1, 1, 1, 1, 1,
-0.184627, 1.057496, -0.05444844, 1, 1, 1, 1, 1,
-0.1834596, 1.497925, -1.59772, 1, 1, 1, 1, 1,
-0.1808691, 0.4472444, -0.8205955, 1, 1, 1, 1, 1,
-0.1792694, 0.8313895, 0.2963381, 1, 1, 1, 1, 1,
-0.1689861, 0.1933298, -0.3903442, 1, 1, 1, 1, 1,
-0.1672289, 1.087823, -0.247673, 1, 1, 1, 1, 1,
-0.1669438, -1.29892, -2.315642, 1, 1, 1, 1, 1,
-0.1662427, -0.3467635, -1.055576, 1, 1, 1, 1, 1,
-0.1573806, -0.4393774, -3.75135, 1, 1, 1, 1, 1,
-0.1552599, -1.087115, -3.420199, 1, 1, 1, 1, 1,
-0.1547099, 0.2930908, 1.211154, 1, 1, 1, 1, 1,
-0.1487631, -1.498205, -4.485813, 1, 1, 1, 1, 1,
-0.1469914, -0.1175884, -1.575879, 1, 1, 1, 1, 1,
-0.1457476, -1.382394, -3.181049, 1, 1, 1, 1, 1,
-0.1454129, 1.224461, -0.2555266, 0, 0, 1, 1, 1,
-0.142202, -0.6507311, -4.056351, 1, 0, 0, 1, 1,
-0.1411588, 1.871315, 0.5052783, 1, 0, 0, 1, 1,
-0.1398907, -0.3836074, -3.26131, 1, 0, 0, 1, 1,
-0.1394516, -0.669364, -3.257902, 1, 0, 0, 1, 1,
-0.1387735, 0.02683939, -1.860348, 1, 0, 0, 1, 1,
-0.1362043, -0.66527, -3.717368, 0, 0, 0, 1, 1,
-0.127966, -1.387765, -3.54666, 0, 0, 0, 1, 1,
-0.1259689, 1.032168, 0.1614497, 0, 0, 0, 1, 1,
-0.1239402, 1.482257, 0.06214223, 0, 0, 0, 1, 1,
-0.1212619, 1.152035, -0.8835394, 0, 0, 0, 1, 1,
-0.1204377, 0.0933585, -1.594313, 0, 0, 0, 1, 1,
-0.1155596, 0.9480888, -0.1632877, 0, 0, 0, 1, 1,
-0.114916, 1.012779, -0.200541, 1, 1, 1, 1, 1,
-0.1138118, -0.5694966, -4.339477, 1, 1, 1, 1, 1,
-0.1115643, 0.132045, -0.7479544, 1, 1, 1, 1, 1,
-0.1112778, -1.782699, -2.420478, 1, 1, 1, 1, 1,
-0.1109386, 0.4170236, 0.6949666, 1, 1, 1, 1, 1,
-0.1089751, 0.1726986, -2.656172, 1, 1, 1, 1, 1,
-0.1070342, 0.3761979, -1.045825, 1, 1, 1, 1, 1,
-0.1064778, 1.850084, -0.08687348, 1, 1, 1, 1, 1,
-0.1032212, -1.233981, -3.44351, 1, 1, 1, 1, 1,
-0.1004109, -0.3949585, -3.578923, 1, 1, 1, 1, 1,
-0.09358495, -1.50397, -4.380258, 1, 1, 1, 1, 1,
-0.08906052, -0.05204663, -1.925228, 1, 1, 1, 1, 1,
-0.08785649, 0.08531127, -0.7722345, 1, 1, 1, 1, 1,
-0.08616955, 1.117409, 0.4800763, 1, 1, 1, 1, 1,
-0.08574498, -0.2979437, -2.257252, 1, 1, 1, 1, 1,
-0.08453735, 0.7754989, -1.779931, 0, 0, 1, 1, 1,
-0.08431542, 0.08455437, 0.6981137, 1, 0, 0, 1, 1,
-0.08177205, -1.308018, -3.600211, 1, 0, 0, 1, 1,
-0.07996085, 0.4438245, 0.06852281, 1, 0, 0, 1, 1,
-0.07598778, 0.8587889, -0.2933328, 1, 0, 0, 1, 1,
-0.07513217, -0.6425626, -1.434488, 1, 0, 0, 1, 1,
-0.07413252, -1.881747, -4.28009, 0, 0, 0, 1, 1,
-0.07136362, 0.07338162, -1.866345, 0, 0, 0, 1, 1,
-0.06831042, 0.4822024, -1.603291, 0, 0, 0, 1, 1,
-0.06677049, 0.525479, -0.001084951, 0, 0, 0, 1, 1,
-0.06573224, -0.1752157, -2.721804, 0, 0, 0, 1, 1,
-0.06474537, 0.4740293, 0.3650981, 0, 0, 0, 1, 1,
-0.06359957, 0.7284727, 0.3449925, 0, 0, 0, 1, 1,
-0.06221948, -1.48201, -3.290896, 1, 1, 1, 1, 1,
-0.06184722, 0.4265636, -2.152209, 1, 1, 1, 1, 1,
-0.05934077, 0.06679688, -0.6388463, 1, 1, 1, 1, 1,
-0.05885839, 0.8211593, -0.4797657, 1, 1, 1, 1, 1,
-0.05768191, -0.5472426, -1.986164, 1, 1, 1, 1, 1,
-0.05162241, -0.01086463, -1.422522, 1, 1, 1, 1, 1,
-0.05060617, 0.2068978, -2.530297, 1, 1, 1, 1, 1,
-0.05055651, 0.4621978, 0.1937455, 1, 1, 1, 1, 1,
-0.04976247, 0.315495, 0.06099116, 1, 1, 1, 1, 1,
-0.04356848, 0.1044302, -0.3785393, 1, 1, 1, 1, 1,
-0.0429424, -0.8185933, -4.562238, 1, 1, 1, 1, 1,
-0.04278444, -0.8475875, -2.706533, 1, 1, 1, 1, 1,
-0.04137023, 0.2464228, -0.936682, 1, 1, 1, 1, 1,
-0.04086289, -0.7152008, -1.670139, 1, 1, 1, 1, 1,
-0.04072745, 0.6830028, 0.8010191, 1, 1, 1, 1, 1,
-0.04031047, -1.015389, -2.216321, 0, 0, 1, 1, 1,
-0.03870163, -1.516977, -3.657855, 1, 0, 0, 1, 1,
-0.03731115, -0.8817558, -2.734938, 1, 0, 0, 1, 1,
-0.03685948, -0.7169158, -2.577479, 1, 0, 0, 1, 1,
-0.03258797, -0.6323963, -1.727632, 1, 0, 0, 1, 1,
-0.02815654, 0.5024208, -0.3107884, 1, 0, 0, 1, 1,
-0.02736459, -0.7587754, -3.020569, 0, 0, 0, 1, 1,
-0.02569926, -1.857487, -3.484125, 0, 0, 0, 1, 1,
-0.0208931, 1.396617, 0.4460003, 0, 0, 0, 1, 1,
-0.01795355, -0.08937025, -3.409448, 0, 0, 0, 1, 1,
-0.0148145, 0.01017929, -0.6271725, 0, 0, 0, 1, 1,
-0.01062217, -1.941549, -5.090483, 0, 0, 0, 1, 1,
-0.009145298, 0.2203624, -0.2681127, 0, 0, 0, 1, 1,
-0.008294174, -0.2427569, -4.005248, 1, 1, 1, 1, 1,
-0.008082295, -0.0312278, -3.082194, 1, 1, 1, 1, 1,
0.001502282, 1.185793, 0.3245985, 1, 1, 1, 1, 1,
0.00286891, 0.8810092, -0.6202788, 1, 1, 1, 1, 1,
0.007143672, -1.611726, 1.698469, 1, 1, 1, 1, 1,
0.0111321, 0.6943209, -0.9097177, 1, 1, 1, 1, 1,
0.01113433, 1.289018, -0.3875456, 1, 1, 1, 1, 1,
0.01405753, -0.602103, 1.936041, 1, 1, 1, 1, 1,
0.02079358, -1.377832, 3.845832, 1, 1, 1, 1, 1,
0.02105823, -1.163196, 2.870086, 1, 1, 1, 1, 1,
0.02289223, -0.3473224, 3.608322, 1, 1, 1, 1, 1,
0.02443847, -0.04025598, 3.442422, 1, 1, 1, 1, 1,
0.02660301, -0.8839957, 3.970146, 1, 1, 1, 1, 1,
0.02839083, -0.02005822, 1.201745, 1, 1, 1, 1, 1,
0.02862693, -0.02257324, 2.252694, 1, 1, 1, 1, 1,
0.02897871, 0.1333633, 0.2143512, 0, 0, 1, 1, 1,
0.03019891, 0.4273572, -0.2066663, 1, 0, 0, 1, 1,
0.03503647, -0.7979928, 4.191876, 1, 0, 0, 1, 1,
0.03581478, -2.649494, 2.977027, 1, 0, 0, 1, 1,
0.03653905, 0.4185373, -1.700115, 1, 0, 0, 1, 1,
0.0390404, 0.9446996, -0.6910576, 1, 0, 0, 1, 1,
0.03905847, -0.9838569, 1.466041, 0, 0, 0, 1, 1,
0.04194799, 0.3519854, 1.314143, 0, 0, 0, 1, 1,
0.05298206, 0.05913538, -1.427082, 0, 0, 0, 1, 1,
0.05332937, -0.9377766, 3.7327, 0, 0, 0, 1, 1,
0.05343234, 1.190508, -0.1202622, 0, 0, 0, 1, 1,
0.05376225, 0.7790696, 0.2423154, 0, 0, 0, 1, 1,
0.05543929, 1.569416, -1.332136, 0, 0, 0, 1, 1,
0.05624387, 0.574379, -1.144292, 1, 1, 1, 1, 1,
0.06819674, 1.540965, 0.1893293, 1, 1, 1, 1, 1,
0.06911147, -0.202205, 3.415976, 1, 1, 1, 1, 1,
0.07048092, 1.51794, 0.4581361, 1, 1, 1, 1, 1,
0.07663918, 1.124457, -0.8219269, 1, 1, 1, 1, 1,
0.07799462, -0.5185274, 3.742399, 1, 1, 1, 1, 1,
0.08869876, -0.9763276, 1.866204, 1, 1, 1, 1, 1,
0.09057451, -0.4339519, 3.534717, 1, 1, 1, 1, 1,
0.0971413, -0.1714606, 3.490761, 1, 1, 1, 1, 1,
0.09833588, -0.1415859, 3.20779, 1, 1, 1, 1, 1,
0.09928498, -0.3033896, 4.04616, 1, 1, 1, 1, 1,
0.1092564, -0.7676853, 1.708733, 1, 1, 1, 1, 1,
0.1106979, 0.1073549, 1.529686, 1, 1, 1, 1, 1,
0.1131845, -1.274855, 2.675665, 1, 1, 1, 1, 1,
0.1139002, 0.3875389, -0.1089736, 1, 1, 1, 1, 1,
0.1176924, 1.232225, 0.24725, 0, 0, 1, 1, 1,
0.1186223, 0.9239376, 0.1261618, 1, 0, 0, 1, 1,
0.119472, 0.8953591, -0.8098865, 1, 0, 0, 1, 1,
0.1195741, 0.7368831, 1.479091, 1, 0, 0, 1, 1,
0.1217142, -1.565112, 1.78537, 1, 0, 0, 1, 1,
0.1308008, 0.8794722, -0.1643443, 1, 0, 0, 1, 1,
0.1438916, 0.9930645, 0.6623363, 0, 0, 0, 1, 1,
0.1480557, -0.8352875, 1.393551, 0, 0, 0, 1, 1,
0.1507211, -0.0612356, 2.627738, 0, 0, 0, 1, 1,
0.1525458, -0.3332923, 2.516714, 0, 0, 0, 1, 1,
0.1527802, 0.3529506, -0.5884117, 0, 0, 0, 1, 1,
0.1567119, -2.407939, 2.539973, 0, 0, 0, 1, 1,
0.1570893, 0.3479002, 0.03805441, 0, 0, 0, 1, 1,
0.1602224, -0.03709453, 1.821307, 1, 1, 1, 1, 1,
0.1637911, 0.7164913, 0.02745208, 1, 1, 1, 1, 1,
0.1655437, -0.2869407, 3.220958, 1, 1, 1, 1, 1,
0.1758239, -0.2627127, 0.5163091, 1, 1, 1, 1, 1,
0.17685, 0.5787815, 0.2777227, 1, 1, 1, 1, 1,
0.1788604, 1.104977, -0.5801054, 1, 1, 1, 1, 1,
0.1794298, -0.6839343, 3.730457, 1, 1, 1, 1, 1,
0.1820497, -1.208508, 0.4363463, 1, 1, 1, 1, 1,
0.1850437, -1.583692, 1.937796, 1, 1, 1, 1, 1,
0.1880181, -1.012997, 2.414926, 1, 1, 1, 1, 1,
0.1912104, 0.701372, -0.5271983, 1, 1, 1, 1, 1,
0.1918763, 1.267008, -0.6151323, 1, 1, 1, 1, 1,
0.1988038, 0.2022154, 0.5163636, 1, 1, 1, 1, 1,
0.1997764, -0.1070014, 1.564515, 1, 1, 1, 1, 1,
0.2000287, -0.701865, 2.131154, 1, 1, 1, 1, 1,
0.2009833, -1.163509, 3.193627, 0, 0, 1, 1, 1,
0.2026212, 1.308025, -0.4505072, 1, 0, 0, 1, 1,
0.2031063, -0.08421677, 1.141881, 1, 0, 0, 1, 1,
0.2054482, 2.167695, -0.2869375, 1, 0, 0, 1, 1,
0.2075535, -1.351791, 2.083512, 1, 0, 0, 1, 1,
0.210486, -0.3695431, 3.591878, 1, 0, 0, 1, 1,
0.2122319, 1.170018, -0.03878272, 0, 0, 0, 1, 1,
0.215042, 0.08084151, 1.63554, 0, 0, 0, 1, 1,
0.2167349, 2.104497, -1.976447, 0, 0, 0, 1, 1,
0.2179822, 2.088016, 0.7681273, 0, 0, 0, 1, 1,
0.2186466, 0.2546423, 1.30242, 0, 0, 0, 1, 1,
0.21882, -0.5854934, 2.889411, 0, 0, 0, 1, 1,
0.2205045, -1.558679, 3.254776, 0, 0, 0, 1, 1,
0.2222532, -0.4987416, 2.29142, 1, 1, 1, 1, 1,
0.2226413, 1.664898, -1.397761, 1, 1, 1, 1, 1,
0.2238333, 0.9592571, 0.3308141, 1, 1, 1, 1, 1,
0.2251692, -0.2951493, 1.840714, 1, 1, 1, 1, 1,
0.2252823, 0.3613092, 1.256542, 1, 1, 1, 1, 1,
0.2272799, 0.5673032, 0.4611946, 1, 1, 1, 1, 1,
0.2273487, 1.126807, 0.4711785, 1, 1, 1, 1, 1,
0.2275081, 0.2053795, 0.692314, 1, 1, 1, 1, 1,
0.2300832, -0.4848324, 3.73495, 1, 1, 1, 1, 1,
0.2324573, 1.079942, 1.554834, 1, 1, 1, 1, 1,
0.2392204, 0.5777475, 1.341284, 1, 1, 1, 1, 1,
0.2393431, -0.09342563, 1.394483, 1, 1, 1, 1, 1,
0.2394976, -0.4695747, 2.938077, 1, 1, 1, 1, 1,
0.2398104, 2.006087, -0.4213576, 1, 1, 1, 1, 1,
0.2421843, 1.28466, 1.547936, 1, 1, 1, 1, 1,
0.2435639, -0.09201381, 1.193678, 0, 0, 1, 1, 1,
0.244745, 0.7724972, 0.5362268, 1, 0, 0, 1, 1,
0.2475933, -0.6843996, 3.426771, 1, 0, 0, 1, 1,
0.2502863, 0.1722219, 0.2451597, 1, 0, 0, 1, 1,
0.2528606, 2.094998, 0.01144718, 1, 0, 0, 1, 1,
0.2531979, -1.080465, 3.357255, 1, 0, 0, 1, 1,
0.2540428, 2.027253, 1.152051, 0, 0, 0, 1, 1,
0.2558545, 0.5651731, 1.102601, 0, 0, 0, 1, 1,
0.2575334, 1.275718, 0.8103709, 0, 0, 0, 1, 1,
0.2577943, 0.6257591, 1.545937, 0, 0, 0, 1, 1,
0.2656378, 1.073175, -0.06516188, 0, 0, 0, 1, 1,
0.2659151, 1.887457, 1.040124, 0, 0, 0, 1, 1,
0.2667021, -0.8315995, 3.195684, 0, 0, 0, 1, 1,
0.2714806, -1.213254, 4.594273, 1, 1, 1, 1, 1,
0.2726808, 0.2918872, -0.901297, 1, 1, 1, 1, 1,
0.2751785, 0.9271006, 1.440674, 1, 1, 1, 1, 1,
0.2768095, 0.6134812, 1.918107, 1, 1, 1, 1, 1,
0.2781803, -0.3854989, 2.17553, 1, 1, 1, 1, 1,
0.2788307, 0.2345918, -0.8526971, 1, 1, 1, 1, 1,
0.280714, 1.693444, 1.68899, 1, 1, 1, 1, 1,
0.2838864, -0.2527267, 3.211071, 1, 1, 1, 1, 1,
0.2909277, -0.06229495, 1.859929, 1, 1, 1, 1, 1,
0.2998745, 0.5695451, -0.1604572, 1, 1, 1, 1, 1,
0.3089283, -0.8259006, 3.599154, 1, 1, 1, 1, 1,
0.3107933, -1.353837, 3.618215, 1, 1, 1, 1, 1,
0.3137676, -2.286754, 3.141371, 1, 1, 1, 1, 1,
0.3154341, 0.03029608, 1.785752, 1, 1, 1, 1, 1,
0.3172159, -1.018962, 3.95982, 1, 1, 1, 1, 1,
0.3225214, -0.6078241, 3.030153, 0, 0, 1, 1, 1,
0.3312212, 0.1266747, 1.809587, 1, 0, 0, 1, 1,
0.3375989, 0.2654809, 1.336451, 1, 0, 0, 1, 1,
0.3454461, 0.01320441, 3.10357, 1, 0, 0, 1, 1,
0.3460802, 2.123319, 0.3993527, 1, 0, 0, 1, 1,
0.3472901, -0.2593767, 2.603444, 1, 0, 0, 1, 1,
0.3491592, 1.551155, 1.39627, 0, 0, 0, 1, 1,
0.3519332, 0.3668931, 0.2710491, 0, 0, 0, 1, 1,
0.3528645, 1.64757, 0.3759717, 0, 0, 0, 1, 1,
0.3605862, -0.6465723, 4.08649, 0, 0, 0, 1, 1,
0.3628138, 0.211301, 1.976463, 0, 0, 0, 1, 1,
0.368024, 0.07729402, -1.305991, 0, 0, 0, 1, 1,
0.3700143, -0.4421977, 1.823555, 0, 0, 0, 1, 1,
0.3738644, 0.917667, 0.7456576, 1, 1, 1, 1, 1,
0.3750227, -0.6579132, 1.934158, 1, 1, 1, 1, 1,
0.3765421, 0.3496705, 0.1617404, 1, 1, 1, 1, 1,
0.3769178, -1.40622, 3.824255, 1, 1, 1, 1, 1,
0.3769825, -0.03501925, 2.792746, 1, 1, 1, 1, 1,
0.3770403, 0.2130767, 0.6960868, 1, 1, 1, 1, 1,
0.3783531, 1.179347, -0.8948986, 1, 1, 1, 1, 1,
0.3801068, 0.08075271, 1.510818, 1, 1, 1, 1, 1,
0.3805292, -0.9714333, 3.128165, 1, 1, 1, 1, 1,
0.3807349, -0.8187082, 2.310494, 1, 1, 1, 1, 1,
0.3894157, -0.9078528, 4.139951, 1, 1, 1, 1, 1,
0.3999921, -1.420866, 2.258439, 1, 1, 1, 1, 1,
0.4036548, 1.032195, 0.06115455, 1, 1, 1, 1, 1,
0.4055662, 0.8806304, -0.1002783, 1, 1, 1, 1, 1,
0.4059842, 0.5373424, 1.43048, 1, 1, 1, 1, 1,
0.4103116, -0.5682546, 2.775057, 0, 0, 1, 1, 1,
0.4144232, -1.261983, 3.177341, 1, 0, 0, 1, 1,
0.4198326, 0.3001608, 0.4318776, 1, 0, 0, 1, 1,
0.4206455, 1.32434, 0.5384234, 1, 0, 0, 1, 1,
0.4250412, 0.6790079, 0.9495823, 1, 0, 0, 1, 1,
0.4277188, 0.599884, -1.547449, 1, 0, 0, 1, 1,
0.4288862, 0.5298041, 0.6718986, 0, 0, 0, 1, 1,
0.4345523, -2.316237, 3.117999, 0, 0, 0, 1, 1,
0.4360469, 1.578956, 1.063581, 0, 0, 0, 1, 1,
0.4373546, -0.6339372, 1.881345, 0, 0, 0, 1, 1,
0.4402218, 0.3586658, -0.1344719, 0, 0, 0, 1, 1,
0.4421353, 0.417208, -0.3059238, 0, 0, 0, 1, 1,
0.4434038, 0.4446686, 1.685422, 0, 0, 0, 1, 1,
0.4437424, 0.1394829, 1.251209, 1, 1, 1, 1, 1,
0.4554157, 1.034963, -0.970443, 1, 1, 1, 1, 1,
0.4571927, 0.01490779, 3.650884, 1, 1, 1, 1, 1,
0.4585746, -1.112015, 1.465368, 1, 1, 1, 1, 1,
0.4597168, -1.143185, 4.257988, 1, 1, 1, 1, 1,
0.4627567, -0.178317, 3.959747, 1, 1, 1, 1, 1,
0.470383, 0.09750804, 1.006414, 1, 1, 1, 1, 1,
0.4708059, 0.01319043, 1.325243, 1, 1, 1, 1, 1,
0.4722655, -1.342456, 3.028339, 1, 1, 1, 1, 1,
0.4728436, 0.836701, -0.2441977, 1, 1, 1, 1, 1,
0.4776565, -0.5402638, 4.216644, 1, 1, 1, 1, 1,
0.478086, 1.81623, 1.777031, 1, 1, 1, 1, 1,
0.4825046, 2.433442, 1.652714, 1, 1, 1, 1, 1,
0.4899006, 0.7998234, -0.08654501, 1, 1, 1, 1, 1,
0.4927469, 0.7820918, 2.87535, 1, 1, 1, 1, 1,
0.4931205, -0.3152712, 3.589688, 0, 0, 1, 1, 1,
0.4992237, 1.478314, 0.472243, 1, 0, 0, 1, 1,
0.505617, -1.724104, 2.857415, 1, 0, 0, 1, 1,
0.5150321, -1.599892, 3.182954, 1, 0, 0, 1, 1,
0.5193903, -0.2545997, 1.996478, 1, 0, 0, 1, 1,
0.5217299, 0.836283, -0.1615343, 1, 0, 0, 1, 1,
0.527231, -0.592538, 0.447876, 0, 0, 0, 1, 1,
0.5316824, -0.2749417, 1.174338, 0, 0, 0, 1, 1,
0.5338489, 0.6985798, 0.8768486, 0, 0, 0, 1, 1,
0.5340347, 0.222606, 1.666598, 0, 0, 0, 1, 1,
0.5357271, 1.124286, 0.4003719, 0, 0, 0, 1, 1,
0.5357834, -0.1615535, 2.147312, 0, 0, 0, 1, 1,
0.5389994, 0.05809877, 0.4914482, 0, 0, 0, 1, 1,
0.5411958, -0.8312096, 2.681732, 1, 1, 1, 1, 1,
0.5437335, -0.9476722, 2.332618, 1, 1, 1, 1, 1,
0.5454596, -1.778478, 2.951715, 1, 1, 1, 1, 1,
0.5458916, 0.4971042, 1.288126, 1, 1, 1, 1, 1,
0.5468016, 1.230352, 0.03309304, 1, 1, 1, 1, 1,
0.5487143, -2.666587, 1.307678, 1, 1, 1, 1, 1,
0.5496697, -0.9240984, -0.4291189, 1, 1, 1, 1, 1,
0.5604669, -0.5854343, 3.248589, 1, 1, 1, 1, 1,
0.5606511, 0.0462748, 1.497518, 1, 1, 1, 1, 1,
0.56172, 0.9800607, -0.0247631, 1, 1, 1, 1, 1,
0.5645143, -0.4972977, 2.443419, 1, 1, 1, 1, 1,
0.5692975, -0.8465027, 3.074742, 1, 1, 1, 1, 1,
0.5809221, -3.412692, 1.81374, 1, 1, 1, 1, 1,
0.5847238, -0.1386894, 2.219472, 1, 1, 1, 1, 1,
0.5861967, 0.105714, 2.083763, 1, 1, 1, 1, 1,
0.5866999, -0.3600716, 1.14964, 0, 0, 1, 1, 1,
0.5978096, -0.6097183, 2.607068, 1, 0, 0, 1, 1,
0.5993022, 2.01021, -0.043432, 1, 0, 0, 1, 1,
0.6005305, 0.3081513, 0.9984816, 1, 0, 0, 1, 1,
0.6022106, -1.258756, 4.989325, 1, 0, 0, 1, 1,
0.6038298, 0.2618833, 1.025277, 1, 0, 0, 1, 1,
0.6043122, -0.7216401, 2.767322, 0, 0, 0, 1, 1,
0.6051403, 1.241538, 0.5825281, 0, 0, 0, 1, 1,
0.6088259, -1.137866, 3.42811, 0, 0, 0, 1, 1,
0.6144534, -1.130497, 3.142246, 0, 0, 0, 1, 1,
0.6150576, -1.075633, 2.604094, 0, 0, 0, 1, 1,
0.6185537, 0.7522598, 0.4187058, 0, 0, 0, 1, 1,
0.6232774, -0.2404979, 2.045103, 0, 0, 0, 1, 1,
0.6293126, -0.287561, 1.583597, 1, 1, 1, 1, 1,
0.6303169, 0.663655, 1.242836, 1, 1, 1, 1, 1,
0.6314626, -1.769067, 1.97313, 1, 1, 1, 1, 1,
0.6325119, 2.397397, -0.4213071, 1, 1, 1, 1, 1,
0.6327528, 0.1656525, 2.84564, 1, 1, 1, 1, 1,
0.6338372, 1.732914, 0.41431, 1, 1, 1, 1, 1,
0.6344369, 1.16534, 2.74681, 1, 1, 1, 1, 1,
0.6361429, 0.2937873, 1.956865, 1, 1, 1, 1, 1,
0.6370318, 0.03654574, 1.389366, 1, 1, 1, 1, 1,
0.6409687, 1.037916, -1.034923, 1, 1, 1, 1, 1,
0.6413597, 1.020456, -0.235715, 1, 1, 1, 1, 1,
0.643789, -1.482835, 1.959987, 1, 1, 1, 1, 1,
0.6462384, 0.07786193, 0.9535661, 1, 1, 1, 1, 1,
0.6511737, 1.268863, 1.421645, 1, 1, 1, 1, 1,
0.6538586, 1.077626, 2.475969, 1, 1, 1, 1, 1,
0.6542457, -0.568558, 3.0317, 0, 0, 1, 1, 1,
0.6563258, 0.1630664, 0.03558401, 1, 0, 0, 1, 1,
0.6580012, -1.304601, 3.490898, 1, 0, 0, 1, 1,
0.6648802, -0.2960607, 2.287462, 1, 0, 0, 1, 1,
0.6719908, 0.2097175, 0.5374368, 1, 0, 0, 1, 1,
0.6790867, 1.434363, -0.1529901, 1, 0, 0, 1, 1,
0.679682, -0.2900751, 0.1364738, 0, 0, 0, 1, 1,
0.6850969, 1.487243, 0.5462942, 0, 0, 0, 1, 1,
0.6888028, -1.938123, 1.462895, 0, 0, 0, 1, 1,
0.6922972, -1.140569, 1.01586, 0, 0, 0, 1, 1,
0.6940348, 0.4202568, 1.801609, 0, 0, 0, 1, 1,
0.6961317, 0.4405965, 1.175559, 0, 0, 0, 1, 1,
0.696399, 1.076338, -0.04909355, 0, 0, 0, 1, 1,
0.6986309, 0.2320987, 1.497785, 1, 1, 1, 1, 1,
0.699266, -0.3075703, 1.764283, 1, 1, 1, 1, 1,
0.704658, -0.4857835, 3.750251, 1, 1, 1, 1, 1,
0.7068776, -1.140435, 2.853424, 1, 1, 1, 1, 1,
0.7096869, 1.615921, 1.003698, 1, 1, 1, 1, 1,
0.7219634, -0.4775148, 1.167028, 1, 1, 1, 1, 1,
0.7230332, -0.9951249, 3.223665, 1, 1, 1, 1, 1,
0.7273214, 0.4587321, 1.326599, 1, 1, 1, 1, 1,
0.7319826, 0.283838, 0.6746778, 1, 1, 1, 1, 1,
0.7360526, -0.6415782, 2.497856, 1, 1, 1, 1, 1,
0.7374098, 2.384797, -0.09670761, 1, 1, 1, 1, 1,
0.7422783, -0.5945944, 4.511786, 1, 1, 1, 1, 1,
0.7435195, 1.521966, 0.9145931, 1, 1, 1, 1, 1,
0.7459304, -0.9640588, 1.26939, 1, 1, 1, 1, 1,
0.7481776, -0.0870572, 1.278961, 1, 1, 1, 1, 1,
0.7528176, 0.6167448, 0.2418997, 0, 0, 1, 1, 1,
0.7565594, 1.048083, -0.4860196, 1, 0, 0, 1, 1,
0.7624838, 0.3642478, 2.810904, 1, 0, 0, 1, 1,
0.7625518, -2.277893, 2.719477, 1, 0, 0, 1, 1,
0.7641748, -0.04926557, 1.747617, 1, 0, 0, 1, 1,
0.7653255, 2.752432, 2.63806, 1, 0, 0, 1, 1,
0.7697605, -0.1466447, 1.620873, 0, 0, 0, 1, 1,
0.7708403, 1.263383, -0.1424491, 0, 0, 0, 1, 1,
0.7718907, -0.5217273, 0.3325097, 0, 0, 0, 1, 1,
0.7790612, 1.767254, 1.572175, 0, 0, 0, 1, 1,
0.781348, 0.3252009, 0.6605666, 0, 0, 0, 1, 1,
0.7868892, 0.06980915, -1.330276, 0, 0, 0, 1, 1,
0.7885892, 0.06954455, 0.5695245, 0, 0, 0, 1, 1,
0.7889791, -0.07878184, 1.98284, 1, 1, 1, 1, 1,
0.7925918, 0.1036605, 2.189418, 1, 1, 1, 1, 1,
0.7944325, 0.322605, 3.135771, 1, 1, 1, 1, 1,
0.7977245, 0.1690511, 1.648635, 1, 1, 1, 1, 1,
0.7994367, -0.1832976, 2.102305, 1, 1, 1, 1, 1,
0.8066522, 1.141039, 2.2969, 1, 1, 1, 1, 1,
0.8084089, -0.9629643, 2.981119, 1, 1, 1, 1, 1,
0.8202189, 1.592823, 0.4190845, 1, 1, 1, 1, 1,
0.8206811, -0.3414928, 3.60153, 1, 1, 1, 1, 1,
0.8225443, -0.888288, 1.701038, 1, 1, 1, 1, 1,
0.8225451, -0.01097226, 1.415406, 1, 1, 1, 1, 1,
0.8229939, 0.6931974, 0.3077153, 1, 1, 1, 1, 1,
0.8230425, 0.03995102, 1.984341, 1, 1, 1, 1, 1,
0.8269173, 1.041309, 1.877962, 1, 1, 1, 1, 1,
0.8327683, -0.06582499, 2.487002, 1, 1, 1, 1, 1,
0.833781, -0.2971271, 3.717155, 0, 0, 1, 1, 1,
0.8365358, -0.5105258, 1.967641, 1, 0, 0, 1, 1,
0.8372267, -2.141474, 2.598591, 1, 0, 0, 1, 1,
0.8401479, 0.7753018, 2.117586, 1, 0, 0, 1, 1,
0.8466265, 0.5468612, 0.4556243, 1, 0, 0, 1, 1,
0.8488004, 0.2246024, 1.27446, 1, 0, 0, 1, 1,
0.8543749, 0.3443756, 0.7297642, 0, 0, 0, 1, 1,
0.8587829, -1.700062, 4.331387, 0, 0, 0, 1, 1,
0.859966, 0.4939415, -0.7768373, 0, 0, 0, 1, 1,
0.866981, -0.2067149, 1.33539, 0, 0, 0, 1, 1,
0.868764, -0.4706459, 2.336658, 0, 0, 0, 1, 1,
0.8738251, -0.9241167, 3.40706, 0, 0, 0, 1, 1,
0.8740072, -1.870797, 3.089033, 0, 0, 0, 1, 1,
0.8851715, 0.04834683, 1.42989, 1, 1, 1, 1, 1,
0.8925738, 0.3416772, -1.587519, 1, 1, 1, 1, 1,
0.8998427, 0.8957386, 0.408834, 1, 1, 1, 1, 1,
0.8999124, 0.7919364, 1.043543, 1, 1, 1, 1, 1,
0.9042533, 0.6543949, -0.4800697, 1, 1, 1, 1, 1,
0.9116724, -1.022497, 3.118764, 1, 1, 1, 1, 1,
0.9169145, -0.1438737, 0.9127461, 1, 1, 1, 1, 1,
0.9175453, 1.103132, 0.4887201, 1, 1, 1, 1, 1,
0.9212985, 0.1413831, -0.04344587, 1, 1, 1, 1, 1,
0.9313372, 0.3461435, 1.06191, 1, 1, 1, 1, 1,
0.9331576, 0.8092316, 1.953998, 1, 1, 1, 1, 1,
0.9484154, 0.3230028, 0.5189096, 1, 1, 1, 1, 1,
0.9509052, 0.9386545, 0.9230286, 1, 1, 1, 1, 1,
0.955618, 1.034357, -0.1842237, 1, 1, 1, 1, 1,
0.9574606, 0.5144917, 1.280311, 1, 1, 1, 1, 1,
0.962316, 0.9506004, 1.940859, 0, 0, 1, 1, 1,
0.9630227, -1.333389, 3.446361, 1, 0, 0, 1, 1,
0.9664341, -0.2083692, 1.901661, 1, 0, 0, 1, 1,
0.966736, -1.061682, 0.7299508, 1, 0, 0, 1, 1,
0.9677353, -0.6217657, 1.827829, 1, 0, 0, 1, 1,
0.9691983, 1.208704, -0.07332807, 1, 0, 0, 1, 1,
0.9701131, -0.8016431, 1.076015, 0, 0, 0, 1, 1,
0.9721142, 0.3477677, 1.610478, 0, 0, 0, 1, 1,
0.9762417, 1.131342, 1.491192, 0, 0, 0, 1, 1,
0.9789113, 0.8348012, 1.709869, 0, 0, 0, 1, 1,
0.9825285, -0.08321176, 1.693508, 0, 0, 0, 1, 1,
0.9847222, 0.8691292, 0.6657816, 0, 0, 0, 1, 1,
0.9872604, -0.2976356, 3.308106, 0, 0, 0, 1, 1,
0.9905655, -0.7657874, 2.403542, 1, 1, 1, 1, 1,
0.9968319, 2.457268, 2.06325, 1, 1, 1, 1, 1,
1.004189, 0.4225921, 0.9263786, 1, 1, 1, 1, 1,
1.007317, 0.731627, 1.704223, 1, 1, 1, 1, 1,
1.007428, 0.1136803, 2.215218, 1, 1, 1, 1, 1,
1.009464, -0.9338072, 2.736724, 1, 1, 1, 1, 1,
1.015802, -1.012493, 4.199474, 1, 1, 1, 1, 1,
1.01803, -1.292246, 2.801378, 1, 1, 1, 1, 1,
1.021221, 0.143995, 2.93404, 1, 1, 1, 1, 1,
1.021855, 0.3862849, 0.2007338, 1, 1, 1, 1, 1,
1.038371, -0.5894942, 2.26646, 1, 1, 1, 1, 1,
1.04233, -1.333037, 1.845809, 1, 1, 1, 1, 1,
1.043706, 0.8474278, 3.188916, 1, 1, 1, 1, 1,
1.04816, 0.6202897, 0.09990171, 1, 1, 1, 1, 1,
1.059043, 0.100676, 0.4665991, 1, 1, 1, 1, 1,
1.060341, 1.403978, 1.00416, 0, 0, 1, 1, 1,
1.077051, -0.5526875, 1.84271, 1, 0, 0, 1, 1,
1.086164, -0.3383043, 1.034424, 1, 0, 0, 1, 1,
1.087175, 0.6892178, 1.867225, 1, 0, 0, 1, 1,
1.092091, -0.02021205, 2.579099, 1, 0, 0, 1, 1,
1.102537, -0.8782132, 2.283609, 1, 0, 0, 1, 1,
1.102781, 0.09907678, 2.877444, 0, 0, 0, 1, 1,
1.104535, 2.325813, 1.246339, 0, 0, 0, 1, 1,
1.105347, -0.4645013, 0.9957748, 0, 0, 0, 1, 1,
1.108503, 1.850291, -0.6442048, 0, 0, 0, 1, 1,
1.113326, -1.228789, 2.630166, 0, 0, 0, 1, 1,
1.122738, -0.5118152, 0.8968038, 0, 0, 0, 1, 1,
1.124807, 0.3014545, 1.420572, 0, 0, 0, 1, 1,
1.1258, -0.2076726, 1.431278, 1, 1, 1, 1, 1,
1.142374, -0.05832845, -0.5598931, 1, 1, 1, 1, 1,
1.15688, -0.6332137, 1.789296, 1, 1, 1, 1, 1,
1.164017, -1.780533, 2.005767, 1, 1, 1, 1, 1,
1.164314, -0.0687824, 2.338347, 1, 1, 1, 1, 1,
1.165272, 0.565316, 0.2401556, 1, 1, 1, 1, 1,
1.183724, 0.2735488, 0.4811312, 1, 1, 1, 1, 1,
1.186488, -0.3639848, 2.558506, 1, 1, 1, 1, 1,
1.188118, 0.08844933, 1.918652, 1, 1, 1, 1, 1,
1.191182, -0.04712556, 3.927859, 1, 1, 1, 1, 1,
1.192111, 0.8813209, 1.329841, 1, 1, 1, 1, 1,
1.193513, -0.6398069, 0.1710099, 1, 1, 1, 1, 1,
1.19691, 0.8276451, -0.6439439, 1, 1, 1, 1, 1,
1.208683, -1.661991, 2.49544, 1, 1, 1, 1, 1,
1.210099, 3.239105, -0.01534855, 1, 1, 1, 1, 1,
1.21121, -0.9883029, 2.354023, 0, 0, 1, 1, 1,
1.232256, 0.3751035, 2.602806, 1, 0, 0, 1, 1,
1.234255, 0.6457335, 1.965369, 1, 0, 0, 1, 1,
1.24102, 0.7260972, -0.4797533, 1, 0, 0, 1, 1,
1.243718, -0.2191405, 2.439176, 1, 0, 0, 1, 1,
1.24618, -0.4391686, 3.213618, 1, 0, 0, 1, 1,
1.267149, -1.232382, 4.141538, 0, 0, 0, 1, 1,
1.27685, -0.2798833, 3.634331, 0, 0, 0, 1, 1,
1.279218, -1.060055, 3.343324, 0, 0, 0, 1, 1,
1.280839, 1.523454, 0.8130425, 0, 0, 0, 1, 1,
1.283525, 0.4418736, 0.7414048, 0, 0, 0, 1, 1,
1.285369, 0.286328, 2.747272, 0, 0, 0, 1, 1,
1.304345, 1.554625, 0.4152312, 0, 0, 0, 1, 1,
1.308489, 1.265345, 1.54426, 1, 1, 1, 1, 1,
1.315434, 1.495628, -0.1606428, 1, 1, 1, 1, 1,
1.325063, -0.2318085, 2.897781, 1, 1, 1, 1, 1,
1.349374, 2.309284, 0.07861538, 1, 1, 1, 1, 1,
1.356529, 3.205585, -0.8388506, 1, 1, 1, 1, 1,
1.359674, 2.06563, 0.4107137, 1, 1, 1, 1, 1,
1.361925, -0.5928451, 2.407385, 1, 1, 1, 1, 1,
1.364415, -0.4116999, 1.86183, 1, 1, 1, 1, 1,
1.37658, -0.1176979, 2.014195, 1, 1, 1, 1, 1,
1.406101, 0.2245346, -0.0446502, 1, 1, 1, 1, 1,
1.407384, 0.01072375, 1.86047, 1, 1, 1, 1, 1,
1.409047, -0.3436288, 0.6609241, 1, 1, 1, 1, 1,
1.409885, 1.211261, 1.46462, 1, 1, 1, 1, 1,
1.410589, -0.9762791, 2.210037, 1, 1, 1, 1, 1,
1.417993, -0.5353488, 0.960508, 1, 1, 1, 1, 1,
1.428452, -2.554458, 2.40404, 0, 0, 1, 1, 1,
1.429805, 0.7408434, 1.468058, 1, 0, 0, 1, 1,
1.430022, -0.6598273, 1.728936, 1, 0, 0, 1, 1,
1.432249, 0.6086499, 0.9101385, 1, 0, 0, 1, 1,
1.439795, -1.12834, 1.553803, 1, 0, 0, 1, 1,
1.441431, -1.811848, 3.182747, 1, 0, 0, 1, 1,
1.44154, 0.2041619, 2.37553, 0, 0, 0, 1, 1,
1.452762, 0.5822816, 2.988197, 0, 0, 0, 1, 1,
1.457639, 0.463908, 2.708424, 0, 0, 0, 1, 1,
1.467108, -0.9906858, 1.809721, 0, 0, 0, 1, 1,
1.467242, 2.485904, -0.3251096, 0, 0, 0, 1, 1,
1.470187, -2.117137, 2.967437, 0, 0, 0, 1, 1,
1.47796, 0.6306505, 0.01751428, 0, 0, 0, 1, 1,
1.482074, 1.788036, 1.893206, 1, 1, 1, 1, 1,
1.49984, -2.17134, 3.698943, 1, 1, 1, 1, 1,
1.500732, 0.8698259, 0.3526396, 1, 1, 1, 1, 1,
1.501737, -0.6105102, 1.515723, 1, 1, 1, 1, 1,
1.505299, -0.5614544, 2.185742, 1, 1, 1, 1, 1,
1.509766, 0.1003846, 2.992021, 1, 1, 1, 1, 1,
1.517388, -0.2697285, -0.3195359, 1, 1, 1, 1, 1,
1.527137, 0.7645766, 0.02646637, 1, 1, 1, 1, 1,
1.549038, -1.512949, 3.055436, 1, 1, 1, 1, 1,
1.5605, -1.108527, 1.213962, 1, 1, 1, 1, 1,
1.571407, 0.06836237, 0.6340802, 1, 1, 1, 1, 1,
1.573471, -0.1845318, 3.623873, 1, 1, 1, 1, 1,
1.591005, -1.001291, 1.633098, 1, 1, 1, 1, 1,
1.603559, 1.723106, 0.4100745, 1, 1, 1, 1, 1,
1.633798, 0.9395729, 1.283137, 1, 1, 1, 1, 1,
1.649354, -0.8767636, 2.186582, 0, 0, 1, 1, 1,
1.65028, -0.3051682, 3.583966, 1, 0, 0, 1, 1,
1.661676, 0.4906191, 1.786376, 1, 0, 0, 1, 1,
1.674053, -0.4350224, 2.160632, 1, 0, 0, 1, 1,
1.684929, -1.509267, 1.0566, 1, 0, 0, 1, 1,
1.691712, -0.2226641, 2.507489, 1, 0, 0, 1, 1,
1.700385, -0.3484371, 2.508548, 0, 0, 0, 1, 1,
1.71901, 1.176134, 1.385473, 0, 0, 0, 1, 1,
1.727457, -1.092816, 2.091827, 0, 0, 0, 1, 1,
1.733885, 0.8728974, 0.3322714, 0, 0, 0, 1, 1,
1.757794, 0.873206, 2.742397, 0, 0, 0, 1, 1,
1.758282, 0.9109725, 0.3871132, 0, 0, 0, 1, 1,
1.767086, -0.4186341, 1.525115, 0, 0, 0, 1, 1,
1.782448, -2.212367, 2.313988, 1, 1, 1, 1, 1,
1.787072, -1.188444, 2.320479, 1, 1, 1, 1, 1,
1.79489, 0.4517391, 2.56527, 1, 1, 1, 1, 1,
1.803858, -1.660046, 1.484054, 1, 1, 1, 1, 1,
1.808148, 0.8118474, 2.801385, 1, 1, 1, 1, 1,
1.828244, 1.206732, 1.299417, 1, 1, 1, 1, 1,
1.829066, 1.905712, 1.533465, 1, 1, 1, 1, 1,
1.902733, 0.7376044, 0.6845184, 1, 1, 1, 1, 1,
1.932022, -0.5200468, 2.363024, 1, 1, 1, 1, 1,
1.93948, 0.5952038, 1.356954, 1, 1, 1, 1, 1,
1.966409, 0.5532421, 0.06503444, 1, 1, 1, 1, 1,
1.978052, 0.1675231, 0.5184183, 1, 1, 1, 1, 1,
1.980632, -0.09659024, 1.535501, 1, 1, 1, 1, 1,
1.994061, 0.8802808, 1.279998, 1, 1, 1, 1, 1,
2.001701, 0.7107697, 2.358782, 1, 1, 1, 1, 1,
2.00289, 0.2213867, 1.502908, 0, 0, 1, 1, 1,
2.053399, 0.735616, 1.006422, 1, 0, 0, 1, 1,
2.069907, 0.6185588, 3.202102, 1, 0, 0, 1, 1,
2.071144, -0.4222596, 1.545838, 1, 0, 0, 1, 1,
2.078624, -0.4832159, 2.141831, 1, 0, 0, 1, 1,
2.085971, -0.1446554, 0.5308715, 1, 0, 0, 1, 1,
2.139573, 1.972358, 1.018923, 0, 0, 0, 1, 1,
2.15098, -1.882581, 2.480034, 0, 0, 0, 1, 1,
2.264584, 0.3286411, 1.479434, 0, 0, 0, 1, 1,
2.272612, -0.2115228, 1.508936, 0, 0, 0, 1, 1,
2.297416, -0.2135732, 3.588329, 0, 0, 0, 1, 1,
2.399322, -1.102399, 0.6619645, 0, 0, 0, 1, 1,
2.52687, 0.8097086, 1.754927, 0, 0, 0, 1, 1,
2.577478, 1.679506, 0.996801, 1, 1, 1, 1, 1,
2.638, -0.9593088, 1.354499, 1, 1, 1, 1, 1,
2.697919, 0.07283368, 0.7728741, 1, 1, 1, 1, 1,
2.74103, 0.7939895, 0.7373479, 1, 1, 1, 1, 1,
2.75233, 0.74244, -0.09118161, 1, 1, 1, 1, 1,
3.047452, 0.310315, 0.7258303, 1, 1, 1, 1, 1,
3.329173, 1.019542, 2.094255, 1, 1, 1, 1, 1
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
var radius = 9.252728;
var distance = 32.49981;
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
mvMatrix.translate( -0.3844693, 0.0867939, 0.05057931 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.49981);
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
