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
-3.202081, -0.1131041, -1.154262, 1, 0, 0, 1,
-2.65577, -0.1911692, -1.804975, 1, 0.007843138, 0, 1,
-2.642334, 2.299989, 0.4736215, 1, 0.01176471, 0, 1,
-2.491077, -1.151719, -2.175742, 1, 0.01960784, 0, 1,
-2.486145, -0.8584675, -3.606408, 1, 0.02352941, 0, 1,
-2.45525, 0.9459551, -1.53824, 1, 0.03137255, 0, 1,
-2.286869, 0.1145426, -1.943402, 1, 0.03529412, 0, 1,
-2.279993, 0.07219761, -3.154799, 1, 0.04313726, 0, 1,
-2.272545, -1.531422, -3.804716, 1, 0.04705882, 0, 1,
-2.255049, 0.3221691, -1.045941, 1, 0.05490196, 0, 1,
-2.176014, 0.2726788, -0.8159382, 1, 0.05882353, 0, 1,
-2.170249, -0.1233689, -1.024103, 1, 0.06666667, 0, 1,
-2.166816, 1.065339, -1.168384, 1, 0.07058824, 0, 1,
-2.162144, -0.3800109, -1.438, 1, 0.07843138, 0, 1,
-2.158607, -0.7712926, 0.01122354, 1, 0.08235294, 0, 1,
-2.146959, 0.5512257, -1.445348, 1, 0.09019608, 0, 1,
-2.079455, -0.5136005, -3.982906, 1, 0.09411765, 0, 1,
-2.072713, 0.9734629, -1.694227, 1, 0.1019608, 0, 1,
-2.05532, -1.149344, -1.961379, 1, 0.1098039, 0, 1,
-2.036234, -0.3880954, -1.542, 1, 0.1137255, 0, 1,
-1.967816, -0.2237869, -2.000478, 1, 0.1215686, 0, 1,
-1.960522, 0.1465306, 0.06031032, 1, 0.1254902, 0, 1,
-1.959734, -1.503192, -3.714835, 1, 0.1333333, 0, 1,
-1.951624, 0.6367178, -0.8970032, 1, 0.1372549, 0, 1,
-1.951134, -0.4653242, -1.631137, 1, 0.145098, 0, 1,
-1.940461, 0.04287918, -2.430838, 1, 0.1490196, 0, 1,
-1.883911, 0.2372762, -1.336369, 1, 0.1568628, 0, 1,
-1.870237, -0.7753947, -4.211051, 1, 0.1607843, 0, 1,
-1.867239, 0.8437033, -2.506767, 1, 0.1686275, 0, 1,
-1.854318, -0.8954273, -1.934215, 1, 0.172549, 0, 1,
-1.849392, -1.126119, -0.8484489, 1, 0.1803922, 0, 1,
-1.839434, 0.9658895, -1.460859, 1, 0.1843137, 0, 1,
-1.829859, 0.4974151, -0.5483015, 1, 0.1921569, 0, 1,
-1.798061, 2.658416, -1.259879, 1, 0.1960784, 0, 1,
-1.781566, 0.5349981, -1.795098, 1, 0.2039216, 0, 1,
-1.776018, -0.1533958, -0.7949141, 1, 0.2117647, 0, 1,
-1.772416, 0.1695862, -2.52553, 1, 0.2156863, 0, 1,
-1.749282, 1.099813, -1.298867, 1, 0.2235294, 0, 1,
-1.74159, 0.5581711, -0.6308965, 1, 0.227451, 0, 1,
-1.739079, -0.8875791, -2.556797, 1, 0.2352941, 0, 1,
-1.734781, -0.6337522, -3.307668, 1, 0.2392157, 0, 1,
-1.732815, 0.8966923, -1.92448, 1, 0.2470588, 0, 1,
-1.703847, 0.05375379, -0.3943302, 1, 0.2509804, 0, 1,
-1.694881, 0.02485528, -1.973886, 1, 0.2588235, 0, 1,
-1.673722, 0.2686756, -2.24943, 1, 0.2627451, 0, 1,
-1.668244, -1.589392, -4.034411, 1, 0.2705882, 0, 1,
-1.653861, 0.1627695, -1.234962, 1, 0.2745098, 0, 1,
-1.646988, 1.645572, 0.8052755, 1, 0.282353, 0, 1,
-1.641012, -1.649464, -1.000471, 1, 0.2862745, 0, 1,
-1.636088, 2.08973, 0.6394105, 1, 0.2941177, 0, 1,
-1.606845, 1.676972, -1.225948, 1, 0.3019608, 0, 1,
-1.593075, 0.3866885, -2.693472, 1, 0.3058824, 0, 1,
-1.573298, 2.445874, -1.11952, 1, 0.3137255, 0, 1,
-1.571518, 0.2719982, -1.038883, 1, 0.3176471, 0, 1,
-1.566948, 0.146727, -1.609915, 1, 0.3254902, 0, 1,
-1.547486, -0.2412179, -1.528267, 1, 0.3294118, 0, 1,
-1.530711, -0.3217005, -3.301847, 1, 0.3372549, 0, 1,
-1.528406, 0.5283735, -1.442019, 1, 0.3411765, 0, 1,
-1.523219, 1.120418, -1.160012, 1, 0.3490196, 0, 1,
-1.521606, -0.2311269, -1.222636, 1, 0.3529412, 0, 1,
-1.514636, 0.7643225, -2.811155, 1, 0.3607843, 0, 1,
-1.507337, 0.2417863, -0.836655, 1, 0.3647059, 0, 1,
-1.501283, -0.543385, -2.744872, 1, 0.372549, 0, 1,
-1.476035, -1.600283, -3.016167, 1, 0.3764706, 0, 1,
-1.475228, -0.8604724, -3.358708, 1, 0.3843137, 0, 1,
-1.46761, 0.3389907, -0.833037, 1, 0.3882353, 0, 1,
-1.465331, 0.3209311, -2.512697, 1, 0.3960784, 0, 1,
-1.448799, -1.914968, -3.250479, 1, 0.4039216, 0, 1,
-1.444768, 0.9082663, -1.138726, 1, 0.4078431, 0, 1,
-1.436128, -1.61647, -0.747295, 1, 0.4156863, 0, 1,
-1.427552, -0.4769498, -3.093858, 1, 0.4196078, 0, 1,
-1.418424, -0.8373423, -1.804276, 1, 0.427451, 0, 1,
-1.407666, 1.293206, -0.6643849, 1, 0.4313726, 0, 1,
-1.407658, 0.01815191, -2.16825, 1, 0.4392157, 0, 1,
-1.40462, 1.047858, -0.440836, 1, 0.4431373, 0, 1,
-1.403886, -0.3791756, -2.431945, 1, 0.4509804, 0, 1,
-1.402726, -1.079061, -0.9547914, 1, 0.454902, 0, 1,
-1.364385, -0.6684754, -2.624027, 1, 0.4627451, 0, 1,
-1.356599, 1.574708, -0.008400716, 1, 0.4666667, 0, 1,
-1.352003, -1.125289, -0.6826751, 1, 0.4745098, 0, 1,
-1.347353, -2.072082, -2.678848, 1, 0.4784314, 0, 1,
-1.344895, -0.04239394, -2.505157, 1, 0.4862745, 0, 1,
-1.336469, -1.24633, -1.204878, 1, 0.4901961, 0, 1,
-1.333888, 0.1592164, -1.410462, 1, 0.4980392, 0, 1,
-1.303702, 0.1760184, -2.425711, 1, 0.5058824, 0, 1,
-1.296017, 0.6436919, -0.5425998, 1, 0.509804, 0, 1,
-1.291128, 1.038371, -0.983389, 1, 0.5176471, 0, 1,
-1.27324, 0.8065121, -2.560021, 1, 0.5215687, 0, 1,
-1.270762, -0.5597844, -1.594193, 1, 0.5294118, 0, 1,
-1.268484, -1.227825, -2.80278, 1, 0.5333334, 0, 1,
-1.247794, -0.5187984, -0.9999477, 1, 0.5411765, 0, 1,
-1.2436, 1.201462, 0.2147531, 1, 0.5450981, 0, 1,
-1.239682, 1.037312, -0.6414847, 1, 0.5529412, 0, 1,
-1.2392, 0.7036718, -0.7443516, 1, 0.5568628, 0, 1,
-1.237273, 1.043758, -0.5990275, 1, 0.5647059, 0, 1,
-1.234848, -0.8207856, -3.432592, 1, 0.5686275, 0, 1,
-1.233414, -1.227344, -0.9822221, 1, 0.5764706, 0, 1,
-1.210684, 0.2123874, -3.401892, 1, 0.5803922, 0, 1,
-1.210227, -0.5551688, -1.570474, 1, 0.5882353, 0, 1,
-1.195276, 0.02831685, -0.5403202, 1, 0.5921569, 0, 1,
-1.193964, 1.47622, 1.266083, 1, 0.6, 0, 1,
-1.193607, 1.425891, 0.1823331, 1, 0.6078432, 0, 1,
-1.188648, -1.288463, -3.190788, 1, 0.6117647, 0, 1,
-1.182354, 0.7248717, -1.212095, 1, 0.6196079, 0, 1,
-1.179218, 0.6321626, -0.8569015, 1, 0.6235294, 0, 1,
-1.179044, -1.377773, -1.163812, 1, 0.6313726, 0, 1,
-1.170868, -0.2263811, -1.055471, 1, 0.6352941, 0, 1,
-1.170453, 1.230461, -1.585359, 1, 0.6431373, 0, 1,
-1.145958, 1.288161, -1.077303, 1, 0.6470588, 0, 1,
-1.145863, 0.119296, -2.740031, 1, 0.654902, 0, 1,
-1.145088, 0.252075, -1.83496, 1, 0.6588235, 0, 1,
-1.137017, 0.6203029, 1.970842, 1, 0.6666667, 0, 1,
-1.130734, 0.1041517, -1.165472, 1, 0.6705883, 0, 1,
-1.129414, -1.249633, -1.817499, 1, 0.6784314, 0, 1,
-1.125592, -0.3683732, -2.151268, 1, 0.682353, 0, 1,
-1.125384, 1.038509, 0.1966631, 1, 0.6901961, 0, 1,
-1.120937, -0.4961819, -3.115165, 1, 0.6941177, 0, 1,
-1.118781, -0.1289724, -2.264046, 1, 0.7019608, 0, 1,
-1.116401, -0.168515, -1.94679, 1, 0.7098039, 0, 1,
-1.11037, -2.400493, -1.980158, 1, 0.7137255, 0, 1,
-1.110283, 0.9690267, -1.612041, 1, 0.7215686, 0, 1,
-1.105793, -0.1544884, -2.798798, 1, 0.7254902, 0, 1,
-1.103166, -0.3281913, -1.123589, 1, 0.7333333, 0, 1,
-1.100594, -0.9123029, -1.755312, 1, 0.7372549, 0, 1,
-1.099104, -1.954062, -3.295972, 1, 0.7450981, 0, 1,
-1.098687, 0.376334, -1.218083, 1, 0.7490196, 0, 1,
-1.097882, -1.630783, -2.595407, 1, 0.7568628, 0, 1,
-1.094268, -0.7326868, -2.539794, 1, 0.7607843, 0, 1,
-1.090967, -0.5037235, -1.688751, 1, 0.7686275, 0, 1,
-1.086479, -0.3909512, -1.9723, 1, 0.772549, 0, 1,
-1.08258, 1.176292, 0.1800993, 1, 0.7803922, 0, 1,
-1.080549, -0.2838047, -2.513971, 1, 0.7843137, 0, 1,
-1.074416, 0.242508, -2.302001, 1, 0.7921569, 0, 1,
-1.06881, -0.8641074, -2.834721, 1, 0.7960784, 0, 1,
-1.067604, 0.458431, -1.28861, 1, 0.8039216, 0, 1,
-1.063265, -0.9644508, -3.027503, 1, 0.8117647, 0, 1,
-1.059433, 0.2048943, -1.345319, 1, 0.8156863, 0, 1,
-1.057198, 0.6190788, -1.093858, 1, 0.8235294, 0, 1,
-1.056199, 0.02082691, -2.37942, 1, 0.827451, 0, 1,
-1.055419, -0.9494247, -2.216402, 1, 0.8352941, 0, 1,
-1.05528, -2.33094, -3.34042, 1, 0.8392157, 0, 1,
-1.052079, -0.873854, -5.540185, 1, 0.8470588, 0, 1,
-1.049479, 0.5653687, -1.4612, 1, 0.8509804, 0, 1,
-1.042835, -0.2610347, -1.728257, 1, 0.8588235, 0, 1,
-1.038494, -0.6627344, -2.709745, 1, 0.8627451, 0, 1,
-1.034103, -0.6822431, -0.9204338, 1, 0.8705882, 0, 1,
-1.031793, 1.597377, -2.187013, 1, 0.8745098, 0, 1,
-1.029168, 0.2406491, -1.881505, 1, 0.8823529, 0, 1,
-1.027747, -1.027765, -3.052441, 1, 0.8862745, 0, 1,
-1.02569, 1.235682, -0.2756092, 1, 0.8941177, 0, 1,
-1.024933, 0.8329864, -0.4358063, 1, 0.8980392, 0, 1,
-1.012462, 0.1710136, -1.715311, 1, 0.9058824, 0, 1,
-1.006744, 1.332788, -1.401012, 1, 0.9137255, 0, 1,
-1.005892, 0.2679026, -0.9703846, 1, 0.9176471, 0, 1,
-0.9981491, -0.7289702, -2.98817, 1, 0.9254902, 0, 1,
-0.9948519, -1.717797, -4.182638, 1, 0.9294118, 0, 1,
-0.9927709, -0.02525701, -2.387504, 1, 0.9372549, 0, 1,
-0.9858081, -0.4380517, -1.89213, 1, 0.9411765, 0, 1,
-0.9775036, 0.1105371, 0.05119766, 1, 0.9490196, 0, 1,
-0.9773437, 0.7821011, 0.1903384, 1, 0.9529412, 0, 1,
-0.9769011, -0.5512555, -1.80512, 1, 0.9607843, 0, 1,
-0.976751, 0.1459269, -0.5062631, 1, 0.9647059, 0, 1,
-0.9746706, -0.1041325, -1.906156, 1, 0.972549, 0, 1,
-0.9628813, -1.313931, -2.172479, 1, 0.9764706, 0, 1,
-0.9585767, 2.117132, -0.5675348, 1, 0.9843137, 0, 1,
-0.957683, 0.2113288, -1.539583, 1, 0.9882353, 0, 1,
-0.9550383, 1.106594, -1.363818, 1, 0.9960784, 0, 1,
-0.9535455, 1.569658, -0.3824982, 0.9960784, 1, 0, 1,
-0.953278, 1.220602, 0.9723579, 0.9921569, 1, 0, 1,
-0.9439155, 0.785333, 0.05196407, 0.9843137, 1, 0, 1,
-0.9432671, -1.079295, -1.17596, 0.9803922, 1, 0, 1,
-0.9369728, -0.204186, -2.604595, 0.972549, 1, 0, 1,
-0.9295629, 0.5559731, 0.03591525, 0.9686275, 1, 0, 1,
-0.9283631, 0.1818761, -1.842383, 0.9607843, 1, 0, 1,
-0.9250345, 0.1552494, -0.2079765, 0.9568627, 1, 0, 1,
-0.9238829, 0.8857557, -1.258325, 0.9490196, 1, 0, 1,
-0.9156832, -0.7061481, -1.698586, 0.945098, 1, 0, 1,
-0.9034052, 0.6986499, -0.9568428, 0.9372549, 1, 0, 1,
-0.8903696, 0.379462, -0.6223903, 0.9333333, 1, 0, 1,
-0.8868222, -1.143743, -1.568462, 0.9254902, 1, 0, 1,
-0.8785777, 1.131814, -2.751038, 0.9215686, 1, 0, 1,
-0.8734253, -0.9167733, -1.441928, 0.9137255, 1, 0, 1,
-0.871635, -0.6402697, -2.36992, 0.9098039, 1, 0, 1,
-0.8688713, 0.5728933, -1.824029, 0.9019608, 1, 0, 1,
-0.8652009, -0.1389872, -1.753254, 0.8941177, 1, 0, 1,
-0.8651115, 0.08174994, -3.004229, 0.8901961, 1, 0, 1,
-0.8602304, -0.6685481, -1.795469, 0.8823529, 1, 0, 1,
-0.8584137, -0.7154784, -1.258407, 0.8784314, 1, 0, 1,
-0.8501922, 1.001721, -0.07037076, 0.8705882, 1, 0, 1,
-0.8491319, -0.2150195, 1.19047, 0.8666667, 1, 0, 1,
-0.8444505, -1.521087, -1.382879, 0.8588235, 1, 0, 1,
-0.8418373, -0.3155749, -1.988467, 0.854902, 1, 0, 1,
-0.8346776, -2.510205, -2.696772, 0.8470588, 1, 0, 1,
-0.8342965, 0.2093245, 0.4007409, 0.8431373, 1, 0, 1,
-0.8292117, -2.11972, -3.149259, 0.8352941, 1, 0, 1,
-0.8287409, 0.7355902, -3.200969, 0.8313726, 1, 0, 1,
-0.8226349, 1.09882, -0.4292097, 0.8235294, 1, 0, 1,
-0.8138618, 0.1199736, 0.432696, 0.8196079, 1, 0, 1,
-0.8090627, 0.2255192, 0.01960885, 0.8117647, 1, 0, 1,
-0.8073372, -0.90053, -3.042005, 0.8078431, 1, 0, 1,
-0.8064025, 0.7924541, -1.63979, 0.8, 1, 0, 1,
-0.8020745, -0.5711005, -3.614815, 0.7921569, 1, 0, 1,
-0.7931257, 0.731984, -1.620179, 0.7882353, 1, 0, 1,
-0.7922821, -0.0050532, -3.089412, 0.7803922, 1, 0, 1,
-0.7921774, -0.8024532, -2.237034, 0.7764706, 1, 0, 1,
-0.7872901, 1.905351, 0.1457761, 0.7686275, 1, 0, 1,
-0.78668, 1.811928, 1.216526, 0.7647059, 1, 0, 1,
-0.7803951, -1.189044, -3.692713, 0.7568628, 1, 0, 1,
-0.7748175, 1.054963, -0.2174909, 0.7529412, 1, 0, 1,
-0.7703689, 0.009793879, -0.8550931, 0.7450981, 1, 0, 1,
-0.7684478, -1.433641, -4.937236, 0.7411765, 1, 0, 1,
-0.7569578, 0.8021268, -1.16042, 0.7333333, 1, 0, 1,
-0.7535008, 0.8366343, -0.211517, 0.7294118, 1, 0, 1,
-0.7524489, 1.482518, -2.0322, 0.7215686, 1, 0, 1,
-0.7481288, 2.166151, 0.8719594, 0.7176471, 1, 0, 1,
-0.7429448, -0.5620286, -3.38611, 0.7098039, 1, 0, 1,
-0.7265854, -0.6209836, -2.588496, 0.7058824, 1, 0, 1,
-0.7253502, 0.8058649, -1.18487, 0.6980392, 1, 0, 1,
-0.7195228, 0.7494064, -2.13984, 0.6901961, 1, 0, 1,
-0.7193547, 0.5543787, -0.8160005, 0.6862745, 1, 0, 1,
-0.7177001, 1.219174, -0.3006281, 0.6784314, 1, 0, 1,
-0.7160351, -0.5360014, -1.723081, 0.6745098, 1, 0, 1,
-0.7143132, 0.7449847, 0.03071112, 0.6666667, 1, 0, 1,
-0.7123774, 0.9071906, -0.2545254, 0.6627451, 1, 0, 1,
-0.7060687, 0.1705889, 0.2394964, 0.654902, 1, 0, 1,
-0.7051114, -1.187526, -3.250633, 0.6509804, 1, 0, 1,
-0.7047235, -2.041852, -1.57299, 0.6431373, 1, 0, 1,
-0.7018219, 0.8515348, 0.6374894, 0.6392157, 1, 0, 1,
-0.6956334, 0.2437716, -1.483809, 0.6313726, 1, 0, 1,
-0.6945674, 0.1548541, -2.564007, 0.627451, 1, 0, 1,
-0.6941988, 0.8645279, -2.086156, 0.6196079, 1, 0, 1,
-0.6928053, 0.1149128, -0.3616905, 0.6156863, 1, 0, 1,
-0.690896, 0.3740823, 0.8465185, 0.6078432, 1, 0, 1,
-0.6865665, 1.484416, -0.7399188, 0.6039216, 1, 0, 1,
-0.6845009, -0.2974136, -1.056274, 0.5960785, 1, 0, 1,
-0.6820836, 0.7562141, -1.002176, 0.5882353, 1, 0, 1,
-0.6789415, -0.582095, -2.398253, 0.5843138, 1, 0, 1,
-0.6737205, -1.717297, -0.7752133, 0.5764706, 1, 0, 1,
-0.6720223, 0.2245441, -0.5089255, 0.572549, 1, 0, 1,
-0.6703683, -0.3418172, -1.1319, 0.5647059, 1, 0, 1,
-0.665319, -1.239137, -4.229482, 0.5607843, 1, 0, 1,
-0.6649783, -0.4877901, -0.9784035, 0.5529412, 1, 0, 1,
-0.6644887, -0.9163709, -0.795898, 0.5490196, 1, 0, 1,
-0.6551324, 0.8887341, -1.279609, 0.5411765, 1, 0, 1,
-0.6545473, -1.288107, -3.956323, 0.5372549, 1, 0, 1,
-0.6534398, 0.3151199, -1.902208, 0.5294118, 1, 0, 1,
-0.6462741, 0.7557561, -1.573052, 0.5254902, 1, 0, 1,
-0.6439177, -0.1085312, -0.5591092, 0.5176471, 1, 0, 1,
-0.6429849, 0.9463086, -2.09885, 0.5137255, 1, 0, 1,
-0.641969, 0.1673582, -1.473894, 0.5058824, 1, 0, 1,
-0.6410631, 0.4418999, -1.241899, 0.5019608, 1, 0, 1,
-0.6408129, 0.3308228, -1.045348, 0.4941176, 1, 0, 1,
-0.637767, 0.9248339, -1.474496, 0.4862745, 1, 0, 1,
-0.6359065, 0.4555834, -1.840245, 0.4823529, 1, 0, 1,
-0.6356189, -0.2323312, -2.319557, 0.4745098, 1, 0, 1,
-0.633058, 0.9875013, 0.2178974, 0.4705882, 1, 0, 1,
-0.6279767, -0.5112212, -0.7419462, 0.4627451, 1, 0, 1,
-0.6271608, -0.227093, 0.6759568, 0.4588235, 1, 0, 1,
-0.6262314, 0.2680059, -1.578292, 0.4509804, 1, 0, 1,
-0.6252496, 0.2009376, -1.091721, 0.4470588, 1, 0, 1,
-0.6248817, 1.155987, -0.254689, 0.4392157, 1, 0, 1,
-0.6244052, -0.05180924, -0.1301537, 0.4352941, 1, 0, 1,
-0.6205972, -0.319914, -0.6941169, 0.427451, 1, 0, 1,
-0.6198428, -1.789498, -3.89519, 0.4235294, 1, 0, 1,
-0.6178273, 0.3606153, 0.7721044, 0.4156863, 1, 0, 1,
-0.61652, -0.7446252, -1.637161, 0.4117647, 1, 0, 1,
-0.6053969, -0.2691328, -0.4349231, 0.4039216, 1, 0, 1,
-0.6048906, 0.7447224, -0.2673043, 0.3960784, 1, 0, 1,
-0.6047024, 1.146793, -1.291682, 0.3921569, 1, 0, 1,
-0.5905488, -0.08147801, -0.9745317, 0.3843137, 1, 0, 1,
-0.5755762, -1.067464, -2.352359, 0.3803922, 1, 0, 1,
-0.5741217, 1.114947, -0.07651347, 0.372549, 1, 0, 1,
-0.5733297, -0.4727172, -4.137951, 0.3686275, 1, 0, 1,
-0.5727657, 0.396312, -2.567569, 0.3607843, 1, 0, 1,
-0.5727385, 1.241909, -1.051415, 0.3568628, 1, 0, 1,
-0.5725332, 0.4687183, -0.6761509, 0.3490196, 1, 0, 1,
-0.5712089, 0.2751764, -0.473022, 0.345098, 1, 0, 1,
-0.566896, 1.956189, -1.132061, 0.3372549, 1, 0, 1,
-0.5643012, 1.191476, 0.2626688, 0.3333333, 1, 0, 1,
-0.5635478, -0.7773816, -1.293549, 0.3254902, 1, 0, 1,
-0.5609918, -0.7316151, -0.6447822, 0.3215686, 1, 0, 1,
-0.5598801, 0.4242532, 0.2915171, 0.3137255, 1, 0, 1,
-0.5582296, 0.9090082, -0.9351457, 0.3098039, 1, 0, 1,
-0.5577413, -1.0116, -3.923083, 0.3019608, 1, 0, 1,
-0.5569278, 0.5787692, -1.815951, 0.2941177, 1, 0, 1,
-0.5557612, -0.8986658, -2.104998, 0.2901961, 1, 0, 1,
-0.5498899, 0.5700451, 0.6134542, 0.282353, 1, 0, 1,
-0.5463116, 2.666598, -1.032562, 0.2784314, 1, 0, 1,
-0.5445115, -0.6077837, -2.395774, 0.2705882, 1, 0, 1,
-0.5411685, -1.609127, -1.581596, 0.2666667, 1, 0, 1,
-0.532542, 0.479177, -1.13562, 0.2588235, 1, 0, 1,
-0.5211354, -0.02071005, -1.566415, 0.254902, 1, 0, 1,
-0.5211344, 0.5670219, 2.228436, 0.2470588, 1, 0, 1,
-0.5208569, -1.065584, -2.32164, 0.2431373, 1, 0, 1,
-0.5191468, -1.247541, -4.395601, 0.2352941, 1, 0, 1,
-0.5138285, 0.2598384, -0.7855368, 0.2313726, 1, 0, 1,
-0.5118736, 0.9828321, 0.781399, 0.2235294, 1, 0, 1,
-0.509611, 1.043168, 0.03282924, 0.2196078, 1, 0, 1,
-0.5087532, 0.181985, -0.2397993, 0.2117647, 1, 0, 1,
-0.4923875, 1.687964, -0.2942621, 0.2078431, 1, 0, 1,
-0.4915114, 0.9882228, 0.4279552, 0.2, 1, 0, 1,
-0.4907283, 0.8680754, 0.2460936, 0.1921569, 1, 0, 1,
-0.4887748, 0.8478092, -0.5287814, 0.1882353, 1, 0, 1,
-0.485685, 0.1670552, -1.071997, 0.1803922, 1, 0, 1,
-0.4849821, 0.09233348, -3.027421, 0.1764706, 1, 0, 1,
-0.482327, 0.4911947, -1.915547, 0.1686275, 1, 0, 1,
-0.4800702, -1.957029, -4.151359, 0.1647059, 1, 0, 1,
-0.4709832, -0.9102873, -3.338203, 0.1568628, 1, 0, 1,
-0.4703474, 0.1951124, -1.616466, 0.1529412, 1, 0, 1,
-0.4679497, 0.03365082, -3.898146, 0.145098, 1, 0, 1,
-0.4588304, 0.9099132, -0.5576288, 0.1411765, 1, 0, 1,
-0.4560638, -0.6361095, -2.389849, 0.1333333, 1, 0, 1,
-0.450655, 0.9031705, -0.9416951, 0.1294118, 1, 0, 1,
-0.4403467, 1.242517, 0.659663, 0.1215686, 1, 0, 1,
-0.4391329, -1.782296, -2.684524, 0.1176471, 1, 0, 1,
-0.4366405, 1.177667, -0.8403653, 0.1098039, 1, 0, 1,
-0.4357958, 0.5184128, 0.2141473, 0.1058824, 1, 0, 1,
-0.4348306, 0.7140847, -0.02661872, 0.09803922, 1, 0, 1,
-0.4342811, -0.522646, -2.023531, 0.09019608, 1, 0, 1,
-0.4315629, -1.656358, -4.685018, 0.08627451, 1, 0, 1,
-0.4308451, -0.5806352, -1.388244, 0.07843138, 1, 0, 1,
-0.430456, 0.03217883, -0.3131832, 0.07450981, 1, 0, 1,
-0.4278026, 0.635032, -0.6254756, 0.06666667, 1, 0, 1,
-0.4270995, -0.7790756, -4.083091, 0.0627451, 1, 0, 1,
-0.4242958, 0.08310532, -1.377948, 0.05490196, 1, 0, 1,
-0.4240415, -1.980753, -3.652079, 0.05098039, 1, 0, 1,
-0.4216855, 0.8568815, -1.345705, 0.04313726, 1, 0, 1,
-0.4190782, -0.0428999, -1.814098, 0.03921569, 1, 0, 1,
-0.4188309, -1.165507, -3.133168, 0.03137255, 1, 0, 1,
-0.4173345, -0.1634186, -2.038456, 0.02745098, 1, 0, 1,
-0.4134175, 0.1393504, -1.373564, 0.01960784, 1, 0, 1,
-0.4107033, -1.085891, -1.364264, 0.01568628, 1, 0, 1,
-0.4068069, -0.1816038, -2.10697, 0.007843138, 1, 0, 1,
-0.3982507, 0.1974648, -3.022313, 0.003921569, 1, 0, 1,
-0.3950917, 0.6951168, -1.796832, 0, 1, 0.003921569, 1,
-0.3910918, -0.4261179, -3.88457, 0, 1, 0.01176471, 1,
-0.3893697, 0.4479375, -0.2426245, 0, 1, 0.01568628, 1,
-0.3888428, -1.926975, -2.127205, 0, 1, 0.02352941, 1,
-0.3883578, -0.3054366, -2.860124, 0, 1, 0.02745098, 1,
-0.3875935, 0.9411002, -1.091662, 0, 1, 0.03529412, 1,
-0.3847998, -0.8095919, -3.321581, 0, 1, 0.03921569, 1,
-0.3841835, -0.2209579, -1.75222, 0, 1, 0.04705882, 1,
-0.3832152, 0.585142, -0.8018574, 0, 1, 0.05098039, 1,
-0.3828046, 0.4009295, -1.523649, 0, 1, 0.05882353, 1,
-0.3790017, 0.835013, -1.014991, 0, 1, 0.0627451, 1,
-0.3782495, -0.09221904, -2.214182, 0, 1, 0.07058824, 1,
-0.3766793, -0.03455295, -1.519495, 0, 1, 0.07450981, 1,
-0.375989, 3.113253, -1.18308, 0, 1, 0.08235294, 1,
-0.3755216, -0.4100386, -1.527524, 0, 1, 0.08627451, 1,
-0.3744599, -1.011113, -3.858879, 0, 1, 0.09411765, 1,
-0.3727841, 0.6192454, 0.9610696, 0, 1, 0.1019608, 1,
-0.3707356, -1.302493, -2.908036, 0, 1, 0.1058824, 1,
-0.3681723, -1.203602, -4.980565, 0, 1, 0.1137255, 1,
-0.3673149, -1.224329, -2.435353, 0, 1, 0.1176471, 1,
-0.3634941, -0.4987928, -1.020872, 0, 1, 0.1254902, 1,
-0.3625985, -2.07386, -2.146089, 0, 1, 0.1294118, 1,
-0.3616034, 1.394236, 0.1424371, 0, 1, 0.1372549, 1,
-0.3558429, 0.4875152, -0.2034387, 0, 1, 0.1411765, 1,
-0.3525411, -0.0822081, -0.9062505, 0, 1, 0.1490196, 1,
-0.3494587, -0.439445, -1.883087, 0, 1, 0.1529412, 1,
-0.3414496, 0.8701274, -1.337039, 0, 1, 0.1607843, 1,
-0.3332941, 1.289192, -1.489871, 0, 1, 0.1647059, 1,
-0.3326676, -0.1792316, -3.048994, 0, 1, 0.172549, 1,
-0.3313257, -0.1053173, -3.062169, 0, 1, 0.1764706, 1,
-0.3269064, -0.6748151, -3.813767, 0, 1, 0.1843137, 1,
-0.3243351, -0.5180062, -1.933746, 0, 1, 0.1882353, 1,
-0.3213004, -1.819361, -2.568631, 0, 1, 0.1960784, 1,
-0.3209581, 0.02838399, -1.661254, 0, 1, 0.2039216, 1,
-0.3160896, -0.4791503, -1.156017, 0, 1, 0.2078431, 1,
-0.3130795, 0.6615546, -0.2830217, 0, 1, 0.2156863, 1,
-0.312726, -0.8212345, -3.264974, 0, 1, 0.2196078, 1,
-0.3108377, 1.914353, -0.6769738, 0, 1, 0.227451, 1,
-0.3081167, 0.5741606, 0.03925713, 0, 1, 0.2313726, 1,
-0.3070354, 0.8851042, 1.221767, 0, 1, 0.2392157, 1,
-0.305964, -0.01714709, 0.3918004, 0, 1, 0.2431373, 1,
-0.3022817, -0.3275963, -4.054962, 0, 1, 0.2509804, 1,
-0.2970143, 0.6717122, 0.7079192, 0, 1, 0.254902, 1,
-0.2947621, 0.3819723, -0.6082617, 0, 1, 0.2627451, 1,
-0.2921039, 0.1991422, -2.721752, 0, 1, 0.2666667, 1,
-0.2904062, 3.238308, -1.661983, 0, 1, 0.2745098, 1,
-0.2882783, 1.071825, 0.1229556, 0, 1, 0.2784314, 1,
-0.284386, -0.9664208, -4.366104, 0, 1, 0.2862745, 1,
-0.2783467, 0.3629763, -1.957628, 0, 1, 0.2901961, 1,
-0.2723951, -0.3011494, -2.826033, 0, 1, 0.2980392, 1,
-0.2723416, -0.4912498, -0.05006288, 0, 1, 0.3058824, 1,
-0.2716456, 0.1289291, -1.936651, 0, 1, 0.3098039, 1,
-0.2699764, -0.3483088, -2.20577, 0, 1, 0.3176471, 1,
-0.267566, -1.615356, -3.981165, 0, 1, 0.3215686, 1,
-0.260038, -0.1529562, -0.2321695, 0, 1, 0.3294118, 1,
-0.2586442, -0.3227557, -3.363682, 0, 1, 0.3333333, 1,
-0.2583935, 1.417226, -0.8092377, 0, 1, 0.3411765, 1,
-0.2563626, -1.438462, -3.797302, 0, 1, 0.345098, 1,
-0.2529398, 1.610415, -0.606076, 0, 1, 0.3529412, 1,
-0.2510934, -0.3976496, -3.356109, 0, 1, 0.3568628, 1,
-0.2451991, -1.026854, -3.196056, 0, 1, 0.3647059, 1,
-0.2451914, -0.1889659, -2.90238, 0, 1, 0.3686275, 1,
-0.2379072, -0.09138189, -1.736497, 0, 1, 0.3764706, 1,
-0.2344577, -0.4444667, -2.676676, 0, 1, 0.3803922, 1,
-0.2344168, 0.06658226, -0.3922332, 0, 1, 0.3882353, 1,
-0.2340481, 0.05157323, -0.3514647, 0, 1, 0.3921569, 1,
-0.2318871, -0.5298239, -4.712874, 0, 1, 0.4, 1,
-0.2308808, 0.8249021, 0.07772647, 0, 1, 0.4078431, 1,
-0.2294446, -2.178762, -3.123619, 0, 1, 0.4117647, 1,
-0.2282346, 0.6038825, -1.493846, 0, 1, 0.4196078, 1,
-0.2274913, -0.4297458, -1.555557, 0, 1, 0.4235294, 1,
-0.2259333, -1.424274, -2.89473, 0, 1, 0.4313726, 1,
-0.2238414, -1.519144, -3.070012, 0, 1, 0.4352941, 1,
-0.2237497, 1.438237, -0.1399839, 0, 1, 0.4431373, 1,
-0.2182474, -0.6020131, -2.017202, 0, 1, 0.4470588, 1,
-0.2181371, -0.005807868, -0.7451406, 0, 1, 0.454902, 1,
-0.2168427, 0.6252589, 0.2686768, 0, 1, 0.4588235, 1,
-0.2073529, -1.266417, -3.163927, 0, 1, 0.4666667, 1,
-0.2034892, 1.01545, 1.226999, 0, 1, 0.4705882, 1,
-0.2032012, 0.4893984, -0.7380527, 0, 1, 0.4784314, 1,
-0.2021953, -1.475271, -3.608124, 0, 1, 0.4823529, 1,
-0.2007466, -0.2268823, -1.470301, 0, 1, 0.4901961, 1,
-0.1976347, -0.1944973, -4.185783, 0, 1, 0.4941176, 1,
-0.196508, -0.5505114, -3.445406, 0, 1, 0.5019608, 1,
-0.1933196, -0.219618, -2.669455, 0, 1, 0.509804, 1,
-0.1930554, 0.09821092, -1.81069, 0, 1, 0.5137255, 1,
-0.1912695, -1.47824, -3.443954, 0, 1, 0.5215687, 1,
-0.1912599, 1.260869, -0.1343997, 0, 1, 0.5254902, 1,
-0.1892961, -0.6337519, -2.876103, 0, 1, 0.5333334, 1,
-0.1784336, -1.128768, -4.853626, 0, 1, 0.5372549, 1,
-0.1765802, -0.009385498, -2.130783, 0, 1, 0.5450981, 1,
-0.1696356, -0.0193788, -1.623396, 0, 1, 0.5490196, 1,
-0.1665568, -0.8254665, -2.547523, 0, 1, 0.5568628, 1,
-0.1641749, -0.5972391, -2.056874, 0, 1, 0.5607843, 1,
-0.1553522, -1.842895, -2.553599, 0, 1, 0.5686275, 1,
-0.152466, -0.6236533, -3.473297, 0, 1, 0.572549, 1,
-0.1519044, 0.9301022, -0.341496, 0, 1, 0.5803922, 1,
-0.1518307, -0.2758675, -3.503439, 0, 1, 0.5843138, 1,
-0.1511938, 1.099987, -0.9527615, 0, 1, 0.5921569, 1,
-0.1494763, -0.5004995, -1.252094, 0, 1, 0.5960785, 1,
-0.1481596, -1.140436, -3.750268, 0, 1, 0.6039216, 1,
-0.1450072, -0.5939661, -2.341513, 0, 1, 0.6117647, 1,
-0.1425962, -0.7098929, -4.315027, 0, 1, 0.6156863, 1,
-0.1416319, 0.07657883, -1.995305, 0, 1, 0.6235294, 1,
-0.1408092, 0.08982361, -2.584782, 0, 1, 0.627451, 1,
-0.1398045, 0.1821583, 0.7078268, 0, 1, 0.6352941, 1,
-0.1380782, 0.1684158, 0.2364252, 0, 1, 0.6392157, 1,
-0.134987, -0.8548344, -2.444454, 0, 1, 0.6470588, 1,
-0.1349502, 1.210749, -1.665259, 0, 1, 0.6509804, 1,
-0.1324102, 0.2263785, 0.3011396, 0, 1, 0.6588235, 1,
-0.1318954, -0.3229466, -2.482492, 0, 1, 0.6627451, 1,
-0.1316174, -0.2582359, -5.148992, 0, 1, 0.6705883, 1,
-0.1308979, 0.449328, -1.209582, 0, 1, 0.6745098, 1,
-0.1307894, 0.4337387, 0.2575102, 0, 1, 0.682353, 1,
-0.1285009, -1.569672, -3.467737, 0, 1, 0.6862745, 1,
-0.1240954, 0.1900551, -0.02695019, 0, 1, 0.6941177, 1,
-0.1220471, 0.660821, -1.397197, 0, 1, 0.7019608, 1,
-0.1207036, 0.8538315, -0.03500932, 0, 1, 0.7058824, 1,
-0.1203755, 0.02287189, -1.835058, 0, 1, 0.7137255, 1,
-0.1166739, 0.09548334, -2.100861, 0, 1, 0.7176471, 1,
-0.1136049, -0.1915033, -3.353325, 0, 1, 0.7254902, 1,
-0.1131365, -0.7705793, -2.606858, 0, 1, 0.7294118, 1,
-0.1111818, -0.3574483, -2.943003, 0, 1, 0.7372549, 1,
-0.1102354, 0.7873908, 0.2779863, 0, 1, 0.7411765, 1,
-0.1086888, -1.364071, -3.370269, 0, 1, 0.7490196, 1,
-0.1069442, 1.13984, -3.153453, 0, 1, 0.7529412, 1,
-0.1063002, 0.2523571, -0.7299492, 0, 1, 0.7607843, 1,
-0.105515, -0.3255622, -2.943378, 0, 1, 0.7647059, 1,
-0.1003146, -0.7569501, -0.8396738, 0, 1, 0.772549, 1,
-0.09979653, -0.6050828, -1.244447, 0, 1, 0.7764706, 1,
-0.09623147, -0.5607118, -1.738265, 0, 1, 0.7843137, 1,
-0.09450631, -0.1403119, -2.060349, 0, 1, 0.7882353, 1,
-0.09137507, 1.975048, 0.6800785, 0, 1, 0.7960784, 1,
-0.0908115, -0.8044609, -1.136849, 0, 1, 0.8039216, 1,
-0.08982941, 0.2268262, 0.2621786, 0, 1, 0.8078431, 1,
-0.08876292, 1.222459, 0.198631, 0, 1, 0.8156863, 1,
-0.08578359, -0.2538172, -1.90455, 0, 1, 0.8196079, 1,
-0.08413608, 0.9380813, 0.02251276, 0, 1, 0.827451, 1,
-0.07169494, 1.219143, 0.7076082, 0, 1, 0.8313726, 1,
-0.06933387, 0.6088545, 1.348413, 0, 1, 0.8392157, 1,
-0.06912035, -0.1826309, -4.131535, 0, 1, 0.8431373, 1,
-0.06908961, -0.2247665, -4.49933, 0, 1, 0.8509804, 1,
-0.0675751, -0.659511, -0.9463513, 0, 1, 0.854902, 1,
-0.06752251, -2.229716, -2.96315, 0, 1, 0.8627451, 1,
-0.05784011, -1.248556, -2.268835, 0, 1, 0.8666667, 1,
-0.05707417, 1.157669, 1.214104, 0, 1, 0.8745098, 1,
-0.0540789, -0.5826613, -3.130349, 0, 1, 0.8784314, 1,
-0.05328337, -1.09664, -2.779591, 0, 1, 0.8862745, 1,
-0.05276359, -1.519981, -2.839133, 0, 1, 0.8901961, 1,
-0.04994261, -0.3285677, -2.418145, 0, 1, 0.8980392, 1,
-0.0451378, 1.880978, 0.2127271, 0, 1, 0.9058824, 1,
-0.04417241, 1.221044, 1.331592, 0, 1, 0.9098039, 1,
-0.04400641, 0.4817471, -1.806847, 0, 1, 0.9176471, 1,
-0.04271872, 0.6981085, -0.5049219, 0, 1, 0.9215686, 1,
-0.03503063, -1.761492, -4.387155, 0, 1, 0.9294118, 1,
-0.03394235, -0.2982768, -2.18954, 0, 1, 0.9333333, 1,
-0.03379012, 1.348538, 1.206399, 0, 1, 0.9411765, 1,
-0.03352123, 0.6961602, -1.866393, 0, 1, 0.945098, 1,
-0.03340926, -0.4724259, -2.637118, 0, 1, 0.9529412, 1,
-0.03277452, 0.3072774, 1.134053, 0, 1, 0.9568627, 1,
-0.03179388, -0.4401049, -2.17728, 0, 1, 0.9647059, 1,
-0.03151202, 0.536956, 0.5450185, 0, 1, 0.9686275, 1,
-0.02803569, -0.3982942, -1.541762, 0, 1, 0.9764706, 1,
-0.02692953, 0.396546, 1.238906, 0, 1, 0.9803922, 1,
-0.02691819, 0.8983742, -0.6542571, 0, 1, 0.9882353, 1,
-0.02632245, 0.2070372, 0.4039739, 0, 1, 0.9921569, 1,
-0.02539558, -0.8373232, -3.878908, 0, 1, 1, 1,
-0.02470212, -0.3509293, -2.679983, 0, 0.9921569, 1, 1,
-0.02384465, 0.07456166, -0.07804342, 0, 0.9882353, 1, 1,
-0.02217139, -1.160165, -2.327892, 0, 0.9803922, 1, 1,
-0.01593975, 1.153318, -0.04191582, 0, 0.9764706, 1, 1,
-0.01369411, -0.3595383, -2.828583, 0, 0.9686275, 1, 1,
-0.01189902, 0.7418467, 0.2234791, 0, 0.9647059, 1, 1,
-0.009259395, -1.026288, -4.020795, 0, 0.9568627, 1, 1,
-0.005231191, -0.2338124, -2.719241, 0, 0.9529412, 1, 1,
-0.003999406, 0.01807548, 0.4912146, 0, 0.945098, 1, 1,
-0.001814075, 0.6254429, 0.4458576, 0, 0.9411765, 1, 1,
-0.001592814, 0.8213586, 0.5813317, 0, 0.9333333, 1, 1,
0.001424655, -1.215785, 2.126474, 0, 0.9294118, 1, 1,
0.004369766, -0.666193, 2.518978, 0, 0.9215686, 1, 1,
0.006134381, 1.02643, 1.478374, 0, 0.9176471, 1, 1,
0.007171089, 0.9299828, 0.7058329, 0, 0.9098039, 1, 1,
0.009429163, -0.9766606, 2.721524, 0, 0.9058824, 1, 1,
0.01075392, 0.5882081, -1.259004, 0, 0.8980392, 1, 1,
0.01368728, 0.6503807, 2.916336, 0, 0.8901961, 1, 1,
0.01516993, 1.194219, 0.6994708, 0, 0.8862745, 1, 1,
0.01894997, 0.924968, 0.6805393, 0, 0.8784314, 1, 1,
0.01983388, -0.3191144, 2.352466, 0, 0.8745098, 1, 1,
0.01988403, 0.02010631, 0.763988, 0, 0.8666667, 1, 1,
0.02098301, 0.6883024, -1.168124, 0, 0.8627451, 1, 1,
0.02250398, -0.1887009, 3.439238, 0, 0.854902, 1, 1,
0.02454698, 0.6520782, 0.4795616, 0, 0.8509804, 1, 1,
0.02525748, -2.734381, 2.067958, 0, 0.8431373, 1, 1,
0.02974845, 0.643723, 1.595356, 0, 0.8392157, 1, 1,
0.03071278, 2.122831, 1.976481, 0, 0.8313726, 1, 1,
0.03149121, -0.3842209, 1.994464, 0, 0.827451, 1, 1,
0.03447304, -1.051266, 2.219012, 0, 0.8196079, 1, 1,
0.03651724, -0.4018393, 3.699796, 0, 0.8156863, 1, 1,
0.03658294, -1.067912, 3.061311, 0, 0.8078431, 1, 1,
0.04443285, 0.3328305, 0.9015809, 0, 0.8039216, 1, 1,
0.04482321, -1.15368, 1.809093, 0, 0.7960784, 1, 1,
0.04549426, -0.7981883, 2.567586, 0, 0.7882353, 1, 1,
0.046747, -0.348077, 3.274705, 0, 0.7843137, 1, 1,
0.04979935, 1.360455, 1.135364, 0, 0.7764706, 1, 1,
0.05077042, 0.8468006, -0.3552416, 0, 0.772549, 1, 1,
0.05357739, -0.8441527, 1.166904, 0, 0.7647059, 1, 1,
0.05608993, -0.00659046, 0.2260455, 0, 0.7607843, 1, 1,
0.05813535, -0.2916306, 4.413533, 0, 0.7529412, 1, 1,
0.05884547, 0.4389634, -0.1517401, 0, 0.7490196, 1, 1,
0.05937095, -0.09533376, 3.219035, 0, 0.7411765, 1, 1,
0.05984959, -0.2113878, 4.505635, 0, 0.7372549, 1, 1,
0.0634561, -0.358166, 4.442463, 0, 0.7294118, 1, 1,
0.06573556, -0.3703663, 3.924495, 0, 0.7254902, 1, 1,
0.06600704, -1.706718, 3.343249, 0, 0.7176471, 1, 1,
0.06692696, 0.8398902, 3.744184, 0, 0.7137255, 1, 1,
0.06751847, 0.9735179, 0.4874023, 0, 0.7058824, 1, 1,
0.06756331, 1.06145, -0.09181517, 0, 0.6980392, 1, 1,
0.06809264, 0.7056994, -0.984386, 0, 0.6941177, 1, 1,
0.06969769, -0.3050124, 3.076597, 0, 0.6862745, 1, 1,
0.07206125, 0.7703971, -0.4010625, 0, 0.682353, 1, 1,
0.0731784, -0.5866692, 4.206661, 0, 0.6745098, 1, 1,
0.07820627, 0.3458587, 2.041512, 0, 0.6705883, 1, 1,
0.08511009, 1.843912, 0.4587387, 0, 0.6627451, 1, 1,
0.08771338, 0.5204182, -0.3024215, 0, 0.6588235, 1, 1,
0.0882104, -0.1176243, 2.02632, 0, 0.6509804, 1, 1,
0.08977564, -0.8763769, 3.640716, 0, 0.6470588, 1, 1,
0.09088027, 0.5014613, -0.8382359, 0, 0.6392157, 1, 1,
0.09249827, 0.2269376, -0.7578807, 0, 0.6352941, 1, 1,
0.09518272, -1.21591, 3.13418, 0, 0.627451, 1, 1,
0.09567244, -0.06035591, 2.98738, 0, 0.6235294, 1, 1,
0.09667441, 0.05128059, 0.8703774, 0, 0.6156863, 1, 1,
0.0998157, 0.9658673, -1.334317, 0, 0.6117647, 1, 1,
0.1001137, 1.528374, -0.2190558, 0, 0.6039216, 1, 1,
0.1004452, -1.472833, 1.783309, 0, 0.5960785, 1, 1,
0.1004461, 0.5492567, -0.6006976, 0, 0.5921569, 1, 1,
0.1023293, 1.847194, 0.3843384, 0, 0.5843138, 1, 1,
0.1047266, -0.8008, 2.226024, 0, 0.5803922, 1, 1,
0.1061949, -0.4278919, 4.615273, 0, 0.572549, 1, 1,
0.1085606, 1.267403, 1.5534, 0, 0.5686275, 1, 1,
0.1116593, -0.06749839, 1.757803, 0, 0.5607843, 1, 1,
0.1130252, -0.1570295, 3.234665, 0, 0.5568628, 1, 1,
0.1167997, 1.754323, -0.219821, 0, 0.5490196, 1, 1,
0.1170977, -0.8982655, 2.771521, 0, 0.5450981, 1, 1,
0.1181491, 0.1550788, 1.021239, 0, 0.5372549, 1, 1,
0.1199166, 1.931231, -1.328883, 0, 0.5333334, 1, 1,
0.1227962, 1.406196, 0.8775536, 0, 0.5254902, 1, 1,
0.1236663, -0.8144562, 1.393068, 0, 0.5215687, 1, 1,
0.1354914, 2.015852, -0.7275254, 0, 0.5137255, 1, 1,
0.1380126, 1.805279, 0.9731619, 0, 0.509804, 1, 1,
0.144195, 0.6120816, -0.9898925, 0, 0.5019608, 1, 1,
0.1460868, -0.1028503, 2.443289, 0, 0.4941176, 1, 1,
0.148133, -0.2926967, 3.897055, 0, 0.4901961, 1, 1,
0.1515811, 0.4122174, 2.296905, 0, 0.4823529, 1, 1,
0.1595419, 0.07316586, 1.560953, 0, 0.4784314, 1, 1,
0.1628429, -0.1226743, 1.349035, 0, 0.4705882, 1, 1,
0.1630584, 0.8507774, -0.03167911, 0, 0.4666667, 1, 1,
0.1639552, 0.6019467, 0.7049094, 0, 0.4588235, 1, 1,
0.1671491, 0.654088, -0.1733585, 0, 0.454902, 1, 1,
0.167521, -1.194499, 3.39827, 0, 0.4470588, 1, 1,
0.1692268, 1.006471, 0.8471491, 0, 0.4431373, 1, 1,
0.1697748, 0.9474029, 1.814559, 0, 0.4352941, 1, 1,
0.1731368, -0.4501177, 4.467282, 0, 0.4313726, 1, 1,
0.1743728, 0.2498902, 0.4851335, 0, 0.4235294, 1, 1,
0.1749678, 0.2649942, 0.5865294, 0, 0.4196078, 1, 1,
0.1764204, 0.3554143, 0.5565787, 0, 0.4117647, 1, 1,
0.177073, 1.644814, 0.5978636, 0, 0.4078431, 1, 1,
0.1780386, -2.347327, 2.463686, 0, 0.4, 1, 1,
0.1800312, -1.178875, 2.993739, 0, 0.3921569, 1, 1,
0.1844806, 0.523801, 1.219394, 0, 0.3882353, 1, 1,
0.1876758, -1.230184, 1.669173, 0, 0.3803922, 1, 1,
0.1943386, -1.724929, 2.778175, 0, 0.3764706, 1, 1,
0.1949017, -0.8659779, 1.092815, 0, 0.3686275, 1, 1,
0.1969096, 0.3771741, 1.426102, 0, 0.3647059, 1, 1,
0.1984575, -0.2039605, 3.240963, 0, 0.3568628, 1, 1,
0.2050766, -0.3514126, 3.319288, 0, 0.3529412, 1, 1,
0.2102809, -0.9364611, 2.434667, 0, 0.345098, 1, 1,
0.2163019, 1.465101, -1.596295, 0, 0.3411765, 1, 1,
0.2203247, -0.4857645, 3.662539, 0, 0.3333333, 1, 1,
0.2228298, 1.440687, -0.468824, 0, 0.3294118, 1, 1,
0.2331851, 0.005701329, 0.9967332, 0, 0.3215686, 1, 1,
0.2336238, -0.4744458, 4.117184, 0, 0.3176471, 1, 1,
0.2363626, -0.525069, 2.564422, 0, 0.3098039, 1, 1,
0.2411124, -1.5313, 2.242897, 0, 0.3058824, 1, 1,
0.2436567, -1.915182, 2.561153, 0, 0.2980392, 1, 1,
0.2530054, -1.113383, 2.771466, 0, 0.2901961, 1, 1,
0.2554269, -0.5014281, 2.301866, 0, 0.2862745, 1, 1,
0.261687, 1.024134, 1.221213, 0, 0.2784314, 1, 1,
0.2642745, -1.811963, 1.117597, 0, 0.2745098, 1, 1,
0.2815222, 1.263222, 0.6396773, 0, 0.2666667, 1, 1,
0.2905383, -0.2399275, 3.205228, 0, 0.2627451, 1, 1,
0.2945554, 0.1179844, 0.4932021, 0, 0.254902, 1, 1,
0.2950356, -0.2550058, 1.248517, 0, 0.2509804, 1, 1,
0.2961425, -0.4471555, 4.340646, 0, 0.2431373, 1, 1,
0.2964955, -0.6895483, 2.962872, 0, 0.2392157, 1, 1,
0.2972007, 0.4125032, -0.1512636, 0, 0.2313726, 1, 1,
0.3011672, 0.5073028, 0.3571517, 0, 0.227451, 1, 1,
0.3073094, 0.1960688, 0.6129047, 0, 0.2196078, 1, 1,
0.3073681, -1.64304, 2.678323, 0, 0.2156863, 1, 1,
0.3075345, 0.547424, 1.085441, 0, 0.2078431, 1, 1,
0.3124951, 1.450259, -1.953529, 0, 0.2039216, 1, 1,
0.3145306, -0.3228926, 2.204381, 0, 0.1960784, 1, 1,
0.3155102, 0.3256195, -0.484047, 0, 0.1882353, 1, 1,
0.3213692, -1.007809, 2.399622, 0, 0.1843137, 1, 1,
0.3252192, 0.2221489, -0.3274784, 0, 0.1764706, 1, 1,
0.3252378, -1.927111, 4.370953, 0, 0.172549, 1, 1,
0.3277937, 0.5306271, 1.80939, 0, 0.1647059, 1, 1,
0.3279222, -2.188329, 2.344738, 0, 0.1607843, 1, 1,
0.3287387, -0.3511471, 2.398337, 0, 0.1529412, 1, 1,
0.3291907, 0.3887068, 1.669747, 0, 0.1490196, 1, 1,
0.3291943, 1.883787, 0.4127734, 0, 0.1411765, 1, 1,
0.3316385, -1.585173, 1.133118, 0, 0.1372549, 1, 1,
0.3320172, 1.383706, 1.402703, 0, 0.1294118, 1, 1,
0.3328418, 0.4931825, 0.6389076, 0, 0.1254902, 1, 1,
0.3458545, -0.8278762, 1.834686, 0, 0.1176471, 1, 1,
0.3458656, 0.9406556, -2.370174, 0, 0.1137255, 1, 1,
0.3489063, -0.780225, 2.973222, 0, 0.1058824, 1, 1,
0.3491187, -0.08955649, 1.604461, 0, 0.09803922, 1, 1,
0.351572, -0.5038365, 2.24373, 0, 0.09411765, 1, 1,
0.3526106, 0.3841047, -0.7695953, 0, 0.08627451, 1, 1,
0.3549046, 1.912026, -0.6962548, 0, 0.08235294, 1, 1,
0.3553731, 0.1917178, 2.460673, 0, 0.07450981, 1, 1,
0.3593056, 0.7788328, -0.4713033, 0, 0.07058824, 1, 1,
0.3630366, 0.1172218, -0.2726834, 0, 0.0627451, 1, 1,
0.3689189, 0.2630018, 1.487206, 0, 0.05882353, 1, 1,
0.3701592, 1.205507, 1.355754, 0, 0.05098039, 1, 1,
0.3705191, -0.04863745, 2.206104, 0, 0.04705882, 1, 1,
0.3759142, -0.3226554, 2.472396, 0, 0.03921569, 1, 1,
0.3763612, -0.4103436, 1.827738, 0, 0.03529412, 1, 1,
0.3772215, -1.214972, 3.693704, 0, 0.02745098, 1, 1,
0.3776582, -2.551775, 2.744035, 0, 0.02352941, 1, 1,
0.3793668, -2.339082, 1.387947, 0, 0.01568628, 1, 1,
0.3807137, 0.8771845, 0.6610591, 0, 0.01176471, 1, 1,
0.3823478, 0.2235028, 1.239322, 0, 0.003921569, 1, 1,
0.3824441, 0.1368064, 0.8874963, 0.003921569, 0, 1, 1,
0.384465, 0.2798969, -0.9927375, 0.007843138, 0, 1, 1,
0.3913919, -1.071256, 2.124091, 0.01568628, 0, 1, 1,
0.3949895, -0.8675659, 1.607932, 0.01960784, 0, 1, 1,
0.3958638, -0.1185249, 1.844435, 0.02745098, 0, 1, 1,
0.3969383, -0.260344, 0.3335084, 0.03137255, 0, 1, 1,
0.407933, -0.7125174, 3.881295, 0.03921569, 0, 1, 1,
0.4105417, -0.2028161, 3.986633, 0.04313726, 0, 1, 1,
0.4118293, -0.5536093, 1.623495, 0.05098039, 0, 1, 1,
0.4143196, -1.363096, 4.079, 0.05490196, 0, 1, 1,
0.4150698, 2.018058, -1.099711, 0.0627451, 0, 1, 1,
0.416903, -0.4457849, 1.438923, 0.06666667, 0, 1, 1,
0.4296855, -1.130115, 3.626739, 0.07450981, 0, 1, 1,
0.4313475, 1.650333, -0.6463013, 0.07843138, 0, 1, 1,
0.4314088, -1.089416, 1.542861, 0.08627451, 0, 1, 1,
0.4316567, 1.605019, -1.304991, 0.09019608, 0, 1, 1,
0.432188, -0.5744566, 1.314322, 0.09803922, 0, 1, 1,
0.43704, 0.143171, 1.418068, 0.1058824, 0, 1, 1,
0.4396722, -0.3559208, 2.99989, 0.1098039, 0, 1, 1,
0.440796, -0.5380677, 4.006588, 0.1176471, 0, 1, 1,
0.4418317, -0.01383732, 1.472918, 0.1215686, 0, 1, 1,
0.4448836, -0.7931326, 2.7397, 0.1294118, 0, 1, 1,
0.4466599, 1.956552, 0.8904027, 0.1333333, 0, 1, 1,
0.4510677, -0.6951678, 1.636672, 0.1411765, 0, 1, 1,
0.4535848, -0.4218225, 1.880092, 0.145098, 0, 1, 1,
0.4550672, -0.6164224, 2.219705, 0.1529412, 0, 1, 1,
0.4555408, 1.534002, 1.572495, 0.1568628, 0, 1, 1,
0.4588957, -0.08742505, 0.1498502, 0.1647059, 0, 1, 1,
0.4592373, 0.02452808, 0.7215127, 0.1686275, 0, 1, 1,
0.4602455, 1.122225, 0.2107019, 0.1764706, 0, 1, 1,
0.460254, 1.489667, 1.6609, 0.1803922, 0, 1, 1,
0.4627176, 1.942726, -0.1457781, 0.1882353, 0, 1, 1,
0.46573, 0.1467869, -0.09434058, 0.1921569, 0, 1, 1,
0.4717889, -0.783814, 2.169942, 0.2, 0, 1, 1,
0.4799992, 1.0252, 0.8835167, 0.2078431, 0, 1, 1,
0.4807926, -0.91399, 1.704057, 0.2117647, 0, 1, 1,
0.4815461, -0.271664, 0.7565136, 0.2196078, 0, 1, 1,
0.4896535, 0.8089038, 0.1285783, 0.2235294, 0, 1, 1,
0.4913163, 0.3218565, 1.84541, 0.2313726, 0, 1, 1,
0.5078967, -0.1569184, 1.944595, 0.2352941, 0, 1, 1,
0.5087739, -0.9971043, 3.710303, 0.2431373, 0, 1, 1,
0.5132102, 0.7051385, 0.3715979, 0.2470588, 0, 1, 1,
0.5140418, -0.2907237, 3.023385, 0.254902, 0, 1, 1,
0.521232, 0.01045351, 0.3529394, 0.2588235, 0, 1, 1,
0.5333127, 0.476332, 0.852991, 0.2666667, 0, 1, 1,
0.5349793, 0.3235161, 1.062105, 0.2705882, 0, 1, 1,
0.5379226, 1.365429, 1.53415, 0.2784314, 0, 1, 1,
0.5396536, -1.69104, 1.752817, 0.282353, 0, 1, 1,
0.5397537, 0.2929905, 1.323144, 0.2901961, 0, 1, 1,
0.5433198, 0.2488607, 1.351466, 0.2941177, 0, 1, 1,
0.5443805, 2.15835, -0.1242975, 0.3019608, 0, 1, 1,
0.5502517, 0.2545114, 3.131052, 0.3098039, 0, 1, 1,
0.5535333, 1.414565, -0.1432558, 0.3137255, 0, 1, 1,
0.5559619, -0.638547, 2.569336, 0.3215686, 0, 1, 1,
0.5644972, -0.8188873, 1.499667, 0.3254902, 0, 1, 1,
0.5645852, -0.5356615, 2.971926, 0.3333333, 0, 1, 1,
0.5668436, -0.05356482, 1.785426, 0.3372549, 0, 1, 1,
0.5690814, 1.246429, 1.695997, 0.345098, 0, 1, 1,
0.5792223, -0.1519821, 0.9772913, 0.3490196, 0, 1, 1,
0.583177, 0.6654443, 2.116542, 0.3568628, 0, 1, 1,
0.5835132, -0.8429574, 2.432872, 0.3607843, 0, 1, 1,
0.5862898, 0.6040714, 0.1672745, 0.3686275, 0, 1, 1,
0.5865855, 1.455373, 0.4104988, 0.372549, 0, 1, 1,
0.5893994, 0.7271103, 0.9115132, 0.3803922, 0, 1, 1,
0.5902561, 0.8825005, 0.8672758, 0.3843137, 0, 1, 1,
0.5907225, 0.5357365, 1.335614, 0.3921569, 0, 1, 1,
0.5965356, 0.5585719, -0.4632294, 0.3960784, 0, 1, 1,
0.5976807, 0.6879411, 1.062865, 0.4039216, 0, 1, 1,
0.598266, -2.871986, 4.24002, 0.4117647, 0, 1, 1,
0.5996209, 0.3336575, 1.67758, 0.4156863, 0, 1, 1,
0.6022094, 0.3772512, 0.4184184, 0.4235294, 0, 1, 1,
0.6068614, 1.866508, -0.751447, 0.427451, 0, 1, 1,
0.6103109, 0.8789328, 0.7400745, 0.4352941, 0, 1, 1,
0.6150489, -0.6755188, 1.832559, 0.4392157, 0, 1, 1,
0.6229736, -1.016782, 3.647985, 0.4470588, 0, 1, 1,
0.6305881, 0.04335877, 1.937297, 0.4509804, 0, 1, 1,
0.6353886, -0.01643969, 1.288764, 0.4588235, 0, 1, 1,
0.6389452, 0.06534018, 1.053834, 0.4627451, 0, 1, 1,
0.6421481, -0.04113532, 0.9108736, 0.4705882, 0, 1, 1,
0.645611, 0.4850687, 0.7143213, 0.4745098, 0, 1, 1,
0.6488593, -0.4463831, 2.298504, 0.4823529, 0, 1, 1,
0.6497841, -0.7429751, 1.695309, 0.4862745, 0, 1, 1,
0.6561779, -0.8212948, 2.878383, 0.4941176, 0, 1, 1,
0.6568344, -0.2989654, 3.368198, 0.5019608, 0, 1, 1,
0.656943, -1.567895, 3.934402, 0.5058824, 0, 1, 1,
0.6632414, 0.06438015, 1.504399, 0.5137255, 0, 1, 1,
0.6633741, 1.154667, 0.9015129, 0.5176471, 0, 1, 1,
0.6668496, -1.188302, 3.548973, 0.5254902, 0, 1, 1,
0.6719061, 0.3767917, 0.6176155, 0.5294118, 0, 1, 1,
0.6736619, -1.398375, 2.132833, 0.5372549, 0, 1, 1,
0.6782263, -0.7708164, 1.395322, 0.5411765, 0, 1, 1,
0.6822337, 0.5382349, 3.446361, 0.5490196, 0, 1, 1,
0.68246, 0.794575, 1.465812, 0.5529412, 0, 1, 1,
0.6843157, 1.509877, 0.175119, 0.5607843, 0, 1, 1,
0.687889, 0.3497332, 2.341475, 0.5647059, 0, 1, 1,
0.6884287, -0.007806992, -0.2867937, 0.572549, 0, 1, 1,
0.6896387, -1.023235, 2.139549, 0.5764706, 0, 1, 1,
0.6902145, 0.03339966, 3.602288, 0.5843138, 0, 1, 1,
0.7056088, 0.2430174, 1.159642, 0.5882353, 0, 1, 1,
0.7145715, 1.252482, 0.197948, 0.5960785, 0, 1, 1,
0.7182222, -0.04654385, 0.4002573, 0.6039216, 0, 1, 1,
0.7202079, -1.396189, 3.423438, 0.6078432, 0, 1, 1,
0.7203176, 0.3069683, 0.148294, 0.6156863, 0, 1, 1,
0.7213281, -0.1510606, 1.70835, 0.6196079, 0, 1, 1,
0.7213917, 1.176312, 1.394461, 0.627451, 0, 1, 1,
0.7241317, -0.1807666, 2.445164, 0.6313726, 0, 1, 1,
0.7270386, 0.5288488, 0.5220483, 0.6392157, 0, 1, 1,
0.7273868, 0.8006833, 0.120934, 0.6431373, 0, 1, 1,
0.7294503, 0.53936, -0.06954984, 0.6509804, 0, 1, 1,
0.7313597, -0.1116988, 2.290704, 0.654902, 0, 1, 1,
0.7404112, -0.3569081, 2.617386, 0.6627451, 0, 1, 1,
0.7443749, -0.3906704, 3.197867, 0.6666667, 0, 1, 1,
0.7480855, 1.094766, -0.5126622, 0.6745098, 0, 1, 1,
0.7504805, -1.546868, 2.520978, 0.6784314, 0, 1, 1,
0.7513382, -1.783964, 0.8229294, 0.6862745, 0, 1, 1,
0.7524258, 0.2284193, 1.387067, 0.6901961, 0, 1, 1,
0.7534824, 1.961303, 0.7655092, 0.6980392, 0, 1, 1,
0.7573574, -0.2704185, 2.582012, 0.7058824, 0, 1, 1,
0.7612309, -0.4429283, 1.966103, 0.7098039, 0, 1, 1,
0.7663673, 0.2969689, 1.369861, 0.7176471, 0, 1, 1,
0.7706648, 1.088846, 2.086996, 0.7215686, 0, 1, 1,
0.7747332, 0.08604303, 2.13389, 0.7294118, 0, 1, 1,
0.7824767, 0.9505554, -0.8259899, 0.7333333, 0, 1, 1,
0.7885904, -0.05583018, 1.156571, 0.7411765, 0, 1, 1,
0.788664, 0.1574117, 1.452147, 0.7450981, 0, 1, 1,
0.7948825, -0.3950411, 1.210778, 0.7529412, 0, 1, 1,
0.7953038, 0.4279647, 1.137514, 0.7568628, 0, 1, 1,
0.7956763, 0.1416544, 2.28012, 0.7647059, 0, 1, 1,
0.798741, 0.2665133, 1.498624, 0.7686275, 0, 1, 1,
0.7989767, -1.466967, 1.319802, 0.7764706, 0, 1, 1,
0.8002928, 1.707074, 0.2295173, 0.7803922, 0, 1, 1,
0.8013062, -1.005721, 2.88597, 0.7882353, 0, 1, 1,
0.8025666, -0.2070173, 2.836346, 0.7921569, 0, 1, 1,
0.805145, 1.011439, 1.162069, 0.8, 0, 1, 1,
0.8061702, -1.748414, 3.114487, 0.8078431, 0, 1, 1,
0.8136065, -0.3315834, 0.4775261, 0.8117647, 0, 1, 1,
0.8144587, 0.03598681, 1.410417, 0.8196079, 0, 1, 1,
0.816072, 0.008887729, 1.581778, 0.8235294, 0, 1, 1,
0.8193164, 0.02936271, 2.683351, 0.8313726, 0, 1, 1,
0.8274501, -1.02852, 1.119735, 0.8352941, 0, 1, 1,
0.8280801, 0.04148649, 0.7869732, 0.8431373, 0, 1, 1,
0.8297909, -0.7767646, 0.3022867, 0.8470588, 0, 1, 1,
0.8341732, -0.8725725, 2.326581, 0.854902, 0, 1, 1,
0.835889, 0.1646098, 1.028594, 0.8588235, 0, 1, 1,
0.8362399, 0.3893401, 1.677374, 0.8666667, 0, 1, 1,
0.8373851, 0.3587703, 0.5741459, 0.8705882, 0, 1, 1,
0.8391404, -2.254586, 0.9229839, 0.8784314, 0, 1, 1,
0.8401834, -0.3737628, 1.606774, 0.8823529, 0, 1, 1,
0.8406631, 0.7473824, 0.52797, 0.8901961, 0, 1, 1,
0.8413774, 0.3948666, 2.333628, 0.8941177, 0, 1, 1,
0.8443449, 0.4473895, 2.522369, 0.9019608, 0, 1, 1,
0.8456474, -0.5224108, 0.2334484, 0.9098039, 0, 1, 1,
0.848187, 0.4274936, -0.4400449, 0.9137255, 0, 1, 1,
0.8522631, 0.06516109, 0.6850282, 0.9215686, 0, 1, 1,
0.8546706, -1.172376, 3.130102, 0.9254902, 0, 1, 1,
0.856748, 0.5785132, 0.612797, 0.9333333, 0, 1, 1,
0.8568603, 1.909037, 0.6180607, 0.9372549, 0, 1, 1,
0.8657555, -0.2768153, 3.004664, 0.945098, 0, 1, 1,
0.869288, -1.087597, 1.364136, 0.9490196, 0, 1, 1,
0.875905, 0.1004575, 0.8914132, 0.9568627, 0, 1, 1,
0.8772584, -1.22621, 2.262438, 0.9607843, 0, 1, 1,
0.8782091, -0.12831, 1.506876, 0.9686275, 0, 1, 1,
0.8791795, -0.8938456, 0.3873568, 0.972549, 0, 1, 1,
0.887459, 0.6036934, 1.859823, 0.9803922, 0, 1, 1,
0.8902296, -0.6315196, 1.831389, 0.9843137, 0, 1, 1,
0.8933169, -2.358117, 3.007396, 0.9921569, 0, 1, 1,
0.8940754, -1.352599, 2.913065, 0.9960784, 0, 1, 1,
0.9009578, 0.3432174, 0.4999185, 1, 0, 0.9960784, 1,
0.9279179, 0.2059421, 2.860693, 1, 0, 0.9882353, 1,
0.9375386, -2.093064, 1.60404, 1, 0, 0.9843137, 1,
0.9380052, -0.3125463, 2.518226, 1, 0, 0.9764706, 1,
0.9406609, -0.4270159, 1.878827, 1, 0, 0.972549, 1,
0.9409225, -0.1001513, 1.838341, 1, 0, 0.9647059, 1,
0.9419836, 0.8465032, 2.19117, 1, 0, 0.9607843, 1,
0.9460275, 0.09901828, 0.3287166, 1, 0, 0.9529412, 1,
0.9464727, 0.9833771, 1.997755, 1, 0, 0.9490196, 1,
0.9465148, -0.1349061, 0.5772151, 1, 0, 0.9411765, 1,
0.9485823, 1.938009, 0.1041023, 1, 0, 0.9372549, 1,
0.9512713, -0.3703342, 2.107899, 1, 0, 0.9294118, 1,
0.9519557, 0.7778732, 0.589515, 1, 0, 0.9254902, 1,
0.9562611, -0.2681963, 1.218546, 1, 0, 0.9176471, 1,
0.9609384, 1.172466, 0.7391626, 1, 0, 0.9137255, 1,
0.9634742, -1.09128, 1.130217, 1, 0, 0.9058824, 1,
0.9688994, 1.170915, 1.888476, 1, 0, 0.9019608, 1,
0.9732431, 0.2985691, 2.726223, 1, 0, 0.8941177, 1,
0.9786631, -0.7433906, 4.488011, 1, 0, 0.8862745, 1,
0.9846583, 2.029137, 0.7605005, 1, 0, 0.8823529, 1,
0.9897498, -1.731643, 2.41476, 1, 0, 0.8745098, 1,
0.9956629, 1.900029, 2.112828, 1, 0, 0.8705882, 1,
1.004854, 3.003101, 0.6552441, 1, 0, 0.8627451, 1,
1.006269, 1.234033, 0.5398321, 1, 0, 0.8588235, 1,
1.014264, -0.424712, 3.087679, 1, 0, 0.8509804, 1,
1.018701, -1.109133, 0.9893692, 1, 0, 0.8470588, 1,
1.021618, 0.6596283, 1.533161, 1, 0, 0.8392157, 1,
1.021651, 0.1939221, 1.912512, 1, 0, 0.8352941, 1,
1.024015, 0.9999195, 0.3086536, 1, 0, 0.827451, 1,
1.025676, -2.192822, 3.415743, 1, 0, 0.8235294, 1,
1.035251, -1.14487, 4.143501, 1, 0, 0.8156863, 1,
1.035607, -0.242325, 2.536024, 1, 0, 0.8117647, 1,
1.043951, -0.5678694, 3.36594, 1, 0, 0.8039216, 1,
1.046239, -0.5905308, 2.80135, 1, 0, 0.7960784, 1,
1.052133, 0.3433604, 3.15028, 1, 0, 0.7921569, 1,
1.054317, -0.3925777, 3.906221, 1, 0, 0.7843137, 1,
1.056147, 0.735485, -0.596635, 1, 0, 0.7803922, 1,
1.068678, -1.264787, 3.188603, 1, 0, 0.772549, 1,
1.070391, 0.05653658, 1.014548, 1, 0, 0.7686275, 1,
1.074399, -0.1202743, 2.666431, 1, 0, 0.7607843, 1,
1.082491, -0.9529784, 1.580111, 1, 0, 0.7568628, 1,
1.087493, 1.244482, -0.4197729, 1, 0, 0.7490196, 1,
1.089065, 0.08699194, 1.295761, 1, 0, 0.7450981, 1,
1.098207, 1.20727, -0.4155223, 1, 0, 0.7372549, 1,
1.100175, 1.109325, 0.165626, 1, 0, 0.7333333, 1,
1.100369, -0.3579974, 0.1174296, 1, 0, 0.7254902, 1,
1.102036, -0.9069186, 2.153568, 1, 0, 0.7215686, 1,
1.10232, -1.280509, 3.184576, 1, 0, 0.7137255, 1,
1.103627, 0.5118414, 1.312406, 1, 0, 0.7098039, 1,
1.123526, 0.1641577, 2.048877, 1, 0, 0.7019608, 1,
1.123797, -0.6797915, 2.480605, 1, 0, 0.6941177, 1,
1.124292, -1.093088, 1.313078, 1, 0, 0.6901961, 1,
1.126285, 1.980179, 0.835955, 1, 0, 0.682353, 1,
1.129727, -0.008027024, 1.019449, 1, 0, 0.6784314, 1,
1.132323, 1.292233, 0.6658754, 1, 0, 0.6705883, 1,
1.132871, 0.04120205, 2.478404, 1, 0, 0.6666667, 1,
1.134219, -0.07087825, 0.8516712, 1, 0, 0.6588235, 1,
1.140246, -1.435567, 2.211544, 1, 0, 0.654902, 1,
1.140949, -1.476467, 2.585601, 1, 0, 0.6470588, 1,
1.144265, -0.1692807, 2.600408, 1, 0, 0.6431373, 1,
1.156648, -0.1146236, 2.806334, 1, 0, 0.6352941, 1,
1.162752, -0.2581531, -0.1799823, 1, 0, 0.6313726, 1,
1.16436, 0.3476083, 2.75187, 1, 0, 0.6235294, 1,
1.168633, -0.03966069, 1.642184, 1, 0, 0.6196079, 1,
1.168845, -0.7404825, 1.989407, 1, 0, 0.6117647, 1,
1.17373, -1.129684, 1.272096, 1, 0, 0.6078432, 1,
1.185241, 1.009464, 1.277206, 1, 0, 0.6, 1,
1.186843, 0.7992551, -0.2351577, 1, 0, 0.5921569, 1,
1.202952, 1.349246, 0.3490394, 1, 0, 0.5882353, 1,
1.205402, -1.14408, 1.453781, 1, 0, 0.5803922, 1,
1.212605, -0.3106257, 3.18687, 1, 0, 0.5764706, 1,
1.213561, 1.390622, 2.043899, 1, 0, 0.5686275, 1,
1.216355, -2.881145, 2.038466, 1, 0, 0.5647059, 1,
1.216536, 0.8076293, 0.3058704, 1, 0, 0.5568628, 1,
1.233022, 1.017232, 1.135734, 1, 0, 0.5529412, 1,
1.235976, 0.8081821, -0.930526, 1, 0, 0.5450981, 1,
1.244822, 2.297917, 2.004866, 1, 0, 0.5411765, 1,
1.249873, 0.4998524, -0.3280659, 1, 0, 0.5333334, 1,
1.251544, 1.497165, -0.5719047, 1, 0, 0.5294118, 1,
1.27506, 0.3034744, 0.5466465, 1, 0, 0.5215687, 1,
1.280374, -1.51074, 2.124819, 1, 0, 0.5176471, 1,
1.281433, -0.46111, 2.852193, 1, 0, 0.509804, 1,
1.294067, 1.09855, 2.081388, 1, 0, 0.5058824, 1,
1.299007, -1.896185, 3.124731, 1, 0, 0.4980392, 1,
1.3025, 1.633861, 1.039363, 1, 0, 0.4901961, 1,
1.303599, -0.1356333, 3.008839, 1, 0, 0.4862745, 1,
1.303627, -1.440823, 1.402634, 1, 0, 0.4784314, 1,
1.308528, -1.651069, 3.307466, 1, 0, 0.4745098, 1,
1.309948, -0.5732267, 3.537545, 1, 0, 0.4666667, 1,
1.310792, -0.5278316, 1.395589, 1, 0, 0.4627451, 1,
1.315971, -0.699147, 2.427088, 1, 0, 0.454902, 1,
1.32775, -0.6812268, 2.835585, 1, 0, 0.4509804, 1,
1.32991, -0.3128937, 2.102112, 1, 0, 0.4431373, 1,
1.331671, 0.8244188, 1.76096, 1, 0, 0.4392157, 1,
1.33532, -0.314205, 1.157951, 1, 0, 0.4313726, 1,
1.336928, 1.770894, 1.106234, 1, 0, 0.427451, 1,
1.34314, 1.494693, 0.2604928, 1, 0, 0.4196078, 1,
1.344748, 0.2946993, 1.524323, 1, 0, 0.4156863, 1,
1.350257, -0.7277938, 2.987685, 1, 0, 0.4078431, 1,
1.356545, 1.240494, 0.3117958, 1, 0, 0.4039216, 1,
1.358415, -0.09606539, 1.387038, 1, 0, 0.3960784, 1,
1.35984, -0.8362373, 4.78597, 1, 0, 0.3882353, 1,
1.375011, 1.830864, 0.3241597, 1, 0, 0.3843137, 1,
1.391676, -1.655973, 2.863231, 1, 0, 0.3764706, 1,
1.394398, 0.3197197, 1.904878, 1, 0, 0.372549, 1,
1.399631, -2.577232, 3.683665, 1, 0, 0.3647059, 1,
1.404567, -1.951338, 3.912159, 1, 0, 0.3607843, 1,
1.417772, 1.226656, 2.566222, 1, 0, 0.3529412, 1,
1.438164, 0.2756712, 3.530869, 1, 0, 0.3490196, 1,
1.439364, -1.056514, 1.186735, 1, 0, 0.3411765, 1,
1.457441, 0.6401144, 1.035974, 1, 0, 0.3372549, 1,
1.46307, 0.2130759, 2.671411, 1, 0, 0.3294118, 1,
1.487942, 0.4378023, 1.418979, 1, 0, 0.3254902, 1,
1.491016, 0.8358926, 0.2725289, 1, 0, 0.3176471, 1,
1.491888, -1.058554, 1.846205, 1, 0, 0.3137255, 1,
1.496539, -0.7803917, 4.341046, 1, 0, 0.3058824, 1,
1.502665, -0.7057526, 2.655322, 1, 0, 0.2980392, 1,
1.509455, -0.8541172, 4.080692, 1, 0, 0.2941177, 1,
1.520739, 0.8271992, 0.7571365, 1, 0, 0.2862745, 1,
1.533513, 0.4066246, 2.259899, 1, 0, 0.282353, 1,
1.542438, -0.833271, 3.565328, 1, 0, 0.2745098, 1,
1.5507, -0.2075666, 1.822986, 1, 0, 0.2705882, 1,
1.551847, 0.4815697, 3.005515, 1, 0, 0.2627451, 1,
1.57202, -0.9331309, 4.602994, 1, 0, 0.2588235, 1,
1.573311, 0.07177621, 1.267311, 1, 0, 0.2509804, 1,
1.586863, 1.774158, 0.7054907, 1, 0, 0.2470588, 1,
1.590214, 0.6431712, 1.568933, 1, 0, 0.2392157, 1,
1.63212, -0.05023824, 2.417747, 1, 0, 0.2352941, 1,
1.632625, -2.430899, 2.858888, 1, 0, 0.227451, 1,
1.640392, -0.06248774, 0.3926979, 1, 0, 0.2235294, 1,
1.649401, 2.123028, 0.7715164, 1, 0, 0.2156863, 1,
1.662998, -1.303133, 1.787451, 1, 0, 0.2117647, 1,
1.664528, -0.3432243, 1.667863, 1, 0, 0.2039216, 1,
1.667809, -1.39575, 2.65203, 1, 0, 0.1960784, 1,
1.683061, -1.110329, 2.329692, 1, 0, 0.1921569, 1,
1.683959, -1.372573, 3.286738, 1, 0, 0.1843137, 1,
1.707555, 0.2541547, 1.41376, 1, 0, 0.1803922, 1,
1.727539, -0.195182, 1.506046, 1, 0, 0.172549, 1,
1.782824, 0.4597951, 0.6418247, 1, 0, 0.1686275, 1,
1.785465, -0.7588682, 1.884038, 1, 0, 0.1607843, 1,
1.792513, 0.01010774, 2.224977, 1, 0, 0.1568628, 1,
1.805391, 0.05096548, 1.083789, 1, 0, 0.1490196, 1,
1.825491, 0.3750313, 1.28571, 1, 0, 0.145098, 1,
1.827093, -2.406553, 1.072021, 1, 0, 0.1372549, 1,
1.832766, 1.803763, 2.437509, 1, 0, 0.1333333, 1,
1.890081, 0.6675977, 0.07349516, 1, 0, 0.1254902, 1,
1.955061, 1.671666, 0.419297, 1, 0, 0.1215686, 1,
1.958413, 0.3145855, 2.085386, 1, 0, 0.1137255, 1,
1.973193, 0.7497041, 1.076039, 1, 0, 0.1098039, 1,
1.979107, 0.02038551, 2.032578, 1, 0, 0.1019608, 1,
1.988746, -0.07028093, 1.224166, 1, 0, 0.09411765, 1,
2.000761, -0.4276956, 0.1104625, 1, 0, 0.09019608, 1,
2.066349, -1.827544, 3.049829, 1, 0, 0.08235294, 1,
2.086088, -1.166736, 2.32926, 1, 0, 0.07843138, 1,
2.10413, 0.8286611, 2.972581, 1, 0, 0.07058824, 1,
2.119852, 0.9475186, 0.6453843, 1, 0, 0.06666667, 1,
2.240297, -0.3000125, 2.246016, 1, 0, 0.05882353, 1,
2.281496, 0.6304535, 1.326512, 1, 0, 0.05490196, 1,
2.357307, 0.2177523, 1.402547, 1, 0, 0.04705882, 1,
2.380778, -0.2835926, 2.203395, 1, 0, 0.04313726, 1,
2.428986, 0.5787932, -0.06962267, 1, 0, 0.03529412, 1,
2.473016, -1.137983, 2.204524, 1, 0, 0.03137255, 1,
2.539634, 0.222525, 0.4210604, 1, 0, 0.02352941, 1,
2.666578, -0.7578591, 1.21509, 1, 0, 0.01960784, 1,
2.672242, -0.8276251, 1.676359, 1, 0, 0.01176471, 1,
2.713745, -0.6606178, 2.297152, 1, 0, 0.007843138, 1
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
-0.2441683, -3.918392, -7.290468, 0, -0.5, 0.5, 0.5,
-0.2441683, -3.918392, -7.290468, 1, -0.5, 0.5, 0.5,
-0.2441683, -3.918392, -7.290468, 1, 1.5, 0.5, 0.5,
-0.2441683, -3.918392, -7.290468, 0, 1.5, 0.5, 0.5
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
-4.204814, 0.1785812, -7.290468, 0, -0.5, 0.5, 0.5,
-4.204814, 0.1785812, -7.290468, 1, -0.5, 0.5, 0.5,
-4.204814, 0.1785812, -7.290468, 1, 1.5, 0.5, 0.5,
-4.204814, 0.1785812, -7.290468, 0, 1.5, 0.5, 0.5
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
-4.204814, -3.918392, -0.3771074, 0, -0.5, 0.5, 0.5,
-4.204814, -3.918392, -0.3771074, 1, -0.5, 0.5, 0.5,
-4.204814, -3.918392, -0.3771074, 1, 1.5, 0.5, 0.5,
-4.204814, -3.918392, -0.3771074, 0, 1.5, 0.5, 0.5
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
-3, -2.972937, -5.695077,
2, -2.972937, -5.695077,
-3, -2.972937, -5.695077,
-3, -3.130513, -5.960976,
-2, -2.972937, -5.695077,
-2, -3.130513, -5.960976,
-1, -2.972937, -5.695077,
-1, -3.130513, -5.960976,
0, -2.972937, -5.695077,
0, -3.130513, -5.960976,
1, -2.972937, -5.695077,
1, -3.130513, -5.960976,
2, -2.972937, -5.695077,
2, -3.130513, -5.960976
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
-3, -3.445665, -6.492773, 0, -0.5, 0.5, 0.5,
-3, -3.445665, -6.492773, 1, -0.5, 0.5, 0.5,
-3, -3.445665, -6.492773, 1, 1.5, 0.5, 0.5,
-3, -3.445665, -6.492773, 0, 1.5, 0.5, 0.5,
-2, -3.445665, -6.492773, 0, -0.5, 0.5, 0.5,
-2, -3.445665, -6.492773, 1, -0.5, 0.5, 0.5,
-2, -3.445665, -6.492773, 1, 1.5, 0.5, 0.5,
-2, -3.445665, -6.492773, 0, 1.5, 0.5, 0.5,
-1, -3.445665, -6.492773, 0, -0.5, 0.5, 0.5,
-1, -3.445665, -6.492773, 1, -0.5, 0.5, 0.5,
-1, -3.445665, -6.492773, 1, 1.5, 0.5, 0.5,
-1, -3.445665, -6.492773, 0, 1.5, 0.5, 0.5,
0, -3.445665, -6.492773, 0, -0.5, 0.5, 0.5,
0, -3.445665, -6.492773, 1, -0.5, 0.5, 0.5,
0, -3.445665, -6.492773, 1, 1.5, 0.5, 0.5,
0, -3.445665, -6.492773, 0, 1.5, 0.5, 0.5,
1, -3.445665, -6.492773, 0, -0.5, 0.5, 0.5,
1, -3.445665, -6.492773, 1, -0.5, 0.5, 0.5,
1, -3.445665, -6.492773, 1, 1.5, 0.5, 0.5,
1, -3.445665, -6.492773, 0, 1.5, 0.5, 0.5,
2, -3.445665, -6.492773, 0, -0.5, 0.5, 0.5,
2, -3.445665, -6.492773, 1, -0.5, 0.5, 0.5,
2, -3.445665, -6.492773, 1, 1.5, 0.5, 0.5,
2, -3.445665, -6.492773, 0, 1.5, 0.5, 0.5
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
-3.290819, -2, -5.695077,
-3.290819, 3, -5.695077,
-3.290819, -2, -5.695077,
-3.443151, -2, -5.960976,
-3.290819, -1, -5.695077,
-3.443151, -1, -5.960976,
-3.290819, 0, -5.695077,
-3.443151, 0, -5.960976,
-3.290819, 1, -5.695077,
-3.443151, 1, -5.960976,
-3.290819, 2, -5.695077,
-3.443151, 2, -5.960976,
-3.290819, 3, -5.695077,
-3.443151, 3, -5.960976
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
-3.747816, -2, -6.492773, 0, -0.5, 0.5, 0.5,
-3.747816, -2, -6.492773, 1, -0.5, 0.5, 0.5,
-3.747816, -2, -6.492773, 1, 1.5, 0.5, 0.5,
-3.747816, -2, -6.492773, 0, 1.5, 0.5, 0.5,
-3.747816, -1, -6.492773, 0, -0.5, 0.5, 0.5,
-3.747816, -1, -6.492773, 1, -0.5, 0.5, 0.5,
-3.747816, -1, -6.492773, 1, 1.5, 0.5, 0.5,
-3.747816, -1, -6.492773, 0, 1.5, 0.5, 0.5,
-3.747816, 0, -6.492773, 0, -0.5, 0.5, 0.5,
-3.747816, 0, -6.492773, 1, -0.5, 0.5, 0.5,
-3.747816, 0, -6.492773, 1, 1.5, 0.5, 0.5,
-3.747816, 0, -6.492773, 0, 1.5, 0.5, 0.5,
-3.747816, 1, -6.492773, 0, -0.5, 0.5, 0.5,
-3.747816, 1, -6.492773, 1, -0.5, 0.5, 0.5,
-3.747816, 1, -6.492773, 1, 1.5, 0.5, 0.5,
-3.747816, 1, -6.492773, 0, 1.5, 0.5, 0.5,
-3.747816, 2, -6.492773, 0, -0.5, 0.5, 0.5,
-3.747816, 2, -6.492773, 1, -0.5, 0.5, 0.5,
-3.747816, 2, -6.492773, 1, 1.5, 0.5, 0.5,
-3.747816, 2, -6.492773, 0, 1.5, 0.5, 0.5,
-3.747816, 3, -6.492773, 0, -0.5, 0.5, 0.5,
-3.747816, 3, -6.492773, 1, -0.5, 0.5, 0.5,
-3.747816, 3, -6.492773, 1, 1.5, 0.5, 0.5,
-3.747816, 3, -6.492773, 0, 1.5, 0.5, 0.5
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
-3.290819, -2.972937, -4,
-3.290819, -2.972937, 4,
-3.290819, -2.972937, -4,
-3.443151, -3.130513, -4,
-3.290819, -2.972937, -2,
-3.443151, -3.130513, -2,
-3.290819, -2.972937, 0,
-3.443151, -3.130513, 0,
-3.290819, -2.972937, 2,
-3.443151, -3.130513, 2,
-3.290819, -2.972937, 4,
-3.443151, -3.130513, 4
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
-3.747816, -3.445665, -4, 0, -0.5, 0.5, 0.5,
-3.747816, -3.445665, -4, 1, -0.5, 0.5, 0.5,
-3.747816, -3.445665, -4, 1, 1.5, 0.5, 0.5,
-3.747816, -3.445665, -4, 0, 1.5, 0.5, 0.5,
-3.747816, -3.445665, -2, 0, -0.5, 0.5, 0.5,
-3.747816, -3.445665, -2, 1, -0.5, 0.5, 0.5,
-3.747816, -3.445665, -2, 1, 1.5, 0.5, 0.5,
-3.747816, -3.445665, -2, 0, 1.5, 0.5, 0.5,
-3.747816, -3.445665, 0, 0, -0.5, 0.5, 0.5,
-3.747816, -3.445665, 0, 1, -0.5, 0.5, 0.5,
-3.747816, -3.445665, 0, 1, 1.5, 0.5, 0.5,
-3.747816, -3.445665, 0, 0, 1.5, 0.5, 0.5,
-3.747816, -3.445665, 2, 0, -0.5, 0.5, 0.5,
-3.747816, -3.445665, 2, 1, -0.5, 0.5, 0.5,
-3.747816, -3.445665, 2, 1, 1.5, 0.5, 0.5,
-3.747816, -3.445665, 2, 0, 1.5, 0.5, 0.5,
-3.747816, -3.445665, 4, 0, -0.5, 0.5, 0.5,
-3.747816, -3.445665, 4, 1, -0.5, 0.5, 0.5,
-3.747816, -3.445665, 4, 1, 1.5, 0.5, 0.5,
-3.747816, -3.445665, 4, 0, 1.5, 0.5, 0.5
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
-3.290819, -2.972937, -5.695077,
-3.290819, 3.3301, -5.695077,
-3.290819, -2.972937, 4.940863,
-3.290819, 3.3301, 4.940863,
-3.290819, -2.972937, -5.695077,
-3.290819, -2.972937, 4.940863,
-3.290819, 3.3301, -5.695077,
-3.290819, 3.3301, 4.940863,
-3.290819, -2.972937, -5.695077,
2.802482, -2.972937, -5.695077,
-3.290819, -2.972937, 4.940863,
2.802482, -2.972937, 4.940863,
-3.290819, 3.3301, -5.695077,
2.802482, 3.3301, -5.695077,
-3.290819, 3.3301, 4.940863,
2.802482, 3.3301, 4.940863,
2.802482, -2.972937, -5.695077,
2.802482, 3.3301, -5.695077,
2.802482, -2.972937, 4.940863,
2.802482, 3.3301, 4.940863,
2.802482, -2.972937, -5.695077,
2.802482, -2.972937, 4.940863,
2.802482, 3.3301, -5.695077,
2.802482, 3.3301, 4.940863
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
var radius = 7.360023;
var distance = 32.74557;
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
mvMatrix.translate( 0.2441683, -0.1785812, 0.3771074 );
mvMatrix.scale( 1.305992, 1.262534, 0.7481992 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.74557);
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
pentachlorobenzonitr<-read.table("pentachlorobenzonitr.xyz")
```

```
## Error in read.table("pentachlorobenzonitr.xyz"): no lines available in input
```

```r
x<-pentachlorobenzonitr$V2
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzonitr' not found
```

```r
y<-pentachlorobenzonitr$V3
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzonitr' not found
```

```r
z<-pentachlorobenzonitr$V4
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzonitr' not found
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
-3.202081, -0.1131041, -1.154262, 0, 0, 1, 1, 1,
-2.65577, -0.1911692, -1.804975, 1, 0, 0, 1, 1,
-2.642334, 2.299989, 0.4736215, 1, 0, 0, 1, 1,
-2.491077, -1.151719, -2.175742, 1, 0, 0, 1, 1,
-2.486145, -0.8584675, -3.606408, 1, 0, 0, 1, 1,
-2.45525, 0.9459551, -1.53824, 1, 0, 0, 1, 1,
-2.286869, 0.1145426, -1.943402, 0, 0, 0, 1, 1,
-2.279993, 0.07219761, -3.154799, 0, 0, 0, 1, 1,
-2.272545, -1.531422, -3.804716, 0, 0, 0, 1, 1,
-2.255049, 0.3221691, -1.045941, 0, 0, 0, 1, 1,
-2.176014, 0.2726788, -0.8159382, 0, 0, 0, 1, 1,
-2.170249, -0.1233689, -1.024103, 0, 0, 0, 1, 1,
-2.166816, 1.065339, -1.168384, 0, 0, 0, 1, 1,
-2.162144, -0.3800109, -1.438, 1, 1, 1, 1, 1,
-2.158607, -0.7712926, 0.01122354, 1, 1, 1, 1, 1,
-2.146959, 0.5512257, -1.445348, 1, 1, 1, 1, 1,
-2.079455, -0.5136005, -3.982906, 1, 1, 1, 1, 1,
-2.072713, 0.9734629, -1.694227, 1, 1, 1, 1, 1,
-2.05532, -1.149344, -1.961379, 1, 1, 1, 1, 1,
-2.036234, -0.3880954, -1.542, 1, 1, 1, 1, 1,
-1.967816, -0.2237869, -2.000478, 1, 1, 1, 1, 1,
-1.960522, 0.1465306, 0.06031032, 1, 1, 1, 1, 1,
-1.959734, -1.503192, -3.714835, 1, 1, 1, 1, 1,
-1.951624, 0.6367178, -0.8970032, 1, 1, 1, 1, 1,
-1.951134, -0.4653242, -1.631137, 1, 1, 1, 1, 1,
-1.940461, 0.04287918, -2.430838, 1, 1, 1, 1, 1,
-1.883911, 0.2372762, -1.336369, 1, 1, 1, 1, 1,
-1.870237, -0.7753947, -4.211051, 1, 1, 1, 1, 1,
-1.867239, 0.8437033, -2.506767, 0, 0, 1, 1, 1,
-1.854318, -0.8954273, -1.934215, 1, 0, 0, 1, 1,
-1.849392, -1.126119, -0.8484489, 1, 0, 0, 1, 1,
-1.839434, 0.9658895, -1.460859, 1, 0, 0, 1, 1,
-1.829859, 0.4974151, -0.5483015, 1, 0, 0, 1, 1,
-1.798061, 2.658416, -1.259879, 1, 0, 0, 1, 1,
-1.781566, 0.5349981, -1.795098, 0, 0, 0, 1, 1,
-1.776018, -0.1533958, -0.7949141, 0, 0, 0, 1, 1,
-1.772416, 0.1695862, -2.52553, 0, 0, 0, 1, 1,
-1.749282, 1.099813, -1.298867, 0, 0, 0, 1, 1,
-1.74159, 0.5581711, -0.6308965, 0, 0, 0, 1, 1,
-1.739079, -0.8875791, -2.556797, 0, 0, 0, 1, 1,
-1.734781, -0.6337522, -3.307668, 0, 0, 0, 1, 1,
-1.732815, 0.8966923, -1.92448, 1, 1, 1, 1, 1,
-1.703847, 0.05375379, -0.3943302, 1, 1, 1, 1, 1,
-1.694881, 0.02485528, -1.973886, 1, 1, 1, 1, 1,
-1.673722, 0.2686756, -2.24943, 1, 1, 1, 1, 1,
-1.668244, -1.589392, -4.034411, 1, 1, 1, 1, 1,
-1.653861, 0.1627695, -1.234962, 1, 1, 1, 1, 1,
-1.646988, 1.645572, 0.8052755, 1, 1, 1, 1, 1,
-1.641012, -1.649464, -1.000471, 1, 1, 1, 1, 1,
-1.636088, 2.08973, 0.6394105, 1, 1, 1, 1, 1,
-1.606845, 1.676972, -1.225948, 1, 1, 1, 1, 1,
-1.593075, 0.3866885, -2.693472, 1, 1, 1, 1, 1,
-1.573298, 2.445874, -1.11952, 1, 1, 1, 1, 1,
-1.571518, 0.2719982, -1.038883, 1, 1, 1, 1, 1,
-1.566948, 0.146727, -1.609915, 1, 1, 1, 1, 1,
-1.547486, -0.2412179, -1.528267, 1, 1, 1, 1, 1,
-1.530711, -0.3217005, -3.301847, 0, 0, 1, 1, 1,
-1.528406, 0.5283735, -1.442019, 1, 0, 0, 1, 1,
-1.523219, 1.120418, -1.160012, 1, 0, 0, 1, 1,
-1.521606, -0.2311269, -1.222636, 1, 0, 0, 1, 1,
-1.514636, 0.7643225, -2.811155, 1, 0, 0, 1, 1,
-1.507337, 0.2417863, -0.836655, 1, 0, 0, 1, 1,
-1.501283, -0.543385, -2.744872, 0, 0, 0, 1, 1,
-1.476035, -1.600283, -3.016167, 0, 0, 0, 1, 1,
-1.475228, -0.8604724, -3.358708, 0, 0, 0, 1, 1,
-1.46761, 0.3389907, -0.833037, 0, 0, 0, 1, 1,
-1.465331, 0.3209311, -2.512697, 0, 0, 0, 1, 1,
-1.448799, -1.914968, -3.250479, 0, 0, 0, 1, 1,
-1.444768, 0.9082663, -1.138726, 0, 0, 0, 1, 1,
-1.436128, -1.61647, -0.747295, 1, 1, 1, 1, 1,
-1.427552, -0.4769498, -3.093858, 1, 1, 1, 1, 1,
-1.418424, -0.8373423, -1.804276, 1, 1, 1, 1, 1,
-1.407666, 1.293206, -0.6643849, 1, 1, 1, 1, 1,
-1.407658, 0.01815191, -2.16825, 1, 1, 1, 1, 1,
-1.40462, 1.047858, -0.440836, 1, 1, 1, 1, 1,
-1.403886, -0.3791756, -2.431945, 1, 1, 1, 1, 1,
-1.402726, -1.079061, -0.9547914, 1, 1, 1, 1, 1,
-1.364385, -0.6684754, -2.624027, 1, 1, 1, 1, 1,
-1.356599, 1.574708, -0.008400716, 1, 1, 1, 1, 1,
-1.352003, -1.125289, -0.6826751, 1, 1, 1, 1, 1,
-1.347353, -2.072082, -2.678848, 1, 1, 1, 1, 1,
-1.344895, -0.04239394, -2.505157, 1, 1, 1, 1, 1,
-1.336469, -1.24633, -1.204878, 1, 1, 1, 1, 1,
-1.333888, 0.1592164, -1.410462, 1, 1, 1, 1, 1,
-1.303702, 0.1760184, -2.425711, 0, 0, 1, 1, 1,
-1.296017, 0.6436919, -0.5425998, 1, 0, 0, 1, 1,
-1.291128, 1.038371, -0.983389, 1, 0, 0, 1, 1,
-1.27324, 0.8065121, -2.560021, 1, 0, 0, 1, 1,
-1.270762, -0.5597844, -1.594193, 1, 0, 0, 1, 1,
-1.268484, -1.227825, -2.80278, 1, 0, 0, 1, 1,
-1.247794, -0.5187984, -0.9999477, 0, 0, 0, 1, 1,
-1.2436, 1.201462, 0.2147531, 0, 0, 0, 1, 1,
-1.239682, 1.037312, -0.6414847, 0, 0, 0, 1, 1,
-1.2392, 0.7036718, -0.7443516, 0, 0, 0, 1, 1,
-1.237273, 1.043758, -0.5990275, 0, 0, 0, 1, 1,
-1.234848, -0.8207856, -3.432592, 0, 0, 0, 1, 1,
-1.233414, -1.227344, -0.9822221, 0, 0, 0, 1, 1,
-1.210684, 0.2123874, -3.401892, 1, 1, 1, 1, 1,
-1.210227, -0.5551688, -1.570474, 1, 1, 1, 1, 1,
-1.195276, 0.02831685, -0.5403202, 1, 1, 1, 1, 1,
-1.193964, 1.47622, 1.266083, 1, 1, 1, 1, 1,
-1.193607, 1.425891, 0.1823331, 1, 1, 1, 1, 1,
-1.188648, -1.288463, -3.190788, 1, 1, 1, 1, 1,
-1.182354, 0.7248717, -1.212095, 1, 1, 1, 1, 1,
-1.179218, 0.6321626, -0.8569015, 1, 1, 1, 1, 1,
-1.179044, -1.377773, -1.163812, 1, 1, 1, 1, 1,
-1.170868, -0.2263811, -1.055471, 1, 1, 1, 1, 1,
-1.170453, 1.230461, -1.585359, 1, 1, 1, 1, 1,
-1.145958, 1.288161, -1.077303, 1, 1, 1, 1, 1,
-1.145863, 0.119296, -2.740031, 1, 1, 1, 1, 1,
-1.145088, 0.252075, -1.83496, 1, 1, 1, 1, 1,
-1.137017, 0.6203029, 1.970842, 1, 1, 1, 1, 1,
-1.130734, 0.1041517, -1.165472, 0, 0, 1, 1, 1,
-1.129414, -1.249633, -1.817499, 1, 0, 0, 1, 1,
-1.125592, -0.3683732, -2.151268, 1, 0, 0, 1, 1,
-1.125384, 1.038509, 0.1966631, 1, 0, 0, 1, 1,
-1.120937, -0.4961819, -3.115165, 1, 0, 0, 1, 1,
-1.118781, -0.1289724, -2.264046, 1, 0, 0, 1, 1,
-1.116401, -0.168515, -1.94679, 0, 0, 0, 1, 1,
-1.11037, -2.400493, -1.980158, 0, 0, 0, 1, 1,
-1.110283, 0.9690267, -1.612041, 0, 0, 0, 1, 1,
-1.105793, -0.1544884, -2.798798, 0, 0, 0, 1, 1,
-1.103166, -0.3281913, -1.123589, 0, 0, 0, 1, 1,
-1.100594, -0.9123029, -1.755312, 0, 0, 0, 1, 1,
-1.099104, -1.954062, -3.295972, 0, 0, 0, 1, 1,
-1.098687, 0.376334, -1.218083, 1, 1, 1, 1, 1,
-1.097882, -1.630783, -2.595407, 1, 1, 1, 1, 1,
-1.094268, -0.7326868, -2.539794, 1, 1, 1, 1, 1,
-1.090967, -0.5037235, -1.688751, 1, 1, 1, 1, 1,
-1.086479, -0.3909512, -1.9723, 1, 1, 1, 1, 1,
-1.08258, 1.176292, 0.1800993, 1, 1, 1, 1, 1,
-1.080549, -0.2838047, -2.513971, 1, 1, 1, 1, 1,
-1.074416, 0.242508, -2.302001, 1, 1, 1, 1, 1,
-1.06881, -0.8641074, -2.834721, 1, 1, 1, 1, 1,
-1.067604, 0.458431, -1.28861, 1, 1, 1, 1, 1,
-1.063265, -0.9644508, -3.027503, 1, 1, 1, 1, 1,
-1.059433, 0.2048943, -1.345319, 1, 1, 1, 1, 1,
-1.057198, 0.6190788, -1.093858, 1, 1, 1, 1, 1,
-1.056199, 0.02082691, -2.37942, 1, 1, 1, 1, 1,
-1.055419, -0.9494247, -2.216402, 1, 1, 1, 1, 1,
-1.05528, -2.33094, -3.34042, 0, 0, 1, 1, 1,
-1.052079, -0.873854, -5.540185, 1, 0, 0, 1, 1,
-1.049479, 0.5653687, -1.4612, 1, 0, 0, 1, 1,
-1.042835, -0.2610347, -1.728257, 1, 0, 0, 1, 1,
-1.038494, -0.6627344, -2.709745, 1, 0, 0, 1, 1,
-1.034103, -0.6822431, -0.9204338, 1, 0, 0, 1, 1,
-1.031793, 1.597377, -2.187013, 0, 0, 0, 1, 1,
-1.029168, 0.2406491, -1.881505, 0, 0, 0, 1, 1,
-1.027747, -1.027765, -3.052441, 0, 0, 0, 1, 1,
-1.02569, 1.235682, -0.2756092, 0, 0, 0, 1, 1,
-1.024933, 0.8329864, -0.4358063, 0, 0, 0, 1, 1,
-1.012462, 0.1710136, -1.715311, 0, 0, 0, 1, 1,
-1.006744, 1.332788, -1.401012, 0, 0, 0, 1, 1,
-1.005892, 0.2679026, -0.9703846, 1, 1, 1, 1, 1,
-0.9981491, -0.7289702, -2.98817, 1, 1, 1, 1, 1,
-0.9948519, -1.717797, -4.182638, 1, 1, 1, 1, 1,
-0.9927709, -0.02525701, -2.387504, 1, 1, 1, 1, 1,
-0.9858081, -0.4380517, -1.89213, 1, 1, 1, 1, 1,
-0.9775036, 0.1105371, 0.05119766, 1, 1, 1, 1, 1,
-0.9773437, 0.7821011, 0.1903384, 1, 1, 1, 1, 1,
-0.9769011, -0.5512555, -1.80512, 1, 1, 1, 1, 1,
-0.976751, 0.1459269, -0.5062631, 1, 1, 1, 1, 1,
-0.9746706, -0.1041325, -1.906156, 1, 1, 1, 1, 1,
-0.9628813, -1.313931, -2.172479, 1, 1, 1, 1, 1,
-0.9585767, 2.117132, -0.5675348, 1, 1, 1, 1, 1,
-0.957683, 0.2113288, -1.539583, 1, 1, 1, 1, 1,
-0.9550383, 1.106594, -1.363818, 1, 1, 1, 1, 1,
-0.9535455, 1.569658, -0.3824982, 1, 1, 1, 1, 1,
-0.953278, 1.220602, 0.9723579, 0, 0, 1, 1, 1,
-0.9439155, 0.785333, 0.05196407, 1, 0, 0, 1, 1,
-0.9432671, -1.079295, -1.17596, 1, 0, 0, 1, 1,
-0.9369728, -0.204186, -2.604595, 1, 0, 0, 1, 1,
-0.9295629, 0.5559731, 0.03591525, 1, 0, 0, 1, 1,
-0.9283631, 0.1818761, -1.842383, 1, 0, 0, 1, 1,
-0.9250345, 0.1552494, -0.2079765, 0, 0, 0, 1, 1,
-0.9238829, 0.8857557, -1.258325, 0, 0, 0, 1, 1,
-0.9156832, -0.7061481, -1.698586, 0, 0, 0, 1, 1,
-0.9034052, 0.6986499, -0.9568428, 0, 0, 0, 1, 1,
-0.8903696, 0.379462, -0.6223903, 0, 0, 0, 1, 1,
-0.8868222, -1.143743, -1.568462, 0, 0, 0, 1, 1,
-0.8785777, 1.131814, -2.751038, 0, 0, 0, 1, 1,
-0.8734253, -0.9167733, -1.441928, 1, 1, 1, 1, 1,
-0.871635, -0.6402697, -2.36992, 1, 1, 1, 1, 1,
-0.8688713, 0.5728933, -1.824029, 1, 1, 1, 1, 1,
-0.8652009, -0.1389872, -1.753254, 1, 1, 1, 1, 1,
-0.8651115, 0.08174994, -3.004229, 1, 1, 1, 1, 1,
-0.8602304, -0.6685481, -1.795469, 1, 1, 1, 1, 1,
-0.8584137, -0.7154784, -1.258407, 1, 1, 1, 1, 1,
-0.8501922, 1.001721, -0.07037076, 1, 1, 1, 1, 1,
-0.8491319, -0.2150195, 1.19047, 1, 1, 1, 1, 1,
-0.8444505, -1.521087, -1.382879, 1, 1, 1, 1, 1,
-0.8418373, -0.3155749, -1.988467, 1, 1, 1, 1, 1,
-0.8346776, -2.510205, -2.696772, 1, 1, 1, 1, 1,
-0.8342965, 0.2093245, 0.4007409, 1, 1, 1, 1, 1,
-0.8292117, -2.11972, -3.149259, 1, 1, 1, 1, 1,
-0.8287409, 0.7355902, -3.200969, 1, 1, 1, 1, 1,
-0.8226349, 1.09882, -0.4292097, 0, 0, 1, 1, 1,
-0.8138618, 0.1199736, 0.432696, 1, 0, 0, 1, 1,
-0.8090627, 0.2255192, 0.01960885, 1, 0, 0, 1, 1,
-0.8073372, -0.90053, -3.042005, 1, 0, 0, 1, 1,
-0.8064025, 0.7924541, -1.63979, 1, 0, 0, 1, 1,
-0.8020745, -0.5711005, -3.614815, 1, 0, 0, 1, 1,
-0.7931257, 0.731984, -1.620179, 0, 0, 0, 1, 1,
-0.7922821, -0.0050532, -3.089412, 0, 0, 0, 1, 1,
-0.7921774, -0.8024532, -2.237034, 0, 0, 0, 1, 1,
-0.7872901, 1.905351, 0.1457761, 0, 0, 0, 1, 1,
-0.78668, 1.811928, 1.216526, 0, 0, 0, 1, 1,
-0.7803951, -1.189044, -3.692713, 0, 0, 0, 1, 1,
-0.7748175, 1.054963, -0.2174909, 0, 0, 0, 1, 1,
-0.7703689, 0.009793879, -0.8550931, 1, 1, 1, 1, 1,
-0.7684478, -1.433641, -4.937236, 1, 1, 1, 1, 1,
-0.7569578, 0.8021268, -1.16042, 1, 1, 1, 1, 1,
-0.7535008, 0.8366343, -0.211517, 1, 1, 1, 1, 1,
-0.7524489, 1.482518, -2.0322, 1, 1, 1, 1, 1,
-0.7481288, 2.166151, 0.8719594, 1, 1, 1, 1, 1,
-0.7429448, -0.5620286, -3.38611, 1, 1, 1, 1, 1,
-0.7265854, -0.6209836, -2.588496, 1, 1, 1, 1, 1,
-0.7253502, 0.8058649, -1.18487, 1, 1, 1, 1, 1,
-0.7195228, 0.7494064, -2.13984, 1, 1, 1, 1, 1,
-0.7193547, 0.5543787, -0.8160005, 1, 1, 1, 1, 1,
-0.7177001, 1.219174, -0.3006281, 1, 1, 1, 1, 1,
-0.7160351, -0.5360014, -1.723081, 1, 1, 1, 1, 1,
-0.7143132, 0.7449847, 0.03071112, 1, 1, 1, 1, 1,
-0.7123774, 0.9071906, -0.2545254, 1, 1, 1, 1, 1,
-0.7060687, 0.1705889, 0.2394964, 0, 0, 1, 1, 1,
-0.7051114, -1.187526, -3.250633, 1, 0, 0, 1, 1,
-0.7047235, -2.041852, -1.57299, 1, 0, 0, 1, 1,
-0.7018219, 0.8515348, 0.6374894, 1, 0, 0, 1, 1,
-0.6956334, 0.2437716, -1.483809, 1, 0, 0, 1, 1,
-0.6945674, 0.1548541, -2.564007, 1, 0, 0, 1, 1,
-0.6941988, 0.8645279, -2.086156, 0, 0, 0, 1, 1,
-0.6928053, 0.1149128, -0.3616905, 0, 0, 0, 1, 1,
-0.690896, 0.3740823, 0.8465185, 0, 0, 0, 1, 1,
-0.6865665, 1.484416, -0.7399188, 0, 0, 0, 1, 1,
-0.6845009, -0.2974136, -1.056274, 0, 0, 0, 1, 1,
-0.6820836, 0.7562141, -1.002176, 0, 0, 0, 1, 1,
-0.6789415, -0.582095, -2.398253, 0, 0, 0, 1, 1,
-0.6737205, -1.717297, -0.7752133, 1, 1, 1, 1, 1,
-0.6720223, 0.2245441, -0.5089255, 1, 1, 1, 1, 1,
-0.6703683, -0.3418172, -1.1319, 1, 1, 1, 1, 1,
-0.665319, -1.239137, -4.229482, 1, 1, 1, 1, 1,
-0.6649783, -0.4877901, -0.9784035, 1, 1, 1, 1, 1,
-0.6644887, -0.9163709, -0.795898, 1, 1, 1, 1, 1,
-0.6551324, 0.8887341, -1.279609, 1, 1, 1, 1, 1,
-0.6545473, -1.288107, -3.956323, 1, 1, 1, 1, 1,
-0.6534398, 0.3151199, -1.902208, 1, 1, 1, 1, 1,
-0.6462741, 0.7557561, -1.573052, 1, 1, 1, 1, 1,
-0.6439177, -0.1085312, -0.5591092, 1, 1, 1, 1, 1,
-0.6429849, 0.9463086, -2.09885, 1, 1, 1, 1, 1,
-0.641969, 0.1673582, -1.473894, 1, 1, 1, 1, 1,
-0.6410631, 0.4418999, -1.241899, 1, 1, 1, 1, 1,
-0.6408129, 0.3308228, -1.045348, 1, 1, 1, 1, 1,
-0.637767, 0.9248339, -1.474496, 0, 0, 1, 1, 1,
-0.6359065, 0.4555834, -1.840245, 1, 0, 0, 1, 1,
-0.6356189, -0.2323312, -2.319557, 1, 0, 0, 1, 1,
-0.633058, 0.9875013, 0.2178974, 1, 0, 0, 1, 1,
-0.6279767, -0.5112212, -0.7419462, 1, 0, 0, 1, 1,
-0.6271608, -0.227093, 0.6759568, 1, 0, 0, 1, 1,
-0.6262314, 0.2680059, -1.578292, 0, 0, 0, 1, 1,
-0.6252496, 0.2009376, -1.091721, 0, 0, 0, 1, 1,
-0.6248817, 1.155987, -0.254689, 0, 0, 0, 1, 1,
-0.6244052, -0.05180924, -0.1301537, 0, 0, 0, 1, 1,
-0.6205972, -0.319914, -0.6941169, 0, 0, 0, 1, 1,
-0.6198428, -1.789498, -3.89519, 0, 0, 0, 1, 1,
-0.6178273, 0.3606153, 0.7721044, 0, 0, 0, 1, 1,
-0.61652, -0.7446252, -1.637161, 1, 1, 1, 1, 1,
-0.6053969, -0.2691328, -0.4349231, 1, 1, 1, 1, 1,
-0.6048906, 0.7447224, -0.2673043, 1, 1, 1, 1, 1,
-0.6047024, 1.146793, -1.291682, 1, 1, 1, 1, 1,
-0.5905488, -0.08147801, -0.9745317, 1, 1, 1, 1, 1,
-0.5755762, -1.067464, -2.352359, 1, 1, 1, 1, 1,
-0.5741217, 1.114947, -0.07651347, 1, 1, 1, 1, 1,
-0.5733297, -0.4727172, -4.137951, 1, 1, 1, 1, 1,
-0.5727657, 0.396312, -2.567569, 1, 1, 1, 1, 1,
-0.5727385, 1.241909, -1.051415, 1, 1, 1, 1, 1,
-0.5725332, 0.4687183, -0.6761509, 1, 1, 1, 1, 1,
-0.5712089, 0.2751764, -0.473022, 1, 1, 1, 1, 1,
-0.566896, 1.956189, -1.132061, 1, 1, 1, 1, 1,
-0.5643012, 1.191476, 0.2626688, 1, 1, 1, 1, 1,
-0.5635478, -0.7773816, -1.293549, 1, 1, 1, 1, 1,
-0.5609918, -0.7316151, -0.6447822, 0, 0, 1, 1, 1,
-0.5598801, 0.4242532, 0.2915171, 1, 0, 0, 1, 1,
-0.5582296, 0.9090082, -0.9351457, 1, 0, 0, 1, 1,
-0.5577413, -1.0116, -3.923083, 1, 0, 0, 1, 1,
-0.5569278, 0.5787692, -1.815951, 1, 0, 0, 1, 1,
-0.5557612, -0.8986658, -2.104998, 1, 0, 0, 1, 1,
-0.5498899, 0.5700451, 0.6134542, 0, 0, 0, 1, 1,
-0.5463116, 2.666598, -1.032562, 0, 0, 0, 1, 1,
-0.5445115, -0.6077837, -2.395774, 0, 0, 0, 1, 1,
-0.5411685, -1.609127, -1.581596, 0, 0, 0, 1, 1,
-0.532542, 0.479177, -1.13562, 0, 0, 0, 1, 1,
-0.5211354, -0.02071005, -1.566415, 0, 0, 0, 1, 1,
-0.5211344, 0.5670219, 2.228436, 0, 0, 0, 1, 1,
-0.5208569, -1.065584, -2.32164, 1, 1, 1, 1, 1,
-0.5191468, -1.247541, -4.395601, 1, 1, 1, 1, 1,
-0.5138285, 0.2598384, -0.7855368, 1, 1, 1, 1, 1,
-0.5118736, 0.9828321, 0.781399, 1, 1, 1, 1, 1,
-0.509611, 1.043168, 0.03282924, 1, 1, 1, 1, 1,
-0.5087532, 0.181985, -0.2397993, 1, 1, 1, 1, 1,
-0.4923875, 1.687964, -0.2942621, 1, 1, 1, 1, 1,
-0.4915114, 0.9882228, 0.4279552, 1, 1, 1, 1, 1,
-0.4907283, 0.8680754, 0.2460936, 1, 1, 1, 1, 1,
-0.4887748, 0.8478092, -0.5287814, 1, 1, 1, 1, 1,
-0.485685, 0.1670552, -1.071997, 1, 1, 1, 1, 1,
-0.4849821, 0.09233348, -3.027421, 1, 1, 1, 1, 1,
-0.482327, 0.4911947, -1.915547, 1, 1, 1, 1, 1,
-0.4800702, -1.957029, -4.151359, 1, 1, 1, 1, 1,
-0.4709832, -0.9102873, -3.338203, 1, 1, 1, 1, 1,
-0.4703474, 0.1951124, -1.616466, 0, 0, 1, 1, 1,
-0.4679497, 0.03365082, -3.898146, 1, 0, 0, 1, 1,
-0.4588304, 0.9099132, -0.5576288, 1, 0, 0, 1, 1,
-0.4560638, -0.6361095, -2.389849, 1, 0, 0, 1, 1,
-0.450655, 0.9031705, -0.9416951, 1, 0, 0, 1, 1,
-0.4403467, 1.242517, 0.659663, 1, 0, 0, 1, 1,
-0.4391329, -1.782296, -2.684524, 0, 0, 0, 1, 1,
-0.4366405, 1.177667, -0.8403653, 0, 0, 0, 1, 1,
-0.4357958, 0.5184128, 0.2141473, 0, 0, 0, 1, 1,
-0.4348306, 0.7140847, -0.02661872, 0, 0, 0, 1, 1,
-0.4342811, -0.522646, -2.023531, 0, 0, 0, 1, 1,
-0.4315629, -1.656358, -4.685018, 0, 0, 0, 1, 1,
-0.4308451, -0.5806352, -1.388244, 0, 0, 0, 1, 1,
-0.430456, 0.03217883, -0.3131832, 1, 1, 1, 1, 1,
-0.4278026, 0.635032, -0.6254756, 1, 1, 1, 1, 1,
-0.4270995, -0.7790756, -4.083091, 1, 1, 1, 1, 1,
-0.4242958, 0.08310532, -1.377948, 1, 1, 1, 1, 1,
-0.4240415, -1.980753, -3.652079, 1, 1, 1, 1, 1,
-0.4216855, 0.8568815, -1.345705, 1, 1, 1, 1, 1,
-0.4190782, -0.0428999, -1.814098, 1, 1, 1, 1, 1,
-0.4188309, -1.165507, -3.133168, 1, 1, 1, 1, 1,
-0.4173345, -0.1634186, -2.038456, 1, 1, 1, 1, 1,
-0.4134175, 0.1393504, -1.373564, 1, 1, 1, 1, 1,
-0.4107033, -1.085891, -1.364264, 1, 1, 1, 1, 1,
-0.4068069, -0.1816038, -2.10697, 1, 1, 1, 1, 1,
-0.3982507, 0.1974648, -3.022313, 1, 1, 1, 1, 1,
-0.3950917, 0.6951168, -1.796832, 1, 1, 1, 1, 1,
-0.3910918, -0.4261179, -3.88457, 1, 1, 1, 1, 1,
-0.3893697, 0.4479375, -0.2426245, 0, 0, 1, 1, 1,
-0.3888428, -1.926975, -2.127205, 1, 0, 0, 1, 1,
-0.3883578, -0.3054366, -2.860124, 1, 0, 0, 1, 1,
-0.3875935, 0.9411002, -1.091662, 1, 0, 0, 1, 1,
-0.3847998, -0.8095919, -3.321581, 1, 0, 0, 1, 1,
-0.3841835, -0.2209579, -1.75222, 1, 0, 0, 1, 1,
-0.3832152, 0.585142, -0.8018574, 0, 0, 0, 1, 1,
-0.3828046, 0.4009295, -1.523649, 0, 0, 0, 1, 1,
-0.3790017, 0.835013, -1.014991, 0, 0, 0, 1, 1,
-0.3782495, -0.09221904, -2.214182, 0, 0, 0, 1, 1,
-0.3766793, -0.03455295, -1.519495, 0, 0, 0, 1, 1,
-0.375989, 3.113253, -1.18308, 0, 0, 0, 1, 1,
-0.3755216, -0.4100386, -1.527524, 0, 0, 0, 1, 1,
-0.3744599, -1.011113, -3.858879, 1, 1, 1, 1, 1,
-0.3727841, 0.6192454, 0.9610696, 1, 1, 1, 1, 1,
-0.3707356, -1.302493, -2.908036, 1, 1, 1, 1, 1,
-0.3681723, -1.203602, -4.980565, 1, 1, 1, 1, 1,
-0.3673149, -1.224329, -2.435353, 1, 1, 1, 1, 1,
-0.3634941, -0.4987928, -1.020872, 1, 1, 1, 1, 1,
-0.3625985, -2.07386, -2.146089, 1, 1, 1, 1, 1,
-0.3616034, 1.394236, 0.1424371, 1, 1, 1, 1, 1,
-0.3558429, 0.4875152, -0.2034387, 1, 1, 1, 1, 1,
-0.3525411, -0.0822081, -0.9062505, 1, 1, 1, 1, 1,
-0.3494587, -0.439445, -1.883087, 1, 1, 1, 1, 1,
-0.3414496, 0.8701274, -1.337039, 1, 1, 1, 1, 1,
-0.3332941, 1.289192, -1.489871, 1, 1, 1, 1, 1,
-0.3326676, -0.1792316, -3.048994, 1, 1, 1, 1, 1,
-0.3313257, -0.1053173, -3.062169, 1, 1, 1, 1, 1,
-0.3269064, -0.6748151, -3.813767, 0, 0, 1, 1, 1,
-0.3243351, -0.5180062, -1.933746, 1, 0, 0, 1, 1,
-0.3213004, -1.819361, -2.568631, 1, 0, 0, 1, 1,
-0.3209581, 0.02838399, -1.661254, 1, 0, 0, 1, 1,
-0.3160896, -0.4791503, -1.156017, 1, 0, 0, 1, 1,
-0.3130795, 0.6615546, -0.2830217, 1, 0, 0, 1, 1,
-0.312726, -0.8212345, -3.264974, 0, 0, 0, 1, 1,
-0.3108377, 1.914353, -0.6769738, 0, 0, 0, 1, 1,
-0.3081167, 0.5741606, 0.03925713, 0, 0, 0, 1, 1,
-0.3070354, 0.8851042, 1.221767, 0, 0, 0, 1, 1,
-0.305964, -0.01714709, 0.3918004, 0, 0, 0, 1, 1,
-0.3022817, -0.3275963, -4.054962, 0, 0, 0, 1, 1,
-0.2970143, 0.6717122, 0.7079192, 0, 0, 0, 1, 1,
-0.2947621, 0.3819723, -0.6082617, 1, 1, 1, 1, 1,
-0.2921039, 0.1991422, -2.721752, 1, 1, 1, 1, 1,
-0.2904062, 3.238308, -1.661983, 1, 1, 1, 1, 1,
-0.2882783, 1.071825, 0.1229556, 1, 1, 1, 1, 1,
-0.284386, -0.9664208, -4.366104, 1, 1, 1, 1, 1,
-0.2783467, 0.3629763, -1.957628, 1, 1, 1, 1, 1,
-0.2723951, -0.3011494, -2.826033, 1, 1, 1, 1, 1,
-0.2723416, -0.4912498, -0.05006288, 1, 1, 1, 1, 1,
-0.2716456, 0.1289291, -1.936651, 1, 1, 1, 1, 1,
-0.2699764, -0.3483088, -2.20577, 1, 1, 1, 1, 1,
-0.267566, -1.615356, -3.981165, 1, 1, 1, 1, 1,
-0.260038, -0.1529562, -0.2321695, 1, 1, 1, 1, 1,
-0.2586442, -0.3227557, -3.363682, 1, 1, 1, 1, 1,
-0.2583935, 1.417226, -0.8092377, 1, 1, 1, 1, 1,
-0.2563626, -1.438462, -3.797302, 1, 1, 1, 1, 1,
-0.2529398, 1.610415, -0.606076, 0, 0, 1, 1, 1,
-0.2510934, -0.3976496, -3.356109, 1, 0, 0, 1, 1,
-0.2451991, -1.026854, -3.196056, 1, 0, 0, 1, 1,
-0.2451914, -0.1889659, -2.90238, 1, 0, 0, 1, 1,
-0.2379072, -0.09138189, -1.736497, 1, 0, 0, 1, 1,
-0.2344577, -0.4444667, -2.676676, 1, 0, 0, 1, 1,
-0.2344168, 0.06658226, -0.3922332, 0, 0, 0, 1, 1,
-0.2340481, 0.05157323, -0.3514647, 0, 0, 0, 1, 1,
-0.2318871, -0.5298239, -4.712874, 0, 0, 0, 1, 1,
-0.2308808, 0.8249021, 0.07772647, 0, 0, 0, 1, 1,
-0.2294446, -2.178762, -3.123619, 0, 0, 0, 1, 1,
-0.2282346, 0.6038825, -1.493846, 0, 0, 0, 1, 1,
-0.2274913, -0.4297458, -1.555557, 0, 0, 0, 1, 1,
-0.2259333, -1.424274, -2.89473, 1, 1, 1, 1, 1,
-0.2238414, -1.519144, -3.070012, 1, 1, 1, 1, 1,
-0.2237497, 1.438237, -0.1399839, 1, 1, 1, 1, 1,
-0.2182474, -0.6020131, -2.017202, 1, 1, 1, 1, 1,
-0.2181371, -0.005807868, -0.7451406, 1, 1, 1, 1, 1,
-0.2168427, 0.6252589, 0.2686768, 1, 1, 1, 1, 1,
-0.2073529, -1.266417, -3.163927, 1, 1, 1, 1, 1,
-0.2034892, 1.01545, 1.226999, 1, 1, 1, 1, 1,
-0.2032012, 0.4893984, -0.7380527, 1, 1, 1, 1, 1,
-0.2021953, -1.475271, -3.608124, 1, 1, 1, 1, 1,
-0.2007466, -0.2268823, -1.470301, 1, 1, 1, 1, 1,
-0.1976347, -0.1944973, -4.185783, 1, 1, 1, 1, 1,
-0.196508, -0.5505114, -3.445406, 1, 1, 1, 1, 1,
-0.1933196, -0.219618, -2.669455, 1, 1, 1, 1, 1,
-0.1930554, 0.09821092, -1.81069, 1, 1, 1, 1, 1,
-0.1912695, -1.47824, -3.443954, 0, 0, 1, 1, 1,
-0.1912599, 1.260869, -0.1343997, 1, 0, 0, 1, 1,
-0.1892961, -0.6337519, -2.876103, 1, 0, 0, 1, 1,
-0.1784336, -1.128768, -4.853626, 1, 0, 0, 1, 1,
-0.1765802, -0.009385498, -2.130783, 1, 0, 0, 1, 1,
-0.1696356, -0.0193788, -1.623396, 1, 0, 0, 1, 1,
-0.1665568, -0.8254665, -2.547523, 0, 0, 0, 1, 1,
-0.1641749, -0.5972391, -2.056874, 0, 0, 0, 1, 1,
-0.1553522, -1.842895, -2.553599, 0, 0, 0, 1, 1,
-0.152466, -0.6236533, -3.473297, 0, 0, 0, 1, 1,
-0.1519044, 0.9301022, -0.341496, 0, 0, 0, 1, 1,
-0.1518307, -0.2758675, -3.503439, 0, 0, 0, 1, 1,
-0.1511938, 1.099987, -0.9527615, 0, 0, 0, 1, 1,
-0.1494763, -0.5004995, -1.252094, 1, 1, 1, 1, 1,
-0.1481596, -1.140436, -3.750268, 1, 1, 1, 1, 1,
-0.1450072, -0.5939661, -2.341513, 1, 1, 1, 1, 1,
-0.1425962, -0.7098929, -4.315027, 1, 1, 1, 1, 1,
-0.1416319, 0.07657883, -1.995305, 1, 1, 1, 1, 1,
-0.1408092, 0.08982361, -2.584782, 1, 1, 1, 1, 1,
-0.1398045, 0.1821583, 0.7078268, 1, 1, 1, 1, 1,
-0.1380782, 0.1684158, 0.2364252, 1, 1, 1, 1, 1,
-0.134987, -0.8548344, -2.444454, 1, 1, 1, 1, 1,
-0.1349502, 1.210749, -1.665259, 1, 1, 1, 1, 1,
-0.1324102, 0.2263785, 0.3011396, 1, 1, 1, 1, 1,
-0.1318954, -0.3229466, -2.482492, 1, 1, 1, 1, 1,
-0.1316174, -0.2582359, -5.148992, 1, 1, 1, 1, 1,
-0.1308979, 0.449328, -1.209582, 1, 1, 1, 1, 1,
-0.1307894, 0.4337387, 0.2575102, 1, 1, 1, 1, 1,
-0.1285009, -1.569672, -3.467737, 0, 0, 1, 1, 1,
-0.1240954, 0.1900551, -0.02695019, 1, 0, 0, 1, 1,
-0.1220471, 0.660821, -1.397197, 1, 0, 0, 1, 1,
-0.1207036, 0.8538315, -0.03500932, 1, 0, 0, 1, 1,
-0.1203755, 0.02287189, -1.835058, 1, 0, 0, 1, 1,
-0.1166739, 0.09548334, -2.100861, 1, 0, 0, 1, 1,
-0.1136049, -0.1915033, -3.353325, 0, 0, 0, 1, 1,
-0.1131365, -0.7705793, -2.606858, 0, 0, 0, 1, 1,
-0.1111818, -0.3574483, -2.943003, 0, 0, 0, 1, 1,
-0.1102354, 0.7873908, 0.2779863, 0, 0, 0, 1, 1,
-0.1086888, -1.364071, -3.370269, 0, 0, 0, 1, 1,
-0.1069442, 1.13984, -3.153453, 0, 0, 0, 1, 1,
-0.1063002, 0.2523571, -0.7299492, 0, 0, 0, 1, 1,
-0.105515, -0.3255622, -2.943378, 1, 1, 1, 1, 1,
-0.1003146, -0.7569501, -0.8396738, 1, 1, 1, 1, 1,
-0.09979653, -0.6050828, -1.244447, 1, 1, 1, 1, 1,
-0.09623147, -0.5607118, -1.738265, 1, 1, 1, 1, 1,
-0.09450631, -0.1403119, -2.060349, 1, 1, 1, 1, 1,
-0.09137507, 1.975048, 0.6800785, 1, 1, 1, 1, 1,
-0.0908115, -0.8044609, -1.136849, 1, 1, 1, 1, 1,
-0.08982941, 0.2268262, 0.2621786, 1, 1, 1, 1, 1,
-0.08876292, 1.222459, 0.198631, 1, 1, 1, 1, 1,
-0.08578359, -0.2538172, -1.90455, 1, 1, 1, 1, 1,
-0.08413608, 0.9380813, 0.02251276, 1, 1, 1, 1, 1,
-0.07169494, 1.219143, 0.7076082, 1, 1, 1, 1, 1,
-0.06933387, 0.6088545, 1.348413, 1, 1, 1, 1, 1,
-0.06912035, -0.1826309, -4.131535, 1, 1, 1, 1, 1,
-0.06908961, -0.2247665, -4.49933, 1, 1, 1, 1, 1,
-0.0675751, -0.659511, -0.9463513, 0, 0, 1, 1, 1,
-0.06752251, -2.229716, -2.96315, 1, 0, 0, 1, 1,
-0.05784011, -1.248556, -2.268835, 1, 0, 0, 1, 1,
-0.05707417, 1.157669, 1.214104, 1, 0, 0, 1, 1,
-0.0540789, -0.5826613, -3.130349, 1, 0, 0, 1, 1,
-0.05328337, -1.09664, -2.779591, 1, 0, 0, 1, 1,
-0.05276359, -1.519981, -2.839133, 0, 0, 0, 1, 1,
-0.04994261, -0.3285677, -2.418145, 0, 0, 0, 1, 1,
-0.0451378, 1.880978, 0.2127271, 0, 0, 0, 1, 1,
-0.04417241, 1.221044, 1.331592, 0, 0, 0, 1, 1,
-0.04400641, 0.4817471, -1.806847, 0, 0, 0, 1, 1,
-0.04271872, 0.6981085, -0.5049219, 0, 0, 0, 1, 1,
-0.03503063, -1.761492, -4.387155, 0, 0, 0, 1, 1,
-0.03394235, -0.2982768, -2.18954, 1, 1, 1, 1, 1,
-0.03379012, 1.348538, 1.206399, 1, 1, 1, 1, 1,
-0.03352123, 0.6961602, -1.866393, 1, 1, 1, 1, 1,
-0.03340926, -0.4724259, -2.637118, 1, 1, 1, 1, 1,
-0.03277452, 0.3072774, 1.134053, 1, 1, 1, 1, 1,
-0.03179388, -0.4401049, -2.17728, 1, 1, 1, 1, 1,
-0.03151202, 0.536956, 0.5450185, 1, 1, 1, 1, 1,
-0.02803569, -0.3982942, -1.541762, 1, 1, 1, 1, 1,
-0.02692953, 0.396546, 1.238906, 1, 1, 1, 1, 1,
-0.02691819, 0.8983742, -0.6542571, 1, 1, 1, 1, 1,
-0.02632245, 0.2070372, 0.4039739, 1, 1, 1, 1, 1,
-0.02539558, -0.8373232, -3.878908, 1, 1, 1, 1, 1,
-0.02470212, -0.3509293, -2.679983, 1, 1, 1, 1, 1,
-0.02384465, 0.07456166, -0.07804342, 1, 1, 1, 1, 1,
-0.02217139, -1.160165, -2.327892, 1, 1, 1, 1, 1,
-0.01593975, 1.153318, -0.04191582, 0, 0, 1, 1, 1,
-0.01369411, -0.3595383, -2.828583, 1, 0, 0, 1, 1,
-0.01189902, 0.7418467, 0.2234791, 1, 0, 0, 1, 1,
-0.009259395, -1.026288, -4.020795, 1, 0, 0, 1, 1,
-0.005231191, -0.2338124, -2.719241, 1, 0, 0, 1, 1,
-0.003999406, 0.01807548, 0.4912146, 1, 0, 0, 1, 1,
-0.001814075, 0.6254429, 0.4458576, 0, 0, 0, 1, 1,
-0.001592814, 0.8213586, 0.5813317, 0, 0, 0, 1, 1,
0.001424655, -1.215785, 2.126474, 0, 0, 0, 1, 1,
0.004369766, -0.666193, 2.518978, 0, 0, 0, 1, 1,
0.006134381, 1.02643, 1.478374, 0, 0, 0, 1, 1,
0.007171089, 0.9299828, 0.7058329, 0, 0, 0, 1, 1,
0.009429163, -0.9766606, 2.721524, 0, 0, 0, 1, 1,
0.01075392, 0.5882081, -1.259004, 1, 1, 1, 1, 1,
0.01368728, 0.6503807, 2.916336, 1, 1, 1, 1, 1,
0.01516993, 1.194219, 0.6994708, 1, 1, 1, 1, 1,
0.01894997, 0.924968, 0.6805393, 1, 1, 1, 1, 1,
0.01983388, -0.3191144, 2.352466, 1, 1, 1, 1, 1,
0.01988403, 0.02010631, 0.763988, 1, 1, 1, 1, 1,
0.02098301, 0.6883024, -1.168124, 1, 1, 1, 1, 1,
0.02250398, -0.1887009, 3.439238, 1, 1, 1, 1, 1,
0.02454698, 0.6520782, 0.4795616, 1, 1, 1, 1, 1,
0.02525748, -2.734381, 2.067958, 1, 1, 1, 1, 1,
0.02974845, 0.643723, 1.595356, 1, 1, 1, 1, 1,
0.03071278, 2.122831, 1.976481, 1, 1, 1, 1, 1,
0.03149121, -0.3842209, 1.994464, 1, 1, 1, 1, 1,
0.03447304, -1.051266, 2.219012, 1, 1, 1, 1, 1,
0.03651724, -0.4018393, 3.699796, 1, 1, 1, 1, 1,
0.03658294, -1.067912, 3.061311, 0, 0, 1, 1, 1,
0.04443285, 0.3328305, 0.9015809, 1, 0, 0, 1, 1,
0.04482321, -1.15368, 1.809093, 1, 0, 0, 1, 1,
0.04549426, -0.7981883, 2.567586, 1, 0, 0, 1, 1,
0.046747, -0.348077, 3.274705, 1, 0, 0, 1, 1,
0.04979935, 1.360455, 1.135364, 1, 0, 0, 1, 1,
0.05077042, 0.8468006, -0.3552416, 0, 0, 0, 1, 1,
0.05357739, -0.8441527, 1.166904, 0, 0, 0, 1, 1,
0.05608993, -0.00659046, 0.2260455, 0, 0, 0, 1, 1,
0.05813535, -0.2916306, 4.413533, 0, 0, 0, 1, 1,
0.05884547, 0.4389634, -0.1517401, 0, 0, 0, 1, 1,
0.05937095, -0.09533376, 3.219035, 0, 0, 0, 1, 1,
0.05984959, -0.2113878, 4.505635, 0, 0, 0, 1, 1,
0.0634561, -0.358166, 4.442463, 1, 1, 1, 1, 1,
0.06573556, -0.3703663, 3.924495, 1, 1, 1, 1, 1,
0.06600704, -1.706718, 3.343249, 1, 1, 1, 1, 1,
0.06692696, 0.8398902, 3.744184, 1, 1, 1, 1, 1,
0.06751847, 0.9735179, 0.4874023, 1, 1, 1, 1, 1,
0.06756331, 1.06145, -0.09181517, 1, 1, 1, 1, 1,
0.06809264, 0.7056994, -0.984386, 1, 1, 1, 1, 1,
0.06969769, -0.3050124, 3.076597, 1, 1, 1, 1, 1,
0.07206125, 0.7703971, -0.4010625, 1, 1, 1, 1, 1,
0.0731784, -0.5866692, 4.206661, 1, 1, 1, 1, 1,
0.07820627, 0.3458587, 2.041512, 1, 1, 1, 1, 1,
0.08511009, 1.843912, 0.4587387, 1, 1, 1, 1, 1,
0.08771338, 0.5204182, -0.3024215, 1, 1, 1, 1, 1,
0.0882104, -0.1176243, 2.02632, 1, 1, 1, 1, 1,
0.08977564, -0.8763769, 3.640716, 1, 1, 1, 1, 1,
0.09088027, 0.5014613, -0.8382359, 0, 0, 1, 1, 1,
0.09249827, 0.2269376, -0.7578807, 1, 0, 0, 1, 1,
0.09518272, -1.21591, 3.13418, 1, 0, 0, 1, 1,
0.09567244, -0.06035591, 2.98738, 1, 0, 0, 1, 1,
0.09667441, 0.05128059, 0.8703774, 1, 0, 0, 1, 1,
0.0998157, 0.9658673, -1.334317, 1, 0, 0, 1, 1,
0.1001137, 1.528374, -0.2190558, 0, 0, 0, 1, 1,
0.1004452, -1.472833, 1.783309, 0, 0, 0, 1, 1,
0.1004461, 0.5492567, -0.6006976, 0, 0, 0, 1, 1,
0.1023293, 1.847194, 0.3843384, 0, 0, 0, 1, 1,
0.1047266, -0.8008, 2.226024, 0, 0, 0, 1, 1,
0.1061949, -0.4278919, 4.615273, 0, 0, 0, 1, 1,
0.1085606, 1.267403, 1.5534, 0, 0, 0, 1, 1,
0.1116593, -0.06749839, 1.757803, 1, 1, 1, 1, 1,
0.1130252, -0.1570295, 3.234665, 1, 1, 1, 1, 1,
0.1167997, 1.754323, -0.219821, 1, 1, 1, 1, 1,
0.1170977, -0.8982655, 2.771521, 1, 1, 1, 1, 1,
0.1181491, 0.1550788, 1.021239, 1, 1, 1, 1, 1,
0.1199166, 1.931231, -1.328883, 1, 1, 1, 1, 1,
0.1227962, 1.406196, 0.8775536, 1, 1, 1, 1, 1,
0.1236663, -0.8144562, 1.393068, 1, 1, 1, 1, 1,
0.1354914, 2.015852, -0.7275254, 1, 1, 1, 1, 1,
0.1380126, 1.805279, 0.9731619, 1, 1, 1, 1, 1,
0.144195, 0.6120816, -0.9898925, 1, 1, 1, 1, 1,
0.1460868, -0.1028503, 2.443289, 1, 1, 1, 1, 1,
0.148133, -0.2926967, 3.897055, 1, 1, 1, 1, 1,
0.1515811, 0.4122174, 2.296905, 1, 1, 1, 1, 1,
0.1595419, 0.07316586, 1.560953, 1, 1, 1, 1, 1,
0.1628429, -0.1226743, 1.349035, 0, 0, 1, 1, 1,
0.1630584, 0.8507774, -0.03167911, 1, 0, 0, 1, 1,
0.1639552, 0.6019467, 0.7049094, 1, 0, 0, 1, 1,
0.1671491, 0.654088, -0.1733585, 1, 0, 0, 1, 1,
0.167521, -1.194499, 3.39827, 1, 0, 0, 1, 1,
0.1692268, 1.006471, 0.8471491, 1, 0, 0, 1, 1,
0.1697748, 0.9474029, 1.814559, 0, 0, 0, 1, 1,
0.1731368, -0.4501177, 4.467282, 0, 0, 0, 1, 1,
0.1743728, 0.2498902, 0.4851335, 0, 0, 0, 1, 1,
0.1749678, 0.2649942, 0.5865294, 0, 0, 0, 1, 1,
0.1764204, 0.3554143, 0.5565787, 0, 0, 0, 1, 1,
0.177073, 1.644814, 0.5978636, 0, 0, 0, 1, 1,
0.1780386, -2.347327, 2.463686, 0, 0, 0, 1, 1,
0.1800312, -1.178875, 2.993739, 1, 1, 1, 1, 1,
0.1844806, 0.523801, 1.219394, 1, 1, 1, 1, 1,
0.1876758, -1.230184, 1.669173, 1, 1, 1, 1, 1,
0.1943386, -1.724929, 2.778175, 1, 1, 1, 1, 1,
0.1949017, -0.8659779, 1.092815, 1, 1, 1, 1, 1,
0.1969096, 0.3771741, 1.426102, 1, 1, 1, 1, 1,
0.1984575, -0.2039605, 3.240963, 1, 1, 1, 1, 1,
0.2050766, -0.3514126, 3.319288, 1, 1, 1, 1, 1,
0.2102809, -0.9364611, 2.434667, 1, 1, 1, 1, 1,
0.2163019, 1.465101, -1.596295, 1, 1, 1, 1, 1,
0.2203247, -0.4857645, 3.662539, 1, 1, 1, 1, 1,
0.2228298, 1.440687, -0.468824, 1, 1, 1, 1, 1,
0.2331851, 0.005701329, 0.9967332, 1, 1, 1, 1, 1,
0.2336238, -0.4744458, 4.117184, 1, 1, 1, 1, 1,
0.2363626, -0.525069, 2.564422, 1, 1, 1, 1, 1,
0.2411124, -1.5313, 2.242897, 0, 0, 1, 1, 1,
0.2436567, -1.915182, 2.561153, 1, 0, 0, 1, 1,
0.2530054, -1.113383, 2.771466, 1, 0, 0, 1, 1,
0.2554269, -0.5014281, 2.301866, 1, 0, 0, 1, 1,
0.261687, 1.024134, 1.221213, 1, 0, 0, 1, 1,
0.2642745, -1.811963, 1.117597, 1, 0, 0, 1, 1,
0.2815222, 1.263222, 0.6396773, 0, 0, 0, 1, 1,
0.2905383, -0.2399275, 3.205228, 0, 0, 0, 1, 1,
0.2945554, 0.1179844, 0.4932021, 0, 0, 0, 1, 1,
0.2950356, -0.2550058, 1.248517, 0, 0, 0, 1, 1,
0.2961425, -0.4471555, 4.340646, 0, 0, 0, 1, 1,
0.2964955, -0.6895483, 2.962872, 0, 0, 0, 1, 1,
0.2972007, 0.4125032, -0.1512636, 0, 0, 0, 1, 1,
0.3011672, 0.5073028, 0.3571517, 1, 1, 1, 1, 1,
0.3073094, 0.1960688, 0.6129047, 1, 1, 1, 1, 1,
0.3073681, -1.64304, 2.678323, 1, 1, 1, 1, 1,
0.3075345, 0.547424, 1.085441, 1, 1, 1, 1, 1,
0.3124951, 1.450259, -1.953529, 1, 1, 1, 1, 1,
0.3145306, -0.3228926, 2.204381, 1, 1, 1, 1, 1,
0.3155102, 0.3256195, -0.484047, 1, 1, 1, 1, 1,
0.3213692, -1.007809, 2.399622, 1, 1, 1, 1, 1,
0.3252192, 0.2221489, -0.3274784, 1, 1, 1, 1, 1,
0.3252378, -1.927111, 4.370953, 1, 1, 1, 1, 1,
0.3277937, 0.5306271, 1.80939, 1, 1, 1, 1, 1,
0.3279222, -2.188329, 2.344738, 1, 1, 1, 1, 1,
0.3287387, -0.3511471, 2.398337, 1, 1, 1, 1, 1,
0.3291907, 0.3887068, 1.669747, 1, 1, 1, 1, 1,
0.3291943, 1.883787, 0.4127734, 1, 1, 1, 1, 1,
0.3316385, -1.585173, 1.133118, 0, 0, 1, 1, 1,
0.3320172, 1.383706, 1.402703, 1, 0, 0, 1, 1,
0.3328418, 0.4931825, 0.6389076, 1, 0, 0, 1, 1,
0.3458545, -0.8278762, 1.834686, 1, 0, 0, 1, 1,
0.3458656, 0.9406556, -2.370174, 1, 0, 0, 1, 1,
0.3489063, -0.780225, 2.973222, 1, 0, 0, 1, 1,
0.3491187, -0.08955649, 1.604461, 0, 0, 0, 1, 1,
0.351572, -0.5038365, 2.24373, 0, 0, 0, 1, 1,
0.3526106, 0.3841047, -0.7695953, 0, 0, 0, 1, 1,
0.3549046, 1.912026, -0.6962548, 0, 0, 0, 1, 1,
0.3553731, 0.1917178, 2.460673, 0, 0, 0, 1, 1,
0.3593056, 0.7788328, -0.4713033, 0, 0, 0, 1, 1,
0.3630366, 0.1172218, -0.2726834, 0, 0, 0, 1, 1,
0.3689189, 0.2630018, 1.487206, 1, 1, 1, 1, 1,
0.3701592, 1.205507, 1.355754, 1, 1, 1, 1, 1,
0.3705191, -0.04863745, 2.206104, 1, 1, 1, 1, 1,
0.3759142, -0.3226554, 2.472396, 1, 1, 1, 1, 1,
0.3763612, -0.4103436, 1.827738, 1, 1, 1, 1, 1,
0.3772215, -1.214972, 3.693704, 1, 1, 1, 1, 1,
0.3776582, -2.551775, 2.744035, 1, 1, 1, 1, 1,
0.3793668, -2.339082, 1.387947, 1, 1, 1, 1, 1,
0.3807137, 0.8771845, 0.6610591, 1, 1, 1, 1, 1,
0.3823478, 0.2235028, 1.239322, 1, 1, 1, 1, 1,
0.3824441, 0.1368064, 0.8874963, 1, 1, 1, 1, 1,
0.384465, 0.2798969, -0.9927375, 1, 1, 1, 1, 1,
0.3913919, -1.071256, 2.124091, 1, 1, 1, 1, 1,
0.3949895, -0.8675659, 1.607932, 1, 1, 1, 1, 1,
0.3958638, -0.1185249, 1.844435, 1, 1, 1, 1, 1,
0.3969383, -0.260344, 0.3335084, 0, 0, 1, 1, 1,
0.407933, -0.7125174, 3.881295, 1, 0, 0, 1, 1,
0.4105417, -0.2028161, 3.986633, 1, 0, 0, 1, 1,
0.4118293, -0.5536093, 1.623495, 1, 0, 0, 1, 1,
0.4143196, -1.363096, 4.079, 1, 0, 0, 1, 1,
0.4150698, 2.018058, -1.099711, 1, 0, 0, 1, 1,
0.416903, -0.4457849, 1.438923, 0, 0, 0, 1, 1,
0.4296855, -1.130115, 3.626739, 0, 0, 0, 1, 1,
0.4313475, 1.650333, -0.6463013, 0, 0, 0, 1, 1,
0.4314088, -1.089416, 1.542861, 0, 0, 0, 1, 1,
0.4316567, 1.605019, -1.304991, 0, 0, 0, 1, 1,
0.432188, -0.5744566, 1.314322, 0, 0, 0, 1, 1,
0.43704, 0.143171, 1.418068, 0, 0, 0, 1, 1,
0.4396722, -0.3559208, 2.99989, 1, 1, 1, 1, 1,
0.440796, -0.5380677, 4.006588, 1, 1, 1, 1, 1,
0.4418317, -0.01383732, 1.472918, 1, 1, 1, 1, 1,
0.4448836, -0.7931326, 2.7397, 1, 1, 1, 1, 1,
0.4466599, 1.956552, 0.8904027, 1, 1, 1, 1, 1,
0.4510677, -0.6951678, 1.636672, 1, 1, 1, 1, 1,
0.4535848, -0.4218225, 1.880092, 1, 1, 1, 1, 1,
0.4550672, -0.6164224, 2.219705, 1, 1, 1, 1, 1,
0.4555408, 1.534002, 1.572495, 1, 1, 1, 1, 1,
0.4588957, -0.08742505, 0.1498502, 1, 1, 1, 1, 1,
0.4592373, 0.02452808, 0.7215127, 1, 1, 1, 1, 1,
0.4602455, 1.122225, 0.2107019, 1, 1, 1, 1, 1,
0.460254, 1.489667, 1.6609, 1, 1, 1, 1, 1,
0.4627176, 1.942726, -0.1457781, 1, 1, 1, 1, 1,
0.46573, 0.1467869, -0.09434058, 1, 1, 1, 1, 1,
0.4717889, -0.783814, 2.169942, 0, 0, 1, 1, 1,
0.4799992, 1.0252, 0.8835167, 1, 0, 0, 1, 1,
0.4807926, -0.91399, 1.704057, 1, 0, 0, 1, 1,
0.4815461, -0.271664, 0.7565136, 1, 0, 0, 1, 1,
0.4896535, 0.8089038, 0.1285783, 1, 0, 0, 1, 1,
0.4913163, 0.3218565, 1.84541, 1, 0, 0, 1, 1,
0.5078967, -0.1569184, 1.944595, 0, 0, 0, 1, 1,
0.5087739, -0.9971043, 3.710303, 0, 0, 0, 1, 1,
0.5132102, 0.7051385, 0.3715979, 0, 0, 0, 1, 1,
0.5140418, -0.2907237, 3.023385, 0, 0, 0, 1, 1,
0.521232, 0.01045351, 0.3529394, 0, 0, 0, 1, 1,
0.5333127, 0.476332, 0.852991, 0, 0, 0, 1, 1,
0.5349793, 0.3235161, 1.062105, 0, 0, 0, 1, 1,
0.5379226, 1.365429, 1.53415, 1, 1, 1, 1, 1,
0.5396536, -1.69104, 1.752817, 1, 1, 1, 1, 1,
0.5397537, 0.2929905, 1.323144, 1, 1, 1, 1, 1,
0.5433198, 0.2488607, 1.351466, 1, 1, 1, 1, 1,
0.5443805, 2.15835, -0.1242975, 1, 1, 1, 1, 1,
0.5502517, 0.2545114, 3.131052, 1, 1, 1, 1, 1,
0.5535333, 1.414565, -0.1432558, 1, 1, 1, 1, 1,
0.5559619, -0.638547, 2.569336, 1, 1, 1, 1, 1,
0.5644972, -0.8188873, 1.499667, 1, 1, 1, 1, 1,
0.5645852, -0.5356615, 2.971926, 1, 1, 1, 1, 1,
0.5668436, -0.05356482, 1.785426, 1, 1, 1, 1, 1,
0.5690814, 1.246429, 1.695997, 1, 1, 1, 1, 1,
0.5792223, -0.1519821, 0.9772913, 1, 1, 1, 1, 1,
0.583177, 0.6654443, 2.116542, 1, 1, 1, 1, 1,
0.5835132, -0.8429574, 2.432872, 1, 1, 1, 1, 1,
0.5862898, 0.6040714, 0.1672745, 0, 0, 1, 1, 1,
0.5865855, 1.455373, 0.4104988, 1, 0, 0, 1, 1,
0.5893994, 0.7271103, 0.9115132, 1, 0, 0, 1, 1,
0.5902561, 0.8825005, 0.8672758, 1, 0, 0, 1, 1,
0.5907225, 0.5357365, 1.335614, 1, 0, 0, 1, 1,
0.5965356, 0.5585719, -0.4632294, 1, 0, 0, 1, 1,
0.5976807, 0.6879411, 1.062865, 0, 0, 0, 1, 1,
0.598266, -2.871986, 4.24002, 0, 0, 0, 1, 1,
0.5996209, 0.3336575, 1.67758, 0, 0, 0, 1, 1,
0.6022094, 0.3772512, 0.4184184, 0, 0, 0, 1, 1,
0.6068614, 1.866508, -0.751447, 0, 0, 0, 1, 1,
0.6103109, 0.8789328, 0.7400745, 0, 0, 0, 1, 1,
0.6150489, -0.6755188, 1.832559, 0, 0, 0, 1, 1,
0.6229736, -1.016782, 3.647985, 1, 1, 1, 1, 1,
0.6305881, 0.04335877, 1.937297, 1, 1, 1, 1, 1,
0.6353886, -0.01643969, 1.288764, 1, 1, 1, 1, 1,
0.6389452, 0.06534018, 1.053834, 1, 1, 1, 1, 1,
0.6421481, -0.04113532, 0.9108736, 1, 1, 1, 1, 1,
0.645611, 0.4850687, 0.7143213, 1, 1, 1, 1, 1,
0.6488593, -0.4463831, 2.298504, 1, 1, 1, 1, 1,
0.6497841, -0.7429751, 1.695309, 1, 1, 1, 1, 1,
0.6561779, -0.8212948, 2.878383, 1, 1, 1, 1, 1,
0.6568344, -0.2989654, 3.368198, 1, 1, 1, 1, 1,
0.656943, -1.567895, 3.934402, 1, 1, 1, 1, 1,
0.6632414, 0.06438015, 1.504399, 1, 1, 1, 1, 1,
0.6633741, 1.154667, 0.9015129, 1, 1, 1, 1, 1,
0.6668496, -1.188302, 3.548973, 1, 1, 1, 1, 1,
0.6719061, 0.3767917, 0.6176155, 1, 1, 1, 1, 1,
0.6736619, -1.398375, 2.132833, 0, 0, 1, 1, 1,
0.6782263, -0.7708164, 1.395322, 1, 0, 0, 1, 1,
0.6822337, 0.5382349, 3.446361, 1, 0, 0, 1, 1,
0.68246, 0.794575, 1.465812, 1, 0, 0, 1, 1,
0.6843157, 1.509877, 0.175119, 1, 0, 0, 1, 1,
0.687889, 0.3497332, 2.341475, 1, 0, 0, 1, 1,
0.6884287, -0.007806992, -0.2867937, 0, 0, 0, 1, 1,
0.6896387, -1.023235, 2.139549, 0, 0, 0, 1, 1,
0.6902145, 0.03339966, 3.602288, 0, 0, 0, 1, 1,
0.7056088, 0.2430174, 1.159642, 0, 0, 0, 1, 1,
0.7145715, 1.252482, 0.197948, 0, 0, 0, 1, 1,
0.7182222, -0.04654385, 0.4002573, 0, 0, 0, 1, 1,
0.7202079, -1.396189, 3.423438, 0, 0, 0, 1, 1,
0.7203176, 0.3069683, 0.148294, 1, 1, 1, 1, 1,
0.7213281, -0.1510606, 1.70835, 1, 1, 1, 1, 1,
0.7213917, 1.176312, 1.394461, 1, 1, 1, 1, 1,
0.7241317, -0.1807666, 2.445164, 1, 1, 1, 1, 1,
0.7270386, 0.5288488, 0.5220483, 1, 1, 1, 1, 1,
0.7273868, 0.8006833, 0.120934, 1, 1, 1, 1, 1,
0.7294503, 0.53936, -0.06954984, 1, 1, 1, 1, 1,
0.7313597, -0.1116988, 2.290704, 1, 1, 1, 1, 1,
0.7404112, -0.3569081, 2.617386, 1, 1, 1, 1, 1,
0.7443749, -0.3906704, 3.197867, 1, 1, 1, 1, 1,
0.7480855, 1.094766, -0.5126622, 1, 1, 1, 1, 1,
0.7504805, -1.546868, 2.520978, 1, 1, 1, 1, 1,
0.7513382, -1.783964, 0.8229294, 1, 1, 1, 1, 1,
0.7524258, 0.2284193, 1.387067, 1, 1, 1, 1, 1,
0.7534824, 1.961303, 0.7655092, 1, 1, 1, 1, 1,
0.7573574, -0.2704185, 2.582012, 0, 0, 1, 1, 1,
0.7612309, -0.4429283, 1.966103, 1, 0, 0, 1, 1,
0.7663673, 0.2969689, 1.369861, 1, 0, 0, 1, 1,
0.7706648, 1.088846, 2.086996, 1, 0, 0, 1, 1,
0.7747332, 0.08604303, 2.13389, 1, 0, 0, 1, 1,
0.7824767, 0.9505554, -0.8259899, 1, 0, 0, 1, 1,
0.7885904, -0.05583018, 1.156571, 0, 0, 0, 1, 1,
0.788664, 0.1574117, 1.452147, 0, 0, 0, 1, 1,
0.7948825, -0.3950411, 1.210778, 0, 0, 0, 1, 1,
0.7953038, 0.4279647, 1.137514, 0, 0, 0, 1, 1,
0.7956763, 0.1416544, 2.28012, 0, 0, 0, 1, 1,
0.798741, 0.2665133, 1.498624, 0, 0, 0, 1, 1,
0.7989767, -1.466967, 1.319802, 0, 0, 0, 1, 1,
0.8002928, 1.707074, 0.2295173, 1, 1, 1, 1, 1,
0.8013062, -1.005721, 2.88597, 1, 1, 1, 1, 1,
0.8025666, -0.2070173, 2.836346, 1, 1, 1, 1, 1,
0.805145, 1.011439, 1.162069, 1, 1, 1, 1, 1,
0.8061702, -1.748414, 3.114487, 1, 1, 1, 1, 1,
0.8136065, -0.3315834, 0.4775261, 1, 1, 1, 1, 1,
0.8144587, 0.03598681, 1.410417, 1, 1, 1, 1, 1,
0.816072, 0.008887729, 1.581778, 1, 1, 1, 1, 1,
0.8193164, 0.02936271, 2.683351, 1, 1, 1, 1, 1,
0.8274501, -1.02852, 1.119735, 1, 1, 1, 1, 1,
0.8280801, 0.04148649, 0.7869732, 1, 1, 1, 1, 1,
0.8297909, -0.7767646, 0.3022867, 1, 1, 1, 1, 1,
0.8341732, -0.8725725, 2.326581, 1, 1, 1, 1, 1,
0.835889, 0.1646098, 1.028594, 1, 1, 1, 1, 1,
0.8362399, 0.3893401, 1.677374, 1, 1, 1, 1, 1,
0.8373851, 0.3587703, 0.5741459, 0, 0, 1, 1, 1,
0.8391404, -2.254586, 0.9229839, 1, 0, 0, 1, 1,
0.8401834, -0.3737628, 1.606774, 1, 0, 0, 1, 1,
0.8406631, 0.7473824, 0.52797, 1, 0, 0, 1, 1,
0.8413774, 0.3948666, 2.333628, 1, 0, 0, 1, 1,
0.8443449, 0.4473895, 2.522369, 1, 0, 0, 1, 1,
0.8456474, -0.5224108, 0.2334484, 0, 0, 0, 1, 1,
0.848187, 0.4274936, -0.4400449, 0, 0, 0, 1, 1,
0.8522631, 0.06516109, 0.6850282, 0, 0, 0, 1, 1,
0.8546706, -1.172376, 3.130102, 0, 0, 0, 1, 1,
0.856748, 0.5785132, 0.612797, 0, 0, 0, 1, 1,
0.8568603, 1.909037, 0.6180607, 0, 0, 0, 1, 1,
0.8657555, -0.2768153, 3.004664, 0, 0, 0, 1, 1,
0.869288, -1.087597, 1.364136, 1, 1, 1, 1, 1,
0.875905, 0.1004575, 0.8914132, 1, 1, 1, 1, 1,
0.8772584, -1.22621, 2.262438, 1, 1, 1, 1, 1,
0.8782091, -0.12831, 1.506876, 1, 1, 1, 1, 1,
0.8791795, -0.8938456, 0.3873568, 1, 1, 1, 1, 1,
0.887459, 0.6036934, 1.859823, 1, 1, 1, 1, 1,
0.8902296, -0.6315196, 1.831389, 1, 1, 1, 1, 1,
0.8933169, -2.358117, 3.007396, 1, 1, 1, 1, 1,
0.8940754, -1.352599, 2.913065, 1, 1, 1, 1, 1,
0.9009578, 0.3432174, 0.4999185, 1, 1, 1, 1, 1,
0.9279179, 0.2059421, 2.860693, 1, 1, 1, 1, 1,
0.9375386, -2.093064, 1.60404, 1, 1, 1, 1, 1,
0.9380052, -0.3125463, 2.518226, 1, 1, 1, 1, 1,
0.9406609, -0.4270159, 1.878827, 1, 1, 1, 1, 1,
0.9409225, -0.1001513, 1.838341, 1, 1, 1, 1, 1,
0.9419836, 0.8465032, 2.19117, 0, 0, 1, 1, 1,
0.9460275, 0.09901828, 0.3287166, 1, 0, 0, 1, 1,
0.9464727, 0.9833771, 1.997755, 1, 0, 0, 1, 1,
0.9465148, -0.1349061, 0.5772151, 1, 0, 0, 1, 1,
0.9485823, 1.938009, 0.1041023, 1, 0, 0, 1, 1,
0.9512713, -0.3703342, 2.107899, 1, 0, 0, 1, 1,
0.9519557, 0.7778732, 0.589515, 0, 0, 0, 1, 1,
0.9562611, -0.2681963, 1.218546, 0, 0, 0, 1, 1,
0.9609384, 1.172466, 0.7391626, 0, 0, 0, 1, 1,
0.9634742, -1.09128, 1.130217, 0, 0, 0, 1, 1,
0.9688994, 1.170915, 1.888476, 0, 0, 0, 1, 1,
0.9732431, 0.2985691, 2.726223, 0, 0, 0, 1, 1,
0.9786631, -0.7433906, 4.488011, 0, 0, 0, 1, 1,
0.9846583, 2.029137, 0.7605005, 1, 1, 1, 1, 1,
0.9897498, -1.731643, 2.41476, 1, 1, 1, 1, 1,
0.9956629, 1.900029, 2.112828, 1, 1, 1, 1, 1,
1.004854, 3.003101, 0.6552441, 1, 1, 1, 1, 1,
1.006269, 1.234033, 0.5398321, 1, 1, 1, 1, 1,
1.014264, -0.424712, 3.087679, 1, 1, 1, 1, 1,
1.018701, -1.109133, 0.9893692, 1, 1, 1, 1, 1,
1.021618, 0.6596283, 1.533161, 1, 1, 1, 1, 1,
1.021651, 0.1939221, 1.912512, 1, 1, 1, 1, 1,
1.024015, 0.9999195, 0.3086536, 1, 1, 1, 1, 1,
1.025676, -2.192822, 3.415743, 1, 1, 1, 1, 1,
1.035251, -1.14487, 4.143501, 1, 1, 1, 1, 1,
1.035607, -0.242325, 2.536024, 1, 1, 1, 1, 1,
1.043951, -0.5678694, 3.36594, 1, 1, 1, 1, 1,
1.046239, -0.5905308, 2.80135, 1, 1, 1, 1, 1,
1.052133, 0.3433604, 3.15028, 0, 0, 1, 1, 1,
1.054317, -0.3925777, 3.906221, 1, 0, 0, 1, 1,
1.056147, 0.735485, -0.596635, 1, 0, 0, 1, 1,
1.068678, -1.264787, 3.188603, 1, 0, 0, 1, 1,
1.070391, 0.05653658, 1.014548, 1, 0, 0, 1, 1,
1.074399, -0.1202743, 2.666431, 1, 0, 0, 1, 1,
1.082491, -0.9529784, 1.580111, 0, 0, 0, 1, 1,
1.087493, 1.244482, -0.4197729, 0, 0, 0, 1, 1,
1.089065, 0.08699194, 1.295761, 0, 0, 0, 1, 1,
1.098207, 1.20727, -0.4155223, 0, 0, 0, 1, 1,
1.100175, 1.109325, 0.165626, 0, 0, 0, 1, 1,
1.100369, -0.3579974, 0.1174296, 0, 0, 0, 1, 1,
1.102036, -0.9069186, 2.153568, 0, 0, 0, 1, 1,
1.10232, -1.280509, 3.184576, 1, 1, 1, 1, 1,
1.103627, 0.5118414, 1.312406, 1, 1, 1, 1, 1,
1.123526, 0.1641577, 2.048877, 1, 1, 1, 1, 1,
1.123797, -0.6797915, 2.480605, 1, 1, 1, 1, 1,
1.124292, -1.093088, 1.313078, 1, 1, 1, 1, 1,
1.126285, 1.980179, 0.835955, 1, 1, 1, 1, 1,
1.129727, -0.008027024, 1.019449, 1, 1, 1, 1, 1,
1.132323, 1.292233, 0.6658754, 1, 1, 1, 1, 1,
1.132871, 0.04120205, 2.478404, 1, 1, 1, 1, 1,
1.134219, -0.07087825, 0.8516712, 1, 1, 1, 1, 1,
1.140246, -1.435567, 2.211544, 1, 1, 1, 1, 1,
1.140949, -1.476467, 2.585601, 1, 1, 1, 1, 1,
1.144265, -0.1692807, 2.600408, 1, 1, 1, 1, 1,
1.156648, -0.1146236, 2.806334, 1, 1, 1, 1, 1,
1.162752, -0.2581531, -0.1799823, 1, 1, 1, 1, 1,
1.16436, 0.3476083, 2.75187, 0, 0, 1, 1, 1,
1.168633, -0.03966069, 1.642184, 1, 0, 0, 1, 1,
1.168845, -0.7404825, 1.989407, 1, 0, 0, 1, 1,
1.17373, -1.129684, 1.272096, 1, 0, 0, 1, 1,
1.185241, 1.009464, 1.277206, 1, 0, 0, 1, 1,
1.186843, 0.7992551, -0.2351577, 1, 0, 0, 1, 1,
1.202952, 1.349246, 0.3490394, 0, 0, 0, 1, 1,
1.205402, -1.14408, 1.453781, 0, 0, 0, 1, 1,
1.212605, -0.3106257, 3.18687, 0, 0, 0, 1, 1,
1.213561, 1.390622, 2.043899, 0, 0, 0, 1, 1,
1.216355, -2.881145, 2.038466, 0, 0, 0, 1, 1,
1.216536, 0.8076293, 0.3058704, 0, 0, 0, 1, 1,
1.233022, 1.017232, 1.135734, 0, 0, 0, 1, 1,
1.235976, 0.8081821, -0.930526, 1, 1, 1, 1, 1,
1.244822, 2.297917, 2.004866, 1, 1, 1, 1, 1,
1.249873, 0.4998524, -0.3280659, 1, 1, 1, 1, 1,
1.251544, 1.497165, -0.5719047, 1, 1, 1, 1, 1,
1.27506, 0.3034744, 0.5466465, 1, 1, 1, 1, 1,
1.280374, -1.51074, 2.124819, 1, 1, 1, 1, 1,
1.281433, -0.46111, 2.852193, 1, 1, 1, 1, 1,
1.294067, 1.09855, 2.081388, 1, 1, 1, 1, 1,
1.299007, -1.896185, 3.124731, 1, 1, 1, 1, 1,
1.3025, 1.633861, 1.039363, 1, 1, 1, 1, 1,
1.303599, -0.1356333, 3.008839, 1, 1, 1, 1, 1,
1.303627, -1.440823, 1.402634, 1, 1, 1, 1, 1,
1.308528, -1.651069, 3.307466, 1, 1, 1, 1, 1,
1.309948, -0.5732267, 3.537545, 1, 1, 1, 1, 1,
1.310792, -0.5278316, 1.395589, 1, 1, 1, 1, 1,
1.315971, -0.699147, 2.427088, 0, 0, 1, 1, 1,
1.32775, -0.6812268, 2.835585, 1, 0, 0, 1, 1,
1.32991, -0.3128937, 2.102112, 1, 0, 0, 1, 1,
1.331671, 0.8244188, 1.76096, 1, 0, 0, 1, 1,
1.33532, -0.314205, 1.157951, 1, 0, 0, 1, 1,
1.336928, 1.770894, 1.106234, 1, 0, 0, 1, 1,
1.34314, 1.494693, 0.2604928, 0, 0, 0, 1, 1,
1.344748, 0.2946993, 1.524323, 0, 0, 0, 1, 1,
1.350257, -0.7277938, 2.987685, 0, 0, 0, 1, 1,
1.356545, 1.240494, 0.3117958, 0, 0, 0, 1, 1,
1.358415, -0.09606539, 1.387038, 0, 0, 0, 1, 1,
1.35984, -0.8362373, 4.78597, 0, 0, 0, 1, 1,
1.375011, 1.830864, 0.3241597, 0, 0, 0, 1, 1,
1.391676, -1.655973, 2.863231, 1, 1, 1, 1, 1,
1.394398, 0.3197197, 1.904878, 1, 1, 1, 1, 1,
1.399631, -2.577232, 3.683665, 1, 1, 1, 1, 1,
1.404567, -1.951338, 3.912159, 1, 1, 1, 1, 1,
1.417772, 1.226656, 2.566222, 1, 1, 1, 1, 1,
1.438164, 0.2756712, 3.530869, 1, 1, 1, 1, 1,
1.439364, -1.056514, 1.186735, 1, 1, 1, 1, 1,
1.457441, 0.6401144, 1.035974, 1, 1, 1, 1, 1,
1.46307, 0.2130759, 2.671411, 1, 1, 1, 1, 1,
1.487942, 0.4378023, 1.418979, 1, 1, 1, 1, 1,
1.491016, 0.8358926, 0.2725289, 1, 1, 1, 1, 1,
1.491888, -1.058554, 1.846205, 1, 1, 1, 1, 1,
1.496539, -0.7803917, 4.341046, 1, 1, 1, 1, 1,
1.502665, -0.7057526, 2.655322, 1, 1, 1, 1, 1,
1.509455, -0.8541172, 4.080692, 1, 1, 1, 1, 1,
1.520739, 0.8271992, 0.7571365, 0, 0, 1, 1, 1,
1.533513, 0.4066246, 2.259899, 1, 0, 0, 1, 1,
1.542438, -0.833271, 3.565328, 1, 0, 0, 1, 1,
1.5507, -0.2075666, 1.822986, 1, 0, 0, 1, 1,
1.551847, 0.4815697, 3.005515, 1, 0, 0, 1, 1,
1.57202, -0.9331309, 4.602994, 1, 0, 0, 1, 1,
1.573311, 0.07177621, 1.267311, 0, 0, 0, 1, 1,
1.586863, 1.774158, 0.7054907, 0, 0, 0, 1, 1,
1.590214, 0.6431712, 1.568933, 0, 0, 0, 1, 1,
1.63212, -0.05023824, 2.417747, 0, 0, 0, 1, 1,
1.632625, -2.430899, 2.858888, 0, 0, 0, 1, 1,
1.640392, -0.06248774, 0.3926979, 0, 0, 0, 1, 1,
1.649401, 2.123028, 0.7715164, 0, 0, 0, 1, 1,
1.662998, -1.303133, 1.787451, 1, 1, 1, 1, 1,
1.664528, -0.3432243, 1.667863, 1, 1, 1, 1, 1,
1.667809, -1.39575, 2.65203, 1, 1, 1, 1, 1,
1.683061, -1.110329, 2.329692, 1, 1, 1, 1, 1,
1.683959, -1.372573, 3.286738, 1, 1, 1, 1, 1,
1.707555, 0.2541547, 1.41376, 1, 1, 1, 1, 1,
1.727539, -0.195182, 1.506046, 1, 1, 1, 1, 1,
1.782824, 0.4597951, 0.6418247, 1, 1, 1, 1, 1,
1.785465, -0.7588682, 1.884038, 1, 1, 1, 1, 1,
1.792513, 0.01010774, 2.224977, 1, 1, 1, 1, 1,
1.805391, 0.05096548, 1.083789, 1, 1, 1, 1, 1,
1.825491, 0.3750313, 1.28571, 1, 1, 1, 1, 1,
1.827093, -2.406553, 1.072021, 1, 1, 1, 1, 1,
1.832766, 1.803763, 2.437509, 1, 1, 1, 1, 1,
1.890081, 0.6675977, 0.07349516, 1, 1, 1, 1, 1,
1.955061, 1.671666, 0.419297, 0, 0, 1, 1, 1,
1.958413, 0.3145855, 2.085386, 1, 0, 0, 1, 1,
1.973193, 0.7497041, 1.076039, 1, 0, 0, 1, 1,
1.979107, 0.02038551, 2.032578, 1, 0, 0, 1, 1,
1.988746, -0.07028093, 1.224166, 1, 0, 0, 1, 1,
2.000761, -0.4276956, 0.1104625, 1, 0, 0, 1, 1,
2.066349, -1.827544, 3.049829, 0, 0, 0, 1, 1,
2.086088, -1.166736, 2.32926, 0, 0, 0, 1, 1,
2.10413, 0.8286611, 2.972581, 0, 0, 0, 1, 1,
2.119852, 0.9475186, 0.6453843, 0, 0, 0, 1, 1,
2.240297, -0.3000125, 2.246016, 0, 0, 0, 1, 1,
2.281496, 0.6304535, 1.326512, 0, 0, 0, 1, 1,
2.357307, 0.2177523, 1.402547, 0, 0, 0, 1, 1,
2.380778, -0.2835926, 2.203395, 1, 1, 1, 1, 1,
2.428986, 0.5787932, -0.06962267, 1, 1, 1, 1, 1,
2.473016, -1.137983, 2.204524, 1, 1, 1, 1, 1,
2.539634, 0.222525, 0.4210604, 1, 1, 1, 1, 1,
2.666578, -0.7578591, 1.21509, 1, 1, 1, 1, 1,
2.672242, -0.8276251, 1.676359, 1, 1, 1, 1, 1,
2.713745, -0.6606178, 2.297152, 1, 1, 1, 1, 1
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
var radius = 9.211801;
var distance = 32.35606;
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
mvMatrix.translate( 0.2441684, -0.1785814, 0.3771074 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.35606);
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
