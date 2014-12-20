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
-3.332954, -0.6661918, -0.728782, 1, 0, 0, 1,
-2.854265, -0.3620569, -1.091191, 1, 0.007843138, 0, 1,
-2.720547, -0.57527, -3.357672, 1, 0.01176471, 0, 1,
-2.589723, 0.5733473, -0.7125625, 1, 0.01960784, 0, 1,
-2.502486, 1.890059, -1.257976, 1, 0.02352941, 0, 1,
-2.423842, 0.6598964, -1.023172, 1, 0.03137255, 0, 1,
-2.387014, 0.5198067, -2.642722, 1, 0.03529412, 0, 1,
-2.382759, -0.4215863, -3.016987, 1, 0.04313726, 0, 1,
-2.361376, 1.222854, -1.529177, 1, 0.04705882, 0, 1,
-2.348984, 0.24257, -2.075929, 1, 0.05490196, 0, 1,
-2.286369, -1.006824, -0.9788254, 1, 0.05882353, 0, 1,
-2.26496, 1.81596, -0.798152, 1, 0.06666667, 0, 1,
-2.207486, 1.27171, -1.75955, 1, 0.07058824, 0, 1,
-2.201453, -1.364941, -2.033589, 1, 0.07843138, 0, 1,
-2.154503, -1.420589, -1.586066, 1, 0.08235294, 0, 1,
-2.149627, -0.5535041, -1.088909, 1, 0.09019608, 0, 1,
-2.124808, -0.2475044, -3.305148, 1, 0.09411765, 0, 1,
-2.118352, -0.3266235, -0.6439795, 1, 0.1019608, 0, 1,
-2.114779, -2.371474, -3.178298, 1, 0.1098039, 0, 1,
-2.08884, 0.5598836, -3.182223, 1, 0.1137255, 0, 1,
-2.077826, -0.009185047, -0.5972779, 1, 0.1215686, 0, 1,
-2.041821, -1.69456, -2.184699, 1, 0.1254902, 0, 1,
-2.037653, 0.1611151, -0.2157711, 1, 0.1333333, 0, 1,
-2.035506, 0.194726, -1.114704, 1, 0.1372549, 0, 1,
-2.034183, -0.4084815, -1.928459, 1, 0.145098, 0, 1,
-1.960029, -1.052315, -2.101985, 1, 0.1490196, 0, 1,
-1.92141, 1.788548, 1.411039, 1, 0.1568628, 0, 1,
-1.897291, 0.4874945, 0.2696261, 1, 0.1607843, 0, 1,
-1.881852, 1.302233, -0.8675022, 1, 0.1686275, 0, 1,
-1.871105, -0.6380824, -1.387346, 1, 0.172549, 0, 1,
-1.868659, 0.4223397, -0.2778127, 1, 0.1803922, 0, 1,
-1.851251, 0.3592607, -1.687506, 1, 0.1843137, 0, 1,
-1.845303, 0.4990967, -0.6788048, 1, 0.1921569, 0, 1,
-1.838179, -0.01640224, -1.448443, 1, 0.1960784, 0, 1,
-1.780663, -1.633911, -0.9610649, 1, 0.2039216, 0, 1,
-1.779428, 0.4277124, -1.607201, 1, 0.2117647, 0, 1,
-1.767331, 0.722374, 1.036697, 1, 0.2156863, 0, 1,
-1.763261, 0.3904143, -2.987093, 1, 0.2235294, 0, 1,
-1.754206, -0.07511152, -2.423091, 1, 0.227451, 0, 1,
-1.712178, 0.6103309, -0.1978638, 1, 0.2352941, 0, 1,
-1.703136, 1.860903, -0.3649373, 1, 0.2392157, 0, 1,
-1.698489, 0.174382, -2.10444, 1, 0.2470588, 0, 1,
-1.689732, 2.312264, 0.3707149, 1, 0.2509804, 0, 1,
-1.684054, 0.1222142, -1.23639, 1, 0.2588235, 0, 1,
-1.681893, 1.302303, -1.701484, 1, 0.2627451, 0, 1,
-1.678878, 1.480701, -1.628339, 1, 0.2705882, 0, 1,
-1.665154, 1.067276, -0.8762133, 1, 0.2745098, 0, 1,
-1.635265, 1.212206, -0.3979081, 1, 0.282353, 0, 1,
-1.63368, -0.9154657, -2.473235, 1, 0.2862745, 0, 1,
-1.633216, -0.5287442, -2.773732, 1, 0.2941177, 0, 1,
-1.618729, -0.4289377, -1.779361, 1, 0.3019608, 0, 1,
-1.616406, -0.647525, -1.456636, 1, 0.3058824, 0, 1,
-1.611654, -0.6341327, -0.3027534, 1, 0.3137255, 0, 1,
-1.601552, -1.370441, -2.277465, 1, 0.3176471, 0, 1,
-1.59581, 0.5072691, -0.1341196, 1, 0.3254902, 0, 1,
-1.580931, -0.9314492, -1.597161, 1, 0.3294118, 0, 1,
-1.569589, 0.5027793, -1.32339, 1, 0.3372549, 0, 1,
-1.567085, -0.1517221, 0.5817403, 1, 0.3411765, 0, 1,
-1.55764, 0.5464669, -2.041398, 1, 0.3490196, 0, 1,
-1.553677, 2.144642, 0.6264005, 1, 0.3529412, 0, 1,
-1.546955, 0.5825559, -0.7872497, 1, 0.3607843, 0, 1,
-1.533138, 0.8010155, -0.9506416, 1, 0.3647059, 0, 1,
-1.529973, -0.6030682, -1.880402, 1, 0.372549, 0, 1,
-1.519409, 0.1455497, -2.42269, 1, 0.3764706, 0, 1,
-1.51694, -0.7515949, -2.535768, 1, 0.3843137, 0, 1,
-1.509797, 0.1293485, -0.901641, 1, 0.3882353, 0, 1,
-1.495217, 0.8354423, 0.12987, 1, 0.3960784, 0, 1,
-1.494607, 0.3014085, -1.019785, 1, 0.4039216, 0, 1,
-1.465827, 0.7718108, -1.632705, 1, 0.4078431, 0, 1,
-1.461956, 0.7183306, -1.299182, 1, 0.4156863, 0, 1,
-1.458342, 1.685567, -1.231689, 1, 0.4196078, 0, 1,
-1.457365, -0.4571171, -1.406908, 1, 0.427451, 0, 1,
-1.453722, -0.1138085, 0.1256232, 1, 0.4313726, 0, 1,
-1.435071, 0.2920069, 0.6306627, 1, 0.4392157, 0, 1,
-1.423698, -0.4369748, -1.866202, 1, 0.4431373, 0, 1,
-1.420441, -0.7610387, -1.772259, 1, 0.4509804, 0, 1,
-1.409821, 1.825285, -0.1209304, 1, 0.454902, 0, 1,
-1.39512, 0.7166538, -1.712617, 1, 0.4627451, 0, 1,
-1.389103, -0.6661897, -1.65695, 1, 0.4666667, 0, 1,
-1.384682, 0.2811996, -1.715221, 1, 0.4745098, 0, 1,
-1.382004, 0.2257675, 0.4568461, 1, 0.4784314, 0, 1,
-1.380047, 0.8560454, 0.1767671, 1, 0.4862745, 0, 1,
-1.379767, 0.3892368, -0.7162343, 1, 0.4901961, 0, 1,
-1.376629, 0.3083982, -0.591535, 1, 0.4980392, 0, 1,
-1.363921, 0.7489101, -0.8027027, 1, 0.5058824, 0, 1,
-1.355348, -1.656639, -1.616808, 1, 0.509804, 0, 1,
-1.346204, -0.2084016, -2.795045, 1, 0.5176471, 0, 1,
-1.331586, 1.618355, -0.3692642, 1, 0.5215687, 0, 1,
-1.328364, -0.01757704, -0.4639904, 1, 0.5294118, 0, 1,
-1.327498, -0.1938508, -1.546134, 1, 0.5333334, 0, 1,
-1.323549, -0.4712786, -2.324326, 1, 0.5411765, 0, 1,
-1.313144, -0.6320407, -1.449189, 1, 0.5450981, 0, 1,
-1.307664, 0.8851503, -2.601726, 1, 0.5529412, 0, 1,
-1.274467, -0.1160386, -1.025143, 1, 0.5568628, 0, 1,
-1.273951, -0.6438431, -4.538839, 1, 0.5647059, 0, 1,
-1.273066, -0.9916264, -0.886131, 1, 0.5686275, 0, 1,
-1.272926, 0.7020679, -0.7869735, 1, 0.5764706, 0, 1,
-1.27132, 0.2910193, 0.1156206, 1, 0.5803922, 0, 1,
-1.270731, -0.3668947, -1.60225, 1, 0.5882353, 0, 1,
-1.268096, 0.750777, 0.01900029, 1, 0.5921569, 0, 1,
-1.26126, -1.002802, -1.465001, 1, 0.6, 0, 1,
-1.257979, -1.311414, -2.97842, 1, 0.6078432, 0, 1,
-1.251873, 0.7777594, -0.7804961, 1, 0.6117647, 0, 1,
-1.250729, -0.325266, 1.201131, 1, 0.6196079, 0, 1,
-1.249981, -0.4498348, -2.823339, 1, 0.6235294, 0, 1,
-1.233228, 0.2073248, -2.200962, 1, 0.6313726, 0, 1,
-1.23103, 1.088663, -1.122593, 1, 0.6352941, 0, 1,
-1.228266, -1.829336, -1.965911, 1, 0.6431373, 0, 1,
-1.219814, -0.5849577, -1.430064, 1, 0.6470588, 0, 1,
-1.21805, 0.04070242, -0.4064318, 1, 0.654902, 0, 1,
-1.2147, 0.598912, -2.473856, 1, 0.6588235, 0, 1,
-1.211305, 0.3429179, -2.816408, 1, 0.6666667, 0, 1,
-1.189033, 0.6077271, -0.3957987, 1, 0.6705883, 0, 1,
-1.186503, -0.6281332, -2.081867, 1, 0.6784314, 0, 1,
-1.186284, -0.8343322, -0.7446901, 1, 0.682353, 0, 1,
-1.182185, -0.1544283, -0.5029377, 1, 0.6901961, 0, 1,
-1.179963, 0.3362298, -0.7778631, 1, 0.6941177, 0, 1,
-1.1798, 2.099631, 1.284368, 1, 0.7019608, 0, 1,
-1.174165, 1.185129, -0.2633004, 1, 0.7098039, 0, 1,
-1.171406, 1.836107, 0.9403952, 1, 0.7137255, 0, 1,
-1.164922, 1.503985, 1.023441, 1, 0.7215686, 0, 1,
-1.158892, -1.960886, -3.725885, 1, 0.7254902, 0, 1,
-1.153721, -0.6547777, -1.616067, 1, 0.7333333, 0, 1,
-1.151188, -1.061122, -0.2359018, 1, 0.7372549, 0, 1,
-1.145076, 0.7433945, -0.7158, 1, 0.7450981, 0, 1,
-1.141773, -1.832468, -3.319649, 1, 0.7490196, 0, 1,
-1.137537, -0.4204687, -2.166633, 1, 0.7568628, 0, 1,
-1.136426, -0.3938486, -1.1024, 1, 0.7607843, 0, 1,
-1.134209, -0.1590154, -4.158586, 1, 0.7686275, 0, 1,
-1.133869, 0.5688397, -2.347867, 1, 0.772549, 0, 1,
-1.131015, -1.086683, -1.882775, 1, 0.7803922, 0, 1,
-1.130013, 0.3930561, -1.97269, 1, 0.7843137, 0, 1,
-1.121639, 0.8295845, 0.1670423, 1, 0.7921569, 0, 1,
-1.119723, 0.1618054, -2.109196, 1, 0.7960784, 0, 1,
-1.115034, 0.3965845, -3.296497, 1, 0.8039216, 0, 1,
-1.10999, 0.01649728, -1.148375, 1, 0.8117647, 0, 1,
-1.109874, -0.07677394, -1.160857, 1, 0.8156863, 0, 1,
-1.108452, 0.6530586, -2.162196, 1, 0.8235294, 0, 1,
-1.099916, -0.2040814, -2.829832, 1, 0.827451, 0, 1,
-1.080789, -0.4076118, -1.518476, 1, 0.8352941, 0, 1,
-1.079581, 1.328196, -0.3707117, 1, 0.8392157, 0, 1,
-1.078844, -0.7900468, -1.15558, 1, 0.8470588, 0, 1,
-1.073876, 3.002584, 1.136084, 1, 0.8509804, 0, 1,
-1.072886, -0.8040223, -0.1212876, 1, 0.8588235, 0, 1,
-1.072567, -1.109179, -1.343793, 1, 0.8627451, 0, 1,
-1.07036, 0.2252296, -0.06517207, 1, 0.8705882, 0, 1,
-1.070031, -0.2407671, -0.8419968, 1, 0.8745098, 0, 1,
-1.06374, 0.1810874, 0.2610137, 1, 0.8823529, 0, 1,
-1.062837, -0.07165942, -2.885845, 1, 0.8862745, 0, 1,
-1.05344, 0.05146414, -1.908359, 1, 0.8941177, 0, 1,
-1.050075, -0.7417926, -1.493674, 1, 0.8980392, 0, 1,
-1.047852, 1.991015, 0.8478341, 1, 0.9058824, 0, 1,
-1.046834, -1.493069, -3.616653, 1, 0.9137255, 0, 1,
-1.0468, 0.3304653, -0.9954166, 1, 0.9176471, 0, 1,
-1.045621, 0.5676904, -0.7729312, 1, 0.9254902, 0, 1,
-1.040869, -0.7068816, -1.792249, 1, 0.9294118, 0, 1,
-1.040519, 0.6708612, -1.25554, 1, 0.9372549, 0, 1,
-1.035363, 0.525659, -2.388146, 1, 0.9411765, 0, 1,
-1.03487, 0.4262262, -0.858205, 1, 0.9490196, 0, 1,
-1.032687, -0.7832341, -1.349358, 1, 0.9529412, 0, 1,
-1.032533, -0.2583232, -0.4328833, 1, 0.9607843, 0, 1,
-1.031024, 0.6107022, -0.2352621, 1, 0.9647059, 0, 1,
-1.028465, -1.221644, -2.246615, 1, 0.972549, 0, 1,
-1.019883, 2.092015, -2.106595, 1, 0.9764706, 0, 1,
-1.012993, 2.122406, 0.7860996, 1, 0.9843137, 0, 1,
-1.010215, 0.7522284, -0.7397476, 1, 0.9882353, 0, 1,
-1.010156, 1.6615, 0.0008288362, 1, 0.9960784, 0, 1,
-1.005617, -0.7409003, -1.930756, 0.9960784, 1, 0, 1,
-1.004417, -0.9427245, -2.473772, 0.9921569, 1, 0, 1,
-0.9996424, 0.989117, -1.388413, 0.9843137, 1, 0, 1,
-0.9957207, -0.6195998, -3.664589, 0.9803922, 1, 0, 1,
-0.9865944, 0.4075391, -2.131262, 0.972549, 1, 0, 1,
-0.9804595, 1.331089, -1.14523, 0.9686275, 1, 0, 1,
-0.9799465, -2.038015, -2.521625, 0.9607843, 1, 0, 1,
-0.9788572, -0.1143634, -2.049793, 0.9568627, 1, 0, 1,
-0.9768691, 1.02725, -1.689655, 0.9490196, 1, 0, 1,
-0.9742632, 1.388469, -0.281691, 0.945098, 1, 0, 1,
-0.9699516, 0.8662196, 0.07838877, 0.9372549, 1, 0, 1,
-0.9641024, -0.9879561, -2.424387, 0.9333333, 1, 0, 1,
-0.9639492, 0.1835412, -1.291106, 0.9254902, 1, 0, 1,
-0.959504, 1.230767, -1.395243, 0.9215686, 1, 0, 1,
-0.9576762, -0.5520269, -1.843771, 0.9137255, 1, 0, 1,
-0.94885, -0.4657556, -0.7001567, 0.9098039, 1, 0, 1,
-0.9487832, -0.09258312, -3.827075, 0.9019608, 1, 0, 1,
-0.946633, -0.3774872, -2.777468, 0.8941177, 1, 0, 1,
-0.9448932, -1.218539, -2.946927, 0.8901961, 1, 0, 1,
-0.9409375, -2.127408, -3.030967, 0.8823529, 1, 0, 1,
-0.940477, 0.4967024, -0.182035, 0.8784314, 1, 0, 1,
-0.9365459, 0.521304, -2.904064, 0.8705882, 1, 0, 1,
-0.9151449, -0.1264558, -1.364711, 0.8666667, 1, 0, 1,
-0.9123909, -0.3052984, -4.17294, 0.8588235, 1, 0, 1,
-0.9117862, -1.098804, -1.135185, 0.854902, 1, 0, 1,
-0.9112793, -0.4698894, -1.472653, 0.8470588, 1, 0, 1,
-0.9093527, 2.049091, 0.3048375, 0.8431373, 1, 0, 1,
-0.8990276, 0.3928022, -1.521276, 0.8352941, 1, 0, 1,
-0.8977815, -1.080975, -2.267639, 0.8313726, 1, 0, 1,
-0.8973245, -0.7264994, -2.467875, 0.8235294, 1, 0, 1,
-0.8945885, -1.16663, -1.123403, 0.8196079, 1, 0, 1,
-0.8921732, 0.2797476, 0.1052442, 0.8117647, 1, 0, 1,
-0.8912573, -0.1407428, -1.284817, 0.8078431, 1, 0, 1,
-0.8884923, 0.05377767, -0.9030294, 0.8, 1, 0, 1,
-0.8883247, -1.686234, -2.160556, 0.7921569, 1, 0, 1,
-0.887792, 1.021906, 1.297932, 0.7882353, 1, 0, 1,
-0.8875454, -0.9837024, -3.028977, 0.7803922, 1, 0, 1,
-0.8851643, -1.362559, 0.265313, 0.7764706, 1, 0, 1,
-0.8809661, 1.148623, -0.211192, 0.7686275, 1, 0, 1,
-0.8767514, 1.829786, 1.158079, 0.7647059, 1, 0, 1,
-0.8759142, -0.9601918, -1.391156, 0.7568628, 1, 0, 1,
-0.8758472, -1.409643, -2.491491, 0.7529412, 1, 0, 1,
-0.8751311, 0.5646957, -0.9391177, 0.7450981, 1, 0, 1,
-0.8716268, 0.2718905, 0.1330705, 0.7411765, 1, 0, 1,
-0.8700762, -0.02768875, -2.570044, 0.7333333, 1, 0, 1,
-0.8669927, -1.179929, -2.823735, 0.7294118, 1, 0, 1,
-0.8656376, -0.4639774, -3.320368, 0.7215686, 1, 0, 1,
-0.8642812, 0.8553727, -1.128897, 0.7176471, 1, 0, 1,
-0.8609031, -0.1123505, -3.199578, 0.7098039, 1, 0, 1,
-0.8559006, -0.6859362, -5.301189, 0.7058824, 1, 0, 1,
-0.854402, 1.415987, -1.590639, 0.6980392, 1, 0, 1,
-0.8530817, -0.3580637, -1.778507, 0.6901961, 1, 0, 1,
-0.8435699, 0.6563021, 0.7842464, 0.6862745, 1, 0, 1,
-0.8362082, 1.329165, 1.067387, 0.6784314, 1, 0, 1,
-0.8349988, 0.3762501, -1.235049, 0.6745098, 1, 0, 1,
-0.8325525, 0.6206416, -0.3331883, 0.6666667, 1, 0, 1,
-0.8291615, -0.3550065, -3.648651, 0.6627451, 1, 0, 1,
-0.8284109, -0.413459, -1.339013, 0.654902, 1, 0, 1,
-0.823523, 0.5467654, -1.752062, 0.6509804, 1, 0, 1,
-0.8214743, -1.016372, -0.4635955, 0.6431373, 1, 0, 1,
-0.8202519, -0.2368865, -2.245973, 0.6392157, 1, 0, 1,
-0.8080342, -2.031216, -2.300952, 0.6313726, 1, 0, 1,
-0.804965, 1.309929, 0.003791909, 0.627451, 1, 0, 1,
-0.8038169, -0.7104726, -3.563538, 0.6196079, 1, 0, 1,
-0.8001841, 1.080495, 1.348375, 0.6156863, 1, 0, 1,
-0.7982574, 1.555928, -1.288781, 0.6078432, 1, 0, 1,
-0.7943645, 1.360924, -0.9042897, 0.6039216, 1, 0, 1,
-0.7932451, 1.071776, -2.230286, 0.5960785, 1, 0, 1,
-0.7922281, 0.9081475, -3.025524, 0.5882353, 1, 0, 1,
-0.7853163, -0.416135, -1.317097, 0.5843138, 1, 0, 1,
-0.7836533, 0.5217615, -0.2822209, 0.5764706, 1, 0, 1,
-0.7817428, -2.545078, -2.461646, 0.572549, 1, 0, 1,
-0.7795042, -0.1933049, -2.196017, 0.5647059, 1, 0, 1,
-0.7754606, 0.6091056, -0.4050705, 0.5607843, 1, 0, 1,
-0.7744222, -1.682983, -1.696756, 0.5529412, 1, 0, 1,
-0.7691196, -0.5411109, -1.953281, 0.5490196, 1, 0, 1,
-0.7672722, 0.8105722, -0.241479, 0.5411765, 1, 0, 1,
-0.7628944, -0.3946888, -3.009551, 0.5372549, 1, 0, 1,
-0.762471, -0.5681683, -1.829675, 0.5294118, 1, 0, 1,
-0.7595441, -0.8041032, -2.56501, 0.5254902, 1, 0, 1,
-0.7567138, -0.5351005, -3.189571, 0.5176471, 1, 0, 1,
-0.7552094, 0.6218032, -1.837313, 0.5137255, 1, 0, 1,
-0.7429689, 1.274638, 0.7079003, 0.5058824, 1, 0, 1,
-0.7419424, -1.181849, -2.68256, 0.5019608, 1, 0, 1,
-0.7393564, 1.004596, -0.3201893, 0.4941176, 1, 0, 1,
-0.732158, -0.573691, -1.501571, 0.4862745, 1, 0, 1,
-0.730453, 0.2124374, -0.5624343, 0.4823529, 1, 0, 1,
-0.7299644, -0.7115541, -1.212585, 0.4745098, 1, 0, 1,
-0.7294663, -0.1525263, -1.553839, 0.4705882, 1, 0, 1,
-0.7281817, -0.8062137, -1.145498, 0.4627451, 1, 0, 1,
-0.7261067, 0.4044736, -1.902279, 0.4588235, 1, 0, 1,
-0.721497, 0.7105636, -1.054288, 0.4509804, 1, 0, 1,
-0.7204511, -0.6074997, -1.113728, 0.4470588, 1, 0, 1,
-0.7188935, 1.194595, -0.2048022, 0.4392157, 1, 0, 1,
-0.7183066, 1.43283, -0.9974693, 0.4352941, 1, 0, 1,
-0.7164567, -0.05148041, -0.9542111, 0.427451, 1, 0, 1,
-0.7162193, -0.6213363, -2.753537, 0.4235294, 1, 0, 1,
-0.7140324, 1.045673, -0.2882272, 0.4156863, 1, 0, 1,
-0.7133183, 0.05551996, -2.609311, 0.4117647, 1, 0, 1,
-0.7101839, -0.1380252, -2.334565, 0.4039216, 1, 0, 1,
-0.7093624, 0.7496924, -1.712461, 0.3960784, 1, 0, 1,
-0.7079386, 1.428748, 0.8237045, 0.3921569, 1, 0, 1,
-0.707429, 2.792375, -1.366056, 0.3843137, 1, 0, 1,
-0.7027609, -1.785997, -3.640179, 0.3803922, 1, 0, 1,
-0.6994154, 1.982595, -0.9004124, 0.372549, 1, 0, 1,
-0.6978469, 1.019634, -0.7050648, 0.3686275, 1, 0, 1,
-0.6949269, -1.303276, -4.464316, 0.3607843, 1, 0, 1,
-0.6879367, -0.2318175, -0.2930677, 0.3568628, 1, 0, 1,
-0.6860334, -1.715363, -3.922634, 0.3490196, 1, 0, 1,
-0.6831269, 0.5136957, -0.3963154, 0.345098, 1, 0, 1,
-0.6766359, -0.7215518, -3.190415, 0.3372549, 1, 0, 1,
-0.675652, 0.3525319, -0.7920042, 0.3333333, 1, 0, 1,
-0.6720855, -0.6893994, -2.933942, 0.3254902, 1, 0, 1,
-0.6603731, 0.2892738, -1.941171, 0.3215686, 1, 0, 1,
-0.6582347, -0.06796636, -1.188917, 0.3137255, 1, 0, 1,
-0.6556215, 2.307971, -0.4571233, 0.3098039, 1, 0, 1,
-0.6501257, 1.029912, -0.2592732, 0.3019608, 1, 0, 1,
-0.6389498, 0.8657966, 0.8353109, 0.2941177, 1, 0, 1,
-0.6385249, 0.5131813, -1.950443, 0.2901961, 1, 0, 1,
-0.6378595, 1.163913, -0.8815272, 0.282353, 1, 0, 1,
-0.6370605, 0.1737242, -1.117628, 0.2784314, 1, 0, 1,
-0.6310816, -1.056566, -2.670606, 0.2705882, 1, 0, 1,
-0.6309229, 0.3742182, -1.915024, 0.2666667, 1, 0, 1,
-0.6228654, 0.8592884, -1.080685, 0.2588235, 1, 0, 1,
-0.6225328, -0.876327, -2.522483, 0.254902, 1, 0, 1,
-0.6189264, 0.9481115, 0.05890737, 0.2470588, 1, 0, 1,
-0.6164083, 1.443858, -1.335885, 0.2431373, 1, 0, 1,
-0.6136461, -0.6284121, -1.484164, 0.2352941, 1, 0, 1,
-0.6020585, 1.212579, -0.1948553, 0.2313726, 1, 0, 1,
-0.5972097, -0.02003245, 0.3714258, 0.2235294, 1, 0, 1,
-0.5969685, 0.4822724, -0.8378831, 0.2196078, 1, 0, 1,
-0.5956606, -0.7972823, -2.675809, 0.2117647, 1, 0, 1,
-0.5943798, 0.5195347, 0.2341086, 0.2078431, 1, 0, 1,
-0.5941522, -0.532032, -1.754945, 0.2, 1, 0, 1,
-0.5935182, 0.6118212, -1.115855, 0.1921569, 1, 0, 1,
-0.592771, -0.6438444, -0.6905954, 0.1882353, 1, 0, 1,
-0.5896181, -0.5924542, -2.908744, 0.1803922, 1, 0, 1,
-0.5884358, -0.6164756, -3.297169, 0.1764706, 1, 0, 1,
-0.579242, 0.4452931, -1.546805, 0.1686275, 1, 0, 1,
-0.5770417, -0.9279467, -2.571676, 0.1647059, 1, 0, 1,
-0.5768191, -0.7237912, -1.53562, 0.1568628, 1, 0, 1,
-0.5750428, 0.4245358, -1.395359, 0.1529412, 1, 0, 1,
-0.5710387, -0.8940259, -1.415251, 0.145098, 1, 0, 1,
-0.559373, 0.05803246, -2.947521, 0.1411765, 1, 0, 1,
-0.5515065, 0.5623458, -1.216739, 0.1333333, 1, 0, 1,
-0.5497062, 0.0729999, -1.4986, 0.1294118, 1, 0, 1,
-0.5495029, 0.3422916, -0.4180764, 0.1215686, 1, 0, 1,
-0.5493556, -0.9429572, -2.626461, 0.1176471, 1, 0, 1,
-0.5482674, -0.08141126, -0.4392792, 0.1098039, 1, 0, 1,
-0.5465854, 0.6591676, -1.71421, 0.1058824, 1, 0, 1,
-0.5454718, -1.643723, -1.682374, 0.09803922, 1, 0, 1,
-0.5405118, -0.2087347, 0.06231933, 0.09019608, 1, 0, 1,
-0.5372995, -0.0398759, -0.8205011, 0.08627451, 1, 0, 1,
-0.5371383, -1.563253, -2.689586, 0.07843138, 1, 0, 1,
-0.5368643, 0.8366995, -1.32658, 0.07450981, 1, 0, 1,
-0.5364157, -0.2744747, -2.596508, 0.06666667, 1, 0, 1,
-0.5345529, 1.079158, -1.094352, 0.0627451, 1, 0, 1,
-0.5325884, -0.8116105, -3.911138, 0.05490196, 1, 0, 1,
-0.5203311, -0.3908942, -3.584291, 0.05098039, 1, 0, 1,
-0.5201324, 0.05676949, -0.2956231, 0.04313726, 1, 0, 1,
-0.5193767, 0.8359146, -0.5010916, 0.03921569, 1, 0, 1,
-0.5191187, 1.397601, 0.9652222, 0.03137255, 1, 0, 1,
-0.5153905, 0.2078282, -1.726617, 0.02745098, 1, 0, 1,
-0.5062134, -0.4290482, -1.971256, 0.01960784, 1, 0, 1,
-0.5024974, -0.6029508, -3.523218, 0.01568628, 1, 0, 1,
-0.5001377, -0.2305983, -1.973357, 0.007843138, 1, 0, 1,
-0.4998471, -0.3791145, -2.278394, 0.003921569, 1, 0, 1,
-0.4989058, 0.3496941, -1.959513, 0, 1, 0.003921569, 1,
-0.4936348, -1.932451, -4.435979, 0, 1, 0.01176471, 1,
-0.4923611, -0.1583024, -2.695837, 0, 1, 0.01568628, 1,
-0.4891362, 0.4557978, 1.116553, 0, 1, 0.02352941, 1,
-0.4851882, 1.717694, 0.1199615, 0, 1, 0.02745098, 1,
-0.4832215, 1.275414, -0.8000638, 0, 1, 0.03529412, 1,
-0.4821434, 0.7076389, -1.038942, 0, 1, 0.03921569, 1,
-0.4803452, -0.2342684, -1.886056, 0, 1, 0.04705882, 1,
-0.4796826, -0.07792668, -0.8798535, 0, 1, 0.05098039, 1,
-0.4779497, 0.7822635, -0.2578207, 0, 1, 0.05882353, 1,
-0.4702216, 0.8332882, 0.02313278, 0, 1, 0.0627451, 1,
-0.4650131, -1.059605, -5.802033, 0, 1, 0.07058824, 1,
-0.4582297, 2.049847, 0.6030178, 0, 1, 0.07450981, 1,
-0.4575218, 1.19407, -0.3476264, 0, 1, 0.08235294, 1,
-0.4536735, 0.8391796, 0.1716893, 0, 1, 0.08627451, 1,
-0.4479399, 2.90447, -1.198321, 0, 1, 0.09411765, 1,
-0.4459452, 1.038846, -1.616703, 0, 1, 0.1019608, 1,
-0.4437214, 1.791464, 0.5378323, 0, 1, 0.1058824, 1,
-0.439329, -0.1884971, -2.215786, 0, 1, 0.1137255, 1,
-0.4278937, 0.5746248, 0.6670758, 0, 1, 0.1176471, 1,
-0.427007, -0.1126839, -1.200689, 0, 1, 0.1254902, 1,
-0.4223105, -0.553113, -3.046216, 0, 1, 0.1294118, 1,
-0.4161014, -0.03491266, 0.06331265, 0, 1, 0.1372549, 1,
-0.4142172, 0.970817, -1.103859, 0, 1, 0.1411765, 1,
-0.4140979, 1.012047, -1.898225, 0, 1, 0.1490196, 1,
-0.4138814, 2.58705, -0.3138146, 0, 1, 0.1529412, 1,
-0.4083666, -2.007059, -3.406362, 0, 1, 0.1607843, 1,
-0.4065031, -1.450328, -2.90462, 0, 1, 0.1647059, 1,
-0.404101, 1.765925, 0.9933534, 0, 1, 0.172549, 1,
-0.4017671, -1.029632, -3.923482, 0, 1, 0.1764706, 1,
-0.4006213, 2.38632, 0.8823683, 0, 1, 0.1843137, 1,
-0.396583, 1.661958, 0.1096309, 0, 1, 0.1882353, 1,
-0.3958442, 0.2698236, 0.2641808, 0, 1, 0.1960784, 1,
-0.3947929, -1.198876, -2.226875, 0, 1, 0.2039216, 1,
-0.3935874, -0.267785, -2.080876, 0, 1, 0.2078431, 1,
-0.3929121, -0.7568605, -1.952162, 0, 1, 0.2156863, 1,
-0.3894475, -0.05353981, -2.578126, 0, 1, 0.2196078, 1,
-0.3871362, -0.006308246, -2.283425, 0, 1, 0.227451, 1,
-0.3869447, -0.00546389, -2.013397, 0, 1, 0.2313726, 1,
-0.3859846, -0.0558628, -2.494828, 0, 1, 0.2392157, 1,
-0.3851596, -0.009802258, -1.111361, 0, 1, 0.2431373, 1,
-0.3847203, -0.8946653, -2.959308, 0, 1, 0.2509804, 1,
-0.3799584, -1.508936, -2.334364, 0, 1, 0.254902, 1,
-0.378232, 0.4038111, -2.001396, 0, 1, 0.2627451, 1,
-0.3763968, 0.1619438, -2.163967, 0, 1, 0.2666667, 1,
-0.374141, -0.9234071, -1.246154, 0, 1, 0.2745098, 1,
-0.3569712, 0.4991658, -0.7522829, 0, 1, 0.2784314, 1,
-0.3533212, 1.770046, 0.5610682, 0, 1, 0.2862745, 1,
-0.3505059, 0.3608391, 0.2591276, 0, 1, 0.2901961, 1,
-0.34492, 0.1477273, 0.1487544, 0, 1, 0.2980392, 1,
-0.3313287, 2.722848, -0.8210546, 0, 1, 0.3058824, 1,
-0.3281528, 0.685386, -1.731238, 0, 1, 0.3098039, 1,
-0.3280795, -1.190379, -1.74004, 0, 1, 0.3176471, 1,
-0.3245755, 0.5733193, -1.214879, 0, 1, 0.3215686, 1,
-0.3227065, 0.4550761, -1.474765, 0, 1, 0.3294118, 1,
-0.3206551, -0.6866468, -1.611996, 0, 1, 0.3333333, 1,
-0.3190626, -0.03524016, -2.240905, 0, 1, 0.3411765, 1,
-0.3183047, -0.7682506, -1.317935, 0, 1, 0.345098, 1,
-0.3163983, 0.1475238, -0.4299988, 0, 1, 0.3529412, 1,
-0.3141361, -0.0127237, -1.537516, 0, 1, 0.3568628, 1,
-0.3099794, 0.07243619, -0.08149121, 0, 1, 0.3647059, 1,
-0.3059239, -0.8399222, -2.638176, 0, 1, 0.3686275, 1,
-0.3048605, -0.9919231, -2.138459, 0, 1, 0.3764706, 1,
-0.302149, -1.155359, -2.531971, 0, 1, 0.3803922, 1,
-0.2981297, -0.3135429, -1.517269, 0, 1, 0.3882353, 1,
-0.2895287, 0.9295197, -0.3752311, 0, 1, 0.3921569, 1,
-0.2817911, -0.4870527, -2.380062, 0, 1, 0.4, 1,
-0.281103, -1.931982, -2.825597, 0, 1, 0.4078431, 1,
-0.279622, -0.9214987, -2.072318, 0, 1, 0.4117647, 1,
-0.2773651, 0.2832506, -1.738351, 0, 1, 0.4196078, 1,
-0.2755207, 0.914966, -0.8284438, 0, 1, 0.4235294, 1,
-0.2731189, 0.1438437, -0.5930874, 0, 1, 0.4313726, 1,
-0.2727144, 0.1393142, 1.176828, 0, 1, 0.4352941, 1,
-0.27228, -0.8670526, -3.839136, 0, 1, 0.4431373, 1,
-0.2691768, 0.06349882, -0.4967734, 0, 1, 0.4470588, 1,
-0.2633852, 0.2587441, -0.9758251, 0, 1, 0.454902, 1,
-0.2603213, -0.533074, -3.014509, 0, 1, 0.4588235, 1,
-0.2583627, -0.006322816, -1.337458, 0, 1, 0.4666667, 1,
-0.2569492, 0.4027188, -0.5859033, 0, 1, 0.4705882, 1,
-0.255412, -0.3614484, -3.633403, 0, 1, 0.4784314, 1,
-0.2524348, 0.7069477, -0.9238313, 0, 1, 0.4823529, 1,
-0.2523908, -2.572979, -2.216024, 0, 1, 0.4901961, 1,
-0.2498366, -0.5368655, -2.394766, 0, 1, 0.4941176, 1,
-0.2484009, 0.009914899, -4.473952, 0, 1, 0.5019608, 1,
-0.2481565, 0.8623228, -1.490972, 0, 1, 0.509804, 1,
-0.2443947, 1.049929, -0.6025232, 0, 1, 0.5137255, 1,
-0.2423334, 0.1276926, -0.5705637, 0, 1, 0.5215687, 1,
-0.241494, 0.1874066, -1.981841, 0, 1, 0.5254902, 1,
-0.2342485, -1.764145, -4.661576, 0, 1, 0.5333334, 1,
-0.2324658, 2.137121, -0.3602364, 0, 1, 0.5372549, 1,
-0.2222657, -2.193354, -1.241254, 0, 1, 0.5450981, 1,
-0.2180484, -0.6444653, -0.5936894, 0, 1, 0.5490196, 1,
-0.2175656, 1.544169, 0.6318326, 0, 1, 0.5568628, 1,
-0.2116826, -0.7435061, -0.6084573, 0, 1, 0.5607843, 1,
-0.2102449, 0.6788177, -1.139634, 0, 1, 0.5686275, 1,
-0.209211, -0.7032841, -1.294515, 0, 1, 0.572549, 1,
-0.2085904, 0.6686068, 0.01302961, 0, 1, 0.5803922, 1,
-0.2064956, -1.396363, -2.443908, 0, 1, 0.5843138, 1,
-0.2034452, 0.2643726, 0.5319724, 0, 1, 0.5921569, 1,
-0.2010161, 0.2581472, -0.3934769, 0, 1, 0.5960785, 1,
-0.1995092, 1.004296, 0.3080074, 0, 1, 0.6039216, 1,
-0.1983508, -1.338492, -3.027605, 0, 1, 0.6117647, 1,
-0.1970109, -0.8898771, -2.594265, 0, 1, 0.6156863, 1,
-0.1934755, 1.333663, 0.581827, 0, 1, 0.6235294, 1,
-0.1913503, -0.5361795, -2.349236, 0, 1, 0.627451, 1,
-0.1845028, 0.04784248, -0.1999921, 0, 1, 0.6352941, 1,
-0.1830676, 0.04214429, -0.7871462, 0, 1, 0.6392157, 1,
-0.1813777, 1.159465, 0.06915138, 0, 1, 0.6470588, 1,
-0.1811729, -0.8979692, -2.237321, 0, 1, 0.6509804, 1,
-0.1811722, -0.8169684, -2.351956, 0, 1, 0.6588235, 1,
-0.1788666, -0.02915647, -2.432333, 0, 1, 0.6627451, 1,
-0.1763022, 0.6878741, -0.01432447, 0, 1, 0.6705883, 1,
-0.1735887, 0.2846012, -1.283553, 0, 1, 0.6745098, 1,
-0.170285, -0.3362313, -1.878259, 0, 1, 0.682353, 1,
-0.1685442, -0.5987942, -2.655112, 0, 1, 0.6862745, 1,
-0.1635201, 1.159661, -0.2684766, 0, 1, 0.6941177, 1,
-0.1588176, -0.2110881, -1.772457, 0, 1, 0.7019608, 1,
-0.1574533, -0.4352881, -4.626379, 0, 1, 0.7058824, 1,
-0.1548226, -0.4186702, -1.958194, 0, 1, 0.7137255, 1,
-0.153695, 0.158182, -0.6133925, 0, 1, 0.7176471, 1,
-0.1524396, -2.594054, -3.892905, 0, 1, 0.7254902, 1,
-0.1517319, 1.184452, -1.491797, 0, 1, 0.7294118, 1,
-0.1465693, 0.03271389, -0.6553931, 0, 1, 0.7372549, 1,
-0.1448931, 0.1081065, -1.270283, 0, 1, 0.7411765, 1,
-0.1441903, 1.736099, 0.756896, 0, 1, 0.7490196, 1,
-0.1440333, 0.9187324, 2.445662, 0, 1, 0.7529412, 1,
-0.1405442, -0.06939009, -2.394368, 0, 1, 0.7607843, 1,
-0.1390164, -0.9783342, -3.05474, 0, 1, 0.7647059, 1,
-0.1381517, -0.9232697, -4.753063, 0, 1, 0.772549, 1,
-0.1360043, 1.183751, -0.6692208, 0, 1, 0.7764706, 1,
-0.1329056, -0.3131232, -2.670633, 0, 1, 0.7843137, 1,
-0.1298767, 1.316895, -0.5958802, 0, 1, 0.7882353, 1,
-0.1298144, -0.4431623, -3.366725, 0, 1, 0.7960784, 1,
-0.1263096, -0.3946734, -3.318889, 0, 1, 0.8039216, 1,
-0.1250951, 1.016189, -1.297745, 0, 1, 0.8078431, 1,
-0.1250599, 0.6649534, -0.2454408, 0, 1, 0.8156863, 1,
-0.1248487, -1.359539, -3.352712, 0, 1, 0.8196079, 1,
-0.12436, -0.156622, -3.970427, 0, 1, 0.827451, 1,
-0.1209481, -0.04095007, -0.9878892, 0, 1, 0.8313726, 1,
-0.119557, -0.524602, -3.763129, 0, 1, 0.8392157, 1,
-0.119271, -1.060436, -2.966552, 0, 1, 0.8431373, 1,
-0.1065109, -0.9686356, -5.207329, 0, 1, 0.8509804, 1,
-0.1054711, -0.5681252, -3.107646, 0, 1, 0.854902, 1,
-0.1015638, 0.5310654, -0.2664822, 0, 1, 0.8627451, 1,
-0.09973616, -1.297476, -3.428872, 0, 1, 0.8666667, 1,
-0.0981935, -0.3525408, -1.971438, 0, 1, 0.8745098, 1,
-0.09746155, 0.06560384, -0.7824697, 0, 1, 0.8784314, 1,
-0.09614075, 1.306457, 0.1240596, 0, 1, 0.8862745, 1,
-0.09454075, 0.2123538, -0.4143018, 0, 1, 0.8901961, 1,
-0.0937448, 0.7235368, -0.8422868, 0, 1, 0.8980392, 1,
-0.09366734, 0.4073393, 0.4048585, 0, 1, 0.9058824, 1,
-0.09065234, 0.5206411, -0.6471819, 0, 1, 0.9098039, 1,
-0.08907164, 0.1515246, -0.6825274, 0, 1, 0.9176471, 1,
-0.08813477, 0.2617128, 0.5343702, 0, 1, 0.9215686, 1,
-0.08729819, -0.4343807, -2.258977, 0, 1, 0.9294118, 1,
-0.08361063, -0.8438044, -3.925926, 0, 1, 0.9333333, 1,
-0.07866716, 1.965211, -0.8445883, 0, 1, 0.9411765, 1,
-0.07198627, -0.6670683, -4.982779, 0, 1, 0.945098, 1,
-0.07147603, -0.03833375, -2.981638, 0, 1, 0.9529412, 1,
-0.07039606, 0.1461073, 0.3161412, 0, 1, 0.9568627, 1,
-0.07026092, 1.774883, -0.6512824, 0, 1, 0.9647059, 1,
-0.06490745, -0.6801461, -3.261362, 0, 1, 0.9686275, 1,
-0.05660395, -0.3746413, -3.062517, 0, 1, 0.9764706, 1,
-0.05411773, -1.697371, -2.665588, 0, 1, 0.9803922, 1,
-0.05385794, -0.02256282, -0.5989238, 0, 1, 0.9882353, 1,
-0.05084501, 0.5416744, 0.6147801, 0, 1, 0.9921569, 1,
-0.04658331, -0.9703751, -1.364582, 0, 1, 1, 1,
-0.04608198, 0.8280106, -1.1671, 0, 0.9921569, 1, 1,
-0.04182885, -0.1806979, -3.994082, 0, 0.9882353, 1, 1,
-0.0379391, 0.8601421, -0.1597451, 0, 0.9803922, 1, 1,
-0.0354817, -0.8421751, -4.713771, 0, 0.9764706, 1, 1,
-0.03359435, -0.7252999, -2.562192, 0, 0.9686275, 1, 1,
-0.03217907, -2.124522, -2.737661, 0, 0.9647059, 1, 1,
-0.02422517, 0.9607671, 0.5340089, 0, 0.9568627, 1, 1,
-0.02091661, 1.596794, -0.3025811, 0, 0.9529412, 1, 1,
-0.01940465, 0.2148471, 0.8578709, 0, 0.945098, 1, 1,
-0.01718832, -0.2755952, -4.172463, 0, 0.9411765, 1, 1,
-0.01149385, 1.47927, -0.6676747, 0, 0.9333333, 1, 1,
-0.01134539, 1.914503, -0.2094584, 0, 0.9294118, 1, 1,
-0.01032448, -0.4725398, -2.110581, 0, 0.9215686, 1, 1,
-0.01017708, -2.203924, -2.650345, 0, 0.9176471, 1, 1,
-0.007833719, 0.5417508, -0.2914666, 0, 0.9098039, 1, 1,
-0.003632391, -0.5136926, -2.473455, 0, 0.9058824, 1, 1,
-0.003622085, 0.03442936, 1.532078, 0, 0.8980392, 1, 1,
-0.003454758, -0.8409498, -3.298335, 0, 0.8901961, 1, 1,
-0.002693997, 0.05266944, -2.482035, 0, 0.8862745, 1, 1,
-0.0001412514, 0.935538, -0.6031417, 0, 0.8784314, 1, 1,
0.002627345, -1.350668, 2.817582, 0, 0.8745098, 1, 1,
0.008809403, -0.1409545, 5.847592, 0, 0.8666667, 1, 1,
0.009076174, 1.196821, 1.532413, 0, 0.8627451, 1, 1,
0.009434273, -1.433417, 1.109999, 0, 0.854902, 1, 1,
0.01335507, 0.2660342, -0.1635439, 0, 0.8509804, 1, 1,
0.01563196, -0.0884486, 4.686288, 0, 0.8431373, 1, 1,
0.01567068, -1.527503, 3.914613, 0, 0.8392157, 1, 1,
0.02164362, -0.9437814, 0.8557087, 0, 0.8313726, 1, 1,
0.02171151, 1.383915, 1.291188, 0, 0.827451, 1, 1,
0.0221235, 0.5687453, -1.320753, 0, 0.8196079, 1, 1,
0.02529035, 0.4873691, 0.942872, 0, 0.8156863, 1, 1,
0.02575555, -0.5037735, 3.255911, 0, 0.8078431, 1, 1,
0.02890996, 0.1736, -1.100675, 0, 0.8039216, 1, 1,
0.03074433, 0.4613378, -1.56379, 0, 0.7960784, 1, 1,
0.03098481, 0.8335779, 1.161062, 0, 0.7882353, 1, 1,
0.03245761, 0.6655039, -1.464345, 0, 0.7843137, 1, 1,
0.03625369, -0.7545978, 3.677559, 0, 0.7764706, 1, 1,
0.036263, -0.5661557, 2.537869, 0, 0.772549, 1, 1,
0.03846713, 0.930435, -1.592411, 0, 0.7647059, 1, 1,
0.04248442, 0.1047342, -1.269946, 0, 0.7607843, 1, 1,
0.04567013, -0.907118, 3.225847, 0, 0.7529412, 1, 1,
0.04928767, -0.50169, 3.78586, 0, 0.7490196, 1, 1,
0.05251609, -0.6165884, 2.86725, 0, 0.7411765, 1, 1,
0.05362889, 1.157061, 0.2333522, 0, 0.7372549, 1, 1,
0.05404065, 1.511936, -0.9429906, 0, 0.7294118, 1, 1,
0.05693278, -0.4464597, 1.698503, 0, 0.7254902, 1, 1,
0.06296806, 0.691795, -0.1133834, 0, 0.7176471, 1, 1,
0.06452105, -1.20023, 3.509046, 0, 0.7137255, 1, 1,
0.06502549, -1.344712, 3.684367, 0, 0.7058824, 1, 1,
0.06583271, 0.6045547, 0.4545746, 0, 0.6980392, 1, 1,
0.06914075, -0.4345968, 4.501172, 0, 0.6941177, 1, 1,
0.07167131, 1.264787, 1.116754, 0, 0.6862745, 1, 1,
0.07242387, -1.156134, 4.156899, 0, 0.682353, 1, 1,
0.07548503, 1.013781, -0.3602709, 0, 0.6745098, 1, 1,
0.07802111, -0.5258924, 2.58738, 0, 0.6705883, 1, 1,
0.07996394, -0.3593297, 2.262557, 0, 0.6627451, 1, 1,
0.08233087, 1.701676, -1.850809, 0, 0.6588235, 1, 1,
0.08958501, 1.353724, 0.8978766, 0, 0.6509804, 1, 1,
0.09651014, -2.057053, 3.903154, 0, 0.6470588, 1, 1,
0.09801129, -0.5494353, 3.424095, 0, 0.6392157, 1, 1,
0.1030008, -1.429177, 2.380142, 0, 0.6352941, 1, 1,
0.109704, -1.367019, 2.54711, 0, 0.627451, 1, 1,
0.1167619, 0.6890578, 1.422987, 0, 0.6235294, 1, 1,
0.1186127, -1.124635, 2.348447, 0, 0.6156863, 1, 1,
0.1210455, -1.093492, 2.682546, 0, 0.6117647, 1, 1,
0.1221072, 0.09304553, 1.422383, 0, 0.6039216, 1, 1,
0.1224648, 0.7273176, -1.22373, 0, 0.5960785, 1, 1,
0.1267941, 0.01042173, 1.790435, 0, 0.5921569, 1, 1,
0.1273096, 0.4611453, 1.044721, 0, 0.5843138, 1, 1,
0.132709, -1.090137, 4.299642, 0, 0.5803922, 1, 1,
0.1333214, -0.01462775, 2.27934, 0, 0.572549, 1, 1,
0.1373305, -0.09573271, 1.713242, 0, 0.5686275, 1, 1,
0.1399299, -1.648504, 2.816572, 0, 0.5607843, 1, 1,
0.1424614, 0.07885564, -0.3340584, 0, 0.5568628, 1, 1,
0.1514333, 0.1426411, 2.891889, 0, 0.5490196, 1, 1,
0.1532788, -0.9867235, 4.955376, 0, 0.5450981, 1, 1,
0.1535442, -1.627231, 4.744309, 0, 0.5372549, 1, 1,
0.1541995, -0.08008843, -0.03403362, 0, 0.5333334, 1, 1,
0.1581529, 1.392438, 1.249567, 0, 0.5254902, 1, 1,
0.1598176, 1.167688, -0.2171532, 0, 0.5215687, 1, 1,
0.1610809, -0.6537941, 2.977814, 0, 0.5137255, 1, 1,
0.1613674, 2.003962, -0.9156716, 0, 0.509804, 1, 1,
0.1618323, 0.577382, -0.2144288, 0, 0.5019608, 1, 1,
0.1642817, -0.7820666, 2.991805, 0, 0.4941176, 1, 1,
0.1650399, 0.1769218, -0.2073185, 0, 0.4901961, 1, 1,
0.1667816, -1.609669, 4.300673, 0, 0.4823529, 1, 1,
0.1722261, -0.07460157, 1.491495, 0, 0.4784314, 1, 1,
0.1794234, 1.481226, 0.9537477, 0, 0.4705882, 1, 1,
0.1851209, -0.2435396, 3.379977, 0, 0.4666667, 1, 1,
0.1865046, -0.779843, 3.962168, 0, 0.4588235, 1, 1,
0.1938365, 0.2349892, 0.4843073, 0, 0.454902, 1, 1,
0.193887, -1.558578, 1.698148, 0, 0.4470588, 1, 1,
0.1939635, 0.868818, 1.260469, 0, 0.4431373, 1, 1,
0.197126, 0.3616617, 0.7836826, 0, 0.4352941, 1, 1,
0.1985409, 0.3225631, -0.7277802, 0, 0.4313726, 1, 1,
0.2003205, -0.1693652, 1.430345, 0, 0.4235294, 1, 1,
0.2014403, -0.3794198, 3.585281, 0, 0.4196078, 1, 1,
0.210453, 1.001547, -1.744657, 0, 0.4117647, 1, 1,
0.2105522, -0.3139778, 2.187103, 0, 0.4078431, 1, 1,
0.2138596, -0.3268881, 2.228193, 0, 0.4, 1, 1,
0.2168276, 2.149022, 0.608036, 0, 0.3921569, 1, 1,
0.2170356, 0.6784752, 0.04968658, 0, 0.3882353, 1, 1,
0.2181514, -1.174354, 1.118106, 0, 0.3803922, 1, 1,
0.2184489, 0.1171736, -0.2081929, 0, 0.3764706, 1, 1,
0.2210234, 1.124857, -1.579735, 0, 0.3686275, 1, 1,
0.2255955, 1.383356, 0.9415038, 0, 0.3647059, 1, 1,
0.2261256, -0.275648, 1.436814, 0, 0.3568628, 1, 1,
0.2306842, -0.7835739, 4.156968, 0, 0.3529412, 1, 1,
0.2310674, 3.260674, -0.1956137, 0, 0.345098, 1, 1,
0.236194, -0.7299489, 4.143879, 0, 0.3411765, 1, 1,
0.2402892, -2.09698, 2.846299, 0, 0.3333333, 1, 1,
0.2419166, 0.525877, 0.3878493, 0, 0.3294118, 1, 1,
0.2422573, 1.012184, -0.1495493, 0, 0.3215686, 1, 1,
0.2450814, 0.89526, 2.396304, 0, 0.3176471, 1, 1,
0.254779, -1.148623, 3.715664, 0, 0.3098039, 1, 1,
0.2557603, -1.470378, 3.173874, 0, 0.3058824, 1, 1,
0.2568506, -0.07853968, 0.1804946, 0, 0.2980392, 1, 1,
0.2594979, -1.78017, 3.50353, 0, 0.2901961, 1, 1,
0.2604601, 0.8970696, 1.140287, 0, 0.2862745, 1, 1,
0.2622313, -0.3728851, 1.266056, 0, 0.2784314, 1, 1,
0.2633903, 1.00565, 0.4866877, 0, 0.2745098, 1, 1,
0.2721797, -0.3739085, 2.364893, 0, 0.2666667, 1, 1,
0.2774019, -0.7119449, 3.185699, 0, 0.2627451, 1, 1,
0.2809784, -0.9152101, 1.975526, 0, 0.254902, 1, 1,
0.2913967, -0.9795313, 3.391052, 0, 0.2509804, 1, 1,
0.2931187, 1.048537, 2.853205, 0, 0.2431373, 1, 1,
0.2985467, -0.3883677, -0.0370045, 0, 0.2392157, 1, 1,
0.3041005, -0.8512288, 1.913482, 0, 0.2313726, 1, 1,
0.3042804, 0.4046665, -0.210813, 0, 0.227451, 1, 1,
0.3064972, -0.2766223, 1.643897, 0, 0.2196078, 1, 1,
0.3082322, 0.1816989, 0.7174901, 0, 0.2156863, 1, 1,
0.3091908, 1.827877, -0.2991665, 0, 0.2078431, 1, 1,
0.310778, -0.3459367, 2.886965, 0, 0.2039216, 1, 1,
0.3162965, 0.6059854, 0.774458, 0, 0.1960784, 1, 1,
0.3180343, 0.01280417, 0.8331908, 0, 0.1882353, 1, 1,
0.3227388, 1.668896, 2.032146, 0, 0.1843137, 1, 1,
0.3273258, -1.801088, 1.521659, 0, 0.1764706, 1, 1,
0.3288665, 0.7361198, -0.5794285, 0, 0.172549, 1, 1,
0.3299224, 1.28115, 0.3592719, 0, 0.1647059, 1, 1,
0.3313544, 0.780651, 0.277289, 0, 0.1607843, 1, 1,
0.3325736, 0.8123886, 0.6407884, 0, 0.1529412, 1, 1,
0.335425, -1.049611, 3.033853, 0, 0.1490196, 1, 1,
0.3382299, 0.3427352, 0.5857529, 0, 0.1411765, 1, 1,
0.347077, 0.106124, 0.6818655, 0, 0.1372549, 1, 1,
0.3478831, -0.1541479, 1.747397, 0, 0.1294118, 1, 1,
0.3486379, -1.213215, 3.697753, 0, 0.1254902, 1, 1,
0.3526531, -0.3038157, 3.409748, 0, 0.1176471, 1, 1,
0.3566441, -0.09722129, 2.552585, 0, 0.1137255, 1, 1,
0.3604576, 1.288393, -0.7370254, 0, 0.1058824, 1, 1,
0.363853, -0.5726719, 2.647669, 0, 0.09803922, 1, 1,
0.3670585, -1.875182, 4.358394, 0, 0.09411765, 1, 1,
0.3690312, 1.294065, -1.497507, 0, 0.08627451, 1, 1,
0.3693916, -1.509976, 3.603069, 0, 0.08235294, 1, 1,
0.3705386, 0.3277642, -0.1561536, 0, 0.07450981, 1, 1,
0.3731185, -0.3159721, 0.2399844, 0, 0.07058824, 1, 1,
0.3800991, 0.8199106, 0.01834225, 0, 0.0627451, 1, 1,
0.380211, -0.4767416, 1.693897, 0, 0.05882353, 1, 1,
0.3833951, 1.238845, 1.409423, 0, 0.05098039, 1, 1,
0.3837059, -0.2351251, 2.851262, 0, 0.04705882, 1, 1,
0.3884279, -0.08258462, 1.245708, 0, 0.03921569, 1, 1,
0.3893647, -1.024866, 3.717433, 0, 0.03529412, 1, 1,
0.3900442, -1.14606, 2.698473, 0, 0.02745098, 1, 1,
0.3949061, -0.9210019, 4.058525, 0, 0.02352941, 1, 1,
0.4030269, 1.645741, 0.5347127, 0, 0.01568628, 1, 1,
0.4054034, 0.0002671013, 0.1068245, 0, 0.01176471, 1, 1,
0.405846, -0.7873057, 1.57553, 0, 0.003921569, 1, 1,
0.4061024, -0.06685612, 2.111617, 0.003921569, 0, 1, 1,
0.4144361, -1.09709, 4.538918, 0.007843138, 0, 1, 1,
0.4166418, -0.6353111, 1.39988, 0.01568628, 0, 1, 1,
0.4205269, 1.259711, 0.5310069, 0.01960784, 0, 1, 1,
0.4205902, 0.2962783, 0.3450327, 0.02745098, 0, 1, 1,
0.4221285, -1.955142, 3.321944, 0.03137255, 0, 1, 1,
0.422194, -0.3939937, 3.516953, 0.03921569, 0, 1, 1,
0.4279501, -1.001367, 3.196844, 0.04313726, 0, 1, 1,
0.4301723, -0.9096562, 2.317575, 0.05098039, 0, 1, 1,
0.4338436, -0.9408879, 2.784447, 0.05490196, 0, 1, 1,
0.4372168, -2.38339, 2.314016, 0.0627451, 0, 1, 1,
0.4380778, 0.8348156, 0.006399442, 0.06666667, 0, 1, 1,
0.4384404, -0.3617009, 3.262736, 0.07450981, 0, 1, 1,
0.4407894, 0.4885592, -0.4850568, 0.07843138, 0, 1, 1,
0.4414685, -0.4610534, 3.933671, 0.08627451, 0, 1, 1,
0.4442018, 1.515482, -0.1162483, 0.09019608, 0, 1, 1,
0.4459498, -1.217509, 2.294595, 0.09803922, 0, 1, 1,
0.4485742, -0.3608015, 1.248352, 0.1058824, 0, 1, 1,
0.4557814, 1.66799, 0.02321195, 0.1098039, 0, 1, 1,
0.4571558, 0.4903624, 2.097416, 0.1176471, 0, 1, 1,
0.457363, -0.5624181, 0.8596416, 0.1215686, 0, 1, 1,
0.4628649, 1.299263, 0.6204225, 0.1294118, 0, 1, 1,
0.4698294, 1.641862, -0.2621555, 0.1333333, 0, 1, 1,
0.4707044, -0.05999077, 1.682959, 0.1411765, 0, 1, 1,
0.478519, -0.6652811, 1.319193, 0.145098, 0, 1, 1,
0.4799455, 0.8644809, 0.7035783, 0.1529412, 0, 1, 1,
0.4835416, 2.994411, 0.06128094, 0.1568628, 0, 1, 1,
0.4886965, -0.1467868, 1.961002, 0.1647059, 0, 1, 1,
0.4936352, -0.3105087, 3.176004, 0.1686275, 0, 1, 1,
0.4960612, -0.5477685, 1.252386, 0.1764706, 0, 1, 1,
0.4965683, 1.081753, 0.7893715, 0.1803922, 0, 1, 1,
0.4969667, 0.1947201, 1.480612, 0.1882353, 0, 1, 1,
0.4990399, -0.1916249, 2.9498, 0.1921569, 0, 1, 1,
0.5000204, -1.239808, 3.072699, 0.2, 0, 1, 1,
0.501945, 1.07353, -0.3795454, 0.2078431, 0, 1, 1,
0.5076365, -0.4087974, 3.988461, 0.2117647, 0, 1, 1,
0.5113795, 1.236388, -1.186622, 0.2196078, 0, 1, 1,
0.5123777, -0.07917868, 2.256879, 0.2235294, 0, 1, 1,
0.513836, 0.3723575, 1.084793, 0.2313726, 0, 1, 1,
0.5163913, 1.290353, 0.1745705, 0.2352941, 0, 1, 1,
0.5189819, 0.3849315, 2.285712, 0.2431373, 0, 1, 1,
0.5192165, 0.9021952, -0.3163935, 0.2470588, 0, 1, 1,
0.529869, 1.322304, -0.8571321, 0.254902, 0, 1, 1,
0.5310425, -0.9142163, 3.958488, 0.2588235, 0, 1, 1,
0.535852, 0.9989695, 0.9394439, 0.2666667, 0, 1, 1,
0.542827, 0.174864, 3.419444, 0.2705882, 0, 1, 1,
0.5477293, -0.08371384, 1.784223, 0.2784314, 0, 1, 1,
0.5552266, -1.591478, 2.045286, 0.282353, 0, 1, 1,
0.5565638, -0.6783988, 1.948483, 0.2901961, 0, 1, 1,
0.5638107, -0.387072, 1.222415, 0.2941177, 0, 1, 1,
0.5645623, 0.6057389, 2.13209, 0.3019608, 0, 1, 1,
0.5649568, -0.1473445, 0.5985957, 0.3098039, 0, 1, 1,
0.5652699, -0.7201738, 3.4708, 0.3137255, 0, 1, 1,
0.5694, 0.5711476, 2.880666, 0.3215686, 0, 1, 1,
0.5700406, 0.4406385, 0.1023361, 0.3254902, 0, 1, 1,
0.5721516, -0.2283505, 2.965918, 0.3333333, 0, 1, 1,
0.5721633, 1.570576, 0.2051418, 0.3372549, 0, 1, 1,
0.5743169, 1.533921, -0.3831078, 0.345098, 0, 1, 1,
0.5749311, -0.6743916, 1.651185, 0.3490196, 0, 1, 1,
0.5769348, -0.6129894, 1.218856, 0.3568628, 0, 1, 1,
0.5772685, -0.2510563, 2.954902, 0.3607843, 0, 1, 1,
0.582495, 0.6170881, 0.259386, 0.3686275, 0, 1, 1,
0.5881369, -0.7765948, 2.078411, 0.372549, 0, 1, 1,
0.5899187, 0.166284, 0.1160639, 0.3803922, 0, 1, 1,
0.6006978, 1.078932, 2.520076, 0.3843137, 0, 1, 1,
0.6014324, -1.094793, 3.022848, 0.3921569, 0, 1, 1,
0.6026599, -0.9640549, 2.234988, 0.3960784, 0, 1, 1,
0.607295, -0.32081, 1.384198, 0.4039216, 0, 1, 1,
0.6097594, 1.261451, -0.2093827, 0.4117647, 0, 1, 1,
0.6162199, -0.2873162, 2.746062, 0.4156863, 0, 1, 1,
0.6207755, 0.7266951, 1.099999, 0.4235294, 0, 1, 1,
0.6232634, 0.1047366, 1.40846, 0.427451, 0, 1, 1,
0.6275506, -0.02942346, 1.029761, 0.4352941, 0, 1, 1,
0.6294984, 2.353032, -0.7795706, 0.4392157, 0, 1, 1,
0.6359999, -1.161901, 2.792647, 0.4470588, 0, 1, 1,
0.6387339, 0.9941059, 1.99206, 0.4509804, 0, 1, 1,
0.6401373, 0.07908739, 2.081111, 0.4588235, 0, 1, 1,
0.6407251, -0.2176661, 1.218576, 0.4627451, 0, 1, 1,
0.6433188, 1.655901, -0.7941983, 0.4705882, 0, 1, 1,
0.6494561, -0.3569206, 2.553048, 0.4745098, 0, 1, 1,
0.6505653, 0.215096, 0.5810644, 0.4823529, 0, 1, 1,
0.6570209, 0.5519446, 0.08304603, 0.4862745, 0, 1, 1,
0.6616877, 0.1577294, 0.9065565, 0.4941176, 0, 1, 1,
0.6638578, 0.8912038, 2.228334, 0.5019608, 0, 1, 1,
0.6662275, -1.131861, 1.061007, 0.5058824, 0, 1, 1,
0.6731394, 1.19549, 0.1980578, 0.5137255, 0, 1, 1,
0.673212, -1.455207, 2.607407, 0.5176471, 0, 1, 1,
0.6784788, 0.1333458, 0.874904, 0.5254902, 0, 1, 1,
0.6792611, 0.4176, 1.393263, 0.5294118, 0, 1, 1,
0.6814689, 0.4856857, 1.215516, 0.5372549, 0, 1, 1,
0.6860918, 1.298918, 0.5561575, 0.5411765, 0, 1, 1,
0.6866912, 0.5980423, 0.5111629, 0.5490196, 0, 1, 1,
0.6867197, 0.06752117, 1.119167, 0.5529412, 0, 1, 1,
0.6867476, 0.1857276, 0.1498293, 0.5607843, 0, 1, 1,
0.6870578, 0.9596429, 0.1134238, 0.5647059, 0, 1, 1,
0.6879261, -1.019338, 1.059784, 0.572549, 0, 1, 1,
0.6902151, -0.7687615, 1.909917, 0.5764706, 0, 1, 1,
0.6919978, 0.4585422, -0.3199401, 0.5843138, 0, 1, 1,
0.6939769, 0.07225642, 0.9662223, 0.5882353, 0, 1, 1,
0.6990895, 0.03754211, 0.8089393, 0.5960785, 0, 1, 1,
0.7037442, -0.6828036, 2.026077, 0.6039216, 0, 1, 1,
0.7046014, -0.1668151, 1.479718, 0.6078432, 0, 1, 1,
0.7129807, 0.9200805, -0.3874939, 0.6156863, 0, 1, 1,
0.7195359, -0.8460171, 3.837495, 0.6196079, 0, 1, 1,
0.7198691, 0.1112624, 2.055587, 0.627451, 0, 1, 1,
0.721769, -1.732605, 3.259253, 0.6313726, 0, 1, 1,
0.7222298, 1.352987, 0.655432, 0.6392157, 0, 1, 1,
0.7222793, 1.870183, 0.8389292, 0.6431373, 0, 1, 1,
0.7253394, 0.09270092, 1.464924, 0.6509804, 0, 1, 1,
0.7259405, -0.6001939, 1.859079, 0.654902, 0, 1, 1,
0.7317384, 0.2862264, 1.306845, 0.6627451, 0, 1, 1,
0.7332957, 1.179963, 2.893955, 0.6666667, 0, 1, 1,
0.7340332, 0.8837652, 0.9976996, 0.6745098, 0, 1, 1,
0.7378263, -2.25173, 2.564969, 0.6784314, 0, 1, 1,
0.7449348, -0.5835453, 3.0844, 0.6862745, 0, 1, 1,
0.7466327, -0.2125315, 2.93584, 0.6901961, 0, 1, 1,
0.7474707, 0.03022048, 1.923117, 0.6980392, 0, 1, 1,
0.7483671, -0.7365817, 1.684052, 0.7058824, 0, 1, 1,
0.7508656, -1.048784, 1.630494, 0.7098039, 0, 1, 1,
0.7529359, 0.8671523, 1.692867, 0.7176471, 0, 1, 1,
0.7542476, -1.665984, 1.642198, 0.7215686, 0, 1, 1,
0.7616276, 0.7660565, 1.830105, 0.7294118, 0, 1, 1,
0.7688668, -0.8269888, 2.95961, 0.7333333, 0, 1, 1,
0.7764211, 0.2132291, 3.285671, 0.7411765, 0, 1, 1,
0.7773969, -0.3940153, 1.638536, 0.7450981, 0, 1, 1,
0.780412, -1.291716, 3.00545, 0.7529412, 0, 1, 1,
0.7853287, 1.437812, -0.5552999, 0.7568628, 0, 1, 1,
0.787484, -0.6571615, 2.33818, 0.7647059, 0, 1, 1,
0.7932347, -0.5633674, 1.545908, 0.7686275, 0, 1, 1,
0.7960935, -0.1752051, 1.922316, 0.7764706, 0, 1, 1,
0.7978927, -0.205703, 2.908378, 0.7803922, 0, 1, 1,
0.8024668, 0.09621272, 1.164294, 0.7882353, 0, 1, 1,
0.8053962, -0.1801261, 0.04892916, 0.7921569, 0, 1, 1,
0.8073674, -0.8143122, 2.750239, 0.8, 0, 1, 1,
0.8075952, -0.08892716, 2.016361, 0.8078431, 0, 1, 1,
0.809262, -1.084386, 2.234144, 0.8117647, 0, 1, 1,
0.8137553, -0.1504562, 2.855836, 0.8196079, 0, 1, 1,
0.8187438, 0.06578485, 1.894187, 0.8235294, 0, 1, 1,
0.8222203, -1.084578, 3.805001, 0.8313726, 0, 1, 1,
0.8227704, -0.9114203, 2.722436, 0.8352941, 0, 1, 1,
0.8282575, -1.225943, 2.6835, 0.8431373, 0, 1, 1,
0.8292906, -1.065221, 2.664801, 0.8470588, 0, 1, 1,
0.8301029, -1.197139, 2.34253, 0.854902, 0, 1, 1,
0.8345906, -0.4570986, 1.172763, 0.8588235, 0, 1, 1,
0.8395495, -1.017526, 1.184646, 0.8666667, 0, 1, 1,
0.8425556, -1.575524, 1.837496, 0.8705882, 0, 1, 1,
0.8435989, 1.836174, 0.7717702, 0.8784314, 0, 1, 1,
0.8437583, 1.002261, 1.458816, 0.8823529, 0, 1, 1,
0.8484027, 1.050173, 1.123924, 0.8901961, 0, 1, 1,
0.8511959, -1.734557, 2.291509, 0.8941177, 0, 1, 1,
0.8602582, 0.4378643, 0.7486261, 0.9019608, 0, 1, 1,
0.8635525, -0.1120223, 0.9273148, 0.9098039, 0, 1, 1,
0.874529, -0.1216957, 1.170294, 0.9137255, 0, 1, 1,
0.8765607, -0.06625616, 1.764276, 0.9215686, 0, 1, 1,
0.8869438, 2.54848, 0.4124071, 0.9254902, 0, 1, 1,
0.8872086, -0.7742885, 4.235318, 0.9333333, 0, 1, 1,
0.8928326, 0.4937366, 1.753448, 0.9372549, 0, 1, 1,
0.8945892, -0.5810828, 1.553947, 0.945098, 0, 1, 1,
0.8951058, -0.999102, 4.567993, 0.9490196, 0, 1, 1,
0.8989855, 0.6047339, 0.8008387, 0.9568627, 0, 1, 1,
0.9199579, -1.142718, 1.461332, 0.9607843, 0, 1, 1,
0.9228265, -1.282109, 2.094877, 0.9686275, 0, 1, 1,
0.9232858, -2.73517, 2.253365, 0.972549, 0, 1, 1,
0.9262187, -0.2839852, 1.92166, 0.9803922, 0, 1, 1,
0.9269235, 0.9169672, -1.849749, 0.9843137, 0, 1, 1,
0.9335048, -3.904989, 2.054115, 0.9921569, 0, 1, 1,
0.9343429, -0.07312393, 2.950196, 0.9960784, 0, 1, 1,
0.9423428, -0.3398011, 1.25897, 1, 0, 0.9960784, 1,
0.9437757, -0.1604898, 1.740007, 1, 0, 0.9882353, 1,
0.9494745, -0.252292, 2.56889, 1, 0, 0.9843137, 1,
0.9501743, -1.089901, 0.8958309, 1, 0, 0.9764706, 1,
0.9520736, -2.262864, 2.771793, 1, 0, 0.972549, 1,
0.9567974, 1.663095, 1.021187, 1, 0, 0.9647059, 1,
0.9599535, 0.9858633, -0.4774196, 1, 0, 0.9607843, 1,
0.9628814, 0.5960052, 0.6510457, 1, 0, 0.9529412, 1,
0.9664561, 1.238408, 1.393482, 1, 0, 0.9490196, 1,
0.9664726, -0.7772575, 3.059675, 1, 0, 0.9411765, 1,
0.9673063, -1.299137, 3.501291, 1, 0, 0.9372549, 1,
0.9775, 0.2770236, 1.25903, 1, 0, 0.9294118, 1,
0.9776621, 0.9114134, 1.207194, 1, 0, 0.9254902, 1,
0.9777949, -1.056766, 3.636626, 1, 0, 0.9176471, 1,
0.9790727, 0.2802283, 0.990471, 1, 0, 0.9137255, 1,
0.9858811, 0.1531314, 1.690057, 1, 0, 0.9058824, 1,
0.9885055, -1.037134, 2.037578, 1, 0, 0.9019608, 1,
0.9900005, -0.763786, 2.335708, 1, 0, 0.8941177, 1,
0.9914207, 0.7153856, 0.7396774, 1, 0, 0.8862745, 1,
0.9936705, 0.9444248, 2.75519, 1, 0, 0.8823529, 1,
0.9949, 0.8446153, 0.8890296, 1, 0, 0.8745098, 1,
0.9958835, 0.6669402, 1.555184, 1, 0, 0.8705882, 1,
0.9967087, 0.5186768, 0.5675882, 1, 0, 0.8627451, 1,
0.9974472, -0.9386165, 2.260948, 1, 0, 0.8588235, 1,
0.9974777, 0.2502395, 0.7297801, 1, 0, 0.8509804, 1,
1.001347, -0.3193929, 2.891016, 1, 0, 0.8470588, 1,
1.006409, 0.5049316, 1.039083, 1, 0, 0.8392157, 1,
1.010558, 0.1891527, 0.2865946, 1, 0, 0.8352941, 1,
1.016613, -0.3020675, 3.060189, 1, 0, 0.827451, 1,
1.023747, -0.4163353, 1.293507, 1, 0, 0.8235294, 1,
1.030841, 0.6522428, 0.5008588, 1, 0, 0.8156863, 1,
1.033144, -0.05676457, 2.65886, 1, 0, 0.8117647, 1,
1.037679, -0.685453, 3.735907, 1, 0, 0.8039216, 1,
1.041115, -2.580024, 4.053649, 1, 0, 0.7960784, 1,
1.04472, -0.7770402, 3.626006, 1, 0, 0.7921569, 1,
1.046058, -0.2763393, 3.448467, 1, 0, 0.7843137, 1,
1.049669, -0.7254148, 1.86861, 1, 0, 0.7803922, 1,
1.052678, 0.6414148, 1.693782, 1, 0, 0.772549, 1,
1.058424, -0.943224, 2.070868, 1, 0, 0.7686275, 1,
1.059343, -1.408643, 2.517984, 1, 0, 0.7607843, 1,
1.070534, 0.04974647, 2.147968, 1, 0, 0.7568628, 1,
1.073856, -0.2427958, 1.983078, 1, 0, 0.7490196, 1,
1.074797, 1.617748, 0.4977613, 1, 0, 0.7450981, 1,
1.075936, 0.1112664, 3.47696, 1, 0, 0.7372549, 1,
1.081842, 1.452773, 1.288214, 1, 0, 0.7333333, 1,
1.08405, 0.8758221, -0.7929365, 1, 0, 0.7254902, 1,
1.090953, -0.8699441, 2.058193, 1, 0, 0.7215686, 1,
1.094117, -2.1129, 2.115299, 1, 0, 0.7137255, 1,
1.096769, 2.04036, 2.067656, 1, 0, 0.7098039, 1,
1.099296, -0.9101692, 1.916218, 1, 0, 0.7019608, 1,
1.115729, -0.2940855, 2.507604, 1, 0, 0.6941177, 1,
1.120192, -0.596937, 1.574017, 1, 0, 0.6901961, 1,
1.124371, -0.35017, 1.067355, 1, 0, 0.682353, 1,
1.128321, 0.1499279, 2.104652, 1, 0, 0.6784314, 1,
1.131073, -0.4495105, 1.611737, 1, 0, 0.6705883, 1,
1.147642, -0.7249401, 3.512512, 1, 0, 0.6666667, 1,
1.148593, 0.3346865, 0.6601515, 1, 0, 0.6588235, 1,
1.149154, -2.745642, 2.516234, 1, 0, 0.654902, 1,
1.174597, -0.02514466, 2.604192, 1, 0, 0.6470588, 1,
1.17497, 0.3750496, 2.769682, 1, 0, 0.6431373, 1,
1.183138, 0.8775052, 1.312629, 1, 0, 0.6352941, 1,
1.192971, -0.2834224, 0.9558415, 1, 0, 0.6313726, 1,
1.195887, 1.716094, -0.6127129, 1, 0, 0.6235294, 1,
1.207797, 1.336586, 0.3423891, 1, 0, 0.6196079, 1,
1.212466, -0.4326446, 1.725106, 1, 0, 0.6117647, 1,
1.217003, -0.1711971, 2.574548, 1, 0, 0.6078432, 1,
1.226899, 0.9374649, 0.8273962, 1, 0, 0.6, 1,
1.236917, 0.9432247, 0.5294728, 1, 0, 0.5921569, 1,
1.237044, -0.03142009, 2.399504, 1, 0, 0.5882353, 1,
1.244617, 0.6164445, 1.300444, 1, 0, 0.5803922, 1,
1.250926, -0.3838989, 2.719395, 1, 0, 0.5764706, 1,
1.252916, 1.793557, 2.085947, 1, 0, 0.5686275, 1,
1.268898, 0.2572286, -0.124614, 1, 0, 0.5647059, 1,
1.270161, 0.3815483, 1.340698, 1, 0, 0.5568628, 1,
1.27514, -0.1845781, -0.08281901, 1, 0, 0.5529412, 1,
1.27822, 1.845237, -0.5845381, 1, 0, 0.5450981, 1,
1.279329, 0.3031146, 0.6337174, 1, 0, 0.5411765, 1,
1.289667, -0.8892519, 1.801929, 1, 0, 0.5333334, 1,
1.292353, -0.152887, 1.380656, 1, 0, 0.5294118, 1,
1.296818, -1.976638, 3.326463, 1, 0, 0.5215687, 1,
1.298085, -0.9485556, 1.346427, 1, 0, 0.5176471, 1,
1.299703, -0.06619203, 2.066741, 1, 0, 0.509804, 1,
1.302171, 1.719801, 1.058743, 1, 0, 0.5058824, 1,
1.309463, 0.1617963, 2.087446, 1, 0, 0.4980392, 1,
1.311422, 0.7288355, 2.324317, 1, 0, 0.4901961, 1,
1.314365, 0.196112, 2.234093, 1, 0, 0.4862745, 1,
1.315838, -0.9037964, 0.9205734, 1, 0, 0.4784314, 1,
1.320845, -0.5089159, 1.981951, 1, 0, 0.4745098, 1,
1.32834, 1.001093, 1.449681, 1, 0, 0.4666667, 1,
1.332686, 0.5679415, 1.385983, 1, 0, 0.4627451, 1,
1.340537, -0.8416532, 2.173272, 1, 0, 0.454902, 1,
1.342896, -1.241041, 1.698384, 1, 0, 0.4509804, 1,
1.349672, -0.5937471, 1.590268, 1, 0, 0.4431373, 1,
1.363017, 0.8574775, -0.7164378, 1, 0, 0.4392157, 1,
1.367401, 0.1261594, 0.8894339, 1, 0, 0.4313726, 1,
1.368, -1.161556, 1.715111, 1, 0, 0.427451, 1,
1.377646, 0.08354047, 1.307065, 1, 0, 0.4196078, 1,
1.381073, 0.7905263, 1.025537, 1, 0, 0.4156863, 1,
1.406457, 0.177836, -0.8445368, 1, 0, 0.4078431, 1,
1.428256, 0.8389426, 1.682257, 1, 0, 0.4039216, 1,
1.428795, -1.137869, 1.717909, 1, 0, 0.3960784, 1,
1.450588, -0.7557031, 0.7594007, 1, 0, 0.3882353, 1,
1.45087, -0.1123134, 0.05227075, 1, 0, 0.3843137, 1,
1.454483, 0.8028669, 1.366747, 1, 0, 0.3764706, 1,
1.462775, -0.9727879, 1.242317, 1, 0, 0.372549, 1,
1.464471, 0.6322143, 2.166281, 1, 0, 0.3647059, 1,
1.467525, -0.4389457, 3.159561, 1, 0, 0.3607843, 1,
1.468044, 0.2720484, 1.128698, 1, 0, 0.3529412, 1,
1.475168, 0.3908896, 0.08155806, 1, 0, 0.3490196, 1,
1.492931, -0.5632439, 1.731253, 1, 0, 0.3411765, 1,
1.496984, -0.5530572, 1.883217, 1, 0, 0.3372549, 1,
1.526326, -0.5472012, 2.994584, 1, 0, 0.3294118, 1,
1.527587, -0.968919, 2.344529, 1, 0, 0.3254902, 1,
1.530024, 2.006719, 0.6755051, 1, 0, 0.3176471, 1,
1.578373, -1.174498, 2.876349, 1, 0, 0.3137255, 1,
1.589546, 1.054414, 2.484558, 1, 0, 0.3058824, 1,
1.620158, 0.5850703, 0.6213579, 1, 0, 0.2980392, 1,
1.620509, 0.8520237, 1.495165, 1, 0, 0.2941177, 1,
1.624335, 0.02477249, 3.280464, 1, 0, 0.2862745, 1,
1.627, -0.9696984, 3.067229, 1, 0, 0.282353, 1,
1.635422, -0.739228, 2.182511, 1, 0, 0.2745098, 1,
1.655363, 0.2140397, 0.3820331, 1, 0, 0.2705882, 1,
1.665524, -0.03756885, 0.9743031, 1, 0, 0.2627451, 1,
1.728961, 0.3916407, 1.588121, 1, 0, 0.2588235, 1,
1.733963, 1.936678, 2.025934, 1, 0, 0.2509804, 1,
1.766652, 0.8727671, 0.006562028, 1, 0, 0.2470588, 1,
1.772725, 1.76952, 0.2861371, 1, 0, 0.2392157, 1,
1.856868, 0.7151761, 1.350824, 1, 0, 0.2352941, 1,
1.857274, 2.573194, -1.164025, 1, 0, 0.227451, 1,
1.857648, 0.4151351, 1.027809, 1, 0, 0.2235294, 1,
1.86736, -0.406532, 2.19629, 1, 0, 0.2156863, 1,
1.881911, 0.494743, -0.5116612, 1, 0, 0.2117647, 1,
1.883656, -1.273221, 3.459266, 1, 0, 0.2039216, 1,
1.885695, -0.3171938, 1.5359, 1, 0, 0.1960784, 1,
1.888661, -0.2251607, 2.401497, 1, 0, 0.1921569, 1,
1.903758, -0.6757638, 2.885854, 1, 0, 0.1843137, 1,
1.908926, 1.759291, 1.913681, 1, 0, 0.1803922, 1,
1.928315, -2.65867, 1.111512, 1, 0, 0.172549, 1,
1.930799, 0.3802801, 3.215782, 1, 0, 0.1686275, 1,
1.962383, 0.9618196, -0.4121749, 1, 0, 0.1607843, 1,
1.9642, 0.007041447, 2.275438, 1, 0, 0.1568628, 1,
1.972631, 0.1540133, 1.040627, 1, 0, 0.1490196, 1,
1.974016, -0.1957448, 2.073768, 1, 0, 0.145098, 1,
2.026578, 0.2183001, 0.9461684, 1, 0, 0.1372549, 1,
2.036521, 1.443183, -0.7162623, 1, 0, 0.1333333, 1,
2.046304, 0.6921312, 0.6403813, 1, 0, 0.1254902, 1,
2.135094, -0.07744887, 1.113682, 1, 0, 0.1215686, 1,
2.148024, -0.4545137, 2.096357, 1, 0, 0.1137255, 1,
2.149646, -0.2205262, -0.8505924, 1, 0, 0.1098039, 1,
2.159473, -0.04793144, 2.6824, 1, 0, 0.1019608, 1,
2.225852, 2.483011, 1.128663, 1, 0, 0.09411765, 1,
2.253119, 0.5108571, 0.3196186, 1, 0, 0.09019608, 1,
2.270194, 0.6506228, 1.04734, 1, 0, 0.08235294, 1,
2.276828, -0.9263119, 2.241286, 1, 0, 0.07843138, 1,
2.302211, -1.493753, 2.298411, 1, 0, 0.07058824, 1,
2.377278, -0.5678686, 1.209337, 1, 0, 0.06666667, 1,
2.464762, 0.192434, -0.1067338, 1, 0, 0.05882353, 1,
2.543639, 0.9988776, 0.73479, 1, 0, 0.05490196, 1,
2.57248, 0.0238422, 3.394402, 1, 0, 0.04705882, 1,
2.64299, 1.337978, 1.377205, 1, 0, 0.04313726, 1,
2.844773, 0.4148063, 1.599666, 1, 0, 0.03529412, 1,
2.853634, -1.048591, 3.217101, 1, 0, 0.03137255, 1,
2.914691, -2.053326, 1.112985, 1, 0, 0.02352941, 1,
2.993396, 0.8622363, 0.9514284, 1, 0, 0.01960784, 1,
2.996396, 1.386054, 2.092147, 1, 0, 0.01176471, 1,
3.24999, 0.2003819, -1.881661, 1, 0, 0.007843138, 1
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
-0.04148197, -5.119568, -7.776644, 0, -0.5, 0.5, 0.5,
-0.04148197, -5.119568, -7.776644, 1, -0.5, 0.5, 0.5,
-0.04148197, -5.119568, -7.776644, 1, 1.5, 0.5, 0.5,
-0.04148197, -5.119568, -7.776644, 0, 1.5, 0.5, 0.5
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
-4.448763, -0.3221575, -7.776644, 0, -0.5, 0.5, 0.5,
-4.448763, -0.3221575, -7.776644, 1, -0.5, 0.5, 0.5,
-4.448763, -0.3221575, -7.776644, 1, 1.5, 0.5, 0.5,
-4.448763, -0.3221575, -7.776644, 0, 1.5, 0.5, 0.5
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
-4.448763, -5.119568, 0.02277946, 0, -0.5, 0.5, 0.5,
-4.448763, -5.119568, 0.02277946, 1, -0.5, 0.5, 0.5,
-4.448763, -5.119568, 0.02277946, 1, 1.5, 0.5, 0.5,
-4.448763, -5.119568, 0.02277946, 0, 1.5, 0.5, 0.5
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
-3, -4.012474, -5.976778,
3, -4.012474, -5.976778,
-3, -4.012474, -5.976778,
-3, -4.196989, -6.276755,
-2, -4.012474, -5.976778,
-2, -4.196989, -6.276755,
-1, -4.012474, -5.976778,
-1, -4.196989, -6.276755,
0, -4.012474, -5.976778,
0, -4.196989, -6.276755,
1, -4.012474, -5.976778,
1, -4.196989, -6.276755,
2, -4.012474, -5.976778,
2, -4.196989, -6.276755,
3, -4.012474, -5.976778,
3, -4.196989, -6.276755
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
-3, -4.566021, -6.876711, 0, -0.5, 0.5, 0.5,
-3, -4.566021, -6.876711, 1, -0.5, 0.5, 0.5,
-3, -4.566021, -6.876711, 1, 1.5, 0.5, 0.5,
-3, -4.566021, -6.876711, 0, 1.5, 0.5, 0.5,
-2, -4.566021, -6.876711, 0, -0.5, 0.5, 0.5,
-2, -4.566021, -6.876711, 1, -0.5, 0.5, 0.5,
-2, -4.566021, -6.876711, 1, 1.5, 0.5, 0.5,
-2, -4.566021, -6.876711, 0, 1.5, 0.5, 0.5,
-1, -4.566021, -6.876711, 0, -0.5, 0.5, 0.5,
-1, -4.566021, -6.876711, 1, -0.5, 0.5, 0.5,
-1, -4.566021, -6.876711, 1, 1.5, 0.5, 0.5,
-1, -4.566021, -6.876711, 0, 1.5, 0.5, 0.5,
0, -4.566021, -6.876711, 0, -0.5, 0.5, 0.5,
0, -4.566021, -6.876711, 1, -0.5, 0.5, 0.5,
0, -4.566021, -6.876711, 1, 1.5, 0.5, 0.5,
0, -4.566021, -6.876711, 0, 1.5, 0.5, 0.5,
1, -4.566021, -6.876711, 0, -0.5, 0.5, 0.5,
1, -4.566021, -6.876711, 1, -0.5, 0.5, 0.5,
1, -4.566021, -6.876711, 1, 1.5, 0.5, 0.5,
1, -4.566021, -6.876711, 0, 1.5, 0.5, 0.5,
2, -4.566021, -6.876711, 0, -0.5, 0.5, 0.5,
2, -4.566021, -6.876711, 1, -0.5, 0.5, 0.5,
2, -4.566021, -6.876711, 1, 1.5, 0.5, 0.5,
2, -4.566021, -6.876711, 0, 1.5, 0.5, 0.5,
3, -4.566021, -6.876711, 0, -0.5, 0.5, 0.5,
3, -4.566021, -6.876711, 1, -0.5, 0.5, 0.5,
3, -4.566021, -6.876711, 1, 1.5, 0.5, 0.5,
3, -4.566021, -6.876711, 0, 1.5, 0.5, 0.5
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
-3.431698, -2, -5.976778,
-3.431698, 2, -5.976778,
-3.431698, -2, -5.976778,
-3.601209, -2, -6.276755,
-3.431698, 0, -5.976778,
-3.601209, 0, -6.276755,
-3.431698, 2, -5.976778,
-3.601209, 2, -6.276755
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
"0",
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
-3.940231, -2, -6.876711, 0, -0.5, 0.5, 0.5,
-3.940231, -2, -6.876711, 1, -0.5, 0.5, 0.5,
-3.940231, -2, -6.876711, 1, 1.5, 0.5, 0.5,
-3.940231, -2, -6.876711, 0, 1.5, 0.5, 0.5,
-3.940231, 0, -6.876711, 0, -0.5, 0.5, 0.5,
-3.940231, 0, -6.876711, 1, -0.5, 0.5, 0.5,
-3.940231, 0, -6.876711, 1, 1.5, 0.5, 0.5,
-3.940231, 0, -6.876711, 0, 1.5, 0.5, 0.5,
-3.940231, 2, -6.876711, 0, -0.5, 0.5, 0.5,
-3.940231, 2, -6.876711, 1, -0.5, 0.5, 0.5,
-3.940231, 2, -6.876711, 1, 1.5, 0.5, 0.5,
-3.940231, 2, -6.876711, 0, 1.5, 0.5, 0.5
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
-3.431698, -4.012474, -4,
-3.431698, -4.012474, 4,
-3.431698, -4.012474, -4,
-3.601209, -4.196989, -4,
-3.431698, -4.012474, -2,
-3.601209, -4.196989, -2,
-3.431698, -4.012474, 0,
-3.601209, -4.196989, 0,
-3.431698, -4.012474, 2,
-3.601209, -4.196989, 2,
-3.431698, -4.012474, 4,
-3.601209, -4.196989, 4
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
-3.940231, -4.566021, -4, 0, -0.5, 0.5, 0.5,
-3.940231, -4.566021, -4, 1, -0.5, 0.5, 0.5,
-3.940231, -4.566021, -4, 1, 1.5, 0.5, 0.5,
-3.940231, -4.566021, -4, 0, 1.5, 0.5, 0.5,
-3.940231, -4.566021, -2, 0, -0.5, 0.5, 0.5,
-3.940231, -4.566021, -2, 1, -0.5, 0.5, 0.5,
-3.940231, -4.566021, -2, 1, 1.5, 0.5, 0.5,
-3.940231, -4.566021, -2, 0, 1.5, 0.5, 0.5,
-3.940231, -4.566021, 0, 0, -0.5, 0.5, 0.5,
-3.940231, -4.566021, 0, 1, -0.5, 0.5, 0.5,
-3.940231, -4.566021, 0, 1, 1.5, 0.5, 0.5,
-3.940231, -4.566021, 0, 0, 1.5, 0.5, 0.5,
-3.940231, -4.566021, 2, 0, -0.5, 0.5, 0.5,
-3.940231, -4.566021, 2, 1, -0.5, 0.5, 0.5,
-3.940231, -4.566021, 2, 1, 1.5, 0.5, 0.5,
-3.940231, -4.566021, 2, 0, 1.5, 0.5, 0.5,
-3.940231, -4.566021, 4, 0, -0.5, 0.5, 0.5,
-3.940231, -4.566021, 4, 1, -0.5, 0.5, 0.5,
-3.940231, -4.566021, 4, 1, 1.5, 0.5, 0.5,
-3.940231, -4.566021, 4, 0, 1.5, 0.5, 0.5
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
-3.431698, -4.012474, -5.976778,
-3.431698, 3.368158, -5.976778,
-3.431698, -4.012474, 6.022336,
-3.431698, 3.368158, 6.022336,
-3.431698, -4.012474, -5.976778,
-3.431698, -4.012474, 6.022336,
-3.431698, 3.368158, -5.976778,
-3.431698, 3.368158, 6.022336,
-3.431698, -4.012474, -5.976778,
3.348734, -4.012474, -5.976778,
-3.431698, -4.012474, 6.022336,
3.348734, -4.012474, 6.022336,
-3.431698, 3.368158, -5.976778,
3.348734, 3.368158, -5.976778,
-3.431698, 3.368158, 6.022336,
3.348734, 3.368158, 6.022336,
3.348734, -4.012474, -5.976778,
3.348734, 3.368158, -5.976778,
3.348734, -4.012474, 6.022336,
3.348734, 3.368158, 6.022336,
3.348734, -4.012474, -5.976778,
3.348734, -4.012474, 6.022336,
3.348734, 3.368158, -5.976778,
3.348734, 3.368158, 6.022336
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
var radius = 8.348334;
var distance = 37.14268;
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
mvMatrix.translate( 0.04148197, 0.3221575, -0.02277946 );
mvMatrix.scale( 1.33124, 1.222982, 0.7522541 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.14268);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
phosphorin-2-sulfide<-read.table("phosphorin-2-sulfide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphorin-2-sulfide$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphorin' not found
```

```r
y<-phosphorin-2-sulfide$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphorin' not found
```

```r
z<-phosphorin-2-sulfide$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphorin' not found
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
-3.332954, -0.6661918, -0.728782, 0, 0, 1, 1, 1,
-2.854265, -0.3620569, -1.091191, 1, 0, 0, 1, 1,
-2.720547, -0.57527, -3.357672, 1, 0, 0, 1, 1,
-2.589723, 0.5733473, -0.7125625, 1, 0, 0, 1, 1,
-2.502486, 1.890059, -1.257976, 1, 0, 0, 1, 1,
-2.423842, 0.6598964, -1.023172, 1, 0, 0, 1, 1,
-2.387014, 0.5198067, -2.642722, 0, 0, 0, 1, 1,
-2.382759, -0.4215863, -3.016987, 0, 0, 0, 1, 1,
-2.361376, 1.222854, -1.529177, 0, 0, 0, 1, 1,
-2.348984, 0.24257, -2.075929, 0, 0, 0, 1, 1,
-2.286369, -1.006824, -0.9788254, 0, 0, 0, 1, 1,
-2.26496, 1.81596, -0.798152, 0, 0, 0, 1, 1,
-2.207486, 1.27171, -1.75955, 0, 0, 0, 1, 1,
-2.201453, -1.364941, -2.033589, 1, 1, 1, 1, 1,
-2.154503, -1.420589, -1.586066, 1, 1, 1, 1, 1,
-2.149627, -0.5535041, -1.088909, 1, 1, 1, 1, 1,
-2.124808, -0.2475044, -3.305148, 1, 1, 1, 1, 1,
-2.118352, -0.3266235, -0.6439795, 1, 1, 1, 1, 1,
-2.114779, -2.371474, -3.178298, 1, 1, 1, 1, 1,
-2.08884, 0.5598836, -3.182223, 1, 1, 1, 1, 1,
-2.077826, -0.009185047, -0.5972779, 1, 1, 1, 1, 1,
-2.041821, -1.69456, -2.184699, 1, 1, 1, 1, 1,
-2.037653, 0.1611151, -0.2157711, 1, 1, 1, 1, 1,
-2.035506, 0.194726, -1.114704, 1, 1, 1, 1, 1,
-2.034183, -0.4084815, -1.928459, 1, 1, 1, 1, 1,
-1.960029, -1.052315, -2.101985, 1, 1, 1, 1, 1,
-1.92141, 1.788548, 1.411039, 1, 1, 1, 1, 1,
-1.897291, 0.4874945, 0.2696261, 1, 1, 1, 1, 1,
-1.881852, 1.302233, -0.8675022, 0, 0, 1, 1, 1,
-1.871105, -0.6380824, -1.387346, 1, 0, 0, 1, 1,
-1.868659, 0.4223397, -0.2778127, 1, 0, 0, 1, 1,
-1.851251, 0.3592607, -1.687506, 1, 0, 0, 1, 1,
-1.845303, 0.4990967, -0.6788048, 1, 0, 0, 1, 1,
-1.838179, -0.01640224, -1.448443, 1, 0, 0, 1, 1,
-1.780663, -1.633911, -0.9610649, 0, 0, 0, 1, 1,
-1.779428, 0.4277124, -1.607201, 0, 0, 0, 1, 1,
-1.767331, 0.722374, 1.036697, 0, 0, 0, 1, 1,
-1.763261, 0.3904143, -2.987093, 0, 0, 0, 1, 1,
-1.754206, -0.07511152, -2.423091, 0, 0, 0, 1, 1,
-1.712178, 0.6103309, -0.1978638, 0, 0, 0, 1, 1,
-1.703136, 1.860903, -0.3649373, 0, 0, 0, 1, 1,
-1.698489, 0.174382, -2.10444, 1, 1, 1, 1, 1,
-1.689732, 2.312264, 0.3707149, 1, 1, 1, 1, 1,
-1.684054, 0.1222142, -1.23639, 1, 1, 1, 1, 1,
-1.681893, 1.302303, -1.701484, 1, 1, 1, 1, 1,
-1.678878, 1.480701, -1.628339, 1, 1, 1, 1, 1,
-1.665154, 1.067276, -0.8762133, 1, 1, 1, 1, 1,
-1.635265, 1.212206, -0.3979081, 1, 1, 1, 1, 1,
-1.63368, -0.9154657, -2.473235, 1, 1, 1, 1, 1,
-1.633216, -0.5287442, -2.773732, 1, 1, 1, 1, 1,
-1.618729, -0.4289377, -1.779361, 1, 1, 1, 1, 1,
-1.616406, -0.647525, -1.456636, 1, 1, 1, 1, 1,
-1.611654, -0.6341327, -0.3027534, 1, 1, 1, 1, 1,
-1.601552, -1.370441, -2.277465, 1, 1, 1, 1, 1,
-1.59581, 0.5072691, -0.1341196, 1, 1, 1, 1, 1,
-1.580931, -0.9314492, -1.597161, 1, 1, 1, 1, 1,
-1.569589, 0.5027793, -1.32339, 0, 0, 1, 1, 1,
-1.567085, -0.1517221, 0.5817403, 1, 0, 0, 1, 1,
-1.55764, 0.5464669, -2.041398, 1, 0, 0, 1, 1,
-1.553677, 2.144642, 0.6264005, 1, 0, 0, 1, 1,
-1.546955, 0.5825559, -0.7872497, 1, 0, 0, 1, 1,
-1.533138, 0.8010155, -0.9506416, 1, 0, 0, 1, 1,
-1.529973, -0.6030682, -1.880402, 0, 0, 0, 1, 1,
-1.519409, 0.1455497, -2.42269, 0, 0, 0, 1, 1,
-1.51694, -0.7515949, -2.535768, 0, 0, 0, 1, 1,
-1.509797, 0.1293485, -0.901641, 0, 0, 0, 1, 1,
-1.495217, 0.8354423, 0.12987, 0, 0, 0, 1, 1,
-1.494607, 0.3014085, -1.019785, 0, 0, 0, 1, 1,
-1.465827, 0.7718108, -1.632705, 0, 0, 0, 1, 1,
-1.461956, 0.7183306, -1.299182, 1, 1, 1, 1, 1,
-1.458342, 1.685567, -1.231689, 1, 1, 1, 1, 1,
-1.457365, -0.4571171, -1.406908, 1, 1, 1, 1, 1,
-1.453722, -0.1138085, 0.1256232, 1, 1, 1, 1, 1,
-1.435071, 0.2920069, 0.6306627, 1, 1, 1, 1, 1,
-1.423698, -0.4369748, -1.866202, 1, 1, 1, 1, 1,
-1.420441, -0.7610387, -1.772259, 1, 1, 1, 1, 1,
-1.409821, 1.825285, -0.1209304, 1, 1, 1, 1, 1,
-1.39512, 0.7166538, -1.712617, 1, 1, 1, 1, 1,
-1.389103, -0.6661897, -1.65695, 1, 1, 1, 1, 1,
-1.384682, 0.2811996, -1.715221, 1, 1, 1, 1, 1,
-1.382004, 0.2257675, 0.4568461, 1, 1, 1, 1, 1,
-1.380047, 0.8560454, 0.1767671, 1, 1, 1, 1, 1,
-1.379767, 0.3892368, -0.7162343, 1, 1, 1, 1, 1,
-1.376629, 0.3083982, -0.591535, 1, 1, 1, 1, 1,
-1.363921, 0.7489101, -0.8027027, 0, 0, 1, 1, 1,
-1.355348, -1.656639, -1.616808, 1, 0, 0, 1, 1,
-1.346204, -0.2084016, -2.795045, 1, 0, 0, 1, 1,
-1.331586, 1.618355, -0.3692642, 1, 0, 0, 1, 1,
-1.328364, -0.01757704, -0.4639904, 1, 0, 0, 1, 1,
-1.327498, -0.1938508, -1.546134, 1, 0, 0, 1, 1,
-1.323549, -0.4712786, -2.324326, 0, 0, 0, 1, 1,
-1.313144, -0.6320407, -1.449189, 0, 0, 0, 1, 1,
-1.307664, 0.8851503, -2.601726, 0, 0, 0, 1, 1,
-1.274467, -0.1160386, -1.025143, 0, 0, 0, 1, 1,
-1.273951, -0.6438431, -4.538839, 0, 0, 0, 1, 1,
-1.273066, -0.9916264, -0.886131, 0, 0, 0, 1, 1,
-1.272926, 0.7020679, -0.7869735, 0, 0, 0, 1, 1,
-1.27132, 0.2910193, 0.1156206, 1, 1, 1, 1, 1,
-1.270731, -0.3668947, -1.60225, 1, 1, 1, 1, 1,
-1.268096, 0.750777, 0.01900029, 1, 1, 1, 1, 1,
-1.26126, -1.002802, -1.465001, 1, 1, 1, 1, 1,
-1.257979, -1.311414, -2.97842, 1, 1, 1, 1, 1,
-1.251873, 0.7777594, -0.7804961, 1, 1, 1, 1, 1,
-1.250729, -0.325266, 1.201131, 1, 1, 1, 1, 1,
-1.249981, -0.4498348, -2.823339, 1, 1, 1, 1, 1,
-1.233228, 0.2073248, -2.200962, 1, 1, 1, 1, 1,
-1.23103, 1.088663, -1.122593, 1, 1, 1, 1, 1,
-1.228266, -1.829336, -1.965911, 1, 1, 1, 1, 1,
-1.219814, -0.5849577, -1.430064, 1, 1, 1, 1, 1,
-1.21805, 0.04070242, -0.4064318, 1, 1, 1, 1, 1,
-1.2147, 0.598912, -2.473856, 1, 1, 1, 1, 1,
-1.211305, 0.3429179, -2.816408, 1, 1, 1, 1, 1,
-1.189033, 0.6077271, -0.3957987, 0, 0, 1, 1, 1,
-1.186503, -0.6281332, -2.081867, 1, 0, 0, 1, 1,
-1.186284, -0.8343322, -0.7446901, 1, 0, 0, 1, 1,
-1.182185, -0.1544283, -0.5029377, 1, 0, 0, 1, 1,
-1.179963, 0.3362298, -0.7778631, 1, 0, 0, 1, 1,
-1.1798, 2.099631, 1.284368, 1, 0, 0, 1, 1,
-1.174165, 1.185129, -0.2633004, 0, 0, 0, 1, 1,
-1.171406, 1.836107, 0.9403952, 0, 0, 0, 1, 1,
-1.164922, 1.503985, 1.023441, 0, 0, 0, 1, 1,
-1.158892, -1.960886, -3.725885, 0, 0, 0, 1, 1,
-1.153721, -0.6547777, -1.616067, 0, 0, 0, 1, 1,
-1.151188, -1.061122, -0.2359018, 0, 0, 0, 1, 1,
-1.145076, 0.7433945, -0.7158, 0, 0, 0, 1, 1,
-1.141773, -1.832468, -3.319649, 1, 1, 1, 1, 1,
-1.137537, -0.4204687, -2.166633, 1, 1, 1, 1, 1,
-1.136426, -0.3938486, -1.1024, 1, 1, 1, 1, 1,
-1.134209, -0.1590154, -4.158586, 1, 1, 1, 1, 1,
-1.133869, 0.5688397, -2.347867, 1, 1, 1, 1, 1,
-1.131015, -1.086683, -1.882775, 1, 1, 1, 1, 1,
-1.130013, 0.3930561, -1.97269, 1, 1, 1, 1, 1,
-1.121639, 0.8295845, 0.1670423, 1, 1, 1, 1, 1,
-1.119723, 0.1618054, -2.109196, 1, 1, 1, 1, 1,
-1.115034, 0.3965845, -3.296497, 1, 1, 1, 1, 1,
-1.10999, 0.01649728, -1.148375, 1, 1, 1, 1, 1,
-1.109874, -0.07677394, -1.160857, 1, 1, 1, 1, 1,
-1.108452, 0.6530586, -2.162196, 1, 1, 1, 1, 1,
-1.099916, -0.2040814, -2.829832, 1, 1, 1, 1, 1,
-1.080789, -0.4076118, -1.518476, 1, 1, 1, 1, 1,
-1.079581, 1.328196, -0.3707117, 0, 0, 1, 1, 1,
-1.078844, -0.7900468, -1.15558, 1, 0, 0, 1, 1,
-1.073876, 3.002584, 1.136084, 1, 0, 0, 1, 1,
-1.072886, -0.8040223, -0.1212876, 1, 0, 0, 1, 1,
-1.072567, -1.109179, -1.343793, 1, 0, 0, 1, 1,
-1.07036, 0.2252296, -0.06517207, 1, 0, 0, 1, 1,
-1.070031, -0.2407671, -0.8419968, 0, 0, 0, 1, 1,
-1.06374, 0.1810874, 0.2610137, 0, 0, 0, 1, 1,
-1.062837, -0.07165942, -2.885845, 0, 0, 0, 1, 1,
-1.05344, 0.05146414, -1.908359, 0, 0, 0, 1, 1,
-1.050075, -0.7417926, -1.493674, 0, 0, 0, 1, 1,
-1.047852, 1.991015, 0.8478341, 0, 0, 0, 1, 1,
-1.046834, -1.493069, -3.616653, 0, 0, 0, 1, 1,
-1.0468, 0.3304653, -0.9954166, 1, 1, 1, 1, 1,
-1.045621, 0.5676904, -0.7729312, 1, 1, 1, 1, 1,
-1.040869, -0.7068816, -1.792249, 1, 1, 1, 1, 1,
-1.040519, 0.6708612, -1.25554, 1, 1, 1, 1, 1,
-1.035363, 0.525659, -2.388146, 1, 1, 1, 1, 1,
-1.03487, 0.4262262, -0.858205, 1, 1, 1, 1, 1,
-1.032687, -0.7832341, -1.349358, 1, 1, 1, 1, 1,
-1.032533, -0.2583232, -0.4328833, 1, 1, 1, 1, 1,
-1.031024, 0.6107022, -0.2352621, 1, 1, 1, 1, 1,
-1.028465, -1.221644, -2.246615, 1, 1, 1, 1, 1,
-1.019883, 2.092015, -2.106595, 1, 1, 1, 1, 1,
-1.012993, 2.122406, 0.7860996, 1, 1, 1, 1, 1,
-1.010215, 0.7522284, -0.7397476, 1, 1, 1, 1, 1,
-1.010156, 1.6615, 0.0008288362, 1, 1, 1, 1, 1,
-1.005617, -0.7409003, -1.930756, 1, 1, 1, 1, 1,
-1.004417, -0.9427245, -2.473772, 0, 0, 1, 1, 1,
-0.9996424, 0.989117, -1.388413, 1, 0, 0, 1, 1,
-0.9957207, -0.6195998, -3.664589, 1, 0, 0, 1, 1,
-0.9865944, 0.4075391, -2.131262, 1, 0, 0, 1, 1,
-0.9804595, 1.331089, -1.14523, 1, 0, 0, 1, 1,
-0.9799465, -2.038015, -2.521625, 1, 0, 0, 1, 1,
-0.9788572, -0.1143634, -2.049793, 0, 0, 0, 1, 1,
-0.9768691, 1.02725, -1.689655, 0, 0, 0, 1, 1,
-0.9742632, 1.388469, -0.281691, 0, 0, 0, 1, 1,
-0.9699516, 0.8662196, 0.07838877, 0, 0, 0, 1, 1,
-0.9641024, -0.9879561, -2.424387, 0, 0, 0, 1, 1,
-0.9639492, 0.1835412, -1.291106, 0, 0, 0, 1, 1,
-0.959504, 1.230767, -1.395243, 0, 0, 0, 1, 1,
-0.9576762, -0.5520269, -1.843771, 1, 1, 1, 1, 1,
-0.94885, -0.4657556, -0.7001567, 1, 1, 1, 1, 1,
-0.9487832, -0.09258312, -3.827075, 1, 1, 1, 1, 1,
-0.946633, -0.3774872, -2.777468, 1, 1, 1, 1, 1,
-0.9448932, -1.218539, -2.946927, 1, 1, 1, 1, 1,
-0.9409375, -2.127408, -3.030967, 1, 1, 1, 1, 1,
-0.940477, 0.4967024, -0.182035, 1, 1, 1, 1, 1,
-0.9365459, 0.521304, -2.904064, 1, 1, 1, 1, 1,
-0.9151449, -0.1264558, -1.364711, 1, 1, 1, 1, 1,
-0.9123909, -0.3052984, -4.17294, 1, 1, 1, 1, 1,
-0.9117862, -1.098804, -1.135185, 1, 1, 1, 1, 1,
-0.9112793, -0.4698894, -1.472653, 1, 1, 1, 1, 1,
-0.9093527, 2.049091, 0.3048375, 1, 1, 1, 1, 1,
-0.8990276, 0.3928022, -1.521276, 1, 1, 1, 1, 1,
-0.8977815, -1.080975, -2.267639, 1, 1, 1, 1, 1,
-0.8973245, -0.7264994, -2.467875, 0, 0, 1, 1, 1,
-0.8945885, -1.16663, -1.123403, 1, 0, 0, 1, 1,
-0.8921732, 0.2797476, 0.1052442, 1, 0, 0, 1, 1,
-0.8912573, -0.1407428, -1.284817, 1, 0, 0, 1, 1,
-0.8884923, 0.05377767, -0.9030294, 1, 0, 0, 1, 1,
-0.8883247, -1.686234, -2.160556, 1, 0, 0, 1, 1,
-0.887792, 1.021906, 1.297932, 0, 0, 0, 1, 1,
-0.8875454, -0.9837024, -3.028977, 0, 0, 0, 1, 1,
-0.8851643, -1.362559, 0.265313, 0, 0, 0, 1, 1,
-0.8809661, 1.148623, -0.211192, 0, 0, 0, 1, 1,
-0.8767514, 1.829786, 1.158079, 0, 0, 0, 1, 1,
-0.8759142, -0.9601918, -1.391156, 0, 0, 0, 1, 1,
-0.8758472, -1.409643, -2.491491, 0, 0, 0, 1, 1,
-0.8751311, 0.5646957, -0.9391177, 1, 1, 1, 1, 1,
-0.8716268, 0.2718905, 0.1330705, 1, 1, 1, 1, 1,
-0.8700762, -0.02768875, -2.570044, 1, 1, 1, 1, 1,
-0.8669927, -1.179929, -2.823735, 1, 1, 1, 1, 1,
-0.8656376, -0.4639774, -3.320368, 1, 1, 1, 1, 1,
-0.8642812, 0.8553727, -1.128897, 1, 1, 1, 1, 1,
-0.8609031, -0.1123505, -3.199578, 1, 1, 1, 1, 1,
-0.8559006, -0.6859362, -5.301189, 1, 1, 1, 1, 1,
-0.854402, 1.415987, -1.590639, 1, 1, 1, 1, 1,
-0.8530817, -0.3580637, -1.778507, 1, 1, 1, 1, 1,
-0.8435699, 0.6563021, 0.7842464, 1, 1, 1, 1, 1,
-0.8362082, 1.329165, 1.067387, 1, 1, 1, 1, 1,
-0.8349988, 0.3762501, -1.235049, 1, 1, 1, 1, 1,
-0.8325525, 0.6206416, -0.3331883, 1, 1, 1, 1, 1,
-0.8291615, -0.3550065, -3.648651, 1, 1, 1, 1, 1,
-0.8284109, -0.413459, -1.339013, 0, 0, 1, 1, 1,
-0.823523, 0.5467654, -1.752062, 1, 0, 0, 1, 1,
-0.8214743, -1.016372, -0.4635955, 1, 0, 0, 1, 1,
-0.8202519, -0.2368865, -2.245973, 1, 0, 0, 1, 1,
-0.8080342, -2.031216, -2.300952, 1, 0, 0, 1, 1,
-0.804965, 1.309929, 0.003791909, 1, 0, 0, 1, 1,
-0.8038169, -0.7104726, -3.563538, 0, 0, 0, 1, 1,
-0.8001841, 1.080495, 1.348375, 0, 0, 0, 1, 1,
-0.7982574, 1.555928, -1.288781, 0, 0, 0, 1, 1,
-0.7943645, 1.360924, -0.9042897, 0, 0, 0, 1, 1,
-0.7932451, 1.071776, -2.230286, 0, 0, 0, 1, 1,
-0.7922281, 0.9081475, -3.025524, 0, 0, 0, 1, 1,
-0.7853163, -0.416135, -1.317097, 0, 0, 0, 1, 1,
-0.7836533, 0.5217615, -0.2822209, 1, 1, 1, 1, 1,
-0.7817428, -2.545078, -2.461646, 1, 1, 1, 1, 1,
-0.7795042, -0.1933049, -2.196017, 1, 1, 1, 1, 1,
-0.7754606, 0.6091056, -0.4050705, 1, 1, 1, 1, 1,
-0.7744222, -1.682983, -1.696756, 1, 1, 1, 1, 1,
-0.7691196, -0.5411109, -1.953281, 1, 1, 1, 1, 1,
-0.7672722, 0.8105722, -0.241479, 1, 1, 1, 1, 1,
-0.7628944, -0.3946888, -3.009551, 1, 1, 1, 1, 1,
-0.762471, -0.5681683, -1.829675, 1, 1, 1, 1, 1,
-0.7595441, -0.8041032, -2.56501, 1, 1, 1, 1, 1,
-0.7567138, -0.5351005, -3.189571, 1, 1, 1, 1, 1,
-0.7552094, 0.6218032, -1.837313, 1, 1, 1, 1, 1,
-0.7429689, 1.274638, 0.7079003, 1, 1, 1, 1, 1,
-0.7419424, -1.181849, -2.68256, 1, 1, 1, 1, 1,
-0.7393564, 1.004596, -0.3201893, 1, 1, 1, 1, 1,
-0.732158, -0.573691, -1.501571, 0, 0, 1, 1, 1,
-0.730453, 0.2124374, -0.5624343, 1, 0, 0, 1, 1,
-0.7299644, -0.7115541, -1.212585, 1, 0, 0, 1, 1,
-0.7294663, -0.1525263, -1.553839, 1, 0, 0, 1, 1,
-0.7281817, -0.8062137, -1.145498, 1, 0, 0, 1, 1,
-0.7261067, 0.4044736, -1.902279, 1, 0, 0, 1, 1,
-0.721497, 0.7105636, -1.054288, 0, 0, 0, 1, 1,
-0.7204511, -0.6074997, -1.113728, 0, 0, 0, 1, 1,
-0.7188935, 1.194595, -0.2048022, 0, 0, 0, 1, 1,
-0.7183066, 1.43283, -0.9974693, 0, 0, 0, 1, 1,
-0.7164567, -0.05148041, -0.9542111, 0, 0, 0, 1, 1,
-0.7162193, -0.6213363, -2.753537, 0, 0, 0, 1, 1,
-0.7140324, 1.045673, -0.2882272, 0, 0, 0, 1, 1,
-0.7133183, 0.05551996, -2.609311, 1, 1, 1, 1, 1,
-0.7101839, -0.1380252, -2.334565, 1, 1, 1, 1, 1,
-0.7093624, 0.7496924, -1.712461, 1, 1, 1, 1, 1,
-0.7079386, 1.428748, 0.8237045, 1, 1, 1, 1, 1,
-0.707429, 2.792375, -1.366056, 1, 1, 1, 1, 1,
-0.7027609, -1.785997, -3.640179, 1, 1, 1, 1, 1,
-0.6994154, 1.982595, -0.9004124, 1, 1, 1, 1, 1,
-0.6978469, 1.019634, -0.7050648, 1, 1, 1, 1, 1,
-0.6949269, -1.303276, -4.464316, 1, 1, 1, 1, 1,
-0.6879367, -0.2318175, -0.2930677, 1, 1, 1, 1, 1,
-0.6860334, -1.715363, -3.922634, 1, 1, 1, 1, 1,
-0.6831269, 0.5136957, -0.3963154, 1, 1, 1, 1, 1,
-0.6766359, -0.7215518, -3.190415, 1, 1, 1, 1, 1,
-0.675652, 0.3525319, -0.7920042, 1, 1, 1, 1, 1,
-0.6720855, -0.6893994, -2.933942, 1, 1, 1, 1, 1,
-0.6603731, 0.2892738, -1.941171, 0, 0, 1, 1, 1,
-0.6582347, -0.06796636, -1.188917, 1, 0, 0, 1, 1,
-0.6556215, 2.307971, -0.4571233, 1, 0, 0, 1, 1,
-0.6501257, 1.029912, -0.2592732, 1, 0, 0, 1, 1,
-0.6389498, 0.8657966, 0.8353109, 1, 0, 0, 1, 1,
-0.6385249, 0.5131813, -1.950443, 1, 0, 0, 1, 1,
-0.6378595, 1.163913, -0.8815272, 0, 0, 0, 1, 1,
-0.6370605, 0.1737242, -1.117628, 0, 0, 0, 1, 1,
-0.6310816, -1.056566, -2.670606, 0, 0, 0, 1, 1,
-0.6309229, 0.3742182, -1.915024, 0, 0, 0, 1, 1,
-0.6228654, 0.8592884, -1.080685, 0, 0, 0, 1, 1,
-0.6225328, -0.876327, -2.522483, 0, 0, 0, 1, 1,
-0.6189264, 0.9481115, 0.05890737, 0, 0, 0, 1, 1,
-0.6164083, 1.443858, -1.335885, 1, 1, 1, 1, 1,
-0.6136461, -0.6284121, -1.484164, 1, 1, 1, 1, 1,
-0.6020585, 1.212579, -0.1948553, 1, 1, 1, 1, 1,
-0.5972097, -0.02003245, 0.3714258, 1, 1, 1, 1, 1,
-0.5969685, 0.4822724, -0.8378831, 1, 1, 1, 1, 1,
-0.5956606, -0.7972823, -2.675809, 1, 1, 1, 1, 1,
-0.5943798, 0.5195347, 0.2341086, 1, 1, 1, 1, 1,
-0.5941522, -0.532032, -1.754945, 1, 1, 1, 1, 1,
-0.5935182, 0.6118212, -1.115855, 1, 1, 1, 1, 1,
-0.592771, -0.6438444, -0.6905954, 1, 1, 1, 1, 1,
-0.5896181, -0.5924542, -2.908744, 1, 1, 1, 1, 1,
-0.5884358, -0.6164756, -3.297169, 1, 1, 1, 1, 1,
-0.579242, 0.4452931, -1.546805, 1, 1, 1, 1, 1,
-0.5770417, -0.9279467, -2.571676, 1, 1, 1, 1, 1,
-0.5768191, -0.7237912, -1.53562, 1, 1, 1, 1, 1,
-0.5750428, 0.4245358, -1.395359, 0, 0, 1, 1, 1,
-0.5710387, -0.8940259, -1.415251, 1, 0, 0, 1, 1,
-0.559373, 0.05803246, -2.947521, 1, 0, 0, 1, 1,
-0.5515065, 0.5623458, -1.216739, 1, 0, 0, 1, 1,
-0.5497062, 0.0729999, -1.4986, 1, 0, 0, 1, 1,
-0.5495029, 0.3422916, -0.4180764, 1, 0, 0, 1, 1,
-0.5493556, -0.9429572, -2.626461, 0, 0, 0, 1, 1,
-0.5482674, -0.08141126, -0.4392792, 0, 0, 0, 1, 1,
-0.5465854, 0.6591676, -1.71421, 0, 0, 0, 1, 1,
-0.5454718, -1.643723, -1.682374, 0, 0, 0, 1, 1,
-0.5405118, -0.2087347, 0.06231933, 0, 0, 0, 1, 1,
-0.5372995, -0.0398759, -0.8205011, 0, 0, 0, 1, 1,
-0.5371383, -1.563253, -2.689586, 0, 0, 0, 1, 1,
-0.5368643, 0.8366995, -1.32658, 1, 1, 1, 1, 1,
-0.5364157, -0.2744747, -2.596508, 1, 1, 1, 1, 1,
-0.5345529, 1.079158, -1.094352, 1, 1, 1, 1, 1,
-0.5325884, -0.8116105, -3.911138, 1, 1, 1, 1, 1,
-0.5203311, -0.3908942, -3.584291, 1, 1, 1, 1, 1,
-0.5201324, 0.05676949, -0.2956231, 1, 1, 1, 1, 1,
-0.5193767, 0.8359146, -0.5010916, 1, 1, 1, 1, 1,
-0.5191187, 1.397601, 0.9652222, 1, 1, 1, 1, 1,
-0.5153905, 0.2078282, -1.726617, 1, 1, 1, 1, 1,
-0.5062134, -0.4290482, -1.971256, 1, 1, 1, 1, 1,
-0.5024974, -0.6029508, -3.523218, 1, 1, 1, 1, 1,
-0.5001377, -0.2305983, -1.973357, 1, 1, 1, 1, 1,
-0.4998471, -0.3791145, -2.278394, 1, 1, 1, 1, 1,
-0.4989058, 0.3496941, -1.959513, 1, 1, 1, 1, 1,
-0.4936348, -1.932451, -4.435979, 1, 1, 1, 1, 1,
-0.4923611, -0.1583024, -2.695837, 0, 0, 1, 1, 1,
-0.4891362, 0.4557978, 1.116553, 1, 0, 0, 1, 1,
-0.4851882, 1.717694, 0.1199615, 1, 0, 0, 1, 1,
-0.4832215, 1.275414, -0.8000638, 1, 0, 0, 1, 1,
-0.4821434, 0.7076389, -1.038942, 1, 0, 0, 1, 1,
-0.4803452, -0.2342684, -1.886056, 1, 0, 0, 1, 1,
-0.4796826, -0.07792668, -0.8798535, 0, 0, 0, 1, 1,
-0.4779497, 0.7822635, -0.2578207, 0, 0, 0, 1, 1,
-0.4702216, 0.8332882, 0.02313278, 0, 0, 0, 1, 1,
-0.4650131, -1.059605, -5.802033, 0, 0, 0, 1, 1,
-0.4582297, 2.049847, 0.6030178, 0, 0, 0, 1, 1,
-0.4575218, 1.19407, -0.3476264, 0, 0, 0, 1, 1,
-0.4536735, 0.8391796, 0.1716893, 0, 0, 0, 1, 1,
-0.4479399, 2.90447, -1.198321, 1, 1, 1, 1, 1,
-0.4459452, 1.038846, -1.616703, 1, 1, 1, 1, 1,
-0.4437214, 1.791464, 0.5378323, 1, 1, 1, 1, 1,
-0.439329, -0.1884971, -2.215786, 1, 1, 1, 1, 1,
-0.4278937, 0.5746248, 0.6670758, 1, 1, 1, 1, 1,
-0.427007, -0.1126839, -1.200689, 1, 1, 1, 1, 1,
-0.4223105, -0.553113, -3.046216, 1, 1, 1, 1, 1,
-0.4161014, -0.03491266, 0.06331265, 1, 1, 1, 1, 1,
-0.4142172, 0.970817, -1.103859, 1, 1, 1, 1, 1,
-0.4140979, 1.012047, -1.898225, 1, 1, 1, 1, 1,
-0.4138814, 2.58705, -0.3138146, 1, 1, 1, 1, 1,
-0.4083666, -2.007059, -3.406362, 1, 1, 1, 1, 1,
-0.4065031, -1.450328, -2.90462, 1, 1, 1, 1, 1,
-0.404101, 1.765925, 0.9933534, 1, 1, 1, 1, 1,
-0.4017671, -1.029632, -3.923482, 1, 1, 1, 1, 1,
-0.4006213, 2.38632, 0.8823683, 0, 0, 1, 1, 1,
-0.396583, 1.661958, 0.1096309, 1, 0, 0, 1, 1,
-0.3958442, 0.2698236, 0.2641808, 1, 0, 0, 1, 1,
-0.3947929, -1.198876, -2.226875, 1, 0, 0, 1, 1,
-0.3935874, -0.267785, -2.080876, 1, 0, 0, 1, 1,
-0.3929121, -0.7568605, -1.952162, 1, 0, 0, 1, 1,
-0.3894475, -0.05353981, -2.578126, 0, 0, 0, 1, 1,
-0.3871362, -0.006308246, -2.283425, 0, 0, 0, 1, 1,
-0.3869447, -0.00546389, -2.013397, 0, 0, 0, 1, 1,
-0.3859846, -0.0558628, -2.494828, 0, 0, 0, 1, 1,
-0.3851596, -0.009802258, -1.111361, 0, 0, 0, 1, 1,
-0.3847203, -0.8946653, -2.959308, 0, 0, 0, 1, 1,
-0.3799584, -1.508936, -2.334364, 0, 0, 0, 1, 1,
-0.378232, 0.4038111, -2.001396, 1, 1, 1, 1, 1,
-0.3763968, 0.1619438, -2.163967, 1, 1, 1, 1, 1,
-0.374141, -0.9234071, -1.246154, 1, 1, 1, 1, 1,
-0.3569712, 0.4991658, -0.7522829, 1, 1, 1, 1, 1,
-0.3533212, 1.770046, 0.5610682, 1, 1, 1, 1, 1,
-0.3505059, 0.3608391, 0.2591276, 1, 1, 1, 1, 1,
-0.34492, 0.1477273, 0.1487544, 1, 1, 1, 1, 1,
-0.3313287, 2.722848, -0.8210546, 1, 1, 1, 1, 1,
-0.3281528, 0.685386, -1.731238, 1, 1, 1, 1, 1,
-0.3280795, -1.190379, -1.74004, 1, 1, 1, 1, 1,
-0.3245755, 0.5733193, -1.214879, 1, 1, 1, 1, 1,
-0.3227065, 0.4550761, -1.474765, 1, 1, 1, 1, 1,
-0.3206551, -0.6866468, -1.611996, 1, 1, 1, 1, 1,
-0.3190626, -0.03524016, -2.240905, 1, 1, 1, 1, 1,
-0.3183047, -0.7682506, -1.317935, 1, 1, 1, 1, 1,
-0.3163983, 0.1475238, -0.4299988, 0, 0, 1, 1, 1,
-0.3141361, -0.0127237, -1.537516, 1, 0, 0, 1, 1,
-0.3099794, 0.07243619, -0.08149121, 1, 0, 0, 1, 1,
-0.3059239, -0.8399222, -2.638176, 1, 0, 0, 1, 1,
-0.3048605, -0.9919231, -2.138459, 1, 0, 0, 1, 1,
-0.302149, -1.155359, -2.531971, 1, 0, 0, 1, 1,
-0.2981297, -0.3135429, -1.517269, 0, 0, 0, 1, 1,
-0.2895287, 0.9295197, -0.3752311, 0, 0, 0, 1, 1,
-0.2817911, -0.4870527, -2.380062, 0, 0, 0, 1, 1,
-0.281103, -1.931982, -2.825597, 0, 0, 0, 1, 1,
-0.279622, -0.9214987, -2.072318, 0, 0, 0, 1, 1,
-0.2773651, 0.2832506, -1.738351, 0, 0, 0, 1, 1,
-0.2755207, 0.914966, -0.8284438, 0, 0, 0, 1, 1,
-0.2731189, 0.1438437, -0.5930874, 1, 1, 1, 1, 1,
-0.2727144, 0.1393142, 1.176828, 1, 1, 1, 1, 1,
-0.27228, -0.8670526, -3.839136, 1, 1, 1, 1, 1,
-0.2691768, 0.06349882, -0.4967734, 1, 1, 1, 1, 1,
-0.2633852, 0.2587441, -0.9758251, 1, 1, 1, 1, 1,
-0.2603213, -0.533074, -3.014509, 1, 1, 1, 1, 1,
-0.2583627, -0.006322816, -1.337458, 1, 1, 1, 1, 1,
-0.2569492, 0.4027188, -0.5859033, 1, 1, 1, 1, 1,
-0.255412, -0.3614484, -3.633403, 1, 1, 1, 1, 1,
-0.2524348, 0.7069477, -0.9238313, 1, 1, 1, 1, 1,
-0.2523908, -2.572979, -2.216024, 1, 1, 1, 1, 1,
-0.2498366, -0.5368655, -2.394766, 1, 1, 1, 1, 1,
-0.2484009, 0.009914899, -4.473952, 1, 1, 1, 1, 1,
-0.2481565, 0.8623228, -1.490972, 1, 1, 1, 1, 1,
-0.2443947, 1.049929, -0.6025232, 1, 1, 1, 1, 1,
-0.2423334, 0.1276926, -0.5705637, 0, 0, 1, 1, 1,
-0.241494, 0.1874066, -1.981841, 1, 0, 0, 1, 1,
-0.2342485, -1.764145, -4.661576, 1, 0, 0, 1, 1,
-0.2324658, 2.137121, -0.3602364, 1, 0, 0, 1, 1,
-0.2222657, -2.193354, -1.241254, 1, 0, 0, 1, 1,
-0.2180484, -0.6444653, -0.5936894, 1, 0, 0, 1, 1,
-0.2175656, 1.544169, 0.6318326, 0, 0, 0, 1, 1,
-0.2116826, -0.7435061, -0.6084573, 0, 0, 0, 1, 1,
-0.2102449, 0.6788177, -1.139634, 0, 0, 0, 1, 1,
-0.209211, -0.7032841, -1.294515, 0, 0, 0, 1, 1,
-0.2085904, 0.6686068, 0.01302961, 0, 0, 0, 1, 1,
-0.2064956, -1.396363, -2.443908, 0, 0, 0, 1, 1,
-0.2034452, 0.2643726, 0.5319724, 0, 0, 0, 1, 1,
-0.2010161, 0.2581472, -0.3934769, 1, 1, 1, 1, 1,
-0.1995092, 1.004296, 0.3080074, 1, 1, 1, 1, 1,
-0.1983508, -1.338492, -3.027605, 1, 1, 1, 1, 1,
-0.1970109, -0.8898771, -2.594265, 1, 1, 1, 1, 1,
-0.1934755, 1.333663, 0.581827, 1, 1, 1, 1, 1,
-0.1913503, -0.5361795, -2.349236, 1, 1, 1, 1, 1,
-0.1845028, 0.04784248, -0.1999921, 1, 1, 1, 1, 1,
-0.1830676, 0.04214429, -0.7871462, 1, 1, 1, 1, 1,
-0.1813777, 1.159465, 0.06915138, 1, 1, 1, 1, 1,
-0.1811729, -0.8979692, -2.237321, 1, 1, 1, 1, 1,
-0.1811722, -0.8169684, -2.351956, 1, 1, 1, 1, 1,
-0.1788666, -0.02915647, -2.432333, 1, 1, 1, 1, 1,
-0.1763022, 0.6878741, -0.01432447, 1, 1, 1, 1, 1,
-0.1735887, 0.2846012, -1.283553, 1, 1, 1, 1, 1,
-0.170285, -0.3362313, -1.878259, 1, 1, 1, 1, 1,
-0.1685442, -0.5987942, -2.655112, 0, 0, 1, 1, 1,
-0.1635201, 1.159661, -0.2684766, 1, 0, 0, 1, 1,
-0.1588176, -0.2110881, -1.772457, 1, 0, 0, 1, 1,
-0.1574533, -0.4352881, -4.626379, 1, 0, 0, 1, 1,
-0.1548226, -0.4186702, -1.958194, 1, 0, 0, 1, 1,
-0.153695, 0.158182, -0.6133925, 1, 0, 0, 1, 1,
-0.1524396, -2.594054, -3.892905, 0, 0, 0, 1, 1,
-0.1517319, 1.184452, -1.491797, 0, 0, 0, 1, 1,
-0.1465693, 0.03271389, -0.6553931, 0, 0, 0, 1, 1,
-0.1448931, 0.1081065, -1.270283, 0, 0, 0, 1, 1,
-0.1441903, 1.736099, 0.756896, 0, 0, 0, 1, 1,
-0.1440333, 0.9187324, 2.445662, 0, 0, 0, 1, 1,
-0.1405442, -0.06939009, -2.394368, 0, 0, 0, 1, 1,
-0.1390164, -0.9783342, -3.05474, 1, 1, 1, 1, 1,
-0.1381517, -0.9232697, -4.753063, 1, 1, 1, 1, 1,
-0.1360043, 1.183751, -0.6692208, 1, 1, 1, 1, 1,
-0.1329056, -0.3131232, -2.670633, 1, 1, 1, 1, 1,
-0.1298767, 1.316895, -0.5958802, 1, 1, 1, 1, 1,
-0.1298144, -0.4431623, -3.366725, 1, 1, 1, 1, 1,
-0.1263096, -0.3946734, -3.318889, 1, 1, 1, 1, 1,
-0.1250951, 1.016189, -1.297745, 1, 1, 1, 1, 1,
-0.1250599, 0.6649534, -0.2454408, 1, 1, 1, 1, 1,
-0.1248487, -1.359539, -3.352712, 1, 1, 1, 1, 1,
-0.12436, -0.156622, -3.970427, 1, 1, 1, 1, 1,
-0.1209481, -0.04095007, -0.9878892, 1, 1, 1, 1, 1,
-0.119557, -0.524602, -3.763129, 1, 1, 1, 1, 1,
-0.119271, -1.060436, -2.966552, 1, 1, 1, 1, 1,
-0.1065109, -0.9686356, -5.207329, 1, 1, 1, 1, 1,
-0.1054711, -0.5681252, -3.107646, 0, 0, 1, 1, 1,
-0.1015638, 0.5310654, -0.2664822, 1, 0, 0, 1, 1,
-0.09973616, -1.297476, -3.428872, 1, 0, 0, 1, 1,
-0.0981935, -0.3525408, -1.971438, 1, 0, 0, 1, 1,
-0.09746155, 0.06560384, -0.7824697, 1, 0, 0, 1, 1,
-0.09614075, 1.306457, 0.1240596, 1, 0, 0, 1, 1,
-0.09454075, 0.2123538, -0.4143018, 0, 0, 0, 1, 1,
-0.0937448, 0.7235368, -0.8422868, 0, 0, 0, 1, 1,
-0.09366734, 0.4073393, 0.4048585, 0, 0, 0, 1, 1,
-0.09065234, 0.5206411, -0.6471819, 0, 0, 0, 1, 1,
-0.08907164, 0.1515246, -0.6825274, 0, 0, 0, 1, 1,
-0.08813477, 0.2617128, 0.5343702, 0, 0, 0, 1, 1,
-0.08729819, -0.4343807, -2.258977, 0, 0, 0, 1, 1,
-0.08361063, -0.8438044, -3.925926, 1, 1, 1, 1, 1,
-0.07866716, 1.965211, -0.8445883, 1, 1, 1, 1, 1,
-0.07198627, -0.6670683, -4.982779, 1, 1, 1, 1, 1,
-0.07147603, -0.03833375, -2.981638, 1, 1, 1, 1, 1,
-0.07039606, 0.1461073, 0.3161412, 1, 1, 1, 1, 1,
-0.07026092, 1.774883, -0.6512824, 1, 1, 1, 1, 1,
-0.06490745, -0.6801461, -3.261362, 1, 1, 1, 1, 1,
-0.05660395, -0.3746413, -3.062517, 1, 1, 1, 1, 1,
-0.05411773, -1.697371, -2.665588, 1, 1, 1, 1, 1,
-0.05385794, -0.02256282, -0.5989238, 1, 1, 1, 1, 1,
-0.05084501, 0.5416744, 0.6147801, 1, 1, 1, 1, 1,
-0.04658331, -0.9703751, -1.364582, 1, 1, 1, 1, 1,
-0.04608198, 0.8280106, -1.1671, 1, 1, 1, 1, 1,
-0.04182885, -0.1806979, -3.994082, 1, 1, 1, 1, 1,
-0.0379391, 0.8601421, -0.1597451, 1, 1, 1, 1, 1,
-0.0354817, -0.8421751, -4.713771, 0, 0, 1, 1, 1,
-0.03359435, -0.7252999, -2.562192, 1, 0, 0, 1, 1,
-0.03217907, -2.124522, -2.737661, 1, 0, 0, 1, 1,
-0.02422517, 0.9607671, 0.5340089, 1, 0, 0, 1, 1,
-0.02091661, 1.596794, -0.3025811, 1, 0, 0, 1, 1,
-0.01940465, 0.2148471, 0.8578709, 1, 0, 0, 1, 1,
-0.01718832, -0.2755952, -4.172463, 0, 0, 0, 1, 1,
-0.01149385, 1.47927, -0.6676747, 0, 0, 0, 1, 1,
-0.01134539, 1.914503, -0.2094584, 0, 0, 0, 1, 1,
-0.01032448, -0.4725398, -2.110581, 0, 0, 0, 1, 1,
-0.01017708, -2.203924, -2.650345, 0, 0, 0, 1, 1,
-0.007833719, 0.5417508, -0.2914666, 0, 0, 0, 1, 1,
-0.003632391, -0.5136926, -2.473455, 0, 0, 0, 1, 1,
-0.003622085, 0.03442936, 1.532078, 1, 1, 1, 1, 1,
-0.003454758, -0.8409498, -3.298335, 1, 1, 1, 1, 1,
-0.002693997, 0.05266944, -2.482035, 1, 1, 1, 1, 1,
-0.0001412514, 0.935538, -0.6031417, 1, 1, 1, 1, 1,
0.002627345, -1.350668, 2.817582, 1, 1, 1, 1, 1,
0.008809403, -0.1409545, 5.847592, 1, 1, 1, 1, 1,
0.009076174, 1.196821, 1.532413, 1, 1, 1, 1, 1,
0.009434273, -1.433417, 1.109999, 1, 1, 1, 1, 1,
0.01335507, 0.2660342, -0.1635439, 1, 1, 1, 1, 1,
0.01563196, -0.0884486, 4.686288, 1, 1, 1, 1, 1,
0.01567068, -1.527503, 3.914613, 1, 1, 1, 1, 1,
0.02164362, -0.9437814, 0.8557087, 1, 1, 1, 1, 1,
0.02171151, 1.383915, 1.291188, 1, 1, 1, 1, 1,
0.0221235, 0.5687453, -1.320753, 1, 1, 1, 1, 1,
0.02529035, 0.4873691, 0.942872, 1, 1, 1, 1, 1,
0.02575555, -0.5037735, 3.255911, 0, 0, 1, 1, 1,
0.02890996, 0.1736, -1.100675, 1, 0, 0, 1, 1,
0.03074433, 0.4613378, -1.56379, 1, 0, 0, 1, 1,
0.03098481, 0.8335779, 1.161062, 1, 0, 0, 1, 1,
0.03245761, 0.6655039, -1.464345, 1, 0, 0, 1, 1,
0.03625369, -0.7545978, 3.677559, 1, 0, 0, 1, 1,
0.036263, -0.5661557, 2.537869, 0, 0, 0, 1, 1,
0.03846713, 0.930435, -1.592411, 0, 0, 0, 1, 1,
0.04248442, 0.1047342, -1.269946, 0, 0, 0, 1, 1,
0.04567013, -0.907118, 3.225847, 0, 0, 0, 1, 1,
0.04928767, -0.50169, 3.78586, 0, 0, 0, 1, 1,
0.05251609, -0.6165884, 2.86725, 0, 0, 0, 1, 1,
0.05362889, 1.157061, 0.2333522, 0, 0, 0, 1, 1,
0.05404065, 1.511936, -0.9429906, 1, 1, 1, 1, 1,
0.05693278, -0.4464597, 1.698503, 1, 1, 1, 1, 1,
0.06296806, 0.691795, -0.1133834, 1, 1, 1, 1, 1,
0.06452105, -1.20023, 3.509046, 1, 1, 1, 1, 1,
0.06502549, -1.344712, 3.684367, 1, 1, 1, 1, 1,
0.06583271, 0.6045547, 0.4545746, 1, 1, 1, 1, 1,
0.06914075, -0.4345968, 4.501172, 1, 1, 1, 1, 1,
0.07167131, 1.264787, 1.116754, 1, 1, 1, 1, 1,
0.07242387, -1.156134, 4.156899, 1, 1, 1, 1, 1,
0.07548503, 1.013781, -0.3602709, 1, 1, 1, 1, 1,
0.07802111, -0.5258924, 2.58738, 1, 1, 1, 1, 1,
0.07996394, -0.3593297, 2.262557, 1, 1, 1, 1, 1,
0.08233087, 1.701676, -1.850809, 1, 1, 1, 1, 1,
0.08958501, 1.353724, 0.8978766, 1, 1, 1, 1, 1,
0.09651014, -2.057053, 3.903154, 1, 1, 1, 1, 1,
0.09801129, -0.5494353, 3.424095, 0, 0, 1, 1, 1,
0.1030008, -1.429177, 2.380142, 1, 0, 0, 1, 1,
0.109704, -1.367019, 2.54711, 1, 0, 0, 1, 1,
0.1167619, 0.6890578, 1.422987, 1, 0, 0, 1, 1,
0.1186127, -1.124635, 2.348447, 1, 0, 0, 1, 1,
0.1210455, -1.093492, 2.682546, 1, 0, 0, 1, 1,
0.1221072, 0.09304553, 1.422383, 0, 0, 0, 1, 1,
0.1224648, 0.7273176, -1.22373, 0, 0, 0, 1, 1,
0.1267941, 0.01042173, 1.790435, 0, 0, 0, 1, 1,
0.1273096, 0.4611453, 1.044721, 0, 0, 0, 1, 1,
0.132709, -1.090137, 4.299642, 0, 0, 0, 1, 1,
0.1333214, -0.01462775, 2.27934, 0, 0, 0, 1, 1,
0.1373305, -0.09573271, 1.713242, 0, 0, 0, 1, 1,
0.1399299, -1.648504, 2.816572, 1, 1, 1, 1, 1,
0.1424614, 0.07885564, -0.3340584, 1, 1, 1, 1, 1,
0.1514333, 0.1426411, 2.891889, 1, 1, 1, 1, 1,
0.1532788, -0.9867235, 4.955376, 1, 1, 1, 1, 1,
0.1535442, -1.627231, 4.744309, 1, 1, 1, 1, 1,
0.1541995, -0.08008843, -0.03403362, 1, 1, 1, 1, 1,
0.1581529, 1.392438, 1.249567, 1, 1, 1, 1, 1,
0.1598176, 1.167688, -0.2171532, 1, 1, 1, 1, 1,
0.1610809, -0.6537941, 2.977814, 1, 1, 1, 1, 1,
0.1613674, 2.003962, -0.9156716, 1, 1, 1, 1, 1,
0.1618323, 0.577382, -0.2144288, 1, 1, 1, 1, 1,
0.1642817, -0.7820666, 2.991805, 1, 1, 1, 1, 1,
0.1650399, 0.1769218, -0.2073185, 1, 1, 1, 1, 1,
0.1667816, -1.609669, 4.300673, 1, 1, 1, 1, 1,
0.1722261, -0.07460157, 1.491495, 1, 1, 1, 1, 1,
0.1794234, 1.481226, 0.9537477, 0, 0, 1, 1, 1,
0.1851209, -0.2435396, 3.379977, 1, 0, 0, 1, 1,
0.1865046, -0.779843, 3.962168, 1, 0, 0, 1, 1,
0.1938365, 0.2349892, 0.4843073, 1, 0, 0, 1, 1,
0.193887, -1.558578, 1.698148, 1, 0, 0, 1, 1,
0.1939635, 0.868818, 1.260469, 1, 0, 0, 1, 1,
0.197126, 0.3616617, 0.7836826, 0, 0, 0, 1, 1,
0.1985409, 0.3225631, -0.7277802, 0, 0, 0, 1, 1,
0.2003205, -0.1693652, 1.430345, 0, 0, 0, 1, 1,
0.2014403, -0.3794198, 3.585281, 0, 0, 0, 1, 1,
0.210453, 1.001547, -1.744657, 0, 0, 0, 1, 1,
0.2105522, -0.3139778, 2.187103, 0, 0, 0, 1, 1,
0.2138596, -0.3268881, 2.228193, 0, 0, 0, 1, 1,
0.2168276, 2.149022, 0.608036, 1, 1, 1, 1, 1,
0.2170356, 0.6784752, 0.04968658, 1, 1, 1, 1, 1,
0.2181514, -1.174354, 1.118106, 1, 1, 1, 1, 1,
0.2184489, 0.1171736, -0.2081929, 1, 1, 1, 1, 1,
0.2210234, 1.124857, -1.579735, 1, 1, 1, 1, 1,
0.2255955, 1.383356, 0.9415038, 1, 1, 1, 1, 1,
0.2261256, -0.275648, 1.436814, 1, 1, 1, 1, 1,
0.2306842, -0.7835739, 4.156968, 1, 1, 1, 1, 1,
0.2310674, 3.260674, -0.1956137, 1, 1, 1, 1, 1,
0.236194, -0.7299489, 4.143879, 1, 1, 1, 1, 1,
0.2402892, -2.09698, 2.846299, 1, 1, 1, 1, 1,
0.2419166, 0.525877, 0.3878493, 1, 1, 1, 1, 1,
0.2422573, 1.012184, -0.1495493, 1, 1, 1, 1, 1,
0.2450814, 0.89526, 2.396304, 1, 1, 1, 1, 1,
0.254779, -1.148623, 3.715664, 1, 1, 1, 1, 1,
0.2557603, -1.470378, 3.173874, 0, 0, 1, 1, 1,
0.2568506, -0.07853968, 0.1804946, 1, 0, 0, 1, 1,
0.2594979, -1.78017, 3.50353, 1, 0, 0, 1, 1,
0.2604601, 0.8970696, 1.140287, 1, 0, 0, 1, 1,
0.2622313, -0.3728851, 1.266056, 1, 0, 0, 1, 1,
0.2633903, 1.00565, 0.4866877, 1, 0, 0, 1, 1,
0.2721797, -0.3739085, 2.364893, 0, 0, 0, 1, 1,
0.2774019, -0.7119449, 3.185699, 0, 0, 0, 1, 1,
0.2809784, -0.9152101, 1.975526, 0, 0, 0, 1, 1,
0.2913967, -0.9795313, 3.391052, 0, 0, 0, 1, 1,
0.2931187, 1.048537, 2.853205, 0, 0, 0, 1, 1,
0.2985467, -0.3883677, -0.0370045, 0, 0, 0, 1, 1,
0.3041005, -0.8512288, 1.913482, 0, 0, 0, 1, 1,
0.3042804, 0.4046665, -0.210813, 1, 1, 1, 1, 1,
0.3064972, -0.2766223, 1.643897, 1, 1, 1, 1, 1,
0.3082322, 0.1816989, 0.7174901, 1, 1, 1, 1, 1,
0.3091908, 1.827877, -0.2991665, 1, 1, 1, 1, 1,
0.310778, -0.3459367, 2.886965, 1, 1, 1, 1, 1,
0.3162965, 0.6059854, 0.774458, 1, 1, 1, 1, 1,
0.3180343, 0.01280417, 0.8331908, 1, 1, 1, 1, 1,
0.3227388, 1.668896, 2.032146, 1, 1, 1, 1, 1,
0.3273258, -1.801088, 1.521659, 1, 1, 1, 1, 1,
0.3288665, 0.7361198, -0.5794285, 1, 1, 1, 1, 1,
0.3299224, 1.28115, 0.3592719, 1, 1, 1, 1, 1,
0.3313544, 0.780651, 0.277289, 1, 1, 1, 1, 1,
0.3325736, 0.8123886, 0.6407884, 1, 1, 1, 1, 1,
0.335425, -1.049611, 3.033853, 1, 1, 1, 1, 1,
0.3382299, 0.3427352, 0.5857529, 1, 1, 1, 1, 1,
0.347077, 0.106124, 0.6818655, 0, 0, 1, 1, 1,
0.3478831, -0.1541479, 1.747397, 1, 0, 0, 1, 1,
0.3486379, -1.213215, 3.697753, 1, 0, 0, 1, 1,
0.3526531, -0.3038157, 3.409748, 1, 0, 0, 1, 1,
0.3566441, -0.09722129, 2.552585, 1, 0, 0, 1, 1,
0.3604576, 1.288393, -0.7370254, 1, 0, 0, 1, 1,
0.363853, -0.5726719, 2.647669, 0, 0, 0, 1, 1,
0.3670585, -1.875182, 4.358394, 0, 0, 0, 1, 1,
0.3690312, 1.294065, -1.497507, 0, 0, 0, 1, 1,
0.3693916, -1.509976, 3.603069, 0, 0, 0, 1, 1,
0.3705386, 0.3277642, -0.1561536, 0, 0, 0, 1, 1,
0.3731185, -0.3159721, 0.2399844, 0, 0, 0, 1, 1,
0.3800991, 0.8199106, 0.01834225, 0, 0, 0, 1, 1,
0.380211, -0.4767416, 1.693897, 1, 1, 1, 1, 1,
0.3833951, 1.238845, 1.409423, 1, 1, 1, 1, 1,
0.3837059, -0.2351251, 2.851262, 1, 1, 1, 1, 1,
0.3884279, -0.08258462, 1.245708, 1, 1, 1, 1, 1,
0.3893647, -1.024866, 3.717433, 1, 1, 1, 1, 1,
0.3900442, -1.14606, 2.698473, 1, 1, 1, 1, 1,
0.3949061, -0.9210019, 4.058525, 1, 1, 1, 1, 1,
0.4030269, 1.645741, 0.5347127, 1, 1, 1, 1, 1,
0.4054034, 0.0002671013, 0.1068245, 1, 1, 1, 1, 1,
0.405846, -0.7873057, 1.57553, 1, 1, 1, 1, 1,
0.4061024, -0.06685612, 2.111617, 1, 1, 1, 1, 1,
0.4144361, -1.09709, 4.538918, 1, 1, 1, 1, 1,
0.4166418, -0.6353111, 1.39988, 1, 1, 1, 1, 1,
0.4205269, 1.259711, 0.5310069, 1, 1, 1, 1, 1,
0.4205902, 0.2962783, 0.3450327, 1, 1, 1, 1, 1,
0.4221285, -1.955142, 3.321944, 0, 0, 1, 1, 1,
0.422194, -0.3939937, 3.516953, 1, 0, 0, 1, 1,
0.4279501, -1.001367, 3.196844, 1, 0, 0, 1, 1,
0.4301723, -0.9096562, 2.317575, 1, 0, 0, 1, 1,
0.4338436, -0.9408879, 2.784447, 1, 0, 0, 1, 1,
0.4372168, -2.38339, 2.314016, 1, 0, 0, 1, 1,
0.4380778, 0.8348156, 0.006399442, 0, 0, 0, 1, 1,
0.4384404, -0.3617009, 3.262736, 0, 0, 0, 1, 1,
0.4407894, 0.4885592, -0.4850568, 0, 0, 0, 1, 1,
0.4414685, -0.4610534, 3.933671, 0, 0, 0, 1, 1,
0.4442018, 1.515482, -0.1162483, 0, 0, 0, 1, 1,
0.4459498, -1.217509, 2.294595, 0, 0, 0, 1, 1,
0.4485742, -0.3608015, 1.248352, 0, 0, 0, 1, 1,
0.4557814, 1.66799, 0.02321195, 1, 1, 1, 1, 1,
0.4571558, 0.4903624, 2.097416, 1, 1, 1, 1, 1,
0.457363, -0.5624181, 0.8596416, 1, 1, 1, 1, 1,
0.4628649, 1.299263, 0.6204225, 1, 1, 1, 1, 1,
0.4698294, 1.641862, -0.2621555, 1, 1, 1, 1, 1,
0.4707044, -0.05999077, 1.682959, 1, 1, 1, 1, 1,
0.478519, -0.6652811, 1.319193, 1, 1, 1, 1, 1,
0.4799455, 0.8644809, 0.7035783, 1, 1, 1, 1, 1,
0.4835416, 2.994411, 0.06128094, 1, 1, 1, 1, 1,
0.4886965, -0.1467868, 1.961002, 1, 1, 1, 1, 1,
0.4936352, -0.3105087, 3.176004, 1, 1, 1, 1, 1,
0.4960612, -0.5477685, 1.252386, 1, 1, 1, 1, 1,
0.4965683, 1.081753, 0.7893715, 1, 1, 1, 1, 1,
0.4969667, 0.1947201, 1.480612, 1, 1, 1, 1, 1,
0.4990399, -0.1916249, 2.9498, 1, 1, 1, 1, 1,
0.5000204, -1.239808, 3.072699, 0, 0, 1, 1, 1,
0.501945, 1.07353, -0.3795454, 1, 0, 0, 1, 1,
0.5076365, -0.4087974, 3.988461, 1, 0, 0, 1, 1,
0.5113795, 1.236388, -1.186622, 1, 0, 0, 1, 1,
0.5123777, -0.07917868, 2.256879, 1, 0, 0, 1, 1,
0.513836, 0.3723575, 1.084793, 1, 0, 0, 1, 1,
0.5163913, 1.290353, 0.1745705, 0, 0, 0, 1, 1,
0.5189819, 0.3849315, 2.285712, 0, 0, 0, 1, 1,
0.5192165, 0.9021952, -0.3163935, 0, 0, 0, 1, 1,
0.529869, 1.322304, -0.8571321, 0, 0, 0, 1, 1,
0.5310425, -0.9142163, 3.958488, 0, 0, 0, 1, 1,
0.535852, 0.9989695, 0.9394439, 0, 0, 0, 1, 1,
0.542827, 0.174864, 3.419444, 0, 0, 0, 1, 1,
0.5477293, -0.08371384, 1.784223, 1, 1, 1, 1, 1,
0.5552266, -1.591478, 2.045286, 1, 1, 1, 1, 1,
0.5565638, -0.6783988, 1.948483, 1, 1, 1, 1, 1,
0.5638107, -0.387072, 1.222415, 1, 1, 1, 1, 1,
0.5645623, 0.6057389, 2.13209, 1, 1, 1, 1, 1,
0.5649568, -0.1473445, 0.5985957, 1, 1, 1, 1, 1,
0.5652699, -0.7201738, 3.4708, 1, 1, 1, 1, 1,
0.5694, 0.5711476, 2.880666, 1, 1, 1, 1, 1,
0.5700406, 0.4406385, 0.1023361, 1, 1, 1, 1, 1,
0.5721516, -0.2283505, 2.965918, 1, 1, 1, 1, 1,
0.5721633, 1.570576, 0.2051418, 1, 1, 1, 1, 1,
0.5743169, 1.533921, -0.3831078, 1, 1, 1, 1, 1,
0.5749311, -0.6743916, 1.651185, 1, 1, 1, 1, 1,
0.5769348, -0.6129894, 1.218856, 1, 1, 1, 1, 1,
0.5772685, -0.2510563, 2.954902, 1, 1, 1, 1, 1,
0.582495, 0.6170881, 0.259386, 0, 0, 1, 1, 1,
0.5881369, -0.7765948, 2.078411, 1, 0, 0, 1, 1,
0.5899187, 0.166284, 0.1160639, 1, 0, 0, 1, 1,
0.6006978, 1.078932, 2.520076, 1, 0, 0, 1, 1,
0.6014324, -1.094793, 3.022848, 1, 0, 0, 1, 1,
0.6026599, -0.9640549, 2.234988, 1, 0, 0, 1, 1,
0.607295, -0.32081, 1.384198, 0, 0, 0, 1, 1,
0.6097594, 1.261451, -0.2093827, 0, 0, 0, 1, 1,
0.6162199, -0.2873162, 2.746062, 0, 0, 0, 1, 1,
0.6207755, 0.7266951, 1.099999, 0, 0, 0, 1, 1,
0.6232634, 0.1047366, 1.40846, 0, 0, 0, 1, 1,
0.6275506, -0.02942346, 1.029761, 0, 0, 0, 1, 1,
0.6294984, 2.353032, -0.7795706, 0, 0, 0, 1, 1,
0.6359999, -1.161901, 2.792647, 1, 1, 1, 1, 1,
0.6387339, 0.9941059, 1.99206, 1, 1, 1, 1, 1,
0.6401373, 0.07908739, 2.081111, 1, 1, 1, 1, 1,
0.6407251, -0.2176661, 1.218576, 1, 1, 1, 1, 1,
0.6433188, 1.655901, -0.7941983, 1, 1, 1, 1, 1,
0.6494561, -0.3569206, 2.553048, 1, 1, 1, 1, 1,
0.6505653, 0.215096, 0.5810644, 1, 1, 1, 1, 1,
0.6570209, 0.5519446, 0.08304603, 1, 1, 1, 1, 1,
0.6616877, 0.1577294, 0.9065565, 1, 1, 1, 1, 1,
0.6638578, 0.8912038, 2.228334, 1, 1, 1, 1, 1,
0.6662275, -1.131861, 1.061007, 1, 1, 1, 1, 1,
0.6731394, 1.19549, 0.1980578, 1, 1, 1, 1, 1,
0.673212, -1.455207, 2.607407, 1, 1, 1, 1, 1,
0.6784788, 0.1333458, 0.874904, 1, 1, 1, 1, 1,
0.6792611, 0.4176, 1.393263, 1, 1, 1, 1, 1,
0.6814689, 0.4856857, 1.215516, 0, 0, 1, 1, 1,
0.6860918, 1.298918, 0.5561575, 1, 0, 0, 1, 1,
0.6866912, 0.5980423, 0.5111629, 1, 0, 0, 1, 1,
0.6867197, 0.06752117, 1.119167, 1, 0, 0, 1, 1,
0.6867476, 0.1857276, 0.1498293, 1, 0, 0, 1, 1,
0.6870578, 0.9596429, 0.1134238, 1, 0, 0, 1, 1,
0.6879261, -1.019338, 1.059784, 0, 0, 0, 1, 1,
0.6902151, -0.7687615, 1.909917, 0, 0, 0, 1, 1,
0.6919978, 0.4585422, -0.3199401, 0, 0, 0, 1, 1,
0.6939769, 0.07225642, 0.9662223, 0, 0, 0, 1, 1,
0.6990895, 0.03754211, 0.8089393, 0, 0, 0, 1, 1,
0.7037442, -0.6828036, 2.026077, 0, 0, 0, 1, 1,
0.7046014, -0.1668151, 1.479718, 0, 0, 0, 1, 1,
0.7129807, 0.9200805, -0.3874939, 1, 1, 1, 1, 1,
0.7195359, -0.8460171, 3.837495, 1, 1, 1, 1, 1,
0.7198691, 0.1112624, 2.055587, 1, 1, 1, 1, 1,
0.721769, -1.732605, 3.259253, 1, 1, 1, 1, 1,
0.7222298, 1.352987, 0.655432, 1, 1, 1, 1, 1,
0.7222793, 1.870183, 0.8389292, 1, 1, 1, 1, 1,
0.7253394, 0.09270092, 1.464924, 1, 1, 1, 1, 1,
0.7259405, -0.6001939, 1.859079, 1, 1, 1, 1, 1,
0.7317384, 0.2862264, 1.306845, 1, 1, 1, 1, 1,
0.7332957, 1.179963, 2.893955, 1, 1, 1, 1, 1,
0.7340332, 0.8837652, 0.9976996, 1, 1, 1, 1, 1,
0.7378263, -2.25173, 2.564969, 1, 1, 1, 1, 1,
0.7449348, -0.5835453, 3.0844, 1, 1, 1, 1, 1,
0.7466327, -0.2125315, 2.93584, 1, 1, 1, 1, 1,
0.7474707, 0.03022048, 1.923117, 1, 1, 1, 1, 1,
0.7483671, -0.7365817, 1.684052, 0, 0, 1, 1, 1,
0.7508656, -1.048784, 1.630494, 1, 0, 0, 1, 1,
0.7529359, 0.8671523, 1.692867, 1, 0, 0, 1, 1,
0.7542476, -1.665984, 1.642198, 1, 0, 0, 1, 1,
0.7616276, 0.7660565, 1.830105, 1, 0, 0, 1, 1,
0.7688668, -0.8269888, 2.95961, 1, 0, 0, 1, 1,
0.7764211, 0.2132291, 3.285671, 0, 0, 0, 1, 1,
0.7773969, -0.3940153, 1.638536, 0, 0, 0, 1, 1,
0.780412, -1.291716, 3.00545, 0, 0, 0, 1, 1,
0.7853287, 1.437812, -0.5552999, 0, 0, 0, 1, 1,
0.787484, -0.6571615, 2.33818, 0, 0, 0, 1, 1,
0.7932347, -0.5633674, 1.545908, 0, 0, 0, 1, 1,
0.7960935, -0.1752051, 1.922316, 0, 0, 0, 1, 1,
0.7978927, -0.205703, 2.908378, 1, 1, 1, 1, 1,
0.8024668, 0.09621272, 1.164294, 1, 1, 1, 1, 1,
0.8053962, -0.1801261, 0.04892916, 1, 1, 1, 1, 1,
0.8073674, -0.8143122, 2.750239, 1, 1, 1, 1, 1,
0.8075952, -0.08892716, 2.016361, 1, 1, 1, 1, 1,
0.809262, -1.084386, 2.234144, 1, 1, 1, 1, 1,
0.8137553, -0.1504562, 2.855836, 1, 1, 1, 1, 1,
0.8187438, 0.06578485, 1.894187, 1, 1, 1, 1, 1,
0.8222203, -1.084578, 3.805001, 1, 1, 1, 1, 1,
0.8227704, -0.9114203, 2.722436, 1, 1, 1, 1, 1,
0.8282575, -1.225943, 2.6835, 1, 1, 1, 1, 1,
0.8292906, -1.065221, 2.664801, 1, 1, 1, 1, 1,
0.8301029, -1.197139, 2.34253, 1, 1, 1, 1, 1,
0.8345906, -0.4570986, 1.172763, 1, 1, 1, 1, 1,
0.8395495, -1.017526, 1.184646, 1, 1, 1, 1, 1,
0.8425556, -1.575524, 1.837496, 0, 0, 1, 1, 1,
0.8435989, 1.836174, 0.7717702, 1, 0, 0, 1, 1,
0.8437583, 1.002261, 1.458816, 1, 0, 0, 1, 1,
0.8484027, 1.050173, 1.123924, 1, 0, 0, 1, 1,
0.8511959, -1.734557, 2.291509, 1, 0, 0, 1, 1,
0.8602582, 0.4378643, 0.7486261, 1, 0, 0, 1, 1,
0.8635525, -0.1120223, 0.9273148, 0, 0, 0, 1, 1,
0.874529, -0.1216957, 1.170294, 0, 0, 0, 1, 1,
0.8765607, -0.06625616, 1.764276, 0, 0, 0, 1, 1,
0.8869438, 2.54848, 0.4124071, 0, 0, 0, 1, 1,
0.8872086, -0.7742885, 4.235318, 0, 0, 0, 1, 1,
0.8928326, 0.4937366, 1.753448, 0, 0, 0, 1, 1,
0.8945892, -0.5810828, 1.553947, 0, 0, 0, 1, 1,
0.8951058, -0.999102, 4.567993, 1, 1, 1, 1, 1,
0.8989855, 0.6047339, 0.8008387, 1, 1, 1, 1, 1,
0.9199579, -1.142718, 1.461332, 1, 1, 1, 1, 1,
0.9228265, -1.282109, 2.094877, 1, 1, 1, 1, 1,
0.9232858, -2.73517, 2.253365, 1, 1, 1, 1, 1,
0.9262187, -0.2839852, 1.92166, 1, 1, 1, 1, 1,
0.9269235, 0.9169672, -1.849749, 1, 1, 1, 1, 1,
0.9335048, -3.904989, 2.054115, 1, 1, 1, 1, 1,
0.9343429, -0.07312393, 2.950196, 1, 1, 1, 1, 1,
0.9423428, -0.3398011, 1.25897, 1, 1, 1, 1, 1,
0.9437757, -0.1604898, 1.740007, 1, 1, 1, 1, 1,
0.9494745, -0.252292, 2.56889, 1, 1, 1, 1, 1,
0.9501743, -1.089901, 0.8958309, 1, 1, 1, 1, 1,
0.9520736, -2.262864, 2.771793, 1, 1, 1, 1, 1,
0.9567974, 1.663095, 1.021187, 1, 1, 1, 1, 1,
0.9599535, 0.9858633, -0.4774196, 0, 0, 1, 1, 1,
0.9628814, 0.5960052, 0.6510457, 1, 0, 0, 1, 1,
0.9664561, 1.238408, 1.393482, 1, 0, 0, 1, 1,
0.9664726, -0.7772575, 3.059675, 1, 0, 0, 1, 1,
0.9673063, -1.299137, 3.501291, 1, 0, 0, 1, 1,
0.9775, 0.2770236, 1.25903, 1, 0, 0, 1, 1,
0.9776621, 0.9114134, 1.207194, 0, 0, 0, 1, 1,
0.9777949, -1.056766, 3.636626, 0, 0, 0, 1, 1,
0.9790727, 0.2802283, 0.990471, 0, 0, 0, 1, 1,
0.9858811, 0.1531314, 1.690057, 0, 0, 0, 1, 1,
0.9885055, -1.037134, 2.037578, 0, 0, 0, 1, 1,
0.9900005, -0.763786, 2.335708, 0, 0, 0, 1, 1,
0.9914207, 0.7153856, 0.7396774, 0, 0, 0, 1, 1,
0.9936705, 0.9444248, 2.75519, 1, 1, 1, 1, 1,
0.9949, 0.8446153, 0.8890296, 1, 1, 1, 1, 1,
0.9958835, 0.6669402, 1.555184, 1, 1, 1, 1, 1,
0.9967087, 0.5186768, 0.5675882, 1, 1, 1, 1, 1,
0.9974472, -0.9386165, 2.260948, 1, 1, 1, 1, 1,
0.9974777, 0.2502395, 0.7297801, 1, 1, 1, 1, 1,
1.001347, -0.3193929, 2.891016, 1, 1, 1, 1, 1,
1.006409, 0.5049316, 1.039083, 1, 1, 1, 1, 1,
1.010558, 0.1891527, 0.2865946, 1, 1, 1, 1, 1,
1.016613, -0.3020675, 3.060189, 1, 1, 1, 1, 1,
1.023747, -0.4163353, 1.293507, 1, 1, 1, 1, 1,
1.030841, 0.6522428, 0.5008588, 1, 1, 1, 1, 1,
1.033144, -0.05676457, 2.65886, 1, 1, 1, 1, 1,
1.037679, -0.685453, 3.735907, 1, 1, 1, 1, 1,
1.041115, -2.580024, 4.053649, 1, 1, 1, 1, 1,
1.04472, -0.7770402, 3.626006, 0, 0, 1, 1, 1,
1.046058, -0.2763393, 3.448467, 1, 0, 0, 1, 1,
1.049669, -0.7254148, 1.86861, 1, 0, 0, 1, 1,
1.052678, 0.6414148, 1.693782, 1, 0, 0, 1, 1,
1.058424, -0.943224, 2.070868, 1, 0, 0, 1, 1,
1.059343, -1.408643, 2.517984, 1, 0, 0, 1, 1,
1.070534, 0.04974647, 2.147968, 0, 0, 0, 1, 1,
1.073856, -0.2427958, 1.983078, 0, 0, 0, 1, 1,
1.074797, 1.617748, 0.4977613, 0, 0, 0, 1, 1,
1.075936, 0.1112664, 3.47696, 0, 0, 0, 1, 1,
1.081842, 1.452773, 1.288214, 0, 0, 0, 1, 1,
1.08405, 0.8758221, -0.7929365, 0, 0, 0, 1, 1,
1.090953, -0.8699441, 2.058193, 0, 0, 0, 1, 1,
1.094117, -2.1129, 2.115299, 1, 1, 1, 1, 1,
1.096769, 2.04036, 2.067656, 1, 1, 1, 1, 1,
1.099296, -0.9101692, 1.916218, 1, 1, 1, 1, 1,
1.115729, -0.2940855, 2.507604, 1, 1, 1, 1, 1,
1.120192, -0.596937, 1.574017, 1, 1, 1, 1, 1,
1.124371, -0.35017, 1.067355, 1, 1, 1, 1, 1,
1.128321, 0.1499279, 2.104652, 1, 1, 1, 1, 1,
1.131073, -0.4495105, 1.611737, 1, 1, 1, 1, 1,
1.147642, -0.7249401, 3.512512, 1, 1, 1, 1, 1,
1.148593, 0.3346865, 0.6601515, 1, 1, 1, 1, 1,
1.149154, -2.745642, 2.516234, 1, 1, 1, 1, 1,
1.174597, -0.02514466, 2.604192, 1, 1, 1, 1, 1,
1.17497, 0.3750496, 2.769682, 1, 1, 1, 1, 1,
1.183138, 0.8775052, 1.312629, 1, 1, 1, 1, 1,
1.192971, -0.2834224, 0.9558415, 1, 1, 1, 1, 1,
1.195887, 1.716094, -0.6127129, 0, 0, 1, 1, 1,
1.207797, 1.336586, 0.3423891, 1, 0, 0, 1, 1,
1.212466, -0.4326446, 1.725106, 1, 0, 0, 1, 1,
1.217003, -0.1711971, 2.574548, 1, 0, 0, 1, 1,
1.226899, 0.9374649, 0.8273962, 1, 0, 0, 1, 1,
1.236917, 0.9432247, 0.5294728, 1, 0, 0, 1, 1,
1.237044, -0.03142009, 2.399504, 0, 0, 0, 1, 1,
1.244617, 0.6164445, 1.300444, 0, 0, 0, 1, 1,
1.250926, -0.3838989, 2.719395, 0, 0, 0, 1, 1,
1.252916, 1.793557, 2.085947, 0, 0, 0, 1, 1,
1.268898, 0.2572286, -0.124614, 0, 0, 0, 1, 1,
1.270161, 0.3815483, 1.340698, 0, 0, 0, 1, 1,
1.27514, -0.1845781, -0.08281901, 0, 0, 0, 1, 1,
1.27822, 1.845237, -0.5845381, 1, 1, 1, 1, 1,
1.279329, 0.3031146, 0.6337174, 1, 1, 1, 1, 1,
1.289667, -0.8892519, 1.801929, 1, 1, 1, 1, 1,
1.292353, -0.152887, 1.380656, 1, 1, 1, 1, 1,
1.296818, -1.976638, 3.326463, 1, 1, 1, 1, 1,
1.298085, -0.9485556, 1.346427, 1, 1, 1, 1, 1,
1.299703, -0.06619203, 2.066741, 1, 1, 1, 1, 1,
1.302171, 1.719801, 1.058743, 1, 1, 1, 1, 1,
1.309463, 0.1617963, 2.087446, 1, 1, 1, 1, 1,
1.311422, 0.7288355, 2.324317, 1, 1, 1, 1, 1,
1.314365, 0.196112, 2.234093, 1, 1, 1, 1, 1,
1.315838, -0.9037964, 0.9205734, 1, 1, 1, 1, 1,
1.320845, -0.5089159, 1.981951, 1, 1, 1, 1, 1,
1.32834, 1.001093, 1.449681, 1, 1, 1, 1, 1,
1.332686, 0.5679415, 1.385983, 1, 1, 1, 1, 1,
1.340537, -0.8416532, 2.173272, 0, 0, 1, 1, 1,
1.342896, -1.241041, 1.698384, 1, 0, 0, 1, 1,
1.349672, -0.5937471, 1.590268, 1, 0, 0, 1, 1,
1.363017, 0.8574775, -0.7164378, 1, 0, 0, 1, 1,
1.367401, 0.1261594, 0.8894339, 1, 0, 0, 1, 1,
1.368, -1.161556, 1.715111, 1, 0, 0, 1, 1,
1.377646, 0.08354047, 1.307065, 0, 0, 0, 1, 1,
1.381073, 0.7905263, 1.025537, 0, 0, 0, 1, 1,
1.406457, 0.177836, -0.8445368, 0, 0, 0, 1, 1,
1.428256, 0.8389426, 1.682257, 0, 0, 0, 1, 1,
1.428795, -1.137869, 1.717909, 0, 0, 0, 1, 1,
1.450588, -0.7557031, 0.7594007, 0, 0, 0, 1, 1,
1.45087, -0.1123134, 0.05227075, 0, 0, 0, 1, 1,
1.454483, 0.8028669, 1.366747, 1, 1, 1, 1, 1,
1.462775, -0.9727879, 1.242317, 1, 1, 1, 1, 1,
1.464471, 0.6322143, 2.166281, 1, 1, 1, 1, 1,
1.467525, -0.4389457, 3.159561, 1, 1, 1, 1, 1,
1.468044, 0.2720484, 1.128698, 1, 1, 1, 1, 1,
1.475168, 0.3908896, 0.08155806, 1, 1, 1, 1, 1,
1.492931, -0.5632439, 1.731253, 1, 1, 1, 1, 1,
1.496984, -0.5530572, 1.883217, 1, 1, 1, 1, 1,
1.526326, -0.5472012, 2.994584, 1, 1, 1, 1, 1,
1.527587, -0.968919, 2.344529, 1, 1, 1, 1, 1,
1.530024, 2.006719, 0.6755051, 1, 1, 1, 1, 1,
1.578373, -1.174498, 2.876349, 1, 1, 1, 1, 1,
1.589546, 1.054414, 2.484558, 1, 1, 1, 1, 1,
1.620158, 0.5850703, 0.6213579, 1, 1, 1, 1, 1,
1.620509, 0.8520237, 1.495165, 1, 1, 1, 1, 1,
1.624335, 0.02477249, 3.280464, 0, 0, 1, 1, 1,
1.627, -0.9696984, 3.067229, 1, 0, 0, 1, 1,
1.635422, -0.739228, 2.182511, 1, 0, 0, 1, 1,
1.655363, 0.2140397, 0.3820331, 1, 0, 0, 1, 1,
1.665524, -0.03756885, 0.9743031, 1, 0, 0, 1, 1,
1.728961, 0.3916407, 1.588121, 1, 0, 0, 1, 1,
1.733963, 1.936678, 2.025934, 0, 0, 0, 1, 1,
1.766652, 0.8727671, 0.006562028, 0, 0, 0, 1, 1,
1.772725, 1.76952, 0.2861371, 0, 0, 0, 1, 1,
1.856868, 0.7151761, 1.350824, 0, 0, 0, 1, 1,
1.857274, 2.573194, -1.164025, 0, 0, 0, 1, 1,
1.857648, 0.4151351, 1.027809, 0, 0, 0, 1, 1,
1.86736, -0.406532, 2.19629, 0, 0, 0, 1, 1,
1.881911, 0.494743, -0.5116612, 1, 1, 1, 1, 1,
1.883656, -1.273221, 3.459266, 1, 1, 1, 1, 1,
1.885695, -0.3171938, 1.5359, 1, 1, 1, 1, 1,
1.888661, -0.2251607, 2.401497, 1, 1, 1, 1, 1,
1.903758, -0.6757638, 2.885854, 1, 1, 1, 1, 1,
1.908926, 1.759291, 1.913681, 1, 1, 1, 1, 1,
1.928315, -2.65867, 1.111512, 1, 1, 1, 1, 1,
1.930799, 0.3802801, 3.215782, 1, 1, 1, 1, 1,
1.962383, 0.9618196, -0.4121749, 1, 1, 1, 1, 1,
1.9642, 0.007041447, 2.275438, 1, 1, 1, 1, 1,
1.972631, 0.1540133, 1.040627, 1, 1, 1, 1, 1,
1.974016, -0.1957448, 2.073768, 1, 1, 1, 1, 1,
2.026578, 0.2183001, 0.9461684, 1, 1, 1, 1, 1,
2.036521, 1.443183, -0.7162623, 1, 1, 1, 1, 1,
2.046304, 0.6921312, 0.6403813, 1, 1, 1, 1, 1,
2.135094, -0.07744887, 1.113682, 0, 0, 1, 1, 1,
2.148024, -0.4545137, 2.096357, 1, 0, 0, 1, 1,
2.149646, -0.2205262, -0.8505924, 1, 0, 0, 1, 1,
2.159473, -0.04793144, 2.6824, 1, 0, 0, 1, 1,
2.225852, 2.483011, 1.128663, 1, 0, 0, 1, 1,
2.253119, 0.5108571, 0.3196186, 1, 0, 0, 1, 1,
2.270194, 0.6506228, 1.04734, 0, 0, 0, 1, 1,
2.276828, -0.9263119, 2.241286, 0, 0, 0, 1, 1,
2.302211, -1.493753, 2.298411, 0, 0, 0, 1, 1,
2.377278, -0.5678686, 1.209337, 0, 0, 0, 1, 1,
2.464762, 0.192434, -0.1067338, 0, 0, 0, 1, 1,
2.543639, 0.9988776, 0.73479, 0, 0, 0, 1, 1,
2.57248, 0.0238422, 3.394402, 0, 0, 0, 1, 1,
2.64299, 1.337978, 1.377205, 1, 1, 1, 1, 1,
2.844773, 0.4148063, 1.599666, 1, 1, 1, 1, 1,
2.853634, -1.048591, 3.217101, 1, 1, 1, 1, 1,
2.914691, -2.053326, 1.112985, 1, 1, 1, 1, 1,
2.993396, 0.8622363, 0.9514284, 1, 1, 1, 1, 1,
2.996396, 1.386054, 2.092147, 1, 1, 1, 1, 1,
3.24999, 0.2003819, -1.881661, 1, 1, 1, 1, 1
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
var radius = 10.20081;
var distance = 35.82991;
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
mvMatrix.translate( 0.04148197, 0.3221574, -0.02277946 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.82991);
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
