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
-3.557044, -0.4998414, -1.804294, 1, 0, 0, 1,
-3.357687, 0.178598, -1.624918, 1, 0.007843138, 0, 1,
-2.702465, -0.9876579, -1.801601, 1, 0.01176471, 0, 1,
-2.568089, 0.7051282, -0.5929512, 1, 0.01960784, 0, 1,
-2.464772, 2.213059, 0.3514036, 1, 0.02352941, 0, 1,
-2.430905, 0.9690425, -0.6101727, 1, 0.03137255, 0, 1,
-2.376846, -1.066629, -0.8534013, 1, 0.03529412, 0, 1,
-2.348678, 1.53458, 0.2066093, 1, 0.04313726, 0, 1,
-2.2551, 0.5710926, -2.53515, 1, 0.04705882, 0, 1,
-2.243268, 1.66531, -0.3661184, 1, 0.05490196, 0, 1,
-2.21511, 0.3994603, -1.500874, 1, 0.05882353, 0, 1,
-2.190528, -0.264514, -2.574143, 1, 0.06666667, 0, 1,
-2.175124, -1.738861, -1.882816, 1, 0.07058824, 0, 1,
-2.145555, 0.184832, -1.72524, 1, 0.07843138, 0, 1,
-2.132713, 1.321714, -0.7483931, 1, 0.08235294, 0, 1,
-2.122181, 0.8043787, -1.317951, 1, 0.09019608, 0, 1,
-2.119911, 0.260402, -1.712631, 1, 0.09411765, 0, 1,
-2.115093, -1.272628, -2.828256, 1, 0.1019608, 0, 1,
-2.111582, 0.6777118, -2.147379, 1, 0.1098039, 0, 1,
-2.086327, 0.03139811, -1.642301, 1, 0.1137255, 0, 1,
-1.982594, 0.3091577, -0.9484136, 1, 0.1215686, 0, 1,
-1.936372, 0.2100143, -1.763056, 1, 0.1254902, 0, 1,
-1.906516, -2.869459, -1.890783, 1, 0.1333333, 0, 1,
-1.899824, -1.151398, -1.841537, 1, 0.1372549, 0, 1,
-1.889315, -0.2430869, -1.661391, 1, 0.145098, 0, 1,
-1.884219, 0.6659253, -1.652309, 1, 0.1490196, 0, 1,
-1.875418, -0.6305774, -0.2315874, 1, 0.1568628, 0, 1,
-1.86304, -0.256018, -2.504289, 1, 0.1607843, 0, 1,
-1.859248, -0.4780962, -0.9097937, 1, 0.1686275, 0, 1,
-1.847503, 0.3383505, -1.393396, 1, 0.172549, 0, 1,
-1.83751, 1.205006, -0.4559158, 1, 0.1803922, 0, 1,
-1.829826, 1.361143, -2.412494, 1, 0.1843137, 0, 1,
-1.815531, -0.1343795, -0.7312546, 1, 0.1921569, 0, 1,
-1.807715, 0.05334514, -0.8146366, 1, 0.1960784, 0, 1,
-1.804371, -1.276845, -1.848911, 1, 0.2039216, 0, 1,
-1.800614, -1.055153, -2.891507, 1, 0.2117647, 0, 1,
-1.799072, -0.1057017, -2.952433, 1, 0.2156863, 0, 1,
-1.781424, 0.8380089, -2.962016, 1, 0.2235294, 0, 1,
-1.765275, 1.482236, -0.3161314, 1, 0.227451, 0, 1,
-1.752329, 0.2478007, -3.059222, 1, 0.2352941, 0, 1,
-1.748828, -0.5166637, -2.463667, 1, 0.2392157, 0, 1,
-1.748494, -1.865571, -3.299575, 1, 0.2470588, 0, 1,
-1.685103, -0.2075678, 0.661028, 1, 0.2509804, 0, 1,
-1.682905, -0.7149084, -3.406462, 1, 0.2588235, 0, 1,
-1.672576, -0.2991199, -2.03734, 1, 0.2627451, 0, 1,
-1.670182, -0.2580949, -1.874459, 1, 0.2705882, 0, 1,
-1.637248, -0.8411071, -3.074394, 1, 0.2745098, 0, 1,
-1.630774, 0.3200437, -0.1438506, 1, 0.282353, 0, 1,
-1.621321, -0.3824516, -0.7075151, 1, 0.2862745, 0, 1,
-1.620603, 2.964128, -0.6945944, 1, 0.2941177, 0, 1,
-1.613305, -1.118062, -0.829208, 1, 0.3019608, 0, 1,
-1.607232, -0.5850404, -2.872734, 1, 0.3058824, 0, 1,
-1.602395, -1.564904, -1.567029, 1, 0.3137255, 0, 1,
-1.599869, 0.5143926, -1.088511, 1, 0.3176471, 0, 1,
-1.591807, -0.3856144, -1.178722, 1, 0.3254902, 0, 1,
-1.587769, -0.05604873, -3.693196, 1, 0.3294118, 0, 1,
-1.55663, -0.2092078, -1.106784, 1, 0.3372549, 0, 1,
-1.540191, -0.1320084, -2.041, 1, 0.3411765, 0, 1,
-1.538049, 0.4625822, -1.984344, 1, 0.3490196, 0, 1,
-1.532121, 0.1068782, -0.5559541, 1, 0.3529412, 0, 1,
-1.500184, 0.6924434, -2.129984, 1, 0.3607843, 0, 1,
-1.499118, -0.003228634, -3.161195, 1, 0.3647059, 0, 1,
-1.495539, 0.7587541, -1.071986, 1, 0.372549, 0, 1,
-1.489109, -0.3739974, -0.2533278, 1, 0.3764706, 0, 1,
-1.474975, 0.7773076, -2.092361, 1, 0.3843137, 0, 1,
-1.473938, 0.0931667, -0.6005769, 1, 0.3882353, 0, 1,
-1.455513, -0.6557752, -1.884436, 1, 0.3960784, 0, 1,
-1.455006, 0.8475595, -1.157935, 1, 0.4039216, 0, 1,
-1.452648, 0.1966948, -0.3808293, 1, 0.4078431, 0, 1,
-1.448034, -1.201183, -1.879593, 1, 0.4156863, 0, 1,
-1.434423, 0.1870118, -0.3072643, 1, 0.4196078, 0, 1,
-1.428166, -0.4572086, -1.561651, 1, 0.427451, 0, 1,
-1.419759, 1.343453, -0.1424248, 1, 0.4313726, 0, 1,
-1.415066, 0.06263714, -1.831117, 1, 0.4392157, 0, 1,
-1.407838, -0.7530984, -2.896519, 1, 0.4431373, 0, 1,
-1.393275, 1.94144, -1.384717, 1, 0.4509804, 0, 1,
-1.388584, 2.029837, -0.4579206, 1, 0.454902, 0, 1,
-1.38393, -1.008248, -3.373132, 1, 0.4627451, 0, 1,
-1.376841, -0.5366271, -1.610813, 1, 0.4666667, 0, 1,
-1.375605, 0.6136665, -1.158208, 1, 0.4745098, 0, 1,
-1.370933, 0.892507, 0.005697003, 1, 0.4784314, 0, 1,
-1.37012, 0.4968994, -1.978431, 1, 0.4862745, 0, 1,
-1.369188, 0.5673606, -2.395103, 1, 0.4901961, 0, 1,
-1.365538, -0.5045958, -3.40442, 1, 0.4980392, 0, 1,
-1.355628, 1.617082, -1.901986, 1, 0.5058824, 0, 1,
-1.350682, 0.4443633, -0.8942844, 1, 0.509804, 0, 1,
-1.347627, 1.329302, 0.06300312, 1, 0.5176471, 0, 1,
-1.345822, 1.11893, -1.019514, 1, 0.5215687, 0, 1,
-1.342141, 2.080364, 1.63211, 1, 0.5294118, 0, 1,
-1.321635, 1.391098, -0.8337151, 1, 0.5333334, 0, 1,
-1.31956, -1.168158, -1.588174, 1, 0.5411765, 0, 1,
-1.303903, -0.6098456, -3.736207, 1, 0.5450981, 0, 1,
-1.293118, 0.861118, -1.993573, 1, 0.5529412, 0, 1,
-1.29213, 1.180022, -2.857833, 1, 0.5568628, 0, 1,
-1.285404, -0.1044674, -0.8703867, 1, 0.5647059, 0, 1,
-1.282518, -0.4113136, -2.82093, 1, 0.5686275, 0, 1,
-1.27468, 0.4730668, -1.524696, 1, 0.5764706, 0, 1,
-1.262683, -0.4490302, -2.897205, 1, 0.5803922, 0, 1,
-1.259619, -1.307822, -2.487023, 1, 0.5882353, 0, 1,
-1.233022, -0.9465513, -1.927329, 1, 0.5921569, 0, 1,
-1.228736, 0.9153838, 0.6088232, 1, 0.6, 0, 1,
-1.22594, -0.02787972, 0.1017442, 1, 0.6078432, 0, 1,
-1.224385, -0.4390732, 1.007477, 1, 0.6117647, 0, 1,
-1.22423, -1.104057, -2.197001, 1, 0.6196079, 0, 1,
-1.214781, -1.22173, -0.4644887, 1, 0.6235294, 0, 1,
-1.204672, -1.02427, -2.608645, 1, 0.6313726, 0, 1,
-1.202318, -0.6402714, -1.796124, 1, 0.6352941, 0, 1,
-1.19059, 0.8200601, -0.8740106, 1, 0.6431373, 0, 1,
-1.185563, 0.6173311, -0.4345766, 1, 0.6470588, 0, 1,
-1.184976, -1.101309, -2.559662, 1, 0.654902, 0, 1,
-1.183568, -0.3746698, -1.417587, 1, 0.6588235, 0, 1,
-1.156207, 0.3822954, -1.082143, 1, 0.6666667, 0, 1,
-1.140805, 1.261493, -0.3972756, 1, 0.6705883, 0, 1,
-1.139481, 0.5469704, 0.2120278, 1, 0.6784314, 0, 1,
-1.134458, 0.3662998, -1.219248, 1, 0.682353, 0, 1,
-1.128003, 1.516016, -1.407894, 1, 0.6901961, 0, 1,
-1.127257, -1.006485, -2.755451, 1, 0.6941177, 0, 1,
-1.126304, 0.9378077, -0.5299451, 1, 0.7019608, 0, 1,
-1.123311, 0.4538439, -1.49517, 1, 0.7098039, 0, 1,
-1.121579, -0.9320395, -1.681152, 1, 0.7137255, 0, 1,
-1.112324, 2.016897, 0.2018586, 1, 0.7215686, 0, 1,
-1.110249, -1.292013, -3.457474, 1, 0.7254902, 0, 1,
-1.1001, 0.5346485, 0.03283319, 1, 0.7333333, 0, 1,
-1.099921, -0.06869209, -2.60127, 1, 0.7372549, 0, 1,
-1.09899, 0.5245325, -0.2931566, 1, 0.7450981, 0, 1,
-1.097325, 0.1772963, -2.447747, 1, 0.7490196, 0, 1,
-1.088472, 1.670591, -0.5301227, 1, 0.7568628, 0, 1,
-1.080764, 0.4351758, -2.566234, 1, 0.7607843, 0, 1,
-1.080048, -0.161647, -1.503787, 1, 0.7686275, 0, 1,
-1.076623, 1.384172, -1.657734, 1, 0.772549, 0, 1,
-1.06966, -0.2085535, -1.863593, 1, 0.7803922, 0, 1,
-1.064672, 0.2024979, -3.131434, 1, 0.7843137, 0, 1,
-1.057641, 0.2516089, -0.8439568, 1, 0.7921569, 0, 1,
-1.052494, -1.208257, -3.144921, 1, 0.7960784, 0, 1,
-1.048755, -0.487341, -0.3502779, 1, 0.8039216, 0, 1,
-1.046336, 0.8722011, -0.6063098, 1, 0.8117647, 0, 1,
-1.04404, 1.177722, -0.7084044, 1, 0.8156863, 0, 1,
-1.037913, -0.7461321, -3.44521, 1, 0.8235294, 0, 1,
-1.035252, 0.07675282, -1.393352, 1, 0.827451, 0, 1,
-1.034174, -1.220478, -2.966944, 1, 0.8352941, 0, 1,
-1.033773, -0.4044467, -2.023663, 1, 0.8392157, 0, 1,
-1.021438, 1.575008, -1.317983, 1, 0.8470588, 0, 1,
-1.013165, 0.5008325, 0.926609, 1, 0.8509804, 0, 1,
-0.9997095, -0.3943663, -3.697022, 1, 0.8588235, 0, 1,
-0.9994129, -1.384122, -2.102788, 1, 0.8627451, 0, 1,
-0.9941378, 0.8707541, -2.987517, 1, 0.8705882, 0, 1,
-0.9874067, -0.09346065, -1.025984, 1, 0.8745098, 0, 1,
-0.9764166, 0.4326491, -0.4402736, 1, 0.8823529, 0, 1,
-0.9731305, -0.7701339, -1.906641, 1, 0.8862745, 0, 1,
-0.9676923, 1.363201, -1.171224, 1, 0.8941177, 0, 1,
-0.957269, -1.525804, -3.564688, 1, 0.8980392, 0, 1,
-0.9542885, -1.178885, -1.598675, 1, 0.9058824, 0, 1,
-0.9539235, 1.434613, -2.197364, 1, 0.9137255, 0, 1,
-0.9510508, 1.308769, -0.7606478, 1, 0.9176471, 0, 1,
-0.9444047, -0.2347135, -2.64253, 1, 0.9254902, 0, 1,
-0.9427802, 1.601558, 0.811987, 1, 0.9294118, 0, 1,
-0.941969, -0.647122, -2.657604, 1, 0.9372549, 0, 1,
-0.9402418, 1.678529, -0.8957815, 1, 0.9411765, 0, 1,
-0.9398826, 1.024665, -2.895378, 1, 0.9490196, 0, 1,
-0.9175976, 0.5090395, -1.73177, 1, 0.9529412, 0, 1,
-0.9122047, -1.708465, -2.836001, 1, 0.9607843, 0, 1,
-0.9121274, 0.273025, -1.03263, 1, 0.9647059, 0, 1,
-0.9105833, 0.6500615, -0.9976888, 1, 0.972549, 0, 1,
-0.9104272, 0.139811, -0.09262341, 1, 0.9764706, 0, 1,
-0.9095953, -1.954046, -1.741199, 1, 0.9843137, 0, 1,
-0.9073907, -1.156464, -1.818808, 1, 0.9882353, 0, 1,
-0.9001255, -0.2017329, -1.702454, 1, 0.9960784, 0, 1,
-0.8938655, 1.248199, -1.321649, 0.9960784, 1, 0, 1,
-0.8935204, -0.5786337, -2.715107, 0.9921569, 1, 0, 1,
-0.8900039, 0.02615939, -1.493822, 0.9843137, 1, 0, 1,
-0.886296, -1.261006, -3.776512, 0.9803922, 1, 0, 1,
-0.8860751, 0.7504209, -0.5504377, 0.972549, 1, 0, 1,
-0.884575, 0.3298081, -0.4034533, 0.9686275, 1, 0, 1,
-0.8799934, 0.50429, -0.4114503, 0.9607843, 1, 0, 1,
-0.8703755, 1.611941, -1.588019, 0.9568627, 1, 0, 1,
-0.8661999, -1.635924, -4.368144, 0.9490196, 1, 0, 1,
-0.8637943, 0.2555003, -1.994656, 0.945098, 1, 0, 1,
-0.8629988, 0.5921397, 0.1339365, 0.9372549, 1, 0, 1,
-0.858983, 0.4095618, -2.970454, 0.9333333, 1, 0, 1,
-0.8589246, 0.1033404, -0.5810487, 0.9254902, 1, 0, 1,
-0.8470209, 0.4053571, -1.251009, 0.9215686, 1, 0, 1,
-0.8463225, -0.2857348, -3.434735, 0.9137255, 1, 0, 1,
-0.8404295, 0.3923305, -2.608831, 0.9098039, 1, 0, 1,
-0.838851, 0.3202305, -1.30923, 0.9019608, 1, 0, 1,
-0.8340338, 1.009126, -0.8527154, 0.8941177, 1, 0, 1,
-0.8337234, -0.2049166, -2.241651, 0.8901961, 1, 0, 1,
-0.8336865, 0.3159397, -1.496472, 0.8823529, 1, 0, 1,
-0.8312331, -0.1380719, -1.158003, 0.8784314, 1, 0, 1,
-0.8293601, 2.805192, -1.896302, 0.8705882, 1, 0, 1,
-0.8283155, 1.207305, 0.4408365, 0.8666667, 1, 0, 1,
-0.8256935, -1.470273, -1.621078, 0.8588235, 1, 0, 1,
-0.824132, 0.2381941, -0.5623359, 0.854902, 1, 0, 1,
-0.8173692, 0.8253794, -0.2145944, 0.8470588, 1, 0, 1,
-0.8150176, -0.4249554, -0.9121691, 0.8431373, 1, 0, 1,
-0.8106549, -0.995813, -1.38684, 0.8352941, 1, 0, 1,
-0.8098791, 1.478671, 0.1751368, 0.8313726, 1, 0, 1,
-0.8092797, 0.4981724, 0.8428498, 0.8235294, 1, 0, 1,
-0.8058355, 1.004237, -1.95522, 0.8196079, 1, 0, 1,
-0.8024687, -0.4562083, -2.065379, 0.8117647, 1, 0, 1,
-0.7983925, 0.7351755, -0.05092641, 0.8078431, 1, 0, 1,
-0.7977427, 0.3824983, -2.035455, 0.8, 1, 0, 1,
-0.7944428, -1.516828, -0.3054172, 0.7921569, 1, 0, 1,
-0.7909794, 0.3370072, -2.053045, 0.7882353, 1, 0, 1,
-0.7831165, -0.3780673, -1.722639, 0.7803922, 1, 0, 1,
-0.7816684, -0.8686599, -2.90196, 0.7764706, 1, 0, 1,
-0.7770702, 1.104423, -0.8938271, 0.7686275, 1, 0, 1,
-0.7734419, 0.5491396, -2.465747, 0.7647059, 1, 0, 1,
-0.7656417, -0.4142705, -2.457133, 0.7568628, 1, 0, 1,
-0.762068, -0.2124959, -2.839595, 0.7529412, 1, 0, 1,
-0.761737, -0.9173353, -2.105285, 0.7450981, 1, 0, 1,
-0.7544809, 0.02629724, -1.802892, 0.7411765, 1, 0, 1,
-0.7521728, 1.659387, -2.190983, 0.7333333, 1, 0, 1,
-0.7516518, 0.1379278, -2.453839, 0.7294118, 1, 0, 1,
-0.7483248, -0.5911868, -0.4440054, 0.7215686, 1, 0, 1,
-0.7471878, -0.6004905, -0.1352499, 0.7176471, 1, 0, 1,
-0.7401744, 0.3305084, -1.823671, 0.7098039, 1, 0, 1,
-0.7371205, -0.7414837, -2.917018, 0.7058824, 1, 0, 1,
-0.7345291, 0.7465659, -0.1329513, 0.6980392, 1, 0, 1,
-0.7254379, -0.1891946, -0.3508633, 0.6901961, 1, 0, 1,
-0.7177677, 0.05152444, -2.590189, 0.6862745, 1, 0, 1,
-0.712097, 1.568443, 0.07673388, 0.6784314, 1, 0, 1,
-0.7118745, -0.4082713, -2.715939, 0.6745098, 1, 0, 1,
-0.7018181, 0.5204893, -1.24872, 0.6666667, 1, 0, 1,
-0.7017464, 1.05382, -0.4039104, 0.6627451, 1, 0, 1,
-0.6948227, 0.5162818, -1.165154, 0.654902, 1, 0, 1,
-0.6936398, -0.06134648, -1.905738, 0.6509804, 1, 0, 1,
-0.6914713, 0.5303527, -1.144226, 0.6431373, 1, 0, 1,
-0.6912869, 0.817245, -1.047169, 0.6392157, 1, 0, 1,
-0.6900228, 1.150419, -0.5333422, 0.6313726, 1, 0, 1,
-0.6838512, 0.8727994, -1.662583, 0.627451, 1, 0, 1,
-0.6830241, 0.3895842, -2.128014, 0.6196079, 1, 0, 1,
-0.6828784, -1.271901, -1.605607, 0.6156863, 1, 0, 1,
-0.6820739, 0.4717858, -0.671671, 0.6078432, 1, 0, 1,
-0.678497, 0.1911865, -0.3795776, 0.6039216, 1, 0, 1,
-0.6773571, -0.1527963, -1.837683, 0.5960785, 1, 0, 1,
-0.6726674, 1.996488, 0.5066509, 0.5882353, 1, 0, 1,
-0.6692618, 0.6707955, -0.1145057, 0.5843138, 1, 0, 1,
-0.6692083, -0.9305258, -2.251312, 0.5764706, 1, 0, 1,
-0.6650257, -0.8770811, -3.166637, 0.572549, 1, 0, 1,
-0.6625744, -0.5722101, -0.0914902, 0.5647059, 1, 0, 1,
-0.6457303, 0.000606291, -2.28199, 0.5607843, 1, 0, 1,
-0.6426187, -0.6513398, -3.874548, 0.5529412, 1, 0, 1,
-0.6336777, -1.372842, -1.670021, 0.5490196, 1, 0, 1,
-0.6294874, 0.6031923, -0.03618079, 0.5411765, 1, 0, 1,
-0.6286996, 0.008860507, 0.005074784, 0.5372549, 1, 0, 1,
-0.6252574, -0.8014478, -4.029176, 0.5294118, 1, 0, 1,
-0.6246219, 0.3906509, -2.26307, 0.5254902, 1, 0, 1,
-0.6088269, -0.7900099, -2.547561, 0.5176471, 1, 0, 1,
-0.6049291, 0.9418034, -0.1260027, 0.5137255, 1, 0, 1,
-0.6023135, -1.993885, -1.170203, 0.5058824, 1, 0, 1,
-0.5992694, -0.8990404, -1.016101, 0.5019608, 1, 0, 1,
-0.5986782, 2.056925, -2.762439, 0.4941176, 1, 0, 1,
-0.5983105, 1.97507, -2.294936, 0.4862745, 1, 0, 1,
-0.5954267, 1.276747, -1.972408, 0.4823529, 1, 0, 1,
-0.5910562, -0.0607589, -3.013865, 0.4745098, 1, 0, 1,
-0.590284, 2.096349, 0.1495956, 0.4705882, 1, 0, 1,
-0.5878819, 0.9313859, -0.1523556, 0.4627451, 1, 0, 1,
-0.5878349, -2.485984, -2.756223, 0.4588235, 1, 0, 1,
-0.5874953, -0.4938883, -1.698206, 0.4509804, 1, 0, 1,
-0.5735835, 1.020938, -0.4267981, 0.4470588, 1, 0, 1,
-0.5727763, -0.8297226, -2.650249, 0.4392157, 1, 0, 1,
-0.5655412, -2.059062, -2.682701, 0.4352941, 1, 0, 1,
-0.5588783, 0.5830342, -0.4827872, 0.427451, 1, 0, 1,
-0.553771, -0.3301363, -3.755949, 0.4235294, 1, 0, 1,
-0.5529578, 0.8213492, -1.186408, 0.4156863, 1, 0, 1,
-0.5519959, 1.324974, -0.5406549, 0.4117647, 1, 0, 1,
-0.5482559, -0.2522942, -4.42256, 0.4039216, 1, 0, 1,
-0.5435533, 1.402061, 0.1576239, 0.3960784, 1, 0, 1,
-0.5429263, 0.785629, 1.296409, 0.3921569, 1, 0, 1,
-0.5417826, 1.332396, -2.277448, 0.3843137, 1, 0, 1,
-0.5394198, 1.900205, 1.129286, 0.3803922, 1, 0, 1,
-0.5391921, -0.6191447, -3.823639, 0.372549, 1, 0, 1,
-0.537791, -1.114173, -4.571172, 0.3686275, 1, 0, 1,
-0.5348021, -0.9625271, -3.502036, 0.3607843, 1, 0, 1,
-0.5244219, 0.8442507, 1.282634, 0.3568628, 1, 0, 1,
-0.5192553, -1.10062, -3.202573, 0.3490196, 1, 0, 1,
-0.5183069, -0.3638012, -2.267327, 0.345098, 1, 0, 1,
-0.5136924, -0.5815905, -2.305984, 0.3372549, 1, 0, 1,
-0.5135639, 0.8684416, -0.5660411, 0.3333333, 1, 0, 1,
-0.5063624, -1.459941, -2.863046, 0.3254902, 1, 0, 1,
-0.5054357, 1.216295, 0.4157165, 0.3215686, 1, 0, 1,
-0.5042163, 0.09314153, -2.48844, 0.3137255, 1, 0, 1,
-0.5035361, 0.6954827, 1.274026, 0.3098039, 1, 0, 1,
-0.4994103, 1.874879, -0.4251378, 0.3019608, 1, 0, 1,
-0.496837, -0.1107129, -0.7913436, 0.2941177, 1, 0, 1,
-0.4952569, 0.1499883, -2.159857, 0.2901961, 1, 0, 1,
-0.4932084, 1.537856, -1.497882, 0.282353, 1, 0, 1,
-0.49197, 0.257321, -1.097415, 0.2784314, 1, 0, 1,
-0.4910569, -0.320951, -2.207343, 0.2705882, 1, 0, 1,
-0.4878441, -1.053529, -2.392397, 0.2666667, 1, 0, 1,
-0.4827215, 0.976007, -1.548088, 0.2588235, 1, 0, 1,
-0.480587, -1.504115, -2.390074, 0.254902, 1, 0, 1,
-0.4792953, 0.3238789, 0.1724459, 0.2470588, 1, 0, 1,
-0.4781384, 0.6710332, -0.8474316, 0.2431373, 1, 0, 1,
-0.4777042, 0.224982, -0.4524601, 0.2352941, 1, 0, 1,
-0.4761752, -0.7089865, -2.181193, 0.2313726, 1, 0, 1,
-0.4741028, -0.5867425, -2.675722, 0.2235294, 1, 0, 1,
-0.4731257, -0.1721774, -2.952626, 0.2196078, 1, 0, 1,
-0.4731083, -2.186172, -3.426685, 0.2117647, 1, 0, 1,
-0.4713884, -0.7029926, -3.570636, 0.2078431, 1, 0, 1,
-0.4711568, 0.1346561, -0.03303935, 0.2, 1, 0, 1,
-0.4685113, 0.03248736, -1.394943, 0.1921569, 1, 0, 1,
-0.4684054, -0.9333956, -2.508933, 0.1882353, 1, 0, 1,
-0.4671286, 1.197321, -2.71753, 0.1803922, 1, 0, 1,
-0.4649821, 0.7813463, -0.3718403, 0.1764706, 1, 0, 1,
-0.4540243, 0.3208658, 0.05742345, 0.1686275, 1, 0, 1,
-0.4532863, -0.3864403, -2.974547, 0.1647059, 1, 0, 1,
-0.4520236, -1.187442, -2.635242, 0.1568628, 1, 0, 1,
-0.4459971, -2.443341, -2.123098, 0.1529412, 1, 0, 1,
-0.4458093, 1.173741, -3.270038, 0.145098, 1, 0, 1,
-0.445249, 0.5486447, -1.876245, 0.1411765, 1, 0, 1,
-0.4442942, 0.05949133, 0.2510454, 0.1333333, 1, 0, 1,
-0.4438857, 1.633865, -0.9563283, 0.1294118, 1, 0, 1,
-0.4433563, 1.050134, -0.2452424, 0.1215686, 1, 0, 1,
-0.4381172, -0.1117098, -2.357448, 0.1176471, 1, 0, 1,
-0.4356694, 0.1035128, -1.71327, 0.1098039, 1, 0, 1,
-0.432712, 1.849776, -0.5955885, 0.1058824, 1, 0, 1,
-0.4317238, -0.2147404, -2.864605, 0.09803922, 1, 0, 1,
-0.4315558, -0.7240684, -2.706139, 0.09019608, 1, 0, 1,
-0.4247645, 0.2343438, -1.960402, 0.08627451, 1, 0, 1,
-0.4232917, -0.3204281, -3.173005, 0.07843138, 1, 0, 1,
-0.4188552, 0.3025419, 0.4550872, 0.07450981, 1, 0, 1,
-0.4177089, -0.194479, -2.218803, 0.06666667, 1, 0, 1,
-0.4157617, 1.472497, 0.0979085, 0.0627451, 1, 0, 1,
-0.4096993, 1.185763, 0.7600432, 0.05490196, 1, 0, 1,
-0.4053876, -0.2458986, -3.604797, 0.05098039, 1, 0, 1,
-0.401727, 0.0240306, -1.750639, 0.04313726, 1, 0, 1,
-0.3994212, 0.6149604, 1.520699, 0.03921569, 1, 0, 1,
-0.3977581, -0.6889254, -2.081404, 0.03137255, 1, 0, 1,
-0.3969092, 1.052916, -2.993347, 0.02745098, 1, 0, 1,
-0.3951505, 1.576328, -0.1136534, 0.01960784, 1, 0, 1,
-0.3892792, 0.5738381, -0.06127696, 0.01568628, 1, 0, 1,
-0.3842847, 1.353686, 0.4338764, 0.007843138, 1, 0, 1,
-0.3824541, -0.370784, -3.054029, 0.003921569, 1, 0, 1,
-0.3808436, 0.1621123, -0.01258705, 0, 1, 0.003921569, 1,
-0.3803218, 1.265403, -1.553137, 0, 1, 0.01176471, 1,
-0.3745936, 0.3411818, -1.769408, 0, 1, 0.01568628, 1,
-0.3599856, 0.8771487, -0.7961151, 0, 1, 0.02352941, 1,
-0.3588639, -2.434969, -2.282674, 0, 1, 0.02745098, 1,
-0.358244, 0.2436017, 0.6517384, 0, 1, 0.03529412, 1,
-0.3529769, 0.2555178, -0.04590536, 0, 1, 0.03921569, 1,
-0.3505926, 2.31635, -0.7203066, 0, 1, 0.04705882, 1,
-0.3499744, -1.053662, -2.35153, 0, 1, 0.05098039, 1,
-0.3471641, 0.4135979, 0.2356051, 0, 1, 0.05882353, 1,
-0.343783, -0.5880121, -2.727766, 0, 1, 0.0627451, 1,
-0.340946, 0.3742438, -0.7502624, 0, 1, 0.07058824, 1,
-0.3316375, -0.05389071, -1.228513, 0, 1, 0.07450981, 1,
-0.3306563, -1.056546, -2.780115, 0, 1, 0.08235294, 1,
-0.3220096, 0.9078763, -1.531087, 0, 1, 0.08627451, 1,
-0.319893, 0.7620438, -0.2301861, 0, 1, 0.09411765, 1,
-0.315156, 1.391406, -0.4686893, 0, 1, 0.1019608, 1,
-0.3147205, 0.5392406, -0.07042147, 0, 1, 0.1058824, 1,
-0.3128556, -0.896308, -2.860565, 0, 1, 0.1137255, 1,
-0.3108074, -1.025516, -4.20758, 0, 1, 0.1176471, 1,
-0.3105305, -0.7710962, -2.301077, 0, 1, 0.1254902, 1,
-0.3103753, 1.085627, 1.522723, 0, 1, 0.1294118, 1,
-0.3088022, 0.07200589, 0.01194741, 0, 1, 0.1372549, 1,
-0.3042063, -1.122518, -1.889819, 0, 1, 0.1411765, 1,
-0.3025526, -0.3305756, -2.930508, 0, 1, 0.1490196, 1,
-0.3002608, -0.3379949, -1.152817, 0, 1, 0.1529412, 1,
-0.2957778, -0.5046946, -5.248423, 0, 1, 0.1607843, 1,
-0.2873326, -0.4351093, -4.000173, 0, 1, 0.1647059, 1,
-0.2868035, -1.843769, -3.721874, 0, 1, 0.172549, 1,
-0.2863965, -0.9460614, -2.291677, 0, 1, 0.1764706, 1,
-0.2855238, -0.3616454, -3.056022, 0, 1, 0.1843137, 1,
-0.2848401, -0.184631, -2.299325, 0, 1, 0.1882353, 1,
-0.2811115, 0.7800749, -1.368068, 0, 1, 0.1960784, 1,
-0.2776817, 0.1235047, -3.351611, 0, 1, 0.2039216, 1,
-0.2769312, 0.2157725, -0.5591646, 0, 1, 0.2078431, 1,
-0.2762824, -0.4756857, -2.407021, 0, 1, 0.2156863, 1,
-0.2693236, -0.3502928, -2.730468, 0, 1, 0.2196078, 1,
-0.2663174, 0.3660561, -1.440863, 0, 1, 0.227451, 1,
-0.2657054, -0.2025683, -1.567611, 0, 1, 0.2313726, 1,
-0.2637729, -0.7089378, -2.836404, 0, 1, 0.2392157, 1,
-0.2612275, 0.3376122, -0.7212627, 0, 1, 0.2431373, 1,
-0.2559482, 0.1465229, -1.080282, 0, 1, 0.2509804, 1,
-0.2555765, 0.4111303, -0.7902052, 0, 1, 0.254902, 1,
-0.2507931, -0.0006066184, -1.079737, 0, 1, 0.2627451, 1,
-0.246636, -1.804694, -2.067876, 0, 1, 0.2666667, 1,
-0.2421376, 0.07633206, -2.990287, 0, 1, 0.2745098, 1,
-0.2408087, 1.360725, -0.4566019, 0, 1, 0.2784314, 1,
-0.2382562, 1.050305, -0.6941125, 0, 1, 0.2862745, 1,
-0.2325924, -1.611261, -1.35784, 0, 1, 0.2901961, 1,
-0.2319514, -0.5088675, -2.946472, 0, 1, 0.2980392, 1,
-0.228275, 0.515909, -0.4442972, 0, 1, 0.3058824, 1,
-0.2273, 0.6647565, -1.027561, 0, 1, 0.3098039, 1,
-0.2203563, -0.6213576, -4.03231, 0, 1, 0.3176471, 1,
-0.2188508, 1.376212, 0.40116, 0, 1, 0.3215686, 1,
-0.2187537, 0.1666186, -1.474218, 0, 1, 0.3294118, 1,
-0.2186755, -0.1646022, -2.702002, 0, 1, 0.3333333, 1,
-0.21426, 1.134012, -0.7966098, 0, 1, 0.3411765, 1,
-0.2063151, 1.428232, 0.1692922, 0, 1, 0.345098, 1,
-0.20081, 0.7561313, -0.3276866, 0, 1, 0.3529412, 1,
-0.1982771, 2.081193, -0.6147195, 0, 1, 0.3568628, 1,
-0.1971922, -1.233914, -3.905619, 0, 1, 0.3647059, 1,
-0.1961706, 0.2579119, -0.8044559, 0, 1, 0.3686275, 1,
-0.1925979, -1.610069, -3.50775, 0, 1, 0.3764706, 1,
-0.1883801, -1.102329, -4.039616, 0, 1, 0.3803922, 1,
-0.1861707, -0.0228644, 0.01950013, 0, 1, 0.3882353, 1,
-0.1858316, 0.2729886, -0.02090691, 0, 1, 0.3921569, 1,
-0.1838638, 0.4592608, 1.652347, 0, 1, 0.4, 1,
-0.1825853, 0.05359416, -1.485485, 0, 1, 0.4078431, 1,
-0.1787447, -0.6680064, -2.378548, 0, 1, 0.4117647, 1,
-0.1783684, 0.6153206, -0.4335217, 0, 1, 0.4196078, 1,
-0.1717858, 1.465878, 1.484041, 0, 1, 0.4235294, 1,
-0.1699158, 0.895533, -2.58056, 0, 1, 0.4313726, 1,
-0.1641445, -0.5568563, -3.190016, 0, 1, 0.4352941, 1,
-0.1627823, -0.5786177, -4.29027, 0, 1, 0.4431373, 1,
-0.1580292, -2.110281, -4.344329, 0, 1, 0.4470588, 1,
-0.1527545, -0.4521821, -3.512814, 0, 1, 0.454902, 1,
-0.1515521, -0.6067822, -1.931813, 0, 1, 0.4588235, 1,
-0.1493842, 0.1515408, 0.2627028, 0, 1, 0.4666667, 1,
-0.1480435, -1.190862, -3.062634, 0, 1, 0.4705882, 1,
-0.1476573, 0.413381, 0.06721272, 0, 1, 0.4784314, 1,
-0.1402798, 2.33502, -0.918405, 0, 1, 0.4823529, 1,
-0.139498, -1.97906, -2.338343, 0, 1, 0.4901961, 1,
-0.1354724, -1.636413, -3.348146, 0, 1, 0.4941176, 1,
-0.1333093, 0.07116517, -2.785833, 0, 1, 0.5019608, 1,
-0.1328437, -1.697795, -2.283271, 0, 1, 0.509804, 1,
-0.1307407, -1.761428, -2.90318, 0, 1, 0.5137255, 1,
-0.1284133, -0.626803, -2.729453, 0, 1, 0.5215687, 1,
-0.1256579, -0.5425644, -3.359499, 0, 1, 0.5254902, 1,
-0.1255495, 0.06600942, 0.02188261, 0, 1, 0.5333334, 1,
-0.1240901, -1.116653, -1.968461, 0, 1, 0.5372549, 1,
-0.1213971, 0.4009059, 0.2782235, 0, 1, 0.5450981, 1,
-0.1202648, -1.787271, -3.233089, 0, 1, 0.5490196, 1,
-0.1197694, -1.01724, -4.776063, 0, 1, 0.5568628, 1,
-0.1187759, 0.02528011, -2.729728, 0, 1, 0.5607843, 1,
-0.1090026, 0.5643657, -0.3467432, 0, 1, 0.5686275, 1,
-0.1049141, -2.793949, -1.983832, 0, 1, 0.572549, 1,
-0.1039882, -0.9485328, -3.461329, 0, 1, 0.5803922, 1,
-0.1035737, -0.2885513, -1.594383, 0, 1, 0.5843138, 1,
-0.1001846, -0.6887432, -2.205251, 0, 1, 0.5921569, 1,
-0.1001573, 2.693114, 0.7258267, 0, 1, 0.5960785, 1,
-0.0994774, -0.7504613, -2.53686, 0, 1, 0.6039216, 1,
-0.09824777, -0.8424916, -3.167291, 0, 1, 0.6117647, 1,
-0.09609883, 0.2578803, -0.5624793, 0, 1, 0.6156863, 1,
-0.09386995, 0.04769663, -2.404989, 0, 1, 0.6235294, 1,
-0.08810904, 0.3222392, -1.13968, 0, 1, 0.627451, 1,
-0.08779617, -0.4729163, -2.665437, 0, 1, 0.6352941, 1,
-0.0874226, 0.3686859, -1.009228, 0, 1, 0.6392157, 1,
-0.08195135, -1.914229, -4.077003, 0, 1, 0.6470588, 1,
-0.08109756, 2.157151, -1.07034, 0, 1, 0.6509804, 1,
-0.08092064, 0.3150227, -0.8295789, 0, 1, 0.6588235, 1,
-0.08023343, -0.551487, -4.062103, 0, 1, 0.6627451, 1,
-0.07375813, -1.534691, -2.063405, 0, 1, 0.6705883, 1,
-0.06708524, -1.138265, -2.182512, 0, 1, 0.6745098, 1,
-0.06626493, -0.08320051, -1.838187, 0, 1, 0.682353, 1,
-0.06305998, -2.604611, -2.625982, 0, 1, 0.6862745, 1,
-0.06267577, -1.903776, -2.845927, 0, 1, 0.6941177, 1,
-0.06238165, -0.1943553, -2.997265, 0, 1, 0.7019608, 1,
-0.05964847, -0.00614688, -1.955291, 0, 1, 0.7058824, 1,
-0.05372243, -0.6805713, -3.370841, 0, 1, 0.7137255, 1,
-0.05371556, 0.1745966, 0.7312609, 0, 1, 0.7176471, 1,
-0.04921696, -0.4459206, -3.748761, 0, 1, 0.7254902, 1,
-0.04906326, 0.05563719, -1.433393, 0, 1, 0.7294118, 1,
-0.0489659, -0.9942979, -3.355708, 0, 1, 0.7372549, 1,
-0.04670902, 0.6142404, 2.191153, 0, 1, 0.7411765, 1,
-0.04466254, 0.04654677, -1.366958, 0, 1, 0.7490196, 1,
-0.04281581, -1.398832, -2.783516, 0, 1, 0.7529412, 1,
-0.0401655, 2.03734, 0.4752941, 0, 1, 0.7607843, 1,
-0.03848328, -0.4565677, -3.14216, 0, 1, 0.7647059, 1,
-0.03519977, 1.914216, -1.115822, 0, 1, 0.772549, 1,
-0.03491758, 0.2283789, 1.477505, 0, 1, 0.7764706, 1,
-0.03187967, -0.7167408, -3.052659, 0, 1, 0.7843137, 1,
-0.02771476, -0.9814727, -3.874092, 0, 1, 0.7882353, 1,
-0.02388665, 1.163835, -1.206013, 0, 1, 0.7960784, 1,
-0.02316456, -0.8946733, -2.703017, 0, 1, 0.8039216, 1,
-0.02285004, -1.576301, -3.313714, 0, 1, 0.8078431, 1,
-0.02128921, 0.8336079, -0.2264431, 0, 1, 0.8156863, 1,
-0.02075654, -1.063698, -2.220881, 0, 1, 0.8196079, 1,
-0.01738019, 0.04518662, 0.1853997, 0, 1, 0.827451, 1,
-0.01410723, 1.330278, -1.521626, 0, 1, 0.8313726, 1,
-0.008088305, 0.1183395, -0.6446989, 0, 1, 0.8392157, 1,
-0.007184143, 0.9230319, -0.06619569, 0, 1, 0.8431373, 1,
-0.006150222, -0.1322583, -2.348656, 0, 1, 0.8509804, 1,
1.710805e-05, 1.41357, -0.8255216, 0, 1, 0.854902, 1,
0.001065479, -0.4591753, 3.903482, 0, 1, 0.8627451, 1,
0.005677994, -0.4392903, 3.055593, 0, 1, 0.8666667, 1,
0.005684792, -0.2843428, 3.196955, 0, 1, 0.8745098, 1,
0.005824963, -1.245259, 2.270204, 0, 1, 0.8784314, 1,
0.006511881, 1.591653, 0.4079198, 0, 1, 0.8862745, 1,
0.01043996, -0.5588976, 3.046149, 0, 1, 0.8901961, 1,
0.01179659, -1.571146, 1.983836, 0, 1, 0.8980392, 1,
0.01279713, -0.433686, 4.429541, 0, 1, 0.9058824, 1,
0.01999271, 0.2242765, 0.4881696, 0, 1, 0.9098039, 1,
0.02272822, 0.517745, 1.452788, 0, 1, 0.9176471, 1,
0.02339484, 0.625872, 1.265707, 0, 1, 0.9215686, 1,
0.02666681, -0.6616089, 3.048057, 0, 1, 0.9294118, 1,
0.02871014, -0.8058432, 5.542277, 0, 1, 0.9333333, 1,
0.0294242, -0.07986024, 4.262611, 0, 1, 0.9411765, 1,
0.0334788, 0.7066996, -0.6529505, 0, 1, 0.945098, 1,
0.03744282, -2.118757, 3.729114, 0, 1, 0.9529412, 1,
0.03834289, -0.03468206, 4.604018, 0, 1, 0.9568627, 1,
0.03860233, 1.467176, 0.6811299, 0, 1, 0.9647059, 1,
0.03861229, -1.056693, 3.304889, 0, 1, 0.9686275, 1,
0.03955129, -0.8482433, 2.753623, 0, 1, 0.9764706, 1,
0.04053035, -0.02276141, 1.950391, 0, 1, 0.9803922, 1,
0.04238159, -0.5726287, 4.110146, 0, 1, 0.9882353, 1,
0.04248316, 1.802007, -1.244037, 0, 1, 0.9921569, 1,
0.04509661, -0.2750653, 3.78904, 0, 1, 1, 1,
0.04664646, 1.211061, -0.3684578, 0, 0.9921569, 1, 1,
0.0478649, 0.5216278, 1.945484, 0, 0.9882353, 1, 1,
0.0508043, -0.4964398, 2.591477, 0, 0.9803922, 1, 1,
0.05196096, 2.250884, -0.01163836, 0, 0.9764706, 1, 1,
0.0526154, 1.492725, 0.1267778, 0, 0.9686275, 1, 1,
0.0568638, 0.1523141, 0.8523386, 0, 0.9647059, 1, 1,
0.0577744, 0.9177709, -0.3375566, 0, 0.9568627, 1, 1,
0.06004757, -0.5062048, 3.413447, 0, 0.9529412, 1, 1,
0.06343485, 1.440742, -1.886111, 0, 0.945098, 1, 1,
0.06429695, -0.05671188, 2.656814, 0, 0.9411765, 1, 1,
0.06806759, 0.2629881, -0.01889759, 0, 0.9333333, 1, 1,
0.0684071, -0.09546785, 1.040624, 0, 0.9294118, 1, 1,
0.06906573, -2.389371, 3.305017, 0, 0.9215686, 1, 1,
0.07165236, 0.2676013, -0.4903372, 0, 0.9176471, 1, 1,
0.07221153, -1.124028, 2.645825, 0, 0.9098039, 1, 1,
0.07934762, -1.060604, 1.981345, 0, 0.9058824, 1, 1,
0.08161875, -1.226673, 3.582886, 0, 0.8980392, 1, 1,
0.0839873, -0.1617811, 3.067162, 0, 0.8901961, 1, 1,
0.08767488, 2.272241, -0.481284, 0, 0.8862745, 1, 1,
0.09188114, -0.6737077, 5.61417, 0, 0.8784314, 1, 1,
0.09235106, 0.08097647, 1.34204, 0, 0.8745098, 1, 1,
0.09275518, 2.207137, -0.2290069, 0, 0.8666667, 1, 1,
0.09298618, 0.5398602, 0.8534331, 0, 0.8627451, 1, 1,
0.09504744, -1.843862, 3.037898, 0, 0.854902, 1, 1,
0.09668058, 2.359997, 1.523697, 0, 0.8509804, 1, 1,
0.09978481, 0.03509121, 1.890818, 0, 0.8431373, 1, 1,
0.1007961, -0.137772, 2.585466, 0, 0.8392157, 1, 1,
0.1010604, 0.2826304, 0.1456255, 0, 0.8313726, 1, 1,
0.1061073, 1.456411, -1.42504, 0, 0.827451, 1, 1,
0.1068427, 0.6313201, 0.9720132, 0, 0.8196079, 1, 1,
0.1081151, -1.34634, 4.105052, 0, 0.8156863, 1, 1,
0.1084934, -1.130209, 4.150509, 0, 0.8078431, 1, 1,
0.1094711, -0.5001832, 1.454801, 0, 0.8039216, 1, 1,
0.1111829, 1.02449, 0.4883921, 0, 0.7960784, 1, 1,
0.1114314, -0.4363885, 2.41105, 0, 0.7882353, 1, 1,
0.1147442, 0.5189789, 0.3302296, 0, 0.7843137, 1, 1,
0.1158015, 0.1013765, -0.730574, 0, 0.7764706, 1, 1,
0.1169256, 0.3199234, -0.09814347, 0, 0.772549, 1, 1,
0.1199407, 0.4549802, -1.417161, 0, 0.7647059, 1, 1,
0.12025, 0.758198, 0.7707736, 0, 0.7607843, 1, 1,
0.1248553, -0.1218279, 2.816806, 0, 0.7529412, 1, 1,
0.1300975, 0.5533791, -0.009955687, 0, 0.7490196, 1, 1,
0.1346279, 0.7489413, 1.073428, 0, 0.7411765, 1, 1,
0.1348096, -0.102309, 4.04923, 0, 0.7372549, 1, 1,
0.1365342, 1.288164, -0.9361147, 0, 0.7294118, 1, 1,
0.1391664, 0.629776, -2.851278, 0, 0.7254902, 1, 1,
0.1412925, -0.634036, 2.321618, 0, 0.7176471, 1, 1,
0.1419462, -0.05045112, 0.1938956, 0, 0.7137255, 1, 1,
0.1461144, -1.039346, 2.177663, 0, 0.7058824, 1, 1,
0.1480753, -0.9372714, 3.330376, 0, 0.6980392, 1, 1,
0.154406, -0.020932, 1.898593, 0, 0.6941177, 1, 1,
0.1561314, -0.351951, 2.751613, 0, 0.6862745, 1, 1,
0.1567043, 0.6085625, 0.3252861, 0, 0.682353, 1, 1,
0.1579215, -0.5866534, 1.908015, 0, 0.6745098, 1, 1,
0.1591374, 1.24579, 1.203311, 0, 0.6705883, 1, 1,
0.1608152, 1.546981, 1.148438, 0, 0.6627451, 1, 1,
0.1667689, 0.008594364, 3.305865, 0, 0.6588235, 1, 1,
0.1706349, -1.096146, 3.540411, 0, 0.6509804, 1, 1,
0.172905, -0.4499924, 3.938384, 0, 0.6470588, 1, 1,
0.1752167, -0.4435993, 3.276335, 0, 0.6392157, 1, 1,
0.1763099, -1.6352, 2.907549, 0, 0.6352941, 1, 1,
0.1806122, 1.174232, 1.044995, 0, 0.627451, 1, 1,
0.1825681, -1.182641, 3.155248, 0, 0.6235294, 1, 1,
0.1840481, -0.8863727, 5.038745, 0, 0.6156863, 1, 1,
0.1888257, 0.4975144, 1.099349, 0, 0.6117647, 1, 1,
0.1929982, 0.6849666, 1.22504, 0, 0.6039216, 1, 1,
0.1945897, 1.280869, 0.8316981, 0, 0.5960785, 1, 1,
0.1949245, -1.025502, 3.247527, 0, 0.5921569, 1, 1,
0.1955949, 0.1071225, 1.817594, 0, 0.5843138, 1, 1,
0.196079, -1.137921, 4.110039, 0, 0.5803922, 1, 1,
0.1961962, 2.076677, -0.7093129, 0, 0.572549, 1, 1,
0.1976453, -0.1253798, 2.04208, 0, 0.5686275, 1, 1,
0.2019134, -0.1243682, 2.166005, 0, 0.5607843, 1, 1,
0.2043717, -0.1468473, 3.158754, 0, 0.5568628, 1, 1,
0.207459, -0.07778529, 1.866661, 0, 0.5490196, 1, 1,
0.2121599, -0.6838796, 2.473357, 0, 0.5450981, 1, 1,
0.2129418, -0.0332733, 2.196628, 0, 0.5372549, 1, 1,
0.2216742, 1.370229, -0.4582963, 0, 0.5333334, 1, 1,
0.2217536, 0.1280887, 1.392639, 0, 0.5254902, 1, 1,
0.2246237, 1.20895, -0.5032107, 0, 0.5215687, 1, 1,
0.2279777, -0.7054544, 2.297386, 0, 0.5137255, 1, 1,
0.2307987, 0.9497967, 1.543078, 0, 0.509804, 1, 1,
0.2349906, -0.2271652, 1.708476, 0, 0.5019608, 1, 1,
0.2380657, -0.9956423, 0.9611509, 0, 0.4941176, 1, 1,
0.2438935, 0.07297394, 2.127, 0, 0.4901961, 1, 1,
0.2486043, 0.100613, 2.209646, 0, 0.4823529, 1, 1,
0.2527007, -0.002491592, 3.703926, 0, 0.4784314, 1, 1,
0.2552672, -1.043993, 0.2060142, 0, 0.4705882, 1, 1,
0.255876, 1.681787, -0.5861923, 0, 0.4666667, 1, 1,
0.2578929, -1.413075, 2.946265, 0, 0.4588235, 1, 1,
0.2584803, 2.313948, 1.208717, 0, 0.454902, 1, 1,
0.2597156, -2.007291, 2.337881, 0, 0.4470588, 1, 1,
0.2605838, 0.1463129, 0.008617547, 0, 0.4431373, 1, 1,
0.2637325, -1.310104, 2.243355, 0, 0.4352941, 1, 1,
0.2680339, -0.339602, 2.905245, 0, 0.4313726, 1, 1,
0.2707902, 0.3796314, -0.4607985, 0, 0.4235294, 1, 1,
0.2719054, 0.611333, -2.203194, 0, 0.4196078, 1, 1,
0.2723952, 0.2241215, 1.88465, 0, 0.4117647, 1, 1,
0.2750085, -0.5416127, 3.993729, 0, 0.4078431, 1, 1,
0.277252, 0.2998914, 0.4783881, 0, 0.4, 1, 1,
0.2778369, -0.1962334, 0.457358, 0, 0.3921569, 1, 1,
0.2781932, 0.8181452, 0.7859313, 0, 0.3882353, 1, 1,
0.2789876, 0.5902959, -0.3563864, 0, 0.3803922, 1, 1,
0.2795551, -1.374754, 1.507274, 0, 0.3764706, 1, 1,
0.2803186, 0.7101501, 0.1268079, 0, 0.3686275, 1, 1,
0.2827729, 1.322012, 0.4149039, 0, 0.3647059, 1, 1,
0.2839224, 1.022257, 1.035136, 0, 0.3568628, 1, 1,
0.2847029, 1.064617, 0.3314121, 0, 0.3529412, 1, 1,
0.2879141, -0.1754328, 2.634537, 0, 0.345098, 1, 1,
0.2885877, -0.8268194, 2.579437, 0, 0.3411765, 1, 1,
0.2891723, -0.5330101, 3.800427, 0, 0.3333333, 1, 1,
0.2894512, 1.133719, -0.4543359, 0, 0.3294118, 1, 1,
0.2896536, -1.111934, 2.781945, 0, 0.3215686, 1, 1,
0.2901806, -1.749921, 2.999201, 0, 0.3176471, 1, 1,
0.2921571, 0.1420669, 2.537647, 0, 0.3098039, 1, 1,
0.2977631, -0.01039527, 4.591445, 0, 0.3058824, 1, 1,
0.2985923, -0.6666659, 3.920005, 0, 0.2980392, 1, 1,
0.3057721, -1.195251, 3.181944, 0, 0.2901961, 1, 1,
0.3079488, 0.2049306, 1.294171, 0, 0.2862745, 1, 1,
0.3086086, 1.285575, 0.221439, 0, 0.2784314, 1, 1,
0.3106443, 0.3014309, 2.426561, 0, 0.2745098, 1, 1,
0.3123091, -0.9105647, 3.122866, 0, 0.2666667, 1, 1,
0.3134176, -1.53588, 3.737634, 0, 0.2627451, 1, 1,
0.3205734, 0.225695, -0.5304429, 0, 0.254902, 1, 1,
0.3214735, -0.3446646, 3.740949, 0, 0.2509804, 1, 1,
0.3241268, 0.6548206, -0.7275597, 0, 0.2431373, 1, 1,
0.3285252, -1.210073, 2.601981, 0, 0.2392157, 1, 1,
0.328956, -0.1513662, 2.121085, 0, 0.2313726, 1, 1,
0.33029, -1.249833, 2.229156, 0, 0.227451, 1, 1,
0.33282, 1.117786, 0.5028093, 0, 0.2196078, 1, 1,
0.3354428, 2.625144, 0.2429835, 0, 0.2156863, 1, 1,
0.3378111, 0.7423292, -0.5042206, 0, 0.2078431, 1, 1,
0.3378675, -0.1837101, 0.9717754, 0, 0.2039216, 1, 1,
0.3379477, -0.7667948, 3.552613, 0, 0.1960784, 1, 1,
0.3418505, -0.6474717, 3.095113, 0, 0.1882353, 1, 1,
0.3422327, 1.412109, 1.00787, 0, 0.1843137, 1, 1,
0.3423204, -0.2627124, 3.149514, 0, 0.1764706, 1, 1,
0.3484704, -0.6352384, 1.620673, 0, 0.172549, 1, 1,
0.3496646, 0.7952532, 0.0004478893, 0, 0.1647059, 1, 1,
0.3525949, -1.884457, 1.575467, 0, 0.1607843, 1, 1,
0.3533903, -0.7551771, 2.782847, 0, 0.1529412, 1, 1,
0.3581947, -1.445566, 4.355257, 0, 0.1490196, 1, 1,
0.3597265, -0.2832308, 3.15011, 0, 0.1411765, 1, 1,
0.3627352, -0.540987, 2.466617, 0, 0.1372549, 1, 1,
0.3645943, -0.9315809, 2.258392, 0, 0.1294118, 1, 1,
0.3648537, 0.2218593, 1.153921, 0, 0.1254902, 1, 1,
0.3657976, -1.026321, 4.735525, 0, 0.1176471, 1, 1,
0.3664979, -0.525788, 3.874986, 0, 0.1137255, 1, 1,
0.3761753, -0.4038242, 0.7773027, 0, 0.1058824, 1, 1,
0.3873532, -1.630382, 0.6623129, 0, 0.09803922, 1, 1,
0.3892056, 0.7952027, 0.4401557, 0, 0.09411765, 1, 1,
0.3898698, -1.198287, 2.636373, 0, 0.08627451, 1, 1,
0.3913672, 1.376704, -0.6925039, 0, 0.08235294, 1, 1,
0.3915867, -0.8494164, 3.835915, 0, 0.07450981, 1, 1,
0.3926587, -2.103393, 3.057509, 0, 0.07058824, 1, 1,
0.3962347, -1.406392, 3.908094, 0, 0.0627451, 1, 1,
0.397322, 0.2367996, -0.008471905, 0, 0.05882353, 1, 1,
0.3983134, -1.415008, 3.749027, 0, 0.05098039, 1, 1,
0.3996032, -0.4386467, 2.227166, 0, 0.04705882, 1, 1,
0.399605, 0.09399968, 2.418176, 0, 0.03921569, 1, 1,
0.4008929, 2.111409, -1.413609, 0, 0.03529412, 1, 1,
0.4016697, -1.593858, 2.507609, 0, 0.02745098, 1, 1,
0.4025413, -1.382557, 2.056033, 0, 0.02352941, 1, 1,
0.4025526, 0.1928878, 0.9711895, 0, 0.01568628, 1, 1,
0.4061851, 1.072902, 0.3283049, 0, 0.01176471, 1, 1,
0.4062319, -0.3184651, 3.151109, 0, 0.003921569, 1, 1,
0.4089061, 0.6289605, 0.03306984, 0.003921569, 0, 1, 1,
0.4103129, 0.3182749, -0.7984151, 0.007843138, 0, 1, 1,
0.4145143, 1.110556, 0.754316, 0.01568628, 0, 1, 1,
0.4145165, 0.02715916, 2.201511, 0.01960784, 0, 1, 1,
0.4169438, 1.612403, 0.4549563, 0.02745098, 0, 1, 1,
0.4222147, -0.257972, 2.220241, 0.03137255, 0, 1, 1,
0.4249387, -0.03399498, 1.219867, 0.03921569, 0, 1, 1,
0.4261309, 2.645496, -0.8827171, 0.04313726, 0, 1, 1,
0.4331838, -0.2322532, 1.639136, 0.05098039, 0, 1, 1,
0.4353115, -0.8709562, 2.948545, 0.05490196, 0, 1, 1,
0.4372814, 0.6426848, 2.770073, 0.0627451, 0, 1, 1,
0.4442108, 1.186233, -0.2696624, 0.06666667, 0, 1, 1,
0.4499544, -0.6138164, 3.009954, 0.07450981, 0, 1, 1,
0.4504548, -0.60821, 2.192548, 0.07843138, 0, 1, 1,
0.4520433, -1.231165, 4.76054, 0.08627451, 0, 1, 1,
0.452076, -0.7364579, 1.791665, 0.09019608, 0, 1, 1,
0.4527371, 2.213852, -0.2611016, 0.09803922, 0, 1, 1,
0.4543389, 1.081405, 0.06410605, 0.1058824, 0, 1, 1,
0.455844, -0.1235829, 0.3142593, 0.1098039, 0, 1, 1,
0.4574426, -0.9269739, 4.887201, 0.1176471, 0, 1, 1,
0.4635617, 0.1538292, 1.262778, 0.1215686, 0, 1, 1,
0.4671106, -0.2342719, 2.869836, 0.1294118, 0, 1, 1,
0.4719567, 0.8465677, -1.279833, 0.1333333, 0, 1, 1,
0.4719895, 1.242435, -0.2223448, 0.1411765, 0, 1, 1,
0.4770951, 0.3385943, 1.84032, 0.145098, 0, 1, 1,
0.478086, 0.543285, 1.166867, 0.1529412, 0, 1, 1,
0.483217, -0.4602247, 2.839929, 0.1568628, 0, 1, 1,
0.4867054, -0.9395612, 2.525584, 0.1647059, 0, 1, 1,
0.4870387, 0.04890162, 0.4942822, 0.1686275, 0, 1, 1,
0.4882236, -1.919458, 1.921187, 0.1764706, 0, 1, 1,
0.4884638, -1.795139, 2.247146, 0.1803922, 0, 1, 1,
0.4910619, 1.616146, 0.4459853, 0.1882353, 0, 1, 1,
0.4916881, 0.2467953, 1.745455, 0.1921569, 0, 1, 1,
0.4917681, 1.482684, -1.242951, 0.2, 0, 1, 1,
0.4926801, 0.8894823, 0.3540122, 0.2078431, 0, 1, 1,
0.4935329, 0.1607643, 0.5699337, 0.2117647, 0, 1, 1,
0.4961053, 0.3449969, 1.526217, 0.2196078, 0, 1, 1,
0.4978491, 1.153661, 0.1442038, 0.2235294, 0, 1, 1,
0.5040021, 0.6607332, 2.429858, 0.2313726, 0, 1, 1,
0.5067754, -0.6220416, 1.610925, 0.2352941, 0, 1, 1,
0.5132893, -0.6331248, 2.513387, 0.2431373, 0, 1, 1,
0.5139497, 0.1871708, 0.6383217, 0.2470588, 0, 1, 1,
0.5140066, -1.567044, 3.033875, 0.254902, 0, 1, 1,
0.5148276, 0.7428924, 0.7190598, 0.2588235, 0, 1, 1,
0.5175757, -0.9538877, 2.998454, 0.2666667, 0, 1, 1,
0.5253039, -0.03597512, 2.550758, 0.2705882, 0, 1, 1,
0.52598, -0.2540279, 2.341609, 0.2784314, 0, 1, 1,
0.5263299, 0.4831402, 1.649349, 0.282353, 0, 1, 1,
0.527226, -0.06911784, 1.834327, 0.2901961, 0, 1, 1,
0.5303795, 2.466044, 2.865993, 0.2941177, 0, 1, 1,
0.535686, 0.08406588, 0.3391799, 0.3019608, 0, 1, 1,
0.539947, 0.4727406, 1.279003, 0.3098039, 0, 1, 1,
0.5406665, -1.51408, 2.332847, 0.3137255, 0, 1, 1,
0.5410633, -1.498703, 4.288146, 0.3215686, 0, 1, 1,
0.5444642, 0.673281, 1.728588, 0.3254902, 0, 1, 1,
0.5461203, -0.3357992, 0.511023, 0.3333333, 0, 1, 1,
0.5476687, -0.7931314, 2.997146, 0.3372549, 0, 1, 1,
0.5476818, -1.105626, 0.09380154, 0.345098, 0, 1, 1,
0.5491895, -1.751875, 1.732968, 0.3490196, 0, 1, 1,
0.553425, -1.867569, 2.812516, 0.3568628, 0, 1, 1,
0.5592027, 0.02003939, 1.665056, 0.3607843, 0, 1, 1,
0.5598983, -0.4009295, 3.714302, 0.3686275, 0, 1, 1,
0.5615571, 0.8835447, 0.7643482, 0.372549, 0, 1, 1,
0.5688419, -1.200985, 3.475962, 0.3803922, 0, 1, 1,
0.5756012, 2.140541, -2.072639, 0.3843137, 0, 1, 1,
0.5814286, -0.4164008, 1.816487, 0.3921569, 0, 1, 1,
0.5856196, 0.1257876, -0.2793245, 0.3960784, 0, 1, 1,
0.5901723, -0.05770705, 1.876312, 0.4039216, 0, 1, 1,
0.5923051, -0.3775927, 2.025914, 0.4117647, 0, 1, 1,
0.5954804, 0.2942968, 1.703449, 0.4156863, 0, 1, 1,
0.5965813, 0.4094538, 0.1848564, 0.4235294, 0, 1, 1,
0.5967379, -0.6258839, 1.249645, 0.427451, 0, 1, 1,
0.602299, 0.08240958, 0.07867848, 0.4352941, 0, 1, 1,
0.6055382, -0.5949206, 2.673416, 0.4392157, 0, 1, 1,
0.612568, 1.400933, 1.150404, 0.4470588, 0, 1, 1,
0.6236944, 0.3701118, 1.116501, 0.4509804, 0, 1, 1,
0.6237184, -0.6573451, 1.173158, 0.4588235, 0, 1, 1,
0.6262483, -0.4534752, 2.88964, 0.4627451, 0, 1, 1,
0.6277042, -2.080444, 4.470293, 0.4705882, 0, 1, 1,
0.6291881, 1.329345, -1.269279, 0.4745098, 0, 1, 1,
0.6295199, -1.785679, 3.646957, 0.4823529, 0, 1, 1,
0.6335315, -1.679628, 3.585366, 0.4862745, 0, 1, 1,
0.6346233, -0.5419035, 1.483179, 0.4941176, 0, 1, 1,
0.6358483, -0.2011127, 2.175979, 0.5019608, 0, 1, 1,
0.6387275, 0.1929758, 2.234931, 0.5058824, 0, 1, 1,
0.6396143, -0.1962303, 2.612045, 0.5137255, 0, 1, 1,
0.6423023, 0.9548901, -1.684809, 0.5176471, 0, 1, 1,
0.6443045, 0.6551052, 1.131651, 0.5254902, 0, 1, 1,
0.6571898, 0.5509929, -0.872317, 0.5294118, 0, 1, 1,
0.6593379, 0.1033653, 3.557067, 0.5372549, 0, 1, 1,
0.6598324, -1.184816, 4.587142, 0.5411765, 0, 1, 1,
0.6630316, 0.4431593, 0.8096559, 0.5490196, 0, 1, 1,
0.6635125, -0.04710798, 1.504951, 0.5529412, 0, 1, 1,
0.6675932, 0.5343504, 0.6640836, 0.5607843, 0, 1, 1,
0.6707448, 0.668872, 1.061451, 0.5647059, 0, 1, 1,
0.6719741, -0.3721893, 2.240027, 0.572549, 0, 1, 1,
0.6770139, -1.369345, 2.724948, 0.5764706, 0, 1, 1,
0.6775647, 0.3555693, 0.3205519, 0.5843138, 0, 1, 1,
0.6897568, -1.571318, 3.055121, 0.5882353, 0, 1, 1,
0.691606, 0.6803404, 0.327985, 0.5960785, 0, 1, 1,
0.6943316, -0.1057551, 2.194096, 0.6039216, 0, 1, 1,
0.695781, 1.247131, 0.6772679, 0.6078432, 0, 1, 1,
0.706734, -0.3114734, 0.5076165, 0.6156863, 0, 1, 1,
0.7079262, 0.4560632, -0.685494, 0.6196079, 0, 1, 1,
0.7120081, 0.3904809, 3.065579, 0.627451, 0, 1, 1,
0.7137524, 0.5991915, 2.750929, 0.6313726, 0, 1, 1,
0.7154832, -1.442382, 4.983931, 0.6392157, 0, 1, 1,
0.7201254, -0.6312791, 1.803405, 0.6431373, 0, 1, 1,
0.7306263, -0.690942, 2.286466, 0.6509804, 0, 1, 1,
0.7324803, -0.8081204, 2.655935, 0.654902, 0, 1, 1,
0.735072, -2.993618, 2.011363, 0.6627451, 0, 1, 1,
0.7481264, -0.5757552, 2.426624, 0.6666667, 0, 1, 1,
0.7495382, -0.4563635, 2.276241, 0.6745098, 0, 1, 1,
0.7503453, 0.9076079, 0.4420069, 0.6784314, 0, 1, 1,
0.7523711, -0.02781046, 0.6232517, 0.6862745, 0, 1, 1,
0.7578986, 0.1843614, 0.6636211, 0.6901961, 0, 1, 1,
0.7594886, 0.6889949, 1.396866, 0.6980392, 0, 1, 1,
0.7614363, -0.0507964, 0.7319562, 0.7058824, 0, 1, 1,
0.7622396, -1.00689, 0.9589481, 0.7098039, 0, 1, 1,
0.7637468, -2.459041, 0.6101258, 0.7176471, 0, 1, 1,
0.7676542, -1.002808, 2.626277, 0.7215686, 0, 1, 1,
0.7679998, 1.305848, 1.022205, 0.7294118, 0, 1, 1,
0.7709287, 2.112674, 0.587601, 0.7333333, 0, 1, 1,
0.7770714, -1.21881, 1.906394, 0.7411765, 0, 1, 1,
0.7784573, -1.044302, 2.684501, 0.7450981, 0, 1, 1,
0.7869164, -0.811489, 1.670793, 0.7529412, 0, 1, 1,
0.7928559, 0.9348562, 2.024354, 0.7568628, 0, 1, 1,
0.8005397, -0.9937131, 2.201452, 0.7647059, 0, 1, 1,
0.8038348, 0.1104489, 2.086656, 0.7686275, 0, 1, 1,
0.804114, -1.554324, 4.433755, 0.7764706, 0, 1, 1,
0.8050644, -0.9144503, 0.07066259, 0.7803922, 0, 1, 1,
0.8082357, -1.261401, 1.538102, 0.7882353, 0, 1, 1,
0.8100532, 0.7951301, 1.409504, 0.7921569, 0, 1, 1,
0.8119434, 0.09020018, 2.462931, 0.8, 0, 1, 1,
0.8150384, -0.4209422, 3.349049, 0.8078431, 0, 1, 1,
0.816394, -0.5450196, 2.001836, 0.8117647, 0, 1, 1,
0.8323085, -0.0606706, 0.993799, 0.8196079, 0, 1, 1,
0.8399518, 0.1230955, 2.904868, 0.8235294, 0, 1, 1,
0.8478637, -1.329571, 3.252927, 0.8313726, 0, 1, 1,
0.8516424, -0.7979138, 2.307294, 0.8352941, 0, 1, 1,
0.8537429, 0.8021467, 0.0491601, 0.8431373, 0, 1, 1,
0.8544124, -0.4423309, 2.940371, 0.8470588, 0, 1, 1,
0.8605099, -1.383323, 3.471193, 0.854902, 0, 1, 1,
0.8617364, -1.715548, 3.819141, 0.8588235, 0, 1, 1,
0.8618197, 1.471808, 0.3380221, 0.8666667, 0, 1, 1,
0.863911, -1.287735, 3.316792, 0.8705882, 0, 1, 1,
0.8650364, 0.6366042, 2.048609, 0.8784314, 0, 1, 1,
0.8658371, 0.1188274, 2.000457, 0.8823529, 0, 1, 1,
0.8721287, -1.784707, 2.763788, 0.8901961, 0, 1, 1,
0.8734087, -0.7060576, 3.380819, 0.8941177, 0, 1, 1,
0.8749354, -0.5033942, 0.7637831, 0.9019608, 0, 1, 1,
0.8800685, -1.467218, 2.448382, 0.9098039, 0, 1, 1,
0.880162, -1.028001, 1.262665, 0.9137255, 0, 1, 1,
0.8803341, 0.727653, 1.135265, 0.9215686, 0, 1, 1,
0.8888291, 0.2912217, 2.683965, 0.9254902, 0, 1, 1,
0.8924689, 0.4502569, 1.230257, 0.9333333, 0, 1, 1,
0.8940218, -0.1371183, 2.314688, 0.9372549, 0, 1, 1,
0.8940939, 0.5358008, 0.3734972, 0.945098, 0, 1, 1,
0.8951126, -0.7809141, 3.509712, 0.9490196, 0, 1, 1,
0.9015105, -1.111467, 3.522933, 0.9568627, 0, 1, 1,
0.9143023, -0.5863055, 2.61379, 0.9607843, 0, 1, 1,
0.9162655, -0.3368883, 1.76796, 0.9686275, 0, 1, 1,
0.9203233, 0.1425004, 0.5432203, 0.972549, 0, 1, 1,
0.9209045, -1.530121, 3.067536, 0.9803922, 0, 1, 1,
0.921339, -0.4861208, 1.805914, 0.9843137, 0, 1, 1,
0.9250994, -1.063901, 4.027187, 0.9921569, 0, 1, 1,
0.9251077, -1.208312, 2.304683, 0.9960784, 0, 1, 1,
0.9333004, 0.9889954, -1.173947, 1, 0, 0.9960784, 1,
0.9343793, -0.3139787, 1.45192, 1, 0, 0.9882353, 1,
0.9368274, 1.537053, 0.5588998, 1, 0, 0.9843137, 1,
0.9402747, 0.4803658, 0.9507062, 1, 0, 0.9764706, 1,
0.9405217, 1.054839, -0.4560632, 1, 0, 0.972549, 1,
0.9434185, -0.04366603, 1.621103, 1, 0, 0.9647059, 1,
0.9454015, -0.3561106, 1.849123, 1, 0, 0.9607843, 1,
0.9527552, -0.1573026, 2.240237, 1, 0, 0.9529412, 1,
0.9562179, 1.076703, 2.027518, 1, 0, 0.9490196, 1,
0.962595, -0.3060797, 2.797889, 1, 0, 0.9411765, 1,
0.9667014, 0.8670341, 1.75109, 1, 0, 0.9372549, 1,
0.9708424, 0.3061938, 0.8502569, 1, 0, 0.9294118, 1,
0.9755663, 0.6007581, 1.876595, 1, 0, 0.9254902, 1,
0.9804455, -1.07029, 2.328344, 1, 0, 0.9176471, 1,
0.982089, 0.6988643, 0.599515, 1, 0, 0.9137255, 1,
0.9823299, 0.894497, 0.6013625, 1, 0, 0.9058824, 1,
0.9841039, 0.8777054, 0.3267961, 1, 0, 0.9019608, 1,
0.9969863, -0.1899929, 1.916427, 1, 0, 0.8941177, 1,
1.00071, -0.08454533, 1.341469, 1, 0, 0.8862745, 1,
1.002052, -0.9552773, 1.889393, 1, 0, 0.8823529, 1,
1.003323, 0.7136881, 1.580756, 1, 0, 0.8745098, 1,
1.005607, 1.624763, 1.359694, 1, 0, 0.8705882, 1,
1.00702, 0.884127, -1.163362, 1, 0, 0.8627451, 1,
1.008076, -1.38119, 3.865229, 1, 0, 0.8588235, 1,
1.008507, 1.150784, -0.1267026, 1, 0, 0.8509804, 1,
1.0094, -1.650481, 3.619066, 1, 0, 0.8470588, 1,
1.011443, 0.6410608, 1.936144, 1, 0, 0.8392157, 1,
1.021277, 1.261671, 0.7512133, 1, 0, 0.8352941, 1,
1.022076, 0.09106889, 0.3730885, 1, 0, 0.827451, 1,
1.023006, -1.913988, 1.923623, 1, 0, 0.8235294, 1,
1.037496, -0.8345058, 1.887997, 1, 0, 0.8156863, 1,
1.037729, -0.08970086, 2.373473, 1, 0, 0.8117647, 1,
1.040911, -0.4193344, 3.113863, 1, 0, 0.8039216, 1,
1.050641, 0.4457317, 1.157891, 1, 0, 0.7960784, 1,
1.052555, 0.08963387, 2.337583, 1, 0, 0.7921569, 1,
1.059463, -2.23433, 3.297152, 1, 0, 0.7843137, 1,
1.063195, -0.7392445, 2.080337, 1, 0, 0.7803922, 1,
1.064018, -2.390107, 2.653409, 1, 0, 0.772549, 1,
1.067275, 1.17451, 1.923099, 1, 0, 0.7686275, 1,
1.067343, 0.7344375, 0.4415382, 1, 0, 0.7607843, 1,
1.068134, 1.211419, 0.5451384, 1, 0, 0.7568628, 1,
1.069903, 1.312551, 1.51834, 1, 0, 0.7490196, 1,
1.078938, -0.7896792, 0.8035655, 1, 0, 0.7450981, 1,
1.081913, 0.9079999, 1.059765, 1, 0, 0.7372549, 1,
1.086904, 0.8081018, 1.583745, 1, 0, 0.7333333, 1,
1.0884, -0.2357528, 1.752276, 1, 0, 0.7254902, 1,
1.09405, -0.06332048, 2.292521, 1, 0, 0.7215686, 1,
1.096479, 0.6184595, 1.646974, 1, 0, 0.7137255, 1,
1.097764, 0.8091859, 1.999048, 1, 0, 0.7098039, 1,
1.098007, -1.080598, 3.954593, 1, 0, 0.7019608, 1,
1.1064, 0.5672518, 0.5741777, 1, 0, 0.6941177, 1,
1.10658, -1.355784, 2.56531, 1, 0, 0.6901961, 1,
1.11551, 0.9518639, 0.1955729, 1, 0, 0.682353, 1,
1.122129, 1.027857, -0.06468546, 1, 0, 0.6784314, 1,
1.127651, 0.8026648, 1.772972, 1, 0, 0.6705883, 1,
1.129464, -1.188664, 3.755218, 1, 0, 0.6666667, 1,
1.131076, 0.2609189, 5.133197, 1, 0, 0.6588235, 1,
1.131191, -0.1992346, 1.830429, 1, 0, 0.654902, 1,
1.132902, -1.530292, 3.220096, 1, 0, 0.6470588, 1,
1.139448, -0.4321313, 1.847411, 1, 0, 0.6431373, 1,
1.158048, 0.9984561, 0.6046997, 1, 0, 0.6352941, 1,
1.165798, 1.1327, 1.154675, 1, 0, 0.6313726, 1,
1.168105, -0.9177343, 1.635531, 1, 0, 0.6235294, 1,
1.171487, -0.7895053, 3.97664, 1, 0, 0.6196079, 1,
1.179201, -0.9062719, 3.007671, 1, 0, 0.6117647, 1,
1.181507, 0.3624869, 0.6296815, 1, 0, 0.6078432, 1,
1.18252, 0.2536318, 1.488862, 1, 0, 0.6, 1,
1.185609, -1.237777, 3.166465, 1, 0, 0.5921569, 1,
1.194438, -1.110463, 1.568755, 1, 0, 0.5882353, 1,
1.195637, -0.1210747, 0.2110988, 1, 0, 0.5803922, 1,
1.199922, -0.9161857, 1.729519, 1, 0, 0.5764706, 1,
1.200792, -0.825387, 2.635617, 1, 0, 0.5686275, 1,
1.204276, -0.6042195, 1.58811, 1, 0, 0.5647059, 1,
1.22409, -0.6218931, 0.4200971, 1, 0, 0.5568628, 1,
1.231413, -0.7318514, 0.9076048, 1, 0, 0.5529412, 1,
1.231798, -0.3392259, 1.469587, 1, 0, 0.5450981, 1,
1.23764, -1.070706, 3.444192, 1, 0, 0.5411765, 1,
1.257468, 1.546417, 0.1218238, 1, 0, 0.5333334, 1,
1.264109, 0.1594771, 1.62426, 1, 0, 0.5294118, 1,
1.268065, -0.8210058, 0.9110049, 1, 0, 0.5215687, 1,
1.275041, 1.173358, 0.1135456, 1, 0, 0.5176471, 1,
1.279335, 0.3226919, 1.176031, 1, 0, 0.509804, 1,
1.279588, 0.2547407, 1.486715, 1, 0, 0.5058824, 1,
1.28471, -0.07176118, 2.649817, 1, 0, 0.4980392, 1,
1.289052, -1.560885, 1.071427, 1, 0, 0.4901961, 1,
1.297364, -0.8327999, 3.229776, 1, 0, 0.4862745, 1,
1.300082, 2.617781, -2.34237, 1, 0, 0.4784314, 1,
1.304448, -0.1101134, 0.681786, 1, 0, 0.4745098, 1,
1.312658, -0.5538195, 2.441335, 1, 0, 0.4666667, 1,
1.322755, -0.1813396, 0.2094015, 1, 0, 0.4627451, 1,
1.326766, -0.8885958, 1.361966, 1, 0, 0.454902, 1,
1.334502, -2.441094, 4.664972, 1, 0, 0.4509804, 1,
1.340143, 1.592174, 0.1820923, 1, 0, 0.4431373, 1,
1.344139, -0.3213586, 1.130519, 1, 0, 0.4392157, 1,
1.352027, -0.1165825, 1.204234, 1, 0, 0.4313726, 1,
1.353375, -0.5315873, 2.247603, 1, 0, 0.427451, 1,
1.360001, 1.352949, 0.02334882, 1, 0, 0.4196078, 1,
1.369822, -1.021792, 2.404327, 1, 0, 0.4156863, 1,
1.391701, 0.5224125, 2.636676, 1, 0, 0.4078431, 1,
1.399035, -0.8850607, 2.109401, 1, 0, 0.4039216, 1,
1.410845, -1.322527, 3.535271, 1, 0, 0.3960784, 1,
1.421756, -1.485721, 2.408534, 1, 0, 0.3882353, 1,
1.435206, 0.3724823, 1.73821, 1, 0, 0.3843137, 1,
1.444705, 0.9347318, 0.3416339, 1, 0, 0.3764706, 1,
1.449612, -0.9309244, 3.028707, 1, 0, 0.372549, 1,
1.456687, -0.4280628, 2.520109, 1, 0, 0.3647059, 1,
1.461675, 1.629352, -0.3657369, 1, 0, 0.3607843, 1,
1.475227, -0.6756976, 4.154888, 1, 0, 0.3529412, 1,
1.47826, -0.1727614, 3.163356, 1, 0, 0.3490196, 1,
1.481434, 1.710483, -1.421248, 1, 0, 0.3411765, 1,
1.494651, -0.4903369, 2.850218, 1, 0, 0.3372549, 1,
1.499108, -0.1698925, 2.509153, 1, 0, 0.3294118, 1,
1.503793, 1.294667, 0.5319981, 1, 0, 0.3254902, 1,
1.510028, -0.1229226, 1.499482, 1, 0, 0.3176471, 1,
1.531996, 1.325594, 0.7911847, 1, 0, 0.3137255, 1,
1.538759, 0.9609332, 0.6408656, 1, 0, 0.3058824, 1,
1.539156, 0.3302978, -0.3144298, 1, 0, 0.2980392, 1,
1.543968, -0.256155, 1.080622, 1, 0, 0.2941177, 1,
1.54658, 0.6844999, -0.02206923, 1, 0, 0.2862745, 1,
1.558506, 1.854647, 2.233606, 1, 0, 0.282353, 1,
1.581319, 1.052299, 2.012848, 1, 0, 0.2745098, 1,
1.587044, -2.593477, 3.441509, 1, 0, 0.2705882, 1,
1.588946, 0.6896486, 2.012451, 1, 0, 0.2627451, 1,
1.604929, -0.8745737, 0.3674914, 1, 0, 0.2588235, 1,
1.622416, -2.289792, 2.30185, 1, 0, 0.2509804, 1,
1.632884, -0.2140805, 1.082901, 1, 0, 0.2470588, 1,
1.638146, -0.2989411, 4.016963, 1, 0, 0.2392157, 1,
1.638997, -1.212645, 1.625125, 1, 0, 0.2352941, 1,
1.639335, -1.606921, 2.347223, 1, 0, 0.227451, 1,
1.652243, 0.2370141, 0.5980919, 1, 0, 0.2235294, 1,
1.657183, 0.8097288, 1.175162, 1, 0, 0.2156863, 1,
1.666183, 0.4359385, 1.089909, 1, 0, 0.2117647, 1,
1.66846, -0.1409849, 3.782676, 1, 0, 0.2039216, 1,
1.68749, -0.7141354, 1.71437, 1, 0, 0.1960784, 1,
1.688297, -0.5430699, 2.201285, 1, 0, 0.1921569, 1,
1.695233, -0.4234755, 0.922823, 1, 0, 0.1843137, 1,
1.706537, 0.5417461, 2.169759, 1, 0, 0.1803922, 1,
1.70685, 1.351593, 2.960632, 1, 0, 0.172549, 1,
1.709243, -0.8816607, 0.8678145, 1, 0, 0.1686275, 1,
1.731968, -0.8550392, 1.729096, 1, 0, 0.1607843, 1,
1.733085, 1.357932, -0.05986666, 1, 0, 0.1568628, 1,
1.747076, 0.5859695, 2.690079, 1, 0, 0.1490196, 1,
1.754411, -0.2422577, 1.642891, 1, 0, 0.145098, 1,
1.759541, 0.7211228, 0.8104305, 1, 0, 0.1372549, 1,
1.775717, 0.2465143, -0.9964534, 1, 0, 0.1333333, 1,
1.821834, -2.020615, 1.215556, 1, 0, 0.1254902, 1,
1.827286, 1.074232, 2.107757, 1, 0, 0.1215686, 1,
1.830261, -1.862953, 2.148258, 1, 0, 0.1137255, 1,
1.832453, -0.7906142, 1.481719, 1, 0, 0.1098039, 1,
1.838299, -0.811926, 1.51829, 1, 0, 0.1019608, 1,
1.86425, -0.2335295, 2.24404, 1, 0, 0.09411765, 1,
1.875508, 0.4378869, 1.712329, 1, 0, 0.09019608, 1,
1.879215, -0.524332, 2.645855, 1, 0, 0.08235294, 1,
1.909114, -0.3966638, 0.812287, 1, 0, 0.07843138, 1,
1.955121, -0.04907422, 2.581283, 1, 0, 0.07058824, 1,
1.979483, 0.2890271, 2.105007, 1, 0, 0.06666667, 1,
2.037184, 0.1657486, 0.06801935, 1, 0, 0.05882353, 1,
2.113092, -0.5741876, 1.434142, 1, 0, 0.05490196, 1,
2.124296, 0.7928597, 0.7031466, 1, 0, 0.04705882, 1,
2.133459, -0.9196678, 1.137093, 1, 0, 0.04313726, 1,
2.208534, 0.5212585, 1.82904, 1, 0, 0.03529412, 1,
2.330394, 1.090706, 1.423366, 1, 0, 0.03137255, 1,
2.583636, -0.8617358, 3.432158, 1, 0, 0.02352941, 1,
2.599361, 0.4919181, 2.541622, 1, 0, 0.01960784, 1,
3.356827, -0.791392, 1.918666, 1, 0, 0.01176471, 1,
4.113729, -0.9849781, 3.755232, 1, 0, 0.007843138, 1
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
0.278343, -4.003456, -7.089632, 0, -0.5, 0.5, 0.5,
0.278343, -4.003456, -7.089632, 1, -0.5, 0.5, 0.5,
0.278343, -4.003456, -7.089632, 1, 1.5, 0.5, 0.5,
0.278343, -4.003456, -7.089632, 0, 1.5, 0.5, 0.5
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
-4.85724, -0.01474476, -7.089632, 0, -0.5, 0.5, 0.5,
-4.85724, -0.01474476, -7.089632, 1, -0.5, 0.5, 0.5,
-4.85724, -0.01474476, -7.089632, 1, 1.5, 0.5, 0.5,
-4.85724, -0.01474476, -7.089632, 0, 1.5, 0.5, 0.5
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
-4.85724, -4.003456, 0.1828735, 0, -0.5, 0.5, 0.5,
-4.85724, -4.003456, 0.1828735, 1, -0.5, 0.5, 0.5,
-4.85724, -4.003456, 0.1828735, 1, 1.5, 0.5, 0.5,
-4.85724, -4.003456, 0.1828735, 0, 1.5, 0.5, 0.5
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
-2, -3.082984, -5.411362,
4, -3.082984, -5.411362,
-2, -3.082984, -5.411362,
-2, -3.236396, -5.691073,
0, -3.082984, -5.411362,
0, -3.236396, -5.691073,
2, -3.082984, -5.411362,
2, -3.236396, -5.691073,
4, -3.082984, -5.411362,
4, -3.236396, -5.691073
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
"2",
"4"
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
-2, -3.54322, -6.250497, 0, -0.5, 0.5, 0.5,
-2, -3.54322, -6.250497, 1, -0.5, 0.5, 0.5,
-2, -3.54322, -6.250497, 1, 1.5, 0.5, 0.5,
-2, -3.54322, -6.250497, 0, 1.5, 0.5, 0.5,
0, -3.54322, -6.250497, 0, -0.5, 0.5, 0.5,
0, -3.54322, -6.250497, 1, -0.5, 0.5, 0.5,
0, -3.54322, -6.250497, 1, 1.5, 0.5, 0.5,
0, -3.54322, -6.250497, 0, 1.5, 0.5, 0.5,
2, -3.54322, -6.250497, 0, -0.5, 0.5, 0.5,
2, -3.54322, -6.250497, 1, -0.5, 0.5, 0.5,
2, -3.54322, -6.250497, 1, 1.5, 0.5, 0.5,
2, -3.54322, -6.250497, 0, 1.5, 0.5, 0.5,
4, -3.54322, -6.250497, 0, -0.5, 0.5, 0.5,
4, -3.54322, -6.250497, 1, -0.5, 0.5, 0.5,
4, -3.54322, -6.250497, 1, 1.5, 0.5, 0.5,
4, -3.54322, -6.250497, 0, 1.5, 0.5, 0.5
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
-3.672105, -2, -5.411362,
-3.672105, 2, -5.411362,
-3.672105, -2, -5.411362,
-3.869627, -2, -5.691073,
-3.672105, -1, -5.411362,
-3.869627, -1, -5.691073,
-3.672105, 0, -5.411362,
-3.869627, 0, -5.691073,
-3.672105, 1, -5.411362,
-3.869627, 1, -5.691073,
-3.672105, 2, -5.411362,
-3.869627, 2, -5.691073
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
-4.264672, -2, -6.250497, 0, -0.5, 0.5, 0.5,
-4.264672, -2, -6.250497, 1, -0.5, 0.5, 0.5,
-4.264672, -2, -6.250497, 1, 1.5, 0.5, 0.5,
-4.264672, -2, -6.250497, 0, 1.5, 0.5, 0.5,
-4.264672, -1, -6.250497, 0, -0.5, 0.5, 0.5,
-4.264672, -1, -6.250497, 1, -0.5, 0.5, 0.5,
-4.264672, -1, -6.250497, 1, 1.5, 0.5, 0.5,
-4.264672, -1, -6.250497, 0, 1.5, 0.5, 0.5,
-4.264672, 0, -6.250497, 0, -0.5, 0.5, 0.5,
-4.264672, 0, -6.250497, 1, -0.5, 0.5, 0.5,
-4.264672, 0, -6.250497, 1, 1.5, 0.5, 0.5,
-4.264672, 0, -6.250497, 0, 1.5, 0.5, 0.5,
-4.264672, 1, -6.250497, 0, -0.5, 0.5, 0.5,
-4.264672, 1, -6.250497, 1, -0.5, 0.5, 0.5,
-4.264672, 1, -6.250497, 1, 1.5, 0.5, 0.5,
-4.264672, 1, -6.250497, 0, 1.5, 0.5, 0.5,
-4.264672, 2, -6.250497, 0, -0.5, 0.5, 0.5,
-4.264672, 2, -6.250497, 1, -0.5, 0.5, 0.5,
-4.264672, 2, -6.250497, 1, 1.5, 0.5, 0.5,
-4.264672, 2, -6.250497, 0, 1.5, 0.5, 0.5
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
-3.672105, -3.082984, -4,
-3.672105, -3.082984, 4,
-3.672105, -3.082984, -4,
-3.869627, -3.236396, -4,
-3.672105, -3.082984, -2,
-3.869627, -3.236396, -2,
-3.672105, -3.082984, 0,
-3.869627, -3.236396, 0,
-3.672105, -3.082984, 2,
-3.869627, -3.236396, 2,
-3.672105, -3.082984, 4,
-3.869627, -3.236396, 4
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
-4.264672, -3.54322, -4, 0, -0.5, 0.5, 0.5,
-4.264672, -3.54322, -4, 1, -0.5, 0.5, 0.5,
-4.264672, -3.54322, -4, 1, 1.5, 0.5, 0.5,
-4.264672, -3.54322, -4, 0, 1.5, 0.5, 0.5,
-4.264672, -3.54322, -2, 0, -0.5, 0.5, 0.5,
-4.264672, -3.54322, -2, 1, -0.5, 0.5, 0.5,
-4.264672, -3.54322, -2, 1, 1.5, 0.5, 0.5,
-4.264672, -3.54322, -2, 0, 1.5, 0.5, 0.5,
-4.264672, -3.54322, 0, 0, -0.5, 0.5, 0.5,
-4.264672, -3.54322, 0, 1, -0.5, 0.5, 0.5,
-4.264672, -3.54322, 0, 1, 1.5, 0.5, 0.5,
-4.264672, -3.54322, 0, 0, 1.5, 0.5, 0.5,
-4.264672, -3.54322, 2, 0, -0.5, 0.5, 0.5,
-4.264672, -3.54322, 2, 1, -0.5, 0.5, 0.5,
-4.264672, -3.54322, 2, 1, 1.5, 0.5, 0.5,
-4.264672, -3.54322, 2, 0, 1.5, 0.5, 0.5,
-4.264672, -3.54322, 4, 0, -0.5, 0.5, 0.5,
-4.264672, -3.54322, 4, 1, -0.5, 0.5, 0.5,
-4.264672, -3.54322, 4, 1, 1.5, 0.5, 0.5,
-4.264672, -3.54322, 4, 0, 1.5, 0.5, 0.5
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
-3.672105, -3.082984, -5.411362,
-3.672105, 3.053494, -5.411362,
-3.672105, -3.082984, 5.777109,
-3.672105, 3.053494, 5.777109,
-3.672105, -3.082984, -5.411362,
-3.672105, -3.082984, 5.777109,
-3.672105, 3.053494, -5.411362,
-3.672105, 3.053494, 5.777109,
-3.672105, -3.082984, -5.411362,
4.228791, -3.082984, -5.411362,
-3.672105, -3.082984, 5.777109,
4.228791, -3.082984, 5.777109,
-3.672105, 3.053494, -5.411362,
4.228791, 3.053494, -5.411362,
-3.672105, 3.053494, 5.777109,
4.228791, 3.053494, 5.777109,
4.228791, -3.082984, -5.411362,
4.228791, 3.053494, -5.411362,
4.228791, -3.082984, 5.777109,
4.228791, 3.053494, 5.777109,
4.228791, -3.082984, -5.411362,
4.228791, -3.082984, 5.777109,
4.228791, 3.053494, -5.411362,
4.228791, 3.053494, 5.777109
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
var radius = 8.014378;
var distance = 35.65687;
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
mvMatrix.translate( -0.278343, 0.01474476, -0.1828735 );
mvMatrix.scale( 1.096749, 1.412097, 0.774485 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.65687);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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

