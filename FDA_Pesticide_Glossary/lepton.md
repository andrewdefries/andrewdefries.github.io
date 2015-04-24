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
-2.797888, -0.5319714, -0.3703643, 1, 0, 0, 1,
-2.554383, 1.383503, -1.018659, 1, 0.007843138, 0, 1,
-2.472018, 0.724167, -1.286463, 1, 0.01176471, 0, 1,
-2.457286, 1.430672, -3.298472, 1, 0.01960784, 0, 1,
-2.412095, 0.1182736, -2.47448, 1, 0.02352941, 0, 1,
-2.376526, -0.1070027, -3.175514, 1, 0.03137255, 0, 1,
-2.371174, -1.740287, -3.26265, 1, 0.03529412, 0, 1,
-2.346228, 0.8866476, -2.25895, 1, 0.04313726, 0, 1,
-2.34162, -0.141798, -1.764235, 1, 0.04705882, 0, 1,
-2.221957, -0.6180961, -1.362075, 1, 0.05490196, 0, 1,
-2.214804, 0.009971115, -1.320418, 1, 0.05882353, 0, 1,
-2.212619, 0.9798306, -1.642324, 1, 0.06666667, 0, 1,
-2.199985, -2.528008, -2.505048, 1, 0.07058824, 0, 1,
-2.158448, -0.6539586, -2.201916, 1, 0.07843138, 0, 1,
-2.147448, -1.143202, 0.269756, 1, 0.08235294, 0, 1,
-2.102743, 0.7100077, -1.576406, 1, 0.09019608, 0, 1,
-2.075525, -0.2109719, -3.480973, 1, 0.09411765, 0, 1,
-2.064521, -1.374559, -1.898296, 1, 0.1019608, 0, 1,
-2.050051, 1.605029, 0.06419069, 1, 0.1098039, 0, 1,
-2.010451, -0.951175, -2.804192, 1, 0.1137255, 0, 1,
-1.993781, -0.4923626, -1.659857, 1, 0.1215686, 0, 1,
-1.961181, 1.860129, -0.1079862, 1, 0.1254902, 0, 1,
-1.946049, -0.04374034, -1.912167, 1, 0.1333333, 0, 1,
-1.910577, 0.150662, 1.04256, 1, 0.1372549, 0, 1,
-1.899883, 0.04961811, -1.673906, 1, 0.145098, 0, 1,
-1.894658, -0.9337785, -1.457676, 1, 0.1490196, 0, 1,
-1.890766, -0.2699592, -1.133668, 1, 0.1568628, 0, 1,
-1.840364, 0.8118175, -1.773784, 1, 0.1607843, 0, 1,
-1.840139, 2.898451, -1.388293, 1, 0.1686275, 0, 1,
-1.838162, -1.337261, -0.8622811, 1, 0.172549, 0, 1,
-1.83192, -0.3360218, -2.217574, 1, 0.1803922, 0, 1,
-1.826682, -0.4569179, -1.407947, 1, 0.1843137, 0, 1,
-1.819457, -1.491917, -2.807287, 1, 0.1921569, 0, 1,
-1.80654, -0.5923133, -0.2737085, 1, 0.1960784, 0, 1,
-1.803916, -0.6327099, -2.364053, 1, 0.2039216, 0, 1,
-1.793398, -0.2884235, -2.302151, 1, 0.2117647, 0, 1,
-1.786464, -0.1727879, -2.062188, 1, 0.2156863, 0, 1,
-1.763682, 0.0886317, -1.615362, 1, 0.2235294, 0, 1,
-1.758965, -0.8721451, -3.397002, 1, 0.227451, 0, 1,
-1.758372, -1.413619, -2.394581, 1, 0.2352941, 0, 1,
-1.753652, 0.3033439, -1.63142, 1, 0.2392157, 0, 1,
-1.751392, 0.3602668, -0.6890292, 1, 0.2470588, 0, 1,
-1.732359, -1.330001, -0.6862965, 1, 0.2509804, 0, 1,
-1.713034, -1.434773, -2.701903, 1, 0.2588235, 0, 1,
-1.70518, 1.058994, -1.991096, 1, 0.2627451, 0, 1,
-1.70473, 1.197444, -2.228886, 1, 0.2705882, 0, 1,
-1.702578, 0.1111898, -0.4480439, 1, 0.2745098, 0, 1,
-1.700532, 0.2704658, 0.1626288, 1, 0.282353, 0, 1,
-1.689451, -0.1699827, -1.428476, 1, 0.2862745, 0, 1,
-1.683095, -1.708133, -3.862501, 1, 0.2941177, 0, 1,
-1.681715, -2.313259, -1.825318, 1, 0.3019608, 0, 1,
-1.676709, 0.7225533, -2.119374, 1, 0.3058824, 0, 1,
-1.669515, 0.02111642, 0.1500176, 1, 0.3137255, 0, 1,
-1.657887, -0.5524057, -2.685896, 1, 0.3176471, 0, 1,
-1.64252, -1.024816, -2.355082, 1, 0.3254902, 0, 1,
-1.640469, -0.3092504, -2.263182, 1, 0.3294118, 0, 1,
-1.638839, -0.1437905, 0.4279971, 1, 0.3372549, 0, 1,
-1.613502, -0.08870275, -3.089658, 1, 0.3411765, 0, 1,
-1.60662, -0.7746954, -2.989372, 1, 0.3490196, 0, 1,
-1.602808, -0.960614, -0.6749366, 1, 0.3529412, 0, 1,
-1.591236, 1.012189, -0.6477406, 1, 0.3607843, 0, 1,
-1.589187, -1.133868, -0.9380242, 1, 0.3647059, 0, 1,
-1.585865, 0.5133063, -3.831789, 1, 0.372549, 0, 1,
-1.584242, -1.337073, -1.414094, 1, 0.3764706, 0, 1,
-1.582753, 0.3111489, -0.1638303, 1, 0.3843137, 0, 1,
-1.576924, -1.164089, -3.2989, 1, 0.3882353, 0, 1,
-1.576458, 0.2399582, -1.77593, 1, 0.3960784, 0, 1,
-1.576453, -1.390444, -3.395526, 1, 0.4039216, 0, 1,
-1.5703, 1.991752, 0.2817837, 1, 0.4078431, 0, 1,
-1.565155, 2.447117, -0.03418866, 1, 0.4156863, 0, 1,
-1.556481, -0.1365076, -2.182477, 1, 0.4196078, 0, 1,
-1.553593, -1.241315, -1.606395, 1, 0.427451, 0, 1,
-1.544105, 0.9861175, -1.149575, 1, 0.4313726, 0, 1,
-1.531529, 0.3076404, -1.807774, 1, 0.4392157, 0, 1,
-1.527012, -0.6410573, -2.91415, 1, 0.4431373, 0, 1,
-1.520772, -1.284682, -2.541416, 1, 0.4509804, 0, 1,
-1.511652, 0.404384, -0.9839371, 1, 0.454902, 0, 1,
-1.48919, -0.8229675, -3.113533, 1, 0.4627451, 0, 1,
-1.487697, -1.715129, -2.595543, 1, 0.4666667, 0, 1,
-1.480504, -0.8137836, -3.761018, 1, 0.4745098, 0, 1,
-1.465028, -0.936086, -3.146195, 1, 0.4784314, 0, 1,
-1.458934, 1.583028, -0.2360937, 1, 0.4862745, 0, 1,
-1.457002, 1.69372, -0.3651331, 1, 0.4901961, 0, 1,
-1.441749, 0.2241798, -0.6799275, 1, 0.4980392, 0, 1,
-1.434841, 0.5704827, -2.512764, 1, 0.5058824, 0, 1,
-1.434081, -0.4786321, -2.429103, 1, 0.509804, 0, 1,
-1.431523, 1.30776, -1.156029, 1, 0.5176471, 0, 1,
-1.41899, 0.001528497, -1.768006, 1, 0.5215687, 0, 1,
-1.41294, -0.09990304, 0.1358195, 1, 0.5294118, 0, 1,
-1.408054, 1.581578, -1.690846, 1, 0.5333334, 0, 1,
-1.39976, -1.042664, -1.911669, 1, 0.5411765, 0, 1,
-1.396229, -0.7234161, 0.8817885, 1, 0.5450981, 0, 1,
-1.395985, 0.02133404, -2.853542, 1, 0.5529412, 0, 1,
-1.395042, -0.4947471, -2.266319, 1, 0.5568628, 0, 1,
-1.376853, 1.010022, -0.6218796, 1, 0.5647059, 0, 1,
-1.372361, -1.430049, -2.728602, 1, 0.5686275, 0, 1,
-1.367278, -1.553066, -1.512064, 1, 0.5764706, 0, 1,
-1.350528, -0.8959281, -2.801019, 1, 0.5803922, 0, 1,
-1.345747, 0.3559553, -1.214538, 1, 0.5882353, 0, 1,
-1.343604, 2.213844, -0.8731333, 1, 0.5921569, 0, 1,
-1.342196, -0.8632038, -1.809311, 1, 0.6, 0, 1,
-1.337044, 0.3527046, -0.7874238, 1, 0.6078432, 0, 1,
-1.334751, 0.2246654, 0.00706004, 1, 0.6117647, 0, 1,
-1.327275, 0.9497821, -0.56375, 1, 0.6196079, 0, 1,
-1.315971, -1.481038, -2.053724, 1, 0.6235294, 0, 1,
-1.313754, -2.51344, -3.782356, 1, 0.6313726, 0, 1,
-1.305983, -1.502225, -1.218312, 1, 0.6352941, 0, 1,
-1.303926, 0.3043669, -3.197948, 1, 0.6431373, 0, 1,
-1.299672, 1.490477, -1.041626, 1, 0.6470588, 0, 1,
-1.293161, 0.4549722, -1.934781, 1, 0.654902, 0, 1,
-1.290538, -0.08318578, -2.038573, 1, 0.6588235, 0, 1,
-1.28948, -1.101352, -3.150468, 1, 0.6666667, 0, 1,
-1.277925, 0.3120472, -0.4552202, 1, 0.6705883, 0, 1,
-1.253773, -1.953978, -3.337662, 1, 0.6784314, 0, 1,
-1.243984, -0.3887495, -1.859617, 1, 0.682353, 0, 1,
-1.232161, -0.09974482, -1.052559, 1, 0.6901961, 0, 1,
-1.227698, -0.6200135, -0.5188196, 1, 0.6941177, 0, 1,
-1.222203, 0.6258454, -0.6591799, 1, 0.7019608, 0, 1,
-1.21309, 0.3210786, 0.9485131, 1, 0.7098039, 0, 1,
-1.210692, -0.4917422, -1.763024, 1, 0.7137255, 0, 1,
-1.20725, 0.6894972, -0.6339332, 1, 0.7215686, 0, 1,
-1.204001, 0.2602653, -2.106519, 1, 0.7254902, 0, 1,
-1.202102, -0.7453803, -1.462399, 1, 0.7333333, 0, 1,
-1.201345, -0.9256775, -2.075579, 1, 0.7372549, 0, 1,
-1.1999, -1.118192, -1.757195, 1, 0.7450981, 0, 1,
-1.199891, -2.278012, -1.017305, 1, 0.7490196, 0, 1,
-1.193496, -0.4472086, -0.7297142, 1, 0.7568628, 0, 1,
-1.18753, 0.2301055, -1.596511, 1, 0.7607843, 0, 1,
-1.178844, 1.581028, -3.466809, 1, 0.7686275, 0, 1,
-1.173544, 0.7630275, -0.040334, 1, 0.772549, 0, 1,
-1.170972, 1.091085, -1.039923, 1, 0.7803922, 0, 1,
-1.170886, 1.438824, -0.22069, 1, 0.7843137, 0, 1,
-1.165705, 0.3592803, -0.8382924, 1, 0.7921569, 0, 1,
-1.160197, -1.041805, -2.900435, 1, 0.7960784, 0, 1,
-1.157045, 0.8067609, -1.561632, 1, 0.8039216, 0, 1,
-1.14565, -0.9448007, -3.098555, 1, 0.8117647, 0, 1,
-1.136366, 1.076788, 0.07829843, 1, 0.8156863, 0, 1,
-1.13361, 0.1115993, -0.5704312, 1, 0.8235294, 0, 1,
-1.128994, -0.2762667, -2.434976, 1, 0.827451, 0, 1,
-1.127163, 0.9656549, 0.2541295, 1, 0.8352941, 0, 1,
-1.121076, -0.2933004, -1.462351, 1, 0.8392157, 0, 1,
-1.116751, -0.9455668, -2.11082, 1, 0.8470588, 0, 1,
-1.108218, 0.663541, -3.609462, 1, 0.8509804, 0, 1,
-1.107952, 1.049442, -0.1563298, 1, 0.8588235, 0, 1,
-1.105374, 1.157652, -1.519564, 1, 0.8627451, 0, 1,
-1.100522, 0.3556711, -1.639264, 1, 0.8705882, 0, 1,
-1.10011, 0.7881059, -1.353065, 1, 0.8745098, 0, 1,
-1.097292, -0.279763, -1.729462, 1, 0.8823529, 0, 1,
-1.091605, -0.5627421, -1.688452, 1, 0.8862745, 0, 1,
-1.089055, -0.6540763, -1.751061, 1, 0.8941177, 0, 1,
-1.083237, 0.1883957, -0.5563547, 1, 0.8980392, 0, 1,
-1.081496, -0.5627785, -2.839845, 1, 0.9058824, 0, 1,
-1.076001, -0.6280206, -3.419025, 1, 0.9137255, 0, 1,
-1.063568, -0.005356213, -0.668183, 1, 0.9176471, 0, 1,
-1.060589, -0.06644467, -2.527948, 1, 0.9254902, 0, 1,
-1.055804, 1.47609, 1.330351, 1, 0.9294118, 0, 1,
-1.055272, 0.4662171, -1.463318, 1, 0.9372549, 0, 1,
-1.052814, -0.08950806, -2.181059, 1, 0.9411765, 0, 1,
-1.04811, -1.068498, -2.967824, 1, 0.9490196, 0, 1,
-1.04103, 0.3344496, -0.8751208, 1, 0.9529412, 0, 1,
-1.036825, -1.385908, -2.961906, 1, 0.9607843, 0, 1,
-1.029264, -0.3268278, -1.380007, 1, 0.9647059, 0, 1,
-1.021515, 0.2202778, -0.8766567, 1, 0.972549, 0, 1,
-1.020046, -1.279725, -0.9318284, 1, 0.9764706, 0, 1,
-1.017945, -0.8588533, -4.108965, 1, 0.9843137, 0, 1,
-1.012638, 1.828929, -1.060103, 1, 0.9882353, 0, 1,
-1.010416, 0.7414619, -1.114494, 1, 0.9960784, 0, 1,
-1.008734, -0.4311639, -1.542356, 0.9960784, 1, 0, 1,
-1.008065, -0.919138, -1.593362, 0.9921569, 1, 0, 1,
-1.003946, -0.6073704, -1.925296, 0.9843137, 1, 0, 1,
-1.003307, -1.788712, -2.868335, 0.9803922, 1, 0, 1,
-0.9951259, -2.305995, -4.902008, 0.972549, 1, 0, 1,
-0.9934497, -0.3624043, -2.9449, 0.9686275, 1, 0, 1,
-0.9922899, 1.169108, 1.065273, 0.9607843, 1, 0, 1,
-0.9919508, -0.08459575, -1.841599, 0.9568627, 1, 0, 1,
-0.9918509, 0.5558267, -3.541461, 0.9490196, 1, 0, 1,
-0.991794, -0.237684, -0.4119836, 0.945098, 1, 0, 1,
-0.9900399, 1.065609, -0.1082682, 0.9372549, 1, 0, 1,
-0.9846592, -0.4918326, -2.277791, 0.9333333, 1, 0, 1,
-0.9716397, 0.8324621, -3.021333, 0.9254902, 1, 0, 1,
-0.9710591, -1.497296, -2.120698, 0.9215686, 1, 0, 1,
-0.9675509, -0.05411503, -0.7620229, 0.9137255, 1, 0, 1,
-0.9642194, -0.3862511, -3.059356, 0.9098039, 1, 0, 1,
-0.9612693, -0.2112359, -1.756831, 0.9019608, 1, 0, 1,
-0.9596034, -1.141227, -3.237421, 0.8941177, 1, 0, 1,
-0.9587497, 0.3243615, -1.865502, 0.8901961, 1, 0, 1,
-0.9574929, 0.5659872, -1.995534, 0.8823529, 1, 0, 1,
-0.9524193, -0.6774575, -3.093905, 0.8784314, 1, 0, 1,
-0.9521525, -1.922496, -1.334703, 0.8705882, 1, 0, 1,
-0.950069, 0.740679, -1.088414, 0.8666667, 1, 0, 1,
-0.9492827, 0.8716298, -2.237473, 0.8588235, 1, 0, 1,
-0.9385233, 0.3960989, -0.3857005, 0.854902, 1, 0, 1,
-0.925579, -1.155606, -2.154566, 0.8470588, 1, 0, 1,
-0.9199911, -0.161909, -4.062263, 0.8431373, 1, 0, 1,
-0.9144635, -0.3390431, -2.16509, 0.8352941, 1, 0, 1,
-0.9060158, -0.2064322, -1.605888, 0.8313726, 1, 0, 1,
-0.9009093, -0.29534, -2.033486, 0.8235294, 1, 0, 1,
-0.8957069, 0.2565082, -1.365675, 0.8196079, 1, 0, 1,
-0.8929318, -0.1788, -0.6013263, 0.8117647, 1, 0, 1,
-0.8902974, -1.177789, -0.9455346, 0.8078431, 1, 0, 1,
-0.8868837, -0.8834367, -2.299449, 0.8, 1, 0, 1,
-0.8851218, 1.117256, -0.2505767, 0.7921569, 1, 0, 1,
-0.8845188, -1.337333, -4.192318, 0.7882353, 1, 0, 1,
-0.8807268, -0.3161147, -0.899272, 0.7803922, 1, 0, 1,
-0.8766043, -1.260473, -3.354993, 0.7764706, 1, 0, 1,
-0.8701292, 2.020005, -0.1828574, 0.7686275, 1, 0, 1,
-0.8675339, 0.9113627, -0.8331162, 0.7647059, 1, 0, 1,
-0.8668613, -0.007583859, -2.218239, 0.7568628, 1, 0, 1,
-0.8649355, -0.4029329, -2.273485, 0.7529412, 1, 0, 1,
-0.861955, 0.316191, -0.8999662, 0.7450981, 1, 0, 1,
-0.8611951, -1.347583, -2.292608, 0.7411765, 1, 0, 1,
-0.8590618, 0.4079998, 1.512359, 0.7333333, 1, 0, 1,
-0.8553619, 0.8619798, 1.04155, 0.7294118, 1, 0, 1,
-0.8540899, -1.359347, -1.682626, 0.7215686, 1, 0, 1,
-0.8526215, -1.4007, -3.830826, 0.7176471, 1, 0, 1,
-0.8485016, 0.8456547, -0.7355078, 0.7098039, 1, 0, 1,
-0.8446362, -0.2136267, -2.774326, 0.7058824, 1, 0, 1,
-0.8381819, -0.3380294, -2.420149, 0.6980392, 1, 0, 1,
-0.8348112, 0.2512306, -2.89106, 0.6901961, 1, 0, 1,
-0.8321198, 0.2790376, -0.851342, 0.6862745, 1, 0, 1,
-0.8313811, 0.1342514, -0.7384081, 0.6784314, 1, 0, 1,
-0.8266084, 0.3668352, -1.263796, 0.6745098, 1, 0, 1,
-0.8265481, -0.7694122, -0.5760912, 0.6666667, 1, 0, 1,
-0.8246108, 0.4940151, -1.37413, 0.6627451, 1, 0, 1,
-0.8139107, 1.565001, -1.114775, 0.654902, 1, 0, 1,
-0.8128167, 0.2483142, -1.42689, 0.6509804, 1, 0, 1,
-0.8128151, 0.202435, -1.622373, 0.6431373, 1, 0, 1,
-0.8098164, -0.6975763, -3.077796, 0.6392157, 1, 0, 1,
-0.8082411, 0.4715926, -0.7579796, 0.6313726, 1, 0, 1,
-0.8062472, 0.49327, -0.3981162, 0.627451, 1, 0, 1,
-0.7976578, 0.6410415, 0.1751389, 0.6196079, 1, 0, 1,
-0.7862561, -0.4811343, -2.749844, 0.6156863, 1, 0, 1,
-0.7834602, -0.7705039, -1.615368, 0.6078432, 1, 0, 1,
-0.7834157, -0.3100416, -2.270184, 0.6039216, 1, 0, 1,
-0.7819195, 0.2699025, -1.752674, 0.5960785, 1, 0, 1,
-0.7762346, 0.4877397, -0.7650894, 0.5882353, 1, 0, 1,
-0.7735825, 1.052602, -1.704278, 0.5843138, 1, 0, 1,
-0.7730939, -0.6098077, -3.597754, 0.5764706, 1, 0, 1,
-0.7708094, -0.7465554, -2.571151, 0.572549, 1, 0, 1,
-0.767453, 0.9968501, -0.4490599, 0.5647059, 1, 0, 1,
-0.7670976, 0.5432099, -0.897527, 0.5607843, 1, 0, 1,
-0.7656804, -0.24067, -2.190249, 0.5529412, 1, 0, 1,
-0.7567412, 1.096573, 1.336178, 0.5490196, 1, 0, 1,
-0.7552181, -0.1423037, -3.780396, 0.5411765, 1, 0, 1,
-0.7520732, 0.5199547, -2.39882, 0.5372549, 1, 0, 1,
-0.752009, 1.866985, -0.3637623, 0.5294118, 1, 0, 1,
-0.7473988, -1.110089, -4.035017, 0.5254902, 1, 0, 1,
-0.7454454, -0.7570224, -2.141428, 0.5176471, 1, 0, 1,
-0.7382941, 0.9435912, -1.663475, 0.5137255, 1, 0, 1,
-0.7338506, -0.4426676, -1.869194, 0.5058824, 1, 0, 1,
-0.7326005, -0.6230937, -1.986231, 0.5019608, 1, 0, 1,
-0.7322851, -0.3680606, -3.384922, 0.4941176, 1, 0, 1,
-0.7318296, -1.703085, -2.992826, 0.4862745, 1, 0, 1,
-0.7220927, 0.3162718, -0.4967126, 0.4823529, 1, 0, 1,
-0.721409, 0.6476631, 0.00213293, 0.4745098, 1, 0, 1,
-0.7192425, -0.3383753, -2.52857, 0.4705882, 1, 0, 1,
-0.7160429, -0.5648143, -2.30411, 0.4627451, 1, 0, 1,
-0.7112922, -0.3773661, -2.976603, 0.4588235, 1, 0, 1,
-0.7103328, -0.5850141, -2.418864, 0.4509804, 1, 0, 1,
-0.70864, 0.1585658, -2.273856, 0.4470588, 1, 0, 1,
-0.7043165, -0.6315394, -0.8933805, 0.4392157, 1, 0, 1,
-0.7031211, 0.9874756, -0.2952622, 0.4352941, 1, 0, 1,
-0.7017948, 0.01260232, -1.631915, 0.427451, 1, 0, 1,
-0.6972383, -0.145059, -0.1273863, 0.4235294, 1, 0, 1,
-0.6971129, -1.139964, -1.995931, 0.4156863, 1, 0, 1,
-0.6968574, 1.647386, 0.3808924, 0.4117647, 1, 0, 1,
-0.691145, 1.246768, 0.9072315, 0.4039216, 1, 0, 1,
-0.6884789, -0.7059372, -4.182042, 0.3960784, 1, 0, 1,
-0.6882763, -1.594099, -3.884254, 0.3921569, 1, 0, 1,
-0.6871476, 0.0755022, -0.5695155, 0.3843137, 1, 0, 1,
-0.6861846, -3.074819, -2.135922, 0.3803922, 1, 0, 1,
-0.6687186, 0.4469893, -1.287548, 0.372549, 1, 0, 1,
-0.6672159, -0.376537, -2.755787, 0.3686275, 1, 0, 1,
-0.6657344, -0.1289342, -2.517849, 0.3607843, 1, 0, 1,
-0.664813, -0.01588347, -3.336389, 0.3568628, 1, 0, 1,
-0.6634079, 0.6428732, -0.6423847, 0.3490196, 1, 0, 1,
-0.6578688, 1.264568, 2.299705, 0.345098, 1, 0, 1,
-0.6527183, -1.239942, -4.149123, 0.3372549, 1, 0, 1,
-0.6518844, 0.5640076, -0.8838269, 0.3333333, 1, 0, 1,
-0.642791, -1.351705, -2.88961, 0.3254902, 1, 0, 1,
-0.6415116, 1.041722, 1.788959, 0.3215686, 1, 0, 1,
-0.6394795, -1.331083, -1.419561, 0.3137255, 1, 0, 1,
-0.6385601, -1.245736, -1.973535, 0.3098039, 1, 0, 1,
-0.6364498, -0.3766892, -3.378986, 0.3019608, 1, 0, 1,
-0.633274, -0.3882765, -0.9939092, 0.2941177, 1, 0, 1,
-0.630854, -0.8002619, -1.85316, 0.2901961, 1, 0, 1,
-0.6250354, 0.1898421, -2.482398, 0.282353, 1, 0, 1,
-0.6184947, -0.5180175, -2.189077, 0.2784314, 1, 0, 1,
-0.6166607, -0.8081126, -3.71087, 0.2705882, 1, 0, 1,
-0.6145514, -1.280859, -1.18524, 0.2666667, 1, 0, 1,
-0.6108863, 0.8926663, 0.6815626, 0.2588235, 1, 0, 1,
-0.6100953, 1.208449, -1.632703, 0.254902, 1, 0, 1,
-0.6044878, 0.2372318, -1.284046, 0.2470588, 1, 0, 1,
-0.6035845, -0.06551105, -2.595825, 0.2431373, 1, 0, 1,
-0.5997883, -0.5975751, -1.767356, 0.2352941, 1, 0, 1,
-0.5979112, 0.05889806, -1.078496, 0.2313726, 1, 0, 1,
-0.590629, 0.4937993, -0.4647365, 0.2235294, 1, 0, 1,
-0.5834088, -0.3493884, -0.2099977, 0.2196078, 1, 0, 1,
-0.579994, -0.4032994, -1.422346, 0.2117647, 1, 0, 1,
-0.5780982, 1.278685, -0.09941532, 0.2078431, 1, 0, 1,
-0.5775135, 0.6634025, -0.9661862, 0.2, 1, 0, 1,
-0.5769944, -0.4129622, -3.716811, 0.1921569, 1, 0, 1,
-0.5716107, 0.8074245, 0.01169591, 0.1882353, 1, 0, 1,
-0.5617707, 0.449159, -1.124637, 0.1803922, 1, 0, 1,
-0.5560791, -1.007766, -1.166645, 0.1764706, 1, 0, 1,
-0.554958, -0.05282538, -2.146107, 0.1686275, 1, 0, 1,
-0.5548201, 0.5945478, 0.2670009, 0.1647059, 1, 0, 1,
-0.5522667, -1.74296, -3.583856, 0.1568628, 1, 0, 1,
-0.5519383, 0.02760215, -2.938321, 0.1529412, 1, 0, 1,
-0.5519191, -1.450245, -4.310141, 0.145098, 1, 0, 1,
-0.5489297, 0.4501555, -1.592847, 0.1411765, 1, 0, 1,
-0.5435109, -0.7811553, -4.44774, 0.1333333, 1, 0, 1,
-0.542945, -0.2706754, -0.681559, 0.1294118, 1, 0, 1,
-0.5391757, 0.2627507, -0.1944376, 0.1215686, 1, 0, 1,
-0.5381513, -0.8455678, -1.918677, 0.1176471, 1, 0, 1,
-0.5324152, 0.08864995, -0.2665047, 0.1098039, 1, 0, 1,
-0.5307145, -1.281687, -2.626279, 0.1058824, 1, 0, 1,
-0.528568, 0.6974973, -0.7378995, 0.09803922, 1, 0, 1,
-0.5199136, -0.9909847, -2.199413, 0.09019608, 1, 0, 1,
-0.5156993, 0.7031075, 0.3426094, 0.08627451, 1, 0, 1,
-0.5104781, -1.248304, -4.375572, 0.07843138, 1, 0, 1,
-0.495632, -1.385604, -4.357054, 0.07450981, 1, 0, 1,
-0.4952274, -2.07091, -1.758275, 0.06666667, 1, 0, 1,
-0.4941348, -1.119756, -2.829133, 0.0627451, 1, 0, 1,
-0.4885061, -1.098441, -4.131424, 0.05490196, 1, 0, 1,
-0.4854009, 0.04454724, -1.615437, 0.05098039, 1, 0, 1,
-0.4832401, 0.5569615, 0.568837, 0.04313726, 1, 0, 1,
-0.4822049, 0.5625396, -2.142409, 0.03921569, 1, 0, 1,
-0.4801871, -0.1062043, -0.5399855, 0.03137255, 1, 0, 1,
-0.4749352, 1.957319, -0.5521288, 0.02745098, 1, 0, 1,
-0.4741327, 1.082143, -1.063426, 0.01960784, 1, 0, 1,
-0.4687737, 0.4135532, -1.532318, 0.01568628, 1, 0, 1,
-0.4664326, 1.487038, -1.515813, 0.007843138, 1, 0, 1,
-0.4650532, -1.005424, -2.480848, 0.003921569, 1, 0, 1,
-0.4608958, 1.655668, -1.091488, 0, 1, 0.003921569, 1,
-0.4608521, -0.5277023, -2.377892, 0, 1, 0.01176471, 1,
-0.4602505, 0.6231244, -2.0032, 0, 1, 0.01568628, 1,
-0.4590306, -0.0368906, -1.001086, 0, 1, 0.02352941, 1,
-0.4534362, -1.645552, -2.540865, 0, 1, 0.02745098, 1,
-0.45275, -1.165208, -3.299979, 0, 1, 0.03529412, 1,
-0.4524975, -0.2181204, -3.359932, 0, 1, 0.03921569, 1,
-0.4490255, 0.8125104, 0.2773911, 0, 1, 0.04705882, 1,
-0.4481842, 1.552577, -0.2029065, 0, 1, 0.05098039, 1,
-0.4476532, -0.1435471, -1.843899, 0, 1, 0.05882353, 1,
-0.4465505, -0.009386838, -0.7770219, 0, 1, 0.0627451, 1,
-0.4412473, -0.4461317, -3.160907, 0, 1, 0.07058824, 1,
-0.4373913, -0.4751902, -2.101214, 0, 1, 0.07450981, 1,
-0.4351154, 2.267068, 0.7406249, 0, 1, 0.08235294, 1,
-0.4346584, 2.874126, 1.085643, 0, 1, 0.08627451, 1,
-0.4292633, 0.1818105, -1.989847, 0, 1, 0.09411765, 1,
-0.4287817, 1.393879, 0.08679223, 0, 1, 0.1019608, 1,
-0.4240679, 1.560342, 0.5446292, 0, 1, 0.1058824, 1,
-0.4219435, 0.06805536, -2.226069, 0, 1, 0.1137255, 1,
-0.4206272, 0.313682, -0.09510274, 0, 1, 0.1176471, 1,
-0.4206103, -0.3742779, -0.5420608, 0, 1, 0.1254902, 1,
-0.4159018, -0.009142037, -3.743403, 0, 1, 0.1294118, 1,
-0.4154257, -1.037627, -2.434493, 0, 1, 0.1372549, 1,
-0.4104955, -2.596796, -3.371483, 0, 1, 0.1411765, 1,
-0.4101913, -0.1440107, -1.294597, 0, 1, 0.1490196, 1,
-0.4092121, -1.590112, -3.591427, 0, 1, 0.1529412, 1,
-0.4078572, -1.4549, -1.539725, 0, 1, 0.1607843, 1,
-0.4003771, 0.3960814, -0.5329077, 0, 1, 0.1647059, 1,
-0.3944356, -0.5412444, -1.851478, 0, 1, 0.172549, 1,
-0.3926722, 0.7147321, 1.849182, 0, 1, 0.1764706, 1,
-0.386494, -0.8441322, -2.847052, 0, 1, 0.1843137, 1,
-0.3814524, 0.7582589, 0.03651535, 0, 1, 0.1882353, 1,
-0.3798097, -0.7829452, -3.359622, 0, 1, 0.1960784, 1,
-0.3788412, 0.5602466, -0.9687607, 0, 1, 0.2039216, 1,
-0.3770455, 0.1951219, -0.7437477, 0, 1, 0.2078431, 1,
-0.3768786, 0.6674324, 0.3503041, 0, 1, 0.2156863, 1,
-0.375772, 0.5939609, -0.7935598, 0, 1, 0.2196078, 1,
-0.3713323, 1.843349, 0.1584959, 0, 1, 0.227451, 1,
-0.3706025, -0.4046918, -1.32899, 0, 1, 0.2313726, 1,
-0.3702004, -2.954979, -3.661259, 0, 1, 0.2392157, 1,
-0.3613995, -0.6286315, -4.341234, 0, 1, 0.2431373, 1,
-0.3600312, -0.8438458, -2.520379, 0, 1, 0.2509804, 1,
-0.3589217, -1.02539, -3.743578, 0, 1, 0.254902, 1,
-0.3521186, -0.5853328, -4.021239, 0, 1, 0.2627451, 1,
-0.3509785, -0.3240806, -2.288747, 0, 1, 0.2666667, 1,
-0.3508798, -0.1792105, -0.4231369, 0, 1, 0.2745098, 1,
-0.3484862, -0.2249649, -4.486789, 0, 1, 0.2784314, 1,
-0.3469211, -0.02875521, -1.123168, 0, 1, 0.2862745, 1,
-0.3416971, 1.006713, 0.4563965, 0, 1, 0.2901961, 1,
-0.3399177, 0.4585519, -0.07647741, 0, 1, 0.2980392, 1,
-0.3332919, 0.7056434, -0.4177005, 0, 1, 0.3058824, 1,
-0.3317747, 0.8533845, 0.8683188, 0, 1, 0.3098039, 1,
-0.3309514, -0.2070711, -3.108795, 0, 1, 0.3176471, 1,
-0.3309335, -0.1842436, -3.084302, 0, 1, 0.3215686, 1,
-0.3273763, 1.270523, -1.420552, 0, 1, 0.3294118, 1,
-0.3251869, -1.941565, -2.595508, 0, 1, 0.3333333, 1,
-0.3244774, 1.035746, -0.420959, 0, 1, 0.3411765, 1,
-0.3238631, 0.8889605, 0.6795738, 0, 1, 0.345098, 1,
-0.3235472, 0.07465671, -0.6513702, 0, 1, 0.3529412, 1,
-0.3221574, 0.206682, -1.434041, 0, 1, 0.3568628, 1,
-0.3162954, -0.2870791, -3.372725, 0, 1, 0.3647059, 1,
-0.3132398, 0.9911128, -0.8310007, 0, 1, 0.3686275, 1,
-0.3107366, -0.2768551, -2.233735, 0, 1, 0.3764706, 1,
-0.3093465, -1.153302, -3.659656, 0, 1, 0.3803922, 1,
-0.3080609, 1.227368, 0.009587777, 0, 1, 0.3882353, 1,
-0.3074777, 0.7522009, 1.395527, 0, 1, 0.3921569, 1,
-0.3069482, 0.6136427, -1.084356, 0, 1, 0.4, 1,
-0.3036767, -0.4407319, -3.1571, 0, 1, 0.4078431, 1,
-0.2988097, 0.2037645, 1.083202, 0, 1, 0.4117647, 1,
-0.2985574, -0.2050443, -2.848158, 0, 1, 0.4196078, 1,
-0.2982751, -0.1775675, -1.791083, 0, 1, 0.4235294, 1,
-0.2946845, 0.7087453, 0.9042194, 0, 1, 0.4313726, 1,
-0.2939986, 1.935539, 0.1200902, 0, 1, 0.4352941, 1,
-0.2922853, -0.5941485, -2.676931, 0, 1, 0.4431373, 1,
-0.290446, 1.632571, -1.171659, 0, 1, 0.4470588, 1,
-0.2882121, -0.01014735, -0.8303583, 0, 1, 0.454902, 1,
-0.2835293, -0.06538217, -2.276435, 0, 1, 0.4588235, 1,
-0.2796309, 0.4306808, -0.2687304, 0, 1, 0.4666667, 1,
-0.2767296, -0.2437364, -3.199026, 0, 1, 0.4705882, 1,
-0.2746429, -0.6306464, -1.663463, 0, 1, 0.4784314, 1,
-0.2708682, 0.8952302, 0.2552252, 0, 1, 0.4823529, 1,
-0.2693786, 1.070925, -0.2273303, 0, 1, 0.4901961, 1,
-0.2662157, -0.4232206, -3.077723, 0, 1, 0.4941176, 1,
-0.2662113, -0.1573133, -3.032614, 0, 1, 0.5019608, 1,
-0.2641229, 0.5169966, -0.8479536, 0, 1, 0.509804, 1,
-0.2617258, 1.087217, -0.4851416, 0, 1, 0.5137255, 1,
-0.2599615, 0.04622832, 0.06159097, 0, 1, 0.5215687, 1,
-0.2592524, -1.342817, -2.133433, 0, 1, 0.5254902, 1,
-0.2553227, 0.5599284, -1.47767, 0, 1, 0.5333334, 1,
-0.2512493, 1.214799, 0.2716573, 0, 1, 0.5372549, 1,
-0.2490764, -0.7341285, -2.963833, 0, 1, 0.5450981, 1,
-0.2428063, 0.691921, 0.441175, 0, 1, 0.5490196, 1,
-0.2425611, 3.418787, 1.624629, 0, 1, 0.5568628, 1,
-0.2399649, 0.8798802, -0.7118443, 0, 1, 0.5607843, 1,
-0.2373275, -0.6813529, -0.7633215, 0, 1, 0.5686275, 1,
-0.235416, -1.10467, -3.991425, 0, 1, 0.572549, 1,
-0.2329928, -0.6110287, -4.10848, 0, 1, 0.5803922, 1,
-0.232938, -0.458889, -2.248095, 0, 1, 0.5843138, 1,
-0.2211584, 0.4153445, 1.038501, 0, 1, 0.5921569, 1,
-0.2208823, -0.124246, -4.101368, 0, 1, 0.5960785, 1,
-0.2204441, 1.025046, 1.217477, 0, 1, 0.6039216, 1,
-0.2199303, 0.1471691, -0.3501725, 0, 1, 0.6117647, 1,
-0.2185105, -0.1936692, -2.333789, 0, 1, 0.6156863, 1,
-0.2139619, 0.1640599, -0.1261702, 0, 1, 0.6235294, 1,
-0.2133186, 0.1125626, -2.227424, 0, 1, 0.627451, 1,
-0.2125544, 1.867274, -0.3040006, 0, 1, 0.6352941, 1,
-0.2107318, 1.123265, 0.3333839, 0, 1, 0.6392157, 1,
-0.2083004, -0.15754, -1.112007, 0, 1, 0.6470588, 1,
-0.2082763, 0.4525954, 0.9200504, 0, 1, 0.6509804, 1,
-0.2042121, 0.8368608, -0.590206, 0, 1, 0.6588235, 1,
-0.1982556, -0.8331536, -2.381965, 0, 1, 0.6627451, 1,
-0.1975915, -0.7314205, -3.054003, 0, 1, 0.6705883, 1,
-0.1963318, -0.6571344, -1.467894, 0, 1, 0.6745098, 1,
-0.1955841, -1.339322, -5.079072, 0, 1, 0.682353, 1,
-0.1954357, 0.1714414, 0.9023547, 0, 1, 0.6862745, 1,
-0.1952889, -0.7012078, -2.989832, 0, 1, 0.6941177, 1,
-0.1944188, 0.3763623, -1.039211, 0, 1, 0.7019608, 1,
-0.19413, 0.9456118, -0.7982435, 0, 1, 0.7058824, 1,
-0.1880299, 0.6338628, -2.567659, 0, 1, 0.7137255, 1,
-0.1814997, 0.8102611, -0.7824962, 0, 1, 0.7176471, 1,
-0.1800442, -0.7548785, -1.363835, 0, 1, 0.7254902, 1,
-0.1773014, 2.34135, -1.528136, 0, 1, 0.7294118, 1,
-0.1737565, 1.586139, 0.3731281, 0, 1, 0.7372549, 1,
-0.1734169, -1.248619, -2.16295, 0, 1, 0.7411765, 1,
-0.1730797, 0.06876305, 0.6118394, 0, 1, 0.7490196, 1,
-0.1724266, 0.3656093, -2.325092, 0, 1, 0.7529412, 1,
-0.1719166, -0.4797157, -1.629458, 0, 1, 0.7607843, 1,
-0.1717601, 1.01564, -0.4974887, 0, 1, 0.7647059, 1,
-0.1709452, -0.8124586, -2.264786, 0, 1, 0.772549, 1,
-0.1682964, 0.1149534, -1.900734, 0, 1, 0.7764706, 1,
-0.1617212, 0.5241588, -1.483597, 0, 1, 0.7843137, 1,
-0.1601147, -0.1007816, -3.762662, 0, 1, 0.7882353, 1,
-0.1529862, -0.5283659, -2.263575, 0, 1, 0.7960784, 1,
-0.1525942, -0.7116556, -3.795777, 0, 1, 0.8039216, 1,
-0.1518205, -1.312726, -2.754805, 0, 1, 0.8078431, 1,
-0.1512808, -0.6997373, -3.933675, 0, 1, 0.8156863, 1,
-0.1511205, -1.159117, -2.624172, 0, 1, 0.8196079, 1,
-0.1499161, 1.090144, -0.2546743, 0, 1, 0.827451, 1,
-0.1488975, 1.259151, 0.1777296, 0, 1, 0.8313726, 1,
-0.1488607, 0.7812854, 0.7695, 0, 1, 0.8392157, 1,
-0.1455311, -0.4317396, -2.079039, 0, 1, 0.8431373, 1,
-0.1452952, -0.9523098, -3.323494, 0, 1, 0.8509804, 1,
-0.138152, -2.922026, -3.468544, 0, 1, 0.854902, 1,
-0.1380027, -0.1195903, -3.309458, 0, 1, 0.8627451, 1,
-0.1345328, -1.09273, -0.9719294, 0, 1, 0.8666667, 1,
-0.1318507, 0.1994365, -2.340408, 0, 1, 0.8745098, 1,
-0.1318353, -0.05313122, -4.24218, 0, 1, 0.8784314, 1,
-0.1290884, 0.1847072, -1.355859, 0, 1, 0.8862745, 1,
-0.1285768, 0.841894, -0.3927647, 0, 1, 0.8901961, 1,
-0.1282886, -1.213538, -3.116224, 0, 1, 0.8980392, 1,
-0.1277048, -0.6874697, -3.865969, 0, 1, 0.9058824, 1,
-0.1245195, 0.4976308, -0.2247322, 0, 1, 0.9098039, 1,
-0.1171263, 0.4296753, -0.4607259, 0, 1, 0.9176471, 1,
-0.1126941, 0.3262392, -2.200451, 0, 1, 0.9215686, 1,
-0.110439, -0.7599538, -1.899981, 0, 1, 0.9294118, 1,
-0.1092096, 0.8182154, -0.5370874, 0, 1, 0.9333333, 1,
-0.100406, 0.08187906, -0.4491492, 0, 1, 0.9411765, 1,
-0.09971334, -1.213908, -2.740527, 0, 1, 0.945098, 1,
-0.09900185, 0.6267874, -0.03683782, 0, 1, 0.9529412, 1,
-0.09711475, -1.834631, -3.048959, 0, 1, 0.9568627, 1,
-0.09392774, 1.00558, -0.2885666, 0, 1, 0.9647059, 1,
-0.09282699, 0.6658492, 1.787767, 0, 1, 0.9686275, 1,
-0.09043161, 1.116029, 0.3045579, 0, 1, 0.9764706, 1,
-0.0887996, 0.9653187, -1.124042, 0, 1, 0.9803922, 1,
-0.07971314, -1.379782, -3.891836, 0, 1, 0.9882353, 1,
-0.07621836, -0.8107019, -3.740888, 0, 1, 0.9921569, 1,
-0.07496002, -1.470146, -3.689429, 0, 1, 1, 1,
-0.07232664, 1.309014, 0.6938222, 0, 0.9921569, 1, 1,
-0.06785914, 1.073646, 1.707066, 0, 0.9882353, 1, 1,
-0.06407946, -0.2284155, -3.707937, 0, 0.9803922, 1, 1,
-0.06172165, 0.3002341, -1.882212, 0, 0.9764706, 1, 1,
-0.0610576, -0.2142352, -3.402073, 0, 0.9686275, 1, 1,
-0.04471609, 0.4886917, 0.2591954, 0, 0.9647059, 1, 1,
-0.0441291, -0.9116254, -3.084873, 0, 0.9568627, 1, 1,
-0.03933091, -1.12211, -3.948524, 0, 0.9529412, 1, 1,
-0.03732254, -0.4515019, -1.059115, 0, 0.945098, 1, 1,
-0.03641919, -1.229157, -1.91368, 0, 0.9411765, 1, 1,
-0.02979917, 0.4780516, 0.268905, 0, 0.9333333, 1, 1,
-0.02731555, 0.8635044, -0.4696001, 0, 0.9294118, 1, 1,
-0.02086492, -0.09580201, -2.303325, 0, 0.9215686, 1, 1,
-0.02039587, 0.5672724, -0.5748641, 0, 0.9176471, 1, 1,
-0.01688514, -1.592033, -4.167994, 0, 0.9098039, 1, 1,
-0.0110662, 1.010277, 0.7487981, 0, 0.9058824, 1, 1,
-0.009473645, 0.9884909, 0.3273704, 0, 0.8980392, 1, 1,
-0.006377474, 0.7333195, -1.801902, 0, 0.8901961, 1, 1,
-0.002115258, -0.5019573, -2.916071, 0, 0.8862745, 1, 1,
0.001135911, -1.073196, 2.238858, 0, 0.8784314, 1, 1,
0.003336818, -1.500827, 4.003469, 0, 0.8745098, 1, 1,
0.006665018, -1.161535, 2.103061, 0, 0.8666667, 1, 1,
0.006865019, 0.2720934, 0.8377077, 0, 0.8627451, 1, 1,
0.0200742, -0.5750301, 2.602077, 0, 0.854902, 1, 1,
0.02038932, -1.260144, 4.131751, 0, 0.8509804, 1, 1,
0.02276553, -0.2928891, 3.289887, 0, 0.8431373, 1, 1,
0.0293825, -0.8502919, 1.974029, 0, 0.8392157, 1, 1,
0.0303287, -0.8763514, 1.701597, 0, 0.8313726, 1, 1,
0.0333577, -0.5164407, 3.575162, 0, 0.827451, 1, 1,
0.03510766, -1.875404, 1.827627, 0, 0.8196079, 1, 1,
0.03639615, 0.08456653, -1.354065, 0, 0.8156863, 1, 1,
0.04013296, -0.4423129, 4.148873, 0, 0.8078431, 1, 1,
0.04986558, 0.2846672, -0.5493737, 0, 0.8039216, 1, 1,
0.05308408, 0.2346389, 1.582688, 0, 0.7960784, 1, 1,
0.05614769, 1.07347, 0.8362617, 0, 0.7882353, 1, 1,
0.0565065, 0.232236, 1.969113, 0, 0.7843137, 1, 1,
0.06106312, 0.1951563, -0.7179521, 0, 0.7764706, 1, 1,
0.06222611, -0.29428, 2.708028, 0, 0.772549, 1, 1,
0.0660441, -0.2581384, 5.544748, 0, 0.7647059, 1, 1,
0.0670475, 0.1183776, -0.02871438, 0, 0.7607843, 1, 1,
0.06963978, -1.556101, 2.78134, 0, 0.7529412, 1, 1,
0.07331906, -0.4113156, 2.685068, 0, 0.7490196, 1, 1,
0.07371718, 0.005648613, 2.538293, 0, 0.7411765, 1, 1,
0.07668766, -0.2514815, 4.646211, 0, 0.7372549, 1, 1,
0.07914337, 0.5790336, 0.9306874, 0, 0.7294118, 1, 1,
0.0804573, 0.07189088, 0.9184592, 0, 0.7254902, 1, 1,
0.08261763, 0.1992894, -0.3673536, 0, 0.7176471, 1, 1,
0.08292381, 1.514001, -0.6125968, 0, 0.7137255, 1, 1,
0.0839331, -0.05007888, 1.342886, 0, 0.7058824, 1, 1,
0.08598632, 0.9883721, -0.1489135, 0, 0.6980392, 1, 1,
0.08677352, -0.5573223, 2.412421, 0, 0.6941177, 1, 1,
0.08782676, -1.518742, 2.981676, 0, 0.6862745, 1, 1,
0.08866611, 1.760747, -0.9022173, 0, 0.682353, 1, 1,
0.09156971, 0.4758112, -0.1934299, 0, 0.6745098, 1, 1,
0.09461765, -0.3956756, 2.667022, 0, 0.6705883, 1, 1,
0.09632634, 1.583127, -0.08261026, 0, 0.6627451, 1, 1,
0.09945275, -1.173806, 2.266655, 0, 0.6588235, 1, 1,
0.1001232, 1.583709, 1.528918, 0, 0.6509804, 1, 1,
0.1017912, 0.2583675, 0.1855308, 0, 0.6470588, 1, 1,
0.1026305, 2.442015, -0.06664881, 0, 0.6392157, 1, 1,
0.1078561, 1.048671, -1.760618, 0, 0.6352941, 1, 1,
0.1171482, 1.206321, -0.2105581, 0, 0.627451, 1, 1,
0.1268006, -0.07219273, 1.695122, 0, 0.6235294, 1, 1,
0.1326545, 0.3418444, -0.402777, 0, 0.6156863, 1, 1,
0.136027, -0.09012984, 1.952057, 0, 0.6117647, 1, 1,
0.1450724, -0.370943, 2.443851, 0, 0.6039216, 1, 1,
0.1465825, -1.421041, 3.137033, 0, 0.5960785, 1, 1,
0.147489, -0.8932263, 2.125134, 0, 0.5921569, 1, 1,
0.1476005, 1.221267, 0.9058417, 0, 0.5843138, 1, 1,
0.1481473, -0.5196775, 2.067078, 0, 0.5803922, 1, 1,
0.1546398, -0.8019068, 3.179521, 0, 0.572549, 1, 1,
0.155047, -1.70035, 3.008578, 0, 0.5686275, 1, 1,
0.1570454, 0.3676189, 0.1495091, 0, 0.5607843, 1, 1,
0.1571901, -0.4629199, 1.838405, 0, 0.5568628, 1, 1,
0.1589221, -0.4317473, 2.115178, 0, 0.5490196, 1, 1,
0.1598382, -0.1165282, 1.798395, 0, 0.5450981, 1, 1,
0.165759, -0.3465245, 2.715244, 0, 0.5372549, 1, 1,
0.1687178, 1.183394, 0.5311313, 0, 0.5333334, 1, 1,
0.1710715, 0.2866273, 1.966447, 0, 0.5254902, 1, 1,
0.1713033, 0.8041453, 0.8221397, 0, 0.5215687, 1, 1,
0.1825581, 0.7308896, 0.1109324, 0, 0.5137255, 1, 1,
0.1852995, 0.70627, 0.3199022, 0, 0.509804, 1, 1,
0.1891058, 0.5693153, 2.375442, 0, 0.5019608, 1, 1,
0.1896125, -1.133149, 2.588537, 0, 0.4941176, 1, 1,
0.1927665, 0.8589233, -0.4625621, 0, 0.4901961, 1, 1,
0.1937059, -0.5668451, 1.230096, 0, 0.4823529, 1, 1,
0.1965385, -0.7900967, 2.595614, 0, 0.4784314, 1, 1,
0.1982849, 0.4086109, 1.815844, 0, 0.4705882, 1, 1,
0.1992124, -0.4198318, 3.348855, 0, 0.4666667, 1, 1,
0.2011762, 0.4435088, 0.6147097, 0, 0.4588235, 1, 1,
0.2016016, -2.328156, 3.232202, 0, 0.454902, 1, 1,
0.2017377, -0.4719736, 3.540843, 0, 0.4470588, 1, 1,
0.2020385, -0.3113333, 3.312531, 0, 0.4431373, 1, 1,
0.2030363, 2.104251, 0.003899313, 0, 0.4352941, 1, 1,
0.2070833, -0.6327153, 4.079886, 0, 0.4313726, 1, 1,
0.2095374, 1.172005, 0.1800239, 0, 0.4235294, 1, 1,
0.2101769, 1.362128, -1.10399, 0, 0.4196078, 1, 1,
0.2108017, -1.540266, 3.247307, 0, 0.4117647, 1, 1,
0.2110434, -0.5002054, 1.543865, 0, 0.4078431, 1, 1,
0.2133965, 1.374947, 0.03944036, 0, 0.4, 1, 1,
0.2168816, 2.389186, 1.251099, 0, 0.3921569, 1, 1,
0.2185784, -0.2763151, 1.52495, 0, 0.3882353, 1, 1,
0.2226387, 0.3399229, 0.7238276, 0, 0.3803922, 1, 1,
0.223508, 0.3364146, 1.896385, 0, 0.3764706, 1, 1,
0.2257298, -0.5871592, 1.534002, 0, 0.3686275, 1, 1,
0.2267587, 0.9665701, -2.062811, 0, 0.3647059, 1, 1,
0.2363637, -1.502786, 3.246373, 0, 0.3568628, 1, 1,
0.237571, 0.9554837, 2.489202, 0, 0.3529412, 1, 1,
0.2398574, -0.9222989, 2.607242, 0, 0.345098, 1, 1,
0.2398793, -1.022324, 3.256243, 0, 0.3411765, 1, 1,
0.2460994, -1.778379, 3.278376, 0, 0.3333333, 1, 1,
0.2485738, 0.5324063, 1.267361, 0, 0.3294118, 1, 1,
0.249711, 0.2109555, 0.7516685, 0, 0.3215686, 1, 1,
0.2519253, -1.561553, 3.118058, 0, 0.3176471, 1, 1,
0.2537093, -0.4888457, 2.871935, 0, 0.3098039, 1, 1,
0.2553074, -0.2940005, 2.325327, 0, 0.3058824, 1, 1,
0.2567345, 1.217715, -0.7525464, 0, 0.2980392, 1, 1,
0.2601802, 1.874879, -0.4033069, 0, 0.2901961, 1, 1,
0.2693051, -0.6711953, 2.824697, 0, 0.2862745, 1, 1,
0.2697095, -0.1885485, 1.041025, 0, 0.2784314, 1, 1,
0.27668, 1.497752, 0.6764432, 0, 0.2745098, 1, 1,
0.2777601, 0.6391484, -0.04576017, 0, 0.2666667, 1, 1,
0.2829946, 0.7690929, 0.8244299, 0, 0.2627451, 1, 1,
0.2865835, -0.4026288, 1.974614, 0, 0.254902, 1, 1,
0.2866458, -0.3420638, 0.9520903, 0, 0.2509804, 1, 1,
0.2889635, 0.1994771, 0.5750377, 0, 0.2431373, 1, 1,
0.2895269, -0.4123385, 2.333246, 0, 0.2392157, 1, 1,
0.2902108, 0.8821397, -0.4237098, 0, 0.2313726, 1, 1,
0.2911744, -2.113546, 1.465907, 0, 0.227451, 1, 1,
0.2916779, -0.5194318, 1.070498, 0, 0.2196078, 1, 1,
0.2943262, 0.4851027, 0.9125776, 0, 0.2156863, 1, 1,
0.29441, 1.267544, -0.7907641, 0, 0.2078431, 1, 1,
0.2948687, -1.246758, 2.574913, 0, 0.2039216, 1, 1,
0.3032356, -1.028612, 3.420218, 0, 0.1960784, 1, 1,
0.3040006, -0.241025, 2.317683, 0, 0.1882353, 1, 1,
0.3099672, 1.243428, 1.203802, 0, 0.1843137, 1, 1,
0.3100981, -0.3831657, 3.09488, 0, 0.1764706, 1, 1,
0.3179832, 1.327597, 0.5572526, 0, 0.172549, 1, 1,
0.3189545, 1.209386, 0.5946512, 0, 0.1647059, 1, 1,
0.3228681, -1.08898, 5.346656, 0, 0.1607843, 1, 1,
0.3268939, -0.4754299, 3.930376, 0, 0.1529412, 1, 1,
0.3273087, -2.304291, 2.815551, 0, 0.1490196, 1, 1,
0.3274677, -0.07743344, 1.728183, 0, 0.1411765, 1, 1,
0.3284127, 0.1008746, 2.527744, 0, 0.1372549, 1, 1,
0.3290845, 1.415374, -0.01398113, 0, 0.1294118, 1, 1,
0.3313397, 1.453068, -1.901844, 0, 0.1254902, 1, 1,
0.3322995, 0.8681225, -0.03578594, 0, 0.1176471, 1, 1,
0.333434, -1.030512, 3.194129, 0, 0.1137255, 1, 1,
0.3350042, 0.08677494, -1.374224, 0, 0.1058824, 1, 1,
0.3363287, 0.9643366, -0.3077157, 0, 0.09803922, 1, 1,
0.3394457, -0.4862986, 0.8874928, 0, 0.09411765, 1, 1,
0.3431641, 0.4140876, -0.1805305, 0, 0.08627451, 1, 1,
0.3433348, 0.5160378, -1.083328, 0, 0.08235294, 1, 1,
0.3438003, -1.394189, 1.293892, 0, 0.07450981, 1, 1,
0.3522307, 0.4408992, 0.5702, 0, 0.07058824, 1, 1,
0.3560279, -0.2879841, 3.955145, 0, 0.0627451, 1, 1,
0.3586755, -0.5994734, 2.270174, 0, 0.05882353, 1, 1,
0.360066, -0.7793136, 1.572376, 0, 0.05098039, 1, 1,
0.3646383, 1.18816, 1.71665, 0, 0.04705882, 1, 1,
0.3647285, -1.035043, 2.110623, 0, 0.03921569, 1, 1,
0.3675615, 1.281936, 0.5099709, 0, 0.03529412, 1, 1,
0.3722204, 0.7344155, 0.1110492, 0, 0.02745098, 1, 1,
0.3753631, 0.6920323, 0.6304793, 0, 0.02352941, 1, 1,
0.3771459, 2.066745, -0.3611855, 0, 0.01568628, 1, 1,
0.3795286, -1.974891, 3.097013, 0, 0.01176471, 1, 1,
0.3852902, 1.03432, 1.097099, 0, 0.003921569, 1, 1,
0.3859245, 0.971233, 0.2635028, 0.003921569, 0, 1, 1,
0.3897926, 0.04511466, 0.5553706, 0.007843138, 0, 1, 1,
0.3951805, 0.4162258, 0.6575156, 0.01568628, 0, 1, 1,
0.3986427, -0.277254, 2.533674, 0.01960784, 0, 1, 1,
0.407559, -0.5249254, 1.735045, 0.02745098, 0, 1, 1,
0.4091635, 2.164498, 1.120431, 0.03137255, 0, 1, 1,
0.4092246, 0.3131346, 0.7750728, 0.03921569, 0, 1, 1,
0.4136075, 0.4575155, 0.9008426, 0.04313726, 0, 1, 1,
0.4140978, -1.381899, 2.19681, 0.05098039, 0, 1, 1,
0.4194225, -1.889208, 3.205142, 0.05490196, 0, 1, 1,
0.4208478, -0.9231194, 2.369364, 0.0627451, 0, 1, 1,
0.4217364, 1.183453, 1.928625, 0.06666667, 0, 1, 1,
0.4281002, -0.451257, 1.600917, 0.07450981, 0, 1, 1,
0.4284186, 1.192147, 0.5375796, 0.07843138, 0, 1, 1,
0.4285531, 0.14557, 1.076295, 0.08627451, 0, 1, 1,
0.432484, -1.066041, 3.04903, 0.09019608, 0, 1, 1,
0.4325447, 0.7224936, -0.6110712, 0.09803922, 0, 1, 1,
0.4333246, 0.2655697, 0.5132525, 0.1058824, 0, 1, 1,
0.4349162, 0.7937338, -0.6131868, 0.1098039, 0, 1, 1,
0.4391208, -0.6920733, 3.237062, 0.1176471, 0, 1, 1,
0.4414319, -0.7349193, 3.428179, 0.1215686, 0, 1, 1,
0.4451331, -0.05553167, 0.4700466, 0.1294118, 0, 1, 1,
0.4457726, -1.753776, 1.945852, 0.1333333, 0, 1, 1,
0.4494749, 0.7699999, 0.3923845, 0.1411765, 0, 1, 1,
0.4507671, -0.05496204, 0.3387458, 0.145098, 0, 1, 1,
0.4511516, -0.5764077, 3.562239, 0.1529412, 0, 1, 1,
0.4545972, -0.5049584, 1.984141, 0.1568628, 0, 1, 1,
0.4547619, 0.8588013, -1.078009, 0.1647059, 0, 1, 1,
0.4592406, 0.4328473, 2.742002, 0.1686275, 0, 1, 1,
0.463048, -0.8456889, 1.446709, 0.1764706, 0, 1, 1,
0.4631784, 0.2293972, 1.237925, 0.1803922, 0, 1, 1,
0.4708145, 1.072991, 1.726355, 0.1882353, 0, 1, 1,
0.4735589, -1.879872, 3.581004, 0.1921569, 0, 1, 1,
0.4782379, -0.2399245, 2.040931, 0.2, 0, 1, 1,
0.4798685, -0.475243, 3.162036, 0.2078431, 0, 1, 1,
0.4874443, -1.24424, 2.335845, 0.2117647, 0, 1, 1,
0.4877419, 1.011736, 1.626166, 0.2196078, 0, 1, 1,
0.4969376, -1.490551, 3.858112, 0.2235294, 0, 1, 1,
0.4978245, -1.700069, 3.604375, 0.2313726, 0, 1, 1,
0.5015223, -0.1537946, 0.9175408, 0.2352941, 0, 1, 1,
0.5031601, -3.316691, 2.067319, 0.2431373, 0, 1, 1,
0.5084038, 2.083297, 1.523155, 0.2470588, 0, 1, 1,
0.5088956, -0.9232405, 2.564758, 0.254902, 0, 1, 1,
0.5119977, -0.4522568, 2.800001, 0.2588235, 0, 1, 1,
0.5126414, -0.3490578, 1.907157, 0.2666667, 0, 1, 1,
0.5141326, 2.208044, 1.37836, 0.2705882, 0, 1, 1,
0.519368, 0.8763291, 2.057989, 0.2784314, 0, 1, 1,
0.5194302, 1.021773, -0.7983028, 0.282353, 0, 1, 1,
0.5227816, -0.2204674, 2.577679, 0.2901961, 0, 1, 1,
0.5240011, -0.789467, 3.851393, 0.2941177, 0, 1, 1,
0.5274411, 0.6495638, 0.1334874, 0.3019608, 0, 1, 1,
0.5283974, -0.6070042, 1.393409, 0.3098039, 0, 1, 1,
0.5289997, 0.5981899, 0.4965617, 0.3137255, 0, 1, 1,
0.529411, 1.23011, -0.2779686, 0.3215686, 0, 1, 1,
0.5346906, 1.797471, 0.4321892, 0.3254902, 0, 1, 1,
0.545684, -0.4786712, 2.6098, 0.3333333, 0, 1, 1,
0.5469717, 0.04210043, 1.420684, 0.3372549, 0, 1, 1,
0.5472975, -0.4582553, 3.051762, 0.345098, 0, 1, 1,
0.5588038, -1.782951, 2.557305, 0.3490196, 0, 1, 1,
0.5629332, 0.1079979, 0.9429624, 0.3568628, 0, 1, 1,
0.5661928, 1.489069, 1.649931, 0.3607843, 0, 1, 1,
0.5663195, 1.303276, 0.7866172, 0.3686275, 0, 1, 1,
0.5671013, 1.784622, -0.3612227, 0.372549, 0, 1, 1,
0.5673644, -0.6272403, 2.844786, 0.3803922, 0, 1, 1,
0.5750859, -0.1193615, 2.315264, 0.3843137, 0, 1, 1,
0.5796526, 0.6269693, 1.415006, 0.3921569, 0, 1, 1,
0.5832163, -0.605501, 1.799143, 0.3960784, 0, 1, 1,
0.5884095, 1.586022, 0.1878057, 0.4039216, 0, 1, 1,
0.5887338, -1.461691, 0.7663318, 0.4117647, 0, 1, 1,
0.5901105, 0.01265945, 0.2929264, 0.4156863, 0, 1, 1,
0.5924731, -1.690549, 0.3343365, 0.4235294, 0, 1, 1,
0.5988946, 0.8524387, 0.8518311, 0.427451, 0, 1, 1,
0.6063207, 1.502724, 0.5324596, 0.4352941, 0, 1, 1,
0.6076571, -0.8317296, 1.135247, 0.4392157, 0, 1, 1,
0.6100447, 0.08792206, 2.292715, 0.4470588, 0, 1, 1,
0.6106345, 0.5558894, 1.884507, 0.4509804, 0, 1, 1,
0.6124133, -0.003508886, 2.178605, 0.4588235, 0, 1, 1,
0.6142183, 2.432872, 0.3360801, 0.4627451, 0, 1, 1,
0.6166053, -0.2823406, 0.1721167, 0.4705882, 0, 1, 1,
0.6205971, 0.3227743, 1.88018, 0.4745098, 0, 1, 1,
0.6241698, -1.323282, 3.820512, 0.4823529, 0, 1, 1,
0.6248838, 0.6402607, 0.9152724, 0.4862745, 0, 1, 1,
0.6346649, 0.1681136, 1.874127, 0.4941176, 0, 1, 1,
0.6397448, -1.59874, 0.324663, 0.5019608, 0, 1, 1,
0.6436915, -1.530545, 2.68686, 0.5058824, 0, 1, 1,
0.6444619, -0.6666321, 2.06608, 0.5137255, 0, 1, 1,
0.6489406, -1.117477, 3.036249, 0.5176471, 0, 1, 1,
0.651557, -0.2406969, 2.025751, 0.5254902, 0, 1, 1,
0.6571695, -0.06173868, 3.894702, 0.5294118, 0, 1, 1,
0.6609035, -0.5504457, 1.83358, 0.5372549, 0, 1, 1,
0.6675341, -0.1821798, 3.366669, 0.5411765, 0, 1, 1,
0.6810275, 0.4353756, 1.625002, 0.5490196, 0, 1, 1,
0.6830364, -0.05934823, 2.199228, 0.5529412, 0, 1, 1,
0.684809, 0.211909, 0.9851502, 0.5607843, 0, 1, 1,
0.6856011, -1.296298, 1.861395, 0.5647059, 0, 1, 1,
0.6940446, 1.178618, -2.426955, 0.572549, 0, 1, 1,
0.6955758, 0.03134654, 0.4030982, 0.5764706, 0, 1, 1,
0.7014277, 1.628042, 1.002664, 0.5843138, 0, 1, 1,
0.7015163, 1.124408, 0.5798807, 0.5882353, 0, 1, 1,
0.7030386, 0.9922261, 1.403298, 0.5960785, 0, 1, 1,
0.7051695, -0.1948487, 1.101125, 0.6039216, 0, 1, 1,
0.7052351, 0.5358631, 0.611534, 0.6078432, 0, 1, 1,
0.7121078, 0.8597615, 2.020972, 0.6156863, 0, 1, 1,
0.714127, 0.5377699, 1.152482, 0.6196079, 0, 1, 1,
0.7173102, 0.3389404, 0.2604883, 0.627451, 0, 1, 1,
0.7194268, -0.9731938, 1.200596, 0.6313726, 0, 1, 1,
0.7252823, -1.203012, 2.053128, 0.6392157, 0, 1, 1,
0.7254924, 1.327434, -1.534765, 0.6431373, 0, 1, 1,
0.729645, 1.150959, 0.6284308, 0.6509804, 0, 1, 1,
0.7334329, -1.098982, 2.503252, 0.654902, 0, 1, 1,
0.7397364, 1.265992, 0.5282549, 0.6627451, 0, 1, 1,
0.7420673, 0.2618485, 2.807601, 0.6666667, 0, 1, 1,
0.7470787, -1.112072, 3.756855, 0.6745098, 0, 1, 1,
0.7523862, -0.07915129, 2.642781, 0.6784314, 0, 1, 1,
0.7549199, -1.111073, 2.803904, 0.6862745, 0, 1, 1,
0.7577707, 1.309193, 1.311016, 0.6901961, 0, 1, 1,
0.759281, -0.8907428, 2.856078, 0.6980392, 0, 1, 1,
0.7647899, 0.5671105, 0.3028511, 0.7058824, 0, 1, 1,
0.7680586, 0.8928729, 0.4874854, 0.7098039, 0, 1, 1,
0.7800932, 0.4917032, 2.152382, 0.7176471, 0, 1, 1,
0.7820908, 1.422932, -0.2269543, 0.7215686, 0, 1, 1,
0.7837048, 0.1619461, -0.2190246, 0.7294118, 0, 1, 1,
0.7838721, 0.2662897, 0.9127065, 0.7333333, 0, 1, 1,
0.7847918, 2.13479, -0.001232157, 0.7411765, 0, 1, 1,
0.7913622, -0.1493902, 1.750234, 0.7450981, 0, 1, 1,
0.7929872, -0.1075384, 1.174967, 0.7529412, 0, 1, 1,
0.7935627, 0.1100748, 2.643322, 0.7568628, 0, 1, 1,
0.7961665, 0.4458402, 1.485504, 0.7647059, 0, 1, 1,
0.7995458, 0.5735084, -0.1534126, 0.7686275, 0, 1, 1,
0.8020231, -0.8562599, 1.607334, 0.7764706, 0, 1, 1,
0.8042678, 1.105258, 0.104086, 0.7803922, 0, 1, 1,
0.8065425, -0.2237806, 1.723899, 0.7882353, 0, 1, 1,
0.8070513, -0.05448786, 1.038642, 0.7921569, 0, 1, 1,
0.8076671, 0.589361, 2.176569, 0.8, 0, 1, 1,
0.81971, -0.3714498, 1.739353, 0.8078431, 0, 1, 1,
0.8258692, -2.00923, 3.723294, 0.8117647, 0, 1, 1,
0.8282458, -0.407485, 3.017951, 0.8196079, 0, 1, 1,
0.829286, 0.01009647, 1.079988, 0.8235294, 0, 1, 1,
0.8317805, 0.04139752, 1.49096, 0.8313726, 0, 1, 1,
0.8336683, -0.203952, 2.0375, 0.8352941, 0, 1, 1,
0.8336695, -0.658269, 1.983997, 0.8431373, 0, 1, 1,
0.836443, -1.045097, 2.600772, 0.8470588, 0, 1, 1,
0.838899, 1.154657, 2.564603, 0.854902, 0, 1, 1,
0.8440286, -0.05214798, 2.644144, 0.8588235, 0, 1, 1,
0.8458933, -0.5592968, 2.596946, 0.8666667, 0, 1, 1,
0.850477, 1.007379, 2.056972, 0.8705882, 0, 1, 1,
0.8520698, 0.5750067, 1.007247, 0.8784314, 0, 1, 1,
0.8621889, 0.9748048, 1.39285, 0.8823529, 0, 1, 1,
0.8641158, -1.56674, 4.562308, 0.8901961, 0, 1, 1,
0.8655389, 2.051423, 1.849389, 0.8941177, 0, 1, 1,
0.8669657, 1.070181, -0.136626, 0.9019608, 0, 1, 1,
0.8739017, -0.5277593, 1.379077, 0.9098039, 0, 1, 1,
0.8808236, -0.2853833, 1.630881, 0.9137255, 0, 1, 1,
0.8809111, -2.238468, 2.248574, 0.9215686, 0, 1, 1,
0.8888745, 0.1705006, 2.595682, 0.9254902, 0, 1, 1,
0.8978192, -0.735613, 3.018455, 0.9333333, 0, 1, 1,
0.8997011, 1.401544, -0.4144833, 0.9372549, 0, 1, 1,
0.9002713, -1.238821, 2.719999, 0.945098, 0, 1, 1,
0.9057049, 0.4848886, -1.878755, 0.9490196, 0, 1, 1,
0.9161513, -0.03508288, 0.6436465, 0.9568627, 0, 1, 1,
0.9213582, 0.3712438, 0.32461, 0.9607843, 0, 1, 1,
0.9283209, -1.183287, 1.27209, 0.9686275, 0, 1, 1,
0.9313412, -0.02107768, 0.7746933, 0.972549, 0, 1, 1,
0.9334816, -1.050233, 3.410776, 0.9803922, 0, 1, 1,
0.9336361, 0.751738, 1.160914, 0.9843137, 0, 1, 1,
0.939639, -0.642269, 1.795143, 0.9921569, 0, 1, 1,
0.9406942, -0.4083152, 2.540932, 0.9960784, 0, 1, 1,
0.9461854, 0.522892, 1.686197, 1, 0, 0.9960784, 1,
0.9509634, 0.8427477, 1.634481, 1, 0, 0.9882353, 1,
0.952468, 0.02459902, 0.3502232, 1, 0, 0.9843137, 1,
0.9529989, 1.058443, 1.799564, 1, 0, 0.9764706, 1,
0.9609498, 0.3677324, 1.239322, 1, 0, 0.972549, 1,
0.9613349, 1.095602, 0.7171677, 1, 0, 0.9647059, 1,
0.9640481, 1.510327, 1.440638, 1, 0, 0.9607843, 1,
0.9681315, 0.6757441, 0.4751154, 1, 0, 0.9529412, 1,
0.9703242, -0.4114315, 2.074453, 1, 0, 0.9490196, 1,
0.9718683, 0.5449042, 1.866376, 1, 0, 0.9411765, 1,
0.9719306, -0.7173753, 0.5173901, 1, 0, 0.9372549, 1,
0.9750077, 0.05974172, 2.364374, 1, 0, 0.9294118, 1,
0.9782087, -1.232067, 3.018899, 1, 0, 0.9254902, 1,
0.9894856, 0.714645, -0.4850731, 1, 0, 0.9176471, 1,
0.9982818, -1.969246, 2.001479, 1, 0, 0.9137255, 1,
0.9982949, 0.3268068, 0.4062266, 1, 0, 0.9058824, 1,
1.012903, 1.062125, 1.818505, 1, 0, 0.9019608, 1,
1.01773, 0.932318, 0.5446627, 1, 0, 0.8941177, 1,
1.01813, 0.6384528, 0.6161872, 1, 0, 0.8862745, 1,
1.020724, 0.5452657, 1.869956, 1, 0, 0.8823529, 1,
1.030983, 0.2314396, 1.206655, 1, 0, 0.8745098, 1,
1.032771, -1.320051, 2.514081, 1, 0, 0.8705882, 1,
1.033466, -1.504054, 3.369885, 1, 0, 0.8627451, 1,
1.037136, -1.768324, 1.514647, 1, 0, 0.8588235, 1,
1.041487, -0.2611428, 1.254146, 1, 0, 0.8509804, 1,
1.043826, -0.1320225, 3.329762, 1, 0, 0.8470588, 1,
1.04547, 1.390335, 1.907403, 1, 0, 0.8392157, 1,
1.048633, -0.9726211, 0.9514248, 1, 0, 0.8352941, 1,
1.050182, 0.3582278, 1.913086, 1, 0, 0.827451, 1,
1.055296, -1.363173, 2.084798, 1, 0, 0.8235294, 1,
1.058087, 0.5820144, 1.198717, 1, 0, 0.8156863, 1,
1.058113, -0.06097851, 2.208919, 1, 0, 0.8117647, 1,
1.066783, 0.02648787, 1.162214, 1, 0, 0.8039216, 1,
1.069784, -0.2484983, 3.593982, 1, 0, 0.7960784, 1,
1.074502, 1.192284, 0.07161073, 1, 0, 0.7921569, 1,
1.08974, 1.017403, -0.646309, 1, 0, 0.7843137, 1,
1.093362, 0.8169248, 0.4180821, 1, 0, 0.7803922, 1,
1.09963, 0.6772313, 0.6547827, 1, 0, 0.772549, 1,
1.104128, -2.52371, 2.437189, 1, 0, 0.7686275, 1,
1.10639, -0.8781742, 2.013105, 1, 0, 0.7607843, 1,
1.124719, -1.654876, 1.818539, 1, 0, 0.7568628, 1,
1.128874, 1.598049, 2.303708, 1, 0, 0.7490196, 1,
1.131079, 0.5154245, -0.4975363, 1, 0, 0.7450981, 1,
1.139424, -0.899745, 1.690572, 1, 0, 0.7372549, 1,
1.14075, 0.2170761, 0.7229605, 1, 0, 0.7333333, 1,
1.142902, 0.2324816, 0.8964331, 1, 0, 0.7254902, 1,
1.151262, 0.7745292, 0.6810016, 1, 0, 0.7215686, 1,
1.154199, 0.9305074, 0.8507211, 1, 0, 0.7137255, 1,
1.160788, -1.91249, 1.513356, 1, 0, 0.7098039, 1,
1.16564, -1.226286, 1.943742, 1, 0, 0.7019608, 1,
1.168368, 0.217723, -0.007853894, 1, 0, 0.6941177, 1,
1.170054, 1.347274, 1.22354, 1, 0, 0.6901961, 1,
1.171471, 0.8132696, 0.3053744, 1, 0, 0.682353, 1,
1.173778, -1.024165, 2.385376, 1, 0, 0.6784314, 1,
1.176685, 0.3753043, -0.01337895, 1, 0, 0.6705883, 1,
1.18154, -0.8117515, 2.897014, 1, 0, 0.6666667, 1,
1.182452, -0.4050044, 2.095545, 1, 0, 0.6588235, 1,
1.195767, -1.553628, 4.920768, 1, 0, 0.654902, 1,
1.196114, 0.06287834, 3.918521, 1, 0, 0.6470588, 1,
1.199802, 0.3946643, 0.8737675, 1, 0, 0.6431373, 1,
1.206944, 0.1812524, 2.103581, 1, 0, 0.6352941, 1,
1.207509, 0.1183815, 2.680641, 1, 0, 0.6313726, 1,
1.210865, 1.548909, -1.599097, 1, 0, 0.6235294, 1,
1.211453, 2.008663, -0.2309544, 1, 0, 0.6196079, 1,
1.230904, 0.08436501, 2.347292, 1, 0, 0.6117647, 1,
1.235468, -0.5387221, 0.02558395, 1, 0, 0.6078432, 1,
1.237348, -0.08809838, -0.07875529, 1, 0, 0.6, 1,
1.241548, 0.5281816, 1.428121, 1, 0, 0.5921569, 1,
1.241717, 1.551218, 1.364979, 1, 0, 0.5882353, 1,
1.243241, -0.1272675, 1.493038, 1, 0, 0.5803922, 1,
1.2483, 1.152265, -0.515527, 1, 0, 0.5764706, 1,
1.250933, 1.191053, 0.08772931, 1, 0, 0.5686275, 1,
1.257107, -0.4337301, 2.85146, 1, 0, 0.5647059, 1,
1.264271, 1.386832, -0.1743855, 1, 0, 0.5568628, 1,
1.26903, -0.467308, 1.663045, 1, 0, 0.5529412, 1,
1.288443, -0.2507652, 0.1920041, 1, 0, 0.5450981, 1,
1.296364, -1.037446, 3.532707, 1, 0, 0.5411765, 1,
1.315401, 1.43659, 1.917392, 1, 0, 0.5333334, 1,
1.316319, -0.5109298, 0.6771749, 1, 0, 0.5294118, 1,
1.320914, 0.7031041, 0.6262248, 1, 0, 0.5215687, 1,
1.324479, -0.006246442, 1.14653, 1, 0, 0.5176471, 1,
1.325716, -0.03200407, 1.658541, 1, 0, 0.509804, 1,
1.327918, -0.9887785, 1.674905, 1, 0, 0.5058824, 1,
1.343252, -0.715072, 2.772804, 1, 0, 0.4980392, 1,
1.350062, -1.445077, 2.182316, 1, 0, 0.4901961, 1,
1.377589, -0.2452209, 2.072189, 1, 0, 0.4862745, 1,
1.381843, -2.423671, 1.605195, 1, 0, 0.4784314, 1,
1.38443, -0.923981, 2.461291, 1, 0, 0.4745098, 1,
1.386171, 0.8608475, 2.193413, 1, 0, 0.4666667, 1,
1.389355, 0.1068871, 2.428384, 1, 0, 0.4627451, 1,
1.390227, -0.02756628, 2.085727, 1, 0, 0.454902, 1,
1.390745, -0.1922822, -0.7200465, 1, 0, 0.4509804, 1,
1.393904, -0.5341096, -0.6356094, 1, 0, 0.4431373, 1,
1.415756, 1.053568, 1.654868, 1, 0, 0.4392157, 1,
1.432588, 0.9209349, 1.108642, 1, 0, 0.4313726, 1,
1.433729, -1.091765, 1.157325, 1, 0, 0.427451, 1,
1.43488, -1.184598, 2.560683, 1, 0, 0.4196078, 1,
1.442145, 1.593823, -0.2001363, 1, 0, 0.4156863, 1,
1.458403, 1.266784, 3.029583, 1, 0, 0.4078431, 1,
1.459363, 0.4958614, 1.716111, 1, 0, 0.4039216, 1,
1.462409, 0.308116, 2.112781, 1, 0, 0.3960784, 1,
1.476102, -0.5050171, 3.339914, 1, 0, 0.3882353, 1,
1.480699, -1.382246, 3.104933, 1, 0, 0.3843137, 1,
1.483748, 0.9055055, 1.917012, 1, 0, 0.3764706, 1,
1.501247, 0.4370258, 0.8651993, 1, 0, 0.372549, 1,
1.507773, -0.2601331, 1.374896, 1, 0, 0.3647059, 1,
1.51701, -0.8975605, 1.896389, 1, 0, 0.3607843, 1,
1.520846, 0.6115068, 1.112513, 1, 0, 0.3529412, 1,
1.52794, 0.1954742, 0.8299455, 1, 0, 0.3490196, 1,
1.542375, 1.051104, 0.7886818, 1, 0, 0.3411765, 1,
1.54678, -1.24156, 2.846961, 1, 0, 0.3372549, 1,
1.564076, -1.30919, 2.650406, 1, 0, 0.3294118, 1,
1.575596, 0.3935432, 3.010554, 1, 0, 0.3254902, 1,
1.587283, -0.2127665, 0.9261616, 1, 0, 0.3176471, 1,
1.593391, -1.355859, 2.905927, 1, 0, 0.3137255, 1,
1.609147, 0.0813098, 2.948255, 1, 0, 0.3058824, 1,
1.62045, -0.1594174, 1.755881, 1, 0, 0.2980392, 1,
1.632937, 0.6015431, 0.4538414, 1, 0, 0.2941177, 1,
1.643769, -0.3143843, 2.608689, 1, 0, 0.2862745, 1,
1.645692, -0.8117768, 2.319056, 1, 0, 0.282353, 1,
1.662523, 0.1531021, -0.7470886, 1, 0, 0.2745098, 1,
1.672481, 1.88944, 1.85632, 1, 0, 0.2705882, 1,
1.674744, -1.943929, 2.584318, 1, 0, 0.2627451, 1,
1.678631, 0.12693, -1.044554, 1, 0, 0.2588235, 1,
1.682513, 0.689898, 1.018282, 1, 0, 0.2509804, 1,
1.690523, 1.522979, 0.9718744, 1, 0, 0.2470588, 1,
1.697198, 0.6984206, 4.373259, 1, 0, 0.2392157, 1,
1.706558, -0.7338764, 1.760214, 1, 0, 0.2352941, 1,
1.714822, -1.032346, 2.286149, 1, 0, 0.227451, 1,
1.746452, 0.7384835, 0.3628519, 1, 0, 0.2235294, 1,
1.749078, -1.084285, 1.239928, 1, 0, 0.2156863, 1,
1.763289, -2.146339, 3.041393, 1, 0, 0.2117647, 1,
1.764465, 0.5412924, 1.165884, 1, 0, 0.2039216, 1,
1.77078, -1.376093, 2.470753, 1, 0, 0.1960784, 1,
1.773701, -0.08301017, 3.572853, 1, 0, 0.1921569, 1,
1.778962, 0.7176807, 1.854494, 1, 0, 0.1843137, 1,
1.781616, 1.524306, 1.181324, 1, 0, 0.1803922, 1,
1.781834, 0.8992232, 2.002285, 1, 0, 0.172549, 1,
1.783836, 1.175522, 0.4543812, 1, 0, 0.1686275, 1,
1.788922, -1.482501, 3.584402, 1, 0, 0.1607843, 1,
1.822466, -0.1490392, 2.613338, 1, 0, 0.1568628, 1,
1.823529, -0.2426012, 1.747107, 1, 0, 0.1490196, 1,
1.832534, -0.6261134, 1.668822, 1, 0, 0.145098, 1,
1.845194, 0.9111766, -0.1543489, 1, 0, 0.1372549, 1,
1.847708, 0.3420336, 0.713439, 1, 0, 0.1333333, 1,
1.855162, -0.7065761, 1.249519, 1, 0, 0.1254902, 1,
1.882942, 0.1635903, 1.809688, 1, 0, 0.1215686, 1,
1.88629, -0.1118178, 0.9602508, 1, 0, 0.1137255, 1,
1.892628, -0.7378947, 1.839331, 1, 0, 0.1098039, 1,
1.9434, -1.30085, 2.140831, 1, 0, 0.1019608, 1,
1.974557, -0.96354, 2.566694, 1, 0, 0.09411765, 1,
1.980798, 0.5590706, 1.577572, 1, 0, 0.09019608, 1,
2.001695, -0.1113459, 1.882452, 1, 0, 0.08235294, 1,
2.00731, 0.5749146, 1.315661, 1, 0, 0.07843138, 1,
2.008157, 0.444631, 2.326958, 1, 0, 0.07058824, 1,
2.013635, 0.01723733, 2.777292, 1, 0, 0.06666667, 1,
2.048189, 1.454114, 2.39939, 1, 0, 0.05882353, 1,
2.087586, -1.871805, 1.204869, 1, 0, 0.05490196, 1,
2.134271, 0.2961389, 1.013801, 1, 0, 0.04705882, 1,
2.173292, -0.6098762, 1.149149, 1, 0, 0.04313726, 1,
2.28057, -1.334128, 2.870845, 1, 0, 0.03529412, 1,
2.296853, 0.9975682, 0.4723381, 1, 0, 0.03137255, 1,
2.43422, 0.05894012, 1.789818, 1, 0, 0.02352941, 1,
2.590632, -2.35145, 1.175507, 1, 0, 0.01960784, 1,
2.600556, 0.6979818, 0.8031378, 1, 0, 0.01176471, 1,
2.905619, 0.4013419, 0.5959604, 1, 0, 0.007843138, 1
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
0.05386519, -4.458354, -6.87981, 0, -0.5, 0.5, 0.5,
0.05386519, -4.458354, -6.87981, 1, -0.5, 0.5, 0.5,
0.05386519, -4.458354, -6.87981, 1, 1.5, 0.5, 0.5,
0.05386519, -4.458354, -6.87981, 0, 1.5, 0.5, 0.5
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
-3.764633, 0.05104792, -6.87981, 0, -0.5, 0.5, 0.5,
-3.764633, 0.05104792, -6.87981, 1, -0.5, 0.5, 0.5,
-3.764633, 0.05104792, -6.87981, 1, 1.5, 0.5, 0.5,
-3.764633, 0.05104792, -6.87981, 0, 1.5, 0.5, 0.5
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
-3.764633, -4.458354, 0.2328377, 0, -0.5, 0.5, 0.5,
-3.764633, -4.458354, 0.2328377, 1, -0.5, 0.5, 0.5,
-3.764633, -4.458354, 0.2328377, 1, 1.5, 0.5, 0.5,
-3.764633, -4.458354, 0.2328377, 0, 1.5, 0.5, 0.5
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
-2, -3.417723, -5.23843,
2, -3.417723, -5.23843,
-2, -3.417723, -5.23843,
-2, -3.591161, -5.511993,
-1, -3.417723, -5.23843,
-1, -3.591161, -5.511993,
0, -3.417723, -5.23843,
0, -3.591161, -5.511993,
1, -3.417723, -5.23843,
1, -3.591161, -5.511993,
2, -3.417723, -5.23843,
2, -3.591161, -5.511993
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
-2, -3.938038, -6.05912, 0, -0.5, 0.5, 0.5,
-2, -3.938038, -6.05912, 1, -0.5, 0.5, 0.5,
-2, -3.938038, -6.05912, 1, 1.5, 0.5, 0.5,
-2, -3.938038, -6.05912, 0, 1.5, 0.5, 0.5,
-1, -3.938038, -6.05912, 0, -0.5, 0.5, 0.5,
-1, -3.938038, -6.05912, 1, -0.5, 0.5, 0.5,
-1, -3.938038, -6.05912, 1, 1.5, 0.5, 0.5,
-1, -3.938038, -6.05912, 0, 1.5, 0.5, 0.5,
0, -3.938038, -6.05912, 0, -0.5, 0.5, 0.5,
0, -3.938038, -6.05912, 1, -0.5, 0.5, 0.5,
0, -3.938038, -6.05912, 1, 1.5, 0.5, 0.5,
0, -3.938038, -6.05912, 0, 1.5, 0.5, 0.5,
1, -3.938038, -6.05912, 0, -0.5, 0.5, 0.5,
1, -3.938038, -6.05912, 1, -0.5, 0.5, 0.5,
1, -3.938038, -6.05912, 1, 1.5, 0.5, 0.5,
1, -3.938038, -6.05912, 0, 1.5, 0.5, 0.5,
2, -3.938038, -6.05912, 0, -0.5, 0.5, 0.5,
2, -3.938038, -6.05912, 1, -0.5, 0.5, 0.5,
2, -3.938038, -6.05912, 1, 1.5, 0.5, 0.5,
2, -3.938038, -6.05912, 0, 1.5, 0.5, 0.5
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
-2.883441, -3, -5.23843,
-2.883441, 3, -5.23843,
-2.883441, -3, -5.23843,
-3.030306, -3, -5.511993,
-2.883441, -2, -5.23843,
-3.030306, -2, -5.511993,
-2.883441, -1, -5.23843,
-3.030306, -1, -5.511993,
-2.883441, 0, -5.23843,
-3.030306, 0, -5.511993,
-2.883441, 1, -5.23843,
-3.030306, 1, -5.511993,
-2.883441, 2, -5.23843,
-3.030306, 2, -5.511993,
-2.883441, 3, -5.23843,
-3.030306, 3, -5.511993
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
-3.324037, -3, -6.05912, 0, -0.5, 0.5, 0.5,
-3.324037, -3, -6.05912, 1, -0.5, 0.5, 0.5,
-3.324037, -3, -6.05912, 1, 1.5, 0.5, 0.5,
-3.324037, -3, -6.05912, 0, 1.5, 0.5, 0.5,
-3.324037, -2, -6.05912, 0, -0.5, 0.5, 0.5,
-3.324037, -2, -6.05912, 1, -0.5, 0.5, 0.5,
-3.324037, -2, -6.05912, 1, 1.5, 0.5, 0.5,
-3.324037, -2, -6.05912, 0, 1.5, 0.5, 0.5,
-3.324037, -1, -6.05912, 0, -0.5, 0.5, 0.5,
-3.324037, -1, -6.05912, 1, -0.5, 0.5, 0.5,
-3.324037, -1, -6.05912, 1, 1.5, 0.5, 0.5,
-3.324037, -1, -6.05912, 0, 1.5, 0.5, 0.5,
-3.324037, 0, -6.05912, 0, -0.5, 0.5, 0.5,
-3.324037, 0, -6.05912, 1, -0.5, 0.5, 0.5,
-3.324037, 0, -6.05912, 1, 1.5, 0.5, 0.5,
-3.324037, 0, -6.05912, 0, 1.5, 0.5, 0.5,
-3.324037, 1, -6.05912, 0, -0.5, 0.5, 0.5,
-3.324037, 1, -6.05912, 1, -0.5, 0.5, 0.5,
-3.324037, 1, -6.05912, 1, 1.5, 0.5, 0.5,
-3.324037, 1, -6.05912, 0, 1.5, 0.5, 0.5,
-3.324037, 2, -6.05912, 0, -0.5, 0.5, 0.5,
-3.324037, 2, -6.05912, 1, -0.5, 0.5, 0.5,
-3.324037, 2, -6.05912, 1, 1.5, 0.5, 0.5,
-3.324037, 2, -6.05912, 0, 1.5, 0.5, 0.5,
-3.324037, 3, -6.05912, 0, -0.5, 0.5, 0.5,
-3.324037, 3, -6.05912, 1, -0.5, 0.5, 0.5,
-3.324037, 3, -6.05912, 1, 1.5, 0.5, 0.5,
-3.324037, 3, -6.05912, 0, 1.5, 0.5, 0.5
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
-2.883441, -3.417723, -4,
-2.883441, -3.417723, 4,
-2.883441, -3.417723, -4,
-3.030306, -3.591161, -4,
-2.883441, -3.417723, -2,
-3.030306, -3.591161, -2,
-2.883441, -3.417723, 0,
-3.030306, -3.591161, 0,
-2.883441, -3.417723, 2,
-3.030306, -3.591161, 2,
-2.883441, -3.417723, 4,
-3.030306, -3.591161, 4
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
-3.324037, -3.938038, -4, 0, -0.5, 0.5, 0.5,
-3.324037, -3.938038, -4, 1, -0.5, 0.5, 0.5,
-3.324037, -3.938038, -4, 1, 1.5, 0.5, 0.5,
-3.324037, -3.938038, -4, 0, 1.5, 0.5, 0.5,
-3.324037, -3.938038, -2, 0, -0.5, 0.5, 0.5,
-3.324037, -3.938038, -2, 1, -0.5, 0.5, 0.5,
-3.324037, -3.938038, -2, 1, 1.5, 0.5, 0.5,
-3.324037, -3.938038, -2, 0, 1.5, 0.5, 0.5,
-3.324037, -3.938038, 0, 0, -0.5, 0.5, 0.5,
-3.324037, -3.938038, 0, 1, -0.5, 0.5, 0.5,
-3.324037, -3.938038, 0, 1, 1.5, 0.5, 0.5,
-3.324037, -3.938038, 0, 0, 1.5, 0.5, 0.5,
-3.324037, -3.938038, 2, 0, -0.5, 0.5, 0.5,
-3.324037, -3.938038, 2, 1, -0.5, 0.5, 0.5,
-3.324037, -3.938038, 2, 1, 1.5, 0.5, 0.5,
-3.324037, -3.938038, 2, 0, 1.5, 0.5, 0.5,
-3.324037, -3.938038, 4, 0, -0.5, 0.5, 0.5,
-3.324037, -3.938038, 4, 1, -0.5, 0.5, 0.5,
-3.324037, -3.938038, 4, 1, 1.5, 0.5, 0.5,
-3.324037, -3.938038, 4, 0, 1.5, 0.5, 0.5
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
-2.883441, -3.417723, -5.23843,
-2.883441, 3.519819, -5.23843,
-2.883441, -3.417723, 5.704105,
-2.883441, 3.519819, 5.704105,
-2.883441, -3.417723, -5.23843,
-2.883441, -3.417723, 5.704105,
-2.883441, 3.519819, -5.23843,
-2.883441, 3.519819, 5.704105,
-2.883441, -3.417723, -5.23843,
2.991171, -3.417723, -5.23843,
-2.883441, -3.417723, 5.704105,
2.991171, -3.417723, 5.704105,
-2.883441, 3.519819, -5.23843,
2.991171, 3.519819, -5.23843,
-2.883441, 3.519819, 5.704105,
2.991171, 3.519819, 5.704105,
2.991171, -3.417723, -5.23843,
2.991171, 3.519819, -5.23843,
2.991171, -3.417723, 5.704105,
2.991171, 3.519819, 5.704105,
2.991171, -3.417723, -5.23843,
2.991171, -3.417723, 5.704105,
2.991171, 3.519819, -5.23843,
2.991171, 3.519819, 5.704105
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
var radius = 7.596418;
var distance = 33.79732;
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
mvMatrix.translate( -0.05386519, -0.05104792, -0.2328377 );
mvMatrix.scale( 1.398117, 1.183906, 0.7505935 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.79732);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
lepton<-read.table("lepton.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-lepton$V2
```

```
## Error in eval(expr, envir, enclos): object 'lepton' not found
```

```r
y<-lepton$V3
```

```
## Error in eval(expr, envir, enclos): object 'lepton' not found
```

```r
z<-lepton$V4
```

```
## Error in eval(expr, envir, enclos): object 'lepton' not found
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
-2.797888, -0.5319714, -0.3703643, 0, 0, 1, 1, 1,
-2.554383, 1.383503, -1.018659, 1, 0, 0, 1, 1,
-2.472018, 0.724167, -1.286463, 1, 0, 0, 1, 1,
-2.457286, 1.430672, -3.298472, 1, 0, 0, 1, 1,
-2.412095, 0.1182736, -2.47448, 1, 0, 0, 1, 1,
-2.376526, -0.1070027, -3.175514, 1, 0, 0, 1, 1,
-2.371174, -1.740287, -3.26265, 0, 0, 0, 1, 1,
-2.346228, 0.8866476, -2.25895, 0, 0, 0, 1, 1,
-2.34162, -0.141798, -1.764235, 0, 0, 0, 1, 1,
-2.221957, -0.6180961, -1.362075, 0, 0, 0, 1, 1,
-2.214804, 0.009971115, -1.320418, 0, 0, 0, 1, 1,
-2.212619, 0.9798306, -1.642324, 0, 0, 0, 1, 1,
-2.199985, -2.528008, -2.505048, 0, 0, 0, 1, 1,
-2.158448, -0.6539586, -2.201916, 1, 1, 1, 1, 1,
-2.147448, -1.143202, 0.269756, 1, 1, 1, 1, 1,
-2.102743, 0.7100077, -1.576406, 1, 1, 1, 1, 1,
-2.075525, -0.2109719, -3.480973, 1, 1, 1, 1, 1,
-2.064521, -1.374559, -1.898296, 1, 1, 1, 1, 1,
-2.050051, 1.605029, 0.06419069, 1, 1, 1, 1, 1,
-2.010451, -0.951175, -2.804192, 1, 1, 1, 1, 1,
-1.993781, -0.4923626, -1.659857, 1, 1, 1, 1, 1,
-1.961181, 1.860129, -0.1079862, 1, 1, 1, 1, 1,
-1.946049, -0.04374034, -1.912167, 1, 1, 1, 1, 1,
-1.910577, 0.150662, 1.04256, 1, 1, 1, 1, 1,
-1.899883, 0.04961811, -1.673906, 1, 1, 1, 1, 1,
-1.894658, -0.9337785, -1.457676, 1, 1, 1, 1, 1,
-1.890766, -0.2699592, -1.133668, 1, 1, 1, 1, 1,
-1.840364, 0.8118175, -1.773784, 1, 1, 1, 1, 1,
-1.840139, 2.898451, -1.388293, 0, 0, 1, 1, 1,
-1.838162, -1.337261, -0.8622811, 1, 0, 0, 1, 1,
-1.83192, -0.3360218, -2.217574, 1, 0, 0, 1, 1,
-1.826682, -0.4569179, -1.407947, 1, 0, 0, 1, 1,
-1.819457, -1.491917, -2.807287, 1, 0, 0, 1, 1,
-1.80654, -0.5923133, -0.2737085, 1, 0, 0, 1, 1,
-1.803916, -0.6327099, -2.364053, 0, 0, 0, 1, 1,
-1.793398, -0.2884235, -2.302151, 0, 0, 0, 1, 1,
-1.786464, -0.1727879, -2.062188, 0, 0, 0, 1, 1,
-1.763682, 0.0886317, -1.615362, 0, 0, 0, 1, 1,
-1.758965, -0.8721451, -3.397002, 0, 0, 0, 1, 1,
-1.758372, -1.413619, -2.394581, 0, 0, 0, 1, 1,
-1.753652, 0.3033439, -1.63142, 0, 0, 0, 1, 1,
-1.751392, 0.3602668, -0.6890292, 1, 1, 1, 1, 1,
-1.732359, -1.330001, -0.6862965, 1, 1, 1, 1, 1,
-1.713034, -1.434773, -2.701903, 1, 1, 1, 1, 1,
-1.70518, 1.058994, -1.991096, 1, 1, 1, 1, 1,
-1.70473, 1.197444, -2.228886, 1, 1, 1, 1, 1,
-1.702578, 0.1111898, -0.4480439, 1, 1, 1, 1, 1,
-1.700532, 0.2704658, 0.1626288, 1, 1, 1, 1, 1,
-1.689451, -0.1699827, -1.428476, 1, 1, 1, 1, 1,
-1.683095, -1.708133, -3.862501, 1, 1, 1, 1, 1,
-1.681715, -2.313259, -1.825318, 1, 1, 1, 1, 1,
-1.676709, 0.7225533, -2.119374, 1, 1, 1, 1, 1,
-1.669515, 0.02111642, 0.1500176, 1, 1, 1, 1, 1,
-1.657887, -0.5524057, -2.685896, 1, 1, 1, 1, 1,
-1.64252, -1.024816, -2.355082, 1, 1, 1, 1, 1,
-1.640469, -0.3092504, -2.263182, 1, 1, 1, 1, 1,
-1.638839, -0.1437905, 0.4279971, 0, 0, 1, 1, 1,
-1.613502, -0.08870275, -3.089658, 1, 0, 0, 1, 1,
-1.60662, -0.7746954, -2.989372, 1, 0, 0, 1, 1,
-1.602808, -0.960614, -0.6749366, 1, 0, 0, 1, 1,
-1.591236, 1.012189, -0.6477406, 1, 0, 0, 1, 1,
-1.589187, -1.133868, -0.9380242, 1, 0, 0, 1, 1,
-1.585865, 0.5133063, -3.831789, 0, 0, 0, 1, 1,
-1.584242, -1.337073, -1.414094, 0, 0, 0, 1, 1,
-1.582753, 0.3111489, -0.1638303, 0, 0, 0, 1, 1,
-1.576924, -1.164089, -3.2989, 0, 0, 0, 1, 1,
-1.576458, 0.2399582, -1.77593, 0, 0, 0, 1, 1,
-1.576453, -1.390444, -3.395526, 0, 0, 0, 1, 1,
-1.5703, 1.991752, 0.2817837, 0, 0, 0, 1, 1,
-1.565155, 2.447117, -0.03418866, 1, 1, 1, 1, 1,
-1.556481, -0.1365076, -2.182477, 1, 1, 1, 1, 1,
-1.553593, -1.241315, -1.606395, 1, 1, 1, 1, 1,
-1.544105, 0.9861175, -1.149575, 1, 1, 1, 1, 1,
-1.531529, 0.3076404, -1.807774, 1, 1, 1, 1, 1,
-1.527012, -0.6410573, -2.91415, 1, 1, 1, 1, 1,
-1.520772, -1.284682, -2.541416, 1, 1, 1, 1, 1,
-1.511652, 0.404384, -0.9839371, 1, 1, 1, 1, 1,
-1.48919, -0.8229675, -3.113533, 1, 1, 1, 1, 1,
-1.487697, -1.715129, -2.595543, 1, 1, 1, 1, 1,
-1.480504, -0.8137836, -3.761018, 1, 1, 1, 1, 1,
-1.465028, -0.936086, -3.146195, 1, 1, 1, 1, 1,
-1.458934, 1.583028, -0.2360937, 1, 1, 1, 1, 1,
-1.457002, 1.69372, -0.3651331, 1, 1, 1, 1, 1,
-1.441749, 0.2241798, -0.6799275, 1, 1, 1, 1, 1,
-1.434841, 0.5704827, -2.512764, 0, 0, 1, 1, 1,
-1.434081, -0.4786321, -2.429103, 1, 0, 0, 1, 1,
-1.431523, 1.30776, -1.156029, 1, 0, 0, 1, 1,
-1.41899, 0.001528497, -1.768006, 1, 0, 0, 1, 1,
-1.41294, -0.09990304, 0.1358195, 1, 0, 0, 1, 1,
-1.408054, 1.581578, -1.690846, 1, 0, 0, 1, 1,
-1.39976, -1.042664, -1.911669, 0, 0, 0, 1, 1,
-1.396229, -0.7234161, 0.8817885, 0, 0, 0, 1, 1,
-1.395985, 0.02133404, -2.853542, 0, 0, 0, 1, 1,
-1.395042, -0.4947471, -2.266319, 0, 0, 0, 1, 1,
-1.376853, 1.010022, -0.6218796, 0, 0, 0, 1, 1,
-1.372361, -1.430049, -2.728602, 0, 0, 0, 1, 1,
-1.367278, -1.553066, -1.512064, 0, 0, 0, 1, 1,
-1.350528, -0.8959281, -2.801019, 1, 1, 1, 1, 1,
-1.345747, 0.3559553, -1.214538, 1, 1, 1, 1, 1,
-1.343604, 2.213844, -0.8731333, 1, 1, 1, 1, 1,
-1.342196, -0.8632038, -1.809311, 1, 1, 1, 1, 1,
-1.337044, 0.3527046, -0.7874238, 1, 1, 1, 1, 1,
-1.334751, 0.2246654, 0.00706004, 1, 1, 1, 1, 1,
-1.327275, 0.9497821, -0.56375, 1, 1, 1, 1, 1,
-1.315971, -1.481038, -2.053724, 1, 1, 1, 1, 1,
-1.313754, -2.51344, -3.782356, 1, 1, 1, 1, 1,
-1.305983, -1.502225, -1.218312, 1, 1, 1, 1, 1,
-1.303926, 0.3043669, -3.197948, 1, 1, 1, 1, 1,
-1.299672, 1.490477, -1.041626, 1, 1, 1, 1, 1,
-1.293161, 0.4549722, -1.934781, 1, 1, 1, 1, 1,
-1.290538, -0.08318578, -2.038573, 1, 1, 1, 1, 1,
-1.28948, -1.101352, -3.150468, 1, 1, 1, 1, 1,
-1.277925, 0.3120472, -0.4552202, 0, 0, 1, 1, 1,
-1.253773, -1.953978, -3.337662, 1, 0, 0, 1, 1,
-1.243984, -0.3887495, -1.859617, 1, 0, 0, 1, 1,
-1.232161, -0.09974482, -1.052559, 1, 0, 0, 1, 1,
-1.227698, -0.6200135, -0.5188196, 1, 0, 0, 1, 1,
-1.222203, 0.6258454, -0.6591799, 1, 0, 0, 1, 1,
-1.21309, 0.3210786, 0.9485131, 0, 0, 0, 1, 1,
-1.210692, -0.4917422, -1.763024, 0, 0, 0, 1, 1,
-1.20725, 0.6894972, -0.6339332, 0, 0, 0, 1, 1,
-1.204001, 0.2602653, -2.106519, 0, 0, 0, 1, 1,
-1.202102, -0.7453803, -1.462399, 0, 0, 0, 1, 1,
-1.201345, -0.9256775, -2.075579, 0, 0, 0, 1, 1,
-1.1999, -1.118192, -1.757195, 0, 0, 0, 1, 1,
-1.199891, -2.278012, -1.017305, 1, 1, 1, 1, 1,
-1.193496, -0.4472086, -0.7297142, 1, 1, 1, 1, 1,
-1.18753, 0.2301055, -1.596511, 1, 1, 1, 1, 1,
-1.178844, 1.581028, -3.466809, 1, 1, 1, 1, 1,
-1.173544, 0.7630275, -0.040334, 1, 1, 1, 1, 1,
-1.170972, 1.091085, -1.039923, 1, 1, 1, 1, 1,
-1.170886, 1.438824, -0.22069, 1, 1, 1, 1, 1,
-1.165705, 0.3592803, -0.8382924, 1, 1, 1, 1, 1,
-1.160197, -1.041805, -2.900435, 1, 1, 1, 1, 1,
-1.157045, 0.8067609, -1.561632, 1, 1, 1, 1, 1,
-1.14565, -0.9448007, -3.098555, 1, 1, 1, 1, 1,
-1.136366, 1.076788, 0.07829843, 1, 1, 1, 1, 1,
-1.13361, 0.1115993, -0.5704312, 1, 1, 1, 1, 1,
-1.128994, -0.2762667, -2.434976, 1, 1, 1, 1, 1,
-1.127163, 0.9656549, 0.2541295, 1, 1, 1, 1, 1,
-1.121076, -0.2933004, -1.462351, 0, 0, 1, 1, 1,
-1.116751, -0.9455668, -2.11082, 1, 0, 0, 1, 1,
-1.108218, 0.663541, -3.609462, 1, 0, 0, 1, 1,
-1.107952, 1.049442, -0.1563298, 1, 0, 0, 1, 1,
-1.105374, 1.157652, -1.519564, 1, 0, 0, 1, 1,
-1.100522, 0.3556711, -1.639264, 1, 0, 0, 1, 1,
-1.10011, 0.7881059, -1.353065, 0, 0, 0, 1, 1,
-1.097292, -0.279763, -1.729462, 0, 0, 0, 1, 1,
-1.091605, -0.5627421, -1.688452, 0, 0, 0, 1, 1,
-1.089055, -0.6540763, -1.751061, 0, 0, 0, 1, 1,
-1.083237, 0.1883957, -0.5563547, 0, 0, 0, 1, 1,
-1.081496, -0.5627785, -2.839845, 0, 0, 0, 1, 1,
-1.076001, -0.6280206, -3.419025, 0, 0, 0, 1, 1,
-1.063568, -0.005356213, -0.668183, 1, 1, 1, 1, 1,
-1.060589, -0.06644467, -2.527948, 1, 1, 1, 1, 1,
-1.055804, 1.47609, 1.330351, 1, 1, 1, 1, 1,
-1.055272, 0.4662171, -1.463318, 1, 1, 1, 1, 1,
-1.052814, -0.08950806, -2.181059, 1, 1, 1, 1, 1,
-1.04811, -1.068498, -2.967824, 1, 1, 1, 1, 1,
-1.04103, 0.3344496, -0.8751208, 1, 1, 1, 1, 1,
-1.036825, -1.385908, -2.961906, 1, 1, 1, 1, 1,
-1.029264, -0.3268278, -1.380007, 1, 1, 1, 1, 1,
-1.021515, 0.2202778, -0.8766567, 1, 1, 1, 1, 1,
-1.020046, -1.279725, -0.9318284, 1, 1, 1, 1, 1,
-1.017945, -0.8588533, -4.108965, 1, 1, 1, 1, 1,
-1.012638, 1.828929, -1.060103, 1, 1, 1, 1, 1,
-1.010416, 0.7414619, -1.114494, 1, 1, 1, 1, 1,
-1.008734, -0.4311639, -1.542356, 1, 1, 1, 1, 1,
-1.008065, -0.919138, -1.593362, 0, 0, 1, 1, 1,
-1.003946, -0.6073704, -1.925296, 1, 0, 0, 1, 1,
-1.003307, -1.788712, -2.868335, 1, 0, 0, 1, 1,
-0.9951259, -2.305995, -4.902008, 1, 0, 0, 1, 1,
-0.9934497, -0.3624043, -2.9449, 1, 0, 0, 1, 1,
-0.9922899, 1.169108, 1.065273, 1, 0, 0, 1, 1,
-0.9919508, -0.08459575, -1.841599, 0, 0, 0, 1, 1,
-0.9918509, 0.5558267, -3.541461, 0, 0, 0, 1, 1,
-0.991794, -0.237684, -0.4119836, 0, 0, 0, 1, 1,
-0.9900399, 1.065609, -0.1082682, 0, 0, 0, 1, 1,
-0.9846592, -0.4918326, -2.277791, 0, 0, 0, 1, 1,
-0.9716397, 0.8324621, -3.021333, 0, 0, 0, 1, 1,
-0.9710591, -1.497296, -2.120698, 0, 0, 0, 1, 1,
-0.9675509, -0.05411503, -0.7620229, 1, 1, 1, 1, 1,
-0.9642194, -0.3862511, -3.059356, 1, 1, 1, 1, 1,
-0.9612693, -0.2112359, -1.756831, 1, 1, 1, 1, 1,
-0.9596034, -1.141227, -3.237421, 1, 1, 1, 1, 1,
-0.9587497, 0.3243615, -1.865502, 1, 1, 1, 1, 1,
-0.9574929, 0.5659872, -1.995534, 1, 1, 1, 1, 1,
-0.9524193, -0.6774575, -3.093905, 1, 1, 1, 1, 1,
-0.9521525, -1.922496, -1.334703, 1, 1, 1, 1, 1,
-0.950069, 0.740679, -1.088414, 1, 1, 1, 1, 1,
-0.9492827, 0.8716298, -2.237473, 1, 1, 1, 1, 1,
-0.9385233, 0.3960989, -0.3857005, 1, 1, 1, 1, 1,
-0.925579, -1.155606, -2.154566, 1, 1, 1, 1, 1,
-0.9199911, -0.161909, -4.062263, 1, 1, 1, 1, 1,
-0.9144635, -0.3390431, -2.16509, 1, 1, 1, 1, 1,
-0.9060158, -0.2064322, -1.605888, 1, 1, 1, 1, 1,
-0.9009093, -0.29534, -2.033486, 0, 0, 1, 1, 1,
-0.8957069, 0.2565082, -1.365675, 1, 0, 0, 1, 1,
-0.8929318, -0.1788, -0.6013263, 1, 0, 0, 1, 1,
-0.8902974, -1.177789, -0.9455346, 1, 0, 0, 1, 1,
-0.8868837, -0.8834367, -2.299449, 1, 0, 0, 1, 1,
-0.8851218, 1.117256, -0.2505767, 1, 0, 0, 1, 1,
-0.8845188, -1.337333, -4.192318, 0, 0, 0, 1, 1,
-0.8807268, -0.3161147, -0.899272, 0, 0, 0, 1, 1,
-0.8766043, -1.260473, -3.354993, 0, 0, 0, 1, 1,
-0.8701292, 2.020005, -0.1828574, 0, 0, 0, 1, 1,
-0.8675339, 0.9113627, -0.8331162, 0, 0, 0, 1, 1,
-0.8668613, -0.007583859, -2.218239, 0, 0, 0, 1, 1,
-0.8649355, -0.4029329, -2.273485, 0, 0, 0, 1, 1,
-0.861955, 0.316191, -0.8999662, 1, 1, 1, 1, 1,
-0.8611951, -1.347583, -2.292608, 1, 1, 1, 1, 1,
-0.8590618, 0.4079998, 1.512359, 1, 1, 1, 1, 1,
-0.8553619, 0.8619798, 1.04155, 1, 1, 1, 1, 1,
-0.8540899, -1.359347, -1.682626, 1, 1, 1, 1, 1,
-0.8526215, -1.4007, -3.830826, 1, 1, 1, 1, 1,
-0.8485016, 0.8456547, -0.7355078, 1, 1, 1, 1, 1,
-0.8446362, -0.2136267, -2.774326, 1, 1, 1, 1, 1,
-0.8381819, -0.3380294, -2.420149, 1, 1, 1, 1, 1,
-0.8348112, 0.2512306, -2.89106, 1, 1, 1, 1, 1,
-0.8321198, 0.2790376, -0.851342, 1, 1, 1, 1, 1,
-0.8313811, 0.1342514, -0.7384081, 1, 1, 1, 1, 1,
-0.8266084, 0.3668352, -1.263796, 1, 1, 1, 1, 1,
-0.8265481, -0.7694122, -0.5760912, 1, 1, 1, 1, 1,
-0.8246108, 0.4940151, -1.37413, 1, 1, 1, 1, 1,
-0.8139107, 1.565001, -1.114775, 0, 0, 1, 1, 1,
-0.8128167, 0.2483142, -1.42689, 1, 0, 0, 1, 1,
-0.8128151, 0.202435, -1.622373, 1, 0, 0, 1, 1,
-0.8098164, -0.6975763, -3.077796, 1, 0, 0, 1, 1,
-0.8082411, 0.4715926, -0.7579796, 1, 0, 0, 1, 1,
-0.8062472, 0.49327, -0.3981162, 1, 0, 0, 1, 1,
-0.7976578, 0.6410415, 0.1751389, 0, 0, 0, 1, 1,
-0.7862561, -0.4811343, -2.749844, 0, 0, 0, 1, 1,
-0.7834602, -0.7705039, -1.615368, 0, 0, 0, 1, 1,
-0.7834157, -0.3100416, -2.270184, 0, 0, 0, 1, 1,
-0.7819195, 0.2699025, -1.752674, 0, 0, 0, 1, 1,
-0.7762346, 0.4877397, -0.7650894, 0, 0, 0, 1, 1,
-0.7735825, 1.052602, -1.704278, 0, 0, 0, 1, 1,
-0.7730939, -0.6098077, -3.597754, 1, 1, 1, 1, 1,
-0.7708094, -0.7465554, -2.571151, 1, 1, 1, 1, 1,
-0.767453, 0.9968501, -0.4490599, 1, 1, 1, 1, 1,
-0.7670976, 0.5432099, -0.897527, 1, 1, 1, 1, 1,
-0.7656804, -0.24067, -2.190249, 1, 1, 1, 1, 1,
-0.7567412, 1.096573, 1.336178, 1, 1, 1, 1, 1,
-0.7552181, -0.1423037, -3.780396, 1, 1, 1, 1, 1,
-0.7520732, 0.5199547, -2.39882, 1, 1, 1, 1, 1,
-0.752009, 1.866985, -0.3637623, 1, 1, 1, 1, 1,
-0.7473988, -1.110089, -4.035017, 1, 1, 1, 1, 1,
-0.7454454, -0.7570224, -2.141428, 1, 1, 1, 1, 1,
-0.7382941, 0.9435912, -1.663475, 1, 1, 1, 1, 1,
-0.7338506, -0.4426676, -1.869194, 1, 1, 1, 1, 1,
-0.7326005, -0.6230937, -1.986231, 1, 1, 1, 1, 1,
-0.7322851, -0.3680606, -3.384922, 1, 1, 1, 1, 1,
-0.7318296, -1.703085, -2.992826, 0, 0, 1, 1, 1,
-0.7220927, 0.3162718, -0.4967126, 1, 0, 0, 1, 1,
-0.721409, 0.6476631, 0.00213293, 1, 0, 0, 1, 1,
-0.7192425, -0.3383753, -2.52857, 1, 0, 0, 1, 1,
-0.7160429, -0.5648143, -2.30411, 1, 0, 0, 1, 1,
-0.7112922, -0.3773661, -2.976603, 1, 0, 0, 1, 1,
-0.7103328, -0.5850141, -2.418864, 0, 0, 0, 1, 1,
-0.70864, 0.1585658, -2.273856, 0, 0, 0, 1, 1,
-0.7043165, -0.6315394, -0.8933805, 0, 0, 0, 1, 1,
-0.7031211, 0.9874756, -0.2952622, 0, 0, 0, 1, 1,
-0.7017948, 0.01260232, -1.631915, 0, 0, 0, 1, 1,
-0.6972383, -0.145059, -0.1273863, 0, 0, 0, 1, 1,
-0.6971129, -1.139964, -1.995931, 0, 0, 0, 1, 1,
-0.6968574, 1.647386, 0.3808924, 1, 1, 1, 1, 1,
-0.691145, 1.246768, 0.9072315, 1, 1, 1, 1, 1,
-0.6884789, -0.7059372, -4.182042, 1, 1, 1, 1, 1,
-0.6882763, -1.594099, -3.884254, 1, 1, 1, 1, 1,
-0.6871476, 0.0755022, -0.5695155, 1, 1, 1, 1, 1,
-0.6861846, -3.074819, -2.135922, 1, 1, 1, 1, 1,
-0.6687186, 0.4469893, -1.287548, 1, 1, 1, 1, 1,
-0.6672159, -0.376537, -2.755787, 1, 1, 1, 1, 1,
-0.6657344, -0.1289342, -2.517849, 1, 1, 1, 1, 1,
-0.664813, -0.01588347, -3.336389, 1, 1, 1, 1, 1,
-0.6634079, 0.6428732, -0.6423847, 1, 1, 1, 1, 1,
-0.6578688, 1.264568, 2.299705, 1, 1, 1, 1, 1,
-0.6527183, -1.239942, -4.149123, 1, 1, 1, 1, 1,
-0.6518844, 0.5640076, -0.8838269, 1, 1, 1, 1, 1,
-0.642791, -1.351705, -2.88961, 1, 1, 1, 1, 1,
-0.6415116, 1.041722, 1.788959, 0, 0, 1, 1, 1,
-0.6394795, -1.331083, -1.419561, 1, 0, 0, 1, 1,
-0.6385601, -1.245736, -1.973535, 1, 0, 0, 1, 1,
-0.6364498, -0.3766892, -3.378986, 1, 0, 0, 1, 1,
-0.633274, -0.3882765, -0.9939092, 1, 0, 0, 1, 1,
-0.630854, -0.8002619, -1.85316, 1, 0, 0, 1, 1,
-0.6250354, 0.1898421, -2.482398, 0, 0, 0, 1, 1,
-0.6184947, -0.5180175, -2.189077, 0, 0, 0, 1, 1,
-0.6166607, -0.8081126, -3.71087, 0, 0, 0, 1, 1,
-0.6145514, -1.280859, -1.18524, 0, 0, 0, 1, 1,
-0.6108863, 0.8926663, 0.6815626, 0, 0, 0, 1, 1,
-0.6100953, 1.208449, -1.632703, 0, 0, 0, 1, 1,
-0.6044878, 0.2372318, -1.284046, 0, 0, 0, 1, 1,
-0.6035845, -0.06551105, -2.595825, 1, 1, 1, 1, 1,
-0.5997883, -0.5975751, -1.767356, 1, 1, 1, 1, 1,
-0.5979112, 0.05889806, -1.078496, 1, 1, 1, 1, 1,
-0.590629, 0.4937993, -0.4647365, 1, 1, 1, 1, 1,
-0.5834088, -0.3493884, -0.2099977, 1, 1, 1, 1, 1,
-0.579994, -0.4032994, -1.422346, 1, 1, 1, 1, 1,
-0.5780982, 1.278685, -0.09941532, 1, 1, 1, 1, 1,
-0.5775135, 0.6634025, -0.9661862, 1, 1, 1, 1, 1,
-0.5769944, -0.4129622, -3.716811, 1, 1, 1, 1, 1,
-0.5716107, 0.8074245, 0.01169591, 1, 1, 1, 1, 1,
-0.5617707, 0.449159, -1.124637, 1, 1, 1, 1, 1,
-0.5560791, -1.007766, -1.166645, 1, 1, 1, 1, 1,
-0.554958, -0.05282538, -2.146107, 1, 1, 1, 1, 1,
-0.5548201, 0.5945478, 0.2670009, 1, 1, 1, 1, 1,
-0.5522667, -1.74296, -3.583856, 1, 1, 1, 1, 1,
-0.5519383, 0.02760215, -2.938321, 0, 0, 1, 1, 1,
-0.5519191, -1.450245, -4.310141, 1, 0, 0, 1, 1,
-0.5489297, 0.4501555, -1.592847, 1, 0, 0, 1, 1,
-0.5435109, -0.7811553, -4.44774, 1, 0, 0, 1, 1,
-0.542945, -0.2706754, -0.681559, 1, 0, 0, 1, 1,
-0.5391757, 0.2627507, -0.1944376, 1, 0, 0, 1, 1,
-0.5381513, -0.8455678, -1.918677, 0, 0, 0, 1, 1,
-0.5324152, 0.08864995, -0.2665047, 0, 0, 0, 1, 1,
-0.5307145, -1.281687, -2.626279, 0, 0, 0, 1, 1,
-0.528568, 0.6974973, -0.7378995, 0, 0, 0, 1, 1,
-0.5199136, -0.9909847, -2.199413, 0, 0, 0, 1, 1,
-0.5156993, 0.7031075, 0.3426094, 0, 0, 0, 1, 1,
-0.5104781, -1.248304, -4.375572, 0, 0, 0, 1, 1,
-0.495632, -1.385604, -4.357054, 1, 1, 1, 1, 1,
-0.4952274, -2.07091, -1.758275, 1, 1, 1, 1, 1,
-0.4941348, -1.119756, -2.829133, 1, 1, 1, 1, 1,
-0.4885061, -1.098441, -4.131424, 1, 1, 1, 1, 1,
-0.4854009, 0.04454724, -1.615437, 1, 1, 1, 1, 1,
-0.4832401, 0.5569615, 0.568837, 1, 1, 1, 1, 1,
-0.4822049, 0.5625396, -2.142409, 1, 1, 1, 1, 1,
-0.4801871, -0.1062043, -0.5399855, 1, 1, 1, 1, 1,
-0.4749352, 1.957319, -0.5521288, 1, 1, 1, 1, 1,
-0.4741327, 1.082143, -1.063426, 1, 1, 1, 1, 1,
-0.4687737, 0.4135532, -1.532318, 1, 1, 1, 1, 1,
-0.4664326, 1.487038, -1.515813, 1, 1, 1, 1, 1,
-0.4650532, -1.005424, -2.480848, 1, 1, 1, 1, 1,
-0.4608958, 1.655668, -1.091488, 1, 1, 1, 1, 1,
-0.4608521, -0.5277023, -2.377892, 1, 1, 1, 1, 1,
-0.4602505, 0.6231244, -2.0032, 0, 0, 1, 1, 1,
-0.4590306, -0.0368906, -1.001086, 1, 0, 0, 1, 1,
-0.4534362, -1.645552, -2.540865, 1, 0, 0, 1, 1,
-0.45275, -1.165208, -3.299979, 1, 0, 0, 1, 1,
-0.4524975, -0.2181204, -3.359932, 1, 0, 0, 1, 1,
-0.4490255, 0.8125104, 0.2773911, 1, 0, 0, 1, 1,
-0.4481842, 1.552577, -0.2029065, 0, 0, 0, 1, 1,
-0.4476532, -0.1435471, -1.843899, 0, 0, 0, 1, 1,
-0.4465505, -0.009386838, -0.7770219, 0, 0, 0, 1, 1,
-0.4412473, -0.4461317, -3.160907, 0, 0, 0, 1, 1,
-0.4373913, -0.4751902, -2.101214, 0, 0, 0, 1, 1,
-0.4351154, 2.267068, 0.7406249, 0, 0, 0, 1, 1,
-0.4346584, 2.874126, 1.085643, 0, 0, 0, 1, 1,
-0.4292633, 0.1818105, -1.989847, 1, 1, 1, 1, 1,
-0.4287817, 1.393879, 0.08679223, 1, 1, 1, 1, 1,
-0.4240679, 1.560342, 0.5446292, 1, 1, 1, 1, 1,
-0.4219435, 0.06805536, -2.226069, 1, 1, 1, 1, 1,
-0.4206272, 0.313682, -0.09510274, 1, 1, 1, 1, 1,
-0.4206103, -0.3742779, -0.5420608, 1, 1, 1, 1, 1,
-0.4159018, -0.009142037, -3.743403, 1, 1, 1, 1, 1,
-0.4154257, -1.037627, -2.434493, 1, 1, 1, 1, 1,
-0.4104955, -2.596796, -3.371483, 1, 1, 1, 1, 1,
-0.4101913, -0.1440107, -1.294597, 1, 1, 1, 1, 1,
-0.4092121, -1.590112, -3.591427, 1, 1, 1, 1, 1,
-0.4078572, -1.4549, -1.539725, 1, 1, 1, 1, 1,
-0.4003771, 0.3960814, -0.5329077, 1, 1, 1, 1, 1,
-0.3944356, -0.5412444, -1.851478, 1, 1, 1, 1, 1,
-0.3926722, 0.7147321, 1.849182, 1, 1, 1, 1, 1,
-0.386494, -0.8441322, -2.847052, 0, 0, 1, 1, 1,
-0.3814524, 0.7582589, 0.03651535, 1, 0, 0, 1, 1,
-0.3798097, -0.7829452, -3.359622, 1, 0, 0, 1, 1,
-0.3788412, 0.5602466, -0.9687607, 1, 0, 0, 1, 1,
-0.3770455, 0.1951219, -0.7437477, 1, 0, 0, 1, 1,
-0.3768786, 0.6674324, 0.3503041, 1, 0, 0, 1, 1,
-0.375772, 0.5939609, -0.7935598, 0, 0, 0, 1, 1,
-0.3713323, 1.843349, 0.1584959, 0, 0, 0, 1, 1,
-0.3706025, -0.4046918, -1.32899, 0, 0, 0, 1, 1,
-0.3702004, -2.954979, -3.661259, 0, 0, 0, 1, 1,
-0.3613995, -0.6286315, -4.341234, 0, 0, 0, 1, 1,
-0.3600312, -0.8438458, -2.520379, 0, 0, 0, 1, 1,
-0.3589217, -1.02539, -3.743578, 0, 0, 0, 1, 1,
-0.3521186, -0.5853328, -4.021239, 1, 1, 1, 1, 1,
-0.3509785, -0.3240806, -2.288747, 1, 1, 1, 1, 1,
-0.3508798, -0.1792105, -0.4231369, 1, 1, 1, 1, 1,
-0.3484862, -0.2249649, -4.486789, 1, 1, 1, 1, 1,
-0.3469211, -0.02875521, -1.123168, 1, 1, 1, 1, 1,
-0.3416971, 1.006713, 0.4563965, 1, 1, 1, 1, 1,
-0.3399177, 0.4585519, -0.07647741, 1, 1, 1, 1, 1,
-0.3332919, 0.7056434, -0.4177005, 1, 1, 1, 1, 1,
-0.3317747, 0.8533845, 0.8683188, 1, 1, 1, 1, 1,
-0.3309514, -0.2070711, -3.108795, 1, 1, 1, 1, 1,
-0.3309335, -0.1842436, -3.084302, 1, 1, 1, 1, 1,
-0.3273763, 1.270523, -1.420552, 1, 1, 1, 1, 1,
-0.3251869, -1.941565, -2.595508, 1, 1, 1, 1, 1,
-0.3244774, 1.035746, -0.420959, 1, 1, 1, 1, 1,
-0.3238631, 0.8889605, 0.6795738, 1, 1, 1, 1, 1,
-0.3235472, 0.07465671, -0.6513702, 0, 0, 1, 1, 1,
-0.3221574, 0.206682, -1.434041, 1, 0, 0, 1, 1,
-0.3162954, -0.2870791, -3.372725, 1, 0, 0, 1, 1,
-0.3132398, 0.9911128, -0.8310007, 1, 0, 0, 1, 1,
-0.3107366, -0.2768551, -2.233735, 1, 0, 0, 1, 1,
-0.3093465, -1.153302, -3.659656, 1, 0, 0, 1, 1,
-0.3080609, 1.227368, 0.009587777, 0, 0, 0, 1, 1,
-0.3074777, 0.7522009, 1.395527, 0, 0, 0, 1, 1,
-0.3069482, 0.6136427, -1.084356, 0, 0, 0, 1, 1,
-0.3036767, -0.4407319, -3.1571, 0, 0, 0, 1, 1,
-0.2988097, 0.2037645, 1.083202, 0, 0, 0, 1, 1,
-0.2985574, -0.2050443, -2.848158, 0, 0, 0, 1, 1,
-0.2982751, -0.1775675, -1.791083, 0, 0, 0, 1, 1,
-0.2946845, 0.7087453, 0.9042194, 1, 1, 1, 1, 1,
-0.2939986, 1.935539, 0.1200902, 1, 1, 1, 1, 1,
-0.2922853, -0.5941485, -2.676931, 1, 1, 1, 1, 1,
-0.290446, 1.632571, -1.171659, 1, 1, 1, 1, 1,
-0.2882121, -0.01014735, -0.8303583, 1, 1, 1, 1, 1,
-0.2835293, -0.06538217, -2.276435, 1, 1, 1, 1, 1,
-0.2796309, 0.4306808, -0.2687304, 1, 1, 1, 1, 1,
-0.2767296, -0.2437364, -3.199026, 1, 1, 1, 1, 1,
-0.2746429, -0.6306464, -1.663463, 1, 1, 1, 1, 1,
-0.2708682, 0.8952302, 0.2552252, 1, 1, 1, 1, 1,
-0.2693786, 1.070925, -0.2273303, 1, 1, 1, 1, 1,
-0.2662157, -0.4232206, -3.077723, 1, 1, 1, 1, 1,
-0.2662113, -0.1573133, -3.032614, 1, 1, 1, 1, 1,
-0.2641229, 0.5169966, -0.8479536, 1, 1, 1, 1, 1,
-0.2617258, 1.087217, -0.4851416, 1, 1, 1, 1, 1,
-0.2599615, 0.04622832, 0.06159097, 0, 0, 1, 1, 1,
-0.2592524, -1.342817, -2.133433, 1, 0, 0, 1, 1,
-0.2553227, 0.5599284, -1.47767, 1, 0, 0, 1, 1,
-0.2512493, 1.214799, 0.2716573, 1, 0, 0, 1, 1,
-0.2490764, -0.7341285, -2.963833, 1, 0, 0, 1, 1,
-0.2428063, 0.691921, 0.441175, 1, 0, 0, 1, 1,
-0.2425611, 3.418787, 1.624629, 0, 0, 0, 1, 1,
-0.2399649, 0.8798802, -0.7118443, 0, 0, 0, 1, 1,
-0.2373275, -0.6813529, -0.7633215, 0, 0, 0, 1, 1,
-0.235416, -1.10467, -3.991425, 0, 0, 0, 1, 1,
-0.2329928, -0.6110287, -4.10848, 0, 0, 0, 1, 1,
-0.232938, -0.458889, -2.248095, 0, 0, 0, 1, 1,
-0.2211584, 0.4153445, 1.038501, 0, 0, 0, 1, 1,
-0.2208823, -0.124246, -4.101368, 1, 1, 1, 1, 1,
-0.2204441, 1.025046, 1.217477, 1, 1, 1, 1, 1,
-0.2199303, 0.1471691, -0.3501725, 1, 1, 1, 1, 1,
-0.2185105, -0.1936692, -2.333789, 1, 1, 1, 1, 1,
-0.2139619, 0.1640599, -0.1261702, 1, 1, 1, 1, 1,
-0.2133186, 0.1125626, -2.227424, 1, 1, 1, 1, 1,
-0.2125544, 1.867274, -0.3040006, 1, 1, 1, 1, 1,
-0.2107318, 1.123265, 0.3333839, 1, 1, 1, 1, 1,
-0.2083004, -0.15754, -1.112007, 1, 1, 1, 1, 1,
-0.2082763, 0.4525954, 0.9200504, 1, 1, 1, 1, 1,
-0.2042121, 0.8368608, -0.590206, 1, 1, 1, 1, 1,
-0.1982556, -0.8331536, -2.381965, 1, 1, 1, 1, 1,
-0.1975915, -0.7314205, -3.054003, 1, 1, 1, 1, 1,
-0.1963318, -0.6571344, -1.467894, 1, 1, 1, 1, 1,
-0.1955841, -1.339322, -5.079072, 1, 1, 1, 1, 1,
-0.1954357, 0.1714414, 0.9023547, 0, 0, 1, 1, 1,
-0.1952889, -0.7012078, -2.989832, 1, 0, 0, 1, 1,
-0.1944188, 0.3763623, -1.039211, 1, 0, 0, 1, 1,
-0.19413, 0.9456118, -0.7982435, 1, 0, 0, 1, 1,
-0.1880299, 0.6338628, -2.567659, 1, 0, 0, 1, 1,
-0.1814997, 0.8102611, -0.7824962, 1, 0, 0, 1, 1,
-0.1800442, -0.7548785, -1.363835, 0, 0, 0, 1, 1,
-0.1773014, 2.34135, -1.528136, 0, 0, 0, 1, 1,
-0.1737565, 1.586139, 0.3731281, 0, 0, 0, 1, 1,
-0.1734169, -1.248619, -2.16295, 0, 0, 0, 1, 1,
-0.1730797, 0.06876305, 0.6118394, 0, 0, 0, 1, 1,
-0.1724266, 0.3656093, -2.325092, 0, 0, 0, 1, 1,
-0.1719166, -0.4797157, -1.629458, 0, 0, 0, 1, 1,
-0.1717601, 1.01564, -0.4974887, 1, 1, 1, 1, 1,
-0.1709452, -0.8124586, -2.264786, 1, 1, 1, 1, 1,
-0.1682964, 0.1149534, -1.900734, 1, 1, 1, 1, 1,
-0.1617212, 0.5241588, -1.483597, 1, 1, 1, 1, 1,
-0.1601147, -0.1007816, -3.762662, 1, 1, 1, 1, 1,
-0.1529862, -0.5283659, -2.263575, 1, 1, 1, 1, 1,
-0.1525942, -0.7116556, -3.795777, 1, 1, 1, 1, 1,
-0.1518205, -1.312726, -2.754805, 1, 1, 1, 1, 1,
-0.1512808, -0.6997373, -3.933675, 1, 1, 1, 1, 1,
-0.1511205, -1.159117, -2.624172, 1, 1, 1, 1, 1,
-0.1499161, 1.090144, -0.2546743, 1, 1, 1, 1, 1,
-0.1488975, 1.259151, 0.1777296, 1, 1, 1, 1, 1,
-0.1488607, 0.7812854, 0.7695, 1, 1, 1, 1, 1,
-0.1455311, -0.4317396, -2.079039, 1, 1, 1, 1, 1,
-0.1452952, -0.9523098, -3.323494, 1, 1, 1, 1, 1,
-0.138152, -2.922026, -3.468544, 0, 0, 1, 1, 1,
-0.1380027, -0.1195903, -3.309458, 1, 0, 0, 1, 1,
-0.1345328, -1.09273, -0.9719294, 1, 0, 0, 1, 1,
-0.1318507, 0.1994365, -2.340408, 1, 0, 0, 1, 1,
-0.1318353, -0.05313122, -4.24218, 1, 0, 0, 1, 1,
-0.1290884, 0.1847072, -1.355859, 1, 0, 0, 1, 1,
-0.1285768, 0.841894, -0.3927647, 0, 0, 0, 1, 1,
-0.1282886, -1.213538, -3.116224, 0, 0, 0, 1, 1,
-0.1277048, -0.6874697, -3.865969, 0, 0, 0, 1, 1,
-0.1245195, 0.4976308, -0.2247322, 0, 0, 0, 1, 1,
-0.1171263, 0.4296753, -0.4607259, 0, 0, 0, 1, 1,
-0.1126941, 0.3262392, -2.200451, 0, 0, 0, 1, 1,
-0.110439, -0.7599538, -1.899981, 0, 0, 0, 1, 1,
-0.1092096, 0.8182154, -0.5370874, 1, 1, 1, 1, 1,
-0.100406, 0.08187906, -0.4491492, 1, 1, 1, 1, 1,
-0.09971334, -1.213908, -2.740527, 1, 1, 1, 1, 1,
-0.09900185, 0.6267874, -0.03683782, 1, 1, 1, 1, 1,
-0.09711475, -1.834631, -3.048959, 1, 1, 1, 1, 1,
-0.09392774, 1.00558, -0.2885666, 1, 1, 1, 1, 1,
-0.09282699, 0.6658492, 1.787767, 1, 1, 1, 1, 1,
-0.09043161, 1.116029, 0.3045579, 1, 1, 1, 1, 1,
-0.0887996, 0.9653187, -1.124042, 1, 1, 1, 1, 1,
-0.07971314, -1.379782, -3.891836, 1, 1, 1, 1, 1,
-0.07621836, -0.8107019, -3.740888, 1, 1, 1, 1, 1,
-0.07496002, -1.470146, -3.689429, 1, 1, 1, 1, 1,
-0.07232664, 1.309014, 0.6938222, 1, 1, 1, 1, 1,
-0.06785914, 1.073646, 1.707066, 1, 1, 1, 1, 1,
-0.06407946, -0.2284155, -3.707937, 1, 1, 1, 1, 1,
-0.06172165, 0.3002341, -1.882212, 0, 0, 1, 1, 1,
-0.0610576, -0.2142352, -3.402073, 1, 0, 0, 1, 1,
-0.04471609, 0.4886917, 0.2591954, 1, 0, 0, 1, 1,
-0.0441291, -0.9116254, -3.084873, 1, 0, 0, 1, 1,
-0.03933091, -1.12211, -3.948524, 1, 0, 0, 1, 1,
-0.03732254, -0.4515019, -1.059115, 1, 0, 0, 1, 1,
-0.03641919, -1.229157, -1.91368, 0, 0, 0, 1, 1,
-0.02979917, 0.4780516, 0.268905, 0, 0, 0, 1, 1,
-0.02731555, 0.8635044, -0.4696001, 0, 0, 0, 1, 1,
-0.02086492, -0.09580201, -2.303325, 0, 0, 0, 1, 1,
-0.02039587, 0.5672724, -0.5748641, 0, 0, 0, 1, 1,
-0.01688514, -1.592033, -4.167994, 0, 0, 0, 1, 1,
-0.0110662, 1.010277, 0.7487981, 0, 0, 0, 1, 1,
-0.009473645, 0.9884909, 0.3273704, 1, 1, 1, 1, 1,
-0.006377474, 0.7333195, -1.801902, 1, 1, 1, 1, 1,
-0.002115258, -0.5019573, -2.916071, 1, 1, 1, 1, 1,
0.001135911, -1.073196, 2.238858, 1, 1, 1, 1, 1,
0.003336818, -1.500827, 4.003469, 1, 1, 1, 1, 1,
0.006665018, -1.161535, 2.103061, 1, 1, 1, 1, 1,
0.006865019, 0.2720934, 0.8377077, 1, 1, 1, 1, 1,
0.0200742, -0.5750301, 2.602077, 1, 1, 1, 1, 1,
0.02038932, -1.260144, 4.131751, 1, 1, 1, 1, 1,
0.02276553, -0.2928891, 3.289887, 1, 1, 1, 1, 1,
0.0293825, -0.8502919, 1.974029, 1, 1, 1, 1, 1,
0.0303287, -0.8763514, 1.701597, 1, 1, 1, 1, 1,
0.0333577, -0.5164407, 3.575162, 1, 1, 1, 1, 1,
0.03510766, -1.875404, 1.827627, 1, 1, 1, 1, 1,
0.03639615, 0.08456653, -1.354065, 1, 1, 1, 1, 1,
0.04013296, -0.4423129, 4.148873, 0, 0, 1, 1, 1,
0.04986558, 0.2846672, -0.5493737, 1, 0, 0, 1, 1,
0.05308408, 0.2346389, 1.582688, 1, 0, 0, 1, 1,
0.05614769, 1.07347, 0.8362617, 1, 0, 0, 1, 1,
0.0565065, 0.232236, 1.969113, 1, 0, 0, 1, 1,
0.06106312, 0.1951563, -0.7179521, 1, 0, 0, 1, 1,
0.06222611, -0.29428, 2.708028, 0, 0, 0, 1, 1,
0.0660441, -0.2581384, 5.544748, 0, 0, 0, 1, 1,
0.0670475, 0.1183776, -0.02871438, 0, 0, 0, 1, 1,
0.06963978, -1.556101, 2.78134, 0, 0, 0, 1, 1,
0.07331906, -0.4113156, 2.685068, 0, 0, 0, 1, 1,
0.07371718, 0.005648613, 2.538293, 0, 0, 0, 1, 1,
0.07668766, -0.2514815, 4.646211, 0, 0, 0, 1, 1,
0.07914337, 0.5790336, 0.9306874, 1, 1, 1, 1, 1,
0.0804573, 0.07189088, 0.9184592, 1, 1, 1, 1, 1,
0.08261763, 0.1992894, -0.3673536, 1, 1, 1, 1, 1,
0.08292381, 1.514001, -0.6125968, 1, 1, 1, 1, 1,
0.0839331, -0.05007888, 1.342886, 1, 1, 1, 1, 1,
0.08598632, 0.9883721, -0.1489135, 1, 1, 1, 1, 1,
0.08677352, -0.5573223, 2.412421, 1, 1, 1, 1, 1,
0.08782676, -1.518742, 2.981676, 1, 1, 1, 1, 1,
0.08866611, 1.760747, -0.9022173, 1, 1, 1, 1, 1,
0.09156971, 0.4758112, -0.1934299, 1, 1, 1, 1, 1,
0.09461765, -0.3956756, 2.667022, 1, 1, 1, 1, 1,
0.09632634, 1.583127, -0.08261026, 1, 1, 1, 1, 1,
0.09945275, -1.173806, 2.266655, 1, 1, 1, 1, 1,
0.1001232, 1.583709, 1.528918, 1, 1, 1, 1, 1,
0.1017912, 0.2583675, 0.1855308, 1, 1, 1, 1, 1,
0.1026305, 2.442015, -0.06664881, 0, 0, 1, 1, 1,
0.1078561, 1.048671, -1.760618, 1, 0, 0, 1, 1,
0.1171482, 1.206321, -0.2105581, 1, 0, 0, 1, 1,
0.1268006, -0.07219273, 1.695122, 1, 0, 0, 1, 1,
0.1326545, 0.3418444, -0.402777, 1, 0, 0, 1, 1,
0.136027, -0.09012984, 1.952057, 1, 0, 0, 1, 1,
0.1450724, -0.370943, 2.443851, 0, 0, 0, 1, 1,
0.1465825, -1.421041, 3.137033, 0, 0, 0, 1, 1,
0.147489, -0.8932263, 2.125134, 0, 0, 0, 1, 1,
0.1476005, 1.221267, 0.9058417, 0, 0, 0, 1, 1,
0.1481473, -0.5196775, 2.067078, 0, 0, 0, 1, 1,
0.1546398, -0.8019068, 3.179521, 0, 0, 0, 1, 1,
0.155047, -1.70035, 3.008578, 0, 0, 0, 1, 1,
0.1570454, 0.3676189, 0.1495091, 1, 1, 1, 1, 1,
0.1571901, -0.4629199, 1.838405, 1, 1, 1, 1, 1,
0.1589221, -0.4317473, 2.115178, 1, 1, 1, 1, 1,
0.1598382, -0.1165282, 1.798395, 1, 1, 1, 1, 1,
0.165759, -0.3465245, 2.715244, 1, 1, 1, 1, 1,
0.1687178, 1.183394, 0.5311313, 1, 1, 1, 1, 1,
0.1710715, 0.2866273, 1.966447, 1, 1, 1, 1, 1,
0.1713033, 0.8041453, 0.8221397, 1, 1, 1, 1, 1,
0.1825581, 0.7308896, 0.1109324, 1, 1, 1, 1, 1,
0.1852995, 0.70627, 0.3199022, 1, 1, 1, 1, 1,
0.1891058, 0.5693153, 2.375442, 1, 1, 1, 1, 1,
0.1896125, -1.133149, 2.588537, 1, 1, 1, 1, 1,
0.1927665, 0.8589233, -0.4625621, 1, 1, 1, 1, 1,
0.1937059, -0.5668451, 1.230096, 1, 1, 1, 1, 1,
0.1965385, -0.7900967, 2.595614, 1, 1, 1, 1, 1,
0.1982849, 0.4086109, 1.815844, 0, 0, 1, 1, 1,
0.1992124, -0.4198318, 3.348855, 1, 0, 0, 1, 1,
0.2011762, 0.4435088, 0.6147097, 1, 0, 0, 1, 1,
0.2016016, -2.328156, 3.232202, 1, 0, 0, 1, 1,
0.2017377, -0.4719736, 3.540843, 1, 0, 0, 1, 1,
0.2020385, -0.3113333, 3.312531, 1, 0, 0, 1, 1,
0.2030363, 2.104251, 0.003899313, 0, 0, 0, 1, 1,
0.2070833, -0.6327153, 4.079886, 0, 0, 0, 1, 1,
0.2095374, 1.172005, 0.1800239, 0, 0, 0, 1, 1,
0.2101769, 1.362128, -1.10399, 0, 0, 0, 1, 1,
0.2108017, -1.540266, 3.247307, 0, 0, 0, 1, 1,
0.2110434, -0.5002054, 1.543865, 0, 0, 0, 1, 1,
0.2133965, 1.374947, 0.03944036, 0, 0, 0, 1, 1,
0.2168816, 2.389186, 1.251099, 1, 1, 1, 1, 1,
0.2185784, -0.2763151, 1.52495, 1, 1, 1, 1, 1,
0.2226387, 0.3399229, 0.7238276, 1, 1, 1, 1, 1,
0.223508, 0.3364146, 1.896385, 1, 1, 1, 1, 1,
0.2257298, -0.5871592, 1.534002, 1, 1, 1, 1, 1,
0.2267587, 0.9665701, -2.062811, 1, 1, 1, 1, 1,
0.2363637, -1.502786, 3.246373, 1, 1, 1, 1, 1,
0.237571, 0.9554837, 2.489202, 1, 1, 1, 1, 1,
0.2398574, -0.9222989, 2.607242, 1, 1, 1, 1, 1,
0.2398793, -1.022324, 3.256243, 1, 1, 1, 1, 1,
0.2460994, -1.778379, 3.278376, 1, 1, 1, 1, 1,
0.2485738, 0.5324063, 1.267361, 1, 1, 1, 1, 1,
0.249711, 0.2109555, 0.7516685, 1, 1, 1, 1, 1,
0.2519253, -1.561553, 3.118058, 1, 1, 1, 1, 1,
0.2537093, -0.4888457, 2.871935, 1, 1, 1, 1, 1,
0.2553074, -0.2940005, 2.325327, 0, 0, 1, 1, 1,
0.2567345, 1.217715, -0.7525464, 1, 0, 0, 1, 1,
0.2601802, 1.874879, -0.4033069, 1, 0, 0, 1, 1,
0.2693051, -0.6711953, 2.824697, 1, 0, 0, 1, 1,
0.2697095, -0.1885485, 1.041025, 1, 0, 0, 1, 1,
0.27668, 1.497752, 0.6764432, 1, 0, 0, 1, 1,
0.2777601, 0.6391484, -0.04576017, 0, 0, 0, 1, 1,
0.2829946, 0.7690929, 0.8244299, 0, 0, 0, 1, 1,
0.2865835, -0.4026288, 1.974614, 0, 0, 0, 1, 1,
0.2866458, -0.3420638, 0.9520903, 0, 0, 0, 1, 1,
0.2889635, 0.1994771, 0.5750377, 0, 0, 0, 1, 1,
0.2895269, -0.4123385, 2.333246, 0, 0, 0, 1, 1,
0.2902108, 0.8821397, -0.4237098, 0, 0, 0, 1, 1,
0.2911744, -2.113546, 1.465907, 1, 1, 1, 1, 1,
0.2916779, -0.5194318, 1.070498, 1, 1, 1, 1, 1,
0.2943262, 0.4851027, 0.9125776, 1, 1, 1, 1, 1,
0.29441, 1.267544, -0.7907641, 1, 1, 1, 1, 1,
0.2948687, -1.246758, 2.574913, 1, 1, 1, 1, 1,
0.3032356, -1.028612, 3.420218, 1, 1, 1, 1, 1,
0.3040006, -0.241025, 2.317683, 1, 1, 1, 1, 1,
0.3099672, 1.243428, 1.203802, 1, 1, 1, 1, 1,
0.3100981, -0.3831657, 3.09488, 1, 1, 1, 1, 1,
0.3179832, 1.327597, 0.5572526, 1, 1, 1, 1, 1,
0.3189545, 1.209386, 0.5946512, 1, 1, 1, 1, 1,
0.3228681, -1.08898, 5.346656, 1, 1, 1, 1, 1,
0.3268939, -0.4754299, 3.930376, 1, 1, 1, 1, 1,
0.3273087, -2.304291, 2.815551, 1, 1, 1, 1, 1,
0.3274677, -0.07743344, 1.728183, 1, 1, 1, 1, 1,
0.3284127, 0.1008746, 2.527744, 0, 0, 1, 1, 1,
0.3290845, 1.415374, -0.01398113, 1, 0, 0, 1, 1,
0.3313397, 1.453068, -1.901844, 1, 0, 0, 1, 1,
0.3322995, 0.8681225, -0.03578594, 1, 0, 0, 1, 1,
0.333434, -1.030512, 3.194129, 1, 0, 0, 1, 1,
0.3350042, 0.08677494, -1.374224, 1, 0, 0, 1, 1,
0.3363287, 0.9643366, -0.3077157, 0, 0, 0, 1, 1,
0.3394457, -0.4862986, 0.8874928, 0, 0, 0, 1, 1,
0.3431641, 0.4140876, -0.1805305, 0, 0, 0, 1, 1,
0.3433348, 0.5160378, -1.083328, 0, 0, 0, 1, 1,
0.3438003, -1.394189, 1.293892, 0, 0, 0, 1, 1,
0.3522307, 0.4408992, 0.5702, 0, 0, 0, 1, 1,
0.3560279, -0.2879841, 3.955145, 0, 0, 0, 1, 1,
0.3586755, -0.5994734, 2.270174, 1, 1, 1, 1, 1,
0.360066, -0.7793136, 1.572376, 1, 1, 1, 1, 1,
0.3646383, 1.18816, 1.71665, 1, 1, 1, 1, 1,
0.3647285, -1.035043, 2.110623, 1, 1, 1, 1, 1,
0.3675615, 1.281936, 0.5099709, 1, 1, 1, 1, 1,
0.3722204, 0.7344155, 0.1110492, 1, 1, 1, 1, 1,
0.3753631, 0.6920323, 0.6304793, 1, 1, 1, 1, 1,
0.3771459, 2.066745, -0.3611855, 1, 1, 1, 1, 1,
0.3795286, -1.974891, 3.097013, 1, 1, 1, 1, 1,
0.3852902, 1.03432, 1.097099, 1, 1, 1, 1, 1,
0.3859245, 0.971233, 0.2635028, 1, 1, 1, 1, 1,
0.3897926, 0.04511466, 0.5553706, 1, 1, 1, 1, 1,
0.3951805, 0.4162258, 0.6575156, 1, 1, 1, 1, 1,
0.3986427, -0.277254, 2.533674, 1, 1, 1, 1, 1,
0.407559, -0.5249254, 1.735045, 1, 1, 1, 1, 1,
0.4091635, 2.164498, 1.120431, 0, 0, 1, 1, 1,
0.4092246, 0.3131346, 0.7750728, 1, 0, 0, 1, 1,
0.4136075, 0.4575155, 0.9008426, 1, 0, 0, 1, 1,
0.4140978, -1.381899, 2.19681, 1, 0, 0, 1, 1,
0.4194225, -1.889208, 3.205142, 1, 0, 0, 1, 1,
0.4208478, -0.9231194, 2.369364, 1, 0, 0, 1, 1,
0.4217364, 1.183453, 1.928625, 0, 0, 0, 1, 1,
0.4281002, -0.451257, 1.600917, 0, 0, 0, 1, 1,
0.4284186, 1.192147, 0.5375796, 0, 0, 0, 1, 1,
0.4285531, 0.14557, 1.076295, 0, 0, 0, 1, 1,
0.432484, -1.066041, 3.04903, 0, 0, 0, 1, 1,
0.4325447, 0.7224936, -0.6110712, 0, 0, 0, 1, 1,
0.4333246, 0.2655697, 0.5132525, 0, 0, 0, 1, 1,
0.4349162, 0.7937338, -0.6131868, 1, 1, 1, 1, 1,
0.4391208, -0.6920733, 3.237062, 1, 1, 1, 1, 1,
0.4414319, -0.7349193, 3.428179, 1, 1, 1, 1, 1,
0.4451331, -0.05553167, 0.4700466, 1, 1, 1, 1, 1,
0.4457726, -1.753776, 1.945852, 1, 1, 1, 1, 1,
0.4494749, 0.7699999, 0.3923845, 1, 1, 1, 1, 1,
0.4507671, -0.05496204, 0.3387458, 1, 1, 1, 1, 1,
0.4511516, -0.5764077, 3.562239, 1, 1, 1, 1, 1,
0.4545972, -0.5049584, 1.984141, 1, 1, 1, 1, 1,
0.4547619, 0.8588013, -1.078009, 1, 1, 1, 1, 1,
0.4592406, 0.4328473, 2.742002, 1, 1, 1, 1, 1,
0.463048, -0.8456889, 1.446709, 1, 1, 1, 1, 1,
0.4631784, 0.2293972, 1.237925, 1, 1, 1, 1, 1,
0.4708145, 1.072991, 1.726355, 1, 1, 1, 1, 1,
0.4735589, -1.879872, 3.581004, 1, 1, 1, 1, 1,
0.4782379, -0.2399245, 2.040931, 0, 0, 1, 1, 1,
0.4798685, -0.475243, 3.162036, 1, 0, 0, 1, 1,
0.4874443, -1.24424, 2.335845, 1, 0, 0, 1, 1,
0.4877419, 1.011736, 1.626166, 1, 0, 0, 1, 1,
0.4969376, -1.490551, 3.858112, 1, 0, 0, 1, 1,
0.4978245, -1.700069, 3.604375, 1, 0, 0, 1, 1,
0.5015223, -0.1537946, 0.9175408, 0, 0, 0, 1, 1,
0.5031601, -3.316691, 2.067319, 0, 0, 0, 1, 1,
0.5084038, 2.083297, 1.523155, 0, 0, 0, 1, 1,
0.5088956, -0.9232405, 2.564758, 0, 0, 0, 1, 1,
0.5119977, -0.4522568, 2.800001, 0, 0, 0, 1, 1,
0.5126414, -0.3490578, 1.907157, 0, 0, 0, 1, 1,
0.5141326, 2.208044, 1.37836, 0, 0, 0, 1, 1,
0.519368, 0.8763291, 2.057989, 1, 1, 1, 1, 1,
0.5194302, 1.021773, -0.7983028, 1, 1, 1, 1, 1,
0.5227816, -0.2204674, 2.577679, 1, 1, 1, 1, 1,
0.5240011, -0.789467, 3.851393, 1, 1, 1, 1, 1,
0.5274411, 0.6495638, 0.1334874, 1, 1, 1, 1, 1,
0.5283974, -0.6070042, 1.393409, 1, 1, 1, 1, 1,
0.5289997, 0.5981899, 0.4965617, 1, 1, 1, 1, 1,
0.529411, 1.23011, -0.2779686, 1, 1, 1, 1, 1,
0.5346906, 1.797471, 0.4321892, 1, 1, 1, 1, 1,
0.545684, -0.4786712, 2.6098, 1, 1, 1, 1, 1,
0.5469717, 0.04210043, 1.420684, 1, 1, 1, 1, 1,
0.5472975, -0.4582553, 3.051762, 1, 1, 1, 1, 1,
0.5588038, -1.782951, 2.557305, 1, 1, 1, 1, 1,
0.5629332, 0.1079979, 0.9429624, 1, 1, 1, 1, 1,
0.5661928, 1.489069, 1.649931, 1, 1, 1, 1, 1,
0.5663195, 1.303276, 0.7866172, 0, 0, 1, 1, 1,
0.5671013, 1.784622, -0.3612227, 1, 0, 0, 1, 1,
0.5673644, -0.6272403, 2.844786, 1, 0, 0, 1, 1,
0.5750859, -0.1193615, 2.315264, 1, 0, 0, 1, 1,
0.5796526, 0.6269693, 1.415006, 1, 0, 0, 1, 1,
0.5832163, -0.605501, 1.799143, 1, 0, 0, 1, 1,
0.5884095, 1.586022, 0.1878057, 0, 0, 0, 1, 1,
0.5887338, -1.461691, 0.7663318, 0, 0, 0, 1, 1,
0.5901105, 0.01265945, 0.2929264, 0, 0, 0, 1, 1,
0.5924731, -1.690549, 0.3343365, 0, 0, 0, 1, 1,
0.5988946, 0.8524387, 0.8518311, 0, 0, 0, 1, 1,
0.6063207, 1.502724, 0.5324596, 0, 0, 0, 1, 1,
0.6076571, -0.8317296, 1.135247, 0, 0, 0, 1, 1,
0.6100447, 0.08792206, 2.292715, 1, 1, 1, 1, 1,
0.6106345, 0.5558894, 1.884507, 1, 1, 1, 1, 1,
0.6124133, -0.003508886, 2.178605, 1, 1, 1, 1, 1,
0.6142183, 2.432872, 0.3360801, 1, 1, 1, 1, 1,
0.6166053, -0.2823406, 0.1721167, 1, 1, 1, 1, 1,
0.6205971, 0.3227743, 1.88018, 1, 1, 1, 1, 1,
0.6241698, -1.323282, 3.820512, 1, 1, 1, 1, 1,
0.6248838, 0.6402607, 0.9152724, 1, 1, 1, 1, 1,
0.6346649, 0.1681136, 1.874127, 1, 1, 1, 1, 1,
0.6397448, -1.59874, 0.324663, 1, 1, 1, 1, 1,
0.6436915, -1.530545, 2.68686, 1, 1, 1, 1, 1,
0.6444619, -0.6666321, 2.06608, 1, 1, 1, 1, 1,
0.6489406, -1.117477, 3.036249, 1, 1, 1, 1, 1,
0.651557, -0.2406969, 2.025751, 1, 1, 1, 1, 1,
0.6571695, -0.06173868, 3.894702, 1, 1, 1, 1, 1,
0.6609035, -0.5504457, 1.83358, 0, 0, 1, 1, 1,
0.6675341, -0.1821798, 3.366669, 1, 0, 0, 1, 1,
0.6810275, 0.4353756, 1.625002, 1, 0, 0, 1, 1,
0.6830364, -0.05934823, 2.199228, 1, 0, 0, 1, 1,
0.684809, 0.211909, 0.9851502, 1, 0, 0, 1, 1,
0.6856011, -1.296298, 1.861395, 1, 0, 0, 1, 1,
0.6940446, 1.178618, -2.426955, 0, 0, 0, 1, 1,
0.6955758, 0.03134654, 0.4030982, 0, 0, 0, 1, 1,
0.7014277, 1.628042, 1.002664, 0, 0, 0, 1, 1,
0.7015163, 1.124408, 0.5798807, 0, 0, 0, 1, 1,
0.7030386, 0.9922261, 1.403298, 0, 0, 0, 1, 1,
0.7051695, -0.1948487, 1.101125, 0, 0, 0, 1, 1,
0.7052351, 0.5358631, 0.611534, 0, 0, 0, 1, 1,
0.7121078, 0.8597615, 2.020972, 1, 1, 1, 1, 1,
0.714127, 0.5377699, 1.152482, 1, 1, 1, 1, 1,
0.7173102, 0.3389404, 0.2604883, 1, 1, 1, 1, 1,
0.7194268, -0.9731938, 1.200596, 1, 1, 1, 1, 1,
0.7252823, -1.203012, 2.053128, 1, 1, 1, 1, 1,
0.7254924, 1.327434, -1.534765, 1, 1, 1, 1, 1,
0.729645, 1.150959, 0.6284308, 1, 1, 1, 1, 1,
0.7334329, -1.098982, 2.503252, 1, 1, 1, 1, 1,
0.7397364, 1.265992, 0.5282549, 1, 1, 1, 1, 1,
0.7420673, 0.2618485, 2.807601, 1, 1, 1, 1, 1,
0.7470787, -1.112072, 3.756855, 1, 1, 1, 1, 1,
0.7523862, -0.07915129, 2.642781, 1, 1, 1, 1, 1,
0.7549199, -1.111073, 2.803904, 1, 1, 1, 1, 1,
0.7577707, 1.309193, 1.311016, 1, 1, 1, 1, 1,
0.759281, -0.8907428, 2.856078, 1, 1, 1, 1, 1,
0.7647899, 0.5671105, 0.3028511, 0, 0, 1, 1, 1,
0.7680586, 0.8928729, 0.4874854, 1, 0, 0, 1, 1,
0.7800932, 0.4917032, 2.152382, 1, 0, 0, 1, 1,
0.7820908, 1.422932, -0.2269543, 1, 0, 0, 1, 1,
0.7837048, 0.1619461, -0.2190246, 1, 0, 0, 1, 1,
0.7838721, 0.2662897, 0.9127065, 1, 0, 0, 1, 1,
0.7847918, 2.13479, -0.001232157, 0, 0, 0, 1, 1,
0.7913622, -0.1493902, 1.750234, 0, 0, 0, 1, 1,
0.7929872, -0.1075384, 1.174967, 0, 0, 0, 1, 1,
0.7935627, 0.1100748, 2.643322, 0, 0, 0, 1, 1,
0.7961665, 0.4458402, 1.485504, 0, 0, 0, 1, 1,
0.7995458, 0.5735084, -0.1534126, 0, 0, 0, 1, 1,
0.8020231, -0.8562599, 1.607334, 0, 0, 0, 1, 1,
0.8042678, 1.105258, 0.104086, 1, 1, 1, 1, 1,
0.8065425, -0.2237806, 1.723899, 1, 1, 1, 1, 1,
0.8070513, -0.05448786, 1.038642, 1, 1, 1, 1, 1,
0.8076671, 0.589361, 2.176569, 1, 1, 1, 1, 1,
0.81971, -0.3714498, 1.739353, 1, 1, 1, 1, 1,
0.8258692, -2.00923, 3.723294, 1, 1, 1, 1, 1,
0.8282458, -0.407485, 3.017951, 1, 1, 1, 1, 1,
0.829286, 0.01009647, 1.079988, 1, 1, 1, 1, 1,
0.8317805, 0.04139752, 1.49096, 1, 1, 1, 1, 1,
0.8336683, -0.203952, 2.0375, 1, 1, 1, 1, 1,
0.8336695, -0.658269, 1.983997, 1, 1, 1, 1, 1,
0.836443, -1.045097, 2.600772, 1, 1, 1, 1, 1,
0.838899, 1.154657, 2.564603, 1, 1, 1, 1, 1,
0.8440286, -0.05214798, 2.644144, 1, 1, 1, 1, 1,
0.8458933, -0.5592968, 2.596946, 1, 1, 1, 1, 1,
0.850477, 1.007379, 2.056972, 0, 0, 1, 1, 1,
0.8520698, 0.5750067, 1.007247, 1, 0, 0, 1, 1,
0.8621889, 0.9748048, 1.39285, 1, 0, 0, 1, 1,
0.8641158, -1.56674, 4.562308, 1, 0, 0, 1, 1,
0.8655389, 2.051423, 1.849389, 1, 0, 0, 1, 1,
0.8669657, 1.070181, -0.136626, 1, 0, 0, 1, 1,
0.8739017, -0.5277593, 1.379077, 0, 0, 0, 1, 1,
0.8808236, -0.2853833, 1.630881, 0, 0, 0, 1, 1,
0.8809111, -2.238468, 2.248574, 0, 0, 0, 1, 1,
0.8888745, 0.1705006, 2.595682, 0, 0, 0, 1, 1,
0.8978192, -0.735613, 3.018455, 0, 0, 0, 1, 1,
0.8997011, 1.401544, -0.4144833, 0, 0, 0, 1, 1,
0.9002713, -1.238821, 2.719999, 0, 0, 0, 1, 1,
0.9057049, 0.4848886, -1.878755, 1, 1, 1, 1, 1,
0.9161513, -0.03508288, 0.6436465, 1, 1, 1, 1, 1,
0.9213582, 0.3712438, 0.32461, 1, 1, 1, 1, 1,
0.9283209, -1.183287, 1.27209, 1, 1, 1, 1, 1,
0.9313412, -0.02107768, 0.7746933, 1, 1, 1, 1, 1,
0.9334816, -1.050233, 3.410776, 1, 1, 1, 1, 1,
0.9336361, 0.751738, 1.160914, 1, 1, 1, 1, 1,
0.939639, -0.642269, 1.795143, 1, 1, 1, 1, 1,
0.9406942, -0.4083152, 2.540932, 1, 1, 1, 1, 1,
0.9461854, 0.522892, 1.686197, 1, 1, 1, 1, 1,
0.9509634, 0.8427477, 1.634481, 1, 1, 1, 1, 1,
0.952468, 0.02459902, 0.3502232, 1, 1, 1, 1, 1,
0.9529989, 1.058443, 1.799564, 1, 1, 1, 1, 1,
0.9609498, 0.3677324, 1.239322, 1, 1, 1, 1, 1,
0.9613349, 1.095602, 0.7171677, 1, 1, 1, 1, 1,
0.9640481, 1.510327, 1.440638, 0, 0, 1, 1, 1,
0.9681315, 0.6757441, 0.4751154, 1, 0, 0, 1, 1,
0.9703242, -0.4114315, 2.074453, 1, 0, 0, 1, 1,
0.9718683, 0.5449042, 1.866376, 1, 0, 0, 1, 1,
0.9719306, -0.7173753, 0.5173901, 1, 0, 0, 1, 1,
0.9750077, 0.05974172, 2.364374, 1, 0, 0, 1, 1,
0.9782087, -1.232067, 3.018899, 0, 0, 0, 1, 1,
0.9894856, 0.714645, -0.4850731, 0, 0, 0, 1, 1,
0.9982818, -1.969246, 2.001479, 0, 0, 0, 1, 1,
0.9982949, 0.3268068, 0.4062266, 0, 0, 0, 1, 1,
1.012903, 1.062125, 1.818505, 0, 0, 0, 1, 1,
1.01773, 0.932318, 0.5446627, 0, 0, 0, 1, 1,
1.01813, 0.6384528, 0.6161872, 0, 0, 0, 1, 1,
1.020724, 0.5452657, 1.869956, 1, 1, 1, 1, 1,
1.030983, 0.2314396, 1.206655, 1, 1, 1, 1, 1,
1.032771, -1.320051, 2.514081, 1, 1, 1, 1, 1,
1.033466, -1.504054, 3.369885, 1, 1, 1, 1, 1,
1.037136, -1.768324, 1.514647, 1, 1, 1, 1, 1,
1.041487, -0.2611428, 1.254146, 1, 1, 1, 1, 1,
1.043826, -0.1320225, 3.329762, 1, 1, 1, 1, 1,
1.04547, 1.390335, 1.907403, 1, 1, 1, 1, 1,
1.048633, -0.9726211, 0.9514248, 1, 1, 1, 1, 1,
1.050182, 0.3582278, 1.913086, 1, 1, 1, 1, 1,
1.055296, -1.363173, 2.084798, 1, 1, 1, 1, 1,
1.058087, 0.5820144, 1.198717, 1, 1, 1, 1, 1,
1.058113, -0.06097851, 2.208919, 1, 1, 1, 1, 1,
1.066783, 0.02648787, 1.162214, 1, 1, 1, 1, 1,
1.069784, -0.2484983, 3.593982, 1, 1, 1, 1, 1,
1.074502, 1.192284, 0.07161073, 0, 0, 1, 1, 1,
1.08974, 1.017403, -0.646309, 1, 0, 0, 1, 1,
1.093362, 0.8169248, 0.4180821, 1, 0, 0, 1, 1,
1.09963, 0.6772313, 0.6547827, 1, 0, 0, 1, 1,
1.104128, -2.52371, 2.437189, 1, 0, 0, 1, 1,
1.10639, -0.8781742, 2.013105, 1, 0, 0, 1, 1,
1.124719, -1.654876, 1.818539, 0, 0, 0, 1, 1,
1.128874, 1.598049, 2.303708, 0, 0, 0, 1, 1,
1.131079, 0.5154245, -0.4975363, 0, 0, 0, 1, 1,
1.139424, -0.899745, 1.690572, 0, 0, 0, 1, 1,
1.14075, 0.2170761, 0.7229605, 0, 0, 0, 1, 1,
1.142902, 0.2324816, 0.8964331, 0, 0, 0, 1, 1,
1.151262, 0.7745292, 0.6810016, 0, 0, 0, 1, 1,
1.154199, 0.9305074, 0.8507211, 1, 1, 1, 1, 1,
1.160788, -1.91249, 1.513356, 1, 1, 1, 1, 1,
1.16564, -1.226286, 1.943742, 1, 1, 1, 1, 1,
1.168368, 0.217723, -0.007853894, 1, 1, 1, 1, 1,
1.170054, 1.347274, 1.22354, 1, 1, 1, 1, 1,
1.171471, 0.8132696, 0.3053744, 1, 1, 1, 1, 1,
1.173778, -1.024165, 2.385376, 1, 1, 1, 1, 1,
1.176685, 0.3753043, -0.01337895, 1, 1, 1, 1, 1,
1.18154, -0.8117515, 2.897014, 1, 1, 1, 1, 1,
1.182452, -0.4050044, 2.095545, 1, 1, 1, 1, 1,
1.195767, -1.553628, 4.920768, 1, 1, 1, 1, 1,
1.196114, 0.06287834, 3.918521, 1, 1, 1, 1, 1,
1.199802, 0.3946643, 0.8737675, 1, 1, 1, 1, 1,
1.206944, 0.1812524, 2.103581, 1, 1, 1, 1, 1,
1.207509, 0.1183815, 2.680641, 1, 1, 1, 1, 1,
1.210865, 1.548909, -1.599097, 0, 0, 1, 1, 1,
1.211453, 2.008663, -0.2309544, 1, 0, 0, 1, 1,
1.230904, 0.08436501, 2.347292, 1, 0, 0, 1, 1,
1.235468, -0.5387221, 0.02558395, 1, 0, 0, 1, 1,
1.237348, -0.08809838, -0.07875529, 1, 0, 0, 1, 1,
1.241548, 0.5281816, 1.428121, 1, 0, 0, 1, 1,
1.241717, 1.551218, 1.364979, 0, 0, 0, 1, 1,
1.243241, -0.1272675, 1.493038, 0, 0, 0, 1, 1,
1.2483, 1.152265, -0.515527, 0, 0, 0, 1, 1,
1.250933, 1.191053, 0.08772931, 0, 0, 0, 1, 1,
1.257107, -0.4337301, 2.85146, 0, 0, 0, 1, 1,
1.264271, 1.386832, -0.1743855, 0, 0, 0, 1, 1,
1.26903, -0.467308, 1.663045, 0, 0, 0, 1, 1,
1.288443, -0.2507652, 0.1920041, 1, 1, 1, 1, 1,
1.296364, -1.037446, 3.532707, 1, 1, 1, 1, 1,
1.315401, 1.43659, 1.917392, 1, 1, 1, 1, 1,
1.316319, -0.5109298, 0.6771749, 1, 1, 1, 1, 1,
1.320914, 0.7031041, 0.6262248, 1, 1, 1, 1, 1,
1.324479, -0.006246442, 1.14653, 1, 1, 1, 1, 1,
1.325716, -0.03200407, 1.658541, 1, 1, 1, 1, 1,
1.327918, -0.9887785, 1.674905, 1, 1, 1, 1, 1,
1.343252, -0.715072, 2.772804, 1, 1, 1, 1, 1,
1.350062, -1.445077, 2.182316, 1, 1, 1, 1, 1,
1.377589, -0.2452209, 2.072189, 1, 1, 1, 1, 1,
1.381843, -2.423671, 1.605195, 1, 1, 1, 1, 1,
1.38443, -0.923981, 2.461291, 1, 1, 1, 1, 1,
1.386171, 0.8608475, 2.193413, 1, 1, 1, 1, 1,
1.389355, 0.1068871, 2.428384, 1, 1, 1, 1, 1,
1.390227, -0.02756628, 2.085727, 0, 0, 1, 1, 1,
1.390745, -0.1922822, -0.7200465, 1, 0, 0, 1, 1,
1.393904, -0.5341096, -0.6356094, 1, 0, 0, 1, 1,
1.415756, 1.053568, 1.654868, 1, 0, 0, 1, 1,
1.432588, 0.9209349, 1.108642, 1, 0, 0, 1, 1,
1.433729, -1.091765, 1.157325, 1, 0, 0, 1, 1,
1.43488, -1.184598, 2.560683, 0, 0, 0, 1, 1,
1.442145, 1.593823, -0.2001363, 0, 0, 0, 1, 1,
1.458403, 1.266784, 3.029583, 0, 0, 0, 1, 1,
1.459363, 0.4958614, 1.716111, 0, 0, 0, 1, 1,
1.462409, 0.308116, 2.112781, 0, 0, 0, 1, 1,
1.476102, -0.5050171, 3.339914, 0, 0, 0, 1, 1,
1.480699, -1.382246, 3.104933, 0, 0, 0, 1, 1,
1.483748, 0.9055055, 1.917012, 1, 1, 1, 1, 1,
1.501247, 0.4370258, 0.8651993, 1, 1, 1, 1, 1,
1.507773, -0.2601331, 1.374896, 1, 1, 1, 1, 1,
1.51701, -0.8975605, 1.896389, 1, 1, 1, 1, 1,
1.520846, 0.6115068, 1.112513, 1, 1, 1, 1, 1,
1.52794, 0.1954742, 0.8299455, 1, 1, 1, 1, 1,
1.542375, 1.051104, 0.7886818, 1, 1, 1, 1, 1,
1.54678, -1.24156, 2.846961, 1, 1, 1, 1, 1,
1.564076, -1.30919, 2.650406, 1, 1, 1, 1, 1,
1.575596, 0.3935432, 3.010554, 1, 1, 1, 1, 1,
1.587283, -0.2127665, 0.9261616, 1, 1, 1, 1, 1,
1.593391, -1.355859, 2.905927, 1, 1, 1, 1, 1,
1.609147, 0.0813098, 2.948255, 1, 1, 1, 1, 1,
1.62045, -0.1594174, 1.755881, 1, 1, 1, 1, 1,
1.632937, 0.6015431, 0.4538414, 1, 1, 1, 1, 1,
1.643769, -0.3143843, 2.608689, 0, 0, 1, 1, 1,
1.645692, -0.8117768, 2.319056, 1, 0, 0, 1, 1,
1.662523, 0.1531021, -0.7470886, 1, 0, 0, 1, 1,
1.672481, 1.88944, 1.85632, 1, 0, 0, 1, 1,
1.674744, -1.943929, 2.584318, 1, 0, 0, 1, 1,
1.678631, 0.12693, -1.044554, 1, 0, 0, 1, 1,
1.682513, 0.689898, 1.018282, 0, 0, 0, 1, 1,
1.690523, 1.522979, 0.9718744, 0, 0, 0, 1, 1,
1.697198, 0.6984206, 4.373259, 0, 0, 0, 1, 1,
1.706558, -0.7338764, 1.760214, 0, 0, 0, 1, 1,
1.714822, -1.032346, 2.286149, 0, 0, 0, 1, 1,
1.746452, 0.7384835, 0.3628519, 0, 0, 0, 1, 1,
1.749078, -1.084285, 1.239928, 0, 0, 0, 1, 1,
1.763289, -2.146339, 3.041393, 1, 1, 1, 1, 1,
1.764465, 0.5412924, 1.165884, 1, 1, 1, 1, 1,
1.77078, -1.376093, 2.470753, 1, 1, 1, 1, 1,
1.773701, -0.08301017, 3.572853, 1, 1, 1, 1, 1,
1.778962, 0.7176807, 1.854494, 1, 1, 1, 1, 1,
1.781616, 1.524306, 1.181324, 1, 1, 1, 1, 1,
1.781834, 0.8992232, 2.002285, 1, 1, 1, 1, 1,
1.783836, 1.175522, 0.4543812, 1, 1, 1, 1, 1,
1.788922, -1.482501, 3.584402, 1, 1, 1, 1, 1,
1.822466, -0.1490392, 2.613338, 1, 1, 1, 1, 1,
1.823529, -0.2426012, 1.747107, 1, 1, 1, 1, 1,
1.832534, -0.6261134, 1.668822, 1, 1, 1, 1, 1,
1.845194, 0.9111766, -0.1543489, 1, 1, 1, 1, 1,
1.847708, 0.3420336, 0.713439, 1, 1, 1, 1, 1,
1.855162, -0.7065761, 1.249519, 1, 1, 1, 1, 1,
1.882942, 0.1635903, 1.809688, 0, 0, 1, 1, 1,
1.88629, -0.1118178, 0.9602508, 1, 0, 0, 1, 1,
1.892628, -0.7378947, 1.839331, 1, 0, 0, 1, 1,
1.9434, -1.30085, 2.140831, 1, 0, 0, 1, 1,
1.974557, -0.96354, 2.566694, 1, 0, 0, 1, 1,
1.980798, 0.5590706, 1.577572, 1, 0, 0, 1, 1,
2.001695, -0.1113459, 1.882452, 0, 0, 0, 1, 1,
2.00731, 0.5749146, 1.315661, 0, 0, 0, 1, 1,
2.008157, 0.444631, 2.326958, 0, 0, 0, 1, 1,
2.013635, 0.01723733, 2.777292, 0, 0, 0, 1, 1,
2.048189, 1.454114, 2.39939, 0, 0, 0, 1, 1,
2.087586, -1.871805, 1.204869, 0, 0, 0, 1, 1,
2.134271, 0.2961389, 1.013801, 0, 0, 0, 1, 1,
2.173292, -0.6098762, 1.149149, 1, 1, 1, 1, 1,
2.28057, -1.334128, 2.870845, 1, 1, 1, 1, 1,
2.296853, 0.9975682, 0.4723381, 1, 1, 1, 1, 1,
2.43422, 0.05894012, 1.789818, 1, 1, 1, 1, 1,
2.590632, -2.35145, 1.175507, 1, 1, 1, 1, 1,
2.600556, 0.6979818, 0.8031378, 1, 1, 1, 1, 1,
2.905619, 0.4013419, 0.5959604, 1, 1, 1, 1, 1
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
var radius = 9.446775;
var distance = 33.1814;
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
mvMatrix.translate( -0.05386519, -0.05104804, -0.2328377 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.1814);
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