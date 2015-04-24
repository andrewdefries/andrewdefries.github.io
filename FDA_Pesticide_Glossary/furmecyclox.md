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
-3.381055, -1.100166, -1.169828, 1, 0, 0, 1,
-2.965691, -1.074443, -0.5860798, 1, 0.007843138, 0, 1,
-2.774347, 0.02960828, -3.799816, 1, 0.01176471, 0, 1,
-2.599871, -0.2342694, -0.9537653, 1, 0.01960784, 0, 1,
-2.579123, -0.152506, -0.1531481, 1, 0.02352941, 0, 1,
-2.548766, 1.600587, 0.655731, 1, 0.03137255, 0, 1,
-2.382809, -2.196387, -1.5811, 1, 0.03529412, 0, 1,
-2.355072, -0.4749862, -1.8158, 1, 0.04313726, 0, 1,
-2.314686, -0.1430881, -1.181535, 1, 0.04705882, 0, 1,
-2.269212, -0.3689659, -1.154971, 1, 0.05490196, 0, 1,
-2.261044, -0.3986862, -2.622242, 1, 0.05882353, 0, 1,
-2.240291, 1.265365, -0.9955645, 1, 0.06666667, 0, 1,
-2.230002, -0.2351666, -1.604382, 1, 0.07058824, 0, 1,
-2.20584, -0.9826511, -1.294009, 1, 0.07843138, 0, 1,
-2.037139, 0.4038129, -1.370282, 1, 0.08235294, 0, 1,
-2.028388, 0.7115296, -0.4101065, 1, 0.09019608, 0, 1,
-1.975687, 1.260258, -1.165148, 1, 0.09411765, 0, 1,
-1.968524, 1.11461, -0.07678039, 1, 0.1019608, 0, 1,
-1.965495, -0.8170149, -2.331472, 1, 0.1098039, 0, 1,
-1.951876, -0.1127213, -1.073153, 1, 0.1137255, 0, 1,
-1.9253, 0.7476979, -0.5455852, 1, 0.1215686, 0, 1,
-1.924438, -0.6129704, -1.49213, 1, 0.1254902, 0, 1,
-1.90766, -0.3626087, -2.214051, 1, 0.1333333, 0, 1,
-1.893543, -0.3835347, -1.443246, 1, 0.1372549, 0, 1,
-1.875018, 2.055682, 0.3019211, 1, 0.145098, 0, 1,
-1.865454, -0.161829, -1.21457, 1, 0.1490196, 0, 1,
-1.858903, -0.3564465, 0.2150238, 1, 0.1568628, 0, 1,
-1.857341, -1.156456, -2.313054, 1, 0.1607843, 0, 1,
-1.836461, 0.2522725, -1.732591, 1, 0.1686275, 0, 1,
-1.810654, -1.418963, -2.000052, 1, 0.172549, 0, 1,
-1.803069, 0.242095, -1.332876, 1, 0.1803922, 0, 1,
-1.796748, 0.2851084, -2.31426, 1, 0.1843137, 0, 1,
-1.796246, -0.2801881, -2.420467, 1, 0.1921569, 0, 1,
-1.785798, 0.01675848, -3.172334, 1, 0.1960784, 0, 1,
-1.767639, 0.3758651, -1.033401, 1, 0.2039216, 0, 1,
-1.730554, -0.6283239, -2.053818, 1, 0.2117647, 0, 1,
-1.728665, 0.2137187, -2.495725, 1, 0.2156863, 0, 1,
-1.717179, -0.2215828, -2.257107, 1, 0.2235294, 0, 1,
-1.714921, -0.3491419, -3.197353, 1, 0.227451, 0, 1,
-1.697756, -0.7305728, -1.667568, 1, 0.2352941, 0, 1,
-1.694766, -1.411982, -2.598521, 1, 0.2392157, 0, 1,
-1.694427, -0.6693893, -1.563863, 1, 0.2470588, 0, 1,
-1.685607, -1.159389, -1.2222, 1, 0.2509804, 0, 1,
-1.673674, 1.074671, -1.495891, 1, 0.2588235, 0, 1,
-1.664157, -0.2928401, -1.084714, 1, 0.2627451, 0, 1,
-1.655069, 0.271993, -1.323799, 1, 0.2705882, 0, 1,
-1.637014, -1.377347, -3.265877, 1, 0.2745098, 0, 1,
-1.636488, 0.7486382, 0.3228981, 1, 0.282353, 0, 1,
-1.628209, -1.422315, -3.306126, 1, 0.2862745, 0, 1,
-1.61967, -0.06607351, -0.04682868, 1, 0.2941177, 0, 1,
-1.612785, -0.1456363, -1.251268, 1, 0.3019608, 0, 1,
-1.595191, 0.1977303, -2.18283, 1, 0.3058824, 0, 1,
-1.584539, -0.5477818, -0.2126455, 1, 0.3137255, 0, 1,
-1.576435, 1.759433, -1.125036, 1, 0.3176471, 0, 1,
-1.570556, -1.45629, -2.855312, 1, 0.3254902, 0, 1,
-1.542859, -0.8888205, -2.207975, 1, 0.3294118, 0, 1,
-1.537899, -0.6314662, -0.7501773, 1, 0.3372549, 0, 1,
-1.535528, 0.4034159, -1.62806, 1, 0.3411765, 0, 1,
-1.534544, -2.441926, -3.824156, 1, 0.3490196, 0, 1,
-1.525377, 0.3973678, 1.869954, 1, 0.3529412, 0, 1,
-1.522565, -0.8271102, -3.365957, 1, 0.3607843, 0, 1,
-1.507844, -0.2223978, -2.669012, 1, 0.3647059, 0, 1,
-1.507515, 1.28583, -0.3136185, 1, 0.372549, 0, 1,
-1.506214, -1.871917, -1.784061, 1, 0.3764706, 0, 1,
-1.497393, 0.854991, -1.628586, 1, 0.3843137, 0, 1,
-1.483282, -0.1969901, -2.22705, 1, 0.3882353, 0, 1,
-1.478121, -0.4140999, -1.196726, 1, 0.3960784, 0, 1,
-1.477109, 0.4442801, -1.380757, 1, 0.4039216, 0, 1,
-1.464838, 0.0650334, -2.967791, 1, 0.4078431, 0, 1,
-1.457853, -0.7724368, -2.978828, 1, 0.4156863, 0, 1,
-1.457131, -0.6244511, -1.421969, 1, 0.4196078, 0, 1,
-1.449779, 0.03578615, -1.732759, 1, 0.427451, 0, 1,
-1.441768, 0.3997692, -0.5248188, 1, 0.4313726, 0, 1,
-1.441435, -0.7750087, -4.151901, 1, 0.4392157, 0, 1,
-1.425345, 0.8609434, -0.9100465, 1, 0.4431373, 0, 1,
-1.409458, 1.504275, -1.06564, 1, 0.4509804, 0, 1,
-1.39072, 1.414741, -0.7826951, 1, 0.454902, 0, 1,
-1.3792, -1.002424, -3.638151, 1, 0.4627451, 0, 1,
-1.371902, 1.551842, -0.6917043, 1, 0.4666667, 0, 1,
-1.367325, 0.5285402, -2.932466, 1, 0.4745098, 0, 1,
-1.356353, -0.8133393, -2.754825, 1, 0.4784314, 0, 1,
-1.350291, -0.3938333, -0.512744, 1, 0.4862745, 0, 1,
-1.344431, 0.8577462, -2.445545, 1, 0.4901961, 0, 1,
-1.33891, -0.2585768, -0.4608817, 1, 0.4980392, 0, 1,
-1.327029, -0.5505354, -2.352299, 1, 0.5058824, 0, 1,
-1.325946, 0.369783, 0.161571, 1, 0.509804, 0, 1,
-1.325688, -0.6886524, -3.071702, 1, 0.5176471, 0, 1,
-1.319216, -1.358029, -0.9598875, 1, 0.5215687, 0, 1,
-1.318074, 1.519648, 0.09871989, 1, 0.5294118, 0, 1,
-1.309275, -0.6068717, -1.075746, 1, 0.5333334, 0, 1,
-1.306062, 0.9327551, -2.865067, 1, 0.5411765, 0, 1,
-1.302361, 1.863398, -1.816015, 1, 0.5450981, 0, 1,
-1.300798, -0.6881701, -3.390528, 1, 0.5529412, 0, 1,
-1.300636, -1.202305, -2.061546, 1, 0.5568628, 0, 1,
-1.296003, 1.205198, -0.34521, 1, 0.5647059, 0, 1,
-1.289189, 0.8604997, -0.892599, 1, 0.5686275, 0, 1,
-1.283212, 2.197597, 0.05178004, 1, 0.5764706, 0, 1,
-1.280499, 0.3612523, -1.048312, 1, 0.5803922, 0, 1,
-1.28021, 0.0235005, -2.017184, 1, 0.5882353, 0, 1,
-1.261479, -0.2784906, -1.544564, 1, 0.5921569, 0, 1,
-1.260758, 0.09051704, -2.588937, 1, 0.6, 0, 1,
-1.229347, -0.06078114, -3.160943, 1, 0.6078432, 0, 1,
-1.225527, 0.5121239, 1.151137, 1, 0.6117647, 0, 1,
-1.2239, -0.6594682, -2.562506, 1, 0.6196079, 0, 1,
-1.223559, 0.8702193, -1.252798, 1, 0.6235294, 0, 1,
-1.221038, 0.3751383, -0.1805478, 1, 0.6313726, 0, 1,
-1.212466, 0.3502662, -0.8492776, 1, 0.6352941, 0, 1,
-1.210403, -0.2720144, -1.244746, 1, 0.6431373, 0, 1,
-1.208057, -0.5326946, -1.380626, 1, 0.6470588, 0, 1,
-1.207422, -0.9573747, -3.237538, 1, 0.654902, 0, 1,
-1.196785, 0.110076, -2.625834, 1, 0.6588235, 0, 1,
-1.19179, 0.6930212, -0.0238171, 1, 0.6666667, 0, 1,
-1.189987, -0.698806, -2.933265, 1, 0.6705883, 0, 1,
-1.183729, -0.9767501, -3.363788, 1, 0.6784314, 0, 1,
-1.176794, -2.022465, -4.063626, 1, 0.682353, 0, 1,
-1.173974, 0.5826, -0.8615344, 1, 0.6901961, 0, 1,
-1.14282, 0.1914629, -0.777007, 1, 0.6941177, 0, 1,
-1.135592, -1.423195, -2.112901, 1, 0.7019608, 0, 1,
-1.131263, -0.9558692, -0.1183199, 1, 0.7098039, 0, 1,
-1.129514, 0.3487754, -1.691016, 1, 0.7137255, 0, 1,
-1.127258, -0.06228995, -0.5859943, 1, 0.7215686, 0, 1,
-1.120663, -0.6947123, -2.166014, 1, 0.7254902, 0, 1,
-1.103125, -1.667479, -2.288584, 1, 0.7333333, 0, 1,
-1.101437, 2.085882, 0.08453063, 1, 0.7372549, 0, 1,
-1.099802, -2.133565, -3.366127, 1, 0.7450981, 0, 1,
-1.0976, 2.8657, -0.8391815, 1, 0.7490196, 0, 1,
-1.094301, -1.765558, -3.273354, 1, 0.7568628, 0, 1,
-1.091123, -0.3240879, -3.856192, 1, 0.7607843, 0, 1,
-1.090214, -0.3261274, -1.61217, 1, 0.7686275, 0, 1,
-1.086537, 0.6658056, -1.350829, 1, 0.772549, 0, 1,
-1.077474, 0.2991475, -1.763243, 1, 0.7803922, 0, 1,
-1.075112, -1.26468, -4.502642, 1, 0.7843137, 0, 1,
-1.072785, 0.471951, -1.655193, 1, 0.7921569, 0, 1,
-1.071312, 1.118519, -2.227958, 1, 0.7960784, 0, 1,
-1.06152, 0.3935173, -1.489864, 1, 0.8039216, 0, 1,
-1.056652, -0.04282375, -1.830392, 1, 0.8117647, 0, 1,
-1.054827, -0.2243999, -2.456548, 1, 0.8156863, 0, 1,
-1.054749, 1.327324, -1.429636, 1, 0.8235294, 0, 1,
-1.050161, 0.8166102, -0.8722885, 1, 0.827451, 0, 1,
-1.04892, 0.3923845, -2.496861, 1, 0.8352941, 0, 1,
-1.044979, 0.6469039, -2.974176, 1, 0.8392157, 0, 1,
-1.039925, 0.269444, -1.299676, 1, 0.8470588, 0, 1,
-1.03717, 1.382844, -0.5592666, 1, 0.8509804, 0, 1,
-1.027426, -0.008932658, -2.016708, 1, 0.8588235, 0, 1,
-1.025898, 1.027896, -1.221528, 1, 0.8627451, 0, 1,
-1.019985, 0.2967932, -2.161298, 1, 0.8705882, 0, 1,
-1.011009, 0.4336076, -0.03771149, 1, 0.8745098, 0, 1,
-1.010041, -1.607441, -3.523889, 1, 0.8823529, 0, 1,
-1.009867, 1.366652, -0.7069505, 1, 0.8862745, 0, 1,
-1.009253, -1.656273, -1.00323, 1, 0.8941177, 0, 1,
-0.9897971, -0.4989054, -1.723016, 1, 0.8980392, 0, 1,
-0.9881901, 0.7810373, -0.4456916, 1, 0.9058824, 0, 1,
-0.9879405, 1.416755, 0.1047718, 1, 0.9137255, 0, 1,
-0.98758, 2.464033, -1.871394, 1, 0.9176471, 0, 1,
-0.9814198, 0.3457697, -0.5394642, 1, 0.9254902, 0, 1,
-0.9686121, -0.1166858, -0.5136955, 1, 0.9294118, 0, 1,
-0.9675146, -0.04722507, -2.457477, 1, 0.9372549, 0, 1,
-0.9644341, -1.256667, -3.926752, 1, 0.9411765, 0, 1,
-0.9627036, -0.4704208, -1.502753, 1, 0.9490196, 0, 1,
-0.9594399, 1.310674, -2.022861, 1, 0.9529412, 0, 1,
-0.9524133, -0.7691452, -3.563473, 1, 0.9607843, 0, 1,
-0.9442855, -0.3042642, -2.240402, 1, 0.9647059, 0, 1,
-0.9432327, -1.461097, -4.019872, 1, 0.972549, 0, 1,
-0.9387226, 1.664804, -1.971854, 1, 0.9764706, 0, 1,
-0.9365925, 0.06529219, -2.650359, 1, 0.9843137, 0, 1,
-0.9245462, -0.7023919, -2.844516, 1, 0.9882353, 0, 1,
-0.9229745, 0.1199515, -2.160796, 1, 0.9960784, 0, 1,
-0.9177265, 0.05565903, 0.6197897, 0.9960784, 1, 0, 1,
-0.9176611, -0.05027442, -2.979604, 0.9921569, 1, 0, 1,
-0.9176277, -0.1486624, -1.688277, 0.9843137, 1, 0, 1,
-0.9159976, -1.154805, -1.130422, 0.9803922, 1, 0, 1,
-0.9132076, 1.665415, 0.1074876, 0.972549, 1, 0, 1,
-0.9130147, 0.7548905, -0.2638393, 0.9686275, 1, 0, 1,
-0.9112766, 0.7172549, -1.504662, 0.9607843, 1, 0, 1,
-0.9086157, -0.02282722, -1.557534, 0.9568627, 1, 0, 1,
-0.8999238, -0.4837658, -3.344222, 0.9490196, 1, 0, 1,
-0.8916884, 0.48897, 0.5851897, 0.945098, 1, 0, 1,
-0.8899508, -0.1926864, -0.8637785, 0.9372549, 1, 0, 1,
-0.8860949, -0.6044629, -2.165272, 0.9333333, 1, 0, 1,
-0.8855133, 0.6507692, 0.1007616, 0.9254902, 1, 0, 1,
-0.8847198, 1.234634, 0.9208405, 0.9215686, 1, 0, 1,
-0.8843183, 2.282996, -0.3060425, 0.9137255, 1, 0, 1,
-0.8833705, -0.1995252, -1.967537, 0.9098039, 1, 0, 1,
-0.8818706, 0.953704, 0.7137879, 0.9019608, 1, 0, 1,
-0.8780409, -0.5339393, -3.064116, 0.8941177, 1, 0, 1,
-0.8746336, -0.07181662, -1.547496, 0.8901961, 1, 0, 1,
-0.8725834, -1.259942, -2.792447, 0.8823529, 1, 0, 1,
-0.8716986, 1.01007, -0.6935211, 0.8784314, 1, 0, 1,
-0.8697085, -0.311152, -2.575489, 0.8705882, 1, 0, 1,
-0.8651746, -1.479609, -3.291087, 0.8666667, 1, 0, 1,
-0.8637922, -0.9203883, -3.086222, 0.8588235, 1, 0, 1,
-0.8557347, 0.05004024, -1.398016, 0.854902, 1, 0, 1,
-0.8532307, 1.164817, -2.699636, 0.8470588, 1, 0, 1,
-0.8516585, 0.3652556, -0.5261118, 0.8431373, 1, 0, 1,
-0.8467631, -0.2697703, -2.02824, 0.8352941, 1, 0, 1,
-0.84153, 2.228858, -0.6580374, 0.8313726, 1, 0, 1,
-0.8370472, -0.8273109, -2.003025, 0.8235294, 1, 0, 1,
-0.8368255, -0.2787491, -2.43868, 0.8196079, 1, 0, 1,
-0.8314637, 1.513217, -2.363507, 0.8117647, 1, 0, 1,
-0.8302354, 0.5227605, 0.2749001, 0.8078431, 1, 0, 1,
-0.8261366, 1.404992, -0.5988915, 0.8, 1, 0, 1,
-0.8220488, 0.09327058, -0.1414858, 0.7921569, 1, 0, 1,
-0.8129246, -1.220843, -1.774602, 0.7882353, 1, 0, 1,
-0.8105222, -1.281125, -0.4746284, 0.7803922, 1, 0, 1,
-0.8084238, 0.09951384, -1.969945, 0.7764706, 1, 0, 1,
-0.8071154, 0.5178663, -1.263032, 0.7686275, 1, 0, 1,
-0.8059385, -0.3279938, -3.205771, 0.7647059, 1, 0, 1,
-0.8057745, 0.5349407, -1.331085, 0.7568628, 1, 0, 1,
-0.8055192, 1.548204, -0.3803393, 0.7529412, 1, 0, 1,
-0.796735, 0.6376912, -1.525295, 0.7450981, 1, 0, 1,
-0.7923577, 0.2800419, -1.824008, 0.7411765, 1, 0, 1,
-0.791824, -1.633682, -0.7938808, 0.7333333, 1, 0, 1,
-0.7880428, 0.4278361, -1.45156, 0.7294118, 1, 0, 1,
-0.7880062, -0.2536328, -2.44613, 0.7215686, 1, 0, 1,
-0.7876531, 0.6912313, -1.522487, 0.7176471, 1, 0, 1,
-0.784658, 1.386068, 0.168845, 0.7098039, 1, 0, 1,
-0.7839705, 0.5601441, -2.578483, 0.7058824, 1, 0, 1,
-0.7829024, -0.1165935, -1.333288, 0.6980392, 1, 0, 1,
-0.7757174, -0.08144306, -2.402045, 0.6901961, 1, 0, 1,
-0.7753276, 0.3415716, -2.667931, 0.6862745, 1, 0, 1,
-0.7737172, 1.403529, 0.3742004, 0.6784314, 1, 0, 1,
-0.7724739, 1.35961, -0.6047347, 0.6745098, 1, 0, 1,
-0.7708915, -0.0154524, -1.656821, 0.6666667, 1, 0, 1,
-0.7685219, 0.630644, -1.638811, 0.6627451, 1, 0, 1,
-0.7648189, 0.7634189, -0.6525749, 0.654902, 1, 0, 1,
-0.7638968, 0.7573034, -0.7655413, 0.6509804, 1, 0, 1,
-0.7595712, -0.454928, -0.976365, 0.6431373, 1, 0, 1,
-0.7534406, 0.9084102, 0.1534393, 0.6392157, 1, 0, 1,
-0.7514651, -1.890509, -4.05829, 0.6313726, 1, 0, 1,
-0.7501028, -1.893228, -3.371438, 0.627451, 1, 0, 1,
-0.7485307, 0.3948136, 0.002989837, 0.6196079, 1, 0, 1,
-0.7479718, -0.5490463, -1.842763, 0.6156863, 1, 0, 1,
-0.7469802, 0.009532323, -0.9963557, 0.6078432, 1, 0, 1,
-0.7452798, -0.7649682, -3.006254, 0.6039216, 1, 0, 1,
-0.7444663, -1.180485, -3.869862, 0.5960785, 1, 0, 1,
-0.7435771, 0.6762844, -1.079755, 0.5882353, 1, 0, 1,
-0.7422779, -0.9988402, -2.962285, 0.5843138, 1, 0, 1,
-0.7419086, -0.1796492, -2.289137, 0.5764706, 1, 0, 1,
-0.74073, 1.153661, -0.9634217, 0.572549, 1, 0, 1,
-0.7256896, 0.8043166, -1.351859, 0.5647059, 1, 0, 1,
-0.724686, -0.02979625, -1.795261, 0.5607843, 1, 0, 1,
-0.7239229, 0.01131415, -1.146197, 0.5529412, 1, 0, 1,
-0.7197918, 0.02892197, -2.19076, 0.5490196, 1, 0, 1,
-0.7179399, -1.049101, -1.309611, 0.5411765, 1, 0, 1,
-0.7177328, -0.1618537, -1.362088, 0.5372549, 1, 0, 1,
-0.7177151, 1.74066, -0.5164439, 0.5294118, 1, 0, 1,
-0.715161, -0.6425369, -1.305801, 0.5254902, 1, 0, 1,
-0.7136363, -0.9674546, -2.946675, 0.5176471, 1, 0, 1,
-0.7133164, -0.2264324, -3.050148, 0.5137255, 1, 0, 1,
-0.7049258, -1.279771, -3.419893, 0.5058824, 1, 0, 1,
-0.6897914, -1.363385, -1.828732, 0.5019608, 1, 0, 1,
-0.6792703, -0.8988004, -1.178703, 0.4941176, 1, 0, 1,
-0.6781459, 1.051629, -0.4654212, 0.4862745, 1, 0, 1,
-0.6779662, -0.5116608, -2.075727, 0.4823529, 1, 0, 1,
-0.6715243, 1.565889, -1.167932, 0.4745098, 1, 0, 1,
-0.6713932, -2.098816, -2.593349, 0.4705882, 1, 0, 1,
-0.6700128, 0.4404705, -1.769708, 0.4627451, 1, 0, 1,
-0.6697257, 0.08979741, -0.6022018, 0.4588235, 1, 0, 1,
-0.6660798, 0.7169282, -0.4167635, 0.4509804, 1, 0, 1,
-0.6658004, -0.275132, 0.03895607, 0.4470588, 1, 0, 1,
-0.6622959, -0.5827307, -3.897031, 0.4392157, 1, 0, 1,
-0.6593291, 0.2629526, -1.615367, 0.4352941, 1, 0, 1,
-0.6587847, 2.354323, -0.5327878, 0.427451, 1, 0, 1,
-0.6577665, -0.0001256096, -2.836251, 0.4235294, 1, 0, 1,
-0.6524889, 1.057497, -0.9547654, 0.4156863, 1, 0, 1,
-0.6523759, 0.1459651, -1.758151, 0.4117647, 1, 0, 1,
-0.6475673, -0.9688897, -1.660854, 0.4039216, 1, 0, 1,
-0.6456444, 0.6481748, 0.07939922, 0.3960784, 1, 0, 1,
-0.643294, 0.758646, 1.48803, 0.3921569, 1, 0, 1,
-0.6413578, -0.2515218, -2.918163, 0.3843137, 1, 0, 1,
-0.6339455, 1.779206, 0.8675949, 0.3803922, 1, 0, 1,
-0.6275268, 0.2973681, -1.867013, 0.372549, 1, 0, 1,
-0.6226299, 0.5364128, -1.78037, 0.3686275, 1, 0, 1,
-0.6214538, -1.761298, -2.759075, 0.3607843, 1, 0, 1,
-0.6205125, 0.6643666, -0.08320982, 0.3568628, 1, 0, 1,
-0.6203758, 0.0498617, -1.038653, 0.3490196, 1, 0, 1,
-0.6163164, 0.204798, -1.456253, 0.345098, 1, 0, 1,
-0.6162732, 2.308604, 0.7021962, 0.3372549, 1, 0, 1,
-0.6126976, 1.619756, -0.01415284, 0.3333333, 1, 0, 1,
-0.6103495, -1.153137, -2.909665, 0.3254902, 1, 0, 1,
-0.6091712, 1.624863, -0.5090111, 0.3215686, 1, 0, 1,
-0.6076155, 0.8712428, -1.088172, 0.3137255, 1, 0, 1,
-0.6035162, 0.5688601, 0.1888401, 0.3098039, 1, 0, 1,
-0.6031749, -0.2720416, -1.547578, 0.3019608, 1, 0, 1,
-0.6024256, 1.077623, -0.5942693, 0.2941177, 1, 0, 1,
-0.6017846, 0.5693728, -0.2779447, 0.2901961, 1, 0, 1,
-0.6000674, -0.6468188, -2.114931, 0.282353, 1, 0, 1,
-0.5989656, 0.6563751, -0.8002502, 0.2784314, 1, 0, 1,
-0.5981779, -0.6111414, -1.416417, 0.2705882, 1, 0, 1,
-0.5929909, -0.4879749, -0.2632362, 0.2666667, 1, 0, 1,
-0.5916041, -1.036005, -2.223984, 0.2588235, 1, 0, 1,
-0.5914156, 0.04868766, -1.294758, 0.254902, 1, 0, 1,
-0.5877288, -1.330692, -2.561317, 0.2470588, 1, 0, 1,
-0.5834373, -0.4620643, -4.291846, 0.2431373, 1, 0, 1,
-0.5823565, 2.302912, -0.03242255, 0.2352941, 1, 0, 1,
-0.5808322, -1.264299, -2.180418, 0.2313726, 1, 0, 1,
-0.5742167, 2.142928, -1.622006, 0.2235294, 1, 0, 1,
-0.5722139, 0.7901028, -0.0722091, 0.2196078, 1, 0, 1,
-0.5685446, 1.359671, 0.5539532, 0.2117647, 1, 0, 1,
-0.5641072, 0.3587112, -1.058657, 0.2078431, 1, 0, 1,
-0.5464308, 0.6829916, -0.8299677, 0.2, 1, 0, 1,
-0.539026, -0.1598338, -2.486482, 0.1921569, 1, 0, 1,
-0.5378719, 1.680026, 0.02095825, 0.1882353, 1, 0, 1,
-0.5234361, -0.04059403, -1.406424, 0.1803922, 1, 0, 1,
-0.5230764, 1.646055, -0.329235, 0.1764706, 1, 0, 1,
-0.5177203, 0.03660932, -1.342337, 0.1686275, 1, 0, 1,
-0.5152473, -0.9724901, -2.610362, 0.1647059, 1, 0, 1,
-0.5134737, -0.6965254, -2.712461, 0.1568628, 1, 0, 1,
-0.511678, -1.228884, -2.393694, 0.1529412, 1, 0, 1,
-0.5060586, 0.8010421, -0.008673327, 0.145098, 1, 0, 1,
-0.504904, -0.03300334, -1.835858, 0.1411765, 1, 0, 1,
-0.4984398, 0.3605243, -0.3948153, 0.1333333, 1, 0, 1,
-0.4982545, 0.8262638, -2.65326, 0.1294118, 1, 0, 1,
-0.4952328, -0.2693149, -2.76982, 0.1215686, 1, 0, 1,
-0.4909483, -0.09464248, 0.7758972, 0.1176471, 1, 0, 1,
-0.4875977, -0.02754305, -1.859571, 0.1098039, 1, 0, 1,
-0.4874576, -0.5277768, -3.608433, 0.1058824, 1, 0, 1,
-0.48736, 0.651958, 0.1900803, 0.09803922, 1, 0, 1,
-0.4869202, -1.368829, -2.098115, 0.09019608, 1, 0, 1,
-0.486618, 0.08037294, -2.136326, 0.08627451, 1, 0, 1,
-0.4801379, -0.02837729, -2.772449, 0.07843138, 1, 0, 1,
-0.4786732, 2.41156, 0.1220418, 0.07450981, 1, 0, 1,
-0.47003, 1.767556, 0.9226607, 0.06666667, 1, 0, 1,
-0.4695264, -0.5904242, -1.849352, 0.0627451, 1, 0, 1,
-0.4635328, 0.01142976, -2.253191, 0.05490196, 1, 0, 1,
-0.4633153, 1.218069, -0.793397, 0.05098039, 1, 0, 1,
-0.4597276, 0.4306952, 0.2572023, 0.04313726, 1, 0, 1,
-0.4592616, -1.572485, -2.986331, 0.03921569, 1, 0, 1,
-0.457287, -0.8389146, -0.5647554, 0.03137255, 1, 0, 1,
-0.4570569, -1.685578, -3.802594, 0.02745098, 1, 0, 1,
-0.4551531, -0.7953495, -2.961526, 0.01960784, 1, 0, 1,
-0.4526172, 0.7895176, -1.666616, 0.01568628, 1, 0, 1,
-0.4500114, 0.5660783, -0.4301697, 0.007843138, 1, 0, 1,
-0.4447595, 0.1518985, -0.7282016, 0.003921569, 1, 0, 1,
-0.4422252, 0.4264162, 1.029537, 0, 1, 0.003921569, 1,
-0.4386185, 0.2261896, -0.4863632, 0, 1, 0.01176471, 1,
-0.4380567, 0.6435685, -2.318966, 0, 1, 0.01568628, 1,
-0.4323392, -0.08658724, -1.096338, 0, 1, 0.02352941, 1,
-0.4307437, 0.3447204, -2.079612, 0, 1, 0.02745098, 1,
-0.4305647, 0.7587451, -0.973626, 0, 1, 0.03529412, 1,
-0.4284652, -0.3085179, -2.828011, 0, 1, 0.03921569, 1,
-0.4244337, -0.625541, -3.159179, 0, 1, 0.04705882, 1,
-0.424273, 0.3447269, 1.007853, 0, 1, 0.05098039, 1,
-0.4020442, 0.9268776, -1.528666, 0, 1, 0.05882353, 1,
-0.3925451, 1.222578, -1.165604, 0, 1, 0.0627451, 1,
-0.3920355, -1.258326, -1.23067, 0, 1, 0.07058824, 1,
-0.3918489, -0.9981239, -2.455399, 0, 1, 0.07450981, 1,
-0.3901765, -1.341019, -2.603735, 0, 1, 0.08235294, 1,
-0.388726, -1.152665, -1.514502, 0, 1, 0.08627451, 1,
-0.3868153, 0.8778878, 0.1011645, 0, 1, 0.09411765, 1,
-0.3812685, 1.238998, -0.85603, 0, 1, 0.1019608, 1,
-0.3797514, 0.5117847, -0.879275, 0, 1, 0.1058824, 1,
-0.3793943, -1.55802, -2.650638, 0, 1, 0.1137255, 1,
-0.3790219, 0.62479, -1.725744, 0, 1, 0.1176471, 1,
-0.3765869, 1.186085, -0.8627172, 0, 1, 0.1254902, 1,
-0.3751256, 0.3507665, -1.025385, 0, 1, 0.1294118, 1,
-0.3749556, 0.1701245, -2.190697, 0, 1, 0.1372549, 1,
-0.3680985, -1.160416, -3.737308, 0, 1, 0.1411765, 1,
-0.3676166, -0.05305147, -1.727535, 0, 1, 0.1490196, 1,
-0.3672402, 2.565741, -1.163403, 0, 1, 0.1529412, 1,
-0.3632577, -1.124394, -3.092167, 0, 1, 0.1607843, 1,
-0.3602959, -0.1359805, -2.823498, 0, 1, 0.1647059, 1,
-0.3599271, 1.080928, 1.600411, 0, 1, 0.172549, 1,
-0.3551569, -1.258715, -4.526826, 0, 1, 0.1764706, 1,
-0.3517879, 0.7569718, -1.449291, 0, 1, 0.1843137, 1,
-0.3489733, 1.47262, 0.4258308, 0, 1, 0.1882353, 1,
-0.3396925, 0.3565104, -1.274279, 0, 1, 0.1960784, 1,
-0.3262265, 1.205121, -0.4128292, 0, 1, 0.2039216, 1,
-0.3256545, -0.3966476, -2.471371, 0, 1, 0.2078431, 1,
-0.3247014, -0.7959182, -2.24829, 0, 1, 0.2156863, 1,
-0.3227559, -0.2213496, -1.995613, 0, 1, 0.2196078, 1,
-0.3217195, -0.6453025, -1.77335, 0, 1, 0.227451, 1,
-0.319803, 0.5153453, 1.263969, 0, 1, 0.2313726, 1,
-0.3142406, -1.024153, -2.910053, 0, 1, 0.2392157, 1,
-0.3052678, -0.8451326, -2.477337, 0, 1, 0.2431373, 1,
-0.302792, 0.1221007, -0.191976, 0, 1, 0.2509804, 1,
-0.2935147, -1.231551, -1.41525, 0, 1, 0.254902, 1,
-0.2918838, -0.3274298, -4.049728, 0, 1, 0.2627451, 1,
-0.290648, -1.163502, -3.248797, 0, 1, 0.2666667, 1,
-0.2904604, -0.6974082, -3.887268, 0, 1, 0.2745098, 1,
-0.2888011, -0.535206, -3.735603, 0, 1, 0.2784314, 1,
-0.2884786, -0.4015741, -2.736328, 0, 1, 0.2862745, 1,
-0.2840222, 1.801733, -0.5515397, 0, 1, 0.2901961, 1,
-0.2837575, 1.093925, 0.9470439, 0, 1, 0.2980392, 1,
-0.2828116, -0.09245285, -2.256093, 0, 1, 0.3058824, 1,
-0.2706597, -0.3187919, -1.994438, 0, 1, 0.3098039, 1,
-0.2679082, -0.3645511, -3.82466, 0, 1, 0.3176471, 1,
-0.2674268, -1.931035, -3.846817, 0, 1, 0.3215686, 1,
-0.267086, 0.1160974, -1.442041, 0, 1, 0.3294118, 1,
-0.2631955, 0.03435176, -1.543396, 0, 1, 0.3333333, 1,
-0.2602106, -0.01603668, -0.9204978, 0, 1, 0.3411765, 1,
-0.2553711, 0.6407412, -1.65542, 0, 1, 0.345098, 1,
-0.2546962, 1.669796, -0.2703275, 0, 1, 0.3529412, 1,
-0.2507198, 0.14304, -1.590837, 0, 1, 0.3568628, 1,
-0.2497744, 1.617737, -1.918936, 0, 1, 0.3647059, 1,
-0.2437528, -0.4564598, -3.633236, 0, 1, 0.3686275, 1,
-0.2429241, -0.8566753, -1.569796, 0, 1, 0.3764706, 1,
-0.2417278, -0.2760708, -3.065424, 0, 1, 0.3803922, 1,
-0.2399484, 0.2998444, -0.3071455, 0, 1, 0.3882353, 1,
-0.2387341, 0.2075358, -0.3304732, 0, 1, 0.3921569, 1,
-0.2381285, -1.840768, -2.121639, 0, 1, 0.4, 1,
-0.2366839, 0.1723106, -1.985658, 0, 1, 0.4078431, 1,
-0.2365793, -1.662393, -3.954457, 0, 1, 0.4117647, 1,
-0.2331946, 0.5925941, -0.8231376, 0, 1, 0.4196078, 1,
-0.2290215, 1.023696, -1.250666, 0, 1, 0.4235294, 1,
-0.2250045, -1.203538, -5.340451, 0, 1, 0.4313726, 1,
-0.2249268, -0.4863416, -3.830598, 0, 1, 0.4352941, 1,
-0.2198589, 0.8896508, -2.426743, 0, 1, 0.4431373, 1,
-0.2185618, -1.500456, -2.867502, 0, 1, 0.4470588, 1,
-0.2173768, 0.8614891, -1.431902, 0, 1, 0.454902, 1,
-0.216686, -0.8676522, -3.770198, 0, 1, 0.4588235, 1,
-0.2145185, 1.173372, -0.5919815, 0, 1, 0.4666667, 1,
-0.2119542, 0.9065117, 0.0500054, 0, 1, 0.4705882, 1,
-0.2098028, -0.02102122, -0.6834574, 0, 1, 0.4784314, 1,
-0.208917, -1.332089, -2.85359, 0, 1, 0.4823529, 1,
-0.2043321, 0.9132883, 0.4776246, 0, 1, 0.4901961, 1,
-0.2015187, -0.9112487, -4.372596, 0, 1, 0.4941176, 1,
-0.2005689, 0.1986664, -1.478875, 0, 1, 0.5019608, 1,
-0.2001306, 2.233395, -0.6866584, 0, 1, 0.509804, 1,
-0.1971025, -0.3469677, -2.986708, 0, 1, 0.5137255, 1,
-0.1958597, 0.07091089, -3.80515, 0, 1, 0.5215687, 1,
-0.1941568, -0.3086939, -2.233501, 0, 1, 0.5254902, 1,
-0.1939407, 1.1417, 0.8309634, 0, 1, 0.5333334, 1,
-0.1921755, -0.06890284, -1.513014, 0, 1, 0.5372549, 1,
-0.1883308, -0.8875905, -2.254207, 0, 1, 0.5450981, 1,
-0.1834227, -0.4088454, -4.050395, 0, 1, 0.5490196, 1,
-0.1764811, -2.200542, -3.566537, 0, 1, 0.5568628, 1,
-0.1759753, 0.08899449, -1.132134, 0, 1, 0.5607843, 1,
-0.1743859, -0.341552, -0.8534355, 0, 1, 0.5686275, 1,
-0.1711693, -0.9588074, -3.119457, 0, 1, 0.572549, 1,
-0.1703933, -1.088213, -2.410851, 0, 1, 0.5803922, 1,
-0.1699313, -0.3914533, -3.290731, 0, 1, 0.5843138, 1,
-0.1689723, 1.08646, -0.9869485, 0, 1, 0.5921569, 1,
-0.1686079, 0.3095887, -1.396788, 0, 1, 0.5960785, 1,
-0.1633325, -0.06154748, -4.23431, 0, 1, 0.6039216, 1,
-0.1625588, -0.6170353, -2.75538, 0, 1, 0.6117647, 1,
-0.1618878, 1.138488, 0.4578968, 0, 1, 0.6156863, 1,
-0.1616459, -1.058493, -4.196899, 0, 1, 0.6235294, 1,
-0.1611982, -1.962922, -4.044128, 0, 1, 0.627451, 1,
-0.1606673, -0.6765229, -5.102605, 0, 1, 0.6352941, 1,
-0.159943, 0.6005449, -1.279227, 0, 1, 0.6392157, 1,
-0.1593815, 0.2728601, 0.6762178, 0, 1, 0.6470588, 1,
-0.1538747, -0.7748207, -1.377249, 0, 1, 0.6509804, 1,
-0.1531793, -0.1740962, -3.932853, 0, 1, 0.6588235, 1,
-0.1500334, 0.5523145, 0.1304686, 0, 1, 0.6627451, 1,
-0.1481476, -0.522902, -3.666191, 0, 1, 0.6705883, 1,
-0.1431093, -0.1569469, -2.404369, 0, 1, 0.6745098, 1,
-0.1430154, -0.1557489, -3.508531, 0, 1, 0.682353, 1,
-0.1429125, -0.07015783, -2.683557, 0, 1, 0.6862745, 1,
-0.1402944, 0.4756413, -1.236958, 0, 1, 0.6941177, 1,
-0.1397023, 1.177222, 0.1556768, 0, 1, 0.7019608, 1,
-0.139435, -0.570052, -1.777675, 0, 1, 0.7058824, 1,
-0.1322551, -0.7146948, -3.843696, 0, 1, 0.7137255, 1,
-0.1311837, -0.7824807, -3.957729, 0, 1, 0.7176471, 1,
-0.1303104, -0.3958552, -2.457976, 0, 1, 0.7254902, 1,
-0.1291356, 0.5528846, -1.528776, 0, 1, 0.7294118, 1,
-0.1289459, 0.4575531, -0.4048728, 0, 1, 0.7372549, 1,
-0.1279754, -1.281561, -2.854558, 0, 1, 0.7411765, 1,
-0.1273889, -0.803028, -2.364755, 0, 1, 0.7490196, 1,
-0.1273841, -0.6413855, -2.736435, 0, 1, 0.7529412, 1,
-0.122797, -1.725134, -1.984335, 0, 1, 0.7607843, 1,
-0.1178736, 0.5175186, -1.777938, 0, 1, 0.7647059, 1,
-0.1177354, -0.5502519, -2.84608, 0, 1, 0.772549, 1,
-0.1159949, 0.8425944, -0.8494639, 0, 1, 0.7764706, 1,
-0.1127426, -1.395916, -3.851209, 0, 1, 0.7843137, 1,
-0.1054349, -0.3537154, -2.142189, 0, 1, 0.7882353, 1,
-0.09840389, 0.4762371, 0.9709517, 0, 1, 0.7960784, 1,
-0.09724161, -1.070888, -3.144159, 0, 1, 0.8039216, 1,
-0.09588684, -0.05128719, -2.559486, 0, 1, 0.8078431, 1,
-0.0927833, -0.480834, -1.119462, 0, 1, 0.8156863, 1,
-0.08952562, -1.707065, -3.121198, 0, 1, 0.8196079, 1,
-0.08928333, -1.367634, -2.204874, 0, 1, 0.827451, 1,
-0.08914094, 0.4441779, -0.4241925, 0, 1, 0.8313726, 1,
-0.08912034, 1.887284, 0.2006804, 0, 1, 0.8392157, 1,
-0.08140841, 0.8899809, 0.04763857, 0, 1, 0.8431373, 1,
-0.07657139, 0.2976804, -0.8563506, 0, 1, 0.8509804, 1,
-0.07513208, -0.06290017, -0.8866908, 0, 1, 0.854902, 1,
-0.0724227, -0.7488129, -3.979241, 0, 1, 0.8627451, 1,
-0.07005515, 1.026336, 0.8142745, 0, 1, 0.8666667, 1,
-0.05781812, 0.7669291, -1.071543, 0, 1, 0.8745098, 1,
-0.05604154, 1.64588, -0.5109901, 0, 1, 0.8784314, 1,
-0.05316576, 1.741948, -0.4888848, 0, 1, 0.8862745, 1,
-0.05218011, -0.6070205, -2.778922, 0, 1, 0.8901961, 1,
-0.04904792, 0.073105, -0.8813758, 0, 1, 0.8980392, 1,
-0.04547147, 0.3986405, -0.9623522, 0, 1, 0.9058824, 1,
-0.03924015, 0.5174385, -1.483837, 0, 1, 0.9098039, 1,
-0.03884768, -0.2184088, -2.326449, 0, 1, 0.9176471, 1,
-0.03445781, 1.912597, 1.87154, 0, 1, 0.9215686, 1,
-0.03277329, -0.3202322, -3.269668, 0, 1, 0.9294118, 1,
-0.03259029, -1.463024, -2.656189, 0, 1, 0.9333333, 1,
-0.03089726, -0.4872742, -4.218159, 0, 1, 0.9411765, 1,
-0.02456487, -1.384392, -1.683891, 0, 1, 0.945098, 1,
-0.02453733, 1.272509, -0.7608951, 0, 1, 0.9529412, 1,
-0.01650769, 0.5521967, 0.7890363, 0, 1, 0.9568627, 1,
-0.0156201, -0.02262075, -2.042845, 0, 1, 0.9647059, 1,
-0.01460479, -2.125877, -4.654055, 0, 1, 0.9686275, 1,
-0.01384273, -0.1574923, -1.871781, 0, 1, 0.9764706, 1,
-0.01290847, 2.615286, -1.046145, 0, 1, 0.9803922, 1,
-0.01268084, -1.891189, -4.537864, 0, 1, 0.9882353, 1,
-0.01039342, -0.4452767, -4.318959, 0, 1, 0.9921569, 1,
-0.01031982, -1.111618, -2.744348, 0, 1, 1, 1,
-0.009777684, 1.620844, -0.4091998, 0, 0.9921569, 1, 1,
-0.006749775, 0.1360392, 0.8163985, 0, 0.9882353, 1, 1,
-0.006241968, 1.27088, 1.308288, 0, 0.9803922, 1, 1,
-0.003319961, 1.727666, -0.0783496, 0, 0.9764706, 1, 1,
-0.0007500858, 1.408774, 0.09409627, 0, 0.9686275, 1, 1,
0.003285916, -0.756538, 4.405044, 0, 0.9647059, 1, 1,
0.01125295, 0.2310895, -0.3445213, 0, 0.9568627, 1, 1,
0.01529183, -0.1030338, 2.144535, 0, 0.9529412, 1, 1,
0.01687994, 0.5935642, -0.1408911, 0, 0.945098, 1, 1,
0.01902848, -1.076493, 3.386117, 0, 0.9411765, 1, 1,
0.02794211, -0.3191736, 2.344732, 0, 0.9333333, 1, 1,
0.03293028, 0.7207253, 1.081132, 0, 0.9294118, 1, 1,
0.03333903, 0.8452687, -0.448662, 0, 0.9215686, 1, 1,
0.0354679, 0.7559384, -1.279937, 0, 0.9176471, 1, 1,
0.03614074, -1.198963, 5.679595, 0, 0.9098039, 1, 1,
0.03759524, -0.822647, 2.112872, 0, 0.9058824, 1, 1,
0.03938014, 0.02322782, 1.067806, 0, 0.8980392, 1, 1,
0.04556537, 0.9638819, 1.04098, 0, 0.8901961, 1, 1,
0.04727745, -0.6468927, 2.544191, 0, 0.8862745, 1, 1,
0.04773479, -2.606704, 1.204332, 0, 0.8784314, 1, 1,
0.04929477, 1.172459, -0.4648737, 0, 0.8745098, 1, 1,
0.05003118, -0.7204981, 2.139006, 0, 0.8666667, 1, 1,
0.05146187, -0.1177253, 2.031801, 0, 0.8627451, 1, 1,
0.05388548, 0.7110444, 1.407136, 0, 0.854902, 1, 1,
0.05609609, -0.4833622, 1.926073, 0, 0.8509804, 1, 1,
0.05788479, -0.3662218, 3.545388, 0, 0.8431373, 1, 1,
0.06156933, 1.038142, 0.7674158, 0, 0.8392157, 1, 1,
0.06298438, -2.227587, 5.418514, 0, 0.8313726, 1, 1,
0.06496757, 2.27419, -0.3935862, 0, 0.827451, 1, 1,
0.06597863, -0.8924744, 4.29966, 0, 0.8196079, 1, 1,
0.06878679, 0.6895292, 0.02134514, 0, 0.8156863, 1, 1,
0.07031791, 0.06322806, 1.65225, 0, 0.8078431, 1, 1,
0.0724891, 1.301798, -0.6333985, 0, 0.8039216, 1, 1,
0.07252604, 1.298911, -0.7426391, 0, 0.7960784, 1, 1,
0.08082468, 0.97232, -0.3792681, 0, 0.7882353, 1, 1,
0.08278998, 0.7169794, 0.2705681, 0, 0.7843137, 1, 1,
0.08329168, 0.06436849, 0.5333675, 0, 0.7764706, 1, 1,
0.08521661, -2.694846, 4.604272, 0, 0.772549, 1, 1,
0.08917338, -1.386845, 3.67412, 0, 0.7647059, 1, 1,
0.09260181, -0.9044864, 3.453436, 0, 0.7607843, 1, 1,
0.09356925, 1.359381, -0.1423026, 0, 0.7529412, 1, 1,
0.09409516, 1.033676, 0.2220184, 0, 0.7490196, 1, 1,
0.09477303, -2.565264, 2.670844, 0, 0.7411765, 1, 1,
0.09488315, -1.660617, 1.311152, 0, 0.7372549, 1, 1,
0.09716599, -1.334593, 3.056047, 0, 0.7294118, 1, 1,
0.09823674, -0.2700261, 0.8089525, 0, 0.7254902, 1, 1,
0.1002638, -0.4959826, 1.716712, 0, 0.7176471, 1, 1,
0.1023221, 1.300321, -1.724314, 0, 0.7137255, 1, 1,
0.1101339, 0.9965, -0.2640769, 0, 0.7058824, 1, 1,
0.1124865, -0.5865707, 3.585434, 0, 0.6980392, 1, 1,
0.1128273, 0.4969309, 0.09797575, 0, 0.6941177, 1, 1,
0.1162648, 0.7237391, 0.8342052, 0, 0.6862745, 1, 1,
0.1164252, -0.3027595, 4.473566, 0, 0.682353, 1, 1,
0.1220731, -0.7609635, 2.49979, 0, 0.6745098, 1, 1,
0.1248823, 0.1347906, -0.05620513, 0, 0.6705883, 1, 1,
0.1253921, -2.298109, 5.377696, 0, 0.6627451, 1, 1,
0.1281693, 0.7026251, -0.1020971, 0, 0.6588235, 1, 1,
0.1287529, 0.7975302, -0.432038, 0, 0.6509804, 1, 1,
0.1297052, -0.1981826, 3.130467, 0, 0.6470588, 1, 1,
0.1331396, 0.0295556, 0.2511524, 0, 0.6392157, 1, 1,
0.1386251, 1.051589, 0.1738491, 0, 0.6352941, 1, 1,
0.1409322, 0.4795431, 0.7655708, 0, 0.627451, 1, 1,
0.146054, -1.631323, 3.67436, 0, 0.6235294, 1, 1,
0.1474543, -0.3427388, 2.833669, 0, 0.6156863, 1, 1,
0.1492517, -2.875576, 1.884858, 0, 0.6117647, 1, 1,
0.1571543, -0.7906829, 3.056974, 0, 0.6039216, 1, 1,
0.1590531, -1.627017, 3.208335, 0, 0.5960785, 1, 1,
0.1591637, -0.6969317, 4.218801, 0, 0.5921569, 1, 1,
0.1594737, -0.7575666, 2.742363, 0, 0.5843138, 1, 1,
0.1616858, 2.387321, 0.9769041, 0, 0.5803922, 1, 1,
0.1650729, 1.600013, -0.2060923, 0, 0.572549, 1, 1,
0.1663795, -0.8523803, 2.504843, 0, 0.5686275, 1, 1,
0.1668593, 0.6301487, 1.098912, 0, 0.5607843, 1, 1,
0.1681364, -1.617714, 3.875916, 0, 0.5568628, 1, 1,
0.1705827, 0.5095962, 1.039457, 0, 0.5490196, 1, 1,
0.1733199, -0.5752432, 2.711182, 0, 0.5450981, 1, 1,
0.173488, -0.689549, 4.793694, 0, 0.5372549, 1, 1,
0.1756728, -0.8907087, 2.418228, 0, 0.5333334, 1, 1,
0.1776184, 1.431747, -2.054172, 0, 0.5254902, 1, 1,
0.1786581, -0.009759363, 2.967243, 0, 0.5215687, 1, 1,
0.1840541, -0.650212, 2.385709, 0, 0.5137255, 1, 1,
0.184273, 0.7189512, 0.5814735, 0, 0.509804, 1, 1,
0.1850124, 0.238445, 1.401385, 0, 0.5019608, 1, 1,
0.1873048, -1.123736, 1.840479, 0, 0.4941176, 1, 1,
0.1877465, 0.9496989, 1.331438, 0, 0.4901961, 1, 1,
0.1905266, 1.005108, 0.9150446, 0, 0.4823529, 1, 1,
0.1934494, 3.034861, -0.4290962, 0, 0.4784314, 1, 1,
0.1937139, -0.265252, 3.590039, 0, 0.4705882, 1, 1,
0.1959985, -0.0657174, 5.00041, 0, 0.4666667, 1, 1,
0.2027201, 0.6812177, -0.9317927, 0, 0.4588235, 1, 1,
0.2084393, -1.833204, 3.208534, 0, 0.454902, 1, 1,
0.2089846, 1.492131, 0.3171007, 0, 0.4470588, 1, 1,
0.2135941, -0.6165405, 3.852529, 0, 0.4431373, 1, 1,
0.2147824, 0.08019713, 1.034507, 0, 0.4352941, 1, 1,
0.2150847, 1.151428, -1.331735, 0, 0.4313726, 1, 1,
0.2212984, 1.151944, -0.411393, 0, 0.4235294, 1, 1,
0.223478, -2.719893, 3.619481, 0, 0.4196078, 1, 1,
0.2246268, -0.5166805, 2.994133, 0, 0.4117647, 1, 1,
0.2261769, -2.678332, 3.300771, 0, 0.4078431, 1, 1,
0.2280963, 1.518003, -0.4571691, 0, 0.4, 1, 1,
0.2322341, -1.393328, 2.150397, 0, 0.3921569, 1, 1,
0.2325341, 0.5959688, 0.1632686, 0, 0.3882353, 1, 1,
0.2493798, -0.6902642, 2.18229, 0, 0.3803922, 1, 1,
0.2513219, 1.109275, -1.53675, 0, 0.3764706, 1, 1,
0.2541631, 0.8806357, 1.200959, 0, 0.3686275, 1, 1,
0.2545477, -1.180179, 3.219256, 0, 0.3647059, 1, 1,
0.2551943, -1.122787, 2.115656, 0, 0.3568628, 1, 1,
0.2580353, 0.660271, 0.6667372, 0, 0.3529412, 1, 1,
0.2596898, 0.9271256, 0.2736757, 0, 0.345098, 1, 1,
0.2604541, -0.2569164, 2.333594, 0, 0.3411765, 1, 1,
0.2653756, 0.2506475, 0.811107, 0, 0.3333333, 1, 1,
0.2667081, -0.05944418, 1.057859, 0, 0.3294118, 1, 1,
0.2720226, -0.2554612, 1.392434, 0, 0.3215686, 1, 1,
0.2720604, 0.01808925, 2.848586, 0, 0.3176471, 1, 1,
0.274231, -0.3614506, 3.683944, 0, 0.3098039, 1, 1,
0.2761333, -0.1996935, 3.231939, 0, 0.3058824, 1, 1,
0.2764044, -0.5291652, 4.519824, 0, 0.2980392, 1, 1,
0.2794502, 0.002518269, 0.5024877, 0, 0.2901961, 1, 1,
0.2804005, 0.0845632, 2.224952, 0, 0.2862745, 1, 1,
0.284242, -0.439038, 0.7484861, 0, 0.2784314, 1, 1,
0.2903674, -1.057808, 3.357357, 0, 0.2745098, 1, 1,
0.2909215, -1.138482, 3.165701, 0, 0.2666667, 1, 1,
0.3011229, 1.194021, -0.3964334, 0, 0.2627451, 1, 1,
0.3035075, 0.5660031, 1.709797, 0, 0.254902, 1, 1,
0.3036475, -0.4576395, 1.308592, 0, 0.2509804, 1, 1,
0.31172, -0.2921367, 0.5848956, 0, 0.2431373, 1, 1,
0.3203456, 0.2301409, 0.1014311, 0, 0.2392157, 1, 1,
0.3206468, -0.1009551, 2.323184, 0, 0.2313726, 1, 1,
0.3223206, -0.2535075, 3.468966, 0, 0.227451, 1, 1,
0.3251814, -0.2516538, 0.9198829, 0, 0.2196078, 1, 1,
0.327123, -1.178497, 2.802454, 0, 0.2156863, 1, 1,
0.3377154, -1.305006, 4.815316, 0, 0.2078431, 1, 1,
0.3431364, -1.232309, 1.457787, 0, 0.2039216, 1, 1,
0.3485681, 0.668898, -0.09543855, 0, 0.1960784, 1, 1,
0.3488343, 0.08548851, 1.128665, 0, 0.1882353, 1, 1,
0.3517409, 0.9660751, 0.8347379, 0, 0.1843137, 1, 1,
0.354562, 1.589382, 0.08797983, 0, 0.1764706, 1, 1,
0.3585993, 1.457136, -1.312984, 0, 0.172549, 1, 1,
0.3589815, 2.06951, -1.340011, 0, 0.1647059, 1, 1,
0.363362, -0.2335744, 3.000656, 0, 0.1607843, 1, 1,
0.3640792, 0.4795932, 1.221915, 0, 0.1529412, 1, 1,
0.3685444, -0.07808895, 2.371812, 0, 0.1490196, 1, 1,
0.3686469, 0.06256022, -2.165742, 0, 0.1411765, 1, 1,
0.376786, -0.2852804, -0.1366232, 0, 0.1372549, 1, 1,
0.3775479, 0.3398855, 2.301532, 0, 0.1294118, 1, 1,
0.3794723, -0.2413285, 0.03988707, 0, 0.1254902, 1, 1,
0.3822904, 0.01995421, 1.007164, 0, 0.1176471, 1, 1,
0.3892047, -0.01131696, 0.1345341, 0, 0.1137255, 1, 1,
0.3969548, 0.7437305, -0.01971703, 0, 0.1058824, 1, 1,
0.3977455, -0.8212413, 3.732969, 0, 0.09803922, 1, 1,
0.3982846, 0.09057562, 1.444388, 0, 0.09411765, 1, 1,
0.3986388, 0.4733905, -0.06307442, 0, 0.08627451, 1, 1,
0.3994893, 1.33813, 0.8617097, 0, 0.08235294, 1, 1,
0.4021344, 0.8424057, -1.146684, 0, 0.07450981, 1, 1,
0.403437, -0.1735224, 3.673822, 0, 0.07058824, 1, 1,
0.405094, 0.7491118, 0.760568, 0, 0.0627451, 1, 1,
0.4061025, -0.1606364, 1.198898, 0, 0.05882353, 1, 1,
0.4077631, 1.738853, -0.9791088, 0, 0.05098039, 1, 1,
0.4090748, -2.239591, 3.158193, 0, 0.04705882, 1, 1,
0.412362, -0.2282489, 3.507452, 0, 0.03921569, 1, 1,
0.4225245, -0.4540891, 2.577916, 0, 0.03529412, 1, 1,
0.4274111, 1.098438, 0.6941958, 0, 0.02745098, 1, 1,
0.4277181, 0.6888251, 0.7629047, 0, 0.02352941, 1, 1,
0.4323719, 0.5303599, -0.8094528, 0, 0.01568628, 1, 1,
0.4340951, -1.398298, 2.184925, 0, 0.01176471, 1, 1,
0.4349369, 0.03849764, 0.2268713, 0, 0.003921569, 1, 1,
0.4351744, -0.683174, 2.493978, 0.003921569, 0, 1, 1,
0.4374648, 0.1427586, 1.602767, 0.007843138, 0, 1, 1,
0.4430545, 0.3398229, 1.706845, 0.01568628, 0, 1, 1,
0.4452712, 0.6323451, 0.2285283, 0.01960784, 0, 1, 1,
0.4452847, -0.6407498, 4.030268, 0.02745098, 0, 1, 1,
0.44792, -0.9134896, 3.460176, 0.03137255, 0, 1, 1,
0.4577884, 1.277397, -0.3920459, 0.03921569, 0, 1, 1,
0.4592425, 1.419654, -1.875416, 0.04313726, 0, 1, 1,
0.4606366, 0.1308485, 2.895779, 0.05098039, 0, 1, 1,
0.463672, 0.9924001, -1.488051, 0.05490196, 0, 1, 1,
0.4666613, 0.8181687, 0.2267226, 0.0627451, 0, 1, 1,
0.4736651, -0.4379887, 2.914347, 0.06666667, 0, 1, 1,
0.4795226, -0.1845339, 2.193259, 0.07450981, 0, 1, 1,
0.4796042, -0.8715178, 3.637982, 0.07843138, 0, 1, 1,
0.4836784, -1.792304, 2.167371, 0.08627451, 0, 1, 1,
0.4840345, 0.8078028, 0.2213068, 0.09019608, 0, 1, 1,
0.484383, -1.028013, 2.971895, 0.09803922, 0, 1, 1,
0.4862638, -2.325364, 2.183897, 0.1058824, 0, 1, 1,
0.4864111, -1.185743, 2.731894, 0.1098039, 0, 1, 1,
0.4888676, 0.4994214, -0.5492011, 0.1176471, 0, 1, 1,
0.49336, -0.7341008, 3.658066, 0.1215686, 0, 1, 1,
0.4989329, 0.4719132, -0.1840685, 0.1294118, 0, 1, 1,
0.4989951, 0.2449539, 2.905935, 0.1333333, 0, 1, 1,
0.5036585, -1.902049, 2.344534, 0.1411765, 0, 1, 1,
0.5042353, 0.93485, 2.388719, 0.145098, 0, 1, 1,
0.5072219, -0.6341895, 1.401368, 0.1529412, 0, 1, 1,
0.5114219, 0.3601396, -0.1495401, 0.1568628, 0, 1, 1,
0.5133994, -0.1627332, -0.2428785, 0.1647059, 0, 1, 1,
0.5144829, -0.5662794, -0.207308, 0.1686275, 0, 1, 1,
0.5156735, 0.11524, -0.1792146, 0.1764706, 0, 1, 1,
0.526466, 1.580266, -0.8006181, 0.1803922, 0, 1, 1,
0.5352213, 0.2236517, 1.181538, 0.1882353, 0, 1, 1,
0.5458319, -0.7058615, 2.429821, 0.1921569, 0, 1, 1,
0.546376, 0.5520416, 1.510592, 0.2, 0, 1, 1,
0.5480942, -1.528449, 1.657827, 0.2078431, 0, 1, 1,
0.5487793, 0.3900339, 0.9326901, 0.2117647, 0, 1, 1,
0.5598721, -0.9948324, 3.63771, 0.2196078, 0, 1, 1,
0.5613934, -0.9061605, 1.284759, 0.2235294, 0, 1, 1,
0.5629864, 0.1177177, 0.7486813, 0.2313726, 0, 1, 1,
0.563119, -1.018675, 5.224919, 0.2352941, 0, 1, 1,
0.563417, -1.715724, 4.431969, 0.2431373, 0, 1, 1,
0.5640973, -0.7649216, 2.625581, 0.2470588, 0, 1, 1,
0.5643536, -0.2836097, 2.177115, 0.254902, 0, 1, 1,
0.5685251, -1.411824, 1.540453, 0.2588235, 0, 1, 1,
0.5735233, -0.3639033, 2.561669, 0.2666667, 0, 1, 1,
0.5751048, -0.1427621, 1.157581, 0.2705882, 0, 1, 1,
0.5795577, 0.5709737, 1.389267, 0.2784314, 0, 1, 1,
0.5834322, 0.07318038, 3.706555, 0.282353, 0, 1, 1,
0.5876957, -1.727902, 4.57202, 0.2901961, 0, 1, 1,
0.5931855, -0.2985121, 0.6640028, 0.2941177, 0, 1, 1,
0.594896, 1.020484, -0.4373956, 0.3019608, 0, 1, 1,
0.5979186, 0.6047758, 1.14787, 0.3098039, 0, 1, 1,
0.5988455, 1.740371, 1.399707, 0.3137255, 0, 1, 1,
0.6032338, 0.3729837, 0.2834572, 0.3215686, 0, 1, 1,
0.6092104, -1.157554, 1.826787, 0.3254902, 0, 1, 1,
0.6102918, 0.7969673, 0.5072175, 0.3333333, 0, 1, 1,
0.6107615, -0.05188433, 1.712798, 0.3372549, 0, 1, 1,
0.6130351, 0.1428144, 2.385523, 0.345098, 0, 1, 1,
0.6142814, 1.688812, 1.227362, 0.3490196, 0, 1, 1,
0.6153854, -1.109686, 1.559057, 0.3568628, 0, 1, 1,
0.619311, 0.7886493, 0.376389, 0.3607843, 0, 1, 1,
0.6247357, -0.1364926, 2.058024, 0.3686275, 0, 1, 1,
0.6280433, -1.772927, 2.969913, 0.372549, 0, 1, 1,
0.6281667, 1.363963, 0.4389093, 0.3803922, 0, 1, 1,
0.6290624, -0.2436364, 1.027535, 0.3843137, 0, 1, 1,
0.6328716, 0.7925862, 1.094232, 0.3921569, 0, 1, 1,
0.6354101, 0.2599815, 1.432793, 0.3960784, 0, 1, 1,
0.644289, 0.2974813, 1.414625, 0.4039216, 0, 1, 1,
0.6446147, -1.498556, 2.063141, 0.4117647, 0, 1, 1,
0.6486396, -0.9541615, 2.225793, 0.4156863, 0, 1, 1,
0.6526456, 0.2990857, 1.539914, 0.4235294, 0, 1, 1,
0.6541246, 0.8697294, -0.6856974, 0.427451, 0, 1, 1,
0.6545539, 1.121094, 1.299967, 0.4352941, 0, 1, 1,
0.6545769, -0.1438166, 2.309893, 0.4392157, 0, 1, 1,
0.6558233, -0.3553816, 4.507089, 0.4470588, 0, 1, 1,
0.6591076, 1.268119, 1.013217, 0.4509804, 0, 1, 1,
0.6636756, -1.150717, 2.607783, 0.4588235, 0, 1, 1,
0.6655383, 1.02167, -0.3256565, 0.4627451, 0, 1, 1,
0.6699665, -2.208307, 2.530581, 0.4705882, 0, 1, 1,
0.6738059, -1.221775, 1.705616, 0.4745098, 0, 1, 1,
0.6747105, -0.858067, 3.106187, 0.4823529, 0, 1, 1,
0.6769686, -0.2816094, 3.109486, 0.4862745, 0, 1, 1,
0.6796523, -0.5381397, 1.457522, 0.4941176, 0, 1, 1,
0.6797432, 0.5961522, 0.6740195, 0.5019608, 0, 1, 1,
0.6804613, -0.141995, 1.691007, 0.5058824, 0, 1, 1,
0.6817288, 0.01866103, 2.415045, 0.5137255, 0, 1, 1,
0.6868321, 0.2565279, 0.08677585, 0.5176471, 0, 1, 1,
0.6943475, -0.7140548, 2.40292, 0.5254902, 0, 1, 1,
0.6992343, 0.7719875, -0.002528307, 0.5294118, 0, 1, 1,
0.7102468, -0.542843, 1.454962, 0.5372549, 0, 1, 1,
0.7126936, 0.4571801, 2.615381, 0.5411765, 0, 1, 1,
0.7139452, 0.5778187, 0.8462197, 0.5490196, 0, 1, 1,
0.7146474, -0.2608696, 0.9340169, 0.5529412, 0, 1, 1,
0.7220837, 0.2960713, 1.597286, 0.5607843, 0, 1, 1,
0.7318905, 2.080481, -0.6802151, 0.5647059, 0, 1, 1,
0.7322792, -1.771962, 3.829317, 0.572549, 0, 1, 1,
0.7347069, -0.05996331, 3.333444, 0.5764706, 0, 1, 1,
0.740581, -1.093687, 1.542958, 0.5843138, 0, 1, 1,
0.746361, 0.9524547, 1.146124, 0.5882353, 0, 1, 1,
0.7495762, 0.3112052, 2.017326, 0.5960785, 0, 1, 1,
0.7549908, 0.3002712, -0.08091965, 0.6039216, 0, 1, 1,
0.7559493, -0.2710818, 2.056407, 0.6078432, 0, 1, 1,
0.757315, -0.6480929, 2.363008, 0.6156863, 0, 1, 1,
0.7573847, 0.838286, 2.127827, 0.6196079, 0, 1, 1,
0.7575291, -0.5380893, 2.048394, 0.627451, 0, 1, 1,
0.759316, 1.241318, 0.1429359, 0.6313726, 0, 1, 1,
0.7607061, 1.117369, -0.4214961, 0.6392157, 0, 1, 1,
0.7636089, -0.09782168, 3.383841, 0.6431373, 0, 1, 1,
0.7707756, -1.300722, 2.787041, 0.6509804, 0, 1, 1,
0.780948, -1.203263, 1.367874, 0.654902, 0, 1, 1,
0.7870075, -1.681827, 3.530274, 0.6627451, 0, 1, 1,
0.7902614, -0.03939782, 1.970565, 0.6666667, 0, 1, 1,
0.7918072, -0.4921562, 1.847622, 0.6745098, 0, 1, 1,
0.792262, -1.350511, 2.75614, 0.6784314, 0, 1, 1,
0.7923608, 0.3196173, -0.1218064, 0.6862745, 0, 1, 1,
0.7954808, 1.562316, -1.319644, 0.6901961, 0, 1, 1,
0.795677, -0.8804041, 3.968458, 0.6980392, 0, 1, 1,
0.7977629, -0.237803, 1.069923, 0.7058824, 0, 1, 1,
0.7990605, 0.850687, 1.272317, 0.7098039, 0, 1, 1,
0.8026433, 0.5088177, 0.9150594, 0.7176471, 0, 1, 1,
0.8034054, -1.307078, 2.043019, 0.7215686, 0, 1, 1,
0.8041363, -2.340442, 3.722668, 0.7294118, 0, 1, 1,
0.8074771, 0.3045225, 1.225152, 0.7333333, 0, 1, 1,
0.8088404, -1.953682, 2.267689, 0.7411765, 0, 1, 1,
0.8092114, -0.5283478, 2.609419, 0.7450981, 0, 1, 1,
0.8194389, -0.8107875, 3.764047, 0.7529412, 0, 1, 1,
0.8232521, 0.8211386, 2.395036, 0.7568628, 0, 1, 1,
0.8244076, -0.4611585, 1.773958, 0.7647059, 0, 1, 1,
0.8261107, 0.2163173, 1.507596, 0.7686275, 0, 1, 1,
0.8261928, -0.05574167, 1.192446, 0.7764706, 0, 1, 1,
0.8279825, 0.09350406, 2.030626, 0.7803922, 0, 1, 1,
0.8287892, -0.3388176, 0.1685827, 0.7882353, 0, 1, 1,
0.8308464, 0.7645513, 0.2590556, 0.7921569, 0, 1, 1,
0.8315925, 1.470609, 0.2499871, 0.8, 0, 1, 1,
0.8342597, 0.2917878, 1.633591, 0.8078431, 0, 1, 1,
0.8359673, -0.5389193, 2.315096, 0.8117647, 0, 1, 1,
0.8480403, -0.3941535, 1.17775, 0.8196079, 0, 1, 1,
0.849796, 1.338469, -1.064471, 0.8235294, 0, 1, 1,
0.8506879, -0.9437052, 1.363353, 0.8313726, 0, 1, 1,
0.8625495, 0.8837305, 0.4558363, 0.8352941, 0, 1, 1,
0.8660938, -1.424784, 0.05194627, 0.8431373, 0, 1, 1,
0.8706768, -1.150898, 2.851763, 0.8470588, 0, 1, 1,
0.8798748, 0.946846, -0.3899391, 0.854902, 0, 1, 1,
0.8823775, -1.279391, 2.400943, 0.8588235, 0, 1, 1,
0.8892441, -0.13068, 2.100986, 0.8666667, 0, 1, 1,
0.8933771, -0.9613218, 3.229652, 0.8705882, 0, 1, 1,
0.8995758, -1.088162, 3.257798, 0.8784314, 0, 1, 1,
0.9023484, -0.1124603, 1.484518, 0.8823529, 0, 1, 1,
0.9115618, -0.5605021, 3.745938, 0.8901961, 0, 1, 1,
0.9168329, -0.3226843, 3.33344, 0.8941177, 0, 1, 1,
0.9169772, 0.6105062, 0.7870063, 0.9019608, 0, 1, 1,
0.9262897, -1.094547, 0.7243555, 0.9098039, 0, 1, 1,
0.9278133, -1.949365, 3.535937, 0.9137255, 0, 1, 1,
0.9309683, 1.025203, 1.622253, 0.9215686, 0, 1, 1,
0.9329438, 0.6778891, 3.171664, 0.9254902, 0, 1, 1,
0.9335232, -1.73266, 4.109882, 0.9333333, 0, 1, 1,
0.940021, -1.353395, 2.051624, 0.9372549, 0, 1, 1,
0.9417821, 0.6399934, 1.342386, 0.945098, 0, 1, 1,
0.942302, 1.341341, 0.8282431, 0.9490196, 0, 1, 1,
0.9561872, -0.4661075, 2.31508, 0.9568627, 0, 1, 1,
0.9579557, 0.2063635, 2.315538, 0.9607843, 0, 1, 1,
0.9682852, -1.23766, -0.2602934, 0.9686275, 0, 1, 1,
0.9735351, -1.110019, 2.596714, 0.972549, 0, 1, 1,
0.9794961, -0.67551, 2.742601, 0.9803922, 0, 1, 1,
0.983167, -0.5863107, 2.386331, 0.9843137, 0, 1, 1,
0.9954042, -0.1519621, 1.546625, 0.9921569, 0, 1, 1,
1.001187, 0.9091907, 0.2020889, 0.9960784, 0, 1, 1,
1.001572, 0.09943637, -0.846837, 1, 0, 0.9960784, 1,
1.004538, 1.402246, -0.3068953, 1, 0, 0.9882353, 1,
1.010616, 0.9006139, 0.9996298, 1, 0, 0.9843137, 1,
1.011843, 1.71395, -0.3345852, 1, 0, 0.9764706, 1,
1.012519, 0.1057313, 2.286103, 1, 0, 0.972549, 1,
1.017245, -0.7569053, 1.977303, 1, 0, 0.9647059, 1,
1.017932, 2.485165, 2.104026, 1, 0, 0.9607843, 1,
1.018573, -0.5166601, 2.081765, 1, 0, 0.9529412, 1,
1.023545, -0.3416271, 2.643115, 1, 0, 0.9490196, 1,
1.025338, 1.514722, 0.1998072, 1, 0, 0.9411765, 1,
1.030429, -0.002958233, 1.79841, 1, 0, 0.9372549, 1,
1.031023, -0.3045769, 3.7981, 1, 0, 0.9294118, 1,
1.033459, -0.546396, 1.336433, 1, 0, 0.9254902, 1,
1.042193, 2.602793, 0.05798978, 1, 0, 0.9176471, 1,
1.045689, 0.7795927, 0.9911215, 1, 0, 0.9137255, 1,
1.05354, 0.4073536, 2.78099, 1, 0, 0.9058824, 1,
1.057638, -0.4851068, 1.420778, 1, 0, 0.9019608, 1,
1.059932, 2.089412, -1.211632, 1, 0, 0.8941177, 1,
1.071316, 1.622241, 0.1870731, 1, 0, 0.8862745, 1,
1.071823, -0.2723161, 0.5282341, 1, 0, 0.8823529, 1,
1.072375, -0.3132799, -1.958431, 1, 0, 0.8745098, 1,
1.090005, 0.4715347, 0.1949554, 1, 0, 0.8705882, 1,
1.091845, 0.8732222, 0.346268, 1, 0, 0.8627451, 1,
1.092563, -1.871077, 2.836753, 1, 0, 0.8588235, 1,
1.093761, 0.4810238, 2.481879, 1, 0, 0.8509804, 1,
1.102453, -0.5307348, 1.613423, 1, 0, 0.8470588, 1,
1.103607, -1.099587, 3.243205, 1, 0, 0.8392157, 1,
1.110818, 1.525422, 0.4756501, 1, 0, 0.8352941, 1,
1.120889, 1.598102, 0.7696172, 1, 0, 0.827451, 1,
1.120945, 0.1543983, 1.727102, 1, 0, 0.8235294, 1,
1.122677, 1.279207, 0.6881865, 1, 0, 0.8156863, 1,
1.126125, 1.228904, 1.468213, 1, 0, 0.8117647, 1,
1.133514, -0.5201787, 2.671838, 1, 0, 0.8039216, 1,
1.140657, -0.321925, 0.6784236, 1, 0, 0.7960784, 1,
1.143041, -0.8334298, 3.334918, 1, 0, 0.7921569, 1,
1.144247, -0.8682233, 0.960995, 1, 0, 0.7843137, 1,
1.145045, -0.1731233, 2.017401, 1, 0, 0.7803922, 1,
1.147161, 1.303181, -0.8474581, 1, 0, 0.772549, 1,
1.147301, -0.7076933, 1.996119, 1, 0, 0.7686275, 1,
1.150006, -0.1828483, 1.13116, 1, 0, 0.7607843, 1,
1.157144, -0.1239905, 2.109434, 1, 0, 0.7568628, 1,
1.157382, -0.8845732, 3.493892, 1, 0, 0.7490196, 1,
1.163074, 0.3571708, 0.5224627, 1, 0, 0.7450981, 1,
1.174733, 0.94272, 0.6824697, 1, 0, 0.7372549, 1,
1.175414, 0.9100155, 1.831546, 1, 0, 0.7333333, 1,
1.179905, 0.01304939, 1.355067, 1, 0, 0.7254902, 1,
1.183237, 1.034233, 1.773942, 1, 0, 0.7215686, 1,
1.189498, 0.2039447, 0.4042569, 1, 0, 0.7137255, 1,
1.197813, -0.8700027, 1.080487, 1, 0, 0.7098039, 1,
1.203361, 1.378424, -0.5924106, 1, 0, 0.7019608, 1,
1.210384, -0.2414229, 0.6938472, 1, 0, 0.6941177, 1,
1.216408, -1.592825, 2.646046, 1, 0, 0.6901961, 1,
1.219008, 0.2711776, 0.6016784, 1, 0, 0.682353, 1,
1.222632, 0.3326978, 3.614265, 1, 0, 0.6784314, 1,
1.22681, 0.4086422, 0.1582605, 1, 0, 0.6705883, 1,
1.23649, -0.8545674, 3.107423, 1, 0, 0.6666667, 1,
1.243197, -0.2587207, 0.8289124, 1, 0, 0.6588235, 1,
1.244389, -0.2818043, 2.435641, 1, 0, 0.654902, 1,
1.244779, -0.007760399, 0.1618648, 1, 0, 0.6470588, 1,
1.251717, 0.334926, 0.3442729, 1, 0, 0.6431373, 1,
1.258114, -1.171372, 2.149555, 1, 0, 0.6352941, 1,
1.266344, -0.8672726, 2.120335, 1, 0, 0.6313726, 1,
1.282728, 0.1421778, 1.435129, 1, 0, 0.6235294, 1,
1.283136, 0.2336724, 1.872388, 1, 0, 0.6196079, 1,
1.285637, 1.175253, -0.2405502, 1, 0, 0.6117647, 1,
1.287389, -2.090635, 2.959067, 1, 0, 0.6078432, 1,
1.305502, -1.693339, 3.881927, 1, 0, 0.6, 1,
1.309739, -0.7916852, 1.86713, 1, 0, 0.5921569, 1,
1.310342, -0.3788581, -0.2485415, 1, 0, 0.5882353, 1,
1.310573, -1.545269, 1.585364, 1, 0, 0.5803922, 1,
1.317598, 0.1286871, 1.136628, 1, 0, 0.5764706, 1,
1.318099, -0.6881633, 0.8437014, 1, 0, 0.5686275, 1,
1.319117, 0.02137923, 0.965976, 1, 0, 0.5647059, 1,
1.328071, 0.5928046, 1.447586, 1, 0, 0.5568628, 1,
1.350161, 1.051769, -0.2792486, 1, 0, 0.5529412, 1,
1.354747, -0.003928612, 0.8261727, 1, 0, 0.5450981, 1,
1.365331, -0.6865668, 1.204628, 1, 0, 0.5411765, 1,
1.37165, 1.577814, 0.422304, 1, 0, 0.5333334, 1,
1.373004, 2.044142, 0.3201523, 1, 0, 0.5294118, 1,
1.386264, -1.503042, 1.238859, 1, 0, 0.5215687, 1,
1.402965, -0.7184999, 2.110409, 1, 0, 0.5176471, 1,
1.40537, 2.955574, -0.09040822, 1, 0, 0.509804, 1,
1.407951, 0.1055789, 2.001458, 1, 0, 0.5058824, 1,
1.416147, -0.3892073, 3.140939, 1, 0, 0.4980392, 1,
1.416324, -1.749583, 2.297225, 1, 0, 0.4901961, 1,
1.427188, -1.462599, 2.150061, 1, 0, 0.4862745, 1,
1.431187, -0.3486822, 1.711007, 1, 0, 0.4784314, 1,
1.433298, 0.09204471, 1.432133, 1, 0, 0.4745098, 1,
1.449898, -1.424649, 4.026215, 1, 0, 0.4666667, 1,
1.451591, -0.07626344, 1.404983, 1, 0, 0.4627451, 1,
1.467569, -0.4590279, 2.834633, 1, 0, 0.454902, 1,
1.475826, 0.9791073, -0.4332045, 1, 0, 0.4509804, 1,
1.47662, -0.8067371, 1.634708, 1, 0, 0.4431373, 1,
1.481243, 1.797036, 1.850371, 1, 0, 0.4392157, 1,
1.482238, 0.0931332, 1.375199, 1, 0, 0.4313726, 1,
1.486342, -1.446826, 3.002541, 1, 0, 0.427451, 1,
1.487127, -0.03724319, 1.378023, 1, 0, 0.4196078, 1,
1.499419, -0.0774524, 2.601101, 1, 0, 0.4156863, 1,
1.509302, 1.110254, -0.1847269, 1, 0, 0.4078431, 1,
1.511912, -2.276409, 2.556906, 1, 0, 0.4039216, 1,
1.514816, -0.3721982, 1.309917, 1, 0, 0.3960784, 1,
1.529247, 1.580342, 1.187838, 1, 0, 0.3882353, 1,
1.533456, 0.7833686, 1.978987, 1, 0, 0.3843137, 1,
1.535451, -0.8507483, 1.919753, 1, 0, 0.3764706, 1,
1.53849, 0.06791787, 2.816314, 1, 0, 0.372549, 1,
1.54162, -0.03656842, 1.857109, 1, 0, 0.3647059, 1,
1.547117, -1.683848, 0.8999705, 1, 0, 0.3607843, 1,
1.548453, 0.302068, 2.782557, 1, 0, 0.3529412, 1,
1.555924, -0.02912378, 1.512746, 1, 0, 0.3490196, 1,
1.556193, -0.2262483, 1.95939, 1, 0, 0.3411765, 1,
1.563893, -0.8230588, 1.972838, 1, 0, 0.3372549, 1,
1.58751, 0.1526923, 1.197926, 1, 0, 0.3294118, 1,
1.604184, -0.9663056, 4.30682, 1, 0, 0.3254902, 1,
1.6073, -2.085326, 3.48909, 1, 0, 0.3176471, 1,
1.62012, 0.5941041, 0.2268534, 1, 0, 0.3137255, 1,
1.631892, -2.282009, 2.165055, 1, 0, 0.3058824, 1,
1.636005, -0.4880989, 0.9400079, 1, 0, 0.2980392, 1,
1.642398, 0.6051488, -0.6721267, 1, 0, 0.2941177, 1,
1.646159, -1.030849, 1.147907, 1, 0, 0.2862745, 1,
1.64908, 0.1159293, -0.5870463, 1, 0, 0.282353, 1,
1.653493, -0.00681161, 1.186582, 1, 0, 0.2745098, 1,
1.662287, 3.256402, 1.165781, 1, 0, 0.2705882, 1,
1.672011, 0.7598617, 0.9148026, 1, 0, 0.2627451, 1,
1.694914, 1.444109, 0.7589506, 1, 0, 0.2588235, 1,
1.72572, -1.590768, 4.189932, 1, 0, 0.2509804, 1,
1.736886, 1.012173, 1.244444, 1, 0, 0.2470588, 1,
1.740941, 0.2480289, 1.682546, 1, 0, 0.2392157, 1,
1.7703, -1.093919, 0.2354179, 1, 0, 0.2352941, 1,
1.792611, -0.4101875, 2.66982, 1, 0, 0.227451, 1,
1.831461, -1.124148, 2.196539, 1, 0, 0.2235294, 1,
1.845546, 1.088251, 1.953347, 1, 0, 0.2156863, 1,
1.846664, -0.02233172, -0.4394315, 1, 0, 0.2117647, 1,
1.858893, 0.781496, 0.4865732, 1, 0, 0.2039216, 1,
1.86282, -0.4048305, 1.536069, 1, 0, 0.1960784, 1,
1.877584, -0.9130976, 2.730211, 1, 0, 0.1921569, 1,
1.880297, -0.1441605, 1.3232, 1, 0, 0.1843137, 1,
1.922936, -1.230956, 3.385437, 1, 0, 0.1803922, 1,
1.933971, 0.9585209, 0.5700513, 1, 0, 0.172549, 1,
1.941708, 2.31718, -0.451942, 1, 0, 0.1686275, 1,
1.95419, -0.2544556, 1.697815, 1, 0, 0.1607843, 1,
1.971804, -0.8119465, 1.836508, 1, 0, 0.1568628, 1,
1.975864, 0.3482654, 3.656832, 1, 0, 0.1490196, 1,
1.97588, -0.5221489, -0.480852, 1, 0, 0.145098, 1,
1.989915, 1.058549, 1.994247, 1, 0, 0.1372549, 1,
2.04048, 0.1581533, 3.084995, 1, 0, 0.1333333, 1,
2.040823, 1.205347, 1.491665, 1, 0, 0.1254902, 1,
2.050414, -0.1179131, 0.930855, 1, 0, 0.1215686, 1,
2.077728, 0.2045108, 0.8911674, 1, 0, 0.1137255, 1,
2.087945, 0.1969997, 2.5987, 1, 0, 0.1098039, 1,
2.088547, -1.919639, 2.782736, 1, 0, 0.1019608, 1,
2.11561, -0.7867776, 2.298182, 1, 0, 0.09411765, 1,
2.123086, 0.6859798, 0.1821134, 1, 0, 0.09019608, 1,
2.170846, -0.05177195, 3.197639, 1, 0, 0.08235294, 1,
2.17398, 0.262935, 1.398636, 1, 0, 0.07843138, 1,
2.216744, 0.951718, 0.6212816, 1, 0, 0.07058824, 1,
2.24463, 0.5097534, 1.780262, 1, 0, 0.06666667, 1,
2.258684, 1.320266, -0.05635719, 1, 0, 0.05882353, 1,
2.265818, 0.5235386, 3.382716, 1, 0, 0.05490196, 1,
2.307981, -0.09651808, 1.891967, 1, 0, 0.04705882, 1,
2.309128, -1.047319, 3.027625, 1, 0, 0.04313726, 1,
2.329836, 1.454621, 0.9647911, 1, 0, 0.03529412, 1,
2.506622, 0.09118867, 2.672858, 1, 0, 0.03137255, 1,
2.516812, 0.8120853, 1.76786, 1, 0, 0.02352941, 1,
2.673149, 0.5099518, 1.261455, 1, 0, 0.01960784, 1,
2.989011, -1.985774, 1.190075, 1, 0, 0.01176471, 1,
3.035162, -0.9667283, 0.8579897, 1, 0, 0.007843138, 1
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
-0.1729463, -3.914946, -7.208349, 0, -0.5, 0.5, 0.5,
-0.1729463, -3.914946, -7.208349, 1, -0.5, 0.5, 0.5,
-0.1729463, -3.914946, -7.208349, 1, 1.5, 0.5, 0.5,
-0.1729463, -3.914946, -7.208349, 0, 1.5, 0.5, 0.5
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
-4.468603, 0.1904128, -7.208349, 0, -0.5, 0.5, 0.5,
-4.468603, 0.1904128, -7.208349, 1, -0.5, 0.5, 0.5,
-4.468603, 0.1904128, -7.208349, 1, 1.5, 0.5, 0.5,
-4.468603, 0.1904128, -7.208349, 0, 1.5, 0.5, 0.5
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
-4.468603, -3.914946, 0.1695716, 0, -0.5, 0.5, 0.5,
-4.468603, -3.914946, 0.1695716, 1, -0.5, 0.5, 0.5,
-4.468603, -3.914946, 0.1695716, 1, 1.5, 0.5, 0.5,
-4.468603, -3.914946, 0.1695716, 0, 1.5, 0.5, 0.5
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
-3, -2.967556, -5.505752,
3, -2.967556, -5.505752,
-3, -2.967556, -5.505752,
-3, -3.125454, -5.789518,
-2, -2.967556, -5.505752,
-2, -3.125454, -5.789518,
-1, -2.967556, -5.505752,
-1, -3.125454, -5.789518,
0, -2.967556, -5.505752,
0, -3.125454, -5.789518,
1, -2.967556, -5.505752,
1, -3.125454, -5.789518,
2, -2.967556, -5.505752,
2, -3.125454, -5.789518,
3, -2.967556, -5.505752,
3, -3.125454, -5.789518
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
-3, -3.441251, -6.35705, 0, -0.5, 0.5, 0.5,
-3, -3.441251, -6.35705, 1, -0.5, 0.5, 0.5,
-3, -3.441251, -6.35705, 1, 1.5, 0.5, 0.5,
-3, -3.441251, -6.35705, 0, 1.5, 0.5, 0.5,
-2, -3.441251, -6.35705, 0, -0.5, 0.5, 0.5,
-2, -3.441251, -6.35705, 1, -0.5, 0.5, 0.5,
-2, -3.441251, -6.35705, 1, 1.5, 0.5, 0.5,
-2, -3.441251, -6.35705, 0, 1.5, 0.5, 0.5,
-1, -3.441251, -6.35705, 0, -0.5, 0.5, 0.5,
-1, -3.441251, -6.35705, 1, -0.5, 0.5, 0.5,
-1, -3.441251, -6.35705, 1, 1.5, 0.5, 0.5,
-1, -3.441251, -6.35705, 0, 1.5, 0.5, 0.5,
0, -3.441251, -6.35705, 0, -0.5, 0.5, 0.5,
0, -3.441251, -6.35705, 1, -0.5, 0.5, 0.5,
0, -3.441251, -6.35705, 1, 1.5, 0.5, 0.5,
0, -3.441251, -6.35705, 0, 1.5, 0.5, 0.5,
1, -3.441251, -6.35705, 0, -0.5, 0.5, 0.5,
1, -3.441251, -6.35705, 1, -0.5, 0.5, 0.5,
1, -3.441251, -6.35705, 1, 1.5, 0.5, 0.5,
1, -3.441251, -6.35705, 0, 1.5, 0.5, 0.5,
2, -3.441251, -6.35705, 0, -0.5, 0.5, 0.5,
2, -3.441251, -6.35705, 1, -0.5, 0.5, 0.5,
2, -3.441251, -6.35705, 1, 1.5, 0.5, 0.5,
2, -3.441251, -6.35705, 0, 1.5, 0.5, 0.5,
3, -3.441251, -6.35705, 0, -0.5, 0.5, 0.5,
3, -3.441251, -6.35705, 1, -0.5, 0.5, 0.5,
3, -3.441251, -6.35705, 1, 1.5, 0.5, 0.5,
3, -3.441251, -6.35705, 0, 1.5, 0.5, 0.5
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
-3.477298, -2, -5.505752,
-3.477298, 3, -5.505752,
-3.477298, -2, -5.505752,
-3.642515, -2, -5.789518,
-3.477298, -1, -5.505752,
-3.642515, -1, -5.789518,
-3.477298, 0, -5.505752,
-3.642515, 0, -5.789518,
-3.477298, 1, -5.505752,
-3.642515, 1, -5.789518,
-3.477298, 2, -5.505752,
-3.642515, 2, -5.789518,
-3.477298, 3, -5.505752,
-3.642515, 3, -5.789518
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
-3.972951, -2, -6.35705, 0, -0.5, 0.5, 0.5,
-3.972951, -2, -6.35705, 1, -0.5, 0.5, 0.5,
-3.972951, -2, -6.35705, 1, 1.5, 0.5, 0.5,
-3.972951, -2, -6.35705, 0, 1.5, 0.5, 0.5,
-3.972951, -1, -6.35705, 0, -0.5, 0.5, 0.5,
-3.972951, -1, -6.35705, 1, -0.5, 0.5, 0.5,
-3.972951, -1, -6.35705, 1, 1.5, 0.5, 0.5,
-3.972951, -1, -6.35705, 0, 1.5, 0.5, 0.5,
-3.972951, 0, -6.35705, 0, -0.5, 0.5, 0.5,
-3.972951, 0, -6.35705, 1, -0.5, 0.5, 0.5,
-3.972951, 0, -6.35705, 1, 1.5, 0.5, 0.5,
-3.972951, 0, -6.35705, 0, 1.5, 0.5, 0.5,
-3.972951, 1, -6.35705, 0, -0.5, 0.5, 0.5,
-3.972951, 1, -6.35705, 1, -0.5, 0.5, 0.5,
-3.972951, 1, -6.35705, 1, 1.5, 0.5, 0.5,
-3.972951, 1, -6.35705, 0, 1.5, 0.5, 0.5,
-3.972951, 2, -6.35705, 0, -0.5, 0.5, 0.5,
-3.972951, 2, -6.35705, 1, -0.5, 0.5, 0.5,
-3.972951, 2, -6.35705, 1, 1.5, 0.5, 0.5,
-3.972951, 2, -6.35705, 0, 1.5, 0.5, 0.5,
-3.972951, 3, -6.35705, 0, -0.5, 0.5, 0.5,
-3.972951, 3, -6.35705, 1, -0.5, 0.5, 0.5,
-3.972951, 3, -6.35705, 1, 1.5, 0.5, 0.5,
-3.972951, 3, -6.35705, 0, 1.5, 0.5, 0.5
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
-3.477298, -2.967556, -4,
-3.477298, -2.967556, 4,
-3.477298, -2.967556, -4,
-3.642515, -3.125454, -4,
-3.477298, -2.967556, -2,
-3.642515, -3.125454, -2,
-3.477298, -2.967556, 0,
-3.642515, -3.125454, 0,
-3.477298, -2.967556, 2,
-3.642515, -3.125454, 2,
-3.477298, -2.967556, 4,
-3.642515, -3.125454, 4
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
-3.972951, -3.441251, -4, 0, -0.5, 0.5, 0.5,
-3.972951, -3.441251, -4, 1, -0.5, 0.5, 0.5,
-3.972951, -3.441251, -4, 1, 1.5, 0.5, 0.5,
-3.972951, -3.441251, -4, 0, 1.5, 0.5, 0.5,
-3.972951, -3.441251, -2, 0, -0.5, 0.5, 0.5,
-3.972951, -3.441251, -2, 1, -0.5, 0.5, 0.5,
-3.972951, -3.441251, -2, 1, 1.5, 0.5, 0.5,
-3.972951, -3.441251, -2, 0, 1.5, 0.5, 0.5,
-3.972951, -3.441251, 0, 0, -0.5, 0.5, 0.5,
-3.972951, -3.441251, 0, 1, -0.5, 0.5, 0.5,
-3.972951, -3.441251, 0, 1, 1.5, 0.5, 0.5,
-3.972951, -3.441251, 0, 0, 1.5, 0.5, 0.5,
-3.972951, -3.441251, 2, 0, -0.5, 0.5, 0.5,
-3.972951, -3.441251, 2, 1, -0.5, 0.5, 0.5,
-3.972951, -3.441251, 2, 1, 1.5, 0.5, 0.5,
-3.972951, -3.441251, 2, 0, 1.5, 0.5, 0.5,
-3.972951, -3.441251, 4, 0, -0.5, 0.5, 0.5,
-3.972951, -3.441251, 4, 1, -0.5, 0.5, 0.5,
-3.972951, -3.441251, 4, 1, 1.5, 0.5, 0.5,
-3.972951, -3.441251, 4, 0, 1.5, 0.5, 0.5
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
-3.477298, -2.967556, -5.505752,
-3.477298, 3.348381, -5.505752,
-3.477298, -2.967556, 5.844895,
-3.477298, 3.348381, 5.844895,
-3.477298, -2.967556, -5.505752,
-3.477298, -2.967556, 5.844895,
-3.477298, 3.348381, -5.505752,
-3.477298, 3.348381, 5.844895,
-3.477298, -2.967556, -5.505752,
3.131405, -2.967556, -5.505752,
-3.477298, -2.967556, 5.844895,
3.131405, -2.967556, 5.844895,
-3.477298, 3.348381, -5.505752,
3.131405, 3.348381, -5.505752,
-3.477298, 3.348381, 5.844895,
3.131405, 3.348381, 5.844895,
3.131405, -2.967556, -5.505752,
3.131405, 3.348381, -5.505752,
3.131405, -2.967556, 5.844895,
3.131405, 3.348381, 5.844895,
3.131405, -2.967556, -5.505752,
3.131405, -2.967556, 5.844895,
3.131405, 3.348381, -5.505752,
3.131405, 3.348381, 5.844895
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
var radius = 7.782265;
var distance = 34.62418;
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
mvMatrix.translate( 0.1729463, -0.1904128, -0.1695716 );
mvMatrix.scale( 1.273221, 1.332239, 0.741309 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.62418);
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
furmecyclox<-read.table("furmecyclox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-furmecyclox$V2
```

```
## Error in eval(expr, envir, enclos): object 'furmecyclox' not found
```

```r
y<-furmecyclox$V3
```

```
## Error in eval(expr, envir, enclos): object 'furmecyclox' not found
```

```r
z<-furmecyclox$V4
```

```
## Error in eval(expr, envir, enclos): object 'furmecyclox' not found
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
-3.381055, -1.100166, -1.169828, 0, 0, 1, 1, 1,
-2.965691, -1.074443, -0.5860798, 1, 0, 0, 1, 1,
-2.774347, 0.02960828, -3.799816, 1, 0, 0, 1, 1,
-2.599871, -0.2342694, -0.9537653, 1, 0, 0, 1, 1,
-2.579123, -0.152506, -0.1531481, 1, 0, 0, 1, 1,
-2.548766, 1.600587, 0.655731, 1, 0, 0, 1, 1,
-2.382809, -2.196387, -1.5811, 0, 0, 0, 1, 1,
-2.355072, -0.4749862, -1.8158, 0, 0, 0, 1, 1,
-2.314686, -0.1430881, -1.181535, 0, 0, 0, 1, 1,
-2.269212, -0.3689659, -1.154971, 0, 0, 0, 1, 1,
-2.261044, -0.3986862, -2.622242, 0, 0, 0, 1, 1,
-2.240291, 1.265365, -0.9955645, 0, 0, 0, 1, 1,
-2.230002, -0.2351666, -1.604382, 0, 0, 0, 1, 1,
-2.20584, -0.9826511, -1.294009, 1, 1, 1, 1, 1,
-2.037139, 0.4038129, -1.370282, 1, 1, 1, 1, 1,
-2.028388, 0.7115296, -0.4101065, 1, 1, 1, 1, 1,
-1.975687, 1.260258, -1.165148, 1, 1, 1, 1, 1,
-1.968524, 1.11461, -0.07678039, 1, 1, 1, 1, 1,
-1.965495, -0.8170149, -2.331472, 1, 1, 1, 1, 1,
-1.951876, -0.1127213, -1.073153, 1, 1, 1, 1, 1,
-1.9253, 0.7476979, -0.5455852, 1, 1, 1, 1, 1,
-1.924438, -0.6129704, -1.49213, 1, 1, 1, 1, 1,
-1.90766, -0.3626087, -2.214051, 1, 1, 1, 1, 1,
-1.893543, -0.3835347, -1.443246, 1, 1, 1, 1, 1,
-1.875018, 2.055682, 0.3019211, 1, 1, 1, 1, 1,
-1.865454, -0.161829, -1.21457, 1, 1, 1, 1, 1,
-1.858903, -0.3564465, 0.2150238, 1, 1, 1, 1, 1,
-1.857341, -1.156456, -2.313054, 1, 1, 1, 1, 1,
-1.836461, 0.2522725, -1.732591, 0, 0, 1, 1, 1,
-1.810654, -1.418963, -2.000052, 1, 0, 0, 1, 1,
-1.803069, 0.242095, -1.332876, 1, 0, 0, 1, 1,
-1.796748, 0.2851084, -2.31426, 1, 0, 0, 1, 1,
-1.796246, -0.2801881, -2.420467, 1, 0, 0, 1, 1,
-1.785798, 0.01675848, -3.172334, 1, 0, 0, 1, 1,
-1.767639, 0.3758651, -1.033401, 0, 0, 0, 1, 1,
-1.730554, -0.6283239, -2.053818, 0, 0, 0, 1, 1,
-1.728665, 0.2137187, -2.495725, 0, 0, 0, 1, 1,
-1.717179, -0.2215828, -2.257107, 0, 0, 0, 1, 1,
-1.714921, -0.3491419, -3.197353, 0, 0, 0, 1, 1,
-1.697756, -0.7305728, -1.667568, 0, 0, 0, 1, 1,
-1.694766, -1.411982, -2.598521, 0, 0, 0, 1, 1,
-1.694427, -0.6693893, -1.563863, 1, 1, 1, 1, 1,
-1.685607, -1.159389, -1.2222, 1, 1, 1, 1, 1,
-1.673674, 1.074671, -1.495891, 1, 1, 1, 1, 1,
-1.664157, -0.2928401, -1.084714, 1, 1, 1, 1, 1,
-1.655069, 0.271993, -1.323799, 1, 1, 1, 1, 1,
-1.637014, -1.377347, -3.265877, 1, 1, 1, 1, 1,
-1.636488, 0.7486382, 0.3228981, 1, 1, 1, 1, 1,
-1.628209, -1.422315, -3.306126, 1, 1, 1, 1, 1,
-1.61967, -0.06607351, -0.04682868, 1, 1, 1, 1, 1,
-1.612785, -0.1456363, -1.251268, 1, 1, 1, 1, 1,
-1.595191, 0.1977303, -2.18283, 1, 1, 1, 1, 1,
-1.584539, -0.5477818, -0.2126455, 1, 1, 1, 1, 1,
-1.576435, 1.759433, -1.125036, 1, 1, 1, 1, 1,
-1.570556, -1.45629, -2.855312, 1, 1, 1, 1, 1,
-1.542859, -0.8888205, -2.207975, 1, 1, 1, 1, 1,
-1.537899, -0.6314662, -0.7501773, 0, 0, 1, 1, 1,
-1.535528, 0.4034159, -1.62806, 1, 0, 0, 1, 1,
-1.534544, -2.441926, -3.824156, 1, 0, 0, 1, 1,
-1.525377, 0.3973678, 1.869954, 1, 0, 0, 1, 1,
-1.522565, -0.8271102, -3.365957, 1, 0, 0, 1, 1,
-1.507844, -0.2223978, -2.669012, 1, 0, 0, 1, 1,
-1.507515, 1.28583, -0.3136185, 0, 0, 0, 1, 1,
-1.506214, -1.871917, -1.784061, 0, 0, 0, 1, 1,
-1.497393, 0.854991, -1.628586, 0, 0, 0, 1, 1,
-1.483282, -0.1969901, -2.22705, 0, 0, 0, 1, 1,
-1.478121, -0.4140999, -1.196726, 0, 0, 0, 1, 1,
-1.477109, 0.4442801, -1.380757, 0, 0, 0, 1, 1,
-1.464838, 0.0650334, -2.967791, 0, 0, 0, 1, 1,
-1.457853, -0.7724368, -2.978828, 1, 1, 1, 1, 1,
-1.457131, -0.6244511, -1.421969, 1, 1, 1, 1, 1,
-1.449779, 0.03578615, -1.732759, 1, 1, 1, 1, 1,
-1.441768, 0.3997692, -0.5248188, 1, 1, 1, 1, 1,
-1.441435, -0.7750087, -4.151901, 1, 1, 1, 1, 1,
-1.425345, 0.8609434, -0.9100465, 1, 1, 1, 1, 1,
-1.409458, 1.504275, -1.06564, 1, 1, 1, 1, 1,
-1.39072, 1.414741, -0.7826951, 1, 1, 1, 1, 1,
-1.3792, -1.002424, -3.638151, 1, 1, 1, 1, 1,
-1.371902, 1.551842, -0.6917043, 1, 1, 1, 1, 1,
-1.367325, 0.5285402, -2.932466, 1, 1, 1, 1, 1,
-1.356353, -0.8133393, -2.754825, 1, 1, 1, 1, 1,
-1.350291, -0.3938333, -0.512744, 1, 1, 1, 1, 1,
-1.344431, 0.8577462, -2.445545, 1, 1, 1, 1, 1,
-1.33891, -0.2585768, -0.4608817, 1, 1, 1, 1, 1,
-1.327029, -0.5505354, -2.352299, 0, 0, 1, 1, 1,
-1.325946, 0.369783, 0.161571, 1, 0, 0, 1, 1,
-1.325688, -0.6886524, -3.071702, 1, 0, 0, 1, 1,
-1.319216, -1.358029, -0.9598875, 1, 0, 0, 1, 1,
-1.318074, 1.519648, 0.09871989, 1, 0, 0, 1, 1,
-1.309275, -0.6068717, -1.075746, 1, 0, 0, 1, 1,
-1.306062, 0.9327551, -2.865067, 0, 0, 0, 1, 1,
-1.302361, 1.863398, -1.816015, 0, 0, 0, 1, 1,
-1.300798, -0.6881701, -3.390528, 0, 0, 0, 1, 1,
-1.300636, -1.202305, -2.061546, 0, 0, 0, 1, 1,
-1.296003, 1.205198, -0.34521, 0, 0, 0, 1, 1,
-1.289189, 0.8604997, -0.892599, 0, 0, 0, 1, 1,
-1.283212, 2.197597, 0.05178004, 0, 0, 0, 1, 1,
-1.280499, 0.3612523, -1.048312, 1, 1, 1, 1, 1,
-1.28021, 0.0235005, -2.017184, 1, 1, 1, 1, 1,
-1.261479, -0.2784906, -1.544564, 1, 1, 1, 1, 1,
-1.260758, 0.09051704, -2.588937, 1, 1, 1, 1, 1,
-1.229347, -0.06078114, -3.160943, 1, 1, 1, 1, 1,
-1.225527, 0.5121239, 1.151137, 1, 1, 1, 1, 1,
-1.2239, -0.6594682, -2.562506, 1, 1, 1, 1, 1,
-1.223559, 0.8702193, -1.252798, 1, 1, 1, 1, 1,
-1.221038, 0.3751383, -0.1805478, 1, 1, 1, 1, 1,
-1.212466, 0.3502662, -0.8492776, 1, 1, 1, 1, 1,
-1.210403, -0.2720144, -1.244746, 1, 1, 1, 1, 1,
-1.208057, -0.5326946, -1.380626, 1, 1, 1, 1, 1,
-1.207422, -0.9573747, -3.237538, 1, 1, 1, 1, 1,
-1.196785, 0.110076, -2.625834, 1, 1, 1, 1, 1,
-1.19179, 0.6930212, -0.0238171, 1, 1, 1, 1, 1,
-1.189987, -0.698806, -2.933265, 0, 0, 1, 1, 1,
-1.183729, -0.9767501, -3.363788, 1, 0, 0, 1, 1,
-1.176794, -2.022465, -4.063626, 1, 0, 0, 1, 1,
-1.173974, 0.5826, -0.8615344, 1, 0, 0, 1, 1,
-1.14282, 0.1914629, -0.777007, 1, 0, 0, 1, 1,
-1.135592, -1.423195, -2.112901, 1, 0, 0, 1, 1,
-1.131263, -0.9558692, -0.1183199, 0, 0, 0, 1, 1,
-1.129514, 0.3487754, -1.691016, 0, 0, 0, 1, 1,
-1.127258, -0.06228995, -0.5859943, 0, 0, 0, 1, 1,
-1.120663, -0.6947123, -2.166014, 0, 0, 0, 1, 1,
-1.103125, -1.667479, -2.288584, 0, 0, 0, 1, 1,
-1.101437, 2.085882, 0.08453063, 0, 0, 0, 1, 1,
-1.099802, -2.133565, -3.366127, 0, 0, 0, 1, 1,
-1.0976, 2.8657, -0.8391815, 1, 1, 1, 1, 1,
-1.094301, -1.765558, -3.273354, 1, 1, 1, 1, 1,
-1.091123, -0.3240879, -3.856192, 1, 1, 1, 1, 1,
-1.090214, -0.3261274, -1.61217, 1, 1, 1, 1, 1,
-1.086537, 0.6658056, -1.350829, 1, 1, 1, 1, 1,
-1.077474, 0.2991475, -1.763243, 1, 1, 1, 1, 1,
-1.075112, -1.26468, -4.502642, 1, 1, 1, 1, 1,
-1.072785, 0.471951, -1.655193, 1, 1, 1, 1, 1,
-1.071312, 1.118519, -2.227958, 1, 1, 1, 1, 1,
-1.06152, 0.3935173, -1.489864, 1, 1, 1, 1, 1,
-1.056652, -0.04282375, -1.830392, 1, 1, 1, 1, 1,
-1.054827, -0.2243999, -2.456548, 1, 1, 1, 1, 1,
-1.054749, 1.327324, -1.429636, 1, 1, 1, 1, 1,
-1.050161, 0.8166102, -0.8722885, 1, 1, 1, 1, 1,
-1.04892, 0.3923845, -2.496861, 1, 1, 1, 1, 1,
-1.044979, 0.6469039, -2.974176, 0, 0, 1, 1, 1,
-1.039925, 0.269444, -1.299676, 1, 0, 0, 1, 1,
-1.03717, 1.382844, -0.5592666, 1, 0, 0, 1, 1,
-1.027426, -0.008932658, -2.016708, 1, 0, 0, 1, 1,
-1.025898, 1.027896, -1.221528, 1, 0, 0, 1, 1,
-1.019985, 0.2967932, -2.161298, 1, 0, 0, 1, 1,
-1.011009, 0.4336076, -0.03771149, 0, 0, 0, 1, 1,
-1.010041, -1.607441, -3.523889, 0, 0, 0, 1, 1,
-1.009867, 1.366652, -0.7069505, 0, 0, 0, 1, 1,
-1.009253, -1.656273, -1.00323, 0, 0, 0, 1, 1,
-0.9897971, -0.4989054, -1.723016, 0, 0, 0, 1, 1,
-0.9881901, 0.7810373, -0.4456916, 0, 0, 0, 1, 1,
-0.9879405, 1.416755, 0.1047718, 0, 0, 0, 1, 1,
-0.98758, 2.464033, -1.871394, 1, 1, 1, 1, 1,
-0.9814198, 0.3457697, -0.5394642, 1, 1, 1, 1, 1,
-0.9686121, -0.1166858, -0.5136955, 1, 1, 1, 1, 1,
-0.9675146, -0.04722507, -2.457477, 1, 1, 1, 1, 1,
-0.9644341, -1.256667, -3.926752, 1, 1, 1, 1, 1,
-0.9627036, -0.4704208, -1.502753, 1, 1, 1, 1, 1,
-0.9594399, 1.310674, -2.022861, 1, 1, 1, 1, 1,
-0.9524133, -0.7691452, -3.563473, 1, 1, 1, 1, 1,
-0.9442855, -0.3042642, -2.240402, 1, 1, 1, 1, 1,
-0.9432327, -1.461097, -4.019872, 1, 1, 1, 1, 1,
-0.9387226, 1.664804, -1.971854, 1, 1, 1, 1, 1,
-0.9365925, 0.06529219, -2.650359, 1, 1, 1, 1, 1,
-0.9245462, -0.7023919, -2.844516, 1, 1, 1, 1, 1,
-0.9229745, 0.1199515, -2.160796, 1, 1, 1, 1, 1,
-0.9177265, 0.05565903, 0.6197897, 1, 1, 1, 1, 1,
-0.9176611, -0.05027442, -2.979604, 0, 0, 1, 1, 1,
-0.9176277, -0.1486624, -1.688277, 1, 0, 0, 1, 1,
-0.9159976, -1.154805, -1.130422, 1, 0, 0, 1, 1,
-0.9132076, 1.665415, 0.1074876, 1, 0, 0, 1, 1,
-0.9130147, 0.7548905, -0.2638393, 1, 0, 0, 1, 1,
-0.9112766, 0.7172549, -1.504662, 1, 0, 0, 1, 1,
-0.9086157, -0.02282722, -1.557534, 0, 0, 0, 1, 1,
-0.8999238, -0.4837658, -3.344222, 0, 0, 0, 1, 1,
-0.8916884, 0.48897, 0.5851897, 0, 0, 0, 1, 1,
-0.8899508, -0.1926864, -0.8637785, 0, 0, 0, 1, 1,
-0.8860949, -0.6044629, -2.165272, 0, 0, 0, 1, 1,
-0.8855133, 0.6507692, 0.1007616, 0, 0, 0, 1, 1,
-0.8847198, 1.234634, 0.9208405, 0, 0, 0, 1, 1,
-0.8843183, 2.282996, -0.3060425, 1, 1, 1, 1, 1,
-0.8833705, -0.1995252, -1.967537, 1, 1, 1, 1, 1,
-0.8818706, 0.953704, 0.7137879, 1, 1, 1, 1, 1,
-0.8780409, -0.5339393, -3.064116, 1, 1, 1, 1, 1,
-0.8746336, -0.07181662, -1.547496, 1, 1, 1, 1, 1,
-0.8725834, -1.259942, -2.792447, 1, 1, 1, 1, 1,
-0.8716986, 1.01007, -0.6935211, 1, 1, 1, 1, 1,
-0.8697085, -0.311152, -2.575489, 1, 1, 1, 1, 1,
-0.8651746, -1.479609, -3.291087, 1, 1, 1, 1, 1,
-0.8637922, -0.9203883, -3.086222, 1, 1, 1, 1, 1,
-0.8557347, 0.05004024, -1.398016, 1, 1, 1, 1, 1,
-0.8532307, 1.164817, -2.699636, 1, 1, 1, 1, 1,
-0.8516585, 0.3652556, -0.5261118, 1, 1, 1, 1, 1,
-0.8467631, -0.2697703, -2.02824, 1, 1, 1, 1, 1,
-0.84153, 2.228858, -0.6580374, 1, 1, 1, 1, 1,
-0.8370472, -0.8273109, -2.003025, 0, 0, 1, 1, 1,
-0.8368255, -0.2787491, -2.43868, 1, 0, 0, 1, 1,
-0.8314637, 1.513217, -2.363507, 1, 0, 0, 1, 1,
-0.8302354, 0.5227605, 0.2749001, 1, 0, 0, 1, 1,
-0.8261366, 1.404992, -0.5988915, 1, 0, 0, 1, 1,
-0.8220488, 0.09327058, -0.1414858, 1, 0, 0, 1, 1,
-0.8129246, -1.220843, -1.774602, 0, 0, 0, 1, 1,
-0.8105222, -1.281125, -0.4746284, 0, 0, 0, 1, 1,
-0.8084238, 0.09951384, -1.969945, 0, 0, 0, 1, 1,
-0.8071154, 0.5178663, -1.263032, 0, 0, 0, 1, 1,
-0.8059385, -0.3279938, -3.205771, 0, 0, 0, 1, 1,
-0.8057745, 0.5349407, -1.331085, 0, 0, 0, 1, 1,
-0.8055192, 1.548204, -0.3803393, 0, 0, 0, 1, 1,
-0.796735, 0.6376912, -1.525295, 1, 1, 1, 1, 1,
-0.7923577, 0.2800419, -1.824008, 1, 1, 1, 1, 1,
-0.791824, -1.633682, -0.7938808, 1, 1, 1, 1, 1,
-0.7880428, 0.4278361, -1.45156, 1, 1, 1, 1, 1,
-0.7880062, -0.2536328, -2.44613, 1, 1, 1, 1, 1,
-0.7876531, 0.6912313, -1.522487, 1, 1, 1, 1, 1,
-0.784658, 1.386068, 0.168845, 1, 1, 1, 1, 1,
-0.7839705, 0.5601441, -2.578483, 1, 1, 1, 1, 1,
-0.7829024, -0.1165935, -1.333288, 1, 1, 1, 1, 1,
-0.7757174, -0.08144306, -2.402045, 1, 1, 1, 1, 1,
-0.7753276, 0.3415716, -2.667931, 1, 1, 1, 1, 1,
-0.7737172, 1.403529, 0.3742004, 1, 1, 1, 1, 1,
-0.7724739, 1.35961, -0.6047347, 1, 1, 1, 1, 1,
-0.7708915, -0.0154524, -1.656821, 1, 1, 1, 1, 1,
-0.7685219, 0.630644, -1.638811, 1, 1, 1, 1, 1,
-0.7648189, 0.7634189, -0.6525749, 0, 0, 1, 1, 1,
-0.7638968, 0.7573034, -0.7655413, 1, 0, 0, 1, 1,
-0.7595712, -0.454928, -0.976365, 1, 0, 0, 1, 1,
-0.7534406, 0.9084102, 0.1534393, 1, 0, 0, 1, 1,
-0.7514651, -1.890509, -4.05829, 1, 0, 0, 1, 1,
-0.7501028, -1.893228, -3.371438, 1, 0, 0, 1, 1,
-0.7485307, 0.3948136, 0.002989837, 0, 0, 0, 1, 1,
-0.7479718, -0.5490463, -1.842763, 0, 0, 0, 1, 1,
-0.7469802, 0.009532323, -0.9963557, 0, 0, 0, 1, 1,
-0.7452798, -0.7649682, -3.006254, 0, 0, 0, 1, 1,
-0.7444663, -1.180485, -3.869862, 0, 0, 0, 1, 1,
-0.7435771, 0.6762844, -1.079755, 0, 0, 0, 1, 1,
-0.7422779, -0.9988402, -2.962285, 0, 0, 0, 1, 1,
-0.7419086, -0.1796492, -2.289137, 1, 1, 1, 1, 1,
-0.74073, 1.153661, -0.9634217, 1, 1, 1, 1, 1,
-0.7256896, 0.8043166, -1.351859, 1, 1, 1, 1, 1,
-0.724686, -0.02979625, -1.795261, 1, 1, 1, 1, 1,
-0.7239229, 0.01131415, -1.146197, 1, 1, 1, 1, 1,
-0.7197918, 0.02892197, -2.19076, 1, 1, 1, 1, 1,
-0.7179399, -1.049101, -1.309611, 1, 1, 1, 1, 1,
-0.7177328, -0.1618537, -1.362088, 1, 1, 1, 1, 1,
-0.7177151, 1.74066, -0.5164439, 1, 1, 1, 1, 1,
-0.715161, -0.6425369, -1.305801, 1, 1, 1, 1, 1,
-0.7136363, -0.9674546, -2.946675, 1, 1, 1, 1, 1,
-0.7133164, -0.2264324, -3.050148, 1, 1, 1, 1, 1,
-0.7049258, -1.279771, -3.419893, 1, 1, 1, 1, 1,
-0.6897914, -1.363385, -1.828732, 1, 1, 1, 1, 1,
-0.6792703, -0.8988004, -1.178703, 1, 1, 1, 1, 1,
-0.6781459, 1.051629, -0.4654212, 0, 0, 1, 1, 1,
-0.6779662, -0.5116608, -2.075727, 1, 0, 0, 1, 1,
-0.6715243, 1.565889, -1.167932, 1, 0, 0, 1, 1,
-0.6713932, -2.098816, -2.593349, 1, 0, 0, 1, 1,
-0.6700128, 0.4404705, -1.769708, 1, 0, 0, 1, 1,
-0.6697257, 0.08979741, -0.6022018, 1, 0, 0, 1, 1,
-0.6660798, 0.7169282, -0.4167635, 0, 0, 0, 1, 1,
-0.6658004, -0.275132, 0.03895607, 0, 0, 0, 1, 1,
-0.6622959, -0.5827307, -3.897031, 0, 0, 0, 1, 1,
-0.6593291, 0.2629526, -1.615367, 0, 0, 0, 1, 1,
-0.6587847, 2.354323, -0.5327878, 0, 0, 0, 1, 1,
-0.6577665, -0.0001256096, -2.836251, 0, 0, 0, 1, 1,
-0.6524889, 1.057497, -0.9547654, 0, 0, 0, 1, 1,
-0.6523759, 0.1459651, -1.758151, 1, 1, 1, 1, 1,
-0.6475673, -0.9688897, -1.660854, 1, 1, 1, 1, 1,
-0.6456444, 0.6481748, 0.07939922, 1, 1, 1, 1, 1,
-0.643294, 0.758646, 1.48803, 1, 1, 1, 1, 1,
-0.6413578, -0.2515218, -2.918163, 1, 1, 1, 1, 1,
-0.6339455, 1.779206, 0.8675949, 1, 1, 1, 1, 1,
-0.6275268, 0.2973681, -1.867013, 1, 1, 1, 1, 1,
-0.6226299, 0.5364128, -1.78037, 1, 1, 1, 1, 1,
-0.6214538, -1.761298, -2.759075, 1, 1, 1, 1, 1,
-0.6205125, 0.6643666, -0.08320982, 1, 1, 1, 1, 1,
-0.6203758, 0.0498617, -1.038653, 1, 1, 1, 1, 1,
-0.6163164, 0.204798, -1.456253, 1, 1, 1, 1, 1,
-0.6162732, 2.308604, 0.7021962, 1, 1, 1, 1, 1,
-0.6126976, 1.619756, -0.01415284, 1, 1, 1, 1, 1,
-0.6103495, -1.153137, -2.909665, 1, 1, 1, 1, 1,
-0.6091712, 1.624863, -0.5090111, 0, 0, 1, 1, 1,
-0.6076155, 0.8712428, -1.088172, 1, 0, 0, 1, 1,
-0.6035162, 0.5688601, 0.1888401, 1, 0, 0, 1, 1,
-0.6031749, -0.2720416, -1.547578, 1, 0, 0, 1, 1,
-0.6024256, 1.077623, -0.5942693, 1, 0, 0, 1, 1,
-0.6017846, 0.5693728, -0.2779447, 1, 0, 0, 1, 1,
-0.6000674, -0.6468188, -2.114931, 0, 0, 0, 1, 1,
-0.5989656, 0.6563751, -0.8002502, 0, 0, 0, 1, 1,
-0.5981779, -0.6111414, -1.416417, 0, 0, 0, 1, 1,
-0.5929909, -0.4879749, -0.2632362, 0, 0, 0, 1, 1,
-0.5916041, -1.036005, -2.223984, 0, 0, 0, 1, 1,
-0.5914156, 0.04868766, -1.294758, 0, 0, 0, 1, 1,
-0.5877288, -1.330692, -2.561317, 0, 0, 0, 1, 1,
-0.5834373, -0.4620643, -4.291846, 1, 1, 1, 1, 1,
-0.5823565, 2.302912, -0.03242255, 1, 1, 1, 1, 1,
-0.5808322, -1.264299, -2.180418, 1, 1, 1, 1, 1,
-0.5742167, 2.142928, -1.622006, 1, 1, 1, 1, 1,
-0.5722139, 0.7901028, -0.0722091, 1, 1, 1, 1, 1,
-0.5685446, 1.359671, 0.5539532, 1, 1, 1, 1, 1,
-0.5641072, 0.3587112, -1.058657, 1, 1, 1, 1, 1,
-0.5464308, 0.6829916, -0.8299677, 1, 1, 1, 1, 1,
-0.539026, -0.1598338, -2.486482, 1, 1, 1, 1, 1,
-0.5378719, 1.680026, 0.02095825, 1, 1, 1, 1, 1,
-0.5234361, -0.04059403, -1.406424, 1, 1, 1, 1, 1,
-0.5230764, 1.646055, -0.329235, 1, 1, 1, 1, 1,
-0.5177203, 0.03660932, -1.342337, 1, 1, 1, 1, 1,
-0.5152473, -0.9724901, -2.610362, 1, 1, 1, 1, 1,
-0.5134737, -0.6965254, -2.712461, 1, 1, 1, 1, 1,
-0.511678, -1.228884, -2.393694, 0, 0, 1, 1, 1,
-0.5060586, 0.8010421, -0.008673327, 1, 0, 0, 1, 1,
-0.504904, -0.03300334, -1.835858, 1, 0, 0, 1, 1,
-0.4984398, 0.3605243, -0.3948153, 1, 0, 0, 1, 1,
-0.4982545, 0.8262638, -2.65326, 1, 0, 0, 1, 1,
-0.4952328, -0.2693149, -2.76982, 1, 0, 0, 1, 1,
-0.4909483, -0.09464248, 0.7758972, 0, 0, 0, 1, 1,
-0.4875977, -0.02754305, -1.859571, 0, 0, 0, 1, 1,
-0.4874576, -0.5277768, -3.608433, 0, 0, 0, 1, 1,
-0.48736, 0.651958, 0.1900803, 0, 0, 0, 1, 1,
-0.4869202, -1.368829, -2.098115, 0, 0, 0, 1, 1,
-0.486618, 0.08037294, -2.136326, 0, 0, 0, 1, 1,
-0.4801379, -0.02837729, -2.772449, 0, 0, 0, 1, 1,
-0.4786732, 2.41156, 0.1220418, 1, 1, 1, 1, 1,
-0.47003, 1.767556, 0.9226607, 1, 1, 1, 1, 1,
-0.4695264, -0.5904242, -1.849352, 1, 1, 1, 1, 1,
-0.4635328, 0.01142976, -2.253191, 1, 1, 1, 1, 1,
-0.4633153, 1.218069, -0.793397, 1, 1, 1, 1, 1,
-0.4597276, 0.4306952, 0.2572023, 1, 1, 1, 1, 1,
-0.4592616, -1.572485, -2.986331, 1, 1, 1, 1, 1,
-0.457287, -0.8389146, -0.5647554, 1, 1, 1, 1, 1,
-0.4570569, -1.685578, -3.802594, 1, 1, 1, 1, 1,
-0.4551531, -0.7953495, -2.961526, 1, 1, 1, 1, 1,
-0.4526172, 0.7895176, -1.666616, 1, 1, 1, 1, 1,
-0.4500114, 0.5660783, -0.4301697, 1, 1, 1, 1, 1,
-0.4447595, 0.1518985, -0.7282016, 1, 1, 1, 1, 1,
-0.4422252, 0.4264162, 1.029537, 1, 1, 1, 1, 1,
-0.4386185, 0.2261896, -0.4863632, 1, 1, 1, 1, 1,
-0.4380567, 0.6435685, -2.318966, 0, 0, 1, 1, 1,
-0.4323392, -0.08658724, -1.096338, 1, 0, 0, 1, 1,
-0.4307437, 0.3447204, -2.079612, 1, 0, 0, 1, 1,
-0.4305647, 0.7587451, -0.973626, 1, 0, 0, 1, 1,
-0.4284652, -0.3085179, -2.828011, 1, 0, 0, 1, 1,
-0.4244337, -0.625541, -3.159179, 1, 0, 0, 1, 1,
-0.424273, 0.3447269, 1.007853, 0, 0, 0, 1, 1,
-0.4020442, 0.9268776, -1.528666, 0, 0, 0, 1, 1,
-0.3925451, 1.222578, -1.165604, 0, 0, 0, 1, 1,
-0.3920355, -1.258326, -1.23067, 0, 0, 0, 1, 1,
-0.3918489, -0.9981239, -2.455399, 0, 0, 0, 1, 1,
-0.3901765, -1.341019, -2.603735, 0, 0, 0, 1, 1,
-0.388726, -1.152665, -1.514502, 0, 0, 0, 1, 1,
-0.3868153, 0.8778878, 0.1011645, 1, 1, 1, 1, 1,
-0.3812685, 1.238998, -0.85603, 1, 1, 1, 1, 1,
-0.3797514, 0.5117847, -0.879275, 1, 1, 1, 1, 1,
-0.3793943, -1.55802, -2.650638, 1, 1, 1, 1, 1,
-0.3790219, 0.62479, -1.725744, 1, 1, 1, 1, 1,
-0.3765869, 1.186085, -0.8627172, 1, 1, 1, 1, 1,
-0.3751256, 0.3507665, -1.025385, 1, 1, 1, 1, 1,
-0.3749556, 0.1701245, -2.190697, 1, 1, 1, 1, 1,
-0.3680985, -1.160416, -3.737308, 1, 1, 1, 1, 1,
-0.3676166, -0.05305147, -1.727535, 1, 1, 1, 1, 1,
-0.3672402, 2.565741, -1.163403, 1, 1, 1, 1, 1,
-0.3632577, -1.124394, -3.092167, 1, 1, 1, 1, 1,
-0.3602959, -0.1359805, -2.823498, 1, 1, 1, 1, 1,
-0.3599271, 1.080928, 1.600411, 1, 1, 1, 1, 1,
-0.3551569, -1.258715, -4.526826, 1, 1, 1, 1, 1,
-0.3517879, 0.7569718, -1.449291, 0, 0, 1, 1, 1,
-0.3489733, 1.47262, 0.4258308, 1, 0, 0, 1, 1,
-0.3396925, 0.3565104, -1.274279, 1, 0, 0, 1, 1,
-0.3262265, 1.205121, -0.4128292, 1, 0, 0, 1, 1,
-0.3256545, -0.3966476, -2.471371, 1, 0, 0, 1, 1,
-0.3247014, -0.7959182, -2.24829, 1, 0, 0, 1, 1,
-0.3227559, -0.2213496, -1.995613, 0, 0, 0, 1, 1,
-0.3217195, -0.6453025, -1.77335, 0, 0, 0, 1, 1,
-0.319803, 0.5153453, 1.263969, 0, 0, 0, 1, 1,
-0.3142406, -1.024153, -2.910053, 0, 0, 0, 1, 1,
-0.3052678, -0.8451326, -2.477337, 0, 0, 0, 1, 1,
-0.302792, 0.1221007, -0.191976, 0, 0, 0, 1, 1,
-0.2935147, -1.231551, -1.41525, 0, 0, 0, 1, 1,
-0.2918838, -0.3274298, -4.049728, 1, 1, 1, 1, 1,
-0.290648, -1.163502, -3.248797, 1, 1, 1, 1, 1,
-0.2904604, -0.6974082, -3.887268, 1, 1, 1, 1, 1,
-0.2888011, -0.535206, -3.735603, 1, 1, 1, 1, 1,
-0.2884786, -0.4015741, -2.736328, 1, 1, 1, 1, 1,
-0.2840222, 1.801733, -0.5515397, 1, 1, 1, 1, 1,
-0.2837575, 1.093925, 0.9470439, 1, 1, 1, 1, 1,
-0.2828116, -0.09245285, -2.256093, 1, 1, 1, 1, 1,
-0.2706597, -0.3187919, -1.994438, 1, 1, 1, 1, 1,
-0.2679082, -0.3645511, -3.82466, 1, 1, 1, 1, 1,
-0.2674268, -1.931035, -3.846817, 1, 1, 1, 1, 1,
-0.267086, 0.1160974, -1.442041, 1, 1, 1, 1, 1,
-0.2631955, 0.03435176, -1.543396, 1, 1, 1, 1, 1,
-0.2602106, -0.01603668, -0.9204978, 1, 1, 1, 1, 1,
-0.2553711, 0.6407412, -1.65542, 1, 1, 1, 1, 1,
-0.2546962, 1.669796, -0.2703275, 0, 0, 1, 1, 1,
-0.2507198, 0.14304, -1.590837, 1, 0, 0, 1, 1,
-0.2497744, 1.617737, -1.918936, 1, 0, 0, 1, 1,
-0.2437528, -0.4564598, -3.633236, 1, 0, 0, 1, 1,
-0.2429241, -0.8566753, -1.569796, 1, 0, 0, 1, 1,
-0.2417278, -0.2760708, -3.065424, 1, 0, 0, 1, 1,
-0.2399484, 0.2998444, -0.3071455, 0, 0, 0, 1, 1,
-0.2387341, 0.2075358, -0.3304732, 0, 0, 0, 1, 1,
-0.2381285, -1.840768, -2.121639, 0, 0, 0, 1, 1,
-0.2366839, 0.1723106, -1.985658, 0, 0, 0, 1, 1,
-0.2365793, -1.662393, -3.954457, 0, 0, 0, 1, 1,
-0.2331946, 0.5925941, -0.8231376, 0, 0, 0, 1, 1,
-0.2290215, 1.023696, -1.250666, 0, 0, 0, 1, 1,
-0.2250045, -1.203538, -5.340451, 1, 1, 1, 1, 1,
-0.2249268, -0.4863416, -3.830598, 1, 1, 1, 1, 1,
-0.2198589, 0.8896508, -2.426743, 1, 1, 1, 1, 1,
-0.2185618, -1.500456, -2.867502, 1, 1, 1, 1, 1,
-0.2173768, 0.8614891, -1.431902, 1, 1, 1, 1, 1,
-0.216686, -0.8676522, -3.770198, 1, 1, 1, 1, 1,
-0.2145185, 1.173372, -0.5919815, 1, 1, 1, 1, 1,
-0.2119542, 0.9065117, 0.0500054, 1, 1, 1, 1, 1,
-0.2098028, -0.02102122, -0.6834574, 1, 1, 1, 1, 1,
-0.208917, -1.332089, -2.85359, 1, 1, 1, 1, 1,
-0.2043321, 0.9132883, 0.4776246, 1, 1, 1, 1, 1,
-0.2015187, -0.9112487, -4.372596, 1, 1, 1, 1, 1,
-0.2005689, 0.1986664, -1.478875, 1, 1, 1, 1, 1,
-0.2001306, 2.233395, -0.6866584, 1, 1, 1, 1, 1,
-0.1971025, -0.3469677, -2.986708, 1, 1, 1, 1, 1,
-0.1958597, 0.07091089, -3.80515, 0, 0, 1, 1, 1,
-0.1941568, -0.3086939, -2.233501, 1, 0, 0, 1, 1,
-0.1939407, 1.1417, 0.8309634, 1, 0, 0, 1, 1,
-0.1921755, -0.06890284, -1.513014, 1, 0, 0, 1, 1,
-0.1883308, -0.8875905, -2.254207, 1, 0, 0, 1, 1,
-0.1834227, -0.4088454, -4.050395, 1, 0, 0, 1, 1,
-0.1764811, -2.200542, -3.566537, 0, 0, 0, 1, 1,
-0.1759753, 0.08899449, -1.132134, 0, 0, 0, 1, 1,
-0.1743859, -0.341552, -0.8534355, 0, 0, 0, 1, 1,
-0.1711693, -0.9588074, -3.119457, 0, 0, 0, 1, 1,
-0.1703933, -1.088213, -2.410851, 0, 0, 0, 1, 1,
-0.1699313, -0.3914533, -3.290731, 0, 0, 0, 1, 1,
-0.1689723, 1.08646, -0.9869485, 0, 0, 0, 1, 1,
-0.1686079, 0.3095887, -1.396788, 1, 1, 1, 1, 1,
-0.1633325, -0.06154748, -4.23431, 1, 1, 1, 1, 1,
-0.1625588, -0.6170353, -2.75538, 1, 1, 1, 1, 1,
-0.1618878, 1.138488, 0.4578968, 1, 1, 1, 1, 1,
-0.1616459, -1.058493, -4.196899, 1, 1, 1, 1, 1,
-0.1611982, -1.962922, -4.044128, 1, 1, 1, 1, 1,
-0.1606673, -0.6765229, -5.102605, 1, 1, 1, 1, 1,
-0.159943, 0.6005449, -1.279227, 1, 1, 1, 1, 1,
-0.1593815, 0.2728601, 0.6762178, 1, 1, 1, 1, 1,
-0.1538747, -0.7748207, -1.377249, 1, 1, 1, 1, 1,
-0.1531793, -0.1740962, -3.932853, 1, 1, 1, 1, 1,
-0.1500334, 0.5523145, 0.1304686, 1, 1, 1, 1, 1,
-0.1481476, -0.522902, -3.666191, 1, 1, 1, 1, 1,
-0.1431093, -0.1569469, -2.404369, 1, 1, 1, 1, 1,
-0.1430154, -0.1557489, -3.508531, 1, 1, 1, 1, 1,
-0.1429125, -0.07015783, -2.683557, 0, 0, 1, 1, 1,
-0.1402944, 0.4756413, -1.236958, 1, 0, 0, 1, 1,
-0.1397023, 1.177222, 0.1556768, 1, 0, 0, 1, 1,
-0.139435, -0.570052, -1.777675, 1, 0, 0, 1, 1,
-0.1322551, -0.7146948, -3.843696, 1, 0, 0, 1, 1,
-0.1311837, -0.7824807, -3.957729, 1, 0, 0, 1, 1,
-0.1303104, -0.3958552, -2.457976, 0, 0, 0, 1, 1,
-0.1291356, 0.5528846, -1.528776, 0, 0, 0, 1, 1,
-0.1289459, 0.4575531, -0.4048728, 0, 0, 0, 1, 1,
-0.1279754, -1.281561, -2.854558, 0, 0, 0, 1, 1,
-0.1273889, -0.803028, -2.364755, 0, 0, 0, 1, 1,
-0.1273841, -0.6413855, -2.736435, 0, 0, 0, 1, 1,
-0.122797, -1.725134, -1.984335, 0, 0, 0, 1, 1,
-0.1178736, 0.5175186, -1.777938, 1, 1, 1, 1, 1,
-0.1177354, -0.5502519, -2.84608, 1, 1, 1, 1, 1,
-0.1159949, 0.8425944, -0.8494639, 1, 1, 1, 1, 1,
-0.1127426, -1.395916, -3.851209, 1, 1, 1, 1, 1,
-0.1054349, -0.3537154, -2.142189, 1, 1, 1, 1, 1,
-0.09840389, 0.4762371, 0.9709517, 1, 1, 1, 1, 1,
-0.09724161, -1.070888, -3.144159, 1, 1, 1, 1, 1,
-0.09588684, -0.05128719, -2.559486, 1, 1, 1, 1, 1,
-0.0927833, -0.480834, -1.119462, 1, 1, 1, 1, 1,
-0.08952562, -1.707065, -3.121198, 1, 1, 1, 1, 1,
-0.08928333, -1.367634, -2.204874, 1, 1, 1, 1, 1,
-0.08914094, 0.4441779, -0.4241925, 1, 1, 1, 1, 1,
-0.08912034, 1.887284, 0.2006804, 1, 1, 1, 1, 1,
-0.08140841, 0.8899809, 0.04763857, 1, 1, 1, 1, 1,
-0.07657139, 0.2976804, -0.8563506, 1, 1, 1, 1, 1,
-0.07513208, -0.06290017, -0.8866908, 0, 0, 1, 1, 1,
-0.0724227, -0.7488129, -3.979241, 1, 0, 0, 1, 1,
-0.07005515, 1.026336, 0.8142745, 1, 0, 0, 1, 1,
-0.05781812, 0.7669291, -1.071543, 1, 0, 0, 1, 1,
-0.05604154, 1.64588, -0.5109901, 1, 0, 0, 1, 1,
-0.05316576, 1.741948, -0.4888848, 1, 0, 0, 1, 1,
-0.05218011, -0.6070205, -2.778922, 0, 0, 0, 1, 1,
-0.04904792, 0.073105, -0.8813758, 0, 0, 0, 1, 1,
-0.04547147, 0.3986405, -0.9623522, 0, 0, 0, 1, 1,
-0.03924015, 0.5174385, -1.483837, 0, 0, 0, 1, 1,
-0.03884768, -0.2184088, -2.326449, 0, 0, 0, 1, 1,
-0.03445781, 1.912597, 1.87154, 0, 0, 0, 1, 1,
-0.03277329, -0.3202322, -3.269668, 0, 0, 0, 1, 1,
-0.03259029, -1.463024, -2.656189, 1, 1, 1, 1, 1,
-0.03089726, -0.4872742, -4.218159, 1, 1, 1, 1, 1,
-0.02456487, -1.384392, -1.683891, 1, 1, 1, 1, 1,
-0.02453733, 1.272509, -0.7608951, 1, 1, 1, 1, 1,
-0.01650769, 0.5521967, 0.7890363, 1, 1, 1, 1, 1,
-0.0156201, -0.02262075, -2.042845, 1, 1, 1, 1, 1,
-0.01460479, -2.125877, -4.654055, 1, 1, 1, 1, 1,
-0.01384273, -0.1574923, -1.871781, 1, 1, 1, 1, 1,
-0.01290847, 2.615286, -1.046145, 1, 1, 1, 1, 1,
-0.01268084, -1.891189, -4.537864, 1, 1, 1, 1, 1,
-0.01039342, -0.4452767, -4.318959, 1, 1, 1, 1, 1,
-0.01031982, -1.111618, -2.744348, 1, 1, 1, 1, 1,
-0.009777684, 1.620844, -0.4091998, 1, 1, 1, 1, 1,
-0.006749775, 0.1360392, 0.8163985, 1, 1, 1, 1, 1,
-0.006241968, 1.27088, 1.308288, 1, 1, 1, 1, 1,
-0.003319961, 1.727666, -0.0783496, 0, 0, 1, 1, 1,
-0.0007500858, 1.408774, 0.09409627, 1, 0, 0, 1, 1,
0.003285916, -0.756538, 4.405044, 1, 0, 0, 1, 1,
0.01125295, 0.2310895, -0.3445213, 1, 0, 0, 1, 1,
0.01529183, -0.1030338, 2.144535, 1, 0, 0, 1, 1,
0.01687994, 0.5935642, -0.1408911, 1, 0, 0, 1, 1,
0.01902848, -1.076493, 3.386117, 0, 0, 0, 1, 1,
0.02794211, -0.3191736, 2.344732, 0, 0, 0, 1, 1,
0.03293028, 0.7207253, 1.081132, 0, 0, 0, 1, 1,
0.03333903, 0.8452687, -0.448662, 0, 0, 0, 1, 1,
0.0354679, 0.7559384, -1.279937, 0, 0, 0, 1, 1,
0.03614074, -1.198963, 5.679595, 0, 0, 0, 1, 1,
0.03759524, -0.822647, 2.112872, 0, 0, 0, 1, 1,
0.03938014, 0.02322782, 1.067806, 1, 1, 1, 1, 1,
0.04556537, 0.9638819, 1.04098, 1, 1, 1, 1, 1,
0.04727745, -0.6468927, 2.544191, 1, 1, 1, 1, 1,
0.04773479, -2.606704, 1.204332, 1, 1, 1, 1, 1,
0.04929477, 1.172459, -0.4648737, 1, 1, 1, 1, 1,
0.05003118, -0.7204981, 2.139006, 1, 1, 1, 1, 1,
0.05146187, -0.1177253, 2.031801, 1, 1, 1, 1, 1,
0.05388548, 0.7110444, 1.407136, 1, 1, 1, 1, 1,
0.05609609, -0.4833622, 1.926073, 1, 1, 1, 1, 1,
0.05788479, -0.3662218, 3.545388, 1, 1, 1, 1, 1,
0.06156933, 1.038142, 0.7674158, 1, 1, 1, 1, 1,
0.06298438, -2.227587, 5.418514, 1, 1, 1, 1, 1,
0.06496757, 2.27419, -0.3935862, 1, 1, 1, 1, 1,
0.06597863, -0.8924744, 4.29966, 1, 1, 1, 1, 1,
0.06878679, 0.6895292, 0.02134514, 1, 1, 1, 1, 1,
0.07031791, 0.06322806, 1.65225, 0, 0, 1, 1, 1,
0.0724891, 1.301798, -0.6333985, 1, 0, 0, 1, 1,
0.07252604, 1.298911, -0.7426391, 1, 0, 0, 1, 1,
0.08082468, 0.97232, -0.3792681, 1, 0, 0, 1, 1,
0.08278998, 0.7169794, 0.2705681, 1, 0, 0, 1, 1,
0.08329168, 0.06436849, 0.5333675, 1, 0, 0, 1, 1,
0.08521661, -2.694846, 4.604272, 0, 0, 0, 1, 1,
0.08917338, -1.386845, 3.67412, 0, 0, 0, 1, 1,
0.09260181, -0.9044864, 3.453436, 0, 0, 0, 1, 1,
0.09356925, 1.359381, -0.1423026, 0, 0, 0, 1, 1,
0.09409516, 1.033676, 0.2220184, 0, 0, 0, 1, 1,
0.09477303, -2.565264, 2.670844, 0, 0, 0, 1, 1,
0.09488315, -1.660617, 1.311152, 0, 0, 0, 1, 1,
0.09716599, -1.334593, 3.056047, 1, 1, 1, 1, 1,
0.09823674, -0.2700261, 0.8089525, 1, 1, 1, 1, 1,
0.1002638, -0.4959826, 1.716712, 1, 1, 1, 1, 1,
0.1023221, 1.300321, -1.724314, 1, 1, 1, 1, 1,
0.1101339, 0.9965, -0.2640769, 1, 1, 1, 1, 1,
0.1124865, -0.5865707, 3.585434, 1, 1, 1, 1, 1,
0.1128273, 0.4969309, 0.09797575, 1, 1, 1, 1, 1,
0.1162648, 0.7237391, 0.8342052, 1, 1, 1, 1, 1,
0.1164252, -0.3027595, 4.473566, 1, 1, 1, 1, 1,
0.1220731, -0.7609635, 2.49979, 1, 1, 1, 1, 1,
0.1248823, 0.1347906, -0.05620513, 1, 1, 1, 1, 1,
0.1253921, -2.298109, 5.377696, 1, 1, 1, 1, 1,
0.1281693, 0.7026251, -0.1020971, 1, 1, 1, 1, 1,
0.1287529, 0.7975302, -0.432038, 1, 1, 1, 1, 1,
0.1297052, -0.1981826, 3.130467, 1, 1, 1, 1, 1,
0.1331396, 0.0295556, 0.2511524, 0, 0, 1, 1, 1,
0.1386251, 1.051589, 0.1738491, 1, 0, 0, 1, 1,
0.1409322, 0.4795431, 0.7655708, 1, 0, 0, 1, 1,
0.146054, -1.631323, 3.67436, 1, 0, 0, 1, 1,
0.1474543, -0.3427388, 2.833669, 1, 0, 0, 1, 1,
0.1492517, -2.875576, 1.884858, 1, 0, 0, 1, 1,
0.1571543, -0.7906829, 3.056974, 0, 0, 0, 1, 1,
0.1590531, -1.627017, 3.208335, 0, 0, 0, 1, 1,
0.1591637, -0.6969317, 4.218801, 0, 0, 0, 1, 1,
0.1594737, -0.7575666, 2.742363, 0, 0, 0, 1, 1,
0.1616858, 2.387321, 0.9769041, 0, 0, 0, 1, 1,
0.1650729, 1.600013, -0.2060923, 0, 0, 0, 1, 1,
0.1663795, -0.8523803, 2.504843, 0, 0, 0, 1, 1,
0.1668593, 0.6301487, 1.098912, 1, 1, 1, 1, 1,
0.1681364, -1.617714, 3.875916, 1, 1, 1, 1, 1,
0.1705827, 0.5095962, 1.039457, 1, 1, 1, 1, 1,
0.1733199, -0.5752432, 2.711182, 1, 1, 1, 1, 1,
0.173488, -0.689549, 4.793694, 1, 1, 1, 1, 1,
0.1756728, -0.8907087, 2.418228, 1, 1, 1, 1, 1,
0.1776184, 1.431747, -2.054172, 1, 1, 1, 1, 1,
0.1786581, -0.009759363, 2.967243, 1, 1, 1, 1, 1,
0.1840541, -0.650212, 2.385709, 1, 1, 1, 1, 1,
0.184273, 0.7189512, 0.5814735, 1, 1, 1, 1, 1,
0.1850124, 0.238445, 1.401385, 1, 1, 1, 1, 1,
0.1873048, -1.123736, 1.840479, 1, 1, 1, 1, 1,
0.1877465, 0.9496989, 1.331438, 1, 1, 1, 1, 1,
0.1905266, 1.005108, 0.9150446, 1, 1, 1, 1, 1,
0.1934494, 3.034861, -0.4290962, 1, 1, 1, 1, 1,
0.1937139, -0.265252, 3.590039, 0, 0, 1, 1, 1,
0.1959985, -0.0657174, 5.00041, 1, 0, 0, 1, 1,
0.2027201, 0.6812177, -0.9317927, 1, 0, 0, 1, 1,
0.2084393, -1.833204, 3.208534, 1, 0, 0, 1, 1,
0.2089846, 1.492131, 0.3171007, 1, 0, 0, 1, 1,
0.2135941, -0.6165405, 3.852529, 1, 0, 0, 1, 1,
0.2147824, 0.08019713, 1.034507, 0, 0, 0, 1, 1,
0.2150847, 1.151428, -1.331735, 0, 0, 0, 1, 1,
0.2212984, 1.151944, -0.411393, 0, 0, 0, 1, 1,
0.223478, -2.719893, 3.619481, 0, 0, 0, 1, 1,
0.2246268, -0.5166805, 2.994133, 0, 0, 0, 1, 1,
0.2261769, -2.678332, 3.300771, 0, 0, 0, 1, 1,
0.2280963, 1.518003, -0.4571691, 0, 0, 0, 1, 1,
0.2322341, -1.393328, 2.150397, 1, 1, 1, 1, 1,
0.2325341, 0.5959688, 0.1632686, 1, 1, 1, 1, 1,
0.2493798, -0.6902642, 2.18229, 1, 1, 1, 1, 1,
0.2513219, 1.109275, -1.53675, 1, 1, 1, 1, 1,
0.2541631, 0.8806357, 1.200959, 1, 1, 1, 1, 1,
0.2545477, -1.180179, 3.219256, 1, 1, 1, 1, 1,
0.2551943, -1.122787, 2.115656, 1, 1, 1, 1, 1,
0.2580353, 0.660271, 0.6667372, 1, 1, 1, 1, 1,
0.2596898, 0.9271256, 0.2736757, 1, 1, 1, 1, 1,
0.2604541, -0.2569164, 2.333594, 1, 1, 1, 1, 1,
0.2653756, 0.2506475, 0.811107, 1, 1, 1, 1, 1,
0.2667081, -0.05944418, 1.057859, 1, 1, 1, 1, 1,
0.2720226, -0.2554612, 1.392434, 1, 1, 1, 1, 1,
0.2720604, 0.01808925, 2.848586, 1, 1, 1, 1, 1,
0.274231, -0.3614506, 3.683944, 1, 1, 1, 1, 1,
0.2761333, -0.1996935, 3.231939, 0, 0, 1, 1, 1,
0.2764044, -0.5291652, 4.519824, 1, 0, 0, 1, 1,
0.2794502, 0.002518269, 0.5024877, 1, 0, 0, 1, 1,
0.2804005, 0.0845632, 2.224952, 1, 0, 0, 1, 1,
0.284242, -0.439038, 0.7484861, 1, 0, 0, 1, 1,
0.2903674, -1.057808, 3.357357, 1, 0, 0, 1, 1,
0.2909215, -1.138482, 3.165701, 0, 0, 0, 1, 1,
0.3011229, 1.194021, -0.3964334, 0, 0, 0, 1, 1,
0.3035075, 0.5660031, 1.709797, 0, 0, 0, 1, 1,
0.3036475, -0.4576395, 1.308592, 0, 0, 0, 1, 1,
0.31172, -0.2921367, 0.5848956, 0, 0, 0, 1, 1,
0.3203456, 0.2301409, 0.1014311, 0, 0, 0, 1, 1,
0.3206468, -0.1009551, 2.323184, 0, 0, 0, 1, 1,
0.3223206, -0.2535075, 3.468966, 1, 1, 1, 1, 1,
0.3251814, -0.2516538, 0.9198829, 1, 1, 1, 1, 1,
0.327123, -1.178497, 2.802454, 1, 1, 1, 1, 1,
0.3377154, -1.305006, 4.815316, 1, 1, 1, 1, 1,
0.3431364, -1.232309, 1.457787, 1, 1, 1, 1, 1,
0.3485681, 0.668898, -0.09543855, 1, 1, 1, 1, 1,
0.3488343, 0.08548851, 1.128665, 1, 1, 1, 1, 1,
0.3517409, 0.9660751, 0.8347379, 1, 1, 1, 1, 1,
0.354562, 1.589382, 0.08797983, 1, 1, 1, 1, 1,
0.3585993, 1.457136, -1.312984, 1, 1, 1, 1, 1,
0.3589815, 2.06951, -1.340011, 1, 1, 1, 1, 1,
0.363362, -0.2335744, 3.000656, 1, 1, 1, 1, 1,
0.3640792, 0.4795932, 1.221915, 1, 1, 1, 1, 1,
0.3685444, -0.07808895, 2.371812, 1, 1, 1, 1, 1,
0.3686469, 0.06256022, -2.165742, 1, 1, 1, 1, 1,
0.376786, -0.2852804, -0.1366232, 0, 0, 1, 1, 1,
0.3775479, 0.3398855, 2.301532, 1, 0, 0, 1, 1,
0.3794723, -0.2413285, 0.03988707, 1, 0, 0, 1, 1,
0.3822904, 0.01995421, 1.007164, 1, 0, 0, 1, 1,
0.3892047, -0.01131696, 0.1345341, 1, 0, 0, 1, 1,
0.3969548, 0.7437305, -0.01971703, 1, 0, 0, 1, 1,
0.3977455, -0.8212413, 3.732969, 0, 0, 0, 1, 1,
0.3982846, 0.09057562, 1.444388, 0, 0, 0, 1, 1,
0.3986388, 0.4733905, -0.06307442, 0, 0, 0, 1, 1,
0.3994893, 1.33813, 0.8617097, 0, 0, 0, 1, 1,
0.4021344, 0.8424057, -1.146684, 0, 0, 0, 1, 1,
0.403437, -0.1735224, 3.673822, 0, 0, 0, 1, 1,
0.405094, 0.7491118, 0.760568, 0, 0, 0, 1, 1,
0.4061025, -0.1606364, 1.198898, 1, 1, 1, 1, 1,
0.4077631, 1.738853, -0.9791088, 1, 1, 1, 1, 1,
0.4090748, -2.239591, 3.158193, 1, 1, 1, 1, 1,
0.412362, -0.2282489, 3.507452, 1, 1, 1, 1, 1,
0.4225245, -0.4540891, 2.577916, 1, 1, 1, 1, 1,
0.4274111, 1.098438, 0.6941958, 1, 1, 1, 1, 1,
0.4277181, 0.6888251, 0.7629047, 1, 1, 1, 1, 1,
0.4323719, 0.5303599, -0.8094528, 1, 1, 1, 1, 1,
0.4340951, -1.398298, 2.184925, 1, 1, 1, 1, 1,
0.4349369, 0.03849764, 0.2268713, 1, 1, 1, 1, 1,
0.4351744, -0.683174, 2.493978, 1, 1, 1, 1, 1,
0.4374648, 0.1427586, 1.602767, 1, 1, 1, 1, 1,
0.4430545, 0.3398229, 1.706845, 1, 1, 1, 1, 1,
0.4452712, 0.6323451, 0.2285283, 1, 1, 1, 1, 1,
0.4452847, -0.6407498, 4.030268, 1, 1, 1, 1, 1,
0.44792, -0.9134896, 3.460176, 0, 0, 1, 1, 1,
0.4577884, 1.277397, -0.3920459, 1, 0, 0, 1, 1,
0.4592425, 1.419654, -1.875416, 1, 0, 0, 1, 1,
0.4606366, 0.1308485, 2.895779, 1, 0, 0, 1, 1,
0.463672, 0.9924001, -1.488051, 1, 0, 0, 1, 1,
0.4666613, 0.8181687, 0.2267226, 1, 0, 0, 1, 1,
0.4736651, -0.4379887, 2.914347, 0, 0, 0, 1, 1,
0.4795226, -0.1845339, 2.193259, 0, 0, 0, 1, 1,
0.4796042, -0.8715178, 3.637982, 0, 0, 0, 1, 1,
0.4836784, -1.792304, 2.167371, 0, 0, 0, 1, 1,
0.4840345, 0.8078028, 0.2213068, 0, 0, 0, 1, 1,
0.484383, -1.028013, 2.971895, 0, 0, 0, 1, 1,
0.4862638, -2.325364, 2.183897, 0, 0, 0, 1, 1,
0.4864111, -1.185743, 2.731894, 1, 1, 1, 1, 1,
0.4888676, 0.4994214, -0.5492011, 1, 1, 1, 1, 1,
0.49336, -0.7341008, 3.658066, 1, 1, 1, 1, 1,
0.4989329, 0.4719132, -0.1840685, 1, 1, 1, 1, 1,
0.4989951, 0.2449539, 2.905935, 1, 1, 1, 1, 1,
0.5036585, -1.902049, 2.344534, 1, 1, 1, 1, 1,
0.5042353, 0.93485, 2.388719, 1, 1, 1, 1, 1,
0.5072219, -0.6341895, 1.401368, 1, 1, 1, 1, 1,
0.5114219, 0.3601396, -0.1495401, 1, 1, 1, 1, 1,
0.5133994, -0.1627332, -0.2428785, 1, 1, 1, 1, 1,
0.5144829, -0.5662794, -0.207308, 1, 1, 1, 1, 1,
0.5156735, 0.11524, -0.1792146, 1, 1, 1, 1, 1,
0.526466, 1.580266, -0.8006181, 1, 1, 1, 1, 1,
0.5352213, 0.2236517, 1.181538, 1, 1, 1, 1, 1,
0.5458319, -0.7058615, 2.429821, 1, 1, 1, 1, 1,
0.546376, 0.5520416, 1.510592, 0, 0, 1, 1, 1,
0.5480942, -1.528449, 1.657827, 1, 0, 0, 1, 1,
0.5487793, 0.3900339, 0.9326901, 1, 0, 0, 1, 1,
0.5598721, -0.9948324, 3.63771, 1, 0, 0, 1, 1,
0.5613934, -0.9061605, 1.284759, 1, 0, 0, 1, 1,
0.5629864, 0.1177177, 0.7486813, 1, 0, 0, 1, 1,
0.563119, -1.018675, 5.224919, 0, 0, 0, 1, 1,
0.563417, -1.715724, 4.431969, 0, 0, 0, 1, 1,
0.5640973, -0.7649216, 2.625581, 0, 0, 0, 1, 1,
0.5643536, -0.2836097, 2.177115, 0, 0, 0, 1, 1,
0.5685251, -1.411824, 1.540453, 0, 0, 0, 1, 1,
0.5735233, -0.3639033, 2.561669, 0, 0, 0, 1, 1,
0.5751048, -0.1427621, 1.157581, 0, 0, 0, 1, 1,
0.5795577, 0.5709737, 1.389267, 1, 1, 1, 1, 1,
0.5834322, 0.07318038, 3.706555, 1, 1, 1, 1, 1,
0.5876957, -1.727902, 4.57202, 1, 1, 1, 1, 1,
0.5931855, -0.2985121, 0.6640028, 1, 1, 1, 1, 1,
0.594896, 1.020484, -0.4373956, 1, 1, 1, 1, 1,
0.5979186, 0.6047758, 1.14787, 1, 1, 1, 1, 1,
0.5988455, 1.740371, 1.399707, 1, 1, 1, 1, 1,
0.6032338, 0.3729837, 0.2834572, 1, 1, 1, 1, 1,
0.6092104, -1.157554, 1.826787, 1, 1, 1, 1, 1,
0.6102918, 0.7969673, 0.5072175, 1, 1, 1, 1, 1,
0.6107615, -0.05188433, 1.712798, 1, 1, 1, 1, 1,
0.6130351, 0.1428144, 2.385523, 1, 1, 1, 1, 1,
0.6142814, 1.688812, 1.227362, 1, 1, 1, 1, 1,
0.6153854, -1.109686, 1.559057, 1, 1, 1, 1, 1,
0.619311, 0.7886493, 0.376389, 1, 1, 1, 1, 1,
0.6247357, -0.1364926, 2.058024, 0, 0, 1, 1, 1,
0.6280433, -1.772927, 2.969913, 1, 0, 0, 1, 1,
0.6281667, 1.363963, 0.4389093, 1, 0, 0, 1, 1,
0.6290624, -0.2436364, 1.027535, 1, 0, 0, 1, 1,
0.6328716, 0.7925862, 1.094232, 1, 0, 0, 1, 1,
0.6354101, 0.2599815, 1.432793, 1, 0, 0, 1, 1,
0.644289, 0.2974813, 1.414625, 0, 0, 0, 1, 1,
0.6446147, -1.498556, 2.063141, 0, 0, 0, 1, 1,
0.6486396, -0.9541615, 2.225793, 0, 0, 0, 1, 1,
0.6526456, 0.2990857, 1.539914, 0, 0, 0, 1, 1,
0.6541246, 0.8697294, -0.6856974, 0, 0, 0, 1, 1,
0.6545539, 1.121094, 1.299967, 0, 0, 0, 1, 1,
0.6545769, -0.1438166, 2.309893, 0, 0, 0, 1, 1,
0.6558233, -0.3553816, 4.507089, 1, 1, 1, 1, 1,
0.6591076, 1.268119, 1.013217, 1, 1, 1, 1, 1,
0.6636756, -1.150717, 2.607783, 1, 1, 1, 1, 1,
0.6655383, 1.02167, -0.3256565, 1, 1, 1, 1, 1,
0.6699665, -2.208307, 2.530581, 1, 1, 1, 1, 1,
0.6738059, -1.221775, 1.705616, 1, 1, 1, 1, 1,
0.6747105, -0.858067, 3.106187, 1, 1, 1, 1, 1,
0.6769686, -0.2816094, 3.109486, 1, 1, 1, 1, 1,
0.6796523, -0.5381397, 1.457522, 1, 1, 1, 1, 1,
0.6797432, 0.5961522, 0.6740195, 1, 1, 1, 1, 1,
0.6804613, -0.141995, 1.691007, 1, 1, 1, 1, 1,
0.6817288, 0.01866103, 2.415045, 1, 1, 1, 1, 1,
0.6868321, 0.2565279, 0.08677585, 1, 1, 1, 1, 1,
0.6943475, -0.7140548, 2.40292, 1, 1, 1, 1, 1,
0.6992343, 0.7719875, -0.002528307, 1, 1, 1, 1, 1,
0.7102468, -0.542843, 1.454962, 0, 0, 1, 1, 1,
0.7126936, 0.4571801, 2.615381, 1, 0, 0, 1, 1,
0.7139452, 0.5778187, 0.8462197, 1, 0, 0, 1, 1,
0.7146474, -0.2608696, 0.9340169, 1, 0, 0, 1, 1,
0.7220837, 0.2960713, 1.597286, 1, 0, 0, 1, 1,
0.7318905, 2.080481, -0.6802151, 1, 0, 0, 1, 1,
0.7322792, -1.771962, 3.829317, 0, 0, 0, 1, 1,
0.7347069, -0.05996331, 3.333444, 0, 0, 0, 1, 1,
0.740581, -1.093687, 1.542958, 0, 0, 0, 1, 1,
0.746361, 0.9524547, 1.146124, 0, 0, 0, 1, 1,
0.7495762, 0.3112052, 2.017326, 0, 0, 0, 1, 1,
0.7549908, 0.3002712, -0.08091965, 0, 0, 0, 1, 1,
0.7559493, -0.2710818, 2.056407, 0, 0, 0, 1, 1,
0.757315, -0.6480929, 2.363008, 1, 1, 1, 1, 1,
0.7573847, 0.838286, 2.127827, 1, 1, 1, 1, 1,
0.7575291, -0.5380893, 2.048394, 1, 1, 1, 1, 1,
0.759316, 1.241318, 0.1429359, 1, 1, 1, 1, 1,
0.7607061, 1.117369, -0.4214961, 1, 1, 1, 1, 1,
0.7636089, -0.09782168, 3.383841, 1, 1, 1, 1, 1,
0.7707756, -1.300722, 2.787041, 1, 1, 1, 1, 1,
0.780948, -1.203263, 1.367874, 1, 1, 1, 1, 1,
0.7870075, -1.681827, 3.530274, 1, 1, 1, 1, 1,
0.7902614, -0.03939782, 1.970565, 1, 1, 1, 1, 1,
0.7918072, -0.4921562, 1.847622, 1, 1, 1, 1, 1,
0.792262, -1.350511, 2.75614, 1, 1, 1, 1, 1,
0.7923608, 0.3196173, -0.1218064, 1, 1, 1, 1, 1,
0.7954808, 1.562316, -1.319644, 1, 1, 1, 1, 1,
0.795677, -0.8804041, 3.968458, 1, 1, 1, 1, 1,
0.7977629, -0.237803, 1.069923, 0, 0, 1, 1, 1,
0.7990605, 0.850687, 1.272317, 1, 0, 0, 1, 1,
0.8026433, 0.5088177, 0.9150594, 1, 0, 0, 1, 1,
0.8034054, -1.307078, 2.043019, 1, 0, 0, 1, 1,
0.8041363, -2.340442, 3.722668, 1, 0, 0, 1, 1,
0.8074771, 0.3045225, 1.225152, 1, 0, 0, 1, 1,
0.8088404, -1.953682, 2.267689, 0, 0, 0, 1, 1,
0.8092114, -0.5283478, 2.609419, 0, 0, 0, 1, 1,
0.8194389, -0.8107875, 3.764047, 0, 0, 0, 1, 1,
0.8232521, 0.8211386, 2.395036, 0, 0, 0, 1, 1,
0.8244076, -0.4611585, 1.773958, 0, 0, 0, 1, 1,
0.8261107, 0.2163173, 1.507596, 0, 0, 0, 1, 1,
0.8261928, -0.05574167, 1.192446, 0, 0, 0, 1, 1,
0.8279825, 0.09350406, 2.030626, 1, 1, 1, 1, 1,
0.8287892, -0.3388176, 0.1685827, 1, 1, 1, 1, 1,
0.8308464, 0.7645513, 0.2590556, 1, 1, 1, 1, 1,
0.8315925, 1.470609, 0.2499871, 1, 1, 1, 1, 1,
0.8342597, 0.2917878, 1.633591, 1, 1, 1, 1, 1,
0.8359673, -0.5389193, 2.315096, 1, 1, 1, 1, 1,
0.8480403, -0.3941535, 1.17775, 1, 1, 1, 1, 1,
0.849796, 1.338469, -1.064471, 1, 1, 1, 1, 1,
0.8506879, -0.9437052, 1.363353, 1, 1, 1, 1, 1,
0.8625495, 0.8837305, 0.4558363, 1, 1, 1, 1, 1,
0.8660938, -1.424784, 0.05194627, 1, 1, 1, 1, 1,
0.8706768, -1.150898, 2.851763, 1, 1, 1, 1, 1,
0.8798748, 0.946846, -0.3899391, 1, 1, 1, 1, 1,
0.8823775, -1.279391, 2.400943, 1, 1, 1, 1, 1,
0.8892441, -0.13068, 2.100986, 1, 1, 1, 1, 1,
0.8933771, -0.9613218, 3.229652, 0, 0, 1, 1, 1,
0.8995758, -1.088162, 3.257798, 1, 0, 0, 1, 1,
0.9023484, -0.1124603, 1.484518, 1, 0, 0, 1, 1,
0.9115618, -0.5605021, 3.745938, 1, 0, 0, 1, 1,
0.9168329, -0.3226843, 3.33344, 1, 0, 0, 1, 1,
0.9169772, 0.6105062, 0.7870063, 1, 0, 0, 1, 1,
0.9262897, -1.094547, 0.7243555, 0, 0, 0, 1, 1,
0.9278133, -1.949365, 3.535937, 0, 0, 0, 1, 1,
0.9309683, 1.025203, 1.622253, 0, 0, 0, 1, 1,
0.9329438, 0.6778891, 3.171664, 0, 0, 0, 1, 1,
0.9335232, -1.73266, 4.109882, 0, 0, 0, 1, 1,
0.940021, -1.353395, 2.051624, 0, 0, 0, 1, 1,
0.9417821, 0.6399934, 1.342386, 0, 0, 0, 1, 1,
0.942302, 1.341341, 0.8282431, 1, 1, 1, 1, 1,
0.9561872, -0.4661075, 2.31508, 1, 1, 1, 1, 1,
0.9579557, 0.2063635, 2.315538, 1, 1, 1, 1, 1,
0.9682852, -1.23766, -0.2602934, 1, 1, 1, 1, 1,
0.9735351, -1.110019, 2.596714, 1, 1, 1, 1, 1,
0.9794961, -0.67551, 2.742601, 1, 1, 1, 1, 1,
0.983167, -0.5863107, 2.386331, 1, 1, 1, 1, 1,
0.9954042, -0.1519621, 1.546625, 1, 1, 1, 1, 1,
1.001187, 0.9091907, 0.2020889, 1, 1, 1, 1, 1,
1.001572, 0.09943637, -0.846837, 1, 1, 1, 1, 1,
1.004538, 1.402246, -0.3068953, 1, 1, 1, 1, 1,
1.010616, 0.9006139, 0.9996298, 1, 1, 1, 1, 1,
1.011843, 1.71395, -0.3345852, 1, 1, 1, 1, 1,
1.012519, 0.1057313, 2.286103, 1, 1, 1, 1, 1,
1.017245, -0.7569053, 1.977303, 1, 1, 1, 1, 1,
1.017932, 2.485165, 2.104026, 0, 0, 1, 1, 1,
1.018573, -0.5166601, 2.081765, 1, 0, 0, 1, 1,
1.023545, -0.3416271, 2.643115, 1, 0, 0, 1, 1,
1.025338, 1.514722, 0.1998072, 1, 0, 0, 1, 1,
1.030429, -0.002958233, 1.79841, 1, 0, 0, 1, 1,
1.031023, -0.3045769, 3.7981, 1, 0, 0, 1, 1,
1.033459, -0.546396, 1.336433, 0, 0, 0, 1, 1,
1.042193, 2.602793, 0.05798978, 0, 0, 0, 1, 1,
1.045689, 0.7795927, 0.9911215, 0, 0, 0, 1, 1,
1.05354, 0.4073536, 2.78099, 0, 0, 0, 1, 1,
1.057638, -0.4851068, 1.420778, 0, 0, 0, 1, 1,
1.059932, 2.089412, -1.211632, 0, 0, 0, 1, 1,
1.071316, 1.622241, 0.1870731, 0, 0, 0, 1, 1,
1.071823, -0.2723161, 0.5282341, 1, 1, 1, 1, 1,
1.072375, -0.3132799, -1.958431, 1, 1, 1, 1, 1,
1.090005, 0.4715347, 0.1949554, 1, 1, 1, 1, 1,
1.091845, 0.8732222, 0.346268, 1, 1, 1, 1, 1,
1.092563, -1.871077, 2.836753, 1, 1, 1, 1, 1,
1.093761, 0.4810238, 2.481879, 1, 1, 1, 1, 1,
1.102453, -0.5307348, 1.613423, 1, 1, 1, 1, 1,
1.103607, -1.099587, 3.243205, 1, 1, 1, 1, 1,
1.110818, 1.525422, 0.4756501, 1, 1, 1, 1, 1,
1.120889, 1.598102, 0.7696172, 1, 1, 1, 1, 1,
1.120945, 0.1543983, 1.727102, 1, 1, 1, 1, 1,
1.122677, 1.279207, 0.6881865, 1, 1, 1, 1, 1,
1.126125, 1.228904, 1.468213, 1, 1, 1, 1, 1,
1.133514, -0.5201787, 2.671838, 1, 1, 1, 1, 1,
1.140657, -0.321925, 0.6784236, 1, 1, 1, 1, 1,
1.143041, -0.8334298, 3.334918, 0, 0, 1, 1, 1,
1.144247, -0.8682233, 0.960995, 1, 0, 0, 1, 1,
1.145045, -0.1731233, 2.017401, 1, 0, 0, 1, 1,
1.147161, 1.303181, -0.8474581, 1, 0, 0, 1, 1,
1.147301, -0.7076933, 1.996119, 1, 0, 0, 1, 1,
1.150006, -0.1828483, 1.13116, 1, 0, 0, 1, 1,
1.157144, -0.1239905, 2.109434, 0, 0, 0, 1, 1,
1.157382, -0.8845732, 3.493892, 0, 0, 0, 1, 1,
1.163074, 0.3571708, 0.5224627, 0, 0, 0, 1, 1,
1.174733, 0.94272, 0.6824697, 0, 0, 0, 1, 1,
1.175414, 0.9100155, 1.831546, 0, 0, 0, 1, 1,
1.179905, 0.01304939, 1.355067, 0, 0, 0, 1, 1,
1.183237, 1.034233, 1.773942, 0, 0, 0, 1, 1,
1.189498, 0.2039447, 0.4042569, 1, 1, 1, 1, 1,
1.197813, -0.8700027, 1.080487, 1, 1, 1, 1, 1,
1.203361, 1.378424, -0.5924106, 1, 1, 1, 1, 1,
1.210384, -0.2414229, 0.6938472, 1, 1, 1, 1, 1,
1.216408, -1.592825, 2.646046, 1, 1, 1, 1, 1,
1.219008, 0.2711776, 0.6016784, 1, 1, 1, 1, 1,
1.222632, 0.3326978, 3.614265, 1, 1, 1, 1, 1,
1.22681, 0.4086422, 0.1582605, 1, 1, 1, 1, 1,
1.23649, -0.8545674, 3.107423, 1, 1, 1, 1, 1,
1.243197, -0.2587207, 0.8289124, 1, 1, 1, 1, 1,
1.244389, -0.2818043, 2.435641, 1, 1, 1, 1, 1,
1.244779, -0.007760399, 0.1618648, 1, 1, 1, 1, 1,
1.251717, 0.334926, 0.3442729, 1, 1, 1, 1, 1,
1.258114, -1.171372, 2.149555, 1, 1, 1, 1, 1,
1.266344, -0.8672726, 2.120335, 1, 1, 1, 1, 1,
1.282728, 0.1421778, 1.435129, 0, 0, 1, 1, 1,
1.283136, 0.2336724, 1.872388, 1, 0, 0, 1, 1,
1.285637, 1.175253, -0.2405502, 1, 0, 0, 1, 1,
1.287389, -2.090635, 2.959067, 1, 0, 0, 1, 1,
1.305502, -1.693339, 3.881927, 1, 0, 0, 1, 1,
1.309739, -0.7916852, 1.86713, 1, 0, 0, 1, 1,
1.310342, -0.3788581, -0.2485415, 0, 0, 0, 1, 1,
1.310573, -1.545269, 1.585364, 0, 0, 0, 1, 1,
1.317598, 0.1286871, 1.136628, 0, 0, 0, 1, 1,
1.318099, -0.6881633, 0.8437014, 0, 0, 0, 1, 1,
1.319117, 0.02137923, 0.965976, 0, 0, 0, 1, 1,
1.328071, 0.5928046, 1.447586, 0, 0, 0, 1, 1,
1.350161, 1.051769, -0.2792486, 0, 0, 0, 1, 1,
1.354747, -0.003928612, 0.8261727, 1, 1, 1, 1, 1,
1.365331, -0.6865668, 1.204628, 1, 1, 1, 1, 1,
1.37165, 1.577814, 0.422304, 1, 1, 1, 1, 1,
1.373004, 2.044142, 0.3201523, 1, 1, 1, 1, 1,
1.386264, -1.503042, 1.238859, 1, 1, 1, 1, 1,
1.402965, -0.7184999, 2.110409, 1, 1, 1, 1, 1,
1.40537, 2.955574, -0.09040822, 1, 1, 1, 1, 1,
1.407951, 0.1055789, 2.001458, 1, 1, 1, 1, 1,
1.416147, -0.3892073, 3.140939, 1, 1, 1, 1, 1,
1.416324, -1.749583, 2.297225, 1, 1, 1, 1, 1,
1.427188, -1.462599, 2.150061, 1, 1, 1, 1, 1,
1.431187, -0.3486822, 1.711007, 1, 1, 1, 1, 1,
1.433298, 0.09204471, 1.432133, 1, 1, 1, 1, 1,
1.449898, -1.424649, 4.026215, 1, 1, 1, 1, 1,
1.451591, -0.07626344, 1.404983, 1, 1, 1, 1, 1,
1.467569, -0.4590279, 2.834633, 0, 0, 1, 1, 1,
1.475826, 0.9791073, -0.4332045, 1, 0, 0, 1, 1,
1.47662, -0.8067371, 1.634708, 1, 0, 0, 1, 1,
1.481243, 1.797036, 1.850371, 1, 0, 0, 1, 1,
1.482238, 0.0931332, 1.375199, 1, 0, 0, 1, 1,
1.486342, -1.446826, 3.002541, 1, 0, 0, 1, 1,
1.487127, -0.03724319, 1.378023, 0, 0, 0, 1, 1,
1.499419, -0.0774524, 2.601101, 0, 0, 0, 1, 1,
1.509302, 1.110254, -0.1847269, 0, 0, 0, 1, 1,
1.511912, -2.276409, 2.556906, 0, 0, 0, 1, 1,
1.514816, -0.3721982, 1.309917, 0, 0, 0, 1, 1,
1.529247, 1.580342, 1.187838, 0, 0, 0, 1, 1,
1.533456, 0.7833686, 1.978987, 0, 0, 0, 1, 1,
1.535451, -0.8507483, 1.919753, 1, 1, 1, 1, 1,
1.53849, 0.06791787, 2.816314, 1, 1, 1, 1, 1,
1.54162, -0.03656842, 1.857109, 1, 1, 1, 1, 1,
1.547117, -1.683848, 0.8999705, 1, 1, 1, 1, 1,
1.548453, 0.302068, 2.782557, 1, 1, 1, 1, 1,
1.555924, -0.02912378, 1.512746, 1, 1, 1, 1, 1,
1.556193, -0.2262483, 1.95939, 1, 1, 1, 1, 1,
1.563893, -0.8230588, 1.972838, 1, 1, 1, 1, 1,
1.58751, 0.1526923, 1.197926, 1, 1, 1, 1, 1,
1.604184, -0.9663056, 4.30682, 1, 1, 1, 1, 1,
1.6073, -2.085326, 3.48909, 1, 1, 1, 1, 1,
1.62012, 0.5941041, 0.2268534, 1, 1, 1, 1, 1,
1.631892, -2.282009, 2.165055, 1, 1, 1, 1, 1,
1.636005, -0.4880989, 0.9400079, 1, 1, 1, 1, 1,
1.642398, 0.6051488, -0.6721267, 1, 1, 1, 1, 1,
1.646159, -1.030849, 1.147907, 0, 0, 1, 1, 1,
1.64908, 0.1159293, -0.5870463, 1, 0, 0, 1, 1,
1.653493, -0.00681161, 1.186582, 1, 0, 0, 1, 1,
1.662287, 3.256402, 1.165781, 1, 0, 0, 1, 1,
1.672011, 0.7598617, 0.9148026, 1, 0, 0, 1, 1,
1.694914, 1.444109, 0.7589506, 1, 0, 0, 1, 1,
1.72572, -1.590768, 4.189932, 0, 0, 0, 1, 1,
1.736886, 1.012173, 1.244444, 0, 0, 0, 1, 1,
1.740941, 0.2480289, 1.682546, 0, 0, 0, 1, 1,
1.7703, -1.093919, 0.2354179, 0, 0, 0, 1, 1,
1.792611, -0.4101875, 2.66982, 0, 0, 0, 1, 1,
1.831461, -1.124148, 2.196539, 0, 0, 0, 1, 1,
1.845546, 1.088251, 1.953347, 0, 0, 0, 1, 1,
1.846664, -0.02233172, -0.4394315, 1, 1, 1, 1, 1,
1.858893, 0.781496, 0.4865732, 1, 1, 1, 1, 1,
1.86282, -0.4048305, 1.536069, 1, 1, 1, 1, 1,
1.877584, -0.9130976, 2.730211, 1, 1, 1, 1, 1,
1.880297, -0.1441605, 1.3232, 1, 1, 1, 1, 1,
1.922936, -1.230956, 3.385437, 1, 1, 1, 1, 1,
1.933971, 0.9585209, 0.5700513, 1, 1, 1, 1, 1,
1.941708, 2.31718, -0.451942, 1, 1, 1, 1, 1,
1.95419, -0.2544556, 1.697815, 1, 1, 1, 1, 1,
1.971804, -0.8119465, 1.836508, 1, 1, 1, 1, 1,
1.975864, 0.3482654, 3.656832, 1, 1, 1, 1, 1,
1.97588, -0.5221489, -0.480852, 1, 1, 1, 1, 1,
1.989915, 1.058549, 1.994247, 1, 1, 1, 1, 1,
2.04048, 0.1581533, 3.084995, 1, 1, 1, 1, 1,
2.040823, 1.205347, 1.491665, 1, 1, 1, 1, 1,
2.050414, -0.1179131, 0.930855, 0, 0, 1, 1, 1,
2.077728, 0.2045108, 0.8911674, 1, 0, 0, 1, 1,
2.087945, 0.1969997, 2.5987, 1, 0, 0, 1, 1,
2.088547, -1.919639, 2.782736, 1, 0, 0, 1, 1,
2.11561, -0.7867776, 2.298182, 1, 0, 0, 1, 1,
2.123086, 0.6859798, 0.1821134, 1, 0, 0, 1, 1,
2.170846, -0.05177195, 3.197639, 0, 0, 0, 1, 1,
2.17398, 0.262935, 1.398636, 0, 0, 0, 1, 1,
2.216744, 0.951718, 0.6212816, 0, 0, 0, 1, 1,
2.24463, 0.5097534, 1.780262, 0, 0, 0, 1, 1,
2.258684, 1.320266, -0.05635719, 0, 0, 0, 1, 1,
2.265818, 0.5235386, 3.382716, 0, 0, 0, 1, 1,
2.307981, -0.09651808, 1.891967, 0, 0, 0, 1, 1,
2.309128, -1.047319, 3.027625, 1, 1, 1, 1, 1,
2.329836, 1.454621, 0.9647911, 1, 1, 1, 1, 1,
2.506622, 0.09118867, 2.672858, 1, 1, 1, 1, 1,
2.516812, 0.8120853, 1.76786, 1, 1, 1, 1, 1,
2.673149, 0.5099518, 1.261455, 1, 1, 1, 1, 1,
2.989011, -1.985774, 1.190075, 1, 1, 1, 1, 1,
3.035162, -0.9667283, 0.8579897, 1, 1, 1, 1, 1
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
var radius = 9.628666;
var distance = 33.82028;
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
mvMatrix.translate( 0.1729465, -0.1904128, -0.1695716 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82028);
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