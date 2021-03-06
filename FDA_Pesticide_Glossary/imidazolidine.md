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
-3.370823, -0.6589821, -3.399823, 1, 0, 0, 1,
-2.787799, 1.316509, -2.107996, 1, 0.007843138, 0, 1,
-2.562913, 0.04610008, -1.357609, 1, 0.01176471, 0, 1,
-2.497523, 0.6002994, -0.9741234, 1, 0.01960784, 0, 1,
-2.41676, 1.297565, 0.0107001, 1, 0.02352941, 0, 1,
-2.38451, -1.443732, -2.662485, 1, 0.03137255, 0, 1,
-2.377841, -1.513441, -1.904497, 1, 0.03529412, 0, 1,
-2.37507, 1.315502, -0.7298206, 1, 0.04313726, 0, 1,
-2.357133, 0.7204636, -0.6568077, 1, 0.04705882, 0, 1,
-2.333104, 1.846385, 0.2324113, 1, 0.05490196, 0, 1,
-2.223425, -0.6942313, -2.577792, 1, 0.05882353, 0, 1,
-2.171741, -0.120747, -1.699079, 1, 0.06666667, 0, 1,
-2.135942, 0.5617983, -1.943872, 1, 0.07058824, 0, 1,
-2.107124, -3.12387, -2.984546, 1, 0.07843138, 0, 1,
-2.105475, 0.4706241, -0.6228055, 1, 0.08235294, 0, 1,
-2.081563, -0.5471184, -4.274161, 1, 0.09019608, 0, 1,
-2.075952, 0.2064287, -0.7432979, 1, 0.09411765, 0, 1,
-2.074462, 2.054072, 0.9599787, 1, 0.1019608, 0, 1,
-2.060918, 1.246846, -0.2641667, 1, 0.1098039, 0, 1,
-2.057155, 0.5579392, -1.723054, 1, 0.1137255, 0, 1,
-2.007043, -0.7418051, -2.519841, 1, 0.1215686, 0, 1,
-2.001074, 1.084257, 0.623553, 1, 0.1254902, 0, 1,
-1.986505, -0.4177931, -1.811538, 1, 0.1333333, 0, 1,
-1.970702, -0.6932417, -3.081595, 1, 0.1372549, 0, 1,
-1.959041, 0.7890403, -0.7423826, 1, 0.145098, 0, 1,
-1.934346, 0.2569239, -0.6741427, 1, 0.1490196, 0, 1,
-1.933239, -0.3284059, -3.945031, 1, 0.1568628, 0, 1,
-1.930955, 1.034505, -0.3991008, 1, 0.1607843, 0, 1,
-1.873717, -0.4178274, -1.701668, 1, 0.1686275, 0, 1,
-1.834519, 0.8174245, -1.901854, 1, 0.172549, 0, 1,
-1.825676, -0.3143181, -0.6751716, 1, 0.1803922, 0, 1,
-1.823553, -0.7346191, -2.276296, 1, 0.1843137, 0, 1,
-1.822542, 0.2373714, -1.802355, 1, 0.1921569, 0, 1,
-1.77583, 0.9829881, -2.622797, 1, 0.1960784, 0, 1,
-1.772842, 0.1663449, -1.807509, 1, 0.2039216, 0, 1,
-1.769446, 0.7065971, -1.681628, 1, 0.2117647, 0, 1,
-1.764346, 1.23124, -1.395439, 1, 0.2156863, 0, 1,
-1.730498, -1.12336, -0.3511535, 1, 0.2235294, 0, 1,
-1.701382, -0.942539, -2.446473, 1, 0.227451, 0, 1,
-1.682486, 0.1989691, -2.083936, 1, 0.2352941, 0, 1,
-1.666524, -0.5915586, -2.845988, 1, 0.2392157, 0, 1,
-1.657045, -0.06819434, -3.301131, 1, 0.2470588, 0, 1,
-1.64738, -0.3249364, -1.116262, 1, 0.2509804, 0, 1,
-1.642885, 0.9433756, -1.623851, 1, 0.2588235, 0, 1,
-1.64265, -0.05930931, -2.689636, 1, 0.2627451, 0, 1,
-1.63776, -0.09918129, -3.780746, 1, 0.2705882, 0, 1,
-1.634816, 0.08598678, -2.361769, 1, 0.2745098, 0, 1,
-1.622148, -0.2750576, -1.993898, 1, 0.282353, 0, 1,
-1.621089, 0.1186998, -3.282975, 1, 0.2862745, 0, 1,
-1.620347, -2.014741, -1.888037, 1, 0.2941177, 0, 1,
-1.619816, -1.101747, -2.630979, 1, 0.3019608, 0, 1,
-1.619407, -1.099959, -3.804938, 1, 0.3058824, 0, 1,
-1.591606, 0.4381542, -2.682943, 1, 0.3137255, 0, 1,
-1.577811, 0.4353872, -2.868456, 1, 0.3176471, 0, 1,
-1.564661, 0.3695949, -1.78494, 1, 0.3254902, 0, 1,
-1.558956, -1.709643, -4.177717, 1, 0.3294118, 0, 1,
-1.546558, -0.3585282, -2.7564, 1, 0.3372549, 0, 1,
-1.541746, -1.816449, -4.399418, 1, 0.3411765, 0, 1,
-1.538671, -1.462968, -3.749158, 1, 0.3490196, 0, 1,
-1.513804, -0.1428955, -1.894562, 1, 0.3529412, 0, 1,
-1.513427, 1.193237, 1.648743, 1, 0.3607843, 0, 1,
-1.510352, 2.114467, 0.9600307, 1, 0.3647059, 0, 1,
-1.509714, -0.20975, 0.2203051, 1, 0.372549, 0, 1,
-1.508116, -0.4542123, -0.6838077, 1, 0.3764706, 0, 1,
-1.507275, 0.4379683, -0.2074844, 1, 0.3843137, 0, 1,
-1.505284, -0.07307033, -0.8257309, 1, 0.3882353, 0, 1,
-1.498582, -0.4507693, -1.310663, 1, 0.3960784, 0, 1,
-1.496975, 1.482234, 1.603976, 1, 0.4039216, 0, 1,
-1.491642, 0.3856185, -0.6576439, 1, 0.4078431, 0, 1,
-1.488383, -0.7722444, -3.619611, 1, 0.4156863, 0, 1,
-1.476233, 0.5462708, -2.697036, 1, 0.4196078, 0, 1,
-1.474134, -1.00995, -1.662795, 1, 0.427451, 0, 1,
-1.460118, -0.534557, -2.829813, 1, 0.4313726, 0, 1,
-1.457208, -0.661155, -1.960618, 1, 0.4392157, 0, 1,
-1.452468, 0.5015765, -0.7867151, 1, 0.4431373, 0, 1,
-1.440992, 1.639389, -1.000355, 1, 0.4509804, 0, 1,
-1.431038, 0.5799652, -0.5000202, 1, 0.454902, 0, 1,
-1.429256, -0.8493143, -1.803143, 1, 0.4627451, 0, 1,
-1.425448, -0.9002885, -2.435038, 1, 0.4666667, 0, 1,
-1.425381, -0.497886, -0.7980751, 1, 0.4745098, 0, 1,
-1.424018, -0.955513, 0.9147376, 1, 0.4784314, 0, 1,
-1.422954, 1.067554, -0.4602279, 1, 0.4862745, 0, 1,
-1.421173, 0.9681161, -1.185349, 1, 0.4901961, 0, 1,
-1.417904, 0.08275989, -2.518812, 1, 0.4980392, 0, 1,
-1.404486, -1.033679, -1.240396, 1, 0.5058824, 0, 1,
-1.403385, -0.1928153, -1.479841, 1, 0.509804, 0, 1,
-1.400723, 0.4561275, -1.008629, 1, 0.5176471, 0, 1,
-1.391781, 1.434187, 0.0235761, 1, 0.5215687, 0, 1,
-1.381383, 0.08534298, -0.3562033, 1, 0.5294118, 0, 1,
-1.373043, 0.3250195, -1.300078, 1, 0.5333334, 0, 1,
-1.356434, -0.9647859, -2.836994, 1, 0.5411765, 0, 1,
-1.353149, 0.1236754, -2.896441, 1, 0.5450981, 0, 1,
-1.351737, 1.632323, -0.902548, 1, 0.5529412, 0, 1,
-1.339815, 0.1502297, -1.899831, 1, 0.5568628, 0, 1,
-1.339718, -1.003488, -2.9342, 1, 0.5647059, 0, 1,
-1.334953, -1.87906, -2.768882, 1, 0.5686275, 0, 1,
-1.327818, -0.6414332, -1.067594, 1, 0.5764706, 0, 1,
-1.323848, 0.5232647, -1.896757, 1, 0.5803922, 0, 1,
-1.321069, -1.467982, -0.8411622, 1, 0.5882353, 0, 1,
-1.312377, -1.81664, -3.134145, 1, 0.5921569, 0, 1,
-1.311521, 0.7499366, -2.669955, 1, 0.6, 0, 1,
-1.309353, -1.29919, -2.154613, 1, 0.6078432, 0, 1,
-1.301679, 0.1111439, -0.3672962, 1, 0.6117647, 0, 1,
-1.296416, 0.3732881, -0.3368289, 1, 0.6196079, 0, 1,
-1.28888, 1.430713, 0.1442663, 1, 0.6235294, 0, 1,
-1.27757, -0.1375227, -2.458048, 1, 0.6313726, 0, 1,
-1.276078, 1.67716, -0.769568, 1, 0.6352941, 0, 1,
-1.269501, -1.221037, -4.245329, 1, 0.6431373, 0, 1,
-1.250445, 0.3919307, 0.5962394, 1, 0.6470588, 0, 1,
-1.238207, 0.05003009, -2.262398, 1, 0.654902, 0, 1,
-1.236452, 1.023575, 0.429812, 1, 0.6588235, 0, 1,
-1.235013, -0.2204891, -1.19355, 1, 0.6666667, 0, 1,
-1.22983, 1.269005, 0.5163932, 1, 0.6705883, 0, 1,
-1.228637, -2.150444, -2.758431, 1, 0.6784314, 0, 1,
-1.220517, -0.8647099, -1.87969, 1, 0.682353, 0, 1,
-1.216452, -0.8593761, -1.527495, 1, 0.6901961, 0, 1,
-1.215151, -1.650783, -3.086715, 1, 0.6941177, 0, 1,
-1.20357, 0.9678665, 0.2572565, 1, 0.7019608, 0, 1,
-1.203207, 0.7316223, -1.663647, 1, 0.7098039, 0, 1,
-1.200438, -0.8247511, -3.268864, 1, 0.7137255, 0, 1,
-1.189794, -0.5035471, -2.886987, 1, 0.7215686, 0, 1,
-1.185169, -1.903425, -2.533328, 1, 0.7254902, 0, 1,
-1.184379, 0.7948593, 1.061435, 1, 0.7333333, 0, 1,
-1.18232, -1.834483, -4.097112, 1, 0.7372549, 0, 1,
-1.173896, -0.4152617, -1.218988, 1, 0.7450981, 0, 1,
-1.172169, 0.2513595, -1.029526, 1, 0.7490196, 0, 1,
-1.169184, 0.3863807, -0.5690448, 1, 0.7568628, 0, 1,
-1.168987, -0.6726933, -1.055886, 1, 0.7607843, 0, 1,
-1.163387, -0.3496028, 0.3299503, 1, 0.7686275, 0, 1,
-1.160833, -0.4272648, -1.526979, 1, 0.772549, 0, 1,
-1.157534, 2.20366, -0.6383109, 1, 0.7803922, 0, 1,
-1.157422, 1.065936, -1.143974, 1, 0.7843137, 0, 1,
-1.154119, 1.34626, -0.1537309, 1, 0.7921569, 0, 1,
-1.152971, 0.4276159, -2.554741, 1, 0.7960784, 0, 1,
-1.147599, -0.7181848, -1.808498, 1, 0.8039216, 0, 1,
-1.144487, -1.092689, -2.682086, 1, 0.8117647, 0, 1,
-1.137717, 0.3454849, -0.09908707, 1, 0.8156863, 0, 1,
-1.135123, 0.9046235, 0.4560881, 1, 0.8235294, 0, 1,
-1.134762, 2.434037, 0.8615332, 1, 0.827451, 0, 1,
-1.131867, 0.2186041, -1.097617, 1, 0.8352941, 0, 1,
-1.127143, -0.4816995, -1.462421, 1, 0.8392157, 0, 1,
-1.126554, 0.1270338, -0.9984435, 1, 0.8470588, 0, 1,
-1.114345, -0.2547822, -1.402364, 1, 0.8509804, 0, 1,
-1.09608, -0.7585399, -1.21162, 1, 0.8588235, 0, 1,
-1.093035, 0.6076995, -1.78245, 1, 0.8627451, 0, 1,
-1.085593, -0.01150136, -0.5102549, 1, 0.8705882, 0, 1,
-1.070705, 1.291192, 0.2901114, 1, 0.8745098, 0, 1,
-1.070102, 0.2952117, -0.6853378, 1, 0.8823529, 0, 1,
-1.067951, 2.355074, -0.1861119, 1, 0.8862745, 0, 1,
-1.064702, -0.5640787, -3.092963, 1, 0.8941177, 0, 1,
-1.062138, 1.641353, 0.004733936, 1, 0.8980392, 0, 1,
-1.057523, 0.4386678, -0.7931232, 1, 0.9058824, 0, 1,
-1.050629, -0.3901405, -1.735019, 1, 0.9137255, 0, 1,
-1.044266, -0.8762062, -2.189705, 1, 0.9176471, 0, 1,
-1.040897, -0.6384916, -2.871379, 1, 0.9254902, 0, 1,
-1.037269, 0.6658874, -0.7687802, 1, 0.9294118, 0, 1,
-1.033246, -0.1469141, -3.174841, 1, 0.9372549, 0, 1,
-1.032229, 0.5962376, -0.08042634, 1, 0.9411765, 0, 1,
-1.031328, -1.05343, -3.385367, 1, 0.9490196, 0, 1,
-1.024498, 1.358723, 0.8168254, 1, 0.9529412, 0, 1,
-1.024009, -0.6878558, -1.083009, 1, 0.9607843, 0, 1,
-1.016786, -0.1329717, -2.355212, 1, 0.9647059, 0, 1,
-1.008215, 0.1589766, -3.356252, 1, 0.972549, 0, 1,
-1.002374, -0.3639112, -1.997004, 1, 0.9764706, 0, 1,
-0.9960917, 0.8413434, -0.7493922, 1, 0.9843137, 0, 1,
-0.9955962, -0.3803624, -1.404522, 1, 0.9882353, 0, 1,
-0.9938197, -1.102637, -2.785768, 1, 0.9960784, 0, 1,
-0.9783897, 1.311226, -1.3662, 0.9960784, 1, 0, 1,
-0.9772161, 0.6569434, -0.6910256, 0.9921569, 1, 0, 1,
-0.9729791, -0.3137688, -2.574688, 0.9843137, 1, 0, 1,
-0.9609327, -0.9444233, -2.961941, 0.9803922, 1, 0, 1,
-0.9550785, 1.308946, -1.228774, 0.972549, 1, 0, 1,
-0.9544798, -1.176437, -3.434501, 0.9686275, 1, 0, 1,
-0.9478685, 0.0696166, -1.091841, 0.9607843, 1, 0, 1,
-0.9464007, -1.22073, -0.9539568, 0.9568627, 1, 0, 1,
-0.9452645, 0.5773472, -0.2942609, 0.9490196, 1, 0, 1,
-0.9449087, 0.4537635, -2.015714, 0.945098, 1, 0, 1,
-0.9434645, 1.012624, -0.8369797, 0.9372549, 1, 0, 1,
-0.9424905, 0.5104796, -1.121618, 0.9333333, 1, 0, 1,
-0.9395198, 0.05196055, -1.928763, 0.9254902, 1, 0, 1,
-0.9385718, 0.2073727, -1.032365, 0.9215686, 1, 0, 1,
-0.935249, 1.883576, -1.97019, 0.9137255, 1, 0, 1,
-0.9305022, -0.7175708, -2.68686, 0.9098039, 1, 0, 1,
-0.9245956, 1.015935, -0.3908191, 0.9019608, 1, 0, 1,
-0.9237427, 0.5505159, -1.304515, 0.8941177, 1, 0, 1,
-0.9226545, -0.1054739, -0.9020091, 0.8901961, 1, 0, 1,
-0.920403, -1.887369, -3.267213, 0.8823529, 1, 0, 1,
-0.9190655, -0.8600537, -1.529417, 0.8784314, 1, 0, 1,
-0.9151617, -0.06230016, -2.967191, 0.8705882, 1, 0, 1,
-0.9131961, 0.6393403, -1.212033, 0.8666667, 1, 0, 1,
-0.9122024, 1.123215, -1.783823, 0.8588235, 1, 0, 1,
-0.9119017, -0.6654699, -1.489874, 0.854902, 1, 0, 1,
-0.9106827, -0.2709364, -1.860318, 0.8470588, 1, 0, 1,
-0.9065121, -2.152843, -3.305951, 0.8431373, 1, 0, 1,
-0.9064205, -0.6108292, 0.1722652, 0.8352941, 1, 0, 1,
-0.9050451, -0.03283799, -0.3982129, 0.8313726, 1, 0, 1,
-0.899431, 0.359914, -1.606841, 0.8235294, 1, 0, 1,
-0.8934188, 0.948073, 1.360345, 0.8196079, 1, 0, 1,
-0.8832031, 1.314476, -1.503517, 0.8117647, 1, 0, 1,
-0.8817485, 0.7602358, -1.07216, 0.8078431, 1, 0, 1,
-0.8797734, 0.4592835, -1.233812, 0.8, 1, 0, 1,
-0.879392, -0.8071299, -0.4917237, 0.7921569, 1, 0, 1,
-0.8769619, -1.479723, -2.042617, 0.7882353, 1, 0, 1,
-0.8757054, 1.095345, -1.306149, 0.7803922, 1, 0, 1,
-0.8740772, 3.030156, -0.2069468, 0.7764706, 1, 0, 1,
-0.8641452, 0.0759787, -0.3341792, 0.7686275, 1, 0, 1,
-0.8568123, -0.2353659, -2.469219, 0.7647059, 1, 0, 1,
-0.8539305, -1.073135, -1.800825, 0.7568628, 1, 0, 1,
-0.8488059, 1.063304, -1.480362, 0.7529412, 1, 0, 1,
-0.8464336, -0.5709904, -2.960589, 0.7450981, 1, 0, 1,
-0.8379984, -1.587024, -2.809603, 0.7411765, 1, 0, 1,
-0.8375815, -0.5568424, -1.433907, 0.7333333, 1, 0, 1,
-0.8332961, 1.117953, -0.578249, 0.7294118, 1, 0, 1,
-0.8328704, 0.7749953, -1.118581, 0.7215686, 1, 0, 1,
-0.8307027, -3.434853, -5.221025, 0.7176471, 1, 0, 1,
-0.8176926, -0.5145684, -0.7363901, 0.7098039, 1, 0, 1,
-0.8125263, -1.246034, -2.306465, 0.7058824, 1, 0, 1,
-0.8113241, -1.028559, -1.798972, 0.6980392, 1, 0, 1,
-0.8084518, -0.1975983, -2.185469, 0.6901961, 1, 0, 1,
-0.8072206, -0.5605901, -0.3458507, 0.6862745, 1, 0, 1,
-0.805079, -1.436301, -0.807624, 0.6784314, 1, 0, 1,
-0.7957486, -0.06373654, -2.611116, 0.6745098, 1, 0, 1,
-0.7884498, -0.907443, -1.677674, 0.6666667, 1, 0, 1,
-0.7850257, 0.2212144, -1.949505, 0.6627451, 1, 0, 1,
-0.7773913, -0.5939971, -2.782325, 0.654902, 1, 0, 1,
-0.7767735, -1.262962, -4.024035, 0.6509804, 1, 0, 1,
-0.76801, -1.378558, -1.599239, 0.6431373, 1, 0, 1,
-0.758462, -0.7224728, -3.871518, 0.6392157, 1, 0, 1,
-0.7568212, -0.5414999, -2.224812, 0.6313726, 1, 0, 1,
-0.7466902, 0.702873, -2.27276, 0.627451, 1, 0, 1,
-0.7428278, -0.9812748, -2.813222, 0.6196079, 1, 0, 1,
-0.7424719, -0.5225363, -0.6517133, 0.6156863, 1, 0, 1,
-0.7402957, -0.06851389, -4.077576, 0.6078432, 1, 0, 1,
-0.7328673, -0.872679, -4.719813, 0.6039216, 1, 0, 1,
-0.7258145, -0.8142121, -1.349232, 0.5960785, 1, 0, 1,
-0.7243911, -0.2435261, -1.462329, 0.5882353, 1, 0, 1,
-0.7210818, -0.4202442, -2.912776, 0.5843138, 1, 0, 1,
-0.7177109, -0.9830806, -1.232334, 0.5764706, 1, 0, 1,
-0.7171266, 0.5046451, 0.2894934, 0.572549, 1, 0, 1,
-0.7167339, 0.9511642, -0.4644624, 0.5647059, 1, 0, 1,
-0.7076312, -0.4737666, -2.990677, 0.5607843, 1, 0, 1,
-0.7069528, 0.02577534, -1.283709, 0.5529412, 1, 0, 1,
-0.6995199, -2.023732, -3.168726, 0.5490196, 1, 0, 1,
-0.699083, -0.749038, -3.612716, 0.5411765, 1, 0, 1,
-0.6986518, 0.5847403, -1.087244, 0.5372549, 1, 0, 1,
-0.6977388, -0.01929062, -1.851843, 0.5294118, 1, 0, 1,
-0.6958203, -0.6794043, -0.8547214, 0.5254902, 1, 0, 1,
-0.6906033, 0.5069197, 0.5106763, 0.5176471, 1, 0, 1,
-0.6890097, 0.2379546, 0.2573553, 0.5137255, 1, 0, 1,
-0.6861616, -1.217473, -1.026429, 0.5058824, 1, 0, 1,
-0.685761, 0.04026858, -2.371482, 0.5019608, 1, 0, 1,
-0.6857423, -0.7407655, -1.321274, 0.4941176, 1, 0, 1,
-0.6837534, 1.173827, 0.08938223, 0.4862745, 1, 0, 1,
-0.6784862, 0.8502753, -1.380448, 0.4823529, 1, 0, 1,
-0.673265, -1.459747, -3.44775, 0.4745098, 1, 0, 1,
-0.6731024, 0.07705632, -2.021924, 0.4705882, 1, 0, 1,
-0.6641963, -0.7697896, -1.273809, 0.4627451, 1, 0, 1,
-0.664021, 0.1020342, -0.5834357, 0.4588235, 1, 0, 1,
-0.6589219, 1.271938, 0.04663167, 0.4509804, 1, 0, 1,
-0.654134, 0.382643, -1.336304, 0.4470588, 1, 0, 1,
-0.653761, -0.5781125, -1.400522, 0.4392157, 1, 0, 1,
-0.6526974, -0.8822116, -0.7227452, 0.4352941, 1, 0, 1,
-0.6387908, 2.022765, 0.6406416, 0.427451, 1, 0, 1,
-0.6325474, -0.7598794, -1.768525, 0.4235294, 1, 0, 1,
-0.6283724, 0.4214894, -0.4464108, 0.4156863, 1, 0, 1,
-0.6263441, -1.390658, -4.245443, 0.4117647, 1, 0, 1,
-0.6216739, 0.7301839, -1.118354, 0.4039216, 1, 0, 1,
-0.6140521, 0.5274912, -0.5771743, 0.3960784, 1, 0, 1,
-0.6076695, -0.4212765, -3.370606, 0.3921569, 1, 0, 1,
-0.6060632, -1.16987, -3.643259, 0.3843137, 1, 0, 1,
-0.6019769, 1.744676, -1.146548, 0.3803922, 1, 0, 1,
-0.6010507, 2.629353, 1.04779, 0.372549, 1, 0, 1,
-0.59801, -0.1541621, -0.9850715, 0.3686275, 1, 0, 1,
-0.5950518, -1.059423, -2.404341, 0.3607843, 1, 0, 1,
-0.5877689, -1.102947, -4.722437, 0.3568628, 1, 0, 1,
-0.585437, -0.5240427, -2.925853, 0.3490196, 1, 0, 1,
-0.5806204, 0.333405, 0.2793948, 0.345098, 1, 0, 1,
-0.5777392, -2.329553, -3.350837, 0.3372549, 1, 0, 1,
-0.5769488, -0.9459397, -2.899516, 0.3333333, 1, 0, 1,
-0.5765879, 0.7002957, 0.7325547, 0.3254902, 1, 0, 1,
-0.5753378, -1.399624, -3.422969, 0.3215686, 1, 0, 1,
-0.5729986, 1.227239, 1.254836, 0.3137255, 1, 0, 1,
-0.569156, -0.6982805, -1.002002, 0.3098039, 1, 0, 1,
-0.5601289, 0.2976422, -1.453604, 0.3019608, 1, 0, 1,
-0.5557314, 1.274097, -1.986782, 0.2941177, 1, 0, 1,
-0.5456157, 0.1101986, -0.2629663, 0.2901961, 1, 0, 1,
-0.5453137, 1.029441, -0.6463339, 0.282353, 1, 0, 1,
-0.5403451, -0.1053, -1.829705, 0.2784314, 1, 0, 1,
-0.5362486, 0.08328421, -0.7440743, 0.2705882, 1, 0, 1,
-0.5357495, -0.5536447, -3.107083, 0.2666667, 1, 0, 1,
-0.5305693, -0.8479113, -2.249143, 0.2588235, 1, 0, 1,
-0.5282062, 0.6211847, -1.380145, 0.254902, 1, 0, 1,
-0.5272034, -0.2425664, -1.777332, 0.2470588, 1, 0, 1,
-0.5268112, -1.00564, -2.923979, 0.2431373, 1, 0, 1,
-0.5201236, -3.000632, -2.25237, 0.2352941, 1, 0, 1,
-0.5170186, 0.9893728, -0.8695353, 0.2313726, 1, 0, 1,
-0.5158315, -2.566256, -1.697582, 0.2235294, 1, 0, 1,
-0.5157155, 0.4677733, -1.781184, 0.2196078, 1, 0, 1,
-0.5075614, -1.124872, -3.546105, 0.2117647, 1, 0, 1,
-0.5067928, -0.2902671, -0.2352865, 0.2078431, 1, 0, 1,
-0.5064276, 0.8480489, 0.1698671, 0.2, 1, 0, 1,
-0.5026594, -0.4874939, -3.1389, 0.1921569, 1, 0, 1,
-0.4996473, -1.056035, -2.042673, 0.1882353, 1, 0, 1,
-0.4988049, -0.96913, -2.441597, 0.1803922, 1, 0, 1,
-0.4936383, -0.03424661, -0.8835001, 0.1764706, 1, 0, 1,
-0.4872125, 1.233494, -1.121122, 0.1686275, 1, 0, 1,
-0.4845302, -1.017554, -1.723863, 0.1647059, 1, 0, 1,
-0.4814877, 0.07721895, -0.3467109, 0.1568628, 1, 0, 1,
-0.4807287, -0.02364911, -1.438416, 0.1529412, 1, 0, 1,
-0.4790137, -0.5264784, -1.841775, 0.145098, 1, 0, 1,
-0.4764107, 0.6763182, 0.7942251, 0.1411765, 1, 0, 1,
-0.4670431, -0.1259145, -2.679454, 0.1333333, 1, 0, 1,
-0.4645099, -0.7859049, -3.177636, 0.1294118, 1, 0, 1,
-0.4626197, -0.2681581, -2.166013, 0.1215686, 1, 0, 1,
-0.4513705, 1.471315, -1.39884, 0.1176471, 1, 0, 1,
-0.4498532, -0.5942835, -2.392253, 0.1098039, 1, 0, 1,
-0.4490108, 0.4563091, 1.203187, 0.1058824, 1, 0, 1,
-0.4489222, -2.685318, -1.737829, 0.09803922, 1, 0, 1,
-0.4438776, 1.247213, -1.305821, 0.09019608, 1, 0, 1,
-0.4411502, 1.068801, 0.1723006, 0.08627451, 1, 0, 1,
-0.4329956, -0.7446348, -1.413493, 0.07843138, 1, 0, 1,
-0.4318933, -1.307635, -2.996649, 0.07450981, 1, 0, 1,
-0.4242783, 0.5169041, 0.009659151, 0.06666667, 1, 0, 1,
-0.4219781, -0.81488, -0.250493, 0.0627451, 1, 0, 1,
-0.4214027, -0.8004311, -2.929075, 0.05490196, 1, 0, 1,
-0.420072, 0.2907186, -1.732946, 0.05098039, 1, 0, 1,
-0.4181039, -0.3706844, -3.92917, 0.04313726, 1, 0, 1,
-0.4168641, 1.737976, -0.9594222, 0.03921569, 1, 0, 1,
-0.4164124, -0.4214449, -4.777758, 0.03137255, 1, 0, 1,
-0.4161286, -0.8569391, -1.97119, 0.02745098, 1, 0, 1,
-0.4160814, -0.5770084, -0.8008386, 0.01960784, 1, 0, 1,
-0.410183, 0.7062653, -1.800085, 0.01568628, 1, 0, 1,
-0.4096314, -1.383169, -1.872758, 0.007843138, 1, 0, 1,
-0.4027365, -1.085816, -2.866936, 0.003921569, 1, 0, 1,
-0.4022646, -0.1364969, -1.062284, 0, 1, 0.003921569, 1,
-0.4008214, -0.8928162, -2.788897, 0, 1, 0.01176471, 1,
-0.400384, -2.000805, -4.35394, 0, 1, 0.01568628, 1,
-0.3991912, 0.1923764, 0.6510078, 0, 1, 0.02352941, 1,
-0.3963999, 0.6360321, -1.501672, 0, 1, 0.02745098, 1,
-0.3951367, 0.715457, -0.05391371, 0, 1, 0.03529412, 1,
-0.3943432, 0.5103527, 0.1001774, 0, 1, 0.03921569, 1,
-0.3932447, -1.389177, -2.217569, 0, 1, 0.04705882, 1,
-0.3833218, -1.418964, -3.677575, 0, 1, 0.05098039, 1,
-0.3825095, 0.1026909, -1.961202, 0, 1, 0.05882353, 1,
-0.377102, -1.59188, -2.394366, 0, 1, 0.0627451, 1,
-0.3765592, -1.377033, -3.188527, 0, 1, 0.07058824, 1,
-0.3711358, 1.47088, -2.865277, 0, 1, 0.07450981, 1,
-0.3706066, -1.470167, -2.059475, 0, 1, 0.08235294, 1,
-0.3695551, 1.220716, 1.516932, 0, 1, 0.08627451, 1,
-0.3686129, -1.087645, -2.11233, 0, 1, 0.09411765, 1,
-0.3684892, 0.4938029, -1.527115, 0, 1, 0.1019608, 1,
-0.3667584, -1.044877, -5.229996, 0, 1, 0.1058824, 1,
-0.3656095, -0.2076548, -2.778415, 0, 1, 0.1137255, 1,
-0.3654102, -0.9771305, -2.205987, 0, 1, 0.1176471, 1,
-0.3639976, -0.224652, -1.410158, 0, 1, 0.1254902, 1,
-0.3608204, -0.2306471, -2.148005, 0, 1, 0.1294118, 1,
-0.3594151, 0.4812099, -1.064146, 0, 1, 0.1372549, 1,
-0.3567272, 0.01807404, -0.9187969, 0, 1, 0.1411765, 1,
-0.3494277, 1.480282, 0.08131557, 0, 1, 0.1490196, 1,
-0.3483158, 2.334752, -1.830799, 0, 1, 0.1529412, 1,
-0.3482422, -1.156117, -3.871544, 0, 1, 0.1607843, 1,
-0.3448518, -1.742903, -1.008019, 0, 1, 0.1647059, 1,
-0.3429738, 0.07261617, -0.6024674, 0, 1, 0.172549, 1,
-0.331113, -0.6084265, -2.61528, 0, 1, 0.1764706, 1,
-0.3282539, -0.4181722, -3.176373, 0, 1, 0.1843137, 1,
-0.3278366, -1.214866, -3.24095, 0, 1, 0.1882353, 1,
-0.3228399, -1.222797, -1.752006, 0, 1, 0.1960784, 1,
-0.3214209, -0.1780716, -1.514256, 0, 1, 0.2039216, 1,
-0.3211556, 0.2992178, -0.2175072, 0, 1, 0.2078431, 1,
-0.3211065, 1.059662, -0.3571015, 0, 1, 0.2156863, 1,
-0.3191772, -0.3245384, -2.37309, 0, 1, 0.2196078, 1,
-0.3163378, 1.017233, 0.04630012, 0, 1, 0.227451, 1,
-0.3100493, -0.4017538, -0.779812, 0, 1, 0.2313726, 1,
-0.305753, -0.2149557, -1.575029, 0, 1, 0.2392157, 1,
-0.3013883, -1.329146, -2.839188, 0, 1, 0.2431373, 1,
-0.2992542, -0.06325155, -0.2810849, 0, 1, 0.2509804, 1,
-0.2979815, -1.875555, -3.02509, 0, 1, 0.254902, 1,
-0.294503, -0.6915845, -3.265564, 0, 1, 0.2627451, 1,
-0.292238, 0.1474039, -1.170808, 0, 1, 0.2666667, 1,
-0.2890888, -0.4289671, -4.509101, 0, 1, 0.2745098, 1,
-0.2869435, -0.5738668, -3.328631, 0, 1, 0.2784314, 1,
-0.2811795, 0.4140568, -2.589587, 0, 1, 0.2862745, 1,
-0.2782854, -0.2798153, -2.402677, 0, 1, 0.2901961, 1,
-0.2771768, 1.246135, -1.173313, 0, 1, 0.2980392, 1,
-0.2651705, 0.1770582, 0.5241043, 0, 1, 0.3058824, 1,
-0.2619439, -1.047882, -2.307214, 0, 1, 0.3098039, 1,
-0.2541887, -1.641478, -3.39211, 0, 1, 0.3176471, 1,
-0.2463181, 0.2975056, -2.416629, 0, 1, 0.3215686, 1,
-0.244764, -0.2785875, -2.917017, 0, 1, 0.3294118, 1,
-0.2439571, -0.1625008, -2.372471, 0, 1, 0.3333333, 1,
-0.2418917, 0.8966348, -1.82896, 0, 1, 0.3411765, 1,
-0.241825, -0.4955362, -2.622531, 0, 1, 0.345098, 1,
-0.2405299, 1.250673, 1.293074, 0, 1, 0.3529412, 1,
-0.2393153, 0.5805047, 0.006608807, 0, 1, 0.3568628, 1,
-0.2386885, 0.4148923, -2.394686, 0, 1, 0.3647059, 1,
-0.2374123, 0.03440309, -0.567229, 0, 1, 0.3686275, 1,
-0.2356771, 0.1200663, -2.08191, 0, 1, 0.3764706, 1,
-0.2345274, -0.3350324, -3.64819, 0, 1, 0.3803922, 1,
-0.2335583, -0.347061, -2.466969, 0, 1, 0.3882353, 1,
-0.2318176, -1.274271, -1.195994, 0, 1, 0.3921569, 1,
-0.2310192, -2.241476, -3.046169, 0, 1, 0.4, 1,
-0.2291859, 0.5281615, 0.08816387, 0, 1, 0.4078431, 1,
-0.2250618, -1.440423, -1.324087, 0, 1, 0.4117647, 1,
-0.2202083, 0.3134738, 0.02734757, 0, 1, 0.4196078, 1,
-0.2198808, -0.04467397, -3.150069, 0, 1, 0.4235294, 1,
-0.2194482, -1.493396, -3.802972, 0, 1, 0.4313726, 1,
-0.2191022, 0.7440922, 0.9437485, 0, 1, 0.4352941, 1,
-0.2172754, -1.084732, -2.40654, 0, 1, 0.4431373, 1,
-0.2149329, -0.8605914, -3.359941, 0, 1, 0.4470588, 1,
-0.2125741, -0.4718366, -3.005059, 0, 1, 0.454902, 1,
-0.2092891, -0.417035, -2.514868, 0, 1, 0.4588235, 1,
-0.207943, 0.5291683, 0.09916672, 0, 1, 0.4666667, 1,
-0.2055212, 0.4193068, -0.09081934, 0, 1, 0.4705882, 1,
-0.20463, 0.5490175, 0.09939485, 0, 1, 0.4784314, 1,
-0.1933754, -0.6928024, -1.940731, 0, 1, 0.4823529, 1,
-0.191078, -0.1576674, -2.581206, 0, 1, 0.4901961, 1,
-0.1881791, 2.338961, 0.01933475, 0, 1, 0.4941176, 1,
-0.186739, -1.429255, -4.928537, 0, 1, 0.5019608, 1,
-0.1863688, 0.5168527, 0.1550506, 0, 1, 0.509804, 1,
-0.1855131, -0.7042041, -4.703239, 0, 1, 0.5137255, 1,
-0.1823225, -1.644077, -2.937686, 0, 1, 0.5215687, 1,
-0.1809597, -1.018881, -2.598041, 0, 1, 0.5254902, 1,
-0.1796263, -0.1439921, -0.8140785, 0, 1, 0.5333334, 1,
-0.1781513, -0.1896707, -1.753256, 0, 1, 0.5372549, 1,
-0.1780067, -1.21524, -3.053365, 0, 1, 0.5450981, 1,
-0.1765409, 0.01005311, -0.571385, 0, 1, 0.5490196, 1,
-0.1724511, 0.7508375, -1.798918, 0, 1, 0.5568628, 1,
-0.1714943, 1.428512, -0.6871199, 0, 1, 0.5607843, 1,
-0.169851, -0.2319754, -3.449852, 0, 1, 0.5686275, 1,
-0.1664904, 0.4362535, -0.01539391, 0, 1, 0.572549, 1,
-0.1645894, 0.03197733, -1.452391, 0, 1, 0.5803922, 1,
-0.1623771, 1.795852, -0.7037154, 0, 1, 0.5843138, 1,
-0.1591404, -0.2279063, -2.503067, 0, 1, 0.5921569, 1,
-0.1571791, -0.09480216, -1.190226, 0, 1, 0.5960785, 1,
-0.1567936, -0.1207922, -2.630154, 0, 1, 0.6039216, 1,
-0.1536864, 0.7630768, 0.1149182, 0, 1, 0.6117647, 1,
-0.1512656, -0.1402868, -4.726202, 0, 1, 0.6156863, 1,
-0.1445051, 0.0982591, -0.9653265, 0, 1, 0.6235294, 1,
-0.1410442, -0.5674249, -1.871095, 0, 1, 0.627451, 1,
-0.1396902, -0.9473583, -2.432725, 0, 1, 0.6352941, 1,
-0.1379204, -0.2628983, -2.226711, 0, 1, 0.6392157, 1,
-0.1367172, -0.7053761, -2.985782, 0, 1, 0.6470588, 1,
-0.1359557, 0.9014961, -0.03194567, 0, 1, 0.6509804, 1,
-0.1345076, 0.401997, -0.4572147, 0, 1, 0.6588235, 1,
-0.1344283, -1.851313, -4.689083, 0, 1, 0.6627451, 1,
-0.1315771, -2.566925, -2.829929, 0, 1, 0.6705883, 1,
-0.1308829, 0.3155476, -1.965709, 0, 1, 0.6745098, 1,
-0.1270858, 1.117282, 0.9528884, 0, 1, 0.682353, 1,
-0.1254234, 1.698008, -0.1379246, 0, 1, 0.6862745, 1,
-0.1245844, 0.4212478, -0.7037005, 0, 1, 0.6941177, 1,
-0.1191273, -1.425798, -3.097711, 0, 1, 0.7019608, 1,
-0.1170696, 0.1423761, -1.575487, 0, 1, 0.7058824, 1,
-0.1170521, -0.7380889, -2.66639, 0, 1, 0.7137255, 1,
-0.1161655, -2.740682, -5.171566, 0, 1, 0.7176471, 1,
-0.1143953, -0.6001469, -2.790939, 0, 1, 0.7254902, 1,
-0.1081006, 0.6613332, -1.469517, 0, 1, 0.7294118, 1,
-0.1049389, 0.07504432, -1.66963, 0, 1, 0.7372549, 1,
-0.1030402, 2.608163, -1.788856, 0, 1, 0.7411765, 1,
-0.1013336, -0.9292511, -2.480682, 0, 1, 0.7490196, 1,
-0.09571736, 0.486003, -0.466969, 0, 1, 0.7529412, 1,
-0.0928551, 0.3965815, -1.364617, 0, 1, 0.7607843, 1,
-0.09206932, 0.9421518, 1.69889, 0, 1, 0.7647059, 1,
-0.0907302, 0.5534419, 0.3990096, 0, 1, 0.772549, 1,
-0.08456398, -0.0157926, -1.303742, 0, 1, 0.7764706, 1,
-0.0831314, 0.1297635, 1.32431, 0, 1, 0.7843137, 1,
-0.08005296, 0.5853985, 0.9622753, 0, 1, 0.7882353, 1,
-0.07934069, 1.009302, 1.442657, 0, 1, 0.7960784, 1,
-0.0777586, -0.4649797, -3.718954, 0, 1, 0.8039216, 1,
-0.07703861, -0.3758162, -2.935798, 0, 1, 0.8078431, 1,
-0.07673448, 1.213859, 0.2884353, 0, 1, 0.8156863, 1,
-0.06738324, 1.582123, -1.077269, 0, 1, 0.8196079, 1,
-0.06658004, -1.299557, -1.699643, 0, 1, 0.827451, 1,
-0.06533413, 0.1120744, 0.1764916, 0, 1, 0.8313726, 1,
-0.06469788, 0.07254852, -0.6713678, 0, 1, 0.8392157, 1,
-0.06153197, 1.100338, 0.4810932, 0, 1, 0.8431373, 1,
-0.05996866, 0.3816789, -0.6926597, 0, 1, 0.8509804, 1,
-0.058645, -1.228947, -2.606765, 0, 1, 0.854902, 1,
-0.05820999, -0.5819724, -4.012287, 0, 1, 0.8627451, 1,
-0.0561242, 0.3359252, -0.5858362, 0, 1, 0.8666667, 1,
-0.05281471, -0.05773458, -1.903887, 0, 1, 0.8745098, 1,
-0.05263786, -1.405579, -3.25124, 0, 1, 0.8784314, 1,
-0.05211969, -0.4793889, -3.496255, 0, 1, 0.8862745, 1,
-0.05179064, 0.4613089, -1.423256, 0, 1, 0.8901961, 1,
-0.05121414, -2.025175, -4.21976, 0, 1, 0.8980392, 1,
-0.04515812, -1.480071, -2.137046, 0, 1, 0.9058824, 1,
-0.04399274, -1.366031, -2.233112, 0, 1, 0.9098039, 1,
-0.04296647, 0.5338706, 1.24519, 0, 1, 0.9176471, 1,
-0.04247137, -2.368304, -2.118166, 0, 1, 0.9215686, 1,
-0.03869872, 2.501143, -1.201331, 0, 1, 0.9294118, 1,
-0.03323213, 0.6326616, -0.5101023, 0, 1, 0.9333333, 1,
-0.03051577, 0.5814571, -0.07133786, 0, 1, 0.9411765, 1,
-0.02899854, 0.1725436, -0.4602355, 0, 1, 0.945098, 1,
-0.02848472, -0.2224489, -1.826513, 0, 1, 0.9529412, 1,
-0.02775, 0.15493, -1.165132, 0, 1, 0.9568627, 1,
-0.02727493, 0.9670076, 0.7585787, 0, 1, 0.9647059, 1,
-0.02674671, 0.925104, -0.4175322, 0, 1, 0.9686275, 1,
-0.02557491, -0.6356929, -3.19814, 0, 1, 0.9764706, 1,
-0.02432672, -1.689159, -3.558425, 0, 1, 0.9803922, 1,
-0.01745101, 0.7693536, -0.4848063, 0, 1, 0.9882353, 1,
-0.01333464, 0.4090588, 0.5227407, 0, 1, 0.9921569, 1,
-0.01001819, -1.142887, -3.228243, 0, 1, 1, 1,
-0.009767076, 1.55197, 0.7836378, 0, 0.9921569, 1, 1,
-0.009737889, -0.01710693, -2.481889, 0, 0.9882353, 1, 1,
-0.006310179, -0.3403795, -4.244061, 0, 0.9803922, 1, 1,
-0.002097613, -1.236566, -2.889022, 0, 0.9764706, 1, 1,
-0.001591858, -1.859567, -3.093389, 0, 0.9686275, 1, 1,
0.007524736, -0.4883457, 2.994879, 0, 0.9647059, 1, 1,
0.01068479, -0.5106499, 2.502023, 0, 0.9568627, 1, 1,
0.01161635, -0.3559549, 2.496535, 0, 0.9529412, 1, 1,
0.01255917, -0.1252283, 2.330541, 0, 0.945098, 1, 1,
0.01398636, 1.707968, -1.203663, 0, 0.9411765, 1, 1,
0.01438408, -0.8877094, 3.141121, 0, 0.9333333, 1, 1,
0.01483098, -0.8670291, 2.139475, 0, 0.9294118, 1, 1,
0.01503124, 0.8565164, -0.7976775, 0, 0.9215686, 1, 1,
0.01870345, -0.8231951, 2.454419, 0, 0.9176471, 1, 1,
0.02010094, -1.190289, 2.257244, 0, 0.9098039, 1, 1,
0.02414661, 0.3061577, -1.226426, 0, 0.9058824, 1, 1,
0.03091585, 0.8143488, 0.4851635, 0, 0.8980392, 1, 1,
0.03158814, -0.59545, 2.280101, 0, 0.8901961, 1, 1,
0.03726712, -0.2061615, 2.804804, 0, 0.8862745, 1, 1,
0.0414946, 1.211843, -0.9050059, 0, 0.8784314, 1, 1,
0.04892225, 0.3199313, -1.09676, 0, 0.8745098, 1, 1,
0.05090956, 0.1364681, 1.687505, 0, 0.8666667, 1, 1,
0.05124221, -1.863786, 2.380792, 0, 0.8627451, 1, 1,
0.05328663, -1.801685, 2.255634, 0, 0.854902, 1, 1,
0.05656506, -0.4261431, 3.106705, 0, 0.8509804, 1, 1,
0.0614784, -0.2479031, 3.496756, 0, 0.8431373, 1, 1,
0.06547572, -1.721923, 4.446436, 0, 0.8392157, 1, 1,
0.06646436, -0.6853307, 4.837861, 0, 0.8313726, 1, 1,
0.07008539, -0.9164136, 2.711383, 0, 0.827451, 1, 1,
0.07038668, -0.1543084, 3.900734, 0, 0.8196079, 1, 1,
0.07652692, -1.714629, 2.92448, 0, 0.8156863, 1, 1,
0.07709855, 0.5780264, -1.405536, 0, 0.8078431, 1, 1,
0.0787487, 0.7174951, 1.263399, 0, 0.8039216, 1, 1,
0.07939489, 0.8353488, 0.7749643, 0, 0.7960784, 1, 1,
0.07999132, 0.2225343, 0.02279912, 0, 0.7882353, 1, 1,
0.08137843, 2.768247, 0.2795824, 0, 0.7843137, 1, 1,
0.08513451, -0.6294026, 2.182699, 0, 0.7764706, 1, 1,
0.08885783, -0.8401428, 3.975325, 0, 0.772549, 1, 1,
0.09710091, 0.6600838, -0.2969141, 0, 0.7647059, 1, 1,
0.09794702, 0.5563021, 2.177463, 0, 0.7607843, 1, 1,
0.09825485, -0.1350407, 1.856319, 0, 0.7529412, 1, 1,
0.09892351, -1.27654, 1.872671, 0, 0.7490196, 1, 1,
0.106582, -0.560771, 3.896507, 0, 0.7411765, 1, 1,
0.1088396, -0.713582, 4.507109, 0, 0.7372549, 1, 1,
0.1128429, 0.7272196, -0.01467672, 0, 0.7294118, 1, 1,
0.1131755, 0.7647222, -0.8066194, 0, 0.7254902, 1, 1,
0.1159865, 0.3627034, 0.9988549, 0, 0.7176471, 1, 1,
0.1227802, 1.015737, 0.1795018, 0, 0.7137255, 1, 1,
0.1265626, 0.3317733, -0.2112739, 0, 0.7058824, 1, 1,
0.1306616, -0.7445105, 2.039648, 0, 0.6980392, 1, 1,
0.1324522, 0.2640517, -1.051299, 0, 0.6941177, 1, 1,
0.1327015, -1.721334, 5.489391, 0, 0.6862745, 1, 1,
0.1329401, 1.851338, -0.5464623, 0, 0.682353, 1, 1,
0.1419649, -2.036133, 2.972128, 0, 0.6745098, 1, 1,
0.14437, -1.45727, 4.611322, 0, 0.6705883, 1, 1,
0.1477134, -0.7212425, 3.165674, 0, 0.6627451, 1, 1,
0.1484992, -1.124104, 2.65253, 0, 0.6588235, 1, 1,
0.1511823, -1.136512, 3.088224, 0, 0.6509804, 1, 1,
0.153294, 0.008821708, 1.327289, 0, 0.6470588, 1, 1,
0.1534259, 1.567842, 0.9144732, 0, 0.6392157, 1, 1,
0.1589838, -2.410948, 1.353967, 0, 0.6352941, 1, 1,
0.1605714, -0.9041319, 3.190177, 0, 0.627451, 1, 1,
0.1610835, -0.6350436, 3.653291, 0, 0.6235294, 1, 1,
0.1643056, -0.1012334, 1.623949, 0, 0.6156863, 1, 1,
0.1644605, 1.251804, -0.2270769, 0, 0.6117647, 1, 1,
0.1652995, -1.474144, 4.3391, 0, 0.6039216, 1, 1,
0.169534, 0.794864, -1.12415, 0, 0.5960785, 1, 1,
0.1697844, 0.05677795, 2.009377, 0, 0.5921569, 1, 1,
0.1724973, -1.14074, 3.020746, 0, 0.5843138, 1, 1,
0.1804155, 2.229208, -0.6513801, 0, 0.5803922, 1, 1,
0.1816778, -0.7409352, 1.553236, 0, 0.572549, 1, 1,
0.1897996, 2.343378, 0.8267874, 0, 0.5686275, 1, 1,
0.1945842, -1.195931, 2.883189, 0, 0.5607843, 1, 1,
0.1953162, -0.8814709, 1.993247, 0, 0.5568628, 1, 1,
0.2001215, 0.397603, 1.11296, 0, 0.5490196, 1, 1,
0.2045282, 0.5459571, 0.2832118, 0, 0.5450981, 1, 1,
0.2064112, 1.006238, 0.7845161, 0, 0.5372549, 1, 1,
0.2064953, 0.8851382, -1.356972, 0, 0.5333334, 1, 1,
0.2071896, -0.9955711, 1.816205, 0, 0.5254902, 1, 1,
0.211568, 2.478798, -0.2264672, 0, 0.5215687, 1, 1,
0.2121152, 0.000515365, 1.855201, 0, 0.5137255, 1, 1,
0.212883, -0.9836103, 2.761943, 0, 0.509804, 1, 1,
0.2145963, 1.711312, 0.4988332, 0, 0.5019608, 1, 1,
0.2168316, 1.249529, 0.2835442, 0, 0.4941176, 1, 1,
0.2172848, -1.082074, 3.572626, 0, 0.4901961, 1, 1,
0.2182157, 0.8739956, 1.706089, 0, 0.4823529, 1, 1,
0.2214275, -1.015409, 3.119931, 0, 0.4784314, 1, 1,
0.2217462, -0.1845409, 1.178917, 0, 0.4705882, 1, 1,
0.2240789, 0.5274863, 0.0870148, 0, 0.4666667, 1, 1,
0.2255146, -2.049113, 2.146486, 0, 0.4588235, 1, 1,
0.2260096, -0.2037915, 1.255419, 0, 0.454902, 1, 1,
0.2288827, -2.044054, 3.263431, 0, 0.4470588, 1, 1,
0.2319637, -0.6157278, 2.53063, 0, 0.4431373, 1, 1,
0.2321067, 0.1350863, 2.049985, 0, 0.4352941, 1, 1,
0.2355809, -0.8769721, 2.480497, 0, 0.4313726, 1, 1,
0.2387894, -1.140967, 1.920841, 0, 0.4235294, 1, 1,
0.2402516, 1.917773, -1.240051, 0, 0.4196078, 1, 1,
0.2415572, 0.5399342, -1.338882, 0, 0.4117647, 1, 1,
0.2420711, 0.1361746, 1.283241, 0, 0.4078431, 1, 1,
0.2555267, 0.5311039, -1.523697, 0, 0.4, 1, 1,
0.2570775, -2.241957, 2.769184, 0, 0.3921569, 1, 1,
0.2574541, 0.01806719, 1.503046, 0, 0.3882353, 1, 1,
0.2606484, 1.550494, 0.9681627, 0, 0.3803922, 1, 1,
0.2621952, -1.062855, 3.560779, 0, 0.3764706, 1, 1,
0.2645215, 0.363286, 1.597119, 0, 0.3686275, 1, 1,
0.266773, -1.012219, 3.527841, 0, 0.3647059, 1, 1,
0.2676292, -0.3775409, 2.427695, 0, 0.3568628, 1, 1,
0.2768077, -0.1193878, 2.559725, 0, 0.3529412, 1, 1,
0.281941, 0.406876, 0.3243163, 0, 0.345098, 1, 1,
0.2826696, -0.2314706, 1.527932, 0, 0.3411765, 1, 1,
0.2879359, 1.159107, 1.541839, 0, 0.3333333, 1, 1,
0.2891731, 0.4383645, 0.9916139, 0, 0.3294118, 1, 1,
0.2899108, -0.5188764, 5.721058, 0, 0.3215686, 1, 1,
0.2917826, 0.7528258, 0.01421116, 0, 0.3176471, 1, 1,
0.2953603, 0.4633307, -0.1090973, 0, 0.3098039, 1, 1,
0.298162, -1.478945, 2.186121, 0, 0.3058824, 1, 1,
0.2993361, 0.2051724, 0.4352922, 0, 0.2980392, 1, 1,
0.2995941, -0.6586702, 5.468268, 0, 0.2901961, 1, 1,
0.3011308, 0.7320856, 0.07725818, 0, 0.2862745, 1, 1,
0.3012141, 0.3934395, 0.09469362, 0, 0.2784314, 1, 1,
0.3019404, 1.55558, 0.6812269, 0, 0.2745098, 1, 1,
0.3170887, 1.457861, 0.349525, 0, 0.2666667, 1, 1,
0.320558, -0.3683624, 3.386377, 0, 0.2627451, 1, 1,
0.3246997, -1.490342, 4.151351, 0, 0.254902, 1, 1,
0.3310344, 0.6089463, 2.64562, 0, 0.2509804, 1, 1,
0.3318281, -0.4691976, 0.9914808, 0, 0.2431373, 1, 1,
0.333062, 1.160005, 0.5463523, 0, 0.2392157, 1, 1,
0.3342938, -1.498035, 1.40021, 0, 0.2313726, 1, 1,
0.3344467, -0.8813425, 3.449929, 0, 0.227451, 1, 1,
0.3352154, 1.526759, -0.7157602, 0, 0.2196078, 1, 1,
0.3380194, -0.9152051, 2.33187, 0, 0.2156863, 1, 1,
0.3392341, -1.125893, 2.559452, 0, 0.2078431, 1, 1,
0.3413728, 0.1378151, 0.5438473, 0, 0.2039216, 1, 1,
0.3429039, 0.6810352, 0.3938649, 0, 0.1960784, 1, 1,
0.3457302, 1.430072, 0.5396773, 0, 0.1882353, 1, 1,
0.3541827, -0.3760764, 3.658559, 0, 0.1843137, 1, 1,
0.3553032, 0.03442278, 1.511185, 0, 0.1764706, 1, 1,
0.3571377, -0.4063882, 2.947045, 0, 0.172549, 1, 1,
0.3581061, -0.2508985, 1.785151, 0, 0.1647059, 1, 1,
0.3593945, 0.5985309, 0.873601, 0, 0.1607843, 1, 1,
0.3599687, 0.5993934, -0.707677, 0, 0.1529412, 1, 1,
0.3654835, 1.75898, 0.9979244, 0, 0.1490196, 1, 1,
0.3657345, -1.343706, 2.734263, 0, 0.1411765, 1, 1,
0.3712724, 0.00715718, 1.629285, 0, 0.1372549, 1, 1,
0.3717231, 1.017974, -0.7805281, 0, 0.1294118, 1, 1,
0.3747612, -2.421941, 2.291461, 0, 0.1254902, 1, 1,
0.3766007, 0.4734604, 1.170525, 0, 0.1176471, 1, 1,
0.3812097, -1.685268, 2.082808, 0, 0.1137255, 1, 1,
0.3815718, -0.1696903, 1.913779, 0, 0.1058824, 1, 1,
0.3821426, 0.06045849, 1.073325, 0, 0.09803922, 1, 1,
0.3860671, 1.349831, 0.2333612, 0, 0.09411765, 1, 1,
0.386078, -0.1387049, 2.630734, 0, 0.08627451, 1, 1,
0.3918324, -1.003312, 3.428584, 0, 0.08235294, 1, 1,
0.3935574, -0.4771912, 2.212857, 0, 0.07450981, 1, 1,
0.3948423, -0.5192673, 2.907053, 0, 0.07058824, 1, 1,
0.3951115, 0.5557537, 1.571884, 0, 0.0627451, 1, 1,
0.3966048, 0.08566166, -0.07134343, 0, 0.05882353, 1, 1,
0.3991515, -0.5867704, 3.828868, 0, 0.05098039, 1, 1,
0.3991654, 1.337221, 0.6771217, 0, 0.04705882, 1, 1,
0.4065983, -0.1386839, 2.605565, 0, 0.03921569, 1, 1,
0.4073439, -1.427878, 3.046014, 0, 0.03529412, 1, 1,
0.4118891, -0.1857683, 1.112182, 0, 0.02745098, 1, 1,
0.4119911, 0.8055827, 0.7935041, 0, 0.02352941, 1, 1,
0.4128819, 1.160115, 0.6097027, 0, 0.01568628, 1, 1,
0.4155475, 0.2972416, 1.175991, 0, 0.01176471, 1, 1,
0.4160005, 0.09061752, 2.530807, 0, 0.003921569, 1, 1,
0.4234774, 0.1073253, 0.8334197, 0.003921569, 0, 1, 1,
0.4243554, 0.935895, 0.3142377, 0.007843138, 0, 1, 1,
0.4268703, -0.6986781, 4.304164, 0.01568628, 0, 1, 1,
0.4333897, -0.5253744, 1.873617, 0.01960784, 0, 1, 1,
0.4366059, 1.724815, 0.1825422, 0.02745098, 0, 1, 1,
0.4409036, -0.366565, 2.456965, 0.03137255, 0, 1, 1,
0.4427047, 0.7786413, 1.1877, 0.03921569, 0, 1, 1,
0.4439844, 0.7383216, -0.1430497, 0.04313726, 0, 1, 1,
0.4468578, 0.6911551, -0.478865, 0.05098039, 0, 1, 1,
0.4470375, -0.02104465, -0.09377697, 0.05490196, 0, 1, 1,
0.4519188, 0.7861444, -0.1901942, 0.0627451, 0, 1, 1,
0.4522373, 0.1925094, 1.483998, 0.06666667, 0, 1, 1,
0.4530578, 0.3998411, 1.692119, 0.07450981, 0, 1, 1,
0.4582382, 0.0653341, 0.8595518, 0.07843138, 0, 1, 1,
0.4628339, -1.313698, 5.240335, 0.08627451, 0, 1, 1,
0.4683043, -0.4044992, 2.856091, 0.09019608, 0, 1, 1,
0.4696123, 0.2830798, 2.500961, 0.09803922, 0, 1, 1,
0.4720676, 0.64924, 1.060305, 0.1058824, 0, 1, 1,
0.4763433, 0.1337829, 0.9500999, 0.1098039, 0, 1, 1,
0.4765112, 0.3267143, 0.286116, 0.1176471, 0, 1, 1,
0.4776246, -0.1001767, 1.878384, 0.1215686, 0, 1, 1,
0.4826466, -1.372308, 2.348622, 0.1294118, 0, 1, 1,
0.4914995, -0.03698079, 1.64323, 0.1333333, 0, 1, 1,
0.4987536, 0.63449, 0.4136172, 0.1411765, 0, 1, 1,
0.4999232, 0.09079521, -1.260648, 0.145098, 0, 1, 1,
0.4999331, -0.6394577, 1.344025, 0.1529412, 0, 1, 1,
0.5057011, -0.8331237, 4.341554, 0.1568628, 0, 1, 1,
0.5155194, 0.05869041, 1.453539, 0.1647059, 0, 1, 1,
0.5162812, 0.3871151, 1.220167, 0.1686275, 0, 1, 1,
0.5191547, -1.218736, 3.971447, 0.1764706, 0, 1, 1,
0.5230519, -0.9780678, 3.84441, 0.1803922, 0, 1, 1,
0.5246638, 0.2976339, 2.271487, 0.1882353, 0, 1, 1,
0.5248659, -1.268178, 2.388934, 0.1921569, 0, 1, 1,
0.5281739, -0.6659024, 3.410786, 0.2, 0, 1, 1,
0.5306, -0.2072663, 1.287639, 0.2078431, 0, 1, 1,
0.5355199, -0.1801585, 1.91748, 0.2117647, 0, 1, 1,
0.5379806, -0.397377, 2.208055, 0.2196078, 0, 1, 1,
0.5393776, -0.6215552, 3.605335, 0.2235294, 0, 1, 1,
0.5413437, -1.181934, 3.595956, 0.2313726, 0, 1, 1,
0.5416145, 0.4998786, 1.123508, 0.2352941, 0, 1, 1,
0.5516659, 0.758526, 2.029355, 0.2431373, 0, 1, 1,
0.5535555, -0.4015284, 2.695204, 0.2470588, 0, 1, 1,
0.553951, 1.058602, 0.6040779, 0.254902, 0, 1, 1,
0.5548174, -0.7652972, 1.254336, 0.2588235, 0, 1, 1,
0.5555893, -0.08192287, 2.595567, 0.2666667, 0, 1, 1,
0.5577885, 0.1477583, 1.627404, 0.2705882, 0, 1, 1,
0.5589681, 1.385749, 1.252424, 0.2784314, 0, 1, 1,
0.5600854, -0.6649138, 3.013422, 0.282353, 0, 1, 1,
0.5627351, -0.1482446, 1.847189, 0.2901961, 0, 1, 1,
0.5681673, -0.6536577, 2.25774, 0.2941177, 0, 1, 1,
0.5696195, 0.4741458, 1.423632, 0.3019608, 0, 1, 1,
0.5731894, -0.8982433, 3.787428, 0.3098039, 0, 1, 1,
0.580504, 0.8981032, -0.01335722, 0.3137255, 0, 1, 1,
0.583261, 0.5521031, 0.770014, 0.3215686, 0, 1, 1,
0.5842425, 0.4123244, 0.8685105, 0.3254902, 0, 1, 1,
0.5893142, -1.020773, 4.651723, 0.3333333, 0, 1, 1,
0.5902538, 2.675191, 1.884827, 0.3372549, 0, 1, 1,
0.5930398, -0.9446408, 2.014239, 0.345098, 0, 1, 1,
0.5941901, -0.2566856, 2.220229, 0.3490196, 0, 1, 1,
0.6066085, 1.008088, -1.220899, 0.3568628, 0, 1, 1,
0.6122569, -1.970532, 1.640578, 0.3607843, 0, 1, 1,
0.6149577, 0.4726028, 1.520855, 0.3686275, 0, 1, 1,
0.6152583, -0.6664623, 0.9997696, 0.372549, 0, 1, 1,
0.6159915, 0.6909257, 0.8304124, 0.3803922, 0, 1, 1,
0.6165508, 1.312675, -0.04893963, 0.3843137, 0, 1, 1,
0.6184366, -0.1892182, 1.762531, 0.3921569, 0, 1, 1,
0.619523, -1.672702, 0.7108662, 0.3960784, 0, 1, 1,
0.6222965, -0.03348793, 1.887455, 0.4039216, 0, 1, 1,
0.6259714, 1.763006, -1.128721, 0.4117647, 0, 1, 1,
0.6362981, 0.1538417, 2.006052, 0.4156863, 0, 1, 1,
0.638935, -0.4784263, -0.7236657, 0.4235294, 0, 1, 1,
0.6396884, -0.7260715, 1.129416, 0.427451, 0, 1, 1,
0.6400145, 1.525466, 1.479284, 0.4352941, 0, 1, 1,
0.6568927, -0.2234818, 2.273303, 0.4392157, 0, 1, 1,
0.6664822, 0.9880905, 1.170789, 0.4470588, 0, 1, 1,
0.6672798, -0.1242356, 3.0646, 0.4509804, 0, 1, 1,
0.6764433, -1.573527, 2.322838, 0.4588235, 0, 1, 1,
0.6785421, 0.398716, 0.03957894, 0.4627451, 0, 1, 1,
0.6828251, -0.2792355, -0.4966596, 0.4705882, 0, 1, 1,
0.6862956, -0.401309, 0.9238745, 0.4745098, 0, 1, 1,
0.6867194, -0.1447657, 1.963343, 0.4823529, 0, 1, 1,
0.6881072, -3.063657, 2.911015, 0.4862745, 0, 1, 1,
0.6898919, 0.1510876, 1.01132, 0.4941176, 0, 1, 1,
0.6953524, 0.3479664, 1.128582, 0.5019608, 0, 1, 1,
0.6978799, 0.366432, 0.9742171, 0.5058824, 0, 1, 1,
0.6993299, -0.3384194, 1.227493, 0.5137255, 0, 1, 1,
0.7015864, 0.1073941, 2.314038, 0.5176471, 0, 1, 1,
0.7031779, 1.266065, 0.7156745, 0.5254902, 0, 1, 1,
0.7037115, -0.3994926, 2.223527, 0.5294118, 0, 1, 1,
0.7042375, 0.6821932, 2.412595, 0.5372549, 0, 1, 1,
0.7048978, 1.355016, 0.6741859, 0.5411765, 0, 1, 1,
0.7065272, -0.4246856, 2.107872, 0.5490196, 0, 1, 1,
0.706874, 0.6471698, 0.9638276, 0.5529412, 0, 1, 1,
0.7084223, -1.333655, 3.604442, 0.5607843, 0, 1, 1,
0.7135757, -3.299639, 3.299498, 0.5647059, 0, 1, 1,
0.7140167, 1.145144, 1.226119, 0.572549, 0, 1, 1,
0.7153016, -0.6475553, 2.754073, 0.5764706, 0, 1, 1,
0.7164945, -1.347853, 1.215502, 0.5843138, 0, 1, 1,
0.7171543, 0.7628152, -0.7443295, 0.5882353, 0, 1, 1,
0.7250568, 1.741851, 0.8843768, 0.5960785, 0, 1, 1,
0.7308793, 0.1954273, 1.732047, 0.6039216, 0, 1, 1,
0.7349663, -0.6142843, 1.337549, 0.6078432, 0, 1, 1,
0.7361093, -1.193478, 1.543118, 0.6156863, 0, 1, 1,
0.736768, -0.9073892, 1.029618, 0.6196079, 0, 1, 1,
0.7376803, -0.1906133, 1.841316, 0.627451, 0, 1, 1,
0.7404553, -0.8395535, 1.826377, 0.6313726, 0, 1, 1,
0.7427433, 0.6922657, 2.113163, 0.6392157, 0, 1, 1,
0.7503398, 2.3304, -1.063498, 0.6431373, 0, 1, 1,
0.7515423, 0.8509254, -0.9250544, 0.6509804, 0, 1, 1,
0.754182, 1.514962, -0.936574, 0.654902, 0, 1, 1,
0.7550704, -0.1602585, -0.67258, 0.6627451, 0, 1, 1,
0.7562659, 1.457389, -0.8248258, 0.6666667, 0, 1, 1,
0.7662627, 0.9205443, 1.508153, 0.6745098, 0, 1, 1,
0.7665331, 1.422142, 0.3794473, 0.6784314, 0, 1, 1,
0.7666312, 1.240996, 0.7259743, 0.6862745, 0, 1, 1,
0.7703209, -0.3694388, 1.841134, 0.6901961, 0, 1, 1,
0.770544, -1.110411, 2.084699, 0.6980392, 0, 1, 1,
0.7730512, 1.071995, -1.405467, 0.7058824, 0, 1, 1,
0.785982, -1.111353, 1.968825, 0.7098039, 0, 1, 1,
0.7889007, 0.06273848, 0.4370379, 0.7176471, 0, 1, 1,
0.7984628, 0.2940352, 1.677976, 0.7215686, 0, 1, 1,
0.800758, 0.2560904, 1.833823, 0.7294118, 0, 1, 1,
0.8101004, -1.123219, 3.179559, 0.7333333, 0, 1, 1,
0.8116621, -1.276857, 2.521929, 0.7411765, 0, 1, 1,
0.8188982, 1.758825, 0.5640627, 0.7450981, 0, 1, 1,
0.8376361, -1.488986, 1.968261, 0.7529412, 0, 1, 1,
0.8478302, -0.02206811, 1.197695, 0.7568628, 0, 1, 1,
0.855557, 0.6404721, 2.619653, 0.7647059, 0, 1, 1,
0.8575109, 0.02699313, 2.0704, 0.7686275, 0, 1, 1,
0.8587845, 0.8579624, 1.995839, 0.7764706, 0, 1, 1,
0.8593971, 1.00209, 0.6997454, 0.7803922, 0, 1, 1,
0.8603065, 1.145867, 1.580855, 0.7882353, 0, 1, 1,
0.8645724, -1.987275, 2.61288, 0.7921569, 0, 1, 1,
0.8661148, -0.7239248, 2.299438, 0.8, 0, 1, 1,
0.8691476, 0.3507743, 2.270075, 0.8078431, 0, 1, 1,
0.8706904, 0.6316655, 2.155151, 0.8117647, 0, 1, 1,
0.8722371, 0.6896121, 0.4021821, 0.8196079, 0, 1, 1,
0.8734952, -1.06706, 1.730018, 0.8235294, 0, 1, 1,
0.8779125, 0.2341713, 3.22701, 0.8313726, 0, 1, 1,
0.8807612, -0.9145193, 2.015828, 0.8352941, 0, 1, 1,
0.8878402, -0.03173618, 0.7049505, 0.8431373, 0, 1, 1,
0.8881946, 0.688117, 0.494375, 0.8470588, 0, 1, 1,
0.8882725, 0.8397657, 0.5512508, 0.854902, 0, 1, 1,
0.8918415, 2.346492, -0.1669314, 0.8588235, 0, 1, 1,
0.8940278, 1.846123, -0.4797364, 0.8666667, 0, 1, 1,
0.9017683, 1.057253, 1.749329, 0.8705882, 0, 1, 1,
0.9134278, 0.04938454, 0.6857605, 0.8784314, 0, 1, 1,
0.9171832, 1.075151, 1.032565, 0.8823529, 0, 1, 1,
0.9251531, 0.3824768, 0.4227769, 0.8901961, 0, 1, 1,
0.9260262, 0.5500438, 1.122484, 0.8941177, 0, 1, 1,
0.9267839, -1.18694, 2.743077, 0.9019608, 0, 1, 1,
0.9289569, -0.3702025, 2.758709, 0.9098039, 0, 1, 1,
0.9367053, -1.119851, 2.972572, 0.9137255, 0, 1, 1,
0.9393526, -0.02076399, 1.582233, 0.9215686, 0, 1, 1,
0.9503385, -2.020601, 2.982426, 0.9254902, 0, 1, 1,
0.9623474, -0.2830121, 3.483332, 0.9333333, 0, 1, 1,
0.9820259, -0.4760284, 1.107198, 0.9372549, 0, 1, 1,
0.982086, 0.9598036, 0.857566, 0.945098, 0, 1, 1,
0.9845971, -0.6145284, 1.616152, 0.9490196, 0, 1, 1,
0.9895624, -2.140869, 1.925605, 0.9568627, 0, 1, 1,
0.9959102, 0.4467767, 1.246054, 0.9607843, 0, 1, 1,
1.01516, 0.7510577, 2.23554, 0.9686275, 0, 1, 1,
1.018463, 1.78559, 2.715075, 0.972549, 0, 1, 1,
1.022663, -0.4442748, 2.970973, 0.9803922, 0, 1, 1,
1.029366, 0.8271407, 1.592314, 0.9843137, 0, 1, 1,
1.033061, 0.5693459, 1.465433, 0.9921569, 0, 1, 1,
1.03907, 0.9617982, 1.22808, 0.9960784, 0, 1, 1,
1.041354, -1.426406, 1.078376, 1, 0, 0.9960784, 1,
1.042002, 0.7528474, -1.135383, 1, 0, 0.9882353, 1,
1.045896, -1.753141, 1.869472, 1, 0, 0.9843137, 1,
1.053581, 3.033109, -1.474321, 1, 0, 0.9764706, 1,
1.056459, 1.741821, -0.3880187, 1, 0, 0.972549, 1,
1.062158, 1.32746, -0.3555411, 1, 0, 0.9647059, 1,
1.073231, 0.2749278, 1.912076, 1, 0, 0.9607843, 1,
1.074451, -0.7358234, 1.901458, 1, 0, 0.9529412, 1,
1.079858, -1.569961, 2.831188, 1, 0, 0.9490196, 1,
1.086689, 0.770216, 2.169137, 1, 0, 0.9411765, 1,
1.088806, -0.280593, 2.603598, 1, 0, 0.9372549, 1,
1.089685, -0.9558812, 3.263062, 1, 0, 0.9294118, 1,
1.091847, -0.2892938, 2.886954, 1, 0, 0.9254902, 1,
1.099278, -0.1041092, 1.016194, 1, 0, 0.9176471, 1,
1.099282, -1.017686, 1.851622, 1, 0, 0.9137255, 1,
1.109378, 0.1914696, 2.75117, 1, 0, 0.9058824, 1,
1.113077, 1.285739, 0.0955345, 1, 0, 0.9019608, 1,
1.116414, 0.4788246, 2.378286, 1, 0, 0.8941177, 1,
1.120831, -0.008372325, 2.151487, 1, 0, 0.8862745, 1,
1.127896, 0.3148692, 0.986908, 1, 0, 0.8823529, 1,
1.136962, -0.8235278, 2.156914, 1, 0, 0.8745098, 1,
1.152182, 0.6157232, 0.7339799, 1, 0, 0.8705882, 1,
1.157404, 1.236526, 0.2074511, 1, 0, 0.8627451, 1,
1.161746, -0.1835334, 2.207818, 1, 0, 0.8588235, 1,
1.16224, -3.300427, 2.839557, 1, 0, 0.8509804, 1,
1.166641, 1.343987, 1.375317, 1, 0, 0.8470588, 1,
1.168756, -2.232068, 4.256834, 1, 0, 0.8392157, 1,
1.170045, 0.1440503, 1.152684, 1, 0, 0.8352941, 1,
1.178721, -0.02612261, -0.02504512, 1, 0, 0.827451, 1,
1.18482, -0.8058769, 2.055277, 1, 0, 0.8235294, 1,
1.189123, 0.05931712, 0.4800636, 1, 0, 0.8156863, 1,
1.189342, -0.8481956, 3.654903, 1, 0, 0.8117647, 1,
1.199363, 0.2642827, 0.2282321, 1, 0, 0.8039216, 1,
1.199492, 2.233597, -0.9052464, 1, 0, 0.7960784, 1,
1.201205, -1.257938, 2.47498, 1, 0, 0.7921569, 1,
1.202583, 2.333466, 0.4790352, 1, 0, 0.7843137, 1,
1.203764, 0.4777987, 0.5645241, 1, 0, 0.7803922, 1,
1.208442, -0.3178989, 1.462018, 1, 0, 0.772549, 1,
1.209933, -2.190856, 3.028527, 1, 0, 0.7686275, 1,
1.213203, -0.2895693, 3.184444, 1, 0, 0.7607843, 1,
1.21982, -1.445107, 2.97153, 1, 0, 0.7568628, 1,
1.22629, 1.920718, 1.791047, 1, 0, 0.7490196, 1,
1.226755, -0.9314455, 1.851692, 1, 0, 0.7450981, 1,
1.243727, -0.9603222, 0.9900936, 1, 0, 0.7372549, 1,
1.244717, -0.2259919, 1.933301, 1, 0, 0.7333333, 1,
1.253708, -0.7870891, 2.315473, 1, 0, 0.7254902, 1,
1.254894, 0.4348941, 1.084401, 1, 0, 0.7215686, 1,
1.262264, -0.03425605, 2.52712, 1, 0, 0.7137255, 1,
1.265939, 0.4194097, -2.035565, 1, 0, 0.7098039, 1,
1.272153, -0.7068894, 1.450054, 1, 0, 0.7019608, 1,
1.273455, 0.9390403, -1.22894, 1, 0, 0.6941177, 1,
1.2738, 1.061665, 1.12325, 1, 0, 0.6901961, 1,
1.278802, -2.363293, 0.7983691, 1, 0, 0.682353, 1,
1.281108, -0.3595943, 1.371953, 1, 0, 0.6784314, 1,
1.285163, 1.170313, 1.205599, 1, 0, 0.6705883, 1,
1.291178, 1.213771, -0.1532548, 1, 0, 0.6666667, 1,
1.292269, -0.3616664, 2.618334, 1, 0, 0.6588235, 1,
1.299158, 1.550284, 0.2108147, 1, 0, 0.654902, 1,
1.304775, -0.8661835, 1.412089, 1, 0, 0.6470588, 1,
1.306959, -0.02306155, 2.838741, 1, 0, 0.6431373, 1,
1.310722, 0.07194159, 2.012426, 1, 0, 0.6352941, 1,
1.314015, -1.309285, 2.027483, 1, 0, 0.6313726, 1,
1.31774, 0.3394156, 0.3042534, 1, 0, 0.6235294, 1,
1.322617, -0.6146023, 1.05658, 1, 0, 0.6196079, 1,
1.329381, 1.153652, 0.9576539, 1, 0, 0.6117647, 1,
1.330132, -0.7923774, 2.145718, 1, 0, 0.6078432, 1,
1.337031, -1.156788, 1.638733, 1, 0, 0.6, 1,
1.337339, -1.936664, 1.76279, 1, 0, 0.5921569, 1,
1.337896, -0.761601, 3.301426, 1, 0, 0.5882353, 1,
1.351004, 1.011121, 0.6911492, 1, 0, 0.5803922, 1,
1.351794, -0.5910549, 2.087301, 1, 0, 0.5764706, 1,
1.354888, -0.5727727, 2.023358, 1, 0, 0.5686275, 1,
1.355613, -2.659966, 2.963988, 1, 0, 0.5647059, 1,
1.355656, -0.3443189, 2.762733, 1, 0, 0.5568628, 1,
1.356981, 1.414629, 1.180851, 1, 0, 0.5529412, 1,
1.374236, -1.044802, 1.623452, 1, 0, 0.5450981, 1,
1.375268, -0.5364382, 1.24505, 1, 0, 0.5411765, 1,
1.37635, 0.9573734, 1.832448, 1, 0, 0.5333334, 1,
1.387852, 0.2835982, 2.966774, 1, 0, 0.5294118, 1,
1.389389, -1.603894, 2.995851, 1, 0, 0.5215687, 1,
1.395817, -0.4024511, 0.7131765, 1, 0, 0.5176471, 1,
1.410035, -0.9594156, 3.291682, 1, 0, 0.509804, 1,
1.417399, -0.3414046, 1.424969, 1, 0, 0.5058824, 1,
1.436898, 0.002583291, 1.23659, 1, 0, 0.4980392, 1,
1.443298, -0.9425233, 1.799372, 1, 0, 0.4901961, 1,
1.458945, -0.9431692, 1.533531, 1, 0, 0.4862745, 1,
1.464596, 0.7068883, 2.342994, 1, 0, 0.4784314, 1,
1.46642, 0.7360814, 0.926204, 1, 0, 0.4745098, 1,
1.472355, 1.338336, 1.733881, 1, 0, 0.4666667, 1,
1.48096, -0.7624611, 1.796632, 1, 0, 0.4627451, 1,
1.489927, -1.33153, 4.274913, 1, 0, 0.454902, 1,
1.493998, -1.574622, 2.489879, 1, 0, 0.4509804, 1,
1.496698, -0.5785161, 3.014441, 1, 0, 0.4431373, 1,
1.507643, -0.6514683, 2.075198, 1, 0, 0.4392157, 1,
1.520537, 0.3716124, 0.7582558, 1, 0, 0.4313726, 1,
1.529826, -2.501085, 3.367522, 1, 0, 0.427451, 1,
1.533792, -0.4504609, 0.4676909, 1, 0, 0.4196078, 1,
1.536408, -0.5401814, 2.044375, 1, 0, 0.4156863, 1,
1.537877, -1.547362, 3.007472, 1, 0, 0.4078431, 1,
1.553281, -0.33588, 2.340667, 1, 0, 0.4039216, 1,
1.56205, 0.6396091, 2.197076, 1, 0, 0.3960784, 1,
1.563161, 2.10877, -0.06220447, 1, 0, 0.3882353, 1,
1.567814, 1.24142, 0.4750206, 1, 0, 0.3843137, 1,
1.579608, 0.5868648, -1.161812, 1, 0, 0.3764706, 1,
1.599959, 1.349474, 3.45522, 1, 0, 0.372549, 1,
1.605016, 0.9743904, 2.333711, 1, 0, 0.3647059, 1,
1.612328, -1.166307, 4.121641, 1, 0, 0.3607843, 1,
1.618523, -0.8257161, 3.147911, 1, 0, 0.3529412, 1,
1.627361, -0.7299611, 4.21656, 1, 0, 0.3490196, 1,
1.634142, -0.3578819, 3.079472, 1, 0, 0.3411765, 1,
1.641, 1.973963, 2.524953, 1, 0, 0.3372549, 1,
1.658661, -0.9390322, 0.8593807, 1, 0, 0.3294118, 1,
1.664141, 0.2578988, 2.77206, 1, 0, 0.3254902, 1,
1.692044, -0.07319218, 1.260341, 1, 0, 0.3176471, 1,
1.705554, 0.272472, 0.1461644, 1, 0, 0.3137255, 1,
1.718118, 0.5091133, 0.8668937, 1, 0, 0.3058824, 1,
1.721708, -0.8367739, 2.806514, 1, 0, 0.2980392, 1,
1.722314, -2.558047, 2.838006, 1, 0, 0.2941177, 1,
1.723235, -1.62045, 3.57151, 1, 0, 0.2862745, 1,
1.730526, 0.1922029, -0.1844655, 1, 0, 0.282353, 1,
1.735539, 0.02563934, 0.6462783, 1, 0, 0.2745098, 1,
1.738153, -1.186376, 2.565546, 1, 0, 0.2705882, 1,
1.75929, -0.387421, 1.908966, 1, 0, 0.2627451, 1,
1.761247, 0.8582491, 1.746645, 1, 0, 0.2588235, 1,
1.76353, 2.83703, -0.3501056, 1, 0, 0.2509804, 1,
1.776304, 0.6551465, 1.165649, 1, 0, 0.2470588, 1,
1.777498, -2.2031, 3.976638, 1, 0, 0.2392157, 1,
1.786775, -1.527118, 1.769365, 1, 0, 0.2352941, 1,
1.787799, -0.8370329, 1.427001, 1, 0, 0.227451, 1,
1.791546, -1.837021, 2.319427, 1, 0, 0.2235294, 1,
1.825211, -1.846578, 4.2221, 1, 0, 0.2156863, 1,
1.843769, -0.3179331, 1.707404, 1, 0, 0.2117647, 1,
1.85025, 0.5382572, 1.435158, 1, 0, 0.2039216, 1,
1.864905, 0.9762033, 0.6712428, 1, 0, 0.1960784, 1,
1.866386, 0.4976487, 1.567226, 1, 0, 0.1921569, 1,
1.94311, 1.44707, 0.1113257, 1, 0, 0.1843137, 1,
1.962586, 0.04264385, 4.203808, 1, 0, 0.1803922, 1,
1.977511, -0.4725874, 3.871298, 1, 0, 0.172549, 1,
2.003177, -0.3462876, 2.775869, 1, 0, 0.1686275, 1,
2.00942, 0.5658, 0.9931476, 1, 0, 0.1607843, 1,
2.027102, -1.060185, 3.770832, 1, 0, 0.1568628, 1,
2.033133, -1.771528, 1.750621, 1, 0, 0.1490196, 1,
2.042399, -0.169304, 2.543123, 1, 0, 0.145098, 1,
2.044858, 0.1245814, 0.8923994, 1, 0, 0.1372549, 1,
2.057777, 0.1064063, 1.314093, 1, 0, 0.1333333, 1,
2.086616, -0.01305842, 0.4485541, 1, 0, 0.1254902, 1,
2.13793, 0.8876621, 0.9964435, 1, 0, 0.1215686, 1,
2.169442, 1.290608, 0.9387572, 1, 0, 0.1137255, 1,
2.191784, -1.662187, 3.319355, 1, 0, 0.1098039, 1,
2.256638, 0.07261116, 2.125573, 1, 0, 0.1019608, 1,
2.257266, -2.064386, 2.506428, 1, 0, 0.09411765, 1,
2.258654, -2.814472, 1.638981, 1, 0, 0.09019608, 1,
2.265643, 0.7591993, 1.752555, 1, 0, 0.08235294, 1,
2.307352, 0.927062, 2.462986, 1, 0, 0.07843138, 1,
2.347985, -0.3661843, 2.239297, 1, 0, 0.07058824, 1,
2.392764, 1.752633, 0.8079534, 1, 0, 0.06666667, 1,
2.498969, -0.9172073, 1.853259, 1, 0, 0.05882353, 1,
2.503605, -1.181463, 1.974073, 1, 0, 0.05490196, 1,
2.507096, -0.380866, 2.401858, 1, 0, 0.04705882, 1,
2.523602, 0.9949884, 0.1250959, 1, 0, 0.04313726, 1,
2.611439, 0.8882456, 1.962951, 1, 0, 0.03529412, 1,
2.681811, -1.235035, 1.180671, 1, 0, 0.03137255, 1,
2.692996, -0.5878299, 1.031474, 1, 0, 0.02352941, 1,
2.765631, 0.770422, 0.929301, 1, 0, 0.01960784, 1,
2.928451, 0.8268237, 2.261624, 1, 0, 0.01176471, 1,
2.959016, 0.6656166, 1.996186, 1, 0, 0.007843138, 1
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
-0.2059036, -4.531172, -7.086199, 0, -0.5, 0.5, 0.5,
-0.2059036, -4.531172, -7.086199, 1, -0.5, 0.5, 0.5,
-0.2059036, -4.531172, -7.086199, 1, 1.5, 0.5, 0.5,
-0.2059036, -4.531172, -7.086199, 0, 1.5, 0.5, 0.5
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
-4.44373, -0.2008719, -7.086199, 0, -0.5, 0.5, 0.5,
-4.44373, -0.2008719, -7.086199, 1, -0.5, 0.5, 0.5,
-4.44373, -0.2008719, -7.086199, 1, 1.5, 0.5, 0.5,
-4.44373, -0.2008719, -7.086199, 0, 1.5, 0.5, 0.5
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
-4.44373, -4.531172, 0.2455313, 0, -0.5, 0.5, 0.5,
-4.44373, -4.531172, 0.2455313, 1, -0.5, 0.5, 0.5,
-4.44373, -4.531172, 0.2455313, 1, 1.5, 0.5, 0.5,
-4.44373, -4.531172, 0.2455313, 0, 1.5, 0.5, 0.5
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
-3, -3.531872, -5.394261,
2, -3.531872, -5.394261,
-3, -3.531872, -5.394261,
-3, -3.698422, -5.676251,
-2, -3.531872, -5.394261,
-2, -3.698422, -5.676251,
-1, -3.531872, -5.394261,
-1, -3.698422, -5.676251,
0, -3.531872, -5.394261,
0, -3.698422, -5.676251,
1, -3.531872, -5.394261,
1, -3.698422, -5.676251,
2, -3.531872, -5.394261,
2, -3.698422, -5.676251
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
-3, -4.031522, -6.240231, 0, -0.5, 0.5, 0.5,
-3, -4.031522, -6.240231, 1, -0.5, 0.5, 0.5,
-3, -4.031522, -6.240231, 1, 1.5, 0.5, 0.5,
-3, -4.031522, -6.240231, 0, 1.5, 0.5, 0.5,
-2, -4.031522, -6.240231, 0, -0.5, 0.5, 0.5,
-2, -4.031522, -6.240231, 1, -0.5, 0.5, 0.5,
-2, -4.031522, -6.240231, 1, 1.5, 0.5, 0.5,
-2, -4.031522, -6.240231, 0, 1.5, 0.5, 0.5,
-1, -4.031522, -6.240231, 0, -0.5, 0.5, 0.5,
-1, -4.031522, -6.240231, 1, -0.5, 0.5, 0.5,
-1, -4.031522, -6.240231, 1, 1.5, 0.5, 0.5,
-1, -4.031522, -6.240231, 0, 1.5, 0.5, 0.5,
0, -4.031522, -6.240231, 0, -0.5, 0.5, 0.5,
0, -4.031522, -6.240231, 1, -0.5, 0.5, 0.5,
0, -4.031522, -6.240231, 1, 1.5, 0.5, 0.5,
0, -4.031522, -6.240231, 0, 1.5, 0.5, 0.5,
1, -4.031522, -6.240231, 0, -0.5, 0.5, 0.5,
1, -4.031522, -6.240231, 1, -0.5, 0.5, 0.5,
1, -4.031522, -6.240231, 1, 1.5, 0.5, 0.5,
1, -4.031522, -6.240231, 0, 1.5, 0.5, 0.5,
2, -4.031522, -6.240231, 0, -0.5, 0.5, 0.5,
2, -4.031522, -6.240231, 1, -0.5, 0.5, 0.5,
2, -4.031522, -6.240231, 1, 1.5, 0.5, 0.5,
2, -4.031522, -6.240231, 0, 1.5, 0.5, 0.5
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
-3.46577, -3, -5.394261,
-3.46577, 3, -5.394261,
-3.46577, -3, -5.394261,
-3.628764, -3, -5.676251,
-3.46577, -2, -5.394261,
-3.628764, -2, -5.676251,
-3.46577, -1, -5.394261,
-3.628764, -1, -5.676251,
-3.46577, 0, -5.394261,
-3.628764, 0, -5.676251,
-3.46577, 1, -5.394261,
-3.628764, 1, -5.676251,
-3.46577, 2, -5.394261,
-3.628764, 2, -5.676251,
-3.46577, 3, -5.394261,
-3.628764, 3, -5.676251
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
-3.954751, -3, -6.240231, 0, -0.5, 0.5, 0.5,
-3.954751, -3, -6.240231, 1, -0.5, 0.5, 0.5,
-3.954751, -3, -6.240231, 1, 1.5, 0.5, 0.5,
-3.954751, -3, -6.240231, 0, 1.5, 0.5, 0.5,
-3.954751, -2, -6.240231, 0, -0.5, 0.5, 0.5,
-3.954751, -2, -6.240231, 1, -0.5, 0.5, 0.5,
-3.954751, -2, -6.240231, 1, 1.5, 0.5, 0.5,
-3.954751, -2, -6.240231, 0, 1.5, 0.5, 0.5,
-3.954751, -1, -6.240231, 0, -0.5, 0.5, 0.5,
-3.954751, -1, -6.240231, 1, -0.5, 0.5, 0.5,
-3.954751, -1, -6.240231, 1, 1.5, 0.5, 0.5,
-3.954751, -1, -6.240231, 0, 1.5, 0.5, 0.5,
-3.954751, 0, -6.240231, 0, -0.5, 0.5, 0.5,
-3.954751, 0, -6.240231, 1, -0.5, 0.5, 0.5,
-3.954751, 0, -6.240231, 1, 1.5, 0.5, 0.5,
-3.954751, 0, -6.240231, 0, 1.5, 0.5, 0.5,
-3.954751, 1, -6.240231, 0, -0.5, 0.5, 0.5,
-3.954751, 1, -6.240231, 1, -0.5, 0.5, 0.5,
-3.954751, 1, -6.240231, 1, 1.5, 0.5, 0.5,
-3.954751, 1, -6.240231, 0, 1.5, 0.5, 0.5,
-3.954751, 2, -6.240231, 0, -0.5, 0.5, 0.5,
-3.954751, 2, -6.240231, 1, -0.5, 0.5, 0.5,
-3.954751, 2, -6.240231, 1, 1.5, 0.5, 0.5,
-3.954751, 2, -6.240231, 0, 1.5, 0.5, 0.5,
-3.954751, 3, -6.240231, 0, -0.5, 0.5, 0.5,
-3.954751, 3, -6.240231, 1, -0.5, 0.5, 0.5,
-3.954751, 3, -6.240231, 1, 1.5, 0.5, 0.5,
-3.954751, 3, -6.240231, 0, 1.5, 0.5, 0.5
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
-3.46577, -3.531872, -4,
-3.46577, -3.531872, 4,
-3.46577, -3.531872, -4,
-3.628764, -3.698422, -4,
-3.46577, -3.531872, -2,
-3.628764, -3.698422, -2,
-3.46577, -3.531872, 0,
-3.628764, -3.698422, 0,
-3.46577, -3.531872, 2,
-3.628764, -3.698422, 2,
-3.46577, -3.531872, 4,
-3.628764, -3.698422, 4
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
-3.954751, -4.031522, -4, 0, -0.5, 0.5, 0.5,
-3.954751, -4.031522, -4, 1, -0.5, 0.5, 0.5,
-3.954751, -4.031522, -4, 1, 1.5, 0.5, 0.5,
-3.954751, -4.031522, -4, 0, 1.5, 0.5, 0.5,
-3.954751, -4.031522, -2, 0, -0.5, 0.5, 0.5,
-3.954751, -4.031522, -2, 1, -0.5, 0.5, 0.5,
-3.954751, -4.031522, -2, 1, 1.5, 0.5, 0.5,
-3.954751, -4.031522, -2, 0, 1.5, 0.5, 0.5,
-3.954751, -4.031522, 0, 0, -0.5, 0.5, 0.5,
-3.954751, -4.031522, 0, 1, -0.5, 0.5, 0.5,
-3.954751, -4.031522, 0, 1, 1.5, 0.5, 0.5,
-3.954751, -4.031522, 0, 0, 1.5, 0.5, 0.5,
-3.954751, -4.031522, 2, 0, -0.5, 0.5, 0.5,
-3.954751, -4.031522, 2, 1, -0.5, 0.5, 0.5,
-3.954751, -4.031522, 2, 1, 1.5, 0.5, 0.5,
-3.954751, -4.031522, 2, 0, 1.5, 0.5, 0.5,
-3.954751, -4.031522, 4, 0, -0.5, 0.5, 0.5,
-3.954751, -4.031522, 4, 1, -0.5, 0.5, 0.5,
-3.954751, -4.031522, 4, 1, 1.5, 0.5, 0.5,
-3.954751, -4.031522, 4, 0, 1.5, 0.5, 0.5
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
-3.46577, -3.531872, -5.394261,
-3.46577, 3.130128, -5.394261,
-3.46577, -3.531872, 5.885324,
-3.46577, 3.130128, 5.885324,
-3.46577, -3.531872, -5.394261,
-3.46577, -3.531872, 5.885324,
-3.46577, 3.130128, -5.394261,
-3.46577, 3.130128, 5.885324,
-3.46577, -3.531872, -5.394261,
3.053963, -3.531872, -5.394261,
-3.46577, -3.531872, 5.885324,
3.053963, -3.531872, 5.885324,
-3.46577, 3.130128, -5.394261,
3.053963, 3.130128, -5.394261,
-3.46577, 3.130128, 5.885324,
3.053963, 3.130128, 5.885324,
3.053963, -3.531872, -5.394261,
3.053963, 3.130128, -5.394261,
3.053963, -3.531872, 5.885324,
3.053963, 3.130128, 5.885324,
3.053963, -3.531872, -5.394261,
3.053963, -3.531872, 5.885324,
3.053963, 3.130128, -5.394261,
3.053963, 3.130128, 5.885324
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
var radius = 7.81362;
var distance = 34.76368;
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
mvMatrix.translate( 0.2059036, 0.2008719, -0.2455313 );
mvMatrix.scale( 1.295795, 1.268124, 0.7489849 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.76368);
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
imidazolidine<-read.table("imidazolidine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imidazolidine$V2
```

```
## Error in eval(expr, envir, enclos): object 'imidazolidine' not found
```

```r
y<-imidazolidine$V3
```

```
## Error in eval(expr, envir, enclos): object 'imidazolidine' not found
```

```r
z<-imidazolidine$V4
```

```
## Error in eval(expr, envir, enclos): object 'imidazolidine' not found
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
-3.370823, -0.6589821, -3.399823, 0, 0, 1, 1, 1,
-2.787799, 1.316509, -2.107996, 1, 0, 0, 1, 1,
-2.562913, 0.04610008, -1.357609, 1, 0, 0, 1, 1,
-2.497523, 0.6002994, -0.9741234, 1, 0, 0, 1, 1,
-2.41676, 1.297565, 0.0107001, 1, 0, 0, 1, 1,
-2.38451, -1.443732, -2.662485, 1, 0, 0, 1, 1,
-2.377841, -1.513441, -1.904497, 0, 0, 0, 1, 1,
-2.37507, 1.315502, -0.7298206, 0, 0, 0, 1, 1,
-2.357133, 0.7204636, -0.6568077, 0, 0, 0, 1, 1,
-2.333104, 1.846385, 0.2324113, 0, 0, 0, 1, 1,
-2.223425, -0.6942313, -2.577792, 0, 0, 0, 1, 1,
-2.171741, -0.120747, -1.699079, 0, 0, 0, 1, 1,
-2.135942, 0.5617983, -1.943872, 0, 0, 0, 1, 1,
-2.107124, -3.12387, -2.984546, 1, 1, 1, 1, 1,
-2.105475, 0.4706241, -0.6228055, 1, 1, 1, 1, 1,
-2.081563, -0.5471184, -4.274161, 1, 1, 1, 1, 1,
-2.075952, 0.2064287, -0.7432979, 1, 1, 1, 1, 1,
-2.074462, 2.054072, 0.9599787, 1, 1, 1, 1, 1,
-2.060918, 1.246846, -0.2641667, 1, 1, 1, 1, 1,
-2.057155, 0.5579392, -1.723054, 1, 1, 1, 1, 1,
-2.007043, -0.7418051, -2.519841, 1, 1, 1, 1, 1,
-2.001074, 1.084257, 0.623553, 1, 1, 1, 1, 1,
-1.986505, -0.4177931, -1.811538, 1, 1, 1, 1, 1,
-1.970702, -0.6932417, -3.081595, 1, 1, 1, 1, 1,
-1.959041, 0.7890403, -0.7423826, 1, 1, 1, 1, 1,
-1.934346, 0.2569239, -0.6741427, 1, 1, 1, 1, 1,
-1.933239, -0.3284059, -3.945031, 1, 1, 1, 1, 1,
-1.930955, 1.034505, -0.3991008, 1, 1, 1, 1, 1,
-1.873717, -0.4178274, -1.701668, 0, 0, 1, 1, 1,
-1.834519, 0.8174245, -1.901854, 1, 0, 0, 1, 1,
-1.825676, -0.3143181, -0.6751716, 1, 0, 0, 1, 1,
-1.823553, -0.7346191, -2.276296, 1, 0, 0, 1, 1,
-1.822542, 0.2373714, -1.802355, 1, 0, 0, 1, 1,
-1.77583, 0.9829881, -2.622797, 1, 0, 0, 1, 1,
-1.772842, 0.1663449, -1.807509, 0, 0, 0, 1, 1,
-1.769446, 0.7065971, -1.681628, 0, 0, 0, 1, 1,
-1.764346, 1.23124, -1.395439, 0, 0, 0, 1, 1,
-1.730498, -1.12336, -0.3511535, 0, 0, 0, 1, 1,
-1.701382, -0.942539, -2.446473, 0, 0, 0, 1, 1,
-1.682486, 0.1989691, -2.083936, 0, 0, 0, 1, 1,
-1.666524, -0.5915586, -2.845988, 0, 0, 0, 1, 1,
-1.657045, -0.06819434, -3.301131, 1, 1, 1, 1, 1,
-1.64738, -0.3249364, -1.116262, 1, 1, 1, 1, 1,
-1.642885, 0.9433756, -1.623851, 1, 1, 1, 1, 1,
-1.64265, -0.05930931, -2.689636, 1, 1, 1, 1, 1,
-1.63776, -0.09918129, -3.780746, 1, 1, 1, 1, 1,
-1.634816, 0.08598678, -2.361769, 1, 1, 1, 1, 1,
-1.622148, -0.2750576, -1.993898, 1, 1, 1, 1, 1,
-1.621089, 0.1186998, -3.282975, 1, 1, 1, 1, 1,
-1.620347, -2.014741, -1.888037, 1, 1, 1, 1, 1,
-1.619816, -1.101747, -2.630979, 1, 1, 1, 1, 1,
-1.619407, -1.099959, -3.804938, 1, 1, 1, 1, 1,
-1.591606, 0.4381542, -2.682943, 1, 1, 1, 1, 1,
-1.577811, 0.4353872, -2.868456, 1, 1, 1, 1, 1,
-1.564661, 0.3695949, -1.78494, 1, 1, 1, 1, 1,
-1.558956, -1.709643, -4.177717, 1, 1, 1, 1, 1,
-1.546558, -0.3585282, -2.7564, 0, 0, 1, 1, 1,
-1.541746, -1.816449, -4.399418, 1, 0, 0, 1, 1,
-1.538671, -1.462968, -3.749158, 1, 0, 0, 1, 1,
-1.513804, -0.1428955, -1.894562, 1, 0, 0, 1, 1,
-1.513427, 1.193237, 1.648743, 1, 0, 0, 1, 1,
-1.510352, 2.114467, 0.9600307, 1, 0, 0, 1, 1,
-1.509714, -0.20975, 0.2203051, 0, 0, 0, 1, 1,
-1.508116, -0.4542123, -0.6838077, 0, 0, 0, 1, 1,
-1.507275, 0.4379683, -0.2074844, 0, 0, 0, 1, 1,
-1.505284, -0.07307033, -0.8257309, 0, 0, 0, 1, 1,
-1.498582, -0.4507693, -1.310663, 0, 0, 0, 1, 1,
-1.496975, 1.482234, 1.603976, 0, 0, 0, 1, 1,
-1.491642, 0.3856185, -0.6576439, 0, 0, 0, 1, 1,
-1.488383, -0.7722444, -3.619611, 1, 1, 1, 1, 1,
-1.476233, 0.5462708, -2.697036, 1, 1, 1, 1, 1,
-1.474134, -1.00995, -1.662795, 1, 1, 1, 1, 1,
-1.460118, -0.534557, -2.829813, 1, 1, 1, 1, 1,
-1.457208, -0.661155, -1.960618, 1, 1, 1, 1, 1,
-1.452468, 0.5015765, -0.7867151, 1, 1, 1, 1, 1,
-1.440992, 1.639389, -1.000355, 1, 1, 1, 1, 1,
-1.431038, 0.5799652, -0.5000202, 1, 1, 1, 1, 1,
-1.429256, -0.8493143, -1.803143, 1, 1, 1, 1, 1,
-1.425448, -0.9002885, -2.435038, 1, 1, 1, 1, 1,
-1.425381, -0.497886, -0.7980751, 1, 1, 1, 1, 1,
-1.424018, -0.955513, 0.9147376, 1, 1, 1, 1, 1,
-1.422954, 1.067554, -0.4602279, 1, 1, 1, 1, 1,
-1.421173, 0.9681161, -1.185349, 1, 1, 1, 1, 1,
-1.417904, 0.08275989, -2.518812, 1, 1, 1, 1, 1,
-1.404486, -1.033679, -1.240396, 0, 0, 1, 1, 1,
-1.403385, -0.1928153, -1.479841, 1, 0, 0, 1, 1,
-1.400723, 0.4561275, -1.008629, 1, 0, 0, 1, 1,
-1.391781, 1.434187, 0.0235761, 1, 0, 0, 1, 1,
-1.381383, 0.08534298, -0.3562033, 1, 0, 0, 1, 1,
-1.373043, 0.3250195, -1.300078, 1, 0, 0, 1, 1,
-1.356434, -0.9647859, -2.836994, 0, 0, 0, 1, 1,
-1.353149, 0.1236754, -2.896441, 0, 0, 0, 1, 1,
-1.351737, 1.632323, -0.902548, 0, 0, 0, 1, 1,
-1.339815, 0.1502297, -1.899831, 0, 0, 0, 1, 1,
-1.339718, -1.003488, -2.9342, 0, 0, 0, 1, 1,
-1.334953, -1.87906, -2.768882, 0, 0, 0, 1, 1,
-1.327818, -0.6414332, -1.067594, 0, 0, 0, 1, 1,
-1.323848, 0.5232647, -1.896757, 1, 1, 1, 1, 1,
-1.321069, -1.467982, -0.8411622, 1, 1, 1, 1, 1,
-1.312377, -1.81664, -3.134145, 1, 1, 1, 1, 1,
-1.311521, 0.7499366, -2.669955, 1, 1, 1, 1, 1,
-1.309353, -1.29919, -2.154613, 1, 1, 1, 1, 1,
-1.301679, 0.1111439, -0.3672962, 1, 1, 1, 1, 1,
-1.296416, 0.3732881, -0.3368289, 1, 1, 1, 1, 1,
-1.28888, 1.430713, 0.1442663, 1, 1, 1, 1, 1,
-1.27757, -0.1375227, -2.458048, 1, 1, 1, 1, 1,
-1.276078, 1.67716, -0.769568, 1, 1, 1, 1, 1,
-1.269501, -1.221037, -4.245329, 1, 1, 1, 1, 1,
-1.250445, 0.3919307, 0.5962394, 1, 1, 1, 1, 1,
-1.238207, 0.05003009, -2.262398, 1, 1, 1, 1, 1,
-1.236452, 1.023575, 0.429812, 1, 1, 1, 1, 1,
-1.235013, -0.2204891, -1.19355, 1, 1, 1, 1, 1,
-1.22983, 1.269005, 0.5163932, 0, 0, 1, 1, 1,
-1.228637, -2.150444, -2.758431, 1, 0, 0, 1, 1,
-1.220517, -0.8647099, -1.87969, 1, 0, 0, 1, 1,
-1.216452, -0.8593761, -1.527495, 1, 0, 0, 1, 1,
-1.215151, -1.650783, -3.086715, 1, 0, 0, 1, 1,
-1.20357, 0.9678665, 0.2572565, 1, 0, 0, 1, 1,
-1.203207, 0.7316223, -1.663647, 0, 0, 0, 1, 1,
-1.200438, -0.8247511, -3.268864, 0, 0, 0, 1, 1,
-1.189794, -0.5035471, -2.886987, 0, 0, 0, 1, 1,
-1.185169, -1.903425, -2.533328, 0, 0, 0, 1, 1,
-1.184379, 0.7948593, 1.061435, 0, 0, 0, 1, 1,
-1.18232, -1.834483, -4.097112, 0, 0, 0, 1, 1,
-1.173896, -0.4152617, -1.218988, 0, 0, 0, 1, 1,
-1.172169, 0.2513595, -1.029526, 1, 1, 1, 1, 1,
-1.169184, 0.3863807, -0.5690448, 1, 1, 1, 1, 1,
-1.168987, -0.6726933, -1.055886, 1, 1, 1, 1, 1,
-1.163387, -0.3496028, 0.3299503, 1, 1, 1, 1, 1,
-1.160833, -0.4272648, -1.526979, 1, 1, 1, 1, 1,
-1.157534, 2.20366, -0.6383109, 1, 1, 1, 1, 1,
-1.157422, 1.065936, -1.143974, 1, 1, 1, 1, 1,
-1.154119, 1.34626, -0.1537309, 1, 1, 1, 1, 1,
-1.152971, 0.4276159, -2.554741, 1, 1, 1, 1, 1,
-1.147599, -0.7181848, -1.808498, 1, 1, 1, 1, 1,
-1.144487, -1.092689, -2.682086, 1, 1, 1, 1, 1,
-1.137717, 0.3454849, -0.09908707, 1, 1, 1, 1, 1,
-1.135123, 0.9046235, 0.4560881, 1, 1, 1, 1, 1,
-1.134762, 2.434037, 0.8615332, 1, 1, 1, 1, 1,
-1.131867, 0.2186041, -1.097617, 1, 1, 1, 1, 1,
-1.127143, -0.4816995, -1.462421, 0, 0, 1, 1, 1,
-1.126554, 0.1270338, -0.9984435, 1, 0, 0, 1, 1,
-1.114345, -0.2547822, -1.402364, 1, 0, 0, 1, 1,
-1.09608, -0.7585399, -1.21162, 1, 0, 0, 1, 1,
-1.093035, 0.6076995, -1.78245, 1, 0, 0, 1, 1,
-1.085593, -0.01150136, -0.5102549, 1, 0, 0, 1, 1,
-1.070705, 1.291192, 0.2901114, 0, 0, 0, 1, 1,
-1.070102, 0.2952117, -0.6853378, 0, 0, 0, 1, 1,
-1.067951, 2.355074, -0.1861119, 0, 0, 0, 1, 1,
-1.064702, -0.5640787, -3.092963, 0, 0, 0, 1, 1,
-1.062138, 1.641353, 0.004733936, 0, 0, 0, 1, 1,
-1.057523, 0.4386678, -0.7931232, 0, 0, 0, 1, 1,
-1.050629, -0.3901405, -1.735019, 0, 0, 0, 1, 1,
-1.044266, -0.8762062, -2.189705, 1, 1, 1, 1, 1,
-1.040897, -0.6384916, -2.871379, 1, 1, 1, 1, 1,
-1.037269, 0.6658874, -0.7687802, 1, 1, 1, 1, 1,
-1.033246, -0.1469141, -3.174841, 1, 1, 1, 1, 1,
-1.032229, 0.5962376, -0.08042634, 1, 1, 1, 1, 1,
-1.031328, -1.05343, -3.385367, 1, 1, 1, 1, 1,
-1.024498, 1.358723, 0.8168254, 1, 1, 1, 1, 1,
-1.024009, -0.6878558, -1.083009, 1, 1, 1, 1, 1,
-1.016786, -0.1329717, -2.355212, 1, 1, 1, 1, 1,
-1.008215, 0.1589766, -3.356252, 1, 1, 1, 1, 1,
-1.002374, -0.3639112, -1.997004, 1, 1, 1, 1, 1,
-0.9960917, 0.8413434, -0.7493922, 1, 1, 1, 1, 1,
-0.9955962, -0.3803624, -1.404522, 1, 1, 1, 1, 1,
-0.9938197, -1.102637, -2.785768, 1, 1, 1, 1, 1,
-0.9783897, 1.311226, -1.3662, 1, 1, 1, 1, 1,
-0.9772161, 0.6569434, -0.6910256, 0, 0, 1, 1, 1,
-0.9729791, -0.3137688, -2.574688, 1, 0, 0, 1, 1,
-0.9609327, -0.9444233, -2.961941, 1, 0, 0, 1, 1,
-0.9550785, 1.308946, -1.228774, 1, 0, 0, 1, 1,
-0.9544798, -1.176437, -3.434501, 1, 0, 0, 1, 1,
-0.9478685, 0.0696166, -1.091841, 1, 0, 0, 1, 1,
-0.9464007, -1.22073, -0.9539568, 0, 0, 0, 1, 1,
-0.9452645, 0.5773472, -0.2942609, 0, 0, 0, 1, 1,
-0.9449087, 0.4537635, -2.015714, 0, 0, 0, 1, 1,
-0.9434645, 1.012624, -0.8369797, 0, 0, 0, 1, 1,
-0.9424905, 0.5104796, -1.121618, 0, 0, 0, 1, 1,
-0.9395198, 0.05196055, -1.928763, 0, 0, 0, 1, 1,
-0.9385718, 0.2073727, -1.032365, 0, 0, 0, 1, 1,
-0.935249, 1.883576, -1.97019, 1, 1, 1, 1, 1,
-0.9305022, -0.7175708, -2.68686, 1, 1, 1, 1, 1,
-0.9245956, 1.015935, -0.3908191, 1, 1, 1, 1, 1,
-0.9237427, 0.5505159, -1.304515, 1, 1, 1, 1, 1,
-0.9226545, -0.1054739, -0.9020091, 1, 1, 1, 1, 1,
-0.920403, -1.887369, -3.267213, 1, 1, 1, 1, 1,
-0.9190655, -0.8600537, -1.529417, 1, 1, 1, 1, 1,
-0.9151617, -0.06230016, -2.967191, 1, 1, 1, 1, 1,
-0.9131961, 0.6393403, -1.212033, 1, 1, 1, 1, 1,
-0.9122024, 1.123215, -1.783823, 1, 1, 1, 1, 1,
-0.9119017, -0.6654699, -1.489874, 1, 1, 1, 1, 1,
-0.9106827, -0.2709364, -1.860318, 1, 1, 1, 1, 1,
-0.9065121, -2.152843, -3.305951, 1, 1, 1, 1, 1,
-0.9064205, -0.6108292, 0.1722652, 1, 1, 1, 1, 1,
-0.9050451, -0.03283799, -0.3982129, 1, 1, 1, 1, 1,
-0.899431, 0.359914, -1.606841, 0, 0, 1, 1, 1,
-0.8934188, 0.948073, 1.360345, 1, 0, 0, 1, 1,
-0.8832031, 1.314476, -1.503517, 1, 0, 0, 1, 1,
-0.8817485, 0.7602358, -1.07216, 1, 0, 0, 1, 1,
-0.8797734, 0.4592835, -1.233812, 1, 0, 0, 1, 1,
-0.879392, -0.8071299, -0.4917237, 1, 0, 0, 1, 1,
-0.8769619, -1.479723, -2.042617, 0, 0, 0, 1, 1,
-0.8757054, 1.095345, -1.306149, 0, 0, 0, 1, 1,
-0.8740772, 3.030156, -0.2069468, 0, 0, 0, 1, 1,
-0.8641452, 0.0759787, -0.3341792, 0, 0, 0, 1, 1,
-0.8568123, -0.2353659, -2.469219, 0, 0, 0, 1, 1,
-0.8539305, -1.073135, -1.800825, 0, 0, 0, 1, 1,
-0.8488059, 1.063304, -1.480362, 0, 0, 0, 1, 1,
-0.8464336, -0.5709904, -2.960589, 1, 1, 1, 1, 1,
-0.8379984, -1.587024, -2.809603, 1, 1, 1, 1, 1,
-0.8375815, -0.5568424, -1.433907, 1, 1, 1, 1, 1,
-0.8332961, 1.117953, -0.578249, 1, 1, 1, 1, 1,
-0.8328704, 0.7749953, -1.118581, 1, 1, 1, 1, 1,
-0.8307027, -3.434853, -5.221025, 1, 1, 1, 1, 1,
-0.8176926, -0.5145684, -0.7363901, 1, 1, 1, 1, 1,
-0.8125263, -1.246034, -2.306465, 1, 1, 1, 1, 1,
-0.8113241, -1.028559, -1.798972, 1, 1, 1, 1, 1,
-0.8084518, -0.1975983, -2.185469, 1, 1, 1, 1, 1,
-0.8072206, -0.5605901, -0.3458507, 1, 1, 1, 1, 1,
-0.805079, -1.436301, -0.807624, 1, 1, 1, 1, 1,
-0.7957486, -0.06373654, -2.611116, 1, 1, 1, 1, 1,
-0.7884498, -0.907443, -1.677674, 1, 1, 1, 1, 1,
-0.7850257, 0.2212144, -1.949505, 1, 1, 1, 1, 1,
-0.7773913, -0.5939971, -2.782325, 0, 0, 1, 1, 1,
-0.7767735, -1.262962, -4.024035, 1, 0, 0, 1, 1,
-0.76801, -1.378558, -1.599239, 1, 0, 0, 1, 1,
-0.758462, -0.7224728, -3.871518, 1, 0, 0, 1, 1,
-0.7568212, -0.5414999, -2.224812, 1, 0, 0, 1, 1,
-0.7466902, 0.702873, -2.27276, 1, 0, 0, 1, 1,
-0.7428278, -0.9812748, -2.813222, 0, 0, 0, 1, 1,
-0.7424719, -0.5225363, -0.6517133, 0, 0, 0, 1, 1,
-0.7402957, -0.06851389, -4.077576, 0, 0, 0, 1, 1,
-0.7328673, -0.872679, -4.719813, 0, 0, 0, 1, 1,
-0.7258145, -0.8142121, -1.349232, 0, 0, 0, 1, 1,
-0.7243911, -0.2435261, -1.462329, 0, 0, 0, 1, 1,
-0.7210818, -0.4202442, -2.912776, 0, 0, 0, 1, 1,
-0.7177109, -0.9830806, -1.232334, 1, 1, 1, 1, 1,
-0.7171266, 0.5046451, 0.2894934, 1, 1, 1, 1, 1,
-0.7167339, 0.9511642, -0.4644624, 1, 1, 1, 1, 1,
-0.7076312, -0.4737666, -2.990677, 1, 1, 1, 1, 1,
-0.7069528, 0.02577534, -1.283709, 1, 1, 1, 1, 1,
-0.6995199, -2.023732, -3.168726, 1, 1, 1, 1, 1,
-0.699083, -0.749038, -3.612716, 1, 1, 1, 1, 1,
-0.6986518, 0.5847403, -1.087244, 1, 1, 1, 1, 1,
-0.6977388, -0.01929062, -1.851843, 1, 1, 1, 1, 1,
-0.6958203, -0.6794043, -0.8547214, 1, 1, 1, 1, 1,
-0.6906033, 0.5069197, 0.5106763, 1, 1, 1, 1, 1,
-0.6890097, 0.2379546, 0.2573553, 1, 1, 1, 1, 1,
-0.6861616, -1.217473, -1.026429, 1, 1, 1, 1, 1,
-0.685761, 0.04026858, -2.371482, 1, 1, 1, 1, 1,
-0.6857423, -0.7407655, -1.321274, 1, 1, 1, 1, 1,
-0.6837534, 1.173827, 0.08938223, 0, 0, 1, 1, 1,
-0.6784862, 0.8502753, -1.380448, 1, 0, 0, 1, 1,
-0.673265, -1.459747, -3.44775, 1, 0, 0, 1, 1,
-0.6731024, 0.07705632, -2.021924, 1, 0, 0, 1, 1,
-0.6641963, -0.7697896, -1.273809, 1, 0, 0, 1, 1,
-0.664021, 0.1020342, -0.5834357, 1, 0, 0, 1, 1,
-0.6589219, 1.271938, 0.04663167, 0, 0, 0, 1, 1,
-0.654134, 0.382643, -1.336304, 0, 0, 0, 1, 1,
-0.653761, -0.5781125, -1.400522, 0, 0, 0, 1, 1,
-0.6526974, -0.8822116, -0.7227452, 0, 0, 0, 1, 1,
-0.6387908, 2.022765, 0.6406416, 0, 0, 0, 1, 1,
-0.6325474, -0.7598794, -1.768525, 0, 0, 0, 1, 1,
-0.6283724, 0.4214894, -0.4464108, 0, 0, 0, 1, 1,
-0.6263441, -1.390658, -4.245443, 1, 1, 1, 1, 1,
-0.6216739, 0.7301839, -1.118354, 1, 1, 1, 1, 1,
-0.6140521, 0.5274912, -0.5771743, 1, 1, 1, 1, 1,
-0.6076695, -0.4212765, -3.370606, 1, 1, 1, 1, 1,
-0.6060632, -1.16987, -3.643259, 1, 1, 1, 1, 1,
-0.6019769, 1.744676, -1.146548, 1, 1, 1, 1, 1,
-0.6010507, 2.629353, 1.04779, 1, 1, 1, 1, 1,
-0.59801, -0.1541621, -0.9850715, 1, 1, 1, 1, 1,
-0.5950518, -1.059423, -2.404341, 1, 1, 1, 1, 1,
-0.5877689, -1.102947, -4.722437, 1, 1, 1, 1, 1,
-0.585437, -0.5240427, -2.925853, 1, 1, 1, 1, 1,
-0.5806204, 0.333405, 0.2793948, 1, 1, 1, 1, 1,
-0.5777392, -2.329553, -3.350837, 1, 1, 1, 1, 1,
-0.5769488, -0.9459397, -2.899516, 1, 1, 1, 1, 1,
-0.5765879, 0.7002957, 0.7325547, 1, 1, 1, 1, 1,
-0.5753378, -1.399624, -3.422969, 0, 0, 1, 1, 1,
-0.5729986, 1.227239, 1.254836, 1, 0, 0, 1, 1,
-0.569156, -0.6982805, -1.002002, 1, 0, 0, 1, 1,
-0.5601289, 0.2976422, -1.453604, 1, 0, 0, 1, 1,
-0.5557314, 1.274097, -1.986782, 1, 0, 0, 1, 1,
-0.5456157, 0.1101986, -0.2629663, 1, 0, 0, 1, 1,
-0.5453137, 1.029441, -0.6463339, 0, 0, 0, 1, 1,
-0.5403451, -0.1053, -1.829705, 0, 0, 0, 1, 1,
-0.5362486, 0.08328421, -0.7440743, 0, 0, 0, 1, 1,
-0.5357495, -0.5536447, -3.107083, 0, 0, 0, 1, 1,
-0.5305693, -0.8479113, -2.249143, 0, 0, 0, 1, 1,
-0.5282062, 0.6211847, -1.380145, 0, 0, 0, 1, 1,
-0.5272034, -0.2425664, -1.777332, 0, 0, 0, 1, 1,
-0.5268112, -1.00564, -2.923979, 1, 1, 1, 1, 1,
-0.5201236, -3.000632, -2.25237, 1, 1, 1, 1, 1,
-0.5170186, 0.9893728, -0.8695353, 1, 1, 1, 1, 1,
-0.5158315, -2.566256, -1.697582, 1, 1, 1, 1, 1,
-0.5157155, 0.4677733, -1.781184, 1, 1, 1, 1, 1,
-0.5075614, -1.124872, -3.546105, 1, 1, 1, 1, 1,
-0.5067928, -0.2902671, -0.2352865, 1, 1, 1, 1, 1,
-0.5064276, 0.8480489, 0.1698671, 1, 1, 1, 1, 1,
-0.5026594, -0.4874939, -3.1389, 1, 1, 1, 1, 1,
-0.4996473, -1.056035, -2.042673, 1, 1, 1, 1, 1,
-0.4988049, -0.96913, -2.441597, 1, 1, 1, 1, 1,
-0.4936383, -0.03424661, -0.8835001, 1, 1, 1, 1, 1,
-0.4872125, 1.233494, -1.121122, 1, 1, 1, 1, 1,
-0.4845302, -1.017554, -1.723863, 1, 1, 1, 1, 1,
-0.4814877, 0.07721895, -0.3467109, 1, 1, 1, 1, 1,
-0.4807287, -0.02364911, -1.438416, 0, 0, 1, 1, 1,
-0.4790137, -0.5264784, -1.841775, 1, 0, 0, 1, 1,
-0.4764107, 0.6763182, 0.7942251, 1, 0, 0, 1, 1,
-0.4670431, -0.1259145, -2.679454, 1, 0, 0, 1, 1,
-0.4645099, -0.7859049, -3.177636, 1, 0, 0, 1, 1,
-0.4626197, -0.2681581, -2.166013, 1, 0, 0, 1, 1,
-0.4513705, 1.471315, -1.39884, 0, 0, 0, 1, 1,
-0.4498532, -0.5942835, -2.392253, 0, 0, 0, 1, 1,
-0.4490108, 0.4563091, 1.203187, 0, 0, 0, 1, 1,
-0.4489222, -2.685318, -1.737829, 0, 0, 0, 1, 1,
-0.4438776, 1.247213, -1.305821, 0, 0, 0, 1, 1,
-0.4411502, 1.068801, 0.1723006, 0, 0, 0, 1, 1,
-0.4329956, -0.7446348, -1.413493, 0, 0, 0, 1, 1,
-0.4318933, -1.307635, -2.996649, 1, 1, 1, 1, 1,
-0.4242783, 0.5169041, 0.009659151, 1, 1, 1, 1, 1,
-0.4219781, -0.81488, -0.250493, 1, 1, 1, 1, 1,
-0.4214027, -0.8004311, -2.929075, 1, 1, 1, 1, 1,
-0.420072, 0.2907186, -1.732946, 1, 1, 1, 1, 1,
-0.4181039, -0.3706844, -3.92917, 1, 1, 1, 1, 1,
-0.4168641, 1.737976, -0.9594222, 1, 1, 1, 1, 1,
-0.4164124, -0.4214449, -4.777758, 1, 1, 1, 1, 1,
-0.4161286, -0.8569391, -1.97119, 1, 1, 1, 1, 1,
-0.4160814, -0.5770084, -0.8008386, 1, 1, 1, 1, 1,
-0.410183, 0.7062653, -1.800085, 1, 1, 1, 1, 1,
-0.4096314, -1.383169, -1.872758, 1, 1, 1, 1, 1,
-0.4027365, -1.085816, -2.866936, 1, 1, 1, 1, 1,
-0.4022646, -0.1364969, -1.062284, 1, 1, 1, 1, 1,
-0.4008214, -0.8928162, -2.788897, 1, 1, 1, 1, 1,
-0.400384, -2.000805, -4.35394, 0, 0, 1, 1, 1,
-0.3991912, 0.1923764, 0.6510078, 1, 0, 0, 1, 1,
-0.3963999, 0.6360321, -1.501672, 1, 0, 0, 1, 1,
-0.3951367, 0.715457, -0.05391371, 1, 0, 0, 1, 1,
-0.3943432, 0.5103527, 0.1001774, 1, 0, 0, 1, 1,
-0.3932447, -1.389177, -2.217569, 1, 0, 0, 1, 1,
-0.3833218, -1.418964, -3.677575, 0, 0, 0, 1, 1,
-0.3825095, 0.1026909, -1.961202, 0, 0, 0, 1, 1,
-0.377102, -1.59188, -2.394366, 0, 0, 0, 1, 1,
-0.3765592, -1.377033, -3.188527, 0, 0, 0, 1, 1,
-0.3711358, 1.47088, -2.865277, 0, 0, 0, 1, 1,
-0.3706066, -1.470167, -2.059475, 0, 0, 0, 1, 1,
-0.3695551, 1.220716, 1.516932, 0, 0, 0, 1, 1,
-0.3686129, -1.087645, -2.11233, 1, 1, 1, 1, 1,
-0.3684892, 0.4938029, -1.527115, 1, 1, 1, 1, 1,
-0.3667584, -1.044877, -5.229996, 1, 1, 1, 1, 1,
-0.3656095, -0.2076548, -2.778415, 1, 1, 1, 1, 1,
-0.3654102, -0.9771305, -2.205987, 1, 1, 1, 1, 1,
-0.3639976, -0.224652, -1.410158, 1, 1, 1, 1, 1,
-0.3608204, -0.2306471, -2.148005, 1, 1, 1, 1, 1,
-0.3594151, 0.4812099, -1.064146, 1, 1, 1, 1, 1,
-0.3567272, 0.01807404, -0.9187969, 1, 1, 1, 1, 1,
-0.3494277, 1.480282, 0.08131557, 1, 1, 1, 1, 1,
-0.3483158, 2.334752, -1.830799, 1, 1, 1, 1, 1,
-0.3482422, -1.156117, -3.871544, 1, 1, 1, 1, 1,
-0.3448518, -1.742903, -1.008019, 1, 1, 1, 1, 1,
-0.3429738, 0.07261617, -0.6024674, 1, 1, 1, 1, 1,
-0.331113, -0.6084265, -2.61528, 1, 1, 1, 1, 1,
-0.3282539, -0.4181722, -3.176373, 0, 0, 1, 1, 1,
-0.3278366, -1.214866, -3.24095, 1, 0, 0, 1, 1,
-0.3228399, -1.222797, -1.752006, 1, 0, 0, 1, 1,
-0.3214209, -0.1780716, -1.514256, 1, 0, 0, 1, 1,
-0.3211556, 0.2992178, -0.2175072, 1, 0, 0, 1, 1,
-0.3211065, 1.059662, -0.3571015, 1, 0, 0, 1, 1,
-0.3191772, -0.3245384, -2.37309, 0, 0, 0, 1, 1,
-0.3163378, 1.017233, 0.04630012, 0, 0, 0, 1, 1,
-0.3100493, -0.4017538, -0.779812, 0, 0, 0, 1, 1,
-0.305753, -0.2149557, -1.575029, 0, 0, 0, 1, 1,
-0.3013883, -1.329146, -2.839188, 0, 0, 0, 1, 1,
-0.2992542, -0.06325155, -0.2810849, 0, 0, 0, 1, 1,
-0.2979815, -1.875555, -3.02509, 0, 0, 0, 1, 1,
-0.294503, -0.6915845, -3.265564, 1, 1, 1, 1, 1,
-0.292238, 0.1474039, -1.170808, 1, 1, 1, 1, 1,
-0.2890888, -0.4289671, -4.509101, 1, 1, 1, 1, 1,
-0.2869435, -0.5738668, -3.328631, 1, 1, 1, 1, 1,
-0.2811795, 0.4140568, -2.589587, 1, 1, 1, 1, 1,
-0.2782854, -0.2798153, -2.402677, 1, 1, 1, 1, 1,
-0.2771768, 1.246135, -1.173313, 1, 1, 1, 1, 1,
-0.2651705, 0.1770582, 0.5241043, 1, 1, 1, 1, 1,
-0.2619439, -1.047882, -2.307214, 1, 1, 1, 1, 1,
-0.2541887, -1.641478, -3.39211, 1, 1, 1, 1, 1,
-0.2463181, 0.2975056, -2.416629, 1, 1, 1, 1, 1,
-0.244764, -0.2785875, -2.917017, 1, 1, 1, 1, 1,
-0.2439571, -0.1625008, -2.372471, 1, 1, 1, 1, 1,
-0.2418917, 0.8966348, -1.82896, 1, 1, 1, 1, 1,
-0.241825, -0.4955362, -2.622531, 1, 1, 1, 1, 1,
-0.2405299, 1.250673, 1.293074, 0, 0, 1, 1, 1,
-0.2393153, 0.5805047, 0.006608807, 1, 0, 0, 1, 1,
-0.2386885, 0.4148923, -2.394686, 1, 0, 0, 1, 1,
-0.2374123, 0.03440309, -0.567229, 1, 0, 0, 1, 1,
-0.2356771, 0.1200663, -2.08191, 1, 0, 0, 1, 1,
-0.2345274, -0.3350324, -3.64819, 1, 0, 0, 1, 1,
-0.2335583, -0.347061, -2.466969, 0, 0, 0, 1, 1,
-0.2318176, -1.274271, -1.195994, 0, 0, 0, 1, 1,
-0.2310192, -2.241476, -3.046169, 0, 0, 0, 1, 1,
-0.2291859, 0.5281615, 0.08816387, 0, 0, 0, 1, 1,
-0.2250618, -1.440423, -1.324087, 0, 0, 0, 1, 1,
-0.2202083, 0.3134738, 0.02734757, 0, 0, 0, 1, 1,
-0.2198808, -0.04467397, -3.150069, 0, 0, 0, 1, 1,
-0.2194482, -1.493396, -3.802972, 1, 1, 1, 1, 1,
-0.2191022, 0.7440922, 0.9437485, 1, 1, 1, 1, 1,
-0.2172754, -1.084732, -2.40654, 1, 1, 1, 1, 1,
-0.2149329, -0.8605914, -3.359941, 1, 1, 1, 1, 1,
-0.2125741, -0.4718366, -3.005059, 1, 1, 1, 1, 1,
-0.2092891, -0.417035, -2.514868, 1, 1, 1, 1, 1,
-0.207943, 0.5291683, 0.09916672, 1, 1, 1, 1, 1,
-0.2055212, 0.4193068, -0.09081934, 1, 1, 1, 1, 1,
-0.20463, 0.5490175, 0.09939485, 1, 1, 1, 1, 1,
-0.1933754, -0.6928024, -1.940731, 1, 1, 1, 1, 1,
-0.191078, -0.1576674, -2.581206, 1, 1, 1, 1, 1,
-0.1881791, 2.338961, 0.01933475, 1, 1, 1, 1, 1,
-0.186739, -1.429255, -4.928537, 1, 1, 1, 1, 1,
-0.1863688, 0.5168527, 0.1550506, 1, 1, 1, 1, 1,
-0.1855131, -0.7042041, -4.703239, 1, 1, 1, 1, 1,
-0.1823225, -1.644077, -2.937686, 0, 0, 1, 1, 1,
-0.1809597, -1.018881, -2.598041, 1, 0, 0, 1, 1,
-0.1796263, -0.1439921, -0.8140785, 1, 0, 0, 1, 1,
-0.1781513, -0.1896707, -1.753256, 1, 0, 0, 1, 1,
-0.1780067, -1.21524, -3.053365, 1, 0, 0, 1, 1,
-0.1765409, 0.01005311, -0.571385, 1, 0, 0, 1, 1,
-0.1724511, 0.7508375, -1.798918, 0, 0, 0, 1, 1,
-0.1714943, 1.428512, -0.6871199, 0, 0, 0, 1, 1,
-0.169851, -0.2319754, -3.449852, 0, 0, 0, 1, 1,
-0.1664904, 0.4362535, -0.01539391, 0, 0, 0, 1, 1,
-0.1645894, 0.03197733, -1.452391, 0, 0, 0, 1, 1,
-0.1623771, 1.795852, -0.7037154, 0, 0, 0, 1, 1,
-0.1591404, -0.2279063, -2.503067, 0, 0, 0, 1, 1,
-0.1571791, -0.09480216, -1.190226, 1, 1, 1, 1, 1,
-0.1567936, -0.1207922, -2.630154, 1, 1, 1, 1, 1,
-0.1536864, 0.7630768, 0.1149182, 1, 1, 1, 1, 1,
-0.1512656, -0.1402868, -4.726202, 1, 1, 1, 1, 1,
-0.1445051, 0.0982591, -0.9653265, 1, 1, 1, 1, 1,
-0.1410442, -0.5674249, -1.871095, 1, 1, 1, 1, 1,
-0.1396902, -0.9473583, -2.432725, 1, 1, 1, 1, 1,
-0.1379204, -0.2628983, -2.226711, 1, 1, 1, 1, 1,
-0.1367172, -0.7053761, -2.985782, 1, 1, 1, 1, 1,
-0.1359557, 0.9014961, -0.03194567, 1, 1, 1, 1, 1,
-0.1345076, 0.401997, -0.4572147, 1, 1, 1, 1, 1,
-0.1344283, -1.851313, -4.689083, 1, 1, 1, 1, 1,
-0.1315771, -2.566925, -2.829929, 1, 1, 1, 1, 1,
-0.1308829, 0.3155476, -1.965709, 1, 1, 1, 1, 1,
-0.1270858, 1.117282, 0.9528884, 1, 1, 1, 1, 1,
-0.1254234, 1.698008, -0.1379246, 0, 0, 1, 1, 1,
-0.1245844, 0.4212478, -0.7037005, 1, 0, 0, 1, 1,
-0.1191273, -1.425798, -3.097711, 1, 0, 0, 1, 1,
-0.1170696, 0.1423761, -1.575487, 1, 0, 0, 1, 1,
-0.1170521, -0.7380889, -2.66639, 1, 0, 0, 1, 1,
-0.1161655, -2.740682, -5.171566, 1, 0, 0, 1, 1,
-0.1143953, -0.6001469, -2.790939, 0, 0, 0, 1, 1,
-0.1081006, 0.6613332, -1.469517, 0, 0, 0, 1, 1,
-0.1049389, 0.07504432, -1.66963, 0, 0, 0, 1, 1,
-0.1030402, 2.608163, -1.788856, 0, 0, 0, 1, 1,
-0.1013336, -0.9292511, -2.480682, 0, 0, 0, 1, 1,
-0.09571736, 0.486003, -0.466969, 0, 0, 0, 1, 1,
-0.0928551, 0.3965815, -1.364617, 0, 0, 0, 1, 1,
-0.09206932, 0.9421518, 1.69889, 1, 1, 1, 1, 1,
-0.0907302, 0.5534419, 0.3990096, 1, 1, 1, 1, 1,
-0.08456398, -0.0157926, -1.303742, 1, 1, 1, 1, 1,
-0.0831314, 0.1297635, 1.32431, 1, 1, 1, 1, 1,
-0.08005296, 0.5853985, 0.9622753, 1, 1, 1, 1, 1,
-0.07934069, 1.009302, 1.442657, 1, 1, 1, 1, 1,
-0.0777586, -0.4649797, -3.718954, 1, 1, 1, 1, 1,
-0.07703861, -0.3758162, -2.935798, 1, 1, 1, 1, 1,
-0.07673448, 1.213859, 0.2884353, 1, 1, 1, 1, 1,
-0.06738324, 1.582123, -1.077269, 1, 1, 1, 1, 1,
-0.06658004, -1.299557, -1.699643, 1, 1, 1, 1, 1,
-0.06533413, 0.1120744, 0.1764916, 1, 1, 1, 1, 1,
-0.06469788, 0.07254852, -0.6713678, 1, 1, 1, 1, 1,
-0.06153197, 1.100338, 0.4810932, 1, 1, 1, 1, 1,
-0.05996866, 0.3816789, -0.6926597, 1, 1, 1, 1, 1,
-0.058645, -1.228947, -2.606765, 0, 0, 1, 1, 1,
-0.05820999, -0.5819724, -4.012287, 1, 0, 0, 1, 1,
-0.0561242, 0.3359252, -0.5858362, 1, 0, 0, 1, 1,
-0.05281471, -0.05773458, -1.903887, 1, 0, 0, 1, 1,
-0.05263786, -1.405579, -3.25124, 1, 0, 0, 1, 1,
-0.05211969, -0.4793889, -3.496255, 1, 0, 0, 1, 1,
-0.05179064, 0.4613089, -1.423256, 0, 0, 0, 1, 1,
-0.05121414, -2.025175, -4.21976, 0, 0, 0, 1, 1,
-0.04515812, -1.480071, -2.137046, 0, 0, 0, 1, 1,
-0.04399274, -1.366031, -2.233112, 0, 0, 0, 1, 1,
-0.04296647, 0.5338706, 1.24519, 0, 0, 0, 1, 1,
-0.04247137, -2.368304, -2.118166, 0, 0, 0, 1, 1,
-0.03869872, 2.501143, -1.201331, 0, 0, 0, 1, 1,
-0.03323213, 0.6326616, -0.5101023, 1, 1, 1, 1, 1,
-0.03051577, 0.5814571, -0.07133786, 1, 1, 1, 1, 1,
-0.02899854, 0.1725436, -0.4602355, 1, 1, 1, 1, 1,
-0.02848472, -0.2224489, -1.826513, 1, 1, 1, 1, 1,
-0.02775, 0.15493, -1.165132, 1, 1, 1, 1, 1,
-0.02727493, 0.9670076, 0.7585787, 1, 1, 1, 1, 1,
-0.02674671, 0.925104, -0.4175322, 1, 1, 1, 1, 1,
-0.02557491, -0.6356929, -3.19814, 1, 1, 1, 1, 1,
-0.02432672, -1.689159, -3.558425, 1, 1, 1, 1, 1,
-0.01745101, 0.7693536, -0.4848063, 1, 1, 1, 1, 1,
-0.01333464, 0.4090588, 0.5227407, 1, 1, 1, 1, 1,
-0.01001819, -1.142887, -3.228243, 1, 1, 1, 1, 1,
-0.009767076, 1.55197, 0.7836378, 1, 1, 1, 1, 1,
-0.009737889, -0.01710693, -2.481889, 1, 1, 1, 1, 1,
-0.006310179, -0.3403795, -4.244061, 1, 1, 1, 1, 1,
-0.002097613, -1.236566, -2.889022, 0, 0, 1, 1, 1,
-0.001591858, -1.859567, -3.093389, 1, 0, 0, 1, 1,
0.007524736, -0.4883457, 2.994879, 1, 0, 0, 1, 1,
0.01068479, -0.5106499, 2.502023, 1, 0, 0, 1, 1,
0.01161635, -0.3559549, 2.496535, 1, 0, 0, 1, 1,
0.01255917, -0.1252283, 2.330541, 1, 0, 0, 1, 1,
0.01398636, 1.707968, -1.203663, 0, 0, 0, 1, 1,
0.01438408, -0.8877094, 3.141121, 0, 0, 0, 1, 1,
0.01483098, -0.8670291, 2.139475, 0, 0, 0, 1, 1,
0.01503124, 0.8565164, -0.7976775, 0, 0, 0, 1, 1,
0.01870345, -0.8231951, 2.454419, 0, 0, 0, 1, 1,
0.02010094, -1.190289, 2.257244, 0, 0, 0, 1, 1,
0.02414661, 0.3061577, -1.226426, 0, 0, 0, 1, 1,
0.03091585, 0.8143488, 0.4851635, 1, 1, 1, 1, 1,
0.03158814, -0.59545, 2.280101, 1, 1, 1, 1, 1,
0.03726712, -0.2061615, 2.804804, 1, 1, 1, 1, 1,
0.0414946, 1.211843, -0.9050059, 1, 1, 1, 1, 1,
0.04892225, 0.3199313, -1.09676, 1, 1, 1, 1, 1,
0.05090956, 0.1364681, 1.687505, 1, 1, 1, 1, 1,
0.05124221, -1.863786, 2.380792, 1, 1, 1, 1, 1,
0.05328663, -1.801685, 2.255634, 1, 1, 1, 1, 1,
0.05656506, -0.4261431, 3.106705, 1, 1, 1, 1, 1,
0.0614784, -0.2479031, 3.496756, 1, 1, 1, 1, 1,
0.06547572, -1.721923, 4.446436, 1, 1, 1, 1, 1,
0.06646436, -0.6853307, 4.837861, 1, 1, 1, 1, 1,
0.07008539, -0.9164136, 2.711383, 1, 1, 1, 1, 1,
0.07038668, -0.1543084, 3.900734, 1, 1, 1, 1, 1,
0.07652692, -1.714629, 2.92448, 1, 1, 1, 1, 1,
0.07709855, 0.5780264, -1.405536, 0, 0, 1, 1, 1,
0.0787487, 0.7174951, 1.263399, 1, 0, 0, 1, 1,
0.07939489, 0.8353488, 0.7749643, 1, 0, 0, 1, 1,
0.07999132, 0.2225343, 0.02279912, 1, 0, 0, 1, 1,
0.08137843, 2.768247, 0.2795824, 1, 0, 0, 1, 1,
0.08513451, -0.6294026, 2.182699, 1, 0, 0, 1, 1,
0.08885783, -0.8401428, 3.975325, 0, 0, 0, 1, 1,
0.09710091, 0.6600838, -0.2969141, 0, 0, 0, 1, 1,
0.09794702, 0.5563021, 2.177463, 0, 0, 0, 1, 1,
0.09825485, -0.1350407, 1.856319, 0, 0, 0, 1, 1,
0.09892351, -1.27654, 1.872671, 0, 0, 0, 1, 1,
0.106582, -0.560771, 3.896507, 0, 0, 0, 1, 1,
0.1088396, -0.713582, 4.507109, 0, 0, 0, 1, 1,
0.1128429, 0.7272196, -0.01467672, 1, 1, 1, 1, 1,
0.1131755, 0.7647222, -0.8066194, 1, 1, 1, 1, 1,
0.1159865, 0.3627034, 0.9988549, 1, 1, 1, 1, 1,
0.1227802, 1.015737, 0.1795018, 1, 1, 1, 1, 1,
0.1265626, 0.3317733, -0.2112739, 1, 1, 1, 1, 1,
0.1306616, -0.7445105, 2.039648, 1, 1, 1, 1, 1,
0.1324522, 0.2640517, -1.051299, 1, 1, 1, 1, 1,
0.1327015, -1.721334, 5.489391, 1, 1, 1, 1, 1,
0.1329401, 1.851338, -0.5464623, 1, 1, 1, 1, 1,
0.1419649, -2.036133, 2.972128, 1, 1, 1, 1, 1,
0.14437, -1.45727, 4.611322, 1, 1, 1, 1, 1,
0.1477134, -0.7212425, 3.165674, 1, 1, 1, 1, 1,
0.1484992, -1.124104, 2.65253, 1, 1, 1, 1, 1,
0.1511823, -1.136512, 3.088224, 1, 1, 1, 1, 1,
0.153294, 0.008821708, 1.327289, 1, 1, 1, 1, 1,
0.1534259, 1.567842, 0.9144732, 0, 0, 1, 1, 1,
0.1589838, -2.410948, 1.353967, 1, 0, 0, 1, 1,
0.1605714, -0.9041319, 3.190177, 1, 0, 0, 1, 1,
0.1610835, -0.6350436, 3.653291, 1, 0, 0, 1, 1,
0.1643056, -0.1012334, 1.623949, 1, 0, 0, 1, 1,
0.1644605, 1.251804, -0.2270769, 1, 0, 0, 1, 1,
0.1652995, -1.474144, 4.3391, 0, 0, 0, 1, 1,
0.169534, 0.794864, -1.12415, 0, 0, 0, 1, 1,
0.1697844, 0.05677795, 2.009377, 0, 0, 0, 1, 1,
0.1724973, -1.14074, 3.020746, 0, 0, 0, 1, 1,
0.1804155, 2.229208, -0.6513801, 0, 0, 0, 1, 1,
0.1816778, -0.7409352, 1.553236, 0, 0, 0, 1, 1,
0.1897996, 2.343378, 0.8267874, 0, 0, 0, 1, 1,
0.1945842, -1.195931, 2.883189, 1, 1, 1, 1, 1,
0.1953162, -0.8814709, 1.993247, 1, 1, 1, 1, 1,
0.2001215, 0.397603, 1.11296, 1, 1, 1, 1, 1,
0.2045282, 0.5459571, 0.2832118, 1, 1, 1, 1, 1,
0.2064112, 1.006238, 0.7845161, 1, 1, 1, 1, 1,
0.2064953, 0.8851382, -1.356972, 1, 1, 1, 1, 1,
0.2071896, -0.9955711, 1.816205, 1, 1, 1, 1, 1,
0.211568, 2.478798, -0.2264672, 1, 1, 1, 1, 1,
0.2121152, 0.000515365, 1.855201, 1, 1, 1, 1, 1,
0.212883, -0.9836103, 2.761943, 1, 1, 1, 1, 1,
0.2145963, 1.711312, 0.4988332, 1, 1, 1, 1, 1,
0.2168316, 1.249529, 0.2835442, 1, 1, 1, 1, 1,
0.2172848, -1.082074, 3.572626, 1, 1, 1, 1, 1,
0.2182157, 0.8739956, 1.706089, 1, 1, 1, 1, 1,
0.2214275, -1.015409, 3.119931, 1, 1, 1, 1, 1,
0.2217462, -0.1845409, 1.178917, 0, 0, 1, 1, 1,
0.2240789, 0.5274863, 0.0870148, 1, 0, 0, 1, 1,
0.2255146, -2.049113, 2.146486, 1, 0, 0, 1, 1,
0.2260096, -0.2037915, 1.255419, 1, 0, 0, 1, 1,
0.2288827, -2.044054, 3.263431, 1, 0, 0, 1, 1,
0.2319637, -0.6157278, 2.53063, 1, 0, 0, 1, 1,
0.2321067, 0.1350863, 2.049985, 0, 0, 0, 1, 1,
0.2355809, -0.8769721, 2.480497, 0, 0, 0, 1, 1,
0.2387894, -1.140967, 1.920841, 0, 0, 0, 1, 1,
0.2402516, 1.917773, -1.240051, 0, 0, 0, 1, 1,
0.2415572, 0.5399342, -1.338882, 0, 0, 0, 1, 1,
0.2420711, 0.1361746, 1.283241, 0, 0, 0, 1, 1,
0.2555267, 0.5311039, -1.523697, 0, 0, 0, 1, 1,
0.2570775, -2.241957, 2.769184, 1, 1, 1, 1, 1,
0.2574541, 0.01806719, 1.503046, 1, 1, 1, 1, 1,
0.2606484, 1.550494, 0.9681627, 1, 1, 1, 1, 1,
0.2621952, -1.062855, 3.560779, 1, 1, 1, 1, 1,
0.2645215, 0.363286, 1.597119, 1, 1, 1, 1, 1,
0.266773, -1.012219, 3.527841, 1, 1, 1, 1, 1,
0.2676292, -0.3775409, 2.427695, 1, 1, 1, 1, 1,
0.2768077, -0.1193878, 2.559725, 1, 1, 1, 1, 1,
0.281941, 0.406876, 0.3243163, 1, 1, 1, 1, 1,
0.2826696, -0.2314706, 1.527932, 1, 1, 1, 1, 1,
0.2879359, 1.159107, 1.541839, 1, 1, 1, 1, 1,
0.2891731, 0.4383645, 0.9916139, 1, 1, 1, 1, 1,
0.2899108, -0.5188764, 5.721058, 1, 1, 1, 1, 1,
0.2917826, 0.7528258, 0.01421116, 1, 1, 1, 1, 1,
0.2953603, 0.4633307, -0.1090973, 1, 1, 1, 1, 1,
0.298162, -1.478945, 2.186121, 0, 0, 1, 1, 1,
0.2993361, 0.2051724, 0.4352922, 1, 0, 0, 1, 1,
0.2995941, -0.6586702, 5.468268, 1, 0, 0, 1, 1,
0.3011308, 0.7320856, 0.07725818, 1, 0, 0, 1, 1,
0.3012141, 0.3934395, 0.09469362, 1, 0, 0, 1, 1,
0.3019404, 1.55558, 0.6812269, 1, 0, 0, 1, 1,
0.3170887, 1.457861, 0.349525, 0, 0, 0, 1, 1,
0.320558, -0.3683624, 3.386377, 0, 0, 0, 1, 1,
0.3246997, -1.490342, 4.151351, 0, 0, 0, 1, 1,
0.3310344, 0.6089463, 2.64562, 0, 0, 0, 1, 1,
0.3318281, -0.4691976, 0.9914808, 0, 0, 0, 1, 1,
0.333062, 1.160005, 0.5463523, 0, 0, 0, 1, 1,
0.3342938, -1.498035, 1.40021, 0, 0, 0, 1, 1,
0.3344467, -0.8813425, 3.449929, 1, 1, 1, 1, 1,
0.3352154, 1.526759, -0.7157602, 1, 1, 1, 1, 1,
0.3380194, -0.9152051, 2.33187, 1, 1, 1, 1, 1,
0.3392341, -1.125893, 2.559452, 1, 1, 1, 1, 1,
0.3413728, 0.1378151, 0.5438473, 1, 1, 1, 1, 1,
0.3429039, 0.6810352, 0.3938649, 1, 1, 1, 1, 1,
0.3457302, 1.430072, 0.5396773, 1, 1, 1, 1, 1,
0.3541827, -0.3760764, 3.658559, 1, 1, 1, 1, 1,
0.3553032, 0.03442278, 1.511185, 1, 1, 1, 1, 1,
0.3571377, -0.4063882, 2.947045, 1, 1, 1, 1, 1,
0.3581061, -0.2508985, 1.785151, 1, 1, 1, 1, 1,
0.3593945, 0.5985309, 0.873601, 1, 1, 1, 1, 1,
0.3599687, 0.5993934, -0.707677, 1, 1, 1, 1, 1,
0.3654835, 1.75898, 0.9979244, 1, 1, 1, 1, 1,
0.3657345, -1.343706, 2.734263, 1, 1, 1, 1, 1,
0.3712724, 0.00715718, 1.629285, 0, 0, 1, 1, 1,
0.3717231, 1.017974, -0.7805281, 1, 0, 0, 1, 1,
0.3747612, -2.421941, 2.291461, 1, 0, 0, 1, 1,
0.3766007, 0.4734604, 1.170525, 1, 0, 0, 1, 1,
0.3812097, -1.685268, 2.082808, 1, 0, 0, 1, 1,
0.3815718, -0.1696903, 1.913779, 1, 0, 0, 1, 1,
0.3821426, 0.06045849, 1.073325, 0, 0, 0, 1, 1,
0.3860671, 1.349831, 0.2333612, 0, 0, 0, 1, 1,
0.386078, -0.1387049, 2.630734, 0, 0, 0, 1, 1,
0.3918324, -1.003312, 3.428584, 0, 0, 0, 1, 1,
0.3935574, -0.4771912, 2.212857, 0, 0, 0, 1, 1,
0.3948423, -0.5192673, 2.907053, 0, 0, 0, 1, 1,
0.3951115, 0.5557537, 1.571884, 0, 0, 0, 1, 1,
0.3966048, 0.08566166, -0.07134343, 1, 1, 1, 1, 1,
0.3991515, -0.5867704, 3.828868, 1, 1, 1, 1, 1,
0.3991654, 1.337221, 0.6771217, 1, 1, 1, 1, 1,
0.4065983, -0.1386839, 2.605565, 1, 1, 1, 1, 1,
0.4073439, -1.427878, 3.046014, 1, 1, 1, 1, 1,
0.4118891, -0.1857683, 1.112182, 1, 1, 1, 1, 1,
0.4119911, 0.8055827, 0.7935041, 1, 1, 1, 1, 1,
0.4128819, 1.160115, 0.6097027, 1, 1, 1, 1, 1,
0.4155475, 0.2972416, 1.175991, 1, 1, 1, 1, 1,
0.4160005, 0.09061752, 2.530807, 1, 1, 1, 1, 1,
0.4234774, 0.1073253, 0.8334197, 1, 1, 1, 1, 1,
0.4243554, 0.935895, 0.3142377, 1, 1, 1, 1, 1,
0.4268703, -0.6986781, 4.304164, 1, 1, 1, 1, 1,
0.4333897, -0.5253744, 1.873617, 1, 1, 1, 1, 1,
0.4366059, 1.724815, 0.1825422, 1, 1, 1, 1, 1,
0.4409036, -0.366565, 2.456965, 0, 0, 1, 1, 1,
0.4427047, 0.7786413, 1.1877, 1, 0, 0, 1, 1,
0.4439844, 0.7383216, -0.1430497, 1, 0, 0, 1, 1,
0.4468578, 0.6911551, -0.478865, 1, 0, 0, 1, 1,
0.4470375, -0.02104465, -0.09377697, 1, 0, 0, 1, 1,
0.4519188, 0.7861444, -0.1901942, 1, 0, 0, 1, 1,
0.4522373, 0.1925094, 1.483998, 0, 0, 0, 1, 1,
0.4530578, 0.3998411, 1.692119, 0, 0, 0, 1, 1,
0.4582382, 0.0653341, 0.8595518, 0, 0, 0, 1, 1,
0.4628339, -1.313698, 5.240335, 0, 0, 0, 1, 1,
0.4683043, -0.4044992, 2.856091, 0, 0, 0, 1, 1,
0.4696123, 0.2830798, 2.500961, 0, 0, 0, 1, 1,
0.4720676, 0.64924, 1.060305, 0, 0, 0, 1, 1,
0.4763433, 0.1337829, 0.9500999, 1, 1, 1, 1, 1,
0.4765112, 0.3267143, 0.286116, 1, 1, 1, 1, 1,
0.4776246, -0.1001767, 1.878384, 1, 1, 1, 1, 1,
0.4826466, -1.372308, 2.348622, 1, 1, 1, 1, 1,
0.4914995, -0.03698079, 1.64323, 1, 1, 1, 1, 1,
0.4987536, 0.63449, 0.4136172, 1, 1, 1, 1, 1,
0.4999232, 0.09079521, -1.260648, 1, 1, 1, 1, 1,
0.4999331, -0.6394577, 1.344025, 1, 1, 1, 1, 1,
0.5057011, -0.8331237, 4.341554, 1, 1, 1, 1, 1,
0.5155194, 0.05869041, 1.453539, 1, 1, 1, 1, 1,
0.5162812, 0.3871151, 1.220167, 1, 1, 1, 1, 1,
0.5191547, -1.218736, 3.971447, 1, 1, 1, 1, 1,
0.5230519, -0.9780678, 3.84441, 1, 1, 1, 1, 1,
0.5246638, 0.2976339, 2.271487, 1, 1, 1, 1, 1,
0.5248659, -1.268178, 2.388934, 1, 1, 1, 1, 1,
0.5281739, -0.6659024, 3.410786, 0, 0, 1, 1, 1,
0.5306, -0.2072663, 1.287639, 1, 0, 0, 1, 1,
0.5355199, -0.1801585, 1.91748, 1, 0, 0, 1, 1,
0.5379806, -0.397377, 2.208055, 1, 0, 0, 1, 1,
0.5393776, -0.6215552, 3.605335, 1, 0, 0, 1, 1,
0.5413437, -1.181934, 3.595956, 1, 0, 0, 1, 1,
0.5416145, 0.4998786, 1.123508, 0, 0, 0, 1, 1,
0.5516659, 0.758526, 2.029355, 0, 0, 0, 1, 1,
0.5535555, -0.4015284, 2.695204, 0, 0, 0, 1, 1,
0.553951, 1.058602, 0.6040779, 0, 0, 0, 1, 1,
0.5548174, -0.7652972, 1.254336, 0, 0, 0, 1, 1,
0.5555893, -0.08192287, 2.595567, 0, 0, 0, 1, 1,
0.5577885, 0.1477583, 1.627404, 0, 0, 0, 1, 1,
0.5589681, 1.385749, 1.252424, 1, 1, 1, 1, 1,
0.5600854, -0.6649138, 3.013422, 1, 1, 1, 1, 1,
0.5627351, -0.1482446, 1.847189, 1, 1, 1, 1, 1,
0.5681673, -0.6536577, 2.25774, 1, 1, 1, 1, 1,
0.5696195, 0.4741458, 1.423632, 1, 1, 1, 1, 1,
0.5731894, -0.8982433, 3.787428, 1, 1, 1, 1, 1,
0.580504, 0.8981032, -0.01335722, 1, 1, 1, 1, 1,
0.583261, 0.5521031, 0.770014, 1, 1, 1, 1, 1,
0.5842425, 0.4123244, 0.8685105, 1, 1, 1, 1, 1,
0.5893142, -1.020773, 4.651723, 1, 1, 1, 1, 1,
0.5902538, 2.675191, 1.884827, 1, 1, 1, 1, 1,
0.5930398, -0.9446408, 2.014239, 1, 1, 1, 1, 1,
0.5941901, -0.2566856, 2.220229, 1, 1, 1, 1, 1,
0.6066085, 1.008088, -1.220899, 1, 1, 1, 1, 1,
0.6122569, -1.970532, 1.640578, 1, 1, 1, 1, 1,
0.6149577, 0.4726028, 1.520855, 0, 0, 1, 1, 1,
0.6152583, -0.6664623, 0.9997696, 1, 0, 0, 1, 1,
0.6159915, 0.6909257, 0.8304124, 1, 0, 0, 1, 1,
0.6165508, 1.312675, -0.04893963, 1, 0, 0, 1, 1,
0.6184366, -0.1892182, 1.762531, 1, 0, 0, 1, 1,
0.619523, -1.672702, 0.7108662, 1, 0, 0, 1, 1,
0.6222965, -0.03348793, 1.887455, 0, 0, 0, 1, 1,
0.6259714, 1.763006, -1.128721, 0, 0, 0, 1, 1,
0.6362981, 0.1538417, 2.006052, 0, 0, 0, 1, 1,
0.638935, -0.4784263, -0.7236657, 0, 0, 0, 1, 1,
0.6396884, -0.7260715, 1.129416, 0, 0, 0, 1, 1,
0.6400145, 1.525466, 1.479284, 0, 0, 0, 1, 1,
0.6568927, -0.2234818, 2.273303, 0, 0, 0, 1, 1,
0.6664822, 0.9880905, 1.170789, 1, 1, 1, 1, 1,
0.6672798, -0.1242356, 3.0646, 1, 1, 1, 1, 1,
0.6764433, -1.573527, 2.322838, 1, 1, 1, 1, 1,
0.6785421, 0.398716, 0.03957894, 1, 1, 1, 1, 1,
0.6828251, -0.2792355, -0.4966596, 1, 1, 1, 1, 1,
0.6862956, -0.401309, 0.9238745, 1, 1, 1, 1, 1,
0.6867194, -0.1447657, 1.963343, 1, 1, 1, 1, 1,
0.6881072, -3.063657, 2.911015, 1, 1, 1, 1, 1,
0.6898919, 0.1510876, 1.01132, 1, 1, 1, 1, 1,
0.6953524, 0.3479664, 1.128582, 1, 1, 1, 1, 1,
0.6978799, 0.366432, 0.9742171, 1, 1, 1, 1, 1,
0.6993299, -0.3384194, 1.227493, 1, 1, 1, 1, 1,
0.7015864, 0.1073941, 2.314038, 1, 1, 1, 1, 1,
0.7031779, 1.266065, 0.7156745, 1, 1, 1, 1, 1,
0.7037115, -0.3994926, 2.223527, 1, 1, 1, 1, 1,
0.7042375, 0.6821932, 2.412595, 0, 0, 1, 1, 1,
0.7048978, 1.355016, 0.6741859, 1, 0, 0, 1, 1,
0.7065272, -0.4246856, 2.107872, 1, 0, 0, 1, 1,
0.706874, 0.6471698, 0.9638276, 1, 0, 0, 1, 1,
0.7084223, -1.333655, 3.604442, 1, 0, 0, 1, 1,
0.7135757, -3.299639, 3.299498, 1, 0, 0, 1, 1,
0.7140167, 1.145144, 1.226119, 0, 0, 0, 1, 1,
0.7153016, -0.6475553, 2.754073, 0, 0, 0, 1, 1,
0.7164945, -1.347853, 1.215502, 0, 0, 0, 1, 1,
0.7171543, 0.7628152, -0.7443295, 0, 0, 0, 1, 1,
0.7250568, 1.741851, 0.8843768, 0, 0, 0, 1, 1,
0.7308793, 0.1954273, 1.732047, 0, 0, 0, 1, 1,
0.7349663, -0.6142843, 1.337549, 0, 0, 0, 1, 1,
0.7361093, -1.193478, 1.543118, 1, 1, 1, 1, 1,
0.736768, -0.9073892, 1.029618, 1, 1, 1, 1, 1,
0.7376803, -0.1906133, 1.841316, 1, 1, 1, 1, 1,
0.7404553, -0.8395535, 1.826377, 1, 1, 1, 1, 1,
0.7427433, 0.6922657, 2.113163, 1, 1, 1, 1, 1,
0.7503398, 2.3304, -1.063498, 1, 1, 1, 1, 1,
0.7515423, 0.8509254, -0.9250544, 1, 1, 1, 1, 1,
0.754182, 1.514962, -0.936574, 1, 1, 1, 1, 1,
0.7550704, -0.1602585, -0.67258, 1, 1, 1, 1, 1,
0.7562659, 1.457389, -0.8248258, 1, 1, 1, 1, 1,
0.7662627, 0.9205443, 1.508153, 1, 1, 1, 1, 1,
0.7665331, 1.422142, 0.3794473, 1, 1, 1, 1, 1,
0.7666312, 1.240996, 0.7259743, 1, 1, 1, 1, 1,
0.7703209, -0.3694388, 1.841134, 1, 1, 1, 1, 1,
0.770544, -1.110411, 2.084699, 1, 1, 1, 1, 1,
0.7730512, 1.071995, -1.405467, 0, 0, 1, 1, 1,
0.785982, -1.111353, 1.968825, 1, 0, 0, 1, 1,
0.7889007, 0.06273848, 0.4370379, 1, 0, 0, 1, 1,
0.7984628, 0.2940352, 1.677976, 1, 0, 0, 1, 1,
0.800758, 0.2560904, 1.833823, 1, 0, 0, 1, 1,
0.8101004, -1.123219, 3.179559, 1, 0, 0, 1, 1,
0.8116621, -1.276857, 2.521929, 0, 0, 0, 1, 1,
0.8188982, 1.758825, 0.5640627, 0, 0, 0, 1, 1,
0.8376361, -1.488986, 1.968261, 0, 0, 0, 1, 1,
0.8478302, -0.02206811, 1.197695, 0, 0, 0, 1, 1,
0.855557, 0.6404721, 2.619653, 0, 0, 0, 1, 1,
0.8575109, 0.02699313, 2.0704, 0, 0, 0, 1, 1,
0.8587845, 0.8579624, 1.995839, 0, 0, 0, 1, 1,
0.8593971, 1.00209, 0.6997454, 1, 1, 1, 1, 1,
0.8603065, 1.145867, 1.580855, 1, 1, 1, 1, 1,
0.8645724, -1.987275, 2.61288, 1, 1, 1, 1, 1,
0.8661148, -0.7239248, 2.299438, 1, 1, 1, 1, 1,
0.8691476, 0.3507743, 2.270075, 1, 1, 1, 1, 1,
0.8706904, 0.6316655, 2.155151, 1, 1, 1, 1, 1,
0.8722371, 0.6896121, 0.4021821, 1, 1, 1, 1, 1,
0.8734952, -1.06706, 1.730018, 1, 1, 1, 1, 1,
0.8779125, 0.2341713, 3.22701, 1, 1, 1, 1, 1,
0.8807612, -0.9145193, 2.015828, 1, 1, 1, 1, 1,
0.8878402, -0.03173618, 0.7049505, 1, 1, 1, 1, 1,
0.8881946, 0.688117, 0.494375, 1, 1, 1, 1, 1,
0.8882725, 0.8397657, 0.5512508, 1, 1, 1, 1, 1,
0.8918415, 2.346492, -0.1669314, 1, 1, 1, 1, 1,
0.8940278, 1.846123, -0.4797364, 1, 1, 1, 1, 1,
0.9017683, 1.057253, 1.749329, 0, 0, 1, 1, 1,
0.9134278, 0.04938454, 0.6857605, 1, 0, 0, 1, 1,
0.9171832, 1.075151, 1.032565, 1, 0, 0, 1, 1,
0.9251531, 0.3824768, 0.4227769, 1, 0, 0, 1, 1,
0.9260262, 0.5500438, 1.122484, 1, 0, 0, 1, 1,
0.9267839, -1.18694, 2.743077, 1, 0, 0, 1, 1,
0.9289569, -0.3702025, 2.758709, 0, 0, 0, 1, 1,
0.9367053, -1.119851, 2.972572, 0, 0, 0, 1, 1,
0.9393526, -0.02076399, 1.582233, 0, 0, 0, 1, 1,
0.9503385, -2.020601, 2.982426, 0, 0, 0, 1, 1,
0.9623474, -0.2830121, 3.483332, 0, 0, 0, 1, 1,
0.9820259, -0.4760284, 1.107198, 0, 0, 0, 1, 1,
0.982086, 0.9598036, 0.857566, 0, 0, 0, 1, 1,
0.9845971, -0.6145284, 1.616152, 1, 1, 1, 1, 1,
0.9895624, -2.140869, 1.925605, 1, 1, 1, 1, 1,
0.9959102, 0.4467767, 1.246054, 1, 1, 1, 1, 1,
1.01516, 0.7510577, 2.23554, 1, 1, 1, 1, 1,
1.018463, 1.78559, 2.715075, 1, 1, 1, 1, 1,
1.022663, -0.4442748, 2.970973, 1, 1, 1, 1, 1,
1.029366, 0.8271407, 1.592314, 1, 1, 1, 1, 1,
1.033061, 0.5693459, 1.465433, 1, 1, 1, 1, 1,
1.03907, 0.9617982, 1.22808, 1, 1, 1, 1, 1,
1.041354, -1.426406, 1.078376, 1, 1, 1, 1, 1,
1.042002, 0.7528474, -1.135383, 1, 1, 1, 1, 1,
1.045896, -1.753141, 1.869472, 1, 1, 1, 1, 1,
1.053581, 3.033109, -1.474321, 1, 1, 1, 1, 1,
1.056459, 1.741821, -0.3880187, 1, 1, 1, 1, 1,
1.062158, 1.32746, -0.3555411, 1, 1, 1, 1, 1,
1.073231, 0.2749278, 1.912076, 0, 0, 1, 1, 1,
1.074451, -0.7358234, 1.901458, 1, 0, 0, 1, 1,
1.079858, -1.569961, 2.831188, 1, 0, 0, 1, 1,
1.086689, 0.770216, 2.169137, 1, 0, 0, 1, 1,
1.088806, -0.280593, 2.603598, 1, 0, 0, 1, 1,
1.089685, -0.9558812, 3.263062, 1, 0, 0, 1, 1,
1.091847, -0.2892938, 2.886954, 0, 0, 0, 1, 1,
1.099278, -0.1041092, 1.016194, 0, 0, 0, 1, 1,
1.099282, -1.017686, 1.851622, 0, 0, 0, 1, 1,
1.109378, 0.1914696, 2.75117, 0, 0, 0, 1, 1,
1.113077, 1.285739, 0.0955345, 0, 0, 0, 1, 1,
1.116414, 0.4788246, 2.378286, 0, 0, 0, 1, 1,
1.120831, -0.008372325, 2.151487, 0, 0, 0, 1, 1,
1.127896, 0.3148692, 0.986908, 1, 1, 1, 1, 1,
1.136962, -0.8235278, 2.156914, 1, 1, 1, 1, 1,
1.152182, 0.6157232, 0.7339799, 1, 1, 1, 1, 1,
1.157404, 1.236526, 0.2074511, 1, 1, 1, 1, 1,
1.161746, -0.1835334, 2.207818, 1, 1, 1, 1, 1,
1.16224, -3.300427, 2.839557, 1, 1, 1, 1, 1,
1.166641, 1.343987, 1.375317, 1, 1, 1, 1, 1,
1.168756, -2.232068, 4.256834, 1, 1, 1, 1, 1,
1.170045, 0.1440503, 1.152684, 1, 1, 1, 1, 1,
1.178721, -0.02612261, -0.02504512, 1, 1, 1, 1, 1,
1.18482, -0.8058769, 2.055277, 1, 1, 1, 1, 1,
1.189123, 0.05931712, 0.4800636, 1, 1, 1, 1, 1,
1.189342, -0.8481956, 3.654903, 1, 1, 1, 1, 1,
1.199363, 0.2642827, 0.2282321, 1, 1, 1, 1, 1,
1.199492, 2.233597, -0.9052464, 1, 1, 1, 1, 1,
1.201205, -1.257938, 2.47498, 0, 0, 1, 1, 1,
1.202583, 2.333466, 0.4790352, 1, 0, 0, 1, 1,
1.203764, 0.4777987, 0.5645241, 1, 0, 0, 1, 1,
1.208442, -0.3178989, 1.462018, 1, 0, 0, 1, 1,
1.209933, -2.190856, 3.028527, 1, 0, 0, 1, 1,
1.213203, -0.2895693, 3.184444, 1, 0, 0, 1, 1,
1.21982, -1.445107, 2.97153, 0, 0, 0, 1, 1,
1.22629, 1.920718, 1.791047, 0, 0, 0, 1, 1,
1.226755, -0.9314455, 1.851692, 0, 0, 0, 1, 1,
1.243727, -0.9603222, 0.9900936, 0, 0, 0, 1, 1,
1.244717, -0.2259919, 1.933301, 0, 0, 0, 1, 1,
1.253708, -0.7870891, 2.315473, 0, 0, 0, 1, 1,
1.254894, 0.4348941, 1.084401, 0, 0, 0, 1, 1,
1.262264, -0.03425605, 2.52712, 1, 1, 1, 1, 1,
1.265939, 0.4194097, -2.035565, 1, 1, 1, 1, 1,
1.272153, -0.7068894, 1.450054, 1, 1, 1, 1, 1,
1.273455, 0.9390403, -1.22894, 1, 1, 1, 1, 1,
1.2738, 1.061665, 1.12325, 1, 1, 1, 1, 1,
1.278802, -2.363293, 0.7983691, 1, 1, 1, 1, 1,
1.281108, -0.3595943, 1.371953, 1, 1, 1, 1, 1,
1.285163, 1.170313, 1.205599, 1, 1, 1, 1, 1,
1.291178, 1.213771, -0.1532548, 1, 1, 1, 1, 1,
1.292269, -0.3616664, 2.618334, 1, 1, 1, 1, 1,
1.299158, 1.550284, 0.2108147, 1, 1, 1, 1, 1,
1.304775, -0.8661835, 1.412089, 1, 1, 1, 1, 1,
1.306959, -0.02306155, 2.838741, 1, 1, 1, 1, 1,
1.310722, 0.07194159, 2.012426, 1, 1, 1, 1, 1,
1.314015, -1.309285, 2.027483, 1, 1, 1, 1, 1,
1.31774, 0.3394156, 0.3042534, 0, 0, 1, 1, 1,
1.322617, -0.6146023, 1.05658, 1, 0, 0, 1, 1,
1.329381, 1.153652, 0.9576539, 1, 0, 0, 1, 1,
1.330132, -0.7923774, 2.145718, 1, 0, 0, 1, 1,
1.337031, -1.156788, 1.638733, 1, 0, 0, 1, 1,
1.337339, -1.936664, 1.76279, 1, 0, 0, 1, 1,
1.337896, -0.761601, 3.301426, 0, 0, 0, 1, 1,
1.351004, 1.011121, 0.6911492, 0, 0, 0, 1, 1,
1.351794, -0.5910549, 2.087301, 0, 0, 0, 1, 1,
1.354888, -0.5727727, 2.023358, 0, 0, 0, 1, 1,
1.355613, -2.659966, 2.963988, 0, 0, 0, 1, 1,
1.355656, -0.3443189, 2.762733, 0, 0, 0, 1, 1,
1.356981, 1.414629, 1.180851, 0, 0, 0, 1, 1,
1.374236, -1.044802, 1.623452, 1, 1, 1, 1, 1,
1.375268, -0.5364382, 1.24505, 1, 1, 1, 1, 1,
1.37635, 0.9573734, 1.832448, 1, 1, 1, 1, 1,
1.387852, 0.2835982, 2.966774, 1, 1, 1, 1, 1,
1.389389, -1.603894, 2.995851, 1, 1, 1, 1, 1,
1.395817, -0.4024511, 0.7131765, 1, 1, 1, 1, 1,
1.410035, -0.9594156, 3.291682, 1, 1, 1, 1, 1,
1.417399, -0.3414046, 1.424969, 1, 1, 1, 1, 1,
1.436898, 0.002583291, 1.23659, 1, 1, 1, 1, 1,
1.443298, -0.9425233, 1.799372, 1, 1, 1, 1, 1,
1.458945, -0.9431692, 1.533531, 1, 1, 1, 1, 1,
1.464596, 0.7068883, 2.342994, 1, 1, 1, 1, 1,
1.46642, 0.7360814, 0.926204, 1, 1, 1, 1, 1,
1.472355, 1.338336, 1.733881, 1, 1, 1, 1, 1,
1.48096, -0.7624611, 1.796632, 1, 1, 1, 1, 1,
1.489927, -1.33153, 4.274913, 0, 0, 1, 1, 1,
1.493998, -1.574622, 2.489879, 1, 0, 0, 1, 1,
1.496698, -0.5785161, 3.014441, 1, 0, 0, 1, 1,
1.507643, -0.6514683, 2.075198, 1, 0, 0, 1, 1,
1.520537, 0.3716124, 0.7582558, 1, 0, 0, 1, 1,
1.529826, -2.501085, 3.367522, 1, 0, 0, 1, 1,
1.533792, -0.4504609, 0.4676909, 0, 0, 0, 1, 1,
1.536408, -0.5401814, 2.044375, 0, 0, 0, 1, 1,
1.537877, -1.547362, 3.007472, 0, 0, 0, 1, 1,
1.553281, -0.33588, 2.340667, 0, 0, 0, 1, 1,
1.56205, 0.6396091, 2.197076, 0, 0, 0, 1, 1,
1.563161, 2.10877, -0.06220447, 0, 0, 0, 1, 1,
1.567814, 1.24142, 0.4750206, 0, 0, 0, 1, 1,
1.579608, 0.5868648, -1.161812, 1, 1, 1, 1, 1,
1.599959, 1.349474, 3.45522, 1, 1, 1, 1, 1,
1.605016, 0.9743904, 2.333711, 1, 1, 1, 1, 1,
1.612328, -1.166307, 4.121641, 1, 1, 1, 1, 1,
1.618523, -0.8257161, 3.147911, 1, 1, 1, 1, 1,
1.627361, -0.7299611, 4.21656, 1, 1, 1, 1, 1,
1.634142, -0.3578819, 3.079472, 1, 1, 1, 1, 1,
1.641, 1.973963, 2.524953, 1, 1, 1, 1, 1,
1.658661, -0.9390322, 0.8593807, 1, 1, 1, 1, 1,
1.664141, 0.2578988, 2.77206, 1, 1, 1, 1, 1,
1.692044, -0.07319218, 1.260341, 1, 1, 1, 1, 1,
1.705554, 0.272472, 0.1461644, 1, 1, 1, 1, 1,
1.718118, 0.5091133, 0.8668937, 1, 1, 1, 1, 1,
1.721708, -0.8367739, 2.806514, 1, 1, 1, 1, 1,
1.722314, -2.558047, 2.838006, 1, 1, 1, 1, 1,
1.723235, -1.62045, 3.57151, 0, 0, 1, 1, 1,
1.730526, 0.1922029, -0.1844655, 1, 0, 0, 1, 1,
1.735539, 0.02563934, 0.6462783, 1, 0, 0, 1, 1,
1.738153, -1.186376, 2.565546, 1, 0, 0, 1, 1,
1.75929, -0.387421, 1.908966, 1, 0, 0, 1, 1,
1.761247, 0.8582491, 1.746645, 1, 0, 0, 1, 1,
1.76353, 2.83703, -0.3501056, 0, 0, 0, 1, 1,
1.776304, 0.6551465, 1.165649, 0, 0, 0, 1, 1,
1.777498, -2.2031, 3.976638, 0, 0, 0, 1, 1,
1.786775, -1.527118, 1.769365, 0, 0, 0, 1, 1,
1.787799, -0.8370329, 1.427001, 0, 0, 0, 1, 1,
1.791546, -1.837021, 2.319427, 0, 0, 0, 1, 1,
1.825211, -1.846578, 4.2221, 0, 0, 0, 1, 1,
1.843769, -0.3179331, 1.707404, 1, 1, 1, 1, 1,
1.85025, 0.5382572, 1.435158, 1, 1, 1, 1, 1,
1.864905, 0.9762033, 0.6712428, 1, 1, 1, 1, 1,
1.866386, 0.4976487, 1.567226, 1, 1, 1, 1, 1,
1.94311, 1.44707, 0.1113257, 1, 1, 1, 1, 1,
1.962586, 0.04264385, 4.203808, 1, 1, 1, 1, 1,
1.977511, -0.4725874, 3.871298, 1, 1, 1, 1, 1,
2.003177, -0.3462876, 2.775869, 1, 1, 1, 1, 1,
2.00942, 0.5658, 0.9931476, 1, 1, 1, 1, 1,
2.027102, -1.060185, 3.770832, 1, 1, 1, 1, 1,
2.033133, -1.771528, 1.750621, 1, 1, 1, 1, 1,
2.042399, -0.169304, 2.543123, 1, 1, 1, 1, 1,
2.044858, 0.1245814, 0.8923994, 1, 1, 1, 1, 1,
2.057777, 0.1064063, 1.314093, 1, 1, 1, 1, 1,
2.086616, -0.01305842, 0.4485541, 1, 1, 1, 1, 1,
2.13793, 0.8876621, 0.9964435, 0, 0, 1, 1, 1,
2.169442, 1.290608, 0.9387572, 1, 0, 0, 1, 1,
2.191784, -1.662187, 3.319355, 1, 0, 0, 1, 1,
2.256638, 0.07261116, 2.125573, 1, 0, 0, 1, 1,
2.257266, -2.064386, 2.506428, 1, 0, 0, 1, 1,
2.258654, -2.814472, 1.638981, 1, 0, 0, 1, 1,
2.265643, 0.7591993, 1.752555, 0, 0, 0, 1, 1,
2.307352, 0.927062, 2.462986, 0, 0, 0, 1, 1,
2.347985, -0.3661843, 2.239297, 0, 0, 0, 1, 1,
2.392764, 1.752633, 0.8079534, 0, 0, 0, 1, 1,
2.498969, -0.9172073, 1.853259, 0, 0, 0, 1, 1,
2.503605, -1.181463, 1.974073, 0, 0, 0, 1, 1,
2.507096, -0.380866, 2.401858, 0, 0, 0, 1, 1,
2.523602, 0.9949884, 0.1250959, 1, 1, 1, 1, 1,
2.611439, 0.8882456, 1.962951, 1, 1, 1, 1, 1,
2.681811, -1.235035, 1.180671, 1, 1, 1, 1, 1,
2.692996, -0.5878299, 1.031474, 1, 1, 1, 1, 1,
2.765631, 0.770422, 0.929301, 1, 1, 1, 1, 1,
2.928451, 0.8268237, 2.261624, 1, 1, 1, 1, 1,
2.959016, 0.6656166, 1.996186, 1, 1, 1, 1, 1
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
var radius = 9.665339;
var distance = 33.94909;
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
mvMatrix.translate( 0.2059036, 0.2008719, -0.2455313 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.94909);
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
