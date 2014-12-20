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
-3.359293, 0.2235182, -3.095027, 1, 0, 0, 1,
-3.287165, -0.1163469, -1.312863, 1, 0.007843138, 0, 1,
-3.271364, -2.641465, -1.333069, 1, 0.01176471, 0, 1,
-3.210586, 1.152733, -1.467771, 1, 0.01960784, 0, 1,
-3.207867, 0.7984208, -1.427873, 1, 0.02352941, 0, 1,
-2.860357, 1.264686, -0.9621843, 1, 0.03137255, 0, 1,
-2.744708, -1.940002, -2.370945, 1, 0.03529412, 0, 1,
-2.545688, 0.8029116, -0.9110537, 1, 0.04313726, 0, 1,
-2.504662, 0.244129, -1.867308, 1, 0.04705882, 0, 1,
-2.495401, 1.832512, -0.9427205, 1, 0.05490196, 0, 1,
-2.449611, 0.8001182, -0.6382978, 1, 0.05882353, 0, 1,
-2.415605, -0.6678875, -1.482072, 1, 0.06666667, 0, 1,
-2.398707, 0.1529185, -1.9883, 1, 0.07058824, 0, 1,
-2.348036, 0.1958082, -0.4104837, 1, 0.07843138, 0, 1,
-2.260887, -1.413972, -0.4980488, 1, 0.08235294, 0, 1,
-2.222424, 1.005879, -0.7489416, 1, 0.09019608, 0, 1,
-2.188545, 1.342422, -0.4550552, 1, 0.09411765, 0, 1,
-2.090941, 0.822125, -0.176563, 1, 0.1019608, 0, 1,
-2.070863, -0.3414772, -2.24051, 1, 0.1098039, 0, 1,
-2.063396, -0.1721229, -1.107599, 1, 0.1137255, 0, 1,
-1.979553, -0.1438462, -2.7098, 1, 0.1215686, 0, 1,
-1.959985, -1.093922, -3.238422, 1, 0.1254902, 0, 1,
-1.926725, 0.3830957, -0.5664534, 1, 0.1333333, 0, 1,
-1.915969, 0.8186793, -2.924999, 1, 0.1372549, 0, 1,
-1.902315, -0.4484369, -1.10942, 1, 0.145098, 0, 1,
-1.890648, -0.3961776, -3.352168, 1, 0.1490196, 0, 1,
-1.86694, -1.751341, -1.378595, 1, 0.1568628, 0, 1,
-1.86367, 0.8259336, -2.511824, 1, 0.1607843, 0, 1,
-1.846304, 1.258328, -1.309721, 1, 0.1686275, 0, 1,
-1.837158, 0.1124806, -0.312111, 1, 0.172549, 0, 1,
-1.814859, -0.3090007, -4.265875, 1, 0.1803922, 0, 1,
-1.813858, 0.8007957, 0.3281566, 1, 0.1843137, 0, 1,
-1.800077, -0.06961018, -1.318472, 1, 0.1921569, 0, 1,
-1.792571, 0.6458383, -2.651546, 1, 0.1960784, 0, 1,
-1.762942, 0.4392545, -1.892802, 1, 0.2039216, 0, 1,
-1.758533, 1.30083, -1.562442, 1, 0.2117647, 0, 1,
-1.717637, -1.984131, -4.086051, 1, 0.2156863, 0, 1,
-1.710481, -0.1803337, -1.775364, 1, 0.2235294, 0, 1,
-1.69224, -1.60693, -2.101292, 1, 0.227451, 0, 1,
-1.673062, -0.7808999, -0.3841445, 1, 0.2352941, 0, 1,
-1.66067, -1.485242, -0.8605711, 1, 0.2392157, 0, 1,
-1.658791, 2.444607, 0.1517942, 1, 0.2470588, 0, 1,
-1.657998, 0.0582561, 0.5392011, 1, 0.2509804, 0, 1,
-1.633477, -1.419521, -2.119514, 1, 0.2588235, 0, 1,
-1.629189, -1.61324, -3.708864, 1, 0.2627451, 0, 1,
-1.62898, 1.004825, 0.2938267, 1, 0.2705882, 0, 1,
-1.611268, 0.5522668, -1.182078, 1, 0.2745098, 0, 1,
-1.58203, -0.6310678, -2.348015, 1, 0.282353, 0, 1,
-1.580563, -0.06645922, -1.012559, 1, 0.2862745, 0, 1,
-1.580043, -0.01318002, -1.459864, 1, 0.2941177, 0, 1,
-1.541695, 0.4856795, -2.0474, 1, 0.3019608, 0, 1,
-1.531953, -1.016503, -1.61128, 1, 0.3058824, 0, 1,
-1.524804, -0.7206279, -0.9203932, 1, 0.3137255, 0, 1,
-1.520655, -0.02640595, -1.511009, 1, 0.3176471, 0, 1,
-1.505034, -0.6472287, -2.09747, 1, 0.3254902, 0, 1,
-1.486058, -0.1703527, -2.645079, 1, 0.3294118, 0, 1,
-1.480757, -0.2082535, -2.049161, 1, 0.3372549, 0, 1,
-1.476191, -1.401038, -2.404237, 1, 0.3411765, 0, 1,
-1.469957, 0.637155, -1.243785, 1, 0.3490196, 0, 1,
-1.466609, 1.420517, -0.1913441, 1, 0.3529412, 0, 1,
-1.466508, 0.4746788, -1.406444, 1, 0.3607843, 0, 1,
-1.459635, -0.7462584, -1.70342, 1, 0.3647059, 0, 1,
-1.44432, -0.4850028, -3.129426, 1, 0.372549, 0, 1,
-1.438511, 1.42314, -2.298795, 1, 0.3764706, 0, 1,
-1.432343, 0.6197605, 0.1084832, 1, 0.3843137, 0, 1,
-1.431673, 0.535884, -1.1489, 1, 0.3882353, 0, 1,
-1.426217, 0.09238983, -3.936378, 1, 0.3960784, 0, 1,
-1.42236, 0.2782218, -0.3858594, 1, 0.4039216, 0, 1,
-1.42069, -0.7703768, -0.6130539, 1, 0.4078431, 0, 1,
-1.410152, 1.447041, -1.780308, 1, 0.4156863, 0, 1,
-1.391608, 0.6047652, -1.807516, 1, 0.4196078, 0, 1,
-1.367181, 0.1572062, -2.611181, 1, 0.427451, 0, 1,
-1.353667, 1.326606, 0.5907569, 1, 0.4313726, 0, 1,
-1.351625, -0.6122122, -1.644351, 1, 0.4392157, 0, 1,
-1.343397, 0.5484746, -1.449069, 1, 0.4431373, 0, 1,
-1.333219, 0.5049644, -3.21744, 1, 0.4509804, 0, 1,
-1.327688, -1.003672, -1.100071, 1, 0.454902, 0, 1,
-1.320889, 0.733398, -1.380265, 1, 0.4627451, 0, 1,
-1.317897, 0.03331523, -1.596863, 1, 0.4666667, 0, 1,
-1.308906, 0.2928174, -1.162781, 1, 0.4745098, 0, 1,
-1.308641, 3.205182, 0.7547946, 1, 0.4784314, 0, 1,
-1.30767, -0.3471959, -2.236101, 1, 0.4862745, 0, 1,
-1.30438, 0.7471282, -1.045992, 1, 0.4901961, 0, 1,
-1.303843, -0.193722, -2.492628, 1, 0.4980392, 0, 1,
-1.300463, 1.332187, -1.410944, 1, 0.5058824, 0, 1,
-1.287739, 0.1132517, -0.8545201, 1, 0.509804, 0, 1,
-1.287413, -1.276791, -2.524312, 1, 0.5176471, 0, 1,
-1.283199, -0.2780017, 0.7502738, 1, 0.5215687, 0, 1,
-1.280458, -0.3730517, -0.9207411, 1, 0.5294118, 0, 1,
-1.27784, -0.2440072, -1.364094, 1, 0.5333334, 0, 1,
-1.266559, 0.8559272, -0.1086644, 1, 0.5411765, 0, 1,
-1.230589, -1.644611, -2.255128, 1, 0.5450981, 0, 1,
-1.225124, -0.7858047, -2.336594, 1, 0.5529412, 0, 1,
-1.223832, -1.945062, -0.8643045, 1, 0.5568628, 0, 1,
-1.222107, -0.1455813, -2.404818, 1, 0.5647059, 0, 1,
-1.213328, -0.6559137, -0.5452663, 1, 0.5686275, 0, 1,
-1.21089, -0.4064283, -3.577213, 1, 0.5764706, 0, 1,
-1.198012, -0.6405311, -0.6329785, 1, 0.5803922, 0, 1,
-1.196928, 0.6484398, -2.051756, 1, 0.5882353, 0, 1,
-1.191362, 0.2774315, -2.247633, 1, 0.5921569, 0, 1,
-1.187111, 0.1752035, -0.5863228, 1, 0.6, 0, 1,
-1.182638, -0.4373061, -0.8626125, 1, 0.6078432, 0, 1,
-1.165585, 0.3797569, 0.03596319, 1, 0.6117647, 0, 1,
-1.163345, -0.2671208, -0.8622227, 1, 0.6196079, 0, 1,
-1.1572, 0.8010431, -0.515496, 1, 0.6235294, 0, 1,
-1.155461, -0.4751811, 0.9992031, 1, 0.6313726, 0, 1,
-1.14731, 1.119321, -0.8908591, 1, 0.6352941, 0, 1,
-1.143925, -1.733776, -4.18138, 1, 0.6431373, 0, 1,
-1.140212, 0.3080192, -3.564897, 1, 0.6470588, 0, 1,
-1.138802, -0.2224546, -1.347523, 1, 0.654902, 0, 1,
-1.136674, 0.3736502, -1.47492, 1, 0.6588235, 0, 1,
-1.13591, -0.711931, -0.9832094, 1, 0.6666667, 0, 1,
-1.128872, -0.2292517, -2.604862, 1, 0.6705883, 0, 1,
-1.117157, 2.053505, -0.9843611, 1, 0.6784314, 0, 1,
-1.110697, -1.719425, -0.7489352, 1, 0.682353, 0, 1,
-1.110392, -0.3015369, -1.300523, 1, 0.6901961, 0, 1,
-1.104247, 0.2251033, -0.5257332, 1, 0.6941177, 0, 1,
-1.100168, 0.1839497, -1.510148, 1, 0.7019608, 0, 1,
-1.098379, 1.675826, -0.5273042, 1, 0.7098039, 0, 1,
-1.096967, -1.28506, -1.966708, 1, 0.7137255, 0, 1,
-1.094318, -0.5607639, -1.87037, 1, 0.7215686, 0, 1,
-1.093576, 0.9834871, -2.811504, 1, 0.7254902, 0, 1,
-1.086811, -0.425655, -1.276806, 1, 0.7333333, 0, 1,
-1.085582, -1.26494, -1.730921, 1, 0.7372549, 0, 1,
-1.085555, 1.199744, -1.663772, 1, 0.7450981, 0, 1,
-1.079412, -0.5579125, -2.309651, 1, 0.7490196, 0, 1,
-1.075965, 0.4806337, -1.692137, 1, 0.7568628, 0, 1,
-1.073127, -0.4545403, -3.336111, 1, 0.7607843, 0, 1,
-1.072705, -0.1575299, -2.147542, 1, 0.7686275, 0, 1,
-1.067268, 0.7424878, -0.8431536, 1, 0.772549, 0, 1,
-1.064382, 1.41727, -0.6900657, 1, 0.7803922, 0, 1,
-1.05981, -1.273933, -1.838916, 1, 0.7843137, 0, 1,
-1.055665, -0.04598899, -1.251684, 1, 0.7921569, 0, 1,
-1.055262, 0.563238, -0.1482624, 1, 0.7960784, 0, 1,
-1.04276, -1.092084, -2.174259, 1, 0.8039216, 0, 1,
-1.042016, 2.03842, -0.9427529, 1, 0.8117647, 0, 1,
-1.039225, 0.7377489, -2.261305, 1, 0.8156863, 0, 1,
-1.037733, -0.566936, -2.230289, 1, 0.8235294, 0, 1,
-1.037374, -0.9789978, -2.142297, 1, 0.827451, 0, 1,
-1.032117, -1.936153, -2.807819, 1, 0.8352941, 0, 1,
-1.03199, 1.028667, -1.633698, 1, 0.8392157, 0, 1,
-1.020937, 0.2157318, -1.782346, 1, 0.8470588, 0, 1,
-1.019376, 1.909351, 1.134961, 1, 0.8509804, 0, 1,
-1.018744, -0.367067, -2.462898, 1, 0.8588235, 0, 1,
-1.011524, 1.456735, -1.90041, 1, 0.8627451, 0, 1,
-1.009346, -0.6559764, -0.6329783, 1, 0.8705882, 0, 1,
-1.009198, 0.6891702, 0.9819128, 1, 0.8745098, 0, 1,
-1.007723, -1.247669, -1.345968, 1, 0.8823529, 0, 1,
-1.002513, 0.5612998, -1.422708, 1, 0.8862745, 0, 1,
-0.9947674, -0.1158928, -2.393589, 1, 0.8941177, 0, 1,
-0.9939376, 1.337713, -0.4587788, 1, 0.8980392, 0, 1,
-0.9893142, 1.019137, -1.212254, 1, 0.9058824, 0, 1,
-0.9878681, -0.8655689, -1.414705, 1, 0.9137255, 0, 1,
-0.9695519, -0.2669782, -1.998414, 1, 0.9176471, 0, 1,
-0.968623, 0.4682476, -1.736508, 1, 0.9254902, 0, 1,
-0.9629809, 0.2144605, -0.7030446, 1, 0.9294118, 0, 1,
-0.9600526, -0.5064585, -1.64403, 1, 0.9372549, 0, 1,
-0.9583306, 0.3534832, 0.6107248, 1, 0.9411765, 0, 1,
-0.9550944, -1.698696, -2.780239, 1, 0.9490196, 0, 1,
-0.9529332, 0.01278445, -2.010748, 1, 0.9529412, 0, 1,
-0.952335, -0.03553269, -2.734929, 1, 0.9607843, 0, 1,
-0.9473358, 1.256863, -0.7913381, 1, 0.9647059, 0, 1,
-0.9444209, -0.4602507, -1.554507, 1, 0.972549, 0, 1,
-0.93592, -0.1164053, 0.01025557, 1, 0.9764706, 0, 1,
-0.931401, 0.1233169, -3.154908, 1, 0.9843137, 0, 1,
-0.9293054, -1.308049, -2.13585, 1, 0.9882353, 0, 1,
-0.9289202, -0.2245914, 1.012409, 1, 0.9960784, 0, 1,
-0.9287505, 0.9442196, -0.6678546, 0.9960784, 1, 0, 1,
-0.9233058, 0.4695863, 0.0620282, 0.9921569, 1, 0, 1,
-0.9217668, 0.7385982, -1.854282, 0.9843137, 1, 0, 1,
-0.9209235, 0.07325035, -0.07681626, 0.9803922, 1, 0, 1,
-0.9003158, -0.5744143, -2.715165, 0.972549, 1, 0, 1,
-0.8978727, 0.4056799, -1.115535, 0.9686275, 1, 0, 1,
-0.8978126, -1.818541, -0.03438003, 0.9607843, 1, 0, 1,
-0.8974007, -0.5020557, -2.521925, 0.9568627, 1, 0, 1,
-0.8971225, -0.7357808, -4.392387, 0.9490196, 1, 0, 1,
-0.8941045, -0.1556393, -0.8882503, 0.945098, 1, 0, 1,
-0.8924594, 0.3303055, -0.09583022, 0.9372549, 1, 0, 1,
-0.8894448, 0.5402241, -2.414314, 0.9333333, 1, 0, 1,
-0.881963, -1.082522, -3.935479, 0.9254902, 1, 0, 1,
-0.8816972, -0.2989843, -2.85443, 0.9215686, 1, 0, 1,
-0.8754826, 1.864572, 0.06069356, 0.9137255, 1, 0, 1,
-0.8632047, -0.2553095, -1.94799, 0.9098039, 1, 0, 1,
-0.860388, 0.7447109, -0.664407, 0.9019608, 1, 0, 1,
-0.8552721, -0.07341066, -2.83207, 0.8941177, 1, 0, 1,
-0.8507358, 0.6083366, -0.6194828, 0.8901961, 1, 0, 1,
-0.8471494, 0.2519129, -1.106367, 0.8823529, 1, 0, 1,
-0.8461211, 0.06360726, -3.248154, 0.8784314, 1, 0, 1,
-0.8455381, 0.919465, 1.476984, 0.8705882, 1, 0, 1,
-0.8354335, 0.8755727, -1.427198, 0.8666667, 1, 0, 1,
-0.8280768, -0.2891564, -1.29231, 0.8588235, 1, 0, 1,
-0.8218028, 0.5843233, -1.803321, 0.854902, 1, 0, 1,
-0.8216466, -0.05919932, -1.624135, 0.8470588, 1, 0, 1,
-0.8207752, -0.3867305, -2.725917, 0.8431373, 1, 0, 1,
-0.812675, -0.3577474, -1.803054, 0.8352941, 1, 0, 1,
-0.8111135, -0.5681753, -1.112411, 0.8313726, 1, 0, 1,
-0.8039671, -0.4527166, -0.8268492, 0.8235294, 1, 0, 1,
-0.8030549, 1.203298, -0.9680325, 0.8196079, 1, 0, 1,
-0.7996809, 0.145629, 0.8047435, 0.8117647, 1, 0, 1,
-0.7974337, 0.5780017, 0.05857914, 0.8078431, 1, 0, 1,
-0.7878659, 0.4527117, -2.485761, 0.8, 1, 0, 1,
-0.7854301, -0.09048929, 0.2000633, 0.7921569, 1, 0, 1,
-0.7846691, -0.8737751, -1.56499, 0.7882353, 1, 0, 1,
-0.7800019, -0.4250845, -2.816403, 0.7803922, 1, 0, 1,
-0.771119, -1.653332, -3.571034, 0.7764706, 1, 0, 1,
-0.7692943, -0.2446234, -1.782789, 0.7686275, 1, 0, 1,
-0.764568, -2.438292, -2.479601, 0.7647059, 1, 0, 1,
-0.759114, -0.9221374, -2.44675, 0.7568628, 1, 0, 1,
-0.7516539, 1.288516, 0.9881185, 0.7529412, 1, 0, 1,
-0.7471153, 0.2095665, -0.6559115, 0.7450981, 1, 0, 1,
-0.7426323, 0.730119, -1.593407, 0.7411765, 1, 0, 1,
-0.7424443, 0.04830277, -1.19813, 0.7333333, 1, 0, 1,
-0.7363791, -0.8443387, -1.757145, 0.7294118, 1, 0, 1,
-0.7328805, 1.254339, -0.3463947, 0.7215686, 1, 0, 1,
-0.732025, 0.711275, -1.42395, 0.7176471, 1, 0, 1,
-0.7303002, 1.084337, -1.375632, 0.7098039, 1, 0, 1,
-0.7297396, 0.6923182, -0.2724802, 0.7058824, 1, 0, 1,
-0.7258753, 0.4820805, 1.1725, 0.6980392, 1, 0, 1,
-0.7252974, 1.221111, -2.11915, 0.6901961, 1, 0, 1,
-0.7234322, -0.8357756, -1.739782, 0.6862745, 1, 0, 1,
-0.7198611, 0.3438149, -1.336847, 0.6784314, 1, 0, 1,
-0.7189701, -0.6956889, -1.397002, 0.6745098, 1, 0, 1,
-0.7159285, 0.5644782, -1.454759, 0.6666667, 1, 0, 1,
-0.7151113, 0.07799792, -0.7745252, 0.6627451, 1, 0, 1,
-0.712509, 0.6913954, -0.3927641, 0.654902, 1, 0, 1,
-0.7118656, -0.8324435, -2.261777, 0.6509804, 1, 0, 1,
-0.7109893, 0.02064701, -0.8182406, 0.6431373, 1, 0, 1,
-0.7001086, -0.03134068, -0.5374907, 0.6392157, 1, 0, 1,
-0.698024, -0.1096298, -1.65609, 0.6313726, 1, 0, 1,
-0.6812201, 1.141822, -0.244068, 0.627451, 1, 0, 1,
-0.6781, -1.696566, -2.761537, 0.6196079, 1, 0, 1,
-0.6752807, -0.5427615, -1.475543, 0.6156863, 1, 0, 1,
-0.6742302, -1.759891, -1.673041, 0.6078432, 1, 0, 1,
-0.6732123, -0.06955763, -1.968978, 0.6039216, 1, 0, 1,
-0.669595, -0.1528912, -0.3132755, 0.5960785, 1, 0, 1,
-0.668612, 0.8877195, -2.066657, 0.5882353, 1, 0, 1,
-0.6647807, 0.2828289, -1.218347, 0.5843138, 1, 0, 1,
-0.6612856, 1.235916, -0.6538478, 0.5764706, 1, 0, 1,
-0.6523118, -0.3126729, -2.165258, 0.572549, 1, 0, 1,
-0.6437888, 0.9182315, -1.643761, 0.5647059, 1, 0, 1,
-0.6405355, 0.0658439, -1.058336, 0.5607843, 1, 0, 1,
-0.6398022, -1.141324, -3.103024, 0.5529412, 1, 0, 1,
-0.6394579, -0.5260369, -1.033099, 0.5490196, 1, 0, 1,
-0.6377657, -0.9716133, -1.24927, 0.5411765, 1, 0, 1,
-0.632436, 0.3988582, -3.183627, 0.5372549, 1, 0, 1,
-0.6289548, 0.1686192, -1.563088, 0.5294118, 1, 0, 1,
-0.6199722, -1.17332, -2.169222, 0.5254902, 1, 0, 1,
-0.6188576, -0.5077251, -2.841171, 0.5176471, 1, 0, 1,
-0.6184738, 1.678129, -0.7962856, 0.5137255, 1, 0, 1,
-0.6163127, 0.1404217, -0.6033455, 0.5058824, 1, 0, 1,
-0.614705, -1.083148, -3.083627, 0.5019608, 1, 0, 1,
-0.6134661, -0.08010428, -2.139337, 0.4941176, 1, 0, 1,
-0.6129745, -0.4405372, -2.992231, 0.4862745, 1, 0, 1,
-0.6114861, 1.958401, -0.1937962, 0.4823529, 1, 0, 1,
-0.6111519, 1.958838, 0.6729258, 0.4745098, 1, 0, 1,
-0.6106185, -0.3004198, -1.062222, 0.4705882, 1, 0, 1,
-0.6092766, -0.2336138, -3.114899, 0.4627451, 1, 0, 1,
-0.6060556, 0.05408626, -0.7580433, 0.4588235, 1, 0, 1,
-0.6055772, -0.07447075, -1.654365, 0.4509804, 1, 0, 1,
-0.6045622, 0.5427589, -0.8044643, 0.4470588, 1, 0, 1,
-0.6007486, -0.3427691, -1.024406, 0.4392157, 1, 0, 1,
-0.5985219, -1.110327, -3.528844, 0.4352941, 1, 0, 1,
-0.594662, 0.7297176, -0.2219743, 0.427451, 1, 0, 1,
-0.5946447, -0.6343663, -3.481811, 0.4235294, 1, 0, 1,
-0.594001, -1.114715, -3.263688, 0.4156863, 1, 0, 1,
-0.5926521, 0.3604777, -0.6451606, 0.4117647, 1, 0, 1,
-0.5920933, -1.985074, -3.367478, 0.4039216, 1, 0, 1,
-0.5911129, 0.5196418, -1.106413, 0.3960784, 1, 0, 1,
-0.582711, -0.5791867, -2.752291, 0.3921569, 1, 0, 1,
-0.5754735, 0.5118906, -0.5294052, 0.3843137, 1, 0, 1,
-0.573506, -0.03785517, -2.580239, 0.3803922, 1, 0, 1,
-0.5729169, 0.1434351, -1.962997, 0.372549, 1, 0, 1,
-0.5703457, 1.04167, -1.674557, 0.3686275, 1, 0, 1,
-0.5702061, -1.168501, -2.324975, 0.3607843, 1, 0, 1,
-0.5697348, -0.4081357, -0.8571156, 0.3568628, 1, 0, 1,
-0.5685779, -1.52204, -2.325323, 0.3490196, 1, 0, 1,
-0.5646952, -0.7160457, -3.917407, 0.345098, 1, 0, 1,
-0.5605224, 0.564603, -0.375121, 0.3372549, 1, 0, 1,
-0.5601321, 0.03407294, -1.952626, 0.3333333, 1, 0, 1,
-0.5600843, 0.6815155, 0.1013037, 0.3254902, 1, 0, 1,
-0.5532703, 0.565824, -1.262506, 0.3215686, 1, 0, 1,
-0.5522752, -0.7597618, -3.060354, 0.3137255, 1, 0, 1,
-0.5502748, 0.07606331, -3.042701, 0.3098039, 1, 0, 1,
-0.5486801, 1.398476, -1.115537, 0.3019608, 1, 0, 1,
-0.5483746, 1.558282, -0.06970679, 0.2941177, 1, 0, 1,
-0.5477847, 0.6601039, -1.48379, 0.2901961, 1, 0, 1,
-0.5466872, 1.695961, -1.062783, 0.282353, 1, 0, 1,
-0.5459228, -0.2182949, -2.095274, 0.2784314, 1, 0, 1,
-0.5440336, 0.8732374, 0.614456, 0.2705882, 1, 0, 1,
-0.5405963, -0.3001675, -4.089257, 0.2666667, 1, 0, 1,
-0.5351843, -1.041226, -0.6657562, 0.2588235, 1, 0, 1,
-0.5331315, 0.7881747, 0.8312181, 0.254902, 1, 0, 1,
-0.5327098, -1.266056, -2.766263, 0.2470588, 1, 0, 1,
-0.5232615, 0.5463867, -0.7050235, 0.2431373, 1, 0, 1,
-0.5202515, -0.3321993, -1.495749, 0.2352941, 1, 0, 1,
-0.5180951, 0.2749023, -1.864338, 0.2313726, 1, 0, 1,
-0.5168301, 0.6324857, -0.1568756, 0.2235294, 1, 0, 1,
-0.505865, -1.424884, -3.706865, 0.2196078, 1, 0, 1,
-0.5056766, -1.194199, -1.751749, 0.2117647, 1, 0, 1,
-0.5018812, -0.1056857, -0.6915035, 0.2078431, 1, 0, 1,
-0.5014338, -0.1061235, -1.909845, 0.2, 1, 0, 1,
-0.4999891, 0.9101428, 1.792109, 0.1921569, 1, 0, 1,
-0.4943484, -0.5644432, -1.778719, 0.1882353, 1, 0, 1,
-0.4819537, 0.4783119, -0.4259635, 0.1803922, 1, 0, 1,
-0.4817729, 1.366223, 2.275979, 0.1764706, 1, 0, 1,
-0.4801297, -1.212563, -4.229717, 0.1686275, 1, 0, 1,
-0.4766878, 0.5613171, 0.6040424, 0.1647059, 1, 0, 1,
-0.4751741, -0.6457129, -1.041709, 0.1568628, 1, 0, 1,
-0.4715336, 0.2966059, 0.1065124, 0.1529412, 1, 0, 1,
-0.4597659, 1.291932, 0.3672001, 0.145098, 1, 0, 1,
-0.4590643, 0.6894964, -0.4077044, 0.1411765, 1, 0, 1,
-0.4567058, 1.070489, -1.639586, 0.1333333, 1, 0, 1,
-0.4510566, 0.4532127, -1.560994, 0.1294118, 1, 0, 1,
-0.4461767, -1.668134, -1.541073, 0.1215686, 1, 0, 1,
-0.4458512, 0.139289, -1.537738, 0.1176471, 1, 0, 1,
-0.4401512, 0.4939783, -0.294475, 0.1098039, 1, 0, 1,
-0.4400797, 0.7054113, -1.457643, 0.1058824, 1, 0, 1,
-0.4392694, 0.5672789, -1.962355, 0.09803922, 1, 0, 1,
-0.4352854, -0.2940525, -2.411515, 0.09019608, 1, 0, 1,
-0.4343853, -0.5227903, -2.765302, 0.08627451, 1, 0, 1,
-0.4263296, -0.6895841, -2.359207, 0.07843138, 1, 0, 1,
-0.4236937, -0.5121849, -2.839048, 0.07450981, 1, 0, 1,
-0.4212363, -1.071988, -3.678608, 0.06666667, 1, 0, 1,
-0.420164, 1.458095, -0.07245543, 0.0627451, 1, 0, 1,
-0.4197223, -0.4916417, -1.954034, 0.05490196, 1, 0, 1,
-0.4195936, -0.7080405, -3.078672, 0.05098039, 1, 0, 1,
-0.4181006, -0.2197393, -2.80152, 0.04313726, 1, 0, 1,
-0.4103211, 0.1799016, -2.19813, 0.03921569, 1, 0, 1,
-0.4094283, 1.014378, -0.7921056, 0.03137255, 1, 0, 1,
-0.4070201, -0.6937231, -4.889598, 0.02745098, 1, 0, 1,
-0.4062847, -0.6519361, -3.554897, 0.01960784, 1, 0, 1,
-0.4050844, 1.170888, 0.5075017, 0.01568628, 1, 0, 1,
-0.3989148, 0.7100387, -2.308732, 0.007843138, 1, 0, 1,
-0.3959001, 1.421163, -1.928752, 0.003921569, 1, 0, 1,
-0.3872791, -1.770022, -2.487723, 0, 1, 0.003921569, 1,
-0.3852713, 1.222653, -0.4215356, 0, 1, 0.01176471, 1,
-0.3835464, -0.398008, -2.803396, 0, 1, 0.01568628, 1,
-0.3805259, -0.4146035, -2.399718, 0, 1, 0.02352941, 1,
-0.375154, 1.358199, -1.510307, 0, 1, 0.02745098, 1,
-0.3749813, 1.526556, 1.256575, 0, 1, 0.03529412, 1,
-0.3748466, 0.8988684, 0.3325935, 0, 1, 0.03921569, 1,
-0.3739242, 0.7346348, -1.935918, 0, 1, 0.04705882, 1,
-0.3730309, -0.2809865, -3.338598, 0, 1, 0.05098039, 1,
-0.3595501, 0.2706042, 0.752634, 0, 1, 0.05882353, 1,
-0.3572393, 0.431624, 0.6473436, 0, 1, 0.0627451, 1,
-0.3542363, 0.1783495, -0.4307925, 0, 1, 0.07058824, 1,
-0.3539418, 0.2702816, -2.330077, 0, 1, 0.07450981, 1,
-0.3485691, 2.704973, -0.8310866, 0, 1, 0.08235294, 1,
-0.3470472, -1.896759, -2.517583, 0, 1, 0.08627451, 1,
-0.3448297, -1.644225, -1.970538, 0, 1, 0.09411765, 1,
-0.3439581, 1.237539, -1.392896, 0, 1, 0.1019608, 1,
-0.3398871, 0.7848094, -0.06265996, 0, 1, 0.1058824, 1,
-0.3385968, -0.7647719, -2.277049, 0, 1, 0.1137255, 1,
-0.3382963, -2.574133, -3.87894, 0, 1, 0.1176471, 1,
-0.3377735, -0.2471362, -2.624071, 0, 1, 0.1254902, 1,
-0.3344242, -1.463707, -4.525326, 0, 1, 0.1294118, 1,
-0.3266084, -0.600063, -1.894856, 0, 1, 0.1372549, 1,
-0.3245042, -1.790327, -3.368226, 0, 1, 0.1411765, 1,
-0.3160307, -0.4062772, -2.412549, 0, 1, 0.1490196, 1,
-0.3136444, 0.3167506, -1.538864, 0, 1, 0.1529412, 1,
-0.3131791, -0.5421084, -2.077295, 0, 1, 0.1607843, 1,
-0.3089191, 0.2794867, -0.2211998, 0, 1, 0.1647059, 1,
-0.3086731, -1.397122, -3.006684, 0, 1, 0.172549, 1,
-0.308254, -0.21169, -1.919859, 0, 1, 0.1764706, 1,
-0.3064609, 1.850146, 0.1908569, 0, 1, 0.1843137, 1,
-0.3022916, 0.6319785, -0.2189795, 0, 1, 0.1882353, 1,
-0.2997572, 0.4891622, -1.90607, 0, 1, 0.1960784, 1,
-0.2922598, -1.14385, -2.555476, 0, 1, 0.2039216, 1,
-0.2915216, -0.5171561, -1.59227, 0, 1, 0.2078431, 1,
-0.2890358, -0.3963633, -1.710322, 0, 1, 0.2156863, 1,
-0.2878304, -0.006824987, -1.552083, 0, 1, 0.2196078, 1,
-0.2875421, 1.026157, 1.467127, 0, 1, 0.227451, 1,
-0.2825289, 0.5823269, -1.40862, 0, 1, 0.2313726, 1,
-0.278619, 1.571663, -0.4049582, 0, 1, 0.2392157, 1,
-0.2767551, -1.486976, -2.182156, 0, 1, 0.2431373, 1,
-0.2759488, 0.3719072, 0.4733964, 0, 1, 0.2509804, 1,
-0.2752446, -1.327343, -4.575481, 0, 1, 0.254902, 1,
-0.2734191, -1.546369, -4.200724, 0, 1, 0.2627451, 1,
-0.2726754, 0.5667268, -0.4249731, 0, 1, 0.2666667, 1,
-0.2710878, -0.2427805, -1.018453, 0, 1, 0.2745098, 1,
-0.2705538, 0.6484103, -1.599714, 0, 1, 0.2784314, 1,
-0.2671306, -1.31493, -3.738357, 0, 1, 0.2862745, 1,
-0.2667701, 0.4704937, -0.6048514, 0, 1, 0.2901961, 1,
-0.2662511, -1.718313, -2.703777, 0, 1, 0.2980392, 1,
-0.261626, -0.3270477, -0.9884526, 0, 1, 0.3058824, 1,
-0.2608238, 0.08425419, -1.181649, 0, 1, 0.3098039, 1,
-0.2493533, 1.885786, 0.09525497, 0, 1, 0.3176471, 1,
-0.2485601, -1.111973, -3.649489, 0, 1, 0.3215686, 1,
-0.2432192, -0.6018015, -1.891131, 0, 1, 0.3294118, 1,
-0.2370193, 0.2619981, 1.100719, 0, 1, 0.3333333, 1,
-0.2265269, -0.1792584, -5.319489, 0, 1, 0.3411765, 1,
-0.222709, -0.7426825, -2.587188, 0, 1, 0.345098, 1,
-0.2221569, 0.7933397, -0.5486422, 0, 1, 0.3529412, 1,
-0.218029, 0.7468265, -0.5344549, 0, 1, 0.3568628, 1,
-0.2127528, -1.810392, -2.6066, 0, 1, 0.3647059, 1,
-0.2121243, -1.263458, -1.881927, 0, 1, 0.3686275, 1,
-0.2063866, -1.779783, -3.574094, 0, 1, 0.3764706, 1,
-0.2063295, -0.09992988, -1.810395, 0, 1, 0.3803922, 1,
-0.2000673, 1.760168, -0.9130292, 0, 1, 0.3882353, 1,
-0.1989757, -0.08925298, -2.094416, 0, 1, 0.3921569, 1,
-0.1980419, 1.052518, -0.167154, 0, 1, 0.4, 1,
-0.1970437, 0.09423582, -2.517032, 0, 1, 0.4078431, 1,
-0.1965079, 0.3085838, 1.319773, 0, 1, 0.4117647, 1,
-0.1964685, -2.106005, -5.27673, 0, 1, 0.4196078, 1,
-0.1955599, 1.099202, -0.09253498, 0, 1, 0.4235294, 1,
-0.1927327, -1.399983, -2.534394, 0, 1, 0.4313726, 1,
-0.1921521, 0.6913677, -0.8691807, 0, 1, 0.4352941, 1,
-0.1918339, -1.310677, -2.965472, 0, 1, 0.4431373, 1,
-0.1883947, 1.039758, -1.869441, 0, 1, 0.4470588, 1,
-0.1879931, -1.16552, -2.977088, 0, 1, 0.454902, 1,
-0.1871007, 0.8324254, 1.671486, 0, 1, 0.4588235, 1,
-0.1862481, -0.3819842, -2.681086, 0, 1, 0.4666667, 1,
-0.1839684, -0.1012364, -1.247128, 0, 1, 0.4705882, 1,
-0.1830169, 0.5016502, -1.864368, 0, 1, 0.4784314, 1,
-0.1810851, -0.4350411, -2.726431, 0, 1, 0.4823529, 1,
-0.1784147, 0.3213209, -0.1119414, 0, 1, 0.4901961, 1,
-0.1782135, -0.102899, -0.5377889, 0, 1, 0.4941176, 1,
-0.1774989, -2.135584, -3.397091, 0, 1, 0.5019608, 1,
-0.1746456, 0.1609269, -0.256546, 0, 1, 0.509804, 1,
-0.1735987, -1.255928, -4.777366, 0, 1, 0.5137255, 1,
-0.1715196, 2.019621, 0.1034577, 0, 1, 0.5215687, 1,
-0.1674132, 2.05124, 0.5595043, 0, 1, 0.5254902, 1,
-0.1627548, -1.018442, -3.749511, 0, 1, 0.5333334, 1,
-0.1618912, 0.7401179, -1.832631, 0, 1, 0.5372549, 1,
-0.1590901, 2.818838, 0.4761611, 0, 1, 0.5450981, 1,
-0.1587941, 0.6387042, -0.4150578, 0, 1, 0.5490196, 1,
-0.1570078, -0.8074983, -3.865862, 0, 1, 0.5568628, 1,
-0.1492635, 1.855246, 0.4882043, 0, 1, 0.5607843, 1,
-0.1486536, 0.2425989, 0.09609281, 0, 1, 0.5686275, 1,
-0.1486375, 0.6206741, -1.261538, 0, 1, 0.572549, 1,
-0.1462115, -0.5508138, -3.407414, 0, 1, 0.5803922, 1,
-0.1356471, -0.1044643, -3.855698, 0, 1, 0.5843138, 1,
-0.1320065, 2.107562, -0.1211083, 0, 1, 0.5921569, 1,
-0.1233474, -1.122736, -1.851609, 0, 1, 0.5960785, 1,
-0.1232508, 1.268022, -0.9192007, 0, 1, 0.6039216, 1,
-0.1151406, 0.2613775, 0.2074782, 0, 1, 0.6117647, 1,
-0.1119852, -0.7985404, -1.811482, 0, 1, 0.6156863, 1,
-0.1105251, -0.06255639, -3.858353, 0, 1, 0.6235294, 1,
-0.1104297, -0.8931261, -2.695706, 0, 1, 0.627451, 1,
-0.1097583, -1.246025, -2.182062, 0, 1, 0.6352941, 1,
-0.1075958, 0.4183081, -0.2775577, 0, 1, 0.6392157, 1,
-0.106942, -1.183225, -4.220422, 0, 1, 0.6470588, 1,
-0.1068654, 1.604149, 0.2997956, 0, 1, 0.6509804, 1,
-0.1041826, 2.089541, 0.8499933, 0, 1, 0.6588235, 1,
-0.1037904, -0.7662769, -3.337292, 0, 1, 0.6627451, 1,
-0.1013125, -0.55506, -1.897587, 0, 1, 0.6705883, 1,
-0.1012364, 0.1847502, -0.6438913, 0, 1, 0.6745098, 1,
-0.09913272, -0.697942, -3.78009, 0, 1, 0.682353, 1,
-0.09686507, 1.474739, -0.3539668, 0, 1, 0.6862745, 1,
-0.09594984, 1.554098, -1.087884, 0, 1, 0.6941177, 1,
-0.09488296, -0.3340568, -1.449216, 0, 1, 0.7019608, 1,
-0.09434503, -1.711701, -2.125662, 0, 1, 0.7058824, 1,
-0.09358034, -0.1483382, -2.805306, 0, 1, 0.7137255, 1,
-0.09168833, -0.5398254, -2.770251, 0, 1, 0.7176471, 1,
-0.09160393, -0.6150669, -2.274856, 0, 1, 0.7254902, 1,
-0.08682752, -0.6776873, -3.994335, 0, 1, 0.7294118, 1,
-0.0861036, -0.4269284, -3.210406, 0, 1, 0.7372549, 1,
-0.08585191, -0.7368203, -2.103298, 0, 1, 0.7411765, 1,
-0.08544773, -0.3139653, -2.475704, 0, 1, 0.7490196, 1,
-0.08438233, -0.4680383, -2.414867, 0, 1, 0.7529412, 1,
-0.08221246, 0.4680246, 0.02390129, 0, 1, 0.7607843, 1,
-0.08057559, 1.439784, -0.3007125, 0, 1, 0.7647059, 1,
-0.07786737, 0.7166734, -0.0002722104, 0, 1, 0.772549, 1,
-0.07421717, -0.1557412, -3.774489, 0, 1, 0.7764706, 1,
-0.07163093, 0.654811, 0.08285294, 0, 1, 0.7843137, 1,
-0.06974641, 1.715169, 0.4020634, 0, 1, 0.7882353, 1,
-0.06962649, -1.323991, -3.78262, 0, 1, 0.7960784, 1,
-0.06903651, -0.9815147, -3.603672, 0, 1, 0.8039216, 1,
-0.06708509, 0.4960282, -0.5553911, 0, 1, 0.8078431, 1,
-0.05799657, 0.03081302, -2.232266, 0, 1, 0.8156863, 1,
-0.05644699, -0.3184821, -3.280162, 0, 1, 0.8196079, 1,
-0.05457919, 1.795471, -0.04448861, 0, 1, 0.827451, 1,
-0.04882755, -0.3456067, -3.970241, 0, 1, 0.8313726, 1,
-0.04319638, 1.313572, 1.317069, 0, 1, 0.8392157, 1,
-0.03801785, -1.81995, -0.819216, 0, 1, 0.8431373, 1,
-0.03761452, 1.775846, -0.9221345, 0, 1, 0.8509804, 1,
-0.03470845, -1.401738, -3.080695, 0, 1, 0.854902, 1,
-0.03402154, 1.584773, 1.519131, 0, 1, 0.8627451, 1,
-0.02717892, -2.029596, -3.059796, 0, 1, 0.8666667, 1,
-0.02480189, 1.152821, 0.0920574, 0, 1, 0.8745098, 1,
-0.02318683, -1.422343, -4.295965, 0, 1, 0.8784314, 1,
-0.01908986, 1.510146, -1.229032, 0, 1, 0.8862745, 1,
-0.0169911, 0.4605452, -0.5054309, 0, 1, 0.8901961, 1,
-0.008685132, -0.3732037, -3.618358, 0, 1, 0.8980392, 1,
-0.008030506, -0.3234922, -4.676092, 0, 1, 0.9058824, 1,
-0.007880324, 1.940429, 0.6739706, 0, 1, 0.9098039, 1,
-0.004063242, 0.1370104, 2.200924, 0, 1, 0.9176471, 1,
-0.003239815, 1.683685, 1.2579, 0, 1, 0.9215686, 1,
-0.0007814416, -1.182148, -3.624344, 0, 1, 0.9294118, 1,
-8.271243e-05, 0.0120004, -0.06088553, 0, 1, 0.9333333, 1,
0.003211565, 0.7103931, -1.037969, 0, 1, 0.9411765, 1,
0.01062494, 0.5741652, -1.202985, 0, 1, 0.945098, 1,
0.01288232, -0.0406034, 2.794407, 0, 1, 0.9529412, 1,
0.01517637, -0.4251719, 4.23827, 0, 1, 0.9568627, 1,
0.01671211, -0.6390563, 1.837324, 0, 1, 0.9647059, 1,
0.0178686, 1.595112, 0.465538, 0, 1, 0.9686275, 1,
0.02176488, -0.6365827, 3.621181, 0, 1, 0.9764706, 1,
0.02297719, -0.3055979, 2.924678, 0, 1, 0.9803922, 1,
0.0235572, 0.002297624, 0.9084291, 0, 1, 0.9882353, 1,
0.02531048, 0.9182666, 0.4142263, 0, 1, 0.9921569, 1,
0.02827499, 0.6903211, 0.3901671, 0, 1, 1, 1,
0.03037653, -0.7793024, 1.725307, 0, 0.9921569, 1, 1,
0.03722348, -0.9922637, 2.94039, 0, 0.9882353, 1, 1,
0.03939909, -0.6890312, 4.057378, 0, 0.9803922, 1, 1,
0.03969366, 0.09760966, 0.1905959, 0, 0.9764706, 1, 1,
0.04174605, -1.161344, 3.317002, 0, 0.9686275, 1, 1,
0.04265255, -1.42441, 2.130158, 0, 0.9647059, 1, 1,
0.04508937, 0.00117782, 1.848382, 0, 0.9568627, 1, 1,
0.05115838, 0.4392646, 0.9258472, 0, 0.9529412, 1, 1,
0.05118152, -0.2652745, 1.615603, 0, 0.945098, 1, 1,
0.05545413, 0.06859986, -0.2092111, 0, 0.9411765, 1, 1,
0.05828267, 0.2529951, -1.439149, 0, 0.9333333, 1, 1,
0.0598059, 1.193172, 0.5663052, 0, 0.9294118, 1, 1,
0.06056055, 0.2509459, 1.100332, 0, 0.9215686, 1, 1,
0.06813321, -1.128174, 4.969724, 0, 0.9176471, 1, 1,
0.0696905, 0.2721547, 1.662288, 0, 0.9098039, 1, 1,
0.07614033, -0.3203563, 1.164151, 0, 0.9058824, 1, 1,
0.08486264, 2.851223, 2.402306, 0, 0.8980392, 1, 1,
0.0867901, 0.9689215, -0.528194, 0, 0.8901961, 1, 1,
0.08840246, -1.959547, 3.831897, 0, 0.8862745, 1, 1,
0.09074315, 0.5831265, 1.853123, 0, 0.8784314, 1, 1,
0.09405093, 0.6853689, 0.02538394, 0, 0.8745098, 1, 1,
0.09692639, 0.9829753, 1.819514, 0, 0.8666667, 1, 1,
0.09720373, -0.4504278, 3.071227, 0, 0.8627451, 1, 1,
0.09989826, -0.9534347, 4.061445, 0, 0.854902, 1, 1,
0.1002839, 0.06894822, 0.2838371, 0, 0.8509804, 1, 1,
0.1022939, -0.2015148, 3.249192, 0, 0.8431373, 1, 1,
0.1069367, -0.9853249, 2.747708, 0, 0.8392157, 1, 1,
0.1078758, 1.001448, 0.8142501, 0, 0.8313726, 1, 1,
0.1146988, 0.1162559, 1.607737, 0, 0.827451, 1, 1,
0.1163168, 1.862543, -1.270994, 0, 0.8196079, 1, 1,
0.1163703, -0.4546341, 2.138231, 0, 0.8156863, 1, 1,
0.1165545, -1.739836, 3.72088, 0, 0.8078431, 1, 1,
0.1258795, -1.254376, 3.03274, 0, 0.8039216, 1, 1,
0.1268917, -0.9623024, 2.543539, 0, 0.7960784, 1, 1,
0.1336717, 0.6889351, -0.0923214, 0, 0.7882353, 1, 1,
0.1357895, -2.510207, 3.412071, 0, 0.7843137, 1, 1,
0.1359083, -0.2891914, 4.587772, 0, 0.7764706, 1, 1,
0.1360337, -0.2044464, 0.5669181, 0, 0.772549, 1, 1,
0.1390229, 0.9065457, -1.19662, 0, 0.7647059, 1, 1,
0.13938, 0.752641, 1.508109, 0, 0.7607843, 1, 1,
0.1414357, -0.9819165, 2.272945, 0, 0.7529412, 1, 1,
0.1430026, 0.7430648, -0.4684654, 0, 0.7490196, 1, 1,
0.1430072, 1.17741, -0.3617123, 0, 0.7411765, 1, 1,
0.1447588, 0.7724161, 0.3065276, 0, 0.7372549, 1, 1,
0.1452426, 0.1347068, 1.165317, 0, 0.7294118, 1, 1,
0.1462959, 1.498419, -0.05833714, 0, 0.7254902, 1, 1,
0.1517223, 0.5362864, -1.602197, 0, 0.7176471, 1, 1,
0.1544493, 0.55507, -1.485296, 0, 0.7137255, 1, 1,
0.154523, -0.3864132, 2.724181, 0, 0.7058824, 1, 1,
0.1546657, -1.147018, 4.38426, 0, 0.6980392, 1, 1,
0.1576457, 1.089469, -0.1191272, 0, 0.6941177, 1, 1,
0.1657934, 0.537918, -0.5236765, 0, 0.6862745, 1, 1,
0.167304, -0.5455871, 3.782134, 0, 0.682353, 1, 1,
0.1700144, 0.1695005, 1.3604, 0, 0.6745098, 1, 1,
0.1700772, 0.384619, 1.12583, 0, 0.6705883, 1, 1,
0.1716038, 0.7423173, -0.9362143, 0, 0.6627451, 1, 1,
0.1762751, -0.5919949, 5.116709, 0, 0.6588235, 1, 1,
0.182347, -0.3430814, 3.211895, 0, 0.6509804, 1, 1,
0.1911821, 2.004404, 0.407625, 0, 0.6470588, 1, 1,
0.1926419, 1.064339, 0.3294479, 0, 0.6392157, 1, 1,
0.1954059, -0.760909, 3.299577, 0, 0.6352941, 1, 1,
0.1992043, 1.934923, -0.1181068, 0, 0.627451, 1, 1,
0.2050798, -0.1714778, 2.241248, 0, 0.6235294, 1, 1,
0.2094628, -0.8564657, 4.93713, 0, 0.6156863, 1, 1,
0.210694, -0.1814153, 1.059054, 0, 0.6117647, 1, 1,
0.2116595, -0.4076427, 2.710946, 0, 0.6039216, 1, 1,
0.2136495, -1.018835, 2.1557, 0, 0.5960785, 1, 1,
0.213734, -0.3682973, 2.360274, 0, 0.5921569, 1, 1,
0.2139377, -0.4095882, 2.542788, 0, 0.5843138, 1, 1,
0.2143845, -1.515269, 2.946515, 0, 0.5803922, 1, 1,
0.2161055, 0.3204051, -0.0361793, 0, 0.572549, 1, 1,
0.2179369, 0.81519, 0.102715, 0, 0.5686275, 1, 1,
0.2218174, 0.07036844, -0.4428193, 0, 0.5607843, 1, 1,
0.2229948, 0.03667868, -0.9267837, 0, 0.5568628, 1, 1,
0.2267139, 1.695338, 1.191159, 0, 0.5490196, 1, 1,
0.2284231, -0.5623727, 3.045158, 0, 0.5450981, 1, 1,
0.229466, -0.2387078, 1.474094, 0, 0.5372549, 1, 1,
0.2303881, 0.2340454, -0.5975284, 0, 0.5333334, 1, 1,
0.2333436, -1.287174, 3.45257, 0, 0.5254902, 1, 1,
0.2340305, -0.278974, 2.571524, 0, 0.5215687, 1, 1,
0.2350166, -0.6585687, 3.649983, 0, 0.5137255, 1, 1,
0.2359121, 0.1808802, 1.770925, 0, 0.509804, 1, 1,
0.2414458, -1.299465, 2.289724, 0, 0.5019608, 1, 1,
0.2415543, 1.780738, 2.333517, 0, 0.4941176, 1, 1,
0.2434821, -0.6388681, 3.842239, 0, 0.4901961, 1, 1,
0.2466137, 0.5389779, 0.1723063, 0, 0.4823529, 1, 1,
0.2499396, -0.09909852, 0.2420508, 0, 0.4784314, 1, 1,
0.2523051, -0.9263936, 2.835722, 0, 0.4705882, 1, 1,
0.2527813, -0.9454148, 1.261067, 0, 0.4666667, 1, 1,
0.2578754, 0.5012384, -1.12282, 0, 0.4588235, 1, 1,
0.2602444, -0.790965, 2.824984, 0, 0.454902, 1, 1,
0.2629442, 0.02185141, 1.757166, 0, 0.4470588, 1, 1,
0.2673487, -0.8208518, 1.841167, 0, 0.4431373, 1, 1,
0.2700193, -0.4148077, 2.148075, 0, 0.4352941, 1, 1,
0.2732558, -2.237971, 4.68275, 0, 0.4313726, 1, 1,
0.2781402, 1.699926, 0.3647647, 0, 0.4235294, 1, 1,
0.2825549, 0.4863232, 0.2660222, 0, 0.4196078, 1, 1,
0.2856765, 0.03082315, 1.558313, 0, 0.4117647, 1, 1,
0.2858061, 0.2303784, -1.713408, 0, 0.4078431, 1, 1,
0.2862872, 1.410357, -1.147576, 0, 0.4, 1, 1,
0.289049, 0.3418187, 1.071592, 0, 0.3921569, 1, 1,
0.2890565, -0.7446145, 4.054294, 0, 0.3882353, 1, 1,
0.290323, 1.15418, -0.7955051, 0, 0.3803922, 1, 1,
0.2907858, 0.09621944, 1.822604, 0, 0.3764706, 1, 1,
0.2941125, -2.548604, 5.564964, 0, 0.3686275, 1, 1,
0.2993161, -1.18964, 4.13752, 0, 0.3647059, 1, 1,
0.2994926, -1.77003, 3.534782, 0, 0.3568628, 1, 1,
0.3005518, 0.3895677, 0.08485347, 0, 0.3529412, 1, 1,
0.3006192, -0.3075722, 1.886264, 0, 0.345098, 1, 1,
0.3022291, -2.2004, 2.247572, 0, 0.3411765, 1, 1,
0.3033788, 1.469858, 1.126749, 0, 0.3333333, 1, 1,
0.3083685, -0.8502027, 0.9551492, 0, 0.3294118, 1, 1,
0.3089025, -0.7762892, 1.933388, 0, 0.3215686, 1, 1,
0.3111576, 0.8746526, 0.9652101, 0, 0.3176471, 1, 1,
0.3118059, -1.267401, 2.694535, 0, 0.3098039, 1, 1,
0.3119116, -0.224988, 3.056837, 0, 0.3058824, 1, 1,
0.3173121, 1.004968, -0.5326945, 0, 0.2980392, 1, 1,
0.317443, 0.01409725, 2.761541, 0, 0.2901961, 1, 1,
0.3182308, -1.180714, 3.330927, 0, 0.2862745, 1, 1,
0.320102, -0.5467603, 1.727747, 0, 0.2784314, 1, 1,
0.3261663, 0.8434162, 1.329473, 0, 0.2745098, 1, 1,
0.3278096, -0.5603642, 2.478698, 0, 0.2666667, 1, 1,
0.3298316, 0.5990139, -0.3596511, 0, 0.2627451, 1, 1,
0.3299895, 1.084558, 0.2955979, 0, 0.254902, 1, 1,
0.3316004, -2.154805, 3.159739, 0, 0.2509804, 1, 1,
0.3342815, 1.788893, -0.7838508, 0, 0.2431373, 1, 1,
0.3370075, -1.43228, 2.714845, 0, 0.2392157, 1, 1,
0.3377017, -1.586757, 3.676702, 0, 0.2313726, 1, 1,
0.3403204, 0.02298724, 2.880916, 0, 0.227451, 1, 1,
0.3406441, -1.241427, 2.540256, 0, 0.2196078, 1, 1,
0.3409559, 0.8869324, -0.3751096, 0, 0.2156863, 1, 1,
0.3501874, 0.5094073, 1.118188, 0, 0.2078431, 1, 1,
0.3516467, 1.014747, 2.592043, 0, 0.2039216, 1, 1,
0.3537919, -1.480186, 4.189404, 0, 0.1960784, 1, 1,
0.3573659, -0.2716591, 0.9320205, 0, 0.1882353, 1, 1,
0.363531, -0.8985894, 2.538112, 0, 0.1843137, 1, 1,
0.3643086, -0.9918042, 0.9643476, 0, 0.1764706, 1, 1,
0.3703405, -0.4360383, 2.547333, 0, 0.172549, 1, 1,
0.3710724, 0.4727316, 0.09838365, 0, 0.1647059, 1, 1,
0.3732071, 1.23808, 0.4961703, 0, 0.1607843, 1, 1,
0.3769147, -1.403289, 2.26289, 0, 0.1529412, 1, 1,
0.3777163, -0.3980937, 2.505577, 0, 0.1490196, 1, 1,
0.3798731, 0.4547388, 0.8332049, 0, 0.1411765, 1, 1,
0.3850498, 1.939849, 1.398498, 0, 0.1372549, 1, 1,
0.387644, 1.002113, -0.4573025, 0, 0.1294118, 1, 1,
0.3892691, 0.664152, 0.8250367, 0, 0.1254902, 1, 1,
0.3903528, 2.658857, -2.28232, 0, 0.1176471, 1, 1,
0.3937013, -1.015301, 3.170296, 0, 0.1137255, 1, 1,
0.3972235, 1.137378, 0.486297, 0, 0.1058824, 1, 1,
0.4009905, -1.201045, 3.85043, 0, 0.09803922, 1, 1,
0.4016059, -0.006531547, 1.512968, 0, 0.09411765, 1, 1,
0.404115, 1.796415, -0.5413259, 0, 0.08627451, 1, 1,
0.4062953, -0.1992046, 2.017016, 0, 0.08235294, 1, 1,
0.4140205, -1.86973, 2.827404, 0, 0.07450981, 1, 1,
0.4151798, 2.506903, 0.1909184, 0, 0.07058824, 1, 1,
0.4222877, -1.387028, 2.869307, 0, 0.0627451, 1, 1,
0.4244787, -0.02033262, 2.277413, 0, 0.05882353, 1, 1,
0.4336235, 0.8665899, 1.176032, 0, 0.05098039, 1, 1,
0.4402326, -0.5864114, 2.31188, 0, 0.04705882, 1, 1,
0.4444461, 1.33845, 1.116863, 0, 0.03921569, 1, 1,
0.4446467, -0.9628847, 1.931996, 0, 0.03529412, 1, 1,
0.4480295, 0.9170004, 1.189675, 0, 0.02745098, 1, 1,
0.4574413, 0.6130288, 1.781616, 0, 0.02352941, 1, 1,
0.4584804, -1.877486, 4.115842, 0, 0.01568628, 1, 1,
0.4595883, 0.2878774, 1.931175, 0, 0.01176471, 1, 1,
0.4637721, 0.6053419, 1.634876, 0, 0.003921569, 1, 1,
0.4642982, -0.1404175, 0.3766603, 0.003921569, 0, 1, 1,
0.4643908, 0.4866661, 0.7200386, 0.007843138, 0, 1, 1,
0.4724153, -0.8929955, 3.010755, 0.01568628, 0, 1, 1,
0.4750603, -0.7302386, 2.335681, 0.01960784, 0, 1, 1,
0.4756176, -0.2037506, 1.309706, 0.02745098, 0, 1, 1,
0.4789263, 0.8185303, -0.4532282, 0.03137255, 0, 1, 1,
0.4810276, 0.4277314, 0.4859762, 0.03921569, 0, 1, 1,
0.4838972, 2.088527, -1.157726, 0.04313726, 0, 1, 1,
0.4876262, -1.949583, 2.86144, 0.05098039, 0, 1, 1,
0.4957424, 0.3116442, 0.9417015, 0.05490196, 0, 1, 1,
0.5056517, 0.2346081, 2.41312, 0.0627451, 0, 1, 1,
0.5072308, -0.4122808, 2.929059, 0.06666667, 0, 1, 1,
0.5089649, -0.2650112, 1.803913, 0.07450981, 0, 1, 1,
0.5092925, -0.7952607, 2.197355, 0.07843138, 0, 1, 1,
0.5097249, -0.7531404, 3.888776, 0.08627451, 0, 1, 1,
0.5101868, -0.01557678, 1.588027, 0.09019608, 0, 1, 1,
0.5148208, -0.6734062, 0.607649, 0.09803922, 0, 1, 1,
0.5154679, -1.532275, 4.109059, 0.1058824, 0, 1, 1,
0.5232112, 0.5024931, -0.3397887, 0.1098039, 0, 1, 1,
0.5254103, -1.069443, 3.318761, 0.1176471, 0, 1, 1,
0.5295397, 1.907185, -0.7842169, 0.1215686, 0, 1, 1,
0.5299862, 0.2660291, 1.307365, 0.1294118, 0, 1, 1,
0.5300302, 0.1040725, 2.149697, 0.1333333, 0, 1, 1,
0.5349081, -0.7390482, 2.272666, 0.1411765, 0, 1, 1,
0.538926, 0.4830711, 0.6299772, 0.145098, 0, 1, 1,
0.5420805, 1.192849, 1.635963, 0.1529412, 0, 1, 1,
0.5440963, -2.084321, 3.046602, 0.1568628, 0, 1, 1,
0.5484813, 0.03408678, 0.3733657, 0.1647059, 0, 1, 1,
0.5494152, -1.864699, 1.48984, 0.1686275, 0, 1, 1,
0.5543022, -0.1066797, 1.851906, 0.1764706, 0, 1, 1,
0.5568893, 1.188565, 0.7703235, 0.1803922, 0, 1, 1,
0.5586543, 0.4216481, -0.1050606, 0.1882353, 0, 1, 1,
0.5600122, 0.06917393, 2.393273, 0.1921569, 0, 1, 1,
0.5686676, -0.9099048, 2.141476, 0.2, 0, 1, 1,
0.5692277, -1.288185, 2.706856, 0.2078431, 0, 1, 1,
0.5720965, -0.7651181, 2.22048, 0.2117647, 0, 1, 1,
0.5747555, 0.5721223, 0.626903, 0.2196078, 0, 1, 1,
0.5753892, -0.3095202, 2.840753, 0.2235294, 0, 1, 1,
0.5757894, 0.572507, 1.237453, 0.2313726, 0, 1, 1,
0.5863332, 1.321132, 0.9294189, 0.2352941, 0, 1, 1,
0.5915357, -2.001287, 1.527515, 0.2431373, 0, 1, 1,
0.5921331, -1.124394, 1.702147, 0.2470588, 0, 1, 1,
0.5999767, 0.4345803, 1.040322, 0.254902, 0, 1, 1,
0.6050778, 0.2196144, 1.343127, 0.2588235, 0, 1, 1,
0.606064, 1.148152, 1.577688, 0.2666667, 0, 1, 1,
0.6109858, -0.9246119, 2.313648, 0.2705882, 0, 1, 1,
0.6120481, 1.44378, 1.193414, 0.2784314, 0, 1, 1,
0.6155899, 0.6774043, 1.393623, 0.282353, 0, 1, 1,
0.6170344, -0.5501287, 3.664478, 0.2901961, 0, 1, 1,
0.6171437, 1.937706, -1.199503, 0.2941177, 0, 1, 1,
0.6181096, 0.2329471, 1.470773, 0.3019608, 0, 1, 1,
0.6188596, 0.1931172, 1.690261, 0.3098039, 0, 1, 1,
0.6243537, -2.388591, 3.722203, 0.3137255, 0, 1, 1,
0.6252434, 0.3076002, 0.926197, 0.3215686, 0, 1, 1,
0.6254941, 0.4388314, 2.385431, 0.3254902, 0, 1, 1,
0.626856, 0.5233466, 1.145612, 0.3333333, 0, 1, 1,
0.6308526, 0.279047, -0.06308161, 0.3372549, 0, 1, 1,
0.6310258, -1.275757, 2.250988, 0.345098, 0, 1, 1,
0.6327113, -1.310491, 3.391896, 0.3490196, 0, 1, 1,
0.6341704, -0.1174446, 1.8416, 0.3568628, 0, 1, 1,
0.6386726, -2.1382, 3.667715, 0.3607843, 0, 1, 1,
0.644717, 1.121995, 0.3583493, 0.3686275, 0, 1, 1,
0.6457525, 0.5095724, 1.065638, 0.372549, 0, 1, 1,
0.6499434, 0.2149568, -0.002710055, 0.3803922, 0, 1, 1,
0.6537905, -0.5448472, 2.437142, 0.3843137, 0, 1, 1,
0.6647786, -0.3896652, 2.841103, 0.3921569, 0, 1, 1,
0.6647797, 1.726491, 0.1066436, 0.3960784, 0, 1, 1,
0.6687636, -0.8580149, 2.529679, 0.4039216, 0, 1, 1,
0.6715002, 0.5952039, 2.243654, 0.4117647, 0, 1, 1,
0.6719404, -0.1484243, 1.435736, 0.4156863, 0, 1, 1,
0.6740021, 0.4881229, 0.084734, 0.4235294, 0, 1, 1,
0.6751326, -2.4762, 3.753283, 0.427451, 0, 1, 1,
0.6851619, 1.037399, -1.413759, 0.4352941, 0, 1, 1,
0.6861082, 0.5292484, 0.6283612, 0.4392157, 0, 1, 1,
0.686835, -0.2692676, 2.995783, 0.4470588, 0, 1, 1,
0.6885542, 0.76067, 0.8300569, 0.4509804, 0, 1, 1,
0.689347, -0.5438856, 3.319318, 0.4588235, 0, 1, 1,
0.6904905, 1.443562, -0.05298062, 0.4627451, 0, 1, 1,
0.692265, -1.142505, 2.736294, 0.4705882, 0, 1, 1,
0.6950871, -2.0299, 2.987324, 0.4745098, 0, 1, 1,
0.6956931, 0.35748, 2.42023, 0.4823529, 0, 1, 1,
0.7047447, 0.1641136, 1.432593, 0.4862745, 0, 1, 1,
0.7057362, 0.2924661, 0.8230941, 0.4941176, 0, 1, 1,
0.7076059, 0.7119606, 0.2837066, 0.5019608, 0, 1, 1,
0.7084948, -0.005961817, 1.012508, 0.5058824, 0, 1, 1,
0.7088584, -1.400929, 2.572124, 0.5137255, 0, 1, 1,
0.7123476, -0.9189754, 2.099705, 0.5176471, 0, 1, 1,
0.7132107, -0.2388259, 3.018487, 0.5254902, 0, 1, 1,
0.7163447, 0.4974394, 0.8971192, 0.5294118, 0, 1, 1,
0.7247654, 0.5502337, 0.5904928, 0.5372549, 0, 1, 1,
0.7328959, 0.1150883, 0.7448045, 0.5411765, 0, 1, 1,
0.7334759, 0.6868698, 1.614661, 0.5490196, 0, 1, 1,
0.7338194, 1.638244, 0.6178708, 0.5529412, 0, 1, 1,
0.7345572, 0.756725, 1.175532, 0.5607843, 0, 1, 1,
0.7488101, 0.229509, 2.594397, 0.5647059, 0, 1, 1,
0.7531649, -0.131277, -0.02212819, 0.572549, 0, 1, 1,
0.7560552, -0.6179683, 2.434458, 0.5764706, 0, 1, 1,
0.7568207, -1.456187, 3.491331, 0.5843138, 0, 1, 1,
0.7611588, -1.697616, 2.223837, 0.5882353, 0, 1, 1,
0.7638366, 0.5089601, 0.4849317, 0.5960785, 0, 1, 1,
0.7661462, -0.1728503, -0.04208059, 0.6039216, 0, 1, 1,
0.7731611, 0.9380288, 0.575468, 0.6078432, 0, 1, 1,
0.7780039, -0.2718365, 2.174734, 0.6156863, 0, 1, 1,
0.7822495, -1.33454, 2.715469, 0.6196079, 0, 1, 1,
0.7870869, -1.074906, 2.988682, 0.627451, 0, 1, 1,
0.7875821, -0.2366205, 0.9591623, 0.6313726, 0, 1, 1,
0.7889916, -0.382383, 2.904891, 0.6392157, 0, 1, 1,
0.7927309, -0.8284493, 2.402536, 0.6431373, 0, 1, 1,
0.7935633, 1.68352, 0.4362038, 0.6509804, 0, 1, 1,
0.7956951, -0.01442251, 1.629139, 0.654902, 0, 1, 1,
0.7969784, 0.02810615, 3.434263, 0.6627451, 0, 1, 1,
0.79735, 0.08381505, 1.22652, 0.6666667, 0, 1, 1,
0.7984593, -1.312648, 3.627026, 0.6745098, 0, 1, 1,
0.8009098, 1.022276, -0.9134975, 0.6784314, 0, 1, 1,
0.8009713, -1.151619, 3.373598, 0.6862745, 0, 1, 1,
0.8025702, 1.852976, -0.8831745, 0.6901961, 0, 1, 1,
0.8065701, 0.8429396, 0.753908, 0.6980392, 0, 1, 1,
0.8066682, 0.1498881, 1.348494, 0.7058824, 0, 1, 1,
0.8067369, 1.12266, 0.6404033, 0.7098039, 0, 1, 1,
0.8106548, -0.3521453, 2.059967, 0.7176471, 0, 1, 1,
0.8198119, -0.4611135, 2.446575, 0.7215686, 0, 1, 1,
0.8259652, -1.826632, 0.9700922, 0.7294118, 0, 1, 1,
0.8263335, -1.367665, 2.552504, 0.7333333, 0, 1, 1,
0.8360285, 1.362321, 0.6007041, 0.7411765, 0, 1, 1,
0.8387217, 1.218919, 0.9789112, 0.7450981, 0, 1, 1,
0.8397952, 0.2060112, 1.720208, 0.7529412, 0, 1, 1,
0.8413812, 0.4148252, 1.475431, 0.7568628, 0, 1, 1,
0.8414176, 0.5527458, 2.575271, 0.7647059, 0, 1, 1,
0.8424539, 0.9277, 0.5701826, 0.7686275, 0, 1, 1,
0.8429002, 1.597671, 0.9946774, 0.7764706, 0, 1, 1,
0.8479467, -1.242442, 1.110638, 0.7803922, 0, 1, 1,
0.8502486, -0.5314181, 2.870993, 0.7882353, 0, 1, 1,
0.8515916, 0.2700553, -0.3227032, 0.7921569, 0, 1, 1,
0.8524765, -0.1096202, 1.211279, 0.8, 0, 1, 1,
0.8536083, 0.4352477, -0.593249, 0.8078431, 0, 1, 1,
0.858216, 0.5568259, 1.125412, 0.8117647, 0, 1, 1,
0.8608644, 1.48868, 1.639667, 0.8196079, 0, 1, 1,
0.8658779, -0.1300506, 2.802376, 0.8235294, 0, 1, 1,
0.8673273, -0.3889223, 3.262242, 0.8313726, 0, 1, 1,
0.8723406, -0.6528858, 2.115233, 0.8352941, 0, 1, 1,
0.8728458, -1.029909, 2.98859, 0.8431373, 0, 1, 1,
0.8767431, -0.8585665, 0.4286647, 0.8470588, 0, 1, 1,
0.8783241, -1.481499, 5.564502, 0.854902, 0, 1, 1,
0.8816531, 0.5514878, 1.166419, 0.8588235, 0, 1, 1,
0.8832467, -2.247263, 1.720095, 0.8666667, 0, 1, 1,
0.8906289, -0.8897392, 3.614384, 0.8705882, 0, 1, 1,
0.899276, -2.315139, 3.268978, 0.8784314, 0, 1, 1,
0.9147739, 0.3219423, 1.145495, 0.8823529, 0, 1, 1,
0.9161451, -0.8824308, 3.652174, 0.8901961, 0, 1, 1,
0.9229689, -1.806117, 2.377292, 0.8941177, 0, 1, 1,
0.9297644, -0.6509731, 2.323834, 0.9019608, 0, 1, 1,
0.9336767, -0.03189154, -0.4085402, 0.9098039, 0, 1, 1,
0.9350939, -0.7069444, 2.836723, 0.9137255, 0, 1, 1,
0.9482524, 1.163124, 0.149727, 0.9215686, 0, 1, 1,
0.9539117, -0.06562386, 0.7702753, 0.9254902, 0, 1, 1,
0.9579694, -1.013708, 4.160323, 0.9333333, 0, 1, 1,
0.9587219, -0.3553544, 1.778752, 0.9372549, 0, 1, 1,
0.9623079, 1.729191, -0.2415585, 0.945098, 0, 1, 1,
0.9713976, 0.1480111, 2.056252, 0.9490196, 0, 1, 1,
0.9742219, -0.09960999, 1.909448, 0.9568627, 0, 1, 1,
0.9801911, -1.92703, 2.052547, 0.9607843, 0, 1, 1,
0.9845095, -0.1591384, 2.737558, 0.9686275, 0, 1, 1,
0.9875845, -0.3992011, 3.364807, 0.972549, 0, 1, 1,
0.9878667, -0.0432645, 1.972974, 0.9803922, 0, 1, 1,
0.9880474, -0.1040252, 1.376875, 0.9843137, 0, 1, 1,
0.9891137, 1.634956, 1.587354, 0.9921569, 0, 1, 1,
0.9916727, -0.08795641, 0.4132788, 0.9960784, 0, 1, 1,
0.9921039, -1.215013, 2.174452, 1, 0, 0.9960784, 1,
0.9940144, 0.7302148, -0.3178727, 1, 0, 0.9882353, 1,
0.9945213, -0.3607245, 3.576226, 1, 0, 0.9843137, 1,
0.9959118, 1.438054, -0.6811178, 1, 0, 0.9764706, 1,
0.9991229, -1.5749, 1.735456, 1, 0, 0.972549, 1,
1.005698, 0.6028365, 0.7261949, 1, 0, 0.9647059, 1,
1.006701, 0.2802351, 1.175421, 1, 0, 0.9607843, 1,
1.00877, 0.6723137, 0.801041, 1, 0, 0.9529412, 1,
1.019114, -0.4024472, 0.5281445, 1, 0, 0.9490196, 1,
1.019727, 0.1691664, -0.248355, 1, 0, 0.9411765, 1,
1.027012, -1.35588, 1.293834, 1, 0, 0.9372549, 1,
1.030964, -0.4275187, 2.218204, 1, 0, 0.9294118, 1,
1.032261, 1.31765, -0.5949778, 1, 0, 0.9254902, 1,
1.03262, -1.966547, 3.394333, 1, 0, 0.9176471, 1,
1.034535, -0.07005717, 1.946661, 1, 0, 0.9137255, 1,
1.041509, 1.399629, 2.134921, 1, 0, 0.9058824, 1,
1.044702, 0.4039914, 3.609321, 1, 0, 0.9019608, 1,
1.045714, 0.5562807, 1.193493, 1, 0, 0.8941177, 1,
1.050401, 1.342159, 0.3339529, 1, 0, 0.8862745, 1,
1.063166, 1.109138, 1.633593, 1, 0, 0.8823529, 1,
1.063396, -1.07782, 1.989766, 1, 0, 0.8745098, 1,
1.064652, -1.41205, 1.184592, 1, 0, 0.8705882, 1,
1.069971, -0.891239, 3.185561, 1, 0, 0.8627451, 1,
1.074018, -0.6717162, 2.331014, 1, 0, 0.8588235, 1,
1.07608, 0.3159807, 1.322923, 1, 0, 0.8509804, 1,
1.084513, -0.4118654, 1.274557, 1, 0, 0.8470588, 1,
1.085083, -2.96212, 2.772163, 1, 0, 0.8392157, 1,
1.08663, -1.029423, 2.613124, 1, 0, 0.8352941, 1,
1.098059, -0.2318472, 2.355156, 1, 0, 0.827451, 1,
1.10395, -0.3709564, 1.58922, 1, 0, 0.8235294, 1,
1.104805, 0.5697166, 0.807362, 1, 0, 0.8156863, 1,
1.105196, -0.8276727, 2.297277, 1, 0, 0.8117647, 1,
1.11943, -0.9743273, 3.602787, 1, 0, 0.8039216, 1,
1.120152, -0.7681733, 3.309435, 1, 0, 0.7960784, 1,
1.121288, -0.3777499, 2.009271, 1, 0, 0.7921569, 1,
1.132901, 0.2689931, 2.007001, 1, 0, 0.7843137, 1,
1.138482, 1.466379, 1.057679, 1, 0, 0.7803922, 1,
1.140331, 0.04791641, 2.637033, 1, 0, 0.772549, 1,
1.141207, -0.8524887, 1.644666, 1, 0, 0.7686275, 1,
1.16174, 0.9491697, 0.06524389, 1, 0, 0.7607843, 1,
1.162959, 0.230372, 2.110173, 1, 0, 0.7568628, 1,
1.169299, 0.8671215, 0.8891206, 1, 0, 0.7490196, 1,
1.171948, 1.723464, 1.996532, 1, 0, 0.7450981, 1,
1.175537, -0.4814665, 0.8294457, 1, 0, 0.7372549, 1,
1.176347, -0.6113868, 1.836338, 1, 0, 0.7333333, 1,
1.177536, 1.21486, -0.8426777, 1, 0, 0.7254902, 1,
1.178549, 0.70836, 2.418694, 1, 0, 0.7215686, 1,
1.20909, -1.506441, 1.797544, 1, 0, 0.7137255, 1,
1.211165, -0.275382, 1.220091, 1, 0, 0.7098039, 1,
1.217786, 0.4354115, -1.356845, 1, 0, 0.7019608, 1,
1.223418, -0.775239, 2.817471, 1, 0, 0.6941177, 1,
1.22616, 1.185401, 0.8071886, 1, 0, 0.6901961, 1,
1.234337, -0.02813097, 0.2707594, 1, 0, 0.682353, 1,
1.234849, 0.5568646, 0.6778419, 1, 0, 0.6784314, 1,
1.236745, 0.5655386, 1.077752, 1, 0, 0.6705883, 1,
1.239853, -0.881179, 0.483878, 1, 0, 0.6666667, 1,
1.241839, -2.260709, 1.952462, 1, 0, 0.6588235, 1,
1.242639, -0.1389892, 2.018397, 1, 0, 0.654902, 1,
1.24266, 0.8192889, 3.330746, 1, 0, 0.6470588, 1,
1.269786, 0.4053477, -0.01686551, 1, 0, 0.6431373, 1,
1.272706, 0.01085091, 0.4916875, 1, 0, 0.6352941, 1,
1.277432, -0.3821784, 2.372466, 1, 0, 0.6313726, 1,
1.278565, -0.6389472, 2.740279, 1, 0, 0.6235294, 1,
1.288577, 0.420944, 1.748519, 1, 0, 0.6196079, 1,
1.300931, -0.1263588, 0.671179, 1, 0, 0.6117647, 1,
1.302265, 2.217693, -0.2214942, 1, 0, 0.6078432, 1,
1.311236, 0.1469005, 1.571216, 1, 0, 0.6, 1,
1.313395, -1.122962, 3.42207, 1, 0, 0.5921569, 1,
1.316095, 0.1760573, -2.022127, 1, 0, 0.5882353, 1,
1.321586, 1.093704, 2.061834, 1, 0, 0.5803922, 1,
1.322228, -1.785988, 2.443698, 1, 0, 0.5764706, 1,
1.329016, -1.150203, 2.0468, 1, 0, 0.5686275, 1,
1.330689, -0.7200242, 0.5915276, 1, 0, 0.5647059, 1,
1.335136, 0.4553793, -0.8714772, 1, 0, 0.5568628, 1,
1.352868, 2.438927, 0.3389675, 1, 0, 0.5529412, 1,
1.362738, -1.00079, 2.349133, 1, 0, 0.5450981, 1,
1.38115, 2.260784, 1.953687, 1, 0, 0.5411765, 1,
1.381867, -0.9006512, 3.654131, 1, 0, 0.5333334, 1,
1.388895, -0.2480837, 2.220721, 1, 0, 0.5294118, 1,
1.392252, 0.6097587, 1.20861, 1, 0, 0.5215687, 1,
1.400682, 1.558216, -1.379247, 1, 0, 0.5176471, 1,
1.406115, -0.2847084, 1.028381, 1, 0, 0.509804, 1,
1.42523, 3.427521, 1.660869, 1, 0, 0.5058824, 1,
1.434433, 0.02938128, 1.32058, 1, 0, 0.4980392, 1,
1.436296, -1.114963, 2.684742, 1, 0, 0.4901961, 1,
1.439826, 0.6205513, 1.775561, 1, 0, 0.4862745, 1,
1.442186, 0.6724011, 1.122882, 1, 0, 0.4784314, 1,
1.445387, -0.8941705, 2.549657, 1, 0, 0.4745098, 1,
1.466389, 0.5578747, 1.379891, 1, 0, 0.4666667, 1,
1.4791, 0.2956792, 1.955251, 1, 0, 0.4627451, 1,
1.482282, 1.26652, 2.459076, 1, 0, 0.454902, 1,
1.486175, 0.4475217, 2.386849, 1, 0, 0.4509804, 1,
1.491959, -0.6429816, 1.945967, 1, 0, 0.4431373, 1,
1.493425, -1.272116, 2.006276, 1, 0, 0.4392157, 1,
1.514764, -0.5148024, 2.719816, 1, 0, 0.4313726, 1,
1.524821, 0.3609735, 1.818728, 1, 0, 0.427451, 1,
1.53517, -1.128532, 2.507462, 1, 0, 0.4196078, 1,
1.536159, 0.9688803, 1.182616, 1, 0, 0.4156863, 1,
1.537948, 1.345962, 0.9993674, 1, 0, 0.4078431, 1,
1.539771, 0.0846018, -1.213018, 1, 0, 0.4039216, 1,
1.546679, -0.4553465, 2.715589, 1, 0, 0.3960784, 1,
1.551513, -0.06966429, 4.066921, 1, 0, 0.3882353, 1,
1.552991, 0.8905352, 0.4858634, 1, 0, 0.3843137, 1,
1.559096, -0.8128548, 1.07495, 1, 0, 0.3764706, 1,
1.566657, -0.5436112, 1.869579, 1, 0, 0.372549, 1,
1.571548, 2.148964, 0.1703961, 1, 0, 0.3647059, 1,
1.576515, 0.6834022, 1.7128, 1, 0, 0.3607843, 1,
1.585299, 0.2725142, 1.447886, 1, 0, 0.3529412, 1,
1.586255, -0.6675681, 1.614639, 1, 0, 0.3490196, 1,
1.589608, -0.01624217, 1.987786, 1, 0, 0.3411765, 1,
1.600864, -1.010917, 1.747748, 1, 0, 0.3372549, 1,
1.604464, -0.04580079, 2.187616, 1, 0, 0.3294118, 1,
1.61184, -1.650906, -0.2603034, 1, 0, 0.3254902, 1,
1.615772, -0.8202982, -0.5458164, 1, 0, 0.3176471, 1,
1.629417, 0.7925051, 0.13382, 1, 0, 0.3137255, 1,
1.642232, 0.2572959, -0.1745424, 1, 0, 0.3058824, 1,
1.688447, -0.5598609, 1.005179, 1, 0, 0.2980392, 1,
1.710601, -1.873681, 2.143324, 1, 0, 0.2941177, 1,
1.741631, 0.02194862, 1.819862, 1, 0, 0.2862745, 1,
1.745172, 0.43131, 2.169737, 1, 0, 0.282353, 1,
1.747498, -0.5080994, 1.95532, 1, 0, 0.2745098, 1,
1.753755, 0.87725, 0.73418, 1, 0, 0.2705882, 1,
1.755288, 0.2341188, 0.5500889, 1, 0, 0.2627451, 1,
1.766895, -1.697153, 0.142089, 1, 0, 0.2588235, 1,
1.767938, 0.02405513, 0.02167518, 1, 0, 0.2509804, 1,
1.776998, 2.265284, 0.3402509, 1, 0, 0.2470588, 1,
1.782967, 1.512074, 1.215471, 1, 0, 0.2392157, 1,
1.808705, 1.330032, 1.12583, 1, 0, 0.2352941, 1,
1.831264, 0.6032215, -1.365073, 1, 0, 0.227451, 1,
1.837058, -2.176993, 2.576695, 1, 0, 0.2235294, 1,
1.857795, -0.4719128, 2.842536, 1, 0, 0.2156863, 1,
1.871868, -0.1586346, 1.436224, 1, 0, 0.2117647, 1,
1.88753, -0.9751974, 1.770319, 1, 0, 0.2039216, 1,
1.890182, -0.9138539, 3.555635, 1, 0, 0.1960784, 1,
1.891019, 0.8575866, 0.1632406, 1, 0, 0.1921569, 1,
1.896876, 1.356395, -0.09868079, 1, 0, 0.1843137, 1,
1.901602, 1.293783, -0.004745302, 1, 0, 0.1803922, 1,
1.91558, -0.5720857, -1.297453, 1, 0, 0.172549, 1,
1.915761, 0.8349182, 0.8121097, 1, 0, 0.1686275, 1,
1.91623, 0.7372966, 1.630962, 1, 0, 0.1607843, 1,
1.919825, -0.3622829, 0.762714, 1, 0, 0.1568628, 1,
1.963306, -0.1791635, -0.178286, 1, 0, 0.1490196, 1,
1.963567, 0.07404628, 0.7254303, 1, 0, 0.145098, 1,
1.975351, 0.02167883, 3.208784, 1, 0, 0.1372549, 1,
1.978258, 1.058634, 1.826882, 1, 0, 0.1333333, 1,
1.987086, 1.038818, 0.7332079, 1, 0, 0.1254902, 1,
2.000619, -0.1897072, 0.5182133, 1, 0, 0.1215686, 1,
2.032279, 0.6991588, 1.351929, 1, 0, 0.1137255, 1,
2.035866, -0.4677471, 1.541269, 1, 0, 0.1098039, 1,
2.046778, 0.2693523, 2.333117, 1, 0, 0.1019608, 1,
2.07502, -1.434375, 1.990966, 1, 0, 0.09411765, 1,
2.100708, -0.1432988, 0.4140663, 1, 0, 0.09019608, 1,
2.118421, -0.3533436, 1.514289, 1, 0, 0.08235294, 1,
2.11884, -0.07883203, 0.2875105, 1, 0, 0.07843138, 1,
2.141206, -1.551091, 1.691365, 1, 0, 0.07058824, 1,
2.145886, -1.062405, 2.616084, 1, 0, 0.06666667, 1,
2.149952, -1.954941, 3.726651, 1, 0, 0.05882353, 1,
2.166917, -1.053957, 1.326294, 1, 0, 0.05490196, 1,
2.189353, -0.3580271, 3.008687, 1, 0, 0.04705882, 1,
2.262188, 0.9170701, 1.122435, 1, 0, 0.04313726, 1,
2.26558, 0.7112097, 2.635563, 1, 0, 0.03529412, 1,
2.405353, -0.7782496, 1.337626, 1, 0, 0.03137255, 1,
2.45471, -0.8846767, 1.227932, 1, 0, 0.02352941, 1,
2.561847, 0.8043213, 0.02271122, 1, 0, 0.01960784, 1,
2.923099, -0.6173239, 1.012258, 1, 0, 0.01176471, 1,
3.093847, -0.9559487, 3.366478, 1, 0, 0.007843138, 1
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
-0.132723, -4.045164, -7.164403, 0, -0.5, 0.5, 0.5,
-0.132723, -4.045164, -7.164403, 1, -0.5, 0.5, 0.5,
-0.132723, -4.045164, -7.164403, 1, 1.5, 0.5, 0.5,
-0.132723, -4.045164, -7.164403, 0, 1.5, 0.5, 0.5
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
-4.4531, 0.2327008, -7.164403, 0, -0.5, 0.5, 0.5,
-4.4531, 0.2327008, -7.164403, 1, -0.5, 0.5, 0.5,
-4.4531, 0.2327008, -7.164403, 1, 1.5, 0.5, 0.5,
-4.4531, 0.2327008, -7.164403, 0, 1.5, 0.5, 0.5
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
-4.4531, -4.045164, 0.1227379, 0, -0.5, 0.5, 0.5,
-4.4531, -4.045164, 0.1227379, 1, -0.5, 0.5, 0.5,
-4.4531, -4.045164, 0.1227379, 1, 1.5, 0.5, 0.5,
-4.4531, -4.045164, 0.1227379, 0, 1.5, 0.5, 0.5
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
-3, -3.057964, -5.482755,
3, -3.057964, -5.482755,
-3, -3.057964, -5.482755,
-3, -3.222498, -5.76303,
-2, -3.057964, -5.482755,
-2, -3.222498, -5.76303,
-1, -3.057964, -5.482755,
-1, -3.222498, -5.76303,
0, -3.057964, -5.482755,
0, -3.222498, -5.76303,
1, -3.057964, -5.482755,
1, -3.222498, -5.76303,
2, -3.057964, -5.482755,
2, -3.222498, -5.76303,
3, -3.057964, -5.482755,
3, -3.222498, -5.76303
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
-3, -3.551564, -6.323579, 0, -0.5, 0.5, 0.5,
-3, -3.551564, -6.323579, 1, -0.5, 0.5, 0.5,
-3, -3.551564, -6.323579, 1, 1.5, 0.5, 0.5,
-3, -3.551564, -6.323579, 0, 1.5, 0.5, 0.5,
-2, -3.551564, -6.323579, 0, -0.5, 0.5, 0.5,
-2, -3.551564, -6.323579, 1, -0.5, 0.5, 0.5,
-2, -3.551564, -6.323579, 1, 1.5, 0.5, 0.5,
-2, -3.551564, -6.323579, 0, 1.5, 0.5, 0.5,
-1, -3.551564, -6.323579, 0, -0.5, 0.5, 0.5,
-1, -3.551564, -6.323579, 1, -0.5, 0.5, 0.5,
-1, -3.551564, -6.323579, 1, 1.5, 0.5, 0.5,
-1, -3.551564, -6.323579, 0, 1.5, 0.5, 0.5,
0, -3.551564, -6.323579, 0, -0.5, 0.5, 0.5,
0, -3.551564, -6.323579, 1, -0.5, 0.5, 0.5,
0, -3.551564, -6.323579, 1, 1.5, 0.5, 0.5,
0, -3.551564, -6.323579, 0, 1.5, 0.5, 0.5,
1, -3.551564, -6.323579, 0, -0.5, 0.5, 0.5,
1, -3.551564, -6.323579, 1, -0.5, 0.5, 0.5,
1, -3.551564, -6.323579, 1, 1.5, 0.5, 0.5,
1, -3.551564, -6.323579, 0, 1.5, 0.5, 0.5,
2, -3.551564, -6.323579, 0, -0.5, 0.5, 0.5,
2, -3.551564, -6.323579, 1, -0.5, 0.5, 0.5,
2, -3.551564, -6.323579, 1, 1.5, 0.5, 0.5,
2, -3.551564, -6.323579, 0, 1.5, 0.5, 0.5,
3, -3.551564, -6.323579, 0, -0.5, 0.5, 0.5,
3, -3.551564, -6.323579, 1, -0.5, 0.5, 0.5,
3, -3.551564, -6.323579, 1, 1.5, 0.5, 0.5,
3, -3.551564, -6.323579, 0, 1.5, 0.5, 0.5
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
-3.45609, -2, -5.482755,
-3.45609, 3, -5.482755,
-3.45609, -2, -5.482755,
-3.622258, -2, -5.76303,
-3.45609, -1, -5.482755,
-3.622258, -1, -5.76303,
-3.45609, 0, -5.482755,
-3.622258, 0, -5.76303,
-3.45609, 1, -5.482755,
-3.622258, 1, -5.76303,
-3.45609, 2, -5.482755,
-3.622258, 2, -5.76303,
-3.45609, 3, -5.482755,
-3.622258, 3, -5.76303
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
-3.954595, -2, -6.323579, 0, -0.5, 0.5, 0.5,
-3.954595, -2, -6.323579, 1, -0.5, 0.5, 0.5,
-3.954595, -2, -6.323579, 1, 1.5, 0.5, 0.5,
-3.954595, -2, -6.323579, 0, 1.5, 0.5, 0.5,
-3.954595, -1, -6.323579, 0, -0.5, 0.5, 0.5,
-3.954595, -1, -6.323579, 1, -0.5, 0.5, 0.5,
-3.954595, -1, -6.323579, 1, 1.5, 0.5, 0.5,
-3.954595, -1, -6.323579, 0, 1.5, 0.5, 0.5,
-3.954595, 0, -6.323579, 0, -0.5, 0.5, 0.5,
-3.954595, 0, -6.323579, 1, -0.5, 0.5, 0.5,
-3.954595, 0, -6.323579, 1, 1.5, 0.5, 0.5,
-3.954595, 0, -6.323579, 0, 1.5, 0.5, 0.5,
-3.954595, 1, -6.323579, 0, -0.5, 0.5, 0.5,
-3.954595, 1, -6.323579, 1, -0.5, 0.5, 0.5,
-3.954595, 1, -6.323579, 1, 1.5, 0.5, 0.5,
-3.954595, 1, -6.323579, 0, 1.5, 0.5, 0.5,
-3.954595, 2, -6.323579, 0, -0.5, 0.5, 0.5,
-3.954595, 2, -6.323579, 1, -0.5, 0.5, 0.5,
-3.954595, 2, -6.323579, 1, 1.5, 0.5, 0.5,
-3.954595, 2, -6.323579, 0, 1.5, 0.5, 0.5,
-3.954595, 3, -6.323579, 0, -0.5, 0.5, 0.5,
-3.954595, 3, -6.323579, 1, -0.5, 0.5, 0.5,
-3.954595, 3, -6.323579, 1, 1.5, 0.5, 0.5,
-3.954595, 3, -6.323579, 0, 1.5, 0.5, 0.5
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
-3.45609, -3.057964, -4,
-3.45609, -3.057964, 4,
-3.45609, -3.057964, -4,
-3.622258, -3.222498, -4,
-3.45609, -3.057964, -2,
-3.622258, -3.222498, -2,
-3.45609, -3.057964, 0,
-3.622258, -3.222498, 0,
-3.45609, -3.057964, 2,
-3.622258, -3.222498, 2,
-3.45609, -3.057964, 4,
-3.622258, -3.222498, 4
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
-3.954595, -3.551564, -4, 0, -0.5, 0.5, 0.5,
-3.954595, -3.551564, -4, 1, -0.5, 0.5, 0.5,
-3.954595, -3.551564, -4, 1, 1.5, 0.5, 0.5,
-3.954595, -3.551564, -4, 0, 1.5, 0.5, 0.5,
-3.954595, -3.551564, -2, 0, -0.5, 0.5, 0.5,
-3.954595, -3.551564, -2, 1, -0.5, 0.5, 0.5,
-3.954595, -3.551564, -2, 1, 1.5, 0.5, 0.5,
-3.954595, -3.551564, -2, 0, 1.5, 0.5, 0.5,
-3.954595, -3.551564, 0, 0, -0.5, 0.5, 0.5,
-3.954595, -3.551564, 0, 1, -0.5, 0.5, 0.5,
-3.954595, -3.551564, 0, 1, 1.5, 0.5, 0.5,
-3.954595, -3.551564, 0, 0, 1.5, 0.5, 0.5,
-3.954595, -3.551564, 2, 0, -0.5, 0.5, 0.5,
-3.954595, -3.551564, 2, 1, -0.5, 0.5, 0.5,
-3.954595, -3.551564, 2, 1, 1.5, 0.5, 0.5,
-3.954595, -3.551564, 2, 0, 1.5, 0.5, 0.5,
-3.954595, -3.551564, 4, 0, -0.5, 0.5, 0.5,
-3.954595, -3.551564, 4, 1, -0.5, 0.5, 0.5,
-3.954595, -3.551564, 4, 1, 1.5, 0.5, 0.5,
-3.954595, -3.551564, 4, 0, 1.5, 0.5, 0.5
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
-3.45609, -3.057964, -5.482755,
-3.45609, 3.523366, -5.482755,
-3.45609, -3.057964, 5.728231,
-3.45609, 3.523366, 5.728231,
-3.45609, -3.057964, -5.482755,
-3.45609, -3.057964, 5.728231,
-3.45609, 3.523366, -5.482755,
-3.45609, 3.523366, 5.728231,
-3.45609, -3.057964, -5.482755,
3.190644, -3.057964, -5.482755,
-3.45609, -3.057964, 5.728231,
3.190644, -3.057964, 5.728231,
-3.45609, 3.523366, -5.482755,
3.190644, 3.523366, -5.482755,
-3.45609, 3.523366, 5.728231,
3.190644, 3.523366, 5.728231,
3.190644, -3.057964, -5.482755,
3.190644, 3.523366, -5.482755,
3.190644, -3.057964, 5.728231,
3.190644, 3.523366, 5.728231,
3.190644, -3.057964, -5.482755,
3.190644, -3.057964, 5.728231,
3.190644, 3.523366, -5.482755,
3.190644, 3.523366, 5.728231
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
var radius = 7.796468;
var distance = 34.68737;
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
mvMatrix.translate( 0.132723, -0.2327008, -0.1227379 );
mvMatrix.scale( 1.268246, 1.280849, 0.7519136 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.68737);
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
prochloraz<-read.table("prochloraz.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prochloraz$V2
```

```
## Error in eval(expr, envir, enclos): object 'prochloraz' not found
```

```r
y<-prochloraz$V3
```

```
## Error in eval(expr, envir, enclos): object 'prochloraz' not found
```

```r
z<-prochloraz$V4
```

```
## Error in eval(expr, envir, enclos): object 'prochloraz' not found
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
-3.359293, 0.2235182, -3.095027, 0, 0, 1, 1, 1,
-3.287165, -0.1163469, -1.312863, 1, 0, 0, 1, 1,
-3.271364, -2.641465, -1.333069, 1, 0, 0, 1, 1,
-3.210586, 1.152733, -1.467771, 1, 0, 0, 1, 1,
-3.207867, 0.7984208, -1.427873, 1, 0, 0, 1, 1,
-2.860357, 1.264686, -0.9621843, 1, 0, 0, 1, 1,
-2.744708, -1.940002, -2.370945, 0, 0, 0, 1, 1,
-2.545688, 0.8029116, -0.9110537, 0, 0, 0, 1, 1,
-2.504662, 0.244129, -1.867308, 0, 0, 0, 1, 1,
-2.495401, 1.832512, -0.9427205, 0, 0, 0, 1, 1,
-2.449611, 0.8001182, -0.6382978, 0, 0, 0, 1, 1,
-2.415605, -0.6678875, -1.482072, 0, 0, 0, 1, 1,
-2.398707, 0.1529185, -1.9883, 0, 0, 0, 1, 1,
-2.348036, 0.1958082, -0.4104837, 1, 1, 1, 1, 1,
-2.260887, -1.413972, -0.4980488, 1, 1, 1, 1, 1,
-2.222424, 1.005879, -0.7489416, 1, 1, 1, 1, 1,
-2.188545, 1.342422, -0.4550552, 1, 1, 1, 1, 1,
-2.090941, 0.822125, -0.176563, 1, 1, 1, 1, 1,
-2.070863, -0.3414772, -2.24051, 1, 1, 1, 1, 1,
-2.063396, -0.1721229, -1.107599, 1, 1, 1, 1, 1,
-1.979553, -0.1438462, -2.7098, 1, 1, 1, 1, 1,
-1.959985, -1.093922, -3.238422, 1, 1, 1, 1, 1,
-1.926725, 0.3830957, -0.5664534, 1, 1, 1, 1, 1,
-1.915969, 0.8186793, -2.924999, 1, 1, 1, 1, 1,
-1.902315, -0.4484369, -1.10942, 1, 1, 1, 1, 1,
-1.890648, -0.3961776, -3.352168, 1, 1, 1, 1, 1,
-1.86694, -1.751341, -1.378595, 1, 1, 1, 1, 1,
-1.86367, 0.8259336, -2.511824, 1, 1, 1, 1, 1,
-1.846304, 1.258328, -1.309721, 0, 0, 1, 1, 1,
-1.837158, 0.1124806, -0.312111, 1, 0, 0, 1, 1,
-1.814859, -0.3090007, -4.265875, 1, 0, 0, 1, 1,
-1.813858, 0.8007957, 0.3281566, 1, 0, 0, 1, 1,
-1.800077, -0.06961018, -1.318472, 1, 0, 0, 1, 1,
-1.792571, 0.6458383, -2.651546, 1, 0, 0, 1, 1,
-1.762942, 0.4392545, -1.892802, 0, 0, 0, 1, 1,
-1.758533, 1.30083, -1.562442, 0, 0, 0, 1, 1,
-1.717637, -1.984131, -4.086051, 0, 0, 0, 1, 1,
-1.710481, -0.1803337, -1.775364, 0, 0, 0, 1, 1,
-1.69224, -1.60693, -2.101292, 0, 0, 0, 1, 1,
-1.673062, -0.7808999, -0.3841445, 0, 0, 0, 1, 1,
-1.66067, -1.485242, -0.8605711, 0, 0, 0, 1, 1,
-1.658791, 2.444607, 0.1517942, 1, 1, 1, 1, 1,
-1.657998, 0.0582561, 0.5392011, 1, 1, 1, 1, 1,
-1.633477, -1.419521, -2.119514, 1, 1, 1, 1, 1,
-1.629189, -1.61324, -3.708864, 1, 1, 1, 1, 1,
-1.62898, 1.004825, 0.2938267, 1, 1, 1, 1, 1,
-1.611268, 0.5522668, -1.182078, 1, 1, 1, 1, 1,
-1.58203, -0.6310678, -2.348015, 1, 1, 1, 1, 1,
-1.580563, -0.06645922, -1.012559, 1, 1, 1, 1, 1,
-1.580043, -0.01318002, -1.459864, 1, 1, 1, 1, 1,
-1.541695, 0.4856795, -2.0474, 1, 1, 1, 1, 1,
-1.531953, -1.016503, -1.61128, 1, 1, 1, 1, 1,
-1.524804, -0.7206279, -0.9203932, 1, 1, 1, 1, 1,
-1.520655, -0.02640595, -1.511009, 1, 1, 1, 1, 1,
-1.505034, -0.6472287, -2.09747, 1, 1, 1, 1, 1,
-1.486058, -0.1703527, -2.645079, 1, 1, 1, 1, 1,
-1.480757, -0.2082535, -2.049161, 0, 0, 1, 1, 1,
-1.476191, -1.401038, -2.404237, 1, 0, 0, 1, 1,
-1.469957, 0.637155, -1.243785, 1, 0, 0, 1, 1,
-1.466609, 1.420517, -0.1913441, 1, 0, 0, 1, 1,
-1.466508, 0.4746788, -1.406444, 1, 0, 0, 1, 1,
-1.459635, -0.7462584, -1.70342, 1, 0, 0, 1, 1,
-1.44432, -0.4850028, -3.129426, 0, 0, 0, 1, 1,
-1.438511, 1.42314, -2.298795, 0, 0, 0, 1, 1,
-1.432343, 0.6197605, 0.1084832, 0, 0, 0, 1, 1,
-1.431673, 0.535884, -1.1489, 0, 0, 0, 1, 1,
-1.426217, 0.09238983, -3.936378, 0, 0, 0, 1, 1,
-1.42236, 0.2782218, -0.3858594, 0, 0, 0, 1, 1,
-1.42069, -0.7703768, -0.6130539, 0, 0, 0, 1, 1,
-1.410152, 1.447041, -1.780308, 1, 1, 1, 1, 1,
-1.391608, 0.6047652, -1.807516, 1, 1, 1, 1, 1,
-1.367181, 0.1572062, -2.611181, 1, 1, 1, 1, 1,
-1.353667, 1.326606, 0.5907569, 1, 1, 1, 1, 1,
-1.351625, -0.6122122, -1.644351, 1, 1, 1, 1, 1,
-1.343397, 0.5484746, -1.449069, 1, 1, 1, 1, 1,
-1.333219, 0.5049644, -3.21744, 1, 1, 1, 1, 1,
-1.327688, -1.003672, -1.100071, 1, 1, 1, 1, 1,
-1.320889, 0.733398, -1.380265, 1, 1, 1, 1, 1,
-1.317897, 0.03331523, -1.596863, 1, 1, 1, 1, 1,
-1.308906, 0.2928174, -1.162781, 1, 1, 1, 1, 1,
-1.308641, 3.205182, 0.7547946, 1, 1, 1, 1, 1,
-1.30767, -0.3471959, -2.236101, 1, 1, 1, 1, 1,
-1.30438, 0.7471282, -1.045992, 1, 1, 1, 1, 1,
-1.303843, -0.193722, -2.492628, 1, 1, 1, 1, 1,
-1.300463, 1.332187, -1.410944, 0, 0, 1, 1, 1,
-1.287739, 0.1132517, -0.8545201, 1, 0, 0, 1, 1,
-1.287413, -1.276791, -2.524312, 1, 0, 0, 1, 1,
-1.283199, -0.2780017, 0.7502738, 1, 0, 0, 1, 1,
-1.280458, -0.3730517, -0.9207411, 1, 0, 0, 1, 1,
-1.27784, -0.2440072, -1.364094, 1, 0, 0, 1, 1,
-1.266559, 0.8559272, -0.1086644, 0, 0, 0, 1, 1,
-1.230589, -1.644611, -2.255128, 0, 0, 0, 1, 1,
-1.225124, -0.7858047, -2.336594, 0, 0, 0, 1, 1,
-1.223832, -1.945062, -0.8643045, 0, 0, 0, 1, 1,
-1.222107, -0.1455813, -2.404818, 0, 0, 0, 1, 1,
-1.213328, -0.6559137, -0.5452663, 0, 0, 0, 1, 1,
-1.21089, -0.4064283, -3.577213, 0, 0, 0, 1, 1,
-1.198012, -0.6405311, -0.6329785, 1, 1, 1, 1, 1,
-1.196928, 0.6484398, -2.051756, 1, 1, 1, 1, 1,
-1.191362, 0.2774315, -2.247633, 1, 1, 1, 1, 1,
-1.187111, 0.1752035, -0.5863228, 1, 1, 1, 1, 1,
-1.182638, -0.4373061, -0.8626125, 1, 1, 1, 1, 1,
-1.165585, 0.3797569, 0.03596319, 1, 1, 1, 1, 1,
-1.163345, -0.2671208, -0.8622227, 1, 1, 1, 1, 1,
-1.1572, 0.8010431, -0.515496, 1, 1, 1, 1, 1,
-1.155461, -0.4751811, 0.9992031, 1, 1, 1, 1, 1,
-1.14731, 1.119321, -0.8908591, 1, 1, 1, 1, 1,
-1.143925, -1.733776, -4.18138, 1, 1, 1, 1, 1,
-1.140212, 0.3080192, -3.564897, 1, 1, 1, 1, 1,
-1.138802, -0.2224546, -1.347523, 1, 1, 1, 1, 1,
-1.136674, 0.3736502, -1.47492, 1, 1, 1, 1, 1,
-1.13591, -0.711931, -0.9832094, 1, 1, 1, 1, 1,
-1.128872, -0.2292517, -2.604862, 0, 0, 1, 1, 1,
-1.117157, 2.053505, -0.9843611, 1, 0, 0, 1, 1,
-1.110697, -1.719425, -0.7489352, 1, 0, 0, 1, 1,
-1.110392, -0.3015369, -1.300523, 1, 0, 0, 1, 1,
-1.104247, 0.2251033, -0.5257332, 1, 0, 0, 1, 1,
-1.100168, 0.1839497, -1.510148, 1, 0, 0, 1, 1,
-1.098379, 1.675826, -0.5273042, 0, 0, 0, 1, 1,
-1.096967, -1.28506, -1.966708, 0, 0, 0, 1, 1,
-1.094318, -0.5607639, -1.87037, 0, 0, 0, 1, 1,
-1.093576, 0.9834871, -2.811504, 0, 0, 0, 1, 1,
-1.086811, -0.425655, -1.276806, 0, 0, 0, 1, 1,
-1.085582, -1.26494, -1.730921, 0, 0, 0, 1, 1,
-1.085555, 1.199744, -1.663772, 0, 0, 0, 1, 1,
-1.079412, -0.5579125, -2.309651, 1, 1, 1, 1, 1,
-1.075965, 0.4806337, -1.692137, 1, 1, 1, 1, 1,
-1.073127, -0.4545403, -3.336111, 1, 1, 1, 1, 1,
-1.072705, -0.1575299, -2.147542, 1, 1, 1, 1, 1,
-1.067268, 0.7424878, -0.8431536, 1, 1, 1, 1, 1,
-1.064382, 1.41727, -0.6900657, 1, 1, 1, 1, 1,
-1.05981, -1.273933, -1.838916, 1, 1, 1, 1, 1,
-1.055665, -0.04598899, -1.251684, 1, 1, 1, 1, 1,
-1.055262, 0.563238, -0.1482624, 1, 1, 1, 1, 1,
-1.04276, -1.092084, -2.174259, 1, 1, 1, 1, 1,
-1.042016, 2.03842, -0.9427529, 1, 1, 1, 1, 1,
-1.039225, 0.7377489, -2.261305, 1, 1, 1, 1, 1,
-1.037733, -0.566936, -2.230289, 1, 1, 1, 1, 1,
-1.037374, -0.9789978, -2.142297, 1, 1, 1, 1, 1,
-1.032117, -1.936153, -2.807819, 1, 1, 1, 1, 1,
-1.03199, 1.028667, -1.633698, 0, 0, 1, 1, 1,
-1.020937, 0.2157318, -1.782346, 1, 0, 0, 1, 1,
-1.019376, 1.909351, 1.134961, 1, 0, 0, 1, 1,
-1.018744, -0.367067, -2.462898, 1, 0, 0, 1, 1,
-1.011524, 1.456735, -1.90041, 1, 0, 0, 1, 1,
-1.009346, -0.6559764, -0.6329783, 1, 0, 0, 1, 1,
-1.009198, 0.6891702, 0.9819128, 0, 0, 0, 1, 1,
-1.007723, -1.247669, -1.345968, 0, 0, 0, 1, 1,
-1.002513, 0.5612998, -1.422708, 0, 0, 0, 1, 1,
-0.9947674, -0.1158928, -2.393589, 0, 0, 0, 1, 1,
-0.9939376, 1.337713, -0.4587788, 0, 0, 0, 1, 1,
-0.9893142, 1.019137, -1.212254, 0, 0, 0, 1, 1,
-0.9878681, -0.8655689, -1.414705, 0, 0, 0, 1, 1,
-0.9695519, -0.2669782, -1.998414, 1, 1, 1, 1, 1,
-0.968623, 0.4682476, -1.736508, 1, 1, 1, 1, 1,
-0.9629809, 0.2144605, -0.7030446, 1, 1, 1, 1, 1,
-0.9600526, -0.5064585, -1.64403, 1, 1, 1, 1, 1,
-0.9583306, 0.3534832, 0.6107248, 1, 1, 1, 1, 1,
-0.9550944, -1.698696, -2.780239, 1, 1, 1, 1, 1,
-0.9529332, 0.01278445, -2.010748, 1, 1, 1, 1, 1,
-0.952335, -0.03553269, -2.734929, 1, 1, 1, 1, 1,
-0.9473358, 1.256863, -0.7913381, 1, 1, 1, 1, 1,
-0.9444209, -0.4602507, -1.554507, 1, 1, 1, 1, 1,
-0.93592, -0.1164053, 0.01025557, 1, 1, 1, 1, 1,
-0.931401, 0.1233169, -3.154908, 1, 1, 1, 1, 1,
-0.9293054, -1.308049, -2.13585, 1, 1, 1, 1, 1,
-0.9289202, -0.2245914, 1.012409, 1, 1, 1, 1, 1,
-0.9287505, 0.9442196, -0.6678546, 1, 1, 1, 1, 1,
-0.9233058, 0.4695863, 0.0620282, 0, 0, 1, 1, 1,
-0.9217668, 0.7385982, -1.854282, 1, 0, 0, 1, 1,
-0.9209235, 0.07325035, -0.07681626, 1, 0, 0, 1, 1,
-0.9003158, -0.5744143, -2.715165, 1, 0, 0, 1, 1,
-0.8978727, 0.4056799, -1.115535, 1, 0, 0, 1, 1,
-0.8978126, -1.818541, -0.03438003, 1, 0, 0, 1, 1,
-0.8974007, -0.5020557, -2.521925, 0, 0, 0, 1, 1,
-0.8971225, -0.7357808, -4.392387, 0, 0, 0, 1, 1,
-0.8941045, -0.1556393, -0.8882503, 0, 0, 0, 1, 1,
-0.8924594, 0.3303055, -0.09583022, 0, 0, 0, 1, 1,
-0.8894448, 0.5402241, -2.414314, 0, 0, 0, 1, 1,
-0.881963, -1.082522, -3.935479, 0, 0, 0, 1, 1,
-0.8816972, -0.2989843, -2.85443, 0, 0, 0, 1, 1,
-0.8754826, 1.864572, 0.06069356, 1, 1, 1, 1, 1,
-0.8632047, -0.2553095, -1.94799, 1, 1, 1, 1, 1,
-0.860388, 0.7447109, -0.664407, 1, 1, 1, 1, 1,
-0.8552721, -0.07341066, -2.83207, 1, 1, 1, 1, 1,
-0.8507358, 0.6083366, -0.6194828, 1, 1, 1, 1, 1,
-0.8471494, 0.2519129, -1.106367, 1, 1, 1, 1, 1,
-0.8461211, 0.06360726, -3.248154, 1, 1, 1, 1, 1,
-0.8455381, 0.919465, 1.476984, 1, 1, 1, 1, 1,
-0.8354335, 0.8755727, -1.427198, 1, 1, 1, 1, 1,
-0.8280768, -0.2891564, -1.29231, 1, 1, 1, 1, 1,
-0.8218028, 0.5843233, -1.803321, 1, 1, 1, 1, 1,
-0.8216466, -0.05919932, -1.624135, 1, 1, 1, 1, 1,
-0.8207752, -0.3867305, -2.725917, 1, 1, 1, 1, 1,
-0.812675, -0.3577474, -1.803054, 1, 1, 1, 1, 1,
-0.8111135, -0.5681753, -1.112411, 1, 1, 1, 1, 1,
-0.8039671, -0.4527166, -0.8268492, 0, 0, 1, 1, 1,
-0.8030549, 1.203298, -0.9680325, 1, 0, 0, 1, 1,
-0.7996809, 0.145629, 0.8047435, 1, 0, 0, 1, 1,
-0.7974337, 0.5780017, 0.05857914, 1, 0, 0, 1, 1,
-0.7878659, 0.4527117, -2.485761, 1, 0, 0, 1, 1,
-0.7854301, -0.09048929, 0.2000633, 1, 0, 0, 1, 1,
-0.7846691, -0.8737751, -1.56499, 0, 0, 0, 1, 1,
-0.7800019, -0.4250845, -2.816403, 0, 0, 0, 1, 1,
-0.771119, -1.653332, -3.571034, 0, 0, 0, 1, 1,
-0.7692943, -0.2446234, -1.782789, 0, 0, 0, 1, 1,
-0.764568, -2.438292, -2.479601, 0, 0, 0, 1, 1,
-0.759114, -0.9221374, -2.44675, 0, 0, 0, 1, 1,
-0.7516539, 1.288516, 0.9881185, 0, 0, 0, 1, 1,
-0.7471153, 0.2095665, -0.6559115, 1, 1, 1, 1, 1,
-0.7426323, 0.730119, -1.593407, 1, 1, 1, 1, 1,
-0.7424443, 0.04830277, -1.19813, 1, 1, 1, 1, 1,
-0.7363791, -0.8443387, -1.757145, 1, 1, 1, 1, 1,
-0.7328805, 1.254339, -0.3463947, 1, 1, 1, 1, 1,
-0.732025, 0.711275, -1.42395, 1, 1, 1, 1, 1,
-0.7303002, 1.084337, -1.375632, 1, 1, 1, 1, 1,
-0.7297396, 0.6923182, -0.2724802, 1, 1, 1, 1, 1,
-0.7258753, 0.4820805, 1.1725, 1, 1, 1, 1, 1,
-0.7252974, 1.221111, -2.11915, 1, 1, 1, 1, 1,
-0.7234322, -0.8357756, -1.739782, 1, 1, 1, 1, 1,
-0.7198611, 0.3438149, -1.336847, 1, 1, 1, 1, 1,
-0.7189701, -0.6956889, -1.397002, 1, 1, 1, 1, 1,
-0.7159285, 0.5644782, -1.454759, 1, 1, 1, 1, 1,
-0.7151113, 0.07799792, -0.7745252, 1, 1, 1, 1, 1,
-0.712509, 0.6913954, -0.3927641, 0, 0, 1, 1, 1,
-0.7118656, -0.8324435, -2.261777, 1, 0, 0, 1, 1,
-0.7109893, 0.02064701, -0.8182406, 1, 0, 0, 1, 1,
-0.7001086, -0.03134068, -0.5374907, 1, 0, 0, 1, 1,
-0.698024, -0.1096298, -1.65609, 1, 0, 0, 1, 1,
-0.6812201, 1.141822, -0.244068, 1, 0, 0, 1, 1,
-0.6781, -1.696566, -2.761537, 0, 0, 0, 1, 1,
-0.6752807, -0.5427615, -1.475543, 0, 0, 0, 1, 1,
-0.6742302, -1.759891, -1.673041, 0, 0, 0, 1, 1,
-0.6732123, -0.06955763, -1.968978, 0, 0, 0, 1, 1,
-0.669595, -0.1528912, -0.3132755, 0, 0, 0, 1, 1,
-0.668612, 0.8877195, -2.066657, 0, 0, 0, 1, 1,
-0.6647807, 0.2828289, -1.218347, 0, 0, 0, 1, 1,
-0.6612856, 1.235916, -0.6538478, 1, 1, 1, 1, 1,
-0.6523118, -0.3126729, -2.165258, 1, 1, 1, 1, 1,
-0.6437888, 0.9182315, -1.643761, 1, 1, 1, 1, 1,
-0.6405355, 0.0658439, -1.058336, 1, 1, 1, 1, 1,
-0.6398022, -1.141324, -3.103024, 1, 1, 1, 1, 1,
-0.6394579, -0.5260369, -1.033099, 1, 1, 1, 1, 1,
-0.6377657, -0.9716133, -1.24927, 1, 1, 1, 1, 1,
-0.632436, 0.3988582, -3.183627, 1, 1, 1, 1, 1,
-0.6289548, 0.1686192, -1.563088, 1, 1, 1, 1, 1,
-0.6199722, -1.17332, -2.169222, 1, 1, 1, 1, 1,
-0.6188576, -0.5077251, -2.841171, 1, 1, 1, 1, 1,
-0.6184738, 1.678129, -0.7962856, 1, 1, 1, 1, 1,
-0.6163127, 0.1404217, -0.6033455, 1, 1, 1, 1, 1,
-0.614705, -1.083148, -3.083627, 1, 1, 1, 1, 1,
-0.6134661, -0.08010428, -2.139337, 1, 1, 1, 1, 1,
-0.6129745, -0.4405372, -2.992231, 0, 0, 1, 1, 1,
-0.6114861, 1.958401, -0.1937962, 1, 0, 0, 1, 1,
-0.6111519, 1.958838, 0.6729258, 1, 0, 0, 1, 1,
-0.6106185, -0.3004198, -1.062222, 1, 0, 0, 1, 1,
-0.6092766, -0.2336138, -3.114899, 1, 0, 0, 1, 1,
-0.6060556, 0.05408626, -0.7580433, 1, 0, 0, 1, 1,
-0.6055772, -0.07447075, -1.654365, 0, 0, 0, 1, 1,
-0.6045622, 0.5427589, -0.8044643, 0, 0, 0, 1, 1,
-0.6007486, -0.3427691, -1.024406, 0, 0, 0, 1, 1,
-0.5985219, -1.110327, -3.528844, 0, 0, 0, 1, 1,
-0.594662, 0.7297176, -0.2219743, 0, 0, 0, 1, 1,
-0.5946447, -0.6343663, -3.481811, 0, 0, 0, 1, 1,
-0.594001, -1.114715, -3.263688, 0, 0, 0, 1, 1,
-0.5926521, 0.3604777, -0.6451606, 1, 1, 1, 1, 1,
-0.5920933, -1.985074, -3.367478, 1, 1, 1, 1, 1,
-0.5911129, 0.5196418, -1.106413, 1, 1, 1, 1, 1,
-0.582711, -0.5791867, -2.752291, 1, 1, 1, 1, 1,
-0.5754735, 0.5118906, -0.5294052, 1, 1, 1, 1, 1,
-0.573506, -0.03785517, -2.580239, 1, 1, 1, 1, 1,
-0.5729169, 0.1434351, -1.962997, 1, 1, 1, 1, 1,
-0.5703457, 1.04167, -1.674557, 1, 1, 1, 1, 1,
-0.5702061, -1.168501, -2.324975, 1, 1, 1, 1, 1,
-0.5697348, -0.4081357, -0.8571156, 1, 1, 1, 1, 1,
-0.5685779, -1.52204, -2.325323, 1, 1, 1, 1, 1,
-0.5646952, -0.7160457, -3.917407, 1, 1, 1, 1, 1,
-0.5605224, 0.564603, -0.375121, 1, 1, 1, 1, 1,
-0.5601321, 0.03407294, -1.952626, 1, 1, 1, 1, 1,
-0.5600843, 0.6815155, 0.1013037, 1, 1, 1, 1, 1,
-0.5532703, 0.565824, -1.262506, 0, 0, 1, 1, 1,
-0.5522752, -0.7597618, -3.060354, 1, 0, 0, 1, 1,
-0.5502748, 0.07606331, -3.042701, 1, 0, 0, 1, 1,
-0.5486801, 1.398476, -1.115537, 1, 0, 0, 1, 1,
-0.5483746, 1.558282, -0.06970679, 1, 0, 0, 1, 1,
-0.5477847, 0.6601039, -1.48379, 1, 0, 0, 1, 1,
-0.5466872, 1.695961, -1.062783, 0, 0, 0, 1, 1,
-0.5459228, -0.2182949, -2.095274, 0, 0, 0, 1, 1,
-0.5440336, 0.8732374, 0.614456, 0, 0, 0, 1, 1,
-0.5405963, -0.3001675, -4.089257, 0, 0, 0, 1, 1,
-0.5351843, -1.041226, -0.6657562, 0, 0, 0, 1, 1,
-0.5331315, 0.7881747, 0.8312181, 0, 0, 0, 1, 1,
-0.5327098, -1.266056, -2.766263, 0, 0, 0, 1, 1,
-0.5232615, 0.5463867, -0.7050235, 1, 1, 1, 1, 1,
-0.5202515, -0.3321993, -1.495749, 1, 1, 1, 1, 1,
-0.5180951, 0.2749023, -1.864338, 1, 1, 1, 1, 1,
-0.5168301, 0.6324857, -0.1568756, 1, 1, 1, 1, 1,
-0.505865, -1.424884, -3.706865, 1, 1, 1, 1, 1,
-0.5056766, -1.194199, -1.751749, 1, 1, 1, 1, 1,
-0.5018812, -0.1056857, -0.6915035, 1, 1, 1, 1, 1,
-0.5014338, -0.1061235, -1.909845, 1, 1, 1, 1, 1,
-0.4999891, 0.9101428, 1.792109, 1, 1, 1, 1, 1,
-0.4943484, -0.5644432, -1.778719, 1, 1, 1, 1, 1,
-0.4819537, 0.4783119, -0.4259635, 1, 1, 1, 1, 1,
-0.4817729, 1.366223, 2.275979, 1, 1, 1, 1, 1,
-0.4801297, -1.212563, -4.229717, 1, 1, 1, 1, 1,
-0.4766878, 0.5613171, 0.6040424, 1, 1, 1, 1, 1,
-0.4751741, -0.6457129, -1.041709, 1, 1, 1, 1, 1,
-0.4715336, 0.2966059, 0.1065124, 0, 0, 1, 1, 1,
-0.4597659, 1.291932, 0.3672001, 1, 0, 0, 1, 1,
-0.4590643, 0.6894964, -0.4077044, 1, 0, 0, 1, 1,
-0.4567058, 1.070489, -1.639586, 1, 0, 0, 1, 1,
-0.4510566, 0.4532127, -1.560994, 1, 0, 0, 1, 1,
-0.4461767, -1.668134, -1.541073, 1, 0, 0, 1, 1,
-0.4458512, 0.139289, -1.537738, 0, 0, 0, 1, 1,
-0.4401512, 0.4939783, -0.294475, 0, 0, 0, 1, 1,
-0.4400797, 0.7054113, -1.457643, 0, 0, 0, 1, 1,
-0.4392694, 0.5672789, -1.962355, 0, 0, 0, 1, 1,
-0.4352854, -0.2940525, -2.411515, 0, 0, 0, 1, 1,
-0.4343853, -0.5227903, -2.765302, 0, 0, 0, 1, 1,
-0.4263296, -0.6895841, -2.359207, 0, 0, 0, 1, 1,
-0.4236937, -0.5121849, -2.839048, 1, 1, 1, 1, 1,
-0.4212363, -1.071988, -3.678608, 1, 1, 1, 1, 1,
-0.420164, 1.458095, -0.07245543, 1, 1, 1, 1, 1,
-0.4197223, -0.4916417, -1.954034, 1, 1, 1, 1, 1,
-0.4195936, -0.7080405, -3.078672, 1, 1, 1, 1, 1,
-0.4181006, -0.2197393, -2.80152, 1, 1, 1, 1, 1,
-0.4103211, 0.1799016, -2.19813, 1, 1, 1, 1, 1,
-0.4094283, 1.014378, -0.7921056, 1, 1, 1, 1, 1,
-0.4070201, -0.6937231, -4.889598, 1, 1, 1, 1, 1,
-0.4062847, -0.6519361, -3.554897, 1, 1, 1, 1, 1,
-0.4050844, 1.170888, 0.5075017, 1, 1, 1, 1, 1,
-0.3989148, 0.7100387, -2.308732, 1, 1, 1, 1, 1,
-0.3959001, 1.421163, -1.928752, 1, 1, 1, 1, 1,
-0.3872791, -1.770022, -2.487723, 1, 1, 1, 1, 1,
-0.3852713, 1.222653, -0.4215356, 1, 1, 1, 1, 1,
-0.3835464, -0.398008, -2.803396, 0, 0, 1, 1, 1,
-0.3805259, -0.4146035, -2.399718, 1, 0, 0, 1, 1,
-0.375154, 1.358199, -1.510307, 1, 0, 0, 1, 1,
-0.3749813, 1.526556, 1.256575, 1, 0, 0, 1, 1,
-0.3748466, 0.8988684, 0.3325935, 1, 0, 0, 1, 1,
-0.3739242, 0.7346348, -1.935918, 1, 0, 0, 1, 1,
-0.3730309, -0.2809865, -3.338598, 0, 0, 0, 1, 1,
-0.3595501, 0.2706042, 0.752634, 0, 0, 0, 1, 1,
-0.3572393, 0.431624, 0.6473436, 0, 0, 0, 1, 1,
-0.3542363, 0.1783495, -0.4307925, 0, 0, 0, 1, 1,
-0.3539418, 0.2702816, -2.330077, 0, 0, 0, 1, 1,
-0.3485691, 2.704973, -0.8310866, 0, 0, 0, 1, 1,
-0.3470472, -1.896759, -2.517583, 0, 0, 0, 1, 1,
-0.3448297, -1.644225, -1.970538, 1, 1, 1, 1, 1,
-0.3439581, 1.237539, -1.392896, 1, 1, 1, 1, 1,
-0.3398871, 0.7848094, -0.06265996, 1, 1, 1, 1, 1,
-0.3385968, -0.7647719, -2.277049, 1, 1, 1, 1, 1,
-0.3382963, -2.574133, -3.87894, 1, 1, 1, 1, 1,
-0.3377735, -0.2471362, -2.624071, 1, 1, 1, 1, 1,
-0.3344242, -1.463707, -4.525326, 1, 1, 1, 1, 1,
-0.3266084, -0.600063, -1.894856, 1, 1, 1, 1, 1,
-0.3245042, -1.790327, -3.368226, 1, 1, 1, 1, 1,
-0.3160307, -0.4062772, -2.412549, 1, 1, 1, 1, 1,
-0.3136444, 0.3167506, -1.538864, 1, 1, 1, 1, 1,
-0.3131791, -0.5421084, -2.077295, 1, 1, 1, 1, 1,
-0.3089191, 0.2794867, -0.2211998, 1, 1, 1, 1, 1,
-0.3086731, -1.397122, -3.006684, 1, 1, 1, 1, 1,
-0.308254, -0.21169, -1.919859, 1, 1, 1, 1, 1,
-0.3064609, 1.850146, 0.1908569, 0, 0, 1, 1, 1,
-0.3022916, 0.6319785, -0.2189795, 1, 0, 0, 1, 1,
-0.2997572, 0.4891622, -1.90607, 1, 0, 0, 1, 1,
-0.2922598, -1.14385, -2.555476, 1, 0, 0, 1, 1,
-0.2915216, -0.5171561, -1.59227, 1, 0, 0, 1, 1,
-0.2890358, -0.3963633, -1.710322, 1, 0, 0, 1, 1,
-0.2878304, -0.006824987, -1.552083, 0, 0, 0, 1, 1,
-0.2875421, 1.026157, 1.467127, 0, 0, 0, 1, 1,
-0.2825289, 0.5823269, -1.40862, 0, 0, 0, 1, 1,
-0.278619, 1.571663, -0.4049582, 0, 0, 0, 1, 1,
-0.2767551, -1.486976, -2.182156, 0, 0, 0, 1, 1,
-0.2759488, 0.3719072, 0.4733964, 0, 0, 0, 1, 1,
-0.2752446, -1.327343, -4.575481, 0, 0, 0, 1, 1,
-0.2734191, -1.546369, -4.200724, 1, 1, 1, 1, 1,
-0.2726754, 0.5667268, -0.4249731, 1, 1, 1, 1, 1,
-0.2710878, -0.2427805, -1.018453, 1, 1, 1, 1, 1,
-0.2705538, 0.6484103, -1.599714, 1, 1, 1, 1, 1,
-0.2671306, -1.31493, -3.738357, 1, 1, 1, 1, 1,
-0.2667701, 0.4704937, -0.6048514, 1, 1, 1, 1, 1,
-0.2662511, -1.718313, -2.703777, 1, 1, 1, 1, 1,
-0.261626, -0.3270477, -0.9884526, 1, 1, 1, 1, 1,
-0.2608238, 0.08425419, -1.181649, 1, 1, 1, 1, 1,
-0.2493533, 1.885786, 0.09525497, 1, 1, 1, 1, 1,
-0.2485601, -1.111973, -3.649489, 1, 1, 1, 1, 1,
-0.2432192, -0.6018015, -1.891131, 1, 1, 1, 1, 1,
-0.2370193, 0.2619981, 1.100719, 1, 1, 1, 1, 1,
-0.2265269, -0.1792584, -5.319489, 1, 1, 1, 1, 1,
-0.222709, -0.7426825, -2.587188, 1, 1, 1, 1, 1,
-0.2221569, 0.7933397, -0.5486422, 0, 0, 1, 1, 1,
-0.218029, 0.7468265, -0.5344549, 1, 0, 0, 1, 1,
-0.2127528, -1.810392, -2.6066, 1, 0, 0, 1, 1,
-0.2121243, -1.263458, -1.881927, 1, 0, 0, 1, 1,
-0.2063866, -1.779783, -3.574094, 1, 0, 0, 1, 1,
-0.2063295, -0.09992988, -1.810395, 1, 0, 0, 1, 1,
-0.2000673, 1.760168, -0.9130292, 0, 0, 0, 1, 1,
-0.1989757, -0.08925298, -2.094416, 0, 0, 0, 1, 1,
-0.1980419, 1.052518, -0.167154, 0, 0, 0, 1, 1,
-0.1970437, 0.09423582, -2.517032, 0, 0, 0, 1, 1,
-0.1965079, 0.3085838, 1.319773, 0, 0, 0, 1, 1,
-0.1964685, -2.106005, -5.27673, 0, 0, 0, 1, 1,
-0.1955599, 1.099202, -0.09253498, 0, 0, 0, 1, 1,
-0.1927327, -1.399983, -2.534394, 1, 1, 1, 1, 1,
-0.1921521, 0.6913677, -0.8691807, 1, 1, 1, 1, 1,
-0.1918339, -1.310677, -2.965472, 1, 1, 1, 1, 1,
-0.1883947, 1.039758, -1.869441, 1, 1, 1, 1, 1,
-0.1879931, -1.16552, -2.977088, 1, 1, 1, 1, 1,
-0.1871007, 0.8324254, 1.671486, 1, 1, 1, 1, 1,
-0.1862481, -0.3819842, -2.681086, 1, 1, 1, 1, 1,
-0.1839684, -0.1012364, -1.247128, 1, 1, 1, 1, 1,
-0.1830169, 0.5016502, -1.864368, 1, 1, 1, 1, 1,
-0.1810851, -0.4350411, -2.726431, 1, 1, 1, 1, 1,
-0.1784147, 0.3213209, -0.1119414, 1, 1, 1, 1, 1,
-0.1782135, -0.102899, -0.5377889, 1, 1, 1, 1, 1,
-0.1774989, -2.135584, -3.397091, 1, 1, 1, 1, 1,
-0.1746456, 0.1609269, -0.256546, 1, 1, 1, 1, 1,
-0.1735987, -1.255928, -4.777366, 1, 1, 1, 1, 1,
-0.1715196, 2.019621, 0.1034577, 0, 0, 1, 1, 1,
-0.1674132, 2.05124, 0.5595043, 1, 0, 0, 1, 1,
-0.1627548, -1.018442, -3.749511, 1, 0, 0, 1, 1,
-0.1618912, 0.7401179, -1.832631, 1, 0, 0, 1, 1,
-0.1590901, 2.818838, 0.4761611, 1, 0, 0, 1, 1,
-0.1587941, 0.6387042, -0.4150578, 1, 0, 0, 1, 1,
-0.1570078, -0.8074983, -3.865862, 0, 0, 0, 1, 1,
-0.1492635, 1.855246, 0.4882043, 0, 0, 0, 1, 1,
-0.1486536, 0.2425989, 0.09609281, 0, 0, 0, 1, 1,
-0.1486375, 0.6206741, -1.261538, 0, 0, 0, 1, 1,
-0.1462115, -0.5508138, -3.407414, 0, 0, 0, 1, 1,
-0.1356471, -0.1044643, -3.855698, 0, 0, 0, 1, 1,
-0.1320065, 2.107562, -0.1211083, 0, 0, 0, 1, 1,
-0.1233474, -1.122736, -1.851609, 1, 1, 1, 1, 1,
-0.1232508, 1.268022, -0.9192007, 1, 1, 1, 1, 1,
-0.1151406, 0.2613775, 0.2074782, 1, 1, 1, 1, 1,
-0.1119852, -0.7985404, -1.811482, 1, 1, 1, 1, 1,
-0.1105251, -0.06255639, -3.858353, 1, 1, 1, 1, 1,
-0.1104297, -0.8931261, -2.695706, 1, 1, 1, 1, 1,
-0.1097583, -1.246025, -2.182062, 1, 1, 1, 1, 1,
-0.1075958, 0.4183081, -0.2775577, 1, 1, 1, 1, 1,
-0.106942, -1.183225, -4.220422, 1, 1, 1, 1, 1,
-0.1068654, 1.604149, 0.2997956, 1, 1, 1, 1, 1,
-0.1041826, 2.089541, 0.8499933, 1, 1, 1, 1, 1,
-0.1037904, -0.7662769, -3.337292, 1, 1, 1, 1, 1,
-0.1013125, -0.55506, -1.897587, 1, 1, 1, 1, 1,
-0.1012364, 0.1847502, -0.6438913, 1, 1, 1, 1, 1,
-0.09913272, -0.697942, -3.78009, 1, 1, 1, 1, 1,
-0.09686507, 1.474739, -0.3539668, 0, 0, 1, 1, 1,
-0.09594984, 1.554098, -1.087884, 1, 0, 0, 1, 1,
-0.09488296, -0.3340568, -1.449216, 1, 0, 0, 1, 1,
-0.09434503, -1.711701, -2.125662, 1, 0, 0, 1, 1,
-0.09358034, -0.1483382, -2.805306, 1, 0, 0, 1, 1,
-0.09168833, -0.5398254, -2.770251, 1, 0, 0, 1, 1,
-0.09160393, -0.6150669, -2.274856, 0, 0, 0, 1, 1,
-0.08682752, -0.6776873, -3.994335, 0, 0, 0, 1, 1,
-0.0861036, -0.4269284, -3.210406, 0, 0, 0, 1, 1,
-0.08585191, -0.7368203, -2.103298, 0, 0, 0, 1, 1,
-0.08544773, -0.3139653, -2.475704, 0, 0, 0, 1, 1,
-0.08438233, -0.4680383, -2.414867, 0, 0, 0, 1, 1,
-0.08221246, 0.4680246, 0.02390129, 0, 0, 0, 1, 1,
-0.08057559, 1.439784, -0.3007125, 1, 1, 1, 1, 1,
-0.07786737, 0.7166734, -0.0002722104, 1, 1, 1, 1, 1,
-0.07421717, -0.1557412, -3.774489, 1, 1, 1, 1, 1,
-0.07163093, 0.654811, 0.08285294, 1, 1, 1, 1, 1,
-0.06974641, 1.715169, 0.4020634, 1, 1, 1, 1, 1,
-0.06962649, -1.323991, -3.78262, 1, 1, 1, 1, 1,
-0.06903651, -0.9815147, -3.603672, 1, 1, 1, 1, 1,
-0.06708509, 0.4960282, -0.5553911, 1, 1, 1, 1, 1,
-0.05799657, 0.03081302, -2.232266, 1, 1, 1, 1, 1,
-0.05644699, -0.3184821, -3.280162, 1, 1, 1, 1, 1,
-0.05457919, 1.795471, -0.04448861, 1, 1, 1, 1, 1,
-0.04882755, -0.3456067, -3.970241, 1, 1, 1, 1, 1,
-0.04319638, 1.313572, 1.317069, 1, 1, 1, 1, 1,
-0.03801785, -1.81995, -0.819216, 1, 1, 1, 1, 1,
-0.03761452, 1.775846, -0.9221345, 1, 1, 1, 1, 1,
-0.03470845, -1.401738, -3.080695, 0, 0, 1, 1, 1,
-0.03402154, 1.584773, 1.519131, 1, 0, 0, 1, 1,
-0.02717892, -2.029596, -3.059796, 1, 0, 0, 1, 1,
-0.02480189, 1.152821, 0.0920574, 1, 0, 0, 1, 1,
-0.02318683, -1.422343, -4.295965, 1, 0, 0, 1, 1,
-0.01908986, 1.510146, -1.229032, 1, 0, 0, 1, 1,
-0.0169911, 0.4605452, -0.5054309, 0, 0, 0, 1, 1,
-0.008685132, -0.3732037, -3.618358, 0, 0, 0, 1, 1,
-0.008030506, -0.3234922, -4.676092, 0, 0, 0, 1, 1,
-0.007880324, 1.940429, 0.6739706, 0, 0, 0, 1, 1,
-0.004063242, 0.1370104, 2.200924, 0, 0, 0, 1, 1,
-0.003239815, 1.683685, 1.2579, 0, 0, 0, 1, 1,
-0.0007814416, -1.182148, -3.624344, 0, 0, 0, 1, 1,
-8.271243e-05, 0.0120004, -0.06088553, 1, 1, 1, 1, 1,
0.003211565, 0.7103931, -1.037969, 1, 1, 1, 1, 1,
0.01062494, 0.5741652, -1.202985, 1, 1, 1, 1, 1,
0.01288232, -0.0406034, 2.794407, 1, 1, 1, 1, 1,
0.01517637, -0.4251719, 4.23827, 1, 1, 1, 1, 1,
0.01671211, -0.6390563, 1.837324, 1, 1, 1, 1, 1,
0.0178686, 1.595112, 0.465538, 1, 1, 1, 1, 1,
0.02176488, -0.6365827, 3.621181, 1, 1, 1, 1, 1,
0.02297719, -0.3055979, 2.924678, 1, 1, 1, 1, 1,
0.0235572, 0.002297624, 0.9084291, 1, 1, 1, 1, 1,
0.02531048, 0.9182666, 0.4142263, 1, 1, 1, 1, 1,
0.02827499, 0.6903211, 0.3901671, 1, 1, 1, 1, 1,
0.03037653, -0.7793024, 1.725307, 1, 1, 1, 1, 1,
0.03722348, -0.9922637, 2.94039, 1, 1, 1, 1, 1,
0.03939909, -0.6890312, 4.057378, 1, 1, 1, 1, 1,
0.03969366, 0.09760966, 0.1905959, 0, 0, 1, 1, 1,
0.04174605, -1.161344, 3.317002, 1, 0, 0, 1, 1,
0.04265255, -1.42441, 2.130158, 1, 0, 0, 1, 1,
0.04508937, 0.00117782, 1.848382, 1, 0, 0, 1, 1,
0.05115838, 0.4392646, 0.9258472, 1, 0, 0, 1, 1,
0.05118152, -0.2652745, 1.615603, 1, 0, 0, 1, 1,
0.05545413, 0.06859986, -0.2092111, 0, 0, 0, 1, 1,
0.05828267, 0.2529951, -1.439149, 0, 0, 0, 1, 1,
0.0598059, 1.193172, 0.5663052, 0, 0, 0, 1, 1,
0.06056055, 0.2509459, 1.100332, 0, 0, 0, 1, 1,
0.06813321, -1.128174, 4.969724, 0, 0, 0, 1, 1,
0.0696905, 0.2721547, 1.662288, 0, 0, 0, 1, 1,
0.07614033, -0.3203563, 1.164151, 0, 0, 0, 1, 1,
0.08486264, 2.851223, 2.402306, 1, 1, 1, 1, 1,
0.0867901, 0.9689215, -0.528194, 1, 1, 1, 1, 1,
0.08840246, -1.959547, 3.831897, 1, 1, 1, 1, 1,
0.09074315, 0.5831265, 1.853123, 1, 1, 1, 1, 1,
0.09405093, 0.6853689, 0.02538394, 1, 1, 1, 1, 1,
0.09692639, 0.9829753, 1.819514, 1, 1, 1, 1, 1,
0.09720373, -0.4504278, 3.071227, 1, 1, 1, 1, 1,
0.09989826, -0.9534347, 4.061445, 1, 1, 1, 1, 1,
0.1002839, 0.06894822, 0.2838371, 1, 1, 1, 1, 1,
0.1022939, -0.2015148, 3.249192, 1, 1, 1, 1, 1,
0.1069367, -0.9853249, 2.747708, 1, 1, 1, 1, 1,
0.1078758, 1.001448, 0.8142501, 1, 1, 1, 1, 1,
0.1146988, 0.1162559, 1.607737, 1, 1, 1, 1, 1,
0.1163168, 1.862543, -1.270994, 1, 1, 1, 1, 1,
0.1163703, -0.4546341, 2.138231, 1, 1, 1, 1, 1,
0.1165545, -1.739836, 3.72088, 0, 0, 1, 1, 1,
0.1258795, -1.254376, 3.03274, 1, 0, 0, 1, 1,
0.1268917, -0.9623024, 2.543539, 1, 0, 0, 1, 1,
0.1336717, 0.6889351, -0.0923214, 1, 0, 0, 1, 1,
0.1357895, -2.510207, 3.412071, 1, 0, 0, 1, 1,
0.1359083, -0.2891914, 4.587772, 1, 0, 0, 1, 1,
0.1360337, -0.2044464, 0.5669181, 0, 0, 0, 1, 1,
0.1390229, 0.9065457, -1.19662, 0, 0, 0, 1, 1,
0.13938, 0.752641, 1.508109, 0, 0, 0, 1, 1,
0.1414357, -0.9819165, 2.272945, 0, 0, 0, 1, 1,
0.1430026, 0.7430648, -0.4684654, 0, 0, 0, 1, 1,
0.1430072, 1.17741, -0.3617123, 0, 0, 0, 1, 1,
0.1447588, 0.7724161, 0.3065276, 0, 0, 0, 1, 1,
0.1452426, 0.1347068, 1.165317, 1, 1, 1, 1, 1,
0.1462959, 1.498419, -0.05833714, 1, 1, 1, 1, 1,
0.1517223, 0.5362864, -1.602197, 1, 1, 1, 1, 1,
0.1544493, 0.55507, -1.485296, 1, 1, 1, 1, 1,
0.154523, -0.3864132, 2.724181, 1, 1, 1, 1, 1,
0.1546657, -1.147018, 4.38426, 1, 1, 1, 1, 1,
0.1576457, 1.089469, -0.1191272, 1, 1, 1, 1, 1,
0.1657934, 0.537918, -0.5236765, 1, 1, 1, 1, 1,
0.167304, -0.5455871, 3.782134, 1, 1, 1, 1, 1,
0.1700144, 0.1695005, 1.3604, 1, 1, 1, 1, 1,
0.1700772, 0.384619, 1.12583, 1, 1, 1, 1, 1,
0.1716038, 0.7423173, -0.9362143, 1, 1, 1, 1, 1,
0.1762751, -0.5919949, 5.116709, 1, 1, 1, 1, 1,
0.182347, -0.3430814, 3.211895, 1, 1, 1, 1, 1,
0.1911821, 2.004404, 0.407625, 1, 1, 1, 1, 1,
0.1926419, 1.064339, 0.3294479, 0, 0, 1, 1, 1,
0.1954059, -0.760909, 3.299577, 1, 0, 0, 1, 1,
0.1992043, 1.934923, -0.1181068, 1, 0, 0, 1, 1,
0.2050798, -0.1714778, 2.241248, 1, 0, 0, 1, 1,
0.2094628, -0.8564657, 4.93713, 1, 0, 0, 1, 1,
0.210694, -0.1814153, 1.059054, 1, 0, 0, 1, 1,
0.2116595, -0.4076427, 2.710946, 0, 0, 0, 1, 1,
0.2136495, -1.018835, 2.1557, 0, 0, 0, 1, 1,
0.213734, -0.3682973, 2.360274, 0, 0, 0, 1, 1,
0.2139377, -0.4095882, 2.542788, 0, 0, 0, 1, 1,
0.2143845, -1.515269, 2.946515, 0, 0, 0, 1, 1,
0.2161055, 0.3204051, -0.0361793, 0, 0, 0, 1, 1,
0.2179369, 0.81519, 0.102715, 0, 0, 0, 1, 1,
0.2218174, 0.07036844, -0.4428193, 1, 1, 1, 1, 1,
0.2229948, 0.03667868, -0.9267837, 1, 1, 1, 1, 1,
0.2267139, 1.695338, 1.191159, 1, 1, 1, 1, 1,
0.2284231, -0.5623727, 3.045158, 1, 1, 1, 1, 1,
0.229466, -0.2387078, 1.474094, 1, 1, 1, 1, 1,
0.2303881, 0.2340454, -0.5975284, 1, 1, 1, 1, 1,
0.2333436, -1.287174, 3.45257, 1, 1, 1, 1, 1,
0.2340305, -0.278974, 2.571524, 1, 1, 1, 1, 1,
0.2350166, -0.6585687, 3.649983, 1, 1, 1, 1, 1,
0.2359121, 0.1808802, 1.770925, 1, 1, 1, 1, 1,
0.2414458, -1.299465, 2.289724, 1, 1, 1, 1, 1,
0.2415543, 1.780738, 2.333517, 1, 1, 1, 1, 1,
0.2434821, -0.6388681, 3.842239, 1, 1, 1, 1, 1,
0.2466137, 0.5389779, 0.1723063, 1, 1, 1, 1, 1,
0.2499396, -0.09909852, 0.2420508, 1, 1, 1, 1, 1,
0.2523051, -0.9263936, 2.835722, 0, 0, 1, 1, 1,
0.2527813, -0.9454148, 1.261067, 1, 0, 0, 1, 1,
0.2578754, 0.5012384, -1.12282, 1, 0, 0, 1, 1,
0.2602444, -0.790965, 2.824984, 1, 0, 0, 1, 1,
0.2629442, 0.02185141, 1.757166, 1, 0, 0, 1, 1,
0.2673487, -0.8208518, 1.841167, 1, 0, 0, 1, 1,
0.2700193, -0.4148077, 2.148075, 0, 0, 0, 1, 1,
0.2732558, -2.237971, 4.68275, 0, 0, 0, 1, 1,
0.2781402, 1.699926, 0.3647647, 0, 0, 0, 1, 1,
0.2825549, 0.4863232, 0.2660222, 0, 0, 0, 1, 1,
0.2856765, 0.03082315, 1.558313, 0, 0, 0, 1, 1,
0.2858061, 0.2303784, -1.713408, 0, 0, 0, 1, 1,
0.2862872, 1.410357, -1.147576, 0, 0, 0, 1, 1,
0.289049, 0.3418187, 1.071592, 1, 1, 1, 1, 1,
0.2890565, -0.7446145, 4.054294, 1, 1, 1, 1, 1,
0.290323, 1.15418, -0.7955051, 1, 1, 1, 1, 1,
0.2907858, 0.09621944, 1.822604, 1, 1, 1, 1, 1,
0.2941125, -2.548604, 5.564964, 1, 1, 1, 1, 1,
0.2993161, -1.18964, 4.13752, 1, 1, 1, 1, 1,
0.2994926, -1.77003, 3.534782, 1, 1, 1, 1, 1,
0.3005518, 0.3895677, 0.08485347, 1, 1, 1, 1, 1,
0.3006192, -0.3075722, 1.886264, 1, 1, 1, 1, 1,
0.3022291, -2.2004, 2.247572, 1, 1, 1, 1, 1,
0.3033788, 1.469858, 1.126749, 1, 1, 1, 1, 1,
0.3083685, -0.8502027, 0.9551492, 1, 1, 1, 1, 1,
0.3089025, -0.7762892, 1.933388, 1, 1, 1, 1, 1,
0.3111576, 0.8746526, 0.9652101, 1, 1, 1, 1, 1,
0.3118059, -1.267401, 2.694535, 1, 1, 1, 1, 1,
0.3119116, -0.224988, 3.056837, 0, 0, 1, 1, 1,
0.3173121, 1.004968, -0.5326945, 1, 0, 0, 1, 1,
0.317443, 0.01409725, 2.761541, 1, 0, 0, 1, 1,
0.3182308, -1.180714, 3.330927, 1, 0, 0, 1, 1,
0.320102, -0.5467603, 1.727747, 1, 0, 0, 1, 1,
0.3261663, 0.8434162, 1.329473, 1, 0, 0, 1, 1,
0.3278096, -0.5603642, 2.478698, 0, 0, 0, 1, 1,
0.3298316, 0.5990139, -0.3596511, 0, 0, 0, 1, 1,
0.3299895, 1.084558, 0.2955979, 0, 0, 0, 1, 1,
0.3316004, -2.154805, 3.159739, 0, 0, 0, 1, 1,
0.3342815, 1.788893, -0.7838508, 0, 0, 0, 1, 1,
0.3370075, -1.43228, 2.714845, 0, 0, 0, 1, 1,
0.3377017, -1.586757, 3.676702, 0, 0, 0, 1, 1,
0.3403204, 0.02298724, 2.880916, 1, 1, 1, 1, 1,
0.3406441, -1.241427, 2.540256, 1, 1, 1, 1, 1,
0.3409559, 0.8869324, -0.3751096, 1, 1, 1, 1, 1,
0.3501874, 0.5094073, 1.118188, 1, 1, 1, 1, 1,
0.3516467, 1.014747, 2.592043, 1, 1, 1, 1, 1,
0.3537919, -1.480186, 4.189404, 1, 1, 1, 1, 1,
0.3573659, -0.2716591, 0.9320205, 1, 1, 1, 1, 1,
0.363531, -0.8985894, 2.538112, 1, 1, 1, 1, 1,
0.3643086, -0.9918042, 0.9643476, 1, 1, 1, 1, 1,
0.3703405, -0.4360383, 2.547333, 1, 1, 1, 1, 1,
0.3710724, 0.4727316, 0.09838365, 1, 1, 1, 1, 1,
0.3732071, 1.23808, 0.4961703, 1, 1, 1, 1, 1,
0.3769147, -1.403289, 2.26289, 1, 1, 1, 1, 1,
0.3777163, -0.3980937, 2.505577, 1, 1, 1, 1, 1,
0.3798731, 0.4547388, 0.8332049, 1, 1, 1, 1, 1,
0.3850498, 1.939849, 1.398498, 0, 0, 1, 1, 1,
0.387644, 1.002113, -0.4573025, 1, 0, 0, 1, 1,
0.3892691, 0.664152, 0.8250367, 1, 0, 0, 1, 1,
0.3903528, 2.658857, -2.28232, 1, 0, 0, 1, 1,
0.3937013, -1.015301, 3.170296, 1, 0, 0, 1, 1,
0.3972235, 1.137378, 0.486297, 1, 0, 0, 1, 1,
0.4009905, -1.201045, 3.85043, 0, 0, 0, 1, 1,
0.4016059, -0.006531547, 1.512968, 0, 0, 0, 1, 1,
0.404115, 1.796415, -0.5413259, 0, 0, 0, 1, 1,
0.4062953, -0.1992046, 2.017016, 0, 0, 0, 1, 1,
0.4140205, -1.86973, 2.827404, 0, 0, 0, 1, 1,
0.4151798, 2.506903, 0.1909184, 0, 0, 0, 1, 1,
0.4222877, -1.387028, 2.869307, 0, 0, 0, 1, 1,
0.4244787, -0.02033262, 2.277413, 1, 1, 1, 1, 1,
0.4336235, 0.8665899, 1.176032, 1, 1, 1, 1, 1,
0.4402326, -0.5864114, 2.31188, 1, 1, 1, 1, 1,
0.4444461, 1.33845, 1.116863, 1, 1, 1, 1, 1,
0.4446467, -0.9628847, 1.931996, 1, 1, 1, 1, 1,
0.4480295, 0.9170004, 1.189675, 1, 1, 1, 1, 1,
0.4574413, 0.6130288, 1.781616, 1, 1, 1, 1, 1,
0.4584804, -1.877486, 4.115842, 1, 1, 1, 1, 1,
0.4595883, 0.2878774, 1.931175, 1, 1, 1, 1, 1,
0.4637721, 0.6053419, 1.634876, 1, 1, 1, 1, 1,
0.4642982, -0.1404175, 0.3766603, 1, 1, 1, 1, 1,
0.4643908, 0.4866661, 0.7200386, 1, 1, 1, 1, 1,
0.4724153, -0.8929955, 3.010755, 1, 1, 1, 1, 1,
0.4750603, -0.7302386, 2.335681, 1, 1, 1, 1, 1,
0.4756176, -0.2037506, 1.309706, 1, 1, 1, 1, 1,
0.4789263, 0.8185303, -0.4532282, 0, 0, 1, 1, 1,
0.4810276, 0.4277314, 0.4859762, 1, 0, 0, 1, 1,
0.4838972, 2.088527, -1.157726, 1, 0, 0, 1, 1,
0.4876262, -1.949583, 2.86144, 1, 0, 0, 1, 1,
0.4957424, 0.3116442, 0.9417015, 1, 0, 0, 1, 1,
0.5056517, 0.2346081, 2.41312, 1, 0, 0, 1, 1,
0.5072308, -0.4122808, 2.929059, 0, 0, 0, 1, 1,
0.5089649, -0.2650112, 1.803913, 0, 0, 0, 1, 1,
0.5092925, -0.7952607, 2.197355, 0, 0, 0, 1, 1,
0.5097249, -0.7531404, 3.888776, 0, 0, 0, 1, 1,
0.5101868, -0.01557678, 1.588027, 0, 0, 0, 1, 1,
0.5148208, -0.6734062, 0.607649, 0, 0, 0, 1, 1,
0.5154679, -1.532275, 4.109059, 0, 0, 0, 1, 1,
0.5232112, 0.5024931, -0.3397887, 1, 1, 1, 1, 1,
0.5254103, -1.069443, 3.318761, 1, 1, 1, 1, 1,
0.5295397, 1.907185, -0.7842169, 1, 1, 1, 1, 1,
0.5299862, 0.2660291, 1.307365, 1, 1, 1, 1, 1,
0.5300302, 0.1040725, 2.149697, 1, 1, 1, 1, 1,
0.5349081, -0.7390482, 2.272666, 1, 1, 1, 1, 1,
0.538926, 0.4830711, 0.6299772, 1, 1, 1, 1, 1,
0.5420805, 1.192849, 1.635963, 1, 1, 1, 1, 1,
0.5440963, -2.084321, 3.046602, 1, 1, 1, 1, 1,
0.5484813, 0.03408678, 0.3733657, 1, 1, 1, 1, 1,
0.5494152, -1.864699, 1.48984, 1, 1, 1, 1, 1,
0.5543022, -0.1066797, 1.851906, 1, 1, 1, 1, 1,
0.5568893, 1.188565, 0.7703235, 1, 1, 1, 1, 1,
0.5586543, 0.4216481, -0.1050606, 1, 1, 1, 1, 1,
0.5600122, 0.06917393, 2.393273, 1, 1, 1, 1, 1,
0.5686676, -0.9099048, 2.141476, 0, 0, 1, 1, 1,
0.5692277, -1.288185, 2.706856, 1, 0, 0, 1, 1,
0.5720965, -0.7651181, 2.22048, 1, 0, 0, 1, 1,
0.5747555, 0.5721223, 0.626903, 1, 0, 0, 1, 1,
0.5753892, -0.3095202, 2.840753, 1, 0, 0, 1, 1,
0.5757894, 0.572507, 1.237453, 1, 0, 0, 1, 1,
0.5863332, 1.321132, 0.9294189, 0, 0, 0, 1, 1,
0.5915357, -2.001287, 1.527515, 0, 0, 0, 1, 1,
0.5921331, -1.124394, 1.702147, 0, 0, 0, 1, 1,
0.5999767, 0.4345803, 1.040322, 0, 0, 0, 1, 1,
0.6050778, 0.2196144, 1.343127, 0, 0, 0, 1, 1,
0.606064, 1.148152, 1.577688, 0, 0, 0, 1, 1,
0.6109858, -0.9246119, 2.313648, 0, 0, 0, 1, 1,
0.6120481, 1.44378, 1.193414, 1, 1, 1, 1, 1,
0.6155899, 0.6774043, 1.393623, 1, 1, 1, 1, 1,
0.6170344, -0.5501287, 3.664478, 1, 1, 1, 1, 1,
0.6171437, 1.937706, -1.199503, 1, 1, 1, 1, 1,
0.6181096, 0.2329471, 1.470773, 1, 1, 1, 1, 1,
0.6188596, 0.1931172, 1.690261, 1, 1, 1, 1, 1,
0.6243537, -2.388591, 3.722203, 1, 1, 1, 1, 1,
0.6252434, 0.3076002, 0.926197, 1, 1, 1, 1, 1,
0.6254941, 0.4388314, 2.385431, 1, 1, 1, 1, 1,
0.626856, 0.5233466, 1.145612, 1, 1, 1, 1, 1,
0.6308526, 0.279047, -0.06308161, 1, 1, 1, 1, 1,
0.6310258, -1.275757, 2.250988, 1, 1, 1, 1, 1,
0.6327113, -1.310491, 3.391896, 1, 1, 1, 1, 1,
0.6341704, -0.1174446, 1.8416, 1, 1, 1, 1, 1,
0.6386726, -2.1382, 3.667715, 1, 1, 1, 1, 1,
0.644717, 1.121995, 0.3583493, 0, 0, 1, 1, 1,
0.6457525, 0.5095724, 1.065638, 1, 0, 0, 1, 1,
0.6499434, 0.2149568, -0.002710055, 1, 0, 0, 1, 1,
0.6537905, -0.5448472, 2.437142, 1, 0, 0, 1, 1,
0.6647786, -0.3896652, 2.841103, 1, 0, 0, 1, 1,
0.6647797, 1.726491, 0.1066436, 1, 0, 0, 1, 1,
0.6687636, -0.8580149, 2.529679, 0, 0, 0, 1, 1,
0.6715002, 0.5952039, 2.243654, 0, 0, 0, 1, 1,
0.6719404, -0.1484243, 1.435736, 0, 0, 0, 1, 1,
0.6740021, 0.4881229, 0.084734, 0, 0, 0, 1, 1,
0.6751326, -2.4762, 3.753283, 0, 0, 0, 1, 1,
0.6851619, 1.037399, -1.413759, 0, 0, 0, 1, 1,
0.6861082, 0.5292484, 0.6283612, 0, 0, 0, 1, 1,
0.686835, -0.2692676, 2.995783, 1, 1, 1, 1, 1,
0.6885542, 0.76067, 0.8300569, 1, 1, 1, 1, 1,
0.689347, -0.5438856, 3.319318, 1, 1, 1, 1, 1,
0.6904905, 1.443562, -0.05298062, 1, 1, 1, 1, 1,
0.692265, -1.142505, 2.736294, 1, 1, 1, 1, 1,
0.6950871, -2.0299, 2.987324, 1, 1, 1, 1, 1,
0.6956931, 0.35748, 2.42023, 1, 1, 1, 1, 1,
0.7047447, 0.1641136, 1.432593, 1, 1, 1, 1, 1,
0.7057362, 0.2924661, 0.8230941, 1, 1, 1, 1, 1,
0.7076059, 0.7119606, 0.2837066, 1, 1, 1, 1, 1,
0.7084948, -0.005961817, 1.012508, 1, 1, 1, 1, 1,
0.7088584, -1.400929, 2.572124, 1, 1, 1, 1, 1,
0.7123476, -0.9189754, 2.099705, 1, 1, 1, 1, 1,
0.7132107, -0.2388259, 3.018487, 1, 1, 1, 1, 1,
0.7163447, 0.4974394, 0.8971192, 1, 1, 1, 1, 1,
0.7247654, 0.5502337, 0.5904928, 0, 0, 1, 1, 1,
0.7328959, 0.1150883, 0.7448045, 1, 0, 0, 1, 1,
0.7334759, 0.6868698, 1.614661, 1, 0, 0, 1, 1,
0.7338194, 1.638244, 0.6178708, 1, 0, 0, 1, 1,
0.7345572, 0.756725, 1.175532, 1, 0, 0, 1, 1,
0.7488101, 0.229509, 2.594397, 1, 0, 0, 1, 1,
0.7531649, -0.131277, -0.02212819, 0, 0, 0, 1, 1,
0.7560552, -0.6179683, 2.434458, 0, 0, 0, 1, 1,
0.7568207, -1.456187, 3.491331, 0, 0, 0, 1, 1,
0.7611588, -1.697616, 2.223837, 0, 0, 0, 1, 1,
0.7638366, 0.5089601, 0.4849317, 0, 0, 0, 1, 1,
0.7661462, -0.1728503, -0.04208059, 0, 0, 0, 1, 1,
0.7731611, 0.9380288, 0.575468, 0, 0, 0, 1, 1,
0.7780039, -0.2718365, 2.174734, 1, 1, 1, 1, 1,
0.7822495, -1.33454, 2.715469, 1, 1, 1, 1, 1,
0.7870869, -1.074906, 2.988682, 1, 1, 1, 1, 1,
0.7875821, -0.2366205, 0.9591623, 1, 1, 1, 1, 1,
0.7889916, -0.382383, 2.904891, 1, 1, 1, 1, 1,
0.7927309, -0.8284493, 2.402536, 1, 1, 1, 1, 1,
0.7935633, 1.68352, 0.4362038, 1, 1, 1, 1, 1,
0.7956951, -0.01442251, 1.629139, 1, 1, 1, 1, 1,
0.7969784, 0.02810615, 3.434263, 1, 1, 1, 1, 1,
0.79735, 0.08381505, 1.22652, 1, 1, 1, 1, 1,
0.7984593, -1.312648, 3.627026, 1, 1, 1, 1, 1,
0.8009098, 1.022276, -0.9134975, 1, 1, 1, 1, 1,
0.8009713, -1.151619, 3.373598, 1, 1, 1, 1, 1,
0.8025702, 1.852976, -0.8831745, 1, 1, 1, 1, 1,
0.8065701, 0.8429396, 0.753908, 1, 1, 1, 1, 1,
0.8066682, 0.1498881, 1.348494, 0, 0, 1, 1, 1,
0.8067369, 1.12266, 0.6404033, 1, 0, 0, 1, 1,
0.8106548, -0.3521453, 2.059967, 1, 0, 0, 1, 1,
0.8198119, -0.4611135, 2.446575, 1, 0, 0, 1, 1,
0.8259652, -1.826632, 0.9700922, 1, 0, 0, 1, 1,
0.8263335, -1.367665, 2.552504, 1, 0, 0, 1, 1,
0.8360285, 1.362321, 0.6007041, 0, 0, 0, 1, 1,
0.8387217, 1.218919, 0.9789112, 0, 0, 0, 1, 1,
0.8397952, 0.2060112, 1.720208, 0, 0, 0, 1, 1,
0.8413812, 0.4148252, 1.475431, 0, 0, 0, 1, 1,
0.8414176, 0.5527458, 2.575271, 0, 0, 0, 1, 1,
0.8424539, 0.9277, 0.5701826, 0, 0, 0, 1, 1,
0.8429002, 1.597671, 0.9946774, 0, 0, 0, 1, 1,
0.8479467, -1.242442, 1.110638, 1, 1, 1, 1, 1,
0.8502486, -0.5314181, 2.870993, 1, 1, 1, 1, 1,
0.8515916, 0.2700553, -0.3227032, 1, 1, 1, 1, 1,
0.8524765, -0.1096202, 1.211279, 1, 1, 1, 1, 1,
0.8536083, 0.4352477, -0.593249, 1, 1, 1, 1, 1,
0.858216, 0.5568259, 1.125412, 1, 1, 1, 1, 1,
0.8608644, 1.48868, 1.639667, 1, 1, 1, 1, 1,
0.8658779, -0.1300506, 2.802376, 1, 1, 1, 1, 1,
0.8673273, -0.3889223, 3.262242, 1, 1, 1, 1, 1,
0.8723406, -0.6528858, 2.115233, 1, 1, 1, 1, 1,
0.8728458, -1.029909, 2.98859, 1, 1, 1, 1, 1,
0.8767431, -0.8585665, 0.4286647, 1, 1, 1, 1, 1,
0.8783241, -1.481499, 5.564502, 1, 1, 1, 1, 1,
0.8816531, 0.5514878, 1.166419, 1, 1, 1, 1, 1,
0.8832467, -2.247263, 1.720095, 1, 1, 1, 1, 1,
0.8906289, -0.8897392, 3.614384, 0, 0, 1, 1, 1,
0.899276, -2.315139, 3.268978, 1, 0, 0, 1, 1,
0.9147739, 0.3219423, 1.145495, 1, 0, 0, 1, 1,
0.9161451, -0.8824308, 3.652174, 1, 0, 0, 1, 1,
0.9229689, -1.806117, 2.377292, 1, 0, 0, 1, 1,
0.9297644, -0.6509731, 2.323834, 1, 0, 0, 1, 1,
0.9336767, -0.03189154, -0.4085402, 0, 0, 0, 1, 1,
0.9350939, -0.7069444, 2.836723, 0, 0, 0, 1, 1,
0.9482524, 1.163124, 0.149727, 0, 0, 0, 1, 1,
0.9539117, -0.06562386, 0.7702753, 0, 0, 0, 1, 1,
0.9579694, -1.013708, 4.160323, 0, 0, 0, 1, 1,
0.9587219, -0.3553544, 1.778752, 0, 0, 0, 1, 1,
0.9623079, 1.729191, -0.2415585, 0, 0, 0, 1, 1,
0.9713976, 0.1480111, 2.056252, 1, 1, 1, 1, 1,
0.9742219, -0.09960999, 1.909448, 1, 1, 1, 1, 1,
0.9801911, -1.92703, 2.052547, 1, 1, 1, 1, 1,
0.9845095, -0.1591384, 2.737558, 1, 1, 1, 1, 1,
0.9875845, -0.3992011, 3.364807, 1, 1, 1, 1, 1,
0.9878667, -0.0432645, 1.972974, 1, 1, 1, 1, 1,
0.9880474, -0.1040252, 1.376875, 1, 1, 1, 1, 1,
0.9891137, 1.634956, 1.587354, 1, 1, 1, 1, 1,
0.9916727, -0.08795641, 0.4132788, 1, 1, 1, 1, 1,
0.9921039, -1.215013, 2.174452, 1, 1, 1, 1, 1,
0.9940144, 0.7302148, -0.3178727, 1, 1, 1, 1, 1,
0.9945213, -0.3607245, 3.576226, 1, 1, 1, 1, 1,
0.9959118, 1.438054, -0.6811178, 1, 1, 1, 1, 1,
0.9991229, -1.5749, 1.735456, 1, 1, 1, 1, 1,
1.005698, 0.6028365, 0.7261949, 1, 1, 1, 1, 1,
1.006701, 0.2802351, 1.175421, 0, 0, 1, 1, 1,
1.00877, 0.6723137, 0.801041, 1, 0, 0, 1, 1,
1.019114, -0.4024472, 0.5281445, 1, 0, 0, 1, 1,
1.019727, 0.1691664, -0.248355, 1, 0, 0, 1, 1,
1.027012, -1.35588, 1.293834, 1, 0, 0, 1, 1,
1.030964, -0.4275187, 2.218204, 1, 0, 0, 1, 1,
1.032261, 1.31765, -0.5949778, 0, 0, 0, 1, 1,
1.03262, -1.966547, 3.394333, 0, 0, 0, 1, 1,
1.034535, -0.07005717, 1.946661, 0, 0, 0, 1, 1,
1.041509, 1.399629, 2.134921, 0, 0, 0, 1, 1,
1.044702, 0.4039914, 3.609321, 0, 0, 0, 1, 1,
1.045714, 0.5562807, 1.193493, 0, 0, 0, 1, 1,
1.050401, 1.342159, 0.3339529, 0, 0, 0, 1, 1,
1.063166, 1.109138, 1.633593, 1, 1, 1, 1, 1,
1.063396, -1.07782, 1.989766, 1, 1, 1, 1, 1,
1.064652, -1.41205, 1.184592, 1, 1, 1, 1, 1,
1.069971, -0.891239, 3.185561, 1, 1, 1, 1, 1,
1.074018, -0.6717162, 2.331014, 1, 1, 1, 1, 1,
1.07608, 0.3159807, 1.322923, 1, 1, 1, 1, 1,
1.084513, -0.4118654, 1.274557, 1, 1, 1, 1, 1,
1.085083, -2.96212, 2.772163, 1, 1, 1, 1, 1,
1.08663, -1.029423, 2.613124, 1, 1, 1, 1, 1,
1.098059, -0.2318472, 2.355156, 1, 1, 1, 1, 1,
1.10395, -0.3709564, 1.58922, 1, 1, 1, 1, 1,
1.104805, 0.5697166, 0.807362, 1, 1, 1, 1, 1,
1.105196, -0.8276727, 2.297277, 1, 1, 1, 1, 1,
1.11943, -0.9743273, 3.602787, 1, 1, 1, 1, 1,
1.120152, -0.7681733, 3.309435, 1, 1, 1, 1, 1,
1.121288, -0.3777499, 2.009271, 0, 0, 1, 1, 1,
1.132901, 0.2689931, 2.007001, 1, 0, 0, 1, 1,
1.138482, 1.466379, 1.057679, 1, 0, 0, 1, 1,
1.140331, 0.04791641, 2.637033, 1, 0, 0, 1, 1,
1.141207, -0.8524887, 1.644666, 1, 0, 0, 1, 1,
1.16174, 0.9491697, 0.06524389, 1, 0, 0, 1, 1,
1.162959, 0.230372, 2.110173, 0, 0, 0, 1, 1,
1.169299, 0.8671215, 0.8891206, 0, 0, 0, 1, 1,
1.171948, 1.723464, 1.996532, 0, 0, 0, 1, 1,
1.175537, -0.4814665, 0.8294457, 0, 0, 0, 1, 1,
1.176347, -0.6113868, 1.836338, 0, 0, 0, 1, 1,
1.177536, 1.21486, -0.8426777, 0, 0, 0, 1, 1,
1.178549, 0.70836, 2.418694, 0, 0, 0, 1, 1,
1.20909, -1.506441, 1.797544, 1, 1, 1, 1, 1,
1.211165, -0.275382, 1.220091, 1, 1, 1, 1, 1,
1.217786, 0.4354115, -1.356845, 1, 1, 1, 1, 1,
1.223418, -0.775239, 2.817471, 1, 1, 1, 1, 1,
1.22616, 1.185401, 0.8071886, 1, 1, 1, 1, 1,
1.234337, -0.02813097, 0.2707594, 1, 1, 1, 1, 1,
1.234849, 0.5568646, 0.6778419, 1, 1, 1, 1, 1,
1.236745, 0.5655386, 1.077752, 1, 1, 1, 1, 1,
1.239853, -0.881179, 0.483878, 1, 1, 1, 1, 1,
1.241839, -2.260709, 1.952462, 1, 1, 1, 1, 1,
1.242639, -0.1389892, 2.018397, 1, 1, 1, 1, 1,
1.24266, 0.8192889, 3.330746, 1, 1, 1, 1, 1,
1.269786, 0.4053477, -0.01686551, 1, 1, 1, 1, 1,
1.272706, 0.01085091, 0.4916875, 1, 1, 1, 1, 1,
1.277432, -0.3821784, 2.372466, 1, 1, 1, 1, 1,
1.278565, -0.6389472, 2.740279, 0, 0, 1, 1, 1,
1.288577, 0.420944, 1.748519, 1, 0, 0, 1, 1,
1.300931, -0.1263588, 0.671179, 1, 0, 0, 1, 1,
1.302265, 2.217693, -0.2214942, 1, 0, 0, 1, 1,
1.311236, 0.1469005, 1.571216, 1, 0, 0, 1, 1,
1.313395, -1.122962, 3.42207, 1, 0, 0, 1, 1,
1.316095, 0.1760573, -2.022127, 0, 0, 0, 1, 1,
1.321586, 1.093704, 2.061834, 0, 0, 0, 1, 1,
1.322228, -1.785988, 2.443698, 0, 0, 0, 1, 1,
1.329016, -1.150203, 2.0468, 0, 0, 0, 1, 1,
1.330689, -0.7200242, 0.5915276, 0, 0, 0, 1, 1,
1.335136, 0.4553793, -0.8714772, 0, 0, 0, 1, 1,
1.352868, 2.438927, 0.3389675, 0, 0, 0, 1, 1,
1.362738, -1.00079, 2.349133, 1, 1, 1, 1, 1,
1.38115, 2.260784, 1.953687, 1, 1, 1, 1, 1,
1.381867, -0.9006512, 3.654131, 1, 1, 1, 1, 1,
1.388895, -0.2480837, 2.220721, 1, 1, 1, 1, 1,
1.392252, 0.6097587, 1.20861, 1, 1, 1, 1, 1,
1.400682, 1.558216, -1.379247, 1, 1, 1, 1, 1,
1.406115, -0.2847084, 1.028381, 1, 1, 1, 1, 1,
1.42523, 3.427521, 1.660869, 1, 1, 1, 1, 1,
1.434433, 0.02938128, 1.32058, 1, 1, 1, 1, 1,
1.436296, -1.114963, 2.684742, 1, 1, 1, 1, 1,
1.439826, 0.6205513, 1.775561, 1, 1, 1, 1, 1,
1.442186, 0.6724011, 1.122882, 1, 1, 1, 1, 1,
1.445387, -0.8941705, 2.549657, 1, 1, 1, 1, 1,
1.466389, 0.5578747, 1.379891, 1, 1, 1, 1, 1,
1.4791, 0.2956792, 1.955251, 1, 1, 1, 1, 1,
1.482282, 1.26652, 2.459076, 0, 0, 1, 1, 1,
1.486175, 0.4475217, 2.386849, 1, 0, 0, 1, 1,
1.491959, -0.6429816, 1.945967, 1, 0, 0, 1, 1,
1.493425, -1.272116, 2.006276, 1, 0, 0, 1, 1,
1.514764, -0.5148024, 2.719816, 1, 0, 0, 1, 1,
1.524821, 0.3609735, 1.818728, 1, 0, 0, 1, 1,
1.53517, -1.128532, 2.507462, 0, 0, 0, 1, 1,
1.536159, 0.9688803, 1.182616, 0, 0, 0, 1, 1,
1.537948, 1.345962, 0.9993674, 0, 0, 0, 1, 1,
1.539771, 0.0846018, -1.213018, 0, 0, 0, 1, 1,
1.546679, -0.4553465, 2.715589, 0, 0, 0, 1, 1,
1.551513, -0.06966429, 4.066921, 0, 0, 0, 1, 1,
1.552991, 0.8905352, 0.4858634, 0, 0, 0, 1, 1,
1.559096, -0.8128548, 1.07495, 1, 1, 1, 1, 1,
1.566657, -0.5436112, 1.869579, 1, 1, 1, 1, 1,
1.571548, 2.148964, 0.1703961, 1, 1, 1, 1, 1,
1.576515, 0.6834022, 1.7128, 1, 1, 1, 1, 1,
1.585299, 0.2725142, 1.447886, 1, 1, 1, 1, 1,
1.586255, -0.6675681, 1.614639, 1, 1, 1, 1, 1,
1.589608, -0.01624217, 1.987786, 1, 1, 1, 1, 1,
1.600864, -1.010917, 1.747748, 1, 1, 1, 1, 1,
1.604464, -0.04580079, 2.187616, 1, 1, 1, 1, 1,
1.61184, -1.650906, -0.2603034, 1, 1, 1, 1, 1,
1.615772, -0.8202982, -0.5458164, 1, 1, 1, 1, 1,
1.629417, 0.7925051, 0.13382, 1, 1, 1, 1, 1,
1.642232, 0.2572959, -0.1745424, 1, 1, 1, 1, 1,
1.688447, -0.5598609, 1.005179, 1, 1, 1, 1, 1,
1.710601, -1.873681, 2.143324, 1, 1, 1, 1, 1,
1.741631, 0.02194862, 1.819862, 0, 0, 1, 1, 1,
1.745172, 0.43131, 2.169737, 1, 0, 0, 1, 1,
1.747498, -0.5080994, 1.95532, 1, 0, 0, 1, 1,
1.753755, 0.87725, 0.73418, 1, 0, 0, 1, 1,
1.755288, 0.2341188, 0.5500889, 1, 0, 0, 1, 1,
1.766895, -1.697153, 0.142089, 1, 0, 0, 1, 1,
1.767938, 0.02405513, 0.02167518, 0, 0, 0, 1, 1,
1.776998, 2.265284, 0.3402509, 0, 0, 0, 1, 1,
1.782967, 1.512074, 1.215471, 0, 0, 0, 1, 1,
1.808705, 1.330032, 1.12583, 0, 0, 0, 1, 1,
1.831264, 0.6032215, -1.365073, 0, 0, 0, 1, 1,
1.837058, -2.176993, 2.576695, 0, 0, 0, 1, 1,
1.857795, -0.4719128, 2.842536, 0, 0, 0, 1, 1,
1.871868, -0.1586346, 1.436224, 1, 1, 1, 1, 1,
1.88753, -0.9751974, 1.770319, 1, 1, 1, 1, 1,
1.890182, -0.9138539, 3.555635, 1, 1, 1, 1, 1,
1.891019, 0.8575866, 0.1632406, 1, 1, 1, 1, 1,
1.896876, 1.356395, -0.09868079, 1, 1, 1, 1, 1,
1.901602, 1.293783, -0.004745302, 1, 1, 1, 1, 1,
1.91558, -0.5720857, -1.297453, 1, 1, 1, 1, 1,
1.915761, 0.8349182, 0.8121097, 1, 1, 1, 1, 1,
1.91623, 0.7372966, 1.630962, 1, 1, 1, 1, 1,
1.919825, -0.3622829, 0.762714, 1, 1, 1, 1, 1,
1.963306, -0.1791635, -0.178286, 1, 1, 1, 1, 1,
1.963567, 0.07404628, 0.7254303, 1, 1, 1, 1, 1,
1.975351, 0.02167883, 3.208784, 1, 1, 1, 1, 1,
1.978258, 1.058634, 1.826882, 1, 1, 1, 1, 1,
1.987086, 1.038818, 0.7332079, 1, 1, 1, 1, 1,
2.000619, -0.1897072, 0.5182133, 0, 0, 1, 1, 1,
2.032279, 0.6991588, 1.351929, 1, 0, 0, 1, 1,
2.035866, -0.4677471, 1.541269, 1, 0, 0, 1, 1,
2.046778, 0.2693523, 2.333117, 1, 0, 0, 1, 1,
2.07502, -1.434375, 1.990966, 1, 0, 0, 1, 1,
2.100708, -0.1432988, 0.4140663, 1, 0, 0, 1, 1,
2.118421, -0.3533436, 1.514289, 0, 0, 0, 1, 1,
2.11884, -0.07883203, 0.2875105, 0, 0, 0, 1, 1,
2.141206, -1.551091, 1.691365, 0, 0, 0, 1, 1,
2.145886, -1.062405, 2.616084, 0, 0, 0, 1, 1,
2.149952, -1.954941, 3.726651, 0, 0, 0, 1, 1,
2.166917, -1.053957, 1.326294, 0, 0, 0, 1, 1,
2.189353, -0.3580271, 3.008687, 0, 0, 0, 1, 1,
2.262188, 0.9170701, 1.122435, 1, 1, 1, 1, 1,
2.26558, 0.7112097, 2.635563, 1, 1, 1, 1, 1,
2.405353, -0.7782496, 1.337626, 1, 1, 1, 1, 1,
2.45471, -0.8846767, 1.227932, 1, 1, 1, 1, 1,
2.561847, 0.8043213, 0.02271122, 1, 1, 1, 1, 1,
2.923099, -0.6173239, 1.012258, 1, 1, 1, 1, 1,
3.093847, -0.9559487, 3.366478, 1, 1, 1, 1, 1
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
var radius = 9.650122;
var distance = 33.89565;
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
mvMatrix.translate( 0.1327231, -0.2327009, -0.1227379 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.89565);
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
