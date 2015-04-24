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
-3.586436, 0.3903708, -1.248626, 1, 0, 0, 1,
-3.078082, -0.04973768, -0.6936628, 1, 0.007843138, 0, 1,
-2.874735, 0.9290482, -2.465731, 1, 0.01176471, 0, 1,
-2.526822, -0.1404217, -3.191315, 1, 0.01960784, 0, 1,
-2.410271, -0.103041, -2.861538, 1, 0.02352941, 0, 1,
-2.400164, 1.098789, -1.589662, 1, 0.03137255, 0, 1,
-2.387698, -1.336357, -1.622864, 1, 0.03529412, 0, 1,
-2.351977, 0.9133469, 0.7718301, 1, 0.04313726, 0, 1,
-2.339405, -1.072406, -0.8075649, 1, 0.04705882, 0, 1,
-2.263302, 1.012033, -0.7806128, 1, 0.05490196, 0, 1,
-2.255394, -0.07992495, -0.6339012, 1, 0.05882353, 0, 1,
-2.243355, -0.6652108, -0.7404233, 1, 0.06666667, 0, 1,
-2.217724, 1.241264, -0.5791366, 1, 0.07058824, 0, 1,
-2.214924, 0.7503574, -1.024098, 1, 0.07843138, 0, 1,
-2.210433, 0.2564241, -0.6928496, 1, 0.08235294, 0, 1,
-2.198327, 0.1418233, -2.009269, 1, 0.09019608, 0, 1,
-2.127723, -1.007343, -0.7639892, 1, 0.09411765, 0, 1,
-2.030245, 0.4435314, -1.842707, 1, 0.1019608, 0, 1,
-2.018292, -0.9831267, -2.417967, 1, 0.1098039, 0, 1,
-2.00282, 2.169253, -0.5997866, 1, 0.1137255, 0, 1,
-1.991394, -0.8785285, -1.968274, 1, 0.1215686, 0, 1,
-1.983893, -0.003019114, -0.1331783, 1, 0.1254902, 0, 1,
-1.967958, 0.2609405, -1.469496, 1, 0.1333333, 0, 1,
-1.964451, 1.00932, -0.4396571, 1, 0.1372549, 0, 1,
-1.91883, -1.422439, -2.72888, 1, 0.145098, 0, 1,
-1.914373, 3.056002, -0.3419356, 1, 0.1490196, 0, 1,
-1.837425, -0.6957337, -0.7672028, 1, 0.1568628, 0, 1,
-1.833895, -0.1029899, -1.875984, 1, 0.1607843, 0, 1,
-1.828836, 0.7919571, -1.966447, 1, 0.1686275, 0, 1,
-1.787546, -0.5722676, -1.522543, 1, 0.172549, 0, 1,
-1.779188, 0.3609997, -2.457944, 1, 0.1803922, 0, 1,
-1.777929, -0.3579716, -0.9251147, 1, 0.1843137, 0, 1,
-1.759774, 0.2567367, -3.085275, 1, 0.1921569, 0, 1,
-1.724855, -0.4862592, -2.160026, 1, 0.1960784, 0, 1,
-1.692955, -0.5052341, -2.427581, 1, 0.2039216, 0, 1,
-1.689502, 0.4006441, -1.926386, 1, 0.2117647, 0, 1,
-1.687516, 0.00985863, -1.569594, 1, 0.2156863, 0, 1,
-1.675601, 0.6814255, -1.358082, 1, 0.2235294, 0, 1,
-1.661395, -0.6923497, -2.257754, 1, 0.227451, 0, 1,
-1.659838, -0.1405285, -2.42248, 1, 0.2352941, 0, 1,
-1.626256, -0.3417546, -0.5037965, 1, 0.2392157, 0, 1,
-1.615294, -0.05834719, -2.79511, 1, 0.2470588, 0, 1,
-1.607333, 0.7239869, -0.316055, 1, 0.2509804, 0, 1,
-1.598942, -0.09897864, -2.414671, 1, 0.2588235, 0, 1,
-1.581064, 0.2647165, -1.205096, 1, 0.2627451, 0, 1,
-1.57221, 0.8123946, -1.70752, 1, 0.2705882, 0, 1,
-1.57179, 1.0107, -0.408838, 1, 0.2745098, 0, 1,
-1.567954, 2.125299, 0.03646566, 1, 0.282353, 0, 1,
-1.550259, -0.06520126, -0.8413187, 1, 0.2862745, 0, 1,
-1.539792, 1.051269, 0.03661206, 1, 0.2941177, 0, 1,
-1.538328, 0.4133638, -0.4641681, 1, 0.3019608, 0, 1,
-1.536848, -0.7021314, -1.968915, 1, 0.3058824, 0, 1,
-1.535807, -0.0006307843, -0.1953476, 1, 0.3137255, 0, 1,
-1.527786, 1.029227, -1.745348, 1, 0.3176471, 0, 1,
-1.503252, 0.7550018, -1.217016, 1, 0.3254902, 0, 1,
-1.484871, -0.1138607, -2.733185, 1, 0.3294118, 0, 1,
-1.478377, -0.253446, -2.064852, 1, 0.3372549, 0, 1,
-1.47805, -0.3888839, -2.163949, 1, 0.3411765, 0, 1,
-1.466815, 0.9811025, -2.325431, 1, 0.3490196, 0, 1,
-1.461217, 1.12163, -1.603661, 1, 0.3529412, 0, 1,
-1.459225, -1.424801, -3.115433, 1, 0.3607843, 0, 1,
-1.447961, 0.7715702, 0.09725045, 1, 0.3647059, 0, 1,
-1.439106, 1.150678, -1.574854, 1, 0.372549, 0, 1,
-1.433259, 2.431946, -1.054707, 1, 0.3764706, 0, 1,
-1.426572, -1.038655, -2.558463, 1, 0.3843137, 0, 1,
-1.409522, 0.4918124, 1.648291, 1, 0.3882353, 0, 1,
-1.407092, -0.5309406, -1.503804, 1, 0.3960784, 0, 1,
-1.404027, 0.337175, 0.1149091, 1, 0.4039216, 0, 1,
-1.398823, 1.036173, -0.8922753, 1, 0.4078431, 0, 1,
-1.395026, 0.4373472, -1.060389, 1, 0.4156863, 0, 1,
-1.38507, -1.654184, -2.735259, 1, 0.4196078, 0, 1,
-1.38199, 0.01482322, -1.309533, 1, 0.427451, 0, 1,
-1.381486, -0.2721559, -1.294129, 1, 0.4313726, 0, 1,
-1.381418, -0.7823457, -2.055761, 1, 0.4392157, 0, 1,
-1.380898, 0.3870904, -1.445526, 1, 0.4431373, 0, 1,
-1.367429, 1.30934, -0.893428, 1, 0.4509804, 0, 1,
-1.365164, 0.3481437, -3.457179, 1, 0.454902, 0, 1,
-1.351942, 1.04573, 0.0650671, 1, 0.4627451, 0, 1,
-1.345336, 1.679865, 0.1755087, 1, 0.4666667, 0, 1,
-1.324486, 0.6063018, -0.4056016, 1, 0.4745098, 0, 1,
-1.319183, -1.482126, -2.279969, 1, 0.4784314, 0, 1,
-1.306993, 0.2794356, -0.4924772, 1, 0.4862745, 0, 1,
-1.302227, 0.5655737, -1.352087, 1, 0.4901961, 0, 1,
-1.277279, 1.054909, -1.108218, 1, 0.4980392, 0, 1,
-1.271963, -0.009556966, -2.194804, 1, 0.5058824, 0, 1,
-1.264995, -1.055544, -1.276665, 1, 0.509804, 0, 1,
-1.263887, -0.5739335, -0.9783142, 1, 0.5176471, 0, 1,
-1.252983, 0.821558, -0.3580201, 1, 0.5215687, 0, 1,
-1.238437, -1.387941, -3.586664, 1, 0.5294118, 0, 1,
-1.235649, -0.7134158, -1.19511, 1, 0.5333334, 0, 1,
-1.234257, -0.9788387, -2.568105, 1, 0.5411765, 0, 1,
-1.233787, -0.1480496, -1.024488, 1, 0.5450981, 0, 1,
-1.232606, -0.4881758, -0.9743586, 1, 0.5529412, 0, 1,
-1.214457, 0.7631093, -1.751521, 1, 0.5568628, 0, 1,
-1.208784, 0.4604518, -0.3750686, 1, 0.5647059, 0, 1,
-1.20815, 0.3969403, -1.201006, 1, 0.5686275, 0, 1,
-1.204168, -0.5654711, -3.672762, 1, 0.5764706, 0, 1,
-1.204121, -1.613473, -3.329585, 1, 0.5803922, 0, 1,
-1.19533, 0.4804774, -0.9872435, 1, 0.5882353, 0, 1,
-1.193115, -0.2554402, -1.563727, 1, 0.5921569, 0, 1,
-1.178494, 0.8235605, 0.03508523, 1, 0.6, 0, 1,
-1.174746, 0.2674221, -1.171823, 1, 0.6078432, 0, 1,
-1.173561, 1.172383, -1.52297, 1, 0.6117647, 0, 1,
-1.171534, -0.1843974, -3.563123, 1, 0.6196079, 0, 1,
-1.170181, -0.29488, -2.291872, 1, 0.6235294, 0, 1,
-1.155332, 0.1992267, -2.336974, 1, 0.6313726, 0, 1,
-1.153586, 1.188426, -2.117885, 1, 0.6352941, 0, 1,
-1.148177, 1.446573, -0.7941117, 1, 0.6431373, 0, 1,
-1.147924, 0.6330926, -2.090726, 1, 0.6470588, 0, 1,
-1.140954, -0.9603364, -0.22567, 1, 0.654902, 0, 1,
-1.133385, 1.076753, -0.9403297, 1, 0.6588235, 0, 1,
-1.133254, 1.413392, -0.674688, 1, 0.6666667, 0, 1,
-1.133083, -0.4042649, -1.932413, 1, 0.6705883, 0, 1,
-1.13115, -1.292711, -1.430415, 1, 0.6784314, 0, 1,
-1.124318, 0.2924813, -1.716209, 1, 0.682353, 0, 1,
-1.123884, -0.9556834, -2.86995, 1, 0.6901961, 0, 1,
-1.118655, -0.7958352, -1.928355, 1, 0.6941177, 0, 1,
-1.118093, -1.021435, -0.8735945, 1, 0.7019608, 0, 1,
-1.11393, -0.2490898, -5.132049, 1, 0.7098039, 0, 1,
-1.108473, -1.411909, -0.3496132, 1, 0.7137255, 0, 1,
-1.108197, -1.048483, -2.262187, 1, 0.7215686, 0, 1,
-1.096431, 0.02397436, -1.469959, 1, 0.7254902, 0, 1,
-1.093709, -0.2141406, -1.876776, 1, 0.7333333, 0, 1,
-1.093094, -0.4507234, -2.731022, 1, 0.7372549, 0, 1,
-1.087917, 0.3940967, -1.053759, 1, 0.7450981, 0, 1,
-1.085318, 0.6937969, -1.081104, 1, 0.7490196, 0, 1,
-1.078435, -0.2066877, -1.531573, 1, 0.7568628, 0, 1,
-1.069734, 0.5537869, -1.442111, 1, 0.7607843, 0, 1,
-1.069195, -0.7189381, -1.591314, 1, 0.7686275, 0, 1,
-1.065022, -1.094652, -1.653232, 1, 0.772549, 0, 1,
-1.05211, -1.3023, -1.572029, 1, 0.7803922, 0, 1,
-1.049806, -0.8119704, -2.110707, 1, 0.7843137, 0, 1,
-1.041149, -0.3768691, -1.147719, 1, 0.7921569, 0, 1,
-1.038345, -0.7098491, -3.248087, 1, 0.7960784, 0, 1,
-1.030114, -0.5734561, -2.383606, 1, 0.8039216, 0, 1,
-1.028831, 1.567311, 0.8936545, 1, 0.8117647, 0, 1,
-1.009035, -0.3957696, -3.42858, 1, 0.8156863, 0, 1,
-1.00818, 0.3094979, -0.4782456, 1, 0.8235294, 0, 1,
-1.001467, -0.4568108, -1.191848, 1, 0.827451, 0, 1,
-0.9976472, 0.3237505, -2.546938, 1, 0.8352941, 0, 1,
-0.9938983, 0.406477, -2.365367, 1, 0.8392157, 0, 1,
-0.9888614, 0.5074, -2.024162, 1, 0.8470588, 0, 1,
-0.974591, -0.3788971, -4.232393, 1, 0.8509804, 0, 1,
-0.9716598, -0.3133893, -2.719811, 1, 0.8588235, 0, 1,
-0.9703095, -0.8312163, -2.351418, 1, 0.8627451, 0, 1,
-0.9661239, 0.9618849, 0.08989631, 1, 0.8705882, 0, 1,
-0.9651006, 0.5710624, 0.5317788, 1, 0.8745098, 0, 1,
-0.9639838, -0.1122048, 0.5257561, 1, 0.8823529, 0, 1,
-0.9619067, 1.245062, 0.3249063, 1, 0.8862745, 0, 1,
-0.9586058, 0.4258216, -3.235842, 1, 0.8941177, 0, 1,
-0.9574096, -1.842906, -3.269835, 1, 0.8980392, 0, 1,
-0.9557288, 1.361766, 0.6802014, 1, 0.9058824, 0, 1,
-0.9547347, 0.07811493, -1.503371, 1, 0.9137255, 0, 1,
-0.9471178, 2.251623, 0.550695, 1, 0.9176471, 0, 1,
-0.9452553, -1.375882, -2.26993, 1, 0.9254902, 0, 1,
-0.9448618, 0.4166919, -2.279185, 1, 0.9294118, 0, 1,
-0.9425471, 0.4448178, -0.4870383, 1, 0.9372549, 0, 1,
-0.9420139, 1.816223, -0.4232802, 1, 0.9411765, 0, 1,
-0.9367679, -0.8380961, -5.451411, 1, 0.9490196, 0, 1,
-0.9366329, 0.7533232, -1.083911, 1, 0.9529412, 0, 1,
-0.9344507, -0.1190292, -2.718397, 1, 0.9607843, 0, 1,
-0.9312073, -0.08186508, -4.299243, 1, 0.9647059, 0, 1,
-0.9252852, 1.620613, 1.168373, 1, 0.972549, 0, 1,
-0.9080355, 1.091391, -1.584759, 1, 0.9764706, 0, 1,
-0.9036037, -0.3400649, -1.926612, 1, 0.9843137, 0, 1,
-0.9003145, 0.1782296, -2.313818, 1, 0.9882353, 0, 1,
-0.8981585, 2.227308, -1.1155, 1, 0.9960784, 0, 1,
-0.8964176, 0.333198, -2.28553, 0.9960784, 1, 0, 1,
-0.8916926, 0.03858479, -0.5661916, 0.9921569, 1, 0, 1,
-0.8911333, -0.01849892, -3.282703, 0.9843137, 1, 0, 1,
-0.8870708, -0.2497761, -3.573675, 0.9803922, 1, 0, 1,
-0.8858278, 0.5328048, -1.649707, 0.972549, 1, 0, 1,
-0.8837375, -1.776462, -3.084896, 0.9686275, 1, 0, 1,
-0.8820741, 0.8614353, -0.03669165, 0.9607843, 1, 0, 1,
-0.8817251, -0.4292573, -1.868509, 0.9568627, 1, 0, 1,
-0.8802198, 0.5037309, -2.205414, 0.9490196, 1, 0, 1,
-0.8800722, 1.512931, 0.6770622, 0.945098, 1, 0, 1,
-0.8781058, 0.4384284, -0.4591997, 0.9372549, 1, 0, 1,
-0.8723733, -0.7033948, -2.66602, 0.9333333, 1, 0, 1,
-0.8723068, -1.040003, -2.2176, 0.9254902, 1, 0, 1,
-0.8697128, 2.077846, 0.2513364, 0.9215686, 1, 0, 1,
-0.8647084, -1.639925, -1.909245, 0.9137255, 1, 0, 1,
-0.8557045, -0.7804609, -2.793539, 0.9098039, 1, 0, 1,
-0.847885, -0.2791727, -1.605487, 0.9019608, 1, 0, 1,
-0.8475506, -0.9854198, -1.877817, 0.8941177, 1, 0, 1,
-0.8397965, -0.8764096, -2.816242, 0.8901961, 1, 0, 1,
-0.8352602, -0.5677786, -1.937321, 0.8823529, 1, 0, 1,
-0.8336902, 0.7846105, -2.411801, 0.8784314, 1, 0, 1,
-0.8322207, -0.3823326, -3.072874, 0.8705882, 1, 0, 1,
-0.8316491, 0.2108754, -1.444113, 0.8666667, 1, 0, 1,
-0.8309144, 1.054588, -0.5992507, 0.8588235, 1, 0, 1,
-0.8296905, -1.225602, -4.886734, 0.854902, 1, 0, 1,
-0.8275553, 0.3921389, 0.6378653, 0.8470588, 1, 0, 1,
-0.8267164, -1.509293, -2.392222, 0.8431373, 1, 0, 1,
-0.8216577, -1.846545, -3.519812, 0.8352941, 1, 0, 1,
-0.8205178, -0.8078591, -2.018915, 0.8313726, 1, 0, 1,
-0.8183517, -1.138938, -3.103367, 0.8235294, 1, 0, 1,
-0.816734, -0.9178189, -2.22671, 0.8196079, 1, 0, 1,
-0.8036731, -0.8569378, 0.1045053, 0.8117647, 1, 0, 1,
-0.8017122, 1.483169, -1.208676, 0.8078431, 1, 0, 1,
-0.7999083, 0.1863595, 0.4374246, 0.8, 1, 0, 1,
-0.7966841, 0.5929589, 0.4721179, 0.7921569, 1, 0, 1,
-0.7959299, 1.178094, -0.7266133, 0.7882353, 1, 0, 1,
-0.7942975, -0.1467631, -3.524121, 0.7803922, 1, 0, 1,
-0.7938303, 0.1350929, -2.029986, 0.7764706, 1, 0, 1,
-0.7936851, 0.9458537, 0.8929396, 0.7686275, 1, 0, 1,
-0.7912263, -1.0075, -3.200175, 0.7647059, 1, 0, 1,
-0.787928, 1.238839, 0.3933803, 0.7568628, 1, 0, 1,
-0.7678088, -0.1907897, 0.2729294, 0.7529412, 1, 0, 1,
-0.7657967, 0.3291447, -1.974215, 0.7450981, 1, 0, 1,
-0.7603935, -0.578261, -1.935545, 0.7411765, 1, 0, 1,
-0.7582583, 0.6734728, -0.537866, 0.7333333, 1, 0, 1,
-0.7416853, -0.6841078, -1.718449, 0.7294118, 1, 0, 1,
-0.7365627, -1.75131, -1.03809, 0.7215686, 1, 0, 1,
-0.7328642, 0.8385516, -1.913567, 0.7176471, 1, 0, 1,
-0.7300897, -0.3154028, -1.546462, 0.7098039, 1, 0, 1,
-0.7284623, 0.3211658, -2.086922, 0.7058824, 1, 0, 1,
-0.7273312, -1.458298, -3.097769, 0.6980392, 1, 0, 1,
-0.7204626, -0.6557539, -0.8168551, 0.6901961, 1, 0, 1,
-0.7159805, 1.674311, -0.06319533, 0.6862745, 1, 0, 1,
-0.7159311, -0.3432982, -1.728403, 0.6784314, 1, 0, 1,
-0.7145369, -0.7361202, -2.365588, 0.6745098, 1, 0, 1,
-0.7075111, -0.6133168, -2.690817, 0.6666667, 1, 0, 1,
-0.7064813, -1.853961, -2.61674, 0.6627451, 1, 0, 1,
-0.7030635, 0.6130438, -1.885835, 0.654902, 1, 0, 1,
-0.7027475, -0.1581002, -2.127363, 0.6509804, 1, 0, 1,
-0.6996791, 0.1776208, -1.273475, 0.6431373, 1, 0, 1,
-0.6944189, 0.5327328, -2.786644, 0.6392157, 1, 0, 1,
-0.6937887, -0.1838903, -1.312954, 0.6313726, 1, 0, 1,
-0.681343, 0.1367226, -1.63229, 0.627451, 1, 0, 1,
-0.6788537, 1.904936, -0.4406668, 0.6196079, 1, 0, 1,
-0.6785644, -0.3987931, -2.087925, 0.6156863, 1, 0, 1,
-0.6770875, -1.686856, -2.682382, 0.6078432, 1, 0, 1,
-0.6750212, 0.121641, -1.530172, 0.6039216, 1, 0, 1,
-0.6720297, 0.1228988, -1.93167, 0.5960785, 1, 0, 1,
-0.6702823, 0.2713059, -1.820521, 0.5882353, 1, 0, 1,
-0.6701678, 1.084098, -0.2318656, 0.5843138, 1, 0, 1,
-0.6693113, 0.4314092, 0.3619535, 0.5764706, 1, 0, 1,
-0.6671008, -0.124906, -1.615943, 0.572549, 1, 0, 1,
-0.6645404, -0.475262, -3.795938, 0.5647059, 1, 0, 1,
-0.6640133, 1.877578, 0.648717, 0.5607843, 1, 0, 1,
-0.6636904, -0.2486699, -3.38934, 0.5529412, 1, 0, 1,
-0.6628065, 0.9168799, -1.511361, 0.5490196, 1, 0, 1,
-0.6622742, -0.2772924, -2.782153, 0.5411765, 1, 0, 1,
-0.6613812, -1.248948, -2.104582, 0.5372549, 1, 0, 1,
-0.6584314, 0.6960443, 0.1802322, 0.5294118, 1, 0, 1,
-0.6525576, 0.5998116, -1.106038, 0.5254902, 1, 0, 1,
-0.6465799, -1.227576, -1.36046, 0.5176471, 1, 0, 1,
-0.6450168, -1.784799, -3.778203, 0.5137255, 1, 0, 1,
-0.6406322, 0.04787884, -3.040089, 0.5058824, 1, 0, 1,
-0.6402436, -1.83621, -3.011976, 0.5019608, 1, 0, 1,
-0.6398163, -1.627779, -2.245333, 0.4941176, 1, 0, 1,
-0.6385917, 0.8065403, 0.3976769, 0.4862745, 1, 0, 1,
-0.6374577, 2.160015, -0.06786542, 0.4823529, 1, 0, 1,
-0.6371951, -0.1655386, -2.497882, 0.4745098, 1, 0, 1,
-0.6366138, 0.6446719, -0.9269201, 0.4705882, 1, 0, 1,
-0.6339123, -0.1261388, -0.2547687, 0.4627451, 1, 0, 1,
-0.6336147, -1.532119, -2.675937, 0.4588235, 1, 0, 1,
-0.6311775, -0.8252981, -2.687391, 0.4509804, 1, 0, 1,
-0.6291212, -1.525725, -2.296951, 0.4470588, 1, 0, 1,
-0.6286314, -0.1955875, -3.770237, 0.4392157, 1, 0, 1,
-0.6271857, -0.09377524, -0.7940702, 0.4352941, 1, 0, 1,
-0.6230578, -0.496281, -0.97681, 0.427451, 1, 0, 1,
-0.6074779, 0.7536121, -0.8623807, 0.4235294, 1, 0, 1,
-0.6027986, 1.081609, -1.510851, 0.4156863, 1, 0, 1,
-0.6027475, 1.278757, -0.9143807, 0.4117647, 1, 0, 1,
-0.6008964, -0.2546972, -3.738117, 0.4039216, 1, 0, 1,
-0.597286, 0.04653878, -2.142239, 0.3960784, 1, 0, 1,
-0.5962483, -0.4955168, -2.43983, 0.3921569, 1, 0, 1,
-0.5927103, -2.606067, -1.41516, 0.3843137, 1, 0, 1,
-0.5921674, -0.7497914, -2.572292, 0.3803922, 1, 0, 1,
-0.5903792, -0.08536155, -2.233323, 0.372549, 1, 0, 1,
-0.5850686, 0.724053, -0.9491104, 0.3686275, 1, 0, 1,
-0.5847149, 2.702132, -0.1321574, 0.3607843, 1, 0, 1,
-0.5839217, -0.05666421, -2.498755, 0.3568628, 1, 0, 1,
-0.5791358, -1.453193, -1.851327, 0.3490196, 1, 0, 1,
-0.5786583, 0.5591121, -1.137534, 0.345098, 1, 0, 1,
-0.5758666, -0.4801004, -2.697409, 0.3372549, 1, 0, 1,
-0.5710586, 0.3951305, 0.5328979, 0.3333333, 1, 0, 1,
-0.5702199, -0.8411524, -4.203223, 0.3254902, 1, 0, 1,
-0.5690534, -1.949908, -5.273652, 0.3215686, 1, 0, 1,
-0.5687485, 1.108003, -0.5434535, 0.3137255, 1, 0, 1,
-0.5680917, 0.366204, -1.90941, 0.3098039, 1, 0, 1,
-0.5652995, 1.446759, -1.205946, 0.3019608, 1, 0, 1,
-0.5647545, 0.8881081, -1.559422, 0.2941177, 1, 0, 1,
-0.5646857, -2.042469, -3.043139, 0.2901961, 1, 0, 1,
-0.5639785, 0.2675676, -0.826723, 0.282353, 1, 0, 1,
-0.5632019, -0.7428945, -2.462852, 0.2784314, 1, 0, 1,
-0.5609919, -0.05975728, -1.112285, 0.2705882, 1, 0, 1,
-0.5594991, 1.340325, -2.190204, 0.2666667, 1, 0, 1,
-0.5587257, 0.6477928, -0.9536607, 0.2588235, 1, 0, 1,
-0.5499894, 1.205131, 0.1110263, 0.254902, 1, 0, 1,
-0.5455596, 1.54278, 1.098021, 0.2470588, 1, 0, 1,
-0.5438662, 0.5618357, -0.7819168, 0.2431373, 1, 0, 1,
-0.5428599, -0.6717367, -2.880796, 0.2352941, 1, 0, 1,
-0.5415699, 0.4474941, 1.372981, 0.2313726, 1, 0, 1,
-0.5403135, 1.248253, 0.1867071, 0.2235294, 1, 0, 1,
-0.5401624, 0.08889537, -1.719529, 0.2196078, 1, 0, 1,
-0.5374717, -0.776282, -3.450975, 0.2117647, 1, 0, 1,
-0.5336386, 0.2149271, -0.3808838, 0.2078431, 1, 0, 1,
-0.5332169, -0.8757452, -1.911009, 0.2, 1, 0, 1,
-0.5301759, 1.049557, -3.079205, 0.1921569, 1, 0, 1,
-0.526206, 0.1033392, -2.305247, 0.1882353, 1, 0, 1,
-0.5216001, 0.6120443, -1.462719, 0.1803922, 1, 0, 1,
-0.5176587, 0.7001565, 0.05359374, 0.1764706, 1, 0, 1,
-0.5117213, -0.3801898, -1.953412, 0.1686275, 1, 0, 1,
-0.5090809, -0.4014647, -2.767585, 0.1647059, 1, 0, 1,
-0.508536, -0.8873824, -3.895056, 0.1568628, 1, 0, 1,
-0.5064812, 0.6280074, -0.2656378, 0.1529412, 1, 0, 1,
-0.5062119, -1.478137, -2.913508, 0.145098, 1, 0, 1,
-0.5060032, -0.2043456, -2.518315, 0.1411765, 1, 0, 1,
-0.5052897, -0.9855774, -1.961846, 0.1333333, 1, 0, 1,
-0.5000243, 1.972551, 0.2602954, 0.1294118, 1, 0, 1,
-0.4986173, -0.4401318, -1.160976, 0.1215686, 1, 0, 1,
-0.4961089, 0.4242048, -2.354239, 0.1176471, 1, 0, 1,
-0.4888367, 0.2170919, -0.8135093, 0.1098039, 1, 0, 1,
-0.4855705, 0.7312633, -1.109323, 0.1058824, 1, 0, 1,
-0.4841217, -1.369651, -3.491979, 0.09803922, 1, 0, 1,
-0.4782778, 0.6267657, -1.911421, 0.09019608, 1, 0, 1,
-0.4754924, 0.9925398, -0.6602956, 0.08627451, 1, 0, 1,
-0.4646012, -0.1101726, -1.159843, 0.07843138, 1, 0, 1,
-0.4645094, 1.330852, -1.458873, 0.07450981, 1, 0, 1,
-0.4633064, 0.6636962, -0.3477012, 0.06666667, 1, 0, 1,
-0.4618922, -0.3827111, -1.163087, 0.0627451, 1, 0, 1,
-0.4616073, -0.04834642, -3.595561, 0.05490196, 1, 0, 1,
-0.460728, -0.7707048, -2.856681, 0.05098039, 1, 0, 1,
-0.4587159, -1.201881, -2.178209, 0.04313726, 1, 0, 1,
-0.4465975, -0.1565973, -2.055854, 0.03921569, 1, 0, 1,
-0.444704, -0.01266165, -1.48706, 0.03137255, 1, 0, 1,
-0.4420097, 0.59263, -1.626837, 0.02745098, 1, 0, 1,
-0.4411577, -0.08051654, -3.280027, 0.01960784, 1, 0, 1,
-0.4382985, 0.283252, -0.06045645, 0.01568628, 1, 0, 1,
-0.435782, -0.3249803, -1.496355, 0.007843138, 1, 0, 1,
-0.4232975, -0.01453191, -2.428843, 0.003921569, 1, 0, 1,
-0.4232668, 0.1785177, -1.591753, 0, 1, 0.003921569, 1,
-0.4217162, -0.3156185, -3.323866, 0, 1, 0.01176471, 1,
-0.4171195, 0.7138, -0.8940128, 0, 1, 0.01568628, 1,
-0.4153683, -0.3453068, -0.6316538, 0, 1, 0.02352941, 1,
-0.4092012, 1.356252, -1.045936, 0, 1, 0.02745098, 1,
-0.4090571, 0.09242413, -1.16473, 0, 1, 0.03529412, 1,
-0.4074645, -0.2781526, -2.141356, 0, 1, 0.03921569, 1,
-0.404713, 0.7573469, -0.270873, 0, 1, 0.04705882, 1,
-0.4015944, -1.213276, -3.199608, 0, 1, 0.05098039, 1,
-0.3988232, -1.737377, -2.224525, 0, 1, 0.05882353, 1,
-0.3970127, 1.255784, -0.2387586, 0, 1, 0.0627451, 1,
-0.3967235, -0.8555481, -2.417454, 0, 1, 0.07058824, 1,
-0.390087, 2.019842, -1.163268, 0, 1, 0.07450981, 1,
-0.387267, 0.2452535, -0.2255819, 0, 1, 0.08235294, 1,
-0.382531, -0.4145362, -2.065211, 0, 1, 0.08627451, 1,
-0.3814635, -0.5705352, -2.589216, 0, 1, 0.09411765, 1,
-0.3761266, -0.1549622, -1.273017, 0, 1, 0.1019608, 1,
-0.367177, -1.238042, -0.5538285, 0, 1, 0.1058824, 1,
-0.3652341, -0.8851329, -3.260131, 0, 1, 0.1137255, 1,
-0.3651436, -1.098676, -2.832751, 0, 1, 0.1176471, 1,
-0.3642678, 0.04423933, -3.421014, 0, 1, 0.1254902, 1,
-0.3633137, 1.477976, 0.536785, 0, 1, 0.1294118, 1,
-0.3620692, -0.438945, -3.276986, 0, 1, 0.1372549, 1,
-0.3594312, -0.8502523, -2.854587, 0, 1, 0.1411765, 1,
-0.3548414, -0.6062217, -2.770329, 0, 1, 0.1490196, 1,
-0.351121, 0.5419516, 1.089557, 0, 1, 0.1529412, 1,
-0.3506527, 2.196494, -0.6723925, 0, 1, 0.1607843, 1,
-0.3497114, 0.4741364, 0.4461142, 0, 1, 0.1647059, 1,
-0.337401, -0.2538349, -2.510857, 0, 1, 0.172549, 1,
-0.3356467, 0.7247097, 0.1552864, 0, 1, 0.1764706, 1,
-0.3331637, -0.009416839, -1.094822, 0, 1, 0.1843137, 1,
-0.3331467, 0.5533171, 0.7454554, 0, 1, 0.1882353, 1,
-0.3135654, 0.9010732, -1.001954, 0, 1, 0.1960784, 1,
-0.3119771, 1.382828, 0.07923579, 0, 1, 0.2039216, 1,
-0.311329, 0.9847179, -1.202629, 0, 1, 0.2078431, 1,
-0.3041585, 1.062457, -1.449167, 0, 1, 0.2156863, 1,
-0.3034273, -0.7800314, -4.344814, 0, 1, 0.2196078, 1,
-0.3030051, 0.8897881, 0.976185, 0, 1, 0.227451, 1,
-0.3019264, -0.7467647, -2.803266, 0, 1, 0.2313726, 1,
-0.3008223, -1.122118, -3.179606, 0, 1, 0.2392157, 1,
-0.2994828, 1.498631, -1.333264, 0, 1, 0.2431373, 1,
-0.294217, -1.397219, -1.11043, 0, 1, 0.2509804, 1,
-0.2935361, 0.7063622, -1.189669, 0, 1, 0.254902, 1,
-0.2929014, 1.929763, -2.670661, 0, 1, 0.2627451, 1,
-0.2902245, 1.006027, -0.1740664, 0, 1, 0.2666667, 1,
-0.2870784, -0.5774935, -3.132712, 0, 1, 0.2745098, 1,
-0.2854851, -0.8550673, -2.816322, 0, 1, 0.2784314, 1,
-0.2846106, -0.2468853, -0.9292831, 0, 1, 0.2862745, 1,
-0.2820084, -1.046416, -3.11777, 0, 1, 0.2901961, 1,
-0.2774062, 1.299323, 0.07292545, 0, 1, 0.2980392, 1,
-0.2717906, 0.7839825, 0.2721574, 0, 1, 0.3058824, 1,
-0.2715751, -0.2796614, -1.806849, 0, 1, 0.3098039, 1,
-0.2674505, 2.839423, -1.130955, 0, 1, 0.3176471, 1,
-0.2662318, 1.135551, 0.0273959, 0, 1, 0.3215686, 1,
-0.2621025, 0.7468526, 0.599739, 0, 1, 0.3294118, 1,
-0.2588875, -0.8338647, -1.071967, 0, 1, 0.3333333, 1,
-0.2566088, -1.941886, -1.697977, 0, 1, 0.3411765, 1,
-0.2536592, 1.041678, 0.7529814, 0, 1, 0.345098, 1,
-0.2521242, 1.807475, -0.8388034, 0, 1, 0.3529412, 1,
-0.2510327, 1.319862, 1.01256, 0, 1, 0.3568628, 1,
-0.2502702, 0.7708476, -1.133473, 0, 1, 0.3647059, 1,
-0.2496137, -0.6575909, -2.317936, 0, 1, 0.3686275, 1,
-0.248746, -0.3403706, -3.939609, 0, 1, 0.3764706, 1,
-0.247669, 1.720124, 1.184994, 0, 1, 0.3803922, 1,
-0.2474422, 0.462344, 0.127761, 0, 1, 0.3882353, 1,
-0.2473193, -0.314343, -2.869625, 0, 1, 0.3921569, 1,
-0.2446019, -1.703321, -2.092179, 0, 1, 0.4, 1,
-0.2415626, -1.029978, -3.196685, 0, 1, 0.4078431, 1,
-0.2278188, 0.6674498, -1.288756, 0, 1, 0.4117647, 1,
-0.2272695, 0.9824485, -0.6909086, 0, 1, 0.4196078, 1,
-0.2231288, 0.2710688, 0.1302684, 0, 1, 0.4235294, 1,
-0.2207294, 1.247014, 0.05599627, 0, 1, 0.4313726, 1,
-0.2145302, 1.466719, 0.2051741, 0, 1, 0.4352941, 1,
-0.2142734, 1.571029, 0.4032544, 0, 1, 0.4431373, 1,
-0.2140338, 0.5444908, -2.71355, 0, 1, 0.4470588, 1,
-0.2139968, -2.353471, -2.538641, 0, 1, 0.454902, 1,
-0.2133812, -0.4740333, -3.457838, 0, 1, 0.4588235, 1,
-0.2100888, -0.3984867, -1.545426, 0, 1, 0.4666667, 1,
-0.2057005, -0.7309514, -5.382773, 0, 1, 0.4705882, 1,
-0.2022598, -0.2604576, -4.110264, 0, 1, 0.4784314, 1,
-0.2017252, 2.378757, -0.2787786, 0, 1, 0.4823529, 1,
-0.1996595, 0.06026289, 0.2843209, 0, 1, 0.4901961, 1,
-0.1965319, 0.9000928, 0.281256, 0, 1, 0.4941176, 1,
-0.1960603, -0.4625669, -2.324027, 0, 1, 0.5019608, 1,
-0.1960329, -0.5647199, -4.680354, 0, 1, 0.509804, 1,
-0.1956033, 0.7319301, 0.7689334, 0, 1, 0.5137255, 1,
-0.1934932, -0.09515655, -1.519298, 0, 1, 0.5215687, 1,
-0.1928971, -0.9790236, -0.9814433, 0, 1, 0.5254902, 1,
-0.1911862, -0.9961691, -2.949814, 0, 1, 0.5333334, 1,
-0.1870111, -0.3871926, -3.226696, 0, 1, 0.5372549, 1,
-0.1820446, 1.586168, -0.5718005, 0, 1, 0.5450981, 1,
-0.1813502, -0.505737, -1.584216, 0, 1, 0.5490196, 1,
-0.1792442, 0.5156628, -1.590627, 0, 1, 0.5568628, 1,
-0.1786512, 0.8740299, -1.662105, 0, 1, 0.5607843, 1,
-0.1669392, 1.329212, -1.451526, 0, 1, 0.5686275, 1,
-0.16692, 0.1517329, -0.9585751, 0, 1, 0.572549, 1,
-0.1666929, 2.17103, -0.2209388, 0, 1, 0.5803922, 1,
-0.1579489, 0.1222969, -1.324861, 0, 1, 0.5843138, 1,
-0.155791, 1.287555, 0.4812195, 0, 1, 0.5921569, 1,
-0.1523229, -0.5967544, -2.212083, 0, 1, 0.5960785, 1,
-0.1468162, -0.9806827, -2.921455, 0, 1, 0.6039216, 1,
-0.1464407, 0.1438853, -0.2853092, 0, 1, 0.6117647, 1,
-0.1450803, -1.422909, -3.980433, 0, 1, 0.6156863, 1,
-0.1449048, -0.1464064, -2.668981, 0, 1, 0.6235294, 1,
-0.1433191, -0.9915204, -0.9952675, 0, 1, 0.627451, 1,
-0.1409347, 0.3321163, 1.437117, 0, 1, 0.6352941, 1,
-0.1395366, 0.2950813, -0.8939557, 0, 1, 0.6392157, 1,
-0.1382686, 0.4540567, -0.659866, 0, 1, 0.6470588, 1,
-0.1376325, 1.385627, -0.4506653, 0, 1, 0.6509804, 1,
-0.1374223, 0.1271221, -0.621573, 0, 1, 0.6588235, 1,
-0.1364473, -1.131566, -3.070566, 0, 1, 0.6627451, 1,
-0.1346501, -0.2350325, -1.630957, 0, 1, 0.6705883, 1,
-0.1322221, 1.438765, -0.5299078, 0, 1, 0.6745098, 1,
-0.1298845, -0.7904339, -4.036497, 0, 1, 0.682353, 1,
-0.1230607, 1.619232, -0.09268004, 0, 1, 0.6862745, 1,
-0.1229214, -1.421852, -5.071455, 0, 1, 0.6941177, 1,
-0.1167861, -0.6565075, -2.995917, 0, 1, 0.7019608, 1,
-0.1103586, 0.9230217, -0.9135981, 0, 1, 0.7058824, 1,
-0.1102737, 0.2202102, -0.9856604, 0, 1, 0.7137255, 1,
-0.1057158, -0.7295192, -2.284569, 0, 1, 0.7176471, 1,
-0.1044997, 0.2323309, -1.292913, 0, 1, 0.7254902, 1,
-0.1034981, -0.6880289, -2.121395, 0, 1, 0.7294118, 1,
-0.09915712, -1.559851, -2.108482, 0, 1, 0.7372549, 1,
-0.09415323, -0.8865447, -1.615251, 0, 1, 0.7411765, 1,
-0.09400389, 0.2850064, 0.1231867, 0, 1, 0.7490196, 1,
-0.09278154, 0.8135689, 1.0277, 0, 1, 0.7529412, 1,
-0.09244154, -0.93814, -2.759172, 0, 1, 0.7607843, 1,
-0.0913327, 0.7789639, 0.1114234, 0, 1, 0.7647059, 1,
-0.08744057, 0.8501685, 0.2700644, 0, 1, 0.772549, 1,
-0.08648013, -0.4056146, -4.568922, 0, 1, 0.7764706, 1,
-0.08563528, -0.3501797, -1.651831, 0, 1, 0.7843137, 1,
-0.08417014, -0.6396655, -3.218731, 0, 1, 0.7882353, 1,
-0.08317995, 0.5851749, -0.4133568, 0, 1, 0.7960784, 1,
-0.08257521, 1.471044, 0.4378309, 0, 1, 0.8039216, 1,
-0.07315229, 0.3281129, -1.147532, 0, 1, 0.8078431, 1,
-0.07117957, -0.3150143, -1.453807, 0, 1, 0.8156863, 1,
-0.06666211, -0.1442662, -3.789923, 0, 1, 0.8196079, 1,
-0.06505153, -1.412699, -2.575924, 0, 1, 0.827451, 1,
-0.05977546, -0.1354466, -2.547383, 0, 1, 0.8313726, 1,
-0.05871478, 0.1757419, 0.6535263, 0, 1, 0.8392157, 1,
-0.05712132, 0.8124537, 0.3989516, 0, 1, 0.8431373, 1,
-0.05070047, -0.1248589, -1.426146, 0, 1, 0.8509804, 1,
-0.05003669, -0.249632, -3.069831, 0, 1, 0.854902, 1,
-0.04463372, -0.6798551, -3.513374, 0, 1, 0.8627451, 1,
-0.04364314, -0.4349237, -1.513157, 0, 1, 0.8666667, 1,
-0.0433648, 0.3465455, -1.448607, 0, 1, 0.8745098, 1,
-0.04235249, 0.2701608, 1.7477, 0, 1, 0.8784314, 1,
-0.04198555, 1.021703, -0.5138767, 0, 1, 0.8862745, 1,
-0.04048502, -0.717313, -3.987059, 0, 1, 0.8901961, 1,
-0.03443506, -0.162792, -2.355999, 0, 1, 0.8980392, 1,
-0.0313901, -1.315427, -2.706299, 0, 1, 0.9058824, 1,
-0.03118313, 0.5376205, -0.9425685, 0, 1, 0.9098039, 1,
-0.02928525, -0.8015585, -2.545351, 0, 1, 0.9176471, 1,
-0.02449792, 0.3470697, 1.540562, 0, 1, 0.9215686, 1,
-0.01973277, -0.1839162, -4.158909, 0, 1, 0.9294118, 1,
-0.01789215, 2.225983, -0.5571196, 0, 1, 0.9333333, 1,
-0.01680131, 0.2907051, 0.3158848, 0, 1, 0.9411765, 1,
-0.01679342, 0.6283191, -0.4680531, 0, 1, 0.945098, 1,
-0.01607201, 0.7666105, -1.635046, 0, 1, 0.9529412, 1,
-0.008753019, 0.5934702, 0.1063172, 0, 1, 0.9568627, 1,
-0.008307088, 0.8935075, -0.6285848, 0, 1, 0.9647059, 1,
-0.0013314, -0.7575971, -4.040446, 0, 1, 0.9686275, 1,
0.00577053, -0.3173558, 4.102633, 0, 1, 0.9764706, 1,
0.006291762, 0.846598, 1.394588, 0, 1, 0.9803922, 1,
0.007351031, -0.4026435, 3.521056, 0, 1, 0.9882353, 1,
0.0118572, 0.1609007, 0.1511374, 0, 1, 0.9921569, 1,
0.01695635, -0.2135763, 2.388093, 0, 1, 1, 1,
0.01976702, 0.4983922, -0.09385944, 0, 0.9921569, 1, 1,
0.02383587, 0.382661, -0.07547365, 0, 0.9882353, 1, 1,
0.03039884, 1.847919, -1.516306, 0, 0.9803922, 1, 1,
0.03211956, 0.9828637, -1.308206, 0, 0.9764706, 1, 1,
0.03281916, 0.1264619, 3.176097, 0, 0.9686275, 1, 1,
0.03803431, 0.8306241, -1.714337, 0, 0.9647059, 1, 1,
0.03867375, 0.2982104, 0.7835818, 0, 0.9568627, 1, 1,
0.03970838, 0.6382624, 0.1293851, 0, 0.9529412, 1, 1,
0.0450846, -0.5427588, 2.30194, 0, 0.945098, 1, 1,
0.04760133, 1.34102, -0.7722928, 0, 0.9411765, 1, 1,
0.04984132, 1.35653, 0.5710704, 0, 0.9333333, 1, 1,
0.05060772, 2.581489, -1.041796, 0, 0.9294118, 1, 1,
0.05471422, -0.8259284, 2.51472, 0, 0.9215686, 1, 1,
0.0572493, -0.1727683, 1.48624, 0, 0.9176471, 1, 1,
0.0587426, -0.5306567, 3.732282, 0, 0.9098039, 1, 1,
0.06921127, 1.131941, -1.417514, 0, 0.9058824, 1, 1,
0.07057127, 0.5601628, 0.7197925, 0, 0.8980392, 1, 1,
0.07118838, 0.4168535, -1.7178, 0, 0.8901961, 1, 1,
0.07603817, -0.7946721, 2.237504, 0, 0.8862745, 1, 1,
0.08378462, 0.2540512, 1.070341, 0, 0.8784314, 1, 1,
0.08440645, 1.182231, 0.1888782, 0, 0.8745098, 1, 1,
0.08455246, 0.3687032, -0.407994, 0, 0.8666667, 1, 1,
0.08761821, 1.920162, 0.3727869, 0, 0.8627451, 1, 1,
0.09155381, 0.1385959, -2.221989, 0, 0.854902, 1, 1,
0.09439667, 0.2733168, -1.624725, 0, 0.8509804, 1, 1,
0.09727002, -0.1386292, 2.43025, 0, 0.8431373, 1, 1,
0.1024317, -0.6616026, 3.356688, 0, 0.8392157, 1, 1,
0.1066832, -0.07630493, 5.28932, 0, 0.8313726, 1, 1,
0.109441, 0.5110139, -0.9026247, 0, 0.827451, 1, 1,
0.1125864, 0.5683905, -0.1949326, 0, 0.8196079, 1, 1,
0.1137796, 1.27063, 1.547418, 0, 0.8156863, 1, 1,
0.1167486, 0.3046063, -0.75977, 0, 0.8078431, 1, 1,
0.1179956, 0.7473031, 0.6348319, 0, 0.8039216, 1, 1,
0.1215024, -0.9449943, 4.859792, 0, 0.7960784, 1, 1,
0.1216439, 0.687169, 1.485935, 0, 0.7882353, 1, 1,
0.1253591, 1.249632, 2.363621, 0, 0.7843137, 1, 1,
0.1276033, -0.2289152, 2.866513, 0, 0.7764706, 1, 1,
0.1307836, 0.3615171, 1.406113, 0, 0.772549, 1, 1,
0.1322482, -0.3682565, 3.384018, 0, 0.7647059, 1, 1,
0.132847, 0.7218471, 0.1655319, 0, 0.7607843, 1, 1,
0.1355181, 1.508111, -0.3171233, 0, 0.7529412, 1, 1,
0.1364638, 1.502142, 0.7427592, 0, 0.7490196, 1, 1,
0.1464382, -0.09124434, 1.764109, 0, 0.7411765, 1, 1,
0.1487482, -0.3197812, 2.382802, 0, 0.7372549, 1, 1,
0.1581864, 0.2283191, 1.92014, 0, 0.7294118, 1, 1,
0.1586089, -1.223554, 4.126194, 0, 0.7254902, 1, 1,
0.1604609, -1.916219, 2.416888, 0, 0.7176471, 1, 1,
0.1624613, 0.7840063, -0.2498035, 0, 0.7137255, 1, 1,
0.1646811, -2.251605, 2.945466, 0, 0.7058824, 1, 1,
0.1691972, 0.7555358, -0.194063, 0, 0.6980392, 1, 1,
0.174051, -1.996657, 2.896462, 0, 0.6941177, 1, 1,
0.1784599, -0.7457122, 3.384119, 0, 0.6862745, 1, 1,
0.1792145, -0.7173702, 3.778747, 0, 0.682353, 1, 1,
0.1806737, -1.319447, 3.404318, 0, 0.6745098, 1, 1,
0.1807802, 1.118132, 1.347876, 0, 0.6705883, 1, 1,
0.1910398, 1.421533, 0.03817847, 0, 0.6627451, 1, 1,
0.1931285, -0.4001956, 1.866888, 0, 0.6588235, 1, 1,
0.1955346, -1.135738, 1.062379, 0, 0.6509804, 1, 1,
0.1963618, 0.8913634, 1.775151, 0, 0.6470588, 1, 1,
0.1997913, 2.199586, -0.2182097, 0, 0.6392157, 1, 1,
0.2034734, 0.08127484, 2.114319, 0, 0.6352941, 1, 1,
0.2059561, 0.05910392, 1.054025, 0, 0.627451, 1, 1,
0.2067338, -0.2870378, 0.101174, 0, 0.6235294, 1, 1,
0.2100542, 0.005757479, 2.720133, 0, 0.6156863, 1, 1,
0.2106086, 0.7765137, 0.2233184, 0, 0.6117647, 1, 1,
0.2119268, 0.9975116, 0.05661643, 0, 0.6039216, 1, 1,
0.2130107, -0.7211887, 2.757217, 0, 0.5960785, 1, 1,
0.219129, 1.59271, 0.4014969, 0, 0.5921569, 1, 1,
0.2193608, 0.2689151, -0.8862839, 0, 0.5843138, 1, 1,
0.2206616, -0.2734493, 2.112294, 0, 0.5803922, 1, 1,
0.2235616, -2.314705, 4.41354, 0, 0.572549, 1, 1,
0.2236754, -1.582164, 2.924624, 0, 0.5686275, 1, 1,
0.2242602, 0.5379614, -0.8512904, 0, 0.5607843, 1, 1,
0.2267121, -0.5847224, 1.977324, 0, 0.5568628, 1, 1,
0.2287952, 1.031903, -0.8624874, 0, 0.5490196, 1, 1,
0.2307904, -0.5627857, 3.901592, 0, 0.5450981, 1, 1,
0.2308283, 1.679484, -0.2640775, 0, 0.5372549, 1, 1,
0.2310636, -0.4826163, 3.470137, 0, 0.5333334, 1, 1,
0.231075, 0.6673832, 0.2003058, 0, 0.5254902, 1, 1,
0.2315588, -0.4291523, 1.893535, 0, 0.5215687, 1, 1,
0.2318627, 0.1156054, 0.6947008, 0, 0.5137255, 1, 1,
0.2324545, 1.2902, 0.217455, 0, 0.509804, 1, 1,
0.2343555, -0.5527489, 2.111493, 0, 0.5019608, 1, 1,
0.2403591, 0.247578, 0.8634477, 0, 0.4941176, 1, 1,
0.2406473, 0.8046926, 0.5244064, 0, 0.4901961, 1, 1,
0.2410602, 0.5685924, 0.2102623, 0, 0.4823529, 1, 1,
0.2458723, -0.6926608, 2.398015, 0, 0.4784314, 1, 1,
0.2465085, 0.7783216, 2.267057, 0, 0.4705882, 1, 1,
0.2481913, 0.141221, 0.8478032, 0, 0.4666667, 1, 1,
0.2494372, 0.9259043, -0.8941726, 0, 0.4588235, 1, 1,
0.2665566, 1.295675, -0.2923911, 0, 0.454902, 1, 1,
0.2745116, -2.340672, 2.859278, 0, 0.4470588, 1, 1,
0.2756688, 0.2006294, 1.665043, 0, 0.4431373, 1, 1,
0.276942, -0.01061336, 0.9722692, 0, 0.4352941, 1, 1,
0.2779823, 0.2846942, 0.6334634, 0, 0.4313726, 1, 1,
0.2783407, 0.06511711, 0.9686688, 0, 0.4235294, 1, 1,
0.2784798, -0.721052, 2.013569, 0, 0.4196078, 1, 1,
0.2811514, 1.238799, 0.8860036, 0, 0.4117647, 1, 1,
0.2855879, 0.1890738, -0.4496512, 0, 0.4078431, 1, 1,
0.2889937, -0.2854381, 2.075738, 0, 0.4, 1, 1,
0.2970431, 3.013172, -0.9158152, 0, 0.3921569, 1, 1,
0.298472, -0.8203248, 3.098044, 0, 0.3882353, 1, 1,
0.2999649, 1.338406, -0.7580998, 0, 0.3803922, 1, 1,
0.3005776, -0.03054477, 1.397658, 0, 0.3764706, 1, 1,
0.309844, -1.363834, 4.874557, 0, 0.3686275, 1, 1,
0.3124434, 0.2076472, -0.9831395, 0, 0.3647059, 1, 1,
0.3143052, -0.4360252, 4.64604, 0, 0.3568628, 1, 1,
0.3148144, 0.7530835, -1.278328, 0, 0.3529412, 1, 1,
0.3231772, -0.04905868, 1.419049, 0, 0.345098, 1, 1,
0.3258709, -0.9740546, 3.256837, 0, 0.3411765, 1, 1,
0.3261369, 1.046381, -1.960601, 0, 0.3333333, 1, 1,
0.3268001, 0.403392, 0.325581, 0, 0.3294118, 1, 1,
0.3296938, 0.9644453, -0.8070884, 0, 0.3215686, 1, 1,
0.3303235, 0.3248582, 2.042431, 0, 0.3176471, 1, 1,
0.3322983, -0.1081319, 0.2446626, 0, 0.3098039, 1, 1,
0.3339511, -0.01891544, 1.346796, 0, 0.3058824, 1, 1,
0.3372248, 0.03814728, 0.7922968, 0, 0.2980392, 1, 1,
0.3412665, -1.17813, 3.762713, 0, 0.2901961, 1, 1,
0.3435768, -0.8392036, 1.692184, 0, 0.2862745, 1, 1,
0.3447123, -1.389371, 3.630337, 0, 0.2784314, 1, 1,
0.3491803, 2.059419, 1.352497, 0, 0.2745098, 1, 1,
0.3493272, -0.9736305, 2.668094, 0, 0.2666667, 1, 1,
0.3572423, 0.7653934, 1.816689, 0, 0.2627451, 1, 1,
0.3585535, 0.3395679, 2.651738, 0, 0.254902, 1, 1,
0.3591796, 0.189933, -0.3543359, 0, 0.2509804, 1, 1,
0.3605808, -0.724395, 2.964829, 0, 0.2431373, 1, 1,
0.3608581, 0.5009414, 1.62541, 0, 0.2392157, 1, 1,
0.361909, 0.87599, -0.3983986, 0, 0.2313726, 1, 1,
0.3620009, 1.370065, 1.329085, 0, 0.227451, 1, 1,
0.3625491, 0.489216, 0.4336165, 0, 0.2196078, 1, 1,
0.3639267, -1.061153, 2.247636, 0, 0.2156863, 1, 1,
0.364528, 0.3767127, 2.351716, 0, 0.2078431, 1, 1,
0.3673579, 0.6448683, 2.255775, 0, 0.2039216, 1, 1,
0.3683015, 0.4162594, 1.697342, 0, 0.1960784, 1, 1,
0.3694988, -0.6574048, 1.94401, 0, 0.1882353, 1, 1,
0.3698131, 0.06265929, 1.393453, 0, 0.1843137, 1, 1,
0.3700423, 0.8592299, 1.160128, 0, 0.1764706, 1, 1,
0.3784469, 1.538447, 0.2493876, 0, 0.172549, 1, 1,
0.3798259, -0.5443473, 2.843668, 0, 0.1647059, 1, 1,
0.3818423, 1.160889, -0.02846353, 0, 0.1607843, 1, 1,
0.3838438, -0.3949021, 3.355762, 0, 0.1529412, 1, 1,
0.389545, 0.1254401, 0.113207, 0, 0.1490196, 1, 1,
0.3924057, 0.6267737, 0.4788004, 0, 0.1411765, 1, 1,
0.3932967, -0.5517806, 3.079204, 0, 0.1372549, 1, 1,
0.3935131, -0.3588319, 0.1689757, 0, 0.1294118, 1, 1,
0.3957958, 0.9871457, 2.196759, 0, 0.1254902, 1, 1,
0.4009008, 1.791703, 0.8745553, 0, 0.1176471, 1, 1,
0.4083412, -1.114827, 2.949944, 0, 0.1137255, 1, 1,
0.4127897, 0.01197849, 0.9822597, 0, 0.1058824, 1, 1,
0.4176304, -1.121895, 3.714334, 0, 0.09803922, 1, 1,
0.4200221, 0.01191325, 2.551397, 0, 0.09411765, 1, 1,
0.4207261, 0.2759042, 1.050277, 0, 0.08627451, 1, 1,
0.4225013, -0.2891824, 3.581696, 0, 0.08235294, 1, 1,
0.4336549, -0.06870611, 4.452755, 0, 0.07450981, 1, 1,
0.4380567, -0.9824106, 1.721862, 0, 0.07058824, 1, 1,
0.4393071, -0.7545642, 2.766593, 0, 0.0627451, 1, 1,
0.4403716, 1.282465, 0.05248078, 0, 0.05882353, 1, 1,
0.4440278, -0.4171017, 2.729064, 0, 0.05098039, 1, 1,
0.4527091, 0.7958445, 1.147641, 0, 0.04705882, 1, 1,
0.4530921, -1.342028, 3.350634, 0, 0.03921569, 1, 1,
0.4534587, -0.7854677, 3.159224, 0, 0.03529412, 1, 1,
0.4546118, -1.269976, 3.351649, 0, 0.02745098, 1, 1,
0.4590353, -0.7731488, 3.296496, 0, 0.02352941, 1, 1,
0.4618969, -0.3383072, 3.421883, 0, 0.01568628, 1, 1,
0.4682719, -0.4250231, 3.38013, 0, 0.01176471, 1, 1,
0.4690021, -0.43329, 2.102342, 0, 0.003921569, 1, 1,
0.469019, 0.712625, 1.987554, 0.003921569, 0, 1, 1,
0.4731873, 1.985861, 0.4799151, 0.007843138, 0, 1, 1,
0.4859418, 0.004832065, 1.335992, 0.01568628, 0, 1, 1,
0.4908345, 2.00041, 1.130293, 0.01960784, 0, 1, 1,
0.5034171, 0.7240636, -0.4815837, 0.02745098, 0, 1, 1,
0.5047196, 1.825746, -1.272758, 0.03137255, 0, 1, 1,
0.5050123, 1.079509, -1.668193, 0.03921569, 0, 1, 1,
0.5090111, 1.851414, 1.941383, 0.04313726, 0, 1, 1,
0.5098863, 1.111595, -0.5192393, 0.05098039, 0, 1, 1,
0.510145, -0.3439712, 1.787751, 0.05490196, 0, 1, 1,
0.5176178, 0.8979531, -0.0248018, 0.0627451, 0, 1, 1,
0.5227433, 0.7501816, 1.040417, 0.06666667, 0, 1, 1,
0.5276328, 0.6231403, -0.6046936, 0.07450981, 0, 1, 1,
0.5339935, 1.006584, 2.309966, 0.07843138, 0, 1, 1,
0.5340204, -0.1136943, 2.979735, 0.08627451, 0, 1, 1,
0.5418839, 0.5274408, 1.69857, 0.09019608, 0, 1, 1,
0.54428, -0.1324683, 2.474257, 0.09803922, 0, 1, 1,
0.5454756, -0.1149723, 2.580646, 0.1058824, 0, 1, 1,
0.5477852, -1.296575, 2.750117, 0.1098039, 0, 1, 1,
0.5516573, -0.0003803551, 1.130267, 0.1176471, 0, 1, 1,
0.5523647, -0.47844, 3.263766, 0.1215686, 0, 1, 1,
0.5575784, 0.6974571, 1.265981, 0.1294118, 0, 1, 1,
0.5584974, -0.1945892, 0.8960187, 0.1333333, 0, 1, 1,
0.5677271, 1.382159, -1.540329, 0.1411765, 0, 1, 1,
0.5690076, 0.3264451, -0.5192539, 0.145098, 0, 1, 1,
0.5723421, -0.1567696, 1.904942, 0.1529412, 0, 1, 1,
0.5726649, -1.156962, 3.100313, 0.1568628, 0, 1, 1,
0.5735313, 0.186811, 3.252258, 0.1647059, 0, 1, 1,
0.5763733, 0.4173507, 0.5751918, 0.1686275, 0, 1, 1,
0.5792529, 0.4459512, 0.5804805, 0.1764706, 0, 1, 1,
0.5804791, -0.9488513, 2.266592, 0.1803922, 0, 1, 1,
0.5827967, -0.216406, 3.192747, 0.1882353, 0, 1, 1,
0.5862734, -0.528027, 2.744839, 0.1921569, 0, 1, 1,
0.5879809, -1.689026, 1.740651, 0.2, 0, 1, 1,
0.5906171, -0.2814306, 2.453793, 0.2078431, 0, 1, 1,
0.5913981, -0.7052462, 0.2777375, 0.2117647, 0, 1, 1,
0.5930971, 1.128877, -0.5775781, 0.2196078, 0, 1, 1,
0.5937319, -0.2952639, 1.535632, 0.2235294, 0, 1, 1,
0.5982872, 2.042624, 0.2670071, 0.2313726, 0, 1, 1,
0.6103619, 1.23643, 0.4660272, 0.2352941, 0, 1, 1,
0.6126875, -1.393473, 3.782914, 0.2431373, 0, 1, 1,
0.6166774, -0.6567333, 1.826406, 0.2470588, 0, 1, 1,
0.6167303, 1.501719, -1.094539, 0.254902, 0, 1, 1,
0.6198682, -0.1569534, 0.4961292, 0.2588235, 0, 1, 1,
0.6236123, -0.3930496, 1.52972, 0.2666667, 0, 1, 1,
0.6264425, 0.9506631, 1.130588, 0.2705882, 0, 1, 1,
0.6289065, -0.3228914, 2.397393, 0.2784314, 0, 1, 1,
0.6294956, -0.1740327, 0.563063, 0.282353, 0, 1, 1,
0.6303384, 0.2236966, 0.05286316, 0.2901961, 0, 1, 1,
0.6304321, -0.633741, 2.775768, 0.2941177, 0, 1, 1,
0.6321323, 0.1374981, -0.1271086, 0.3019608, 0, 1, 1,
0.6367288, -0.5296152, 2.627064, 0.3098039, 0, 1, 1,
0.6375565, -0.5858965, 1.330484, 0.3137255, 0, 1, 1,
0.6421221, -0.1860041, 2.523233, 0.3215686, 0, 1, 1,
0.6433349, -1.164035, 2.229817, 0.3254902, 0, 1, 1,
0.652621, -0.8366702, 1.429775, 0.3333333, 0, 1, 1,
0.6565433, 1.131915, -0.4417562, 0.3372549, 0, 1, 1,
0.6614717, -0.4687866, 0.251892, 0.345098, 0, 1, 1,
0.6641938, 1.074745, -0.5104652, 0.3490196, 0, 1, 1,
0.6667714, -0.366871, 3.265508, 0.3568628, 0, 1, 1,
0.6667715, 0.4210328, 0.04871532, 0.3607843, 0, 1, 1,
0.6677144, -1.415759, 2.990419, 0.3686275, 0, 1, 1,
0.6681869, 0.9390442, 1.400338, 0.372549, 0, 1, 1,
0.6684784, 1.365961, 0.6182544, 0.3803922, 0, 1, 1,
0.6737336, 0.6107695, 2.362192, 0.3843137, 0, 1, 1,
0.6748067, -0.1263475, 1.561014, 0.3921569, 0, 1, 1,
0.6800959, 0.009377339, 1.977901, 0.3960784, 0, 1, 1,
0.6804799, -1.347131, 3.312964, 0.4039216, 0, 1, 1,
0.6816041, 0.6487073, 0.6523032, 0.4117647, 0, 1, 1,
0.6830234, -0.7985563, 2.793306, 0.4156863, 0, 1, 1,
0.6856122, 1.486803, 1.282891, 0.4235294, 0, 1, 1,
0.6874949, 0.4470781, 1.877854, 0.427451, 0, 1, 1,
0.6905512, 1.573663, 1.354953, 0.4352941, 0, 1, 1,
0.6935419, -0.6364813, 1.390057, 0.4392157, 0, 1, 1,
0.6953937, -1.452166, 1.808596, 0.4470588, 0, 1, 1,
0.6970246, 1.33218, -0.1771658, 0.4509804, 0, 1, 1,
0.7003802, -1.147669, 2.901287, 0.4588235, 0, 1, 1,
0.7031569, 0.6640288, 0.4301381, 0.4627451, 0, 1, 1,
0.7067401, 0.5995472, 0.9119389, 0.4705882, 0, 1, 1,
0.7071163, -1.030233, 4.953073, 0.4745098, 0, 1, 1,
0.708004, 0.6722423, 0.2992013, 0.4823529, 0, 1, 1,
0.7103021, 0.3128859, 0.3096158, 0.4862745, 0, 1, 1,
0.7105771, 1.019478, 0.2769406, 0.4941176, 0, 1, 1,
0.7107506, 0.6582831, 1.086627, 0.5019608, 0, 1, 1,
0.71429, -0.1009192, 1.897908, 0.5058824, 0, 1, 1,
0.7173545, -1.906684, 2.20699, 0.5137255, 0, 1, 1,
0.7207487, 0.8559435, 1.761074, 0.5176471, 0, 1, 1,
0.7324858, 1.229249, 1.150807, 0.5254902, 0, 1, 1,
0.7450713, -0.4638313, 2.697792, 0.5294118, 0, 1, 1,
0.7458414, -0.4183142, 2.237727, 0.5372549, 0, 1, 1,
0.7475565, -1.894824, 1.268844, 0.5411765, 0, 1, 1,
0.7499231, -1.922411, 3.445181, 0.5490196, 0, 1, 1,
0.7550717, -0.4756933, 0.6174574, 0.5529412, 0, 1, 1,
0.7595448, 0.05051459, 1.923151, 0.5607843, 0, 1, 1,
0.7603508, -1.022104, 3.073776, 0.5647059, 0, 1, 1,
0.7606066, 0.1426437, -0.09132206, 0.572549, 0, 1, 1,
0.7647148, -1.623392, 1.864347, 0.5764706, 0, 1, 1,
0.7672157, -1.166037, 2.435089, 0.5843138, 0, 1, 1,
0.7714708, 0.240548, 1.478924, 0.5882353, 0, 1, 1,
0.7756659, -1.916441, 2.241902, 0.5960785, 0, 1, 1,
0.7758362, -0.4081042, 2.656147, 0.6039216, 0, 1, 1,
0.7759589, -0.5556973, 1.188453, 0.6078432, 0, 1, 1,
0.776191, -0.5598187, 1.777803, 0.6156863, 0, 1, 1,
0.7791774, -1.952485, 3.575027, 0.6196079, 0, 1, 1,
0.7822903, -0.5085034, 3.514935, 0.627451, 0, 1, 1,
0.7829608, 2.117876, 1.937372, 0.6313726, 0, 1, 1,
0.7830268, -0.7725645, 2.470142, 0.6392157, 0, 1, 1,
0.7854362, -1.036639, 4.069257, 0.6431373, 0, 1, 1,
0.802117, 0.2584827, 2.210845, 0.6509804, 0, 1, 1,
0.8047093, -0.8024701, 3.072742, 0.654902, 0, 1, 1,
0.8048418, -0.04431832, 0.2917254, 0.6627451, 0, 1, 1,
0.8070365, 0.9590158, 1.992669, 0.6666667, 0, 1, 1,
0.8079656, -2.382792, 2.723719, 0.6745098, 0, 1, 1,
0.8091667, 0.527207, 0.697255, 0.6784314, 0, 1, 1,
0.8103508, -1.105805, 2.597274, 0.6862745, 0, 1, 1,
0.8157366, -0.589515, 3.625864, 0.6901961, 0, 1, 1,
0.8178822, 0.3255251, 0.5104591, 0.6980392, 0, 1, 1,
0.8185763, -1.244964, 3.156285, 0.7058824, 0, 1, 1,
0.8200941, 0.343102, 0.3410884, 0.7098039, 0, 1, 1,
0.8202872, 0.3145774, 3.015476, 0.7176471, 0, 1, 1,
0.8206462, -0.8239546, 3.616964, 0.7215686, 0, 1, 1,
0.8224544, -1.041878, 3.354436, 0.7294118, 0, 1, 1,
0.8261131, 1.582235, -0.4433397, 0.7333333, 0, 1, 1,
0.8273845, 1.349346, -0.6589484, 0.7411765, 0, 1, 1,
0.8289734, 0.1879589, 3.491227, 0.7450981, 0, 1, 1,
0.8388527, 0.7703354, 0.6063725, 0.7529412, 0, 1, 1,
0.8400918, -0.1176421, 2.535868, 0.7568628, 0, 1, 1,
0.8452557, -0.269831, 2.517098, 0.7647059, 0, 1, 1,
0.8556703, -0.4542182, 2.236252, 0.7686275, 0, 1, 1,
0.8561773, -1.014423, 2.337225, 0.7764706, 0, 1, 1,
0.8615953, -2.061273, 3.055107, 0.7803922, 0, 1, 1,
0.8633347, -0.5218781, 1.339149, 0.7882353, 0, 1, 1,
0.8667997, 0.3682015, 0.9871109, 0.7921569, 0, 1, 1,
0.8813956, 0.2909314, 0.9864129, 0.8, 0, 1, 1,
0.8872557, 1.405932, 1.406878, 0.8078431, 0, 1, 1,
0.8949035, 0.5362138, -0.9422759, 0.8117647, 0, 1, 1,
0.8978823, 0.08797015, 0.1276629, 0.8196079, 0, 1, 1,
0.9006727, 1.379922, 0.2056639, 0.8235294, 0, 1, 1,
0.910546, -0.4547194, 2.945117, 0.8313726, 0, 1, 1,
0.9121215, -0.01843031, -0.4171465, 0.8352941, 0, 1, 1,
0.913299, 0.09039713, -0.4248137, 0.8431373, 0, 1, 1,
0.9163687, 0.07906846, -1.702624, 0.8470588, 0, 1, 1,
0.9220344, 0.9980977, 0.6244215, 0.854902, 0, 1, 1,
0.9247279, -0.2233758, 1.804539, 0.8588235, 0, 1, 1,
0.9293703, -0.9576115, 3.335204, 0.8666667, 0, 1, 1,
0.9324117, -1.625409, 2.10064, 0.8705882, 0, 1, 1,
0.9374363, 1.167097, 1.714038, 0.8784314, 0, 1, 1,
0.9396524, 0.08255146, 1.301628, 0.8823529, 0, 1, 1,
0.9440694, 0.1406161, 2.784433, 0.8901961, 0, 1, 1,
0.9445944, 0.7947184, 2.1134, 0.8941177, 0, 1, 1,
0.946459, -1.765584, 0.3560317, 0.9019608, 0, 1, 1,
0.9562522, 1.127598, 0.4288198, 0.9098039, 0, 1, 1,
0.9576867, -2.609475, 2.45083, 0.9137255, 0, 1, 1,
0.9614666, 0.3104891, 1.95666, 0.9215686, 0, 1, 1,
0.9650851, 0.1612042, 2.15071, 0.9254902, 0, 1, 1,
0.969165, 0.3653427, 2.001477, 0.9333333, 0, 1, 1,
0.9783089, -1.785973, 3.554679, 0.9372549, 0, 1, 1,
0.9835086, 1.350073, -0.4712034, 0.945098, 0, 1, 1,
0.9844822, 0.5327737, 1.666312, 0.9490196, 0, 1, 1,
0.9846594, -0.7993335, 3.549283, 0.9568627, 0, 1, 1,
0.9861393, -1.289375, 4.062816, 0.9607843, 0, 1, 1,
0.9865701, 0.2372319, 2.594958, 0.9686275, 0, 1, 1,
0.9904142, -0.06383615, 1.82187, 0.972549, 0, 1, 1,
0.9971923, 0.8698919, 1.734465, 0.9803922, 0, 1, 1,
0.9993142, -0.09299165, 2.163522, 0.9843137, 0, 1, 1,
0.9995993, 0.2048145, 0.09796114, 0.9921569, 0, 1, 1,
1.002358, -0.7575033, 3.567837, 0.9960784, 0, 1, 1,
1.003099, 0.4873109, 0.4750329, 1, 0, 0.9960784, 1,
1.004906, 1.284505, -0.7114899, 1, 0, 0.9882353, 1,
1.010383, 0.5901632, 3.73605, 1, 0, 0.9843137, 1,
1.013322, 0.751994, 1.336998, 1, 0, 0.9764706, 1,
1.024167, 0.7033353, 1.836715, 1, 0, 0.972549, 1,
1.026428, 0.8504356, 0.5151452, 1, 0, 0.9647059, 1,
1.042595, 0.0004144187, 1.69205, 1, 0, 0.9607843, 1,
1.043531, 0.1680018, 0.7011209, 1, 0, 0.9529412, 1,
1.047, 1.629439, -0.5598595, 1, 0, 0.9490196, 1,
1.04845, 0.5750167, 0.7157254, 1, 0, 0.9411765, 1,
1.054179, -0.1302152, 2.247979, 1, 0, 0.9372549, 1,
1.058445, 0.5558658, 1.526212, 1, 0, 0.9294118, 1,
1.0674, 1.86409, -0.2186936, 1, 0, 0.9254902, 1,
1.075184, -0.5056005, -0.603022, 1, 0, 0.9176471, 1,
1.08442, 1.236719, 1.307083, 1, 0, 0.9137255, 1,
1.085286, -1.299372, 2.691094, 1, 0, 0.9058824, 1,
1.089994, -1.71463, 1.195669, 1, 0, 0.9019608, 1,
1.091702, -0.6629646, 3.442338, 1, 0, 0.8941177, 1,
1.092064, 0.4075111, 0.9182868, 1, 0, 0.8862745, 1,
1.094662, -1.212612, 2.47905, 1, 0, 0.8823529, 1,
1.109986, 2.005426, -0.6435918, 1, 0, 0.8745098, 1,
1.113224, 2.512399, 2.717112, 1, 0, 0.8705882, 1,
1.11333, -1.198921, 2.64465, 1, 0, 0.8627451, 1,
1.116178, -0.2521775, 0.3851394, 1, 0, 0.8588235, 1,
1.130378, -0.1539411, 0.230769, 1, 0, 0.8509804, 1,
1.134559, -0.2894245, 1.683537, 1, 0, 0.8470588, 1,
1.138227, -1.939727, 0.8880104, 1, 0, 0.8392157, 1,
1.143878, -1.206188, 3.53491, 1, 0, 0.8352941, 1,
1.145492, -0.4800475, 1.337622, 1, 0, 0.827451, 1,
1.14747, 0.8221971, 0.1748793, 1, 0, 0.8235294, 1,
1.149245, 0.9167071, 1.323204, 1, 0, 0.8156863, 1,
1.151217, -0.7827417, 2.162778, 1, 0, 0.8117647, 1,
1.153235, -0.2683634, 0.9394724, 1, 0, 0.8039216, 1,
1.15679, 0.1458825, 2.40319, 1, 0, 0.7960784, 1,
1.161816, -0.23102, 0.07801148, 1, 0, 0.7921569, 1,
1.161842, -1.323052, 2.870903, 1, 0, 0.7843137, 1,
1.164486, 1.186218, 0.0619282, 1, 0, 0.7803922, 1,
1.167853, 0.1940113, -0.3286813, 1, 0, 0.772549, 1,
1.167941, -0.2644767, 2.375048, 1, 0, 0.7686275, 1,
1.169481, -0.6912916, 3.166029, 1, 0, 0.7607843, 1,
1.170439, 0.1332166, 1.807124, 1, 0, 0.7568628, 1,
1.170664, -0.4608034, 3.259809, 1, 0, 0.7490196, 1,
1.176274, 0.7539007, 0.5413233, 1, 0, 0.7450981, 1,
1.177211, -0.7308058, 0.3380386, 1, 0, 0.7372549, 1,
1.187803, 0.383074, 0.2635471, 1, 0, 0.7333333, 1,
1.201475, 1.784509, -0.5174822, 1, 0, 0.7254902, 1,
1.209611, 0.542614, 2.119809, 1, 0, 0.7215686, 1,
1.211797, -0.7080819, 0.8945687, 1, 0, 0.7137255, 1,
1.212997, 0.3372055, 0.4391446, 1, 0, 0.7098039, 1,
1.21787, -1.011458, 1.00654, 1, 0, 0.7019608, 1,
1.218951, 0.7650467, 1.133301, 1, 0, 0.6941177, 1,
1.238548, -1.466461, 1.567656, 1, 0, 0.6901961, 1,
1.239735, 0.1587504, 2.743491, 1, 0, 0.682353, 1,
1.246072, 0.1219066, 0.8282998, 1, 0, 0.6784314, 1,
1.254434, 0.9707378, 0.6176698, 1, 0, 0.6705883, 1,
1.262853, 0.7481285, 0.5248085, 1, 0, 0.6666667, 1,
1.281619, 0.5083752, 2.052653, 1, 0, 0.6588235, 1,
1.283895, -0.2876131, 2.386023, 1, 0, 0.654902, 1,
1.289727, 1.616965, -0.9094486, 1, 0, 0.6470588, 1,
1.297075, 1.006349, 0.6057825, 1, 0, 0.6431373, 1,
1.299418, 0.7324848, -0.8136518, 1, 0, 0.6352941, 1,
1.300109, -0.2152149, 2.31559, 1, 0, 0.6313726, 1,
1.320777, 0.3422331, 2.155711, 1, 0, 0.6235294, 1,
1.320798, -0.7357861, 1.263672, 1, 0, 0.6196079, 1,
1.332781, 2.222607, 0.2736463, 1, 0, 0.6117647, 1,
1.33835, 1.645204, 0.1308919, 1, 0, 0.6078432, 1,
1.338774, -0.657637, 1.299236, 1, 0, 0.6, 1,
1.340957, -0.6101937, 1.028752, 1, 0, 0.5921569, 1,
1.347775, -0.2310338, 0.5822099, 1, 0, 0.5882353, 1,
1.358187, 1.02236, 0.2941763, 1, 0, 0.5803922, 1,
1.37657, -0.6491245, -0.0263156, 1, 0, 0.5764706, 1,
1.402411, 0.6078429, 2.399863, 1, 0, 0.5686275, 1,
1.405352, -0.2175087, 1.157399, 1, 0, 0.5647059, 1,
1.408083, 0.9472317, 1.460185, 1, 0, 0.5568628, 1,
1.418846, 1.10304, 1.615516, 1, 0, 0.5529412, 1,
1.422633, 0.05483918, 1.380861, 1, 0, 0.5450981, 1,
1.42436, 0.07973288, 0.5306065, 1, 0, 0.5411765, 1,
1.432328, 1.223843, 1.666702, 1, 0, 0.5333334, 1,
1.435591, -0.9487779, 1.699756, 1, 0, 0.5294118, 1,
1.442328, -1.118249, 1.127155, 1, 0, 0.5215687, 1,
1.447742, -1.170382, 4.032398, 1, 0, 0.5176471, 1,
1.449213, -0.8647816, 2.491916, 1, 0, 0.509804, 1,
1.458947, -1.536074, 2.911589, 1, 0, 0.5058824, 1,
1.469764, -1.330564, 3.6004, 1, 0, 0.4980392, 1,
1.476219, 0.4465476, 2.022722, 1, 0, 0.4901961, 1,
1.478873, 0.575724, -0.2377405, 1, 0, 0.4862745, 1,
1.523075, -2.422633, 3.160699, 1, 0, 0.4784314, 1,
1.524451, 0.4475072, 1.682834, 1, 0, 0.4745098, 1,
1.524602, 1.41791, 0.1860274, 1, 0, 0.4666667, 1,
1.524719, 0.3675742, -0.6273522, 1, 0, 0.4627451, 1,
1.541909, 1.170122, 2.566379, 1, 0, 0.454902, 1,
1.542077, -0.05051266, 3.255861, 1, 0, 0.4509804, 1,
1.548423, -1.176821, 2.351213, 1, 0, 0.4431373, 1,
1.555292, -0.8205693, 3.111135, 1, 0, 0.4392157, 1,
1.580265, -0.2420189, 1.264677, 1, 0, 0.4313726, 1,
1.582773, -0.9238982, 0.9241608, 1, 0, 0.427451, 1,
1.58983, 0.8538502, 3.464273, 1, 0, 0.4196078, 1,
1.59739, -0.02163244, 1.73412, 1, 0, 0.4156863, 1,
1.60221, -0.0505368, 0.7499989, 1, 0, 0.4078431, 1,
1.603928, -2.20045, 3.321518, 1, 0, 0.4039216, 1,
1.605165, 0.2068139, 0.6949329, 1, 0, 0.3960784, 1,
1.607489, 0.8080019, 1.426398, 1, 0, 0.3882353, 1,
1.614143, 2.6467, 0.930335, 1, 0, 0.3843137, 1,
1.627852, -0.3769555, 2.718804, 1, 0, 0.3764706, 1,
1.639307, 0.734314, 2.660521, 1, 0, 0.372549, 1,
1.662486, -0.8528015, 1.872417, 1, 0, 0.3647059, 1,
1.675597, 0.613861, 2.149396, 1, 0, 0.3607843, 1,
1.684012, 0.6172128, 0.6479575, 1, 0, 0.3529412, 1,
1.703121, 0.7829712, 1.415255, 1, 0, 0.3490196, 1,
1.706825, 1.458183, 0.01939123, 1, 0, 0.3411765, 1,
1.709288, 1.411519, -1.011966, 1, 0, 0.3372549, 1,
1.718769, 1.084761, 1.174482, 1, 0, 0.3294118, 1,
1.739228, -0.2321891, 3.177247, 1, 0, 0.3254902, 1,
1.766584, 0.479312, 1.253811, 1, 0, 0.3176471, 1,
1.77229, -0.5016831, 2.511422, 1, 0, 0.3137255, 1,
1.778184, -1.606696, 1.467957, 1, 0, 0.3058824, 1,
1.786477, -0.6126367, 1.707416, 1, 0, 0.2980392, 1,
1.813024, 0.9063197, -0.8599715, 1, 0, 0.2941177, 1,
1.814264, 1.080403, 1.718737, 1, 0, 0.2862745, 1,
1.832728, -0.4657038, 2.347486, 1, 0, 0.282353, 1,
1.837837, -0.9811746, 3.801507, 1, 0, 0.2745098, 1,
1.840738, -0.9289161, 1.186008, 1, 0, 0.2705882, 1,
1.84086, 1.397713, 2.382902, 1, 0, 0.2627451, 1,
1.846414, -0.5241049, 2.25383, 1, 0, 0.2588235, 1,
1.85636, 0.6657349, 2.935241, 1, 0, 0.2509804, 1,
1.863262, -1.161013, 1.718274, 1, 0, 0.2470588, 1,
1.871854, -0.7677765, 3.022645, 1, 0, 0.2392157, 1,
1.878173, 0.4468488, -0.3996671, 1, 0, 0.2352941, 1,
1.895308, 0.572766, 1.179443, 1, 0, 0.227451, 1,
1.936521, 0.2873783, 2.571034, 1, 0, 0.2235294, 1,
1.98484, -1.008336, 2.581378, 1, 0, 0.2156863, 1,
1.99036, 0.006933217, 0.04713465, 1, 0, 0.2117647, 1,
1.999837, 1.253476, 0.8688546, 1, 0, 0.2039216, 1,
2.002894, -0.1696251, 0.5251867, 1, 0, 0.1960784, 1,
2.010132, 0.6422184, 0.4758385, 1, 0, 0.1921569, 1,
2.012837, -1.045838, 2.356566, 1, 0, 0.1843137, 1,
2.035639, 1.933547, 0.7908578, 1, 0, 0.1803922, 1,
2.045461, 0.774469, -0.5083202, 1, 0, 0.172549, 1,
2.064603, 1.931385, 1.595612, 1, 0, 0.1686275, 1,
2.068387, -0.3608316, 2.206054, 1, 0, 0.1607843, 1,
2.073718, 1.114917, -1.464953, 1, 0, 0.1568628, 1,
2.109816, -0.1302875, 1.094116, 1, 0, 0.1490196, 1,
2.115318, -1.009409, 0.7012948, 1, 0, 0.145098, 1,
2.140375, -0.4998078, 1.950138, 1, 0, 0.1372549, 1,
2.148111, 1.34133, 2.069259, 1, 0, 0.1333333, 1,
2.151648, 0.2359105, 1.243061, 1, 0, 0.1254902, 1,
2.152814, 1.001284, 0.9861766, 1, 0, 0.1215686, 1,
2.154763, 2.504522, 0.1172743, 1, 0, 0.1137255, 1,
2.180595, -0.5895836, 1.603575, 1, 0, 0.1098039, 1,
2.207268, 1.155601, 1.309728, 1, 0, 0.1019608, 1,
2.249567, 0.7331815, 0.4450318, 1, 0, 0.09411765, 1,
2.275549, 2.536205, 1.431209, 1, 0, 0.09019608, 1,
2.282036, -1.080202, 2.177953, 1, 0, 0.08235294, 1,
2.3289, 2.038096, 1.639625, 1, 0, 0.07843138, 1,
2.342887, 0.5035979, 3.02028, 1, 0, 0.07058824, 1,
2.345516, 1.255589, -0.2650343, 1, 0, 0.06666667, 1,
2.369448, 0.2109902, 2.003033, 1, 0, 0.05882353, 1,
2.39081, -0.9598528, 2.320885, 1, 0, 0.05490196, 1,
2.400278, 1.502832, 1.3606, 1, 0, 0.04705882, 1,
2.400906, 0.5194811, 1.923225, 1, 0, 0.04313726, 1,
2.466931, -1.050535, 3.116534, 1, 0, 0.03529412, 1,
2.498098, -0.02497596, 1.496818, 1, 0, 0.03137255, 1,
2.60171, -1.444492, 0.5841035, 1, 0, 0.02352941, 1,
3.095364, 0.07346088, 2.152881, 1, 0, 0.01960784, 1,
3.288385, 0.8872782, 3.183567, 1, 0, 0.01176471, 1,
3.383497, 1.719177, 1.770153, 1, 0, 0.007843138, 1
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
-0.1014698, -3.569774, -7.271965, 0, -0.5, 0.5, 0.5,
-0.1014698, -3.569774, -7.271965, 1, -0.5, 0.5, 0.5,
-0.1014698, -3.569774, -7.271965, 1, 1.5, 0.5, 0.5,
-0.1014698, -3.569774, -7.271965, 0, 1.5, 0.5, 0.5
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
-4.76784, 0.2232635, -7.271965, 0, -0.5, 0.5, 0.5,
-4.76784, 0.2232635, -7.271965, 1, -0.5, 0.5, 0.5,
-4.76784, 0.2232635, -7.271965, 1, 1.5, 0.5, 0.5,
-4.76784, 0.2232635, -7.271965, 0, 1.5, 0.5, 0.5
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
-4.76784, -3.569774, -0.08104563, 0, -0.5, 0.5, 0.5,
-4.76784, -3.569774, -0.08104563, 1, -0.5, 0.5, 0.5,
-4.76784, -3.569774, -0.08104563, 1, 1.5, 0.5, 0.5,
-4.76784, -3.569774, -0.08104563, 0, 1.5, 0.5, 0.5
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
-3, -2.694458, -5.612522,
3, -2.694458, -5.612522,
-3, -2.694458, -5.612522,
-3, -2.840343, -5.889096,
-2, -2.694458, -5.612522,
-2, -2.840343, -5.889096,
-1, -2.694458, -5.612522,
-1, -2.840343, -5.889096,
0, -2.694458, -5.612522,
0, -2.840343, -5.889096,
1, -2.694458, -5.612522,
1, -2.840343, -5.889096,
2, -2.694458, -5.612522,
2, -2.840343, -5.889096,
3, -2.694458, -5.612522,
3, -2.840343, -5.889096
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
-3, -3.132116, -6.442244, 0, -0.5, 0.5, 0.5,
-3, -3.132116, -6.442244, 1, -0.5, 0.5, 0.5,
-3, -3.132116, -6.442244, 1, 1.5, 0.5, 0.5,
-3, -3.132116, -6.442244, 0, 1.5, 0.5, 0.5,
-2, -3.132116, -6.442244, 0, -0.5, 0.5, 0.5,
-2, -3.132116, -6.442244, 1, -0.5, 0.5, 0.5,
-2, -3.132116, -6.442244, 1, 1.5, 0.5, 0.5,
-2, -3.132116, -6.442244, 0, 1.5, 0.5, 0.5,
-1, -3.132116, -6.442244, 0, -0.5, 0.5, 0.5,
-1, -3.132116, -6.442244, 1, -0.5, 0.5, 0.5,
-1, -3.132116, -6.442244, 1, 1.5, 0.5, 0.5,
-1, -3.132116, -6.442244, 0, 1.5, 0.5, 0.5,
0, -3.132116, -6.442244, 0, -0.5, 0.5, 0.5,
0, -3.132116, -6.442244, 1, -0.5, 0.5, 0.5,
0, -3.132116, -6.442244, 1, 1.5, 0.5, 0.5,
0, -3.132116, -6.442244, 0, 1.5, 0.5, 0.5,
1, -3.132116, -6.442244, 0, -0.5, 0.5, 0.5,
1, -3.132116, -6.442244, 1, -0.5, 0.5, 0.5,
1, -3.132116, -6.442244, 1, 1.5, 0.5, 0.5,
1, -3.132116, -6.442244, 0, 1.5, 0.5, 0.5,
2, -3.132116, -6.442244, 0, -0.5, 0.5, 0.5,
2, -3.132116, -6.442244, 1, -0.5, 0.5, 0.5,
2, -3.132116, -6.442244, 1, 1.5, 0.5, 0.5,
2, -3.132116, -6.442244, 0, 1.5, 0.5, 0.5,
3, -3.132116, -6.442244, 0, -0.5, 0.5, 0.5,
3, -3.132116, -6.442244, 1, -0.5, 0.5, 0.5,
3, -3.132116, -6.442244, 1, 1.5, 0.5, 0.5,
3, -3.132116, -6.442244, 0, 1.5, 0.5, 0.5
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
-3.690985, -2, -5.612522,
-3.690985, 3, -5.612522,
-3.690985, -2, -5.612522,
-3.870461, -2, -5.889096,
-3.690985, -1, -5.612522,
-3.870461, -1, -5.889096,
-3.690985, 0, -5.612522,
-3.870461, 0, -5.889096,
-3.690985, 1, -5.612522,
-3.870461, 1, -5.889096,
-3.690985, 2, -5.612522,
-3.870461, 2, -5.889096,
-3.690985, 3, -5.612522,
-3.870461, 3, -5.889096
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
-4.229413, -2, -6.442244, 0, -0.5, 0.5, 0.5,
-4.229413, -2, -6.442244, 1, -0.5, 0.5, 0.5,
-4.229413, -2, -6.442244, 1, 1.5, 0.5, 0.5,
-4.229413, -2, -6.442244, 0, 1.5, 0.5, 0.5,
-4.229413, -1, -6.442244, 0, -0.5, 0.5, 0.5,
-4.229413, -1, -6.442244, 1, -0.5, 0.5, 0.5,
-4.229413, -1, -6.442244, 1, 1.5, 0.5, 0.5,
-4.229413, -1, -6.442244, 0, 1.5, 0.5, 0.5,
-4.229413, 0, -6.442244, 0, -0.5, 0.5, 0.5,
-4.229413, 0, -6.442244, 1, -0.5, 0.5, 0.5,
-4.229413, 0, -6.442244, 1, 1.5, 0.5, 0.5,
-4.229413, 0, -6.442244, 0, 1.5, 0.5, 0.5,
-4.229413, 1, -6.442244, 0, -0.5, 0.5, 0.5,
-4.229413, 1, -6.442244, 1, -0.5, 0.5, 0.5,
-4.229413, 1, -6.442244, 1, 1.5, 0.5, 0.5,
-4.229413, 1, -6.442244, 0, 1.5, 0.5, 0.5,
-4.229413, 2, -6.442244, 0, -0.5, 0.5, 0.5,
-4.229413, 2, -6.442244, 1, -0.5, 0.5, 0.5,
-4.229413, 2, -6.442244, 1, 1.5, 0.5, 0.5,
-4.229413, 2, -6.442244, 0, 1.5, 0.5, 0.5,
-4.229413, 3, -6.442244, 0, -0.5, 0.5, 0.5,
-4.229413, 3, -6.442244, 1, -0.5, 0.5, 0.5,
-4.229413, 3, -6.442244, 1, 1.5, 0.5, 0.5,
-4.229413, 3, -6.442244, 0, 1.5, 0.5, 0.5
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
-3.690985, -2.694458, -4,
-3.690985, -2.694458, 4,
-3.690985, -2.694458, -4,
-3.870461, -2.840343, -4,
-3.690985, -2.694458, -2,
-3.870461, -2.840343, -2,
-3.690985, -2.694458, 0,
-3.870461, -2.840343, 0,
-3.690985, -2.694458, 2,
-3.870461, -2.840343, 2,
-3.690985, -2.694458, 4,
-3.870461, -2.840343, 4
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
-4.229413, -3.132116, -4, 0, -0.5, 0.5, 0.5,
-4.229413, -3.132116, -4, 1, -0.5, 0.5, 0.5,
-4.229413, -3.132116, -4, 1, 1.5, 0.5, 0.5,
-4.229413, -3.132116, -4, 0, 1.5, 0.5, 0.5,
-4.229413, -3.132116, -2, 0, -0.5, 0.5, 0.5,
-4.229413, -3.132116, -2, 1, -0.5, 0.5, 0.5,
-4.229413, -3.132116, -2, 1, 1.5, 0.5, 0.5,
-4.229413, -3.132116, -2, 0, 1.5, 0.5, 0.5,
-4.229413, -3.132116, 0, 0, -0.5, 0.5, 0.5,
-4.229413, -3.132116, 0, 1, -0.5, 0.5, 0.5,
-4.229413, -3.132116, 0, 1, 1.5, 0.5, 0.5,
-4.229413, -3.132116, 0, 0, 1.5, 0.5, 0.5,
-4.229413, -3.132116, 2, 0, -0.5, 0.5, 0.5,
-4.229413, -3.132116, 2, 1, -0.5, 0.5, 0.5,
-4.229413, -3.132116, 2, 1, 1.5, 0.5, 0.5,
-4.229413, -3.132116, 2, 0, 1.5, 0.5, 0.5,
-4.229413, -3.132116, 4, 0, -0.5, 0.5, 0.5,
-4.229413, -3.132116, 4, 1, -0.5, 0.5, 0.5,
-4.229413, -3.132116, 4, 1, 1.5, 0.5, 0.5,
-4.229413, -3.132116, 4, 0, 1.5, 0.5, 0.5
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
-3.690985, -2.694458, -5.612522,
-3.690985, 3.140985, -5.612522,
-3.690985, -2.694458, 5.450431,
-3.690985, 3.140985, 5.450431,
-3.690985, -2.694458, -5.612522,
-3.690985, -2.694458, 5.450431,
-3.690985, 3.140985, -5.612522,
-3.690985, 3.140985, 5.450431,
-3.690985, -2.694458, -5.612522,
3.488046, -2.694458, -5.612522,
-3.690985, -2.694458, 5.450431,
3.488046, -2.694458, 5.450431,
-3.690985, 3.140985, -5.612522,
3.488046, 3.140985, -5.612522,
-3.690985, 3.140985, 5.450431,
3.488046, 3.140985, 5.450431,
3.488046, -2.694458, -5.612522,
3.488046, 3.140985, -5.612522,
3.488046, -2.694458, 5.450431,
3.488046, 3.140985, 5.450431,
3.488046, -2.694458, -5.612522,
3.488046, -2.694458, 5.450431,
3.488046, 3.140985, -5.612522,
3.488046, 3.140985, 5.450431
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
var radius = 7.700804;
var distance = 34.26175;
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
mvMatrix.translate( 0.1014698, -0.2232635, 0.08104563 );
mvMatrix.scale( 1.159803, 1.426843, 0.7526254 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.26175);
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
rimsulfuron<-read.table("rimsulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-rimsulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'rimsulfuron' not found
```

```r
y<-rimsulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'rimsulfuron' not found
```

```r
z<-rimsulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'rimsulfuron' not found
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
-3.586436, 0.3903708, -1.248626, 0, 0, 1, 1, 1,
-3.078082, -0.04973768, -0.6936628, 1, 0, 0, 1, 1,
-2.874735, 0.9290482, -2.465731, 1, 0, 0, 1, 1,
-2.526822, -0.1404217, -3.191315, 1, 0, 0, 1, 1,
-2.410271, -0.103041, -2.861538, 1, 0, 0, 1, 1,
-2.400164, 1.098789, -1.589662, 1, 0, 0, 1, 1,
-2.387698, -1.336357, -1.622864, 0, 0, 0, 1, 1,
-2.351977, 0.9133469, 0.7718301, 0, 0, 0, 1, 1,
-2.339405, -1.072406, -0.8075649, 0, 0, 0, 1, 1,
-2.263302, 1.012033, -0.7806128, 0, 0, 0, 1, 1,
-2.255394, -0.07992495, -0.6339012, 0, 0, 0, 1, 1,
-2.243355, -0.6652108, -0.7404233, 0, 0, 0, 1, 1,
-2.217724, 1.241264, -0.5791366, 0, 0, 0, 1, 1,
-2.214924, 0.7503574, -1.024098, 1, 1, 1, 1, 1,
-2.210433, 0.2564241, -0.6928496, 1, 1, 1, 1, 1,
-2.198327, 0.1418233, -2.009269, 1, 1, 1, 1, 1,
-2.127723, -1.007343, -0.7639892, 1, 1, 1, 1, 1,
-2.030245, 0.4435314, -1.842707, 1, 1, 1, 1, 1,
-2.018292, -0.9831267, -2.417967, 1, 1, 1, 1, 1,
-2.00282, 2.169253, -0.5997866, 1, 1, 1, 1, 1,
-1.991394, -0.8785285, -1.968274, 1, 1, 1, 1, 1,
-1.983893, -0.003019114, -0.1331783, 1, 1, 1, 1, 1,
-1.967958, 0.2609405, -1.469496, 1, 1, 1, 1, 1,
-1.964451, 1.00932, -0.4396571, 1, 1, 1, 1, 1,
-1.91883, -1.422439, -2.72888, 1, 1, 1, 1, 1,
-1.914373, 3.056002, -0.3419356, 1, 1, 1, 1, 1,
-1.837425, -0.6957337, -0.7672028, 1, 1, 1, 1, 1,
-1.833895, -0.1029899, -1.875984, 1, 1, 1, 1, 1,
-1.828836, 0.7919571, -1.966447, 0, 0, 1, 1, 1,
-1.787546, -0.5722676, -1.522543, 1, 0, 0, 1, 1,
-1.779188, 0.3609997, -2.457944, 1, 0, 0, 1, 1,
-1.777929, -0.3579716, -0.9251147, 1, 0, 0, 1, 1,
-1.759774, 0.2567367, -3.085275, 1, 0, 0, 1, 1,
-1.724855, -0.4862592, -2.160026, 1, 0, 0, 1, 1,
-1.692955, -0.5052341, -2.427581, 0, 0, 0, 1, 1,
-1.689502, 0.4006441, -1.926386, 0, 0, 0, 1, 1,
-1.687516, 0.00985863, -1.569594, 0, 0, 0, 1, 1,
-1.675601, 0.6814255, -1.358082, 0, 0, 0, 1, 1,
-1.661395, -0.6923497, -2.257754, 0, 0, 0, 1, 1,
-1.659838, -0.1405285, -2.42248, 0, 0, 0, 1, 1,
-1.626256, -0.3417546, -0.5037965, 0, 0, 0, 1, 1,
-1.615294, -0.05834719, -2.79511, 1, 1, 1, 1, 1,
-1.607333, 0.7239869, -0.316055, 1, 1, 1, 1, 1,
-1.598942, -0.09897864, -2.414671, 1, 1, 1, 1, 1,
-1.581064, 0.2647165, -1.205096, 1, 1, 1, 1, 1,
-1.57221, 0.8123946, -1.70752, 1, 1, 1, 1, 1,
-1.57179, 1.0107, -0.408838, 1, 1, 1, 1, 1,
-1.567954, 2.125299, 0.03646566, 1, 1, 1, 1, 1,
-1.550259, -0.06520126, -0.8413187, 1, 1, 1, 1, 1,
-1.539792, 1.051269, 0.03661206, 1, 1, 1, 1, 1,
-1.538328, 0.4133638, -0.4641681, 1, 1, 1, 1, 1,
-1.536848, -0.7021314, -1.968915, 1, 1, 1, 1, 1,
-1.535807, -0.0006307843, -0.1953476, 1, 1, 1, 1, 1,
-1.527786, 1.029227, -1.745348, 1, 1, 1, 1, 1,
-1.503252, 0.7550018, -1.217016, 1, 1, 1, 1, 1,
-1.484871, -0.1138607, -2.733185, 1, 1, 1, 1, 1,
-1.478377, -0.253446, -2.064852, 0, 0, 1, 1, 1,
-1.47805, -0.3888839, -2.163949, 1, 0, 0, 1, 1,
-1.466815, 0.9811025, -2.325431, 1, 0, 0, 1, 1,
-1.461217, 1.12163, -1.603661, 1, 0, 0, 1, 1,
-1.459225, -1.424801, -3.115433, 1, 0, 0, 1, 1,
-1.447961, 0.7715702, 0.09725045, 1, 0, 0, 1, 1,
-1.439106, 1.150678, -1.574854, 0, 0, 0, 1, 1,
-1.433259, 2.431946, -1.054707, 0, 0, 0, 1, 1,
-1.426572, -1.038655, -2.558463, 0, 0, 0, 1, 1,
-1.409522, 0.4918124, 1.648291, 0, 0, 0, 1, 1,
-1.407092, -0.5309406, -1.503804, 0, 0, 0, 1, 1,
-1.404027, 0.337175, 0.1149091, 0, 0, 0, 1, 1,
-1.398823, 1.036173, -0.8922753, 0, 0, 0, 1, 1,
-1.395026, 0.4373472, -1.060389, 1, 1, 1, 1, 1,
-1.38507, -1.654184, -2.735259, 1, 1, 1, 1, 1,
-1.38199, 0.01482322, -1.309533, 1, 1, 1, 1, 1,
-1.381486, -0.2721559, -1.294129, 1, 1, 1, 1, 1,
-1.381418, -0.7823457, -2.055761, 1, 1, 1, 1, 1,
-1.380898, 0.3870904, -1.445526, 1, 1, 1, 1, 1,
-1.367429, 1.30934, -0.893428, 1, 1, 1, 1, 1,
-1.365164, 0.3481437, -3.457179, 1, 1, 1, 1, 1,
-1.351942, 1.04573, 0.0650671, 1, 1, 1, 1, 1,
-1.345336, 1.679865, 0.1755087, 1, 1, 1, 1, 1,
-1.324486, 0.6063018, -0.4056016, 1, 1, 1, 1, 1,
-1.319183, -1.482126, -2.279969, 1, 1, 1, 1, 1,
-1.306993, 0.2794356, -0.4924772, 1, 1, 1, 1, 1,
-1.302227, 0.5655737, -1.352087, 1, 1, 1, 1, 1,
-1.277279, 1.054909, -1.108218, 1, 1, 1, 1, 1,
-1.271963, -0.009556966, -2.194804, 0, 0, 1, 1, 1,
-1.264995, -1.055544, -1.276665, 1, 0, 0, 1, 1,
-1.263887, -0.5739335, -0.9783142, 1, 0, 0, 1, 1,
-1.252983, 0.821558, -0.3580201, 1, 0, 0, 1, 1,
-1.238437, -1.387941, -3.586664, 1, 0, 0, 1, 1,
-1.235649, -0.7134158, -1.19511, 1, 0, 0, 1, 1,
-1.234257, -0.9788387, -2.568105, 0, 0, 0, 1, 1,
-1.233787, -0.1480496, -1.024488, 0, 0, 0, 1, 1,
-1.232606, -0.4881758, -0.9743586, 0, 0, 0, 1, 1,
-1.214457, 0.7631093, -1.751521, 0, 0, 0, 1, 1,
-1.208784, 0.4604518, -0.3750686, 0, 0, 0, 1, 1,
-1.20815, 0.3969403, -1.201006, 0, 0, 0, 1, 1,
-1.204168, -0.5654711, -3.672762, 0, 0, 0, 1, 1,
-1.204121, -1.613473, -3.329585, 1, 1, 1, 1, 1,
-1.19533, 0.4804774, -0.9872435, 1, 1, 1, 1, 1,
-1.193115, -0.2554402, -1.563727, 1, 1, 1, 1, 1,
-1.178494, 0.8235605, 0.03508523, 1, 1, 1, 1, 1,
-1.174746, 0.2674221, -1.171823, 1, 1, 1, 1, 1,
-1.173561, 1.172383, -1.52297, 1, 1, 1, 1, 1,
-1.171534, -0.1843974, -3.563123, 1, 1, 1, 1, 1,
-1.170181, -0.29488, -2.291872, 1, 1, 1, 1, 1,
-1.155332, 0.1992267, -2.336974, 1, 1, 1, 1, 1,
-1.153586, 1.188426, -2.117885, 1, 1, 1, 1, 1,
-1.148177, 1.446573, -0.7941117, 1, 1, 1, 1, 1,
-1.147924, 0.6330926, -2.090726, 1, 1, 1, 1, 1,
-1.140954, -0.9603364, -0.22567, 1, 1, 1, 1, 1,
-1.133385, 1.076753, -0.9403297, 1, 1, 1, 1, 1,
-1.133254, 1.413392, -0.674688, 1, 1, 1, 1, 1,
-1.133083, -0.4042649, -1.932413, 0, 0, 1, 1, 1,
-1.13115, -1.292711, -1.430415, 1, 0, 0, 1, 1,
-1.124318, 0.2924813, -1.716209, 1, 0, 0, 1, 1,
-1.123884, -0.9556834, -2.86995, 1, 0, 0, 1, 1,
-1.118655, -0.7958352, -1.928355, 1, 0, 0, 1, 1,
-1.118093, -1.021435, -0.8735945, 1, 0, 0, 1, 1,
-1.11393, -0.2490898, -5.132049, 0, 0, 0, 1, 1,
-1.108473, -1.411909, -0.3496132, 0, 0, 0, 1, 1,
-1.108197, -1.048483, -2.262187, 0, 0, 0, 1, 1,
-1.096431, 0.02397436, -1.469959, 0, 0, 0, 1, 1,
-1.093709, -0.2141406, -1.876776, 0, 0, 0, 1, 1,
-1.093094, -0.4507234, -2.731022, 0, 0, 0, 1, 1,
-1.087917, 0.3940967, -1.053759, 0, 0, 0, 1, 1,
-1.085318, 0.6937969, -1.081104, 1, 1, 1, 1, 1,
-1.078435, -0.2066877, -1.531573, 1, 1, 1, 1, 1,
-1.069734, 0.5537869, -1.442111, 1, 1, 1, 1, 1,
-1.069195, -0.7189381, -1.591314, 1, 1, 1, 1, 1,
-1.065022, -1.094652, -1.653232, 1, 1, 1, 1, 1,
-1.05211, -1.3023, -1.572029, 1, 1, 1, 1, 1,
-1.049806, -0.8119704, -2.110707, 1, 1, 1, 1, 1,
-1.041149, -0.3768691, -1.147719, 1, 1, 1, 1, 1,
-1.038345, -0.7098491, -3.248087, 1, 1, 1, 1, 1,
-1.030114, -0.5734561, -2.383606, 1, 1, 1, 1, 1,
-1.028831, 1.567311, 0.8936545, 1, 1, 1, 1, 1,
-1.009035, -0.3957696, -3.42858, 1, 1, 1, 1, 1,
-1.00818, 0.3094979, -0.4782456, 1, 1, 1, 1, 1,
-1.001467, -0.4568108, -1.191848, 1, 1, 1, 1, 1,
-0.9976472, 0.3237505, -2.546938, 1, 1, 1, 1, 1,
-0.9938983, 0.406477, -2.365367, 0, 0, 1, 1, 1,
-0.9888614, 0.5074, -2.024162, 1, 0, 0, 1, 1,
-0.974591, -0.3788971, -4.232393, 1, 0, 0, 1, 1,
-0.9716598, -0.3133893, -2.719811, 1, 0, 0, 1, 1,
-0.9703095, -0.8312163, -2.351418, 1, 0, 0, 1, 1,
-0.9661239, 0.9618849, 0.08989631, 1, 0, 0, 1, 1,
-0.9651006, 0.5710624, 0.5317788, 0, 0, 0, 1, 1,
-0.9639838, -0.1122048, 0.5257561, 0, 0, 0, 1, 1,
-0.9619067, 1.245062, 0.3249063, 0, 0, 0, 1, 1,
-0.9586058, 0.4258216, -3.235842, 0, 0, 0, 1, 1,
-0.9574096, -1.842906, -3.269835, 0, 0, 0, 1, 1,
-0.9557288, 1.361766, 0.6802014, 0, 0, 0, 1, 1,
-0.9547347, 0.07811493, -1.503371, 0, 0, 0, 1, 1,
-0.9471178, 2.251623, 0.550695, 1, 1, 1, 1, 1,
-0.9452553, -1.375882, -2.26993, 1, 1, 1, 1, 1,
-0.9448618, 0.4166919, -2.279185, 1, 1, 1, 1, 1,
-0.9425471, 0.4448178, -0.4870383, 1, 1, 1, 1, 1,
-0.9420139, 1.816223, -0.4232802, 1, 1, 1, 1, 1,
-0.9367679, -0.8380961, -5.451411, 1, 1, 1, 1, 1,
-0.9366329, 0.7533232, -1.083911, 1, 1, 1, 1, 1,
-0.9344507, -0.1190292, -2.718397, 1, 1, 1, 1, 1,
-0.9312073, -0.08186508, -4.299243, 1, 1, 1, 1, 1,
-0.9252852, 1.620613, 1.168373, 1, 1, 1, 1, 1,
-0.9080355, 1.091391, -1.584759, 1, 1, 1, 1, 1,
-0.9036037, -0.3400649, -1.926612, 1, 1, 1, 1, 1,
-0.9003145, 0.1782296, -2.313818, 1, 1, 1, 1, 1,
-0.8981585, 2.227308, -1.1155, 1, 1, 1, 1, 1,
-0.8964176, 0.333198, -2.28553, 1, 1, 1, 1, 1,
-0.8916926, 0.03858479, -0.5661916, 0, 0, 1, 1, 1,
-0.8911333, -0.01849892, -3.282703, 1, 0, 0, 1, 1,
-0.8870708, -0.2497761, -3.573675, 1, 0, 0, 1, 1,
-0.8858278, 0.5328048, -1.649707, 1, 0, 0, 1, 1,
-0.8837375, -1.776462, -3.084896, 1, 0, 0, 1, 1,
-0.8820741, 0.8614353, -0.03669165, 1, 0, 0, 1, 1,
-0.8817251, -0.4292573, -1.868509, 0, 0, 0, 1, 1,
-0.8802198, 0.5037309, -2.205414, 0, 0, 0, 1, 1,
-0.8800722, 1.512931, 0.6770622, 0, 0, 0, 1, 1,
-0.8781058, 0.4384284, -0.4591997, 0, 0, 0, 1, 1,
-0.8723733, -0.7033948, -2.66602, 0, 0, 0, 1, 1,
-0.8723068, -1.040003, -2.2176, 0, 0, 0, 1, 1,
-0.8697128, 2.077846, 0.2513364, 0, 0, 0, 1, 1,
-0.8647084, -1.639925, -1.909245, 1, 1, 1, 1, 1,
-0.8557045, -0.7804609, -2.793539, 1, 1, 1, 1, 1,
-0.847885, -0.2791727, -1.605487, 1, 1, 1, 1, 1,
-0.8475506, -0.9854198, -1.877817, 1, 1, 1, 1, 1,
-0.8397965, -0.8764096, -2.816242, 1, 1, 1, 1, 1,
-0.8352602, -0.5677786, -1.937321, 1, 1, 1, 1, 1,
-0.8336902, 0.7846105, -2.411801, 1, 1, 1, 1, 1,
-0.8322207, -0.3823326, -3.072874, 1, 1, 1, 1, 1,
-0.8316491, 0.2108754, -1.444113, 1, 1, 1, 1, 1,
-0.8309144, 1.054588, -0.5992507, 1, 1, 1, 1, 1,
-0.8296905, -1.225602, -4.886734, 1, 1, 1, 1, 1,
-0.8275553, 0.3921389, 0.6378653, 1, 1, 1, 1, 1,
-0.8267164, -1.509293, -2.392222, 1, 1, 1, 1, 1,
-0.8216577, -1.846545, -3.519812, 1, 1, 1, 1, 1,
-0.8205178, -0.8078591, -2.018915, 1, 1, 1, 1, 1,
-0.8183517, -1.138938, -3.103367, 0, 0, 1, 1, 1,
-0.816734, -0.9178189, -2.22671, 1, 0, 0, 1, 1,
-0.8036731, -0.8569378, 0.1045053, 1, 0, 0, 1, 1,
-0.8017122, 1.483169, -1.208676, 1, 0, 0, 1, 1,
-0.7999083, 0.1863595, 0.4374246, 1, 0, 0, 1, 1,
-0.7966841, 0.5929589, 0.4721179, 1, 0, 0, 1, 1,
-0.7959299, 1.178094, -0.7266133, 0, 0, 0, 1, 1,
-0.7942975, -0.1467631, -3.524121, 0, 0, 0, 1, 1,
-0.7938303, 0.1350929, -2.029986, 0, 0, 0, 1, 1,
-0.7936851, 0.9458537, 0.8929396, 0, 0, 0, 1, 1,
-0.7912263, -1.0075, -3.200175, 0, 0, 0, 1, 1,
-0.787928, 1.238839, 0.3933803, 0, 0, 0, 1, 1,
-0.7678088, -0.1907897, 0.2729294, 0, 0, 0, 1, 1,
-0.7657967, 0.3291447, -1.974215, 1, 1, 1, 1, 1,
-0.7603935, -0.578261, -1.935545, 1, 1, 1, 1, 1,
-0.7582583, 0.6734728, -0.537866, 1, 1, 1, 1, 1,
-0.7416853, -0.6841078, -1.718449, 1, 1, 1, 1, 1,
-0.7365627, -1.75131, -1.03809, 1, 1, 1, 1, 1,
-0.7328642, 0.8385516, -1.913567, 1, 1, 1, 1, 1,
-0.7300897, -0.3154028, -1.546462, 1, 1, 1, 1, 1,
-0.7284623, 0.3211658, -2.086922, 1, 1, 1, 1, 1,
-0.7273312, -1.458298, -3.097769, 1, 1, 1, 1, 1,
-0.7204626, -0.6557539, -0.8168551, 1, 1, 1, 1, 1,
-0.7159805, 1.674311, -0.06319533, 1, 1, 1, 1, 1,
-0.7159311, -0.3432982, -1.728403, 1, 1, 1, 1, 1,
-0.7145369, -0.7361202, -2.365588, 1, 1, 1, 1, 1,
-0.7075111, -0.6133168, -2.690817, 1, 1, 1, 1, 1,
-0.7064813, -1.853961, -2.61674, 1, 1, 1, 1, 1,
-0.7030635, 0.6130438, -1.885835, 0, 0, 1, 1, 1,
-0.7027475, -0.1581002, -2.127363, 1, 0, 0, 1, 1,
-0.6996791, 0.1776208, -1.273475, 1, 0, 0, 1, 1,
-0.6944189, 0.5327328, -2.786644, 1, 0, 0, 1, 1,
-0.6937887, -0.1838903, -1.312954, 1, 0, 0, 1, 1,
-0.681343, 0.1367226, -1.63229, 1, 0, 0, 1, 1,
-0.6788537, 1.904936, -0.4406668, 0, 0, 0, 1, 1,
-0.6785644, -0.3987931, -2.087925, 0, 0, 0, 1, 1,
-0.6770875, -1.686856, -2.682382, 0, 0, 0, 1, 1,
-0.6750212, 0.121641, -1.530172, 0, 0, 0, 1, 1,
-0.6720297, 0.1228988, -1.93167, 0, 0, 0, 1, 1,
-0.6702823, 0.2713059, -1.820521, 0, 0, 0, 1, 1,
-0.6701678, 1.084098, -0.2318656, 0, 0, 0, 1, 1,
-0.6693113, 0.4314092, 0.3619535, 1, 1, 1, 1, 1,
-0.6671008, -0.124906, -1.615943, 1, 1, 1, 1, 1,
-0.6645404, -0.475262, -3.795938, 1, 1, 1, 1, 1,
-0.6640133, 1.877578, 0.648717, 1, 1, 1, 1, 1,
-0.6636904, -0.2486699, -3.38934, 1, 1, 1, 1, 1,
-0.6628065, 0.9168799, -1.511361, 1, 1, 1, 1, 1,
-0.6622742, -0.2772924, -2.782153, 1, 1, 1, 1, 1,
-0.6613812, -1.248948, -2.104582, 1, 1, 1, 1, 1,
-0.6584314, 0.6960443, 0.1802322, 1, 1, 1, 1, 1,
-0.6525576, 0.5998116, -1.106038, 1, 1, 1, 1, 1,
-0.6465799, -1.227576, -1.36046, 1, 1, 1, 1, 1,
-0.6450168, -1.784799, -3.778203, 1, 1, 1, 1, 1,
-0.6406322, 0.04787884, -3.040089, 1, 1, 1, 1, 1,
-0.6402436, -1.83621, -3.011976, 1, 1, 1, 1, 1,
-0.6398163, -1.627779, -2.245333, 1, 1, 1, 1, 1,
-0.6385917, 0.8065403, 0.3976769, 0, 0, 1, 1, 1,
-0.6374577, 2.160015, -0.06786542, 1, 0, 0, 1, 1,
-0.6371951, -0.1655386, -2.497882, 1, 0, 0, 1, 1,
-0.6366138, 0.6446719, -0.9269201, 1, 0, 0, 1, 1,
-0.6339123, -0.1261388, -0.2547687, 1, 0, 0, 1, 1,
-0.6336147, -1.532119, -2.675937, 1, 0, 0, 1, 1,
-0.6311775, -0.8252981, -2.687391, 0, 0, 0, 1, 1,
-0.6291212, -1.525725, -2.296951, 0, 0, 0, 1, 1,
-0.6286314, -0.1955875, -3.770237, 0, 0, 0, 1, 1,
-0.6271857, -0.09377524, -0.7940702, 0, 0, 0, 1, 1,
-0.6230578, -0.496281, -0.97681, 0, 0, 0, 1, 1,
-0.6074779, 0.7536121, -0.8623807, 0, 0, 0, 1, 1,
-0.6027986, 1.081609, -1.510851, 0, 0, 0, 1, 1,
-0.6027475, 1.278757, -0.9143807, 1, 1, 1, 1, 1,
-0.6008964, -0.2546972, -3.738117, 1, 1, 1, 1, 1,
-0.597286, 0.04653878, -2.142239, 1, 1, 1, 1, 1,
-0.5962483, -0.4955168, -2.43983, 1, 1, 1, 1, 1,
-0.5927103, -2.606067, -1.41516, 1, 1, 1, 1, 1,
-0.5921674, -0.7497914, -2.572292, 1, 1, 1, 1, 1,
-0.5903792, -0.08536155, -2.233323, 1, 1, 1, 1, 1,
-0.5850686, 0.724053, -0.9491104, 1, 1, 1, 1, 1,
-0.5847149, 2.702132, -0.1321574, 1, 1, 1, 1, 1,
-0.5839217, -0.05666421, -2.498755, 1, 1, 1, 1, 1,
-0.5791358, -1.453193, -1.851327, 1, 1, 1, 1, 1,
-0.5786583, 0.5591121, -1.137534, 1, 1, 1, 1, 1,
-0.5758666, -0.4801004, -2.697409, 1, 1, 1, 1, 1,
-0.5710586, 0.3951305, 0.5328979, 1, 1, 1, 1, 1,
-0.5702199, -0.8411524, -4.203223, 1, 1, 1, 1, 1,
-0.5690534, -1.949908, -5.273652, 0, 0, 1, 1, 1,
-0.5687485, 1.108003, -0.5434535, 1, 0, 0, 1, 1,
-0.5680917, 0.366204, -1.90941, 1, 0, 0, 1, 1,
-0.5652995, 1.446759, -1.205946, 1, 0, 0, 1, 1,
-0.5647545, 0.8881081, -1.559422, 1, 0, 0, 1, 1,
-0.5646857, -2.042469, -3.043139, 1, 0, 0, 1, 1,
-0.5639785, 0.2675676, -0.826723, 0, 0, 0, 1, 1,
-0.5632019, -0.7428945, -2.462852, 0, 0, 0, 1, 1,
-0.5609919, -0.05975728, -1.112285, 0, 0, 0, 1, 1,
-0.5594991, 1.340325, -2.190204, 0, 0, 0, 1, 1,
-0.5587257, 0.6477928, -0.9536607, 0, 0, 0, 1, 1,
-0.5499894, 1.205131, 0.1110263, 0, 0, 0, 1, 1,
-0.5455596, 1.54278, 1.098021, 0, 0, 0, 1, 1,
-0.5438662, 0.5618357, -0.7819168, 1, 1, 1, 1, 1,
-0.5428599, -0.6717367, -2.880796, 1, 1, 1, 1, 1,
-0.5415699, 0.4474941, 1.372981, 1, 1, 1, 1, 1,
-0.5403135, 1.248253, 0.1867071, 1, 1, 1, 1, 1,
-0.5401624, 0.08889537, -1.719529, 1, 1, 1, 1, 1,
-0.5374717, -0.776282, -3.450975, 1, 1, 1, 1, 1,
-0.5336386, 0.2149271, -0.3808838, 1, 1, 1, 1, 1,
-0.5332169, -0.8757452, -1.911009, 1, 1, 1, 1, 1,
-0.5301759, 1.049557, -3.079205, 1, 1, 1, 1, 1,
-0.526206, 0.1033392, -2.305247, 1, 1, 1, 1, 1,
-0.5216001, 0.6120443, -1.462719, 1, 1, 1, 1, 1,
-0.5176587, 0.7001565, 0.05359374, 1, 1, 1, 1, 1,
-0.5117213, -0.3801898, -1.953412, 1, 1, 1, 1, 1,
-0.5090809, -0.4014647, -2.767585, 1, 1, 1, 1, 1,
-0.508536, -0.8873824, -3.895056, 1, 1, 1, 1, 1,
-0.5064812, 0.6280074, -0.2656378, 0, 0, 1, 1, 1,
-0.5062119, -1.478137, -2.913508, 1, 0, 0, 1, 1,
-0.5060032, -0.2043456, -2.518315, 1, 0, 0, 1, 1,
-0.5052897, -0.9855774, -1.961846, 1, 0, 0, 1, 1,
-0.5000243, 1.972551, 0.2602954, 1, 0, 0, 1, 1,
-0.4986173, -0.4401318, -1.160976, 1, 0, 0, 1, 1,
-0.4961089, 0.4242048, -2.354239, 0, 0, 0, 1, 1,
-0.4888367, 0.2170919, -0.8135093, 0, 0, 0, 1, 1,
-0.4855705, 0.7312633, -1.109323, 0, 0, 0, 1, 1,
-0.4841217, -1.369651, -3.491979, 0, 0, 0, 1, 1,
-0.4782778, 0.6267657, -1.911421, 0, 0, 0, 1, 1,
-0.4754924, 0.9925398, -0.6602956, 0, 0, 0, 1, 1,
-0.4646012, -0.1101726, -1.159843, 0, 0, 0, 1, 1,
-0.4645094, 1.330852, -1.458873, 1, 1, 1, 1, 1,
-0.4633064, 0.6636962, -0.3477012, 1, 1, 1, 1, 1,
-0.4618922, -0.3827111, -1.163087, 1, 1, 1, 1, 1,
-0.4616073, -0.04834642, -3.595561, 1, 1, 1, 1, 1,
-0.460728, -0.7707048, -2.856681, 1, 1, 1, 1, 1,
-0.4587159, -1.201881, -2.178209, 1, 1, 1, 1, 1,
-0.4465975, -0.1565973, -2.055854, 1, 1, 1, 1, 1,
-0.444704, -0.01266165, -1.48706, 1, 1, 1, 1, 1,
-0.4420097, 0.59263, -1.626837, 1, 1, 1, 1, 1,
-0.4411577, -0.08051654, -3.280027, 1, 1, 1, 1, 1,
-0.4382985, 0.283252, -0.06045645, 1, 1, 1, 1, 1,
-0.435782, -0.3249803, -1.496355, 1, 1, 1, 1, 1,
-0.4232975, -0.01453191, -2.428843, 1, 1, 1, 1, 1,
-0.4232668, 0.1785177, -1.591753, 1, 1, 1, 1, 1,
-0.4217162, -0.3156185, -3.323866, 1, 1, 1, 1, 1,
-0.4171195, 0.7138, -0.8940128, 0, 0, 1, 1, 1,
-0.4153683, -0.3453068, -0.6316538, 1, 0, 0, 1, 1,
-0.4092012, 1.356252, -1.045936, 1, 0, 0, 1, 1,
-0.4090571, 0.09242413, -1.16473, 1, 0, 0, 1, 1,
-0.4074645, -0.2781526, -2.141356, 1, 0, 0, 1, 1,
-0.404713, 0.7573469, -0.270873, 1, 0, 0, 1, 1,
-0.4015944, -1.213276, -3.199608, 0, 0, 0, 1, 1,
-0.3988232, -1.737377, -2.224525, 0, 0, 0, 1, 1,
-0.3970127, 1.255784, -0.2387586, 0, 0, 0, 1, 1,
-0.3967235, -0.8555481, -2.417454, 0, 0, 0, 1, 1,
-0.390087, 2.019842, -1.163268, 0, 0, 0, 1, 1,
-0.387267, 0.2452535, -0.2255819, 0, 0, 0, 1, 1,
-0.382531, -0.4145362, -2.065211, 0, 0, 0, 1, 1,
-0.3814635, -0.5705352, -2.589216, 1, 1, 1, 1, 1,
-0.3761266, -0.1549622, -1.273017, 1, 1, 1, 1, 1,
-0.367177, -1.238042, -0.5538285, 1, 1, 1, 1, 1,
-0.3652341, -0.8851329, -3.260131, 1, 1, 1, 1, 1,
-0.3651436, -1.098676, -2.832751, 1, 1, 1, 1, 1,
-0.3642678, 0.04423933, -3.421014, 1, 1, 1, 1, 1,
-0.3633137, 1.477976, 0.536785, 1, 1, 1, 1, 1,
-0.3620692, -0.438945, -3.276986, 1, 1, 1, 1, 1,
-0.3594312, -0.8502523, -2.854587, 1, 1, 1, 1, 1,
-0.3548414, -0.6062217, -2.770329, 1, 1, 1, 1, 1,
-0.351121, 0.5419516, 1.089557, 1, 1, 1, 1, 1,
-0.3506527, 2.196494, -0.6723925, 1, 1, 1, 1, 1,
-0.3497114, 0.4741364, 0.4461142, 1, 1, 1, 1, 1,
-0.337401, -0.2538349, -2.510857, 1, 1, 1, 1, 1,
-0.3356467, 0.7247097, 0.1552864, 1, 1, 1, 1, 1,
-0.3331637, -0.009416839, -1.094822, 0, 0, 1, 1, 1,
-0.3331467, 0.5533171, 0.7454554, 1, 0, 0, 1, 1,
-0.3135654, 0.9010732, -1.001954, 1, 0, 0, 1, 1,
-0.3119771, 1.382828, 0.07923579, 1, 0, 0, 1, 1,
-0.311329, 0.9847179, -1.202629, 1, 0, 0, 1, 1,
-0.3041585, 1.062457, -1.449167, 1, 0, 0, 1, 1,
-0.3034273, -0.7800314, -4.344814, 0, 0, 0, 1, 1,
-0.3030051, 0.8897881, 0.976185, 0, 0, 0, 1, 1,
-0.3019264, -0.7467647, -2.803266, 0, 0, 0, 1, 1,
-0.3008223, -1.122118, -3.179606, 0, 0, 0, 1, 1,
-0.2994828, 1.498631, -1.333264, 0, 0, 0, 1, 1,
-0.294217, -1.397219, -1.11043, 0, 0, 0, 1, 1,
-0.2935361, 0.7063622, -1.189669, 0, 0, 0, 1, 1,
-0.2929014, 1.929763, -2.670661, 1, 1, 1, 1, 1,
-0.2902245, 1.006027, -0.1740664, 1, 1, 1, 1, 1,
-0.2870784, -0.5774935, -3.132712, 1, 1, 1, 1, 1,
-0.2854851, -0.8550673, -2.816322, 1, 1, 1, 1, 1,
-0.2846106, -0.2468853, -0.9292831, 1, 1, 1, 1, 1,
-0.2820084, -1.046416, -3.11777, 1, 1, 1, 1, 1,
-0.2774062, 1.299323, 0.07292545, 1, 1, 1, 1, 1,
-0.2717906, 0.7839825, 0.2721574, 1, 1, 1, 1, 1,
-0.2715751, -0.2796614, -1.806849, 1, 1, 1, 1, 1,
-0.2674505, 2.839423, -1.130955, 1, 1, 1, 1, 1,
-0.2662318, 1.135551, 0.0273959, 1, 1, 1, 1, 1,
-0.2621025, 0.7468526, 0.599739, 1, 1, 1, 1, 1,
-0.2588875, -0.8338647, -1.071967, 1, 1, 1, 1, 1,
-0.2566088, -1.941886, -1.697977, 1, 1, 1, 1, 1,
-0.2536592, 1.041678, 0.7529814, 1, 1, 1, 1, 1,
-0.2521242, 1.807475, -0.8388034, 0, 0, 1, 1, 1,
-0.2510327, 1.319862, 1.01256, 1, 0, 0, 1, 1,
-0.2502702, 0.7708476, -1.133473, 1, 0, 0, 1, 1,
-0.2496137, -0.6575909, -2.317936, 1, 0, 0, 1, 1,
-0.248746, -0.3403706, -3.939609, 1, 0, 0, 1, 1,
-0.247669, 1.720124, 1.184994, 1, 0, 0, 1, 1,
-0.2474422, 0.462344, 0.127761, 0, 0, 0, 1, 1,
-0.2473193, -0.314343, -2.869625, 0, 0, 0, 1, 1,
-0.2446019, -1.703321, -2.092179, 0, 0, 0, 1, 1,
-0.2415626, -1.029978, -3.196685, 0, 0, 0, 1, 1,
-0.2278188, 0.6674498, -1.288756, 0, 0, 0, 1, 1,
-0.2272695, 0.9824485, -0.6909086, 0, 0, 0, 1, 1,
-0.2231288, 0.2710688, 0.1302684, 0, 0, 0, 1, 1,
-0.2207294, 1.247014, 0.05599627, 1, 1, 1, 1, 1,
-0.2145302, 1.466719, 0.2051741, 1, 1, 1, 1, 1,
-0.2142734, 1.571029, 0.4032544, 1, 1, 1, 1, 1,
-0.2140338, 0.5444908, -2.71355, 1, 1, 1, 1, 1,
-0.2139968, -2.353471, -2.538641, 1, 1, 1, 1, 1,
-0.2133812, -0.4740333, -3.457838, 1, 1, 1, 1, 1,
-0.2100888, -0.3984867, -1.545426, 1, 1, 1, 1, 1,
-0.2057005, -0.7309514, -5.382773, 1, 1, 1, 1, 1,
-0.2022598, -0.2604576, -4.110264, 1, 1, 1, 1, 1,
-0.2017252, 2.378757, -0.2787786, 1, 1, 1, 1, 1,
-0.1996595, 0.06026289, 0.2843209, 1, 1, 1, 1, 1,
-0.1965319, 0.9000928, 0.281256, 1, 1, 1, 1, 1,
-0.1960603, -0.4625669, -2.324027, 1, 1, 1, 1, 1,
-0.1960329, -0.5647199, -4.680354, 1, 1, 1, 1, 1,
-0.1956033, 0.7319301, 0.7689334, 1, 1, 1, 1, 1,
-0.1934932, -0.09515655, -1.519298, 0, 0, 1, 1, 1,
-0.1928971, -0.9790236, -0.9814433, 1, 0, 0, 1, 1,
-0.1911862, -0.9961691, -2.949814, 1, 0, 0, 1, 1,
-0.1870111, -0.3871926, -3.226696, 1, 0, 0, 1, 1,
-0.1820446, 1.586168, -0.5718005, 1, 0, 0, 1, 1,
-0.1813502, -0.505737, -1.584216, 1, 0, 0, 1, 1,
-0.1792442, 0.5156628, -1.590627, 0, 0, 0, 1, 1,
-0.1786512, 0.8740299, -1.662105, 0, 0, 0, 1, 1,
-0.1669392, 1.329212, -1.451526, 0, 0, 0, 1, 1,
-0.16692, 0.1517329, -0.9585751, 0, 0, 0, 1, 1,
-0.1666929, 2.17103, -0.2209388, 0, 0, 0, 1, 1,
-0.1579489, 0.1222969, -1.324861, 0, 0, 0, 1, 1,
-0.155791, 1.287555, 0.4812195, 0, 0, 0, 1, 1,
-0.1523229, -0.5967544, -2.212083, 1, 1, 1, 1, 1,
-0.1468162, -0.9806827, -2.921455, 1, 1, 1, 1, 1,
-0.1464407, 0.1438853, -0.2853092, 1, 1, 1, 1, 1,
-0.1450803, -1.422909, -3.980433, 1, 1, 1, 1, 1,
-0.1449048, -0.1464064, -2.668981, 1, 1, 1, 1, 1,
-0.1433191, -0.9915204, -0.9952675, 1, 1, 1, 1, 1,
-0.1409347, 0.3321163, 1.437117, 1, 1, 1, 1, 1,
-0.1395366, 0.2950813, -0.8939557, 1, 1, 1, 1, 1,
-0.1382686, 0.4540567, -0.659866, 1, 1, 1, 1, 1,
-0.1376325, 1.385627, -0.4506653, 1, 1, 1, 1, 1,
-0.1374223, 0.1271221, -0.621573, 1, 1, 1, 1, 1,
-0.1364473, -1.131566, -3.070566, 1, 1, 1, 1, 1,
-0.1346501, -0.2350325, -1.630957, 1, 1, 1, 1, 1,
-0.1322221, 1.438765, -0.5299078, 1, 1, 1, 1, 1,
-0.1298845, -0.7904339, -4.036497, 1, 1, 1, 1, 1,
-0.1230607, 1.619232, -0.09268004, 0, 0, 1, 1, 1,
-0.1229214, -1.421852, -5.071455, 1, 0, 0, 1, 1,
-0.1167861, -0.6565075, -2.995917, 1, 0, 0, 1, 1,
-0.1103586, 0.9230217, -0.9135981, 1, 0, 0, 1, 1,
-0.1102737, 0.2202102, -0.9856604, 1, 0, 0, 1, 1,
-0.1057158, -0.7295192, -2.284569, 1, 0, 0, 1, 1,
-0.1044997, 0.2323309, -1.292913, 0, 0, 0, 1, 1,
-0.1034981, -0.6880289, -2.121395, 0, 0, 0, 1, 1,
-0.09915712, -1.559851, -2.108482, 0, 0, 0, 1, 1,
-0.09415323, -0.8865447, -1.615251, 0, 0, 0, 1, 1,
-0.09400389, 0.2850064, 0.1231867, 0, 0, 0, 1, 1,
-0.09278154, 0.8135689, 1.0277, 0, 0, 0, 1, 1,
-0.09244154, -0.93814, -2.759172, 0, 0, 0, 1, 1,
-0.0913327, 0.7789639, 0.1114234, 1, 1, 1, 1, 1,
-0.08744057, 0.8501685, 0.2700644, 1, 1, 1, 1, 1,
-0.08648013, -0.4056146, -4.568922, 1, 1, 1, 1, 1,
-0.08563528, -0.3501797, -1.651831, 1, 1, 1, 1, 1,
-0.08417014, -0.6396655, -3.218731, 1, 1, 1, 1, 1,
-0.08317995, 0.5851749, -0.4133568, 1, 1, 1, 1, 1,
-0.08257521, 1.471044, 0.4378309, 1, 1, 1, 1, 1,
-0.07315229, 0.3281129, -1.147532, 1, 1, 1, 1, 1,
-0.07117957, -0.3150143, -1.453807, 1, 1, 1, 1, 1,
-0.06666211, -0.1442662, -3.789923, 1, 1, 1, 1, 1,
-0.06505153, -1.412699, -2.575924, 1, 1, 1, 1, 1,
-0.05977546, -0.1354466, -2.547383, 1, 1, 1, 1, 1,
-0.05871478, 0.1757419, 0.6535263, 1, 1, 1, 1, 1,
-0.05712132, 0.8124537, 0.3989516, 1, 1, 1, 1, 1,
-0.05070047, -0.1248589, -1.426146, 1, 1, 1, 1, 1,
-0.05003669, -0.249632, -3.069831, 0, 0, 1, 1, 1,
-0.04463372, -0.6798551, -3.513374, 1, 0, 0, 1, 1,
-0.04364314, -0.4349237, -1.513157, 1, 0, 0, 1, 1,
-0.0433648, 0.3465455, -1.448607, 1, 0, 0, 1, 1,
-0.04235249, 0.2701608, 1.7477, 1, 0, 0, 1, 1,
-0.04198555, 1.021703, -0.5138767, 1, 0, 0, 1, 1,
-0.04048502, -0.717313, -3.987059, 0, 0, 0, 1, 1,
-0.03443506, -0.162792, -2.355999, 0, 0, 0, 1, 1,
-0.0313901, -1.315427, -2.706299, 0, 0, 0, 1, 1,
-0.03118313, 0.5376205, -0.9425685, 0, 0, 0, 1, 1,
-0.02928525, -0.8015585, -2.545351, 0, 0, 0, 1, 1,
-0.02449792, 0.3470697, 1.540562, 0, 0, 0, 1, 1,
-0.01973277, -0.1839162, -4.158909, 0, 0, 0, 1, 1,
-0.01789215, 2.225983, -0.5571196, 1, 1, 1, 1, 1,
-0.01680131, 0.2907051, 0.3158848, 1, 1, 1, 1, 1,
-0.01679342, 0.6283191, -0.4680531, 1, 1, 1, 1, 1,
-0.01607201, 0.7666105, -1.635046, 1, 1, 1, 1, 1,
-0.008753019, 0.5934702, 0.1063172, 1, 1, 1, 1, 1,
-0.008307088, 0.8935075, -0.6285848, 1, 1, 1, 1, 1,
-0.0013314, -0.7575971, -4.040446, 1, 1, 1, 1, 1,
0.00577053, -0.3173558, 4.102633, 1, 1, 1, 1, 1,
0.006291762, 0.846598, 1.394588, 1, 1, 1, 1, 1,
0.007351031, -0.4026435, 3.521056, 1, 1, 1, 1, 1,
0.0118572, 0.1609007, 0.1511374, 1, 1, 1, 1, 1,
0.01695635, -0.2135763, 2.388093, 1, 1, 1, 1, 1,
0.01976702, 0.4983922, -0.09385944, 1, 1, 1, 1, 1,
0.02383587, 0.382661, -0.07547365, 1, 1, 1, 1, 1,
0.03039884, 1.847919, -1.516306, 1, 1, 1, 1, 1,
0.03211956, 0.9828637, -1.308206, 0, 0, 1, 1, 1,
0.03281916, 0.1264619, 3.176097, 1, 0, 0, 1, 1,
0.03803431, 0.8306241, -1.714337, 1, 0, 0, 1, 1,
0.03867375, 0.2982104, 0.7835818, 1, 0, 0, 1, 1,
0.03970838, 0.6382624, 0.1293851, 1, 0, 0, 1, 1,
0.0450846, -0.5427588, 2.30194, 1, 0, 0, 1, 1,
0.04760133, 1.34102, -0.7722928, 0, 0, 0, 1, 1,
0.04984132, 1.35653, 0.5710704, 0, 0, 0, 1, 1,
0.05060772, 2.581489, -1.041796, 0, 0, 0, 1, 1,
0.05471422, -0.8259284, 2.51472, 0, 0, 0, 1, 1,
0.0572493, -0.1727683, 1.48624, 0, 0, 0, 1, 1,
0.0587426, -0.5306567, 3.732282, 0, 0, 0, 1, 1,
0.06921127, 1.131941, -1.417514, 0, 0, 0, 1, 1,
0.07057127, 0.5601628, 0.7197925, 1, 1, 1, 1, 1,
0.07118838, 0.4168535, -1.7178, 1, 1, 1, 1, 1,
0.07603817, -0.7946721, 2.237504, 1, 1, 1, 1, 1,
0.08378462, 0.2540512, 1.070341, 1, 1, 1, 1, 1,
0.08440645, 1.182231, 0.1888782, 1, 1, 1, 1, 1,
0.08455246, 0.3687032, -0.407994, 1, 1, 1, 1, 1,
0.08761821, 1.920162, 0.3727869, 1, 1, 1, 1, 1,
0.09155381, 0.1385959, -2.221989, 1, 1, 1, 1, 1,
0.09439667, 0.2733168, -1.624725, 1, 1, 1, 1, 1,
0.09727002, -0.1386292, 2.43025, 1, 1, 1, 1, 1,
0.1024317, -0.6616026, 3.356688, 1, 1, 1, 1, 1,
0.1066832, -0.07630493, 5.28932, 1, 1, 1, 1, 1,
0.109441, 0.5110139, -0.9026247, 1, 1, 1, 1, 1,
0.1125864, 0.5683905, -0.1949326, 1, 1, 1, 1, 1,
0.1137796, 1.27063, 1.547418, 1, 1, 1, 1, 1,
0.1167486, 0.3046063, -0.75977, 0, 0, 1, 1, 1,
0.1179956, 0.7473031, 0.6348319, 1, 0, 0, 1, 1,
0.1215024, -0.9449943, 4.859792, 1, 0, 0, 1, 1,
0.1216439, 0.687169, 1.485935, 1, 0, 0, 1, 1,
0.1253591, 1.249632, 2.363621, 1, 0, 0, 1, 1,
0.1276033, -0.2289152, 2.866513, 1, 0, 0, 1, 1,
0.1307836, 0.3615171, 1.406113, 0, 0, 0, 1, 1,
0.1322482, -0.3682565, 3.384018, 0, 0, 0, 1, 1,
0.132847, 0.7218471, 0.1655319, 0, 0, 0, 1, 1,
0.1355181, 1.508111, -0.3171233, 0, 0, 0, 1, 1,
0.1364638, 1.502142, 0.7427592, 0, 0, 0, 1, 1,
0.1464382, -0.09124434, 1.764109, 0, 0, 0, 1, 1,
0.1487482, -0.3197812, 2.382802, 0, 0, 0, 1, 1,
0.1581864, 0.2283191, 1.92014, 1, 1, 1, 1, 1,
0.1586089, -1.223554, 4.126194, 1, 1, 1, 1, 1,
0.1604609, -1.916219, 2.416888, 1, 1, 1, 1, 1,
0.1624613, 0.7840063, -0.2498035, 1, 1, 1, 1, 1,
0.1646811, -2.251605, 2.945466, 1, 1, 1, 1, 1,
0.1691972, 0.7555358, -0.194063, 1, 1, 1, 1, 1,
0.174051, -1.996657, 2.896462, 1, 1, 1, 1, 1,
0.1784599, -0.7457122, 3.384119, 1, 1, 1, 1, 1,
0.1792145, -0.7173702, 3.778747, 1, 1, 1, 1, 1,
0.1806737, -1.319447, 3.404318, 1, 1, 1, 1, 1,
0.1807802, 1.118132, 1.347876, 1, 1, 1, 1, 1,
0.1910398, 1.421533, 0.03817847, 1, 1, 1, 1, 1,
0.1931285, -0.4001956, 1.866888, 1, 1, 1, 1, 1,
0.1955346, -1.135738, 1.062379, 1, 1, 1, 1, 1,
0.1963618, 0.8913634, 1.775151, 1, 1, 1, 1, 1,
0.1997913, 2.199586, -0.2182097, 0, 0, 1, 1, 1,
0.2034734, 0.08127484, 2.114319, 1, 0, 0, 1, 1,
0.2059561, 0.05910392, 1.054025, 1, 0, 0, 1, 1,
0.2067338, -0.2870378, 0.101174, 1, 0, 0, 1, 1,
0.2100542, 0.005757479, 2.720133, 1, 0, 0, 1, 1,
0.2106086, 0.7765137, 0.2233184, 1, 0, 0, 1, 1,
0.2119268, 0.9975116, 0.05661643, 0, 0, 0, 1, 1,
0.2130107, -0.7211887, 2.757217, 0, 0, 0, 1, 1,
0.219129, 1.59271, 0.4014969, 0, 0, 0, 1, 1,
0.2193608, 0.2689151, -0.8862839, 0, 0, 0, 1, 1,
0.2206616, -0.2734493, 2.112294, 0, 0, 0, 1, 1,
0.2235616, -2.314705, 4.41354, 0, 0, 0, 1, 1,
0.2236754, -1.582164, 2.924624, 0, 0, 0, 1, 1,
0.2242602, 0.5379614, -0.8512904, 1, 1, 1, 1, 1,
0.2267121, -0.5847224, 1.977324, 1, 1, 1, 1, 1,
0.2287952, 1.031903, -0.8624874, 1, 1, 1, 1, 1,
0.2307904, -0.5627857, 3.901592, 1, 1, 1, 1, 1,
0.2308283, 1.679484, -0.2640775, 1, 1, 1, 1, 1,
0.2310636, -0.4826163, 3.470137, 1, 1, 1, 1, 1,
0.231075, 0.6673832, 0.2003058, 1, 1, 1, 1, 1,
0.2315588, -0.4291523, 1.893535, 1, 1, 1, 1, 1,
0.2318627, 0.1156054, 0.6947008, 1, 1, 1, 1, 1,
0.2324545, 1.2902, 0.217455, 1, 1, 1, 1, 1,
0.2343555, -0.5527489, 2.111493, 1, 1, 1, 1, 1,
0.2403591, 0.247578, 0.8634477, 1, 1, 1, 1, 1,
0.2406473, 0.8046926, 0.5244064, 1, 1, 1, 1, 1,
0.2410602, 0.5685924, 0.2102623, 1, 1, 1, 1, 1,
0.2458723, -0.6926608, 2.398015, 1, 1, 1, 1, 1,
0.2465085, 0.7783216, 2.267057, 0, 0, 1, 1, 1,
0.2481913, 0.141221, 0.8478032, 1, 0, 0, 1, 1,
0.2494372, 0.9259043, -0.8941726, 1, 0, 0, 1, 1,
0.2665566, 1.295675, -0.2923911, 1, 0, 0, 1, 1,
0.2745116, -2.340672, 2.859278, 1, 0, 0, 1, 1,
0.2756688, 0.2006294, 1.665043, 1, 0, 0, 1, 1,
0.276942, -0.01061336, 0.9722692, 0, 0, 0, 1, 1,
0.2779823, 0.2846942, 0.6334634, 0, 0, 0, 1, 1,
0.2783407, 0.06511711, 0.9686688, 0, 0, 0, 1, 1,
0.2784798, -0.721052, 2.013569, 0, 0, 0, 1, 1,
0.2811514, 1.238799, 0.8860036, 0, 0, 0, 1, 1,
0.2855879, 0.1890738, -0.4496512, 0, 0, 0, 1, 1,
0.2889937, -0.2854381, 2.075738, 0, 0, 0, 1, 1,
0.2970431, 3.013172, -0.9158152, 1, 1, 1, 1, 1,
0.298472, -0.8203248, 3.098044, 1, 1, 1, 1, 1,
0.2999649, 1.338406, -0.7580998, 1, 1, 1, 1, 1,
0.3005776, -0.03054477, 1.397658, 1, 1, 1, 1, 1,
0.309844, -1.363834, 4.874557, 1, 1, 1, 1, 1,
0.3124434, 0.2076472, -0.9831395, 1, 1, 1, 1, 1,
0.3143052, -0.4360252, 4.64604, 1, 1, 1, 1, 1,
0.3148144, 0.7530835, -1.278328, 1, 1, 1, 1, 1,
0.3231772, -0.04905868, 1.419049, 1, 1, 1, 1, 1,
0.3258709, -0.9740546, 3.256837, 1, 1, 1, 1, 1,
0.3261369, 1.046381, -1.960601, 1, 1, 1, 1, 1,
0.3268001, 0.403392, 0.325581, 1, 1, 1, 1, 1,
0.3296938, 0.9644453, -0.8070884, 1, 1, 1, 1, 1,
0.3303235, 0.3248582, 2.042431, 1, 1, 1, 1, 1,
0.3322983, -0.1081319, 0.2446626, 1, 1, 1, 1, 1,
0.3339511, -0.01891544, 1.346796, 0, 0, 1, 1, 1,
0.3372248, 0.03814728, 0.7922968, 1, 0, 0, 1, 1,
0.3412665, -1.17813, 3.762713, 1, 0, 0, 1, 1,
0.3435768, -0.8392036, 1.692184, 1, 0, 0, 1, 1,
0.3447123, -1.389371, 3.630337, 1, 0, 0, 1, 1,
0.3491803, 2.059419, 1.352497, 1, 0, 0, 1, 1,
0.3493272, -0.9736305, 2.668094, 0, 0, 0, 1, 1,
0.3572423, 0.7653934, 1.816689, 0, 0, 0, 1, 1,
0.3585535, 0.3395679, 2.651738, 0, 0, 0, 1, 1,
0.3591796, 0.189933, -0.3543359, 0, 0, 0, 1, 1,
0.3605808, -0.724395, 2.964829, 0, 0, 0, 1, 1,
0.3608581, 0.5009414, 1.62541, 0, 0, 0, 1, 1,
0.361909, 0.87599, -0.3983986, 0, 0, 0, 1, 1,
0.3620009, 1.370065, 1.329085, 1, 1, 1, 1, 1,
0.3625491, 0.489216, 0.4336165, 1, 1, 1, 1, 1,
0.3639267, -1.061153, 2.247636, 1, 1, 1, 1, 1,
0.364528, 0.3767127, 2.351716, 1, 1, 1, 1, 1,
0.3673579, 0.6448683, 2.255775, 1, 1, 1, 1, 1,
0.3683015, 0.4162594, 1.697342, 1, 1, 1, 1, 1,
0.3694988, -0.6574048, 1.94401, 1, 1, 1, 1, 1,
0.3698131, 0.06265929, 1.393453, 1, 1, 1, 1, 1,
0.3700423, 0.8592299, 1.160128, 1, 1, 1, 1, 1,
0.3784469, 1.538447, 0.2493876, 1, 1, 1, 1, 1,
0.3798259, -0.5443473, 2.843668, 1, 1, 1, 1, 1,
0.3818423, 1.160889, -0.02846353, 1, 1, 1, 1, 1,
0.3838438, -0.3949021, 3.355762, 1, 1, 1, 1, 1,
0.389545, 0.1254401, 0.113207, 1, 1, 1, 1, 1,
0.3924057, 0.6267737, 0.4788004, 1, 1, 1, 1, 1,
0.3932967, -0.5517806, 3.079204, 0, 0, 1, 1, 1,
0.3935131, -0.3588319, 0.1689757, 1, 0, 0, 1, 1,
0.3957958, 0.9871457, 2.196759, 1, 0, 0, 1, 1,
0.4009008, 1.791703, 0.8745553, 1, 0, 0, 1, 1,
0.4083412, -1.114827, 2.949944, 1, 0, 0, 1, 1,
0.4127897, 0.01197849, 0.9822597, 1, 0, 0, 1, 1,
0.4176304, -1.121895, 3.714334, 0, 0, 0, 1, 1,
0.4200221, 0.01191325, 2.551397, 0, 0, 0, 1, 1,
0.4207261, 0.2759042, 1.050277, 0, 0, 0, 1, 1,
0.4225013, -0.2891824, 3.581696, 0, 0, 0, 1, 1,
0.4336549, -0.06870611, 4.452755, 0, 0, 0, 1, 1,
0.4380567, -0.9824106, 1.721862, 0, 0, 0, 1, 1,
0.4393071, -0.7545642, 2.766593, 0, 0, 0, 1, 1,
0.4403716, 1.282465, 0.05248078, 1, 1, 1, 1, 1,
0.4440278, -0.4171017, 2.729064, 1, 1, 1, 1, 1,
0.4527091, 0.7958445, 1.147641, 1, 1, 1, 1, 1,
0.4530921, -1.342028, 3.350634, 1, 1, 1, 1, 1,
0.4534587, -0.7854677, 3.159224, 1, 1, 1, 1, 1,
0.4546118, -1.269976, 3.351649, 1, 1, 1, 1, 1,
0.4590353, -0.7731488, 3.296496, 1, 1, 1, 1, 1,
0.4618969, -0.3383072, 3.421883, 1, 1, 1, 1, 1,
0.4682719, -0.4250231, 3.38013, 1, 1, 1, 1, 1,
0.4690021, -0.43329, 2.102342, 1, 1, 1, 1, 1,
0.469019, 0.712625, 1.987554, 1, 1, 1, 1, 1,
0.4731873, 1.985861, 0.4799151, 1, 1, 1, 1, 1,
0.4859418, 0.004832065, 1.335992, 1, 1, 1, 1, 1,
0.4908345, 2.00041, 1.130293, 1, 1, 1, 1, 1,
0.5034171, 0.7240636, -0.4815837, 1, 1, 1, 1, 1,
0.5047196, 1.825746, -1.272758, 0, 0, 1, 1, 1,
0.5050123, 1.079509, -1.668193, 1, 0, 0, 1, 1,
0.5090111, 1.851414, 1.941383, 1, 0, 0, 1, 1,
0.5098863, 1.111595, -0.5192393, 1, 0, 0, 1, 1,
0.510145, -0.3439712, 1.787751, 1, 0, 0, 1, 1,
0.5176178, 0.8979531, -0.0248018, 1, 0, 0, 1, 1,
0.5227433, 0.7501816, 1.040417, 0, 0, 0, 1, 1,
0.5276328, 0.6231403, -0.6046936, 0, 0, 0, 1, 1,
0.5339935, 1.006584, 2.309966, 0, 0, 0, 1, 1,
0.5340204, -0.1136943, 2.979735, 0, 0, 0, 1, 1,
0.5418839, 0.5274408, 1.69857, 0, 0, 0, 1, 1,
0.54428, -0.1324683, 2.474257, 0, 0, 0, 1, 1,
0.5454756, -0.1149723, 2.580646, 0, 0, 0, 1, 1,
0.5477852, -1.296575, 2.750117, 1, 1, 1, 1, 1,
0.5516573, -0.0003803551, 1.130267, 1, 1, 1, 1, 1,
0.5523647, -0.47844, 3.263766, 1, 1, 1, 1, 1,
0.5575784, 0.6974571, 1.265981, 1, 1, 1, 1, 1,
0.5584974, -0.1945892, 0.8960187, 1, 1, 1, 1, 1,
0.5677271, 1.382159, -1.540329, 1, 1, 1, 1, 1,
0.5690076, 0.3264451, -0.5192539, 1, 1, 1, 1, 1,
0.5723421, -0.1567696, 1.904942, 1, 1, 1, 1, 1,
0.5726649, -1.156962, 3.100313, 1, 1, 1, 1, 1,
0.5735313, 0.186811, 3.252258, 1, 1, 1, 1, 1,
0.5763733, 0.4173507, 0.5751918, 1, 1, 1, 1, 1,
0.5792529, 0.4459512, 0.5804805, 1, 1, 1, 1, 1,
0.5804791, -0.9488513, 2.266592, 1, 1, 1, 1, 1,
0.5827967, -0.216406, 3.192747, 1, 1, 1, 1, 1,
0.5862734, -0.528027, 2.744839, 1, 1, 1, 1, 1,
0.5879809, -1.689026, 1.740651, 0, 0, 1, 1, 1,
0.5906171, -0.2814306, 2.453793, 1, 0, 0, 1, 1,
0.5913981, -0.7052462, 0.2777375, 1, 0, 0, 1, 1,
0.5930971, 1.128877, -0.5775781, 1, 0, 0, 1, 1,
0.5937319, -0.2952639, 1.535632, 1, 0, 0, 1, 1,
0.5982872, 2.042624, 0.2670071, 1, 0, 0, 1, 1,
0.6103619, 1.23643, 0.4660272, 0, 0, 0, 1, 1,
0.6126875, -1.393473, 3.782914, 0, 0, 0, 1, 1,
0.6166774, -0.6567333, 1.826406, 0, 0, 0, 1, 1,
0.6167303, 1.501719, -1.094539, 0, 0, 0, 1, 1,
0.6198682, -0.1569534, 0.4961292, 0, 0, 0, 1, 1,
0.6236123, -0.3930496, 1.52972, 0, 0, 0, 1, 1,
0.6264425, 0.9506631, 1.130588, 0, 0, 0, 1, 1,
0.6289065, -0.3228914, 2.397393, 1, 1, 1, 1, 1,
0.6294956, -0.1740327, 0.563063, 1, 1, 1, 1, 1,
0.6303384, 0.2236966, 0.05286316, 1, 1, 1, 1, 1,
0.6304321, -0.633741, 2.775768, 1, 1, 1, 1, 1,
0.6321323, 0.1374981, -0.1271086, 1, 1, 1, 1, 1,
0.6367288, -0.5296152, 2.627064, 1, 1, 1, 1, 1,
0.6375565, -0.5858965, 1.330484, 1, 1, 1, 1, 1,
0.6421221, -0.1860041, 2.523233, 1, 1, 1, 1, 1,
0.6433349, -1.164035, 2.229817, 1, 1, 1, 1, 1,
0.652621, -0.8366702, 1.429775, 1, 1, 1, 1, 1,
0.6565433, 1.131915, -0.4417562, 1, 1, 1, 1, 1,
0.6614717, -0.4687866, 0.251892, 1, 1, 1, 1, 1,
0.6641938, 1.074745, -0.5104652, 1, 1, 1, 1, 1,
0.6667714, -0.366871, 3.265508, 1, 1, 1, 1, 1,
0.6667715, 0.4210328, 0.04871532, 1, 1, 1, 1, 1,
0.6677144, -1.415759, 2.990419, 0, 0, 1, 1, 1,
0.6681869, 0.9390442, 1.400338, 1, 0, 0, 1, 1,
0.6684784, 1.365961, 0.6182544, 1, 0, 0, 1, 1,
0.6737336, 0.6107695, 2.362192, 1, 0, 0, 1, 1,
0.6748067, -0.1263475, 1.561014, 1, 0, 0, 1, 1,
0.6800959, 0.009377339, 1.977901, 1, 0, 0, 1, 1,
0.6804799, -1.347131, 3.312964, 0, 0, 0, 1, 1,
0.6816041, 0.6487073, 0.6523032, 0, 0, 0, 1, 1,
0.6830234, -0.7985563, 2.793306, 0, 0, 0, 1, 1,
0.6856122, 1.486803, 1.282891, 0, 0, 0, 1, 1,
0.6874949, 0.4470781, 1.877854, 0, 0, 0, 1, 1,
0.6905512, 1.573663, 1.354953, 0, 0, 0, 1, 1,
0.6935419, -0.6364813, 1.390057, 0, 0, 0, 1, 1,
0.6953937, -1.452166, 1.808596, 1, 1, 1, 1, 1,
0.6970246, 1.33218, -0.1771658, 1, 1, 1, 1, 1,
0.7003802, -1.147669, 2.901287, 1, 1, 1, 1, 1,
0.7031569, 0.6640288, 0.4301381, 1, 1, 1, 1, 1,
0.7067401, 0.5995472, 0.9119389, 1, 1, 1, 1, 1,
0.7071163, -1.030233, 4.953073, 1, 1, 1, 1, 1,
0.708004, 0.6722423, 0.2992013, 1, 1, 1, 1, 1,
0.7103021, 0.3128859, 0.3096158, 1, 1, 1, 1, 1,
0.7105771, 1.019478, 0.2769406, 1, 1, 1, 1, 1,
0.7107506, 0.6582831, 1.086627, 1, 1, 1, 1, 1,
0.71429, -0.1009192, 1.897908, 1, 1, 1, 1, 1,
0.7173545, -1.906684, 2.20699, 1, 1, 1, 1, 1,
0.7207487, 0.8559435, 1.761074, 1, 1, 1, 1, 1,
0.7324858, 1.229249, 1.150807, 1, 1, 1, 1, 1,
0.7450713, -0.4638313, 2.697792, 1, 1, 1, 1, 1,
0.7458414, -0.4183142, 2.237727, 0, 0, 1, 1, 1,
0.7475565, -1.894824, 1.268844, 1, 0, 0, 1, 1,
0.7499231, -1.922411, 3.445181, 1, 0, 0, 1, 1,
0.7550717, -0.4756933, 0.6174574, 1, 0, 0, 1, 1,
0.7595448, 0.05051459, 1.923151, 1, 0, 0, 1, 1,
0.7603508, -1.022104, 3.073776, 1, 0, 0, 1, 1,
0.7606066, 0.1426437, -0.09132206, 0, 0, 0, 1, 1,
0.7647148, -1.623392, 1.864347, 0, 0, 0, 1, 1,
0.7672157, -1.166037, 2.435089, 0, 0, 0, 1, 1,
0.7714708, 0.240548, 1.478924, 0, 0, 0, 1, 1,
0.7756659, -1.916441, 2.241902, 0, 0, 0, 1, 1,
0.7758362, -0.4081042, 2.656147, 0, 0, 0, 1, 1,
0.7759589, -0.5556973, 1.188453, 0, 0, 0, 1, 1,
0.776191, -0.5598187, 1.777803, 1, 1, 1, 1, 1,
0.7791774, -1.952485, 3.575027, 1, 1, 1, 1, 1,
0.7822903, -0.5085034, 3.514935, 1, 1, 1, 1, 1,
0.7829608, 2.117876, 1.937372, 1, 1, 1, 1, 1,
0.7830268, -0.7725645, 2.470142, 1, 1, 1, 1, 1,
0.7854362, -1.036639, 4.069257, 1, 1, 1, 1, 1,
0.802117, 0.2584827, 2.210845, 1, 1, 1, 1, 1,
0.8047093, -0.8024701, 3.072742, 1, 1, 1, 1, 1,
0.8048418, -0.04431832, 0.2917254, 1, 1, 1, 1, 1,
0.8070365, 0.9590158, 1.992669, 1, 1, 1, 1, 1,
0.8079656, -2.382792, 2.723719, 1, 1, 1, 1, 1,
0.8091667, 0.527207, 0.697255, 1, 1, 1, 1, 1,
0.8103508, -1.105805, 2.597274, 1, 1, 1, 1, 1,
0.8157366, -0.589515, 3.625864, 1, 1, 1, 1, 1,
0.8178822, 0.3255251, 0.5104591, 1, 1, 1, 1, 1,
0.8185763, -1.244964, 3.156285, 0, 0, 1, 1, 1,
0.8200941, 0.343102, 0.3410884, 1, 0, 0, 1, 1,
0.8202872, 0.3145774, 3.015476, 1, 0, 0, 1, 1,
0.8206462, -0.8239546, 3.616964, 1, 0, 0, 1, 1,
0.8224544, -1.041878, 3.354436, 1, 0, 0, 1, 1,
0.8261131, 1.582235, -0.4433397, 1, 0, 0, 1, 1,
0.8273845, 1.349346, -0.6589484, 0, 0, 0, 1, 1,
0.8289734, 0.1879589, 3.491227, 0, 0, 0, 1, 1,
0.8388527, 0.7703354, 0.6063725, 0, 0, 0, 1, 1,
0.8400918, -0.1176421, 2.535868, 0, 0, 0, 1, 1,
0.8452557, -0.269831, 2.517098, 0, 0, 0, 1, 1,
0.8556703, -0.4542182, 2.236252, 0, 0, 0, 1, 1,
0.8561773, -1.014423, 2.337225, 0, 0, 0, 1, 1,
0.8615953, -2.061273, 3.055107, 1, 1, 1, 1, 1,
0.8633347, -0.5218781, 1.339149, 1, 1, 1, 1, 1,
0.8667997, 0.3682015, 0.9871109, 1, 1, 1, 1, 1,
0.8813956, 0.2909314, 0.9864129, 1, 1, 1, 1, 1,
0.8872557, 1.405932, 1.406878, 1, 1, 1, 1, 1,
0.8949035, 0.5362138, -0.9422759, 1, 1, 1, 1, 1,
0.8978823, 0.08797015, 0.1276629, 1, 1, 1, 1, 1,
0.9006727, 1.379922, 0.2056639, 1, 1, 1, 1, 1,
0.910546, -0.4547194, 2.945117, 1, 1, 1, 1, 1,
0.9121215, -0.01843031, -0.4171465, 1, 1, 1, 1, 1,
0.913299, 0.09039713, -0.4248137, 1, 1, 1, 1, 1,
0.9163687, 0.07906846, -1.702624, 1, 1, 1, 1, 1,
0.9220344, 0.9980977, 0.6244215, 1, 1, 1, 1, 1,
0.9247279, -0.2233758, 1.804539, 1, 1, 1, 1, 1,
0.9293703, -0.9576115, 3.335204, 1, 1, 1, 1, 1,
0.9324117, -1.625409, 2.10064, 0, 0, 1, 1, 1,
0.9374363, 1.167097, 1.714038, 1, 0, 0, 1, 1,
0.9396524, 0.08255146, 1.301628, 1, 0, 0, 1, 1,
0.9440694, 0.1406161, 2.784433, 1, 0, 0, 1, 1,
0.9445944, 0.7947184, 2.1134, 1, 0, 0, 1, 1,
0.946459, -1.765584, 0.3560317, 1, 0, 0, 1, 1,
0.9562522, 1.127598, 0.4288198, 0, 0, 0, 1, 1,
0.9576867, -2.609475, 2.45083, 0, 0, 0, 1, 1,
0.9614666, 0.3104891, 1.95666, 0, 0, 0, 1, 1,
0.9650851, 0.1612042, 2.15071, 0, 0, 0, 1, 1,
0.969165, 0.3653427, 2.001477, 0, 0, 0, 1, 1,
0.9783089, -1.785973, 3.554679, 0, 0, 0, 1, 1,
0.9835086, 1.350073, -0.4712034, 0, 0, 0, 1, 1,
0.9844822, 0.5327737, 1.666312, 1, 1, 1, 1, 1,
0.9846594, -0.7993335, 3.549283, 1, 1, 1, 1, 1,
0.9861393, -1.289375, 4.062816, 1, 1, 1, 1, 1,
0.9865701, 0.2372319, 2.594958, 1, 1, 1, 1, 1,
0.9904142, -0.06383615, 1.82187, 1, 1, 1, 1, 1,
0.9971923, 0.8698919, 1.734465, 1, 1, 1, 1, 1,
0.9993142, -0.09299165, 2.163522, 1, 1, 1, 1, 1,
0.9995993, 0.2048145, 0.09796114, 1, 1, 1, 1, 1,
1.002358, -0.7575033, 3.567837, 1, 1, 1, 1, 1,
1.003099, 0.4873109, 0.4750329, 1, 1, 1, 1, 1,
1.004906, 1.284505, -0.7114899, 1, 1, 1, 1, 1,
1.010383, 0.5901632, 3.73605, 1, 1, 1, 1, 1,
1.013322, 0.751994, 1.336998, 1, 1, 1, 1, 1,
1.024167, 0.7033353, 1.836715, 1, 1, 1, 1, 1,
1.026428, 0.8504356, 0.5151452, 1, 1, 1, 1, 1,
1.042595, 0.0004144187, 1.69205, 0, 0, 1, 1, 1,
1.043531, 0.1680018, 0.7011209, 1, 0, 0, 1, 1,
1.047, 1.629439, -0.5598595, 1, 0, 0, 1, 1,
1.04845, 0.5750167, 0.7157254, 1, 0, 0, 1, 1,
1.054179, -0.1302152, 2.247979, 1, 0, 0, 1, 1,
1.058445, 0.5558658, 1.526212, 1, 0, 0, 1, 1,
1.0674, 1.86409, -0.2186936, 0, 0, 0, 1, 1,
1.075184, -0.5056005, -0.603022, 0, 0, 0, 1, 1,
1.08442, 1.236719, 1.307083, 0, 0, 0, 1, 1,
1.085286, -1.299372, 2.691094, 0, 0, 0, 1, 1,
1.089994, -1.71463, 1.195669, 0, 0, 0, 1, 1,
1.091702, -0.6629646, 3.442338, 0, 0, 0, 1, 1,
1.092064, 0.4075111, 0.9182868, 0, 0, 0, 1, 1,
1.094662, -1.212612, 2.47905, 1, 1, 1, 1, 1,
1.109986, 2.005426, -0.6435918, 1, 1, 1, 1, 1,
1.113224, 2.512399, 2.717112, 1, 1, 1, 1, 1,
1.11333, -1.198921, 2.64465, 1, 1, 1, 1, 1,
1.116178, -0.2521775, 0.3851394, 1, 1, 1, 1, 1,
1.130378, -0.1539411, 0.230769, 1, 1, 1, 1, 1,
1.134559, -0.2894245, 1.683537, 1, 1, 1, 1, 1,
1.138227, -1.939727, 0.8880104, 1, 1, 1, 1, 1,
1.143878, -1.206188, 3.53491, 1, 1, 1, 1, 1,
1.145492, -0.4800475, 1.337622, 1, 1, 1, 1, 1,
1.14747, 0.8221971, 0.1748793, 1, 1, 1, 1, 1,
1.149245, 0.9167071, 1.323204, 1, 1, 1, 1, 1,
1.151217, -0.7827417, 2.162778, 1, 1, 1, 1, 1,
1.153235, -0.2683634, 0.9394724, 1, 1, 1, 1, 1,
1.15679, 0.1458825, 2.40319, 1, 1, 1, 1, 1,
1.161816, -0.23102, 0.07801148, 0, 0, 1, 1, 1,
1.161842, -1.323052, 2.870903, 1, 0, 0, 1, 1,
1.164486, 1.186218, 0.0619282, 1, 0, 0, 1, 1,
1.167853, 0.1940113, -0.3286813, 1, 0, 0, 1, 1,
1.167941, -0.2644767, 2.375048, 1, 0, 0, 1, 1,
1.169481, -0.6912916, 3.166029, 1, 0, 0, 1, 1,
1.170439, 0.1332166, 1.807124, 0, 0, 0, 1, 1,
1.170664, -0.4608034, 3.259809, 0, 0, 0, 1, 1,
1.176274, 0.7539007, 0.5413233, 0, 0, 0, 1, 1,
1.177211, -0.7308058, 0.3380386, 0, 0, 0, 1, 1,
1.187803, 0.383074, 0.2635471, 0, 0, 0, 1, 1,
1.201475, 1.784509, -0.5174822, 0, 0, 0, 1, 1,
1.209611, 0.542614, 2.119809, 0, 0, 0, 1, 1,
1.211797, -0.7080819, 0.8945687, 1, 1, 1, 1, 1,
1.212997, 0.3372055, 0.4391446, 1, 1, 1, 1, 1,
1.21787, -1.011458, 1.00654, 1, 1, 1, 1, 1,
1.218951, 0.7650467, 1.133301, 1, 1, 1, 1, 1,
1.238548, -1.466461, 1.567656, 1, 1, 1, 1, 1,
1.239735, 0.1587504, 2.743491, 1, 1, 1, 1, 1,
1.246072, 0.1219066, 0.8282998, 1, 1, 1, 1, 1,
1.254434, 0.9707378, 0.6176698, 1, 1, 1, 1, 1,
1.262853, 0.7481285, 0.5248085, 1, 1, 1, 1, 1,
1.281619, 0.5083752, 2.052653, 1, 1, 1, 1, 1,
1.283895, -0.2876131, 2.386023, 1, 1, 1, 1, 1,
1.289727, 1.616965, -0.9094486, 1, 1, 1, 1, 1,
1.297075, 1.006349, 0.6057825, 1, 1, 1, 1, 1,
1.299418, 0.7324848, -0.8136518, 1, 1, 1, 1, 1,
1.300109, -0.2152149, 2.31559, 1, 1, 1, 1, 1,
1.320777, 0.3422331, 2.155711, 0, 0, 1, 1, 1,
1.320798, -0.7357861, 1.263672, 1, 0, 0, 1, 1,
1.332781, 2.222607, 0.2736463, 1, 0, 0, 1, 1,
1.33835, 1.645204, 0.1308919, 1, 0, 0, 1, 1,
1.338774, -0.657637, 1.299236, 1, 0, 0, 1, 1,
1.340957, -0.6101937, 1.028752, 1, 0, 0, 1, 1,
1.347775, -0.2310338, 0.5822099, 0, 0, 0, 1, 1,
1.358187, 1.02236, 0.2941763, 0, 0, 0, 1, 1,
1.37657, -0.6491245, -0.0263156, 0, 0, 0, 1, 1,
1.402411, 0.6078429, 2.399863, 0, 0, 0, 1, 1,
1.405352, -0.2175087, 1.157399, 0, 0, 0, 1, 1,
1.408083, 0.9472317, 1.460185, 0, 0, 0, 1, 1,
1.418846, 1.10304, 1.615516, 0, 0, 0, 1, 1,
1.422633, 0.05483918, 1.380861, 1, 1, 1, 1, 1,
1.42436, 0.07973288, 0.5306065, 1, 1, 1, 1, 1,
1.432328, 1.223843, 1.666702, 1, 1, 1, 1, 1,
1.435591, -0.9487779, 1.699756, 1, 1, 1, 1, 1,
1.442328, -1.118249, 1.127155, 1, 1, 1, 1, 1,
1.447742, -1.170382, 4.032398, 1, 1, 1, 1, 1,
1.449213, -0.8647816, 2.491916, 1, 1, 1, 1, 1,
1.458947, -1.536074, 2.911589, 1, 1, 1, 1, 1,
1.469764, -1.330564, 3.6004, 1, 1, 1, 1, 1,
1.476219, 0.4465476, 2.022722, 1, 1, 1, 1, 1,
1.478873, 0.575724, -0.2377405, 1, 1, 1, 1, 1,
1.523075, -2.422633, 3.160699, 1, 1, 1, 1, 1,
1.524451, 0.4475072, 1.682834, 1, 1, 1, 1, 1,
1.524602, 1.41791, 0.1860274, 1, 1, 1, 1, 1,
1.524719, 0.3675742, -0.6273522, 1, 1, 1, 1, 1,
1.541909, 1.170122, 2.566379, 0, 0, 1, 1, 1,
1.542077, -0.05051266, 3.255861, 1, 0, 0, 1, 1,
1.548423, -1.176821, 2.351213, 1, 0, 0, 1, 1,
1.555292, -0.8205693, 3.111135, 1, 0, 0, 1, 1,
1.580265, -0.2420189, 1.264677, 1, 0, 0, 1, 1,
1.582773, -0.9238982, 0.9241608, 1, 0, 0, 1, 1,
1.58983, 0.8538502, 3.464273, 0, 0, 0, 1, 1,
1.59739, -0.02163244, 1.73412, 0, 0, 0, 1, 1,
1.60221, -0.0505368, 0.7499989, 0, 0, 0, 1, 1,
1.603928, -2.20045, 3.321518, 0, 0, 0, 1, 1,
1.605165, 0.2068139, 0.6949329, 0, 0, 0, 1, 1,
1.607489, 0.8080019, 1.426398, 0, 0, 0, 1, 1,
1.614143, 2.6467, 0.930335, 0, 0, 0, 1, 1,
1.627852, -0.3769555, 2.718804, 1, 1, 1, 1, 1,
1.639307, 0.734314, 2.660521, 1, 1, 1, 1, 1,
1.662486, -0.8528015, 1.872417, 1, 1, 1, 1, 1,
1.675597, 0.613861, 2.149396, 1, 1, 1, 1, 1,
1.684012, 0.6172128, 0.6479575, 1, 1, 1, 1, 1,
1.703121, 0.7829712, 1.415255, 1, 1, 1, 1, 1,
1.706825, 1.458183, 0.01939123, 1, 1, 1, 1, 1,
1.709288, 1.411519, -1.011966, 1, 1, 1, 1, 1,
1.718769, 1.084761, 1.174482, 1, 1, 1, 1, 1,
1.739228, -0.2321891, 3.177247, 1, 1, 1, 1, 1,
1.766584, 0.479312, 1.253811, 1, 1, 1, 1, 1,
1.77229, -0.5016831, 2.511422, 1, 1, 1, 1, 1,
1.778184, -1.606696, 1.467957, 1, 1, 1, 1, 1,
1.786477, -0.6126367, 1.707416, 1, 1, 1, 1, 1,
1.813024, 0.9063197, -0.8599715, 1, 1, 1, 1, 1,
1.814264, 1.080403, 1.718737, 0, 0, 1, 1, 1,
1.832728, -0.4657038, 2.347486, 1, 0, 0, 1, 1,
1.837837, -0.9811746, 3.801507, 1, 0, 0, 1, 1,
1.840738, -0.9289161, 1.186008, 1, 0, 0, 1, 1,
1.84086, 1.397713, 2.382902, 1, 0, 0, 1, 1,
1.846414, -0.5241049, 2.25383, 1, 0, 0, 1, 1,
1.85636, 0.6657349, 2.935241, 0, 0, 0, 1, 1,
1.863262, -1.161013, 1.718274, 0, 0, 0, 1, 1,
1.871854, -0.7677765, 3.022645, 0, 0, 0, 1, 1,
1.878173, 0.4468488, -0.3996671, 0, 0, 0, 1, 1,
1.895308, 0.572766, 1.179443, 0, 0, 0, 1, 1,
1.936521, 0.2873783, 2.571034, 0, 0, 0, 1, 1,
1.98484, -1.008336, 2.581378, 0, 0, 0, 1, 1,
1.99036, 0.006933217, 0.04713465, 1, 1, 1, 1, 1,
1.999837, 1.253476, 0.8688546, 1, 1, 1, 1, 1,
2.002894, -0.1696251, 0.5251867, 1, 1, 1, 1, 1,
2.010132, 0.6422184, 0.4758385, 1, 1, 1, 1, 1,
2.012837, -1.045838, 2.356566, 1, 1, 1, 1, 1,
2.035639, 1.933547, 0.7908578, 1, 1, 1, 1, 1,
2.045461, 0.774469, -0.5083202, 1, 1, 1, 1, 1,
2.064603, 1.931385, 1.595612, 1, 1, 1, 1, 1,
2.068387, -0.3608316, 2.206054, 1, 1, 1, 1, 1,
2.073718, 1.114917, -1.464953, 1, 1, 1, 1, 1,
2.109816, -0.1302875, 1.094116, 1, 1, 1, 1, 1,
2.115318, -1.009409, 0.7012948, 1, 1, 1, 1, 1,
2.140375, -0.4998078, 1.950138, 1, 1, 1, 1, 1,
2.148111, 1.34133, 2.069259, 1, 1, 1, 1, 1,
2.151648, 0.2359105, 1.243061, 1, 1, 1, 1, 1,
2.152814, 1.001284, 0.9861766, 0, 0, 1, 1, 1,
2.154763, 2.504522, 0.1172743, 1, 0, 0, 1, 1,
2.180595, -0.5895836, 1.603575, 1, 0, 0, 1, 1,
2.207268, 1.155601, 1.309728, 1, 0, 0, 1, 1,
2.249567, 0.7331815, 0.4450318, 1, 0, 0, 1, 1,
2.275549, 2.536205, 1.431209, 1, 0, 0, 1, 1,
2.282036, -1.080202, 2.177953, 0, 0, 0, 1, 1,
2.3289, 2.038096, 1.639625, 0, 0, 0, 1, 1,
2.342887, 0.5035979, 3.02028, 0, 0, 0, 1, 1,
2.345516, 1.255589, -0.2650343, 0, 0, 0, 1, 1,
2.369448, 0.2109902, 2.003033, 0, 0, 0, 1, 1,
2.39081, -0.9598528, 2.320885, 0, 0, 0, 1, 1,
2.400278, 1.502832, 1.3606, 0, 0, 0, 1, 1,
2.400906, 0.5194811, 1.923225, 1, 1, 1, 1, 1,
2.466931, -1.050535, 3.116534, 1, 1, 1, 1, 1,
2.498098, -0.02497596, 1.496818, 1, 1, 1, 1, 1,
2.60171, -1.444492, 0.5841035, 1, 1, 1, 1, 1,
3.095364, 0.07346088, 2.152881, 1, 1, 1, 1, 1,
3.288385, 0.8872782, 3.183567, 1, 1, 1, 1, 1,
3.383497, 1.719177, 1.770153, 1, 1, 1, 1, 1
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
var radius = 9.550786;
var distance = 33.54673;
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
mvMatrix.translate( 0.1014698, -0.2232636, 0.08104563 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.54673);
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