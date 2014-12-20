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
-3.96806, -0.9534705, -2.087309, 1, 0, 0, 1,
-3.092299, 1.912954, -0.269494, 1, 0.007843138, 0, 1,
-2.955946, -1.009796, -1.522207, 1, 0.01176471, 0, 1,
-2.785669, -2.327358, -1.532544, 1, 0.01960784, 0, 1,
-2.63165, 0.1489064, -0.5504113, 1, 0.02352941, 0, 1,
-2.60168, -0.7567096, -2.911981, 1, 0.03137255, 0, 1,
-2.492003, 1.212814, -0.2874158, 1, 0.03529412, 0, 1,
-2.487791, -0.5800097, -3.213622, 1, 0.04313726, 0, 1,
-2.486045, -0.03248389, -0.837465, 1, 0.04705882, 0, 1,
-2.431661, -0.9208186, -1.032757, 1, 0.05490196, 0, 1,
-2.410163, -0.6389693, -0.07424076, 1, 0.05882353, 0, 1,
-2.304336, -0.4578546, -1.07733, 1, 0.06666667, 0, 1,
-2.2941, 1.22543, -3.431774, 1, 0.07058824, 0, 1,
-2.266832, -1.087802, -2.46396, 1, 0.07843138, 0, 1,
-2.212054, 0.121817, -2.127096, 1, 0.08235294, 0, 1,
-2.18066, -0.6280357, -0.3738675, 1, 0.09019608, 0, 1,
-2.146574, -0.9047874, -1.659483, 1, 0.09411765, 0, 1,
-2.143185, -1.340149, -1.057967, 1, 0.1019608, 0, 1,
-2.108715, -0.8231903, -2.549541, 1, 0.1098039, 0, 1,
-2.097283, 0.3118812, -3.889487, 1, 0.1137255, 0, 1,
-2.06993, 0.06982207, -1.843378, 1, 0.1215686, 0, 1,
-2.066084, 0.4572123, -2.612821, 1, 0.1254902, 0, 1,
-2.053099, -0.2575785, -3.758878, 1, 0.1333333, 0, 1,
-2.045502, 1.669382, -1.867195, 1, 0.1372549, 0, 1,
-2.019003, -1.208518, -1.052718, 1, 0.145098, 0, 1,
-2.003401, -0.7214668, -1.779831, 1, 0.1490196, 0, 1,
-1.996165, -0.9737589, -1.411223, 1, 0.1568628, 0, 1,
-1.968292, -1.414173, -2.800023, 1, 0.1607843, 0, 1,
-1.950974, 1.455843, -4.205164, 1, 0.1686275, 0, 1,
-1.935812, -0.4082631, -1.33885, 1, 0.172549, 0, 1,
-1.930709, 1.549939, -1.95146, 1, 0.1803922, 0, 1,
-1.847358, -1.16895, -2.905212, 1, 0.1843137, 0, 1,
-1.83089, -1.003084, -1.756714, 1, 0.1921569, 0, 1,
-1.825717, 1.162172, -2.964425, 1, 0.1960784, 0, 1,
-1.809717, 0.6553994, -2.2279, 1, 0.2039216, 0, 1,
-1.805676, -0.1092121, -2.712545, 1, 0.2117647, 0, 1,
-1.801645, 1.98236, 0.3388708, 1, 0.2156863, 0, 1,
-1.799502, 0.07035264, -1.787262, 1, 0.2235294, 0, 1,
-1.789837, -0.3862668, -3.243356, 1, 0.227451, 0, 1,
-1.78768, 0.6953872, -0.2313843, 1, 0.2352941, 0, 1,
-1.784168, -1.456711, -0.4205591, 1, 0.2392157, 0, 1,
-1.78214, -3.400959, -3.891006, 1, 0.2470588, 0, 1,
-1.776623, -0.4907685, -0.8478179, 1, 0.2509804, 0, 1,
-1.764223, -0.6877128, -2.248108, 1, 0.2588235, 0, 1,
-1.756927, 0.7521476, -0.1628422, 1, 0.2627451, 0, 1,
-1.746509, -1.540159, -2.130966, 1, 0.2705882, 0, 1,
-1.740956, 0.8138618, -0.1310723, 1, 0.2745098, 0, 1,
-1.724381, -0.7474858, -1.419297, 1, 0.282353, 0, 1,
-1.711174, -0.1098187, -2.567261, 1, 0.2862745, 0, 1,
-1.699008, -0.3406514, -3.147099, 1, 0.2941177, 0, 1,
-1.683079, 2.229816, -1.599705, 1, 0.3019608, 0, 1,
-1.65491, -0.6730439, -2.746823, 1, 0.3058824, 0, 1,
-1.649114, -0.1628439, -0.488153, 1, 0.3137255, 0, 1,
-1.624663, -0.4959878, -2.428138, 1, 0.3176471, 0, 1,
-1.605827, 0.4220124, 0.3238243, 1, 0.3254902, 0, 1,
-1.605692, -0.04673102, -0.9033039, 1, 0.3294118, 0, 1,
-1.58397, 2.028466, -1.940777, 1, 0.3372549, 0, 1,
-1.564899, 0.8324335, -0.7429392, 1, 0.3411765, 0, 1,
-1.561865, -0.2154821, -2.447405, 1, 0.3490196, 0, 1,
-1.548675, 0.7235711, 0.09137676, 1, 0.3529412, 0, 1,
-1.540587, 1.268867, -2.188932, 1, 0.3607843, 0, 1,
-1.537223, -0.4430065, -2.351382, 1, 0.3647059, 0, 1,
-1.536694, 1.353017, -1.123772, 1, 0.372549, 0, 1,
-1.529475, -0.6228081, -1.445165, 1, 0.3764706, 0, 1,
-1.508868, -2.025882, -2.801065, 1, 0.3843137, 0, 1,
-1.504111, 0.3173364, -1.869096, 1, 0.3882353, 0, 1,
-1.484087, -2.162682, -2.139968, 1, 0.3960784, 0, 1,
-1.480856, 0.2745246, -0.30521, 1, 0.4039216, 0, 1,
-1.477591, 0.139528, -1.606292, 1, 0.4078431, 0, 1,
-1.477578, -1.36627, -3.1287, 1, 0.4156863, 0, 1,
-1.473035, -2.260265, -1.84068, 1, 0.4196078, 0, 1,
-1.472741, 0.680638, -0.8170046, 1, 0.427451, 0, 1,
-1.469971, 2.62579, -1.12986, 1, 0.4313726, 0, 1,
-1.469774, -0.1109054, -0.5175628, 1, 0.4392157, 0, 1,
-1.469676, -0.1932337, -1.137854, 1, 0.4431373, 0, 1,
-1.46553, -0.2117446, -2.245582, 1, 0.4509804, 0, 1,
-1.454219, -0.8122221, -1.317779, 1, 0.454902, 0, 1,
-1.439068, -0.3826042, 0.2392446, 1, 0.4627451, 0, 1,
-1.436074, -0.1194967, -1.934066, 1, 0.4666667, 0, 1,
-1.435863, 1.71117, -0.9319742, 1, 0.4745098, 0, 1,
-1.43449, -0.1872058, -2.979631, 1, 0.4784314, 0, 1,
-1.429218, 1.18472, -2.699749, 1, 0.4862745, 0, 1,
-1.426597, -0.3506622, -1.132003, 1, 0.4901961, 0, 1,
-1.421562, 0.299011, -2.083209, 1, 0.4980392, 0, 1,
-1.421347, -0.8007173, -1.134679, 1, 0.5058824, 0, 1,
-1.4155, -1.136224, -3.802991, 1, 0.509804, 0, 1,
-1.406506, 1.715431, -0.3985607, 1, 0.5176471, 0, 1,
-1.40115, -0.2804652, -1.055546, 1, 0.5215687, 0, 1,
-1.398844, -0.6711147, -3.432931, 1, 0.5294118, 0, 1,
-1.397737, 0.4668709, -1.284564, 1, 0.5333334, 0, 1,
-1.389784, 0.4493756, -1.525997, 1, 0.5411765, 0, 1,
-1.362101, 0.3030257, -2.693682, 1, 0.5450981, 0, 1,
-1.342914, -0.02837675, -2.305553, 1, 0.5529412, 0, 1,
-1.341994, -0.5362924, -1.04682, 1, 0.5568628, 0, 1,
-1.324813, -0.4711493, -2.119524, 1, 0.5647059, 0, 1,
-1.319809, 1.946305, -1.115021, 1, 0.5686275, 0, 1,
-1.313568, 0.8301333, -0.6074676, 1, 0.5764706, 0, 1,
-1.306418, 1.746737, -1.053916, 1, 0.5803922, 0, 1,
-1.302114, -0.01647426, -1.409162, 1, 0.5882353, 0, 1,
-1.294786, 0.9406044, -1.209, 1, 0.5921569, 0, 1,
-1.287483, 0.6559012, -0.6357467, 1, 0.6, 0, 1,
-1.284992, 0.6994231, -0.8492023, 1, 0.6078432, 0, 1,
-1.271753, 1.076656, -0.1191067, 1, 0.6117647, 0, 1,
-1.269395, 0.6524037, -1.673163, 1, 0.6196079, 0, 1,
-1.269006, 0.9996659, -2.184675, 1, 0.6235294, 0, 1,
-1.262802, -1.09003, -2.143654, 1, 0.6313726, 0, 1,
-1.254806, 0.2555975, -3.751186, 1, 0.6352941, 0, 1,
-1.238125, -0.6021457, -2.384101, 1, 0.6431373, 0, 1,
-1.236585, -0.558682, -2.08757, 1, 0.6470588, 0, 1,
-1.234367, -0.7806939, -1.344014, 1, 0.654902, 0, 1,
-1.224113, 0.2438163, -1.566198, 1, 0.6588235, 0, 1,
-1.219667, 0.5301028, 0.8924724, 1, 0.6666667, 0, 1,
-1.213758, -1.719409, -1.95153, 1, 0.6705883, 0, 1,
-1.203423, 1.405902, 0.7835891, 1, 0.6784314, 0, 1,
-1.182867, -0.1063883, -1.324919, 1, 0.682353, 0, 1,
-1.170406, 1.711617, -0.3333387, 1, 0.6901961, 0, 1,
-1.169103, 0.3781969, -1.258146, 1, 0.6941177, 0, 1,
-1.16598, 0.1709044, -2.055922, 1, 0.7019608, 0, 1,
-1.16332, 0.007203494, 0.695873, 1, 0.7098039, 0, 1,
-1.161288, -0.3995126, -3.565238, 1, 0.7137255, 0, 1,
-1.15699, 0.8199841, -0.1936256, 1, 0.7215686, 0, 1,
-1.148915, 0.8186361, -1.539559, 1, 0.7254902, 0, 1,
-1.147109, -0.5955448, -0.7294238, 1, 0.7333333, 0, 1,
-1.145658, -0.2734812, -1.110162, 1, 0.7372549, 0, 1,
-1.144184, 0.285307, 1.022508, 1, 0.7450981, 0, 1,
-1.13617, -1.404537, -5.144188, 1, 0.7490196, 0, 1,
-1.128031, 1.201213, -2.175996, 1, 0.7568628, 0, 1,
-1.125716, -1.097204, -3.597005, 1, 0.7607843, 0, 1,
-1.118771, 0.9591533, -1.64493, 1, 0.7686275, 0, 1,
-1.093672, -0.7745489, -1.560188, 1, 0.772549, 0, 1,
-1.083347, 0.7482304, -1.813742, 1, 0.7803922, 0, 1,
-1.080215, -0.1895252, -2.378258, 1, 0.7843137, 0, 1,
-1.079853, -0.3159441, -1.250497, 1, 0.7921569, 0, 1,
-1.079092, 1.425974, -1.306363, 1, 0.7960784, 0, 1,
-1.076321, -0.8244325, -1.669545, 1, 0.8039216, 0, 1,
-1.076137, -0.703856, -0.3074465, 1, 0.8117647, 0, 1,
-1.072661, -2.170383, -4.734998, 1, 0.8156863, 0, 1,
-1.069288, -0.1711166, -3.129548, 1, 0.8235294, 0, 1,
-1.068242, 0.3603491, -1.364028, 1, 0.827451, 0, 1,
-1.065315, -1.179714, -2.404332, 1, 0.8352941, 0, 1,
-1.064691, 0.2929718, 0.9455074, 1, 0.8392157, 0, 1,
-1.053684, -0.3973551, -1.158503, 1, 0.8470588, 0, 1,
-1.045368, -1.451408, -3.326472, 1, 0.8509804, 0, 1,
-1.044605, -0.03122782, -2.633128, 1, 0.8588235, 0, 1,
-1.03872, -1.620028, -3.953854, 1, 0.8627451, 0, 1,
-1.032863, -0.9872226, -1.184259, 1, 0.8705882, 0, 1,
-1.028964, 0.7448133, -0.9071172, 1, 0.8745098, 0, 1,
-1.022904, 0.9778729, -0.4709686, 1, 0.8823529, 0, 1,
-1.022427, 0.05595441, -3.059932, 1, 0.8862745, 0, 1,
-1.02224, -0.595509, -0.4585436, 1, 0.8941177, 0, 1,
-1.015426, -0.1485083, -0.2870249, 1, 0.8980392, 0, 1,
-1.009583, -0.4212379, -1.481502, 1, 0.9058824, 0, 1,
-1.007531, 0.8242753, 0.5938174, 1, 0.9137255, 0, 1,
-1.002353, -0.03178133, -2.022707, 1, 0.9176471, 0, 1,
-1.001487, -1.078271, -3.087238, 1, 0.9254902, 0, 1,
-1.000994, 0.06346621, -0.3689692, 1, 0.9294118, 0, 1,
-0.9992455, -1.023329, -1.488213, 1, 0.9372549, 0, 1,
-0.997813, 0.2552533, -1.163143, 1, 0.9411765, 0, 1,
-0.9970331, -1.903304, -0.853309, 1, 0.9490196, 0, 1,
-0.9833757, 0.6145872, -2.276066, 1, 0.9529412, 0, 1,
-0.9787574, -1.030696, -2.481168, 1, 0.9607843, 0, 1,
-0.9771326, -0.7816003, -2.356755, 1, 0.9647059, 0, 1,
-0.9720822, 1.108849, 0.3903422, 1, 0.972549, 0, 1,
-0.9689689, -0.04240235, -0.7964436, 1, 0.9764706, 0, 1,
-0.9673668, -1.511476, -2.503728, 1, 0.9843137, 0, 1,
-0.951837, 0.8537257, -1.587236, 1, 0.9882353, 0, 1,
-0.95156, 0.1273285, -2.868236, 1, 0.9960784, 0, 1,
-0.9446824, -0.9390739, -3.134378, 0.9960784, 1, 0, 1,
-0.9443208, 0.380639, -0.4463037, 0.9921569, 1, 0, 1,
-0.9420124, -0.7649559, -1.899637, 0.9843137, 1, 0, 1,
-0.9364777, -1.295198, -0.6775715, 0.9803922, 1, 0, 1,
-0.9207171, 1.364245, -1.320462, 0.972549, 1, 0, 1,
-0.9177268, 1.565035, 0.6214965, 0.9686275, 1, 0, 1,
-0.90943, -2.738473, -2.75507, 0.9607843, 1, 0, 1,
-0.9083091, 1.762913, 0.6178692, 0.9568627, 1, 0, 1,
-0.9045252, -1.130254, -1.544373, 0.9490196, 1, 0, 1,
-0.8965595, 0.1548513, -1.953351, 0.945098, 1, 0, 1,
-0.8927597, 1.008786, 0.05213661, 0.9372549, 1, 0, 1,
-0.8889295, 0.2476306, -1.831192, 0.9333333, 1, 0, 1,
-0.8848136, 1.901423, 0.09034453, 0.9254902, 1, 0, 1,
-0.8840894, 0.5941485, -0.9544176, 0.9215686, 1, 0, 1,
-0.8824205, 0.5011736, -2.965351, 0.9137255, 1, 0, 1,
-0.8788541, -0.8991932, -3.423405, 0.9098039, 1, 0, 1,
-0.8761562, 1.310362, 0.8590856, 0.9019608, 1, 0, 1,
-0.8746445, 0.3398183, -0.3777574, 0.8941177, 1, 0, 1,
-0.8734838, -0.2735136, -2.005011, 0.8901961, 1, 0, 1,
-0.8717829, -1.39649, -3.881817, 0.8823529, 1, 0, 1,
-0.8700601, 0.7556785, -1.077163, 0.8784314, 1, 0, 1,
-0.8686188, 1.969443, -1.146669, 0.8705882, 1, 0, 1,
-0.8659286, 1.7561, -2.771792, 0.8666667, 1, 0, 1,
-0.8552845, -0.04574639, -3.018733, 0.8588235, 1, 0, 1,
-0.8537593, 1.142166, -0.2658601, 0.854902, 1, 0, 1,
-0.8529628, -0.8810263, -3.646323, 0.8470588, 1, 0, 1,
-0.8380057, 1.052828, 0.6036389, 0.8431373, 1, 0, 1,
-0.8346464, 2.020368, 0.05393964, 0.8352941, 1, 0, 1,
-0.8325115, 0.7194555, -0.7254316, 0.8313726, 1, 0, 1,
-0.8316584, 3.278319, -0.6139208, 0.8235294, 1, 0, 1,
-0.8117623, 0.2193856, -1.453124, 0.8196079, 1, 0, 1,
-0.8058483, 0.377303, 0.01038753, 0.8117647, 1, 0, 1,
-0.8036586, 1.277088, 1.674814, 0.8078431, 1, 0, 1,
-0.8035836, 1.655538, -1.173393, 0.8, 1, 0, 1,
-0.8034844, -2.424903, -1.533839, 0.7921569, 1, 0, 1,
-0.8025544, 0.1311343, 0.4408577, 0.7882353, 1, 0, 1,
-0.8009791, -1.715047, -3.295167, 0.7803922, 1, 0, 1,
-0.7930546, -1.339371, -2.162855, 0.7764706, 1, 0, 1,
-0.7903015, 0.2149305, -0.2763716, 0.7686275, 1, 0, 1,
-0.7889341, 0.160122, -1.0838, 0.7647059, 1, 0, 1,
-0.7870142, -1.716195, -0.4333748, 0.7568628, 1, 0, 1,
-0.7808498, -0.2610005, -2.975483, 0.7529412, 1, 0, 1,
-0.7757988, 0.0338221, -1.442947, 0.7450981, 1, 0, 1,
-0.7757543, -1.065084, -0.9413086, 0.7411765, 1, 0, 1,
-0.7663501, 0.1336604, -1.53411, 0.7333333, 1, 0, 1,
-0.7577571, -2.017373, -1.836887, 0.7294118, 1, 0, 1,
-0.752374, 0.8220345, -0.3692013, 0.7215686, 1, 0, 1,
-0.7505202, 0.8802541, 1.133174, 0.7176471, 1, 0, 1,
-0.7462273, 0.2942167, -1.408071, 0.7098039, 1, 0, 1,
-0.7451767, -0.8178214, -3.36506, 0.7058824, 1, 0, 1,
-0.7406511, 0.8960525, 0.6573926, 0.6980392, 1, 0, 1,
-0.7391083, -1.15122, -3.057589, 0.6901961, 1, 0, 1,
-0.7367274, -0.6240656, -2.240991, 0.6862745, 1, 0, 1,
-0.7340341, -0.4566507, -4.50004, 0.6784314, 1, 0, 1,
-0.7334452, -0.2682249, -3.120521, 0.6745098, 1, 0, 1,
-0.7284766, -1.339393, -2.972732, 0.6666667, 1, 0, 1,
-0.7226477, -1.263666, -2.154403, 0.6627451, 1, 0, 1,
-0.7145633, 0.4973862, 0.3506502, 0.654902, 1, 0, 1,
-0.7121156, 0.3428632, -1.609824, 0.6509804, 1, 0, 1,
-0.7097733, -0.8096868, -1.492529, 0.6431373, 1, 0, 1,
-0.7084591, -1.201419, -3.288558, 0.6392157, 1, 0, 1,
-0.7045665, -0.2234775, -2.678658, 0.6313726, 1, 0, 1,
-0.7004942, -0.647211, -3.461898, 0.627451, 1, 0, 1,
-0.6976463, 0.405109, -0.1033887, 0.6196079, 1, 0, 1,
-0.6874809, -1.249729, -1.057992, 0.6156863, 1, 0, 1,
-0.6868197, -0.7310314, -2.093877, 0.6078432, 1, 0, 1,
-0.6849632, -0.8300544, -2.125098, 0.6039216, 1, 0, 1,
-0.6843196, -1.057395, -2.074198, 0.5960785, 1, 0, 1,
-0.681845, 1.804848, -0.6733868, 0.5882353, 1, 0, 1,
-0.6784356, 0.05848799, -2.65687, 0.5843138, 1, 0, 1,
-0.6737773, 0.5606356, -1.765506, 0.5764706, 1, 0, 1,
-0.6681677, 0.342475, -0.4147538, 0.572549, 1, 0, 1,
-0.6671431, 0.1800725, -2.095357, 0.5647059, 1, 0, 1,
-0.6648412, -0.9079731, -2.631886, 0.5607843, 1, 0, 1,
-0.6644531, -0.6755179, -2.503688, 0.5529412, 1, 0, 1,
-0.664259, -1.126484, -2.180592, 0.5490196, 1, 0, 1,
-0.6597137, 0.8289682, -2.18827, 0.5411765, 1, 0, 1,
-0.65803, 0.2655202, -0.2784779, 0.5372549, 1, 0, 1,
-0.6541876, -0.6284317, -1.449158, 0.5294118, 1, 0, 1,
-0.6404812, -0.6330271, -0.4685002, 0.5254902, 1, 0, 1,
-0.6391848, 0.09134282, -3.844171, 0.5176471, 1, 0, 1,
-0.6355114, -2.053841, -4.385584, 0.5137255, 1, 0, 1,
-0.6346473, -0.116505, -1.848484, 0.5058824, 1, 0, 1,
-0.6343393, -1.505525, -4.1042, 0.5019608, 1, 0, 1,
-0.6337077, 0.2204103, -1.634834, 0.4941176, 1, 0, 1,
-0.6323544, 0.2196507, -2.687368, 0.4862745, 1, 0, 1,
-0.6306768, -2.157539, -3.991968, 0.4823529, 1, 0, 1,
-0.6236601, -0.07511285, -2.969994, 0.4745098, 1, 0, 1,
-0.6220191, 0.8542543, -0.1944119, 0.4705882, 1, 0, 1,
-0.6183965, 0.5232105, -0.521407, 0.4627451, 1, 0, 1,
-0.6163371, -0.7824301, -5.133399, 0.4588235, 1, 0, 1,
-0.6126803, -0.3952573, -2.188727, 0.4509804, 1, 0, 1,
-0.6073182, 0.8156181, -1.033349, 0.4470588, 1, 0, 1,
-0.60497, -2.241765, -3.391162, 0.4392157, 1, 0, 1,
-0.6046419, -0.8044933, -1.293833, 0.4352941, 1, 0, 1,
-0.5966265, 0.3810412, -2.12703, 0.427451, 1, 0, 1,
-0.5940324, -0.9118387, -2.636711, 0.4235294, 1, 0, 1,
-0.5886958, 0.1465489, -2.043829, 0.4156863, 1, 0, 1,
-0.5863813, 1.747424, -2.093848, 0.4117647, 1, 0, 1,
-0.58229, 0.963025, -0.1055395, 0.4039216, 1, 0, 1,
-0.5778549, -1.069818, -3.204907, 0.3960784, 1, 0, 1,
-0.5777483, 1.084527, -0.6564406, 0.3921569, 1, 0, 1,
-0.5760348, -0.3603888, -3.413808, 0.3843137, 1, 0, 1,
-0.5737886, -0.6880414, -2.150918, 0.3803922, 1, 0, 1,
-0.5711559, 0.3734959, -1.132471, 0.372549, 1, 0, 1,
-0.5691733, -0.9126688, -3.557835, 0.3686275, 1, 0, 1,
-0.5679922, 0.2093654, -1.484559, 0.3607843, 1, 0, 1,
-0.5674832, -0.7461986, -2.74127, 0.3568628, 1, 0, 1,
-0.5613497, -1.095564, -0.8639221, 0.3490196, 1, 0, 1,
-0.5610435, -1.739513, -1.864842, 0.345098, 1, 0, 1,
-0.5582664, 0.894394, -0.2812803, 0.3372549, 1, 0, 1,
-0.5579966, -2.206656, -3.94489, 0.3333333, 1, 0, 1,
-0.5576264, -2.173711, -2.688227, 0.3254902, 1, 0, 1,
-0.5542959, 1.393422, 0.02765246, 0.3215686, 1, 0, 1,
-0.5537367, -1.015411, -3.563429, 0.3137255, 1, 0, 1,
-0.5527538, -0.06587549, -0.9450977, 0.3098039, 1, 0, 1,
-0.5519547, -1.700049, -3.652398, 0.3019608, 1, 0, 1,
-0.549661, 0.2435918, -0.5194374, 0.2941177, 1, 0, 1,
-0.5490375, -1.506576, -1.781026, 0.2901961, 1, 0, 1,
-0.548497, 0.3836471, -0.07194427, 0.282353, 1, 0, 1,
-0.5427654, -2.917956, -2.644744, 0.2784314, 1, 0, 1,
-0.5409831, -1.514542, -2.495253, 0.2705882, 1, 0, 1,
-0.5405684, -0.7173321, -2.7622, 0.2666667, 1, 0, 1,
-0.5391758, -0.5187528, -1.277088, 0.2588235, 1, 0, 1,
-0.5389479, -1.463261, -3.326246, 0.254902, 1, 0, 1,
-0.5344051, -0.550784, -2.5932, 0.2470588, 1, 0, 1,
-0.5324971, 0.04545365, -0.691362, 0.2431373, 1, 0, 1,
-0.5277505, 1.319051, -0.4590452, 0.2352941, 1, 0, 1,
-0.5238611, -0.4398595, -1.040893, 0.2313726, 1, 0, 1,
-0.5150854, 0.1964749, -0.6066038, 0.2235294, 1, 0, 1,
-0.514304, -0.9708009, -3.649607, 0.2196078, 1, 0, 1,
-0.5137145, -0.9535504, -0.8126627, 0.2117647, 1, 0, 1,
-0.5134209, 0.2700631, -1.829396, 0.2078431, 1, 0, 1,
-0.5133882, 0.1110609, 0.3875348, 0.2, 1, 0, 1,
-0.5132362, 0.6928046, -1.671672, 0.1921569, 1, 0, 1,
-0.5104421, 0.5946066, -2.440934, 0.1882353, 1, 0, 1,
-0.5088063, -0.9457694, -2.443243, 0.1803922, 1, 0, 1,
-0.5046385, 0.05761852, -0.6862816, 0.1764706, 1, 0, 1,
-0.5044807, -1.346781, -1.295791, 0.1686275, 1, 0, 1,
-0.502425, -1.223878, -3.456148, 0.1647059, 1, 0, 1,
-0.5014834, -0.3878166, -2.352592, 0.1568628, 1, 0, 1,
-0.4973858, -0.9768534, -2.117636, 0.1529412, 1, 0, 1,
-0.4938684, -0.5561461, -1.989603, 0.145098, 1, 0, 1,
-0.4930835, 1.555264, -1.528716, 0.1411765, 1, 0, 1,
-0.4920961, -1.00338, -3.481423, 0.1333333, 1, 0, 1,
-0.4893733, 0.1542295, 0.2903111, 0.1294118, 1, 0, 1,
-0.4860342, -0.05387869, -0.5459573, 0.1215686, 1, 0, 1,
-0.4817918, 0.0395568, -1.565192, 0.1176471, 1, 0, 1,
-0.4790665, 0.1837766, -1.312459, 0.1098039, 1, 0, 1,
-0.4779999, -0.1929665, -0.6985632, 0.1058824, 1, 0, 1,
-0.4755376, -0.2277431, -0.375708, 0.09803922, 1, 0, 1,
-0.4744942, -1.828997, -2.887796, 0.09019608, 1, 0, 1,
-0.4737357, 0.5121934, -0.01579395, 0.08627451, 1, 0, 1,
-0.4685881, -0.3169496, -0.7460896, 0.07843138, 1, 0, 1,
-0.4644922, -1.22289, -4.071814, 0.07450981, 1, 0, 1,
-0.4605224, -1.587898, -2.299989, 0.06666667, 1, 0, 1,
-0.4589081, -0.3393678, -2.301871, 0.0627451, 1, 0, 1,
-0.4572449, -1.752226, -4.592588, 0.05490196, 1, 0, 1,
-0.4560853, -1.634596, -3.017128, 0.05098039, 1, 0, 1,
-0.4536584, -0.397547, -4.183309, 0.04313726, 1, 0, 1,
-0.4475986, 1.124389, -0.7624668, 0.03921569, 1, 0, 1,
-0.4452655, 2.260348, -0.681238, 0.03137255, 1, 0, 1,
-0.4432466, 1.935243, -0.5412577, 0.02745098, 1, 0, 1,
-0.4427264, 0.2637167, -1.357384, 0.01960784, 1, 0, 1,
-0.4391195, -0.3560123, -2.394649, 0.01568628, 1, 0, 1,
-0.4369294, -0.1523968, -3.314151, 0.007843138, 1, 0, 1,
-0.4331427, 0.1234189, 1.268748, 0.003921569, 1, 0, 1,
-0.4302921, 0.5059683, -0.06885904, 0, 1, 0.003921569, 1,
-0.4261602, -2.400312, -1.796247, 0, 1, 0.01176471, 1,
-0.4219151, -0.6992952, -2.68707, 0, 1, 0.01568628, 1,
-0.4200388, 0.1560357, -0.4687685, 0, 1, 0.02352941, 1,
-0.4194219, -1.191845, -1.713429, 0, 1, 0.02745098, 1,
-0.4183138, -0.1635306, -1.986554, 0, 1, 0.03529412, 1,
-0.4172445, -0.1366614, -2.073113, 0, 1, 0.03921569, 1,
-0.415763, 0.2753307, 1.303977, 0, 1, 0.04705882, 1,
-0.4144211, -0.8021404, -2.602684, 0, 1, 0.05098039, 1,
-0.4118724, -1.084522, -3.49419, 0, 1, 0.05882353, 1,
-0.4100515, 0.3504991, -0.03902761, 0, 1, 0.0627451, 1,
-0.4099106, -0.1494588, -1.561771, 0, 1, 0.07058824, 1,
-0.4033474, 1.44741, 0.3960676, 0, 1, 0.07450981, 1,
-0.4029039, 1.228761, 1.613738, 0, 1, 0.08235294, 1,
-0.4004791, 1.288609, -0.6936121, 0, 1, 0.08627451, 1,
-0.3974144, -0.7994139, -3.437822, 0, 1, 0.09411765, 1,
-0.3952559, -1.330727, -2.48579, 0, 1, 0.1019608, 1,
-0.3920127, 1.62895, -1.260434, 0, 1, 0.1058824, 1,
-0.3918415, -1.917762, -2.206557, 0, 1, 0.1137255, 1,
-0.389991, 1.114619, 0.6285158, 0, 1, 0.1176471, 1,
-0.3823445, 0.9898717, -0.3884121, 0, 1, 0.1254902, 1,
-0.3822759, 0.2856375, -2.436028, 0, 1, 0.1294118, 1,
-0.37571, 0.438405, -0.7559151, 0, 1, 0.1372549, 1,
-0.3724269, 2.30704, 0.9489715, 0, 1, 0.1411765, 1,
-0.3666869, 1.415005, -0.8461987, 0, 1, 0.1490196, 1,
-0.3651998, -0.834445, -3.95981, 0, 1, 0.1529412, 1,
-0.3613884, -0.06106294, -0.7932246, 0, 1, 0.1607843, 1,
-0.3606785, 0.6552761, -1.237513, 0, 1, 0.1647059, 1,
-0.3605119, -0.5158833, -2.046667, 0, 1, 0.172549, 1,
-0.3568027, 1.487729, -1.807255, 0, 1, 0.1764706, 1,
-0.3541667, 2.014956, 0.07147537, 0, 1, 0.1843137, 1,
-0.3541414, -0.9927428, -1.857892, 0, 1, 0.1882353, 1,
-0.3530988, 0.750392, 0.1588401, 0, 1, 0.1960784, 1,
-0.3492002, -0.3217076, -4.308689, 0, 1, 0.2039216, 1,
-0.3467429, -0.3232021, -3.16256, 0, 1, 0.2078431, 1,
-0.3440892, 0.04803393, -2.225294, 0, 1, 0.2156863, 1,
-0.343829, -0.30612, -0.8601349, 0, 1, 0.2196078, 1,
-0.3379249, 0.7843339, 0.614076, 0, 1, 0.227451, 1,
-0.3377421, 0.5600787, -0.7044626, 0, 1, 0.2313726, 1,
-0.3367417, 1.428181, -1.990235, 0, 1, 0.2392157, 1,
-0.3353992, 0.7284811, 0.06739736, 0, 1, 0.2431373, 1,
-0.3338055, -1.222142, -3.335025, 0, 1, 0.2509804, 1,
-0.3307478, -0.9965045, -3.873549, 0, 1, 0.254902, 1,
-0.3269635, -0.417712, -2.440149, 0, 1, 0.2627451, 1,
-0.3260807, 1.070087, -1.265821, 0, 1, 0.2666667, 1,
-0.3247758, 0.4865564, -0.8707836, 0, 1, 0.2745098, 1,
-0.3219234, -0.01143363, -0.8676019, 0, 1, 0.2784314, 1,
-0.3186191, 1.824865, -2.172048, 0, 1, 0.2862745, 1,
-0.3177263, 0.5199641, 0.1077692, 0, 1, 0.2901961, 1,
-0.3144482, -0.5355209, -1.894956, 0, 1, 0.2980392, 1,
-0.3140061, 1.634584, 0.2920209, 0, 1, 0.3058824, 1,
-0.3112263, -0.1201298, -2.76211, 0, 1, 0.3098039, 1,
-0.3064648, 0.7109375, -0.7585434, 0, 1, 0.3176471, 1,
-0.3060201, -0.2039885, -1.312725, 0, 1, 0.3215686, 1,
-0.3053552, 0.3462993, 1.06205, 0, 1, 0.3294118, 1,
-0.2985437, 0.5627008, -0.3869436, 0, 1, 0.3333333, 1,
-0.2962082, 0.2017462, -0.8030041, 0, 1, 0.3411765, 1,
-0.2935903, 0.5543358, 0.9026349, 0, 1, 0.345098, 1,
-0.2804219, 0.05248896, -1.965469, 0, 1, 0.3529412, 1,
-0.2796243, 0.8796387, -0.923641, 0, 1, 0.3568628, 1,
-0.279382, 0.9221989, 0.7448279, 0, 1, 0.3647059, 1,
-0.2590235, -0.09144152, -1.853731, 0, 1, 0.3686275, 1,
-0.258193, 1.854118, 1.126536, 0, 1, 0.3764706, 1,
-0.2578081, -1.290941, -2.216406, 0, 1, 0.3803922, 1,
-0.2570241, 2.114236, 0.1740263, 0, 1, 0.3882353, 1,
-0.2564705, 0.7768073, -0.7804196, 0, 1, 0.3921569, 1,
-0.2470906, 1.525472, -1.373094, 0, 1, 0.4, 1,
-0.2416513, 2.005791, 0.4723297, 0, 1, 0.4078431, 1,
-0.2395229, -0.2840831, -2.022163, 0, 1, 0.4117647, 1,
-0.238311, 0.562177, -1.726917, 0, 1, 0.4196078, 1,
-0.2324802, -0.561856, -3.362345, 0, 1, 0.4235294, 1,
-0.2310894, 0.7134003, -0.8632384, 0, 1, 0.4313726, 1,
-0.2302925, 0.01884579, 0.3828273, 0, 1, 0.4352941, 1,
-0.2301828, 0.8979308, 1.705387, 0, 1, 0.4431373, 1,
-0.2294487, -0.4448681, -2.571184, 0, 1, 0.4470588, 1,
-0.2270692, 0.7602683, 0.05439123, 0, 1, 0.454902, 1,
-0.2255901, 0.702011, -1.157547, 0, 1, 0.4588235, 1,
-0.2251665, -0.801751, -3.43019, 0, 1, 0.4666667, 1,
-0.2236545, -0.2202074, -1.025477, 0, 1, 0.4705882, 1,
-0.2219401, 0.5446501, -0.6573294, 0, 1, 0.4784314, 1,
-0.2195842, -0.2468522, -2.440135, 0, 1, 0.4823529, 1,
-0.2157329, 0.2915584, -0.110687, 0, 1, 0.4901961, 1,
-0.214857, 0.3936083, -0.211348, 0, 1, 0.4941176, 1,
-0.2131754, 0.06588054, -2.177066, 0, 1, 0.5019608, 1,
-0.2047989, 0.3701953, -0.3783903, 0, 1, 0.509804, 1,
-0.2043279, -0.2791863, -2.854023, 0, 1, 0.5137255, 1,
-0.1916991, 0.09606894, -0.5488914, 0, 1, 0.5215687, 1,
-0.1772461, 0.7319835, 1.187633, 0, 1, 0.5254902, 1,
-0.1765685, -0.01726725, -0.1679955, 0, 1, 0.5333334, 1,
-0.1764199, 0.8469761, -2.055619, 0, 1, 0.5372549, 1,
-0.1681456, -1.364693, -2.290248, 0, 1, 0.5450981, 1,
-0.1672678, -0.7663802, -4.00426, 0, 1, 0.5490196, 1,
-0.1659184, -1.616948, -2.930687, 0, 1, 0.5568628, 1,
-0.162801, 1.524392, -0.1409094, 0, 1, 0.5607843, 1,
-0.1625863, -0.002332135, -2.221611, 0, 1, 0.5686275, 1,
-0.1616671, 1.645515, -0.6136819, 0, 1, 0.572549, 1,
-0.1615964, -0.1059137, -2.889106, 0, 1, 0.5803922, 1,
-0.1580504, -0.6380281, -1.938023, 0, 1, 0.5843138, 1,
-0.1543018, 1.485197, -1.220376, 0, 1, 0.5921569, 1,
-0.153976, -1.134794, -3.698702, 0, 1, 0.5960785, 1,
-0.1532074, 0.6874808, -0.04487498, 0, 1, 0.6039216, 1,
-0.15274, -0.1135927, -3.876667, 0, 1, 0.6117647, 1,
-0.1522804, 0.1555213, -2.760549, 0, 1, 0.6156863, 1,
-0.1473825, -0.3328598, -4.451321, 0, 1, 0.6235294, 1,
-0.1364564, -1.033322, -2.150141, 0, 1, 0.627451, 1,
-0.1362301, -1.420143, -4.865638, 0, 1, 0.6352941, 1,
-0.1353674, -0.06259788, -0.4307114, 0, 1, 0.6392157, 1,
-0.1346936, 0.4823641, -0.7937651, 0, 1, 0.6470588, 1,
-0.1333522, -0.01699799, -2.125473, 0, 1, 0.6509804, 1,
-0.1327136, -0.7210935, -2.619289, 0, 1, 0.6588235, 1,
-0.1256682, -0.9797869, -4.336902, 0, 1, 0.6627451, 1,
-0.1239357, -0.8351965, -3.728977, 0, 1, 0.6705883, 1,
-0.1220522, -0.0009246613, -1.016129, 0, 1, 0.6745098, 1,
-0.1212597, -0.6885602, -3.048905, 0, 1, 0.682353, 1,
-0.1212427, 0.5932073, 1.210965, 0, 1, 0.6862745, 1,
-0.1175016, -0.7546564, -1.929873, 0, 1, 0.6941177, 1,
-0.1172049, 0.4753245, -1.505016, 0, 1, 0.7019608, 1,
-0.1169927, -0.2808037, -2.962102, 0, 1, 0.7058824, 1,
-0.1157122, -2.017298, -1.33902, 0, 1, 0.7137255, 1,
-0.113853, -1.421655, -4.305506, 0, 1, 0.7176471, 1,
-0.1116672, -1.361955, -4.543226, 0, 1, 0.7254902, 1,
-0.1069643, 0.1779243, -0.9979786, 0, 1, 0.7294118, 1,
-0.1046486, 1.495466, 0.5840979, 0, 1, 0.7372549, 1,
-0.09920784, 0.1125601, -2.546726, 0, 1, 0.7411765, 1,
-0.09755881, -0.1231648, -2.425545, 0, 1, 0.7490196, 1,
-0.09468765, -1.011296, -3.011969, 0, 1, 0.7529412, 1,
-0.09288634, 0.09229283, -0.2357266, 0, 1, 0.7607843, 1,
-0.08900458, -0.1344539, -2.521972, 0, 1, 0.7647059, 1,
-0.08779298, 0.6950175, -0.319384, 0, 1, 0.772549, 1,
-0.08762456, 1.739186, 1.117874, 0, 1, 0.7764706, 1,
-0.08744687, -0.6737837, -4.00024, 0, 1, 0.7843137, 1,
-0.08383486, -0.0332097, -1.960047, 0, 1, 0.7882353, 1,
-0.08158201, -0.5345494, -4.053542, 0, 1, 0.7960784, 1,
-0.07984406, 0.6559619, 0.0391653, 0, 1, 0.8039216, 1,
-0.07694349, 0.6439705, -0.1649406, 0, 1, 0.8078431, 1,
-0.07554381, 0.8925832, 0.1086948, 0, 1, 0.8156863, 1,
-0.07496228, 1.657047, 0.5734846, 0, 1, 0.8196079, 1,
-0.07161103, 0.01013046, -0.1464154, 0, 1, 0.827451, 1,
-0.0682411, -0.5141469, -3.558135, 0, 1, 0.8313726, 1,
-0.0654261, -1.197864, -2.879127, 0, 1, 0.8392157, 1,
-0.0652061, 1.269006, 1.848787, 0, 1, 0.8431373, 1,
-0.06250595, 0.3737195, -0.4415571, 0, 1, 0.8509804, 1,
-0.06193721, -0.3974875, -3.75644, 0, 1, 0.854902, 1,
-0.06042653, 0.01645819, -0.8258932, 0, 1, 0.8627451, 1,
-0.05687406, -2.003278, -3.973281, 0, 1, 0.8666667, 1,
-0.05623817, 1.110042, -0.1852331, 0, 1, 0.8745098, 1,
-0.05270935, 0.2318657, 0.3268297, 0, 1, 0.8784314, 1,
-0.05187263, 0.1015176, 1.260925, 0, 1, 0.8862745, 1,
-0.04677643, 0.9837803, -0.6377762, 0, 1, 0.8901961, 1,
-0.04541073, 0.5422238, 0.7797716, 0, 1, 0.8980392, 1,
-0.04088882, -0.1589799, -3.459257, 0, 1, 0.9058824, 1,
-0.03990552, 0.3240837, -1.492836, 0, 1, 0.9098039, 1,
-0.03975846, 1.015432, -0.3956699, 0, 1, 0.9176471, 1,
-0.03238048, 3.387009, 0.03560289, 0, 1, 0.9215686, 1,
-0.03198769, 0.4137719, -0.4824713, 0, 1, 0.9294118, 1,
-0.02644871, -0.5828704, -1.38241, 0, 1, 0.9333333, 1,
-0.02327507, -0.991761, -4.867117, 0, 1, 0.9411765, 1,
-0.02237365, -0.8336869, -2.467796, 0, 1, 0.945098, 1,
-0.01638534, 0.6955053, -0.7674528, 0, 1, 0.9529412, 1,
-0.01096379, -0.4025065, -1.465761, 0, 1, 0.9568627, 1,
-0.008048352, 0.7222955, 0.8009536, 0, 1, 0.9647059, 1,
-0.007322823, -1.627616, -2.413939, 0, 1, 0.9686275, 1,
-0.006793086, -0.9740702, -2.902408, 0, 1, 0.9764706, 1,
-0.006206929, 0.754821, -0.3482214, 0, 1, 0.9803922, 1,
-0.005624206, -0.4316155, -1.704888, 0, 1, 0.9882353, 1,
-0.005165579, 0.03528753, 0.01535968, 0, 1, 0.9921569, 1,
-0.002383627, -0.8756194, -2.102336, 0, 1, 1, 1,
0.00110746, 0.652362, -0.005177654, 0, 0.9921569, 1, 1,
0.003326107, 0.3849137, 0.7428187, 0, 0.9882353, 1, 1,
0.004323166, -0.1903493, 3.152637, 0, 0.9803922, 1, 1,
0.004687017, 1.253613, -0.3752273, 0, 0.9764706, 1, 1,
0.006002775, -1.308316, 3.988003, 0, 0.9686275, 1, 1,
0.006704756, -2.07929, 0.6526606, 0, 0.9647059, 1, 1,
0.008153845, -0.5386536, 3.461925, 0, 0.9568627, 1, 1,
0.01012709, -1.363711, 2.656299, 0, 0.9529412, 1, 1,
0.01423048, 1.46365, 0.282059, 0, 0.945098, 1, 1,
0.01559203, 0.9943401, -0.3695136, 0, 0.9411765, 1, 1,
0.02247344, -0.06402984, 2.935318, 0, 0.9333333, 1, 1,
0.02263891, 0.5503826, 1.157487, 0, 0.9294118, 1, 1,
0.03121771, 0.04570201, 0.618504, 0, 0.9215686, 1, 1,
0.03189689, -0.7773781, 2.507362, 0, 0.9176471, 1, 1,
0.03325029, 0.9326964, 0.2124265, 0, 0.9098039, 1, 1,
0.03480001, 2.147624, -1.72133, 0, 0.9058824, 1, 1,
0.03514446, -1.65239, 3.172497, 0, 0.8980392, 1, 1,
0.04167989, -0.4049772, 3.905818, 0, 0.8901961, 1, 1,
0.05140068, 0.360495, -1.436582, 0, 0.8862745, 1, 1,
0.05479623, -1.165217, 2.727829, 0, 0.8784314, 1, 1,
0.05684419, 0.2283901, 2.140414, 0, 0.8745098, 1, 1,
0.05691094, 1.019823, 0.7154035, 0, 0.8666667, 1, 1,
0.05795943, 0.1682157, 0.2013079, 0, 0.8627451, 1, 1,
0.06057427, 0.08852146, -0.3499788, 0, 0.854902, 1, 1,
0.06328639, 1.419666, 0.8979747, 0, 0.8509804, 1, 1,
0.06537877, -1.24014, 2.531795, 0, 0.8431373, 1, 1,
0.06816544, -0.2645848, 3.544328, 0, 0.8392157, 1, 1,
0.06887454, -1.061862, 3.467645, 0, 0.8313726, 1, 1,
0.07483125, -0.2475416, 3.102232, 0, 0.827451, 1, 1,
0.07979655, -0.2339259, 3.384473, 0, 0.8196079, 1, 1,
0.08195823, -1.034205, 2.966782, 0, 0.8156863, 1, 1,
0.08485938, 0.2328429, -2.127215, 0, 0.8078431, 1, 1,
0.08505684, -0.2638202, 2.918218, 0, 0.8039216, 1, 1,
0.08694093, -0.3051837, 2.723588, 0, 0.7960784, 1, 1,
0.08722536, -0.3537927, 3.109791, 0, 0.7882353, 1, 1,
0.09182814, -0.1566666, 1.30386, 0, 0.7843137, 1, 1,
0.09336356, -0.7729424, 2.991713, 0, 0.7764706, 1, 1,
0.09344488, 1.685306, -1.069975, 0, 0.772549, 1, 1,
0.094343, 1.933002, -0.3589761, 0, 0.7647059, 1, 1,
0.09705811, -0.9016556, 3.864483, 0, 0.7607843, 1, 1,
0.106399, 0.2367479, 0.287601, 0, 0.7529412, 1, 1,
0.110898, 0.271301, 1.12838, 0, 0.7490196, 1, 1,
0.1185458, -0.5523049, 3.480216, 0, 0.7411765, 1, 1,
0.1204142, 0.301896, 1.724097, 0, 0.7372549, 1, 1,
0.1280742, 0.3035884, 3.024315, 0, 0.7294118, 1, 1,
0.1284658, -0.2139386, 2.117121, 0, 0.7254902, 1, 1,
0.1286687, 1.175057, 0.4385272, 0, 0.7176471, 1, 1,
0.130184, -0.1879799, 2.927286, 0, 0.7137255, 1, 1,
0.1393567, 0.9153734, 0.592644, 0, 0.7058824, 1, 1,
0.149027, 0.6957747, 0.2024746, 0, 0.6980392, 1, 1,
0.1522261, -0.2136781, 2.113607, 0, 0.6941177, 1, 1,
0.1526057, 0.1779566, 2.260137, 0, 0.6862745, 1, 1,
0.1578124, 0.5951396, 1.574367, 0, 0.682353, 1, 1,
0.1621582, 0.8298553, 0.9030417, 0, 0.6745098, 1, 1,
0.1634286, 1.047616, 0.122149, 0, 0.6705883, 1, 1,
0.172415, -0.425243, 1.608752, 0, 0.6627451, 1, 1,
0.1746555, 0.9234577, -0.4056304, 0, 0.6588235, 1, 1,
0.1786539, 0.9409028, -0.6831053, 0, 0.6509804, 1, 1,
0.1797837, -0.8233352, 2.717928, 0, 0.6470588, 1, 1,
0.1897717, 0.6094499, -0.7201644, 0, 0.6392157, 1, 1,
0.1974877, 1.173683, 0.002750963, 0, 0.6352941, 1, 1,
0.2007904, -0.1388023, -0.112469, 0, 0.627451, 1, 1,
0.2062054, 0.6572245, -0.1097184, 0, 0.6235294, 1, 1,
0.2078367, 0.6105667, 0.3724114, 0, 0.6156863, 1, 1,
0.2144063, 1.146071, 0.6638663, 0, 0.6117647, 1, 1,
0.2178878, 0.9558038, 0.8804938, 0, 0.6039216, 1, 1,
0.2193001, 0.5166647, -0.3636896, 0, 0.5960785, 1, 1,
0.2195127, 2.185324, -0.09767674, 0, 0.5921569, 1, 1,
0.2212701, -1.68225, 3.152044, 0, 0.5843138, 1, 1,
0.2232091, -0.2276438, 2.031257, 0, 0.5803922, 1, 1,
0.2252423, -1.705364, 3.319312, 0, 0.572549, 1, 1,
0.2252452, -0.6080582, 3.172614, 0, 0.5686275, 1, 1,
0.2288198, -2.61651, 2.720628, 0, 0.5607843, 1, 1,
0.229299, 1.20202, 0.3058273, 0, 0.5568628, 1, 1,
0.2388069, 0.07958668, 0.1214938, 0, 0.5490196, 1, 1,
0.240633, -1.100603, 2.212369, 0, 0.5450981, 1, 1,
0.2437054, -0.06074401, 2.490714, 0, 0.5372549, 1, 1,
0.2447144, -0.6999286, 2.111478, 0, 0.5333334, 1, 1,
0.2456044, -0.3140308, 2.030737, 0, 0.5254902, 1, 1,
0.2473846, -1.070323, 2.402912, 0, 0.5215687, 1, 1,
0.2492062, -0.1361234, 3.91145, 0, 0.5137255, 1, 1,
0.2592105, 0.7741222, -0.2369097, 0, 0.509804, 1, 1,
0.2593082, 0.5105931, -0.6072375, 0, 0.5019608, 1, 1,
0.2627428, 0.7171919, -0.3975636, 0, 0.4941176, 1, 1,
0.2637337, -0.8736255, 2.520509, 0, 0.4901961, 1, 1,
0.2680088, 0.9321519, 0.3757584, 0, 0.4823529, 1, 1,
0.271323, 0.09432867, 2.333462, 0, 0.4784314, 1, 1,
0.2723026, 0.1739416, 0.9212857, 0, 0.4705882, 1, 1,
0.2730411, 0.53508, -0.5321234, 0, 0.4666667, 1, 1,
0.2744271, 1.024266, 1.475136, 0, 0.4588235, 1, 1,
0.2817804, 0.6817507, 0.8432266, 0, 0.454902, 1, 1,
0.2817933, 0.5261843, -0.06506929, 0, 0.4470588, 1, 1,
0.282678, 0.2113111, 0.7328005, 0, 0.4431373, 1, 1,
0.2926297, 1.070056, 1.504061, 0, 0.4352941, 1, 1,
0.2926956, -0.8769435, 3.697998, 0, 0.4313726, 1, 1,
0.2934025, 0.309508, 1.325824, 0, 0.4235294, 1, 1,
0.3009364, -0.8983138, 3.503038, 0, 0.4196078, 1, 1,
0.3015866, 0.2683365, -0.6018831, 0, 0.4117647, 1, 1,
0.3017139, 1.771258, -1.881425, 0, 0.4078431, 1, 1,
0.3033341, -0.06160285, 2.342309, 0, 0.4, 1, 1,
0.3053535, -0.3439636, 2.604546, 0, 0.3921569, 1, 1,
0.3094088, 0.5439387, 0.7450175, 0, 0.3882353, 1, 1,
0.3096585, 0.3779796, 1.605329, 0, 0.3803922, 1, 1,
0.313033, 0.5820221, 0.7035416, 0, 0.3764706, 1, 1,
0.3137864, 0.07947679, 2.377427, 0, 0.3686275, 1, 1,
0.3156874, 0.975432, 0.5089565, 0, 0.3647059, 1, 1,
0.316516, -1.164372, 2.029308, 0, 0.3568628, 1, 1,
0.3191077, -0.9395292, 2.444927, 0, 0.3529412, 1, 1,
0.3220821, 0.739565, -0.1238748, 0, 0.345098, 1, 1,
0.3226602, 0.1483609, 2.315157, 0, 0.3411765, 1, 1,
0.3297187, 0.0282946, 0.8676012, 0, 0.3333333, 1, 1,
0.334388, -0.7140342, 2.248022, 0, 0.3294118, 1, 1,
0.3381545, -0.4991302, 3.715073, 0, 0.3215686, 1, 1,
0.3409247, 0.8256144, 0.06762479, 0, 0.3176471, 1, 1,
0.3411652, 1.357671, 0.09750778, 0, 0.3098039, 1, 1,
0.3449568, -1.120529, 3.136152, 0, 0.3058824, 1, 1,
0.3468111, 2.199637, -0.5362396, 0, 0.2980392, 1, 1,
0.3539987, -1.504712, 3.185795, 0, 0.2901961, 1, 1,
0.3557211, -0.5656111, 4.059584, 0, 0.2862745, 1, 1,
0.35614, -0.3627959, 2.243776, 0, 0.2784314, 1, 1,
0.3570198, -0.3474592, 2.034982, 0, 0.2745098, 1, 1,
0.3627318, 0.2031728, 0.1271444, 0, 0.2666667, 1, 1,
0.3642004, 0.5906492, 1.112279, 0, 0.2627451, 1, 1,
0.3666497, -1.1286, 3.435716, 0, 0.254902, 1, 1,
0.3675762, -1.796655, 1.225084, 0, 0.2509804, 1, 1,
0.3737727, -0.1265204, -0.5798389, 0, 0.2431373, 1, 1,
0.3759257, -0.5252543, 2.662814, 0, 0.2392157, 1, 1,
0.3760949, 0.9323838, -0.7365555, 0, 0.2313726, 1, 1,
0.3762417, 0.431458, 1.081589, 0, 0.227451, 1, 1,
0.3775947, 0.005360932, 2.278228, 0, 0.2196078, 1, 1,
0.3806449, -1.684114, 3.409338, 0, 0.2156863, 1, 1,
0.3818994, 1.160489, 0.3044807, 0, 0.2078431, 1, 1,
0.3825006, 0.4288985, 3.16152, 0, 0.2039216, 1, 1,
0.3862949, 0.8923423, 0.6089752, 0, 0.1960784, 1, 1,
0.3866901, 1.187958, -0.07737125, 0, 0.1882353, 1, 1,
0.3981411, -1.001145, 1.645978, 0, 0.1843137, 1, 1,
0.4007611, -0.7003829, 2.543708, 0, 0.1764706, 1, 1,
0.4046924, 1.173972, 0.2284405, 0, 0.172549, 1, 1,
0.405187, 0.9674588, 2.109148, 0, 0.1647059, 1, 1,
0.4124724, 0.9124759, -0.4117053, 0, 0.1607843, 1, 1,
0.4175279, -0.514964, 0.8233013, 0, 0.1529412, 1, 1,
0.4236845, -0.1370636, 1.817645, 0, 0.1490196, 1, 1,
0.4252453, -0.6317899, 2.513054, 0, 0.1411765, 1, 1,
0.4254434, -1.224901, 3.470327, 0, 0.1372549, 1, 1,
0.427065, 0.7421395, 1.116107, 0, 0.1294118, 1, 1,
0.429336, -0.5462372, 2.334338, 0, 0.1254902, 1, 1,
0.4398192, -0.7241582, 1.281367, 0, 0.1176471, 1, 1,
0.4446212, 0.382876, 1.878506, 0, 0.1137255, 1, 1,
0.446156, 0.337902, -0.1920075, 0, 0.1058824, 1, 1,
0.4462553, 0.3149083, -0.3144317, 0, 0.09803922, 1, 1,
0.4473431, -0.9458632, 1.86719, 0, 0.09411765, 1, 1,
0.4480804, 0.9634726, 0.156486, 0, 0.08627451, 1, 1,
0.4517588, 0.1934158, -0.06518211, 0, 0.08235294, 1, 1,
0.4541818, -0.8460249, 3.23296, 0, 0.07450981, 1, 1,
0.4606815, 1.75849, 0.4848354, 0, 0.07058824, 1, 1,
0.461745, 0.5734035, 0.6738799, 0, 0.0627451, 1, 1,
0.465747, -0.7453741, 0.8906853, 0, 0.05882353, 1, 1,
0.4660281, -1.922111, 4.388821, 0, 0.05098039, 1, 1,
0.4757749, 0.979999, -0.08731721, 0, 0.04705882, 1, 1,
0.4764634, -0.8752974, 2.098508, 0, 0.03921569, 1, 1,
0.4767753, -1.320566, 2.116299, 0, 0.03529412, 1, 1,
0.478317, 0.2798317, 1.717685, 0, 0.02745098, 1, 1,
0.4837319, -0.2382906, 2.146512, 0, 0.02352941, 1, 1,
0.4902524, -1.368285, 2.419427, 0, 0.01568628, 1, 1,
0.4925832, 1.632379, 0.2973243, 0, 0.01176471, 1, 1,
0.4965055, 0.5067457, -0.07015928, 0, 0.003921569, 1, 1,
0.4981942, -0.298836, 1.112172, 0.003921569, 0, 1, 1,
0.5004574, -1.748487, 0.7282134, 0.007843138, 0, 1, 1,
0.50428, -0.3597569, 1.937548, 0.01568628, 0, 1, 1,
0.50616, -0.5309301, 1.03333, 0.01960784, 0, 1, 1,
0.5153397, 0.26949, 2.001501, 0.02745098, 0, 1, 1,
0.5159659, -3.071194, 1.282965, 0.03137255, 0, 1, 1,
0.5173339, -0.7844644, 0.6794372, 0.03921569, 0, 1, 1,
0.5219765, -0.9285825, 2.521405, 0.04313726, 0, 1, 1,
0.5244091, -2.03457, 4.24622, 0.05098039, 0, 1, 1,
0.5282142, -0.5883984, 2.677165, 0.05490196, 0, 1, 1,
0.5310376, -1.160079, 0.6426966, 0.0627451, 0, 1, 1,
0.53703, -1.279557, 2.507015, 0.06666667, 0, 1, 1,
0.5458239, 0.8913982, 1.149838, 0.07450981, 0, 1, 1,
0.5481676, -0.5823454, 3.095913, 0.07843138, 0, 1, 1,
0.5552201, 0.3952494, 1.094879, 0.08627451, 0, 1, 1,
0.5613114, 1.431986, 2.253093, 0.09019608, 0, 1, 1,
0.5633883, 0.04243964, 2.67518, 0.09803922, 0, 1, 1,
0.5740623, 0.7455161, 0.7027671, 0.1058824, 0, 1, 1,
0.5762244, -0.6360908, 1.674181, 0.1098039, 0, 1, 1,
0.5767387, -1.346248, 2.780275, 0.1176471, 0, 1, 1,
0.5783009, -1.578996, 2.859644, 0.1215686, 0, 1, 1,
0.5783319, 0.1028706, 1.080205, 0.1294118, 0, 1, 1,
0.5785454, -1.898571, 1.004882, 0.1333333, 0, 1, 1,
0.5810692, 1.210452, -0.1794366, 0.1411765, 0, 1, 1,
0.5811556, 0.4217485, -0.7204562, 0.145098, 0, 1, 1,
0.5853873, -0.6068268, 4.550242, 0.1529412, 0, 1, 1,
0.5867134, -1.33643, 4.411875, 0.1568628, 0, 1, 1,
0.5870085, 0.7122754, 0.6443982, 0.1647059, 0, 1, 1,
0.5899312, -0.8311088, 3.099102, 0.1686275, 0, 1, 1,
0.600146, -0.1786324, 3.053254, 0.1764706, 0, 1, 1,
0.6034541, 0.3260449, 1.566204, 0.1803922, 0, 1, 1,
0.6035486, -0.9327661, 2.055938, 0.1882353, 0, 1, 1,
0.6062916, -0.8485954, 4.309762, 0.1921569, 0, 1, 1,
0.609261, 0.7409975, 1.448127, 0.2, 0, 1, 1,
0.6119584, 0.6962572, 0.1261091, 0.2078431, 0, 1, 1,
0.6125671, -1.86329, 1.864492, 0.2117647, 0, 1, 1,
0.6126169, -1.242254, 1.271311, 0.2196078, 0, 1, 1,
0.6210713, 0.3964767, -0.1693854, 0.2235294, 0, 1, 1,
0.6225423, 2.550511, 0.4330739, 0.2313726, 0, 1, 1,
0.6297376, 0.4314017, 1.564537, 0.2352941, 0, 1, 1,
0.6299009, -0.2748872, 2.361564, 0.2431373, 0, 1, 1,
0.6315054, 0.5091577, 0.2465136, 0.2470588, 0, 1, 1,
0.6342292, -0.2277223, 0.9291831, 0.254902, 0, 1, 1,
0.6384813, -0.6381245, 3.09059, 0.2588235, 0, 1, 1,
0.6393715, -0.4365734, 1.815793, 0.2666667, 0, 1, 1,
0.6440979, -0.2627694, 2.089185, 0.2705882, 0, 1, 1,
0.6552932, -0.7549368, 2.425792, 0.2784314, 0, 1, 1,
0.6659959, 0.0741964, 0.3251509, 0.282353, 0, 1, 1,
0.6696383, 0.05960635, 0.8454722, 0.2901961, 0, 1, 1,
0.6768188, 0.08075814, 0.4517429, 0.2941177, 0, 1, 1,
0.6768455, -0.07181607, 1.729643, 0.3019608, 0, 1, 1,
0.6781464, 0.6553276, -0.4516205, 0.3098039, 0, 1, 1,
0.6803041, -1.742461, 1.688715, 0.3137255, 0, 1, 1,
0.6809075, 0.9336712, 2.598459, 0.3215686, 0, 1, 1,
0.6815915, 1.52872, -0.3317182, 0.3254902, 0, 1, 1,
0.6824764, 1.590373, -1.953487, 0.3333333, 0, 1, 1,
0.6871032, -1.179025, 2.312839, 0.3372549, 0, 1, 1,
0.6879037, 2.210893, -0.9151635, 0.345098, 0, 1, 1,
0.6891762, -0.8217157, 1.423622, 0.3490196, 0, 1, 1,
0.689771, -0.1998107, 2.402648, 0.3568628, 0, 1, 1,
0.6976237, 0.8594496, 1.840315, 0.3607843, 0, 1, 1,
0.7027093, -1.491436, 2.059752, 0.3686275, 0, 1, 1,
0.7027403, -0.8917171, 2.987188, 0.372549, 0, 1, 1,
0.7043213, -0.8479813, 2.349924, 0.3803922, 0, 1, 1,
0.7069039, 0.3823779, -0.5987914, 0.3843137, 0, 1, 1,
0.7093492, 0.5406245, 1.516991, 0.3921569, 0, 1, 1,
0.7100085, -0.6602031, 2.876787, 0.3960784, 0, 1, 1,
0.7104346, 0.3231169, 0.6712186, 0.4039216, 0, 1, 1,
0.7126395, -0.4171895, 1.84351, 0.4117647, 0, 1, 1,
0.7245744, 0.9846431, 2.441192, 0.4156863, 0, 1, 1,
0.7310125, 1.136683, 1.118387, 0.4235294, 0, 1, 1,
0.7324203, 1.075348, 1.361371, 0.427451, 0, 1, 1,
0.7351419, 0.5885723, 1.704983, 0.4352941, 0, 1, 1,
0.7383178, -0.404689, 1.396559, 0.4392157, 0, 1, 1,
0.7398536, 1.029768, 1.395894, 0.4470588, 0, 1, 1,
0.7420947, 0.4358558, 1.159202, 0.4509804, 0, 1, 1,
0.7435279, -0.02552756, 1.676911, 0.4588235, 0, 1, 1,
0.7441308, -0.666294, 1.385111, 0.4627451, 0, 1, 1,
0.7477784, -1.518439, 2.173275, 0.4705882, 0, 1, 1,
0.7496541, -1.258201, 2.975636, 0.4745098, 0, 1, 1,
0.7497876, 0.02105084, 0.8768907, 0.4823529, 0, 1, 1,
0.7553104, 0.06327652, 0.8493551, 0.4862745, 0, 1, 1,
0.7656544, 0.5516368, 0.5525829, 0.4941176, 0, 1, 1,
0.7664954, 1.011546, -1.002504, 0.5019608, 0, 1, 1,
0.7674338, -1.820304, 2.593032, 0.5058824, 0, 1, 1,
0.7692279, 0.3351538, 1.166321, 0.5137255, 0, 1, 1,
0.7694689, -0.5698428, 1.558788, 0.5176471, 0, 1, 1,
0.7759084, -0.316292, 2.073243, 0.5254902, 0, 1, 1,
0.77643, 0.1142982, 0.5326739, 0.5294118, 0, 1, 1,
0.7778768, 1.217223, 0.1706282, 0.5372549, 0, 1, 1,
0.7802665, 0.003656065, 1.107511, 0.5411765, 0, 1, 1,
0.7820025, -0.4092874, 2.213009, 0.5490196, 0, 1, 1,
0.7901602, 0.3689239, 0.4378377, 0.5529412, 0, 1, 1,
0.794032, 0.1688341, 1.122404, 0.5607843, 0, 1, 1,
0.7945456, -0.4768806, 2.547778, 0.5647059, 0, 1, 1,
0.7950017, -2.697974, 2.662501, 0.572549, 0, 1, 1,
0.7980565, 0.614321, -0.8402473, 0.5764706, 0, 1, 1,
0.7981512, 0.004832576, 1.455876, 0.5843138, 0, 1, 1,
0.8166317, 2.895767, 0.1399176, 0.5882353, 0, 1, 1,
0.8215727, -0.2964692, 2.51068, 0.5960785, 0, 1, 1,
0.8277486, -0.564084, 2.661042, 0.6039216, 0, 1, 1,
0.8295161, -1.307153, 3.41639, 0.6078432, 0, 1, 1,
0.8317193, 1.78752, -0.4324739, 0.6156863, 0, 1, 1,
0.8419221, -0.07240724, 2.147079, 0.6196079, 0, 1, 1,
0.8429092, 0.4072367, 2.700237, 0.627451, 0, 1, 1,
0.8517004, -0.07048855, 0.9058738, 0.6313726, 0, 1, 1,
0.856261, 1.274707, 0.5942956, 0.6392157, 0, 1, 1,
0.859522, -0.3711476, 0.4001536, 0.6431373, 0, 1, 1,
0.8600377, -0.3234266, 0.6076565, 0.6509804, 0, 1, 1,
0.86031, -1.710036, 1.93358, 0.654902, 0, 1, 1,
0.8654119, -0.6906366, 3.606638, 0.6627451, 0, 1, 1,
0.8678827, 0.2264812, 0.4562704, 0.6666667, 0, 1, 1,
0.8681296, 0.8744515, 2.138272, 0.6745098, 0, 1, 1,
0.8735564, 0.125418, 1.36435, 0.6784314, 0, 1, 1,
0.8736466, -0.3553755, 0.1837194, 0.6862745, 0, 1, 1,
0.8739376, 1.42347, 0.8031117, 0.6901961, 0, 1, 1,
0.874149, 0.15436, 1.755579, 0.6980392, 0, 1, 1,
0.8749614, -1.013365, 0.6415821, 0.7058824, 0, 1, 1,
0.8785388, -1.266185, 1.969652, 0.7098039, 0, 1, 1,
0.8788092, 1.025048, 1.389816, 0.7176471, 0, 1, 1,
0.8791354, 0.4828995, 1.64232, 0.7215686, 0, 1, 1,
0.8815802, -0.1880848, 1.154835, 0.7294118, 0, 1, 1,
0.8860943, -0.6414428, 1.482682, 0.7333333, 0, 1, 1,
0.8896965, 0.3859641, 0.267778, 0.7411765, 0, 1, 1,
0.8942963, -1.813522, 3.08324, 0.7450981, 0, 1, 1,
0.8954672, 2.011499, 1.394061, 0.7529412, 0, 1, 1,
0.8977585, -0.2908464, 2.085562, 0.7568628, 0, 1, 1,
0.8990507, -0.4426455, 2.312991, 0.7647059, 0, 1, 1,
0.9007143, -0.05779207, 0.6069978, 0.7686275, 0, 1, 1,
0.9028787, -0.6777871, 1.852612, 0.7764706, 0, 1, 1,
0.9160656, 1.314803, 1.175215, 0.7803922, 0, 1, 1,
0.9167467, 0.9602966, 0.2999727, 0.7882353, 0, 1, 1,
0.9205896, -1.543685, 2.10297, 0.7921569, 0, 1, 1,
0.9233251, 0.02332204, 0.8339234, 0.8, 0, 1, 1,
0.92371, 0.8235958, 1.332856, 0.8078431, 0, 1, 1,
0.9242948, -0.6488424, 2.14957, 0.8117647, 0, 1, 1,
0.9267693, -0.05651927, 2.618326, 0.8196079, 0, 1, 1,
0.9291295, -0.5362781, 2.240705, 0.8235294, 0, 1, 1,
0.9312309, -1.291998, 2.521553, 0.8313726, 0, 1, 1,
0.9337119, 0.05929299, -0.5228701, 0.8352941, 0, 1, 1,
0.9350208, 0.4172655, -0.06361303, 0.8431373, 0, 1, 1,
0.9373484, -0.08581686, 0.7067096, 0.8470588, 0, 1, 1,
0.9381561, -0.03623258, 0.2305691, 0.854902, 0, 1, 1,
0.9420357, -1.146227, 2.343214, 0.8588235, 0, 1, 1,
0.9462149, 0.662746, 1.167721, 0.8666667, 0, 1, 1,
0.9511809, 0.6568834, -0.5690961, 0.8705882, 0, 1, 1,
0.9525497, 0.09609087, 1.571061, 0.8784314, 0, 1, 1,
0.9580152, 0.7472565, 2.183699, 0.8823529, 0, 1, 1,
0.9605871, -1.299789, 1.802737, 0.8901961, 0, 1, 1,
0.9630392, 0.3749089, 2.873978, 0.8941177, 0, 1, 1,
0.9642659, 1.644769, -1.293574, 0.9019608, 0, 1, 1,
0.9696716, 0.2794644, 0.6371413, 0.9098039, 0, 1, 1,
0.9751711, 1.108602, 1.45446, 0.9137255, 0, 1, 1,
0.9760988, 0.4988929, 0.8204971, 0.9215686, 0, 1, 1,
0.9792739, 1.166113, 0.007795812, 0.9254902, 0, 1, 1,
0.9873917, -0.5252603, 1.036267, 0.9333333, 0, 1, 1,
0.988545, 1.504263, 1.243402, 0.9372549, 0, 1, 1,
0.9910671, -0.376502, 1.602262, 0.945098, 0, 1, 1,
0.9924266, -1.273072, 3.684444, 0.9490196, 0, 1, 1,
0.9929674, -0.6090314, 4.353554, 0.9568627, 0, 1, 1,
0.9968892, 1.20454, 2.480154, 0.9607843, 0, 1, 1,
0.9971574, 1.195524, -0.7554053, 0.9686275, 0, 1, 1,
0.9973392, 2.43159, -2.039072, 0.972549, 0, 1, 1,
1.007646, -0.9502894, 1.14549, 0.9803922, 0, 1, 1,
1.008692, -0.6612781, 2.013522, 0.9843137, 0, 1, 1,
1.009284, -0.3934189, 1.93531, 0.9921569, 0, 1, 1,
1.011374, 0.1663166, 2.60664, 0.9960784, 0, 1, 1,
1.011839, -0.4914575, 1.275442, 1, 0, 0.9960784, 1,
1.013948, -1.032105, 1.424656, 1, 0, 0.9882353, 1,
1.022823, -0.4297875, 2.306791, 1, 0, 0.9843137, 1,
1.02283, 0.3434143, 1.397358, 1, 0, 0.9764706, 1,
1.025518, 1.002557, 0.9253935, 1, 0, 0.972549, 1,
1.033459, -1.496821, 3.886597, 1, 0, 0.9647059, 1,
1.035118, -1.787737, 2.169017, 1, 0, 0.9607843, 1,
1.036962, 0.792053, 1.710964, 1, 0, 0.9529412, 1,
1.044084, -0.8713959, 2.792522, 1, 0, 0.9490196, 1,
1.047827, 1.001824, 0.1039149, 1, 0, 0.9411765, 1,
1.048816, -1.960568, 2.762033, 1, 0, 0.9372549, 1,
1.051568, 0.1264179, 0.8125789, 1, 0, 0.9294118, 1,
1.063311, -1.373246, 2.087712, 1, 0, 0.9254902, 1,
1.077849, -0.4251396, 1.969821, 1, 0, 0.9176471, 1,
1.080847, -1.098331, 3.8765, 1, 0, 0.9137255, 1,
1.084103, 1.791994, -0.8379925, 1, 0, 0.9058824, 1,
1.086489, 0.6434966, -0.2952537, 1, 0, 0.9019608, 1,
1.090849, -1.054154, 2.194839, 1, 0, 0.8941177, 1,
1.091725, -0.5602368, 1.402414, 1, 0, 0.8862745, 1,
1.094523, 0.7341562, 1.205464, 1, 0, 0.8823529, 1,
1.095274, 0.6483548, 1.122208, 1, 0, 0.8745098, 1,
1.095637, -0.5602477, 0.9552509, 1, 0, 0.8705882, 1,
1.096789, 0.08347113, 1.056241, 1, 0, 0.8627451, 1,
1.09912, -1.948929, 1.897912, 1, 0, 0.8588235, 1,
1.100252, 0.3464118, 0.05379017, 1, 0, 0.8509804, 1,
1.105682, 2.069834, 1.432954, 1, 0, 0.8470588, 1,
1.117424, 0.8382829, -0.4989736, 1, 0, 0.8392157, 1,
1.132108, -1.230278, 2.588228, 1, 0, 0.8352941, 1,
1.133835, 0.1166089, -0.7824851, 1, 0, 0.827451, 1,
1.136616, -0.6645996, 1.968515, 1, 0, 0.8235294, 1,
1.143601, 0.7508863, 0.4642493, 1, 0, 0.8156863, 1,
1.145062, -0.5993925, 2.132222, 1, 0, 0.8117647, 1,
1.148967, -1.499431, 0.9925912, 1, 0, 0.8039216, 1,
1.150089, 0.535973, 1.648314, 1, 0, 0.7960784, 1,
1.150986, -1.345808, 1.697429, 1, 0, 0.7921569, 1,
1.155803, -0.609194, 2.687603, 1, 0, 0.7843137, 1,
1.160476, 0.8773209, 2.976142, 1, 0, 0.7803922, 1,
1.161965, -0.5111151, 2.693045, 1, 0, 0.772549, 1,
1.164774, -0.0341252, 0.07437243, 1, 0, 0.7686275, 1,
1.169579, 0.2416801, 2.977263, 1, 0, 0.7607843, 1,
1.174644, -0.671904, 1.220705, 1, 0, 0.7568628, 1,
1.183192, 0.7652245, 1.092438, 1, 0, 0.7490196, 1,
1.183519, -1.317127, 3.707055, 1, 0, 0.7450981, 1,
1.185092, -1.172147, 2.771408, 1, 0, 0.7372549, 1,
1.186292, 0.07060695, 0.3962332, 1, 0, 0.7333333, 1,
1.188091, -1.920278, 2.444949, 1, 0, 0.7254902, 1,
1.18895, 0.4551001, 0.01446066, 1, 0, 0.7215686, 1,
1.194284, -0.1295838, -0.5131084, 1, 0, 0.7137255, 1,
1.196514, 0.06171058, 0.6096871, 1, 0, 0.7098039, 1,
1.197048, -0.4883987, 1.533386, 1, 0, 0.7019608, 1,
1.205478, 1.832641, 0.7800406, 1, 0, 0.6941177, 1,
1.215929, 2.040416, 0.6847581, 1, 0, 0.6901961, 1,
1.21696, -1.386326, 2.414268, 1, 0, 0.682353, 1,
1.218881, -0.4334931, 2.621704, 1, 0, 0.6784314, 1,
1.222536, 0.4389573, 2.280118, 1, 0, 0.6705883, 1,
1.225683, 0.4731407, 2.254312, 1, 0, 0.6666667, 1,
1.237287, -0.5972041, 3.034693, 1, 0, 0.6588235, 1,
1.241612, -0.3839181, 1.933331, 1, 0, 0.654902, 1,
1.246741, -1.234616, 2.540936, 1, 0, 0.6470588, 1,
1.249437, 0.7138672, -0.8750972, 1, 0, 0.6431373, 1,
1.250872, 0.4265481, 0.8564976, 1, 0, 0.6352941, 1,
1.271209, -0.240949, 2.871085, 1, 0, 0.6313726, 1,
1.273937, -1.471465, 1.81708, 1, 0, 0.6235294, 1,
1.275437, -1.754969, 2.094496, 1, 0, 0.6196079, 1,
1.276955, -0.198175, 1.580311, 1, 0, 0.6117647, 1,
1.279822, -0.288788, 2.590427, 1, 0, 0.6078432, 1,
1.280382, 0.9925041, 1.03554, 1, 0, 0.6, 1,
1.299492, -1.356068, 1.971559, 1, 0, 0.5921569, 1,
1.317546, -0.3968852, 0.8785858, 1, 0, 0.5882353, 1,
1.331761, 1.758642, 1.805006, 1, 0, 0.5803922, 1,
1.344279, -0.2177968, 1.213509, 1, 0, 0.5764706, 1,
1.34555, 0.9347769, 0.7365752, 1, 0, 0.5686275, 1,
1.346761, 0.01770205, 2.434624, 1, 0, 0.5647059, 1,
1.347872, 1.208505, 1.11623, 1, 0, 0.5568628, 1,
1.347887, -0.6502727, 1.699354, 1, 0, 0.5529412, 1,
1.358771, 1.200023, 0.6071945, 1, 0, 0.5450981, 1,
1.37525, 1.425766, 1.01064, 1, 0, 0.5411765, 1,
1.378297, -0.8127319, 4.347369, 1, 0, 0.5333334, 1,
1.380851, -0.9599397, 0.6040602, 1, 0, 0.5294118, 1,
1.389658, 0.05289033, 1.117512, 1, 0, 0.5215687, 1,
1.397232, 1.377157, 0.1858861, 1, 0, 0.5176471, 1,
1.40983, -0.001395458, 0.3653525, 1, 0, 0.509804, 1,
1.411893, -0.7490174, 1.042071, 1, 0, 0.5058824, 1,
1.413263, -0.4038746, -0.05941176, 1, 0, 0.4980392, 1,
1.425535, -0.4541248, 2.12198, 1, 0, 0.4901961, 1,
1.443912, 0.3030735, 0.8969233, 1, 0, 0.4862745, 1,
1.449064, -0.6587637, 2.421819, 1, 0, 0.4784314, 1,
1.461462, -0.1293228, 1.796152, 1, 0, 0.4745098, 1,
1.462536, -0.1401776, 2.774949, 1, 0, 0.4666667, 1,
1.471711, 0.9055401, 0.7595558, 1, 0, 0.4627451, 1,
1.471846, 1.31148, 0.4017252, 1, 0, 0.454902, 1,
1.480669, -0.8401275, 2.677601, 1, 0, 0.4509804, 1,
1.513213, 0.6569949, 0.4044904, 1, 0, 0.4431373, 1,
1.514515, 0.3279016, 2.661625, 1, 0, 0.4392157, 1,
1.535424, 0.933625, 0.4728364, 1, 0, 0.4313726, 1,
1.54043, -0.01946627, 1.566179, 1, 0, 0.427451, 1,
1.543217, -0.2590397, 0.7708021, 1, 0, 0.4196078, 1,
1.550585, 0.3042679, 2.444424, 1, 0, 0.4156863, 1,
1.58017, 1.516614, 0.4683498, 1, 0, 0.4078431, 1,
1.585299, -1.095224, 0.7530982, 1, 0, 0.4039216, 1,
1.586924, -0.9370345, 2.543846, 1, 0, 0.3960784, 1,
1.597917, 0.3248602, 1.988788, 1, 0, 0.3882353, 1,
1.625739, 0.06938053, 0.8540246, 1, 0, 0.3843137, 1,
1.638627, -0.2779793, 3.727893, 1, 0, 0.3764706, 1,
1.642009, -1.993155, 2.931921, 1, 0, 0.372549, 1,
1.645549, 0.42882, 2.571526, 1, 0, 0.3647059, 1,
1.658156, 1.358876, 0.2078736, 1, 0, 0.3607843, 1,
1.663126, -0.7953387, 3.747402, 1, 0, 0.3529412, 1,
1.669813, -1.45439, -0.08434433, 1, 0, 0.3490196, 1,
1.671035, -0.2932959, 1.828099, 1, 0, 0.3411765, 1,
1.672437, -1.014586, 2.767118, 1, 0, 0.3372549, 1,
1.691521, -2.055323, 1.043721, 1, 0, 0.3294118, 1,
1.697059, -0.5485944, 3.663138, 1, 0, 0.3254902, 1,
1.704827, 0.01724585, 1.848391, 1, 0, 0.3176471, 1,
1.76719, 0.2758216, 2.316154, 1, 0, 0.3137255, 1,
1.772144, 0.2367423, 0.1157626, 1, 0, 0.3058824, 1,
1.777611, 1.646372, 0.8368174, 1, 0, 0.2980392, 1,
1.783193, 0.4929316, -0.3041083, 1, 0, 0.2941177, 1,
1.809959, -0.9673245, 1.848587, 1, 0, 0.2862745, 1,
1.813003, -0.1785269, 2.180811, 1, 0, 0.282353, 1,
1.815406, 0.490289, 1.39811, 1, 0, 0.2745098, 1,
1.830557, -1.508479, 0.2687917, 1, 0, 0.2705882, 1,
1.837675, 0.2871049, 0.8114801, 1, 0, 0.2627451, 1,
1.848851, 0.2382528, 1.67744, 1, 0, 0.2588235, 1,
1.851537, -0.8085321, 2.452034, 1, 0, 0.2509804, 1,
1.859494, -0.5008011, 0.2887886, 1, 0, 0.2470588, 1,
1.884704, 2.648865, 1.802341, 1, 0, 0.2392157, 1,
1.893599, 1.289828, 1.118128, 1, 0, 0.2352941, 1,
1.894071, 1.55854, 1.256549, 1, 0, 0.227451, 1,
1.89991, 0.3401097, 1.133804, 1, 0, 0.2235294, 1,
1.911386, 0.03621964, 1.491711, 1, 0, 0.2156863, 1,
1.942054, -0.3077552, 1.513219, 1, 0, 0.2117647, 1,
1.991366, -0.05696528, 2.153873, 1, 0, 0.2039216, 1,
1.995322, -0.8022349, 1.577279, 1, 0, 0.1960784, 1,
1.998599, 0.03915122, 0.7280737, 1, 0, 0.1921569, 1,
2.011087, 0.4432798, -0.02370837, 1, 0, 0.1843137, 1,
2.014145, -1.143058, 2.793101, 1, 0, 0.1803922, 1,
2.019506, 1.236823, 2.229795, 1, 0, 0.172549, 1,
2.0841, -0.3421312, 0.5955507, 1, 0, 0.1686275, 1,
2.141727, 0.9277414, 1.80547, 1, 0, 0.1607843, 1,
2.145416, 0.6040221, 0.9411599, 1, 0, 0.1568628, 1,
2.148549, -1.726394, 2.289828, 1, 0, 0.1490196, 1,
2.221311, 1.755891, 1.495738, 1, 0, 0.145098, 1,
2.241956, -0.3773566, 2.328196, 1, 0, 0.1372549, 1,
2.257699, 0.8326507, -0.4211167, 1, 0, 0.1333333, 1,
2.285073, 1.023572, 0.2295697, 1, 0, 0.1254902, 1,
2.342976, -0.1761996, 2.40754, 1, 0, 0.1215686, 1,
2.353215, 0.9221706, 0.8295965, 1, 0, 0.1137255, 1,
2.355113, 2.052186, 1.635777, 1, 0, 0.1098039, 1,
2.370339, -0.4701752, 1.068101, 1, 0, 0.1019608, 1,
2.37272, -1.205377, 1.63037, 1, 0, 0.09411765, 1,
2.454962, 0.1778751, 1.09064, 1, 0, 0.09019608, 1,
2.499279, -1.950387, 2.270952, 1, 0, 0.08235294, 1,
2.505227, 1.082866, 2.746235, 1, 0, 0.07843138, 1,
2.505833, 1.235249, 0.7003511, 1, 0, 0.07058824, 1,
2.507447, 0.9325047, 1.871223, 1, 0, 0.06666667, 1,
2.523248, -0.9049383, 1.52499, 1, 0, 0.05882353, 1,
2.569746, -1.784599, 2.098835, 1, 0, 0.05490196, 1,
2.60734, -1.336896, 1.789464, 1, 0, 0.04705882, 1,
2.614972, 0.05572066, 1.715269, 1, 0, 0.04313726, 1,
2.634289, -0.005907411, 2.450875, 1, 0, 0.03529412, 1,
2.667276, 0.1729975, 1.884239, 1, 0, 0.03137255, 1,
2.787483, -0.2948396, 1.096455, 1, 0, 0.02352941, 1,
2.892276, 0.1652656, 1.497944, 1, 0, 0.01960784, 1,
3.132897, 0.1751113, 0.631585, 1, 0, 0.01176471, 1,
3.390113, -0.8384181, 1.352679, 1, 0, 0.007843138, 1
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
-0.2889736, -4.55152, -6.787394, 0, -0.5, 0.5, 0.5,
-0.2889736, -4.55152, -6.787394, 1, -0.5, 0.5, 0.5,
-0.2889736, -4.55152, -6.787394, 1, 1.5, 0.5, 0.5,
-0.2889736, -4.55152, -6.787394, 0, 1.5, 0.5, 0.5
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
-5.215271, -0.006974816, -6.787394, 0, -0.5, 0.5, 0.5,
-5.215271, -0.006974816, -6.787394, 1, -0.5, 0.5, 0.5,
-5.215271, -0.006974816, -6.787394, 1, 1.5, 0.5, 0.5,
-5.215271, -0.006974816, -6.787394, 0, 1.5, 0.5, 0.5
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
-5.215271, -4.55152, -0.2969728, 0, -0.5, 0.5, 0.5,
-5.215271, -4.55152, -0.2969728, 1, -0.5, 0.5, 0.5,
-5.215271, -4.55152, -0.2969728, 1, 1.5, 0.5, 0.5,
-5.215271, -4.55152, -0.2969728, 0, 1.5, 0.5, 0.5
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
-2, -3.502779, -5.289604,
2, -3.502779, -5.289604,
-2, -3.502779, -5.289604,
-2, -3.677569, -5.539236,
0, -3.502779, -5.289604,
0, -3.677569, -5.539236,
2, -3.502779, -5.289604,
2, -3.677569, -5.539236
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
-2, -4.027149, -6.038499, 0, -0.5, 0.5, 0.5,
-2, -4.027149, -6.038499, 1, -0.5, 0.5, 0.5,
-2, -4.027149, -6.038499, 1, 1.5, 0.5, 0.5,
-2, -4.027149, -6.038499, 0, 1.5, 0.5, 0.5,
0, -4.027149, -6.038499, 0, -0.5, 0.5, 0.5,
0, -4.027149, -6.038499, 1, -0.5, 0.5, 0.5,
0, -4.027149, -6.038499, 1, 1.5, 0.5, 0.5,
0, -4.027149, -6.038499, 0, 1.5, 0.5, 0.5,
2, -4.027149, -6.038499, 0, -0.5, 0.5, 0.5,
2, -4.027149, -6.038499, 1, -0.5, 0.5, 0.5,
2, -4.027149, -6.038499, 1, 1.5, 0.5, 0.5,
2, -4.027149, -6.038499, 0, 1.5, 0.5, 0.5
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
-4.078433, -3, -5.289604,
-4.078433, 3, -5.289604,
-4.078433, -3, -5.289604,
-4.267906, -3, -5.539236,
-4.078433, -2, -5.289604,
-4.267906, -2, -5.539236,
-4.078433, -1, -5.289604,
-4.267906, -1, -5.539236,
-4.078433, 0, -5.289604,
-4.267906, 0, -5.539236,
-4.078433, 1, -5.289604,
-4.267906, 1, -5.539236,
-4.078433, 2, -5.289604,
-4.267906, 2, -5.539236,
-4.078433, 3, -5.289604,
-4.267906, 3, -5.539236
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
-4.646852, -3, -6.038499, 0, -0.5, 0.5, 0.5,
-4.646852, -3, -6.038499, 1, -0.5, 0.5, 0.5,
-4.646852, -3, -6.038499, 1, 1.5, 0.5, 0.5,
-4.646852, -3, -6.038499, 0, 1.5, 0.5, 0.5,
-4.646852, -2, -6.038499, 0, -0.5, 0.5, 0.5,
-4.646852, -2, -6.038499, 1, -0.5, 0.5, 0.5,
-4.646852, -2, -6.038499, 1, 1.5, 0.5, 0.5,
-4.646852, -2, -6.038499, 0, 1.5, 0.5, 0.5,
-4.646852, -1, -6.038499, 0, -0.5, 0.5, 0.5,
-4.646852, -1, -6.038499, 1, -0.5, 0.5, 0.5,
-4.646852, -1, -6.038499, 1, 1.5, 0.5, 0.5,
-4.646852, -1, -6.038499, 0, 1.5, 0.5, 0.5,
-4.646852, 0, -6.038499, 0, -0.5, 0.5, 0.5,
-4.646852, 0, -6.038499, 1, -0.5, 0.5, 0.5,
-4.646852, 0, -6.038499, 1, 1.5, 0.5, 0.5,
-4.646852, 0, -6.038499, 0, 1.5, 0.5, 0.5,
-4.646852, 1, -6.038499, 0, -0.5, 0.5, 0.5,
-4.646852, 1, -6.038499, 1, -0.5, 0.5, 0.5,
-4.646852, 1, -6.038499, 1, 1.5, 0.5, 0.5,
-4.646852, 1, -6.038499, 0, 1.5, 0.5, 0.5,
-4.646852, 2, -6.038499, 0, -0.5, 0.5, 0.5,
-4.646852, 2, -6.038499, 1, -0.5, 0.5, 0.5,
-4.646852, 2, -6.038499, 1, 1.5, 0.5, 0.5,
-4.646852, 2, -6.038499, 0, 1.5, 0.5, 0.5,
-4.646852, 3, -6.038499, 0, -0.5, 0.5, 0.5,
-4.646852, 3, -6.038499, 1, -0.5, 0.5, 0.5,
-4.646852, 3, -6.038499, 1, 1.5, 0.5, 0.5,
-4.646852, 3, -6.038499, 0, 1.5, 0.5, 0.5
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
-4.078433, -3.502779, -4,
-4.078433, -3.502779, 4,
-4.078433, -3.502779, -4,
-4.267906, -3.677569, -4,
-4.078433, -3.502779, -2,
-4.267906, -3.677569, -2,
-4.078433, -3.502779, 0,
-4.267906, -3.677569, 0,
-4.078433, -3.502779, 2,
-4.267906, -3.677569, 2,
-4.078433, -3.502779, 4,
-4.267906, -3.677569, 4
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
-4.646852, -4.027149, -4, 0, -0.5, 0.5, 0.5,
-4.646852, -4.027149, -4, 1, -0.5, 0.5, 0.5,
-4.646852, -4.027149, -4, 1, 1.5, 0.5, 0.5,
-4.646852, -4.027149, -4, 0, 1.5, 0.5, 0.5,
-4.646852, -4.027149, -2, 0, -0.5, 0.5, 0.5,
-4.646852, -4.027149, -2, 1, -0.5, 0.5, 0.5,
-4.646852, -4.027149, -2, 1, 1.5, 0.5, 0.5,
-4.646852, -4.027149, -2, 0, 1.5, 0.5, 0.5,
-4.646852, -4.027149, 0, 0, -0.5, 0.5, 0.5,
-4.646852, -4.027149, 0, 1, -0.5, 0.5, 0.5,
-4.646852, -4.027149, 0, 1, 1.5, 0.5, 0.5,
-4.646852, -4.027149, 0, 0, 1.5, 0.5, 0.5,
-4.646852, -4.027149, 2, 0, -0.5, 0.5, 0.5,
-4.646852, -4.027149, 2, 1, -0.5, 0.5, 0.5,
-4.646852, -4.027149, 2, 1, 1.5, 0.5, 0.5,
-4.646852, -4.027149, 2, 0, 1.5, 0.5, 0.5,
-4.646852, -4.027149, 4, 0, -0.5, 0.5, 0.5,
-4.646852, -4.027149, 4, 1, -0.5, 0.5, 0.5,
-4.646852, -4.027149, 4, 1, 1.5, 0.5, 0.5,
-4.646852, -4.027149, 4, 0, 1.5, 0.5, 0.5
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
-4.078433, -3.502779, -5.289604,
-4.078433, 3.488829, -5.289604,
-4.078433, -3.502779, 4.695659,
-4.078433, 3.488829, 4.695659,
-4.078433, -3.502779, -5.289604,
-4.078433, -3.502779, 4.695659,
-4.078433, 3.488829, -5.289604,
-4.078433, 3.488829, 4.695659,
-4.078433, -3.502779, -5.289604,
3.500486, -3.502779, -5.289604,
-4.078433, -3.502779, 4.695659,
3.500486, -3.502779, 4.695659,
-4.078433, 3.488829, -5.289604,
3.500486, 3.488829, -5.289604,
-4.078433, 3.488829, 4.695659,
3.500486, 3.488829, 4.695659,
3.500486, -3.502779, -5.289604,
3.500486, 3.488829, -5.289604,
3.500486, -3.502779, 4.695659,
3.500486, 3.488829, 4.695659,
3.500486, -3.502779, -5.289604,
3.500486, -3.502779, 4.695659,
3.500486, 3.488829, -5.289604,
3.500486, 3.488829, 4.695659
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
var radius = 7.664585;
var distance = 34.10061;
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
mvMatrix.translate( 0.2889736, 0.006974816, 0.2969728 );
mvMatrix.scale( 1.093441, 1.185292, 0.829933 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.10061);
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
sodium-2-phenyl-phen<-read.table("sodium-2-phenyl-phen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sodium-2-phenyl-phen$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium' not found
```

```r
y<-sodium-2-phenyl-phen$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium' not found
```

```r
z<-sodium-2-phenyl-phen$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium' not found
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
-3.96806, -0.9534705, -2.087309, 0, 0, 1, 1, 1,
-3.092299, 1.912954, -0.269494, 1, 0, 0, 1, 1,
-2.955946, -1.009796, -1.522207, 1, 0, 0, 1, 1,
-2.785669, -2.327358, -1.532544, 1, 0, 0, 1, 1,
-2.63165, 0.1489064, -0.5504113, 1, 0, 0, 1, 1,
-2.60168, -0.7567096, -2.911981, 1, 0, 0, 1, 1,
-2.492003, 1.212814, -0.2874158, 0, 0, 0, 1, 1,
-2.487791, -0.5800097, -3.213622, 0, 0, 0, 1, 1,
-2.486045, -0.03248389, -0.837465, 0, 0, 0, 1, 1,
-2.431661, -0.9208186, -1.032757, 0, 0, 0, 1, 1,
-2.410163, -0.6389693, -0.07424076, 0, 0, 0, 1, 1,
-2.304336, -0.4578546, -1.07733, 0, 0, 0, 1, 1,
-2.2941, 1.22543, -3.431774, 0, 0, 0, 1, 1,
-2.266832, -1.087802, -2.46396, 1, 1, 1, 1, 1,
-2.212054, 0.121817, -2.127096, 1, 1, 1, 1, 1,
-2.18066, -0.6280357, -0.3738675, 1, 1, 1, 1, 1,
-2.146574, -0.9047874, -1.659483, 1, 1, 1, 1, 1,
-2.143185, -1.340149, -1.057967, 1, 1, 1, 1, 1,
-2.108715, -0.8231903, -2.549541, 1, 1, 1, 1, 1,
-2.097283, 0.3118812, -3.889487, 1, 1, 1, 1, 1,
-2.06993, 0.06982207, -1.843378, 1, 1, 1, 1, 1,
-2.066084, 0.4572123, -2.612821, 1, 1, 1, 1, 1,
-2.053099, -0.2575785, -3.758878, 1, 1, 1, 1, 1,
-2.045502, 1.669382, -1.867195, 1, 1, 1, 1, 1,
-2.019003, -1.208518, -1.052718, 1, 1, 1, 1, 1,
-2.003401, -0.7214668, -1.779831, 1, 1, 1, 1, 1,
-1.996165, -0.9737589, -1.411223, 1, 1, 1, 1, 1,
-1.968292, -1.414173, -2.800023, 1, 1, 1, 1, 1,
-1.950974, 1.455843, -4.205164, 0, 0, 1, 1, 1,
-1.935812, -0.4082631, -1.33885, 1, 0, 0, 1, 1,
-1.930709, 1.549939, -1.95146, 1, 0, 0, 1, 1,
-1.847358, -1.16895, -2.905212, 1, 0, 0, 1, 1,
-1.83089, -1.003084, -1.756714, 1, 0, 0, 1, 1,
-1.825717, 1.162172, -2.964425, 1, 0, 0, 1, 1,
-1.809717, 0.6553994, -2.2279, 0, 0, 0, 1, 1,
-1.805676, -0.1092121, -2.712545, 0, 0, 0, 1, 1,
-1.801645, 1.98236, 0.3388708, 0, 0, 0, 1, 1,
-1.799502, 0.07035264, -1.787262, 0, 0, 0, 1, 1,
-1.789837, -0.3862668, -3.243356, 0, 0, 0, 1, 1,
-1.78768, 0.6953872, -0.2313843, 0, 0, 0, 1, 1,
-1.784168, -1.456711, -0.4205591, 0, 0, 0, 1, 1,
-1.78214, -3.400959, -3.891006, 1, 1, 1, 1, 1,
-1.776623, -0.4907685, -0.8478179, 1, 1, 1, 1, 1,
-1.764223, -0.6877128, -2.248108, 1, 1, 1, 1, 1,
-1.756927, 0.7521476, -0.1628422, 1, 1, 1, 1, 1,
-1.746509, -1.540159, -2.130966, 1, 1, 1, 1, 1,
-1.740956, 0.8138618, -0.1310723, 1, 1, 1, 1, 1,
-1.724381, -0.7474858, -1.419297, 1, 1, 1, 1, 1,
-1.711174, -0.1098187, -2.567261, 1, 1, 1, 1, 1,
-1.699008, -0.3406514, -3.147099, 1, 1, 1, 1, 1,
-1.683079, 2.229816, -1.599705, 1, 1, 1, 1, 1,
-1.65491, -0.6730439, -2.746823, 1, 1, 1, 1, 1,
-1.649114, -0.1628439, -0.488153, 1, 1, 1, 1, 1,
-1.624663, -0.4959878, -2.428138, 1, 1, 1, 1, 1,
-1.605827, 0.4220124, 0.3238243, 1, 1, 1, 1, 1,
-1.605692, -0.04673102, -0.9033039, 1, 1, 1, 1, 1,
-1.58397, 2.028466, -1.940777, 0, 0, 1, 1, 1,
-1.564899, 0.8324335, -0.7429392, 1, 0, 0, 1, 1,
-1.561865, -0.2154821, -2.447405, 1, 0, 0, 1, 1,
-1.548675, 0.7235711, 0.09137676, 1, 0, 0, 1, 1,
-1.540587, 1.268867, -2.188932, 1, 0, 0, 1, 1,
-1.537223, -0.4430065, -2.351382, 1, 0, 0, 1, 1,
-1.536694, 1.353017, -1.123772, 0, 0, 0, 1, 1,
-1.529475, -0.6228081, -1.445165, 0, 0, 0, 1, 1,
-1.508868, -2.025882, -2.801065, 0, 0, 0, 1, 1,
-1.504111, 0.3173364, -1.869096, 0, 0, 0, 1, 1,
-1.484087, -2.162682, -2.139968, 0, 0, 0, 1, 1,
-1.480856, 0.2745246, -0.30521, 0, 0, 0, 1, 1,
-1.477591, 0.139528, -1.606292, 0, 0, 0, 1, 1,
-1.477578, -1.36627, -3.1287, 1, 1, 1, 1, 1,
-1.473035, -2.260265, -1.84068, 1, 1, 1, 1, 1,
-1.472741, 0.680638, -0.8170046, 1, 1, 1, 1, 1,
-1.469971, 2.62579, -1.12986, 1, 1, 1, 1, 1,
-1.469774, -0.1109054, -0.5175628, 1, 1, 1, 1, 1,
-1.469676, -0.1932337, -1.137854, 1, 1, 1, 1, 1,
-1.46553, -0.2117446, -2.245582, 1, 1, 1, 1, 1,
-1.454219, -0.8122221, -1.317779, 1, 1, 1, 1, 1,
-1.439068, -0.3826042, 0.2392446, 1, 1, 1, 1, 1,
-1.436074, -0.1194967, -1.934066, 1, 1, 1, 1, 1,
-1.435863, 1.71117, -0.9319742, 1, 1, 1, 1, 1,
-1.43449, -0.1872058, -2.979631, 1, 1, 1, 1, 1,
-1.429218, 1.18472, -2.699749, 1, 1, 1, 1, 1,
-1.426597, -0.3506622, -1.132003, 1, 1, 1, 1, 1,
-1.421562, 0.299011, -2.083209, 1, 1, 1, 1, 1,
-1.421347, -0.8007173, -1.134679, 0, 0, 1, 1, 1,
-1.4155, -1.136224, -3.802991, 1, 0, 0, 1, 1,
-1.406506, 1.715431, -0.3985607, 1, 0, 0, 1, 1,
-1.40115, -0.2804652, -1.055546, 1, 0, 0, 1, 1,
-1.398844, -0.6711147, -3.432931, 1, 0, 0, 1, 1,
-1.397737, 0.4668709, -1.284564, 1, 0, 0, 1, 1,
-1.389784, 0.4493756, -1.525997, 0, 0, 0, 1, 1,
-1.362101, 0.3030257, -2.693682, 0, 0, 0, 1, 1,
-1.342914, -0.02837675, -2.305553, 0, 0, 0, 1, 1,
-1.341994, -0.5362924, -1.04682, 0, 0, 0, 1, 1,
-1.324813, -0.4711493, -2.119524, 0, 0, 0, 1, 1,
-1.319809, 1.946305, -1.115021, 0, 0, 0, 1, 1,
-1.313568, 0.8301333, -0.6074676, 0, 0, 0, 1, 1,
-1.306418, 1.746737, -1.053916, 1, 1, 1, 1, 1,
-1.302114, -0.01647426, -1.409162, 1, 1, 1, 1, 1,
-1.294786, 0.9406044, -1.209, 1, 1, 1, 1, 1,
-1.287483, 0.6559012, -0.6357467, 1, 1, 1, 1, 1,
-1.284992, 0.6994231, -0.8492023, 1, 1, 1, 1, 1,
-1.271753, 1.076656, -0.1191067, 1, 1, 1, 1, 1,
-1.269395, 0.6524037, -1.673163, 1, 1, 1, 1, 1,
-1.269006, 0.9996659, -2.184675, 1, 1, 1, 1, 1,
-1.262802, -1.09003, -2.143654, 1, 1, 1, 1, 1,
-1.254806, 0.2555975, -3.751186, 1, 1, 1, 1, 1,
-1.238125, -0.6021457, -2.384101, 1, 1, 1, 1, 1,
-1.236585, -0.558682, -2.08757, 1, 1, 1, 1, 1,
-1.234367, -0.7806939, -1.344014, 1, 1, 1, 1, 1,
-1.224113, 0.2438163, -1.566198, 1, 1, 1, 1, 1,
-1.219667, 0.5301028, 0.8924724, 1, 1, 1, 1, 1,
-1.213758, -1.719409, -1.95153, 0, 0, 1, 1, 1,
-1.203423, 1.405902, 0.7835891, 1, 0, 0, 1, 1,
-1.182867, -0.1063883, -1.324919, 1, 0, 0, 1, 1,
-1.170406, 1.711617, -0.3333387, 1, 0, 0, 1, 1,
-1.169103, 0.3781969, -1.258146, 1, 0, 0, 1, 1,
-1.16598, 0.1709044, -2.055922, 1, 0, 0, 1, 1,
-1.16332, 0.007203494, 0.695873, 0, 0, 0, 1, 1,
-1.161288, -0.3995126, -3.565238, 0, 0, 0, 1, 1,
-1.15699, 0.8199841, -0.1936256, 0, 0, 0, 1, 1,
-1.148915, 0.8186361, -1.539559, 0, 0, 0, 1, 1,
-1.147109, -0.5955448, -0.7294238, 0, 0, 0, 1, 1,
-1.145658, -0.2734812, -1.110162, 0, 0, 0, 1, 1,
-1.144184, 0.285307, 1.022508, 0, 0, 0, 1, 1,
-1.13617, -1.404537, -5.144188, 1, 1, 1, 1, 1,
-1.128031, 1.201213, -2.175996, 1, 1, 1, 1, 1,
-1.125716, -1.097204, -3.597005, 1, 1, 1, 1, 1,
-1.118771, 0.9591533, -1.64493, 1, 1, 1, 1, 1,
-1.093672, -0.7745489, -1.560188, 1, 1, 1, 1, 1,
-1.083347, 0.7482304, -1.813742, 1, 1, 1, 1, 1,
-1.080215, -0.1895252, -2.378258, 1, 1, 1, 1, 1,
-1.079853, -0.3159441, -1.250497, 1, 1, 1, 1, 1,
-1.079092, 1.425974, -1.306363, 1, 1, 1, 1, 1,
-1.076321, -0.8244325, -1.669545, 1, 1, 1, 1, 1,
-1.076137, -0.703856, -0.3074465, 1, 1, 1, 1, 1,
-1.072661, -2.170383, -4.734998, 1, 1, 1, 1, 1,
-1.069288, -0.1711166, -3.129548, 1, 1, 1, 1, 1,
-1.068242, 0.3603491, -1.364028, 1, 1, 1, 1, 1,
-1.065315, -1.179714, -2.404332, 1, 1, 1, 1, 1,
-1.064691, 0.2929718, 0.9455074, 0, 0, 1, 1, 1,
-1.053684, -0.3973551, -1.158503, 1, 0, 0, 1, 1,
-1.045368, -1.451408, -3.326472, 1, 0, 0, 1, 1,
-1.044605, -0.03122782, -2.633128, 1, 0, 0, 1, 1,
-1.03872, -1.620028, -3.953854, 1, 0, 0, 1, 1,
-1.032863, -0.9872226, -1.184259, 1, 0, 0, 1, 1,
-1.028964, 0.7448133, -0.9071172, 0, 0, 0, 1, 1,
-1.022904, 0.9778729, -0.4709686, 0, 0, 0, 1, 1,
-1.022427, 0.05595441, -3.059932, 0, 0, 0, 1, 1,
-1.02224, -0.595509, -0.4585436, 0, 0, 0, 1, 1,
-1.015426, -0.1485083, -0.2870249, 0, 0, 0, 1, 1,
-1.009583, -0.4212379, -1.481502, 0, 0, 0, 1, 1,
-1.007531, 0.8242753, 0.5938174, 0, 0, 0, 1, 1,
-1.002353, -0.03178133, -2.022707, 1, 1, 1, 1, 1,
-1.001487, -1.078271, -3.087238, 1, 1, 1, 1, 1,
-1.000994, 0.06346621, -0.3689692, 1, 1, 1, 1, 1,
-0.9992455, -1.023329, -1.488213, 1, 1, 1, 1, 1,
-0.997813, 0.2552533, -1.163143, 1, 1, 1, 1, 1,
-0.9970331, -1.903304, -0.853309, 1, 1, 1, 1, 1,
-0.9833757, 0.6145872, -2.276066, 1, 1, 1, 1, 1,
-0.9787574, -1.030696, -2.481168, 1, 1, 1, 1, 1,
-0.9771326, -0.7816003, -2.356755, 1, 1, 1, 1, 1,
-0.9720822, 1.108849, 0.3903422, 1, 1, 1, 1, 1,
-0.9689689, -0.04240235, -0.7964436, 1, 1, 1, 1, 1,
-0.9673668, -1.511476, -2.503728, 1, 1, 1, 1, 1,
-0.951837, 0.8537257, -1.587236, 1, 1, 1, 1, 1,
-0.95156, 0.1273285, -2.868236, 1, 1, 1, 1, 1,
-0.9446824, -0.9390739, -3.134378, 1, 1, 1, 1, 1,
-0.9443208, 0.380639, -0.4463037, 0, 0, 1, 1, 1,
-0.9420124, -0.7649559, -1.899637, 1, 0, 0, 1, 1,
-0.9364777, -1.295198, -0.6775715, 1, 0, 0, 1, 1,
-0.9207171, 1.364245, -1.320462, 1, 0, 0, 1, 1,
-0.9177268, 1.565035, 0.6214965, 1, 0, 0, 1, 1,
-0.90943, -2.738473, -2.75507, 1, 0, 0, 1, 1,
-0.9083091, 1.762913, 0.6178692, 0, 0, 0, 1, 1,
-0.9045252, -1.130254, -1.544373, 0, 0, 0, 1, 1,
-0.8965595, 0.1548513, -1.953351, 0, 0, 0, 1, 1,
-0.8927597, 1.008786, 0.05213661, 0, 0, 0, 1, 1,
-0.8889295, 0.2476306, -1.831192, 0, 0, 0, 1, 1,
-0.8848136, 1.901423, 0.09034453, 0, 0, 0, 1, 1,
-0.8840894, 0.5941485, -0.9544176, 0, 0, 0, 1, 1,
-0.8824205, 0.5011736, -2.965351, 1, 1, 1, 1, 1,
-0.8788541, -0.8991932, -3.423405, 1, 1, 1, 1, 1,
-0.8761562, 1.310362, 0.8590856, 1, 1, 1, 1, 1,
-0.8746445, 0.3398183, -0.3777574, 1, 1, 1, 1, 1,
-0.8734838, -0.2735136, -2.005011, 1, 1, 1, 1, 1,
-0.8717829, -1.39649, -3.881817, 1, 1, 1, 1, 1,
-0.8700601, 0.7556785, -1.077163, 1, 1, 1, 1, 1,
-0.8686188, 1.969443, -1.146669, 1, 1, 1, 1, 1,
-0.8659286, 1.7561, -2.771792, 1, 1, 1, 1, 1,
-0.8552845, -0.04574639, -3.018733, 1, 1, 1, 1, 1,
-0.8537593, 1.142166, -0.2658601, 1, 1, 1, 1, 1,
-0.8529628, -0.8810263, -3.646323, 1, 1, 1, 1, 1,
-0.8380057, 1.052828, 0.6036389, 1, 1, 1, 1, 1,
-0.8346464, 2.020368, 0.05393964, 1, 1, 1, 1, 1,
-0.8325115, 0.7194555, -0.7254316, 1, 1, 1, 1, 1,
-0.8316584, 3.278319, -0.6139208, 0, 0, 1, 1, 1,
-0.8117623, 0.2193856, -1.453124, 1, 0, 0, 1, 1,
-0.8058483, 0.377303, 0.01038753, 1, 0, 0, 1, 1,
-0.8036586, 1.277088, 1.674814, 1, 0, 0, 1, 1,
-0.8035836, 1.655538, -1.173393, 1, 0, 0, 1, 1,
-0.8034844, -2.424903, -1.533839, 1, 0, 0, 1, 1,
-0.8025544, 0.1311343, 0.4408577, 0, 0, 0, 1, 1,
-0.8009791, -1.715047, -3.295167, 0, 0, 0, 1, 1,
-0.7930546, -1.339371, -2.162855, 0, 0, 0, 1, 1,
-0.7903015, 0.2149305, -0.2763716, 0, 0, 0, 1, 1,
-0.7889341, 0.160122, -1.0838, 0, 0, 0, 1, 1,
-0.7870142, -1.716195, -0.4333748, 0, 0, 0, 1, 1,
-0.7808498, -0.2610005, -2.975483, 0, 0, 0, 1, 1,
-0.7757988, 0.0338221, -1.442947, 1, 1, 1, 1, 1,
-0.7757543, -1.065084, -0.9413086, 1, 1, 1, 1, 1,
-0.7663501, 0.1336604, -1.53411, 1, 1, 1, 1, 1,
-0.7577571, -2.017373, -1.836887, 1, 1, 1, 1, 1,
-0.752374, 0.8220345, -0.3692013, 1, 1, 1, 1, 1,
-0.7505202, 0.8802541, 1.133174, 1, 1, 1, 1, 1,
-0.7462273, 0.2942167, -1.408071, 1, 1, 1, 1, 1,
-0.7451767, -0.8178214, -3.36506, 1, 1, 1, 1, 1,
-0.7406511, 0.8960525, 0.6573926, 1, 1, 1, 1, 1,
-0.7391083, -1.15122, -3.057589, 1, 1, 1, 1, 1,
-0.7367274, -0.6240656, -2.240991, 1, 1, 1, 1, 1,
-0.7340341, -0.4566507, -4.50004, 1, 1, 1, 1, 1,
-0.7334452, -0.2682249, -3.120521, 1, 1, 1, 1, 1,
-0.7284766, -1.339393, -2.972732, 1, 1, 1, 1, 1,
-0.7226477, -1.263666, -2.154403, 1, 1, 1, 1, 1,
-0.7145633, 0.4973862, 0.3506502, 0, 0, 1, 1, 1,
-0.7121156, 0.3428632, -1.609824, 1, 0, 0, 1, 1,
-0.7097733, -0.8096868, -1.492529, 1, 0, 0, 1, 1,
-0.7084591, -1.201419, -3.288558, 1, 0, 0, 1, 1,
-0.7045665, -0.2234775, -2.678658, 1, 0, 0, 1, 1,
-0.7004942, -0.647211, -3.461898, 1, 0, 0, 1, 1,
-0.6976463, 0.405109, -0.1033887, 0, 0, 0, 1, 1,
-0.6874809, -1.249729, -1.057992, 0, 0, 0, 1, 1,
-0.6868197, -0.7310314, -2.093877, 0, 0, 0, 1, 1,
-0.6849632, -0.8300544, -2.125098, 0, 0, 0, 1, 1,
-0.6843196, -1.057395, -2.074198, 0, 0, 0, 1, 1,
-0.681845, 1.804848, -0.6733868, 0, 0, 0, 1, 1,
-0.6784356, 0.05848799, -2.65687, 0, 0, 0, 1, 1,
-0.6737773, 0.5606356, -1.765506, 1, 1, 1, 1, 1,
-0.6681677, 0.342475, -0.4147538, 1, 1, 1, 1, 1,
-0.6671431, 0.1800725, -2.095357, 1, 1, 1, 1, 1,
-0.6648412, -0.9079731, -2.631886, 1, 1, 1, 1, 1,
-0.6644531, -0.6755179, -2.503688, 1, 1, 1, 1, 1,
-0.664259, -1.126484, -2.180592, 1, 1, 1, 1, 1,
-0.6597137, 0.8289682, -2.18827, 1, 1, 1, 1, 1,
-0.65803, 0.2655202, -0.2784779, 1, 1, 1, 1, 1,
-0.6541876, -0.6284317, -1.449158, 1, 1, 1, 1, 1,
-0.6404812, -0.6330271, -0.4685002, 1, 1, 1, 1, 1,
-0.6391848, 0.09134282, -3.844171, 1, 1, 1, 1, 1,
-0.6355114, -2.053841, -4.385584, 1, 1, 1, 1, 1,
-0.6346473, -0.116505, -1.848484, 1, 1, 1, 1, 1,
-0.6343393, -1.505525, -4.1042, 1, 1, 1, 1, 1,
-0.6337077, 0.2204103, -1.634834, 1, 1, 1, 1, 1,
-0.6323544, 0.2196507, -2.687368, 0, 0, 1, 1, 1,
-0.6306768, -2.157539, -3.991968, 1, 0, 0, 1, 1,
-0.6236601, -0.07511285, -2.969994, 1, 0, 0, 1, 1,
-0.6220191, 0.8542543, -0.1944119, 1, 0, 0, 1, 1,
-0.6183965, 0.5232105, -0.521407, 1, 0, 0, 1, 1,
-0.6163371, -0.7824301, -5.133399, 1, 0, 0, 1, 1,
-0.6126803, -0.3952573, -2.188727, 0, 0, 0, 1, 1,
-0.6073182, 0.8156181, -1.033349, 0, 0, 0, 1, 1,
-0.60497, -2.241765, -3.391162, 0, 0, 0, 1, 1,
-0.6046419, -0.8044933, -1.293833, 0, 0, 0, 1, 1,
-0.5966265, 0.3810412, -2.12703, 0, 0, 0, 1, 1,
-0.5940324, -0.9118387, -2.636711, 0, 0, 0, 1, 1,
-0.5886958, 0.1465489, -2.043829, 0, 0, 0, 1, 1,
-0.5863813, 1.747424, -2.093848, 1, 1, 1, 1, 1,
-0.58229, 0.963025, -0.1055395, 1, 1, 1, 1, 1,
-0.5778549, -1.069818, -3.204907, 1, 1, 1, 1, 1,
-0.5777483, 1.084527, -0.6564406, 1, 1, 1, 1, 1,
-0.5760348, -0.3603888, -3.413808, 1, 1, 1, 1, 1,
-0.5737886, -0.6880414, -2.150918, 1, 1, 1, 1, 1,
-0.5711559, 0.3734959, -1.132471, 1, 1, 1, 1, 1,
-0.5691733, -0.9126688, -3.557835, 1, 1, 1, 1, 1,
-0.5679922, 0.2093654, -1.484559, 1, 1, 1, 1, 1,
-0.5674832, -0.7461986, -2.74127, 1, 1, 1, 1, 1,
-0.5613497, -1.095564, -0.8639221, 1, 1, 1, 1, 1,
-0.5610435, -1.739513, -1.864842, 1, 1, 1, 1, 1,
-0.5582664, 0.894394, -0.2812803, 1, 1, 1, 1, 1,
-0.5579966, -2.206656, -3.94489, 1, 1, 1, 1, 1,
-0.5576264, -2.173711, -2.688227, 1, 1, 1, 1, 1,
-0.5542959, 1.393422, 0.02765246, 0, 0, 1, 1, 1,
-0.5537367, -1.015411, -3.563429, 1, 0, 0, 1, 1,
-0.5527538, -0.06587549, -0.9450977, 1, 0, 0, 1, 1,
-0.5519547, -1.700049, -3.652398, 1, 0, 0, 1, 1,
-0.549661, 0.2435918, -0.5194374, 1, 0, 0, 1, 1,
-0.5490375, -1.506576, -1.781026, 1, 0, 0, 1, 1,
-0.548497, 0.3836471, -0.07194427, 0, 0, 0, 1, 1,
-0.5427654, -2.917956, -2.644744, 0, 0, 0, 1, 1,
-0.5409831, -1.514542, -2.495253, 0, 0, 0, 1, 1,
-0.5405684, -0.7173321, -2.7622, 0, 0, 0, 1, 1,
-0.5391758, -0.5187528, -1.277088, 0, 0, 0, 1, 1,
-0.5389479, -1.463261, -3.326246, 0, 0, 0, 1, 1,
-0.5344051, -0.550784, -2.5932, 0, 0, 0, 1, 1,
-0.5324971, 0.04545365, -0.691362, 1, 1, 1, 1, 1,
-0.5277505, 1.319051, -0.4590452, 1, 1, 1, 1, 1,
-0.5238611, -0.4398595, -1.040893, 1, 1, 1, 1, 1,
-0.5150854, 0.1964749, -0.6066038, 1, 1, 1, 1, 1,
-0.514304, -0.9708009, -3.649607, 1, 1, 1, 1, 1,
-0.5137145, -0.9535504, -0.8126627, 1, 1, 1, 1, 1,
-0.5134209, 0.2700631, -1.829396, 1, 1, 1, 1, 1,
-0.5133882, 0.1110609, 0.3875348, 1, 1, 1, 1, 1,
-0.5132362, 0.6928046, -1.671672, 1, 1, 1, 1, 1,
-0.5104421, 0.5946066, -2.440934, 1, 1, 1, 1, 1,
-0.5088063, -0.9457694, -2.443243, 1, 1, 1, 1, 1,
-0.5046385, 0.05761852, -0.6862816, 1, 1, 1, 1, 1,
-0.5044807, -1.346781, -1.295791, 1, 1, 1, 1, 1,
-0.502425, -1.223878, -3.456148, 1, 1, 1, 1, 1,
-0.5014834, -0.3878166, -2.352592, 1, 1, 1, 1, 1,
-0.4973858, -0.9768534, -2.117636, 0, 0, 1, 1, 1,
-0.4938684, -0.5561461, -1.989603, 1, 0, 0, 1, 1,
-0.4930835, 1.555264, -1.528716, 1, 0, 0, 1, 1,
-0.4920961, -1.00338, -3.481423, 1, 0, 0, 1, 1,
-0.4893733, 0.1542295, 0.2903111, 1, 0, 0, 1, 1,
-0.4860342, -0.05387869, -0.5459573, 1, 0, 0, 1, 1,
-0.4817918, 0.0395568, -1.565192, 0, 0, 0, 1, 1,
-0.4790665, 0.1837766, -1.312459, 0, 0, 0, 1, 1,
-0.4779999, -0.1929665, -0.6985632, 0, 0, 0, 1, 1,
-0.4755376, -0.2277431, -0.375708, 0, 0, 0, 1, 1,
-0.4744942, -1.828997, -2.887796, 0, 0, 0, 1, 1,
-0.4737357, 0.5121934, -0.01579395, 0, 0, 0, 1, 1,
-0.4685881, -0.3169496, -0.7460896, 0, 0, 0, 1, 1,
-0.4644922, -1.22289, -4.071814, 1, 1, 1, 1, 1,
-0.4605224, -1.587898, -2.299989, 1, 1, 1, 1, 1,
-0.4589081, -0.3393678, -2.301871, 1, 1, 1, 1, 1,
-0.4572449, -1.752226, -4.592588, 1, 1, 1, 1, 1,
-0.4560853, -1.634596, -3.017128, 1, 1, 1, 1, 1,
-0.4536584, -0.397547, -4.183309, 1, 1, 1, 1, 1,
-0.4475986, 1.124389, -0.7624668, 1, 1, 1, 1, 1,
-0.4452655, 2.260348, -0.681238, 1, 1, 1, 1, 1,
-0.4432466, 1.935243, -0.5412577, 1, 1, 1, 1, 1,
-0.4427264, 0.2637167, -1.357384, 1, 1, 1, 1, 1,
-0.4391195, -0.3560123, -2.394649, 1, 1, 1, 1, 1,
-0.4369294, -0.1523968, -3.314151, 1, 1, 1, 1, 1,
-0.4331427, 0.1234189, 1.268748, 1, 1, 1, 1, 1,
-0.4302921, 0.5059683, -0.06885904, 1, 1, 1, 1, 1,
-0.4261602, -2.400312, -1.796247, 1, 1, 1, 1, 1,
-0.4219151, -0.6992952, -2.68707, 0, 0, 1, 1, 1,
-0.4200388, 0.1560357, -0.4687685, 1, 0, 0, 1, 1,
-0.4194219, -1.191845, -1.713429, 1, 0, 0, 1, 1,
-0.4183138, -0.1635306, -1.986554, 1, 0, 0, 1, 1,
-0.4172445, -0.1366614, -2.073113, 1, 0, 0, 1, 1,
-0.415763, 0.2753307, 1.303977, 1, 0, 0, 1, 1,
-0.4144211, -0.8021404, -2.602684, 0, 0, 0, 1, 1,
-0.4118724, -1.084522, -3.49419, 0, 0, 0, 1, 1,
-0.4100515, 0.3504991, -0.03902761, 0, 0, 0, 1, 1,
-0.4099106, -0.1494588, -1.561771, 0, 0, 0, 1, 1,
-0.4033474, 1.44741, 0.3960676, 0, 0, 0, 1, 1,
-0.4029039, 1.228761, 1.613738, 0, 0, 0, 1, 1,
-0.4004791, 1.288609, -0.6936121, 0, 0, 0, 1, 1,
-0.3974144, -0.7994139, -3.437822, 1, 1, 1, 1, 1,
-0.3952559, -1.330727, -2.48579, 1, 1, 1, 1, 1,
-0.3920127, 1.62895, -1.260434, 1, 1, 1, 1, 1,
-0.3918415, -1.917762, -2.206557, 1, 1, 1, 1, 1,
-0.389991, 1.114619, 0.6285158, 1, 1, 1, 1, 1,
-0.3823445, 0.9898717, -0.3884121, 1, 1, 1, 1, 1,
-0.3822759, 0.2856375, -2.436028, 1, 1, 1, 1, 1,
-0.37571, 0.438405, -0.7559151, 1, 1, 1, 1, 1,
-0.3724269, 2.30704, 0.9489715, 1, 1, 1, 1, 1,
-0.3666869, 1.415005, -0.8461987, 1, 1, 1, 1, 1,
-0.3651998, -0.834445, -3.95981, 1, 1, 1, 1, 1,
-0.3613884, -0.06106294, -0.7932246, 1, 1, 1, 1, 1,
-0.3606785, 0.6552761, -1.237513, 1, 1, 1, 1, 1,
-0.3605119, -0.5158833, -2.046667, 1, 1, 1, 1, 1,
-0.3568027, 1.487729, -1.807255, 1, 1, 1, 1, 1,
-0.3541667, 2.014956, 0.07147537, 0, 0, 1, 1, 1,
-0.3541414, -0.9927428, -1.857892, 1, 0, 0, 1, 1,
-0.3530988, 0.750392, 0.1588401, 1, 0, 0, 1, 1,
-0.3492002, -0.3217076, -4.308689, 1, 0, 0, 1, 1,
-0.3467429, -0.3232021, -3.16256, 1, 0, 0, 1, 1,
-0.3440892, 0.04803393, -2.225294, 1, 0, 0, 1, 1,
-0.343829, -0.30612, -0.8601349, 0, 0, 0, 1, 1,
-0.3379249, 0.7843339, 0.614076, 0, 0, 0, 1, 1,
-0.3377421, 0.5600787, -0.7044626, 0, 0, 0, 1, 1,
-0.3367417, 1.428181, -1.990235, 0, 0, 0, 1, 1,
-0.3353992, 0.7284811, 0.06739736, 0, 0, 0, 1, 1,
-0.3338055, -1.222142, -3.335025, 0, 0, 0, 1, 1,
-0.3307478, -0.9965045, -3.873549, 0, 0, 0, 1, 1,
-0.3269635, -0.417712, -2.440149, 1, 1, 1, 1, 1,
-0.3260807, 1.070087, -1.265821, 1, 1, 1, 1, 1,
-0.3247758, 0.4865564, -0.8707836, 1, 1, 1, 1, 1,
-0.3219234, -0.01143363, -0.8676019, 1, 1, 1, 1, 1,
-0.3186191, 1.824865, -2.172048, 1, 1, 1, 1, 1,
-0.3177263, 0.5199641, 0.1077692, 1, 1, 1, 1, 1,
-0.3144482, -0.5355209, -1.894956, 1, 1, 1, 1, 1,
-0.3140061, 1.634584, 0.2920209, 1, 1, 1, 1, 1,
-0.3112263, -0.1201298, -2.76211, 1, 1, 1, 1, 1,
-0.3064648, 0.7109375, -0.7585434, 1, 1, 1, 1, 1,
-0.3060201, -0.2039885, -1.312725, 1, 1, 1, 1, 1,
-0.3053552, 0.3462993, 1.06205, 1, 1, 1, 1, 1,
-0.2985437, 0.5627008, -0.3869436, 1, 1, 1, 1, 1,
-0.2962082, 0.2017462, -0.8030041, 1, 1, 1, 1, 1,
-0.2935903, 0.5543358, 0.9026349, 1, 1, 1, 1, 1,
-0.2804219, 0.05248896, -1.965469, 0, 0, 1, 1, 1,
-0.2796243, 0.8796387, -0.923641, 1, 0, 0, 1, 1,
-0.279382, 0.9221989, 0.7448279, 1, 0, 0, 1, 1,
-0.2590235, -0.09144152, -1.853731, 1, 0, 0, 1, 1,
-0.258193, 1.854118, 1.126536, 1, 0, 0, 1, 1,
-0.2578081, -1.290941, -2.216406, 1, 0, 0, 1, 1,
-0.2570241, 2.114236, 0.1740263, 0, 0, 0, 1, 1,
-0.2564705, 0.7768073, -0.7804196, 0, 0, 0, 1, 1,
-0.2470906, 1.525472, -1.373094, 0, 0, 0, 1, 1,
-0.2416513, 2.005791, 0.4723297, 0, 0, 0, 1, 1,
-0.2395229, -0.2840831, -2.022163, 0, 0, 0, 1, 1,
-0.238311, 0.562177, -1.726917, 0, 0, 0, 1, 1,
-0.2324802, -0.561856, -3.362345, 0, 0, 0, 1, 1,
-0.2310894, 0.7134003, -0.8632384, 1, 1, 1, 1, 1,
-0.2302925, 0.01884579, 0.3828273, 1, 1, 1, 1, 1,
-0.2301828, 0.8979308, 1.705387, 1, 1, 1, 1, 1,
-0.2294487, -0.4448681, -2.571184, 1, 1, 1, 1, 1,
-0.2270692, 0.7602683, 0.05439123, 1, 1, 1, 1, 1,
-0.2255901, 0.702011, -1.157547, 1, 1, 1, 1, 1,
-0.2251665, -0.801751, -3.43019, 1, 1, 1, 1, 1,
-0.2236545, -0.2202074, -1.025477, 1, 1, 1, 1, 1,
-0.2219401, 0.5446501, -0.6573294, 1, 1, 1, 1, 1,
-0.2195842, -0.2468522, -2.440135, 1, 1, 1, 1, 1,
-0.2157329, 0.2915584, -0.110687, 1, 1, 1, 1, 1,
-0.214857, 0.3936083, -0.211348, 1, 1, 1, 1, 1,
-0.2131754, 0.06588054, -2.177066, 1, 1, 1, 1, 1,
-0.2047989, 0.3701953, -0.3783903, 1, 1, 1, 1, 1,
-0.2043279, -0.2791863, -2.854023, 1, 1, 1, 1, 1,
-0.1916991, 0.09606894, -0.5488914, 0, 0, 1, 1, 1,
-0.1772461, 0.7319835, 1.187633, 1, 0, 0, 1, 1,
-0.1765685, -0.01726725, -0.1679955, 1, 0, 0, 1, 1,
-0.1764199, 0.8469761, -2.055619, 1, 0, 0, 1, 1,
-0.1681456, -1.364693, -2.290248, 1, 0, 0, 1, 1,
-0.1672678, -0.7663802, -4.00426, 1, 0, 0, 1, 1,
-0.1659184, -1.616948, -2.930687, 0, 0, 0, 1, 1,
-0.162801, 1.524392, -0.1409094, 0, 0, 0, 1, 1,
-0.1625863, -0.002332135, -2.221611, 0, 0, 0, 1, 1,
-0.1616671, 1.645515, -0.6136819, 0, 0, 0, 1, 1,
-0.1615964, -0.1059137, -2.889106, 0, 0, 0, 1, 1,
-0.1580504, -0.6380281, -1.938023, 0, 0, 0, 1, 1,
-0.1543018, 1.485197, -1.220376, 0, 0, 0, 1, 1,
-0.153976, -1.134794, -3.698702, 1, 1, 1, 1, 1,
-0.1532074, 0.6874808, -0.04487498, 1, 1, 1, 1, 1,
-0.15274, -0.1135927, -3.876667, 1, 1, 1, 1, 1,
-0.1522804, 0.1555213, -2.760549, 1, 1, 1, 1, 1,
-0.1473825, -0.3328598, -4.451321, 1, 1, 1, 1, 1,
-0.1364564, -1.033322, -2.150141, 1, 1, 1, 1, 1,
-0.1362301, -1.420143, -4.865638, 1, 1, 1, 1, 1,
-0.1353674, -0.06259788, -0.4307114, 1, 1, 1, 1, 1,
-0.1346936, 0.4823641, -0.7937651, 1, 1, 1, 1, 1,
-0.1333522, -0.01699799, -2.125473, 1, 1, 1, 1, 1,
-0.1327136, -0.7210935, -2.619289, 1, 1, 1, 1, 1,
-0.1256682, -0.9797869, -4.336902, 1, 1, 1, 1, 1,
-0.1239357, -0.8351965, -3.728977, 1, 1, 1, 1, 1,
-0.1220522, -0.0009246613, -1.016129, 1, 1, 1, 1, 1,
-0.1212597, -0.6885602, -3.048905, 1, 1, 1, 1, 1,
-0.1212427, 0.5932073, 1.210965, 0, 0, 1, 1, 1,
-0.1175016, -0.7546564, -1.929873, 1, 0, 0, 1, 1,
-0.1172049, 0.4753245, -1.505016, 1, 0, 0, 1, 1,
-0.1169927, -0.2808037, -2.962102, 1, 0, 0, 1, 1,
-0.1157122, -2.017298, -1.33902, 1, 0, 0, 1, 1,
-0.113853, -1.421655, -4.305506, 1, 0, 0, 1, 1,
-0.1116672, -1.361955, -4.543226, 0, 0, 0, 1, 1,
-0.1069643, 0.1779243, -0.9979786, 0, 0, 0, 1, 1,
-0.1046486, 1.495466, 0.5840979, 0, 0, 0, 1, 1,
-0.09920784, 0.1125601, -2.546726, 0, 0, 0, 1, 1,
-0.09755881, -0.1231648, -2.425545, 0, 0, 0, 1, 1,
-0.09468765, -1.011296, -3.011969, 0, 0, 0, 1, 1,
-0.09288634, 0.09229283, -0.2357266, 0, 0, 0, 1, 1,
-0.08900458, -0.1344539, -2.521972, 1, 1, 1, 1, 1,
-0.08779298, 0.6950175, -0.319384, 1, 1, 1, 1, 1,
-0.08762456, 1.739186, 1.117874, 1, 1, 1, 1, 1,
-0.08744687, -0.6737837, -4.00024, 1, 1, 1, 1, 1,
-0.08383486, -0.0332097, -1.960047, 1, 1, 1, 1, 1,
-0.08158201, -0.5345494, -4.053542, 1, 1, 1, 1, 1,
-0.07984406, 0.6559619, 0.0391653, 1, 1, 1, 1, 1,
-0.07694349, 0.6439705, -0.1649406, 1, 1, 1, 1, 1,
-0.07554381, 0.8925832, 0.1086948, 1, 1, 1, 1, 1,
-0.07496228, 1.657047, 0.5734846, 1, 1, 1, 1, 1,
-0.07161103, 0.01013046, -0.1464154, 1, 1, 1, 1, 1,
-0.0682411, -0.5141469, -3.558135, 1, 1, 1, 1, 1,
-0.0654261, -1.197864, -2.879127, 1, 1, 1, 1, 1,
-0.0652061, 1.269006, 1.848787, 1, 1, 1, 1, 1,
-0.06250595, 0.3737195, -0.4415571, 1, 1, 1, 1, 1,
-0.06193721, -0.3974875, -3.75644, 0, 0, 1, 1, 1,
-0.06042653, 0.01645819, -0.8258932, 1, 0, 0, 1, 1,
-0.05687406, -2.003278, -3.973281, 1, 0, 0, 1, 1,
-0.05623817, 1.110042, -0.1852331, 1, 0, 0, 1, 1,
-0.05270935, 0.2318657, 0.3268297, 1, 0, 0, 1, 1,
-0.05187263, 0.1015176, 1.260925, 1, 0, 0, 1, 1,
-0.04677643, 0.9837803, -0.6377762, 0, 0, 0, 1, 1,
-0.04541073, 0.5422238, 0.7797716, 0, 0, 0, 1, 1,
-0.04088882, -0.1589799, -3.459257, 0, 0, 0, 1, 1,
-0.03990552, 0.3240837, -1.492836, 0, 0, 0, 1, 1,
-0.03975846, 1.015432, -0.3956699, 0, 0, 0, 1, 1,
-0.03238048, 3.387009, 0.03560289, 0, 0, 0, 1, 1,
-0.03198769, 0.4137719, -0.4824713, 0, 0, 0, 1, 1,
-0.02644871, -0.5828704, -1.38241, 1, 1, 1, 1, 1,
-0.02327507, -0.991761, -4.867117, 1, 1, 1, 1, 1,
-0.02237365, -0.8336869, -2.467796, 1, 1, 1, 1, 1,
-0.01638534, 0.6955053, -0.7674528, 1, 1, 1, 1, 1,
-0.01096379, -0.4025065, -1.465761, 1, 1, 1, 1, 1,
-0.008048352, 0.7222955, 0.8009536, 1, 1, 1, 1, 1,
-0.007322823, -1.627616, -2.413939, 1, 1, 1, 1, 1,
-0.006793086, -0.9740702, -2.902408, 1, 1, 1, 1, 1,
-0.006206929, 0.754821, -0.3482214, 1, 1, 1, 1, 1,
-0.005624206, -0.4316155, -1.704888, 1, 1, 1, 1, 1,
-0.005165579, 0.03528753, 0.01535968, 1, 1, 1, 1, 1,
-0.002383627, -0.8756194, -2.102336, 1, 1, 1, 1, 1,
0.00110746, 0.652362, -0.005177654, 1, 1, 1, 1, 1,
0.003326107, 0.3849137, 0.7428187, 1, 1, 1, 1, 1,
0.004323166, -0.1903493, 3.152637, 1, 1, 1, 1, 1,
0.004687017, 1.253613, -0.3752273, 0, 0, 1, 1, 1,
0.006002775, -1.308316, 3.988003, 1, 0, 0, 1, 1,
0.006704756, -2.07929, 0.6526606, 1, 0, 0, 1, 1,
0.008153845, -0.5386536, 3.461925, 1, 0, 0, 1, 1,
0.01012709, -1.363711, 2.656299, 1, 0, 0, 1, 1,
0.01423048, 1.46365, 0.282059, 1, 0, 0, 1, 1,
0.01559203, 0.9943401, -0.3695136, 0, 0, 0, 1, 1,
0.02247344, -0.06402984, 2.935318, 0, 0, 0, 1, 1,
0.02263891, 0.5503826, 1.157487, 0, 0, 0, 1, 1,
0.03121771, 0.04570201, 0.618504, 0, 0, 0, 1, 1,
0.03189689, -0.7773781, 2.507362, 0, 0, 0, 1, 1,
0.03325029, 0.9326964, 0.2124265, 0, 0, 0, 1, 1,
0.03480001, 2.147624, -1.72133, 0, 0, 0, 1, 1,
0.03514446, -1.65239, 3.172497, 1, 1, 1, 1, 1,
0.04167989, -0.4049772, 3.905818, 1, 1, 1, 1, 1,
0.05140068, 0.360495, -1.436582, 1, 1, 1, 1, 1,
0.05479623, -1.165217, 2.727829, 1, 1, 1, 1, 1,
0.05684419, 0.2283901, 2.140414, 1, 1, 1, 1, 1,
0.05691094, 1.019823, 0.7154035, 1, 1, 1, 1, 1,
0.05795943, 0.1682157, 0.2013079, 1, 1, 1, 1, 1,
0.06057427, 0.08852146, -0.3499788, 1, 1, 1, 1, 1,
0.06328639, 1.419666, 0.8979747, 1, 1, 1, 1, 1,
0.06537877, -1.24014, 2.531795, 1, 1, 1, 1, 1,
0.06816544, -0.2645848, 3.544328, 1, 1, 1, 1, 1,
0.06887454, -1.061862, 3.467645, 1, 1, 1, 1, 1,
0.07483125, -0.2475416, 3.102232, 1, 1, 1, 1, 1,
0.07979655, -0.2339259, 3.384473, 1, 1, 1, 1, 1,
0.08195823, -1.034205, 2.966782, 1, 1, 1, 1, 1,
0.08485938, 0.2328429, -2.127215, 0, 0, 1, 1, 1,
0.08505684, -0.2638202, 2.918218, 1, 0, 0, 1, 1,
0.08694093, -0.3051837, 2.723588, 1, 0, 0, 1, 1,
0.08722536, -0.3537927, 3.109791, 1, 0, 0, 1, 1,
0.09182814, -0.1566666, 1.30386, 1, 0, 0, 1, 1,
0.09336356, -0.7729424, 2.991713, 1, 0, 0, 1, 1,
0.09344488, 1.685306, -1.069975, 0, 0, 0, 1, 1,
0.094343, 1.933002, -0.3589761, 0, 0, 0, 1, 1,
0.09705811, -0.9016556, 3.864483, 0, 0, 0, 1, 1,
0.106399, 0.2367479, 0.287601, 0, 0, 0, 1, 1,
0.110898, 0.271301, 1.12838, 0, 0, 0, 1, 1,
0.1185458, -0.5523049, 3.480216, 0, 0, 0, 1, 1,
0.1204142, 0.301896, 1.724097, 0, 0, 0, 1, 1,
0.1280742, 0.3035884, 3.024315, 1, 1, 1, 1, 1,
0.1284658, -0.2139386, 2.117121, 1, 1, 1, 1, 1,
0.1286687, 1.175057, 0.4385272, 1, 1, 1, 1, 1,
0.130184, -0.1879799, 2.927286, 1, 1, 1, 1, 1,
0.1393567, 0.9153734, 0.592644, 1, 1, 1, 1, 1,
0.149027, 0.6957747, 0.2024746, 1, 1, 1, 1, 1,
0.1522261, -0.2136781, 2.113607, 1, 1, 1, 1, 1,
0.1526057, 0.1779566, 2.260137, 1, 1, 1, 1, 1,
0.1578124, 0.5951396, 1.574367, 1, 1, 1, 1, 1,
0.1621582, 0.8298553, 0.9030417, 1, 1, 1, 1, 1,
0.1634286, 1.047616, 0.122149, 1, 1, 1, 1, 1,
0.172415, -0.425243, 1.608752, 1, 1, 1, 1, 1,
0.1746555, 0.9234577, -0.4056304, 1, 1, 1, 1, 1,
0.1786539, 0.9409028, -0.6831053, 1, 1, 1, 1, 1,
0.1797837, -0.8233352, 2.717928, 1, 1, 1, 1, 1,
0.1897717, 0.6094499, -0.7201644, 0, 0, 1, 1, 1,
0.1974877, 1.173683, 0.002750963, 1, 0, 0, 1, 1,
0.2007904, -0.1388023, -0.112469, 1, 0, 0, 1, 1,
0.2062054, 0.6572245, -0.1097184, 1, 0, 0, 1, 1,
0.2078367, 0.6105667, 0.3724114, 1, 0, 0, 1, 1,
0.2144063, 1.146071, 0.6638663, 1, 0, 0, 1, 1,
0.2178878, 0.9558038, 0.8804938, 0, 0, 0, 1, 1,
0.2193001, 0.5166647, -0.3636896, 0, 0, 0, 1, 1,
0.2195127, 2.185324, -0.09767674, 0, 0, 0, 1, 1,
0.2212701, -1.68225, 3.152044, 0, 0, 0, 1, 1,
0.2232091, -0.2276438, 2.031257, 0, 0, 0, 1, 1,
0.2252423, -1.705364, 3.319312, 0, 0, 0, 1, 1,
0.2252452, -0.6080582, 3.172614, 0, 0, 0, 1, 1,
0.2288198, -2.61651, 2.720628, 1, 1, 1, 1, 1,
0.229299, 1.20202, 0.3058273, 1, 1, 1, 1, 1,
0.2388069, 0.07958668, 0.1214938, 1, 1, 1, 1, 1,
0.240633, -1.100603, 2.212369, 1, 1, 1, 1, 1,
0.2437054, -0.06074401, 2.490714, 1, 1, 1, 1, 1,
0.2447144, -0.6999286, 2.111478, 1, 1, 1, 1, 1,
0.2456044, -0.3140308, 2.030737, 1, 1, 1, 1, 1,
0.2473846, -1.070323, 2.402912, 1, 1, 1, 1, 1,
0.2492062, -0.1361234, 3.91145, 1, 1, 1, 1, 1,
0.2592105, 0.7741222, -0.2369097, 1, 1, 1, 1, 1,
0.2593082, 0.5105931, -0.6072375, 1, 1, 1, 1, 1,
0.2627428, 0.7171919, -0.3975636, 1, 1, 1, 1, 1,
0.2637337, -0.8736255, 2.520509, 1, 1, 1, 1, 1,
0.2680088, 0.9321519, 0.3757584, 1, 1, 1, 1, 1,
0.271323, 0.09432867, 2.333462, 1, 1, 1, 1, 1,
0.2723026, 0.1739416, 0.9212857, 0, 0, 1, 1, 1,
0.2730411, 0.53508, -0.5321234, 1, 0, 0, 1, 1,
0.2744271, 1.024266, 1.475136, 1, 0, 0, 1, 1,
0.2817804, 0.6817507, 0.8432266, 1, 0, 0, 1, 1,
0.2817933, 0.5261843, -0.06506929, 1, 0, 0, 1, 1,
0.282678, 0.2113111, 0.7328005, 1, 0, 0, 1, 1,
0.2926297, 1.070056, 1.504061, 0, 0, 0, 1, 1,
0.2926956, -0.8769435, 3.697998, 0, 0, 0, 1, 1,
0.2934025, 0.309508, 1.325824, 0, 0, 0, 1, 1,
0.3009364, -0.8983138, 3.503038, 0, 0, 0, 1, 1,
0.3015866, 0.2683365, -0.6018831, 0, 0, 0, 1, 1,
0.3017139, 1.771258, -1.881425, 0, 0, 0, 1, 1,
0.3033341, -0.06160285, 2.342309, 0, 0, 0, 1, 1,
0.3053535, -0.3439636, 2.604546, 1, 1, 1, 1, 1,
0.3094088, 0.5439387, 0.7450175, 1, 1, 1, 1, 1,
0.3096585, 0.3779796, 1.605329, 1, 1, 1, 1, 1,
0.313033, 0.5820221, 0.7035416, 1, 1, 1, 1, 1,
0.3137864, 0.07947679, 2.377427, 1, 1, 1, 1, 1,
0.3156874, 0.975432, 0.5089565, 1, 1, 1, 1, 1,
0.316516, -1.164372, 2.029308, 1, 1, 1, 1, 1,
0.3191077, -0.9395292, 2.444927, 1, 1, 1, 1, 1,
0.3220821, 0.739565, -0.1238748, 1, 1, 1, 1, 1,
0.3226602, 0.1483609, 2.315157, 1, 1, 1, 1, 1,
0.3297187, 0.0282946, 0.8676012, 1, 1, 1, 1, 1,
0.334388, -0.7140342, 2.248022, 1, 1, 1, 1, 1,
0.3381545, -0.4991302, 3.715073, 1, 1, 1, 1, 1,
0.3409247, 0.8256144, 0.06762479, 1, 1, 1, 1, 1,
0.3411652, 1.357671, 0.09750778, 1, 1, 1, 1, 1,
0.3449568, -1.120529, 3.136152, 0, 0, 1, 1, 1,
0.3468111, 2.199637, -0.5362396, 1, 0, 0, 1, 1,
0.3539987, -1.504712, 3.185795, 1, 0, 0, 1, 1,
0.3557211, -0.5656111, 4.059584, 1, 0, 0, 1, 1,
0.35614, -0.3627959, 2.243776, 1, 0, 0, 1, 1,
0.3570198, -0.3474592, 2.034982, 1, 0, 0, 1, 1,
0.3627318, 0.2031728, 0.1271444, 0, 0, 0, 1, 1,
0.3642004, 0.5906492, 1.112279, 0, 0, 0, 1, 1,
0.3666497, -1.1286, 3.435716, 0, 0, 0, 1, 1,
0.3675762, -1.796655, 1.225084, 0, 0, 0, 1, 1,
0.3737727, -0.1265204, -0.5798389, 0, 0, 0, 1, 1,
0.3759257, -0.5252543, 2.662814, 0, 0, 0, 1, 1,
0.3760949, 0.9323838, -0.7365555, 0, 0, 0, 1, 1,
0.3762417, 0.431458, 1.081589, 1, 1, 1, 1, 1,
0.3775947, 0.005360932, 2.278228, 1, 1, 1, 1, 1,
0.3806449, -1.684114, 3.409338, 1, 1, 1, 1, 1,
0.3818994, 1.160489, 0.3044807, 1, 1, 1, 1, 1,
0.3825006, 0.4288985, 3.16152, 1, 1, 1, 1, 1,
0.3862949, 0.8923423, 0.6089752, 1, 1, 1, 1, 1,
0.3866901, 1.187958, -0.07737125, 1, 1, 1, 1, 1,
0.3981411, -1.001145, 1.645978, 1, 1, 1, 1, 1,
0.4007611, -0.7003829, 2.543708, 1, 1, 1, 1, 1,
0.4046924, 1.173972, 0.2284405, 1, 1, 1, 1, 1,
0.405187, 0.9674588, 2.109148, 1, 1, 1, 1, 1,
0.4124724, 0.9124759, -0.4117053, 1, 1, 1, 1, 1,
0.4175279, -0.514964, 0.8233013, 1, 1, 1, 1, 1,
0.4236845, -0.1370636, 1.817645, 1, 1, 1, 1, 1,
0.4252453, -0.6317899, 2.513054, 1, 1, 1, 1, 1,
0.4254434, -1.224901, 3.470327, 0, 0, 1, 1, 1,
0.427065, 0.7421395, 1.116107, 1, 0, 0, 1, 1,
0.429336, -0.5462372, 2.334338, 1, 0, 0, 1, 1,
0.4398192, -0.7241582, 1.281367, 1, 0, 0, 1, 1,
0.4446212, 0.382876, 1.878506, 1, 0, 0, 1, 1,
0.446156, 0.337902, -0.1920075, 1, 0, 0, 1, 1,
0.4462553, 0.3149083, -0.3144317, 0, 0, 0, 1, 1,
0.4473431, -0.9458632, 1.86719, 0, 0, 0, 1, 1,
0.4480804, 0.9634726, 0.156486, 0, 0, 0, 1, 1,
0.4517588, 0.1934158, -0.06518211, 0, 0, 0, 1, 1,
0.4541818, -0.8460249, 3.23296, 0, 0, 0, 1, 1,
0.4606815, 1.75849, 0.4848354, 0, 0, 0, 1, 1,
0.461745, 0.5734035, 0.6738799, 0, 0, 0, 1, 1,
0.465747, -0.7453741, 0.8906853, 1, 1, 1, 1, 1,
0.4660281, -1.922111, 4.388821, 1, 1, 1, 1, 1,
0.4757749, 0.979999, -0.08731721, 1, 1, 1, 1, 1,
0.4764634, -0.8752974, 2.098508, 1, 1, 1, 1, 1,
0.4767753, -1.320566, 2.116299, 1, 1, 1, 1, 1,
0.478317, 0.2798317, 1.717685, 1, 1, 1, 1, 1,
0.4837319, -0.2382906, 2.146512, 1, 1, 1, 1, 1,
0.4902524, -1.368285, 2.419427, 1, 1, 1, 1, 1,
0.4925832, 1.632379, 0.2973243, 1, 1, 1, 1, 1,
0.4965055, 0.5067457, -0.07015928, 1, 1, 1, 1, 1,
0.4981942, -0.298836, 1.112172, 1, 1, 1, 1, 1,
0.5004574, -1.748487, 0.7282134, 1, 1, 1, 1, 1,
0.50428, -0.3597569, 1.937548, 1, 1, 1, 1, 1,
0.50616, -0.5309301, 1.03333, 1, 1, 1, 1, 1,
0.5153397, 0.26949, 2.001501, 1, 1, 1, 1, 1,
0.5159659, -3.071194, 1.282965, 0, 0, 1, 1, 1,
0.5173339, -0.7844644, 0.6794372, 1, 0, 0, 1, 1,
0.5219765, -0.9285825, 2.521405, 1, 0, 0, 1, 1,
0.5244091, -2.03457, 4.24622, 1, 0, 0, 1, 1,
0.5282142, -0.5883984, 2.677165, 1, 0, 0, 1, 1,
0.5310376, -1.160079, 0.6426966, 1, 0, 0, 1, 1,
0.53703, -1.279557, 2.507015, 0, 0, 0, 1, 1,
0.5458239, 0.8913982, 1.149838, 0, 0, 0, 1, 1,
0.5481676, -0.5823454, 3.095913, 0, 0, 0, 1, 1,
0.5552201, 0.3952494, 1.094879, 0, 0, 0, 1, 1,
0.5613114, 1.431986, 2.253093, 0, 0, 0, 1, 1,
0.5633883, 0.04243964, 2.67518, 0, 0, 0, 1, 1,
0.5740623, 0.7455161, 0.7027671, 0, 0, 0, 1, 1,
0.5762244, -0.6360908, 1.674181, 1, 1, 1, 1, 1,
0.5767387, -1.346248, 2.780275, 1, 1, 1, 1, 1,
0.5783009, -1.578996, 2.859644, 1, 1, 1, 1, 1,
0.5783319, 0.1028706, 1.080205, 1, 1, 1, 1, 1,
0.5785454, -1.898571, 1.004882, 1, 1, 1, 1, 1,
0.5810692, 1.210452, -0.1794366, 1, 1, 1, 1, 1,
0.5811556, 0.4217485, -0.7204562, 1, 1, 1, 1, 1,
0.5853873, -0.6068268, 4.550242, 1, 1, 1, 1, 1,
0.5867134, -1.33643, 4.411875, 1, 1, 1, 1, 1,
0.5870085, 0.7122754, 0.6443982, 1, 1, 1, 1, 1,
0.5899312, -0.8311088, 3.099102, 1, 1, 1, 1, 1,
0.600146, -0.1786324, 3.053254, 1, 1, 1, 1, 1,
0.6034541, 0.3260449, 1.566204, 1, 1, 1, 1, 1,
0.6035486, -0.9327661, 2.055938, 1, 1, 1, 1, 1,
0.6062916, -0.8485954, 4.309762, 1, 1, 1, 1, 1,
0.609261, 0.7409975, 1.448127, 0, 0, 1, 1, 1,
0.6119584, 0.6962572, 0.1261091, 1, 0, 0, 1, 1,
0.6125671, -1.86329, 1.864492, 1, 0, 0, 1, 1,
0.6126169, -1.242254, 1.271311, 1, 0, 0, 1, 1,
0.6210713, 0.3964767, -0.1693854, 1, 0, 0, 1, 1,
0.6225423, 2.550511, 0.4330739, 1, 0, 0, 1, 1,
0.6297376, 0.4314017, 1.564537, 0, 0, 0, 1, 1,
0.6299009, -0.2748872, 2.361564, 0, 0, 0, 1, 1,
0.6315054, 0.5091577, 0.2465136, 0, 0, 0, 1, 1,
0.6342292, -0.2277223, 0.9291831, 0, 0, 0, 1, 1,
0.6384813, -0.6381245, 3.09059, 0, 0, 0, 1, 1,
0.6393715, -0.4365734, 1.815793, 0, 0, 0, 1, 1,
0.6440979, -0.2627694, 2.089185, 0, 0, 0, 1, 1,
0.6552932, -0.7549368, 2.425792, 1, 1, 1, 1, 1,
0.6659959, 0.0741964, 0.3251509, 1, 1, 1, 1, 1,
0.6696383, 0.05960635, 0.8454722, 1, 1, 1, 1, 1,
0.6768188, 0.08075814, 0.4517429, 1, 1, 1, 1, 1,
0.6768455, -0.07181607, 1.729643, 1, 1, 1, 1, 1,
0.6781464, 0.6553276, -0.4516205, 1, 1, 1, 1, 1,
0.6803041, -1.742461, 1.688715, 1, 1, 1, 1, 1,
0.6809075, 0.9336712, 2.598459, 1, 1, 1, 1, 1,
0.6815915, 1.52872, -0.3317182, 1, 1, 1, 1, 1,
0.6824764, 1.590373, -1.953487, 1, 1, 1, 1, 1,
0.6871032, -1.179025, 2.312839, 1, 1, 1, 1, 1,
0.6879037, 2.210893, -0.9151635, 1, 1, 1, 1, 1,
0.6891762, -0.8217157, 1.423622, 1, 1, 1, 1, 1,
0.689771, -0.1998107, 2.402648, 1, 1, 1, 1, 1,
0.6976237, 0.8594496, 1.840315, 1, 1, 1, 1, 1,
0.7027093, -1.491436, 2.059752, 0, 0, 1, 1, 1,
0.7027403, -0.8917171, 2.987188, 1, 0, 0, 1, 1,
0.7043213, -0.8479813, 2.349924, 1, 0, 0, 1, 1,
0.7069039, 0.3823779, -0.5987914, 1, 0, 0, 1, 1,
0.7093492, 0.5406245, 1.516991, 1, 0, 0, 1, 1,
0.7100085, -0.6602031, 2.876787, 1, 0, 0, 1, 1,
0.7104346, 0.3231169, 0.6712186, 0, 0, 0, 1, 1,
0.7126395, -0.4171895, 1.84351, 0, 0, 0, 1, 1,
0.7245744, 0.9846431, 2.441192, 0, 0, 0, 1, 1,
0.7310125, 1.136683, 1.118387, 0, 0, 0, 1, 1,
0.7324203, 1.075348, 1.361371, 0, 0, 0, 1, 1,
0.7351419, 0.5885723, 1.704983, 0, 0, 0, 1, 1,
0.7383178, -0.404689, 1.396559, 0, 0, 0, 1, 1,
0.7398536, 1.029768, 1.395894, 1, 1, 1, 1, 1,
0.7420947, 0.4358558, 1.159202, 1, 1, 1, 1, 1,
0.7435279, -0.02552756, 1.676911, 1, 1, 1, 1, 1,
0.7441308, -0.666294, 1.385111, 1, 1, 1, 1, 1,
0.7477784, -1.518439, 2.173275, 1, 1, 1, 1, 1,
0.7496541, -1.258201, 2.975636, 1, 1, 1, 1, 1,
0.7497876, 0.02105084, 0.8768907, 1, 1, 1, 1, 1,
0.7553104, 0.06327652, 0.8493551, 1, 1, 1, 1, 1,
0.7656544, 0.5516368, 0.5525829, 1, 1, 1, 1, 1,
0.7664954, 1.011546, -1.002504, 1, 1, 1, 1, 1,
0.7674338, -1.820304, 2.593032, 1, 1, 1, 1, 1,
0.7692279, 0.3351538, 1.166321, 1, 1, 1, 1, 1,
0.7694689, -0.5698428, 1.558788, 1, 1, 1, 1, 1,
0.7759084, -0.316292, 2.073243, 1, 1, 1, 1, 1,
0.77643, 0.1142982, 0.5326739, 1, 1, 1, 1, 1,
0.7778768, 1.217223, 0.1706282, 0, 0, 1, 1, 1,
0.7802665, 0.003656065, 1.107511, 1, 0, 0, 1, 1,
0.7820025, -0.4092874, 2.213009, 1, 0, 0, 1, 1,
0.7901602, 0.3689239, 0.4378377, 1, 0, 0, 1, 1,
0.794032, 0.1688341, 1.122404, 1, 0, 0, 1, 1,
0.7945456, -0.4768806, 2.547778, 1, 0, 0, 1, 1,
0.7950017, -2.697974, 2.662501, 0, 0, 0, 1, 1,
0.7980565, 0.614321, -0.8402473, 0, 0, 0, 1, 1,
0.7981512, 0.004832576, 1.455876, 0, 0, 0, 1, 1,
0.8166317, 2.895767, 0.1399176, 0, 0, 0, 1, 1,
0.8215727, -0.2964692, 2.51068, 0, 0, 0, 1, 1,
0.8277486, -0.564084, 2.661042, 0, 0, 0, 1, 1,
0.8295161, -1.307153, 3.41639, 0, 0, 0, 1, 1,
0.8317193, 1.78752, -0.4324739, 1, 1, 1, 1, 1,
0.8419221, -0.07240724, 2.147079, 1, 1, 1, 1, 1,
0.8429092, 0.4072367, 2.700237, 1, 1, 1, 1, 1,
0.8517004, -0.07048855, 0.9058738, 1, 1, 1, 1, 1,
0.856261, 1.274707, 0.5942956, 1, 1, 1, 1, 1,
0.859522, -0.3711476, 0.4001536, 1, 1, 1, 1, 1,
0.8600377, -0.3234266, 0.6076565, 1, 1, 1, 1, 1,
0.86031, -1.710036, 1.93358, 1, 1, 1, 1, 1,
0.8654119, -0.6906366, 3.606638, 1, 1, 1, 1, 1,
0.8678827, 0.2264812, 0.4562704, 1, 1, 1, 1, 1,
0.8681296, 0.8744515, 2.138272, 1, 1, 1, 1, 1,
0.8735564, 0.125418, 1.36435, 1, 1, 1, 1, 1,
0.8736466, -0.3553755, 0.1837194, 1, 1, 1, 1, 1,
0.8739376, 1.42347, 0.8031117, 1, 1, 1, 1, 1,
0.874149, 0.15436, 1.755579, 1, 1, 1, 1, 1,
0.8749614, -1.013365, 0.6415821, 0, 0, 1, 1, 1,
0.8785388, -1.266185, 1.969652, 1, 0, 0, 1, 1,
0.8788092, 1.025048, 1.389816, 1, 0, 0, 1, 1,
0.8791354, 0.4828995, 1.64232, 1, 0, 0, 1, 1,
0.8815802, -0.1880848, 1.154835, 1, 0, 0, 1, 1,
0.8860943, -0.6414428, 1.482682, 1, 0, 0, 1, 1,
0.8896965, 0.3859641, 0.267778, 0, 0, 0, 1, 1,
0.8942963, -1.813522, 3.08324, 0, 0, 0, 1, 1,
0.8954672, 2.011499, 1.394061, 0, 0, 0, 1, 1,
0.8977585, -0.2908464, 2.085562, 0, 0, 0, 1, 1,
0.8990507, -0.4426455, 2.312991, 0, 0, 0, 1, 1,
0.9007143, -0.05779207, 0.6069978, 0, 0, 0, 1, 1,
0.9028787, -0.6777871, 1.852612, 0, 0, 0, 1, 1,
0.9160656, 1.314803, 1.175215, 1, 1, 1, 1, 1,
0.9167467, 0.9602966, 0.2999727, 1, 1, 1, 1, 1,
0.9205896, -1.543685, 2.10297, 1, 1, 1, 1, 1,
0.9233251, 0.02332204, 0.8339234, 1, 1, 1, 1, 1,
0.92371, 0.8235958, 1.332856, 1, 1, 1, 1, 1,
0.9242948, -0.6488424, 2.14957, 1, 1, 1, 1, 1,
0.9267693, -0.05651927, 2.618326, 1, 1, 1, 1, 1,
0.9291295, -0.5362781, 2.240705, 1, 1, 1, 1, 1,
0.9312309, -1.291998, 2.521553, 1, 1, 1, 1, 1,
0.9337119, 0.05929299, -0.5228701, 1, 1, 1, 1, 1,
0.9350208, 0.4172655, -0.06361303, 1, 1, 1, 1, 1,
0.9373484, -0.08581686, 0.7067096, 1, 1, 1, 1, 1,
0.9381561, -0.03623258, 0.2305691, 1, 1, 1, 1, 1,
0.9420357, -1.146227, 2.343214, 1, 1, 1, 1, 1,
0.9462149, 0.662746, 1.167721, 1, 1, 1, 1, 1,
0.9511809, 0.6568834, -0.5690961, 0, 0, 1, 1, 1,
0.9525497, 0.09609087, 1.571061, 1, 0, 0, 1, 1,
0.9580152, 0.7472565, 2.183699, 1, 0, 0, 1, 1,
0.9605871, -1.299789, 1.802737, 1, 0, 0, 1, 1,
0.9630392, 0.3749089, 2.873978, 1, 0, 0, 1, 1,
0.9642659, 1.644769, -1.293574, 1, 0, 0, 1, 1,
0.9696716, 0.2794644, 0.6371413, 0, 0, 0, 1, 1,
0.9751711, 1.108602, 1.45446, 0, 0, 0, 1, 1,
0.9760988, 0.4988929, 0.8204971, 0, 0, 0, 1, 1,
0.9792739, 1.166113, 0.007795812, 0, 0, 0, 1, 1,
0.9873917, -0.5252603, 1.036267, 0, 0, 0, 1, 1,
0.988545, 1.504263, 1.243402, 0, 0, 0, 1, 1,
0.9910671, -0.376502, 1.602262, 0, 0, 0, 1, 1,
0.9924266, -1.273072, 3.684444, 1, 1, 1, 1, 1,
0.9929674, -0.6090314, 4.353554, 1, 1, 1, 1, 1,
0.9968892, 1.20454, 2.480154, 1, 1, 1, 1, 1,
0.9971574, 1.195524, -0.7554053, 1, 1, 1, 1, 1,
0.9973392, 2.43159, -2.039072, 1, 1, 1, 1, 1,
1.007646, -0.9502894, 1.14549, 1, 1, 1, 1, 1,
1.008692, -0.6612781, 2.013522, 1, 1, 1, 1, 1,
1.009284, -0.3934189, 1.93531, 1, 1, 1, 1, 1,
1.011374, 0.1663166, 2.60664, 1, 1, 1, 1, 1,
1.011839, -0.4914575, 1.275442, 1, 1, 1, 1, 1,
1.013948, -1.032105, 1.424656, 1, 1, 1, 1, 1,
1.022823, -0.4297875, 2.306791, 1, 1, 1, 1, 1,
1.02283, 0.3434143, 1.397358, 1, 1, 1, 1, 1,
1.025518, 1.002557, 0.9253935, 1, 1, 1, 1, 1,
1.033459, -1.496821, 3.886597, 1, 1, 1, 1, 1,
1.035118, -1.787737, 2.169017, 0, 0, 1, 1, 1,
1.036962, 0.792053, 1.710964, 1, 0, 0, 1, 1,
1.044084, -0.8713959, 2.792522, 1, 0, 0, 1, 1,
1.047827, 1.001824, 0.1039149, 1, 0, 0, 1, 1,
1.048816, -1.960568, 2.762033, 1, 0, 0, 1, 1,
1.051568, 0.1264179, 0.8125789, 1, 0, 0, 1, 1,
1.063311, -1.373246, 2.087712, 0, 0, 0, 1, 1,
1.077849, -0.4251396, 1.969821, 0, 0, 0, 1, 1,
1.080847, -1.098331, 3.8765, 0, 0, 0, 1, 1,
1.084103, 1.791994, -0.8379925, 0, 0, 0, 1, 1,
1.086489, 0.6434966, -0.2952537, 0, 0, 0, 1, 1,
1.090849, -1.054154, 2.194839, 0, 0, 0, 1, 1,
1.091725, -0.5602368, 1.402414, 0, 0, 0, 1, 1,
1.094523, 0.7341562, 1.205464, 1, 1, 1, 1, 1,
1.095274, 0.6483548, 1.122208, 1, 1, 1, 1, 1,
1.095637, -0.5602477, 0.9552509, 1, 1, 1, 1, 1,
1.096789, 0.08347113, 1.056241, 1, 1, 1, 1, 1,
1.09912, -1.948929, 1.897912, 1, 1, 1, 1, 1,
1.100252, 0.3464118, 0.05379017, 1, 1, 1, 1, 1,
1.105682, 2.069834, 1.432954, 1, 1, 1, 1, 1,
1.117424, 0.8382829, -0.4989736, 1, 1, 1, 1, 1,
1.132108, -1.230278, 2.588228, 1, 1, 1, 1, 1,
1.133835, 0.1166089, -0.7824851, 1, 1, 1, 1, 1,
1.136616, -0.6645996, 1.968515, 1, 1, 1, 1, 1,
1.143601, 0.7508863, 0.4642493, 1, 1, 1, 1, 1,
1.145062, -0.5993925, 2.132222, 1, 1, 1, 1, 1,
1.148967, -1.499431, 0.9925912, 1, 1, 1, 1, 1,
1.150089, 0.535973, 1.648314, 1, 1, 1, 1, 1,
1.150986, -1.345808, 1.697429, 0, 0, 1, 1, 1,
1.155803, -0.609194, 2.687603, 1, 0, 0, 1, 1,
1.160476, 0.8773209, 2.976142, 1, 0, 0, 1, 1,
1.161965, -0.5111151, 2.693045, 1, 0, 0, 1, 1,
1.164774, -0.0341252, 0.07437243, 1, 0, 0, 1, 1,
1.169579, 0.2416801, 2.977263, 1, 0, 0, 1, 1,
1.174644, -0.671904, 1.220705, 0, 0, 0, 1, 1,
1.183192, 0.7652245, 1.092438, 0, 0, 0, 1, 1,
1.183519, -1.317127, 3.707055, 0, 0, 0, 1, 1,
1.185092, -1.172147, 2.771408, 0, 0, 0, 1, 1,
1.186292, 0.07060695, 0.3962332, 0, 0, 0, 1, 1,
1.188091, -1.920278, 2.444949, 0, 0, 0, 1, 1,
1.18895, 0.4551001, 0.01446066, 0, 0, 0, 1, 1,
1.194284, -0.1295838, -0.5131084, 1, 1, 1, 1, 1,
1.196514, 0.06171058, 0.6096871, 1, 1, 1, 1, 1,
1.197048, -0.4883987, 1.533386, 1, 1, 1, 1, 1,
1.205478, 1.832641, 0.7800406, 1, 1, 1, 1, 1,
1.215929, 2.040416, 0.6847581, 1, 1, 1, 1, 1,
1.21696, -1.386326, 2.414268, 1, 1, 1, 1, 1,
1.218881, -0.4334931, 2.621704, 1, 1, 1, 1, 1,
1.222536, 0.4389573, 2.280118, 1, 1, 1, 1, 1,
1.225683, 0.4731407, 2.254312, 1, 1, 1, 1, 1,
1.237287, -0.5972041, 3.034693, 1, 1, 1, 1, 1,
1.241612, -0.3839181, 1.933331, 1, 1, 1, 1, 1,
1.246741, -1.234616, 2.540936, 1, 1, 1, 1, 1,
1.249437, 0.7138672, -0.8750972, 1, 1, 1, 1, 1,
1.250872, 0.4265481, 0.8564976, 1, 1, 1, 1, 1,
1.271209, -0.240949, 2.871085, 1, 1, 1, 1, 1,
1.273937, -1.471465, 1.81708, 0, 0, 1, 1, 1,
1.275437, -1.754969, 2.094496, 1, 0, 0, 1, 1,
1.276955, -0.198175, 1.580311, 1, 0, 0, 1, 1,
1.279822, -0.288788, 2.590427, 1, 0, 0, 1, 1,
1.280382, 0.9925041, 1.03554, 1, 0, 0, 1, 1,
1.299492, -1.356068, 1.971559, 1, 0, 0, 1, 1,
1.317546, -0.3968852, 0.8785858, 0, 0, 0, 1, 1,
1.331761, 1.758642, 1.805006, 0, 0, 0, 1, 1,
1.344279, -0.2177968, 1.213509, 0, 0, 0, 1, 1,
1.34555, 0.9347769, 0.7365752, 0, 0, 0, 1, 1,
1.346761, 0.01770205, 2.434624, 0, 0, 0, 1, 1,
1.347872, 1.208505, 1.11623, 0, 0, 0, 1, 1,
1.347887, -0.6502727, 1.699354, 0, 0, 0, 1, 1,
1.358771, 1.200023, 0.6071945, 1, 1, 1, 1, 1,
1.37525, 1.425766, 1.01064, 1, 1, 1, 1, 1,
1.378297, -0.8127319, 4.347369, 1, 1, 1, 1, 1,
1.380851, -0.9599397, 0.6040602, 1, 1, 1, 1, 1,
1.389658, 0.05289033, 1.117512, 1, 1, 1, 1, 1,
1.397232, 1.377157, 0.1858861, 1, 1, 1, 1, 1,
1.40983, -0.001395458, 0.3653525, 1, 1, 1, 1, 1,
1.411893, -0.7490174, 1.042071, 1, 1, 1, 1, 1,
1.413263, -0.4038746, -0.05941176, 1, 1, 1, 1, 1,
1.425535, -0.4541248, 2.12198, 1, 1, 1, 1, 1,
1.443912, 0.3030735, 0.8969233, 1, 1, 1, 1, 1,
1.449064, -0.6587637, 2.421819, 1, 1, 1, 1, 1,
1.461462, -0.1293228, 1.796152, 1, 1, 1, 1, 1,
1.462536, -0.1401776, 2.774949, 1, 1, 1, 1, 1,
1.471711, 0.9055401, 0.7595558, 1, 1, 1, 1, 1,
1.471846, 1.31148, 0.4017252, 0, 0, 1, 1, 1,
1.480669, -0.8401275, 2.677601, 1, 0, 0, 1, 1,
1.513213, 0.6569949, 0.4044904, 1, 0, 0, 1, 1,
1.514515, 0.3279016, 2.661625, 1, 0, 0, 1, 1,
1.535424, 0.933625, 0.4728364, 1, 0, 0, 1, 1,
1.54043, -0.01946627, 1.566179, 1, 0, 0, 1, 1,
1.543217, -0.2590397, 0.7708021, 0, 0, 0, 1, 1,
1.550585, 0.3042679, 2.444424, 0, 0, 0, 1, 1,
1.58017, 1.516614, 0.4683498, 0, 0, 0, 1, 1,
1.585299, -1.095224, 0.7530982, 0, 0, 0, 1, 1,
1.586924, -0.9370345, 2.543846, 0, 0, 0, 1, 1,
1.597917, 0.3248602, 1.988788, 0, 0, 0, 1, 1,
1.625739, 0.06938053, 0.8540246, 0, 0, 0, 1, 1,
1.638627, -0.2779793, 3.727893, 1, 1, 1, 1, 1,
1.642009, -1.993155, 2.931921, 1, 1, 1, 1, 1,
1.645549, 0.42882, 2.571526, 1, 1, 1, 1, 1,
1.658156, 1.358876, 0.2078736, 1, 1, 1, 1, 1,
1.663126, -0.7953387, 3.747402, 1, 1, 1, 1, 1,
1.669813, -1.45439, -0.08434433, 1, 1, 1, 1, 1,
1.671035, -0.2932959, 1.828099, 1, 1, 1, 1, 1,
1.672437, -1.014586, 2.767118, 1, 1, 1, 1, 1,
1.691521, -2.055323, 1.043721, 1, 1, 1, 1, 1,
1.697059, -0.5485944, 3.663138, 1, 1, 1, 1, 1,
1.704827, 0.01724585, 1.848391, 1, 1, 1, 1, 1,
1.76719, 0.2758216, 2.316154, 1, 1, 1, 1, 1,
1.772144, 0.2367423, 0.1157626, 1, 1, 1, 1, 1,
1.777611, 1.646372, 0.8368174, 1, 1, 1, 1, 1,
1.783193, 0.4929316, -0.3041083, 1, 1, 1, 1, 1,
1.809959, -0.9673245, 1.848587, 0, 0, 1, 1, 1,
1.813003, -0.1785269, 2.180811, 1, 0, 0, 1, 1,
1.815406, 0.490289, 1.39811, 1, 0, 0, 1, 1,
1.830557, -1.508479, 0.2687917, 1, 0, 0, 1, 1,
1.837675, 0.2871049, 0.8114801, 1, 0, 0, 1, 1,
1.848851, 0.2382528, 1.67744, 1, 0, 0, 1, 1,
1.851537, -0.8085321, 2.452034, 0, 0, 0, 1, 1,
1.859494, -0.5008011, 0.2887886, 0, 0, 0, 1, 1,
1.884704, 2.648865, 1.802341, 0, 0, 0, 1, 1,
1.893599, 1.289828, 1.118128, 0, 0, 0, 1, 1,
1.894071, 1.55854, 1.256549, 0, 0, 0, 1, 1,
1.89991, 0.3401097, 1.133804, 0, 0, 0, 1, 1,
1.911386, 0.03621964, 1.491711, 0, 0, 0, 1, 1,
1.942054, -0.3077552, 1.513219, 1, 1, 1, 1, 1,
1.991366, -0.05696528, 2.153873, 1, 1, 1, 1, 1,
1.995322, -0.8022349, 1.577279, 1, 1, 1, 1, 1,
1.998599, 0.03915122, 0.7280737, 1, 1, 1, 1, 1,
2.011087, 0.4432798, -0.02370837, 1, 1, 1, 1, 1,
2.014145, -1.143058, 2.793101, 1, 1, 1, 1, 1,
2.019506, 1.236823, 2.229795, 1, 1, 1, 1, 1,
2.0841, -0.3421312, 0.5955507, 1, 1, 1, 1, 1,
2.141727, 0.9277414, 1.80547, 1, 1, 1, 1, 1,
2.145416, 0.6040221, 0.9411599, 1, 1, 1, 1, 1,
2.148549, -1.726394, 2.289828, 1, 1, 1, 1, 1,
2.221311, 1.755891, 1.495738, 1, 1, 1, 1, 1,
2.241956, -0.3773566, 2.328196, 1, 1, 1, 1, 1,
2.257699, 0.8326507, -0.4211167, 1, 1, 1, 1, 1,
2.285073, 1.023572, 0.2295697, 1, 1, 1, 1, 1,
2.342976, -0.1761996, 2.40754, 0, 0, 1, 1, 1,
2.353215, 0.9221706, 0.8295965, 1, 0, 0, 1, 1,
2.355113, 2.052186, 1.635777, 1, 0, 0, 1, 1,
2.370339, -0.4701752, 1.068101, 1, 0, 0, 1, 1,
2.37272, -1.205377, 1.63037, 1, 0, 0, 1, 1,
2.454962, 0.1778751, 1.09064, 1, 0, 0, 1, 1,
2.499279, -1.950387, 2.270952, 0, 0, 0, 1, 1,
2.505227, 1.082866, 2.746235, 0, 0, 0, 1, 1,
2.505833, 1.235249, 0.7003511, 0, 0, 0, 1, 1,
2.507447, 0.9325047, 1.871223, 0, 0, 0, 1, 1,
2.523248, -0.9049383, 1.52499, 0, 0, 0, 1, 1,
2.569746, -1.784599, 2.098835, 0, 0, 0, 1, 1,
2.60734, -1.336896, 1.789464, 0, 0, 0, 1, 1,
2.614972, 0.05572066, 1.715269, 1, 1, 1, 1, 1,
2.634289, -0.005907411, 2.450875, 1, 1, 1, 1, 1,
2.667276, 0.1729975, 1.884239, 1, 1, 1, 1, 1,
2.787483, -0.2948396, 1.096455, 1, 1, 1, 1, 1,
2.892276, 0.1652656, 1.497944, 1, 1, 1, 1, 1,
3.132897, 0.1751113, 0.631585, 1, 1, 1, 1, 1,
3.390113, -0.8384181, 1.352679, 1, 1, 1, 1, 1
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
var radius = 9.551071;
var distance = 33.54773;
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
mvMatrix.translate( 0.2889738, 0.006974697, 0.2969728 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.54773);
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
