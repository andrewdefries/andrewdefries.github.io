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
-2.955757, -0.4353453, -1.552912, 1, 0, 0, 1,
-2.831168, -0.3465149, -1.971592, 1, 0.007843138, 0, 1,
-2.781649, -1.106561, -2.948928, 1, 0.01176471, 0, 1,
-2.724627, 0.3413435, -1.030818, 1, 0.01960784, 0, 1,
-2.642975, -2.397363, -2.389933, 1, 0.02352941, 0, 1,
-2.574077, 0.4045115, -1.754717, 1, 0.03137255, 0, 1,
-2.400169, -0.0353613, -0.6091147, 1, 0.03529412, 0, 1,
-2.346561, 0.07502189, -1.393049, 1, 0.04313726, 0, 1,
-2.326365, 0.4611617, -1.171561, 1, 0.04705882, 0, 1,
-2.320945, 1.372912, -0.5029541, 1, 0.05490196, 0, 1,
-2.318937, -0.3641927, -2.43643, 1, 0.05882353, 0, 1,
-2.272132, -2.7734, -1.913318, 1, 0.06666667, 0, 1,
-2.271549, -0.853351, -1.155394, 1, 0.07058824, 0, 1,
-2.249529, 0.4187494, -2.067453, 1, 0.07843138, 0, 1,
-2.185035, -0.1862987, -1.46732, 1, 0.08235294, 0, 1,
-2.179778, 0.01483283, -2.250588, 1, 0.09019608, 0, 1,
-2.162916, -0.0274859, -3.419254, 1, 0.09411765, 0, 1,
-2.153171, 0.9326333, -0.6553276, 1, 0.1019608, 0, 1,
-2.113798, 1.070227, -0.08061138, 1, 0.1098039, 0, 1,
-2.1032, 0.3137368, -0.6385784, 1, 0.1137255, 0, 1,
-2.081415, 0.6097489, -2.058522, 1, 0.1215686, 0, 1,
-2.038542, 0.1537098, -1.539408, 1, 0.1254902, 0, 1,
-2.030518, 0.7020398, -1.661775, 1, 0.1333333, 0, 1,
-2.003469, 0.218005, -0.9465684, 1, 0.1372549, 0, 1,
-1.98745, 0.2651013, -1.766576, 1, 0.145098, 0, 1,
-1.985478, -0.4365588, -3.6115, 1, 0.1490196, 0, 1,
-1.974355, 0.7821714, -1.548011, 1, 0.1568628, 0, 1,
-1.904812, -2.824649, -2.904941, 1, 0.1607843, 0, 1,
-1.898794, -1.077772, -2.184532, 1, 0.1686275, 0, 1,
-1.868459, -1.870959, -2.868342, 1, 0.172549, 0, 1,
-1.863601, -0.6701995, -1.980317, 1, 0.1803922, 0, 1,
-1.823301, -0.3371311, -0.5101092, 1, 0.1843137, 0, 1,
-1.79583, -0.3532648, -2.427849, 1, 0.1921569, 0, 1,
-1.783641, 0.1789461, -1.165723, 1, 0.1960784, 0, 1,
-1.777822, 0.1384116, -2.700124, 1, 0.2039216, 0, 1,
-1.774924, 0.02949107, -3.605076, 1, 0.2117647, 0, 1,
-1.77307, -0.5024039, -3.183627, 1, 0.2156863, 0, 1,
-1.758531, 0.6257882, -1.200484, 1, 0.2235294, 0, 1,
-1.74666, -0.3367486, -2.584151, 1, 0.227451, 0, 1,
-1.743613, -0.1887975, -2.389193, 1, 0.2352941, 0, 1,
-1.738711, -0.8580418, -1.673156, 1, 0.2392157, 0, 1,
-1.736375, -0.6729295, -2.6098, 1, 0.2470588, 0, 1,
-1.734603, 0.9711516, -1.879638, 1, 0.2509804, 0, 1,
-1.731924, 0.1369498, -1.277687, 1, 0.2588235, 0, 1,
-1.7058, 1.523129, -0.363811, 1, 0.2627451, 0, 1,
-1.704222, 1.566781, 0.9669753, 1, 0.2705882, 0, 1,
-1.701532, -1.326365, -1.321932, 1, 0.2745098, 0, 1,
-1.700696, 2.386517, -0.1689884, 1, 0.282353, 0, 1,
-1.686375, 1.700354, -2.708717, 1, 0.2862745, 0, 1,
-1.671031, 2.00018, -1.241948, 1, 0.2941177, 0, 1,
-1.665855, -0.2423512, -2.563274, 1, 0.3019608, 0, 1,
-1.661794, -1.286553, -2.283974, 1, 0.3058824, 0, 1,
-1.649711, -0.7410945, 0.9042827, 1, 0.3137255, 0, 1,
-1.649592, -0.3866976, -2.493492, 1, 0.3176471, 0, 1,
-1.617845, -0.6122168, -1.347653, 1, 0.3254902, 0, 1,
-1.615835, 0.3267379, -0.8965747, 1, 0.3294118, 0, 1,
-1.591712, -1.109076, -2.048633, 1, 0.3372549, 0, 1,
-1.58744, -0.1216499, -2.710359, 1, 0.3411765, 0, 1,
-1.582902, 1.181936, 0.5529976, 1, 0.3490196, 0, 1,
-1.575024, 1.957596, -0.5986705, 1, 0.3529412, 0, 1,
-1.574716, -0.04761881, -1.873363, 1, 0.3607843, 0, 1,
-1.559921, 0.3965302, -3.010208, 1, 0.3647059, 0, 1,
-1.557664, 0.9943853, -1.420804, 1, 0.372549, 0, 1,
-1.539526, -0.04762434, 0.008248231, 1, 0.3764706, 0, 1,
-1.51165, -2.042633, -4.060017, 1, 0.3843137, 0, 1,
-1.509921, -1.692001, -1.939988, 1, 0.3882353, 0, 1,
-1.505945, -1.204682, -3.316987, 1, 0.3960784, 0, 1,
-1.498269, 1.319509, 0.1426653, 1, 0.4039216, 0, 1,
-1.477832, -1.181016, -2.02682, 1, 0.4078431, 0, 1,
-1.469951, -0.2243192, -2.14198, 1, 0.4156863, 0, 1,
-1.463481, -0.7449952, -2.369743, 1, 0.4196078, 0, 1,
-1.447376, -0.1305275, 0.8391517, 1, 0.427451, 0, 1,
-1.445466, -2.009162, -2.94585, 1, 0.4313726, 0, 1,
-1.426489, -1.90519, -1.869621, 1, 0.4392157, 0, 1,
-1.423861, -0.4135739, -0.613877, 1, 0.4431373, 0, 1,
-1.412697, 1.074641, -1.509367, 1, 0.4509804, 0, 1,
-1.405802, -1.031649, -2.432162, 1, 0.454902, 0, 1,
-1.402107, 0.2230883, 0.6066389, 1, 0.4627451, 0, 1,
-1.398095, 1.605273, -0.5461829, 1, 0.4666667, 0, 1,
-1.378075, -0.1728733, -2.780868, 1, 0.4745098, 0, 1,
-1.37373, 0.01122648, -1.877492, 1, 0.4784314, 0, 1,
-1.369259, -0.04873881, -1.099062, 1, 0.4862745, 0, 1,
-1.368489, 0.1166544, -0.372387, 1, 0.4901961, 0, 1,
-1.366502, -0.0986829, -1.803251, 1, 0.4980392, 0, 1,
-1.356902, -1.483054, -1.500391, 1, 0.5058824, 0, 1,
-1.355976, -0.04972095, -2.45098, 1, 0.509804, 0, 1,
-1.350176, 0.6703431, -2.471502, 1, 0.5176471, 0, 1,
-1.347838, 1.430569, -0.6996605, 1, 0.5215687, 0, 1,
-1.326713, -0.9085107, -2.731259, 1, 0.5294118, 0, 1,
-1.322996, 0.1023149, -4.146827, 1, 0.5333334, 0, 1,
-1.316091, 1.607641, 0.2424467, 1, 0.5411765, 0, 1,
-1.300514, 0.1343261, -1.703095, 1, 0.5450981, 0, 1,
-1.298464, -0.4572978, -3.351009, 1, 0.5529412, 0, 1,
-1.297677, 1.159943, 1.324931, 1, 0.5568628, 0, 1,
-1.291794, -0.4645116, -3.213175, 1, 0.5647059, 0, 1,
-1.290066, 0.07865324, -0.9756198, 1, 0.5686275, 0, 1,
-1.289998, -0.3360519, -1.287385, 1, 0.5764706, 0, 1,
-1.282961, -0.08494545, -1.045978, 1, 0.5803922, 0, 1,
-1.281583, -1.011576, -1.530525, 1, 0.5882353, 0, 1,
-1.26336, -0.09673581, -0.7971185, 1, 0.5921569, 0, 1,
-1.257563, 0.4906668, -0.5238293, 1, 0.6, 0, 1,
-1.254021, 0.6662342, -2.912392, 1, 0.6078432, 0, 1,
-1.252962, -0.20053, -2.047241, 1, 0.6117647, 0, 1,
-1.252628, -1.111142, -3.077009, 1, 0.6196079, 0, 1,
-1.252594, -0.2290544, -2.323762, 1, 0.6235294, 0, 1,
-1.249459, 0.1044544, 0.233293, 1, 0.6313726, 0, 1,
-1.243286, -0.3896864, -1.60453, 1, 0.6352941, 0, 1,
-1.241592, -0.1397548, -0.3907642, 1, 0.6431373, 0, 1,
-1.236748, -1.046612, -1.502187, 1, 0.6470588, 0, 1,
-1.229996, -1.269803, -1.125168, 1, 0.654902, 0, 1,
-1.226454, 0.756615, -1.536828, 1, 0.6588235, 0, 1,
-1.225487, -0.8935043, -1.368851, 1, 0.6666667, 0, 1,
-1.220743, 1.178878, -1.185408, 1, 0.6705883, 0, 1,
-1.215252, -0.5027703, -2.270988, 1, 0.6784314, 0, 1,
-1.207063, -0.6107838, -1.0576, 1, 0.682353, 0, 1,
-1.206603, 1.319811, -0.3722291, 1, 0.6901961, 0, 1,
-1.205815, -0.8411129, -2.73683, 1, 0.6941177, 0, 1,
-1.20572, 0.1183271, -3.241386, 1, 0.7019608, 0, 1,
-1.202796, 1.215293, -1.697886, 1, 0.7098039, 0, 1,
-1.195137, 0.227677, -1.405537, 1, 0.7137255, 0, 1,
-1.190513, 1.815605, 0.1050603, 1, 0.7215686, 0, 1,
-1.183954, 1.74581, -1.498843, 1, 0.7254902, 0, 1,
-1.18141, 0.07568187, -2.514005, 1, 0.7333333, 0, 1,
-1.174674, 0.2297706, -0.02151271, 1, 0.7372549, 0, 1,
-1.170718, 0.7828558, -1.505154, 1, 0.7450981, 0, 1,
-1.169757, 0.4252938, -1.819553, 1, 0.7490196, 0, 1,
-1.166701, -2.300542, -4.189994, 1, 0.7568628, 0, 1,
-1.166046, 0.1240731, -3.581324, 1, 0.7607843, 0, 1,
-1.165825, 0.6780311, 0.6301358, 1, 0.7686275, 0, 1,
-1.162373, 0.314703, -1.08063, 1, 0.772549, 0, 1,
-1.152533, 0.4882405, 0.09102191, 1, 0.7803922, 0, 1,
-1.14365, -0.006415202, -0.500396, 1, 0.7843137, 0, 1,
-1.137895, 0.3013091, -0.3733343, 1, 0.7921569, 0, 1,
-1.137849, 0.993674, -1.502313, 1, 0.7960784, 0, 1,
-1.137648, -0.9046518, -1.30349, 1, 0.8039216, 0, 1,
-1.136591, -0.2411675, -2.293087, 1, 0.8117647, 0, 1,
-1.134299, -0.4677342, -1.466483, 1, 0.8156863, 0, 1,
-1.130748, -0.5178714, -2.637405, 1, 0.8235294, 0, 1,
-1.12645, 2.080346, -0.2610919, 1, 0.827451, 0, 1,
-1.120189, 0.8424846, -2.3445, 1, 0.8352941, 0, 1,
-1.119099, 0.08269531, -2.4361, 1, 0.8392157, 0, 1,
-1.115354, 0.1226555, -0.1646791, 1, 0.8470588, 0, 1,
-1.111858, -0.05220132, -0.1022604, 1, 0.8509804, 0, 1,
-1.111615, 0.02898834, -0.02266883, 1, 0.8588235, 0, 1,
-1.110877, 0.2589283, -0.7302606, 1, 0.8627451, 0, 1,
-1.100049, -0.4976983, -1.285803, 1, 0.8705882, 0, 1,
-1.097564, 0.5475028, -0.7669399, 1, 0.8745098, 0, 1,
-1.093533, -0.5306657, -3.015728, 1, 0.8823529, 0, 1,
-1.069611, -0.3406484, -2.406852, 1, 0.8862745, 0, 1,
-1.064914, 0.5285877, -0.4976959, 1, 0.8941177, 0, 1,
-1.058919, -0.04512482, -2.728611, 1, 0.8980392, 0, 1,
-1.048227, 0.2151342, -0.3162265, 1, 0.9058824, 0, 1,
-1.041146, 0.3292125, -1.358785, 1, 0.9137255, 0, 1,
-1.041062, 0.02635175, -2.249442, 1, 0.9176471, 0, 1,
-1.033612, -0.5053355, -2.483349, 1, 0.9254902, 0, 1,
-1.031277, -0.7214437, -4.515715, 1, 0.9294118, 0, 1,
-1.02878, -0.6128074, -2.868806, 1, 0.9372549, 0, 1,
-1.027695, 0.1766217, -0.8590899, 1, 0.9411765, 0, 1,
-1.022975, 1.469486, -1.15362, 1, 0.9490196, 0, 1,
-1.006307, 0.5319859, -0.7662609, 1, 0.9529412, 0, 1,
-1.002506, -0.2826573, -3.254109, 1, 0.9607843, 0, 1,
-1.002441, 1.51089, -1.254155, 1, 0.9647059, 0, 1,
-1.000637, 2.018946, 1.789475, 1, 0.972549, 0, 1,
-0.9994632, -0.577606, -1.437911, 1, 0.9764706, 0, 1,
-0.9988716, 0.7660641, -1.546098, 1, 0.9843137, 0, 1,
-0.9966089, -0.9221952, -2.366109, 1, 0.9882353, 0, 1,
-0.9887314, 0.1146462, -1.517513, 1, 0.9960784, 0, 1,
-0.9839776, 0.7340596, -1.571169, 0.9960784, 1, 0, 1,
-0.9834709, -1.036258, -1.592047, 0.9921569, 1, 0, 1,
-0.9820002, -0.4390062, -4.604943, 0.9843137, 1, 0, 1,
-0.9801672, -0.596693, -2.285348, 0.9803922, 1, 0, 1,
-0.9720211, -0.4815735, -1.931818, 0.972549, 1, 0, 1,
-0.9690507, -0.1105236, -1.02234, 0.9686275, 1, 0, 1,
-0.9686584, 0.4577919, -1.231419, 0.9607843, 1, 0, 1,
-0.9590374, -0.9030566, -1.992863, 0.9568627, 1, 0, 1,
-0.9579108, 0.306347, -0.5753918, 0.9490196, 1, 0, 1,
-0.9537982, 0.5869663, -1.623609, 0.945098, 1, 0, 1,
-0.9528944, -0.6465725, -3.346713, 0.9372549, 1, 0, 1,
-0.9521363, 0.9936239, -0.2886699, 0.9333333, 1, 0, 1,
-0.9383942, 1.091403, -2.127071, 0.9254902, 1, 0, 1,
-0.9314108, -1.066996, -2.96192, 0.9215686, 1, 0, 1,
-0.9298749, -0.5451136, -2.777823, 0.9137255, 1, 0, 1,
-0.9224715, 0.6576284, -0.7794942, 0.9098039, 1, 0, 1,
-0.9221905, -0.990064, -3.147827, 0.9019608, 1, 0, 1,
-0.9191946, 0.4632689, -1.337822, 0.8941177, 1, 0, 1,
-0.917915, -0.04270364, -1.270926, 0.8901961, 1, 0, 1,
-0.9124396, 0.7426735, -0.2426495, 0.8823529, 1, 0, 1,
-0.9118289, 0.3376181, 0.3110422, 0.8784314, 1, 0, 1,
-0.9032773, -1.528125, -3.173272, 0.8705882, 1, 0, 1,
-0.8988652, -1.188852, -3.794699, 0.8666667, 1, 0, 1,
-0.8988401, -0.3365932, -0.552118, 0.8588235, 1, 0, 1,
-0.8908653, 0.3210644, 0.7179266, 0.854902, 1, 0, 1,
-0.8876166, -0.4555406, -1.360228, 0.8470588, 1, 0, 1,
-0.8804066, -0.28507, -2.413305, 0.8431373, 1, 0, 1,
-0.8725032, -0.3704301, -0.5576031, 0.8352941, 1, 0, 1,
-0.868112, 1.255397, -0.147765, 0.8313726, 1, 0, 1,
-0.8668333, 0.01284639, -1.23072, 0.8235294, 1, 0, 1,
-0.865644, -0.6040844, -3.719463, 0.8196079, 1, 0, 1,
-0.8597526, 1.151115, -1.029815, 0.8117647, 1, 0, 1,
-0.8526242, -0.3810435, -2.455504, 0.8078431, 1, 0, 1,
-0.8487006, -0.8582059, -1.579678, 0.8, 1, 0, 1,
-0.8378189, 0.7184038, 0.5588739, 0.7921569, 1, 0, 1,
-0.8333755, 0.1982878, -1.2058, 0.7882353, 1, 0, 1,
-0.8329318, 1.89721, -0.02139075, 0.7803922, 1, 0, 1,
-0.832592, 0.9331331, 0.4309359, 0.7764706, 1, 0, 1,
-0.8293666, -0.4331046, -2.654523, 0.7686275, 1, 0, 1,
-0.8284554, 1.353451, -0.6800309, 0.7647059, 1, 0, 1,
-0.8256621, 0.05002048, -2.725893, 0.7568628, 1, 0, 1,
-0.8256459, -0.6769493, -3.550006, 0.7529412, 1, 0, 1,
-0.8208616, 1.239737, -1.816216, 0.7450981, 1, 0, 1,
-0.8190468, 0.8762634, 0.2607519, 0.7411765, 1, 0, 1,
-0.8180689, -0.2732306, -0.09047095, 0.7333333, 1, 0, 1,
-0.8175903, 0.4832783, -3.833568, 0.7294118, 1, 0, 1,
-0.8067712, -2.188338, -3.68099, 0.7215686, 1, 0, 1,
-0.8053938, 0.6440501, -1.466419, 0.7176471, 1, 0, 1,
-0.8028965, 0.9945294, -0.3994169, 0.7098039, 1, 0, 1,
-0.7987989, 0.5987105, -0.6386895, 0.7058824, 1, 0, 1,
-0.7884985, 0.2720426, -1.534254, 0.6980392, 1, 0, 1,
-0.7807971, -0.8939254, -2.589324, 0.6901961, 1, 0, 1,
-0.7776166, -0.5539662, -1.694332, 0.6862745, 1, 0, 1,
-0.772503, 1.989896, -0.6094158, 0.6784314, 1, 0, 1,
-0.7692264, -2.177054, -2.210123, 0.6745098, 1, 0, 1,
-0.7645009, -0.7159165, -3.343405, 0.6666667, 1, 0, 1,
-0.7618091, 0.2840282, -2.091717, 0.6627451, 1, 0, 1,
-0.7607348, 0.3991565, -1.358557, 0.654902, 1, 0, 1,
-0.7584959, -0.8758233, -2.216888, 0.6509804, 1, 0, 1,
-0.7584665, -0.2190545, 0.01952194, 0.6431373, 1, 0, 1,
-0.7578894, -0.3857982, -2.80461, 0.6392157, 1, 0, 1,
-0.7537421, -0.1747068, -1.845688, 0.6313726, 1, 0, 1,
-0.7516698, 0.3402987, -1.183536, 0.627451, 1, 0, 1,
-0.7514422, 0.7893764, -1.969182, 0.6196079, 1, 0, 1,
-0.7467, 1.391177, -0.3219173, 0.6156863, 1, 0, 1,
-0.7430815, -0.902616, -2.376232, 0.6078432, 1, 0, 1,
-0.7403144, 0.3517237, -0.7910671, 0.6039216, 1, 0, 1,
-0.7397037, -0.8184673, -3.992676, 0.5960785, 1, 0, 1,
-0.735157, -0.5988187, -2.514609, 0.5882353, 1, 0, 1,
-0.7320859, -0.8347014, -2.292753, 0.5843138, 1, 0, 1,
-0.7316329, 0.0898719, -1.913732, 0.5764706, 1, 0, 1,
-0.7315792, -0.286893, -1.94283, 0.572549, 1, 0, 1,
-0.7265821, -1.102554, -3.059343, 0.5647059, 1, 0, 1,
-0.7255607, 0.2538593, -0.8042581, 0.5607843, 1, 0, 1,
-0.7245658, 0.6458486, -0.2853207, 0.5529412, 1, 0, 1,
-0.7227066, 1.489743, 0.8662725, 0.5490196, 1, 0, 1,
-0.722272, 0.02412921, -0.9664975, 0.5411765, 1, 0, 1,
-0.7221375, -0.6440477, -3.654813, 0.5372549, 1, 0, 1,
-0.7200682, 0.2768496, -0.7797868, 0.5294118, 1, 0, 1,
-0.7185394, 1.567648, -0.7297767, 0.5254902, 1, 0, 1,
-0.7177684, -0.2079907, -1.827798, 0.5176471, 1, 0, 1,
-0.7091456, 1.375872, -0.5707687, 0.5137255, 1, 0, 1,
-0.7008474, -0.2673625, -0.9762787, 0.5058824, 1, 0, 1,
-0.7003583, -0.4126862, -1.803726, 0.5019608, 1, 0, 1,
-0.6964239, 0.8752048, -2.803764, 0.4941176, 1, 0, 1,
-0.695075, -1.322211, -2.179747, 0.4862745, 1, 0, 1,
-0.6928655, 0.4379675, -0.571982, 0.4823529, 1, 0, 1,
-0.6860504, 1.353428, 0.09751979, 0.4745098, 1, 0, 1,
-0.681385, -0.9989047, -1.46427, 0.4705882, 1, 0, 1,
-0.666401, -0.04422529, -2.309802, 0.4627451, 1, 0, 1,
-0.6610332, -0.9746446, -4.348072, 0.4588235, 1, 0, 1,
-0.6602542, 1.464548, 0.4678155, 0.4509804, 1, 0, 1,
-0.6567653, 0.2834423, -1.032846, 0.4470588, 1, 0, 1,
-0.6536942, -0.1968322, -2.771517, 0.4392157, 1, 0, 1,
-0.6487772, -0.919444, -2.871939, 0.4352941, 1, 0, 1,
-0.6479571, -1.513415, -0.774387, 0.427451, 1, 0, 1,
-0.6478086, -1.172911, -1.700531, 0.4235294, 1, 0, 1,
-0.6476324, -1.090477, -3.111108, 0.4156863, 1, 0, 1,
-0.6473364, -2.33076, -3.354291, 0.4117647, 1, 0, 1,
-0.6437615, -0.5930641, -1.391343, 0.4039216, 1, 0, 1,
-0.6433409, 1.399137, 0.05276322, 0.3960784, 1, 0, 1,
-0.6433103, -0.4789017, -3.591412, 0.3921569, 1, 0, 1,
-0.6410874, 0.8442752, -2.552971, 0.3843137, 1, 0, 1,
-0.6397498, 0.7706925, -2.241113, 0.3803922, 1, 0, 1,
-0.6380641, 0.4334598, -0.482108, 0.372549, 1, 0, 1,
-0.636739, 0.6709108, 0.6616638, 0.3686275, 1, 0, 1,
-0.6342378, 0.8904417, -2.465306, 0.3607843, 1, 0, 1,
-0.6315395, -0.1555943, -0.9582075, 0.3568628, 1, 0, 1,
-0.6231539, -0.3187955, -1.598, 0.3490196, 1, 0, 1,
-0.6229183, -1.16264, -3.3652, 0.345098, 1, 0, 1,
-0.6226987, -0.08645948, -2.794395, 0.3372549, 1, 0, 1,
-0.6196582, 0.2169329, -1.78058, 0.3333333, 1, 0, 1,
-0.6175143, -1.20693, -4.519169, 0.3254902, 1, 0, 1,
-0.6163697, -1.554023, -3.880573, 0.3215686, 1, 0, 1,
-0.6088408, 0.9132321, -0.2576861, 0.3137255, 1, 0, 1,
-0.607024, 0.2011728, -1.308408, 0.3098039, 1, 0, 1,
-0.606502, 0.6639752, -1.394655, 0.3019608, 1, 0, 1,
-0.6054699, -0.6956202, -3.06179, 0.2941177, 1, 0, 1,
-0.6052934, -0.4919898, -2.602752, 0.2901961, 1, 0, 1,
-0.5967442, -2.110373, -1.414592, 0.282353, 1, 0, 1,
-0.5919774, -0.1896416, -3.351343, 0.2784314, 1, 0, 1,
-0.584621, -0.2855233, -1.330329, 0.2705882, 1, 0, 1,
-0.5841383, 1.111831, 0.4746216, 0.2666667, 1, 0, 1,
-0.5767471, 0.009305922, -0.5306741, 0.2588235, 1, 0, 1,
-0.5737334, -0.01966226, -0.5894955, 0.254902, 1, 0, 1,
-0.5709222, 0.1213774, -1.58634, 0.2470588, 1, 0, 1,
-0.5687929, -0.3967314, -2.787856, 0.2431373, 1, 0, 1,
-0.5676969, 0.5731115, -1.334533, 0.2352941, 1, 0, 1,
-0.561493, -1.521889, -2.448374, 0.2313726, 1, 0, 1,
-0.5597881, 1.514554, -0.04524948, 0.2235294, 1, 0, 1,
-0.5568566, -0.01953921, -1.837115, 0.2196078, 1, 0, 1,
-0.556021, 1.386397, -0.8659711, 0.2117647, 1, 0, 1,
-0.5557302, 0.5191802, -1.040722, 0.2078431, 1, 0, 1,
-0.5522104, -0.3440056, -0.8095998, 0.2, 1, 0, 1,
-0.5519183, -0.9167719, -1.491738, 0.1921569, 1, 0, 1,
-0.5512892, -0.9080611, -1.957354, 0.1882353, 1, 0, 1,
-0.5509375, -0.5043252, -3.602662, 0.1803922, 1, 0, 1,
-0.5439736, 1.098441, -1.688239, 0.1764706, 1, 0, 1,
-0.5321464, -1.187576, -3.378428, 0.1686275, 1, 0, 1,
-0.5311359, 0.001867867, -0.5089499, 0.1647059, 1, 0, 1,
-0.5282987, 1.078055, -1.108993, 0.1568628, 1, 0, 1,
-0.5273969, -1.085477, -1.336784, 0.1529412, 1, 0, 1,
-0.5240022, 0.6626344, 0.8820528, 0.145098, 1, 0, 1,
-0.5216766, 1.395991, -2.215905, 0.1411765, 1, 0, 1,
-0.5209519, -1.428204, -4.374316, 0.1333333, 1, 0, 1,
-0.520239, 0.770376, -1.016214, 0.1294118, 1, 0, 1,
-0.5177597, 1.478313, 0.5618499, 0.1215686, 1, 0, 1,
-0.5085033, 0.6378869, -0.3453325, 0.1176471, 1, 0, 1,
-0.507304, -0.594598, -2.657749, 0.1098039, 1, 0, 1,
-0.5037236, 2.089426, -0.1046637, 0.1058824, 1, 0, 1,
-0.4961234, -1.056387, -3.604326, 0.09803922, 1, 0, 1,
-0.4920366, 0.2082709, -1.649172, 0.09019608, 1, 0, 1,
-0.4912331, -0.6994762, -1.948474, 0.08627451, 1, 0, 1,
-0.4886313, 0.3454301, -1.073326, 0.07843138, 1, 0, 1,
-0.4879137, -1.954151, -1.980804, 0.07450981, 1, 0, 1,
-0.4860012, 1.498997, 1.213891, 0.06666667, 1, 0, 1,
-0.480252, -0.1827093, -0.8628398, 0.0627451, 1, 0, 1,
-0.4728752, -1.984846, -1.756103, 0.05490196, 1, 0, 1,
-0.4718588, 0.5256267, -2.096869, 0.05098039, 1, 0, 1,
-0.4717507, 0.931198, -1.63382, 0.04313726, 1, 0, 1,
-0.468441, 0.8866773, -1.233974, 0.03921569, 1, 0, 1,
-0.4666858, -0.692381, -2.879651, 0.03137255, 1, 0, 1,
-0.4651707, 0.9052789, -0.3528069, 0.02745098, 1, 0, 1,
-0.4597792, -1.023267, -2.193492, 0.01960784, 1, 0, 1,
-0.4575913, -1.979315, -4.057026, 0.01568628, 1, 0, 1,
-0.4568643, -0.1578036, -0.6723148, 0.007843138, 1, 0, 1,
-0.4527247, 0.09312481, -1.977105, 0.003921569, 1, 0, 1,
-0.4512951, 1.62183, -2.104677, 0, 1, 0.003921569, 1,
-0.4499457, -1.523435, -1.560123, 0, 1, 0.01176471, 1,
-0.4469056, 0.9507602, -1.65574, 0, 1, 0.01568628, 1,
-0.4467022, 0.3699445, -0.2859993, 0, 1, 0.02352941, 1,
-0.4445756, -0.07435358, -3.001516, 0, 1, 0.02745098, 1,
-0.4389923, 0.07436313, -2.297947, 0, 1, 0.03529412, 1,
-0.4377383, 0.5327545, 0.3914465, 0, 1, 0.03921569, 1,
-0.4355805, -0.04992162, 0.5581974, 0, 1, 0.04705882, 1,
-0.4328822, 0.6337556, 0.1992937, 0, 1, 0.05098039, 1,
-0.432247, 1.347539, -0.2417893, 0, 1, 0.05882353, 1,
-0.4293022, 0.6090472, -0.8880398, 0, 1, 0.0627451, 1,
-0.4272477, 0.5947396, -0.9027001, 0, 1, 0.07058824, 1,
-0.422903, 0.1936071, -0.7815255, 0, 1, 0.07450981, 1,
-0.4219694, -0.4195873, -2.531842, 0, 1, 0.08235294, 1,
-0.4215655, -1.142612, -3.77615, 0, 1, 0.08627451, 1,
-0.4213091, 0.9069426, -0.7539696, 0, 1, 0.09411765, 1,
-0.4208228, -0.5212932, -1.085639, 0, 1, 0.1019608, 1,
-0.4188288, -2.163305, -1.822657, 0, 1, 0.1058824, 1,
-0.4104695, 1.10819, -1.343449, 0, 1, 0.1137255, 1,
-0.4098893, -2.392726, -2.923527, 0, 1, 0.1176471, 1,
-0.4085281, -0.3558603, -3.572339, 0, 1, 0.1254902, 1,
-0.4022759, -1.034124, -2.875124, 0, 1, 0.1294118, 1,
-0.4004444, -1.882198, -2.572549, 0, 1, 0.1372549, 1,
-0.3965641, 0.1166197, -1.000527, 0, 1, 0.1411765, 1,
-0.389407, -1.722266, -3.182106, 0, 1, 0.1490196, 1,
-0.3872712, -0.2709446, -2.717841, 0, 1, 0.1529412, 1,
-0.3834753, -0.8102153, -2.822422, 0, 1, 0.1607843, 1,
-0.3823351, 0.4360564, -1.345585, 0, 1, 0.1647059, 1,
-0.3799635, -0.5319005, -3.761978, 0, 1, 0.172549, 1,
-0.3762432, -0.5330986, -3.681104, 0, 1, 0.1764706, 1,
-0.3730031, 1.046837, -0.1325944, 0, 1, 0.1843137, 1,
-0.3717278, -0.7392459, -3.769202, 0, 1, 0.1882353, 1,
-0.3709004, -0.9589346, -2.143255, 0, 1, 0.1960784, 1,
-0.3559717, -0.6934397, -1.404397, 0, 1, 0.2039216, 1,
-0.3550177, -0.567945, -3.773701, 0, 1, 0.2078431, 1,
-0.342796, -0.7844824, -2.865646, 0, 1, 0.2156863, 1,
-0.3421117, -1.210985, -3.038296, 0, 1, 0.2196078, 1,
-0.3412345, 1.74964, 0.3275563, 0, 1, 0.227451, 1,
-0.3398507, 1.126072, -0.6132568, 0, 1, 0.2313726, 1,
-0.3395989, 1.084481, 0.9492344, 0, 1, 0.2392157, 1,
-0.3379795, 0.8018111, 0.7977738, 0, 1, 0.2431373, 1,
-0.3355604, -0.4430448, 0.3783072, 0, 1, 0.2509804, 1,
-0.3332893, 1.096587, 0.03204947, 0, 1, 0.254902, 1,
-0.331267, -0.8758315, -3.250525, 0, 1, 0.2627451, 1,
-0.3280921, -1.303703, -3.653035, 0, 1, 0.2666667, 1,
-0.3278797, 1.2079, 1.022932, 0, 1, 0.2745098, 1,
-0.3260047, -1.189782, -2.320197, 0, 1, 0.2784314, 1,
-0.3257131, -0.8491074, -2.636146, 0, 1, 0.2862745, 1,
-0.3247688, 0.8645893, -0.5629879, 0, 1, 0.2901961, 1,
-0.3202341, -1.125295, -2.931388, 0, 1, 0.2980392, 1,
-0.3198881, -0.7000225, -3.809291, 0, 1, 0.3058824, 1,
-0.3196096, 0.6219065, -1.816107, 0, 1, 0.3098039, 1,
-0.3117289, 1.065842, -1.443204, 0, 1, 0.3176471, 1,
-0.3075693, 0.478051, 0.4947223, 0, 1, 0.3215686, 1,
-0.2999969, 1.727867, -0.4072192, 0, 1, 0.3294118, 1,
-0.2902744, -0.6462189, -3.535899, 0, 1, 0.3333333, 1,
-0.2893389, 0.9969263, 0.05623744, 0, 1, 0.3411765, 1,
-0.2874208, -0.2897038, -3.020595, 0, 1, 0.345098, 1,
-0.2843062, 0.5546542, 2.108344, 0, 1, 0.3529412, 1,
-0.2771874, -0.07485796, -1.368702, 0, 1, 0.3568628, 1,
-0.2769014, -1.279866, -2.71382, 0, 1, 0.3647059, 1,
-0.2661516, 1.075593, 0.7711076, 0, 1, 0.3686275, 1,
-0.2647495, -0.8735898, -3.36047, 0, 1, 0.3764706, 1,
-0.2620524, -0.6186666, -1.384788, 0, 1, 0.3803922, 1,
-0.2613478, 0.6581426, -0.4862754, 0, 1, 0.3882353, 1,
-0.2570928, 2.383291, -1.170432, 0, 1, 0.3921569, 1,
-0.2568975, 0.9938046, -2.114571, 0, 1, 0.4, 1,
-0.2554016, -0.2816691, -3.586368, 0, 1, 0.4078431, 1,
-0.2529278, 1.439945, -1.08596, 0, 1, 0.4117647, 1,
-0.2527586, 0.2152065, 0.6183134, 0, 1, 0.4196078, 1,
-0.2518091, -1.165944, -2.251322, 0, 1, 0.4235294, 1,
-0.2500316, 1.065337, 0.4033724, 0, 1, 0.4313726, 1,
-0.2478229, -1.1637, -2.494713, 0, 1, 0.4352941, 1,
-0.2476904, -0.9576628, -2.582134, 0, 1, 0.4431373, 1,
-0.2419944, 1.984719, -1.966383, 0, 1, 0.4470588, 1,
-0.2407824, -2.817928, -2.895332, 0, 1, 0.454902, 1,
-0.2400716, 1.332742, -0.2715848, 0, 1, 0.4588235, 1,
-0.2382012, 0.4335308, -2.065348, 0, 1, 0.4666667, 1,
-0.230392, -0.692743, -3.384151, 0, 1, 0.4705882, 1,
-0.2301894, 1.33548, -0.9531043, 0, 1, 0.4784314, 1,
-0.2279589, 0.1852413, -0.566474, 0, 1, 0.4823529, 1,
-0.2227279, 0.2914652, -1.10793, 0, 1, 0.4901961, 1,
-0.2181896, -1.148827, -2.975246, 0, 1, 0.4941176, 1,
-0.2157107, -1.669972, -2.622422, 0, 1, 0.5019608, 1,
-0.2154448, 0.1361565, -0.4556167, 0, 1, 0.509804, 1,
-0.2129972, 0.4400425, 1.221618, 0, 1, 0.5137255, 1,
-0.2109535, -0.2082914, -1.266615, 0, 1, 0.5215687, 1,
-0.2060716, 0.9098965, -0.1153676, 0, 1, 0.5254902, 1,
-0.2056392, 1.106942, -1.930841, 0, 1, 0.5333334, 1,
-0.2038309, 0.4492541, -0.0390509, 0, 1, 0.5372549, 1,
-0.2030837, -0.1501704, -2.34066, 0, 1, 0.5450981, 1,
-0.2014099, 0.2030687, -2.473704, 0, 1, 0.5490196, 1,
-0.1971482, 2.073818, -1.916433, 0, 1, 0.5568628, 1,
-0.1956957, -0.3094229, -3.363384, 0, 1, 0.5607843, 1,
-0.1951456, -0.828518, -1.126033, 0, 1, 0.5686275, 1,
-0.1882267, 0.006750052, -3.012343, 0, 1, 0.572549, 1,
-0.187739, -1.4082, -3.738459, 0, 1, 0.5803922, 1,
-0.1823923, -0.45992, -3.224168, 0, 1, 0.5843138, 1,
-0.1813137, -0.1643381, -3.005093, 0, 1, 0.5921569, 1,
-0.180994, 0.6235608, -0.08719162, 0, 1, 0.5960785, 1,
-0.179411, 0.6219711, -0.4415318, 0, 1, 0.6039216, 1,
-0.1775585, 1.307626, 0.08618094, 0, 1, 0.6117647, 1,
-0.174997, -0.2349913, -1.631978, 0, 1, 0.6156863, 1,
-0.1700175, 2.245959, -0.9199423, 0, 1, 0.6235294, 1,
-0.1689409, -0.1512351, -2.198522, 0, 1, 0.627451, 1,
-0.1681095, 0.1889514, -0.5122898, 0, 1, 0.6352941, 1,
-0.1624905, -0.8703588, -0.7660162, 0, 1, 0.6392157, 1,
-0.1616459, -1.26274, -2.365129, 0, 1, 0.6470588, 1,
-0.1609413, -1.174524, -3.340479, 0, 1, 0.6509804, 1,
-0.160346, -1.504152, -3.844741, 0, 1, 0.6588235, 1,
-0.1584621, -0.7927823, -4.021055, 0, 1, 0.6627451, 1,
-0.157328, -0.3217113, -3.360769, 0, 1, 0.6705883, 1,
-0.156994, -1.012754, -1.896959, 0, 1, 0.6745098, 1,
-0.156284, -1.09391, -3.382385, 0, 1, 0.682353, 1,
-0.144141, -0.6604442, -2.122331, 0, 1, 0.6862745, 1,
-0.1438988, -1.512049, -1.991892, 0, 1, 0.6941177, 1,
-0.1287432, 0.4269027, 0.8162995, 0, 1, 0.7019608, 1,
-0.1248993, -0.8485804, -1.630332, 0, 1, 0.7058824, 1,
-0.1223991, 1.153342, -1.270129, 0, 1, 0.7137255, 1,
-0.1221502, -0.9441598, -1.251065, 0, 1, 0.7176471, 1,
-0.1217423, -0.3169423, -0.8901519, 0, 1, 0.7254902, 1,
-0.1217306, 1.028385, -1.099485, 0, 1, 0.7294118, 1,
-0.1179839, 2.244413, -0.7768367, 0, 1, 0.7372549, 1,
-0.1171336, -0.268984, -2.176888, 0, 1, 0.7411765, 1,
-0.1143907, -1.729395, -1.028307, 0, 1, 0.7490196, 1,
-0.1137126, 0.08369046, -2.577173, 0, 1, 0.7529412, 1,
-0.110688, 0.9191539, -0.02844871, 0, 1, 0.7607843, 1,
-0.1074058, 1.223557, 0.4313883, 0, 1, 0.7647059, 1,
-0.107086, 1.508686, -0.7684765, 0, 1, 0.772549, 1,
-0.1060233, -0.3600679, -1.657264, 0, 1, 0.7764706, 1,
-0.1029945, -1.906358, -2.894962, 0, 1, 0.7843137, 1,
-0.102117, 1.737772, 0.1852047, 0, 1, 0.7882353, 1,
-0.09962867, -0.5685941, -4.506908, 0, 1, 0.7960784, 1,
-0.0994549, 0.2755491, -0.8017822, 0, 1, 0.8039216, 1,
-0.09913547, -0.9990472, -4.615168, 0, 1, 0.8078431, 1,
-0.09612747, -0.4424234, -3.438279, 0, 1, 0.8156863, 1,
-0.09067288, 0.004075028, -0.3957558, 0, 1, 0.8196079, 1,
-0.08869151, 1.32959, 0.2820661, 0, 1, 0.827451, 1,
-0.08442436, 2.595501, -2.325707, 0, 1, 0.8313726, 1,
-0.08217552, 1.274754, -0.0851815, 0, 1, 0.8392157, 1,
-0.08172315, 0.6800678, -0.8198983, 0, 1, 0.8431373, 1,
-0.08115059, 2.505039, -0.8908343, 0, 1, 0.8509804, 1,
-0.07840758, 1.134362, 2.35585, 0, 1, 0.854902, 1,
-0.07788071, -0.8542448, -4.050665, 0, 1, 0.8627451, 1,
-0.07445841, 2.05119, -1.19768, 0, 1, 0.8666667, 1,
-0.07155228, -0.2424721, -1.800332, 0, 1, 0.8745098, 1,
-0.07131492, 1.132185, -1.728243, 0, 1, 0.8784314, 1,
-0.06985766, 1.146774, -1.58864, 0, 1, 0.8862745, 1,
-0.069252, -3.061164, -2.758458, 0, 1, 0.8901961, 1,
-0.0690479, 0.8214467, -1.332987, 0, 1, 0.8980392, 1,
-0.06856132, 0.08942765, -1.468634, 0, 1, 0.9058824, 1,
-0.06804438, 0.2877536, -0.7544758, 0, 1, 0.9098039, 1,
-0.06604905, 0.8225335, 0.0431074, 0, 1, 0.9176471, 1,
-0.06505092, 0.3689896, -1.337658, 0, 1, 0.9215686, 1,
-0.06414832, 0.1149543, -2.320652, 0, 1, 0.9294118, 1,
-0.06372398, 0.1836983, 0.2795359, 0, 1, 0.9333333, 1,
-0.06332076, -0.7622116, -3.745195, 0, 1, 0.9411765, 1,
-0.06186384, -0.3948308, -3.858258, 0, 1, 0.945098, 1,
-0.05983507, 1.453408, -1.274143, 0, 1, 0.9529412, 1,
-0.05298536, -0.3751028, -2.786626, 0, 1, 0.9568627, 1,
-0.05253559, 1.12853, -0.5202834, 0, 1, 0.9647059, 1,
-0.0516798, 1.534302, 0.01949556, 0, 1, 0.9686275, 1,
-0.05028782, -1.881107, -1.975539, 0, 1, 0.9764706, 1,
-0.0476218, 0.8631364, -0.2134991, 0, 1, 0.9803922, 1,
-0.04676985, -0.3033226, -1.964493, 0, 1, 0.9882353, 1,
-0.04646102, -1.015481, -3.113837, 0, 1, 0.9921569, 1,
-0.04222628, -0.3293723, -2.508638, 0, 1, 1, 1,
-0.03496443, 0.4609115, -2.02493, 0, 0.9921569, 1, 1,
-0.02969661, -0.01503173, -1.993423, 0, 0.9882353, 1, 1,
-0.02953939, 0.650467, 0.06083875, 0, 0.9803922, 1, 1,
-0.02751418, -1.043005, -4.417932, 0, 0.9764706, 1, 1,
-0.02496564, 1.019543, -0.1019454, 0, 0.9686275, 1, 1,
-0.02467514, -1.386851, -2.708024, 0, 0.9647059, 1, 1,
-0.02426345, 0.09557284, 1.73773, 0, 0.9568627, 1, 1,
-0.01188513, 1.024833, -2.443766, 0, 0.9529412, 1, 1,
-0.008233839, 1.418975, -0.4580083, 0, 0.945098, 1, 1,
-0.003528968, 0.7645453, 0.5084401, 0, 0.9411765, 1, 1,
-0.000338859, 0.06128231, 0.1033502, 0, 0.9333333, 1, 1,
0.00548115, 0.6955444, -1.714806, 0, 0.9294118, 1, 1,
0.006258141, 1.026874, 1.229167, 0, 0.9215686, 1, 1,
0.008726206, 0.3986239, 1.05868, 0, 0.9176471, 1, 1,
0.01090805, -0.07977958, 2.730246, 0, 0.9098039, 1, 1,
0.01132358, -0.7930081, 4.369777, 0, 0.9058824, 1, 1,
0.01249698, -0.8829762, 2.909545, 0, 0.8980392, 1, 1,
0.01378037, 0.1826555, 2.523163, 0, 0.8901961, 1, 1,
0.01591152, 0.2308262, -1.068283, 0, 0.8862745, 1, 1,
0.01827274, -1.002248, 3.295474, 0, 0.8784314, 1, 1,
0.01831884, -0.5671498, 3.350674, 0, 0.8745098, 1, 1,
0.0185954, -1.626426, 3.32904, 0, 0.8666667, 1, 1,
0.02050035, -0.08018338, 1.688753, 0, 0.8627451, 1, 1,
0.02480024, 0.2910801, 0.4964803, 0, 0.854902, 1, 1,
0.02815023, 1.070199, -1.013214, 0, 0.8509804, 1, 1,
0.0306698, 0.07265322, -0.1468734, 0, 0.8431373, 1, 1,
0.03880406, -0.1497151, 4.166755, 0, 0.8392157, 1, 1,
0.04227037, 0.1607694, 0.1666586, 0, 0.8313726, 1, 1,
0.0424634, -0.779565, 2.655409, 0, 0.827451, 1, 1,
0.04246345, 1.545289, -0.08571988, 0, 0.8196079, 1, 1,
0.04474161, -1.232188, 2.215609, 0, 0.8156863, 1, 1,
0.0523476, -0.473907, 2.128683, 0, 0.8078431, 1, 1,
0.0559093, -0.5091521, 3.070367, 0, 0.8039216, 1, 1,
0.06002826, 0.7185364, -0.3866969, 0, 0.7960784, 1, 1,
0.06043753, -0.05812059, 2.273436, 0, 0.7882353, 1, 1,
0.06459813, -0.8683863, 4.205189, 0, 0.7843137, 1, 1,
0.06898525, -0.6071332, 1.550964, 0, 0.7764706, 1, 1,
0.07224381, -1.608498, 2.842247, 0, 0.772549, 1, 1,
0.07316223, 0.2080248, 0.3854543, 0, 0.7647059, 1, 1,
0.0784535, -0.1609992, 1.600871, 0, 0.7607843, 1, 1,
0.08102882, 0.3368592, 0.5826532, 0, 0.7529412, 1, 1,
0.0849749, -1.65793, 3.637487, 0, 0.7490196, 1, 1,
0.08714196, 0.290182, 0.2895367, 0, 0.7411765, 1, 1,
0.0884296, 0.9426672, 0.4747619, 0, 0.7372549, 1, 1,
0.08948338, -0.6076893, 3.075434, 0, 0.7294118, 1, 1,
0.09297095, -1.135467, 2.961133, 0, 0.7254902, 1, 1,
0.09493329, 0.8575216, 0.3078313, 0, 0.7176471, 1, 1,
0.09870671, -0.6161525, 2.856912, 0, 0.7137255, 1, 1,
0.09951214, 1.400134, -0.8349374, 0, 0.7058824, 1, 1,
0.09987423, 0.6404244, -0.4506501, 0, 0.6980392, 1, 1,
0.1036881, -0.9680138, 5.29641, 0, 0.6941177, 1, 1,
0.1054175, 0.3125041, 1.6946, 0, 0.6862745, 1, 1,
0.1059528, 1.025019, -0.8047066, 0, 0.682353, 1, 1,
0.1094555, -0.1825248, 2.72027, 0, 0.6745098, 1, 1,
0.1096429, -0.2587505, 1.21069, 0, 0.6705883, 1, 1,
0.1099912, 0.9033519, -1.173819, 0, 0.6627451, 1, 1,
0.1107026, 0.8529674, 0.7355471, 0, 0.6588235, 1, 1,
0.1143651, -0.6679839, 4.252694, 0, 0.6509804, 1, 1,
0.115904, -2.353054, 2.006307, 0, 0.6470588, 1, 1,
0.1198488, 0.36887, 0.2487304, 0, 0.6392157, 1, 1,
0.1216266, -0.9917533, 4.343162, 0, 0.6352941, 1, 1,
0.1223546, -0.2719177, 1.801358, 0, 0.627451, 1, 1,
0.131212, 1.001551, 0.9098028, 0, 0.6235294, 1, 1,
0.1312306, 0.7514333, -0.8479926, 0, 0.6156863, 1, 1,
0.1314485, -0.06602548, 3.345177, 0, 0.6117647, 1, 1,
0.1339509, -0.9200746, 4.434172, 0, 0.6039216, 1, 1,
0.1359256, 0.4087718, -0.843374, 0, 0.5960785, 1, 1,
0.1373308, 0.1072621, 1.564197, 0, 0.5921569, 1, 1,
0.1381079, -0.8523056, 3.69423, 0, 0.5843138, 1, 1,
0.1385014, 2.207556, -1.36501, 0, 0.5803922, 1, 1,
0.1428681, 0.5416936, 0.2024481, 0, 0.572549, 1, 1,
0.14299, -1.730628, 3.319795, 0, 0.5686275, 1, 1,
0.1463491, -0.1136031, 0.9162286, 0, 0.5607843, 1, 1,
0.150598, 0.4744933, 1.052817, 0, 0.5568628, 1, 1,
0.1520782, 0.2009568, 1.37649, 0, 0.5490196, 1, 1,
0.1536922, 2.546629, -0.6560294, 0, 0.5450981, 1, 1,
0.1543039, 0.8551231, 0.6750827, 0, 0.5372549, 1, 1,
0.1568439, 0.2037864, -0.4524599, 0, 0.5333334, 1, 1,
0.1589542, -1.037601, 2.850433, 0, 0.5254902, 1, 1,
0.1595805, 1.805773, -1.007992, 0, 0.5215687, 1, 1,
0.1645691, 0.2656264, 1.81661, 0, 0.5137255, 1, 1,
0.1651628, 0.6888846, 0.6514278, 0, 0.509804, 1, 1,
0.165613, -0.4560554, 4.966177, 0, 0.5019608, 1, 1,
0.1681045, -0.764892, 2.443243, 0, 0.4941176, 1, 1,
0.1697113, 0.6306653, 0.4098392, 0, 0.4901961, 1, 1,
0.1727731, -0.843261, 4.470012, 0, 0.4823529, 1, 1,
0.1819744, -1.428268, 3.313498, 0, 0.4784314, 1, 1,
0.1866468, 0.9262887, -0.0225008, 0, 0.4705882, 1, 1,
0.1885063, 0.2856241, 0.9618899, 0, 0.4666667, 1, 1,
0.188775, -0.3161523, 4.43303, 0, 0.4588235, 1, 1,
0.1908876, 0.2919495, -0.6588086, 0, 0.454902, 1, 1,
0.1908936, 0.2020125, -1.118468, 0, 0.4470588, 1, 1,
0.1951657, -0.822069, 3.725985, 0, 0.4431373, 1, 1,
0.1981428, 0.901566, -0.9881407, 0, 0.4352941, 1, 1,
0.2031129, 0.2660654, 2.313202, 0, 0.4313726, 1, 1,
0.2117845, -0.3571914, 1.286125, 0, 0.4235294, 1, 1,
0.212662, -0.7897799, 3.269355, 0, 0.4196078, 1, 1,
0.2206105, -0.4026918, 2.919, 0, 0.4117647, 1, 1,
0.2244433, 0.6997454, 1.63449, 0, 0.4078431, 1, 1,
0.2293911, 0.3510142, 1.94279, 0, 0.4, 1, 1,
0.2295305, -0.3543558, 2.379612, 0, 0.3921569, 1, 1,
0.2357934, -0.312077, 3.486937, 0, 0.3882353, 1, 1,
0.2358737, -0.648377, 2.828996, 0, 0.3803922, 1, 1,
0.2363135, 1.53027, -0.9374298, 0, 0.3764706, 1, 1,
0.2434745, 1.391555, 1.098531, 0, 0.3686275, 1, 1,
0.2486956, -0.3400086, 1.308357, 0, 0.3647059, 1, 1,
0.2488725, 0.6036141, 0.4218954, 0, 0.3568628, 1, 1,
0.249502, -1.250165, 3.973428, 0, 0.3529412, 1, 1,
0.2520006, -1.120073, 4.128535, 0, 0.345098, 1, 1,
0.2524476, 1.297426, -0.2771072, 0, 0.3411765, 1, 1,
0.2531671, -0.156037, 2.843281, 0, 0.3333333, 1, 1,
0.2535081, -0.09160755, 2.873271, 0, 0.3294118, 1, 1,
0.2535658, 1.100905, -0.1272345, 0, 0.3215686, 1, 1,
0.255228, -0.1275923, 2.698099, 0, 0.3176471, 1, 1,
0.2601905, 0.1147282, 2.72457, 0, 0.3098039, 1, 1,
0.2605793, -0.9530798, 5.222054, 0, 0.3058824, 1, 1,
0.2651635, -0.524432, 2.564978, 0, 0.2980392, 1, 1,
0.2709858, -0.755662, 3.184289, 0, 0.2901961, 1, 1,
0.2731905, -0.4623339, 2.129563, 0, 0.2862745, 1, 1,
0.2786618, 0.2982012, 1.659045, 0, 0.2784314, 1, 1,
0.2904631, -0.005197367, -0.9040179, 0, 0.2745098, 1, 1,
0.2930019, 0.5106419, 1.83591, 0, 0.2666667, 1, 1,
0.2941191, 1.865863, -1.255958, 0, 0.2627451, 1, 1,
0.2952663, -0.8985696, 1.676021, 0, 0.254902, 1, 1,
0.2962286, 0.737531, 0.170503, 0, 0.2509804, 1, 1,
0.2963853, -0.2745793, 2.340413, 0, 0.2431373, 1, 1,
0.2990013, -0.3024985, 3.317395, 0, 0.2392157, 1, 1,
0.3014577, 0.8908198, 0.2256701, 0, 0.2313726, 1, 1,
0.301773, -0.2118544, 1.964855, 0, 0.227451, 1, 1,
0.3018582, -0.2849548, 2.16386, 0, 0.2196078, 1, 1,
0.30296, -0.3554282, -0.7661294, 0, 0.2156863, 1, 1,
0.3043542, 0.927986, 0.1271229, 0, 0.2078431, 1, 1,
0.307114, 0.9789517, 0.1991468, 0, 0.2039216, 1, 1,
0.308972, 0.3284532, 1.12725, 0, 0.1960784, 1, 1,
0.309027, 0.7562807, -0.3511479, 0, 0.1882353, 1, 1,
0.3106907, -1.483496, 2.582779, 0, 0.1843137, 1, 1,
0.3116418, 0.2785081, 1.150278, 0, 0.1764706, 1, 1,
0.3121593, -0.5792711, 3.754289, 0, 0.172549, 1, 1,
0.3134769, 1.615404, 0.6217457, 0, 0.1647059, 1, 1,
0.3149473, -0.461176, 3.334591, 0, 0.1607843, 1, 1,
0.3186233, -0.5013453, 5.097576, 0, 0.1529412, 1, 1,
0.3209842, 0.5752814, 0.6962169, 0, 0.1490196, 1, 1,
0.3209895, -1.138354, 1.536243, 0, 0.1411765, 1, 1,
0.3244343, 1.003837, 1.083744, 0, 0.1372549, 1, 1,
0.3326123, 0.949468, -0.2658662, 0, 0.1294118, 1, 1,
0.3362556, -0.01590658, 1.655872, 0, 0.1254902, 1, 1,
0.3419016, 0.7999032, 0.2914184, 0, 0.1176471, 1, 1,
0.3466035, 1.633867, -0.6670679, 0, 0.1137255, 1, 1,
0.3498453, 0.3063519, 1.654399, 0, 0.1058824, 1, 1,
0.3502416, 0.4416689, 0.5136865, 0, 0.09803922, 1, 1,
0.3538856, 0.2171682, 0.3889579, 0, 0.09411765, 1, 1,
0.3546332, 1.523438, 0.8781099, 0, 0.08627451, 1, 1,
0.3555415, -0.2619905, 3.849223, 0, 0.08235294, 1, 1,
0.3575936, -0.9282243, 2.536378, 0, 0.07450981, 1, 1,
0.3584843, 0.1972974, 0.1210938, 0, 0.07058824, 1, 1,
0.3650046, 1.173564, 0.7292708, 0, 0.0627451, 1, 1,
0.3685197, 1.127779, -0.08893061, 0, 0.05882353, 1, 1,
0.3690312, 0.05781078, 1.830058, 0, 0.05098039, 1, 1,
0.3712051, -1.425383, 2.432924, 0, 0.04705882, 1, 1,
0.3721708, -1.182305, 3.334569, 0, 0.03921569, 1, 1,
0.3732993, 1.346247, -0.4293386, 0, 0.03529412, 1, 1,
0.3750195, 1.067034, 1.347363, 0, 0.02745098, 1, 1,
0.3803563, 1.463723, -0.05490574, 0, 0.02352941, 1, 1,
0.3816331, -0.7704693, 3.196937, 0, 0.01568628, 1, 1,
0.3823119, 0.9717206, 1.203768, 0, 0.01176471, 1, 1,
0.3856772, -0.4611478, 2.353442, 0, 0.003921569, 1, 1,
0.3865085, 0.8170082, -1.16693, 0.003921569, 0, 1, 1,
0.3869576, -1.398803, 3.942535, 0.007843138, 0, 1, 1,
0.3876528, 0.08700568, 2.872758, 0.01568628, 0, 1, 1,
0.3877639, 1.824937, 0.5165321, 0.01960784, 0, 1, 1,
0.3977993, 1.263218, -0.7563314, 0.02745098, 0, 1, 1,
0.4060068, -0.8800069, 3.732883, 0.03137255, 0, 1, 1,
0.4076886, 0.0308374, 1.748486, 0.03921569, 0, 1, 1,
0.4085652, -1.213162, 3.124041, 0.04313726, 0, 1, 1,
0.4093997, -0.9273139, 3.068396, 0.05098039, 0, 1, 1,
0.4165339, -0.9388208, 0.8483009, 0.05490196, 0, 1, 1,
0.423712, -0.6660182, 3.103102, 0.0627451, 0, 1, 1,
0.4290847, -0.3000391, 0.9548494, 0.06666667, 0, 1, 1,
0.4292335, 1.249928, 2.127763, 0.07450981, 0, 1, 1,
0.4367287, 1.643963, 0.2181604, 0.07843138, 0, 1, 1,
0.4380738, 0.7037284, 0.4451994, 0.08627451, 0, 1, 1,
0.4394351, 0.09487806, 0.6657262, 0.09019608, 0, 1, 1,
0.4412823, -0.04021742, 2.181152, 0.09803922, 0, 1, 1,
0.4418708, 1.032037, 0.2378336, 0.1058824, 0, 1, 1,
0.4426729, 0.1332886, 0.8070781, 0.1098039, 0, 1, 1,
0.4430083, -0.7293249, 2.415728, 0.1176471, 0, 1, 1,
0.4497935, 0.2225678, 3.029398, 0.1215686, 0, 1, 1,
0.4499661, 0.3262172, -0.2221074, 0.1294118, 0, 1, 1,
0.4539372, 0.221868, 2.33599, 0.1333333, 0, 1, 1,
0.4552191, -0.05064118, 1.995584, 0.1411765, 0, 1, 1,
0.4607871, 0.4660259, -0.01480621, 0.145098, 0, 1, 1,
0.4679891, -0.6981352, 2.340292, 0.1529412, 0, 1, 1,
0.4769358, 0.5363702, 0.2698755, 0.1568628, 0, 1, 1,
0.4774572, 1.126593, 0.5653209, 0.1647059, 0, 1, 1,
0.4801087, -0.3796628, 3.605226, 0.1686275, 0, 1, 1,
0.4842372, 0.4924984, -0.007280684, 0.1764706, 0, 1, 1,
0.4847307, 0.4541474, 1.625986, 0.1803922, 0, 1, 1,
0.4847652, 0.01893162, 3.067538, 0.1882353, 0, 1, 1,
0.485518, 0.1824099, 0.7249333, 0.1921569, 0, 1, 1,
0.4856976, 2.756905, -2.08831, 0.2, 0, 1, 1,
0.4862203, -0.502685, 3.516424, 0.2078431, 0, 1, 1,
0.4866723, 0.369805, 0.9014725, 0.2117647, 0, 1, 1,
0.4880543, -1.108809, 4.092064, 0.2196078, 0, 1, 1,
0.4922765, -0.2045723, -0.2198512, 0.2235294, 0, 1, 1,
0.4944199, 2.1731, -0.4255566, 0.2313726, 0, 1, 1,
0.5015436, -0.459422, 4.502958, 0.2352941, 0, 1, 1,
0.5092891, 0.5583979, -0.01554646, 0.2431373, 0, 1, 1,
0.5126766, 0.07254671, 1.307599, 0.2470588, 0, 1, 1,
0.5152596, -0.8692281, 3.189274, 0.254902, 0, 1, 1,
0.5197762, -0.507486, 4.047349, 0.2588235, 0, 1, 1,
0.5245432, 0.8696164, -0.09039271, 0.2666667, 0, 1, 1,
0.526341, -1.391474, 2.367141, 0.2705882, 0, 1, 1,
0.527601, 0.4341304, 2.143972, 0.2784314, 0, 1, 1,
0.5317388, -0.7955497, 2.444431, 0.282353, 0, 1, 1,
0.5369895, -0.4098634, 2.706857, 0.2901961, 0, 1, 1,
0.5404498, -0.4443613, 1.397078, 0.2941177, 0, 1, 1,
0.5428848, 0.7489562, 2.301625, 0.3019608, 0, 1, 1,
0.5443811, -0.1196617, 2.367833, 0.3098039, 0, 1, 1,
0.5517917, 0.5385847, 1.352165, 0.3137255, 0, 1, 1,
0.5586656, -0.1463718, 2.437147, 0.3215686, 0, 1, 1,
0.5600882, -0.05940312, 0.442091, 0.3254902, 0, 1, 1,
0.5618891, 0.6610226, 1.170761, 0.3333333, 0, 1, 1,
0.5709751, 0.1107024, 0.3275629, 0.3372549, 0, 1, 1,
0.5711716, 0.2538767, -0.16911, 0.345098, 0, 1, 1,
0.5717261, 1.220112, -0.5101199, 0.3490196, 0, 1, 1,
0.5718343, -1.069695, 3.282168, 0.3568628, 0, 1, 1,
0.581995, -1.14343, 2.414714, 0.3607843, 0, 1, 1,
0.5822724, 0.6245362, -1.207398, 0.3686275, 0, 1, 1,
0.5837864, 0.1310605, 1.640748, 0.372549, 0, 1, 1,
0.584111, 0.6050692, 1.921797, 0.3803922, 0, 1, 1,
0.5905115, 1.13728, 0.2597762, 0.3843137, 0, 1, 1,
0.5934159, 0.6748146, 1.448899, 0.3921569, 0, 1, 1,
0.5956916, 1.270697, 1.088529, 0.3960784, 0, 1, 1,
0.5974455, -0.6016769, 1.76524, 0.4039216, 0, 1, 1,
0.6019604, -0.3725406, 1.951226, 0.4117647, 0, 1, 1,
0.610613, -0.007135319, 0.5704539, 0.4156863, 0, 1, 1,
0.6112177, 1.285602, -0.003547643, 0.4235294, 0, 1, 1,
0.6169601, 1.680207, -0.7438511, 0.427451, 0, 1, 1,
0.6180411, -0.2492548, 1.465039, 0.4352941, 0, 1, 1,
0.6230425, 0.2243502, 2.180449, 0.4392157, 0, 1, 1,
0.6251001, -0.7354985, 2.992871, 0.4470588, 0, 1, 1,
0.6288194, 0.5133252, 0.7996584, 0.4509804, 0, 1, 1,
0.633552, -0.3675102, 2.159837, 0.4588235, 0, 1, 1,
0.6357065, -0.6972669, 1.453269, 0.4627451, 0, 1, 1,
0.6417309, 1.004797, 0.2374783, 0.4705882, 0, 1, 1,
0.6424516, 0.5021482, -0.04575589, 0.4745098, 0, 1, 1,
0.6436917, -0.7894487, 1.907168, 0.4823529, 0, 1, 1,
0.6464462, -0.6467052, 1.74457, 0.4862745, 0, 1, 1,
0.6491452, -0.1180231, 2.002508, 0.4941176, 0, 1, 1,
0.6596595, 1.679588, -0.6433494, 0.5019608, 0, 1, 1,
0.6617751, 1.628994, 0.6400604, 0.5058824, 0, 1, 1,
0.6676533, -0.8648055, 2.166765, 0.5137255, 0, 1, 1,
0.6688779, 2.729166, -0.05014506, 0.5176471, 0, 1, 1,
0.6703368, 0.7097846, 1.138583, 0.5254902, 0, 1, 1,
0.6775975, -1.174352, 1.322752, 0.5294118, 0, 1, 1,
0.678381, 0.4284275, 1.626407, 0.5372549, 0, 1, 1,
0.6908563, -0.7928474, 3.850571, 0.5411765, 0, 1, 1,
0.6950511, 1.036482, -0.3529425, 0.5490196, 0, 1, 1,
0.7016171, -0.3209298, 2.067226, 0.5529412, 0, 1, 1,
0.704796, 1.391937, -0.01724338, 0.5607843, 0, 1, 1,
0.7060769, -0.2425211, 0.6513858, 0.5647059, 0, 1, 1,
0.7156983, -0.1927271, 2.374162, 0.572549, 0, 1, 1,
0.7164282, -0.3761126, 1.399576, 0.5764706, 0, 1, 1,
0.7166134, 1.999921, -1.917703, 0.5843138, 0, 1, 1,
0.7184664, -0.03097158, 2.178138, 0.5882353, 0, 1, 1,
0.7258989, 0.8070033, 0.2589004, 0.5960785, 0, 1, 1,
0.7280506, -0.4627921, 3.924675, 0.6039216, 0, 1, 1,
0.7284314, -0.8618847, 3.46468, 0.6078432, 0, 1, 1,
0.733379, 0.6296124, 1.406699, 0.6156863, 0, 1, 1,
0.7355149, -0.6305132, 0.1316788, 0.6196079, 0, 1, 1,
0.7466025, -0.6908659, 2.06528, 0.627451, 0, 1, 1,
0.7479838, -0.04394946, 2.469826, 0.6313726, 0, 1, 1,
0.7494454, -0.8022747, 1.544009, 0.6392157, 0, 1, 1,
0.7496951, -1.239343, 3.527942, 0.6431373, 0, 1, 1,
0.751129, -0.8091307, 3.025421, 0.6509804, 0, 1, 1,
0.752633, -0.05898092, 1.224024, 0.654902, 0, 1, 1,
0.7548169, -1.243448, 4.573399, 0.6627451, 0, 1, 1,
0.7573167, 0.3771756, 1.755192, 0.6666667, 0, 1, 1,
0.7608021, 0.6276984, 0.2090919, 0.6745098, 0, 1, 1,
0.7632303, -0.9195796, 1.127163, 0.6784314, 0, 1, 1,
0.7643188, -1.929572, 3.934337, 0.6862745, 0, 1, 1,
0.7647772, -0.6049025, 3.158695, 0.6901961, 0, 1, 1,
0.766288, -0.6906795, 0.5560234, 0.6980392, 0, 1, 1,
0.767695, 0.4995149, 0.5072029, 0.7058824, 0, 1, 1,
0.7745362, -1.06499, 2.249146, 0.7098039, 0, 1, 1,
0.7807066, 0.2135816, 1.162471, 0.7176471, 0, 1, 1,
0.7826658, -1.531727, 3.16971, 0.7215686, 0, 1, 1,
0.7832655, 0.04658396, 0.9937742, 0.7294118, 0, 1, 1,
0.786018, -1.267004, 3.331526, 0.7333333, 0, 1, 1,
0.7876591, -1.486125, 1.671869, 0.7411765, 0, 1, 1,
0.78955, -1.256748, 3.889184, 0.7450981, 0, 1, 1,
0.7946349, -0.06458558, 2.566512, 0.7529412, 0, 1, 1,
0.7952366, -0.005897699, 1.005533, 0.7568628, 0, 1, 1,
0.8054727, -0.6936054, 1.965377, 0.7647059, 0, 1, 1,
0.8107851, 0.3278418, 1.910171, 0.7686275, 0, 1, 1,
0.8144361, -0.09053469, 1.037915, 0.7764706, 0, 1, 1,
0.8167131, 0.1871707, 0.5810215, 0.7803922, 0, 1, 1,
0.8188981, 1.980414, 2.177359, 0.7882353, 0, 1, 1,
0.8210949, 0.08384721, 0.2887672, 0.7921569, 0, 1, 1,
0.821835, 0.06987581, 2.139845, 0.8, 0, 1, 1,
0.8260031, -0.9607686, 3.41509, 0.8078431, 0, 1, 1,
0.8270834, 0.05406462, 1.41596, 0.8117647, 0, 1, 1,
0.8344911, -1.854447, 2.289757, 0.8196079, 0, 1, 1,
0.8372591, 1.411635, 2.003483, 0.8235294, 0, 1, 1,
0.8384466, 1.627135, 2.228308, 0.8313726, 0, 1, 1,
0.8420348, -1.153526, 3.128116, 0.8352941, 0, 1, 1,
0.8428395, -1.278098, 1.42987, 0.8431373, 0, 1, 1,
0.8443667, 0.03275513, 1.486059, 0.8470588, 0, 1, 1,
0.8533702, -0.2347434, 0.2237837, 0.854902, 0, 1, 1,
0.8567046, 2.513247, -0.3077933, 0.8588235, 0, 1, 1,
0.8642343, 0.5663671, 1.32937, 0.8666667, 0, 1, 1,
0.8650434, 0.9127597, 1.070738, 0.8705882, 0, 1, 1,
0.8719066, 0.05237968, 0.8522891, 0.8784314, 0, 1, 1,
0.8754773, 1.309624, 2.265844, 0.8823529, 0, 1, 1,
0.8805529, -0.2495303, 1.172014, 0.8901961, 0, 1, 1,
0.8847415, 1.112179, 0.3168808, 0.8941177, 0, 1, 1,
0.8892996, 0.214167, 0.7068588, 0.9019608, 0, 1, 1,
0.8953938, 1.057926, 1.329041, 0.9098039, 0, 1, 1,
0.8985144, 1.63536, -0.8859679, 0.9137255, 0, 1, 1,
0.8995236, 0.9817943, 1.157911, 0.9215686, 0, 1, 1,
0.9044583, -0.2365598, 3.281247, 0.9254902, 0, 1, 1,
0.9068263, -0.9240767, 3.079175, 0.9333333, 0, 1, 1,
0.911313, -2.266067, 1.815359, 0.9372549, 0, 1, 1,
0.911694, -1.305971, 3.699247, 0.945098, 0, 1, 1,
0.9118712, 0.2590621, 1.82779, 0.9490196, 0, 1, 1,
0.9173951, 0.4794184, 1.448475, 0.9568627, 0, 1, 1,
0.9194748, -0.2433606, 2.778389, 0.9607843, 0, 1, 1,
0.9225022, 0.2881888, 3.56557, 0.9686275, 0, 1, 1,
0.9259844, -0.1656631, 2.599538, 0.972549, 0, 1, 1,
0.9408097, 1.21782, 0.3746979, 0.9803922, 0, 1, 1,
0.9421933, 0.8630647, 0.4382727, 0.9843137, 0, 1, 1,
0.9583961, -0.2481894, 0.3045381, 0.9921569, 0, 1, 1,
0.9704872, -1.35202, 3.430815, 0.9960784, 0, 1, 1,
0.9769813, -1.78468, 1.828889, 1, 0, 0.9960784, 1,
0.9888554, 0.2698998, 0.0649302, 1, 0, 0.9882353, 1,
0.9900587, -0.4387544, 3.05674, 1, 0, 0.9843137, 1,
0.994978, -0.04794554, 0.8281285, 1, 0, 0.9764706, 1,
1.012748, -1.352427, 3.269148, 1, 0, 0.972549, 1,
1.015932, -0.3377283, 2.322506, 1, 0, 0.9647059, 1,
1.026986, -0.1061488, 2.48094, 1, 0, 0.9607843, 1,
1.028032, -0.4520037, 1.502514, 1, 0, 0.9529412, 1,
1.03213, 0.5831748, 2.60779, 1, 0, 0.9490196, 1,
1.042423, -1.185481, 3.111147, 1, 0, 0.9411765, 1,
1.045015, -0.3457232, 0.8225106, 1, 0, 0.9372549, 1,
1.046244, 1.327137, 0.5319411, 1, 0, 0.9294118, 1,
1.048491, -2.124589, 1.682809, 1, 0, 0.9254902, 1,
1.050517, -0.3079294, 1.999815, 1, 0, 0.9176471, 1,
1.051265, 0.2140973, 2.66363, 1, 0, 0.9137255, 1,
1.061747, -0.3144677, 1.180978, 1, 0, 0.9058824, 1,
1.065034, -1.36043, 3.49113, 1, 0, 0.9019608, 1,
1.068619, -0.1905119, 1.475966, 1, 0, 0.8941177, 1,
1.068946, -0.7530208, 2.005147, 1, 0, 0.8862745, 1,
1.073828, 1.763005, 0.6659361, 1, 0, 0.8823529, 1,
1.079901, 1.279174, 1.043208, 1, 0, 0.8745098, 1,
1.082481, -0.4250427, 1.385999, 1, 0, 0.8705882, 1,
1.088774, -0.3213742, 1.821951, 1, 0, 0.8627451, 1,
1.089093, -0.7484592, 2.024378, 1, 0, 0.8588235, 1,
1.091057, -0.02611542, 3.365181, 1, 0, 0.8509804, 1,
1.091848, -0.5159712, 1.33594, 1, 0, 0.8470588, 1,
1.091954, 0.30253, 1.726471, 1, 0, 0.8392157, 1,
1.102874, -0.730086, 2.941886, 1, 0, 0.8352941, 1,
1.103637, 0.04425266, 1.82238, 1, 0, 0.827451, 1,
1.104799, 1.110323, 0.4635295, 1, 0, 0.8235294, 1,
1.105078, 0.5618367, 0.5822006, 1, 0, 0.8156863, 1,
1.110285, -1.436743, 1.388903, 1, 0, 0.8117647, 1,
1.117487, -1.818748, 3.527193, 1, 0, 0.8039216, 1,
1.122491, 0.1625076, 3.954939, 1, 0, 0.7960784, 1,
1.125453, 0.0429474, 1.561173, 1, 0, 0.7921569, 1,
1.127209, -0.7023554, 3.827636, 1, 0, 0.7843137, 1,
1.128633, 1.266728, 0.5273931, 1, 0, 0.7803922, 1,
1.132854, 0.05424002, 3.662091, 1, 0, 0.772549, 1,
1.145498, -1.211575, 3.613945, 1, 0, 0.7686275, 1,
1.150183, 2.211692, -0.2706054, 1, 0, 0.7607843, 1,
1.166891, 0.1654905, 2.244713, 1, 0, 0.7568628, 1,
1.166909, 0.3167903, 1.44101, 1, 0, 0.7490196, 1,
1.171018, -1.040309, 1.962142, 1, 0, 0.7450981, 1,
1.172806, 1.235507, 0.4088652, 1, 0, 0.7372549, 1,
1.173089, 0.4063599, 1.593822, 1, 0, 0.7333333, 1,
1.178236, -1.638514, 0.6817726, 1, 0, 0.7254902, 1,
1.181727, -0.5837915, 2.303302, 1, 0, 0.7215686, 1,
1.183117, 0.429019, 2.371792, 1, 0, 0.7137255, 1,
1.1919, 0.6936498, 0.1168015, 1, 0, 0.7098039, 1,
1.201119, 0.3719359, 1.618086, 1, 0, 0.7019608, 1,
1.20914, 0.3217925, 1.721855, 1, 0, 0.6941177, 1,
1.211539, -0.5494455, 1.145842, 1, 0, 0.6901961, 1,
1.227384, -0.02656103, 1.828985, 1, 0, 0.682353, 1,
1.228575, 0.0008822578, 2.311423, 1, 0, 0.6784314, 1,
1.233999, -0.5095081, 2.739703, 1, 0, 0.6705883, 1,
1.243832, 0.5685036, 1.499152, 1, 0, 0.6666667, 1,
1.24891, -1.248682, 2.23576, 1, 0, 0.6588235, 1,
1.251066, 1.172726, 1.756937, 1, 0, 0.654902, 1,
1.257091, -0.935102, 1.053963, 1, 0, 0.6470588, 1,
1.259735, -0.8349224, 1.649313, 1, 0, 0.6431373, 1,
1.26288, -0.02505432, 2.861328, 1, 0, 0.6352941, 1,
1.272097, 0.5409916, 2.342056, 1, 0, 0.6313726, 1,
1.280153, 0.6589407, 2.678797, 1, 0, 0.6235294, 1,
1.282097, 1.678659, 2.153405, 1, 0, 0.6196079, 1,
1.291363, 0.5441232, 1.530795, 1, 0, 0.6117647, 1,
1.293668, 0.1343936, 2.355745, 1, 0, 0.6078432, 1,
1.294281, -0.9119583, 3.76741, 1, 0, 0.6, 1,
1.301388, -0.5853072, 1.253279, 1, 0, 0.5921569, 1,
1.303209, 1.272266, 0.5807646, 1, 0, 0.5882353, 1,
1.307263, 0.312573, 3.316546, 1, 0, 0.5803922, 1,
1.32608, -0.730157, 2.499161, 1, 0, 0.5764706, 1,
1.329541, 0.07035469, 1.411518, 1, 0, 0.5686275, 1,
1.33704, 0.08069713, 1.317744, 1, 0, 0.5647059, 1,
1.340539, 1.519275, 0.5246683, 1, 0, 0.5568628, 1,
1.347494, 1.120789, 0.6983787, 1, 0, 0.5529412, 1,
1.348227, -2.285578, 1.969487, 1, 0, 0.5450981, 1,
1.349335, 2.021863, 1.803427, 1, 0, 0.5411765, 1,
1.349706, 0.8825241, 0.8980437, 1, 0, 0.5333334, 1,
1.358107, 1.353595, 0.5779506, 1, 0, 0.5294118, 1,
1.369321, 0.982557, 2.041324, 1, 0, 0.5215687, 1,
1.372484, 0.5135356, 2.583798, 1, 0, 0.5176471, 1,
1.374259, -0.9104985, 3.361596, 1, 0, 0.509804, 1,
1.379433, -0.4783413, 0.5233675, 1, 0, 0.5058824, 1,
1.3933, 0.6732209, 2.601705, 1, 0, 0.4980392, 1,
1.402936, 0.4937924, 2.493963, 1, 0, 0.4901961, 1,
1.412216, 0.476521, 1.013731, 1, 0, 0.4862745, 1,
1.413147, 0.8072115, 0.1538423, 1, 0, 0.4784314, 1,
1.421349, -0.6371395, 2.029577, 1, 0, 0.4745098, 1,
1.429406, 1.661776, 1.250582, 1, 0, 0.4666667, 1,
1.435163, 1.324795, 0.4310986, 1, 0, 0.4627451, 1,
1.454655, -0.7663249, 0.2557561, 1, 0, 0.454902, 1,
1.457619, 1.202997, 1.0175, 1, 0, 0.4509804, 1,
1.465469, 1.483296, 0.4340133, 1, 0, 0.4431373, 1,
1.468047, 0.6690359, 1.702642, 1, 0, 0.4392157, 1,
1.471639, 0.6393632, -0.1198875, 1, 0, 0.4313726, 1,
1.477548, 0.2034532, 0.639051, 1, 0, 0.427451, 1,
1.478703, -0.4134004, 2.394511, 1, 0, 0.4196078, 1,
1.490916, 1.302078, 0.4310997, 1, 0, 0.4156863, 1,
1.497796, 1.221641, 1.565833, 1, 0, 0.4078431, 1,
1.50525, -0.4253093, 3.858195, 1, 0, 0.4039216, 1,
1.545363, 1.683799, -0.5098777, 1, 0, 0.3960784, 1,
1.545943, 1.284865, 1.39563, 1, 0, 0.3882353, 1,
1.555744, -0.4842599, 3.077206, 1, 0, 0.3843137, 1,
1.561063, 0.7587696, 2.170612, 1, 0, 0.3764706, 1,
1.561111, 1.623268, 1.033916, 1, 0, 0.372549, 1,
1.561217, 3.145054, 0.9862241, 1, 0, 0.3647059, 1,
1.57388, 0.4159885, 2.158262, 1, 0, 0.3607843, 1,
1.585306, -0.7113356, 0.9029835, 1, 0, 0.3529412, 1,
1.594085, 2.10756, 1.474779, 1, 0, 0.3490196, 1,
1.59996, 0.06539246, 2.35535, 1, 0, 0.3411765, 1,
1.602805, 1.707709, -1.185175, 1, 0, 0.3372549, 1,
1.609452, -0.01950267, 2.146796, 1, 0, 0.3294118, 1,
1.613721, -1.249022, 1.223944, 1, 0, 0.3254902, 1,
1.614669, 0.9448001, -1.348623, 1, 0, 0.3176471, 1,
1.615926, 1.35302, 3.552848, 1, 0, 0.3137255, 1,
1.616563, -0.5357111, 2.327294, 1, 0, 0.3058824, 1,
1.617764, -0.6399961, 2.25813, 1, 0, 0.2980392, 1,
1.622425, 0.238343, 0.9917061, 1, 0, 0.2941177, 1,
1.627133, -0.784133, 1.294056, 1, 0, 0.2862745, 1,
1.64111, 0.3853198, 2.102725, 1, 0, 0.282353, 1,
1.64298, 0.2906792, 3.551693, 1, 0, 0.2745098, 1,
1.643273, 2.085863, -0.5441189, 1, 0, 0.2705882, 1,
1.647651, 0.3433174, -0.5131728, 1, 0, 0.2627451, 1,
1.666819, -0.4794501, 0.2367814, 1, 0, 0.2588235, 1,
1.687077, -0.3717127, 0.3568779, 1, 0, 0.2509804, 1,
1.716322, 0.2418503, 3.162013, 1, 0, 0.2470588, 1,
1.724011, -0.07062469, 1.527349, 1, 0, 0.2392157, 1,
1.753074, -1.508872, 3.322156, 1, 0, 0.2352941, 1,
1.766681, -0.07765292, 2.604278, 1, 0, 0.227451, 1,
1.780449, 2.187682, 0.4411109, 1, 0, 0.2235294, 1,
1.822179, -1.325755, 0.4050542, 1, 0, 0.2156863, 1,
1.86663, 0.3106934, 0.8086612, 1, 0, 0.2117647, 1,
1.875118, 0.001970207, 0.9244983, 1, 0, 0.2039216, 1,
1.880908, -0.6983919, 2.225828, 1, 0, 0.1960784, 1,
1.896508, 0.09405966, 1.965687, 1, 0, 0.1921569, 1,
1.919508, 0.4200787, 0.5413177, 1, 0, 0.1843137, 1,
1.929545, -0.3286164, 2.345974, 1, 0, 0.1803922, 1,
1.93862, -1.377709, 2.946518, 1, 0, 0.172549, 1,
1.964843, -0.1520513, 1.698609, 1, 0, 0.1686275, 1,
1.981482, 0.9146549, 1.748397, 1, 0, 0.1607843, 1,
2.032559, 2.091456, 2.336953, 1, 0, 0.1568628, 1,
2.042055, -0.2289753, 2.95245, 1, 0, 0.1490196, 1,
2.073469, 0.4548965, 2.898523, 1, 0, 0.145098, 1,
2.074697, 0.3114715, 2.530165, 1, 0, 0.1372549, 1,
2.134032, 0.1107228, 2.061186, 1, 0, 0.1333333, 1,
2.150326, -3.075486, 3.772673, 1, 0, 0.1254902, 1,
2.185511, -1.618716, 1.712902, 1, 0, 0.1215686, 1,
2.206526, 0.8835677, 0.6101205, 1, 0, 0.1137255, 1,
2.216435, 0.9704409, 2.582372, 1, 0, 0.1098039, 1,
2.217396, -0.2815416, 2.510027, 1, 0, 0.1019608, 1,
2.309625, -1.26137, 2.482381, 1, 0, 0.09411765, 1,
2.339577, -1.539894, 2.86014, 1, 0, 0.09019608, 1,
2.348022, -1.131921, 1.314211, 1, 0, 0.08235294, 1,
2.352583, 0.404212, 2.375228, 1, 0, 0.07843138, 1,
2.415547, 0.8926069, 1.523323, 1, 0, 0.07058824, 1,
2.457195, 1.428303, 1.362295, 1, 0, 0.06666667, 1,
2.470995, 1.066954, 1.593074, 1, 0, 0.05882353, 1,
2.471552, -2.375213, 2.119055, 1, 0, 0.05490196, 1,
2.537745, -0.9239503, 2.058698, 1, 0, 0.04705882, 1,
2.568458, -0.5794125, 1.237049, 1, 0, 0.04313726, 1,
2.591185, -0.5312712, -0.1735169, 1, 0, 0.03529412, 1,
2.6448, 0.0346408, 0.0003572605, 1, 0, 0.03137255, 1,
2.653366, 0.6297716, 0.3777548, 1, 0, 0.02352941, 1,
2.882357, -0.08163515, 1.860539, 1, 0, 0.01960784, 1,
3.276148, 1.216664, 0.4316981, 1, 0, 0.01176471, 1,
3.491752, -0.680576, 2.288091, 1, 0, 0.007843138, 1
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
0.2679974, -4.129868, -6.295181, 0, -0.5, 0.5, 0.5,
0.2679974, -4.129868, -6.295181, 1, -0.5, 0.5, 0.5,
0.2679974, -4.129868, -6.295181, 1, 1.5, 0.5, 0.5,
0.2679974, -4.129868, -6.295181, 0, 1.5, 0.5, 0.5
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
-4.04861, 0.03478372, -6.295181, 0, -0.5, 0.5, 0.5,
-4.04861, 0.03478372, -6.295181, 1, -0.5, 0.5, 0.5,
-4.04861, 0.03478372, -6.295181, 1, 1.5, 0.5, 0.5,
-4.04861, 0.03478372, -6.295181, 0, 1.5, 0.5, 0.5
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
-4.04861, -4.129868, 0.340621, 0, -0.5, 0.5, 0.5,
-4.04861, -4.129868, 0.340621, 1, -0.5, 0.5, 0.5,
-4.04861, -4.129868, 0.340621, 1, 1.5, 0.5, 0.5,
-4.04861, -4.129868, 0.340621, 0, 1.5, 0.5, 0.5
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
-2, -3.168794, -4.763842,
3, -3.168794, -4.763842,
-2, -3.168794, -4.763842,
-2, -3.328973, -5.019065,
-1, -3.168794, -4.763842,
-1, -3.328973, -5.019065,
0, -3.168794, -4.763842,
0, -3.328973, -5.019065,
1, -3.168794, -4.763842,
1, -3.328973, -5.019065,
2, -3.168794, -4.763842,
2, -3.328973, -5.019065,
3, -3.168794, -4.763842,
3, -3.328973, -5.019065
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
-2, -3.649331, -5.529511, 0, -0.5, 0.5, 0.5,
-2, -3.649331, -5.529511, 1, -0.5, 0.5, 0.5,
-2, -3.649331, -5.529511, 1, 1.5, 0.5, 0.5,
-2, -3.649331, -5.529511, 0, 1.5, 0.5, 0.5,
-1, -3.649331, -5.529511, 0, -0.5, 0.5, 0.5,
-1, -3.649331, -5.529511, 1, -0.5, 0.5, 0.5,
-1, -3.649331, -5.529511, 1, 1.5, 0.5, 0.5,
-1, -3.649331, -5.529511, 0, 1.5, 0.5, 0.5,
0, -3.649331, -5.529511, 0, -0.5, 0.5, 0.5,
0, -3.649331, -5.529511, 1, -0.5, 0.5, 0.5,
0, -3.649331, -5.529511, 1, 1.5, 0.5, 0.5,
0, -3.649331, -5.529511, 0, 1.5, 0.5, 0.5,
1, -3.649331, -5.529511, 0, -0.5, 0.5, 0.5,
1, -3.649331, -5.529511, 1, -0.5, 0.5, 0.5,
1, -3.649331, -5.529511, 1, 1.5, 0.5, 0.5,
1, -3.649331, -5.529511, 0, 1.5, 0.5, 0.5,
2, -3.649331, -5.529511, 0, -0.5, 0.5, 0.5,
2, -3.649331, -5.529511, 1, -0.5, 0.5, 0.5,
2, -3.649331, -5.529511, 1, 1.5, 0.5, 0.5,
2, -3.649331, -5.529511, 0, 1.5, 0.5, 0.5,
3, -3.649331, -5.529511, 0, -0.5, 0.5, 0.5,
3, -3.649331, -5.529511, 1, -0.5, 0.5, 0.5,
3, -3.649331, -5.529511, 1, 1.5, 0.5, 0.5,
3, -3.649331, -5.529511, 0, 1.5, 0.5, 0.5
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
-3.052469, -3, -4.763842,
-3.052469, 3, -4.763842,
-3.052469, -3, -4.763842,
-3.218493, -3, -5.019065,
-3.052469, -2, -4.763842,
-3.218493, -2, -5.019065,
-3.052469, -1, -4.763842,
-3.218493, -1, -5.019065,
-3.052469, 0, -4.763842,
-3.218493, 0, -5.019065,
-3.052469, 1, -4.763842,
-3.218493, 1, -5.019065,
-3.052469, 2, -4.763842,
-3.218493, 2, -5.019065,
-3.052469, 3, -4.763842,
-3.218493, 3, -5.019065
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
-3.550539, -3, -5.529511, 0, -0.5, 0.5, 0.5,
-3.550539, -3, -5.529511, 1, -0.5, 0.5, 0.5,
-3.550539, -3, -5.529511, 1, 1.5, 0.5, 0.5,
-3.550539, -3, -5.529511, 0, 1.5, 0.5, 0.5,
-3.550539, -2, -5.529511, 0, -0.5, 0.5, 0.5,
-3.550539, -2, -5.529511, 1, -0.5, 0.5, 0.5,
-3.550539, -2, -5.529511, 1, 1.5, 0.5, 0.5,
-3.550539, -2, -5.529511, 0, 1.5, 0.5, 0.5,
-3.550539, -1, -5.529511, 0, -0.5, 0.5, 0.5,
-3.550539, -1, -5.529511, 1, -0.5, 0.5, 0.5,
-3.550539, -1, -5.529511, 1, 1.5, 0.5, 0.5,
-3.550539, -1, -5.529511, 0, 1.5, 0.5, 0.5,
-3.550539, 0, -5.529511, 0, -0.5, 0.5, 0.5,
-3.550539, 0, -5.529511, 1, -0.5, 0.5, 0.5,
-3.550539, 0, -5.529511, 1, 1.5, 0.5, 0.5,
-3.550539, 0, -5.529511, 0, 1.5, 0.5, 0.5,
-3.550539, 1, -5.529511, 0, -0.5, 0.5, 0.5,
-3.550539, 1, -5.529511, 1, -0.5, 0.5, 0.5,
-3.550539, 1, -5.529511, 1, 1.5, 0.5, 0.5,
-3.550539, 1, -5.529511, 0, 1.5, 0.5, 0.5,
-3.550539, 2, -5.529511, 0, -0.5, 0.5, 0.5,
-3.550539, 2, -5.529511, 1, -0.5, 0.5, 0.5,
-3.550539, 2, -5.529511, 1, 1.5, 0.5, 0.5,
-3.550539, 2, -5.529511, 0, 1.5, 0.5, 0.5,
-3.550539, 3, -5.529511, 0, -0.5, 0.5, 0.5,
-3.550539, 3, -5.529511, 1, -0.5, 0.5, 0.5,
-3.550539, 3, -5.529511, 1, 1.5, 0.5, 0.5,
-3.550539, 3, -5.529511, 0, 1.5, 0.5, 0.5
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
-3.052469, -3.168794, -4,
-3.052469, -3.168794, 4,
-3.052469, -3.168794, -4,
-3.218493, -3.328973, -4,
-3.052469, -3.168794, -2,
-3.218493, -3.328973, -2,
-3.052469, -3.168794, 0,
-3.218493, -3.328973, 0,
-3.052469, -3.168794, 2,
-3.218493, -3.328973, 2,
-3.052469, -3.168794, 4,
-3.218493, -3.328973, 4
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
-3.550539, -3.649331, -4, 0, -0.5, 0.5, 0.5,
-3.550539, -3.649331, -4, 1, -0.5, 0.5, 0.5,
-3.550539, -3.649331, -4, 1, 1.5, 0.5, 0.5,
-3.550539, -3.649331, -4, 0, 1.5, 0.5, 0.5,
-3.550539, -3.649331, -2, 0, -0.5, 0.5, 0.5,
-3.550539, -3.649331, -2, 1, -0.5, 0.5, 0.5,
-3.550539, -3.649331, -2, 1, 1.5, 0.5, 0.5,
-3.550539, -3.649331, -2, 0, 1.5, 0.5, 0.5,
-3.550539, -3.649331, 0, 0, -0.5, 0.5, 0.5,
-3.550539, -3.649331, 0, 1, -0.5, 0.5, 0.5,
-3.550539, -3.649331, 0, 1, 1.5, 0.5, 0.5,
-3.550539, -3.649331, 0, 0, 1.5, 0.5, 0.5,
-3.550539, -3.649331, 2, 0, -0.5, 0.5, 0.5,
-3.550539, -3.649331, 2, 1, -0.5, 0.5, 0.5,
-3.550539, -3.649331, 2, 1, 1.5, 0.5, 0.5,
-3.550539, -3.649331, 2, 0, 1.5, 0.5, 0.5,
-3.550539, -3.649331, 4, 0, -0.5, 0.5, 0.5,
-3.550539, -3.649331, 4, 1, -0.5, 0.5, 0.5,
-3.550539, -3.649331, 4, 1, 1.5, 0.5, 0.5,
-3.550539, -3.649331, 4, 0, 1.5, 0.5, 0.5
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
-3.052469, -3.168794, -4.763842,
-3.052469, 3.238362, -4.763842,
-3.052469, -3.168794, 5.445084,
-3.052469, 3.238362, 5.445084,
-3.052469, -3.168794, -4.763842,
-3.052469, -3.168794, 5.445084,
-3.052469, 3.238362, -4.763842,
-3.052469, 3.238362, 5.445084,
-3.052469, -3.168794, -4.763842,
3.588464, -3.168794, -4.763842,
-3.052469, -3.168794, 5.445084,
3.588464, -3.168794, 5.445084,
-3.052469, 3.238362, -4.763842,
3.588464, 3.238362, -4.763842,
-3.052469, 3.238362, 5.445084,
3.588464, 3.238362, 5.445084,
3.588464, -3.168794, -4.763842,
3.588464, 3.238362, -4.763842,
3.588464, -3.168794, 5.445084,
3.588464, 3.238362, 5.445084,
3.588464, -3.168794, -4.763842,
3.588464, -3.168794, 5.445084,
3.588464, 3.238362, -4.763842,
3.588464, 3.238362, 5.445084
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
var radius = 7.348314;
var distance = 32.69348;
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
mvMatrix.translate( -0.2679974, -0.03478372, -0.340621 );
mvMatrix.scale( 1.196389, 1.240042, 0.7782544 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.69348);
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
methylcyclopropaneca<-read.table("methylcyclopropaneca.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methylcyclopropaneca$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylcyclopropaneca' not found
```

```r
y<-methylcyclopropaneca$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylcyclopropaneca' not found
```

```r
z<-methylcyclopropaneca$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylcyclopropaneca' not found
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
-2.955757, -0.4353453, -1.552912, 0, 0, 1, 1, 1,
-2.831168, -0.3465149, -1.971592, 1, 0, 0, 1, 1,
-2.781649, -1.106561, -2.948928, 1, 0, 0, 1, 1,
-2.724627, 0.3413435, -1.030818, 1, 0, 0, 1, 1,
-2.642975, -2.397363, -2.389933, 1, 0, 0, 1, 1,
-2.574077, 0.4045115, -1.754717, 1, 0, 0, 1, 1,
-2.400169, -0.0353613, -0.6091147, 0, 0, 0, 1, 1,
-2.346561, 0.07502189, -1.393049, 0, 0, 0, 1, 1,
-2.326365, 0.4611617, -1.171561, 0, 0, 0, 1, 1,
-2.320945, 1.372912, -0.5029541, 0, 0, 0, 1, 1,
-2.318937, -0.3641927, -2.43643, 0, 0, 0, 1, 1,
-2.272132, -2.7734, -1.913318, 0, 0, 0, 1, 1,
-2.271549, -0.853351, -1.155394, 0, 0, 0, 1, 1,
-2.249529, 0.4187494, -2.067453, 1, 1, 1, 1, 1,
-2.185035, -0.1862987, -1.46732, 1, 1, 1, 1, 1,
-2.179778, 0.01483283, -2.250588, 1, 1, 1, 1, 1,
-2.162916, -0.0274859, -3.419254, 1, 1, 1, 1, 1,
-2.153171, 0.9326333, -0.6553276, 1, 1, 1, 1, 1,
-2.113798, 1.070227, -0.08061138, 1, 1, 1, 1, 1,
-2.1032, 0.3137368, -0.6385784, 1, 1, 1, 1, 1,
-2.081415, 0.6097489, -2.058522, 1, 1, 1, 1, 1,
-2.038542, 0.1537098, -1.539408, 1, 1, 1, 1, 1,
-2.030518, 0.7020398, -1.661775, 1, 1, 1, 1, 1,
-2.003469, 0.218005, -0.9465684, 1, 1, 1, 1, 1,
-1.98745, 0.2651013, -1.766576, 1, 1, 1, 1, 1,
-1.985478, -0.4365588, -3.6115, 1, 1, 1, 1, 1,
-1.974355, 0.7821714, -1.548011, 1, 1, 1, 1, 1,
-1.904812, -2.824649, -2.904941, 1, 1, 1, 1, 1,
-1.898794, -1.077772, -2.184532, 0, 0, 1, 1, 1,
-1.868459, -1.870959, -2.868342, 1, 0, 0, 1, 1,
-1.863601, -0.6701995, -1.980317, 1, 0, 0, 1, 1,
-1.823301, -0.3371311, -0.5101092, 1, 0, 0, 1, 1,
-1.79583, -0.3532648, -2.427849, 1, 0, 0, 1, 1,
-1.783641, 0.1789461, -1.165723, 1, 0, 0, 1, 1,
-1.777822, 0.1384116, -2.700124, 0, 0, 0, 1, 1,
-1.774924, 0.02949107, -3.605076, 0, 0, 0, 1, 1,
-1.77307, -0.5024039, -3.183627, 0, 0, 0, 1, 1,
-1.758531, 0.6257882, -1.200484, 0, 0, 0, 1, 1,
-1.74666, -0.3367486, -2.584151, 0, 0, 0, 1, 1,
-1.743613, -0.1887975, -2.389193, 0, 0, 0, 1, 1,
-1.738711, -0.8580418, -1.673156, 0, 0, 0, 1, 1,
-1.736375, -0.6729295, -2.6098, 1, 1, 1, 1, 1,
-1.734603, 0.9711516, -1.879638, 1, 1, 1, 1, 1,
-1.731924, 0.1369498, -1.277687, 1, 1, 1, 1, 1,
-1.7058, 1.523129, -0.363811, 1, 1, 1, 1, 1,
-1.704222, 1.566781, 0.9669753, 1, 1, 1, 1, 1,
-1.701532, -1.326365, -1.321932, 1, 1, 1, 1, 1,
-1.700696, 2.386517, -0.1689884, 1, 1, 1, 1, 1,
-1.686375, 1.700354, -2.708717, 1, 1, 1, 1, 1,
-1.671031, 2.00018, -1.241948, 1, 1, 1, 1, 1,
-1.665855, -0.2423512, -2.563274, 1, 1, 1, 1, 1,
-1.661794, -1.286553, -2.283974, 1, 1, 1, 1, 1,
-1.649711, -0.7410945, 0.9042827, 1, 1, 1, 1, 1,
-1.649592, -0.3866976, -2.493492, 1, 1, 1, 1, 1,
-1.617845, -0.6122168, -1.347653, 1, 1, 1, 1, 1,
-1.615835, 0.3267379, -0.8965747, 1, 1, 1, 1, 1,
-1.591712, -1.109076, -2.048633, 0, 0, 1, 1, 1,
-1.58744, -0.1216499, -2.710359, 1, 0, 0, 1, 1,
-1.582902, 1.181936, 0.5529976, 1, 0, 0, 1, 1,
-1.575024, 1.957596, -0.5986705, 1, 0, 0, 1, 1,
-1.574716, -0.04761881, -1.873363, 1, 0, 0, 1, 1,
-1.559921, 0.3965302, -3.010208, 1, 0, 0, 1, 1,
-1.557664, 0.9943853, -1.420804, 0, 0, 0, 1, 1,
-1.539526, -0.04762434, 0.008248231, 0, 0, 0, 1, 1,
-1.51165, -2.042633, -4.060017, 0, 0, 0, 1, 1,
-1.509921, -1.692001, -1.939988, 0, 0, 0, 1, 1,
-1.505945, -1.204682, -3.316987, 0, 0, 0, 1, 1,
-1.498269, 1.319509, 0.1426653, 0, 0, 0, 1, 1,
-1.477832, -1.181016, -2.02682, 0, 0, 0, 1, 1,
-1.469951, -0.2243192, -2.14198, 1, 1, 1, 1, 1,
-1.463481, -0.7449952, -2.369743, 1, 1, 1, 1, 1,
-1.447376, -0.1305275, 0.8391517, 1, 1, 1, 1, 1,
-1.445466, -2.009162, -2.94585, 1, 1, 1, 1, 1,
-1.426489, -1.90519, -1.869621, 1, 1, 1, 1, 1,
-1.423861, -0.4135739, -0.613877, 1, 1, 1, 1, 1,
-1.412697, 1.074641, -1.509367, 1, 1, 1, 1, 1,
-1.405802, -1.031649, -2.432162, 1, 1, 1, 1, 1,
-1.402107, 0.2230883, 0.6066389, 1, 1, 1, 1, 1,
-1.398095, 1.605273, -0.5461829, 1, 1, 1, 1, 1,
-1.378075, -0.1728733, -2.780868, 1, 1, 1, 1, 1,
-1.37373, 0.01122648, -1.877492, 1, 1, 1, 1, 1,
-1.369259, -0.04873881, -1.099062, 1, 1, 1, 1, 1,
-1.368489, 0.1166544, -0.372387, 1, 1, 1, 1, 1,
-1.366502, -0.0986829, -1.803251, 1, 1, 1, 1, 1,
-1.356902, -1.483054, -1.500391, 0, 0, 1, 1, 1,
-1.355976, -0.04972095, -2.45098, 1, 0, 0, 1, 1,
-1.350176, 0.6703431, -2.471502, 1, 0, 0, 1, 1,
-1.347838, 1.430569, -0.6996605, 1, 0, 0, 1, 1,
-1.326713, -0.9085107, -2.731259, 1, 0, 0, 1, 1,
-1.322996, 0.1023149, -4.146827, 1, 0, 0, 1, 1,
-1.316091, 1.607641, 0.2424467, 0, 0, 0, 1, 1,
-1.300514, 0.1343261, -1.703095, 0, 0, 0, 1, 1,
-1.298464, -0.4572978, -3.351009, 0, 0, 0, 1, 1,
-1.297677, 1.159943, 1.324931, 0, 0, 0, 1, 1,
-1.291794, -0.4645116, -3.213175, 0, 0, 0, 1, 1,
-1.290066, 0.07865324, -0.9756198, 0, 0, 0, 1, 1,
-1.289998, -0.3360519, -1.287385, 0, 0, 0, 1, 1,
-1.282961, -0.08494545, -1.045978, 1, 1, 1, 1, 1,
-1.281583, -1.011576, -1.530525, 1, 1, 1, 1, 1,
-1.26336, -0.09673581, -0.7971185, 1, 1, 1, 1, 1,
-1.257563, 0.4906668, -0.5238293, 1, 1, 1, 1, 1,
-1.254021, 0.6662342, -2.912392, 1, 1, 1, 1, 1,
-1.252962, -0.20053, -2.047241, 1, 1, 1, 1, 1,
-1.252628, -1.111142, -3.077009, 1, 1, 1, 1, 1,
-1.252594, -0.2290544, -2.323762, 1, 1, 1, 1, 1,
-1.249459, 0.1044544, 0.233293, 1, 1, 1, 1, 1,
-1.243286, -0.3896864, -1.60453, 1, 1, 1, 1, 1,
-1.241592, -0.1397548, -0.3907642, 1, 1, 1, 1, 1,
-1.236748, -1.046612, -1.502187, 1, 1, 1, 1, 1,
-1.229996, -1.269803, -1.125168, 1, 1, 1, 1, 1,
-1.226454, 0.756615, -1.536828, 1, 1, 1, 1, 1,
-1.225487, -0.8935043, -1.368851, 1, 1, 1, 1, 1,
-1.220743, 1.178878, -1.185408, 0, 0, 1, 1, 1,
-1.215252, -0.5027703, -2.270988, 1, 0, 0, 1, 1,
-1.207063, -0.6107838, -1.0576, 1, 0, 0, 1, 1,
-1.206603, 1.319811, -0.3722291, 1, 0, 0, 1, 1,
-1.205815, -0.8411129, -2.73683, 1, 0, 0, 1, 1,
-1.20572, 0.1183271, -3.241386, 1, 0, 0, 1, 1,
-1.202796, 1.215293, -1.697886, 0, 0, 0, 1, 1,
-1.195137, 0.227677, -1.405537, 0, 0, 0, 1, 1,
-1.190513, 1.815605, 0.1050603, 0, 0, 0, 1, 1,
-1.183954, 1.74581, -1.498843, 0, 0, 0, 1, 1,
-1.18141, 0.07568187, -2.514005, 0, 0, 0, 1, 1,
-1.174674, 0.2297706, -0.02151271, 0, 0, 0, 1, 1,
-1.170718, 0.7828558, -1.505154, 0, 0, 0, 1, 1,
-1.169757, 0.4252938, -1.819553, 1, 1, 1, 1, 1,
-1.166701, -2.300542, -4.189994, 1, 1, 1, 1, 1,
-1.166046, 0.1240731, -3.581324, 1, 1, 1, 1, 1,
-1.165825, 0.6780311, 0.6301358, 1, 1, 1, 1, 1,
-1.162373, 0.314703, -1.08063, 1, 1, 1, 1, 1,
-1.152533, 0.4882405, 0.09102191, 1, 1, 1, 1, 1,
-1.14365, -0.006415202, -0.500396, 1, 1, 1, 1, 1,
-1.137895, 0.3013091, -0.3733343, 1, 1, 1, 1, 1,
-1.137849, 0.993674, -1.502313, 1, 1, 1, 1, 1,
-1.137648, -0.9046518, -1.30349, 1, 1, 1, 1, 1,
-1.136591, -0.2411675, -2.293087, 1, 1, 1, 1, 1,
-1.134299, -0.4677342, -1.466483, 1, 1, 1, 1, 1,
-1.130748, -0.5178714, -2.637405, 1, 1, 1, 1, 1,
-1.12645, 2.080346, -0.2610919, 1, 1, 1, 1, 1,
-1.120189, 0.8424846, -2.3445, 1, 1, 1, 1, 1,
-1.119099, 0.08269531, -2.4361, 0, 0, 1, 1, 1,
-1.115354, 0.1226555, -0.1646791, 1, 0, 0, 1, 1,
-1.111858, -0.05220132, -0.1022604, 1, 0, 0, 1, 1,
-1.111615, 0.02898834, -0.02266883, 1, 0, 0, 1, 1,
-1.110877, 0.2589283, -0.7302606, 1, 0, 0, 1, 1,
-1.100049, -0.4976983, -1.285803, 1, 0, 0, 1, 1,
-1.097564, 0.5475028, -0.7669399, 0, 0, 0, 1, 1,
-1.093533, -0.5306657, -3.015728, 0, 0, 0, 1, 1,
-1.069611, -0.3406484, -2.406852, 0, 0, 0, 1, 1,
-1.064914, 0.5285877, -0.4976959, 0, 0, 0, 1, 1,
-1.058919, -0.04512482, -2.728611, 0, 0, 0, 1, 1,
-1.048227, 0.2151342, -0.3162265, 0, 0, 0, 1, 1,
-1.041146, 0.3292125, -1.358785, 0, 0, 0, 1, 1,
-1.041062, 0.02635175, -2.249442, 1, 1, 1, 1, 1,
-1.033612, -0.5053355, -2.483349, 1, 1, 1, 1, 1,
-1.031277, -0.7214437, -4.515715, 1, 1, 1, 1, 1,
-1.02878, -0.6128074, -2.868806, 1, 1, 1, 1, 1,
-1.027695, 0.1766217, -0.8590899, 1, 1, 1, 1, 1,
-1.022975, 1.469486, -1.15362, 1, 1, 1, 1, 1,
-1.006307, 0.5319859, -0.7662609, 1, 1, 1, 1, 1,
-1.002506, -0.2826573, -3.254109, 1, 1, 1, 1, 1,
-1.002441, 1.51089, -1.254155, 1, 1, 1, 1, 1,
-1.000637, 2.018946, 1.789475, 1, 1, 1, 1, 1,
-0.9994632, -0.577606, -1.437911, 1, 1, 1, 1, 1,
-0.9988716, 0.7660641, -1.546098, 1, 1, 1, 1, 1,
-0.9966089, -0.9221952, -2.366109, 1, 1, 1, 1, 1,
-0.9887314, 0.1146462, -1.517513, 1, 1, 1, 1, 1,
-0.9839776, 0.7340596, -1.571169, 1, 1, 1, 1, 1,
-0.9834709, -1.036258, -1.592047, 0, 0, 1, 1, 1,
-0.9820002, -0.4390062, -4.604943, 1, 0, 0, 1, 1,
-0.9801672, -0.596693, -2.285348, 1, 0, 0, 1, 1,
-0.9720211, -0.4815735, -1.931818, 1, 0, 0, 1, 1,
-0.9690507, -0.1105236, -1.02234, 1, 0, 0, 1, 1,
-0.9686584, 0.4577919, -1.231419, 1, 0, 0, 1, 1,
-0.9590374, -0.9030566, -1.992863, 0, 0, 0, 1, 1,
-0.9579108, 0.306347, -0.5753918, 0, 0, 0, 1, 1,
-0.9537982, 0.5869663, -1.623609, 0, 0, 0, 1, 1,
-0.9528944, -0.6465725, -3.346713, 0, 0, 0, 1, 1,
-0.9521363, 0.9936239, -0.2886699, 0, 0, 0, 1, 1,
-0.9383942, 1.091403, -2.127071, 0, 0, 0, 1, 1,
-0.9314108, -1.066996, -2.96192, 0, 0, 0, 1, 1,
-0.9298749, -0.5451136, -2.777823, 1, 1, 1, 1, 1,
-0.9224715, 0.6576284, -0.7794942, 1, 1, 1, 1, 1,
-0.9221905, -0.990064, -3.147827, 1, 1, 1, 1, 1,
-0.9191946, 0.4632689, -1.337822, 1, 1, 1, 1, 1,
-0.917915, -0.04270364, -1.270926, 1, 1, 1, 1, 1,
-0.9124396, 0.7426735, -0.2426495, 1, 1, 1, 1, 1,
-0.9118289, 0.3376181, 0.3110422, 1, 1, 1, 1, 1,
-0.9032773, -1.528125, -3.173272, 1, 1, 1, 1, 1,
-0.8988652, -1.188852, -3.794699, 1, 1, 1, 1, 1,
-0.8988401, -0.3365932, -0.552118, 1, 1, 1, 1, 1,
-0.8908653, 0.3210644, 0.7179266, 1, 1, 1, 1, 1,
-0.8876166, -0.4555406, -1.360228, 1, 1, 1, 1, 1,
-0.8804066, -0.28507, -2.413305, 1, 1, 1, 1, 1,
-0.8725032, -0.3704301, -0.5576031, 1, 1, 1, 1, 1,
-0.868112, 1.255397, -0.147765, 1, 1, 1, 1, 1,
-0.8668333, 0.01284639, -1.23072, 0, 0, 1, 1, 1,
-0.865644, -0.6040844, -3.719463, 1, 0, 0, 1, 1,
-0.8597526, 1.151115, -1.029815, 1, 0, 0, 1, 1,
-0.8526242, -0.3810435, -2.455504, 1, 0, 0, 1, 1,
-0.8487006, -0.8582059, -1.579678, 1, 0, 0, 1, 1,
-0.8378189, 0.7184038, 0.5588739, 1, 0, 0, 1, 1,
-0.8333755, 0.1982878, -1.2058, 0, 0, 0, 1, 1,
-0.8329318, 1.89721, -0.02139075, 0, 0, 0, 1, 1,
-0.832592, 0.9331331, 0.4309359, 0, 0, 0, 1, 1,
-0.8293666, -0.4331046, -2.654523, 0, 0, 0, 1, 1,
-0.8284554, 1.353451, -0.6800309, 0, 0, 0, 1, 1,
-0.8256621, 0.05002048, -2.725893, 0, 0, 0, 1, 1,
-0.8256459, -0.6769493, -3.550006, 0, 0, 0, 1, 1,
-0.8208616, 1.239737, -1.816216, 1, 1, 1, 1, 1,
-0.8190468, 0.8762634, 0.2607519, 1, 1, 1, 1, 1,
-0.8180689, -0.2732306, -0.09047095, 1, 1, 1, 1, 1,
-0.8175903, 0.4832783, -3.833568, 1, 1, 1, 1, 1,
-0.8067712, -2.188338, -3.68099, 1, 1, 1, 1, 1,
-0.8053938, 0.6440501, -1.466419, 1, 1, 1, 1, 1,
-0.8028965, 0.9945294, -0.3994169, 1, 1, 1, 1, 1,
-0.7987989, 0.5987105, -0.6386895, 1, 1, 1, 1, 1,
-0.7884985, 0.2720426, -1.534254, 1, 1, 1, 1, 1,
-0.7807971, -0.8939254, -2.589324, 1, 1, 1, 1, 1,
-0.7776166, -0.5539662, -1.694332, 1, 1, 1, 1, 1,
-0.772503, 1.989896, -0.6094158, 1, 1, 1, 1, 1,
-0.7692264, -2.177054, -2.210123, 1, 1, 1, 1, 1,
-0.7645009, -0.7159165, -3.343405, 1, 1, 1, 1, 1,
-0.7618091, 0.2840282, -2.091717, 1, 1, 1, 1, 1,
-0.7607348, 0.3991565, -1.358557, 0, 0, 1, 1, 1,
-0.7584959, -0.8758233, -2.216888, 1, 0, 0, 1, 1,
-0.7584665, -0.2190545, 0.01952194, 1, 0, 0, 1, 1,
-0.7578894, -0.3857982, -2.80461, 1, 0, 0, 1, 1,
-0.7537421, -0.1747068, -1.845688, 1, 0, 0, 1, 1,
-0.7516698, 0.3402987, -1.183536, 1, 0, 0, 1, 1,
-0.7514422, 0.7893764, -1.969182, 0, 0, 0, 1, 1,
-0.7467, 1.391177, -0.3219173, 0, 0, 0, 1, 1,
-0.7430815, -0.902616, -2.376232, 0, 0, 0, 1, 1,
-0.7403144, 0.3517237, -0.7910671, 0, 0, 0, 1, 1,
-0.7397037, -0.8184673, -3.992676, 0, 0, 0, 1, 1,
-0.735157, -0.5988187, -2.514609, 0, 0, 0, 1, 1,
-0.7320859, -0.8347014, -2.292753, 0, 0, 0, 1, 1,
-0.7316329, 0.0898719, -1.913732, 1, 1, 1, 1, 1,
-0.7315792, -0.286893, -1.94283, 1, 1, 1, 1, 1,
-0.7265821, -1.102554, -3.059343, 1, 1, 1, 1, 1,
-0.7255607, 0.2538593, -0.8042581, 1, 1, 1, 1, 1,
-0.7245658, 0.6458486, -0.2853207, 1, 1, 1, 1, 1,
-0.7227066, 1.489743, 0.8662725, 1, 1, 1, 1, 1,
-0.722272, 0.02412921, -0.9664975, 1, 1, 1, 1, 1,
-0.7221375, -0.6440477, -3.654813, 1, 1, 1, 1, 1,
-0.7200682, 0.2768496, -0.7797868, 1, 1, 1, 1, 1,
-0.7185394, 1.567648, -0.7297767, 1, 1, 1, 1, 1,
-0.7177684, -0.2079907, -1.827798, 1, 1, 1, 1, 1,
-0.7091456, 1.375872, -0.5707687, 1, 1, 1, 1, 1,
-0.7008474, -0.2673625, -0.9762787, 1, 1, 1, 1, 1,
-0.7003583, -0.4126862, -1.803726, 1, 1, 1, 1, 1,
-0.6964239, 0.8752048, -2.803764, 1, 1, 1, 1, 1,
-0.695075, -1.322211, -2.179747, 0, 0, 1, 1, 1,
-0.6928655, 0.4379675, -0.571982, 1, 0, 0, 1, 1,
-0.6860504, 1.353428, 0.09751979, 1, 0, 0, 1, 1,
-0.681385, -0.9989047, -1.46427, 1, 0, 0, 1, 1,
-0.666401, -0.04422529, -2.309802, 1, 0, 0, 1, 1,
-0.6610332, -0.9746446, -4.348072, 1, 0, 0, 1, 1,
-0.6602542, 1.464548, 0.4678155, 0, 0, 0, 1, 1,
-0.6567653, 0.2834423, -1.032846, 0, 0, 0, 1, 1,
-0.6536942, -0.1968322, -2.771517, 0, 0, 0, 1, 1,
-0.6487772, -0.919444, -2.871939, 0, 0, 0, 1, 1,
-0.6479571, -1.513415, -0.774387, 0, 0, 0, 1, 1,
-0.6478086, -1.172911, -1.700531, 0, 0, 0, 1, 1,
-0.6476324, -1.090477, -3.111108, 0, 0, 0, 1, 1,
-0.6473364, -2.33076, -3.354291, 1, 1, 1, 1, 1,
-0.6437615, -0.5930641, -1.391343, 1, 1, 1, 1, 1,
-0.6433409, 1.399137, 0.05276322, 1, 1, 1, 1, 1,
-0.6433103, -0.4789017, -3.591412, 1, 1, 1, 1, 1,
-0.6410874, 0.8442752, -2.552971, 1, 1, 1, 1, 1,
-0.6397498, 0.7706925, -2.241113, 1, 1, 1, 1, 1,
-0.6380641, 0.4334598, -0.482108, 1, 1, 1, 1, 1,
-0.636739, 0.6709108, 0.6616638, 1, 1, 1, 1, 1,
-0.6342378, 0.8904417, -2.465306, 1, 1, 1, 1, 1,
-0.6315395, -0.1555943, -0.9582075, 1, 1, 1, 1, 1,
-0.6231539, -0.3187955, -1.598, 1, 1, 1, 1, 1,
-0.6229183, -1.16264, -3.3652, 1, 1, 1, 1, 1,
-0.6226987, -0.08645948, -2.794395, 1, 1, 1, 1, 1,
-0.6196582, 0.2169329, -1.78058, 1, 1, 1, 1, 1,
-0.6175143, -1.20693, -4.519169, 1, 1, 1, 1, 1,
-0.6163697, -1.554023, -3.880573, 0, 0, 1, 1, 1,
-0.6088408, 0.9132321, -0.2576861, 1, 0, 0, 1, 1,
-0.607024, 0.2011728, -1.308408, 1, 0, 0, 1, 1,
-0.606502, 0.6639752, -1.394655, 1, 0, 0, 1, 1,
-0.6054699, -0.6956202, -3.06179, 1, 0, 0, 1, 1,
-0.6052934, -0.4919898, -2.602752, 1, 0, 0, 1, 1,
-0.5967442, -2.110373, -1.414592, 0, 0, 0, 1, 1,
-0.5919774, -0.1896416, -3.351343, 0, 0, 0, 1, 1,
-0.584621, -0.2855233, -1.330329, 0, 0, 0, 1, 1,
-0.5841383, 1.111831, 0.4746216, 0, 0, 0, 1, 1,
-0.5767471, 0.009305922, -0.5306741, 0, 0, 0, 1, 1,
-0.5737334, -0.01966226, -0.5894955, 0, 0, 0, 1, 1,
-0.5709222, 0.1213774, -1.58634, 0, 0, 0, 1, 1,
-0.5687929, -0.3967314, -2.787856, 1, 1, 1, 1, 1,
-0.5676969, 0.5731115, -1.334533, 1, 1, 1, 1, 1,
-0.561493, -1.521889, -2.448374, 1, 1, 1, 1, 1,
-0.5597881, 1.514554, -0.04524948, 1, 1, 1, 1, 1,
-0.5568566, -0.01953921, -1.837115, 1, 1, 1, 1, 1,
-0.556021, 1.386397, -0.8659711, 1, 1, 1, 1, 1,
-0.5557302, 0.5191802, -1.040722, 1, 1, 1, 1, 1,
-0.5522104, -0.3440056, -0.8095998, 1, 1, 1, 1, 1,
-0.5519183, -0.9167719, -1.491738, 1, 1, 1, 1, 1,
-0.5512892, -0.9080611, -1.957354, 1, 1, 1, 1, 1,
-0.5509375, -0.5043252, -3.602662, 1, 1, 1, 1, 1,
-0.5439736, 1.098441, -1.688239, 1, 1, 1, 1, 1,
-0.5321464, -1.187576, -3.378428, 1, 1, 1, 1, 1,
-0.5311359, 0.001867867, -0.5089499, 1, 1, 1, 1, 1,
-0.5282987, 1.078055, -1.108993, 1, 1, 1, 1, 1,
-0.5273969, -1.085477, -1.336784, 0, 0, 1, 1, 1,
-0.5240022, 0.6626344, 0.8820528, 1, 0, 0, 1, 1,
-0.5216766, 1.395991, -2.215905, 1, 0, 0, 1, 1,
-0.5209519, -1.428204, -4.374316, 1, 0, 0, 1, 1,
-0.520239, 0.770376, -1.016214, 1, 0, 0, 1, 1,
-0.5177597, 1.478313, 0.5618499, 1, 0, 0, 1, 1,
-0.5085033, 0.6378869, -0.3453325, 0, 0, 0, 1, 1,
-0.507304, -0.594598, -2.657749, 0, 0, 0, 1, 1,
-0.5037236, 2.089426, -0.1046637, 0, 0, 0, 1, 1,
-0.4961234, -1.056387, -3.604326, 0, 0, 0, 1, 1,
-0.4920366, 0.2082709, -1.649172, 0, 0, 0, 1, 1,
-0.4912331, -0.6994762, -1.948474, 0, 0, 0, 1, 1,
-0.4886313, 0.3454301, -1.073326, 0, 0, 0, 1, 1,
-0.4879137, -1.954151, -1.980804, 1, 1, 1, 1, 1,
-0.4860012, 1.498997, 1.213891, 1, 1, 1, 1, 1,
-0.480252, -0.1827093, -0.8628398, 1, 1, 1, 1, 1,
-0.4728752, -1.984846, -1.756103, 1, 1, 1, 1, 1,
-0.4718588, 0.5256267, -2.096869, 1, 1, 1, 1, 1,
-0.4717507, 0.931198, -1.63382, 1, 1, 1, 1, 1,
-0.468441, 0.8866773, -1.233974, 1, 1, 1, 1, 1,
-0.4666858, -0.692381, -2.879651, 1, 1, 1, 1, 1,
-0.4651707, 0.9052789, -0.3528069, 1, 1, 1, 1, 1,
-0.4597792, -1.023267, -2.193492, 1, 1, 1, 1, 1,
-0.4575913, -1.979315, -4.057026, 1, 1, 1, 1, 1,
-0.4568643, -0.1578036, -0.6723148, 1, 1, 1, 1, 1,
-0.4527247, 0.09312481, -1.977105, 1, 1, 1, 1, 1,
-0.4512951, 1.62183, -2.104677, 1, 1, 1, 1, 1,
-0.4499457, -1.523435, -1.560123, 1, 1, 1, 1, 1,
-0.4469056, 0.9507602, -1.65574, 0, 0, 1, 1, 1,
-0.4467022, 0.3699445, -0.2859993, 1, 0, 0, 1, 1,
-0.4445756, -0.07435358, -3.001516, 1, 0, 0, 1, 1,
-0.4389923, 0.07436313, -2.297947, 1, 0, 0, 1, 1,
-0.4377383, 0.5327545, 0.3914465, 1, 0, 0, 1, 1,
-0.4355805, -0.04992162, 0.5581974, 1, 0, 0, 1, 1,
-0.4328822, 0.6337556, 0.1992937, 0, 0, 0, 1, 1,
-0.432247, 1.347539, -0.2417893, 0, 0, 0, 1, 1,
-0.4293022, 0.6090472, -0.8880398, 0, 0, 0, 1, 1,
-0.4272477, 0.5947396, -0.9027001, 0, 0, 0, 1, 1,
-0.422903, 0.1936071, -0.7815255, 0, 0, 0, 1, 1,
-0.4219694, -0.4195873, -2.531842, 0, 0, 0, 1, 1,
-0.4215655, -1.142612, -3.77615, 0, 0, 0, 1, 1,
-0.4213091, 0.9069426, -0.7539696, 1, 1, 1, 1, 1,
-0.4208228, -0.5212932, -1.085639, 1, 1, 1, 1, 1,
-0.4188288, -2.163305, -1.822657, 1, 1, 1, 1, 1,
-0.4104695, 1.10819, -1.343449, 1, 1, 1, 1, 1,
-0.4098893, -2.392726, -2.923527, 1, 1, 1, 1, 1,
-0.4085281, -0.3558603, -3.572339, 1, 1, 1, 1, 1,
-0.4022759, -1.034124, -2.875124, 1, 1, 1, 1, 1,
-0.4004444, -1.882198, -2.572549, 1, 1, 1, 1, 1,
-0.3965641, 0.1166197, -1.000527, 1, 1, 1, 1, 1,
-0.389407, -1.722266, -3.182106, 1, 1, 1, 1, 1,
-0.3872712, -0.2709446, -2.717841, 1, 1, 1, 1, 1,
-0.3834753, -0.8102153, -2.822422, 1, 1, 1, 1, 1,
-0.3823351, 0.4360564, -1.345585, 1, 1, 1, 1, 1,
-0.3799635, -0.5319005, -3.761978, 1, 1, 1, 1, 1,
-0.3762432, -0.5330986, -3.681104, 1, 1, 1, 1, 1,
-0.3730031, 1.046837, -0.1325944, 0, 0, 1, 1, 1,
-0.3717278, -0.7392459, -3.769202, 1, 0, 0, 1, 1,
-0.3709004, -0.9589346, -2.143255, 1, 0, 0, 1, 1,
-0.3559717, -0.6934397, -1.404397, 1, 0, 0, 1, 1,
-0.3550177, -0.567945, -3.773701, 1, 0, 0, 1, 1,
-0.342796, -0.7844824, -2.865646, 1, 0, 0, 1, 1,
-0.3421117, -1.210985, -3.038296, 0, 0, 0, 1, 1,
-0.3412345, 1.74964, 0.3275563, 0, 0, 0, 1, 1,
-0.3398507, 1.126072, -0.6132568, 0, 0, 0, 1, 1,
-0.3395989, 1.084481, 0.9492344, 0, 0, 0, 1, 1,
-0.3379795, 0.8018111, 0.7977738, 0, 0, 0, 1, 1,
-0.3355604, -0.4430448, 0.3783072, 0, 0, 0, 1, 1,
-0.3332893, 1.096587, 0.03204947, 0, 0, 0, 1, 1,
-0.331267, -0.8758315, -3.250525, 1, 1, 1, 1, 1,
-0.3280921, -1.303703, -3.653035, 1, 1, 1, 1, 1,
-0.3278797, 1.2079, 1.022932, 1, 1, 1, 1, 1,
-0.3260047, -1.189782, -2.320197, 1, 1, 1, 1, 1,
-0.3257131, -0.8491074, -2.636146, 1, 1, 1, 1, 1,
-0.3247688, 0.8645893, -0.5629879, 1, 1, 1, 1, 1,
-0.3202341, -1.125295, -2.931388, 1, 1, 1, 1, 1,
-0.3198881, -0.7000225, -3.809291, 1, 1, 1, 1, 1,
-0.3196096, 0.6219065, -1.816107, 1, 1, 1, 1, 1,
-0.3117289, 1.065842, -1.443204, 1, 1, 1, 1, 1,
-0.3075693, 0.478051, 0.4947223, 1, 1, 1, 1, 1,
-0.2999969, 1.727867, -0.4072192, 1, 1, 1, 1, 1,
-0.2902744, -0.6462189, -3.535899, 1, 1, 1, 1, 1,
-0.2893389, 0.9969263, 0.05623744, 1, 1, 1, 1, 1,
-0.2874208, -0.2897038, -3.020595, 1, 1, 1, 1, 1,
-0.2843062, 0.5546542, 2.108344, 0, 0, 1, 1, 1,
-0.2771874, -0.07485796, -1.368702, 1, 0, 0, 1, 1,
-0.2769014, -1.279866, -2.71382, 1, 0, 0, 1, 1,
-0.2661516, 1.075593, 0.7711076, 1, 0, 0, 1, 1,
-0.2647495, -0.8735898, -3.36047, 1, 0, 0, 1, 1,
-0.2620524, -0.6186666, -1.384788, 1, 0, 0, 1, 1,
-0.2613478, 0.6581426, -0.4862754, 0, 0, 0, 1, 1,
-0.2570928, 2.383291, -1.170432, 0, 0, 0, 1, 1,
-0.2568975, 0.9938046, -2.114571, 0, 0, 0, 1, 1,
-0.2554016, -0.2816691, -3.586368, 0, 0, 0, 1, 1,
-0.2529278, 1.439945, -1.08596, 0, 0, 0, 1, 1,
-0.2527586, 0.2152065, 0.6183134, 0, 0, 0, 1, 1,
-0.2518091, -1.165944, -2.251322, 0, 0, 0, 1, 1,
-0.2500316, 1.065337, 0.4033724, 1, 1, 1, 1, 1,
-0.2478229, -1.1637, -2.494713, 1, 1, 1, 1, 1,
-0.2476904, -0.9576628, -2.582134, 1, 1, 1, 1, 1,
-0.2419944, 1.984719, -1.966383, 1, 1, 1, 1, 1,
-0.2407824, -2.817928, -2.895332, 1, 1, 1, 1, 1,
-0.2400716, 1.332742, -0.2715848, 1, 1, 1, 1, 1,
-0.2382012, 0.4335308, -2.065348, 1, 1, 1, 1, 1,
-0.230392, -0.692743, -3.384151, 1, 1, 1, 1, 1,
-0.2301894, 1.33548, -0.9531043, 1, 1, 1, 1, 1,
-0.2279589, 0.1852413, -0.566474, 1, 1, 1, 1, 1,
-0.2227279, 0.2914652, -1.10793, 1, 1, 1, 1, 1,
-0.2181896, -1.148827, -2.975246, 1, 1, 1, 1, 1,
-0.2157107, -1.669972, -2.622422, 1, 1, 1, 1, 1,
-0.2154448, 0.1361565, -0.4556167, 1, 1, 1, 1, 1,
-0.2129972, 0.4400425, 1.221618, 1, 1, 1, 1, 1,
-0.2109535, -0.2082914, -1.266615, 0, 0, 1, 1, 1,
-0.2060716, 0.9098965, -0.1153676, 1, 0, 0, 1, 1,
-0.2056392, 1.106942, -1.930841, 1, 0, 0, 1, 1,
-0.2038309, 0.4492541, -0.0390509, 1, 0, 0, 1, 1,
-0.2030837, -0.1501704, -2.34066, 1, 0, 0, 1, 1,
-0.2014099, 0.2030687, -2.473704, 1, 0, 0, 1, 1,
-0.1971482, 2.073818, -1.916433, 0, 0, 0, 1, 1,
-0.1956957, -0.3094229, -3.363384, 0, 0, 0, 1, 1,
-0.1951456, -0.828518, -1.126033, 0, 0, 0, 1, 1,
-0.1882267, 0.006750052, -3.012343, 0, 0, 0, 1, 1,
-0.187739, -1.4082, -3.738459, 0, 0, 0, 1, 1,
-0.1823923, -0.45992, -3.224168, 0, 0, 0, 1, 1,
-0.1813137, -0.1643381, -3.005093, 0, 0, 0, 1, 1,
-0.180994, 0.6235608, -0.08719162, 1, 1, 1, 1, 1,
-0.179411, 0.6219711, -0.4415318, 1, 1, 1, 1, 1,
-0.1775585, 1.307626, 0.08618094, 1, 1, 1, 1, 1,
-0.174997, -0.2349913, -1.631978, 1, 1, 1, 1, 1,
-0.1700175, 2.245959, -0.9199423, 1, 1, 1, 1, 1,
-0.1689409, -0.1512351, -2.198522, 1, 1, 1, 1, 1,
-0.1681095, 0.1889514, -0.5122898, 1, 1, 1, 1, 1,
-0.1624905, -0.8703588, -0.7660162, 1, 1, 1, 1, 1,
-0.1616459, -1.26274, -2.365129, 1, 1, 1, 1, 1,
-0.1609413, -1.174524, -3.340479, 1, 1, 1, 1, 1,
-0.160346, -1.504152, -3.844741, 1, 1, 1, 1, 1,
-0.1584621, -0.7927823, -4.021055, 1, 1, 1, 1, 1,
-0.157328, -0.3217113, -3.360769, 1, 1, 1, 1, 1,
-0.156994, -1.012754, -1.896959, 1, 1, 1, 1, 1,
-0.156284, -1.09391, -3.382385, 1, 1, 1, 1, 1,
-0.144141, -0.6604442, -2.122331, 0, 0, 1, 1, 1,
-0.1438988, -1.512049, -1.991892, 1, 0, 0, 1, 1,
-0.1287432, 0.4269027, 0.8162995, 1, 0, 0, 1, 1,
-0.1248993, -0.8485804, -1.630332, 1, 0, 0, 1, 1,
-0.1223991, 1.153342, -1.270129, 1, 0, 0, 1, 1,
-0.1221502, -0.9441598, -1.251065, 1, 0, 0, 1, 1,
-0.1217423, -0.3169423, -0.8901519, 0, 0, 0, 1, 1,
-0.1217306, 1.028385, -1.099485, 0, 0, 0, 1, 1,
-0.1179839, 2.244413, -0.7768367, 0, 0, 0, 1, 1,
-0.1171336, -0.268984, -2.176888, 0, 0, 0, 1, 1,
-0.1143907, -1.729395, -1.028307, 0, 0, 0, 1, 1,
-0.1137126, 0.08369046, -2.577173, 0, 0, 0, 1, 1,
-0.110688, 0.9191539, -0.02844871, 0, 0, 0, 1, 1,
-0.1074058, 1.223557, 0.4313883, 1, 1, 1, 1, 1,
-0.107086, 1.508686, -0.7684765, 1, 1, 1, 1, 1,
-0.1060233, -0.3600679, -1.657264, 1, 1, 1, 1, 1,
-0.1029945, -1.906358, -2.894962, 1, 1, 1, 1, 1,
-0.102117, 1.737772, 0.1852047, 1, 1, 1, 1, 1,
-0.09962867, -0.5685941, -4.506908, 1, 1, 1, 1, 1,
-0.0994549, 0.2755491, -0.8017822, 1, 1, 1, 1, 1,
-0.09913547, -0.9990472, -4.615168, 1, 1, 1, 1, 1,
-0.09612747, -0.4424234, -3.438279, 1, 1, 1, 1, 1,
-0.09067288, 0.004075028, -0.3957558, 1, 1, 1, 1, 1,
-0.08869151, 1.32959, 0.2820661, 1, 1, 1, 1, 1,
-0.08442436, 2.595501, -2.325707, 1, 1, 1, 1, 1,
-0.08217552, 1.274754, -0.0851815, 1, 1, 1, 1, 1,
-0.08172315, 0.6800678, -0.8198983, 1, 1, 1, 1, 1,
-0.08115059, 2.505039, -0.8908343, 1, 1, 1, 1, 1,
-0.07840758, 1.134362, 2.35585, 0, 0, 1, 1, 1,
-0.07788071, -0.8542448, -4.050665, 1, 0, 0, 1, 1,
-0.07445841, 2.05119, -1.19768, 1, 0, 0, 1, 1,
-0.07155228, -0.2424721, -1.800332, 1, 0, 0, 1, 1,
-0.07131492, 1.132185, -1.728243, 1, 0, 0, 1, 1,
-0.06985766, 1.146774, -1.58864, 1, 0, 0, 1, 1,
-0.069252, -3.061164, -2.758458, 0, 0, 0, 1, 1,
-0.0690479, 0.8214467, -1.332987, 0, 0, 0, 1, 1,
-0.06856132, 0.08942765, -1.468634, 0, 0, 0, 1, 1,
-0.06804438, 0.2877536, -0.7544758, 0, 0, 0, 1, 1,
-0.06604905, 0.8225335, 0.0431074, 0, 0, 0, 1, 1,
-0.06505092, 0.3689896, -1.337658, 0, 0, 0, 1, 1,
-0.06414832, 0.1149543, -2.320652, 0, 0, 0, 1, 1,
-0.06372398, 0.1836983, 0.2795359, 1, 1, 1, 1, 1,
-0.06332076, -0.7622116, -3.745195, 1, 1, 1, 1, 1,
-0.06186384, -0.3948308, -3.858258, 1, 1, 1, 1, 1,
-0.05983507, 1.453408, -1.274143, 1, 1, 1, 1, 1,
-0.05298536, -0.3751028, -2.786626, 1, 1, 1, 1, 1,
-0.05253559, 1.12853, -0.5202834, 1, 1, 1, 1, 1,
-0.0516798, 1.534302, 0.01949556, 1, 1, 1, 1, 1,
-0.05028782, -1.881107, -1.975539, 1, 1, 1, 1, 1,
-0.0476218, 0.8631364, -0.2134991, 1, 1, 1, 1, 1,
-0.04676985, -0.3033226, -1.964493, 1, 1, 1, 1, 1,
-0.04646102, -1.015481, -3.113837, 1, 1, 1, 1, 1,
-0.04222628, -0.3293723, -2.508638, 1, 1, 1, 1, 1,
-0.03496443, 0.4609115, -2.02493, 1, 1, 1, 1, 1,
-0.02969661, -0.01503173, -1.993423, 1, 1, 1, 1, 1,
-0.02953939, 0.650467, 0.06083875, 1, 1, 1, 1, 1,
-0.02751418, -1.043005, -4.417932, 0, 0, 1, 1, 1,
-0.02496564, 1.019543, -0.1019454, 1, 0, 0, 1, 1,
-0.02467514, -1.386851, -2.708024, 1, 0, 0, 1, 1,
-0.02426345, 0.09557284, 1.73773, 1, 0, 0, 1, 1,
-0.01188513, 1.024833, -2.443766, 1, 0, 0, 1, 1,
-0.008233839, 1.418975, -0.4580083, 1, 0, 0, 1, 1,
-0.003528968, 0.7645453, 0.5084401, 0, 0, 0, 1, 1,
-0.000338859, 0.06128231, 0.1033502, 0, 0, 0, 1, 1,
0.00548115, 0.6955444, -1.714806, 0, 0, 0, 1, 1,
0.006258141, 1.026874, 1.229167, 0, 0, 0, 1, 1,
0.008726206, 0.3986239, 1.05868, 0, 0, 0, 1, 1,
0.01090805, -0.07977958, 2.730246, 0, 0, 0, 1, 1,
0.01132358, -0.7930081, 4.369777, 0, 0, 0, 1, 1,
0.01249698, -0.8829762, 2.909545, 1, 1, 1, 1, 1,
0.01378037, 0.1826555, 2.523163, 1, 1, 1, 1, 1,
0.01591152, 0.2308262, -1.068283, 1, 1, 1, 1, 1,
0.01827274, -1.002248, 3.295474, 1, 1, 1, 1, 1,
0.01831884, -0.5671498, 3.350674, 1, 1, 1, 1, 1,
0.0185954, -1.626426, 3.32904, 1, 1, 1, 1, 1,
0.02050035, -0.08018338, 1.688753, 1, 1, 1, 1, 1,
0.02480024, 0.2910801, 0.4964803, 1, 1, 1, 1, 1,
0.02815023, 1.070199, -1.013214, 1, 1, 1, 1, 1,
0.0306698, 0.07265322, -0.1468734, 1, 1, 1, 1, 1,
0.03880406, -0.1497151, 4.166755, 1, 1, 1, 1, 1,
0.04227037, 0.1607694, 0.1666586, 1, 1, 1, 1, 1,
0.0424634, -0.779565, 2.655409, 1, 1, 1, 1, 1,
0.04246345, 1.545289, -0.08571988, 1, 1, 1, 1, 1,
0.04474161, -1.232188, 2.215609, 1, 1, 1, 1, 1,
0.0523476, -0.473907, 2.128683, 0, 0, 1, 1, 1,
0.0559093, -0.5091521, 3.070367, 1, 0, 0, 1, 1,
0.06002826, 0.7185364, -0.3866969, 1, 0, 0, 1, 1,
0.06043753, -0.05812059, 2.273436, 1, 0, 0, 1, 1,
0.06459813, -0.8683863, 4.205189, 1, 0, 0, 1, 1,
0.06898525, -0.6071332, 1.550964, 1, 0, 0, 1, 1,
0.07224381, -1.608498, 2.842247, 0, 0, 0, 1, 1,
0.07316223, 0.2080248, 0.3854543, 0, 0, 0, 1, 1,
0.0784535, -0.1609992, 1.600871, 0, 0, 0, 1, 1,
0.08102882, 0.3368592, 0.5826532, 0, 0, 0, 1, 1,
0.0849749, -1.65793, 3.637487, 0, 0, 0, 1, 1,
0.08714196, 0.290182, 0.2895367, 0, 0, 0, 1, 1,
0.0884296, 0.9426672, 0.4747619, 0, 0, 0, 1, 1,
0.08948338, -0.6076893, 3.075434, 1, 1, 1, 1, 1,
0.09297095, -1.135467, 2.961133, 1, 1, 1, 1, 1,
0.09493329, 0.8575216, 0.3078313, 1, 1, 1, 1, 1,
0.09870671, -0.6161525, 2.856912, 1, 1, 1, 1, 1,
0.09951214, 1.400134, -0.8349374, 1, 1, 1, 1, 1,
0.09987423, 0.6404244, -0.4506501, 1, 1, 1, 1, 1,
0.1036881, -0.9680138, 5.29641, 1, 1, 1, 1, 1,
0.1054175, 0.3125041, 1.6946, 1, 1, 1, 1, 1,
0.1059528, 1.025019, -0.8047066, 1, 1, 1, 1, 1,
0.1094555, -0.1825248, 2.72027, 1, 1, 1, 1, 1,
0.1096429, -0.2587505, 1.21069, 1, 1, 1, 1, 1,
0.1099912, 0.9033519, -1.173819, 1, 1, 1, 1, 1,
0.1107026, 0.8529674, 0.7355471, 1, 1, 1, 1, 1,
0.1143651, -0.6679839, 4.252694, 1, 1, 1, 1, 1,
0.115904, -2.353054, 2.006307, 1, 1, 1, 1, 1,
0.1198488, 0.36887, 0.2487304, 0, 0, 1, 1, 1,
0.1216266, -0.9917533, 4.343162, 1, 0, 0, 1, 1,
0.1223546, -0.2719177, 1.801358, 1, 0, 0, 1, 1,
0.131212, 1.001551, 0.9098028, 1, 0, 0, 1, 1,
0.1312306, 0.7514333, -0.8479926, 1, 0, 0, 1, 1,
0.1314485, -0.06602548, 3.345177, 1, 0, 0, 1, 1,
0.1339509, -0.9200746, 4.434172, 0, 0, 0, 1, 1,
0.1359256, 0.4087718, -0.843374, 0, 0, 0, 1, 1,
0.1373308, 0.1072621, 1.564197, 0, 0, 0, 1, 1,
0.1381079, -0.8523056, 3.69423, 0, 0, 0, 1, 1,
0.1385014, 2.207556, -1.36501, 0, 0, 0, 1, 1,
0.1428681, 0.5416936, 0.2024481, 0, 0, 0, 1, 1,
0.14299, -1.730628, 3.319795, 0, 0, 0, 1, 1,
0.1463491, -0.1136031, 0.9162286, 1, 1, 1, 1, 1,
0.150598, 0.4744933, 1.052817, 1, 1, 1, 1, 1,
0.1520782, 0.2009568, 1.37649, 1, 1, 1, 1, 1,
0.1536922, 2.546629, -0.6560294, 1, 1, 1, 1, 1,
0.1543039, 0.8551231, 0.6750827, 1, 1, 1, 1, 1,
0.1568439, 0.2037864, -0.4524599, 1, 1, 1, 1, 1,
0.1589542, -1.037601, 2.850433, 1, 1, 1, 1, 1,
0.1595805, 1.805773, -1.007992, 1, 1, 1, 1, 1,
0.1645691, 0.2656264, 1.81661, 1, 1, 1, 1, 1,
0.1651628, 0.6888846, 0.6514278, 1, 1, 1, 1, 1,
0.165613, -0.4560554, 4.966177, 1, 1, 1, 1, 1,
0.1681045, -0.764892, 2.443243, 1, 1, 1, 1, 1,
0.1697113, 0.6306653, 0.4098392, 1, 1, 1, 1, 1,
0.1727731, -0.843261, 4.470012, 1, 1, 1, 1, 1,
0.1819744, -1.428268, 3.313498, 1, 1, 1, 1, 1,
0.1866468, 0.9262887, -0.0225008, 0, 0, 1, 1, 1,
0.1885063, 0.2856241, 0.9618899, 1, 0, 0, 1, 1,
0.188775, -0.3161523, 4.43303, 1, 0, 0, 1, 1,
0.1908876, 0.2919495, -0.6588086, 1, 0, 0, 1, 1,
0.1908936, 0.2020125, -1.118468, 1, 0, 0, 1, 1,
0.1951657, -0.822069, 3.725985, 1, 0, 0, 1, 1,
0.1981428, 0.901566, -0.9881407, 0, 0, 0, 1, 1,
0.2031129, 0.2660654, 2.313202, 0, 0, 0, 1, 1,
0.2117845, -0.3571914, 1.286125, 0, 0, 0, 1, 1,
0.212662, -0.7897799, 3.269355, 0, 0, 0, 1, 1,
0.2206105, -0.4026918, 2.919, 0, 0, 0, 1, 1,
0.2244433, 0.6997454, 1.63449, 0, 0, 0, 1, 1,
0.2293911, 0.3510142, 1.94279, 0, 0, 0, 1, 1,
0.2295305, -0.3543558, 2.379612, 1, 1, 1, 1, 1,
0.2357934, -0.312077, 3.486937, 1, 1, 1, 1, 1,
0.2358737, -0.648377, 2.828996, 1, 1, 1, 1, 1,
0.2363135, 1.53027, -0.9374298, 1, 1, 1, 1, 1,
0.2434745, 1.391555, 1.098531, 1, 1, 1, 1, 1,
0.2486956, -0.3400086, 1.308357, 1, 1, 1, 1, 1,
0.2488725, 0.6036141, 0.4218954, 1, 1, 1, 1, 1,
0.249502, -1.250165, 3.973428, 1, 1, 1, 1, 1,
0.2520006, -1.120073, 4.128535, 1, 1, 1, 1, 1,
0.2524476, 1.297426, -0.2771072, 1, 1, 1, 1, 1,
0.2531671, -0.156037, 2.843281, 1, 1, 1, 1, 1,
0.2535081, -0.09160755, 2.873271, 1, 1, 1, 1, 1,
0.2535658, 1.100905, -0.1272345, 1, 1, 1, 1, 1,
0.255228, -0.1275923, 2.698099, 1, 1, 1, 1, 1,
0.2601905, 0.1147282, 2.72457, 1, 1, 1, 1, 1,
0.2605793, -0.9530798, 5.222054, 0, 0, 1, 1, 1,
0.2651635, -0.524432, 2.564978, 1, 0, 0, 1, 1,
0.2709858, -0.755662, 3.184289, 1, 0, 0, 1, 1,
0.2731905, -0.4623339, 2.129563, 1, 0, 0, 1, 1,
0.2786618, 0.2982012, 1.659045, 1, 0, 0, 1, 1,
0.2904631, -0.005197367, -0.9040179, 1, 0, 0, 1, 1,
0.2930019, 0.5106419, 1.83591, 0, 0, 0, 1, 1,
0.2941191, 1.865863, -1.255958, 0, 0, 0, 1, 1,
0.2952663, -0.8985696, 1.676021, 0, 0, 0, 1, 1,
0.2962286, 0.737531, 0.170503, 0, 0, 0, 1, 1,
0.2963853, -0.2745793, 2.340413, 0, 0, 0, 1, 1,
0.2990013, -0.3024985, 3.317395, 0, 0, 0, 1, 1,
0.3014577, 0.8908198, 0.2256701, 0, 0, 0, 1, 1,
0.301773, -0.2118544, 1.964855, 1, 1, 1, 1, 1,
0.3018582, -0.2849548, 2.16386, 1, 1, 1, 1, 1,
0.30296, -0.3554282, -0.7661294, 1, 1, 1, 1, 1,
0.3043542, 0.927986, 0.1271229, 1, 1, 1, 1, 1,
0.307114, 0.9789517, 0.1991468, 1, 1, 1, 1, 1,
0.308972, 0.3284532, 1.12725, 1, 1, 1, 1, 1,
0.309027, 0.7562807, -0.3511479, 1, 1, 1, 1, 1,
0.3106907, -1.483496, 2.582779, 1, 1, 1, 1, 1,
0.3116418, 0.2785081, 1.150278, 1, 1, 1, 1, 1,
0.3121593, -0.5792711, 3.754289, 1, 1, 1, 1, 1,
0.3134769, 1.615404, 0.6217457, 1, 1, 1, 1, 1,
0.3149473, -0.461176, 3.334591, 1, 1, 1, 1, 1,
0.3186233, -0.5013453, 5.097576, 1, 1, 1, 1, 1,
0.3209842, 0.5752814, 0.6962169, 1, 1, 1, 1, 1,
0.3209895, -1.138354, 1.536243, 1, 1, 1, 1, 1,
0.3244343, 1.003837, 1.083744, 0, 0, 1, 1, 1,
0.3326123, 0.949468, -0.2658662, 1, 0, 0, 1, 1,
0.3362556, -0.01590658, 1.655872, 1, 0, 0, 1, 1,
0.3419016, 0.7999032, 0.2914184, 1, 0, 0, 1, 1,
0.3466035, 1.633867, -0.6670679, 1, 0, 0, 1, 1,
0.3498453, 0.3063519, 1.654399, 1, 0, 0, 1, 1,
0.3502416, 0.4416689, 0.5136865, 0, 0, 0, 1, 1,
0.3538856, 0.2171682, 0.3889579, 0, 0, 0, 1, 1,
0.3546332, 1.523438, 0.8781099, 0, 0, 0, 1, 1,
0.3555415, -0.2619905, 3.849223, 0, 0, 0, 1, 1,
0.3575936, -0.9282243, 2.536378, 0, 0, 0, 1, 1,
0.3584843, 0.1972974, 0.1210938, 0, 0, 0, 1, 1,
0.3650046, 1.173564, 0.7292708, 0, 0, 0, 1, 1,
0.3685197, 1.127779, -0.08893061, 1, 1, 1, 1, 1,
0.3690312, 0.05781078, 1.830058, 1, 1, 1, 1, 1,
0.3712051, -1.425383, 2.432924, 1, 1, 1, 1, 1,
0.3721708, -1.182305, 3.334569, 1, 1, 1, 1, 1,
0.3732993, 1.346247, -0.4293386, 1, 1, 1, 1, 1,
0.3750195, 1.067034, 1.347363, 1, 1, 1, 1, 1,
0.3803563, 1.463723, -0.05490574, 1, 1, 1, 1, 1,
0.3816331, -0.7704693, 3.196937, 1, 1, 1, 1, 1,
0.3823119, 0.9717206, 1.203768, 1, 1, 1, 1, 1,
0.3856772, -0.4611478, 2.353442, 1, 1, 1, 1, 1,
0.3865085, 0.8170082, -1.16693, 1, 1, 1, 1, 1,
0.3869576, -1.398803, 3.942535, 1, 1, 1, 1, 1,
0.3876528, 0.08700568, 2.872758, 1, 1, 1, 1, 1,
0.3877639, 1.824937, 0.5165321, 1, 1, 1, 1, 1,
0.3977993, 1.263218, -0.7563314, 1, 1, 1, 1, 1,
0.4060068, -0.8800069, 3.732883, 0, 0, 1, 1, 1,
0.4076886, 0.0308374, 1.748486, 1, 0, 0, 1, 1,
0.4085652, -1.213162, 3.124041, 1, 0, 0, 1, 1,
0.4093997, -0.9273139, 3.068396, 1, 0, 0, 1, 1,
0.4165339, -0.9388208, 0.8483009, 1, 0, 0, 1, 1,
0.423712, -0.6660182, 3.103102, 1, 0, 0, 1, 1,
0.4290847, -0.3000391, 0.9548494, 0, 0, 0, 1, 1,
0.4292335, 1.249928, 2.127763, 0, 0, 0, 1, 1,
0.4367287, 1.643963, 0.2181604, 0, 0, 0, 1, 1,
0.4380738, 0.7037284, 0.4451994, 0, 0, 0, 1, 1,
0.4394351, 0.09487806, 0.6657262, 0, 0, 0, 1, 1,
0.4412823, -0.04021742, 2.181152, 0, 0, 0, 1, 1,
0.4418708, 1.032037, 0.2378336, 0, 0, 0, 1, 1,
0.4426729, 0.1332886, 0.8070781, 1, 1, 1, 1, 1,
0.4430083, -0.7293249, 2.415728, 1, 1, 1, 1, 1,
0.4497935, 0.2225678, 3.029398, 1, 1, 1, 1, 1,
0.4499661, 0.3262172, -0.2221074, 1, 1, 1, 1, 1,
0.4539372, 0.221868, 2.33599, 1, 1, 1, 1, 1,
0.4552191, -0.05064118, 1.995584, 1, 1, 1, 1, 1,
0.4607871, 0.4660259, -0.01480621, 1, 1, 1, 1, 1,
0.4679891, -0.6981352, 2.340292, 1, 1, 1, 1, 1,
0.4769358, 0.5363702, 0.2698755, 1, 1, 1, 1, 1,
0.4774572, 1.126593, 0.5653209, 1, 1, 1, 1, 1,
0.4801087, -0.3796628, 3.605226, 1, 1, 1, 1, 1,
0.4842372, 0.4924984, -0.007280684, 1, 1, 1, 1, 1,
0.4847307, 0.4541474, 1.625986, 1, 1, 1, 1, 1,
0.4847652, 0.01893162, 3.067538, 1, 1, 1, 1, 1,
0.485518, 0.1824099, 0.7249333, 1, 1, 1, 1, 1,
0.4856976, 2.756905, -2.08831, 0, 0, 1, 1, 1,
0.4862203, -0.502685, 3.516424, 1, 0, 0, 1, 1,
0.4866723, 0.369805, 0.9014725, 1, 0, 0, 1, 1,
0.4880543, -1.108809, 4.092064, 1, 0, 0, 1, 1,
0.4922765, -0.2045723, -0.2198512, 1, 0, 0, 1, 1,
0.4944199, 2.1731, -0.4255566, 1, 0, 0, 1, 1,
0.5015436, -0.459422, 4.502958, 0, 0, 0, 1, 1,
0.5092891, 0.5583979, -0.01554646, 0, 0, 0, 1, 1,
0.5126766, 0.07254671, 1.307599, 0, 0, 0, 1, 1,
0.5152596, -0.8692281, 3.189274, 0, 0, 0, 1, 1,
0.5197762, -0.507486, 4.047349, 0, 0, 0, 1, 1,
0.5245432, 0.8696164, -0.09039271, 0, 0, 0, 1, 1,
0.526341, -1.391474, 2.367141, 0, 0, 0, 1, 1,
0.527601, 0.4341304, 2.143972, 1, 1, 1, 1, 1,
0.5317388, -0.7955497, 2.444431, 1, 1, 1, 1, 1,
0.5369895, -0.4098634, 2.706857, 1, 1, 1, 1, 1,
0.5404498, -0.4443613, 1.397078, 1, 1, 1, 1, 1,
0.5428848, 0.7489562, 2.301625, 1, 1, 1, 1, 1,
0.5443811, -0.1196617, 2.367833, 1, 1, 1, 1, 1,
0.5517917, 0.5385847, 1.352165, 1, 1, 1, 1, 1,
0.5586656, -0.1463718, 2.437147, 1, 1, 1, 1, 1,
0.5600882, -0.05940312, 0.442091, 1, 1, 1, 1, 1,
0.5618891, 0.6610226, 1.170761, 1, 1, 1, 1, 1,
0.5709751, 0.1107024, 0.3275629, 1, 1, 1, 1, 1,
0.5711716, 0.2538767, -0.16911, 1, 1, 1, 1, 1,
0.5717261, 1.220112, -0.5101199, 1, 1, 1, 1, 1,
0.5718343, -1.069695, 3.282168, 1, 1, 1, 1, 1,
0.581995, -1.14343, 2.414714, 1, 1, 1, 1, 1,
0.5822724, 0.6245362, -1.207398, 0, 0, 1, 1, 1,
0.5837864, 0.1310605, 1.640748, 1, 0, 0, 1, 1,
0.584111, 0.6050692, 1.921797, 1, 0, 0, 1, 1,
0.5905115, 1.13728, 0.2597762, 1, 0, 0, 1, 1,
0.5934159, 0.6748146, 1.448899, 1, 0, 0, 1, 1,
0.5956916, 1.270697, 1.088529, 1, 0, 0, 1, 1,
0.5974455, -0.6016769, 1.76524, 0, 0, 0, 1, 1,
0.6019604, -0.3725406, 1.951226, 0, 0, 0, 1, 1,
0.610613, -0.007135319, 0.5704539, 0, 0, 0, 1, 1,
0.6112177, 1.285602, -0.003547643, 0, 0, 0, 1, 1,
0.6169601, 1.680207, -0.7438511, 0, 0, 0, 1, 1,
0.6180411, -0.2492548, 1.465039, 0, 0, 0, 1, 1,
0.6230425, 0.2243502, 2.180449, 0, 0, 0, 1, 1,
0.6251001, -0.7354985, 2.992871, 1, 1, 1, 1, 1,
0.6288194, 0.5133252, 0.7996584, 1, 1, 1, 1, 1,
0.633552, -0.3675102, 2.159837, 1, 1, 1, 1, 1,
0.6357065, -0.6972669, 1.453269, 1, 1, 1, 1, 1,
0.6417309, 1.004797, 0.2374783, 1, 1, 1, 1, 1,
0.6424516, 0.5021482, -0.04575589, 1, 1, 1, 1, 1,
0.6436917, -0.7894487, 1.907168, 1, 1, 1, 1, 1,
0.6464462, -0.6467052, 1.74457, 1, 1, 1, 1, 1,
0.6491452, -0.1180231, 2.002508, 1, 1, 1, 1, 1,
0.6596595, 1.679588, -0.6433494, 1, 1, 1, 1, 1,
0.6617751, 1.628994, 0.6400604, 1, 1, 1, 1, 1,
0.6676533, -0.8648055, 2.166765, 1, 1, 1, 1, 1,
0.6688779, 2.729166, -0.05014506, 1, 1, 1, 1, 1,
0.6703368, 0.7097846, 1.138583, 1, 1, 1, 1, 1,
0.6775975, -1.174352, 1.322752, 1, 1, 1, 1, 1,
0.678381, 0.4284275, 1.626407, 0, 0, 1, 1, 1,
0.6908563, -0.7928474, 3.850571, 1, 0, 0, 1, 1,
0.6950511, 1.036482, -0.3529425, 1, 0, 0, 1, 1,
0.7016171, -0.3209298, 2.067226, 1, 0, 0, 1, 1,
0.704796, 1.391937, -0.01724338, 1, 0, 0, 1, 1,
0.7060769, -0.2425211, 0.6513858, 1, 0, 0, 1, 1,
0.7156983, -0.1927271, 2.374162, 0, 0, 0, 1, 1,
0.7164282, -0.3761126, 1.399576, 0, 0, 0, 1, 1,
0.7166134, 1.999921, -1.917703, 0, 0, 0, 1, 1,
0.7184664, -0.03097158, 2.178138, 0, 0, 0, 1, 1,
0.7258989, 0.8070033, 0.2589004, 0, 0, 0, 1, 1,
0.7280506, -0.4627921, 3.924675, 0, 0, 0, 1, 1,
0.7284314, -0.8618847, 3.46468, 0, 0, 0, 1, 1,
0.733379, 0.6296124, 1.406699, 1, 1, 1, 1, 1,
0.7355149, -0.6305132, 0.1316788, 1, 1, 1, 1, 1,
0.7466025, -0.6908659, 2.06528, 1, 1, 1, 1, 1,
0.7479838, -0.04394946, 2.469826, 1, 1, 1, 1, 1,
0.7494454, -0.8022747, 1.544009, 1, 1, 1, 1, 1,
0.7496951, -1.239343, 3.527942, 1, 1, 1, 1, 1,
0.751129, -0.8091307, 3.025421, 1, 1, 1, 1, 1,
0.752633, -0.05898092, 1.224024, 1, 1, 1, 1, 1,
0.7548169, -1.243448, 4.573399, 1, 1, 1, 1, 1,
0.7573167, 0.3771756, 1.755192, 1, 1, 1, 1, 1,
0.7608021, 0.6276984, 0.2090919, 1, 1, 1, 1, 1,
0.7632303, -0.9195796, 1.127163, 1, 1, 1, 1, 1,
0.7643188, -1.929572, 3.934337, 1, 1, 1, 1, 1,
0.7647772, -0.6049025, 3.158695, 1, 1, 1, 1, 1,
0.766288, -0.6906795, 0.5560234, 1, 1, 1, 1, 1,
0.767695, 0.4995149, 0.5072029, 0, 0, 1, 1, 1,
0.7745362, -1.06499, 2.249146, 1, 0, 0, 1, 1,
0.7807066, 0.2135816, 1.162471, 1, 0, 0, 1, 1,
0.7826658, -1.531727, 3.16971, 1, 0, 0, 1, 1,
0.7832655, 0.04658396, 0.9937742, 1, 0, 0, 1, 1,
0.786018, -1.267004, 3.331526, 1, 0, 0, 1, 1,
0.7876591, -1.486125, 1.671869, 0, 0, 0, 1, 1,
0.78955, -1.256748, 3.889184, 0, 0, 0, 1, 1,
0.7946349, -0.06458558, 2.566512, 0, 0, 0, 1, 1,
0.7952366, -0.005897699, 1.005533, 0, 0, 0, 1, 1,
0.8054727, -0.6936054, 1.965377, 0, 0, 0, 1, 1,
0.8107851, 0.3278418, 1.910171, 0, 0, 0, 1, 1,
0.8144361, -0.09053469, 1.037915, 0, 0, 0, 1, 1,
0.8167131, 0.1871707, 0.5810215, 1, 1, 1, 1, 1,
0.8188981, 1.980414, 2.177359, 1, 1, 1, 1, 1,
0.8210949, 0.08384721, 0.2887672, 1, 1, 1, 1, 1,
0.821835, 0.06987581, 2.139845, 1, 1, 1, 1, 1,
0.8260031, -0.9607686, 3.41509, 1, 1, 1, 1, 1,
0.8270834, 0.05406462, 1.41596, 1, 1, 1, 1, 1,
0.8344911, -1.854447, 2.289757, 1, 1, 1, 1, 1,
0.8372591, 1.411635, 2.003483, 1, 1, 1, 1, 1,
0.8384466, 1.627135, 2.228308, 1, 1, 1, 1, 1,
0.8420348, -1.153526, 3.128116, 1, 1, 1, 1, 1,
0.8428395, -1.278098, 1.42987, 1, 1, 1, 1, 1,
0.8443667, 0.03275513, 1.486059, 1, 1, 1, 1, 1,
0.8533702, -0.2347434, 0.2237837, 1, 1, 1, 1, 1,
0.8567046, 2.513247, -0.3077933, 1, 1, 1, 1, 1,
0.8642343, 0.5663671, 1.32937, 1, 1, 1, 1, 1,
0.8650434, 0.9127597, 1.070738, 0, 0, 1, 1, 1,
0.8719066, 0.05237968, 0.8522891, 1, 0, 0, 1, 1,
0.8754773, 1.309624, 2.265844, 1, 0, 0, 1, 1,
0.8805529, -0.2495303, 1.172014, 1, 0, 0, 1, 1,
0.8847415, 1.112179, 0.3168808, 1, 0, 0, 1, 1,
0.8892996, 0.214167, 0.7068588, 1, 0, 0, 1, 1,
0.8953938, 1.057926, 1.329041, 0, 0, 0, 1, 1,
0.8985144, 1.63536, -0.8859679, 0, 0, 0, 1, 1,
0.8995236, 0.9817943, 1.157911, 0, 0, 0, 1, 1,
0.9044583, -0.2365598, 3.281247, 0, 0, 0, 1, 1,
0.9068263, -0.9240767, 3.079175, 0, 0, 0, 1, 1,
0.911313, -2.266067, 1.815359, 0, 0, 0, 1, 1,
0.911694, -1.305971, 3.699247, 0, 0, 0, 1, 1,
0.9118712, 0.2590621, 1.82779, 1, 1, 1, 1, 1,
0.9173951, 0.4794184, 1.448475, 1, 1, 1, 1, 1,
0.9194748, -0.2433606, 2.778389, 1, 1, 1, 1, 1,
0.9225022, 0.2881888, 3.56557, 1, 1, 1, 1, 1,
0.9259844, -0.1656631, 2.599538, 1, 1, 1, 1, 1,
0.9408097, 1.21782, 0.3746979, 1, 1, 1, 1, 1,
0.9421933, 0.8630647, 0.4382727, 1, 1, 1, 1, 1,
0.9583961, -0.2481894, 0.3045381, 1, 1, 1, 1, 1,
0.9704872, -1.35202, 3.430815, 1, 1, 1, 1, 1,
0.9769813, -1.78468, 1.828889, 1, 1, 1, 1, 1,
0.9888554, 0.2698998, 0.0649302, 1, 1, 1, 1, 1,
0.9900587, -0.4387544, 3.05674, 1, 1, 1, 1, 1,
0.994978, -0.04794554, 0.8281285, 1, 1, 1, 1, 1,
1.012748, -1.352427, 3.269148, 1, 1, 1, 1, 1,
1.015932, -0.3377283, 2.322506, 1, 1, 1, 1, 1,
1.026986, -0.1061488, 2.48094, 0, 0, 1, 1, 1,
1.028032, -0.4520037, 1.502514, 1, 0, 0, 1, 1,
1.03213, 0.5831748, 2.60779, 1, 0, 0, 1, 1,
1.042423, -1.185481, 3.111147, 1, 0, 0, 1, 1,
1.045015, -0.3457232, 0.8225106, 1, 0, 0, 1, 1,
1.046244, 1.327137, 0.5319411, 1, 0, 0, 1, 1,
1.048491, -2.124589, 1.682809, 0, 0, 0, 1, 1,
1.050517, -0.3079294, 1.999815, 0, 0, 0, 1, 1,
1.051265, 0.2140973, 2.66363, 0, 0, 0, 1, 1,
1.061747, -0.3144677, 1.180978, 0, 0, 0, 1, 1,
1.065034, -1.36043, 3.49113, 0, 0, 0, 1, 1,
1.068619, -0.1905119, 1.475966, 0, 0, 0, 1, 1,
1.068946, -0.7530208, 2.005147, 0, 0, 0, 1, 1,
1.073828, 1.763005, 0.6659361, 1, 1, 1, 1, 1,
1.079901, 1.279174, 1.043208, 1, 1, 1, 1, 1,
1.082481, -0.4250427, 1.385999, 1, 1, 1, 1, 1,
1.088774, -0.3213742, 1.821951, 1, 1, 1, 1, 1,
1.089093, -0.7484592, 2.024378, 1, 1, 1, 1, 1,
1.091057, -0.02611542, 3.365181, 1, 1, 1, 1, 1,
1.091848, -0.5159712, 1.33594, 1, 1, 1, 1, 1,
1.091954, 0.30253, 1.726471, 1, 1, 1, 1, 1,
1.102874, -0.730086, 2.941886, 1, 1, 1, 1, 1,
1.103637, 0.04425266, 1.82238, 1, 1, 1, 1, 1,
1.104799, 1.110323, 0.4635295, 1, 1, 1, 1, 1,
1.105078, 0.5618367, 0.5822006, 1, 1, 1, 1, 1,
1.110285, -1.436743, 1.388903, 1, 1, 1, 1, 1,
1.117487, -1.818748, 3.527193, 1, 1, 1, 1, 1,
1.122491, 0.1625076, 3.954939, 1, 1, 1, 1, 1,
1.125453, 0.0429474, 1.561173, 0, 0, 1, 1, 1,
1.127209, -0.7023554, 3.827636, 1, 0, 0, 1, 1,
1.128633, 1.266728, 0.5273931, 1, 0, 0, 1, 1,
1.132854, 0.05424002, 3.662091, 1, 0, 0, 1, 1,
1.145498, -1.211575, 3.613945, 1, 0, 0, 1, 1,
1.150183, 2.211692, -0.2706054, 1, 0, 0, 1, 1,
1.166891, 0.1654905, 2.244713, 0, 0, 0, 1, 1,
1.166909, 0.3167903, 1.44101, 0, 0, 0, 1, 1,
1.171018, -1.040309, 1.962142, 0, 0, 0, 1, 1,
1.172806, 1.235507, 0.4088652, 0, 0, 0, 1, 1,
1.173089, 0.4063599, 1.593822, 0, 0, 0, 1, 1,
1.178236, -1.638514, 0.6817726, 0, 0, 0, 1, 1,
1.181727, -0.5837915, 2.303302, 0, 0, 0, 1, 1,
1.183117, 0.429019, 2.371792, 1, 1, 1, 1, 1,
1.1919, 0.6936498, 0.1168015, 1, 1, 1, 1, 1,
1.201119, 0.3719359, 1.618086, 1, 1, 1, 1, 1,
1.20914, 0.3217925, 1.721855, 1, 1, 1, 1, 1,
1.211539, -0.5494455, 1.145842, 1, 1, 1, 1, 1,
1.227384, -0.02656103, 1.828985, 1, 1, 1, 1, 1,
1.228575, 0.0008822578, 2.311423, 1, 1, 1, 1, 1,
1.233999, -0.5095081, 2.739703, 1, 1, 1, 1, 1,
1.243832, 0.5685036, 1.499152, 1, 1, 1, 1, 1,
1.24891, -1.248682, 2.23576, 1, 1, 1, 1, 1,
1.251066, 1.172726, 1.756937, 1, 1, 1, 1, 1,
1.257091, -0.935102, 1.053963, 1, 1, 1, 1, 1,
1.259735, -0.8349224, 1.649313, 1, 1, 1, 1, 1,
1.26288, -0.02505432, 2.861328, 1, 1, 1, 1, 1,
1.272097, 0.5409916, 2.342056, 1, 1, 1, 1, 1,
1.280153, 0.6589407, 2.678797, 0, 0, 1, 1, 1,
1.282097, 1.678659, 2.153405, 1, 0, 0, 1, 1,
1.291363, 0.5441232, 1.530795, 1, 0, 0, 1, 1,
1.293668, 0.1343936, 2.355745, 1, 0, 0, 1, 1,
1.294281, -0.9119583, 3.76741, 1, 0, 0, 1, 1,
1.301388, -0.5853072, 1.253279, 1, 0, 0, 1, 1,
1.303209, 1.272266, 0.5807646, 0, 0, 0, 1, 1,
1.307263, 0.312573, 3.316546, 0, 0, 0, 1, 1,
1.32608, -0.730157, 2.499161, 0, 0, 0, 1, 1,
1.329541, 0.07035469, 1.411518, 0, 0, 0, 1, 1,
1.33704, 0.08069713, 1.317744, 0, 0, 0, 1, 1,
1.340539, 1.519275, 0.5246683, 0, 0, 0, 1, 1,
1.347494, 1.120789, 0.6983787, 0, 0, 0, 1, 1,
1.348227, -2.285578, 1.969487, 1, 1, 1, 1, 1,
1.349335, 2.021863, 1.803427, 1, 1, 1, 1, 1,
1.349706, 0.8825241, 0.8980437, 1, 1, 1, 1, 1,
1.358107, 1.353595, 0.5779506, 1, 1, 1, 1, 1,
1.369321, 0.982557, 2.041324, 1, 1, 1, 1, 1,
1.372484, 0.5135356, 2.583798, 1, 1, 1, 1, 1,
1.374259, -0.9104985, 3.361596, 1, 1, 1, 1, 1,
1.379433, -0.4783413, 0.5233675, 1, 1, 1, 1, 1,
1.3933, 0.6732209, 2.601705, 1, 1, 1, 1, 1,
1.402936, 0.4937924, 2.493963, 1, 1, 1, 1, 1,
1.412216, 0.476521, 1.013731, 1, 1, 1, 1, 1,
1.413147, 0.8072115, 0.1538423, 1, 1, 1, 1, 1,
1.421349, -0.6371395, 2.029577, 1, 1, 1, 1, 1,
1.429406, 1.661776, 1.250582, 1, 1, 1, 1, 1,
1.435163, 1.324795, 0.4310986, 1, 1, 1, 1, 1,
1.454655, -0.7663249, 0.2557561, 0, 0, 1, 1, 1,
1.457619, 1.202997, 1.0175, 1, 0, 0, 1, 1,
1.465469, 1.483296, 0.4340133, 1, 0, 0, 1, 1,
1.468047, 0.6690359, 1.702642, 1, 0, 0, 1, 1,
1.471639, 0.6393632, -0.1198875, 1, 0, 0, 1, 1,
1.477548, 0.2034532, 0.639051, 1, 0, 0, 1, 1,
1.478703, -0.4134004, 2.394511, 0, 0, 0, 1, 1,
1.490916, 1.302078, 0.4310997, 0, 0, 0, 1, 1,
1.497796, 1.221641, 1.565833, 0, 0, 0, 1, 1,
1.50525, -0.4253093, 3.858195, 0, 0, 0, 1, 1,
1.545363, 1.683799, -0.5098777, 0, 0, 0, 1, 1,
1.545943, 1.284865, 1.39563, 0, 0, 0, 1, 1,
1.555744, -0.4842599, 3.077206, 0, 0, 0, 1, 1,
1.561063, 0.7587696, 2.170612, 1, 1, 1, 1, 1,
1.561111, 1.623268, 1.033916, 1, 1, 1, 1, 1,
1.561217, 3.145054, 0.9862241, 1, 1, 1, 1, 1,
1.57388, 0.4159885, 2.158262, 1, 1, 1, 1, 1,
1.585306, -0.7113356, 0.9029835, 1, 1, 1, 1, 1,
1.594085, 2.10756, 1.474779, 1, 1, 1, 1, 1,
1.59996, 0.06539246, 2.35535, 1, 1, 1, 1, 1,
1.602805, 1.707709, -1.185175, 1, 1, 1, 1, 1,
1.609452, -0.01950267, 2.146796, 1, 1, 1, 1, 1,
1.613721, -1.249022, 1.223944, 1, 1, 1, 1, 1,
1.614669, 0.9448001, -1.348623, 1, 1, 1, 1, 1,
1.615926, 1.35302, 3.552848, 1, 1, 1, 1, 1,
1.616563, -0.5357111, 2.327294, 1, 1, 1, 1, 1,
1.617764, -0.6399961, 2.25813, 1, 1, 1, 1, 1,
1.622425, 0.238343, 0.9917061, 1, 1, 1, 1, 1,
1.627133, -0.784133, 1.294056, 0, 0, 1, 1, 1,
1.64111, 0.3853198, 2.102725, 1, 0, 0, 1, 1,
1.64298, 0.2906792, 3.551693, 1, 0, 0, 1, 1,
1.643273, 2.085863, -0.5441189, 1, 0, 0, 1, 1,
1.647651, 0.3433174, -0.5131728, 1, 0, 0, 1, 1,
1.666819, -0.4794501, 0.2367814, 1, 0, 0, 1, 1,
1.687077, -0.3717127, 0.3568779, 0, 0, 0, 1, 1,
1.716322, 0.2418503, 3.162013, 0, 0, 0, 1, 1,
1.724011, -0.07062469, 1.527349, 0, 0, 0, 1, 1,
1.753074, -1.508872, 3.322156, 0, 0, 0, 1, 1,
1.766681, -0.07765292, 2.604278, 0, 0, 0, 1, 1,
1.780449, 2.187682, 0.4411109, 0, 0, 0, 1, 1,
1.822179, -1.325755, 0.4050542, 0, 0, 0, 1, 1,
1.86663, 0.3106934, 0.8086612, 1, 1, 1, 1, 1,
1.875118, 0.001970207, 0.9244983, 1, 1, 1, 1, 1,
1.880908, -0.6983919, 2.225828, 1, 1, 1, 1, 1,
1.896508, 0.09405966, 1.965687, 1, 1, 1, 1, 1,
1.919508, 0.4200787, 0.5413177, 1, 1, 1, 1, 1,
1.929545, -0.3286164, 2.345974, 1, 1, 1, 1, 1,
1.93862, -1.377709, 2.946518, 1, 1, 1, 1, 1,
1.964843, -0.1520513, 1.698609, 1, 1, 1, 1, 1,
1.981482, 0.9146549, 1.748397, 1, 1, 1, 1, 1,
2.032559, 2.091456, 2.336953, 1, 1, 1, 1, 1,
2.042055, -0.2289753, 2.95245, 1, 1, 1, 1, 1,
2.073469, 0.4548965, 2.898523, 1, 1, 1, 1, 1,
2.074697, 0.3114715, 2.530165, 1, 1, 1, 1, 1,
2.134032, 0.1107228, 2.061186, 1, 1, 1, 1, 1,
2.150326, -3.075486, 3.772673, 1, 1, 1, 1, 1,
2.185511, -1.618716, 1.712902, 0, 0, 1, 1, 1,
2.206526, 0.8835677, 0.6101205, 1, 0, 0, 1, 1,
2.216435, 0.9704409, 2.582372, 1, 0, 0, 1, 1,
2.217396, -0.2815416, 2.510027, 1, 0, 0, 1, 1,
2.309625, -1.26137, 2.482381, 1, 0, 0, 1, 1,
2.339577, -1.539894, 2.86014, 1, 0, 0, 1, 1,
2.348022, -1.131921, 1.314211, 0, 0, 0, 1, 1,
2.352583, 0.404212, 2.375228, 0, 0, 0, 1, 1,
2.415547, 0.8926069, 1.523323, 0, 0, 0, 1, 1,
2.457195, 1.428303, 1.362295, 0, 0, 0, 1, 1,
2.470995, 1.066954, 1.593074, 0, 0, 0, 1, 1,
2.471552, -2.375213, 2.119055, 0, 0, 0, 1, 1,
2.537745, -0.9239503, 2.058698, 0, 0, 0, 1, 1,
2.568458, -0.5794125, 1.237049, 1, 1, 1, 1, 1,
2.591185, -0.5312712, -0.1735169, 1, 1, 1, 1, 1,
2.6448, 0.0346408, 0.0003572605, 1, 1, 1, 1, 1,
2.653366, 0.6297716, 0.3777548, 1, 1, 1, 1, 1,
2.882357, -0.08163515, 1.860539, 1, 1, 1, 1, 1,
3.276148, 1.216664, 0.4316981, 1, 1, 1, 1, 1,
3.491752, -0.680576, 2.288091, 1, 1, 1, 1, 1
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
var radius = 9.216782;
var distance = 32.37356;
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
mvMatrix.translate( -0.2679974, -0.03478384, -0.340621 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.37356);
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