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
-3.293462, 0.6318703, -3.529319, 1, 0, 0, 1,
-3.264233, 0.1896869, -0.3740504, 1, 0.007843138, 0, 1,
-2.948677, -0.6881387, -1.789842, 1, 0.01176471, 0, 1,
-2.819827, -0.1363532, -1.921697, 1, 0.01960784, 0, 1,
-2.812598, 0.1139328, -0.8609058, 1, 0.02352941, 0, 1,
-2.781096, -0.9520302, -2.316924, 1, 0.03137255, 0, 1,
-2.763946, -0.7582732, -0.7500346, 1, 0.03529412, 0, 1,
-2.72744, 0.284429, -2.073311, 1, 0.04313726, 0, 1,
-2.421483, 0.7420496, -1.946516, 1, 0.04705882, 0, 1,
-2.411878, 0.5797068, -0.08817521, 1, 0.05490196, 0, 1,
-2.408491, -1.027806, -1.551899, 1, 0.05882353, 0, 1,
-2.375374, 0.4060882, -0.07550462, 1, 0.06666667, 0, 1,
-2.364236, 0.4619131, -1.801254, 1, 0.07058824, 0, 1,
-2.356074, -0.4178389, -2.517219, 1, 0.07843138, 0, 1,
-2.230881, -0.2526072, 0.467555, 1, 0.08235294, 0, 1,
-2.114428, -1.057049, -1.496773, 1, 0.09019608, 0, 1,
-2.085866, -0.5213588, -2.467287, 1, 0.09411765, 0, 1,
-2.044933, -0.5505104, -1.28916, 1, 0.1019608, 0, 1,
-2.03705, -0.4925113, -2.608325, 1, 0.1098039, 0, 1,
-2.03225, -0.9014346, -2.686241, 1, 0.1137255, 0, 1,
-2.028374, -0.8645863, -1.962627, 1, 0.1215686, 0, 1,
-1.994242, -0.81758, 0.1767088, 1, 0.1254902, 0, 1,
-1.92983, 0.05337472, -0.7694918, 1, 0.1333333, 0, 1,
-1.897881, -0.5999376, -0.8597079, 1, 0.1372549, 0, 1,
-1.853789, -1.382879, -0.8146692, 1, 0.145098, 0, 1,
-1.847049, 0.8220571, -1.127161, 1, 0.1490196, 0, 1,
-1.846108, 0.2042799, -2.685636, 1, 0.1568628, 0, 1,
-1.815404, -0.4808571, -2.315333, 1, 0.1607843, 0, 1,
-1.806698, 0.5005248, 0.09272315, 1, 0.1686275, 0, 1,
-1.805572, -0.6446009, -2.941894, 1, 0.172549, 0, 1,
-1.779179, 0.4147751, -1.091815, 1, 0.1803922, 0, 1,
-1.761864, -1.503071, -1.282295, 1, 0.1843137, 0, 1,
-1.761714, 0.4230916, 0.1460472, 1, 0.1921569, 0, 1,
-1.749384, 0.5884988, -1.877773, 1, 0.1960784, 0, 1,
-1.748898, 0.7252147, -0.4689567, 1, 0.2039216, 0, 1,
-1.74798, 1.205044, -0.03411928, 1, 0.2117647, 0, 1,
-1.741144, 0.5972152, -0.80365, 1, 0.2156863, 0, 1,
-1.737098, 1.752418, -1.682078, 1, 0.2235294, 0, 1,
-1.733024, -0.952557, -1.54414, 1, 0.227451, 0, 1,
-1.726272, -1.36138, -2.824471, 1, 0.2352941, 0, 1,
-1.723592, 0.5689089, -0.9201368, 1, 0.2392157, 0, 1,
-1.719844, -0.7161521, -0.5504971, 1, 0.2470588, 0, 1,
-1.719779, -0.0006580999, -0.7637238, 1, 0.2509804, 0, 1,
-1.718963, 0.8280991, -1.650644, 1, 0.2588235, 0, 1,
-1.695246, 0.3661574, -2.169788, 1, 0.2627451, 0, 1,
-1.683948, -0.3229492, -0.7252752, 1, 0.2705882, 0, 1,
-1.672864, 0.3241245, -1.325504, 1, 0.2745098, 0, 1,
-1.664885, 1.227766, 0.1643194, 1, 0.282353, 0, 1,
-1.657786, -1.169286, -2.066743, 1, 0.2862745, 0, 1,
-1.654568, -1.437207, -2.308266, 1, 0.2941177, 0, 1,
-1.652504, -0.6388373, -2.084483, 1, 0.3019608, 0, 1,
-1.648245, 2.726312, 0.4068348, 1, 0.3058824, 0, 1,
-1.648066, -0.3427481, -1.816678, 1, 0.3137255, 0, 1,
-1.632993, 0.2436914, -1.822608, 1, 0.3176471, 0, 1,
-1.596371, 0.1264861, -0.7315345, 1, 0.3254902, 0, 1,
-1.581442, 0.7647105, -0.9857792, 1, 0.3294118, 0, 1,
-1.5654, -0.6225374, -0.9451469, 1, 0.3372549, 0, 1,
-1.53986, 1.324213, -1.40977, 1, 0.3411765, 0, 1,
-1.508587, 0.6833619, -1.822127, 1, 0.3490196, 0, 1,
-1.504593, 0.3003429, -0.7207696, 1, 0.3529412, 0, 1,
-1.498474, -0.2807914, -2.193213, 1, 0.3607843, 0, 1,
-1.496953, -0.4553152, -1.796191, 1, 0.3647059, 0, 1,
-1.494135, -1.146109, -1.643556, 1, 0.372549, 0, 1,
-1.492598, 1.588255, -4.147079, 1, 0.3764706, 0, 1,
-1.49131, -0.4592476, -1.363046, 1, 0.3843137, 0, 1,
-1.488562, 1.319095, 0.02221549, 1, 0.3882353, 0, 1,
-1.480017, -1.050677, -2.071486, 1, 0.3960784, 0, 1,
-1.479733, -0.2240431, -3.166292, 1, 0.4039216, 0, 1,
-1.461658, -1.295847, -2.619175, 1, 0.4078431, 0, 1,
-1.4538, 0.574965, 1.236604, 1, 0.4156863, 0, 1,
-1.449596, -1.081043, -3.63471, 1, 0.4196078, 0, 1,
-1.442722, 0.009092107, -1.985632, 1, 0.427451, 0, 1,
-1.438875, -2.082882, -2.045841, 1, 0.4313726, 0, 1,
-1.427691, 0.7201831, -1.749085, 1, 0.4392157, 0, 1,
-1.426344, -0.5515408, -2.219887, 1, 0.4431373, 0, 1,
-1.418078, 0.3185969, -1.625199, 1, 0.4509804, 0, 1,
-1.417336, 0.5051838, -1.318427, 1, 0.454902, 0, 1,
-1.417251, -0.8070307, -4.108508, 1, 0.4627451, 0, 1,
-1.413661, -1.040507, -4.372043, 1, 0.4666667, 0, 1,
-1.407191, 0.3592655, -1.823149, 1, 0.4745098, 0, 1,
-1.40342, 0.1042759, -1.416473, 1, 0.4784314, 0, 1,
-1.401986, -0.666555, -2.015505, 1, 0.4862745, 0, 1,
-1.384994, 0.170973, -0.7370237, 1, 0.4901961, 0, 1,
-1.355208, 0.3565169, -1.192765, 1, 0.4980392, 0, 1,
-1.353428, -0.04795737, -1.027142, 1, 0.5058824, 0, 1,
-1.344047, -1.217395, -2.703846, 1, 0.509804, 0, 1,
-1.343924, 1.80831, -0.5859673, 1, 0.5176471, 0, 1,
-1.339692, 0.4152527, -0.1120703, 1, 0.5215687, 0, 1,
-1.334238, -1.421541, -3.005595, 1, 0.5294118, 0, 1,
-1.333254, -0.7340503, -1.403811, 1, 0.5333334, 0, 1,
-1.331668, 0.920752, -1.057084, 1, 0.5411765, 0, 1,
-1.324261, -1.76269, -2.417934, 1, 0.5450981, 0, 1,
-1.320261, 0.7029886, -3.42389, 1, 0.5529412, 0, 1,
-1.317682, -0.6105583, -1.233257, 1, 0.5568628, 0, 1,
-1.314635, 1.093184, -1.19973, 1, 0.5647059, 0, 1,
-1.305191, -0.5684294, -2.676399, 1, 0.5686275, 0, 1,
-1.299029, 1.325861, -1.650274, 1, 0.5764706, 0, 1,
-1.294023, 1.08189, -3.075098, 1, 0.5803922, 0, 1,
-1.289211, -0.1540587, -0.305995, 1, 0.5882353, 0, 1,
-1.286619, 0.01678784, -1.469311, 1, 0.5921569, 0, 1,
-1.285653, 0.270843, -2.041736, 1, 0.6, 0, 1,
-1.278702, -1.518658, -2.865006, 1, 0.6078432, 0, 1,
-1.267735, 0.3775841, -1.765219, 1, 0.6117647, 0, 1,
-1.264222, -0.925986, -1.724413, 1, 0.6196079, 0, 1,
-1.259002, -0.4174674, -1.402478, 1, 0.6235294, 0, 1,
-1.249317, 1.573273, -0.9517179, 1, 0.6313726, 0, 1,
-1.247154, -2.774213, -2.054263, 1, 0.6352941, 0, 1,
-1.244017, 0.9941695, -3.711387, 1, 0.6431373, 0, 1,
-1.241627, 0.04550696, 0.2598514, 1, 0.6470588, 0, 1,
-1.240007, -0.9351636, -4.649854, 1, 0.654902, 0, 1,
-1.232646, -1.630545, -3.113772, 1, 0.6588235, 0, 1,
-1.227799, 1.465191, -1.212225, 1, 0.6666667, 0, 1,
-1.221732, 0.2048516, -0.9208763, 1, 0.6705883, 0, 1,
-1.218166, -0.172237, -0.3483676, 1, 0.6784314, 0, 1,
-1.210771, 0.8974013, -0.2083307, 1, 0.682353, 0, 1,
-1.208058, 1.75139, 0.9749449, 1, 0.6901961, 0, 1,
-1.207943, 1.710469, 0.7867573, 1, 0.6941177, 0, 1,
-1.203579, 0.53464, -1.505559, 1, 0.7019608, 0, 1,
-1.190938, -1.621502, -2.92673, 1, 0.7098039, 0, 1,
-1.180661, -1.498809, -1.42555, 1, 0.7137255, 0, 1,
-1.180203, 0.04912988, -1.160488, 1, 0.7215686, 0, 1,
-1.176082, 0.2774616, -1.584945, 1, 0.7254902, 0, 1,
-1.174147, -1.287614, -2.726295, 1, 0.7333333, 0, 1,
-1.172456, -0.3289306, -1.151786, 1, 0.7372549, 0, 1,
-1.172447, 0.8326354, -1.409309, 1, 0.7450981, 0, 1,
-1.166584, -0.9445977, -1.215009, 1, 0.7490196, 0, 1,
-1.159053, 2.96117, -2.891837, 1, 0.7568628, 0, 1,
-1.156309, -2.329889, -2.030496, 1, 0.7607843, 0, 1,
-1.153636, 0.03428188, -0.528246, 1, 0.7686275, 0, 1,
-1.147685, -0.8837672, -2.922503, 1, 0.772549, 0, 1,
-1.138691, 1.346718, -0.5917718, 1, 0.7803922, 0, 1,
-1.136615, -0.3033397, -1.29159, 1, 0.7843137, 0, 1,
-1.124364, 0.3175084, -3.554918, 1, 0.7921569, 0, 1,
-1.117127, -0.3160572, -1.715955, 1, 0.7960784, 0, 1,
-1.116931, -0.6741292, -1.787905, 1, 0.8039216, 0, 1,
-1.103711, -0.8869541, -2.136233, 1, 0.8117647, 0, 1,
-1.094261, 1.360679, -1.204448, 1, 0.8156863, 0, 1,
-1.078294, 0.2448155, -3.805145, 1, 0.8235294, 0, 1,
-1.077012, 1.306439, -0.2060753, 1, 0.827451, 0, 1,
-1.066431, -1.893896, -3.811014, 1, 0.8352941, 0, 1,
-1.057898, -0.8538622, -3.027309, 1, 0.8392157, 0, 1,
-1.052177, -0.5557539, -2.899809, 1, 0.8470588, 0, 1,
-1.046852, 0.870693, 0.4092944, 1, 0.8509804, 0, 1,
-1.037205, 0.01853496, -2.120379, 1, 0.8588235, 0, 1,
-1.033943, 1.605939, 0.542694, 1, 0.8627451, 0, 1,
-1.026436, -0.6817591, -3.556364, 1, 0.8705882, 0, 1,
-1.024917, -0.03371555, -2.8543, 1, 0.8745098, 0, 1,
-1.016544, -0.5645791, -1.492252, 1, 0.8823529, 0, 1,
-1.014532, 0.1723484, -2.381663, 1, 0.8862745, 0, 1,
-1.011047, 0.08768135, -1.616813, 1, 0.8941177, 0, 1,
-1.005645, -1.817781, -1.108683, 1, 0.8980392, 0, 1,
-1.005266, -0.7370892, -3.845614, 1, 0.9058824, 0, 1,
-1.001215, 1.731679, -0.4645385, 1, 0.9137255, 0, 1,
-0.9978484, 0.2012533, -3.632547, 1, 0.9176471, 0, 1,
-0.9957209, -0.770577, -2.522969, 1, 0.9254902, 0, 1,
-0.9957067, 0.6161664, -0.5111287, 1, 0.9294118, 0, 1,
-0.9946913, -0.6056647, -2.004961, 1, 0.9372549, 0, 1,
-0.9942455, -0.07853525, -1.208923, 1, 0.9411765, 0, 1,
-0.9931166, 0.4456489, -1.981934, 1, 0.9490196, 0, 1,
-0.9846591, -0.3924509, -2.550032, 1, 0.9529412, 0, 1,
-0.9825528, -1.043995, -2.403488, 1, 0.9607843, 0, 1,
-0.9792317, 0.1042221, -0.6710951, 1, 0.9647059, 0, 1,
-0.9737318, -0.7852889, -1.972671, 1, 0.972549, 0, 1,
-0.9716005, -0.05344148, -2.72115, 1, 0.9764706, 0, 1,
-0.9620968, -0.6460145, -2.117032, 1, 0.9843137, 0, 1,
-0.9614174, -0.1365366, -2.155982, 1, 0.9882353, 0, 1,
-0.9574628, 0.6135514, -0.4892929, 1, 0.9960784, 0, 1,
-0.9531206, -0.3742235, -4.45551, 0.9960784, 1, 0, 1,
-0.9528345, -1.048748, -3.050096, 0.9921569, 1, 0, 1,
-0.9517487, -0.6648554, -2.736706, 0.9843137, 1, 0, 1,
-0.9500667, 1.536039, 1.796126, 0.9803922, 1, 0, 1,
-0.9494762, -1.349965, -1.528108, 0.972549, 1, 0, 1,
-0.9468427, 0.4556747, -1.236082, 0.9686275, 1, 0, 1,
-0.9454215, 1.032076, 1.781565, 0.9607843, 1, 0, 1,
-0.9445282, -0.3679564, -3.474076, 0.9568627, 1, 0, 1,
-0.9429902, -0.8878974, -2.840375, 0.9490196, 1, 0, 1,
-0.9326638, -0.467099, -2.06812, 0.945098, 1, 0, 1,
-0.9322176, -2.290752, -3.749721, 0.9372549, 1, 0, 1,
-0.9321249, 0.03116109, -1.953969, 0.9333333, 1, 0, 1,
-0.9283875, -0.6026887, -3.17825, 0.9254902, 1, 0, 1,
-0.9207298, -3.851462, -3.346694, 0.9215686, 1, 0, 1,
-0.9163426, -0.2789873, -1.396659, 0.9137255, 1, 0, 1,
-0.9149281, 1.398376, 0.209599, 0.9098039, 1, 0, 1,
-0.9108818, 1.2895, -0.4670665, 0.9019608, 1, 0, 1,
-0.9093265, 1.000538, -1.440721, 0.8941177, 1, 0, 1,
-0.9080428, 1.845343, -1.214885, 0.8901961, 1, 0, 1,
-0.899886, 0.7197291, -0.8661964, 0.8823529, 1, 0, 1,
-0.8978451, -0.5398923, -3.004498, 0.8784314, 1, 0, 1,
-0.8903168, 0.9645745, -0.7273675, 0.8705882, 1, 0, 1,
-0.890124, 0.5145237, -2.038487, 0.8666667, 1, 0, 1,
-0.8897735, 0.2574225, 0.1876068, 0.8588235, 1, 0, 1,
-0.8859471, -1.309492, -3.282245, 0.854902, 1, 0, 1,
-0.8835512, 1.475493, 0.8342168, 0.8470588, 1, 0, 1,
-0.8787706, 0.4177492, -0.08034572, 0.8431373, 1, 0, 1,
-0.869202, 0.3623688, -1.647367, 0.8352941, 1, 0, 1,
-0.8600959, 0.6623775, -2.086919, 0.8313726, 1, 0, 1,
-0.8536705, -0.4828137, -3.314088, 0.8235294, 1, 0, 1,
-0.8468487, 1.60946, -1.325938, 0.8196079, 1, 0, 1,
-0.8448025, 0.8768978, -2.488269, 0.8117647, 1, 0, 1,
-0.8417627, 0.2409273, -1.002625, 0.8078431, 1, 0, 1,
-0.8416817, -0.8904951, -3.432817, 0.8, 1, 0, 1,
-0.8387866, 0.328534, -1.875301, 0.7921569, 1, 0, 1,
-0.8330001, 0.6108384, -3.078747, 0.7882353, 1, 0, 1,
-0.8321642, 0.8246808, 0.1775369, 0.7803922, 1, 0, 1,
-0.8280343, -0.9092507, -2.6752, 0.7764706, 1, 0, 1,
-0.8261501, -0.6911967, -1.928637, 0.7686275, 1, 0, 1,
-0.8257396, 0.03105098, -1.185342, 0.7647059, 1, 0, 1,
-0.8165498, 1.262369, -1.266633, 0.7568628, 1, 0, 1,
-0.8135219, 0.5546969, -0.9550552, 0.7529412, 1, 0, 1,
-0.8065135, 0.0587181, -1.218226, 0.7450981, 1, 0, 1,
-0.8053558, 0.1758945, -2.196612, 0.7411765, 1, 0, 1,
-0.8017063, -0.6461627, -3.224124, 0.7333333, 1, 0, 1,
-0.7944482, -0.7881375, -2.610315, 0.7294118, 1, 0, 1,
-0.7934076, -0.2389808, -0.8492652, 0.7215686, 1, 0, 1,
-0.7927799, 0.09388204, 1.576168, 0.7176471, 1, 0, 1,
-0.7901831, 0.8181527, -0.8377474, 0.7098039, 1, 0, 1,
-0.7895201, -0.2053336, -1.9137, 0.7058824, 1, 0, 1,
-0.7875689, 0.3420198, -1.580279, 0.6980392, 1, 0, 1,
-0.7829698, 1.271251, 1.814571, 0.6901961, 1, 0, 1,
-0.7791136, -0.2940368, -2.95928, 0.6862745, 1, 0, 1,
-0.7681454, -0.479116, -2.452804, 0.6784314, 1, 0, 1,
-0.7678189, -0.7916511, -3.087698, 0.6745098, 1, 0, 1,
-0.7671478, 1.080466, -0.7642307, 0.6666667, 1, 0, 1,
-0.7667996, -0.7937748, -3.933126, 0.6627451, 1, 0, 1,
-0.7652845, 0.9483227, -2.571931, 0.654902, 1, 0, 1,
-0.7651165, 1.383098, -0.8488448, 0.6509804, 1, 0, 1,
-0.7622525, -0.05187329, -2.696744, 0.6431373, 1, 0, 1,
-0.7554429, -0.01094262, -1.611551, 0.6392157, 1, 0, 1,
-0.7525075, -1.516904, -2.361519, 0.6313726, 1, 0, 1,
-0.7461314, -0.8888612, -2.846659, 0.627451, 1, 0, 1,
-0.7459205, -2.120879, -3.227575, 0.6196079, 1, 0, 1,
-0.7436736, 0.3432805, -0.3248934, 0.6156863, 1, 0, 1,
-0.7431436, 0.5651773, -1.649565, 0.6078432, 1, 0, 1,
-0.7407162, 0.4142874, -1.00616, 0.6039216, 1, 0, 1,
-0.737147, -0.4964474, -1.529559, 0.5960785, 1, 0, 1,
-0.7370377, -0.787419, -1.587838, 0.5882353, 1, 0, 1,
-0.7264375, 0.3711185, -1.897216, 0.5843138, 1, 0, 1,
-0.7204483, 0.003705129, -1.735728, 0.5764706, 1, 0, 1,
-0.7190512, 1.247626, 0.6116728, 0.572549, 1, 0, 1,
-0.7177891, 1.243338, 0.5535348, 0.5647059, 1, 0, 1,
-0.7156221, -1.001336, -3.76516, 0.5607843, 1, 0, 1,
-0.7117619, 0.04277294, -2.288447, 0.5529412, 1, 0, 1,
-0.7114595, 2.842968, -0.1859971, 0.5490196, 1, 0, 1,
-0.7110258, 0.6243386, -2.055206, 0.5411765, 1, 0, 1,
-0.7083662, 1.047219, -1.364786, 0.5372549, 1, 0, 1,
-0.7065576, -1.475729, -3.729441, 0.5294118, 1, 0, 1,
-0.70642, -0.89127, -3.539514, 0.5254902, 1, 0, 1,
-0.7050655, 0.9384167, 0.2087587, 0.5176471, 1, 0, 1,
-0.7041948, 0.9474872, -0.4039931, 0.5137255, 1, 0, 1,
-0.6975799, -1.850999, -4.984515, 0.5058824, 1, 0, 1,
-0.6965948, 1.53722, -0.4382404, 0.5019608, 1, 0, 1,
-0.6951621, 0.1979477, 0.9168518, 0.4941176, 1, 0, 1,
-0.6950006, 1.280604, -1.640525, 0.4862745, 1, 0, 1,
-0.6924464, -1.854343, -3.373133, 0.4823529, 1, 0, 1,
-0.6922616, 1.287263, -1.361, 0.4745098, 1, 0, 1,
-0.6911806, -0.9012887, -2.914906, 0.4705882, 1, 0, 1,
-0.6904977, -0.5719475, -0.0270157, 0.4627451, 1, 0, 1,
-0.6899315, 0.6912931, -0.9691033, 0.4588235, 1, 0, 1,
-0.6891181, 1.343689, -0.631426, 0.4509804, 1, 0, 1,
-0.6825829, 0.01588631, -2.57774, 0.4470588, 1, 0, 1,
-0.6807809, -0.6056266, -4.438699, 0.4392157, 1, 0, 1,
-0.6761386, 0.8292297, 0.04395993, 0.4352941, 1, 0, 1,
-0.6721385, 0.106318, -4.122261, 0.427451, 1, 0, 1,
-0.6707546, 0.5920036, -0.4317013, 0.4235294, 1, 0, 1,
-0.6696906, -0.1838413, -2.422029, 0.4156863, 1, 0, 1,
-0.6668133, -0.1764356, -2.496869, 0.4117647, 1, 0, 1,
-0.6629899, -0.3480665, -2.143889, 0.4039216, 1, 0, 1,
-0.6601406, -0.6189, -1.879828, 0.3960784, 1, 0, 1,
-0.6563848, -0.9177747, -1.260276, 0.3921569, 1, 0, 1,
-0.6452805, -1.298893, -2.729784, 0.3843137, 1, 0, 1,
-0.6415664, -1.595449, -2.903058, 0.3803922, 1, 0, 1,
-0.6390129, 1.667962, -0.7223544, 0.372549, 1, 0, 1,
-0.6387246, 1.194155, 0.4830339, 0.3686275, 1, 0, 1,
-0.6342087, 0.3498047, -1.99081, 0.3607843, 1, 0, 1,
-0.6329091, 1.515059, 0.8568344, 0.3568628, 1, 0, 1,
-0.6319233, 2.144817, -1.512127, 0.3490196, 1, 0, 1,
-0.6284772, -0.7951473, -1.596982, 0.345098, 1, 0, 1,
-0.6190121, -0.4755991, -1.371422, 0.3372549, 1, 0, 1,
-0.6179363, -0.1432154, -2.272446, 0.3333333, 1, 0, 1,
-0.6158423, -1.607578, -3.924545, 0.3254902, 1, 0, 1,
-0.6155806, -0.5657325, -2.943485, 0.3215686, 1, 0, 1,
-0.6151356, 0.4551698, -1.929032, 0.3137255, 1, 0, 1,
-0.6148612, -0.7697421, -2.852683, 0.3098039, 1, 0, 1,
-0.6106548, -1.692225, -4.623098, 0.3019608, 1, 0, 1,
-0.6085184, 0.2767018, -0.806996, 0.2941177, 1, 0, 1,
-0.6065628, 1.055844, 2.449351, 0.2901961, 1, 0, 1,
-0.6040134, 0.411836, -0.9281257, 0.282353, 1, 0, 1,
-0.6039331, -0.09626593, -1.524066, 0.2784314, 1, 0, 1,
-0.6022307, 1.809089, 0.09676193, 0.2705882, 1, 0, 1,
-0.6011188, -0.3530892, -1.716675, 0.2666667, 1, 0, 1,
-0.5969349, -0.01924243, -0.6534899, 0.2588235, 1, 0, 1,
-0.5960317, 0.6702195, -2.852039, 0.254902, 1, 0, 1,
-0.5785643, 0.7595775, 0.9825394, 0.2470588, 1, 0, 1,
-0.5776613, 0.7983269, -1.595085, 0.2431373, 1, 0, 1,
-0.5667061, 0.5397551, 0.04817021, 0.2352941, 1, 0, 1,
-0.5585414, 0.9970836, -2.855697, 0.2313726, 1, 0, 1,
-0.5560555, 0.4726231, -1.753666, 0.2235294, 1, 0, 1,
-0.5501395, -0.6607085, -4.161812, 0.2196078, 1, 0, 1,
-0.5438281, 0.7294432, -0.7484213, 0.2117647, 1, 0, 1,
-0.5418823, -0.2584848, -3.068183, 0.2078431, 1, 0, 1,
-0.5398721, -0.0391867, -2.084237, 0.2, 1, 0, 1,
-0.5371253, -1.107804, -1.506896, 0.1921569, 1, 0, 1,
-0.5361908, 1.051767, -0.3598031, 0.1882353, 1, 0, 1,
-0.532463, 1.837852, 0.08092477, 0.1803922, 1, 0, 1,
-0.5310094, 0.234348, -0.9425688, 0.1764706, 1, 0, 1,
-0.5303113, 0.9448147, -1.619629, 0.1686275, 1, 0, 1,
-0.530306, 0.3477777, -0.2396671, 0.1647059, 1, 0, 1,
-0.5235143, -1.776358, -2.692073, 0.1568628, 1, 0, 1,
-0.5192268, -0.9303358, -3.403431, 0.1529412, 1, 0, 1,
-0.5162128, 0.01831827, -1.44092, 0.145098, 1, 0, 1,
-0.5157525, 1.759823, -0.1077221, 0.1411765, 1, 0, 1,
-0.5152221, -0.3403642, -3.163637, 0.1333333, 1, 0, 1,
-0.5075735, -0.4003865, -2.19264, 0.1294118, 1, 0, 1,
-0.5064464, -1.155814, -3.346325, 0.1215686, 1, 0, 1,
-0.5025815, -0.07971819, -1.061005, 0.1176471, 1, 0, 1,
-0.5010931, 0.2786748, 1.538388, 0.1098039, 1, 0, 1,
-0.4981355, 0.3018902, 0.9018239, 0.1058824, 1, 0, 1,
-0.4934404, 2.091704, 0.1327367, 0.09803922, 1, 0, 1,
-0.4918987, 0.02662574, -0.8597206, 0.09019608, 1, 0, 1,
-0.4815173, -0.5480893, -0.8783821, 0.08627451, 1, 0, 1,
-0.4787391, 0.9545704, -0.7880315, 0.07843138, 1, 0, 1,
-0.4786079, -0.6900678, -1.131886, 0.07450981, 1, 0, 1,
-0.4755897, 0.6448363, -0.6178972, 0.06666667, 1, 0, 1,
-0.4707967, 0.9855638, -0.6433733, 0.0627451, 1, 0, 1,
-0.4619669, -0.08784949, -0.5316694, 0.05490196, 1, 0, 1,
-0.4619287, 0.8286989, 0.2322422, 0.05098039, 1, 0, 1,
-0.4601888, 0.9662118, -0.8914633, 0.04313726, 1, 0, 1,
-0.459718, -0.08449525, -1.386458, 0.03921569, 1, 0, 1,
-0.4553682, 0.6115476, 0.9914651, 0.03137255, 1, 0, 1,
-0.4539788, 0.7451763, 0.8270453, 0.02745098, 1, 0, 1,
-0.4528913, -0.3952325, -3.218852, 0.01960784, 1, 0, 1,
-0.4513855, 0.5993436, -1.177881, 0.01568628, 1, 0, 1,
-0.4507201, -1.019462, -2.341795, 0.007843138, 1, 0, 1,
-0.4503417, 2.44371, 0.7324393, 0.003921569, 1, 0, 1,
-0.4500305, 1.018934, -1.826205, 0, 1, 0.003921569, 1,
-0.4477436, -0.4618351, -2.308039, 0, 1, 0.01176471, 1,
-0.4375483, 0.2987433, -0.7125679, 0, 1, 0.01568628, 1,
-0.4373425, 1.503701, 0.6223506, 0, 1, 0.02352941, 1,
-0.4304855, 0.2849785, -0.5659094, 0, 1, 0.02745098, 1,
-0.4302996, -0.744972, -3.319481, 0, 1, 0.03529412, 1,
-0.4252076, 0.260996, 0.03364269, 0, 1, 0.03921569, 1,
-0.4249156, 0.2354813, 0.2507606, 0, 1, 0.04705882, 1,
-0.4248722, 1.166368, 1.198387, 0, 1, 0.05098039, 1,
-0.4198171, -1.339214, -3.664715, 0, 1, 0.05882353, 1,
-0.419691, 0.00755054, -0.2672821, 0, 1, 0.0627451, 1,
-0.4098145, 1.524023, 1.494038, 0, 1, 0.07058824, 1,
-0.4082638, 1.004422, -1.046442, 0, 1, 0.07450981, 1,
-0.4076465, -0.0736177, -1.59967, 0, 1, 0.08235294, 1,
-0.4035718, 0.06145424, 0.3148033, 0, 1, 0.08627451, 1,
-0.4023846, -0.793516, -3.06321, 0, 1, 0.09411765, 1,
-0.397717, -0.06421288, -1.939314, 0, 1, 0.1019608, 1,
-0.3967123, -0.8224729, -1.837678, 0, 1, 0.1058824, 1,
-0.3916852, -1.124106, -2.7307, 0, 1, 0.1137255, 1,
-0.3916622, -1.077624, -3.77313, 0, 1, 0.1176471, 1,
-0.3906737, -0.2628269, -2.233546, 0, 1, 0.1254902, 1,
-0.389504, -0.6703385, -3.822545, 0, 1, 0.1294118, 1,
-0.389235, -0.1312012, -3.009391, 0, 1, 0.1372549, 1,
-0.3851455, -1.352277, -3.826647, 0, 1, 0.1411765, 1,
-0.3789065, -1.575001, -1.336357, 0, 1, 0.1490196, 1,
-0.3771367, -1.395339, -4.040523, 0, 1, 0.1529412, 1,
-0.3740732, -0.1491045, -2.040319, 0, 1, 0.1607843, 1,
-0.3740569, 0.05146786, -1.890118, 0, 1, 0.1647059, 1,
-0.3723488, 0.09673377, -0.09069951, 0, 1, 0.172549, 1,
-0.3721493, -0.172702, -2.270085, 0, 1, 0.1764706, 1,
-0.3710965, 1.257324, 0.3374102, 0, 1, 0.1843137, 1,
-0.361153, -0.1905013, -2.039355, 0, 1, 0.1882353, 1,
-0.3575389, -1.577737, -4.665743, 0, 1, 0.1960784, 1,
-0.3554155, -1.233907, -3.507307, 0, 1, 0.2039216, 1,
-0.3475974, -0.09379368, -2.14952, 0, 1, 0.2078431, 1,
-0.3462148, 0.6032531, -0.04109633, 0, 1, 0.2156863, 1,
-0.3424559, 1.065493, -0.9475011, 0, 1, 0.2196078, 1,
-0.3421406, -0.5407355, -1.70564, 0, 1, 0.227451, 1,
-0.341175, -0.1633887, -0.9623314, 0, 1, 0.2313726, 1,
-0.3410948, 1.585934, -1.470869, 0, 1, 0.2392157, 1,
-0.3400348, -2.793324, -1.063402, 0, 1, 0.2431373, 1,
-0.3398911, -0.9317145, -1.44239, 0, 1, 0.2509804, 1,
-0.33946, -1.618857, -4.23735, 0, 1, 0.254902, 1,
-0.3312377, 0.2430727, -0.9719942, 0, 1, 0.2627451, 1,
-0.3268926, 0.3643281, 0.3353361, 0, 1, 0.2666667, 1,
-0.3197708, 0.2860889, -1.299844, 0, 1, 0.2745098, 1,
-0.3161016, -0.2608378, -2.268594, 0, 1, 0.2784314, 1,
-0.3148976, 0.2542845, -1.969728, 0, 1, 0.2862745, 1,
-0.3108004, 0.4900801, -0.7656583, 0, 1, 0.2901961, 1,
-0.2983373, -0.8859916, -1.349759, 0, 1, 0.2980392, 1,
-0.2932847, 0.3198504, -0.9367803, 0, 1, 0.3058824, 1,
-0.2887349, -0.1646204, -2.948753, 0, 1, 0.3098039, 1,
-0.2884664, 1.004578, 0.5976462, 0, 1, 0.3176471, 1,
-0.2869692, 0.2472973, -1.541289, 0, 1, 0.3215686, 1,
-0.2838993, 0.794077, 0.5309069, 0, 1, 0.3294118, 1,
-0.2832886, -1.315142, -5.094364, 0, 1, 0.3333333, 1,
-0.2824495, -0.1090951, -1.680338, 0, 1, 0.3411765, 1,
-0.2817188, 0.9780661, -0.2981059, 0, 1, 0.345098, 1,
-0.2793557, 1.193473, -1.168294, 0, 1, 0.3529412, 1,
-0.2793494, 0.1498805, -0.9869986, 0, 1, 0.3568628, 1,
-0.2741371, 0.9926506, 0.8751929, 0, 1, 0.3647059, 1,
-0.2733091, -1.394877, -3.696452, 0, 1, 0.3686275, 1,
-0.2653586, -1.045876, -2.535442, 0, 1, 0.3764706, 1,
-0.2618567, 2.158534, 0.4236488, 0, 1, 0.3803922, 1,
-0.2574889, -0.7477343, -3.029438, 0, 1, 0.3882353, 1,
-0.2572731, 0.5179653, -1.094795, 0, 1, 0.3921569, 1,
-0.256114, 0.1895416, -0.6670557, 0, 1, 0.4, 1,
-0.2560668, -0.4379694, -2.71859, 0, 1, 0.4078431, 1,
-0.252208, -2.305842, -4.387008, 0, 1, 0.4117647, 1,
-0.2465894, -0.4610166, -2.299552, 0, 1, 0.4196078, 1,
-0.2448696, -0.01176258, -0.7551246, 0, 1, 0.4235294, 1,
-0.2443174, -0.5786583, -1.016173, 0, 1, 0.4313726, 1,
-0.2441141, -0.3114015, -2.52337, 0, 1, 0.4352941, 1,
-0.242449, 1.61742, 0.6412687, 0, 1, 0.4431373, 1,
-0.2412279, 1.874739, 0.9509308, 0, 1, 0.4470588, 1,
-0.2361502, 0.4924142, -1.106884, 0, 1, 0.454902, 1,
-0.2360686, -0.2651367, -2.936729, 0, 1, 0.4588235, 1,
-0.2359563, -0.3351038, -4.405059, 0, 1, 0.4666667, 1,
-0.2359269, 0.6547394, 0.4288529, 0, 1, 0.4705882, 1,
-0.2354514, 0.368594, 0.7141856, 0, 1, 0.4784314, 1,
-0.2320524, 0.8082992, -1.00347, 0, 1, 0.4823529, 1,
-0.2300659, -0.3291774, -2.161846, 0, 1, 0.4901961, 1,
-0.2294803, -1.399271, -2.848022, 0, 1, 0.4941176, 1,
-0.227307, -0.5025209, -3.174958, 0, 1, 0.5019608, 1,
-0.2267502, 1.865244, -0.9230446, 0, 1, 0.509804, 1,
-0.2251642, 0.3915903, -0.4198956, 0, 1, 0.5137255, 1,
-0.2154178, -0.4333987, -3.637183, 0, 1, 0.5215687, 1,
-0.213087, -0.5123815, -2.679816, 0, 1, 0.5254902, 1,
-0.2116684, 0.988226, -1.881939, 0, 1, 0.5333334, 1,
-0.209714, 1.11242, 2.101795, 0, 1, 0.5372549, 1,
-0.2092878, -1.883259, -4.093809, 0, 1, 0.5450981, 1,
-0.2084702, 0.6383356, -0.4291872, 0, 1, 0.5490196, 1,
-0.2058856, -0.3759592, -2.597527, 0, 1, 0.5568628, 1,
-0.1977377, 1.285662, 1.976723, 0, 1, 0.5607843, 1,
-0.1937147, -1.14628, -2.561197, 0, 1, 0.5686275, 1,
-0.1910396, -1.037346, -1.936367, 0, 1, 0.572549, 1,
-0.1909897, 0.5175252, -0.5104303, 0, 1, 0.5803922, 1,
-0.1904166, -1.509017, -3.199859, 0, 1, 0.5843138, 1,
-0.1896273, -1.348294, -1.358351, 0, 1, 0.5921569, 1,
-0.1876701, 0.1885229, 0.7226551, 0, 1, 0.5960785, 1,
-0.1860011, -1.404487, -2.307655, 0, 1, 0.6039216, 1,
-0.1833495, -0.5216947, -4.177053, 0, 1, 0.6117647, 1,
-0.1824982, 0.4743018, -1.536595, 0, 1, 0.6156863, 1,
-0.1776356, -1.478742, -2.273737, 0, 1, 0.6235294, 1,
-0.1752919, -1.352927, -2.968742, 0, 1, 0.627451, 1,
-0.1730181, -1.128719, -1.66176, 0, 1, 0.6352941, 1,
-0.1704335, 1.494423, -0.6585186, 0, 1, 0.6392157, 1,
-0.1691413, -0.1030073, -1.389209, 0, 1, 0.6470588, 1,
-0.1676015, -1.439286, -1.152891, 0, 1, 0.6509804, 1,
-0.157342, 0.7463463, 0.2791322, 0, 1, 0.6588235, 1,
-0.1548014, 1.217333, 0.825103, 0, 1, 0.6627451, 1,
-0.1540303, 1.626831, 1.211332, 0, 1, 0.6705883, 1,
-0.1532765, 0.6697602, -0.6266597, 0, 1, 0.6745098, 1,
-0.1471706, 0.8312632, -0.5208341, 0, 1, 0.682353, 1,
-0.146758, 1.331745, 0.5736638, 0, 1, 0.6862745, 1,
-0.144591, 1.741498, 1.765525, 0, 1, 0.6941177, 1,
-0.1408522, -0.9189955, -1.585263, 0, 1, 0.7019608, 1,
-0.1366685, -1.337559, -2.461301, 0, 1, 0.7058824, 1,
-0.1352642, 0.3811725, -1.16736, 0, 1, 0.7137255, 1,
-0.1335712, 0.1744694, -0.9297298, 0, 1, 0.7176471, 1,
-0.1324688, 0.5631586, 0.1569366, 0, 1, 0.7254902, 1,
-0.131914, -0.6651109, -2.328074, 0, 1, 0.7294118, 1,
-0.1305742, 1.438426, -0.1031628, 0, 1, 0.7372549, 1,
-0.1224247, 0.8634647, -1.761761, 0, 1, 0.7411765, 1,
-0.1192729, -0.1763378, -2.859874, 0, 1, 0.7490196, 1,
-0.1178987, 0.7513008, 0.3016585, 0, 1, 0.7529412, 1,
-0.1172503, -0.5826178, -3.013583, 0, 1, 0.7607843, 1,
-0.1172156, -0.193345, -2.650754, 0, 1, 0.7647059, 1,
-0.1128257, -0.3275455, -0.952727, 0, 1, 0.772549, 1,
-0.1060936, 0.6308155, 0.03453385, 0, 1, 0.7764706, 1,
-0.1024497, 0.1550943, -0.4017923, 0, 1, 0.7843137, 1,
-0.09862514, -2.095063, -3.606487, 0, 1, 0.7882353, 1,
-0.09862138, -0.6795757, -2.392577, 0, 1, 0.7960784, 1,
-0.09807284, -0.02447625, -2.383904, 0, 1, 0.8039216, 1,
-0.09417619, -1.227901, -4.035172, 0, 1, 0.8078431, 1,
-0.09341268, 0.1192057, 1.114347, 0, 1, 0.8156863, 1,
-0.08968711, 1.261991, -0.9139391, 0, 1, 0.8196079, 1,
-0.08680187, 0.01455525, -0.8718879, 0, 1, 0.827451, 1,
-0.08012572, 0.642503, 1.045307, 0, 1, 0.8313726, 1,
-0.07849747, 2.100274, -0.9896839, 0, 1, 0.8392157, 1,
-0.07261743, 1.010348, -0.4381779, 0, 1, 0.8431373, 1,
-0.07125771, -1.621709, -3.53607, 0, 1, 0.8509804, 1,
-0.07094583, 0.1043363, -0.04652219, 0, 1, 0.854902, 1,
-0.06736247, -0.2356766, -2.768826, 0, 1, 0.8627451, 1,
-0.06729854, -0.2897869, -4.189588, 0, 1, 0.8666667, 1,
-0.06500012, -1.220168, -3.367229, 0, 1, 0.8745098, 1,
-0.06052383, 0.865726, -0.6285701, 0, 1, 0.8784314, 1,
-0.05971506, -0.01881527, -1.718568, 0, 1, 0.8862745, 1,
-0.05059856, -0.002722202, -2.648985, 0, 1, 0.8901961, 1,
-0.0504226, -0.06472254, -3.22187, 0, 1, 0.8980392, 1,
-0.04905665, -1.77564, -2.643294, 0, 1, 0.9058824, 1,
-0.04742647, -0.385669, -2.032015, 0, 1, 0.9098039, 1,
-0.04021538, 0.7113726, -0.7999744, 0, 1, 0.9176471, 1,
-0.03706448, 0.9600789, -0.5732082, 0, 1, 0.9215686, 1,
-0.03644684, -1.542728, -4.872485, 0, 1, 0.9294118, 1,
-0.03610599, 0.2333824, 0.5587255, 0, 1, 0.9333333, 1,
-0.03560444, -0.6915804, -3.734578, 0, 1, 0.9411765, 1,
-0.03511377, -0.5386864, -4.213133, 0, 1, 0.945098, 1,
-0.03303004, -0.7018661, -2.842463, 0, 1, 0.9529412, 1,
-0.03251538, -1.466546, -0.7556131, 0, 1, 0.9568627, 1,
-0.03068327, 0.2616692, -0.1099245, 0, 1, 0.9647059, 1,
-0.03039579, 0.9262003, 0.8829552, 0, 1, 0.9686275, 1,
-0.02680492, 1.186938, -0.8502947, 0, 1, 0.9764706, 1,
-0.02471779, -0.2164598, -3.59631, 0, 1, 0.9803922, 1,
-0.01682645, 0.9937306, -0.8795888, 0, 1, 0.9882353, 1,
-0.015513, -1.969434, -4.59374, 0, 1, 0.9921569, 1,
-0.01297588, 0.1571025, 0.8296368, 0, 1, 1, 1,
-0.01235054, 0.9579789, 0.1884302, 0, 0.9921569, 1, 1,
-0.007110812, 1.314731, 1.963466, 0, 0.9882353, 1, 1,
-0.005199139, -0.6305314, -4.891991, 0, 0.9803922, 1, 1,
-0.001342499, 1.894085, 1.640631, 0, 0.9764706, 1, 1,
0.001368084, 0.1510143, -0.01566386, 0, 0.9686275, 1, 1,
0.01342773, -0.1889366, 3.036562, 0, 0.9647059, 1, 1,
0.01609502, 0.8441545, -0.9177731, 0, 0.9568627, 1, 1,
0.01917883, -1.725995, 1.593582, 0, 0.9529412, 1, 1,
0.02702938, 1.982312, 0.2166005, 0, 0.945098, 1, 1,
0.03254049, 1.194097, -1.328457, 0, 0.9411765, 1, 1,
0.03429125, -1.051658, 2.627912, 0, 0.9333333, 1, 1,
0.03788487, -0.1175257, 0.8224072, 0, 0.9294118, 1, 1,
0.04153454, 1.0066, 1.367826, 0, 0.9215686, 1, 1,
0.04669922, 1.429571, 1.27609, 0, 0.9176471, 1, 1,
0.0482025, 0.7133299, 0.6552128, 0, 0.9098039, 1, 1,
0.04916557, -0.1766337, 3.294519, 0, 0.9058824, 1, 1,
0.04921986, 0.451946, -1.385832, 0, 0.8980392, 1, 1,
0.05119425, -0.05968028, -0.07671437, 0, 0.8901961, 1, 1,
0.05740784, 1.951429, 1.279539, 0, 0.8862745, 1, 1,
0.05759092, -0.2738827, 2.832757, 0, 0.8784314, 1, 1,
0.05925111, -1.027485, 4.399016, 0, 0.8745098, 1, 1,
0.06088508, -0.509776, 1.411377, 0, 0.8666667, 1, 1,
0.06589327, 0.5865164, 1.255005, 0, 0.8627451, 1, 1,
0.06655628, 0.8094269, -0.5293103, 0, 0.854902, 1, 1,
0.06835945, -0.5118241, 3.412433, 0, 0.8509804, 1, 1,
0.07720135, 0.4877465, -1.173379, 0, 0.8431373, 1, 1,
0.07773599, 0.5142431, 0.6449116, 0, 0.8392157, 1, 1,
0.0815834, 1.753061, 0.2097477, 0, 0.8313726, 1, 1,
0.08323058, 0.8903455, 1.399586, 0, 0.827451, 1, 1,
0.08482171, 0.1851277, 0.6923987, 0, 0.8196079, 1, 1,
0.08786278, -0.792214, 1.87161, 0, 0.8156863, 1, 1,
0.0889855, -0.5069814, 1.7883, 0, 0.8078431, 1, 1,
0.08920546, -0.9104628, 3.276501, 0, 0.8039216, 1, 1,
0.09282004, 0.5762423, 1.226721, 0, 0.7960784, 1, 1,
0.09474435, -0.797619, 3.351299, 0, 0.7882353, 1, 1,
0.09734086, 1.029389, -1.103545, 0, 0.7843137, 1, 1,
0.1050603, -0.09681006, 1.076793, 0, 0.7764706, 1, 1,
0.1072085, 1.487842, -0.5138917, 0, 0.772549, 1, 1,
0.1078042, -0.6762688, 4.437211, 0, 0.7647059, 1, 1,
0.1079326, -0.5489813, 1.463163, 0, 0.7607843, 1, 1,
0.1082215, 0.9227409, 0.5499337, 0, 0.7529412, 1, 1,
0.1123322, 1.803196, 1.051611, 0, 0.7490196, 1, 1,
0.1136012, -0.8561178, 3.802075, 0, 0.7411765, 1, 1,
0.1146008, -0.5849686, 2.503412, 0, 0.7372549, 1, 1,
0.116117, -0.3213205, 1.6546, 0, 0.7294118, 1, 1,
0.1184062, 0.7508288, -1.185238, 0, 0.7254902, 1, 1,
0.1198842, -0.8699581, 2.36238, 0, 0.7176471, 1, 1,
0.1245159, -1.102743, 2.631046, 0, 0.7137255, 1, 1,
0.1286946, -1.290526, 4.148372, 0, 0.7058824, 1, 1,
0.1289735, 0.5257919, 0.5068893, 0, 0.6980392, 1, 1,
0.1320604, -0.1017026, 3.784604, 0, 0.6941177, 1, 1,
0.1323017, 0.2860567, 1.309394, 0, 0.6862745, 1, 1,
0.1371846, -0.08886815, 2.702637, 0, 0.682353, 1, 1,
0.1374944, -0.6868146, 2.345328, 0, 0.6745098, 1, 1,
0.1422502, 1.220321, 0.02038294, 0, 0.6705883, 1, 1,
0.1429342, -0.4668137, 2.243029, 0, 0.6627451, 1, 1,
0.1459518, -0.3748585, 3.069243, 0, 0.6588235, 1, 1,
0.1489857, -1.277352, 2.787158, 0, 0.6509804, 1, 1,
0.148998, -1.001555, 2.327918, 0, 0.6470588, 1, 1,
0.1514341, -0.7772793, 2.341204, 0, 0.6392157, 1, 1,
0.1562216, 0.07435676, 3.930247, 0, 0.6352941, 1, 1,
0.1628119, -2.820984, 3.083281, 0, 0.627451, 1, 1,
0.1631331, -0.7482936, 3.050647, 0, 0.6235294, 1, 1,
0.164848, 0.6992927, 0.1052642, 0, 0.6156863, 1, 1,
0.1677999, 0.8141868, -0.4682975, 0, 0.6117647, 1, 1,
0.1690245, -0.2556408, 3.860085, 0, 0.6039216, 1, 1,
0.1701944, 0.01704342, 0.8964515, 0, 0.5960785, 1, 1,
0.1705982, -0.5780393, 2.698002, 0, 0.5921569, 1, 1,
0.1707955, 0.2813939, 1.095966, 0, 0.5843138, 1, 1,
0.1722317, 2.126823, 1.001918, 0, 0.5803922, 1, 1,
0.1781298, 0.7680827, -1.427273, 0, 0.572549, 1, 1,
0.1783171, -1.16056, 1.767608, 0, 0.5686275, 1, 1,
0.1842935, -0.3210401, 2.263866, 0, 0.5607843, 1, 1,
0.1870181, -0.7426841, 1.62699, 0, 0.5568628, 1, 1,
0.1887742, -0.5673918, 2.96228, 0, 0.5490196, 1, 1,
0.1892404, 2.192385, -1.468381, 0, 0.5450981, 1, 1,
0.1896987, -0.6891045, 3.032002, 0, 0.5372549, 1, 1,
0.1905715, 0.8170476, -1.10599, 0, 0.5333334, 1, 1,
0.1935192, 0.1752418, 1.006067, 0, 0.5254902, 1, 1,
0.1973765, 1.377818, 1.570508, 0, 0.5215687, 1, 1,
0.199819, -0.589655, 4.208535, 0, 0.5137255, 1, 1,
0.2037145, 0.5512169, -1.963522, 0, 0.509804, 1, 1,
0.2050923, -1.176817, 1.76874, 0, 0.5019608, 1, 1,
0.2094991, -0.7651057, 3.525361, 0, 0.4941176, 1, 1,
0.2104002, 1.252775, 0.02621884, 0, 0.4901961, 1, 1,
0.2195005, 0.1531254, -0.4167022, 0, 0.4823529, 1, 1,
0.2211709, 1.667765, -0.999049, 0, 0.4784314, 1, 1,
0.221448, 0.4515297, -0.2641624, 0, 0.4705882, 1, 1,
0.2256734, 1.099037, 0.9487971, 0, 0.4666667, 1, 1,
0.2282115, -0.909299, 1.852353, 0, 0.4588235, 1, 1,
0.2349341, 0.4180792, 0.7290496, 0, 0.454902, 1, 1,
0.238247, -0.06758773, 2.061945, 0, 0.4470588, 1, 1,
0.2385511, -0.8982732, -0.07445914, 0, 0.4431373, 1, 1,
0.2416456, 1.089733, 0.2658291, 0, 0.4352941, 1, 1,
0.2424728, -0.9431244, 3.466765, 0, 0.4313726, 1, 1,
0.2454737, -0.8182827, 2.217875, 0, 0.4235294, 1, 1,
0.2468979, -1.503781, 3.516703, 0, 0.4196078, 1, 1,
0.2494751, 1.165574, -1.345202, 0, 0.4117647, 1, 1,
0.2518115, 0.04154359, 1.935563, 0, 0.4078431, 1, 1,
0.2533201, -0.1728784, 4.689546, 0, 0.4, 1, 1,
0.2540306, -0.1954706, 2.156154, 0, 0.3921569, 1, 1,
0.2543093, 0.7119598, 1.483118, 0, 0.3882353, 1, 1,
0.2582265, -1.693794, 3.425074, 0, 0.3803922, 1, 1,
0.2629428, 1.062356, 1.403385, 0, 0.3764706, 1, 1,
0.2633897, -1.674209, 3.153517, 0, 0.3686275, 1, 1,
0.2634248, -0.5258105, 4.162208, 0, 0.3647059, 1, 1,
0.2641408, 0.8614594, 0.4796195, 0, 0.3568628, 1, 1,
0.266183, -0.8665591, 2.916535, 0, 0.3529412, 1, 1,
0.2683401, 0.6387582, 0.2621193, 0, 0.345098, 1, 1,
0.2691449, -1.480012, 2.369175, 0, 0.3411765, 1, 1,
0.2738567, 1.179159, 0.09820899, 0, 0.3333333, 1, 1,
0.2752192, -0.8968226, 2.55293, 0, 0.3294118, 1, 1,
0.2759452, -0.1765973, 2.250731, 0, 0.3215686, 1, 1,
0.2820516, 1.453902, 1.77206, 0, 0.3176471, 1, 1,
0.2905954, -0.1198875, 2.0917, 0, 0.3098039, 1, 1,
0.2945523, 0.1015956, 0.6110287, 0, 0.3058824, 1, 1,
0.2949789, -0.8674846, 3.38177, 0, 0.2980392, 1, 1,
0.2984619, -1.832055, 3.071952, 0, 0.2901961, 1, 1,
0.3032107, -0.7996095, 3.026891, 0, 0.2862745, 1, 1,
0.3037628, -1.365322, 2.401564, 0, 0.2784314, 1, 1,
0.3088345, 0.4591568, 1.115853, 0, 0.2745098, 1, 1,
0.3105439, 0.4229746, 1.07873, 0, 0.2666667, 1, 1,
0.3105605, -1.529281, 2.992983, 0, 0.2627451, 1, 1,
0.3131364, -1.176329, 3.421515, 0, 0.254902, 1, 1,
0.3155305, 1.006951, 0.6936859, 0, 0.2509804, 1, 1,
0.3157457, -0.5557685, 2.096664, 0, 0.2431373, 1, 1,
0.3161463, 0.9894766, -0.9780164, 0, 0.2392157, 1, 1,
0.3199229, 0.4064364, 2.765041, 0, 0.2313726, 1, 1,
0.3199387, 0.6271174, 0.581079, 0, 0.227451, 1, 1,
0.3326049, -0.5862907, 2.893412, 0, 0.2196078, 1, 1,
0.3351872, -0.735263, 0.8574839, 0, 0.2156863, 1, 1,
0.3367728, 0.9297717, 1.010633, 0, 0.2078431, 1, 1,
0.3454891, -0.2161708, 2.074045, 0, 0.2039216, 1, 1,
0.3479391, 1.341651, -0.720961, 0, 0.1960784, 1, 1,
0.3486913, -0.3781959, 3.502342, 0, 0.1882353, 1, 1,
0.3491133, 1.372899, 0.3517556, 0, 0.1843137, 1, 1,
0.3495212, 0.06527597, 1.36324, 0, 0.1764706, 1, 1,
0.3506864, 0.1163616, 2.005778, 0, 0.172549, 1, 1,
0.3546254, 0.04720174, -0.1387887, 0, 0.1647059, 1, 1,
0.3586943, -0.8471209, 2.862119, 0, 0.1607843, 1, 1,
0.3615419, 0.3509297, 0.4747064, 0, 0.1529412, 1, 1,
0.3633074, 0.5969483, 0.5475997, 0, 0.1490196, 1, 1,
0.3638579, 0.6302034, 1.02553, 0, 0.1411765, 1, 1,
0.3704391, 1.150937, 1.036999, 0, 0.1372549, 1, 1,
0.3709106, 1.127297, 0.2518161, 0, 0.1294118, 1, 1,
0.3715118, 0.2054551, 1.31331, 0, 0.1254902, 1, 1,
0.3730314, -0.4770154, 2.206254, 0, 0.1176471, 1, 1,
0.3739425, -0.08313639, 1.626048, 0, 0.1137255, 1, 1,
0.3740414, 1.960243, -0.2136409, 0, 0.1058824, 1, 1,
0.3748948, -1.290217, 3.904307, 0, 0.09803922, 1, 1,
0.3772032, -2.076333, 2.292113, 0, 0.09411765, 1, 1,
0.3825769, -0.6897684, 2.906757, 0, 0.08627451, 1, 1,
0.3830788, -1.40581, 5.222372, 0, 0.08235294, 1, 1,
0.3839423, 0.802183, 0.3251502, 0, 0.07450981, 1, 1,
0.3853699, -2.950021, 2.572029, 0, 0.07058824, 1, 1,
0.3875331, 0.5705124, 0.9710894, 0, 0.0627451, 1, 1,
0.3908514, 1.623064, -2.299809, 0, 0.05882353, 1, 1,
0.3974228, 0.4660283, 1.921515, 0, 0.05098039, 1, 1,
0.3999796, -1.375228, 3.416957, 0, 0.04705882, 1, 1,
0.4066526, 1.23946, 0.3025202, 0, 0.03921569, 1, 1,
0.4080141, -0.5584963, 4.437605, 0, 0.03529412, 1, 1,
0.4132429, 0.1978527, 1.706814, 0, 0.02745098, 1, 1,
0.4133125, 0.2699728, 0.891875, 0, 0.02352941, 1, 1,
0.4181323, 0.5213487, 0.6810787, 0, 0.01568628, 1, 1,
0.4193232, 0.8572416, 2.393889, 0, 0.01176471, 1, 1,
0.4204417, -1.620404, 1.557656, 0, 0.003921569, 1, 1,
0.4231836, 0.4428221, -0.2126957, 0.003921569, 0, 1, 1,
0.4239211, -0.7696313, 0.8733994, 0.007843138, 0, 1, 1,
0.4253147, -0.2455416, 3.754865, 0.01568628, 0, 1, 1,
0.425576, 1.423492, 0.6315788, 0.01960784, 0, 1, 1,
0.4343131, 1.184892, 0.2615272, 0.02745098, 0, 1, 1,
0.4353579, 0.03399915, 0.3936653, 0.03137255, 0, 1, 1,
0.4381354, 1.121533, 1.056591, 0.03921569, 0, 1, 1,
0.4410105, -0.4974022, 3.304822, 0.04313726, 0, 1, 1,
0.4435786, 0.3801402, -1.034316, 0.05098039, 0, 1, 1,
0.4492842, -0.5195827, 3.147774, 0.05490196, 0, 1, 1,
0.4531555, 0.8402736, -0.5118773, 0.0627451, 0, 1, 1,
0.4531658, -1.091964, 3.215522, 0.06666667, 0, 1, 1,
0.4534949, -1.497895, 1.577647, 0.07450981, 0, 1, 1,
0.4537154, -0.0002428627, 1.221616, 0.07843138, 0, 1, 1,
0.456307, 0.1954382, -0.5093175, 0.08627451, 0, 1, 1,
0.4625973, -1.130906, 3.088886, 0.09019608, 0, 1, 1,
0.463765, 1.37433, 0.8563419, 0.09803922, 0, 1, 1,
0.4649584, -0.4816268, 0.7797871, 0.1058824, 0, 1, 1,
0.4725654, 0.1642985, 1.05215, 0.1098039, 0, 1, 1,
0.4790503, 0.408238, -0.04511472, 0.1176471, 0, 1, 1,
0.479407, -1.12765, 3.672063, 0.1215686, 0, 1, 1,
0.4827338, 0.9247699, -0.2105886, 0.1294118, 0, 1, 1,
0.4832202, 0.6631667, -1.280221, 0.1333333, 0, 1, 1,
0.4847771, -1.074257, 2.30918, 0.1411765, 0, 1, 1,
0.4865616, 1.205687, 0.3892364, 0.145098, 0, 1, 1,
0.4881617, -1.759059, 2.204126, 0.1529412, 0, 1, 1,
0.4882548, 1.663751, 1.215784, 0.1568628, 0, 1, 1,
0.4903738, 1.840626, 0.806218, 0.1647059, 0, 1, 1,
0.4905144, -0.4886462, 3.769128, 0.1686275, 0, 1, 1,
0.4918444, 1.18173, -0.2307243, 0.1764706, 0, 1, 1,
0.4918616, 0.7812743, -2.018139e-05, 0.1803922, 0, 1, 1,
0.4936037, -0.4090348, 2.019841, 0.1882353, 0, 1, 1,
0.5013196, 0.3062063, -0.03241313, 0.1921569, 0, 1, 1,
0.5078182, -1.192507, 2.142269, 0.2, 0, 1, 1,
0.50982, -0.0723176, 0.1427449, 0.2078431, 0, 1, 1,
0.511378, -0.4458104, 2.627853, 0.2117647, 0, 1, 1,
0.5131323, -1.748156, 2.429132, 0.2196078, 0, 1, 1,
0.5159386, 0.2869393, 2.551675, 0.2235294, 0, 1, 1,
0.5186878, 0.6535473, 2.150566, 0.2313726, 0, 1, 1,
0.5203961, -0.2805478, 2.193541, 0.2352941, 0, 1, 1,
0.5226162, 0.9979537, -0.08545787, 0.2431373, 0, 1, 1,
0.5257062, 0.8079819, 1.25915, 0.2470588, 0, 1, 1,
0.5290743, -0.355881, 3.33434, 0.254902, 0, 1, 1,
0.5319779, -0.1938645, 2.413798, 0.2588235, 0, 1, 1,
0.5355249, 0.4043648, 1.093097, 0.2666667, 0, 1, 1,
0.5462694, 0.591124, 0.3540117, 0.2705882, 0, 1, 1,
0.5463678, -0.007182758, 0.8823701, 0.2784314, 0, 1, 1,
0.5485293, 0.4586622, 0.1753611, 0.282353, 0, 1, 1,
0.5517309, 0.9228392, 1.473867, 0.2901961, 0, 1, 1,
0.554215, 0.7648501, 2.478251, 0.2941177, 0, 1, 1,
0.5590088, 0.4527577, 1.256528, 0.3019608, 0, 1, 1,
0.5603763, -2.054054, 2.355455, 0.3098039, 0, 1, 1,
0.5608685, -0.007752119, 2.62148, 0.3137255, 0, 1, 1,
0.5644561, 0.3648356, -0.0123713, 0.3215686, 0, 1, 1,
0.5673954, 1.791913, -0.5232269, 0.3254902, 0, 1, 1,
0.567872, -0.8845141, 2.848802, 0.3333333, 0, 1, 1,
0.5686274, 0.7490441, 0.1963907, 0.3372549, 0, 1, 1,
0.575738, -0.6874345, 3.453365, 0.345098, 0, 1, 1,
0.5807589, 0.1651273, -0.06654411, 0.3490196, 0, 1, 1,
0.5867688, -0.4455678, 3.09623, 0.3568628, 0, 1, 1,
0.5948647, -0.184928, 2.675228, 0.3607843, 0, 1, 1,
0.5970854, -0.8182652, 2.131888, 0.3686275, 0, 1, 1,
0.5992904, -0.02549142, 0.02629362, 0.372549, 0, 1, 1,
0.6025513, -0.3630497, 1.332369, 0.3803922, 0, 1, 1,
0.6055287, -1.342274, 2.957003, 0.3843137, 0, 1, 1,
0.6078505, -0.7987469, 1.981383, 0.3921569, 0, 1, 1,
0.6145129, -2.060365, 2.218932, 0.3960784, 0, 1, 1,
0.6198263, 0.8926001, 0.6774437, 0.4039216, 0, 1, 1,
0.6225541, 0.7582668, 1.293942, 0.4117647, 0, 1, 1,
0.6249287, -1.535987, 3.552813, 0.4156863, 0, 1, 1,
0.6263946, 0.477986, 2.55823, 0.4235294, 0, 1, 1,
0.6272398, -0.6034043, 3.186464, 0.427451, 0, 1, 1,
0.6348291, 0.2203953, 0.8969188, 0.4352941, 0, 1, 1,
0.640236, -0.06573016, 0.9990212, 0.4392157, 0, 1, 1,
0.6473845, -2.046427, 2.527038, 0.4470588, 0, 1, 1,
0.6495218, -1.221445, 4.447067, 0.4509804, 0, 1, 1,
0.6514474, -1.196357, 2.071754, 0.4588235, 0, 1, 1,
0.6514558, 1.294771, 2.136634, 0.4627451, 0, 1, 1,
0.6529809, -0.5907611, 0.6350422, 0.4705882, 0, 1, 1,
0.6548778, 0.5748796, -0.59896, 0.4745098, 0, 1, 1,
0.6620955, -0.1183552, 1.916714, 0.4823529, 0, 1, 1,
0.6640822, 2.269371, 1.173012, 0.4862745, 0, 1, 1,
0.6651119, -0.7388037, 2.327853, 0.4941176, 0, 1, 1,
0.6742865, 0.175893, 2.158325, 0.5019608, 0, 1, 1,
0.6758911, -0.6053839, 2.015414, 0.5058824, 0, 1, 1,
0.6760704, 0.6409668, 0.1455619, 0.5137255, 0, 1, 1,
0.6769104, -1.050644, 2.242187, 0.5176471, 0, 1, 1,
0.6780096, 0.1562028, 2.266387, 0.5254902, 0, 1, 1,
0.6789717, -1.265236, 1.850322, 0.5294118, 0, 1, 1,
0.6815554, 0.6918705, 0.7797762, 0.5372549, 0, 1, 1,
0.6821727, -1.76362, 5.138347, 0.5411765, 0, 1, 1,
0.6823297, 0.1723266, 0.5245529, 0.5490196, 0, 1, 1,
0.6876023, 1.846782, -1.341858, 0.5529412, 0, 1, 1,
0.6884375, -0.2650244, 2.543089, 0.5607843, 0, 1, 1,
0.6909462, -0.3991764, 2.078152, 0.5647059, 0, 1, 1,
0.6952507, 0.5139329, 0.7821168, 0.572549, 0, 1, 1,
0.6958476, 1.224695, -0.7285934, 0.5764706, 0, 1, 1,
0.6986939, 1.015687, 0.4427865, 0.5843138, 0, 1, 1,
0.700717, 1.483818, 0.7735062, 0.5882353, 0, 1, 1,
0.7086074, 0.4258644, 2.13648, 0.5960785, 0, 1, 1,
0.7101948, 0.2097238, -0.1040382, 0.6039216, 0, 1, 1,
0.7139236, 1.329912, 0.0405067, 0.6078432, 0, 1, 1,
0.7210903, -1.177544, 2.152282, 0.6156863, 0, 1, 1,
0.7236183, 0.8560901, 0.1133171, 0.6196079, 0, 1, 1,
0.7286221, 0.8660927, 1.704971, 0.627451, 0, 1, 1,
0.7310017, -1.420979, 0.6842143, 0.6313726, 0, 1, 1,
0.7415443, -0.5281086, 1.139885, 0.6392157, 0, 1, 1,
0.7458264, -0.1026241, 2.741271, 0.6431373, 0, 1, 1,
0.7458411, 0.4088144, 0.8414026, 0.6509804, 0, 1, 1,
0.7475452, -0.8314486, 3.729334, 0.654902, 0, 1, 1,
0.7515243, 0.244671, 0.8433477, 0.6627451, 0, 1, 1,
0.7517417, 0.1980302, 1.416082, 0.6666667, 0, 1, 1,
0.754405, 1.465645, 1.746109, 0.6745098, 0, 1, 1,
0.7555646, -1.218218, 2.274787, 0.6784314, 0, 1, 1,
0.7566711, -1.267307, 2.168303, 0.6862745, 0, 1, 1,
0.7579501, 1.207129, -0.8003663, 0.6901961, 0, 1, 1,
0.7597218, -2.322954, 4.436099, 0.6980392, 0, 1, 1,
0.7601802, 1.119222, -0.3818682, 0.7058824, 0, 1, 1,
0.7649219, -0.8166127, 0.9373469, 0.7098039, 0, 1, 1,
0.7745391, 0.3854835, 1.66133, 0.7176471, 0, 1, 1,
0.7759645, 0.4512973, 1.577537, 0.7215686, 0, 1, 1,
0.7770731, -0.2990742, 2.306219, 0.7294118, 0, 1, 1,
0.7802682, 0.1150008, 2.054812, 0.7333333, 0, 1, 1,
0.7805264, 0.5345992, 3.357577, 0.7411765, 0, 1, 1,
0.7921108, 0.1239906, 1.404017, 0.7450981, 0, 1, 1,
0.7921743, 0.4659082, 2.110542, 0.7529412, 0, 1, 1,
0.7976406, 0.6191767, 0.09578693, 0.7568628, 0, 1, 1,
0.7986079, -1.335973, 5.15817, 0.7647059, 0, 1, 1,
0.8078407, -0.5810177, 3.091079, 0.7686275, 0, 1, 1,
0.8105786, -0.5802917, 3.296299, 0.7764706, 0, 1, 1,
0.8134435, -3.223084, 3.268957, 0.7803922, 0, 1, 1,
0.817916, -0.8367103, 3.377242, 0.7882353, 0, 1, 1,
0.8294401, -0.7299495, 2.588752, 0.7921569, 0, 1, 1,
0.8313414, -0.6113787, 1.524269, 0.8, 0, 1, 1,
0.8403046, 0.0526852, 1.389566, 0.8078431, 0, 1, 1,
0.8428881, 1.285433, 1.153726, 0.8117647, 0, 1, 1,
0.8440043, -0.6795551, 2.694863, 0.8196079, 0, 1, 1,
0.8444287, 0.1307036, 0.3413114, 0.8235294, 0, 1, 1,
0.853198, 0.533663, 0.9203838, 0.8313726, 0, 1, 1,
0.8650827, -0.06490844, 3.147396, 0.8352941, 0, 1, 1,
0.8674629, -0.2788559, 0.5443043, 0.8431373, 0, 1, 1,
0.869021, -0.5211763, 1.15874, 0.8470588, 0, 1, 1,
0.8707548, -0.03545609, 3.201842, 0.854902, 0, 1, 1,
0.8744307, 0.5415287, 0.9996291, 0.8588235, 0, 1, 1,
0.8822669, -0.5604749, 2.131327, 0.8666667, 0, 1, 1,
0.8928484, -0.6826973, 1.892861, 0.8705882, 0, 1, 1,
0.8942341, -0.9184526, 2.646128, 0.8784314, 0, 1, 1,
0.8956979, -0.1664306, 2.771064, 0.8823529, 0, 1, 1,
0.8958378, -1.955323, 1.781127, 0.8901961, 0, 1, 1,
0.9004405, 1.650112, -0.7110112, 0.8941177, 0, 1, 1,
0.9064541, -0.2218486, 1.669596, 0.9019608, 0, 1, 1,
0.9073836, 0.08129366, 2.873577, 0.9098039, 0, 1, 1,
0.9113662, 0.7568516, 0.02475301, 0.9137255, 0, 1, 1,
0.9194318, 0.580613, 0.3038782, 0.9215686, 0, 1, 1,
0.9219584, -0.1823337, 0.8215651, 0.9254902, 0, 1, 1,
0.9247381, -0.2852482, -0.1699206, 0.9333333, 0, 1, 1,
0.9312079, 1.213858, -0.02057467, 0.9372549, 0, 1, 1,
0.931583, 0.4652284, 0.5614987, 0.945098, 0, 1, 1,
0.9331629, -0.5809234, 3.109663, 0.9490196, 0, 1, 1,
0.9434835, 0.3340076, 1.068105, 0.9568627, 0, 1, 1,
0.9468304, 0.6967446, 0.3291895, 0.9607843, 0, 1, 1,
0.9484115, 0.9663408, 2.505007, 0.9686275, 0, 1, 1,
0.949676, -1.540078, 3.860808, 0.972549, 0, 1, 1,
0.9529653, 0.7216402, 1.42534, 0.9803922, 0, 1, 1,
0.9557526, -0.4137654, -0.1938178, 0.9843137, 0, 1, 1,
0.9577397, -0.5077798, -0.9683563, 0.9921569, 0, 1, 1,
0.9620418, 0.1402887, 0.04218064, 0.9960784, 0, 1, 1,
0.9711971, -1.00613, 3.046454, 1, 0, 0.9960784, 1,
0.9729631, -0.118011, 1.771815, 1, 0, 0.9882353, 1,
0.9754728, 0.9624425, 0.06514569, 1, 0, 0.9843137, 1,
0.9800791, 0.1838817, 1.681684, 1, 0, 0.9764706, 1,
0.9809546, 1.379429, -1.25282, 1, 0, 0.972549, 1,
0.9818925, -0.3955269, 1.369116, 1, 0, 0.9647059, 1,
0.9830005, 1.6439, 0.3510389, 1, 0, 0.9607843, 1,
0.9861559, -0.07085584, -0.09065594, 1, 0, 0.9529412, 1,
0.9877254, 0.8361719, 1.040132, 1, 0, 0.9490196, 1,
0.9977648, -0.3503017, 0.608547, 1, 0, 0.9411765, 1,
0.9997184, -0.980469, 3.522593, 1, 0, 0.9372549, 1,
1.005474, -1.691314, 1.406824, 1, 0, 0.9294118, 1,
1.010372, 1.460712, 1.395029, 1, 0, 0.9254902, 1,
1.021139, 0.3447686, 1.045087, 1, 0, 0.9176471, 1,
1.024148, 0.5425171, 1.715513, 1, 0, 0.9137255, 1,
1.028655, -0.1220504, -0.9227226, 1, 0, 0.9058824, 1,
1.03385, 1.77159, 0.2963682, 1, 0, 0.9019608, 1,
1.035671, 0.5928079, 2.125686, 1, 0, 0.8941177, 1,
1.037057, 0.3291603, 1.438017, 1, 0, 0.8862745, 1,
1.037195, -0.6564431, 2.383382, 1, 0, 0.8823529, 1,
1.046232, -1.248692, 1.420338, 1, 0, 0.8745098, 1,
1.053058, 0.4501531, 1.851041, 1, 0, 0.8705882, 1,
1.058436, 0.4455968, 1.858954, 1, 0, 0.8627451, 1,
1.071494, -0.139644, 2.336603, 1, 0, 0.8588235, 1,
1.076217, -0.7314068, 1.981589, 1, 0, 0.8509804, 1,
1.079663, 1.15238, 0.5196674, 1, 0, 0.8470588, 1,
1.082339, -1.268, 2.680538, 1, 0, 0.8392157, 1,
1.088852, 0.09867597, 1.812526, 1, 0, 0.8352941, 1,
1.096516, 1.898304, 0.8359696, 1, 0, 0.827451, 1,
1.097204, 1.220026, 1.300467, 1, 0, 0.8235294, 1,
1.111651, 0.4124971, 1.765094, 1, 0, 0.8156863, 1,
1.118953, -1.102316, 2.80037, 1, 0, 0.8117647, 1,
1.127874, 1.43469, 0.2679667, 1, 0, 0.8039216, 1,
1.13243, 0.854601, 0.6299108, 1, 0, 0.7960784, 1,
1.132462, -1.062558, 2.055422, 1, 0, 0.7921569, 1,
1.134346, 0.6615813, -0.2091505, 1, 0, 0.7843137, 1,
1.136675, 0.258112, 0.8359282, 1, 0, 0.7803922, 1,
1.150964, 0.2762899, 0.5450474, 1, 0, 0.772549, 1,
1.15249, 0.02673912, 2.374953, 1, 0, 0.7686275, 1,
1.155578, -1.049224, 0.7228502, 1, 0, 0.7607843, 1,
1.155812, 0.1242097, 0.9070745, 1, 0, 0.7568628, 1,
1.159502, -0.008170631, -0.9521842, 1, 0, 0.7490196, 1,
1.15974, -0.9906117, 2.12128, 1, 0, 0.7450981, 1,
1.163792, 0.444132, 2.61073, 1, 0, 0.7372549, 1,
1.164189, 0.6590887, 1.294789, 1, 0, 0.7333333, 1,
1.168685, -2.227939, 4.41131, 1, 0, 0.7254902, 1,
1.172988, -0.5554308, -0.2098696, 1, 0, 0.7215686, 1,
1.177537, -0.8023534, 3.053001, 1, 0, 0.7137255, 1,
1.182966, -0.2634453, 2.118491, 1, 0, 0.7098039, 1,
1.183962, -1.214447, 1.840256, 1, 0, 0.7019608, 1,
1.201847, -0.3508219, 2.062016, 1, 0, 0.6941177, 1,
1.204894, -1.834495, 3.047665, 1, 0, 0.6901961, 1,
1.207564, 0.3302224, 0.6688157, 1, 0, 0.682353, 1,
1.2101, 1.849123, 0.5333558, 1, 0, 0.6784314, 1,
1.222875, 0.6201259, -0.3702762, 1, 0, 0.6705883, 1,
1.22428, -0.7086598, 0.7876974, 1, 0, 0.6666667, 1,
1.232974, 0.2644438, 4.380949, 1, 0, 0.6588235, 1,
1.240232, 0.2436902, 3.218915, 1, 0, 0.654902, 1,
1.240303, -0.3612976, 0.04258742, 1, 0, 0.6470588, 1,
1.242251, 0.1725664, -0.3548805, 1, 0, 0.6431373, 1,
1.243324, -0.4702551, 2.848035, 1, 0, 0.6352941, 1,
1.249554, -0.5405236, 3.148279, 1, 0, 0.6313726, 1,
1.252995, -0.8497333, 2.039546, 1, 0, 0.6235294, 1,
1.255135, -1.452534, 1.276445, 1, 0, 0.6196079, 1,
1.257654, -0.9193723, 1.545475, 1, 0, 0.6117647, 1,
1.274958, 0.1948925, 3.488131, 1, 0, 0.6078432, 1,
1.278226, 0.1262269, -0.4953884, 1, 0, 0.6, 1,
1.280828, 1.237447, -0.2430778, 1, 0, 0.5921569, 1,
1.287268, 1.567724, -0.4034697, 1, 0, 0.5882353, 1,
1.305306, -0.6508997, 1.376954, 1, 0, 0.5803922, 1,
1.307584, 1.077973, 2.217212, 1, 0, 0.5764706, 1,
1.308318, -1.277794, 1.624669, 1, 0, 0.5686275, 1,
1.313454, -0.6650076, 3.368062, 1, 0, 0.5647059, 1,
1.315557, 0.417729, 0.8854197, 1, 0, 0.5568628, 1,
1.318552, -0.7850826, 2.465801, 1, 0, 0.5529412, 1,
1.324007, -0.5401461, 2.958872, 1, 0, 0.5450981, 1,
1.342587, 0.9770077, 0.2876659, 1, 0, 0.5411765, 1,
1.345548, 0.0673559, 1.35739, 1, 0, 0.5333334, 1,
1.347615, 1.156851, 1.776142, 1, 0, 0.5294118, 1,
1.358322, 0.6410641, 0.9769675, 1, 0, 0.5215687, 1,
1.371685, 0.2695067, 3.49416, 1, 0, 0.5176471, 1,
1.377208, -0.1026866, 2.090665, 1, 0, 0.509804, 1,
1.384678, 0.9262671, 1.788583, 1, 0, 0.5058824, 1,
1.388199, 0.635106, 1.813092, 1, 0, 0.4980392, 1,
1.390647, 0.9617037, 0.9242548, 1, 0, 0.4901961, 1,
1.404098, 0.2185041, -1.93081, 1, 0, 0.4862745, 1,
1.407375, 0.9463453, 1.370663, 1, 0, 0.4784314, 1,
1.410022, 1.079724, 0.8579088, 1, 0, 0.4745098, 1,
1.42518, -0.5186792, 1.001312, 1, 0, 0.4666667, 1,
1.433273, 0.1926362, 1.224312, 1, 0, 0.4627451, 1,
1.436166, 1.790926, 0.04362506, 1, 0, 0.454902, 1,
1.438669, -1.134789, 1.342132, 1, 0, 0.4509804, 1,
1.442443, -0.3396708, 4.323785, 1, 0, 0.4431373, 1,
1.44691, -0.3654308, 2.017751, 1, 0, 0.4392157, 1,
1.456915, -0.6652294, 0.7344675, 1, 0, 0.4313726, 1,
1.472852, -0.410343, 3.218166, 1, 0, 0.427451, 1,
1.495468, 0.7631922, 0.9924978, 1, 0, 0.4196078, 1,
1.500522, 0.02851378, 2.115672, 1, 0, 0.4156863, 1,
1.506132, -0.4478724, 1.381328, 1, 0, 0.4078431, 1,
1.518418, 0.3697043, 2.316302, 1, 0, 0.4039216, 1,
1.550992, 0.1702746, 0.5169765, 1, 0, 0.3960784, 1,
1.558229, -1.44032, 2.159209, 1, 0, 0.3882353, 1,
1.559508, 0.1717711, 1.722448, 1, 0, 0.3843137, 1,
1.572348, -0.2702919, 1.837923, 1, 0, 0.3764706, 1,
1.584311, 1.004231, -1.002658, 1, 0, 0.372549, 1,
1.58619, 0.1716495, 3.335423, 1, 0, 0.3647059, 1,
1.589801, 1.836729, 1.121092, 1, 0, 0.3607843, 1,
1.592462, 0.3676955, 2.771148, 1, 0, 0.3529412, 1,
1.602014, 0.06492698, 2.399132, 1, 0, 0.3490196, 1,
1.624313, 0.1203222, 1.495571, 1, 0, 0.3411765, 1,
1.632807, 0.252943, 1.288276, 1, 0, 0.3372549, 1,
1.635017, -1.112565, 1.689169, 1, 0, 0.3294118, 1,
1.637857, 0.2299442, 2.099197, 1, 0, 0.3254902, 1,
1.642419, 0.001239461, 3.011483, 1, 0, 0.3176471, 1,
1.644609, -1.27402, 2.703382, 1, 0, 0.3137255, 1,
1.644766, -0.2391867, 1.874645, 1, 0, 0.3058824, 1,
1.651107, 0.1404772, 1.508612, 1, 0, 0.2980392, 1,
1.66994, 1.075677, 0.7883368, 1, 0, 0.2941177, 1,
1.672644, 0.8475564, 1.63403, 1, 0, 0.2862745, 1,
1.679083, 0.1841267, 2.586572, 1, 0, 0.282353, 1,
1.699985, 0.1833609, 1.007977, 1, 0, 0.2745098, 1,
1.714033, 0.9258086, 0.5460669, 1, 0, 0.2705882, 1,
1.714197, -0.8579773, 1.635437, 1, 0, 0.2627451, 1,
1.714524, 0.5264635, 3.222876, 1, 0, 0.2588235, 1,
1.730407, -0.2399423, 1.386918, 1, 0, 0.2509804, 1,
1.735129, 0.6492088, 1.367051, 1, 0, 0.2470588, 1,
1.744563, -0.717432, 2.039482, 1, 0, 0.2392157, 1,
1.75772, 1.136825, 1.633222, 1, 0, 0.2352941, 1,
1.758157, 0.1137197, 2.349598, 1, 0, 0.227451, 1,
1.781228, 0.1261452, 1.04589, 1, 0, 0.2235294, 1,
1.78231, -2.154546, 2.296853, 1, 0, 0.2156863, 1,
1.7875, -0.1153287, 2.750794, 1, 0, 0.2117647, 1,
1.789301, -0.8537995, 3.162297, 1, 0, 0.2039216, 1,
1.789818, 0.3700867, 1.92398, 1, 0, 0.1960784, 1,
1.792818, 1.175538, 1.245403, 1, 0, 0.1921569, 1,
1.79611, 1.193843, 2.087955, 1, 0, 0.1843137, 1,
1.803335, 0.1200782, 2.771381, 1, 0, 0.1803922, 1,
1.816272, -0.517747, 0.6044216, 1, 0, 0.172549, 1,
1.827632, -0.7408893, 0.9616787, 1, 0, 0.1686275, 1,
1.844462, -0.8305274, 1.441655, 1, 0, 0.1607843, 1,
1.873425, 0.8491735, 0.8856154, 1, 0, 0.1568628, 1,
1.893216, -0.02241726, 1.959254, 1, 0, 0.1490196, 1,
1.898793, 0.9341369, 2.285331, 1, 0, 0.145098, 1,
1.899596, -0.0430726, 2.919754, 1, 0, 0.1372549, 1,
1.908076, 0.682242, 0.3717176, 1, 0, 0.1333333, 1,
1.923591, 0.2579339, 1.661855, 1, 0, 0.1254902, 1,
1.934215, 0.2826834, 2.492258, 1, 0, 0.1215686, 1,
1.942942, -0.2918912, 3.130053, 1, 0, 0.1137255, 1,
1.94972, -0.7924635, 1.551884, 1, 0, 0.1098039, 1,
1.976086, 0.03277514, 1.508891, 1, 0, 0.1019608, 1,
2.0357, 0.56811, 1.368488, 1, 0, 0.09411765, 1,
2.055055, -0.5292478, 0.9189944, 1, 0, 0.09019608, 1,
2.059759, -2.262658, 1.868451, 1, 0, 0.08235294, 1,
2.089284, -2.050007, 0.6819228, 1, 0, 0.07843138, 1,
2.142507, 0.2874672, 2.071934, 1, 0, 0.07058824, 1,
2.152851, -1.088038, 2.537365, 1, 0, 0.06666667, 1,
2.166118, -0.8160654, -0.1552222, 1, 0, 0.05882353, 1,
2.216086, -0.02673552, 1.498726, 1, 0, 0.05490196, 1,
2.222868, 0.1379866, 1.97146, 1, 0, 0.04705882, 1,
2.34995, 0.6167522, 2.16067, 1, 0, 0.04313726, 1,
2.450805, -0.8421777, 2.434079, 1, 0, 0.03529412, 1,
2.454001, 0.06129729, 2.321816, 1, 0, 0.03137255, 1,
2.463486, -0.3324523, 2.546381, 1, 0, 0.02352941, 1,
2.51026, 0.04169575, 1.115068, 1, 0, 0.01960784, 1,
2.842402, 0.1700705, 0.7129455, 1, 0, 0.01176471, 1,
2.861606, -1.692041, 2.196761, 1, 0, 0.007843138, 1
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
-0.215928, -5.006203, -6.843051, 0, -0.5, 0.5, 0.5,
-0.215928, -5.006203, -6.843051, 1, -0.5, 0.5, 0.5,
-0.215928, -5.006203, -6.843051, 1, 1.5, 0.5, 0.5,
-0.215928, -5.006203, -6.843051, 0, 1.5, 0.5, 0.5
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
-4.336746, -0.4451461, -6.843051, 0, -0.5, 0.5, 0.5,
-4.336746, -0.4451461, -6.843051, 1, -0.5, 0.5, 0.5,
-4.336746, -0.4451461, -6.843051, 1, 1.5, 0.5, 0.5,
-4.336746, -0.4451461, -6.843051, 0, 1.5, 0.5, 0.5
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
-4.336746, -5.006203, 0.06400371, 0, -0.5, 0.5, 0.5,
-4.336746, -5.006203, 0.06400371, 1, -0.5, 0.5, 0.5,
-4.336746, -5.006203, 0.06400371, 1, 1.5, 0.5, 0.5,
-4.336746, -5.006203, 0.06400371, 0, 1.5, 0.5, 0.5
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
-3, -3.953652, -5.249115,
2, -3.953652, -5.249115,
-3, -3.953652, -5.249115,
-3, -4.129077, -5.514771,
-2, -3.953652, -5.249115,
-2, -4.129077, -5.514771,
-1, -3.953652, -5.249115,
-1, -4.129077, -5.514771,
0, -3.953652, -5.249115,
0, -4.129077, -5.514771,
1, -3.953652, -5.249115,
1, -4.129077, -5.514771,
2, -3.953652, -5.249115,
2, -4.129077, -5.514771
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
-3, -4.479928, -6.046083, 0, -0.5, 0.5, 0.5,
-3, -4.479928, -6.046083, 1, -0.5, 0.5, 0.5,
-3, -4.479928, -6.046083, 1, 1.5, 0.5, 0.5,
-3, -4.479928, -6.046083, 0, 1.5, 0.5, 0.5,
-2, -4.479928, -6.046083, 0, -0.5, 0.5, 0.5,
-2, -4.479928, -6.046083, 1, -0.5, 0.5, 0.5,
-2, -4.479928, -6.046083, 1, 1.5, 0.5, 0.5,
-2, -4.479928, -6.046083, 0, 1.5, 0.5, 0.5,
-1, -4.479928, -6.046083, 0, -0.5, 0.5, 0.5,
-1, -4.479928, -6.046083, 1, -0.5, 0.5, 0.5,
-1, -4.479928, -6.046083, 1, 1.5, 0.5, 0.5,
-1, -4.479928, -6.046083, 0, 1.5, 0.5, 0.5,
0, -4.479928, -6.046083, 0, -0.5, 0.5, 0.5,
0, -4.479928, -6.046083, 1, -0.5, 0.5, 0.5,
0, -4.479928, -6.046083, 1, 1.5, 0.5, 0.5,
0, -4.479928, -6.046083, 0, 1.5, 0.5, 0.5,
1, -4.479928, -6.046083, 0, -0.5, 0.5, 0.5,
1, -4.479928, -6.046083, 1, -0.5, 0.5, 0.5,
1, -4.479928, -6.046083, 1, 1.5, 0.5, 0.5,
1, -4.479928, -6.046083, 0, 1.5, 0.5, 0.5,
2, -4.479928, -6.046083, 0, -0.5, 0.5, 0.5,
2, -4.479928, -6.046083, 1, -0.5, 0.5, 0.5,
2, -4.479928, -6.046083, 1, 1.5, 0.5, 0.5,
2, -4.479928, -6.046083, 0, 1.5, 0.5, 0.5
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
-3.385788, -3, -5.249115,
-3.385788, 2, -5.249115,
-3.385788, -3, -5.249115,
-3.544281, -3, -5.514771,
-3.385788, -2, -5.249115,
-3.544281, -2, -5.514771,
-3.385788, -1, -5.249115,
-3.544281, -1, -5.514771,
-3.385788, 0, -5.249115,
-3.544281, 0, -5.514771,
-3.385788, 1, -5.249115,
-3.544281, 1, -5.514771,
-3.385788, 2, -5.249115,
-3.544281, 2, -5.514771
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
-3.861267, -3, -6.046083, 0, -0.5, 0.5, 0.5,
-3.861267, -3, -6.046083, 1, -0.5, 0.5, 0.5,
-3.861267, -3, -6.046083, 1, 1.5, 0.5, 0.5,
-3.861267, -3, -6.046083, 0, 1.5, 0.5, 0.5,
-3.861267, -2, -6.046083, 0, -0.5, 0.5, 0.5,
-3.861267, -2, -6.046083, 1, -0.5, 0.5, 0.5,
-3.861267, -2, -6.046083, 1, 1.5, 0.5, 0.5,
-3.861267, -2, -6.046083, 0, 1.5, 0.5, 0.5,
-3.861267, -1, -6.046083, 0, -0.5, 0.5, 0.5,
-3.861267, -1, -6.046083, 1, -0.5, 0.5, 0.5,
-3.861267, -1, -6.046083, 1, 1.5, 0.5, 0.5,
-3.861267, -1, -6.046083, 0, 1.5, 0.5, 0.5,
-3.861267, 0, -6.046083, 0, -0.5, 0.5, 0.5,
-3.861267, 0, -6.046083, 1, -0.5, 0.5, 0.5,
-3.861267, 0, -6.046083, 1, 1.5, 0.5, 0.5,
-3.861267, 0, -6.046083, 0, 1.5, 0.5, 0.5,
-3.861267, 1, -6.046083, 0, -0.5, 0.5, 0.5,
-3.861267, 1, -6.046083, 1, -0.5, 0.5, 0.5,
-3.861267, 1, -6.046083, 1, 1.5, 0.5, 0.5,
-3.861267, 1, -6.046083, 0, 1.5, 0.5, 0.5,
-3.861267, 2, -6.046083, 0, -0.5, 0.5, 0.5,
-3.861267, 2, -6.046083, 1, -0.5, 0.5, 0.5,
-3.861267, 2, -6.046083, 1, 1.5, 0.5, 0.5,
-3.861267, 2, -6.046083, 0, 1.5, 0.5, 0.5
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
-3.385788, -3.953652, -4,
-3.385788, -3.953652, 4,
-3.385788, -3.953652, -4,
-3.544281, -4.129077, -4,
-3.385788, -3.953652, -2,
-3.544281, -4.129077, -2,
-3.385788, -3.953652, 0,
-3.544281, -4.129077, 0,
-3.385788, -3.953652, 2,
-3.544281, -4.129077, 2,
-3.385788, -3.953652, 4,
-3.544281, -4.129077, 4
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
-3.861267, -4.479928, -4, 0, -0.5, 0.5, 0.5,
-3.861267, -4.479928, -4, 1, -0.5, 0.5, 0.5,
-3.861267, -4.479928, -4, 1, 1.5, 0.5, 0.5,
-3.861267, -4.479928, -4, 0, 1.5, 0.5, 0.5,
-3.861267, -4.479928, -2, 0, -0.5, 0.5, 0.5,
-3.861267, -4.479928, -2, 1, -0.5, 0.5, 0.5,
-3.861267, -4.479928, -2, 1, 1.5, 0.5, 0.5,
-3.861267, -4.479928, -2, 0, 1.5, 0.5, 0.5,
-3.861267, -4.479928, 0, 0, -0.5, 0.5, 0.5,
-3.861267, -4.479928, 0, 1, -0.5, 0.5, 0.5,
-3.861267, -4.479928, 0, 1, 1.5, 0.5, 0.5,
-3.861267, -4.479928, 0, 0, 1.5, 0.5, 0.5,
-3.861267, -4.479928, 2, 0, -0.5, 0.5, 0.5,
-3.861267, -4.479928, 2, 1, -0.5, 0.5, 0.5,
-3.861267, -4.479928, 2, 1, 1.5, 0.5, 0.5,
-3.861267, -4.479928, 2, 0, 1.5, 0.5, 0.5,
-3.861267, -4.479928, 4, 0, -0.5, 0.5, 0.5,
-3.861267, -4.479928, 4, 1, -0.5, 0.5, 0.5,
-3.861267, -4.479928, 4, 1, 1.5, 0.5, 0.5,
-3.861267, -4.479928, 4, 0, 1.5, 0.5, 0.5
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
-3.385788, -3.953652, -5.249115,
-3.385788, 3.063359, -5.249115,
-3.385788, -3.953652, 5.377122,
-3.385788, 3.063359, 5.377122,
-3.385788, -3.953652, -5.249115,
-3.385788, -3.953652, 5.377122,
-3.385788, 3.063359, -5.249115,
-3.385788, 3.063359, 5.377122,
-3.385788, -3.953652, -5.249115,
2.953932, -3.953652, -5.249115,
-3.385788, -3.953652, 5.377122,
2.953932, -3.953652, 5.377122,
-3.385788, 3.063359, -5.249115,
2.953932, 3.063359, -5.249115,
-3.385788, 3.063359, 5.377122,
2.953932, 3.063359, 5.377122,
2.953932, -3.953652, -5.249115,
2.953932, 3.063359, -5.249115,
2.953932, -3.953652, 5.377122,
2.953932, 3.063359, 5.377122,
2.953932, -3.953652, -5.249115,
2.953932, -3.953652, 5.377122,
2.953932, 3.063359, -5.249115,
2.953932, 3.063359, 5.377122
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
var radius = 7.595814;
var distance = 33.79464;
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
mvMatrix.translate( 0.215928, 0.4451461, -0.06400371 );
mvMatrix.scale( 1.295442, 1.170405, 0.772874 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.79464);
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
oxo-pyrrolidino<-read.table("oxo-pyrrolidino.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxo-pyrrolidino$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
```

```r
y<-oxo-pyrrolidino$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
```

```r
z<-oxo-pyrrolidino$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
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
-3.293462, 0.6318703, -3.529319, 0, 0, 1, 1, 1,
-3.264233, 0.1896869, -0.3740504, 1, 0, 0, 1, 1,
-2.948677, -0.6881387, -1.789842, 1, 0, 0, 1, 1,
-2.819827, -0.1363532, -1.921697, 1, 0, 0, 1, 1,
-2.812598, 0.1139328, -0.8609058, 1, 0, 0, 1, 1,
-2.781096, -0.9520302, -2.316924, 1, 0, 0, 1, 1,
-2.763946, -0.7582732, -0.7500346, 0, 0, 0, 1, 1,
-2.72744, 0.284429, -2.073311, 0, 0, 0, 1, 1,
-2.421483, 0.7420496, -1.946516, 0, 0, 0, 1, 1,
-2.411878, 0.5797068, -0.08817521, 0, 0, 0, 1, 1,
-2.408491, -1.027806, -1.551899, 0, 0, 0, 1, 1,
-2.375374, 0.4060882, -0.07550462, 0, 0, 0, 1, 1,
-2.364236, 0.4619131, -1.801254, 0, 0, 0, 1, 1,
-2.356074, -0.4178389, -2.517219, 1, 1, 1, 1, 1,
-2.230881, -0.2526072, 0.467555, 1, 1, 1, 1, 1,
-2.114428, -1.057049, -1.496773, 1, 1, 1, 1, 1,
-2.085866, -0.5213588, -2.467287, 1, 1, 1, 1, 1,
-2.044933, -0.5505104, -1.28916, 1, 1, 1, 1, 1,
-2.03705, -0.4925113, -2.608325, 1, 1, 1, 1, 1,
-2.03225, -0.9014346, -2.686241, 1, 1, 1, 1, 1,
-2.028374, -0.8645863, -1.962627, 1, 1, 1, 1, 1,
-1.994242, -0.81758, 0.1767088, 1, 1, 1, 1, 1,
-1.92983, 0.05337472, -0.7694918, 1, 1, 1, 1, 1,
-1.897881, -0.5999376, -0.8597079, 1, 1, 1, 1, 1,
-1.853789, -1.382879, -0.8146692, 1, 1, 1, 1, 1,
-1.847049, 0.8220571, -1.127161, 1, 1, 1, 1, 1,
-1.846108, 0.2042799, -2.685636, 1, 1, 1, 1, 1,
-1.815404, -0.4808571, -2.315333, 1, 1, 1, 1, 1,
-1.806698, 0.5005248, 0.09272315, 0, 0, 1, 1, 1,
-1.805572, -0.6446009, -2.941894, 1, 0, 0, 1, 1,
-1.779179, 0.4147751, -1.091815, 1, 0, 0, 1, 1,
-1.761864, -1.503071, -1.282295, 1, 0, 0, 1, 1,
-1.761714, 0.4230916, 0.1460472, 1, 0, 0, 1, 1,
-1.749384, 0.5884988, -1.877773, 1, 0, 0, 1, 1,
-1.748898, 0.7252147, -0.4689567, 0, 0, 0, 1, 1,
-1.74798, 1.205044, -0.03411928, 0, 0, 0, 1, 1,
-1.741144, 0.5972152, -0.80365, 0, 0, 0, 1, 1,
-1.737098, 1.752418, -1.682078, 0, 0, 0, 1, 1,
-1.733024, -0.952557, -1.54414, 0, 0, 0, 1, 1,
-1.726272, -1.36138, -2.824471, 0, 0, 0, 1, 1,
-1.723592, 0.5689089, -0.9201368, 0, 0, 0, 1, 1,
-1.719844, -0.7161521, -0.5504971, 1, 1, 1, 1, 1,
-1.719779, -0.0006580999, -0.7637238, 1, 1, 1, 1, 1,
-1.718963, 0.8280991, -1.650644, 1, 1, 1, 1, 1,
-1.695246, 0.3661574, -2.169788, 1, 1, 1, 1, 1,
-1.683948, -0.3229492, -0.7252752, 1, 1, 1, 1, 1,
-1.672864, 0.3241245, -1.325504, 1, 1, 1, 1, 1,
-1.664885, 1.227766, 0.1643194, 1, 1, 1, 1, 1,
-1.657786, -1.169286, -2.066743, 1, 1, 1, 1, 1,
-1.654568, -1.437207, -2.308266, 1, 1, 1, 1, 1,
-1.652504, -0.6388373, -2.084483, 1, 1, 1, 1, 1,
-1.648245, 2.726312, 0.4068348, 1, 1, 1, 1, 1,
-1.648066, -0.3427481, -1.816678, 1, 1, 1, 1, 1,
-1.632993, 0.2436914, -1.822608, 1, 1, 1, 1, 1,
-1.596371, 0.1264861, -0.7315345, 1, 1, 1, 1, 1,
-1.581442, 0.7647105, -0.9857792, 1, 1, 1, 1, 1,
-1.5654, -0.6225374, -0.9451469, 0, 0, 1, 1, 1,
-1.53986, 1.324213, -1.40977, 1, 0, 0, 1, 1,
-1.508587, 0.6833619, -1.822127, 1, 0, 0, 1, 1,
-1.504593, 0.3003429, -0.7207696, 1, 0, 0, 1, 1,
-1.498474, -0.2807914, -2.193213, 1, 0, 0, 1, 1,
-1.496953, -0.4553152, -1.796191, 1, 0, 0, 1, 1,
-1.494135, -1.146109, -1.643556, 0, 0, 0, 1, 1,
-1.492598, 1.588255, -4.147079, 0, 0, 0, 1, 1,
-1.49131, -0.4592476, -1.363046, 0, 0, 0, 1, 1,
-1.488562, 1.319095, 0.02221549, 0, 0, 0, 1, 1,
-1.480017, -1.050677, -2.071486, 0, 0, 0, 1, 1,
-1.479733, -0.2240431, -3.166292, 0, 0, 0, 1, 1,
-1.461658, -1.295847, -2.619175, 0, 0, 0, 1, 1,
-1.4538, 0.574965, 1.236604, 1, 1, 1, 1, 1,
-1.449596, -1.081043, -3.63471, 1, 1, 1, 1, 1,
-1.442722, 0.009092107, -1.985632, 1, 1, 1, 1, 1,
-1.438875, -2.082882, -2.045841, 1, 1, 1, 1, 1,
-1.427691, 0.7201831, -1.749085, 1, 1, 1, 1, 1,
-1.426344, -0.5515408, -2.219887, 1, 1, 1, 1, 1,
-1.418078, 0.3185969, -1.625199, 1, 1, 1, 1, 1,
-1.417336, 0.5051838, -1.318427, 1, 1, 1, 1, 1,
-1.417251, -0.8070307, -4.108508, 1, 1, 1, 1, 1,
-1.413661, -1.040507, -4.372043, 1, 1, 1, 1, 1,
-1.407191, 0.3592655, -1.823149, 1, 1, 1, 1, 1,
-1.40342, 0.1042759, -1.416473, 1, 1, 1, 1, 1,
-1.401986, -0.666555, -2.015505, 1, 1, 1, 1, 1,
-1.384994, 0.170973, -0.7370237, 1, 1, 1, 1, 1,
-1.355208, 0.3565169, -1.192765, 1, 1, 1, 1, 1,
-1.353428, -0.04795737, -1.027142, 0, 0, 1, 1, 1,
-1.344047, -1.217395, -2.703846, 1, 0, 0, 1, 1,
-1.343924, 1.80831, -0.5859673, 1, 0, 0, 1, 1,
-1.339692, 0.4152527, -0.1120703, 1, 0, 0, 1, 1,
-1.334238, -1.421541, -3.005595, 1, 0, 0, 1, 1,
-1.333254, -0.7340503, -1.403811, 1, 0, 0, 1, 1,
-1.331668, 0.920752, -1.057084, 0, 0, 0, 1, 1,
-1.324261, -1.76269, -2.417934, 0, 0, 0, 1, 1,
-1.320261, 0.7029886, -3.42389, 0, 0, 0, 1, 1,
-1.317682, -0.6105583, -1.233257, 0, 0, 0, 1, 1,
-1.314635, 1.093184, -1.19973, 0, 0, 0, 1, 1,
-1.305191, -0.5684294, -2.676399, 0, 0, 0, 1, 1,
-1.299029, 1.325861, -1.650274, 0, 0, 0, 1, 1,
-1.294023, 1.08189, -3.075098, 1, 1, 1, 1, 1,
-1.289211, -0.1540587, -0.305995, 1, 1, 1, 1, 1,
-1.286619, 0.01678784, -1.469311, 1, 1, 1, 1, 1,
-1.285653, 0.270843, -2.041736, 1, 1, 1, 1, 1,
-1.278702, -1.518658, -2.865006, 1, 1, 1, 1, 1,
-1.267735, 0.3775841, -1.765219, 1, 1, 1, 1, 1,
-1.264222, -0.925986, -1.724413, 1, 1, 1, 1, 1,
-1.259002, -0.4174674, -1.402478, 1, 1, 1, 1, 1,
-1.249317, 1.573273, -0.9517179, 1, 1, 1, 1, 1,
-1.247154, -2.774213, -2.054263, 1, 1, 1, 1, 1,
-1.244017, 0.9941695, -3.711387, 1, 1, 1, 1, 1,
-1.241627, 0.04550696, 0.2598514, 1, 1, 1, 1, 1,
-1.240007, -0.9351636, -4.649854, 1, 1, 1, 1, 1,
-1.232646, -1.630545, -3.113772, 1, 1, 1, 1, 1,
-1.227799, 1.465191, -1.212225, 1, 1, 1, 1, 1,
-1.221732, 0.2048516, -0.9208763, 0, 0, 1, 1, 1,
-1.218166, -0.172237, -0.3483676, 1, 0, 0, 1, 1,
-1.210771, 0.8974013, -0.2083307, 1, 0, 0, 1, 1,
-1.208058, 1.75139, 0.9749449, 1, 0, 0, 1, 1,
-1.207943, 1.710469, 0.7867573, 1, 0, 0, 1, 1,
-1.203579, 0.53464, -1.505559, 1, 0, 0, 1, 1,
-1.190938, -1.621502, -2.92673, 0, 0, 0, 1, 1,
-1.180661, -1.498809, -1.42555, 0, 0, 0, 1, 1,
-1.180203, 0.04912988, -1.160488, 0, 0, 0, 1, 1,
-1.176082, 0.2774616, -1.584945, 0, 0, 0, 1, 1,
-1.174147, -1.287614, -2.726295, 0, 0, 0, 1, 1,
-1.172456, -0.3289306, -1.151786, 0, 0, 0, 1, 1,
-1.172447, 0.8326354, -1.409309, 0, 0, 0, 1, 1,
-1.166584, -0.9445977, -1.215009, 1, 1, 1, 1, 1,
-1.159053, 2.96117, -2.891837, 1, 1, 1, 1, 1,
-1.156309, -2.329889, -2.030496, 1, 1, 1, 1, 1,
-1.153636, 0.03428188, -0.528246, 1, 1, 1, 1, 1,
-1.147685, -0.8837672, -2.922503, 1, 1, 1, 1, 1,
-1.138691, 1.346718, -0.5917718, 1, 1, 1, 1, 1,
-1.136615, -0.3033397, -1.29159, 1, 1, 1, 1, 1,
-1.124364, 0.3175084, -3.554918, 1, 1, 1, 1, 1,
-1.117127, -0.3160572, -1.715955, 1, 1, 1, 1, 1,
-1.116931, -0.6741292, -1.787905, 1, 1, 1, 1, 1,
-1.103711, -0.8869541, -2.136233, 1, 1, 1, 1, 1,
-1.094261, 1.360679, -1.204448, 1, 1, 1, 1, 1,
-1.078294, 0.2448155, -3.805145, 1, 1, 1, 1, 1,
-1.077012, 1.306439, -0.2060753, 1, 1, 1, 1, 1,
-1.066431, -1.893896, -3.811014, 1, 1, 1, 1, 1,
-1.057898, -0.8538622, -3.027309, 0, 0, 1, 1, 1,
-1.052177, -0.5557539, -2.899809, 1, 0, 0, 1, 1,
-1.046852, 0.870693, 0.4092944, 1, 0, 0, 1, 1,
-1.037205, 0.01853496, -2.120379, 1, 0, 0, 1, 1,
-1.033943, 1.605939, 0.542694, 1, 0, 0, 1, 1,
-1.026436, -0.6817591, -3.556364, 1, 0, 0, 1, 1,
-1.024917, -0.03371555, -2.8543, 0, 0, 0, 1, 1,
-1.016544, -0.5645791, -1.492252, 0, 0, 0, 1, 1,
-1.014532, 0.1723484, -2.381663, 0, 0, 0, 1, 1,
-1.011047, 0.08768135, -1.616813, 0, 0, 0, 1, 1,
-1.005645, -1.817781, -1.108683, 0, 0, 0, 1, 1,
-1.005266, -0.7370892, -3.845614, 0, 0, 0, 1, 1,
-1.001215, 1.731679, -0.4645385, 0, 0, 0, 1, 1,
-0.9978484, 0.2012533, -3.632547, 1, 1, 1, 1, 1,
-0.9957209, -0.770577, -2.522969, 1, 1, 1, 1, 1,
-0.9957067, 0.6161664, -0.5111287, 1, 1, 1, 1, 1,
-0.9946913, -0.6056647, -2.004961, 1, 1, 1, 1, 1,
-0.9942455, -0.07853525, -1.208923, 1, 1, 1, 1, 1,
-0.9931166, 0.4456489, -1.981934, 1, 1, 1, 1, 1,
-0.9846591, -0.3924509, -2.550032, 1, 1, 1, 1, 1,
-0.9825528, -1.043995, -2.403488, 1, 1, 1, 1, 1,
-0.9792317, 0.1042221, -0.6710951, 1, 1, 1, 1, 1,
-0.9737318, -0.7852889, -1.972671, 1, 1, 1, 1, 1,
-0.9716005, -0.05344148, -2.72115, 1, 1, 1, 1, 1,
-0.9620968, -0.6460145, -2.117032, 1, 1, 1, 1, 1,
-0.9614174, -0.1365366, -2.155982, 1, 1, 1, 1, 1,
-0.9574628, 0.6135514, -0.4892929, 1, 1, 1, 1, 1,
-0.9531206, -0.3742235, -4.45551, 1, 1, 1, 1, 1,
-0.9528345, -1.048748, -3.050096, 0, 0, 1, 1, 1,
-0.9517487, -0.6648554, -2.736706, 1, 0, 0, 1, 1,
-0.9500667, 1.536039, 1.796126, 1, 0, 0, 1, 1,
-0.9494762, -1.349965, -1.528108, 1, 0, 0, 1, 1,
-0.9468427, 0.4556747, -1.236082, 1, 0, 0, 1, 1,
-0.9454215, 1.032076, 1.781565, 1, 0, 0, 1, 1,
-0.9445282, -0.3679564, -3.474076, 0, 0, 0, 1, 1,
-0.9429902, -0.8878974, -2.840375, 0, 0, 0, 1, 1,
-0.9326638, -0.467099, -2.06812, 0, 0, 0, 1, 1,
-0.9322176, -2.290752, -3.749721, 0, 0, 0, 1, 1,
-0.9321249, 0.03116109, -1.953969, 0, 0, 0, 1, 1,
-0.9283875, -0.6026887, -3.17825, 0, 0, 0, 1, 1,
-0.9207298, -3.851462, -3.346694, 0, 0, 0, 1, 1,
-0.9163426, -0.2789873, -1.396659, 1, 1, 1, 1, 1,
-0.9149281, 1.398376, 0.209599, 1, 1, 1, 1, 1,
-0.9108818, 1.2895, -0.4670665, 1, 1, 1, 1, 1,
-0.9093265, 1.000538, -1.440721, 1, 1, 1, 1, 1,
-0.9080428, 1.845343, -1.214885, 1, 1, 1, 1, 1,
-0.899886, 0.7197291, -0.8661964, 1, 1, 1, 1, 1,
-0.8978451, -0.5398923, -3.004498, 1, 1, 1, 1, 1,
-0.8903168, 0.9645745, -0.7273675, 1, 1, 1, 1, 1,
-0.890124, 0.5145237, -2.038487, 1, 1, 1, 1, 1,
-0.8897735, 0.2574225, 0.1876068, 1, 1, 1, 1, 1,
-0.8859471, -1.309492, -3.282245, 1, 1, 1, 1, 1,
-0.8835512, 1.475493, 0.8342168, 1, 1, 1, 1, 1,
-0.8787706, 0.4177492, -0.08034572, 1, 1, 1, 1, 1,
-0.869202, 0.3623688, -1.647367, 1, 1, 1, 1, 1,
-0.8600959, 0.6623775, -2.086919, 1, 1, 1, 1, 1,
-0.8536705, -0.4828137, -3.314088, 0, 0, 1, 1, 1,
-0.8468487, 1.60946, -1.325938, 1, 0, 0, 1, 1,
-0.8448025, 0.8768978, -2.488269, 1, 0, 0, 1, 1,
-0.8417627, 0.2409273, -1.002625, 1, 0, 0, 1, 1,
-0.8416817, -0.8904951, -3.432817, 1, 0, 0, 1, 1,
-0.8387866, 0.328534, -1.875301, 1, 0, 0, 1, 1,
-0.8330001, 0.6108384, -3.078747, 0, 0, 0, 1, 1,
-0.8321642, 0.8246808, 0.1775369, 0, 0, 0, 1, 1,
-0.8280343, -0.9092507, -2.6752, 0, 0, 0, 1, 1,
-0.8261501, -0.6911967, -1.928637, 0, 0, 0, 1, 1,
-0.8257396, 0.03105098, -1.185342, 0, 0, 0, 1, 1,
-0.8165498, 1.262369, -1.266633, 0, 0, 0, 1, 1,
-0.8135219, 0.5546969, -0.9550552, 0, 0, 0, 1, 1,
-0.8065135, 0.0587181, -1.218226, 1, 1, 1, 1, 1,
-0.8053558, 0.1758945, -2.196612, 1, 1, 1, 1, 1,
-0.8017063, -0.6461627, -3.224124, 1, 1, 1, 1, 1,
-0.7944482, -0.7881375, -2.610315, 1, 1, 1, 1, 1,
-0.7934076, -0.2389808, -0.8492652, 1, 1, 1, 1, 1,
-0.7927799, 0.09388204, 1.576168, 1, 1, 1, 1, 1,
-0.7901831, 0.8181527, -0.8377474, 1, 1, 1, 1, 1,
-0.7895201, -0.2053336, -1.9137, 1, 1, 1, 1, 1,
-0.7875689, 0.3420198, -1.580279, 1, 1, 1, 1, 1,
-0.7829698, 1.271251, 1.814571, 1, 1, 1, 1, 1,
-0.7791136, -0.2940368, -2.95928, 1, 1, 1, 1, 1,
-0.7681454, -0.479116, -2.452804, 1, 1, 1, 1, 1,
-0.7678189, -0.7916511, -3.087698, 1, 1, 1, 1, 1,
-0.7671478, 1.080466, -0.7642307, 1, 1, 1, 1, 1,
-0.7667996, -0.7937748, -3.933126, 1, 1, 1, 1, 1,
-0.7652845, 0.9483227, -2.571931, 0, 0, 1, 1, 1,
-0.7651165, 1.383098, -0.8488448, 1, 0, 0, 1, 1,
-0.7622525, -0.05187329, -2.696744, 1, 0, 0, 1, 1,
-0.7554429, -0.01094262, -1.611551, 1, 0, 0, 1, 1,
-0.7525075, -1.516904, -2.361519, 1, 0, 0, 1, 1,
-0.7461314, -0.8888612, -2.846659, 1, 0, 0, 1, 1,
-0.7459205, -2.120879, -3.227575, 0, 0, 0, 1, 1,
-0.7436736, 0.3432805, -0.3248934, 0, 0, 0, 1, 1,
-0.7431436, 0.5651773, -1.649565, 0, 0, 0, 1, 1,
-0.7407162, 0.4142874, -1.00616, 0, 0, 0, 1, 1,
-0.737147, -0.4964474, -1.529559, 0, 0, 0, 1, 1,
-0.7370377, -0.787419, -1.587838, 0, 0, 0, 1, 1,
-0.7264375, 0.3711185, -1.897216, 0, 0, 0, 1, 1,
-0.7204483, 0.003705129, -1.735728, 1, 1, 1, 1, 1,
-0.7190512, 1.247626, 0.6116728, 1, 1, 1, 1, 1,
-0.7177891, 1.243338, 0.5535348, 1, 1, 1, 1, 1,
-0.7156221, -1.001336, -3.76516, 1, 1, 1, 1, 1,
-0.7117619, 0.04277294, -2.288447, 1, 1, 1, 1, 1,
-0.7114595, 2.842968, -0.1859971, 1, 1, 1, 1, 1,
-0.7110258, 0.6243386, -2.055206, 1, 1, 1, 1, 1,
-0.7083662, 1.047219, -1.364786, 1, 1, 1, 1, 1,
-0.7065576, -1.475729, -3.729441, 1, 1, 1, 1, 1,
-0.70642, -0.89127, -3.539514, 1, 1, 1, 1, 1,
-0.7050655, 0.9384167, 0.2087587, 1, 1, 1, 1, 1,
-0.7041948, 0.9474872, -0.4039931, 1, 1, 1, 1, 1,
-0.6975799, -1.850999, -4.984515, 1, 1, 1, 1, 1,
-0.6965948, 1.53722, -0.4382404, 1, 1, 1, 1, 1,
-0.6951621, 0.1979477, 0.9168518, 1, 1, 1, 1, 1,
-0.6950006, 1.280604, -1.640525, 0, 0, 1, 1, 1,
-0.6924464, -1.854343, -3.373133, 1, 0, 0, 1, 1,
-0.6922616, 1.287263, -1.361, 1, 0, 0, 1, 1,
-0.6911806, -0.9012887, -2.914906, 1, 0, 0, 1, 1,
-0.6904977, -0.5719475, -0.0270157, 1, 0, 0, 1, 1,
-0.6899315, 0.6912931, -0.9691033, 1, 0, 0, 1, 1,
-0.6891181, 1.343689, -0.631426, 0, 0, 0, 1, 1,
-0.6825829, 0.01588631, -2.57774, 0, 0, 0, 1, 1,
-0.6807809, -0.6056266, -4.438699, 0, 0, 0, 1, 1,
-0.6761386, 0.8292297, 0.04395993, 0, 0, 0, 1, 1,
-0.6721385, 0.106318, -4.122261, 0, 0, 0, 1, 1,
-0.6707546, 0.5920036, -0.4317013, 0, 0, 0, 1, 1,
-0.6696906, -0.1838413, -2.422029, 0, 0, 0, 1, 1,
-0.6668133, -0.1764356, -2.496869, 1, 1, 1, 1, 1,
-0.6629899, -0.3480665, -2.143889, 1, 1, 1, 1, 1,
-0.6601406, -0.6189, -1.879828, 1, 1, 1, 1, 1,
-0.6563848, -0.9177747, -1.260276, 1, 1, 1, 1, 1,
-0.6452805, -1.298893, -2.729784, 1, 1, 1, 1, 1,
-0.6415664, -1.595449, -2.903058, 1, 1, 1, 1, 1,
-0.6390129, 1.667962, -0.7223544, 1, 1, 1, 1, 1,
-0.6387246, 1.194155, 0.4830339, 1, 1, 1, 1, 1,
-0.6342087, 0.3498047, -1.99081, 1, 1, 1, 1, 1,
-0.6329091, 1.515059, 0.8568344, 1, 1, 1, 1, 1,
-0.6319233, 2.144817, -1.512127, 1, 1, 1, 1, 1,
-0.6284772, -0.7951473, -1.596982, 1, 1, 1, 1, 1,
-0.6190121, -0.4755991, -1.371422, 1, 1, 1, 1, 1,
-0.6179363, -0.1432154, -2.272446, 1, 1, 1, 1, 1,
-0.6158423, -1.607578, -3.924545, 1, 1, 1, 1, 1,
-0.6155806, -0.5657325, -2.943485, 0, 0, 1, 1, 1,
-0.6151356, 0.4551698, -1.929032, 1, 0, 0, 1, 1,
-0.6148612, -0.7697421, -2.852683, 1, 0, 0, 1, 1,
-0.6106548, -1.692225, -4.623098, 1, 0, 0, 1, 1,
-0.6085184, 0.2767018, -0.806996, 1, 0, 0, 1, 1,
-0.6065628, 1.055844, 2.449351, 1, 0, 0, 1, 1,
-0.6040134, 0.411836, -0.9281257, 0, 0, 0, 1, 1,
-0.6039331, -0.09626593, -1.524066, 0, 0, 0, 1, 1,
-0.6022307, 1.809089, 0.09676193, 0, 0, 0, 1, 1,
-0.6011188, -0.3530892, -1.716675, 0, 0, 0, 1, 1,
-0.5969349, -0.01924243, -0.6534899, 0, 0, 0, 1, 1,
-0.5960317, 0.6702195, -2.852039, 0, 0, 0, 1, 1,
-0.5785643, 0.7595775, 0.9825394, 0, 0, 0, 1, 1,
-0.5776613, 0.7983269, -1.595085, 1, 1, 1, 1, 1,
-0.5667061, 0.5397551, 0.04817021, 1, 1, 1, 1, 1,
-0.5585414, 0.9970836, -2.855697, 1, 1, 1, 1, 1,
-0.5560555, 0.4726231, -1.753666, 1, 1, 1, 1, 1,
-0.5501395, -0.6607085, -4.161812, 1, 1, 1, 1, 1,
-0.5438281, 0.7294432, -0.7484213, 1, 1, 1, 1, 1,
-0.5418823, -0.2584848, -3.068183, 1, 1, 1, 1, 1,
-0.5398721, -0.0391867, -2.084237, 1, 1, 1, 1, 1,
-0.5371253, -1.107804, -1.506896, 1, 1, 1, 1, 1,
-0.5361908, 1.051767, -0.3598031, 1, 1, 1, 1, 1,
-0.532463, 1.837852, 0.08092477, 1, 1, 1, 1, 1,
-0.5310094, 0.234348, -0.9425688, 1, 1, 1, 1, 1,
-0.5303113, 0.9448147, -1.619629, 1, 1, 1, 1, 1,
-0.530306, 0.3477777, -0.2396671, 1, 1, 1, 1, 1,
-0.5235143, -1.776358, -2.692073, 1, 1, 1, 1, 1,
-0.5192268, -0.9303358, -3.403431, 0, 0, 1, 1, 1,
-0.5162128, 0.01831827, -1.44092, 1, 0, 0, 1, 1,
-0.5157525, 1.759823, -0.1077221, 1, 0, 0, 1, 1,
-0.5152221, -0.3403642, -3.163637, 1, 0, 0, 1, 1,
-0.5075735, -0.4003865, -2.19264, 1, 0, 0, 1, 1,
-0.5064464, -1.155814, -3.346325, 1, 0, 0, 1, 1,
-0.5025815, -0.07971819, -1.061005, 0, 0, 0, 1, 1,
-0.5010931, 0.2786748, 1.538388, 0, 0, 0, 1, 1,
-0.4981355, 0.3018902, 0.9018239, 0, 0, 0, 1, 1,
-0.4934404, 2.091704, 0.1327367, 0, 0, 0, 1, 1,
-0.4918987, 0.02662574, -0.8597206, 0, 0, 0, 1, 1,
-0.4815173, -0.5480893, -0.8783821, 0, 0, 0, 1, 1,
-0.4787391, 0.9545704, -0.7880315, 0, 0, 0, 1, 1,
-0.4786079, -0.6900678, -1.131886, 1, 1, 1, 1, 1,
-0.4755897, 0.6448363, -0.6178972, 1, 1, 1, 1, 1,
-0.4707967, 0.9855638, -0.6433733, 1, 1, 1, 1, 1,
-0.4619669, -0.08784949, -0.5316694, 1, 1, 1, 1, 1,
-0.4619287, 0.8286989, 0.2322422, 1, 1, 1, 1, 1,
-0.4601888, 0.9662118, -0.8914633, 1, 1, 1, 1, 1,
-0.459718, -0.08449525, -1.386458, 1, 1, 1, 1, 1,
-0.4553682, 0.6115476, 0.9914651, 1, 1, 1, 1, 1,
-0.4539788, 0.7451763, 0.8270453, 1, 1, 1, 1, 1,
-0.4528913, -0.3952325, -3.218852, 1, 1, 1, 1, 1,
-0.4513855, 0.5993436, -1.177881, 1, 1, 1, 1, 1,
-0.4507201, -1.019462, -2.341795, 1, 1, 1, 1, 1,
-0.4503417, 2.44371, 0.7324393, 1, 1, 1, 1, 1,
-0.4500305, 1.018934, -1.826205, 1, 1, 1, 1, 1,
-0.4477436, -0.4618351, -2.308039, 1, 1, 1, 1, 1,
-0.4375483, 0.2987433, -0.7125679, 0, 0, 1, 1, 1,
-0.4373425, 1.503701, 0.6223506, 1, 0, 0, 1, 1,
-0.4304855, 0.2849785, -0.5659094, 1, 0, 0, 1, 1,
-0.4302996, -0.744972, -3.319481, 1, 0, 0, 1, 1,
-0.4252076, 0.260996, 0.03364269, 1, 0, 0, 1, 1,
-0.4249156, 0.2354813, 0.2507606, 1, 0, 0, 1, 1,
-0.4248722, 1.166368, 1.198387, 0, 0, 0, 1, 1,
-0.4198171, -1.339214, -3.664715, 0, 0, 0, 1, 1,
-0.419691, 0.00755054, -0.2672821, 0, 0, 0, 1, 1,
-0.4098145, 1.524023, 1.494038, 0, 0, 0, 1, 1,
-0.4082638, 1.004422, -1.046442, 0, 0, 0, 1, 1,
-0.4076465, -0.0736177, -1.59967, 0, 0, 0, 1, 1,
-0.4035718, 0.06145424, 0.3148033, 0, 0, 0, 1, 1,
-0.4023846, -0.793516, -3.06321, 1, 1, 1, 1, 1,
-0.397717, -0.06421288, -1.939314, 1, 1, 1, 1, 1,
-0.3967123, -0.8224729, -1.837678, 1, 1, 1, 1, 1,
-0.3916852, -1.124106, -2.7307, 1, 1, 1, 1, 1,
-0.3916622, -1.077624, -3.77313, 1, 1, 1, 1, 1,
-0.3906737, -0.2628269, -2.233546, 1, 1, 1, 1, 1,
-0.389504, -0.6703385, -3.822545, 1, 1, 1, 1, 1,
-0.389235, -0.1312012, -3.009391, 1, 1, 1, 1, 1,
-0.3851455, -1.352277, -3.826647, 1, 1, 1, 1, 1,
-0.3789065, -1.575001, -1.336357, 1, 1, 1, 1, 1,
-0.3771367, -1.395339, -4.040523, 1, 1, 1, 1, 1,
-0.3740732, -0.1491045, -2.040319, 1, 1, 1, 1, 1,
-0.3740569, 0.05146786, -1.890118, 1, 1, 1, 1, 1,
-0.3723488, 0.09673377, -0.09069951, 1, 1, 1, 1, 1,
-0.3721493, -0.172702, -2.270085, 1, 1, 1, 1, 1,
-0.3710965, 1.257324, 0.3374102, 0, 0, 1, 1, 1,
-0.361153, -0.1905013, -2.039355, 1, 0, 0, 1, 1,
-0.3575389, -1.577737, -4.665743, 1, 0, 0, 1, 1,
-0.3554155, -1.233907, -3.507307, 1, 0, 0, 1, 1,
-0.3475974, -0.09379368, -2.14952, 1, 0, 0, 1, 1,
-0.3462148, 0.6032531, -0.04109633, 1, 0, 0, 1, 1,
-0.3424559, 1.065493, -0.9475011, 0, 0, 0, 1, 1,
-0.3421406, -0.5407355, -1.70564, 0, 0, 0, 1, 1,
-0.341175, -0.1633887, -0.9623314, 0, 0, 0, 1, 1,
-0.3410948, 1.585934, -1.470869, 0, 0, 0, 1, 1,
-0.3400348, -2.793324, -1.063402, 0, 0, 0, 1, 1,
-0.3398911, -0.9317145, -1.44239, 0, 0, 0, 1, 1,
-0.33946, -1.618857, -4.23735, 0, 0, 0, 1, 1,
-0.3312377, 0.2430727, -0.9719942, 1, 1, 1, 1, 1,
-0.3268926, 0.3643281, 0.3353361, 1, 1, 1, 1, 1,
-0.3197708, 0.2860889, -1.299844, 1, 1, 1, 1, 1,
-0.3161016, -0.2608378, -2.268594, 1, 1, 1, 1, 1,
-0.3148976, 0.2542845, -1.969728, 1, 1, 1, 1, 1,
-0.3108004, 0.4900801, -0.7656583, 1, 1, 1, 1, 1,
-0.2983373, -0.8859916, -1.349759, 1, 1, 1, 1, 1,
-0.2932847, 0.3198504, -0.9367803, 1, 1, 1, 1, 1,
-0.2887349, -0.1646204, -2.948753, 1, 1, 1, 1, 1,
-0.2884664, 1.004578, 0.5976462, 1, 1, 1, 1, 1,
-0.2869692, 0.2472973, -1.541289, 1, 1, 1, 1, 1,
-0.2838993, 0.794077, 0.5309069, 1, 1, 1, 1, 1,
-0.2832886, -1.315142, -5.094364, 1, 1, 1, 1, 1,
-0.2824495, -0.1090951, -1.680338, 1, 1, 1, 1, 1,
-0.2817188, 0.9780661, -0.2981059, 1, 1, 1, 1, 1,
-0.2793557, 1.193473, -1.168294, 0, 0, 1, 1, 1,
-0.2793494, 0.1498805, -0.9869986, 1, 0, 0, 1, 1,
-0.2741371, 0.9926506, 0.8751929, 1, 0, 0, 1, 1,
-0.2733091, -1.394877, -3.696452, 1, 0, 0, 1, 1,
-0.2653586, -1.045876, -2.535442, 1, 0, 0, 1, 1,
-0.2618567, 2.158534, 0.4236488, 1, 0, 0, 1, 1,
-0.2574889, -0.7477343, -3.029438, 0, 0, 0, 1, 1,
-0.2572731, 0.5179653, -1.094795, 0, 0, 0, 1, 1,
-0.256114, 0.1895416, -0.6670557, 0, 0, 0, 1, 1,
-0.2560668, -0.4379694, -2.71859, 0, 0, 0, 1, 1,
-0.252208, -2.305842, -4.387008, 0, 0, 0, 1, 1,
-0.2465894, -0.4610166, -2.299552, 0, 0, 0, 1, 1,
-0.2448696, -0.01176258, -0.7551246, 0, 0, 0, 1, 1,
-0.2443174, -0.5786583, -1.016173, 1, 1, 1, 1, 1,
-0.2441141, -0.3114015, -2.52337, 1, 1, 1, 1, 1,
-0.242449, 1.61742, 0.6412687, 1, 1, 1, 1, 1,
-0.2412279, 1.874739, 0.9509308, 1, 1, 1, 1, 1,
-0.2361502, 0.4924142, -1.106884, 1, 1, 1, 1, 1,
-0.2360686, -0.2651367, -2.936729, 1, 1, 1, 1, 1,
-0.2359563, -0.3351038, -4.405059, 1, 1, 1, 1, 1,
-0.2359269, 0.6547394, 0.4288529, 1, 1, 1, 1, 1,
-0.2354514, 0.368594, 0.7141856, 1, 1, 1, 1, 1,
-0.2320524, 0.8082992, -1.00347, 1, 1, 1, 1, 1,
-0.2300659, -0.3291774, -2.161846, 1, 1, 1, 1, 1,
-0.2294803, -1.399271, -2.848022, 1, 1, 1, 1, 1,
-0.227307, -0.5025209, -3.174958, 1, 1, 1, 1, 1,
-0.2267502, 1.865244, -0.9230446, 1, 1, 1, 1, 1,
-0.2251642, 0.3915903, -0.4198956, 1, 1, 1, 1, 1,
-0.2154178, -0.4333987, -3.637183, 0, 0, 1, 1, 1,
-0.213087, -0.5123815, -2.679816, 1, 0, 0, 1, 1,
-0.2116684, 0.988226, -1.881939, 1, 0, 0, 1, 1,
-0.209714, 1.11242, 2.101795, 1, 0, 0, 1, 1,
-0.2092878, -1.883259, -4.093809, 1, 0, 0, 1, 1,
-0.2084702, 0.6383356, -0.4291872, 1, 0, 0, 1, 1,
-0.2058856, -0.3759592, -2.597527, 0, 0, 0, 1, 1,
-0.1977377, 1.285662, 1.976723, 0, 0, 0, 1, 1,
-0.1937147, -1.14628, -2.561197, 0, 0, 0, 1, 1,
-0.1910396, -1.037346, -1.936367, 0, 0, 0, 1, 1,
-0.1909897, 0.5175252, -0.5104303, 0, 0, 0, 1, 1,
-0.1904166, -1.509017, -3.199859, 0, 0, 0, 1, 1,
-0.1896273, -1.348294, -1.358351, 0, 0, 0, 1, 1,
-0.1876701, 0.1885229, 0.7226551, 1, 1, 1, 1, 1,
-0.1860011, -1.404487, -2.307655, 1, 1, 1, 1, 1,
-0.1833495, -0.5216947, -4.177053, 1, 1, 1, 1, 1,
-0.1824982, 0.4743018, -1.536595, 1, 1, 1, 1, 1,
-0.1776356, -1.478742, -2.273737, 1, 1, 1, 1, 1,
-0.1752919, -1.352927, -2.968742, 1, 1, 1, 1, 1,
-0.1730181, -1.128719, -1.66176, 1, 1, 1, 1, 1,
-0.1704335, 1.494423, -0.6585186, 1, 1, 1, 1, 1,
-0.1691413, -0.1030073, -1.389209, 1, 1, 1, 1, 1,
-0.1676015, -1.439286, -1.152891, 1, 1, 1, 1, 1,
-0.157342, 0.7463463, 0.2791322, 1, 1, 1, 1, 1,
-0.1548014, 1.217333, 0.825103, 1, 1, 1, 1, 1,
-0.1540303, 1.626831, 1.211332, 1, 1, 1, 1, 1,
-0.1532765, 0.6697602, -0.6266597, 1, 1, 1, 1, 1,
-0.1471706, 0.8312632, -0.5208341, 1, 1, 1, 1, 1,
-0.146758, 1.331745, 0.5736638, 0, 0, 1, 1, 1,
-0.144591, 1.741498, 1.765525, 1, 0, 0, 1, 1,
-0.1408522, -0.9189955, -1.585263, 1, 0, 0, 1, 1,
-0.1366685, -1.337559, -2.461301, 1, 0, 0, 1, 1,
-0.1352642, 0.3811725, -1.16736, 1, 0, 0, 1, 1,
-0.1335712, 0.1744694, -0.9297298, 1, 0, 0, 1, 1,
-0.1324688, 0.5631586, 0.1569366, 0, 0, 0, 1, 1,
-0.131914, -0.6651109, -2.328074, 0, 0, 0, 1, 1,
-0.1305742, 1.438426, -0.1031628, 0, 0, 0, 1, 1,
-0.1224247, 0.8634647, -1.761761, 0, 0, 0, 1, 1,
-0.1192729, -0.1763378, -2.859874, 0, 0, 0, 1, 1,
-0.1178987, 0.7513008, 0.3016585, 0, 0, 0, 1, 1,
-0.1172503, -0.5826178, -3.013583, 0, 0, 0, 1, 1,
-0.1172156, -0.193345, -2.650754, 1, 1, 1, 1, 1,
-0.1128257, -0.3275455, -0.952727, 1, 1, 1, 1, 1,
-0.1060936, 0.6308155, 0.03453385, 1, 1, 1, 1, 1,
-0.1024497, 0.1550943, -0.4017923, 1, 1, 1, 1, 1,
-0.09862514, -2.095063, -3.606487, 1, 1, 1, 1, 1,
-0.09862138, -0.6795757, -2.392577, 1, 1, 1, 1, 1,
-0.09807284, -0.02447625, -2.383904, 1, 1, 1, 1, 1,
-0.09417619, -1.227901, -4.035172, 1, 1, 1, 1, 1,
-0.09341268, 0.1192057, 1.114347, 1, 1, 1, 1, 1,
-0.08968711, 1.261991, -0.9139391, 1, 1, 1, 1, 1,
-0.08680187, 0.01455525, -0.8718879, 1, 1, 1, 1, 1,
-0.08012572, 0.642503, 1.045307, 1, 1, 1, 1, 1,
-0.07849747, 2.100274, -0.9896839, 1, 1, 1, 1, 1,
-0.07261743, 1.010348, -0.4381779, 1, 1, 1, 1, 1,
-0.07125771, -1.621709, -3.53607, 1, 1, 1, 1, 1,
-0.07094583, 0.1043363, -0.04652219, 0, 0, 1, 1, 1,
-0.06736247, -0.2356766, -2.768826, 1, 0, 0, 1, 1,
-0.06729854, -0.2897869, -4.189588, 1, 0, 0, 1, 1,
-0.06500012, -1.220168, -3.367229, 1, 0, 0, 1, 1,
-0.06052383, 0.865726, -0.6285701, 1, 0, 0, 1, 1,
-0.05971506, -0.01881527, -1.718568, 1, 0, 0, 1, 1,
-0.05059856, -0.002722202, -2.648985, 0, 0, 0, 1, 1,
-0.0504226, -0.06472254, -3.22187, 0, 0, 0, 1, 1,
-0.04905665, -1.77564, -2.643294, 0, 0, 0, 1, 1,
-0.04742647, -0.385669, -2.032015, 0, 0, 0, 1, 1,
-0.04021538, 0.7113726, -0.7999744, 0, 0, 0, 1, 1,
-0.03706448, 0.9600789, -0.5732082, 0, 0, 0, 1, 1,
-0.03644684, -1.542728, -4.872485, 0, 0, 0, 1, 1,
-0.03610599, 0.2333824, 0.5587255, 1, 1, 1, 1, 1,
-0.03560444, -0.6915804, -3.734578, 1, 1, 1, 1, 1,
-0.03511377, -0.5386864, -4.213133, 1, 1, 1, 1, 1,
-0.03303004, -0.7018661, -2.842463, 1, 1, 1, 1, 1,
-0.03251538, -1.466546, -0.7556131, 1, 1, 1, 1, 1,
-0.03068327, 0.2616692, -0.1099245, 1, 1, 1, 1, 1,
-0.03039579, 0.9262003, 0.8829552, 1, 1, 1, 1, 1,
-0.02680492, 1.186938, -0.8502947, 1, 1, 1, 1, 1,
-0.02471779, -0.2164598, -3.59631, 1, 1, 1, 1, 1,
-0.01682645, 0.9937306, -0.8795888, 1, 1, 1, 1, 1,
-0.015513, -1.969434, -4.59374, 1, 1, 1, 1, 1,
-0.01297588, 0.1571025, 0.8296368, 1, 1, 1, 1, 1,
-0.01235054, 0.9579789, 0.1884302, 1, 1, 1, 1, 1,
-0.007110812, 1.314731, 1.963466, 1, 1, 1, 1, 1,
-0.005199139, -0.6305314, -4.891991, 1, 1, 1, 1, 1,
-0.001342499, 1.894085, 1.640631, 0, 0, 1, 1, 1,
0.001368084, 0.1510143, -0.01566386, 1, 0, 0, 1, 1,
0.01342773, -0.1889366, 3.036562, 1, 0, 0, 1, 1,
0.01609502, 0.8441545, -0.9177731, 1, 0, 0, 1, 1,
0.01917883, -1.725995, 1.593582, 1, 0, 0, 1, 1,
0.02702938, 1.982312, 0.2166005, 1, 0, 0, 1, 1,
0.03254049, 1.194097, -1.328457, 0, 0, 0, 1, 1,
0.03429125, -1.051658, 2.627912, 0, 0, 0, 1, 1,
0.03788487, -0.1175257, 0.8224072, 0, 0, 0, 1, 1,
0.04153454, 1.0066, 1.367826, 0, 0, 0, 1, 1,
0.04669922, 1.429571, 1.27609, 0, 0, 0, 1, 1,
0.0482025, 0.7133299, 0.6552128, 0, 0, 0, 1, 1,
0.04916557, -0.1766337, 3.294519, 0, 0, 0, 1, 1,
0.04921986, 0.451946, -1.385832, 1, 1, 1, 1, 1,
0.05119425, -0.05968028, -0.07671437, 1, 1, 1, 1, 1,
0.05740784, 1.951429, 1.279539, 1, 1, 1, 1, 1,
0.05759092, -0.2738827, 2.832757, 1, 1, 1, 1, 1,
0.05925111, -1.027485, 4.399016, 1, 1, 1, 1, 1,
0.06088508, -0.509776, 1.411377, 1, 1, 1, 1, 1,
0.06589327, 0.5865164, 1.255005, 1, 1, 1, 1, 1,
0.06655628, 0.8094269, -0.5293103, 1, 1, 1, 1, 1,
0.06835945, -0.5118241, 3.412433, 1, 1, 1, 1, 1,
0.07720135, 0.4877465, -1.173379, 1, 1, 1, 1, 1,
0.07773599, 0.5142431, 0.6449116, 1, 1, 1, 1, 1,
0.0815834, 1.753061, 0.2097477, 1, 1, 1, 1, 1,
0.08323058, 0.8903455, 1.399586, 1, 1, 1, 1, 1,
0.08482171, 0.1851277, 0.6923987, 1, 1, 1, 1, 1,
0.08786278, -0.792214, 1.87161, 1, 1, 1, 1, 1,
0.0889855, -0.5069814, 1.7883, 0, 0, 1, 1, 1,
0.08920546, -0.9104628, 3.276501, 1, 0, 0, 1, 1,
0.09282004, 0.5762423, 1.226721, 1, 0, 0, 1, 1,
0.09474435, -0.797619, 3.351299, 1, 0, 0, 1, 1,
0.09734086, 1.029389, -1.103545, 1, 0, 0, 1, 1,
0.1050603, -0.09681006, 1.076793, 1, 0, 0, 1, 1,
0.1072085, 1.487842, -0.5138917, 0, 0, 0, 1, 1,
0.1078042, -0.6762688, 4.437211, 0, 0, 0, 1, 1,
0.1079326, -0.5489813, 1.463163, 0, 0, 0, 1, 1,
0.1082215, 0.9227409, 0.5499337, 0, 0, 0, 1, 1,
0.1123322, 1.803196, 1.051611, 0, 0, 0, 1, 1,
0.1136012, -0.8561178, 3.802075, 0, 0, 0, 1, 1,
0.1146008, -0.5849686, 2.503412, 0, 0, 0, 1, 1,
0.116117, -0.3213205, 1.6546, 1, 1, 1, 1, 1,
0.1184062, 0.7508288, -1.185238, 1, 1, 1, 1, 1,
0.1198842, -0.8699581, 2.36238, 1, 1, 1, 1, 1,
0.1245159, -1.102743, 2.631046, 1, 1, 1, 1, 1,
0.1286946, -1.290526, 4.148372, 1, 1, 1, 1, 1,
0.1289735, 0.5257919, 0.5068893, 1, 1, 1, 1, 1,
0.1320604, -0.1017026, 3.784604, 1, 1, 1, 1, 1,
0.1323017, 0.2860567, 1.309394, 1, 1, 1, 1, 1,
0.1371846, -0.08886815, 2.702637, 1, 1, 1, 1, 1,
0.1374944, -0.6868146, 2.345328, 1, 1, 1, 1, 1,
0.1422502, 1.220321, 0.02038294, 1, 1, 1, 1, 1,
0.1429342, -0.4668137, 2.243029, 1, 1, 1, 1, 1,
0.1459518, -0.3748585, 3.069243, 1, 1, 1, 1, 1,
0.1489857, -1.277352, 2.787158, 1, 1, 1, 1, 1,
0.148998, -1.001555, 2.327918, 1, 1, 1, 1, 1,
0.1514341, -0.7772793, 2.341204, 0, 0, 1, 1, 1,
0.1562216, 0.07435676, 3.930247, 1, 0, 0, 1, 1,
0.1628119, -2.820984, 3.083281, 1, 0, 0, 1, 1,
0.1631331, -0.7482936, 3.050647, 1, 0, 0, 1, 1,
0.164848, 0.6992927, 0.1052642, 1, 0, 0, 1, 1,
0.1677999, 0.8141868, -0.4682975, 1, 0, 0, 1, 1,
0.1690245, -0.2556408, 3.860085, 0, 0, 0, 1, 1,
0.1701944, 0.01704342, 0.8964515, 0, 0, 0, 1, 1,
0.1705982, -0.5780393, 2.698002, 0, 0, 0, 1, 1,
0.1707955, 0.2813939, 1.095966, 0, 0, 0, 1, 1,
0.1722317, 2.126823, 1.001918, 0, 0, 0, 1, 1,
0.1781298, 0.7680827, -1.427273, 0, 0, 0, 1, 1,
0.1783171, -1.16056, 1.767608, 0, 0, 0, 1, 1,
0.1842935, -0.3210401, 2.263866, 1, 1, 1, 1, 1,
0.1870181, -0.7426841, 1.62699, 1, 1, 1, 1, 1,
0.1887742, -0.5673918, 2.96228, 1, 1, 1, 1, 1,
0.1892404, 2.192385, -1.468381, 1, 1, 1, 1, 1,
0.1896987, -0.6891045, 3.032002, 1, 1, 1, 1, 1,
0.1905715, 0.8170476, -1.10599, 1, 1, 1, 1, 1,
0.1935192, 0.1752418, 1.006067, 1, 1, 1, 1, 1,
0.1973765, 1.377818, 1.570508, 1, 1, 1, 1, 1,
0.199819, -0.589655, 4.208535, 1, 1, 1, 1, 1,
0.2037145, 0.5512169, -1.963522, 1, 1, 1, 1, 1,
0.2050923, -1.176817, 1.76874, 1, 1, 1, 1, 1,
0.2094991, -0.7651057, 3.525361, 1, 1, 1, 1, 1,
0.2104002, 1.252775, 0.02621884, 1, 1, 1, 1, 1,
0.2195005, 0.1531254, -0.4167022, 1, 1, 1, 1, 1,
0.2211709, 1.667765, -0.999049, 1, 1, 1, 1, 1,
0.221448, 0.4515297, -0.2641624, 0, 0, 1, 1, 1,
0.2256734, 1.099037, 0.9487971, 1, 0, 0, 1, 1,
0.2282115, -0.909299, 1.852353, 1, 0, 0, 1, 1,
0.2349341, 0.4180792, 0.7290496, 1, 0, 0, 1, 1,
0.238247, -0.06758773, 2.061945, 1, 0, 0, 1, 1,
0.2385511, -0.8982732, -0.07445914, 1, 0, 0, 1, 1,
0.2416456, 1.089733, 0.2658291, 0, 0, 0, 1, 1,
0.2424728, -0.9431244, 3.466765, 0, 0, 0, 1, 1,
0.2454737, -0.8182827, 2.217875, 0, 0, 0, 1, 1,
0.2468979, -1.503781, 3.516703, 0, 0, 0, 1, 1,
0.2494751, 1.165574, -1.345202, 0, 0, 0, 1, 1,
0.2518115, 0.04154359, 1.935563, 0, 0, 0, 1, 1,
0.2533201, -0.1728784, 4.689546, 0, 0, 0, 1, 1,
0.2540306, -0.1954706, 2.156154, 1, 1, 1, 1, 1,
0.2543093, 0.7119598, 1.483118, 1, 1, 1, 1, 1,
0.2582265, -1.693794, 3.425074, 1, 1, 1, 1, 1,
0.2629428, 1.062356, 1.403385, 1, 1, 1, 1, 1,
0.2633897, -1.674209, 3.153517, 1, 1, 1, 1, 1,
0.2634248, -0.5258105, 4.162208, 1, 1, 1, 1, 1,
0.2641408, 0.8614594, 0.4796195, 1, 1, 1, 1, 1,
0.266183, -0.8665591, 2.916535, 1, 1, 1, 1, 1,
0.2683401, 0.6387582, 0.2621193, 1, 1, 1, 1, 1,
0.2691449, -1.480012, 2.369175, 1, 1, 1, 1, 1,
0.2738567, 1.179159, 0.09820899, 1, 1, 1, 1, 1,
0.2752192, -0.8968226, 2.55293, 1, 1, 1, 1, 1,
0.2759452, -0.1765973, 2.250731, 1, 1, 1, 1, 1,
0.2820516, 1.453902, 1.77206, 1, 1, 1, 1, 1,
0.2905954, -0.1198875, 2.0917, 1, 1, 1, 1, 1,
0.2945523, 0.1015956, 0.6110287, 0, 0, 1, 1, 1,
0.2949789, -0.8674846, 3.38177, 1, 0, 0, 1, 1,
0.2984619, -1.832055, 3.071952, 1, 0, 0, 1, 1,
0.3032107, -0.7996095, 3.026891, 1, 0, 0, 1, 1,
0.3037628, -1.365322, 2.401564, 1, 0, 0, 1, 1,
0.3088345, 0.4591568, 1.115853, 1, 0, 0, 1, 1,
0.3105439, 0.4229746, 1.07873, 0, 0, 0, 1, 1,
0.3105605, -1.529281, 2.992983, 0, 0, 0, 1, 1,
0.3131364, -1.176329, 3.421515, 0, 0, 0, 1, 1,
0.3155305, 1.006951, 0.6936859, 0, 0, 0, 1, 1,
0.3157457, -0.5557685, 2.096664, 0, 0, 0, 1, 1,
0.3161463, 0.9894766, -0.9780164, 0, 0, 0, 1, 1,
0.3199229, 0.4064364, 2.765041, 0, 0, 0, 1, 1,
0.3199387, 0.6271174, 0.581079, 1, 1, 1, 1, 1,
0.3326049, -0.5862907, 2.893412, 1, 1, 1, 1, 1,
0.3351872, -0.735263, 0.8574839, 1, 1, 1, 1, 1,
0.3367728, 0.9297717, 1.010633, 1, 1, 1, 1, 1,
0.3454891, -0.2161708, 2.074045, 1, 1, 1, 1, 1,
0.3479391, 1.341651, -0.720961, 1, 1, 1, 1, 1,
0.3486913, -0.3781959, 3.502342, 1, 1, 1, 1, 1,
0.3491133, 1.372899, 0.3517556, 1, 1, 1, 1, 1,
0.3495212, 0.06527597, 1.36324, 1, 1, 1, 1, 1,
0.3506864, 0.1163616, 2.005778, 1, 1, 1, 1, 1,
0.3546254, 0.04720174, -0.1387887, 1, 1, 1, 1, 1,
0.3586943, -0.8471209, 2.862119, 1, 1, 1, 1, 1,
0.3615419, 0.3509297, 0.4747064, 1, 1, 1, 1, 1,
0.3633074, 0.5969483, 0.5475997, 1, 1, 1, 1, 1,
0.3638579, 0.6302034, 1.02553, 1, 1, 1, 1, 1,
0.3704391, 1.150937, 1.036999, 0, 0, 1, 1, 1,
0.3709106, 1.127297, 0.2518161, 1, 0, 0, 1, 1,
0.3715118, 0.2054551, 1.31331, 1, 0, 0, 1, 1,
0.3730314, -0.4770154, 2.206254, 1, 0, 0, 1, 1,
0.3739425, -0.08313639, 1.626048, 1, 0, 0, 1, 1,
0.3740414, 1.960243, -0.2136409, 1, 0, 0, 1, 1,
0.3748948, -1.290217, 3.904307, 0, 0, 0, 1, 1,
0.3772032, -2.076333, 2.292113, 0, 0, 0, 1, 1,
0.3825769, -0.6897684, 2.906757, 0, 0, 0, 1, 1,
0.3830788, -1.40581, 5.222372, 0, 0, 0, 1, 1,
0.3839423, 0.802183, 0.3251502, 0, 0, 0, 1, 1,
0.3853699, -2.950021, 2.572029, 0, 0, 0, 1, 1,
0.3875331, 0.5705124, 0.9710894, 0, 0, 0, 1, 1,
0.3908514, 1.623064, -2.299809, 1, 1, 1, 1, 1,
0.3974228, 0.4660283, 1.921515, 1, 1, 1, 1, 1,
0.3999796, -1.375228, 3.416957, 1, 1, 1, 1, 1,
0.4066526, 1.23946, 0.3025202, 1, 1, 1, 1, 1,
0.4080141, -0.5584963, 4.437605, 1, 1, 1, 1, 1,
0.4132429, 0.1978527, 1.706814, 1, 1, 1, 1, 1,
0.4133125, 0.2699728, 0.891875, 1, 1, 1, 1, 1,
0.4181323, 0.5213487, 0.6810787, 1, 1, 1, 1, 1,
0.4193232, 0.8572416, 2.393889, 1, 1, 1, 1, 1,
0.4204417, -1.620404, 1.557656, 1, 1, 1, 1, 1,
0.4231836, 0.4428221, -0.2126957, 1, 1, 1, 1, 1,
0.4239211, -0.7696313, 0.8733994, 1, 1, 1, 1, 1,
0.4253147, -0.2455416, 3.754865, 1, 1, 1, 1, 1,
0.425576, 1.423492, 0.6315788, 1, 1, 1, 1, 1,
0.4343131, 1.184892, 0.2615272, 1, 1, 1, 1, 1,
0.4353579, 0.03399915, 0.3936653, 0, 0, 1, 1, 1,
0.4381354, 1.121533, 1.056591, 1, 0, 0, 1, 1,
0.4410105, -0.4974022, 3.304822, 1, 0, 0, 1, 1,
0.4435786, 0.3801402, -1.034316, 1, 0, 0, 1, 1,
0.4492842, -0.5195827, 3.147774, 1, 0, 0, 1, 1,
0.4531555, 0.8402736, -0.5118773, 1, 0, 0, 1, 1,
0.4531658, -1.091964, 3.215522, 0, 0, 0, 1, 1,
0.4534949, -1.497895, 1.577647, 0, 0, 0, 1, 1,
0.4537154, -0.0002428627, 1.221616, 0, 0, 0, 1, 1,
0.456307, 0.1954382, -0.5093175, 0, 0, 0, 1, 1,
0.4625973, -1.130906, 3.088886, 0, 0, 0, 1, 1,
0.463765, 1.37433, 0.8563419, 0, 0, 0, 1, 1,
0.4649584, -0.4816268, 0.7797871, 0, 0, 0, 1, 1,
0.4725654, 0.1642985, 1.05215, 1, 1, 1, 1, 1,
0.4790503, 0.408238, -0.04511472, 1, 1, 1, 1, 1,
0.479407, -1.12765, 3.672063, 1, 1, 1, 1, 1,
0.4827338, 0.9247699, -0.2105886, 1, 1, 1, 1, 1,
0.4832202, 0.6631667, -1.280221, 1, 1, 1, 1, 1,
0.4847771, -1.074257, 2.30918, 1, 1, 1, 1, 1,
0.4865616, 1.205687, 0.3892364, 1, 1, 1, 1, 1,
0.4881617, -1.759059, 2.204126, 1, 1, 1, 1, 1,
0.4882548, 1.663751, 1.215784, 1, 1, 1, 1, 1,
0.4903738, 1.840626, 0.806218, 1, 1, 1, 1, 1,
0.4905144, -0.4886462, 3.769128, 1, 1, 1, 1, 1,
0.4918444, 1.18173, -0.2307243, 1, 1, 1, 1, 1,
0.4918616, 0.7812743, -2.018139e-05, 1, 1, 1, 1, 1,
0.4936037, -0.4090348, 2.019841, 1, 1, 1, 1, 1,
0.5013196, 0.3062063, -0.03241313, 1, 1, 1, 1, 1,
0.5078182, -1.192507, 2.142269, 0, 0, 1, 1, 1,
0.50982, -0.0723176, 0.1427449, 1, 0, 0, 1, 1,
0.511378, -0.4458104, 2.627853, 1, 0, 0, 1, 1,
0.5131323, -1.748156, 2.429132, 1, 0, 0, 1, 1,
0.5159386, 0.2869393, 2.551675, 1, 0, 0, 1, 1,
0.5186878, 0.6535473, 2.150566, 1, 0, 0, 1, 1,
0.5203961, -0.2805478, 2.193541, 0, 0, 0, 1, 1,
0.5226162, 0.9979537, -0.08545787, 0, 0, 0, 1, 1,
0.5257062, 0.8079819, 1.25915, 0, 0, 0, 1, 1,
0.5290743, -0.355881, 3.33434, 0, 0, 0, 1, 1,
0.5319779, -0.1938645, 2.413798, 0, 0, 0, 1, 1,
0.5355249, 0.4043648, 1.093097, 0, 0, 0, 1, 1,
0.5462694, 0.591124, 0.3540117, 0, 0, 0, 1, 1,
0.5463678, -0.007182758, 0.8823701, 1, 1, 1, 1, 1,
0.5485293, 0.4586622, 0.1753611, 1, 1, 1, 1, 1,
0.5517309, 0.9228392, 1.473867, 1, 1, 1, 1, 1,
0.554215, 0.7648501, 2.478251, 1, 1, 1, 1, 1,
0.5590088, 0.4527577, 1.256528, 1, 1, 1, 1, 1,
0.5603763, -2.054054, 2.355455, 1, 1, 1, 1, 1,
0.5608685, -0.007752119, 2.62148, 1, 1, 1, 1, 1,
0.5644561, 0.3648356, -0.0123713, 1, 1, 1, 1, 1,
0.5673954, 1.791913, -0.5232269, 1, 1, 1, 1, 1,
0.567872, -0.8845141, 2.848802, 1, 1, 1, 1, 1,
0.5686274, 0.7490441, 0.1963907, 1, 1, 1, 1, 1,
0.575738, -0.6874345, 3.453365, 1, 1, 1, 1, 1,
0.5807589, 0.1651273, -0.06654411, 1, 1, 1, 1, 1,
0.5867688, -0.4455678, 3.09623, 1, 1, 1, 1, 1,
0.5948647, -0.184928, 2.675228, 1, 1, 1, 1, 1,
0.5970854, -0.8182652, 2.131888, 0, 0, 1, 1, 1,
0.5992904, -0.02549142, 0.02629362, 1, 0, 0, 1, 1,
0.6025513, -0.3630497, 1.332369, 1, 0, 0, 1, 1,
0.6055287, -1.342274, 2.957003, 1, 0, 0, 1, 1,
0.6078505, -0.7987469, 1.981383, 1, 0, 0, 1, 1,
0.6145129, -2.060365, 2.218932, 1, 0, 0, 1, 1,
0.6198263, 0.8926001, 0.6774437, 0, 0, 0, 1, 1,
0.6225541, 0.7582668, 1.293942, 0, 0, 0, 1, 1,
0.6249287, -1.535987, 3.552813, 0, 0, 0, 1, 1,
0.6263946, 0.477986, 2.55823, 0, 0, 0, 1, 1,
0.6272398, -0.6034043, 3.186464, 0, 0, 0, 1, 1,
0.6348291, 0.2203953, 0.8969188, 0, 0, 0, 1, 1,
0.640236, -0.06573016, 0.9990212, 0, 0, 0, 1, 1,
0.6473845, -2.046427, 2.527038, 1, 1, 1, 1, 1,
0.6495218, -1.221445, 4.447067, 1, 1, 1, 1, 1,
0.6514474, -1.196357, 2.071754, 1, 1, 1, 1, 1,
0.6514558, 1.294771, 2.136634, 1, 1, 1, 1, 1,
0.6529809, -0.5907611, 0.6350422, 1, 1, 1, 1, 1,
0.6548778, 0.5748796, -0.59896, 1, 1, 1, 1, 1,
0.6620955, -0.1183552, 1.916714, 1, 1, 1, 1, 1,
0.6640822, 2.269371, 1.173012, 1, 1, 1, 1, 1,
0.6651119, -0.7388037, 2.327853, 1, 1, 1, 1, 1,
0.6742865, 0.175893, 2.158325, 1, 1, 1, 1, 1,
0.6758911, -0.6053839, 2.015414, 1, 1, 1, 1, 1,
0.6760704, 0.6409668, 0.1455619, 1, 1, 1, 1, 1,
0.6769104, -1.050644, 2.242187, 1, 1, 1, 1, 1,
0.6780096, 0.1562028, 2.266387, 1, 1, 1, 1, 1,
0.6789717, -1.265236, 1.850322, 1, 1, 1, 1, 1,
0.6815554, 0.6918705, 0.7797762, 0, 0, 1, 1, 1,
0.6821727, -1.76362, 5.138347, 1, 0, 0, 1, 1,
0.6823297, 0.1723266, 0.5245529, 1, 0, 0, 1, 1,
0.6876023, 1.846782, -1.341858, 1, 0, 0, 1, 1,
0.6884375, -0.2650244, 2.543089, 1, 0, 0, 1, 1,
0.6909462, -0.3991764, 2.078152, 1, 0, 0, 1, 1,
0.6952507, 0.5139329, 0.7821168, 0, 0, 0, 1, 1,
0.6958476, 1.224695, -0.7285934, 0, 0, 0, 1, 1,
0.6986939, 1.015687, 0.4427865, 0, 0, 0, 1, 1,
0.700717, 1.483818, 0.7735062, 0, 0, 0, 1, 1,
0.7086074, 0.4258644, 2.13648, 0, 0, 0, 1, 1,
0.7101948, 0.2097238, -0.1040382, 0, 0, 0, 1, 1,
0.7139236, 1.329912, 0.0405067, 0, 0, 0, 1, 1,
0.7210903, -1.177544, 2.152282, 1, 1, 1, 1, 1,
0.7236183, 0.8560901, 0.1133171, 1, 1, 1, 1, 1,
0.7286221, 0.8660927, 1.704971, 1, 1, 1, 1, 1,
0.7310017, -1.420979, 0.6842143, 1, 1, 1, 1, 1,
0.7415443, -0.5281086, 1.139885, 1, 1, 1, 1, 1,
0.7458264, -0.1026241, 2.741271, 1, 1, 1, 1, 1,
0.7458411, 0.4088144, 0.8414026, 1, 1, 1, 1, 1,
0.7475452, -0.8314486, 3.729334, 1, 1, 1, 1, 1,
0.7515243, 0.244671, 0.8433477, 1, 1, 1, 1, 1,
0.7517417, 0.1980302, 1.416082, 1, 1, 1, 1, 1,
0.754405, 1.465645, 1.746109, 1, 1, 1, 1, 1,
0.7555646, -1.218218, 2.274787, 1, 1, 1, 1, 1,
0.7566711, -1.267307, 2.168303, 1, 1, 1, 1, 1,
0.7579501, 1.207129, -0.8003663, 1, 1, 1, 1, 1,
0.7597218, -2.322954, 4.436099, 1, 1, 1, 1, 1,
0.7601802, 1.119222, -0.3818682, 0, 0, 1, 1, 1,
0.7649219, -0.8166127, 0.9373469, 1, 0, 0, 1, 1,
0.7745391, 0.3854835, 1.66133, 1, 0, 0, 1, 1,
0.7759645, 0.4512973, 1.577537, 1, 0, 0, 1, 1,
0.7770731, -0.2990742, 2.306219, 1, 0, 0, 1, 1,
0.7802682, 0.1150008, 2.054812, 1, 0, 0, 1, 1,
0.7805264, 0.5345992, 3.357577, 0, 0, 0, 1, 1,
0.7921108, 0.1239906, 1.404017, 0, 0, 0, 1, 1,
0.7921743, 0.4659082, 2.110542, 0, 0, 0, 1, 1,
0.7976406, 0.6191767, 0.09578693, 0, 0, 0, 1, 1,
0.7986079, -1.335973, 5.15817, 0, 0, 0, 1, 1,
0.8078407, -0.5810177, 3.091079, 0, 0, 0, 1, 1,
0.8105786, -0.5802917, 3.296299, 0, 0, 0, 1, 1,
0.8134435, -3.223084, 3.268957, 1, 1, 1, 1, 1,
0.817916, -0.8367103, 3.377242, 1, 1, 1, 1, 1,
0.8294401, -0.7299495, 2.588752, 1, 1, 1, 1, 1,
0.8313414, -0.6113787, 1.524269, 1, 1, 1, 1, 1,
0.8403046, 0.0526852, 1.389566, 1, 1, 1, 1, 1,
0.8428881, 1.285433, 1.153726, 1, 1, 1, 1, 1,
0.8440043, -0.6795551, 2.694863, 1, 1, 1, 1, 1,
0.8444287, 0.1307036, 0.3413114, 1, 1, 1, 1, 1,
0.853198, 0.533663, 0.9203838, 1, 1, 1, 1, 1,
0.8650827, -0.06490844, 3.147396, 1, 1, 1, 1, 1,
0.8674629, -0.2788559, 0.5443043, 1, 1, 1, 1, 1,
0.869021, -0.5211763, 1.15874, 1, 1, 1, 1, 1,
0.8707548, -0.03545609, 3.201842, 1, 1, 1, 1, 1,
0.8744307, 0.5415287, 0.9996291, 1, 1, 1, 1, 1,
0.8822669, -0.5604749, 2.131327, 1, 1, 1, 1, 1,
0.8928484, -0.6826973, 1.892861, 0, 0, 1, 1, 1,
0.8942341, -0.9184526, 2.646128, 1, 0, 0, 1, 1,
0.8956979, -0.1664306, 2.771064, 1, 0, 0, 1, 1,
0.8958378, -1.955323, 1.781127, 1, 0, 0, 1, 1,
0.9004405, 1.650112, -0.7110112, 1, 0, 0, 1, 1,
0.9064541, -0.2218486, 1.669596, 1, 0, 0, 1, 1,
0.9073836, 0.08129366, 2.873577, 0, 0, 0, 1, 1,
0.9113662, 0.7568516, 0.02475301, 0, 0, 0, 1, 1,
0.9194318, 0.580613, 0.3038782, 0, 0, 0, 1, 1,
0.9219584, -0.1823337, 0.8215651, 0, 0, 0, 1, 1,
0.9247381, -0.2852482, -0.1699206, 0, 0, 0, 1, 1,
0.9312079, 1.213858, -0.02057467, 0, 0, 0, 1, 1,
0.931583, 0.4652284, 0.5614987, 0, 0, 0, 1, 1,
0.9331629, -0.5809234, 3.109663, 1, 1, 1, 1, 1,
0.9434835, 0.3340076, 1.068105, 1, 1, 1, 1, 1,
0.9468304, 0.6967446, 0.3291895, 1, 1, 1, 1, 1,
0.9484115, 0.9663408, 2.505007, 1, 1, 1, 1, 1,
0.949676, -1.540078, 3.860808, 1, 1, 1, 1, 1,
0.9529653, 0.7216402, 1.42534, 1, 1, 1, 1, 1,
0.9557526, -0.4137654, -0.1938178, 1, 1, 1, 1, 1,
0.9577397, -0.5077798, -0.9683563, 1, 1, 1, 1, 1,
0.9620418, 0.1402887, 0.04218064, 1, 1, 1, 1, 1,
0.9711971, -1.00613, 3.046454, 1, 1, 1, 1, 1,
0.9729631, -0.118011, 1.771815, 1, 1, 1, 1, 1,
0.9754728, 0.9624425, 0.06514569, 1, 1, 1, 1, 1,
0.9800791, 0.1838817, 1.681684, 1, 1, 1, 1, 1,
0.9809546, 1.379429, -1.25282, 1, 1, 1, 1, 1,
0.9818925, -0.3955269, 1.369116, 1, 1, 1, 1, 1,
0.9830005, 1.6439, 0.3510389, 0, 0, 1, 1, 1,
0.9861559, -0.07085584, -0.09065594, 1, 0, 0, 1, 1,
0.9877254, 0.8361719, 1.040132, 1, 0, 0, 1, 1,
0.9977648, -0.3503017, 0.608547, 1, 0, 0, 1, 1,
0.9997184, -0.980469, 3.522593, 1, 0, 0, 1, 1,
1.005474, -1.691314, 1.406824, 1, 0, 0, 1, 1,
1.010372, 1.460712, 1.395029, 0, 0, 0, 1, 1,
1.021139, 0.3447686, 1.045087, 0, 0, 0, 1, 1,
1.024148, 0.5425171, 1.715513, 0, 0, 0, 1, 1,
1.028655, -0.1220504, -0.9227226, 0, 0, 0, 1, 1,
1.03385, 1.77159, 0.2963682, 0, 0, 0, 1, 1,
1.035671, 0.5928079, 2.125686, 0, 0, 0, 1, 1,
1.037057, 0.3291603, 1.438017, 0, 0, 0, 1, 1,
1.037195, -0.6564431, 2.383382, 1, 1, 1, 1, 1,
1.046232, -1.248692, 1.420338, 1, 1, 1, 1, 1,
1.053058, 0.4501531, 1.851041, 1, 1, 1, 1, 1,
1.058436, 0.4455968, 1.858954, 1, 1, 1, 1, 1,
1.071494, -0.139644, 2.336603, 1, 1, 1, 1, 1,
1.076217, -0.7314068, 1.981589, 1, 1, 1, 1, 1,
1.079663, 1.15238, 0.5196674, 1, 1, 1, 1, 1,
1.082339, -1.268, 2.680538, 1, 1, 1, 1, 1,
1.088852, 0.09867597, 1.812526, 1, 1, 1, 1, 1,
1.096516, 1.898304, 0.8359696, 1, 1, 1, 1, 1,
1.097204, 1.220026, 1.300467, 1, 1, 1, 1, 1,
1.111651, 0.4124971, 1.765094, 1, 1, 1, 1, 1,
1.118953, -1.102316, 2.80037, 1, 1, 1, 1, 1,
1.127874, 1.43469, 0.2679667, 1, 1, 1, 1, 1,
1.13243, 0.854601, 0.6299108, 1, 1, 1, 1, 1,
1.132462, -1.062558, 2.055422, 0, 0, 1, 1, 1,
1.134346, 0.6615813, -0.2091505, 1, 0, 0, 1, 1,
1.136675, 0.258112, 0.8359282, 1, 0, 0, 1, 1,
1.150964, 0.2762899, 0.5450474, 1, 0, 0, 1, 1,
1.15249, 0.02673912, 2.374953, 1, 0, 0, 1, 1,
1.155578, -1.049224, 0.7228502, 1, 0, 0, 1, 1,
1.155812, 0.1242097, 0.9070745, 0, 0, 0, 1, 1,
1.159502, -0.008170631, -0.9521842, 0, 0, 0, 1, 1,
1.15974, -0.9906117, 2.12128, 0, 0, 0, 1, 1,
1.163792, 0.444132, 2.61073, 0, 0, 0, 1, 1,
1.164189, 0.6590887, 1.294789, 0, 0, 0, 1, 1,
1.168685, -2.227939, 4.41131, 0, 0, 0, 1, 1,
1.172988, -0.5554308, -0.2098696, 0, 0, 0, 1, 1,
1.177537, -0.8023534, 3.053001, 1, 1, 1, 1, 1,
1.182966, -0.2634453, 2.118491, 1, 1, 1, 1, 1,
1.183962, -1.214447, 1.840256, 1, 1, 1, 1, 1,
1.201847, -0.3508219, 2.062016, 1, 1, 1, 1, 1,
1.204894, -1.834495, 3.047665, 1, 1, 1, 1, 1,
1.207564, 0.3302224, 0.6688157, 1, 1, 1, 1, 1,
1.2101, 1.849123, 0.5333558, 1, 1, 1, 1, 1,
1.222875, 0.6201259, -0.3702762, 1, 1, 1, 1, 1,
1.22428, -0.7086598, 0.7876974, 1, 1, 1, 1, 1,
1.232974, 0.2644438, 4.380949, 1, 1, 1, 1, 1,
1.240232, 0.2436902, 3.218915, 1, 1, 1, 1, 1,
1.240303, -0.3612976, 0.04258742, 1, 1, 1, 1, 1,
1.242251, 0.1725664, -0.3548805, 1, 1, 1, 1, 1,
1.243324, -0.4702551, 2.848035, 1, 1, 1, 1, 1,
1.249554, -0.5405236, 3.148279, 1, 1, 1, 1, 1,
1.252995, -0.8497333, 2.039546, 0, 0, 1, 1, 1,
1.255135, -1.452534, 1.276445, 1, 0, 0, 1, 1,
1.257654, -0.9193723, 1.545475, 1, 0, 0, 1, 1,
1.274958, 0.1948925, 3.488131, 1, 0, 0, 1, 1,
1.278226, 0.1262269, -0.4953884, 1, 0, 0, 1, 1,
1.280828, 1.237447, -0.2430778, 1, 0, 0, 1, 1,
1.287268, 1.567724, -0.4034697, 0, 0, 0, 1, 1,
1.305306, -0.6508997, 1.376954, 0, 0, 0, 1, 1,
1.307584, 1.077973, 2.217212, 0, 0, 0, 1, 1,
1.308318, -1.277794, 1.624669, 0, 0, 0, 1, 1,
1.313454, -0.6650076, 3.368062, 0, 0, 0, 1, 1,
1.315557, 0.417729, 0.8854197, 0, 0, 0, 1, 1,
1.318552, -0.7850826, 2.465801, 0, 0, 0, 1, 1,
1.324007, -0.5401461, 2.958872, 1, 1, 1, 1, 1,
1.342587, 0.9770077, 0.2876659, 1, 1, 1, 1, 1,
1.345548, 0.0673559, 1.35739, 1, 1, 1, 1, 1,
1.347615, 1.156851, 1.776142, 1, 1, 1, 1, 1,
1.358322, 0.6410641, 0.9769675, 1, 1, 1, 1, 1,
1.371685, 0.2695067, 3.49416, 1, 1, 1, 1, 1,
1.377208, -0.1026866, 2.090665, 1, 1, 1, 1, 1,
1.384678, 0.9262671, 1.788583, 1, 1, 1, 1, 1,
1.388199, 0.635106, 1.813092, 1, 1, 1, 1, 1,
1.390647, 0.9617037, 0.9242548, 1, 1, 1, 1, 1,
1.404098, 0.2185041, -1.93081, 1, 1, 1, 1, 1,
1.407375, 0.9463453, 1.370663, 1, 1, 1, 1, 1,
1.410022, 1.079724, 0.8579088, 1, 1, 1, 1, 1,
1.42518, -0.5186792, 1.001312, 1, 1, 1, 1, 1,
1.433273, 0.1926362, 1.224312, 1, 1, 1, 1, 1,
1.436166, 1.790926, 0.04362506, 0, 0, 1, 1, 1,
1.438669, -1.134789, 1.342132, 1, 0, 0, 1, 1,
1.442443, -0.3396708, 4.323785, 1, 0, 0, 1, 1,
1.44691, -0.3654308, 2.017751, 1, 0, 0, 1, 1,
1.456915, -0.6652294, 0.7344675, 1, 0, 0, 1, 1,
1.472852, -0.410343, 3.218166, 1, 0, 0, 1, 1,
1.495468, 0.7631922, 0.9924978, 0, 0, 0, 1, 1,
1.500522, 0.02851378, 2.115672, 0, 0, 0, 1, 1,
1.506132, -0.4478724, 1.381328, 0, 0, 0, 1, 1,
1.518418, 0.3697043, 2.316302, 0, 0, 0, 1, 1,
1.550992, 0.1702746, 0.5169765, 0, 0, 0, 1, 1,
1.558229, -1.44032, 2.159209, 0, 0, 0, 1, 1,
1.559508, 0.1717711, 1.722448, 0, 0, 0, 1, 1,
1.572348, -0.2702919, 1.837923, 1, 1, 1, 1, 1,
1.584311, 1.004231, -1.002658, 1, 1, 1, 1, 1,
1.58619, 0.1716495, 3.335423, 1, 1, 1, 1, 1,
1.589801, 1.836729, 1.121092, 1, 1, 1, 1, 1,
1.592462, 0.3676955, 2.771148, 1, 1, 1, 1, 1,
1.602014, 0.06492698, 2.399132, 1, 1, 1, 1, 1,
1.624313, 0.1203222, 1.495571, 1, 1, 1, 1, 1,
1.632807, 0.252943, 1.288276, 1, 1, 1, 1, 1,
1.635017, -1.112565, 1.689169, 1, 1, 1, 1, 1,
1.637857, 0.2299442, 2.099197, 1, 1, 1, 1, 1,
1.642419, 0.001239461, 3.011483, 1, 1, 1, 1, 1,
1.644609, -1.27402, 2.703382, 1, 1, 1, 1, 1,
1.644766, -0.2391867, 1.874645, 1, 1, 1, 1, 1,
1.651107, 0.1404772, 1.508612, 1, 1, 1, 1, 1,
1.66994, 1.075677, 0.7883368, 1, 1, 1, 1, 1,
1.672644, 0.8475564, 1.63403, 0, 0, 1, 1, 1,
1.679083, 0.1841267, 2.586572, 1, 0, 0, 1, 1,
1.699985, 0.1833609, 1.007977, 1, 0, 0, 1, 1,
1.714033, 0.9258086, 0.5460669, 1, 0, 0, 1, 1,
1.714197, -0.8579773, 1.635437, 1, 0, 0, 1, 1,
1.714524, 0.5264635, 3.222876, 1, 0, 0, 1, 1,
1.730407, -0.2399423, 1.386918, 0, 0, 0, 1, 1,
1.735129, 0.6492088, 1.367051, 0, 0, 0, 1, 1,
1.744563, -0.717432, 2.039482, 0, 0, 0, 1, 1,
1.75772, 1.136825, 1.633222, 0, 0, 0, 1, 1,
1.758157, 0.1137197, 2.349598, 0, 0, 0, 1, 1,
1.781228, 0.1261452, 1.04589, 0, 0, 0, 1, 1,
1.78231, -2.154546, 2.296853, 0, 0, 0, 1, 1,
1.7875, -0.1153287, 2.750794, 1, 1, 1, 1, 1,
1.789301, -0.8537995, 3.162297, 1, 1, 1, 1, 1,
1.789818, 0.3700867, 1.92398, 1, 1, 1, 1, 1,
1.792818, 1.175538, 1.245403, 1, 1, 1, 1, 1,
1.79611, 1.193843, 2.087955, 1, 1, 1, 1, 1,
1.803335, 0.1200782, 2.771381, 1, 1, 1, 1, 1,
1.816272, -0.517747, 0.6044216, 1, 1, 1, 1, 1,
1.827632, -0.7408893, 0.9616787, 1, 1, 1, 1, 1,
1.844462, -0.8305274, 1.441655, 1, 1, 1, 1, 1,
1.873425, 0.8491735, 0.8856154, 1, 1, 1, 1, 1,
1.893216, -0.02241726, 1.959254, 1, 1, 1, 1, 1,
1.898793, 0.9341369, 2.285331, 1, 1, 1, 1, 1,
1.899596, -0.0430726, 2.919754, 1, 1, 1, 1, 1,
1.908076, 0.682242, 0.3717176, 1, 1, 1, 1, 1,
1.923591, 0.2579339, 1.661855, 1, 1, 1, 1, 1,
1.934215, 0.2826834, 2.492258, 0, 0, 1, 1, 1,
1.942942, -0.2918912, 3.130053, 1, 0, 0, 1, 1,
1.94972, -0.7924635, 1.551884, 1, 0, 0, 1, 1,
1.976086, 0.03277514, 1.508891, 1, 0, 0, 1, 1,
2.0357, 0.56811, 1.368488, 1, 0, 0, 1, 1,
2.055055, -0.5292478, 0.9189944, 1, 0, 0, 1, 1,
2.059759, -2.262658, 1.868451, 0, 0, 0, 1, 1,
2.089284, -2.050007, 0.6819228, 0, 0, 0, 1, 1,
2.142507, 0.2874672, 2.071934, 0, 0, 0, 1, 1,
2.152851, -1.088038, 2.537365, 0, 0, 0, 1, 1,
2.166118, -0.8160654, -0.1552222, 0, 0, 0, 1, 1,
2.216086, -0.02673552, 1.498726, 0, 0, 0, 1, 1,
2.222868, 0.1379866, 1.97146, 0, 0, 0, 1, 1,
2.34995, 0.6167522, 2.16067, 1, 1, 1, 1, 1,
2.450805, -0.8421777, 2.434079, 1, 1, 1, 1, 1,
2.454001, 0.06129729, 2.321816, 1, 1, 1, 1, 1,
2.463486, -0.3324523, 2.546381, 1, 1, 1, 1, 1,
2.51026, 0.04169575, 1.115068, 1, 1, 1, 1, 1,
2.842402, 0.1700705, 0.7129455, 1, 1, 1, 1, 1,
2.861606, -1.692041, 2.196761, 1, 1, 1, 1, 1
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
var radius = 9.460473;
var distance = 33.22951;
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
mvMatrix.translate( 0.2159278, 0.4451462, -0.06400371 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22951);
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
