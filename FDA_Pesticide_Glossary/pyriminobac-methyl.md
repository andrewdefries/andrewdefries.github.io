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
-3.446298, 0.3564497, -1.252968, 1, 0, 0, 1,
-2.987889, -0.7450994, -2.473045, 1, 0.007843138, 0, 1,
-2.831283, -2.154194, -2.678411, 1, 0.01176471, 0, 1,
-2.695818, 0.8019457, -2.661887, 1, 0.01960784, 0, 1,
-2.577301, -0.06413526, -1.101637, 1, 0.02352941, 0, 1,
-2.528763, -0.1206844, -0.03285972, 1, 0.03137255, 0, 1,
-2.477784, 0.132048, -0.8672284, 1, 0.03529412, 0, 1,
-2.377656, -0.3663169, -1.660928, 1, 0.04313726, 0, 1,
-2.356769, -0.5459237, -0.5705492, 1, 0.04705882, 0, 1,
-2.316069, 1.80298, -0.5424904, 1, 0.05490196, 0, 1,
-2.222507, -0.9183177, -1.26177, 1, 0.05882353, 0, 1,
-2.158136, -1.276394, -1.603748, 1, 0.06666667, 0, 1,
-2.131505, -0.3278069, -1.71153, 1, 0.07058824, 0, 1,
-2.051085, 0.1580565, -1.523272, 1, 0.07843138, 0, 1,
-1.975514, -1.539747, -1.322658, 1, 0.08235294, 0, 1,
-1.953495, 0.06401079, -2.029738, 1, 0.09019608, 0, 1,
-1.938466, -0.3988073, -2.716798, 1, 0.09411765, 0, 1,
-1.904625, -0.4911007, -2.406574, 1, 0.1019608, 0, 1,
-1.878921, 0.9296996, 0.4676872, 1, 0.1098039, 0, 1,
-1.861868, 0.06934241, -0.6504624, 1, 0.1137255, 0, 1,
-1.816064, 0.3169098, -1.632026, 1, 0.1215686, 0, 1,
-1.811795, 0.423128, -1.236905, 1, 0.1254902, 0, 1,
-1.801834, 0.5155998, -1.177935, 1, 0.1333333, 0, 1,
-1.793031, 2.429002, -0.2387114, 1, 0.1372549, 0, 1,
-1.775037, -1.265599, -3.782665, 1, 0.145098, 0, 1,
-1.767734, -0.7289944, -1.874104, 1, 0.1490196, 0, 1,
-1.760232, 0.9902269, 0.6008746, 1, 0.1568628, 0, 1,
-1.743396, 0.578666, -1.129679, 1, 0.1607843, 0, 1,
-1.738944, 0.5381202, -1.125705, 1, 0.1686275, 0, 1,
-1.714294, -2.460349, -3.734015, 1, 0.172549, 0, 1,
-1.709528, -0.4290009, -1.746581, 1, 0.1803922, 0, 1,
-1.705726, -0.004273521, -0.6796657, 1, 0.1843137, 0, 1,
-1.70321, -0.6580259, -0.6908224, 1, 0.1921569, 0, 1,
-1.702005, 0.3779227, -2.063113, 1, 0.1960784, 0, 1,
-1.687744, 0.2731812, -0.2224077, 1, 0.2039216, 0, 1,
-1.680557, 0.8625016, -0.3987278, 1, 0.2117647, 0, 1,
-1.678167, -0.6680636, -2.630447, 1, 0.2156863, 0, 1,
-1.669481, 0.5872225, -2.726086, 1, 0.2235294, 0, 1,
-1.668701, 2.336068, 1.180918, 1, 0.227451, 0, 1,
-1.664136, -0.4727495, -0.9784757, 1, 0.2352941, 0, 1,
-1.65952, 1.342384, -3.116828, 1, 0.2392157, 0, 1,
-1.655622, 1.058074, 0.02435231, 1, 0.2470588, 0, 1,
-1.654847, -1.592007, -4.510819, 1, 0.2509804, 0, 1,
-1.649516, -0.236065, -0.814169, 1, 0.2588235, 0, 1,
-1.643481, -2.334697, -3.388983, 1, 0.2627451, 0, 1,
-1.640444, 0.8009832, -0.659147, 1, 0.2705882, 0, 1,
-1.625351, 0.5013355, -1.31791, 1, 0.2745098, 0, 1,
-1.624, -0.3206418, -0.5371432, 1, 0.282353, 0, 1,
-1.61275, -0.1911729, 0.1772291, 1, 0.2862745, 0, 1,
-1.603306, -1.722815, -0.4892142, 1, 0.2941177, 0, 1,
-1.59284, -2.203658, -2.111759, 1, 0.3019608, 0, 1,
-1.585986, -0.2109316, -0.4223687, 1, 0.3058824, 0, 1,
-1.568567, -1.596294, -3.572349, 1, 0.3137255, 0, 1,
-1.567928, -0.8066891, -1.446282, 1, 0.3176471, 0, 1,
-1.561702, 0.3818761, -3.117958, 1, 0.3254902, 0, 1,
-1.557107, -0.1276977, -2.99255, 1, 0.3294118, 0, 1,
-1.546643, -0.907097, -0.8128716, 1, 0.3372549, 0, 1,
-1.539151, -0.5694572, -4.207071, 1, 0.3411765, 0, 1,
-1.525606, 0.08695772, -1.066268, 1, 0.3490196, 0, 1,
-1.518488, 0.5194845, -1.746143, 1, 0.3529412, 0, 1,
-1.515277, 0.09476098, -0.8615853, 1, 0.3607843, 0, 1,
-1.512695, 2.859381, -0.3326535, 1, 0.3647059, 0, 1,
-1.5087, -0.4819624, -2.670187, 1, 0.372549, 0, 1,
-1.497188, -1.841316, -0.7486743, 1, 0.3764706, 0, 1,
-1.484306, -0.3179975, -1.635221, 1, 0.3843137, 0, 1,
-1.483786, -0.4419672, -1.330397, 1, 0.3882353, 0, 1,
-1.480063, 1.146797, -0.4798338, 1, 0.3960784, 0, 1,
-1.476916, 1.157137, -0.7295108, 1, 0.4039216, 0, 1,
-1.45522, 0.7454904, 0.09750251, 1, 0.4078431, 0, 1,
-1.453743, 0.1186433, -1.316979, 1, 0.4156863, 0, 1,
-1.44743, 0.2107101, -1.591517, 1, 0.4196078, 0, 1,
-1.442928, 1.704639, -0.1477052, 1, 0.427451, 0, 1,
-1.432352, 0.8961734, -0.8354723, 1, 0.4313726, 0, 1,
-1.422773, -0.2249029, -2.473975, 1, 0.4392157, 0, 1,
-1.390789, -0.265646, -2.538721, 1, 0.4431373, 0, 1,
-1.386868, -1.73728, -1.636477, 1, 0.4509804, 0, 1,
-1.380893, -1.614883, -3.748343, 1, 0.454902, 0, 1,
-1.373568, 1.489804, -1.258158, 1, 0.4627451, 0, 1,
-1.370429, 0.9034156, -0.2528687, 1, 0.4666667, 0, 1,
-1.368161, 0.00582861, -2.434379, 1, 0.4745098, 0, 1,
-1.365448, 1.273129, -0.3361101, 1, 0.4784314, 0, 1,
-1.360187, -1.573653, -2.42347, 1, 0.4862745, 0, 1,
-1.358245, 1.310236, -1.331021, 1, 0.4901961, 0, 1,
-1.354462, -1.686111, -3.728391, 1, 0.4980392, 0, 1,
-1.353564, -0.5846037, -1.624286, 1, 0.5058824, 0, 1,
-1.332346, 0.5537189, -2.558908, 1, 0.509804, 0, 1,
-1.332268, -0.723679, -1.062716, 1, 0.5176471, 0, 1,
-1.331514, -0.5259497, -0.9071912, 1, 0.5215687, 0, 1,
-1.316655, -2.301811, -2.867713, 1, 0.5294118, 0, 1,
-1.315268, -1.254991, -3.174221, 1, 0.5333334, 0, 1,
-1.301402, -1.233827, -0.6450776, 1, 0.5411765, 0, 1,
-1.300423, -2.461275, -3.00035, 1, 0.5450981, 0, 1,
-1.296743, 1.054441, -1.9522, 1, 0.5529412, 0, 1,
-1.296488, -0.5126262, -2.507463, 1, 0.5568628, 0, 1,
-1.294113, -0.7291006, -0.612909, 1, 0.5647059, 0, 1,
-1.294111, -1.794846, -4.475307, 1, 0.5686275, 0, 1,
-1.293671, -0.6462148, -2.661939, 1, 0.5764706, 0, 1,
-1.291, 0.221354, -2.031512, 1, 0.5803922, 0, 1,
-1.290155, 1.021796, -1.437616, 1, 0.5882353, 0, 1,
-1.27985, 1.725266, 1.033459, 1, 0.5921569, 0, 1,
-1.276399, -1.304007, -1.786589, 1, 0.6, 0, 1,
-1.264525, -0.9523908, -1.571842, 1, 0.6078432, 0, 1,
-1.263709, 0.373772, -4.001493, 1, 0.6117647, 0, 1,
-1.253495, -0.3141197, -3.117018, 1, 0.6196079, 0, 1,
-1.249377, -1.203658, -3.078897, 1, 0.6235294, 0, 1,
-1.24869, -0.5132245, -0.5333089, 1, 0.6313726, 0, 1,
-1.244907, -1.983746, -2.150865, 1, 0.6352941, 0, 1,
-1.237186, 0.6691573, -2.38158, 1, 0.6431373, 0, 1,
-1.23388, -0.5244543, -1.785328, 1, 0.6470588, 0, 1,
-1.233667, 0.9617875, -2.184221, 1, 0.654902, 0, 1,
-1.233191, 0.3809691, -1.936944, 1, 0.6588235, 0, 1,
-1.212635, 0.5929233, -0.1080646, 1, 0.6666667, 0, 1,
-1.204244, 0.6258351, -0.1976139, 1, 0.6705883, 0, 1,
-1.196306, -0.08829635, -1.80843, 1, 0.6784314, 0, 1,
-1.191849, 1.647952, -1.9901, 1, 0.682353, 0, 1,
-1.189399, -1.608347, -3.141456, 1, 0.6901961, 0, 1,
-1.188641, -0.3472428, -1.843511, 1, 0.6941177, 0, 1,
-1.174854, -0.3612186, -2.925983, 1, 0.7019608, 0, 1,
-1.170079, -0.3763211, -1.719399, 1, 0.7098039, 0, 1,
-1.161821, -0.07531133, -1.948114, 1, 0.7137255, 0, 1,
-1.161556, 0.4092627, -3.675835, 1, 0.7215686, 0, 1,
-1.159925, 0.01479304, -1.018284, 1, 0.7254902, 0, 1,
-1.157176, 0.3434815, -2.63021, 1, 0.7333333, 0, 1,
-1.155463, -0.09126027, -2.98794, 1, 0.7372549, 0, 1,
-1.151754, -1.283258, -2.040836, 1, 0.7450981, 0, 1,
-1.149914, 0.01397814, -1.377918, 1, 0.7490196, 0, 1,
-1.143576, 1.761115, -2.339867, 1, 0.7568628, 0, 1,
-1.142869, -0.08763769, -1.621012, 1, 0.7607843, 0, 1,
-1.141913, 0.6214496, -1.354716, 1, 0.7686275, 0, 1,
-1.131442, -0.6647236, -4.291107, 1, 0.772549, 0, 1,
-1.127521, -1.514195, -3.550927, 1, 0.7803922, 0, 1,
-1.127016, -1.352538, -0.500571, 1, 0.7843137, 0, 1,
-1.125764, 0.7416804, -0.3347158, 1, 0.7921569, 0, 1,
-1.125742, 1.537965, -1.693516, 1, 0.7960784, 0, 1,
-1.117459, -1.298444, -2.043204, 1, 0.8039216, 0, 1,
-1.116323, 0.2968124, -0.2322828, 1, 0.8117647, 0, 1,
-1.112872, -0.15666, -2.066031, 1, 0.8156863, 0, 1,
-1.103223, -0.3999614, -2.142144, 1, 0.8235294, 0, 1,
-1.099705, 0.2177866, -0.9318246, 1, 0.827451, 0, 1,
-1.098546, -0.6623159, -1.961861, 1, 0.8352941, 0, 1,
-1.094561, -0.07928529, -3.268044, 1, 0.8392157, 0, 1,
-1.092457, 0.5547748, -0.1667384, 1, 0.8470588, 0, 1,
-1.08968, 0.08062477, -2.689496, 1, 0.8509804, 0, 1,
-1.081921, -1.118904, -0.1903618, 1, 0.8588235, 0, 1,
-1.081444, 0.9587935, -2.915815, 1, 0.8627451, 0, 1,
-1.080394, 0.6687052, -1.228865, 1, 0.8705882, 0, 1,
-1.072543, -1.28594, -5.179128, 1, 0.8745098, 0, 1,
-1.066915, 0.7800797, -1.25755, 1, 0.8823529, 0, 1,
-1.063798, -0.2246573, -1.856458, 1, 0.8862745, 0, 1,
-1.063298, -0.9668636, -1.565789, 1, 0.8941177, 0, 1,
-1.061925, -2.157271, -3.041777, 1, 0.8980392, 0, 1,
-1.060826, 0.7766696, -0.857867, 1, 0.9058824, 0, 1,
-1.05681, -2.232297, -3.558428, 1, 0.9137255, 0, 1,
-1.055413, 0.9755282, -2.649152, 1, 0.9176471, 0, 1,
-1.043847, -1.407627, -2.730819, 1, 0.9254902, 0, 1,
-1.039412, 1.179262, -2.437167, 1, 0.9294118, 0, 1,
-1.02131, 1.041344, -0.8633442, 1, 0.9372549, 0, 1,
-1.020912, -1.425915, -3.925935, 1, 0.9411765, 0, 1,
-1.01302, 2.119046, -0.7807785, 1, 0.9490196, 0, 1,
-1.010694, -0.6396418, -1.638179, 1, 0.9529412, 0, 1,
-1.006358, -0.08351045, -1.984638, 1, 0.9607843, 0, 1,
-1.005774, -0.7650853, -1.662777, 1, 0.9647059, 0, 1,
-1.0026, -0.2605962, -1.318054, 1, 0.972549, 0, 1,
-1.001294, -0.6058303, -3.36741, 1, 0.9764706, 0, 1,
-0.9873477, 2.755606, -0.3593169, 1, 0.9843137, 0, 1,
-0.9836459, -0.1307261, 0.3875683, 1, 0.9882353, 0, 1,
-0.9796509, 2.887157, -1.578534, 1, 0.9960784, 0, 1,
-0.9788094, -1.286992, -2.640177, 0.9960784, 1, 0, 1,
-0.9785475, -1.34879, -1.739764, 0.9921569, 1, 0, 1,
-0.9731754, -0.5941694, -1.328014, 0.9843137, 1, 0, 1,
-0.9723278, 1.566101, 1.768862, 0.9803922, 1, 0, 1,
-0.9698277, 0.02769406, -1.270977, 0.972549, 1, 0, 1,
-0.9676858, -0.6480735, -3.686553, 0.9686275, 1, 0, 1,
-0.9676384, 0.2491573, -1.476898, 0.9607843, 1, 0, 1,
-0.9592363, -1.013869, -2.194958, 0.9568627, 1, 0, 1,
-0.9501364, 0.464728, 0.04904279, 0.9490196, 1, 0, 1,
-0.9376978, -1.091693, -4.207935, 0.945098, 1, 0, 1,
-0.9257149, 0.7475381, -0.5116358, 0.9372549, 1, 0, 1,
-0.9217433, 0.2768571, -0.2759935, 0.9333333, 1, 0, 1,
-0.9155716, -2.041414, -3.321338, 0.9254902, 1, 0, 1,
-0.9144533, 1.852928, -1.208055, 0.9215686, 1, 0, 1,
-0.9115681, 0.7822503, -0.8102337, 0.9137255, 1, 0, 1,
-0.9046971, 1.234112, -1.422405, 0.9098039, 1, 0, 1,
-0.9030875, -1.258139, -3.60945, 0.9019608, 1, 0, 1,
-0.9023948, 0.2531175, -1.563572, 0.8941177, 1, 0, 1,
-0.8955129, 0.2276277, -0.8804917, 0.8901961, 1, 0, 1,
-0.893025, -0.2223956, -0.8878187, 0.8823529, 1, 0, 1,
-0.8776369, -0.2324419, -1.485297, 0.8784314, 1, 0, 1,
-0.8746653, 1.017214, -1.86153, 0.8705882, 1, 0, 1,
-0.8731178, 1.673651, -0.5375252, 0.8666667, 1, 0, 1,
-0.8645575, 0.7399524, -0.1459804, 0.8588235, 1, 0, 1,
-0.8627028, 0.01547946, -1.191112, 0.854902, 1, 0, 1,
-0.8560672, 1.494382, -0.6506314, 0.8470588, 1, 0, 1,
-0.8495266, -0.3328789, -1.637024, 0.8431373, 1, 0, 1,
-0.8486603, 1.282388, -1.825731, 0.8352941, 1, 0, 1,
-0.8392337, -0.6255676, -2.37021, 0.8313726, 1, 0, 1,
-0.8384176, 1.726778, -1.240985, 0.8235294, 1, 0, 1,
-0.8374689, -1.472448, -1.601822, 0.8196079, 1, 0, 1,
-0.8322759, -1.886975, -1.327874, 0.8117647, 1, 0, 1,
-0.8303427, 1.945572, 0.7134346, 0.8078431, 1, 0, 1,
-0.8292091, 0.3235277, -1.82175, 0.8, 1, 0, 1,
-0.8227978, -1.221004, -1.779023, 0.7921569, 1, 0, 1,
-0.8219237, 0.2415154, -0.7266927, 0.7882353, 1, 0, 1,
-0.8212434, -0.4522919, -2.923491, 0.7803922, 1, 0, 1,
-0.820785, 0.4292925, 0.6708434, 0.7764706, 1, 0, 1,
-0.8187446, 1.9011, 0.4546697, 0.7686275, 1, 0, 1,
-0.8165573, 0.08666402, -1.840653, 0.7647059, 1, 0, 1,
-0.8161461, -0.7960051, -1.392726, 0.7568628, 1, 0, 1,
-0.8129867, -0.5084097, -1.992045, 0.7529412, 1, 0, 1,
-0.8077442, 0.4771791, -1.561258, 0.7450981, 1, 0, 1,
-0.8019248, 0.7727729, -0.8909488, 0.7411765, 1, 0, 1,
-0.7986128, 0.08548205, -3.338385, 0.7333333, 1, 0, 1,
-0.7962068, -0.1021916, -1.326319, 0.7294118, 1, 0, 1,
-0.7897296, -0.1617178, -1.492648, 0.7215686, 1, 0, 1,
-0.787028, -0.279244, -3.507898, 0.7176471, 1, 0, 1,
-0.7841604, -2.702302, -2.593742, 0.7098039, 1, 0, 1,
-0.7816869, -1.343558, -5.006622, 0.7058824, 1, 0, 1,
-0.78062, -0.4247248, -2.821535, 0.6980392, 1, 0, 1,
-0.7791909, 0.3496885, -1.914883, 0.6901961, 1, 0, 1,
-0.7765293, 0.3310406, -0.1298841, 0.6862745, 1, 0, 1,
-0.7632299, -0.6063614, -4.417432, 0.6784314, 1, 0, 1,
-0.7579816, 1.940299, -0.3667797, 0.6745098, 1, 0, 1,
-0.7531765, -0.3751169, -2.414801, 0.6666667, 1, 0, 1,
-0.7502946, 1.36521, 0.6634616, 0.6627451, 1, 0, 1,
-0.7494588, 2.484964, 1.509296, 0.654902, 1, 0, 1,
-0.7458199, 0.5777319, -1.589287, 0.6509804, 1, 0, 1,
-0.7408818, -0.07785008, -0.5422236, 0.6431373, 1, 0, 1,
-0.7389228, 1.071446, -0.4290383, 0.6392157, 1, 0, 1,
-0.7367525, 2.450356, 0.1776806, 0.6313726, 1, 0, 1,
-0.7350776, 0.7286116, -1.034024, 0.627451, 1, 0, 1,
-0.7319888, -0.0227271, -1.83409, 0.6196079, 1, 0, 1,
-0.7283494, -1.304623, -1.783851, 0.6156863, 1, 0, 1,
-0.722167, -0.5994041, -2.987455, 0.6078432, 1, 0, 1,
-0.7218264, -1.024157, -2.214165, 0.6039216, 1, 0, 1,
-0.7210629, 0.9507566, -0.6397542, 0.5960785, 1, 0, 1,
-0.7122409, -0.5008416, -2.014785, 0.5882353, 1, 0, 1,
-0.7078862, -2.072369, -2.827364, 0.5843138, 1, 0, 1,
-0.7030897, -0.9969546, -3.893125, 0.5764706, 1, 0, 1,
-0.6962944, -1.99193, -1.46177, 0.572549, 1, 0, 1,
-0.6948445, 0.1717402, 0.05474415, 0.5647059, 1, 0, 1,
-0.6931848, 1.64706, 0.4380693, 0.5607843, 1, 0, 1,
-0.6923363, -0.8336211, -2.207738, 0.5529412, 1, 0, 1,
-0.6902829, -1.282373, -2.195022, 0.5490196, 1, 0, 1,
-0.689215, -0.1984407, -2.232292, 0.5411765, 1, 0, 1,
-0.6852729, 1.643214, 0.4438815, 0.5372549, 1, 0, 1,
-0.6814349, 0.7454522, -2.11186, 0.5294118, 1, 0, 1,
-0.6805069, 0.3536426, 0.5100316, 0.5254902, 1, 0, 1,
-0.6700312, -0.9787601, -3.722852, 0.5176471, 1, 0, 1,
-0.6659014, -0.0508678, -2.046185, 0.5137255, 1, 0, 1,
-0.6641725, 0.156085, -0.957661, 0.5058824, 1, 0, 1,
-0.6634143, 1.057862, -0.04587433, 0.5019608, 1, 0, 1,
-0.6613129, 1.548325, -0.107056, 0.4941176, 1, 0, 1,
-0.6608865, -1.688164, -1.221406, 0.4862745, 1, 0, 1,
-0.6594195, -0.4208849, -0.9403287, 0.4823529, 1, 0, 1,
-0.6586021, -1.130249, -3.852473, 0.4745098, 1, 0, 1,
-0.6570844, -0.4502072, -4.42616, 0.4705882, 1, 0, 1,
-0.6561421, 1.327651, -0.3006091, 0.4627451, 1, 0, 1,
-0.6551597, -0.89284, -2.388905, 0.4588235, 1, 0, 1,
-0.6471773, -0.8466929, -2.06871, 0.4509804, 1, 0, 1,
-0.6464637, -0.0995672, -0.1008583, 0.4470588, 1, 0, 1,
-0.6446428, 0.2813215, 0.006211778, 0.4392157, 1, 0, 1,
-0.6442857, -0.952022, -0.9461711, 0.4352941, 1, 0, 1,
-0.6430694, 0.2319263, -1.947426, 0.427451, 1, 0, 1,
-0.6411141, 0.7822362, -0.05997158, 0.4235294, 1, 0, 1,
-0.6398854, 0.9936689, -0.7925913, 0.4156863, 1, 0, 1,
-0.6341597, -1.578164, -2.770534, 0.4117647, 1, 0, 1,
-0.6328648, 0.5193757, -1.240826, 0.4039216, 1, 0, 1,
-0.6324741, 0.09507196, -1.23877, 0.3960784, 1, 0, 1,
-0.6271044, 0.2446894, -1.547915, 0.3921569, 1, 0, 1,
-0.6262991, 0.6581865, -1.458353, 0.3843137, 1, 0, 1,
-0.6218621, -0.3409551, -0.1719305, 0.3803922, 1, 0, 1,
-0.6208652, 0.1430623, -1.156112, 0.372549, 1, 0, 1,
-0.6202004, 0.7480392, -1.633485, 0.3686275, 1, 0, 1,
-0.6168985, -0.6266922, -0.1892259, 0.3607843, 1, 0, 1,
-0.6161112, -0.5808128, -4.218034, 0.3568628, 1, 0, 1,
-0.6160221, 0.6094642, -0.8978056, 0.3490196, 1, 0, 1,
-0.6158739, -0.116189, -1.729778, 0.345098, 1, 0, 1,
-0.6153394, -0.04352793, -1.69567, 0.3372549, 1, 0, 1,
-0.6097049, 1.597937, -0.5034644, 0.3333333, 1, 0, 1,
-0.6086357, -0.4481865, -4.849592, 0.3254902, 1, 0, 1,
-0.6085441, 1.464556, -1.132493, 0.3215686, 1, 0, 1,
-0.6080892, 0.5057106, -3.076462, 0.3137255, 1, 0, 1,
-0.6032162, 0.9237671, -1.357042, 0.3098039, 1, 0, 1,
-0.5995914, -1.172106, -3.762854, 0.3019608, 1, 0, 1,
-0.5969657, 0.6239932, 0.4133329, 0.2941177, 1, 0, 1,
-0.5936955, -0.008532577, -1.064287, 0.2901961, 1, 0, 1,
-0.5905063, -1.49, -1.231343, 0.282353, 1, 0, 1,
-0.5891546, -0.4436115, -3.073031, 0.2784314, 1, 0, 1,
-0.5883141, -0.3412045, -1.356655, 0.2705882, 1, 0, 1,
-0.5876821, 0.7619527, -1.113768, 0.2666667, 1, 0, 1,
-0.5853741, 0.4353868, -0.217077, 0.2588235, 1, 0, 1,
-0.5840127, 0.6091176, -1.052302, 0.254902, 1, 0, 1,
-0.5812962, -0.08455333, -0.7017787, 0.2470588, 1, 0, 1,
-0.5811419, -0.8310553, -2.115653, 0.2431373, 1, 0, 1,
-0.579343, -1.167455, -1.552605, 0.2352941, 1, 0, 1,
-0.5731238, -0.7904953, -3.014677, 0.2313726, 1, 0, 1,
-0.5713758, 0.006055956, -1.773757, 0.2235294, 1, 0, 1,
-0.570905, 0.4700969, -1.590783, 0.2196078, 1, 0, 1,
-0.5652986, -0.1297368, -1.767655, 0.2117647, 1, 0, 1,
-0.5528178, 0.698862, -1.089784, 0.2078431, 1, 0, 1,
-0.5487648, -1.423707, -2.775501, 0.2, 1, 0, 1,
-0.5485719, -0.8629743, -3.299154, 0.1921569, 1, 0, 1,
-0.5390598, 0.2281584, -1.790465, 0.1882353, 1, 0, 1,
-0.5376708, -0.6297086, -2.345527, 0.1803922, 1, 0, 1,
-0.5362083, 1.511011, -0.10885, 0.1764706, 1, 0, 1,
-0.5345196, -0.7526638, -2.000745, 0.1686275, 1, 0, 1,
-0.5289701, -0.09344257, -2.434757, 0.1647059, 1, 0, 1,
-0.5256435, -0.469761, -2.894632, 0.1568628, 1, 0, 1,
-0.5228518, -0.1450908, -2.355037, 0.1529412, 1, 0, 1,
-0.5223578, 0.009398447, -1.054967, 0.145098, 1, 0, 1,
-0.5197967, 0.8749797, -0.8793614, 0.1411765, 1, 0, 1,
-0.5196062, -1.511433, -1.23475, 0.1333333, 1, 0, 1,
-0.514353, -0.7166719, -4.567561, 0.1294118, 1, 0, 1,
-0.5065801, -1.094628, -2.124277, 0.1215686, 1, 0, 1,
-0.50622, 1.211914, -1.148285, 0.1176471, 1, 0, 1,
-0.5029294, 0.1505409, -1.517281, 0.1098039, 1, 0, 1,
-0.5027428, -1.601317, -3.948499, 0.1058824, 1, 0, 1,
-0.5027365, -0.3322795, -2.766487, 0.09803922, 1, 0, 1,
-0.5020413, -0.4575124, -2.504508, 0.09019608, 1, 0, 1,
-0.5016627, -0.8642622, -0.3631544, 0.08627451, 1, 0, 1,
-0.5006445, 2.328221, -0.4530746, 0.07843138, 1, 0, 1,
-0.500097, 0.7315647, -0.8423023, 0.07450981, 1, 0, 1,
-0.5000176, 0.9575813, -1.287838, 0.06666667, 1, 0, 1,
-0.497531, -0.5086203, -1.435787, 0.0627451, 1, 0, 1,
-0.4973825, 1.211467, 0.7884961, 0.05490196, 1, 0, 1,
-0.4954952, -0.3179002, -2.149328, 0.05098039, 1, 0, 1,
-0.4941771, 1.352806, -1.462063, 0.04313726, 1, 0, 1,
-0.481332, 1.041123, 0.863277, 0.03921569, 1, 0, 1,
-0.4793951, -0.2265249, -1.262293, 0.03137255, 1, 0, 1,
-0.4785743, 0.4768904, 0.8356482, 0.02745098, 1, 0, 1,
-0.4778596, 0.3288194, 0.1681899, 0.01960784, 1, 0, 1,
-0.4715479, 0.2616219, 0.2964313, 0.01568628, 1, 0, 1,
-0.4665779, -0.8271722, -2.777679, 0.007843138, 1, 0, 1,
-0.4655965, -0.1807729, 0.2350227, 0.003921569, 1, 0, 1,
-0.4647055, 2.427378, -0.7392394, 0, 1, 0.003921569, 1,
-0.4616142, -1.130758, -2.147455, 0, 1, 0.01176471, 1,
-0.4598401, -1.062448, -1.590355, 0, 1, 0.01568628, 1,
-0.4561142, -1.012941, -2.445917, 0, 1, 0.02352941, 1,
-0.4553146, -0.3546257, -1.619645, 0, 1, 0.02745098, 1,
-0.4524632, 1.952641, -0.711897, 0, 1, 0.03529412, 1,
-0.4520297, 0.4775612, -1.771655, 0, 1, 0.03921569, 1,
-0.448122, 1.265096, -1.977875, 0, 1, 0.04705882, 1,
-0.4420405, 0.9525399, 1.099694, 0, 1, 0.05098039, 1,
-0.4411094, 1.667437, -1.155938, 0, 1, 0.05882353, 1,
-0.4407328, -0.500086, -3.530457, 0, 1, 0.0627451, 1,
-0.4377401, 1.329458, 2.048249, 0, 1, 0.07058824, 1,
-0.4321934, -1.680208, -1.152134, 0, 1, 0.07450981, 1,
-0.421629, -0.4669636, -1.595424, 0, 1, 0.08235294, 1,
-0.4201675, -0.9980566, -4.163688, 0, 1, 0.08627451, 1,
-0.4185023, 0.9749954, -2.59304, 0, 1, 0.09411765, 1,
-0.414759, 1.288459, 0.05661222, 0, 1, 0.1019608, 1,
-0.4106699, 0.4716013, 1.212062, 0, 1, 0.1058824, 1,
-0.4099804, -0.8930277, -0.3864084, 0, 1, 0.1137255, 1,
-0.4084402, -0.6441897, -3.426833, 0, 1, 0.1176471, 1,
-0.4069167, 0.4900133, 0.09191019, 0, 1, 0.1254902, 1,
-0.401871, -0.1121089, -2.735779, 0, 1, 0.1294118, 1,
-0.3994672, -0.239821, 0.3776766, 0, 1, 0.1372549, 1,
-0.3991311, -1.068411, -3.13882, 0, 1, 0.1411765, 1,
-0.3969781, 1.115286, -0.8946744, 0, 1, 0.1490196, 1,
-0.3937325, 0.9979116, -0.5117427, 0, 1, 0.1529412, 1,
-0.3933855, 0.9984762, -0.9618123, 0, 1, 0.1607843, 1,
-0.3931274, -0.4411248, -2.665766, 0, 1, 0.1647059, 1,
-0.3913483, 0.05354965, -0.05999224, 0, 1, 0.172549, 1,
-0.3911304, 1.746006, 0.6751134, 0, 1, 0.1764706, 1,
-0.38466, 1.480303, -0.6468506, 0, 1, 0.1843137, 1,
-0.3795165, 0.1982252, 0.1498395, 0, 1, 0.1882353, 1,
-0.3781826, -0.7340277, -1.640798, 0, 1, 0.1960784, 1,
-0.3752868, -0.7089882, -2.18516, 0, 1, 0.2039216, 1,
-0.3712317, 0.6843655, -0.517332, 0, 1, 0.2078431, 1,
-0.3672429, 0.3821581, -0.712846, 0, 1, 0.2156863, 1,
-0.3631278, -0.3626271, -3.379471, 0, 1, 0.2196078, 1,
-0.3628917, 1.134887, -0.6997654, 0, 1, 0.227451, 1,
-0.3587273, -0.6812105, -3.534643, 0, 1, 0.2313726, 1,
-0.3566094, -0.6869782, -3.27361, 0, 1, 0.2392157, 1,
-0.3449615, -0.5890635, -3.688256, 0, 1, 0.2431373, 1,
-0.3341901, 1.463019, -1.649159, 0, 1, 0.2509804, 1,
-0.3340142, 0.3350557, -1.669743, 0, 1, 0.254902, 1,
-0.333087, 0.1012126, -0.6583077, 0, 1, 0.2627451, 1,
-0.330785, -0.3386282, -0.1913447, 0, 1, 0.2666667, 1,
-0.3303841, 2.319851, 0.3731948, 0, 1, 0.2745098, 1,
-0.3301567, 0.6922271, 0.387198, 0, 1, 0.2784314, 1,
-0.3277749, 0.2278428, -0.9176724, 0, 1, 0.2862745, 1,
-0.3250791, 0.5244015, 0.2536736, 0, 1, 0.2901961, 1,
-0.3189246, -0.4471303, -2.566682, 0, 1, 0.2980392, 1,
-0.3157763, -2.274417, -3.897766, 0, 1, 0.3058824, 1,
-0.3146148, 1.268213, 0.416984, 0, 1, 0.3098039, 1,
-0.3140667, -0.2293627, -1.561689, 0, 1, 0.3176471, 1,
-0.3128271, 0.8059697, -0.940571, 0, 1, 0.3215686, 1,
-0.3086368, 0.1823916, 1.204127, 0, 1, 0.3294118, 1,
-0.3078909, -0.1984902, -2.411604, 0, 1, 0.3333333, 1,
-0.306961, -0.2541609, -2.272116, 0, 1, 0.3411765, 1,
-0.306813, -0.9314179, -3.278639, 0, 1, 0.345098, 1,
-0.2999888, 0.3540474, -1.436523, 0, 1, 0.3529412, 1,
-0.2985913, -0.001708191, -0.5514094, 0, 1, 0.3568628, 1,
-0.2958679, 0.6354446, -0.4497231, 0, 1, 0.3647059, 1,
-0.2938446, -0.4586164, -0.5192627, 0, 1, 0.3686275, 1,
-0.2925285, -0.2211361, -0.9924313, 0, 1, 0.3764706, 1,
-0.2887318, 0.1058963, -0.7302445, 0, 1, 0.3803922, 1,
-0.2786014, 0.6902115, 0.6824207, 0, 1, 0.3882353, 1,
-0.26948, -0.04001074, -1.729921, 0, 1, 0.3921569, 1,
-0.2686251, -0.03592115, -2.572961, 0, 1, 0.4, 1,
-0.2686226, -0.1302295, -2.33517, 0, 1, 0.4078431, 1,
-0.2672529, -0.6330034, -1.939437, 0, 1, 0.4117647, 1,
-0.2644993, -0.7236803, -4.182315, 0, 1, 0.4196078, 1,
-0.2644539, -0.2387058, -1.034239, 0, 1, 0.4235294, 1,
-0.2590635, 1.595697, 0.9928352, 0, 1, 0.4313726, 1,
-0.2564409, 0.3393223, 1.150693, 0, 1, 0.4352941, 1,
-0.2561391, 2.39907, -0.6572245, 0, 1, 0.4431373, 1,
-0.2527039, -0.4253313, -2.822346, 0, 1, 0.4470588, 1,
-0.2507219, 0.8437607, 0.4915471, 0, 1, 0.454902, 1,
-0.2500267, -0.8022096, -2.295658, 0, 1, 0.4588235, 1,
-0.2496185, -1.778811, -1.463818, 0, 1, 0.4666667, 1,
-0.2487099, 0.5384794, 0.9856006, 0, 1, 0.4705882, 1,
-0.2472627, -1.169888, -3.320538, 0, 1, 0.4784314, 1,
-0.2421559, -1.998866, -1.586907, 0, 1, 0.4823529, 1,
-0.2391099, 0.08738638, -2.123913, 0, 1, 0.4901961, 1,
-0.2371597, -0.7675304, -4.259853, 0, 1, 0.4941176, 1,
-0.2347565, 0.7828041, -0.9111146, 0, 1, 0.5019608, 1,
-0.2331952, -0.01968331, -1.610755, 0, 1, 0.509804, 1,
-0.2327191, 0.4485546, -1.592556, 0, 1, 0.5137255, 1,
-0.2297251, 1.017489, -1.083825, 0, 1, 0.5215687, 1,
-0.2286125, -0.3302605, -2.303758, 0, 1, 0.5254902, 1,
-0.2270315, -0.2501422, -1.881185, 0, 1, 0.5333334, 1,
-0.2254942, -1.929635, -1.338433, 0, 1, 0.5372549, 1,
-0.2244495, -0.1586764, -1.950643, 0, 1, 0.5450981, 1,
-0.2229091, -0.4512137, -1.774172, 0, 1, 0.5490196, 1,
-0.2203653, 0.6666935, 1.238763, 0, 1, 0.5568628, 1,
-0.2181287, -0.1701959, -1.07668, 0, 1, 0.5607843, 1,
-0.2178982, 1.522798, -0.2933526, 0, 1, 0.5686275, 1,
-0.2109348, 0.2630294, -0.8808295, 0, 1, 0.572549, 1,
-0.2108588, -2.292416, -2.541454, 0, 1, 0.5803922, 1,
-0.2080573, -1.649866, -2.818579, 0, 1, 0.5843138, 1,
-0.2080294, 0.6392354, 0.515315, 0, 1, 0.5921569, 1,
-0.2062553, 0.2878831, -1.121544, 0, 1, 0.5960785, 1,
-0.2043089, 1.136318, -0.2715274, 0, 1, 0.6039216, 1,
-0.1973391, 0.1521726, -0.2129324, 0, 1, 0.6117647, 1,
-0.1953467, -0.3126519, -1.218345, 0, 1, 0.6156863, 1,
-0.1952875, -1.263977, -3.539884, 0, 1, 0.6235294, 1,
-0.1894484, -1.97587, -0.8447717, 0, 1, 0.627451, 1,
-0.1858204, -1.175188, -3.252307, 0, 1, 0.6352941, 1,
-0.1810349, 1.147502, -1.805321, 0, 1, 0.6392157, 1,
-0.178145, 0.9421117, -2.10984, 0, 1, 0.6470588, 1,
-0.1780065, -1.229999, -2.515719, 0, 1, 0.6509804, 1,
-0.1778383, 2.152693, -0.1892372, 0, 1, 0.6588235, 1,
-0.1728732, -3.092174, -2.682578, 0, 1, 0.6627451, 1,
-0.1720944, 0.8755327, 0.08821184, 0, 1, 0.6705883, 1,
-0.1660807, 0.8894944, -0.6275955, 0, 1, 0.6745098, 1,
-0.1586559, -0.08455902, -1.28335, 0, 1, 0.682353, 1,
-0.1575631, -0.3116789, -2.78982, 0, 1, 0.6862745, 1,
-0.154475, -0.5946972, -2.166603, 0, 1, 0.6941177, 1,
-0.1516128, -0.8817244, -3.630258, 0, 1, 0.7019608, 1,
-0.1484213, 0.3078441, -2.182237, 0, 1, 0.7058824, 1,
-0.1372592, 0.2503238, -0.8024891, 0, 1, 0.7137255, 1,
-0.1362572, 0.07767522, -0.9953969, 0, 1, 0.7176471, 1,
-0.1346954, 0.6831536, -0.3486477, 0, 1, 0.7254902, 1,
-0.1341585, -1.802187, -5.304509, 0, 1, 0.7294118, 1,
-0.1257542, -0.1700713, -3.193944, 0, 1, 0.7372549, 1,
-0.1252567, 0.7441919, -1.649474, 0, 1, 0.7411765, 1,
-0.1168401, 1.293413, -0.1192491, 0, 1, 0.7490196, 1,
-0.1167166, 0.4823803, -0.9105469, 0, 1, 0.7529412, 1,
-0.1166901, 0.309307, -0.8354448, 0, 1, 0.7607843, 1,
-0.1147809, -1.198832, -3.97203, 0, 1, 0.7647059, 1,
-0.1100349, -0.3885107, -3.238299, 0, 1, 0.772549, 1,
-0.1072741, 1.409683, -0.05320045, 0, 1, 0.7764706, 1,
-0.1013381, 0.3813994, 0.2068187, 0, 1, 0.7843137, 1,
-0.09617931, 0.6148106, -0.1016014, 0, 1, 0.7882353, 1,
-0.08524922, 0.1470997, -0.46463, 0, 1, 0.7960784, 1,
-0.08335149, 0.8307377, 2.017504, 0, 1, 0.8039216, 1,
-0.08304832, -0.5183139, -3.781608, 0, 1, 0.8078431, 1,
-0.08164524, 0.5132747, -0.4763691, 0, 1, 0.8156863, 1,
-0.08068049, -0.292174, -2.285199, 0, 1, 0.8196079, 1,
-0.07647657, -1.309147, -2.093916, 0, 1, 0.827451, 1,
-0.07206088, -0.02088552, -3.298722, 0, 1, 0.8313726, 1,
-0.06753877, -0.1495377, -2.706733, 0, 1, 0.8392157, 1,
-0.06617528, 0.2132722, -1.003541, 0, 1, 0.8431373, 1,
-0.06210189, 0.1041374, -0.9485691, 0, 1, 0.8509804, 1,
-0.05986672, 1.427679, 0.4833693, 0, 1, 0.854902, 1,
-0.05355173, 1.340795, 0.3283521, 0, 1, 0.8627451, 1,
-0.05253216, -1.276546, -3.359412, 0, 1, 0.8666667, 1,
-0.04977439, 0.2844415, 0.6242632, 0, 1, 0.8745098, 1,
-0.04712583, 0.06870809, 0.7649141, 0, 1, 0.8784314, 1,
-0.04204668, -1.436174, -2.00282, 0, 1, 0.8862745, 1,
-0.03988522, -0.7514074, -4.139264, 0, 1, 0.8901961, 1,
-0.03979848, -1.687551, -2.811761, 0, 1, 0.8980392, 1,
-0.0333049, 1.66591, 0.6773914, 0, 1, 0.9058824, 1,
-0.03225737, -2.401223, -3.326527, 0, 1, 0.9098039, 1,
-0.03012718, 0.7486596, -2.023715, 0, 1, 0.9176471, 1,
-0.02599217, 1.882247, -0.06871867, 0, 1, 0.9215686, 1,
-0.02056901, -0.1896553, -2.276081, 0, 1, 0.9294118, 1,
-0.01613843, 0.9054389, 1.174501, 0, 1, 0.9333333, 1,
-0.01358261, -0.6183692, -2.633341, 0, 1, 0.9411765, 1,
-0.01308595, -0.2040467, -2.379014, 0, 1, 0.945098, 1,
-0.01164666, 0.4251115, -1.224354, 0, 1, 0.9529412, 1,
-0.01091339, 1.344548, -1.053534, 0, 1, 0.9568627, 1,
-0.009741942, 0.3478964, 0.8673535, 0, 1, 0.9647059, 1,
-0.008739381, 1.673864, -2.149249, 0, 1, 0.9686275, 1,
-0.006373384, -1.744991, -2.783303, 0, 1, 0.9764706, 1,
-0.004435236, 1.023898, 0.142661, 0, 1, 0.9803922, 1,
-0.001192134, 0.1371723, 0.3715703, 0, 1, 0.9882353, 1,
3.420917e-06, -1.351126, 4.624396, 0, 1, 0.9921569, 1,
0.002381919, -0.2599811, 4.406269, 0, 1, 1, 1,
0.00266952, 0.005902713, 0.7037707, 0, 0.9921569, 1, 1,
0.003715412, -3.512865e-06, -0.2858883, 0, 0.9882353, 1, 1,
0.003892604, -0.7114165, 2.990778, 0, 0.9803922, 1, 1,
0.00413286, 0.4652253, 0.4620341, 0, 0.9764706, 1, 1,
0.004686185, 0.5184326, -0.0007069045, 0, 0.9686275, 1, 1,
0.006692135, -1.188777, 3.539489, 0, 0.9647059, 1, 1,
0.008890758, 0.05541724, -0.5465621, 0, 0.9568627, 1, 1,
0.009552365, -3.604142, 3.329431, 0, 0.9529412, 1, 1,
0.01204134, -0.669532, 2.44912, 0, 0.945098, 1, 1,
0.01276346, -0.6123065, 2.291225, 0, 0.9411765, 1, 1,
0.01787888, -0.2656081, 1.500873, 0, 0.9333333, 1, 1,
0.02163998, -1.282012, 3.943173, 0, 0.9294118, 1, 1,
0.02709105, -1.359353, 4.077588, 0, 0.9215686, 1, 1,
0.02912581, -0.5881844, 1.846297, 0, 0.9176471, 1, 1,
0.03147218, 0.6469461, 0.7678285, 0, 0.9098039, 1, 1,
0.03190643, 0.3290641, -0.1984658, 0, 0.9058824, 1, 1,
0.0339824, -1.575455, 2.538547, 0, 0.8980392, 1, 1,
0.03778202, -0.6361526, 2.446821, 0, 0.8901961, 1, 1,
0.03792563, 0.04944128, 0.7223911, 0, 0.8862745, 1, 1,
0.0393738, -0.7280242, 3.838699, 0, 0.8784314, 1, 1,
0.04017511, -0.6947564, 4.189883, 0, 0.8745098, 1, 1,
0.04559871, -0.2854824, 3.650593, 0, 0.8666667, 1, 1,
0.04677633, 1.350523, 0.781285, 0, 0.8627451, 1, 1,
0.04852952, -0.1735669, 1.946382, 0, 0.854902, 1, 1,
0.05054296, 2.243431, -1.030833, 0, 0.8509804, 1, 1,
0.05246633, 0.3298392, 0.6743394, 0, 0.8431373, 1, 1,
0.05848202, -0.5337749, 2.563362, 0, 0.8392157, 1, 1,
0.0611742, -2.313215, 1.936348, 0, 0.8313726, 1, 1,
0.06376033, 0.1854771, 0.158348, 0, 0.827451, 1, 1,
0.0710429, -0.4169966, 3.362668, 0, 0.8196079, 1, 1,
0.07742927, -0.3408567, 4.233829, 0, 0.8156863, 1, 1,
0.07763187, 1.242401, 0.9784559, 0, 0.8078431, 1, 1,
0.07816039, 0.4092986, 0.02091965, 0, 0.8039216, 1, 1,
0.07828511, -0.5480786, 2.971738, 0, 0.7960784, 1, 1,
0.08087683, -1.968013, 3.021233, 0, 0.7882353, 1, 1,
0.08235037, -1.160871, 2.813561, 0, 0.7843137, 1, 1,
0.08269162, -1.644254, 2.687709, 0, 0.7764706, 1, 1,
0.08434267, 1.231311, -0.278689, 0, 0.772549, 1, 1,
0.08888113, -0.2422428, 2.552855, 0, 0.7647059, 1, 1,
0.089862, -0.5161667, 0.8849692, 0, 0.7607843, 1, 1,
0.09021743, 0.3560885, 1.736258, 0, 0.7529412, 1, 1,
0.09130225, 1.862177, 0.01998769, 0, 0.7490196, 1, 1,
0.09712955, -0.2810393, 2.501986, 0, 0.7411765, 1, 1,
0.101587, 1.414094, 0.313847, 0, 0.7372549, 1, 1,
0.1022985, -0.9888159, 4.442044, 0, 0.7294118, 1, 1,
0.1025385, 0.6529089, -0.2829693, 0, 0.7254902, 1, 1,
0.1033705, -0.6069953, 3.447739, 0, 0.7176471, 1, 1,
0.1067684, -0.03903363, 1.029673, 0, 0.7137255, 1, 1,
0.1082491, -0.2230296, 1.97627, 0, 0.7058824, 1, 1,
0.1111258, -1.255405, 4.250336, 0, 0.6980392, 1, 1,
0.1229362, 0.5306686, -0.828702, 0, 0.6941177, 1, 1,
0.1308234, 0.1995868, -0.9402893, 0, 0.6862745, 1, 1,
0.131605, -0.8283851, 2.855454, 0, 0.682353, 1, 1,
0.1343553, 0.9297016, -0.2584234, 0, 0.6745098, 1, 1,
0.1344848, -0.7451487, 3.289722, 0, 0.6705883, 1, 1,
0.1352043, 0.491015, 0.9834196, 0, 0.6627451, 1, 1,
0.1353887, 0.2546402, 0.769042, 0, 0.6588235, 1, 1,
0.1371243, -0.6561813, 2.254268, 0, 0.6509804, 1, 1,
0.1378971, -0.170633, 1.847198, 0, 0.6470588, 1, 1,
0.1392106, 2.428394, 2.40279, 0, 0.6392157, 1, 1,
0.1401474, -0.1408595, 1.354449, 0, 0.6352941, 1, 1,
0.1439484, 0.04210922, -0.2518435, 0, 0.627451, 1, 1,
0.1444993, 0.791859, -0.2216002, 0, 0.6235294, 1, 1,
0.1547991, -0.6674877, 3.754504, 0, 0.6156863, 1, 1,
0.1548494, 1.727254, 0.6662391, 0, 0.6117647, 1, 1,
0.1569778, -0.3483834, 3.290333, 0, 0.6039216, 1, 1,
0.1600847, -0.3299728, 2.320149, 0, 0.5960785, 1, 1,
0.1667505, 0.1661916, 2.242133, 0, 0.5921569, 1, 1,
0.1717392, -1.162126, 2.227092, 0, 0.5843138, 1, 1,
0.1757945, -1.547402, 3.041876, 0, 0.5803922, 1, 1,
0.175927, 0.7676222, 0.4059041, 0, 0.572549, 1, 1,
0.1769317, -0.3496302, 1.99514, 0, 0.5686275, 1, 1,
0.1787185, 0.333008, -1.459776, 0, 0.5607843, 1, 1,
0.1826044, 0.6967334, -0.6591765, 0, 0.5568628, 1, 1,
0.1853336, -2.072256, 1.288124, 0, 0.5490196, 1, 1,
0.1899763, -0.2289249, 0.3166494, 0, 0.5450981, 1, 1,
0.1928177, 0.8751596, -1.502043, 0, 0.5372549, 1, 1,
0.1934602, -1.388702, 2.90887, 0, 0.5333334, 1, 1,
0.1969927, -0.5497786, 3.378162, 0, 0.5254902, 1, 1,
0.2024376, -1.769779, 1.6208, 0, 0.5215687, 1, 1,
0.2099966, 3.366515, 2.121636, 0, 0.5137255, 1, 1,
0.2134119, 1.09622, -0.2761656, 0, 0.509804, 1, 1,
0.2140058, -1.225438, 3.99203, 0, 0.5019608, 1, 1,
0.2183046, 0.8412614, -0.2642811, 0, 0.4941176, 1, 1,
0.2221757, 2.012405, 0.7892755, 0, 0.4901961, 1, 1,
0.2246836, 0.7117584, 0.8345019, 0, 0.4823529, 1, 1,
0.2248392, 1.153059, -0.2484688, 0, 0.4784314, 1, 1,
0.2272317, 1.393634, 1.070228, 0, 0.4705882, 1, 1,
0.2301793, -1.692198, 3.635855, 0, 0.4666667, 1, 1,
0.2304299, 1.253894, 0.02930707, 0, 0.4588235, 1, 1,
0.2432801, -0.6891137, 2.680645, 0, 0.454902, 1, 1,
0.2445329, 0.4193276, -0.9764793, 0, 0.4470588, 1, 1,
0.2472208, 0.5087537, -1.262852, 0, 0.4431373, 1, 1,
0.2535871, -1.449672, 2.336798, 0, 0.4352941, 1, 1,
0.2535936, 0.966686, 1.742317, 0, 0.4313726, 1, 1,
0.2561702, 0.2871643, 0.7879389, 0, 0.4235294, 1, 1,
0.2594491, 0.7078291, -0.3873124, 0, 0.4196078, 1, 1,
0.2599252, 0.2823054, 1.878834, 0, 0.4117647, 1, 1,
0.2640466, 0.1093377, -0.2637736, 0, 0.4078431, 1, 1,
0.2646518, 0.6521646, -0.1480002, 0, 0.4, 1, 1,
0.2651772, -0.2523466, 3.038296, 0, 0.3921569, 1, 1,
0.2693775, -1.531192, 2.948832, 0, 0.3882353, 1, 1,
0.2696928, 1.386366, 0.8740184, 0, 0.3803922, 1, 1,
0.2704439, -1.868228, 2.748786, 0, 0.3764706, 1, 1,
0.2781141, -0.3903137, 2.425183, 0, 0.3686275, 1, 1,
0.2789634, 0.868611, 0.6409544, 0, 0.3647059, 1, 1,
0.2794212, -0.1155003, 1.86153, 0, 0.3568628, 1, 1,
0.2809446, 0.6858154, 3.025197, 0, 0.3529412, 1, 1,
0.2856103, 2.228289, 0.5104488, 0, 0.345098, 1, 1,
0.290282, -0.1457468, 2.03222, 0, 0.3411765, 1, 1,
0.2916176, 0.6775197, -0.3055914, 0, 0.3333333, 1, 1,
0.2934529, 0.1176352, 0.849382, 0, 0.3294118, 1, 1,
0.2944787, -1.972944, 1.605247, 0, 0.3215686, 1, 1,
0.2970828, 0.1206551, 1.066672, 0, 0.3176471, 1, 1,
0.2973216, -0.241517, 2.275671, 0, 0.3098039, 1, 1,
0.2973225, 0.1802979, 2.721711, 0, 0.3058824, 1, 1,
0.3051416, -1.011812, 2.510508, 0, 0.2980392, 1, 1,
0.3056154, -0.930036, 3.008704, 0, 0.2901961, 1, 1,
0.3063569, -1.350943, 1.758452, 0, 0.2862745, 1, 1,
0.315907, -0.6716378, 2.131445, 0, 0.2784314, 1, 1,
0.3192796, -0.5515303, 1.051622, 0, 0.2745098, 1, 1,
0.3195136, -0.9528818, 2.642189, 0, 0.2666667, 1, 1,
0.3257595, -1.229404, 2.309146, 0, 0.2627451, 1, 1,
0.3299722, -0.9281812, 1.602721, 0, 0.254902, 1, 1,
0.3351254, -1.497883, 2.0827, 0, 0.2509804, 1, 1,
0.3371143, 0.8291324, 1.166348, 0, 0.2431373, 1, 1,
0.3379061, 0.9033297, 0.5851165, 0, 0.2392157, 1, 1,
0.3395687, -1.195125, 4.361092, 0, 0.2313726, 1, 1,
0.347066, 0.7622359, -0.9586132, 0, 0.227451, 1, 1,
0.3483784, 0.9688861, -0.5511813, 0, 0.2196078, 1, 1,
0.3499094, 1.655636, 0.9454108, 0, 0.2156863, 1, 1,
0.3521667, -1.286938, 0.7632641, 0, 0.2078431, 1, 1,
0.3549443, -1.373352, 2.81482, 0, 0.2039216, 1, 1,
0.35833, 0.08585381, -0.2304195, 0, 0.1960784, 1, 1,
0.363409, -1.016837, 3.002839, 0, 0.1882353, 1, 1,
0.3651147, -0.08922873, 1.463313, 0, 0.1843137, 1, 1,
0.3658143, -1.317457, 4.277083, 0, 0.1764706, 1, 1,
0.3673904, -0.09113248, 2.558028, 0, 0.172549, 1, 1,
0.3680254, -0.0484811, 2.727173, 0, 0.1647059, 1, 1,
0.3688889, 1.259983, -0.1375613, 0, 0.1607843, 1, 1,
0.3709248, -2.046099, 3.055428, 0, 0.1529412, 1, 1,
0.3734204, -0.9083912, 2.611519, 0, 0.1490196, 1, 1,
0.3745537, -0.03179744, 1.639104, 0, 0.1411765, 1, 1,
0.3751484, 0.6989726, 0.9470192, 0, 0.1372549, 1, 1,
0.38427, 0.2317316, -0.1922846, 0, 0.1294118, 1, 1,
0.3862402, 0.234575, 0.6357556, 0, 0.1254902, 1, 1,
0.3865417, -0.7996502, 3.308318, 0, 0.1176471, 1, 1,
0.3929489, 0.9121284, 1.847065, 0, 0.1137255, 1, 1,
0.3961817, -0.04384868, 1.412233, 0, 0.1058824, 1, 1,
0.4030702, 1.629683, 0.3636236, 0, 0.09803922, 1, 1,
0.4032917, 0.808621, 0.8473677, 0, 0.09411765, 1, 1,
0.4048519, 0.02875138, 1.201639, 0, 0.08627451, 1, 1,
0.4067837, 0.7604023, 1.107467, 0, 0.08235294, 1, 1,
0.4121868, 0.5718489, -1.475642, 0, 0.07450981, 1, 1,
0.4233943, -1.336007, 3.687171, 0, 0.07058824, 1, 1,
0.4237256, -0.3435396, 2.493428, 0, 0.0627451, 1, 1,
0.4269848, -0.4258002, 2.935896, 0, 0.05882353, 1, 1,
0.4297984, -0.8716276, 2.725268, 0, 0.05098039, 1, 1,
0.438345, -0.4817152, 2.68362, 0, 0.04705882, 1, 1,
0.4399889, 2.011435, 1.966001, 0, 0.03921569, 1, 1,
0.4411117, 0.4984857, 1.261291, 0, 0.03529412, 1, 1,
0.4447057, 0.1139387, 1.349586, 0, 0.02745098, 1, 1,
0.4457086, -1.00445, 1.850245, 0, 0.02352941, 1, 1,
0.4472596, -0.8312303, 3.05429, 0, 0.01568628, 1, 1,
0.447701, 0.5141164, 0.6905336, 0, 0.01176471, 1, 1,
0.4490044, -1.109681, 1.420154, 0, 0.003921569, 1, 1,
0.4519769, -0.3655683, 1.001156, 0.003921569, 0, 1, 1,
0.4529586, 0.7069353, 0.4337776, 0.007843138, 0, 1, 1,
0.4567682, -0.691485, 4.610297, 0.01568628, 0, 1, 1,
0.4575092, -0.3617413, 4.331763, 0.01960784, 0, 1, 1,
0.4660901, -0.0683068, 2.324977, 0.02745098, 0, 1, 1,
0.4666006, 0.07381537, 3.379481, 0.03137255, 0, 1, 1,
0.4710895, 0.8046062, 0.04969951, 0.03921569, 0, 1, 1,
0.4729005, -1.975066, 2.745387, 0.04313726, 0, 1, 1,
0.4742769, 0.7344462, -0.127648, 0.05098039, 0, 1, 1,
0.4758871, -1.283278, 3.489326, 0.05490196, 0, 1, 1,
0.477429, -0.07957955, 2.010852, 0.0627451, 0, 1, 1,
0.4809493, -0.8717355, 3.551714, 0.06666667, 0, 1, 1,
0.4811294, -0.6271043, 3.28119, 0.07450981, 0, 1, 1,
0.4823326, -0.05272206, 0.8675913, 0.07843138, 0, 1, 1,
0.4841774, -0.5011975, 2.836111, 0.08627451, 0, 1, 1,
0.4929786, 0.945771, 0.1013225, 0.09019608, 0, 1, 1,
0.4953372, -1.13782, 2.174917, 0.09803922, 0, 1, 1,
0.4971858, -0.4518891, 2.722378, 0.1058824, 0, 1, 1,
0.4973007, -0.2125594, 2.799884, 0.1098039, 0, 1, 1,
0.498419, -0.5836907, 1.545665, 0.1176471, 0, 1, 1,
0.4992476, -0.8348021, 3.081522, 0.1215686, 0, 1, 1,
0.5065651, 1.04329, -1.406447, 0.1294118, 0, 1, 1,
0.5077628, -1.010324, 2.532759, 0.1333333, 0, 1, 1,
0.5100932, 0.2655059, 2.8388, 0.1411765, 0, 1, 1,
0.5139195, -1.145111, 2.470925, 0.145098, 0, 1, 1,
0.5142732, 0.4416349, 0.5641354, 0.1529412, 0, 1, 1,
0.5156213, 1.110692, -0.2671781, 0.1568628, 0, 1, 1,
0.5196448, -1.708361, 3.496718, 0.1647059, 0, 1, 1,
0.5237875, 0.8269067, 1.799468, 0.1686275, 0, 1, 1,
0.5326741, -0.9296845, 3.866438, 0.1764706, 0, 1, 1,
0.5330124, -1.59704, 2.394676, 0.1803922, 0, 1, 1,
0.5354538, 0.1707038, 2.823936, 0.1882353, 0, 1, 1,
0.5378771, -0.7807133, 2.794606, 0.1921569, 0, 1, 1,
0.5461618, 0.8481385, 1.010557, 0.2, 0, 1, 1,
0.5479071, -0.8939819, 2.479266, 0.2078431, 0, 1, 1,
0.5519671, -0.2273311, 1.839066, 0.2117647, 0, 1, 1,
0.5524521, -0.6832535, 4.233614, 0.2196078, 0, 1, 1,
0.5586006, -1.883742, 3.883165, 0.2235294, 0, 1, 1,
0.5591704, 0.2330222, 2.034607, 0.2313726, 0, 1, 1,
0.561047, -0.4280448, 3.210908, 0.2352941, 0, 1, 1,
0.5613073, 0.1436261, 0.1839635, 0.2431373, 0, 1, 1,
0.5614243, -0.6064901, 2.320359, 0.2470588, 0, 1, 1,
0.5614432, 0.9879501, -0.1434752, 0.254902, 0, 1, 1,
0.5615022, 1.491007, 1.563981, 0.2588235, 0, 1, 1,
0.5663807, -0.8240677, 3.135381, 0.2666667, 0, 1, 1,
0.5677989, -0.528504, 2.088208, 0.2705882, 0, 1, 1,
0.5678591, 0.7826034, 0.1268263, 0.2784314, 0, 1, 1,
0.5683148, -1.04443, 2.856447, 0.282353, 0, 1, 1,
0.5687667, -0.9629198, 3.712207, 0.2901961, 0, 1, 1,
0.569952, -0.1028387, 1.217007, 0.2941177, 0, 1, 1,
0.5723206, 0.1379896, 0.01455776, 0.3019608, 0, 1, 1,
0.5753329, 1.223462, 1.189613, 0.3098039, 0, 1, 1,
0.5758569, -0.9445781, 3.55682, 0.3137255, 0, 1, 1,
0.5880005, 0.4420398, 0.9722305, 0.3215686, 0, 1, 1,
0.5959691, 0.1880243, 0.1015097, 0.3254902, 0, 1, 1,
0.5972148, -1.890601, 3.794488, 0.3333333, 0, 1, 1,
0.6034137, 0.0618378, -0.06366961, 0.3372549, 0, 1, 1,
0.6049479, -0.6717385, 2.979987, 0.345098, 0, 1, 1,
0.6057924, 0.9772751, -0.3983846, 0.3490196, 0, 1, 1,
0.6076288, 0.6229076, 2.336378, 0.3568628, 0, 1, 1,
0.6104645, 0.7884402, -2.44096, 0.3607843, 0, 1, 1,
0.6109372, -1.291104, 3.958743, 0.3686275, 0, 1, 1,
0.6235724, 1.12371, 2.146996, 0.372549, 0, 1, 1,
0.624029, -0.1101167, -0.3022317, 0.3803922, 0, 1, 1,
0.6274768, -0.8719871, 3.125552, 0.3843137, 0, 1, 1,
0.6284369, -0.3883294, 3.059274, 0.3921569, 0, 1, 1,
0.6294026, 0.2865621, 2.028048, 0.3960784, 0, 1, 1,
0.6417682, -0.2920339, 0.9466193, 0.4039216, 0, 1, 1,
0.646514, -0.3915395, 3.120502, 0.4117647, 0, 1, 1,
0.6465816, 1.57742, 0.01231718, 0.4156863, 0, 1, 1,
0.6530201, -0.2153885, 2.52336, 0.4235294, 0, 1, 1,
0.6534922, 0.9696524, 1.988681, 0.427451, 0, 1, 1,
0.6552002, -1.180445, 2.13775, 0.4352941, 0, 1, 1,
0.6552884, -0.2322369, 1.347532, 0.4392157, 0, 1, 1,
0.6634592, 1.360209, 1.436206, 0.4470588, 0, 1, 1,
0.668528, -0.1767959, 2.70134, 0.4509804, 0, 1, 1,
0.6698059, -0.3350112, 3.712847, 0.4588235, 0, 1, 1,
0.6700725, -0.1559019, 1.060484, 0.4627451, 0, 1, 1,
0.6850545, 0.4862395, -0.07099355, 0.4705882, 0, 1, 1,
0.6858157, 0.6599094, 0.809271, 0.4745098, 0, 1, 1,
0.6860512, -1.126027, 2.133498, 0.4823529, 0, 1, 1,
0.6885805, 0.61396, 2.132337, 0.4862745, 0, 1, 1,
0.6891852, -1.164921, 2.705652, 0.4941176, 0, 1, 1,
0.689583, 0.912791, -0.9219393, 0.5019608, 0, 1, 1,
0.6939409, -0.5795671, 4.425273, 0.5058824, 0, 1, 1,
0.6951993, 1.371107, 0.4570191, 0.5137255, 0, 1, 1,
0.6959295, -0.4493913, 1.161309, 0.5176471, 0, 1, 1,
0.6984665, -0.8471594, 1.056691, 0.5254902, 0, 1, 1,
0.7006987, -0.9396428, 2.034046, 0.5294118, 0, 1, 1,
0.7029282, 0.07135543, 1.433184, 0.5372549, 0, 1, 1,
0.7047785, 0.2587113, 1.737002, 0.5411765, 0, 1, 1,
0.7067654, 0.9682108, -1.326995, 0.5490196, 0, 1, 1,
0.7123208, 0.9531201, -0.1207829, 0.5529412, 0, 1, 1,
0.7128027, -1.193334, 3.474852, 0.5607843, 0, 1, 1,
0.7136293, 0.1711624, -1.32199, 0.5647059, 0, 1, 1,
0.7151592, -0.8348428, 4.053991, 0.572549, 0, 1, 1,
0.7168669, -2.145617, 3.563236, 0.5764706, 0, 1, 1,
0.7209455, -3.098899, 1.727239, 0.5843138, 0, 1, 1,
0.7219476, -0.3888345, 3.677705, 0.5882353, 0, 1, 1,
0.7283072, -0.4599322, 2.502668, 0.5960785, 0, 1, 1,
0.7289708, 1.051994, -0.4970754, 0.6039216, 0, 1, 1,
0.7317492, -1.195214, 1.175318, 0.6078432, 0, 1, 1,
0.732003, -0.1079693, 1.027386, 0.6156863, 0, 1, 1,
0.7337794, -0.09928481, 1.304567, 0.6196079, 0, 1, 1,
0.735027, -0.9970115, 2.591081, 0.627451, 0, 1, 1,
0.737579, 1.343812, 0.2183608, 0.6313726, 0, 1, 1,
0.7457896, -0.4744138, 2.266516, 0.6392157, 0, 1, 1,
0.7499798, 1.573065, -0.3975672, 0.6431373, 0, 1, 1,
0.7537884, -0.6279457, -0.4495188, 0.6509804, 0, 1, 1,
0.7541569, 1.357527, 1.361188, 0.654902, 0, 1, 1,
0.7639115, -0.5956792, 4.391482, 0.6627451, 0, 1, 1,
0.7671413, -0.3300146, 0.9139123, 0.6666667, 0, 1, 1,
0.7694757, -2.170233, 4.496495, 0.6745098, 0, 1, 1,
0.7695698, -1.697133, 1.412032, 0.6784314, 0, 1, 1,
0.771878, 0.6942728, 0.8226281, 0.6862745, 0, 1, 1,
0.7737589, 0.4092585, 2.505808, 0.6901961, 0, 1, 1,
0.7739208, -0.0715619, 1.400141, 0.6980392, 0, 1, 1,
0.7757785, 0.4954804, 0.8124231, 0.7058824, 0, 1, 1,
0.7758422, 0.8966313, 1.025655, 0.7098039, 0, 1, 1,
0.7817165, 0.2932627, 0.978465, 0.7176471, 0, 1, 1,
0.7824184, -1.284785, 3.40334, 0.7215686, 0, 1, 1,
0.7845934, 0.9712107, -0.7631444, 0.7294118, 0, 1, 1,
0.786359, -1.196479, 2.197506, 0.7333333, 0, 1, 1,
0.7900765, 0.1746185, 1.654875, 0.7411765, 0, 1, 1,
0.7902932, -0.3127699, 0.1666462, 0.7450981, 0, 1, 1,
0.7945503, -0.7564706, 2.677987, 0.7529412, 0, 1, 1,
0.8022245, -0.2059907, 1.403359, 0.7568628, 0, 1, 1,
0.8048745, -0.4950259, 3.081089, 0.7647059, 0, 1, 1,
0.8068876, -0.6498527, 0.9720104, 0.7686275, 0, 1, 1,
0.8091891, 0.7711986, 1.984544, 0.7764706, 0, 1, 1,
0.8136138, -0.08965499, 2.242004, 0.7803922, 0, 1, 1,
0.8161104, -1.890851, 2.243589, 0.7882353, 0, 1, 1,
0.8177091, 1.683142, 0.09825453, 0.7921569, 0, 1, 1,
0.8219754, 0.1063162, 2.158189, 0.8, 0, 1, 1,
0.8241711, -2.153847, 1.117609, 0.8078431, 0, 1, 1,
0.8266885, -1.233512, 3.901119, 0.8117647, 0, 1, 1,
0.8316, 0.4995754, 2.336511, 0.8196079, 0, 1, 1,
0.8389245, 0.5191492, 0.7732276, 0.8235294, 0, 1, 1,
0.8419924, 0.157137, 1.699009, 0.8313726, 0, 1, 1,
0.8690622, -0.2104219, 1.18994, 0.8352941, 0, 1, 1,
0.8707966, 0.2429648, 0.2470376, 0.8431373, 0, 1, 1,
0.8714412, 1.561235, 1.066537, 0.8470588, 0, 1, 1,
0.8768012, 1.147547, 0.3376493, 0.854902, 0, 1, 1,
0.881712, 1.40566, 0.2681457, 0.8588235, 0, 1, 1,
0.8840016, 2.007345, 0.05427647, 0.8666667, 0, 1, 1,
0.8950581, 1.161476, 0.04641575, 0.8705882, 0, 1, 1,
0.8985487, -0.434329, 2.97542, 0.8784314, 0, 1, 1,
0.8988635, -1.315536, 1.498462, 0.8823529, 0, 1, 1,
0.905416, -0.3598411, 1.095937, 0.8901961, 0, 1, 1,
0.9103116, -0.1112287, 2.271577, 0.8941177, 0, 1, 1,
0.910822, 0.7068079, 2.271865, 0.9019608, 0, 1, 1,
0.911697, -0.4543883, 2.830911, 0.9098039, 0, 1, 1,
0.9137868, 0.2859237, 1.356548, 0.9137255, 0, 1, 1,
0.9170659, 1.287119, -0.2837831, 0.9215686, 0, 1, 1,
0.9234818, 1.11116, 2.250062, 0.9254902, 0, 1, 1,
0.9249032, 1.317646, 1.301458, 0.9333333, 0, 1, 1,
0.9294424, -0.0393504, 1.556989, 0.9372549, 0, 1, 1,
0.9332422, -0.02852383, 2.098089, 0.945098, 0, 1, 1,
0.9358262, 0.6667063, 1.060396, 0.9490196, 0, 1, 1,
0.9374353, -1.417887, 4.160343, 0.9568627, 0, 1, 1,
0.9492971, 1.896469, -0.9578241, 0.9607843, 0, 1, 1,
0.9600154, -1.768249, 4.64252, 0.9686275, 0, 1, 1,
0.9628567, -0.2386304, 4.166968, 0.972549, 0, 1, 1,
0.9728816, -0.7251595, 0.893583, 0.9803922, 0, 1, 1,
0.9749171, -0.08551428, 2.103575, 0.9843137, 0, 1, 1,
0.9778042, 0.03932755, 1.85822, 0.9921569, 0, 1, 1,
0.9807696, 0.7876958, -0.09446196, 0.9960784, 0, 1, 1,
0.990704, -0.4780663, 1.370928, 1, 0, 0.9960784, 1,
1.000495, 0.08015231, 2.114949, 1, 0, 0.9882353, 1,
1.001998, -2.028352, 1.824573, 1, 0, 0.9843137, 1,
1.005239, -0.6221321, 2.598291, 1, 0, 0.9764706, 1,
1.009979, 0.3754247, 3.248252, 1, 0, 0.972549, 1,
1.016383, 1.529253, -0.1016245, 1, 0, 0.9647059, 1,
1.022365, -0.3024045, -0.3810932, 1, 0, 0.9607843, 1,
1.023687, 0.7109334, 0.5952054, 1, 0, 0.9529412, 1,
1.024818, -0.1077262, 0.7333304, 1, 0, 0.9490196, 1,
1.025923, 0.5431383, 1.264273, 1, 0, 0.9411765, 1,
1.027403, 1.154967, 1.506631, 1, 0, 0.9372549, 1,
1.029927, 2.010173, 2.249969, 1, 0, 0.9294118, 1,
1.034837, 0.2188823, 1.479136, 1, 0, 0.9254902, 1,
1.036307, 1.297905, 0.5133238, 1, 0, 0.9176471, 1,
1.039356, 0.6183766, 2.209072, 1, 0, 0.9137255, 1,
1.039971, 0.3365272, 0.6492316, 1, 0, 0.9058824, 1,
1.047804, -0.9068527, 2.98525, 1, 0, 0.9019608, 1,
1.048843, 0.5530397, 0.5213206, 1, 0, 0.8941177, 1,
1.049283, -1.207468, 3.106654, 1, 0, 0.8862745, 1,
1.053097, -0.8877465, 1.680477, 1, 0, 0.8823529, 1,
1.055643, -1.185775, 2.525738, 1, 0, 0.8745098, 1,
1.057029, -0.2760446, 2.125534, 1, 0, 0.8705882, 1,
1.058818, -0.5923132, 2.982252, 1, 0, 0.8627451, 1,
1.0612, 0.6347225, 1.583924, 1, 0, 0.8588235, 1,
1.062437, 0.6382832, 0.3702251, 1, 0, 0.8509804, 1,
1.062745, 1.48286, 0.5626702, 1, 0, 0.8470588, 1,
1.075358, 0.7230756, 1.607364, 1, 0, 0.8392157, 1,
1.084553, 2.324887, 1.271678, 1, 0, 0.8352941, 1,
1.085423, 0.8904033, 2.078214, 1, 0, 0.827451, 1,
1.089556, 0.3363457, -0.2338231, 1, 0, 0.8235294, 1,
1.099536, 1.246607, 0.6117483, 1, 0, 0.8156863, 1,
1.118166, -0.851444, 3.458002, 1, 0, 0.8117647, 1,
1.122582, -0.2123009, 2.672459, 1, 0, 0.8039216, 1,
1.124585, -0.3938817, 3.158147, 1, 0, 0.7960784, 1,
1.126958, 0.712799, 0.4903893, 1, 0, 0.7921569, 1,
1.127585, 1.046728, -0.484316, 1, 0, 0.7843137, 1,
1.133895, -1.457891, 2.536992, 1, 0, 0.7803922, 1,
1.134049, 0.8147825, 1.330296, 1, 0, 0.772549, 1,
1.137634, -0.3873453, 2.137638, 1, 0, 0.7686275, 1,
1.154214, 0.5559195, 0.7089695, 1, 0, 0.7607843, 1,
1.164724, 0.5629973, 2.741029, 1, 0, 0.7568628, 1,
1.168365, 2.168541, 0.2478874, 1, 0, 0.7490196, 1,
1.197625, -2.119139, 3.013216, 1, 0, 0.7450981, 1,
1.197954, 0.79691, -0.2604546, 1, 0, 0.7372549, 1,
1.205553, -0.4851653, 2.112926, 1, 0, 0.7333333, 1,
1.206787, -0.09693343, 2.085888, 1, 0, 0.7254902, 1,
1.209388, 0.3792295, 1.542568, 1, 0, 0.7215686, 1,
1.210328, -1.365371, 0.7332529, 1, 0, 0.7137255, 1,
1.215455, 0.7472717, 1.114049, 1, 0, 0.7098039, 1,
1.216298, -2.248906, 2.276177, 1, 0, 0.7019608, 1,
1.216682, -0.02670315, 0.5045981, 1, 0, 0.6941177, 1,
1.223024, -0.5174685, 0.4601071, 1, 0, 0.6901961, 1,
1.223086, 1.237858, -0.2424992, 1, 0, 0.682353, 1,
1.230343, -0.9206093, 2.126137, 1, 0, 0.6784314, 1,
1.235586, 0.1975591, 1.9567, 1, 0, 0.6705883, 1,
1.239303, 0.07858483, 0.9846313, 1, 0, 0.6666667, 1,
1.244622, -0.3041658, 2.436269, 1, 0, 0.6588235, 1,
1.245771, 0.6098518, 2.085403, 1, 0, 0.654902, 1,
1.259813, -0.781907, 1.529066, 1, 0, 0.6470588, 1,
1.262394, -1.245277, 2.935565, 1, 0, 0.6431373, 1,
1.26442, -1.019449, 1.025506, 1, 0, 0.6352941, 1,
1.268853, 0.03778611, 0.749001, 1, 0, 0.6313726, 1,
1.270065, 0.5121967, 1.777022, 1, 0, 0.6235294, 1,
1.271379, -2.3509, 1.099063, 1, 0, 0.6196079, 1,
1.284798, 0.732636, 0.8450265, 1, 0, 0.6117647, 1,
1.288855, 0.335219, 2.741237, 1, 0, 0.6078432, 1,
1.293354, -0.0216839, 0.9611313, 1, 0, 0.6, 1,
1.301371, -1.338819, 0.247654, 1, 0, 0.5921569, 1,
1.303737, 0.8762099, 0.6027731, 1, 0, 0.5882353, 1,
1.305752, -0.3882442, 2.20887, 1, 0, 0.5803922, 1,
1.307007, -0.4161464, 0.8369125, 1, 0, 0.5764706, 1,
1.307501, 1.053862, -1.073633, 1, 0, 0.5686275, 1,
1.307891, 0.9649682, 1.086582, 1, 0, 0.5647059, 1,
1.308107, 3.38236, -0.5176516, 1, 0, 0.5568628, 1,
1.308137, -0.8195814, 3.944938, 1, 0, 0.5529412, 1,
1.309362, -1.189702, 2.419752, 1, 0, 0.5450981, 1,
1.311093, -0.4693035, 1.766356, 1, 0, 0.5411765, 1,
1.312758, 0.3791776, 3.660853, 1, 0, 0.5333334, 1,
1.319915, -1.099436, 2.302287, 1, 0, 0.5294118, 1,
1.320239, 1.479243, -0.3813679, 1, 0, 0.5215687, 1,
1.325055, 0.5548572, 2.075296, 1, 0, 0.5176471, 1,
1.327418, -0.007807196, 1.942431, 1, 0, 0.509804, 1,
1.331828, 1.316056, 1.31586, 1, 0, 0.5058824, 1,
1.344988, -0.7324859, 2.456539, 1, 0, 0.4980392, 1,
1.345418, 0.4702202, 1.944305, 1, 0, 0.4901961, 1,
1.351525, -1.635012, 3.246883, 1, 0, 0.4862745, 1,
1.353332, 1.644727, -1.093309, 1, 0, 0.4784314, 1,
1.357798, 1.31719, 0.8283384, 1, 0, 0.4745098, 1,
1.36666, 0.9022558, 1.343351, 1, 0, 0.4666667, 1,
1.372485, 0.7823717, 0.1464994, 1, 0, 0.4627451, 1,
1.374559, -0.8498317, 1.236119, 1, 0, 0.454902, 1,
1.376464, 0.6549224, 1.035928, 1, 0, 0.4509804, 1,
1.376961, 0.6048091, 1.232618, 1, 0, 0.4431373, 1,
1.381217, -0.07390992, 3.059618, 1, 0, 0.4392157, 1,
1.408131, -0.3487512, 0.9736376, 1, 0, 0.4313726, 1,
1.408381, 0.4238219, 1.651378, 1, 0, 0.427451, 1,
1.411013, 1.501118, 1.547773, 1, 0, 0.4196078, 1,
1.419707, 1.211167, 0.6720952, 1, 0, 0.4156863, 1,
1.429398, 2.255069, 1.439444, 1, 0, 0.4078431, 1,
1.432605, -0.391073, 0.5422376, 1, 0, 0.4039216, 1,
1.439691, 1.023779, 1.704897, 1, 0, 0.3960784, 1,
1.462296, 1.635983, -1.316174, 1, 0, 0.3882353, 1,
1.474189, -0.7560835, 2.248826, 1, 0, 0.3843137, 1,
1.476916, -1.754654, 2.839233, 1, 0, 0.3764706, 1,
1.477756, -1.130221, 2.924118, 1, 0, 0.372549, 1,
1.486364, -0.2983474, 1.302152, 1, 0, 0.3647059, 1,
1.491767, 0.5336403, 0.4692984, 1, 0, 0.3607843, 1,
1.504949, 0.153187, 0.8787029, 1, 0, 0.3529412, 1,
1.520117, 0.532739, 0.71815, 1, 0, 0.3490196, 1,
1.521959, 0.1566088, 1.631199, 1, 0, 0.3411765, 1,
1.522827, 0.8357206, 0.9992813, 1, 0, 0.3372549, 1,
1.523831, -2.236091, 2.195991, 1, 0, 0.3294118, 1,
1.525282, 1.665496, 0.4119383, 1, 0, 0.3254902, 1,
1.54734, -1.178792, 1.425389, 1, 0, 0.3176471, 1,
1.548638, -1.927631, 2.838631, 1, 0, 0.3137255, 1,
1.565316, 0.07199464, 1.595692, 1, 0, 0.3058824, 1,
1.574103, -0.8390828, 3.334875, 1, 0, 0.2980392, 1,
1.593835, 1.413632, 0.3245394, 1, 0, 0.2941177, 1,
1.616008, -0.4097321, 1.644886, 1, 0, 0.2862745, 1,
1.627179, -0.3060989, 1.88294, 1, 0, 0.282353, 1,
1.637291, 0.01452181, 0.7726177, 1, 0, 0.2745098, 1,
1.648127, -1.566878, 3.304646, 1, 0, 0.2705882, 1,
1.655854, -0.4756844, 0.8421595, 1, 0, 0.2627451, 1,
1.665958, 0.4411733, 0.6007537, 1, 0, 0.2588235, 1,
1.670174, -0.6800603, 0.6023511, 1, 0, 0.2509804, 1,
1.671634, 0.4793657, 1.093759, 1, 0, 0.2470588, 1,
1.674973, -1.658911, 3.046302, 1, 0, 0.2392157, 1,
1.678389, -0.004419787, 2.122397, 1, 0, 0.2352941, 1,
1.70506, -0.1383397, 1.191461, 1, 0, 0.227451, 1,
1.743829, 1.16034, 0.4754108, 1, 0, 0.2235294, 1,
1.749377, 1.403497, -0.5754949, 1, 0, 0.2156863, 1,
1.752136, 0.5290707, 1.385316, 1, 0, 0.2117647, 1,
1.755143, 0.5220824, 0.6312011, 1, 0, 0.2039216, 1,
1.763013, 0.1374447, 2.149518, 1, 0, 0.1960784, 1,
1.764272, -1.676275, 1.159073, 1, 0, 0.1921569, 1,
1.770472, -0.3339302, 0.8518986, 1, 0, 0.1843137, 1,
1.802123, 0.8346169, 0.6827404, 1, 0, 0.1803922, 1,
1.803203, -0.00348248, 2.891705, 1, 0, 0.172549, 1,
1.807302, 1.005399, 1.707353, 1, 0, 0.1686275, 1,
1.866132, -0.3826399, 1.881937, 1, 0, 0.1607843, 1,
1.877716, -1.001631, 2.205995, 1, 0, 0.1568628, 1,
1.881329, 0.2305111, 1.375945, 1, 0, 0.1490196, 1,
1.891537, 0.3399068, 1.763713, 1, 0, 0.145098, 1,
1.896224, -1.501843, 3.745129, 1, 0, 0.1372549, 1,
1.908161, 2.220102, 0.003808051, 1, 0, 0.1333333, 1,
1.917092, 1.396295, 0.8777345, 1, 0, 0.1254902, 1,
1.925015, 0.8946401, 0.9302086, 1, 0, 0.1215686, 1,
1.96085, 0.1921655, 1.956431, 1, 0, 0.1137255, 1,
2.030463, -1.01178, 1.885631, 1, 0, 0.1098039, 1,
2.044066, 0.6794124, 2.026013, 1, 0, 0.1019608, 1,
2.06793, 0.7387259, 0.2321504, 1, 0, 0.09411765, 1,
2.098893, -0.1661794, 1.545319, 1, 0, 0.09019608, 1,
2.103981, -0.7071126, 4.121317, 1, 0, 0.08235294, 1,
2.1365, -0.5072412, 4.103746, 1, 0, 0.07843138, 1,
2.182911, -0.1637679, 1.152933, 1, 0, 0.07058824, 1,
2.240903, 2.146204, 1.710851, 1, 0, 0.06666667, 1,
2.25696, 0.5722576, 1.655227, 1, 0, 0.05882353, 1,
2.279477, -0.6400932, 0.5682206, 1, 0, 0.05490196, 1,
2.374252, -0.3732234, 2.272709, 1, 0, 0.04705882, 1,
2.382438, -0.9212139, 1.513422, 1, 0, 0.04313726, 1,
2.459439, -0.7983268, 2.192838, 1, 0, 0.03529412, 1,
2.575786, -0.8466842, 2.700316, 1, 0, 0.03137255, 1,
2.640343, 0.4367876, 2.250006, 1, 0, 0.02352941, 1,
2.962775, 1.479126, 2.099692, 1, 0, 0.01960784, 1,
2.974193, -0.2633141, -0.1172069, 1, 0, 0.01176471, 1,
3.050835, -0.8836142, 3.668192, 1, 0, 0.007843138, 1
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
-0.1977317, -4.788354, -6.99053, 0, -0.5, 0.5, 0.5,
-0.1977317, -4.788354, -6.99053, 1, -0.5, 0.5, 0.5,
-0.1977317, -4.788354, -6.99053, 1, 1.5, 0.5, 0.5,
-0.1977317, -4.788354, -6.99053, 0, 1.5, 0.5, 0.5
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
-4.547563, -0.110891, -6.99053, 0, -0.5, 0.5, 0.5,
-4.547563, -0.110891, -6.99053, 1, -0.5, 0.5, 0.5,
-4.547563, -0.110891, -6.99053, 1, 1.5, 0.5, 0.5,
-4.547563, -0.110891, -6.99053, 0, 1.5, 0.5, 0.5
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
-4.547563, -4.788354, -0.3309944, 0, -0.5, 0.5, 0.5,
-4.547563, -4.788354, -0.3309944, 1, -0.5, 0.5, 0.5,
-4.547563, -4.788354, -0.3309944, 1, 1.5, 0.5, 0.5,
-4.547563, -4.788354, -0.3309944, 0, 1.5, 0.5, 0.5
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
-3, -3.70894, -5.453714,
3, -3.70894, -5.453714,
-3, -3.70894, -5.453714,
-3, -3.888842, -5.70985,
-2, -3.70894, -5.453714,
-2, -3.888842, -5.70985,
-1, -3.70894, -5.453714,
-1, -3.888842, -5.70985,
0, -3.70894, -5.453714,
0, -3.888842, -5.70985,
1, -3.70894, -5.453714,
1, -3.888842, -5.70985,
2, -3.70894, -5.453714,
2, -3.888842, -5.70985,
3, -3.70894, -5.453714,
3, -3.888842, -5.70985
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
-3, -4.248647, -6.222122, 0, -0.5, 0.5, 0.5,
-3, -4.248647, -6.222122, 1, -0.5, 0.5, 0.5,
-3, -4.248647, -6.222122, 1, 1.5, 0.5, 0.5,
-3, -4.248647, -6.222122, 0, 1.5, 0.5, 0.5,
-2, -4.248647, -6.222122, 0, -0.5, 0.5, 0.5,
-2, -4.248647, -6.222122, 1, -0.5, 0.5, 0.5,
-2, -4.248647, -6.222122, 1, 1.5, 0.5, 0.5,
-2, -4.248647, -6.222122, 0, 1.5, 0.5, 0.5,
-1, -4.248647, -6.222122, 0, -0.5, 0.5, 0.5,
-1, -4.248647, -6.222122, 1, -0.5, 0.5, 0.5,
-1, -4.248647, -6.222122, 1, 1.5, 0.5, 0.5,
-1, -4.248647, -6.222122, 0, 1.5, 0.5, 0.5,
0, -4.248647, -6.222122, 0, -0.5, 0.5, 0.5,
0, -4.248647, -6.222122, 1, -0.5, 0.5, 0.5,
0, -4.248647, -6.222122, 1, 1.5, 0.5, 0.5,
0, -4.248647, -6.222122, 0, 1.5, 0.5, 0.5,
1, -4.248647, -6.222122, 0, -0.5, 0.5, 0.5,
1, -4.248647, -6.222122, 1, -0.5, 0.5, 0.5,
1, -4.248647, -6.222122, 1, 1.5, 0.5, 0.5,
1, -4.248647, -6.222122, 0, 1.5, 0.5, 0.5,
2, -4.248647, -6.222122, 0, -0.5, 0.5, 0.5,
2, -4.248647, -6.222122, 1, -0.5, 0.5, 0.5,
2, -4.248647, -6.222122, 1, 1.5, 0.5, 0.5,
2, -4.248647, -6.222122, 0, 1.5, 0.5, 0.5,
3, -4.248647, -6.222122, 0, -0.5, 0.5, 0.5,
3, -4.248647, -6.222122, 1, -0.5, 0.5, 0.5,
3, -4.248647, -6.222122, 1, 1.5, 0.5, 0.5,
3, -4.248647, -6.222122, 0, 1.5, 0.5, 0.5
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
-3.543755, -3, -5.453714,
-3.543755, 3, -5.453714,
-3.543755, -3, -5.453714,
-3.711056, -3, -5.70985,
-3.543755, -2, -5.453714,
-3.711056, -2, -5.70985,
-3.543755, -1, -5.453714,
-3.711056, -1, -5.70985,
-3.543755, 0, -5.453714,
-3.711056, 0, -5.70985,
-3.543755, 1, -5.453714,
-3.711056, 1, -5.70985,
-3.543755, 2, -5.453714,
-3.711056, 2, -5.70985,
-3.543755, 3, -5.453714,
-3.711056, 3, -5.70985
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
-4.045659, -3, -6.222122, 0, -0.5, 0.5, 0.5,
-4.045659, -3, -6.222122, 1, -0.5, 0.5, 0.5,
-4.045659, -3, -6.222122, 1, 1.5, 0.5, 0.5,
-4.045659, -3, -6.222122, 0, 1.5, 0.5, 0.5,
-4.045659, -2, -6.222122, 0, -0.5, 0.5, 0.5,
-4.045659, -2, -6.222122, 1, -0.5, 0.5, 0.5,
-4.045659, -2, -6.222122, 1, 1.5, 0.5, 0.5,
-4.045659, -2, -6.222122, 0, 1.5, 0.5, 0.5,
-4.045659, -1, -6.222122, 0, -0.5, 0.5, 0.5,
-4.045659, -1, -6.222122, 1, -0.5, 0.5, 0.5,
-4.045659, -1, -6.222122, 1, 1.5, 0.5, 0.5,
-4.045659, -1, -6.222122, 0, 1.5, 0.5, 0.5,
-4.045659, 0, -6.222122, 0, -0.5, 0.5, 0.5,
-4.045659, 0, -6.222122, 1, -0.5, 0.5, 0.5,
-4.045659, 0, -6.222122, 1, 1.5, 0.5, 0.5,
-4.045659, 0, -6.222122, 0, 1.5, 0.5, 0.5,
-4.045659, 1, -6.222122, 0, -0.5, 0.5, 0.5,
-4.045659, 1, -6.222122, 1, -0.5, 0.5, 0.5,
-4.045659, 1, -6.222122, 1, 1.5, 0.5, 0.5,
-4.045659, 1, -6.222122, 0, 1.5, 0.5, 0.5,
-4.045659, 2, -6.222122, 0, -0.5, 0.5, 0.5,
-4.045659, 2, -6.222122, 1, -0.5, 0.5, 0.5,
-4.045659, 2, -6.222122, 1, 1.5, 0.5, 0.5,
-4.045659, 2, -6.222122, 0, 1.5, 0.5, 0.5,
-4.045659, 3, -6.222122, 0, -0.5, 0.5, 0.5,
-4.045659, 3, -6.222122, 1, -0.5, 0.5, 0.5,
-4.045659, 3, -6.222122, 1, 1.5, 0.5, 0.5,
-4.045659, 3, -6.222122, 0, 1.5, 0.5, 0.5
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
-3.543755, -3.70894, -4,
-3.543755, -3.70894, 4,
-3.543755, -3.70894, -4,
-3.711056, -3.888842, -4,
-3.543755, -3.70894, -2,
-3.711056, -3.888842, -2,
-3.543755, -3.70894, 0,
-3.711056, -3.888842, 0,
-3.543755, -3.70894, 2,
-3.711056, -3.888842, 2,
-3.543755, -3.70894, 4,
-3.711056, -3.888842, 4
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
-4.045659, -4.248647, -4, 0, -0.5, 0.5, 0.5,
-4.045659, -4.248647, -4, 1, -0.5, 0.5, 0.5,
-4.045659, -4.248647, -4, 1, 1.5, 0.5, 0.5,
-4.045659, -4.248647, -4, 0, 1.5, 0.5, 0.5,
-4.045659, -4.248647, -2, 0, -0.5, 0.5, 0.5,
-4.045659, -4.248647, -2, 1, -0.5, 0.5, 0.5,
-4.045659, -4.248647, -2, 1, 1.5, 0.5, 0.5,
-4.045659, -4.248647, -2, 0, 1.5, 0.5, 0.5,
-4.045659, -4.248647, 0, 0, -0.5, 0.5, 0.5,
-4.045659, -4.248647, 0, 1, -0.5, 0.5, 0.5,
-4.045659, -4.248647, 0, 1, 1.5, 0.5, 0.5,
-4.045659, -4.248647, 0, 0, 1.5, 0.5, 0.5,
-4.045659, -4.248647, 2, 0, -0.5, 0.5, 0.5,
-4.045659, -4.248647, 2, 1, -0.5, 0.5, 0.5,
-4.045659, -4.248647, 2, 1, 1.5, 0.5, 0.5,
-4.045659, -4.248647, 2, 0, 1.5, 0.5, 0.5,
-4.045659, -4.248647, 4, 0, -0.5, 0.5, 0.5,
-4.045659, -4.248647, 4, 1, -0.5, 0.5, 0.5,
-4.045659, -4.248647, 4, 1, 1.5, 0.5, 0.5,
-4.045659, -4.248647, 4, 0, 1.5, 0.5, 0.5
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
-3.543755, -3.70894, -5.453714,
-3.543755, 3.487158, -5.453714,
-3.543755, -3.70894, 4.791725,
-3.543755, 3.487158, 4.791725,
-3.543755, -3.70894, -5.453714,
-3.543755, -3.70894, 4.791725,
-3.543755, 3.487158, -5.453714,
-3.543755, 3.487158, 4.791725,
-3.543755, -3.70894, -5.453714,
3.148292, -3.70894, -5.453714,
-3.543755, -3.70894, 4.791725,
3.148292, -3.70894, 4.791725,
-3.543755, 3.487158, -5.453714,
3.148292, 3.487158, -5.453714,
-3.543755, 3.487158, 4.791725,
3.148292, 3.487158, 4.791725,
3.148292, -3.70894, -5.453714,
3.148292, 3.487158, -5.453714,
3.148292, -3.70894, 4.791725,
3.148292, 3.487158, 4.791725,
3.148292, -3.70894, -5.453714,
3.148292, -3.70894, 4.791725,
3.148292, 3.487158, -5.453714,
3.148292, 3.487158, 4.791725
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
var radius = 7.580575;
var distance = 33.72683;
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
mvMatrix.translate( 0.1977317, 0.110891, 0.3309944 );
mvMatrix.scale( 1.224777, 1.138988, 0.7999917 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.72683);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
pyriminobac-methyl<-read.table("pyriminobac-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyriminobac-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyriminobac' not found
```

```r
y<-pyriminobac-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyriminobac' not found
```

```r
z<-pyriminobac-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyriminobac' not found
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
-3.446298, 0.3564497, -1.252968, 0, 0, 1, 1, 1,
-2.987889, -0.7450994, -2.473045, 1, 0, 0, 1, 1,
-2.831283, -2.154194, -2.678411, 1, 0, 0, 1, 1,
-2.695818, 0.8019457, -2.661887, 1, 0, 0, 1, 1,
-2.577301, -0.06413526, -1.101637, 1, 0, 0, 1, 1,
-2.528763, -0.1206844, -0.03285972, 1, 0, 0, 1, 1,
-2.477784, 0.132048, -0.8672284, 0, 0, 0, 1, 1,
-2.377656, -0.3663169, -1.660928, 0, 0, 0, 1, 1,
-2.356769, -0.5459237, -0.5705492, 0, 0, 0, 1, 1,
-2.316069, 1.80298, -0.5424904, 0, 0, 0, 1, 1,
-2.222507, -0.9183177, -1.26177, 0, 0, 0, 1, 1,
-2.158136, -1.276394, -1.603748, 0, 0, 0, 1, 1,
-2.131505, -0.3278069, -1.71153, 0, 0, 0, 1, 1,
-2.051085, 0.1580565, -1.523272, 1, 1, 1, 1, 1,
-1.975514, -1.539747, -1.322658, 1, 1, 1, 1, 1,
-1.953495, 0.06401079, -2.029738, 1, 1, 1, 1, 1,
-1.938466, -0.3988073, -2.716798, 1, 1, 1, 1, 1,
-1.904625, -0.4911007, -2.406574, 1, 1, 1, 1, 1,
-1.878921, 0.9296996, 0.4676872, 1, 1, 1, 1, 1,
-1.861868, 0.06934241, -0.6504624, 1, 1, 1, 1, 1,
-1.816064, 0.3169098, -1.632026, 1, 1, 1, 1, 1,
-1.811795, 0.423128, -1.236905, 1, 1, 1, 1, 1,
-1.801834, 0.5155998, -1.177935, 1, 1, 1, 1, 1,
-1.793031, 2.429002, -0.2387114, 1, 1, 1, 1, 1,
-1.775037, -1.265599, -3.782665, 1, 1, 1, 1, 1,
-1.767734, -0.7289944, -1.874104, 1, 1, 1, 1, 1,
-1.760232, 0.9902269, 0.6008746, 1, 1, 1, 1, 1,
-1.743396, 0.578666, -1.129679, 1, 1, 1, 1, 1,
-1.738944, 0.5381202, -1.125705, 0, 0, 1, 1, 1,
-1.714294, -2.460349, -3.734015, 1, 0, 0, 1, 1,
-1.709528, -0.4290009, -1.746581, 1, 0, 0, 1, 1,
-1.705726, -0.004273521, -0.6796657, 1, 0, 0, 1, 1,
-1.70321, -0.6580259, -0.6908224, 1, 0, 0, 1, 1,
-1.702005, 0.3779227, -2.063113, 1, 0, 0, 1, 1,
-1.687744, 0.2731812, -0.2224077, 0, 0, 0, 1, 1,
-1.680557, 0.8625016, -0.3987278, 0, 0, 0, 1, 1,
-1.678167, -0.6680636, -2.630447, 0, 0, 0, 1, 1,
-1.669481, 0.5872225, -2.726086, 0, 0, 0, 1, 1,
-1.668701, 2.336068, 1.180918, 0, 0, 0, 1, 1,
-1.664136, -0.4727495, -0.9784757, 0, 0, 0, 1, 1,
-1.65952, 1.342384, -3.116828, 0, 0, 0, 1, 1,
-1.655622, 1.058074, 0.02435231, 1, 1, 1, 1, 1,
-1.654847, -1.592007, -4.510819, 1, 1, 1, 1, 1,
-1.649516, -0.236065, -0.814169, 1, 1, 1, 1, 1,
-1.643481, -2.334697, -3.388983, 1, 1, 1, 1, 1,
-1.640444, 0.8009832, -0.659147, 1, 1, 1, 1, 1,
-1.625351, 0.5013355, -1.31791, 1, 1, 1, 1, 1,
-1.624, -0.3206418, -0.5371432, 1, 1, 1, 1, 1,
-1.61275, -0.1911729, 0.1772291, 1, 1, 1, 1, 1,
-1.603306, -1.722815, -0.4892142, 1, 1, 1, 1, 1,
-1.59284, -2.203658, -2.111759, 1, 1, 1, 1, 1,
-1.585986, -0.2109316, -0.4223687, 1, 1, 1, 1, 1,
-1.568567, -1.596294, -3.572349, 1, 1, 1, 1, 1,
-1.567928, -0.8066891, -1.446282, 1, 1, 1, 1, 1,
-1.561702, 0.3818761, -3.117958, 1, 1, 1, 1, 1,
-1.557107, -0.1276977, -2.99255, 1, 1, 1, 1, 1,
-1.546643, -0.907097, -0.8128716, 0, 0, 1, 1, 1,
-1.539151, -0.5694572, -4.207071, 1, 0, 0, 1, 1,
-1.525606, 0.08695772, -1.066268, 1, 0, 0, 1, 1,
-1.518488, 0.5194845, -1.746143, 1, 0, 0, 1, 1,
-1.515277, 0.09476098, -0.8615853, 1, 0, 0, 1, 1,
-1.512695, 2.859381, -0.3326535, 1, 0, 0, 1, 1,
-1.5087, -0.4819624, -2.670187, 0, 0, 0, 1, 1,
-1.497188, -1.841316, -0.7486743, 0, 0, 0, 1, 1,
-1.484306, -0.3179975, -1.635221, 0, 0, 0, 1, 1,
-1.483786, -0.4419672, -1.330397, 0, 0, 0, 1, 1,
-1.480063, 1.146797, -0.4798338, 0, 0, 0, 1, 1,
-1.476916, 1.157137, -0.7295108, 0, 0, 0, 1, 1,
-1.45522, 0.7454904, 0.09750251, 0, 0, 0, 1, 1,
-1.453743, 0.1186433, -1.316979, 1, 1, 1, 1, 1,
-1.44743, 0.2107101, -1.591517, 1, 1, 1, 1, 1,
-1.442928, 1.704639, -0.1477052, 1, 1, 1, 1, 1,
-1.432352, 0.8961734, -0.8354723, 1, 1, 1, 1, 1,
-1.422773, -0.2249029, -2.473975, 1, 1, 1, 1, 1,
-1.390789, -0.265646, -2.538721, 1, 1, 1, 1, 1,
-1.386868, -1.73728, -1.636477, 1, 1, 1, 1, 1,
-1.380893, -1.614883, -3.748343, 1, 1, 1, 1, 1,
-1.373568, 1.489804, -1.258158, 1, 1, 1, 1, 1,
-1.370429, 0.9034156, -0.2528687, 1, 1, 1, 1, 1,
-1.368161, 0.00582861, -2.434379, 1, 1, 1, 1, 1,
-1.365448, 1.273129, -0.3361101, 1, 1, 1, 1, 1,
-1.360187, -1.573653, -2.42347, 1, 1, 1, 1, 1,
-1.358245, 1.310236, -1.331021, 1, 1, 1, 1, 1,
-1.354462, -1.686111, -3.728391, 1, 1, 1, 1, 1,
-1.353564, -0.5846037, -1.624286, 0, 0, 1, 1, 1,
-1.332346, 0.5537189, -2.558908, 1, 0, 0, 1, 1,
-1.332268, -0.723679, -1.062716, 1, 0, 0, 1, 1,
-1.331514, -0.5259497, -0.9071912, 1, 0, 0, 1, 1,
-1.316655, -2.301811, -2.867713, 1, 0, 0, 1, 1,
-1.315268, -1.254991, -3.174221, 1, 0, 0, 1, 1,
-1.301402, -1.233827, -0.6450776, 0, 0, 0, 1, 1,
-1.300423, -2.461275, -3.00035, 0, 0, 0, 1, 1,
-1.296743, 1.054441, -1.9522, 0, 0, 0, 1, 1,
-1.296488, -0.5126262, -2.507463, 0, 0, 0, 1, 1,
-1.294113, -0.7291006, -0.612909, 0, 0, 0, 1, 1,
-1.294111, -1.794846, -4.475307, 0, 0, 0, 1, 1,
-1.293671, -0.6462148, -2.661939, 0, 0, 0, 1, 1,
-1.291, 0.221354, -2.031512, 1, 1, 1, 1, 1,
-1.290155, 1.021796, -1.437616, 1, 1, 1, 1, 1,
-1.27985, 1.725266, 1.033459, 1, 1, 1, 1, 1,
-1.276399, -1.304007, -1.786589, 1, 1, 1, 1, 1,
-1.264525, -0.9523908, -1.571842, 1, 1, 1, 1, 1,
-1.263709, 0.373772, -4.001493, 1, 1, 1, 1, 1,
-1.253495, -0.3141197, -3.117018, 1, 1, 1, 1, 1,
-1.249377, -1.203658, -3.078897, 1, 1, 1, 1, 1,
-1.24869, -0.5132245, -0.5333089, 1, 1, 1, 1, 1,
-1.244907, -1.983746, -2.150865, 1, 1, 1, 1, 1,
-1.237186, 0.6691573, -2.38158, 1, 1, 1, 1, 1,
-1.23388, -0.5244543, -1.785328, 1, 1, 1, 1, 1,
-1.233667, 0.9617875, -2.184221, 1, 1, 1, 1, 1,
-1.233191, 0.3809691, -1.936944, 1, 1, 1, 1, 1,
-1.212635, 0.5929233, -0.1080646, 1, 1, 1, 1, 1,
-1.204244, 0.6258351, -0.1976139, 0, 0, 1, 1, 1,
-1.196306, -0.08829635, -1.80843, 1, 0, 0, 1, 1,
-1.191849, 1.647952, -1.9901, 1, 0, 0, 1, 1,
-1.189399, -1.608347, -3.141456, 1, 0, 0, 1, 1,
-1.188641, -0.3472428, -1.843511, 1, 0, 0, 1, 1,
-1.174854, -0.3612186, -2.925983, 1, 0, 0, 1, 1,
-1.170079, -0.3763211, -1.719399, 0, 0, 0, 1, 1,
-1.161821, -0.07531133, -1.948114, 0, 0, 0, 1, 1,
-1.161556, 0.4092627, -3.675835, 0, 0, 0, 1, 1,
-1.159925, 0.01479304, -1.018284, 0, 0, 0, 1, 1,
-1.157176, 0.3434815, -2.63021, 0, 0, 0, 1, 1,
-1.155463, -0.09126027, -2.98794, 0, 0, 0, 1, 1,
-1.151754, -1.283258, -2.040836, 0, 0, 0, 1, 1,
-1.149914, 0.01397814, -1.377918, 1, 1, 1, 1, 1,
-1.143576, 1.761115, -2.339867, 1, 1, 1, 1, 1,
-1.142869, -0.08763769, -1.621012, 1, 1, 1, 1, 1,
-1.141913, 0.6214496, -1.354716, 1, 1, 1, 1, 1,
-1.131442, -0.6647236, -4.291107, 1, 1, 1, 1, 1,
-1.127521, -1.514195, -3.550927, 1, 1, 1, 1, 1,
-1.127016, -1.352538, -0.500571, 1, 1, 1, 1, 1,
-1.125764, 0.7416804, -0.3347158, 1, 1, 1, 1, 1,
-1.125742, 1.537965, -1.693516, 1, 1, 1, 1, 1,
-1.117459, -1.298444, -2.043204, 1, 1, 1, 1, 1,
-1.116323, 0.2968124, -0.2322828, 1, 1, 1, 1, 1,
-1.112872, -0.15666, -2.066031, 1, 1, 1, 1, 1,
-1.103223, -0.3999614, -2.142144, 1, 1, 1, 1, 1,
-1.099705, 0.2177866, -0.9318246, 1, 1, 1, 1, 1,
-1.098546, -0.6623159, -1.961861, 1, 1, 1, 1, 1,
-1.094561, -0.07928529, -3.268044, 0, 0, 1, 1, 1,
-1.092457, 0.5547748, -0.1667384, 1, 0, 0, 1, 1,
-1.08968, 0.08062477, -2.689496, 1, 0, 0, 1, 1,
-1.081921, -1.118904, -0.1903618, 1, 0, 0, 1, 1,
-1.081444, 0.9587935, -2.915815, 1, 0, 0, 1, 1,
-1.080394, 0.6687052, -1.228865, 1, 0, 0, 1, 1,
-1.072543, -1.28594, -5.179128, 0, 0, 0, 1, 1,
-1.066915, 0.7800797, -1.25755, 0, 0, 0, 1, 1,
-1.063798, -0.2246573, -1.856458, 0, 0, 0, 1, 1,
-1.063298, -0.9668636, -1.565789, 0, 0, 0, 1, 1,
-1.061925, -2.157271, -3.041777, 0, 0, 0, 1, 1,
-1.060826, 0.7766696, -0.857867, 0, 0, 0, 1, 1,
-1.05681, -2.232297, -3.558428, 0, 0, 0, 1, 1,
-1.055413, 0.9755282, -2.649152, 1, 1, 1, 1, 1,
-1.043847, -1.407627, -2.730819, 1, 1, 1, 1, 1,
-1.039412, 1.179262, -2.437167, 1, 1, 1, 1, 1,
-1.02131, 1.041344, -0.8633442, 1, 1, 1, 1, 1,
-1.020912, -1.425915, -3.925935, 1, 1, 1, 1, 1,
-1.01302, 2.119046, -0.7807785, 1, 1, 1, 1, 1,
-1.010694, -0.6396418, -1.638179, 1, 1, 1, 1, 1,
-1.006358, -0.08351045, -1.984638, 1, 1, 1, 1, 1,
-1.005774, -0.7650853, -1.662777, 1, 1, 1, 1, 1,
-1.0026, -0.2605962, -1.318054, 1, 1, 1, 1, 1,
-1.001294, -0.6058303, -3.36741, 1, 1, 1, 1, 1,
-0.9873477, 2.755606, -0.3593169, 1, 1, 1, 1, 1,
-0.9836459, -0.1307261, 0.3875683, 1, 1, 1, 1, 1,
-0.9796509, 2.887157, -1.578534, 1, 1, 1, 1, 1,
-0.9788094, -1.286992, -2.640177, 1, 1, 1, 1, 1,
-0.9785475, -1.34879, -1.739764, 0, 0, 1, 1, 1,
-0.9731754, -0.5941694, -1.328014, 1, 0, 0, 1, 1,
-0.9723278, 1.566101, 1.768862, 1, 0, 0, 1, 1,
-0.9698277, 0.02769406, -1.270977, 1, 0, 0, 1, 1,
-0.9676858, -0.6480735, -3.686553, 1, 0, 0, 1, 1,
-0.9676384, 0.2491573, -1.476898, 1, 0, 0, 1, 1,
-0.9592363, -1.013869, -2.194958, 0, 0, 0, 1, 1,
-0.9501364, 0.464728, 0.04904279, 0, 0, 0, 1, 1,
-0.9376978, -1.091693, -4.207935, 0, 0, 0, 1, 1,
-0.9257149, 0.7475381, -0.5116358, 0, 0, 0, 1, 1,
-0.9217433, 0.2768571, -0.2759935, 0, 0, 0, 1, 1,
-0.9155716, -2.041414, -3.321338, 0, 0, 0, 1, 1,
-0.9144533, 1.852928, -1.208055, 0, 0, 0, 1, 1,
-0.9115681, 0.7822503, -0.8102337, 1, 1, 1, 1, 1,
-0.9046971, 1.234112, -1.422405, 1, 1, 1, 1, 1,
-0.9030875, -1.258139, -3.60945, 1, 1, 1, 1, 1,
-0.9023948, 0.2531175, -1.563572, 1, 1, 1, 1, 1,
-0.8955129, 0.2276277, -0.8804917, 1, 1, 1, 1, 1,
-0.893025, -0.2223956, -0.8878187, 1, 1, 1, 1, 1,
-0.8776369, -0.2324419, -1.485297, 1, 1, 1, 1, 1,
-0.8746653, 1.017214, -1.86153, 1, 1, 1, 1, 1,
-0.8731178, 1.673651, -0.5375252, 1, 1, 1, 1, 1,
-0.8645575, 0.7399524, -0.1459804, 1, 1, 1, 1, 1,
-0.8627028, 0.01547946, -1.191112, 1, 1, 1, 1, 1,
-0.8560672, 1.494382, -0.6506314, 1, 1, 1, 1, 1,
-0.8495266, -0.3328789, -1.637024, 1, 1, 1, 1, 1,
-0.8486603, 1.282388, -1.825731, 1, 1, 1, 1, 1,
-0.8392337, -0.6255676, -2.37021, 1, 1, 1, 1, 1,
-0.8384176, 1.726778, -1.240985, 0, 0, 1, 1, 1,
-0.8374689, -1.472448, -1.601822, 1, 0, 0, 1, 1,
-0.8322759, -1.886975, -1.327874, 1, 0, 0, 1, 1,
-0.8303427, 1.945572, 0.7134346, 1, 0, 0, 1, 1,
-0.8292091, 0.3235277, -1.82175, 1, 0, 0, 1, 1,
-0.8227978, -1.221004, -1.779023, 1, 0, 0, 1, 1,
-0.8219237, 0.2415154, -0.7266927, 0, 0, 0, 1, 1,
-0.8212434, -0.4522919, -2.923491, 0, 0, 0, 1, 1,
-0.820785, 0.4292925, 0.6708434, 0, 0, 0, 1, 1,
-0.8187446, 1.9011, 0.4546697, 0, 0, 0, 1, 1,
-0.8165573, 0.08666402, -1.840653, 0, 0, 0, 1, 1,
-0.8161461, -0.7960051, -1.392726, 0, 0, 0, 1, 1,
-0.8129867, -0.5084097, -1.992045, 0, 0, 0, 1, 1,
-0.8077442, 0.4771791, -1.561258, 1, 1, 1, 1, 1,
-0.8019248, 0.7727729, -0.8909488, 1, 1, 1, 1, 1,
-0.7986128, 0.08548205, -3.338385, 1, 1, 1, 1, 1,
-0.7962068, -0.1021916, -1.326319, 1, 1, 1, 1, 1,
-0.7897296, -0.1617178, -1.492648, 1, 1, 1, 1, 1,
-0.787028, -0.279244, -3.507898, 1, 1, 1, 1, 1,
-0.7841604, -2.702302, -2.593742, 1, 1, 1, 1, 1,
-0.7816869, -1.343558, -5.006622, 1, 1, 1, 1, 1,
-0.78062, -0.4247248, -2.821535, 1, 1, 1, 1, 1,
-0.7791909, 0.3496885, -1.914883, 1, 1, 1, 1, 1,
-0.7765293, 0.3310406, -0.1298841, 1, 1, 1, 1, 1,
-0.7632299, -0.6063614, -4.417432, 1, 1, 1, 1, 1,
-0.7579816, 1.940299, -0.3667797, 1, 1, 1, 1, 1,
-0.7531765, -0.3751169, -2.414801, 1, 1, 1, 1, 1,
-0.7502946, 1.36521, 0.6634616, 1, 1, 1, 1, 1,
-0.7494588, 2.484964, 1.509296, 0, 0, 1, 1, 1,
-0.7458199, 0.5777319, -1.589287, 1, 0, 0, 1, 1,
-0.7408818, -0.07785008, -0.5422236, 1, 0, 0, 1, 1,
-0.7389228, 1.071446, -0.4290383, 1, 0, 0, 1, 1,
-0.7367525, 2.450356, 0.1776806, 1, 0, 0, 1, 1,
-0.7350776, 0.7286116, -1.034024, 1, 0, 0, 1, 1,
-0.7319888, -0.0227271, -1.83409, 0, 0, 0, 1, 1,
-0.7283494, -1.304623, -1.783851, 0, 0, 0, 1, 1,
-0.722167, -0.5994041, -2.987455, 0, 0, 0, 1, 1,
-0.7218264, -1.024157, -2.214165, 0, 0, 0, 1, 1,
-0.7210629, 0.9507566, -0.6397542, 0, 0, 0, 1, 1,
-0.7122409, -0.5008416, -2.014785, 0, 0, 0, 1, 1,
-0.7078862, -2.072369, -2.827364, 0, 0, 0, 1, 1,
-0.7030897, -0.9969546, -3.893125, 1, 1, 1, 1, 1,
-0.6962944, -1.99193, -1.46177, 1, 1, 1, 1, 1,
-0.6948445, 0.1717402, 0.05474415, 1, 1, 1, 1, 1,
-0.6931848, 1.64706, 0.4380693, 1, 1, 1, 1, 1,
-0.6923363, -0.8336211, -2.207738, 1, 1, 1, 1, 1,
-0.6902829, -1.282373, -2.195022, 1, 1, 1, 1, 1,
-0.689215, -0.1984407, -2.232292, 1, 1, 1, 1, 1,
-0.6852729, 1.643214, 0.4438815, 1, 1, 1, 1, 1,
-0.6814349, 0.7454522, -2.11186, 1, 1, 1, 1, 1,
-0.6805069, 0.3536426, 0.5100316, 1, 1, 1, 1, 1,
-0.6700312, -0.9787601, -3.722852, 1, 1, 1, 1, 1,
-0.6659014, -0.0508678, -2.046185, 1, 1, 1, 1, 1,
-0.6641725, 0.156085, -0.957661, 1, 1, 1, 1, 1,
-0.6634143, 1.057862, -0.04587433, 1, 1, 1, 1, 1,
-0.6613129, 1.548325, -0.107056, 1, 1, 1, 1, 1,
-0.6608865, -1.688164, -1.221406, 0, 0, 1, 1, 1,
-0.6594195, -0.4208849, -0.9403287, 1, 0, 0, 1, 1,
-0.6586021, -1.130249, -3.852473, 1, 0, 0, 1, 1,
-0.6570844, -0.4502072, -4.42616, 1, 0, 0, 1, 1,
-0.6561421, 1.327651, -0.3006091, 1, 0, 0, 1, 1,
-0.6551597, -0.89284, -2.388905, 1, 0, 0, 1, 1,
-0.6471773, -0.8466929, -2.06871, 0, 0, 0, 1, 1,
-0.6464637, -0.0995672, -0.1008583, 0, 0, 0, 1, 1,
-0.6446428, 0.2813215, 0.006211778, 0, 0, 0, 1, 1,
-0.6442857, -0.952022, -0.9461711, 0, 0, 0, 1, 1,
-0.6430694, 0.2319263, -1.947426, 0, 0, 0, 1, 1,
-0.6411141, 0.7822362, -0.05997158, 0, 0, 0, 1, 1,
-0.6398854, 0.9936689, -0.7925913, 0, 0, 0, 1, 1,
-0.6341597, -1.578164, -2.770534, 1, 1, 1, 1, 1,
-0.6328648, 0.5193757, -1.240826, 1, 1, 1, 1, 1,
-0.6324741, 0.09507196, -1.23877, 1, 1, 1, 1, 1,
-0.6271044, 0.2446894, -1.547915, 1, 1, 1, 1, 1,
-0.6262991, 0.6581865, -1.458353, 1, 1, 1, 1, 1,
-0.6218621, -0.3409551, -0.1719305, 1, 1, 1, 1, 1,
-0.6208652, 0.1430623, -1.156112, 1, 1, 1, 1, 1,
-0.6202004, 0.7480392, -1.633485, 1, 1, 1, 1, 1,
-0.6168985, -0.6266922, -0.1892259, 1, 1, 1, 1, 1,
-0.6161112, -0.5808128, -4.218034, 1, 1, 1, 1, 1,
-0.6160221, 0.6094642, -0.8978056, 1, 1, 1, 1, 1,
-0.6158739, -0.116189, -1.729778, 1, 1, 1, 1, 1,
-0.6153394, -0.04352793, -1.69567, 1, 1, 1, 1, 1,
-0.6097049, 1.597937, -0.5034644, 1, 1, 1, 1, 1,
-0.6086357, -0.4481865, -4.849592, 1, 1, 1, 1, 1,
-0.6085441, 1.464556, -1.132493, 0, 0, 1, 1, 1,
-0.6080892, 0.5057106, -3.076462, 1, 0, 0, 1, 1,
-0.6032162, 0.9237671, -1.357042, 1, 0, 0, 1, 1,
-0.5995914, -1.172106, -3.762854, 1, 0, 0, 1, 1,
-0.5969657, 0.6239932, 0.4133329, 1, 0, 0, 1, 1,
-0.5936955, -0.008532577, -1.064287, 1, 0, 0, 1, 1,
-0.5905063, -1.49, -1.231343, 0, 0, 0, 1, 1,
-0.5891546, -0.4436115, -3.073031, 0, 0, 0, 1, 1,
-0.5883141, -0.3412045, -1.356655, 0, 0, 0, 1, 1,
-0.5876821, 0.7619527, -1.113768, 0, 0, 0, 1, 1,
-0.5853741, 0.4353868, -0.217077, 0, 0, 0, 1, 1,
-0.5840127, 0.6091176, -1.052302, 0, 0, 0, 1, 1,
-0.5812962, -0.08455333, -0.7017787, 0, 0, 0, 1, 1,
-0.5811419, -0.8310553, -2.115653, 1, 1, 1, 1, 1,
-0.579343, -1.167455, -1.552605, 1, 1, 1, 1, 1,
-0.5731238, -0.7904953, -3.014677, 1, 1, 1, 1, 1,
-0.5713758, 0.006055956, -1.773757, 1, 1, 1, 1, 1,
-0.570905, 0.4700969, -1.590783, 1, 1, 1, 1, 1,
-0.5652986, -0.1297368, -1.767655, 1, 1, 1, 1, 1,
-0.5528178, 0.698862, -1.089784, 1, 1, 1, 1, 1,
-0.5487648, -1.423707, -2.775501, 1, 1, 1, 1, 1,
-0.5485719, -0.8629743, -3.299154, 1, 1, 1, 1, 1,
-0.5390598, 0.2281584, -1.790465, 1, 1, 1, 1, 1,
-0.5376708, -0.6297086, -2.345527, 1, 1, 1, 1, 1,
-0.5362083, 1.511011, -0.10885, 1, 1, 1, 1, 1,
-0.5345196, -0.7526638, -2.000745, 1, 1, 1, 1, 1,
-0.5289701, -0.09344257, -2.434757, 1, 1, 1, 1, 1,
-0.5256435, -0.469761, -2.894632, 1, 1, 1, 1, 1,
-0.5228518, -0.1450908, -2.355037, 0, 0, 1, 1, 1,
-0.5223578, 0.009398447, -1.054967, 1, 0, 0, 1, 1,
-0.5197967, 0.8749797, -0.8793614, 1, 0, 0, 1, 1,
-0.5196062, -1.511433, -1.23475, 1, 0, 0, 1, 1,
-0.514353, -0.7166719, -4.567561, 1, 0, 0, 1, 1,
-0.5065801, -1.094628, -2.124277, 1, 0, 0, 1, 1,
-0.50622, 1.211914, -1.148285, 0, 0, 0, 1, 1,
-0.5029294, 0.1505409, -1.517281, 0, 0, 0, 1, 1,
-0.5027428, -1.601317, -3.948499, 0, 0, 0, 1, 1,
-0.5027365, -0.3322795, -2.766487, 0, 0, 0, 1, 1,
-0.5020413, -0.4575124, -2.504508, 0, 0, 0, 1, 1,
-0.5016627, -0.8642622, -0.3631544, 0, 0, 0, 1, 1,
-0.5006445, 2.328221, -0.4530746, 0, 0, 0, 1, 1,
-0.500097, 0.7315647, -0.8423023, 1, 1, 1, 1, 1,
-0.5000176, 0.9575813, -1.287838, 1, 1, 1, 1, 1,
-0.497531, -0.5086203, -1.435787, 1, 1, 1, 1, 1,
-0.4973825, 1.211467, 0.7884961, 1, 1, 1, 1, 1,
-0.4954952, -0.3179002, -2.149328, 1, 1, 1, 1, 1,
-0.4941771, 1.352806, -1.462063, 1, 1, 1, 1, 1,
-0.481332, 1.041123, 0.863277, 1, 1, 1, 1, 1,
-0.4793951, -0.2265249, -1.262293, 1, 1, 1, 1, 1,
-0.4785743, 0.4768904, 0.8356482, 1, 1, 1, 1, 1,
-0.4778596, 0.3288194, 0.1681899, 1, 1, 1, 1, 1,
-0.4715479, 0.2616219, 0.2964313, 1, 1, 1, 1, 1,
-0.4665779, -0.8271722, -2.777679, 1, 1, 1, 1, 1,
-0.4655965, -0.1807729, 0.2350227, 1, 1, 1, 1, 1,
-0.4647055, 2.427378, -0.7392394, 1, 1, 1, 1, 1,
-0.4616142, -1.130758, -2.147455, 1, 1, 1, 1, 1,
-0.4598401, -1.062448, -1.590355, 0, 0, 1, 1, 1,
-0.4561142, -1.012941, -2.445917, 1, 0, 0, 1, 1,
-0.4553146, -0.3546257, -1.619645, 1, 0, 0, 1, 1,
-0.4524632, 1.952641, -0.711897, 1, 0, 0, 1, 1,
-0.4520297, 0.4775612, -1.771655, 1, 0, 0, 1, 1,
-0.448122, 1.265096, -1.977875, 1, 0, 0, 1, 1,
-0.4420405, 0.9525399, 1.099694, 0, 0, 0, 1, 1,
-0.4411094, 1.667437, -1.155938, 0, 0, 0, 1, 1,
-0.4407328, -0.500086, -3.530457, 0, 0, 0, 1, 1,
-0.4377401, 1.329458, 2.048249, 0, 0, 0, 1, 1,
-0.4321934, -1.680208, -1.152134, 0, 0, 0, 1, 1,
-0.421629, -0.4669636, -1.595424, 0, 0, 0, 1, 1,
-0.4201675, -0.9980566, -4.163688, 0, 0, 0, 1, 1,
-0.4185023, 0.9749954, -2.59304, 1, 1, 1, 1, 1,
-0.414759, 1.288459, 0.05661222, 1, 1, 1, 1, 1,
-0.4106699, 0.4716013, 1.212062, 1, 1, 1, 1, 1,
-0.4099804, -0.8930277, -0.3864084, 1, 1, 1, 1, 1,
-0.4084402, -0.6441897, -3.426833, 1, 1, 1, 1, 1,
-0.4069167, 0.4900133, 0.09191019, 1, 1, 1, 1, 1,
-0.401871, -0.1121089, -2.735779, 1, 1, 1, 1, 1,
-0.3994672, -0.239821, 0.3776766, 1, 1, 1, 1, 1,
-0.3991311, -1.068411, -3.13882, 1, 1, 1, 1, 1,
-0.3969781, 1.115286, -0.8946744, 1, 1, 1, 1, 1,
-0.3937325, 0.9979116, -0.5117427, 1, 1, 1, 1, 1,
-0.3933855, 0.9984762, -0.9618123, 1, 1, 1, 1, 1,
-0.3931274, -0.4411248, -2.665766, 1, 1, 1, 1, 1,
-0.3913483, 0.05354965, -0.05999224, 1, 1, 1, 1, 1,
-0.3911304, 1.746006, 0.6751134, 1, 1, 1, 1, 1,
-0.38466, 1.480303, -0.6468506, 0, 0, 1, 1, 1,
-0.3795165, 0.1982252, 0.1498395, 1, 0, 0, 1, 1,
-0.3781826, -0.7340277, -1.640798, 1, 0, 0, 1, 1,
-0.3752868, -0.7089882, -2.18516, 1, 0, 0, 1, 1,
-0.3712317, 0.6843655, -0.517332, 1, 0, 0, 1, 1,
-0.3672429, 0.3821581, -0.712846, 1, 0, 0, 1, 1,
-0.3631278, -0.3626271, -3.379471, 0, 0, 0, 1, 1,
-0.3628917, 1.134887, -0.6997654, 0, 0, 0, 1, 1,
-0.3587273, -0.6812105, -3.534643, 0, 0, 0, 1, 1,
-0.3566094, -0.6869782, -3.27361, 0, 0, 0, 1, 1,
-0.3449615, -0.5890635, -3.688256, 0, 0, 0, 1, 1,
-0.3341901, 1.463019, -1.649159, 0, 0, 0, 1, 1,
-0.3340142, 0.3350557, -1.669743, 0, 0, 0, 1, 1,
-0.333087, 0.1012126, -0.6583077, 1, 1, 1, 1, 1,
-0.330785, -0.3386282, -0.1913447, 1, 1, 1, 1, 1,
-0.3303841, 2.319851, 0.3731948, 1, 1, 1, 1, 1,
-0.3301567, 0.6922271, 0.387198, 1, 1, 1, 1, 1,
-0.3277749, 0.2278428, -0.9176724, 1, 1, 1, 1, 1,
-0.3250791, 0.5244015, 0.2536736, 1, 1, 1, 1, 1,
-0.3189246, -0.4471303, -2.566682, 1, 1, 1, 1, 1,
-0.3157763, -2.274417, -3.897766, 1, 1, 1, 1, 1,
-0.3146148, 1.268213, 0.416984, 1, 1, 1, 1, 1,
-0.3140667, -0.2293627, -1.561689, 1, 1, 1, 1, 1,
-0.3128271, 0.8059697, -0.940571, 1, 1, 1, 1, 1,
-0.3086368, 0.1823916, 1.204127, 1, 1, 1, 1, 1,
-0.3078909, -0.1984902, -2.411604, 1, 1, 1, 1, 1,
-0.306961, -0.2541609, -2.272116, 1, 1, 1, 1, 1,
-0.306813, -0.9314179, -3.278639, 1, 1, 1, 1, 1,
-0.2999888, 0.3540474, -1.436523, 0, 0, 1, 1, 1,
-0.2985913, -0.001708191, -0.5514094, 1, 0, 0, 1, 1,
-0.2958679, 0.6354446, -0.4497231, 1, 0, 0, 1, 1,
-0.2938446, -0.4586164, -0.5192627, 1, 0, 0, 1, 1,
-0.2925285, -0.2211361, -0.9924313, 1, 0, 0, 1, 1,
-0.2887318, 0.1058963, -0.7302445, 1, 0, 0, 1, 1,
-0.2786014, 0.6902115, 0.6824207, 0, 0, 0, 1, 1,
-0.26948, -0.04001074, -1.729921, 0, 0, 0, 1, 1,
-0.2686251, -0.03592115, -2.572961, 0, 0, 0, 1, 1,
-0.2686226, -0.1302295, -2.33517, 0, 0, 0, 1, 1,
-0.2672529, -0.6330034, -1.939437, 0, 0, 0, 1, 1,
-0.2644993, -0.7236803, -4.182315, 0, 0, 0, 1, 1,
-0.2644539, -0.2387058, -1.034239, 0, 0, 0, 1, 1,
-0.2590635, 1.595697, 0.9928352, 1, 1, 1, 1, 1,
-0.2564409, 0.3393223, 1.150693, 1, 1, 1, 1, 1,
-0.2561391, 2.39907, -0.6572245, 1, 1, 1, 1, 1,
-0.2527039, -0.4253313, -2.822346, 1, 1, 1, 1, 1,
-0.2507219, 0.8437607, 0.4915471, 1, 1, 1, 1, 1,
-0.2500267, -0.8022096, -2.295658, 1, 1, 1, 1, 1,
-0.2496185, -1.778811, -1.463818, 1, 1, 1, 1, 1,
-0.2487099, 0.5384794, 0.9856006, 1, 1, 1, 1, 1,
-0.2472627, -1.169888, -3.320538, 1, 1, 1, 1, 1,
-0.2421559, -1.998866, -1.586907, 1, 1, 1, 1, 1,
-0.2391099, 0.08738638, -2.123913, 1, 1, 1, 1, 1,
-0.2371597, -0.7675304, -4.259853, 1, 1, 1, 1, 1,
-0.2347565, 0.7828041, -0.9111146, 1, 1, 1, 1, 1,
-0.2331952, -0.01968331, -1.610755, 1, 1, 1, 1, 1,
-0.2327191, 0.4485546, -1.592556, 1, 1, 1, 1, 1,
-0.2297251, 1.017489, -1.083825, 0, 0, 1, 1, 1,
-0.2286125, -0.3302605, -2.303758, 1, 0, 0, 1, 1,
-0.2270315, -0.2501422, -1.881185, 1, 0, 0, 1, 1,
-0.2254942, -1.929635, -1.338433, 1, 0, 0, 1, 1,
-0.2244495, -0.1586764, -1.950643, 1, 0, 0, 1, 1,
-0.2229091, -0.4512137, -1.774172, 1, 0, 0, 1, 1,
-0.2203653, 0.6666935, 1.238763, 0, 0, 0, 1, 1,
-0.2181287, -0.1701959, -1.07668, 0, 0, 0, 1, 1,
-0.2178982, 1.522798, -0.2933526, 0, 0, 0, 1, 1,
-0.2109348, 0.2630294, -0.8808295, 0, 0, 0, 1, 1,
-0.2108588, -2.292416, -2.541454, 0, 0, 0, 1, 1,
-0.2080573, -1.649866, -2.818579, 0, 0, 0, 1, 1,
-0.2080294, 0.6392354, 0.515315, 0, 0, 0, 1, 1,
-0.2062553, 0.2878831, -1.121544, 1, 1, 1, 1, 1,
-0.2043089, 1.136318, -0.2715274, 1, 1, 1, 1, 1,
-0.1973391, 0.1521726, -0.2129324, 1, 1, 1, 1, 1,
-0.1953467, -0.3126519, -1.218345, 1, 1, 1, 1, 1,
-0.1952875, -1.263977, -3.539884, 1, 1, 1, 1, 1,
-0.1894484, -1.97587, -0.8447717, 1, 1, 1, 1, 1,
-0.1858204, -1.175188, -3.252307, 1, 1, 1, 1, 1,
-0.1810349, 1.147502, -1.805321, 1, 1, 1, 1, 1,
-0.178145, 0.9421117, -2.10984, 1, 1, 1, 1, 1,
-0.1780065, -1.229999, -2.515719, 1, 1, 1, 1, 1,
-0.1778383, 2.152693, -0.1892372, 1, 1, 1, 1, 1,
-0.1728732, -3.092174, -2.682578, 1, 1, 1, 1, 1,
-0.1720944, 0.8755327, 0.08821184, 1, 1, 1, 1, 1,
-0.1660807, 0.8894944, -0.6275955, 1, 1, 1, 1, 1,
-0.1586559, -0.08455902, -1.28335, 1, 1, 1, 1, 1,
-0.1575631, -0.3116789, -2.78982, 0, 0, 1, 1, 1,
-0.154475, -0.5946972, -2.166603, 1, 0, 0, 1, 1,
-0.1516128, -0.8817244, -3.630258, 1, 0, 0, 1, 1,
-0.1484213, 0.3078441, -2.182237, 1, 0, 0, 1, 1,
-0.1372592, 0.2503238, -0.8024891, 1, 0, 0, 1, 1,
-0.1362572, 0.07767522, -0.9953969, 1, 0, 0, 1, 1,
-0.1346954, 0.6831536, -0.3486477, 0, 0, 0, 1, 1,
-0.1341585, -1.802187, -5.304509, 0, 0, 0, 1, 1,
-0.1257542, -0.1700713, -3.193944, 0, 0, 0, 1, 1,
-0.1252567, 0.7441919, -1.649474, 0, 0, 0, 1, 1,
-0.1168401, 1.293413, -0.1192491, 0, 0, 0, 1, 1,
-0.1167166, 0.4823803, -0.9105469, 0, 0, 0, 1, 1,
-0.1166901, 0.309307, -0.8354448, 0, 0, 0, 1, 1,
-0.1147809, -1.198832, -3.97203, 1, 1, 1, 1, 1,
-0.1100349, -0.3885107, -3.238299, 1, 1, 1, 1, 1,
-0.1072741, 1.409683, -0.05320045, 1, 1, 1, 1, 1,
-0.1013381, 0.3813994, 0.2068187, 1, 1, 1, 1, 1,
-0.09617931, 0.6148106, -0.1016014, 1, 1, 1, 1, 1,
-0.08524922, 0.1470997, -0.46463, 1, 1, 1, 1, 1,
-0.08335149, 0.8307377, 2.017504, 1, 1, 1, 1, 1,
-0.08304832, -0.5183139, -3.781608, 1, 1, 1, 1, 1,
-0.08164524, 0.5132747, -0.4763691, 1, 1, 1, 1, 1,
-0.08068049, -0.292174, -2.285199, 1, 1, 1, 1, 1,
-0.07647657, -1.309147, -2.093916, 1, 1, 1, 1, 1,
-0.07206088, -0.02088552, -3.298722, 1, 1, 1, 1, 1,
-0.06753877, -0.1495377, -2.706733, 1, 1, 1, 1, 1,
-0.06617528, 0.2132722, -1.003541, 1, 1, 1, 1, 1,
-0.06210189, 0.1041374, -0.9485691, 1, 1, 1, 1, 1,
-0.05986672, 1.427679, 0.4833693, 0, 0, 1, 1, 1,
-0.05355173, 1.340795, 0.3283521, 1, 0, 0, 1, 1,
-0.05253216, -1.276546, -3.359412, 1, 0, 0, 1, 1,
-0.04977439, 0.2844415, 0.6242632, 1, 0, 0, 1, 1,
-0.04712583, 0.06870809, 0.7649141, 1, 0, 0, 1, 1,
-0.04204668, -1.436174, -2.00282, 1, 0, 0, 1, 1,
-0.03988522, -0.7514074, -4.139264, 0, 0, 0, 1, 1,
-0.03979848, -1.687551, -2.811761, 0, 0, 0, 1, 1,
-0.0333049, 1.66591, 0.6773914, 0, 0, 0, 1, 1,
-0.03225737, -2.401223, -3.326527, 0, 0, 0, 1, 1,
-0.03012718, 0.7486596, -2.023715, 0, 0, 0, 1, 1,
-0.02599217, 1.882247, -0.06871867, 0, 0, 0, 1, 1,
-0.02056901, -0.1896553, -2.276081, 0, 0, 0, 1, 1,
-0.01613843, 0.9054389, 1.174501, 1, 1, 1, 1, 1,
-0.01358261, -0.6183692, -2.633341, 1, 1, 1, 1, 1,
-0.01308595, -0.2040467, -2.379014, 1, 1, 1, 1, 1,
-0.01164666, 0.4251115, -1.224354, 1, 1, 1, 1, 1,
-0.01091339, 1.344548, -1.053534, 1, 1, 1, 1, 1,
-0.009741942, 0.3478964, 0.8673535, 1, 1, 1, 1, 1,
-0.008739381, 1.673864, -2.149249, 1, 1, 1, 1, 1,
-0.006373384, -1.744991, -2.783303, 1, 1, 1, 1, 1,
-0.004435236, 1.023898, 0.142661, 1, 1, 1, 1, 1,
-0.001192134, 0.1371723, 0.3715703, 1, 1, 1, 1, 1,
3.420917e-06, -1.351126, 4.624396, 1, 1, 1, 1, 1,
0.002381919, -0.2599811, 4.406269, 1, 1, 1, 1, 1,
0.00266952, 0.005902713, 0.7037707, 1, 1, 1, 1, 1,
0.003715412, -3.512865e-06, -0.2858883, 1, 1, 1, 1, 1,
0.003892604, -0.7114165, 2.990778, 1, 1, 1, 1, 1,
0.00413286, 0.4652253, 0.4620341, 0, 0, 1, 1, 1,
0.004686185, 0.5184326, -0.0007069045, 1, 0, 0, 1, 1,
0.006692135, -1.188777, 3.539489, 1, 0, 0, 1, 1,
0.008890758, 0.05541724, -0.5465621, 1, 0, 0, 1, 1,
0.009552365, -3.604142, 3.329431, 1, 0, 0, 1, 1,
0.01204134, -0.669532, 2.44912, 1, 0, 0, 1, 1,
0.01276346, -0.6123065, 2.291225, 0, 0, 0, 1, 1,
0.01787888, -0.2656081, 1.500873, 0, 0, 0, 1, 1,
0.02163998, -1.282012, 3.943173, 0, 0, 0, 1, 1,
0.02709105, -1.359353, 4.077588, 0, 0, 0, 1, 1,
0.02912581, -0.5881844, 1.846297, 0, 0, 0, 1, 1,
0.03147218, 0.6469461, 0.7678285, 0, 0, 0, 1, 1,
0.03190643, 0.3290641, -0.1984658, 0, 0, 0, 1, 1,
0.0339824, -1.575455, 2.538547, 1, 1, 1, 1, 1,
0.03778202, -0.6361526, 2.446821, 1, 1, 1, 1, 1,
0.03792563, 0.04944128, 0.7223911, 1, 1, 1, 1, 1,
0.0393738, -0.7280242, 3.838699, 1, 1, 1, 1, 1,
0.04017511, -0.6947564, 4.189883, 1, 1, 1, 1, 1,
0.04559871, -0.2854824, 3.650593, 1, 1, 1, 1, 1,
0.04677633, 1.350523, 0.781285, 1, 1, 1, 1, 1,
0.04852952, -0.1735669, 1.946382, 1, 1, 1, 1, 1,
0.05054296, 2.243431, -1.030833, 1, 1, 1, 1, 1,
0.05246633, 0.3298392, 0.6743394, 1, 1, 1, 1, 1,
0.05848202, -0.5337749, 2.563362, 1, 1, 1, 1, 1,
0.0611742, -2.313215, 1.936348, 1, 1, 1, 1, 1,
0.06376033, 0.1854771, 0.158348, 1, 1, 1, 1, 1,
0.0710429, -0.4169966, 3.362668, 1, 1, 1, 1, 1,
0.07742927, -0.3408567, 4.233829, 1, 1, 1, 1, 1,
0.07763187, 1.242401, 0.9784559, 0, 0, 1, 1, 1,
0.07816039, 0.4092986, 0.02091965, 1, 0, 0, 1, 1,
0.07828511, -0.5480786, 2.971738, 1, 0, 0, 1, 1,
0.08087683, -1.968013, 3.021233, 1, 0, 0, 1, 1,
0.08235037, -1.160871, 2.813561, 1, 0, 0, 1, 1,
0.08269162, -1.644254, 2.687709, 1, 0, 0, 1, 1,
0.08434267, 1.231311, -0.278689, 0, 0, 0, 1, 1,
0.08888113, -0.2422428, 2.552855, 0, 0, 0, 1, 1,
0.089862, -0.5161667, 0.8849692, 0, 0, 0, 1, 1,
0.09021743, 0.3560885, 1.736258, 0, 0, 0, 1, 1,
0.09130225, 1.862177, 0.01998769, 0, 0, 0, 1, 1,
0.09712955, -0.2810393, 2.501986, 0, 0, 0, 1, 1,
0.101587, 1.414094, 0.313847, 0, 0, 0, 1, 1,
0.1022985, -0.9888159, 4.442044, 1, 1, 1, 1, 1,
0.1025385, 0.6529089, -0.2829693, 1, 1, 1, 1, 1,
0.1033705, -0.6069953, 3.447739, 1, 1, 1, 1, 1,
0.1067684, -0.03903363, 1.029673, 1, 1, 1, 1, 1,
0.1082491, -0.2230296, 1.97627, 1, 1, 1, 1, 1,
0.1111258, -1.255405, 4.250336, 1, 1, 1, 1, 1,
0.1229362, 0.5306686, -0.828702, 1, 1, 1, 1, 1,
0.1308234, 0.1995868, -0.9402893, 1, 1, 1, 1, 1,
0.131605, -0.8283851, 2.855454, 1, 1, 1, 1, 1,
0.1343553, 0.9297016, -0.2584234, 1, 1, 1, 1, 1,
0.1344848, -0.7451487, 3.289722, 1, 1, 1, 1, 1,
0.1352043, 0.491015, 0.9834196, 1, 1, 1, 1, 1,
0.1353887, 0.2546402, 0.769042, 1, 1, 1, 1, 1,
0.1371243, -0.6561813, 2.254268, 1, 1, 1, 1, 1,
0.1378971, -0.170633, 1.847198, 1, 1, 1, 1, 1,
0.1392106, 2.428394, 2.40279, 0, 0, 1, 1, 1,
0.1401474, -0.1408595, 1.354449, 1, 0, 0, 1, 1,
0.1439484, 0.04210922, -0.2518435, 1, 0, 0, 1, 1,
0.1444993, 0.791859, -0.2216002, 1, 0, 0, 1, 1,
0.1547991, -0.6674877, 3.754504, 1, 0, 0, 1, 1,
0.1548494, 1.727254, 0.6662391, 1, 0, 0, 1, 1,
0.1569778, -0.3483834, 3.290333, 0, 0, 0, 1, 1,
0.1600847, -0.3299728, 2.320149, 0, 0, 0, 1, 1,
0.1667505, 0.1661916, 2.242133, 0, 0, 0, 1, 1,
0.1717392, -1.162126, 2.227092, 0, 0, 0, 1, 1,
0.1757945, -1.547402, 3.041876, 0, 0, 0, 1, 1,
0.175927, 0.7676222, 0.4059041, 0, 0, 0, 1, 1,
0.1769317, -0.3496302, 1.99514, 0, 0, 0, 1, 1,
0.1787185, 0.333008, -1.459776, 1, 1, 1, 1, 1,
0.1826044, 0.6967334, -0.6591765, 1, 1, 1, 1, 1,
0.1853336, -2.072256, 1.288124, 1, 1, 1, 1, 1,
0.1899763, -0.2289249, 0.3166494, 1, 1, 1, 1, 1,
0.1928177, 0.8751596, -1.502043, 1, 1, 1, 1, 1,
0.1934602, -1.388702, 2.90887, 1, 1, 1, 1, 1,
0.1969927, -0.5497786, 3.378162, 1, 1, 1, 1, 1,
0.2024376, -1.769779, 1.6208, 1, 1, 1, 1, 1,
0.2099966, 3.366515, 2.121636, 1, 1, 1, 1, 1,
0.2134119, 1.09622, -0.2761656, 1, 1, 1, 1, 1,
0.2140058, -1.225438, 3.99203, 1, 1, 1, 1, 1,
0.2183046, 0.8412614, -0.2642811, 1, 1, 1, 1, 1,
0.2221757, 2.012405, 0.7892755, 1, 1, 1, 1, 1,
0.2246836, 0.7117584, 0.8345019, 1, 1, 1, 1, 1,
0.2248392, 1.153059, -0.2484688, 1, 1, 1, 1, 1,
0.2272317, 1.393634, 1.070228, 0, 0, 1, 1, 1,
0.2301793, -1.692198, 3.635855, 1, 0, 0, 1, 1,
0.2304299, 1.253894, 0.02930707, 1, 0, 0, 1, 1,
0.2432801, -0.6891137, 2.680645, 1, 0, 0, 1, 1,
0.2445329, 0.4193276, -0.9764793, 1, 0, 0, 1, 1,
0.2472208, 0.5087537, -1.262852, 1, 0, 0, 1, 1,
0.2535871, -1.449672, 2.336798, 0, 0, 0, 1, 1,
0.2535936, 0.966686, 1.742317, 0, 0, 0, 1, 1,
0.2561702, 0.2871643, 0.7879389, 0, 0, 0, 1, 1,
0.2594491, 0.7078291, -0.3873124, 0, 0, 0, 1, 1,
0.2599252, 0.2823054, 1.878834, 0, 0, 0, 1, 1,
0.2640466, 0.1093377, -0.2637736, 0, 0, 0, 1, 1,
0.2646518, 0.6521646, -0.1480002, 0, 0, 0, 1, 1,
0.2651772, -0.2523466, 3.038296, 1, 1, 1, 1, 1,
0.2693775, -1.531192, 2.948832, 1, 1, 1, 1, 1,
0.2696928, 1.386366, 0.8740184, 1, 1, 1, 1, 1,
0.2704439, -1.868228, 2.748786, 1, 1, 1, 1, 1,
0.2781141, -0.3903137, 2.425183, 1, 1, 1, 1, 1,
0.2789634, 0.868611, 0.6409544, 1, 1, 1, 1, 1,
0.2794212, -0.1155003, 1.86153, 1, 1, 1, 1, 1,
0.2809446, 0.6858154, 3.025197, 1, 1, 1, 1, 1,
0.2856103, 2.228289, 0.5104488, 1, 1, 1, 1, 1,
0.290282, -0.1457468, 2.03222, 1, 1, 1, 1, 1,
0.2916176, 0.6775197, -0.3055914, 1, 1, 1, 1, 1,
0.2934529, 0.1176352, 0.849382, 1, 1, 1, 1, 1,
0.2944787, -1.972944, 1.605247, 1, 1, 1, 1, 1,
0.2970828, 0.1206551, 1.066672, 1, 1, 1, 1, 1,
0.2973216, -0.241517, 2.275671, 1, 1, 1, 1, 1,
0.2973225, 0.1802979, 2.721711, 0, 0, 1, 1, 1,
0.3051416, -1.011812, 2.510508, 1, 0, 0, 1, 1,
0.3056154, -0.930036, 3.008704, 1, 0, 0, 1, 1,
0.3063569, -1.350943, 1.758452, 1, 0, 0, 1, 1,
0.315907, -0.6716378, 2.131445, 1, 0, 0, 1, 1,
0.3192796, -0.5515303, 1.051622, 1, 0, 0, 1, 1,
0.3195136, -0.9528818, 2.642189, 0, 0, 0, 1, 1,
0.3257595, -1.229404, 2.309146, 0, 0, 0, 1, 1,
0.3299722, -0.9281812, 1.602721, 0, 0, 0, 1, 1,
0.3351254, -1.497883, 2.0827, 0, 0, 0, 1, 1,
0.3371143, 0.8291324, 1.166348, 0, 0, 0, 1, 1,
0.3379061, 0.9033297, 0.5851165, 0, 0, 0, 1, 1,
0.3395687, -1.195125, 4.361092, 0, 0, 0, 1, 1,
0.347066, 0.7622359, -0.9586132, 1, 1, 1, 1, 1,
0.3483784, 0.9688861, -0.5511813, 1, 1, 1, 1, 1,
0.3499094, 1.655636, 0.9454108, 1, 1, 1, 1, 1,
0.3521667, -1.286938, 0.7632641, 1, 1, 1, 1, 1,
0.3549443, -1.373352, 2.81482, 1, 1, 1, 1, 1,
0.35833, 0.08585381, -0.2304195, 1, 1, 1, 1, 1,
0.363409, -1.016837, 3.002839, 1, 1, 1, 1, 1,
0.3651147, -0.08922873, 1.463313, 1, 1, 1, 1, 1,
0.3658143, -1.317457, 4.277083, 1, 1, 1, 1, 1,
0.3673904, -0.09113248, 2.558028, 1, 1, 1, 1, 1,
0.3680254, -0.0484811, 2.727173, 1, 1, 1, 1, 1,
0.3688889, 1.259983, -0.1375613, 1, 1, 1, 1, 1,
0.3709248, -2.046099, 3.055428, 1, 1, 1, 1, 1,
0.3734204, -0.9083912, 2.611519, 1, 1, 1, 1, 1,
0.3745537, -0.03179744, 1.639104, 1, 1, 1, 1, 1,
0.3751484, 0.6989726, 0.9470192, 0, 0, 1, 1, 1,
0.38427, 0.2317316, -0.1922846, 1, 0, 0, 1, 1,
0.3862402, 0.234575, 0.6357556, 1, 0, 0, 1, 1,
0.3865417, -0.7996502, 3.308318, 1, 0, 0, 1, 1,
0.3929489, 0.9121284, 1.847065, 1, 0, 0, 1, 1,
0.3961817, -0.04384868, 1.412233, 1, 0, 0, 1, 1,
0.4030702, 1.629683, 0.3636236, 0, 0, 0, 1, 1,
0.4032917, 0.808621, 0.8473677, 0, 0, 0, 1, 1,
0.4048519, 0.02875138, 1.201639, 0, 0, 0, 1, 1,
0.4067837, 0.7604023, 1.107467, 0, 0, 0, 1, 1,
0.4121868, 0.5718489, -1.475642, 0, 0, 0, 1, 1,
0.4233943, -1.336007, 3.687171, 0, 0, 0, 1, 1,
0.4237256, -0.3435396, 2.493428, 0, 0, 0, 1, 1,
0.4269848, -0.4258002, 2.935896, 1, 1, 1, 1, 1,
0.4297984, -0.8716276, 2.725268, 1, 1, 1, 1, 1,
0.438345, -0.4817152, 2.68362, 1, 1, 1, 1, 1,
0.4399889, 2.011435, 1.966001, 1, 1, 1, 1, 1,
0.4411117, 0.4984857, 1.261291, 1, 1, 1, 1, 1,
0.4447057, 0.1139387, 1.349586, 1, 1, 1, 1, 1,
0.4457086, -1.00445, 1.850245, 1, 1, 1, 1, 1,
0.4472596, -0.8312303, 3.05429, 1, 1, 1, 1, 1,
0.447701, 0.5141164, 0.6905336, 1, 1, 1, 1, 1,
0.4490044, -1.109681, 1.420154, 1, 1, 1, 1, 1,
0.4519769, -0.3655683, 1.001156, 1, 1, 1, 1, 1,
0.4529586, 0.7069353, 0.4337776, 1, 1, 1, 1, 1,
0.4567682, -0.691485, 4.610297, 1, 1, 1, 1, 1,
0.4575092, -0.3617413, 4.331763, 1, 1, 1, 1, 1,
0.4660901, -0.0683068, 2.324977, 1, 1, 1, 1, 1,
0.4666006, 0.07381537, 3.379481, 0, 0, 1, 1, 1,
0.4710895, 0.8046062, 0.04969951, 1, 0, 0, 1, 1,
0.4729005, -1.975066, 2.745387, 1, 0, 0, 1, 1,
0.4742769, 0.7344462, -0.127648, 1, 0, 0, 1, 1,
0.4758871, -1.283278, 3.489326, 1, 0, 0, 1, 1,
0.477429, -0.07957955, 2.010852, 1, 0, 0, 1, 1,
0.4809493, -0.8717355, 3.551714, 0, 0, 0, 1, 1,
0.4811294, -0.6271043, 3.28119, 0, 0, 0, 1, 1,
0.4823326, -0.05272206, 0.8675913, 0, 0, 0, 1, 1,
0.4841774, -0.5011975, 2.836111, 0, 0, 0, 1, 1,
0.4929786, 0.945771, 0.1013225, 0, 0, 0, 1, 1,
0.4953372, -1.13782, 2.174917, 0, 0, 0, 1, 1,
0.4971858, -0.4518891, 2.722378, 0, 0, 0, 1, 1,
0.4973007, -0.2125594, 2.799884, 1, 1, 1, 1, 1,
0.498419, -0.5836907, 1.545665, 1, 1, 1, 1, 1,
0.4992476, -0.8348021, 3.081522, 1, 1, 1, 1, 1,
0.5065651, 1.04329, -1.406447, 1, 1, 1, 1, 1,
0.5077628, -1.010324, 2.532759, 1, 1, 1, 1, 1,
0.5100932, 0.2655059, 2.8388, 1, 1, 1, 1, 1,
0.5139195, -1.145111, 2.470925, 1, 1, 1, 1, 1,
0.5142732, 0.4416349, 0.5641354, 1, 1, 1, 1, 1,
0.5156213, 1.110692, -0.2671781, 1, 1, 1, 1, 1,
0.5196448, -1.708361, 3.496718, 1, 1, 1, 1, 1,
0.5237875, 0.8269067, 1.799468, 1, 1, 1, 1, 1,
0.5326741, -0.9296845, 3.866438, 1, 1, 1, 1, 1,
0.5330124, -1.59704, 2.394676, 1, 1, 1, 1, 1,
0.5354538, 0.1707038, 2.823936, 1, 1, 1, 1, 1,
0.5378771, -0.7807133, 2.794606, 1, 1, 1, 1, 1,
0.5461618, 0.8481385, 1.010557, 0, 0, 1, 1, 1,
0.5479071, -0.8939819, 2.479266, 1, 0, 0, 1, 1,
0.5519671, -0.2273311, 1.839066, 1, 0, 0, 1, 1,
0.5524521, -0.6832535, 4.233614, 1, 0, 0, 1, 1,
0.5586006, -1.883742, 3.883165, 1, 0, 0, 1, 1,
0.5591704, 0.2330222, 2.034607, 1, 0, 0, 1, 1,
0.561047, -0.4280448, 3.210908, 0, 0, 0, 1, 1,
0.5613073, 0.1436261, 0.1839635, 0, 0, 0, 1, 1,
0.5614243, -0.6064901, 2.320359, 0, 0, 0, 1, 1,
0.5614432, 0.9879501, -0.1434752, 0, 0, 0, 1, 1,
0.5615022, 1.491007, 1.563981, 0, 0, 0, 1, 1,
0.5663807, -0.8240677, 3.135381, 0, 0, 0, 1, 1,
0.5677989, -0.528504, 2.088208, 0, 0, 0, 1, 1,
0.5678591, 0.7826034, 0.1268263, 1, 1, 1, 1, 1,
0.5683148, -1.04443, 2.856447, 1, 1, 1, 1, 1,
0.5687667, -0.9629198, 3.712207, 1, 1, 1, 1, 1,
0.569952, -0.1028387, 1.217007, 1, 1, 1, 1, 1,
0.5723206, 0.1379896, 0.01455776, 1, 1, 1, 1, 1,
0.5753329, 1.223462, 1.189613, 1, 1, 1, 1, 1,
0.5758569, -0.9445781, 3.55682, 1, 1, 1, 1, 1,
0.5880005, 0.4420398, 0.9722305, 1, 1, 1, 1, 1,
0.5959691, 0.1880243, 0.1015097, 1, 1, 1, 1, 1,
0.5972148, -1.890601, 3.794488, 1, 1, 1, 1, 1,
0.6034137, 0.0618378, -0.06366961, 1, 1, 1, 1, 1,
0.6049479, -0.6717385, 2.979987, 1, 1, 1, 1, 1,
0.6057924, 0.9772751, -0.3983846, 1, 1, 1, 1, 1,
0.6076288, 0.6229076, 2.336378, 1, 1, 1, 1, 1,
0.6104645, 0.7884402, -2.44096, 1, 1, 1, 1, 1,
0.6109372, -1.291104, 3.958743, 0, 0, 1, 1, 1,
0.6235724, 1.12371, 2.146996, 1, 0, 0, 1, 1,
0.624029, -0.1101167, -0.3022317, 1, 0, 0, 1, 1,
0.6274768, -0.8719871, 3.125552, 1, 0, 0, 1, 1,
0.6284369, -0.3883294, 3.059274, 1, 0, 0, 1, 1,
0.6294026, 0.2865621, 2.028048, 1, 0, 0, 1, 1,
0.6417682, -0.2920339, 0.9466193, 0, 0, 0, 1, 1,
0.646514, -0.3915395, 3.120502, 0, 0, 0, 1, 1,
0.6465816, 1.57742, 0.01231718, 0, 0, 0, 1, 1,
0.6530201, -0.2153885, 2.52336, 0, 0, 0, 1, 1,
0.6534922, 0.9696524, 1.988681, 0, 0, 0, 1, 1,
0.6552002, -1.180445, 2.13775, 0, 0, 0, 1, 1,
0.6552884, -0.2322369, 1.347532, 0, 0, 0, 1, 1,
0.6634592, 1.360209, 1.436206, 1, 1, 1, 1, 1,
0.668528, -0.1767959, 2.70134, 1, 1, 1, 1, 1,
0.6698059, -0.3350112, 3.712847, 1, 1, 1, 1, 1,
0.6700725, -0.1559019, 1.060484, 1, 1, 1, 1, 1,
0.6850545, 0.4862395, -0.07099355, 1, 1, 1, 1, 1,
0.6858157, 0.6599094, 0.809271, 1, 1, 1, 1, 1,
0.6860512, -1.126027, 2.133498, 1, 1, 1, 1, 1,
0.6885805, 0.61396, 2.132337, 1, 1, 1, 1, 1,
0.6891852, -1.164921, 2.705652, 1, 1, 1, 1, 1,
0.689583, 0.912791, -0.9219393, 1, 1, 1, 1, 1,
0.6939409, -0.5795671, 4.425273, 1, 1, 1, 1, 1,
0.6951993, 1.371107, 0.4570191, 1, 1, 1, 1, 1,
0.6959295, -0.4493913, 1.161309, 1, 1, 1, 1, 1,
0.6984665, -0.8471594, 1.056691, 1, 1, 1, 1, 1,
0.7006987, -0.9396428, 2.034046, 1, 1, 1, 1, 1,
0.7029282, 0.07135543, 1.433184, 0, 0, 1, 1, 1,
0.7047785, 0.2587113, 1.737002, 1, 0, 0, 1, 1,
0.7067654, 0.9682108, -1.326995, 1, 0, 0, 1, 1,
0.7123208, 0.9531201, -0.1207829, 1, 0, 0, 1, 1,
0.7128027, -1.193334, 3.474852, 1, 0, 0, 1, 1,
0.7136293, 0.1711624, -1.32199, 1, 0, 0, 1, 1,
0.7151592, -0.8348428, 4.053991, 0, 0, 0, 1, 1,
0.7168669, -2.145617, 3.563236, 0, 0, 0, 1, 1,
0.7209455, -3.098899, 1.727239, 0, 0, 0, 1, 1,
0.7219476, -0.3888345, 3.677705, 0, 0, 0, 1, 1,
0.7283072, -0.4599322, 2.502668, 0, 0, 0, 1, 1,
0.7289708, 1.051994, -0.4970754, 0, 0, 0, 1, 1,
0.7317492, -1.195214, 1.175318, 0, 0, 0, 1, 1,
0.732003, -0.1079693, 1.027386, 1, 1, 1, 1, 1,
0.7337794, -0.09928481, 1.304567, 1, 1, 1, 1, 1,
0.735027, -0.9970115, 2.591081, 1, 1, 1, 1, 1,
0.737579, 1.343812, 0.2183608, 1, 1, 1, 1, 1,
0.7457896, -0.4744138, 2.266516, 1, 1, 1, 1, 1,
0.7499798, 1.573065, -0.3975672, 1, 1, 1, 1, 1,
0.7537884, -0.6279457, -0.4495188, 1, 1, 1, 1, 1,
0.7541569, 1.357527, 1.361188, 1, 1, 1, 1, 1,
0.7639115, -0.5956792, 4.391482, 1, 1, 1, 1, 1,
0.7671413, -0.3300146, 0.9139123, 1, 1, 1, 1, 1,
0.7694757, -2.170233, 4.496495, 1, 1, 1, 1, 1,
0.7695698, -1.697133, 1.412032, 1, 1, 1, 1, 1,
0.771878, 0.6942728, 0.8226281, 1, 1, 1, 1, 1,
0.7737589, 0.4092585, 2.505808, 1, 1, 1, 1, 1,
0.7739208, -0.0715619, 1.400141, 1, 1, 1, 1, 1,
0.7757785, 0.4954804, 0.8124231, 0, 0, 1, 1, 1,
0.7758422, 0.8966313, 1.025655, 1, 0, 0, 1, 1,
0.7817165, 0.2932627, 0.978465, 1, 0, 0, 1, 1,
0.7824184, -1.284785, 3.40334, 1, 0, 0, 1, 1,
0.7845934, 0.9712107, -0.7631444, 1, 0, 0, 1, 1,
0.786359, -1.196479, 2.197506, 1, 0, 0, 1, 1,
0.7900765, 0.1746185, 1.654875, 0, 0, 0, 1, 1,
0.7902932, -0.3127699, 0.1666462, 0, 0, 0, 1, 1,
0.7945503, -0.7564706, 2.677987, 0, 0, 0, 1, 1,
0.8022245, -0.2059907, 1.403359, 0, 0, 0, 1, 1,
0.8048745, -0.4950259, 3.081089, 0, 0, 0, 1, 1,
0.8068876, -0.6498527, 0.9720104, 0, 0, 0, 1, 1,
0.8091891, 0.7711986, 1.984544, 0, 0, 0, 1, 1,
0.8136138, -0.08965499, 2.242004, 1, 1, 1, 1, 1,
0.8161104, -1.890851, 2.243589, 1, 1, 1, 1, 1,
0.8177091, 1.683142, 0.09825453, 1, 1, 1, 1, 1,
0.8219754, 0.1063162, 2.158189, 1, 1, 1, 1, 1,
0.8241711, -2.153847, 1.117609, 1, 1, 1, 1, 1,
0.8266885, -1.233512, 3.901119, 1, 1, 1, 1, 1,
0.8316, 0.4995754, 2.336511, 1, 1, 1, 1, 1,
0.8389245, 0.5191492, 0.7732276, 1, 1, 1, 1, 1,
0.8419924, 0.157137, 1.699009, 1, 1, 1, 1, 1,
0.8690622, -0.2104219, 1.18994, 1, 1, 1, 1, 1,
0.8707966, 0.2429648, 0.2470376, 1, 1, 1, 1, 1,
0.8714412, 1.561235, 1.066537, 1, 1, 1, 1, 1,
0.8768012, 1.147547, 0.3376493, 1, 1, 1, 1, 1,
0.881712, 1.40566, 0.2681457, 1, 1, 1, 1, 1,
0.8840016, 2.007345, 0.05427647, 1, 1, 1, 1, 1,
0.8950581, 1.161476, 0.04641575, 0, 0, 1, 1, 1,
0.8985487, -0.434329, 2.97542, 1, 0, 0, 1, 1,
0.8988635, -1.315536, 1.498462, 1, 0, 0, 1, 1,
0.905416, -0.3598411, 1.095937, 1, 0, 0, 1, 1,
0.9103116, -0.1112287, 2.271577, 1, 0, 0, 1, 1,
0.910822, 0.7068079, 2.271865, 1, 0, 0, 1, 1,
0.911697, -0.4543883, 2.830911, 0, 0, 0, 1, 1,
0.9137868, 0.2859237, 1.356548, 0, 0, 0, 1, 1,
0.9170659, 1.287119, -0.2837831, 0, 0, 0, 1, 1,
0.9234818, 1.11116, 2.250062, 0, 0, 0, 1, 1,
0.9249032, 1.317646, 1.301458, 0, 0, 0, 1, 1,
0.9294424, -0.0393504, 1.556989, 0, 0, 0, 1, 1,
0.9332422, -0.02852383, 2.098089, 0, 0, 0, 1, 1,
0.9358262, 0.6667063, 1.060396, 1, 1, 1, 1, 1,
0.9374353, -1.417887, 4.160343, 1, 1, 1, 1, 1,
0.9492971, 1.896469, -0.9578241, 1, 1, 1, 1, 1,
0.9600154, -1.768249, 4.64252, 1, 1, 1, 1, 1,
0.9628567, -0.2386304, 4.166968, 1, 1, 1, 1, 1,
0.9728816, -0.7251595, 0.893583, 1, 1, 1, 1, 1,
0.9749171, -0.08551428, 2.103575, 1, 1, 1, 1, 1,
0.9778042, 0.03932755, 1.85822, 1, 1, 1, 1, 1,
0.9807696, 0.7876958, -0.09446196, 1, 1, 1, 1, 1,
0.990704, -0.4780663, 1.370928, 1, 1, 1, 1, 1,
1.000495, 0.08015231, 2.114949, 1, 1, 1, 1, 1,
1.001998, -2.028352, 1.824573, 1, 1, 1, 1, 1,
1.005239, -0.6221321, 2.598291, 1, 1, 1, 1, 1,
1.009979, 0.3754247, 3.248252, 1, 1, 1, 1, 1,
1.016383, 1.529253, -0.1016245, 1, 1, 1, 1, 1,
1.022365, -0.3024045, -0.3810932, 0, 0, 1, 1, 1,
1.023687, 0.7109334, 0.5952054, 1, 0, 0, 1, 1,
1.024818, -0.1077262, 0.7333304, 1, 0, 0, 1, 1,
1.025923, 0.5431383, 1.264273, 1, 0, 0, 1, 1,
1.027403, 1.154967, 1.506631, 1, 0, 0, 1, 1,
1.029927, 2.010173, 2.249969, 1, 0, 0, 1, 1,
1.034837, 0.2188823, 1.479136, 0, 0, 0, 1, 1,
1.036307, 1.297905, 0.5133238, 0, 0, 0, 1, 1,
1.039356, 0.6183766, 2.209072, 0, 0, 0, 1, 1,
1.039971, 0.3365272, 0.6492316, 0, 0, 0, 1, 1,
1.047804, -0.9068527, 2.98525, 0, 0, 0, 1, 1,
1.048843, 0.5530397, 0.5213206, 0, 0, 0, 1, 1,
1.049283, -1.207468, 3.106654, 0, 0, 0, 1, 1,
1.053097, -0.8877465, 1.680477, 1, 1, 1, 1, 1,
1.055643, -1.185775, 2.525738, 1, 1, 1, 1, 1,
1.057029, -0.2760446, 2.125534, 1, 1, 1, 1, 1,
1.058818, -0.5923132, 2.982252, 1, 1, 1, 1, 1,
1.0612, 0.6347225, 1.583924, 1, 1, 1, 1, 1,
1.062437, 0.6382832, 0.3702251, 1, 1, 1, 1, 1,
1.062745, 1.48286, 0.5626702, 1, 1, 1, 1, 1,
1.075358, 0.7230756, 1.607364, 1, 1, 1, 1, 1,
1.084553, 2.324887, 1.271678, 1, 1, 1, 1, 1,
1.085423, 0.8904033, 2.078214, 1, 1, 1, 1, 1,
1.089556, 0.3363457, -0.2338231, 1, 1, 1, 1, 1,
1.099536, 1.246607, 0.6117483, 1, 1, 1, 1, 1,
1.118166, -0.851444, 3.458002, 1, 1, 1, 1, 1,
1.122582, -0.2123009, 2.672459, 1, 1, 1, 1, 1,
1.124585, -0.3938817, 3.158147, 1, 1, 1, 1, 1,
1.126958, 0.712799, 0.4903893, 0, 0, 1, 1, 1,
1.127585, 1.046728, -0.484316, 1, 0, 0, 1, 1,
1.133895, -1.457891, 2.536992, 1, 0, 0, 1, 1,
1.134049, 0.8147825, 1.330296, 1, 0, 0, 1, 1,
1.137634, -0.3873453, 2.137638, 1, 0, 0, 1, 1,
1.154214, 0.5559195, 0.7089695, 1, 0, 0, 1, 1,
1.164724, 0.5629973, 2.741029, 0, 0, 0, 1, 1,
1.168365, 2.168541, 0.2478874, 0, 0, 0, 1, 1,
1.197625, -2.119139, 3.013216, 0, 0, 0, 1, 1,
1.197954, 0.79691, -0.2604546, 0, 0, 0, 1, 1,
1.205553, -0.4851653, 2.112926, 0, 0, 0, 1, 1,
1.206787, -0.09693343, 2.085888, 0, 0, 0, 1, 1,
1.209388, 0.3792295, 1.542568, 0, 0, 0, 1, 1,
1.210328, -1.365371, 0.7332529, 1, 1, 1, 1, 1,
1.215455, 0.7472717, 1.114049, 1, 1, 1, 1, 1,
1.216298, -2.248906, 2.276177, 1, 1, 1, 1, 1,
1.216682, -0.02670315, 0.5045981, 1, 1, 1, 1, 1,
1.223024, -0.5174685, 0.4601071, 1, 1, 1, 1, 1,
1.223086, 1.237858, -0.2424992, 1, 1, 1, 1, 1,
1.230343, -0.9206093, 2.126137, 1, 1, 1, 1, 1,
1.235586, 0.1975591, 1.9567, 1, 1, 1, 1, 1,
1.239303, 0.07858483, 0.9846313, 1, 1, 1, 1, 1,
1.244622, -0.3041658, 2.436269, 1, 1, 1, 1, 1,
1.245771, 0.6098518, 2.085403, 1, 1, 1, 1, 1,
1.259813, -0.781907, 1.529066, 1, 1, 1, 1, 1,
1.262394, -1.245277, 2.935565, 1, 1, 1, 1, 1,
1.26442, -1.019449, 1.025506, 1, 1, 1, 1, 1,
1.268853, 0.03778611, 0.749001, 1, 1, 1, 1, 1,
1.270065, 0.5121967, 1.777022, 0, 0, 1, 1, 1,
1.271379, -2.3509, 1.099063, 1, 0, 0, 1, 1,
1.284798, 0.732636, 0.8450265, 1, 0, 0, 1, 1,
1.288855, 0.335219, 2.741237, 1, 0, 0, 1, 1,
1.293354, -0.0216839, 0.9611313, 1, 0, 0, 1, 1,
1.301371, -1.338819, 0.247654, 1, 0, 0, 1, 1,
1.303737, 0.8762099, 0.6027731, 0, 0, 0, 1, 1,
1.305752, -0.3882442, 2.20887, 0, 0, 0, 1, 1,
1.307007, -0.4161464, 0.8369125, 0, 0, 0, 1, 1,
1.307501, 1.053862, -1.073633, 0, 0, 0, 1, 1,
1.307891, 0.9649682, 1.086582, 0, 0, 0, 1, 1,
1.308107, 3.38236, -0.5176516, 0, 0, 0, 1, 1,
1.308137, -0.8195814, 3.944938, 0, 0, 0, 1, 1,
1.309362, -1.189702, 2.419752, 1, 1, 1, 1, 1,
1.311093, -0.4693035, 1.766356, 1, 1, 1, 1, 1,
1.312758, 0.3791776, 3.660853, 1, 1, 1, 1, 1,
1.319915, -1.099436, 2.302287, 1, 1, 1, 1, 1,
1.320239, 1.479243, -0.3813679, 1, 1, 1, 1, 1,
1.325055, 0.5548572, 2.075296, 1, 1, 1, 1, 1,
1.327418, -0.007807196, 1.942431, 1, 1, 1, 1, 1,
1.331828, 1.316056, 1.31586, 1, 1, 1, 1, 1,
1.344988, -0.7324859, 2.456539, 1, 1, 1, 1, 1,
1.345418, 0.4702202, 1.944305, 1, 1, 1, 1, 1,
1.351525, -1.635012, 3.246883, 1, 1, 1, 1, 1,
1.353332, 1.644727, -1.093309, 1, 1, 1, 1, 1,
1.357798, 1.31719, 0.8283384, 1, 1, 1, 1, 1,
1.36666, 0.9022558, 1.343351, 1, 1, 1, 1, 1,
1.372485, 0.7823717, 0.1464994, 1, 1, 1, 1, 1,
1.374559, -0.8498317, 1.236119, 0, 0, 1, 1, 1,
1.376464, 0.6549224, 1.035928, 1, 0, 0, 1, 1,
1.376961, 0.6048091, 1.232618, 1, 0, 0, 1, 1,
1.381217, -0.07390992, 3.059618, 1, 0, 0, 1, 1,
1.408131, -0.3487512, 0.9736376, 1, 0, 0, 1, 1,
1.408381, 0.4238219, 1.651378, 1, 0, 0, 1, 1,
1.411013, 1.501118, 1.547773, 0, 0, 0, 1, 1,
1.419707, 1.211167, 0.6720952, 0, 0, 0, 1, 1,
1.429398, 2.255069, 1.439444, 0, 0, 0, 1, 1,
1.432605, -0.391073, 0.5422376, 0, 0, 0, 1, 1,
1.439691, 1.023779, 1.704897, 0, 0, 0, 1, 1,
1.462296, 1.635983, -1.316174, 0, 0, 0, 1, 1,
1.474189, -0.7560835, 2.248826, 0, 0, 0, 1, 1,
1.476916, -1.754654, 2.839233, 1, 1, 1, 1, 1,
1.477756, -1.130221, 2.924118, 1, 1, 1, 1, 1,
1.486364, -0.2983474, 1.302152, 1, 1, 1, 1, 1,
1.491767, 0.5336403, 0.4692984, 1, 1, 1, 1, 1,
1.504949, 0.153187, 0.8787029, 1, 1, 1, 1, 1,
1.520117, 0.532739, 0.71815, 1, 1, 1, 1, 1,
1.521959, 0.1566088, 1.631199, 1, 1, 1, 1, 1,
1.522827, 0.8357206, 0.9992813, 1, 1, 1, 1, 1,
1.523831, -2.236091, 2.195991, 1, 1, 1, 1, 1,
1.525282, 1.665496, 0.4119383, 1, 1, 1, 1, 1,
1.54734, -1.178792, 1.425389, 1, 1, 1, 1, 1,
1.548638, -1.927631, 2.838631, 1, 1, 1, 1, 1,
1.565316, 0.07199464, 1.595692, 1, 1, 1, 1, 1,
1.574103, -0.8390828, 3.334875, 1, 1, 1, 1, 1,
1.593835, 1.413632, 0.3245394, 1, 1, 1, 1, 1,
1.616008, -0.4097321, 1.644886, 0, 0, 1, 1, 1,
1.627179, -0.3060989, 1.88294, 1, 0, 0, 1, 1,
1.637291, 0.01452181, 0.7726177, 1, 0, 0, 1, 1,
1.648127, -1.566878, 3.304646, 1, 0, 0, 1, 1,
1.655854, -0.4756844, 0.8421595, 1, 0, 0, 1, 1,
1.665958, 0.4411733, 0.6007537, 1, 0, 0, 1, 1,
1.670174, -0.6800603, 0.6023511, 0, 0, 0, 1, 1,
1.671634, 0.4793657, 1.093759, 0, 0, 0, 1, 1,
1.674973, -1.658911, 3.046302, 0, 0, 0, 1, 1,
1.678389, -0.004419787, 2.122397, 0, 0, 0, 1, 1,
1.70506, -0.1383397, 1.191461, 0, 0, 0, 1, 1,
1.743829, 1.16034, 0.4754108, 0, 0, 0, 1, 1,
1.749377, 1.403497, -0.5754949, 0, 0, 0, 1, 1,
1.752136, 0.5290707, 1.385316, 1, 1, 1, 1, 1,
1.755143, 0.5220824, 0.6312011, 1, 1, 1, 1, 1,
1.763013, 0.1374447, 2.149518, 1, 1, 1, 1, 1,
1.764272, -1.676275, 1.159073, 1, 1, 1, 1, 1,
1.770472, -0.3339302, 0.8518986, 1, 1, 1, 1, 1,
1.802123, 0.8346169, 0.6827404, 1, 1, 1, 1, 1,
1.803203, -0.00348248, 2.891705, 1, 1, 1, 1, 1,
1.807302, 1.005399, 1.707353, 1, 1, 1, 1, 1,
1.866132, -0.3826399, 1.881937, 1, 1, 1, 1, 1,
1.877716, -1.001631, 2.205995, 1, 1, 1, 1, 1,
1.881329, 0.2305111, 1.375945, 1, 1, 1, 1, 1,
1.891537, 0.3399068, 1.763713, 1, 1, 1, 1, 1,
1.896224, -1.501843, 3.745129, 1, 1, 1, 1, 1,
1.908161, 2.220102, 0.003808051, 1, 1, 1, 1, 1,
1.917092, 1.396295, 0.8777345, 1, 1, 1, 1, 1,
1.925015, 0.8946401, 0.9302086, 0, 0, 1, 1, 1,
1.96085, 0.1921655, 1.956431, 1, 0, 0, 1, 1,
2.030463, -1.01178, 1.885631, 1, 0, 0, 1, 1,
2.044066, 0.6794124, 2.026013, 1, 0, 0, 1, 1,
2.06793, 0.7387259, 0.2321504, 1, 0, 0, 1, 1,
2.098893, -0.1661794, 1.545319, 1, 0, 0, 1, 1,
2.103981, -0.7071126, 4.121317, 0, 0, 0, 1, 1,
2.1365, -0.5072412, 4.103746, 0, 0, 0, 1, 1,
2.182911, -0.1637679, 1.152933, 0, 0, 0, 1, 1,
2.240903, 2.146204, 1.710851, 0, 0, 0, 1, 1,
2.25696, 0.5722576, 1.655227, 0, 0, 0, 1, 1,
2.279477, -0.6400932, 0.5682206, 0, 0, 0, 1, 1,
2.374252, -0.3732234, 2.272709, 0, 0, 0, 1, 1,
2.382438, -0.9212139, 1.513422, 1, 1, 1, 1, 1,
2.459439, -0.7983268, 2.192838, 1, 1, 1, 1, 1,
2.575786, -0.8466842, 2.700316, 1, 1, 1, 1, 1,
2.640343, 0.4367876, 2.250006, 1, 1, 1, 1, 1,
2.962775, 1.479126, 2.099692, 1, 1, 1, 1, 1,
2.974193, -0.2633141, -0.1172069, 1, 1, 1, 1, 1,
3.050835, -0.8836142, 3.668192, 1, 1, 1, 1, 1
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
var radius = 9.457601;
var distance = 33.21942;
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
mvMatrix.translate( 0.197732, 0.1108909, 0.3309944 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.21942);
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
