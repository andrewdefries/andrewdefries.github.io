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
-3.024753, -0.5319974, -0.9144689, 1, 0, 0, 1,
-2.961485, -0.7315706, -2.570269, 1, 0.007843138, 0, 1,
-2.942476, 1.798872, -1.511172, 1, 0.01176471, 0, 1,
-2.917926, -0.8936034, -1.323927, 1, 0.01960784, 0, 1,
-2.884512, 0.4450912, -1.621118, 1, 0.02352941, 0, 1,
-2.80215, -0.3401341, -1.449913, 1, 0.03137255, 0, 1,
-2.515168, 0.7921116, -0.6281269, 1, 0.03529412, 0, 1,
-2.505271, -1.028936, -1.852875, 1, 0.04313726, 0, 1,
-2.437566, 1.646537, 0.4618585, 1, 0.04705882, 0, 1,
-2.424875, -0.8747647, -0.8564609, 1, 0.05490196, 0, 1,
-2.414075, -4.247882, -2.26986, 1, 0.05882353, 0, 1,
-2.361407, 1.278019, -1.761976, 1, 0.06666667, 0, 1,
-2.351653, -0.8087772, -3.098767, 1, 0.07058824, 0, 1,
-2.245001, 1.4808, -0.5774783, 1, 0.07843138, 0, 1,
-2.231759, -1.252802, -0.9250478, 1, 0.08235294, 0, 1,
-2.205606, -0.06510033, -0.5250923, 1, 0.09019608, 0, 1,
-2.202466, -0.6342072, -0.2946358, 1, 0.09411765, 0, 1,
-2.186783, -0.4801884, -3.553338, 1, 0.1019608, 0, 1,
-2.154958, 2.127228, -1.721697, 1, 0.1098039, 0, 1,
-2.133693, 0.4696664, -2.221898, 1, 0.1137255, 0, 1,
-2.109192, -0.2815131, -1.104059, 1, 0.1215686, 0, 1,
-2.106204, 1.640053, 0.1108196, 1, 0.1254902, 0, 1,
-2.097991, -1.160955, -1.742829, 1, 0.1333333, 0, 1,
-2.082343, 1.917633, -0.7932615, 1, 0.1372549, 0, 1,
-2.031219, 1.644799, -0.6917809, 1, 0.145098, 0, 1,
-2.030731, 0.226735, 0.3656754, 1, 0.1490196, 0, 1,
-2.004659, -0.4617179, -1.624614, 1, 0.1568628, 0, 1,
-2.000528, -1.190823, -2.721759, 1, 0.1607843, 0, 1,
-1.997674, 3.232858, -0.5449917, 1, 0.1686275, 0, 1,
-1.991764, -0.4447999, -1.128179, 1, 0.172549, 0, 1,
-1.986858, 0.7406098, -0.9167069, 1, 0.1803922, 0, 1,
-1.977238, -1.151665, -3.429386, 1, 0.1843137, 0, 1,
-1.963954, -0.1199626, -0.2771574, 1, 0.1921569, 0, 1,
-1.962661, 1.255028, -1.634427, 1, 0.1960784, 0, 1,
-1.962301, 1.026747, -0.1268113, 1, 0.2039216, 0, 1,
-1.948071, 0.790031, 0.1903807, 1, 0.2117647, 0, 1,
-1.946502, 0.9698799, -2.045235, 1, 0.2156863, 0, 1,
-1.940488, -0.4142329, -3.145382, 1, 0.2235294, 0, 1,
-1.909992, -1.932443, -4.369639, 1, 0.227451, 0, 1,
-1.904793, -0.04317437, -1.912331, 1, 0.2352941, 0, 1,
-1.896737, -0.716689, -1.608479, 1, 0.2392157, 0, 1,
-1.894702, 0.7467838, -1.261127, 1, 0.2470588, 0, 1,
-1.886582, 0.7804637, -1.653797, 1, 0.2509804, 0, 1,
-1.884603, 0.1847682, -2.248199, 1, 0.2588235, 0, 1,
-1.865479, -1.797785, -1.973811, 1, 0.2627451, 0, 1,
-1.81121, -2.053951, -2.017082, 1, 0.2705882, 0, 1,
-1.789323, 0.7583132, -0.04469758, 1, 0.2745098, 0, 1,
-1.78355, -0.9015459, -1.277456, 1, 0.282353, 0, 1,
-1.752202, -1.257552, -1.037823, 1, 0.2862745, 0, 1,
-1.742615, -0.2231826, -0.8199075, 1, 0.2941177, 0, 1,
-1.721382, 0.09380089, -0.3245827, 1, 0.3019608, 0, 1,
-1.710329, 1.779472, -1.751994, 1, 0.3058824, 0, 1,
-1.706273, -0.554872, -2.888972, 1, 0.3137255, 0, 1,
-1.690791, 1.086631, -2.568182, 1, 0.3176471, 0, 1,
-1.640369, -0.6036371, -2.253258, 1, 0.3254902, 0, 1,
-1.631182, -0.09114053, -0.3730876, 1, 0.3294118, 0, 1,
-1.620523, 0.9440547, -0.5842354, 1, 0.3372549, 0, 1,
-1.618708, -1.759156, -2.274031, 1, 0.3411765, 0, 1,
-1.607616, 1.55304, -2.061454, 1, 0.3490196, 0, 1,
-1.600176, -0.8715359, -1.769601, 1, 0.3529412, 0, 1,
-1.596555, -0.4956846, -2.140598, 1, 0.3607843, 0, 1,
-1.593077, -0.8712714, 1.530994, 1, 0.3647059, 0, 1,
-1.577484, -0.2631947, -0.1308073, 1, 0.372549, 0, 1,
-1.570817, -0.4599353, -1.761731, 1, 0.3764706, 0, 1,
-1.570497, -0.707028, -1.328701, 1, 0.3843137, 0, 1,
-1.557182, 1.639359, -1.053101, 1, 0.3882353, 0, 1,
-1.556548, -0.8411945, -1.142565, 1, 0.3960784, 0, 1,
-1.539174, -0.9614366, -0.5004558, 1, 0.4039216, 0, 1,
-1.534108, -1.198817, -2.860438, 1, 0.4078431, 0, 1,
-1.52148, -0.6131747, -2.063695, 1, 0.4156863, 0, 1,
-1.515404, 1.194723, -0.9459287, 1, 0.4196078, 0, 1,
-1.514675, -0.7697864, -2.224416, 1, 0.427451, 0, 1,
-1.512644, -0.525472, -3.412495, 1, 0.4313726, 0, 1,
-1.505636, -0.5858744, -1.508231, 1, 0.4392157, 0, 1,
-1.50531, 0.3286204, -1.990601, 1, 0.4431373, 0, 1,
-1.505001, -1.648535, -3.131579, 1, 0.4509804, 0, 1,
-1.497051, -0.0294209, -1.158332, 1, 0.454902, 0, 1,
-1.470365, -0.1566805, -1.367128, 1, 0.4627451, 0, 1,
-1.453571, -0.3538607, -4.227341, 1, 0.4666667, 0, 1,
-1.45068, -0.4844465, -3.449184, 1, 0.4745098, 0, 1,
-1.447189, -2.538921, -2.990132, 1, 0.4784314, 0, 1,
-1.442621, -0.05376714, -1.453965, 1, 0.4862745, 0, 1,
-1.438161, -1.515996, -2.743444, 1, 0.4901961, 0, 1,
-1.432603, 0.5475019, -2.311653, 1, 0.4980392, 0, 1,
-1.429076, -0.1611032, -1.486431, 1, 0.5058824, 0, 1,
-1.423145, -0.06000178, -0.821942, 1, 0.509804, 0, 1,
-1.422737, 1.534506, -0.7571452, 1, 0.5176471, 0, 1,
-1.419999, 0.8884035, -0.2366769, 1, 0.5215687, 0, 1,
-1.409947, -1.561461, -0.5647742, 1, 0.5294118, 0, 1,
-1.406182, 0.815356, -1.720136, 1, 0.5333334, 0, 1,
-1.40608, 0.6404412, -1.751404, 1, 0.5411765, 0, 1,
-1.398646, 0.893395, -1.282312, 1, 0.5450981, 0, 1,
-1.396707, 1.591444, 0.2977736, 1, 0.5529412, 0, 1,
-1.377776, -0.7676193, -2.556056, 1, 0.5568628, 0, 1,
-1.376487, 0.7463441, -1.429197, 1, 0.5647059, 0, 1,
-1.372782, 1.62247, -1.030425, 1, 0.5686275, 0, 1,
-1.359779, -1.28312, -2.760712, 1, 0.5764706, 0, 1,
-1.359584, -0.5557808, -3.733387, 1, 0.5803922, 0, 1,
-1.341676, 0.7023385, 0.4347337, 1, 0.5882353, 0, 1,
-1.335771, 0.9913204, -2.257441, 1, 0.5921569, 0, 1,
-1.330287, -2.145705, -2.161383, 1, 0.6, 0, 1,
-1.31766, 1.904182, 0.1216266, 1, 0.6078432, 0, 1,
-1.314529, 0.4574001, -0.4709466, 1, 0.6117647, 0, 1,
-1.310178, 0.3797255, -0.1439334, 1, 0.6196079, 0, 1,
-1.307074, 0.02103227, -1.505422, 1, 0.6235294, 0, 1,
-1.29717, 1.427819, 0.572218, 1, 0.6313726, 0, 1,
-1.295974, -0.06384419, -2.252757, 1, 0.6352941, 0, 1,
-1.288998, -0.0800867, -2.671902, 1, 0.6431373, 0, 1,
-1.283056, 0.2995405, 0.1678365, 1, 0.6470588, 0, 1,
-1.277141, -1.497388, -1.345318, 1, 0.654902, 0, 1,
-1.276598, 0.6379448, -1.057039, 1, 0.6588235, 0, 1,
-1.268943, 0.838069, -1.195299, 1, 0.6666667, 0, 1,
-1.250692, 0.2394355, -1.959543, 1, 0.6705883, 0, 1,
-1.244632, -0.9002685, -1.949542, 1, 0.6784314, 0, 1,
-1.228453, 1.398329, 0.4580881, 1, 0.682353, 0, 1,
-1.22598, 0.846132, 0.5066853, 1, 0.6901961, 0, 1,
-1.220382, 2.306999, 0.9381363, 1, 0.6941177, 0, 1,
-1.219867, -0.7125472, -1.096259, 1, 0.7019608, 0, 1,
-1.21711, 0.7387183, -2.765276, 1, 0.7098039, 0, 1,
-1.215237, -0.1687965, -1.699121, 1, 0.7137255, 0, 1,
-1.213687, -0.3611068, -5.665555, 1, 0.7215686, 0, 1,
-1.212597, 1.113715, -0.8135722, 1, 0.7254902, 0, 1,
-1.207809, -0.4869428, -1.751315, 1, 0.7333333, 0, 1,
-1.204814, -1.21268, -1.987017, 1, 0.7372549, 0, 1,
-1.200727, -1.131514, -3.393473, 1, 0.7450981, 0, 1,
-1.186474, 0.3742445, -0.8353959, 1, 0.7490196, 0, 1,
-1.182637, 0.7924404, -1.158341, 1, 0.7568628, 0, 1,
-1.17214, 1.092194, 0.5643612, 1, 0.7607843, 0, 1,
-1.160562, -0.01040967, -0.9770039, 1, 0.7686275, 0, 1,
-1.159342, -0.1732883, -1.215523, 1, 0.772549, 0, 1,
-1.146854, 1.18469, -0.6182689, 1, 0.7803922, 0, 1,
-1.145016, 0.9238802, -1.325642, 1, 0.7843137, 0, 1,
-1.142436, -0.4574131, -2.674363, 1, 0.7921569, 0, 1,
-1.131049, 0.6201321, -0.894818, 1, 0.7960784, 0, 1,
-1.128349, 0.6776113, 2.161375, 1, 0.8039216, 0, 1,
-1.124871, 0.04991001, -1.003919, 1, 0.8117647, 0, 1,
-1.124628, 1.110717, 1.043071, 1, 0.8156863, 0, 1,
-1.124109, 1.012051, -2.381073, 1, 0.8235294, 0, 1,
-1.119242, -0.8797002, -1.459555, 1, 0.827451, 0, 1,
-1.118884, -1.374843, -1.20127, 1, 0.8352941, 0, 1,
-1.105529, 0.2289821, -1.063938, 1, 0.8392157, 0, 1,
-1.100796, 1.365255, 0.5987058, 1, 0.8470588, 0, 1,
-1.085452, 1.301957, -0.1453277, 1, 0.8509804, 0, 1,
-1.084037, -1.593958, -0.564964, 1, 0.8588235, 0, 1,
-1.081053, 1.823755, -2.037587, 1, 0.8627451, 0, 1,
-1.079695, -1.550564, -2.558894, 1, 0.8705882, 0, 1,
-1.076258, 0.4184209, -2.5608, 1, 0.8745098, 0, 1,
-1.072218, -0.5753596, -3.61784, 1, 0.8823529, 0, 1,
-1.069783, 0.6841217, -1.08098, 1, 0.8862745, 0, 1,
-1.068511, -0.3783803, -1.701218, 1, 0.8941177, 0, 1,
-1.067926, -0.02818321, -2.539948, 1, 0.8980392, 0, 1,
-1.067838, -0.495276, -1.212487, 1, 0.9058824, 0, 1,
-1.067186, 1.117422, -1.414165, 1, 0.9137255, 0, 1,
-1.065841, -0.01044549, -1.400375, 1, 0.9176471, 0, 1,
-1.065579, 2.221641, -0.5622844, 1, 0.9254902, 0, 1,
-1.058707, -0.1223344, -1.110787, 1, 0.9294118, 0, 1,
-1.053233, 0.2986389, -1.46641, 1, 0.9372549, 0, 1,
-1.04865, 1.48367, -0.634032, 1, 0.9411765, 0, 1,
-1.043594, 0.9554579, -0.3950677, 1, 0.9490196, 0, 1,
-1.041677, 0.5071024, -0.4472992, 1, 0.9529412, 0, 1,
-1.036661, 1.167479, -1.476867, 1, 0.9607843, 0, 1,
-1.025975, -1.905303, -2.75969, 1, 0.9647059, 0, 1,
-1.024548, 1.229293, 0.2196472, 1, 0.972549, 0, 1,
-1.014256, -0.8973036, -1.035858, 1, 0.9764706, 0, 1,
-1.014229, 0.7098516, -1.810051, 1, 0.9843137, 0, 1,
-1.011982, -0.3608264, 0.05691954, 1, 0.9882353, 0, 1,
-1.009466, 1.835974, -0.8991916, 1, 0.9960784, 0, 1,
-1.009012, -1.562241, -2.199932, 0.9960784, 1, 0, 1,
-1.003493, -0.2033439, -1.705949, 0.9921569, 1, 0, 1,
-0.9997661, 0.5638424, -2.600798, 0.9843137, 1, 0, 1,
-0.9981391, -0.9989142, -1.753725, 0.9803922, 1, 0, 1,
-0.9950036, -0.681919, -2.762997, 0.972549, 1, 0, 1,
-0.9867433, 0.5991024, -0.8775365, 0.9686275, 1, 0, 1,
-0.9844329, -1.171912, -0.5300511, 0.9607843, 1, 0, 1,
-0.9749473, -0.9536437, -1.292177, 0.9568627, 1, 0, 1,
-0.9701658, -1.135886, -0.5224159, 0.9490196, 1, 0, 1,
-0.9619849, -0.6331945, -2.090905, 0.945098, 1, 0, 1,
-0.9598157, -1.496621, -2.243914, 0.9372549, 1, 0, 1,
-0.951264, 0.4360649, 0.4600668, 0.9333333, 1, 0, 1,
-0.9476208, -1.497346, -4.405995, 0.9254902, 1, 0, 1,
-0.9419168, 0.1856555, 0.7054613, 0.9215686, 1, 0, 1,
-0.9411811, 0.6621833, -2.046704, 0.9137255, 1, 0, 1,
-0.940743, -0.643438, -1.37969, 0.9098039, 1, 0, 1,
-0.927904, 0.476447, 0.9674692, 0.9019608, 1, 0, 1,
-0.9265367, 1.542693, -0.7042105, 0.8941177, 1, 0, 1,
-0.9237375, -1.145127, -2.977666, 0.8901961, 1, 0, 1,
-0.9204664, 0.2384688, -1.73381, 0.8823529, 1, 0, 1,
-0.9165478, -0.4666587, -3.335059, 0.8784314, 1, 0, 1,
-0.9094154, 0.002279761, -2.300639, 0.8705882, 1, 0, 1,
-0.9050101, 0.8507804, 0.6598818, 0.8666667, 1, 0, 1,
-0.9034978, -1.300539, -1.701247, 0.8588235, 1, 0, 1,
-0.9030575, 1.919948, 0.9005132, 0.854902, 1, 0, 1,
-0.8993801, -0.6202933, -1.780665, 0.8470588, 1, 0, 1,
-0.8957728, 1.012183, -0.6729143, 0.8431373, 1, 0, 1,
-0.891307, -0.3430823, -2.588404, 0.8352941, 1, 0, 1,
-0.8903909, -0.9335078, -3.364387, 0.8313726, 1, 0, 1,
-0.8885343, 1.284918, -0.03379143, 0.8235294, 1, 0, 1,
-0.8882016, 0.3402035, -1.717974, 0.8196079, 1, 0, 1,
-0.886942, 1.330168, -0.5063911, 0.8117647, 1, 0, 1,
-0.8862227, -0.3519039, -3.266691, 0.8078431, 1, 0, 1,
-0.8854138, -1.268902, -1.904092, 0.8, 1, 0, 1,
-0.882877, 0.180249, -2.375518, 0.7921569, 1, 0, 1,
-0.8809474, 0.9826428, -1.079598, 0.7882353, 1, 0, 1,
-0.8783642, -0.9371433, -3.457813, 0.7803922, 1, 0, 1,
-0.8777488, 0.510645, -1.146321, 0.7764706, 1, 0, 1,
-0.877254, 1.90726, -0.1926035, 0.7686275, 1, 0, 1,
-0.8769605, 1.263025, -1.642077, 0.7647059, 1, 0, 1,
-0.8684016, -0.327866, -2.075551, 0.7568628, 1, 0, 1,
-0.8668118, 0.2432497, -1.789317, 0.7529412, 1, 0, 1,
-0.8575045, -0.1752324, -2.604723, 0.7450981, 1, 0, 1,
-0.8470029, 0.5861231, -0.5013425, 0.7411765, 1, 0, 1,
-0.8436545, -0.3695647, -3.471318, 0.7333333, 1, 0, 1,
-0.8413993, 0.5024593, -2.928826, 0.7294118, 1, 0, 1,
-0.8295547, 0.3029642, -0.6288212, 0.7215686, 1, 0, 1,
-0.8277925, -0.3793982, -1.101559, 0.7176471, 1, 0, 1,
-0.8236638, 1.085724, -2.102958, 0.7098039, 1, 0, 1,
-0.814979, 0.3363789, -2.142917, 0.7058824, 1, 0, 1,
-0.8143893, -1.457567, -1.287901, 0.6980392, 1, 0, 1,
-0.807654, -2.34137, -5.280719, 0.6901961, 1, 0, 1,
-0.8061982, 0.4250747, -1.377153, 0.6862745, 1, 0, 1,
-0.805397, -0.4246025, -0.2773592, 0.6784314, 1, 0, 1,
-0.8027358, 0.4544462, -0.5521692, 0.6745098, 1, 0, 1,
-0.8010004, -0.1989762, -0.7039487, 0.6666667, 1, 0, 1,
-0.7995565, -0.09588655, 0.6014403, 0.6627451, 1, 0, 1,
-0.7989637, -0.5732716, 0.09575561, 0.654902, 1, 0, 1,
-0.7938039, 0.3867465, -0.03494346, 0.6509804, 1, 0, 1,
-0.793003, 0.6398572, -1.318699, 0.6431373, 1, 0, 1,
-0.792676, -0.2365812, -0.4416457, 0.6392157, 1, 0, 1,
-0.7906306, 0.06202319, -0.09146516, 0.6313726, 1, 0, 1,
-0.787166, -0.5023959, -2.168705, 0.627451, 1, 0, 1,
-0.7858071, -0.7646421, -1.653014, 0.6196079, 1, 0, 1,
-0.7788334, 0.5656766, -1.060887, 0.6156863, 1, 0, 1,
-0.7745542, -0.356749, -2.796179, 0.6078432, 1, 0, 1,
-0.7722313, -0.03746002, -1.892159, 0.6039216, 1, 0, 1,
-0.7657152, -0.8638502, -1.889716, 0.5960785, 1, 0, 1,
-0.7533566, -1.796682, -2.805856, 0.5882353, 1, 0, 1,
-0.7518131, -2.917409, -3.047597, 0.5843138, 1, 0, 1,
-0.7499585, -0.7413343, -0.6701261, 0.5764706, 1, 0, 1,
-0.7494696, 0.3448264, -1.95294, 0.572549, 1, 0, 1,
-0.7477275, 0.8039296, 0.8216705, 0.5647059, 1, 0, 1,
-0.7428446, 0.2541302, -2.9444, 0.5607843, 1, 0, 1,
-0.7379339, -0.01494137, -1.5154, 0.5529412, 1, 0, 1,
-0.7371976, -0.3798023, -2.656605, 0.5490196, 1, 0, 1,
-0.7336224, -0.5557005, -2.351157, 0.5411765, 1, 0, 1,
-0.7315685, -0.5876633, -1.799621, 0.5372549, 1, 0, 1,
-0.7309734, 1.989894, -0.3400371, 0.5294118, 1, 0, 1,
-0.7308769, 0.9901683, -0.4764127, 0.5254902, 1, 0, 1,
-0.7264479, 0.5211441, -2.344407, 0.5176471, 1, 0, 1,
-0.7224874, -0.2739505, -3.794139, 0.5137255, 1, 0, 1,
-0.7171117, -0.7370454, -1.082118, 0.5058824, 1, 0, 1,
-0.7154971, 0.004179782, -3.383639, 0.5019608, 1, 0, 1,
-0.7118855, 0.4795658, -2.645507, 0.4941176, 1, 0, 1,
-0.7081269, -1.443895, -2.383085, 0.4862745, 1, 0, 1,
-0.7073393, 1.23456, -0.510248, 0.4823529, 1, 0, 1,
-0.7061552, 2.026899, -1.37966, 0.4745098, 1, 0, 1,
-0.6984124, -0.0313785, -3.098292, 0.4705882, 1, 0, 1,
-0.6981449, 0.8218288, -1.881362, 0.4627451, 1, 0, 1,
-0.6970485, 0.005808904, -2.421083, 0.4588235, 1, 0, 1,
-0.6964221, 3.496495, -0.2477488, 0.4509804, 1, 0, 1,
-0.6951347, -1.18584, -2.382235, 0.4470588, 1, 0, 1,
-0.6939678, 0.872857, -0.4032721, 0.4392157, 1, 0, 1,
-0.6919979, -0.4820819, -2.125441, 0.4352941, 1, 0, 1,
-0.6866964, 0.3259907, -1.170368, 0.427451, 1, 0, 1,
-0.6863272, 1.127907, -1.698038, 0.4235294, 1, 0, 1,
-0.6852206, 2.548576, -1.792333, 0.4156863, 1, 0, 1,
-0.6740493, 0.8341164, -0.07725612, 0.4117647, 1, 0, 1,
-0.6713315, 0.4828386, -0.2153981, 0.4039216, 1, 0, 1,
-0.669542, -0.4307662, -1.582991, 0.3960784, 1, 0, 1,
-0.6691641, -0.8043764, -1.937813, 0.3921569, 1, 0, 1,
-0.6671147, -0.7004668, -2.263495, 0.3843137, 1, 0, 1,
-0.66639, 0.6318887, -1.385877, 0.3803922, 1, 0, 1,
-0.653527, 0.218667, -2.057558, 0.372549, 1, 0, 1,
-0.6531974, -0.4870507, -1.260412, 0.3686275, 1, 0, 1,
-0.651198, 1.399754, -1.604009, 0.3607843, 1, 0, 1,
-0.6498536, -1.40217, -2.663535, 0.3568628, 1, 0, 1,
-0.6493626, 0.192816, 0.04486366, 0.3490196, 1, 0, 1,
-0.644786, 0.5293674, -2.898339, 0.345098, 1, 0, 1,
-0.6437455, 0.4937034, -2.59999, 0.3372549, 1, 0, 1,
-0.6425531, -0.2147009, -1.63632, 0.3333333, 1, 0, 1,
-0.6379142, -0.4368775, -1.47154, 0.3254902, 1, 0, 1,
-0.6330273, -1.130559, -2.228431, 0.3215686, 1, 0, 1,
-0.6327902, -0.2076917, -2.734132, 0.3137255, 1, 0, 1,
-0.6315575, 0.1858261, -1.035816, 0.3098039, 1, 0, 1,
-0.6259912, 1.303787, -0.8148029, 0.3019608, 1, 0, 1,
-0.62437, -0.9424301, -2.303801, 0.2941177, 1, 0, 1,
-0.6240402, 2.282539, 0.7109876, 0.2901961, 1, 0, 1,
-0.6174862, -0.1731748, -1.900284, 0.282353, 1, 0, 1,
-0.6120496, 0.7004755, -0.9903617, 0.2784314, 1, 0, 1,
-0.6076534, 1.612294, 1.166292, 0.2705882, 1, 0, 1,
-0.6056204, -1.362074, -2.575376, 0.2666667, 1, 0, 1,
-0.6050053, -0.09043345, -1.714087, 0.2588235, 1, 0, 1,
-0.6040148, 0.6806058, -0.5184001, 0.254902, 1, 0, 1,
-0.6019759, 1.057195, 1.664577, 0.2470588, 1, 0, 1,
-0.6011733, -0.9430863, -2.751189, 0.2431373, 1, 0, 1,
-0.5966908, -1.168593, -2.613068, 0.2352941, 1, 0, 1,
-0.5894496, -0.2099978, -0.981831, 0.2313726, 1, 0, 1,
-0.5875401, -1.321334, -2.296865, 0.2235294, 1, 0, 1,
-0.5869126, -0.1557923, -3.68404, 0.2196078, 1, 0, 1,
-0.5849595, 0.5275714, 0.3683748, 0.2117647, 1, 0, 1,
-0.5804749, -0.6936343, -2.748959, 0.2078431, 1, 0, 1,
-0.5782715, 0.6893068, 0.973648, 0.2, 1, 0, 1,
-0.5780026, -1.005392, -3.510245, 0.1921569, 1, 0, 1,
-0.5760822, -0.128319, -2.524817, 0.1882353, 1, 0, 1,
-0.5733364, -1.040706, -4.61022, 0.1803922, 1, 0, 1,
-0.5701104, -0.6299424, -1.887679, 0.1764706, 1, 0, 1,
-0.5668279, 0.1426358, -2.008043, 0.1686275, 1, 0, 1,
-0.5603146, -2.437911, -2.58878, 0.1647059, 1, 0, 1,
-0.5597928, 0.1399275, 0.8177263, 0.1568628, 1, 0, 1,
-0.5595245, -0.2081502, -0.8836958, 0.1529412, 1, 0, 1,
-0.5592288, -0.8385481, -3.243496, 0.145098, 1, 0, 1,
-0.5589008, 0.7028584, -1.000342, 0.1411765, 1, 0, 1,
-0.5462939, 0.3371993, -0.05508769, 0.1333333, 1, 0, 1,
-0.5323318, 0.6982044, -1.841035, 0.1294118, 1, 0, 1,
-0.5186821, -2.9064, -2.983878, 0.1215686, 1, 0, 1,
-0.5145941, 0.3850123, -1.926315, 0.1176471, 1, 0, 1,
-0.5107183, -0.9251505, -3.753279, 0.1098039, 1, 0, 1,
-0.5087268, -1.306422, -3.550049, 0.1058824, 1, 0, 1,
-0.496817, -0.3607734, -4.274161, 0.09803922, 1, 0, 1,
-0.4965869, 0.6371247, -0.9416986, 0.09019608, 1, 0, 1,
-0.4944163, 0.9625787, 0.2637792, 0.08627451, 1, 0, 1,
-0.4791524, -0.1864825, -1.303391, 0.07843138, 1, 0, 1,
-0.4789433, -0.3048177, -5.621533, 0.07450981, 1, 0, 1,
-0.4779567, 0.6160256, -1.157777, 0.06666667, 1, 0, 1,
-0.4765594, 0.8786296, -0.09734954, 0.0627451, 1, 0, 1,
-0.4740453, 0.6231283, 0.5515713, 0.05490196, 1, 0, 1,
-0.4714545, -1.421283, -2.764904, 0.05098039, 1, 0, 1,
-0.46927, -1.859508, -3.112836, 0.04313726, 1, 0, 1,
-0.4689792, -0.764049, -3.999573, 0.03921569, 1, 0, 1,
-0.4687248, -0.1818133, -2.856107, 0.03137255, 1, 0, 1,
-0.468073, 0.2167992, -2.376859, 0.02745098, 1, 0, 1,
-0.4670061, -1.998053, -2.405201, 0.01960784, 1, 0, 1,
-0.4641688, 0.3962487, -2.279013, 0.01568628, 1, 0, 1,
-0.4633453, 0.8339952, 0.9519489, 0.007843138, 1, 0, 1,
-0.4594866, -0.5797081, -2.625437, 0.003921569, 1, 0, 1,
-0.4586727, -0.02734545, -4.063809, 0, 1, 0.003921569, 1,
-0.458021, -0.293, -0.6055036, 0, 1, 0.01176471, 1,
-0.4579733, 0.8422379, 0.5587125, 0, 1, 0.01568628, 1,
-0.4499105, -1.356896, -1.441788, 0, 1, 0.02352941, 1,
-0.4347, 2.369185, -0.1502074, 0, 1, 0.02745098, 1,
-0.4287524, -1.508431, -1.891203, 0, 1, 0.03529412, 1,
-0.4245458, -0.113258, -4.276601, 0, 1, 0.03921569, 1,
-0.4201453, -1.618621, -2.075878, 0, 1, 0.04705882, 1,
-0.4171802, 0.2901591, 0.4751871, 0, 1, 0.05098039, 1,
-0.4168968, -0.2540295, -1.427464, 0, 1, 0.05882353, 1,
-0.4163568, 1.196879, -0.9421544, 0, 1, 0.0627451, 1,
-0.4133675, 0.2290355, -2.085911, 0, 1, 0.07058824, 1,
-0.4122525, -0.7540956, -1.773143, 0, 1, 0.07450981, 1,
-0.4083209, 2.309534, -0.8482776, 0, 1, 0.08235294, 1,
-0.4058204, 1.136343, 0.6119444, 0, 1, 0.08627451, 1,
-0.4033059, -1.154652, -2.495894, 0, 1, 0.09411765, 1,
-0.3986362, -0.0307877, -1.37385, 0, 1, 0.1019608, 1,
-0.3978292, -1.37494, -1.890089, 0, 1, 0.1058824, 1,
-0.3972539, -0.9959476, -3.383979, 0, 1, 0.1137255, 1,
-0.3960264, -1.24833, -1.951126, 0, 1, 0.1176471, 1,
-0.3939826, -2.042376, -3.418189, 0, 1, 0.1254902, 1,
-0.390623, 1.402475, -2.006386, 0, 1, 0.1294118, 1,
-0.3881586, 2.849576, 0.3040446, 0, 1, 0.1372549, 1,
-0.3861405, -2.163922, -3.181716, 0, 1, 0.1411765, 1,
-0.3832178, -0.6754828, -3.112662, 0, 1, 0.1490196, 1,
-0.3795831, 0.3681344, 0.153526, 0, 1, 0.1529412, 1,
-0.3795262, 0.2682415, -1.543208, 0, 1, 0.1607843, 1,
-0.3788083, 0.549658, -1.364286, 0, 1, 0.1647059, 1,
-0.3784445, -0.9487658, -2.300881, 0, 1, 0.172549, 1,
-0.3774299, -1.718938, -4.493075, 0, 1, 0.1764706, 1,
-0.3762728, -0.1079096, -1.576642, 0, 1, 0.1843137, 1,
-0.3755841, 0.8988432, 0.8742808, 0, 1, 0.1882353, 1,
-0.372881, 0.4500798, -1.24843, 0, 1, 0.1960784, 1,
-0.3713296, 0.1201191, -1.220106, 0, 1, 0.2039216, 1,
-0.3694706, -0.06100274, -2.097137, 0, 1, 0.2078431, 1,
-0.3693581, -0.8718715, -1.954246, 0, 1, 0.2156863, 1,
-0.3685642, 0.4719199, 0.05928563, 0, 1, 0.2196078, 1,
-0.3676259, 0.4067427, -0.228018, 0, 1, 0.227451, 1,
-0.3675928, -0.3198192, -1.742394, 0, 1, 0.2313726, 1,
-0.3671358, 0.2525617, -2.12518, 0, 1, 0.2392157, 1,
-0.3647456, 1.544056, -2.596209, 0, 1, 0.2431373, 1,
-0.3575022, 2.651385, 0.6505464, 0, 1, 0.2509804, 1,
-0.3547884, 1.678565, -0.7185249, 0, 1, 0.254902, 1,
-0.3545463, 0.676522, 1.474195, 0, 1, 0.2627451, 1,
-0.3524766, 0.3754143, -1.914709, 0, 1, 0.2666667, 1,
-0.3516934, -1.188259, -3.985447, 0, 1, 0.2745098, 1,
-0.350734, 0.5917435, -0.8838146, 0, 1, 0.2784314, 1,
-0.3501286, -0.1143809, -1.81225, 0, 1, 0.2862745, 1,
-0.3468695, 0.2878837, -1.730681, 0, 1, 0.2901961, 1,
-0.3433338, 1.549224, 0.3200622, 0, 1, 0.2980392, 1,
-0.3381387, -0.145831, -1.203819, 0, 1, 0.3058824, 1,
-0.3378931, 1.561728, -0.6621198, 0, 1, 0.3098039, 1,
-0.3364193, -1.156331, -1.675473, 0, 1, 0.3176471, 1,
-0.33287, 0.5879881, -1.518208, 0, 1, 0.3215686, 1,
-0.3312596, 0.05843855, -0.5765377, 0, 1, 0.3294118, 1,
-0.3306451, 1.199865, -1.482383, 0, 1, 0.3333333, 1,
-0.3274574, -1.147752, -3.439392, 0, 1, 0.3411765, 1,
-0.3246017, -0.1337125, -2.998947, 0, 1, 0.345098, 1,
-0.3245643, 1.398587, 1.022822, 0, 1, 0.3529412, 1,
-0.32411, 0.4211265, -1.106818, 0, 1, 0.3568628, 1,
-0.3227776, 0.3341186, -2.690071, 0, 1, 0.3647059, 1,
-0.3186099, 1.807333, -1.824763, 0, 1, 0.3686275, 1,
-0.3183908, 1.540149, -0.2604742, 0, 1, 0.3764706, 1,
-0.318143, 1.078811, -1.792054, 0, 1, 0.3803922, 1,
-0.3137284, 0.5860416, -1.043936, 0, 1, 0.3882353, 1,
-0.2917094, 0.4496572, -1.374889, 0, 1, 0.3921569, 1,
-0.2900608, -0.737514, -2.805803, 0, 1, 0.4, 1,
-0.2882246, -0.6534958, -3.346699, 0, 1, 0.4078431, 1,
-0.2881078, -0.3001761, -0.6973307, 0, 1, 0.4117647, 1,
-0.2844631, 0.5662735, -0.1568765, 0, 1, 0.4196078, 1,
-0.2832317, 1.353999, 0.2509826, 0, 1, 0.4235294, 1,
-0.2739142, -0.5007966, -0.7734177, 0, 1, 0.4313726, 1,
-0.2701904, -0.4767197, -2.194867, 0, 1, 0.4352941, 1,
-0.2701748, 0.01733248, -2.222226, 0, 1, 0.4431373, 1,
-0.2689315, -2.199092, -2.495122, 0, 1, 0.4470588, 1,
-0.2654304, 0.5786379, -1.415528, 0, 1, 0.454902, 1,
-0.265095, -1.539192, -2.165222, 0, 1, 0.4588235, 1,
-0.2649866, 0.2088098, -0.8707329, 0, 1, 0.4666667, 1,
-0.2649341, 0.9815353, 0.4797318, 0, 1, 0.4705882, 1,
-0.2648959, 0.1144007, -0.1399484, 0, 1, 0.4784314, 1,
-0.2644175, 0.07149425, -1.997141, 0, 1, 0.4823529, 1,
-0.2635787, 0.8497746, -0.05768276, 0, 1, 0.4901961, 1,
-0.2543886, -0.2676262, -2.166833, 0, 1, 0.4941176, 1,
-0.25042, 0.155527, 2.216249, 0, 1, 0.5019608, 1,
-0.2444596, 0.777106, 1.776604, 0, 1, 0.509804, 1,
-0.2444279, 0.06730869, -1.303982, 0, 1, 0.5137255, 1,
-0.2443316, 1.247519, -0.5918429, 0, 1, 0.5215687, 1,
-0.2437185, -0.2532875, -3.486806, 0, 1, 0.5254902, 1,
-0.2384648, -0.6100618, -0.9113139, 0, 1, 0.5333334, 1,
-0.2380308, -1.030732, -4.382419, 0, 1, 0.5372549, 1,
-0.2373297, 0.2767603, -1.650826, 0, 1, 0.5450981, 1,
-0.2370967, -0.5095525, -2.611583, 0, 1, 0.5490196, 1,
-0.2356424, -0.4836155, -3.835697, 0, 1, 0.5568628, 1,
-0.2341938, -0.1119739, -0.2755605, 0, 1, 0.5607843, 1,
-0.2310919, -0.06510096, -2.882433, 0, 1, 0.5686275, 1,
-0.2276399, 0.9893143, -0.5040932, 0, 1, 0.572549, 1,
-0.227061, 0.5461864, -0.7463145, 0, 1, 0.5803922, 1,
-0.222923, 0.3953065, -0.6632224, 0, 1, 0.5843138, 1,
-0.2223492, 1.665415, -0.4845923, 0, 1, 0.5921569, 1,
-0.2203671, 0.06590313, 0.4280259, 0, 1, 0.5960785, 1,
-0.2188229, 0.437013, 0.1133001, 0, 1, 0.6039216, 1,
-0.2176383, -0.2334264, -0.9514324, 0, 1, 0.6117647, 1,
-0.2175501, 0.0492427, -2.551222, 0, 1, 0.6156863, 1,
-0.215538, -0.7240136, -1.9795, 0, 1, 0.6235294, 1,
-0.2146011, -0.6555545, -0.7349554, 0, 1, 0.627451, 1,
-0.2094895, -0.2084195, -3.072651, 0, 1, 0.6352941, 1,
-0.2081694, 0.435217, 0.6722081, 0, 1, 0.6392157, 1,
-0.2061694, 0.8414016, 0.4686329, 0, 1, 0.6470588, 1,
-0.2056721, -2.082911, -2.31442, 0, 1, 0.6509804, 1,
-0.1990412, -0.2421091, -2.637251, 0, 1, 0.6588235, 1,
-0.1980122, -1.197409, -2.381441, 0, 1, 0.6627451, 1,
-0.1907976, -1.117309, -2.413921, 0, 1, 0.6705883, 1,
-0.188282, 0.4113286, 0.07849836, 0, 1, 0.6745098, 1,
-0.1866598, 0.6194682, 0.5147607, 0, 1, 0.682353, 1,
-0.1851169, 1.509626, -0.5549628, 0, 1, 0.6862745, 1,
-0.1849657, 0.6702287, 0.3458475, 0, 1, 0.6941177, 1,
-0.1831223, 0.3734881, -0.5927112, 0, 1, 0.7019608, 1,
-0.1568271, 0.6596649, 0.9636506, 0, 1, 0.7058824, 1,
-0.1556559, 0.9261276, -0.4196437, 0, 1, 0.7137255, 1,
-0.1534871, -1.768856, -1.721778, 0, 1, 0.7176471, 1,
-0.1522132, 0.4744505, -1.737962, 0, 1, 0.7254902, 1,
-0.1500612, -1.594953, -2.542394, 0, 1, 0.7294118, 1,
-0.1465443, -0.7113127, -3.38605, 0, 1, 0.7372549, 1,
-0.1457555, 0.09639822, -0.1291009, 0, 1, 0.7411765, 1,
-0.1405034, 0.5696887, 2.133539, 0, 1, 0.7490196, 1,
-0.1367345, -0.4502622, -2.960696, 0, 1, 0.7529412, 1,
-0.1351677, 2.132817, 0.6292499, 0, 1, 0.7607843, 1,
-0.1298251, 0.6180596, -1.120182, 0, 1, 0.7647059, 1,
-0.1254857, 0.9632006, -1.561229, 0, 1, 0.772549, 1,
-0.1238695, 0.5248663, 0.6568113, 0, 1, 0.7764706, 1,
-0.121464, -1.39505, -3.430353, 0, 1, 0.7843137, 1,
-0.1186058, 0.8564394, 0.1269953, 0, 1, 0.7882353, 1,
-0.1091073, -1.196691, -3.529731, 0, 1, 0.7960784, 1,
-0.1065269, -1.496376, -4.048752, 0, 1, 0.8039216, 1,
-0.1057837, -0.8322197, -3.05745, 0, 1, 0.8078431, 1,
-0.1048457, 1.224407, -0.1079756, 0, 1, 0.8156863, 1,
-0.09869332, -1.178698, -3.412602, 0, 1, 0.8196079, 1,
-0.09834176, 1.175603, -2.16197, 0, 1, 0.827451, 1,
-0.08920308, -0.3425536, -2.159389, 0, 1, 0.8313726, 1,
-0.08905463, -1.020518, -1.92091, 0, 1, 0.8392157, 1,
-0.08573379, -0.01165002, -1.522471, 0, 1, 0.8431373, 1,
-0.08553888, 0.6105458, -1.017818, 0, 1, 0.8509804, 1,
-0.08498122, 1.280133, -0.6644864, 0, 1, 0.854902, 1,
-0.08255035, -0.6833435, -0.8046238, 0, 1, 0.8627451, 1,
-0.07816964, -1.225194, -4.919174, 0, 1, 0.8666667, 1,
-0.07802995, 0.0958515, -0.185094, 0, 1, 0.8745098, 1,
-0.07734661, -0.4381931, -2.01995, 0, 1, 0.8784314, 1,
-0.0768519, 0.01284428, -1.773487, 0, 1, 0.8862745, 1,
-0.0715495, -0.9182519, -3.921697, 0, 1, 0.8901961, 1,
-0.06976241, 0.7140902, 0.9850397, 0, 1, 0.8980392, 1,
-0.06707784, 0.8899913, -0.06259524, 0, 1, 0.9058824, 1,
-0.06504688, -1.696098, -1.178337, 0, 1, 0.9098039, 1,
-0.0608678, 0.5926643, 0.4101481, 0, 1, 0.9176471, 1,
-0.05908928, -0.5340947, -3.794702, 0, 1, 0.9215686, 1,
-0.05879856, -0.258261, -2.551536, 0, 1, 0.9294118, 1,
-0.0584468, 0.8458357, 1.631375, 0, 1, 0.9333333, 1,
-0.05311743, 0.9789531, -1.227355, 0, 1, 0.9411765, 1,
-0.05091273, 1.217073, 0.6778778, 0, 1, 0.945098, 1,
-0.04625724, -0.01956188, -1.564436, 0, 1, 0.9529412, 1,
-0.04088913, 0.2626725, 0.7624243, 0, 1, 0.9568627, 1,
-0.03718157, 0.08235819, -0.5428647, 0, 1, 0.9647059, 1,
-0.03609311, -0.5907055, -1.839706, 0, 1, 0.9686275, 1,
-0.03528617, -2.662774, -5.072486, 0, 1, 0.9764706, 1,
-0.03432292, 0.5821999, 1.574448, 0, 1, 0.9803922, 1,
-0.03027938, -0.1830067, -3.148606, 0, 1, 0.9882353, 1,
-0.02641367, -1.121392, -5.113728, 0, 1, 0.9921569, 1,
-0.02451305, 2.035119, 0.8501271, 0, 1, 1, 1,
-0.01984318, -1.578813, -2.155569, 0, 0.9921569, 1, 1,
-0.01795785, -0.5188326, -3.415247, 0, 0.9882353, 1, 1,
-0.0170469, -1.097675, -5.576183, 0, 0.9803922, 1, 1,
-0.01633489, 1.465441, -2.117033, 0, 0.9764706, 1, 1,
-0.01432918, -0.9515883, -3.591577, 0, 0.9686275, 1, 1,
-0.01190877, 2.264953, -0.9157356, 0, 0.9647059, 1, 1,
-0.01096206, -1.490595, -4.813898, 0, 0.9568627, 1, 1,
-0.005812489, -0.1062958, -1.843754, 0, 0.9529412, 1, 1,
-0.0009924102, -1.008261, -4.415329, 0, 0.945098, 1, 1,
-0.0009827047, 0.8014658, -0.9441364, 0, 0.9411765, 1, 1,
0.004810919, 0.3667917, 1.125048, 0, 0.9333333, 1, 1,
0.009715414, -0.3610264, 3.25762, 0, 0.9294118, 1, 1,
0.01001399, -1.652222, 3.155907, 0, 0.9215686, 1, 1,
0.0164247, -0.1827599, 3.285204, 0, 0.9176471, 1, 1,
0.01707732, -1.907484, 3.140986, 0, 0.9098039, 1, 1,
0.01772362, 0.3242895, 0.4336255, 0, 0.9058824, 1, 1,
0.02749228, -0.2598742, 4.317727, 0, 0.8980392, 1, 1,
0.03179001, -0.2621696, 1.869134, 0, 0.8901961, 1, 1,
0.03205817, -0.3122963, 3.798941, 0, 0.8862745, 1, 1,
0.03496121, 0.02121671, 0.2036978, 0, 0.8784314, 1, 1,
0.04004967, -0.6743252, 3.263155, 0, 0.8745098, 1, 1,
0.040117, -0.1276061, 1.688266, 0, 0.8666667, 1, 1,
0.04436986, 2.030308, -0.3159148, 0, 0.8627451, 1, 1,
0.04696544, -1.219087, 4.416965, 0, 0.854902, 1, 1,
0.04753287, -0.769216, 4.259488, 0, 0.8509804, 1, 1,
0.04870196, 0.3308488, 0.1845037, 0, 0.8431373, 1, 1,
0.05022762, 0.03169162, 0.4597145, 0, 0.8392157, 1, 1,
0.05146647, -0.2447149, 3.632826, 0, 0.8313726, 1, 1,
0.07226973, 0.1994049, 0.007428858, 0, 0.827451, 1, 1,
0.07292219, 0.0357463, 3.427977, 0, 0.8196079, 1, 1,
0.07300652, 0.2050738, -0.2783423, 0, 0.8156863, 1, 1,
0.07340039, 0.5725402, 0.5275813, 0, 0.8078431, 1, 1,
0.07779276, -1.064482, 3.501908, 0, 0.8039216, 1, 1,
0.07830629, -0.8700747, 3.384198, 0, 0.7960784, 1, 1,
0.07913285, 0.7012157, 1.636656, 0, 0.7882353, 1, 1,
0.08411514, 1.105194, 1.250634, 0, 0.7843137, 1, 1,
0.0943709, 0.1741263, 0.669763, 0, 0.7764706, 1, 1,
0.09476068, 1.465212, -1.657951, 0, 0.772549, 1, 1,
0.1006988, -1.754019, 1.169243, 0, 0.7647059, 1, 1,
0.1016953, 0.8245953, -0.9843052, 0, 0.7607843, 1, 1,
0.1025268, 0.9002337, 1.933805, 0, 0.7529412, 1, 1,
0.1057152, 1.778799, 0.121723, 0, 0.7490196, 1, 1,
0.1065646, 0.06944449, 3.090535, 0, 0.7411765, 1, 1,
0.1191789, -0.430464, 2.917826, 0, 0.7372549, 1, 1,
0.1209673, 0.2813683, 1.433731, 0, 0.7294118, 1, 1,
0.1215106, -0.7854619, 3.119721, 0, 0.7254902, 1, 1,
0.123471, -0.03909406, 2.847131, 0, 0.7176471, 1, 1,
0.1272395, -0.301416, 2.461942, 0, 0.7137255, 1, 1,
0.131538, -0.793183, 3.718712, 0, 0.7058824, 1, 1,
0.1330286, 0.3682883, -0.1542976, 0, 0.6980392, 1, 1,
0.1394857, -1.828769, 3.289781, 0, 0.6941177, 1, 1,
0.1398014, -0.1845322, 3.50299, 0, 0.6862745, 1, 1,
0.1538202, 0.5418984, 0.6765095, 0, 0.682353, 1, 1,
0.1554203, -1.108339, 3.178194, 0, 0.6745098, 1, 1,
0.156918, -0.02254619, -0.08849076, 0, 0.6705883, 1, 1,
0.1581797, -0.9354135, 3.588623, 0, 0.6627451, 1, 1,
0.1595961, -0.1468265, 2.11102, 0, 0.6588235, 1, 1,
0.1613813, -0.6813883, 3.788119, 0, 0.6509804, 1, 1,
0.163729, -2.488029, 3.360818, 0, 0.6470588, 1, 1,
0.1669639, -0.8297152, 2.958699, 0, 0.6392157, 1, 1,
0.1680078, 0.302392, -1.211333, 0, 0.6352941, 1, 1,
0.1711746, -2.600018, 1.419786, 0, 0.627451, 1, 1,
0.176311, 0.6435803, -0.6206686, 0, 0.6235294, 1, 1,
0.1867092, 2.280056, 1.950853, 0, 0.6156863, 1, 1,
0.1873673, 0.1252115, 0.8455826, 0, 0.6117647, 1, 1,
0.1905792, 0.8054417, 0.09977368, 0, 0.6039216, 1, 1,
0.1919621, 0.7617165, -1.664714, 0, 0.5960785, 1, 1,
0.1994225, -1.273231, 3.30142, 0, 0.5921569, 1, 1,
0.2001745, 0.3211239, 1.86129, 0, 0.5843138, 1, 1,
0.2024372, -1.025235, 2.137245, 0, 0.5803922, 1, 1,
0.204371, -0.1544293, 0.9677458, 0, 0.572549, 1, 1,
0.2105246, -1.664814, 3.183095, 0, 0.5686275, 1, 1,
0.2119608, -1.308049, 2.878539, 0, 0.5607843, 1, 1,
0.2122532, -0.7945682, 2.378474, 0, 0.5568628, 1, 1,
0.2130744, -0.3911092, 3.262813, 0, 0.5490196, 1, 1,
0.215495, -0.9854464, 2.454057, 0, 0.5450981, 1, 1,
0.2176874, 1.633641, -0.8682731, 0, 0.5372549, 1, 1,
0.2205907, -0.8601711, 1.924085, 0, 0.5333334, 1, 1,
0.2210607, 0.1273425, 2.142156, 0, 0.5254902, 1, 1,
0.2212626, 1.521906, 0.1998469, 0, 0.5215687, 1, 1,
0.2231246, 0.2322235, 1.536513, 0, 0.5137255, 1, 1,
0.2277272, 0.2118301, -0.3171938, 0, 0.509804, 1, 1,
0.2305349, 0.2107462, -0.8332433, 0, 0.5019608, 1, 1,
0.2324664, -1.22949, 0.8338465, 0, 0.4941176, 1, 1,
0.2387892, -0.582674, 2.759063, 0, 0.4901961, 1, 1,
0.2417275, 0.9420535, 0.4049667, 0, 0.4823529, 1, 1,
0.2427812, 0.6287078, 1.205984, 0, 0.4784314, 1, 1,
0.2451258, 1.408912, 0.00824837, 0, 0.4705882, 1, 1,
0.2469267, 1.809472, 0.3217049, 0, 0.4666667, 1, 1,
0.2480097, 0.2596543, 2.796825, 0, 0.4588235, 1, 1,
0.2485304, 0.3291562, 0.7007574, 0, 0.454902, 1, 1,
0.2486617, 1.591043, -0.1537366, 0, 0.4470588, 1, 1,
0.255462, -0.6169905, 2.173916, 0, 0.4431373, 1, 1,
0.259893, 0.524288, 1.381122, 0, 0.4352941, 1, 1,
0.2626456, -1.481683, 4.706622, 0, 0.4313726, 1, 1,
0.2631755, 0.7211309, 0.3693074, 0, 0.4235294, 1, 1,
0.2709374, -0.8397973, 4.105668, 0, 0.4196078, 1, 1,
0.2710108, -0.1993319, 1.765151, 0, 0.4117647, 1, 1,
0.2712725, -0.493366, 1.89948, 0, 0.4078431, 1, 1,
0.2737623, 0.81897, 0.3393902, 0, 0.4, 1, 1,
0.2831672, 0.4728167, 0.5266745, 0, 0.3921569, 1, 1,
0.286376, -0.2484183, 1.487465, 0, 0.3882353, 1, 1,
0.2864351, 0.2006186, 1.519191, 0, 0.3803922, 1, 1,
0.2885615, -1.103735, 3.138022, 0, 0.3764706, 1, 1,
0.2911544, -0.5348636, 3.64439, 0, 0.3686275, 1, 1,
0.2914222, 0.1912773, 0.4795267, 0, 0.3647059, 1, 1,
0.2917179, -1.240879, 2.001652, 0, 0.3568628, 1, 1,
0.2982231, 1.408465, 0.5276233, 0, 0.3529412, 1, 1,
0.2992637, -0.8675419, 0.5856614, 0, 0.345098, 1, 1,
0.3035847, -0.1689002, -0.04233281, 0, 0.3411765, 1, 1,
0.3056359, 0.7001719, 0.9751035, 0, 0.3333333, 1, 1,
0.305777, -0.2641012, -0.6502277, 0, 0.3294118, 1, 1,
0.3074248, -1.484218, 4.64408, 0, 0.3215686, 1, 1,
0.3099105, 0.4593968, 1.773665, 0, 0.3176471, 1, 1,
0.3112041, -0.1834371, 4.333542, 0, 0.3098039, 1, 1,
0.3118868, -0.2276708, 1.964468, 0, 0.3058824, 1, 1,
0.3145685, 0.8966249, 0.1834621, 0, 0.2980392, 1, 1,
0.3235638, -1.684591, 3.406008, 0, 0.2901961, 1, 1,
0.3286927, 0.4140637, 0.8376342, 0, 0.2862745, 1, 1,
0.3296561, 0.503502, 2.347401, 0, 0.2784314, 1, 1,
0.3325708, -0.6278074, 2.841914, 0, 0.2745098, 1, 1,
0.3371166, -0.2200816, 0.4425751, 0, 0.2666667, 1, 1,
0.3377789, 0.2131361, 2.68886, 0, 0.2627451, 1, 1,
0.3430615, -0.2676224, 0.1679163, 0, 0.254902, 1, 1,
0.344025, -0.7464056, 5.351177, 0, 0.2509804, 1, 1,
0.3452012, 0.9003018, -0.1024386, 0, 0.2431373, 1, 1,
0.3464979, 0.7146307, 0.362386, 0, 0.2392157, 1, 1,
0.3477117, -0.5583173, 2.828098, 0, 0.2313726, 1, 1,
0.3502689, 0.5814825, 0.7158968, 0, 0.227451, 1, 1,
0.3519205, -1.982344, 3.933449, 0, 0.2196078, 1, 1,
0.3553057, -0.462289, 2.016548, 0, 0.2156863, 1, 1,
0.3588799, -0.8251862, 2.969538, 0, 0.2078431, 1, 1,
0.3628193, 1.506944, 0.5970813, 0, 0.2039216, 1, 1,
0.3629738, -0.386159, 2.505283, 0, 0.1960784, 1, 1,
0.363723, 1.133423, 0.5654015, 0, 0.1882353, 1, 1,
0.3697287, 0.11351, 1.728242, 0, 0.1843137, 1, 1,
0.3709741, 1.490691, -2.474188, 0, 0.1764706, 1, 1,
0.3739378, 0.2859673, 1.465401, 0, 0.172549, 1, 1,
0.3799838, 0.06223481, 0.6123415, 0, 0.1647059, 1, 1,
0.3802223, 1.701103, 0.5902519, 0, 0.1607843, 1, 1,
0.3839417, -1.041727, 1.156169, 0, 0.1529412, 1, 1,
0.3840712, 1.214965, -0.9769853, 0, 0.1490196, 1, 1,
0.3850282, -0.704165, 1.983227, 0, 0.1411765, 1, 1,
0.3854307, -0.9734878, 3.393447, 0, 0.1372549, 1, 1,
0.3871607, 3.161514, -0.0008948553, 0, 0.1294118, 1, 1,
0.3873502, 0.009994919, 1.890615, 0, 0.1254902, 1, 1,
0.38903, -1.554809, 3.840141, 0, 0.1176471, 1, 1,
0.3907019, -0.8759873, 2.693468, 0, 0.1137255, 1, 1,
0.3914673, 0.5583916, 0.4538021, 0, 0.1058824, 1, 1,
0.3962787, -1.929305, 2.786187, 0, 0.09803922, 1, 1,
0.4021022, 0.286364, -0.3806758, 0, 0.09411765, 1, 1,
0.4021971, -0.1084478, 1.60805, 0, 0.08627451, 1, 1,
0.4068284, -1.500057, 2.944715, 0, 0.08235294, 1, 1,
0.4074687, 1.003274, 0.5457331, 0, 0.07450981, 1, 1,
0.4081739, 0.7227923, -0.2299727, 0, 0.07058824, 1, 1,
0.4102684, -0.2248311, 0.5968609, 0, 0.0627451, 1, 1,
0.4146161, -0.7358986, 2.574385, 0, 0.05882353, 1, 1,
0.4165197, 0.02050043, 1.984486, 0, 0.05098039, 1, 1,
0.4190584, -1.570479, 3.230584, 0, 0.04705882, 1, 1,
0.4203828, -0.2511801, 2.426161, 0, 0.03921569, 1, 1,
0.424519, 0.4095004, 1.343447, 0, 0.03529412, 1, 1,
0.4330649, -2.127873, 3.501086, 0, 0.02745098, 1, 1,
0.4345663, 0.6786879, 0.6943799, 0, 0.02352941, 1, 1,
0.4442362, -2.034258, 1.619445, 0, 0.01568628, 1, 1,
0.4446464, 1.194252, 0.9116128, 0, 0.01176471, 1, 1,
0.4485017, -0.5225557, 1.76102, 0, 0.003921569, 1, 1,
0.4529294, 0.2432591, 0.9206882, 0.003921569, 0, 1, 1,
0.4550127, -1.183121, 3.564687, 0.007843138, 0, 1, 1,
0.4598316, -0.477131, 4.006179, 0.01568628, 0, 1, 1,
0.461008, 0.6972865, -1.289265, 0.01960784, 0, 1, 1,
0.4612154, -3.076544, 3.465626, 0.02745098, 0, 1, 1,
0.4615007, -1.93757, 2.643721, 0.03137255, 0, 1, 1,
0.464498, 1.202623, -0.3755114, 0.03921569, 0, 1, 1,
0.4649324, -0.4201016, 1.335704, 0.04313726, 0, 1, 1,
0.4679565, 0.3169226, 2.127239, 0.05098039, 0, 1, 1,
0.4697981, 1.846263, 0.7826679, 0.05490196, 0, 1, 1,
0.4727399, 0.212715, 1.09338, 0.0627451, 0, 1, 1,
0.4745763, 1.9443, -0.5674985, 0.06666667, 0, 1, 1,
0.4784428, 0.734128, -2.205318, 0.07450981, 0, 1, 1,
0.4861387, 0.1223147, 1.818179, 0.07843138, 0, 1, 1,
0.4867991, 0.3595278, 2.285113, 0.08627451, 0, 1, 1,
0.4876878, -0.2049647, 1.284951, 0.09019608, 0, 1, 1,
0.4915744, 0.8769578, 2.033271, 0.09803922, 0, 1, 1,
0.4923424, 0.2936224, 1.739353, 0.1058824, 0, 1, 1,
0.4955846, 0.06102164, 1.968308, 0.1098039, 0, 1, 1,
0.4983585, 1.476252, 0.6572517, 0.1176471, 0, 1, 1,
0.5073752, 1.647025, 1.230813, 0.1215686, 0, 1, 1,
0.50877, -0.2624727, 2.484283, 0.1294118, 0, 1, 1,
0.5091087, -0.4514742, 3.660437, 0.1333333, 0, 1, 1,
0.5094392, -0.976241, 2.313215, 0.1411765, 0, 1, 1,
0.510213, 1.10503, 1.42006, 0.145098, 0, 1, 1,
0.5118342, 1.238942, -0.3795241, 0.1529412, 0, 1, 1,
0.5129601, -1.075713, 3.831547, 0.1568628, 0, 1, 1,
0.5210602, 0.413798, 0.3000776, 0.1647059, 0, 1, 1,
0.5212635, -0.3918231, 2.917213, 0.1686275, 0, 1, 1,
0.5230491, 1.453298, 1.152726, 0.1764706, 0, 1, 1,
0.5254067, -2.435435, 2.474306, 0.1803922, 0, 1, 1,
0.5264358, -0.1324355, 2.608617, 0.1882353, 0, 1, 1,
0.5315586, 0.579182, -0.5359663, 0.1921569, 0, 1, 1,
0.5326938, 0.3433811, 1.515209, 0.2, 0, 1, 1,
0.5343667, 0.07293618, 1.689195, 0.2078431, 0, 1, 1,
0.5389411, -1.133098, 3.722694, 0.2117647, 0, 1, 1,
0.5461376, 2.130208, -0.1075837, 0.2196078, 0, 1, 1,
0.5470442, -1.656723, 2.262075, 0.2235294, 0, 1, 1,
0.5491785, -0.00282224, 0.1964532, 0.2313726, 0, 1, 1,
0.554546, 1.718714, 0.2702931, 0.2352941, 0, 1, 1,
0.5554768, 0.3781167, 1.557865, 0.2431373, 0, 1, 1,
0.5569384, -0.2411421, 0.2882544, 0.2470588, 0, 1, 1,
0.5577863, -0.6394519, 1.878679, 0.254902, 0, 1, 1,
0.5579963, 0.07110796, 0.5188034, 0.2588235, 0, 1, 1,
0.5591477, 1.466686, 0.6181189, 0.2666667, 0, 1, 1,
0.5610811, 0.2563682, 1.211368, 0.2705882, 0, 1, 1,
0.5618364, 0.6347003, 0.2387801, 0.2784314, 0, 1, 1,
0.5663213, -0.2915165, 1.980638, 0.282353, 0, 1, 1,
0.5670264, 1.131809, -0.1549028, 0.2901961, 0, 1, 1,
0.5677502, 0.4450975, 0.03816375, 0.2941177, 0, 1, 1,
0.5698698, -0.3467591, 2.488651, 0.3019608, 0, 1, 1,
0.5707794, 1.133959, 1.908371, 0.3098039, 0, 1, 1,
0.5732378, 0.4145262, 3.11399, 0.3137255, 0, 1, 1,
0.5740822, 0.3273754, 0.6464573, 0.3215686, 0, 1, 1,
0.5741376, -0.4201518, 1.842759, 0.3254902, 0, 1, 1,
0.5771978, 0.5084519, -0.7857231, 0.3333333, 0, 1, 1,
0.578146, -1.191071, 1.626508, 0.3372549, 0, 1, 1,
0.5820292, -0.2457251, 1.611013, 0.345098, 0, 1, 1,
0.5828686, -0.2699572, 0.5178049, 0.3490196, 0, 1, 1,
0.587472, 1.540856, -1.2204, 0.3568628, 0, 1, 1,
0.5892251, -0.7418143, 2.454928, 0.3607843, 0, 1, 1,
0.5982535, 0.1599298, 2.236419, 0.3686275, 0, 1, 1,
0.6019198, 0.424289, 3.144169, 0.372549, 0, 1, 1,
0.60347, -0.157029, 1.796897, 0.3803922, 0, 1, 1,
0.6042692, -0.9381265, 3.322043, 0.3843137, 0, 1, 1,
0.6053801, -0.3063839, 1.158103, 0.3921569, 0, 1, 1,
0.611469, 0.5807952, -0.7939386, 0.3960784, 0, 1, 1,
0.6130623, -0.2837937, 2.67881, 0.4039216, 0, 1, 1,
0.6142407, 0.2482463, 2.874622, 0.4117647, 0, 1, 1,
0.6170525, 0.1894297, 2.639597, 0.4156863, 0, 1, 1,
0.6179535, 1.797235, 0.2841444, 0.4235294, 0, 1, 1,
0.6191456, -1.10385, 2.367245, 0.427451, 0, 1, 1,
0.6257533, 0.2134338, 2.17024, 0.4352941, 0, 1, 1,
0.630419, 1.291696, 2.174519, 0.4392157, 0, 1, 1,
0.6365679, 0.2699093, 1.310091, 0.4470588, 0, 1, 1,
0.6368377, -1.344364, 2.347132, 0.4509804, 0, 1, 1,
0.6447992, 0.08034267, 2.21581, 0.4588235, 0, 1, 1,
0.6567884, -0.8744327, 4.322728, 0.4627451, 0, 1, 1,
0.6572412, 1.085585, -1.318615, 0.4705882, 0, 1, 1,
0.6629493, -0.9033303, 2.887269, 0.4745098, 0, 1, 1,
0.6638939, -0.3968651, 1.301185, 0.4823529, 0, 1, 1,
0.6677458, 0.7885626, -0.3700951, 0.4862745, 0, 1, 1,
0.6692558, -1.662362, 1.460233, 0.4941176, 0, 1, 1,
0.6717011, 0.05525026, 1.15423, 0.5019608, 0, 1, 1,
0.6837876, 0.5000948, 1.701482, 0.5058824, 0, 1, 1,
0.6839807, 0.1800187, 2.383032, 0.5137255, 0, 1, 1,
0.6845694, 1.120994, 1.126178, 0.5176471, 0, 1, 1,
0.6863907, -0.5121064, 2.888034, 0.5254902, 0, 1, 1,
0.6988102, 0.003982369, 1.171567, 0.5294118, 0, 1, 1,
0.7037556, -0.4382013, 2.006871, 0.5372549, 0, 1, 1,
0.7094575, 0.7571317, 1.424649, 0.5411765, 0, 1, 1,
0.711118, -1.013949, 1.189484, 0.5490196, 0, 1, 1,
0.7117612, -1.673247, 3.026408, 0.5529412, 0, 1, 1,
0.7124509, 2.102088, -0.03296619, 0.5607843, 0, 1, 1,
0.7163244, -0.8922298, 4.175709, 0.5647059, 0, 1, 1,
0.7171293, -0.7408597, 3.370215, 0.572549, 0, 1, 1,
0.7178124, 0.07571037, 0.6950961, 0.5764706, 0, 1, 1,
0.7257277, -0.1469752, 1.857441, 0.5843138, 0, 1, 1,
0.7324862, 1.229223, -0.4843911, 0.5882353, 0, 1, 1,
0.7343305, 0.129458, 2.277634, 0.5960785, 0, 1, 1,
0.7449331, 0.5023578, 1.148095, 0.6039216, 0, 1, 1,
0.7458161, 0.7234089, 0.5031305, 0.6078432, 0, 1, 1,
0.7503893, 0.6853092, 0.8150024, 0.6156863, 0, 1, 1,
0.7507924, 0.1565625, 1.96832, 0.6196079, 0, 1, 1,
0.7536875, 0.4565423, 0.9367812, 0.627451, 0, 1, 1,
0.7544396, 0.2763969, 1.84989, 0.6313726, 0, 1, 1,
0.7574592, -1.326296, 3.623235, 0.6392157, 0, 1, 1,
0.7602447, 1.840408, 0.5086086, 0.6431373, 0, 1, 1,
0.7613624, 1.368909, 1.356929, 0.6509804, 0, 1, 1,
0.7647126, 0.6346812, 1.502804, 0.654902, 0, 1, 1,
0.7654853, 0.4063753, -0.9224108, 0.6627451, 0, 1, 1,
0.7728928, -0.06010257, 0.3971293, 0.6666667, 0, 1, 1,
0.7752734, 0.4187627, 2.6266, 0.6745098, 0, 1, 1,
0.7841942, 0.7871823, 0.7880732, 0.6784314, 0, 1, 1,
0.7935865, 1.624923, 0.9445742, 0.6862745, 0, 1, 1,
0.7936831, -0.3900313, 2.32252, 0.6901961, 0, 1, 1,
0.7952123, -0.777221, 1.424391, 0.6980392, 0, 1, 1,
0.7963746, -1.303907, 1.389193, 0.7058824, 0, 1, 1,
0.7973345, 0.7096064, 0.9583141, 0.7098039, 0, 1, 1,
0.7977509, -0.1669894, -0.4756335, 0.7176471, 0, 1, 1,
0.8003733, -0.7779173, 3.934687, 0.7215686, 0, 1, 1,
0.8141261, -0.5432839, 1.061754, 0.7294118, 0, 1, 1,
0.8146468, -0.3659453, 1.871329, 0.7333333, 0, 1, 1,
0.8180541, -0.00275874, 0.8728348, 0.7411765, 0, 1, 1,
0.8278884, -0.479476, 2.240298, 0.7450981, 0, 1, 1,
0.8314715, 1.472472, -0.5893633, 0.7529412, 0, 1, 1,
0.8392056, 0.2469032, 2.27447, 0.7568628, 0, 1, 1,
0.8483802, 0.02172689, 4.114711, 0.7647059, 0, 1, 1,
0.8549263, 0.3428332, 0.2737495, 0.7686275, 0, 1, 1,
0.856903, -1.316723, 2.781179, 0.7764706, 0, 1, 1,
0.8579352, -1.222889, 1.82852, 0.7803922, 0, 1, 1,
0.8603449, 0.2095152, 2.467076, 0.7882353, 0, 1, 1,
0.8609624, 1.06885, 0.7768694, 0.7921569, 0, 1, 1,
0.8618209, -2.007544, 1.19034, 0.8, 0, 1, 1,
0.8636901, -0.4264443, -0.590597, 0.8078431, 0, 1, 1,
0.871251, 1.344753, -0.5682419, 0.8117647, 0, 1, 1,
0.8763542, 0.568541, 2.699575, 0.8196079, 0, 1, 1,
0.8799104, 0.5527275, 2.532527, 0.8235294, 0, 1, 1,
0.8802333, 1.952531, -0.08390318, 0.8313726, 0, 1, 1,
0.8919424, 1.239667, 0.2223727, 0.8352941, 0, 1, 1,
0.893029, -1.064746, 2.844141, 0.8431373, 0, 1, 1,
0.8998713, 0.3166551, 0.8305364, 0.8470588, 0, 1, 1,
0.9042567, 0.8885893, 1.514941, 0.854902, 0, 1, 1,
0.905427, 1.492419, 2.73436, 0.8588235, 0, 1, 1,
0.9117091, -1.87314, 2.812175, 0.8666667, 0, 1, 1,
0.9119592, 0.4172738, 1.476493, 0.8705882, 0, 1, 1,
0.9153722, 0.2375423, 0.03597538, 0.8784314, 0, 1, 1,
0.9172511, 1.122397, -1.05018, 0.8823529, 0, 1, 1,
0.9181083, -0.6736089, 2.17112, 0.8901961, 0, 1, 1,
0.9187864, -0.09232239, 1.971064, 0.8941177, 0, 1, 1,
0.9311991, -0.9373636, 2.806381, 0.9019608, 0, 1, 1,
0.9314941, 0.6864206, 1.202327, 0.9098039, 0, 1, 1,
0.9362431, -0.7281039, 2.318735, 0.9137255, 0, 1, 1,
0.9421778, 1.601005, 0.5084192, 0.9215686, 0, 1, 1,
0.9440229, -0.6677541, 2.648773, 0.9254902, 0, 1, 1,
0.9500815, 0.7420287, 0.2446405, 0.9333333, 0, 1, 1,
0.9516076, -0.1870177, 1.303706, 0.9372549, 0, 1, 1,
0.9529173, -0.7287872, 1.814757, 0.945098, 0, 1, 1,
0.9539098, 0.3496934, 3.091659, 0.9490196, 0, 1, 1,
0.9595944, 1.019009, -0.8022775, 0.9568627, 0, 1, 1,
0.9633573, -1.090692, 3.537509, 0.9607843, 0, 1, 1,
0.9647402, 0.4929405, 1.153449, 0.9686275, 0, 1, 1,
0.9666004, -0.1096684, 0.9224308, 0.972549, 0, 1, 1,
0.9701227, -1.526959, 3.42738, 0.9803922, 0, 1, 1,
0.978282, -0.03713807, 0.6148411, 0.9843137, 0, 1, 1,
0.9897582, -0.17555, 1.690682, 0.9921569, 0, 1, 1,
0.9906752, -1.272496, 2.531552, 0.9960784, 0, 1, 1,
0.9925273, -2.029775, 3.95551, 1, 0, 0.9960784, 1,
0.9925853, -0.4501522, 2.595835, 1, 0, 0.9882353, 1,
0.9928811, 0.5987576, 0.5588841, 1, 0, 0.9843137, 1,
0.9939006, -1.220734, 2.906573, 1, 0, 0.9764706, 1,
1.004075, 1.054702, 0.03117127, 1, 0, 0.972549, 1,
1.012108, 1.501675, 1.596003, 1, 0, 0.9647059, 1,
1.01521, 0.2520676, 1.860738, 1, 0, 0.9607843, 1,
1.021758, 0.823078, 0.6531894, 1, 0, 0.9529412, 1,
1.022135, -0.8709388, 2.295966, 1, 0, 0.9490196, 1,
1.022525, -1.057934, 2.546902, 1, 0, 0.9411765, 1,
1.023304, 1.120354, 1.036726, 1, 0, 0.9372549, 1,
1.02407, 0.9514825, 3.475268, 1, 0, 0.9294118, 1,
1.025366, 0.3832871, 1.501942, 1, 0, 0.9254902, 1,
1.031159, 0.5329849, 0.567663, 1, 0, 0.9176471, 1,
1.033768, 1.063725, 2.235904, 1, 0, 0.9137255, 1,
1.035772, 0.777158, 0.2885803, 1, 0, 0.9058824, 1,
1.037708, 1.637725, 1.814607, 1, 0, 0.9019608, 1,
1.038717, 0.6923177, 0.1905296, 1, 0, 0.8941177, 1,
1.046637, 0.8099707, -1.106367, 1, 0, 0.8862745, 1,
1.05852, 0.4316964, 1.80261, 1, 0, 0.8823529, 1,
1.071567, -0.6499873, 1.644563, 1, 0, 0.8745098, 1,
1.07326, -0.0281117, 1.098016, 1, 0, 0.8705882, 1,
1.074886, 0.8341777, -0.1434194, 1, 0, 0.8627451, 1,
1.075579, 0.1921453, 1.256723, 1, 0, 0.8588235, 1,
1.078292, -1.62451, 2.52462, 1, 0, 0.8509804, 1,
1.079571, -1.362861, 4.461086, 1, 0, 0.8470588, 1,
1.086499, 0.3868146, 0.4195308, 1, 0, 0.8392157, 1,
1.094767, -0.005504207, 2.368828, 1, 0, 0.8352941, 1,
1.102182, 0.8488863, 1.394565, 1, 0, 0.827451, 1,
1.108635, -0.1434558, 2.168925, 1, 0, 0.8235294, 1,
1.113028, 0.1294366, 2.500718, 1, 0, 0.8156863, 1,
1.11379, -2.065484, 3.185596, 1, 0, 0.8117647, 1,
1.115096, 0.1084214, 0.9021673, 1, 0, 0.8039216, 1,
1.115142, -1.520196, 0.9828703, 1, 0, 0.7960784, 1,
1.115641, -0.1810625, 0.3947161, 1, 0, 0.7921569, 1,
1.117945, -0.2682303, 1.782362, 1, 0, 0.7843137, 1,
1.122726, -0.2601215, 1.669563, 1, 0, 0.7803922, 1,
1.125689, 0.7231398, 0.8713528, 1, 0, 0.772549, 1,
1.128102, -1.483522, 2.205257, 1, 0, 0.7686275, 1,
1.133276, 0.4915597, 1.874526, 1, 0, 0.7607843, 1,
1.135165, -0.6246317, 0.2507622, 1, 0, 0.7568628, 1,
1.135311, 0.1074106, 1.063934, 1, 0, 0.7490196, 1,
1.135599, 1.096683, 3.115045, 1, 0, 0.7450981, 1,
1.136972, -0.3904638, 3.305734, 1, 0, 0.7372549, 1,
1.137463, 1.077824, -0.6249971, 1, 0, 0.7333333, 1,
1.138787, -0.2653449, 1.892712, 1, 0, 0.7254902, 1,
1.145738, 0.1621725, 0.6251495, 1, 0, 0.7215686, 1,
1.149614, -1.677279, 3.308666, 1, 0, 0.7137255, 1,
1.153058, 0.9370031, 1.829732, 1, 0, 0.7098039, 1,
1.16353, -0.3128907, 2.617198, 1, 0, 0.7019608, 1,
1.168003, 1.038252, 0.5358605, 1, 0, 0.6941177, 1,
1.175794, -0.2224346, 1.735134, 1, 0, 0.6901961, 1,
1.180224, -1.392842, 2.72259, 1, 0, 0.682353, 1,
1.181487, 1.187774, 0.8828599, 1, 0, 0.6784314, 1,
1.195159, 0.03055161, -0.840109, 1, 0, 0.6705883, 1,
1.198438, 0.08980415, 1.301663, 1, 0, 0.6666667, 1,
1.200987, 0.09115971, 3.72017, 1, 0, 0.6588235, 1,
1.202327, -0.2049714, 2.650475, 1, 0, 0.654902, 1,
1.203626, -0.6055636, 2.213057, 1, 0, 0.6470588, 1,
1.213929, 1.226475, 0.6419151, 1, 0, 0.6431373, 1,
1.214304, 0.7633628, -0.4609883, 1, 0, 0.6352941, 1,
1.232468, 0.4687821, 2.356391, 1, 0, 0.6313726, 1,
1.236406, 0.04507448, 1.722674, 1, 0, 0.6235294, 1,
1.236618, -1.035077, 3.900744, 1, 0, 0.6196079, 1,
1.24382, -0.224982, 1.669293, 1, 0, 0.6117647, 1,
1.248827, 0.7344311, 0.2713725, 1, 0, 0.6078432, 1,
1.250652, 0.8005847, -0.05862541, 1, 0, 0.6, 1,
1.250983, 0.8984092, 1.796443, 1, 0, 0.5921569, 1,
1.251664, 0.9496109, -0.00717127, 1, 0, 0.5882353, 1,
1.259066, -0.3396167, 1.381899, 1, 0, 0.5803922, 1,
1.261029, -0.4850264, 1.962583, 1, 0, 0.5764706, 1,
1.261844, 0.8547643, 1.644174, 1, 0, 0.5686275, 1,
1.26351, 0.4067863, 0.765488, 1, 0, 0.5647059, 1,
1.263526, -0.791937, 3.336274, 1, 0, 0.5568628, 1,
1.267838, -0.01224738, 3.799662, 1, 0, 0.5529412, 1,
1.272333, -1.701394, 3.138961, 1, 0, 0.5450981, 1,
1.292912, 0.4682101, 2.029073, 1, 0, 0.5411765, 1,
1.298287, -0.497509, 3.430214, 1, 0, 0.5333334, 1,
1.298324, 0.506724, 3.429101, 1, 0, 0.5294118, 1,
1.298329, 0.2460495, 0.2477207, 1, 0, 0.5215687, 1,
1.30287, 0.7186857, 0.01346576, 1, 0, 0.5176471, 1,
1.30779, 1.561869, 0.1362392, 1, 0, 0.509804, 1,
1.313017, -0.2845626, 2.022305, 1, 0, 0.5058824, 1,
1.321162, 0.4860075, 0.9624934, 1, 0, 0.4980392, 1,
1.331106, 0.550997, 1.38142, 1, 0, 0.4901961, 1,
1.346626, 0.1175155, 1.922961, 1, 0, 0.4862745, 1,
1.353588, -1.648014, 2.104388, 1, 0, 0.4784314, 1,
1.366353, -0.6459636, 2.238883, 1, 0, 0.4745098, 1,
1.376263, 0.03170978, 2.379898, 1, 0, 0.4666667, 1,
1.378086, 0.8907551, 1.378426, 1, 0, 0.4627451, 1,
1.382812, -1.264304, 1.936628, 1, 0, 0.454902, 1,
1.390373, 0.3687495, 1.3261, 1, 0, 0.4509804, 1,
1.400823, 0.9703545, 0.9086061, 1, 0, 0.4431373, 1,
1.403533, -0.2259023, 2.82434, 1, 0, 0.4392157, 1,
1.414224, 2.185397, 0.8197519, 1, 0, 0.4313726, 1,
1.424328, -0.6874456, 1.49668, 1, 0, 0.427451, 1,
1.437177, -1.234797, 0.02043953, 1, 0, 0.4196078, 1,
1.437407, 0.2752671, 1.110548, 1, 0, 0.4156863, 1,
1.448336, -0.2020209, 3.316981, 1, 0, 0.4078431, 1,
1.45208, -1.673057, 2.160838, 1, 0, 0.4039216, 1,
1.45664, 2.072019, 1.872661, 1, 0, 0.3960784, 1,
1.460927, 1.853694, 1.0975, 1, 0, 0.3882353, 1,
1.461806, 1.133711, 1.422675, 1, 0, 0.3843137, 1,
1.464744, -1.201372, 1.918348, 1, 0, 0.3764706, 1,
1.477563, -0.6727602, 2.587069, 1, 0, 0.372549, 1,
1.48918, -0.714559, 2.104076, 1, 0, 0.3647059, 1,
1.491613, 1.090079, 1.095589, 1, 0, 0.3607843, 1,
1.493124, -0.8033671, 3.570163, 1, 0, 0.3529412, 1,
1.503148, -0.2738791, 2.620602, 1, 0, 0.3490196, 1,
1.508457, 1.889678, 2.002568, 1, 0, 0.3411765, 1,
1.530719, 1.550945, -0.6313663, 1, 0, 0.3372549, 1,
1.532576, -1.204578, 2.904228, 1, 0, 0.3294118, 1,
1.532787, -0.7727723, 1.55341, 1, 0, 0.3254902, 1,
1.543492, 1.077062, 0.2673928, 1, 0, 0.3176471, 1,
1.550957, -1.318025, 2.897017, 1, 0, 0.3137255, 1,
1.551581, -0.002962002, 0.8514271, 1, 0, 0.3058824, 1,
1.556062, -0.9605733, 0.6118528, 1, 0, 0.2980392, 1,
1.567012, 0.03734295, 0.3950174, 1, 0, 0.2941177, 1,
1.585236, -1.652653, 2.926168, 1, 0, 0.2862745, 1,
1.624252, 2.923752, -0.7068796, 1, 0, 0.282353, 1,
1.640343, 1.576681, -0.7511847, 1, 0, 0.2745098, 1,
1.65693, -0.9435121, 2.401151, 1, 0, 0.2705882, 1,
1.66696, 0.9510025, 1.755703, 1, 0, 0.2627451, 1,
1.670084, -0.6073815, 2.286657, 1, 0, 0.2588235, 1,
1.680205, 0.7817701, 0.5690635, 1, 0, 0.2509804, 1,
1.687112, 1.678449, 0.2269658, 1, 0, 0.2470588, 1,
1.697736, 0.06081578, 3.345913, 1, 0, 0.2392157, 1,
1.710402, -1.649849, 2.827163, 1, 0, 0.2352941, 1,
1.725987, -0.6240668, 3.591185, 1, 0, 0.227451, 1,
1.726316, 0.8321545, 1.384616, 1, 0, 0.2235294, 1,
1.726686, 1.327603, 2.256241, 1, 0, 0.2156863, 1,
1.72941, -0.04179197, 2.048568, 1, 0, 0.2117647, 1,
1.738298, 0.1618587, 2.253272, 1, 0, 0.2039216, 1,
1.742892, -0.7014955, 0.6737633, 1, 0, 0.1960784, 1,
1.768198, -0.5735601, 1.237703, 1, 0, 0.1921569, 1,
1.769346, -1.084529, 2.022052, 1, 0, 0.1843137, 1,
1.822403, 0.8068571, 1.039101, 1, 0, 0.1803922, 1,
1.822513, -0.9669167, 1.908964, 1, 0, 0.172549, 1,
1.828321, 0.4165929, 2.266143, 1, 0, 0.1686275, 1,
1.828942, 0.3066983, 1.903473, 1, 0, 0.1607843, 1,
1.854717, -0.0821417, 1.8573, 1, 0, 0.1568628, 1,
1.857253, -0.01726791, 1.189521, 1, 0, 0.1490196, 1,
1.888796, -0.03342244, 0.6488067, 1, 0, 0.145098, 1,
1.889268, 0.8372148, -1.172616, 1, 0, 0.1372549, 1,
1.904035, 0.7177502, 0.4903572, 1, 0, 0.1333333, 1,
1.920805, -1.221905, 4.039839, 1, 0, 0.1254902, 1,
1.948323, -0.6089093, 3.019637, 1, 0, 0.1215686, 1,
1.979705, -0.2314126, -0.7205139, 1, 0, 0.1137255, 1,
1.99109, -0.2828283, 1.412566, 1, 0, 0.1098039, 1,
2.001775, -1.637655, 1.904819, 1, 0, 0.1019608, 1,
2.033293, 0.4374397, 1.482627, 1, 0, 0.09411765, 1,
2.040602, 0.3791717, 2.485412, 1, 0, 0.09019608, 1,
2.05153, 0.5394312, 2.380519, 1, 0, 0.08235294, 1,
2.051855, -0.0266479, 1.846503, 1, 0, 0.07843138, 1,
2.145036, 0.4335218, 1.378798, 1, 0, 0.07058824, 1,
2.147705, 0.09097861, 0.9752304, 1, 0, 0.06666667, 1,
2.159276, -0.7868676, 0.3606871, 1, 0, 0.05882353, 1,
2.200565, -1.031071, 4.195589, 1, 0, 0.05490196, 1,
2.256493, 0.02942575, 0.02944288, 1, 0, 0.04705882, 1,
2.261395, -0.3231202, 1.70728, 1, 0, 0.04313726, 1,
2.290833, 0.9005126, 0.7744229, 1, 0, 0.03529412, 1,
2.340754, 0.6455604, 0.46905, 1, 0, 0.03137255, 1,
2.399842, -1.48385, 0.7818808, 1, 0, 0.02352941, 1,
2.460093, 3.20426, 0.3944541, 1, 0, 0.01960784, 1,
2.57071, -1.090705, 4.385811, 1, 0, 0.01176471, 1,
2.797558, 0.01443123, 0.7371227, 1, 0, 0.007843138, 1
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
-0.1135974, -5.560554, -7.532892, 0, -0.5, 0.5, 0.5,
-0.1135974, -5.560554, -7.532892, 1, -0.5, 0.5, 0.5,
-0.1135974, -5.560554, -7.532892, 1, 1.5, 0.5, 0.5,
-0.1135974, -5.560554, -7.532892, 0, 1.5, 0.5, 0.5
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
-4.011634, -0.3756939, -7.532892, 0, -0.5, 0.5, 0.5,
-4.011634, -0.3756939, -7.532892, 1, -0.5, 0.5, 0.5,
-4.011634, -0.3756939, -7.532892, 1, 1.5, 0.5, 0.5,
-4.011634, -0.3756939, -7.532892, 0, 1.5, 0.5, 0.5
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
-4.011634, -5.560554, -0.1571894, 0, -0.5, 0.5, 0.5,
-4.011634, -5.560554, -0.1571894, 1, -0.5, 0.5, 0.5,
-4.011634, -5.560554, -0.1571894, 1, 1.5, 0.5, 0.5,
-4.011634, -5.560554, -0.1571894, 0, 1.5, 0.5, 0.5
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
-3, -4.364048, -5.830806,
2, -4.364048, -5.830806,
-3, -4.364048, -5.830806,
-3, -4.563466, -6.114487,
-2, -4.364048, -5.830806,
-2, -4.563466, -6.114487,
-1, -4.364048, -5.830806,
-1, -4.563466, -6.114487,
0, -4.364048, -5.830806,
0, -4.563466, -6.114487,
1, -4.364048, -5.830806,
1, -4.563466, -6.114487,
2, -4.364048, -5.830806,
2, -4.563466, -6.114487
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
-3, -4.962301, -6.681849, 0, -0.5, 0.5, 0.5,
-3, -4.962301, -6.681849, 1, -0.5, 0.5, 0.5,
-3, -4.962301, -6.681849, 1, 1.5, 0.5, 0.5,
-3, -4.962301, -6.681849, 0, 1.5, 0.5, 0.5,
-2, -4.962301, -6.681849, 0, -0.5, 0.5, 0.5,
-2, -4.962301, -6.681849, 1, -0.5, 0.5, 0.5,
-2, -4.962301, -6.681849, 1, 1.5, 0.5, 0.5,
-2, -4.962301, -6.681849, 0, 1.5, 0.5, 0.5,
-1, -4.962301, -6.681849, 0, -0.5, 0.5, 0.5,
-1, -4.962301, -6.681849, 1, -0.5, 0.5, 0.5,
-1, -4.962301, -6.681849, 1, 1.5, 0.5, 0.5,
-1, -4.962301, -6.681849, 0, 1.5, 0.5, 0.5,
0, -4.962301, -6.681849, 0, -0.5, 0.5, 0.5,
0, -4.962301, -6.681849, 1, -0.5, 0.5, 0.5,
0, -4.962301, -6.681849, 1, 1.5, 0.5, 0.5,
0, -4.962301, -6.681849, 0, 1.5, 0.5, 0.5,
1, -4.962301, -6.681849, 0, -0.5, 0.5, 0.5,
1, -4.962301, -6.681849, 1, -0.5, 0.5, 0.5,
1, -4.962301, -6.681849, 1, 1.5, 0.5, 0.5,
1, -4.962301, -6.681849, 0, 1.5, 0.5, 0.5,
2, -4.962301, -6.681849, 0, -0.5, 0.5, 0.5,
2, -4.962301, -6.681849, 1, -0.5, 0.5, 0.5,
2, -4.962301, -6.681849, 1, 1.5, 0.5, 0.5,
2, -4.962301, -6.681849, 0, 1.5, 0.5, 0.5
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
-3.112087, -4, -5.830806,
-3.112087, 2, -5.830806,
-3.112087, -4, -5.830806,
-3.262012, -4, -6.114487,
-3.112087, -2, -5.830806,
-3.262012, -2, -6.114487,
-3.112087, 0, -5.830806,
-3.262012, 0, -6.114487,
-3.112087, 2, -5.830806,
-3.262012, 2, -6.114487
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
"-4",
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
-3.561861, -4, -6.681849, 0, -0.5, 0.5, 0.5,
-3.561861, -4, -6.681849, 1, -0.5, 0.5, 0.5,
-3.561861, -4, -6.681849, 1, 1.5, 0.5, 0.5,
-3.561861, -4, -6.681849, 0, 1.5, 0.5, 0.5,
-3.561861, -2, -6.681849, 0, -0.5, 0.5, 0.5,
-3.561861, -2, -6.681849, 1, -0.5, 0.5, 0.5,
-3.561861, -2, -6.681849, 1, 1.5, 0.5, 0.5,
-3.561861, -2, -6.681849, 0, 1.5, 0.5, 0.5,
-3.561861, 0, -6.681849, 0, -0.5, 0.5, 0.5,
-3.561861, 0, -6.681849, 1, -0.5, 0.5, 0.5,
-3.561861, 0, -6.681849, 1, 1.5, 0.5, 0.5,
-3.561861, 0, -6.681849, 0, 1.5, 0.5, 0.5,
-3.561861, 2, -6.681849, 0, -0.5, 0.5, 0.5,
-3.561861, 2, -6.681849, 1, -0.5, 0.5, 0.5,
-3.561861, 2, -6.681849, 1, 1.5, 0.5, 0.5,
-3.561861, 2, -6.681849, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.112087, -4.364048, -4,
-3.112087, -4.364048, 4,
-3.112087, -4.364048, -4,
-3.262012, -4.563466, -4,
-3.112087, -4.364048, -2,
-3.262012, -4.563466, -2,
-3.112087, -4.364048, 0,
-3.262012, -4.563466, 0,
-3.112087, -4.364048, 2,
-3.262012, -4.563466, 2,
-3.112087, -4.364048, 4,
-3.262012, -4.563466, 4
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
-3.561861, -4.962301, -4, 0, -0.5, 0.5, 0.5,
-3.561861, -4.962301, -4, 1, -0.5, 0.5, 0.5,
-3.561861, -4.962301, -4, 1, 1.5, 0.5, 0.5,
-3.561861, -4.962301, -4, 0, 1.5, 0.5, 0.5,
-3.561861, -4.962301, -2, 0, -0.5, 0.5, 0.5,
-3.561861, -4.962301, -2, 1, -0.5, 0.5, 0.5,
-3.561861, -4.962301, -2, 1, 1.5, 0.5, 0.5,
-3.561861, -4.962301, -2, 0, 1.5, 0.5, 0.5,
-3.561861, -4.962301, 0, 0, -0.5, 0.5, 0.5,
-3.561861, -4.962301, 0, 1, -0.5, 0.5, 0.5,
-3.561861, -4.962301, 0, 1, 1.5, 0.5, 0.5,
-3.561861, -4.962301, 0, 0, 1.5, 0.5, 0.5,
-3.561861, -4.962301, 2, 0, -0.5, 0.5, 0.5,
-3.561861, -4.962301, 2, 1, -0.5, 0.5, 0.5,
-3.561861, -4.962301, 2, 1, 1.5, 0.5, 0.5,
-3.561861, -4.962301, 2, 0, 1.5, 0.5, 0.5,
-3.561861, -4.962301, 4, 0, -0.5, 0.5, 0.5,
-3.561861, -4.962301, 4, 1, -0.5, 0.5, 0.5,
-3.561861, -4.962301, 4, 1, 1.5, 0.5, 0.5,
-3.561861, -4.962301, 4, 0, 1.5, 0.5, 0.5
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
-3.112087, -4.364048, -5.830806,
-3.112087, 3.61266, -5.830806,
-3.112087, -4.364048, 5.516428,
-3.112087, 3.61266, 5.516428,
-3.112087, -4.364048, -5.830806,
-3.112087, -4.364048, 5.516428,
-3.112087, 3.61266, -5.830806,
-3.112087, 3.61266, 5.516428,
-3.112087, -4.364048, -5.830806,
2.884892, -4.364048, -5.830806,
-3.112087, -4.364048, 5.516428,
2.884892, -4.364048, 5.516428,
-3.112087, 3.61266, -5.830806,
2.884892, 3.61266, -5.830806,
-3.112087, 3.61266, 5.516428,
2.884892, 3.61266, 5.516428,
2.884892, -4.364048, -5.830806,
2.884892, 3.61266, -5.830806,
2.884892, -4.364048, 5.516428,
2.884892, 3.61266, 5.516428,
2.884892, -4.364048, -5.830806,
2.884892, -4.364048, 5.516428,
2.884892, 3.61266, -5.830806,
2.884892, 3.61266, 5.516428
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
var radius = 8.06914;
var distance = 35.90052;
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
mvMatrix.translate( 0.1135974, 0.3756939, 0.1571894 );
mvMatrix.scale( 1.454818, 1.093748, 0.7688669 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.90052);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
hexanecarboxylate_io<-read.table("hexanecarboxylate_io.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hexanecarboxylate_io$V2
```

```
## Error in eval(expr, envir, enclos): object 'hexanecarboxylate_io' not found
```

```r
y<-hexanecarboxylate_io$V3
```

```
## Error in eval(expr, envir, enclos): object 'hexanecarboxylate_io' not found
```

```r
z<-hexanecarboxylate_io$V4
```

```
## Error in eval(expr, envir, enclos): object 'hexanecarboxylate_io' not found
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
-3.024753, -0.5319974, -0.9144689, 0, 0, 1, 1, 1,
-2.961485, -0.7315706, -2.570269, 1, 0, 0, 1, 1,
-2.942476, 1.798872, -1.511172, 1, 0, 0, 1, 1,
-2.917926, -0.8936034, -1.323927, 1, 0, 0, 1, 1,
-2.884512, 0.4450912, -1.621118, 1, 0, 0, 1, 1,
-2.80215, -0.3401341, -1.449913, 1, 0, 0, 1, 1,
-2.515168, 0.7921116, -0.6281269, 0, 0, 0, 1, 1,
-2.505271, -1.028936, -1.852875, 0, 0, 0, 1, 1,
-2.437566, 1.646537, 0.4618585, 0, 0, 0, 1, 1,
-2.424875, -0.8747647, -0.8564609, 0, 0, 0, 1, 1,
-2.414075, -4.247882, -2.26986, 0, 0, 0, 1, 1,
-2.361407, 1.278019, -1.761976, 0, 0, 0, 1, 1,
-2.351653, -0.8087772, -3.098767, 0, 0, 0, 1, 1,
-2.245001, 1.4808, -0.5774783, 1, 1, 1, 1, 1,
-2.231759, -1.252802, -0.9250478, 1, 1, 1, 1, 1,
-2.205606, -0.06510033, -0.5250923, 1, 1, 1, 1, 1,
-2.202466, -0.6342072, -0.2946358, 1, 1, 1, 1, 1,
-2.186783, -0.4801884, -3.553338, 1, 1, 1, 1, 1,
-2.154958, 2.127228, -1.721697, 1, 1, 1, 1, 1,
-2.133693, 0.4696664, -2.221898, 1, 1, 1, 1, 1,
-2.109192, -0.2815131, -1.104059, 1, 1, 1, 1, 1,
-2.106204, 1.640053, 0.1108196, 1, 1, 1, 1, 1,
-2.097991, -1.160955, -1.742829, 1, 1, 1, 1, 1,
-2.082343, 1.917633, -0.7932615, 1, 1, 1, 1, 1,
-2.031219, 1.644799, -0.6917809, 1, 1, 1, 1, 1,
-2.030731, 0.226735, 0.3656754, 1, 1, 1, 1, 1,
-2.004659, -0.4617179, -1.624614, 1, 1, 1, 1, 1,
-2.000528, -1.190823, -2.721759, 1, 1, 1, 1, 1,
-1.997674, 3.232858, -0.5449917, 0, 0, 1, 1, 1,
-1.991764, -0.4447999, -1.128179, 1, 0, 0, 1, 1,
-1.986858, 0.7406098, -0.9167069, 1, 0, 0, 1, 1,
-1.977238, -1.151665, -3.429386, 1, 0, 0, 1, 1,
-1.963954, -0.1199626, -0.2771574, 1, 0, 0, 1, 1,
-1.962661, 1.255028, -1.634427, 1, 0, 0, 1, 1,
-1.962301, 1.026747, -0.1268113, 0, 0, 0, 1, 1,
-1.948071, 0.790031, 0.1903807, 0, 0, 0, 1, 1,
-1.946502, 0.9698799, -2.045235, 0, 0, 0, 1, 1,
-1.940488, -0.4142329, -3.145382, 0, 0, 0, 1, 1,
-1.909992, -1.932443, -4.369639, 0, 0, 0, 1, 1,
-1.904793, -0.04317437, -1.912331, 0, 0, 0, 1, 1,
-1.896737, -0.716689, -1.608479, 0, 0, 0, 1, 1,
-1.894702, 0.7467838, -1.261127, 1, 1, 1, 1, 1,
-1.886582, 0.7804637, -1.653797, 1, 1, 1, 1, 1,
-1.884603, 0.1847682, -2.248199, 1, 1, 1, 1, 1,
-1.865479, -1.797785, -1.973811, 1, 1, 1, 1, 1,
-1.81121, -2.053951, -2.017082, 1, 1, 1, 1, 1,
-1.789323, 0.7583132, -0.04469758, 1, 1, 1, 1, 1,
-1.78355, -0.9015459, -1.277456, 1, 1, 1, 1, 1,
-1.752202, -1.257552, -1.037823, 1, 1, 1, 1, 1,
-1.742615, -0.2231826, -0.8199075, 1, 1, 1, 1, 1,
-1.721382, 0.09380089, -0.3245827, 1, 1, 1, 1, 1,
-1.710329, 1.779472, -1.751994, 1, 1, 1, 1, 1,
-1.706273, -0.554872, -2.888972, 1, 1, 1, 1, 1,
-1.690791, 1.086631, -2.568182, 1, 1, 1, 1, 1,
-1.640369, -0.6036371, -2.253258, 1, 1, 1, 1, 1,
-1.631182, -0.09114053, -0.3730876, 1, 1, 1, 1, 1,
-1.620523, 0.9440547, -0.5842354, 0, 0, 1, 1, 1,
-1.618708, -1.759156, -2.274031, 1, 0, 0, 1, 1,
-1.607616, 1.55304, -2.061454, 1, 0, 0, 1, 1,
-1.600176, -0.8715359, -1.769601, 1, 0, 0, 1, 1,
-1.596555, -0.4956846, -2.140598, 1, 0, 0, 1, 1,
-1.593077, -0.8712714, 1.530994, 1, 0, 0, 1, 1,
-1.577484, -0.2631947, -0.1308073, 0, 0, 0, 1, 1,
-1.570817, -0.4599353, -1.761731, 0, 0, 0, 1, 1,
-1.570497, -0.707028, -1.328701, 0, 0, 0, 1, 1,
-1.557182, 1.639359, -1.053101, 0, 0, 0, 1, 1,
-1.556548, -0.8411945, -1.142565, 0, 0, 0, 1, 1,
-1.539174, -0.9614366, -0.5004558, 0, 0, 0, 1, 1,
-1.534108, -1.198817, -2.860438, 0, 0, 0, 1, 1,
-1.52148, -0.6131747, -2.063695, 1, 1, 1, 1, 1,
-1.515404, 1.194723, -0.9459287, 1, 1, 1, 1, 1,
-1.514675, -0.7697864, -2.224416, 1, 1, 1, 1, 1,
-1.512644, -0.525472, -3.412495, 1, 1, 1, 1, 1,
-1.505636, -0.5858744, -1.508231, 1, 1, 1, 1, 1,
-1.50531, 0.3286204, -1.990601, 1, 1, 1, 1, 1,
-1.505001, -1.648535, -3.131579, 1, 1, 1, 1, 1,
-1.497051, -0.0294209, -1.158332, 1, 1, 1, 1, 1,
-1.470365, -0.1566805, -1.367128, 1, 1, 1, 1, 1,
-1.453571, -0.3538607, -4.227341, 1, 1, 1, 1, 1,
-1.45068, -0.4844465, -3.449184, 1, 1, 1, 1, 1,
-1.447189, -2.538921, -2.990132, 1, 1, 1, 1, 1,
-1.442621, -0.05376714, -1.453965, 1, 1, 1, 1, 1,
-1.438161, -1.515996, -2.743444, 1, 1, 1, 1, 1,
-1.432603, 0.5475019, -2.311653, 1, 1, 1, 1, 1,
-1.429076, -0.1611032, -1.486431, 0, 0, 1, 1, 1,
-1.423145, -0.06000178, -0.821942, 1, 0, 0, 1, 1,
-1.422737, 1.534506, -0.7571452, 1, 0, 0, 1, 1,
-1.419999, 0.8884035, -0.2366769, 1, 0, 0, 1, 1,
-1.409947, -1.561461, -0.5647742, 1, 0, 0, 1, 1,
-1.406182, 0.815356, -1.720136, 1, 0, 0, 1, 1,
-1.40608, 0.6404412, -1.751404, 0, 0, 0, 1, 1,
-1.398646, 0.893395, -1.282312, 0, 0, 0, 1, 1,
-1.396707, 1.591444, 0.2977736, 0, 0, 0, 1, 1,
-1.377776, -0.7676193, -2.556056, 0, 0, 0, 1, 1,
-1.376487, 0.7463441, -1.429197, 0, 0, 0, 1, 1,
-1.372782, 1.62247, -1.030425, 0, 0, 0, 1, 1,
-1.359779, -1.28312, -2.760712, 0, 0, 0, 1, 1,
-1.359584, -0.5557808, -3.733387, 1, 1, 1, 1, 1,
-1.341676, 0.7023385, 0.4347337, 1, 1, 1, 1, 1,
-1.335771, 0.9913204, -2.257441, 1, 1, 1, 1, 1,
-1.330287, -2.145705, -2.161383, 1, 1, 1, 1, 1,
-1.31766, 1.904182, 0.1216266, 1, 1, 1, 1, 1,
-1.314529, 0.4574001, -0.4709466, 1, 1, 1, 1, 1,
-1.310178, 0.3797255, -0.1439334, 1, 1, 1, 1, 1,
-1.307074, 0.02103227, -1.505422, 1, 1, 1, 1, 1,
-1.29717, 1.427819, 0.572218, 1, 1, 1, 1, 1,
-1.295974, -0.06384419, -2.252757, 1, 1, 1, 1, 1,
-1.288998, -0.0800867, -2.671902, 1, 1, 1, 1, 1,
-1.283056, 0.2995405, 0.1678365, 1, 1, 1, 1, 1,
-1.277141, -1.497388, -1.345318, 1, 1, 1, 1, 1,
-1.276598, 0.6379448, -1.057039, 1, 1, 1, 1, 1,
-1.268943, 0.838069, -1.195299, 1, 1, 1, 1, 1,
-1.250692, 0.2394355, -1.959543, 0, 0, 1, 1, 1,
-1.244632, -0.9002685, -1.949542, 1, 0, 0, 1, 1,
-1.228453, 1.398329, 0.4580881, 1, 0, 0, 1, 1,
-1.22598, 0.846132, 0.5066853, 1, 0, 0, 1, 1,
-1.220382, 2.306999, 0.9381363, 1, 0, 0, 1, 1,
-1.219867, -0.7125472, -1.096259, 1, 0, 0, 1, 1,
-1.21711, 0.7387183, -2.765276, 0, 0, 0, 1, 1,
-1.215237, -0.1687965, -1.699121, 0, 0, 0, 1, 1,
-1.213687, -0.3611068, -5.665555, 0, 0, 0, 1, 1,
-1.212597, 1.113715, -0.8135722, 0, 0, 0, 1, 1,
-1.207809, -0.4869428, -1.751315, 0, 0, 0, 1, 1,
-1.204814, -1.21268, -1.987017, 0, 0, 0, 1, 1,
-1.200727, -1.131514, -3.393473, 0, 0, 0, 1, 1,
-1.186474, 0.3742445, -0.8353959, 1, 1, 1, 1, 1,
-1.182637, 0.7924404, -1.158341, 1, 1, 1, 1, 1,
-1.17214, 1.092194, 0.5643612, 1, 1, 1, 1, 1,
-1.160562, -0.01040967, -0.9770039, 1, 1, 1, 1, 1,
-1.159342, -0.1732883, -1.215523, 1, 1, 1, 1, 1,
-1.146854, 1.18469, -0.6182689, 1, 1, 1, 1, 1,
-1.145016, 0.9238802, -1.325642, 1, 1, 1, 1, 1,
-1.142436, -0.4574131, -2.674363, 1, 1, 1, 1, 1,
-1.131049, 0.6201321, -0.894818, 1, 1, 1, 1, 1,
-1.128349, 0.6776113, 2.161375, 1, 1, 1, 1, 1,
-1.124871, 0.04991001, -1.003919, 1, 1, 1, 1, 1,
-1.124628, 1.110717, 1.043071, 1, 1, 1, 1, 1,
-1.124109, 1.012051, -2.381073, 1, 1, 1, 1, 1,
-1.119242, -0.8797002, -1.459555, 1, 1, 1, 1, 1,
-1.118884, -1.374843, -1.20127, 1, 1, 1, 1, 1,
-1.105529, 0.2289821, -1.063938, 0, 0, 1, 1, 1,
-1.100796, 1.365255, 0.5987058, 1, 0, 0, 1, 1,
-1.085452, 1.301957, -0.1453277, 1, 0, 0, 1, 1,
-1.084037, -1.593958, -0.564964, 1, 0, 0, 1, 1,
-1.081053, 1.823755, -2.037587, 1, 0, 0, 1, 1,
-1.079695, -1.550564, -2.558894, 1, 0, 0, 1, 1,
-1.076258, 0.4184209, -2.5608, 0, 0, 0, 1, 1,
-1.072218, -0.5753596, -3.61784, 0, 0, 0, 1, 1,
-1.069783, 0.6841217, -1.08098, 0, 0, 0, 1, 1,
-1.068511, -0.3783803, -1.701218, 0, 0, 0, 1, 1,
-1.067926, -0.02818321, -2.539948, 0, 0, 0, 1, 1,
-1.067838, -0.495276, -1.212487, 0, 0, 0, 1, 1,
-1.067186, 1.117422, -1.414165, 0, 0, 0, 1, 1,
-1.065841, -0.01044549, -1.400375, 1, 1, 1, 1, 1,
-1.065579, 2.221641, -0.5622844, 1, 1, 1, 1, 1,
-1.058707, -0.1223344, -1.110787, 1, 1, 1, 1, 1,
-1.053233, 0.2986389, -1.46641, 1, 1, 1, 1, 1,
-1.04865, 1.48367, -0.634032, 1, 1, 1, 1, 1,
-1.043594, 0.9554579, -0.3950677, 1, 1, 1, 1, 1,
-1.041677, 0.5071024, -0.4472992, 1, 1, 1, 1, 1,
-1.036661, 1.167479, -1.476867, 1, 1, 1, 1, 1,
-1.025975, -1.905303, -2.75969, 1, 1, 1, 1, 1,
-1.024548, 1.229293, 0.2196472, 1, 1, 1, 1, 1,
-1.014256, -0.8973036, -1.035858, 1, 1, 1, 1, 1,
-1.014229, 0.7098516, -1.810051, 1, 1, 1, 1, 1,
-1.011982, -0.3608264, 0.05691954, 1, 1, 1, 1, 1,
-1.009466, 1.835974, -0.8991916, 1, 1, 1, 1, 1,
-1.009012, -1.562241, -2.199932, 1, 1, 1, 1, 1,
-1.003493, -0.2033439, -1.705949, 0, 0, 1, 1, 1,
-0.9997661, 0.5638424, -2.600798, 1, 0, 0, 1, 1,
-0.9981391, -0.9989142, -1.753725, 1, 0, 0, 1, 1,
-0.9950036, -0.681919, -2.762997, 1, 0, 0, 1, 1,
-0.9867433, 0.5991024, -0.8775365, 1, 0, 0, 1, 1,
-0.9844329, -1.171912, -0.5300511, 1, 0, 0, 1, 1,
-0.9749473, -0.9536437, -1.292177, 0, 0, 0, 1, 1,
-0.9701658, -1.135886, -0.5224159, 0, 0, 0, 1, 1,
-0.9619849, -0.6331945, -2.090905, 0, 0, 0, 1, 1,
-0.9598157, -1.496621, -2.243914, 0, 0, 0, 1, 1,
-0.951264, 0.4360649, 0.4600668, 0, 0, 0, 1, 1,
-0.9476208, -1.497346, -4.405995, 0, 0, 0, 1, 1,
-0.9419168, 0.1856555, 0.7054613, 0, 0, 0, 1, 1,
-0.9411811, 0.6621833, -2.046704, 1, 1, 1, 1, 1,
-0.940743, -0.643438, -1.37969, 1, 1, 1, 1, 1,
-0.927904, 0.476447, 0.9674692, 1, 1, 1, 1, 1,
-0.9265367, 1.542693, -0.7042105, 1, 1, 1, 1, 1,
-0.9237375, -1.145127, -2.977666, 1, 1, 1, 1, 1,
-0.9204664, 0.2384688, -1.73381, 1, 1, 1, 1, 1,
-0.9165478, -0.4666587, -3.335059, 1, 1, 1, 1, 1,
-0.9094154, 0.002279761, -2.300639, 1, 1, 1, 1, 1,
-0.9050101, 0.8507804, 0.6598818, 1, 1, 1, 1, 1,
-0.9034978, -1.300539, -1.701247, 1, 1, 1, 1, 1,
-0.9030575, 1.919948, 0.9005132, 1, 1, 1, 1, 1,
-0.8993801, -0.6202933, -1.780665, 1, 1, 1, 1, 1,
-0.8957728, 1.012183, -0.6729143, 1, 1, 1, 1, 1,
-0.891307, -0.3430823, -2.588404, 1, 1, 1, 1, 1,
-0.8903909, -0.9335078, -3.364387, 1, 1, 1, 1, 1,
-0.8885343, 1.284918, -0.03379143, 0, 0, 1, 1, 1,
-0.8882016, 0.3402035, -1.717974, 1, 0, 0, 1, 1,
-0.886942, 1.330168, -0.5063911, 1, 0, 0, 1, 1,
-0.8862227, -0.3519039, -3.266691, 1, 0, 0, 1, 1,
-0.8854138, -1.268902, -1.904092, 1, 0, 0, 1, 1,
-0.882877, 0.180249, -2.375518, 1, 0, 0, 1, 1,
-0.8809474, 0.9826428, -1.079598, 0, 0, 0, 1, 1,
-0.8783642, -0.9371433, -3.457813, 0, 0, 0, 1, 1,
-0.8777488, 0.510645, -1.146321, 0, 0, 0, 1, 1,
-0.877254, 1.90726, -0.1926035, 0, 0, 0, 1, 1,
-0.8769605, 1.263025, -1.642077, 0, 0, 0, 1, 1,
-0.8684016, -0.327866, -2.075551, 0, 0, 0, 1, 1,
-0.8668118, 0.2432497, -1.789317, 0, 0, 0, 1, 1,
-0.8575045, -0.1752324, -2.604723, 1, 1, 1, 1, 1,
-0.8470029, 0.5861231, -0.5013425, 1, 1, 1, 1, 1,
-0.8436545, -0.3695647, -3.471318, 1, 1, 1, 1, 1,
-0.8413993, 0.5024593, -2.928826, 1, 1, 1, 1, 1,
-0.8295547, 0.3029642, -0.6288212, 1, 1, 1, 1, 1,
-0.8277925, -0.3793982, -1.101559, 1, 1, 1, 1, 1,
-0.8236638, 1.085724, -2.102958, 1, 1, 1, 1, 1,
-0.814979, 0.3363789, -2.142917, 1, 1, 1, 1, 1,
-0.8143893, -1.457567, -1.287901, 1, 1, 1, 1, 1,
-0.807654, -2.34137, -5.280719, 1, 1, 1, 1, 1,
-0.8061982, 0.4250747, -1.377153, 1, 1, 1, 1, 1,
-0.805397, -0.4246025, -0.2773592, 1, 1, 1, 1, 1,
-0.8027358, 0.4544462, -0.5521692, 1, 1, 1, 1, 1,
-0.8010004, -0.1989762, -0.7039487, 1, 1, 1, 1, 1,
-0.7995565, -0.09588655, 0.6014403, 1, 1, 1, 1, 1,
-0.7989637, -0.5732716, 0.09575561, 0, 0, 1, 1, 1,
-0.7938039, 0.3867465, -0.03494346, 1, 0, 0, 1, 1,
-0.793003, 0.6398572, -1.318699, 1, 0, 0, 1, 1,
-0.792676, -0.2365812, -0.4416457, 1, 0, 0, 1, 1,
-0.7906306, 0.06202319, -0.09146516, 1, 0, 0, 1, 1,
-0.787166, -0.5023959, -2.168705, 1, 0, 0, 1, 1,
-0.7858071, -0.7646421, -1.653014, 0, 0, 0, 1, 1,
-0.7788334, 0.5656766, -1.060887, 0, 0, 0, 1, 1,
-0.7745542, -0.356749, -2.796179, 0, 0, 0, 1, 1,
-0.7722313, -0.03746002, -1.892159, 0, 0, 0, 1, 1,
-0.7657152, -0.8638502, -1.889716, 0, 0, 0, 1, 1,
-0.7533566, -1.796682, -2.805856, 0, 0, 0, 1, 1,
-0.7518131, -2.917409, -3.047597, 0, 0, 0, 1, 1,
-0.7499585, -0.7413343, -0.6701261, 1, 1, 1, 1, 1,
-0.7494696, 0.3448264, -1.95294, 1, 1, 1, 1, 1,
-0.7477275, 0.8039296, 0.8216705, 1, 1, 1, 1, 1,
-0.7428446, 0.2541302, -2.9444, 1, 1, 1, 1, 1,
-0.7379339, -0.01494137, -1.5154, 1, 1, 1, 1, 1,
-0.7371976, -0.3798023, -2.656605, 1, 1, 1, 1, 1,
-0.7336224, -0.5557005, -2.351157, 1, 1, 1, 1, 1,
-0.7315685, -0.5876633, -1.799621, 1, 1, 1, 1, 1,
-0.7309734, 1.989894, -0.3400371, 1, 1, 1, 1, 1,
-0.7308769, 0.9901683, -0.4764127, 1, 1, 1, 1, 1,
-0.7264479, 0.5211441, -2.344407, 1, 1, 1, 1, 1,
-0.7224874, -0.2739505, -3.794139, 1, 1, 1, 1, 1,
-0.7171117, -0.7370454, -1.082118, 1, 1, 1, 1, 1,
-0.7154971, 0.004179782, -3.383639, 1, 1, 1, 1, 1,
-0.7118855, 0.4795658, -2.645507, 1, 1, 1, 1, 1,
-0.7081269, -1.443895, -2.383085, 0, 0, 1, 1, 1,
-0.7073393, 1.23456, -0.510248, 1, 0, 0, 1, 1,
-0.7061552, 2.026899, -1.37966, 1, 0, 0, 1, 1,
-0.6984124, -0.0313785, -3.098292, 1, 0, 0, 1, 1,
-0.6981449, 0.8218288, -1.881362, 1, 0, 0, 1, 1,
-0.6970485, 0.005808904, -2.421083, 1, 0, 0, 1, 1,
-0.6964221, 3.496495, -0.2477488, 0, 0, 0, 1, 1,
-0.6951347, -1.18584, -2.382235, 0, 0, 0, 1, 1,
-0.6939678, 0.872857, -0.4032721, 0, 0, 0, 1, 1,
-0.6919979, -0.4820819, -2.125441, 0, 0, 0, 1, 1,
-0.6866964, 0.3259907, -1.170368, 0, 0, 0, 1, 1,
-0.6863272, 1.127907, -1.698038, 0, 0, 0, 1, 1,
-0.6852206, 2.548576, -1.792333, 0, 0, 0, 1, 1,
-0.6740493, 0.8341164, -0.07725612, 1, 1, 1, 1, 1,
-0.6713315, 0.4828386, -0.2153981, 1, 1, 1, 1, 1,
-0.669542, -0.4307662, -1.582991, 1, 1, 1, 1, 1,
-0.6691641, -0.8043764, -1.937813, 1, 1, 1, 1, 1,
-0.6671147, -0.7004668, -2.263495, 1, 1, 1, 1, 1,
-0.66639, 0.6318887, -1.385877, 1, 1, 1, 1, 1,
-0.653527, 0.218667, -2.057558, 1, 1, 1, 1, 1,
-0.6531974, -0.4870507, -1.260412, 1, 1, 1, 1, 1,
-0.651198, 1.399754, -1.604009, 1, 1, 1, 1, 1,
-0.6498536, -1.40217, -2.663535, 1, 1, 1, 1, 1,
-0.6493626, 0.192816, 0.04486366, 1, 1, 1, 1, 1,
-0.644786, 0.5293674, -2.898339, 1, 1, 1, 1, 1,
-0.6437455, 0.4937034, -2.59999, 1, 1, 1, 1, 1,
-0.6425531, -0.2147009, -1.63632, 1, 1, 1, 1, 1,
-0.6379142, -0.4368775, -1.47154, 1, 1, 1, 1, 1,
-0.6330273, -1.130559, -2.228431, 0, 0, 1, 1, 1,
-0.6327902, -0.2076917, -2.734132, 1, 0, 0, 1, 1,
-0.6315575, 0.1858261, -1.035816, 1, 0, 0, 1, 1,
-0.6259912, 1.303787, -0.8148029, 1, 0, 0, 1, 1,
-0.62437, -0.9424301, -2.303801, 1, 0, 0, 1, 1,
-0.6240402, 2.282539, 0.7109876, 1, 0, 0, 1, 1,
-0.6174862, -0.1731748, -1.900284, 0, 0, 0, 1, 1,
-0.6120496, 0.7004755, -0.9903617, 0, 0, 0, 1, 1,
-0.6076534, 1.612294, 1.166292, 0, 0, 0, 1, 1,
-0.6056204, -1.362074, -2.575376, 0, 0, 0, 1, 1,
-0.6050053, -0.09043345, -1.714087, 0, 0, 0, 1, 1,
-0.6040148, 0.6806058, -0.5184001, 0, 0, 0, 1, 1,
-0.6019759, 1.057195, 1.664577, 0, 0, 0, 1, 1,
-0.6011733, -0.9430863, -2.751189, 1, 1, 1, 1, 1,
-0.5966908, -1.168593, -2.613068, 1, 1, 1, 1, 1,
-0.5894496, -0.2099978, -0.981831, 1, 1, 1, 1, 1,
-0.5875401, -1.321334, -2.296865, 1, 1, 1, 1, 1,
-0.5869126, -0.1557923, -3.68404, 1, 1, 1, 1, 1,
-0.5849595, 0.5275714, 0.3683748, 1, 1, 1, 1, 1,
-0.5804749, -0.6936343, -2.748959, 1, 1, 1, 1, 1,
-0.5782715, 0.6893068, 0.973648, 1, 1, 1, 1, 1,
-0.5780026, -1.005392, -3.510245, 1, 1, 1, 1, 1,
-0.5760822, -0.128319, -2.524817, 1, 1, 1, 1, 1,
-0.5733364, -1.040706, -4.61022, 1, 1, 1, 1, 1,
-0.5701104, -0.6299424, -1.887679, 1, 1, 1, 1, 1,
-0.5668279, 0.1426358, -2.008043, 1, 1, 1, 1, 1,
-0.5603146, -2.437911, -2.58878, 1, 1, 1, 1, 1,
-0.5597928, 0.1399275, 0.8177263, 1, 1, 1, 1, 1,
-0.5595245, -0.2081502, -0.8836958, 0, 0, 1, 1, 1,
-0.5592288, -0.8385481, -3.243496, 1, 0, 0, 1, 1,
-0.5589008, 0.7028584, -1.000342, 1, 0, 0, 1, 1,
-0.5462939, 0.3371993, -0.05508769, 1, 0, 0, 1, 1,
-0.5323318, 0.6982044, -1.841035, 1, 0, 0, 1, 1,
-0.5186821, -2.9064, -2.983878, 1, 0, 0, 1, 1,
-0.5145941, 0.3850123, -1.926315, 0, 0, 0, 1, 1,
-0.5107183, -0.9251505, -3.753279, 0, 0, 0, 1, 1,
-0.5087268, -1.306422, -3.550049, 0, 0, 0, 1, 1,
-0.496817, -0.3607734, -4.274161, 0, 0, 0, 1, 1,
-0.4965869, 0.6371247, -0.9416986, 0, 0, 0, 1, 1,
-0.4944163, 0.9625787, 0.2637792, 0, 0, 0, 1, 1,
-0.4791524, -0.1864825, -1.303391, 0, 0, 0, 1, 1,
-0.4789433, -0.3048177, -5.621533, 1, 1, 1, 1, 1,
-0.4779567, 0.6160256, -1.157777, 1, 1, 1, 1, 1,
-0.4765594, 0.8786296, -0.09734954, 1, 1, 1, 1, 1,
-0.4740453, 0.6231283, 0.5515713, 1, 1, 1, 1, 1,
-0.4714545, -1.421283, -2.764904, 1, 1, 1, 1, 1,
-0.46927, -1.859508, -3.112836, 1, 1, 1, 1, 1,
-0.4689792, -0.764049, -3.999573, 1, 1, 1, 1, 1,
-0.4687248, -0.1818133, -2.856107, 1, 1, 1, 1, 1,
-0.468073, 0.2167992, -2.376859, 1, 1, 1, 1, 1,
-0.4670061, -1.998053, -2.405201, 1, 1, 1, 1, 1,
-0.4641688, 0.3962487, -2.279013, 1, 1, 1, 1, 1,
-0.4633453, 0.8339952, 0.9519489, 1, 1, 1, 1, 1,
-0.4594866, -0.5797081, -2.625437, 1, 1, 1, 1, 1,
-0.4586727, -0.02734545, -4.063809, 1, 1, 1, 1, 1,
-0.458021, -0.293, -0.6055036, 1, 1, 1, 1, 1,
-0.4579733, 0.8422379, 0.5587125, 0, 0, 1, 1, 1,
-0.4499105, -1.356896, -1.441788, 1, 0, 0, 1, 1,
-0.4347, 2.369185, -0.1502074, 1, 0, 0, 1, 1,
-0.4287524, -1.508431, -1.891203, 1, 0, 0, 1, 1,
-0.4245458, -0.113258, -4.276601, 1, 0, 0, 1, 1,
-0.4201453, -1.618621, -2.075878, 1, 0, 0, 1, 1,
-0.4171802, 0.2901591, 0.4751871, 0, 0, 0, 1, 1,
-0.4168968, -0.2540295, -1.427464, 0, 0, 0, 1, 1,
-0.4163568, 1.196879, -0.9421544, 0, 0, 0, 1, 1,
-0.4133675, 0.2290355, -2.085911, 0, 0, 0, 1, 1,
-0.4122525, -0.7540956, -1.773143, 0, 0, 0, 1, 1,
-0.4083209, 2.309534, -0.8482776, 0, 0, 0, 1, 1,
-0.4058204, 1.136343, 0.6119444, 0, 0, 0, 1, 1,
-0.4033059, -1.154652, -2.495894, 1, 1, 1, 1, 1,
-0.3986362, -0.0307877, -1.37385, 1, 1, 1, 1, 1,
-0.3978292, -1.37494, -1.890089, 1, 1, 1, 1, 1,
-0.3972539, -0.9959476, -3.383979, 1, 1, 1, 1, 1,
-0.3960264, -1.24833, -1.951126, 1, 1, 1, 1, 1,
-0.3939826, -2.042376, -3.418189, 1, 1, 1, 1, 1,
-0.390623, 1.402475, -2.006386, 1, 1, 1, 1, 1,
-0.3881586, 2.849576, 0.3040446, 1, 1, 1, 1, 1,
-0.3861405, -2.163922, -3.181716, 1, 1, 1, 1, 1,
-0.3832178, -0.6754828, -3.112662, 1, 1, 1, 1, 1,
-0.3795831, 0.3681344, 0.153526, 1, 1, 1, 1, 1,
-0.3795262, 0.2682415, -1.543208, 1, 1, 1, 1, 1,
-0.3788083, 0.549658, -1.364286, 1, 1, 1, 1, 1,
-0.3784445, -0.9487658, -2.300881, 1, 1, 1, 1, 1,
-0.3774299, -1.718938, -4.493075, 1, 1, 1, 1, 1,
-0.3762728, -0.1079096, -1.576642, 0, 0, 1, 1, 1,
-0.3755841, 0.8988432, 0.8742808, 1, 0, 0, 1, 1,
-0.372881, 0.4500798, -1.24843, 1, 0, 0, 1, 1,
-0.3713296, 0.1201191, -1.220106, 1, 0, 0, 1, 1,
-0.3694706, -0.06100274, -2.097137, 1, 0, 0, 1, 1,
-0.3693581, -0.8718715, -1.954246, 1, 0, 0, 1, 1,
-0.3685642, 0.4719199, 0.05928563, 0, 0, 0, 1, 1,
-0.3676259, 0.4067427, -0.228018, 0, 0, 0, 1, 1,
-0.3675928, -0.3198192, -1.742394, 0, 0, 0, 1, 1,
-0.3671358, 0.2525617, -2.12518, 0, 0, 0, 1, 1,
-0.3647456, 1.544056, -2.596209, 0, 0, 0, 1, 1,
-0.3575022, 2.651385, 0.6505464, 0, 0, 0, 1, 1,
-0.3547884, 1.678565, -0.7185249, 0, 0, 0, 1, 1,
-0.3545463, 0.676522, 1.474195, 1, 1, 1, 1, 1,
-0.3524766, 0.3754143, -1.914709, 1, 1, 1, 1, 1,
-0.3516934, -1.188259, -3.985447, 1, 1, 1, 1, 1,
-0.350734, 0.5917435, -0.8838146, 1, 1, 1, 1, 1,
-0.3501286, -0.1143809, -1.81225, 1, 1, 1, 1, 1,
-0.3468695, 0.2878837, -1.730681, 1, 1, 1, 1, 1,
-0.3433338, 1.549224, 0.3200622, 1, 1, 1, 1, 1,
-0.3381387, -0.145831, -1.203819, 1, 1, 1, 1, 1,
-0.3378931, 1.561728, -0.6621198, 1, 1, 1, 1, 1,
-0.3364193, -1.156331, -1.675473, 1, 1, 1, 1, 1,
-0.33287, 0.5879881, -1.518208, 1, 1, 1, 1, 1,
-0.3312596, 0.05843855, -0.5765377, 1, 1, 1, 1, 1,
-0.3306451, 1.199865, -1.482383, 1, 1, 1, 1, 1,
-0.3274574, -1.147752, -3.439392, 1, 1, 1, 1, 1,
-0.3246017, -0.1337125, -2.998947, 1, 1, 1, 1, 1,
-0.3245643, 1.398587, 1.022822, 0, 0, 1, 1, 1,
-0.32411, 0.4211265, -1.106818, 1, 0, 0, 1, 1,
-0.3227776, 0.3341186, -2.690071, 1, 0, 0, 1, 1,
-0.3186099, 1.807333, -1.824763, 1, 0, 0, 1, 1,
-0.3183908, 1.540149, -0.2604742, 1, 0, 0, 1, 1,
-0.318143, 1.078811, -1.792054, 1, 0, 0, 1, 1,
-0.3137284, 0.5860416, -1.043936, 0, 0, 0, 1, 1,
-0.2917094, 0.4496572, -1.374889, 0, 0, 0, 1, 1,
-0.2900608, -0.737514, -2.805803, 0, 0, 0, 1, 1,
-0.2882246, -0.6534958, -3.346699, 0, 0, 0, 1, 1,
-0.2881078, -0.3001761, -0.6973307, 0, 0, 0, 1, 1,
-0.2844631, 0.5662735, -0.1568765, 0, 0, 0, 1, 1,
-0.2832317, 1.353999, 0.2509826, 0, 0, 0, 1, 1,
-0.2739142, -0.5007966, -0.7734177, 1, 1, 1, 1, 1,
-0.2701904, -0.4767197, -2.194867, 1, 1, 1, 1, 1,
-0.2701748, 0.01733248, -2.222226, 1, 1, 1, 1, 1,
-0.2689315, -2.199092, -2.495122, 1, 1, 1, 1, 1,
-0.2654304, 0.5786379, -1.415528, 1, 1, 1, 1, 1,
-0.265095, -1.539192, -2.165222, 1, 1, 1, 1, 1,
-0.2649866, 0.2088098, -0.8707329, 1, 1, 1, 1, 1,
-0.2649341, 0.9815353, 0.4797318, 1, 1, 1, 1, 1,
-0.2648959, 0.1144007, -0.1399484, 1, 1, 1, 1, 1,
-0.2644175, 0.07149425, -1.997141, 1, 1, 1, 1, 1,
-0.2635787, 0.8497746, -0.05768276, 1, 1, 1, 1, 1,
-0.2543886, -0.2676262, -2.166833, 1, 1, 1, 1, 1,
-0.25042, 0.155527, 2.216249, 1, 1, 1, 1, 1,
-0.2444596, 0.777106, 1.776604, 1, 1, 1, 1, 1,
-0.2444279, 0.06730869, -1.303982, 1, 1, 1, 1, 1,
-0.2443316, 1.247519, -0.5918429, 0, 0, 1, 1, 1,
-0.2437185, -0.2532875, -3.486806, 1, 0, 0, 1, 1,
-0.2384648, -0.6100618, -0.9113139, 1, 0, 0, 1, 1,
-0.2380308, -1.030732, -4.382419, 1, 0, 0, 1, 1,
-0.2373297, 0.2767603, -1.650826, 1, 0, 0, 1, 1,
-0.2370967, -0.5095525, -2.611583, 1, 0, 0, 1, 1,
-0.2356424, -0.4836155, -3.835697, 0, 0, 0, 1, 1,
-0.2341938, -0.1119739, -0.2755605, 0, 0, 0, 1, 1,
-0.2310919, -0.06510096, -2.882433, 0, 0, 0, 1, 1,
-0.2276399, 0.9893143, -0.5040932, 0, 0, 0, 1, 1,
-0.227061, 0.5461864, -0.7463145, 0, 0, 0, 1, 1,
-0.222923, 0.3953065, -0.6632224, 0, 0, 0, 1, 1,
-0.2223492, 1.665415, -0.4845923, 0, 0, 0, 1, 1,
-0.2203671, 0.06590313, 0.4280259, 1, 1, 1, 1, 1,
-0.2188229, 0.437013, 0.1133001, 1, 1, 1, 1, 1,
-0.2176383, -0.2334264, -0.9514324, 1, 1, 1, 1, 1,
-0.2175501, 0.0492427, -2.551222, 1, 1, 1, 1, 1,
-0.215538, -0.7240136, -1.9795, 1, 1, 1, 1, 1,
-0.2146011, -0.6555545, -0.7349554, 1, 1, 1, 1, 1,
-0.2094895, -0.2084195, -3.072651, 1, 1, 1, 1, 1,
-0.2081694, 0.435217, 0.6722081, 1, 1, 1, 1, 1,
-0.2061694, 0.8414016, 0.4686329, 1, 1, 1, 1, 1,
-0.2056721, -2.082911, -2.31442, 1, 1, 1, 1, 1,
-0.1990412, -0.2421091, -2.637251, 1, 1, 1, 1, 1,
-0.1980122, -1.197409, -2.381441, 1, 1, 1, 1, 1,
-0.1907976, -1.117309, -2.413921, 1, 1, 1, 1, 1,
-0.188282, 0.4113286, 0.07849836, 1, 1, 1, 1, 1,
-0.1866598, 0.6194682, 0.5147607, 1, 1, 1, 1, 1,
-0.1851169, 1.509626, -0.5549628, 0, 0, 1, 1, 1,
-0.1849657, 0.6702287, 0.3458475, 1, 0, 0, 1, 1,
-0.1831223, 0.3734881, -0.5927112, 1, 0, 0, 1, 1,
-0.1568271, 0.6596649, 0.9636506, 1, 0, 0, 1, 1,
-0.1556559, 0.9261276, -0.4196437, 1, 0, 0, 1, 1,
-0.1534871, -1.768856, -1.721778, 1, 0, 0, 1, 1,
-0.1522132, 0.4744505, -1.737962, 0, 0, 0, 1, 1,
-0.1500612, -1.594953, -2.542394, 0, 0, 0, 1, 1,
-0.1465443, -0.7113127, -3.38605, 0, 0, 0, 1, 1,
-0.1457555, 0.09639822, -0.1291009, 0, 0, 0, 1, 1,
-0.1405034, 0.5696887, 2.133539, 0, 0, 0, 1, 1,
-0.1367345, -0.4502622, -2.960696, 0, 0, 0, 1, 1,
-0.1351677, 2.132817, 0.6292499, 0, 0, 0, 1, 1,
-0.1298251, 0.6180596, -1.120182, 1, 1, 1, 1, 1,
-0.1254857, 0.9632006, -1.561229, 1, 1, 1, 1, 1,
-0.1238695, 0.5248663, 0.6568113, 1, 1, 1, 1, 1,
-0.121464, -1.39505, -3.430353, 1, 1, 1, 1, 1,
-0.1186058, 0.8564394, 0.1269953, 1, 1, 1, 1, 1,
-0.1091073, -1.196691, -3.529731, 1, 1, 1, 1, 1,
-0.1065269, -1.496376, -4.048752, 1, 1, 1, 1, 1,
-0.1057837, -0.8322197, -3.05745, 1, 1, 1, 1, 1,
-0.1048457, 1.224407, -0.1079756, 1, 1, 1, 1, 1,
-0.09869332, -1.178698, -3.412602, 1, 1, 1, 1, 1,
-0.09834176, 1.175603, -2.16197, 1, 1, 1, 1, 1,
-0.08920308, -0.3425536, -2.159389, 1, 1, 1, 1, 1,
-0.08905463, -1.020518, -1.92091, 1, 1, 1, 1, 1,
-0.08573379, -0.01165002, -1.522471, 1, 1, 1, 1, 1,
-0.08553888, 0.6105458, -1.017818, 1, 1, 1, 1, 1,
-0.08498122, 1.280133, -0.6644864, 0, 0, 1, 1, 1,
-0.08255035, -0.6833435, -0.8046238, 1, 0, 0, 1, 1,
-0.07816964, -1.225194, -4.919174, 1, 0, 0, 1, 1,
-0.07802995, 0.0958515, -0.185094, 1, 0, 0, 1, 1,
-0.07734661, -0.4381931, -2.01995, 1, 0, 0, 1, 1,
-0.0768519, 0.01284428, -1.773487, 1, 0, 0, 1, 1,
-0.0715495, -0.9182519, -3.921697, 0, 0, 0, 1, 1,
-0.06976241, 0.7140902, 0.9850397, 0, 0, 0, 1, 1,
-0.06707784, 0.8899913, -0.06259524, 0, 0, 0, 1, 1,
-0.06504688, -1.696098, -1.178337, 0, 0, 0, 1, 1,
-0.0608678, 0.5926643, 0.4101481, 0, 0, 0, 1, 1,
-0.05908928, -0.5340947, -3.794702, 0, 0, 0, 1, 1,
-0.05879856, -0.258261, -2.551536, 0, 0, 0, 1, 1,
-0.0584468, 0.8458357, 1.631375, 1, 1, 1, 1, 1,
-0.05311743, 0.9789531, -1.227355, 1, 1, 1, 1, 1,
-0.05091273, 1.217073, 0.6778778, 1, 1, 1, 1, 1,
-0.04625724, -0.01956188, -1.564436, 1, 1, 1, 1, 1,
-0.04088913, 0.2626725, 0.7624243, 1, 1, 1, 1, 1,
-0.03718157, 0.08235819, -0.5428647, 1, 1, 1, 1, 1,
-0.03609311, -0.5907055, -1.839706, 1, 1, 1, 1, 1,
-0.03528617, -2.662774, -5.072486, 1, 1, 1, 1, 1,
-0.03432292, 0.5821999, 1.574448, 1, 1, 1, 1, 1,
-0.03027938, -0.1830067, -3.148606, 1, 1, 1, 1, 1,
-0.02641367, -1.121392, -5.113728, 1, 1, 1, 1, 1,
-0.02451305, 2.035119, 0.8501271, 1, 1, 1, 1, 1,
-0.01984318, -1.578813, -2.155569, 1, 1, 1, 1, 1,
-0.01795785, -0.5188326, -3.415247, 1, 1, 1, 1, 1,
-0.0170469, -1.097675, -5.576183, 1, 1, 1, 1, 1,
-0.01633489, 1.465441, -2.117033, 0, 0, 1, 1, 1,
-0.01432918, -0.9515883, -3.591577, 1, 0, 0, 1, 1,
-0.01190877, 2.264953, -0.9157356, 1, 0, 0, 1, 1,
-0.01096206, -1.490595, -4.813898, 1, 0, 0, 1, 1,
-0.005812489, -0.1062958, -1.843754, 1, 0, 0, 1, 1,
-0.0009924102, -1.008261, -4.415329, 1, 0, 0, 1, 1,
-0.0009827047, 0.8014658, -0.9441364, 0, 0, 0, 1, 1,
0.004810919, 0.3667917, 1.125048, 0, 0, 0, 1, 1,
0.009715414, -0.3610264, 3.25762, 0, 0, 0, 1, 1,
0.01001399, -1.652222, 3.155907, 0, 0, 0, 1, 1,
0.0164247, -0.1827599, 3.285204, 0, 0, 0, 1, 1,
0.01707732, -1.907484, 3.140986, 0, 0, 0, 1, 1,
0.01772362, 0.3242895, 0.4336255, 0, 0, 0, 1, 1,
0.02749228, -0.2598742, 4.317727, 1, 1, 1, 1, 1,
0.03179001, -0.2621696, 1.869134, 1, 1, 1, 1, 1,
0.03205817, -0.3122963, 3.798941, 1, 1, 1, 1, 1,
0.03496121, 0.02121671, 0.2036978, 1, 1, 1, 1, 1,
0.04004967, -0.6743252, 3.263155, 1, 1, 1, 1, 1,
0.040117, -0.1276061, 1.688266, 1, 1, 1, 1, 1,
0.04436986, 2.030308, -0.3159148, 1, 1, 1, 1, 1,
0.04696544, -1.219087, 4.416965, 1, 1, 1, 1, 1,
0.04753287, -0.769216, 4.259488, 1, 1, 1, 1, 1,
0.04870196, 0.3308488, 0.1845037, 1, 1, 1, 1, 1,
0.05022762, 0.03169162, 0.4597145, 1, 1, 1, 1, 1,
0.05146647, -0.2447149, 3.632826, 1, 1, 1, 1, 1,
0.07226973, 0.1994049, 0.007428858, 1, 1, 1, 1, 1,
0.07292219, 0.0357463, 3.427977, 1, 1, 1, 1, 1,
0.07300652, 0.2050738, -0.2783423, 1, 1, 1, 1, 1,
0.07340039, 0.5725402, 0.5275813, 0, 0, 1, 1, 1,
0.07779276, -1.064482, 3.501908, 1, 0, 0, 1, 1,
0.07830629, -0.8700747, 3.384198, 1, 0, 0, 1, 1,
0.07913285, 0.7012157, 1.636656, 1, 0, 0, 1, 1,
0.08411514, 1.105194, 1.250634, 1, 0, 0, 1, 1,
0.0943709, 0.1741263, 0.669763, 1, 0, 0, 1, 1,
0.09476068, 1.465212, -1.657951, 0, 0, 0, 1, 1,
0.1006988, -1.754019, 1.169243, 0, 0, 0, 1, 1,
0.1016953, 0.8245953, -0.9843052, 0, 0, 0, 1, 1,
0.1025268, 0.9002337, 1.933805, 0, 0, 0, 1, 1,
0.1057152, 1.778799, 0.121723, 0, 0, 0, 1, 1,
0.1065646, 0.06944449, 3.090535, 0, 0, 0, 1, 1,
0.1191789, -0.430464, 2.917826, 0, 0, 0, 1, 1,
0.1209673, 0.2813683, 1.433731, 1, 1, 1, 1, 1,
0.1215106, -0.7854619, 3.119721, 1, 1, 1, 1, 1,
0.123471, -0.03909406, 2.847131, 1, 1, 1, 1, 1,
0.1272395, -0.301416, 2.461942, 1, 1, 1, 1, 1,
0.131538, -0.793183, 3.718712, 1, 1, 1, 1, 1,
0.1330286, 0.3682883, -0.1542976, 1, 1, 1, 1, 1,
0.1394857, -1.828769, 3.289781, 1, 1, 1, 1, 1,
0.1398014, -0.1845322, 3.50299, 1, 1, 1, 1, 1,
0.1538202, 0.5418984, 0.6765095, 1, 1, 1, 1, 1,
0.1554203, -1.108339, 3.178194, 1, 1, 1, 1, 1,
0.156918, -0.02254619, -0.08849076, 1, 1, 1, 1, 1,
0.1581797, -0.9354135, 3.588623, 1, 1, 1, 1, 1,
0.1595961, -0.1468265, 2.11102, 1, 1, 1, 1, 1,
0.1613813, -0.6813883, 3.788119, 1, 1, 1, 1, 1,
0.163729, -2.488029, 3.360818, 1, 1, 1, 1, 1,
0.1669639, -0.8297152, 2.958699, 0, 0, 1, 1, 1,
0.1680078, 0.302392, -1.211333, 1, 0, 0, 1, 1,
0.1711746, -2.600018, 1.419786, 1, 0, 0, 1, 1,
0.176311, 0.6435803, -0.6206686, 1, 0, 0, 1, 1,
0.1867092, 2.280056, 1.950853, 1, 0, 0, 1, 1,
0.1873673, 0.1252115, 0.8455826, 1, 0, 0, 1, 1,
0.1905792, 0.8054417, 0.09977368, 0, 0, 0, 1, 1,
0.1919621, 0.7617165, -1.664714, 0, 0, 0, 1, 1,
0.1994225, -1.273231, 3.30142, 0, 0, 0, 1, 1,
0.2001745, 0.3211239, 1.86129, 0, 0, 0, 1, 1,
0.2024372, -1.025235, 2.137245, 0, 0, 0, 1, 1,
0.204371, -0.1544293, 0.9677458, 0, 0, 0, 1, 1,
0.2105246, -1.664814, 3.183095, 0, 0, 0, 1, 1,
0.2119608, -1.308049, 2.878539, 1, 1, 1, 1, 1,
0.2122532, -0.7945682, 2.378474, 1, 1, 1, 1, 1,
0.2130744, -0.3911092, 3.262813, 1, 1, 1, 1, 1,
0.215495, -0.9854464, 2.454057, 1, 1, 1, 1, 1,
0.2176874, 1.633641, -0.8682731, 1, 1, 1, 1, 1,
0.2205907, -0.8601711, 1.924085, 1, 1, 1, 1, 1,
0.2210607, 0.1273425, 2.142156, 1, 1, 1, 1, 1,
0.2212626, 1.521906, 0.1998469, 1, 1, 1, 1, 1,
0.2231246, 0.2322235, 1.536513, 1, 1, 1, 1, 1,
0.2277272, 0.2118301, -0.3171938, 1, 1, 1, 1, 1,
0.2305349, 0.2107462, -0.8332433, 1, 1, 1, 1, 1,
0.2324664, -1.22949, 0.8338465, 1, 1, 1, 1, 1,
0.2387892, -0.582674, 2.759063, 1, 1, 1, 1, 1,
0.2417275, 0.9420535, 0.4049667, 1, 1, 1, 1, 1,
0.2427812, 0.6287078, 1.205984, 1, 1, 1, 1, 1,
0.2451258, 1.408912, 0.00824837, 0, 0, 1, 1, 1,
0.2469267, 1.809472, 0.3217049, 1, 0, 0, 1, 1,
0.2480097, 0.2596543, 2.796825, 1, 0, 0, 1, 1,
0.2485304, 0.3291562, 0.7007574, 1, 0, 0, 1, 1,
0.2486617, 1.591043, -0.1537366, 1, 0, 0, 1, 1,
0.255462, -0.6169905, 2.173916, 1, 0, 0, 1, 1,
0.259893, 0.524288, 1.381122, 0, 0, 0, 1, 1,
0.2626456, -1.481683, 4.706622, 0, 0, 0, 1, 1,
0.2631755, 0.7211309, 0.3693074, 0, 0, 0, 1, 1,
0.2709374, -0.8397973, 4.105668, 0, 0, 0, 1, 1,
0.2710108, -0.1993319, 1.765151, 0, 0, 0, 1, 1,
0.2712725, -0.493366, 1.89948, 0, 0, 0, 1, 1,
0.2737623, 0.81897, 0.3393902, 0, 0, 0, 1, 1,
0.2831672, 0.4728167, 0.5266745, 1, 1, 1, 1, 1,
0.286376, -0.2484183, 1.487465, 1, 1, 1, 1, 1,
0.2864351, 0.2006186, 1.519191, 1, 1, 1, 1, 1,
0.2885615, -1.103735, 3.138022, 1, 1, 1, 1, 1,
0.2911544, -0.5348636, 3.64439, 1, 1, 1, 1, 1,
0.2914222, 0.1912773, 0.4795267, 1, 1, 1, 1, 1,
0.2917179, -1.240879, 2.001652, 1, 1, 1, 1, 1,
0.2982231, 1.408465, 0.5276233, 1, 1, 1, 1, 1,
0.2992637, -0.8675419, 0.5856614, 1, 1, 1, 1, 1,
0.3035847, -0.1689002, -0.04233281, 1, 1, 1, 1, 1,
0.3056359, 0.7001719, 0.9751035, 1, 1, 1, 1, 1,
0.305777, -0.2641012, -0.6502277, 1, 1, 1, 1, 1,
0.3074248, -1.484218, 4.64408, 1, 1, 1, 1, 1,
0.3099105, 0.4593968, 1.773665, 1, 1, 1, 1, 1,
0.3112041, -0.1834371, 4.333542, 1, 1, 1, 1, 1,
0.3118868, -0.2276708, 1.964468, 0, 0, 1, 1, 1,
0.3145685, 0.8966249, 0.1834621, 1, 0, 0, 1, 1,
0.3235638, -1.684591, 3.406008, 1, 0, 0, 1, 1,
0.3286927, 0.4140637, 0.8376342, 1, 0, 0, 1, 1,
0.3296561, 0.503502, 2.347401, 1, 0, 0, 1, 1,
0.3325708, -0.6278074, 2.841914, 1, 0, 0, 1, 1,
0.3371166, -0.2200816, 0.4425751, 0, 0, 0, 1, 1,
0.3377789, 0.2131361, 2.68886, 0, 0, 0, 1, 1,
0.3430615, -0.2676224, 0.1679163, 0, 0, 0, 1, 1,
0.344025, -0.7464056, 5.351177, 0, 0, 0, 1, 1,
0.3452012, 0.9003018, -0.1024386, 0, 0, 0, 1, 1,
0.3464979, 0.7146307, 0.362386, 0, 0, 0, 1, 1,
0.3477117, -0.5583173, 2.828098, 0, 0, 0, 1, 1,
0.3502689, 0.5814825, 0.7158968, 1, 1, 1, 1, 1,
0.3519205, -1.982344, 3.933449, 1, 1, 1, 1, 1,
0.3553057, -0.462289, 2.016548, 1, 1, 1, 1, 1,
0.3588799, -0.8251862, 2.969538, 1, 1, 1, 1, 1,
0.3628193, 1.506944, 0.5970813, 1, 1, 1, 1, 1,
0.3629738, -0.386159, 2.505283, 1, 1, 1, 1, 1,
0.363723, 1.133423, 0.5654015, 1, 1, 1, 1, 1,
0.3697287, 0.11351, 1.728242, 1, 1, 1, 1, 1,
0.3709741, 1.490691, -2.474188, 1, 1, 1, 1, 1,
0.3739378, 0.2859673, 1.465401, 1, 1, 1, 1, 1,
0.3799838, 0.06223481, 0.6123415, 1, 1, 1, 1, 1,
0.3802223, 1.701103, 0.5902519, 1, 1, 1, 1, 1,
0.3839417, -1.041727, 1.156169, 1, 1, 1, 1, 1,
0.3840712, 1.214965, -0.9769853, 1, 1, 1, 1, 1,
0.3850282, -0.704165, 1.983227, 1, 1, 1, 1, 1,
0.3854307, -0.9734878, 3.393447, 0, 0, 1, 1, 1,
0.3871607, 3.161514, -0.0008948553, 1, 0, 0, 1, 1,
0.3873502, 0.009994919, 1.890615, 1, 0, 0, 1, 1,
0.38903, -1.554809, 3.840141, 1, 0, 0, 1, 1,
0.3907019, -0.8759873, 2.693468, 1, 0, 0, 1, 1,
0.3914673, 0.5583916, 0.4538021, 1, 0, 0, 1, 1,
0.3962787, -1.929305, 2.786187, 0, 0, 0, 1, 1,
0.4021022, 0.286364, -0.3806758, 0, 0, 0, 1, 1,
0.4021971, -0.1084478, 1.60805, 0, 0, 0, 1, 1,
0.4068284, -1.500057, 2.944715, 0, 0, 0, 1, 1,
0.4074687, 1.003274, 0.5457331, 0, 0, 0, 1, 1,
0.4081739, 0.7227923, -0.2299727, 0, 0, 0, 1, 1,
0.4102684, -0.2248311, 0.5968609, 0, 0, 0, 1, 1,
0.4146161, -0.7358986, 2.574385, 1, 1, 1, 1, 1,
0.4165197, 0.02050043, 1.984486, 1, 1, 1, 1, 1,
0.4190584, -1.570479, 3.230584, 1, 1, 1, 1, 1,
0.4203828, -0.2511801, 2.426161, 1, 1, 1, 1, 1,
0.424519, 0.4095004, 1.343447, 1, 1, 1, 1, 1,
0.4330649, -2.127873, 3.501086, 1, 1, 1, 1, 1,
0.4345663, 0.6786879, 0.6943799, 1, 1, 1, 1, 1,
0.4442362, -2.034258, 1.619445, 1, 1, 1, 1, 1,
0.4446464, 1.194252, 0.9116128, 1, 1, 1, 1, 1,
0.4485017, -0.5225557, 1.76102, 1, 1, 1, 1, 1,
0.4529294, 0.2432591, 0.9206882, 1, 1, 1, 1, 1,
0.4550127, -1.183121, 3.564687, 1, 1, 1, 1, 1,
0.4598316, -0.477131, 4.006179, 1, 1, 1, 1, 1,
0.461008, 0.6972865, -1.289265, 1, 1, 1, 1, 1,
0.4612154, -3.076544, 3.465626, 1, 1, 1, 1, 1,
0.4615007, -1.93757, 2.643721, 0, 0, 1, 1, 1,
0.464498, 1.202623, -0.3755114, 1, 0, 0, 1, 1,
0.4649324, -0.4201016, 1.335704, 1, 0, 0, 1, 1,
0.4679565, 0.3169226, 2.127239, 1, 0, 0, 1, 1,
0.4697981, 1.846263, 0.7826679, 1, 0, 0, 1, 1,
0.4727399, 0.212715, 1.09338, 1, 0, 0, 1, 1,
0.4745763, 1.9443, -0.5674985, 0, 0, 0, 1, 1,
0.4784428, 0.734128, -2.205318, 0, 0, 0, 1, 1,
0.4861387, 0.1223147, 1.818179, 0, 0, 0, 1, 1,
0.4867991, 0.3595278, 2.285113, 0, 0, 0, 1, 1,
0.4876878, -0.2049647, 1.284951, 0, 0, 0, 1, 1,
0.4915744, 0.8769578, 2.033271, 0, 0, 0, 1, 1,
0.4923424, 0.2936224, 1.739353, 0, 0, 0, 1, 1,
0.4955846, 0.06102164, 1.968308, 1, 1, 1, 1, 1,
0.4983585, 1.476252, 0.6572517, 1, 1, 1, 1, 1,
0.5073752, 1.647025, 1.230813, 1, 1, 1, 1, 1,
0.50877, -0.2624727, 2.484283, 1, 1, 1, 1, 1,
0.5091087, -0.4514742, 3.660437, 1, 1, 1, 1, 1,
0.5094392, -0.976241, 2.313215, 1, 1, 1, 1, 1,
0.510213, 1.10503, 1.42006, 1, 1, 1, 1, 1,
0.5118342, 1.238942, -0.3795241, 1, 1, 1, 1, 1,
0.5129601, -1.075713, 3.831547, 1, 1, 1, 1, 1,
0.5210602, 0.413798, 0.3000776, 1, 1, 1, 1, 1,
0.5212635, -0.3918231, 2.917213, 1, 1, 1, 1, 1,
0.5230491, 1.453298, 1.152726, 1, 1, 1, 1, 1,
0.5254067, -2.435435, 2.474306, 1, 1, 1, 1, 1,
0.5264358, -0.1324355, 2.608617, 1, 1, 1, 1, 1,
0.5315586, 0.579182, -0.5359663, 1, 1, 1, 1, 1,
0.5326938, 0.3433811, 1.515209, 0, 0, 1, 1, 1,
0.5343667, 0.07293618, 1.689195, 1, 0, 0, 1, 1,
0.5389411, -1.133098, 3.722694, 1, 0, 0, 1, 1,
0.5461376, 2.130208, -0.1075837, 1, 0, 0, 1, 1,
0.5470442, -1.656723, 2.262075, 1, 0, 0, 1, 1,
0.5491785, -0.00282224, 0.1964532, 1, 0, 0, 1, 1,
0.554546, 1.718714, 0.2702931, 0, 0, 0, 1, 1,
0.5554768, 0.3781167, 1.557865, 0, 0, 0, 1, 1,
0.5569384, -0.2411421, 0.2882544, 0, 0, 0, 1, 1,
0.5577863, -0.6394519, 1.878679, 0, 0, 0, 1, 1,
0.5579963, 0.07110796, 0.5188034, 0, 0, 0, 1, 1,
0.5591477, 1.466686, 0.6181189, 0, 0, 0, 1, 1,
0.5610811, 0.2563682, 1.211368, 0, 0, 0, 1, 1,
0.5618364, 0.6347003, 0.2387801, 1, 1, 1, 1, 1,
0.5663213, -0.2915165, 1.980638, 1, 1, 1, 1, 1,
0.5670264, 1.131809, -0.1549028, 1, 1, 1, 1, 1,
0.5677502, 0.4450975, 0.03816375, 1, 1, 1, 1, 1,
0.5698698, -0.3467591, 2.488651, 1, 1, 1, 1, 1,
0.5707794, 1.133959, 1.908371, 1, 1, 1, 1, 1,
0.5732378, 0.4145262, 3.11399, 1, 1, 1, 1, 1,
0.5740822, 0.3273754, 0.6464573, 1, 1, 1, 1, 1,
0.5741376, -0.4201518, 1.842759, 1, 1, 1, 1, 1,
0.5771978, 0.5084519, -0.7857231, 1, 1, 1, 1, 1,
0.578146, -1.191071, 1.626508, 1, 1, 1, 1, 1,
0.5820292, -0.2457251, 1.611013, 1, 1, 1, 1, 1,
0.5828686, -0.2699572, 0.5178049, 1, 1, 1, 1, 1,
0.587472, 1.540856, -1.2204, 1, 1, 1, 1, 1,
0.5892251, -0.7418143, 2.454928, 1, 1, 1, 1, 1,
0.5982535, 0.1599298, 2.236419, 0, 0, 1, 1, 1,
0.6019198, 0.424289, 3.144169, 1, 0, 0, 1, 1,
0.60347, -0.157029, 1.796897, 1, 0, 0, 1, 1,
0.6042692, -0.9381265, 3.322043, 1, 0, 0, 1, 1,
0.6053801, -0.3063839, 1.158103, 1, 0, 0, 1, 1,
0.611469, 0.5807952, -0.7939386, 1, 0, 0, 1, 1,
0.6130623, -0.2837937, 2.67881, 0, 0, 0, 1, 1,
0.6142407, 0.2482463, 2.874622, 0, 0, 0, 1, 1,
0.6170525, 0.1894297, 2.639597, 0, 0, 0, 1, 1,
0.6179535, 1.797235, 0.2841444, 0, 0, 0, 1, 1,
0.6191456, -1.10385, 2.367245, 0, 0, 0, 1, 1,
0.6257533, 0.2134338, 2.17024, 0, 0, 0, 1, 1,
0.630419, 1.291696, 2.174519, 0, 0, 0, 1, 1,
0.6365679, 0.2699093, 1.310091, 1, 1, 1, 1, 1,
0.6368377, -1.344364, 2.347132, 1, 1, 1, 1, 1,
0.6447992, 0.08034267, 2.21581, 1, 1, 1, 1, 1,
0.6567884, -0.8744327, 4.322728, 1, 1, 1, 1, 1,
0.6572412, 1.085585, -1.318615, 1, 1, 1, 1, 1,
0.6629493, -0.9033303, 2.887269, 1, 1, 1, 1, 1,
0.6638939, -0.3968651, 1.301185, 1, 1, 1, 1, 1,
0.6677458, 0.7885626, -0.3700951, 1, 1, 1, 1, 1,
0.6692558, -1.662362, 1.460233, 1, 1, 1, 1, 1,
0.6717011, 0.05525026, 1.15423, 1, 1, 1, 1, 1,
0.6837876, 0.5000948, 1.701482, 1, 1, 1, 1, 1,
0.6839807, 0.1800187, 2.383032, 1, 1, 1, 1, 1,
0.6845694, 1.120994, 1.126178, 1, 1, 1, 1, 1,
0.6863907, -0.5121064, 2.888034, 1, 1, 1, 1, 1,
0.6988102, 0.003982369, 1.171567, 1, 1, 1, 1, 1,
0.7037556, -0.4382013, 2.006871, 0, 0, 1, 1, 1,
0.7094575, 0.7571317, 1.424649, 1, 0, 0, 1, 1,
0.711118, -1.013949, 1.189484, 1, 0, 0, 1, 1,
0.7117612, -1.673247, 3.026408, 1, 0, 0, 1, 1,
0.7124509, 2.102088, -0.03296619, 1, 0, 0, 1, 1,
0.7163244, -0.8922298, 4.175709, 1, 0, 0, 1, 1,
0.7171293, -0.7408597, 3.370215, 0, 0, 0, 1, 1,
0.7178124, 0.07571037, 0.6950961, 0, 0, 0, 1, 1,
0.7257277, -0.1469752, 1.857441, 0, 0, 0, 1, 1,
0.7324862, 1.229223, -0.4843911, 0, 0, 0, 1, 1,
0.7343305, 0.129458, 2.277634, 0, 0, 0, 1, 1,
0.7449331, 0.5023578, 1.148095, 0, 0, 0, 1, 1,
0.7458161, 0.7234089, 0.5031305, 0, 0, 0, 1, 1,
0.7503893, 0.6853092, 0.8150024, 1, 1, 1, 1, 1,
0.7507924, 0.1565625, 1.96832, 1, 1, 1, 1, 1,
0.7536875, 0.4565423, 0.9367812, 1, 1, 1, 1, 1,
0.7544396, 0.2763969, 1.84989, 1, 1, 1, 1, 1,
0.7574592, -1.326296, 3.623235, 1, 1, 1, 1, 1,
0.7602447, 1.840408, 0.5086086, 1, 1, 1, 1, 1,
0.7613624, 1.368909, 1.356929, 1, 1, 1, 1, 1,
0.7647126, 0.6346812, 1.502804, 1, 1, 1, 1, 1,
0.7654853, 0.4063753, -0.9224108, 1, 1, 1, 1, 1,
0.7728928, -0.06010257, 0.3971293, 1, 1, 1, 1, 1,
0.7752734, 0.4187627, 2.6266, 1, 1, 1, 1, 1,
0.7841942, 0.7871823, 0.7880732, 1, 1, 1, 1, 1,
0.7935865, 1.624923, 0.9445742, 1, 1, 1, 1, 1,
0.7936831, -0.3900313, 2.32252, 1, 1, 1, 1, 1,
0.7952123, -0.777221, 1.424391, 1, 1, 1, 1, 1,
0.7963746, -1.303907, 1.389193, 0, 0, 1, 1, 1,
0.7973345, 0.7096064, 0.9583141, 1, 0, 0, 1, 1,
0.7977509, -0.1669894, -0.4756335, 1, 0, 0, 1, 1,
0.8003733, -0.7779173, 3.934687, 1, 0, 0, 1, 1,
0.8141261, -0.5432839, 1.061754, 1, 0, 0, 1, 1,
0.8146468, -0.3659453, 1.871329, 1, 0, 0, 1, 1,
0.8180541, -0.00275874, 0.8728348, 0, 0, 0, 1, 1,
0.8278884, -0.479476, 2.240298, 0, 0, 0, 1, 1,
0.8314715, 1.472472, -0.5893633, 0, 0, 0, 1, 1,
0.8392056, 0.2469032, 2.27447, 0, 0, 0, 1, 1,
0.8483802, 0.02172689, 4.114711, 0, 0, 0, 1, 1,
0.8549263, 0.3428332, 0.2737495, 0, 0, 0, 1, 1,
0.856903, -1.316723, 2.781179, 0, 0, 0, 1, 1,
0.8579352, -1.222889, 1.82852, 1, 1, 1, 1, 1,
0.8603449, 0.2095152, 2.467076, 1, 1, 1, 1, 1,
0.8609624, 1.06885, 0.7768694, 1, 1, 1, 1, 1,
0.8618209, -2.007544, 1.19034, 1, 1, 1, 1, 1,
0.8636901, -0.4264443, -0.590597, 1, 1, 1, 1, 1,
0.871251, 1.344753, -0.5682419, 1, 1, 1, 1, 1,
0.8763542, 0.568541, 2.699575, 1, 1, 1, 1, 1,
0.8799104, 0.5527275, 2.532527, 1, 1, 1, 1, 1,
0.8802333, 1.952531, -0.08390318, 1, 1, 1, 1, 1,
0.8919424, 1.239667, 0.2223727, 1, 1, 1, 1, 1,
0.893029, -1.064746, 2.844141, 1, 1, 1, 1, 1,
0.8998713, 0.3166551, 0.8305364, 1, 1, 1, 1, 1,
0.9042567, 0.8885893, 1.514941, 1, 1, 1, 1, 1,
0.905427, 1.492419, 2.73436, 1, 1, 1, 1, 1,
0.9117091, -1.87314, 2.812175, 1, 1, 1, 1, 1,
0.9119592, 0.4172738, 1.476493, 0, 0, 1, 1, 1,
0.9153722, 0.2375423, 0.03597538, 1, 0, 0, 1, 1,
0.9172511, 1.122397, -1.05018, 1, 0, 0, 1, 1,
0.9181083, -0.6736089, 2.17112, 1, 0, 0, 1, 1,
0.9187864, -0.09232239, 1.971064, 1, 0, 0, 1, 1,
0.9311991, -0.9373636, 2.806381, 1, 0, 0, 1, 1,
0.9314941, 0.6864206, 1.202327, 0, 0, 0, 1, 1,
0.9362431, -0.7281039, 2.318735, 0, 0, 0, 1, 1,
0.9421778, 1.601005, 0.5084192, 0, 0, 0, 1, 1,
0.9440229, -0.6677541, 2.648773, 0, 0, 0, 1, 1,
0.9500815, 0.7420287, 0.2446405, 0, 0, 0, 1, 1,
0.9516076, -0.1870177, 1.303706, 0, 0, 0, 1, 1,
0.9529173, -0.7287872, 1.814757, 0, 0, 0, 1, 1,
0.9539098, 0.3496934, 3.091659, 1, 1, 1, 1, 1,
0.9595944, 1.019009, -0.8022775, 1, 1, 1, 1, 1,
0.9633573, -1.090692, 3.537509, 1, 1, 1, 1, 1,
0.9647402, 0.4929405, 1.153449, 1, 1, 1, 1, 1,
0.9666004, -0.1096684, 0.9224308, 1, 1, 1, 1, 1,
0.9701227, -1.526959, 3.42738, 1, 1, 1, 1, 1,
0.978282, -0.03713807, 0.6148411, 1, 1, 1, 1, 1,
0.9897582, -0.17555, 1.690682, 1, 1, 1, 1, 1,
0.9906752, -1.272496, 2.531552, 1, 1, 1, 1, 1,
0.9925273, -2.029775, 3.95551, 1, 1, 1, 1, 1,
0.9925853, -0.4501522, 2.595835, 1, 1, 1, 1, 1,
0.9928811, 0.5987576, 0.5588841, 1, 1, 1, 1, 1,
0.9939006, -1.220734, 2.906573, 1, 1, 1, 1, 1,
1.004075, 1.054702, 0.03117127, 1, 1, 1, 1, 1,
1.012108, 1.501675, 1.596003, 1, 1, 1, 1, 1,
1.01521, 0.2520676, 1.860738, 0, 0, 1, 1, 1,
1.021758, 0.823078, 0.6531894, 1, 0, 0, 1, 1,
1.022135, -0.8709388, 2.295966, 1, 0, 0, 1, 1,
1.022525, -1.057934, 2.546902, 1, 0, 0, 1, 1,
1.023304, 1.120354, 1.036726, 1, 0, 0, 1, 1,
1.02407, 0.9514825, 3.475268, 1, 0, 0, 1, 1,
1.025366, 0.3832871, 1.501942, 0, 0, 0, 1, 1,
1.031159, 0.5329849, 0.567663, 0, 0, 0, 1, 1,
1.033768, 1.063725, 2.235904, 0, 0, 0, 1, 1,
1.035772, 0.777158, 0.2885803, 0, 0, 0, 1, 1,
1.037708, 1.637725, 1.814607, 0, 0, 0, 1, 1,
1.038717, 0.6923177, 0.1905296, 0, 0, 0, 1, 1,
1.046637, 0.8099707, -1.106367, 0, 0, 0, 1, 1,
1.05852, 0.4316964, 1.80261, 1, 1, 1, 1, 1,
1.071567, -0.6499873, 1.644563, 1, 1, 1, 1, 1,
1.07326, -0.0281117, 1.098016, 1, 1, 1, 1, 1,
1.074886, 0.8341777, -0.1434194, 1, 1, 1, 1, 1,
1.075579, 0.1921453, 1.256723, 1, 1, 1, 1, 1,
1.078292, -1.62451, 2.52462, 1, 1, 1, 1, 1,
1.079571, -1.362861, 4.461086, 1, 1, 1, 1, 1,
1.086499, 0.3868146, 0.4195308, 1, 1, 1, 1, 1,
1.094767, -0.005504207, 2.368828, 1, 1, 1, 1, 1,
1.102182, 0.8488863, 1.394565, 1, 1, 1, 1, 1,
1.108635, -0.1434558, 2.168925, 1, 1, 1, 1, 1,
1.113028, 0.1294366, 2.500718, 1, 1, 1, 1, 1,
1.11379, -2.065484, 3.185596, 1, 1, 1, 1, 1,
1.115096, 0.1084214, 0.9021673, 1, 1, 1, 1, 1,
1.115142, -1.520196, 0.9828703, 1, 1, 1, 1, 1,
1.115641, -0.1810625, 0.3947161, 0, 0, 1, 1, 1,
1.117945, -0.2682303, 1.782362, 1, 0, 0, 1, 1,
1.122726, -0.2601215, 1.669563, 1, 0, 0, 1, 1,
1.125689, 0.7231398, 0.8713528, 1, 0, 0, 1, 1,
1.128102, -1.483522, 2.205257, 1, 0, 0, 1, 1,
1.133276, 0.4915597, 1.874526, 1, 0, 0, 1, 1,
1.135165, -0.6246317, 0.2507622, 0, 0, 0, 1, 1,
1.135311, 0.1074106, 1.063934, 0, 0, 0, 1, 1,
1.135599, 1.096683, 3.115045, 0, 0, 0, 1, 1,
1.136972, -0.3904638, 3.305734, 0, 0, 0, 1, 1,
1.137463, 1.077824, -0.6249971, 0, 0, 0, 1, 1,
1.138787, -0.2653449, 1.892712, 0, 0, 0, 1, 1,
1.145738, 0.1621725, 0.6251495, 0, 0, 0, 1, 1,
1.149614, -1.677279, 3.308666, 1, 1, 1, 1, 1,
1.153058, 0.9370031, 1.829732, 1, 1, 1, 1, 1,
1.16353, -0.3128907, 2.617198, 1, 1, 1, 1, 1,
1.168003, 1.038252, 0.5358605, 1, 1, 1, 1, 1,
1.175794, -0.2224346, 1.735134, 1, 1, 1, 1, 1,
1.180224, -1.392842, 2.72259, 1, 1, 1, 1, 1,
1.181487, 1.187774, 0.8828599, 1, 1, 1, 1, 1,
1.195159, 0.03055161, -0.840109, 1, 1, 1, 1, 1,
1.198438, 0.08980415, 1.301663, 1, 1, 1, 1, 1,
1.200987, 0.09115971, 3.72017, 1, 1, 1, 1, 1,
1.202327, -0.2049714, 2.650475, 1, 1, 1, 1, 1,
1.203626, -0.6055636, 2.213057, 1, 1, 1, 1, 1,
1.213929, 1.226475, 0.6419151, 1, 1, 1, 1, 1,
1.214304, 0.7633628, -0.4609883, 1, 1, 1, 1, 1,
1.232468, 0.4687821, 2.356391, 1, 1, 1, 1, 1,
1.236406, 0.04507448, 1.722674, 0, 0, 1, 1, 1,
1.236618, -1.035077, 3.900744, 1, 0, 0, 1, 1,
1.24382, -0.224982, 1.669293, 1, 0, 0, 1, 1,
1.248827, 0.7344311, 0.2713725, 1, 0, 0, 1, 1,
1.250652, 0.8005847, -0.05862541, 1, 0, 0, 1, 1,
1.250983, 0.8984092, 1.796443, 1, 0, 0, 1, 1,
1.251664, 0.9496109, -0.00717127, 0, 0, 0, 1, 1,
1.259066, -0.3396167, 1.381899, 0, 0, 0, 1, 1,
1.261029, -0.4850264, 1.962583, 0, 0, 0, 1, 1,
1.261844, 0.8547643, 1.644174, 0, 0, 0, 1, 1,
1.26351, 0.4067863, 0.765488, 0, 0, 0, 1, 1,
1.263526, -0.791937, 3.336274, 0, 0, 0, 1, 1,
1.267838, -0.01224738, 3.799662, 0, 0, 0, 1, 1,
1.272333, -1.701394, 3.138961, 1, 1, 1, 1, 1,
1.292912, 0.4682101, 2.029073, 1, 1, 1, 1, 1,
1.298287, -0.497509, 3.430214, 1, 1, 1, 1, 1,
1.298324, 0.506724, 3.429101, 1, 1, 1, 1, 1,
1.298329, 0.2460495, 0.2477207, 1, 1, 1, 1, 1,
1.30287, 0.7186857, 0.01346576, 1, 1, 1, 1, 1,
1.30779, 1.561869, 0.1362392, 1, 1, 1, 1, 1,
1.313017, -0.2845626, 2.022305, 1, 1, 1, 1, 1,
1.321162, 0.4860075, 0.9624934, 1, 1, 1, 1, 1,
1.331106, 0.550997, 1.38142, 1, 1, 1, 1, 1,
1.346626, 0.1175155, 1.922961, 1, 1, 1, 1, 1,
1.353588, -1.648014, 2.104388, 1, 1, 1, 1, 1,
1.366353, -0.6459636, 2.238883, 1, 1, 1, 1, 1,
1.376263, 0.03170978, 2.379898, 1, 1, 1, 1, 1,
1.378086, 0.8907551, 1.378426, 1, 1, 1, 1, 1,
1.382812, -1.264304, 1.936628, 0, 0, 1, 1, 1,
1.390373, 0.3687495, 1.3261, 1, 0, 0, 1, 1,
1.400823, 0.9703545, 0.9086061, 1, 0, 0, 1, 1,
1.403533, -0.2259023, 2.82434, 1, 0, 0, 1, 1,
1.414224, 2.185397, 0.8197519, 1, 0, 0, 1, 1,
1.424328, -0.6874456, 1.49668, 1, 0, 0, 1, 1,
1.437177, -1.234797, 0.02043953, 0, 0, 0, 1, 1,
1.437407, 0.2752671, 1.110548, 0, 0, 0, 1, 1,
1.448336, -0.2020209, 3.316981, 0, 0, 0, 1, 1,
1.45208, -1.673057, 2.160838, 0, 0, 0, 1, 1,
1.45664, 2.072019, 1.872661, 0, 0, 0, 1, 1,
1.460927, 1.853694, 1.0975, 0, 0, 0, 1, 1,
1.461806, 1.133711, 1.422675, 0, 0, 0, 1, 1,
1.464744, -1.201372, 1.918348, 1, 1, 1, 1, 1,
1.477563, -0.6727602, 2.587069, 1, 1, 1, 1, 1,
1.48918, -0.714559, 2.104076, 1, 1, 1, 1, 1,
1.491613, 1.090079, 1.095589, 1, 1, 1, 1, 1,
1.493124, -0.8033671, 3.570163, 1, 1, 1, 1, 1,
1.503148, -0.2738791, 2.620602, 1, 1, 1, 1, 1,
1.508457, 1.889678, 2.002568, 1, 1, 1, 1, 1,
1.530719, 1.550945, -0.6313663, 1, 1, 1, 1, 1,
1.532576, -1.204578, 2.904228, 1, 1, 1, 1, 1,
1.532787, -0.7727723, 1.55341, 1, 1, 1, 1, 1,
1.543492, 1.077062, 0.2673928, 1, 1, 1, 1, 1,
1.550957, -1.318025, 2.897017, 1, 1, 1, 1, 1,
1.551581, -0.002962002, 0.8514271, 1, 1, 1, 1, 1,
1.556062, -0.9605733, 0.6118528, 1, 1, 1, 1, 1,
1.567012, 0.03734295, 0.3950174, 1, 1, 1, 1, 1,
1.585236, -1.652653, 2.926168, 0, 0, 1, 1, 1,
1.624252, 2.923752, -0.7068796, 1, 0, 0, 1, 1,
1.640343, 1.576681, -0.7511847, 1, 0, 0, 1, 1,
1.65693, -0.9435121, 2.401151, 1, 0, 0, 1, 1,
1.66696, 0.9510025, 1.755703, 1, 0, 0, 1, 1,
1.670084, -0.6073815, 2.286657, 1, 0, 0, 1, 1,
1.680205, 0.7817701, 0.5690635, 0, 0, 0, 1, 1,
1.687112, 1.678449, 0.2269658, 0, 0, 0, 1, 1,
1.697736, 0.06081578, 3.345913, 0, 0, 0, 1, 1,
1.710402, -1.649849, 2.827163, 0, 0, 0, 1, 1,
1.725987, -0.6240668, 3.591185, 0, 0, 0, 1, 1,
1.726316, 0.8321545, 1.384616, 0, 0, 0, 1, 1,
1.726686, 1.327603, 2.256241, 0, 0, 0, 1, 1,
1.72941, -0.04179197, 2.048568, 1, 1, 1, 1, 1,
1.738298, 0.1618587, 2.253272, 1, 1, 1, 1, 1,
1.742892, -0.7014955, 0.6737633, 1, 1, 1, 1, 1,
1.768198, -0.5735601, 1.237703, 1, 1, 1, 1, 1,
1.769346, -1.084529, 2.022052, 1, 1, 1, 1, 1,
1.822403, 0.8068571, 1.039101, 1, 1, 1, 1, 1,
1.822513, -0.9669167, 1.908964, 1, 1, 1, 1, 1,
1.828321, 0.4165929, 2.266143, 1, 1, 1, 1, 1,
1.828942, 0.3066983, 1.903473, 1, 1, 1, 1, 1,
1.854717, -0.0821417, 1.8573, 1, 1, 1, 1, 1,
1.857253, -0.01726791, 1.189521, 1, 1, 1, 1, 1,
1.888796, -0.03342244, 0.6488067, 1, 1, 1, 1, 1,
1.889268, 0.8372148, -1.172616, 1, 1, 1, 1, 1,
1.904035, 0.7177502, 0.4903572, 1, 1, 1, 1, 1,
1.920805, -1.221905, 4.039839, 1, 1, 1, 1, 1,
1.948323, -0.6089093, 3.019637, 0, 0, 1, 1, 1,
1.979705, -0.2314126, -0.7205139, 1, 0, 0, 1, 1,
1.99109, -0.2828283, 1.412566, 1, 0, 0, 1, 1,
2.001775, -1.637655, 1.904819, 1, 0, 0, 1, 1,
2.033293, 0.4374397, 1.482627, 1, 0, 0, 1, 1,
2.040602, 0.3791717, 2.485412, 1, 0, 0, 1, 1,
2.05153, 0.5394312, 2.380519, 0, 0, 0, 1, 1,
2.051855, -0.0266479, 1.846503, 0, 0, 0, 1, 1,
2.145036, 0.4335218, 1.378798, 0, 0, 0, 1, 1,
2.147705, 0.09097861, 0.9752304, 0, 0, 0, 1, 1,
2.159276, -0.7868676, 0.3606871, 0, 0, 0, 1, 1,
2.200565, -1.031071, 4.195589, 0, 0, 0, 1, 1,
2.256493, 0.02942575, 0.02944288, 0, 0, 0, 1, 1,
2.261395, -0.3231202, 1.70728, 1, 1, 1, 1, 1,
2.290833, 0.9005126, 0.7744229, 1, 1, 1, 1, 1,
2.340754, 0.6455604, 0.46905, 1, 1, 1, 1, 1,
2.399842, -1.48385, 0.7818808, 1, 1, 1, 1, 1,
2.460093, 3.20426, 0.3944541, 1, 1, 1, 1, 1,
2.57071, -1.090705, 4.385811, 1, 1, 1, 1, 1,
2.797558, 0.01443123, 0.7371227, 1, 1, 1, 1, 1
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
var radius = 9.92406;
var distance = 34.85784;
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
mvMatrix.translate( 0.1135974, 0.375694, 0.1571894 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.85784);
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
