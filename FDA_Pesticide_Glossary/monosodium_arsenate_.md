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
-3.969246, 0.2020516, -2.695198, 1, 0, 0, 1,
-3.33909, 0.5319548, -1.529456, 1, 0.007843138, 0, 1,
-2.82116, 1.184533, -1.781414, 1, 0.01176471, 0, 1,
-2.756556, -1.500447, -0.9595346, 1, 0.01960784, 0, 1,
-2.575448, 2.701603, -0.7039319, 1, 0.02352941, 0, 1,
-2.42964, -1.522015, -3.266602, 1, 0.03137255, 0, 1,
-2.401531, 0.3305925, -3.71814, 1, 0.03529412, 0, 1,
-2.375803, 1.452563, 1.508945, 1, 0.04313726, 0, 1,
-2.346789, 0.6720096, -2.237675, 1, 0.04705882, 0, 1,
-2.337118, -2.157028, -1.16564, 1, 0.05490196, 0, 1,
-2.320049, 0.7184487, -0.6936261, 1, 0.05882353, 0, 1,
-2.272776, 0.8729259, -1.981262, 1, 0.06666667, 0, 1,
-2.174101, 2.62906, -1.028118, 1, 0.07058824, 0, 1,
-2.134428, 0.7120735, -1.211539, 1, 0.07843138, 0, 1,
-2.125231, 0.6264521, -0.3548599, 1, 0.08235294, 0, 1,
-2.123085, -0.5861765, -0.2164709, 1, 0.09019608, 0, 1,
-2.108036, 0.4647597, -1.39993, 1, 0.09411765, 0, 1,
-2.086297, -1.29956, -2.642136, 1, 0.1019608, 0, 1,
-2.073769, 0.4018547, -1.095144, 1, 0.1098039, 0, 1,
-2.073619, -1.370991, -2.161981, 1, 0.1137255, 0, 1,
-2.072821, 1.684303, -0.6594625, 1, 0.1215686, 0, 1,
-2.056361, -0.8328277, -2.959378, 1, 0.1254902, 0, 1,
-2.044536, -0.4377706, -1.858383, 1, 0.1333333, 0, 1,
-1.999442, -0.6560456, -2.323562, 1, 0.1372549, 0, 1,
-1.998739, -0.65904, -1.988242, 1, 0.145098, 0, 1,
-1.971687, -0.5639879, -1.004913, 1, 0.1490196, 0, 1,
-1.943287, 0.4969961, -1.532495, 1, 0.1568628, 0, 1,
-1.927724, 2.209777, 0.847531, 1, 0.1607843, 0, 1,
-1.913394, -0.9828153, -0.7221736, 1, 0.1686275, 0, 1,
-1.868138, 0.3008621, -2.181182, 1, 0.172549, 0, 1,
-1.86813, -0.8162076, -2.336463, 1, 0.1803922, 0, 1,
-1.780701, -0.3315915, -3.098098, 1, 0.1843137, 0, 1,
-1.777116, -0.9532822, -1.294166, 1, 0.1921569, 0, 1,
-1.758934, -0.4296652, -0.2510948, 1, 0.1960784, 0, 1,
-1.748822, 0.402492, -1.717797, 1, 0.2039216, 0, 1,
-1.743444, -1.832261, -1.525103, 1, 0.2117647, 0, 1,
-1.721332, 0.2214016, -1.960111, 1, 0.2156863, 0, 1,
-1.684214, -0.6681412, -2.201965, 1, 0.2235294, 0, 1,
-1.683878, 0.3448099, -2.333204, 1, 0.227451, 0, 1,
-1.673061, 0.819055, 0.1068449, 1, 0.2352941, 0, 1,
-1.672919, -0.3042551, -1.681589, 1, 0.2392157, 0, 1,
-1.645694, 0.3933273, -1.041439, 1, 0.2470588, 0, 1,
-1.605628, 1.050178, -1.315381, 1, 0.2509804, 0, 1,
-1.598273, -1.562165, -3.189698, 1, 0.2588235, 0, 1,
-1.596777, -1.810646, -2.875172, 1, 0.2627451, 0, 1,
-1.571367, -0.001511333, -1.845709, 1, 0.2705882, 0, 1,
-1.568123, -1.253384, -2.058362, 1, 0.2745098, 0, 1,
-1.542631, -0.5892307, -2.787902, 1, 0.282353, 0, 1,
-1.527959, 0.156564, -0.03517693, 1, 0.2862745, 0, 1,
-1.50966, 1.018624, -1.889224, 1, 0.2941177, 0, 1,
-1.50425, 0.6282586, -1.97105, 1, 0.3019608, 0, 1,
-1.497434, -1.691961, -1.784453, 1, 0.3058824, 0, 1,
-1.494053, -1.361391, -4.317534, 1, 0.3137255, 0, 1,
-1.490343, 0.2471326, -2.525599, 1, 0.3176471, 0, 1,
-1.48177, -0.6750253, -2.33482, 1, 0.3254902, 0, 1,
-1.476569, 0.4235662, -2.445346, 1, 0.3294118, 0, 1,
-1.47015, 0.05712364, 0.4095876, 1, 0.3372549, 0, 1,
-1.463458, 1.317956, -0.9766017, 1, 0.3411765, 0, 1,
-1.458077, -0.2128959, -0.678517, 1, 0.3490196, 0, 1,
-1.454569, -1.955855, -2.199805, 1, 0.3529412, 0, 1,
-1.442345, -0.4201098, -2.198269, 1, 0.3607843, 0, 1,
-1.439988, 1.425406, -0.2513776, 1, 0.3647059, 0, 1,
-1.439714, 0.1449234, -2.62484, 1, 0.372549, 0, 1,
-1.438937, 0.3237893, -2.941749, 1, 0.3764706, 0, 1,
-1.431929, -0.05183793, -1.422371, 1, 0.3843137, 0, 1,
-1.410522, 2.0413, -0.5567756, 1, 0.3882353, 0, 1,
-1.402528, -0.01863742, -1.279015, 1, 0.3960784, 0, 1,
-1.390149, -0.805441, -0.4997652, 1, 0.4039216, 0, 1,
-1.389051, 0.03519253, -1.746029, 1, 0.4078431, 0, 1,
-1.384708, -0.02139148, -1.594064, 1, 0.4156863, 0, 1,
-1.366903, -0.7492998, -1.495438, 1, 0.4196078, 0, 1,
-1.3623, -0.2350647, -0.9295921, 1, 0.427451, 0, 1,
-1.360637, 0.3108645, -2.067548, 1, 0.4313726, 0, 1,
-1.347867, -0.6100628, -2.797683, 1, 0.4392157, 0, 1,
-1.346361, 0.9415928, -2.162821, 1, 0.4431373, 0, 1,
-1.342658, 1.634607, 0.1784536, 1, 0.4509804, 0, 1,
-1.338434, -0.205586, -1.631156, 1, 0.454902, 0, 1,
-1.337574, 0.2220991, -1.077415, 1, 0.4627451, 0, 1,
-1.33045, 0.9310102, -1.012448, 1, 0.4666667, 0, 1,
-1.327656, -0.9747157, -3.134675, 1, 0.4745098, 0, 1,
-1.322654, 1.412474, -0.4900361, 1, 0.4784314, 0, 1,
-1.318858, 0.7608539, -0.8789191, 1, 0.4862745, 0, 1,
-1.309468, 0.04753945, -2.469063, 1, 0.4901961, 0, 1,
-1.302956, -0.2013018, 0.01629616, 1, 0.4980392, 0, 1,
-1.296717, -0.5314265, -1.832886, 1, 0.5058824, 0, 1,
-1.286481, -0.3654331, -2.445414, 1, 0.509804, 0, 1,
-1.284485, 1.290586, -0.01913497, 1, 0.5176471, 0, 1,
-1.281016, -0.1653079, -0.7750467, 1, 0.5215687, 0, 1,
-1.275768, -0.1632891, 0.2839139, 1, 0.5294118, 0, 1,
-1.265945, 0.127681, -0.7776194, 1, 0.5333334, 0, 1,
-1.263922, -0.4799708, -1.32417, 1, 0.5411765, 0, 1,
-1.258302, 0.2675088, -2.386521, 1, 0.5450981, 0, 1,
-1.249416, 1.808688, -0.6586018, 1, 0.5529412, 0, 1,
-1.248799, -1.485436, -4.090242, 1, 0.5568628, 0, 1,
-1.247355, 1.20963, -1.175994, 1, 0.5647059, 0, 1,
-1.245817, 0.09518173, -1.538986, 1, 0.5686275, 0, 1,
-1.236707, -0.1306995, -1.051687, 1, 0.5764706, 0, 1,
-1.233482, 0.1821801, -1.607169, 1, 0.5803922, 0, 1,
-1.232141, 0.8463894, -0.1251266, 1, 0.5882353, 0, 1,
-1.216781, -0.0964976, -1.274386, 1, 0.5921569, 0, 1,
-1.215584, 2.548298, -1.2937, 1, 0.6, 0, 1,
-1.214643, 0.9360164, 0.180147, 1, 0.6078432, 0, 1,
-1.209664, 0.4649484, -1.152844, 1, 0.6117647, 0, 1,
-1.204119, 0.6712342, -0.01140841, 1, 0.6196079, 0, 1,
-1.201447, 0.8778785, -1.745969, 1, 0.6235294, 0, 1,
-1.193503, -2.473644, -4.170478, 1, 0.6313726, 0, 1,
-1.191106, 1.133118, -0.8014929, 1, 0.6352941, 0, 1,
-1.185141, 0.005570727, -1.087775, 1, 0.6431373, 0, 1,
-1.183258, -0.07538699, -1.353048, 1, 0.6470588, 0, 1,
-1.179183, 0.3742869, -2.543253, 1, 0.654902, 0, 1,
-1.175315, 0.7613341, -1.370569, 1, 0.6588235, 0, 1,
-1.170355, -0.5869005, -3.252532, 1, 0.6666667, 0, 1,
-1.16539, -0.5125255, -3.241479, 1, 0.6705883, 0, 1,
-1.165111, -1.065764, -2.160454, 1, 0.6784314, 0, 1,
-1.164552, -0.4676496, -2.055431, 1, 0.682353, 0, 1,
-1.161954, 0.5874039, -1.134786, 1, 0.6901961, 0, 1,
-1.161435, -0.7663656, -1.816292, 1, 0.6941177, 0, 1,
-1.156356, -0.7152526, -1.923028, 1, 0.7019608, 0, 1,
-1.153635, 0.09863347, -0.9138819, 1, 0.7098039, 0, 1,
-1.143738, -0.1160515, -2.093017, 1, 0.7137255, 0, 1,
-1.143557, -0.5599976, -0.4305408, 1, 0.7215686, 0, 1,
-1.138299, 1.026152, -1.565779, 1, 0.7254902, 0, 1,
-1.13792, -0.1586544, -2.045535, 1, 0.7333333, 0, 1,
-1.136673, -2.694863, -1.656539, 1, 0.7372549, 0, 1,
-1.134992, -1.284222, -3.566913, 1, 0.7450981, 0, 1,
-1.126963, -0.4904579, -0.6568105, 1, 0.7490196, 0, 1,
-1.124666, -1.540115, -5.024247, 1, 0.7568628, 0, 1,
-1.124526, -0.4796333, -2.952318, 1, 0.7607843, 0, 1,
-1.117776, 0.4654042, -2.571479, 1, 0.7686275, 0, 1,
-1.11451, -0.02684615, -1.817635, 1, 0.772549, 0, 1,
-1.114354, 0.3638254, -0.9349208, 1, 0.7803922, 0, 1,
-1.113008, 1.363641, -0.1009619, 1, 0.7843137, 0, 1,
-1.108759, -2.136692, -3.212242, 1, 0.7921569, 0, 1,
-1.105514, 1.399547, -1.639846, 1, 0.7960784, 0, 1,
-1.086727, -0.6783918, -2.398751, 1, 0.8039216, 0, 1,
-1.078724, 0.6208637, -2.32931, 1, 0.8117647, 0, 1,
-1.074128, 0.9694411, -0.4435017, 1, 0.8156863, 0, 1,
-1.068353, 0.3123406, -1.370566, 1, 0.8235294, 0, 1,
-1.06686, 0.2166986, -2.041158, 1, 0.827451, 0, 1,
-1.065044, 1.435214, -0.9407893, 1, 0.8352941, 0, 1,
-1.064248, 0.7165722, -1.37721, 1, 0.8392157, 0, 1,
-1.060344, 0.8095263, -0.7879995, 1, 0.8470588, 0, 1,
-1.058621, -0.8065617, -1.618196, 1, 0.8509804, 0, 1,
-1.048875, -0.4382618, -2.125721, 1, 0.8588235, 0, 1,
-1.04813, 1.170123, -0.6286868, 1, 0.8627451, 0, 1,
-1.046531, 0.4187149, -3.45912, 1, 0.8705882, 0, 1,
-1.043858, -0.5795029, -2.10734, 1, 0.8745098, 0, 1,
-1.042381, -1.560688, -1.632871, 1, 0.8823529, 0, 1,
-1.038016, 0.1650887, -1.178913, 1, 0.8862745, 0, 1,
-1.037302, 1.145375, -0.9800937, 1, 0.8941177, 0, 1,
-1.036682, -0.464844, -2.278616, 1, 0.8980392, 0, 1,
-1.030839, 1.227687, 0.2649737, 1, 0.9058824, 0, 1,
-1.02984, 0.06906956, -2.792733, 1, 0.9137255, 0, 1,
-1.025575, -1.892232, -3.820589, 1, 0.9176471, 0, 1,
-1.016129, 0.4306818, 0.3864591, 1, 0.9254902, 0, 1,
-1.011253, 0.9049635, -1.141309, 1, 0.9294118, 0, 1,
-1.009504, 1.438639, -2.310796, 1, 0.9372549, 0, 1,
-1.009328, -0.4042713, -2.213006, 1, 0.9411765, 0, 1,
-1.004217, -1.186145, -3.199247, 1, 0.9490196, 0, 1,
-1.003508, -0.7560565, -3.004626, 1, 0.9529412, 0, 1,
-1.002712, -0.4896166, -0.1379195, 1, 0.9607843, 0, 1,
-1.002702, 0.3594831, -1.395083, 1, 0.9647059, 0, 1,
-0.998728, -0.1025245, -0.2378504, 1, 0.972549, 0, 1,
-0.9981444, 0.4908939, 0.6320432, 1, 0.9764706, 0, 1,
-0.997896, -1.161965, -2.712199, 1, 0.9843137, 0, 1,
-0.9838508, -0.04049118, -3.599687, 1, 0.9882353, 0, 1,
-0.9805314, -0.7793671, -1.726108, 1, 0.9960784, 0, 1,
-0.9753967, -0.5104015, -4.779177, 0.9960784, 1, 0, 1,
-0.9751671, -0.4567268, -1.206748, 0.9921569, 1, 0, 1,
-0.9712385, 0.1847462, -1.691334, 0.9843137, 1, 0, 1,
-0.965632, 0.5798044, -0.1027452, 0.9803922, 1, 0, 1,
-0.9636225, -0.131861, -1.875131, 0.972549, 1, 0, 1,
-0.9455487, -0.53961, -3.163605, 0.9686275, 1, 0, 1,
-0.9392672, 0.6674132, -1.227398, 0.9607843, 1, 0, 1,
-0.9356859, -0.557636, -1.717333, 0.9568627, 1, 0, 1,
-0.9226536, -2.273005, -2.562645, 0.9490196, 1, 0, 1,
-0.9218137, 1.789848, -0.3780981, 0.945098, 1, 0, 1,
-0.9147015, -0.7325071, -1.695471, 0.9372549, 1, 0, 1,
-0.9129305, -0.7865093, -1.995632, 0.9333333, 1, 0, 1,
-0.9061989, 0.1231904, 1.112025, 0.9254902, 1, 0, 1,
-0.9057876, 0.2823357, -1.675519, 0.9215686, 1, 0, 1,
-0.9013266, 0.7801184, -1.390732, 0.9137255, 1, 0, 1,
-0.8955614, -0.2791736, -2.713349, 0.9098039, 1, 0, 1,
-0.894196, -0.3573591, -1.167774, 0.9019608, 1, 0, 1,
-0.8938223, -0.4573261, -2.638496, 0.8941177, 1, 0, 1,
-0.8871799, -0.7312514, -1.627074, 0.8901961, 1, 0, 1,
-0.88023, 1.480398, -1.343441, 0.8823529, 1, 0, 1,
-0.877713, 0.6640393, -0.5150916, 0.8784314, 1, 0, 1,
-0.876166, -2.273414, -2.86712, 0.8705882, 1, 0, 1,
-0.8699836, -0.3447357, -0.4284603, 0.8666667, 1, 0, 1,
-0.8691275, -0.2811505, -3.176519, 0.8588235, 1, 0, 1,
-0.8677352, -0.04921273, -1.616497, 0.854902, 1, 0, 1,
-0.8674961, -1.345994, -4.507764, 0.8470588, 1, 0, 1,
-0.8628497, 0.7533692, -1.530711, 0.8431373, 1, 0, 1,
-0.8569586, 0.4056668, -0.5383426, 0.8352941, 1, 0, 1,
-0.8498715, -0.1910682, -1.935706, 0.8313726, 1, 0, 1,
-0.8469211, -0.7433843, 0.001010669, 0.8235294, 1, 0, 1,
-0.8439568, 0.1563109, -2.351891, 0.8196079, 1, 0, 1,
-0.841363, -0.9278613, -1.209406, 0.8117647, 1, 0, 1,
-0.8407325, 0.4575849, -0.732355, 0.8078431, 1, 0, 1,
-0.8330228, 1.360927, -0.7442349, 0.8, 1, 0, 1,
-0.828966, 0.1147731, -0.540231, 0.7921569, 1, 0, 1,
-0.8250084, 1.140566, 0.7719417, 0.7882353, 1, 0, 1,
-0.8230565, -0.7941369, -2.001654, 0.7803922, 1, 0, 1,
-0.8210046, -0.4296343, -2.090202, 0.7764706, 1, 0, 1,
-0.8192343, 1.696293, -0.4090581, 0.7686275, 1, 0, 1,
-0.8158357, -0.02068686, -0.2886044, 0.7647059, 1, 0, 1,
-0.8089576, 0.09428868, -1.168063, 0.7568628, 1, 0, 1,
-0.8076194, -0.583544, -2.589694, 0.7529412, 1, 0, 1,
-0.8048875, -0.3688327, -1.647777, 0.7450981, 1, 0, 1,
-0.8018917, -1.238134, -3.722636, 0.7411765, 1, 0, 1,
-0.7996243, 0.4947318, -1.230646, 0.7333333, 1, 0, 1,
-0.7935985, 0.5793529, -1.793426, 0.7294118, 1, 0, 1,
-0.7852011, 1.046455, 0.157854, 0.7215686, 1, 0, 1,
-0.7671347, 0.9229568, -2.018078, 0.7176471, 1, 0, 1,
-0.7648827, 1.148054, -0.0002184669, 0.7098039, 1, 0, 1,
-0.7641595, 0.6779238, -2.332973, 0.7058824, 1, 0, 1,
-0.7623019, -0.3002838, -0.8549063, 0.6980392, 1, 0, 1,
-0.7608088, 0.3477544, 1.905354, 0.6901961, 1, 0, 1,
-0.7546704, -1.233356, -4.04214, 0.6862745, 1, 0, 1,
-0.7510853, 0.1974886, -2.151078, 0.6784314, 1, 0, 1,
-0.7499871, -0.09908765, -1.309581, 0.6745098, 1, 0, 1,
-0.7477129, -0.3614558, -0.7967877, 0.6666667, 1, 0, 1,
-0.7450932, -0.85765, -3.395339, 0.6627451, 1, 0, 1,
-0.738901, -0.7315082, -0.2557727, 0.654902, 1, 0, 1,
-0.7307019, 0.854869, -1.620363, 0.6509804, 1, 0, 1,
-0.7265957, 0.5130361, -0.968124, 0.6431373, 1, 0, 1,
-0.7259414, -0.8335084, -1.916927, 0.6392157, 1, 0, 1,
-0.7240086, 0.6333467, 0.6055335, 0.6313726, 1, 0, 1,
-0.7219536, -0.6657645, -3.59987, 0.627451, 1, 0, 1,
-0.7144957, 0.8314323, 0.4496149, 0.6196079, 1, 0, 1,
-0.7133005, -0.9314276, -3.349539, 0.6156863, 1, 0, 1,
-0.7126778, 0.2980367, -0.1539563, 0.6078432, 1, 0, 1,
-0.708473, 1.014547, -0.3592145, 0.6039216, 1, 0, 1,
-0.7068659, 0.8545188, 0.2346692, 0.5960785, 1, 0, 1,
-0.7066763, 3.625785, 0.695234, 0.5882353, 1, 0, 1,
-0.7001379, -0.2303256, -1.020042, 0.5843138, 1, 0, 1,
-0.699942, 0.04456962, -1.310878, 0.5764706, 1, 0, 1,
-0.6994445, -1.909442, -3.771992, 0.572549, 1, 0, 1,
-0.6926721, 0.9239743, -0.4207599, 0.5647059, 1, 0, 1,
-0.690011, 0.5680514, 1.495235, 0.5607843, 1, 0, 1,
-0.6880204, -1.805129, -1.657209, 0.5529412, 1, 0, 1,
-0.6878824, 3.253806, -0.2900029, 0.5490196, 1, 0, 1,
-0.6828652, 0.1279326, -2.135998, 0.5411765, 1, 0, 1,
-0.6738438, -0.1678221, -1.61064, 0.5372549, 1, 0, 1,
-0.6684398, 0.9479675, -0.221826, 0.5294118, 1, 0, 1,
-0.6555436, 0.3691625, 0.2671678, 0.5254902, 1, 0, 1,
-0.6509978, 0.5473953, -2.374584, 0.5176471, 1, 0, 1,
-0.650148, 1.088779, -1.013981, 0.5137255, 1, 0, 1,
-0.6439573, -0.378072, -1.368624, 0.5058824, 1, 0, 1,
-0.6439498, -0.4456844, -1.003603, 0.5019608, 1, 0, 1,
-0.6400396, 0.380626, -0.8604135, 0.4941176, 1, 0, 1,
-0.6391023, -1.023063, -3.250057, 0.4862745, 1, 0, 1,
-0.6367306, 0.5068225, -0.3007475, 0.4823529, 1, 0, 1,
-0.6342096, 0.4372092, -2.275794, 0.4745098, 1, 0, 1,
-0.6319686, 0.7475561, -0.2369542, 0.4705882, 1, 0, 1,
-0.6312213, 0.6865154, -1.613734, 0.4627451, 1, 0, 1,
-0.6268482, -0.8265646, -3.120558, 0.4588235, 1, 0, 1,
-0.6262271, -1.219629, -1.440411, 0.4509804, 1, 0, 1,
-0.6252257, -1.944462, -3.640917, 0.4470588, 1, 0, 1,
-0.6244864, -1.109022, -4.366963, 0.4392157, 1, 0, 1,
-0.6234789, -0.3449433, -1.970932, 0.4352941, 1, 0, 1,
-0.6194229, 2.32803, 0.2411133, 0.427451, 1, 0, 1,
-0.6189563, 0.7906632, -0.4418143, 0.4235294, 1, 0, 1,
-0.6164162, -2.98705, -3.751411, 0.4156863, 1, 0, 1,
-0.6153328, 1.392372, -0.7928736, 0.4117647, 1, 0, 1,
-0.6137249, 1.286306, 0.5880991, 0.4039216, 1, 0, 1,
-0.6118532, 1.095601, -0.05240674, 0.3960784, 1, 0, 1,
-0.6085816, 0.7471374, -1.075171, 0.3921569, 1, 0, 1,
-0.6069473, -0.2412589, -1.56459, 0.3843137, 1, 0, 1,
-0.6067981, 1.7318, 0.0135254, 0.3803922, 1, 0, 1,
-0.5988014, -2.039496, -2.080737, 0.372549, 1, 0, 1,
-0.5950484, 0.6889648, -2.044042, 0.3686275, 1, 0, 1,
-0.5918704, 1.479578, -0.2958285, 0.3607843, 1, 0, 1,
-0.5910673, -0.7805917, -3.070267, 0.3568628, 1, 0, 1,
-0.5858632, -0.5133414, -1.645726, 0.3490196, 1, 0, 1,
-0.5850195, -1.201871, -2.079484, 0.345098, 1, 0, 1,
-0.5840325, -0.3102305, -2.849834, 0.3372549, 1, 0, 1,
-0.5837312, 0.4608096, 0.2145478, 0.3333333, 1, 0, 1,
-0.5828189, 0.4726788, -2.824515, 0.3254902, 1, 0, 1,
-0.5788307, -0.4288395, -3.584118, 0.3215686, 1, 0, 1,
-0.5778825, -0.05809557, -1.626567, 0.3137255, 1, 0, 1,
-0.5771257, 1.746913, 0.009772155, 0.3098039, 1, 0, 1,
-0.5642104, 2.590709, 0.4896249, 0.3019608, 1, 0, 1,
-0.5609428, 0.1172543, -0.2868742, 0.2941177, 1, 0, 1,
-0.5592743, 0.2546334, -1.62966, 0.2901961, 1, 0, 1,
-0.5578336, 0.196405, 0.3872749, 0.282353, 1, 0, 1,
-0.5565006, 0.6893754, -0.5280169, 0.2784314, 1, 0, 1,
-0.5554436, -0.5275705, -3.219543, 0.2705882, 1, 0, 1,
-0.5542178, 1.427644, 0.2484385, 0.2666667, 1, 0, 1,
-0.551532, -2.086468, -4.158602, 0.2588235, 1, 0, 1,
-0.5413594, 0.659194, -1.490397, 0.254902, 1, 0, 1,
-0.538534, 0.8485444, -0.8538089, 0.2470588, 1, 0, 1,
-0.5363405, -1.138407, -0.7010631, 0.2431373, 1, 0, 1,
-0.5352218, 1.544561, 0.332864, 0.2352941, 1, 0, 1,
-0.5351133, 0.4328288, -1.46164, 0.2313726, 1, 0, 1,
-0.5349249, -0.6859025, -2.783045, 0.2235294, 1, 0, 1,
-0.5310097, 1.109388, -1.512566, 0.2196078, 1, 0, 1,
-0.5222911, 0.6307098, -0.6461878, 0.2117647, 1, 0, 1,
-0.5205626, 1.598067, 2.373158, 0.2078431, 1, 0, 1,
-0.5166502, 1.259422, -2.170663, 0.2, 1, 0, 1,
-0.5158358, 0.1090591, -2.309086, 0.1921569, 1, 0, 1,
-0.5127763, -0.8926812, -2.978925, 0.1882353, 1, 0, 1,
-0.5125232, 0.6721672, 1.314403, 0.1803922, 1, 0, 1,
-0.5123505, -0.007713984, -0.7805601, 0.1764706, 1, 0, 1,
-0.5110232, 1.802397, -0.02548276, 0.1686275, 1, 0, 1,
-0.5103363, -0.7543126, -3.637692, 0.1647059, 1, 0, 1,
-0.5059567, -1.436308, -2.987833, 0.1568628, 1, 0, 1,
-0.4993026, 0.08620914, -1.66764, 0.1529412, 1, 0, 1,
-0.4989553, -0.3246805, -2.972362, 0.145098, 1, 0, 1,
-0.4985263, -0.2499545, -1.353275, 0.1411765, 1, 0, 1,
-0.4942034, -0.7930394, -2.245058, 0.1333333, 1, 0, 1,
-0.4915276, 1.401031, -0.7534455, 0.1294118, 1, 0, 1,
-0.4915173, -0.1113446, -3.308682, 0.1215686, 1, 0, 1,
-0.4794997, 2.565148, 0.8836215, 0.1176471, 1, 0, 1,
-0.4715451, 0.6719838, -0.8872984, 0.1098039, 1, 0, 1,
-0.4700117, 1.529806, 0.8230014, 0.1058824, 1, 0, 1,
-0.4663989, -0.8077058, -2.903262, 0.09803922, 1, 0, 1,
-0.4560105, -1.193297, -3.290109, 0.09019608, 1, 0, 1,
-0.4526775, 0.07944646, -1.59036, 0.08627451, 1, 0, 1,
-0.451172, -1.082932, -2.355967, 0.07843138, 1, 0, 1,
-0.4471503, -1.198855, -3.344614, 0.07450981, 1, 0, 1,
-0.4462323, -0.3808331, -1.298595, 0.06666667, 1, 0, 1,
-0.4384813, 0.9281086, -1.571096, 0.0627451, 1, 0, 1,
-0.4339078, -0.6422797, -2.077423, 0.05490196, 1, 0, 1,
-0.4334922, -1.782138, -2.595145, 0.05098039, 1, 0, 1,
-0.4302448, 0.2849017, -0.4768645, 0.04313726, 1, 0, 1,
-0.4297448, -1.015859, -2.964019, 0.03921569, 1, 0, 1,
-0.4253903, -1.639538, -1.65334, 0.03137255, 1, 0, 1,
-0.4252923, -1.446604, -3.886423, 0.02745098, 1, 0, 1,
-0.4247555, 0.4237372, -0.2240074, 0.01960784, 1, 0, 1,
-0.4216704, 2.740022, -1.731807, 0.01568628, 1, 0, 1,
-0.420035, 0.8575827, -0.1261247, 0.007843138, 1, 0, 1,
-0.419286, 0.7909764, -0.7348487, 0.003921569, 1, 0, 1,
-0.4141312, -0.6881528, -1.554067, 0, 1, 0.003921569, 1,
-0.4123123, 1.433026, -0.2031694, 0, 1, 0.01176471, 1,
-0.4117455, 1.234165, 1.026069, 0, 1, 0.01568628, 1,
-0.4105246, 1.873147, 1.42581, 0, 1, 0.02352941, 1,
-0.4088679, 0.06186444, -0.8662372, 0, 1, 0.02745098, 1,
-0.4080854, -0.2892216, -1.175598, 0, 1, 0.03529412, 1,
-0.403967, 0.7983715, 0.4587009, 0, 1, 0.03921569, 1,
-0.4036793, -0.2801082, -3.217791, 0, 1, 0.04705882, 1,
-0.3974209, 0.9139355, 1.313888, 0, 1, 0.05098039, 1,
-0.3966485, -0.03309068, -3.704121, 0, 1, 0.05882353, 1,
-0.3946172, 0.4753237, -0.9901441, 0, 1, 0.0627451, 1,
-0.3899586, -0.6720635, -2.205329, 0, 1, 0.07058824, 1,
-0.3894683, -0.09860517, -0.9760907, 0, 1, 0.07450981, 1,
-0.3872575, 0.1168021, -0.5364996, 0, 1, 0.08235294, 1,
-0.3814486, -0.466688, -4.207775, 0, 1, 0.08627451, 1,
-0.3751597, -0.9728178, -2.72165, 0, 1, 0.09411765, 1,
-0.3694626, -0.5768605, -3.717947, 0, 1, 0.1019608, 1,
-0.369186, -0.5142045, -1.701625, 0, 1, 0.1058824, 1,
-0.3669813, -0.7213082, -3.033163, 0, 1, 0.1137255, 1,
-0.3650249, -0.5951486, -2.346853, 0, 1, 0.1176471, 1,
-0.3650213, -0.8836192, -4.245437, 0, 1, 0.1254902, 1,
-0.3621462, -0.01191568, -1.409256, 0, 1, 0.1294118, 1,
-0.3612226, -0.5460286, -4.008353, 0, 1, 0.1372549, 1,
-0.3553485, -1.001262, -3.937057, 0, 1, 0.1411765, 1,
-0.3538035, 1.091596, 0.4814145, 0, 1, 0.1490196, 1,
-0.3528387, 0.2384166, -1.044933, 0, 1, 0.1529412, 1,
-0.3448646, -1.106885, -3.71689, 0, 1, 0.1607843, 1,
-0.3437727, 1.219537, -1.095196, 0, 1, 0.1647059, 1,
-0.3346176, 1.758738, -0.1239164, 0, 1, 0.172549, 1,
-0.3293015, -0.9832625, -1.535766, 0, 1, 0.1764706, 1,
-0.3274825, 0.3989802, 0.04863302, 0, 1, 0.1843137, 1,
-0.3251207, 1.100762, -1.492182, 0, 1, 0.1882353, 1,
-0.3216774, -2.111322, -4.058825, 0, 1, 0.1960784, 1,
-0.3179887, 1.2881, -0.7889116, 0, 1, 0.2039216, 1,
-0.3175314, 0.2726815, 0.07764884, 0, 1, 0.2078431, 1,
-0.3155575, 0.6692502, 0.8148635, 0, 1, 0.2156863, 1,
-0.3124234, 0.1801617, 0.7212121, 0, 1, 0.2196078, 1,
-0.3104877, -1.775635, -3.431649, 0, 1, 0.227451, 1,
-0.3101481, 0.4178643, -2.286922, 0, 1, 0.2313726, 1,
-0.3088171, 1.662062, -0.003850814, 0, 1, 0.2392157, 1,
-0.3064072, -2.48988, -3.979177, 0, 1, 0.2431373, 1,
-0.3045273, -0.137575, -2.767075, 0, 1, 0.2509804, 1,
-0.3018957, 1.526919, 0.0740006, 0, 1, 0.254902, 1,
-0.3018084, -0.8470471, -5.90093, 0, 1, 0.2627451, 1,
-0.3002573, -0.1193496, -3.204899, 0, 1, 0.2666667, 1,
-0.295452, 0.1984432, -0.3036575, 0, 1, 0.2745098, 1,
-0.2920124, -1.575196, -3.864052, 0, 1, 0.2784314, 1,
-0.2918579, -1.777647, -2.716975, 0, 1, 0.2862745, 1,
-0.2875692, 1.698365, 2.192626, 0, 1, 0.2901961, 1,
-0.2867837, -0.8039862, -3.066336, 0, 1, 0.2980392, 1,
-0.2774283, 0.6455621, -0.3062422, 0, 1, 0.3058824, 1,
-0.2765873, 0.2423774, -2.0442, 0, 1, 0.3098039, 1,
-0.2756192, 0.06548005, -1.724401, 0, 1, 0.3176471, 1,
-0.2744765, -0.4120653, -3.740481, 0, 1, 0.3215686, 1,
-0.2711966, 0.4576037, -1.589211, 0, 1, 0.3294118, 1,
-0.2689676, 1.187041, -0.9769456, 0, 1, 0.3333333, 1,
-0.264435, 0.7528657, -0.6299174, 0, 1, 0.3411765, 1,
-0.263706, 0.428407, -1.578534, 0, 1, 0.345098, 1,
-0.260712, 0.118673, -0.3935844, 0, 1, 0.3529412, 1,
-0.2571844, 0.2069809, 0.8533247, 0, 1, 0.3568628, 1,
-0.2558009, 0.1701791, -2.131826, 0, 1, 0.3647059, 1,
-0.2555876, -0.1243017, -2.099063, 0, 1, 0.3686275, 1,
-0.2508696, -0.4002955, -3.575011, 0, 1, 0.3764706, 1,
-0.2506736, 0.8582588, 0.1193315, 0, 1, 0.3803922, 1,
-0.2466731, 0.9443606, -0.3438874, 0, 1, 0.3882353, 1,
-0.2419099, -0.7971485, -0.5708292, 0, 1, 0.3921569, 1,
-0.2413736, -0.5096768, -4.637429, 0, 1, 0.4, 1,
-0.2377276, 0.7698654, 0.574699, 0, 1, 0.4078431, 1,
-0.2374068, 0.5797822, -0.7237173, 0, 1, 0.4117647, 1,
-0.2278177, -0.1090251, -0.08921278, 0, 1, 0.4196078, 1,
-0.2270719, -0.341352, -2.677125, 0, 1, 0.4235294, 1,
-0.2261225, 0.1996808, -0.540387, 0, 1, 0.4313726, 1,
-0.2255633, 0.3081387, 1.247695, 0, 1, 0.4352941, 1,
-0.22413, 0.4945307, -1.408026, 0, 1, 0.4431373, 1,
-0.2240429, 0.005139135, -1.326915, 0, 1, 0.4470588, 1,
-0.2231015, 0.6073974, -1.888862, 0, 1, 0.454902, 1,
-0.2223086, 0.3982753, -1.244111, 0, 1, 0.4588235, 1,
-0.2206242, 0.2487716, -0.5956262, 0, 1, 0.4666667, 1,
-0.2186148, -0.6253231, -2.14416, 0, 1, 0.4705882, 1,
-0.2161996, -1.366574, -3.911776, 0, 1, 0.4784314, 1,
-0.2159952, 0.6136134, -0.3167319, 0, 1, 0.4823529, 1,
-0.2094444, -0.7106407, -1.870502, 0, 1, 0.4901961, 1,
-0.2063134, -0.4379381, -4.831067, 0, 1, 0.4941176, 1,
-0.2046761, 0.250107, 1.091738, 0, 1, 0.5019608, 1,
-0.2026797, -1.507514, -3.669742, 0, 1, 0.509804, 1,
-0.2018205, -0.97121, -2.942435, 0, 1, 0.5137255, 1,
-0.2008244, 0.09904499, 0.01556375, 0, 1, 0.5215687, 1,
-0.200511, 1.16542, 0.901464, 0, 1, 0.5254902, 1,
-0.1967817, 1.227058, 1.183885, 0, 1, 0.5333334, 1,
-0.1924468, -1.283132, -4.119084, 0, 1, 0.5372549, 1,
-0.1795263, -0.1287766, -2.147584, 0, 1, 0.5450981, 1,
-0.1774397, 3.302105, 0.2874794, 0, 1, 0.5490196, 1,
-0.1760484, 0.1022746, -0.921115, 0, 1, 0.5568628, 1,
-0.1750916, 1.413365, 1.272531, 0, 1, 0.5607843, 1,
-0.173788, 0.6113254, -1.314816, 0, 1, 0.5686275, 1,
-0.1735203, 0.7894374, 0.1712355, 0, 1, 0.572549, 1,
-0.1734987, 1.574875, 0.03491695, 0, 1, 0.5803922, 1,
-0.169471, -0.9506258, -2.542692, 0, 1, 0.5843138, 1,
-0.1681862, -0.6621967, -2.865791, 0, 1, 0.5921569, 1,
-0.164105, 1.197953, 0.426107, 0, 1, 0.5960785, 1,
-0.1640092, -1.552376, -1.505511, 0, 1, 0.6039216, 1,
-0.1613072, 1.050138, 0.3696528, 0, 1, 0.6117647, 1,
-0.159363, 0.5212882, -0.7607889, 0, 1, 0.6156863, 1,
-0.1520361, -0.8666875, -1.442586, 0, 1, 0.6235294, 1,
-0.1509524, 1.34224, -0.805875, 0, 1, 0.627451, 1,
-0.149262, 0.6903336, 1.321093, 0, 1, 0.6352941, 1,
-0.1485163, 1.328053, 0.3661216, 0, 1, 0.6392157, 1,
-0.1470631, 1.216252, -1.290015, 0, 1, 0.6470588, 1,
-0.1454981, 1.183597, 1.305826, 0, 1, 0.6509804, 1,
-0.1442306, -0.6015316, -3.344698, 0, 1, 0.6588235, 1,
-0.1440961, -0.3808951, -2.076644, 0, 1, 0.6627451, 1,
-0.1424821, -0.04881235, -1.956053, 0, 1, 0.6705883, 1,
-0.1420361, -0.3323765, -1.980495, 0, 1, 0.6745098, 1,
-0.1380655, -1.905074, -2.857726, 0, 1, 0.682353, 1,
-0.1375629, 1.499306, 0.677696, 0, 1, 0.6862745, 1,
-0.1353135, -0.2663929, -2.971134, 0, 1, 0.6941177, 1,
-0.1264104, 0.6852341, -0.6348591, 0, 1, 0.7019608, 1,
-0.1262726, -1.654832, -3.650086, 0, 1, 0.7058824, 1,
-0.1219637, -2.729373, -3.186095, 0, 1, 0.7137255, 1,
-0.1105573, 0.3900849, -0.5592674, 0, 1, 0.7176471, 1,
-0.1095777, -0.801087, -4.284902, 0, 1, 0.7254902, 1,
-0.1081908, 0.5265999, -0.3819261, 0, 1, 0.7294118, 1,
-0.104445, -0.371742, -4.366904, 0, 1, 0.7372549, 1,
-0.104363, -2.045467, -4.433448, 0, 1, 0.7411765, 1,
-0.103101, 0.7087079, 0.5634927, 0, 1, 0.7490196, 1,
-0.09154739, 0.447465, -0.2532298, 0, 1, 0.7529412, 1,
-0.08778484, 0.7443022, -0.1155652, 0, 1, 0.7607843, 1,
-0.08689797, -0.5553856, -3.281855, 0, 1, 0.7647059, 1,
-0.08337729, -1.083, -3.053704, 0, 1, 0.772549, 1,
-0.08212093, -0.9595773, -2.432567, 0, 1, 0.7764706, 1,
-0.07896282, -0.3719479, -1.89847, 0, 1, 0.7843137, 1,
-0.07207619, -0.7506966, -3.776945, 0, 1, 0.7882353, 1,
-0.07139, -1.931681, -4.87018, 0, 1, 0.7960784, 1,
-0.06413464, 0.8816634, -0.7398152, 0, 1, 0.8039216, 1,
-0.05748188, 0.2933975, 1.680022, 0, 1, 0.8078431, 1,
-0.05604793, 0.7895758, -1.363296, 0, 1, 0.8156863, 1,
-0.05275596, 1.079933, -0.4885594, 0, 1, 0.8196079, 1,
-0.05254847, 1.384267, -1.712685, 0, 1, 0.827451, 1,
-0.04978117, -0.7285727, -3.744406, 0, 1, 0.8313726, 1,
-0.04949829, -0.2435993, -0.9779473, 0, 1, 0.8392157, 1,
-0.04632179, 0.475825, -2.365642, 0, 1, 0.8431373, 1,
-0.04546273, -1.585696, -4.31497, 0, 1, 0.8509804, 1,
-0.04415321, -0.4834591, -2.384937, 0, 1, 0.854902, 1,
-0.04286283, -1.670175, -4.301092, 0, 1, 0.8627451, 1,
-0.04205326, -0.6835844, -3.552157, 0, 1, 0.8666667, 1,
-0.03964653, 0.06749677, -1.181327, 0, 1, 0.8745098, 1,
-0.0394382, -0.7435744, -1.152323, 0, 1, 0.8784314, 1,
-0.03154054, 0.574853, 1.283291, 0, 1, 0.8862745, 1,
-0.03063469, -0.4573589, -3.837555, 0, 1, 0.8901961, 1,
-0.02925556, 0.4439546, 0.4659779, 0, 1, 0.8980392, 1,
-0.02766844, 0.7958611, -0.2638544, 0, 1, 0.9058824, 1,
-0.02710005, -1.878087, -4.091731, 0, 1, 0.9098039, 1,
-0.02592408, -0.2891025, -3.945148, 0, 1, 0.9176471, 1,
-0.02563894, 0.4495237, 0.8243666, 0, 1, 0.9215686, 1,
-0.01398314, -0.6905201, -4.005527, 0, 1, 0.9294118, 1,
-0.01390823, -1.453389, -2.781121, 0, 1, 0.9333333, 1,
-0.01205391, 0.4478711, 0.6581031, 0, 1, 0.9411765, 1,
-0.009279227, -0.2596144, -4.577372, 0, 1, 0.945098, 1,
-0.006573651, 0.6567757, 0.1796356, 0, 1, 0.9529412, 1,
0.0008589589, 1.69767, 1.276563, 0, 1, 0.9568627, 1,
0.005478496, -1.695893, 3.663019, 0, 1, 0.9647059, 1,
0.007049674, -0.444768, 3.478069, 0, 1, 0.9686275, 1,
0.01022735, -0.7383735, 3.583575, 0, 1, 0.9764706, 1,
0.01480028, -0.4573713, -0.3162819, 0, 1, 0.9803922, 1,
0.01786528, 0.68584, -2.071889, 0, 1, 0.9882353, 1,
0.01929265, 1.268982, 0.8535115, 0, 1, 0.9921569, 1,
0.01949934, -0.5638342, 4.758965, 0, 1, 1, 1,
0.02326443, 1.996229, -1.1744, 0, 0.9921569, 1, 1,
0.02640857, 0.291265, 0.6439596, 0, 0.9882353, 1, 1,
0.02912458, -0.04124655, 2.273172, 0, 0.9803922, 1, 1,
0.02957115, 0.4918884, 0.03598297, 0, 0.9764706, 1, 1,
0.03208734, -2.526723, 2.277314, 0, 0.9686275, 1, 1,
0.03326193, 0.738926, -0.1458267, 0, 0.9647059, 1, 1,
0.0333429, -0.8013377, 3.881717, 0, 0.9568627, 1, 1,
0.03481966, -2.150582, 3.776968, 0, 0.9529412, 1, 1,
0.03821671, 1.857973, 0.8617678, 0, 0.945098, 1, 1,
0.0391972, 0.157111, -1.114981, 0, 0.9411765, 1, 1,
0.0427582, -0.5968276, 4.850735, 0, 0.9333333, 1, 1,
0.05041966, -1.634251, 3.06402, 0, 0.9294118, 1, 1,
0.05056817, -1.229308, 2.861749, 0, 0.9215686, 1, 1,
0.05205584, 0.6453483, 1.129676, 0, 0.9176471, 1, 1,
0.0521141, -0.4249665, 2.8859, 0, 0.9098039, 1, 1,
0.06285371, -1.530002, 2.214516, 0, 0.9058824, 1, 1,
0.06646719, 0.7848864, 0.614494, 0, 0.8980392, 1, 1,
0.06828282, 0.2649977, 0.4472031, 0, 0.8901961, 1, 1,
0.06977016, -0.7100564, 3.245703, 0, 0.8862745, 1, 1,
0.07093248, -0.5394774, 3.582649, 0, 0.8784314, 1, 1,
0.07236831, -0.5901825, 3.735526, 0, 0.8745098, 1, 1,
0.07948086, 0.03473145, 0.8474985, 0, 0.8666667, 1, 1,
0.0833554, 0.04766994, 2.015302, 0, 0.8627451, 1, 1,
0.08524508, 0.5851454, -0.2975104, 0, 0.854902, 1, 1,
0.08929928, 0.4311669, -0.1432007, 0, 0.8509804, 1, 1,
0.09152857, 0.8260703, -0.7882182, 0, 0.8431373, 1, 1,
0.1006089, -0.2005551, 3.513742, 0, 0.8392157, 1, 1,
0.1008028, 0.1750445, 0.7840825, 0, 0.8313726, 1, 1,
0.1010912, 1.170029, 0.7569811, 0, 0.827451, 1, 1,
0.1033519, -1.547026, 3.075305, 0, 0.8196079, 1, 1,
0.1040063, -1.041633, 2.525191, 0, 0.8156863, 1, 1,
0.106826, -0.3012761, 3.072698, 0, 0.8078431, 1, 1,
0.1091166, 1.183701, -0.2935108, 0, 0.8039216, 1, 1,
0.1091228, -0.8063344, 1.173959, 0, 0.7960784, 1, 1,
0.1148152, 2.263169, 0.4296296, 0, 0.7882353, 1, 1,
0.1152286, -1.304363, 3.351615, 0, 0.7843137, 1, 1,
0.1227166, 1.815006, 0.2205321, 0, 0.7764706, 1, 1,
0.1228129, -2.042085, 2.429951, 0, 0.772549, 1, 1,
0.1298809, -0.4453307, 3.425806, 0, 0.7647059, 1, 1,
0.13197, 2.149864, 1.31812, 0, 0.7607843, 1, 1,
0.1341031, 1.355872, -0.6259086, 0, 0.7529412, 1, 1,
0.1354191, -0.1664077, 2.988529, 0, 0.7490196, 1, 1,
0.1384938, -0.6974488, 1.728709, 0, 0.7411765, 1, 1,
0.1387946, -0.5860769, 2.026911, 0, 0.7372549, 1, 1,
0.1462532, -1.421662, 3.886203, 0, 0.7294118, 1, 1,
0.1488067, 0.03735477, 0.3653044, 0, 0.7254902, 1, 1,
0.1513904, -1.050375, 1.776049, 0, 0.7176471, 1, 1,
0.1524951, -1.130419, 3.588855, 0, 0.7137255, 1, 1,
0.1541602, 0.6252046, 0.8237719, 0, 0.7058824, 1, 1,
0.1669083, 0.5313459, 1.453477, 0, 0.6980392, 1, 1,
0.1680779, 1.039384, -0.8619609, 0, 0.6941177, 1, 1,
0.1702587, 0.3179249, 1.979415, 0, 0.6862745, 1, 1,
0.1703899, -0.3105499, 3.038113, 0, 0.682353, 1, 1,
0.171228, 1.377241, -0.2441837, 0, 0.6745098, 1, 1,
0.1723139, -0.6910582, 0.8797939, 0, 0.6705883, 1, 1,
0.1776237, 0.5740327, -0.2699246, 0, 0.6627451, 1, 1,
0.1861235, -0.3310791, 3.367382, 0, 0.6588235, 1, 1,
0.1861458, 0.2138837, -0.5506293, 0, 0.6509804, 1, 1,
0.1866103, -0.4250668, 2.175447, 0, 0.6470588, 1, 1,
0.1883098, -0.9456399, 1.207191, 0, 0.6392157, 1, 1,
0.1893858, -0.3783716, 1.945922, 0, 0.6352941, 1, 1,
0.194198, -0.4962427, 4.161053, 0, 0.627451, 1, 1,
0.1986439, 0.222124, 1.041277, 0, 0.6235294, 1, 1,
0.1993165, 1.070596, 1.674402, 0, 0.6156863, 1, 1,
0.1999762, -0.1133161, 0.6059282, 0, 0.6117647, 1, 1,
0.2017389, -1.429224, 3.09842, 0, 0.6039216, 1, 1,
0.2029771, 0.6482269, -0.06363712, 0, 0.5960785, 1, 1,
0.203178, -0.3251285, 3.946158, 0, 0.5921569, 1, 1,
0.2038734, 1.6684, 0.6552774, 0, 0.5843138, 1, 1,
0.2087506, -0.3460279, 3.457961, 0, 0.5803922, 1, 1,
0.2099514, 0.4716708, -0.1161474, 0, 0.572549, 1, 1,
0.2105739, 2.024863, 1.139845, 0, 0.5686275, 1, 1,
0.2164721, 2.364462, -0.7475654, 0, 0.5607843, 1, 1,
0.2179925, -0.3522563, 2.308486, 0, 0.5568628, 1, 1,
0.2199447, -0.6153506, 2.424381, 0, 0.5490196, 1, 1,
0.2219047, 0.9953663, -0.4372951, 0, 0.5450981, 1, 1,
0.2236842, -1.134972, 3.512136, 0, 0.5372549, 1, 1,
0.2272434, -1.371477, 3.638512, 0, 0.5333334, 1, 1,
0.2366053, -0.3587262, 1.373161, 0, 0.5254902, 1, 1,
0.23755, 1.841986, -0.6725832, 0, 0.5215687, 1, 1,
0.2388278, 0.3112602, -0.1013106, 0, 0.5137255, 1, 1,
0.2437839, -0.2515846, 2.938755, 0, 0.509804, 1, 1,
0.249756, -0.734613, 2.373767, 0, 0.5019608, 1, 1,
0.2519214, -0.5909178, 2.30116, 0, 0.4941176, 1, 1,
0.2532547, 0.7554799, 0.7557931, 0, 0.4901961, 1, 1,
0.2583104, 0.1903182, 0.2170434, 0, 0.4823529, 1, 1,
0.2592852, -0.6418877, 2.63921, 0, 0.4784314, 1, 1,
0.2594356, 0.8066368, 0.314136, 0, 0.4705882, 1, 1,
0.2597446, -1.783893, 3.773906, 0, 0.4666667, 1, 1,
0.2599918, -0.9122593, 3.087685, 0, 0.4588235, 1, 1,
0.2603564, -0.2031231, 2.562579, 0, 0.454902, 1, 1,
0.2609427, -0.4746299, 1.619654, 0, 0.4470588, 1, 1,
0.2634905, 1.768853, -0.2618023, 0, 0.4431373, 1, 1,
0.2672124, 0.6980106, 0.05731598, 0, 0.4352941, 1, 1,
0.2704535, 0.4203106, 0.8152286, 0, 0.4313726, 1, 1,
0.2723977, 0.4139011, 1.286076, 0, 0.4235294, 1, 1,
0.2735739, 1.337821, -0.06240506, 0, 0.4196078, 1, 1,
0.2744027, 0.3178466, 0.5075614, 0, 0.4117647, 1, 1,
0.2757435, 3.65304, -0.753065, 0, 0.4078431, 1, 1,
0.2768433, -0.08174624, 0.5421695, 0, 0.4, 1, 1,
0.2789471, -0.186946, 2.856597, 0, 0.3921569, 1, 1,
0.2822796, -1.1451, 2.073026, 0, 0.3882353, 1, 1,
0.2824882, -0.1108383, 3.468378, 0, 0.3803922, 1, 1,
0.2895313, 1.841343, -0.6149582, 0, 0.3764706, 1, 1,
0.2897988, -0.263168, 0.1510588, 0, 0.3686275, 1, 1,
0.2904572, 0.02106974, 2.664515, 0, 0.3647059, 1, 1,
0.293678, 0.04207716, 2.137945, 0, 0.3568628, 1, 1,
0.2942906, -2.506313, 4.026212, 0, 0.3529412, 1, 1,
0.302956, 1.549737, -0.09819736, 0, 0.345098, 1, 1,
0.3056472, -1.730351, 2.244135, 0, 0.3411765, 1, 1,
0.3122485, 0.7085122, 0.858066, 0, 0.3333333, 1, 1,
0.3157921, 0.9274756, 0.7022896, 0, 0.3294118, 1, 1,
0.3161669, 0.1661748, 1.181361, 0, 0.3215686, 1, 1,
0.3192566, 0.680496, 0.03937352, 0, 0.3176471, 1, 1,
0.3211054, 0.01254508, 1.825496, 0, 0.3098039, 1, 1,
0.3244311, 0.2814479, 0.5486633, 0, 0.3058824, 1, 1,
0.3279015, 2.147266, -0.1569602, 0, 0.2980392, 1, 1,
0.3305208, -1.363766, 3.379984, 0, 0.2901961, 1, 1,
0.3320009, 0.9354542, 1.490266, 0, 0.2862745, 1, 1,
0.337951, 1.234604, -0.181967, 0, 0.2784314, 1, 1,
0.3380881, -1.097522, 2.48333, 0, 0.2745098, 1, 1,
0.3389757, -1.329858, 2.20438, 0, 0.2666667, 1, 1,
0.3453256, -0.5146906, 2.974876, 0, 0.2627451, 1, 1,
0.3475265, 1.034828, 0.8511786, 0, 0.254902, 1, 1,
0.3493365, 0.217451, 1.457076, 0, 0.2509804, 1, 1,
0.350975, -0.8803207, 1.260129, 0, 0.2431373, 1, 1,
0.3561776, -0.1658975, 2.636339, 0, 0.2392157, 1, 1,
0.3579773, 0.9451823, -0.5278392, 0, 0.2313726, 1, 1,
0.3588356, -0.4554142, 2.813181, 0, 0.227451, 1, 1,
0.3602278, -0.3009491, 1.219386, 0, 0.2196078, 1, 1,
0.3606287, 0.1260765, 0.3368394, 0, 0.2156863, 1, 1,
0.3612707, 0.9149467, -0.8003902, 0, 0.2078431, 1, 1,
0.3619372, -1.468547, 2.727463, 0, 0.2039216, 1, 1,
0.3652127, -1.103536, 2.795484, 0, 0.1960784, 1, 1,
0.3700981, 1.084311, -0.1441519, 0, 0.1882353, 1, 1,
0.3719715, 0.5559833, -0.1048205, 0, 0.1843137, 1, 1,
0.3721928, -0.04258827, 2.589289, 0, 0.1764706, 1, 1,
0.3743913, 0.5632189, 1.180948, 0, 0.172549, 1, 1,
0.3805638, 0.6048921, 0.634316, 0, 0.1647059, 1, 1,
0.3826712, -0.3248806, 1.980293, 0, 0.1607843, 1, 1,
0.3838404, -0.3677047, 3.665375, 0, 0.1529412, 1, 1,
0.384293, 0.4354652, 0.5348626, 0, 0.1490196, 1, 1,
0.3847055, -0.03875395, 2.49567, 0, 0.1411765, 1, 1,
0.3894272, 0.1149133, 1.160089, 0, 0.1372549, 1, 1,
0.3898095, -0.3717773, 1.204809, 0, 0.1294118, 1, 1,
0.3899188, -0.09966175, 3.310138, 0, 0.1254902, 1, 1,
0.3901719, -1.334585, 4.756416, 0, 0.1176471, 1, 1,
0.401526, 0.4282988, 0.3452278, 0, 0.1137255, 1, 1,
0.4030354, -0.1713492, 1.005795, 0, 0.1058824, 1, 1,
0.4102479, 0.3184318, 3.10515, 0, 0.09803922, 1, 1,
0.4126252, 1.448943, -0.04244578, 0, 0.09411765, 1, 1,
0.4128211, -0.848143, 1.013935, 0, 0.08627451, 1, 1,
0.4188197, -0.03806626, 2.206471, 0, 0.08235294, 1, 1,
0.4293353, -0.4771084, 1.245068, 0, 0.07450981, 1, 1,
0.4328788, -1.095178, 1.627786, 0, 0.07058824, 1, 1,
0.4334871, 1.440906, 0.88969, 0, 0.0627451, 1, 1,
0.4338373, -0.2171315, 2.50941, 0, 0.05882353, 1, 1,
0.4351232, 2.371492, 1.655742, 0, 0.05098039, 1, 1,
0.4421128, -0.7315726, 1.888615, 0, 0.04705882, 1, 1,
0.4421548, 0.08103975, 1.288532, 0, 0.03921569, 1, 1,
0.4445462, -0.4085806, 1.201075, 0, 0.03529412, 1, 1,
0.4494582, -0.5756937, 5.271778, 0, 0.02745098, 1, 1,
0.4511248, 1.631326, 2.019947, 0, 0.02352941, 1, 1,
0.4524759, -0.5899915, 1.536708, 0, 0.01568628, 1, 1,
0.4529159, -0.533389, 1.562633, 0, 0.01176471, 1, 1,
0.4530521, 0.9022586, -1.050686, 0, 0.003921569, 1, 1,
0.4539234, -0.1742246, 2.906091, 0.003921569, 0, 1, 1,
0.4546894, 1.248614, -0.1978203, 0.007843138, 0, 1, 1,
0.4556189, 2.111148, 0.8717622, 0.01568628, 0, 1, 1,
0.4568419, 0.1034026, 0.6905539, 0.01960784, 0, 1, 1,
0.4571946, 2.155256, 1.841819, 0.02745098, 0, 1, 1,
0.4574983, -0.153827, 3.288216, 0.03137255, 0, 1, 1,
0.4606292, 0.3985866, 0.0861327, 0.03921569, 0, 1, 1,
0.4618402, -0.5279724, 3.16509, 0.04313726, 0, 1, 1,
0.4629747, 0.6195698, 1.477631, 0.05098039, 0, 1, 1,
0.467563, 0.1968097, 1.823426, 0.05490196, 0, 1, 1,
0.4696549, 0.5781627, 0.9247274, 0.0627451, 0, 1, 1,
0.4707926, -0.8814431, 1.478634, 0.06666667, 0, 1, 1,
0.471895, -0.4458455, 1.179299, 0.07450981, 0, 1, 1,
0.4777551, -0.6838682, 2.9507, 0.07843138, 0, 1, 1,
0.4780557, 0.9829426, -2.296777, 0.08627451, 0, 1, 1,
0.4815072, 0.3790504, -0.5359057, 0.09019608, 0, 1, 1,
0.4822718, 0.3912648, 0.6868363, 0.09803922, 0, 1, 1,
0.4844204, -0.8217583, 3.437344, 0.1058824, 0, 1, 1,
0.4957342, -1.06009, 3.290735, 0.1098039, 0, 1, 1,
0.5006409, -0.06579457, 2.121285, 0.1176471, 0, 1, 1,
0.5027727, -1.435551, 3.493458, 0.1215686, 0, 1, 1,
0.5030199, -0.3739768, 2.649189, 0.1294118, 0, 1, 1,
0.5037268, -0.9219832, 1.494116, 0.1333333, 0, 1, 1,
0.5113684, 1.195032, -0.4888973, 0.1411765, 0, 1, 1,
0.5127037, 0.08208963, 3.298278, 0.145098, 0, 1, 1,
0.5129184, -0.4821514, 2.687772, 0.1529412, 0, 1, 1,
0.5136893, 0.9527999, 1.15637, 0.1568628, 0, 1, 1,
0.514231, -0.8410608, 2.817281, 0.1647059, 0, 1, 1,
0.5161217, 1.033224, 1.409635, 0.1686275, 0, 1, 1,
0.5195631, 1.663338, 0.5869252, 0.1764706, 0, 1, 1,
0.5219018, 1.031518, 1.360491, 0.1803922, 0, 1, 1,
0.5228666, -1.65459, 3.432655, 0.1882353, 0, 1, 1,
0.5235744, 0.2659472, 1.910747, 0.1921569, 0, 1, 1,
0.5291712, 0.3744913, -1.259056, 0.2, 0, 1, 1,
0.5297739, -0.4943285, 3.216408, 0.2078431, 0, 1, 1,
0.5298954, -0.4808894, 3.920607, 0.2117647, 0, 1, 1,
0.5308924, 0.7042254, 0.4152313, 0.2196078, 0, 1, 1,
0.5352662, -0.8572455, 3.347192, 0.2235294, 0, 1, 1,
0.5373337, 1.726291, 0.1690759, 0.2313726, 0, 1, 1,
0.5378523, -1.549893, 3.299708, 0.2352941, 0, 1, 1,
0.5444146, 1.732564, -0.3768539, 0.2431373, 0, 1, 1,
0.547798, 1.156265, 0.4064898, 0.2470588, 0, 1, 1,
0.548778, 1.5589, 1.678405, 0.254902, 0, 1, 1,
0.5580103, 0.6380374, 1.364888, 0.2588235, 0, 1, 1,
0.5739931, 0.6975878, 1.017653, 0.2666667, 0, 1, 1,
0.5804624, -0.72063, 1.278809, 0.2705882, 0, 1, 1,
0.5815625, -1.5673, 0.9665195, 0.2784314, 0, 1, 1,
0.584161, 0.3741553, 2.195044, 0.282353, 0, 1, 1,
0.5866984, -1.459809, 4.489275, 0.2901961, 0, 1, 1,
0.59299, 1.870601, 0.9188783, 0.2941177, 0, 1, 1,
0.5943605, 0.02213922, 2.13812, 0.3019608, 0, 1, 1,
0.6006641, 0.7357628, 0.8183192, 0.3098039, 0, 1, 1,
0.6015794, -0.5139427, 2.473343, 0.3137255, 0, 1, 1,
0.6019176, 0.658886, 0.5144438, 0.3215686, 0, 1, 1,
0.6030239, 0.1514151, 0.2784773, 0.3254902, 0, 1, 1,
0.604137, -1.854787, 3.410321, 0.3333333, 0, 1, 1,
0.6048751, 0.00865731, 0.4563069, 0.3372549, 0, 1, 1,
0.6071464, -0.4702113, 3.069298, 0.345098, 0, 1, 1,
0.6100593, 2.254343, -0.07752483, 0.3490196, 0, 1, 1,
0.6152929, -0.306728, 0.6183208, 0.3568628, 0, 1, 1,
0.6159369, 0.6360973, 0.141526, 0.3607843, 0, 1, 1,
0.6189272, 0.1483963, 2.554477, 0.3686275, 0, 1, 1,
0.6205587, 1.057688, 0.9367167, 0.372549, 0, 1, 1,
0.6212012, 0.07895647, 0.3692923, 0.3803922, 0, 1, 1,
0.6240078, 0.5500534, 0.1959465, 0.3843137, 0, 1, 1,
0.6244069, 0.7846134, 2.023249, 0.3921569, 0, 1, 1,
0.6280487, -0.7360881, 3.089041, 0.3960784, 0, 1, 1,
0.6292372, 0.6126209, 0.8140777, 0.4039216, 0, 1, 1,
0.6323465, 0.2708842, 1.312156, 0.4117647, 0, 1, 1,
0.6442444, -1.132645, 4.362119, 0.4156863, 0, 1, 1,
0.6462718, -0.9205013, 0.08022392, 0.4235294, 0, 1, 1,
0.6488706, 1.977666, 0.7345346, 0.427451, 0, 1, 1,
0.6506578, -0.7675787, 3.245032, 0.4352941, 0, 1, 1,
0.6509242, 1.298601, 0.888866, 0.4392157, 0, 1, 1,
0.6566126, -0.4858713, 1.914585, 0.4470588, 0, 1, 1,
0.6614441, 1.066241, 1.01615, 0.4509804, 0, 1, 1,
0.6637616, 2.39387, -0.6599892, 0.4588235, 0, 1, 1,
0.6640859, -1.866172, 2.938382, 0.4627451, 0, 1, 1,
0.6643508, 0.3693866, 1.191761, 0.4705882, 0, 1, 1,
0.6677466, 0.4412894, 2.007155, 0.4745098, 0, 1, 1,
0.6702118, -1.287811, 2.967345, 0.4823529, 0, 1, 1,
0.6709923, 0.2707436, 0.9008895, 0.4862745, 0, 1, 1,
0.6753913, -0.1701594, 2.724055, 0.4941176, 0, 1, 1,
0.6792263, -0.5286382, 3.11328, 0.5019608, 0, 1, 1,
0.6793776, -1.433201, 2.872902, 0.5058824, 0, 1, 1,
0.6795518, 0.6624024, 1.946306, 0.5137255, 0, 1, 1,
0.6967027, 2.3295, 0.2651189, 0.5176471, 0, 1, 1,
0.6988187, 1.780372, 0.5806495, 0.5254902, 0, 1, 1,
0.7023014, -1.554714, 3.033695, 0.5294118, 0, 1, 1,
0.7028632, -0.3400985, 1.302076, 0.5372549, 0, 1, 1,
0.7099183, -0.2389343, 1.294335, 0.5411765, 0, 1, 1,
0.7110614, 1.261843, 0.08085474, 0.5490196, 0, 1, 1,
0.7164524, 0.3509731, 0.6634879, 0.5529412, 0, 1, 1,
0.7181973, 0.3209358, 0.3521794, 0.5607843, 0, 1, 1,
0.7208838, 0.9683295, 2.049085, 0.5647059, 0, 1, 1,
0.7257454, 0.5928319, 0.1914015, 0.572549, 0, 1, 1,
0.7286858, -0.2572091, 1.921968, 0.5764706, 0, 1, 1,
0.7290018, -1.840439, 3.727247, 0.5843138, 0, 1, 1,
0.7298687, 1.181492, 0.2012918, 0.5882353, 0, 1, 1,
0.7343834, 0.63244, 2.327681, 0.5960785, 0, 1, 1,
0.7418374, 1.64462, -1.16906, 0.6039216, 0, 1, 1,
0.7480616, -0.2132271, 0.7209367, 0.6078432, 0, 1, 1,
0.7519957, -0.5058755, 3.004822, 0.6156863, 0, 1, 1,
0.7605127, 1.470609, 1.13537, 0.6196079, 0, 1, 1,
0.7645183, 0.3133956, 1.342267, 0.627451, 0, 1, 1,
0.7674056, -0.3503841, 0.8303296, 0.6313726, 0, 1, 1,
0.7679539, -1.841349, 1.140691, 0.6392157, 0, 1, 1,
0.7800475, -0.1723057, 2.144971, 0.6431373, 0, 1, 1,
0.7806247, 0.1616403, -0.2676163, 0.6509804, 0, 1, 1,
0.7845114, -0.1290036, 0.5007524, 0.654902, 0, 1, 1,
0.784595, 0.0160568, 1.179487, 0.6627451, 0, 1, 1,
0.7863664, 0.2549785, 0.4701478, 0.6666667, 0, 1, 1,
0.7907013, -0.3892772, 1.250704, 0.6745098, 0, 1, 1,
0.7908493, 0.1673573, 0.8181318, 0.6784314, 0, 1, 1,
0.7910869, -0.4972579, 1.71559, 0.6862745, 0, 1, 1,
0.792784, -1.19213, 2.706602, 0.6901961, 0, 1, 1,
0.8076656, -1.037982, 3.454957, 0.6980392, 0, 1, 1,
0.8083025, 2.544699, 1.85609, 0.7058824, 0, 1, 1,
0.8104908, -0.2515247, 2.856179, 0.7098039, 0, 1, 1,
0.814647, -0.2745143, 2.723031, 0.7176471, 0, 1, 1,
0.8150979, 0.2419112, 1.228238, 0.7215686, 0, 1, 1,
0.8212877, -1.74056, 4.075302, 0.7294118, 0, 1, 1,
0.8368505, 1.537316, 1.501125, 0.7333333, 0, 1, 1,
0.8396251, 0.2430365, 2.265829, 0.7411765, 0, 1, 1,
0.8494776, 0.7045664, 0.4821279, 0.7450981, 0, 1, 1,
0.8523622, -0.7881839, 3.654186, 0.7529412, 0, 1, 1,
0.8576878, -0.4459878, 0.5569209, 0.7568628, 0, 1, 1,
0.8590412, 1.635022, 1.02553, 0.7647059, 0, 1, 1,
0.860695, 0.435613, 2.324382, 0.7686275, 0, 1, 1,
0.8614869, 0.1279857, 1.994895, 0.7764706, 0, 1, 1,
0.8636152, 0.2796027, -0.3319758, 0.7803922, 0, 1, 1,
0.8645497, 0.5801626, 1.128203, 0.7882353, 0, 1, 1,
0.867206, 0.8439825, 1.912051, 0.7921569, 0, 1, 1,
0.867224, -2.046585, 3.924011, 0.8, 0, 1, 1,
0.86754, 1.074358, -0.3207277, 0.8078431, 0, 1, 1,
0.8714035, 1.693488, -0.4996032, 0.8117647, 0, 1, 1,
0.8749329, 0.6492944, 0.9504843, 0.8196079, 0, 1, 1,
0.8752179, 1.527968, 0.1142401, 0.8235294, 0, 1, 1,
0.8780996, -1.027138, 1.68209, 0.8313726, 0, 1, 1,
0.8783179, -1.603735, 2.668976, 0.8352941, 0, 1, 1,
0.887729, 0.5792863, 0.6843089, 0.8431373, 0, 1, 1,
0.896611, -1.030019, 3.64477, 0.8470588, 0, 1, 1,
0.9011179, 0.0942503, 0.7487552, 0.854902, 0, 1, 1,
0.9049189, 1.010574, -0.9463803, 0.8588235, 0, 1, 1,
0.9096974, 0.08462135, 2.756823, 0.8666667, 0, 1, 1,
0.9112867, -0.1127987, 0.1966745, 0.8705882, 0, 1, 1,
0.9130598, -0.2174509, 1.783292, 0.8784314, 0, 1, 1,
0.913831, -0.5457103, 2.999945, 0.8823529, 0, 1, 1,
0.9157217, -0.8052552, 3.487442, 0.8901961, 0, 1, 1,
0.916746, -0.02292147, 2.255991, 0.8941177, 0, 1, 1,
0.9228063, -0.6967372, 1.599729, 0.9019608, 0, 1, 1,
0.923783, 1.199942, 1.707762, 0.9098039, 0, 1, 1,
0.9271109, -0.8859929, 0.8140512, 0.9137255, 0, 1, 1,
0.9291875, 0.4230643, 0.670724, 0.9215686, 0, 1, 1,
0.9312769, -0.6492324, 3.139152, 0.9254902, 0, 1, 1,
0.9335468, 1.093738, -1.078034, 0.9333333, 0, 1, 1,
0.9370957, 1.523748, -0.4878267, 0.9372549, 0, 1, 1,
0.9460953, -0.6840393, 0.3742663, 0.945098, 0, 1, 1,
0.9484524, 0.7741238, -1.355505, 0.9490196, 0, 1, 1,
0.9533638, -0.3561622, 1.421765, 0.9568627, 0, 1, 1,
0.9538057, -0.9373569, 1.897807, 0.9607843, 0, 1, 1,
0.9570406, -1.722849, 3.508897, 0.9686275, 0, 1, 1,
0.9715502, -0.5457623, 2.753245, 0.972549, 0, 1, 1,
0.9716948, -0.4506081, 3.319127, 0.9803922, 0, 1, 1,
0.9769763, 2.820605, 1.393997, 0.9843137, 0, 1, 1,
0.9818436, 0.3281687, 1.774974, 0.9921569, 0, 1, 1,
0.9828773, 0.8796814, 2.939508, 0.9960784, 0, 1, 1,
0.9896911, 0.04007505, 2.713993, 1, 0, 0.9960784, 1,
0.9918697, 0.5355404, 1.612005, 1, 0, 0.9882353, 1,
0.9963398, -0.4348425, 1.655362, 1, 0, 0.9843137, 1,
0.9980267, 1.479167, -0.02669223, 1, 0, 0.9764706, 1,
1.001794, -0.1356072, 2.679709, 1, 0, 0.972549, 1,
1.005162, 0.6770417, 0.5671608, 1, 0, 0.9647059, 1,
1.00599, -1.122477, 3.445877, 1, 0, 0.9607843, 1,
1.01201, -0.320179, 0.1355913, 1, 0, 0.9529412, 1,
1.012937, 0.57212, 2.076028, 1, 0, 0.9490196, 1,
1.016439, 0.423493, 2.128606, 1, 0, 0.9411765, 1,
1.02564, -1.993818, 2.656267, 1, 0, 0.9372549, 1,
1.031031, 0.4938628, -0.05959921, 1, 0, 0.9294118, 1,
1.03176, 0.2996665, 2.215704, 1, 0, 0.9254902, 1,
1.035972, 0.5087519, 2.984963, 1, 0, 0.9176471, 1,
1.0407, 0.004528034, 2.881138, 1, 0, 0.9137255, 1,
1.04466, 0.6120363, 2.412371, 1, 0, 0.9058824, 1,
1.047146, -1.663462, 4.708928, 1, 0, 0.9019608, 1,
1.049472, -1.027505, 2.486233, 1, 0, 0.8941177, 1,
1.0611, -0.8058453, 2.819902, 1, 0, 0.8862745, 1,
1.063449, -0.9675473, 3.26886, 1, 0, 0.8823529, 1,
1.069335, 0.1663544, 1.612747, 1, 0, 0.8745098, 1,
1.070028, -1.374061, 2.731205, 1, 0, 0.8705882, 1,
1.085077, -0.6448623, 1.636785, 1, 0, 0.8627451, 1,
1.094757, -0.6567566, 2.669867, 1, 0, 0.8588235, 1,
1.101592, -0.8925449, 2.503387, 1, 0, 0.8509804, 1,
1.10404, -1.032763, 3.366029, 1, 0, 0.8470588, 1,
1.105296, -0.03942828, 3.120672, 1, 0, 0.8392157, 1,
1.10561, 0.7438594, 0.6998534, 1, 0, 0.8352941, 1,
1.108732, 2.422526, 2.720192, 1, 0, 0.827451, 1,
1.113225, 1.423553, -1.375042, 1, 0, 0.8235294, 1,
1.114899, 0.4494682, -0.1174751, 1, 0, 0.8156863, 1,
1.115787, 0.6019514, 0.3126766, 1, 0, 0.8117647, 1,
1.118773, -1.461014, 2.483768, 1, 0, 0.8039216, 1,
1.12306, -0.1737341, 2.397587, 1, 0, 0.7960784, 1,
1.127747, 1.235043, 0.05885469, 1, 0, 0.7921569, 1,
1.131067, -0.08229794, 3.859996, 1, 0, 0.7843137, 1,
1.135389, -0.1612354, 1.945071, 1, 0, 0.7803922, 1,
1.137166, 1.177699, 2.421393, 1, 0, 0.772549, 1,
1.144688, -1.143408, 2.325365, 1, 0, 0.7686275, 1,
1.149688, -0.6911032, 1.213204, 1, 0, 0.7607843, 1,
1.153847, 0.01665146, 0.3800306, 1, 0, 0.7568628, 1,
1.176084, 0.460097, -0.1943156, 1, 0, 0.7490196, 1,
1.181163, -0.8071468, 2.38609, 1, 0, 0.7450981, 1,
1.18145, 2.122442, 0.9495848, 1, 0, 0.7372549, 1,
1.182271, 0.6508039, 4.123518, 1, 0, 0.7333333, 1,
1.184389, 1.565186, 2.492668, 1, 0, 0.7254902, 1,
1.186344, 1.285732, 1.593121, 1, 0, 0.7215686, 1,
1.194748, -0.166196, 1.109775, 1, 0, 0.7137255, 1,
1.194987, 0.4285498, 3.520561, 1, 0, 0.7098039, 1,
1.200991, 1.367118, 0.6107693, 1, 0, 0.7019608, 1,
1.206207, -0.5378887, 3.38729, 1, 0, 0.6941177, 1,
1.211958, 0.05087303, 1.147342, 1, 0, 0.6901961, 1,
1.220693, -2.865313, 3.329514, 1, 0, 0.682353, 1,
1.227466, 0.7768467, 0.5331932, 1, 0, 0.6784314, 1,
1.230575, 1.342341, 1.730503, 1, 0, 0.6705883, 1,
1.231711, 1.46235, 1.925681, 1, 0, 0.6666667, 1,
1.239452, 0.5938717, 0.0027261, 1, 0, 0.6588235, 1,
1.241364, -0.3074457, 3.188733, 1, 0, 0.654902, 1,
1.242343, 0.6843615, 0.7224235, 1, 0, 0.6470588, 1,
1.255059, 0.1462666, -0.3370346, 1, 0, 0.6431373, 1,
1.25975, 0.8393086, 1.360785, 1, 0, 0.6352941, 1,
1.260547, -2.124105, 3.30212, 1, 0, 0.6313726, 1,
1.260702, -1.505485, 2.41412, 1, 0, 0.6235294, 1,
1.260719, -1.403868, 2.032354, 1, 0, 0.6196079, 1,
1.274036, 1.330387, 0.4235388, 1, 0, 0.6117647, 1,
1.276166, -0.8207787, 2.538499, 1, 0, 0.6078432, 1,
1.280928, 0.1641987, 2.41591, 1, 0, 0.6, 1,
1.281254, 0.7624959, 1.76492, 1, 0, 0.5921569, 1,
1.281317, -1.405742, 2.006016, 1, 0, 0.5882353, 1,
1.299968, 0.2567042, 0.8873732, 1, 0, 0.5803922, 1,
1.305031, -0.6502922, 1.637973, 1, 0, 0.5764706, 1,
1.312871, 0.3148792, 1.514559, 1, 0, 0.5686275, 1,
1.317186, 1.30222, -0.5597579, 1, 0, 0.5647059, 1,
1.324792, -1.325989, 2.810844, 1, 0, 0.5568628, 1,
1.326405, 1.170772, 0.52735, 1, 0, 0.5529412, 1,
1.327859, 1.634172, 0.926972, 1, 0, 0.5450981, 1,
1.329374, -0.04728528, 1.523612, 1, 0, 0.5411765, 1,
1.346695, -0.2712162, 2.449911, 1, 0, 0.5333334, 1,
1.360884, -1.029278, 2.789206, 1, 0, 0.5294118, 1,
1.365064, 0.5854935, 0.6115376, 1, 0, 0.5215687, 1,
1.365317, -1.817302, 1.989264, 1, 0, 0.5176471, 1,
1.37005, -0.8173114, 1.349302, 1, 0, 0.509804, 1,
1.400336, 1.883226, 0.4322974, 1, 0, 0.5058824, 1,
1.4023, -0.1092122, 1.371926, 1, 0, 0.4980392, 1,
1.405647, -0.9888293, 1.319359, 1, 0, 0.4901961, 1,
1.422976, -1.555161, 4.129336, 1, 0, 0.4862745, 1,
1.436425, -1.935642, 3.199313, 1, 0, 0.4784314, 1,
1.458628, -0.385095, 1.300139, 1, 0, 0.4745098, 1,
1.466783, 0.4070173, 1.215778, 1, 0, 0.4666667, 1,
1.476099, 0.1437908, -0.2995474, 1, 0, 0.4627451, 1,
1.480004, -0.4751874, 1.953022, 1, 0, 0.454902, 1,
1.481392, -0.0591702, 1.25727, 1, 0, 0.4509804, 1,
1.48156, 0.007208018, 1.18133, 1, 0, 0.4431373, 1,
1.483199, -0.392304, 3.01431, 1, 0, 0.4392157, 1,
1.485544, -0.8855756, 0.2827938, 1, 0, 0.4313726, 1,
1.492209, -1.880459, 3.461456, 1, 0, 0.427451, 1,
1.500162, -0.8761637, 3.066195, 1, 0, 0.4196078, 1,
1.538072, 1.402528, 1.203333, 1, 0, 0.4156863, 1,
1.548941, -0.4107079, 2.348281, 1, 0, 0.4078431, 1,
1.561796, 0.6823512, -0.70816, 1, 0, 0.4039216, 1,
1.563905, 0.4932608, 2.956028, 1, 0, 0.3960784, 1,
1.566588, 0.05987034, 2.962385, 1, 0, 0.3882353, 1,
1.572477, -1.302206, 1.357408, 1, 0, 0.3843137, 1,
1.606804, -0.5956096, 1.779175, 1, 0, 0.3764706, 1,
1.615529, -0.7813429, 0.8145805, 1, 0, 0.372549, 1,
1.620929, 0.005326964, 1.75225, 1, 0, 0.3647059, 1,
1.626775, 0.4041128, 1.232955, 1, 0, 0.3607843, 1,
1.634571, 0.5175564, 0.9886059, 1, 0, 0.3529412, 1,
1.644912, -0.6851296, 2.173713, 1, 0, 0.3490196, 1,
1.659149, 1.487601, -0.8032355, 1, 0, 0.3411765, 1,
1.707652, -0.1837301, 2.971592, 1, 0, 0.3372549, 1,
1.71307, 2.048387, 1.836302, 1, 0, 0.3294118, 1,
1.720951, -0.3398295, 0.3524385, 1, 0, 0.3254902, 1,
1.72879, 1.278793, 0.6895407, 1, 0, 0.3176471, 1,
1.72923, 1.328271, 1.033584, 1, 0, 0.3137255, 1,
1.742224, 1.527159, 0.1147642, 1, 0, 0.3058824, 1,
1.759452, 1.40576, 0.7681305, 1, 0, 0.2980392, 1,
1.763108, -1.018836, 3.338427, 1, 0, 0.2941177, 1,
1.785024, 1.537723, -0.3131635, 1, 0, 0.2862745, 1,
1.786565, 1.398148, 1.857431, 1, 0, 0.282353, 1,
1.798607, 0.5672778, 1.965696, 1, 0, 0.2745098, 1,
1.79924, -0.5040644, 0.9504683, 1, 0, 0.2705882, 1,
1.8039, 1.220678, 0.1479701, 1, 0, 0.2627451, 1,
1.81927, -1.377676, 0.8814843, 1, 0, 0.2588235, 1,
1.823793, 1.413035, 0.5775117, 1, 0, 0.2509804, 1,
1.872649, -0.772658, 2.375733, 1, 0, 0.2470588, 1,
1.88141, 0.6147342, 2.069322, 1, 0, 0.2392157, 1,
1.884687, 0.7136228, 1.862917, 1, 0, 0.2352941, 1,
1.888338, -0.8123049, 2.157146, 1, 0, 0.227451, 1,
1.912637, 0.409209, 0.4815202, 1, 0, 0.2235294, 1,
1.923807, -0.5503268, 2.64519, 1, 0, 0.2156863, 1,
1.940207, -0.2622209, 3.19321, 1, 0, 0.2117647, 1,
1.942773, 0.559514, 0.5369248, 1, 0, 0.2039216, 1,
1.950893, -0.06195308, 1.080166, 1, 0, 0.1960784, 1,
1.989442, -0.4802333, 4.592822, 1, 0, 0.1921569, 1,
1.992964, -1.583216, 1.612115, 1, 0, 0.1843137, 1,
2.005516, -0.5169041, 1.08867, 1, 0, 0.1803922, 1,
2.019454, 0.5078031, 1.770579, 1, 0, 0.172549, 1,
2.042957, -0.6954477, 1.881594, 1, 0, 0.1686275, 1,
2.051775, -0.712644, 2.952141, 1, 0, 0.1607843, 1,
2.052062, -1.115179, 1.038307, 1, 0, 0.1568628, 1,
2.059123, 1.398407, 1.580686, 1, 0, 0.1490196, 1,
2.12553, 0.1099264, 0.2299682, 1, 0, 0.145098, 1,
2.127314, -0.5213617, 2.485269, 1, 0, 0.1372549, 1,
2.127684, -0.7323084, 1.470905, 1, 0, 0.1333333, 1,
2.188144, 0.08719291, 1.142523, 1, 0, 0.1254902, 1,
2.258144, -0.3431906, 1.543959, 1, 0, 0.1215686, 1,
2.261608, 1.017321, 1.037484, 1, 0, 0.1137255, 1,
2.266851, 0.05289521, 2.417907, 1, 0, 0.1098039, 1,
2.273559, 0.7487073, 3.171206, 1, 0, 0.1019608, 1,
2.315184, 1.119641, 1.319259, 1, 0, 0.09411765, 1,
2.373546, 1.328265, 2.73804, 1, 0, 0.09019608, 1,
2.373561, 0.5677755, 3.275555, 1, 0, 0.08235294, 1,
2.384535, -0.04552407, 0.8719758, 1, 0, 0.07843138, 1,
2.43171, -0.6181327, 0.8285115, 1, 0, 0.07058824, 1,
2.498642, -1.863518, 3.139915, 1, 0, 0.06666667, 1,
2.517857, 0.5136818, 0.7054175, 1, 0, 0.05882353, 1,
2.625293, 0.0758772, 2.932167, 1, 0, 0.05490196, 1,
2.781055, 0.6409196, 0.3973494, 1, 0, 0.04705882, 1,
2.871814, 1.631392, 2.890096, 1, 0, 0.04313726, 1,
2.888221, -0.5825704, 1.422267, 1, 0, 0.03529412, 1,
2.907813, 0.4243896, 1.750734, 1, 0, 0.03137255, 1,
2.926068, -0.2934535, 0.9712922, 1, 0, 0.02352941, 1,
3.002033, -0.3205862, 0.3477509, 1, 0, 0.01960784, 1,
3.507387, -0.2267532, 1.602981, 1, 0, 0.01176471, 1,
3.546207, -2.416795, -0.1004993, 1, 0, 0.007843138, 1
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
-0.2115195, -4.112545, -7.794704, 0, -0.5, 0.5, 0.5,
-0.2115195, -4.112545, -7.794704, 1, -0.5, 0.5, 0.5,
-0.2115195, -4.112545, -7.794704, 1, 1.5, 0.5, 0.5,
-0.2115195, -4.112545, -7.794704, 0, 1.5, 0.5, 0.5
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
-5.243115, 0.3329951, -7.794704, 0, -0.5, 0.5, 0.5,
-5.243115, 0.3329951, -7.794704, 1, -0.5, 0.5, 0.5,
-5.243115, 0.3329951, -7.794704, 1, 1.5, 0.5, 0.5,
-5.243115, 0.3329951, -7.794704, 0, 1.5, 0.5, 0.5
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
-5.243115, -4.112545, -0.3145761, 0, -0.5, 0.5, 0.5,
-5.243115, -4.112545, -0.3145761, 1, -0.5, 0.5, 0.5,
-5.243115, -4.112545, -0.3145761, 1, 1.5, 0.5, 0.5,
-5.243115, -4.112545, -0.3145761, 0, 1.5, 0.5, 0.5
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
-2, -3.086651, -6.068521,
2, -3.086651, -6.068521,
-2, -3.086651, -6.068521,
-2, -3.257633, -6.356218,
0, -3.086651, -6.068521,
0, -3.257633, -6.356218,
2, -3.086651, -6.068521,
2, -3.257633, -6.356218
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
-2, -3.599598, -6.931613, 0, -0.5, 0.5, 0.5,
-2, -3.599598, -6.931613, 1, -0.5, 0.5, 0.5,
-2, -3.599598, -6.931613, 1, 1.5, 0.5, 0.5,
-2, -3.599598, -6.931613, 0, 1.5, 0.5, 0.5,
0, -3.599598, -6.931613, 0, -0.5, 0.5, 0.5,
0, -3.599598, -6.931613, 1, -0.5, 0.5, 0.5,
0, -3.599598, -6.931613, 1, 1.5, 0.5, 0.5,
0, -3.599598, -6.931613, 0, 1.5, 0.5, 0.5,
2, -3.599598, -6.931613, 0, -0.5, 0.5, 0.5,
2, -3.599598, -6.931613, 1, -0.5, 0.5, 0.5,
2, -3.599598, -6.931613, 1, 1.5, 0.5, 0.5,
2, -3.599598, -6.931613, 0, 1.5, 0.5, 0.5
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
-4.081978, -2, -6.068521,
-4.081978, 3, -6.068521,
-4.081978, -2, -6.068521,
-4.275501, -2, -6.356218,
-4.081978, -1, -6.068521,
-4.275501, -1, -6.356218,
-4.081978, 0, -6.068521,
-4.275501, 0, -6.356218,
-4.081978, 1, -6.068521,
-4.275501, 1, -6.356218,
-4.081978, 2, -6.068521,
-4.275501, 2, -6.356218,
-4.081978, 3, -6.068521,
-4.275501, 3, -6.356218
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
-4.662547, -2, -6.931613, 0, -0.5, 0.5, 0.5,
-4.662547, -2, -6.931613, 1, -0.5, 0.5, 0.5,
-4.662547, -2, -6.931613, 1, 1.5, 0.5, 0.5,
-4.662547, -2, -6.931613, 0, 1.5, 0.5, 0.5,
-4.662547, -1, -6.931613, 0, -0.5, 0.5, 0.5,
-4.662547, -1, -6.931613, 1, -0.5, 0.5, 0.5,
-4.662547, -1, -6.931613, 1, 1.5, 0.5, 0.5,
-4.662547, -1, -6.931613, 0, 1.5, 0.5, 0.5,
-4.662547, 0, -6.931613, 0, -0.5, 0.5, 0.5,
-4.662547, 0, -6.931613, 1, -0.5, 0.5, 0.5,
-4.662547, 0, -6.931613, 1, 1.5, 0.5, 0.5,
-4.662547, 0, -6.931613, 0, 1.5, 0.5, 0.5,
-4.662547, 1, -6.931613, 0, -0.5, 0.5, 0.5,
-4.662547, 1, -6.931613, 1, -0.5, 0.5, 0.5,
-4.662547, 1, -6.931613, 1, 1.5, 0.5, 0.5,
-4.662547, 1, -6.931613, 0, 1.5, 0.5, 0.5,
-4.662547, 2, -6.931613, 0, -0.5, 0.5, 0.5,
-4.662547, 2, -6.931613, 1, -0.5, 0.5, 0.5,
-4.662547, 2, -6.931613, 1, 1.5, 0.5, 0.5,
-4.662547, 2, -6.931613, 0, 1.5, 0.5, 0.5,
-4.662547, 3, -6.931613, 0, -0.5, 0.5, 0.5,
-4.662547, 3, -6.931613, 1, -0.5, 0.5, 0.5,
-4.662547, 3, -6.931613, 1, 1.5, 0.5, 0.5,
-4.662547, 3, -6.931613, 0, 1.5, 0.5, 0.5
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
-4.081978, -3.086651, -4,
-4.081978, -3.086651, 4,
-4.081978, -3.086651, -4,
-4.275501, -3.257633, -4,
-4.081978, -3.086651, -2,
-4.275501, -3.257633, -2,
-4.081978, -3.086651, 0,
-4.275501, -3.257633, 0,
-4.081978, -3.086651, 2,
-4.275501, -3.257633, 2,
-4.081978, -3.086651, 4,
-4.275501, -3.257633, 4
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
-4.662547, -3.599598, -4, 0, -0.5, 0.5, 0.5,
-4.662547, -3.599598, -4, 1, -0.5, 0.5, 0.5,
-4.662547, -3.599598, -4, 1, 1.5, 0.5, 0.5,
-4.662547, -3.599598, -4, 0, 1.5, 0.5, 0.5,
-4.662547, -3.599598, -2, 0, -0.5, 0.5, 0.5,
-4.662547, -3.599598, -2, 1, -0.5, 0.5, 0.5,
-4.662547, -3.599598, -2, 1, 1.5, 0.5, 0.5,
-4.662547, -3.599598, -2, 0, 1.5, 0.5, 0.5,
-4.662547, -3.599598, 0, 0, -0.5, 0.5, 0.5,
-4.662547, -3.599598, 0, 1, -0.5, 0.5, 0.5,
-4.662547, -3.599598, 0, 1, 1.5, 0.5, 0.5,
-4.662547, -3.599598, 0, 0, 1.5, 0.5, 0.5,
-4.662547, -3.599598, 2, 0, -0.5, 0.5, 0.5,
-4.662547, -3.599598, 2, 1, -0.5, 0.5, 0.5,
-4.662547, -3.599598, 2, 1, 1.5, 0.5, 0.5,
-4.662547, -3.599598, 2, 0, 1.5, 0.5, 0.5,
-4.662547, -3.599598, 4, 0, -0.5, 0.5, 0.5,
-4.662547, -3.599598, 4, 1, -0.5, 0.5, 0.5,
-4.662547, -3.599598, 4, 1, 1.5, 0.5, 0.5,
-4.662547, -3.599598, 4, 0, 1.5, 0.5, 0.5
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
-4.081978, -3.086651, -6.068521,
-4.081978, 3.752641, -6.068521,
-4.081978, -3.086651, 5.439369,
-4.081978, 3.752641, 5.439369,
-4.081978, -3.086651, -6.068521,
-4.081978, -3.086651, 5.439369,
-4.081978, 3.752641, -6.068521,
-4.081978, 3.752641, 5.439369,
-4.081978, -3.086651, -6.068521,
3.658939, -3.086651, -6.068521,
-4.081978, -3.086651, 5.439369,
3.658939, -3.086651, 5.439369,
-4.081978, 3.752641, -6.068521,
3.658939, 3.752641, -6.068521,
-4.081978, 3.752641, 5.439369,
3.658939, 3.752641, 5.439369,
3.658939, -3.086651, -6.068521,
3.658939, 3.752641, -6.068521,
3.658939, -3.086651, 5.439369,
3.658939, 3.752641, 5.439369,
3.658939, -3.086651, -6.068521,
3.658939, -3.086651, 5.439369,
3.658939, 3.752641, -6.068521,
3.658939, 3.752641, 5.439369
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
var radius = 8.257371;
var distance = 36.73798;
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
mvMatrix.translate( 0.2115195, -0.3329951, 0.3145761 );
mvMatrix.scale( 1.153356, 1.305403, 0.7758183 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.73798);
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
monosodium_arsenate_<-read.table("monosodium_arsenate_.xyz", skip=1)
x<-monosodium_arsenate_$V2
y<-monosodium_arsenate_$V3
z<-monosodium_arsenate_$V4
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
10, 10, 2, 0, 0, 1, 1, 1,
3, 5, 1, 1, 0, 0, 1, 1,
7, 6, 1, 1, 0, 0, 1, 1,
2, 7, 1, 1, 0, 0, 1, 1,
6, 2, 1, 1, 0, 0, 1, 1,
4, 3, 1, 1, 0, 0, 1, 1,
4, 4, 1, 0, 0, 0, 1, 1,
4, 8, 1, 0, 0, 0, 1, 1,
8, 4, 1, 0, 0, 0, 1, 1,
5, 4, 1, 0, 0, 0, 1, 1,
9, 1, 1, 0, 0, 0, 1, 1,
1, 9, 1, 0, 0, 0, 1, 1
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
var radius = 8.713639;
var distance = 30.60629;
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
mvMatrix.translate( -5.5, -5.5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -30.60629);
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
for (var i = 0; i < 12; i++) {
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
