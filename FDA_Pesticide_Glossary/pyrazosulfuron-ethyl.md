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
-2.778634, -0.4710084, -1.122022, 1, 0, 0, 1,
-2.755016, -0.08997393, -1.100229, 1, 0.007843138, 0, 1,
-2.663329, -0.6549464, -1.909799, 1, 0.01176471, 0, 1,
-2.599425, -0.2019058, -2.068405, 1, 0.01960784, 0, 1,
-2.587041, -0.4212574, -2.369724, 1, 0.02352941, 0, 1,
-2.567351, -1.190703, -2.106775, 1, 0.03137255, 0, 1,
-2.565584, 1.437892, -0.471515, 1, 0.03529412, 0, 1,
-2.502434, -0.3764188, -2.893289, 1, 0.04313726, 0, 1,
-2.328218, 1.089743, -0.8318047, 1, 0.04705882, 0, 1,
-2.323277, 1.824611, -0.9950266, 1, 0.05490196, 0, 1,
-2.272768, 1.390738, -0.4848102, 1, 0.05882353, 0, 1,
-2.257799, 1.272915, 0.1280349, 1, 0.06666667, 0, 1,
-2.240583, 0.9462478, -1.09588, 1, 0.07058824, 0, 1,
-2.226883, -0.6175861, -0.8047276, 1, 0.07843138, 0, 1,
-2.224151, -0.3973831, -3.40852, 1, 0.08235294, 0, 1,
-2.223575, -1.220753, -2.089031, 1, 0.09019608, 0, 1,
-2.200154, 0.05927129, -1.124125, 1, 0.09411765, 0, 1,
-2.137531, 0.2765091, -0.6836834, 1, 0.1019608, 0, 1,
-2.09193, -1.702544, -2.876525, 1, 0.1098039, 0, 1,
-2.059702, 2.662545, -1.073846, 1, 0.1137255, 0, 1,
-2.03799, -1.823136, -2.042559, 1, 0.1215686, 0, 1,
-2.001621, -1.283495, -3.937605, 1, 0.1254902, 0, 1,
-1.938667, 0.8861065, -2.148059, 1, 0.1333333, 0, 1,
-1.93734, 1.001281, -1.340779, 1, 0.1372549, 0, 1,
-1.935104, -1.754264, -2.899945, 1, 0.145098, 0, 1,
-1.903607, -0.518313, -2.3611, 1, 0.1490196, 0, 1,
-1.88475, -0.634813, -2.569327, 1, 0.1568628, 0, 1,
-1.853138, 1.89675, -1.56805, 1, 0.1607843, 0, 1,
-1.82763, -1.016583, -1.905964, 1, 0.1686275, 0, 1,
-1.800734, 0.08219187, -2.707491, 1, 0.172549, 0, 1,
-1.797709, -0.7496674, -2.151457, 1, 0.1803922, 0, 1,
-1.785945, -2.805816, -1.980055, 1, 0.1843137, 0, 1,
-1.770425, -1.542912, -2.9519, 1, 0.1921569, 0, 1,
-1.737825, -0.49612, -1.137365, 1, 0.1960784, 0, 1,
-1.728781, -1.39301, -4.25773, 1, 0.2039216, 0, 1,
-1.713889, -0.3815077, -1.526137, 1, 0.2117647, 0, 1,
-1.692675, 0.03760692, -2.258206, 1, 0.2156863, 0, 1,
-1.67981, -0.8950461, -1.52692, 1, 0.2235294, 0, 1,
-1.654792, -0.8418391, -0.7976372, 1, 0.227451, 0, 1,
-1.651172, 3.292946, -0.1087568, 1, 0.2352941, 0, 1,
-1.63144, -0.2974224, -1.963169, 1, 0.2392157, 0, 1,
-1.62396, -0.2481934, -1.318813, 1, 0.2470588, 0, 1,
-1.620301, 0.1844968, -1.622558, 1, 0.2509804, 0, 1,
-1.617737, 0.9856064, -1.971453, 1, 0.2588235, 0, 1,
-1.615756, -0.6696113, -2.563444, 1, 0.2627451, 0, 1,
-1.609564, -1.255306, -0.981945, 1, 0.2705882, 0, 1,
-1.583692, -1.193439, -2.95926, 1, 0.2745098, 0, 1,
-1.549252, 0.6754501, 1.08218, 1, 0.282353, 0, 1,
-1.548759, 0.774305, 2.457694, 1, 0.2862745, 0, 1,
-1.538152, -0.2323322, -0.7196862, 1, 0.2941177, 0, 1,
-1.535509, 0.03814457, -0.5218475, 1, 0.3019608, 0, 1,
-1.528441, 0.07631361, -2.076072, 1, 0.3058824, 0, 1,
-1.518126, -1.197677, -2.16008, 1, 0.3137255, 0, 1,
-1.508538, -0.4993961, -2.198458, 1, 0.3176471, 0, 1,
-1.505751, -2.163038, -2.118602, 1, 0.3254902, 0, 1,
-1.505182, -1.126935, -2.502793, 1, 0.3294118, 0, 1,
-1.482474, 1.486875, -1.120826, 1, 0.3372549, 0, 1,
-1.473825, -1.670371, -2.906611, 1, 0.3411765, 0, 1,
-1.470206, 0.2883133, -1.859625, 1, 0.3490196, 0, 1,
-1.469795, -0.1090815, -2.435286, 1, 0.3529412, 0, 1,
-1.466068, -0.9975035, -2.506565, 1, 0.3607843, 0, 1,
-1.462196, -0.1991602, -1.907446, 1, 0.3647059, 0, 1,
-1.454867, -0.02250542, -1.808049, 1, 0.372549, 0, 1,
-1.453557, 0.7154263, -1.738443, 1, 0.3764706, 0, 1,
-1.452341, 0.2350382, -0.6836663, 1, 0.3843137, 0, 1,
-1.450741, 1.999613, -1.271333, 1, 0.3882353, 0, 1,
-1.450112, 0.2467503, -1.537743, 1, 0.3960784, 0, 1,
-1.442431, 0.5529838, -1.625887, 1, 0.4039216, 0, 1,
-1.44171, -0.02166083, -2.526695, 1, 0.4078431, 0, 1,
-1.436594, 0.1596196, -2.200332, 1, 0.4156863, 0, 1,
-1.417083, -1.190163, -1.833594, 1, 0.4196078, 0, 1,
-1.413715, 0.3939177, 0.1719199, 1, 0.427451, 0, 1,
-1.413313, 1.123102, -0.02882255, 1, 0.4313726, 0, 1,
-1.40937, -1.256105, -2.579233, 1, 0.4392157, 0, 1,
-1.39319, -0.9991286, -2.114349, 1, 0.4431373, 0, 1,
-1.383643, 0.5524852, -1.85491, 1, 0.4509804, 0, 1,
-1.379327, 1.31679, -1.834634, 1, 0.454902, 0, 1,
-1.378793, 1.7391, 0.8238744, 1, 0.4627451, 0, 1,
-1.360979, -0.1326923, -1.870553, 1, 0.4666667, 0, 1,
-1.355133, -0.4240942, -1.839734, 1, 0.4745098, 0, 1,
-1.343206, 1.195798, -0.4393118, 1, 0.4784314, 0, 1,
-1.32875, 1.315537, -0.5664854, 1, 0.4862745, 0, 1,
-1.327947, -0.02765609, -1.995543, 1, 0.4901961, 0, 1,
-1.327861, -0.8959317, -4.519215, 1, 0.4980392, 0, 1,
-1.326347, -1.063288, -1.545911, 1, 0.5058824, 0, 1,
-1.325086, -0.1645864, -2.886604, 1, 0.509804, 0, 1,
-1.324738, 0.4792783, -2.234255, 1, 0.5176471, 0, 1,
-1.312619, -1.577446, -3.481004, 1, 0.5215687, 0, 1,
-1.312443, -0.09763003, -0.2617691, 1, 0.5294118, 0, 1,
-1.308974, 1.972898, -0.7084854, 1, 0.5333334, 0, 1,
-1.302562, -0.55921, -2.456705, 1, 0.5411765, 0, 1,
-1.297254, -1.543306, -4.706817, 1, 0.5450981, 0, 1,
-1.29638, 0.2267871, 1.229728, 1, 0.5529412, 0, 1,
-1.294131, -1.67773, -3.082955, 1, 0.5568628, 0, 1,
-1.292465, -1.533875, -1.982012, 1, 0.5647059, 0, 1,
-1.27204, -0.02504729, -2.268152, 1, 0.5686275, 0, 1,
-1.271723, 0.6588978, -1.803676, 1, 0.5764706, 0, 1,
-1.268695, 1.680755, -1.209458, 1, 0.5803922, 0, 1,
-1.268392, -1.040609, -1.682892, 1, 0.5882353, 0, 1,
-1.262625, -0.421363, -4.505471, 1, 0.5921569, 0, 1,
-1.261663, -1.135812, -0.6990473, 1, 0.6, 0, 1,
-1.249814, 1.813887, -2.451749, 1, 0.6078432, 0, 1,
-1.246752, -0.4003949, -1.885034, 1, 0.6117647, 0, 1,
-1.241614, 0.3040926, -2.873639, 1, 0.6196079, 0, 1,
-1.239077, -0.7890213, -3.86854, 1, 0.6235294, 0, 1,
-1.234958, 1.05692, 0.002701299, 1, 0.6313726, 0, 1,
-1.233741, -1.082936, -0.6916934, 1, 0.6352941, 0, 1,
-1.223271, -0.3658585, -1.755406, 1, 0.6431373, 0, 1,
-1.21923, -2.103939, -2.614543, 1, 0.6470588, 0, 1,
-1.2103, -0.3170825, -3.054414, 1, 0.654902, 0, 1,
-1.210046, -0.442872, -3.416907, 1, 0.6588235, 0, 1,
-1.206738, -1.144795, -3.04144, 1, 0.6666667, 0, 1,
-1.204214, 1.071432, 0.003090139, 1, 0.6705883, 0, 1,
-1.203655, -1.486082, -2.084655, 1, 0.6784314, 0, 1,
-1.197602, 1.397601, -2.169082, 1, 0.682353, 0, 1,
-1.196762, 0.31432, -0.2725926, 1, 0.6901961, 0, 1,
-1.187022, -0.1652602, -1.283149, 1, 0.6941177, 0, 1,
-1.184092, -0.5483697, -3.369077, 1, 0.7019608, 0, 1,
-1.181482, -0.3103432, -0.2385977, 1, 0.7098039, 0, 1,
-1.17604, -0.4234153, -2.647448, 1, 0.7137255, 0, 1,
-1.163183, -0.02666724, -0.9924857, 1, 0.7215686, 0, 1,
-1.155476, 0.7509438, -1.278269, 1, 0.7254902, 0, 1,
-1.153127, -0.2263181, -2.00457, 1, 0.7333333, 0, 1,
-1.147194, 0.1940032, -0.602177, 1, 0.7372549, 0, 1,
-1.134387, 1.281415, -1.719993, 1, 0.7450981, 0, 1,
-1.107308, -0.4614732, -0.5090479, 1, 0.7490196, 0, 1,
-1.101634, 0.5600693, -0.9301265, 1, 0.7568628, 0, 1,
-1.099646, 0.9963793, -0.3802458, 1, 0.7607843, 0, 1,
-1.098117, 0.1372693, -1.30176, 1, 0.7686275, 0, 1,
-1.093747, 0.09108711, -2.896546, 1, 0.772549, 0, 1,
-1.086723, -0.4457901, -2.747015, 1, 0.7803922, 0, 1,
-1.07349, -0.3467979, -1.847563, 1, 0.7843137, 0, 1,
-1.067929, 0.1990166, -0.8198456, 1, 0.7921569, 0, 1,
-1.054094, 0.4935948, -0.4528108, 1, 0.7960784, 0, 1,
-1.050965, 0.0525586, -2.671279, 1, 0.8039216, 0, 1,
-1.039851, 0.4289245, -0.9791247, 1, 0.8117647, 0, 1,
-1.034225, 0.6896861, 0.04457642, 1, 0.8156863, 0, 1,
-1.029134, -0.5791691, -2.164707, 1, 0.8235294, 0, 1,
-1.025304, 1.086247, -0.6649757, 1, 0.827451, 0, 1,
-1.023525, 1.33811, -0.6800362, 1, 0.8352941, 0, 1,
-1.012902, -0.6703844, -2.543459, 1, 0.8392157, 0, 1,
-1.011068, 0.1970163, -1.752601, 1, 0.8470588, 0, 1,
-1.007494, 0.5692424, -1.042796, 1, 0.8509804, 0, 1,
-1.005788, -0.8187601, -1.51887, 1, 0.8588235, 0, 1,
-1.003037, -0.8176599, -1.798108, 1, 0.8627451, 0, 1,
-0.9991813, 0.8000945, -0.9629438, 1, 0.8705882, 0, 1,
-0.9989144, -1.845139, -3.313672, 1, 0.8745098, 0, 1,
-0.9953024, 0.9255508, -0.9454207, 1, 0.8823529, 0, 1,
-0.9887481, -1.278855, -3.646943, 1, 0.8862745, 0, 1,
-0.9850338, 0.1135352, -2.57992, 1, 0.8941177, 0, 1,
-0.9714206, 0.1078945, -2.258117, 1, 0.8980392, 0, 1,
-0.9684411, -0.3429314, -0.6881923, 1, 0.9058824, 0, 1,
-0.9681431, 1.277609, -1.330523, 1, 0.9137255, 0, 1,
-0.9679308, 0.9762846, -0.9388599, 1, 0.9176471, 0, 1,
-0.9650771, -1.172328, -1.850859, 1, 0.9254902, 0, 1,
-0.9640102, -0.4283272, -1.559818, 1, 0.9294118, 0, 1,
-0.9638423, 0.8870251, 0.8953767, 1, 0.9372549, 0, 1,
-0.9630559, -0.9432409, -2.013401, 1, 0.9411765, 0, 1,
-0.9614666, -0.2798284, -1.546161, 1, 0.9490196, 0, 1,
-0.957123, -0.5827969, -2.242422, 1, 0.9529412, 0, 1,
-0.9552314, 1.406708, -2.240427, 1, 0.9607843, 0, 1,
-0.9537776, -0.111656, -2.101241, 1, 0.9647059, 0, 1,
-0.9524437, 0.5778309, -1.753338, 1, 0.972549, 0, 1,
-0.9516862, -0.8682135, -1.738846, 1, 0.9764706, 0, 1,
-0.9492207, -1.160574, -2.649726, 1, 0.9843137, 0, 1,
-0.9464481, -0.03069638, -2.584181, 1, 0.9882353, 0, 1,
-0.9439526, -0.2857194, -2.169363, 1, 0.9960784, 0, 1,
-0.9407471, 0.2200036, -1.043737, 0.9960784, 1, 0, 1,
-0.9406919, -1.612953, -1.659695, 0.9921569, 1, 0, 1,
-0.9367698, -0.9877658, -1.988809, 0.9843137, 1, 0, 1,
-0.9321377, -1.766061, -3.391361, 0.9803922, 1, 0, 1,
-0.9223488, -0.22797, -2.669354, 0.972549, 1, 0, 1,
-0.918812, 0.7646412, -2.193862, 0.9686275, 1, 0, 1,
-0.9157995, -0.5138189, -2.899203, 0.9607843, 1, 0, 1,
-0.914661, -0.5861388, -2.621123, 0.9568627, 1, 0, 1,
-0.9112938, 0.438667, -2.27952, 0.9490196, 1, 0, 1,
-0.8965911, 1.069526, -0.2324108, 0.945098, 1, 0, 1,
-0.8958871, -0.8742178, -3.471897, 0.9372549, 1, 0, 1,
-0.893574, -0.6242049, -0.958834, 0.9333333, 1, 0, 1,
-0.8919347, -0.7632567, -3.222986, 0.9254902, 1, 0, 1,
-0.8916691, -1.511718, -2.648166, 0.9215686, 1, 0, 1,
-0.8859478, -0.4233901, -0.5517781, 0.9137255, 1, 0, 1,
-0.8807599, -0.7643989, -1.672462, 0.9098039, 1, 0, 1,
-0.8805476, 0.7467765, -0.9899905, 0.9019608, 1, 0, 1,
-0.8784457, 0.6467651, -1.511689, 0.8941177, 1, 0, 1,
-0.8758837, -1.858246, -1.47722, 0.8901961, 1, 0, 1,
-0.8730991, 0.3452902, -1.448672, 0.8823529, 1, 0, 1,
-0.8701831, 1.280873, -0.2436298, 0.8784314, 1, 0, 1,
-0.8624544, 1.362957, -1.206973, 0.8705882, 1, 0, 1,
-0.8599076, -0.6271747, -1.445517, 0.8666667, 1, 0, 1,
-0.8553304, -0.07498468, -3.640218, 0.8588235, 1, 0, 1,
-0.8534385, -1.899943, -3.344599, 0.854902, 1, 0, 1,
-0.8484482, 0.626803, -1.745058, 0.8470588, 1, 0, 1,
-0.848218, 0.07264179, -0.7582057, 0.8431373, 1, 0, 1,
-0.8454419, 1.123531, -0.1695686, 0.8352941, 1, 0, 1,
-0.8451098, 1.670403, -1.902649, 0.8313726, 1, 0, 1,
-0.8449772, 1.254006, -1.087183, 0.8235294, 1, 0, 1,
-0.8440509, 0.5134931, 0.03431719, 0.8196079, 1, 0, 1,
-0.8436201, 0.4120233, -1.783013, 0.8117647, 1, 0, 1,
-0.8352184, 0.5302272, 0.4448793, 0.8078431, 1, 0, 1,
-0.8267984, 0.2496007, -2.162959, 0.8, 1, 0, 1,
-0.8234212, 1.30105, -0.1760861, 0.7921569, 1, 0, 1,
-0.8175091, 0.1697711, -0.7325544, 0.7882353, 1, 0, 1,
-0.8091317, -1.497213, -2.888626, 0.7803922, 1, 0, 1,
-0.8077051, -0.8683724, -0.7557143, 0.7764706, 1, 0, 1,
-0.8036705, 0.8056076, -0.6675457, 0.7686275, 1, 0, 1,
-0.8021835, -0.5317499, -3.644115, 0.7647059, 1, 0, 1,
-0.7927099, 0.8034162, -1.395014, 0.7568628, 1, 0, 1,
-0.7879854, 0.5697635, -0.3751965, 0.7529412, 1, 0, 1,
-0.7867651, -0.2331395, -4.37607, 0.7450981, 1, 0, 1,
-0.7826546, 2.044001, -1.131192, 0.7411765, 1, 0, 1,
-0.7820899, -0.8707225, -2.717368, 0.7333333, 1, 0, 1,
-0.7820274, -1.666706, -2.410523, 0.7294118, 1, 0, 1,
-0.7742262, -0.5323052, -2.960721, 0.7215686, 1, 0, 1,
-0.7637406, -0.4493504, -2.415931, 0.7176471, 1, 0, 1,
-0.7633446, 0.4108942, -0.7173305, 0.7098039, 1, 0, 1,
-0.7628655, -1.902145, -4.603918, 0.7058824, 1, 0, 1,
-0.7628245, 1.134703, -0.4016895, 0.6980392, 1, 0, 1,
-0.7627193, 0.7882429, -1.745457, 0.6901961, 1, 0, 1,
-0.7572007, 2.470354, -1.880096, 0.6862745, 1, 0, 1,
-0.7537434, -1.228049, -1.682697, 0.6784314, 1, 0, 1,
-0.7529286, -1.684915, -1.972904, 0.6745098, 1, 0, 1,
-0.750466, -0.429538, -0.9589533, 0.6666667, 1, 0, 1,
-0.7448105, -0.8541925, -2.967108, 0.6627451, 1, 0, 1,
-0.7431141, -0.1028346, -2.714427, 0.654902, 1, 0, 1,
-0.7428541, 2.356179, -0.3741029, 0.6509804, 1, 0, 1,
-0.7387045, -1.29134, -2.398926, 0.6431373, 1, 0, 1,
-0.7329109, 0.1755937, -2.357648, 0.6392157, 1, 0, 1,
-0.725968, -0.3490297, 0.2854818, 0.6313726, 1, 0, 1,
-0.7256473, -1.308911, -2.462635, 0.627451, 1, 0, 1,
-0.7252552, 0.7771199, -1.907825, 0.6196079, 1, 0, 1,
-0.7252064, -1.438428, -1.673258, 0.6156863, 1, 0, 1,
-0.7215251, -0.6735916, -2.152625, 0.6078432, 1, 0, 1,
-0.7197377, -0.2038474, -1.739132, 0.6039216, 1, 0, 1,
-0.7179589, 0.1462637, -1.08628, 0.5960785, 1, 0, 1,
-0.7168129, 0.3659689, -2.061841, 0.5882353, 1, 0, 1,
-0.7167147, 0.7075077, -1.245117, 0.5843138, 1, 0, 1,
-0.7068794, -0.004256446, -1.559469, 0.5764706, 1, 0, 1,
-0.7060288, 0.2572364, -2.11642, 0.572549, 1, 0, 1,
-0.7022009, -1.086341, -1.238312, 0.5647059, 1, 0, 1,
-0.700703, -0.2822897, -1.226057, 0.5607843, 1, 0, 1,
-0.7004148, -0.8353249, -1.600559, 0.5529412, 1, 0, 1,
-0.6973559, -0.1152749, -2.296565, 0.5490196, 1, 0, 1,
-0.6906778, -0.2392655, -0.5806517, 0.5411765, 1, 0, 1,
-0.6841776, -0.5802754, -1.828742, 0.5372549, 1, 0, 1,
-0.6830286, 1.112304, 0.4205483, 0.5294118, 1, 0, 1,
-0.6675506, 1.436105, 0.6206825, 0.5254902, 1, 0, 1,
-0.6603731, -0.5494181, -2.110417, 0.5176471, 1, 0, 1,
-0.655718, 0.6774964, -1.590524, 0.5137255, 1, 0, 1,
-0.6531184, 0.8892726, -0.4259665, 0.5058824, 1, 0, 1,
-0.6525818, -1.788832, -1.453579, 0.5019608, 1, 0, 1,
-0.649359, -1.257622, -2.504678, 0.4941176, 1, 0, 1,
-0.6444448, 0.9389589, 0.8072439, 0.4862745, 1, 0, 1,
-0.6393744, 0.6915515, -1.029627, 0.4823529, 1, 0, 1,
-0.6377206, 1.287915, -1.667026, 0.4745098, 1, 0, 1,
-0.6376597, 0.2890331, -1.680084, 0.4705882, 1, 0, 1,
-0.6353204, -1.527036, -3.0387, 0.4627451, 1, 0, 1,
-0.6340675, 0.544113, 0.3365399, 0.4588235, 1, 0, 1,
-0.6262035, 0.8479747, -2.119322, 0.4509804, 1, 0, 1,
-0.6225622, 0.4177943, -0.7544667, 0.4470588, 1, 0, 1,
-0.6222247, -0.61526, -2.947974, 0.4392157, 1, 0, 1,
-0.6217136, 0.5716087, -2.132998, 0.4352941, 1, 0, 1,
-0.6176936, 0.9365826, -0.9349983, 0.427451, 1, 0, 1,
-0.617296, -0.0358624, -2.968322, 0.4235294, 1, 0, 1,
-0.6167928, 0.05620156, -0.5450539, 0.4156863, 1, 0, 1,
-0.6136881, -1.156017, -3.135921, 0.4117647, 1, 0, 1,
-0.613591, 0.5655865, -1.53667, 0.4039216, 1, 0, 1,
-0.6114016, -0.7321037, -2.803273, 0.3960784, 1, 0, 1,
-0.6101829, -0.3713605, -1.387779, 0.3921569, 1, 0, 1,
-0.6074696, -1.966404, -3.141992, 0.3843137, 1, 0, 1,
-0.6049581, -0.3872545, -2.779047, 0.3803922, 1, 0, 1,
-0.6017542, 0.3363442, -1.628554, 0.372549, 1, 0, 1,
-0.5991979, -0.7764705, -2.790045, 0.3686275, 1, 0, 1,
-0.5965622, -0.1457701, 0.1182994, 0.3607843, 1, 0, 1,
-0.5958388, -0.4778398, -3.286312, 0.3568628, 1, 0, 1,
-0.5953199, 0.04860421, -0.006441399, 0.3490196, 1, 0, 1,
-0.5946534, 0.607706, -0.5245582, 0.345098, 1, 0, 1,
-0.5888498, 0.1431093, -0.08260273, 0.3372549, 1, 0, 1,
-0.5862689, 1.210479, -1.012001, 0.3333333, 1, 0, 1,
-0.5747617, 1.114855, -1.183417, 0.3254902, 1, 0, 1,
-0.5739778, -1.039835, -2.804677, 0.3215686, 1, 0, 1,
-0.5720115, 2.045088, -0.06186689, 0.3137255, 1, 0, 1,
-0.5716971, 0.411521, 0.4009033, 0.3098039, 1, 0, 1,
-0.5710208, 0.1109255, -2.084455, 0.3019608, 1, 0, 1,
-0.5692323, -0.5983876, -3.998898, 0.2941177, 1, 0, 1,
-0.5637079, -0.564747, -3.167066, 0.2901961, 1, 0, 1,
-0.5558591, 0.2905525, -2.544405, 0.282353, 1, 0, 1,
-0.5534898, -0.3004687, -2.069584, 0.2784314, 1, 0, 1,
-0.5498011, -1.009474, -3.913292, 0.2705882, 1, 0, 1,
-0.5496719, 0.5570828, -1.526333, 0.2666667, 1, 0, 1,
-0.5485641, 1.630804, 0.1021372, 0.2588235, 1, 0, 1,
-0.5475719, -0.2013542, -1.598246, 0.254902, 1, 0, 1,
-0.5460616, -0.3308991, -1.818498, 0.2470588, 1, 0, 1,
-0.5448665, 1.07267, -1.8041, 0.2431373, 1, 0, 1,
-0.5405539, 1.12682, -2.234211, 0.2352941, 1, 0, 1,
-0.5377221, -0.96267, -3.11991, 0.2313726, 1, 0, 1,
-0.5370516, 0.6257312, -0.8103664, 0.2235294, 1, 0, 1,
-0.5333457, -0.05361143, -1.077623, 0.2196078, 1, 0, 1,
-0.5314804, 0.0687098, -0.8469376, 0.2117647, 1, 0, 1,
-0.5294229, -0.8469028, -1.869942, 0.2078431, 1, 0, 1,
-0.5285138, 0.2423788, -1.389482, 0.2, 1, 0, 1,
-0.5264623, -0.8742712, -4.556051, 0.1921569, 1, 0, 1,
-0.5233323, -2.566499, -4.019502, 0.1882353, 1, 0, 1,
-0.5206746, 1.322517, -0.1603892, 0.1803922, 1, 0, 1,
-0.5200031, 0.6351735, -0.009036537, 0.1764706, 1, 0, 1,
-0.5185417, -0.3663424, -0.6402096, 0.1686275, 1, 0, 1,
-0.5177663, -1.736084, -3.604905, 0.1647059, 1, 0, 1,
-0.5169259, 2.685196, -1.061479, 0.1568628, 1, 0, 1,
-0.5148943, 0.608771, -0.1851667, 0.1529412, 1, 0, 1,
-0.5045279, -0.7340087, -1.920579, 0.145098, 1, 0, 1,
-0.5042099, -0.7782056, -1.17929, 0.1411765, 1, 0, 1,
-0.5038555, -0.6207427, -2.332017, 0.1333333, 1, 0, 1,
-0.5013294, 0.6253006, 0.4451723, 0.1294118, 1, 0, 1,
-0.4990534, -1.454183, -2.196941, 0.1215686, 1, 0, 1,
-0.4978759, 0.3888768, 0.5953853, 0.1176471, 1, 0, 1,
-0.4973511, 2.131896, 0.27686, 0.1098039, 1, 0, 1,
-0.4947342, -1.173478, -3.415679, 0.1058824, 1, 0, 1,
-0.4944261, -0.1872838, -1.379436, 0.09803922, 1, 0, 1,
-0.4938402, 0.1486918, -0.8782247, 0.09019608, 1, 0, 1,
-0.4876974, -0.6697124, -2.046896, 0.08627451, 1, 0, 1,
-0.4833021, 0.1231396, -1.158658, 0.07843138, 1, 0, 1,
-0.4788476, 0.3375238, -2.53261, 0.07450981, 1, 0, 1,
-0.4777029, -0.7201381, -3.258197, 0.06666667, 1, 0, 1,
-0.4770346, -0.003407777, -0.9333344, 0.0627451, 1, 0, 1,
-0.4757385, 0.5871218, -0.6380342, 0.05490196, 1, 0, 1,
-0.4701338, -0.3525167, -1.850286, 0.05098039, 1, 0, 1,
-0.4695522, 1.073401, -1.248286, 0.04313726, 1, 0, 1,
-0.4650622, 0.07057541, -0.05926041, 0.03921569, 1, 0, 1,
-0.4628819, 1.444288, 0.8208003, 0.03137255, 1, 0, 1,
-0.4615944, -0.313782, -2.737875, 0.02745098, 1, 0, 1,
-0.4576777, -1.15603, -3.123597, 0.01960784, 1, 0, 1,
-0.4533021, -1.950853, -3.1264, 0.01568628, 1, 0, 1,
-0.4490972, -0.3138262, -0.8639252, 0.007843138, 1, 0, 1,
-0.4473711, -0.3329258, -2.314659, 0.003921569, 1, 0, 1,
-0.4462791, 0.6478396, -0.150279, 0, 1, 0.003921569, 1,
-0.4427932, -0.1206242, -1.507626, 0, 1, 0.01176471, 1,
-0.4381277, -2.111139, -2.410576, 0, 1, 0.01568628, 1,
-0.4380655, 1.046212, -2.564362, 0, 1, 0.02352941, 1,
-0.4375203, -1.772053, -3.771141, 0, 1, 0.02745098, 1,
-0.4286722, 0.5995297, 1.562348, 0, 1, 0.03529412, 1,
-0.4269707, 1.603763, 1.737674, 0, 1, 0.03921569, 1,
-0.4262021, 0.1468155, -1.455692, 0, 1, 0.04705882, 1,
-0.4206227, 0.3285558, 0.06388988, 0, 1, 0.05098039, 1,
-0.4189863, 0.9660559, 0.421129, 0, 1, 0.05882353, 1,
-0.4178489, -0.2181906, -0.9519637, 0, 1, 0.0627451, 1,
-0.4168894, -0.8169852, -2.398961, 0, 1, 0.07058824, 1,
-0.416226, 1.738366, 0.9303721, 0, 1, 0.07450981, 1,
-0.415922, 0.9603741, -0.3902348, 0, 1, 0.08235294, 1,
-0.4129581, -0.141691, -2.080909, 0, 1, 0.08627451, 1,
-0.4098007, 0.423019, -0.3883176, 0, 1, 0.09411765, 1,
-0.4092712, 1.551017, -0.6560442, 0, 1, 0.1019608, 1,
-0.4040203, -0.03645059, -0.779868, 0, 1, 0.1058824, 1,
-0.4029995, -1.935236, -1.511382, 0, 1, 0.1137255, 1,
-0.4022523, 0.3866453, -2.763086, 0, 1, 0.1176471, 1,
-0.3987982, -0.2516718, -1.163485, 0, 1, 0.1254902, 1,
-0.3970311, -0.1451358, -2.775392, 0, 1, 0.1294118, 1,
-0.3926087, 0.0586019, -1.246328, 0, 1, 0.1372549, 1,
-0.3900574, 0.01567818, -1.126931, 0, 1, 0.1411765, 1,
-0.3880194, -0.01808305, -0.7801597, 0, 1, 0.1490196, 1,
-0.3879069, -1.043289, -2.914599, 0, 1, 0.1529412, 1,
-0.3792623, -0.8727964, -2.641703, 0, 1, 0.1607843, 1,
-0.3750462, -1.404827, -0.963415, 0, 1, 0.1647059, 1,
-0.3744507, 1.50554, 0.6914988, 0, 1, 0.172549, 1,
-0.3723248, -1.2173, -2.632222, 0, 1, 0.1764706, 1,
-0.3702758, -0.5771558, -1.38548, 0, 1, 0.1843137, 1,
-0.370249, 0.8922576, 1.11499, 0, 1, 0.1882353, 1,
-0.3644527, -2.408312, -3.170142, 0, 1, 0.1960784, 1,
-0.3628171, -0.5671139, -2.866049, 0, 1, 0.2039216, 1,
-0.362645, -0.710998, -3.62673, 0, 1, 0.2078431, 1,
-0.3623581, -0.05056066, -2.019814, 0, 1, 0.2156863, 1,
-0.3615071, -0.3352344, -3.516945, 0, 1, 0.2196078, 1,
-0.3600705, 1.480745, 0.1711509, 0, 1, 0.227451, 1,
-0.3560353, -0.5333045, -3.270918, 0, 1, 0.2313726, 1,
-0.3538826, -0.1613089, -0.6588897, 0, 1, 0.2392157, 1,
-0.3535935, -0.06261013, -2.936613, 0, 1, 0.2431373, 1,
-0.3520181, -0.584219, -2.311376, 0, 1, 0.2509804, 1,
-0.3513358, 1.44711, 0.5211189, 0, 1, 0.254902, 1,
-0.3452138, -1.358718, -3.900719, 0, 1, 0.2627451, 1,
-0.3441803, -0.1623417, -1.053945, 0, 1, 0.2666667, 1,
-0.3433585, 0.6766223, -0.9710397, 0, 1, 0.2745098, 1,
-0.3428752, 0.1154035, -0.243375, 0, 1, 0.2784314, 1,
-0.3416073, -0.8581308, -2.670289, 0, 1, 0.2862745, 1,
-0.3413473, 0.9375509, 0.31639, 0, 1, 0.2901961, 1,
-0.3408711, 0.271693, 0.2912597, 0, 1, 0.2980392, 1,
-0.339236, -0.9315033, -3.177907, 0, 1, 0.3058824, 1,
-0.3343117, 0.4214782, -0.3825212, 0, 1, 0.3098039, 1,
-0.3261348, 2.255842, -2.33378, 0, 1, 0.3176471, 1,
-0.3254741, -0.2730789, -2.200038, 0, 1, 0.3215686, 1,
-0.3201705, 0.08086186, -1.186419, 0, 1, 0.3294118, 1,
-0.3199393, -1.990762, -3.932743, 0, 1, 0.3333333, 1,
-0.3157537, 0.8234032, -1.449474, 0, 1, 0.3411765, 1,
-0.3114822, 1.989453, -0.2611032, 0, 1, 0.345098, 1,
-0.3092242, 0.7798169, -0.3357162, 0, 1, 0.3529412, 1,
-0.3084793, -0.3999088, -1.895811, 0, 1, 0.3568628, 1,
-0.3030645, -0.7337073, -3.947097, 0, 1, 0.3647059, 1,
-0.3011879, 1.55553, -2.552818, 0, 1, 0.3686275, 1,
-0.3008746, 0.7860125, -0.5061263, 0, 1, 0.3764706, 1,
-0.2951589, 0.7800093, -0.1100836, 0, 1, 0.3803922, 1,
-0.289259, -0.5356872, -2.717063, 0, 1, 0.3882353, 1,
-0.287807, -0.3763081, -1.793908, 0, 1, 0.3921569, 1,
-0.2861877, -0.4277579, -2.238184, 0, 1, 0.4, 1,
-0.2860477, -0.4570647, -2.740118, 0, 1, 0.4078431, 1,
-0.27914, -0.1959951, -1.842233, 0, 1, 0.4117647, 1,
-0.2783458, -0.01494955, -1.111181, 0, 1, 0.4196078, 1,
-0.2721409, 0.5025272, 1.680536, 0, 1, 0.4235294, 1,
-0.2717717, -1.784586, -3.814545, 0, 1, 0.4313726, 1,
-0.2713541, -0.3882286, -2.989473, 0, 1, 0.4352941, 1,
-0.2661462, -0.399159, -2.674316, 0, 1, 0.4431373, 1,
-0.258994, -1.045694, -2.098049, 0, 1, 0.4470588, 1,
-0.2585002, 0.3366081, -0.0372804, 0, 1, 0.454902, 1,
-0.2574908, -1.687826, -3.19521, 0, 1, 0.4588235, 1,
-0.2543962, 0.2428109, 0.4809524, 0, 1, 0.4666667, 1,
-0.2526992, 1.156815, -1.077769, 0, 1, 0.4705882, 1,
-0.2485757, -0.6591749, -0.9333534, 0, 1, 0.4784314, 1,
-0.2460118, -2.006419, -3.497364, 0, 1, 0.4823529, 1,
-0.2343207, -1.259059, -3.451692, 0, 1, 0.4901961, 1,
-0.2338969, 0.7328133, -1.029667, 0, 1, 0.4941176, 1,
-0.2324836, -2.135761, -3.675443, 0, 1, 0.5019608, 1,
-0.2265813, -0.2230403, -1.675825, 0, 1, 0.509804, 1,
-0.2192944, 0.4505115, -0.5832676, 0, 1, 0.5137255, 1,
-0.2065004, 1.081388, -0.3912422, 0, 1, 0.5215687, 1,
-0.2049556, -1.778846, -2.251303, 0, 1, 0.5254902, 1,
-0.2035245, 0.5213512, -0.532366, 0, 1, 0.5333334, 1,
-0.2030234, -0.4914933, -3.314823, 0, 1, 0.5372549, 1,
-0.1867325, -0.3406205, -2.505461, 0, 1, 0.5450981, 1,
-0.1867012, 0.3590306, 0.2750124, 0, 1, 0.5490196, 1,
-0.1856891, -1.141802, -2.448009, 0, 1, 0.5568628, 1,
-0.1848386, 0.7185513, -1.453226, 0, 1, 0.5607843, 1,
-0.1822613, 0.7261264, -0.2168148, 0, 1, 0.5686275, 1,
-0.1807177, -0.01756087, -3.964468, 0, 1, 0.572549, 1,
-0.1806399, -0.1395573, -1.647165, 0, 1, 0.5803922, 1,
-0.179967, 1.652628, -1.640188, 0, 1, 0.5843138, 1,
-0.1757865, -0.2218014, -1.756806, 0, 1, 0.5921569, 1,
-0.1753713, 0.821972, -1.324298, 0, 1, 0.5960785, 1,
-0.17469, -2.164651, -3.0111, 0, 1, 0.6039216, 1,
-0.1740278, -0.8492334, -1.833915, 0, 1, 0.6117647, 1,
-0.1609853, -0.5250448, -1.63121, 0, 1, 0.6156863, 1,
-0.1533984, 1.068425, -0.4658295, 0, 1, 0.6235294, 1,
-0.1507131, 1.571421, 0.5974061, 0, 1, 0.627451, 1,
-0.1478736, 0.582705, 0.1818319, 0, 1, 0.6352941, 1,
-0.1466628, -0.8198949, -2.595884, 0, 1, 0.6392157, 1,
-0.14535, 1.624722, 0.08535916, 0, 1, 0.6470588, 1,
-0.1431682, 1.135046, -2.227812, 0, 1, 0.6509804, 1,
-0.1430557, 0.2749757, 0.09990793, 0, 1, 0.6588235, 1,
-0.1424556, 0.1653578, -1.439095, 0, 1, 0.6627451, 1,
-0.1381788, -1.35692, -4.140202, 0, 1, 0.6705883, 1,
-0.1379536, -0.2310488, -3.179636, 0, 1, 0.6745098, 1,
-0.1270234, -1.490641, -2.939064, 0, 1, 0.682353, 1,
-0.1209134, 0.6778659, -0.09681546, 0, 1, 0.6862745, 1,
-0.1198467, 0.6027498, -0.34085, 0, 1, 0.6941177, 1,
-0.119516, 0.1473865, -1.55867, 0, 1, 0.7019608, 1,
-0.1185027, 0.6788177, 1.627802, 0, 1, 0.7058824, 1,
-0.1151355, 0.7352694, 1.614548, 0, 1, 0.7137255, 1,
-0.1142431, -0.5172986, -2.882352, 0, 1, 0.7176471, 1,
-0.1110565, -0.4546646, -3.753567, 0, 1, 0.7254902, 1,
-0.1095126, -0.6592487, -4.887628, 0, 1, 0.7294118, 1,
-0.1083597, -0.300884, -2.470814, 0, 1, 0.7372549, 1,
-0.09293083, 0.9046628, 1.660425, 0, 1, 0.7411765, 1,
-0.09031148, 0.4509374, -1.317315, 0, 1, 0.7490196, 1,
-0.08792915, 1.797516, 1.464211, 0, 1, 0.7529412, 1,
-0.08788509, -0.1274656, -1.169589, 0, 1, 0.7607843, 1,
-0.0834931, 1.524563, -2.600348, 0, 1, 0.7647059, 1,
-0.08329823, -0.4269991, -4.22918, 0, 1, 0.772549, 1,
-0.07818016, 1.258132, -1.70134, 0, 1, 0.7764706, 1,
-0.07706989, -0.8021796, -2.810869, 0, 1, 0.7843137, 1,
-0.07336858, 1.310697, -0.696283, 0, 1, 0.7882353, 1,
-0.07019019, -2.300649, -0.8519553, 0, 1, 0.7960784, 1,
-0.06868996, 0.03344485, -1.54747, 0, 1, 0.8039216, 1,
-0.0630943, 1.711338, -0.9786184, 0, 1, 0.8078431, 1,
-0.06172042, -0.1255028, -3.139211, 0, 1, 0.8156863, 1,
-0.06137713, -0.1634143, -3.266833, 0, 1, 0.8196079, 1,
-0.056114, -1.952756, -3.198994, 0, 1, 0.827451, 1,
-0.05472345, -0.8980341, -3.78565, 0, 1, 0.8313726, 1,
-0.05424771, 1.236836, -1.076134, 0, 1, 0.8392157, 1,
-0.05283128, -0.1120965, -2.791114, 0, 1, 0.8431373, 1,
-0.05265944, 0.8867578, -0.9571723, 0, 1, 0.8509804, 1,
-0.05156467, -0.3061036, -6.082076, 0, 1, 0.854902, 1,
-0.04898324, 0.0946615, -0.4817887, 0, 1, 0.8627451, 1,
-0.04213438, -1.008045, -3.818727, 0, 1, 0.8666667, 1,
-0.0365228, 0.7625764, 0.3280095, 0, 1, 0.8745098, 1,
-0.03576959, 0.3049711, 0.1904978, 0, 1, 0.8784314, 1,
-0.0329753, -0.7106724, -3.269684, 0, 1, 0.8862745, 1,
-0.02863854, -0.4642495, -3.339205, 0, 1, 0.8901961, 1,
-0.02790337, -0.3042656, -2.985095, 0, 1, 0.8980392, 1,
-0.02750564, 0.9351028, -0.247445, 0, 1, 0.9058824, 1,
-0.02705482, 1.391329, 0.8452013, 0, 1, 0.9098039, 1,
-0.02682421, -0.249527, -1.149801, 0, 1, 0.9176471, 1,
-0.02551944, 0.7186638, -0.8582878, 0, 1, 0.9215686, 1,
-0.02108362, 0.965335, 1.999927, 0, 1, 0.9294118, 1,
-0.01807296, 1.256727, 1.68751, 0, 1, 0.9333333, 1,
-0.01300543, 0.7717635, 0.7293978, 0, 1, 0.9411765, 1,
-0.01204949, 1.560061, -1.48593, 0, 1, 0.945098, 1,
-0.007141212, -2.340604, -1.704911, 0, 1, 0.9529412, 1,
-0.00675667, 0.731762, -0.5420157, 0, 1, 0.9568627, 1,
-0.0036306, -0.03888424, -2.701779, 0, 1, 0.9647059, 1,
0.0007094381, -1.127919, 2.818108, 0, 1, 0.9686275, 1,
0.008514698, 0.8910401, -0.7912915, 0, 1, 0.9764706, 1,
0.009423842, 0.2476381, 0.9486765, 0, 1, 0.9803922, 1,
0.009996294, 1.31993, -0.8437939, 0, 1, 0.9882353, 1,
0.01314272, 0.2411789, -0.3912388, 0, 1, 0.9921569, 1,
0.01424529, 0.04889686, -0.4101669, 0, 1, 1, 1,
0.01500059, 0.4015842, 1.781091, 0, 0.9921569, 1, 1,
0.01729534, 0.6187534, 0.7407838, 0, 0.9882353, 1, 1,
0.02052578, 0.09602025, 1.677922, 0, 0.9803922, 1, 1,
0.02825579, 0.295132, 0.01462855, 0, 0.9764706, 1, 1,
0.02832857, -0.2289866, 4.286168, 0, 0.9686275, 1, 1,
0.03003214, -0.8915215, 3.103035, 0, 0.9647059, 1, 1,
0.03307839, 1.216829, -1.478748, 0, 0.9568627, 1, 1,
0.03784722, 0.5328425, -0.8078121, 0, 0.9529412, 1, 1,
0.042471, 1.6556, 0.5736576, 0, 0.945098, 1, 1,
0.04825606, 1.302028, -0.2330387, 0, 0.9411765, 1, 1,
0.05113024, 0.5429991, 0.9985987, 0, 0.9333333, 1, 1,
0.05836951, -1.353877, 1.570739, 0, 0.9294118, 1, 1,
0.06055458, 0.3201562, 0.3197315, 0, 0.9215686, 1, 1,
0.06635163, 0.3184775, 2.362762, 0, 0.9176471, 1, 1,
0.06747519, 0.5554428, -1.410396, 0, 0.9098039, 1, 1,
0.0681173, 0.5772814, 2.255709, 0, 0.9058824, 1, 1,
0.0681854, 0.3592783, 1.176728, 0, 0.8980392, 1, 1,
0.07059189, 0.2270583, 0.5543997, 0, 0.8901961, 1, 1,
0.07212906, -0.7424248, 4.509884, 0, 0.8862745, 1, 1,
0.07422122, 1.343377, 0.891485, 0, 0.8784314, 1, 1,
0.07589131, -1.69545, 2.799246, 0, 0.8745098, 1, 1,
0.08062955, -0.4336682, 1.396156, 0, 0.8666667, 1, 1,
0.08105922, 2.19034, -1.470314, 0, 0.8627451, 1, 1,
0.08215779, -1.493653, 4.120107, 0, 0.854902, 1, 1,
0.08373044, 0.06158713, 1.904731, 0, 0.8509804, 1, 1,
0.08430167, -1.267411, 2.499291, 0, 0.8431373, 1, 1,
0.08514613, -0.1352368, 2.557631, 0, 0.8392157, 1, 1,
0.08784845, 0.6502429, -1.717782, 0, 0.8313726, 1, 1,
0.08956964, -1.644585, 1.20612, 0, 0.827451, 1, 1,
0.09052428, -0.158824, 2.478903, 0, 0.8196079, 1, 1,
0.09541858, -0.02514169, 1.196315, 0, 0.8156863, 1, 1,
0.09845008, -0.7690188, 3.420442, 0, 0.8078431, 1, 1,
0.0987957, -0.8751824, 2.488177, 0, 0.8039216, 1, 1,
0.103078, -1.876141, 4.086743, 0, 0.7960784, 1, 1,
0.1042864, -0.9003794, 3.099859, 0, 0.7882353, 1, 1,
0.1062614, -2.221384, 2.75109, 0, 0.7843137, 1, 1,
0.1067321, -0.9595808, 4.641461, 0, 0.7764706, 1, 1,
0.1076807, -0.429982, 1.152702, 0, 0.772549, 1, 1,
0.1099693, -0.3462143, 2.910825, 0, 0.7647059, 1, 1,
0.1135451, 0.4350001, 1.269719, 0, 0.7607843, 1, 1,
0.1176378, -0.2330778, 2.292963, 0, 0.7529412, 1, 1,
0.1185925, 0.1533508, 0.804687, 0, 0.7490196, 1, 1,
0.118905, -0.4837726, 2.443464, 0, 0.7411765, 1, 1,
0.1207011, 1.049641, 1.458295, 0, 0.7372549, 1, 1,
0.1284021, 1.226511, -0.622506, 0, 0.7294118, 1, 1,
0.1311969, 0.03185211, -0.2839837, 0, 0.7254902, 1, 1,
0.1371085, 0.4092661, -0.5615793, 0, 0.7176471, 1, 1,
0.1405841, -1.06073, 3.562776, 0, 0.7137255, 1, 1,
0.1475619, -0.1619081, 3.498051, 0, 0.7058824, 1, 1,
0.1487493, 0.7628133, 1.839374, 0, 0.6980392, 1, 1,
0.1511956, -0.04904189, 3.064533, 0, 0.6941177, 1, 1,
0.1512661, 0.3466064, 2.227114, 0, 0.6862745, 1, 1,
0.1578166, 0.6104631, 0.139167, 0, 0.682353, 1, 1,
0.1645162, 1.107323, -2.40645, 0, 0.6745098, 1, 1,
0.1671017, -2.465444, 1.977082, 0, 0.6705883, 1, 1,
0.1694376, 0.1824317, 0.06289547, 0, 0.6627451, 1, 1,
0.1763143, 3.04884, 1.055174, 0, 0.6588235, 1, 1,
0.1769288, -2.08724, 5.092012, 0, 0.6509804, 1, 1,
0.1787388, -0.362353, 1.30036, 0, 0.6470588, 1, 1,
0.1796224, 0.7825284, -1.271224, 0, 0.6392157, 1, 1,
0.1911771, -0.05718393, 0.69524, 0, 0.6352941, 1, 1,
0.19229, 1.031673, -0.7120806, 0, 0.627451, 1, 1,
0.1955045, 0.626462, 0.7605014, 0, 0.6235294, 1, 1,
0.1961927, -0.2769948, 1.730259, 0, 0.6156863, 1, 1,
0.207606, -0.1252954, 3.805616, 0, 0.6117647, 1, 1,
0.2077623, 0.8028685, 0.9083691, 0, 0.6039216, 1, 1,
0.2137899, 0.4609883, -1.893657, 0, 0.5960785, 1, 1,
0.2155815, -1.367792, 3.300618, 0, 0.5921569, 1, 1,
0.2161392, -0.2175481, 2.601801, 0, 0.5843138, 1, 1,
0.2273383, -0.9518938, 1.387605, 0, 0.5803922, 1, 1,
0.2327012, -1.56551, 2.358235, 0, 0.572549, 1, 1,
0.2361996, 0.2826374, 2.427205, 0, 0.5686275, 1, 1,
0.2392061, -1.052905, 3.586432, 0, 0.5607843, 1, 1,
0.2399653, 1.178049, 1.322379, 0, 0.5568628, 1, 1,
0.2430321, 1.578917, 2.35193, 0, 0.5490196, 1, 1,
0.2441781, 0.7303679, 0.741076, 0, 0.5450981, 1, 1,
0.2446839, -0.4936683, 3.349677, 0, 0.5372549, 1, 1,
0.2460566, -1.272436, 2.73577, 0, 0.5333334, 1, 1,
0.2532, -1.109481, 2.308316, 0, 0.5254902, 1, 1,
0.2548557, 1.780193, 1.056289, 0, 0.5215687, 1, 1,
0.2557356, 0.2867061, 3.400819, 0, 0.5137255, 1, 1,
0.2562936, -0.2171079, 1.98417, 0, 0.509804, 1, 1,
0.2587893, 0.8156596, 0.9291921, 0, 0.5019608, 1, 1,
0.2617452, -0.7383857, 3.520838, 0, 0.4941176, 1, 1,
0.2626708, -1.471204, 5.377754, 0, 0.4901961, 1, 1,
0.2683986, 0.2788411, 0.2270029, 0, 0.4823529, 1, 1,
0.2767762, 0.6470236, 1.563399, 0, 0.4784314, 1, 1,
0.2811372, 1.719579, 1.093971, 0, 0.4705882, 1, 1,
0.2817316, -0.04888197, -0.07854564, 0, 0.4666667, 1, 1,
0.2860582, 1.18129, 0.4802552, 0, 0.4588235, 1, 1,
0.2892398, 1.494551, 0.9243634, 0, 0.454902, 1, 1,
0.2908237, 2.561738, -0.6164425, 0, 0.4470588, 1, 1,
0.293585, -0.10524, 2.152003, 0, 0.4431373, 1, 1,
0.2965015, -0.8282356, 3.072035, 0, 0.4352941, 1, 1,
0.2985715, 0.2142606, 1.177896, 0, 0.4313726, 1, 1,
0.3002909, 0.5481582, -0.05649516, 0, 0.4235294, 1, 1,
0.3047706, 1.009583, 0.3392049, 0, 0.4196078, 1, 1,
0.3068783, -0.9117314, 2.779632, 0, 0.4117647, 1, 1,
0.3081943, -0.3927017, 3.236542, 0, 0.4078431, 1, 1,
0.3097208, -1.308172, 3.780063, 0, 0.4, 1, 1,
0.3105354, -1.741758, 2.626694, 0, 0.3921569, 1, 1,
0.3174282, 1.371458, -0.324723, 0, 0.3882353, 1, 1,
0.3185722, -1.141163, 1.554172, 0, 0.3803922, 1, 1,
0.3190053, 0.1745065, 0.723286, 0, 0.3764706, 1, 1,
0.326262, -1.01317, 2.931167, 0, 0.3686275, 1, 1,
0.3266696, -1.255889, 3.587126, 0, 0.3647059, 1, 1,
0.3287758, -0.3630782, 2.864364, 0, 0.3568628, 1, 1,
0.3350513, -0.725197, 2.875885, 0, 0.3529412, 1, 1,
0.3380224, -0.3090119, 4.012671, 0, 0.345098, 1, 1,
0.3416421, 0.6290852, 1.389305, 0, 0.3411765, 1, 1,
0.3416795, 0.3845427, 2.220663, 0, 0.3333333, 1, 1,
0.3417731, 0.3363245, 2.263695, 0, 0.3294118, 1, 1,
0.3443184, -1.784196, 2.29738, 0, 0.3215686, 1, 1,
0.3473989, -0.417256, 1.787523, 0, 0.3176471, 1, 1,
0.3495007, 1.595749, 0.2775938, 0, 0.3098039, 1, 1,
0.3506015, 0.1890564, 1.106888, 0, 0.3058824, 1, 1,
0.3527063, 0.1791359, 2.418679, 0, 0.2980392, 1, 1,
0.3542934, 0.1500711, 2.384642, 0, 0.2901961, 1, 1,
0.3604692, 1.070333, -2.677299, 0, 0.2862745, 1, 1,
0.3670441, 2.243938, 0.4948913, 0, 0.2784314, 1, 1,
0.3676257, 0.661913, 2.96354, 0, 0.2745098, 1, 1,
0.3747732, -0.2955345, 1.906155, 0, 0.2666667, 1, 1,
0.3755698, 0.9242289, 2.352827, 0, 0.2627451, 1, 1,
0.3829357, 0.9171907, 0.2655597, 0, 0.254902, 1, 1,
0.3834026, 1.492262, -1.877289, 0, 0.2509804, 1, 1,
0.3877029, -1.549777, 2.668818, 0, 0.2431373, 1, 1,
0.3900321, 0.9292402, 1.345854, 0, 0.2392157, 1, 1,
0.3947137, -0.00641496, 1.608592, 0, 0.2313726, 1, 1,
0.3954724, 0.8901164, 1.154952, 0, 0.227451, 1, 1,
0.3986258, -0.3264664, 3.553799, 0, 0.2196078, 1, 1,
0.3987893, 0.07098427, 2.057776, 0, 0.2156863, 1, 1,
0.3996781, -1.464645, 2.22664, 0, 0.2078431, 1, 1,
0.4023679, 0.2996413, 1.92705, 0, 0.2039216, 1, 1,
0.4032837, 0.01364732, 3.209263, 0, 0.1960784, 1, 1,
0.4071926, -1.684517, 3.72622, 0, 0.1882353, 1, 1,
0.4093388, -1.288918, 1.580792, 0, 0.1843137, 1, 1,
0.4130299, 1.155648, -0.3675955, 0, 0.1764706, 1, 1,
0.4171121, 0.01653909, 0.1198188, 0, 0.172549, 1, 1,
0.4227371, -0.03984823, 1.710654, 0, 0.1647059, 1, 1,
0.4410562, -0.6167961, 2.214948, 0, 0.1607843, 1, 1,
0.4431599, 1.964959, 0.1380422, 0, 0.1529412, 1, 1,
0.4498912, 1.168023, -0.003753017, 0, 0.1490196, 1, 1,
0.4500694, -1.117146, 5.2845, 0, 0.1411765, 1, 1,
0.4512682, -0.396196, 1.944896, 0, 0.1372549, 1, 1,
0.4547894, 0.3275778, 1.706499, 0, 0.1294118, 1, 1,
0.4550684, -1.431478, 2.158763, 0, 0.1254902, 1, 1,
0.4571425, 0.3200896, 0.1621169, 0, 0.1176471, 1, 1,
0.4582682, -1.321419, 2.653309, 0, 0.1137255, 1, 1,
0.4589423, -0.6662397, 0.9308849, 0, 0.1058824, 1, 1,
0.4658664, -0.5608593, 1.322754, 0, 0.09803922, 1, 1,
0.4714373, -0.5997989, 2.680287, 0, 0.09411765, 1, 1,
0.4730007, 0.05527997, 1.745153, 0, 0.08627451, 1, 1,
0.4780046, -2.884225, 1.975886, 0, 0.08235294, 1, 1,
0.4784097, 1.576399, -1.434157, 0, 0.07450981, 1, 1,
0.4786228, 0.7906072, -0.993556, 0, 0.07058824, 1, 1,
0.4824283, -0.2775397, 1.34089, 0, 0.0627451, 1, 1,
0.4899225, 0.2364721, 0.7803382, 0, 0.05882353, 1, 1,
0.4911253, 0.5690822, -1.14918, 0, 0.05098039, 1, 1,
0.4958955, 0.8239726, 0.5786365, 0, 0.04705882, 1, 1,
0.4962164, -0.0287381, 2.869562, 0, 0.03921569, 1, 1,
0.5005034, -0.3286905, 2.154877, 0, 0.03529412, 1, 1,
0.5050084, -0.5376458, 2.625217, 0, 0.02745098, 1, 1,
0.5083146, -0.3097174, 5.536086, 0, 0.02352941, 1, 1,
0.5143998, -1.300657, 2.445876, 0, 0.01568628, 1, 1,
0.5146963, 1.04862, 0.2661147, 0, 0.01176471, 1, 1,
0.5189108, -1.09106, 2.544086, 0, 0.003921569, 1, 1,
0.5191208, 0.7461115, -0.4528957, 0.003921569, 0, 1, 1,
0.5288153, -0.1026135, 2.047422, 0.007843138, 0, 1, 1,
0.5349496, -0.6941963, 1.497269, 0.01568628, 0, 1, 1,
0.5394019, -0.3863976, 1.614419, 0.01960784, 0, 1, 1,
0.5432076, -0.03593865, -0.3018627, 0.02745098, 0, 1, 1,
0.5505745, 0.02531384, 1.023626, 0.03137255, 0, 1, 1,
0.551892, -0.4192252, 3.286999, 0.03921569, 0, 1, 1,
0.5520353, -0.0988458, 1.653702, 0.04313726, 0, 1, 1,
0.5523284, -1.212767, 2.115632, 0.05098039, 0, 1, 1,
0.5571577, 1.30258, 1.294517, 0.05490196, 0, 1, 1,
0.5579618, -1.431108, 2.681504, 0.0627451, 0, 1, 1,
0.5588396, 0.2430291, 1.929437, 0.06666667, 0, 1, 1,
0.5658938, 1.709012, -0.5613205, 0.07450981, 0, 1, 1,
0.5689123, -1.69552, 3.016391, 0.07843138, 0, 1, 1,
0.578422, 0.6026318, 2.134275, 0.08627451, 0, 1, 1,
0.5796751, -0.03578075, 2.237917, 0.09019608, 0, 1, 1,
0.5825966, -1.14538, 2.150168, 0.09803922, 0, 1, 1,
0.5852586, 0.1299442, 0.128195, 0.1058824, 0, 1, 1,
0.5911971, -1.322957, 4.038849, 0.1098039, 0, 1, 1,
0.5926459, -1.806228, 2.838394, 0.1176471, 0, 1, 1,
0.5943236, -0.9545729, 1.388038, 0.1215686, 0, 1, 1,
0.602329, -0.4820007, 0.4340982, 0.1294118, 0, 1, 1,
0.6099108, 1.966184, -1.102504, 0.1333333, 0, 1, 1,
0.6195714, -1.14684, 2.462667, 0.1411765, 0, 1, 1,
0.6263261, -0.1164527, 3.015208, 0.145098, 0, 1, 1,
0.6276463, 0.324279, -0.4679718, 0.1529412, 0, 1, 1,
0.6323286, -0.7117037, 3.251467, 0.1568628, 0, 1, 1,
0.6363367, 0.1946012, 1.134941, 0.1647059, 0, 1, 1,
0.6368011, -0.6626725, 2.392591, 0.1686275, 0, 1, 1,
0.6374646, -0.9829003, 3.261335, 0.1764706, 0, 1, 1,
0.6408975, 2.346238, -0.1903024, 0.1803922, 0, 1, 1,
0.6450258, -1.833328, 2.427779, 0.1882353, 0, 1, 1,
0.6480317, -1.094831, 3.74538, 0.1921569, 0, 1, 1,
0.6504132, -1.050885, 3.539417, 0.2, 0, 1, 1,
0.6512192, 0.4663289, 0.3179922, 0.2078431, 0, 1, 1,
0.651406, 2.117447, 1.489516, 0.2117647, 0, 1, 1,
0.659396, -0.9278657, 3.157133, 0.2196078, 0, 1, 1,
0.6629618, -1.589006, 2.210849, 0.2235294, 0, 1, 1,
0.6659797, -0.7786063, 2.241729, 0.2313726, 0, 1, 1,
0.6666153, 1.100941, -0.9001167, 0.2352941, 0, 1, 1,
0.6691545, 1.011369, -0.2158396, 0.2431373, 0, 1, 1,
0.6728622, -0.02687972, 2.729569, 0.2470588, 0, 1, 1,
0.6729331, 0.1750068, 2.904854, 0.254902, 0, 1, 1,
0.6741509, -0.8194493, 2.447444, 0.2588235, 0, 1, 1,
0.6742218, 1.32625, 1.748731, 0.2666667, 0, 1, 1,
0.6764307, -1.050508, 4.14637, 0.2705882, 0, 1, 1,
0.6765857, 0.2712446, 2.202534, 0.2784314, 0, 1, 1,
0.6804076, 0.3776953, 0.4733471, 0.282353, 0, 1, 1,
0.6834549, 0.02936997, 1.957129, 0.2901961, 0, 1, 1,
0.6865402, -0.4219645, 1.894155, 0.2941177, 0, 1, 1,
0.6884708, -0.7200488, 2.762436, 0.3019608, 0, 1, 1,
0.6943159, 0.1425807, -1.04583, 0.3098039, 0, 1, 1,
0.6945041, -0.4886614, 1.959413, 0.3137255, 0, 1, 1,
0.6955408, 1.10828, 2.408776, 0.3215686, 0, 1, 1,
0.6984651, 0.3054789, 0.7720329, 0.3254902, 0, 1, 1,
0.6986206, -0.3377729, 1.705223, 0.3333333, 0, 1, 1,
0.6989253, -1.694313, 1.838058, 0.3372549, 0, 1, 1,
0.6993386, -0.08661408, 1.83776, 0.345098, 0, 1, 1,
0.6998, -0.9298189, 2.829214, 0.3490196, 0, 1, 1,
0.7037809, 1.252915, 0.01399238, 0.3568628, 0, 1, 1,
0.7050404, -0.9918146, 1.086983, 0.3607843, 0, 1, 1,
0.7080473, 0.4409617, -0.7066317, 0.3686275, 0, 1, 1,
0.7086669, 1.035929, 0.3664757, 0.372549, 0, 1, 1,
0.7157961, -0.5122139, 1.697928, 0.3803922, 0, 1, 1,
0.7175238, -0.5087425, 2.941257, 0.3843137, 0, 1, 1,
0.7181994, -0.5119491, 1.832252, 0.3921569, 0, 1, 1,
0.7220642, -0.3031501, 2.737288, 0.3960784, 0, 1, 1,
0.7247665, 0.8059381, 0.04782136, 0.4039216, 0, 1, 1,
0.7283719, -1.814692, 3.801977, 0.4117647, 0, 1, 1,
0.7340367, 1.357721, 0.3848484, 0.4156863, 0, 1, 1,
0.7341599, -0.431775, 2.597645, 0.4235294, 0, 1, 1,
0.7365965, 0.4209841, 0.4802128, 0.427451, 0, 1, 1,
0.7411873, -0.5550117, 1.348466, 0.4352941, 0, 1, 1,
0.7412697, 1.167241, -0.009905519, 0.4392157, 0, 1, 1,
0.7432762, 1.026545, 1.577403, 0.4470588, 0, 1, 1,
0.7455756, 1.568792, 0.9874529, 0.4509804, 0, 1, 1,
0.7478212, -0.3987783, 1.476741, 0.4588235, 0, 1, 1,
0.7501749, -1.03809, 1.421623, 0.4627451, 0, 1, 1,
0.7526579, 0.4567962, 1.528907, 0.4705882, 0, 1, 1,
0.7594241, 0.7490577, 1.305206, 0.4745098, 0, 1, 1,
0.7616835, -1.291615, 3.808728, 0.4823529, 0, 1, 1,
0.7629086, 0.2527612, -0.7682261, 0.4862745, 0, 1, 1,
0.7680547, 0.3149849, 0.3088216, 0.4941176, 0, 1, 1,
0.7684204, -0.1542611, 2.489056, 0.5019608, 0, 1, 1,
0.7780623, -0.8621339, 1.530522, 0.5058824, 0, 1, 1,
0.7782624, 0.04955765, 2.340512, 0.5137255, 0, 1, 1,
0.7808366, -0.8798673, 2.264758, 0.5176471, 0, 1, 1,
0.7839268, -1.012399, 3.75603, 0.5254902, 0, 1, 1,
0.7896588, 0.3740988, 0.9846447, 0.5294118, 0, 1, 1,
0.7940373, 0.5751504, 0.5730219, 0.5372549, 0, 1, 1,
0.7960915, 0.0138518, 3.730457, 0.5411765, 0, 1, 1,
0.8040507, 1.825695, 0.2178798, 0.5490196, 0, 1, 1,
0.8065935, -1.553268, 0.6224995, 0.5529412, 0, 1, 1,
0.8071035, 0.1290534, 0.6529542, 0.5607843, 0, 1, 1,
0.8122158, -0.6921104, 3.151986, 0.5647059, 0, 1, 1,
0.8129215, -0.7967985, 2.311925, 0.572549, 0, 1, 1,
0.8157552, -1.544918, 3.25559, 0.5764706, 0, 1, 1,
0.8234584, 0.9364904, 1.379914, 0.5843138, 0, 1, 1,
0.824953, -1.377136, 3.538748, 0.5882353, 0, 1, 1,
0.8299137, -0.7886047, 3.061314, 0.5960785, 0, 1, 1,
0.8324308, -0.7115046, 2.177935, 0.6039216, 0, 1, 1,
0.8328716, 0.4389887, 1.69591, 0.6078432, 0, 1, 1,
0.8347787, -0.8968678, 2.160416, 0.6156863, 0, 1, 1,
0.8350261, -0.687947, 2.367167, 0.6196079, 0, 1, 1,
0.8376688, 1.991626, -0.4046294, 0.627451, 0, 1, 1,
0.8432166, -1.871665, 3.136705, 0.6313726, 0, 1, 1,
0.8436313, -0.616574, 4.298757, 0.6392157, 0, 1, 1,
0.8480377, 0.7349511, 3.354379, 0.6431373, 0, 1, 1,
0.8482596, -0.7973306, 3.223537, 0.6509804, 0, 1, 1,
0.8485314, -1.104461, 2.778887, 0.654902, 0, 1, 1,
0.8551575, 0.7436913, -0.7188205, 0.6627451, 0, 1, 1,
0.8598848, -1.202365, 2.901354, 0.6666667, 0, 1, 1,
0.8607879, 1.17663, 1.524707, 0.6745098, 0, 1, 1,
0.8619663, -0.2595888, 0.3355472, 0.6784314, 0, 1, 1,
0.8716651, 0.4208495, 1.268516, 0.6862745, 0, 1, 1,
0.8769324, -1.483458, 3.653064, 0.6901961, 0, 1, 1,
0.8770038, 0.6802046, 1.60013, 0.6980392, 0, 1, 1,
0.8774486, -0.06238744, 3.536644, 0.7058824, 0, 1, 1,
0.8790053, -1.34133, 3.54406, 0.7098039, 0, 1, 1,
0.8845946, -1.692021, 2.007184, 0.7176471, 0, 1, 1,
0.8850704, 0.8667756, 0.03377261, 0.7215686, 0, 1, 1,
0.8856514, 0.4884498, -0.1591049, 0.7294118, 0, 1, 1,
0.8923551, -0.4564742, 2.925952, 0.7333333, 0, 1, 1,
0.8926061, 1.229829, -0.1645299, 0.7411765, 0, 1, 1,
0.89501, 1.014423, 0.7182643, 0.7450981, 0, 1, 1,
0.8974087, -1.539565, 1.533746, 0.7529412, 0, 1, 1,
0.8989123, 0.6239399, 0.537786, 0.7568628, 0, 1, 1,
0.9004586, 0.5150037, 0.8221492, 0.7647059, 0, 1, 1,
0.9021159, 0.4870115, 1.258804, 0.7686275, 0, 1, 1,
0.9027368, -0.5857102, 2.422325, 0.7764706, 0, 1, 1,
0.9087726, 1.937138, 1.787537, 0.7803922, 0, 1, 1,
0.9133883, 2.392748, 1.858172, 0.7882353, 0, 1, 1,
0.9175121, 0.9241211, 0.8382266, 0.7921569, 0, 1, 1,
0.9244669, 0.3322568, 0.04211492, 0.8, 0, 1, 1,
0.9247043, -0.2210611, 2.429095, 0.8078431, 0, 1, 1,
0.9252058, 0.3631506, 0.4954451, 0.8117647, 0, 1, 1,
0.9321638, -0.1033811, 2.976645, 0.8196079, 0, 1, 1,
0.9489196, 0.28664, 1.300635, 0.8235294, 0, 1, 1,
0.9522933, 0.5411025, 1.22723, 0.8313726, 0, 1, 1,
0.9527642, 0.8073318, 1.771815, 0.8352941, 0, 1, 1,
0.9527723, -0.2191105, 2.527392, 0.8431373, 0, 1, 1,
0.9605496, -1.239707, 2.072742, 0.8470588, 0, 1, 1,
0.9614493, 0.05864041, 2.847794, 0.854902, 0, 1, 1,
0.9681538, 2.004091, -0.01902107, 0.8588235, 0, 1, 1,
0.9685512, 0.1751167, 0.8323293, 0.8666667, 0, 1, 1,
0.9701797, -0.3611834, 1.937242, 0.8705882, 0, 1, 1,
0.970431, 0.05351156, -0.4702145, 0.8784314, 0, 1, 1,
0.9728724, 0.3722623, 0.910631, 0.8823529, 0, 1, 1,
0.9760218, -0.5008808, 1.802316, 0.8901961, 0, 1, 1,
0.9776962, -1.074237, 3.834624, 0.8941177, 0, 1, 1,
0.9796078, -0.1143972, 1.067497, 0.9019608, 0, 1, 1,
0.9824524, 2.377795, 1.367747, 0.9098039, 0, 1, 1,
0.9854921, -0.2446848, 1.932726, 0.9137255, 0, 1, 1,
0.986146, 0.6221049, 1.777135, 0.9215686, 0, 1, 1,
0.9871744, -1.385125, 1.26364, 0.9254902, 0, 1, 1,
0.9911328, 0.5003246, 0.7269989, 0.9333333, 0, 1, 1,
0.9938685, -0.1613787, 2.668939, 0.9372549, 0, 1, 1,
0.9948978, -0.929835, 2.955822, 0.945098, 0, 1, 1,
0.9965259, -1.407721, 4.104868, 0.9490196, 0, 1, 1,
0.9966064, -0.2369635, 1.160085, 0.9568627, 0, 1, 1,
1.003218, 0.5651175, 1.013246, 0.9607843, 0, 1, 1,
1.006391, -0.7753434, 2.993845, 0.9686275, 0, 1, 1,
1.010294, -0.3867425, 1.201671, 0.972549, 0, 1, 1,
1.012903, -0.7625518, 2.158026, 0.9803922, 0, 1, 1,
1.014359, 2.001381, -1.428603, 0.9843137, 0, 1, 1,
1.016608, 1.790244, 1.216674, 0.9921569, 0, 1, 1,
1.017414, 0.9921921, 1.224806, 0.9960784, 0, 1, 1,
1.026789, 0.6457061, 1.953403, 1, 0, 0.9960784, 1,
1.032914, 0.6211547, 2.843211, 1, 0, 0.9882353, 1,
1.035861, 0.329501, 1.650941, 1, 0, 0.9843137, 1,
1.042837, -0.4441369, 1.346308, 1, 0, 0.9764706, 1,
1.047087, -2.063229, 3.337967, 1, 0, 0.972549, 1,
1.049595, 2.074791, 1.208721, 1, 0, 0.9647059, 1,
1.05385, -0.2677498, 2.095037, 1, 0, 0.9607843, 1,
1.063935, 0.1005443, -0.03609703, 1, 0, 0.9529412, 1,
1.06635, 0.2606186, 1.49452, 1, 0, 0.9490196, 1,
1.070988, 0.8136865, 3.804293, 1, 0, 0.9411765, 1,
1.079822, 0.008031961, 0.7973942, 1, 0, 0.9372549, 1,
1.079877, -0.09945057, 0.8921598, 1, 0, 0.9294118, 1,
1.081612, 1.348041, 0.553174, 1, 0, 0.9254902, 1,
1.083357, -0.5616246, 2.811033, 1, 0, 0.9176471, 1,
1.087238, 0.1400447, 0.5262138, 1, 0, 0.9137255, 1,
1.088607, -1.186697, 3.421637, 1, 0, 0.9058824, 1,
1.093287, 0.9507483, 1.580851, 1, 0, 0.9019608, 1,
1.095016, 1.897383, 1.394374, 1, 0, 0.8941177, 1,
1.108951, 2.159732, -0.9798381, 1, 0, 0.8862745, 1,
1.109766, 0.6130945, 0.3509034, 1, 0, 0.8823529, 1,
1.110496, -0.4878285, 0.7151294, 1, 0, 0.8745098, 1,
1.110988, 0.7263457, 1.235461, 1, 0, 0.8705882, 1,
1.11518, 0.3501086, 0.6877312, 1, 0, 0.8627451, 1,
1.117007, -0.5903346, 3.865469, 1, 0, 0.8588235, 1,
1.126668, 0.5266277, 2.226987, 1, 0, 0.8509804, 1,
1.136908, -0.05791625, 0.8933223, 1, 0, 0.8470588, 1,
1.142666, -1.551703, 2.526779, 1, 0, 0.8392157, 1,
1.145869, -2.24891, 1.624928, 1, 0, 0.8352941, 1,
1.155189, 1.712225, 0.7939639, 1, 0, 0.827451, 1,
1.162593, 1.068362, -1.028042, 1, 0, 0.8235294, 1,
1.176201, -2.024315, 0.7095186, 1, 0, 0.8156863, 1,
1.179794, 0.4377204, 1.517969, 1, 0, 0.8117647, 1,
1.18952, 1.550674, 0.5875956, 1, 0, 0.8039216, 1,
1.190527, -1.273774, 3.234048, 1, 0, 0.7960784, 1,
1.197648, -0.430762, 0.7249249, 1, 0, 0.7921569, 1,
1.204877, 2.4506, 1.643302, 1, 0, 0.7843137, 1,
1.210579, 2.071146, 1.352856, 1, 0, 0.7803922, 1,
1.211246, -1.220682, 2.327084, 1, 0, 0.772549, 1,
1.228621, -0.625208, 2.997797, 1, 0, 0.7686275, 1,
1.238212, -1.223477, 3.560855, 1, 0, 0.7607843, 1,
1.240457, 1.150821, 0.7002984, 1, 0, 0.7568628, 1,
1.247912, 1.558348, 2.553487, 1, 0, 0.7490196, 1,
1.248138, -0.8405142, -0.3115224, 1, 0, 0.7450981, 1,
1.255281, -1.872334, 0.9102615, 1, 0, 0.7372549, 1,
1.260145, 0.06690194, 2.908528, 1, 0, 0.7333333, 1,
1.262925, -0.7156335, 2.673504, 1, 0, 0.7254902, 1,
1.269851, -0.5038066, 1.282424, 1, 0, 0.7215686, 1,
1.271033, -0.8566644, 3.136661, 1, 0, 0.7137255, 1,
1.271252, 0.916425, 2.344774, 1, 0, 0.7098039, 1,
1.274675, 0.5565768, 2.149054, 1, 0, 0.7019608, 1,
1.276765, -2.672709, 3.58698, 1, 0, 0.6941177, 1,
1.294493, 1.461625, 1.859852, 1, 0, 0.6901961, 1,
1.297794, -0.1062489, 2.500063, 1, 0, 0.682353, 1,
1.29895, -2.48893, 2.305286, 1, 0, 0.6784314, 1,
1.302031, -1.54112, 2.389474, 1, 0, 0.6705883, 1,
1.302083, 0.870111, 1.360671, 1, 0, 0.6666667, 1,
1.303676, 1.592288, -0.02250416, 1, 0, 0.6588235, 1,
1.304679, 1.549464, 0.8196704, 1, 0, 0.654902, 1,
1.331222, -0.9471631, 1.649302, 1, 0, 0.6470588, 1,
1.331926, 0.2460774, -0.3091778, 1, 0, 0.6431373, 1,
1.339294, 0.8107604, 0.2522382, 1, 0, 0.6352941, 1,
1.347714, 0.6674323, 0.01717286, 1, 0, 0.6313726, 1,
1.362047, 1.194665, 1.724752, 1, 0, 0.6235294, 1,
1.366167, -0.6002641, 0.9639386, 1, 0, 0.6196079, 1,
1.372865, 0.6779249, 0.6005972, 1, 0, 0.6117647, 1,
1.388764, 0.992501, 1.877775, 1, 0, 0.6078432, 1,
1.396089, 1.097153, 0.6240277, 1, 0, 0.6, 1,
1.407916, 0.4121893, 0.143659, 1, 0, 0.5921569, 1,
1.413894, 2.460654, 0.9289491, 1, 0, 0.5882353, 1,
1.41612, 0.9172192, 1.199871, 1, 0, 0.5803922, 1,
1.423452, 0.4767333, 0.9299774, 1, 0, 0.5764706, 1,
1.426278, -0.1622323, 0.91164, 1, 0, 0.5686275, 1,
1.442638, 0.1221688, 2.287928, 1, 0, 0.5647059, 1,
1.447484, 0.2451783, 1.038429, 1, 0, 0.5568628, 1,
1.447668, 0.1655423, 4.540321, 1, 0, 0.5529412, 1,
1.461573, 0.4380746, 2.373328, 1, 0, 0.5450981, 1,
1.470158, 2.018468, -1.061224, 1, 0, 0.5411765, 1,
1.47108, -0.7273786, 2.178741, 1, 0, 0.5333334, 1,
1.474981, 0.1068026, 1.170556, 1, 0, 0.5294118, 1,
1.477572, -0.4768218, 1.16321, 1, 0, 0.5215687, 1,
1.48213, -1.296596, 2.595492, 1, 0, 0.5176471, 1,
1.482148, -0.5540248, -0.809899, 1, 0, 0.509804, 1,
1.491026, -1.298985, 2.251927, 1, 0, 0.5058824, 1,
1.492649, 0.3697203, 1.941867, 1, 0, 0.4980392, 1,
1.494314, -0.579342, 3.23825, 1, 0, 0.4901961, 1,
1.505869, -0.2855527, 2.118347, 1, 0, 0.4862745, 1,
1.507225, 0.6452501, 0.267301, 1, 0, 0.4784314, 1,
1.521053, -1.313868, 2.845403, 1, 0, 0.4745098, 1,
1.524529, -0.3907413, 1.951742, 1, 0, 0.4666667, 1,
1.527888, 0.2107023, 2.468811, 1, 0, 0.4627451, 1,
1.530457, -1.30339, 0.7259212, 1, 0, 0.454902, 1,
1.533578, 1.242289, 0.8271475, 1, 0, 0.4509804, 1,
1.541122, 0.8427479, -0.5550759, 1, 0, 0.4431373, 1,
1.546124, -0.756617, 1.688187, 1, 0, 0.4392157, 1,
1.551615, -1.184288, 2.377764, 1, 0, 0.4313726, 1,
1.559477, 0.2684353, 2.610514, 1, 0, 0.427451, 1,
1.576898, -1.030931, 2.070955, 1, 0, 0.4196078, 1,
1.581529, -0.4792055, 2.036865, 1, 0, 0.4156863, 1,
1.583521, -0.3516344, 1.488452, 1, 0, 0.4078431, 1,
1.58696, 1.246993, 0.8733657, 1, 0, 0.4039216, 1,
1.588303, 0.6184022, 2.291108, 1, 0, 0.3960784, 1,
1.605097, 1.002708, 3.184795, 1, 0, 0.3882353, 1,
1.613658, 0.2404052, 0.406303, 1, 0, 0.3843137, 1,
1.617599, -0.2334111, 1.576964, 1, 0, 0.3764706, 1,
1.626798, -0.1969307, 2.075868, 1, 0, 0.372549, 1,
1.631556, -1.604886, 1.908692, 1, 0, 0.3647059, 1,
1.634077, -1.80957, 2.781964, 1, 0, 0.3607843, 1,
1.636538, -0.3503163, 2.54421, 1, 0, 0.3529412, 1,
1.641117, -0.747872, 3.014359, 1, 0, 0.3490196, 1,
1.646404, 0.1572966, 1.467884, 1, 0, 0.3411765, 1,
1.649396, -0.7481092, 1.560272, 1, 0, 0.3372549, 1,
1.651394, -0.4257381, 2.339498, 1, 0, 0.3294118, 1,
1.657877, 0.7052521, 0.8838218, 1, 0, 0.3254902, 1,
1.661716, -0.1829577, 3.489251, 1, 0, 0.3176471, 1,
1.662166, 1.098736, 0.2339677, 1, 0, 0.3137255, 1,
1.671706, 0.571243, 0.09504078, 1, 0, 0.3058824, 1,
1.673411, -0.4344935, 0.9135186, 1, 0, 0.2980392, 1,
1.684285, 0.1277809, -0.1234692, 1, 0, 0.2941177, 1,
1.711927, -0.5658213, 1.363793, 1, 0, 0.2862745, 1,
1.714465, 0.5024434, 0.312719, 1, 0, 0.282353, 1,
1.757266, 0.4721053, 1.619897, 1, 0, 0.2745098, 1,
1.773016, 1.0096, 0.4108512, 1, 0, 0.2705882, 1,
1.781759, 0.1774448, 1.370619, 1, 0, 0.2627451, 1,
1.791559, 0.4720515, 1.495392, 1, 0, 0.2588235, 1,
1.792261, -0.1644904, -0.3470095, 1, 0, 0.2509804, 1,
1.795917, -0.04246824, 2.435558, 1, 0, 0.2470588, 1,
1.803886, -0.7705012, 2.030745, 1, 0, 0.2392157, 1,
1.805068, 1.421126, 0.1482291, 1, 0, 0.2352941, 1,
1.810417, 0.1370795, 2.119459, 1, 0, 0.227451, 1,
1.814773, 0.4760963, 0.6536216, 1, 0, 0.2235294, 1,
1.84531, -2.006403, 1.601615, 1, 0, 0.2156863, 1,
1.85864, -0.6823633, 1.510621, 1, 0, 0.2117647, 1,
1.864858, -1.475899, 3.068522, 1, 0, 0.2039216, 1,
1.870723, 1.55652, 0.7293249, 1, 0, 0.1960784, 1,
1.880489, -0.1998325, 2.329055, 1, 0, 0.1921569, 1,
1.893763, -0.8928936, 0.9221718, 1, 0, 0.1843137, 1,
1.893992, 1.232501, 1.217121, 1, 0, 0.1803922, 1,
1.916141, 1.056387, 2.373249, 1, 0, 0.172549, 1,
1.924482, 1.979629, -0.08679282, 1, 0, 0.1686275, 1,
1.948433, 0.1880281, 1.032443, 1, 0, 0.1607843, 1,
1.960382, 0.172787, 2.309507, 1, 0, 0.1568628, 1,
1.976581, 0.7149561, 0.09683935, 1, 0, 0.1490196, 1,
1.995687, 1.214906, 0.5229542, 1, 0, 0.145098, 1,
1.99829, 0.8676633, -0.04612216, 1, 0, 0.1372549, 1,
2.00563, -0.8302737, 0.945638, 1, 0, 0.1333333, 1,
2.029577, 1.409555, 1.44239, 1, 0, 0.1254902, 1,
2.069124, 1.555919, 1.992786, 1, 0, 0.1215686, 1,
2.084109, -0.6649093, 0.6976891, 1, 0, 0.1137255, 1,
2.093279, -1.465405, 2.693028, 1, 0, 0.1098039, 1,
2.106938, -1.431775, 3.191866, 1, 0, 0.1019608, 1,
2.237246, 0.7957983, 0.9114431, 1, 0, 0.09411765, 1,
2.246366, -1.519711, 2.615371, 1, 0, 0.09019608, 1,
2.294604, -2.017323, 1.664752, 1, 0, 0.08235294, 1,
2.295575, -0.5526749, 1.166567, 1, 0, 0.07843138, 1,
2.318474, 0.930589, -0.4801303, 1, 0, 0.07058824, 1,
2.353319, 0.255049, 2.374652, 1, 0, 0.06666667, 1,
2.359343, 0.3712605, 0.7622361, 1, 0, 0.05882353, 1,
2.386143, -0.01110397, 1.383904, 1, 0, 0.05490196, 1,
2.476345, 0.530651, 1.161152, 1, 0, 0.04705882, 1,
2.482943, -0.9215692, 2.74514, 1, 0, 0.04313726, 1,
2.546704, 1.933262, 0.3856819, 1, 0, 0.03529412, 1,
2.731488, -0.2753119, 1.709677, 1, 0, 0.03137255, 1,
2.755366, 0.6175849, 0.2333362, 1, 0, 0.02352941, 1,
2.854375, 0.6423473, 0.7733944, 1, 0, 0.01960784, 1,
3.055495, 0.2092457, 1.678574, 1, 0, 0.01176471, 1,
3.175358, -0.5876197, 1.813617, 1, 0, 0.007843138, 1
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
0.1983622, -3.931256, -8.051354, 0, -0.5, 0.5, 0.5,
0.1983622, -3.931256, -8.051354, 1, -0.5, 0.5, 0.5,
0.1983622, -3.931256, -8.051354, 1, 1.5, 0.5, 0.5,
0.1983622, -3.931256, -8.051354, 0, 1.5, 0.5, 0.5
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
-3.787835, 0.2043606, -8.051354, 0, -0.5, 0.5, 0.5,
-3.787835, 0.2043606, -8.051354, 1, -0.5, 0.5, 0.5,
-3.787835, 0.2043606, -8.051354, 1, 1.5, 0.5, 0.5,
-3.787835, 0.2043606, -8.051354, 0, 1.5, 0.5, 0.5
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
-3.787835, -3.931256, -0.272995, 0, -0.5, 0.5, 0.5,
-3.787835, -3.931256, -0.272995, 1, -0.5, 0.5, 0.5,
-3.787835, -3.931256, -0.272995, 1, 1.5, 0.5, 0.5,
-3.787835, -3.931256, -0.272995, 0, 1.5, 0.5, 0.5
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
-2, -2.976883, -6.256349,
3, -2.976883, -6.256349,
-2, -2.976883, -6.256349,
-2, -3.135945, -6.555516,
-1, -2.976883, -6.256349,
-1, -3.135945, -6.555516,
0, -2.976883, -6.256349,
0, -3.135945, -6.555516,
1, -2.976883, -6.256349,
1, -3.135945, -6.555516,
2, -2.976883, -6.256349,
2, -3.135945, -6.555516,
3, -2.976883, -6.256349,
3, -3.135945, -6.555516
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
-2, -3.454069, -7.153852, 0, -0.5, 0.5, 0.5,
-2, -3.454069, -7.153852, 1, -0.5, 0.5, 0.5,
-2, -3.454069, -7.153852, 1, 1.5, 0.5, 0.5,
-2, -3.454069, -7.153852, 0, 1.5, 0.5, 0.5,
-1, -3.454069, -7.153852, 0, -0.5, 0.5, 0.5,
-1, -3.454069, -7.153852, 1, -0.5, 0.5, 0.5,
-1, -3.454069, -7.153852, 1, 1.5, 0.5, 0.5,
-1, -3.454069, -7.153852, 0, 1.5, 0.5, 0.5,
0, -3.454069, -7.153852, 0, -0.5, 0.5, 0.5,
0, -3.454069, -7.153852, 1, -0.5, 0.5, 0.5,
0, -3.454069, -7.153852, 1, 1.5, 0.5, 0.5,
0, -3.454069, -7.153852, 0, 1.5, 0.5, 0.5,
1, -3.454069, -7.153852, 0, -0.5, 0.5, 0.5,
1, -3.454069, -7.153852, 1, -0.5, 0.5, 0.5,
1, -3.454069, -7.153852, 1, 1.5, 0.5, 0.5,
1, -3.454069, -7.153852, 0, 1.5, 0.5, 0.5,
2, -3.454069, -7.153852, 0, -0.5, 0.5, 0.5,
2, -3.454069, -7.153852, 1, -0.5, 0.5, 0.5,
2, -3.454069, -7.153852, 1, 1.5, 0.5, 0.5,
2, -3.454069, -7.153852, 0, 1.5, 0.5, 0.5,
3, -3.454069, -7.153852, 0, -0.5, 0.5, 0.5,
3, -3.454069, -7.153852, 1, -0.5, 0.5, 0.5,
3, -3.454069, -7.153852, 1, 1.5, 0.5, 0.5,
3, -3.454069, -7.153852, 0, 1.5, 0.5, 0.5
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
-2.867944, -2, -6.256349,
-2.867944, 3, -6.256349,
-2.867944, -2, -6.256349,
-3.021259, -2, -6.555516,
-2.867944, -1, -6.256349,
-3.021259, -1, -6.555516,
-2.867944, 0, -6.256349,
-3.021259, 0, -6.555516,
-2.867944, 1, -6.256349,
-3.021259, 1, -6.555516,
-2.867944, 2, -6.256349,
-3.021259, 2, -6.555516,
-2.867944, 3, -6.256349,
-3.021259, 3, -6.555516
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
-3.327889, -2, -7.153852, 0, -0.5, 0.5, 0.5,
-3.327889, -2, -7.153852, 1, -0.5, 0.5, 0.5,
-3.327889, -2, -7.153852, 1, 1.5, 0.5, 0.5,
-3.327889, -2, -7.153852, 0, 1.5, 0.5, 0.5,
-3.327889, -1, -7.153852, 0, -0.5, 0.5, 0.5,
-3.327889, -1, -7.153852, 1, -0.5, 0.5, 0.5,
-3.327889, -1, -7.153852, 1, 1.5, 0.5, 0.5,
-3.327889, -1, -7.153852, 0, 1.5, 0.5, 0.5,
-3.327889, 0, -7.153852, 0, -0.5, 0.5, 0.5,
-3.327889, 0, -7.153852, 1, -0.5, 0.5, 0.5,
-3.327889, 0, -7.153852, 1, 1.5, 0.5, 0.5,
-3.327889, 0, -7.153852, 0, 1.5, 0.5, 0.5,
-3.327889, 1, -7.153852, 0, -0.5, 0.5, 0.5,
-3.327889, 1, -7.153852, 1, -0.5, 0.5, 0.5,
-3.327889, 1, -7.153852, 1, 1.5, 0.5, 0.5,
-3.327889, 1, -7.153852, 0, 1.5, 0.5, 0.5,
-3.327889, 2, -7.153852, 0, -0.5, 0.5, 0.5,
-3.327889, 2, -7.153852, 1, -0.5, 0.5, 0.5,
-3.327889, 2, -7.153852, 1, 1.5, 0.5, 0.5,
-3.327889, 2, -7.153852, 0, 1.5, 0.5, 0.5,
-3.327889, 3, -7.153852, 0, -0.5, 0.5, 0.5,
-3.327889, 3, -7.153852, 1, -0.5, 0.5, 0.5,
-3.327889, 3, -7.153852, 1, 1.5, 0.5, 0.5,
-3.327889, 3, -7.153852, 0, 1.5, 0.5, 0.5
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
-2.867944, -2.976883, -6,
-2.867944, -2.976883, 4,
-2.867944, -2.976883, -6,
-3.021259, -3.135945, -6,
-2.867944, -2.976883, -4,
-3.021259, -3.135945, -4,
-2.867944, -2.976883, -2,
-3.021259, -3.135945, -2,
-2.867944, -2.976883, 0,
-3.021259, -3.135945, 0,
-2.867944, -2.976883, 2,
-3.021259, -3.135945, 2,
-2.867944, -2.976883, 4,
-3.021259, -3.135945, 4
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
-3.327889, -3.454069, -6, 0, -0.5, 0.5, 0.5,
-3.327889, -3.454069, -6, 1, -0.5, 0.5, 0.5,
-3.327889, -3.454069, -6, 1, 1.5, 0.5, 0.5,
-3.327889, -3.454069, -6, 0, 1.5, 0.5, 0.5,
-3.327889, -3.454069, -4, 0, -0.5, 0.5, 0.5,
-3.327889, -3.454069, -4, 1, -0.5, 0.5, 0.5,
-3.327889, -3.454069, -4, 1, 1.5, 0.5, 0.5,
-3.327889, -3.454069, -4, 0, 1.5, 0.5, 0.5,
-3.327889, -3.454069, -2, 0, -0.5, 0.5, 0.5,
-3.327889, -3.454069, -2, 1, -0.5, 0.5, 0.5,
-3.327889, -3.454069, -2, 1, 1.5, 0.5, 0.5,
-3.327889, -3.454069, -2, 0, 1.5, 0.5, 0.5,
-3.327889, -3.454069, 0, 0, -0.5, 0.5, 0.5,
-3.327889, -3.454069, 0, 1, -0.5, 0.5, 0.5,
-3.327889, -3.454069, 0, 1, 1.5, 0.5, 0.5,
-3.327889, -3.454069, 0, 0, 1.5, 0.5, 0.5,
-3.327889, -3.454069, 2, 0, -0.5, 0.5, 0.5,
-3.327889, -3.454069, 2, 1, -0.5, 0.5, 0.5,
-3.327889, -3.454069, 2, 1, 1.5, 0.5, 0.5,
-3.327889, -3.454069, 2, 0, 1.5, 0.5, 0.5,
-3.327889, -3.454069, 4, 0, -0.5, 0.5, 0.5,
-3.327889, -3.454069, 4, 1, -0.5, 0.5, 0.5,
-3.327889, -3.454069, 4, 1, 1.5, 0.5, 0.5,
-3.327889, -3.454069, 4, 0, 1.5, 0.5, 0.5
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
-2.867944, -2.976883, -6.256349,
-2.867944, 3.385604, -6.256349,
-2.867944, -2.976883, 5.710359,
-2.867944, 3.385604, 5.710359,
-2.867944, -2.976883, -6.256349,
-2.867944, -2.976883, 5.710359,
-2.867944, 3.385604, -6.256349,
-2.867944, 3.385604, 5.710359,
-2.867944, -2.976883, -6.256349,
3.264668, -2.976883, -6.256349,
-2.867944, -2.976883, 5.710359,
3.264668, -2.976883, 5.710359,
-2.867944, 3.385604, -6.256349,
3.264668, 3.385604, -6.256349,
-2.867944, 3.385604, 5.710359,
3.264668, 3.385604, 5.710359,
3.264668, -2.976883, -6.256349,
3.264668, 3.385604, -6.256349,
3.264668, -2.976883, 5.710359,
3.264668, 3.385604, 5.710359,
3.264668, -2.976883, -6.256349,
3.264668, -2.976883, 5.710359,
3.264668, 3.385604, -6.256349,
3.264668, 3.385604, 5.710359
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
var radius = 7.943439;
var distance = 35.34126;
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
mvMatrix.translate( -0.1983622, -0.2043606, 0.272995 );
mvMatrix.scale( 1.40048, 1.349881, 0.7177081 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.34126);
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
pyrazosulfuron-ethyl<-read.table("pyrazosulfuron-ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrazosulfuron-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrazosulfuron' not found
```

```r
y<-pyrazosulfuron-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrazosulfuron' not found
```

```r
z<-pyrazosulfuron-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrazosulfuron' not found
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
-2.778634, -0.4710084, -1.122022, 0, 0, 1, 1, 1,
-2.755016, -0.08997393, -1.100229, 1, 0, 0, 1, 1,
-2.663329, -0.6549464, -1.909799, 1, 0, 0, 1, 1,
-2.599425, -0.2019058, -2.068405, 1, 0, 0, 1, 1,
-2.587041, -0.4212574, -2.369724, 1, 0, 0, 1, 1,
-2.567351, -1.190703, -2.106775, 1, 0, 0, 1, 1,
-2.565584, 1.437892, -0.471515, 0, 0, 0, 1, 1,
-2.502434, -0.3764188, -2.893289, 0, 0, 0, 1, 1,
-2.328218, 1.089743, -0.8318047, 0, 0, 0, 1, 1,
-2.323277, 1.824611, -0.9950266, 0, 0, 0, 1, 1,
-2.272768, 1.390738, -0.4848102, 0, 0, 0, 1, 1,
-2.257799, 1.272915, 0.1280349, 0, 0, 0, 1, 1,
-2.240583, 0.9462478, -1.09588, 0, 0, 0, 1, 1,
-2.226883, -0.6175861, -0.8047276, 1, 1, 1, 1, 1,
-2.224151, -0.3973831, -3.40852, 1, 1, 1, 1, 1,
-2.223575, -1.220753, -2.089031, 1, 1, 1, 1, 1,
-2.200154, 0.05927129, -1.124125, 1, 1, 1, 1, 1,
-2.137531, 0.2765091, -0.6836834, 1, 1, 1, 1, 1,
-2.09193, -1.702544, -2.876525, 1, 1, 1, 1, 1,
-2.059702, 2.662545, -1.073846, 1, 1, 1, 1, 1,
-2.03799, -1.823136, -2.042559, 1, 1, 1, 1, 1,
-2.001621, -1.283495, -3.937605, 1, 1, 1, 1, 1,
-1.938667, 0.8861065, -2.148059, 1, 1, 1, 1, 1,
-1.93734, 1.001281, -1.340779, 1, 1, 1, 1, 1,
-1.935104, -1.754264, -2.899945, 1, 1, 1, 1, 1,
-1.903607, -0.518313, -2.3611, 1, 1, 1, 1, 1,
-1.88475, -0.634813, -2.569327, 1, 1, 1, 1, 1,
-1.853138, 1.89675, -1.56805, 1, 1, 1, 1, 1,
-1.82763, -1.016583, -1.905964, 0, 0, 1, 1, 1,
-1.800734, 0.08219187, -2.707491, 1, 0, 0, 1, 1,
-1.797709, -0.7496674, -2.151457, 1, 0, 0, 1, 1,
-1.785945, -2.805816, -1.980055, 1, 0, 0, 1, 1,
-1.770425, -1.542912, -2.9519, 1, 0, 0, 1, 1,
-1.737825, -0.49612, -1.137365, 1, 0, 0, 1, 1,
-1.728781, -1.39301, -4.25773, 0, 0, 0, 1, 1,
-1.713889, -0.3815077, -1.526137, 0, 0, 0, 1, 1,
-1.692675, 0.03760692, -2.258206, 0, 0, 0, 1, 1,
-1.67981, -0.8950461, -1.52692, 0, 0, 0, 1, 1,
-1.654792, -0.8418391, -0.7976372, 0, 0, 0, 1, 1,
-1.651172, 3.292946, -0.1087568, 0, 0, 0, 1, 1,
-1.63144, -0.2974224, -1.963169, 0, 0, 0, 1, 1,
-1.62396, -0.2481934, -1.318813, 1, 1, 1, 1, 1,
-1.620301, 0.1844968, -1.622558, 1, 1, 1, 1, 1,
-1.617737, 0.9856064, -1.971453, 1, 1, 1, 1, 1,
-1.615756, -0.6696113, -2.563444, 1, 1, 1, 1, 1,
-1.609564, -1.255306, -0.981945, 1, 1, 1, 1, 1,
-1.583692, -1.193439, -2.95926, 1, 1, 1, 1, 1,
-1.549252, 0.6754501, 1.08218, 1, 1, 1, 1, 1,
-1.548759, 0.774305, 2.457694, 1, 1, 1, 1, 1,
-1.538152, -0.2323322, -0.7196862, 1, 1, 1, 1, 1,
-1.535509, 0.03814457, -0.5218475, 1, 1, 1, 1, 1,
-1.528441, 0.07631361, -2.076072, 1, 1, 1, 1, 1,
-1.518126, -1.197677, -2.16008, 1, 1, 1, 1, 1,
-1.508538, -0.4993961, -2.198458, 1, 1, 1, 1, 1,
-1.505751, -2.163038, -2.118602, 1, 1, 1, 1, 1,
-1.505182, -1.126935, -2.502793, 1, 1, 1, 1, 1,
-1.482474, 1.486875, -1.120826, 0, 0, 1, 1, 1,
-1.473825, -1.670371, -2.906611, 1, 0, 0, 1, 1,
-1.470206, 0.2883133, -1.859625, 1, 0, 0, 1, 1,
-1.469795, -0.1090815, -2.435286, 1, 0, 0, 1, 1,
-1.466068, -0.9975035, -2.506565, 1, 0, 0, 1, 1,
-1.462196, -0.1991602, -1.907446, 1, 0, 0, 1, 1,
-1.454867, -0.02250542, -1.808049, 0, 0, 0, 1, 1,
-1.453557, 0.7154263, -1.738443, 0, 0, 0, 1, 1,
-1.452341, 0.2350382, -0.6836663, 0, 0, 0, 1, 1,
-1.450741, 1.999613, -1.271333, 0, 0, 0, 1, 1,
-1.450112, 0.2467503, -1.537743, 0, 0, 0, 1, 1,
-1.442431, 0.5529838, -1.625887, 0, 0, 0, 1, 1,
-1.44171, -0.02166083, -2.526695, 0, 0, 0, 1, 1,
-1.436594, 0.1596196, -2.200332, 1, 1, 1, 1, 1,
-1.417083, -1.190163, -1.833594, 1, 1, 1, 1, 1,
-1.413715, 0.3939177, 0.1719199, 1, 1, 1, 1, 1,
-1.413313, 1.123102, -0.02882255, 1, 1, 1, 1, 1,
-1.40937, -1.256105, -2.579233, 1, 1, 1, 1, 1,
-1.39319, -0.9991286, -2.114349, 1, 1, 1, 1, 1,
-1.383643, 0.5524852, -1.85491, 1, 1, 1, 1, 1,
-1.379327, 1.31679, -1.834634, 1, 1, 1, 1, 1,
-1.378793, 1.7391, 0.8238744, 1, 1, 1, 1, 1,
-1.360979, -0.1326923, -1.870553, 1, 1, 1, 1, 1,
-1.355133, -0.4240942, -1.839734, 1, 1, 1, 1, 1,
-1.343206, 1.195798, -0.4393118, 1, 1, 1, 1, 1,
-1.32875, 1.315537, -0.5664854, 1, 1, 1, 1, 1,
-1.327947, -0.02765609, -1.995543, 1, 1, 1, 1, 1,
-1.327861, -0.8959317, -4.519215, 1, 1, 1, 1, 1,
-1.326347, -1.063288, -1.545911, 0, 0, 1, 1, 1,
-1.325086, -0.1645864, -2.886604, 1, 0, 0, 1, 1,
-1.324738, 0.4792783, -2.234255, 1, 0, 0, 1, 1,
-1.312619, -1.577446, -3.481004, 1, 0, 0, 1, 1,
-1.312443, -0.09763003, -0.2617691, 1, 0, 0, 1, 1,
-1.308974, 1.972898, -0.7084854, 1, 0, 0, 1, 1,
-1.302562, -0.55921, -2.456705, 0, 0, 0, 1, 1,
-1.297254, -1.543306, -4.706817, 0, 0, 0, 1, 1,
-1.29638, 0.2267871, 1.229728, 0, 0, 0, 1, 1,
-1.294131, -1.67773, -3.082955, 0, 0, 0, 1, 1,
-1.292465, -1.533875, -1.982012, 0, 0, 0, 1, 1,
-1.27204, -0.02504729, -2.268152, 0, 0, 0, 1, 1,
-1.271723, 0.6588978, -1.803676, 0, 0, 0, 1, 1,
-1.268695, 1.680755, -1.209458, 1, 1, 1, 1, 1,
-1.268392, -1.040609, -1.682892, 1, 1, 1, 1, 1,
-1.262625, -0.421363, -4.505471, 1, 1, 1, 1, 1,
-1.261663, -1.135812, -0.6990473, 1, 1, 1, 1, 1,
-1.249814, 1.813887, -2.451749, 1, 1, 1, 1, 1,
-1.246752, -0.4003949, -1.885034, 1, 1, 1, 1, 1,
-1.241614, 0.3040926, -2.873639, 1, 1, 1, 1, 1,
-1.239077, -0.7890213, -3.86854, 1, 1, 1, 1, 1,
-1.234958, 1.05692, 0.002701299, 1, 1, 1, 1, 1,
-1.233741, -1.082936, -0.6916934, 1, 1, 1, 1, 1,
-1.223271, -0.3658585, -1.755406, 1, 1, 1, 1, 1,
-1.21923, -2.103939, -2.614543, 1, 1, 1, 1, 1,
-1.2103, -0.3170825, -3.054414, 1, 1, 1, 1, 1,
-1.210046, -0.442872, -3.416907, 1, 1, 1, 1, 1,
-1.206738, -1.144795, -3.04144, 1, 1, 1, 1, 1,
-1.204214, 1.071432, 0.003090139, 0, 0, 1, 1, 1,
-1.203655, -1.486082, -2.084655, 1, 0, 0, 1, 1,
-1.197602, 1.397601, -2.169082, 1, 0, 0, 1, 1,
-1.196762, 0.31432, -0.2725926, 1, 0, 0, 1, 1,
-1.187022, -0.1652602, -1.283149, 1, 0, 0, 1, 1,
-1.184092, -0.5483697, -3.369077, 1, 0, 0, 1, 1,
-1.181482, -0.3103432, -0.2385977, 0, 0, 0, 1, 1,
-1.17604, -0.4234153, -2.647448, 0, 0, 0, 1, 1,
-1.163183, -0.02666724, -0.9924857, 0, 0, 0, 1, 1,
-1.155476, 0.7509438, -1.278269, 0, 0, 0, 1, 1,
-1.153127, -0.2263181, -2.00457, 0, 0, 0, 1, 1,
-1.147194, 0.1940032, -0.602177, 0, 0, 0, 1, 1,
-1.134387, 1.281415, -1.719993, 0, 0, 0, 1, 1,
-1.107308, -0.4614732, -0.5090479, 1, 1, 1, 1, 1,
-1.101634, 0.5600693, -0.9301265, 1, 1, 1, 1, 1,
-1.099646, 0.9963793, -0.3802458, 1, 1, 1, 1, 1,
-1.098117, 0.1372693, -1.30176, 1, 1, 1, 1, 1,
-1.093747, 0.09108711, -2.896546, 1, 1, 1, 1, 1,
-1.086723, -0.4457901, -2.747015, 1, 1, 1, 1, 1,
-1.07349, -0.3467979, -1.847563, 1, 1, 1, 1, 1,
-1.067929, 0.1990166, -0.8198456, 1, 1, 1, 1, 1,
-1.054094, 0.4935948, -0.4528108, 1, 1, 1, 1, 1,
-1.050965, 0.0525586, -2.671279, 1, 1, 1, 1, 1,
-1.039851, 0.4289245, -0.9791247, 1, 1, 1, 1, 1,
-1.034225, 0.6896861, 0.04457642, 1, 1, 1, 1, 1,
-1.029134, -0.5791691, -2.164707, 1, 1, 1, 1, 1,
-1.025304, 1.086247, -0.6649757, 1, 1, 1, 1, 1,
-1.023525, 1.33811, -0.6800362, 1, 1, 1, 1, 1,
-1.012902, -0.6703844, -2.543459, 0, 0, 1, 1, 1,
-1.011068, 0.1970163, -1.752601, 1, 0, 0, 1, 1,
-1.007494, 0.5692424, -1.042796, 1, 0, 0, 1, 1,
-1.005788, -0.8187601, -1.51887, 1, 0, 0, 1, 1,
-1.003037, -0.8176599, -1.798108, 1, 0, 0, 1, 1,
-0.9991813, 0.8000945, -0.9629438, 1, 0, 0, 1, 1,
-0.9989144, -1.845139, -3.313672, 0, 0, 0, 1, 1,
-0.9953024, 0.9255508, -0.9454207, 0, 0, 0, 1, 1,
-0.9887481, -1.278855, -3.646943, 0, 0, 0, 1, 1,
-0.9850338, 0.1135352, -2.57992, 0, 0, 0, 1, 1,
-0.9714206, 0.1078945, -2.258117, 0, 0, 0, 1, 1,
-0.9684411, -0.3429314, -0.6881923, 0, 0, 0, 1, 1,
-0.9681431, 1.277609, -1.330523, 0, 0, 0, 1, 1,
-0.9679308, 0.9762846, -0.9388599, 1, 1, 1, 1, 1,
-0.9650771, -1.172328, -1.850859, 1, 1, 1, 1, 1,
-0.9640102, -0.4283272, -1.559818, 1, 1, 1, 1, 1,
-0.9638423, 0.8870251, 0.8953767, 1, 1, 1, 1, 1,
-0.9630559, -0.9432409, -2.013401, 1, 1, 1, 1, 1,
-0.9614666, -0.2798284, -1.546161, 1, 1, 1, 1, 1,
-0.957123, -0.5827969, -2.242422, 1, 1, 1, 1, 1,
-0.9552314, 1.406708, -2.240427, 1, 1, 1, 1, 1,
-0.9537776, -0.111656, -2.101241, 1, 1, 1, 1, 1,
-0.9524437, 0.5778309, -1.753338, 1, 1, 1, 1, 1,
-0.9516862, -0.8682135, -1.738846, 1, 1, 1, 1, 1,
-0.9492207, -1.160574, -2.649726, 1, 1, 1, 1, 1,
-0.9464481, -0.03069638, -2.584181, 1, 1, 1, 1, 1,
-0.9439526, -0.2857194, -2.169363, 1, 1, 1, 1, 1,
-0.9407471, 0.2200036, -1.043737, 1, 1, 1, 1, 1,
-0.9406919, -1.612953, -1.659695, 0, 0, 1, 1, 1,
-0.9367698, -0.9877658, -1.988809, 1, 0, 0, 1, 1,
-0.9321377, -1.766061, -3.391361, 1, 0, 0, 1, 1,
-0.9223488, -0.22797, -2.669354, 1, 0, 0, 1, 1,
-0.918812, 0.7646412, -2.193862, 1, 0, 0, 1, 1,
-0.9157995, -0.5138189, -2.899203, 1, 0, 0, 1, 1,
-0.914661, -0.5861388, -2.621123, 0, 0, 0, 1, 1,
-0.9112938, 0.438667, -2.27952, 0, 0, 0, 1, 1,
-0.8965911, 1.069526, -0.2324108, 0, 0, 0, 1, 1,
-0.8958871, -0.8742178, -3.471897, 0, 0, 0, 1, 1,
-0.893574, -0.6242049, -0.958834, 0, 0, 0, 1, 1,
-0.8919347, -0.7632567, -3.222986, 0, 0, 0, 1, 1,
-0.8916691, -1.511718, -2.648166, 0, 0, 0, 1, 1,
-0.8859478, -0.4233901, -0.5517781, 1, 1, 1, 1, 1,
-0.8807599, -0.7643989, -1.672462, 1, 1, 1, 1, 1,
-0.8805476, 0.7467765, -0.9899905, 1, 1, 1, 1, 1,
-0.8784457, 0.6467651, -1.511689, 1, 1, 1, 1, 1,
-0.8758837, -1.858246, -1.47722, 1, 1, 1, 1, 1,
-0.8730991, 0.3452902, -1.448672, 1, 1, 1, 1, 1,
-0.8701831, 1.280873, -0.2436298, 1, 1, 1, 1, 1,
-0.8624544, 1.362957, -1.206973, 1, 1, 1, 1, 1,
-0.8599076, -0.6271747, -1.445517, 1, 1, 1, 1, 1,
-0.8553304, -0.07498468, -3.640218, 1, 1, 1, 1, 1,
-0.8534385, -1.899943, -3.344599, 1, 1, 1, 1, 1,
-0.8484482, 0.626803, -1.745058, 1, 1, 1, 1, 1,
-0.848218, 0.07264179, -0.7582057, 1, 1, 1, 1, 1,
-0.8454419, 1.123531, -0.1695686, 1, 1, 1, 1, 1,
-0.8451098, 1.670403, -1.902649, 1, 1, 1, 1, 1,
-0.8449772, 1.254006, -1.087183, 0, 0, 1, 1, 1,
-0.8440509, 0.5134931, 0.03431719, 1, 0, 0, 1, 1,
-0.8436201, 0.4120233, -1.783013, 1, 0, 0, 1, 1,
-0.8352184, 0.5302272, 0.4448793, 1, 0, 0, 1, 1,
-0.8267984, 0.2496007, -2.162959, 1, 0, 0, 1, 1,
-0.8234212, 1.30105, -0.1760861, 1, 0, 0, 1, 1,
-0.8175091, 0.1697711, -0.7325544, 0, 0, 0, 1, 1,
-0.8091317, -1.497213, -2.888626, 0, 0, 0, 1, 1,
-0.8077051, -0.8683724, -0.7557143, 0, 0, 0, 1, 1,
-0.8036705, 0.8056076, -0.6675457, 0, 0, 0, 1, 1,
-0.8021835, -0.5317499, -3.644115, 0, 0, 0, 1, 1,
-0.7927099, 0.8034162, -1.395014, 0, 0, 0, 1, 1,
-0.7879854, 0.5697635, -0.3751965, 0, 0, 0, 1, 1,
-0.7867651, -0.2331395, -4.37607, 1, 1, 1, 1, 1,
-0.7826546, 2.044001, -1.131192, 1, 1, 1, 1, 1,
-0.7820899, -0.8707225, -2.717368, 1, 1, 1, 1, 1,
-0.7820274, -1.666706, -2.410523, 1, 1, 1, 1, 1,
-0.7742262, -0.5323052, -2.960721, 1, 1, 1, 1, 1,
-0.7637406, -0.4493504, -2.415931, 1, 1, 1, 1, 1,
-0.7633446, 0.4108942, -0.7173305, 1, 1, 1, 1, 1,
-0.7628655, -1.902145, -4.603918, 1, 1, 1, 1, 1,
-0.7628245, 1.134703, -0.4016895, 1, 1, 1, 1, 1,
-0.7627193, 0.7882429, -1.745457, 1, 1, 1, 1, 1,
-0.7572007, 2.470354, -1.880096, 1, 1, 1, 1, 1,
-0.7537434, -1.228049, -1.682697, 1, 1, 1, 1, 1,
-0.7529286, -1.684915, -1.972904, 1, 1, 1, 1, 1,
-0.750466, -0.429538, -0.9589533, 1, 1, 1, 1, 1,
-0.7448105, -0.8541925, -2.967108, 1, 1, 1, 1, 1,
-0.7431141, -0.1028346, -2.714427, 0, 0, 1, 1, 1,
-0.7428541, 2.356179, -0.3741029, 1, 0, 0, 1, 1,
-0.7387045, -1.29134, -2.398926, 1, 0, 0, 1, 1,
-0.7329109, 0.1755937, -2.357648, 1, 0, 0, 1, 1,
-0.725968, -0.3490297, 0.2854818, 1, 0, 0, 1, 1,
-0.7256473, -1.308911, -2.462635, 1, 0, 0, 1, 1,
-0.7252552, 0.7771199, -1.907825, 0, 0, 0, 1, 1,
-0.7252064, -1.438428, -1.673258, 0, 0, 0, 1, 1,
-0.7215251, -0.6735916, -2.152625, 0, 0, 0, 1, 1,
-0.7197377, -0.2038474, -1.739132, 0, 0, 0, 1, 1,
-0.7179589, 0.1462637, -1.08628, 0, 0, 0, 1, 1,
-0.7168129, 0.3659689, -2.061841, 0, 0, 0, 1, 1,
-0.7167147, 0.7075077, -1.245117, 0, 0, 0, 1, 1,
-0.7068794, -0.004256446, -1.559469, 1, 1, 1, 1, 1,
-0.7060288, 0.2572364, -2.11642, 1, 1, 1, 1, 1,
-0.7022009, -1.086341, -1.238312, 1, 1, 1, 1, 1,
-0.700703, -0.2822897, -1.226057, 1, 1, 1, 1, 1,
-0.7004148, -0.8353249, -1.600559, 1, 1, 1, 1, 1,
-0.6973559, -0.1152749, -2.296565, 1, 1, 1, 1, 1,
-0.6906778, -0.2392655, -0.5806517, 1, 1, 1, 1, 1,
-0.6841776, -0.5802754, -1.828742, 1, 1, 1, 1, 1,
-0.6830286, 1.112304, 0.4205483, 1, 1, 1, 1, 1,
-0.6675506, 1.436105, 0.6206825, 1, 1, 1, 1, 1,
-0.6603731, -0.5494181, -2.110417, 1, 1, 1, 1, 1,
-0.655718, 0.6774964, -1.590524, 1, 1, 1, 1, 1,
-0.6531184, 0.8892726, -0.4259665, 1, 1, 1, 1, 1,
-0.6525818, -1.788832, -1.453579, 1, 1, 1, 1, 1,
-0.649359, -1.257622, -2.504678, 1, 1, 1, 1, 1,
-0.6444448, 0.9389589, 0.8072439, 0, 0, 1, 1, 1,
-0.6393744, 0.6915515, -1.029627, 1, 0, 0, 1, 1,
-0.6377206, 1.287915, -1.667026, 1, 0, 0, 1, 1,
-0.6376597, 0.2890331, -1.680084, 1, 0, 0, 1, 1,
-0.6353204, -1.527036, -3.0387, 1, 0, 0, 1, 1,
-0.6340675, 0.544113, 0.3365399, 1, 0, 0, 1, 1,
-0.6262035, 0.8479747, -2.119322, 0, 0, 0, 1, 1,
-0.6225622, 0.4177943, -0.7544667, 0, 0, 0, 1, 1,
-0.6222247, -0.61526, -2.947974, 0, 0, 0, 1, 1,
-0.6217136, 0.5716087, -2.132998, 0, 0, 0, 1, 1,
-0.6176936, 0.9365826, -0.9349983, 0, 0, 0, 1, 1,
-0.617296, -0.0358624, -2.968322, 0, 0, 0, 1, 1,
-0.6167928, 0.05620156, -0.5450539, 0, 0, 0, 1, 1,
-0.6136881, -1.156017, -3.135921, 1, 1, 1, 1, 1,
-0.613591, 0.5655865, -1.53667, 1, 1, 1, 1, 1,
-0.6114016, -0.7321037, -2.803273, 1, 1, 1, 1, 1,
-0.6101829, -0.3713605, -1.387779, 1, 1, 1, 1, 1,
-0.6074696, -1.966404, -3.141992, 1, 1, 1, 1, 1,
-0.6049581, -0.3872545, -2.779047, 1, 1, 1, 1, 1,
-0.6017542, 0.3363442, -1.628554, 1, 1, 1, 1, 1,
-0.5991979, -0.7764705, -2.790045, 1, 1, 1, 1, 1,
-0.5965622, -0.1457701, 0.1182994, 1, 1, 1, 1, 1,
-0.5958388, -0.4778398, -3.286312, 1, 1, 1, 1, 1,
-0.5953199, 0.04860421, -0.006441399, 1, 1, 1, 1, 1,
-0.5946534, 0.607706, -0.5245582, 1, 1, 1, 1, 1,
-0.5888498, 0.1431093, -0.08260273, 1, 1, 1, 1, 1,
-0.5862689, 1.210479, -1.012001, 1, 1, 1, 1, 1,
-0.5747617, 1.114855, -1.183417, 1, 1, 1, 1, 1,
-0.5739778, -1.039835, -2.804677, 0, 0, 1, 1, 1,
-0.5720115, 2.045088, -0.06186689, 1, 0, 0, 1, 1,
-0.5716971, 0.411521, 0.4009033, 1, 0, 0, 1, 1,
-0.5710208, 0.1109255, -2.084455, 1, 0, 0, 1, 1,
-0.5692323, -0.5983876, -3.998898, 1, 0, 0, 1, 1,
-0.5637079, -0.564747, -3.167066, 1, 0, 0, 1, 1,
-0.5558591, 0.2905525, -2.544405, 0, 0, 0, 1, 1,
-0.5534898, -0.3004687, -2.069584, 0, 0, 0, 1, 1,
-0.5498011, -1.009474, -3.913292, 0, 0, 0, 1, 1,
-0.5496719, 0.5570828, -1.526333, 0, 0, 0, 1, 1,
-0.5485641, 1.630804, 0.1021372, 0, 0, 0, 1, 1,
-0.5475719, -0.2013542, -1.598246, 0, 0, 0, 1, 1,
-0.5460616, -0.3308991, -1.818498, 0, 0, 0, 1, 1,
-0.5448665, 1.07267, -1.8041, 1, 1, 1, 1, 1,
-0.5405539, 1.12682, -2.234211, 1, 1, 1, 1, 1,
-0.5377221, -0.96267, -3.11991, 1, 1, 1, 1, 1,
-0.5370516, 0.6257312, -0.8103664, 1, 1, 1, 1, 1,
-0.5333457, -0.05361143, -1.077623, 1, 1, 1, 1, 1,
-0.5314804, 0.0687098, -0.8469376, 1, 1, 1, 1, 1,
-0.5294229, -0.8469028, -1.869942, 1, 1, 1, 1, 1,
-0.5285138, 0.2423788, -1.389482, 1, 1, 1, 1, 1,
-0.5264623, -0.8742712, -4.556051, 1, 1, 1, 1, 1,
-0.5233323, -2.566499, -4.019502, 1, 1, 1, 1, 1,
-0.5206746, 1.322517, -0.1603892, 1, 1, 1, 1, 1,
-0.5200031, 0.6351735, -0.009036537, 1, 1, 1, 1, 1,
-0.5185417, -0.3663424, -0.6402096, 1, 1, 1, 1, 1,
-0.5177663, -1.736084, -3.604905, 1, 1, 1, 1, 1,
-0.5169259, 2.685196, -1.061479, 1, 1, 1, 1, 1,
-0.5148943, 0.608771, -0.1851667, 0, 0, 1, 1, 1,
-0.5045279, -0.7340087, -1.920579, 1, 0, 0, 1, 1,
-0.5042099, -0.7782056, -1.17929, 1, 0, 0, 1, 1,
-0.5038555, -0.6207427, -2.332017, 1, 0, 0, 1, 1,
-0.5013294, 0.6253006, 0.4451723, 1, 0, 0, 1, 1,
-0.4990534, -1.454183, -2.196941, 1, 0, 0, 1, 1,
-0.4978759, 0.3888768, 0.5953853, 0, 0, 0, 1, 1,
-0.4973511, 2.131896, 0.27686, 0, 0, 0, 1, 1,
-0.4947342, -1.173478, -3.415679, 0, 0, 0, 1, 1,
-0.4944261, -0.1872838, -1.379436, 0, 0, 0, 1, 1,
-0.4938402, 0.1486918, -0.8782247, 0, 0, 0, 1, 1,
-0.4876974, -0.6697124, -2.046896, 0, 0, 0, 1, 1,
-0.4833021, 0.1231396, -1.158658, 0, 0, 0, 1, 1,
-0.4788476, 0.3375238, -2.53261, 1, 1, 1, 1, 1,
-0.4777029, -0.7201381, -3.258197, 1, 1, 1, 1, 1,
-0.4770346, -0.003407777, -0.9333344, 1, 1, 1, 1, 1,
-0.4757385, 0.5871218, -0.6380342, 1, 1, 1, 1, 1,
-0.4701338, -0.3525167, -1.850286, 1, 1, 1, 1, 1,
-0.4695522, 1.073401, -1.248286, 1, 1, 1, 1, 1,
-0.4650622, 0.07057541, -0.05926041, 1, 1, 1, 1, 1,
-0.4628819, 1.444288, 0.8208003, 1, 1, 1, 1, 1,
-0.4615944, -0.313782, -2.737875, 1, 1, 1, 1, 1,
-0.4576777, -1.15603, -3.123597, 1, 1, 1, 1, 1,
-0.4533021, -1.950853, -3.1264, 1, 1, 1, 1, 1,
-0.4490972, -0.3138262, -0.8639252, 1, 1, 1, 1, 1,
-0.4473711, -0.3329258, -2.314659, 1, 1, 1, 1, 1,
-0.4462791, 0.6478396, -0.150279, 1, 1, 1, 1, 1,
-0.4427932, -0.1206242, -1.507626, 1, 1, 1, 1, 1,
-0.4381277, -2.111139, -2.410576, 0, 0, 1, 1, 1,
-0.4380655, 1.046212, -2.564362, 1, 0, 0, 1, 1,
-0.4375203, -1.772053, -3.771141, 1, 0, 0, 1, 1,
-0.4286722, 0.5995297, 1.562348, 1, 0, 0, 1, 1,
-0.4269707, 1.603763, 1.737674, 1, 0, 0, 1, 1,
-0.4262021, 0.1468155, -1.455692, 1, 0, 0, 1, 1,
-0.4206227, 0.3285558, 0.06388988, 0, 0, 0, 1, 1,
-0.4189863, 0.9660559, 0.421129, 0, 0, 0, 1, 1,
-0.4178489, -0.2181906, -0.9519637, 0, 0, 0, 1, 1,
-0.4168894, -0.8169852, -2.398961, 0, 0, 0, 1, 1,
-0.416226, 1.738366, 0.9303721, 0, 0, 0, 1, 1,
-0.415922, 0.9603741, -0.3902348, 0, 0, 0, 1, 1,
-0.4129581, -0.141691, -2.080909, 0, 0, 0, 1, 1,
-0.4098007, 0.423019, -0.3883176, 1, 1, 1, 1, 1,
-0.4092712, 1.551017, -0.6560442, 1, 1, 1, 1, 1,
-0.4040203, -0.03645059, -0.779868, 1, 1, 1, 1, 1,
-0.4029995, -1.935236, -1.511382, 1, 1, 1, 1, 1,
-0.4022523, 0.3866453, -2.763086, 1, 1, 1, 1, 1,
-0.3987982, -0.2516718, -1.163485, 1, 1, 1, 1, 1,
-0.3970311, -0.1451358, -2.775392, 1, 1, 1, 1, 1,
-0.3926087, 0.0586019, -1.246328, 1, 1, 1, 1, 1,
-0.3900574, 0.01567818, -1.126931, 1, 1, 1, 1, 1,
-0.3880194, -0.01808305, -0.7801597, 1, 1, 1, 1, 1,
-0.3879069, -1.043289, -2.914599, 1, 1, 1, 1, 1,
-0.3792623, -0.8727964, -2.641703, 1, 1, 1, 1, 1,
-0.3750462, -1.404827, -0.963415, 1, 1, 1, 1, 1,
-0.3744507, 1.50554, 0.6914988, 1, 1, 1, 1, 1,
-0.3723248, -1.2173, -2.632222, 1, 1, 1, 1, 1,
-0.3702758, -0.5771558, -1.38548, 0, 0, 1, 1, 1,
-0.370249, 0.8922576, 1.11499, 1, 0, 0, 1, 1,
-0.3644527, -2.408312, -3.170142, 1, 0, 0, 1, 1,
-0.3628171, -0.5671139, -2.866049, 1, 0, 0, 1, 1,
-0.362645, -0.710998, -3.62673, 1, 0, 0, 1, 1,
-0.3623581, -0.05056066, -2.019814, 1, 0, 0, 1, 1,
-0.3615071, -0.3352344, -3.516945, 0, 0, 0, 1, 1,
-0.3600705, 1.480745, 0.1711509, 0, 0, 0, 1, 1,
-0.3560353, -0.5333045, -3.270918, 0, 0, 0, 1, 1,
-0.3538826, -0.1613089, -0.6588897, 0, 0, 0, 1, 1,
-0.3535935, -0.06261013, -2.936613, 0, 0, 0, 1, 1,
-0.3520181, -0.584219, -2.311376, 0, 0, 0, 1, 1,
-0.3513358, 1.44711, 0.5211189, 0, 0, 0, 1, 1,
-0.3452138, -1.358718, -3.900719, 1, 1, 1, 1, 1,
-0.3441803, -0.1623417, -1.053945, 1, 1, 1, 1, 1,
-0.3433585, 0.6766223, -0.9710397, 1, 1, 1, 1, 1,
-0.3428752, 0.1154035, -0.243375, 1, 1, 1, 1, 1,
-0.3416073, -0.8581308, -2.670289, 1, 1, 1, 1, 1,
-0.3413473, 0.9375509, 0.31639, 1, 1, 1, 1, 1,
-0.3408711, 0.271693, 0.2912597, 1, 1, 1, 1, 1,
-0.339236, -0.9315033, -3.177907, 1, 1, 1, 1, 1,
-0.3343117, 0.4214782, -0.3825212, 1, 1, 1, 1, 1,
-0.3261348, 2.255842, -2.33378, 1, 1, 1, 1, 1,
-0.3254741, -0.2730789, -2.200038, 1, 1, 1, 1, 1,
-0.3201705, 0.08086186, -1.186419, 1, 1, 1, 1, 1,
-0.3199393, -1.990762, -3.932743, 1, 1, 1, 1, 1,
-0.3157537, 0.8234032, -1.449474, 1, 1, 1, 1, 1,
-0.3114822, 1.989453, -0.2611032, 1, 1, 1, 1, 1,
-0.3092242, 0.7798169, -0.3357162, 0, 0, 1, 1, 1,
-0.3084793, -0.3999088, -1.895811, 1, 0, 0, 1, 1,
-0.3030645, -0.7337073, -3.947097, 1, 0, 0, 1, 1,
-0.3011879, 1.55553, -2.552818, 1, 0, 0, 1, 1,
-0.3008746, 0.7860125, -0.5061263, 1, 0, 0, 1, 1,
-0.2951589, 0.7800093, -0.1100836, 1, 0, 0, 1, 1,
-0.289259, -0.5356872, -2.717063, 0, 0, 0, 1, 1,
-0.287807, -0.3763081, -1.793908, 0, 0, 0, 1, 1,
-0.2861877, -0.4277579, -2.238184, 0, 0, 0, 1, 1,
-0.2860477, -0.4570647, -2.740118, 0, 0, 0, 1, 1,
-0.27914, -0.1959951, -1.842233, 0, 0, 0, 1, 1,
-0.2783458, -0.01494955, -1.111181, 0, 0, 0, 1, 1,
-0.2721409, 0.5025272, 1.680536, 0, 0, 0, 1, 1,
-0.2717717, -1.784586, -3.814545, 1, 1, 1, 1, 1,
-0.2713541, -0.3882286, -2.989473, 1, 1, 1, 1, 1,
-0.2661462, -0.399159, -2.674316, 1, 1, 1, 1, 1,
-0.258994, -1.045694, -2.098049, 1, 1, 1, 1, 1,
-0.2585002, 0.3366081, -0.0372804, 1, 1, 1, 1, 1,
-0.2574908, -1.687826, -3.19521, 1, 1, 1, 1, 1,
-0.2543962, 0.2428109, 0.4809524, 1, 1, 1, 1, 1,
-0.2526992, 1.156815, -1.077769, 1, 1, 1, 1, 1,
-0.2485757, -0.6591749, -0.9333534, 1, 1, 1, 1, 1,
-0.2460118, -2.006419, -3.497364, 1, 1, 1, 1, 1,
-0.2343207, -1.259059, -3.451692, 1, 1, 1, 1, 1,
-0.2338969, 0.7328133, -1.029667, 1, 1, 1, 1, 1,
-0.2324836, -2.135761, -3.675443, 1, 1, 1, 1, 1,
-0.2265813, -0.2230403, -1.675825, 1, 1, 1, 1, 1,
-0.2192944, 0.4505115, -0.5832676, 1, 1, 1, 1, 1,
-0.2065004, 1.081388, -0.3912422, 0, 0, 1, 1, 1,
-0.2049556, -1.778846, -2.251303, 1, 0, 0, 1, 1,
-0.2035245, 0.5213512, -0.532366, 1, 0, 0, 1, 1,
-0.2030234, -0.4914933, -3.314823, 1, 0, 0, 1, 1,
-0.1867325, -0.3406205, -2.505461, 1, 0, 0, 1, 1,
-0.1867012, 0.3590306, 0.2750124, 1, 0, 0, 1, 1,
-0.1856891, -1.141802, -2.448009, 0, 0, 0, 1, 1,
-0.1848386, 0.7185513, -1.453226, 0, 0, 0, 1, 1,
-0.1822613, 0.7261264, -0.2168148, 0, 0, 0, 1, 1,
-0.1807177, -0.01756087, -3.964468, 0, 0, 0, 1, 1,
-0.1806399, -0.1395573, -1.647165, 0, 0, 0, 1, 1,
-0.179967, 1.652628, -1.640188, 0, 0, 0, 1, 1,
-0.1757865, -0.2218014, -1.756806, 0, 0, 0, 1, 1,
-0.1753713, 0.821972, -1.324298, 1, 1, 1, 1, 1,
-0.17469, -2.164651, -3.0111, 1, 1, 1, 1, 1,
-0.1740278, -0.8492334, -1.833915, 1, 1, 1, 1, 1,
-0.1609853, -0.5250448, -1.63121, 1, 1, 1, 1, 1,
-0.1533984, 1.068425, -0.4658295, 1, 1, 1, 1, 1,
-0.1507131, 1.571421, 0.5974061, 1, 1, 1, 1, 1,
-0.1478736, 0.582705, 0.1818319, 1, 1, 1, 1, 1,
-0.1466628, -0.8198949, -2.595884, 1, 1, 1, 1, 1,
-0.14535, 1.624722, 0.08535916, 1, 1, 1, 1, 1,
-0.1431682, 1.135046, -2.227812, 1, 1, 1, 1, 1,
-0.1430557, 0.2749757, 0.09990793, 1, 1, 1, 1, 1,
-0.1424556, 0.1653578, -1.439095, 1, 1, 1, 1, 1,
-0.1381788, -1.35692, -4.140202, 1, 1, 1, 1, 1,
-0.1379536, -0.2310488, -3.179636, 1, 1, 1, 1, 1,
-0.1270234, -1.490641, -2.939064, 1, 1, 1, 1, 1,
-0.1209134, 0.6778659, -0.09681546, 0, 0, 1, 1, 1,
-0.1198467, 0.6027498, -0.34085, 1, 0, 0, 1, 1,
-0.119516, 0.1473865, -1.55867, 1, 0, 0, 1, 1,
-0.1185027, 0.6788177, 1.627802, 1, 0, 0, 1, 1,
-0.1151355, 0.7352694, 1.614548, 1, 0, 0, 1, 1,
-0.1142431, -0.5172986, -2.882352, 1, 0, 0, 1, 1,
-0.1110565, -0.4546646, -3.753567, 0, 0, 0, 1, 1,
-0.1095126, -0.6592487, -4.887628, 0, 0, 0, 1, 1,
-0.1083597, -0.300884, -2.470814, 0, 0, 0, 1, 1,
-0.09293083, 0.9046628, 1.660425, 0, 0, 0, 1, 1,
-0.09031148, 0.4509374, -1.317315, 0, 0, 0, 1, 1,
-0.08792915, 1.797516, 1.464211, 0, 0, 0, 1, 1,
-0.08788509, -0.1274656, -1.169589, 0, 0, 0, 1, 1,
-0.0834931, 1.524563, -2.600348, 1, 1, 1, 1, 1,
-0.08329823, -0.4269991, -4.22918, 1, 1, 1, 1, 1,
-0.07818016, 1.258132, -1.70134, 1, 1, 1, 1, 1,
-0.07706989, -0.8021796, -2.810869, 1, 1, 1, 1, 1,
-0.07336858, 1.310697, -0.696283, 1, 1, 1, 1, 1,
-0.07019019, -2.300649, -0.8519553, 1, 1, 1, 1, 1,
-0.06868996, 0.03344485, -1.54747, 1, 1, 1, 1, 1,
-0.0630943, 1.711338, -0.9786184, 1, 1, 1, 1, 1,
-0.06172042, -0.1255028, -3.139211, 1, 1, 1, 1, 1,
-0.06137713, -0.1634143, -3.266833, 1, 1, 1, 1, 1,
-0.056114, -1.952756, -3.198994, 1, 1, 1, 1, 1,
-0.05472345, -0.8980341, -3.78565, 1, 1, 1, 1, 1,
-0.05424771, 1.236836, -1.076134, 1, 1, 1, 1, 1,
-0.05283128, -0.1120965, -2.791114, 1, 1, 1, 1, 1,
-0.05265944, 0.8867578, -0.9571723, 1, 1, 1, 1, 1,
-0.05156467, -0.3061036, -6.082076, 0, 0, 1, 1, 1,
-0.04898324, 0.0946615, -0.4817887, 1, 0, 0, 1, 1,
-0.04213438, -1.008045, -3.818727, 1, 0, 0, 1, 1,
-0.0365228, 0.7625764, 0.3280095, 1, 0, 0, 1, 1,
-0.03576959, 0.3049711, 0.1904978, 1, 0, 0, 1, 1,
-0.0329753, -0.7106724, -3.269684, 1, 0, 0, 1, 1,
-0.02863854, -0.4642495, -3.339205, 0, 0, 0, 1, 1,
-0.02790337, -0.3042656, -2.985095, 0, 0, 0, 1, 1,
-0.02750564, 0.9351028, -0.247445, 0, 0, 0, 1, 1,
-0.02705482, 1.391329, 0.8452013, 0, 0, 0, 1, 1,
-0.02682421, -0.249527, -1.149801, 0, 0, 0, 1, 1,
-0.02551944, 0.7186638, -0.8582878, 0, 0, 0, 1, 1,
-0.02108362, 0.965335, 1.999927, 0, 0, 0, 1, 1,
-0.01807296, 1.256727, 1.68751, 1, 1, 1, 1, 1,
-0.01300543, 0.7717635, 0.7293978, 1, 1, 1, 1, 1,
-0.01204949, 1.560061, -1.48593, 1, 1, 1, 1, 1,
-0.007141212, -2.340604, -1.704911, 1, 1, 1, 1, 1,
-0.00675667, 0.731762, -0.5420157, 1, 1, 1, 1, 1,
-0.0036306, -0.03888424, -2.701779, 1, 1, 1, 1, 1,
0.0007094381, -1.127919, 2.818108, 1, 1, 1, 1, 1,
0.008514698, 0.8910401, -0.7912915, 1, 1, 1, 1, 1,
0.009423842, 0.2476381, 0.9486765, 1, 1, 1, 1, 1,
0.009996294, 1.31993, -0.8437939, 1, 1, 1, 1, 1,
0.01314272, 0.2411789, -0.3912388, 1, 1, 1, 1, 1,
0.01424529, 0.04889686, -0.4101669, 1, 1, 1, 1, 1,
0.01500059, 0.4015842, 1.781091, 1, 1, 1, 1, 1,
0.01729534, 0.6187534, 0.7407838, 1, 1, 1, 1, 1,
0.02052578, 0.09602025, 1.677922, 1, 1, 1, 1, 1,
0.02825579, 0.295132, 0.01462855, 0, 0, 1, 1, 1,
0.02832857, -0.2289866, 4.286168, 1, 0, 0, 1, 1,
0.03003214, -0.8915215, 3.103035, 1, 0, 0, 1, 1,
0.03307839, 1.216829, -1.478748, 1, 0, 0, 1, 1,
0.03784722, 0.5328425, -0.8078121, 1, 0, 0, 1, 1,
0.042471, 1.6556, 0.5736576, 1, 0, 0, 1, 1,
0.04825606, 1.302028, -0.2330387, 0, 0, 0, 1, 1,
0.05113024, 0.5429991, 0.9985987, 0, 0, 0, 1, 1,
0.05836951, -1.353877, 1.570739, 0, 0, 0, 1, 1,
0.06055458, 0.3201562, 0.3197315, 0, 0, 0, 1, 1,
0.06635163, 0.3184775, 2.362762, 0, 0, 0, 1, 1,
0.06747519, 0.5554428, -1.410396, 0, 0, 0, 1, 1,
0.0681173, 0.5772814, 2.255709, 0, 0, 0, 1, 1,
0.0681854, 0.3592783, 1.176728, 1, 1, 1, 1, 1,
0.07059189, 0.2270583, 0.5543997, 1, 1, 1, 1, 1,
0.07212906, -0.7424248, 4.509884, 1, 1, 1, 1, 1,
0.07422122, 1.343377, 0.891485, 1, 1, 1, 1, 1,
0.07589131, -1.69545, 2.799246, 1, 1, 1, 1, 1,
0.08062955, -0.4336682, 1.396156, 1, 1, 1, 1, 1,
0.08105922, 2.19034, -1.470314, 1, 1, 1, 1, 1,
0.08215779, -1.493653, 4.120107, 1, 1, 1, 1, 1,
0.08373044, 0.06158713, 1.904731, 1, 1, 1, 1, 1,
0.08430167, -1.267411, 2.499291, 1, 1, 1, 1, 1,
0.08514613, -0.1352368, 2.557631, 1, 1, 1, 1, 1,
0.08784845, 0.6502429, -1.717782, 1, 1, 1, 1, 1,
0.08956964, -1.644585, 1.20612, 1, 1, 1, 1, 1,
0.09052428, -0.158824, 2.478903, 1, 1, 1, 1, 1,
0.09541858, -0.02514169, 1.196315, 1, 1, 1, 1, 1,
0.09845008, -0.7690188, 3.420442, 0, 0, 1, 1, 1,
0.0987957, -0.8751824, 2.488177, 1, 0, 0, 1, 1,
0.103078, -1.876141, 4.086743, 1, 0, 0, 1, 1,
0.1042864, -0.9003794, 3.099859, 1, 0, 0, 1, 1,
0.1062614, -2.221384, 2.75109, 1, 0, 0, 1, 1,
0.1067321, -0.9595808, 4.641461, 1, 0, 0, 1, 1,
0.1076807, -0.429982, 1.152702, 0, 0, 0, 1, 1,
0.1099693, -0.3462143, 2.910825, 0, 0, 0, 1, 1,
0.1135451, 0.4350001, 1.269719, 0, 0, 0, 1, 1,
0.1176378, -0.2330778, 2.292963, 0, 0, 0, 1, 1,
0.1185925, 0.1533508, 0.804687, 0, 0, 0, 1, 1,
0.118905, -0.4837726, 2.443464, 0, 0, 0, 1, 1,
0.1207011, 1.049641, 1.458295, 0, 0, 0, 1, 1,
0.1284021, 1.226511, -0.622506, 1, 1, 1, 1, 1,
0.1311969, 0.03185211, -0.2839837, 1, 1, 1, 1, 1,
0.1371085, 0.4092661, -0.5615793, 1, 1, 1, 1, 1,
0.1405841, -1.06073, 3.562776, 1, 1, 1, 1, 1,
0.1475619, -0.1619081, 3.498051, 1, 1, 1, 1, 1,
0.1487493, 0.7628133, 1.839374, 1, 1, 1, 1, 1,
0.1511956, -0.04904189, 3.064533, 1, 1, 1, 1, 1,
0.1512661, 0.3466064, 2.227114, 1, 1, 1, 1, 1,
0.1578166, 0.6104631, 0.139167, 1, 1, 1, 1, 1,
0.1645162, 1.107323, -2.40645, 1, 1, 1, 1, 1,
0.1671017, -2.465444, 1.977082, 1, 1, 1, 1, 1,
0.1694376, 0.1824317, 0.06289547, 1, 1, 1, 1, 1,
0.1763143, 3.04884, 1.055174, 1, 1, 1, 1, 1,
0.1769288, -2.08724, 5.092012, 1, 1, 1, 1, 1,
0.1787388, -0.362353, 1.30036, 1, 1, 1, 1, 1,
0.1796224, 0.7825284, -1.271224, 0, 0, 1, 1, 1,
0.1911771, -0.05718393, 0.69524, 1, 0, 0, 1, 1,
0.19229, 1.031673, -0.7120806, 1, 0, 0, 1, 1,
0.1955045, 0.626462, 0.7605014, 1, 0, 0, 1, 1,
0.1961927, -0.2769948, 1.730259, 1, 0, 0, 1, 1,
0.207606, -0.1252954, 3.805616, 1, 0, 0, 1, 1,
0.2077623, 0.8028685, 0.9083691, 0, 0, 0, 1, 1,
0.2137899, 0.4609883, -1.893657, 0, 0, 0, 1, 1,
0.2155815, -1.367792, 3.300618, 0, 0, 0, 1, 1,
0.2161392, -0.2175481, 2.601801, 0, 0, 0, 1, 1,
0.2273383, -0.9518938, 1.387605, 0, 0, 0, 1, 1,
0.2327012, -1.56551, 2.358235, 0, 0, 0, 1, 1,
0.2361996, 0.2826374, 2.427205, 0, 0, 0, 1, 1,
0.2392061, -1.052905, 3.586432, 1, 1, 1, 1, 1,
0.2399653, 1.178049, 1.322379, 1, 1, 1, 1, 1,
0.2430321, 1.578917, 2.35193, 1, 1, 1, 1, 1,
0.2441781, 0.7303679, 0.741076, 1, 1, 1, 1, 1,
0.2446839, -0.4936683, 3.349677, 1, 1, 1, 1, 1,
0.2460566, -1.272436, 2.73577, 1, 1, 1, 1, 1,
0.2532, -1.109481, 2.308316, 1, 1, 1, 1, 1,
0.2548557, 1.780193, 1.056289, 1, 1, 1, 1, 1,
0.2557356, 0.2867061, 3.400819, 1, 1, 1, 1, 1,
0.2562936, -0.2171079, 1.98417, 1, 1, 1, 1, 1,
0.2587893, 0.8156596, 0.9291921, 1, 1, 1, 1, 1,
0.2617452, -0.7383857, 3.520838, 1, 1, 1, 1, 1,
0.2626708, -1.471204, 5.377754, 1, 1, 1, 1, 1,
0.2683986, 0.2788411, 0.2270029, 1, 1, 1, 1, 1,
0.2767762, 0.6470236, 1.563399, 1, 1, 1, 1, 1,
0.2811372, 1.719579, 1.093971, 0, 0, 1, 1, 1,
0.2817316, -0.04888197, -0.07854564, 1, 0, 0, 1, 1,
0.2860582, 1.18129, 0.4802552, 1, 0, 0, 1, 1,
0.2892398, 1.494551, 0.9243634, 1, 0, 0, 1, 1,
0.2908237, 2.561738, -0.6164425, 1, 0, 0, 1, 1,
0.293585, -0.10524, 2.152003, 1, 0, 0, 1, 1,
0.2965015, -0.8282356, 3.072035, 0, 0, 0, 1, 1,
0.2985715, 0.2142606, 1.177896, 0, 0, 0, 1, 1,
0.3002909, 0.5481582, -0.05649516, 0, 0, 0, 1, 1,
0.3047706, 1.009583, 0.3392049, 0, 0, 0, 1, 1,
0.3068783, -0.9117314, 2.779632, 0, 0, 0, 1, 1,
0.3081943, -0.3927017, 3.236542, 0, 0, 0, 1, 1,
0.3097208, -1.308172, 3.780063, 0, 0, 0, 1, 1,
0.3105354, -1.741758, 2.626694, 1, 1, 1, 1, 1,
0.3174282, 1.371458, -0.324723, 1, 1, 1, 1, 1,
0.3185722, -1.141163, 1.554172, 1, 1, 1, 1, 1,
0.3190053, 0.1745065, 0.723286, 1, 1, 1, 1, 1,
0.326262, -1.01317, 2.931167, 1, 1, 1, 1, 1,
0.3266696, -1.255889, 3.587126, 1, 1, 1, 1, 1,
0.3287758, -0.3630782, 2.864364, 1, 1, 1, 1, 1,
0.3350513, -0.725197, 2.875885, 1, 1, 1, 1, 1,
0.3380224, -0.3090119, 4.012671, 1, 1, 1, 1, 1,
0.3416421, 0.6290852, 1.389305, 1, 1, 1, 1, 1,
0.3416795, 0.3845427, 2.220663, 1, 1, 1, 1, 1,
0.3417731, 0.3363245, 2.263695, 1, 1, 1, 1, 1,
0.3443184, -1.784196, 2.29738, 1, 1, 1, 1, 1,
0.3473989, -0.417256, 1.787523, 1, 1, 1, 1, 1,
0.3495007, 1.595749, 0.2775938, 1, 1, 1, 1, 1,
0.3506015, 0.1890564, 1.106888, 0, 0, 1, 1, 1,
0.3527063, 0.1791359, 2.418679, 1, 0, 0, 1, 1,
0.3542934, 0.1500711, 2.384642, 1, 0, 0, 1, 1,
0.3604692, 1.070333, -2.677299, 1, 0, 0, 1, 1,
0.3670441, 2.243938, 0.4948913, 1, 0, 0, 1, 1,
0.3676257, 0.661913, 2.96354, 1, 0, 0, 1, 1,
0.3747732, -0.2955345, 1.906155, 0, 0, 0, 1, 1,
0.3755698, 0.9242289, 2.352827, 0, 0, 0, 1, 1,
0.3829357, 0.9171907, 0.2655597, 0, 0, 0, 1, 1,
0.3834026, 1.492262, -1.877289, 0, 0, 0, 1, 1,
0.3877029, -1.549777, 2.668818, 0, 0, 0, 1, 1,
0.3900321, 0.9292402, 1.345854, 0, 0, 0, 1, 1,
0.3947137, -0.00641496, 1.608592, 0, 0, 0, 1, 1,
0.3954724, 0.8901164, 1.154952, 1, 1, 1, 1, 1,
0.3986258, -0.3264664, 3.553799, 1, 1, 1, 1, 1,
0.3987893, 0.07098427, 2.057776, 1, 1, 1, 1, 1,
0.3996781, -1.464645, 2.22664, 1, 1, 1, 1, 1,
0.4023679, 0.2996413, 1.92705, 1, 1, 1, 1, 1,
0.4032837, 0.01364732, 3.209263, 1, 1, 1, 1, 1,
0.4071926, -1.684517, 3.72622, 1, 1, 1, 1, 1,
0.4093388, -1.288918, 1.580792, 1, 1, 1, 1, 1,
0.4130299, 1.155648, -0.3675955, 1, 1, 1, 1, 1,
0.4171121, 0.01653909, 0.1198188, 1, 1, 1, 1, 1,
0.4227371, -0.03984823, 1.710654, 1, 1, 1, 1, 1,
0.4410562, -0.6167961, 2.214948, 1, 1, 1, 1, 1,
0.4431599, 1.964959, 0.1380422, 1, 1, 1, 1, 1,
0.4498912, 1.168023, -0.003753017, 1, 1, 1, 1, 1,
0.4500694, -1.117146, 5.2845, 1, 1, 1, 1, 1,
0.4512682, -0.396196, 1.944896, 0, 0, 1, 1, 1,
0.4547894, 0.3275778, 1.706499, 1, 0, 0, 1, 1,
0.4550684, -1.431478, 2.158763, 1, 0, 0, 1, 1,
0.4571425, 0.3200896, 0.1621169, 1, 0, 0, 1, 1,
0.4582682, -1.321419, 2.653309, 1, 0, 0, 1, 1,
0.4589423, -0.6662397, 0.9308849, 1, 0, 0, 1, 1,
0.4658664, -0.5608593, 1.322754, 0, 0, 0, 1, 1,
0.4714373, -0.5997989, 2.680287, 0, 0, 0, 1, 1,
0.4730007, 0.05527997, 1.745153, 0, 0, 0, 1, 1,
0.4780046, -2.884225, 1.975886, 0, 0, 0, 1, 1,
0.4784097, 1.576399, -1.434157, 0, 0, 0, 1, 1,
0.4786228, 0.7906072, -0.993556, 0, 0, 0, 1, 1,
0.4824283, -0.2775397, 1.34089, 0, 0, 0, 1, 1,
0.4899225, 0.2364721, 0.7803382, 1, 1, 1, 1, 1,
0.4911253, 0.5690822, -1.14918, 1, 1, 1, 1, 1,
0.4958955, 0.8239726, 0.5786365, 1, 1, 1, 1, 1,
0.4962164, -0.0287381, 2.869562, 1, 1, 1, 1, 1,
0.5005034, -0.3286905, 2.154877, 1, 1, 1, 1, 1,
0.5050084, -0.5376458, 2.625217, 1, 1, 1, 1, 1,
0.5083146, -0.3097174, 5.536086, 1, 1, 1, 1, 1,
0.5143998, -1.300657, 2.445876, 1, 1, 1, 1, 1,
0.5146963, 1.04862, 0.2661147, 1, 1, 1, 1, 1,
0.5189108, -1.09106, 2.544086, 1, 1, 1, 1, 1,
0.5191208, 0.7461115, -0.4528957, 1, 1, 1, 1, 1,
0.5288153, -0.1026135, 2.047422, 1, 1, 1, 1, 1,
0.5349496, -0.6941963, 1.497269, 1, 1, 1, 1, 1,
0.5394019, -0.3863976, 1.614419, 1, 1, 1, 1, 1,
0.5432076, -0.03593865, -0.3018627, 1, 1, 1, 1, 1,
0.5505745, 0.02531384, 1.023626, 0, 0, 1, 1, 1,
0.551892, -0.4192252, 3.286999, 1, 0, 0, 1, 1,
0.5520353, -0.0988458, 1.653702, 1, 0, 0, 1, 1,
0.5523284, -1.212767, 2.115632, 1, 0, 0, 1, 1,
0.5571577, 1.30258, 1.294517, 1, 0, 0, 1, 1,
0.5579618, -1.431108, 2.681504, 1, 0, 0, 1, 1,
0.5588396, 0.2430291, 1.929437, 0, 0, 0, 1, 1,
0.5658938, 1.709012, -0.5613205, 0, 0, 0, 1, 1,
0.5689123, -1.69552, 3.016391, 0, 0, 0, 1, 1,
0.578422, 0.6026318, 2.134275, 0, 0, 0, 1, 1,
0.5796751, -0.03578075, 2.237917, 0, 0, 0, 1, 1,
0.5825966, -1.14538, 2.150168, 0, 0, 0, 1, 1,
0.5852586, 0.1299442, 0.128195, 0, 0, 0, 1, 1,
0.5911971, -1.322957, 4.038849, 1, 1, 1, 1, 1,
0.5926459, -1.806228, 2.838394, 1, 1, 1, 1, 1,
0.5943236, -0.9545729, 1.388038, 1, 1, 1, 1, 1,
0.602329, -0.4820007, 0.4340982, 1, 1, 1, 1, 1,
0.6099108, 1.966184, -1.102504, 1, 1, 1, 1, 1,
0.6195714, -1.14684, 2.462667, 1, 1, 1, 1, 1,
0.6263261, -0.1164527, 3.015208, 1, 1, 1, 1, 1,
0.6276463, 0.324279, -0.4679718, 1, 1, 1, 1, 1,
0.6323286, -0.7117037, 3.251467, 1, 1, 1, 1, 1,
0.6363367, 0.1946012, 1.134941, 1, 1, 1, 1, 1,
0.6368011, -0.6626725, 2.392591, 1, 1, 1, 1, 1,
0.6374646, -0.9829003, 3.261335, 1, 1, 1, 1, 1,
0.6408975, 2.346238, -0.1903024, 1, 1, 1, 1, 1,
0.6450258, -1.833328, 2.427779, 1, 1, 1, 1, 1,
0.6480317, -1.094831, 3.74538, 1, 1, 1, 1, 1,
0.6504132, -1.050885, 3.539417, 0, 0, 1, 1, 1,
0.6512192, 0.4663289, 0.3179922, 1, 0, 0, 1, 1,
0.651406, 2.117447, 1.489516, 1, 0, 0, 1, 1,
0.659396, -0.9278657, 3.157133, 1, 0, 0, 1, 1,
0.6629618, -1.589006, 2.210849, 1, 0, 0, 1, 1,
0.6659797, -0.7786063, 2.241729, 1, 0, 0, 1, 1,
0.6666153, 1.100941, -0.9001167, 0, 0, 0, 1, 1,
0.6691545, 1.011369, -0.2158396, 0, 0, 0, 1, 1,
0.6728622, -0.02687972, 2.729569, 0, 0, 0, 1, 1,
0.6729331, 0.1750068, 2.904854, 0, 0, 0, 1, 1,
0.6741509, -0.8194493, 2.447444, 0, 0, 0, 1, 1,
0.6742218, 1.32625, 1.748731, 0, 0, 0, 1, 1,
0.6764307, -1.050508, 4.14637, 0, 0, 0, 1, 1,
0.6765857, 0.2712446, 2.202534, 1, 1, 1, 1, 1,
0.6804076, 0.3776953, 0.4733471, 1, 1, 1, 1, 1,
0.6834549, 0.02936997, 1.957129, 1, 1, 1, 1, 1,
0.6865402, -0.4219645, 1.894155, 1, 1, 1, 1, 1,
0.6884708, -0.7200488, 2.762436, 1, 1, 1, 1, 1,
0.6943159, 0.1425807, -1.04583, 1, 1, 1, 1, 1,
0.6945041, -0.4886614, 1.959413, 1, 1, 1, 1, 1,
0.6955408, 1.10828, 2.408776, 1, 1, 1, 1, 1,
0.6984651, 0.3054789, 0.7720329, 1, 1, 1, 1, 1,
0.6986206, -0.3377729, 1.705223, 1, 1, 1, 1, 1,
0.6989253, -1.694313, 1.838058, 1, 1, 1, 1, 1,
0.6993386, -0.08661408, 1.83776, 1, 1, 1, 1, 1,
0.6998, -0.9298189, 2.829214, 1, 1, 1, 1, 1,
0.7037809, 1.252915, 0.01399238, 1, 1, 1, 1, 1,
0.7050404, -0.9918146, 1.086983, 1, 1, 1, 1, 1,
0.7080473, 0.4409617, -0.7066317, 0, 0, 1, 1, 1,
0.7086669, 1.035929, 0.3664757, 1, 0, 0, 1, 1,
0.7157961, -0.5122139, 1.697928, 1, 0, 0, 1, 1,
0.7175238, -0.5087425, 2.941257, 1, 0, 0, 1, 1,
0.7181994, -0.5119491, 1.832252, 1, 0, 0, 1, 1,
0.7220642, -0.3031501, 2.737288, 1, 0, 0, 1, 1,
0.7247665, 0.8059381, 0.04782136, 0, 0, 0, 1, 1,
0.7283719, -1.814692, 3.801977, 0, 0, 0, 1, 1,
0.7340367, 1.357721, 0.3848484, 0, 0, 0, 1, 1,
0.7341599, -0.431775, 2.597645, 0, 0, 0, 1, 1,
0.7365965, 0.4209841, 0.4802128, 0, 0, 0, 1, 1,
0.7411873, -0.5550117, 1.348466, 0, 0, 0, 1, 1,
0.7412697, 1.167241, -0.009905519, 0, 0, 0, 1, 1,
0.7432762, 1.026545, 1.577403, 1, 1, 1, 1, 1,
0.7455756, 1.568792, 0.9874529, 1, 1, 1, 1, 1,
0.7478212, -0.3987783, 1.476741, 1, 1, 1, 1, 1,
0.7501749, -1.03809, 1.421623, 1, 1, 1, 1, 1,
0.7526579, 0.4567962, 1.528907, 1, 1, 1, 1, 1,
0.7594241, 0.7490577, 1.305206, 1, 1, 1, 1, 1,
0.7616835, -1.291615, 3.808728, 1, 1, 1, 1, 1,
0.7629086, 0.2527612, -0.7682261, 1, 1, 1, 1, 1,
0.7680547, 0.3149849, 0.3088216, 1, 1, 1, 1, 1,
0.7684204, -0.1542611, 2.489056, 1, 1, 1, 1, 1,
0.7780623, -0.8621339, 1.530522, 1, 1, 1, 1, 1,
0.7782624, 0.04955765, 2.340512, 1, 1, 1, 1, 1,
0.7808366, -0.8798673, 2.264758, 1, 1, 1, 1, 1,
0.7839268, -1.012399, 3.75603, 1, 1, 1, 1, 1,
0.7896588, 0.3740988, 0.9846447, 1, 1, 1, 1, 1,
0.7940373, 0.5751504, 0.5730219, 0, 0, 1, 1, 1,
0.7960915, 0.0138518, 3.730457, 1, 0, 0, 1, 1,
0.8040507, 1.825695, 0.2178798, 1, 0, 0, 1, 1,
0.8065935, -1.553268, 0.6224995, 1, 0, 0, 1, 1,
0.8071035, 0.1290534, 0.6529542, 1, 0, 0, 1, 1,
0.8122158, -0.6921104, 3.151986, 1, 0, 0, 1, 1,
0.8129215, -0.7967985, 2.311925, 0, 0, 0, 1, 1,
0.8157552, -1.544918, 3.25559, 0, 0, 0, 1, 1,
0.8234584, 0.9364904, 1.379914, 0, 0, 0, 1, 1,
0.824953, -1.377136, 3.538748, 0, 0, 0, 1, 1,
0.8299137, -0.7886047, 3.061314, 0, 0, 0, 1, 1,
0.8324308, -0.7115046, 2.177935, 0, 0, 0, 1, 1,
0.8328716, 0.4389887, 1.69591, 0, 0, 0, 1, 1,
0.8347787, -0.8968678, 2.160416, 1, 1, 1, 1, 1,
0.8350261, -0.687947, 2.367167, 1, 1, 1, 1, 1,
0.8376688, 1.991626, -0.4046294, 1, 1, 1, 1, 1,
0.8432166, -1.871665, 3.136705, 1, 1, 1, 1, 1,
0.8436313, -0.616574, 4.298757, 1, 1, 1, 1, 1,
0.8480377, 0.7349511, 3.354379, 1, 1, 1, 1, 1,
0.8482596, -0.7973306, 3.223537, 1, 1, 1, 1, 1,
0.8485314, -1.104461, 2.778887, 1, 1, 1, 1, 1,
0.8551575, 0.7436913, -0.7188205, 1, 1, 1, 1, 1,
0.8598848, -1.202365, 2.901354, 1, 1, 1, 1, 1,
0.8607879, 1.17663, 1.524707, 1, 1, 1, 1, 1,
0.8619663, -0.2595888, 0.3355472, 1, 1, 1, 1, 1,
0.8716651, 0.4208495, 1.268516, 1, 1, 1, 1, 1,
0.8769324, -1.483458, 3.653064, 1, 1, 1, 1, 1,
0.8770038, 0.6802046, 1.60013, 1, 1, 1, 1, 1,
0.8774486, -0.06238744, 3.536644, 0, 0, 1, 1, 1,
0.8790053, -1.34133, 3.54406, 1, 0, 0, 1, 1,
0.8845946, -1.692021, 2.007184, 1, 0, 0, 1, 1,
0.8850704, 0.8667756, 0.03377261, 1, 0, 0, 1, 1,
0.8856514, 0.4884498, -0.1591049, 1, 0, 0, 1, 1,
0.8923551, -0.4564742, 2.925952, 1, 0, 0, 1, 1,
0.8926061, 1.229829, -0.1645299, 0, 0, 0, 1, 1,
0.89501, 1.014423, 0.7182643, 0, 0, 0, 1, 1,
0.8974087, -1.539565, 1.533746, 0, 0, 0, 1, 1,
0.8989123, 0.6239399, 0.537786, 0, 0, 0, 1, 1,
0.9004586, 0.5150037, 0.8221492, 0, 0, 0, 1, 1,
0.9021159, 0.4870115, 1.258804, 0, 0, 0, 1, 1,
0.9027368, -0.5857102, 2.422325, 0, 0, 0, 1, 1,
0.9087726, 1.937138, 1.787537, 1, 1, 1, 1, 1,
0.9133883, 2.392748, 1.858172, 1, 1, 1, 1, 1,
0.9175121, 0.9241211, 0.8382266, 1, 1, 1, 1, 1,
0.9244669, 0.3322568, 0.04211492, 1, 1, 1, 1, 1,
0.9247043, -0.2210611, 2.429095, 1, 1, 1, 1, 1,
0.9252058, 0.3631506, 0.4954451, 1, 1, 1, 1, 1,
0.9321638, -0.1033811, 2.976645, 1, 1, 1, 1, 1,
0.9489196, 0.28664, 1.300635, 1, 1, 1, 1, 1,
0.9522933, 0.5411025, 1.22723, 1, 1, 1, 1, 1,
0.9527642, 0.8073318, 1.771815, 1, 1, 1, 1, 1,
0.9527723, -0.2191105, 2.527392, 1, 1, 1, 1, 1,
0.9605496, -1.239707, 2.072742, 1, 1, 1, 1, 1,
0.9614493, 0.05864041, 2.847794, 1, 1, 1, 1, 1,
0.9681538, 2.004091, -0.01902107, 1, 1, 1, 1, 1,
0.9685512, 0.1751167, 0.8323293, 1, 1, 1, 1, 1,
0.9701797, -0.3611834, 1.937242, 0, 0, 1, 1, 1,
0.970431, 0.05351156, -0.4702145, 1, 0, 0, 1, 1,
0.9728724, 0.3722623, 0.910631, 1, 0, 0, 1, 1,
0.9760218, -0.5008808, 1.802316, 1, 0, 0, 1, 1,
0.9776962, -1.074237, 3.834624, 1, 0, 0, 1, 1,
0.9796078, -0.1143972, 1.067497, 1, 0, 0, 1, 1,
0.9824524, 2.377795, 1.367747, 0, 0, 0, 1, 1,
0.9854921, -0.2446848, 1.932726, 0, 0, 0, 1, 1,
0.986146, 0.6221049, 1.777135, 0, 0, 0, 1, 1,
0.9871744, -1.385125, 1.26364, 0, 0, 0, 1, 1,
0.9911328, 0.5003246, 0.7269989, 0, 0, 0, 1, 1,
0.9938685, -0.1613787, 2.668939, 0, 0, 0, 1, 1,
0.9948978, -0.929835, 2.955822, 0, 0, 0, 1, 1,
0.9965259, -1.407721, 4.104868, 1, 1, 1, 1, 1,
0.9966064, -0.2369635, 1.160085, 1, 1, 1, 1, 1,
1.003218, 0.5651175, 1.013246, 1, 1, 1, 1, 1,
1.006391, -0.7753434, 2.993845, 1, 1, 1, 1, 1,
1.010294, -0.3867425, 1.201671, 1, 1, 1, 1, 1,
1.012903, -0.7625518, 2.158026, 1, 1, 1, 1, 1,
1.014359, 2.001381, -1.428603, 1, 1, 1, 1, 1,
1.016608, 1.790244, 1.216674, 1, 1, 1, 1, 1,
1.017414, 0.9921921, 1.224806, 1, 1, 1, 1, 1,
1.026789, 0.6457061, 1.953403, 1, 1, 1, 1, 1,
1.032914, 0.6211547, 2.843211, 1, 1, 1, 1, 1,
1.035861, 0.329501, 1.650941, 1, 1, 1, 1, 1,
1.042837, -0.4441369, 1.346308, 1, 1, 1, 1, 1,
1.047087, -2.063229, 3.337967, 1, 1, 1, 1, 1,
1.049595, 2.074791, 1.208721, 1, 1, 1, 1, 1,
1.05385, -0.2677498, 2.095037, 0, 0, 1, 1, 1,
1.063935, 0.1005443, -0.03609703, 1, 0, 0, 1, 1,
1.06635, 0.2606186, 1.49452, 1, 0, 0, 1, 1,
1.070988, 0.8136865, 3.804293, 1, 0, 0, 1, 1,
1.079822, 0.008031961, 0.7973942, 1, 0, 0, 1, 1,
1.079877, -0.09945057, 0.8921598, 1, 0, 0, 1, 1,
1.081612, 1.348041, 0.553174, 0, 0, 0, 1, 1,
1.083357, -0.5616246, 2.811033, 0, 0, 0, 1, 1,
1.087238, 0.1400447, 0.5262138, 0, 0, 0, 1, 1,
1.088607, -1.186697, 3.421637, 0, 0, 0, 1, 1,
1.093287, 0.9507483, 1.580851, 0, 0, 0, 1, 1,
1.095016, 1.897383, 1.394374, 0, 0, 0, 1, 1,
1.108951, 2.159732, -0.9798381, 0, 0, 0, 1, 1,
1.109766, 0.6130945, 0.3509034, 1, 1, 1, 1, 1,
1.110496, -0.4878285, 0.7151294, 1, 1, 1, 1, 1,
1.110988, 0.7263457, 1.235461, 1, 1, 1, 1, 1,
1.11518, 0.3501086, 0.6877312, 1, 1, 1, 1, 1,
1.117007, -0.5903346, 3.865469, 1, 1, 1, 1, 1,
1.126668, 0.5266277, 2.226987, 1, 1, 1, 1, 1,
1.136908, -0.05791625, 0.8933223, 1, 1, 1, 1, 1,
1.142666, -1.551703, 2.526779, 1, 1, 1, 1, 1,
1.145869, -2.24891, 1.624928, 1, 1, 1, 1, 1,
1.155189, 1.712225, 0.7939639, 1, 1, 1, 1, 1,
1.162593, 1.068362, -1.028042, 1, 1, 1, 1, 1,
1.176201, -2.024315, 0.7095186, 1, 1, 1, 1, 1,
1.179794, 0.4377204, 1.517969, 1, 1, 1, 1, 1,
1.18952, 1.550674, 0.5875956, 1, 1, 1, 1, 1,
1.190527, -1.273774, 3.234048, 1, 1, 1, 1, 1,
1.197648, -0.430762, 0.7249249, 0, 0, 1, 1, 1,
1.204877, 2.4506, 1.643302, 1, 0, 0, 1, 1,
1.210579, 2.071146, 1.352856, 1, 0, 0, 1, 1,
1.211246, -1.220682, 2.327084, 1, 0, 0, 1, 1,
1.228621, -0.625208, 2.997797, 1, 0, 0, 1, 1,
1.238212, -1.223477, 3.560855, 1, 0, 0, 1, 1,
1.240457, 1.150821, 0.7002984, 0, 0, 0, 1, 1,
1.247912, 1.558348, 2.553487, 0, 0, 0, 1, 1,
1.248138, -0.8405142, -0.3115224, 0, 0, 0, 1, 1,
1.255281, -1.872334, 0.9102615, 0, 0, 0, 1, 1,
1.260145, 0.06690194, 2.908528, 0, 0, 0, 1, 1,
1.262925, -0.7156335, 2.673504, 0, 0, 0, 1, 1,
1.269851, -0.5038066, 1.282424, 0, 0, 0, 1, 1,
1.271033, -0.8566644, 3.136661, 1, 1, 1, 1, 1,
1.271252, 0.916425, 2.344774, 1, 1, 1, 1, 1,
1.274675, 0.5565768, 2.149054, 1, 1, 1, 1, 1,
1.276765, -2.672709, 3.58698, 1, 1, 1, 1, 1,
1.294493, 1.461625, 1.859852, 1, 1, 1, 1, 1,
1.297794, -0.1062489, 2.500063, 1, 1, 1, 1, 1,
1.29895, -2.48893, 2.305286, 1, 1, 1, 1, 1,
1.302031, -1.54112, 2.389474, 1, 1, 1, 1, 1,
1.302083, 0.870111, 1.360671, 1, 1, 1, 1, 1,
1.303676, 1.592288, -0.02250416, 1, 1, 1, 1, 1,
1.304679, 1.549464, 0.8196704, 1, 1, 1, 1, 1,
1.331222, -0.9471631, 1.649302, 1, 1, 1, 1, 1,
1.331926, 0.2460774, -0.3091778, 1, 1, 1, 1, 1,
1.339294, 0.8107604, 0.2522382, 1, 1, 1, 1, 1,
1.347714, 0.6674323, 0.01717286, 1, 1, 1, 1, 1,
1.362047, 1.194665, 1.724752, 0, 0, 1, 1, 1,
1.366167, -0.6002641, 0.9639386, 1, 0, 0, 1, 1,
1.372865, 0.6779249, 0.6005972, 1, 0, 0, 1, 1,
1.388764, 0.992501, 1.877775, 1, 0, 0, 1, 1,
1.396089, 1.097153, 0.6240277, 1, 0, 0, 1, 1,
1.407916, 0.4121893, 0.143659, 1, 0, 0, 1, 1,
1.413894, 2.460654, 0.9289491, 0, 0, 0, 1, 1,
1.41612, 0.9172192, 1.199871, 0, 0, 0, 1, 1,
1.423452, 0.4767333, 0.9299774, 0, 0, 0, 1, 1,
1.426278, -0.1622323, 0.91164, 0, 0, 0, 1, 1,
1.442638, 0.1221688, 2.287928, 0, 0, 0, 1, 1,
1.447484, 0.2451783, 1.038429, 0, 0, 0, 1, 1,
1.447668, 0.1655423, 4.540321, 0, 0, 0, 1, 1,
1.461573, 0.4380746, 2.373328, 1, 1, 1, 1, 1,
1.470158, 2.018468, -1.061224, 1, 1, 1, 1, 1,
1.47108, -0.7273786, 2.178741, 1, 1, 1, 1, 1,
1.474981, 0.1068026, 1.170556, 1, 1, 1, 1, 1,
1.477572, -0.4768218, 1.16321, 1, 1, 1, 1, 1,
1.48213, -1.296596, 2.595492, 1, 1, 1, 1, 1,
1.482148, -0.5540248, -0.809899, 1, 1, 1, 1, 1,
1.491026, -1.298985, 2.251927, 1, 1, 1, 1, 1,
1.492649, 0.3697203, 1.941867, 1, 1, 1, 1, 1,
1.494314, -0.579342, 3.23825, 1, 1, 1, 1, 1,
1.505869, -0.2855527, 2.118347, 1, 1, 1, 1, 1,
1.507225, 0.6452501, 0.267301, 1, 1, 1, 1, 1,
1.521053, -1.313868, 2.845403, 1, 1, 1, 1, 1,
1.524529, -0.3907413, 1.951742, 1, 1, 1, 1, 1,
1.527888, 0.2107023, 2.468811, 1, 1, 1, 1, 1,
1.530457, -1.30339, 0.7259212, 0, 0, 1, 1, 1,
1.533578, 1.242289, 0.8271475, 1, 0, 0, 1, 1,
1.541122, 0.8427479, -0.5550759, 1, 0, 0, 1, 1,
1.546124, -0.756617, 1.688187, 1, 0, 0, 1, 1,
1.551615, -1.184288, 2.377764, 1, 0, 0, 1, 1,
1.559477, 0.2684353, 2.610514, 1, 0, 0, 1, 1,
1.576898, -1.030931, 2.070955, 0, 0, 0, 1, 1,
1.581529, -0.4792055, 2.036865, 0, 0, 0, 1, 1,
1.583521, -0.3516344, 1.488452, 0, 0, 0, 1, 1,
1.58696, 1.246993, 0.8733657, 0, 0, 0, 1, 1,
1.588303, 0.6184022, 2.291108, 0, 0, 0, 1, 1,
1.605097, 1.002708, 3.184795, 0, 0, 0, 1, 1,
1.613658, 0.2404052, 0.406303, 0, 0, 0, 1, 1,
1.617599, -0.2334111, 1.576964, 1, 1, 1, 1, 1,
1.626798, -0.1969307, 2.075868, 1, 1, 1, 1, 1,
1.631556, -1.604886, 1.908692, 1, 1, 1, 1, 1,
1.634077, -1.80957, 2.781964, 1, 1, 1, 1, 1,
1.636538, -0.3503163, 2.54421, 1, 1, 1, 1, 1,
1.641117, -0.747872, 3.014359, 1, 1, 1, 1, 1,
1.646404, 0.1572966, 1.467884, 1, 1, 1, 1, 1,
1.649396, -0.7481092, 1.560272, 1, 1, 1, 1, 1,
1.651394, -0.4257381, 2.339498, 1, 1, 1, 1, 1,
1.657877, 0.7052521, 0.8838218, 1, 1, 1, 1, 1,
1.661716, -0.1829577, 3.489251, 1, 1, 1, 1, 1,
1.662166, 1.098736, 0.2339677, 1, 1, 1, 1, 1,
1.671706, 0.571243, 0.09504078, 1, 1, 1, 1, 1,
1.673411, -0.4344935, 0.9135186, 1, 1, 1, 1, 1,
1.684285, 0.1277809, -0.1234692, 1, 1, 1, 1, 1,
1.711927, -0.5658213, 1.363793, 0, 0, 1, 1, 1,
1.714465, 0.5024434, 0.312719, 1, 0, 0, 1, 1,
1.757266, 0.4721053, 1.619897, 1, 0, 0, 1, 1,
1.773016, 1.0096, 0.4108512, 1, 0, 0, 1, 1,
1.781759, 0.1774448, 1.370619, 1, 0, 0, 1, 1,
1.791559, 0.4720515, 1.495392, 1, 0, 0, 1, 1,
1.792261, -0.1644904, -0.3470095, 0, 0, 0, 1, 1,
1.795917, -0.04246824, 2.435558, 0, 0, 0, 1, 1,
1.803886, -0.7705012, 2.030745, 0, 0, 0, 1, 1,
1.805068, 1.421126, 0.1482291, 0, 0, 0, 1, 1,
1.810417, 0.1370795, 2.119459, 0, 0, 0, 1, 1,
1.814773, 0.4760963, 0.6536216, 0, 0, 0, 1, 1,
1.84531, -2.006403, 1.601615, 0, 0, 0, 1, 1,
1.85864, -0.6823633, 1.510621, 1, 1, 1, 1, 1,
1.864858, -1.475899, 3.068522, 1, 1, 1, 1, 1,
1.870723, 1.55652, 0.7293249, 1, 1, 1, 1, 1,
1.880489, -0.1998325, 2.329055, 1, 1, 1, 1, 1,
1.893763, -0.8928936, 0.9221718, 1, 1, 1, 1, 1,
1.893992, 1.232501, 1.217121, 1, 1, 1, 1, 1,
1.916141, 1.056387, 2.373249, 1, 1, 1, 1, 1,
1.924482, 1.979629, -0.08679282, 1, 1, 1, 1, 1,
1.948433, 0.1880281, 1.032443, 1, 1, 1, 1, 1,
1.960382, 0.172787, 2.309507, 1, 1, 1, 1, 1,
1.976581, 0.7149561, 0.09683935, 1, 1, 1, 1, 1,
1.995687, 1.214906, 0.5229542, 1, 1, 1, 1, 1,
1.99829, 0.8676633, -0.04612216, 1, 1, 1, 1, 1,
2.00563, -0.8302737, 0.945638, 1, 1, 1, 1, 1,
2.029577, 1.409555, 1.44239, 1, 1, 1, 1, 1,
2.069124, 1.555919, 1.992786, 0, 0, 1, 1, 1,
2.084109, -0.6649093, 0.6976891, 1, 0, 0, 1, 1,
2.093279, -1.465405, 2.693028, 1, 0, 0, 1, 1,
2.106938, -1.431775, 3.191866, 1, 0, 0, 1, 1,
2.237246, 0.7957983, 0.9114431, 1, 0, 0, 1, 1,
2.246366, -1.519711, 2.615371, 1, 0, 0, 1, 1,
2.294604, -2.017323, 1.664752, 0, 0, 0, 1, 1,
2.295575, -0.5526749, 1.166567, 0, 0, 0, 1, 1,
2.318474, 0.930589, -0.4801303, 0, 0, 0, 1, 1,
2.353319, 0.255049, 2.374652, 0, 0, 0, 1, 1,
2.359343, 0.3712605, 0.7622361, 0, 0, 0, 1, 1,
2.386143, -0.01110397, 1.383904, 0, 0, 0, 1, 1,
2.476345, 0.530651, 1.161152, 0, 0, 0, 1, 1,
2.482943, -0.9215692, 2.74514, 1, 1, 1, 1, 1,
2.546704, 1.933262, 0.3856819, 1, 1, 1, 1, 1,
2.731488, -0.2753119, 1.709677, 1, 1, 1, 1, 1,
2.755366, 0.6175849, 0.2333362, 1, 1, 1, 1, 1,
2.854375, 0.6423473, 0.7733944, 1, 1, 1, 1, 1,
3.055495, 0.2092457, 1.678574, 1, 1, 1, 1, 1,
3.175358, -0.5876197, 1.813617, 1, 1, 1, 1, 1
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
var radius = 9.770614;
var distance = 34.31887;
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
mvMatrix.translate( -0.1983621, -0.2043606, 0.272995 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.31887);
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
