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
-3.221658, -0.4758624, -1.840449, 1, 0, 0, 1,
-2.934264, -0.4815914, -1.443771, 1, 0.007843138, 0, 1,
-2.622291, 0.869229, -4.838681, 1, 0.01176471, 0, 1,
-2.488406, -0.8395935, -1.293379, 1, 0.01960784, 0, 1,
-2.35986, -0.3136248, -0.6200668, 1, 0.02352941, 0, 1,
-2.34581, 0.6238125, -2.07271, 1, 0.03137255, 0, 1,
-2.335609, 0.1009055, -1.643218, 1, 0.03529412, 0, 1,
-2.272505, -0.5594652, -2.658813, 1, 0.04313726, 0, 1,
-2.266218, 0.2459728, -2.867646, 1, 0.04705882, 0, 1,
-2.23876, -0.5480174, -0.6494699, 1, 0.05490196, 0, 1,
-2.19597, 0.8857701, -2.113873, 1, 0.05882353, 0, 1,
-2.172733, -0.4047007, -3.504582, 1, 0.06666667, 0, 1,
-2.048905, 0.2610322, -0.02351449, 1, 0.07058824, 0, 1,
-2.047155, -1.282495, -3.007846, 1, 0.07843138, 0, 1,
-2.025311, 0.9381354, -1.101263, 1, 0.08235294, 0, 1,
-1.973492, 0.3763048, -1.261187, 1, 0.09019608, 0, 1,
-1.968028, -0.104561, -2.420089, 1, 0.09411765, 0, 1,
-1.960751, -1.299647, -3.319215, 1, 0.1019608, 0, 1,
-1.952616, 0.1738278, -1.059388, 1, 0.1098039, 0, 1,
-1.926344, -0.9643448, -2.615349, 1, 0.1137255, 0, 1,
-1.921878, -1.456259, -1.857778, 1, 0.1215686, 0, 1,
-1.889535, -0.7795628, -1.466534, 1, 0.1254902, 0, 1,
-1.86868, 1.723114, -0.7167216, 1, 0.1333333, 0, 1,
-1.851501, 0.5818325, -0.2108514, 1, 0.1372549, 0, 1,
-1.850261, -0.4480327, -3.221175, 1, 0.145098, 0, 1,
-1.828688, 0.7704532, 0.6288434, 1, 0.1490196, 0, 1,
-1.825107, 0.9618081, 1.00877, 1, 0.1568628, 0, 1,
-1.815091, 1.044337, -0.5428561, 1, 0.1607843, 0, 1,
-1.811718, -1.203096, -3.452514, 1, 0.1686275, 0, 1,
-1.800809, -0.2069797, -1.661497, 1, 0.172549, 0, 1,
-1.795271, -0.5390304, -4.874115, 1, 0.1803922, 0, 1,
-1.789976, -0.1619432, -2.303509, 1, 0.1843137, 0, 1,
-1.776812, 0.04325049, -1.819222, 1, 0.1921569, 0, 1,
-1.7764, -0.2726356, -1.857618, 1, 0.1960784, 0, 1,
-1.773267, -0.4645869, -2.0387, 1, 0.2039216, 0, 1,
-1.750956, 0.7638689, -2.298561, 1, 0.2117647, 0, 1,
-1.738878, 1.401561, -0.4714437, 1, 0.2156863, 0, 1,
-1.73614, -1.34828, -2.40093, 1, 0.2235294, 0, 1,
-1.70734, -1.245914, -1.813047, 1, 0.227451, 0, 1,
-1.685549, 0.531351, -0.1393945, 1, 0.2352941, 0, 1,
-1.672714, -0.555548, -1.795923, 1, 0.2392157, 0, 1,
-1.662471, -1.517675, -0.6920015, 1, 0.2470588, 0, 1,
-1.654845, 0.06494752, -2.767441, 1, 0.2509804, 0, 1,
-1.634582, 2.850468, -1.818599, 1, 0.2588235, 0, 1,
-1.615343, 0.4955795, 0.4173521, 1, 0.2627451, 0, 1,
-1.612446, -0.5301173, -2.470784, 1, 0.2705882, 0, 1,
-1.60669, -0.4721014, -2.158769, 1, 0.2745098, 0, 1,
-1.601421, 0.2777535, -1.53466, 1, 0.282353, 0, 1,
-1.598889, -0.9135451, -0.8187373, 1, 0.2862745, 0, 1,
-1.590612, 1.416249, -0.6181504, 1, 0.2941177, 0, 1,
-1.579726, 0.505769, -1.291612, 1, 0.3019608, 0, 1,
-1.572902, 0.9388936, -2.18704, 1, 0.3058824, 0, 1,
-1.558453, 0.9771217, -0.648922, 1, 0.3137255, 0, 1,
-1.55645, -0.5172712, -3.27402, 1, 0.3176471, 0, 1,
-1.539456, -0.429391, -1.642692, 1, 0.3254902, 0, 1,
-1.537036, 0.2587364, -1.800686, 1, 0.3294118, 0, 1,
-1.534624, 0.1540424, -2.422707, 1, 0.3372549, 0, 1,
-1.52626, 0.4885367, -0.6095964, 1, 0.3411765, 0, 1,
-1.515837, -0.2876349, -1.924595, 1, 0.3490196, 0, 1,
-1.511795, 0.7603797, 0.6648943, 1, 0.3529412, 0, 1,
-1.509693, 0.2496519, 0.5717972, 1, 0.3607843, 0, 1,
-1.508588, -0.9445257, -0.2494775, 1, 0.3647059, 0, 1,
-1.501088, 0.1287704, -2.621737, 1, 0.372549, 0, 1,
-1.497468, -0.0009010995, -0.3014122, 1, 0.3764706, 0, 1,
-1.496974, -0.3406085, -2.111218, 1, 0.3843137, 0, 1,
-1.496586, 0.4276001, -2.376189, 1, 0.3882353, 0, 1,
-1.485654, -0.241211, -1.71205, 1, 0.3960784, 0, 1,
-1.482901, -0.3602875, 0.8896763, 1, 0.4039216, 0, 1,
-1.476684, 0.1953183, -2.589288, 1, 0.4078431, 0, 1,
-1.476562, 0.8925919, -0.9785117, 1, 0.4156863, 0, 1,
-1.474293, 0.2572657, -0.9987568, 1, 0.4196078, 0, 1,
-1.473677, -0.5016796, -2.81024, 1, 0.427451, 0, 1,
-1.471293, 1.096092, -1.211861, 1, 0.4313726, 0, 1,
-1.471056, -0.2130054, -2.678083, 1, 0.4392157, 0, 1,
-1.465172, -2.082092, -1.42327, 1, 0.4431373, 0, 1,
-1.46228, 0.3525312, -0.8259555, 1, 0.4509804, 0, 1,
-1.444441, -0.07284034, -1.591442, 1, 0.454902, 0, 1,
-1.444002, 1.275291, -2.211685, 1, 0.4627451, 0, 1,
-1.44199, -0.1269811, -2.143345, 1, 0.4666667, 0, 1,
-1.42919, -0.5836484, -1.359174, 1, 0.4745098, 0, 1,
-1.426853, -0.3759387, -0.9454679, 1, 0.4784314, 0, 1,
-1.417613, -0.23999, -1.919504, 1, 0.4862745, 0, 1,
-1.403371, 0.685589, -1.267756, 1, 0.4901961, 0, 1,
-1.395793, -0.8984541, -2.179813, 1, 0.4980392, 0, 1,
-1.383882, 0.2024936, -1.838382, 1, 0.5058824, 0, 1,
-1.37362, 0.6089015, -0.9400406, 1, 0.509804, 0, 1,
-1.359145, -1.387103, -3.245967, 1, 0.5176471, 0, 1,
-1.347846, 0.3295725, -2.764688, 1, 0.5215687, 0, 1,
-1.347646, -0.3466057, -1.986958, 1, 0.5294118, 0, 1,
-1.347209, -1.615374, -0.9935303, 1, 0.5333334, 0, 1,
-1.331144, -0.9608935, -3.208857, 1, 0.5411765, 0, 1,
-1.30934, -0.5002954, -2.07138, 1, 0.5450981, 0, 1,
-1.298811, -0.4344329, -0.1856619, 1, 0.5529412, 0, 1,
-1.297307, -1.959523, -0.8028983, 1, 0.5568628, 0, 1,
-1.293493, -0.5409533, -3.41056, 1, 0.5647059, 0, 1,
-1.287789, -1.485046, -2.55596, 1, 0.5686275, 0, 1,
-1.286076, -0.7372868, -1.381904, 1, 0.5764706, 0, 1,
-1.283814, -0.2819918, -1.262981, 1, 0.5803922, 0, 1,
-1.282528, -0.3833937, -1.787851, 1, 0.5882353, 0, 1,
-1.281964, 0.09761975, -1.94277, 1, 0.5921569, 0, 1,
-1.27706, 1.113588, 0.3380449, 1, 0.6, 0, 1,
-1.273701, -0.1650657, -1.706482, 1, 0.6078432, 0, 1,
-1.269371, 0.3400975, -0.5984235, 1, 0.6117647, 0, 1,
-1.268493, -0.3016757, -1.914918, 1, 0.6196079, 0, 1,
-1.263924, -0.05448074, -1.915764, 1, 0.6235294, 0, 1,
-1.260662, 1.198491, -1.734083, 1, 0.6313726, 0, 1,
-1.25375, -1.297938, -3.530127, 1, 0.6352941, 0, 1,
-1.25266, -0.2037236, -1.231725, 1, 0.6431373, 0, 1,
-1.252539, -0.3010224, 0.9932501, 1, 0.6470588, 0, 1,
-1.250157, -1.058209, -3.239436, 1, 0.654902, 0, 1,
-1.241537, -2.179746, -2.493571, 1, 0.6588235, 0, 1,
-1.239273, 0.2028562, -1.175603, 1, 0.6666667, 0, 1,
-1.220678, -0.592194, -1.282219, 1, 0.6705883, 0, 1,
-1.216303, 2.148466, -0.8487043, 1, 0.6784314, 0, 1,
-1.21464, -0.3356588, -0.7723709, 1, 0.682353, 0, 1,
-1.212085, -0.2525745, -2.367269, 1, 0.6901961, 0, 1,
-1.195988, -0.1020681, -0.23667, 1, 0.6941177, 0, 1,
-1.194667, 0.1614257, -0.8973458, 1, 0.7019608, 0, 1,
-1.189596, -0.1056625, -2.214492, 1, 0.7098039, 0, 1,
-1.176232, 1.330457, 0.1494691, 1, 0.7137255, 0, 1,
-1.172891, 0.6474082, -2.388437, 1, 0.7215686, 0, 1,
-1.159967, 0.8529559, -1.278615, 1, 0.7254902, 0, 1,
-1.154241, -0.1478187, -0.4872721, 1, 0.7333333, 0, 1,
-1.146512, -1.617831, -0.9837296, 1, 0.7372549, 0, 1,
-1.146268, 1.156962, -1.192738, 1, 0.7450981, 0, 1,
-1.145936, -1.643388, -4.609062, 1, 0.7490196, 0, 1,
-1.143444, 0.9384615, 1.272976, 1, 0.7568628, 0, 1,
-1.139188, -0.5005355, -0.2066443, 1, 0.7607843, 0, 1,
-1.136506, 0.8992314, -1.315558, 1, 0.7686275, 0, 1,
-1.128969, -0.5466231, -2.195175, 1, 0.772549, 0, 1,
-1.128854, 2.112959, 0.06016867, 1, 0.7803922, 0, 1,
-1.122054, 0.05269354, -2.282123, 1, 0.7843137, 0, 1,
-1.106216, 0.03989315, -0.449563, 1, 0.7921569, 0, 1,
-1.101117, -1.447859, -3.302619, 1, 0.7960784, 0, 1,
-1.095857, -1.190593, -1.377304, 1, 0.8039216, 0, 1,
-1.082255, -0.4807, -0.4650872, 1, 0.8117647, 0, 1,
-1.081719, -1.435234, -1.982733, 1, 0.8156863, 0, 1,
-1.078099, 0.03341047, -1.529048, 1, 0.8235294, 0, 1,
-1.074259, -1.128641, -2.217336, 1, 0.827451, 0, 1,
-1.072502, -0.976719, -1.303641, 1, 0.8352941, 0, 1,
-1.066079, 1.061138, 0.1276769, 1, 0.8392157, 0, 1,
-1.0633, 0.1504938, -1.891006, 1, 0.8470588, 0, 1,
-1.051151, 1.973118, -0.746568, 1, 0.8509804, 0, 1,
-1.046103, 0.9927388, -0.2262252, 1, 0.8588235, 0, 1,
-1.041879, -0.144119, -2.195063, 1, 0.8627451, 0, 1,
-1.032552, 0.4795557, -2.141734, 1, 0.8705882, 0, 1,
-1.028937, 0.09914903, -2.886638, 1, 0.8745098, 0, 1,
-1.025513, -1.067408, -3.434713, 1, 0.8823529, 0, 1,
-1.003607, -0.5538339, -0.2328665, 1, 0.8862745, 0, 1,
-0.998142, -0.2371038, -1.896646, 1, 0.8941177, 0, 1,
-0.9872195, 0.5923294, 0.7809094, 1, 0.8980392, 0, 1,
-0.9841152, 0.1147992, -1.102973, 1, 0.9058824, 0, 1,
-0.9793859, 0.1487384, -1.586001, 1, 0.9137255, 0, 1,
-0.9776526, 0.143096, -2.072286, 1, 0.9176471, 0, 1,
-0.9759725, -1.466094, -2.610452, 1, 0.9254902, 0, 1,
-0.975866, 0.8883138, -1.077181, 1, 0.9294118, 0, 1,
-0.9668744, 0.7834002, 0.8495857, 1, 0.9372549, 0, 1,
-0.9575108, 2.583974, -1.035251, 1, 0.9411765, 0, 1,
-0.9574402, -0.7025613, -2.042874, 1, 0.9490196, 0, 1,
-0.9569811, -1.130372, -1.470418, 1, 0.9529412, 0, 1,
-0.9563076, 2.026902, -0.4833933, 1, 0.9607843, 0, 1,
-0.9527715, 0.4037352, -0.2825487, 1, 0.9647059, 0, 1,
-0.9492873, 2.348812, -1.283477, 1, 0.972549, 0, 1,
-0.940275, 1.688608, -1.521974, 1, 0.9764706, 0, 1,
-0.9334704, -1.082735, -2.82733, 1, 0.9843137, 0, 1,
-0.9310604, -0.8858905, -2.324287, 1, 0.9882353, 0, 1,
-0.9299986, 0.7181697, -1.521656, 1, 0.9960784, 0, 1,
-0.9286361, 0.8530262, -2.020285, 0.9960784, 1, 0, 1,
-0.9254783, 0.2699482, -0.9511933, 0.9921569, 1, 0, 1,
-0.9254283, 0.5899961, -2.688895, 0.9843137, 1, 0, 1,
-0.9228268, -0.2192523, -1.737563, 0.9803922, 1, 0, 1,
-0.9174648, -0.8882964, -2.722433, 0.972549, 1, 0, 1,
-0.9157193, -0.8169258, -3.089185, 0.9686275, 1, 0, 1,
-0.9153681, 1.454954, -0.01975092, 0.9607843, 1, 0, 1,
-0.9124405, 1.239689, -1.274346, 0.9568627, 1, 0, 1,
-0.9102566, -0.8637745, -1.905078, 0.9490196, 1, 0, 1,
-0.9049332, -0.8550444, -1.9164, 0.945098, 1, 0, 1,
-0.9042186, 0.702122, -0.7761499, 0.9372549, 1, 0, 1,
-0.904156, 0.9416245, -2.62221, 0.9333333, 1, 0, 1,
-0.9035903, 1.277075, -0.7926384, 0.9254902, 1, 0, 1,
-0.9032706, -1.729122, -3.527699, 0.9215686, 1, 0, 1,
-0.8985974, 0.8815888, -2.11755, 0.9137255, 1, 0, 1,
-0.8968559, -1.279315, -2.513486, 0.9098039, 1, 0, 1,
-0.8961076, -0.4430476, -1.25308, 0.9019608, 1, 0, 1,
-0.8951848, 1.691154, -1.513872, 0.8941177, 1, 0, 1,
-0.8910462, 0.1971046, -1.769162, 0.8901961, 1, 0, 1,
-0.8885645, 0.8302868, -0.2292518, 0.8823529, 1, 0, 1,
-0.8873614, 1.214722, 0.6848006, 0.8784314, 1, 0, 1,
-0.8871846, -0.6789107, -2.371081, 0.8705882, 1, 0, 1,
-0.8779243, 0.04729221, -2.082169, 0.8666667, 1, 0, 1,
-0.8757671, 1.16293, -0.8476452, 0.8588235, 1, 0, 1,
-0.8726678, -2.806373, -2.961403, 0.854902, 1, 0, 1,
-0.8709404, 0.05936901, -0.6016833, 0.8470588, 1, 0, 1,
-0.8606893, -0.1205987, -0.5779056, 0.8431373, 1, 0, 1,
-0.8557788, 0.363837, -1.721042, 0.8352941, 1, 0, 1,
-0.8541702, 0.3443963, -2.012747, 0.8313726, 1, 0, 1,
-0.8529751, -2.017259, -4.389721, 0.8235294, 1, 0, 1,
-0.8510678, 1.090824, 0.3008314, 0.8196079, 1, 0, 1,
-0.8448182, 0.04451206, -2.611627, 0.8117647, 1, 0, 1,
-0.8434877, -0.5259525, -1.952433, 0.8078431, 1, 0, 1,
-0.8424689, -1.134416, -2.981827, 0.8, 1, 0, 1,
-0.8397192, -0.4680848, -2.810529, 0.7921569, 1, 0, 1,
-0.839005, 1.434979, -0.2498106, 0.7882353, 1, 0, 1,
-0.8358715, -2.484374, -4.03808, 0.7803922, 1, 0, 1,
-0.8352907, 0.5749359, -2.212405, 0.7764706, 1, 0, 1,
-0.8318134, -0.628714, -0.4996884, 0.7686275, 1, 0, 1,
-0.8306347, -0.0139119, -2.747418, 0.7647059, 1, 0, 1,
-0.8299421, 0.9354864, 0.9125195, 0.7568628, 1, 0, 1,
-0.8260052, -1.328529, -2.868557, 0.7529412, 1, 0, 1,
-0.82253, -0.1305645, -1.118828, 0.7450981, 1, 0, 1,
-0.8124455, -0.4819736, -2.424936, 0.7411765, 1, 0, 1,
-0.8109943, 0.191064, -0.4522782, 0.7333333, 1, 0, 1,
-0.8085817, 1.411229, -1.127456, 0.7294118, 1, 0, 1,
-0.7981617, -1.094317, -2.887225, 0.7215686, 1, 0, 1,
-0.7857522, 0.4654665, -2.417353, 0.7176471, 1, 0, 1,
-0.7838337, 1.859809, -0.8785892, 0.7098039, 1, 0, 1,
-0.7793766, -0.1264591, -1.029197, 0.7058824, 1, 0, 1,
-0.7742417, -0.4107301, -2.103076, 0.6980392, 1, 0, 1,
-0.7714468, 1.455681, -0.1606662, 0.6901961, 1, 0, 1,
-0.7708144, 0.856213, 0.5001628, 0.6862745, 1, 0, 1,
-0.7705833, -1.159061, -4.610147, 0.6784314, 1, 0, 1,
-0.7680331, -0.1050531, -2.890615, 0.6745098, 1, 0, 1,
-0.7662703, -1.472906, -2.716964, 0.6666667, 1, 0, 1,
-0.7615758, 0.920552, -0.5825207, 0.6627451, 1, 0, 1,
-0.7604818, 1.398262, 0.648909, 0.654902, 1, 0, 1,
-0.7600142, 0.270039, -0.9265265, 0.6509804, 1, 0, 1,
-0.7593996, -0.01586424, 0.330493, 0.6431373, 1, 0, 1,
-0.7586169, -1.829978, -3.798646, 0.6392157, 1, 0, 1,
-0.7513759, 0.4892617, -1.532999, 0.6313726, 1, 0, 1,
-0.7490191, -0.1902479, 1.272234, 0.627451, 1, 0, 1,
-0.7444971, -0.1324301, -2.299515, 0.6196079, 1, 0, 1,
-0.7407851, -1.630027, -3.247173, 0.6156863, 1, 0, 1,
-0.7339458, 0.6184958, -0.1758498, 0.6078432, 1, 0, 1,
-0.7264786, 1.471726, -0.5480903, 0.6039216, 1, 0, 1,
-0.7259504, -0.2357709, -2.285318, 0.5960785, 1, 0, 1,
-0.7150257, 2.3208, -0.5292646, 0.5882353, 1, 0, 1,
-0.7144328, 1.29152, -1.089794, 0.5843138, 1, 0, 1,
-0.710672, -0.8178759, -2.125657, 0.5764706, 1, 0, 1,
-0.7037745, -0.4776664, -1.939516, 0.572549, 1, 0, 1,
-0.7034723, -0.4588218, -1.29215, 0.5647059, 1, 0, 1,
-0.6980281, 1.011809, -0.6342493, 0.5607843, 1, 0, 1,
-0.6970975, 1.546166, -0.4440876, 0.5529412, 1, 0, 1,
-0.6933835, -0.3434322, -2.612307, 0.5490196, 1, 0, 1,
-0.6930372, -1.169398, -3.215587, 0.5411765, 1, 0, 1,
-0.6924276, -0.5269585, -1.730913, 0.5372549, 1, 0, 1,
-0.6843904, -0.5884972, -0.9295284, 0.5294118, 1, 0, 1,
-0.6838768, 0.936893, -0.9099047, 0.5254902, 1, 0, 1,
-0.6810657, 0.1370352, -2.481209, 0.5176471, 1, 0, 1,
-0.6801277, -0.04770833, -2.580546, 0.5137255, 1, 0, 1,
-0.6756478, -1.179676, -4.107514, 0.5058824, 1, 0, 1,
-0.6752182, -1.935909, -2.749482, 0.5019608, 1, 0, 1,
-0.6734847, -0.5134792, -3.475443, 0.4941176, 1, 0, 1,
-0.673032, 0.4127256, -0.4365489, 0.4862745, 1, 0, 1,
-0.6723073, 1.168454, -0.671254, 0.4823529, 1, 0, 1,
-0.6692352, 0.6538035, -0.9211026, 0.4745098, 1, 0, 1,
-0.6658498, -0.8874872, -2.542562, 0.4705882, 1, 0, 1,
-0.664528, 1.55382, 0.1544379, 0.4627451, 1, 0, 1,
-0.6644216, -0.008404556, -1.8654, 0.4588235, 1, 0, 1,
-0.6622624, 1.406336, -1.255641, 0.4509804, 1, 0, 1,
-0.6616304, -1.150405, -3.266776, 0.4470588, 1, 0, 1,
-0.6541061, 0.3548428, 0.1658612, 0.4392157, 1, 0, 1,
-0.6485375, -0.55975, -1.468255, 0.4352941, 1, 0, 1,
-0.6465427, 0.4921693, -1.128022, 0.427451, 1, 0, 1,
-0.6459702, -0.351693, -2.155279, 0.4235294, 1, 0, 1,
-0.6436477, -0.5004785, -1.843963, 0.4156863, 1, 0, 1,
-0.6414411, -0.7257814, -3.317362, 0.4117647, 1, 0, 1,
-0.6409699, 1.968019, 0.384524, 0.4039216, 1, 0, 1,
-0.6356609, -1.446943, -3.626768, 0.3960784, 1, 0, 1,
-0.6323253, -0.3236309, -3.190704, 0.3921569, 1, 0, 1,
-0.6289957, 1.48137, -0.3517984, 0.3843137, 1, 0, 1,
-0.6274042, 1.176987, 0.0696908, 0.3803922, 1, 0, 1,
-0.6266554, 1.525948, -1.365769, 0.372549, 1, 0, 1,
-0.6236801, 0.4058534, -1.561574, 0.3686275, 1, 0, 1,
-0.6161133, 0.112015, -3.346761, 0.3607843, 1, 0, 1,
-0.615455, -0.3405712, -1.723652, 0.3568628, 1, 0, 1,
-0.6139761, -1.621525, -3.921309, 0.3490196, 1, 0, 1,
-0.6093585, 0.6178005, -1.49665, 0.345098, 1, 0, 1,
-0.6064197, 0.09868453, -3.010067, 0.3372549, 1, 0, 1,
-0.6056086, 0.5377097, -2.081043, 0.3333333, 1, 0, 1,
-0.6028528, -0.5041537, 0.08204359, 0.3254902, 1, 0, 1,
-0.60269, -0.508002, -2.558593, 0.3215686, 1, 0, 1,
-0.5951805, -1.258271, -3.269787, 0.3137255, 1, 0, 1,
-0.592071, 0.7005895, 0.04811041, 0.3098039, 1, 0, 1,
-0.5902072, -0.03679986, -2.185267, 0.3019608, 1, 0, 1,
-0.5875275, 0.3837216, -2.02242, 0.2941177, 1, 0, 1,
-0.583828, -0.2332135, -1.976086, 0.2901961, 1, 0, 1,
-0.5816569, 0.2389726, -0.03162602, 0.282353, 1, 0, 1,
-0.5752462, 0.675947, -0.9715332, 0.2784314, 1, 0, 1,
-0.5647824, 0.7432785, 1.552572, 0.2705882, 1, 0, 1,
-0.5555744, 1.524997, 0.2548121, 0.2666667, 1, 0, 1,
-0.5555537, 0.2162703, -1.499673, 0.2588235, 1, 0, 1,
-0.5521642, 1.514471, -1.122514, 0.254902, 1, 0, 1,
-0.5479648, -0.6152012, -3.006656, 0.2470588, 1, 0, 1,
-0.5444345, 0.6207026, -0.4159643, 0.2431373, 1, 0, 1,
-0.5408979, 0.4342277, -0.02814315, 0.2352941, 1, 0, 1,
-0.5401061, 0.2354116, -0.2522849, 0.2313726, 1, 0, 1,
-0.5373245, 1.054219, -0.02832043, 0.2235294, 1, 0, 1,
-0.536303, 0.4352069, -1.621354, 0.2196078, 1, 0, 1,
-0.5342544, -0.9452605, -1.733853, 0.2117647, 1, 0, 1,
-0.5327764, -1.380124, -3.081319, 0.2078431, 1, 0, 1,
-0.5323344, 0.03617083, -2.200962, 0.2, 1, 0, 1,
-0.5299585, -0.6575945, -1.988086, 0.1921569, 1, 0, 1,
-0.5297397, -1.217117, -2.586578, 0.1882353, 1, 0, 1,
-0.5289146, -0.1427513, -2.773446, 0.1803922, 1, 0, 1,
-0.5273061, 0.6526794, -2.020064, 0.1764706, 1, 0, 1,
-0.5267878, -0.1924161, -2.280469, 0.1686275, 1, 0, 1,
-0.5263993, -0.4080216, -1.92378, 0.1647059, 1, 0, 1,
-0.5260524, -0.4459832, -3.336929, 0.1568628, 1, 0, 1,
-0.5237578, -0.3223106, -1.888603, 0.1529412, 1, 0, 1,
-0.5215907, -0.05879328, -1.453396, 0.145098, 1, 0, 1,
-0.5210499, -0.2445073, -1.436267, 0.1411765, 1, 0, 1,
-0.5200257, -0.02495208, 0.7098381, 0.1333333, 1, 0, 1,
-0.5194957, -1.36628, -2.698588, 0.1294118, 1, 0, 1,
-0.5083856, 0.4119676, -2.229839, 0.1215686, 1, 0, 1,
-0.5022368, -0.6077688, -1.999202, 0.1176471, 1, 0, 1,
-0.5008757, -0.6628639, -2.650725, 0.1098039, 1, 0, 1,
-0.4986503, 1.053484, 0.4474085, 0.1058824, 1, 0, 1,
-0.4973197, -0.9007187, -5.018203, 0.09803922, 1, 0, 1,
-0.4967444, -1.190972, -3.716316, 0.09019608, 1, 0, 1,
-0.4953535, 0.08507127, -2.410939, 0.08627451, 1, 0, 1,
-0.492747, 0.003118993, -2.348746, 0.07843138, 1, 0, 1,
-0.486099, 1.419818, -0.7685353, 0.07450981, 1, 0, 1,
-0.4850754, 1.562076, -1.073807, 0.06666667, 1, 0, 1,
-0.4848786, -0.1912558, -0.4325337, 0.0627451, 1, 0, 1,
-0.4835507, -0.284729, -2.120152, 0.05490196, 1, 0, 1,
-0.4730355, -1.16334, -2.786132, 0.05098039, 1, 0, 1,
-0.4718739, 1.072693, -0.6112281, 0.04313726, 1, 0, 1,
-0.4692895, 0.5316144, 0.4983261, 0.03921569, 1, 0, 1,
-0.4675108, 1.119395, -1.00144, 0.03137255, 1, 0, 1,
-0.4618595, -1.672166, -2.444119, 0.02745098, 1, 0, 1,
-0.4562391, -1.570912, -3.181219, 0.01960784, 1, 0, 1,
-0.4556794, -0.7290447, -3.187074, 0.01568628, 1, 0, 1,
-0.4547135, -2.491066, -2.879844, 0.007843138, 1, 0, 1,
-0.4545257, 0.1468559, 0.2138742, 0.003921569, 1, 0, 1,
-0.4530112, -0.5189926, -3.232357, 0, 1, 0.003921569, 1,
-0.449453, -1.534826, -3.38642, 0, 1, 0.01176471, 1,
-0.4475417, 0.5195893, -0.1340185, 0, 1, 0.01568628, 1,
-0.4457744, 1.609974, 0.169919, 0, 1, 0.02352941, 1,
-0.4450982, -0.7720304, -3.722597, 0, 1, 0.02745098, 1,
-0.443686, 0.9323016, 0.1726025, 0, 1, 0.03529412, 1,
-0.4352972, 1.009216, -0.08713824, 0, 1, 0.03921569, 1,
-0.4297661, 0.1431545, -0.2910605, 0, 1, 0.04705882, 1,
-0.4296215, -1.154015, -2.067619, 0, 1, 0.05098039, 1,
-0.4251491, -0.1637376, 0.04716037, 0, 1, 0.05882353, 1,
-0.4212424, 1.013803, 0.1693442, 0, 1, 0.0627451, 1,
-0.416157, -1.170784, -3.752841, 0, 1, 0.07058824, 1,
-0.4157669, -0.09189218, -0.8246121, 0, 1, 0.07450981, 1,
-0.4136216, 0.2029701, -1.380876, 0, 1, 0.08235294, 1,
-0.4128979, -1.466965, -2.526, 0, 1, 0.08627451, 1,
-0.4113315, 0.9632165, 1.806019, 0, 1, 0.09411765, 1,
-0.4056599, 0.2643392, -1.550426, 0, 1, 0.1019608, 1,
-0.3969755, -0.2748004, -3.258406, 0, 1, 0.1058824, 1,
-0.396306, 0.6410862, -0.8435706, 0, 1, 0.1137255, 1,
-0.3955924, 0.4213648, -0.7826582, 0, 1, 0.1176471, 1,
-0.3950099, 0.3658619, -1.143734, 0, 1, 0.1254902, 1,
-0.3924551, 1.013365, -0.6905974, 0, 1, 0.1294118, 1,
-0.3920311, 1.048532, -0.5432906, 0, 1, 0.1372549, 1,
-0.3916379, 0.8795909, -1.428262, 0, 1, 0.1411765, 1,
-0.3899423, -0.1020121, -1.006867, 0, 1, 0.1490196, 1,
-0.3852315, 0.02546086, -1.766593, 0, 1, 0.1529412, 1,
-0.3829252, -1.799977, -2.967529, 0, 1, 0.1607843, 1,
-0.3828636, -0.5190369, -2.991283, 0, 1, 0.1647059, 1,
-0.3806865, 0.1326332, -1.090868, 0, 1, 0.172549, 1,
-0.3751508, 0.2428109, -2.40734, 0, 1, 0.1764706, 1,
-0.3746014, 0.5143322, 0.07595526, 0, 1, 0.1843137, 1,
-0.3641418, 1.574211, -0.3334259, 0, 1, 0.1882353, 1,
-0.3602619, -1.344532, -2.41684, 0, 1, 0.1960784, 1,
-0.3561975, -0.7300919, -2.506525, 0, 1, 0.2039216, 1,
-0.3502906, 0.9217521, -0.6001866, 0, 1, 0.2078431, 1,
-0.3499993, -0.682165, -3.886883, 0, 1, 0.2156863, 1,
-0.3488266, 0.3489237, -0.3838964, 0, 1, 0.2196078, 1,
-0.346584, -0.2414866, -2.661712, 0, 1, 0.227451, 1,
-0.3462502, 1.142769, 0.1644316, 0, 1, 0.2313726, 1,
-0.3401958, -1.005745, -3.437452, 0, 1, 0.2392157, 1,
-0.3359249, -0.5677543, -2.781371, 0, 1, 0.2431373, 1,
-0.335686, 0.8967001, 0.9253243, 0, 1, 0.2509804, 1,
-0.3350834, 2.131729, 0.7346826, 0, 1, 0.254902, 1,
-0.3347698, -1.0235, -4.171041, 0, 1, 0.2627451, 1,
-0.331789, -1.023335, -2.467172, 0, 1, 0.2666667, 1,
-0.3305428, -0.7163013, -3.177868, 0, 1, 0.2745098, 1,
-0.3256174, 0.9518013, -1.390388, 0, 1, 0.2784314, 1,
-0.322941, -0.6279046, -1.191115, 0, 1, 0.2862745, 1,
-0.3205348, -1.058666, -3.400441, 0, 1, 0.2901961, 1,
-0.3189307, 1.219847, 1.145475, 0, 1, 0.2980392, 1,
-0.3174173, -2.64888, -4.150051, 0, 1, 0.3058824, 1,
-0.3155158, 0.9238826, -0.03748044, 0, 1, 0.3098039, 1,
-0.3142855, 1.048961, -0.2292273, 0, 1, 0.3176471, 1,
-0.3131939, 0.878595, -1.609118, 0, 1, 0.3215686, 1,
-0.3049963, 0.2402795, -1.245095, 0, 1, 0.3294118, 1,
-0.3032816, -0.383784, -2.951587, 0, 1, 0.3333333, 1,
-0.3028243, -1.093436, -1.354114, 0, 1, 0.3411765, 1,
-0.2985426, 0.1059523, -0.7821898, 0, 1, 0.345098, 1,
-0.2974758, -0.5557693, -1.519333, 0, 1, 0.3529412, 1,
-0.2964157, -1.754899, -2.333623, 0, 1, 0.3568628, 1,
-0.2944061, -0.6450076, -2.632282, 0, 1, 0.3647059, 1,
-0.2925735, -1.414141, -2.406002, 0, 1, 0.3686275, 1,
-0.2813486, 0.09018434, -1.411077, 0, 1, 0.3764706, 1,
-0.2798803, 1.070962, -1.101344, 0, 1, 0.3803922, 1,
-0.2777115, -0.3037465, -2.373016, 0, 1, 0.3882353, 1,
-0.2770698, -2.006707, -4.67651, 0, 1, 0.3921569, 1,
-0.2714416, -0.3975009, -2.287936, 0, 1, 0.4, 1,
-0.2696432, -1.386657, -1.756698, 0, 1, 0.4078431, 1,
-0.2683659, -0.5647807, -3.351697, 0, 1, 0.4117647, 1,
-0.2646741, -1.397549, -1.608217, 0, 1, 0.4196078, 1,
-0.2579382, -0.05308351, -2.959494, 0, 1, 0.4235294, 1,
-0.249822, -0.003039779, -0.8063881, 0, 1, 0.4313726, 1,
-0.2497415, 0.4946137, -0.3241708, 0, 1, 0.4352941, 1,
-0.2419749, 1.15277, 1.250796, 0, 1, 0.4431373, 1,
-0.2411223, -1.453416, -2.873061, 0, 1, 0.4470588, 1,
-0.2403116, 0.6973938, 0.1980059, 0, 1, 0.454902, 1,
-0.239624, -0.7667291, -2.229527, 0, 1, 0.4588235, 1,
-0.2355022, -1.095895, -3.41878, 0, 1, 0.4666667, 1,
-0.2232169, -0.8431517, -3.212857, 0, 1, 0.4705882, 1,
-0.2215717, -0.8417858, -2.536406, 0, 1, 0.4784314, 1,
-0.2167358, -1.377839, -1.658706, 0, 1, 0.4823529, 1,
-0.2143137, 0.7366939, 0.4894727, 0, 1, 0.4901961, 1,
-0.2120739, -1.05855, -3.223972, 0, 1, 0.4941176, 1,
-0.2102611, -0.05007544, -1.581838, 0, 1, 0.5019608, 1,
-0.1995725, -1.684837, -3.257496, 0, 1, 0.509804, 1,
-0.1932967, 0.2579276, -0.04072146, 0, 1, 0.5137255, 1,
-0.1919706, 0.3263446, 0.6296297, 0, 1, 0.5215687, 1,
-0.1913791, 0.3248167, 1.42177, 0, 1, 0.5254902, 1,
-0.1913736, 0.3139758, -2.269048, 0, 1, 0.5333334, 1,
-0.1862502, -0.05523243, -2.443823, 0, 1, 0.5372549, 1,
-0.1842617, 1.651383, 0.2050782, 0, 1, 0.5450981, 1,
-0.1836498, 0.4175829, 0.299603, 0, 1, 0.5490196, 1,
-0.1818875, 0.3901556, -0.6727546, 0, 1, 0.5568628, 1,
-0.1795847, -0.1226272, -2.056105, 0, 1, 0.5607843, 1,
-0.1790836, -1.673668, -6.285759, 0, 1, 0.5686275, 1,
-0.1790255, 0.4790444, 0.02588634, 0, 1, 0.572549, 1,
-0.1773939, -0.09150932, -1.918057, 0, 1, 0.5803922, 1,
-0.1747573, -1.611659, -1.407889, 0, 1, 0.5843138, 1,
-0.174011, 1.565275, -0.249151, 0, 1, 0.5921569, 1,
-0.1678273, 0.007707455, 0.03023933, 0, 1, 0.5960785, 1,
-0.1666532, -0.3780333, -1.247334, 0, 1, 0.6039216, 1,
-0.1661617, 1.016306, 1.770183, 0, 1, 0.6117647, 1,
-0.1651317, -0.8437638, -3.727869, 0, 1, 0.6156863, 1,
-0.1537644, 0.7168822, -1.209358, 0, 1, 0.6235294, 1,
-0.1526519, 0.1363902, 0.3722209, 0, 1, 0.627451, 1,
-0.1497792, -0.6891657, -3.910187, 0, 1, 0.6352941, 1,
-0.147735, 0.5999427, 0.5387258, 0, 1, 0.6392157, 1,
-0.1460694, 0.02283062, -1.371662, 0, 1, 0.6470588, 1,
-0.1438507, -0.1053851, -1.364421, 0, 1, 0.6509804, 1,
-0.1430704, 0.007503534, -1.795035, 0, 1, 0.6588235, 1,
-0.1415245, -0.3374578, -2.7239, 0, 1, 0.6627451, 1,
-0.1403382, 0.6965054, 1.462909, 0, 1, 0.6705883, 1,
-0.1393428, -0.6164727, -3.187412, 0, 1, 0.6745098, 1,
-0.1392157, 0.4031456, -0.06556881, 0, 1, 0.682353, 1,
-0.1373648, -1.407343, -3.225929, 0, 1, 0.6862745, 1,
-0.1363783, -1.025602, -2.559689, 0, 1, 0.6941177, 1,
-0.1348589, 0.5873836, -2.635269, 0, 1, 0.7019608, 1,
-0.1297493, 1.420904, 0.8263559, 0, 1, 0.7058824, 1,
-0.1297173, 0.9230878, -0.4703414, 0, 1, 0.7137255, 1,
-0.1267316, 0.1344556, -2.364017, 0, 1, 0.7176471, 1,
-0.1253061, -0.1200344, -1.237958, 0, 1, 0.7254902, 1,
-0.1234926, -1.530867, -4.885591, 0, 1, 0.7294118, 1,
-0.1232928, 0.9581153, -0.595377, 0, 1, 0.7372549, 1,
-0.1224682, -0.8743712, -2.387361, 0, 1, 0.7411765, 1,
-0.120554, 0.5194167, 0.522743, 0, 1, 0.7490196, 1,
-0.1202877, 1.127902, 0.5334399, 0, 1, 0.7529412, 1,
-0.115163, 0.6165355, 0.4368309, 0, 1, 0.7607843, 1,
-0.1124317, 1.864035, -0.3630023, 0, 1, 0.7647059, 1,
-0.1121957, -0.01696865, -1.189851, 0, 1, 0.772549, 1,
-0.1090729, -0.1348665, -2.218013, 0, 1, 0.7764706, 1,
-0.1083508, -0.9481468, -2.51389, 0, 1, 0.7843137, 1,
-0.1060212, -1.116849, -3.794372, 0, 1, 0.7882353, 1,
-0.1055817, -2.146715, -2.482145, 0, 1, 0.7960784, 1,
-0.104502, -0.3224526, -3.108523, 0, 1, 0.8039216, 1,
-0.1034333, 0.1303409, -1.162636, 0, 1, 0.8078431, 1,
-0.09842607, 0.3050969, -0.3828301, 0, 1, 0.8156863, 1,
-0.09766739, 1.291754, -1.226728, 0, 1, 0.8196079, 1,
-0.0955148, 0.4251217, 0.2314978, 0, 1, 0.827451, 1,
-0.09406529, 0.2576651, 0.07078428, 0, 1, 0.8313726, 1,
-0.09194089, -1.283009, -4.253119, 0, 1, 0.8392157, 1,
-0.08818737, 1.185737, 0.4970939, 0, 1, 0.8431373, 1,
-0.08731832, 0.07440027, -0.4280505, 0, 1, 0.8509804, 1,
-0.08332808, 0.5691156, -0.9190279, 0, 1, 0.854902, 1,
-0.06424404, 0.3031615, 0.4428595, 0, 1, 0.8627451, 1,
-0.06011038, -0.454437, -3.461352, 0, 1, 0.8666667, 1,
-0.05605441, -1.187787, -3.79809, 0, 1, 0.8745098, 1,
-0.05580152, 0.6435615, -1.513427, 0, 1, 0.8784314, 1,
-0.05171507, -0.8583502, -3.026329, 0, 1, 0.8862745, 1,
-0.04395755, 2.706761, -0.4071594, 0, 1, 0.8901961, 1,
-0.03723302, -0.9589711, -3.223513, 0, 1, 0.8980392, 1,
-0.0365169, -1.759594, -2.195394, 0, 1, 0.9058824, 1,
-0.03269895, 0.1505349, -0.4386111, 0, 1, 0.9098039, 1,
-0.03197884, 1.235278, 0.9793094, 0, 1, 0.9176471, 1,
-0.02291615, -0.01109347, -0.5101059, 0, 1, 0.9215686, 1,
-0.02239273, -0.8533957, -4.049928, 0, 1, 0.9294118, 1,
-0.01499011, -0.3454051, -4.55398, 0, 1, 0.9333333, 1,
-0.00566373, -0.2256022, -3.599027, 0, 1, 0.9411765, 1,
-0.002639262, -1.744897, -1.483765, 0, 1, 0.945098, 1,
0.0005406684, -0.9566512, 4.900823, 0, 1, 0.9529412, 1,
0.00158382, -1.381119, 1.157245, 0, 1, 0.9568627, 1,
0.002759787, -1.997135, 3.798666, 0, 1, 0.9647059, 1,
0.009159505, 0.1590048, -0.9918081, 0, 1, 0.9686275, 1,
0.01141908, 0.4783939, 1.141287, 0, 1, 0.9764706, 1,
0.01345093, 0.1857878, 1.244957, 0, 1, 0.9803922, 1,
0.01389142, 0.3101826, -1.24485, 0, 1, 0.9882353, 1,
0.01943187, 1.37801, 0.8087726, 0, 1, 0.9921569, 1,
0.02192668, -0.7118187, 4.395686, 0, 1, 1, 1,
0.0244734, 1.192751, -0.2778081, 0, 0.9921569, 1, 1,
0.02484042, -1.105818, 4.628851, 0, 0.9882353, 1, 1,
0.02740262, 0.4841481, 1.400124, 0, 0.9803922, 1, 1,
0.03179953, -1.18388, 3.314914, 0, 0.9764706, 1, 1,
0.03560639, 0.5974742, 1.106401, 0, 0.9686275, 1, 1,
0.03950724, -2.853416, 2.047459, 0, 0.9647059, 1, 1,
0.03972422, -0.6428968, 2.296509, 0, 0.9568627, 1, 1,
0.04034847, 1.325741, 0.2365359, 0, 0.9529412, 1, 1,
0.04370329, 1.315421, -1.208522, 0, 0.945098, 1, 1,
0.04443127, 1.320684, -2.094213, 0, 0.9411765, 1, 1,
0.05133666, -0.06258602, 2.265535, 0, 0.9333333, 1, 1,
0.05165583, 2.313744, -0.507067, 0, 0.9294118, 1, 1,
0.05517679, -0.8022102, 3.189435, 0, 0.9215686, 1, 1,
0.05642401, -1.696424, 4.018184, 0, 0.9176471, 1, 1,
0.0605527, -0.09545007, 3.799276, 0, 0.9098039, 1, 1,
0.06401635, 0.1384811, 1.217305, 0, 0.9058824, 1, 1,
0.06776665, -1.500729, 1.882058, 0, 0.8980392, 1, 1,
0.06786755, 3.606179, 0.4136328, 0, 0.8901961, 1, 1,
0.07519542, 0.7181441, -0.421432, 0, 0.8862745, 1, 1,
0.08440427, -1.500031, 3.666091, 0, 0.8784314, 1, 1,
0.09243038, -0.9138679, 2.685723, 0, 0.8745098, 1, 1,
0.09312868, 0.68104, -1.028205, 0, 0.8666667, 1, 1,
0.09373347, -0.07961875, 0.9013212, 0, 0.8627451, 1, 1,
0.09826396, -0.7503724, 2.45628, 0, 0.854902, 1, 1,
0.1011753, -0.9666281, 3.574672, 0, 0.8509804, 1, 1,
0.1033768, 0.6505061, 1.036118, 0, 0.8431373, 1, 1,
0.103557, 0.2467746, -0.1676795, 0, 0.8392157, 1, 1,
0.1037599, 0.1087258, 0.8117102, 0, 0.8313726, 1, 1,
0.1056836, 0.4278928, 0.8615426, 0, 0.827451, 1, 1,
0.1098191, 0.3574481, 0.7706097, 0, 0.8196079, 1, 1,
0.1142222, 0.09805392, 0.8675598, 0, 0.8156863, 1, 1,
0.1144505, 0.8950741, -1.767598, 0, 0.8078431, 1, 1,
0.1163871, -1.143748, 4.012928, 0, 0.8039216, 1, 1,
0.1182823, 0.5920678, 2.329893, 0, 0.7960784, 1, 1,
0.1197061, -1.305209, 4.547948, 0, 0.7882353, 1, 1,
0.1197519, -0.2882569, 1.042794, 0, 0.7843137, 1, 1,
0.1227361, -0.7336484, 1.234908, 0, 0.7764706, 1, 1,
0.1249215, 0.6543887, 1.457199, 0, 0.772549, 1, 1,
0.1256735, -1.305703, 4.695433, 0, 0.7647059, 1, 1,
0.1265242, 0.05726346, 3.03415, 0, 0.7607843, 1, 1,
0.1265728, 0.3239062, 0.2446232, 0, 0.7529412, 1, 1,
0.1296449, 0.2372783, -0.05665681, 0, 0.7490196, 1, 1,
0.1309349, -0.09762674, 0.2616096, 0, 0.7411765, 1, 1,
0.1337496, 0.1118605, 1.314656, 0, 0.7372549, 1, 1,
0.1363292, 0.8313419, 0.1025888, 0, 0.7294118, 1, 1,
0.1378152, -1.545587, 4.066158, 0, 0.7254902, 1, 1,
0.1435285, 2.331818, -1.117848, 0, 0.7176471, 1, 1,
0.146639, 0.5215069, -0.9443132, 0, 0.7137255, 1, 1,
0.1477295, -1.481179, 1.701656, 0, 0.7058824, 1, 1,
0.1482303, -0.03019845, 2.109193, 0, 0.6980392, 1, 1,
0.1485819, 1.603877, 1.218673, 0, 0.6941177, 1, 1,
0.1493948, -1.799895, 3.757788, 0, 0.6862745, 1, 1,
0.1535118, 0.114021, 1.900878, 0, 0.682353, 1, 1,
0.1545691, 0.3957964, 0.4032751, 0, 0.6745098, 1, 1,
0.165199, 0.06178192, 2.267815, 0, 0.6705883, 1, 1,
0.1684064, -0.03636204, 0.3993411, 0, 0.6627451, 1, 1,
0.1816379, 0.2724666, 2.364388, 0, 0.6588235, 1, 1,
0.1868054, 0.3688251, 0.1425768, 0, 0.6509804, 1, 1,
0.1896261, 0.8215925, -0.01714438, 0, 0.6470588, 1, 1,
0.1901331, -0.05715591, 1.876817, 0, 0.6392157, 1, 1,
0.192287, 0.961596, 0.2067882, 0, 0.6352941, 1, 1,
0.1978677, 0.6213363, 1.092728, 0, 0.627451, 1, 1,
0.199127, 1.097003, 2.981941, 0, 0.6235294, 1, 1,
0.2033808, 0.5474936, 1.389139, 0, 0.6156863, 1, 1,
0.2103922, -1.231518, 2.553741, 0, 0.6117647, 1, 1,
0.2155604, -0.3992502, 1.249313, 0, 0.6039216, 1, 1,
0.2203298, -0.1755914, 0.3880329, 0, 0.5960785, 1, 1,
0.2206188, 0.0001374632, 2.106025, 0, 0.5921569, 1, 1,
0.2214947, 0.05015965, 2.538163, 0, 0.5843138, 1, 1,
0.2344121, -0.8450585, 2.786247, 0, 0.5803922, 1, 1,
0.2450892, 0.6495009, 1.524686, 0, 0.572549, 1, 1,
0.2467898, 1.68045, 0.2373682, 0, 0.5686275, 1, 1,
0.2470077, -0.4441883, 3.097859, 0, 0.5607843, 1, 1,
0.2471047, 0.8479885, -0.6684459, 0, 0.5568628, 1, 1,
0.249286, -0.440394, 2.688923, 0, 0.5490196, 1, 1,
0.249573, -0.3764331, 3.4844, 0, 0.5450981, 1, 1,
0.2510622, -0.8355575, 3.38485, 0, 0.5372549, 1, 1,
0.2514533, -0.9215159, 4.769308, 0, 0.5333334, 1, 1,
0.2535804, 1.853047, 0.3109889, 0, 0.5254902, 1, 1,
0.2544234, -1.778196, 2.371612, 0, 0.5215687, 1, 1,
0.2570832, -1.235782, 1.220454, 0, 0.5137255, 1, 1,
0.2606863, -2.309956, 4.096304, 0, 0.509804, 1, 1,
0.2633453, 1.370519, 1.184954, 0, 0.5019608, 1, 1,
0.2660339, -1.57402, 2.202864, 0, 0.4941176, 1, 1,
0.2679632, 1.007001, 0.07809482, 0, 0.4901961, 1, 1,
0.2702439, 0.9906383, -0.7675223, 0, 0.4823529, 1, 1,
0.2710143, 1.156918, -0.04085808, 0, 0.4784314, 1, 1,
0.2713577, 0.6137446, 2.18011, 0, 0.4705882, 1, 1,
0.2738096, 0.321283, -0.4919702, 0, 0.4666667, 1, 1,
0.2760608, -1.114159, 2.203762, 0, 0.4588235, 1, 1,
0.2789674, 0.7619081, 1.253833, 0, 0.454902, 1, 1,
0.2803909, -0.2113625, 1.178315, 0, 0.4470588, 1, 1,
0.2807451, 0.2262229, -0.08909944, 0, 0.4431373, 1, 1,
0.2833076, -1.179156, 3.13117, 0, 0.4352941, 1, 1,
0.2850228, -0.7404738, 1.649366, 0, 0.4313726, 1, 1,
0.2865072, -1.307861, 1.966038, 0, 0.4235294, 1, 1,
0.2921121, -0.1356124, 1.136371, 0, 0.4196078, 1, 1,
0.2927849, -0.3654249, 1.371078, 0, 0.4117647, 1, 1,
0.2955679, 0.05170203, 0.4467292, 0, 0.4078431, 1, 1,
0.2971885, -1.639936, 3.106974, 0, 0.4, 1, 1,
0.2974272, 0.6256285, 1.158345, 0, 0.3921569, 1, 1,
0.299933, -0.8351811, 2.995606, 0, 0.3882353, 1, 1,
0.3023643, -1.380387, 2.914518, 0, 0.3803922, 1, 1,
0.3032068, -1.910835, 3.295066, 0, 0.3764706, 1, 1,
0.3108174, -0.1112053, 1.998204, 0, 0.3686275, 1, 1,
0.313882, 1.09402, 0.4456847, 0, 0.3647059, 1, 1,
0.3139944, 1.02993, 0.539958, 0, 0.3568628, 1, 1,
0.3149672, -0.09237493, 4.98426, 0, 0.3529412, 1, 1,
0.3158435, -1.687301, 2.906762, 0, 0.345098, 1, 1,
0.3266561, -0.6093388, 3.142858, 0, 0.3411765, 1, 1,
0.3328102, 1.107573, -0.9472305, 0, 0.3333333, 1, 1,
0.333151, 0.7384533, 0.2649591, 0, 0.3294118, 1, 1,
0.3369133, 1.304433, 0.2839564, 0, 0.3215686, 1, 1,
0.3371203, -1.419136, 2.369662, 0, 0.3176471, 1, 1,
0.3372082, -0.7640746, 4.02451, 0, 0.3098039, 1, 1,
0.3389922, 0.9573114, 1.288666, 0, 0.3058824, 1, 1,
0.3409012, -0.1170456, 1.768171, 0, 0.2980392, 1, 1,
0.3422054, -0.6957534, 3.835023, 0, 0.2901961, 1, 1,
0.3584825, 1.033837, -0.2179992, 0, 0.2862745, 1, 1,
0.3687868, 0.3273506, 0.683892, 0, 0.2784314, 1, 1,
0.3734267, -0.3933091, 2.719166, 0, 0.2745098, 1, 1,
0.3776406, -0.4467483, 3.942509, 0, 0.2666667, 1, 1,
0.3776562, -0.9762352, 3.049675, 0, 0.2627451, 1, 1,
0.3803293, 0.5393018, 1.419977, 0, 0.254902, 1, 1,
0.3833024, 2.016031, 0.7320005, 0, 0.2509804, 1, 1,
0.3867604, 0.690706, 0.5222361, 0, 0.2431373, 1, 1,
0.3945145, -1.617828, 1.784671, 0, 0.2392157, 1, 1,
0.3946893, 1.462547, 1.110571, 0, 0.2313726, 1, 1,
0.3999635, 0.7477241, 0.2363931, 0, 0.227451, 1, 1,
0.4017539, -0.1210425, 1.83972, 0, 0.2196078, 1, 1,
0.4036113, 0.587253, -1.09906, 0, 0.2156863, 1, 1,
0.4111944, 0.881659, -1.416018, 0, 0.2078431, 1, 1,
0.4118932, -0.8474153, 2.459954, 0, 0.2039216, 1, 1,
0.4150426, 0.2917103, 0.9247023, 0, 0.1960784, 1, 1,
0.4158102, -0.04864785, 1.969111, 0, 0.1882353, 1, 1,
0.4176885, 1.031592, -0.2827293, 0, 0.1843137, 1, 1,
0.4180715, 0.4729879, -0.1608282, 0, 0.1764706, 1, 1,
0.4202655, 0.5110093, 2.026148, 0, 0.172549, 1, 1,
0.4214447, -0.566786, 2.228872, 0, 0.1647059, 1, 1,
0.4215094, -0.5356479, 1.860471, 0, 0.1607843, 1, 1,
0.4251077, 0.7347612, -1.268333, 0, 0.1529412, 1, 1,
0.4299639, 0.520797, 0.5645151, 0, 0.1490196, 1, 1,
0.4333096, 0.9033349, 2.061143, 0, 0.1411765, 1, 1,
0.4356712, 0.6556271, 1.328781, 0, 0.1372549, 1, 1,
0.4386024, -0.1399336, 3.214189, 0, 0.1294118, 1, 1,
0.4420293, -0.08942786, 3.062683, 0, 0.1254902, 1, 1,
0.4491628, -1.861997, 2.735544, 0, 0.1176471, 1, 1,
0.451252, -0.1006596, 3.731381, 0, 0.1137255, 1, 1,
0.4525993, 1.795482, -0.1937553, 0, 0.1058824, 1, 1,
0.4540031, -0.3773847, 1.266578, 0, 0.09803922, 1, 1,
0.454563, 0.6207545, 0.4412545, 0, 0.09411765, 1, 1,
0.4571453, -0.9953517, 3.98155, 0, 0.08627451, 1, 1,
0.4577368, 0.6673303, -0.4603418, 0, 0.08235294, 1, 1,
0.4613151, -1.058764, 1.682159, 0, 0.07450981, 1, 1,
0.4622868, -0.3110509, 1.786337, 0, 0.07058824, 1, 1,
0.4633183, 0.901251, -0.5273653, 0, 0.0627451, 1, 1,
0.4646996, -0.2733439, 3.260988, 0, 0.05882353, 1, 1,
0.4753335, 0.6003139, 0.1731254, 0, 0.05098039, 1, 1,
0.4753563, -1.554681, 0.8550396, 0, 0.04705882, 1, 1,
0.4763215, -0.941504, 1.51635, 0, 0.03921569, 1, 1,
0.4781226, -2.017718, 1.606519, 0, 0.03529412, 1, 1,
0.4819485, 1.235385, 0.7853011, 0, 0.02745098, 1, 1,
0.4820402, -0.5804549, 0.8329575, 0, 0.02352941, 1, 1,
0.4887421, 0.05290434, 1.183645, 0, 0.01568628, 1, 1,
0.4892715, -2.089818, 0.920819, 0, 0.01176471, 1, 1,
0.4904447, 0.7248241, 0.1253288, 0, 0.003921569, 1, 1,
0.4907022, 0.1480607, 0.9796711, 0.003921569, 0, 1, 1,
0.4916832, 0.08014501, 2.554683, 0.007843138, 0, 1, 1,
0.4928404, 0.420889, 1.301464, 0.01568628, 0, 1, 1,
0.4954332, -2.1064, 2.982876, 0.01960784, 0, 1, 1,
0.5001925, 1.298459, -0.3946151, 0.02745098, 0, 1, 1,
0.5002347, 0.1105723, 0.7525417, 0.03137255, 0, 1, 1,
0.5017399, -1.955664, 3.315253, 0.03921569, 0, 1, 1,
0.5076948, 0.02746465, 0.4264357, 0.04313726, 0, 1, 1,
0.5143414, -0.3604442, 1.71823, 0.05098039, 0, 1, 1,
0.5154313, 0.05647498, 2.768071, 0.05490196, 0, 1, 1,
0.5166728, 0.6455703, 1.754426, 0.0627451, 0, 1, 1,
0.5217943, -0.5424743, 3.001349, 0.06666667, 0, 1, 1,
0.5241856, 1.004605, 2.395736, 0.07450981, 0, 1, 1,
0.5299245, 2.08837, 0.579026, 0.07843138, 0, 1, 1,
0.5337658, 1.544634, 0.1198069, 0.08627451, 0, 1, 1,
0.5363259, 1.55663, -1.528217, 0.09019608, 0, 1, 1,
0.5383813, 0.4497552, 1.561933, 0.09803922, 0, 1, 1,
0.5412433, 0.3688425, 1.615193, 0.1058824, 0, 1, 1,
0.5418442, -0.485503, 1.430062, 0.1098039, 0, 1, 1,
0.5636154, -1.441296, 1.962838, 0.1176471, 0, 1, 1,
0.5650445, 0.3604544, 1.621704, 0.1215686, 0, 1, 1,
0.5700328, 1.098641, 1.226449, 0.1294118, 0, 1, 1,
0.5702057, -0.6920806, 1.97398, 0.1333333, 0, 1, 1,
0.5707944, 1.312513, 0.865621, 0.1411765, 0, 1, 1,
0.573082, 0.07712091, 0.4903588, 0.145098, 0, 1, 1,
0.5770997, -0.5071957, 3.626053, 0.1529412, 0, 1, 1,
0.5782862, -0.1865239, 0.396193, 0.1568628, 0, 1, 1,
0.5849714, -0.3779539, 1.628624, 0.1647059, 0, 1, 1,
0.5869359, -0.4823726, 2.455746, 0.1686275, 0, 1, 1,
0.5925543, -0.2530119, 2.861273, 0.1764706, 0, 1, 1,
0.5930658, 1.271357, -0.3527635, 0.1803922, 0, 1, 1,
0.5949671, -0.8878474, 2.763477, 0.1882353, 0, 1, 1,
0.6050016, 0.4056453, 1.613288, 0.1921569, 0, 1, 1,
0.6072585, 0.9243107, 1.635283, 0.2, 0, 1, 1,
0.6133964, 0.2420758, 1.632588, 0.2078431, 0, 1, 1,
0.6156128, 1.215938, 0.6032815, 0.2117647, 0, 1, 1,
0.6156317, 0.7539717, -0.6594933, 0.2196078, 0, 1, 1,
0.6267946, 0.4750783, 1.543861, 0.2235294, 0, 1, 1,
0.6380574, 0.2593509, 1.309934, 0.2313726, 0, 1, 1,
0.6409981, -0.2703851, 1.388244, 0.2352941, 0, 1, 1,
0.6437792, -0.5960385, 1.366576, 0.2431373, 0, 1, 1,
0.6482725, 1.392002, -0.597554, 0.2470588, 0, 1, 1,
0.6548777, -0.3312136, 4.030073, 0.254902, 0, 1, 1,
0.6585754, 1.500971, 1.974387, 0.2588235, 0, 1, 1,
0.6592984, -0.07188986, 1.522404, 0.2666667, 0, 1, 1,
0.6599841, -0.6570687, 2.933376, 0.2705882, 0, 1, 1,
0.6675366, 1.641965, -0.2654112, 0.2784314, 0, 1, 1,
0.6691965, -0.6212652, 1.687506, 0.282353, 0, 1, 1,
0.6721075, 1.435553, -0.2963561, 0.2901961, 0, 1, 1,
0.6747068, -0.04756931, 2.850457, 0.2941177, 0, 1, 1,
0.674996, 1.419462, 1.985723, 0.3019608, 0, 1, 1,
0.677143, 0.6376718, 1.546452, 0.3098039, 0, 1, 1,
0.6773058, -0.5023254, 0.9348279, 0.3137255, 0, 1, 1,
0.6784011, 0.3222418, 3.073489, 0.3215686, 0, 1, 1,
0.6810729, -0.2305357, 3.104849, 0.3254902, 0, 1, 1,
0.6815224, -1.610166, 1.578768, 0.3333333, 0, 1, 1,
0.6816059, 0.810595, 1.959605, 0.3372549, 0, 1, 1,
0.6821597, -1.688269, 3.489789, 0.345098, 0, 1, 1,
0.6835409, -0.9448723, 3.347365, 0.3490196, 0, 1, 1,
0.6858723, -1.932394, 2.310689, 0.3568628, 0, 1, 1,
0.6875979, -1.752368, 2.812968, 0.3607843, 0, 1, 1,
0.6879089, -1.60979, 3.331312, 0.3686275, 0, 1, 1,
0.6881179, 1.403147, 0.07171395, 0.372549, 0, 1, 1,
0.6909515, -0.5982659, 3.722957, 0.3803922, 0, 1, 1,
0.6911003, 0.5267376, -0.9069771, 0.3843137, 0, 1, 1,
0.6932495, -0.8239578, 1.844025, 0.3921569, 0, 1, 1,
0.7017018, -0.09910439, 4.087938, 0.3960784, 0, 1, 1,
0.703027, 0.4939744, 1.3324, 0.4039216, 0, 1, 1,
0.7077018, 2.011645, -0.01852367, 0.4117647, 0, 1, 1,
0.7094085, -0.5683104, 3.872999, 0.4156863, 0, 1, 1,
0.7229245, -1.275977, 2.227744, 0.4235294, 0, 1, 1,
0.7331321, -1.574547, 2.791841, 0.427451, 0, 1, 1,
0.7346551, 0.6401592, 2.178418, 0.4352941, 0, 1, 1,
0.736396, -1.604257, 2.590789, 0.4392157, 0, 1, 1,
0.7404778, -0.5432583, 1.784707, 0.4470588, 0, 1, 1,
0.7426493, 0.2791932, 0.2866356, 0.4509804, 0, 1, 1,
0.7448569, -0.4952733, -0.5939476, 0.4588235, 0, 1, 1,
0.7503834, -1.151989, 2.805917, 0.4627451, 0, 1, 1,
0.7594039, -0.2616605, 2.606024, 0.4705882, 0, 1, 1,
0.7642256, 1.184114, 1.014089, 0.4745098, 0, 1, 1,
0.7658305, 0.3385466, -0.3161878, 0.4823529, 0, 1, 1,
0.7671716, -0.022844, 2.849433, 0.4862745, 0, 1, 1,
0.7682682, -1.078784, 1.889539, 0.4941176, 0, 1, 1,
0.7694563, 0.08936407, 2.392826, 0.5019608, 0, 1, 1,
0.7701848, 0.6273452, 0.6367586, 0.5058824, 0, 1, 1,
0.7708349, 1.027925, 2.749099, 0.5137255, 0, 1, 1,
0.7725222, 0.5708554, 1.819621, 0.5176471, 0, 1, 1,
0.7768816, -1.057155, 2.512397, 0.5254902, 0, 1, 1,
0.7792045, -1.406541, 2.969641, 0.5294118, 0, 1, 1,
0.782024, -1.398677, 3.367917, 0.5372549, 0, 1, 1,
0.7830986, 1.244656, 0.1608575, 0.5411765, 0, 1, 1,
0.7839199, -1.147792, 2.398502, 0.5490196, 0, 1, 1,
0.7845276, -0.5637319, 2.532144, 0.5529412, 0, 1, 1,
0.7869162, -0.4898032, 3.622064, 0.5607843, 0, 1, 1,
0.7875199, -0.4754072, 1.85356, 0.5647059, 0, 1, 1,
0.7913645, -0.2024907, 3.845113, 0.572549, 0, 1, 1,
0.794329, -0.2427972, 2.316805, 0.5764706, 0, 1, 1,
0.7963278, 0.9031289, -0.5185355, 0.5843138, 0, 1, 1,
0.8016096, -0.722431, 1.650705, 0.5882353, 0, 1, 1,
0.8039345, 0.6490456, 1.958217, 0.5960785, 0, 1, 1,
0.8051202, 1.046739, 0.6393111, 0.6039216, 0, 1, 1,
0.8078367, -0.3534105, 2.137675, 0.6078432, 0, 1, 1,
0.8188948, 0.3531854, 1.816568, 0.6156863, 0, 1, 1,
0.8203896, -0.9868544, 2.342511, 0.6196079, 0, 1, 1,
0.8267227, 1.922928, 0.1223027, 0.627451, 0, 1, 1,
0.8319497, -0.1510886, 2.885773, 0.6313726, 0, 1, 1,
0.8341149, 1.110315, -0.5300983, 0.6392157, 0, 1, 1,
0.8404641, -1.952884, 3.333539, 0.6431373, 0, 1, 1,
0.8460174, 0.9290386, 0.8941984, 0.6509804, 0, 1, 1,
0.8486092, -0.7114272, 2.883992, 0.654902, 0, 1, 1,
0.8494169, -0.1583559, 0.7377523, 0.6627451, 0, 1, 1,
0.8502477, -0.9478251, 1.625669, 0.6666667, 0, 1, 1,
0.8534939, -0.4762323, 1.32281, 0.6745098, 0, 1, 1,
0.8557403, 0.6133659, 1.101369, 0.6784314, 0, 1, 1,
0.8569731, 1.043444, 1.494137, 0.6862745, 0, 1, 1,
0.8581176, -0.08864959, 3.083926, 0.6901961, 0, 1, 1,
0.8617458, 0.4703179, 1.944399, 0.6980392, 0, 1, 1,
0.8631814, -0.8557021, 3.323148, 0.7058824, 0, 1, 1,
0.863847, 0.8853246, 0.5792835, 0.7098039, 0, 1, 1,
0.8834324, 0.4280879, 2.643914, 0.7176471, 0, 1, 1,
0.8859574, -0.1664065, 2.08422, 0.7215686, 0, 1, 1,
0.8989807, -0.1321066, 2.101448, 0.7294118, 0, 1, 1,
0.9055814, -0.5212663, 1.225985, 0.7333333, 0, 1, 1,
0.9082841, 1.666308, 0.7000465, 0.7411765, 0, 1, 1,
0.9087431, 1.70005, 0.7018038, 0.7450981, 0, 1, 1,
0.9088199, 0.340835, -0.1935339, 0.7529412, 0, 1, 1,
0.9200708, 0.269442, 0.3235903, 0.7568628, 0, 1, 1,
0.9247692, -0.1159573, 1.077826, 0.7647059, 0, 1, 1,
0.9271911, 1.089426, 2.129208, 0.7686275, 0, 1, 1,
0.9279132, -1.123733, 2.680394, 0.7764706, 0, 1, 1,
0.9303723, -0.3738355, 1.912655, 0.7803922, 0, 1, 1,
0.9313157, 1.743074, -0.1453865, 0.7882353, 0, 1, 1,
0.9384334, 0.4692496, 2.021534, 0.7921569, 0, 1, 1,
0.9443273, 0.1617546, 1.355675, 0.8, 0, 1, 1,
0.9541148, 0.2516904, 0.6501153, 0.8078431, 0, 1, 1,
0.9568662, -0.8853747, 2.953822, 0.8117647, 0, 1, 1,
0.9573654, 0.4718617, 0.3578772, 0.8196079, 0, 1, 1,
0.9612588, -1.653388, 2.806295, 0.8235294, 0, 1, 1,
0.9636288, -1.699489, 1.843674, 0.8313726, 0, 1, 1,
0.9671752, -0.3588049, 2.510811, 0.8352941, 0, 1, 1,
0.9684407, 0.8947658, -0.5127273, 0.8431373, 0, 1, 1,
0.9690263, 0.5525221, 1.439826, 0.8470588, 0, 1, 1,
0.9730802, -1.533144, 2.30518, 0.854902, 0, 1, 1,
0.9732832, 1.273101, 1.341871, 0.8588235, 0, 1, 1,
0.9748915, -0.6403439, 0.4179498, 0.8666667, 0, 1, 1,
0.9774714, -0.4016038, 0.9548442, 0.8705882, 0, 1, 1,
0.9862033, 0.2947945, 1.564678, 0.8784314, 0, 1, 1,
0.9866725, 0.3102032, 3.037746, 0.8823529, 0, 1, 1,
0.9899524, -1.147739, 1.299154, 0.8901961, 0, 1, 1,
1.002947, 0.4838067, 2.496793, 0.8941177, 0, 1, 1,
1.003883, -1.393172, 2.488614, 0.9019608, 0, 1, 1,
1.006107, 0.07073674, 2.522518, 0.9098039, 0, 1, 1,
1.008454, -0.07598085, 2.612217, 0.9137255, 0, 1, 1,
1.008683, 1.791845, 0.1623539, 0.9215686, 0, 1, 1,
1.018002, -0.8590453, 2.929129, 0.9254902, 0, 1, 1,
1.019605, 1.02272, 2.280407, 0.9333333, 0, 1, 1,
1.019819, -0.7066922, 1.605299, 0.9372549, 0, 1, 1,
1.022156, -0.07569209, 0.9113179, 0.945098, 0, 1, 1,
1.031777, 0.7228007, 0.2740282, 0.9490196, 0, 1, 1,
1.035816, 0.7016129, 0.4372466, 0.9568627, 0, 1, 1,
1.040494, -1.295562, 1.974764, 0.9607843, 0, 1, 1,
1.040495, -0.398535, 1.050252, 0.9686275, 0, 1, 1,
1.042855, 0.9692245, -0.4138104, 0.972549, 0, 1, 1,
1.057298, -1.702079, 2.219414, 0.9803922, 0, 1, 1,
1.061547, 0.5181777, 0.6373498, 0.9843137, 0, 1, 1,
1.066834, -0.4253024, 3.260205, 0.9921569, 0, 1, 1,
1.067586, -0.2984339, 2.427823, 0.9960784, 0, 1, 1,
1.069518, -0.02576084, -0.1317552, 1, 0, 0.9960784, 1,
1.069982, -1.875911, 2.413841, 1, 0, 0.9882353, 1,
1.088754, -0.1967153, 1.366299, 1, 0, 0.9843137, 1,
1.09051, 1.885129, -0.1132936, 1, 0, 0.9764706, 1,
1.092026, -0.940214, 1.857856, 1, 0, 0.972549, 1,
1.092386, -0.0737558, 3.527583, 1, 0, 0.9647059, 1,
1.093925, -0.8742809, 1.002603, 1, 0, 0.9607843, 1,
1.094193, 0.1410448, 2.937506, 1, 0, 0.9529412, 1,
1.102674, 0.8289409, 0.1412175, 1, 0, 0.9490196, 1,
1.123509, -0.1284629, 1.029885, 1, 0, 0.9411765, 1,
1.126514, 0.08822703, 1.276545, 1, 0, 0.9372549, 1,
1.12711, -0.7355667, 0.8873009, 1, 0, 0.9294118, 1,
1.133423, 0.5114012, 1.588534, 1, 0, 0.9254902, 1,
1.133736, 1.309326, 1.429767, 1, 0, 0.9176471, 1,
1.134019, -0.02623317, 1.602579, 1, 0, 0.9137255, 1,
1.135131, -0.8897914, 1.428236, 1, 0, 0.9058824, 1,
1.13764, 0.06627233, 1.546305, 1, 0, 0.9019608, 1,
1.137713, 0.2751646, 1.449683, 1, 0, 0.8941177, 1,
1.141652, 1.350207, 0.7513025, 1, 0, 0.8862745, 1,
1.141954, -0.7021908, 1.222587, 1, 0, 0.8823529, 1,
1.146563, -0.01541236, 0.2458483, 1, 0, 0.8745098, 1,
1.147844, 1.650079, 0.907784, 1, 0, 0.8705882, 1,
1.161375, -0.52877, 0.5056092, 1, 0, 0.8627451, 1,
1.1689, 2.086741, 1.446055, 1, 0, 0.8588235, 1,
1.170635, 1.086816, 1.39786, 1, 0, 0.8509804, 1,
1.175825, -0.3510004, 1.182605, 1, 0, 0.8470588, 1,
1.18477, -0.4362074, 1.866264, 1, 0, 0.8392157, 1,
1.186271, 0.1951866, 2.300444, 1, 0, 0.8352941, 1,
1.196039, 1.627944, -1.690014, 1, 0, 0.827451, 1,
1.200669, 1.005497, 1.501187, 1, 0, 0.8235294, 1,
1.208273, 0.9485106, 0.9293886, 1, 0, 0.8156863, 1,
1.211386, -0.7863048, 4.002614, 1, 0, 0.8117647, 1,
1.211926, 0.8047694, 2.164891, 1, 0, 0.8039216, 1,
1.22191, -2.108089, 3.567357, 1, 0, 0.7960784, 1,
1.225917, -0.09191152, 1.407107, 1, 0, 0.7921569, 1,
1.226604, -0.5847101, 2.536528, 1, 0, 0.7843137, 1,
1.22828, 0.293038, 1.319134, 1, 0, 0.7803922, 1,
1.230136, 1.665055, -0.2798011, 1, 0, 0.772549, 1,
1.231449, -1.261982, 1.739712, 1, 0, 0.7686275, 1,
1.24347, -0.2889912, 2.744806, 1, 0, 0.7607843, 1,
1.24776, 0.229559, 2.594961, 1, 0, 0.7568628, 1,
1.252097, 0.7124351, 0.9977335, 1, 0, 0.7490196, 1,
1.254975, 0.7092313, 1.353557, 1, 0, 0.7450981, 1,
1.26625, -0.7582722, 4.326276, 1, 0, 0.7372549, 1,
1.27426, 2.140023, 2.627882, 1, 0, 0.7333333, 1,
1.27561, 0.4902745, 1.652234, 1, 0, 0.7254902, 1,
1.275893, -0.7406004, 1.386546, 1, 0, 0.7215686, 1,
1.279635, 0.5711342, -0.6714233, 1, 0, 0.7137255, 1,
1.286965, 1.121136, -0.4404288, 1, 0, 0.7098039, 1,
1.28766, -0.2037407, 0.8489739, 1, 0, 0.7019608, 1,
1.288048, 0.4235513, 0.9304495, 1, 0, 0.6941177, 1,
1.289585, 0.4397418, 1.562308, 1, 0, 0.6901961, 1,
1.290365, -1.262922, 3.07332, 1, 0, 0.682353, 1,
1.29154, -1.657629, 2.076222, 1, 0, 0.6784314, 1,
1.310203, -0.9134927, 0.8929212, 1, 0, 0.6705883, 1,
1.314677, -0.1084, 2.974711, 1, 0, 0.6666667, 1,
1.322032, -0.3384034, 2.536175, 1, 0, 0.6588235, 1,
1.324765, 1.284726, 1.837171, 1, 0, 0.654902, 1,
1.32515, 0.03428863, -1.082129, 1, 0, 0.6470588, 1,
1.327405, 0.3283253, 0.1793541, 1, 0, 0.6431373, 1,
1.332884, -1.370277, 2.955248, 1, 0, 0.6352941, 1,
1.337053, 0.5692023, 1.386051, 1, 0, 0.6313726, 1,
1.342866, 0.868387, 1.091482, 1, 0, 0.6235294, 1,
1.343518, -0.7665808, 3.849581, 1, 0, 0.6196079, 1,
1.345465, -0.6920314, 2.798772, 1, 0, 0.6117647, 1,
1.352593, -0.8545969, 2.006245, 1, 0, 0.6078432, 1,
1.353738, -0.4322398, 1.462161, 1, 0, 0.6, 1,
1.361743, -0.2932352, 3.123605, 1, 0, 0.5921569, 1,
1.370089, -0.1663152, 2.513974, 1, 0, 0.5882353, 1,
1.370812, 1.698578, 0.6213775, 1, 0, 0.5803922, 1,
1.371212, 0.7879456, 1.311551, 1, 0, 0.5764706, 1,
1.375118, 0.8948778, 1.684309, 1, 0, 0.5686275, 1,
1.377887, 1.333645, -0.3071809, 1, 0, 0.5647059, 1,
1.379505, -1.167241, 2.513122, 1, 0, 0.5568628, 1,
1.385026, 1.103213, 1.055809, 1, 0, 0.5529412, 1,
1.386413, -0.9778301, 1.670057, 1, 0, 0.5450981, 1,
1.396485, 1.760759, 1.187999, 1, 0, 0.5411765, 1,
1.401032, 1.014528, 1.278265, 1, 0, 0.5333334, 1,
1.409944, -0.5604088, 2.204888, 1, 0, 0.5294118, 1,
1.410202, -0.4985205, 2.423717, 1, 0, 0.5215687, 1,
1.418188, -0.1981003, 1.23744, 1, 0, 0.5176471, 1,
1.421166, -1.209706, 2.505148, 1, 0, 0.509804, 1,
1.427857, 1.113949, 1.096748, 1, 0, 0.5058824, 1,
1.428954, 0.6357573, 2.180405, 1, 0, 0.4980392, 1,
1.43752, 0.6219522, 1.746656, 1, 0, 0.4901961, 1,
1.442635, 0.4676612, 1.006031, 1, 0, 0.4862745, 1,
1.455908, 0.0906123, 1.978495, 1, 0, 0.4784314, 1,
1.458521, 0.9525528, -1.251221, 1, 0, 0.4745098, 1,
1.459843, -0.4052649, 2.555129, 1, 0, 0.4666667, 1,
1.466938, 0.6224414, -0.6333162, 1, 0, 0.4627451, 1,
1.468902, -1.467056, 2.406734, 1, 0, 0.454902, 1,
1.472286, 0.9525702, 1.854598, 1, 0, 0.4509804, 1,
1.473289, 0.380921, 2.220775, 1, 0, 0.4431373, 1,
1.480416, 1.2312, 0.6028555, 1, 0, 0.4392157, 1,
1.490902, 0.8925343, 2.521155, 1, 0, 0.4313726, 1,
1.496135, 0.574763, 2.340168, 1, 0, 0.427451, 1,
1.497719, -1.077126, 1.603057, 1, 0, 0.4196078, 1,
1.503951, 0.5985711, 3.356818, 1, 0, 0.4156863, 1,
1.51303, -0.7032249, 1.316257, 1, 0, 0.4078431, 1,
1.515014, 0.5054937, 2.701592, 1, 0, 0.4039216, 1,
1.534906, -1.600052, 1.428853, 1, 0, 0.3960784, 1,
1.537263, 0.01579991, 3.084061, 1, 0, 0.3882353, 1,
1.544477, 0.2915176, 1.203401, 1, 0, 0.3843137, 1,
1.558432, 0.2132792, 2.292527, 1, 0, 0.3764706, 1,
1.573572, -0.4496469, 2.514671, 1, 0, 0.372549, 1,
1.580252, -0.3474638, 1.207631, 1, 0, 0.3647059, 1,
1.634591, 0.4667066, 1.174142, 1, 0, 0.3607843, 1,
1.645294, -1.209878, 3.444499, 1, 0, 0.3529412, 1,
1.653705, 0.4618999, 2.85104, 1, 0, 0.3490196, 1,
1.656346, -1.313652, 3.101899, 1, 0, 0.3411765, 1,
1.669175, -0.2361861, 1.807277, 1, 0, 0.3372549, 1,
1.670349, 1.124739, 2.188771, 1, 0, 0.3294118, 1,
1.673915, 0.5595639, 0.1694912, 1, 0, 0.3254902, 1,
1.675889, -0.03721211, -0.1527628, 1, 0, 0.3176471, 1,
1.686937, 0.003172948, 1.646816, 1, 0, 0.3137255, 1,
1.698746, 0.308341, 1.328163, 1, 0, 0.3058824, 1,
1.709023, 0.4962789, 0.8336092, 1, 0, 0.2980392, 1,
1.709935, 0.7535754, 1.038791, 1, 0, 0.2941177, 1,
1.718223, 1.60738, 3.121987, 1, 0, 0.2862745, 1,
1.718656, 1.496706, 1.991426, 1, 0, 0.282353, 1,
1.722438, -1.139411, -0.1283297, 1, 0, 0.2745098, 1,
1.723349, -0.6144994, 0.3889138, 1, 0, 0.2705882, 1,
1.779878, -1.917788, 4.410397, 1, 0, 0.2627451, 1,
1.782591, 0.2504278, 0.6422569, 1, 0, 0.2588235, 1,
1.787498, -0.9920741, 1.814988, 1, 0, 0.2509804, 1,
1.801024, -1.673272, 1.572217, 1, 0, 0.2470588, 1,
1.809458, 0.02879161, 0.7384664, 1, 0, 0.2392157, 1,
1.81757, -0.4858347, 2.743246, 1, 0, 0.2352941, 1,
1.835974, 0.6513204, 0.2191272, 1, 0, 0.227451, 1,
1.840876, -0.2254515, -0.6749858, 1, 0, 0.2235294, 1,
1.852742, 0.7586423, 0.6967153, 1, 0, 0.2156863, 1,
1.895403, -0.3123558, 2.328402, 1, 0, 0.2117647, 1,
1.909834, -0.3986165, 0.6774415, 1, 0, 0.2039216, 1,
1.926483, 0.7270858, 2.441065, 1, 0, 0.1960784, 1,
1.94015, -1.183885, 0.3421679, 1, 0, 0.1921569, 1,
1.959082, 0.7829766, -0.2828107, 1, 0, 0.1843137, 1,
1.980607, -0.3429889, 0.9976616, 1, 0, 0.1803922, 1,
1.98855, 1.348876, 1.813031, 1, 0, 0.172549, 1,
2.00112, 0.2031101, 2.748643, 1, 0, 0.1686275, 1,
2.025901, -0.3691357, 0.1365771, 1, 0, 0.1607843, 1,
2.042654, 0.3020507, 0.9845752, 1, 0, 0.1568628, 1,
2.047549, 1.245768, 2.205362, 1, 0, 0.1490196, 1,
2.055223, 0.2769395, 0.7564765, 1, 0, 0.145098, 1,
2.068414, 1.453691, 0.9139688, 1, 0, 0.1372549, 1,
2.076933, 0.5705588, 0.8154447, 1, 0, 0.1333333, 1,
2.078372, -0.8282729, 2.491789, 1, 0, 0.1254902, 1,
2.0903, -0.8564995, 1.952456, 1, 0, 0.1215686, 1,
2.10711, -0.2869003, 2.556604, 1, 0, 0.1137255, 1,
2.147294, -1.647394, 3.190161, 1, 0, 0.1098039, 1,
2.151548, -0.1120483, 2.286644, 1, 0, 0.1019608, 1,
2.155533, 0.9072379, 0.4623979, 1, 0, 0.09411765, 1,
2.160126, -0.6766212, 1.917049, 1, 0, 0.09019608, 1,
2.188078, 0.1802702, 0.7682679, 1, 0, 0.08235294, 1,
2.233683, 0.2750918, 0.8105478, 1, 0, 0.07843138, 1,
2.250515, -1.315903, 2.086409, 1, 0, 0.07058824, 1,
2.279952, 0.947544, 0.04190426, 1, 0, 0.06666667, 1,
2.29807, 0.5265963, 0.2230499, 1, 0, 0.05882353, 1,
2.298114, 0.1008073, 1.238719, 1, 0, 0.05490196, 1,
2.300299, 1.356439, -0.3225587, 1, 0, 0.04705882, 1,
2.314621, 1.486987, -0.8652797, 1, 0, 0.04313726, 1,
2.31847, -2.159418, 1.347785, 1, 0, 0.03529412, 1,
2.340928, -0.4253919, 2.850809, 1, 0, 0.03137255, 1,
2.436831, 3.570454, 0.7890477, 1, 0, 0.02352941, 1,
2.441816, -0.7048146, 3.60904, 1, 0, 0.01960784, 1,
2.458603, -0.005638806, 2.116325, 1, 0, 0.01176471, 1,
2.545957, -0.9894144, 1.973424, 1, 0, 0.007843138, 1
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
-0.3378506, -3.948318, -8.196027, 0, -0.5, 0.5, 0.5,
-0.3378506, -3.948318, -8.196027, 1, -0.5, 0.5, 0.5,
-0.3378506, -3.948318, -8.196027, 1, 1.5, 0.5, 0.5,
-0.3378506, -3.948318, -8.196027, 0, 1.5, 0.5, 0.5
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
-4.199269, 0.376381, -8.196027, 0, -0.5, 0.5, 0.5,
-4.199269, 0.376381, -8.196027, 1, -0.5, 0.5, 0.5,
-4.199269, 0.376381, -8.196027, 1, 1.5, 0.5, 0.5,
-4.199269, 0.376381, -8.196027, 0, 1.5, 0.5, 0.5
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
-4.199269, -3.948318, -0.6507494, 0, -0.5, 0.5, 0.5,
-4.199269, -3.948318, -0.6507494, 1, -0.5, 0.5, 0.5,
-4.199269, -3.948318, -0.6507494, 1, 1.5, 0.5, 0.5,
-4.199269, -3.948318, -0.6507494, 0, 1.5, 0.5, 0.5
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
-3, -2.95031, -6.454809,
2, -2.95031, -6.454809,
-3, -2.95031, -6.454809,
-3, -3.116645, -6.745012,
-2, -2.95031, -6.454809,
-2, -3.116645, -6.745012,
-1, -2.95031, -6.454809,
-1, -3.116645, -6.745012,
0, -2.95031, -6.454809,
0, -3.116645, -6.745012,
1, -2.95031, -6.454809,
1, -3.116645, -6.745012,
2, -2.95031, -6.454809,
2, -3.116645, -6.745012
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
-3, -3.449314, -7.325418, 0, -0.5, 0.5, 0.5,
-3, -3.449314, -7.325418, 1, -0.5, 0.5, 0.5,
-3, -3.449314, -7.325418, 1, 1.5, 0.5, 0.5,
-3, -3.449314, -7.325418, 0, 1.5, 0.5, 0.5,
-2, -3.449314, -7.325418, 0, -0.5, 0.5, 0.5,
-2, -3.449314, -7.325418, 1, -0.5, 0.5, 0.5,
-2, -3.449314, -7.325418, 1, 1.5, 0.5, 0.5,
-2, -3.449314, -7.325418, 0, 1.5, 0.5, 0.5,
-1, -3.449314, -7.325418, 0, -0.5, 0.5, 0.5,
-1, -3.449314, -7.325418, 1, -0.5, 0.5, 0.5,
-1, -3.449314, -7.325418, 1, 1.5, 0.5, 0.5,
-1, -3.449314, -7.325418, 0, 1.5, 0.5, 0.5,
0, -3.449314, -7.325418, 0, -0.5, 0.5, 0.5,
0, -3.449314, -7.325418, 1, -0.5, 0.5, 0.5,
0, -3.449314, -7.325418, 1, 1.5, 0.5, 0.5,
0, -3.449314, -7.325418, 0, 1.5, 0.5, 0.5,
1, -3.449314, -7.325418, 0, -0.5, 0.5, 0.5,
1, -3.449314, -7.325418, 1, -0.5, 0.5, 0.5,
1, -3.449314, -7.325418, 1, 1.5, 0.5, 0.5,
1, -3.449314, -7.325418, 0, 1.5, 0.5, 0.5,
2, -3.449314, -7.325418, 0, -0.5, 0.5, 0.5,
2, -3.449314, -7.325418, 1, -0.5, 0.5, 0.5,
2, -3.449314, -7.325418, 1, 1.5, 0.5, 0.5,
2, -3.449314, -7.325418, 0, 1.5, 0.5, 0.5
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
-3.308172, -2, -6.454809,
-3.308172, 3, -6.454809,
-3.308172, -2, -6.454809,
-3.456689, -2, -6.745012,
-3.308172, -1, -6.454809,
-3.456689, -1, -6.745012,
-3.308172, 0, -6.454809,
-3.456689, 0, -6.745012,
-3.308172, 1, -6.454809,
-3.456689, 1, -6.745012,
-3.308172, 2, -6.454809,
-3.456689, 2, -6.745012,
-3.308172, 3, -6.454809,
-3.456689, 3, -6.745012
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
-3.753721, -2, -7.325418, 0, -0.5, 0.5, 0.5,
-3.753721, -2, -7.325418, 1, -0.5, 0.5, 0.5,
-3.753721, -2, -7.325418, 1, 1.5, 0.5, 0.5,
-3.753721, -2, -7.325418, 0, 1.5, 0.5, 0.5,
-3.753721, -1, -7.325418, 0, -0.5, 0.5, 0.5,
-3.753721, -1, -7.325418, 1, -0.5, 0.5, 0.5,
-3.753721, -1, -7.325418, 1, 1.5, 0.5, 0.5,
-3.753721, -1, -7.325418, 0, 1.5, 0.5, 0.5,
-3.753721, 0, -7.325418, 0, -0.5, 0.5, 0.5,
-3.753721, 0, -7.325418, 1, -0.5, 0.5, 0.5,
-3.753721, 0, -7.325418, 1, 1.5, 0.5, 0.5,
-3.753721, 0, -7.325418, 0, 1.5, 0.5, 0.5,
-3.753721, 1, -7.325418, 0, -0.5, 0.5, 0.5,
-3.753721, 1, -7.325418, 1, -0.5, 0.5, 0.5,
-3.753721, 1, -7.325418, 1, 1.5, 0.5, 0.5,
-3.753721, 1, -7.325418, 0, 1.5, 0.5, 0.5,
-3.753721, 2, -7.325418, 0, -0.5, 0.5, 0.5,
-3.753721, 2, -7.325418, 1, -0.5, 0.5, 0.5,
-3.753721, 2, -7.325418, 1, 1.5, 0.5, 0.5,
-3.753721, 2, -7.325418, 0, 1.5, 0.5, 0.5,
-3.753721, 3, -7.325418, 0, -0.5, 0.5, 0.5,
-3.753721, 3, -7.325418, 1, -0.5, 0.5, 0.5,
-3.753721, 3, -7.325418, 1, 1.5, 0.5, 0.5,
-3.753721, 3, -7.325418, 0, 1.5, 0.5, 0.5
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
-3.308172, -2.95031, -6,
-3.308172, -2.95031, 4,
-3.308172, -2.95031, -6,
-3.456689, -3.116645, -6,
-3.308172, -2.95031, -4,
-3.456689, -3.116645, -4,
-3.308172, -2.95031, -2,
-3.456689, -3.116645, -2,
-3.308172, -2.95031, 0,
-3.456689, -3.116645, 0,
-3.308172, -2.95031, 2,
-3.456689, -3.116645, 2,
-3.308172, -2.95031, 4,
-3.456689, -3.116645, 4
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
"-6",
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
-3.753721, -3.449314, -6, 0, -0.5, 0.5, 0.5,
-3.753721, -3.449314, -6, 1, -0.5, 0.5, 0.5,
-3.753721, -3.449314, -6, 1, 1.5, 0.5, 0.5,
-3.753721, -3.449314, -6, 0, 1.5, 0.5, 0.5,
-3.753721, -3.449314, -4, 0, -0.5, 0.5, 0.5,
-3.753721, -3.449314, -4, 1, -0.5, 0.5, 0.5,
-3.753721, -3.449314, -4, 1, 1.5, 0.5, 0.5,
-3.753721, -3.449314, -4, 0, 1.5, 0.5, 0.5,
-3.753721, -3.449314, -2, 0, -0.5, 0.5, 0.5,
-3.753721, -3.449314, -2, 1, -0.5, 0.5, 0.5,
-3.753721, -3.449314, -2, 1, 1.5, 0.5, 0.5,
-3.753721, -3.449314, -2, 0, 1.5, 0.5, 0.5,
-3.753721, -3.449314, 0, 0, -0.5, 0.5, 0.5,
-3.753721, -3.449314, 0, 1, -0.5, 0.5, 0.5,
-3.753721, -3.449314, 0, 1, 1.5, 0.5, 0.5,
-3.753721, -3.449314, 0, 0, 1.5, 0.5, 0.5,
-3.753721, -3.449314, 2, 0, -0.5, 0.5, 0.5,
-3.753721, -3.449314, 2, 1, -0.5, 0.5, 0.5,
-3.753721, -3.449314, 2, 1, 1.5, 0.5, 0.5,
-3.753721, -3.449314, 2, 0, 1.5, 0.5, 0.5,
-3.753721, -3.449314, 4, 0, -0.5, 0.5, 0.5,
-3.753721, -3.449314, 4, 1, -0.5, 0.5, 0.5,
-3.753721, -3.449314, 4, 1, 1.5, 0.5, 0.5,
-3.753721, -3.449314, 4, 0, 1.5, 0.5, 0.5
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
-3.308172, -2.95031, -6.454809,
-3.308172, 3.703073, -6.454809,
-3.308172, -2.95031, 5.15331,
-3.308172, 3.703073, 5.15331,
-3.308172, -2.95031, -6.454809,
-3.308172, -2.95031, 5.15331,
-3.308172, 3.703073, -6.454809,
-3.308172, 3.703073, 5.15331,
-3.308172, -2.95031, -6.454809,
2.632471, -2.95031, -6.454809,
-3.308172, -2.95031, 5.15331,
2.632471, -2.95031, 5.15331,
-3.308172, 3.703073, -6.454809,
2.632471, 3.703073, -6.454809,
-3.308172, 3.703073, 5.15331,
2.632471, 3.703073, 5.15331,
2.632471, -2.95031, -6.454809,
2.632471, 3.703073, -6.454809,
2.632471, -2.95031, 5.15331,
2.632471, 3.703073, 5.15331,
2.632471, -2.95031, -6.454809,
2.632471, -2.95031, 5.15331,
2.632471, 3.703073, -6.454809,
2.632471, 3.703073, 5.15331
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
var radius = 7.817067;
var distance = 34.77901;
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
mvMatrix.translate( 0.3378506, -0.376381, 0.6507494 );
mvMatrix.scale( 1.422736, 1.270326, 0.7281081 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.77901);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
nonachlor<-read.table("nonachlor.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nonachlor$V2
```

```
## Error in eval(expr, envir, enclos): object 'nonachlor' not found
```

```r
y<-nonachlor$V3
```

```
## Error in eval(expr, envir, enclos): object 'nonachlor' not found
```

```r
z<-nonachlor$V4
```

```
## Error in eval(expr, envir, enclos): object 'nonachlor' not found
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
-3.221658, -0.4758624, -1.840449, 0, 0, 1, 1, 1,
-2.934264, -0.4815914, -1.443771, 1, 0, 0, 1, 1,
-2.622291, 0.869229, -4.838681, 1, 0, 0, 1, 1,
-2.488406, -0.8395935, -1.293379, 1, 0, 0, 1, 1,
-2.35986, -0.3136248, -0.6200668, 1, 0, 0, 1, 1,
-2.34581, 0.6238125, -2.07271, 1, 0, 0, 1, 1,
-2.335609, 0.1009055, -1.643218, 0, 0, 0, 1, 1,
-2.272505, -0.5594652, -2.658813, 0, 0, 0, 1, 1,
-2.266218, 0.2459728, -2.867646, 0, 0, 0, 1, 1,
-2.23876, -0.5480174, -0.6494699, 0, 0, 0, 1, 1,
-2.19597, 0.8857701, -2.113873, 0, 0, 0, 1, 1,
-2.172733, -0.4047007, -3.504582, 0, 0, 0, 1, 1,
-2.048905, 0.2610322, -0.02351449, 0, 0, 0, 1, 1,
-2.047155, -1.282495, -3.007846, 1, 1, 1, 1, 1,
-2.025311, 0.9381354, -1.101263, 1, 1, 1, 1, 1,
-1.973492, 0.3763048, -1.261187, 1, 1, 1, 1, 1,
-1.968028, -0.104561, -2.420089, 1, 1, 1, 1, 1,
-1.960751, -1.299647, -3.319215, 1, 1, 1, 1, 1,
-1.952616, 0.1738278, -1.059388, 1, 1, 1, 1, 1,
-1.926344, -0.9643448, -2.615349, 1, 1, 1, 1, 1,
-1.921878, -1.456259, -1.857778, 1, 1, 1, 1, 1,
-1.889535, -0.7795628, -1.466534, 1, 1, 1, 1, 1,
-1.86868, 1.723114, -0.7167216, 1, 1, 1, 1, 1,
-1.851501, 0.5818325, -0.2108514, 1, 1, 1, 1, 1,
-1.850261, -0.4480327, -3.221175, 1, 1, 1, 1, 1,
-1.828688, 0.7704532, 0.6288434, 1, 1, 1, 1, 1,
-1.825107, 0.9618081, 1.00877, 1, 1, 1, 1, 1,
-1.815091, 1.044337, -0.5428561, 1, 1, 1, 1, 1,
-1.811718, -1.203096, -3.452514, 0, 0, 1, 1, 1,
-1.800809, -0.2069797, -1.661497, 1, 0, 0, 1, 1,
-1.795271, -0.5390304, -4.874115, 1, 0, 0, 1, 1,
-1.789976, -0.1619432, -2.303509, 1, 0, 0, 1, 1,
-1.776812, 0.04325049, -1.819222, 1, 0, 0, 1, 1,
-1.7764, -0.2726356, -1.857618, 1, 0, 0, 1, 1,
-1.773267, -0.4645869, -2.0387, 0, 0, 0, 1, 1,
-1.750956, 0.7638689, -2.298561, 0, 0, 0, 1, 1,
-1.738878, 1.401561, -0.4714437, 0, 0, 0, 1, 1,
-1.73614, -1.34828, -2.40093, 0, 0, 0, 1, 1,
-1.70734, -1.245914, -1.813047, 0, 0, 0, 1, 1,
-1.685549, 0.531351, -0.1393945, 0, 0, 0, 1, 1,
-1.672714, -0.555548, -1.795923, 0, 0, 0, 1, 1,
-1.662471, -1.517675, -0.6920015, 1, 1, 1, 1, 1,
-1.654845, 0.06494752, -2.767441, 1, 1, 1, 1, 1,
-1.634582, 2.850468, -1.818599, 1, 1, 1, 1, 1,
-1.615343, 0.4955795, 0.4173521, 1, 1, 1, 1, 1,
-1.612446, -0.5301173, -2.470784, 1, 1, 1, 1, 1,
-1.60669, -0.4721014, -2.158769, 1, 1, 1, 1, 1,
-1.601421, 0.2777535, -1.53466, 1, 1, 1, 1, 1,
-1.598889, -0.9135451, -0.8187373, 1, 1, 1, 1, 1,
-1.590612, 1.416249, -0.6181504, 1, 1, 1, 1, 1,
-1.579726, 0.505769, -1.291612, 1, 1, 1, 1, 1,
-1.572902, 0.9388936, -2.18704, 1, 1, 1, 1, 1,
-1.558453, 0.9771217, -0.648922, 1, 1, 1, 1, 1,
-1.55645, -0.5172712, -3.27402, 1, 1, 1, 1, 1,
-1.539456, -0.429391, -1.642692, 1, 1, 1, 1, 1,
-1.537036, 0.2587364, -1.800686, 1, 1, 1, 1, 1,
-1.534624, 0.1540424, -2.422707, 0, 0, 1, 1, 1,
-1.52626, 0.4885367, -0.6095964, 1, 0, 0, 1, 1,
-1.515837, -0.2876349, -1.924595, 1, 0, 0, 1, 1,
-1.511795, 0.7603797, 0.6648943, 1, 0, 0, 1, 1,
-1.509693, 0.2496519, 0.5717972, 1, 0, 0, 1, 1,
-1.508588, -0.9445257, -0.2494775, 1, 0, 0, 1, 1,
-1.501088, 0.1287704, -2.621737, 0, 0, 0, 1, 1,
-1.497468, -0.0009010995, -0.3014122, 0, 0, 0, 1, 1,
-1.496974, -0.3406085, -2.111218, 0, 0, 0, 1, 1,
-1.496586, 0.4276001, -2.376189, 0, 0, 0, 1, 1,
-1.485654, -0.241211, -1.71205, 0, 0, 0, 1, 1,
-1.482901, -0.3602875, 0.8896763, 0, 0, 0, 1, 1,
-1.476684, 0.1953183, -2.589288, 0, 0, 0, 1, 1,
-1.476562, 0.8925919, -0.9785117, 1, 1, 1, 1, 1,
-1.474293, 0.2572657, -0.9987568, 1, 1, 1, 1, 1,
-1.473677, -0.5016796, -2.81024, 1, 1, 1, 1, 1,
-1.471293, 1.096092, -1.211861, 1, 1, 1, 1, 1,
-1.471056, -0.2130054, -2.678083, 1, 1, 1, 1, 1,
-1.465172, -2.082092, -1.42327, 1, 1, 1, 1, 1,
-1.46228, 0.3525312, -0.8259555, 1, 1, 1, 1, 1,
-1.444441, -0.07284034, -1.591442, 1, 1, 1, 1, 1,
-1.444002, 1.275291, -2.211685, 1, 1, 1, 1, 1,
-1.44199, -0.1269811, -2.143345, 1, 1, 1, 1, 1,
-1.42919, -0.5836484, -1.359174, 1, 1, 1, 1, 1,
-1.426853, -0.3759387, -0.9454679, 1, 1, 1, 1, 1,
-1.417613, -0.23999, -1.919504, 1, 1, 1, 1, 1,
-1.403371, 0.685589, -1.267756, 1, 1, 1, 1, 1,
-1.395793, -0.8984541, -2.179813, 1, 1, 1, 1, 1,
-1.383882, 0.2024936, -1.838382, 0, 0, 1, 1, 1,
-1.37362, 0.6089015, -0.9400406, 1, 0, 0, 1, 1,
-1.359145, -1.387103, -3.245967, 1, 0, 0, 1, 1,
-1.347846, 0.3295725, -2.764688, 1, 0, 0, 1, 1,
-1.347646, -0.3466057, -1.986958, 1, 0, 0, 1, 1,
-1.347209, -1.615374, -0.9935303, 1, 0, 0, 1, 1,
-1.331144, -0.9608935, -3.208857, 0, 0, 0, 1, 1,
-1.30934, -0.5002954, -2.07138, 0, 0, 0, 1, 1,
-1.298811, -0.4344329, -0.1856619, 0, 0, 0, 1, 1,
-1.297307, -1.959523, -0.8028983, 0, 0, 0, 1, 1,
-1.293493, -0.5409533, -3.41056, 0, 0, 0, 1, 1,
-1.287789, -1.485046, -2.55596, 0, 0, 0, 1, 1,
-1.286076, -0.7372868, -1.381904, 0, 0, 0, 1, 1,
-1.283814, -0.2819918, -1.262981, 1, 1, 1, 1, 1,
-1.282528, -0.3833937, -1.787851, 1, 1, 1, 1, 1,
-1.281964, 0.09761975, -1.94277, 1, 1, 1, 1, 1,
-1.27706, 1.113588, 0.3380449, 1, 1, 1, 1, 1,
-1.273701, -0.1650657, -1.706482, 1, 1, 1, 1, 1,
-1.269371, 0.3400975, -0.5984235, 1, 1, 1, 1, 1,
-1.268493, -0.3016757, -1.914918, 1, 1, 1, 1, 1,
-1.263924, -0.05448074, -1.915764, 1, 1, 1, 1, 1,
-1.260662, 1.198491, -1.734083, 1, 1, 1, 1, 1,
-1.25375, -1.297938, -3.530127, 1, 1, 1, 1, 1,
-1.25266, -0.2037236, -1.231725, 1, 1, 1, 1, 1,
-1.252539, -0.3010224, 0.9932501, 1, 1, 1, 1, 1,
-1.250157, -1.058209, -3.239436, 1, 1, 1, 1, 1,
-1.241537, -2.179746, -2.493571, 1, 1, 1, 1, 1,
-1.239273, 0.2028562, -1.175603, 1, 1, 1, 1, 1,
-1.220678, -0.592194, -1.282219, 0, 0, 1, 1, 1,
-1.216303, 2.148466, -0.8487043, 1, 0, 0, 1, 1,
-1.21464, -0.3356588, -0.7723709, 1, 0, 0, 1, 1,
-1.212085, -0.2525745, -2.367269, 1, 0, 0, 1, 1,
-1.195988, -0.1020681, -0.23667, 1, 0, 0, 1, 1,
-1.194667, 0.1614257, -0.8973458, 1, 0, 0, 1, 1,
-1.189596, -0.1056625, -2.214492, 0, 0, 0, 1, 1,
-1.176232, 1.330457, 0.1494691, 0, 0, 0, 1, 1,
-1.172891, 0.6474082, -2.388437, 0, 0, 0, 1, 1,
-1.159967, 0.8529559, -1.278615, 0, 0, 0, 1, 1,
-1.154241, -0.1478187, -0.4872721, 0, 0, 0, 1, 1,
-1.146512, -1.617831, -0.9837296, 0, 0, 0, 1, 1,
-1.146268, 1.156962, -1.192738, 0, 0, 0, 1, 1,
-1.145936, -1.643388, -4.609062, 1, 1, 1, 1, 1,
-1.143444, 0.9384615, 1.272976, 1, 1, 1, 1, 1,
-1.139188, -0.5005355, -0.2066443, 1, 1, 1, 1, 1,
-1.136506, 0.8992314, -1.315558, 1, 1, 1, 1, 1,
-1.128969, -0.5466231, -2.195175, 1, 1, 1, 1, 1,
-1.128854, 2.112959, 0.06016867, 1, 1, 1, 1, 1,
-1.122054, 0.05269354, -2.282123, 1, 1, 1, 1, 1,
-1.106216, 0.03989315, -0.449563, 1, 1, 1, 1, 1,
-1.101117, -1.447859, -3.302619, 1, 1, 1, 1, 1,
-1.095857, -1.190593, -1.377304, 1, 1, 1, 1, 1,
-1.082255, -0.4807, -0.4650872, 1, 1, 1, 1, 1,
-1.081719, -1.435234, -1.982733, 1, 1, 1, 1, 1,
-1.078099, 0.03341047, -1.529048, 1, 1, 1, 1, 1,
-1.074259, -1.128641, -2.217336, 1, 1, 1, 1, 1,
-1.072502, -0.976719, -1.303641, 1, 1, 1, 1, 1,
-1.066079, 1.061138, 0.1276769, 0, 0, 1, 1, 1,
-1.0633, 0.1504938, -1.891006, 1, 0, 0, 1, 1,
-1.051151, 1.973118, -0.746568, 1, 0, 0, 1, 1,
-1.046103, 0.9927388, -0.2262252, 1, 0, 0, 1, 1,
-1.041879, -0.144119, -2.195063, 1, 0, 0, 1, 1,
-1.032552, 0.4795557, -2.141734, 1, 0, 0, 1, 1,
-1.028937, 0.09914903, -2.886638, 0, 0, 0, 1, 1,
-1.025513, -1.067408, -3.434713, 0, 0, 0, 1, 1,
-1.003607, -0.5538339, -0.2328665, 0, 0, 0, 1, 1,
-0.998142, -0.2371038, -1.896646, 0, 0, 0, 1, 1,
-0.9872195, 0.5923294, 0.7809094, 0, 0, 0, 1, 1,
-0.9841152, 0.1147992, -1.102973, 0, 0, 0, 1, 1,
-0.9793859, 0.1487384, -1.586001, 0, 0, 0, 1, 1,
-0.9776526, 0.143096, -2.072286, 1, 1, 1, 1, 1,
-0.9759725, -1.466094, -2.610452, 1, 1, 1, 1, 1,
-0.975866, 0.8883138, -1.077181, 1, 1, 1, 1, 1,
-0.9668744, 0.7834002, 0.8495857, 1, 1, 1, 1, 1,
-0.9575108, 2.583974, -1.035251, 1, 1, 1, 1, 1,
-0.9574402, -0.7025613, -2.042874, 1, 1, 1, 1, 1,
-0.9569811, -1.130372, -1.470418, 1, 1, 1, 1, 1,
-0.9563076, 2.026902, -0.4833933, 1, 1, 1, 1, 1,
-0.9527715, 0.4037352, -0.2825487, 1, 1, 1, 1, 1,
-0.9492873, 2.348812, -1.283477, 1, 1, 1, 1, 1,
-0.940275, 1.688608, -1.521974, 1, 1, 1, 1, 1,
-0.9334704, -1.082735, -2.82733, 1, 1, 1, 1, 1,
-0.9310604, -0.8858905, -2.324287, 1, 1, 1, 1, 1,
-0.9299986, 0.7181697, -1.521656, 1, 1, 1, 1, 1,
-0.9286361, 0.8530262, -2.020285, 1, 1, 1, 1, 1,
-0.9254783, 0.2699482, -0.9511933, 0, 0, 1, 1, 1,
-0.9254283, 0.5899961, -2.688895, 1, 0, 0, 1, 1,
-0.9228268, -0.2192523, -1.737563, 1, 0, 0, 1, 1,
-0.9174648, -0.8882964, -2.722433, 1, 0, 0, 1, 1,
-0.9157193, -0.8169258, -3.089185, 1, 0, 0, 1, 1,
-0.9153681, 1.454954, -0.01975092, 1, 0, 0, 1, 1,
-0.9124405, 1.239689, -1.274346, 0, 0, 0, 1, 1,
-0.9102566, -0.8637745, -1.905078, 0, 0, 0, 1, 1,
-0.9049332, -0.8550444, -1.9164, 0, 0, 0, 1, 1,
-0.9042186, 0.702122, -0.7761499, 0, 0, 0, 1, 1,
-0.904156, 0.9416245, -2.62221, 0, 0, 0, 1, 1,
-0.9035903, 1.277075, -0.7926384, 0, 0, 0, 1, 1,
-0.9032706, -1.729122, -3.527699, 0, 0, 0, 1, 1,
-0.8985974, 0.8815888, -2.11755, 1, 1, 1, 1, 1,
-0.8968559, -1.279315, -2.513486, 1, 1, 1, 1, 1,
-0.8961076, -0.4430476, -1.25308, 1, 1, 1, 1, 1,
-0.8951848, 1.691154, -1.513872, 1, 1, 1, 1, 1,
-0.8910462, 0.1971046, -1.769162, 1, 1, 1, 1, 1,
-0.8885645, 0.8302868, -0.2292518, 1, 1, 1, 1, 1,
-0.8873614, 1.214722, 0.6848006, 1, 1, 1, 1, 1,
-0.8871846, -0.6789107, -2.371081, 1, 1, 1, 1, 1,
-0.8779243, 0.04729221, -2.082169, 1, 1, 1, 1, 1,
-0.8757671, 1.16293, -0.8476452, 1, 1, 1, 1, 1,
-0.8726678, -2.806373, -2.961403, 1, 1, 1, 1, 1,
-0.8709404, 0.05936901, -0.6016833, 1, 1, 1, 1, 1,
-0.8606893, -0.1205987, -0.5779056, 1, 1, 1, 1, 1,
-0.8557788, 0.363837, -1.721042, 1, 1, 1, 1, 1,
-0.8541702, 0.3443963, -2.012747, 1, 1, 1, 1, 1,
-0.8529751, -2.017259, -4.389721, 0, 0, 1, 1, 1,
-0.8510678, 1.090824, 0.3008314, 1, 0, 0, 1, 1,
-0.8448182, 0.04451206, -2.611627, 1, 0, 0, 1, 1,
-0.8434877, -0.5259525, -1.952433, 1, 0, 0, 1, 1,
-0.8424689, -1.134416, -2.981827, 1, 0, 0, 1, 1,
-0.8397192, -0.4680848, -2.810529, 1, 0, 0, 1, 1,
-0.839005, 1.434979, -0.2498106, 0, 0, 0, 1, 1,
-0.8358715, -2.484374, -4.03808, 0, 0, 0, 1, 1,
-0.8352907, 0.5749359, -2.212405, 0, 0, 0, 1, 1,
-0.8318134, -0.628714, -0.4996884, 0, 0, 0, 1, 1,
-0.8306347, -0.0139119, -2.747418, 0, 0, 0, 1, 1,
-0.8299421, 0.9354864, 0.9125195, 0, 0, 0, 1, 1,
-0.8260052, -1.328529, -2.868557, 0, 0, 0, 1, 1,
-0.82253, -0.1305645, -1.118828, 1, 1, 1, 1, 1,
-0.8124455, -0.4819736, -2.424936, 1, 1, 1, 1, 1,
-0.8109943, 0.191064, -0.4522782, 1, 1, 1, 1, 1,
-0.8085817, 1.411229, -1.127456, 1, 1, 1, 1, 1,
-0.7981617, -1.094317, -2.887225, 1, 1, 1, 1, 1,
-0.7857522, 0.4654665, -2.417353, 1, 1, 1, 1, 1,
-0.7838337, 1.859809, -0.8785892, 1, 1, 1, 1, 1,
-0.7793766, -0.1264591, -1.029197, 1, 1, 1, 1, 1,
-0.7742417, -0.4107301, -2.103076, 1, 1, 1, 1, 1,
-0.7714468, 1.455681, -0.1606662, 1, 1, 1, 1, 1,
-0.7708144, 0.856213, 0.5001628, 1, 1, 1, 1, 1,
-0.7705833, -1.159061, -4.610147, 1, 1, 1, 1, 1,
-0.7680331, -0.1050531, -2.890615, 1, 1, 1, 1, 1,
-0.7662703, -1.472906, -2.716964, 1, 1, 1, 1, 1,
-0.7615758, 0.920552, -0.5825207, 1, 1, 1, 1, 1,
-0.7604818, 1.398262, 0.648909, 0, 0, 1, 1, 1,
-0.7600142, 0.270039, -0.9265265, 1, 0, 0, 1, 1,
-0.7593996, -0.01586424, 0.330493, 1, 0, 0, 1, 1,
-0.7586169, -1.829978, -3.798646, 1, 0, 0, 1, 1,
-0.7513759, 0.4892617, -1.532999, 1, 0, 0, 1, 1,
-0.7490191, -0.1902479, 1.272234, 1, 0, 0, 1, 1,
-0.7444971, -0.1324301, -2.299515, 0, 0, 0, 1, 1,
-0.7407851, -1.630027, -3.247173, 0, 0, 0, 1, 1,
-0.7339458, 0.6184958, -0.1758498, 0, 0, 0, 1, 1,
-0.7264786, 1.471726, -0.5480903, 0, 0, 0, 1, 1,
-0.7259504, -0.2357709, -2.285318, 0, 0, 0, 1, 1,
-0.7150257, 2.3208, -0.5292646, 0, 0, 0, 1, 1,
-0.7144328, 1.29152, -1.089794, 0, 0, 0, 1, 1,
-0.710672, -0.8178759, -2.125657, 1, 1, 1, 1, 1,
-0.7037745, -0.4776664, -1.939516, 1, 1, 1, 1, 1,
-0.7034723, -0.4588218, -1.29215, 1, 1, 1, 1, 1,
-0.6980281, 1.011809, -0.6342493, 1, 1, 1, 1, 1,
-0.6970975, 1.546166, -0.4440876, 1, 1, 1, 1, 1,
-0.6933835, -0.3434322, -2.612307, 1, 1, 1, 1, 1,
-0.6930372, -1.169398, -3.215587, 1, 1, 1, 1, 1,
-0.6924276, -0.5269585, -1.730913, 1, 1, 1, 1, 1,
-0.6843904, -0.5884972, -0.9295284, 1, 1, 1, 1, 1,
-0.6838768, 0.936893, -0.9099047, 1, 1, 1, 1, 1,
-0.6810657, 0.1370352, -2.481209, 1, 1, 1, 1, 1,
-0.6801277, -0.04770833, -2.580546, 1, 1, 1, 1, 1,
-0.6756478, -1.179676, -4.107514, 1, 1, 1, 1, 1,
-0.6752182, -1.935909, -2.749482, 1, 1, 1, 1, 1,
-0.6734847, -0.5134792, -3.475443, 1, 1, 1, 1, 1,
-0.673032, 0.4127256, -0.4365489, 0, 0, 1, 1, 1,
-0.6723073, 1.168454, -0.671254, 1, 0, 0, 1, 1,
-0.6692352, 0.6538035, -0.9211026, 1, 0, 0, 1, 1,
-0.6658498, -0.8874872, -2.542562, 1, 0, 0, 1, 1,
-0.664528, 1.55382, 0.1544379, 1, 0, 0, 1, 1,
-0.6644216, -0.008404556, -1.8654, 1, 0, 0, 1, 1,
-0.6622624, 1.406336, -1.255641, 0, 0, 0, 1, 1,
-0.6616304, -1.150405, -3.266776, 0, 0, 0, 1, 1,
-0.6541061, 0.3548428, 0.1658612, 0, 0, 0, 1, 1,
-0.6485375, -0.55975, -1.468255, 0, 0, 0, 1, 1,
-0.6465427, 0.4921693, -1.128022, 0, 0, 0, 1, 1,
-0.6459702, -0.351693, -2.155279, 0, 0, 0, 1, 1,
-0.6436477, -0.5004785, -1.843963, 0, 0, 0, 1, 1,
-0.6414411, -0.7257814, -3.317362, 1, 1, 1, 1, 1,
-0.6409699, 1.968019, 0.384524, 1, 1, 1, 1, 1,
-0.6356609, -1.446943, -3.626768, 1, 1, 1, 1, 1,
-0.6323253, -0.3236309, -3.190704, 1, 1, 1, 1, 1,
-0.6289957, 1.48137, -0.3517984, 1, 1, 1, 1, 1,
-0.6274042, 1.176987, 0.0696908, 1, 1, 1, 1, 1,
-0.6266554, 1.525948, -1.365769, 1, 1, 1, 1, 1,
-0.6236801, 0.4058534, -1.561574, 1, 1, 1, 1, 1,
-0.6161133, 0.112015, -3.346761, 1, 1, 1, 1, 1,
-0.615455, -0.3405712, -1.723652, 1, 1, 1, 1, 1,
-0.6139761, -1.621525, -3.921309, 1, 1, 1, 1, 1,
-0.6093585, 0.6178005, -1.49665, 1, 1, 1, 1, 1,
-0.6064197, 0.09868453, -3.010067, 1, 1, 1, 1, 1,
-0.6056086, 0.5377097, -2.081043, 1, 1, 1, 1, 1,
-0.6028528, -0.5041537, 0.08204359, 1, 1, 1, 1, 1,
-0.60269, -0.508002, -2.558593, 0, 0, 1, 1, 1,
-0.5951805, -1.258271, -3.269787, 1, 0, 0, 1, 1,
-0.592071, 0.7005895, 0.04811041, 1, 0, 0, 1, 1,
-0.5902072, -0.03679986, -2.185267, 1, 0, 0, 1, 1,
-0.5875275, 0.3837216, -2.02242, 1, 0, 0, 1, 1,
-0.583828, -0.2332135, -1.976086, 1, 0, 0, 1, 1,
-0.5816569, 0.2389726, -0.03162602, 0, 0, 0, 1, 1,
-0.5752462, 0.675947, -0.9715332, 0, 0, 0, 1, 1,
-0.5647824, 0.7432785, 1.552572, 0, 0, 0, 1, 1,
-0.5555744, 1.524997, 0.2548121, 0, 0, 0, 1, 1,
-0.5555537, 0.2162703, -1.499673, 0, 0, 0, 1, 1,
-0.5521642, 1.514471, -1.122514, 0, 0, 0, 1, 1,
-0.5479648, -0.6152012, -3.006656, 0, 0, 0, 1, 1,
-0.5444345, 0.6207026, -0.4159643, 1, 1, 1, 1, 1,
-0.5408979, 0.4342277, -0.02814315, 1, 1, 1, 1, 1,
-0.5401061, 0.2354116, -0.2522849, 1, 1, 1, 1, 1,
-0.5373245, 1.054219, -0.02832043, 1, 1, 1, 1, 1,
-0.536303, 0.4352069, -1.621354, 1, 1, 1, 1, 1,
-0.5342544, -0.9452605, -1.733853, 1, 1, 1, 1, 1,
-0.5327764, -1.380124, -3.081319, 1, 1, 1, 1, 1,
-0.5323344, 0.03617083, -2.200962, 1, 1, 1, 1, 1,
-0.5299585, -0.6575945, -1.988086, 1, 1, 1, 1, 1,
-0.5297397, -1.217117, -2.586578, 1, 1, 1, 1, 1,
-0.5289146, -0.1427513, -2.773446, 1, 1, 1, 1, 1,
-0.5273061, 0.6526794, -2.020064, 1, 1, 1, 1, 1,
-0.5267878, -0.1924161, -2.280469, 1, 1, 1, 1, 1,
-0.5263993, -0.4080216, -1.92378, 1, 1, 1, 1, 1,
-0.5260524, -0.4459832, -3.336929, 1, 1, 1, 1, 1,
-0.5237578, -0.3223106, -1.888603, 0, 0, 1, 1, 1,
-0.5215907, -0.05879328, -1.453396, 1, 0, 0, 1, 1,
-0.5210499, -0.2445073, -1.436267, 1, 0, 0, 1, 1,
-0.5200257, -0.02495208, 0.7098381, 1, 0, 0, 1, 1,
-0.5194957, -1.36628, -2.698588, 1, 0, 0, 1, 1,
-0.5083856, 0.4119676, -2.229839, 1, 0, 0, 1, 1,
-0.5022368, -0.6077688, -1.999202, 0, 0, 0, 1, 1,
-0.5008757, -0.6628639, -2.650725, 0, 0, 0, 1, 1,
-0.4986503, 1.053484, 0.4474085, 0, 0, 0, 1, 1,
-0.4973197, -0.9007187, -5.018203, 0, 0, 0, 1, 1,
-0.4967444, -1.190972, -3.716316, 0, 0, 0, 1, 1,
-0.4953535, 0.08507127, -2.410939, 0, 0, 0, 1, 1,
-0.492747, 0.003118993, -2.348746, 0, 0, 0, 1, 1,
-0.486099, 1.419818, -0.7685353, 1, 1, 1, 1, 1,
-0.4850754, 1.562076, -1.073807, 1, 1, 1, 1, 1,
-0.4848786, -0.1912558, -0.4325337, 1, 1, 1, 1, 1,
-0.4835507, -0.284729, -2.120152, 1, 1, 1, 1, 1,
-0.4730355, -1.16334, -2.786132, 1, 1, 1, 1, 1,
-0.4718739, 1.072693, -0.6112281, 1, 1, 1, 1, 1,
-0.4692895, 0.5316144, 0.4983261, 1, 1, 1, 1, 1,
-0.4675108, 1.119395, -1.00144, 1, 1, 1, 1, 1,
-0.4618595, -1.672166, -2.444119, 1, 1, 1, 1, 1,
-0.4562391, -1.570912, -3.181219, 1, 1, 1, 1, 1,
-0.4556794, -0.7290447, -3.187074, 1, 1, 1, 1, 1,
-0.4547135, -2.491066, -2.879844, 1, 1, 1, 1, 1,
-0.4545257, 0.1468559, 0.2138742, 1, 1, 1, 1, 1,
-0.4530112, -0.5189926, -3.232357, 1, 1, 1, 1, 1,
-0.449453, -1.534826, -3.38642, 1, 1, 1, 1, 1,
-0.4475417, 0.5195893, -0.1340185, 0, 0, 1, 1, 1,
-0.4457744, 1.609974, 0.169919, 1, 0, 0, 1, 1,
-0.4450982, -0.7720304, -3.722597, 1, 0, 0, 1, 1,
-0.443686, 0.9323016, 0.1726025, 1, 0, 0, 1, 1,
-0.4352972, 1.009216, -0.08713824, 1, 0, 0, 1, 1,
-0.4297661, 0.1431545, -0.2910605, 1, 0, 0, 1, 1,
-0.4296215, -1.154015, -2.067619, 0, 0, 0, 1, 1,
-0.4251491, -0.1637376, 0.04716037, 0, 0, 0, 1, 1,
-0.4212424, 1.013803, 0.1693442, 0, 0, 0, 1, 1,
-0.416157, -1.170784, -3.752841, 0, 0, 0, 1, 1,
-0.4157669, -0.09189218, -0.8246121, 0, 0, 0, 1, 1,
-0.4136216, 0.2029701, -1.380876, 0, 0, 0, 1, 1,
-0.4128979, -1.466965, -2.526, 0, 0, 0, 1, 1,
-0.4113315, 0.9632165, 1.806019, 1, 1, 1, 1, 1,
-0.4056599, 0.2643392, -1.550426, 1, 1, 1, 1, 1,
-0.3969755, -0.2748004, -3.258406, 1, 1, 1, 1, 1,
-0.396306, 0.6410862, -0.8435706, 1, 1, 1, 1, 1,
-0.3955924, 0.4213648, -0.7826582, 1, 1, 1, 1, 1,
-0.3950099, 0.3658619, -1.143734, 1, 1, 1, 1, 1,
-0.3924551, 1.013365, -0.6905974, 1, 1, 1, 1, 1,
-0.3920311, 1.048532, -0.5432906, 1, 1, 1, 1, 1,
-0.3916379, 0.8795909, -1.428262, 1, 1, 1, 1, 1,
-0.3899423, -0.1020121, -1.006867, 1, 1, 1, 1, 1,
-0.3852315, 0.02546086, -1.766593, 1, 1, 1, 1, 1,
-0.3829252, -1.799977, -2.967529, 1, 1, 1, 1, 1,
-0.3828636, -0.5190369, -2.991283, 1, 1, 1, 1, 1,
-0.3806865, 0.1326332, -1.090868, 1, 1, 1, 1, 1,
-0.3751508, 0.2428109, -2.40734, 1, 1, 1, 1, 1,
-0.3746014, 0.5143322, 0.07595526, 0, 0, 1, 1, 1,
-0.3641418, 1.574211, -0.3334259, 1, 0, 0, 1, 1,
-0.3602619, -1.344532, -2.41684, 1, 0, 0, 1, 1,
-0.3561975, -0.7300919, -2.506525, 1, 0, 0, 1, 1,
-0.3502906, 0.9217521, -0.6001866, 1, 0, 0, 1, 1,
-0.3499993, -0.682165, -3.886883, 1, 0, 0, 1, 1,
-0.3488266, 0.3489237, -0.3838964, 0, 0, 0, 1, 1,
-0.346584, -0.2414866, -2.661712, 0, 0, 0, 1, 1,
-0.3462502, 1.142769, 0.1644316, 0, 0, 0, 1, 1,
-0.3401958, -1.005745, -3.437452, 0, 0, 0, 1, 1,
-0.3359249, -0.5677543, -2.781371, 0, 0, 0, 1, 1,
-0.335686, 0.8967001, 0.9253243, 0, 0, 0, 1, 1,
-0.3350834, 2.131729, 0.7346826, 0, 0, 0, 1, 1,
-0.3347698, -1.0235, -4.171041, 1, 1, 1, 1, 1,
-0.331789, -1.023335, -2.467172, 1, 1, 1, 1, 1,
-0.3305428, -0.7163013, -3.177868, 1, 1, 1, 1, 1,
-0.3256174, 0.9518013, -1.390388, 1, 1, 1, 1, 1,
-0.322941, -0.6279046, -1.191115, 1, 1, 1, 1, 1,
-0.3205348, -1.058666, -3.400441, 1, 1, 1, 1, 1,
-0.3189307, 1.219847, 1.145475, 1, 1, 1, 1, 1,
-0.3174173, -2.64888, -4.150051, 1, 1, 1, 1, 1,
-0.3155158, 0.9238826, -0.03748044, 1, 1, 1, 1, 1,
-0.3142855, 1.048961, -0.2292273, 1, 1, 1, 1, 1,
-0.3131939, 0.878595, -1.609118, 1, 1, 1, 1, 1,
-0.3049963, 0.2402795, -1.245095, 1, 1, 1, 1, 1,
-0.3032816, -0.383784, -2.951587, 1, 1, 1, 1, 1,
-0.3028243, -1.093436, -1.354114, 1, 1, 1, 1, 1,
-0.2985426, 0.1059523, -0.7821898, 1, 1, 1, 1, 1,
-0.2974758, -0.5557693, -1.519333, 0, 0, 1, 1, 1,
-0.2964157, -1.754899, -2.333623, 1, 0, 0, 1, 1,
-0.2944061, -0.6450076, -2.632282, 1, 0, 0, 1, 1,
-0.2925735, -1.414141, -2.406002, 1, 0, 0, 1, 1,
-0.2813486, 0.09018434, -1.411077, 1, 0, 0, 1, 1,
-0.2798803, 1.070962, -1.101344, 1, 0, 0, 1, 1,
-0.2777115, -0.3037465, -2.373016, 0, 0, 0, 1, 1,
-0.2770698, -2.006707, -4.67651, 0, 0, 0, 1, 1,
-0.2714416, -0.3975009, -2.287936, 0, 0, 0, 1, 1,
-0.2696432, -1.386657, -1.756698, 0, 0, 0, 1, 1,
-0.2683659, -0.5647807, -3.351697, 0, 0, 0, 1, 1,
-0.2646741, -1.397549, -1.608217, 0, 0, 0, 1, 1,
-0.2579382, -0.05308351, -2.959494, 0, 0, 0, 1, 1,
-0.249822, -0.003039779, -0.8063881, 1, 1, 1, 1, 1,
-0.2497415, 0.4946137, -0.3241708, 1, 1, 1, 1, 1,
-0.2419749, 1.15277, 1.250796, 1, 1, 1, 1, 1,
-0.2411223, -1.453416, -2.873061, 1, 1, 1, 1, 1,
-0.2403116, 0.6973938, 0.1980059, 1, 1, 1, 1, 1,
-0.239624, -0.7667291, -2.229527, 1, 1, 1, 1, 1,
-0.2355022, -1.095895, -3.41878, 1, 1, 1, 1, 1,
-0.2232169, -0.8431517, -3.212857, 1, 1, 1, 1, 1,
-0.2215717, -0.8417858, -2.536406, 1, 1, 1, 1, 1,
-0.2167358, -1.377839, -1.658706, 1, 1, 1, 1, 1,
-0.2143137, 0.7366939, 0.4894727, 1, 1, 1, 1, 1,
-0.2120739, -1.05855, -3.223972, 1, 1, 1, 1, 1,
-0.2102611, -0.05007544, -1.581838, 1, 1, 1, 1, 1,
-0.1995725, -1.684837, -3.257496, 1, 1, 1, 1, 1,
-0.1932967, 0.2579276, -0.04072146, 1, 1, 1, 1, 1,
-0.1919706, 0.3263446, 0.6296297, 0, 0, 1, 1, 1,
-0.1913791, 0.3248167, 1.42177, 1, 0, 0, 1, 1,
-0.1913736, 0.3139758, -2.269048, 1, 0, 0, 1, 1,
-0.1862502, -0.05523243, -2.443823, 1, 0, 0, 1, 1,
-0.1842617, 1.651383, 0.2050782, 1, 0, 0, 1, 1,
-0.1836498, 0.4175829, 0.299603, 1, 0, 0, 1, 1,
-0.1818875, 0.3901556, -0.6727546, 0, 0, 0, 1, 1,
-0.1795847, -0.1226272, -2.056105, 0, 0, 0, 1, 1,
-0.1790836, -1.673668, -6.285759, 0, 0, 0, 1, 1,
-0.1790255, 0.4790444, 0.02588634, 0, 0, 0, 1, 1,
-0.1773939, -0.09150932, -1.918057, 0, 0, 0, 1, 1,
-0.1747573, -1.611659, -1.407889, 0, 0, 0, 1, 1,
-0.174011, 1.565275, -0.249151, 0, 0, 0, 1, 1,
-0.1678273, 0.007707455, 0.03023933, 1, 1, 1, 1, 1,
-0.1666532, -0.3780333, -1.247334, 1, 1, 1, 1, 1,
-0.1661617, 1.016306, 1.770183, 1, 1, 1, 1, 1,
-0.1651317, -0.8437638, -3.727869, 1, 1, 1, 1, 1,
-0.1537644, 0.7168822, -1.209358, 1, 1, 1, 1, 1,
-0.1526519, 0.1363902, 0.3722209, 1, 1, 1, 1, 1,
-0.1497792, -0.6891657, -3.910187, 1, 1, 1, 1, 1,
-0.147735, 0.5999427, 0.5387258, 1, 1, 1, 1, 1,
-0.1460694, 0.02283062, -1.371662, 1, 1, 1, 1, 1,
-0.1438507, -0.1053851, -1.364421, 1, 1, 1, 1, 1,
-0.1430704, 0.007503534, -1.795035, 1, 1, 1, 1, 1,
-0.1415245, -0.3374578, -2.7239, 1, 1, 1, 1, 1,
-0.1403382, 0.6965054, 1.462909, 1, 1, 1, 1, 1,
-0.1393428, -0.6164727, -3.187412, 1, 1, 1, 1, 1,
-0.1392157, 0.4031456, -0.06556881, 1, 1, 1, 1, 1,
-0.1373648, -1.407343, -3.225929, 0, 0, 1, 1, 1,
-0.1363783, -1.025602, -2.559689, 1, 0, 0, 1, 1,
-0.1348589, 0.5873836, -2.635269, 1, 0, 0, 1, 1,
-0.1297493, 1.420904, 0.8263559, 1, 0, 0, 1, 1,
-0.1297173, 0.9230878, -0.4703414, 1, 0, 0, 1, 1,
-0.1267316, 0.1344556, -2.364017, 1, 0, 0, 1, 1,
-0.1253061, -0.1200344, -1.237958, 0, 0, 0, 1, 1,
-0.1234926, -1.530867, -4.885591, 0, 0, 0, 1, 1,
-0.1232928, 0.9581153, -0.595377, 0, 0, 0, 1, 1,
-0.1224682, -0.8743712, -2.387361, 0, 0, 0, 1, 1,
-0.120554, 0.5194167, 0.522743, 0, 0, 0, 1, 1,
-0.1202877, 1.127902, 0.5334399, 0, 0, 0, 1, 1,
-0.115163, 0.6165355, 0.4368309, 0, 0, 0, 1, 1,
-0.1124317, 1.864035, -0.3630023, 1, 1, 1, 1, 1,
-0.1121957, -0.01696865, -1.189851, 1, 1, 1, 1, 1,
-0.1090729, -0.1348665, -2.218013, 1, 1, 1, 1, 1,
-0.1083508, -0.9481468, -2.51389, 1, 1, 1, 1, 1,
-0.1060212, -1.116849, -3.794372, 1, 1, 1, 1, 1,
-0.1055817, -2.146715, -2.482145, 1, 1, 1, 1, 1,
-0.104502, -0.3224526, -3.108523, 1, 1, 1, 1, 1,
-0.1034333, 0.1303409, -1.162636, 1, 1, 1, 1, 1,
-0.09842607, 0.3050969, -0.3828301, 1, 1, 1, 1, 1,
-0.09766739, 1.291754, -1.226728, 1, 1, 1, 1, 1,
-0.0955148, 0.4251217, 0.2314978, 1, 1, 1, 1, 1,
-0.09406529, 0.2576651, 0.07078428, 1, 1, 1, 1, 1,
-0.09194089, -1.283009, -4.253119, 1, 1, 1, 1, 1,
-0.08818737, 1.185737, 0.4970939, 1, 1, 1, 1, 1,
-0.08731832, 0.07440027, -0.4280505, 1, 1, 1, 1, 1,
-0.08332808, 0.5691156, -0.9190279, 0, 0, 1, 1, 1,
-0.06424404, 0.3031615, 0.4428595, 1, 0, 0, 1, 1,
-0.06011038, -0.454437, -3.461352, 1, 0, 0, 1, 1,
-0.05605441, -1.187787, -3.79809, 1, 0, 0, 1, 1,
-0.05580152, 0.6435615, -1.513427, 1, 0, 0, 1, 1,
-0.05171507, -0.8583502, -3.026329, 1, 0, 0, 1, 1,
-0.04395755, 2.706761, -0.4071594, 0, 0, 0, 1, 1,
-0.03723302, -0.9589711, -3.223513, 0, 0, 0, 1, 1,
-0.0365169, -1.759594, -2.195394, 0, 0, 0, 1, 1,
-0.03269895, 0.1505349, -0.4386111, 0, 0, 0, 1, 1,
-0.03197884, 1.235278, 0.9793094, 0, 0, 0, 1, 1,
-0.02291615, -0.01109347, -0.5101059, 0, 0, 0, 1, 1,
-0.02239273, -0.8533957, -4.049928, 0, 0, 0, 1, 1,
-0.01499011, -0.3454051, -4.55398, 1, 1, 1, 1, 1,
-0.00566373, -0.2256022, -3.599027, 1, 1, 1, 1, 1,
-0.002639262, -1.744897, -1.483765, 1, 1, 1, 1, 1,
0.0005406684, -0.9566512, 4.900823, 1, 1, 1, 1, 1,
0.00158382, -1.381119, 1.157245, 1, 1, 1, 1, 1,
0.002759787, -1.997135, 3.798666, 1, 1, 1, 1, 1,
0.009159505, 0.1590048, -0.9918081, 1, 1, 1, 1, 1,
0.01141908, 0.4783939, 1.141287, 1, 1, 1, 1, 1,
0.01345093, 0.1857878, 1.244957, 1, 1, 1, 1, 1,
0.01389142, 0.3101826, -1.24485, 1, 1, 1, 1, 1,
0.01943187, 1.37801, 0.8087726, 1, 1, 1, 1, 1,
0.02192668, -0.7118187, 4.395686, 1, 1, 1, 1, 1,
0.0244734, 1.192751, -0.2778081, 1, 1, 1, 1, 1,
0.02484042, -1.105818, 4.628851, 1, 1, 1, 1, 1,
0.02740262, 0.4841481, 1.400124, 1, 1, 1, 1, 1,
0.03179953, -1.18388, 3.314914, 0, 0, 1, 1, 1,
0.03560639, 0.5974742, 1.106401, 1, 0, 0, 1, 1,
0.03950724, -2.853416, 2.047459, 1, 0, 0, 1, 1,
0.03972422, -0.6428968, 2.296509, 1, 0, 0, 1, 1,
0.04034847, 1.325741, 0.2365359, 1, 0, 0, 1, 1,
0.04370329, 1.315421, -1.208522, 1, 0, 0, 1, 1,
0.04443127, 1.320684, -2.094213, 0, 0, 0, 1, 1,
0.05133666, -0.06258602, 2.265535, 0, 0, 0, 1, 1,
0.05165583, 2.313744, -0.507067, 0, 0, 0, 1, 1,
0.05517679, -0.8022102, 3.189435, 0, 0, 0, 1, 1,
0.05642401, -1.696424, 4.018184, 0, 0, 0, 1, 1,
0.0605527, -0.09545007, 3.799276, 0, 0, 0, 1, 1,
0.06401635, 0.1384811, 1.217305, 0, 0, 0, 1, 1,
0.06776665, -1.500729, 1.882058, 1, 1, 1, 1, 1,
0.06786755, 3.606179, 0.4136328, 1, 1, 1, 1, 1,
0.07519542, 0.7181441, -0.421432, 1, 1, 1, 1, 1,
0.08440427, -1.500031, 3.666091, 1, 1, 1, 1, 1,
0.09243038, -0.9138679, 2.685723, 1, 1, 1, 1, 1,
0.09312868, 0.68104, -1.028205, 1, 1, 1, 1, 1,
0.09373347, -0.07961875, 0.9013212, 1, 1, 1, 1, 1,
0.09826396, -0.7503724, 2.45628, 1, 1, 1, 1, 1,
0.1011753, -0.9666281, 3.574672, 1, 1, 1, 1, 1,
0.1033768, 0.6505061, 1.036118, 1, 1, 1, 1, 1,
0.103557, 0.2467746, -0.1676795, 1, 1, 1, 1, 1,
0.1037599, 0.1087258, 0.8117102, 1, 1, 1, 1, 1,
0.1056836, 0.4278928, 0.8615426, 1, 1, 1, 1, 1,
0.1098191, 0.3574481, 0.7706097, 1, 1, 1, 1, 1,
0.1142222, 0.09805392, 0.8675598, 1, 1, 1, 1, 1,
0.1144505, 0.8950741, -1.767598, 0, 0, 1, 1, 1,
0.1163871, -1.143748, 4.012928, 1, 0, 0, 1, 1,
0.1182823, 0.5920678, 2.329893, 1, 0, 0, 1, 1,
0.1197061, -1.305209, 4.547948, 1, 0, 0, 1, 1,
0.1197519, -0.2882569, 1.042794, 1, 0, 0, 1, 1,
0.1227361, -0.7336484, 1.234908, 1, 0, 0, 1, 1,
0.1249215, 0.6543887, 1.457199, 0, 0, 0, 1, 1,
0.1256735, -1.305703, 4.695433, 0, 0, 0, 1, 1,
0.1265242, 0.05726346, 3.03415, 0, 0, 0, 1, 1,
0.1265728, 0.3239062, 0.2446232, 0, 0, 0, 1, 1,
0.1296449, 0.2372783, -0.05665681, 0, 0, 0, 1, 1,
0.1309349, -0.09762674, 0.2616096, 0, 0, 0, 1, 1,
0.1337496, 0.1118605, 1.314656, 0, 0, 0, 1, 1,
0.1363292, 0.8313419, 0.1025888, 1, 1, 1, 1, 1,
0.1378152, -1.545587, 4.066158, 1, 1, 1, 1, 1,
0.1435285, 2.331818, -1.117848, 1, 1, 1, 1, 1,
0.146639, 0.5215069, -0.9443132, 1, 1, 1, 1, 1,
0.1477295, -1.481179, 1.701656, 1, 1, 1, 1, 1,
0.1482303, -0.03019845, 2.109193, 1, 1, 1, 1, 1,
0.1485819, 1.603877, 1.218673, 1, 1, 1, 1, 1,
0.1493948, -1.799895, 3.757788, 1, 1, 1, 1, 1,
0.1535118, 0.114021, 1.900878, 1, 1, 1, 1, 1,
0.1545691, 0.3957964, 0.4032751, 1, 1, 1, 1, 1,
0.165199, 0.06178192, 2.267815, 1, 1, 1, 1, 1,
0.1684064, -0.03636204, 0.3993411, 1, 1, 1, 1, 1,
0.1816379, 0.2724666, 2.364388, 1, 1, 1, 1, 1,
0.1868054, 0.3688251, 0.1425768, 1, 1, 1, 1, 1,
0.1896261, 0.8215925, -0.01714438, 1, 1, 1, 1, 1,
0.1901331, -0.05715591, 1.876817, 0, 0, 1, 1, 1,
0.192287, 0.961596, 0.2067882, 1, 0, 0, 1, 1,
0.1978677, 0.6213363, 1.092728, 1, 0, 0, 1, 1,
0.199127, 1.097003, 2.981941, 1, 0, 0, 1, 1,
0.2033808, 0.5474936, 1.389139, 1, 0, 0, 1, 1,
0.2103922, -1.231518, 2.553741, 1, 0, 0, 1, 1,
0.2155604, -0.3992502, 1.249313, 0, 0, 0, 1, 1,
0.2203298, -0.1755914, 0.3880329, 0, 0, 0, 1, 1,
0.2206188, 0.0001374632, 2.106025, 0, 0, 0, 1, 1,
0.2214947, 0.05015965, 2.538163, 0, 0, 0, 1, 1,
0.2344121, -0.8450585, 2.786247, 0, 0, 0, 1, 1,
0.2450892, 0.6495009, 1.524686, 0, 0, 0, 1, 1,
0.2467898, 1.68045, 0.2373682, 0, 0, 0, 1, 1,
0.2470077, -0.4441883, 3.097859, 1, 1, 1, 1, 1,
0.2471047, 0.8479885, -0.6684459, 1, 1, 1, 1, 1,
0.249286, -0.440394, 2.688923, 1, 1, 1, 1, 1,
0.249573, -0.3764331, 3.4844, 1, 1, 1, 1, 1,
0.2510622, -0.8355575, 3.38485, 1, 1, 1, 1, 1,
0.2514533, -0.9215159, 4.769308, 1, 1, 1, 1, 1,
0.2535804, 1.853047, 0.3109889, 1, 1, 1, 1, 1,
0.2544234, -1.778196, 2.371612, 1, 1, 1, 1, 1,
0.2570832, -1.235782, 1.220454, 1, 1, 1, 1, 1,
0.2606863, -2.309956, 4.096304, 1, 1, 1, 1, 1,
0.2633453, 1.370519, 1.184954, 1, 1, 1, 1, 1,
0.2660339, -1.57402, 2.202864, 1, 1, 1, 1, 1,
0.2679632, 1.007001, 0.07809482, 1, 1, 1, 1, 1,
0.2702439, 0.9906383, -0.7675223, 1, 1, 1, 1, 1,
0.2710143, 1.156918, -0.04085808, 1, 1, 1, 1, 1,
0.2713577, 0.6137446, 2.18011, 0, 0, 1, 1, 1,
0.2738096, 0.321283, -0.4919702, 1, 0, 0, 1, 1,
0.2760608, -1.114159, 2.203762, 1, 0, 0, 1, 1,
0.2789674, 0.7619081, 1.253833, 1, 0, 0, 1, 1,
0.2803909, -0.2113625, 1.178315, 1, 0, 0, 1, 1,
0.2807451, 0.2262229, -0.08909944, 1, 0, 0, 1, 1,
0.2833076, -1.179156, 3.13117, 0, 0, 0, 1, 1,
0.2850228, -0.7404738, 1.649366, 0, 0, 0, 1, 1,
0.2865072, -1.307861, 1.966038, 0, 0, 0, 1, 1,
0.2921121, -0.1356124, 1.136371, 0, 0, 0, 1, 1,
0.2927849, -0.3654249, 1.371078, 0, 0, 0, 1, 1,
0.2955679, 0.05170203, 0.4467292, 0, 0, 0, 1, 1,
0.2971885, -1.639936, 3.106974, 0, 0, 0, 1, 1,
0.2974272, 0.6256285, 1.158345, 1, 1, 1, 1, 1,
0.299933, -0.8351811, 2.995606, 1, 1, 1, 1, 1,
0.3023643, -1.380387, 2.914518, 1, 1, 1, 1, 1,
0.3032068, -1.910835, 3.295066, 1, 1, 1, 1, 1,
0.3108174, -0.1112053, 1.998204, 1, 1, 1, 1, 1,
0.313882, 1.09402, 0.4456847, 1, 1, 1, 1, 1,
0.3139944, 1.02993, 0.539958, 1, 1, 1, 1, 1,
0.3149672, -0.09237493, 4.98426, 1, 1, 1, 1, 1,
0.3158435, -1.687301, 2.906762, 1, 1, 1, 1, 1,
0.3266561, -0.6093388, 3.142858, 1, 1, 1, 1, 1,
0.3328102, 1.107573, -0.9472305, 1, 1, 1, 1, 1,
0.333151, 0.7384533, 0.2649591, 1, 1, 1, 1, 1,
0.3369133, 1.304433, 0.2839564, 1, 1, 1, 1, 1,
0.3371203, -1.419136, 2.369662, 1, 1, 1, 1, 1,
0.3372082, -0.7640746, 4.02451, 1, 1, 1, 1, 1,
0.3389922, 0.9573114, 1.288666, 0, 0, 1, 1, 1,
0.3409012, -0.1170456, 1.768171, 1, 0, 0, 1, 1,
0.3422054, -0.6957534, 3.835023, 1, 0, 0, 1, 1,
0.3584825, 1.033837, -0.2179992, 1, 0, 0, 1, 1,
0.3687868, 0.3273506, 0.683892, 1, 0, 0, 1, 1,
0.3734267, -0.3933091, 2.719166, 1, 0, 0, 1, 1,
0.3776406, -0.4467483, 3.942509, 0, 0, 0, 1, 1,
0.3776562, -0.9762352, 3.049675, 0, 0, 0, 1, 1,
0.3803293, 0.5393018, 1.419977, 0, 0, 0, 1, 1,
0.3833024, 2.016031, 0.7320005, 0, 0, 0, 1, 1,
0.3867604, 0.690706, 0.5222361, 0, 0, 0, 1, 1,
0.3945145, -1.617828, 1.784671, 0, 0, 0, 1, 1,
0.3946893, 1.462547, 1.110571, 0, 0, 0, 1, 1,
0.3999635, 0.7477241, 0.2363931, 1, 1, 1, 1, 1,
0.4017539, -0.1210425, 1.83972, 1, 1, 1, 1, 1,
0.4036113, 0.587253, -1.09906, 1, 1, 1, 1, 1,
0.4111944, 0.881659, -1.416018, 1, 1, 1, 1, 1,
0.4118932, -0.8474153, 2.459954, 1, 1, 1, 1, 1,
0.4150426, 0.2917103, 0.9247023, 1, 1, 1, 1, 1,
0.4158102, -0.04864785, 1.969111, 1, 1, 1, 1, 1,
0.4176885, 1.031592, -0.2827293, 1, 1, 1, 1, 1,
0.4180715, 0.4729879, -0.1608282, 1, 1, 1, 1, 1,
0.4202655, 0.5110093, 2.026148, 1, 1, 1, 1, 1,
0.4214447, -0.566786, 2.228872, 1, 1, 1, 1, 1,
0.4215094, -0.5356479, 1.860471, 1, 1, 1, 1, 1,
0.4251077, 0.7347612, -1.268333, 1, 1, 1, 1, 1,
0.4299639, 0.520797, 0.5645151, 1, 1, 1, 1, 1,
0.4333096, 0.9033349, 2.061143, 1, 1, 1, 1, 1,
0.4356712, 0.6556271, 1.328781, 0, 0, 1, 1, 1,
0.4386024, -0.1399336, 3.214189, 1, 0, 0, 1, 1,
0.4420293, -0.08942786, 3.062683, 1, 0, 0, 1, 1,
0.4491628, -1.861997, 2.735544, 1, 0, 0, 1, 1,
0.451252, -0.1006596, 3.731381, 1, 0, 0, 1, 1,
0.4525993, 1.795482, -0.1937553, 1, 0, 0, 1, 1,
0.4540031, -0.3773847, 1.266578, 0, 0, 0, 1, 1,
0.454563, 0.6207545, 0.4412545, 0, 0, 0, 1, 1,
0.4571453, -0.9953517, 3.98155, 0, 0, 0, 1, 1,
0.4577368, 0.6673303, -0.4603418, 0, 0, 0, 1, 1,
0.4613151, -1.058764, 1.682159, 0, 0, 0, 1, 1,
0.4622868, -0.3110509, 1.786337, 0, 0, 0, 1, 1,
0.4633183, 0.901251, -0.5273653, 0, 0, 0, 1, 1,
0.4646996, -0.2733439, 3.260988, 1, 1, 1, 1, 1,
0.4753335, 0.6003139, 0.1731254, 1, 1, 1, 1, 1,
0.4753563, -1.554681, 0.8550396, 1, 1, 1, 1, 1,
0.4763215, -0.941504, 1.51635, 1, 1, 1, 1, 1,
0.4781226, -2.017718, 1.606519, 1, 1, 1, 1, 1,
0.4819485, 1.235385, 0.7853011, 1, 1, 1, 1, 1,
0.4820402, -0.5804549, 0.8329575, 1, 1, 1, 1, 1,
0.4887421, 0.05290434, 1.183645, 1, 1, 1, 1, 1,
0.4892715, -2.089818, 0.920819, 1, 1, 1, 1, 1,
0.4904447, 0.7248241, 0.1253288, 1, 1, 1, 1, 1,
0.4907022, 0.1480607, 0.9796711, 1, 1, 1, 1, 1,
0.4916832, 0.08014501, 2.554683, 1, 1, 1, 1, 1,
0.4928404, 0.420889, 1.301464, 1, 1, 1, 1, 1,
0.4954332, -2.1064, 2.982876, 1, 1, 1, 1, 1,
0.5001925, 1.298459, -0.3946151, 1, 1, 1, 1, 1,
0.5002347, 0.1105723, 0.7525417, 0, 0, 1, 1, 1,
0.5017399, -1.955664, 3.315253, 1, 0, 0, 1, 1,
0.5076948, 0.02746465, 0.4264357, 1, 0, 0, 1, 1,
0.5143414, -0.3604442, 1.71823, 1, 0, 0, 1, 1,
0.5154313, 0.05647498, 2.768071, 1, 0, 0, 1, 1,
0.5166728, 0.6455703, 1.754426, 1, 0, 0, 1, 1,
0.5217943, -0.5424743, 3.001349, 0, 0, 0, 1, 1,
0.5241856, 1.004605, 2.395736, 0, 0, 0, 1, 1,
0.5299245, 2.08837, 0.579026, 0, 0, 0, 1, 1,
0.5337658, 1.544634, 0.1198069, 0, 0, 0, 1, 1,
0.5363259, 1.55663, -1.528217, 0, 0, 0, 1, 1,
0.5383813, 0.4497552, 1.561933, 0, 0, 0, 1, 1,
0.5412433, 0.3688425, 1.615193, 0, 0, 0, 1, 1,
0.5418442, -0.485503, 1.430062, 1, 1, 1, 1, 1,
0.5636154, -1.441296, 1.962838, 1, 1, 1, 1, 1,
0.5650445, 0.3604544, 1.621704, 1, 1, 1, 1, 1,
0.5700328, 1.098641, 1.226449, 1, 1, 1, 1, 1,
0.5702057, -0.6920806, 1.97398, 1, 1, 1, 1, 1,
0.5707944, 1.312513, 0.865621, 1, 1, 1, 1, 1,
0.573082, 0.07712091, 0.4903588, 1, 1, 1, 1, 1,
0.5770997, -0.5071957, 3.626053, 1, 1, 1, 1, 1,
0.5782862, -0.1865239, 0.396193, 1, 1, 1, 1, 1,
0.5849714, -0.3779539, 1.628624, 1, 1, 1, 1, 1,
0.5869359, -0.4823726, 2.455746, 1, 1, 1, 1, 1,
0.5925543, -0.2530119, 2.861273, 1, 1, 1, 1, 1,
0.5930658, 1.271357, -0.3527635, 1, 1, 1, 1, 1,
0.5949671, -0.8878474, 2.763477, 1, 1, 1, 1, 1,
0.6050016, 0.4056453, 1.613288, 1, 1, 1, 1, 1,
0.6072585, 0.9243107, 1.635283, 0, 0, 1, 1, 1,
0.6133964, 0.2420758, 1.632588, 1, 0, 0, 1, 1,
0.6156128, 1.215938, 0.6032815, 1, 0, 0, 1, 1,
0.6156317, 0.7539717, -0.6594933, 1, 0, 0, 1, 1,
0.6267946, 0.4750783, 1.543861, 1, 0, 0, 1, 1,
0.6380574, 0.2593509, 1.309934, 1, 0, 0, 1, 1,
0.6409981, -0.2703851, 1.388244, 0, 0, 0, 1, 1,
0.6437792, -0.5960385, 1.366576, 0, 0, 0, 1, 1,
0.6482725, 1.392002, -0.597554, 0, 0, 0, 1, 1,
0.6548777, -0.3312136, 4.030073, 0, 0, 0, 1, 1,
0.6585754, 1.500971, 1.974387, 0, 0, 0, 1, 1,
0.6592984, -0.07188986, 1.522404, 0, 0, 0, 1, 1,
0.6599841, -0.6570687, 2.933376, 0, 0, 0, 1, 1,
0.6675366, 1.641965, -0.2654112, 1, 1, 1, 1, 1,
0.6691965, -0.6212652, 1.687506, 1, 1, 1, 1, 1,
0.6721075, 1.435553, -0.2963561, 1, 1, 1, 1, 1,
0.6747068, -0.04756931, 2.850457, 1, 1, 1, 1, 1,
0.674996, 1.419462, 1.985723, 1, 1, 1, 1, 1,
0.677143, 0.6376718, 1.546452, 1, 1, 1, 1, 1,
0.6773058, -0.5023254, 0.9348279, 1, 1, 1, 1, 1,
0.6784011, 0.3222418, 3.073489, 1, 1, 1, 1, 1,
0.6810729, -0.2305357, 3.104849, 1, 1, 1, 1, 1,
0.6815224, -1.610166, 1.578768, 1, 1, 1, 1, 1,
0.6816059, 0.810595, 1.959605, 1, 1, 1, 1, 1,
0.6821597, -1.688269, 3.489789, 1, 1, 1, 1, 1,
0.6835409, -0.9448723, 3.347365, 1, 1, 1, 1, 1,
0.6858723, -1.932394, 2.310689, 1, 1, 1, 1, 1,
0.6875979, -1.752368, 2.812968, 1, 1, 1, 1, 1,
0.6879089, -1.60979, 3.331312, 0, 0, 1, 1, 1,
0.6881179, 1.403147, 0.07171395, 1, 0, 0, 1, 1,
0.6909515, -0.5982659, 3.722957, 1, 0, 0, 1, 1,
0.6911003, 0.5267376, -0.9069771, 1, 0, 0, 1, 1,
0.6932495, -0.8239578, 1.844025, 1, 0, 0, 1, 1,
0.7017018, -0.09910439, 4.087938, 1, 0, 0, 1, 1,
0.703027, 0.4939744, 1.3324, 0, 0, 0, 1, 1,
0.7077018, 2.011645, -0.01852367, 0, 0, 0, 1, 1,
0.7094085, -0.5683104, 3.872999, 0, 0, 0, 1, 1,
0.7229245, -1.275977, 2.227744, 0, 0, 0, 1, 1,
0.7331321, -1.574547, 2.791841, 0, 0, 0, 1, 1,
0.7346551, 0.6401592, 2.178418, 0, 0, 0, 1, 1,
0.736396, -1.604257, 2.590789, 0, 0, 0, 1, 1,
0.7404778, -0.5432583, 1.784707, 1, 1, 1, 1, 1,
0.7426493, 0.2791932, 0.2866356, 1, 1, 1, 1, 1,
0.7448569, -0.4952733, -0.5939476, 1, 1, 1, 1, 1,
0.7503834, -1.151989, 2.805917, 1, 1, 1, 1, 1,
0.7594039, -0.2616605, 2.606024, 1, 1, 1, 1, 1,
0.7642256, 1.184114, 1.014089, 1, 1, 1, 1, 1,
0.7658305, 0.3385466, -0.3161878, 1, 1, 1, 1, 1,
0.7671716, -0.022844, 2.849433, 1, 1, 1, 1, 1,
0.7682682, -1.078784, 1.889539, 1, 1, 1, 1, 1,
0.7694563, 0.08936407, 2.392826, 1, 1, 1, 1, 1,
0.7701848, 0.6273452, 0.6367586, 1, 1, 1, 1, 1,
0.7708349, 1.027925, 2.749099, 1, 1, 1, 1, 1,
0.7725222, 0.5708554, 1.819621, 1, 1, 1, 1, 1,
0.7768816, -1.057155, 2.512397, 1, 1, 1, 1, 1,
0.7792045, -1.406541, 2.969641, 1, 1, 1, 1, 1,
0.782024, -1.398677, 3.367917, 0, 0, 1, 1, 1,
0.7830986, 1.244656, 0.1608575, 1, 0, 0, 1, 1,
0.7839199, -1.147792, 2.398502, 1, 0, 0, 1, 1,
0.7845276, -0.5637319, 2.532144, 1, 0, 0, 1, 1,
0.7869162, -0.4898032, 3.622064, 1, 0, 0, 1, 1,
0.7875199, -0.4754072, 1.85356, 1, 0, 0, 1, 1,
0.7913645, -0.2024907, 3.845113, 0, 0, 0, 1, 1,
0.794329, -0.2427972, 2.316805, 0, 0, 0, 1, 1,
0.7963278, 0.9031289, -0.5185355, 0, 0, 0, 1, 1,
0.8016096, -0.722431, 1.650705, 0, 0, 0, 1, 1,
0.8039345, 0.6490456, 1.958217, 0, 0, 0, 1, 1,
0.8051202, 1.046739, 0.6393111, 0, 0, 0, 1, 1,
0.8078367, -0.3534105, 2.137675, 0, 0, 0, 1, 1,
0.8188948, 0.3531854, 1.816568, 1, 1, 1, 1, 1,
0.8203896, -0.9868544, 2.342511, 1, 1, 1, 1, 1,
0.8267227, 1.922928, 0.1223027, 1, 1, 1, 1, 1,
0.8319497, -0.1510886, 2.885773, 1, 1, 1, 1, 1,
0.8341149, 1.110315, -0.5300983, 1, 1, 1, 1, 1,
0.8404641, -1.952884, 3.333539, 1, 1, 1, 1, 1,
0.8460174, 0.9290386, 0.8941984, 1, 1, 1, 1, 1,
0.8486092, -0.7114272, 2.883992, 1, 1, 1, 1, 1,
0.8494169, -0.1583559, 0.7377523, 1, 1, 1, 1, 1,
0.8502477, -0.9478251, 1.625669, 1, 1, 1, 1, 1,
0.8534939, -0.4762323, 1.32281, 1, 1, 1, 1, 1,
0.8557403, 0.6133659, 1.101369, 1, 1, 1, 1, 1,
0.8569731, 1.043444, 1.494137, 1, 1, 1, 1, 1,
0.8581176, -0.08864959, 3.083926, 1, 1, 1, 1, 1,
0.8617458, 0.4703179, 1.944399, 1, 1, 1, 1, 1,
0.8631814, -0.8557021, 3.323148, 0, 0, 1, 1, 1,
0.863847, 0.8853246, 0.5792835, 1, 0, 0, 1, 1,
0.8834324, 0.4280879, 2.643914, 1, 0, 0, 1, 1,
0.8859574, -0.1664065, 2.08422, 1, 0, 0, 1, 1,
0.8989807, -0.1321066, 2.101448, 1, 0, 0, 1, 1,
0.9055814, -0.5212663, 1.225985, 1, 0, 0, 1, 1,
0.9082841, 1.666308, 0.7000465, 0, 0, 0, 1, 1,
0.9087431, 1.70005, 0.7018038, 0, 0, 0, 1, 1,
0.9088199, 0.340835, -0.1935339, 0, 0, 0, 1, 1,
0.9200708, 0.269442, 0.3235903, 0, 0, 0, 1, 1,
0.9247692, -0.1159573, 1.077826, 0, 0, 0, 1, 1,
0.9271911, 1.089426, 2.129208, 0, 0, 0, 1, 1,
0.9279132, -1.123733, 2.680394, 0, 0, 0, 1, 1,
0.9303723, -0.3738355, 1.912655, 1, 1, 1, 1, 1,
0.9313157, 1.743074, -0.1453865, 1, 1, 1, 1, 1,
0.9384334, 0.4692496, 2.021534, 1, 1, 1, 1, 1,
0.9443273, 0.1617546, 1.355675, 1, 1, 1, 1, 1,
0.9541148, 0.2516904, 0.6501153, 1, 1, 1, 1, 1,
0.9568662, -0.8853747, 2.953822, 1, 1, 1, 1, 1,
0.9573654, 0.4718617, 0.3578772, 1, 1, 1, 1, 1,
0.9612588, -1.653388, 2.806295, 1, 1, 1, 1, 1,
0.9636288, -1.699489, 1.843674, 1, 1, 1, 1, 1,
0.9671752, -0.3588049, 2.510811, 1, 1, 1, 1, 1,
0.9684407, 0.8947658, -0.5127273, 1, 1, 1, 1, 1,
0.9690263, 0.5525221, 1.439826, 1, 1, 1, 1, 1,
0.9730802, -1.533144, 2.30518, 1, 1, 1, 1, 1,
0.9732832, 1.273101, 1.341871, 1, 1, 1, 1, 1,
0.9748915, -0.6403439, 0.4179498, 1, 1, 1, 1, 1,
0.9774714, -0.4016038, 0.9548442, 0, 0, 1, 1, 1,
0.9862033, 0.2947945, 1.564678, 1, 0, 0, 1, 1,
0.9866725, 0.3102032, 3.037746, 1, 0, 0, 1, 1,
0.9899524, -1.147739, 1.299154, 1, 0, 0, 1, 1,
1.002947, 0.4838067, 2.496793, 1, 0, 0, 1, 1,
1.003883, -1.393172, 2.488614, 1, 0, 0, 1, 1,
1.006107, 0.07073674, 2.522518, 0, 0, 0, 1, 1,
1.008454, -0.07598085, 2.612217, 0, 0, 0, 1, 1,
1.008683, 1.791845, 0.1623539, 0, 0, 0, 1, 1,
1.018002, -0.8590453, 2.929129, 0, 0, 0, 1, 1,
1.019605, 1.02272, 2.280407, 0, 0, 0, 1, 1,
1.019819, -0.7066922, 1.605299, 0, 0, 0, 1, 1,
1.022156, -0.07569209, 0.9113179, 0, 0, 0, 1, 1,
1.031777, 0.7228007, 0.2740282, 1, 1, 1, 1, 1,
1.035816, 0.7016129, 0.4372466, 1, 1, 1, 1, 1,
1.040494, -1.295562, 1.974764, 1, 1, 1, 1, 1,
1.040495, -0.398535, 1.050252, 1, 1, 1, 1, 1,
1.042855, 0.9692245, -0.4138104, 1, 1, 1, 1, 1,
1.057298, -1.702079, 2.219414, 1, 1, 1, 1, 1,
1.061547, 0.5181777, 0.6373498, 1, 1, 1, 1, 1,
1.066834, -0.4253024, 3.260205, 1, 1, 1, 1, 1,
1.067586, -0.2984339, 2.427823, 1, 1, 1, 1, 1,
1.069518, -0.02576084, -0.1317552, 1, 1, 1, 1, 1,
1.069982, -1.875911, 2.413841, 1, 1, 1, 1, 1,
1.088754, -0.1967153, 1.366299, 1, 1, 1, 1, 1,
1.09051, 1.885129, -0.1132936, 1, 1, 1, 1, 1,
1.092026, -0.940214, 1.857856, 1, 1, 1, 1, 1,
1.092386, -0.0737558, 3.527583, 1, 1, 1, 1, 1,
1.093925, -0.8742809, 1.002603, 0, 0, 1, 1, 1,
1.094193, 0.1410448, 2.937506, 1, 0, 0, 1, 1,
1.102674, 0.8289409, 0.1412175, 1, 0, 0, 1, 1,
1.123509, -0.1284629, 1.029885, 1, 0, 0, 1, 1,
1.126514, 0.08822703, 1.276545, 1, 0, 0, 1, 1,
1.12711, -0.7355667, 0.8873009, 1, 0, 0, 1, 1,
1.133423, 0.5114012, 1.588534, 0, 0, 0, 1, 1,
1.133736, 1.309326, 1.429767, 0, 0, 0, 1, 1,
1.134019, -0.02623317, 1.602579, 0, 0, 0, 1, 1,
1.135131, -0.8897914, 1.428236, 0, 0, 0, 1, 1,
1.13764, 0.06627233, 1.546305, 0, 0, 0, 1, 1,
1.137713, 0.2751646, 1.449683, 0, 0, 0, 1, 1,
1.141652, 1.350207, 0.7513025, 0, 0, 0, 1, 1,
1.141954, -0.7021908, 1.222587, 1, 1, 1, 1, 1,
1.146563, -0.01541236, 0.2458483, 1, 1, 1, 1, 1,
1.147844, 1.650079, 0.907784, 1, 1, 1, 1, 1,
1.161375, -0.52877, 0.5056092, 1, 1, 1, 1, 1,
1.1689, 2.086741, 1.446055, 1, 1, 1, 1, 1,
1.170635, 1.086816, 1.39786, 1, 1, 1, 1, 1,
1.175825, -0.3510004, 1.182605, 1, 1, 1, 1, 1,
1.18477, -0.4362074, 1.866264, 1, 1, 1, 1, 1,
1.186271, 0.1951866, 2.300444, 1, 1, 1, 1, 1,
1.196039, 1.627944, -1.690014, 1, 1, 1, 1, 1,
1.200669, 1.005497, 1.501187, 1, 1, 1, 1, 1,
1.208273, 0.9485106, 0.9293886, 1, 1, 1, 1, 1,
1.211386, -0.7863048, 4.002614, 1, 1, 1, 1, 1,
1.211926, 0.8047694, 2.164891, 1, 1, 1, 1, 1,
1.22191, -2.108089, 3.567357, 1, 1, 1, 1, 1,
1.225917, -0.09191152, 1.407107, 0, 0, 1, 1, 1,
1.226604, -0.5847101, 2.536528, 1, 0, 0, 1, 1,
1.22828, 0.293038, 1.319134, 1, 0, 0, 1, 1,
1.230136, 1.665055, -0.2798011, 1, 0, 0, 1, 1,
1.231449, -1.261982, 1.739712, 1, 0, 0, 1, 1,
1.24347, -0.2889912, 2.744806, 1, 0, 0, 1, 1,
1.24776, 0.229559, 2.594961, 0, 0, 0, 1, 1,
1.252097, 0.7124351, 0.9977335, 0, 0, 0, 1, 1,
1.254975, 0.7092313, 1.353557, 0, 0, 0, 1, 1,
1.26625, -0.7582722, 4.326276, 0, 0, 0, 1, 1,
1.27426, 2.140023, 2.627882, 0, 0, 0, 1, 1,
1.27561, 0.4902745, 1.652234, 0, 0, 0, 1, 1,
1.275893, -0.7406004, 1.386546, 0, 0, 0, 1, 1,
1.279635, 0.5711342, -0.6714233, 1, 1, 1, 1, 1,
1.286965, 1.121136, -0.4404288, 1, 1, 1, 1, 1,
1.28766, -0.2037407, 0.8489739, 1, 1, 1, 1, 1,
1.288048, 0.4235513, 0.9304495, 1, 1, 1, 1, 1,
1.289585, 0.4397418, 1.562308, 1, 1, 1, 1, 1,
1.290365, -1.262922, 3.07332, 1, 1, 1, 1, 1,
1.29154, -1.657629, 2.076222, 1, 1, 1, 1, 1,
1.310203, -0.9134927, 0.8929212, 1, 1, 1, 1, 1,
1.314677, -0.1084, 2.974711, 1, 1, 1, 1, 1,
1.322032, -0.3384034, 2.536175, 1, 1, 1, 1, 1,
1.324765, 1.284726, 1.837171, 1, 1, 1, 1, 1,
1.32515, 0.03428863, -1.082129, 1, 1, 1, 1, 1,
1.327405, 0.3283253, 0.1793541, 1, 1, 1, 1, 1,
1.332884, -1.370277, 2.955248, 1, 1, 1, 1, 1,
1.337053, 0.5692023, 1.386051, 1, 1, 1, 1, 1,
1.342866, 0.868387, 1.091482, 0, 0, 1, 1, 1,
1.343518, -0.7665808, 3.849581, 1, 0, 0, 1, 1,
1.345465, -0.6920314, 2.798772, 1, 0, 0, 1, 1,
1.352593, -0.8545969, 2.006245, 1, 0, 0, 1, 1,
1.353738, -0.4322398, 1.462161, 1, 0, 0, 1, 1,
1.361743, -0.2932352, 3.123605, 1, 0, 0, 1, 1,
1.370089, -0.1663152, 2.513974, 0, 0, 0, 1, 1,
1.370812, 1.698578, 0.6213775, 0, 0, 0, 1, 1,
1.371212, 0.7879456, 1.311551, 0, 0, 0, 1, 1,
1.375118, 0.8948778, 1.684309, 0, 0, 0, 1, 1,
1.377887, 1.333645, -0.3071809, 0, 0, 0, 1, 1,
1.379505, -1.167241, 2.513122, 0, 0, 0, 1, 1,
1.385026, 1.103213, 1.055809, 0, 0, 0, 1, 1,
1.386413, -0.9778301, 1.670057, 1, 1, 1, 1, 1,
1.396485, 1.760759, 1.187999, 1, 1, 1, 1, 1,
1.401032, 1.014528, 1.278265, 1, 1, 1, 1, 1,
1.409944, -0.5604088, 2.204888, 1, 1, 1, 1, 1,
1.410202, -0.4985205, 2.423717, 1, 1, 1, 1, 1,
1.418188, -0.1981003, 1.23744, 1, 1, 1, 1, 1,
1.421166, -1.209706, 2.505148, 1, 1, 1, 1, 1,
1.427857, 1.113949, 1.096748, 1, 1, 1, 1, 1,
1.428954, 0.6357573, 2.180405, 1, 1, 1, 1, 1,
1.43752, 0.6219522, 1.746656, 1, 1, 1, 1, 1,
1.442635, 0.4676612, 1.006031, 1, 1, 1, 1, 1,
1.455908, 0.0906123, 1.978495, 1, 1, 1, 1, 1,
1.458521, 0.9525528, -1.251221, 1, 1, 1, 1, 1,
1.459843, -0.4052649, 2.555129, 1, 1, 1, 1, 1,
1.466938, 0.6224414, -0.6333162, 1, 1, 1, 1, 1,
1.468902, -1.467056, 2.406734, 0, 0, 1, 1, 1,
1.472286, 0.9525702, 1.854598, 1, 0, 0, 1, 1,
1.473289, 0.380921, 2.220775, 1, 0, 0, 1, 1,
1.480416, 1.2312, 0.6028555, 1, 0, 0, 1, 1,
1.490902, 0.8925343, 2.521155, 1, 0, 0, 1, 1,
1.496135, 0.574763, 2.340168, 1, 0, 0, 1, 1,
1.497719, -1.077126, 1.603057, 0, 0, 0, 1, 1,
1.503951, 0.5985711, 3.356818, 0, 0, 0, 1, 1,
1.51303, -0.7032249, 1.316257, 0, 0, 0, 1, 1,
1.515014, 0.5054937, 2.701592, 0, 0, 0, 1, 1,
1.534906, -1.600052, 1.428853, 0, 0, 0, 1, 1,
1.537263, 0.01579991, 3.084061, 0, 0, 0, 1, 1,
1.544477, 0.2915176, 1.203401, 0, 0, 0, 1, 1,
1.558432, 0.2132792, 2.292527, 1, 1, 1, 1, 1,
1.573572, -0.4496469, 2.514671, 1, 1, 1, 1, 1,
1.580252, -0.3474638, 1.207631, 1, 1, 1, 1, 1,
1.634591, 0.4667066, 1.174142, 1, 1, 1, 1, 1,
1.645294, -1.209878, 3.444499, 1, 1, 1, 1, 1,
1.653705, 0.4618999, 2.85104, 1, 1, 1, 1, 1,
1.656346, -1.313652, 3.101899, 1, 1, 1, 1, 1,
1.669175, -0.2361861, 1.807277, 1, 1, 1, 1, 1,
1.670349, 1.124739, 2.188771, 1, 1, 1, 1, 1,
1.673915, 0.5595639, 0.1694912, 1, 1, 1, 1, 1,
1.675889, -0.03721211, -0.1527628, 1, 1, 1, 1, 1,
1.686937, 0.003172948, 1.646816, 1, 1, 1, 1, 1,
1.698746, 0.308341, 1.328163, 1, 1, 1, 1, 1,
1.709023, 0.4962789, 0.8336092, 1, 1, 1, 1, 1,
1.709935, 0.7535754, 1.038791, 1, 1, 1, 1, 1,
1.718223, 1.60738, 3.121987, 0, 0, 1, 1, 1,
1.718656, 1.496706, 1.991426, 1, 0, 0, 1, 1,
1.722438, -1.139411, -0.1283297, 1, 0, 0, 1, 1,
1.723349, -0.6144994, 0.3889138, 1, 0, 0, 1, 1,
1.779878, -1.917788, 4.410397, 1, 0, 0, 1, 1,
1.782591, 0.2504278, 0.6422569, 1, 0, 0, 1, 1,
1.787498, -0.9920741, 1.814988, 0, 0, 0, 1, 1,
1.801024, -1.673272, 1.572217, 0, 0, 0, 1, 1,
1.809458, 0.02879161, 0.7384664, 0, 0, 0, 1, 1,
1.81757, -0.4858347, 2.743246, 0, 0, 0, 1, 1,
1.835974, 0.6513204, 0.2191272, 0, 0, 0, 1, 1,
1.840876, -0.2254515, -0.6749858, 0, 0, 0, 1, 1,
1.852742, 0.7586423, 0.6967153, 0, 0, 0, 1, 1,
1.895403, -0.3123558, 2.328402, 1, 1, 1, 1, 1,
1.909834, -0.3986165, 0.6774415, 1, 1, 1, 1, 1,
1.926483, 0.7270858, 2.441065, 1, 1, 1, 1, 1,
1.94015, -1.183885, 0.3421679, 1, 1, 1, 1, 1,
1.959082, 0.7829766, -0.2828107, 1, 1, 1, 1, 1,
1.980607, -0.3429889, 0.9976616, 1, 1, 1, 1, 1,
1.98855, 1.348876, 1.813031, 1, 1, 1, 1, 1,
2.00112, 0.2031101, 2.748643, 1, 1, 1, 1, 1,
2.025901, -0.3691357, 0.1365771, 1, 1, 1, 1, 1,
2.042654, 0.3020507, 0.9845752, 1, 1, 1, 1, 1,
2.047549, 1.245768, 2.205362, 1, 1, 1, 1, 1,
2.055223, 0.2769395, 0.7564765, 1, 1, 1, 1, 1,
2.068414, 1.453691, 0.9139688, 1, 1, 1, 1, 1,
2.076933, 0.5705588, 0.8154447, 1, 1, 1, 1, 1,
2.078372, -0.8282729, 2.491789, 1, 1, 1, 1, 1,
2.0903, -0.8564995, 1.952456, 0, 0, 1, 1, 1,
2.10711, -0.2869003, 2.556604, 1, 0, 0, 1, 1,
2.147294, -1.647394, 3.190161, 1, 0, 0, 1, 1,
2.151548, -0.1120483, 2.286644, 1, 0, 0, 1, 1,
2.155533, 0.9072379, 0.4623979, 1, 0, 0, 1, 1,
2.160126, -0.6766212, 1.917049, 1, 0, 0, 1, 1,
2.188078, 0.1802702, 0.7682679, 0, 0, 0, 1, 1,
2.233683, 0.2750918, 0.8105478, 0, 0, 0, 1, 1,
2.250515, -1.315903, 2.086409, 0, 0, 0, 1, 1,
2.279952, 0.947544, 0.04190426, 0, 0, 0, 1, 1,
2.29807, 0.5265963, 0.2230499, 0, 0, 0, 1, 1,
2.298114, 0.1008073, 1.238719, 0, 0, 0, 1, 1,
2.300299, 1.356439, -0.3225587, 0, 0, 0, 1, 1,
2.314621, 1.486987, -0.8652797, 1, 1, 1, 1, 1,
2.31847, -2.159418, 1.347785, 1, 1, 1, 1, 1,
2.340928, -0.4253919, 2.850809, 1, 1, 1, 1, 1,
2.436831, 3.570454, 0.7890477, 1, 1, 1, 1, 1,
2.441816, -0.7048146, 3.60904, 1, 1, 1, 1, 1,
2.458603, -0.005638806, 2.116325, 1, 1, 1, 1, 1,
2.545957, -0.9894144, 1.973424, 1, 1, 1, 1, 1
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
var radius = 9.652367;
var distance = 33.90353;
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
mvMatrix.translate( 0.3378506, -0.3763809, 0.6507494 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.90353);
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
