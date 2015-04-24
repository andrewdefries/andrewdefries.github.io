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
-3.271707, -0.3607896, 0.7070255, 1, 0, 0, 1,
-3.225936, -0.1579479, -2.405093, 1, 0.007843138, 0, 1,
-3.126596, 0.449329, 0.1357577, 1, 0.01176471, 0, 1,
-2.9534, -1.990916, -1.151598, 1, 0.01960784, 0, 1,
-2.859556, -1.881558, -2.80306, 1, 0.02352941, 0, 1,
-2.782338, 1.384542, -3.128579, 1, 0.03137255, 0, 1,
-2.540572, 0.9510332, -0.2375713, 1, 0.03529412, 0, 1,
-2.435222, 0.673355, -1.194839, 1, 0.04313726, 0, 1,
-2.37393, -2.021825, -1.82478, 1, 0.04705882, 0, 1,
-2.352798, -0.6832756, -1.282474, 1, 0.05490196, 0, 1,
-2.334388, 0.2663917, -0.8738652, 1, 0.05882353, 0, 1,
-2.327667, -0.6237022, 0.4628107, 1, 0.06666667, 0, 1,
-2.212556, 0.03385886, -1.763867, 1, 0.07058824, 0, 1,
-2.193297, 0.3628257, -2.211991, 1, 0.07843138, 0, 1,
-2.184057, 1.040527, -0.8348848, 1, 0.08235294, 0, 1,
-2.176618, 0.09898072, -1.822489, 1, 0.09019608, 0, 1,
-2.087969, 0.7031618, -2.483963, 1, 0.09411765, 0, 1,
-2.077359, -1.919769, -3.008819, 1, 0.1019608, 0, 1,
-2.076731, -2.079599, -1.512499, 1, 0.1098039, 0, 1,
-2.061052, -1.492854, -3.020055, 1, 0.1137255, 0, 1,
-2.050266, -0.8334095, -3.249018, 1, 0.1215686, 0, 1,
-2.029288, -1.724487, -1.132553, 1, 0.1254902, 0, 1,
-2.02652, 0.03750315, -1.247414, 1, 0.1333333, 0, 1,
-1.979526, -0.8360458, -1.909227, 1, 0.1372549, 0, 1,
-1.912625, 0.05775111, -1.971283, 1, 0.145098, 0, 1,
-1.909959, 0.9416416, 0.6969353, 1, 0.1490196, 0, 1,
-1.889492, -0.5877478, -2.128969, 1, 0.1568628, 0, 1,
-1.85783, 0.06847073, -3.768989, 1, 0.1607843, 0, 1,
-1.822093, 0.1724464, -1.330346, 1, 0.1686275, 0, 1,
-1.809232, 1.073157, -2.035275, 1, 0.172549, 0, 1,
-1.776391, 0.4096734, 1.183552, 1, 0.1803922, 0, 1,
-1.774857, 2.182271, -1.221437, 1, 0.1843137, 0, 1,
-1.76143, 2.59597, -2.676703, 1, 0.1921569, 0, 1,
-1.732028, 2.466325, 0.2513962, 1, 0.1960784, 0, 1,
-1.730309, -0.9869345, -2.624756, 1, 0.2039216, 0, 1,
-1.720957, 1.161053, -0.02117124, 1, 0.2117647, 0, 1,
-1.720442, 0.1288293, -4.468853, 1, 0.2156863, 0, 1,
-1.711468, 0.01116227, 0.5579674, 1, 0.2235294, 0, 1,
-1.701115, 0.01617794, -1.737434, 1, 0.227451, 0, 1,
-1.693562, -0.2436032, -2.280329, 1, 0.2352941, 0, 1,
-1.693515, -1.314799, -2.732215, 1, 0.2392157, 0, 1,
-1.677313, 1.178705, -2.102794, 1, 0.2470588, 0, 1,
-1.667556, -0.5070253, -0.05731002, 1, 0.2509804, 0, 1,
-1.662061, 0.1176012, -2.409221, 1, 0.2588235, 0, 1,
-1.647314, 0.9623704, -1.70565, 1, 0.2627451, 0, 1,
-1.647129, -0.4256369, -1.184534, 1, 0.2705882, 0, 1,
-1.643843, -0.3148716, -2.551452, 1, 0.2745098, 0, 1,
-1.621448, -0.6915136, -1.616349, 1, 0.282353, 0, 1,
-1.609023, 0.1056415, -2.269882, 1, 0.2862745, 0, 1,
-1.590677, 0.8798442, -2.284707, 1, 0.2941177, 0, 1,
-1.584855, -0.5038972, -1.233284, 1, 0.3019608, 0, 1,
-1.583944, -0.2336071, -2.789265, 1, 0.3058824, 0, 1,
-1.573209, -1.347337, -2.464615, 1, 0.3137255, 0, 1,
-1.565507, 0.8794167, -0.9444466, 1, 0.3176471, 0, 1,
-1.551784, -2.030342, -1.06176, 1, 0.3254902, 0, 1,
-1.542234, 1.461251, -2.63125, 1, 0.3294118, 0, 1,
-1.535418, 0.1197689, -2.028625, 1, 0.3372549, 0, 1,
-1.531136, -0.5868933, -2.073079, 1, 0.3411765, 0, 1,
-1.525633, 0.7485754, -2.804322, 1, 0.3490196, 0, 1,
-1.517674, -1.143005, -2.593628, 1, 0.3529412, 0, 1,
-1.513438, 0.08594564, -2.00185, 1, 0.3607843, 0, 1,
-1.490131, -0.1472109, -2.078927, 1, 0.3647059, 0, 1,
-1.490051, -2.056126, -3.395607, 1, 0.372549, 0, 1,
-1.485855, 0.4788988, -0.9908234, 1, 0.3764706, 0, 1,
-1.485273, 0.3619412, -2.912616, 1, 0.3843137, 0, 1,
-1.481503, 0.2340396, -2.361274, 1, 0.3882353, 0, 1,
-1.480068, -0.3524807, -1.187004, 1, 0.3960784, 0, 1,
-1.477803, -0.9399905, -1.858616, 1, 0.4039216, 0, 1,
-1.475741, -1.346611, -2.323184, 1, 0.4078431, 0, 1,
-1.456815, 0.7344455, -2.142349, 1, 0.4156863, 0, 1,
-1.454872, 1.63389, -1.107283, 1, 0.4196078, 0, 1,
-1.454418, -0.5047601, -1.228694, 1, 0.427451, 0, 1,
-1.448966, 1.230842, -1.088255, 1, 0.4313726, 0, 1,
-1.434316, -0.2523634, -3.60302, 1, 0.4392157, 0, 1,
-1.43156, -0.4319172, -2.341561, 1, 0.4431373, 0, 1,
-1.430461, 0.1260161, -3.164768, 1, 0.4509804, 0, 1,
-1.424375, -0.8762254, -1.817762, 1, 0.454902, 0, 1,
-1.399256, -1.175068, -2.513994, 1, 0.4627451, 0, 1,
-1.391999, 1.103556, -1.125267, 1, 0.4666667, 0, 1,
-1.383852, 0.6924051, -1.9676, 1, 0.4745098, 0, 1,
-1.380148, 0.3589298, -1.759818, 1, 0.4784314, 0, 1,
-1.379467, -0.5891741, -1.639563, 1, 0.4862745, 0, 1,
-1.377389, -0.04900711, 1.056014, 1, 0.4901961, 0, 1,
-1.377383, 0.3386642, -1.968992, 1, 0.4980392, 0, 1,
-1.375908, 0.2783336, -3.425061, 1, 0.5058824, 0, 1,
-1.368112, 0.1465643, 0.07868081, 1, 0.509804, 0, 1,
-1.367113, -0.6750728, -1.628966, 1, 0.5176471, 0, 1,
-1.352855, 0.204335, -1.237728, 1, 0.5215687, 0, 1,
-1.34415, 1.428484, 0.02737678, 1, 0.5294118, 0, 1,
-1.343766, 1.214502, -2.309268, 1, 0.5333334, 0, 1,
-1.337171, -1.627723, -3.778525, 1, 0.5411765, 0, 1,
-1.335281, 0.212583, -1.597106, 1, 0.5450981, 0, 1,
-1.3121, -0.7440646, -2.19629, 1, 0.5529412, 0, 1,
-1.307933, 0.4270909, -1.026073, 1, 0.5568628, 0, 1,
-1.305523, -0.9311191, -2.965608, 1, 0.5647059, 0, 1,
-1.300182, -0.1716739, -1.382684, 1, 0.5686275, 0, 1,
-1.299683, -0.7061595, -2.810373, 1, 0.5764706, 0, 1,
-1.292366, -0.7235262, -2.487195, 1, 0.5803922, 0, 1,
-1.290614, -0.4602719, -2.276568, 1, 0.5882353, 0, 1,
-1.27765, -0.363627, -3.777677, 1, 0.5921569, 0, 1,
-1.262305, 0.426165, -0.1321948, 1, 0.6, 0, 1,
-1.251634, 0.9212008, 0.4704829, 1, 0.6078432, 0, 1,
-1.24716, -1.052789, -1.845768, 1, 0.6117647, 0, 1,
-1.224588, 1.334125, -2.441422, 1, 0.6196079, 0, 1,
-1.219802, 0.8454812, 0.3478026, 1, 0.6235294, 0, 1,
-1.215257, -1.937858, -2.714775, 1, 0.6313726, 0, 1,
-1.214626, -1.067428, -1.385217, 1, 0.6352941, 0, 1,
-1.212052, 0.1661432, -1.236109, 1, 0.6431373, 0, 1,
-1.211073, -1.105786, -1.890531, 1, 0.6470588, 0, 1,
-1.197746, 0.4128223, -0.9669271, 1, 0.654902, 0, 1,
-1.197154, 0.7136463, -1.564841, 1, 0.6588235, 0, 1,
-1.193138, -1.946553, -2.627522, 1, 0.6666667, 0, 1,
-1.184048, -1.212899, -0.4265539, 1, 0.6705883, 0, 1,
-1.176337, 0.3177012, -1.803082, 1, 0.6784314, 0, 1,
-1.169154, -0.4548348, -2.105372, 1, 0.682353, 0, 1,
-1.163705, -0.3155653, -1.084509, 1, 0.6901961, 0, 1,
-1.155413, -0.8965909, -0.9970502, 1, 0.6941177, 0, 1,
-1.152328, -1.670376, -3.41875, 1, 0.7019608, 0, 1,
-1.149302, -0.4188735, -1.377236, 1, 0.7098039, 0, 1,
-1.147647, -0.2311931, -1.183017, 1, 0.7137255, 0, 1,
-1.145237, -0.4540147, -4.037341, 1, 0.7215686, 0, 1,
-1.139821, -0.6708901, -2.08594, 1, 0.7254902, 0, 1,
-1.135116, 0.740518, -0.1349568, 1, 0.7333333, 0, 1,
-1.132254, 0.1597405, -0.9396275, 1, 0.7372549, 0, 1,
-1.130681, 1.089993, -1.734516, 1, 0.7450981, 0, 1,
-1.124689, 1.678947, -1.34753, 1, 0.7490196, 0, 1,
-1.123884, 0.7448462, -1.313684, 1, 0.7568628, 0, 1,
-1.120062, -0.4384209, -1.077193, 1, 0.7607843, 0, 1,
-1.119472, -0.8066818, -1.649394, 1, 0.7686275, 0, 1,
-1.113723, 0.6398205, -2.619887, 1, 0.772549, 0, 1,
-1.11346, -0.4972266, -2.96255, 1, 0.7803922, 0, 1,
-1.112363, -1.651026, -1.609544, 1, 0.7843137, 0, 1,
-1.111274, 0.3952315, -0.213064, 1, 0.7921569, 0, 1,
-1.110842, 0.674301, -1.987373, 1, 0.7960784, 0, 1,
-1.110612, 0.2106088, -0.3535687, 1, 0.8039216, 0, 1,
-1.093782, 0.9590276, 0.2804426, 1, 0.8117647, 0, 1,
-1.093379, 0.1069002, -3.853184, 1, 0.8156863, 0, 1,
-1.09227, -1.617468, -1.525162, 1, 0.8235294, 0, 1,
-1.078931, 0.3833258, -2.404679, 1, 0.827451, 0, 1,
-1.074537, 2.812003, -1.115747, 1, 0.8352941, 0, 1,
-1.063046, 0.07400216, -2.364322, 1, 0.8392157, 0, 1,
-1.062778, -0.1727481, -2.275392, 1, 0.8470588, 0, 1,
-1.062604, -1.640751, -2.188325, 1, 0.8509804, 0, 1,
-1.056258, 1.176273, 0.08822127, 1, 0.8588235, 0, 1,
-1.05486, -0.6340029, -2.438445, 1, 0.8627451, 0, 1,
-1.049188, -0.7212164, -1.414218, 1, 0.8705882, 0, 1,
-1.04754, 0.1346645, -1.396182, 1, 0.8745098, 0, 1,
-1.016533, 0.5277104, -0.9343601, 1, 0.8823529, 0, 1,
-1.016025, 0.398986, -2.543976, 1, 0.8862745, 0, 1,
-1.008738, -1.025423, -3.494992, 1, 0.8941177, 0, 1,
-1.007177, -0.3347062, -2.447138, 1, 0.8980392, 0, 1,
-1.005934, 1.516803, 1.826639, 1, 0.9058824, 0, 1,
-1.002983, -0.9938077, -2.245199, 1, 0.9137255, 0, 1,
-1.001905, 0.5077803, -0.8698102, 1, 0.9176471, 0, 1,
-0.9986182, 0.5827262, -0.6126258, 1, 0.9254902, 0, 1,
-0.9909648, 0.6042894, 0.3078837, 1, 0.9294118, 0, 1,
-0.9896566, 1.038261, -1.776807, 1, 0.9372549, 0, 1,
-0.9885985, -1.350051, -2.740559, 1, 0.9411765, 0, 1,
-0.9872611, -1.186771, -3.419086, 1, 0.9490196, 0, 1,
-0.9837968, -0.03925156, -2.799469, 1, 0.9529412, 0, 1,
-0.9804453, -0.3125574, -2.222579, 1, 0.9607843, 0, 1,
-0.9790103, 0.2864601, -0.6114358, 1, 0.9647059, 0, 1,
-0.9788507, -2.653755, -2.2422, 1, 0.972549, 0, 1,
-0.9757749, 1.109998, 0.1084739, 1, 0.9764706, 0, 1,
-0.9741961, -0.293243, -1.718269, 1, 0.9843137, 0, 1,
-0.9724634, -0.5212994, -3.147706, 1, 0.9882353, 0, 1,
-0.9687787, 0.1862251, 1.310724, 1, 0.9960784, 0, 1,
-0.9680123, -0.3949981, -3.334778, 0.9960784, 1, 0, 1,
-0.9659879, 0.6242059, 0.06462958, 0.9921569, 1, 0, 1,
-0.9655263, 0.5650403, 0.05519065, 0.9843137, 1, 0, 1,
-0.9545316, -0.2593545, -1.422006, 0.9803922, 1, 0, 1,
-0.9527342, -0.8631657, -4.65936, 0.972549, 1, 0, 1,
-0.9441045, 0.7744741, -1.555789, 0.9686275, 1, 0, 1,
-0.9296627, -0.7799627, -1.735321, 0.9607843, 1, 0, 1,
-0.9264676, -1.305721, -1.541938, 0.9568627, 1, 0, 1,
-0.9206281, -1.256026, -4.699815, 0.9490196, 1, 0, 1,
-0.9185219, -0.153542, -0.9197634, 0.945098, 1, 0, 1,
-0.9001865, -0.150192, -1.522652, 0.9372549, 1, 0, 1,
-0.8965331, -0.2371651, -2.079337, 0.9333333, 1, 0, 1,
-0.8964078, 0.324979, -2.50601, 0.9254902, 1, 0, 1,
-0.8935946, 0.4248654, -0.8447021, 0.9215686, 1, 0, 1,
-0.8926549, 1.147462, -0.9848547, 0.9137255, 1, 0, 1,
-0.8824639, 0.5118151, -2.04433, 0.9098039, 1, 0, 1,
-0.880312, 0.1075205, -0.5401578, 0.9019608, 1, 0, 1,
-0.8801383, -0.6887732, -1.118234, 0.8941177, 1, 0, 1,
-0.8784796, -1.171212, -2.202501, 0.8901961, 1, 0, 1,
-0.875107, 0.7879915, 0.227245, 0.8823529, 1, 0, 1,
-0.8716253, 0.1712923, -2.114373, 0.8784314, 1, 0, 1,
-0.870427, -0.716778, -1.957991, 0.8705882, 1, 0, 1,
-0.865109, 0.7125989, -2.318616, 0.8666667, 1, 0, 1,
-0.8649918, -0.5641726, -2.356323, 0.8588235, 1, 0, 1,
-0.8599402, 0.4810087, 0.8983167, 0.854902, 1, 0, 1,
-0.8567999, 0.3336663, -1.145315, 0.8470588, 1, 0, 1,
-0.854928, -0.2938379, 0.1989537, 0.8431373, 1, 0, 1,
-0.8497767, -2.282975, -2.834525, 0.8352941, 1, 0, 1,
-0.8478344, 0.3326732, -2.043271, 0.8313726, 1, 0, 1,
-0.8432549, -1.693872, -4.422854, 0.8235294, 1, 0, 1,
-0.8424997, 1.588545, 0.7200504, 0.8196079, 1, 0, 1,
-0.8387173, 0.9247735, -1.993101, 0.8117647, 1, 0, 1,
-0.8336187, -1.459329, -1.417174, 0.8078431, 1, 0, 1,
-0.832577, 0.187582, -1.767847, 0.8, 1, 0, 1,
-0.8299752, 1.035899, -0.5401317, 0.7921569, 1, 0, 1,
-0.8186707, -0.0829599, -2.209509, 0.7882353, 1, 0, 1,
-0.8182276, -0.2005158, -3.023866, 0.7803922, 1, 0, 1,
-0.8174778, -0.6494685, -2.858922, 0.7764706, 1, 0, 1,
-0.8118676, -0.3875389, -1.806962, 0.7686275, 1, 0, 1,
-0.808903, 1.351829, -0.5741808, 0.7647059, 1, 0, 1,
-0.8048797, -0.4329482, -0.9417391, 0.7568628, 1, 0, 1,
-0.8035821, -0.321862, -4.02323, 0.7529412, 1, 0, 1,
-0.7973325, -1.721842, -3.262996, 0.7450981, 1, 0, 1,
-0.7957137, -0.08370785, -1.737488, 0.7411765, 1, 0, 1,
-0.7926706, 1.021362, -1.518047, 0.7333333, 1, 0, 1,
-0.7899676, -1.917676, -1.618828, 0.7294118, 1, 0, 1,
-0.7838564, 1.707992, -1.662991, 0.7215686, 1, 0, 1,
-0.7834151, -0.2572196, -0.8996504, 0.7176471, 1, 0, 1,
-0.7812406, 1.358304, -2.236116, 0.7098039, 1, 0, 1,
-0.7803285, -1.404698, -1.972661, 0.7058824, 1, 0, 1,
-0.7757829, -0.1854236, -2.462765, 0.6980392, 1, 0, 1,
-0.7726234, 0.916995, 0.5308286, 0.6901961, 1, 0, 1,
-0.7704446, 1.389742, -0.03223201, 0.6862745, 1, 0, 1,
-0.7631337, 0.2743595, -0.9290295, 0.6784314, 1, 0, 1,
-0.7630202, 0.141023, -1.332056, 0.6745098, 1, 0, 1,
-0.7546066, -0.9351875, -2.533043, 0.6666667, 1, 0, 1,
-0.7524274, 1.706997, -0.1173781, 0.6627451, 1, 0, 1,
-0.7475806, 1.18776, -0.1310105, 0.654902, 1, 0, 1,
-0.7453377, -0.4333774, -2.542692, 0.6509804, 1, 0, 1,
-0.7441519, -1.55654, -1.558957, 0.6431373, 1, 0, 1,
-0.7435087, -1.359024, -1.418169, 0.6392157, 1, 0, 1,
-0.7408516, -0.02539866, -2.063929, 0.6313726, 1, 0, 1,
-0.7343977, 0.5794128, 0.1277788, 0.627451, 1, 0, 1,
-0.7339267, -0.6534107, -2.474441, 0.6196079, 1, 0, 1,
-0.7282325, -1.44842, -4.545696, 0.6156863, 1, 0, 1,
-0.7281007, -0.2830289, -1.413392, 0.6078432, 1, 0, 1,
-0.7257201, 0.3289942, -2.021558, 0.6039216, 1, 0, 1,
-0.7237295, -1.749107, -3.347797, 0.5960785, 1, 0, 1,
-0.7229882, -0.5025781, -1.259812, 0.5882353, 1, 0, 1,
-0.7159584, -1.000004, -1.247064, 0.5843138, 1, 0, 1,
-0.7090989, -0.5785244, -3.786004, 0.5764706, 1, 0, 1,
-0.7019576, 0.2246557, -1.640949, 0.572549, 1, 0, 1,
-0.6979112, -0.13881, -3.10647, 0.5647059, 1, 0, 1,
-0.6949197, -0.01906585, -3.539491, 0.5607843, 1, 0, 1,
-0.6928679, 1.218641, -1.23992, 0.5529412, 1, 0, 1,
-0.6909447, 1.171056, -0.3904092, 0.5490196, 1, 0, 1,
-0.6905442, 0.9418445, -1.606008, 0.5411765, 1, 0, 1,
-0.6890036, -2.194463, -3.456833, 0.5372549, 1, 0, 1,
-0.6882064, 0.4962035, -1.52801, 0.5294118, 1, 0, 1,
-0.6838763, 0.2210744, -3.132094, 0.5254902, 1, 0, 1,
-0.6834825, -0.3232396, -1.69726, 0.5176471, 1, 0, 1,
-0.6816894, -0.1183709, -2.389779, 0.5137255, 1, 0, 1,
-0.6784508, 0.5159515, -0.5101086, 0.5058824, 1, 0, 1,
-0.6719146, -0.5851315, -0.2154448, 0.5019608, 1, 0, 1,
-0.6677139, 1.224755, -0.3192873, 0.4941176, 1, 0, 1,
-0.6600364, -0.318084, -2.210507, 0.4862745, 1, 0, 1,
-0.6596898, 0.5554458, 0.6507866, 0.4823529, 1, 0, 1,
-0.6532037, 0.6070296, -0.2402479, 0.4745098, 1, 0, 1,
-0.6504239, 0.589586, 0.8354265, 0.4705882, 1, 0, 1,
-0.6430917, 1.403166, 1.67821, 0.4627451, 1, 0, 1,
-0.636567, -1.25952, -3.587711, 0.4588235, 1, 0, 1,
-0.6358888, 0.6423014, 0.8175524, 0.4509804, 1, 0, 1,
-0.6302478, -0.8282179, -4.067101, 0.4470588, 1, 0, 1,
-0.6298728, -0.5717092, -0.6350688, 0.4392157, 1, 0, 1,
-0.6280039, 0.3386841, 0.8972432, 0.4352941, 1, 0, 1,
-0.6252106, 0.1702042, -2.440811, 0.427451, 1, 0, 1,
-0.6251778, -1.260235, -0.8687479, 0.4235294, 1, 0, 1,
-0.6185526, -0.1960837, -2.405977, 0.4156863, 1, 0, 1,
-0.6181886, -1.845257, -1.816633, 0.4117647, 1, 0, 1,
-0.6154184, -0.2728452, -1.574808, 0.4039216, 1, 0, 1,
-0.6124496, -0.2378311, -2.091736, 0.3960784, 1, 0, 1,
-0.6101171, -0.4808424, -1.882491, 0.3921569, 1, 0, 1,
-0.6061203, -0.2313914, -2.63696, 0.3843137, 1, 0, 1,
-0.6029245, -0.8485048, -2.622959, 0.3803922, 1, 0, 1,
-0.6023839, -0.4488716, -1.640841, 0.372549, 1, 0, 1,
-0.6005662, 0.5818317, -2.658307, 0.3686275, 1, 0, 1,
-0.5942699, -0.544704, -2.14716, 0.3607843, 1, 0, 1,
-0.5940599, 0.6820707, -1.584743, 0.3568628, 1, 0, 1,
-0.5938237, 1.327263, -0.5400784, 0.3490196, 1, 0, 1,
-0.5902036, -1.598783, -1.491546, 0.345098, 1, 0, 1,
-0.5895515, -0.07558214, -1.922008, 0.3372549, 1, 0, 1,
-0.5889309, 0.2525965, -1.167009, 0.3333333, 1, 0, 1,
-0.5857092, 2.666429, 1.271744, 0.3254902, 1, 0, 1,
-0.5816187, 1.410326, -1.50945, 0.3215686, 1, 0, 1,
-0.579417, 0.004208179, -2.558468, 0.3137255, 1, 0, 1,
-0.5757509, -0.1756284, -1.19496, 0.3098039, 1, 0, 1,
-0.5736349, 1.578128, -2.13002, 0.3019608, 1, 0, 1,
-0.5703786, -1.494205, -2.240192, 0.2941177, 1, 0, 1,
-0.5695242, 0.225132, -0.9455358, 0.2901961, 1, 0, 1,
-0.5693131, 0.3044334, 0.05137763, 0.282353, 1, 0, 1,
-0.5671855, -0.02044595, 0.2023904, 0.2784314, 1, 0, 1,
-0.5647278, -0.5467894, -1.634693, 0.2705882, 1, 0, 1,
-0.5616028, -0.9791055, -2.262127, 0.2666667, 1, 0, 1,
-0.5581748, -0.4049593, -2.242797, 0.2588235, 1, 0, 1,
-0.5567364, 0.006428105, -0.4569984, 0.254902, 1, 0, 1,
-0.5564656, 0.6212926, 0.06815165, 0.2470588, 1, 0, 1,
-0.5488218, 0.6116447, -1.945571, 0.2431373, 1, 0, 1,
-0.545195, -0.7498977, -5.306357, 0.2352941, 1, 0, 1,
-0.5378202, 0.2378983, -1.092705, 0.2313726, 1, 0, 1,
-0.5329349, 0.9513999, -1.040279, 0.2235294, 1, 0, 1,
-0.5306073, -0.6568161, -2.790968, 0.2196078, 1, 0, 1,
-0.5267799, 1.339587, 0.4391704, 0.2117647, 1, 0, 1,
-0.5259805, 0.03941617, -0.9396341, 0.2078431, 1, 0, 1,
-0.5235376, -0.8187733, -3.427697, 0.2, 1, 0, 1,
-0.5177675, 0.1454399, -1.750827, 0.1921569, 1, 0, 1,
-0.5159435, -0.2235197, -0.8408898, 0.1882353, 1, 0, 1,
-0.5137382, -0.08316799, -1.392424, 0.1803922, 1, 0, 1,
-0.5132381, 0.1494335, 0.18383, 0.1764706, 1, 0, 1,
-0.5104753, 0.2452605, -1.174444, 0.1686275, 1, 0, 1,
-0.5083411, -0.4066308, -2.38989, 0.1647059, 1, 0, 1,
-0.5051441, -1.256273, -2.069655, 0.1568628, 1, 0, 1,
-0.5047483, 0.5108495, -1.737807, 0.1529412, 1, 0, 1,
-0.5017323, -0.05584095, -1.614627, 0.145098, 1, 0, 1,
-0.499467, 0.5622387, -0.6003639, 0.1411765, 1, 0, 1,
-0.49728, -0.1972261, -2.912957, 0.1333333, 1, 0, 1,
-0.4968322, -0.6704957, -2.134213, 0.1294118, 1, 0, 1,
-0.4937487, -0.0534015, -1.111547, 0.1215686, 1, 0, 1,
-0.4922529, 1.814919, -0.4125624, 0.1176471, 1, 0, 1,
-0.4853117, -0.09088809, -2.777599, 0.1098039, 1, 0, 1,
-0.4777543, -0.8692119, -2.456292, 0.1058824, 1, 0, 1,
-0.4674482, -0.3594633, -3.507271, 0.09803922, 1, 0, 1,
-0.4661143, -0.1449966, -1.804345, 0.09019608, 1, 0, 1,
-0.4652992, 0.3496481, 0.8153473, 0.08627451, 1, 0, 1,
-0.4646563, 0.9941307, -2.620317, 0.07843138, 1, 0, 1,
-0.4635322, -0.07761262, -1.869569, 0.07450981, 1, 0, 1,
-0.457941, -0.7258327, -0.5873438, 0.06666667, 1, 0, 1,
-0.4570677, -1.164032, -3.34846, 0.0627451, 1, 0, 1,
-0.4549458, 0.5672963, -2.019012, 0.05490196, 1, 0, 1,
-0.4535897, 1.096385, -1.118278, 0.05098039, 1, 0, 1,
-0.4524773, 0.08008779, -1.253522, 0.04313726, 1, 0, 1,
-0.4491086, 0.09750044, 0.4733451, 0.03921569, 1, 0, 1,
-0.4473131, -1.387623, -1.272917, 0.03137255, 1, 0, 1,
-0.4463761, -0.6024092, -4.602887, 0.02745098, 1, 0, 1,
-0.4411269, -1.29145, -1.419067, 0.01960784, 1, 0, 1,
-0.4409272, 1.160358, -0.1138174, 0.01568628, 1, 0, 1,
-0.4373372, -0.6640564, -4.224438, 0.007843138, 1, 0, 1,
-0.429879, -0.8650984, -2.105712, 0.003921569, 1, 0, 1,
-0.4292616, -1.497371, -3.426291, 0, 1, 0.003921569, 1,
-0.4261689, 0.1887242, -1.734181, 0, 1, 0.01176471, 1,
-0.4260353, -0.5268309, -1.681038, 0, 1, 0.01568628, 1,
-0.4249811, 1.536952, -1.832049, 0, 1, 0.02352941, 1,
-0.4241502, 0.275821, 0.237386, 0, 1, 0.02745098, 1,
-0.4169622, 0.3000813, 0.6713251, 0, 1, 0.03529412, 1,
-0.4119675, 0.7423314, 1.03589, 0, 1, 0.03921569, 1,
-0.4102645, 0.7292966, -0.3244846, 0, 1, 0.04705882, 1,
-0.4084141, 0.03600358, -1.499458, 0, 1, 0.05098039, 1,
-0.4032434, -0.05178527, -0.1037883, 0, 1, 0.05882353, 1,
-0.400197, -0.93744, -4.272198, 0, 1, 0.0627451, 1,
-0.3980605, 0.9196931, -1.226042, 0, 1, 0.07058824, 1,
-0.3961324, 1.076917, 0.8425388, 0, 1, 0.07450981, 1,
-0.3934272, -0.2985404, -1.159264, 0, 1, 0.08235294, 1,
-0.3903627, -0.7879353, -1.872557, 0, 1, 0.08627451, 1,
-0.3892104, 1.202193, -0.5308455, 0, 1, 0.09411765, 1,
-0.387914, 1.319752, 0.2957447, 0, 1, 0.1019608, 1,
-0.3842483, -1.093571, -3.050854, 0, 1, 0.1058824, 1,
-0.3828226, -0.817664, -4.069685, 0, 1, 0.1137255, 1,
-0.378706, -0.3517119, -1.042279, 0, 1, 0.1176471, 1,
-0.3775897, -1.825943, -1.210391, 0, 1, 0.1254902, 1,
-0.3772493, 1.483219, -0.3199207, 0, 1, 0.1294118, 1,
-0.374818, -2.053634, -2.965245, 0, 1, 0.1372549, 1,
-0.3728615, 0.1720064, -1.407379, 0, 1, 0.1411765, 1,
-0.3728192, -0.06251667, -2.124564, 0, 1, 0.1490196, 1,
-0.3690456, -0.5183041, -1.385026, 0, 1, 0.1529412, 1,
-0.3684162, -0.3214012, -1.623682, 0, 1, 0.1607843, 1,
-0.3655549, -1.084499, -4.916093, 0, 1, 0.1647059, 1,
-0.3622361, 0.8356174, 0.4377615, 0, 1, 0.172549, 1,
-0.3618116, -1.491838, -1.640963, 0, 1, 0.1764706, 1,
-0.3600489, -0.6590152, -3.833128, 0, 1, 0.1843137, 1,
-0.3599191, 0.1757614, 0.1157081, 0, 1, 0.1882353, 1,
-0.3515816, 0.1839327, 0.03313109, 0, 1, 0.1960784, 1,
-0.3507074, 1.357456, 0.3315664, 0, 1, 0.2039216, 1,
-0.347969, 0.5392222, 0.8597452, 0, 1, 0.2078431, 1,
-0.3474707, -0.08452393, -0.6590204, 0, 1, 0.2156863, 1,
-0.337572, -1.173219, -3.125071, 0, 1, 0.2196078, 1,
-0.3340672, -0.8357452, -2.107245, 0, 1, 0.227451, 1,
-0.3338507, -2.121587, -3.534494, 0, 1, 0.2313726, 1,
-0.3304351, 1.609523, -1.445895, 0, 1, 0.2392157, 1,
-0.3301495, 1.312636, -1.180251, 0, 1, 0.2431373, 1,
-0.3291804, -1.329738, -3.12397, 0, 1, 0.2509804, 1,
-0.3216138, -0.3346786, -2.793149, 0, 1, 0.254902, 1,
-0.3202641, -0.2079856, -1.83762, 0, 1, 0.2627451, 1,
-0.3160064, 2.284327, -0.2373457, 0, 1, 0.2666667, 1,
-0.3155274, 1.528528, -1.066369, 0, 1, 0.2745098, 1,
-0.3141682, 2.237765, 0.8591101, 0, 1, 0.2784314, 1,
-0.3080424, -1.303795, -2.677969, 0, 1, 0.2862745, 1,
-0.3080032, -1.389601, -4.37075, 0, 1, 0.2901961, 1,
-0.3033792, -1.35876, -1.967068, 0, 1, 0.2980392, 1,
-0.3013025, 0.8238076, -1.34402, 0, 1, 0.3058824, 1,
-0.3001944, 0.7342229, 0.07649517, 0, 1, 0.3098039, 1,
-0.2996355, 0.3092015, 0.2260651, 0, 1, 0.3176471, 1,
-0.2976942, 2.120772, -0.3272164, 0, 1, 0.3215686, 1,
-0.2880619, -0.1133606, -1.845915, 0, 1, 0.3294118, 1,
-0.2827388, 0.5290704, -0.09942193, 0, 1, 0.3333333, 1,
-0.2784876, 2.035871, -0.353541, 0, 1, 0.3411765, 1,
-0.27703, -1.971322, -2.997096, 0, 1, 0.345098, 1,
-0.2703954, -1.102845, -1.99614, 0, 1, 0.3529412, 1,
-0.2671425, 1.667845, 0.5347065, 0, 1, 0.3568628, 1,
-0.2671132, -1.265589, -3.02906, 0, 1, 0.3647059, 1,
-0.2670021, -0.1746369, -1.133384, 0, 1, 0.3686275, 1,
-0.2648139, -1.752846, -2.190818, 0, 1, 0.3764706, 1,
-0.2633185, 1.362144, 0.3052913, 0, 1, 0.3803922, 1,
-0.2510132, -0.4385537, -2.134379, 0, 1, 0.3882353, 1,
-0.2508326, 1.242552, 0.2148174, 0, 1, 0.3921569, 1,
-0.2421858, -1.204454, -1.568385, 0, 1, 0.4, 1,
-0.2373036, 1.084932, -0.2191548, 0, 1, 0.4078431, 1,
-0.2339412, 0.2386301, -2.953657, 0, 1, 0.4117647, 1,
-0.2328887, -0.3518283, -1.495949, 0, 1, 0.4196078, 1,
-0.2306409, 0.574777, -0.1220408, 0, 1, 0.4235294, 1,
-0.2297577, 0.4347876, -1.198448, 0, 1, 0.4313726, 1,
-0.2284035, 0.8295255, -1.890492, 0, 1, 0.4352941, 1,
-0.2272873, 1.382889, 1.727077, 0, 1, 0.4431373, 1,
-0.2263155, -1.347562, -3.986555, 0, 1, 0.4470588, 1,
-0.2246426, -2.441471, -3.752869, 0, 1, 0.454902, 1,
-0.2235571, -0.6319273, -0.2670514, 0, 1, 0.4588235, 1,
-0.2207245, -1.743415, -3.847909, 0, 1, 0.4666667, 1,
-0.2193221, -0.186087, -3.343013, 0, 1, 0.4705882, 1,
-0.2183911, 0.8231421, -0.2090127, 0, 1, 0.4784314, 1,
-0.2177677, 1.444872, 0.4225567, 0, 1, 0.4823529, 1,
-0.2128865, 1.978759, -0.8303314, 0, 1, 0.4901961, 1,
-0.210036, 0.08460376, -0.9553317, 0, 1, 0.4941176, 1,
-0.2056722, -2.725696, -2.241762, 0, 1, 0.5019608, 1,
-0.2028405, 0.4746179, -0.6692532, 0, 1, 0.509804, 1,
-0.2019582, -1.067701, -2.32993, 0, 1, 0.5137255, 1,
-0.1995856, -0.761844, -4.223495, 0, 1, 0.5215687, 1,
-0.1981251, -0.8504773, -3.454235, 0, 1, 0.5254902, 1,
-0.1963864, -1.101705, -3.982102, 0, 1, 0.5333334, 1,
-0.1941007, 1.224398, -1.317582, 0, 1, 0.5372549, 1,
-0.1928314, -0.6586682, -4.09401, 0, 1, 0.5450981, 1,
-0.192568, -1.148292, -2.524083, 0, 1, 0.5490196, 1,
-0.1870345, 0.7277689, -0.6918659, 0, 1, 0.5568628, 1,
-0.1856676, 0.5687882, 0.1838383, 0, 1, 0.5607843, 1,
-0.1847841, 1.29117, 0.346794, 0, 1, 0.5686275, 1,
-0.1824916, 0.8563424, -0.3989024, 0, 1, 0.572549, 1,
-0.1805594, -0.03101194, -1.620129, 0, 1, 0.5803922, 1,
-0.1797601, 1.260997, -0.4550207, 0, 1, 0.5843138, 1,
-0.1643445, -0.1003947, -2.063473, 0, 1, 0.5921569, 1,
-0.1640799, 1.012039, 0.3330887, 0, 1, 0.5960785, 1,
-0.1594846, -0.1928933, -2.046897, 0, 1, 0.6039216, 1,
-0.1545383, -1.598758, -2.834177, 0, 1, 0.6117647, 1,
-0.1522866, 1.412034, 1.286039, 0, 1, 0.6156863, 1,
-0.14074, -1.317954, -4.224466, 0, 1, 0.6235294, 1,
-0.1399634, 1.658952, 0.04434512, 0, 1, 0.627451, 1,
-0.1385845, -1.015969, -5.07143, 0, 1, 0.6352941, 1,
-0.138177, -1.451014, -3.299899, 0, 1, 0.6392157, 1,
-0.1355584, -0.4598946, -2.485066, 0, 1, 0.6470588, 1,
-0.1302808, 1.145094, -0.5418426, 0, 1, 0.6509804, 1,
-0.1297036, 0.9512823, 0.6135409, 0, 1, 0.6588235, 1,
-0.1262375, -0.7463358, -2.758577, 0, 1, 0.6627451, 1,
-0.1262243, 0.4621353, -0.05731821, 0, 1, 0.6705883, 1,
-0.1235792, -0.2446635, -2.806455, 0, 1, 0.6745098, 1,
-0.1229875, 1.07621, 1.744732, 0, 1, 0.682353, 1,
-0.1211956, -0.3298801, -1.936827, 0, 1, 0.6862745, 1,
-0.1185194, 0.001972885, -0.02866398, 0, 1, 0.6941177, 1,
-0.1174236, -0.1336583, -3.053063, 0, 1, 0.7019608, 1,
-0.1098923, 1.320085, -1.104706, 0, 1, 0.7058824, 1,
-0.1091308, 0.6981505, -0.1427095, 0, 1, 0.7137255, 1,
-0.1061156, 0.3103332, -0.8483037, 0, 1, 0.7176471, 1,
-0.1053545, -0.5247333, -1.644749, 0, 1, 0.7254902, 1,
-0.1051036, -1.429537, -4.686317, 0, 1, 0.7294118, 1,
-0.1003945, -0.4061389, -0.5868942, 0, 1, 0.7372549, 1,
-0.09694754, -0.9213928, -3.216988, 0, 1, 0.7411765, 1,
-0.09514248, 1.934646, -0.7771495, 0, 1, 0.7490196, 1,
-0.09489389, 0.02043391, -2.549042, 0, 1, 0.7529412, 1,
-0.09162945, -0.3442397, -2.896049, 0, 1, 0.7607843, 1,
-0.08545262, 1.637312, 0.1769112, 0, 1, 0.7647059, 1,
-0.08530352, 1.548195, 1.587297, 0, 1, 0.772549, 1,
-0.07713033, 0.910648, 0.01838227, 0, 1, 0.7764706, 1,
-0.07377262, -0.5916288, -3.921898, 0, 1, 0.7843137, 1,
-0.07166946, 0.6665814, -1.365103, 0, 1, 0.7882353, 1,
-0.06822487, 0.4560285, 0.8711744, 0, 1, 0.7960784, 1,
-0.06280159, 0.9325458, -0.01326955, 0, 1, 0.8039216, 1,
-0.06174057, 0.682538, -1.885579, 0, 1, 0.8078431, 1,
-0.05982847, -0.9537842, -4.425339, 0, 1, 0.8156863, 1,
-0.0588752, 1.847135, 1.240691, 0, 1, 0.8196079, 1,
-0.05366538, 0.06094203, -0.2910554, 0, 1, 0.827451, 1,
-0.04519043, -1.626378, -1.831472, 0, 1, 0.8313726, 1,
-0.04398052, -1.30936, -1.928981, 0, 1, 0.8392157, 1,
-0.04374292, -0.4074096, -3.409629, 0, 1, 0.8431373, 1,
-0.03455932, 0.08004408, -0.5953898, 0, 1, 0.8509804, 1,
-0.03323359, -0.3653497, -2.499726, 0, 1, 0.854902, 1,
-0.02773218, -1.216572, -4.215252, 0, 1, 0.8627451, 1,
-0.02629585, 0.414934, 0.4157059, 0, 1, 0.8666667, 1,
-0.01873255, -0.5120911, -4.536842, 0, 1, 0.8745098, 1,
-0.01725923, 1.568372, -1.879155, 0, 1, 0.8784314, 1,
-0.01343957, -0.4012077, -4.219511, 0, 1, 0.8862745, 1,
-0.01326003, 0.3678575, -1.534978, 0, 1, 0.8901961, 1,
-0.009521065, 2.230044, 0.05736201, 0, 1, 0.8980392, 1,
-0.007294739, 0.3544072, 0.2631727, 0, 1, 0.9058824, 1,
0.002460913, 0.4084706, -1.108438, 0, 1, 0.9098039, 1,
0.004387828, -1.857919, 2.847567, 0, 1, 0.9176471, 1,
0.004675517, 0.2383603, -0.001023392, 0, 1, 0.9215686, 1,
0.007702716, 0.7140028, -1.143606, 0, 1, 0.9294118, 1,
0.007989577, -0.4567268, 3.549739, 0, 1, 0.9333333, 1,
0.009931467, -0.5542113, 5.271782, 0, 1, 0.9411765, 1,
0.01200699, -0.5452164, 1.596661, 0, 1, 0.945098, 1,
0.01273869, -1.425977, 2.562763, 0, 1, 0.9529412, 1,
0.01424809, -2.317756, 3.421376, 0, 1, 0.9568627, 1,
0.01506914, 1.029535, 1.499647, 0, 1, 0.9647059, 1,
0.01931896, -0.7663595, 3.355658, 0, 1, 0.9686275, 1,
0.01966944, -0.6779078, 3.426546, 0, 1, 0.9764706, 1,
0.02015234, 0.8332306, 0.4540251, 0, 1, 0.9803922, 1,
0.02190056, -0.1048468, 2.95382, 0, 1, 0.9882353, 1,
0.02310016, -0.1383744, 3.334284, 0, 1, 0.9921569, 1,
0.02369051, 0.8981792, 0.7098127, 0, 1, 1, 1,
0.02569259, 0.7638628, 0.9772779, 0, 0.9921569, 1, 1,
0.02866213, 0.7697423, 3.329634, 0, 0.9882353, 1, 1,
0.03077523, 0.04675205, 0.7057267, 0, 0.9803922, 1, 1,
0.0320326, -0.2251193, 3.789334, 0, 0.9764706, 1, 1,
0.03580037, 2.584745, 1.235615, 0, 0.9686275, 1, 1,
0.03845326, 2.22348, 1.965121, 0, 0.9647059, 1, 1,
0.04139791, 0.6095732, -0.223775, 0, 0.9568627, 1, 1,
0.04271574, 0.09957415, -0.09845923, 0, 0.9529412, 1, 1,
0.04573791, 0.2670117, -0.3758848, 0, 0.945098, 1, 1,
0.05170606, 0.2373593, 0.7625942, 0, 0.9411765, 1, 1,
0.05202781, -1.658611, 2.650305, 0, 0.9333333, 1, 1,
0.0537496, 0.3495329, 0.5390647, 0, 0.9294118, 1, 1,
0.06060655, 0.5501803, 0.08684983, 0, 0.9215686, 1, 1,
0.06063758, -1.340161, 2.493066, 0, 0.9176471, 1, 1,
0.06669074, 0.9486365, -0.6803316, 0, 0.9098039, 1, 1,
0.06746641, 1.623921, -1.079921, 0, 0.9058824, 1, 1,
0.07235818, 0.8636158, -0.3159119, 0, 0.8980392, 1, 1,
0.07250901, 0.1777623, 1.650318, 0, 0.8901961, 1, 1,
0.07351362, -0.3833339, 4.219749, 0, 0.8862745, 1, 1,
0.07773427, -0.3610651, 1.589048, 0, 0.8784314, 1, 1,
0.08185461, 0.5796073, -1.183977, 0, 0.8745098, 1, 1,
0.08606496, -0.5757601, 4.763579, 0, 0.8666667, 1, 1,
0.0872335, 0.8630581, 1.196989, 0, 0.8627451, 1, 1,
0.08860771, -1.721595, 3.695827, 0, 0.854902, 1, 1,
0.08992918, 0.01932727, 0.5292193, 0, 0.8509804, 1, 1,
0.09549026, -0.1331006, 2.499268, 0, 0.8431373, 1, 1,
0.09554373, 0.9113353, -0.3782103, 0, 0.8392157, 1, 1,
0.09600038, -0.2513376, 2.60376, 0, 0.8313726, 1, 1,
0.09611496, 0.8584432, 1.708468, 0, 0.827451, 1, 1,
0.09740127, 0.9812784, -0.8087834, 0, 0.8196079, 1, 1,
0.09941348, -1.624159, 2.614911, 0, 0.8156863, 1, 1,
0.1000371, 0.5077711, 0.9779365, 0, 0.8078431, 1, 1,
0.1023725, -0.1016624, 0.8316107, 0, 0.8039216, 1, 1,
0.1065167, -0.4310801, 2.596951, 0, 0.7960784, 1, 1,
0.1072968, 3.085209, 0.06609881, 0, 0.7882353, 1, 1,
0.1078172, -0.6929373, 2.538183, 0, 0.7843137, 1, 1,
0.1088861, -2.124903, 2.711168, 0, 0.7764706, 1, 1,
0.1194537, 1.456682, 0.824495, 0, 0.772549, 1, 1,
0.1239577, 1.226464, -0.4657592, 0, 0.7647059, 1, 1,
0.1242904, 0.1434821, -0.07620855, 0, 0.7607843, 1, 1,
0.1247488, -0.8663579, 2.7658, 0, 0.7529412, 1, 1,
0.1265211, 0.1003403, 0.405328, 0, 0.7490196, 1, 1,
0.1324665, 0.6997036, -0.1606609, 0, 0.7411765, 1, 1,
0.1336696, 0.6123887, -0.5598112, 0, 0.7372549, 1, 1,
0.1399483, 0.3485671, -0.01165247, 0, 0.7294118, 1, 1,
0.1401239, 0.02311418, 1.948301, 0, 0.7254902, 1, 1,
0.1403674, -0.8154489, 3.806681, 0, 0.7176471, 1, 1,
0.1436897, -0.10887, 4.254429, 0, 0.7137255, 1, 1,
0.1471201, -0.9851218, 4.479393, 0, 0.7058824, 1, 1,
0.1476612, 0.1332349, 0.6738681, 0, 0.6980392, 1, 1,
0.149232, -0.06922919, 2.291263, 0, 0.6941177, 1, 1,
0.1499463, -0.1340013, 2.460037, 0, 0.6862745, 1, 1,
0.1582504, 0.4918368, -0.5086485, 0, 0.682353, 1, 1,
0.1638191, -0.8126236, 2.773335, 0, 0.6745098, 1, 1,
0.1662864, 1.441717, 1.309642, 0, 0.6705883, 1, 1,
0.1674797, -1.831678, 3.235754, 0, 0.6627451, 1, 1,
0.1682438, -0.9482771, 2.648916, 0, 0.6588235, 1, 1,
0.1753365, -0.5602908, 3.817731, 0, 0.6509804, 1, 1,
0.1791619, -0.1610358, 1.841642, 0, 0.6470588, 1, 1,
0.1795801, -1.508509, 3.861294, 0, 0.6392157, 1, 1,
0.1810641, -1.145444, 2.983541, 0, 0.6352941, 1, 1,
0.1811708, 1.078122, -1.32697, 0, 0.627451, 1, 1,
0.1847174, 0.438047, 1.184809, 0, 0.6235294, 1, 1,
0.1849499, -0.4907806, 3.342808, 0, 0.6156863, 1, 1,
0.1850711, 0.6796882, 1.150642, 0, 0.6117647, 1, 1,
0.1864706, 1.291567, -0.7104226, 0, 0.6039216, 1, 1,
0.1894344, 0.9957854, -1.594004, 0, 0.5960785, 1, 1,
0.191229, 0.3358383, 0.8391327, 0, 0.5921569, 1, 1,
0.1937377, -1.095077, 3.531452, 0, 0.5843138, 1, 1,
0.2003783, 0.00316046, 1.010198, 0, 0.5803922, 1, 1,
0.2060737, -2.381462, 4.181422, 0, 0.572549, 1, 1,
0.2093619, -1.230662, 2.576294, 0, 0.5686275, 1, 1,
0.2149962, 2.061435, 0.5063971, 0, 0.5607843, 1, 1,
0.2161224, -0.187488, -0.144986, 0, 0.5568628, 1, 1,
0.2202542, -1.099255, 1.212501, 0, 0.5490196, 1, 1,
0.2242732, -0.6772452, 2.963794, 0, 0.5450981, 1, 1,
0.2264489, -0.3073301, 1.422797, 0, 0.5372549, 1, 1,
0.2273892, -0.8900977, 4.16194, 0, 0.5333334, 1, 1,
0.2281819, -0.7094327, 2.31712, 0, 0.5254902, 1, 1,
0.2369954, -0.01754469, 3.403609, 0, 0.5215687, 1, 1,
0.239907, 1.080829, -0.1538806, 0, 0.5137255, 1, 1,
0.2459563, 1.02612, -0.5987924, 0, 0.509804, 1, 1,
0.2473819, -0.2113102, 1.561914, 0, 0.5019608, 1, 1,
0.2483051, -2.124821, 3.256317, 0, 0.4941176, 1, 1,
0.2491501, 1.197689, 0.3563803, 0, 0.4901961, 1, 1,
0.2614032, -0.5547667, 2.615237, 0, 0.4823529, 1, 1,
0.2635463, -0.6373932, 2.807029, 0, 0.4784314, 1, 1,
0.2636153, -0.5374753, 1.583966, 0, 0.4705882, 1, 1,
0.26608, -0.2755387, 2.303245, 0, 0.4666667, 1, 1,
0.2697629, -0.7951037, 4.131206, 0, 0.4588235, 1, 1,
0.2727056, -0.6316201, 2.916037, 0, 0.454902, 1, 1,
0.2762737, -0.2111788, 3.701634, 0, 0.4470588, 1, 1,
0.2775138, 0.6562086, -0.2353425, 0, 0.4431373, 1, 1,
0.280674, -0.3292095, 3.347315, 0, 0.4352941, 1, 1,
0.2827057, 0.08355092, 2.902651, 0, 0.4313726, 1, 1,
0.2870465, -1.030911, 4.366721, 0, 0.4235294, 1, 1,
0.2870563, 0.2172332, 0.3066911, 0, 0.4196078, 1, 1,
0.2875138, 0.8761992, -0.3072575, 0, 0.4117647, 1, 1,
0.2921904, 1.008997, 1.029203, 0, 0.4078431, 1, 1,
0.2937902, -1.093328, 3.387022, 0, 0.4, 1, 1,
0.2940447, 1.833348, 0.437497, 0, 0.3921569, 1, 1,
0.2979896, -0.5510764, 2.693317, 0, 0.3882353, 1, 1,
0.2988582, 0.303704, 0.3878944, 0, 0.3803922, 1, 1,
0.3003055, 0.03416395, -0.03123631, 0, 0.3764706, 1, 1,
0.3009569, 0.75117, 0.1703805, 0, 0.3686275, 1, 1,
0.3037527, 1.362329, -0.3324275, 0, 0.3647059, 1, 1,
0.3050578, 1.333166, 1.816773, 0, 0.3568628, 1, 1,
0.3170755, 0.2755118, 1.405997, 0, 0.3529412, 1, 1,
0.3193305, 1.06328, 0.3470443, 0, 0.345098, 1, 1,
0.3206345, 0.2602112, -0.5281749, 0, 0.3411765, 1, 1,
0.3372513, -0.2744521, -0.03025791, 0, 0.3333333, 1, 1,
0.3382981, -1.827481, 3.48257, 0, 0.3294118, 1, 1,
0.3403994, -0.4499987, 3.37432, 0, 0.3215686, 1, 1,
0.3404224, -0.291902, 2.53538, 0, 0.3176471, 1, 1,
0.3453446, 1.094916, 1.103622, 0, 0.3098039, 1, 1,
0.3471081, 0.344171, 2.486048, 0, 0.3058824, 1, 1,
0.3539711, -0.2610714, 1.574586, 0, 0.2980392, 1, 1,
0.3559096, 0.6885866, -0.6117416, 0, 0.2901961, 1, 1,
0.3571964, 1.068041, 0.8978646, 0, 0.2862745, 1, 1,
0.3639609, -0.1589626, 3.278779, 0, 0.2784314, 1, 1,
0.3646747, 0.1726549, 2.559091, 0, 0.2745098, 1, 1,
0.3652166, 0.8002898, 0.249902, 0, 0.2666667, 1, 1,
0.3726988, -1.061362, 3.041601, 0, 0.2627451, 1, 1,
0.3749577, 0.7085102, -0.5930144, 0, 0.254902, 1, 1,
0.3750029, -1.406973, 1.533223, 0, 0.2509804, 1, 1,
0.3760712, 0.9874451, 0.1304505, 0, 0.2431373, 1, 1,
0.3763245, 1.281361, 0.3349, 0, 0.2392157, 1, 1,
0.3802501, 0.3773057, 0.1985749, 0, 0.2313726, 1, 1,
0.3834444, 0.6923036, 0.3160483, 0, 0.227451, 1, 1,
0.3852344, 0.4902977, 0.5876998, 0, 0.2196078, 1, 1,
0.3854097, 0.6816555, 0.4783516, 0, 0.2156863, 1, 1,
0.3897864, -0.3093836, 2.536183, 0, 0.2078431, 1, 1,
0.3898663, 0.01061187, 0.6150868, 0, 0.2039216, 1, 1,
0.3967852, 0.8765372, 0.6813303, 0, 0.1960784, 1, 1,
0.4051283, -0.2567713, 2.5813, 0, 0.1882353, 1, 1,
0.405298, -1.517851, 1.97964, 0, 0.1843137, 1, 1,
0.406173, -1.199842, 3.276605, 0, 0.1764706, 1, 1,
0.4099074, 0.1118696, 1.972126, 0, 0.172549, 1, 1,
0.4129019, -0.187664, 2.906879, 0, 0.1647059, 1, 1,
0.4180478, -0.660033, 1.915898, 0, 0.1607843, 1, 1,
0.420245, 0.376331, 1.018906, 0, 0.1529412, 1, 1,
0.4205463, -0.9423477, 3.883803, 0, 0.1490196, 1, 1,
0.4253284, 0.5961376, -0.5828916, 0, 0.1411765, 1, 1,
0.425772, 0.03781751, 0.02666504, 0, 0.1372549, 1, 1,
0.4300548, -0.7829825, 3.194871, 0, 0.1294118, 1, 1,
0.4304833, 1.207781, 0.2415771, 0, 0.1254902, 1, 1,
0.4355468, -0.8442608, 3.975893, 0, 0.1176471, 1, 1,
0.4381775, 0.5541885, 2.981358, 0, 0.1137255, 1, 1,
0.4390675, 0.899931, 2.381973, 0, 0.1058824, 1, 1,
0.4430406, -0.5415468, 3.712608, 0, 0.09803922, 1, 1,
0.4454041, 0.5874442, 1.24007, 0, 0.09411765, 1, 1,
0.4459578, -0.5441113, 2.754964, 0, 0.08627451, 1, 1,
0.4463851, -0.28038, 1.255629, 0, 0.08235294, 1, 1,
0.450986, 0.8650023, -0.994005, 0, 0.07450981, 1, 1,
0.4541, 0.5813488, 0.8367849, 0, 0.07058824, 1, 1,
0.4596617, 0.3846555, 0.9049532, 0, 0.0627451, 1, 1,
0.4728954, 1.063216, 1.564744, 0, 0.05882353, 1, 1,
0.4742337, -0.0455974, 1.607323, 0, 0.05098039, 1, 1,
0.478493, -1.149335, 2.309249, 0, 0.04705882, 1, 1,
0.4796139, 0.397912, 1.0456, 0, 0.03921569, 1, 1,
0.4835973, -0.564253, 3.895553, 0, 0.03529412, 1, 1,
0.4836063, 0.8711542, 1.084736, 0, 0.02745098, 1, 1,
0.4838958, 0.7128614, 1.763513, 0, 0.02352941, 1, 1,
0.4850916, -0.3437406, 1.582878, 0, 0.01568628, 1, 1,
0.4863982, -1.13185, 1.377643, 0, 0.01176471, 1, 1,
0.4894744, 1.752535, -0.3835484, 0, 0.003921569, 1, 1,
0.4898378, -1.64823, 1.375756, 0.003921569, 0, 1, 1,
0.4903105, 1.394576, 0.195567, 0.007843138, 0, 1, 1,
0.4920277, -1.014444, 2.536228, 0.01568628, 0, 1, 1,
0.4927419, -0.6131867, 1.663123, 0.01960784, 0, 1, 1,
0.5019102, 1.084299, -0.01641864, 0.02745098, 0, 1, 1,
0.5023848, -1.184468, 2.891645, 0.03137255, 0, 1, 1,
0.5059328, -0.6067169, 3.720427, 0.03921569, 0, 1, 1,
0.5062585, 0.07504395, 2.358577, 0.04313726, 0, 1, 1,
0.5090544, -1.107003, 3.374833, 0.05098039, 0, 1, 1,
0.5119525, -0.05867226, 4.071494, 0.05490196, 0, 1, 1,
0.5233801, -0.7961297, 1.326614, 0.0627451, 0, 1, 1,
0.5244673, -1.009987, 3.42144, 0.06666667, 0, 1, 1,
0.5266895, 0.4301413, 0.7599052, 0.07450981, 0, 1, 1,
0.527151, -1.246651, 1.403934, 0.07843138, 0, 1, 1,
0.5309542, 1.754005, 0.4100113, 0.08627451, 0, 1, 1,
0.5352158, 0.9802986, 0.1002905, 0.09019608, 0, 1, 1,
0.5369415, 1.172052, -0.456671, 0.09803922, 0, 1, 1,
0.539467, -0.7941728, 2.456727, 0.1058824, 0, 1, 1,
0.540439, -0.1459633, 1.598739, 0.1098039, 0, 1, 1,
0.5404956, -1.332713, 3.862252, 0.1176471, 0, 1, 1,
0.5465173, -0.3303552, 3.362002, 0.1215686, 0, 1, 1,
0.5470374, 0.4424407, 0.3427953, 0.1294118, 0, 1, 1,
0.547111, -1.556496, 2.679557, 0.1333333, 0, 1, 1,
0.5471287, -0.4015383, 2.085148, 0.1411765, 0, 1, 1,
0.5507799, -1.174916, 4.196249, 0.145098, 0, 1, 1,
0.5551641, -1.502063, 3.179654, 0.1529412, 0, 1, 1,
0.555171, 0.192136, -0.7203969, 0.1568628, 0, 1, 1,
0.5616298, -0.6488187, 4.71908, 0.1647059, 0, 1, 1,
0.56648, -0.4169804, 3.135687, 0.1686275, 0, 1, 1,
0.5694326, -0.9040879, 2.950625, 0.1764706, 0, 1, 1,
0.5781914, 0.3047636, 1.173061, 0.1803922, 0, 1, 1,
0.5878919, -0.897862, 2.103139, 0.1882353, 0, 1, 1,
0.5882663, 0.8438473, -1.495769, 0.1921569, 0, 1, 1,
0.5892048, -0.3476824, 2.570388, 0.2, 0, 1, 1,
0.5895615, -0.1186227, 0.0372761, 0.2078431, 0, 1, 1,
0.5916325, 1.937633, 1.547811, 0.2117647, 0, 1, 1,
0.5934867, 1.443432, 0.5340788, 0.2196078, 0, 1, 1,
0.5945725, -0.5772891, 3.099598, 0.2235294, 0, 1, 1,
0.5969467, 0.5795897, 0.7525418, 0.2313726, 0, 1, 1,
0.6004329, -0.07949815, 1.279757, 0.2352941, 0, 1, 1,
0.6119785, -1.38084, 0.8061138, 0.2431373, 0, 1, 1,
0.6122081, 1.066549, 0.5617867, 0.2470588, 0, 1, 1,
0.6129086, -0.7103883, 3.433028, 0.254902, 0, 1, 1,
0.6149213, -0.4830276, 1.346882, 0.2588235, 0, 1, 1,
0.6160222, -1.698106, 3.399894, 0.2666667, 0, 1, 1,
0.61756, -1.508719, 5.061765, 0.2705882, 0, 1, 1,
0.6184546, -0.5623969, 2.039012, 0.2784314, 0, 1, 1,
0.6253675, 0.7939879, 0.1177921, 0.282353, 0, 1, 1,
0.6258738, 1.317483, -0.1457188, 0.2901961, 0, 1, 1,
0.6259184, -0.8979426, 1.807859, 0.2941177, 0, 1, 1,
0.627125, 0.08931982, 1.372257, 0.3019608, 0, 1, 1,
0.6346081, 0.4750527, -0.09603159, 0.3098039, 0, 1, 1,
0.6366721, 0.1320319, 2.913887, 0.3137255, 0, 1, 1,
0.6389078, -0.03331211, 1.012423, 0.3215686, 0, 1, 1,
0.6415476, 0.09079837, 1.908108, 0.3254902, 0, 1, 1,
0.6436399, 0.2779513, 1.288046, 0.3333333, 0, 1, 1,
0.6439008, -0.7086034, 2.849414, 0.3372549, 0, 1, 1,
0.6474792, -0.6647845, 2.269592, 0.345098, 0, 1, 1,
0.6480148, -1.990079, 2.190858, 0.3490196, 0, 1, 1,
0.6487901, -1.082499, 1.822729, 0.3568628, 0, 1, 1,
0.6511837, 1.510497, 0.3227088, 0.3607843, 0, 1, 1,
0.6548163, 1.487033, 1.329348, 0.3686275, 0, 1, 1,
0.6568798, 0.04187158, 1.915412, 0.372549, 0, 1, 1,
0.6574512, 2.189263, -0.468378, 0.3803922, 0, 1, 1,
0.6634435, -0.7479681, 1.892628, 0.3843137, 0, 1, 1,
0.6669713, 0.889864, 0.4578588, 0.3921569, 0, 1, 1,
0.6674002, -0.9027568, 3.330757, 0.3960784, 0, 1, 1,
0.6825777, -1.793624, 1.657093, 0.4039216, 0, 1, 1,
0.6853349, 0.3495608, 0.340218, 0.4117647, 0, 1, 1,
0.687187, -3.073165, 4.632942, 0.4156863, 0, 1, 1,
0.6914405, 0.2294693, 2.24001, 0.4235294, 0, 1, 1,
0.6940317, 1.191334, 1.359017, 0.427451, 0, 1, 1,
0.6948375, -0.1233489, 1.310398, 0.4352941, 0, 1, 1,
0.6951241, 1.20066, -1.255336, 0.4392157, 0, 1, 1,
0.7021493, -1.530913, 2.512341, 0.4470588, 0, 1, 1,
0.7094804, 1.19731, -0.9426394, 0.4509804, 0, 1, 1,
0.7099914, 1.017651, 1.705996, 0.4588235, 0, 1, 1,
0.711245, 0.3159059, 1.586402, 0.4627451, 0, 1, 1,
0.7135796, -0.3119803, 2.105642, 0.4705882, 0, 1, 1,
0.7139087, -1.435069, 0.9365548, 0.4745098, 0, 1, 1,
0.7143374, -0.6461738, 1.708067, 0.4823529, 0, 1, 1,
0.7150847, -0.3319072, 1.524851, 0.4862745, 0, 1, 1,
0.7157851, 0.4478659, 0.9199737, 0.4941176, 0, 1, 1,
0.7179333, 0.1685543, 1.289232, 0.5019608, 0, 1, 1,
0.719005, -0.526737, 3.107503, 0.5058824, 0, 1, 1,
0.7240682, -0.4626693, 1.66861, 0.5137255, 0, 1, 1,
0.7261915, 0.6445739, 1.02949, 0.5176471, 0, 1, 1,
0.7314681, 1.534711, -0.1736081, 0.5254902, 0, 1, 1,
0.7316172, 1.399827, 1.166211, 0.5294118, 0, 1, 1,
0.7331585, 0.3400309, 1.805552, 0.5372549, 0, 1, 1,
0.7371188, 0.5561076, 0.8664747, 0.5411765, 0, 1, 1,
0.7405028, 0.3398557, 0.8640437, 0.5490196, 0, 1, 1,
0.7423235, -0.1095444, 1.669898, 0.5529412, 0, 1, 1,
0.7436066, -1.175525, 4.581296, 0.5607843, 0, 1, 1,
0.7469802, -0.0886779, 1.914514, 0.5647059, 0, 1, 1,
0.7471371, 0.9296421, 0.3162132, 0.572549, 0, 1, 1,
0.7481185, 1.099918, 1.149857, 0.5764706, 0, 1, 1,
0.7499031, -0.6623921, 2.068927, 0.5843138, 0, 1, 1,
0.7512748, 0.5732419, 1.429848, 0.5882353, 0, 1, 1,
0.753879, -0.5524591, 2.017154, 0.5960785, 0, 1, 1,
0.7552226, -0.9338353, 3.341967, 0.6039216, 0, 1, 1,
0.7585718, 2.328245, -0.5985515, 0.6078432, 0, 1, 1,
0.7604344, 0.08327763, 0.845143, 0.6156863, 0, 1, 1,
0.7677304, 0.3072796, 3.066972, 0.6196079, 0, 1, 1,
0.7705023, 0.6355982, 1.713892, 0.627451, 0, 1, 1,
0.7773665, -0.278147, 2.051927, 0.6313726, 0, 1, 1,
0.7816012, 0.2693397, 1.502663, 0.6392157, 0, 1, 1,
0.7854417, -0.3396143, 2.306088, 0.6431373, 0, 1, 1,
0.7893535, -0.3846044, 2.547493, 0.6509804, 0, 1, 1,
0.7916164, -0.1685355, 0.5026847, 0.654902, 0, 1, 1,
0.7932571, 0.8221522, 1.56797, 0.6627451, 0, 1, 1,
0.795179, 0.1725897, 1.503303, 0.6666667, 0, 1, 1,
0.7964066, 0.7919846, 0.8525367, 0.6745098, 0, 1, 1,
0.7978314, -0.7047435, 1.904291, 0.6784314, 0, 1, 1,
0.8012015, -1.170595, 2.100548, 0.6862745, 0, 1, 1,
0.8043844, 1.533669, 0.679486, 0.6901961, 0, 1, 1,
0.8086965, -1.224242, 1.889271, 0.6980392, 0, 1, 1,
0.8114106, -0.5233602, 2.177268, 0.7058824, 0, 1, 1,
0.8128713, 1.402322, -0.2841361, 0.7098039, 0, 1, 1,
0.8159911, 0.5976655, -1.038585, 0.7176471, 0, 1, 1,
0.8160197, 0.2789163, 1.722633, 0.7215686, 0, 1, 1,
0.8252438, 1.077179, 0.4162942, 0.7294118, 0, 1, 1,
0.8261817, -0.008100295, 2.837365, 0.7333333, 0, 1, 1,
0.8387887, 1.158431, 0.9861176, 0.7411765, 0, 1, 1,
0.8389664, -0.4172419, 1.107149, 0.7450981, 0, 1, 1,
0.8406997, -0.647253, 2.820184, 0.7529412, 0, 1, 1,
0.8446465, -0.4905354, 2.28418, 0.7568628, 0, 1, 1,
0.8583396, -0.5453811, 3.274606, 0.7647059, 0, 1, 1,
0.8595631, -0.7684671, 2.337415, 0.7686275, 0, 1, 1,
0.8607333, -0.6835063, 4.126081, 0.7764706, 0, 1, 1,
0.8666323, 3.434163, 1.31558, 0.7803922, 0, 1, 1,
0.8719967, 1.203163, 0.5391859, 0.7882353, 0, 1, 1,
0.8784386, 0.1792521, 1.789395, 0.7921569, 0, 1, 1,
0.8814496, -0.2283939, 0.3317572, 0.8, 0, 1, 1,
0.8818213, 0.429168, 1.521564, 0.8078431, 0, 1, 1,
0.8905435, 0.2330278, 1.61566, 0.8117647, 0, 1, 1,
0.9067739, 2.187435, 0.2782488, 0.8196079, 0, 1, 1,
0.9137423, -1.398583, 3.979634, 0.8235294, 0, 1, 1,
0.9143526, 1.568077, 0.3647768, 0.8313726, 0, 1, 1,
0.9198591, 0.6763012, 0.9705286, 0.8352941, 0, 1, 1,
0.9248981, -0.8570814, 1.288658, 0.8431373, 0, 1, 1,
0.9274814, -0.3381618, 0.4036884, 0.8470588, 0, 1, 1,
0.9295776, -0.05156409, -0.4220904, 0.854902, 0, 1, 1,
0.9305109, -1.880609, 1.626834, 0.8588235, 0, 1, 1,
0.9372081, -0.3703082, 1.434351, 0.8666667, 0, 1, 1,
0.938989, 0.01635587, 1.377805, 0.8705882, 0, 1, 1,
0.9447933, -1.543193, 2.668307, 0.8784314, 0, 1, 1,
0.94756, 0.5972089, 2.014848, 0.8823529, 0, 1, 1,
0.9518688, 0.1530503, 1.401301, 0.8901961, 0, 1, 1,
0.9530711, -1.475562, 1.958113, 0.8941177, 0, 1, 1,
0.9534799, 1.111841, -0.1649014, 0.9019608, 0, 1, 1,
0.9542975, -0.3990317, 2.216227, 0.9098039, 0, 1, 1,
0.9579452, -0.3616455, 1.12506, 0.9137255, 0, 1, 1,
0.9631605, 0.8647793, 2.613629, 0.9215686, 0, 1, 1,
0.9637756, -0.01006305, 1.607127, 0.9254902, 0, 1, 1,
0.9645439, -0.2778096, 2.265476, 0.9333333, 0, 1, 1,
0.9692366, -0.4082125, 2.082595, 0.9372549, 0, 1, 1,
0.977962, 0.8871169, -0.9753101, 0.945098, 0, 1, 1,
0.9806667, -1.022791, 3.301255, 0.9490196, 0, 1, 1,
0.9859913, -0.3461826, 2.710869, 0.9568627, 0, 1, 1,
0.9928755, 1.322045, 2.189707, 0.9607843, 0, 1, 1,
0.9954649, 0.6568927, 0.8789599, 0.9686275, 0, 1, 1,
0.9957016, -1.033149, 0.974757, 0.972549, 0, 1, 1,
0.998559, 1.030938, 3.06641, 0.9803922, 0, 1, 1,
1.007196, 0.07673366, 1.213118, 0.9843137, 0, 1, 1,
1.007703, 0.7430039, 0.3561435, 0.9921569, 0, 1, 1,
1.01393, 0.4036949, -0.03610139, 0.9960784, 0, 1, 1,
1.015032, -1.158817, 1.251766, 1, 0, 0.9960784, 1,
1.032972, -0.9971895, 2.783291, 1, 0, 0.9882353, 1,
1.034493, 1.013234, 0.6434768, 1, 0, 0.9843137, 1,
1.042744, 0.7044911, 1.489152, 1, 0, 0.9764706, 1,
1.043983, -0.3680662, 0.7965418, 1, 0, 0.972549, 1,
1.04925, -0.6550386, 1.4313, 1, 0, 0.9647059, 1,
1.054978, -1.156729, 5.29902, 1, 0, 0.9607843, 1,
1.060367, -0.317732, 0.6401747, 1, 0, 0.9529412, 1,
1.066445, -0.7951961, 1.751155, 1, 0, 0.9490196, 1,
1.067973, 0.5345924, -0.4268169, 1, 0, 0.9411765, 1,
1.06887, -1.697438, 2.442711, 1, 0, 0.9372549, 1,
1.087362, 1.632209, 0.1168733, 1, 0, 0.9294118, 1,
1.088219, 0.3718529, 2.391912, 1, 0, 0.9254902, 1,
1.107617, -0.58099, 2.503108, 1, 0, 0.9176471, 1,
1.118622, -0.1774269, 1.700969, 1, 0, 0.9137255, 1,
1.121006, 1.014719, -0.09970212, 1, 0, 0.9058824, 1,
1.122003, -0.2657156, 4.657094, 1, 0, 0.9019608, 1,
1.123089, 0.4974713, 0.8872321, 1, 0, 0.8941177, 1,
1.124381, 2.111423, 0.7543998, 1, 0, 0.8862745, 1,
1.129389, 0.6899164, 2.148113, 1, 0, 0.8823529, 1,
1.132586, -1.189255, 1.974673, 1, 0, 0.8745098, 1,
1.135968, -0.5319184, 1.214971, 1, 0, 0.8705882, 1,
1.13628, 0.251748, 1.447371, 1, 0, 0.8627451, 1,
1.138937, 0.01035071, 0.8551178, 1, 0, 0.8588235, 1,
1.144621, -0.9658707, 3.433637, 1, 0, 0.8509804, 1,
1.166918, -0.7679219, 2.561194, 1, 0, 0.8470588, 1,
1.176454, -1.047545, 2.717678, 1, 0, 0.8392157, 1,
1.187408, 1.395715, 2.216581, 1, 0, 0.8352941, 1,
1.190013, 0.008166124, 1.273342, 1, 0, 0.827451, 1,
1.194259, 0.796765, 0.2096209, 1, 0, 0.8235294, 1,
1.203241, 0.4278827, 0.7049909, 1, 0, 0.8156863, 1,
1.206979, -0.4887906, 2.243077, 1, 0, 0.8117647, 1,
1.212365, -0.3815212, 1.479178, 1, 0, 0.8039216, 1,
1.213268, -0.4031683, 1.366939, 1, 0, 0.7960784, 1,
1.216892, 1.40489, 2.572007, 1, 0, 0.7921569, 1,
1.217286, 0.1696704, 1.507749, 1, 0, 0.7843137, 1,
1.218807, -0.5478706, 1.185304, 1, 0, 0.7803922, 1,
1.220384, -0.6934512, 3.085663, 1, 0, 0.772549, 1,
1.225014, -0.8290967, 3.533644, 1, 0, 0.7686275, 1,
1.233243, 0.4163874, 2.455205, 1, 0, 0.7607843, 1,
1.245494, 0.03381697, 1.458163, 1, 0, 0.7568628, 1,
1.250176, -1.662872, 3.511029, 1, 0, 0.7490196, 1,
1.251477, 0.3083577, 0.9227588, 1, 0, 0.7450981, 1,
1.251573, -1.400309, 0.7380054, 1, 0, 0.7372549, 1,
1.253434, -1.107392, 4.313913, 1, 0, 0.7333333, 1,
1.257661, -0.2485281, 0.8900484, 1, 0, 0.7254902, 1,
1.257761, 0.312801, 2.364019, 1, 0, 0.7215686, 1,
1.266652, -1.771551, 4.370948, 1, 0, 0.7137255, 1,
1.277843, -0.3010356, 3.606528, 1, 0, 0.7098039, 1,
1.2883, -0.9388546, 2.727773, 1, 0, 0.7019608, 1,
1.291443, -0.1468376, 1.499189, 1, 0, 0.6941177, 1,
1.294487, -0.5935021, 1.466454, 1, 0, 0.6901961, 1,
1.301616, -1.606621, 2.106038, 1, 0, 0.682353, 1,
1.324868, -0.5652115, 1.923377, 1, 0, 0.6784314, 1,
1.328811, 0.313504, 2.903091, 1, 0, 0.6705883, 1,
1.346557, 1.978087, 1.104052, 1, 0, 0.6666667, 1,
1.349018, -0.1852567, 3.90537, 1, 0, 0.6588235, 1,
1.354044, 0.3907979, -0.3586941, 1, 0, 0.654902, 1,
1.354374, -0.2002187, 1.663104, 1, 0, 0.6470588, 1,
1.354399, -0.8172426, 2.741982, 1, 0, 0.6431373, 1,
1.355013, 2.429336, -0.2041617, 1, 0, 0.6352941, 1,
1.368881, 0.3298323, 1.222422, 1, 0, 0.6313726, 1,
1.369917, -0.2730714, 0.3812532, 1, 0, 0.6235294, 1,
1.378801, 0.3361989, 1.705339, 1, 0, 0.6196079, 1,
1.380572, 0.499909, 1.414072, 1, 0, 0.6117647, 1,
1.383795, 0.2812915, 3.497003, 1, 0, 0.6078432, 1,
1.390184, 0.5260058, 1.88747, 1, 0, 0.6, 1,
1.393328, 0.2700396, -0.155944, 1, 0, 0.5921569, 1,
1.394502, 0.3341492, 1.314654, 1, 0, 0.5882353, 1,
1.404788, -0.3503348, 3.250141, 1, 0, 0.5803922, 1,
1.414827, -0.2522283, 2.439779, 1, 0, 0.5764706, 1,
1.416297, -2.217772, 2.103173, 1, 0, 0.5686275, 1,
1.416653, 0.552794, 0.7084626, 1, 0, 0.5647059, 1,
1.417024, 1.805601, 1.198415, 1, 0, 0.5568628, 1,
1.420163, 0.0352736, 1.147653, 1, 0, 0.5529412, 1,
1.425001, -0.05809619, 1.487013, 1, 0, 0.5450981, 1,
1.441049, -0.5342885, 2.51265, 1, 0, 0.5411765, 1,
1.449532, -1.170316, 3.28209, 1, 0, 0.5333334, 1,
1.453984, 1.379325, 1.431675, 1, 0, 0.5294118, 1,
1.456769, -0.9967076, 1.021978, 1, 0, 0.5215687, 1,
1.461255, 0.5780604, 0.8706254, 1, 0, 0.5176471, 1,
1.461504, -1.571564, 1.635562, 1, 0, 0.509804, 1,
1.472891, 1.052891, 1.883483, 1, 0, 0.5058824, 1,
1.488256, -0.5630838, 1.657535, 1, 0, 0.4980392, 1,
1.490583, -0.9665431, 2.899298, 1, 0, 0.4901961, 1,
1.495356, 0.7537604, 1.109044, 1, 0, 0.4862745, 1,
1.506235, 1.426407, -0.3671518, 1, 0, 0.4784314, 1,
1.507961, 0.09046589, -0.4005943, 1, 0, 0.4745098, 1,
1.510588, 0.6236109, -1.05899, 1, 0, 0.4666667, 1,
1.517833, -1.42542, 2.884985, 1, 0, 0.4627451, 1,
1.525024, 1.405332, 0.3383562, 1, 0, 0.454902, 1,
1.533765, 0.3156541, 0.5560309, 1, 0, 0.4509804, 1,
1.556038, -1.179257, 0.08956327, 1, 0, 0.4431373, 1,
1.571885, -0.1148563, 1.055862, 1, 0, 0.4392157, 1,
1.597989, 1.455558, 0.3009165, 1, 0, 0.4313726, 1,
1.599418, 0.6246874, 0.1839021, 1, 0, 0.427451, 1,
1.60499, -1.639185, 3.056595, 1, 0, 0.4196078, 1,
1.608993, -0.837056, 0.3052059, 1, 0, 0.4156863, 1,
1.626521, 2.515611, 1.551817, 1, 0, 0.4078431, 1,
1.633391, 0.711348, 1.219984, 1, 0, 0.4039216, 1,
1.634888, -1.621784, 1.949817, 1, 0, 0.3960784, 1,
1.635664, -0.9839364, 1.40559, 1, 0, 0.3882353, 1,
1.643706, 1.271904, 1.533607, 1, 0, 0.3843137, 1,
1.64592, -1.176687, 1.921171, 1, 0, 0.3764706, 1,
1.655536, 0.8643357, -1.591686, 1, 0, 0.372549, 1,
1.660379, 1.993693, 0.09785601, 1, 0, 0.3647059, 1,
1.666417, 1.396759, 1.347992, 1, 0, 0.3607843, 1,
1.676685, 1.016792, 0.3228468, 1, 0, 0.3529412, 1,
1.702194, 0.526699, 0.8899978, 1, 0, 0.3490196, 1,
1.704277, 0.2756046, 2.172174, 1, 0, 0.3411765, 1,
1.706755, -0.4643573, 3.294926, 1, 0, 0.3372549, 1,
1.709552, -0.2659903, 0.7441896, 1, 0, 0.3294118, 1,
1.721208, -0.2904154, 2.408903, 1, 0, 0.3254902, 1,
1.749455, -0.2590376, 1.80264, 1, 0, 0.3176471, 1,
1.74964, -0.4687406, 2.904994, 1, 0, 0.3137255, 1,
1.756479, -1.503978, 2.998893, 1, 0, 0.3058824, 1,
1.766175, 0.3861567, 1.465917, 1, 0, 0.2980392, 1,
1.766228, -0.8229395, 1.272621, 1, 0, 0.2941177, 1,
1.772798, -1.493429, 3.522883, 1, 0, 0.2862745, 1,
1.791645, -0.938859, 3.359317, 1, 0, 0.282353, 1,
1.864365, 0.8191203, 1.13224, 1, 0, 0.2745098, 1,
1.869002, 0.2898474, 1.058537, 1, 0, 0.2705882, 1,
1.882836, -0.873023, 1.340502, 1, 0, 0.2627451, 1,
1.89982, 0.1821735, 1.86723, 1, 0, 0.2588235, 1,
1.902895, 0.6322529, 1.861305, 1, 0, 0.2509804, 1,
1.919522, -0.5264614, 2.239204, 1, 0, 0.2470588, 1,
1.937428, 1.974575, 0.4700627, 1, 0, 0.2392157, 1,
1.939525, -0.2012613, 0.4816721, 1, 0, 0.2352941, 1,
1.945853, -1.694539, 2.219978, 1, 0, 0.227451, 1,
1.948464, 0.4884832, -1.278221, 1, 0, 0.2235294, 1,
1.967272, -2.110389, 2.711201, 1, 0, 0.2156863, 1,
1.968376, -0.7952089, 2.434435, 1, 0, 0.2117647, 1,
1.971891, -0.2082553, 1.379504, 1, 0, 0.2039216, 1,
1.973848, 0.4557223, -0.01874454, 1, 0, 0.1960784, 1,
1.985422, -0.5582787, 1.616009, 1, 0, 0.1921569, 1,
2.015476, -1.513793, 3.173373, 1, 0, 0.1843137, 1,
2.016063, -0.3074655, 1.343597, 1, 0, 0.1803922, 1,
2.028979, 1.118492, 2.128088, 1, 0, 0.172549, 1,
2.032653, -0.1355015, 2.303338, 1, 0, 0.1686275, 1,
2.033013, -0.0372628, 2.063703, 1, 0, 0.1607843, 1,
2.058538, 1.427239, 0.9150673, 1, 0, 0.1568628, 1,
2.067252, -0.5402929, 1.143508, 1, 0, 0.1490196, 1,
2.130468, 1.369532, 2.020233, 1, 0, 0.145098, 1,
2.146227, 1.228227, 0.7283725, 1, 0, 0.1372549, 1,
2.149479, 0.2640112, 4.57681, 1, 0, 0.1333333, 1,
2.156856, -0.03572106, 1.761682, 1, 0, 0.1254902, 1,
2.160199, 0.6370938, 1.88742, 1, 0, 0.1215686, 1,
2.17065, 0.5470936, 0.6602138, 1, 0, 0.1137255, 1,
2.200683, -1.368468, 1.090072, 1, 0, 0.1098039, 1,
2.241513, 0.8883145, 2.144936, 1, 0, 0.1019608, 1,
2.25495, 0.3355573, 1.489659, 1, 0, 0.09411765, 1,
2.276783, 1.359708, 2.458499, 1, 0, 0.09019608, 1,
2.292449, 0.3174911, 0.8091488, 1, 0, 0.08235294, 1,
2.303553, 0.1074291, 0.9944956, 1, 0, 0.07843138, 1,
2.349597, 0.9777142, 2.574339, 1, 0, 0.07058824, 1,
2.36663, -0.8733996, 2.873667, 1, 0, 0.06666667, 1,
2.373598, -1.647289, 3.431191, 1, 0, 0.05882353, 1,
2.452258, -0.2901935, 0.4371153, 1, 0, 0.05490196, 1,
2.476129, -0.9468206, 3.108871, 1, 0, 0.04705882, 1,
2.496649, -0.2164774, 2.068024, 1, 0, 0.04313726, 1,
2.521942, -1.626351, 3.59042, 1, 0, 0.03529412, 1,
2.554617, -1.606756, 1.921386, 1, 0, 0.03137255, 1,
2.657595, -1.022411, 3.129855, 1, 0, 0.02352941, 1,
2.744727, -2.073853, 3.4355, 1, 0, 0.01960784, 1,
2.989043, 0.6911183, 0.4978356, 1, 0, 0.01176471, 1,
3.333614, 0.2204366, 0.9448496, 1, 0, 0.007843138, 1
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
0.03095341, -4.176157, -7.103968, 0, -0.5, 0.5, 0.5,
0.03095341, -4.176157, -7.103968, 1, -0.5, 0.5, 0.5,
0.03095341, -4.176157, -7.103968, 1, 1.5, 0.5, 0.5,
0.03095341, -4.176157, -7.103968, 0, 1.5, 0.5, 0.5
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
-4.391309, 0.1804988, -7.103968, 0, -0.5, 0.5, 0.5,
-4.391309, 0.1804988, -7.103968, 1, -0.5, 0.5, 0.5,
-4.391309, 0.1804988, -7.103968, 1, 1.5, 0.5, 0.5,
-4.391309, 0.1804988, -7.103968, 0, 1.5, 0.5, 0.5
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
-4.391309, -4.176157, -0.003668547, 0, -0.5, 0.5, 0.5,
-4.391309, -4.176157, -0.003668547, 1, -0.5, 0.5, 0.5,
-4.391309, -4.176157, -0.003668547, 1, 1.5, 0.5, 0.5,
-4.391309, -4.176157, -0.003668547, 0, 1.5, 0.5, 0.5
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
-3, -3.170775, -5.465437,
3, -3.170775, -5.465437,
-3, -3.170775, -5.465437,
-3, -3.338339, -5.738526,
-2, -3.170775, -5.465437,
-2, -3.338339, -5.738526,
-1, -3.170775, -5.465437,
-1, -3.338339, -5.738526,
0, -3.170775, -5.465437,
0, -3.338339, -5.738526,
1, -3.170775, -5.465437,
1, -3.338339, -5.738526,
2, -3.170775, -5.465437,
2, -3.338339, -5.738526,
3, -3.170775, -5.465437,
3, -3.338339, -5.738526
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
-3, -3.673466, -6.284703, 0, -0.5, 0.5, 0.5,
-3, -3.673466, -6.284703, 1, -0.5, 0.5, 0.5,
-3, -3.673466, -6.284703, 1, 1.5, 0.5, 0.5,
-3, -3.673466, -6.284703, 0, 1.5, 0.5, 0.5,
-2, -3.673466, -6.284703, 0, -0.5, 0.5, 0.5,
-2, -3.673466, -6.284703, 1, -0.5, 0.5, 0.5,
-2, -3.673466, -6.284703, 1, 1.5, 0.5, 0.5,
-2, -3.673466, -6.284703, 0, 1.5, 0.5, 0.5,
-1, -3.673466, -6.284703, 0, -0.5, 0.5, 0.5,
-1, -3.673466, -6.284703, 1, -0.5, 0.5, 0.5,
-1, -3.673466, -6.284703, 1, 1.5, 0.5, 0.5,
-1, -3.673466, -6.284703, 0, 1.5, 0.5, 0.5,
0, -3.673466, -6.284703, 0, -0.5, 0.5, 0.5,
0, -3.673466, -6.284703, 1, -0.5, 0.5, 0.5,
0, -3.673466, -6.284703, 1, 1.5, 0.5, 0.5,
0, -3.673466, -6.284703, 0, 1.5, 0.5, 0.5,
1, -3.673466, -6.284703, 0, -0.5, 0.5, 0.5,
1, -3.673466, -6.284703, 1, -0.5, 0.5, 0.5,
1, -3.673466, -6.284703, 1, 1.5, 0.5, 0.5,
1, -3.673466, -6.284703, 0, 1.5, 0.5, 0.5,
2, -3.673466, -6.284703, 0, -0.5, 0.5, 0.5,
2, -3.673466, -6.284703, 1, -0.5, 0.5, 0.5,
2, -3.673466, -6.284703, 1, 1.5, 0.5, 0.5,
2, -3.673466, -6.284703, 0, 1.5, 0.5, 0.5,
3, -3.673466, -6.284703, 0, -0.5, 0.5, 0.5,
3, -3.673466, -6.284703, 1, -0.5, 0.5, 0.5,
3, -3.673466, -6.284703, 1, 1.5, 0.5, 0.5,
3, -3.673466, -6.284703, 0, 1.5, 0.5, 0.5
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
-3.370787, -3, -5.465437,
-3.370787, 3, -5.465437,
-3.370787, -3, -5.465437,
-3.540874, -3, -5.738526,
-3.370787, -2, -5.465437,
-3.540874, -2, -5.738526,
-3.370787, -1, -5.465437,
-3.540874, -1, -5.738526,
-3.370787, 0, -5.465437,
-3.540874, 0, -5.738526,
-3.370787, 1, -5.465437,
-3.540874, 1, -5.738526,
-3.370787, 2, -5.465437,
-3.540874, 2, -5.738526,
-3.370787, 3, -5.465437,
-3.540874, 3, -5.738526
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
-3.881048, -3, -6.284703, 0, -0.5, 0.5, 0.5,
-3.881048, -3, -6.284703, 1, -0.5, 0.5, 0.5,
-3.881048, -3, -6.284703, 1, 1.5, 0.5, 0.5,
-3.881048, -3, -6.284703, 0, 1.5, 0.5, 0.5,
-3.881048, -2, -6.284703, 0, -0.5, 0.5, 0.5,
-3.881048, -2, -6.284703, 1, -0.5, 0.5, 0.5,
-3.881048, -2, -6.284703, 1, 1.5, 0.5, 0.5,
-3.881048, -2, -6.284703, 0, 1.5, 0.5, 0.5,
-3.881048, -1, -6.284703, 0, -0.5, 0.5, 0.5,
-3.881048, -1, -6.284703, 1, -0.5, 0.5, 0.5,
-3.881048, -1, -6.284703, 1, 1.5, 0.5, 0.5,
-3.881048, -1, -6.284703, 0, 1.5, 0.5, 0.5,
-3.881048, 0, -6.284703, 0, -0.5, 0.5, 0.5,
-3.881048, 0, -6.284703, 1, -0.5, 0.5, 0.5,
-3.881048, 0, -6.284703, 1, 1.5, 0.5, 0.5,
-3.881048, 0, -6.284703, 0, 1.5, 0.5, 0.5,
-3.881048, 1, -6.284703, 0, -0.5, 0.5, 0.5,
-3.881048, 1, -6.284703, 1, -0.5, 0.5, 0.5,
-3.881048, 1, -6.284703, 1, 1.5, 0.5, 0.5,
-3.881048, 1, -6.284703, 0, 1.5, 0.5, 0.5,
-3.881048, 2, -6.284703, 0, -0.5, 0.5, 0.5,
-3.881048, 2, -6.284703, 1, -0.5, 0.5, 0.5,
-3.881048, 2, -6.284703, 1, 1.5, 0.5, 0.5,
-3.881048, 2, -6.284703, 0, 1.5, 0.5, 0.5,
-3.881048, 3, -6.284703, 0, -0.5, 0.5, 0.5,
-3.881048, 3, -6.284703, 1, -0.5, 0.5, 0.5,
-3.881048, 3, -6.284703, 1, 1.5, 0.5, 0.5,
-3.881048, 3, -6.284703, 0, 1.5, 0.5, 0.5
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
-3.370787, -3.170775, -4,
-3.370787, -3.170775, 4,
-3.370787, -3.170775, -4,
-3.540874, -3.338339, -4,
-3.370787, -3.170775, -2,
-3.540874, -3.338339, -2,
-3.370787, -3.170775, 0,
-3.540874, -3.338339, 0,
-3.370787, -3.170775, 2,
-3.540874, -3.338339, 2,
-3.370787, -3.170775, 4,
-3.540874, -3.338339, 4
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
-3.881048, -3.673466, -4, 0, -0.5, 0.5, 0.5,
-3.881048, -3.673466, -4, 1, -0.5, 0.5, 0.5,
-3.881048, -3.673466, -4, 1, 1.5, 0.5, 0.5,
-3.881048, -3.673466, -4, 0, 1.5, 0.5, 0.5,
-3.881048, -3.673466, -2, 0, -0.5, 0.5, 0.5,
-3.881048, -3.673466, -2, 1, -0.5, 0.5, 0.5,
-3.881048, -3.673466, -2, 1, 1.5, 0.5, 0.5,
-3.881048, -3.673466, -2, 0, 1.5, 0.5, 0.5,
-3.881048, -3.673466, 0, 0, -0.5, 0.5, 0.5,
-3.881048, -3.673466, 0, 1, -0.5, 0.5, 0.5,
-3.881048, -3.673466, 0, 1, 1.5, 0.5, 0.5,
-3.881048, -3.673466, 0, 0, 1.5, 0.5, 0.5,
-3.881048, -3.673466, 2, 0, -0.5, 0.5, 0.5,
-3.881048, -3.673466, 2, 1, -0.5, 0.5, 0.5,
-3.881048, -3.673466, 2, 1, 1.5, 0.5, 0.5,
-3.881048, -3.673466, 2, 0, 1.5, 0.5, 0.5,
-3.881048, -3.673466, 4, 0, -0.5, 0.5, 0.5,
-3.881048, -3.673466, 4, 1, -0.5, 0.5, 0.5,
-3.881048, -3.673466, 4, 1, 1.5, 0.5, 0.5,
-3.881048, -3.673466, 4, 0, 1.5, 0.5, 0.5
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
-3.370787, -3.170775, -5.465437,
-3.370787, 3.531773, -5.465437,
-3.370787, -3.170775, 5.4581,
-3.370787, 3.531773, 5.4581,
-3.370787, -3.170775, -5.465437,
-3.370787, -3.170775, 5.4581,
-3.370787, 3.531773, -5.465437,
-3.370787, 3.531773, 5.4581,
-3.370787, -3.170775, -5.465437,
3.432693, -3.170775, -5.465437,
-3.370787, -3.170775, 5.4581,
3.432693, -3.170775, 5.4581,
-3.370787, 3.531773, -5.465437,
3.432693, 3.531773, -5.465437,
-3.370787, 3.531773, 5.4581,
3.432693, 3.531773, 5.4581,
3.432693, -3.170775, -5.465437,
3.432693, 3.531773, -5.465437,
3.432693, -3.170775, 5.4581,
3.432693, 3.531773, 5.4581,
3.432693, -3.170775, -5.465437,
3.432693, -3.170775, 5.4581,
3.432693, 3.531773, -5.465437,
3.432693, 3.531773, 5.4581
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
var radius = 7.747968;
var distance = 34.47158;
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
mvMatrix.translate( -0.03095341, -0.1804988, 0.003668547 );
mvMatrix.scale( 1.231319, 1.249861, 0.7668993 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.47158);
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

