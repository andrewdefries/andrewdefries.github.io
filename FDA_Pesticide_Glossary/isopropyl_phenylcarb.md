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
-3.125973, 0.5222881, -1.038317, 1, 0, 0, 1,
-3.009828, -0.09042596, -2.996207, 1, 0.007843138, 0, 1,
-2.846044, 1.250717, -1.57035, 1, 0.01176471, 0, 1,
-2.758941, -1.700626, 0.1413252, 1, 0.01960784, 0, 1,
-2.721405, 1.279018, -2.137621, 1, 0.02352941, 0, 1,
-2.646993, 0.8944038, -1.705885, 1, 0.03137255, 0, 1,
-2.560266, 0.7853925, -1.443081, 1, 0.03529412, 0, 1,
-2.536287, -0.3573801, -0.4471971, 1, 0.04313726, 0, 1,
-2.523585, 0.2732731, -1.476884, 1, 0.04705882, 0, 1,
-2.467401, -0.6877605, -3.38726, 1, 0.05490196, 0, 1,
-2.410146, -0.104323, -2.129856, 1, 0.05882353, 0, 1,
-2.377493, 0.3967413, -0.787802, 1, 0.06666667, 0, 1,
-2.325767, -1.206935, -1.775144, 1, 0.07058824, 0, 1,
-2.325544, 1.016747, 0.2349185, 1, 0.07843138, 0, 1,
-2.24353, 0.7818468, -2.035697, 1, 0.08235294, 0, 1,
-2.155053, -0.6571224, -1.963376, 1, 0.09019608, 0, 1,
-2.075901, 0.01599801, -1.083094, 1, 0.09411765, 0, 1,
-2.027778, 1.188629, -2.017396, 1, 0.1019608, 0, 1,
-2.022007, 3.106792, 1.245893, 1, 0.1098039, 0, 1,
-2.019209, -0.7524105, -2.644908, 1, 0.1137255, 0, 1,
-2.008747, -0.04967765, -1.102863, 1, 0.1215686, 0, 1,
-1.977986, 0.6097477, -0.8159767, 1, 0.1254902, 0, 1,
-1.960654, -1.980954, -2.356133, 1, 0.1333333, 0, 1,
-1.946576, 0.08122143, -0.08147419, 1, 0.1372549, 0, 1,
-1.946429, 1.025259, -1.097884, 1, 0.145098, 0, 1,
-1.933871, 1.084052, 0.2301477, 1, 0.1490196, 0, 1,
-1.916322, 1.048842, -0.385388, 1, 0.1568628, 0, 1,
-1.893991, -0.7050098, -1.110301, 1, 0.1607843, 0, 1,
-1.869247, -0.8679588, -2.670406, 1, 0.1686275, 0, 1,
-1.862928, -1.041519, -1.529672, 1, 0.172549, 0, 1,
-1.85815, 1.252345, 0.1293707, 1, 0.1803922, 0, 1,
-1.856948, 1.609844, -0.5850567, 1, 0.1843137, 0, 1,
-1.844334, 0.7238931, 0.08334553, 1, 0.1921569, 0, 1,
-1.822922, 0.1010492, -0.4215745, 1, 0.1960784, 0, 1,
-1.807008, 0.1338389, -2.417297, 1, 0.2039216, 0, 1,
-1.805673, -0.5975232, -1.314521, 1, 0.2117647, 0, 1,
-1.800544, 0.09394785, -0.9349576, 1, 0.2156863, 0, 1,
-1.795894, -0.6547868, 0.347798, 1, 0.2235294, 0, 1,
-1.793323, 0.4064005, -1.195406, 1, 0.227451, 0, 1,
-1.719113, -0.9500387, -2.124285, 1, 0.2352941, 0, 1,
-1.69403, -1.468846, -4.138906, 1, 0.2392157, 0, 1,
-1.693337, 0.1072296, -2.626922, 1, 0.2470588, 0, 1,
-1.667203, -0.9912797, -0.953644, 1, 0.2509804, 0, 1,
-1.657166, -0.01401275, -1.560763, 1, 0.2588235, 0, 1,
-1.656689, -1.951376, -3.148136, 1, 0.2627451, 0, 1,
-1.648941, -0.6972719, -3.311857, 1, 0.2705882, 0, 1,
-1.646364, -0.6581604, -1.425966, 1, 0.2745098, 0, 1,
-1.635555, 0.1281624, -0.6699372, 1, 0.282353, 0, 1,
-1.6174, 0.07103729, -3.562317, 1, 0.2862745, 0, 1,
-1.61551, 0.7765404, -0.09896868, 1, 0.2941177, 0, 1,
-1.606104, 1.203382, -1.35305, 1, 0.3019608, 0, 1,
-1.597391, -0.6752447, -3.53162, 1, 0.3058824, 0, 1,
-1.582955, -1.02311, -1.261455, 1, 0.3137255, 0, 1,
-1.575733, -0.2076359, -0.3807458, 1, 0.3176471, 0, 1,
-1.57524, 1.621983, -1.525754, 1, 0.3254902, 0, 1,
-1.567277, -1.73676, -2.635455, 1, 0.3294118, 0, 1,
-1.562539, -0.1441009, -2.714876, 1, 0.3372549, 0, 1,
-1.559738, 1.015084, -1.745901, 1, 0.3411765, 0, 1,
-1.553124, -0.6252533, -2.804641, 1, 0.3490196, 0, 1,
-1.552679, 0.2983328, -0.4144905, 1, 0.3529412, 0, 1,
-1.538163, 0.3121223, -1.887378, 1, 0.3607843, 0, 1,
-1.534027, -0.7002892, -2.663897, 1, 0.3647059, 0, 1,
-1.517066, -0.2147532, -2.707045, 1, 0.372549, 0, 1,
-1.5005, 0.346402, 0.3950191, 1, 0.3764706, 0, 1,
-1.480231, 0.2180482, -0.8800631, 1, 0.3843137, 0, 1,
-1.4798, 0.5908769, -2.017782, 1, 0.3882353, 0, 1,
-1.473108, 0.1091451, 0.2214697, 1, 0.3960784, 0, 1,
-1.469077, -0.1432407, -1.82792, 1, 0.4039216, 0, 1,
-1.46651, -0.1453245, -2.335463, 1, 0.4078431, 0, 1,
-1.465968, 0.5723003, -1.57605, 1, 0.4156863, 0, 1,
-1.445177, 1.688765, -1.770713, 1, 0.4196078, 0, 1,
-1.441893, -0.2741956, -3.309742, 1, 0.427451, 0, 1,
-1.438234, -0.4584374, -1.851875, 1, 0.4313726, 0, 1,
-1.425493, 0.1412804, -1.800727, 1, 0.4392157, 0, 1,
-1.425422, 1.406941, -1.090091, 1, 0.4431373, 0, 1,
-1.403825, 1.144263, -0.5006201, 1, 0.4509804, 0, 1,
-1.403465, -0.2481133, -0.7596796, 1, 0.454902, 0, 1,
-1.395746, -1.775733, -1.870086, 1, 0.4627451, 0, 1,
-1.374312, 0.8768249, -0.08700042, 1, 0.4666667, 0, 1,
-1.366019, -0.2844907, -2.636644, 1, 0.4745098, 0, 1,
-1.364753, -1.265298, -2.671755, 1, 0.4784314, 0, 1,
-1.352659, 0.2396129, -2.105548, 1, 0.4862745, 0, 1,
-1.341534, -0.7838624, -2.180805, 1, 0.4901961, 0, 1,
-1.332731, -0.7329441, -1.341846, 1, 0.4980392, 0, 1,
-1.328039, -1.515785, -0.1057764, 1, 0.5058824, 0, 1,
-1.326244, 1.539319, 0.3541088, 1, 0.509804, 0, 1,
-1.324482, 2.50846, 0.3619042, 1, 0.5176471, 0, 1,
-1.322643, -0.9284045, -4.318102, 1, 0.5215687, 0, 1,
-1.321095, -0.4436118, -2.427914, 1, 0.5294118, 0, 1,
-1.316443, -0.8635987, -1.867264, 1, 0.5333334, 0, 1,
-1.310292, -0.5053818, -0.3844957, 1, 0.5411765, 0, 1,
-1.304076, -0.756929, -1.416946, 1, 0.5450981, 0, 1,
-1.302768, 0.3073087, -3.122424, 1, 0.5529412, 0, 1,
-1.281968, 0.766939, -1.233835, 1, 0.5568628, 0, 1,
-1.273562, -0.2714155, -2.089655, 1, 0.5647059, 0, 1,
-1.258265, 0.9436698, 0.04313362, 1, 0.5686275, 0, 1,
-1.25047, -1.836532, -1.767747, 1, 0.5764706, 0, 1,
-1.247101, 0.6827737, -2.22124, 1, 0.5803922, 0, 1,
-1.24675, 0.5885799, -0.533101, 1, 0.5882353, 0, 1,
-1.231169, 0.09241027, -2.603614, 1, 0.5921569, 0, 1,
-1.229705, -0.2294141, -0.5291378, 1, 0.6, 0, 1,
-1.229378, -0.7036577, -2.037855, 1, 0.6078432, 0, 1,
-1.229173, -0.001346021, -2.445429, 1, 0.6117647, 0, 1,
-1.222546, 2.613244, -0.6370611, 1, 0.6196079, 0, 1,
-1.220743, 0.6786483, 0.7391989, 1, 0.6235294, 0, 1,
-1.212297, -1.009666, -1.904457, 1, 0.6313726, 0, 1,
-1.211646, 0.4904356, -2.013617, 1, 0.6352941, 0, 1,
-1.211218, -0.3314603, -3.911279, 1, 0.6431373, 0, 1,
-1.196614, 0.5597475, -2.745667, 1, 0.6470588, 0, 1,
-1.190514, -2.705525, -2.50636, 1, 0.654902, 0, 1,
-1.189192, -0.5336519, -1.739128, 1, 0.6588235, 0, 1,
-1.17953, 0.2473267, -1.675723, 1, 0.6666667, 0, 1,
-1.179002, 0.3266643, -1.595807, 1, 0.6705883, 0, 1,
-1.152986, -0.8515721, -2.801737, 1, 0.6784314, 0, 1,
-1.149079, -0.07273856, -1.833238, 1, 0.682353, 0, 1,
-1.146796, -1.804428, -1.859228, 1, 0.6901961, 0, 1,
-1.139364, -0.5963941, -2.235273, 1, 0.6941177, 0, 1,
-1.134636, 0.7160337, -2.230273, 1, 0.7019608, 0, 1,
-1.131265, 0.9712501, -0.2850348, 1, 0.7098039, 0, 1,
-1.130908, -1.210315, -2.556925, 1, 0.7137255, 0, 1,
-1.126555, 0.7889886, -0.831389, 1, 0.7215686, 0, 1,
-1.121032, 0.7211738, -1.84428, 1, 0.7254902, 0, 1,
-1.112719, -1.926841, -2.837089, 1, 0.7333333, 0, 1,
-1.107101, -0.8880336, -2.792018, 1, 0.7372549, 0, 1,
-1.106354, 0.7523414, -0.526129, 1, 0.7450981, 0, 1,
-1.10594, -0.1620181, -1.475271, 1, 0.7490196, 0, 1,
-1.096679, 0.3312327, -0.2438304, 1, 0.7568628, 0, 1,
-1.089658, 0.4980435, -1.197773, 1, 0.7607843, 0, 1,
-1.08745, 0.4510058, -0.4328317, 1, 0.7686275, 0, 1,
-1.080116, 1.778319, -0.2216352, 1, 0.772549, 0, 1,
-1.07708, -0.04813011, -1.76695, 1, 0.7803922, 0, 1,
-1.076442, 3.227276, -0.8614517, 1, 0.7843137, 0, 1,
-1.066302, 0.5420001, -2.322899, 1, 0.7921569, 0, 1,
-1.065446, 0.4183501, 0.6428534, 1, 0.7960784, 0, 1,
-1.057584, -0.2849264, -0.808321, 1, 0.8039216, 0, 1,
-1.056577, 0.9939424, -0.02459862, 1, 0.8117647, 0, 1,
-1.054225, 1.211311, -0.9170573, 1, 0.8156863, 0, 1,
-1.053432, 1.39242, -0.4028956, 1, 0.8235294, 0, 1,
-1.047453, -0.4773271, -3.244588, 1, 0.827451, 0, 1,
-1.047002, -0.8052137, -2.263874, 1, 0.8352941, 0, 1,
-1.045972, -0.4616123, -0.5335287, 1, 0.8392157, 0, 1,
-1.044906, -0.1339713, -3.304713, 1, 0.8470588, 0, 1,
-1.043627, -0.2110108, -2.754167, 1, 0.8509804, 0, 1,
-1.037802, -0.1242047, -2.638296, 1, 0.8588235, 0, 1,
-1.037177, 0.8834875, -1.69988, 1, 0.8627451, 0, 1,
-1.02965, 0.08976816, 0.2549468, 1, 0.8705882, 0, 1,
-1.025433, -0.2280896, -0.6771399, 1, 0.8745098, 0, 1,
-1.024495, -0.6029943, -3.010333, 1, 0.8823529, 0, 1,
-1.0192, -1.649407, -2.711504, 1, 0.8862745, 0, 1,
-1.016392, 0.918112, -1.590399, 1, 0.8941177, 0, 1,
-1.01537, -0.024687, -1.458363, 1, 0.8980392, 0, 1,
-1.013299, 0.1202917, -0.711148, 1, 0.9058824, 0, 1,
-1.009383, 0.6972377, 0.4296899, 1, 0.9137255, 0, 1,
-1.008518, 0.8820817, 0.1286388, 1, 0.9176471, 0, 1,
-0.9993589, -0.4203039, -2.479012, 1, 0.9254902, 0, 1,
-0.9988146, 0.07882874, -1.794006, 1, 0.9294118, 0, 1,
-0.9944493, 0.6672845, -0.1468645, 1, 0.9372549, 0, 1,
-0.9847782, -0.3959021, -0.3283357, 1, 0.9411765, 0, 1,
-0.9810358, 1.852039, -0.7021145, 1, 0.9490196, 0, 1,
-0.9804755, 0.7389838, 0.4507494, 1, 0.9529412, 0, 1,
-0.9798324, -0.188772, -1.550237, 1, 0.9607843, 0, 1,
-0.976599, 2.559617, 0.6190926, 1, 0.9647059, 0, 1,
-0.9708483, -1.606554, -2.190521, 1, 0.972549, 0, 1,
-0.9651923, 1.335198, -0.4439295, 1, 0.9764706, 0, 1,
-0.9622675, 0.2809899, -1.482639, 1, 0.9843137, 0, 1,
-0.9594415, -1.40652, -4.557572, 1, 0.9882353, 0, 1,
-0.9539959, 2.196914, -0.6215067, 1, 0.9960784, 0, 1,
-0.9536501, 0.7540281, -1.530335, 0.9960784, 1, 0, 1,
-0.9513034, -0.06174152, -3.415026, 0.9921569, 1, 0, 1,
-0.9419251, -1.072787, -3.858264, 0.9843137, 1, 0, 1,
-0.9342742, 1.204868, 1.146402, 0.9803922, 1, 0, 1,
-0.9280541, 1.328447, -0.07231921, 0.972549, 1, 0, 1,
-0.9167041, 0.2757758, -1.242904, 0.9686275, 1, 0, 1,
-0.9070642, 0.08417312, -0.8418566, 0.9607843, 1, 0, 1,
-0.9034858, -0.01191184, -2.693743, 0.9568627, 1, 0, 1,
-0.9026958, -0.6436052, -2.510734, 0.9490196, 1, 0, 1,
-0.8977253, 1.520728, -2.376061, 0.945098, 1, 0, 1,
-0.8960114, -1.43154, -2.957287, 0.9372549, 1, 0, 1,
-0.893328, -0.6588031, -4.717047, 0.9333333, 1, 0, 1,
-0.885218, -1.406114, -2.993089, 0.9254902, 1, 0, 1,
-0.8849148, 0.7318111, 0.2186034, 0.9215686, 1, 0, 1,
-0.883177, -0.1619887, -0.7405598, 0.9137255, 1, 0, 1,
-0.8770045, -0.1991398, -3.86077, 0.9098039, 1, 0, 1,
-0.8676429, -0.9980308, -3.039828, 0.9019608, 1, 0, 1,
-0.8628733, 2.713656, 1.115982, 0.8941177, 1, 0, 1,
-0.8615909, 0.2846427, -1.655022, 0.8901961, 1, 0, 1,
-0.8545604, -0.415832, -1.440156, 0.8823529, 1, 0, 1,
-0.8535582, 0.7097346, -0.1688526, 0.8784314, 1, 0, 1,
-0.8512089, -0.3907925, -1.296665, 0.8705882, 1, 0, 1,
-0.8492513, -0.2490553, -2.622051, 0.8666667, 1, 0, 1,
-0.8474607, -0.7255085, 0.2783777, 0.8588235, 1, 0, 1,
-0.8454239, 0.2219982, -1.836263, 0.854902, 1, 0, 1,
-0.8446775, 1.111111, 0.2874077, 0.8470588, 1, 0, 1,
-0.8421652, 0.6433418, -3.237729, 0.8431373, 1, 0, 1,
-0.8359725, 1.226493, -0.3858303, 0.8352941, 1, 0, 1,
-0.8335341, 0.8646812, 0.5234045, 0.8313726, 1, 0, 1,
-0.8165674, -2.057542, -3.369808, 0.8235294, 1, 0, 1,
-0.8145345, 0.8718979, 1.090813, 0.8196079, 1, 0, 1,
-0.8111217, -0.3179659, -1.197188, 0.8117647, 1, 0, 1,
-0.8108919, -0.4682167, -2.45044, 0.8078431, 1, 0, 1,
-0.8106105, 0.1757949, -0.3235085, 0.8, 1, 0, 1,
-0.80522, -0.5085846, -4.262426, 0.7921569, 1, 0, 1,
-0.8017867, -1.997961, -2.748246, 0.7882353, 1, 0, 1,
-0.801712, 0.1671151, -1.416593, 0.7803922, 1, 0, 1,
-0.7992426, 0.5388977, 1.074153, 0.7764706, 1, 0, 1,
-0.7948527, 0.1454475, -1.241258, 0.7686275, 1, 0, 1,
-0.7933805, -0.3907174, -1.833838, 0.7647059, 1, 0, 1,
-0.790852, 0.1868037, -0.9893274, 0.7568628, 1, 0, 1,
-0.7859712, 0.4856498, -1.027904, 0.7529412, 1, 0, 1,
-0.7837808, 0.1987663, 0.6963372, 0.7450981, 1, 0, 1,
-0.7829177, 0.8681735, -0.2786354, 0.7411765, 1, 0, 1,
-0.7680224, 1.754869, 0.4485561, 0.7333333, 1, 0, 1,
-0.7657506, -0.4875746, -1.835773, 0.7294118, 1, 0, 1,
-0.7591064, -0.5839368, -3.78295, 0.7215686, 1, 0, 1,
-0.7539981, -0.6210257, -2.683844, 0.7176471, 1, 0, 1,
-0.7463562, -1.328234, -1.484738, 0.7098039, 1, 0, 1,
-0.7416273, 1.29709, -1.138451, 0.7058824, 1, 0, 1,
-0.7397484, 0.8507528, 0.5876579, 0.6980392, 1, 0, 1,
-0.7376835, -0.4252765, -1.633903, 0.6901961, 1, 0, 1,
-0.7371173, 1.239919, 1.968532, 0.6862745, 1, 0, 1,
-0.7360492, -0.6395484, -2.965153, 0.6784314, 1, 0, 1,
-0.7299333, -0.6439118, -2.043284, 0.6745098, 1, 0, 1,
-0.7299117, 1.898022, -0.8854337, 0.6666667, 1, 0, 1,
-0.7252117, 1.941022, 0.135413, 0.6627451, 1, 0, 1,
-0.711053, -0.4241014, -3.323953, 0.654902, 1, 0, 1,
-0.7106125, 1.856494, -0.1774338, 0.6509804, 1, 0, 1,
-0.7093696, 1.100332, 1.369559, 0.6431373, 1, 0, 1,
-0.6974217, 0.7814638, -2.227949, 0.6392157, 1, 0, 1,
-0.697215, 0.6849546, -0.7501943, 0.6313726, 1, 0, 1,
-0.6933914, -0.4908671, -2.390738, 0.627451, 1, 0, 1,
-0.6926795, 0.5722939, -1.377423, 0.6196079, 1, 0, 1,
-0.6907667, 2.856963, 1.38555, 0.6156863, 1, 0, 1,
-0.6761878, -0.8799575, -1.585412, 0.6078432, 1, 0, 1,
-0.6747886, -0.6520776, -2.16435, 0.6039216, 1, 0, 1,
-0.6688386, 2.035689, -1.24522, 0.5960785, 1, 0, 1,
-0.6646329, 1.812942, 1.614056, 0.5882353, 1, 0, 1,
-0.6605793, 0.6198466, -1.481769, 0.5843138, 1, 0, 1,
-0.660459, 0.342664, 0.4757282, 0.5764706, 1, 0, 1,
-0.6514551, -0.4555052, -1.859974, 0.572549, 1, 0, 1,
-0.6475672, 1.778741, 1.129965, 0.5647059, 1, 0, 1,
-0.6472464, 1.616757, -0.4383292, 0.5607843, 1, 0, 1,
-0.6455367, 0.8959849, -2.158575, 0.5529412, 1, 0, 1,
-0.6452335, -1.585126, -2.937759, 0.5490196, 1, 0, 1,
-0.6447169, -0.6207392, -1.459744, 0.5411765, 1, 0, 1,
-0.6414594, 0.755502, -1.446385, 0.5372549, 1, 0, 1,
-0.6413003, -0.3768966, -1.805653, 0.5294118, 1, 0, 1,
-0.6406018, -0.9010284, -2.786934, 0.5254902, 1, 0, 1,
-0.6343302, 0.4266274, 0.465586, 0.5176471, 1, 0, 1,
-0.6334672, -0.1649707, -2.413976, 0.5137255, 1, 0, 1,
-0.6308353, 0.9370699, -1.553881, 0.5058824, 1, 0, 1,
-0.6303118, 1.073307, 1.787629, 0.5019608, 1, 0, 1,
-0.6270417, -2.469469, -2.682529, 0.4941176, 1, 0, 1,
-0.6214834, -0.6658314, -2.494363, 0.4862745, 1, 0, 1,
-0.6178859, -1.079855, -3.825683, 0.4823529, 1, 0, 1,
-0.6177658, -0.01342537, -2.722061, 0.4745098, 1, 0, 1,
-0.607116, 1.688645, -1.406744, 0.4705882, 1, 0, 1,
-0.605263, 0.4814636, -1.896827, 0.4627451, 1, 0, 1,
-0.6009589, 0.3133679, -0.7052713, 0.4588235, 1, 0, 1,
-0.5976883, -0.3287629, -2.442422, 0.4509804, 1, 0, 1,
-0.5974339, 2.067767, -0.1017505, 0.4470588, 1, 0, 1,
-0.5968435, 1.986325, -1.111547, 0.4392157, 1, 0, 1,
-0.5949258, -0.1410223, -0.7809793, 0.4352941, 1, 0, 1,
-0.5915124, -1.135404, -2.782217, 0.427451, 1, 0, 1,
-0.5888233, 0.4360675, -0.3381107, 0.4235294, 1, 0, 1,
-0.5870185, -0.5354899, -2.497283, 0.4156863, 1, 0, 1,
-0.584065, -1.932702, -3.1812, 0.4117647, 1, 0, 1,
-0.5795157, -0.2682467, -2.426574, 0.4039216, 1, 0, 1,
-0.5767314, 1.201923, -0.4444654, 0.3960784, 1, 0, 1,
-0.5746469, -0.5016165, -3.034751, 0.3921569, 1, 0, 1,
-0.5741156, 1.75568, -0.4357716, 0.3843137, 1, 0, 1,
-0.5691679, -0.1351438, -1.007973, 0.3803922, 1, 0, 1,
-0.5673769, 0.6773427, -1.169092, 0.372549, 1, 0, 1,
-0.5669429, -0.4824738, -3.011954, 0.3686275, 1, 0, 1,
-0.566187, 0.8079891, -1.549843, 0.3607843, 1, 0, 1,
-0.5654037, 0.9886209, -0.7964748, 0.3568628, 1, 0, 1,
-0.5615672, -1.646173, -3.159095, 0.3490196, 1, 0, 1,
-0.5589203, -2.021429, -2.202653, 0.345098, 1, 0, 1,
-0.5572531, 0.668201, -0.5767521, 0.3372549, 1, 0, 1,
-0.5572486, 0.9385247, -0.9436274, 0.3333333, 1, 0, 1,
-0.5571224, 0.3639938, -0.3472313, 0.3254902, 1, 0, 1,
-0.5557584, 0.6116459, 0.1305247, 0.3215686, 1, 0, 1,
-0.5531365, 0.9190713, 1.065211, 0.3137255, 1, 0, 1,
-0.5480172, -0.957903, -1.660628, 0.3098039, 1, 0, 1,
-0.5459085, -1.118348, -1.671775, 0.3019608, 1, 0, 1,
-0.5450482, 1.868021, -0.3964201, 0.2941177, 1, 0, 1,
-0.54174, 0.2389937, -0.5178191, 0.2901961, 1, 0, 1,
-0.5364702, -1.337917, -2.36565, 0.282353, 1, 0, 1,
-0.5356631, -0.6834301, -1.684495, 0.2784314, 1, 0, 1,
-0.5245073, 0.5862519, -0.9098103, 0.2705882, 1, 0, 1,
-0.5228415, -0.6062243, -3.551728, 0.2666667, 1, 0, 1,
-0.5200763, -0.9295491, -3.187258, 0.2588235, 1, 0, 1,
-0.5198594, 1.170331, -0.8398739, 0.254902, 1, 0, 1,
-0.5169662, -0.2991108, -2.181937, 0.2470588, 1, 0, 1,
-0.5140693, -0.3193076, -1.335568, 0.2431373, 1, 0, 1,
-0.5079787, 0.1771265, -0.9897321, 0.2352941, 1, 0, 1,
-0.4937397, -0.08503718, -0.8013747, 0.2313726, 1, 0, 1,
-0.4930475, -0.3005814, -2.29641, 0.2235294, 1, 0, 1,
-0.4925733, -1.155434, -1.076529, 0.2196078, 1, 0, 1,
-0.4906216, -0.07912751, -1.156876, 0.2117647, 1, 0, 1,
-0.4848378, 0.6588933, -0.8763471, 0.2078431, 1, 0, 1,
-0.4804401, -1.159013, -2.8206, 0.2, 1, 0, 1,
-0.4787821, -0.5698349, -2.443693, 0.1921569, 1, 0, 1,
-0.4775416, -0.4256462, -2.636758, 0.1882353, 1, 0, 1,
-0.4748722, -0.07930521, -1.751172, 0.1803922, 1, 0, 1,
-0.4732752, -0.5377325, -1.261203, 0.1764706, 1, 0, 1,
-0.4712934, -0.3047684, -3.530792, 0.1686275, 1, 0, 1,
-0.4709601, 0.2724406, -0.09425785, 0.1647059, 1, 0, 1,
-0.4682896, -0.3123959, -1.149712, 0.1568628, 1, 0, 1,
-0.467724, -0.4715548, -2.948684, 0.1529412, 1, 0, 1,
-0.4653256, -0.6304229, -2.657078, 0.145098, 1, 0, 1,
-0.4651934, 0.03428955, -1.120424, 0.1411765, 1, 0, 1,
-0.4629619, -1.170581, -2.384096, 0.1333333, 1, 0, 1,
-0.4615594, -0.1558796, -2.239483, 0.1294118, 1, 0, 1,
-0.4603952, 0.1144195, -0.6033908, 0.1215686, 1, 0, 1,
-0.4589, -0.8093697, -1.39139, 0.1176471, 1, 0, 1,
-0.4574673, -1.43892, -2.867545, 0.1098039, 1, 0, 1,
-0.4547295, 0.5435395, -1.045359, 0.1058824, 1, 0, 1,
-0.4546617, 0.0776229, -1.504956, 0.09803922, 1, 0, 1,
-0.4540146, -1.701407, -2.22894, 0.09019608, 1, 0, 1,
-0.4528894, 0.06322344, -1.755521, 0.08627451, 1, 0, 1,
-0.4483852, -1.035389, -2.301142, 0.07843138, 1, 0, 1,
-0.4467695, -1.058209, -2.579221, 0.07450981, 1, 0, 1,
-0.4425704, 1.406914, -1.218825, 0.06666667, 1, 0, 1,
-0.4424229, -0.1696659, -2.43965, 0.0627451, 1, 0, 1,
-0.436394, 0.7077422, -1.422926, 0.05490196, 1, 0, 1,
-0.4299665, 0.3983308, -0.001702347, 0.05098039, 1, 0, 1,
-0.4294259, 0.779834, 0.9438832, 0.04313726, 1, 0, 1,
-0.4276797, 1.185531, -0.1493254, 0.03921569, 1, 0, 1,
-0.427397, -0.9147627, -3.195436, 0.03137255, 1, 0, 1,
-0.4201314, 1.327454, 0.2340982, 0.02745098, 1, 0, 1,
-0.4196557, -1.810348, -2.467581, 0.01960784, 1, 0, 1,
-0.4160677, 0.6391082, -1.330523, 0.01568628, 1, 0, 1,
-0.4153594, -2.698396, -2.032032, 0.007843138, 1, 0, 1,
-0.4118081, -0.3062783, -0.8154703, 0.003921569, 1, 0, 1,
-0.407213, 0.4343151, -0.003407001, 0, 1, 0.003921569, 1,
-0.4057432, -1.210952, -3.908107, 0, 1, 0.01176471, 1,
-0.4033394, -0.544486, -2.695471, 0, 1, 0.01568628, 1,
-0.3985753, 0.581189, -0.7642784, 0, 1, 0.02352941, 1,
-0.3903949, -0.8968539, -2.110193, 0, 1, 0.02745098, 1,
-0.3897668, -0.4380822, -1.628087, 0, 1, 0.03529412, 1,
-0.3891294, -1.172176, -2.167064, 0, 1, 0.03921569, 1,
-0.3791533, -0.8962955, -3.446581, 0, 1, 0.04705882, 1,
-0.3762734, 0.1419113, -1.854351, 0, 1, 0.05098039, 1,
-0.3751254, -0.260457, -1.955278, 0, 1, 0.05882353, 1,
-0.3718439, 1.152951, 0.6069186, 0, 1, 0.0627451, 1,
-0.369588, -0.8281773, -1.936611, 0, 1, 0.07058824, 1,
-0.3648552, -0.02380243, -1.401767, 0, 1, 0.07450981, 1,
-0.3615329, 0.5885288, 0.573945, 0, 1, 0.08235294, 1,
-0.3543941, 0.6592476, -0.3049104, 0, 1, 0.08627451, 1,
-0.3528725, -0.89722, -3.154276, 0, 1, 0.09411765, 1,
-0.3478578, -1.175099, -3.666215, 0, 1, 0.1019608, 1,
-0.3476325, -0.8630978, -1.221475, 0, 1, 0.1058824, 1,
-0.3411224, 1.665082, -0.2124474, 0, 1, 0.1137255, 1,
-0.3381613, -0.4788236, -1.894706, 0, 1, 0.1176471, 1,
-0.3327139, -0.9729073, -4.803599, 0, 1, 0.1254902, 1,
-0.3325729, 0.8989916, -0.4265386, 0, 1, 0.1294118, 1,
-0.3298871, 0.5324539, 0.3724464, 0, 1, 0.1372549, 1,
-0.3249484, -0.0220258, -0.8408083, 0, 1, 0.1411765, 1,
-0.3192748, 1.381456, -0.2565477, 0, 1, 0.1490196, 1,
-0.3191681, 0.8069724, -0.3816404, 0, 1, 0.1529412, 1,
-0.3178439, 0.3055852, -1.094312, 0, 1, 0.1607843, 1,
-0.3166882, 0.6765782, 0.2705239, 0, 1, 0.1647059, 1,
-0.3056763, -0.1184649, -2.429357, 0, 1, 0.172549, 1,
-0.3042907, -1.100949, -3.788968, 0, 1, 0.1764706, 1,
-0.3015876, 1.658459, 1.942528, 0, 1, 0.1843137, 1,
-0.3006538, -0.4846724, -2.773227, 0, 1, 0.1882353, 1,
-0.2980134, 0.2282547, -1.101737, 0, 1, 0.1960784, 1,
-0.2964654, 0.6520593, -1.617654, 0, 1, 0.2039216, 1,
-0.2926079, -0.2312354, -3.424443, 0, 1, 0.2078431, 1,
-0.2840682, -0.4533321, -1.441653, 0, 1, 0.2156863, 1,
-0.2816959, 1.560939, -1.322733, 0, 1, 0.2196078, 1,
-0.2816889, -0.1154571, -3.093992, 0, 1, 0.227451, 1,
-0.2752965, -1.026308, -2.583858, 0, 1, 0.2313726, 1,
-0.2739487, 0.5287092, 0.4983875, 0, 1, 0.2392157, 1,
-0.2727189, 1.437931, -0.5773866, 0, 1, 0.2431373, 1,
-0.2720663, -0.5330865, -3.266837, 0, 1, 0.2509804, 1,
-0.2658283, -0.9274885, -1.720105, 0, 1, 0.254902, 1,
-0.2634005, 0.8503212, -0.07317772, 0, 1, 0.2627451, 1,
-0.2590222, 1.396265, -0.01072601, 0, 1, 0.2666667, 1,
-0.2573256, -1.511428, -4.368778, 0, 1, 0.2745098, 1,
-0.253237, 1.720335, -0.8591782, 0, 1, 0.2784314, 1,
-0.25171, -1.454483, -4.068798, 0, 1, 0.2862745, 1,
-0.2516617, 0.2882552, -0.5724704, 0, 1, 0.2901961, 1,
-0.2504212, -1.084803, -2.111257, 0, 1, 0.2980392, 1,
-0.2476475, 0.9887009, -0.5361578, 0, 1, 0.3058824, 1,
-0.2473921, -0.8585832, -2.811347, 0, 1, 0.3098039, 1,
-0.2464951, -1.104715, -3.863129, 0, 1, 0.3176471, 1,
-0.2312916, -0.1602849, -1.337964, 0, 1, 0.3215686, 1,
-0.2290075, -1.209538, -2.326519, 0, 1, 0.3294118, 1,
-0.2240534, 0.8475404, 1.047606, 0, 1, 0.3333333, 1,
-0.2207909, 0.6243768, -0.5467042, 0, 1, 0.3411765, 1,
-0.2194397, 0.6881742, -1.541416, 0, 1, 0.345098, 1,
-0.2160904, 0.3756518, -0.3354558, 0, 1, 0.3529412, 1,
-0.2144406, -2.780159, -1.091811, 0, 1, 0.3568628, 1,
-0.213556, -0.6684142, -3.964482, 0, 1, 0.3647059, 1,
-0.21113, -0.600194, -2.632369, 0, 1, 0.3686275, 1,
-0.204766, -0.6094111, -5.193233, 0, 1, 0.3764706, 1,
-0.1934692, -0.2919374, -2.355318, 0, 1, 0.3803922, 1,
-0.1921921, -2.304567, -4.303201, 0, 1, 0.3882353, 1,
-0.1919391, -1.132781, -4.357857, 0, 1, 0.3921569, 1,
-0.1872071, -0.4246, -1.424665, 0, 1, 0.4, 1,
-0.1867662, -0.07767832, -2.786518, 0, 1, 0.4078431, 1,
-0.1804577, -0.143162, -3.543255, 0, 1, 0.4117647, 1,
-0.178807, -0.913309, -2.948185, 0, 1, 0.4196078, 1,
-0.1757569, -0.626228, -4.066854, 0, 1, 0.4235294, 1,
-0.1757304, -0.3144255, -2.659053, 0, 1, 0.4313726, 1,
-0.1735398, 0.1823896, 1.309651, 0, 1, 0.4352941, 1,
-0.1733278, 0.9918358, -0.24869, 0, 1, 0.4431373, 1,
-0.1692954, -2.339544, -1.889515, 0, 1, 0.4470588, 1,
-0.1623421, 1.065986, 1.048284, 0, 1, 0.454902, 1,
-0.1610813, 0.8290961, -0.2026642, 0, 1, 0.4588235, 1,
-0.1593071, -1.507306, -2.639126, 0, 1, 0.4666667, 1,
-0.1575922, 0.01864821, -1.492121, 0, 1, 0.4705882, 1,
-0.1489568, 0.2617322, 0.6285302, 0, 1, 0.4784314, 1,
-0.147598, -0.8253744, -3.114996, 0, 1, 0.4823529, 1,
-0.1446525, 0.3073274, -0.6770361, 0, 1, 0.4901961, 1,
-0.1415034, -0.9701571, -1.210958, 0, 1, 0.4941176, 1,
-0.1284831, 1.257112, -0.1217225, 0, 1, 0.5019608, 1,
-0.1283581, -0.5383372, -2.245018, 0, 1, 0.509804, 1,
-0.123677, -0.1876111, -1.716395, 0, 1, 0.5137255, 1,
-0.1196515, -0.1377302, 0.3352462, 0, 1, 0.5215687, 1,
-0.1165894, 0.4690611, 2.310216, 0, 1, 0.5254902, 1,
-0.1074475, 0.6149321, 0.3067655, 0, 1, 0.5333334, 1,
-0.1005691, 0.472721, -0.2717627, 0, 1, 0.5372549, 1,
-0.09997475, -0.507371, -3.640994, 0, 1, 0.5450981, 1,
-0.09893116, -1.486098, -1.698563, 0, 1, 0.5490196, 1,
-0.09763196, -2.900663, -5.325667, 0, 1, 0.5568628, 1,
-0.09669788, 0.2056766, -0.8277589, 0, 1, 0.5607843, 1,
-0.09635977, 0.4594709, 0.8600572, 0, 1, 0.5686275, 1,
-0.09606971, 1.187654, -2.973288, 0, 1, 0.572549, 1,
-0.0951784, 1.172932, 0.3893579, 0, 1, 0.5803922, 1,
-0.09452836, 1.829358, -0.8846125, 0, 1, 0.5843138, 1,
-0.09001531, -1.085556, -3.228178, 0, 1, 0.5921569, 1,
-0.08686146, 0.777307, -0.0641022, 0, 1, 0.5960785, 1,
-0.08235724, -0.2914004, -3.094007, 0, 1, 0.6039216, 1,
-0.08090387, 0.3001362, -0.01825864, 0, 1, 0.6117647, 1,
-0.08021012, -0.1676859, -2.407379, 0, 1, 0.6156863, 1,
-0.07550737, -0.5728378, -2.031674, 0, 1, 0.6235294, 1,
-0.07465409, 0.756735, 0.2298097, 0, 1, 0.627451, 1,
-0.07392215, -0.3506857, -2.563923, 0, 1, 0.6352941, 1,
-0.07363965, 0.2366686, -1.040152, 0, 1, 0.6392157, 1,
-0.06807295, -1.337742, -3.303123, 0, 1, 0.6470588, 1,
-0.06759166, 0.6323207, 1.677508, 0, 1, 0.6509804, 1,
-0.06489387, 0.6566944, -0.1746739, 0, 1, 0.6588235, 1,
-0.0647912, 0.09826541, 0.3629926, 0, 1, 0.6627451, 1,
-0.06375396, 1.118267, 0.3906793, 0, 1, 0.6705883, 1,
-0.06048995, 1.03534, -0.2101563, 0, 1, 0.6745098, 1,
-0.05930519, -1.101006, -3.733025, 0, 1, 0.682353, 1,
-0.05881563, 0.7021303, 0.8131028, 0, 1, 0.6862745, 1,
-0.05807886, -0.9516191, -3.017242, 0, 1, 0.6941177, 1,
-0.05121538, -0.1620687, -4.991054, 0, 1, 0.7019608, 1,
-0.04527086, 0.4094318, 1.185995, 0, 1, 0.7058824, 1,
-0.04048097, -1.433006, -2.974092, 0, 1, 0.7137255, 1,
-0.03963665, -1.411751, -3.791649, 0, 1, 0.7176471, 1,
-0.03876493, -1.083221, -4.019081, 0, 1, 0.7254902, 1,
-0.03852917, -0.6979942, -3.356266, 0, 1, 0.7294118, 1,
-0.02793024, 0.5373827, -0.4331369, 0, 1, 0.7372549, 1,
-0.02674487, 0.1548493, -0.1671005, 0, 1, 0.7411765, 1,
-0.0250604, 1.609917, -0.6510451, 0, 1, 0.7490196, 1,
-0.02379497, -1.531971, -1.998013, 0, 1, 0.7529412, 1,
-0.02320003, 0.4420646, -0.2860786, 0, 1, 0.7607843, 1,
-0.01280095, -0.6968166, -2.674591, 0, 1, 0.7647059, 1,
-0.01197, -0.1773894, -3.4232, 0, 1, 0.772549, 1,
-0.009489382, -0.3636487, -1.894909, 0, 1, 0.7764706, 1,
-0.006584537, 0.5414553, -0.7725884, 0, 1, 0.7843137, 1,
0.002517061, -2.195352, 2.716101, 0, 1, 0.7882353, 1,
0.003230095, 0.359782, -0.1208295, 0, 1, 0.7960784, 1,
0.003375581, -0.8153775, 3.770006, 0, 1, 0.8039216, 1,
0.004023971, 0.4479664, -0.2434648, 0, 1, 0.8078431, 1,
0.007002512, 0.7505202, -1.271599, 0, 1, 0.8156863, 1,
0.01286486, -0.4727706, 5.192264, 0, 1, 0.8196079, 1,
0.01939848, -0.7861258, 3.360706, 0, 1, 0.827451, 1,
0.02160983, 0.2096477, 1.414089, 0, 1, 0.8313726, 1,
0.02330672, 1.015084, -1.309443, 0, 1, 0.8392157, 1,
0.03523509, -0.5168018, 2.144564, 0, 1, 0.8431373, 1,
0.03949522, -0.8134664, 3.510888, 0, 1, 0.8509804, 1,
0.04093572, -1.365769, 3.404948, 0, 1, 0.854902, 1,
0.04466517, 1.236353, -0.4105894, 0, 1, 0.8627451, 1,
0.04534725, 2.041551, 0.3026492, 0, 1, 0.8666667, 1,
0.04581777, 1.841423, -1.203792, 0, 1, 0.8745098, 1,
0.04692088, -0.1404926, 2.904315, 0, 1, 0.8784314, 1,
0.04769018, 0.7815704, 1.177752, 0, 1, 0.8862745, 1,
0.04783886, -0.3107863, 2.55669, 0, 1, 0.8901961, 1,
0.04966133, 0.2298482, -0.2750778, 0, 1, 0.8980392, 1,
0.0497513, -0.5398946, 2.759716, 0, 1, 0.9058824, 1,
0.0508201, -1.131453, 2.003343, 0, 1, 0.9098039, 1,
0.05115891, 0.267256, 1.229605, 0, 1, 0.9176471, 1,
0.05144231, 0.6559637, 1.466733, 0, 1, 0.9215686, 1,
0.05419453, 0.4788009, 0.4551751, 0, 1, 0.9294118, 1,
0.05443304, 2.119053, 1.176791, 0, 1, 0.9333333, 1,
0.06232459, 0.6546294, 1.256493, 0, 1, 0.9411765, 1,
0.06390654, -0.2819752, 4.269802, 0, 1, 0.945098, 1,
0.06391658, -0.4880367, 4.738302, 0, 1, 0.9529412, 1,
0.06571193, -0.3519478, 2.29572, 0, 1, 0.9568627, 1,
0.06659396, 0.5128692, 0.1011579, 0, 1, 0.9647059, 1,
0.07174923, -0.8863389, 2.201696, 0, 1, 0.9686275, 1,
0.07334801, -0.179342, 1.740248, 0, 1, 0.9764706, 1,
0.07659706, 0.3447848, -0.4684722, 0, 1, 0.9803922, 1,
0.07815901, -0.6613319, 2.48685, 0, 1, 0.9882353, 1,
0.08244725, 1.012712, -0.03244626, 0, 1, 0.9921569, 1,
0.08891805, -0.1858843, 1.579179, 0, 1, 1, 1,
0.09099393, 1.2982, 0.4018083, 0, 0.9921569, 1, 1,
0.09124375, 0.7683795, -1.167246, 0, 0.9882353, 1, 1,
0.09172872, -0.4996247, 1.908078, 0, 0.9803922, 1, 1,
0.09301217, 0.490373, 0.2598384, 0, 0.9764706, 1, 1,
0.09523822, 0.2139272, 1.298007, 0, 0.9686275, 1, 1,
0.09595107, 1.208463, -0.1369247, 0, 0.9647059, 1, 1,
0.09892044, -0.6241106, 2.801084, 0, 0.9568627, 1, 1,
0.1004847, -0.3850856, 2.820617, 0, 0.9529412, 1, 1,
0.1014462, 0.9850398, 1.249837, 0, 0.945098, 1, 1,
0.1024547, -1.665933, 2.225647, 0, 0.9411765, 1, 1,
0.102863, 0.8270437, -1.029858, 0, 0.9333333, 1, 1,
0.1035545, 0.128831, 2.666213, 0, 0.9294118, 1, 1,
0.1086342, 0.8674073, 0.07339249, 0, 0.9215686, 1, 1,
0.1087915, 1.272922, -2.525527, 0, 0.9176471, 1, 1,
0.1119397, 1.379628, 0.0530413, 0, 0.9098039, 1, 1,
0.1124299, -0.4129185, 3.399402, 0, 0.9058824, 1, 1,
0.1126418, -2.064549, 0.7719919, 0, 0.8980392, 1, 1,
0.1128826, -0.0749855, 2.795487, 0, 0.8901961, 1, 1,
0.1135948, 0.00464798, 2.14257, 0, 0.8862745, 1, 1,
0.1154759, 1.188551, -0.6079917, 0, 0.8784314, 1, 1,
0.1155381, 1.301423, -0.2969224, 0, 0.8745098, 1, 1,
0.1244482, -0.5930921, 3.207896, 0, 0.8666667, 1, 1,
0.128099, 0.5534546, 0.580978, 0, 0.8627451, 1, 1,
0.1290959, -0.3807326, 3.752883, 0, 0.854902, 1, 1,
0.1342987, -0.8236202, 2.460267, 0, 0.8509804, 1, 1,
0.1347668, -1.619363, 3.386693, 0, 0.8431373, 1, 1,
0.1358563, -0.01977404, 3.189567, 0, 0.8392157, 1, 1,
0.1383171, -0.1827644, 2.9713, 0, 0.8313726, 1, 1,
0.1398239, -1.142926, 3.329695, 0, 0.827451, 1, 1,
0.1402236, 0.2828416, 1.364638, 0, 0.8196079, 1, 1,
0.1426815, -0.1320058, 3.091081, 0, 0.8156863, 1, 1,
0.1430206, -1.80495, 3.049105, 0, 0.8078431, 1, 1,
0.1458443, 0.4237338, -1.464698, 0, 0.8039216, 1, 1,
0.151213, 1.760487, -0.9887922, 0, 0.7960784, 1, 1,
0.1518664, 0.304135, 0.2195968, 0, 0.7882353, 1, 1,
0.1551209, 0.1312508, 1.144204, 0, 0.7843137, 1, 1,
0.1554857, -1.940469, 3.848173, 0, 0.7764706, 1, 1,
0.1565186, 0.1455323, 1.33009, 0, 0.772549, 1, 1,
0.1567151, 0.4641728, 1.549764, 0, 0.7647059, 1, 1,
0.1604254, -0.3364749, 3.513286, 0, 0.7607843, 1, 1,
0.1655352, -0.4773193, 2.105515, 0, 0.7529412, 1, 1,
0.1669827, 0.04505932, 1.557988, 0, 0.7490196, 1, 1,
0.1673974, 0.3967965, 1.589342, 0, 0.7411765, 1, 1,
0.1675353, -1.776119, 3.025366, 0, 0.7372549, 1, 1,
0.1678979, -0.2059922, 1.690463, 0, 0.7294118, 1, 1,
0.1732484, 0.8363047, 0.03198757, 0, 0.7254902, 1, 1,
0.1739355, -1.555869, 2.669191, 0, 0.7176471, 1, 1,
0.1741635, -0.8263294, 3.471518, 0, 0.7137255, 1, 1,
0.1753404, 0.7497406, 0.4166748, 0, 0.7058824, 1, 1,
0.1764323, -0.3464247, 1.346721, 0, 0.6980392, 1, 1,
0.1766061, -1.337602, 4.156855, 0, 0.6941177, 1, 1,
0.177301, -0.4336492, 2.092368, 0, 0.6862745, 1, 1,
0.1869698, -1.213348, 3.452338, 0, 0.682353, 1, 1,
0.1988164, 0.3867703, 1.776168, 0, 0.6745098, 1, 1,
0.2003394, -1.905613, 1.152774, 0, 0.6705883, 1, 1,
0.2008864, 0.9666331, -0.1712651, 0, 0.6627451, 1, 1,
0.2033909, -1.11676, 1.985776, 0, 0.6588235, 1, 1,
0.2039378, -0.3074697, 4.236638, 0, 0.6509804, 1, 1,
0.2055022, 0.2237321, 1.554347, 0, 0.6470588, 1, 1,
0.2072885, -1.188795, 3.350673, 0, 0.6392157, 1, 1,
0.2087425, 0.07092125, 0.5758795, 0, 0.6352941, 1, 1,
0.2117838, 1.899852, 0.6056933, 0, 0.627451, 1, 1,
0.2146709, 0.346104, 1.217883, 0, 0.6235294, 1, 1,
0.215535, 0.5601698, -0.369332, 0, 0.6156863, 1, 1,
0.2190197, -0.2322263, 3.713815, 0, 0.6117647, 1, 1,
0.2190263, -1.201422, 1.626053, 0, 0.6039216, 1, 1,
0.2192211, 0.5332224, -1.89503, 0, 0.5960785, 1, 1,
0.2228334, 1.206655, -1.19694, 0, 0.5921569, 1, 1,
0.2268324, -1.41665, 1.662449, 0, 0.5843138, 1, 1,
0.2315161, -0.4523585, 3.028192, 0, 0.5803922, 1, 1,
0.2318456, 0.8055536, -0.1764659, 0, 0.572549, 1, 1,
0.2336651, -0.8991323, 2.334928, 0, 0.5686275, 1, 1,
0.2385134, 0.6339257, 0.8440614, 0, 0.5607843, 1, 1,
0.2394303, -0.03408514, 0.06093933, 0, 0.5568628, 1, 1,
0.2429723, -1.338347, 3.325164, 0, 0.5490196, 1, 1,
0.2494601, -1.492025, 3.76968, 0, 0.5450981, 1, 1,
0.2523324, -1.220135, 3.607544, 0, 0.5372549, 1, 1,
0.2567258, -0.6635968, 1.496062, 0, 0.5333334, 1, 1,
0.2574143, -0.3089998, 3.03961, 0, 0.5254902, 1, 1,
0.2583545, -0.3600071, 3.277715, 0, 0.5215687, 1, 1,
0.2585913, -0.3977135, 3.021408, 0, 0.5137255, 1, 1,
0.2594973, -1.429382, 3.246704, 0, 0.509804, 1, 1,
0.2621075, -0.4101602, 4.084388, 0, 0.5019608, 1, 1,
0.2643384, -0.8728017, 2.593845, 0, 0.4941176, 1, 1,
0.264653, 0.4429224, 0.3753068, 0, 0.4901961, 1, 1,
0.2665474, 0.0756047, -0.377566, 0, 0.4823529, 1, 1,
0.2694185, -0.4921063, 3.161236, 0, 0.4784314, 1, 1,
0.2695105, -1.047963, 1.923798, 0, 0.4705882, 1, 1,
0.2759952, 0.2133887, 1.533247, 0, 0.4666667, 1, 1,
0.2826848, 0.4338936, 1.562659, 0, 0.4588235, 1, 1,
0.2838348, -0.5089843, 2.140217, 0, 0.454902, 1, 1,
0.2884909, -0.7768113, 2.528008, 0, 0.4470588, 1, 1,
0.2903738, -1.221602, 3.018188, 0, 0.4431373, 1, 1,
0.2953557, -0.4088808, 2.496544, 0, 0.4352941, 1, 1,
0.2957001, -0.01109604, 2.471641, 0, 0.4313726, 1, 1,
0.2958644, 1.186367, 0.1557619, 0, 0.4235294, 1, 1,
0.3138597, 0.2210525, 1.133074, 0, 0.4196078, 1, 1,
0.3188841, 2.045279, 0.5437083, 0, 0.4117647, 1, 1,
0.3194025, 1.200008, 0.6363067, 0, 0.4078431, 1, 1,
0.3217391, -0.1279357, 0.4428057, 0, 0.4, 1, 1,
0.3235326, -0.4475775, 1.813634, 0, 0.3921569, 1, 1,
0.3270371, 0.6537808, -0.5130248, 0, 0.3882353, 1, 1,
0.3282778, 0.6550542, -0.1667139, 0, 0.3803922, 1, 1,
0.3283685, -0.5809079, 2.304793, 0, 0.3764706, 1, 1,
0.3312027, 0.7999981, 0.649209, 0, 0.3686275, 1, 1,
0.3332339, 0.07383486, 1.111282, 0, 0.3647059, 1, 1,
0.3334389, -1.341826, 2.626857, 0, 0.3568628, 1, 1,
0.3338206, -1.136971, 0.630193, 0, 0.3529412, 1, 1,
0.3372907, 1.496803, -1.86556, 0, 0.345098, 1, 1,
0.3416385, 0.9988477, -0.4382314, 0, 0.3411765, 1, 1,
0.3427743, -1.360615, 3.191849, 0, 0.3333333, 1, 1,
0.3438686, -0.1574705, 1.010671, 0, 0.3294118, 1, 1,
0.3495498, 1.767691, -0.6098027, 0, 0.3215686, 1, 1,
0.3522396, 0.1144927, -0.03207153, 0, 0.3176471, 1, 1,
0.3554927, -1.956113, 4.145075, 0, 0.3098039, 1, 1,
0.3557401, -0.03831822, 1.723816, 0, 0.3058824, 1, 1,
0.3580557, 1.326529, -0.8927236, 0, 0.2980392, 1, 1,
0.3586157, 1.368152, -1.494573, 0, 0.2901961, 1, 1,
0.3594453, 0.01067736, 1.558213, 0, 0.2862745, 1, 1,
0.3617847, 0.2174534, 2.924812, 0, 0.2784314, 1, 1,
0.3696325, 1.121818, 1.459939, 0, 0.2745098, 1, 1,
0.3779185, 0.1297734, 1.063156, 0, 0.2666667, 1, 1,
0.387321, 0.61493, -0.04139111, 0, 0.2627451, 1, 1,
0.3886087, -1.061989, 4.074829, 0, 0.254902, 1, 1,
0.3915405, -0.02241456, 1.228529, 0, 0.2509804, 1, 1,
0.3916821, -0.02854252, 0.05246247, 0, 0.2431373, 1, 1,
0.3917064, 2.23819, 1.578828, 0, 0.2392157, 1, 1,
0.397756, -1.615104, 3.642403, 0, 0.2313726, 1, 1,
0.398128, 1.078938, 1.284152, 0, 0.227451, 1, 1,
0.4000951, -1.207947, 2.527183, 0, 0.2196078, 1, 1,
0.4037506, -0.4020504, 2.899009, 0, 0.2156863, 1, 1,
0.4057361, -0.4021399, 1.42192, 0, 0.2078431, 1, 1,
0.4058945, 0.1022473, -0.1264309, 0, 0.2039216, 1, 1,
0.405991, -0.6089886, 3.716784, 0, 0.1960784, 1, 1,
0.4070858, 1.018715, 1.117875, 0, 0.1882353, 1, 1,
0.4083829, 0.3002815, -0.8190464, 0, 0.1843137, 1, 1,
0.4159294, -0.1858698, 0.3657878, 0, 0.1764706, 1, 1,
0.4181417, -0.003615423, 1.378691, 0, 0.172549, 1, 1,
0.4207928, 0.4448262, 1.108869, 0, 0.1647059, 1, 1,
0.4235539, 0.9414797, 0.08593446, 0, 0.1607843, 1, 1,
0.4290237, 1.030306, 0.5570806, 0, 0.1529412, 1, 1,
0.4327513, -0.3134167, 1.464448, 0, 0.1490196, 1, 1,
0.4334833, 0.7419795, -0.7492787, 0, 0.1411765, 1, 1,
0.4360309, -0.06728576, 2.342587, 0, 0.1372549, 1, 1,
0.4365513, -0.03342136, 1.546153, 0, 0.1294118, 1, 1,
0.4382567, -0.4153967, 4.029768, 0, 0.1254902, 1, 1,
0.4396773, 1.11431, -0.6395674, 0, 0.1176471, 1, 1,
0.4438182, 0.7619171, 0.718449, 0, 0.1137255, 1, 1,
0.4534966, 0.6757765, 0.6749212, 0, 0.1058824, 1, 1,
0.4543923, 1.328767, -0.6701603, 0, 0.09803922, 1, 1,
0.4572473, -1.205864, 3.24088, 0, 0.09411765, 1, 1,
0.4584982, -0.0004924297, 1.102869, 0, 0.08627451, 1, 1,
0.4594476, -2.201692, 2.558155, 0, 0.08235294, 1, 1,
0.4600986, 0.1752836, 3.063805, 0, 0.07450981, 1, 1,
0.4617101, 1.004348, 0.9267447, 0, 0.07058824, 1, 1,
0.4623046, 0.9360293, -0.9434327, 0, 0.0627451, 1, 1,
0.4707681, -1.985927, 4.549557, 0, 0.05882353, 1, 1,
0.4715062, 1.728124, 0.4773146, 0, 0.05098039, 1, 1,
0.4741947, -0.5979659, 0.4192942, 0, 0.04705882, 1, 1,
0.4763385, 1.307763, 0.2745117, 0, 0.03921569, 1, 1,
0.4798754, 1.146324, 0.563135, 0, 0.03529412, 1, 1,
0.4850397, -0.6474213, 1.306197, 0, 0.02745098, 1, 1,
0.4857562, 0.6748905, 0.2482718, 0, 0.02352941, 1, 1,
0.4858123, 1.084445, -0.06370618, 0, 0.01568628, 1, 1,
0.4876559, 0.2144338, -0.460752, 0, 0.01176471, 1, 1,
0.4920731, 2.113471, 0.6209427, 0, 0.003921569, 1, 1,
0.4922014, 0.07170291, 1.342005, 0.003921569, 0, 1, 1,
0.4937201, 1.932663, 0.4372633, 0.007843138, 0, 1, 1,
0.4964879, -0.4910423, 1.795865, 0.01568628, 0, 1, 1,
0.5011287, -0.3876045, 1.154702, 0.01960784, 0, 1, 1,
0.5051624, 0.7903379, 0.6508595, 0.02745098, 0, 1, 1,
0.5051971, -0.02410792, 0.3112585, 0.03137255, 0, 1, 1,
0.5065153, 1.499097, -0.1630062, 0.03921569, 0, 1, 1,
0.5092284, -0.2089808, 1.746619, 0.04313726, 0, 1, 1,
0.513382, -1.349748, 3.073671, 0.05098039, 0, 1, 1,
0.5224497, 0.1873226, 1.241543, 0.05490196, 0, 1, 1,
0.5244421, 0.1336306, 2.110558, 0.0627451, 0, 1, 1,
0.5246584, 0.8745558, 1.8318, 0.06666667, 0, 1, 1,
0.5286104, 0.3118626, -0.07744111, 0.07450981, 0, 1, 1,
0.5290641, -2.897679, 1.806195, 0.07843138, 0, 1, 1,
0.5319247, 0.3141857, 0.3894737, 0.08627451, 0, 1, 1,
0.5325252, 0.7749453, 1.406856, 0.09019608, 0, 1, 1,
0.5351933, -1.237406, 2.688882, 0.09803922, 0, 1, 1,
0.5393028, 0.03341495, 0.8879071, 0.1058824, 0, 1, 1,
0.5495735, 0.09328375, 1.705266, 0.1098039, 0, 1, 1,
0.5511299, 0.1914495, 1.054314, 0.1176471, 0, 1, 1,
0.5514516, -1.30121, 1.656017, 0.1215686, 0, 1, 1,
0.5522588, 1.195966, 0.9104832, 0.1294118, 0, 1, 1,
0.5524845, -1.806523, 3.9604, 0.1333333, 0, 1, 1,
0.5542803, 0.3498789, 0.5530407, 0.1411765, 0, 1, 1,
0.5558475, -1.225138, 3.43267, 0.145098, 0, 1, 1,
0.5601512, -1.905499, 2.30805, 0.1529412, 0, 1, 1,
0.5612845, -0.1348951, 1.535202, 0.1568628, 0, 1, 1,
0.5661183, 0.4667838, 0.774232, 0.1647059, 0, 1, 1,
0.5667714, -0.307628, 4.133518, 0.1686275, 0, 1, 1,
0.5715066, -0.5779548, 1.937819, 0.1764706, 0, 1, 1,
0.5769126, 0.4155033, 0.669261, 0.1803922, 0, 1, 1,
0.5862644, 0.3711723, 0.2414074, 0.1882353, 0, 1, 1,
0.5924096, -1.148577, 2.420149, 0.1921569, 0, 1, 1,
0.6001567, 1.161225, -0.7471349, 0.2, 0, 1, 1,
0.6001951, -0.3854774, 2.909547, 0.2078431, 0, 1, 1,
0.6005248, -0.8112743, 0.5042753, 0.2117647, 0, 1, 1,
0.6016765, 1.029792, 0.3409253, 0.2196078, 0, 1, 1,
0.6082324, 0.9508744, 0.7301315, 0.2235294, 0, 1, 1,
0.614013, -1.078162, 3.167801, 0.2313726, 0, 1, 1,
0.6169279, -1.061784, 2.271116, 0.2352941, 0, 1, 1,
0.6214999, 1.578256, -1.400022, 0.2431373, 0, 1, 1,
0.6291056, 0.0913609, 2.593903, 0.2470588, 0, 1, 1,
0.6311815, -0.8925864, 3.706622, 0.254902, 0, 1, 1,
0.6365474, -0.3964715, 3.733185, 0.2588235, 0, 1, 1,
0.6368378, -0.7288986, 2.254707, 0.2666667, 0, 1, 1,
0.6388211, -0.1218685, 2.651196, 0.2705882, 0, 1, 1,
0.6400797, -0.757112, 2.765842, 0.2784314, 0, 1, 1,
0.6447753, 0.435904, 0.3674362, 0.282353, 0, 1, 1,
0.6524404, 1.671568, 1.822729, 0.2901961, 0, 1, 1,
0.6555427, -0.2095123, 1.684662, 0.2941177, 0, 1, 1,
0.6572539, -0.4647498, 2.486344, 0.3019608, 0, 1, 1,
0.6600372, -0.6473194, 2.737941, 0.3098039, 0, 1, 1,
0.664851, 0.762957, 0.7958118, 0.3137255, 0, 1, 1,
0.6699321, 0.08456847, 0.8391793, 0.3215686, 0, 1, 1,
0.6702499, 0.9294692, 0.9122128, 0.3254902, 0, 1, 1,
0.6706688, -0.9962685, 3.539141, 0.3333333, 0, 1, 1,
0.6756598, -0.3591061, 0.5700722, 0.3372549, 0, 1, 1,
0.6773361, -0.1241981, 1.432875, 0.345098, 0, 1, 1,
0.6805671, -0.3751852, 1.392069, 0.3490196, 0, 1, 1,
0.6818705, 0.232572, 2.232963, 0.3568628, 0, 1, 1,
0.6875858, -0.1543017, 2.034592, 0.3607843, 0, 1, 1,
0.6981704, -0.7917812, 1.457318, 0.3686275, 0, 1, 1,
0.6982751, 2.340898, -0.8133092, 0.372549, 0, 1, 1,
0.7013315, 2.469682, -0.3602289, 0.3803922, 0, 1, 1,
0.7095361, -0.2616684, 1.942554, 0.3843137, 0, 1, 1,
0.7097087, 1.077315, 0.7560884, 0.3921569, 0, 1, 1,
0.7112308, 1.318308, 0.472616, 0.3960784, 0, 1, 1,
0.7136453, 0.569714, 1.187239, 0.4039216, 0, 1, 1,
0.7197745, 0.246536, 1.51691, 0.4117647, 0, 1, 1,
0.7204134, 0.2568917, 1.716593, 0.4156863, 0, 1, 1,
0.7229981, -1.359, 3.244957, 0.4235294, 0, 1, 1,
0.7232143, -0.1273596, 0.8990833, 0.427451, 0, 1, 1,
0.7410873, -0.3960727, 2.034515, 0.4352941, 0, 1, 1,
0.7435533, 0.7479836, -0.4039991, 0.4392157, 0, 1, 1,
0.7460589, -1.151071, 3.274528, 0.4470588, 0, 1, 1,
0.7469275, 0.6458303, 0.2512535, 0.4509804, 0, 1, 1,
0.750012, -0.6683689, 2.125143, 0.4588235, 0, 1, 1,
0.7543869, 0.9756505, 0.6834594, 0.4627451, 0, 1, 1,
0.7555432, 0.2621012, 1.729099, 0.4705882, 0, 1, 1,
0.7610567, -1.498981, 3.228344, 0.4745098, 0, 1, 1,
0.7613107, -1.759629, 3.549833, 0.4823529, 0, 1, 1,
0.7640842, -0.3247446, 1.10078, 0.4862745, 0, 1, 1,
0.7666591, -0.4912863, -0.1170051, 0.4941176, 0, 1, 1,
0.7717761, 0.2806171, 1.298444, 0.5019608, 0, 1, 1,
0.7742669, 1.212433, 0.9372636, 0.5058824, 0, 1, 1,
0.7793275, 0.6527253, 0.6170373, 0.5137255, 0, 1, 1,
0.7848824, 0.957602, 0.2733213, 0.5176471, 0, 1, 1,
0.7850089, -0.6961482, 3.325539, 0.5254902, 0, 1, 1,
0.7882873, -1.014518, 1.090489, 0.5294118, 0, 1, 1,
0.7883475, 0.1216937, 1.520572, 0.5372549, 0, 1, 1,
0.7885134, 1.967343, 1.316713, 0.5411765, 0, 1, 1,
0.7931921, 0.7268422, 1.787954, 0.5490196, 0, 1, 1,
0.7933263, 0.8219666, -1.622408, 0.5529412, 0, 1, 1,
0.8004581, 0.7720198, 0.7778195, 0.5607843, 0, 1, 1,
0.8064927, 0.5291674, 1.036911, 0.5647059, 0, 1, 1,
0.8094949, 1.421191, 0.1926222, 0.572549, 0, 1, 1,
0.8095824, 0.6009108, 1.868011, 0.5764706, 0, 1, 1,
0.8102105, 0.9803253, 0.334872, 0.5843138, 0, 1, 1,
0.8151502, -0.6470571, 3.444984, 0.5882353, 0, 1, 1,
0.8159001, 1.319597, -0.02272773, 0.5960785, 0, 1, 1,
0.8192032, 0.05960606, 1.730053, 0.6039216, 0, 1, 1,
0.8291714, 0.1698817, 1.278419, 0.6078432, 0, 1, 1,
0.8317257, -0.6586936, 1.589311, 0.6156863, 0, 1, 1,
0.8364521, 0.7768359, -0.2043654, 0.6196079, 0, 1, 1,
0.8456261, 1.189229, -0.1313196, 0.627451, 0, 1, 1,
0.8460621, 0.1374615, 3.444738, 0.6313726, 0, 1, 1,
0.8486172, 0.4626563, 0.6161589, 0.6392157, 0, 1, 1,
0.8497114, 0.1136783, 0.4426816, 0.6431373, 0, 1, 1,
0.850768, -0.422133, 0.7596715, 0.6509804, 0, 1, 1,
0.8561711, -1.318715, 4.983758, 0.654902, 0, 1, 1,
0.8577207, -1.151152, 3.995173, 0.6627451, 0, 1, 1,
0.8583145, 1.944156, -0.2308479, 0.6666667, 0, 1, 1,
0.8628297, 0.08578291, 2.308041, 0.6745098, 0, 1, 1,
0.86599, 0.004657151, 1.593538, 0.6784314, 0, 1, 1,
0.8676257, 1.211497, 1.139206, 0.6862745, 0, 1, 1,
0.868714, 0.05411094, 1.763131, 0.6901961, 0, 1, 1,
0.8689147, 1.561919, 1.875669, 0.6980392, 0, 1, 1,
0.8741663, -0.6172122, 3.398815, 0.7058824, 0, 1, 1,
0.8742319, -0.4018049, 3.759134, 0.7098039, 0, 1, 1,
0.8766886, 0.5756095, 1.732689, 0.7176471, 0, 1, 1,
0.8801152, -0.8347443, 0.9750667, 0.7215686, 0, 1, 1,
0.8818927, -1.367575, 3.546298, 0.7294118, 0, 1, 1,
0.8923358, 1.427066, -0.3112192, 0.7333333, 0, 1, 1,
0.8929604, -1.967495, 1.988582, 0.7411765, 0, 1, 1,
0.8979387, -1.625682, 2.884638, 0.7450981, 0, 1, 1,
0.8983795, 1.41448, 2.159622, 0.7529412, 0, 1, 1,
0.9181998, -0.8231568, 0.4318204, 0.7568628, 0, 1, 1,
0.9189073, 1.393698, -0.4178273, 0.7647059, 0, 1, 1,
0.9208263, -0.3072225, 1.084449, 0.7686275, 0, 1, 1,
0.9212053, -0.6469443, 4.228944, 0.7764706, 0, 1, 1,
0.9261603, -1.197456, 1.929548, 0.7803922, 0, 1, 1,
0.9267402, 0.6564245, -0.6980225, 0.7882353, 0, 1, 1,
0.9301958, -0.8356997, 3.942048, 0.7921569, 0, 1, 1,
0.9303144, -0.5119655, 0.1220789, 0.8, 0, 1, 1,
0.9325529, -0.3623853, 1.889231, 0.8078431, 0, 1, 1,
0.9347544, -0.306807, 2.38376, 0.8117647, 0, 1, 1,
0.9370759, -0.2043131, -0.5350589, 0.8196079, 0, 1, 1,
0.9417965, -0.5036885, 0.7747113, 0.8235294, 0, 1, 1,
0.942036, 1.814626, 1.696038, 0.8313726, 0, 1, 1,
0.9437977, 0.27897, 1.205315, 0.8352941, 0, 1, 1,
0.9444008, -0.09169532, 1.659579, 0.8431373, 0, 1, 1,
0.9507759, -0.07203477, 2.228558, 0.8470588, 0, 1, 1,
0.9546024, -0.1245415, 1.207792, 0.854902, 0, 1, 1,
0.9569327, -0.6485054, 1.465585, 0.8588235, 0, 1, 1,
0.9632788, -0.6580139, 1.5165, 0.8666667, 0, 1, 1,
0.9655705, 0.9707018, 1.336402, 0.8705882, 0, 1, 1,
0.9658518, -0.5932382, 1.109336, 0.8784314, 0, 1, 1,
0.969301, 1.361584, 0.8502229, 0.8823529, 0, 1, 1,
0.9715537, 1.248135, 2.749133, 0.8901961, 0, 1, 1,
0.9740841, -0.1392765, 2.305615, 0.8941177, 0, 1, 1,
0.9776984, -0.6369388, 1.975299, 0.9019608, 0, 1, 1,
0.9786837, 2.000238, 0.2019518, 0.9098039, 0, 1, 1,
0.9798232, -0.01780093, 0.8346404, 0.9137255, 0, 1, 1,
0.9798382, 1.560969, 2.944706, 0.9215686, 0, 1, 1,
0.9831954, 0.7865627, 1.031288, 0.9254902, 0, 1, 1,
0.9905622, 0.7046584, 1.561615, 0.9333333, 0, 1, 1,
0.9931177, -0.8515317, 2.790193, 0.9372549, 0, 1, 1,
0.9963881, 1.757722, 1.413401, 0.945098, 0, 1, 1,
1.004578, -1.102754, 2.607543, 0.9490196, 0, 1, 1,
1.004824, -0.227371, 0.5992453, 0.9568627, 0, 1, 1,
1.005302, 2.430076, -0.7649027, 0.9607843, 0, 1, 1,
1.009431, -0.3292569, 2.417498, 0.9686275, 0, 1, 1,
1.009906, 0.1240239, 3.086916, 0.972549, 0, 1, 1,
1.012473, -2.045523, 3.833031, 0.9803922, 0, 1, 1,
1.013227, 0.978327, 0.1874002, 0.9843137, 0, 1, 1,
1.015022, 1.807183, -0.7701123, 0.9921569, 0, 1, 1,
1.0162, -2.030736, 3.000577, 0.9960784, 0, 1, 1,
1.019803, 0.8199281, 2.256561, 1, 0, 0.9960784, 1,
1.022801, -1.929879, 4.878754, 1, 0, 0.9882353, 1,
1.038151, -1.637237, 3.047798, 1, 0, 0.9843137, 1,
1.043992, 0.188198, 1.604111, 1, 0, 0.9764706, 1,
1.052161, -1.074018, 2.93824, 1, 0, 0.972549, 1,
1.053174, 0.611508, 2.372001, 1, 0, 0.9647059, 1,
1.054388, 0.9041152, 0.8050906, 1, 0, 0.9607843, 1,
1.054933, 0.7451693, 1.530834, 1, 0, 0.9529412, 1,
1.055579, 0.5650637, 1.472317, 1, 0, 0.9490196, 1,
1.078293, -2.178149, 4.148192, 1, 0, 0.9411765, 1,
1.080221, 0.6796808, 1.647449, 1, 0, 0.9372549, 1,
1.081921, 0.4628174, 2.354487, 1, 0, 0.9294118, 1,
1.0848, -0.6993447, 1.287509, 1, 0, 0.9254902, 1,
1.098792, 0.5594336, 0.4423548, 1, 0, 0.9176471, 1,
1.10089, 1.446274, 1.621985, 1, 0, 0.9137255, 1,
1.105054, -0.2826362, 2.533504, 1, 0, 0.9058824, 1,
1.109232, -2.046751, 4.425145, 1, 0, 0.9019608, 1,
1.127388, -0.2572503, 4.738053, 1, 0, 0.8941177, 1,
1.129489, 1.823287, -0.5314786, 1, 0, 0.8862745, 1,
1.129748, -0.5556036, 2.223479, 1, 0, 0.8823529, 1,
1.149805, -0.446072, 1.065064, 1, 0, 0.8745098, 1,
1.151144, -2.08722, 4.689594, 1, 0, 0.8705882, 1,
1.156817, -0.1997455, 2.402505, 1, 0, 0.8627451, 1,
1.157606, -0.3531909, 1.384169, 1, 0, 0.8588235, 1,
1.168621, -0.3118036, 1.238791, 1, 0, 0.8509804, 1,
1.169434, -1.055652, 0.4872596, 1, 0, 0.8470588, 1,
1.182561, -0.0309142, 2.705928, 1, 0, 0.8392157, 1,
1.184459, -0.1584463, 2.923147, 1, 0, 0.8352941, 1,
1.185792, -3.188362, 3.553153, 1, 0, 0.827451, 1,
1.185932, 1.510849, 2.5035, 1, 0, 0.8235294, 1,
1.195182, 0.6729874, 0.04234278, 1, 0, 0.8156863, 1,
1.196015, -0.2377992, 0.3323646, 1, 0, 0.8117647, 1,
1.209415, 0.2595633, 1.339424, 1, 0, 0.8039216, 1,
1.214145, -0.5466053, 2.877583, 1, 0, 0.7960784, 1,
1.214765, 0.1398647, 0.4072978, 1, 0, 0.7921569, 1,
1.220228, 0.3271885, 3.040867, 1, 0, 0.7843137, 1,
1.221795, -1.420767, 2.496763, 1, 0, 0.7803922, 1,
1.222212, -1.027492, 2.145429, 1, 0, 0.772549, 1,
1.226528, 1.038256, -0.2877465, 1, 0, 0.7686275, 1,
1.227094, 0.2148025, 0.816973, 1, 0, 0.7607843, 1,
1.229491, -1.933091, 2.608288, 1, 0, 0.7568628, 1,
1.232181, 1.469038, 0.7267719, 1, 0, 0.7490196, 1,
1.239417, 0.9800891, 2.21381, 1, 0, 0.7450981, 1,
1.241802, -1.422398, 2.818486, 1, 0, 0.7372549, 1,
1.245166, -0.7058581, 1.567884, 1, 0, 0.7333333, 1,
1.250897, 1.181655, 1.000362, 1, 0, 0.7254902, 1,
1.252425, 1.157701, 1.645678, 1, 0, 0.7215686, 1,
1.254882, -0.8686806, 2.704761, 1, 0, 0.7137255, 1,
1.261905, 0.6397793, -0.1503411, 1, 0, 0.7098039, 1,
1.261932, 0.1034025, 0.1138697, 1, 0, 0.7019608, 1,
1.262335, 1.06685, 2.852147, 1, 0, 0.6941177, 1,
1.266241, -0.3163689, 0.8243753, 1, 0, 0.6901961, 1,
1.269456, 1.152552, -0.10129, 1, 0, 0.682353, 1,
1.27705, 0.9184901, 0.670531, 1, 0, 0.6784314, 1,
1.277543, -0.4280944, 2.698093, 1, 0, 0.6705883, 1,
1.281591, 1.286913, 1.063176, 1, 0, 0.6666667, 1,
1.282148, -0.6930092, 2.503474, 1, 0, 0.6588235, 1,
1.293802, -1.670525, 3.420521, 1, 0, 0.654902, 1,
1.30311, -1.026146, 2.739369, 1, 0, 0.6470588, 1,
1.306553, -1.219264, 3.31414, 1, 0, 0.6431373, 1,
1.319803, -0.6800967, 0.1441503, 1, 0, 0.6352941, 1,
1.328746, -0.7400372, 2.278224, 1, 0, 0.6313726, 1,
1.330522, -0.5315508, 3.105854, 1, 0, 0.6235294, 1,
1.332775, -0.04727794, 1.630377, 1, 0, 0.6196079, 1,
1.332929, -0.3587778, 2.143985, 1, 0, 0.6117647, 1,
1.334183, -0.675333, 2.291948, 1, 0, 0.6078432, 1,
1.339023, -1.736755, 2.311028, 1, 0, 0.6, 1,
1.339068, 1.711322, 2.094621, 1, 0, 0.5921569, 1,
1.341377, 0.7336074, 1.054818, 1, 0, 0.5882353, 1,
1.341675, 0.09106922, 1.832522, 1, 0, 0.5803922, 1,
1.349657, -2.653149, 0.9284633, 1, 0, 0.5764706, 1,
1.354331, -0.05410851, 0.3989575, 1, 0, 0.5686275, 1,
1.362244, 0.7580826, 1.360645, 1, 0, 0.5647059, 1,
1.371709, -1.611617, 2.524673, 1, 0, 0.5568628, 1,
1.390284, 0.1699314, 1.604988, 1, 0, 0.5529412, 1,
1.391406, -1.411111, 1.95654, 1, 0, 0.5450981, 1,
1.396627, -1.497873, 4.760155, 1, 0, 0.5411765, 1,
1.397391, 0.568665, 1.177009, 1, 0, 0.5333334, 1,
1.409466, -1.577982, 2.896146, 1, 0, 0.5294118, 1,
1.417315, -1.50717, 3.006626, 1, 0, 0.5215687, 1,
1.420361, 0.7902444, 0.3215473, 1, 0, 0.5176471, 1,
1.43575, -0.239415, 1.401438, 1, 0, 0.509804, 1,
1.44176, 0.8047315, -0.1938109, 1, 0, 0.5058824, 1,
1.441866, -0.270836, 2.242996, 1, 0, 0.4980392, 1,
1.464119, -1.277993, 2.492352, 1, 0, 0.4901961, 1,
1.473195, -0.2102813, 2.794863, 1, 0, 0.4862745, 1,
1.487531, 0.7588004, 1.861168, 1, 0, 0.4784314, 1,
1.498911, 0.3845752, 2.527082, 1, 0, 0.4745098, 1,
1.511673, -0.8969939, 2.490711, 1, 0, 0.4666667, 1,
1.521073, -0.2885807, 2.899018, 1, 0, 0.4627451, 1,
1.536938, -0.4637537, 0.8405625, 1, 0, 0.454902, 1,
1.537915, 0.6750162, 0.8383278, 1, 0, 0.4509804, 1,
1.543957, -0.6155357, 1.693185, 1, 0, 0.4431373, 1,
1.553654, 0.7469263, 2.59141, 1, 0, 0.4392157, 1,
1.570454, -0.8020489, 1.14162, 1, 0, 0.4313726, 1,
1.571185, -0.1270601, 1.249773, 1, 0, 0.427451, 1,
1.574234, 0.05976044, 2.407731, 1, 0, 0.4196078, 1,
1.576741, 0.6439358, 0.3889331, 1, 0, 0.4156863, 1,
1.586616, 1.109062, 1.863592, 1, 0, 0.4078431, 1,
1.596833, 0.2634031, 2.153389, 1, 0, 0.4039216, 1,
1.61001, 0.6145913, 1.768865, 1, 0, 0.3960784, 1,
1.617751, -0.6088243, 1.901984, 1, 0, 0.3882353, 1,
1.619481, 0.7273924, 0.6029841, 1, 0, 0.3843137, 1,
1.630309, 2.291201, -0.4690896, 1, 0, 0.3764706, 1,
1.639609, 1.001819, 0.407436, 1, 0, 0.372549, 1,
1.642936, -0.5362996, 1.286723, 1, 0, 0.3647059, 1,
1.654002, -0.04908934, 1.947634, 1, 0, 0.3607843, 1,
1.672126, -2.107091, 2.169273, 1, 0, 0.3529412, 1,
1.683684, 1.41959, 0.4578761, 1, 0, 0.3490196, 1,
1.704802, -0.1384386, 1.425588, 1, 0, 0.3411765, 1,
1.717314, -0.1273288, 3.106253, 1, 0, 0.3372549, 1,
1.722866, 0.7072823, 0.6333534, 1, 0, 0.3294118, 1,
1.727697, -0.9373185, 2.321749, 1, 0, 0.3254902, 1,
1.730088, 1.311642, 1.606459, 1, 0, 0.3176471, 1,
1.735538, -1.400882, 1.018926, 1, 0, 0.3137255, 1,
1.749594, 1.407575, -0.03065007, 1, 0, 0.3058824, 1,
1.766806, 0.3650695, 1.798979, 1, 0, 0.2980392, 1,
1.769552, 1.015523, 0.8001587, 1, 0, 0.2941177, 1,
1.781056, -0.9237311, 1.646919, 1, 0, 0.2862745, 1,
1.781774, -0.6287545, 3.004824, 1, 0, 0.282353, 1,
1.797496, -0.9127398, 1.270897, 1, 0, 0.2745098, 1,
1.800447, 0.3807886, 1.398738, 1, 0, 0.2705882, 1,
1.803118, -0.8313939, 0.5881566, 1, 0, 0.2627451, 1,
1.818014, -2.216329, 2.094826, 1, 0, 0.2588235, 1,
1.824143, 0.9231669, 1.892501, 1, 0, 0.2509804, 1,
1.837461, 2.312327, 0.3091345, 1, 0, 0.2470588, 1,
1.866965, -1.873525, 3.206567, 1, 0, 0.2392157, 1,
1.871342, 1.562244, 0.736383, 1, 0, 0.2352941, 1,
1.876417, -0.2328052, 2.272233, 1, 0, 0.227451, 1,
1.889169, -1.920034, 3.341472, 1, 0, 0.2235294, 1,
1.899711, 0.7837123, -0.09623399, 1, 0, 0.2156863, 1,
1.90106, -1.638783, 0.176723, 1, 0, 0.2117647, 1,
1.95716, -0.876817, 1.995049, 1, 0, 0.2039216, 1,
1.97045, -0.8581089, 3.397112, 1, 0, 0.1960784, 1,
1.981119, -1.300384, 2.386322, 1, 0, 0.1921569, 1,
1.993164, 0.1725789, 1.164304, 1, 0, 0.1843137, 1,
2.002567, 0.4747462, 0.7875061, 1, 0, 0.1803922, 1,
2.022335, -0.432512, 1.914603, 1, 0, 0.172549, 1,
2.052132, -0.3287853, 3.289159, 1, 0, 0.1686275, 1,
2.067021, -1.145227, 0.9053413, 1, 0, 0.1607843, 1,
2.071821, -0.6110595, 1.398833, 1, 0, 0.1568628, 1,
2.084076, -1.079013, 1.534022, 1, 0, 0.1490196, 1,
2.087375, -0.7657446, 2.171852, 1, 0, 0.145098, 1,
2.143137, -0.4976875, 3.410715, 1, 0, 0.1372549, 1,
2.178542, -0.611207, 0.5285665, 1, 0, 0.1333333, 1,
2.213504, -0.09562201, 2.853601, 1, 0, 0.1254902, 1,
2.215424, -0.2545995, 2.027942, 1, 0, 0.1215686, 1,
2.240871, -0.8558966, 1.355376, 1, 0, 0.1137255, 1,
2.255109, 0.5079302, 2.244774, 1, 0, 0.1098039, 1,
2.299209, -1.156411, 0.9025062, 1, 0, 0.1019608, 1,
2.316729, 0.4459808, 1.891652, 1, 0, 0.09411765, 1,
2.318146, -0.9083916, 1.625299, 1, 0, 0.09019608, 1,
2.368013, 0.2993281, 3.228801, 1, 0, 0.08235294, 1,
2.396256, -1.694732, 2.693656, 1, 0, 0.07843138, 1,
2.505566, -0.5675082, 1.443882, 1, 0, 0.07058824, 1,
2.592633, 0.841681, 1.910094, 1, 0, 0.06666667, 1,
2.627482, -0.7338809, 0.7746776, 1, 0, 0.05882353, 1,
2.648063, 0.6104586, 1.20403, 1, 0, 0.05490196, 1,
2.722095, -1.750393, 1.925173, 1, 0, 0.04705882, 1,
2.773209, 0.336178, 0.6464198, 1, 0, 0.04313726, 1,
2.796526, -3.557463, 0.08707464, 1, 0, 0.03529412, 1,
2.897206, 0.7433351, 1.533299, 1, 0, 0.03137255, 1,
2.944996, -0.3197484, -0.07816868, 1, 0, 0.02352941, 1,
3.200396, -0.1996414, 3.155569, 1, 0, 0.01960784, 1,
3.204539, 0.1200718, -0.3313002, 1, 0, 0.01176471, 1,
3.405237, -0.7695069, 2.598554, 1, 0, 0.007843138, 1
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
0.1396322, -4.707477, -7.108456, 0, -0.5, 0.5, 0.5,
0.1396322, -4.707477, -7.108456, 1, -0.5, 0.5, 0.5,
0.1396322, -4.707477, -7.108456, 1, 1.5, 0.5, 0.5,
0.1396322, -4.707477, -7.108456, 0, 1.5, 0.5, 0.5
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
-4.233013, -0.1650938, -7.108456, 0, -0.5, 0.5, 0.5,
-4.233013, -0.1650938, -7.108456, 1, -0.5, 0.5, 0.5,
-4.233013, -0.1650938, -7.108456, 1, 1.5, 0.5, 0.5,
-4.233013, -0.1650938, -7.108456, 0, 1.5, 0.5, 0.5
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
-4.233013, -4.707477, -0.06670165, 0, -0.5, 0.5, 0.5,
-4.233013, -4.707477, -0.06670165, 1, -0.5, 0.5, 0.5,
-4.233013, -4.707477, -0.06670165, 1, 1.5, 0.5, 0.5,
-4.233013, -4.707477, -0.06670165, 0, 1.5, 0.5, 0.5
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
-3, -3.659234, -5.483436,
3, -3.659234, -5.483436,
-3, -3.659234, -5.483436,
-3, -3.833941, -5.754272,
-2, -3.659234, -5.483436,
-2, -3.833941, -5.754272,
-1, -3.659234, -5.483436,
-1, -3.833941, -5.754272,
0, -3.659234, -5.483436,
0, -3.833941, -5.754272,
1, -3.659234, -5.483436,
1, -3.833941, -5.754272,
2, -3.659234, -5.483436,
2, -3.833941, -5.754272,
3, -3.659234, -5.483436,
3, -3.833941, -5.754272
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
-3, -4.183355, -6.295946, 0, -0.5, 0.5, 0.5,
-3, -4.183355, -6.295946, 1, -0.5, 0.5, 0.5,
-3, -4.183355, -6.295946, 1, 1.5, 0.5, 0.5,
-3, -4.183355, -6.295946, 0, 1.5, 0.5, 0.5,
-2, -4.183355, -6.295946, 0, -0.5, 0.5, 0.5,
-2, -4.183355, -6.295946, 1, -0.5, 0.5, 0.5,
-2, -4.183355, -6.295946, 1, 1.5, 0.5, 0.5,
-2, -4.183355, -6.295946, 0, 1.5, 0.5, 0.5,
-1, -4.183355, -6.295946, 0, -0.5, 0.5, 0.5,
-1, -4.183355, -6.295946, 1, -0.5, 0.5, 0.5,
-1, -4.183355, -6.295946, 1, 1.5, 0.5, 0.5,
-1, -4.183355, -6.295946, 0, 1.5, 0.5, 0.5,
0, -4.183355, -6.295946, 0, -0.5, 0.5, 0.5,
0, -4.183355, -6.295946, 1, -0.5, 0.5, 0.5,
0, -4.183355, -6.295946, 1, 1.5, 0.5, 0.5,
0, -4.183355, -6.295946, 0, 1.5, 0.5, 0.5,
1, -4.183355, -6.295946, 0, -0.5, 0.5, 0.5,
1, -4.183355, -6.295946, 1, -0.5, 0.5, 0.5,
1, -4.183355, -6.295946, 1, 1.5, 0.5, 0.5,
1, -4.183355, -6.295946, 0, 1.5, 0.5, 0.5,
2, -4.183355, -6.295946, 0, -0.5, 0.5, 0.5,
2, -4.183355, -6.295946, 1, -0.5, 0.5, 0.5,
2, -4.183355, -6.295946, 1, 1.5, 0.5, 0.5,
2, -4.183355, -6.295946, 0, 1.5, 0.5, 0.5,
3, -4.183355, -6.295946, 0, -0.5, 0.5, 0.5,
3, -4.183355, -6.295946, 1, -0.5, 0.5, 0.5,
3, -4.183355, -6.295946, 1, 1.5, 0.5, 0.5,
3, -4.183355, -6.295946, 0, 1.5, 0.5, 0.5
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
-3.223941, -3, -5.483436,
-3.223941, 3, -5.483436,
-3.223941, -3, -5.483436,
-3.39212, -3, -5.754272,
-3.223941, -2, -5.483436,
-3.39212, -2, -5.754272,
-3.223941, -1, -5.483436,
-3.39212, -1, -5.754272,
-3.223941, 0, -5.483436,
-3.39212, 0, -5.754272,
-3.223941, 1, -5.483436,
-3.39212, 1, -5.754272,
-3.223941, 2, -5.483436,
-3.39212, 2, -5.754272,
-3.223941, 3, -5.483436,
-3.39212, 3, -5.754272
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
-3.728477, -3, -6.295946, 0, -0.5, 0.5, 0.5,
-3.728477, -3, -6.295946, 1, -0.5, 0.5, 0.5,
-3.728477, -3, -6.295946, 1, 1.5, 0.5, 0.5,
-3.728477, -3, -6.295946, 0, 1.5, 0.5, 0.5,
-3.728477, -2, -6.295946, 0, -0.5, 0.5, 0.5,
-3.728477, -2, -6.295946, 1, -0.5, 0.5, 0.5,
-3.728477, -2, -6.295946, 1, 1.5, 0.5, 0.5,
-3.728477, -2, -6.295946, 0, 1.5, 0.5, 0.5,
-3.728477, -1, -6.295946, 0, -0.5, 0.5, 0.5,
-3.728477, -1, -6.295946, 1, -0.5, 0.5, 0.5,
-3.728477, -1, -6.295946, 1, 1.5, 0.5, 0.5,
-3.728477, -1, -6.295946, 0, 1.5, 0.5, 0.5,
-3.728477, 0, -6.295946, 0, -0.5, 0.5, 0.5,
-3.728477, 0, -6.295946, 1, -0.5, 0.5, 0.5,
-3.728477, 0, -6.295946, 1, 1.5, 0.5, 0.5,
-3.728477, 0, -6.295946, 0, 1.5, 0.5, 0.5,
-3.728477, 1, -6.295946, 0, -0.5, 0.5, 0.5,
-3.728477, 1, -6.295946, 1, -0.5, 0.5, 0.5,
-3.728477, 1, -6.295946, 1, 1.5, 0.5, 0.5,
-3.728477, 1, -6.295946, 0, 1.5, 0.5, 0.5,
-3.728477, 2, -6.295946, 0, -0.5, 0.5, 0.5,
-3.728477, 2, -6.295946, 1, -0.5, 0.5, 0.5,
-3.728477, 2, -6.295946, 1, 1.5, 0.5, 0.5,
-3.728477, 2, -6.295946, 0, 1.5, 0.5, 0.5,
-3.728477, 3, -6.295946, 0, -0.5, 0.5, 0.5,
-3.728477, 3, -6.295946, 1, -0.5, 0.5, 0.5,
-3.728477, 3, -6.295946, 1, 1.5, 0.5, 0.5,
-3.728477, 3, -6.295946, 0, 1.5, 0.5, 0.5
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
-3.223941, -3.659234, -4,
-3.223941, -3.659234, 4,
-3.223941, -3.659234, -4,
-3.39212, -3.833941, -4,
-3.223941, -3.659234, -2,
-3.39212, -3.833941, -2,
-3.223941, -3.659234, 0,
-3.39212, -3.833941, 0,
-3.223941, -3.659234, 2,
-3.39212, -3.833941, 2,
-3.223941, -3.659234, 4,
-3.39212, -3.833941, 4
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
-3.728477, -4.183355, -4, 0, -0.5, 0.5, 0.5,
-3.728477, -4.183355, -4, 1, -0.5, 0.5, 0.5,
-3.728477, -4.183355, -4, 1, 1.5, 0.5, 0.5,
-3.728477, -4.183355, -4, 0, 1.5, 0.5, 0.5,
-3.728477, -4.183355, -2, 0, -0.5, 0.5, 0.5,
-3.728477, -4.183355, -2, 1, -0.5, 0.5, 0.5,
-3.728477, -4.183355, -2, 1, 1.5, 0.5, 0.5,
-3.728477, -4.183355, -2, 0, 1.5, 0.5, 0.5,
-3.728477, -4.183355, 0, 0, -0.5, 0.5, 0.5,
-3.728477, -4.183355, 0, 1, -0.5, 0.5, 0.5,
-3.728477, -4.183355, 0, 1, 1.5, 0.5, 0.5,
-3.728477, -4.183355, 0, 0, 1.5, 0.5, 0.5,
-3.728477, -4.183355, 2, 0, -0.5, 0.5, 0.5,
-3.728477, -4.183355, 2, 1, -0.5, 0.5, 0.5,
-3.728477, -4.183355, 2, 1, 1.5, 0.5, 0.5,
-3.728477, -4.183355, 2, 0, 1.5, 0.5, 0.5,
-3.728477, -4.183355, 4, 0, -0.5, 0.5, 0.5,
-3.728477, -4.183355, 4, 1, -0.5, 0.5, 0.5,
-3.728477, -4.183355, 4, 1, 1.5, 0.5, 0.5,
-3.728477, -4.183355, 4, 0, 1.5, 0.5, 0.5
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
-3.223941, -3.659234, -5.483436,
-3.223941, 3.329047, -5.483436,
-3.223941, -3.659234, 5.350032,
-3.223941, 3.329047, 5.350032,
-3.223941, -3.659234, -5.483436,
-3.223941, -3.659234, 5.350032,
-3.223941, 3.329047, -5.483436,
-3.223941, 3.329047, 5.350032,
-3.223941, -3.659234, -5.483436,
3.503205, -3.659234, -5.483436,
-3.223941, -3.659234, 5.350032,
3.503205, -3.659234, 5.350032,
-3.223941, 3.329047, -5.483436,
3.503205, 3.329047, -5.483436,
-3.223941, 3.329047, 5.350032,
3.503205, 3.329047, 5.350032,
3.503205, -3.659234, -5.483436,
3.503205, 3.329047, -5.483436,
3.503205, -3.659234, 5.350032,
3.503205, 3.329047, 5.350032,
3.503205, -3.659234, -5.483436,
3.503205, -3.659234, 5.350032,
3.503205, 3.329047, -5.483436,
3.503205, 3.329047, 5.350032
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
var radius = 7.764867;
var distance = 34.54677;
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
mvMatrix.translate( -0.1396322, 0.1650938, 0.06670165 );
mvMatrix.scale( 1.248007, 1.201372, 0.774962 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.54677);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
isopropyl_phenylcarb<-read.table("isopropyl_phenylcarb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isopropyl_phenylcarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_phenylcarb' not found
```

```r
y<-isopropyl_phenylcarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_phenylcarb' not found
```

```r
z<-isopropyl_phenylcarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'isopropyl_phenylcarb' not found
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
-3.125973, 0.5222881, -1.038317, 0, 0, 1, 1, 1,
-3.009828, -0.09042596, -2.996207, 1, 0, 0, 1, 1,
-2.846044, 1.250717, -1.57035, 1, 0, 0, 1, 1,
-2.758941, -1.700626, 0.1413252, 1, 0, 0, 1, 1,
-2.721405, 1.279018, -2.137621, 1, 0, 0, 1, 1,
-2.646993, 0.8944038, -1.705885, 1, 0, 0, 1, 1,
-2.560266, 0.7853925, -1.443081, 0, 0, 0, 1, 1,
-2.536287, -0.3573801, -0.4471971, 0, 0, 0, 1, 1,
-2.523585, 0.2732731, -1.476884, 0, 0, 0, 1, 1,
-2.467401, -0.6877605, -3.38726, 0, 0, 0, 1, 1,
-2.410146, -0.104323, -2.129856, 0, 0, 0, 1, 1,
-2.377493, 0.3967413, -0.787802, 0, 0, 0, 1, 1,
-2.325767, -1.206935, -1.775144, 0, 0, 0, 1, 1,
-2.325544, 1.016747, 0.2349185, 1, 1, 1, 1, 1,
-2.24353, 0.7818468, -2.035697, 1, 1, 1, 1, 1,
-2.155053, -0.6571224, -1.963376, 1, 1, 1, 1, 1,
-2.075901, 0.01599801, -1.083094, 1, 1, 1, 1, 1,
-2.027778, 1.188629, -2.017396, 1, 1, 1, 1, 1,
-2.022007, 3.106792, 1.245893, 1, 1, 1, 1, 1,
-2.019209, -0.7524105, -2.644908, 1, 1, 1, 1, 1,
-2.008747, -0.04967765, -1.102863, 1, 1, 1, 1, 1,
-1.977986, 0.6097477, -0.8159767, 1, 1, 1, 1, 1,
-1.960654, -1.980954, -2.356133, 1, 1, 1, 1, 1,
-1.946576, 0.08122143, -0.08147419, 1, 1, 1, 1, 1,
-1.946429, 1.025259, -1.097884, 1, 1, 1, 1, 1,
-1.933871, 1.084052, 0.2301477, 1, 1, 1, 1, 1,
-1.916322, 1.048842, -0.385388, 1, 1, 1, 1, 1,
-1.893991, -0.7050098, -1.110301, 1, 1, 1, 1, 1,
-1.869247, -0.8679588, -2.670406, 0, 0, 1, 1, 1,
-1.862928, -1.041519, -1.529672, 1, 0, 0, 1, 1,
-1.85815, 1.252345, 0.1293707, 1, 0, 0, 1, 1,
-1.856948, 1.609844, -0.5850567, 1, 0, 0, 1, 1,
-1.844334, 0.7238931, 0.08334553, 1, 0, 0, 1, 1,
-1.822922, 0.1010492, -0.4215745, 1, 0, 0, 1, 1,
-1.807008, 0.1338389, -2.417297, 0, 0, 0, 1, 1,
-1.805673, -0.5975232, -1.314521, 0, 0, 0, 1, 1,
-1.800544, 0.09394785, -0.9349576, 0, 0, 0, 1, 1,
-1.795894, -0.6547868, 0.347798, 0, 0, 0, 1, 1,
-1.793323, 0.4064005, -1.195406, 0, 0, 0, 1, 1,
-1.719113, -0.9500387, -2.124285, 0, 0, 0, 1, 1,
-1.69403, -1.468846, -4.138906, 0, 0, 0, 1, 1,
-1.693337, 0.1072296, -2.626922, 1, 1, 1, 1, 1,
-1.667203, -0.9912797, -0.953644, 1, 1, 1, 1, 1,
-1.657166, -0.01401275, -1.560763, 1, 1, 1, 1, 1,
-1.656689, -1.951376, -3.148136, 1, 1, 1, 1, 1,
-1.648941, -0.6972719, -3.311857, 1, 1, 1, 1, 1,
-1.646364, -0.6581604, -1.425966, 1, 1, 1, 1, 1,
-1.635555, 0.1281624, -0.6699372, 1, 1, 1, 1, 1,
-1.6174, 0.07103729, -3.562317, 1, 1, 1, 1, 1,
-1.61551, 0.7765404, -0.09896868, 1, 1, 1, 1, 1,
-1.606104, 1.203382, -1.35305, 1, 1, 1, 1, 1,
-1.597391, -0.6752447, -3.53162, 1, 1, 1, 1, 1,
-1.582955, -1.02311, -1.261455, 1, 1, 1, 1, 1,
-1.575733, -0.2076359, -0.3807458, 1, 1, 1, 1, 1,
-1.57524, 1.621983, -1.525754, 1, 1, 1, 1, 1,
-1.567277, -1.73676, -2.635455, 1, 1, 1, 1, 1,
-1.562539, -0.1441009, -2.714876, 0, 0, 1, 1, 1,
-1.559738, 1.015084, -1.745901, 1, 0, 0, 1, 1,
-1.553124, -0.6252533, -2.804641, 1, 0, 0, 1, 1,
-1.552679, 0.2983328, -0.4144905, 1, 0, 0, 1, 1,
-1.538163, 0.3121223, -1.887378, 1, 0, 0, 1, 1,
-1.534027, -0.7002892, -2.663897, 1, 0, 0, 1, 1,
-1.517066, -0.2147532, -2.707045, 0, 0, 0, 1, 1,
-1.5005, 0.346402, 0.3950191, 0, 0, 0, 1, 1,
-1.480231, 0.2180482, -0.8800631, 0, 0, 0, 1, 1,
-1.4798, 0.5908769, -2.017782, 0, 0, 0, 1, 1,
-1.473108, 0.1091451, 0.2214697, 0, 0, 0, 1, 1,
-1.469077, -0.1432407, -1.82792, 0, 0, 0, 1, 1,
-1.46651, -0.1453245, -2.335463, 0, 0, 0, 1, 1,
-1.465968, 0.5723003, -1.57605, 1, 1, 1, 1, 1,
-1.445177, 1.688765, -1.770713, 1, 1, 1, 1, 1,
-1.441893, -0.2741956, -3.309742, 1, 1, 1, 1, 1,
-1.438234, -0.4584374, -1.851875, 1, 1, 1, 1, 1,
-1.425493, 0.1412804, -1.800727, 1, 1, 1, 1, 1,
-1.425422, 1.406941, -1.090091, 1, 1, 1, 1, 1,
-1.403825, 1.144263, -0.5006201, 1, 1, 1, 1, 1,
-1.403465, -0.2481133, -0.7596796, 1, 1, 1, 1, 1,
-1.395746, -1.775733, -1.870086, 1, 1, 1, 1, 1,
-1.374312, 0.8768249, -0.08700042, 1, 1, 1, 1, 1,
-1.366019, -0.2844907, -2.636644, 1, 1, 1, 1, 1,
-1.364753, -1.265298, -2.671755, 1, 1, 1, 1, 1,
-1.352659, 0.2396129, -2.105548, 1, 1, 1, 1, 1,
-1.341534, -0.7838624, -2.180805, 1, 1, 1, 1, 1,
-1.332731, -0.7329441, -1.341846, 1, 1, 1, 1, 1,
-1.328039, -1.515785, -0.1057764, 0, 0, 1, 1, 1,
-1.326244, 1.539319, 0.3541088, 1, 0, 0, 1, 1,
-1.324482, 2.50846, 0.3619042, 1, 0, 0, 1, 1,
-1.322643, -0.9284045, -4.318102, 1, 0, 0, 1, 1,
-1.321095, -0.4436118, -2.427914, 1, 0, 0, 1, 1,
-1.316443, -0.8635987, -1.867264, 1, 0, 0, 1, 1,
-1.310292, -0.5053818, -0.3844957, 0, 0, 0, 1, 1,
-1.304076, -0.756929, -1.416946, 0, 0, 0, 1, 1,
-1.302768, 0.3073087, -3.122424, 0, 0, 0, 1, 1,
-1.281968, 0.766939, -1.233835, 0, 0, 0, 1, 1,
-1.273562, -0.2714155, -2.089655, 0, 0, 0, 1, 1,
-1.258265, 0.9436698, 0.04313362, 0, 0, 0, 1, 1,
-1.25047, -1.836532, -1.767747, 0, 0, 0, 1, 1,
-1.247101, 0.6827737, -2.22124, 1, 1, 1, 1, 1,
-1.24675, 0.5885799, -0.533101, 1, 1, 1, 1, 1,
-1.231169, 0.09241027, -2.603614, 1, 1, 1, 1, 1,
-1.229705, -0.2294141, -0.5291378, 1, 1, 1, 1, 1,
-1.229378, -0.7036577, -2.037855, 1, 1, 1, 1, 1,
-1.229173, -0.001346021, -2.445429, 1, 1, 1, 1, 1,
-1.222546, 2.613244, -0.6370611, 1, 1, 1, 1, 1,
-1.220743, 0.6786483, 0.7391989, 1, 1, 1, 1, 1,
-1.212297, -1.009666, -1.904457, 1, 1, 1, 1, 1,
-1.211646, 0.4904356, -2.013617, 1, 1, 1, 1, 1,
-1.211218, -0.3314603, -3.911279, 1, 1, 1, 1, 1,
-1.196614, 0.5597475, -2.745667, 1, 1, 1, 1, 1,
-1.190514, -2.705525, -2.50636, 1, 1, 1, 1, 1,
-1.189192, -0.5336519, -1.739128, 1, 1, 1, 1, 1,
-1.17953, 0.2473267, -1.675723, 1, 1, 1, 1, 1,
-1.179002, 0.3266643, -1.595807, 0, 0, 1, 1, 1,
-1.152986, -0.8515721, -2.801737, 1, 0, 0, 1, 1,
-1.149079, -0.07273856, -1.833238, 1, 0, 0, 1, 1,
-1.146796, -1.804428, -1.859228, 1, 0, 0, 1, 1,
-1.139364, -0.5963941, -2.235273, 1, 0, 0, 1, 1,
-1.134636, 0.7160337, -2.230273, 1, 0, 0, 1, 1,
-1.131265, 0.9712501, -0.2850348, 0, 0, 0, 1, 1,
-1.130908, -1.210315, -2.556925, 0, 0, 0, 1, 1,
-1.126555, 0.7889886, -0.831389, 0, 0, 0, 1, 1,
-1.121032, 0.7211738, -1.84428, 0, 0, 0, 1, 1,
-1.112719, -1.926841, -2.837089, 0, 0, 0, 1, 1,
-1.107101, -0.8880336, -2.792018, 0, 0, 0, 1, 1,
-1.106354, 0.7523414, -0.526129, 0, 0, 0, 1, 1,
-1.10594, -0.1620181, -1.475271, 1, 1, 1, 1, 1,
-1.096679, 0.3312327, -0.2438304, 1, 1, 1, 1, 1,
-1.089658, 0.4980435, -1.197773, 1, 1, 1, 1, 1,
-1.08745, 0.4510058, -0.4328317, 1, 1, 1, 1, 1,
-1.080116, 1.778319, -0.2216352, 1, 1, 1, 1, 1,
-1.07708, -0.04813011, -1.76695, 1, 1, 1, 1, 1,
-1.076442, 3.227276, -0.8614517, 1, 1, 1, 1, 1,
-1.066302, 0.5420001, -2.322899, 1, 1, 1, 1, 1,
-1.065446, 0.4183501, 0.6428534, 1, 1, 1, 1, 1,
-1.057584, -0.2849264, -0.808321, 1, 1, 1, 1, 1,
-1.056577, 0.9939424, -0.02459862, 1, 1, 1, 1, 1,
-1.054225, 1.211311, -0.9170573, 1, 1, 1, 1, 1,
-1.053432, 1.39242, -0.4028956, 1, 1, 1, 1, 1,
-1.047453, -0.4773271, -3.244588, 1, 1, 1, 1, 1,
-1.047002, -0.8052137, -2.263874, 1, 1, 1, 1, 1,
-1.045972, -0.4616123, -0.5335287, 0, 0, 1, 1, 1,
-1.044906, -0.1339713, -3.304713, 1, 0, 0, 1, 1,
-1.043627, -0.2110108, -2.754167, 1, 0, 0, 1, 1,
-1.037802, -0.1242047, -2.638296, 1, 0, 0, 1, 1,
-1.037177, 0.8834875, -1.69988, 1, 0, 0, 1, 1,
-1.02965, 0.08976816, 0.2549468, 1, 0, 0, 1, 1,
-1.025433, -0.2280896, -0.6771399, 0, 0, 0, 1, 1,
-1.024495, -0.6029943, -3.010333, 0, 0, 0, 1, 1,
-1.0192, -1.649407, -2.711504, 0, 0, 0, 1, 1,
-1.016392, 0.918112, -1.590399, 0, 0, 0, 1, 1,
-1.01537, -0.024687, -1.458363, 0, 0, 0, 1, 1,
-1.013299, 0.1202917, -0.711148, 0, 0, 0, 1, 1,
-1.009383, 0.6972377, 0.4296899, 0, 0, 0, 1, 1,
-1.008518, 0.8820817, 0.1286388, 1, 1, 1, 1, 1,
-0.9993589, -0.4203039, -2.479012, 1, 1, 1, 1, 1,
-0.9988146, 0.07882874, -1.794006, 1, 1, 1, 1, 1,
-0.9944493, 0.6672845, -0.1468645, 1, 1, 1, 1, 1,
-0.9847782, -0.3959021, -0.3283357, 1, 1, 1, 1, 1,
-0.9810358, 1.852039, -0.7021145, 1, 1, 1, 1, 1,
-0.9804755, 0.7389838, 0.4507494, 1, 1, 1, 1, 1,
-0.9798324, -0.188772, -1.550237, 1, 1, 1, 1, 1,
-0.976599, 2.559617, 0.6190926, 1, 1, 1, 1, 1,
-0.9708483, -1.606554, -2.190521, 1, 1, 1, 1, 1,
-0.9651923, 1.335198, -0.4439295, 1, 1, 1, 1, 1,
-0.9622675, 0.2809899, -1.482639, 1, 1, 1, 1, 1,
-0.9594415, -1.40652, -4.557572, 1, 1, 1, 1, 1,
-0.9539959, 2.196914, -0.6215067, 1, 1, 1, 1, 1,
-0.9536501, 0.7540281, -1.530335, 1, 1, 1, 1, 1,
-0.9513034, -0.06174152, -3.415026, 0, 0, 1, 1, 1,
-0.9419251, -1.072787, -3.858264, 1, 0, 0, 1, 1,
-0.9342742, 1.204868, 1.146402, 1, 0, 0, 1, 1,
-0.9280541, 1.328447, -0.07231921, 1, 0, 0, 1, 1,
-0.9167041, 0.2757758, -1.242904, 1, 0, 0, 1, 1,
-0.9070642, 0.08417312, -0.8418566, 1, 0, 0, 1, 1,
-0.9034858, -0.01191184, -2.693743, 0, 0, 0, 1, 1,
-0.9026958, -0.6436052, -2.510734, 0, 0, 0, 1, 1,
-0.8977253, 1.520728, -2.376061, 0, 0, 0, 1, 1,
-0.8960114, -1.43154, -2.957287, 0, 0, 0, 1, 1,
-0.893328, -0.6588031, -4.717047, 0, 0, 0, 1, 1,
-0.885218, -1.406114, -2.993089, 0, 0, 0, 1, 1,
-0.8849148, 0.7318111, 0.2186034, 0, 0, 0, 1, 1,
-0.883177, -0.1619887, -0.7405598, 1, 1, 1, 1, 1,
-0.8770045, -0.1991398, -3.86077, 1, 1, 1, 1, 1,
-0.8676429, -0.9980308, -3.039828, 1, 1, 1, 1, 1,
-0.8628733, 2.713656, 1.115982, 1, 1, 1, 1, 1,
-0.8615909, 0.2846427, -1.655022, 1, 1, 1, 1, 1,
-0.8545604, -0.415832, -1.440156, 1, 1, 1, 1, 1,
-0.8535582, 0.7097346, -0.1688526, 1, 1, 1, 1, 1,
-0.8512089, -0.3907925, -1.296665, 1, 1, 1, 1, 1,
-0.8492513, -0.2490553, -2.622051, 1, 1, 1, 1, 1,
-0.8474607, -0.7255085, 0.2783777, 1, 1, 1, 1, 1,
-0.8454239, 0.2219982, -1.836263, 1, 1, 1, 1, 1,
-0.8446775, 1.111111, 0.2874077, 1, 1, 1, 1, 1,
-0.8421652, 0.6433418, -3.237729, 1, 1, 1, 1, 1,
-0.8359725, 1.226493, -0.3858303, 1, 1, 1, 1, 1,
-0.8335341, 0.8646812, 0.5234045, 1, 1, 1, 1, 1,
-0.8165674, -2.057542, -3.369808, 0, 0, 1, 1, 1,
-0.8145345, 0.8718979, 1.090813, 1, 0, 0, 1, 1,
-0.8111217, -0.3179659, -1.197188, 1, 0, 0, 1, 1,
-0.8108919, -0.4682167, -2.45044, 1, 0, 0, 1, 1,
-0.8106105, 0.1757949, -0.3235085, 1, 0, 0, 1, 1,
-0.80522, -0.5085846, -4.262426, 1, 0, 0, 1, 1,
-0.8017867, -1.997961, -2.748246, 0, 0, 0, 1, 1,
-0.801712, 0.1671151, -1.416593, 0, 0, 0, 1, 1,
-0.7992426, 0.5388977, 1.074153, 0, 0, 0, 1, 1,
-0.7948527, 0.1454475, -1.241258, 0, 0, 0, 1, 1,
-0.7933805, -0.3907174, -1.833838, 0, 0, 0, 1, 1,
-0.790852, 0.1868037, -0.9893274, 0, 0, 0, 1, 1,
-0.7859712, 0.4856498, -1.027904, 0, 0, 0, 1, 1,
-0.7837808, 0.1987663, 0.6963372, 1, 1, 1, 1, 1,
-0.7829177, 0.8681735, -0.2786354, 1, 1, 1, 1, 1,
-0.7680224, 1.754869, 0.4485561, 1, 1, 1, 1, 1,
-0.7657506, -0.4875746, -1.835773, 1, 1, 1, 1, 1,
-0.7591064, -0.5839368, -3.78295, 1, 1, 1, 1, 1,
-0.7539981, -0.6210257, -2.683844, 1, 1, 1, 1, 1,
-0.7463562, -1.328234, -1.484738, 1, 1, 1, 1, 1,
-0.7416273, 1.29709, -1.138451, 1, 1, 1, 1, 1,
-0.7397484, 0.8507528, 0.5876579, 1, 1, 1, 1, 1,
-0.7376835, -0.4252765, -1.633903, 1, 1, 1, 1, 1,
-0.7371173, 1.239919, 1.968532, 1, 1, 1, 1, 1,
-0.7360492, -0.6395484, -2.965153, 1, 1, 1, 1, 1,
-0.7299333, -0.6439118, -2.043284, 1, 1, 1, 1, 1,
-0.7299117, 1.898022, -0.8854337, 1, 1, 1, 1, 1,
-0.7252117, 1.941022, 0.135413, 1, 1, 1, 1, 1,
-0.711053, -0.4241014, -3.323953, 0, 0, 1, 1, 1,
-0.7106125, 1.856494, -0.1774338, 1, 0, 0, 1, 1,
-0.7093696, 1.100332, 1.369559, 1, 0, 0, 1, 1,
-0.6974217, 0.7814638, -2.227949, 1, 0, 0, 1, 1,
-0.697215, 0.6849546, -0.7501943, 1, 0, 0, 1, 1,
-0.6933914, -0.4908671, -2.390738, 1, 0, 0, 1, 1,
-0.6926795, 0.5722939, -1.377423, 0, 0, 0, 1, 1,
-0.6907667, 2.856963, 1.38555, 0, 0, 0, 1, 1,
-0.6761878, -0.8799575, -1.585412, 0, 0, 0, 1, 1,
-0.6747886, -0.6520776, -2.16435, 0, 0, 0, 1, 1,
-0.6688386, 2.035689, -1.24522, 0, 0, 0, 1, 1,
-0.6646329, 1.812942, 1.614056, 0, 0, 0, 1, 1,
-0.6605793, 0.6198466, -1.481769, 0, 0, 0, 1, 1,
-0.660459, 0.342664, 0.4757282, 1, 1, 1, 1, 1,
-0.6514551, -0.4555052, -1.859974, 1, 1, 1, 1, 1,
-0.6475672, 1.778741, 1.129965, 1, 1, 1, 1, 1,
-0.6472464, 1.616757, -0.4383292, 1, 1, 1, 1, 1,
-0.6455367, 0.8959849, -2.158575, 1, 1, 1, 1, 1,
-0.6452335, -1.585126, -2.937759, 1, 1, 1, 1, 1,
-0.6447169, -0.6207392, -1.459744, 1, 1, 1, 1, 1,
-0.6414594, 0.755502, -1.446385, 1, 1, 1, 1, 1,
-0.6413003, -0.3768966, -1.805653, 1, 1, 1, 1, 1,
-0.6406018, -0.9010284, -2.786934, 1, 1, 1, 1, 1,
-0.6343302, 0.4266274, 0.465586, 1, 1, 1, 1, 1,
-0.6334672, -0.1649707, -2.413976, 1, 1, 1, 1, 1,
-0.6308353, 0.9370699, -1.553881, 1, 1, 1, 1, 1,
-0.6303118, 1.073307, 1.787629, 1, 1, 1, 1, 1,
-0.6270417, -2.469469, -2.682529, 1, 1, 1, 1, 1,
-0.6214834, -0.6658314, -2.494363, 0, 0, 1, 1, 1,
-0.6178859, -1.079855, -3.825683, 1, 0, 0, 1, 1,
-0.6177658, -0.01342537, -2.722061, 1, 0, 0, 1, 1,
-0.607116, 1.688645, -1.406744, 1, 0, 0, 1, 1,
-0.605263, 0.4814636, -1.896827, 1, 0, 0, 1, 1,
-0.6009589, 0.3133679, -0.7052713, 1, 0, 0, 1, 1,
-0.5976883, -0.3287629, -2.442422, 0, 0, 0, 1, 1,
-0.5974339, 2.067767, -0.1017505, 0, 0, 0, 1, 1,
-0.5968435, 1.986325, -1.111547, 0, 0, 0, 1, 1,
-0.5949258, -0.1410223, -0.7809793, 0, 0, 0, 1, 1,
-0.5915124, -1.135404, -2.782217, 0, 0, 0, 1, 1,
-0.5888233, 0.4360675, -0.3381107, 0, 0, 0, 1, 1,
-0.5870185, -0.5354899, -2.497283, 0, 0, 0, 1, 1,
-0.584065, -1.932702, -3.1812, 1, 1, 1, 1, 1,
-0.5795157, -0.2682467, -2.426574, 1, 1, 1, 1, 1,
-0.5767314, 1.201923, -0.4444654, 1, 1, 1, 1, 1,
-0.5746469, -0.5016165, -3.034751, 1, 1, 1, 1, 1,
-0.5741156, 1.75568, -0.4357716, 1, 1, 1, 1, 1,
-0.5691679, -0.1351438, -1.007973, 1, 1, 1, 1, 1,
-0.5673769, 0.6773427, -1.169092, 1, 1, 1, 1, 1,
-0.5669429, -0.4824738, -3.011954, 1, 1, 1, 1, 1,
-0.566187, 0.8079891, -1.549843, 1, 1, 1, 1, 1,
-0.5654037, 0.9886209, -0.7964748, 1, 1, 1, 1, 1,
-0.5615672, -1.646173, -3.159095, 1, 1, 1, 1, 1,
-0.5589203, -2.021429, -2.202653, 1, 1, 1, 1, 1,
-0.5572531, 0.668201, -0.5767521, 1, 1, 1, 1, 1,
-0.5572486, 0.9385247, -0.9436274, 1, 1, 1, 1, 1,
-0.5571224, 0.3639938, -0.3472313, 1, 1, 1, 1, 1,
-0.5557584, 0.6116459, 0.1305247, 0, 0, 1, 1, 1,
-0.5531365, 0.9190713, 1.065211, 1, 0, 0, 1, 1,
-0.5480172, -0.957903, -1.660628, 1, 0, 0, 1, 1,
-0.5459085, -1.118348, -1.671775, 1, 0, 0, 1, 1,
-0.5450482, 1.868021, -0.3964201, 1, 0, 0, 1, 1,
-0.54174, 0.2389937, -0.5178191, 1, 0, 0, 1, 1,
-0.5364702, -1.337917, -2.36565, 0, 0, 0, 1, 1,
-0.5356631, -0.6834301, -1.684495, 0, 0, 0, 1, 1,
-0.5245073, 0.5862519, -0.9098103, 0, 0, 0, 1, 1,
-0.5228415, -0.6062243, -3.551728, 0, 0, 0, 1, 1,
-0.5200763, -0.9295491, -3.187258, 0, 0, 0, 1, 1,
-0.5198594, 1.170331, -0.8398739, 0, 0, 0, 1, 1,
-0.5169662, -0.2991108, -2.181937, 0, 0, 0, 1, 1,
-0.5140693, -0.3193076, -1.335568, 1, 1, 1, 1, 1,
-0.5079787, 0.1771265, -0.9897321, 1, 1, 1, 1, 1,
-0.4937397, -0.08503718, -0.8013747, 1, 1, 1, 1, 1,
-0.4930475, -0.3005814, -2.29641, 1, 1, 1, 1, 1,
-0.4925733, -1.155434, -1.076529, 1, 1, 1, 1, 1,
-0.4906216, -0.07912751, -1.156876, 1, 1, 1, 1, 1,
-0.4848378, 0.6588933, -0.8763471, 1, 1, 1, 1, 1,
-0.4804401, -1.159013, -2.8206, 1, 1, 1, 1, 1,
-0.4787821, -0.5698349, -2.443693, 1, 1, 1, 1, 1,
-0.4775416, -0.4256462, -2.636758, 1, 1, 1, 1, 1,
-0.4748722, -0.07930521, -1.751172, 1, 1, 1, 1, 1,
-0.4732752, -0.5377325, -1.261203, 1, 1, 1, 1, 1,
-0.4712934, -0.3047684, -3.530792, 1, 1, 1, 1, 1,
-0.4709601, 0.2724406, -0.09425785, 1, 1, 1, 1, 1,
-0.4682896, -0.3123959, -1.149712, 1, 1, 1, 1, 1,
-0.467724, -0.4715548, -2.948684, 0, 0, 1, 1, 1,
-0.4653256, -0.6304229, -2.657078, 1, 0, 0, 1, 1,
-0.4651934, 0.03428955, -1.120424, 1, 0, 0, 1, 1,
-0.4629619, -1.170581, -2.384096, 1, 0, 0, 1, 1,
-0.4615594, -0.1558796, -2.239483, 1, 0, 0, 1, 1,
-0.4603952, 0.1144195, -0.6033908, 1, 0, 0, 1, 1,
-0.4589, -0.8093697, -1.39139, 0, 0, 0, 1, 1,
-0.4574673, -1.43892, -2.867545, 0, 0, 0, 1, 1,
-0.4547295, 0.5435395, -1.045359, 0, 0, 0, 1, 1,
-0.4546617, 0.0776229, -1.504956, 0, 0, 0, 1, 1,
-0.4540146, -1.701407, -2.22894, 0, 0, 0, 1, 1,
-0.4528894, 0.06322344, -1.755521, 0, 0, 0, 1, 1,
-0.4483852, -1.035389, -2.301142, 0, 0, 0, 1, 1,
-0.4467695, -1.058209, -2.579221, 1, 1, 1, 1, 1,
-0.4425704, 1.406914, -1.218825, 1, 1, 1, 1, 1,
-0.4424229, -0.1696659, -2.43965, 1, 1, 1, 1, 1,
-0.436394, 0.7077422, -1.422926, 1, 1, 1, 1, 1,
-0.4299665, 0.3983308, -0.001702347, 1, 1, 1, 1, 1,
-0.4294259, 0.779834, 0.9438832, 1, 1, 1, 1, 1,
-0.4276797, 1.185531, -0.1493254, 1, 1, 1, 1, 1,
-0.427397, -0.9147627, -3.195436, 1, 1, 1, 1, 1,
-0.4201314, 1.327454, 0.2340982, 1, 1, 1, 1, 1,
-0.4196557, -1.810348, -2.467581, 1, 1, 1, 1, 1,
-0.4160677, 0.6391082, -1.330523, 1, 1, 1, 1, 1,
-0.4153594, -2.698396, -2.032032, 1, 1, 1, 1, 1,
-0.4118081, -0.3062783, -0.8154703, 1, 1, 1, 1, 1,
-0.407213, 0.4343151, -0.003407001, 1, 1, 1, 1, 1,
-0.4057432, -1.210952, -3.908107, 1, 1, 1, 1, 1,
-0.4033394, -0.544486, -2.695471, 0, 0, 1, 1, 1,
-0.3985753, 0.581189, -0.7642784, 1, 0, 0, 1, 1,
-0.3903949, -0.8968539, -2.110193, 1, 0, 0, 1, 1,
-0.3897668, -0.4380822, -1.628087, 1, 0, 0, 1, 1,
-0.3891294, -1.172176, -2.167064, 1, 0, 0, 1, 1,
-0.3791533, -0.8962955, -3.446581, 1, 0, 0, 1, 1,
-0.3762734, 0.1419113, -1.854351, 0, 0, 0, 1, 1,
-0.3751254, -0.260457, -1.955278, 0, 0, 0, 1, 1,
-0.3718439, 1.152951, 0.6069186, 0, 0, 0, 1, 1,
-0.369588, -0.8281773, -1.936611, 0, 0, 0, 1, 1,
-0.3648552, -0.02380243, -1.401767, 0, 0, 0, 1, 1,
-0.3615329, 0.5885288, 0.573945, 0, 0, 0, 1, 1,
-0.3543941, 0.6592476, -0.3049104, 0, 0, 0, 1, 1,
-0.3528725, -0.89722, -3.154276, 1, 1, 1, 1, 1,
-0.3478578, -1.175099, -3.666215, 1, 1, 1, 1, 1,
-0.3476325, -0.8630978, -1.221475, 1, 1, 1, 1, 1,
-0.3411224, 1.665082, -0.2124474, 1, 1, 1, 1, 1,
-0.3381613, -0.4788236, -1.894706, 1, 1, 1, 1, 1,
-0.3327139, -0.9729073, -4.803599, 1, 1, 1, 1, 1,
-0.3325729, 0.8989916, -0.4265386, 1, 1, 1, 1, 1,
-0.3298871, 0.5324539, 0.3724464, 1, 1, 1, 1, 1,
-0.3249484, -0.0220258, -0.8408083, 1, 1, 1, 1, 1,
-0.3192748, 1.381456, -0.2565477, 1, 1, 1, 1, 1,
-0.3191681, 0.8069724, -0.3816404, 1, 1, 1, 1, 1,
-0.3178439, 0.3055852, -1.094312, 1, 1, 1, 1, 1,
-0.3166882, 0.6765782, 0.2705239, 1, 1, 1, 1, 1,
-0.3056763, -0.1184649, -2.429357, 1, 1, 1, 1, 1,
-0.3042907, -1.100949, -3.788968, 1, 1, 1, 1, 1,
-0.3015876, 1.658459, 1.942528, 0, 0, 1, 1, 1,
-0.3006538, -0.4846724, -2.773227, 1, 0, 0, 1, 1,
-0.2980134, 0.2282547, -1.101737, 1, 0, 0, 1, 1,
-0.2964654, 0.6520593, -1.617654, 1, 0, 0, 1, 1,
-0.2926079, -0.2312354, -3.424443, 1, 0, 0, 1, 1,
-0.2840682, -0.4533321, -1.441653, 1, 0, 0, 1, 1,
-0.2816959, 1.560939, -1.322733, 0, 0, 0, 1, 1,
-0.2816889, -0.1154571, -3.093992, 0, 0, 0, 1, 1,
-0.2752965, -1.026308, -2.583858, 0, 0, 0, 1, 1,
-0.2739487, 0.5287092, 0.4983875, 0, 0, 0, 1, 1,
-0.2727189, 1.437931, -0.5773866, 0, 0, 0, 1, 1,
-0.2720663, -0.5330865, -3.266837, 0, 0, 0, 1, 1,
-0.2658283, -0.9274885, -1.720105, 0, 0, 0, 1, 1,
-0.2634005, 0.8503212, -0.07317772, 1, 1, 1, 1, 1,
-0.2590222, 1.396265, -0.01072601, 1, 1, 1, 1, 1,
-0.2573256, -1.511428, -4.368778, 1, 1, 1, 1, 1,
-0.253237, 1.720335, -0.8591782, 1, 1, 1, 1, 1,
-0.25171, -1.454483, -4.068798, 1, 1, 1, 1, 1,
-0.2516617, 0.2882552, -0.5724704, 1, 1, 1, 1, 1,
-0.2504212, -1.084803, -2.111257, 1, 1, 1, 1, 1,
-0.2476475, 0.9887009, -0.5361578, 1, 1, 1, 1, 1,
-0.2473921, -0.8585832, -2.811347, 1, 1, 1, 1, 1,
-0.2464951, -1.104715, -3.863129, 1, 1, 1, 1, 1,
-0.2312916, -0.1602849, -1.337964, 1, 1, 1, 1, 1,
-0.2290075, -1.209538, -2.326519, 1, 1, 1, 1, 1,
-0.2240534, 0.8475404, 1.047606, 1, 1, 1, 1, 1,
-0.2207909, 0.6243768, -0.5467042, 1, 1, 1, 1, 1,
-0.2194397, 0.6881742, -1.541416, 1, 1, 1, 1, 1,
-0.2160904, 0.3756518, -0.3354558, 0, 0, 1, 1, 1,
-0.2144406, -2.780159, -1.091811, 1, 0, 0, 1, 1,
-0.213556, -0.6684142, -3.964482, 1, 0, 0, 1, 1,
-0.21113, -0.600194, -2.632369, 1, 0, 0, 1, 1,
-0.204766, -0.6094111, -5.193233, 1, 0, 0, 1, 1,
-0.1934692, -0.2919374, -2.355318, 1, 0, 0, 1, 1,
-0.1921921, -2.304567, -4.303201, 0, 0, 0, 1, 1,
-0.1919391, -1.132781, -4.357857, 0, 0, 0, 1, 1,
-0.1872071, -0.4246, -1.424665, 0, 0, 0, 1, 1,
-0.1867662, -0.07767832, -2.786518, 0, 0, 0, 1, 1,
-0.1804577, -0.143162, -3.543255, 0, 0, 0, 1, 1,
-0.178807, -0.913309, -2.948185, 0, 0, 0, 1, 1,
-0.1757569, -0.626228, -4.066854, 0, 0, 0, 1, 1,
-0.1757304, -0.3144255, -2.659053, 1, 1, 1, 1, 1,
-0.1735398, 0.1823896, 1.309651, 1, 1, 1, 1, 1,
-0.1733278, 0.9918358, -0.24869, 1, 1, 1, 1, 1,
-0.1692954, -2.339544, -1.889515, 1, 1, 1, 1, 1,
-0.1623421, 1.065986, 1.048284, 1, 1, 1, 1, 1,
-0.1610813, 0.8290961, -0.2026642, 1, 1, 1, 1, 1,
-0.1593071, -1.507306, -2.639126, 1, 1, 1, 1, 1,
-0.1575922, 0.01864821, -1.492121, 1, 1, 1, 1, 1,
-0.1489568, 0.2617322, 0.6285302, 1, 1, 1, 1, 1,
-0.147598, -0.8253744, -3.114996, 1, 1, 1, 1, 1,
-0.1446525, 0.3073274, -0.6770361, 1, 1, 1, 1, 1,
-0.1415034, -0.9701571, -1.210958, 1, 1, 1, 1, 1,
-0.1284831, 1.257112, -0.1217225, 1, 1, 1, 1, 1,
-0.1283581, -0.5383372, -2.245018, 1, 1, 1, 1, 1,
-0.123677, -0.1876111, -1.716395, 1, 1, 1, 1, 1,
-0.1196515, -0.1377302, 0.3352462, 0, 0, 1, 1, 1,
-0.1165894, 0.4690611, 2.310216, 1, 0, 0, 1, 1,
-0.1074475, 0.6149321, 0.3067655, 1, 0, 0, 1, 1,
-0.1005691, 0.472721, -0.2717627, 1, 0, 0, 1, 1,
-0.09997475, -0.507371, -3.640994, 1, 0, 0, 1, 1,
-0.09893116, -1.486098, -1.698563, 1, 0, 0, 1, 1,
-0.09763196, -2.900663, -5.325667, 0, 0, 0, 1, 1,
-0.09669788, 0.2056766, -0.8277589, 0, 0, 0, 1, 1,
-0.09635977, 0.4594709, 0.8600572, 0, 0, 0, 1, 1,
-0.09606971, 1.187654, -2.973288, 0, 0, 0, 1, 1,
-0.0951784, 1.172932, 0.3893579, 0, 0, 0, 1, 1,
-0.09452836, 1.829358, -0.8846125, 0, 0, 0, 1, 1,
-0.09001531, -1.085556, -3.228178, 0, 0, 0, 1, 1,
-0.08686146, 0.777307, -0.0641022, 1, 1, 1, 1, 1,
-0.08235724, -0.2914004, -3.094007, 1, 1, 1, 1, 1,
-0.08090387, 0.3001362, -0.01825864, 1, 1, 1, 1, 1,
-0.08021012, -0.1676859, -2.407379, 1, 1, 1, 1, 1,
-0.07550737, -0.5728378, -2.031674, 1, 1, 1, 1, 1,
-0.07465409, 0.756735, 0.2298097, 1, 1, 1, 1, 1,
-0.07392215, -0.3506857, -2.563923, 1, 1, 1, 1, 1,
-0.07363965, 0.2366686, -1.040152, 1, 1, 1, 1, 1,
-0.06807295, -1.337742, -3.303123, 1, 1, 1, 1, 1,
-0.06759166, 0.6323207, 1.677508, 1, 1, 1, 1, 1,
-0.06489387, 0.6566944, -0.1746739, 1, 1, 1, 1, 1,
-0.0647912, 0.09826541, 0.3629926, 1, 1, 1, 1, 1,
-0.06375396, 1.118267, 0.3906793, 1, 1, 1, 1, 1,
-0.06048995, 1.03534, -0.2101563, 1, 1, 1, 1, 1,
-0.05930519, -1.101006, -3.733025, 1, 1, 1, 1, 1,
-0.05881563, 0.7021303, 0.8131028, 0, 0, 1, 1, 1,
-0.05807886, -0.9516191, -3.017242, 1, 0, 0, 1, 1,
-0.05121538, -0.1620687, -4.991054, 1, 0, 0, 1, 1,
-0.04527086, 0.4094318, 1.185995, 1, 0, 0, 1, 1,
-0.04048097, -1.433006, -2.974092, 1, 0, 0, 1, 1,
-0.03963665, -1.411751, -3.791649, 1, 0, 0, 1, 1,
-0.03876493, -1.083221, -4.019081, 0, 0, 0, 1, 1,
-0.03852917, -0.6979942, -3.356266, 0, 0, 0, 1, 1,
-0.02793024, 0.5373827, -0.4331369, 0, 0, 0, 1, 1,
-0.02674487, 0.1548493, -0.1671005, 0, 0, 0, 1, 1,
-0.0250604, 1.609917, -0.6510451, 0, 0, 0, 1, 1,
-0.02379497, -1.531971, -1.998013, 0, 0, 0, 1, 1,
-0.02320003, 0.4420646, -0.2860786, 0, 0, 0, 1, 1,
-0.01280095, -0.6968166, -2.674591, 1, 1, 1, 1, 1,
-0.01197, -0.1773894, -3.4232, 1, 1, 1, 1, 1,
-0.009489382, -0.3636487, -1.894909, 1, 1, 1, 1, 1,
-0.006584537, 0.5414553, -0.7725884, 1, 1, 1, 1, 1,
0.002517061, -2.195352, 2.716101, 1, 1, 1, 1, 1,
0.003230095, 0.359782, -0.1208295, 1, 1, 1, 1, 1,
0.003375581, -0.8153775, 3.770006, 1, 1, 1, 1, 1,
0.004023971, 0.4479664, -0.2434648, 1, 1, 1, 1, 1,
0.007002512, 0.7505202, -1.271599, 1, 1, 1, 1, 1,
0.01286486, -0.4727706, 5.192264, 1, 1, 1, 1, 1,
0.01939848, -0.7861258, 3.360706, 1, 1, 1, 1, 1,
0.02160983, 0.2096477, 1.414089, 1, 1, 1, 1, 1,
0.02330672, 1.015084, -1.309443, 1, 1, 1, 1, 1,
0.03523509, -0.5168018, 2.144564, 1, 1, 1, 1, 1,
0.03949522, -0.8134664, 3.510888, 1, 1, 1, 1, 1,
0.04093572, -1.365769, 3.404948, 0, 0, 1, 1, 1,
0.04466517, 1.236353, -0.4105894, 1, 0, 0, 1, 1,
0.04534725, 2.041551, 0.3026492, 1, 0, 0, 1, 1,
0.04581777, 1.841423, -1.203792, 1, 0, 0, 1, 1,
0.04692088, -0.1404926, 2.904315, 1, 0, 0, 1, 1,
0.04769018, 0.7815704, 1.177752, 1, 0, 0, 1, 1,
0.04783886, -0.3107863, 2.55669, 0, 0, 0, 1, 1,
0.04966133, 0.2298482, -0.2750778, 0, 0, 0, 1, 1,
0.0497513, -0.5398946, 2.759716, 0, 0, 0, 1, 1,
0.0508201, -1.131453, 2.003343, 0, 0, 0, 1, 1,
0.05115891, 0.267256, 1.229605, 0, 0, 0, 1, 1,
0.05144231, 0.6559637, 1.466733, 0, 0, 0, 1, 1,
0.05419453, 0.4788009, 0.4551751, 0, 0, 0, 1, 1,
0.05443304, 2.119053, 1.176791, 1, 1, 1, 1, 1,
0.06232459, 0.6546294, 1.256493, 1, 1, 1, 1, 1,
0.06390654, -0.2819752, 4.269802, 1, 1, 1, 1, 1,
0.06391658, -0.4880367, 4.738302, 1, 1, 1, 1, 1,
0.06571193, -0.3519478, 2.29572, 1, 1, 1, 1, 1,
0.06659396, 0.5128692, 0.1011579, 1, 1, 1, 1, 1,
0.07174923, -0.8863389, 2.201696, 1, 1, 1, 1, 1,
0.07334801, -0.179342, 1.740248, 1, 1, 1, 1, 1,
0.07659706, 0.3447848, -0.4684722, 1, 1, 1, 1, 1,
0.07815901, -0.6613319, 2.48685, 1, 1, 1, 1, 1,
0.08244725, 1.012712, -0.03244626, 1, 1, 1, 1, 1,
0.08891805, -0.1858843, 1.579179, 1, 1, 1, 1, 1,
0.09099393, 1.2982, 0.4018083, 1, 1, 1, 1, 1,
0.09124375, 0.7683795, -1.167246, 1, 1, 1, 1, 1,
0.09172872, -0.4996247, 1.908078, 1, 1, 1, 1, 1,
0.09301217, 0.490373, 0.2598384, 0, 0, 1, 1, 1,
0.09523822, 0.2139272, 1.298007, 1, 0, 0, 1, 1,
0.09595107, 1.208463, -0.1369247, 1, 0, 0, 1, 1,
0.09892044, -0.6241106, 2.801084, 1, 0, 0, 1, 1,
0.1004847, -0.3850856, 2.820617, 1, 0, 0, 1, 1,
0.1014462, 0.9850398, 1.249837, 1, 0, 0, 1, 1,
0.1024547, -1.665933, 2.225647, 0, 0, 0, 1, 1,
0.102863, 0.8270437, -1.029858, 0, 0, 0, 1, 1,
0.1035545, 0.128831, 2.666213, 0, 0, 0, 1, 1,
0.1086342, 0.8674073, 0.07339249, 0, 0, 0, 1, 1,
0.1087915, 1.272922, -2.525527, 0, 0, 0, 1, 1,
0.1119397, 1.379628, 0.0530413, 0, 0, 0, 1, 1,
0.1124299, -0.4129185, 3.399402, 0, 0, 0, 1, 1,
0.1126418, -2.064549, 0.7719919, 1, 1, 1, 1, 1,
0.1128826, -0.0749855, 2.795487, 1, 1, 1, 1, 1,
0.1135948, 0.00464798, 2.14257, 1, 1, 1, 1, 1,
0.1154759, 1.188551, -0.6079917, 1, 1, 1, 1, 1,
0.1155381, 1.301423, -0.2969224, 1, 1, 1, 1, 1,
0.1244482, -0.5930921, 3.207896, 1, 1, 1, 1, 1,
0.128099, 0.5534546, 0.580978, 1, 1, 1, 1, 1,
0.1290959, -0.3807326, 3.752883, 1, 1, 1, 1, 1,
0.1342987, -0.8236202, 2.460267, 1, 1, 1, 1, 1,
0.1347668, -1.619363, 3.386693, 1, 1, 1, 1, 1,
0.1358563, -0.01977404, 3.189567, 1, 1, 1, 1, 1,
0.1383171, -0.1827644, 2.9713, 1, 1, 1, 1, 1,
0.1398239, -1.142926, 3.329695, 1, 1, 1, 1, 1,
0.1402236, 0.2828416, 1.364638, 1, 1, 1, 1, 1,
0.1426815, -0.1320058, 3.091081, 1, 1, 1, 1, 1,
0.1430206, -1.80495, 3.049105, 0, 0, 1, 1, 1,
0.1458443, 0.4237338, -1.464698, 1, 0, 0, 1, 1,
0.151213, 1.760487, -0.9887922, 1, 0, 0, 1, 1,
0.1518664, 0.304135, 0.2195968, 1, 0, 0, 1, 1,
0.1551209, 0.1312508, 1.144204, 1, 0, 0, 1, 1,
0.1554857, -1.940469, 3.848173, 1, 0, 0, 1, 1,
0.1565186, 0.1455323, 1.33009, 0, 0, 0, 1, 1,
0.1567151, 0.4641728, 1.549764, 0, 0, 0, 1, 1,
0.1604254, -0.3364749, 3.513286, 0, 0, 0, 1, 1,
0.1655352, -0.4773193, 2.105515, 0, 0, 0, 1, 1,
0.1669827, 0.04505932, 1.557988, 0, 0, 0, 1, 1,
0.1673974, 0.3967965, 1.589342, 0, 0, 0, 1, 1,
0.1675353, -1.776119, 3.025366, 0, 0, 0, 1, 1,
0.1678979, -0.2059922, 1.690463, 1, 1, 1, 1, 1,
0.1732484, 0.8363047, 0.03198757, 1, 1, 1, 1, 1,
0.1739355, -1.555869, 2.669191, 1, 1, 1, 1, 1,
0.1741635, -0.8263294, 3.471518, 1, 1, 1, 1, 1,
0.1753404, 0.7497406, 0.4166748, 1, 1, 1, 1, 1,
0.1764323, -0.3464247, 1.346721, 1, 1, 1, 1, 1,
0.1766061, -1.337602, 4.156855, 1, 1, 1, 1, 1,
0.177301, -0.4336492, 2.092368, 1, 1, 1, 1, 1,
0.1869698, -1.213348, 3.452338, 1, 1, 1, 1, 1,
0.1988164, 0.3867703, 1.776168, 1, 1, 1, 1, 1,
0.2003394, -1.905613, 1.152774, 1, 1, 1, 1, 1,
0.2008864, 0.9666331, -0.1712651, 1, 1, 1, 1, 1,
0.2033909, -1.11676, 1.985776, 1, 1, 1, 1, 1,
0.2039378, -0.3074697, 4.236638, 1, 1, 1, 1, 1,
0.2055022, 0.2237321, 1.554347, 1, 1, 1, 1, 1,
0.2072885, -1.188795, 3.350673, 0, 0, 1, 1, 1,
0.2087425, 0.07092125, 0.5758795, 1, 0, 0, 1, 1,
0.2117838, 1.899852, 0.6056933, 1, 0, 0, 1, 1,
0.2146709, 0.346104, 1.217883, 1, 0, 0, 1, 1,
0.215535, 0.5601698, -0.369332, 1, 0, 0, 1, 1,
0.2190197, -0.2322263, 3.713815, 1, 0, 0, 1, 1,
0.2190263, -1.201422, 1.626053, 0, 0, 0, 1, 1,
0.2192211, 0.5332224, -1.89503, 0, 0, 0, 1, 1,
0.2228334, 1.206655, -1.19694, 0, 0, 0, 1, 1,
0.2268324, -1.41665, 1.662449, 0, 0, 0, 1, 1,
0.2315161, -0.4523585, 3.028192, 0, 0, 0, 1, 1,
0.2318456, 0.8055536, -0.1764659, 0, 0, 0, 1, 1,
0.2336651, -0.8991323, 2.334928, 0, 0, 0, 1, 1,
0.2385134, 0.6339257, 0.8440614, 1, 1, 1, 1, 1,
0.2394303, -0.03408514, 0.06093933, 1, 1, 1, 1, 1,
0.2429723, -1.338347, 3.325164, 1, 1, 1, 1, 1,
0.2494601, -1.492025, 3.76968, 1, 1, 1, 1, 1,
0.2523324, -1.220135, 3.607544, 1, 1, 1, 1, 1,
0.2567258, -0.6635968, 1.496062, 1, 1, 1, 1, 1,
0.2574143, -0.3089998, 3.03961, 1, 1, 1, 1, 1,
0.2583545, -0.3600071, 3.277715, 1, 1, 1, 1, 1,
0.2585913, -0.3977135, 3.021408, 1, 1, 1, 1, 1,
0.2594973, -1.429382, 3.246704, 1, 1, 1, 1, 1,
0.2621075, -0.4101602, 4.084388, 1, 1, 1, 1, 1,
0.2643384, -0.8728017, 2.593845, 1, 1, 1, 1, 1,
0.264653, 0.4429224, 0.3753068, 1, 1, 1, 1, 1,
0.2665474, 0.0756047, -0.377566, 1, 1, 1, 1, 1,
0.2694185, -0.4921063, 3.161236, 1, 1, 1, 1, 1,
0.2695105, -1.047963, 1.923798, 0, 0, 1, 1, 1,
0.2759952, 0.2133887, 1.533247, 1, 0, 0, 1, 1,
0.2826848, 0.4338936, 1.562659, 1, 0, 0, 1, 1,
0.2838348, -0.5089843, 2.140217, 1, 0, 0, 1, 1,
0.2884909, -0.7768113, 2.528008, 1, 0, 0, 1, 1,
0.2903738, -1.221602, 3.018188, 1, 0, 0, 1, 1,
0.2953557, -0.4088808, 2.496544, 0, 0, 0, 1, 1,
0.2957001, -0.01109604, 2.471641, 0, 0, 0, 1, 1,
0.2958644, 1.186367, 0.1557619, 0, 0, 0, 1, 1,
0.3138597, 0.2210525, 1.133074, 0, 0, 0, 1, 1,
0.3188841, 2.045279, 0.5437083, 0, 0, 0, 1, 1,
0.3194025, 1.200008, 0.6363067, 0, 0, 0, 1, 1,
0.3217391, -0.1279357, 0.4428057, 0, 0, 0, 1, 1,
0.3235326, -0.4475775, 1.813634, 1, 1, 1, 1, 1,
0.3270371, 0.6537808, -0.5130248, 1, 1, 1, 1, 1,
0.3282778, 0.6550542, -0.1667139, 1, 1, 1, 1, 1,
0.3283685, -0.5809079, 2.304793, 1, 1, 1, 1, 1,
0.3312027, 0.7999981, 0.649209, 1, 1, 1, 1, 1,
0.3332339, 0.07383486, 1.111282, 1, 1, 1, 1, 1,
0.3334389, -1.341826, 2.626857, 1, 1, 1, 1, 1,
0.3338206, -1.136971, 0.630193, 1, 1, 1, 1, 1,
0.3372907, 1.496803, -1.86556, 1, 1, 1, 1, 1,
0.3416385, 0.9988477, -0.4382314, 1, 1, 1, 1, 1,
0.3427743, -1.360615, 3.191849, 1, 1, 1, 1, 1,
0.3438686, -0.1574705, 1.010671, 1, 1, 1, 1, 1,
0.3495498, 1.767691, -0.6098027, 1, 1, 1, 1, 1,
0.3522396, 0.1144927, -0.03207153, 1, 1, 1, 1, 1,
0.3554927, -1.956113, 4.145075, 1, 1, 1, 1, 1,
0.3557401, -0.03831822, 1.723816, 0, 0, 1, 1, 1,
0.3580557, 1.326529, -0.8927236, 1, 0, 0, 1, 1,
0.3586157, 1.368152, -1.494573, 1, 0, 0, 1, 1,
0.3594453, 0.01067736, 1.558213, 1, 0, 0, 1, 1,
0.3617847, 0.2174534, 2.924812, 1, 0, 0, 1, 1,
0.3696325, 1.121818, 1.459939, 1, 0, 0, 1, 1,
0.3779185, 0.1297734, 1.063156, 0, 0, 0, 1, 1,
0.387321, 0.61493, -0.04139111, 0, 0, 0, 1, 1,
0.3886087, -1.061989, 4.074829, 0, 0, 0, 1, 1,
0.3915405, -0.02241456, 1.228529, 0, 0, 0, 1, 1,
0.3916821, -0.02854252, 0.05246247, 0, 0, 0, 1, 1,
0.3917064, 2.23819, 1.578828, 0, 0, 0, 1, 1,
0.397756, -1.615104, 3.642403, 0, 0, 0, 1, 1,
0.398128, 1.078938, 1.284152, 1, 1, 1, 1, 1,
0.4000951, -1.207947, 2.527183, 1, 1, 1, 1, 1,
0.4037506, -0.4020504, 2.899009, 1, 1, 1, 1, 1,
0.4057361, -0.4021399, 1.42192, 1, 1, 1, 1, 1,
0.4058945, 0.1022473, -0.1264309, 1, 1, 1, 1, 1,
0.405991, -0.6089886, 3.716784, 1, 1, 1, 1, 1,
0.4070858, 1.018715, 1.117875, 1, 1, 1, 1, 1,
0.4083829, 0.3002815, -0.8190464, 1, 1, 1, 1, 1,
0.4159294, -0.1858698, 0.3657878, 1, 1, 1, 1, 1,
0.4181417, -0.003615423, 1.378691, 1, 1, 1, 1, 1,
0.4207928, 0.4448262, 1.108869, 1, 1, 1, 1, 1,
0.4235539, 0.9414797, 0.08593446, 1, 1, 1, 1, 1,
0.4290237, 1.030306, 0.5570806, 1, 1, 1, 1, 1,
0.4327513, -0.3134167, 1.464448, 1, 1, 1, 1, 1,
0.4334833, 0.7419795, -0.7492787, 1, 1, 1, 1, 1,
0.4360309, -0.06728576, 2.342587, 0, 0, 1, 1, 1,
0.4365513, -0.03342136, 1.546153, 1, 0, 0, 1, 1,
0.4382567, -0.4153967, 4.029768, 1, 0, 0, 1, 1,
0.4396773, 1.11431, -0.6395674, 1, 0, 0, 1, 1,
0.4438182, 0.7619171, 0.718449, 1, 0, 0, 1, 1,
0.4534966, 0.6757765, 0.6749212, 1, 0, 0, 1, 1,
0.4543923, 1.328767, -0.6701603, 0, 0, 0, 1, 1,
0.4572473, -1.205864, 3.24088, 0, 0, 0, 1, 1,
0.4584982, -0.0004924297, 1.102869, 0, 0, 0, 1, 1,
0.4594476, -2.201692, 2.558155, 0, 0, 0, 1, 1,
0.4600986, 0.1752836, 3.063805, 0, 0, 0, 1, 1,
0.4617101, 1.004348, 0.9267447, 0, 0, 0, 1, 1,
0.4623046, 0.9360293, -0.9434327, 0, 0, 0, 1, 1,
0.4707681, -1.985927, 4.549557, 1, 1, 1, 1, 1,
0.4715062, 1.728124, 0.4773146, 1, 1, 1, 1, 1,
0.4741947, -0.5979659, 0.4192942, 1, 1, 1, 1, 1,
0.4763385, 1.307763, 0.2745117, 1, 1, 1, 1, 1,
0.4798754, 1.146324, 0.563135, 1, 1, 1, 1, 1,
0.4850397, -0.6474213, 1.306197, 1, 1, 1, 1, 1,
0.4857562, 0.6748905, 0.2482718, 1, 1, 1, 1, 1,
0.4858123, 1.084445, -0.06370618, 1, 1, 1, 1, 1,
0.4876559, 0.2144338, -0.460752, 1, 1, 1, 1, 1,
0.4920731, 2.113471, 0.6209427, 1, 1, 1, 1, 1,
0.4922014, 0.07170291, 1.342005, 1, 1, 1, 1, 1,
0.4937201, 1.932663, 0.4372633, 1, 1, 1, 1, 1,
0.4964879, -0.4910423, 1.795865, 1, 1, 1, 1, 1,
0.5011287, -0.3876045, 1.154702, 1, 1, 1, 1, 1,
0.5051624, 0.7903379, 0.6508595, 1, 1, 1, 1, 1,
0.5051971, -0.02410792, 0.3112585, 0, 0, 1, 1, 1,
0.5065153, 1.499097, -0.1630062, 1, 0, 0, 1, 1,
0.5092284, -0.2089808, 1.746619, 1, 0, 0, 1, 1,
0.513382, -1.349748, 3.073671, 1, 0, 0, 1, 1,
0.5224497, 0.1873226, 1.241543, 1, 0, 0, 1, 1,
0.5244421, 0.1336306, 2.110558, 1, 0, 0, 1, 1,
0.5246584, 0.8745558, 1.8318, 0, 0, 0, 1, 1,
0.5286104, 0.3118626, -0.07744111, 0, 0, 0, 1, 1,
0.5290641, -2.897679, 1.806195, 0, 0, 0, 1, 1,
0.5319247, 0.3141857, 0.3894737, 0, 0, 0, 1, 1,
0.5325252, 0.7749453, 1.406856, 0, 0, 0, 1, 1,
0.5351933, -1.237406, 2.688882, 0, 0, 0, 1, 1,
0.5393028, 0.03341495, 0.8879071, 0, 0, 0, 1, 1,
0.5495735, 0.09328375, 1.705266, 1, 1, 1, 1, 1,
0.5511299, 0.1914495, 1.054314, 1, 1, 1, 1, 1,
0.5514516, -1.30121, 1.656017, 1, 1, 1, 1, 1,
0.5522588, 1.195966, 0.9104832, 1, 1, 1, 1, 1,
0.5524845, -1.806523, 3.9604, 1, 1, 1, 1, 1,
0.5542803, 0.3498789, 0.5530407, 1, 1, 1, 1, 1,
0.5558475, -1.225138, 3.43267, 1, 1, 1, 1, 1,
0.5601512, -1.905499, 2.30805, 1, 1, 1, 1, 1,
0.5612845, -0.1348951, 1.535202, 1, 1, 1, 1, 1,
0.5661183, 0.4667838, 0.774232, 1, 1, 1, 1, 1,
0.5667714, -0.307628, 4.133518, 1, 1, 1, 1, 1,
0.5715066, -0.5779548, 1.937819, 1, 1, 1, 1, 1,
0.5769126, 0.4155033, 0.669261, 1, 1, 1, 1, 1,
0.5862644, 0.3711723, 0.2414074, 1, 1, 1, 1, 1,
0.5924096, -1.148577, 2.420149, 1, 1, 1, 1, 1,
0.6001567, 1.161225, -0.7471349, 0, 0, 1, 1, 1,
0.6001951, -0.3854774, 2.909547, 1, 0, 0, 1, 1,
0.6005248, -0.8112743, 0.5042753, 1, 0, 0, 1, 1,
0.6016765, 1.029792, 0.3409253, 1, 0, 0, 1, 1,
0.6082324, 0.9508744, 0.7301315, 1, 0, 0, 1, 1,
0.614013, -1.078162, 3.167801, 1, 0, 0, 1, 1,
0.6169279, -1.061784, 2.271116, 0, 0, 0, 1, 1,
0.6214999, 1.578256, -1.400022, 0, 0, 0, 1, 1,
0.6291056, 0.0913609, 2.593903, 0, 0, 0, 1, 1,
0.6311815, -0.8925864, 3.706622, 0, 0, 0, 1, 1,
0.6365474, -0.3964715, 3.733185, 0, 0, 0, 1, 1,
0.6368378, -0.7288986, 2.254707, 0, 0, 0, 1, 1,
0.6388211, -0.1218685, 2.651196, 0, 0, 0, 1, 1,
0.6400797, -0.757112, 2.765842, 1, 1, 1, 1, 1,
0.6447753, 0.435904, 0.3674362, 1, 1, 1, 1, 1,
0.6524404, 1.671568, 1.822729, 1, 1, 1, 1, 1,
0.6555427, -0.2095123, 1.684662, 1, 1, 1, 1, 1,
0.6572539, -0.4647498, 2.486344, 1, 1, 1, 1, 1,
0.6600372, -0.6473194, 2.737941, 1, 1, 1, 1, 1,
0.664851, 0.762957, 0.7958118, 1, 1, 1, 1, 1,
0.6699321, 0.08456847, 0.8391793, 1, 1, 1, 1, 1,
0.6702499, 0.9294692, 0.9122128, 1, 1, 1, 1, 1,
0.6706688, -0.9962685, 3.539141, 1, 1, 1, 1, 1,
0.6756598, -0.3591061, 0.5700722, 1, 1, 1, 1, 1,
0.6773361, -0.1241981, 1.432875, 1, 1, 1, 1, 1,
0.6805671, -0.3751852, 1.392069, 1, 1, 1, 1, 1,
0.6818705, 0.232572, 2.232963, 1, 1, 1, 1, 1,
0.6875858, -0.1543017, 2.034592, 1, 1, 1, 1, 1,
0.6981704, -0.7917812, 1.457318, 0, 0, 1, 1, 1,
0.6982751, 2.340898, -0.8133092, 1, 0, 0, 1, 1,
0.7013315, 2.469682, -0.3602289, 1, 0, 0, 1, 1,
0.7095361, -0.2616684, 1.942554, 1, 0, 0, 1, 1,
0.7097087, 1.077315, 0.7560884, 1, 0, 0, 1, 1,
0.7112308, 1.318308, 0.472616, 1, 0, 0, 1, 1,
0.7136453, 0.569714, 1.187239, 0, 0, 0, 1, 1,
0.7197745, 0.246536, 1.51691, 0, 0, 0, 1, 1,
0.7204134, 0.2568917, 1.716593, 0, 0, 0, 1, 1,
0.7229981, -1.359, 3.244957, 0, 0, 0, 1, 1,
0.7232143, -0.1273596, 0.8990833, 0, 0, 0, 1, 1,
0.7410873, -0.3960727, 2.034515, 0, 0, 0, 1, 1,
0.7435533, 0.7479836, -0.4039991, 0, 0, 0, 1, 1,
0.7460589, -1.151071, 3.274528, 1, 1, 1, 1, 1,
0.7469275, 0.6458303, 0.2512535, 1, 1, 1, 1, 1,
0.750012, -0.6683689, 2.125143, 1, 1, 1, 1, 1,
0.7543869, 0.9756505, 0.6834594, 1, 1, 1, 1, 1,
0.7555432, 0.2621012, 1.729099, 1, 1, 1, 1, 1,
0.7610567, -1.498981, 3.228344, 1, 1, 1, 1, 1,
0.7613107, -1.759629, 3.549833, 1, 1, 1, 1, 1,
0.7640842, -0.3247446, 1.10078, 1, 1, 1, 1, 1,
0.7666591, -0.4912863, -0.1170051, 1, 1, 1, 1, 1,
0.7717761, 0.2806171, 1.298444, 1, 1, 1, 1, 1,
0.7742669, 1.212433, 0.9372636, 1, 1, 1, 1, 1,
0.7793275, 0.6527253, 0.6170373, 1, 1, 1, 1, 1,
0.7848824, 0.957602, 0.2733213, 1, 1, 1, 1, 1,
0.7850089, -0.6961482, 3.325539, 1, 1, 1, 1, 1,
0.7882873, -1.014518, 1.090489, 1, 1, 1, 1, 1,
0.7883475, 0.1216937, 1.520572, 0, 0, 1, 1, 1,
0.7885134, 1.967343, 1.316713, 1, 0, 0, 1, 1,
0.7931921, 0.7268422, 1.787954, 1, 0, 0, 1, 1,
0.7933263, 0.8219666, -1.622408, 1, 0, 0, 1, 1,
0.8004581, 0.7720198, 0.7778195, 1, 0, 0, 1, 1,
0.8064927, 0.5291674, 1.036911, 1, 0, 0, 1, 1,
0.8094949, 1.421191, 0.1926222, 0, 0, 0, 1, 1,
0.8095824, 0.6009108, 1.868011, 0, 0, 0, 1, 1,
0.8102105, 0.9803253, 0.334872, 0, 0, 0, 1, 1,
0.8151502, -0.6470571, 3.444984, 0, 0, 0, 1, 1,
0.8159001, 1.319597, -0.02272773, 0, 0, 0, 1, 1,
0.8192032, 0.05960606, 1.730053, 0, 0, 0, 1, 1,
0.8291714, 0.1698817, 1.278419, 0, 0, 0, 1, 1,
0.8317257, -0.6586936, 1.589311, 1, 1, 1, 1, 1,
0.8364521, 0.7768359, -0.2043654, 1, 1, 1, 1, 1,
0.8456261, 1.189229, -0.1313196, 1, 1, 1, 1, 1,
0.8460621, 0.1374615, 3.444738, 1, 1, 1, 1, 1,
0.8486172, 0.4626563, 0.6161589, 1, 1, 1, 1, 1,
0.8497114, 0.1136783, 0.4426816, 1, 1, 1, 1, 1,
0.850768, -0.422133, 0.7596715, 1, 1, 1, 1, 1,
0.8561711, -1.318715, 4.983758, 1, 1, 1, 1, 1,
0.8577207, -1.151152, 3.995173, 1, 1, 1, 1, 1,
0.8583145, 1.944156, -0.2308479, 1, 1, 1, 1, 1,
0.8628297, 0.08578291, 2.308041, 1, 1, 1, 1, 1,
0.86599, 0.004657151, 1.593538, 1, 1, 1, 1, 1,
0.8676257, 1.211497, 1.139206, 1, 1, 1, 1, 1,
0.868714, 0.05411094, 1.763131, 1, 1, 1, 1, 1,
0.8689147, 1.561919, 1.875669, 1, 1, 1, 1, 1,
0.8741663, -0.6172122, 3.398815, 0, 0, 1, 1, 1,
0.8742319, -0.4018049, 3.759134, 1, 0, 0, 1, 1,
0.8766886, 0.5756095, 1.732689, 1, 0, 0, 1, 1,
0.8801152, -0.8347443, 0.9750667, 1, 0, 0, 1, 1,
0.8818927, -1.367575, 3.546298, 1, 0, 0, 1, 1,
0.8923358, 1.427066, -0.3112192, 1, 0, 0, 1, 1,
0.8929604, -1.967495, 1.988582, 0, 0, 0, 1, 1,
0.8979387, -1.625682, 2.884638, 0, 0, 0, 1, 1,
0.8983795, 1.41448, 2.159622, 0, 0, 0, 1, 1,
0.9181998, -0.8231568, 0.4318204, 0, 0, 0, 1, 1,
0.9189073, 1.393698, -0.4178273, 0, 0, 0, 1, 1,
0.9208263, -0.3072225, 1.084449, 0, 0, 0, 1, 1,
0.9212053, -0.6469443, 4.228944, 0, 0, 0, 1, 1,
0.9261603, -1.197456, 1.929548, 1, 1, 1, 1, 1,
0.9267402, 0.6564245, -0.6980225, 1, 1, 1, 1, 1,
0.9301958, -0.8356997, 3.942048, 1, 1, 1, 1, 1,
0.9303144, -0.5119655, 0.1220789, 1, 1, 1, 1, 1,
0.9325529, -0.3623853, 1.889231, 1, 1, 1, 1, 1,
0.9347544, -0.306807, 2.38376, 1, 1, 1, 1, 1,
0.9370759, -0.2043131, -0.5350589, 1, 1, 1, 1, 1,
0.9417965, -0.5036885, 0.7747113, 1, 1, 1, 1, 1,
0.942036, 1.814626, 1.696038, 1, 1, 1, 1, 1,
0.9437977, 0.27897, 1.205315, 1, 1, 1, 1, 1,
0.9444008, -0.09169532, 1.659579, 1, 1, 1, 1, 1,
0.9507759, -0.07203477, 2.228558, 1, 1, 1, 1, 1,
0.9546024, -0.1245415, 1.207792, 1, 1, 1, 1, 1,
0.9569327, -0.6485054, 1.465585, 1, 1, 1, 1, 1,
0.9632788, -0.6580139, 1.5165, 1, 1, 1, 1, 1,
0.9655705, 0.9707018, 1.336402, 0, 0, 1, 1, 1,
0.9658518, -0.5932382, 1.109336, 1, 0, 0, 1, 1,
0.969301, 1.361584, 0.8502229, 1, 0, 0, 1, 1,
0.9715537, 1.248135, 2.749133, 1, 0, 0, 1, 1,
0.9740841, -0.1392765, 2.305615, 1, 0, 0, 1, 1,
0.9776984, -0.6369388, 1.975299, 1, 0, 0, 1, 1,
0.9786837, 2.000238, 0.2019518, 0, 0, 0, 1, 1,
0.9798232, -0.01780093, 0.8346404, 0, 0, 0, 1, 1,
0.9798382, 1.560969, 2.944706, 0, 0, 0, 1, 1,
0.9831954, 0.7865627, 1.031288, 0, 0, 0, 1, 1,
0.9905622, 0.7046584, 1.561615, 0, 0, 0, 1, 1,
0.9931177, -0.8515317, 2.790193, 0, 0, 0, 1, 1,
0.9963881, 1.757722, 1.413401, 0, 0, 0, 1, 1,
1.004578, -1.102754, 2.607543, 1, 1, 1, 1, 1,
1.004824, -0.227371, 0.5992453, 1, 1, 1, 1, 1,
1.005302, 2.430076, -0.7649027, 1, 1, 1, 1, 1,
1.009431, -0.3292569, 2.417498, 1, 1, 1, 1, 1,
1.009906, 0.1240239, 3.086916, 1, 1, 1, 1, 1,
1.012473, -2.045523, 3.833031, 1, 1, 1, 1, 1,
1.013227, 0.978327, 0.1874002, 1, 1, 1, 1, 1,
1.015022, 1.807183, -0.7701123, 1, 1, 1, 1, 1,
1.0162, -2.030736, 3.000577, 1, 1, 1, 1, 1,
1.019803, 0.8199281, 2.256561, 1, 1, 1, 1, 1,
1.022801, -1.929879, 4.878754, 1, 1, 1, 1, 1,
1.038151, -1.637237, 3.047798, 1, 1, 1, 1, 1,
1.043992, 0.188198, 1.604111, 1, 1, 1, 1, 1,
1.052161, -1.074018, 2.93824, 1, 1, 1, 1, 1,
1.053174, 0.611508, 2.372001, 1, 1, 1, 1, 1,
1.054388, 0.9041152, 0.8050906, 0, 0, 1, 1, 1,
1.054933, 0.7451693, 1.530834, 1, 0, 0, 1, 1,
1.055579, 0.5650637, 1.472317, 1, 0, 0, 1, 1,
1.078293, -2.178149, 4.148192, 1, 0, 0, 1, 1,
1.080221, 0.6796808, 1.647449, 1, 0, 0, 1, 1,
1.081921, 0.4628174, 2.354487, 1, 0, 0, 1, 1,
1.0848, -0.6993447, 1.287509, 0, 0, 0, 1, 1,
1.098792, 0.5594336, 0.4423548, 0, 0, 0, 1, 1,
1.10089, 1.446274, 1.621985, 0, 0, 0, 1, 1,
1.105054, -0.2826362, 2.533504, 0, 0, 0, 1, 1,
1.109232, -2.046751, 4.425145, 0, 0, 0, 1, 1,
1.127388, -0.2572503, 4.738053, 0, 0, 0, 1, 1,
1.129489, 1.823287, -0.5314786, 0, 0, 0, 1, 1,
1.129748, -0.5556036, 2.223479, 1, 1, 1, 1, 1,
1.149805, -0.446072, 1.065064, 1, 1, 1, 1, 1,
1.151144, -2.08722, 4.689594, 1, 1, 1, 1, 1,
1.156817, -0.1997455, 2.402505, 1, 1, 1, 1, 1,
1.157606, -0.3531909, 1.384169, 1, 1, 1, 1, 1,
1.168621, -0.3118036, 1.238791, 1, 1, 1, 1, 1,
1.169434, -1.055652, 0.4872596, 1, 1, 1, 1, 1,
1.182561, -0.0309142, 2.705928, 1, 1, 1, 1, 1,
1.184459, -0.1584463, 2.923147, 1, 1, 1, 1, 1,
1.185792, -3.188362, 3.553153, 1, 1, 1, 1, 1,
1.185932, 1.510849, 2.5035, 1, 1, 1, 1, 1,
1.195182, 0.6729874, 0.04234278, 1, 1, 1, 1, 1,
1.196015, -0.2377992, 0.3323646, 1, 1, 1, 1, 1,
1.209415, 0.2595633, 1.339424, 1, 1, 1, 1, 1,
1.214145, -0.5466053, 2.877583, 1, 1, 1, 1, 1,
1.214765, 0.1398647, 0.4072978, 0, 0, 1, 1, 1,
1.220228, 0.3271885, 3.040867, 1, 0, 0, 1, 1,
1.221795, -1.420767, 2.496763, 1, 0, 0, 1, 1,
1.222212, -1.027492, 2.145429, 1, 0, 0, 1, 1,
1.226528, 1.038256, -0.2877465, 1, 0, 0, 1, 1,
1.227094, 0.2148025, 0.816973, 1, 0, 0, 1, 1,
1.229491, -1.933091, 2.608288, 0, 0, 0, 1, 1,
1.232181, 1.469038, 0.7267719, 0, 0, 0, 1, 1,
1.239417, 0.9800891, 2.21381, 0, 0, 0, 1, 1,
1.241802, -1.422398, 2.818486, 0, 0, 0, 1, 1,
1.245166, -0.7058581, 1.567884, 0, 0, 0, 1, 1,
1.250897, 1.181655, 1.000362, 0, 0, 0, 1, 1,
1.252425, 1.157701, 1.645678, 0, 0, 0, 1, 1,
1.254882, -0.8686806, 2.704761, 1, 1, 1, 1, 1,
1.261905, 0.6397793, -0.1503411, 1, 1, 1, 1, 1,
1.261932, 0.1034025, 0.1138697, 1, 1, 1, 1, 1,
1.262335, 1.06685, 2.852147, 1, 1, 1, 1, 1,
1.266241, -0.3163689, 0.8243753, 1, 1, 1, 1, 1,
1.269456, 1.152552, -0.10129, 1, 1, 1, 1, 1,
1.27705, 0.9184901, 0.670531, 1, 1, 1, 1, 1,
1.277543, -0.4280944, 2.698093, 1, 1, 1, 1, 1,
1.281591, 1.286913, 1.063176, 1, 1, 1, 1, 1,
1.282148, -0.6930092, 2.503474, 1, 1, 1, 1, 1,
1.293802, -1.670525, 3.420521, 1, 1, 1, 1, 1,
1.30311, -1.026146, 2.739369, 1, 1, 1, 1, 1,
1.306553, -1.219264, 3.31414, 1, 1, 1, 1, 1,
1.319803, -0.6800967, 0.1441503, 1, 1, 1, 1, 1,
1.328746, -0.7400372, 2.278224, 1, 1, 1, 1, 1,
1.330522, -0.5315508, 3.105854, 0, 0, 1, 1, 1,
1.332775, -0.04727794, 1.630377, 1, 0, 0, 1, 1,
1.332929, -0.3587778, 2.143985, 1, 0, 0, 1, 1,
1.334183, -0.675333, 2.291948, 1, 0, 0, 1, 1,
1.339023, -1.736755, 2.311028, 1, 0, 0, 1, 1,
1.339068, 1.711322, 2.094621, 1, 0, 0, 1, 1,
1.341377, 0.7336074, 1.054818, 0, 0, 0, 1, 1,
1.341675, 0.09106922, 1.832522, 0, 0, 0, 1, 1,
1.349657, -2.653149, 0.9284633, 0, 0, 0, 1, 1,
1.354331, -0.05410851, 0.3989575, 0, 0, 0, 1, 1,
1.362244, 0.7580826, 1.360645, 0, 0, 0, 1, 1,
1.371709, -1.611617, 2.524673, 0, 0, 0, 1, 1,
1.390284, 0.1699314, 1.604988, 0, 0, 0, 1, 1,
1.391406, -1.411111, 1.95654, 1, 1, 1, 1, 1,
1.396627, -1.497873, 4.760155, 1, 1, 1, 1, 1,
1.397391, 0.568665, 1.177009, 1, 1, 1, 1, 1,
1.409466, -1.577982, 2.896146, 1, 1, 1, 1, 1,
1.417315, -1.50717, 3.006626, 1, 1, 1, 1, 1,
1.420361, 0.7902444, 0.3215473, 1, 1, 1, 1, 1,
1.43575, -0.239415, 1.401438, 1, 1, 1, 1, 1,
1.44176, 0.8047315, -0.1938109, 1, 1, 1, 1, 1,
1.441866, -0.270836, 2.242996, 1, 1, 1, 1, 1,
1.464119, -1.277993, 2.492352, 1, 1, 1, 1, 1,
1.473195, -0.2102813, 2.794863, 1, 1, 1, 1, 1,
1.487531, 0.7588004, 1.861168, 1, 1, 1, 1, 1,
1.498911, 0.3845752, 2.527082, 1, 1, 1, 1, 1,
1.511673, -0.8969939, 2.490711, 1, 1, 1, 1, 1,
1.521073, -0.2885807, 2.899018, 1, 1, 1, 1, 1,
1.536938, -0.4637537, 0.8405625, 0, 0, 1, 1, 1,
1.537915, 0.6750162, 0.8383278, 1, 0, 0, 1, 1,
1.543957, -0.6155357, 1.693185, 1, 0, 0, 1, 1,
1.553654, 0.7469263, 2.59141, 1, 0, 0, 1, 1,
1.570454, -0.8020489, 1.14162, 1, 0, 0, 1, 1,
1.571185, -0.1270601, 1.249773, 1, 0, 0, 1, 1,
1.574234, 0.05976044, 2.407731, 0, 0, 0, 1, 1,
1.576741, 0.6439358, 0.3889331, 0, 0, 0, 1, 1,
1.586616, 1.109062, 1.863592, 0, 0, 0, 1, 1,
1.596833, 0.2634031, 2.153389, 0, 0, 0, 1, 1,
1.61001, 0.6145913, 1.768865, 0, 0, 0, 1, 1,
1.617751, -0.6088243, 1.901984, 0, 0, 0, 1, 1,
1.619481, 0.7273924, 0.6029841, 0, 0, 0, 1, 1,
1.630309, 2.291201, -0.4690896, 1, 1, 1, 1, 1,
1.639609, 1.001819, 0.407436, 1, 1, 1, 1, 1,
1.642936, -0.5362996, 1.286723, 1, 1, 1, 1, 1,
1.654002, -0.04908934, 1.947634, 1, 1, 1, 1, 1,
1.672126, -2.107091, 2.169273, 1, 1, 1, 1, 1,
1.683684, 1.41959, 0.4578761, 1, 1, 1, 1, 1,
1.704802, -0.1384386, 1.425588, 1, 1, 1, 1, 1,
1.717314, -0.1273288, 3.106253, 1, 1, 1, 1, 1,
1.722866, 0.7072823, 0.6333534, 1, 1, 1, 1, 1,
1.727697, -0.9373185, 2.321749, 1, 1, 1, 1, 1,
1.730088, 1.311642, 1.606459, 1, 1, 1, 1, 1,
1.735538, -1.400882, 1.018926, 1, 1, 1, 1, 1,
1.749594, 1.407575, -0.03065007, 1, 1, 1, 1, 1,
1.766806, 0.3650695, 1.798979, 1, 1, 1, 1, 1,
1.769552, 1.015523, 0.8001587, 1, 1, 1, 1, 1,
1.781056, -0.9237311, 1.646919, 0, 0, 1, 1, 1,
1.781774, -0.6287545, 3.004824, 1, 0, 0, 1, 1,
1.797496, -0.9127398, 1.270897, 1, 0, 0, 1, 1,
1.800447, 0.3807886, 1.398738, 1, 0, 0, 1, 1,
1.803118, -0.8313939, 0.5881566, 1, 0, 0, 1, 1,
1.818014, -2.216329, 2.094826, 1, 0, 0, 1, 1,
1.824143, 0.9231669, 1.892501, 0, 0, 0, 1, 1,
1.837461, 2.312327, 0.3091345, 0, 0, 0, 1, 1,
1.866965, -1.873525, 3.206567, 0, 0, 0, 1, 1,
1.871342, 1.562244, 0.736383, 0, 0, 0, 1, 1,
1.876417, -0.2328052, 2.272233, 0, 0, 0, 1, 1,
1.889169, -1.920034, 3.341472, 0, 0, 0, 1, 1,
1.899711, 0.7837123, -0.09623399, 0, 0, 0, 1, 1,
1.90106, -1.638783, 0.176723, 1, 1, 1, 1, 1,
1.95716, -0.876817, 1.995049, 1, 1, 1, 1, 1,
1.97045, -0.8581089, 3.397112, 1, 1, 1, 1, 1,
1.981119, -1.300384, 2.386322, 1, 1, 1, 1, 1,
1.993164, 0.1725789, 1.164304, 1, 1, 1, 1, 1,
2.002567, 0.4747462, 0.7875061, 1, 1, 1, 1, 1,
2.022335, -0.432512, 1.914603, 1, 1, 1, 1, 1,
2.052132, -0.3287853, 3.289159, 1, 1, 1, 1, 1,
2.067021, -1.145227, 0.9053413, 1, 1, 1, 1, 1,
2.071821, -0.6110595, 1.398833, 1, 1, 1, 1, 1,
2.084076, -1.079013, 1.534022, 1, 1, 1, 1, 1,
2.087375, -0.7657446, 2.171852, 1, 1, 1, 1, 1,
2.143137, -0.4976875, 3.410715, 1, 1, 1, 1, 1,
2.178542, -0.611207, 0.5285665, 1, 1, 1, 1, 1,
2.213504, -0.09562201, 2.853601, 1, 1, 1, 1, 1,
2.215424, -0.2545995, 2.027942, 0, 0, 1, 1, 1,
2.240871, -0.8558966, 1.355376, 1, 0, 0, 1, 1,
2.255109, 0.5079302, 2.244774, 1, 0, 0, 1, 1,
2.299209, -1.156411, 0.9025062, 1, 0, 0, 1, 1,
2.316729, 0.4459808, 1.891652, 1, 0, 0, 1, 1,
2.318146, -0.9083916, 1.625299, 1, 0, 0, 1, 1,
2.368013, 0.2993281, 3.228801, 0, 0, 0, 1, 1,
2.396256, -1.694732, 2.693656, 0, 0, 0, 1, 1,
2.505566, -0.5675082, 1.443882, 0, 0, 0, 1, 1,
2.592633, 0.841681, 1.910094, 0, 0, 0, 1, 1,
2.627482, -0.7338809, 0.7746776, 0, 0, 0, 1, 1,
2.648063, 0.6104586, 1.20403, 0, 0, 0, 1, 1,
2.722095, -1.750393, 1.925173, 0, 0, 0, 1, 1,
2.773209, 0.336178, 0.6464198, 1, 1, 1, 1, 1,
2.796526, -3.557463, 0.08707464, 1, 1, 1, 1, 1,
2.897206, 0.7433351, 1.533299, 1, 1, 1, 1, 1,
2.944996, -0.3197484, -0.07816868, 1, 1, 1, 1, 1,
3.200396, -0.1996414, 3.155569, 1, 1, 1, 1, 1,
3.204539, 0.1200718, -0.3313002, 1, 1, 1, 1, 1,
3.405237, -0.7695069, 2.598554, 1, 1, 1, 1, 1
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
var radius = 9.631311;
var distance = 33.82957;
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
mvMatrix.translate( -0.1396322, 0.1650937, 0.06670165 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82957);
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
