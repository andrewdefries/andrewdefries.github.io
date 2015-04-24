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
-3.279947, -0.2543957, -2.747361, 1, 0, 0, 1,
-2.808428, -1.614215, -2.022922, 1, 0.007843138, 0, 1,
-2.79304, 0.1372174, -0.9439762, 1, 0.01176471, 0, 1,
-2.767689, -0.2693247, -2.577173, 1, 0.01960784, 0, 1,
-2.635706, 0.650788, -1.64816, 1, 0.02352941, 0, 1,
-2.392386, -0.989441, -1.870712, 1, 0.03137255, 0, 1,
-2.223124, 1.842447, -1.253176, 1, 0.03529412, 0, 1,
-2.204875, 0.243298, -1.546239, 1, 0.04313726, 0, 1,
-2.200499, 1.718809, 0.6110054, 1, 0.04705882, 0, 1,
-2.136345, 2.488735, -0.4442916, 1, 0.05490196, 0, 1,
-2.113203, 0.8130339, -1.417932, 1, 0.05882353, 0, 1,
-2.107325, 0.1929528, -0.9635742, 1, 0.06666667, 0, 1,
-2.099182, 0.8531187, -0.8190816, 1, 0.07058824, 0, 1,
-2.043386, -2.38366, -0.9886891, 1, 0.07843138, 0, 1,
-2.02462, -1.084652, -1.96994, 1, 0.08235294, 0, 1,
-2.017861, -0.2918206, -0.9211137, 1, 0.09019608, 0, 1,
-1.998139, -1.033663, -2.57669, 1, 0.09411765, 0, 1,
-1.995888, 0.799718, -1.133606, 1, 0.1019608, 0, 1,
-1.981734, -0.2777742, -1.737219, 1, 0.1098039, 0, 1,
-1.95954, -0.02671075, -1.262621, 1, 0.1137255, 0, 1,
-1.948124, 1.487329, -2.245703, 1, 0.1215686, 0, 1,
-1.945745, -1.140905, -2.637034, 1, 0.1254902, 0, 1,
-1.939207, -1.690593, -2.820597, 1, 0.1333333, 0, 1,
-1.935423, 1.158891, -0.6650705, 1, 0.1372549, 0, 1,
-1.920436, -1.759813, -3.200256, 1, 0.145098, 0, 1,
-1.91746, 0.3042576, -1.345425, 1, 0.1490196, 0, 1,
-1.890575, -0.1693491, 0.1545507, 1, 0.1568628, 0, 1,
-1.880708, -0.1521129, -0.7835621, 1, 0.1607843, 0, 1,
-1.877026, 0.5863218, -0.9959634, 1, 0.1686275, 0, 1,
-1.837619, -1.455626, -1.939283, 1, 0.172549, 0, 1,
-1.752733, -0.1991676, -2.451758, 1, 0.1803922, 0, 1,
-1.720946, -0.8944508, -1.749198, 1, 0.1843137, 0, 1,
-1.677128, -0.3374724, -1.844986, 1, 0.1921569, 0, 1,
-1.665682, -1.009885, -1.03366, 1, 0.1960784, 0, 1,
-1.663582, 1.137491, -1.847203, 1, 0.2039216, 0, 1,
-1.659325, -0.8910927, -0.7888116, 1, 0.2117647, 0, 1,
-1.649967, -0.1384507, -1.490269, 1, 0.2156863, 0, 1,
-1.646704, -0.8242236, -3.888509, 1, 0.2235294, 0, 1,
-1.643492, -0.6255497, -2.468033, 1, 0.227451, 0, 1,
-1.616818, -1.331085, -1.129693, 1, 0.2352941, 0, 1,
-1.586473, -0.7376209, -1.176727, 1, 0.2392157, 0, 1,
-1.578739, 0.1519623, -0.7081493, 1, 0.2470588, 0, 1,
-1.566944, 0.9477823, -0.7411819, 1, 0.2509804, 0, 1,
-1.560734, 0.5818151, -0.5015475, 1, 0.2588235, 0, 1,
-1.560526, -0.01787128, -2.201845, 1, 0.2627451, 0, 1,
-1.554917, -0.9746881, -2.857579, 1, 0.2705882, 0, 1,
-1.530175, -1.123509, -2.843071, 1, 0.2745098, 0, 1,
-1.521427, -0.3491948, -2.829321, 1, 0.282353, 0, 1,
-1.519889, -0.2172698, -2.066208, 1, 0.2862745, 0, 1,
-1.513923, 0.5428673, -1.003675, 1, 0.2941177, 0, 1,
-1.500576, -2.156057, -4.904363, 1, 0.3019608, 0, 1,
-1.495859, 0.06256863, -1.518115, 1, 0.3058824, 0, 1,
-1.494496, 0.8110994, -0.580546, 1, 0.3137255, 0, 1,
-1.487496, -0.9420423, -1.608334, 1, 0.3176471, 0, 1,
-1.485517, -0.9047678, -2.021837, 1, 0.3254902, 0, 1,
-1.472193, -1.678606, -1.834719, 1, 0.3294118, 0, 1,
-1.458909, 0.3084829, -1.820884, 1, 0.3372549, 0, 1,
-1.455611, -1.639214, -1.251393, 1, 0.3411765, 0, 1,
-1.452015, 0.1643467, -1.701163, 1, 0.3490196, 0, 1,
-1.45102, -0.08166222, -0.509883, 1, 0.3529412, 0, 1,
-1.449775, -0.1629761, -1.480279, 1, 0.3607843, 0, 1,
-1.443864, 0.4095888, 0.6877778, 1, 0.3647059, 0, 1,
-1.425724, -0.8679981, -3.117857, 1, 0.372549, 0, 1,
-1.424887, 0.6843954, 0.417753, 1, 0.3764706, 0, 1,
-1.424371, -0.3808905, -3.373743, 1, 0.3843137, 0, 1,
-1.420979, 0.2701212, -0.9108745, 1, 0.3882353, 0, 1,
-1.410231, -0.08318098, -1.593212, 1, 0.3960784, 0, 1,
-1.405896, -0.5839375, -4.794637, 1, 0.4039216, 0, 1,
-1.402957, -0.5530745, -0.8018358, 1, 0.4078431, 0, 1,
-1.383481, 1.009081, -0.9213424, 1, 0.4156863, 0, 1,
-1.380674, 0.3243608, -1.054705, 1, 0.4196078, 0, 1,
-1.374436, -0.8524777, -0.4758994, 1, 0.427451, 0, 1,
-1.374015, -1.021552, -0.02661898, 1, 0.4313726, 0, 1,
-1.372528, 1.115175, -0.5504599, 1, 0.4392157, 0, 1,
-1.365666, -0.09371348, -1.110597, 1, 0.4431373, 0, 1,
-1.359906, -0.7960144, -2.877135, 1, 0.4509804, 0, 1,
-1.359701, 1.009828, -0.5724693, 1, 0.454902, 0, 1,
-1.356352, 0.2894154, -1.329236, 1, 0.4627451, 0, 1,
-1.350571, 0.2640154, -1.71646, 1, 0.4666667, 0, 1,
-1.35051, -0.1875843, -0.8083155, 1, 0.4745098, 0, 1,
-1.348594, -0.5018095, -2.751386, 1, 0.4784314, 0, 1,
-1.348524, -0.3746946, -3.121938, 1, 0.4862745, 0, 1,
-1.347413, -0.4549067, -1.560194, 1, 0.4901961, 0, 1,
-1.339383, 2.90594, -1.046127, 1, 0.4980392, 0, 1,
-1.331648, -0.7831036, -2.297299, 1, 0.5058824, 0, 1,
-1.330755, -0.6140327, -1.838306, 1, 0.509804, 0, 1,
-1.323177, 1.566593, -1.566016, 1, 0.5176471, 0, 1,
-1.318951, -0.5266823, -2.703069, 1, 0.5215687, 0, 1,
-1.310987, 0.1132854, -2.052768, 1, 0.5294118, 0, 1,
-1.304331, 0.4283158, -0.3356007, 1, 0.5333334, 0, 1,
-1.2935, 1.48862, -0.8406335, 1, 0.5411765, 0, 1,
-1.288775, -0.3148631, -1.963158, 1, 0.5450981, 0, 1,
-1.283391, 2.243858, -0.2690755, 1, 0.5529412, 0, 1,
-1.282301, -1.023123, -1.711613, 1, 0.5568628, 0, 1,
-1.281019, 0.06228481, -2.163139, 1, 0.5647059, 0, 1,
-1.278191, -0.1230106, -1.66591, 1, 0.5686275, 0, 1,
-1.277642, 0.7153277, -0.6923921, 1, 0.5764706, 0, 1,
-1.273784, -0.531987, -2.544474, 1, 0.5803922, 0, 1,
-1.272728, -0.7248142, -1.124714, 1, 0.5882353, 0, 1,
-1.271406, -0.3413355, -1.502928, 1, 0.5921569, 0, 1,
-1.26955, 0.4673686, 1.648567, 1, 0.6, 0, 1,
-1.265951, -0.0596948, -1.702522, 1, 0.6078432, 0, 1,
-1.259831, -0.45634, -0.3574823, 1, 0.6117647, 0, 1,
-1.256079, 2.342213, -0.3809692, 1, 0.6196079, 0, 1,
-1.249562, 0.4646893, -0.6895705, 1, 0.6235294, 0, 1,
-1.245529, 0.4450343, 1.66019, 1, 0.6313726, 0, 1,
-1.24467, 0.8849381, -0.8116097, 1, 0.6352941, 0, 1,
-1.24068, -0.7115316, 0.4013591, 1, 0.6431373, 0, 1,
-1.234018, -0.3214517, -1.852793, 1, 0.6470588, 0, 1,
-1.2329, -0.587275, -1.863199, 1, 0.654902, 0, 1,
-1.227251, 1.583055, -1.022785, 1, 0.6588235, 0, 1,
-1.227134, 1.780533, 0.08584303, 1, 0.6666667, 0, 1,
-1.21746, 0.7491978, -2.029664, 1, 0.6705883, 0, 1,
-1.214543, 0.8610728, -1.638231, 1, 0.6784314, 0, 1,
-1.20631, 0.1714816, -1.497375, 1, 0.682353, 0, 1,
-1.205446, -0.04726141, -2.317929, 1, 0.6901961, 0, 1,
-1.19647, -1.719183, -2.354193, 1, 0.6941177, 0, 1,
-1.19593, -1.185229, -0.6580192, 1, 0.7019608, 0, 1,
-1.183777, -0.4133262, -1.352074, 1, 0.7098039, 0, 1,
-1.178953, 1.617401, -1.499551, 1, 0.7137255, 0, 1,
-1.17724, -0.1584721, -2.119083, 1, 0.7215686, 0, 1,
-1.169354, -0.1357192, -3.664433, 1, 0.7254902, 0, 1,
-1.166533, -0.2651895, -1.523835, 1, 0.7333333, 0, 1,
-1.158159, 0.7406871, -1.572613, 1, 0.7372549, 0, 1,
-1.154671, 0.7261608, -2.632102, 1, 0.7450981, 0, 1,
-1.152232, 1.101032, 1.00121, 1, 0.7490196, 0, 1,
-1.145083, -0.4179577, -2.135708, 1, 0.7568628, 0, 1,
-1.135886, 1.398815, -1.641899, 1, 0.7607843, 0, 1,
-1.132766, -1.553918, -2.976258, 1, 0.7686275, 0, 1,
-1.122304, -1.59343, -2.998818, 1, 0.772549, 0, 1,
-1.116872, 0.4884108, -0.07073982, 1, 0.7803922, 0, 1,
-1.111057, 2.4291, -1.539328, 1, 0.7843137, 0, 1,
-1.109553, -0.7609656, -1.13254, 1, 0.7921569, 0, 1,
-1.103959, 1.602108, 0.223805, 1, 0.7960784, 0, 1,
-1.091154, -1.687425, -1.246764, 1, 0.8039216, 0, 1,
-1.088251, -0.1777023, -1.665115, 1, 0.8117647, 0, 1,
-1.084003, -0.1353506, -3.263431, 1, 0.8156863, 0, 1,
-1.083238, 1.139439, -0.2639277, 1, 0.8235294, 0, 1,
-1.080942, 0.1386372, -0.7905723, 1, 0.827451, 0, 1,
-1.071596, 0.5860708, -2.192692, 1, 0.8352941, 0, 1,
-1.068694, -0.104569, -0.3155384, 1, 0.8392157, 0, 1,
-1.062524, 0.1795042, -0.1272727, 1, 0.8470588, 0, 1,
-1.061178, 1.264575, -1.986574, 1, 0.8509804, 0, 1,
-1.057257, 1.121631, -1.617681, 1, 0.8588235, 0, 1,
-1.056947, 1.157505, -1.397481, 1, 0.8627451, 0, 1,
-1.055842, 1.47941, -0.4379826, 1, 0.8705882, 0, 1,
-1.053421, -0.7448247, -3.667147, 1, 0.8745098, 0, 1,
-1.051985, 2.66055, 0.2105026, 1, 0.8823529, 0, 1,
-1.046063, 1.277288, -0.07597613, 1, 0.8862745, 0, 1,
-1.043978, -1.808405, -4.473143, 1, 0.8941177, 0, 1,
-1.043044, 0.9703504, -1.775754, 1, 0.8980392, 0, 1,
-1.041867, 1.467347, -2.241568, 1, 0.9058824, 0, 1,
-1.040816, -1.105509, -3.813903, 1, 0.9137255, 0, 1,
-1.040322, 0.6587872, -0.832396, 1, 0.9176471, 0, 1,
-1.036741, 1.01331, 1.13167, 1, 0.9254902, 0, 1,
-1.034548, -1.432228, -1.819894, 1, 0.9294118, 0, 1,
-1.029833, -0.01287528, -2.372454, 1, 0.9372549, 0, 1,
-1.028238, -0.4800214, -1.778799, 1, 0.9411765, 0, 1,
-1.024836, -0.7126191, -2.829731, 1, 0.9490196, 0, 1,
-1.024749, 0.2407663, -0.008286975, 1, 0.9529412, 0, 1,
-1.024341, 0.6732707, -2.725181, 1, 0.9607843, 0, 1,
-1.023756, 0.3584991, -1.973031, 1, 0.9647059, 0, 1,
-1.013829, -0.5948175, -2.164141, 1, 0.972549, 0, 1,
-1.007771, -0.7218533, -1.72205, 1, 0.9764706, 0, 1,
-1.003415, -0.1571688, 0.7947896, 1, 0.9843137, 0, 1,
-1.003287, -1.110993, -2.330024, 1, 0.9882353, 0, 1,
-1.002173, -2.682695, -2.805985, 1, 0.9960784, 0, 1,
-0.9992154, 0.6547948, -1.132619, 0.9960784, 1, 0, 1,
-0.9973809, 2.145972, -0.6872516, 0.9921569, 1, 0, 1,
-0.996515, -0.9687776, -1.166278, 0.9843137, 1, 0, 1,
-0.9898297, -0.2231114, -1.245254, 0.9803922, 1, 0, 1,
-0.9896942, -1.574666, -1.677539, 0.972549, 1, 0, 1,
-0.9852187, -2.459513, -2.246847, 0.9686275, 1, 0, 1,
-0.9787259, 1.558664, -1.188346, 0.9607843, 1, 0, 1,
-0.972837, -1.460586, -3.426028, 0.9568627, 1, 0, 1,
-0.971943, -0.1062648, -1.76663, 0.9490196, 1, 0, 1,
-0.9713846, -0.2126004, -1.240571, 0.945098, 1, 0, 1,
-0.970595, -0.6881555, -2.117742, 0.9372549, 1, 0, 1,
-0.9613656, -0.08374999, -1.307752, 0.9333333, 1, 0, 1,
-0.9568698, -2.383752, -2.781862, 0.9254902, 1, 0, 1,
-0.9531754, -0.2329741, -1.140973, 0.9215686, 1, 0, 1,
-0.9529474, -0.2144275, -1.392722, 0.9137255, 1, 0, 1,
-0.9326558, -1.019664, -1.76579, 0.9098039, 1, 0, 1,
-0.9321951, -1.475188, -2.902144, 0.9019608, 1, 0, 1,
-0.9246531, 0.8583732, 1.059649, 0.8941177, 1, 0, 1,
-0.9242288, -1.332777, -1.526003, 0.8901961, 1, 0, 1,
-0.9221614, 1.135154, -1.357778, 0.8823529, 1, 0, 1,
-0.9167103, -0.09985316, -3.350369, 0.8784314, 1, 0, 1,
-0.9018904, -1.054741, -3.024863, 0.8705882, 1, 0, 1,
-0.8989598, 0.07700679, 0.9280618, 0.8666667, 1, 0, 1,
-0.891008, -0.5310287, -3.147964, 0.8588235, 1, 0, 1,
-0.8896059, -1.238767, -1.278796, 0.854902, 1, 0, 1,
-0.8761408, 0.4697702, -0.8265137, 0.8470588, 1, 0, 1,
-0.8657791, -0.09982549, -1.943816, 0.8431373, 1, 0, 1,
-0.8603479, -1.205806, -3.267592, 0.8352941, 1, 0, 1,
-0.857899, -0.6879796, -1.622548, 0.8313726, 1, 0, 1,
-0.8552011, -0.04668202, -0.4205497, 0.8235294, 1, 0, 1,
-0.8543418, 0.6985832, -0.8837254, 0.8196079, 1, 0, 1,
-0.8530822, 1.96305, -0.6142226, 0.8117647, 1, 0, 1,
-0.8530006, -0.5184876, -1.26213, 0.8078431, 1, 0, 1,
-0.8526688, 0.4095872, -1.494985, 0.8, 1, 0, 1,
-0.8520383, -0.7326889, -3.30471, 0.7921569, 1, 0, 1,
-0.8520277, 1.190001, -1.220238, 0.7882353, 1, 0, 1,
-0.8515698, -2.01568, -4.187727, 0.7803922, 1, 0, 1,
-0.8508551, -0.9270118, -1.817636, 0.7764706, 1, 0, 1,
-0.833954, 0.8504989, -1.145823, 0.7686275, 1, 0, 1,
-0.8279661, 1.32642, -1.142085, 0.7647059, 1, 0, 1,
-0.823256, 0.5310229, -0.09787852, 0.7568628, 1, 0, 1,
-0.8151794, 1.00227, -0.4908393, 0.7529412, 1, 0, 1,
-0.8144235, 0.7298369, 0.1327372, 0.7450981, 1, 0, 1,
-0.8069739, 0.05442709, -0.5174161, 0.7411765, 1, 0, 1,
-0.8005904, 0.755908, -1.095914, 0.7333333, 1, 0, 1,
-0.7990673, 0.3259766, -1.103253, 0.7294118, 1, 0, 1,
-0.7986662, 0.803877, -0.5024875, 0.7215686, 1, 0, 1,
-0.7956124, 1.494888, 0.4689656, 0.7176471, 1, 0, 1,
-0.7929698, -1.042661, -5.462272, 0.7098039, 1, 0, 1,
-0.7904475, -0.02567971, -2.209545, 0.7058824, 1, 0, 1,
-0.7883937, 1.39231, -0.8882386, 0.6980392, 1, 0, 1,
-0.7751869, -1.726486, -1.135188, 0.6901961, 1, 0, 1,
-0.7729315, 0.08078676, -1.727443, 0.6862745, 1, 0, 1,
-0.7728058, 2.038171, 0.8956709, 0.6784314, 1, 0, 1,
-0.7705827, -1.189622, -2.587748, 0.6745098, 1, 0, 1,
-0.7640166, -1.192505, -2.29791, 0.6666667, 1, 0, 1,
-0.76065, 0.718848, -1.620689, 0.6627451, 1, 0, 1,
-0.7574821, -0.570332, -2.543739, 0.654902, 1, 0, 1,
-0.7533876, -0.5849527, -1.795279, 0.6509804, 1, 0, 1,
-0.7513799, -0.3910674, -3.064104, 0.6431373, 1, 0, 1,
-0.7497906, 0.508573, -0.1564209, 0.6392157, 1, 0, 1,
-0.7399263, -1.001396, -3.092896, 0.6313726, 1, 0, 1,
-0.7394719, 0.2621323, -0.8877373, 0.627451, 1, 0, 1,
-0.7339082, 0.2276179, -3.262267, 0.6196079, 1, 0, 1,
-0.7245924, 0.6506438, -0.4947784, 0.6156863, 1, 0, 1,
-0.7236738, -0.8354689, -1.301497, 0.6078432, 1, 0, 1,
-0.7184846, -0.4973471, -4.699491, 0.6039216, 1, 0, 1,
-0.7165889, -1.019389, -3.561413, 0.5960785, 1, 0, 1,
-0.712969, -0.7112671, -1.742437, 0.5882353, 1, 0, 1,
-0.7112603, 0.7491075, 0.01232927, 0.5843138, 1, 0, 1,
-0.7108239, 0.1616789, -2.632425, 0.5764706, 1, 0, 1,
-0.709712, 0.2086368, -0.9825252, 0.572549, 1, 0, 1,
-0.707767, -0.2578929, -0.9953796, 0.5647059, 1, 0, 1,
-0.7062367, -0.4962379, -1.964547, 0.5607843, 1, 0, 1,
-0.7047556, -0.3366557, -2.047006, 0.5529412, 1, 0, 1,
-0.7045721, -0.6575401, -4.095881, 0.5490196, 1, 0, 1,
-0.7038416, 0.839125, -0.6118702, 0.5411765, 1, 0, 1,
-0.7036576, -1.059052, -3.48331, 0.5372549, 1, 0, 1,
-0.7003585, 0.1846102, 0.1562833, 0.5294118, 1, 0, 1,
-0.7001327, 1.895087, -0.7292494, 0.5254902, 1, 0, 1,
-0.6954641, 0.1894196, 0.6568897, 0.5176471, 1, 0, 1,
-0.6910958, 1.114202, -1.342788, 0.5137255, 1, 0, 1,
-0.6869496, 0.9020187, 0.4837482, 0.5058824, 1, 0, 1,
-0.6860866, 0.5400093, -0.9858627, 0.5019608, 1, 0, 1,
-0.6712645, 2.112417, -0.5984774, 0.4941176, 1, 0, 1,
-0.6707484, -0.1966673, -2.297952, 0.4862745, 1, 0, 1,
-0.6689703, 1.769561, 0.9417977, 0.4823529, 1, 0, 1,
-0.6654769, 0.9167965, -1.233071, 0.4745098, 1, 0, 1,
-0.6631146, -0.8185583, -3.864302, 0.4705882, 1, 0, 1,
-0.6625754, -0.2866023, 0.399202, 0.4627451, 1, 0, 1,
-0.6603534, 1.376461, -0.9012215, 0.4588235, 1, 0, 1,
-0.6597252, 0.7188919, -0.9949263, 0.4509804, 1, 0, 1,
-0.6542544, -0.938897, -3.508536, 0.4470588, 1, 0, 1,
-0.6530877, -2.36549, -0.6197053, 0.4392157, 1, 0, 1,
-0.6501212, -0.4059195, -3.971549, 0.4352941, 1, 0, 1,
-0.6481597, -1.639818, -3.80559, 0.427451, 1, 0, 1,
-0.6471897, -1.294252, -3.598576, 0.4235294, 1, 0, 1,
-0.641394, 0.358919, -0.5682488, 0.4156863, 1, 0, 1,
-0.6314012, -0.7241976, -3.672848, 0.4117647, 1, 0, 1,
-0.6231472, -0.5919917, 0.5857782, 0.4039216, 1, 0, 1,
-0.6218358, 1.624914, -0.6472234, 0.3960784, 1, 0, 1,
-0.6172895, 0.03961899, 0.001093325, 0.3921569, 1, 0, 1,
-0.6134951, -0.1582804, -2.964472, 0.3843137, 1, 0, 1,
-0.6067132, 0.8778682, 0.5955526, 0.3803922, 1, 0, 1,
-0.6042093, -1.295717, -3.675292, 0.372549, 1, 0, 1,
-0.6041825, 0.8297538, -0.8976178, 0.3686275, 1, 0, 1,
-0.6036814, -0.5389804, -1.932994, 0.3607843, 1, 0, 1,
-0.6032541, -0.550133, -2.375442, 0.3568628, 1, 0, 1,
-0.6010619, -0.2613937, -1.957472, 0.3490196, 1, 0, 1,
-0.6001442, 0.8621728, -0.1607019, 0.345098, 1, 0, 1,
-0.5965576, -0.2661422, -1.428146, 0.3372549, 1, 0, 1,
-0.5909701, -0.6228677, -3.191882, 0.3333333, 1, 0, 1,
-0.5907602, -0.6812468, -0.3379006, 0.3254902, 1, 0, 1,
-0.5886663, -0.08597463, -1.538573, 0.3215686, 1, 0, 1,
-0.5840198, 0.4721552, -0.1445731, 0.3137255, 1, 0, 1,
-0.5833026, 0.7219354, -1.955084, 0.3098039, 1, 0, 1,
-0.5791103, -0.1442811, -1.840539, 0.3019608, 1, 0, 1,
-0.5788429, -2.022902, -2.625784, 0.2941177, 1, 0, 1,
-0.5779796, -0.1902841, -1.211355, 0.2901961, 1, 0, 1,
-0.5771582, -0.2238773, -3.371594, 0.282353, 1, 0, 1,
-0.5723327, 0.3022122, -0.996048, 0.2784314, 1, 0, 1,
-0.5654874, 2.108767, 0.6314434, 0.2705882, 1, 0, 1,
-0.5639709, -0.7868914, -1.995313, 0.2666667, 1, 0, 1,
-0.5540518, -0.008730522, -0.9360251, 0.2588235, 1, 0, 1,
-0.5537707, -0.2986205, -0.4179663, 0.254902, 1, 0, 1,
-0.5482883, -0.4332375, -2.146771, 0.2470588, 1, 0, 1,
-0.5452216, 0.6338417, -2.770594, 0.2431373, 1, 0, 1,
-0.5410746, 1.769574, 1.116085, 0.2352941, 1, 0, 1,
-0.5398899, 1.79329, -0.04496972, 0.2313726, 1, 0, 1,
-0.5339339, -1.761838, -3.52594, 0.2235294, 1, 0, 1,
-0.531591, -0.8926789, -0.5453333, 0.2196078, 1, 0, 1,
-0.5297113, 1.029269, -0.4820202, 0.2117647, 1, 0, 1,
-0.5295273, 1.595003, -1.312007, 0.2078431, 1, 0, 1,
-0.5277349, -0.4013432, -2.480071, 0.2, 1, 0, 1,
-0.5264515, 1.336818, 0.1066022, 0.1921569, 1, 0, 1,
-0.5253797, -0.5152009, -0.5484374, 0.1882353, 1, 0, 1,
-0.5160748, -1.082227, -3.027861, 0.1803922, 1, 0, 1,
-0.5132411, -1.263285, -1.307198, 0.1764706, 1, 0, 1,
-0.5131735, -0.7634792, -1.447156, 0.1686275, 1, 0, 1,
-0.5110981, -0.9328337, -3.285401, 0.1647059, 1, 0, 1,
-0.5089441, 0.5839418, -1.71896, 0.1568628, 1, 0, 1,
-0.5067593, 0.3264912, -1.852508, 0.1529412, 1, 0, 1,
-0.5065185, 0.9660652, -1.125528, 0.145098, 1, 0, 1,
-0.5058718, -0.2763728, -2.742756, 0.1411765, 1, 0, 1,
-0.5025523, 1.53042, -1.125178, 0.1333333, 1, 0, 1,
-0.4974693, -0.6680121, -1.939805, 0.1294118, 1, 0, 1,
-0.4949609, 1.800124, 0.2423947, 0.1215686, 1, 0, 1,
-0.4917399, -0.0004892897, -1.805659, 0.1176471, 1, 0, 1,
-0.4900027, 1.329024, -1.93472, 0.1098039, 1, 0, 1,
-0.4863127, 0.2361184, -1.431619, 0.1058824, 1, 0, 1,
-0.484245, 0.8092178, 0.2677041, 0.09803922, 1, 0, 1,
-0.4789786, -0.3458538, -3.109405, 0.09019608, 1, 0, 1,
-0.4787578, 0.6840233, 1.019397, 0.08627451, 1, 0, 1,
-0.4740418, -0.4338772, -2.751401, 0.07843138, 1, 0, 1,
-0.4730754, -0.5124805, -1.670482, 0.07450981, 1, 0, 1,
-0.47009, -0.2780473, -1.085016, 0.06666667, 1, 0, 1,
-0.4693539, 1.882221, -1.408196, 0.0627451, 1, 0, 1,
-0.4671531, -0.09862671, -2.193539, 0.05490196, 1, 0, 1,
-0.4649928, 0.1662769, -2.340236, 0.05098039, 1, 0, 1,
-0.4620519, 0.8915995, -1.069303, 0.04313726, 1, 0, 1,
-0.4612665, 2.237405, 1.602868, 0.03921569, 1, 0, 1,
-0.4607952, 0.9660274, -0.4253312, 0.03137255, 1, 0, 1,
-0.4575862, 0.9722334, -1.226288, 0.02745098, 1, 0, 1,
-0.4553576, -0.1283693, -3.762784, 0.01960784, 1, 0, 1,
-0.4505994, -0.7965566, -3.001174, 0.01568628, 1, 0, 1,
-0.4488958, -2.095377, -4.002431, 0.007843138, 1, 0, 1,
-0.4477994, -1.625742, -2.725465, 0.003921569, 1, 0, 1,
-0.4439324, -0.502101, -3.447827, 0, 1, 0.003921569, 1,
-0.4430753, 1.093543, -1.331504, 0, 1, 0.01176471, 1,
-0.4419975, 0.7779696, 0.5443152, 0, 1, 0.01568628, 1,
-0.4374984, 1.305988, -0.1121822, 0, 1, 0.02352941, 1,
-0.4347273, -2.647303, -3.41013, 0, 1, 0.02745098, 1,
-0.4344131, -0.1677248, -0.9551066, 0, 1, 0.03529412, 1,
-0.4302177, -0.6403619, -3.387706, 0, 1, 0.03921569, 1,
-0.4244097, -1.484966, -2.293335, 0, 1, 0.04705882, 1,
-0.421694, 0.2441214, 0.3025028, 0, 1, 0.05098039, 1,
-0.4192868, 3.045939, 1.676159, 0, 1, 0.05882353, 1,
-0.4185591, 1.413385, 0.2649959, 0, 1, 0.0627451, 1,
-0.4177067, -0.780759, -2.264052, 0, 1, 0.07058824, 1,
-0.4170845, 0.4300643, -2.153536, 0, 1, 0.07450981, 1,
-0.4165105, -0.5943964, -2.243021, 0, 1, 0.08235294, 1,
-0.4151697, 0.09482574, -1.019771, 0, 1, 0.08627451, 1,
-0.4095683, 0.293823, 0.192925, 0, 1, 0.09411765, 1,
-0.4068964, 1.994879, 0.5733873, 0, 1, 0.1019608, 1,
-0.4064435, 1.092574, -2.395701, 0, 1, 0.1058824, 1,
-0.4031437, -1.155221, -2.002698, 0, 1, 0.1137255, 1,
-0.4011444, 0.2110923, -2.359624, 0, 1, 0.1176471, 1,
-0.3988793, -1.65042, -4.062736, 0, 1, 0.1254902, 1,
-0.39868, -0.3171112, -1.624364, 0, 1, 0.1294118, 1,
-0.3966287, 0.4635771, -0.5081041, 0, 1, 0.1372549, 1,
-0.385225, 1.481793, -1.673084, 0, 1, 0.1411765, 1,
-0.3774873, 0.139391, -0.05510622, 0, 1, 0.1490196, 1,
-0.3760636, 1.076732, 1.282804, 0, 1, 0.1529412, 1,
-0.3755571, 0.02743646, -1.808904, 0, 1, 0.1607843, 1,
-0.3746943, 0.6614917, -1.434893, 0, 1, 0.1647059, 1,
-0.3679519, 0.007472274, -0.8066702, 0, 1, 0.172549, 1,
-0.3657061, -1.313544, -2.158557, 0, 1, 0.1764706, 1,
-0.3635386, -2.314841, -4.158553, 0, 1, 0.1843137, 1,
-0.360365, 0.3594021, -0.4609301, 0, 1, 0.1882353, 1,
-0.3592447, -1.174194, -2.134766, 0, 1, 0.1960784, 1,
-0.3591823, 0.8664803, 0.3530309, 0, 1, 0.2039216, 1,
-0.3590937, 2.533179, 1.760548, 0, 1, 0.2078431, 1,
-0.3590483, 1.158316, -1.047374, 0, 1, 0.2156863, 1,
-0.3533115, -0.8085142, -3.56158, 0, 1, 0.2196078, 1,
-0.3511229, 0.1740232, -0.893534, 0, 1, 0.227451, 1,
-0.3507245, -2.476992, -5.386392, 0, 1, 0.2313726, 1,
-0.3506615, -0.0407363, -1.832993, 0, 1, 0.2392157, 1,
-0.3498649, 1.285767, 1.248859, 0, 1, 0.2431373, 1,
-0.3477135, 0.645196, -1.413811, 0, 1, 0.2509804, 1,
-0.3462641, -0.4795431, -2.810303, 0, 1, 0.254902, 1,
-0.3460789, 0.005176946, -1.046021, 0, 1, 0.2627451, 1,
-0.3459141, 0.2961137, -0.7213261, 0, 1, 0.2666667, 1,
-0.3416467, -0.1283182, -1.665098, 0, 1, 0.2745098, 1,
-0.3380714, -1.715518, -3.144041, 0, 1, 0.2784314, 1,
-0.3357013, -0.6431021, -2.344251, 0, 1, 0.2862745, 1,
-0.3355935, -0.2165214, -2.40147, 0, 1, 0.2901961, 1,
-0.335329, -0.2966434, -0.647637, 0, 1, 0.2980392, 1,
-0.3342687, -1.010652, -4.347774, 0, 1, 0.3058824, 1,
-0.3342275, 1.042677, -0.42821, 0, 1, 0.3098039, 1,
-0.3320021, -0.8612308, -1.916435, 0, 1, 0.3176471, 1,
-0.3304229, -0.6774704, -1.925307, 0, 1, 0.3215686, 1,
-0.3294402, 1.044259, -0.7539622, 0, 1, 0.3294118, 1,
-0.3243299, 0.1548684, -2.029781, 0, 1, 0.3333333, 1,
-0.3211628, 1.962039, -0.4704235, 0, 1, 0.3411765, 1,
-0.3165959, 1.042592, -1.059963, 0, 1, 0.345098, 1,
-0.3118817, -0.6615047, -2.834777, 0, 1, 0.3529412, 1,
-0.3100552, -0.08343459, -1.155657, 0, 1, 0.3568628, 1,
-0.3086155, -0.2217127, -3.463455, 0, 1, 0.3647059, 1,
-0.3085985, 1.187116, -2.74807, 0, 1, 0.3686275, 1,
-0.3076359, -0.4871383, -1.227124, 0, 1, 0.3764706, 1,
-0.3016955, -2.227368, -3.023063, 0, 1, 0.3803922, 1,
-0.3016934, 0.796173, -1.487534, 0, 1, 0.3882353, 1,
-0.2960434, -0.2449861, -0.7712407, 0, 1, 0.3921569, 1,
-0.2934351, -1.095843, -1.942927, 0, 1, 0.4, 1,
-0.2831441, -0.04858568, -2.337373, 0, 1, 0.4078431, 1,
-0.2830896, 0.4438167, 0.4683027, 0, 1, 0.4117647, 1,
-0.2811719, -2.000016, -0.9667007, 0, 1, 0.4196078, 1,
-0.2743588, -1.137854, -3.766876, 0, 1, 0.4235294, 1,
-0.2741012, -0.7704559, -3.293631, 0, 1, 0.4313726, 1,
-0.2717226, -0.4006742, -1.81096, 0, 1, 0.4352941, 1,
-0.2680112, 0.758915, 0.8634214, 0, 1, 0.4431373, 1,
-0.2670589, 0.1363293, -0.6929606, 0, 1, 0.4470588, 1,
-0.263891, 1.513778, -1.319319, 0, 1, 0.454902, 1,
-0.2556629, 0.755686, 0.7233449, 0, 1, 0.4588235, 1,
-0.2503614, -0.7535428, -2.666687, 0, 1, 0.4666667, 1,
-0.246198, -0.2331715, -2.319639, 0, 1, 0.4705882, 1,
-0.2437728, -1.089489, -1.71109, 0, 1, 0.4784314, 1,
-0.2426095, 1.250349, -0.5005993, 0, 1, 0.4823529, 1,
-0.2311899, 0.4051437, -0.9522604, 0, 1, 0.4901961, 1,
-0.2305508, 0.0765958, -0.2631691, 0, 1, 0.4941176, 1,
-0.2286766, 1.222919, 0.6823978, 0, 1, 0.5019608, 1,
-0.2238995, 0.9652157, 1.241608, 0, 1, 0.509804, 1,
-0.2232199, 1.136208, -0.2692724, 0, 1, 0.5137255, 1,
-0.2208244, 0.8600097, 0.3536723, 0, 1, 0.5215687, 1,
-0.2196687, 0.8311464, -0.2530917, 0, 1, 0.5254902, 1,
-0.2196677, 0.8898263, 0.829978, 0, 1, 0.5333334, 1,
-0.2194569, 1.209532, -0.9802579, 0, 1, 0.5372549, 1,
-0.2154843, -0.756815, -3.156029, 0, 1, 0.5450981, 1,
-0.214006, 1.493056, 1.048476, 0, 1, 0.5490196, 1,
-0.2124375, 1.746122, -0.5451042, 0, 1, 0.5568628, 1,
-0.2105738, 0.4611668, -0.01059786, 0, 1, 0.5607843, 1,
-0.2104673, -0.3762051, -1.158984, 0, 1, 0.5686275, 1,
-0.2095313, -0.9170384, -4.04247, 0, 1, 0.572549, 1,
-0.2077655, -1.597072, -3.865552, 0, 1, 0.5803922, 1,
-0.2056921, 0.1755348, -0.1691997, 0, 1, 0.5843138, 1,
-0.2002421, -1.091183, -4.311144, 0, 1, 0.5921569, 1,
-0.1990866, 1.231441, 0.7039589, 0, 1, 0.5960785, 1,
-0.1963558, 0.5879109, -2.057014, 0, 1, 0.6039216, 1,
-0.193464, -0.3713787, -1.269597, 0, 1, 0.6117647, 1,
-0.1915928, 0.8129119, -1.621167, 0, 1, 0.6156863, 1,
-0.1908309, -1.25653, -2.142209, 0, 1, 0.6235294, 1,
-0.1853375, -0.4273735, -2.191996, 0, 1, 0.627451, 1,
-0.1829772, -0.7818415, -3.089065, 0, 1, 0.6352941, 1,
-0.1820798, 0.01967757, -0.4295608, 0, 1, 0.6392157, 1,
-0.1813024, -1.726085, -2.689888, 0, 1, 0.6470588, 1,
-0.1793306, -0.5911958, -2.498074, 0, 1, 0.6509804, 1,
-0.1782417, 1.368108, -0.4990335, 0, 1, 0.6588235, 1,
-0.1768028, 0.2859902, -0.4985726, 0, 1, 0.6627451, 1,
-0.1736163, -0.7766367, -2.571611, 0, 1, 0.6705883, 1,
-0.1714267, 0.3001894, 0.706908, 0, 1, 0.6745098, 1,
-0.1712502, 1.0522, 0.07416269, 0, 1, 0.682353, 1,
-0.1666346, -0.5895413, -3.082055, 0, 1, 0.6862745, 1,
-0.1622504, -0.4928304, -2.55404, 0, 1, 0.6941177, 1,
-0.1622475, -0.5716577, -3.388269, 0, 1, 0.7019608, 1,
-0.1600801, -1.820176, -1.134718, 0, 1, 0.7058824, 1,
-0.1585005, -0.7228824, -5.173994, 0, 1, 0.7137255, 1,
-0.157462, -0.4815831, -2.813727, 0, 1, 0.7176471, 1,
-0.157312, 1.615337, -0.8680382, 0, 1, 0.7254902, 1,
-0.1550712, -0.9495233, -2.802723, 0, 1, 0.7294118, 1,
-0.1523068, -0.6250988, -3.839913, 0, 1, 0.7372549, 1,
-0.1485279, -0.2617178, -2.6414, 0, 1, 0.7411765, 1,
-0.1406971, -1.947819, -4.822982, 0, 1, 0.7490196, 1,
-0.1339719, 0.9496247, 0.8203631, 0, 1, 0.7529412, 1,
-0.1330684, -0.07332611, -1.963273, 0, 1, 0.7607843, 1,
-0.1222005, 0.04471615, 0.7675864, 0, 1, 0.7647059, 1,
-0.1182657, -1.372296, -2.021827, 0, 1, 0.772549, 1,
-0.1182074, 0.1094798, -0.1259302, 0, 1, 0.7764706, 1,
-0.1167634, -0.009153866, -1.37017, 0, 1, 0.7843137, 1,
-0.115469, 0.2625225, -0.1716179, 0, 1, 0.7882353, 1,
-0.114198, 0.4594763, 0.3752061, 0, 1, 0.7960784, 1,
-0.1140948, -0.911451, -4.412737, 0, 1, 0.8039216, 1,
-0.1132407, -1.414047, -3.805103, 0, 1, 0.8078431, 1,
-0.1071285, -0.04774896, -1.392314, 0, 1, 0.8156863, 1,
-0.105682, -0.481125, -4.741694, 0, 1, 0.8196079, 1,
-0.1055565, 0.7610726, 0.4807681, 0, 1, 0.827451, 1,
-0.1033093, 0.3589518, -0.1772106, 0, 1, 0.8313726, 1,
-0.1031087, -0.05784455, -2.457936, 0, 1, 0.8392157, 1,
-0.1011727, 0.7043029, -1.092709, 0, 1, 0.8431373, 1,
-0.09672222, 0.7774264, 1.615786, 0, 1, 0.8509804, 1,
-0.09359664, 0.1134131, -0.7520933, 0, 1, 0.854902, 1,
-0.0929291, 0.1331158, -1.115549, 0, 1, 0.8627451, 1,
-0.09290738, 0.03680404, -1.184048, 0, 1, 0.8666667, 1,
-0.09170496, -0.07610425, -3.115748, 0, 1, 0.8745098, 1,
-0.08725228, 0.2015968, -0.1033274, 0, 1, 0.8784314, 1,
-0.08547909, -1.006974, -2.861068, 0, 1, 0.8862745, 1,
-0.08359463, -0.2076804, -2.548039, 0, 1, 0.8901961, 1,
-0.08199023, 0.9739238, -0.8142355, 0, 1, 0.8980392, 1,
-0.08164069, -1.139546, -3.661317, 0, 1, 0.9058824, 1,
-0.08133722, -0.1877082, -1.844996, 0, 1, 0.9098039, 1,
-0.0756319, -1.123446, -2.514729, 0, 1, 0.9176471, 1,
-0.0755793, 1.478638, 0.5305868, 0, 1, 0.9215686, 1,
-0.07512499, -0.1346098, -2.904965, 0, 1, 0.9294118, 1,
-0.07376778, -0.6957309, -3.967944, 0, 1, 0.9333333, 1,
-0.06967538, -1.214537, -2.649368, 0, 1, 0.9411765, 1,
-0.06829264, 2.087883, 0.5576878, 0, 1, 0.945098, 1,
-0.0673387, 1.527682, -0.02212451, 0, 1, 0.9529412, 1,
-0.05906691, -0.3623318, -1.572333, 0, 1, 0.9568627, 1,
-0.0549639, -0.7647121, -3.311574, 0, 1, 0.9647059, 1,
-0.04719357, -0.8640276, -5.145129, 0, 1, 0.9686275, 1,
-0.04565613, 0.1656305, -0.2965338, 0, 1, 0.9764706, 1,
-0.04390108, -0.1892025, -1.451883, 0, 1, 0.9803922, 1,
-0.04195241, 0.5707138, -0.8038806, 0, 1, 0.9882353, 1,
-0.04070628, 2.229386, 0.4042695, 0, 1, 0.9921569, 1,
-0.03498437, 1.017579, -0.7773187, 0, 1, 1, 1,
-0.03090151, -0.8027061, -5.635915, 0, 0.9921569, 1, 1,
-0.02968226, -0.7298868, -2.508939, 0, 0.9882353, 1, 1,
-0.02704538, 0.2564367, -0.1932981, 0, 0.9803922, 1, 1,
-0.0267213, -0.3222034, -0.790248, 0, 0.9764706, 1, 1,
-0.02519276, -0.5215943, -4.624089, 0, 0.9686275, 1, 1,
-0.02196473, 0.07691249, 1.895313, 0, 0.9647059, 1, 1,
-0.02025419, 0.405533, 0.2419803, 0, 0.9568627, 1, 1,
-0.01952968, -0.7109626, -2.43733, 0, 0.9529412, 1, 1,
-0.01427762, 0.2365265, -0.6759368, 0, 0.945098, 1, 1,
-0.007293793, 1.402002, -0.83718, 0, 0.9411765, 1, 1,
-0.003464346, -0.5793614, -3.535099, 0, 0.9333333, 1, 1,
-0.002411799, -0.2181842, -3.228105, 0, 0.9294118, 1, 1,
-0.001759722, -1.665102, -3.110605, 0, 0.9215686, 1, 1,
0.001870436, 0.8284254, -0.2528961, 0, 0.9176471, 1, 1,
0.002723446, -0.7118681, 3.386951, 0, 0.9098039, 1, 1,
0.004594011, 0.2902866, -0.5743358, 0, 0.9058824, 1, 1,
0.008679121, 1.522058, -0.3575294, 0, 0.8980392, 1, 1,
0.01061555, 0.8513794, -0.2009979, 0, 0.8901961, 1, 1,
0.01819161, -0.4853859, 3.889383, 0, 0.8862745, 1, 1,
0.01833688, 0.05377116, -1.091142, 0, 0.8784314, 1, 1,
0.02161685, -1.306963, 2.603059, 0, 0.8745098, 1, 1,
0.02175271, 0.273806, 0.3257222, 0, 0.8666667, 1, 1,
0.02295835, -0.6295407, 5.066985, 0, 0.8627451, 1, 1,
0.02392615, 0.6584756, -0.6337148, 0, 0.854902, 1, 1,
0.02481214, 0.263352, -0.5150245, 0, 0.8509804, 1, 1,
0.02491796, -0.7066404, 2.261759, 0, 0.8431373, 1, 1,
0.02604716, -1.750487, 3.573585, 0, 0.8392157, 1, 1,
0.02611294, -0.7597083, 4.647107, 0, 0.8313726, 1, 1,
0.02714081, 0.08996236, -0.9863742, 0, 0.827451, 1, 1,
0.03090712, 1.361903, -1.264653, 0, 0.8196079, 1, 1,
0.03199412, -0.625582, 1.851529, 0, 0.8156863, 1, 1,
0.03206157, -2.13379, 2.193329, 0, 0.8078431, 1, 1,
0.03417459, 0.238889, 1.507497, 0, 0.8039216, 1, 1,
0.03492378, 0.2835608, 2.09748, 0, 0.7960784, 1, 1,
0.0351115, 0.7984606, -0.5471302, 0, 0.7882353, 1, 1,
0.03749995, 0.2051438, -0.8744407, 0, 0.7843137, 1, 1,
0.04279819, -0.4641047, 3.341529, 0, 0.7764706, 1, 1,
0.04386127, 0.339376, 0.2315698, 0, 0.772549, 1, 1,
0.04664403, 1.901028, 1.369672, 0, 0.7647059, 1, 1,
0.05076716, -0.4357918, 2.07326, 0, 0.7607843, 1, 1,
0.05468958, 1.320248, -1.814599, 0, 0.7529412, 1, 1,
0.05478923, -0.3155478, 1.79749, 0, 0.7490196, 1, 1,
0.05684526, -1.30035, 3.280695, 0, 0.7411765, 1, 1,
0.05961084, 0.3004977, 0.06506733, 0, 0.7372549, 1, 1,
0.05967677, -0.3758398, 1.891213, 0, 0.7294118, 1, 1,
0.06670042, -1.534422, 3.312897, 0, 0.7254902, 1, 1,
0.06680925, 1.16087, 0.7339703, 0, 0.7176471, 1, 1,
0.06809241, -0.05791667, 1.98067, 0, 0.7137255, 1, 1,
0.07053383, -1.971352, 4.046431, 0, 0.7058824, 1, 1,
0.08112974, 0.6508185, 0.9493826, 0, 0.6980392, 1, 1,
0.08258104, 1.088333, 0.3910176, 0, 0.6941177, 1, 1,
0.08671896, -1.660515, 2.213084, 0, 0.6862745, 1, 1,
0.08690182, 0.03891031, -0.0810298, 0, 0.682353, 1, 1,
0.08764965, 0.8816496, -1.082739, 0, 0.6745098, 1, 1,
0.09274372, 0.7309029, -1.003639, 0, 0.6705883, 1, 1,
0.09339052, 0.3208837, 3.432893, 0, 0.6627451, 1, 1,
0.09366903, -0.6514306, 2.927624, 0, 0.6588235, 1, 1,
0.09417949, -0.9759908, 4.825037, 0, 0.6509804, 1, 1,
0.09740219, 1.427833, -0.985248, 0, 0.6470588, 1, 1,
0.09911522, 0.9256383, -1.238208, 0, 0.6392157, 1, 1,
0.1000852, -0.5482652, 3.359795, 0, 0.6352941, 1, 1,
0.1009207, -1.666784, 3.739586, 0, 0.627451, 1, 1,
0.1036053, -0.5895717, 1.784024, 0, 0.6235294, 1, 1,
0.1073791, 0.4230644, 0.3482115, 0, 0.6156863, 1, 1,
0.1077139, 0.9102958, -0.2899641, 0, 0.6117647, 1, 1,
0.1173332, 1.671688, 0.7497633, 0, 0.6039216, 1, 1,
0.1188447, 0.5613599, -1.261976, 0, 0.5960785, 1, 1,
0.1235763, -2.014416, 3.098988, 0, 0.5921569, 1, 1,
0.1246157, 0.6821597, -0.3155258, 0, 0.5843138, 1, 1,
0.1253238, -0.3835354, 3.992867, 0, 0.5803922, 1, 1,
0.1367931, -1.467514, 4.373064, 0, 0.572549, 1, 1,
0.1368706, 0.562445, -0.7435067, 0, 0.5686275, 1, 1,
0.1409516, -0.6322812, 2.808702, 0, 0.5607843, 1, 1,
0.1439696, 0.4096526, 0.7602261, 0, 0.5568628, 1, 1,
0.1525567, 0.08319894, -0.2810601, 0, 0.5490196, 1, 1,
0.1527346, 0.4436021, 0.6515658, 0, 0.5450981, 1, 1,
0.1539008, -0.8024743, 2.591131, 0, 0.5372549, 1, 1,
0.1541004, 0.4017636, 1.977688, 0, 0.5333334, 1, 1,
0.1600202, -0.4362098, 1.94708, 0, 0.5254902, 1, 1,
0.160809, 1.248148, 0.7381942, 0, 0.5215687, 1, 1,
0.1614077, -1.517381, 3.129469, 0, 0.5137255, 1, 1,
0.1632559, 1.049262, 0.723641, 0, 0.509804, 1, 1,
0.1729401, 0.7938781, 2.2816, 0, 0.5019608, 1, 1,
0.1740305, 0.3315795, -0.761818, 0, 0.4941176, 1, 1,
0.1747542, 0.08469501, 2.880587, 0, 0.4901961, 1, 1,
0.1770363, -0.4829433, 2.550773, 0, 0.4823529, 1, 1,
0.1789914, 0.02377487, 1.900848, 0, 0.4784314, 1, 1,
0.1794196, 0.870928, -0.4113219, 0, 0.4705882, 1, 1,
0.1809994, 0.1920864, -0.2160462, 0, 0.4666667, 1, 1,
0.1811072, 0.1333717, 0.7374914, 0, 0.4588235, 1, 1,
0.1818838, 0.1183575, 1.217644, 0, 0.454902, 1, 1,
0.1828477, 1.57681, -0.4845779, 0, 0.4470588, 1, 1,
0.1853324, 0.2109068, -1.089898, 0, 0.4431373, 1, 1,
0.1935828, -1.174147, 3.498727, 0, 0.4352941, 1, 1,
0.2019325, -0.6050815, 3.079408, 0, 0.4313726, 1, 1,
0.2040118, 0.2694971, -0.361343, 0, 0.4235294, 1, 1,
0.2047525, -0.2821851, 0.5796452, 0, 0.4196078, 1, 1,
0.2048683, 0.8691335, -0.631783, 0, 0.4117647, 1, 1,
0.2053439, 0.7620004, 1.357737, 0, 0.4078431, 1, 1,
0.2062631, -0.8704894, 2.669518, 0, 0.4, 1, 1,
0.2093176, 0.7346218, 0.7062635, 0, 0.3921569, 1, 1,
0.2178271, -0.1712996, 1.299255, 0, 0.3882353, 1, 1,
0.221536, 1.721148, 0.7687306, 0, 0.3803922, 1, 1,
0.2243428, 0.3120435, 1.648918, 0, 0.3764706, 1, 1,
0.2243582, 0.3577974, 0.2855177, 0, 0.3686275, 1, 1,
0.2266792, 0.9005561, 1.43893, 0, 0.3647059, 1, 1,
0.2320038, 0.239829, -0.5205821, 0, 0.3568628, 1, 1,
0.2348627, -0.540857, 4.035737, 0, 0.3529412, 1, 1,
0.2349837, -0.2503167, 1.958209, 0, 0.345098, 1, 1,
0.2352855, -0.5650682, 1.643926, 0, 0.3411765, 1, 1,
0.2486901, -0.5080326, 2.428525, 0, 0.3333333, 1, 1,
0.254031, -0.6814833, 1.949828, 0, 0.3294118, 1, 1,
0.2580735, 2.861903, -0.1530208, 0, 0.3215686, 1, 1,
0.2601321, 0.757868, -1.306764, 0, 0.3176471, 1, 1,
0.263084, -1.604283, 3.270288, 0, 0.3098039, 1, 1,
0.2658828, 1.01544, 0.2101452, 0, 0.3058824, 1, 1,
0.270245, 0.23426, 1.051982, 0, 0.2980392, 1, 1,
0.2715961, -0.04528211, 0.8356012, 0, 0.2901961, 1, 1,
0.2826715, 0.5087211, -0.4738435, 0, 0.2862745, 1, 1,
0.2860457, -0.586988, 2.382254, 0, 0.2784314, 1, 1,
0.2945463, -0.1498235, 1.96073, 0, 0.2745098, 1, 1,
0.2965268, 0.1808783, -0.08918946, 0, 0.2666667, 1, 1,
0.299686, -1.123224, 2.694968, 0, 0.2627451, 1, 1,
0.3024233, -1.766813, 5.034028, 0, 0.254902, 1, 1,
0.3043065, -0.9092909, 4.637295, 0, 0.2509804, 1, 1,
0.3044719, -1.505624, 2.504607, 0, 0.2431373, 1, 1,
0.3054967, 0.3960877, 0.947616, 0, 0.2392157, 1, 1,
0.3080103, -0.3016329, 3.254592, 0, 0.2313726, 1, 1,
0.3098797, 2.309471, 0.325744, 0, 0.227451, 1, 1,
0.3120018, 0.2855994, 0.6632838, 0, 0.2196078, 1, 1,
0.3145484, -1.051775, 3.506123, 0, 0.2156863, 1, 1,
0.3199985, -0.4725132, 2.393499, 0, 0.2078431, 1, 1,
0.3228683, -0.768057, 2.674015, 0, 0.2039216, 1, 1,
0.3257367, -0.0686975, 2.736369, 0, 0.1960784, 1, 1,
0.3293993, 0.2611968, -0.3242051, 0, 0.1882353, 1, 1,
0.3294683, 0.07246058, 1.100986, 0, 0.1843137, 1, 1,
0.3297062, -1.398962, 4.421803, 0, 0.1764706, 1, 1,
0.3324952, -1.632125, 3.506216, 0, 0.172549, 1, 1,
0.3372861, -0.2557568, 3.100266, 0, 0.1647059, 1, 1,
0.3387845, 0.4536788, 0.7117466, 0, 0.1607843, 1, 1,
0.3394674, 0.1297523, 2.353281, 0, 0.1529412, 1, 1,
0.3395254, 0.6619288, -0.5198457, 0, 0.1490196, 1, 1,
0.344374, -0.5213717, 2.703075, 0, 0.1411765, 1, 1,
0.3490412, 0.2782426, 0.8569537, 0, 0.1372549, 1, 1,
0.3540604, -0.2425548, 3.022351, 0, 0.1294118, 1, 1,
0.354492, -0.3220157, 0.5534541, 0, 0.1254902, 1, 1,
0.3596169, -1.457558, 2.604045, 0, 0.1176471, 1, 1,
0.3639823, 1.078191, -0.01275908, 0, 0.1137255, 1, 1,
0.3644801, 0.7319754, 1.074428, 0, 0.1058824, 1, 1,
0.3647817, 0.4658094, -0.5840132, 0, 0.09803922, 1, 1,
0.3673345, 0.3490865, 1.647049, 0, 0.09411765, 1, 1,
0.3725702, -0.9969565, 3.144954, 0, 0.08627451, 1, 1,
0.3729677, -0.1657519, 3.031316, 0, 0.08235294, 1, 1,
0.3783945, -0.4647409, 1.859118, 0, 0.07450981, 1, 1,
0.3789713, -0.06993432, 2.228853, 0, 0.07058824, 1, 1,
0.3791319, -0.08971546, 2.370057, 0, 0.0627451, 1, 1,
0.381034, 1.064375, 0.01819313, 0, 0.05882353, 1, 1,
0.3821059, 0.06796597, 2.425885, 0, 0.05098039, 1, 1,
0.3843267, 1.584895, 0.6634052, 0, 0.04705882, 1, 1,
0.3858056, -0.9667615, 0.6077965, 0, 0.03921569, 1, 1,
0.386377, 0.2668305, -0.8927926, 0, 0.03529412, 1, 1,
0.3900994, -1.146144, 2.559855, 0, 0.02745098, 1, 1,
0.3934718, -2.530123, 2.754384, 0, 0.02352941, 1, 1,
0.3976655, -0.3882828, 1.741227, 0, 0.01568628, 1, 1,
0.3985275, 2.61266, 1.276325, 0, 0.01176471, 1, 1,
0.4004328, -0.1777822, 3.278951, 0, 0.003921569, 1, 1,
0.4016931, -0.6085169, 2.709735, 0.003921569, 0, 1, 1,
0.4056184, -0.9226627, 2.706381, 0.007843138, 0, 1, 1,
0.4088151, -1.26485, 3.46666, 0.01568628, 0, 1, 1,
0.4108936, -0.009036426, 1.71064, 0.01960784, 0, 1, 1,
0.414576, 1.92159, 0.9584593, 0.02745098, 0, 1, 1,
0.4158445, 0.3589906, 0.04018681, 0.03137255, 0, 1, 1,
0.416283, 0.7056682, 0.17757, 0.03921569, 0, 1, 1,
0.4219962, -1.108952, 4.352095, 0.04313726, 0, 1, 1,
0.4228899, 2.269276, -0.9529694, 0.05098039, 0, 1, 1,
0.4254544, 0.1510839, 1.653459, 0.05490196, 0, 1, 1,
0.4262557, 1.623568, 0.6821567, 0.0627451, 0, 1, 1,
0.4303798, 0.5458276, 0.159976, 0.06666667, 0, 1, 1,
0.4313431, 0.4995002, 1.204185, 0.07450981, 0, 1, 1,
0.4375913, 0.8849012, 1.636162, 0.07843138, 0, 1, 1,
0.4409883, -0.08298488, 0.8090923, 0.08627451, 0, 1, 1,
0.4415188, -0.6105276, 2.983733, 0.09019608, 0, 1, 1,
0.4419723, -1.889063, 4.274301, 0.09803922, 0, 1, 1,
0.4476195, -1.121781, 1.878345, 0.1058824, 0, 1, 1,
0.4503168, -0.3972631, 2.348951, 0.1098039, 0, 1, 1,
0.4567078, -1.648464, 1.962784, 0.1176471, 0, 1, 1,
0.4573499, -1.198739, 2.760951, 0.1215686, 0, 1, 1,
0.4580621, -1.185577, 4.17624, 0.1294118, 0, 1, 1,
0.4586128, -0.3160772, 2.220959, 0.1333333, 0, 1, 1,
0.4637556, -0.4121412, 2.422242, 0.1411765, 0, 1, 1,
0.4643293, 0.7296968, 0.5515542, 0.145098, 0, 1, 1,
0.471132, 1.477963, 0.01010971, 0.1529412, 0, 1, 1,
0.4740405, -0.3635857, -0.3675497, 0.1568628, 0, 1, 1,
0.4740804, 0.2220301, 0.7132984, 0.1647059, 0, 1, 1,
0.4748168, -0.01294499, 2.025027, 0.1686275, 0, 1, 1,
0.4760361, 0.9053544, 0.3207002, 0.1764706, 0, 1, 1,
0.4769333, 0.1175546, 1.078999, 0.1803922, 0, 1, 1,
0.4774415, -0.0196318, 3.085881, 0.1882353, 0, 1, 1,
0.4799832, 1.798868, 0.2308248, 0.1921569, 0, 1, 1,
0.4815007, 0.4445296, 0.6930973, 0.2, 0, 1, 1,
0.4819081, -1.053301, 4.02379, 0.2078431, 0, 1, 1,
0.482798, -0.7066524, 1.775191, 0.2117647, 0, 1, 1,
0.4856966, -0.6071672, 2.295422, 0.2196078, 0, 1, 1,
0.4875816, -2.621147, 3.53971, 0.2235294, 0, 1, 1,
0.4928442, -1.061396, 3.195397, 0.2313726, 0, 1, 1,
0.493543, 0.2679491, 2.580404, 0.2352941, 0, 1, 1,
0.4951239, 1.262495, 1.865451, 0.2431373, 0, 1, 1,
0.5001138, -0.9888469, 2.334581, 0.2470588, 0, 1, 1,
0.5030538, 0.8824402, 1.428472, 0.254902, 0, 1, 1,
0.5034707, -1.558359, 3.987727, 0.2588235, 0, 1, 1,
0.5116653, -0.1979368, 1.20101, 0.2666667, 0, 1, 1,
0.5123674, -1.049716, 3.811827, 0.2705882, 0, 1, 1,
0.5148485, -0.7927692, 4.504023, 0.2784314, 0, 1, 1,
0.5188344, -0.5225512, 2.438412, 0.282353, 0, 1, 1,
0.5205073, 1.664316, 1.690669, 0.2901961, 0, 1, 1,
0.5230094, 0.3555409, 0.8652748, 0.2941177, 0, 1, 1,
0.5246214, -0.1889727, 2.655239, 0.3019608, 0, 1, 1,
0.5376156, 1.278365, -0.5646357, 0.3098039, 0, 1, 1,
0.5380641, -0.3613824, 2.241405, 0.3137255, 0, 1, 1,
0.5415078, 1.488167, 0.07542655, 0.3215686, 0, 1, 1,
0.5494761, -0.354056, 3.686785, 0.3254902, 0, 1, 1,
0.5522121, -1.471638, 3.908793, 0.3333333, 0, 1, 1,
0.5547255, -1.520675, 3.203333, 0.3372549, 0, 1, 1,
0.5547354, -0.6828458, 1.563677, 0.345098, 0, 1, 1,
0.5575039, -1.936637, 2.199511, 0.3490196, 0, 1, 1,
0.5576853, 0.003185533, 0.2069568, 0.3568628, 0, 1, 1,
0.5598227, -0.2267412, 2.6883, 0.3607843, 0, 1, 1,
0.5610787, 1.346211, -0.5205792, 0.3686275, 0, 1, 1,
0.5699123, -0.009143359, 2.997808, 0.372549, 0, 1, 1,
0.5777954, -0.5112723, 3.400114, 0.3803922, 0, 1, 1,
0.5784546, 0.5094306, 0.9250291, 0.3843137, 0, 1, 1,
0.5785909, 1.821159, 0.4119236, 0.3921569, 0, 1, 1,
0.5810951, 1.150043, 1.30623, 0.3960784, 0, 1, 1,
0.5819684, 0.5843142, 0.5765828, 0.4039216, 0, 1, 1,
0.5833531, 1.434194, 0.1811239, 0.4117647, 0, 1, 1,
0.5847727, 1.064211, 0.1189855, 0.4156863, 0, 1, 1,
0.5867755, 0.8415267, 0.1078455, 0.4235294, 0, 1, 1,
0.5878582, -0.6982436, 1.342314, 0.427451, 0, 1, 1,
0.5932427, -2.026632, 5.018658, 0.4352941, 0, 1, 1,
0.5981779, -1.073931, 4.885225, 0.4392157, 0, 1, 1,
0.604654, -2.139016, 2.776717, 0.4470588, 0, 1, 1,
0.6065708, -0.8379627, 2.947092, 0.4509804, 0, 1, 1,
0.6101179, -1.828424, 0.8164219, 0.4588235, 0, 1, 1,
0.6125007, 0.8936635, 0.02733028, 0.4627451, 0, 1, 1,
0.6140546, 2.991529, -1.716309, 0.4705882, 0, 1, 1,
0.6213033, -1.533787, 2.450462, 0.4745098, 0, 1, 1,
0.6243606, -0.4289671, 1.846059, 0.4823529, 0, 1, 1,
0.6254727, -1.158617, 4.599848, 0.4862745, 0, 1, 1,
0.6265382, -0.1486294, -0.4591165, 0.4941176, 0, 1, 1,
0.6307004, 0.2749514, 2.492233, 0.5019608, 0, 1, 1,
0.6315399, -0.8724237, 2.112341, 0.5058824, 0, 1, 1,
0.6316879, 1.049061, 0.3377186, 0.5137255, 0, 1, 1,
0.6341139, -0.6872264, 2.14871, 0.5176471, 0, 1, 1,
0.6350968, -0.07462227, 0.5175541, 0.5254902, 0, 1, 1,
0.6425966, 0.5169478, 0.4714155, 0.5294118, 0, 1, 1,
0.6449553, -2.060018, 3.569647, 0.5372549, 0, 1, 1,
0.6497193, -0.8576343, 5.416379, 0.5411765, 0, 1, 1,
0.6516412, -0.1356091, 1.925573, 0.5490196, 0, 1, 1,
0.6569254, -0.4126901, 3.471165, 0.5529412, 0, 1, 1,
0.6570625, 0.2628695, -0.1344847, 0.5607843, 0, 1, 1,
0.6675787, -0.3761031, 2.378747, 0.5647059, 0, 1, 1,
0.6712613, -0.9278675, 3.415968, 0.572549, 0, 1, 1,
0.6761502, -0.09107099, 3.475092, 0.5764706, 0, 1, 1,
0.6812019, -0.01091624, 1.383418, 0.5843138, 0, 1, 1,
0.6817141, 2.530788, 0.3353533, 0.5882353, 0, 1, 1,
0.6827336, 0.9306435, 0.5554729, 0.5960785, 0, 1, 1,
0.6887267, 0.3055357, 0.08989519, 0.6039216, 0, 1, 1,
0.7058246, -0.2476135, 2.011855, 0.6078432, 0, 1, 1,
0.7065921, 1.870326, 0.6121616, 0.6156863, 0, 1, 1,
0.7097001, -0.255501, 2.65258, 0.6196079, 0, 1, 1,
0.7134994, 1.395088, -0.3912882, 0.627451, 0, 1, 1,
0.7200028, 1.72751, 0.9910787, 0.6313726, 0, 1, 1,
0.7217941, 0.1040566, 2.373756, 0.6392157, 0, 1, 1,
0.7241797, -0.7772435, 3.233888, 0.6431373, 0, 1, 1,
0.7298842, -0.4343114, -0.2794299, 0.6509804, 0, 1, 1,
0.7316211, -0.3131893, 1.771985, 0.654902, 0, 1, 1,
0.7354402, 1.046065, 0.9383088, 0.6627451, 0, 1, 1,
0.7396119, -0.194947, 0.7142951, 0.6666667, 0, 1, 1,
0.7420277, -1.179827, 1.674657, 0.6745098, 0, 1, 1,
0.7468538, -0.3444901, 1.604157, 0.6784314, 0, 1, 1,
0.749015, -0.03873682, 0.2880631, 0.6862745, 0, 1, 1,
0.7548298, 2.049275, -0.6411468, 0.6901961, 0, 1, 1,
0.7568176, -0.2482899, 1.911873, 0.6980392, 0, 1, 1,
0.7607535, -0.492847, 1.475131, 0.7058824, 0, 1, 1,
0.7627412, -1.110675, 2.173526, 0.7098039, 0, 1, 1,
0.7702802, 1.351486, 0.1427658, 0.7176471, 0, 1, 1,
0.7731842, -0.03458076, 3.145143, 0.7215686, 0, 1, 1,
0.773792, -0.2321117, 2.677186, 0.7294118, 0, 1, 1,
0.7742, -1.186707, 3.85244, 0.7333333, 0, 1, 1,
0.7773397, 1.571117, 2.168484, 0.7411765, 0, 1, 1,
0.7796685, 1.907465, -1.487781, 0.7450981, 0, 1, 1,
0.7807472, -2.128296, 0.2710781, 0.7529412, 0, 1, 1,
0.7832963, -0.01653841, 2.790472, 0.7568628, 0, 1, 1,
0.7835254, 0.5482967, 1.987657, 0.7647059, 0, 1, 1,
0.7850936, 2.128143, -1.142865, 0.7686275, 0, 1, 1,
0.7955775, -1.475286, 2.608487, 0.7764706, 0, 1, 1,
0.7993699, 0.8481597, 1.358169, 0.7803922, 0, 1, 1,
0.7998731, -0.3394965, 2.930853, 0.7882353, 0, 1, 1,
0.8018281, 1.87994, 1.307807, 0.7921569, 0, 1, 1,
0.8127263, 0.9798824, -0.7624348, 0.8, 0, 1, 1,
0.8206497, -0.8325575, 2.534781, 0.8078431, 0, 1, 1,
0.8311936, 0.007765818, -0.0207625, 0.8117647, 0, 1, 1,
0.8319715, -0.7224271, 0.9127633, 0.8196079, 0, 1, 1,
0.8418052, -0.387087, -0.2484132, 0.8235294, 0, 1, 1,
0.8464929, -0.4490988, 2.839128, 0.8313726, 0, 1, 1,
0.8525895, 1.213871, -0.8067881, 0.8352941, 0, 1, 1,
0.8606987, 0.0156638, 1.110875, 0.8431373, 0, 1, 1,
0.8659487, 1.087822, 1.186695, 0.8470588, 0, 1, 1,
0.8738315, -0.4791272, 2.500204, 0.854902, 0, 1, 1,
0.8765188, -1.447621, 2.580229, 0.8588235, 0, 1, 1,
0.8793247, -1.250419, 1.039594, 0.8666667, 0, 1, 1,
0.8797737, 0.9658116, 0.9997896, 0.8705882, 0, 1, 1,
0.8833187, 1.707156, 0.5309051, 0.8784314, 0, 1, 1,
0.8911346, -0.8097838, 3.642331, 0.8823529, 0, 1, 1,
0.8921186, -0.3534274, 1.632918, 0.8901961, 0, 1, 1,
0.8984971, 1.298629, -1.31241, 0.8941177, 0, 1, 1,
0.8993131, -0.0807642, 0.688671, 0.9019608, 0, 1, 1,
0.9009256, 0.2811118, 1.546359, 0.9098039, 0, 1, 1,
0.9084756, 0.8763582, 2.691111, 0.9137255, 0, 1, 1,
0.9175736, -0.459858, 2.45494, 0.9215686, 0, 1, 1,
0.9251531, -1.094982, 2.767967, 0.9254902, 0, 1, 1,
0.9292011, -0.6559933, 3.262549, 0.9333333, 0, 1, 1,
0.9299205, 0.3072462, 0.8117546, 0.9372549, 0, 1, 1,
0.9323543, 0.09622571, -0.0629615, 0.945098, 0, 1, 1,
0.9325919, 0.05495212, -0.6932842, 0.9490196, 0, 1, 1,
0.9395837, 1.525256, -0.2866841, 0.9568627, 0, 1, 1,
0.9508424, -1.44627, 1.725942, 0.9607843, 0, 1, 1,
0.9543943, 0.3384014, 2.285729, 0.9686275, 0, 1, 1,
0.9578353, -0.8717846, 1.685099, 0.972549, 0, 1, 1,
0.9596204, 1.51451, 0.2698539, 0.9803922, 0, 1, 1,
0.9614372, -0.840651, 2.744716, 0.9843137, 0, 1, 1,
0.9614511, 1.232935, -0.08041484, 0.9921569, 0, 1, 1,
0.9677882, 0.9073241, -0.2186132, 0.9960784, 0, 1, 1,
0.969671, -0.6176222, 2.365987, 1, 0, 0.9960784, 1,
0.9764463, 0.008235197, 2.330661, 1, 0, 0.9882353, 1,
0.9766487, 0.2882125, 1.486992, 1, 0, 0.9843137, 1,
0.9775339, 0.5362028, 2.376007, 1, 0, 0.9764706, 1,
0.9782441, -1.059146, 1.894706, 1, 0, 0.972549, 1,
0.9784954, -0.3736595, 1.688458, 1, 0, 0.9647059, 1,
0.9810992, -0.5035049, 2.503532, 1, 0, 0.9607843, 1,
0.9868346, 0.3519399, 1.025002, 1, 0, 0.9529412, 1,
0.9887475, 0.05211775, 0.1637018, 1, 0, 0.9490196, 1,
0.9888638, -0.07589082, 0.4137108, 1, 0, 0.9411765, 1,
0.9979433, -1.014675, 3.536572, 1, 0, 0.9372549, 1,
1.005482, -1.346049, 2.410951, 1, 0, 0.9294118, 1,
1.02034, -0.6299703, 1.874129, 1, 0, 0.9254902, 1,
1.024365, -0.1629986, 1.116631, 1, 0, 0.9176471, 1,
1.02784, -0.4244092, 2.587032, 1, 0, 0.9137255, 1,
1.036044, -0.3077026, 3.134649, 1, 0, 0.9058824, 1,
1.036239, 0.4045673, 1.538084, 1, 0, 0.9019608, 1,
1.036432, -1.984098, 2.962153, 1, 0, 0.8941177, 1,
1.036892, 0.1789947, 0.924216, 1, 0, 0.8862745, 1,
1.039514, 0.2535918, 1.912755, 1, 0, 0.8823529, 1,
1.041772, 0.5160555, 1.024361, 1, 0, 0.8745098, 1,
1.041792, -2.909663, 2.432455, 1, 0, 0.8705882, 1,
1.042251, -0.144813, 1.657055, 1, 0, 0.8627451, 1,
1.044687, 0.7025564, -0.6159483, 1, 0, 0.8588235, 1,
1.046792, 1.540024, 0.2155896, 1, 0, 0.8509804, 1,
1.049641, -1.68353, 2.677364, 1, 0, 0.8470588, 1,
1.052843, -2.065959, 2.796795, 1, 0, 0.8392157, 1,
1.059832, -0.8759387, 3.109943, 1, 0, 0.8352941, 1,
1.070717, -0.2775994, 1.964996, 1, 0, 0.827451, 1,
1.072329, -0.8513769, 3.57444, 1, 0, 0.8235294, 1,
1.073893, -0.9929185, 2.237413, 1, 0, 0.8156863, 1,
1.074836, -1.311068, 3.149291, 1, 0, 0.8117647, 1,
1.079003, 1.057498, 1.817789, 1, 0, 0.8039216, 1,
1.094934, -1.01716, 1.911792, 1, 0, 0.7960784, 1,
1.095769, -0.02479485, 2.852003, 1, 0, 0.7921569, 1,
1.107693, 0.9164343, 0.6129022, 1, 0, 0.7843137, 1,
1.119128, 2.297125, -0.7316523, 1, 0, 0.7803922, 1,
1.122549, -0.6881389, 2.430639, 1, 0, 0.772549, 1,
1.122792, -1.641839, 3.506159, 1, 0, 0.7686275, 1,
1.142594, 0.2571012, 3.368879, 1, 0, 0.7607843, 1,
1.16213, 0.876491, 0.2246244, 1, 0, 0.7568628, 1,
1.169244, -0.2990022, 3.881386, 1, 0, 0.7490196, 1,
1.172803, 1.235541, 2.944677, 1, 0, 0.7450981, 1,
1.179695, -2.18221, 1.068992, 1, 0, 0.7372549, 1,
1.180525, -1.040662, 2.352814, 1, 0, 0.7333333, 1,
1.187036, 0.3169433, -0.5954416, 1, 0, 0.7254902, 1,
1.187158, 0.7394708, 0.3732334, 1, 0, 0.7215686, 1,
1.189346, -0.8192621, 1.657811, 1, 0, 0.7137255, 1,
1.192783, -0.2641368, 1.470139, 1, 0, 0.7098039, 1,
1.196496, 0.595511, 0.6244578, 1, 0, 0.7019608, 1,
1.205145, -0.8672215, 3.484198, 1, 0, 0.6941177, 1,
1.211926, 0.05568878, 1.508847, 1, 0, 0.6901961, 1,
1.216558, 0.04201689, 2.323886, 1, 0, 0.682353, 1,
1.222423, -0.1279761, 3.143758, 1, 0, 0.6784314, 1,
1.225752, -1.50233, 3.212344, 1, 0, 0.6705883, 1,
1.226841, 1.242486, 1.919833, 1, 0, 0.6666667, 1,
1.272426, 0.2209083, 1.717258, 1, 0, 0.6588235, 1,
1.282281, -0.7108053, 3.18774, 1, 0, 0.654902, 1,
1.284877, -0.4480398, 0.8759406, 1, 0, 0.6470588, 1,
1.289134, -0.9111545, 3.352283, 1, 0, 0.6431373, 1,
1.306003, -0.07687062, 0.5696843, 1, 0, 0.6352941, 1,
1.311708, 0.001328645, 1.707763, 1, 0, 0.6313726, 1,
1.329731, -0.9533773, 1.607215, 1, 0, 0.6235294, 1,
1.334633, 0.1349854, 2.331757, 1, 0, 0.6196079, 1,
1.335238, 1.403398, 1.107986, 1, 0, 0.6117647, 1,
1.335426, -1.222936, 2.058599, 1, 0, 0.6078432, 1,
1.335587, 0.6958688, 2.7092, 1, 0, 0.6, 1,
1.342437, 0.3349839, 2.951224, 1, 0, 0.5921569, 1,
1.347208, 1.8129, -0.538139, 1, 0, 0.5882353, 1,
1.35229, -1.16608, 0.8809713, 1, 0, 0.5803922, 1,
1.370806, -3.311823, 5.280703, 1, 0, 0.5764706, 1,
1.371749, -0.4019072, 1.717003, 1, 0, 0.5686275, 1,
1.397635, 0.6766813, 1.672503, 1, 0, 0.5647059, 1,
1.399146, -0.2547507, 0.4071264, 1, 0, 0.5568628, 1,
1.409201, 0.01219554, -0.3871134, 1, 0, 0.5529412, 1,
1.410824, 0.2221977, 1.412686, 1, 0, 0.5450981, 1,
1.413788, -1.968479, 3.942639, 1, 0, 0.5411765, 1,
1.41538, 0.9539587, 1.530606, 1, 0, 0.5333334, 1,
1.416199, -1.6408, 1.877735, 1, 0, 0.5294118, 1,
1.416383, -1.091825, 1.713162, 1, 0, 0.5215687, 1,
1.422674, 0.9546844, 2.488107, 1, 0, 0.5176471, 1,
1.423522, 0.6015466, 2.153202, 1, 0, 0.509804, 1,
1.426979, 1.088199, 1.011078, 1, 0, 0.5058824, 1,
1.427936, 0.8721136, 2.200843, 1, 0, 0.4980392, 1,
1.469548, 0.7763078, 2.053382, 1, 0, 0.4901961, 1,
1.474847, 1.835375, -0.3257879, 1, 0, 0.4862745, 1,
1.478278, 1.103142, 1.298082, 1, 0, 0.4784314, 1,
1.478377, 1.477368, 0.9161766, 1, 0, 0.4745098, 1,
1.482239, -0.5353801, -0.04438139, 1, 0, 0.4666667, 1,
1.488641, 1.076009, 1.558974, 1, 0, 0.4627451, 1,
1.502391, -1.834856, 2.020178, 1, 0, 0.454902, 1,
1.507625, 0.3922765, -0.1678274, 1, 0, 0.4509804, 1,
1.520355, -0.07847787, 2.177398, 1, 0, 0.4431373, 1,
1.536002, 0.1447711, 0.8860075, 1, 0, 0.4392157, 1,
1.548694, 0.1964932, 2.70014, 1, 0, 0.4313726, 1,
1.553587, -0.103944, 1.688387, 1, 0, 0.427451, 1,
1.554481, -0.3167545, 0.4467443, 1, 0, 0.4196078, 1,
1.561056, 0.8211777, 0.5711361, 1, 0, 0.4156863, 1,
1.562974, 0.6526967, -0.1041175, 1, 0, 0.4078431, 1,
1.567043, 1.045105, 0.5913125, 1, 0, 0.4039216, 1,
1.572555, -0.01414646, 1.660852, 1, 0, 0.3960784, 1,
1.591554, 0.5122742, 0.7550821, 1, 0, 0.3882353, 1,
1.595392, -0.7879763, 1.16123, 1, 0, 0.3843137, 1,
1.626832, -1.015538, 1.791167, 1, 0, 0.3764706, 1,
1.666187, -1.1508, 1.77018, 1, 0, 0.372549, 1,
1.667822, -0.9382975, 2.703928, 1, 0, 0.3647059, 1,
1.692344, 0.1308447, 1.951582, 1, 0, 0.3607843, 1,
1.695182, -0.1951265, 2.388175, 1, 0, 0.3529412, 1,
1.718542, 0.5161195, 1.09364, 1, 0, 0.3490196, 1,
1.746329, 0.8473797, 1.561503, 1, 0, 0.3411765, 1,
1.749574, -1.407834, 3.640879, 1, 0, 0.3372549, 1,
1.753361, -0.8715639, 1.804543, 1, 0, 0.3294118, 1,
1.770474, -0.8266369, 2.318477, 1, 0, 0.3254902, 1,
1.775322, -0.8513601, 1.597557, 1, 0, 0.3176471, 1,
1.813861, 0.2544917, 1.759954, 1, 0, 0.3137255, 1,
1.815997, -0.8807452, 3.10413, 1, 0, 0.3058824, 1,
1.820026, -0.7533791, 3.826386, 1, 0, 0.2980392, 1,
1.820095, -0.228635, 1.627175, 1, 0, 0.2941177, 1,
1.823448, -1.406503, 3.369345, 1, 0, 0.2862745, 1,
1.829231, 1.160633, 1.977308, 1, 0, 0.282353, 1,
1.82934, -0.6328818, 3.936537, 1, 0, 0.2745098, 1,
1.844067, -1.221474, 3.422759, 1, 0, 0.2705882, 1,
1.848629, 0.4785487, 1.383704, 1, 0, 0.2627451, 1,
1.857608, 0.6136178, 1.113081, 1, 0, 0.2588235, 1,
1.876525, 1.005243, 2.233562, 1, 0, 0.2509804, 1,
1.91774, 0.03009098, 3.151505, 1, 0, 0.2470588, 1,
1.936361, 1.32098, 2.132185, 1, 0, 0.2392157, 1,
1.938993, -1.618915, 2.333819, 1, 0, 0.2352941, 1,
1.957785, 0.9288557, 2.994497, 1, 0, 0.227451, 1,
1.977572, -0.08572543, 2.353189, 1, 0, 0.2235294, 1,
1.978539, 1.313814, 1.205502, 1, 0, 0.2156863, 1,
2.003143, 0.710469, 1.552298, 1, 0, 0.2117647, 1,
2.055098, -1.130993, 1.654067, 1, 0, 0.2039216, 1,
2.05926, -0.1599956, 1.107436, 1, 0, 0.1960784, 1,
2.059359, -0.519282, 2.669442, 1, 0, 0.1921569, 1,
2.060806, 0.9150869, 0.4587033, 1, 0, 0.1843137, 1,
2.061575, 1.651331, 0.1940676, 1, 0, 0.1803922, 1,
2.080311, -0.09697596, 2.499614, 1, 0, 0.172549, 1,
2.088199, -0.03284939, 3.010957, 1, 0, 0.1686275, 1,
2.102818, -0.5202876, 0.6931095, 1, 0, 0.1607843, 1,
2.104857, 1.148021, 0.2447256, 1, 0, 0.1568628, 1,
2.106868, 0.6842216, 0.6646183, 1, 0, 0.1490196, 1,
2.107616, -2.220187, 2.593292, 1, 0, 0.145098, 1,
2.118086, 1.352579, 1.971084, 1, 0, 0.1372549, 1,
2.126518, 0.1376967, 2.197718, 1, 0, 0.1333333, 1,
2.17247, -0.01330077, 2.584642, 1, 0, 0.1254902, 1,
2.200013, -0.5482901, -0.173086, 1, 0, 0.1215686, 1,
2.216154, -0.3900687, 1.681547, 1, 0, 0.1137255, 1,
2.226311, -0.2062115, 2.039727, 1, 0, 0.1098039, 1,
2.261009, -0.6667012, 2.457629, 1, 0, 0.1019608, 1,
2.26565, -0.8902148, 1.843559, 1, 0, 0.09411765, 1,
2.275178, 0.3573351, 0.3889685, 1, 0, 0.09019608, 1,
2.331585, 0.1272451, 1.457659, 1, 0, 0.08235294, 1,
2.34005, 1.127006, 0.5933869, 1, 0, 0.07843138, 1,
2.347611, 2.238443, 1.516951, 1, 0, 0.07058824, 1,
2.443376, 0.6197481, 0.7485319, 1, 0, 0.06666667, 1,
2.473941, 0.3994324, 0.854854, 1, 0, 0.05882353, 1,
2.550195, 1.585539, 2.636635, 1, 0, 0.05490196, 1,
2.565881, 1.349303, 0.4460496, 1, 0, 0.04705882, 1,
2.611108, 2.147772, 2.095851, 1, 0, 0.04313726, 1,
2.638561, 1.875632, -0.696577, 1, 0, 0.03529412, 1,
2.676529, -0.5850393, 1.268754, 1, 0, 0.03137255, 1,
2.729545, 1.340765, 2.188182, 1, 0, 0.02352941, 1,
2.921555, 2.474632, 0.9679465, 1, 0, 0.01960784, 1,
3.203756, -1.145344, 2.111621, 1, 0, 0.01176471, 1,
3.540734, 0.579825, 0.9079343, 1, 0, 0.007843138, 1
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
0.1303934, -4.389463, -7.509279, 0, -0.5, 0.5, 0.5,
0.1303934, -4.389463, -7.509279, 1, -0.5, 0.5, 0.5,
0.1303934, -4.389463, -7.509279, 1, 1.5, 0.5, 0.5,
0.1303934, -4.389463, -7.509279, 0, 1.5, 0.5, 0.5
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
-4.436052, -0.132942, -7.509279, 0, -0.5, 0.5, 0.5,
-4.436052, -0.132942, -7.509279, 1, -0.5, 0.5, 0.5,
-4.436052, -0.132942, -7.509279, 1, 1.5, 0.5, 0.5,
-4.436052, -0.132942, -7.509279, 0, 1.5, 0.5, 0.5
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
-4.436052, -4.389463, -0.1097679, 0, -0.5, 0.5, 0.5,
-4.436052, -4.389463, -0.1097679, 1, -0.5, 0.5, 0.5,
-4.436052, -4.389463, -0.1097679, 1, 1.5, 0.5, 0.5,
-4.436052, -4.389463, -0.1097679, 0, 1.5, 0.5, 0.5
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
-3, -3.407189, -5.801699,
3, -3.407189, -5.801699,
-3, -3.407189, -5.801699,
-3, -3.570902, -6.086296,
-2, -3.407189, -5.801699,
-2, -3.570902, -6.086296,
-1, -3.407189, -5.801699,
-1, -3.570902, -6.086296,
0, -3.407189, -5.801699,
0, -3.570902, -6.086296,
1, -3.407189, -5.801699,
1, -3.570902, -6.086296,
2, -3.407189, -5.801699,
2, -3.570902, -6.086296,
3, -3.407189, -5.801699,
3, -3.570902, -6.086296
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
-3, -3.898326, -6.655489, 0, -0.5, 0.5, 0.5,
-3, -3.898326, -6.655489, 1, -0.5, 0.5, 0.5,
-3, -3.898326, -6.655489, 1, 1.5, 0.5, 0.5,
-3, -3.898326, -6.655489, 0, 1.5, 0.5, 0.5,
-2, -3.898326, -6.655489, 0, -0.5, 0.5, 0.5,
-2, -3.898326, -6.655489, 1, -0.5, 0.5, 0.5,
-2, -3.898326, -6.655489, 1, 1.5, 0.5, 0.5,
-2, -3.898326, -6.655489, 0, 1.5, 0.5, 0.5,
-1, -3.898326, -6.655489, 0, -0.5, 0.5, 0.5,
-1, -3.898326, -6.655489, 1, -0.5, 0.5, 0.5,
-1, -3.898326, -6.655489, 1, 1.5, 0.5, 0.5,
-1, -3.898326, -6.655489, 0, 1.5, 0.5, 0.5,
0, -3.898326, -6.655489, 0, -0.5, 0.5, 0.5,
0, -3.898326, -6.655489, 1, -0.5, 0.5, 0.5,
0, -3.898326, -6.655489, 1, 1.5, 0.5, 0.5,
0, -3.898326, -6.655489, 0, 1.5, 0.5, 0.5,
1, -3.898326, -6.655489, 0, -0.5, 0.5, 0.5,
1, -3.898326, -6.655489, 1, -0.5, 0.5, 0.5,
1, -3.898326, -6.655489, 1, 1.5, 0.5, 0.5,
1, -3.898326, -6.655489, 0, 1.5, 0.5, 0.5,
2, -3.898326, -6.655489, 0, -0.5, 0.5, 0.5,
2, -3.898326, -6.655489, 1, -0.5, 0.5, 0.5,
2, -3.898326, -6.655489, 1, 1.5, 0.5, 0.5,
2, -3.898326, -6.655489, 0, 1.5, 0.5, 0.5,
3, -3.898326, -6.655489, 0, -0.5, 0.5, 0.5,
3, -3.898326, -6.655489, 1, -0.5, 0.5, 0.5,
3, -3.898326, -6.655489, 1, 1.5, 0.5, 0.5,
3, -3.898326, -6.655489, 0, 1.5, 0.5, 0.5
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
-3.382257, -3, -5.801699,
-3.382257, 3, -5.801699,
-3.382257, -3, -5.801699,
-3.557889, -3, -6.086296,
-3.382257, -2, -5.801699,
-3.557889, -2, -6.086296,
-3.382257, -1, -5.801699,
-3.557889, -1, -6.086296,
-3.382257, 0, -5.801699,
-3.557889, 0, -6.086296,
-3.382257, 1, -5.801699,
-3.557889, 1, -6.086296,
-3.382257, 2, -5.801699,
-3.557889, 2, -6.086296,
-3.382257, 3, -5.801699,
-3.557889, 3, -6.086296
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
-3.909155, -3, -6.655489, 0, -0.5, 0.5, 0.5,
-3.909155, -3, -6.655489, 1, -0.5, 0.5, 0.5,
-3.909155, -3, -6.655489, 1, 1.5, 0.5, 0.5,
-3.909155, -3, -6.655489, 0, 1.5, 0.5, 0.5,
-3.909155, -2, -6.655489, 0, -0.5, 0.5, 0.5,
-3.909155, -2, -6.655489, 1, -0.5, 0.5, 0.5,
-3.909155, -2, -6.655489, 1, 1.5, 0.5, 0.5,
-3.909155, -2, -6.655489, 0, 1.5, 0.5, 0.5,
-3.909155, -1, -6.655489, 0, -0.5, 0.5, 0.5,
-3.909155, -1, -6.655489, 1, -0.5, 0.5, 0.5,
-3.909155, -1, -6.655489, 1, 1.5, 0.5, 0.5,
-3.909155, -1, -6.655489, 0, 1.5, 0.5, 0.5,
-3.909155, 0, -6.655489, 0, -0.5, 0.5, 0.5,
-3.909155, 0, -6.655489, 1, -0.5, 0.5, 0.5,
-3.909155, 0, -6.655489, 1, 1.5, 0.5, 0.5,
-3.909155, 0, -6.655489, 0, 1.5, 0.5, 0.5,
-3.909155, 1, -6.655489, 0, -0.5, 0.5, 0.5,
-3.909155, 1, -6.655489, 1, -0.5, 0.5, 0.5,
-3.909155, 1, -6.655489, 1, 1.5, 0.5, 0.5,
-3.909155, 1, -6.655489, 0, 1.5, 0.5, 0.5,
-3.909155, 2, -6.655489, 0, -0.5, 0.5, 0.5,
-3.909155, 2, -6.655489, 1, -0.5, 0.5, 0.5,
-3.909155, 2, -6.655489, 1, 1.5, 0.5, 0.5,
-3.909155, 2, -6.655489, 0, 1.5, 0.5, 0.5,
-3.909155, 3, -6.655489, 0, -0.5, 0.5, 0.5,
-3.909155, 3, -6.655489, 1, -0.5, 0.5, 0.5,
-3.909155, 3, -6.655489, 1, 1.5, 0.5, 0.5,
-3.909155, 3, -6.655489, 0, 1.5, 0.5, 0.5
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
-3.382257, -3.407189, -4,
-3.382257, -3.407189, 4,
-3.382257, -3.407189, -4,
-3.557889, -3.570902, -4,
-3.382257, -3.407189, -2,
-3.557889, -3.570902, -2,
-3.382257, -3.407189, 0,
-3.557889, -3.570902, 0,
-3.382257, -3.407189, 2,
-3.557889, -3.570902, 2,
-3.382257, -3.407189, 4,
-3.557889, -3.570902, 4
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
-3.909155, -3.898326, -4, 0, -0.5, 0.5, 0.5,
-3.909155, -3.898326, -4, 1, -0.5, 0.5, 0.5,
-3.909155, -3.898326, -4, 1, 1.5, 0.5, 0.5,
-3.909155, -3.898326, -4, 0, 1.5, 0.5, 0.5,
-3.909155, -3.898326, -2, 0, -0.5, 0.5, 0.5,
-3.909155, -3.898326, -2, 1, -0.5, 0.5, 0.5,
-3.909155, -3.898326, -2, 1, 1.5, 0.5, 0.5,
-3.909155, -3.898326, -2, 0, 1.5, 0.5, 0.5,
-3.909155, -3.898326, 0, 0, -0.5, 0.5, 0.5,
-3.909155, -3.898326, 0, 1, -0.5, 0.5, 0.5,
-3.909155, -3.898326, 0, 1, 1.5, 0.5, 0.5,
-3.909155, -3.898326, 0, 0, 1.5, 0.5, 0.5,
-3.909155, -3.898326, 2, 0, -0.5, 0.5, 0.5,
-3.909155, -3.898326, 2, 1, -0.5, 0.5, 0.5,
-3.909155, -3.898326, 2, 1, 1.5, 0.5, 0.5,
-3.909155, -3.898326, 2, 0, 1.5, 0.5, 0.5,
-3.909155, -3.898326, 4, 0, -0.5, 0.5, 0.5,
-3.909155, -3.898326, 4, 1, -0.5, 0.5, 0.5,
-3.909155, -3.898326, 4, 1, 1.5, 0.5, 0.5,
-3.909155, -3.898326, 4, 0, 1.5, 0.5, 0.5
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
-3.382257, -3.407189, -5.801699,
-3.382257, 3.141305, -5.801699,
-3.382257, -3.407189, 5.582163,
-3.382257, 3.141305, 5.582163,
-3.382257, -3.407189, -5.801699,
-3.382257, -3.407189, 5.582163,
-3.382257, 3.141305, -5.801699,
-3.382257, 3.141305, 5.582163,
-3.382257, -3.407189, -5.801699,
3.643044, -3.407189, -5.801699,
-3.382257, -3.407189, 5.582163,
3.643044, -3.407189, 5.582163,
-3.382257, 3.141305, -5.801699,
3.643044, 3.141305, -5.801699,
-3.382257, 3.141305, 5.582163,
3.643044, 3.141305, 5.582163,
3.643044, -3.407189, -5.801699,
3.643044, 3.141305, -5.801699,
3.643044, -3.407189, 5.582163,
3.643044, 3.141305, 5.582163,
3.643044, -3.407189, -5.801699,
3.643044, -3.407189, 5.582163,
3.643044, 3.141305, -5.801699,
3.643044, 3.141305, 5.582163
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
var radius = 7.953084;
var distance = 35.38417;
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
mvMatrix.translate( -0.1303934, 0.132942, 0.1097679 );
mvMatrix.scale( 1.224009, 1.313131, 0.7553701 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.38417);
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
merphos<-read.table("merphos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-merphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'merphos' not found
```

```r
y<-merphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'merphos' not found
```

```r
z<-merphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'merphos' not found
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
-3.279947, -0.2543957, -2.747361, 0, 0, 1, 1, 1,
-2.808428, -1.614215, -2.022922, 1, 0, 0, 1, 1,
-2.79304, 0.1372174, -0.9439762, 1, 0, 0, 1, 1,
-2.767689, -0.2693247, -2.577173, 1, 0, 0, 1, 1,
-2.635706, 0.650788, -1.64816, 1, 0, 0, 1, 1,
-2.392386, -0.989441, -1.870712, 1, 0, 0, 1, 1,
-2.223124, 1.842447, -1.253176, 0, 0, 0, 1, 1,
-2.204875, 0.243298, -1.546239, 0, 0, 0, 1, 1,
-2.200499, 1.718809, 0.6110054, 0, 0, 0, 1, 1,
-2.136345, 2.488735, -0.4442916, 0, 0, 0, 1, 1,
-2.113203, 0.8130339, -1.417932, 0, 0, 0, 1, 1,
-2.107325, 0.1929528, -0.9635742, 0, 0, 0, 1, 1,
-2.099182, 0.8531187, -0.8190816, 0, 0, 0, 1, 1,
-2.043386, -2.38366, -0.9886891, 1, 1, 1, 1, 1,
-2.02462, -1.084652, -1.96994, 1, 1, 1, 1, 1,
-2.017861, -0.2918206, -0.9211137, 1, 1, 1, 1, 1,
-1.998139, -1.033663, -2.57669, 1, 1, 1, 1, 1,
-1.995888, 0.799718, -1.133606, 1, 1, 1, 1, 1,
-1.981734, -0.2777742, -1.737219, 1, 1, 1, 1, 1,
-1.95954, -0.02671075, -1.262621, 1, 1, 1, 1, 1,
-1.948124, 1.487329, -2.245703, 1, 1, 1, 1, 1,
-1.945745, -1.140905, -2.637034, 1, 1, 1, 1, 1,
-1.939207, -1.690593, -2.820597, 1, 1, 1, 1, 1,
-1.935423, 1.158891, -0.6650705, 1, 1, 1, 1, 1,
-1.920436, -1.759813, -3.200256, 1, 1, 1, 1, 1,
-1.91746, 0.3042576, -1.345425, 1, 1, 1, 1, 1,
-1.890575, -0.1693491, 0.1545507, 1, 1, 1, 1, 1,
-1.880708, -0.1521129, -0.7835621, 1, 1, 1, 1, 1,
-1.877026, 0.5863218, -0.9959634, 0, 0, 1, 1, 1,
-1.837619, -1.455626, -1.939283, 1, 0, 0, 1, 1,
-1.752733, -0.1991676, -2.451758, 1, 0, 0, 1, 1,
-1.720946, -0.8944508, -1.749198, 1, 0, 0, 1, 1,
-1.677128, -0.3374724, -1.844986, 1, 0, 0, 1, 1,
-1.665682, -1.009885, -1.03366, 1, 0, 0, 1, 1,
-1.663582, 1.137491, -1.847203, 0, 0, 0, 1, 1,
-1.659325, -0.8910927, -0.7888116, 0, 0, 0, 1, 1,
-1.649967, -0.1384507, -1.490269, 0, 0, 0, 1, 1,
-1.646704, -0.8242236, -3.888509, 0, 0, 0, 1, 1,
-1.643492, -0.6255497, -2.468033, 0, 0, 0, 1, 1,
-1.616818, -1.331085, -1.129693, 0, 0, 0, 1, 1,
-1.586473, -0.7376209, -1.176727, 0, 0, 0, 1, 1,
-1.578739, 0.1519623, -0.7081493, 1, 1, 1, 1, 1,
-1.566944, 0.9477823, -0.7411819, 1, 1, 1, 1, 1,
-1.560734, 0.5818151, -0.5015475, 1, 1, 1, 1, 1,
-1.560526, -0.01787128, -2.201845, 1, 1, 1, 1, 1,
-1.554917, -0.9746881, -2.857579, 1, 1, 1, 1, 1,
-1.530175, -1.123509, -2.843071, 1, 1, 1, 1, 1,
-1.521427, -0.3491948, -2.829321, 1, 1, 1, 1, 1,
-1.519889, -0.2172698, -2.066208, 1, 1, 1, 1, 1,
-1.513923, 0.5428673, -1.003675, 1, 1, 1, 1, 1,
-1.500576, -2.156057, -4.904363, 1, 1, 1, 1, 1,
-1.495859, 0.06256863, -1.518115, 1, 1, 1, 1, 1,
-1.494496, 0.8110994, -0.580546, 1, 1, 1, 1, 1,
-1.487496, -0.9420423, -1.608334, 1, 1, 1, 1, 1,
-1.485517, -0.9047678, -2.021837, 1, 1, 1, 1, 1,
-1.472193, -1.678606, -1.834719, 1, 1, 1, 1, 1,
-1.458909, 0.3084829, -1.820884, 0, 0, 1, 1, 1,
-1.455611, -1.639214, -1.251393, 1, 0, 0, 1, 1,
-1.452015, 0.1643467, -1.701163, 1, 0, 0, 1, 1,
-1.45102, -0.08166222, -0.509883, 1, 0, 0, 1, 1,
-1.449775, -0.1629761, -1.480279, 1, 0, 0, 1, 1,
-1.443864, 0.4095888, 0.6877778, 1, 0, 0, 1, 1,
-1.425724, -0.8679981, -3.117857, 0, 0, 0, 1, 1,
-1.424887, 0.6843954, 0.417753, 0, 0, 0, 1, 1,
-1.424371, -0.3808905, -3.373743, 0, 0, 0, 1, 1,
-1.420979, 0.2701212, -0.9108745, 0, 0, 0, 1, 1,
-1.410231, -0.08318098, -1.593212, 0, 0, 0, 1, 1,
-1.405896, -0.5839375, -4.794637, 0, 0, 0, 1, 1,
-1.402957, -0.5530745, -0.8018358, 0, 0, 0, 1, 1,
-1.383481, 1.009081, -0.9213424, 1, 1, 1, 1, 1,
-1.380674, 0.3243608, -1.054705, 1, 1, 1, 1, 1,
-1.374436, -0.8524777, -0.4758994, 1, 1, 1, 1, 1,
-1.374015, -1.021552, -0.02661898, 1, 1, 1, 1, 1,
-1.372528, 1.115175, -0.5504599, 1, 1, 1, 1, 1,
-1.365666, -0.09371348, -1.110597, 1, 1, 1, 1, 1,
-1.359906, -0.7960144, -2.877135, 1, 1, 1, 1, 1,
-1.359701, 1.009828, -0.5724693, 1, 1, 1, 1, 1,
-1.356352, 0.2894154, -1.329236, 1, 1, 1, 1, 1,
-1.350571, 0.2640154, -1.71646, 1, 1, 1, 1, 1,
-1.35051, -0.1875843, -0.8083155, 1, 1, 1, 1, 1,
-1.348594, -0.5018095, -2.751386, 1, 1, 1, 1, 1,
-1.348524, -0.3746946, -3.121938, 1, 1, 1, 1, 1,
-1.347413, -0.4549067, -1.560194, 1, 1, 1, 1, 1,
-1.339383, 2.90594, -1.046127, 1, 1, 1, 1, 1,
-1.331648, -0.7831036, -2.297299, 0, 0, 1, 1, 1,
-1.330755, -0.6140327, -1.838306, 1, 0, 0, 1, 1,
-1.323177, 1.566593, -1.566016, 1, 0, 0, 1, 1,
-1.318951, -0.5266823, -2.703069, 1, 0, 0, 1, 1,
-1.310987, 0.1132854, -2.052768, 1, 0, 0, 1, 1,
-1.304331, 0.4283158, -0.3356007, 1, 0, 0, 1, 1,
-1.2935, 1.48862, -0.8406335, 0, 0, 0, 1, 1,
-1.288775, -0.3148631, -1.963158, 0, 0, 0, 1, 1,
-1.283391, 2.243858, -0.2690755, 0, 0, 0, 1, 1,
-1.282301, -1.023123, -1.711613, 0, 0, 0, 1, 1,
-1.281019, 0.06228481, -2.163139, 0, 0, 0, 1, 1,
-1.278191, -0.1230106, -1.66591, 0, 0, 0, 1, 1,
-1.277642, 0.7153277, -0.6923921, 0, 0, 0, 1, 1,
-1.273784, -0.531987, -2.544474, 1, 1, 1, 1, 1,
-1.272728, -0.7248142, -1.124714, 1, 1, 1, 1, 1,
-1.271406, -0.3413355, -1.502928, 1, 1, 1, 1, 1,
-1.26955, 0.4673686, 1.648567, 1, 1, 1, 1, 1,
-1.265951, -0.0596948, -1.702522, 1, 1, 1, 1, 1,
-1.259831, -0.45634, -0.3574823, 1, 1, 1, 1, 1,
-1.256079, 2.342213, -0.3809692, 1, 1, 1, 1, 1,
-1.249562, 0.4646893, -0.6895705, 1, 1, 1, 1, 1,
-1.245529, 0.4450343, 1.66019, 1, 1, 1, 1, 1,
-1.24467, 0.8849381, -0.8116097, 1, 1, 1, 1, 1,
-1.24068, -0.7115316, 0.4013591, 1, 1, 1, 1, 1,
-1.234018, -0.3214517, -1.852793, 1, 1, 1, 1, 1,
-1.2329, -0.587275, -1.863199, 1, 1, 1, 1, 1,
-1.227251, 1.583055, -1.022785, 1, 1, 1, 1, 1,
-1.227134, 1.780533, 0.08584303, 1, 1, 1, 1, 1,
-1.21746, 0.7491978, -2.029664, 0, 0, 1, 1, 1,
-1.214543, 0.8610728, -1.638231, 1, 0, 0, 1, 1,
-1.20631, 0.1714816, -1.497375, 1, 0, 0, 1, 1,
-1.205446, -0.04726141, -2.317929, 1, 0, 0, 1, 1,
-1.19647, -1.719183, -2.354193, 1, 0, 0, 1, 1,
-1.19593, -1.185229, -0.6580192, 1, 0, 0, 1, 1,
-1.183777, -0.4133262, -1.352074, 0, 0, 0, 1, 1,
-1.178953, 1.617401, -1.499551, 0, 0, 0, 1, 1,
-1.17724, -0.1584721, -2.119083, 0, 0, 0, 1, 1,
-1.169354, -0.1357192, -3.664433, 0, 0, 0, 1, 1,
-1.166533, -0.2651895, -1.523835, 0, 0, 0, 1, 1,
-1.158159, 0.7406871, -1.572613, 0, 0, 0, 1, 1,
-1.154671, 0.7261608, -2.632102, 0, 0, 0, 1, 1,
-1.152232, 1.101032, 1.00121, 1, 1, 1, 1, 1,
-1.145083, -0.4179577, -2.135708, 1, 1, 1, 1, 1,
-1.135886, 1.398815, -1.641899, 1, 1, 1, 1, 1,
-1.132766, -1.553918, -2.976258, 1, 1, 1, 1, 1,
-1.122304, -1.59343, -2.998818, 1, 1, 1, 1, 1,
-1.116872, 0.4884108, -0.07073982, 1, 1, 1, 1, 1,
-1.111057, 2.4291, -1.539328, 1, 1, 1, 1, 1,
-1.109553, -0.7609656, -1.13254, 1, 1, 1, 1, 1,
-1.103959, 1.602108, 0.223805, 1, 1, 1, 1, 1,
-1.091154, -1.687425, -1.246764, 1, 1, 1, 1, 1,
-1.088251, -0.1777023, -1.665115, 1, 1, 1, 1, 1,
-1.084003, -0.1353506, -3.263431, 1, 1, 1, 1, 1,
-1.083238, 1.139439, -0.2639277, 1, 1, 1, 1, 1,
-1.080942, 0.1386372, -0.7905723, 1, 1, 1, 1, 1,
-1.071596, 0.5860708, -2.192692, 1, 1, 1, 1, 1,
-1.068694, -0.104569, -0.3155384, 0, 0, 1, 1, 1,
-1.062524, 0.1795042, -0.1272727, 1, 0, 0, 1, 1,
-1.061178, 1.264575, -1.986574, 1, 0, 0, 1, 1,
-1.057257, 1.121631, -1.617681, 1, 0, 0, 1, 1,
-1.056947, 1.157505, -1.397481, 1, 0, 0, 1, 1,
-1.055842, 1.47941, -0.4379826, 1, 0, 0, 1, 1,
-1.053421, -0.7448247, -3.667147, 0, 0, 0, 1, 1,
-1.051985, 2.66055, 0.2105026, 0, 0, 0, 1, 1,
-1.046063, 1.277288, -0.07597613, 0, 0, 0, 1, 1,
-1.043978, -1.808405, -4.473143, 0, 0, 0, 1, 1,
-1.043044, 0.9703504, -1.775754, 0, 0, 0, 1, 1,
-1.041867, 1.467347, -2.241568, 0, 0, 0, 1, 1,
-1.040816, -1.105509, -3.813903, 0, 0, 0, 1, 1,
-1.040322, 0.6587872, -0.832396, 1, 1, 1, 1, 1,
-1.036741, 1.01331, 1.13167, 1, 1, 1, 1, 1,
-1.034548, -1.432228, -1.819894, 1, 1, 1, 1, 1,
-1.029833, -0.01287528, -2.372454, 1, 1, 1, 1, 1,
-1.028238, -0.4800214, -1.778799, 1, 1, 1, 1, 1,
-1.024836, -0.7126191, -2.829731, 1, 1, 1, 1, 1,
-1.024749, 0.2407663, -0.008286975, 1, 1, 1, 1, 1,
-1.024341, 0.6732707, -2.725181, 1, 1, 1, 1, 1,
-1.023756, 0.3584991, -1.973031, 1, 1, 1, 1, 1,
-1.013829, -0.5948175, -2.164141, 1, 1, 1, 1, 1,
-1.007771, -0.7218533, -1.72205, 1, 1, 1, 1, 1,
-1.003415, -0.1571688, 0.7947896, 1, 1, 1, 1, 1,
-1.003287, -1.110993, -2.330024, 1, 1, 1, 1, 1,
-1.002173, -2.682695, -2.805985, 1, 1, 1, 1, 1,
-0.9992154, 0.6547948, -1.132619, 1, 1, 1, 1, 1,
-0.9973809, 2.145972, -0.6872516, 0, 0, 1, 1, 1,
-0.996515, -0.9687776, -1.166278, 1, 0, 0, 1, 1,
-0.9898297, -0.2231114, -1.245254, 1, 0, 0, 1, 1,
-0.9896942, -1.574666, -1.677539, 1, 0, 0, 1, 1,
-0.9852187, -2.459513, -2.246847, 1, 0, 0, 1, 1,
-0.9787259, 1.558664, -1.188346, 1, 0, 0, 1, 1,
-0.972837, -1.460586, -3.426028, 0, 0, 0, 1, 1,
-0.971943, -0.1062648, -1.76663, 0, 0, 0, 1, 1,
-0.9713846, -0.2126004, -1.240571, 0, 0, 0, 1, 1,
-0.970595, -0.6881555, -2.117742, 0, 0, 0, 1, 1,
-0.9613656, -0.08374999, -1.307752, 0, 0, 0, 1, 1,
-0.9568698, -2.383752, -2.781862, 0, 0, 0, 1, 1,
-0.9531754, -0.2329741, -1.140973, 0, 0, 0, 1, 1,
-0.9529474, -0.2144275, -1.392722, 1, 1, 1, 1, 1,
-0.9326558, -1.019664, -1.76579, 1, 1, 1, 1, 1,
-0.9321951, -1.475188, -2.902144, 1, 1, 1, 1, 1,
-0.9246531, 0.8583732, 1.059649, 1, 1, 1, 1, 1,
-0.9242288, -1.332777, -1.526003, 1, 1, 1, 1, 1,
-0.9221614, 1.135154, -1.357778, 1, 1, 1, 1, 1,
-0.9167103, -0.09985316, -3.350369, 1, 1, 1, 1, 1,
-0.9018904, -1.054741, -3.024863, 1, 1, 1, 1, 1,
-0.8989598, 0.07700679, 0.9280618, 1, 1, 1, 1, 1,
-0.891008, -0.5310287, -3.147964, 1, 1, 1, 1, 1,
-0.8896059, -1.238767, -1.278796, 1, 1, 1, 1, 1,
-0.8761408, 0.4697702, -0.8265137, 1, 1, 1, 1, 1,
-0.8657791, -0.09982549, -1.943816, 1, 1, 1, 1, 1,
-0.8603479, -1.205806, -3.267592, 1, 1, 1, 1, 1,
-0.857899, -0.6879796, -1.622548, 1, 1, 1, 1, 1,
-0.8552011, -0.04668202, -0.4205497, 0, 0, 1, 1, 1,
-0.8543418, 0.6985832, -0.8837254, 1, 0, 0, 1, 1,
-0.8530822, 1.96305, -0.6142226, 1, 0, 0, 1, 1,
-0.8530006, -0.5184876, -1.26213, 1, 0, 0, 1, 1,
-0.8526688, 0.4095872, -1.494985, 1, 0, 0, 1, 1,
-0.8520383, -0.7326889, -3.30471, 1, 0, 0, 1, 1,
-0.8520277, 1.190001, -1.220238, 0, 0, 0, 1, 1,
-0.8515698, -2.01568, -4.187727, 0, 0, 0, 1, 1,
-0.8508551, -0.9270118, -1.817636, 0, 0, 0, 1, 1,
-0.833954, 0.8504989, -1.145823, 0, 0, 0, 1, 1,
-0.8279661, 1.32642, -1.142085, 0, 0, 0, 1, 1,
-0.823256, 0.5310229, -0.09787852, 0, 0, 0, 1, 1,
-0.8151794, 1.00227, -0.4908393, 0, 0, 0, 1, 1,
-0.8144235, 0.7298369, 0.1327372, 1, 1, 1, 1, 1,
-0.8069739, 0.05442709, -0.5174161, 1, 1, 1, 1, 1,
-0.8005904, 0.755908, -1.095914, 1, 1, 1, 1, 1,
-0.7990673, 0.3259766, -1.103253, 1, 1, 1, 1, 1,
-0.7986662, 0.803877, -0.5024875, 1, 1, 1, 1, 1,
-0.7956124, 1.494888, 0.4689656, 1, 1, 1, 1, 1,
-0.7929698, -1.042661, -5.462272, 1, 1, 1, 1, 1,
-0.7904475, -0.02567971, -2.209545, 1, 1, 1, 1, 1,
-0.7883937, 1.39231, -0.8882386, 1, 1, 1, 1, 1,
-0.7751869, -1.726486, -1.135188, 1, 1, 1, 1, 1,
-0.7729315, 0.08078676, -1.727443, 1, 1, 1, 1, 1,
-0.7728058, 2.038171, 0.8956709, 1, 1, 1, 1, 1,
-0.7705827, -1.189622, -2.587748, 1, 1, 1, 1, 1,
-0.7640166, -1.192505, -2.29791, 1, 1, 1, 1, 1,
-0.76065, 0.718848, -1.620689, 1, 1, 1, 1, 1,
-0.7574821, -0.570332, -2.543739, 0, 0, 1, 1, 1,
-0.7533876, -0.5849527, -1.795279, 1, 0, 0, 1, 1,
-0.7513799, -0.3910674, -3.064104, 1, 0, 0, 1, 1,
-0.7497906, 0.508573, -0.1564209, 1, 0, 0, 1, 1,
-0.7399263, -1.001396, -3.092896, 1, 0, 0, 1, 1,
-0.7394719, 0.2621323, -0.8877373, 1, 0, 0, 1, 1,
-0.7339082, 0.2276179, -3.262267, 0, 0, 0, 1, 1,
-0.7245924, 0.6506438, -0.4947784, 0, 0, 0, 1, 1,
-0.7236738, -0.8354689, -1.301497, 0, 0, 0, 1, 1,
-0.7184846, -0.4973471, -4.699491, 0, 0, 0, 1, 1,
-0.7165889, -1.019389, -3.561413, 0, 0, 0, 1, 1,
-0.712969, -0.7112671, -1.742437, 0, 0, 0, 1, 1,
-0.7112603, 0.7491075, 0.01232927, 0, 0, 0, 1, 1,
-0.7108239, 0.1616789, -2.632425, 1, 1, 1, 1, 1,
-0.709712, 0.2086368, -0.9825252, 1, 1, 1, 1, 1,
-0.707767, -0.2578929, -0.9953796, 1, 1, 1, 1, 1,
-0.7062367, -0.4962379, -1.964547, 1, 1, 1, 1, 1,
-0.7047556, -0.3366557, -2.047006, 1, 1, 1, 1, 1,
-0.7045721, -0.6575401, -4.095881, 1, 1, 1, 1, 1,
-0.7038416, 0.839125, -0.6118702, 1, 1, 1, 1, 1,
-0.7036576, -1.059052, -3.48331, 1, 1, 1, 1, 1,
-0.7003585, 0.1846102, 0.1562833, 1, 1, 1, 1, 1,
-0.7001327, 1.895087, -0.7292494, 1, 1, 1, 1, 1,
-0.6954641, 0.1894196, 0.6568897, 1, 1, 1, 1, 1,
-0.6910958, 1.114202, -1.342788, 1, 1, 1, 1, 1,
-0.6869496, 0.9020187, 0.4837482, 1, 1, 1, 1, 1,
-0.6860866, 0.5400093, -0.9858627, 1, 1, 1, 1, 1,
-0.6712645, 2.112417, -0.5984774, 1, 1, 1, 1, 1,
-0.6707484, -0.1966673, -2.297952, 0, 0, 1, 1, 1,
-0.6689703, 1.769561, 0.9417977, 1, 0, 0, 1, 1,
-0.6654769, 0.9167965, -1.233071, 1, 0, 0, 1, 1,
-0.6631146, -0.8185583, -3.864302, 1, 0, 0, 1, 1,
-0.6625754, -0.2866023, 0.399202, 1, 0, 0, 1, 1,
-0.6603534, 1.376461, -0.9012215, 1, 0, 0, 1, 1,
-0.6597252, 0.7188919, -0.9949263, 0, 0, 0, 1, 1,
-0.6542544, -0.938897, -3.508536, 0, 0, 0, 1, 1,
-0.6530877, -2.36549, -0.6197053, 0, 0, 0, 1, 1,
-0.6501212, -0.4059195, -3.971549, 0, 0, 0, 1, 1,
-0.6481597, -1.639818, -3.80559, 0, 0, 0, 1, 1,
-0.6471897, -1.294252, -3.598576, 0, 0, 0, 1, 1,
-0.641394, 0.358919, -0.5682488, 0, 0, 0, 1, 1,
-0.6314012, -0.7241976, -3.672848, 1, 1, 1, 1, 1,
-0.6231472, -0.5919917, 0.5857782, 1, 1, 1, 1, 1,
-0.6218358, 1.624914, -0.6472234, 1, 1, 1, 1, 1,
-0.6172895, 0.03961899, 0.001093325, 1, 1, 1, 1, 1,
-0.6134951, -0.1582804, -2.964472, 1, 1, 1, 1, 1,
-0.6067132, 0.8778682, 0.5955526, 1, 1, 1, 1, 1,
-0.6042093, -1.295717, -3.675292, 1, 1, 1, 1, 1,
-0.6041825, 0.8297538, -0.8976178, 1, 1, 1, 1, 1,
-0.6036814, -0.5389804, -1.932994, 1, 1, 1, 1, 1,
-0.6032541, -0.550133, -2.375442, 1, 1, 1, 1, 1,
-0.6010619, -0.2613937, -1.957472, 1, 1, 1, 1, 1,
-0.6001442, 0.8621728, -0.1607019, 1, 1, 1, 1, 1,
-0.5965576, -0.2661422, -1.428146, 1, 1, 1, 1, 1,
-0.5909701, -0.6228677, -3.191882, 1, 1, 1, 1, 1,
-0.5907602, -0.6812468, -0.3379006, 1, 1, 1, 1, 1,
-0.5886663, -0.08597463, -1.538573, 0, 0, 1, 1, 1,
-0.5840198, 0.4721552, -0.1445731, 1, 0, 0, 1, 1,
-0.5833026, 0.7219354, -1.955084, 1, 0, 0, 1, 1,
-0.5791103, -0.1442811, -1.840539, 1, 0, 0, 1, 1,
-0.5788429, -2.022902, -2.625784, 1, 0, 0, 1, 1,
-0.5779796, -0.1902841, -1.211355, 1, 0, 0, 1, 1,
-0.5771582, -0.2238773, -3.371594, 0, 0, 0, 1, 1,
-0.5723327, 0.3022122, -0.996048, 0, 0, 0, 1, 1,
-0.5654874, 2.108767, 0.6314434, 0, 0, 0, 1, 1,
-0.5639709, -0.7868914, -1.995313, 0, 0, 0, 1, 1,
-0.5540518, -0.008730522, -0.9360251, 0, 0, 0, 1, 1,
-0.5537707, -0.2986205, -0.4179663, 0, 0, 0, 1, 1,
-0.5482883, -0.4332375, -2.146771, 0, 0, 0, 1, 1,
-0.5452216, 0.6338417, -2.770594, 1, 1, 1, 1, 1,
-0.5410746, 1.769574, 1.116085, 1, 1, 1, 1, 1,
-0.5398899, 1.79329, -0.04496972, 1, 1, 1, 1, 1,
-0.5339339, -1.761838, -3.52594, 1, 1, 1, 1, 1,
-0.531591, -0.8926789, -0.5453333, 1, 1, 1, 1, 1,
-0.5297113, 1.029269, -0.4820202, 1, 1, 1, 1, 1,
-0.5295273, 1.595003, -1.312007, 1, 1, 1, 1, 1,
-0.5277349, -0.4013432, -2.480071, 1, 1, 1, 1, 1,
-0.5264515, 1.336818, 0.1066022, 1, 1, 1, 1, 1,
-0.5253797, -0.5152009, -0.5484374, 1, 1, 1, 1, 1,
-0.5160748, -1.082227, -3.027861, 1, 1, 1, 1, 1,
-0.5132411, -1.263285, -1.307198, 1, 1, 1, 1, 1,
-0.5131735, -0.7634792, -1.447156, 1, 1, 1, 1, 1,
-0.5110981, -0.9328337, -3.285401, 1, 1, 1, 1, 1,
-0.5089441, 0.5839418, -1.71896, 1, 1, 1, 1, 1,
-0.5067593, 0.3264912, -1.852508, 0, 0, 1, 1, 1,
-0.5065185, 0.9660652, -1.125528, 1, 0, 0, 1, 1,
-0.5058718, -0.2763728, -2.742756, 1, 0, 0, 1, 1,
-0.5025523, 1.53042, -1.125178, 1, 0, 0, 1, 1,
-0.4974693, -0.6680121, -1.939805, 1, 0, 0, 1, 1,
-0.4949609, 1.800124, 0.2423947, 1, 0, 0, 1, 1,
-0.4917399, -0.0004892897, -1.805659, 0, 0, 0, 1, 1,
-0.4900027, 1.329024, -1.93472, 0, 0, 0, 1, 1,
-0.4863127, 0.2361184, -1.431619, 0, 0, 0, 1, 1,
-0.484245, 0.8092178, 0.2677041, 0, 0, 0, 1, 1,
-0.4789786, -0.3458538, -3.109405, 0, 0, 0, 1, 1,
-0.4787578, 0.6840233, 1.019397, 0, 0, 0, 1, 1,
-0.4740418, -0.4338772, -2.751401, 0, 0, 0, 1, 1,
-0.4730754, -0.5124805, -1.670482, 1, 1, 1, 1, 1,
-0.47009, -0.2780473, -1.085016, 1, 1, 1, 1, 1,
-0.4693539, 1.882221, -1.408196, 1, 1, 1, 1, 1,
-0.4671531, -0.09862671, -2.193539, 1, 1, 1, 1, 1,
-0.4649928, 0.1662769, -2.340236, 1, 1, 1, 1, 1,
-0.4620519, 0.8915995, -1.069303, 1, 1, 1, 1, 1,
-0.4612665, 2.237405, 1.602868, 1, 1, 1, 1, 1,
-0.4607952, 0.9660274, -0.4253312, 1, 1, 1, 1, 1,
-0.4575862, 0.9722334, -1.226288, 1, 1, 1, 1, 1,
-0.4553576, -0.1283693, -3.762784, 1, 1, 1, 1, 1,
-0.4505994, -0.7965566, -3.001174, 1, 1, 1, 1, 1,
-0.4488958, -2.095377, -4.002431, 1, 1, 1, 1, 1,
-0.4477994, -1.625742, -2.725465, 1, 1, 1, 1, 1,
-0.4439324, -0.502101, -3.447827, 1, 1, 1, 1, 1,
-0.4430753, 1.093543, -1.331504, 1, 1, 1, 1, 1,
-0.4419975, 0.7779696, 0.5443152, 0, 0, 1, 1, 1,
-0.4374984, 1.305988, -0.1121822, 1, 0, 0, 1, 1,
-0.4347273, -2.647303, -3.41013, 1, 0, 0, 1, 1,
-0.4344131, -0.1677248, -0.9551066, 1, 0, 0, 1, 1,
-0.4302177, -0.6403619, -3.387706, 1, 0, 0, 1, 1,
-0.4244097, -1.484966, -2.293335, 1, 0, 0, 1, 1,
-0.421694, 0.2441214, 0.3025028, 0, 0, 0, 1, 1,
-0.4192868, 3.045939, 1.676159, 0, 0, 0, 1, 1,
-0.4185591, 1.413385, 0.2649959, 0, 0, 0, 1, 1,
-0.4177067, -0.780759, -2.264052, 0, 0, 0, 1, 1,
-0.4170845, 0.4300643, -2.153536, 0, 0, 0, 1, 1,
-0.4165105, -0.5943964, -2.243021, 0, 0, 0, 1, 1,
-0.4151697, 0.09482574, -1.019771, 0, 0, 0, 1, 1,
-0.4095683, 0.293823, 0.192925, 1, 1, 1, 1, 1,
-0.4068964, 1.994879, 0.5733873, 1, 1, 1, 1, 1,
-0.4064435, 1.092574, -2.395701, 1, 1, 1, 1, 1,
-0.4031437, -1.155221, -2.002698, 1, 1, 1, 1, 1,
-0.4011444, 0.2110923, -2.359624, 1, 1, 1, 1, 1,
-0.3988793, -1.65042, -4.062736, 1, 1, 1, 1, 1,
-0.39868, -0.3171112, -1.624364, 1, 1, 1, 1, 1,
-0.3966287, 0.4635771, -0.5081041, 1, 1, 1, 1, 1,
-0.385225, 1.481793, -1.673084, 1, 1, 1, 1, 1,
-0.3774873, 0.139391, -0.05510622, 1, 1, 1, 1, 1,
-0.3760636, 1.076732, 1.282804, 1, 1, 1, 1, 1,
-0.3755571, 0.02743646, -1.808904, 1, 1, 1, 1, 1,
-0.3746943, 0.6614917, -1.434893, 1, 1, 1, 1, 1,
-0.3679519, 0.007472274, -0.8066702, 1, 1, 1, 1, 1,
-0.3657061, -1.313544, -2.158557, 1, 1, 1, 1, 1,
-0.3635386, -2.314841, -4.158553, 0, 0, 1, 1, 1,
-0.360365, 0.3594021, -0.4609301, 1, 0, 0, 1, 1,
-0.3592447, -1.174194, -2.134766, 1, 0, 0, 1, 1,
-0.3591823, 0.8664803, 0.3530309, 1, 0, 0, 1, 1,
-0.3590937, 2.533179, 1.760548, 1, 0, 0, 1, 1,
-0.3590483, 1.158316, -1.047374, 1, 0, 0, 1, 1,
-0.3533115, -0.8085142, -3.56158, 0, 0, 0, 1, 1,
-0.3511229, 0.1740232, -0.893534, 0, 0, 0, 1, 1,
-0.3507245, -2.476992, -5.386392, 0, 0, 0, 1, 1,
-0.3506615, -0.0407363, -1.832993, 0, 0, 0, 1, 1,
-0.3498649, 1.285767, 1.248859, 0, 0, 0, 1, 1,
-0.3477135, 0.645196, -1.413811, 0, 0, 0, 1, 1,
-0.3462641, -0.4795431, -2.810303, 0, 0, 0, 1, 1,
-0.3460789, 0.005176946, -1.046021, 1, 1, 1, 1, 1,
-0.3459141, 0.2961137, -0.7213261, 1, 1, 1, 1, 1,
-0.3416467, -0.1283182, -1.665098, 1, 1, 1, 1, 1,
-0.3380714, -1.715518, -3.144041, 1, 1, 1, 1, 1,
-0.3357013, -0.6431021, -2.344251, 1, 1, 1, 1, 1,
-0.3355935, -0.2165214, -2.40147, 1, 1, 1, 1, 1,
-0.335329, -0.2966434, -0.647637, 1, 1, 1, 1, 1,
-0.3342687, -1.010652, -4.347774, 1, 1, 1, 1, 1,
-0.3342275, 1.042677, -0.42821, 1, 1, 1, 1, 1,
-0.3320021, -0.8612308, -1.916435, 1, 1, 1, 1, 1,
-0.3304229, -0.6774704, -1.925307, 1, 1, 1, 1, 1,
-0.3294402, 1.044259, -0.7539622, 1, 1, 1, 1, 1,
-0.3243299, 0.1548684, -2.029781, 1, 1, 1, 1, 1,
-0.3211628, 1.962039, -0.4704235, 1, 1, 1, 1, 1,
-0.3165959, 1.042592, -1.059963, 1, 1, 1, 1, 1,
-0.3118817, -0.6615047, -2.834777, 0, 0, 1, 1, 1,
-0.3100552, -0.08343459, -1.155657, 1, 0, 0, 1, 1,
-0.3086155, -0.2217127, -3.463455, 1, 0, 0, 1, 1,
-0.3085985, 1.187116, -2.74807, 1, 0, 0, 1, 1,
-0.3076359, -0.4871383, -1.227124, 1, 0, 0, 1, 1,
-0.3016955, -2.227368, -3.023063, 1, 0, 0, 1, 1,
-0.3016934, 0.796173, -1.487534, 0, 0, 0, 1, 1,
-0.2960434, -0.2449861, -0.7712407, 0, 0, 0, 1, 1,
-0.2934351, -1.095843, -1.942927, 0, 0, 0, 1, 1,
-0.2831441, -0.04858568, -2.337373, 0, 0, 0, 1, 1,
-0.2830896, 0.4438167, 0.4683027, 0, 0, 0, 1, 1,
-0.2811719, -2.000016, -0.9667007, 0, 0, 0, 1, 1,
-0.2743588, -1.137854, -3.766876, 0, 0, 0, 1, 1,
-0.2741012, -0.7704559, -3.293631, 1, 1, 1, 1, 1,
-0.2717226, -0.4006742, -1.81096, 1, 1, 1, 1, 1,
-0.2680112, 0.758915, 0.8634214, 1, 1, 1, 1, 1,
-0.2670589, 0.1363293, -0.6929606, 1, 1, 1, 1, 1,
-0.263891, 1.513778, -1.319319, 1, 1, 1, 1, 1,
-0.2556629, 0.755686, 0.7233449, 1, 1, 1, 1, 1,
-0.2503614, -0.7535428, -2.666687, 1, 1, 1, 1, 1,
-0.246198, -0.2331715, -2.319639, 1, 1, 1, 1, 1,
-0.2437728, -1.089489, -1.71109, 1, 1, 1, 1, 1,
-0.2426095, 1.250349, -0.5005993, 1, 1, 1, 1, 1,
-0.2311899, 0.4051437, -0.9522604, 1, 1, 1, 1, 1,
-0.2305508, 0.0765958, -0.2631691, 1, 1, 1, 1, 1,
-0.2286766, 1.222919, 0.6823978, 1, 1, 1, 1, 1,
-0.2238995, 0.9652157, 1.241608, 1, 1, 1, 1, 1,
-0.2232199, 1.136208, -0.2692724, 1, 1, 1, 1, 1,
-0.2208244, 0.8600097, 0.3536723, 0, 0, 1, 1, 1,
-0.2196687, 0.8311464, -0.2530917, 1, 0, 0, 1, 1,
-0.2196677, 0.8898263, 0.829978, 1, 0, 0, 1, 1,
-0.2194569, 1.209532, -0.9802579, 1, 0, 0, 1, 1,
-0.2154843, -0.756815, -3.156029, 1, 0, 0, 1, 1,
-0.214006, 1.493056, 1.048476, 1, 0, 0, 1, 1,
-0.2124375, 1.746122, -0.5451042, 0, 0, 0, 1, 1,
-0.2105738, 0.4611668, -0.01059786, 0, 0, 0, 1, 1,
-0.2104673, -0.3762051, -1.158984, 0, 0, 0, 1, 1,
-0.2095313, -0.9170384, -4.04247, 0, 0, 0, 1, 1,
-0.2077655, -1.597072, -3.865552, 0, 0, 0, 1, 1,
-0.2056921, 0.1755348, -0.1691997, 0, 0, 0, 1, 1,
-0.2002421, -1.091183, -4.311144, 0, 0, 0, 1, 1,
-0.1990866, 1.231441, 0.7039589, 1, 1, 1, 1, 1,
-0.1963558, 0.5879109, -2.057014, 1, 1, 1, 1, 1,
-0.193464, -0.3713787, -1.269597, 1, 1, 1, 1, 1,
-0.1915928, 0.8129119, -1.621167, 1, 1, 1, 1, 1,
-0.1908309, -1.25653, -2.142209, 1, 1, 1, 1, 1,
-0.1853375, -0.4273735, -2.191996, 1, 1, 1, 1, 1,
-0.1829772, -0.7818415, -3.089065, 1, 1, 1, 1, 1,
-0.1820798, 0.01967757, -0.4295608, 1, 1, 1, 1, 1,
-0.1813024, -1.726085, -2.689888, 1, 1, 1, 1, 1,
-0.1793306, -0.5911958, -2.498074, 1, 1, 1, 1, 1,
-0.1782417, 1.368108, -0.4990335, 1, 1, 1, 1, 1,
-0.1768028, 0.2859902, -0.4985726, 1, 1, 1, 1, 1,
-0.1736163, -0.7766367, -2.571611, 1, 1, 1, 1, 1,
-0.1714267, 0.3001894, 0.706908, 1, 1, 1, 1, 1,
-0.1712502, 1.0522, 0.07416269, 1, 1, 1, 1, 1,
-0.1666346, -0.5895413, -3.082055, 0, 0, 1, 1, 1,
-0.1622504, -0.4928304, -2.55404, 1, 0, 0, 1, 1,
-0.1622475, -0.5716577, -3.388269, 1, 0, 0, 1, 1,
-0.1600801, -1.820176, -1.134718, 1, 0, 0, 1, 1,
-0.1585005, -0.7228824, -5.173994, 1, 0, 0, 1, 1,
-0.157462, -0.4815831, -2.813727, 1, 0, 0, 1, 1,
-0.157312, 1.615337, -0.8680382, 0, 0, 0, 1, 1,
-0.1550712, -0.9495233, -2.802723, 0, 0, 0, 1, 1,
-0.1523068, -0.6250988, -3.839913, 0, 0, 0, 1, 1,
-0.1485279, -0.2617178, -2.6414, 0, 0, 0, 1, 1,
-0.1406971, -1.947819, -4.822982, 0, 0, 0, 1, 1,
-0.1339719, 0.9496247, 0.8203631, 0, 0, 0, 1, 1,
-0.1330684, -0.07332611, -1.963273, 0, 0, 0, 1, 1,
-0.1222005, 0.04471615, 0.7675864, 1, 1, 1, 1, 1,
-0.1182657, -1.372296, -2.021827, 1, 1, 1, 1, 1,
-0.1182074, 0.1094798, -0.1259302, 1, 1, 1, 1, 1,
-0.1167634, -0.009153866, -1.37017, 1, 1, 1, 1, 1,
-0.115469, 0.2625225, -0.1716179, 1, 1, 1, 1, 1,
-0.114198, 0.4594763, 0.3752061, 1, 1, 1, 1, 1,
-0.1140948, -0.911451, -4.412737, 1, 1, 1, 1, 1,
-0.1132407, -1.414047, -3.805103, 1, 1, 1, 1, 1,
-0.1071285, -0.04774896, -1.392314, 1, 1, 1, 1, 1,
-0.105682, -0.481125, -4.741694, 1, 1, 1, 1, 1,
-0.1055565, 0.7610726, 0.4807681, 1, 1, 1, 1, 1,
-0.1033093, 0.3589518, -0.1772106, 1, 1, 1, 1, 1,
-0.1031087, -0.05784455, -2.457936, 1, 1, 1, 1, 1,
-0.1011727, 0.7043029, -1.092709, 1, 1, 1, 1, 1,
-0.09672222, 0.7774264, 1.615786, 1, 1, 1, 1, 1,
-0.09359664, 0.1134131, -0.7520933, 0, 0, 1, 1, 1,
-0.0929291, 0.1331158, -1.115549, 1, 0, 0, 1, 1,
-0.09290738, 0.03680404, -1.184048, 1, 0, 0, 1, 1,
-0.09170496, -0.07610425, -3.115748, 1, 0, 0, 1, 1,
-0.08725228, 0.2015968, -0.1033274, 1, 0, 0, 1, 1,
-0.08547909, -1.006974, -2.861068, 1, 0, 0, 1, 1,
-0.08359463, -0.2076804, -2.548039, 0, 0, 0, 1, 1,
-0.08199023, 0.9739238, -0.8142355, 0, 0, 0, 1, 1,
-0.08164069, -1.139546, -3.661317, 0, 0, 0, 1, 1,
-0.08133722, -0.1877082, -1.844996, 0, 0, 0, 1, 1,
-0.0756319, -1.123446, -2.514729, 0, 0, 0, 1, 1,
-0.0755793, 1.478638, 0.5305868, 0, 0, 0, 1, 1,
-0.07512499, -0.1346098, -2.904965, 0, 0, 0, 1, 1,
-0.07376778, -0.6957309, -3.967944, 1, 1, 1, 1, 1,
-0.06967538, -1.214537, -2.649368, 1, 1, 1, 1, 1,
-0.06829264, 2.087883, 0.5576878, 1, 1, 1, 1, 1,
-0.0673387, 1.527682, -0.02212451, 1, 1, 1, 1, 1,
-0.05906691, -0.3623318, -1.572333, 1, 1, 1, 1, 1,
-0.0549639, -0.7647121, -3.311574, 1, 1, 1, 1, 1,
-0.04719357, -0.8640276, -5.145129, 1, 1, 1, 1, 1,
-0.04565613, 0.1656305, -0.2965338, 1, 1, 1, 1, 1,
-0.04390108, -0.1892025, -1.451883, 1, 1, 1, 1, 1,
-0.04195241, 0.5707138, -0.8038806, 1, 1, 1, 1, 1,
-0.04070628, 2.229386, 0.4042695, 1, 1, 1, 1, 1,
-0.03498437, 1.017579, -0.7773187, 1, 1, 1, 1, 1,
-0.03090151, -0.8027061, -5.635915, 1, 1, 1, 1, 1,
-0.02968226, -0.7298868, -2.508939, 1, 1, 1, 1, 1,
-0.02704538, 0.2564367, -0.1932981, 1, 1, 1, 1, 1,
-0.0267213, -0.3222034, -0.790248, 0, 0, 1, 1, 1,
-0.02519276, -0.5215943, -4.624089, 1, 0, 0, 1, 1,
-0.02196473, 0.07691249, 1.895313, 1, 0, 0, 1, 1,
-0.02025419, 0.405533, 0.2419803, 1, 0, 0, 1, 1,
-0.01952968, -0.7109626, -2.43733, 1, 0, 0, 1, 1,
-0.01427762, 0.2365265, -0.6759368, 1, 0, 0, 1, 1,
-0.007293793, 1.402002, -0.83718, 0, 0, 0, 1, 1,
-0.003464346, -0.5793614, -3.535099, 0, 0, 0, 1, 1,
-0.002411799, -0.2181842, -3.228105, 0, 0, 0, 1, 1,
-0.001759722, -1.665102, -3.110605, 0, 0, 0, 1, 1,
0.001870436, 0.8284254, -0.2528961, 0, 0, 0, 1, 1,
0.002723446, -0.7118681, 3.386951, 0, 0, 0, 1, 1,
0.004594011, 0.2902866, -0.5743358, 0, 0, 0, 1, 1,
0.008679121, 1.522058, -0.3575294, 1, 1, 1, 1, 1,
0.01061555, 0.8513794, -0.2009979, 1, 1, 1, 1, 1,
0.01819161, -0.4853859, 3.889383, 1, 1, 1, 1, 1,
0.01833688, 0.05377116, -1.091142, 1, 1, 1, 1, 1,
0.02161685, -1.306963, 2.603059, 1, 1, 1, 1, 1,
0.02175271, 0.273806, 0.3257222, 1, 1, 1, 1, 1,
0.02295835, -0.6295407, 5.066985, 1, 1, 1, 1, 1,
0.02392615, 0.6584756, -0.6337148, 1, 1, 1, 1, 1,
0.02481214, 0.263352, -0.5150245, 1, 1, 1, 1, 1,
0.02491796, -0.7066404, 2.261759, 1, 1, 1, 1, 1,
0.02604716, -1.750487, 3.573585, 1, 1, 1, 1, 1,
0.02611294, -0.7597083, 4.647107, 1, 1, 1, 1, 1,
0.02714081, 0.08996236, -0.9863742, 1, 1, 1, 1, 1,
0.03090712, 1.361903, -1.264653, 1, 1, 1, 1, 1,
0.03199412, -0.625582, 1.851529, 1, 1, 1, 1, 1,
0.03206157, -2.13379, 2.193329, 0, 0, 1, 1, 1,
0.03417459, 0.238889, 1.507497, 1, 0, 0, 1, 1,
0.03492378, 0.2835608, 2.09748, 1, 0, 0, 1, 1,
0.0351115, 0.7984606, -0.5471302, 1, 0, 0, 1, 1,
0.03749995, 0.2051438, -0.8744407, 1, 0, 0, 1, 1,
0.04279819, -0.4641047, 3.341529, 1, 0, 0, 1, 1,
0.04386127, 0.339376, 0.2315698, 0, 0, 0, 1, 1,
0.04664403, 1.901028, 1.369672, 0, 0, 0, 1, 1,
0.05076716, -0.4357918, 2.07326, 0, 0, 0, 1, 1,
0.05468958, 1.320248, -1.814599, 0, 0, 0, 1, 1,
0.05478923, -0.3155478, 1.79749, 0, 0, 0, 1, 1,
0.05684526, -1.30035, 3.280695, 0, 0, 0, 1, 1,
0.05961084, 0.3004977, 0.06506733, 0, 0, 0, 1, 1,
0.05967677, -0.3758398, 1.891213, 1, 1, 1, 1, 1,
0.06670042, -1.534422, 3.312897, 1, 1, 1, 1, 1,
0.06680925, 1.16087, 0.7339703, 1, 1, 1, 1, 1,
0.06809241, -0.05791667, 1.98067, 1, 1, 1, 1, 1,
0.07053383, -1.971352, 4.046431, 1, 1, 1, 1, 1,
0.08112974, 0.6508185, 0.9493826, 1, 1, 1, 1, 1,
0.08258104, 1.088333, 0.3910176, 1, 1, 1, 1, 1,
0.08671896, -1.660515, 2.213084, 1, 1, 1, 1, 1,
0.08690182, 0.03891031, -0.0810298, 1, 1, 1, 1, 1,
0.08764965, 0.8816496, -1.082739, 1, 1, 1, 1, 1,
0.09274372, 0.7309029, -1.003639, 1, 1, 1, 1, 1,
0.09339052, 0.3208837, 3.432893, 1, 1, 1, 1, 1,
0.09366903, -0.6514306, 2.927624, 1, 1, 1, 1, 1,
0.09417949, -0.9759908, 4.825037, 1, 1, 1, 1, 1,
0.09740219, 1.427833, -0.985248, 1, 1, 1, 1, 1,
0.09911522, 0.9256383, -1.238208, 0, 0, 1, 1, 1,
0.1000852, -0.5482652, 3.359795, 1, 0, 0, 1, 1,
0.1009207, -1.666784, 3.739586, 1, 0, 0, 1, 1,
0.1036053, -0.5895717, 1.784024, 1, 0, 0, 1, 1,
0.1073791, 0.4230644, 0.3482115, 1, 0, 0, 1, 1,
0.1077139, 0.9102958, -0.2899641, 1, 0, 0, 1, 1,
0.1173332, 1.671688, 0.7497633, 0, 0, 0, 1, 1,
0.1188447, 0.5613599, -1.261976, 0, 0, 0, 1, 1,
0.1235763, -2.014416, 3.098988, 0, 0, 0, 1, 1,
0.1246157, 0.6821597, -0.3155258, 0, 0, 0, 1, 1,
0.1253238, -0.3835354, 3.992867, 0, 0, 0, 1, 1,
0.1367931, -1.467514, 4.373064, 0, 0, 0, 1, 1,
0.1368706, 0.562445, -0.7435067, 0, 0, 0, 1, 1,
0.1409516, -0.6322812, 2.808702, 1, 1, 1, 1, 1,
0.1439696, 0.4096526, 0.7602261, 1, 1, 1, 1, 1,
0.1525567, 0.08319894, -0.2810601, 1, 1, 1, 1, 1,
0.1527346, 0.4436021, 0.6515658, 1, 1, 1, 1, 1,
0.1539008, -0.8024743, 2.591131, 1, 1, 1, 1, 1,
0.1541004, 0.4017636, 1.977688, 1, 1, 1, 1, 1,
0.1600202, -0.4362098, 1.94708, 1, 1, 1, 1, 1,
0.160809, 1.248148, 0.7381942, 1, 1, 1, 1, 1,
0.1614077, -1.517381, 3.129469, 1, 1, 1, 1, 1,
0.1632559, 1.049262, 0.723641, 1, 1, 1, 1, 1,
0.1729401, 0.7938781, 2.2816, 1, 1, 1, 1, 1,
0.1740305, 0.3315795, -0.761818, 1, 1, 1, 1, 1,
0.1747542, 0.08469501, 2.880587, 1, 1, 1, 1, 1,
0.1770363, -0.4829433, 2.550773, 1, 1, 1, 1, 1,
0.1789914, 0.02377487, 1.900848, 1, 1, 1, 1, 1,
0.1794196, 0.870928, -0.4113219, 0, 0, 1, 1, 1,
0.1809994, 0.1920864, -0.2160462, 1, 0, 0, 1, 1,
0.1811072, 0.1333717, 0.7374914, 1, 0, 0, 1, 1,
0.1818838, 0.1183575, 1.217644, 1, 0, 0, 1, 1,
0.1828477, 1.57681, -0.4845779, 1, 0, 0, 1, 1,
0.1853324, 0.2109068, -1.089898, 1, 0, 0, 1, 1,
0.1935828, -1.174147, 3.498727, 0, 0, 0, 1, 1,
0.2019325, -0.6050815, 3.079408, 0, 0, 0, 1, 1,
0.2040118, 0.2694971, -0.361343, 0, 0, 0, 1, 1,
0.2047525, -0.2821851, 0.5796452, 0, 0, 0, 1, 1,
0.2048683, 0.8691335, -0.631783, 0, 0, 0, 1, 1,
0.2053439, 0.7620004, 1.357737, 0, 0, 0, 1, 1,
0.2062631, -0.8704894, 2.669518, 0, 0, 0, 1, 1,
0.2093176, 0.7346218, 0.7062635, 1, 1, 1, 1, 1,
0.2178271, -0.1712996, 1.299255, 1, 1, 1, 1, 1,
0.221536, 1.721148, 0.7687306, 1, 1, 1, 1, 1,
0.2243428, 0.3120435, 1.648918, 1, 1, 1, 1, 1,
0.2243582, 0.3577974, 0.2855177, 1, 1, 1, 1, 1,
0.2266792, 0.9005561, 1.43893, 1, 1, 1, 1, 1,
0.2320038, 0.239829, -0.5205821, 1, 1, 1, 1, 1,
0.2348627, -0.540857, 4.035737, 1, 1, 1, 1, 1,
0.2349837, -0.2503167, 1.958209, 1, 1, 1, 1, 1,
0.2352855, -0.5650682, 1.643926, 1, 1, 1, 1, 1,
0.2486901, -0.5080326, 2.428525, 1, 1, 1, 1, 1,
0.254031, -0.6814833, 1.949828, 1, 1, 1, 1, 1,
0.2580735, 2.861903, -0.1530208, 1, 1, 1, 1, 1,
0.2601321, 0.757868, -1.306764, 1, 1, 1, 1, 1,
0.263084, -1.604283, 3.270288, 1, 1, 1, 1, 1,
0.2658828, 1.01544, 0.2101452, 0, 0, 1, 1, 1,
0.270245, 0.23426, 1.051982, 1, 0, 0, 1, 1,
0.2715961, -0.04528211, 0.8356012, 1, 0, 0, 1, 1,
0.2826715, 0.5087211, -0.4738435, 1, 0, 0, 1, 1,
0.2860457, -0.586988, 2.382254, 1, 0, 0, 1, 1,
0.2945463, -0.1498235, 1.96073, 1, 0, 0, 1, 1,
0.2965268, 0.1808783, -0.08918946, 0, 0, 0, 1, 1,
0.299686, -1.123224, 2.694968, 0, 0, 0, 1, 1,
0.3024233, -1.766813, 5.034028, 0, 0, 0, 1, 1,
0.3043065, -0.9092909, 4.637295, 0, 0, 0, 1, 1,
0.3044719, -1.505624, 2.504607, 0, 0, 0, 1, 1,
0.3054967, 0.3960877, 0.947616, 0, 0, 0, 1, 1,
0.3080103, -0.3016329, 3.254592, 0, 0, 0, 1, 1,
0.3098797, 2.309471, 0.325744, 1, 1, 1, 1, 1,
0.3120018, 0.2855994, 0.6632838, 1, 1, 1, 1, 1,
0.3145484, -1.051775, 3.506123, 1, 1, 1, 1, 1,
0.3199985, -0.4725132, 2.393499, 1, 1, 1, 1, 1,
0.3228683, -0.768057, 2.674015, 1, 1, 1, 1, 1,
0.3257367, -0.0686975, 2.736369, 1, 1, 1, 1, 1,
0.3293993, 0.2611968, -0.3242051, 1, 1, 1, 1, 1,
0.3294683, 0.07246058, 1.100986, 1, 1, 1, 1, 1,
0.3297062, -1.398962, 4.421803, 1, 1, 1, 1, 1,
0.3324952, -1.632125, 3.506216, 1, 1, 1, 1, 1,
0.3372861, -0.2557568, 3.100266, 1, 1, 1, 1, 1,
0.3387845, 0.4536788, 0.7117466, 1, 1, 1, 1, 1,
0.3394674, 0.1297523, 2.353281, 1, 1, 1, 1, 1,
0.3395254, 0.6619288, -0.5198457, 1, 1, 1, 1, 1,
0.344374, -0.5213717, 2.703075, 1, 1, 1, 1, 1,
0.3490412, 0.2782426, 0.8569537, 0, 0, 1, 1, 1,
0.3540604, -0.2425548, 3.022351, 1, 0, 0, 1, 1,
0.354492, -0.3220157, 0.5534541, 1, 0, 0, 1, 1,
0.3596169, -1.457558, 2.604045, 1, 0, 0, 1, 1,
0.3639823, 1.078191, -0.01275908, 1, 0, 0, 1, 1,
0.3644801, 0.7319754, 1.074428, 1, 0, 0, 1, 1,
0.3647817, 0.4658094, -0.5840132, 0, 0, 0, 1, 1,
0.3673345, 0.3490865, 1.647049, 0, 0, 0, 1, 1,
0.3725702, -0.9969565, 3.144954, 0, 0, 0, 1, 1,
0.3729677, -0.1657519, 3.031316, 0, 0, 0, 1, 1,
0.3783945, -0.4647409, 1.859118, 0, 0, 0, 1, 1,
0.3789713, -0.06993432, 2.228853, 0, 0, 0, 1, 1,
0.3791319, -0.08971546, 2.370057, 0, 0, 0, 1, 1,
0.381034, 1.064375, 0.01819313, 1, 1, 1, 1, 1,
0.3821059, 0.06796597, 2.425885, 1, 1, 1, 1, 1,
0.3843267, 1.584895, 0.6634052, 1, 1, 1, 1, 1,
0.3858056, -0.9667615, 0.6077965, 1, 1, 1, 1, 1,
0.386377, 0.2668305, -0.8927926, 1, 1, 1, 1, 1,
0.3900994, -1.146144, 2.559855, 1, 1, 1, 1, 1,
0.3934718, -2.530123, 2.754384, 1, 1, 1, 1, 1,
0.3976655, -0.3882828, 1.741227, 1, 1, 1, 1, 1,
0.3985275, 2.61266, 1.276325, 1, 1, 1, 1, 1,
0.4004328, -0.1777822, 3.278951, 1, 1, 1, 1, 1,
0.4016931, -0.6085169, 2.709735, 1, 1, 1, 1, 1,
0.4056184, -0.9226627, 2.706381, 1, 1, 1, 1, 1,
0.4088151, -1.26485, 3.46666, 1, 1, 1, 1, 1,
0.4108936, -0.009036426, 1.71064, 1, 1, 1, 1, 1,
0.414576, 1.92159, 0.9584593, 1, 1, 1, 1, 1,
0.4158445, 0.3589906, 0.04018681, 0, 0, 1, 1, 1,
0.416283, 0.7056682, 0.17757, 1, 0, 0, 1, 1,
0.4219962, -1.108952, 4.352095, 1, 0, 0, 1, 1,
0.4228899, 2.269276, -0.9529694, 1, 0, 0, 1, 1,
0.4254544, 0.1510839, 1.653459, 1, 0, 0, 1, 1,
0.4262557, 1.623568, 0.6821567, 1, 0, 0, 1, 1,
0.4303798, 0.5458276, 0.159976, 0, 0, 0, 1, 1,
0.4313431, 0.4995002, 1.204185, 0, 0, 0, 1, 1,
0.4375913, 0.8849012, 1.636162, 0, 0, 0, 1, 1,
0.4409883, -0.08298488, 0.8090923, 0, 0, 0, 1, 1,
0.4415188, -0.6105276, 2.983733, 0, 0, 0, 1, 1,
0.4419723, -1.889063, 4.274301, 0, 0, 0, 1, 1,
0.4476195, -1.121781, 1.878345, 0, 0, 0, 1, 1,
0.4503168, -0.3972631, 2.348951, 1, 1, 1, 1, 1,
0.4567078, -1.648464, 1.962784, 1, 1, 1, 1, 1,
0.4573499, -1.198739, 2.760951, 1, 1, 1, 1, 1,
0.4580621, -1.185577, 4.17624, 1, 1, 1, 1, 1,
0.4586128, -0.3160772, 2.220959, 1, 1, 1, 1, 1,
0.4637556, -0.4121412, 2.422242, 1, 1, 1, 1, 1,
0.4643293, 0.7296968, 0.5515542, 1, 1, 1, 1, 1,
0.471132, 1.477963, 0.01010971, 1, 1, 1, 1, 1,
0.4740405, -0.3635857, -0.3675497, 1, 1, 1, 1, 1,
0.4740804, 0.2220301, 0.7132984, 1, 1, 1, 1, 1,
0.4748168, -0.01294499, 2.025027, 1, 1, 1, 1, 1,
0.4760361, 0.9053544, 0.3207002, 1, 1, 1, 1, 1,
0.4769333, 0.1175546, 1.078999, 1, 1, 1, 1, 1,
0.4774415, -0.0196318, 3.085881, 1, 1, 1, 1, 1,
0.4799832, 1.798868, 0.2308248, 1, 1, 1, 1, 1,
0.4815007, 0.4445296, 0.6930973, 0, 0, 1, 1, 1,
0.4819081, -1.053301, 4.02379, 1, 0, 0, 1, 1,
0.482798, -0.7066524, 1.775191, 1, 0, 0, 1, 1,
0.4856966, -0.6071672, 2.295422, 1, 0, 0, 1, 1,
0.4875816, -2.621147, 3.53971, 1, 0, 0, 1, 1,
0.4928442, -1.061396, 3.195397, 1, 0, 0, 1, 1,
0.493543, 0.2679491, 2.580404, 0, 0, 0, 1, 1,
0.4951239, 1.262495, 1.865451, 0, 0, 0, 1, 1,
0.5001138, -0.9888469, 2.334581, 0, 0, 0, 1, 1,
0.5030538, 0.8824402, 1.428472, 0, 0, 0, 1, 1,
0.5034707, -1.558359, 3.987727, 0, 0, 0, 1, 1,
0.5116653, -0.1979368, 1.20101, 0, 0, 0, 1, 1,
0.5123674, -1.049716, 3.811827, 0, 0, 0, 1, 1,
0.5148485, -0.7927692, 4.504023, 1, 1, 1, 1, 1,
0.5188344, -0.5225512, 2.438412, 1, 1, 1, 1, 1,
0.5205073, 1.664316, 1.690669, 1, 1, 1, 1, 1,
0.5230094, 0.3555409, 0.8652748, 1, 1, 1, 1, 1,
0.5246214, -0.1889727, 2.655239, 1, 1, 1, 1, 1,
0.5376156, 1.278365, -0.5646357, 1, 1, 1, 1, 1,
0.5380641, -0.3613824, 2.241405, 1, 1, 1, 1, 1,
0.5415078, 1.488167, 0.07542655, 1, 1, 1, 1, 1,
0.5494761, -0.354056, 3.686785, 1, 1, 1, 1, 1,
0.5522121, -1.471638, 3.908793, 1, 1, 1, 1, 1,
0.5547255, -1.520675, 3.203333, 1, 1, 1, 1, 1,
0.5547354, -0.6828458, 1.563677, 1, 1, 1, 1, 1,
0.5575039, -1.936637, 2.199511, 1, 1, 1, 1, 1,
0.5576853, 0.003185533, 0.2069568, 1, 1, 1, 1, 1,
0.5598227, -0.2267412, 2.6883, 1, 1, 1, 1, 1,
0.5610787, 1.346211, -0.5205792, 0, 0, 1, 1, 1,
0.5699123, -0.009143359, 2.997808, 1, 0, 0, 1, 1,
0.5777954, -0.5112723, 3.400114, 1, 0, 0, 1, 1,
0.5784546, 0.5094306, 0.9250291, 1, 0, 0, 1, 1,
0.5785909, 1.821159, 0.4119236, 1, 0, 0, 1, 1,
0.5810951, 1.150043, 1.30623, 1, 0, 0, 1, 1,
0.5819684, 0.5843142, 0.5765828, 0, 0, 0, 1, 1,
0.5833531, 1.434194, 0.1811239, 0, 0, 0, 1, 1,
0.5847727, 1.064211, 0.1189855, 0, 0, 0, 1, 1,
0.5867755, 0.8415267, 0.1078455, 0, 0, 0, 1, 1,
0.5878582, -0.6982436, 1.342314, 0, 0, 0, 1, 1,
0.5932427, -2.026632, 5.018658, 0, 0, 0, 1, 1,
0.5981779, -1.073931, 4.885225, 0, 0, 0, 1, 1,
0.604654, -2.139016, 2.776717, 1, 1, 1, 1, 1,
0.6065708, -0.8379627, 2.947092, 1, 1, 1, 1, 1,
0.6101179, -1.828424, 0.8164219, 1, 1, 1, 1, 1,
0.6125007, 0.8936635, 0.02733028, 1, 1, 1, 1, 1,
0.6140546, 2.991529, -1.716309, 1, 1, 1, 1, 1,
0.6213033, -1.533787, 2.450462, 1, 1, 1, 1, 1,
0.6243606, -0.4289671, 1.846059, 1, 1, 1, 1, 1,
0.6254727, -1.158617, 4.599848, 1, 1, 1, 1, 1,
0.6265382, -0.1486294, -0.4591165, 1, 1, 1, 1, 1,
0.6307004, 0.2749514, 2.492233, 1, 1, 1, 1, 1,
0.6315399, -0.8724237, 2.112341, 1, 1, 1, 1, 1,
0.6316879, 1.049061, 0.3377186, 1, 1, 1, 1, 1,
0.6341139, -0.6872264, 2.14871, 1, 1, 1, 1, 1,
0.6350968, -0.07462227, 0.5175541, 1, 1, 1, 1, 1,
0.6425966, 0.5169478, 0.4714155, 1, 1, 1, 1, 1,
0.6449553, -2.060018, 3.569647, 0, 0, 1, 1, 1,
0.6497193, -0.8576343, 5.416379, 1, 0, 0, 1, 1,
0.6516412, -0.1356091, 1.925573, 1, 0, 0, 1, 1,
0.6569254, -0.4126901, 3.471165, 1, 0, 0, 1, 1,
0.6570625, 0.2628695, -0.1344847, 1, 0, 0, 1, 1,
0.6675787, -0.3761031, 2.378747, 1, 0, 0, 1, 1,
0.6712613, -0.9278675, 3.415968, 0, 0, 0, 1, 1,
0.6761502, -0.09107099, 3.475092, 0, 0, 0, 1, 1,
0.6812019, -0.01091624, 1.383418, 0, 0, 0, 1, 1,
0.6817141, 2.530788, 0.3353533, 0, 0, 0, 1, 1,
0.6827336, 0.9306435, 0.5554729, 0, 0, 0, 1, 1,
0.6887267, 0.3055357, 0.08989519, 0, 0, 0, 1, 1,
0.7058246, -0.2476135, 2.011855, 0, 0, 0, 1, 1,
0.7065921, 1.870326, 0.6121616, 1, 1, 1, 1, 1,
0.7097001, -0.255501, 2.65258, 1, 1, 1, 1, 1,
0.7134994, 1.395088, -0.3912882, 1, 1, 1, 1, 1,
0.7200028, 1.72751, 0.9910787, 1, 1, 1, 1, 1,
0.7217941, 0.1040566, 2.373756, 1, 1, 1, 1, 1,
0.7241797, -0.7772435, 3.233888, 1, 1, 1, 1, 1,
0.7298842, -0.4343114, -0.2794299, 1, 1, 1, 1, 1,
0.7316211, -0.3131893, 1.771985, 1, 1, 1, 1, 1,
0.7354402, 1.046065, 0.9383088, 1, 1, 1, 1, 1,
0.7396119, -0.194947, 0.7142951, 1, 1, 1, 1, 1,
0.7420277, -1.179827, 1.674657, 1, 1, 1, 1, 1,
0.7468538, -0.3444901, 1.604157, 1, 1, 1, 1, 1,
0.749015, -0.03873682, 0.2880631, 1, 1, 1, 1, 1,
0.7548298, 2.049275, -0.6411468, 1, 1, 1, 1, 1,
0.7568176, -0.2482899, 1.911873, 1, 1, 1, 1, 1,
0.7607535, -0.492847, 1.475131, 0, 0, 1, 1, 1,
0.7627412, -1.110675, 2.173526, 1, 0, 0, 1, 1,
0.7702802, 1.351486, 0.1427658, 1, 0, 0, 1, 1,
0.7731842, -0.03458076, 3.145143, 1, 0, 0, 1, 1,
0.773792, -0.2321117, 2.677186, 1, 0, 0, 1, 1,
0.7742, -1.186707, 3.85244, 1, 0, 0, 1, 1,
0.7773397, 1.571117, 2.168484, 0, 0, 0, 1, 1,
0.7796685, 1.907465, -1.487781, 0, 0, 0, 1, 1,
0.7807472, -2.128296, 0.2710781, 0, 0, 0, 1, 1,
0.7832963, -0.01653841, 2.790472, 0, 0, 0, 1, 1,
0.7835254, 0.5482967, 1.987657, 0, 0, 0, 1, 1,
0.7850936, 2.128143, -1.142865, 0, 0, 0, 1, 1,
0.7955775, -1.475286, 2.608487, 0, 0, 0, 1, 1,
0.7993699, 0.8481597, 1.358169, 1, 1, 1, 1, 1,
0.7998731, -0.3394965, 2.930853, 1, 1, 1, 1, 1,
0.8018281, 1.87994, 1.307807, 1, 1, 1, 1, 1,
0.8127263, 0.9798824, -0.7624348, 1, 1, 1, 1, 1,
0.8206497, -0.8325575, 2.534781, 1, 1, 1, 1, 1,
0.8311936, 0.007765818, -0.0207625, 1, 1, 1, 1, 1,
0.8319715, -0.7224271, 0.9127633, 1, 1, 1, 1, 1,
0.8418052, -0.387087, -0.2484132, 1, 1, 1, 1, 1,
0.8464929, -0.4490988, 2.839128, 1, 1, 1, 1, 1,
0.8525895, 1.213871, -0.8067881, 1, 1, 1, 1, 1,
0.8606987, 0.0156638, 1.110875, 1, 1, 1, 1, 1,
0.8659487, 1.087822, 1.186695, 1, 1, 1, 1, 1,
0.8738315, -0.4791272, 2.500204, 1, 1, 1, 1, 1,
0.8765188, -1.447621, 2.580229, 1, 1, 1, 1, 1,
0.8793247, -1.250419, 1.039594, 1, 1, 1, 1, 1,
0.8797737, 0.9658116, 0.9997896, 0, 0, 1, 1, 1,
0.8833187, 1.707156, 0.5309051, 1, 0, 0, 1, 1,
0.8911346, -0.8097838, 3.642331, 1, 0, 0, 1, 1,
0.8921186, -0.3534274, 1.632918, 1, 0, 0, 1, 1,
0.8984971, 1.298629, -1.31241, 1, 0, 0, 1, 1,
0.8993131, -0.0807642, 0.688671, 1, 0, 0, 1, 1,
0.9009256, 0.2811118, 1.546359, 0, 0, 0, 1, 1,
0.9084756, 0.8763582, 2.691111, 0, 0, 0, 1, 1,
0.9175736, -0.459858, 2.45494, 0, 0, 0, 1, 1,
0.9251531, -1.094982, 2.767967, 0, 0, 0, 1, 1,
0.9292011, -0.6559933, 3.262549, 0, 0, 0, 1, 1,
0.9299205, 0.3072462, 0.8117546, 0, 0, 0, 1, 1,
0.9323543, 0.09622571, -0.0629615, 0, 0, 0, 1, 1,
0.9325919, 0.05495212, -0.6932842, 1, 1, 1, 1, 1,
0.9395837, 1.525256, -0.2866841, 1, 1, 1, 1, 1,
0.9508424, -1.44627, 1.725942, 1, 1, 1, 1, 1,
0.9543943, 0.3384014, 2.285729, 1, 1, 1, 1, 1,
0.9578353, -0.8717846, 1.685099, 1, 1, 1, 1, 1,
0.9596204, 1.51451, 0.2698539, 1, 1, 1, 1, 1,
0.9614372, -0.840651, 2.744716, 1, 1, 1, 1, 1,
0.9614511, 1.232935, -0.08041484, 1, 1, 1, 1, 1,
0.9677882, 0.9073241, -0.2186132, 1, 1, 1, 1, 1,
0.969671, -0.6176222, 2.365987, 1, 1, 1, 1, 1,
0.9764463, 0.008235197, 2.330661, 1, 1, 1, 1, 1,
0.9766487, 0.2882125, 1.486992, 1, 1, 1, 1, 1,
0.9775339, 0.5362028, 2.376007, 1, 1, 1, 1, 1,
0.9782441, -1.059146, 1.894706, 1, 1, 1, 1, 1,
0.9784954, -0.3736595, 1.688458, 1, 1, 1, 1, 1,
0.9810992, -0.5035049, 2.503532, 0, 0, 1, 1, 1,
0.9868346, 0.3519399, 1.025002, 1, 0, 0, 1, 1,
0.9887475, 0.05211775, 0.1637018, 1, 0, 0, 1, 1,
0.9888638, -0.07589082, 0.4137108, 1, 0, 0, 1, 1,
0.9979433, -1.014675, 3.536572, 1, 0, 0, 1, 1,
1.005482, -1.346049, 2.410951, 1, 0, 0, 1, 1,
1.02034, -0.6299703, 1.874129, 0, 0, 0, 1, 1,
1.024365, -0.1629986, 1.116631, 0, 0, 0, 1, 1,
1.02784, -0.4244092, 2.587032, 0, 0, 0, 1, 1,
1.036044, -0.3077026, 3.134649, 0, 0, 0, 1, 1,
1.036239, 0.4045673, 1.538084, 0, 0, 0, 1, 1,
1.036432, -1.984098, 2.962153, 0, 0, 0, 1, 1,
1.036892, 0.1789947, 0.924216, 0, 0, 0, 1, 1,
1.039514, 0.2535918, 1.912755, 1, 1, 1, 1, 1,
1.041772, 0.5160555, 1.024361, 1, 1, 1, 1, 1,
1.041792, -2.909663, 2.432455, 1, 1, 1, 1, 1,
1.042251, -0.144813, 1.657055, 1, 1, 1, 1, 1,
1.044687, 0.7025564, -0.6159483, 1, 1, 1, 1, 1,
1.046792, 1.540024, 0.2155896, 1, 1, 1, 1, 1,
1.049641, -1.68353, 2.677364, 1, 1, 1, 1, 1,
1.052843, -2.065959, 2.796795, 1, 1, 1, 1, 1,
1.059832, -0.8759387, 3.109943, 1, 1, 1, 1, 1,
1.070717, -0.2775994, 1.964996, 1, 1, 1, 1, 1,
1.072329, -0.8513769, 3.57444, 1, 1, 1, 1, 1,
1.073893, -0.9929185, 2.237413, 1, 1, 1, 1, 1,
1.074836, -1.311068, 3.149291, 1, 1, 1, 1, 1,
1.079003, 1.057498, 1.817789, 1, 1, 1, 1, 1,
1.094934, -1.01716, 1.911792, 1, 1, 1, 1, 1,
1.095769, -0.02479485, 2.852003, 0, 0, 1, 1, 1,
1.107693, 0.9164343, 0.6129022, 1, 0, 0, 1, 1,
1.119128, 2.297125, -0.7316523, 1, 0, 0, 1, 1,
1.122549, -0.6881389, 2.430639, 1, 0, 0, 1, 1,
1.122792, -1.641839, 3.506159, 1, 0, 0, 1, 1,
1.142594, 0.2571012, 3.368879, 1, 0, 0, 1, 1,
1.16213, 0.876491, 0.2246244, 0, 0, 0, 1, 1,
1.169244, -0.2990022, 3.881386, 0, 0, 0, 1, 1,
1.172803, 1.235541, 2.944677, 0, 0, 0, 1, 1,
1.179695, -2.18221, 1.068992, 0, 0, 0, 1, 1,
1.180525, -1.040662, 2.352814, 0, 0, 0, 1, 1,
1.187036, 0.3169433, -0.5954416, 0, 0, 0, 1, 1,
1.187158, 0.7394708, 0.3732334, 0, 0, 0, 1, 1,
1.189346, -0.8192621, 1.657811, 1, 1, 1, 1, 1,
1.192783, -0.2641368, 1.470139, 1, 1, 1, 1, 1,
1.196496, 0.595511, 0.6244578, 1, 1, 1, 1, 1,
1.205145, -0.8672215, 3.484198, 1, 1, 1, 1, 1,
1.211926, 0.05568878, 1.508847, 1, 1, 1, 1, 1,
1.216558, 0.04201689, 2.323886, 1, 1, 1, 1, 1,
1.222423, -0.1279761, 3.143758, 1, 1, 1, 1, 1,
1.225752, -1.50233, 3.212344, 1, 1, 1, 1, 1,
1.226841, 1.242486, 1.919833, 1, 1, 1, 1, 1,
1.272426, 0.2209083, 1.717258, 1, 1, 1, 1, 1,
1.282281, -0.7108053, 3.18774, 1, 1, 1, 1, 1,
1.284877, -0.4480398, 0.8759406, 1, 1, 1, 1, 1,
1.289134, -0.9111545, 3.352283, 1, 1, 1, 1, 1,
1.306003, -0.07687062, 0.5696843, 1, 1, 1, 1, 1,
1.311708, 0.001328645, 1.707763, 1, 1, 1, 1, 1,
1.329731, -0.9533773, 1.607215, 0, 0, 1, 1, 1,
1.334633, 0.1349854, 2.331757, 1, 0, 0, 1, 1,
1.335238, 1.403398, 1.107986, 1, 0, 0, 1, 1,
1.335426, -1.222936, 2.058599, 1, 0, 0, 1, 1,
1.335587, 0.6958688, 2.7092, 1, 0, 0, 1, 1,
1.342437, 0.3349839, 2.951224, 1, 0, 0, 1, 1,
1.347208, 1.8129, -0.538139, 0, 0, 0, 1, 1,
1.35229, -1.16608, 0.8809713, 0, 0, 0, 1, 1,
1.370806, -3.311823, 5.280703, 0, 0, 0, 1, 1,
1.371749, -0.4019072, 1.717003, 0, 0, 0, 1, 1,
1.397635, 0.6766813, 1.672503, 0, 0, 0, 1, 1,
1.399146, -0.2547507, 0.4071264, 0, 0, 0, 1, 1,
1.409201, 0.01219554, -0.3871134, 0, 0, 0, 1, 1,
1.410824, 0.2221977, 1.412686, 1, 1, 1, 1, 1,
1.413788, -1.968479, 3.942639, 1, 1, 1, 1, 1,
1.41538, 0.9539587, 1.530606, 1, 1, 1, 1, 1,
1.416199, -1.6408, 1.877735, 1, 1, 1, 1, 1,
1.416383, -1.091825, 1.713162, 1, 1, 1, 1, 1,
1.422674, 0.9546844, 2.488107, 1, 1, 1, 1, 1,
1.423522, 0.6015466, 2.153202, 1, 1, 1, 1, 1,
1.426979, 1.088199, 1.011078, 1, 1, 1, 1, 1,
1.427936, 0.8721136, 2.200843, 1, 1, 1, 1, 1,
1.469548, 0.7763078, 2.053382, 1, 1, 1, 1, 1,
1.474847, 1.835375, -0.3257879, 1, 1, 1, 1, 1,
1.478278, 1.103142, 1.298082, 1, 1, 1, 1, 1,
1.478377, 1.477368, 0.9161766, 1, 1, 1, 1, 1,
1.482239, -0.5353801, -0.04438139, 1, 1, 1, 1, 1,
1.488641, 1.076009, 1.558974, 1, 1, 1, 1, 1,
1.502391, -1.834856, 2.020178, 0, 0, 1, 1, 1,
1.507625, 0.3922765, -0.1678274, 1, 0, 0, 1, 1,
1.520355, -0.07847787, 2.177398, 1, 0, 0, 1, 1,
1.536002, 0.1447711, 0.8860075, 1, 0, 0, 1, 1,
1.548694, 0.1964932, 2.70014, 1, 0, 0, 1, 1,
1.553587, -0.103944, 1.688387, 1, 0, 0, 1, 1,
1.554481, -0.3167545, 0.4467443, 0, 0, 0, 1, 1,
1.561056, 0.8211777, 0.5711361, 0, 0, 0, 1, 1,
1.562974, 0.6526967, -0.1041175, 0, 0, 0, 1, 1,
1.567043, 1.045105, 0.5913125, 0, 0, 0, 1, 1,
1.572555, -0.01414646, 1.660852, 0, 0, 0, 1, 1,
1.591554, 0.5122742, 0.7550821, 0, 0, 0, 1, 1,
1.595392, -0.7879763, 1.16123, 0, 0, 0, 1, 1,
1.626832, -1.015538, 1.791167, 1, 1, 1, 1, 1,
1.666187, -1.1508, 1.77018, 1, 1, 1, 1, 1,
1.667822, -0.9382975, 2.703928, 1, 1, 1, 1, 1,
1.692344, 0.1308447, 1.951582, 1, 1, 1, 1, 1,
1.695182, -0.1951265, 2.388175, 1, 1, 1, 1, 1,
1.718542, 0.5161195, 1.09364, 1, 1, 1, 1, 1,
1.746329, 0.8473797, 1.561503, 1, 1, 1, 1, 1,
1.749574, -1.407834, 3.640879, 1, 1, 1, 1, 1,
1.753361, -0.8715639, 1.804543, 1, 1, 1, 1, 1,
1.770474, -0.8266369, 2.318477, 1, 1, 1, 1, 1,
1.775322, -0.8513601, 1.597557, 1, 1, 1, 1, 1,
1.813861, 0.2544917, 1.759954, 1, 1, 1, 1, 1,
1.815997, -0.8807452, 3.10413, 1, 1, 1, 1, 1,
1.820026, -0.7533791, 3.826386, 1, 1, 1, 1, 1,
1.820095, -0.228635, 1.627175, 1, 1, 1, 1, 1,
1.823448, -1.406503, 3.369345, 0, 0, 1, 1, 1,
1.829231, 1.160633, 1.977308, 1, 0, 0, 1, 1,
1.82934, -0.6328818, 3.936537, 1, 0, 0, 1, 1,
1.844067, -1.221474, 3.422759, 1, 0, 0, 1, 1,
1.848629, 0.4785487, 1.383704, 1, 0, 0, 1, 1,
1.857608, 0.6136178, 1.113081, 1, 0, 0, 1, 1,
1.876525, 1.005243, 2.233562, 0, 0, 0, 1, 1,
1.91774, 0.03009098, 3.151505, 0, 0, 0, 1, 1,
1.936361, 1.32098, 2.132185, 0, 0, 0, 1, 1,
1.938993, -1.618915, 2.333819, 0, 0, 0, 1, 1,
1.957785, 0.9288557, 2.994497, 0, 0, 0, 1, 1,
1.977572, -0.08572543, 2.353189, 0, 0, 0, 1, 1,
1.978539, 1.313814, 1.205502, 0, 0, 0, 1, 1,
2.003143, 0.710469, 1.552298, 1, 1, 1, 1, 1,
2.055098, -1.130993, 1.654067, 1, 1, 1, 1, 1,
2.05926, -0.1599956, 1.107436, 1, 1, 1, 1, 1,
2.059359, -0.519282, 2.669442, 1, 1, 1, 1, 1,
2.060806, 0.9150869, 0.4587033, 1, 1, 1, 1, 1,
2.061575, 1.651331, 0.1940676, 1, 1, 1, 1, 1,
2.080311, -0.09697596, 2.499614, 1, 1, 1, 1, 1,
2.088199, -0.03284939, 3.010957, 1, 1, 1, 1, 1,
2.102818, -0.5202876, 0.6931095, 1, 1, 1, 1, 1,
2.104857, 1.148021, 0.2447256, 1, 1, 1, 1, 1,
2.106868, 0.6842216, 0.6646183, 1, 1, 1, 1, 1,
2.107616, -2.220187, 2.593292, 1, 1, 1, 1, 1,
2.118086, 1.352579, 1.971084, 1, 1, 1, 1, 1,
2.126518, 0.1376967, 2.197718, 1, 1, 1, 1, 1,
2.17247, -0.01330077, 2.584642, 1, 1, 1, 1, 1,
2.200013, -0.5482901, -0.173086, 0, 0, 1, 1, 1,
2.216154, -0.3900687, 1.681547, 1, 0, 0, 1, 1,
2.226311, -0.2062115, 2.039727, 1, 0, 0, 1, 1,
2.261009, -0.6667012, 2.457629, 1, 0, 0, 1, 1,
2.26565, -0.8902148, 1.843559, 1, 0, 0, 1, 1,
2.275178, 0.3573351, 0.3889685, 1, 0, 0, 1, 1,
2.331585, 0.1272451, 1.457659, 0, 0, 0, 1, 1,
2.34005, 1.127006, 0.5933869, 0, 0, 0, 1, 1,
2.347611, 2.238443, 1.516951, 0, 0, 0, 1, 1,
2.443376, 0.6197481, 0.7485319, 0, 0, 0, 1, 1,
2.473941, 0.3994324, 0.854854, 0, 0, 0, 1, 1,
2.550195, 1.585539, 2.636635, 0, 0, 0, 1, 1,
2.565881, 1.349303, 0.4460496, 0, 0, 0, 1, 1,
2.611108, 2.147772, 2.095851, 1, 1, 1, 1, 1,
2.638561, 1.875632, -0.696577, 1, 1, 1, 1, 1,
2.676529, -0.5850393, 1.268754, 1, 1, 1, 1, 1,
2.729545, 1.340765, 2.188182, 1, 1, 1, 1, 1,
2.921555, 2.474632, 0.9679465, 1, 1, 1, 1, 1,
3.203756, -1.145344, 2.111621, 1, 1, 1, 1, 1,
3.540734, 0.579825, 0.9079343, 1, 1, 1, 1, 1
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
var radius = 9.808197;
var distance = 34.45088;
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
mvMatrix.translate( -0.1303933, 0.132942, 0.1097679 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.45088);
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