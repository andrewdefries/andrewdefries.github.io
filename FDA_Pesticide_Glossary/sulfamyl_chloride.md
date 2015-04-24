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
-3.075353, 0.8181835, -0.3512931, 1, 0, 0, 1,
-3.020201, 1.525912, -0.4571187, 1, 0.007843138, 0, 1,
-2.839658, -0.4013545, 0.007374605, 1, 0.01176471, 0, 1,
-2.708475, 0.9068198, 0.420914, 1, 0.01960784, 0, 1,
-2.629543, -0.7918682, -1.513928, 1, 0.02352941, 0, 1,
-2.607033, 0.01766066, -2.519258, 1, 0.03137255, 0, 1,
-2.579948, -0.790096, -3.066325, 1, 0.03529412, 0, 1,
-2.497036, -1.844102, 0.9924703, 1, 0.04313726, 0, 1,
-2.425296, 2.159501, -2.417728, 1, 0.04705882, 0, 1,
-2.408851, 1.16631, -1.166652, 1, 0.05490196, 0, 1,
-2.4074, 0.3981448, -1.485667, 1, 0.05882353, 0, 1,
-2.404379, -1.336211, -1.233543, 1, 0.06666667, 0, 1,
-2.380371, 0.9211665, -1.34305, 1, 0.07058824, 0, 1,
-2.317459, -0.8566481, -2.85852, 1, 0.07843138, 0, 1,
-2.306428, -0.5769231, -1.721183, 1, 0.08235294, 0, 1,
-2.241506, 1.913787, 0.100882, 1, 0.09019608, 0, 1,
-2.223431, 0.534026, -0.6204816, 1, 0.09411765, 0, 1,
-2.204825, -0.01980716, -2.05201, 1, 0.1019608, 0, 1,
-2.182159, 1.042304, -0.491743, 1, 0.1098039, 0, 1,
-2.175745, 0.05397482, -1.351342, 1, 0.1137255, 0, 1,
-2.161012, -0.1796477, -0.9475996, 1, 0.1215686, 0, 1,
-2.080609, -0.2040448, -2.740208, 1, 0.1254902, 0, 1,
-2.078992, 0.6504526, -1.23267, 1, 0.1333333, 0, 1,
-1.961074, 0.0264621, -2.179346, 1, 0.1372549, 0, 1,
-1.958645, -0.5119708, -3.135616, 1, 0.145098, 0, 1,
-1.912128, -0.760843, -3.903928, 1, 0.1490196, 0, 1,
-1.884526, -0.703765, -2.304634, 1, 0.1568628, 0, 1,
-1.862929, -1.422727, -2.634877, 1, 0.1607843, 0, 1,
-1.860217, 1.83123, -2.207961, 1, 0.1686275, 0, 1,
-1.852843, -0.7791742, 0.04432683, 1, 0.172549, 0, 1,
-1.834485, 1.204354, 0.4842446, 1, 0.1803922, 0, 1,
-1.814384, -0.7794745, -0.4929524, 1, 0.1843137, 0, 1,
-1.789446, 0.09345078, -0.7750502, 1, 0.1921569, 0, 1,
-1.780261, 1.099753, -1.529661, 1, 0.1960784, 0, 1,
-1.765086, -1.53113, -2.225849, 1, 0.2039216, 0, 1,
-1.760922, -0.1095108, 0.7013223, 1, 0.2117647, 0, 1,
-1.755718, -0.5974084, -2.768728, 1, 0.2156863, 0, 1,
-1.731476, -0.1556102, -2.89446, 1, 0.2235294, 0, 1,
-1.718757, -0.2519516, -2.479084, 1, 0.227451, 0, 1,
-1.711798, 0.5337738, 0.09416825, 1, 0.2352941, 0, 1,
-1.708239, 0.04554105, -3.282113, 1, 0.2392157, 0, 1,
-1.700953, 1.95115, -1.95876, 1, 0.2470588, 0, 1,
-1.664777, -0.001934285, -0.9246336, 1, 0.2509804, 0, 1,
-1.660397, -1.558222, -1.892286, 1, 0.2588235, 0, 1,
-1.643088, 0.4921276, -1.17447, 1, 0.2627451, 0, 1,
-1.640233, 1.567199, -1.841556, 1, 0.2705882, 0, 1,
-1.62148, -0.5565127, -1.472142, 1, 0.2745098, 0, 1,
-1.616436, -0.02058436, -1.783209, 1, 0.282353, 0, 1,
-1.600352, -1.252989, -1.315275, 1, 0.2862745, 0, 1,
-1.596936, -0.5245553, -2.183921, 1, 0.2941177, 0, 1,
-1.590712, 1.09975, -1.33734, 1, 0.3019608, 0, 1,
-1.590254, 0.1707303, -0.2858497, 1, 0.3058824, 0, 1,
-1.559428, 1.227925, 0.1463834, 1, 0.3137255, 0, 1,
-1.558533, 1.419515, -1.95861, 1, 0.3176471, 0, 1,
-1.549365, 0.179845, -0.9160621, 1, 0.3254902, 0, 1,
-1.546876, 1.19408, -0.4169829, 1, 0.3294118, 0, 1,
-1.543064, 1.778074, -0.8759376, 1, 0.3372549, 0, 1,
-1.51486, 0.6641091, -1.427729, 1, 0.3411765, 0, 1,
-1.50261, -0.2493747, 0.822004, 1, 0.3490196, 0, 1,
-1.502149, 0.3463823, -1.292052, 1, 0.3529412, 0, 1,
-1.494878, -0.521278, -0.9977196, 1, 0.3607843, 0, 1,
-1.488801, -1.025934, -1.683942, 1, 0.3647059, 0, 1,
-1.440294, -0.5991921, -1.047533, 1, 0.372549, 0, 1,
-1.427652, -0.09192179, -1.382495, 1, 0.3764706, 0, 1,
-1.416921, 0.815959, -2.289219, 1, 0.3843137, 0, 1,
-1.407596, -0.7987893, -1.93919, 1, 0.3882353, 0, 1,
-1.405466, -0.5206468, -1.935969, 1, 0.3960784, 0, 1,
-1.397666, 0.5223259, -0.6567741, 1, 0.4039216, 0, 1,
-1.381521, -0.5194787, -2.091017, 1, 0.4078431, 0, 1,
-1.381043, 0.6146604, -1.930912, 1, 0.4156863, 0, 1,
-1.377759, 0.8613446, -3.047465, 1, 0.4196078, 0, 1,
-1.377118, 0.3637534, -1.682398, 1, 0.427451, 0, 1,
-1.363578, 1.409973, -0.5034252, 1, 0.4313726, 0, 1,
-1.351797, 0.9492424, -1.930897, 1, 0.4392157, 0, 1,
-1.350837, -0.1252762, -1.193729, 1, 0.4431373, 0, 1,
-1.348174, 1.80657, -1.062051, 1, 0.4509804, 0, 1,
-1.346738, -0.285348, -1.066874, 1, 0.454902, 0, 1,
-1.324875, -0.6643268, -2.166669, 1, 0.4627451, 0, 1,
-1.317301, 1.653887, 1.194002, 1, 0.4666667, 0, 1,
-1.316183, -0.6171723, -2.726618, 1, 0.4745098, 0, 1,
-1.311858, -1.59043, -2.000628, 1, 0.4784314, 0, 1,
-1.307005, -1.33846, -3.093122, 1, 0.4862745, 0, 1,
-1.302802, 0.534862, -1.702091, 1, 0.4901961, 0, 1,
-1.27605, 0.1653554, -2.497917, 1, 0.4980392, 0, 1,
-1.266684, -1.798644, -1.210134, 1, 0.5058824, 0, 1,
-1.265488, -0.5662265, -0.4254713, 1, 0.509804, 0, 1,
-1.264687, 0.2963411, -1.912007, 1, 0.5176471, 0, 1,
-1.262694, 0.1041797, -0.4544617, 1, 0.5215687, 0, 1,
-1.251164, 1.715477, 1.175788, 1, 0.5294118, 0, 1,
-1.249439, 1.119668, -2.757305, 1, 0.5333334, 0, 1,
-1.247947, -0.1283047, -1.381252, 1, 0.5411765, 0, 1,
-1.247451, -1.55559, -2.268601, 1, 0.5450981, 0, 1,
-1.243951, 0.8259974, -1.411854, 1, 0.5529412, 0, 1,
-1.239053, -0.6446304, -2.923984, 1, 0.5568628, 0, 1,
-1.237779, -0.7360897, -2.281777, 1, 0.5647059, 0, 1,
-1.237075, -0.5458338, -1.934309, 1, 0.5686275, 0, 1,
-1.224961, 1.859152, -0.4402464, 1, 0.5764706, 0, 1,
-1.219359, -0.08116382, -0.7445861, 1, 0.5803922, 0, 1,
-1.216303, 0.4295305, -1.322484, 1, 0.5882353, 0, 1,
-1.212958, -0.9307356, -2.469863, 1, 0.5921569, 0, 1,
-1.202542, 0.8097641, 0.5314257, 1, 0.6, 0, 1,
-1.201827, -1.093132, -2.888969, 1, 0.6078432, 0, 1,
-1.200036, -0.4218349, -1.629663, 1, 0.6117647, 0, 1,
-1.199209, 1.646345, -0.05095999, 1, 0.6196079, 0, 1,
-1.19838, -0.7552317, -0.5513783, 1, 0.6235294, 0, 1,
-1.188368, -0.5521477, 0.0785552, 1, 0.6313726, 0, 1,
-1.181093, 0.8228711, -1.099828, 1, 0.6352941, 0, 1,
-1.174189, -0.5645367, -2.169437, 1, 0.6431373, 0, 1,
-1.173022, -0.6902925, -0.9903189, 1, 0.6470588, 0, 1,
-1.170886, 0.0574077, -2.089209, 1, 0.654902, 0, 1,
-1.168402, -0.7536887, -1.893715, 1, 0.6588235, 0, 1,
-1.16627, -0.006964592, -2.826767, 1, 0.6666667, 0, 1,
-1.165245, 0.1344614, -1.130884, 1, 0.6705883, 0, 1,
-1.159451, -0.8390355, -3.299903, 1, 0.6784314, 0, 1,
-1.157046, 0.9872112, -0.6968254, 1, 0.682353, 0, 1,
-1.152037, 1.826637, -0.6162279, 1, 0.6901961, 0, 1,
-1.15146, -0.5668181, -0.9278306, 1, 0.6941177, 0, 1,
-1.143961, -1.61513, -2.135123, 1, 0.7019608, 0, 1,
-1.138615, 0.7974119, -0.3476089, 1, 0.7098039, 0, 1,
-1.124963, -0.4525803, -2.531526, 1, 0.7137255, 0, 1,
-1.124356, 0.5466412, -1.085611, 1, 0.7215686, 0, 1,
-1.115042, -0.4403334, -0.9809405, 1, 0.7254902, 0, 1,
-1.110932, -1.929303, -1.647457, 1, 0.7333333, 0, 1,
-1.109322, 0.02269484, -0.3143547, 1, 0.7372549, 0, 1,
-1.108478, -0.1293358, -1.756462, 1, 0.7450981, 0, 1,
-1.107661, 0.7407975, 0.500867, 1, 0.7490196, 0, 1,
-1.101415, 0.4331555, -1.251557, 1, 0.7568628, 0, 1,
-1.09426, -0.4097868, -0.9292558, 1, 0.7607843, 0, 1,
-1.087543, 0.7963064, -0.9960828, 1, 0.7686275, 0, 1,
-1.084185, -0.5461506, -1.018115, 1, 0.772549, 0, 1,
-1.079603, 1.149708, -0.4176191, 1, 0.7803922, 0, 1,
-1.079408, 0.9119742, -1.561268, 1, 0.7843137, 0, 1,
-1.077959, -0.5842606, -2.380141, 1, 0.7921569, 0, 1,
-1.077215, -1.01698, -2.10774, 1, 0.7960784, 0, 1,
-1.073629, -1.734066, -1.793826, 1, 0.8039216, 0, 1,
-1.057179, -1.689922, -2.409837, 1, 0.8117647, 0, 1,
-1.056637, 1.580179, -0.4364979, 1, 0.8156863, 0, 1,
-1.050475, -1.408194, -2.483581, 1, 0.8235294, 0, 1,
-1.047607, 0.6616859, -0.6058218, 1, 0.827451, 0, 1,
-1.04538, 1.057874, -0.2359668, 1, 0.8352941, 0, 1,
-1.044778, 0.5855387, -1.108697, 1, 0.8392157, 0, 1,
-1.044562, 0.2724754, -2.398959, 1, 0.8470588, 0, 1,
-1.044172, 0.6492804, 0.4687109, 1, 0.8509804, 0, 1,
-1.042764, -0.2211131, -2.127912, 1, 0.8588235, 0, 1,
-1.033034, 1.592919, -1.008972, 1, 0.8627451, 0, 1,
-1.026318, 0.713405, -0.4183161, 1, 0.8705882, 0, 1,
-1.022716, 0.3641021, -0.7048705, 1, 0.8745098, 0, 1,
-1.01956, 0.8013406, 0.3443447, 1, 0.8823529, 0, 1,
-1.019417, -0.3901222, -3.114562, 1, 0.8862745, 0, 1,
-1.012114, -1.132692, -1.170102, 1, 0.8941177, 0, 1,
-1.007487, -0.8376505, -1.019469, 1, 0.8980392, 0, 1,
-1.002617, 0.966992, -0.9195213, 1, 0.9058824, 0, 1,
-0.9910098, -1.064686, -1.346291, 1, 0.9137255, 0, 1,
-0.9854747, -0.2557766, -1.137017, 1, 0.9176471, 0, 1,
-0.9837098, -0.4432589, -3.819471, 1, 0.9254902, 0, 1,
-0.9819808, 0.3139746, -1.255022, 1, 0.9294118, 0, 1,
-0.9811158, 0.604108, -0.8618062, 1, 0.9372549, 0, 1,
-0.9762202, -0.1884711, -0.5779973, 1, 0.9411765, 0, 1,
-0.9724746, 0.3793807, -1.081431, 1, 0.9490196, 0, 1,
-0.969761, 0.1949124, -1.865733, 1, 0.9529412, 0, 1,
-0.9666235, -0.3348704, -2.644655, 1, 0.9607843, 0, 1,
-0.9632827, 0.4218143, -1.557391, 1, 0.9647059, 0, 1,
-0.9574598, -0.9047852, -3.479049, 1, 0.972549, 0, 1,
-0.9550949, 0.1306514, -2.529994, 1, 0.9764706, 0, 1,
-0.9550555, -0.4621504, -0.5935012, 1, 0.9843137, 0, 1,
-0.9536262, -0.6307461, -0.6132325, 1, 0.9882353, 0, 1,
-0.9511189, -0.8059038, -1.500957, 1, 0.9960784, 0, 1,
-0.9418111, 0.6991183, 1.020552, 0.9960784, 1, 0, 1,
-0.9380345, -1.335819, -2.43541, 0.9921569, 1, 0, 1,
-0.9316759, 1.120419, -1.16826, 0.9843137, 1, 0, 1,
-0.9315094, -0.7198192, -1.862439, 0.9803922, 1, 0, 1,
-0.9306338, 1.155528, -0.4651083, 0.972549, 1, 0, 1,
-0.9287112, 0.5180755, -2.01007, 0.9686275, 1, 0, 1,
-0.9254637, 1.206568, -2.206367, 0.9607843, 1, 0, 1,
-0.9226503, 1.58957, 0.2813689, 0.9568627, 1, 0, 1,
-0.9220161, 0.6501563, -0.3156078, 0.9490196, 1, 0, 1,
-0.9154208, 0.2957418, -2.300136, 0.945098, 1, 0, 1,
-0.9148365, -0.3273515, -2.507663, 0.9372549, 1, 0, 1,
-0.9092519, 0.4301338, -3.154696, 0.9333333, 1, 0, 1,
-0.9083976, -0.3073089, -1.796767, 0.9254902, 1, 0, 1,
-0.9068251, -1.670515, -2.266399, 0.9215686, 1, 0, 1,
-0.9056808, -0.8859553, -3.86996, 0.9137255, 1, 0, 1,
-0.900843, -0.3042703, -2.130702, 0.9098039, 1, 0, 1,
-0.8998333, -0.4757544, -1.745364, 0.9019608, 1, 0, 1,
-0.8988523, -2.329554, -3.148163, 0.8941177, 1, 0, 1,
-0.8956534, -0.910409, -2.530422, 0.8901961, 1, 0, 1,
-0.8931063, -0.2784518, -1.373192, 0.8823529, 1, 0, 1,
-0.8904577, -0.6561652, -1.836045, 0.8784314, 1, 0, 1,
-0.8881449, -2.175992, -3.355047, 0.8705882, 1, 0, 1,
-0.8876027, -0.8384206, -0.9170735, 0.8666667, 1, 0, 1,
-0.8827054, 0.5913231, -0.4026501, 0.8588235, 1, 0, 1,
-0.8823917, -0.3089997, -2.322406, 0.854902, 1, 0, 1,
-0.8805539, 0.7504874, -1.189493, 0.8470588, 1, 0, 1,
-0.8791165, -0.4254829, -1.840084, 0.8431373, 1, 0, 1,
-0.8788036, 1.590199, 0.2380738, 0.8352941, 1, 0, 1,
-0.8759916, -0.3888218, -0.9770836, 0.8313726, 1, 0, 1,
-0.8736802, -0.249173, -2.090768, 0.8235294, 1, 0, 1,
-0.8725884, 0.03814007, -2.014066, 0.8196079, 1, 0, 1,
-0.8696272, -1.200504, -1.457068, 0.8117647, 1, 0, 1,
-0.8688192, -1.371541, -2.37223, 0.8078431, 1, 0, 1,
-0.8686982, 0.1831177, -0.5211819, 0.8, 1, 0, 1,
-0.8567703, 0.7890302, -2.078898, 0.7921569, 1, 0, 1,
-0.8545482, 0.9984657, -0.9543608, 0.7882353, 1, 0, 1,
-0.8516685, -0.03811926, -1.710544, 0.7803922, 1, 0, 1,
-0.8484034, -1.805402, -2.423343, 0.7764706, 1, 0, 1,
-0.8477457, 0.7034564, -1.626351, 0.7686275, 1, 0, 1,
-0.8466008, 0.5378925, -0.09386128, 0.7647059, 1, 0, 1,
-0.8445629, -0.1559605, -3.552963, 0.7568628, 1, 0, 1,
-0.8443642, 0.3027045, 0.2786794, 0.7529412, 1, 0, 1,
-0.8438997, -0.4635783, -2.26231, 0.7450981, 1, 0, 1,
-0.8366846, -1.187692, -3.223578, 0.7411765, 1, 0, 1,
-0.8366469, -1.788001, -2.896233, 0.7333333, 1, 0, 1,
-0.8249646, 0.3704696, -1.570815, 0.7294118, 1, 0, 1,
-0.8244816, 0.3803301, -1.093052, 0.7215686, 1, 0, 1,
-0.8238261, 0.1003547, -1.682128, 0.7176471, 1, 0, 1,
-0.8174195, -0.0542832, -1.61827, 0.7098039, 1, 0, 1,
-0.8172103, -0.01734895, -1.906317, 0.7058824, 1, 0, 1,
-0.8144007, 0.2903278, -0.5186123, 0.6980392, 1, 0, 1,
-0.8102873, -1.033519, -3.241324, 0.6901961, 1, 0, 1,
-0.805669, 1.806716, 0.8290582, 0.6862745, 1, 0, 1,
-0.8025909, -0.3561358, -2.144399, 0.6784314, 1, 0, 1,
-0.8013821, 1.414816, -2.433488, 0.6745098, 1, 0, 1,
-0.7983211, 0.2970376, -0.004355325, 0.6666667, 1, 0, 1,
-0.7969992, -1.463544, -2.222617, 0.6627451, 1, 0, 1,
-0.793976, -0.9032525, -0.9032474, 0.654902, 1, 0, 1,
-0.792693, -0.1447541, -0.1593148, 0.6509804, 1, 0, 1,
-0.7865226, -1.411893, -3.914997, 0.6431373, 1, 0, 1,
-0.7843931, -0.3932064, -1.192248, 0.6392157, 1, 0, 1,
-0.779965, -2.102365, -2.630002, 0.6313726, 1, 0, 1,
-0.7794392, -0.2727373, -1.724796, 0.627451, 1, 0, 1,
-0.7785228, -1.468049, -3.063995, 0.6196079, 1, 0, 1,
-0.7772138, -0.1205924, -1.333519, 0.6156863, 1, 0, 1,
-0.7764924, 0.9837465, -0.9291806, 0.6078432, 1, 0, 1,
-0.7764386, -1.155746, -3.205483, 0.6039216, 1, 0, 1,
-0.773564, 0.6624203, 0.4657318, 0.5960785, 1, 0, 1,
-0.7712615, -0.0550128, -1.88757, 0.5882353, 1, 0, 1,
-0.7701241, 0.1977378, -0.609104, 0.5843138, 1, 0, 1,
-0.7659272, 0.1968913, -1.147124, 0.5764706, 1, 0, 1,
-0.7630913, -0.157809, -2.984011, 0.572549, 1, 0, 1,
-0.7619449, -1.630129, -0.984158, 0.5647059, 1, 0, 1,
-0.758821, 0.3576976, -1.612902, 0.5607843, 1, 0, 1,
-0.7587066, 1.466202, 0.5104998, 0.5529412, 1, 0, 1,
-0.7584719, 0.0006244989, 0.2707343, 0.5490196, 1, 0, 1,
-0.7567199, -0.4385312, -2.444959, 0.5411765, 1, 0, 1,
-0.7509319, -1.673911, -4.702099, 0.5372549, 1, 0, 1,
-0.7503322, 2.470835, -1.665791, 0.5294118, 1, 0, 1,
-0.7351425, 0.09935317, -1.016668, 0.5254902, 1, 0, 1,
-0.7341693, -1.619863, -2.575851, 0.5176471, 1, 0, 1,
-0.7336358, 0.4532448, 0.03976742, 0.5137255, 1, 0, 1,
-0.7281675, 0.8566311, -0.8102182, 0.5058824, 1, 0, 1,
-0.7276917, 0.03527464, -0.2869901, 0.5019608, 1, 0, 1,
-0.7208361, 0.5880619, 0.101088, 0.4941176, 1, 0, 1,
-0.7136759, -0.8950801, -2.947847, 0.4862745, 1, 0, 1,
-0.7123178, -0.4827379, -1.943798, 0.4823529, 1, 0, 1,
-0.711127, 0.1301277, -1.650079, 0.4745098, 1, 0, 1,
-0.7078801, 0.1058875, -2.169458, 0.4705882, 1, 0, 1,
-0.7023922, 0.02584353, -0.4373015, 0.4627451, 1, 0, 1,
-0.7019644, 0.4567145, -1.142793, 0.4588235, 1, 0, 1,
-0.6952986, 0.1342269, -0.6771265, 0.4509804, 1, 0, 1,
-0.6944478, 1.228957, -1.100364, 0.4470588, 1, 0, 1,
-0.6873641, 0.3940391, -1.664866, 0.4392157, 1, 0, 1,
-0.6852752, -0.3026862, -1.667903, 0.4352941, 1, 0, 1,
-0.6816875, 0.2219387, -0.9641924, 0.427451, 1, 0, 1,
-0.6816846, -1.170069, -3.395044, 0.4235294, 1, 0, 1,
-0.6759515, -1.247793, -2.389586, 0.4156863, 1, 0, 1,
-0.661161, -1.060544, -3.14879, 0.4117647, 1, 0, 1,
-0.6582135, 0.7712478, -1.406319, 0.4039216, 1, 0, 1,
-0.6522961, -0.1286622, -3.097136, 0.3960784, 1, 0, 1,
-0.6512569, -0.8158882, -3.192141, 0.3921569, 1, 0, 1,
-0.6482075, -0.4356837, -2.180413, 0.3843137, 1, 0, 1,
-0.6431837, -0.3747589, -2.619159, 0.3803922, 1, 0, 1,
-0.64248, 0.2443187, -1.929677, 0.372549, 1, 0, 1,
-0.6423159, -1.501756, -3.589774, 0.3686275, 1, 0, 1,
-0.6408066, -0.4141802, -3.624198, 0.3607843, 1, 0, 1,
-0.6395122, -0.2093046, -5.190735, 0.3568628, 1, 0, 1,
-0.6378046, 0.6805815, -0.8472803, 0.3490196, 1, 0, 1,
-0.6305485, 0.5754431, -0.6875851, 0.345098, 1, 0, 1,
-0.6300206, -0.309147, -1.87687, 0.3372549, 1, 0, 1,
-0.6274081, -2.123079, -3.397541, 0.3333333, 1, 0, 1,
-0.6199769, -0.8037989, -1.300977, 0.3254902, 1, 0, 1,
-0.6161824, 0.823238, 0.5768946, 0.3215686, 1, 0, 1,
-0.6144116, 1.537243, 0.1250227, 0.3137255, 1, 0, 1,
-0.6083748, -0.766895, -3.062929, 0.3098039, 1, 0, 1,
-0.6066058, 0.6974953, 0.7298586, 0.3019608, 1, 0, 1,
-0.6044694, 0.1005071, -0.7709445, 0.2941177, 1, 0, 1,
-0.6035128, -0.1369019, -0.4412715, 0.2901961, 1, 0, 1,
-0.5955042, 0.2678443, -3.539769, 0.282353, 1, 0, 1,
-0.595028, 1.092079, -1.658904, 0.2784314, 1, 0, 1,
-0.5945726, 0.9272071, -0.6664425, 0.2705882, 1, 0, 1,
-0.5917956, -1.726814, -2.769255, 0.2666667, 1, 0, 1,
-0.5888366, -0.6684343, -2.285402, 0.2588235, 1, 0, 1,
-0.5859612, 0.3492529, -1.437131, 0.254902, 1, 0, 1,
-0.5834469, -0.0796479, -0.9033948, 0.2470588, 1, 0, 1,
-0.5709757, 0.303104, -1.735262, 0.2431373, 1, 0, 1,
-0.5652709, -0.1261559, -1.936114, 0.2352941, 1, 0, 1,
-0.5646262, 0.464244, 0.5467373, 0.2313726, 1, 0, 1,
-0.5606574, -1.088304, -3.522973, 0.2235294, 1, 0, 1,
-0.5564836, -0.2823133, -1.903034, 0.2196078, 1, 0, 1,
-0.5562167, 0.4931857, -0.2064752, 0.2117647, 1, 0, 1,
-0.5512489, -0.8448582, -2.124521, 0.2078431, 1, 0, 1,
-0.5360751, -0.3344454, -2.339356, 0.2, 1, 0, 1,
-0.5343242, -0.2919219, -1.819819, 0.1921569, 1, 0, 1,
-0.5322841, 1.713753, -0.8039864, 0.1882353, 1, 0, 1,
-0.5289922, -0.1594355, -2.22033, 0.1803922, 1, 0, 1,
-0.528154, 0.3513541, -1.267439, 0.1764706, 1, 0, 1,
-0.5269783, 1.307209, 0.4161687, 0.1686275, 1, 0, 1,
-0.5243375, 0.1001306, -2.852015, 0.1647059, 1, 0, 1,
-0.5242332, 0.6675659, -0.3477974, 0.1568628, 1, 0, 1,
-0.5210841, 0.9058713, -0.9396123, 0.1529412, 1, 0, 1,
-0.521029, 0.7113053, -0.3318108, 0.145098, 1, 0, 1,
-0.5192105, -0.5411241, -2.644633, 0.1411765, 1, 0, 1,
-0.5170808, -0.08587399, -0.7231659, 0.1333333, 1, 0, 1,
-0.5101804, 0.1125516, 0.5426689, 0.1294118, 1, 0, 1,
-0.5045998, -0.5669862, -3.392193, 0.1215686, 1, 0, 1,
-0.500818, 0.8428223, -1.642446, 0.1176471, 1, 0, 1,
-0.4969831, -0.3074106, -0.5260872, 0.1098039, 1, 0, 1,
-0.4967842, -0.6418551, -2.878878, 0.1058824, 1, 0, 1,
-0.4946453, 1.680653, 1.065116, 0.09803922, 1, 0, 1,
-0.4928698, 0.4699955, -0.3042635, 0.09019608, 1, 0, 1,
-0.4912962, -1.210058, -1.704616, 0.08627451, 1, 0, 1,
-0.4885544, -1.025275, -4.008892, 0.07843138, 1, 0, 1,
-0.4869275, 1.076429, -0.2462709, 0.07450981, 1, 0, 1,
-0.4851237, -0.1612029, -2.045039, 0.06666667, 1, 0, 1,
-0.4846692, -0.4069575, -3.687717, 0.0627451, 1, 0, 1,
-0.4797474, -0.3645039, -3.365503, 0.05490196, 1, 0, 1,
-0.4772642, -0.6185609, -3.066702, 0.05098039, 1, 0, 1,
-0.4762807, -2.142058, -4.844091, 0.04313726, 1, 0, 1,
-0.476027, 0.5383077, -1.161107, 0.03921569, 1, 0, 1,
-0.4752578, -1.773232, -2.116431, 0.03137255, 1, 0, 1,
-0.4741693, -0.1035243, -1.073263, 0.02745098, 1, 0, 1,
-0.470349, 0.9238361, 1.534292, 0.01960784, 1, 0, 1,
-0.4686084, -0.09088454, -1.532535, 0.01568628, 1, 0, 1,
-0.4672513, 0.2593718, -0.6051826, 0.007843138, 1, 0, 1,
-0.464981, 0.1559868, -1.525199, 0.003921569, 1, 0, 1,
-0.4603809, 2.112969, -0.7299682, 0, 1, 0.003921569, 1,
-0.457909, 0.3501404, -1.358654, 0, 1, 0.01176471, 1,
-0.4577455, -1.278911, -2.281939, 0, 1, 0.01568628, 1,
-0.4488203, -0.4810157, -3.303186, 0, 1, 0.02352941, 1,
-0.4461204, -0.08125283, -1.110639, 0, 1, 0.02745098, 1,
-0.4452133, 1.607516, -1.349843, 0, 1, 0.03529412, 1,
-0.4433781, 1.521506, -1.15038, 0, 1, 0.03921569, 1,
-0.4401234, 1.097963, 0.5207817, 0, 1, 0.04705882, 1,
-0.4388636, 0.6605095, -0.07563593, 0, 1, 0.05098039, 1,
-0.4384308, 0.03527264, -1.202304, 0, 1, 0.05882353, 1,
-0.4383399, -0.7871268, -3.720822, 0, 1, 0.0627451, 1,
-0.4378449, -0.4564395, -2.559662, 0, 1, 0.07058824, 1,
-0.4371027, -1.538181, -3.294889, 0, 1, 0.07450981, 1,
-0.4342085, -0.4871421, -3.823172, 0, 1, 0.08235294, 1,
-0.4317064, -0.4020592, -2.829482, 0, 1, 0.08627451, 1,
-0.4285265, 0.6876695, 0.4548994, 0, 1, 0.09411765, 1,
-0.4262464, -0.08760015, -1.532712, 0, 1, 0.1019608, 1,
-0.4223925, 0.5825733, -0.1301885, 0, 1, 0.1058824, 1,
-0.4168523, -0.3835478, -0.8170303, 0, 1, 0.1137255, 1,
-0.4137406, 0.5760686, 0.07419037, 0, 1, 0.1176471, 1,
-0.4098864, -0.2678061, -3.666977, 0, 1, 0.1254902, 1,
-0.408966, -1.059385, -2.88308, 0, 1, 0.1294118, 1,
-0.4072946, -0.195593, -3.497635, 0, 1, 0.1372549, 1,
-0.4064773, 1.56166, -0.04008758, 0, 1, 0.1411765, 1,
-0.4056243, -1.736201, -2.519245, 0, 1, 0.1490196, 1,
-0.4054461, 0.6404975, -0.6219131, 0, 1, 0.1529412, 1,
-0.3993792, 0.01774428, -0.581844, 0, 1, 0.1607843, 1,
-0.3962206, -0.6772707, -2.877714, 0, 1, 0.1647059, 1,
-0.3940029, -0.360546, -1.790008, 0, 1, 0.172549, 1,
-0.3915188, -1.073492, -3.13485, 0, 1, 0.1764706, 1,
-0.3886469, -0.3287199, -1.849929, 0, 1, 0.1843137, 1,
-0.3868013, -0.01367854, -0.2614742, 0, 1, 0.1882353, 1,
-0.3847735, 0.7529246, -1.141335, 0, 1, 0.1960784, 1,
-0.3736628, 0.2563914, 0.4421214, 0, 1, 0.2039216, 1,
-0.3706903, 1.256491, -0.8100356, 0, 1, 0.2078431, 1,
-0.3703402, -1.661153, -2.80763, 0, 1, 0.2156863, 1,
-0.3663163, 1.421371, 1.293003, 0, 1, 0.2196078, 1,
-0.365919, 0.3998185, 2.448493, 0, 1, 0.227451, 1,
-0.3654705, -0.8474687, -3.313523, 0, 1, 0.2313726, 1,
-0.364993, 1.046243, 0.3350417, 0, 1, 0.2392157, 1,
-0.3620707, -0.2852206, -0.8804704, 0, 1, 0.2431373, 1,
-0.3584324, 0.9098755, 0.5795623, 0, 1, 0.2509804, 1,
-0.3569978, 1.872986, 0.642051, 0, 1, 0.254902, 1,
-0.3551735, -2.056714, -4.397552, 0, 1, 0.2627451, 1,
-0.3530204, -1.374819, -2.678893, 0, 1, 0.2666667, 1,
-0.3499293, -0.4216307, -2.980849, 0, 1, 0.2745098, 1,
-0.3486414, -0.1182108, -0.8382659, 0, 1, 0.2784314, 1,
-0.3482755, -0.8770281, -2.435999, 0, 1, 0.2862745, 1,
-0.3446161, -1.120195, -2.632612, 0, 1, 0.2901961, 1,
-0.3427112, 0.3875551, 0.4400944, 0, 1, 0.2980392, 1,
-0.3405753, -1.000286, -3.012595, 0, 1, 0.3058824, 1,
-0.3403341, 0.7866936, -0.7863271, 0, 1, 0.3098039, 1,
-0.3380437, -1.148746, -2.168369, 0, 1, 0.3176471, 1,
-0.337231, -1.243926, -3.07606, 0, 1, 0.3215686, 1,
-0.3351155, 0.2435673, -1.041762, 0, 1, 0.3294118, 1,
-0.3336584, 0.3713805, -0.8406543, 0, 1, 0.3333333, 1,
-0.3333793, -0.7315248, -2.928245, 0, 1, 0.3411765, 1,
-0.3324808, 1.484858, 0.1250864, 0, 1, 0.345098, 1,
-0.3214067, 0.5402533, 0.5941903, 0, 1, 0.3529412, 1,
-0.3199626, 1.821634, -0.6447225, 0, 1, 0.3568628, 1,
-0.319804, -0.7854729, -2.499387, 0, 1, 0.3647059, 1,
-0.3117447, 0.06935368, -0.5081763, 0, 1, 0.3686275, 1,
-0.3082124, -0.1861456, -1.612278, 0, 1, 0.3764706, 1,
-0.3061677, 2.080898, 0.502309, 0, 1, 0.3803922, 1,
-0.2980888, -1.204321, -2.763202, 0, 1, 0.3882353, 1,
-0.2961701, -0.01430318, -1.76114, 0, 1, 0.3921569, 1,
-0.2905159, 0.03856751, -1.90091, 0, 1, 0.4, 1,
-0.2892188, 0.02049326, -3.172388, 0, 1, 0.4078431, 1,
-0.2840783, -0.9170901, -1.03367, 0, 1, 0.4117647, 1,
-0.2819686, -0.06748104, -3.052268, 0, 1, 0.4196078, 1,
-0.2779984, 0.4135346, -0.1843221, 0, 1, 0.4235294, 1,
-0.2766796, 0.9982107, 0.1460257, 0, 1, 0.4313726, 1,
-0.2758616, 0.2354116, -0.655997, 0, 1, 0.4352941, 1,
-0.2753747, -1.632385, -3.378147, 0, 1, 0.4431373, 1,
-0.271462, 1.270265, 0.1029318, 0, 1, 0.4470588, 1,
-0.2669087, -0.910435, -4.051897, 0, 1, 0.454902, 1,
-0.2661864, -1.009965, -4.369712, 0, 1, 0.4588235, 1,
-0.2635254, -0.5031169, -1.548241, 0, 1, 0.4666667, 1,
-0.2602761, -0.8704314, -0.343972, 0, 1, 0.4705882, 1,
-0.255527, 1.381535, 0.2346732, 0, 1, 0.4784314, 1,
-0.2541217, -0.4275434, -2.606225, 0, 1, 0.4823529, 1,
-0.2511961, 1.19332, 0.5571226, 0, 1, 0.4901961, 1,
-0.2453318, 0.1078296, -0.6511097, 0, 1, 0.4941176, 1,
-0.2441078, -0.4227776, -1.256404, 0, 1, 0.5019608, 1,
-0.2437858, -0.2298036, -4.373449, 0, 1, 0.509804, 1,
-0.2377211, -0.9295732, -2.901989, 0, 1, 0.5137255, 1,
-0.2339534, 0.4104439, -0.09623528, 0, 1, 0.5215687, 1,
-0.2332078, -0.8635063, -2.921425, 0, 1, 0.5254902, 1,
-0.2260166, -0.6805549, -3.32219, 0, 1, 0.5333334, 1,
-0.2247874, 0.7730165, -2.379561, 0, 1, 0.5372549, 1,
-0.2208023, -0.08981343, -0.1784434, 0, 1, 0.5450981, 1,
-0.2157131, 0.5240033, -0.03617895, 0, 1, 0.5490196, 1,
-0.2110734, 0.08889884, -0.6462272, 0, 1, 0.5568628, 1,
-0.2099021, -0.9491612, -3.313917, 0, 1, 0.5607843, 1,
-0.2073946, 1.179398, 1.185309, 0, 1, 0.5686275, 1,
-0.2048786, 0.6497042, 0.639783, 0, 1, 0.572549, 1,
-0.2043901, 0.3299697, -1.630056, 0, 1, 0.5803922, 1,
-0.202834, -1.099579, -1.926089, 0, 1, 0.5843138, 1,
-0.1982366, 1.13415, 0.6283196, 0, 1, 0.5921569, 1,
-0.197934, -2.125623, -2.383293, 0, 1, 0.5960785, 1,
-0.1941586, -1.015603, -2.051339, 0, 1, 0.6039216, 1,
-0.1863612, 1.467187, 2.223084, 0, 1, 0.6117647, 1,
-0.1820498, 0.6493775, -0.4317328, 0, 1, 0.6156863, 1,
-0.1793969, 0.2974239, -3.51191, 0, 1, 0.6235294, 1,
-0.1768531, -0.1457283, -2.007094, 0, 1, 0.627451, 1,
-0.1725288, 0.4068527, 1.421021, 0, 1, 0.6352941, 1,
-0.1717736, -0.2880702, -3.805075, 0, 1, 0.6392157, 1,
-0.1680873, -0.7264221, -1.932095, 0, 1, 0.6470588, 1,
-0.161382, -0.1484664, -0.6694611, 0, 1, 0.6509804, 1,
-0.1600922, -0.821399, -2.655849, 0, 1, 0.6588235, 1,
-0.1596073, 0.08430812, -2.171538, 0, 1, 0.6627451, 1,
-0.1592168, -1.111445, -0.7718151, 0, 1, 0.6705883, 1,
-0.1518064, 0.2105168, -0.6338292, 0, 1, 0.6745098, 1,
-0.1510607, 0.7069358, -1.899271, 0, 1, 0.682353, 1,
-0.1503333, -0.02377508, -1.650846, 0, 1, 0.6862745, 1,
-0.1450018, 1.30007, -0.32347, 0, 1, 0.6941177, 1,
-0.1336978, 1.00314, -0.4542834, 0, 1, 0.7019608, 1,
-0.1312987, 0.6352504, -0.2547172, 0, 1, 0.7058824, 1,
-0.1289562, -0.07734066, -3.211925, 0, 1, 0.7137255, 1,
-0.1211434, 0.1384991, -2.030755, 0, 1, 0.7176471, 1,
-0.1196593, -1.963961, -2.878732, 0, 1, 0.7254902, 1,
-0.1173895, -1.085841, -2.510662, 0, 1, 0.7294118, 1,
-0.1160044, 1.312705, 0.1164268, 0, 1, 0.7372549, 1,
-0.1154481, 1.584409, -1.030274, 0, 1, 0.7411765, 1,
-0.1133906, 0.6340059, -0.2550772, 0, 1, 0.7490196, 1,
-0.1105475, 2.418268, 0.8013351, 0, 1, 0.7529412, 1,
-0.1098759, -1.441487, -1.39592, 0, 1, 0.7607843, 1,
-0.1064337, 0.8473998, -1.938301, 0, 1, 0.7647059, 1,
-0.1057974, 0.01483959, -0.1911401, 0, 1, 0.772549, 1,
-0.1000464, -0.4405744, -3.828232, 0, 1, 0.7764706, 1,
-0.09863887, 0.2876413, 1.154533, 0, 1, 0.7843137, 1,
-0.09830458, -1.682591, -1.340981, 0, 1, 0.7882353, 1,
-0.09406304, -1.086667, -3.313941, 0, 1, 0.7960784, 1,
-0.0935099, -0.6518093, -1.457129, 0, 1, 0.8039216, 1,
-0.09249127, -0.8942963, -2.204031, 0, 1, 0.8078431, 1,
-0.09219719, -0.09131815, -2.365891, 0, 1, 0.8156863, 1,
-0.09101734, 0.153295, -0.5740766, 0, 1, 0.8196079, 1,
-0.0827027, -0.4982791, -4.222387, 0, 1, 0.827451, 1,
-0.08249286, -0.2637693, -0.570004, 0, 1, 0.8313726, 1,
-0.0816623, -0.007794307, -1.285732, 0, 1, 0.8392157, 1,
-0.07774005, 0.5737178, 0.8356227, 0, 1, 0.8431373, 1,
-0.0764768, -1.301754, -2.114177, 0, 1, 0.8509804, 1,
-0.07192424, -0.004193461, -2.50612, 0, 1, 0.854902, 1,
-0.07091683, 2.188441, -0.4948138, 0, 1, 0.8627451, 1,
-0.06796454, 0.01005905, -1.238569, 0, 1, 0.8666667, 1,
-0.06617689, -0.2258141, -2.118072, 0, 1, 0.8745098, 1,
-0.0659829, 1.44267, 2.366943, 0, 1, 0.8784314, 1,
-0.06454374, -1.242411, -1.015184, 0, 1, 0.8862745, 1,
-0.064483, -0.6294104, -3.006595, 0, 1, 0.8901961, 1,
-0.06332843, -1.153734, -2.093, 0, 1, 0.8980392, 1,
-0.06287358, 2.442221, 1.524012, 0, 1, 0.9058824, 1,
-0.06217641, -0.0675088, -2.739473, 0, 1, 0.9098039, 1,
-0.06122827, 0.03383034, -1.148207, 0, 1, 0.9176471, 1,
-0.06065672, 0.7802237, -2.365816, 0, 1, 0.9215686, 1,
-0.05893957, 1.664482, -2.544552, 0, 1, 0.9294118, 1,
-0.05674857, 0.972246, -0.5660084, 0, 1, 0.9333333, 1,
-0.05658975, 0.1313033, -1.546221, 0, 1, 0.9411765, 1,
-0.05326216, -0.02596081, -2.347905, 0, 1, 0.945098, 1,
-0.04584615, 1.202501, 0.354103, 0, 1, 0.9529412, 1,
-0.04352453, -0.1062531, -3.281535, 0, 1, 0.9568627, 1,
-0.04337088, 0.2085329, 0.4709708, 0, 1, 0.9647059, 1,
-0.04330155, -0.2023736, -1.640065, 0, 1, 0.9686275, 1,
-0.04170034, 0.4681234, -0.7762274, 0, 1, 0.9764706, 1,
-0.04112798, -0.5395134, -1.882982, 0, 1, 0.9803922, 1,
-0.04020284, 0.5848121, 0.5397259, 0, 1, 0.9882353, 1,
-0.03605728, 0.03468084, -2.554474, 0, 1, 0.9921569, 1,
-0.03567573, -0.5742801, -2.244397, 0, 1, 1, 1,
-0.03524075, 0.4563715, -1.486577, 0, 0.9921569, 1, 1,
-0.03474035, -0.8134044, -3.25335, 0, 0.9882353, 1, 1,
-0.03012979, 1.115559, 1.004702, 0, 0.9803922, 1, 1,
-0.0235979, 1.130963, -1.469996, 0, 0.9764706, 1, 1,
-0.01905925, 0.1351403, -1.941045, 0, 0.9686275, 1, 1,
-0.0141949, 0.9488912, -0.9466631, 0, 0.9647059, 1, 1,
-0.01396899, 0.3521091, -0.6461506, 0, 0.9568627, 1, 1,
-0.006267639, -1.884725, -2.427999, 0, 0.9529412, 1, 1,
-0.0062203, 0.746984, -1.473534, 0, 0.945098, 1, 1,
-0.004871587, -0.2780358, -3.755599, 0, 0.9411765, 1, 1,
-0.003701074, 0.6802292, 1.038713, 0, 0.9333333, 1, 1,
-0.001343799, -0.1054358, -3.213007, 0, 0.9294118, 1, 1,
-0.0002075052, 0.8434168, 0.7562109, 0, 0.9215686, 1, 1,
0.0004105744, 1.864715, 0.9090292, 0, 0.9176471, 1, 1,
0.0009420026, 0.9814931, 1.283678, 0, 0.9098039, 1, 1,
0.001321974, -0.04804935, 1.696955, 0, 0.9058824, 1, 1,
0.005957401, -1.089885, 2.805393, 0, 0.8980392, 1, 1,
0.009833035, -0.1953597, 5.700254, 0, 0.8901961, 1, 1,
0.0166766, -0.5855755, 0.7750732, 0, 0.8862745, 1, 1,
0.02352146, -0.2855459, 4.090319, 0, 0.8784314, 1, 1,
0.02708517, 1.007485, -0.2306013, 0, 0.8745098, 1, 1,
0.02922534, -1.072661, 5.245034, 0, 0.8666667, 1, 1,
0.0294117, 0.08315406, 2.297914, 0, 0.8627451, 1, 1,
0.02970353, 0.0636337, -0.2802396, 0, 0.854902, 1, 1,
0.03149203, -1.496996, 3.431458, 0, 0.8509804, 1, 1,
0.03443586, 0.2864079, 1.153254, 0, 0.8431373, 1, 1,
0.0351072, 0.4783104, -0.3056356, 0, 0.8392157, 1, 1,
0.04464984, 0.1820531, 2.197285, 0, 0.8313726, 1, 1,
0.04703117, -1.678259, 5.041506, 0, 0.827451, 1, 1,
0.0529514, 0.2945485, -0.7000332, 0, 0.8196079, 1, 1,
0.0582439, 2.123259, 1.076421, 0, 0.8156863, 1, 1,
0.05973405, 0.06871893, -0.5823396, 0, 0.8078431, 1, 1,
0.06839878, -0.5837545, 4.345488, 0, 0.8039216, 1, 1,
0.07219534, 0.2559079, 1.576469, 0, 0.7960784, 1, 1,
0.07257025, -0.3909495, 3.705539, 0, 0.7882353, 1, 1,
0.07578498, -0.3143564, 2.715394, 0, 0.7843137, 1, 1,
0.0765173, -1.159177, 4.723851, 0, 0.7764706, 1, 1,
0.07898108, -0.1519416, 1.491229, 0, 0.772549, 1, 1,
0.08866684, 1.266962, 1.467111, 0, 0.7647059, 1, 1,
0.1013197, -0.0491739, 2.523584, 0, 0.7607843, 1, 1,
0.1023948, -0.05228883, 1.325692, 0, 0.7529412, 1, 1,
0.1107223, -1.794961, 3.314067, 0, 0.7490196, 1, 1,
0.1126086, -0.944576, 4.222868, 0, 0.7411765, 1, 1,
0.1171335, 0.4106518, 0.3639187, 0, 0.7372549, 1, 1,
0.1207868, 0.2146458, 0.1041576, 0, 0.7294118, 1, 1,
0.1253763, -1.00284, 1.719151, 0, 0.7254902, 1, 1,
0.1274269, -1.679438, 4.008017, 0, 0.7176471, 1, 1,
0.1278088, 0.7209957, 1.395946, 0, 0.7137255, 1, 1,
0.1300364, 0.09711313, 1.338195, 0, 0.7058824, 1, 1,
0.1309793, -1.136094, 2.445378, 0, 0.6980392, 1, 1,
0.1322156, -1.636588, 3.092114, 0, 0.6941177, 1, 1,
0.1336324, 0.3780414, 1.272335, 0, 0.6862745, 1, 1,
0.1338575, -1.896313, 2.033508, 0, 0.682353, 1, 1,
0.1360217, -0.1383846, 2.73553, 0, 0.6745098, 1, 1,
0.1375638, 0.0313192, 0.3913524, 0, 0.6705883, 1, 1,
0.1382771, -0.2819368, 3.398142, 0, 0.6627451, 1, 1,
0.1405414, -0.5380537, 3.215255, 0, 0.6588235, 1, 1,
0.1417261, 1.899275, -1.428674, 0, 0.6509804, 1, 1,
0.1425935, -0.5883668, 5.42414, 0, 0.6470588, 1, 1,
0.1445837, -0.8636667, 1.820678, 0, 0.6392157, 1, 1,
0.1479152, -0.5995416, 1.21443, 0, 0.6352941, 1, 1,
0.1487888, 0.3022126, -2.405659, 0, 0.627451, 1, 1,
0.1522234, -1.655997, 3.141617, 0, 0.6235294, 1, 1,
0.15606, 1.634639, 0.8933964, 0, 0.6156863, 1, 1,
0.1590143, 1.645657, 0.0186345, 0, 0.6117647, 1, 1,
0.1615323, 1.011065, 1.475352, 0, 0.6039216, 1, 1,
0.1622679, -1.469748, 4.104004, 0, 0.5960785, 1, 1,
0.168018, -1.566338, 3.907843, 0, 0.5921569, 1, 1,
0.1699501, 0.8303022, -1.025967, 0, 0.5843138, 1, 1,
0.1702978, -1.868071, 3.70957, 0, 0.5803922, 1, 1,
0.1706367, -0.7323655, 3.883345, 0, 0.572549, 1, 1,
0.1715602, -0.9402405, 3.518012, 0, 0.5686275, 1, 1,
0.1726883, -1.074896, 3.365908, 0, 0.5607843, 1, 1,
0.1731981, 1.205331, 0.7625664, 0, 0.5568628, 1, 1,
0.1786346, 0.1017707, 1.161653, 0, 0.5490196, 1, 1,
0.1786581, -0.7269075, 2.478907, 0, 0.5450981, 1, 1,
0.1863259, 0.2775541, 1.127419, 0, 0.5372549, 1, 1,
0.186833, 0.04865885, -0.03098705, 0, 0.5333334, 1, 1,
0.1871709, 1.126411, 0.9422151, 0, 0.5254902, 1, 1,
0.1872724, -0.3234921, 1.260827, 0, 0.5215687, 1, 1,
0.1917511, 1.403518, 0.05685211, 0, 0.5137255, 1, 1,
0.1956965, -0.8818974, 2.054859, 0, 0.509804, 1, 1,
0.1967755, 1.404852, 0.5909747, 0, 0.5019608, 1, 1,
0.1980933, 0.5226616, -0.4027747, 0, 0.4941176, 1, 1,
0.2052764, 0.3223118, 0.8864378, 0, 0.4901961, 1, 1,
0.207977, -0.07385079, 0.04461001, 0, 0.4823529, 1, 1,
0.2092132, -1.5784, 3.21428, 0, 0.4784314, 1, 1,
0.2121144, 0.9023285, 0.9642374, 0, 0.4705882, 1, 1,
0.2187041, 0.3602495, 1.375248, 0, 0.4666667, 1, 1,
0.2188679, 0.7187496, 0.1505067, 0, 0.4588235, 1, 1,
0.219568, 1.602361, -0.9022325, 0, 0.454902, 1, 1,
0.2267541, 0.2416565, 0.9814535, 0, 0.4470588, 1, 1,
0.227524, 0.7642611, -0.5835304, 0, 0.4431373, 1, 1,
0.2278096, 0.9343773, 0.3442882, 0, 0.4352941, 1, 1,
0.2327575, -0.8639562, 2.192858, 0, 0.4313726, 1, 1,
0.2343329, 1.344026, 1.847392, 0, 0.4235294, 1, 1,
0.234551, -1.035001, 3.393228, 0, 0.4196078, 1, 1,
0.2403071, 0.9206346, 0.6659694, 0, 0.4117647, 1, 1,
0.2407445, 0.9374714, -0.9329502, 0, 0.4078431, 1, 1,
0.2427264, -1.698916, 2.605365, 0, 0.4, 1, 1,
0.2473304, 0.003522977, 1.593565, 0, 0.3921569, 1, 1,
0.2506435, -0.456239, 3.093868, 0, 0.3882353, 1, 1,
0.2531635, -2.910126, 4.183444, 0, 0.3803922, 1, 1,
0.2606259, -2.646002, 1.146288, 0, 0.3764706, 1, 1,
0.2613241, 0.8423062, 0.04274761, 0, 0.3686275, 1, 1,
0.2629341, -1.492821, 2.795725, 0, 0.3647059, 1, 1,
0.2639874, 2.056389, 0.4607146, 0, 0.3568628, 1, 1,
0.2641635, 0.7018262, 1.021226, 0, 0.3529412, 1, 1,
0.2649027, -2.009239, 1.275998, 0, 0.345098, 1, 1,
0.2669049, 1.300285, -0.3825833, 0, 0.3411765, 1, 1,
0.2694597, 0.8992838, 0.3504336, 0, 0.3333333, 1, 1,
0.2726133, -0.2350348, 1.166051, 0, 0.3294118, 1, 1,
0.2748516, -1.246788, 4.828806, 0, 0.3215686, 1, 1,
0.276931, -1.622853, 4.485746, 0, 0.3176471, 1, 1,
0.2787441, -0.9432055, 3.16832, 0, 0.3098039, 1, 1,
0.2798527, 0.08597614, 1.78945, 0, 0.3058824, 1, 1,
0.2818161, 0.8705603, -0.2517554, 0, 0.2980392, 1, 1,
0.2844221, 2.234071, 0.26485, 0, 0.2901961, 1, 1,
0.2853316, -0.758665, 2.013092, 0, 0.2862745, 1, 1,
0.2855844, 1.943309, 1.378726, 0, 0.2784314, 1, 1,
0.2871622, 1.618127, 1.107314, 0, 0.2745098, 1, 1,
0.2899122, -2.026093, 3.079676, 0, 0.2666667, 1, 1,
0.2968453, 0.4884589, -0.6890746, 0, 0.2627451, 1, 1,
0.3000364, -1.037823, 3.547831, 0, 0.254902, 1, 1,
0.3018261, 0.5166333, -0.8937581, 0, 0.2509804, 1, 1,
0.3022361, -0.587866, 4.674904, 0, 0.2431373, 1, 1,
0.3040329, -0.7493347, 2.891579, 0, 0.2392157, 1, 1,
0.3074495, -0.3795402, 1.802421, 0, 0.2313726, 1, 1,
0.3125039, 0.1596558, 0.2480508, 0, 0.227451, 1, 1,
0.3179858, -0.4167004, 2.7512, 0, 0.2196078, 1, 1,
0.3223064, -0.6439714, 2.588367, 0, 0.2156863, 1, 1,
0.3244081, 2.525941, 0.858433, 0, 0.2078431, 1, 1,
0.3245694, -0.3502414, 3.037104, 0, 0.2039216, 1, 1,
0.3246927, -0.3818347, 2.203674, 0, 0.1960784, 1, 1,
0.3253644, 0.01394928, 2.963358, 0, 0.1882353, 1, 1,
0.336123, 0.3357096, 0.1290604, 0, 0.1843137, 1, 1,
0.3387791, 0.04253452, 1.895366, 0, 0.1764706, 1, 1,
0.3387896, -1.043257, 4.009348, 0, 0.172549, 1, 1,
0.3506871, -0.9441401, 4.439448, 0, 0.1647059, 1, 1,
0.3517067, -0.1341615, 2.45806, 0, 0.1607843, 1, 1,
0.3592796, 1.160012, 0.5512874, 0, 0.1529412, 1, 1,
0.3614148, 0.04721228, 3.14678, 0, 0.1490196, 1, 1,
0.3662857, -1.705172, 1.148568, 0, 0.1411765, 1, 1,
0.3703429, 0.6023192, 0.6084037, 0, 0.1372549, 1, 1,
0.370981, -1.183372, 2.639973, 0, 0.1294118, 1, 1,
0.373181, -2.774786, 3.757349, 0, 0.1254902, 1, 1,
0.3743598, -0.2422868, 3.224167, 0, 0.1176471, 1, 1,
0.3828079, 2.183872, 0.01162702, 0, 0.1137255, 1, 1,
0.3868703, -0.1498034, 1.451654, 0, 0.1058824, 1, 1,
0.3913431, -0.03151107, 1.287465, 0, 0.09803922, 1, 1,
0.391853, -0.2137348, 2.297098, 0, 0.09411765, 1, 1,
0.3930835, 0.4356915, 1.736132, 0, 0.08627451, 1, 1,
0.3945401, -0.2692383, 0.9097977, 0, 0.08235294, 1, 1,
0.3974445, -1.595484, 3.961297, 0, 0.07450981, 1, 1,
0.4040876, 0.3497289, 1.238773, 0, 0.07058824, 1, 1,
0.4041663, -0.386512, 2.395157, 0, 0.0627451, 1, 1,
0.4043257, -0.3152922, 2.817242, 0, 0.05882353, 1, 1,
0.4062234, 1.565656, -0.305434, 0, 0.05098039, 1, 1,
0.4068843, -0.278227, 1.810934, 0, 0.04705882, 1, 1,
0.4093405, 0.3558733, 0.9655861, 0, 0.03921569, 1, 1,
0.4108955, -0.4508224, 0.9224535, 0, 0.03529412, 1, 1,
0.4120833, -0.2199308, 3.017043, 0, 0.02745098, 1, 1,
0.4130305, 1.774866, -1.931474, 0, 0.02352941, 1, 1,
0.4173082, 0.388227, 1.056458, 0, 0.01568628, 1, 1,
0.4183765, -0.5329244, 2.583926, 0, 0.01176471, 1, 1,
0.4212257, -0.8905914, 2.074265, 0, 0.003921569, 1, 1,
0.4234675, 1.008547, 0.6398346, 0.003921569, 0, 1, 1,
0.4457727, 1.318754, -0.1059278, 0.007843138, 0, 1, 1,
0.4496979, 0.4431395, 0.1760825, 0.01568628, 0, 1, 1,
0.4508448, -0.4911769, 2.334987, 0.01960784, 0, 1, 1,
0.4510947, -1.957642, 1.531935, 0.02745098, 0, 1, 1,
0.4517846, 0.267778, 1.612136, 0.03137255, 0, 1, 1,
0.45186, 0.82713, -0.1485445, 0.03921569, 0, 1, 1,
0.4522972, -0.3025174, 2.059156, 0.04313726, 0, 1, 1,
0.4528317, -0.434343, 2.692776, 0.05098039, 0, 1, 1,
0.4555832, -0.4436544, 3.463036, 0.05490196, 0, 1, 1,
0.4589792, 0.3844685, -0.3473584, 0.0627451, 0, 1, 1,
0.4626467, 0.7962104, 0.2555716, 0.06666667, 0, 1, 1,
0.4639745, -0.1467348, 1.010904, 0.07450981, 0, 1, 1,
0.4691529, -0.2191856, 1.013212, 0.07843138, 0, 1, 1,
0.472216, -0.427, 3.830232, 0.08627451, 0, 1, 1,
0.4731337, 0.8238657, -0.1697568, 0.09019608, 0, 1, 1,
0.4734328, -0.8634468, 0.8111768, 0.09803922, 0, 1, 1,
0.4768175, -0.6847105, 2.994571, 0.1058824, 0, 1, 1,
0.4771141, -0.3636332, 1.58079, 0.1098039, 0, 1, 1,
0.4785144, 0.2222002, 1.577725, 0.1176471, 0, 1, 1,
0.4847176, -0.6330507, 1.746069, 0.1215686, 0, 1, 1,
0.4871921, -0.6056083, 1.873238, 0.1294118, 0, 1, 1,
0.4889684, 1.403489, -0.8161709, 0.1333333, 0, 1, 1,
0.4957772, 0.1804889, 2.791621, 0.1411765, 0, 1, 1,
0.4998328, -2.051531, 3.405899, 0.145098, 0, 1, 1,
0.5027101, 0.9563243, 1.550003, 0.1529412, 0, 1, 1,
0.504178, -0.9237022, 3.472634, 0.1568628, 0, 1, 1,
0.5104215, 1.001961, 2.29336, 0.1647059, 0, 1, 1,
0.5173758, -1.172479, 1.815196, 0.1686275, 0, 1, 1,
0.5180929, 0.2360413, 0.1149836, 0.1764706, 0, 1, 1,
0.5205135, -1.526852, 2.307739, 0.1803922, 0, 1, 1,
0.5219308, 1.510533, 0.5927062, 0.1882353, 0, 1, 1,
0.5242399, 0.03590439, 0.2136744, 0.1921569, 0, 1, 1,
0.5253485, 0.52367, 0.2371811, 0.2, 0, 1, 1,
0.5285212, 0.9314731, 0.3015112, 0.2078431, 0, 1, 1,
0.5306802, -0.3737682, 3.737432, 0.2117647, 0, 1, 1,
0.5361598, 0.1433062, 1.797709, 0.2196078, 0, 1, 1,
0.540222, -1.030209, 1.999046, 0.2235294, 0, 1, 1,
0.5408751, -0.5775499, 3.003338, 0.2313726, 0, 1, 1,
0.5416706, 1.316632, 0.844678, 0.2352941, 0, 1, 1,
0.5417113, 1.364568, 0.5242131, 0.2431373, 0, 1, 1,
0.5552532, -0.7222969, 2.450104, 0.2470588, 0, 1, 1,
0.5598648, -0.6972772, 1.417254, 0.254902, 0, 1, 1,
0.5625966, -0.4031208, 2.853539, 0.2588235, 0, 1, 1,
0.5629454, -0.6766645, -1.608219, 0.2666667, 0, 1, 1,
0.5636469, -0.4190953, 2.885171, 0.2705882, 0, 1, 1,
0.568148, -1.666766, 2.906288, 0.2784314, 0, 1, 1,
0.5695757, -1.242803, 0.840789, 0.282353, 0, 1, 1,
0.5733871, 1.302529, -1.252529, 0.2901961, 0, 1, 1,
0.5757611, -0.7189409, 2.004165, 0.2941177, 0, 1, 1,
0.5768175, -0.8069686, 4.88585, 0.3019608, 0, 1, 1,
0.5796575, 1.023974, 1.85172, 0.3098039, 0, 1, 1,
0.5816656, 0.1292393, 0.3280095, 0.3137255, 0, 1, 1,
0.5826547, 0.7935243, 1.805226, 0.3215686, 0, 1, 1,
0.5847898, -0.3686455, 4.458375, 0.3254902, 0, 1, 1,
0.5864341, -0.3912069, 1.823787, 0.3333333, 0, 1, 1,
0.5937623, 0.1950209, 2.801963, 0.3372549, 0, 1, 1,
0.596446, 0.4808996, 0.2974357, 0.345098, 0, 1, 1,
0.5979943, 0.6646501, 1.247749, 0.3490196, 0, 1, 1,
0.5984534, 0.2341192, 3.460977, 0.3568628, 0, 1, 1,
0.5987815, -0.4409771, 3.468881, 0.3607843, 0, 1, 1,
0.5992664, -0.9101028, 1.780427, 0.3686275, 0, 1, 1,
0.6037087, 0.4454762, 0.3408243, 0.372549, 0, 1, 1,
0.6038491, -0.3124271, 1.236285, 0.3803922, 0, 1, 1,
0.6176891, -1.617837, 4.178369, 0.3843137, 0, 1, 1,
0.6177264, -0.8191729, 2.665149, 0.3921569, 0, 1, 1,
0.6202466, 0.05330944, 1.777873, 0.3960784, 0, 1, 1,
0.620271, -1.837245, 2.241121, 0.4039216, 0, 1, 1,
0.6205839, -0.2233185, 0.9847541, 0.4117647, 0, 1, 1,
0.625523, 2.445207, 0.8174371, 0.4156863, 0, 1, 1,
0.6316707, 1.327221, 1.868678, 0.4235294, 0, 1, 1,
0.6322682, -0.3412564, 3.165244, 0.427451, 0, 1, 1,
0.6338117, -1.068165, 2.100463, 0.4352941, 0, 1, 1,
0.6342171, -1.820584, 4.162384, 0.4392157, 0, 1, 1,
0.6396028, 2.67659, 0.6553729, 0.4470588, 0, 1, 1,
0.6443673, 0.4005688, 1.751886, 0.4509804, 0, 1, 1,
0.6446754, 0.4320943, 1.843919, 0.4588235, 0, 1, 1,
0.6458025, 0.7125051, -0.4892938, 0.4627451, 0, 1, 1,
0.6466467, 0.4389048, 0.6841422, 0.4705882, 0, 1, 1,
0.6630217, 0.4660856, 3.073498, 0.4745098, 0, 1, 1,
0.6735987, -0.4889177, 1.536992, 0.4823529, 0, 1, 1,
0.6736023, 0.8883035, 0.5426428, 0.4862745, 0, 1, 1,
0.683331, -0.8784384, 1.833611, 0.4941176, 0, 1, 1,
0.6877337, 0.1974773, 1.008871, 0.5019608, 0, 1, 1,
0.6894513, -0.1070659, 1.88536, 0.5058824, 0, 1, 1,
0.6930625, -1.051643, 2.029075, 0.5137255, 0, 1, 1,
0.6931973, 1.713169, -0.0970264, 0.5176471, 0, 1, 1,
0.6935722, -0.9181304, 2.405096, 0.5254902, 0, 1, 1,
0.6965428, -0.5357424, 3.208456, 0.5294118, 0, 1, 1,
0.6973179, 0.7430699, 1.491585, 0.5372549, 0, 1, 1,
0.6978387, 2.226301, 0.2766685, 0.5411765, 0, 1, 1,
0.6999012, 0.51344, 0.2684869, 0.5490196, 0, 1, 1,
0.7015086, 2.723984, -0.7340086, 0.5529412, 0, 1, 1,
0.7017058, 2.236571, 2.552686, 0.5607843, 0, 1, 1,
0.7024186, 0.08995342, -0.8248905, 0.5647059, 0, 1, 1,
0.7033482, 1.331822, 1.311346, 0.572549, 0, 1, 1,
0.7046775, -2.007784, 3.179664, 0.5764706, 0, 1, 1,
0.7074803, -2.344102, 3.3146, 0.5843138, 0, 1, 1,
0.7102153, 1.113793, 0.5332215, 0.5882353, 0, 1, 1,
0.7103663, -2.265181, 2.46786, 0.5960785, 0, 1, 1,
0.7142158, 0.4146099, 2.38754, 0.6039216, 0, 1, 1,
0.7154468, 0.8590857, 0.1447146, 0.6078432, 0, 1, 1,
0.7168547, 1.350385, 0.7415762, 0.6156863, 0, 1, 1,
0.7179645, 0.6685274, 1.720439, 0.6196079, 0, 1, 1,
0.7186321, -0.337517, 0.07222553, 0.627451, 0, 1, 1,
0.7231297, -2.672463, 2.916439, 0.6313726, 0, 1, 1,
0.7234735, -0.4995421, 1.523022, 0.6392157, 0, 1, 1,
0.7272162, -0.8167919, 1.278186, 0.6431373, 0, 1, 1,
0.7282594, -0.08941816, 0.3115278, 0.6509804, 0, 1, 1,
0.7292304, -0.2887384, 2.02051, 0.654902, 0, 1, 1,
0.7352251, -0.4458859, 2.39073, 0.6627451, 0, 1, 1,
0.7357358, -0.913887, 3.138361, 0.6666667, 0, 1, 1,
0.7387666, -0.04432107, 1.568781, 0.6745098, 0, 1, 1,
0.7451624, -0.6865339, 3.04526, 0.6784314, 0, 1, 1,
0.7455218, -1.221635, 2.625512, 0.6862745, 0, 1, 1,
0.7461639, 0.4696245, 1.315133, 0.6901961, 0, 1, 1,
0.746316, -0.4184647, 2.102419, 0.6980392, 0, 1, 1,
0.7484605, -0.4644206, 2.31138, 0.7058824, 0, 1, 1,
0.7513621, 0.1809874, 1.738277, 0.7098039, 0, 1, 1,
0.7532227, -0.5488002, 3.480423, 0.7176471, 0, 1, 1,
0.7538204, 1.204602, -0.1104542, 0.7215686, 0, 1, 1,
0.753921, 0.8764156, 0.9900452, 0.7294118, 0, 1, 1,
0.7540421, -2.191203, 3.481514, 0.7333333, 0, 1, 1,
0.7588155, -1.033418, 2.526493, 0.7411765, 0, 1, 1,
0.7669302, -0.8030622, 0.7847521, 0.7450981, 0, 1, 1,
0.7676921, 0.5472491, 2.275022, 0.7529412, 0, 1, 1,
0.7710591, -1.316866, 3.035217, 0.7568628, 0, 1, 1,
0.7735259, 0.2904595, 1.367093, 0.7647059, 0, 1, 1,
0.7754271, -0.4719032, 1.403413, 0.7686275, 0, 1, 1,
0.7792172, -0.502507, 1.757939, 0.7764706, 0, 1, 1,
0.7811058, -0.4941097, 2.70826, 0.7803922, 0, 1, 1,
0.7814257, -2.0913, 1.751276, 0.7882353, 0, 1, 1,
0.7903084, 0.0366337, 1.967801, 0.7921569, 0, 1, 1,
0.7983807, -0.6906728, 1.659105, 0.8, 0, 1, 1,
0.8011077, 2.638804, 1.334986, 0.8078431, 0, 1, 1,
0.8017391, 1.254971, 1.273077, 0.8117647, 0, 1, 1,
0.8018222, 1.218648, 0.612366, 0.8196079, 0, 1, 1,
0.8041037, -0.9535902, 2.244099, 0.8235294, 0, 1, 1,
0.8083797, -0.241641, 2.431507, 0.8313726, 0, 1, 1,
0.8165436, -0.7412535, 1.777275, 0.8352941, 0, 1, 1,
0.8249676, -1.009559, 3.492777, 0.8431373, 0, 1, 1,
0.8283864, -0.07885568, 2.219681, 0.8470588, 0, 1, 1,
0.8357453, -0.1546708, 0.4175062, 0.854902, 0, 1, 1,
0.8369281, -0.6718433, 3.316101, 0.8588235, 0, 1, 1,
0.8372523, 1.224892, 0.4965974, 0.8666667, 0, 1, 1,
0.8421751, -0.6155326, 2.73153, 0.8705882, 0, 1, 1,
0.843256, 0.1953635, 2.541349, 0.8784314, 0, 1, 1,
0.8441286, -0.9116978, 2.578004, 0.8823529, 0, 1, 1,
0.856682, -0.01403722, 1.860411, 0.8901961, 0, 1, 1,
0.8572705, 1.390899, 1.359309, 0.8941177, 0, 1, 1,
0.8584142, 1.632553, 1.775417, 0.9019608, 0, 1, 1,
0.8588869, -0.5903021, 2.612604, 0.9098039, 0, 1, 1,
0.8589577, -1.027338, 3.559758, 0.9137255, 0, 1, 1,
0.8658784, -0.09848601, 1.666943, 0.9215686, 0, 1, 1,
0.8890434, -0.4665051, 1.609193, 0.9254902, 0, 1, 1,
0.9041517, 0.3006899, 0.7268894, 0.9333333, 0, 1, 1,
0.9064155, 0.1543753, 1.248098, 0.9372549, 0, 1, 1,
0.9095575, -0.9770527, 3.221715, 0.945098, 0, 1, 1,
0.913622, 2.616872, 1.081857, 0.9490196, 0, 1, 1,
0.9219736, -0.4878339, 2.357243, 0.9568627, 0, 1, 1,
0.9248227, 0.3049095, 0.9963702, 0.9607843, 0, 1, 1,
0.9389454, 1.23166, 0.8534073, 0.9686275, 0, 1, 1,
0.9414729, -0.1912663, 1.325602, 0.972549, 0, 1, 1,
0.9472322, -1.04452, 3.137638, 0.9803922, 0, 1, 1,
0.9479094, -0.3615707, 1.977716, 0.9843137, 0, 1, 1,
0.9499741, 0.8865014, 0.6556858, 0.9921569, 0, 1, 1,
0.9525562, -0.7098114, 1.849888, 0.9960784, 0, 1, 1,
0.9530122, -0.02394264, -0.3936132, 1, 0, 0.9960784, 1,
0.955314, -1.524655, 2.291069, 1, 0, 0.9882353, 1,
0.9578845, 1.741527, 0.3417952, 1, 0, 0.9843137, 1,
0.9714593, 0.5503312, 0.7193788, 1, 0, 0.9764706, 1,
0.9773561, 0.3562849, -0.07195083, 1, 0, 0.972549, 1,
0.9777982, 0.652231, -1.704399, 1, 0, 0.9647059, 1,
0.9787734, 0.7908303, 0.199357, 1, 0, 0.9607843, 1,
0.9794459, -0.40959, 1.57838, 1, 0, 0.9529412, 1,
0.9829001, 1.987991, -0.04126617, 1, 0, 0.9490196, 1,
0.9831025, -1.617327, 1.328721, 1, 0, 0.9411765, 1,
0.9839217, -0.8557438, 0.8761738, 1, 0, 0.9372549, 1,
0.9880806, -0.8159915, 3.528083, 1, 0, 0.9294118, 1,
0.9895357, -1.850117, 3.77839, 1, 0, 0.9254902, 1,
0.9918572, 1.034889, 0.8983122, 1, 0, 0.9176471, 1,
0.9935938, 0.7524971, 0.6800227, 1, 0, 0.9137255, 1,
0.9939402, 1.219359, 0.7203437, 1, 0, 0.9058824, 1,
0.9954752, -0.08666166, 1.235427, 1, 0, 0.9019608, 1,
1.001893, -1.067717, 2.335631, 1, 0, 0.8941177, 1,
1.018687, 1.04621, -0.2470013, 1, 0, 0.8862745, 1,
1.024706, -0.4186669, 3.520785, 1, 0, 0.8823529, 1,
1.036373, 0.9834645, 1.919871, 1, 0, 0.8745098, 1,
1.037519, -1.474382, 1.662996, 1, 0, 0.8705882, 1,
1.038335, -0.3956133, 2.376291, 1, 0, 0.8627451, 1,
1.043768, -0.5176494, 2.916031, 1, 0, 0.8588235, 1,
1.044003, -0.5177405, 1.619339, 1, 0, 0.8509804, 1,
1.050553, 1.261448, 0.8615492, 1, 0, 0.8470588, 1,
1.057276, 0.6290543, 0.9120669, 1, 0, 0.8392157, 1,
1.061758, 0.2977416, 0.5428586, 1, 0, 0.8352941, 1,
1.062582, -0.3987111, 2.608033, 1, 0, 0.827451, 1,
1.063568, 0.6143289, -0.0906457, 1, 0, 0.8235294, 1,
1.071313, 0.9568053, 2.662057, 1, 0, 0.8156863, 1,
1.088324, 0.2769221, 1.589196, 1, 0, 0.8117647, 1,
1.095793, -1.402717, 2.589948, 1, 0, 0.8039216, 1,
1.099221, -1.043316, 0.5938681, 1, 0, 0.7960784, 1,
1.107503, -1.05668, 3.240636, 1, 0, 0.7921569, 1,
1.110964, 0.4779176, 2.951616, 1, 0, 0.7843137, 1,
1.11687, -0.2152786, 1.91891, 1, 0, 0.7803922, 1,
1.123938, 0.2153746, 1.80641, 1, 0, 0.772549, 1,
1.124167, 1.18114, 0.8461744, 1, 0, 0.7686275, 1,
1.127434, 1.386338, -0.313438, 1, 0, 0.7607843, 1,
1.128269, -1.571113, 0.7326055, 1, 0, 0.7568628, 1,
1.131814, 0.1409355, 1.57458, 1, 0, 0.7490196, 1,
1.132976, -0.03486326, 3.178267, 1, 0, 0.7450981, 1,
1.136559, -0.400719, 2.415185, 1, 0, 0.7372549, 1,
1.136768, 2.002337, 0.4672222, 1, 0, 0.7333333, 1,
1.146033, -1.794653, 2.024165, 1, 0, 0.7254902, 1,
1.150712, 0.301889, 0.5373634, 1, 0, 0.7215686, 1,
1.165449, 0.2145471, 0.1788541, 1, 0, 0.7137255, 1,
1.165581, 0.1380097, 1.068699, 1, 0, 0.7098039, 1,
1.170275, 0.456241, 1.658832, 1, 0, 0.7019608, 1,
1.176436, -0.2039214, 1.818659, 1, 0, 0.6941177, 1,
1.177892, -0.6752876, 2.268661, 1, 0, 0.6901961, 1,
1.182888, -0.5217173, 3.232277, 1, 0, 0.682353, 1,
1.192639, 0.4307673, 1.8493, 1, 0, 0.6784314, 1,
1.206302, 0.9727306, 0.9035217, 1, 0, 0.6705883, 1,
1.207781, -0.3985069, 1.693592, 1, 0, 0.6666667, 1,
1.211106, -1.143998, 4.806254, 1, 0, 0.6588235, 1,
1.213186, -1.007616, 4.375525, 1, 0, 0.654902, 1,
1.216211, -0.01076251, 0.6780517, 1, 0, 0.6470588, 1,
1.218491, -0.3929049, 3.110288, 1, 0, 0.6431373, 1,
1.221392, -0.9020251, 0.5878347, 1, 0, 0.6352941, 1,
1.222125, 0.4478205, 0.6903058, 1, 0, 0.6313726, 1,
1.224834, -1.01923, 3.384323, 1, 0, 0.6235294, 1,
1.226425, 1.666809, 1.398335, 1, 0, 0.6196079, 1,
1.228273, -0.7945218, 1.044129, 1, 0, 0.6117647, 1,
1.234986, -2.14908, 0.9168622, 1, 0, 0.6078432, 1,
1.235279, -1.142403, 0.9330443, 1, 0, 0.6, 1,
1.243363, 0.2029994, 0.2310453, 1, 0, 0.5921569, 1,
1.244086, 0.7461561, -0.3355559, 1, 0, 0.5882353, 1,
1.245822, 0.7202158, 0.6706915, 1, 0, 0.5803922, 1,
1.25247, -0.2334448, 1.629122, 1, 0, 0.5764706, 1,
1.252815, -0.1903559, 1.733181, 1, 0, 0.5686275, 1,
1.273444, -1.179155, 2.244892, 1, 0, 0.5647059, 1,
1.287178, -1.744572, 2.715206, 1, 0, 0.5568628, 1,
1.294045, 0.707998, 1.402911, 1, 0, 0.5529412, 1,
1.295479, 1.111342, 0.9116706, 1, 0, 0.5450981, 1,
1.300089, -1.042323, 2.097337, 1, 0, 0.5411765, 1,
1.300228, -0.7322446, 3.267153, 1, 0, 0.5333334, 1,
1.310339, -1.651347, 1.944714, 1, 0, 0.5294118, 1,
1.314345, 0.9822825, 0.8257021, 1, 0, 0.5215687, 1,
1.315511, 1.878503, 0.9067277, 1, 0, 0.5176471, 1,
1.319186, -1.304718, 2.754472, 1, 0, 0.509804, 1,
1.322859, -0.5172421, 1.270766, 1, 0, 0.5058824, 1,
1.32992, 0.8109265, 1.741602, 1, 0, 0.4980392, 1,
1.337122, 0.295989, 0.2042727, 1, 0, 0.4901961, 1,
1.337476, 0.6063605, 0.5540495, 1, 0, 0.4862745, 1,
1.338407, -0.3811527, 1.104578, 1, 0, 0.4784314, 1,
1.363173, 1.118248, 0.3611468, 1, 0, 0.4745098, 1,
1.367432, -0.8623286, 3.141561, 1, 0, 0.4666667, 1,
1.37475, -1.517056, 2.862763, 1, 0, 0.4627451, 1,
1.378791, -1.243822, 2.86908, 1, 0, 0.454902, 1,
1.38701, 0.01814601, 1.218878, 1, 0, 0.4509804, 1,
1.41283, -1.345644, 1.96162, 1, 0, 0.4431373, 1,
1.413345, -1.071583, 2.457724, 1, 0, 0.4392157, 1,
1.426111, -3.068928, 2.629422, 1, 0, 0.4313726, 1,
1.43339, -1.21009, 2.799294, 1, 0, 0.427451, 1,
1.438347, -0.1146654, 1.029398, 1, 0, 0.4196078, 1,
1.442932, 0.4730443, 1.027167, 1, 0, 0.4156863, 1,
1.453456, 1.475, -1.8611, 1, 0, 0.4078431, 1,
1.464935, -1.503469, 2.345196, 1, 0, 0.4039216, 1,
1.469858, 0.1225867, 0.3983935, 1, 0, 0.3960784, 1,
1.470375, -0.02434766, 1.991133, 1, 0, 0.3882353, 1,
1.479875, 1.779253, -0.3857429, 1, 0, 0.3843137, 1,
1.487938, -1.623966, 0.7750133, 1, 0, 0.3764706, 1,
1.495943, -0.20181, 2.301716, 1, 0, 0.372549, 1,
1.502138, 0.6808954, 0.2522471, 1, 0, 0.3647059, 1,
1.50773, -0.08255319, 0.9008111, 1, 0, 0.3607843, 1,
1.513443, -0.5677063, 2.004794, 1, 0, 0.3529412, 1,
1.521559, -0.4877223, 2.707558, 1, 0, 0.3490196, 1,
1.527976, 1.791197, -0.7348863, 1, 0, 0.3411765, 1,
1.537584, 0.6912145, 3.025094, 1, 0, 0.3372549, 1,
1.54253, 0.4452874, 0.3325239, 1, 0, 0.3294118, 1,
1.548644, 0.4106267, 1.989427, 1, 0, 0.3254902, 1,
1.582233, 1.482323, -0.0310785, 1, 0, 0.3176471, 1,
1.601679, 0.3910075, 0.9139293, 1, 0, 0.3137255, 1,
1.625041, 0.4846658, 2.589074, 1, 0, 0.3058824, 1,
1.668736, 0.3743689, 0.7830011, 1, 0, 0.2980392, 1,
1.677637, 0.0643919, -0.8584685, 1, 0, 0.2941177, 1,
1.699196, 0.8656463, -1.060442, 1, 0, 0.2862745, 1,
1.704939, 1.683567, 0.6849923, 1, 0, 0.282353, 1,
1.706531, 1.351315, 1.371992, 1, 0, 0.2745098, 1,
1.741504, 0.3109264, 2.040487, 1, 0, 0.2705882, 1,
1.759842, -0.4185103, 0.847715, 1, 0, 0.2627451, 1,
1.782931, 1.943786, 0.541749, 1, 0, 0.2588235, 1,
1.794185, -0.7812451, 2.642485, 1, 0, 0.2509804, 1,
1.797633, 0.1313909, 1.301496, 1, 0, 0.2470588, 1,
1.800754, -1.863768, 3.144446, 1, 0, 0.2392157, 1,
1.814962, 1.156929, 0.7939582, 1, 0, 0.2352941, 1,
1.837309, -1.353251, 3.862071, 1, 0, 0.227451, 1,
1.897173, -1.289935, 1.607201, 1, 0, 0.2235294, 1,
1.915064, -1.195714, 2.892848, 1, 0, 0.2156863, 1,
1.921365, -0.4465429, 2.711313, 1, 0, 0.2117647, 1,
1.924594, -2.346392, 1.281716, 1, 0, 0.2039216, 1,
1.932734, 0.9838949, 0.2671478, 1, 0, 0.1960784, 1,
1.934449, -0.5066909, 3.209877, 1, 0, 0.1921569, 1,
1.953306, 1.425508, -1.169377, 1, 0, 0.1843137, 1,
1.961199, -0.6716857, 2.330901, 1, 0, 0.1803922, 1,
1.970999, 0.3305355, 2.402555, 1, 0, 0.172549, 1,
1.987479, 0.5699128, 2.626301, 1, 0, 0.1686275, 1,
1.999397, -1.619619, 1.208658, 1, 0, 0.1607843, 1,
2.00321, 1.239849, -0.1478911, 1, 0, 0.1568628, 1,
2.022452, -0.6955177, 1.475473, 1, 0, 0.1490196, 1,
2.035429, 0.6317276, 1.726832, 1, 0, 0.145098, 1,
2.049888, 0.9556861, 0.7047225, 1, 0, 0.1372549, 1,
2.060071, 1.170512, 3.144729, 1, 0, 0.1333333, 1,
2.068451, 2.217971, 1.246647, 1, 0, 0.1254902, 1,
2.122684, -0.5500008, 1.517441, 1, 0, 0.1215686, 1,
2.126296, -0.536228, 1.873069, 1, 0, 0.1137255, 1,
2.198244, -0.3904181, 2.632105, 1, 0, 0.1098039, 1,
2.199764, -0.01436483, 1.99654, 1, 0, 0.1019608, 1,
2.221094, -1.217778, 3.122139, 1, 0, 0.09411765, 1,
2.224083, 0.0476111, 0.9125884, 1, 0, 0.09019608, 1,
2.264835, 1.394595, -1.185432, 1, 0, 0.08235294, 1,
2.26595, -1.694533, 2.440817, 1, 0, 0.07843138, 1,
2.309596, 0.3961574, 0.2138347, 1, 0, 0.07058824, 1,
2.336319, -0.6728602, 1.595736, 1, 0, 0.06666667, 1,
2.362772, -0.4865519, 2.112279, 1, 0, 0.05882353, 1,
2.374178, 0.4787151, 1.081013, 1, 0, 0.05490196, 1,
2.387177, -1.201234, 2.839613, 1, 0, 0.04705882, 1,
2.433023, -0.4808885, 1.926639, 1, 0, 0.04313726, 1,
2.482253, 1.434026, 0.2852328, 1, 0, 0.03529412, 1,
2.552967, -0.2136916, 1.494932, 1, 0, 0.03137255, 1,
2.641919, -0.4141454, 2.626191, 1, 0, 0.02352941, 1,
2.691991, -1.868881, 1.20902, 1, 0, 0.01960784, 1,
2.934894, -1.183968, 3.153014, 1, 0, 0.01176471, 1,
2.953216, 2.644468, -0.3486382, 1, 0, 0.007843138, 1
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
-0.06106877, -4.050827, -7.036758, 0, -0.5, 0.5, 0.5,
-0.06106877, -4.050827, -7.036758, 1, -0.5, 0.5, 0.5,
-0.06106877, -4.050827, -7.036758, 1, 1.5, 0.5, 0.5,
-0.06106877, -4.050827, -7.036758, 0, 1.5, 0.5, 0.5
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
-4.097196, -0.172472, -7.036758, 0, -0.5, 0.5, 0.5,
-4.097196, -0.172472, -7.036758, 1, -0.5, 0.5, 0.5,
-4.097196, -0.172472, -7.036758, 1, 1.5, 0.5, 0.5,
-4.097196, -0.172472, -7.036758, 0, 1.5, 0.5, 0.5
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
-4.097196, -4.050827, 0.2547596, 0, -0.5, 0.5, 0.5,
-4.097196, -4.050827, 0.2547596, 1, -0.5, 0.5, 0.5,
-4.097196, -4.050827, 0.2547596, 1, 1.5, 0.5, 0.5,
-4.097196, -4.050827, 0.2547596, 0, 1.5, 0.5, 0.5
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
-3, -3.155822, -5.3541,
2, -3.155822, -5.3541,
-3, -3.155822, -5.3541,
-3, -3.304989, -5.634543,
-2, -3.155822, -5.3541,
-2, -3.304989, -5.634543,
-1, -3.155822, -5.3541,
-1, -3.304989, -5.634543,
0, -3.155822, -5.3541,
0, -3.304989, -5.634543,
1, -3.155822, -5.3541,
1, -3.304989, -5.634543,
2, -3.155822, -5.3541,
2, -3.304989, -5.634543
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
-3, -3.603324, -6.195429, 0, -0.5, 0.5, 0.5,
-3, -3.603324, -6.195429, 1, -0.5, 0.5, 0.5,
-3, -3.603324, -6.195429, 1, 1.5, 0.5, 0.5,
-3, -3.603324, -6.195429, 0, 1.5, 0.5, 0.5,
-2, -3.603324, -6.195429, 0, -0.5, 0.5, 0.5,
-2, -3.603324, -6.195429, 1, -0.5, 0.5, 0.5,
-2, -3.603324, -6.195429, 1, 1.5, 0.5, 0.5,
-2, -3.603324, -6.195429, 0, 1.5, 0.5, 0.5,
-1, -3.603324, -6.195429, 0, -0.5, 0.5, 0.5,
-1, -3.603324, -6.195429, 1, -0.5, 0.5, 0.5,
-1, -3.603324, -6.195429, 1, 1.5, 0.5, 0.5,
-1, -3.603324, -6.195429, 0, 1.5, 0.5, 0.5,
0, -3.603324, -6.195429, 0, -0.5, 0.5, 0.5,
0, -3.603324, -6.195429, 1, -0.5, 0.5, 0.5,
0, -3.603324, -6.195429, 1, 1.5, 0.5, 0.5,
0, -3.603324, -6.195429, 0, 1.5, 0.5, 0.5,
1, -3.603324, -6.195429, 0, -0.5, 0.5, 0.5,
1, -3.603324, -6.195429, 1, -0.5, 0.5, 0.5,
1, -3.603324, -6.195429, 1, 1.5, 0.5, 0.5,
1, -3.603324, -6.195429, 0, 1.5, 0.5, 0.5,
2, -3.603324, -6.195429, 0, -0.5, 0.5, 0.5,
2, -3.603324, -6.195429, 1, -0.5, 0.5, 0.5,
2, -3.603324, -6.195429, 1, 1.5, 0.5, 0.5,
2, -3.603324, -6.195429, 0, 1.5, 0.5, 0.5
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
-3.165782, -3, -5.3541,
-3.165782, 2, -5.3541,
-3.165782, -3, -5.3541,
-3.321018, -3, -5.634543,
-3.165782, -2, -5.3541,
-3.321018, -2, -5.634543,
-3.165782, -1, -5.3541,
-3.321018, -1, -5.634543,
-3.165782, 0, -5.3541,
-3.321018, 0, -5.634543,
-3.165782, 1, -5.3541,
-3.321018, 1, -5.634543,
-3.165782, 2, -5.3541,
-3.321018, 2, -5.634543
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
-3.631489, -3, -6.195429, 0, -0.5, 0.5, 0.5,
-3.631489, -3, -6.195429, 1, -0.5, 0.5, 0.5,
-3.631489, -3, -6.195429, 1, 1.5, 0.5, 0.5,
-3.631489, -3, -6.195429, 0, 1.5, 0.5, 0.5,
-3.631489, -2, -6.195429, 0, -0.5, 0.5, 0.5,
-3.631489, -2, -6.195429, 1, -0.5, 0.5, 0.5,
-3.631489, -2, -6.195429, 1, 1.5, 0.5, 0.5,
-3.631489, -2, -6.195429, 0, 1.5, 0.5, 0.5,
-3.631489, -1, -6.195429, 0, -0.5, 0.5, 0.5,
-3.631489, -1, -6.195429, 1, -0.5, 0.5, 0.5,
-3.631489, -1, -6.195429, 1, 1.5, 0.5, 0.5,
-3.631489, -1, -6.195429, 0, 1.5, 0.5, 0.5,
-3.631489, 0, -6.195429, 0, -0.5, 0.5, 0.5,
-3.631489, 0, -6.195429, 1, -0.5, 0.5, 0.5,
-3.631489, 0, -6.195429, 1, 1.5, 0.5, 0.5,
-3.631489, 0, -6.195429, 0, 1.5, 0.5, 0.5,
-3.631489, 1, -6.195429, 0, -0.5, 0.5, 0.5,
-3.631489, 1, -6.195429, 1, -0.5, 0.5, 0.5,
-3.631489, 1, -6.195429, 1, 1.5, 0.5, 0.5,
-3.631489, 1, -6.195429, 0, 1.5, 0.5, 0.5,
-3.631489, 2, -6.195429, 0, -0.5, 0.5, 0.5,
-3.631489, 2, -6.195429, 1, -0.5, 0.5, 0.5,
-3.631489, 2, -6.195429, 1, 1.5, 0.5, 0.5,
-3.631489, 2, -6.195429, 0, 1.5, 0.5, 0.5
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
-3.165782, -3.155822, -4,
-3.165782, -3.155822, 4,
-3.165782, -3.155822, -4,
-3.321018, -3.304989, -4,
-3.165782, -3.155822, -2,
-3.321018, -3.304989, -2,
-3.165782, -3.155822, 0,
-3.321018, -3.304989, 0,
-3.165782, -3.155822, 2,
-3.321018, -3.304989, 2,
-3.165782, -3.155822, 4,
-3.321018, -3.304989, 4
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
-3.631489, -3.603324, -4, 0, -0.5, 0.5, 0.5,
-3.631489, -3.603324, -4, 1, -0.5, 0.5, 0.5,
-3.631489, -3.603324, -4, 1, 1.5, 0.5, 0.5,
-3.631489, -3.603324, -4, 0, 1.5, 0.5, 0.5,
-3.631489, -3.603324, -2, 0, -0.5, 0.5, 0.5,
-3.631489, -3.603324, -2, 1, -0.5, 0.5, 0.5,
-3.631489, -3.603324, -2, 1, 1.5, 0.5, 0.5,
-3.631489, -3.603324, -2, 0, 1.5, 0.5, 0.5,
-3.631489, -3.603324, 0, 0, -0.5, 0.5, 0.5,
-3.631489, -3.603324, 0, 1, -0.5, 0.5, 0.5,
-3.631489, -3.603324, 0, 1, 1.5, 0.5, 0.5,
-3.631489, -3.603324, 0, 0, 1.5, 0.5, 0.5,
-3.631489, -3.603324, 2, 0, -0.5, 0.5, 0.5,
-3.631489, -3.603324, 2, 1, -0.5, 0.5, 0.5,
-3.631489, -3.603324, 2, 1, 1.5, 0.5, 0.5,
-3.631489, -3.603324, 2, 0, 1.5, 0.5, 0.5,
-3.631489, -3.603324, 4, 0, -0.5, 0.5, 0.5,
-3.631489, -3.603324, 4, 1, -0.5, 0.5, 0.5,
-3.631489, -3.603324, 4, 1, 1.5, 0.5, 0.5,
-3.631489, -3.603324, 4, 0, 1.5, 0.5, 0.5
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
-3.165782, -3.155822, -5.3541,
-3.165782, 2.810878, -5.3541,
-3.165782, -3.155822, 5.863619,
-3.165782, 2.810878, 5.863619,
-3.165782, -3.155822, -5.3541,
-3.165782, -3.155822, 5.863619,
-3.165782, 2.810878, -5.3541,
-3.165782, 2.810878, 5.863619,
-3.165782, -3.155822, -5.3541,
3.043644, -3.155822, -5.3541,
-3.165782, -3.155822, 5.863619,
3.043644, -3.155822, 5.863619,
-3.165782, 2.810878, -5.3541,
3.043644, 2.810878, -5.3541,
-3.165782, 2.810878, 5.863619,
3.043644, 2.810878, 5.863619,
3.043644, -3.155822, -5.3541,
3.043644, 2.810878, -5.3541,
3.043644, -3.155822, 5.863619,
3.043644, 2.810878, 5.863619,
3.043644, -3.155822, -5.3541,
3.043644, -3.155822, 5.863619,
3.043644, 2.810878, -5.3541,
3.043644, 2.810878, 5.863619
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
var radius = 7.551545;
var distance = 33.59768;
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
mvMatrix.translate( 0.06106877, 0.172472, -0.2547596 );
mvMatrix.scale( 1.314917, 1.368408, 0.7278554 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.59768);
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
sulfamyl_chloride<-read.table("sulfamyl_chloride.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulfamyl_chloride$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulfamyl_chloride' not found
```

```r
y<-sulfamyl_chloride$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulfamyl_chloride' not found
```

```r
z<-sulfamyl_chloride$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulfamyl_chloride' not found
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
-3.075353, 0.8181835, -0.3512931, 0, 0, 1, 1, 1,
-3.020201, 1.525912, -0.4571187, 1, 0, 0, 1, 1,
-2.839658, -0.4013545, 0.007374605, 1, 0, 0, 1, 1,
-2.708475, 0.9068198, 0.420914, 1, 0, 0, 1, 1,
-2.629543, -0.7918682, -1.513928, 1, 0, 0, 1, 1,
-2.607033, 0.01766066, -2.519258, 1, 0, 0, 1, 1,
-2.579948, -0.790096, -3.066325, 0, 0, 0, 1, 1,
-2.497036, -1.844102, 0.9924703, 0, 0, 0, 1, 1,
-2.425296, 2.159501, -2.417728, 0, 0, 0, 1, 1,
-2.408851, 1.16631, -1.166652, 0, 0, 0, 1, 1,
-2.4074, 0.3981448, -1.485667, 0, 0, 0, 1, 1,
-2.404379, -1.336211, -1.233543, 0, 0, 0, 1, 1,
-2.380371, 0.9211665, -1.34305, 0, 0, 0, 1, 1,
-2.317459, -0.8566481, -2.85852, 1, 1, 1, 1, 1,
-2.306428, -0.5769231, -1.721183, 1, 1, 1, 1, 1,
-2.241506, 1.913787, 0.100882, 1, 1, 1, 1, 1,
-2.223431, 0.534026, -0.6204816, 1, 1, 1, 1, 1,
-2.204825, -0.01980716, -2.05201, 1, 1, 1, 1, 1,
-2.182159, 1.042304, -0.491743, 1, 1, 1, 1, 1,
-2.175745, 0.05397482, -1.351342, 1, 1, 1, 1, 1,
-2.161012, -0.1796477, -0.9475996, 1, 1, 1, 1, 1,
-2.080609, -0.2040448, -2.740208, 1, 1, 1, 1, 1,
-2.078992, 0.6504526, -1.23267, 1, 1, 1, 1, 1,
-1.961074, 0.0264621, -2.179346, 1, 1, 1, 1, 1,
-1.958645, -0.5119708, -3.135616, 1, 1, 1, 1, 1,
-1.912128, -0.760843, -3.903928, 1, 1, 1, 1, 1,
-1.884526, -0.703765, -2.304634, 1, 1, 1, 1, 1,
-1.862929, -1.422727, -2.634877, 1, 1, 1, 1, 1,
-1.860217, 1.83123, -2.207961, 0, 0, 1, 1, 1,
-1.852843, -0.7791742, 0.04432683, 1, 0, 0, 1, 1,
-1.834485, 1.204354, 0.4842446, 1, 0, 0, 1, 1,
-1.814384, -0.7794745, -0.4929524, 1, 0, 0, 1, 1,
-1.789446, 0.09345078, -0.7750502, 1, 0, 0, 1, 1,
-1.780261, 1.099753, -1.529661, 1, 0, 0, 1, 1,
-1.765086, -1.53113, -2.225849, 0, 0, 0, 1, 1,
-1.760922, -0.1095108, 0.7013223, 0, 0, 0, 1, 1,
-1.755718, -0.5974084, -2.768728, 0, 0, 0, 1, 1,
-1.731476, -0.1556102, -2.89446, 0, 0, 0, 1, 1,
-1.718757, -0.2519516, -2.479084, 0, 0, 0, 1, 1,
-1.711798, 0.5337738, 0.09416825, 0, 0, 0, 1, 1,
-1.708239, 0.04554105, -3.282113, 0, 0, 0, 1, 1,
-1.700953, 1.95115, -1.95876, 1, 1, 1, 1, 1,
-1.664777, -0.001934285, -0.9246336, 1, 1, 1, 1, 1,
-1.660397, -1.558222, -1.892286, 1, 1, 1, 1, 1,
-1.643088, 0.4921276, -1.17447, 1, 1, 1, 1, 1,
-1.640233, 1.567199, -1.841556, 1, 1, 1, 1, 1,
-1.62148, -0.5565127, -1.472142, 1, 1, 1, 1, 1,
-1.616436, -0.02058436, -1.783209, 1, 1, 1, 1, 1,
-1.600352, -1.252989, -1.315275, 1, 1, 1, 1, 1,
-1.596936, -0.5245553, -2.183921, 1, 1, 1, 1, 1,
-1.590712, 1.09975, -1.33734, 1, 1, 1, 1, 1,
-1.590254, 0.1707303, -0.2858497, 1, 1, 1, 1, 1,
-1.559428, 1.227925, 0.1463834, 1, 1, 1, 1, 1,
-1.558533, 1.419515, -1.95861, 1, 1, 1, 1, 1,
-1.549365, 0.179845, -0.9160621, 1, 1, 1, 1, 1,
-1.546876, 1.19408, -0.4169829, 1, 1, 1, 1, 1,
-1.543064, 1.778074, -0.8759376, 0, 0, 1, 1, 1,
-1.51486, 0.6641091, -1.427729, 1, 0, 0, 1, 1,
-1.50261, -0.2493747, 0.822004, 1, 0, 0, 1, 1,
-1.502149, 0.3463823, -1.292052, 1, 0, 0, 1, 1,
-1.494878, -0.521278, -0.9977196, 1, 0, 0, 1, 1,
-1.488801, -1.025934, -1.683942, 1, 0, 0, 1, 1,
-1.440294, -0.5991921, -1.047533, 0, 0, 0, 1, 1,
-1.427652, -0.09192179, -1.382495, 0, 0, 0, 1, 1,
-1.416921, 0.815959, -2.289219, 0, 0, 0, 1, 1,
-1.407596, -0.7987893, -1.93919, 0, 0, 0, 1, 1,
-1.405466, -0.5206468, -1.935969, 0, 0, 0, 1, 1,
-1.397666, 0.5223259, -0.6567741, 0, 0, 0, 1, 1,
-1.381521, -0.5194787, -2.091017, 0, 0, 0, 1, 1,
-1.381043, 0.6146604, -1.930912, 1, 1, 1, 1, 1,
-1.377759, 0.8613446, -3.047465, 1, 1, 1, 1, 1,
-1.377118, 0.3637534, -1.682398, 1, 1, 1, 1, 1,
-1.363578, 1.409973, -0.5034252, 1, 1, 1, 1, 1,
-1.351797, 0.9492424, -1.930897, 1, 1, 1, 1, 1,
-1.350837, -0.1252762, -1.193729, 1, 1, 1, 1, 1,
-1.348174, 1.80657, -1.062051, 1, 1, 1, 1, 1,
-1.346738, -0.285348, -1.066874, 1, 1, 1, 1, 1,
-1.324875, -0.6643268, -2.166669, 1, 1, 1, 1, 1,
-1.317301, 1.653887, 1.194002, 1, 1, 1, 1, 1,
-1.316183, -0.6171723, -2.726618, 1, 1, 1, 1, 1,
-1.311858, -1.59043, -2.000628, 1, 1, 1, 1, 1,
-1.307005, -1.33846, -3.093122, 1, 1, 1, 1, 1,
-1.302802, 0.534862, -1.702091, 1, 1, 1, 1, 1,
-1.27605, 0.1653554, -2.497917, 1, 1, 1, 1, 1,
-1.266684, -1.798644, -1.210134, 0, 0, 1, 1, 1,
-1.265488, -0.5662265, -0.4254713, 1, 0, 0, 1, 1,
-1.264687, 0.2963411, -1.912007, 1, 0, 0, 1, 1,
-1.262694, 0.1041797, -0.4544617, 1, 0, 0, 1, 1,
-1.251164, 1.715477, 1.175788, 1, 0, 0, 1, 1,
-1.249439, 1.119668, -2.757305, 1, 0, 0, 1, 1,
-1.247947, -0.1283047, -1.381252, 0, 0, 0, 1, 1,
-1.247451, -1.55559, -2.268601, 0, 0, 0, 1, 1,
-1.243951, 0.8259974, -1.411854, 0, 0, 0, 1, 1,
-1.239053, -0.6446304, -2.923984, 0, 0, 0, 1, 1,
-1.237779, -0.7360897, -2.281777, 0, 0, 0, 1, 1,
-1.237075, -0.5458338, -1.934309, 0, 0, 0, 1, 1,
-1.224961, 1.859152, -0.4402464, 0, 0, 0, 1, 1,
-1.219359, -0.08116382, -0.7445861, 1, 1, 1, 1, 1,
-1.216303, 0.4295305, -1.322484, 1, 1, 1, 1, 1,
-1.212958, -0.9307356, -2.469863, 1, 1, 1, 1, 1,
-1.202542, 0.8097641, 0.5314257, 1, 1, 1, 1, 1,
-1.201827, -1.093132, -2.888969, 1, 1, 1, 1, 1,
-1.200036, -0.4218349, -1.629663, 1, 1, 1, 1, 1,
-1.199209, 1.646345, -0.05095999, 1, 1, 1, 1, 1,
-1.19838, -0.7552317, -0.5513783, 1, 1, 1, 1, 1,
-1.188368, -0.5521477, 0.0785552, 1, 1, 1, 1, 1,
-1.181093, 0.8228711, -1.099828, 1, 1, 1, 1, 1,
-1.174189, -0.5645367, -2.169437, 1, 1, 1, 1, 1,
-1.173022, -0.6902925, -0.9903189, 1, 1, 1, 1, 1,
-1.170886, 0.0574077, -2.089209, 1, 1, 1, 1, 1,
-1.168402, -0.7536887, -1.893715, 1, 1, 1, 1, 1,
-1.16627, -0.006964592, -2.826767, 1, 1, 1, 1, 1,
-1.165245, 0.1344614, -1.130884, 0, 0, 1, 1, 1,
-1.159451, -0.8390355, -3.299903, 1, 0, 0, 1, 1,
-1.157046, 0.9872112, -0.6968254, 1, 0, 0, 1, 1,
-1.152037, 1.826637, -0.6162279, 1, 0, 0, 1, 1,
-1.15146, -0.5668181, -0.9278306, 1, 0, 0, 1, 1,
-1.143961, -1.61513, -2.135123, 1, 0, 0, 1, 1,
-1.138615, 0.7974119, -0.3476089, 0, 0, 0, 1, 1,
-1.124963, -0.4525803, -2.531526, 0, 0, 0, 1, 1,
-1.124356, 0.5466412, -1.085611, 0, 0, 0, 1, 1,
-1.115042, -0.4403334, -0.9809405, 0, 0, 0, 1, 1,
-1.110932, -1.929303, -1.647457, 0, 0, 0, 1, 1,
-1.109322, 0.02269484, -0.3143547, 0, 0, 0, 1, 1,
-1.108478, -0.1293358, -1.756462, 0, 0, 0, 1, 1,
-1.107661, 0.7407975, 0.500867, 1, 1, 1, 1, 1,
-1.101415, 0.4331555, -1.251557, 1, 1, 1, 1, 1,
-1.09426, -0.4097868, -0.9292558, 1, 1, 1, 1, 1,
-1.087543, 0.7963064, -0.9960828, 1, 1, 1, 1, 1,
-1.084185, -0.5461506, -1.018115, 1, 1, 1, 1, 1,
-1.079603, 1.149708, -0.4176191, 1, 1, 1, 1, 1,
-1.079408, 0.9119742, -1.561268, 1, 1, 1, 1, 1,
-1.077959, -0.5842606, -2.380141, 1, 1, 1, 1, 1,
-1.077215, -1.01698, -2.10774, 1, 1, 1, 1, 1,
-1.073629, -1.734066, -1.793826, 1, 1, 1, 1, 1,
-1.057179, -1.689922, -2.409837, 1, 1, 1, 1, 1,
-1.056637, 1.580179, -0.4364979, 1, 1, 1, 1, 1,
-1.050475, -1.408194, -2.483581, 1, 1, 1, 1, 1,
-1.047607, 0.6616859, -0.6058218, 1, 1, 1, 1, 1,
-1.04538, 1.057874, -0.2359668, 1, 1, 1, 1, 1,
-1.044778, 0.5855387, -1.108697, 0, 0, 1, 1, 1,
-1.044562, 0.2724754, -2.398959, 1, 0, 0, 1, 1,
-1.044172, 0.6492804, 0.4687109, 1, 0, 0, 1, 1,
-1.042764, -0.2211131, -2.127912, 1, 0, 0, 1, 1,
-1.033034, 1.592919, -1.008972, 1, 0, 0, 1, 1,
-1.026318, 0.713405, -0.4183161, 1, 0, 0, 1, 1,
-1.022716, 0.3641021, -0.7048705, 0, 0, 0, 1, 1,
-1.01956, 0.8013406, 0.3443447, 0, 0, 0, 1, 1,
-1.019417, -0.3901222, -3.114562, 0, 0, 0, 1, 1,
-1.012114, -1.132692, -1.170102, 0, 0, 0, 1, 1,
-1.007487, -0.8376505, -1.019469, 0, 0, 0, 1, 1,
-1.002617, 0.966992, -0.9195213, 0, 0, 0, 1, 1,
-0.9910098, -1.064686, -1.346291, 0, 0, 0, 1, 1,
-0.9854747, -0.2557766, -1.137017, 1, 1, 1, 1, 1,
-0.9837098, -0.4432589, -3.819471, 1, 1, 1, 1, 1,
-0.9819808, 0.3139746, -1.255022, 1, 1, 1, 1, 1,
-0.9811158, 0.604108, -0.8618062, 1, 1, 1, 1, 1,
-0.9762202, -0.1884711, -0.5779973, 1, 1, 1, 1, 1,
-0.9724746, 0.3793807, -1.081431, 1, 1, 1, 1, 1,
-0.969761, 0.1949124, -1.865733, 1, 1, 1, 1, 1,
-0.9666235, -0.3348704, -2.644655, 1, 1, 1, 1, 1,
-0.9632827, 0.4218143, -1.557391, 1, 1, 1, 1, 1,
-0.9574598, -0.9047852, -3.479049, 1, 1, 1, 1, 1,
-0.9550949, 0.1306514, -2.529994, 1, 1, 1, 1, 1,
-0.9550555, -0.4621504, -0.5935012, 1, 1, 1, 1, 1,
-0.9536262, -0.6307461, -0.6132325, 1, 1, 1, 1, 1,
-0.9511189, -0.8059038, -1.500957, 1, 1, 1, 1, 1,
-0.9418111, 0.6991183, 1.020552, 1, 1, 1, 1, 1,
-0.9380345, -1.335819, -2.43541, 0, 0, 1, 1, 1,
-0.9316759, 1.120419, -1.16826, 1, 0, 0, 1, 1,
-0.9315094, -0.7198192, -1.862439, 1, 0, 0, 1, 1,
-0.9306338, 1.155528, -0.4651083, 1, 0, 0, 1, 1,
-0.9287112, 0.5180755, -2.01007, 1, 0, 0, 1, 1,
-0.9254637, 1.206568, -2.206367, 1, 0, 0, 1, 1,
-0.9226503, 1.58957, 0.2813689, 0, 0, 0, 1, 1,
-0.9220161, 0.6501563, -0.3156078, 0, 0, 0, 1, 1,
-0.9154208, 0.2957418, -2.300136, 0, 0, 0, 1, 1,
-0.9148365, -0.3273515, -2.507663, 0, 0, 0, 1, 1,
-0.9092519, 0.4301338, -3.154696, 0, 0, 0, 1, 1,
-0.9083976, -0.3073089, -1.796767, 0, 0, 0, 1, 1,
-0.9068251, -1.670515, -2.266399, 0, 0, 0, 1, 1,
-0.9056808, -0.8859553, -3.86996, 1, 1, 1, 1, 1,
-0.900843, -0.3042703, -2.130702, 1, 1, 1, 1, 1,
-0.8998333, -0.4757544, -1.745364, 1, 1, 1, 1, 1,
-0.8988523, -2.329554, -3.148163, 1, 1, 1, 1, 1,
-0.8956534, -0.910409, -2.530422, 1, 1, 1, 1, 1,
-0.8931063, -0.2784518, -1.373192, 1, 1, 1, 1, 1,
-0.8904577, -0.6561652, -1.836045, 1, 1, 1, 1, 1,
-0.8881449, -2.175992, -3.355047, 1, 1, 1, 1, 1,
-0.8876027, -0.8384206, -0.9170735, 1, 1, 1, 1, 1,
-0.8827054, 0.5913231, -0.4026501, 1, 1, 1, 1, 1,
-0.8823917, -0.3089997, -2.322406, 1, 1, 1, 1, 1,
-0.8805539, 0.7504874, -1.189493, 1, 1, 1, 1, 1,
-0.8791165, -0.4254829, -1.840084, 1, 1, 1, 1, 1,
-0.8788036, 1.590199, 0.2380738, 1, 1, 1, 1, 1,
-0.8759916, -0.3888218, -0.9770836, 1, 1, 1, 1, 1,
-0.8736802, -0.249173, -2.090768, 0, 0, 1, 1, 1,
-0.8725884, 0.03814007, -2.014066, 1, 0, 0, 1, 1,
-0.8696272, -1.200504, -1.457068, 1, 0, 0, 1, 1,
-0.8688192, -1.371541, -2.37223, 1, 0, 0, 1, 1,
-0.8686982, 0.1831177, -0.5211819, 1, 0, 0, 1, 1,
-0.8567703, 0.7890302, -2.078898, 1, 0, 0, 1, 1,
-0.8545482, 0.9984657, -0.9543608, 0, 0, 0, 1, 1,
-0.8516685, -0.03811926, -1.710544, 0, 0, 0, 1, 1,
-0.8484034, -1.805402, -2.423343, 0, 0, 0, 1, 1,
-0.8477457, 0.7034564, -1.626351, 0, 0, 0, 1, 1,
-0.8466008, 0.5378925, -0.09386128, 0, 0, 0, 1, 1,
-0.8445629, -0.1559605, -3.552963, 0, 0, 0, 1, 1,
-0.8443642, 0.3027045, 0.2786794, 0, 0, 0, 1, 1,
-0.8438997, -0.4635783, -2.26231, 1, 1, 1, 1, 1,
-0.8366846, -1.187692, -3.223578, 1, 1, 1, 1, 1,
-0.8366469, -1.788001, -2.896233, 1, 1, 1, 1, 1,
-0.8249646, 0.3704696, -1.570815, 1, 1, 1, 1, 1,
-0.8244816, 0.3803301, -1.093052, 1, 1, 1, 1, 1,
-0.8238261, 0.1003547, -1.682128, 1, 1, 1, 1, 1,
-0.8174195, -0.0542832, -1.61827, 1, 1, 1, 1, 1,
-0.8172103, -0.01734895, -1.906317, 1, 1, 1, 1, 1,
-0.8144007, 0.2903278, -0.5186123, 1, 1, 1, 1, 1,
-0.8102873, -1.033519, -3.241324, 1, 1, 1, 1, 1,
-0.805669, 1.806716, 0.8290582, 1, 1, 1, 1, 1,
-0.8025909, -0.3561358, -2.144399, 1, 1, 1, 1, 1,
-0.8013821, 1.414816, -2.433488, 1, 1, 1, 1, 1,
-0.7983211, 0.2970376, -0.004355325, 1, 1, 1, 1, 1,
-0.7969992, -1.463544, -2.222617, 1, 1, 1, 1, 1,
-0.793976, -0.9032525, -0.9032474, 0, 0, 1, 1, 1,
-0.792693, -0.1447541, -0.1593148, 1, 0, 0, 1, 1,
-0.7865226, -1.411893, -3.914997, 1, 0, 0, 1, 1,
-0.7843931, -0.3932064, -1.192248, 1, 0, 0, 1, 1,
-0.779965, -2.102365, -2.630002, 1, 0, 0, 1, 1,
-0.7794392, -0.2727373, -1.724796, 1, 0, 0, 1, 1,
-0.7785228, -1.468049, -3.063995, 0, 0, 0, 1, 1,
-0.7772138, -0.1205924, -1.333519, 0, 0, 0, 1, 1,
-0.7764924, 0.9837465, -0.9291806, 0, 0, 0, 1, 1,
-0.7764386, -1.155746, -3.205483, 0, 0, 0, 1, 1,
-0.773564, 0.6624203, 0.4657318, 0, 0, 0, 1, 1,
-0.7712615, -0.0550128, -1.88757, 0, 0, 0, 1, 1,
-0.7701241, 0.1977378, -0.609104, 0, 0, 0, 1, 1,
-0.7659272, 0.1968913, -1.147124, 1, 1, 1, 1, 1,
-0.7630913, -0.157809, -2.984011, 1, 1, 1, 1, 1,
-0.7619449, -1.630129, -0.984158, 1, 1, 1, 1, 1,
-0.758821, 0.3576976, -1.612902, 1, 1, 1, 1, 1,
-0.7587066, 1.466202, 0.5104998, 1, 1, 1, 1, 1,
-0.7584719, 0.0006244989, 0.2707343, 1, 1, 1, 1, 1,
-0.7567199, -0.4385312, -2.444959, 1, 1, 1, 1, 1,
-0.7509319, -1.673911, -4.702099, 1, 1, 1, 1, 1,
-0.7503322, 2.470835, -1.665791, 1, 1, 1, 1, 1,
-0.7351425, 0.09935317, -1.016668, 1, 1, 1, 1, 1,
-0.7341693, -1.619863, -2.575851, 1, 1, 1, 1, 1,
-0.7336358, 0.4532448, 0.03976742, 1, 1, 1, 1, 1,
-0.7281675, 0.8566311, -0.8102182, 1, 1, 1, 1, 1,
-0.7276917, 0.03527464, -0.2869901, 1, 1, 1, 1, 1,
-0.7208361, 0.5880619, 0.101088, 1, 1, 1, 1, 1,
-0.7136759, -0.8950801, -2.947847, 0, 0, 1, 1, 1,
-0.7123178, -0.4827379, -1.943798, 1, 0, 0, 1, 1,
-0.711127, 0.1301277, -1.650079, 1, 0, 0, 1, 1,
-0.7078801, 0.1058875, -2.169458, 1, 0, 0, 1, 1,
-0.7023922, 0.02584353, -0.4373015, 1, 0, 0, 1, 1,
-0.7019644, 0.4567145, -1.142793, 1, 0, 0, 1, 1,
-0.6952986, 0.1342269, -0.6771265, 0, 0, 0, 1, 1,
-0.6944478, 1.228957, -1.100364, 0, 0, 0, 1, 1,
-0.6873641, 0.3940391, -1.664866, 0, 0, 0, 1, 1,
-0.6852752, -0.3026862, -1.667903, 0, 0, 0, 1, 1,
-0.6816875, 0.2219387, -0.9641924, 0, 0, 0, 1, 1,
-0.6816846, -1.170069, -3.395044, 0, 0, 0, 1, 1,
-0.6759515, -1.247793, -2.389586, 0, 0, 0, 1, 1,
-0.661161, -1.060544, -3.14879, 1, 1, 1, 1, 1,
-0.6582135, 0.7712478, -1.406319, 1, 1, 1, 1, 1,
-0.6522961, -0.1286622, -3.097136, 1, 1, 1, 1, 1,
-0.6512569, -0.8158882, -3.192141, 1, 1, 1, 1, 1,
-0.6482075, -0.4356837, -2.180413, 1, 1, 1, 1, 1,
-0.6431837, -0.3747589, -2.619159, 1, 1, 1, 1, 1,
-0.64248, 0.2443187, -1.929677, 1, 1, 1, 1, 1,
-0.6423159, -1.501756, -3.589774, 1, 1, 1, 1, 1,
-0.6408066, -0.4141802, -3.624198, 1, 1, 1, 1, 1,
-0.6395122, -0.2093046, -5.190735, 1, 1, 1, 1, 1,
-0.6378046, 0.6805815, -0.8472803, 1, 1, 1, 1, 1,
-0.6305485, 0.5754431, -0.6875851, 1, 1, 1, 1, 1,
-0.6300206, -0.309147, -1.87687, 1, 1, 1, 1, 1,
-0.6274081, -2.123079, -3.397541, 1, 1, 1, 1, 1,
-0.6199769, -0.8037989, -1.300977, 1, 1, 1, 1, 1,
-0.6161824, 0.823238, 0.5768946, 0, 0, 1, 1, 1,
-0.6144116, 1.537243, 0.1250227, 1, 0, 0, 1, 1,
-0.6083748, -0.766895, -3.062929, 1, 0, 0, 1, 1,
-0.6066058, 0.6974953, 0.7298586, 1, 0, 0, 1, 1,
-0.6044694, 0.1005071, -0.7709445, 1, 0, 0, 1, 1,
-0.6035128, -0.1369019, -0.4412715, 1, 0, 0, 1, 1,
-0.5955042, 0.2678443, -3.539769, 0, 0, 0, 1, 1,
-0.595028, 1.092079, -1.658904, 0, 0, 0, 1, 1,
-0.5945726, 0.9272071, -0.6664425, 0, 0, 0, 1, 1,
-0.5917956, -1.726814, -2.769255, 0, 0, 0, 1, 1,
-0.5888366, -0.6684343, -2.285402, 0, 0, 0, 1, 1,
-0.5859612, 0.3492529, -1.437131, 0, 0, 0, 1, 1,
-0.5834469, -0.0796479, -0.9033948, 0, 0, 0, 1, 1,
-0.5709757, 0.303104, -1.735262, 1, 1, 1, 1, 1,
-0.5652709, -0.1261559, -1.936114, 1, 1, 1, 1, 1,
-0.5646262, 0.464244, 0.5467373, 1, 1, 1, 1, 1,
-0.5606574, -1.088304, -3.522973, 1, 1, 1, 1, 1,
-0.5564836, -0.2823133, -1.903034, 1, 1, 1, 1, 1,
-0.5562167, 0.4931857, -0.2064752, 1, 1, 1, 1, 1,
-0.5512489, -0.8448582, -2.124521, 1, 1, 1, 1, 1,
-0.5360751, -0.3344454, -2.339356, 1, 1, 1, 1, 1,
-0.5343242, -0.2919219, -1.819819, 1, 1, 1, 1, 1,
-0.5322841, 1.713753, -0.8039864, 1, 1, 1, 1, 1,
-0.5289922, -0.1594355, -2.22033, 1, 1, 1, 1, 1,
-0.528154, 0.3513541, -1.267439, 1, 1, 1, 1, 1,
-0.5269783, 1.307209, 0.4161687, 1, 1, 1, 1, 1,
-0.5243375, 0.1001306, -2.852015, 1, 1, 1, 1, 1,
-0.5242332, 0.6675659, -0.3477974, 1, 1, 1, 1, 1,
-0.5210841, 0.9058713, -0.9396123, 0, 0, 1, 1, 1,
-0.521029, 0.7113053, -0.3318108, 1, 0, 0, 1, 1,
-0.5192105, -0.5411241, -2.644633, 1, 0, 0, 1, 1,
-0.5170808, -0.08587399, -0.7231659, 1, 0, 0, 1, 1,
-0.5101804, 0.1125516, 0.5426689, 1, 0, 0, 1, 1,
-0.5045998, -0.5669862, -3.392193, 1, 0, 0, 1, 1,
-0.500818, 0.8428223, -1.642446, 0, 0, 0, 1, 1,
-0.4969831, -0.3074106, -0.5260872, 0, 0, 0, 1, 1,
-0.4967842, -0.6418551, -2.878878, 0, 0, 0, 1, 1,
-0.4946453, 1.680653, 1.065116, 0, 0, 0, 1, 1,
-0.4928698, 0.4699955, -0.3042635, 0, 0, 0, 1, 1,
-0.4912962, -1.210058, -1.704616, 0, 0, 0, 1, 1,
-0.4885544, -1.025275, -4.008892, 0, 0, 0, 1, 1,
-0.4869275, 1.076429, -0.2462709, 1, 1, 1, 1, 1,
-0.4851237, -0.1612029, -2.045039, 1, 1, 1, 1, 1,
-0.4846692, -0.4069575, -3.687717, 1, 1, 1, 1, 1,
-0.4797474, -0.3645039, -3.365503, 1, 1, 1, 1, 1,
-0.4772642, -0.6185609, -3.066702, 1, 1, 1, 1, 1,
-0.4762807, -2.142058, -4.844091, 1, 1, 1, 1, 1,
-0.476027, 0.5383077, -1.161107, 1, 1, 1, 1, 1,
-0.4752578, -1.773232, -2.116431, 1, 1, 1, 1, 1,
-0.4741693, -0.1035243, -1.073263, 1, 1, 1, 1, 1,
-0.470349, 0.9238361, 1.534292, 1, 1, 1, 1, 1,
-0.4686084, -0.09088454, -1.532535, 1, 1, 1, 1, 1,
-0.4672513, 0.2593718, -0.6051826, 1, 1, 1, 1, 1,
-0.464981, 0.1559868, -1.525199, 1, 1, 1, 1, 1,
-0.4603809, 2.112969, -0.7299682, 1, 1, 1, 1, 1,
-0.457909, 0.3501404, -1.358654, 1, 1, 1, 1, 1,
-0.4577455, -1.278911, -2.281939, 0, 0, 1, 1, 1,
-0.4488203, -0.4810157, -3.303186, 1, 0, 0, 1, 1,
-0.4461204, -0.08125283, -1.110639, 1, 0, 0, 1, 1,
-0.4452133, 1.607516, -1.349843, 1, 0, 0, 1, 1,
-0.4433781, 1.521506, -1.15038, 1, 0, 0, 1, 1,
-0.4401234, 1.097963, 0.5207817, 1, 0, 0, 1, 1,
-0.4388636, 0.6605095, -0.07563593, 0, 0, 0, 1, 1,
-0.4384308, 0.03527264, -1.202304, 0, 0, 0, 1, 1,
-0.4383399, -0.7871268, -3.720822, 0, 0, 0, 1, 1,
-0.4378449, -0.4564395, -2.559662, 0, 0, 0, 1, 1,
-0.4371027, -1.538181, -3.294889, 0, 0, 0, 1, 1,
-0.4342085, -0.4871421, -3.823172, 0, 0, 0, 1, 1,
-0.4317064, -0.4020592, -2.829482, 0, 0, 0, 1, 1,
-0.4285265, 0.6876695, 0.4548994, 1, 1, 1, 1, 1,
-0.4262464, -0.08760015, -1.532712, 1, 1, 1, 1, 1,
-0.4223925, 0.5825733, -0.1301885, 1, 1, 1, 1, 1,
-0.4168523, -0.3835478, -0.8170303, 1, 1, 1, 1, 1,
-0.4137406, 0.5760686, 0.07419037, 1, 1, 1, 1, 1,
-0.4098864, -0.2678061, -3.666977, 1, 1, 1, 1, 1,
-0.408966, -1.059385, -2.88308, 1, 1, 1, 1, 1,
-0.4072946, -0.195593, -3.497635, 1, 1, 1, 1, 1,
-0.4064773, 1.56166, -0.04008758, 1, 1, 1, 1, 1,
-0.4056243, -1.736201, -2.519245, 1, 1, 1, 1, 1,
-0.4054461, 0.6404975, -0.6219131, 1, 1, 1, 1, 1,
-0.3993792, 0.01774428, -0.581844, 1, 1, 1, 1, 1,
-0.3962206, -0.6772707, -2.877714, 1, 1, 1, 1, 1,
-0.3940029, -0.360546, -1.790008, 1, 1, 1, 1, 1,
-0.3915188, -1.073492, -3.13485, 1, 1, 1, 1, 1,
-0.3886469, -0.3287199, -1.849929, 0, 0, 1, 1, 1,
-0.3868013, -0.01367854, -0.2614742, 1, 0, 0, 1, 1,
-0.3847735, 0.7529246, -1.141335, 1, 0, 0, 1, 1,
-0.3736628, 0.2563914, 0.4421214, 1, 0, 0, 1, 1,
-0.3706903, 1.256491, -0.8100356, 1, 0, 0, 1, 1,
-0.3703402, -1.661153, -2.80763, 1, 0, 0, 1, 1,
-0.3663163, 1.421371, 1.293003, 0, 0, 0, 1, 1,
-0.365919, 0.3998185, 2.448493, 0, 0, 0, 1, 1,
-0.3654705, -0.8474687, -3.313523, 0, 0, 0, 1, 1,
-0.364993, 1.046243, 0.3350417, 0, 0, 0, 1, 1,
-0.3620707, -0.2852206, -0.8804704, 0, 0, 0, 1, 1,
-0.3584324, 0.9098755, 0.5795623, 0, 0, 0, 1, 1,
-0.3569978, 1.872986, 0.642051, 0, 0, 0, 1, 1,
-0.3551735, -2.056714, -4.397552, 1, 1, 1, 1, 1,
-0.3530204, -1.374819, -2.678893, 1, 1, 1, 1, 1,
-0.3499293, -0.4216307, -2.980849, 1, 1, 1, 1, 1,
-0.3486414, -0.1182108, -0.8382659, 1, 1, 1, 1, 1,
-0.3482755, -0.8770281, -2.435999, 1, 1, 1, 1, 1,
-0.3446161, -1.120195, -2.632612, 1, 1, 1, 1, 1,
-0.3427112, 0.3875551, 0.4400944, 1, 1, 1, 1, 1,
-0.3405753, -1.000286, -3.012595, 1, 1, 1, 1, 1,
-0.3403341, 0.7866936, -0.7863271, 1, 1, 1, 1, 1,
-0.3380437, -1.148746, -2.168369, 1, 1, 1, 1, 1,
-0.337231, -1.243926, -3.07606, 1, 1, 1, 1, 1,
-0.3351155, 0.2435673, -1.041762, 1, 1, 1, 1, 1,
-0.3336584, 0.3713805, -0.8406543, 1, 1, 1, 1, 1,
-0.3333793, -0.7315248, -2.928245, 1, 1, 1, 1, 1,
-0.3324808, 1.484858, 0.1250864, 1, 1, 1, 1, 1,
-0.3214067, 0.5402533, 0.5941903, 0, 0, 1, 1, 1,
-0.3199626, 1.821634, -0.6447225, 1, 0, 0, 1, 1,
-0.319804, -0.7854729, -2.499387, 1, 0, 0, 1, 1,
-0.3117447, 0.06935368, -0.5081763, 1, 0, 0, 1, 1,
-0.3082124, -0.1861456, -1.612278, 1, 0, 0, 1, 1,
-0.3061677, 2.080898, 0.502309, 1, 0, 0, 1, 1,
-0.2980888, -1.204321, -2.763202, 0, 0, 0, 1, 1,
-0.2961701, -0.01430318, -1.76114, 0, 0, 0, 1, 1,
-0.2905159, 0.03856751, -1.90091, 0, 0, 0, 1, 1,
-0.2892188, 0.02049326, -3.172388, 0, 0, 0, 1, 1,
-0.2840783, -0.9170901, -1.03367, 0, 0, 0, 1, 1,
-0.2819686, -0.06748104, -3.052268, 0, 0, 0, 1, 1,
-0.2779984, 0.4135346, -0.1843221, 0, 0, 0, 1, 1,
-0.2766796, 0.9982107, 0.1460257, 1, 1, 1, 1, 1,
-0.2758616, 0.2354116, -0.655997, 1, 1, 1, 1, 1,
-0.2753747, -1.632385, -3.378147, 1, 1, 1, 1, 1,
-0.271462, 1.270265, 0.1029318, 1, 1, 1, 1, 1,
-0.2669087, -0.910435, -4.051897, 1, 1, 1, 1, 1,
-0.2661864, -1.009965, -4.369712, 1, 1, 1, 1, 1,
-0.2635254, -0.5031169, -1.548241, 1, 1, 1, 1, 1,
-0.2602761, -0.8704314, -0.343972, 1, 1, 1, 1, 1,
-0.255527, 1.381535, 0.2346732, 1, 1, 1, 1, 1,
-0.2541217, -0.4275434, -2.606225, 1, 1, 1, 1, 1,
-0.2511961, 1.19332, 0.5571226, 1, 1, 1, 1, 1,
-0.2453318, 0.1078296, -0.6511097, 1, 1, 1, 1, 1,
-0.2441078, -0.4227776, -1.256404, 1, 1, 1, 1, 1,
-0.2437858, -0.2298036, -4.373449, 1, 1, 1, 1, 1,
-0.2377211, -0.9295732, -2.901989, 1, 1, 1, 1, 1,
-0.2339534, 0.4104439, -0.09623528, 0, 0, 1, 1, 1,
-0.2332078, -0.8635063, -2.921425, 1, 0, 0, 1, 1,
-0.2260166, -0.6805549, -3.32219, 1, 0, 0, 1, 1,
-0.2247874, 0.7730165, -2.379561, 1, 0, 0, 1, 1,
-0.2208023, -0.08981343, -0.1784434, 1, 0, 0, 1, 1,
-0.2157131, 0.5240033, -0.03617895, 1, 0, 0, 1, 1,
-0.2110734, 0.08889884, -0.6462272, 0, 0, 0, 1, 1,
-0.2099021, -0.9491612, -3.313917, 0, 0, 0, 1, 1,
-0.2073946, 1.179398, 1.185309, 0, 0, 0, 1, 1,
-0.2048786, 0.6497042, 0.639783, 0, 0, 0, 1, 1,
-0.2043901, 0.3299697, -1.630056, 0, 0, 0, 1, 1,
-0.202834, -1.099579, -1.926089, 0, 0, 0, 1, 1,
-0.1982366, 1.13415, 0.6283196, 0, 0, 0, 1, 1,
-0.197934, -2.125623, -2.383293, 1, 1, 1, 1, 1,
-0.1941586, -1.015603, -2.051339, 1, 1, 1, 1, 1,
-0.1863612, 1.467187, 2.223084, 1, 1, 1, 1, 1,
-0.1820498, 0.6493775, -0.4317328, 1, 1, 1, 1, 1,
-0.1793969, 0.2974239, -3.51191, 1, 1, 1, 1, 1,
-0.1768531, -0.1457283, -2.007094, 1, 1, 1, 1, 1,
-0.1725288, 0.4068527, 1.421021, 1, 1, 1, 1, 1,
-0.1717736, -0.2880702, -3.805075, 1, 1, 1, 1, 1,
-0.1680873, -0.7264221, -1.932095, 1, 1, 1, 1, 1,
-0.161382, -0.1484664, -0.6694611, 1, 1, 1, 1, 1,
-0.1600922, -0.821399, -2.655849, 1, 1, 1, 1, 1,
-0.1596073, 0.08430812, -2.171538, 1, 1, 1, 1, 1,
-0.1592168, -1.111445, -0.7718151, 1, 1, 1, 1, 1,
-0.1518064, 0.2105168, -0.6338292, 1, 1, 1, 1, 1,
-0.1510607, 0.7069358, -1.899271, 1, 1, 1, 1, 1,
-0.1503333, -0.02377508, -1.650846, 0, 0, 1, 1, 1,
-0.1450018, 1.30007, -0.32347, 1, 0, 0, 1, 1,
-0.1336978, 1.00314, -0.4542834, 1, 0, 0, 1, 1,
-0.1312987, 0.6352504, -0.2547172, 1, 0, 0, 1, 1,
-0.1289562, -0.07734066, -3.211925, 1, 0, 0, 1, 1,
-0.1211434, 0.1384991, -2.030755, 1, 0, 0, 1, 1,
-0.1196593, -1.963961, -2.878732, 0, 0, 0, 1, 1,
-0.1173895, -1.085841, -2.510662, 0, 0, 0, 1, 1,
-0.1160044, 1.312705, 0.1164268, 0, 0, 0, 1, 1,
-0.1154481, 1.584409, -1.030274, 0, 0, 0, 1, 1,
-0.1133906, 0.6340059, -0.2550772, 0, 0, 0, 1, 1,
-0.1105475, 2.418268, 0.8013351, 0, 0, 0, 1, 1,
-0.1098759, -1.441487, -1.39592, 0, 0, 0, 1, 1,
-0.1064337, 0.8473998, -1.938301, 1, 1, 1, 1, 1,
-0.1057974, 0.01483959, -0.1911401, 1, 1, 1, 1, 1,
-0.1000464, -0.4405744, -3.828232, 1, 1, 1, 1, 1,
-0.09863887, 0.2876413, 1.154533, 1, 1, 1, 1, 1,
-0.09830458, -1.682591, -1.340981, 1, 1, 1, 1, 1,
-0.09406304, -1.086667, -3.313941, 1, 1, 1, 1, 1,
-0.0935099, -0.6518093, -1.457129, 1, 1, 1, 1, 1,
-0.09249127, -0.8942963, -2.204031, 1, 1, 1, 1, 1,
-0.09219719, -0.09131815, -2.365891, 1, 1, 1, 1, 1,
-0.09101734, 0.153295, -0.5740766, 1, 1, 1, 1, 1,
-0.0827027, -0.4982791, -4.222387, 1, 1, 1, 1, 1,
-0.08249286, -0.2637693, -0.570004, 1, 1, 1, 1, 1,
-0.0816623, -0.007794307, -1.285732, 1, 1, 1, 1, 1,
-0.07774005, 0.5737178, 0.8356227, 1, 1, 1, 1, 1,
-0.0764768, -1.301754, -2.114177, 1, 1, 1, 1, 1,
-0.07192424, -0.004193461, -2.50612, 0, 0, 1, 1, 1,
-0.07091683, 2.188441, -0.4948138, 1, 0, 0, 1, 1,
-0.06796454, 0.01005905, -1.238569, 1, 0, 0, 1, 1,
-0.06617689, -0.2258141, -2.118072, 1, 0, 0, 1, 1,
-0.0659829, 1.44267, 2.366943, 1, 0, 0, 1, 1,
-0.06454374, -1.242411, -1.015184, 1, 0, 0, 1, 1,
-0.064483, -0.6294104, -3.006595, 0, 0, 0, 1, 1,
-0.06332843, -1.153734, -2.093, 0, 0, 0, 1, 1,
-0.06287358, 2.442221, 1.524012, 0, 0, 0, 1, 1,
-0.06217641, -0.0675088, -2.739473, 0, 0, 0, 1, 1,
-0.06122827, 0.03383034, -1.148207, 0, 0, 0, 1, 1,
-0.06065672, 0.7802237, -2.365816, 0, 0, 0, 1, 1,
-0.05893957, 1.664482, -2.544552, 0, 0, 0, 1, 1,
-0.05674857, 0.972246, -0.5660084, 1, 1, 1, 1, 1,
-0.05658975, 0.1313033, -1.546221, 1, 1, 1, 1, 1,
-0.05326216, -0.02596081, -2.347905, 1, 1, 1, 1, 1,
-0.04584615, 1.202501, 0.354103, 1, 1, 1, 1, 1,
-0.04352453, -0.1062531, -3.281535, 1, 1, 1, 1, 1,
-0.04337088, 0.2085329, 0.4709708, 1, 1, 1, 1, 1,
-0.04330155, -0.2023736, -1.640065, 1, 1, 1, 1, 1,
-0.04170034, 0.4681234, -0.7762274, 1, 1, 1, 1, 1,
-0.04112798, -0.5395134, -1.882982, 1, 1, 1, 1, 1,
-0.04020284, 0.5848121, 0.5397259, 1, 1, 1, 1, 1,
-0.03605728, 0.03468084, -2.554474, 1, 1, 1, 1, 1,
-0.03567573, -0.5742801, -2.244397, 1, 1, 1, 1, 1,
-0.03524075, 0.4563715, -1.486577, 1, 1, 1, 1, 1,
-0.03474035, -0.8134044, -3.25335, 1, 1, 1, 1, 1,
-0.03012979, 1.115559, 1.004702, 1, 1, 1, 1, 1,
-0.0235979, 1.130963, -1.469996, 0, 0, 1, 1, 1,
-0.01905925, 0.1351403, -1.941045, 1, 0, 0, 1, 1,
-0.0141949, 0.9488912, -0.9466631, 1, 0, 0, 1, 1,
-0.01396899, 0.3521091, -0.6461506, 1, 0, 0, 1, 1,
-0.006267639, -1.884725, -2.427999, 1, 0, 0, 1, 1,
-0.0062203, 0.746984, -1.473534, 1, 0, 0, 1, 1,
-0.004871587, -0.2780358, -3.755599, 0, 0, 0, 1, 1,
-0.003701074, 0.6802292, 1.038713, 0, 0, 0, 1, 1,
-0.001343799, -0.1054358, -3.213007, 0, 0, 0, 1, 1,
-0.0002075052, 0.8434168, 0.7562109, 0, 0, 0, 1, 1,
0.0004105744, 1.864715, 0.9090292, 0, 0, 0, 1, 1,
0.0009420026, 0.9814931, 1.283678, 0, 0, 0, 1, 1,
0.001321974, -0.04804935, 1.696955, 0, 0, 0, 1, 1,
0.005957401, -1.089885, 2.805393, 1, 1, 1, 1, 1,
0.009833035, -0.1953597, 5.700254, 1, 1, 1, 1, 1,
0.0166766, -0.5855755, 0.7750732, 1, 1, 1, 1, 1,
0.02352146, -0.2855459, 4.090319, 1, 1, 1, 1, 1,
0.02708517, 1.007485, -0.2306013, 1, 1, 1, 1, 1,
0.02922534, -1.072661, 5.245034, 1, 1, 1, 1, 1,
0.0294117, 0.08315406, 2.297914, 1, 1, 1, 1, 1,
0.02970353, 0.0636337, -0.2802396, 1, 1, 1, 1, 1,
0.03149203, -1.496996, 3.431458, 1, 1, 1, 1, 1,
0.03443586, 0.2864079, 1.153254, 1, 1, 1, 1, 1,
0.0351072, 0.4783104, -0.3056356, 1, 1, 1, 1, 1,
0.04464984, 0.1820531, 2.197285, 1, 1, 1, 1, 1,
0.04703117, -1.678259, 5.041506, 1, 1, 1, 1, 1,
0.0529514, 0.2945485, -0.7000332, 1, 1, 1, 1, 1,
0.0582439, 2.123259, 1.076421, 1, 1, 1, 1, 1,
0.05973405, 0.06871893, -0.5823396, 0, 0, 1, 1, 1,
0.06839878, -0.5837545, 4.345488, 1, 0, 0, 1, 1,
0.07219534, 0.2559079, 1.576469, 1, 0, 0, 1, 1,
0.07257025, -0.3909495, 3.705539, 1, 0, 0, 1, 1,
0.07578498, -0.3143564, 2.715394, 1, 0, 0, 1, 1,
0.0765173, -1.159177, 4.723851, 1, 0, 0, 1, 1,
0.07898108, -0.1519416, 1.491229, 0, 0, 0, 1, 1,
0.08866684, 1.266962, 1.467111, 0, 0, 0, 1, 1,
0.1013197, -0.0491739, 2.523584, 0, 0, 0, 1, 1,
0.1023948, -0.05228883, 1.325692, 0, 0, 0, 1, 1,
0.1107223, -1.794961, 3.314067, 0, 0, 0, 1, 1,
0.1126086, -0.944576, 4.222868, 0, 0, 0, 1, 1,
0.1171335, 0.4106518, 0.3639187, 0, 0, 0, 1, 1,
0.1207868, 0.2146458, 0.1041576, 1, 1, 1, 1, 1,
0.1253763, -1.00284, 1.719151, 1, 1, 1, 1, 1,
0.1274269, -1.679438, 4.008017, 1, 1, 1, 1, 1,
0.1278088, 0.7209957, 1.395946, 1, 1, 1, 1, 1,
0.1300364, 0.09711313, 1.338195, 1, 1, 1, 1, 1,
0.1309793, -1.136094, 2.445378, 1, 1, 1, 1, 1,
0.1322156, -1.636588, 3.092114, 1, 1, 1, 1, 1,
0.1336324, 0.3780414, 1.272335, 1, 1, 1, 1, 1,
0.1338575, -1.896313, 2.033508, 1, 1, 1, 1, 1,
0.1360217, -0.1383846, 2.73553, 1, 1, 1, 1, 1,
0.1375638, 0.0313192, 0.3913524, 1, 1, 1, 1, 1,
0.1382771, -0.2819368, 3.398142, 1, 1, 1, 1, 1,
0.1405414, -0.5380537, 3.215255, 1, 1, 1, 1, 1,
0.1417261, 1.899275, -1.428674, 1, 1, 1, 1, 1,
0.1425935, -0.5883668, 5.42414, 1, 1, 1, 1, 1,
0.1445837, -0.8636667, 1.820678, 0, 0, 1, 1, 1,
0.1479152, -0.5995416, 1.21443, 1, 0, 0, 1, 1,
0.1487888, 0.3022126, -2.405659, 1, 0, 0, 1, 1,
0.1522234, -1.655997, 3.141617, 1, 0, 0, 1, 1,
0.15606, 1.634639, 0.8933964, 1, 0, 0, 1, 1,
0.1590143, 1.645657, 0.0186345, 1, 0, 0, 1, 1,
0.1615323, 1.011065, 1.475352, 0, 0, 0, 1, 1,
0.1622679, -1.469748, 4.104004, 0, 0, 0, 1, 1,
0.168018, -1.566338, 3.907843, 0, 0, 0, 1, 1,
0.1699501, 0.8303022, -1.025967, 0, 0, 0, 1, 1,
0.1702978, -1.868071, 3.70957, 0, 0, 0, 1, 1,
0.1706367, -0.7323655, 3.883345, 0, 0, 0, 1, 1,
0.1715602, -0.9402405, 3.518012, 0, 0, 0, 1, 1,
0.1726883, -1.074896, 3.365908, 1, 1, 1, 1, 1,
0.1731981, 1.205331, 0.7625664, 1, 1, 1, 1, 1,
0.1786346, 0.1017707, 1.161653, 1, 1, 1, 1, 1,
0.1786581, -0.7269075, 2.478907, 1, 1, 1, 1, 1,
0.1863259, 0.2775541, 1.127419, 1, 1, 1, 1, 1,
0.186833, 0.04865885, -0.03098705, 1, 1, 1, 1, 1,
0.1871709, 1.126411, 0.9422151, 1, 1, 1, 1, 1,
0.1872724, -0.3234921, 1.260827, 1, 1, 1, 1, 1,
0.1917511, 1.403518, 0.05685211, 1, 1, 1, 1, 1,
0.1956965, -0.8818974, 2.054859, 1, 1, 1, 1, 1,
0.1967755, 1.404852, 0.5909747, 1, 1, 1, 1, 1,
0.1980933, 0.5226616, -0.4027747, 1, 1, 1, 1, 1,
0.2052764, 0.3223118, 0.8864378, 1, 1, 1, 1, 1,
0.207977, -0.07385079, 0.04461001, 1, 1, 1, 1, 1,
0.2092132, -1.5784, 3.21428, 1, 1, 1, 1, 1,
0.2121144, 0.9023285, 0.9642374, 0, 0, 1, 1, 1,
0.2187041, 0.3602495, 1.375248, 1, 0, 0, 1, 1,
0.2188679, 0.7187496, 0.1505067, 1, 0, 0, 1, 1,
0.219568, 1.602361, -0.9022325, 1, 0, 0, 1, 1,
0.2267541, 0.2416565, 0.9814535, 1, 0, 0, 1, 1,
0.227524, 0.7642611, -0.5835304, 1, 0, 0, 1, 1,
0.2278096, 0.9343773, 0.3442882, 0, 0, 0, 1, 1,
0.2327575, -0.8639562, 2.192858, 0, 0, 0, 1, 1,
0.2343329, 1.344026, 1.847392, 0, 0, 0, 1, 1,
0.234551, -1.035001, 3.393228, 0, 0, 0, 1, 1,
0.2403071, 0.9206346, 0.6659694, 0, 0, 0, 1, 1,
0.2407445, 0.9374714, -0.9329502, 0, 0, 0, 1, 1,
0.2427264, -1.698916, 2.605365, 0, 0, 0, 1, 1,
0.2473304, 0.003522977, 1.593565, 1, 1, 1, 1, 1,
0.2506435, -0.456239, 3.093868, 1, 1, 1, 1, 1,
0.2531635, -2.910126, 4.183444, 1, 1, 1, 1, 1,
0.2606259, -2.646002, 1.146288, 1, 1, 1, 1, 1,
0.2613241, 0.8423062, 0.04274761, 1, 1, 1, 1, 1,
0.2629341, -1.492821, 2.795725, 1, 1, 1, 1, 1,
0.2639874, 2.056389, 0.4607146, 1, 1, 1, 1, 1,
0.2641635, 0.7018262, 1.021226, 1, 1, 1, 1, 1,
0.2649027, -2.009239, 1.275998, 1, 1, 1, 1, 1,
0.2669049, 1.300285, -0.3825833, 1, 1, 1, 1, 1,
0.2694597, 0.8992838, 0.3504336, 1, 1, 1, 1, 1,
0.2726133, -0.2350348, 1.166051, 1, 1, 1, 1, 1,
0.2748516, -1.246788, 4.828806, 1, 1, 1, 1, 1,
0.276931, -1.622853, 4.485746, 1, 1, 1, 1, 1,
0.2787441, -0.9432055, 3.16832, 1, 1, 1, 1, 1,
0.2798527, 0.08597614, 1.78945, 0, 0, 1, 1, 1,
0.2818161, 0.8705603, -0.2517554, 1, 0, 0, 1, 1,
0.2844221, 2.234071, 0.26485, 1, 0, 0, 1, 1,
0.2853316, -0.758665, 2.013092, 1, 0, 0, 1, 1,
0.2855844, 1.943309, 1.378726, 1, 0, 0, 1, 1,
0.2871622, 1.618127, 1.107314, 1, 0, 0, 1, 1,
0.2899122, -2.026093, 3.079676, 0, 0, 0, 1, 1,
0.2968453, 0.4884589, -0.6890746, 0, 0, 0, 1, 1,
0.3000364, -1.037823, 3.547831, 0, 0, 0, 1, 1,
0.3018261, 0.5166333, -0.8937581, 0, 0, 0, 1, 1,
0.3022361, -0.587866, 4.674904, 0, 0, 0, 1, 1,
0.3040329, -0.7493347, 2.891579, 0, 0, 0, 1, 1,
0.3074495, -0.3795402, 1.802421, 0, 0, 0, 1, 1,
0.3125039, 0.1596558, 0.2480508, 1, 1, 1, 1, 1,
0.3179858, -0.4167004, 2.7512, 1, 1, 1, 1, 1,
0.3223064, -0.6439714, 2.588367, 1, 1, 1, 1, 1,
0.3244081, 2.525941, 0.858433, 1, 1, 1, 1, 1,
0.3245694, -0.3502414, 3.037104, 1, 1, 1, 1, 1,
0.3246927, -0.3818347, 2.203674, 1, 1, 1, 1, 1,
0.3253644, 0.01394928, 2.963358, 1, 1, 1, 1, 1,
0.336123, 0.3357096, 0.1290604, 1, 1, 1, 1, 1,
0.3387791, 0.04253452, 1.895366, 1, 1, 1, 1, 1,
0.3387896, -1.043257, 4.009348, 1, 1, 1, 1, 1,
0.3506871, -0.9441401, 4.439448, 1, 1, 1, 1, 1,
0.3517067, -0.1341615, 2.45806, 1, 1, 1, 1, 1,
0.3592796, 1.160012, 0.5512874, 1, 1, 1, 1, 1,
0.3614148, 0.04721228, 3.14678, 1, 1, 1, 1, 1,
0.3662857, -1.705172, 1.148568, 1, 1, 1, 1, 1,
0.3703429, 0.6023192, 0.6084037, 0, 0, 1, 1, 1,
0.370981, -1.183372, 2.639973, 1, 0, 0, 1, 1,
0.373181, -2.774786, 3.757349, 1, 0, 0, 1, 1,
0.3743598, -0.2422868, 3.224167, 1, 0, 0, 1, 1,
0.3828079, 2.183872, 0.01162702, 1, 0, 0, 1, 1,
0.3868703, -0.1498034, 1.451654, 1, 0, 0, 1, 1,
0.3913431, -0.03151107, 1.287465, 0, 0, 0, 1, 1,
0.391853, -0.2137348, 2.297098, 0, 0, 0, 1, 1,
0.3930835, 0.4356915, 1.736132, 0, 0, 0, 1, 1,
0.3945401, -0.2692383, 0.9097977, 0, 0, 0, 1, 1,
0.3974445, -1.595484, 3.961297, 0, 0, 0, 1, 1,
0.4040876, 0.3497289, 1.238773, 0, 0, 0, 1, 1,
0.4041663, -0.386512, 2.395157, 0, 0, 0, 1, 1,
0.4043257, -0.3152922, 2.817242, 1, 1, 1, 1, 1,
0.4062234, 1.565656, -0.305434, 1, 1, 1, 1, 1,
0.4068843, -0.278227, 1.810934, 1, 1, 1, 1, 1,
0.4093405, 0.3558733, 0.9655861, 1, 1, 1, 1, 1,
0.4108955, -0.4508224, 0.9224535, 1, 1, 1, 1, 1,
0.4120833, -0.2199308, 3.017043, 1, 1, 1, 1, 1,
0.4130305, 1.774866, -1.931474, 1, 1, 1, 1, 1,
0.4173082, 0.388227, 1.056458, 1, 1, 1, 1, 1,
0.4183765, -0.5329244, 2.583926, 1, 1, 1, 1, 1,
0.4212257, -0.8905914, 2.074265, 1, 1, 1, 1, 1,
0.4234675, 1.008547, 0.6398346, 1, 1, 1, 1, 1,
0.4457727, 1.318754, -0.1059278, 1, 1, 1, 1, 1,
0.4496979, 0.4431395, 0.1760825, 1, 1, 1, 1, 1,
0.4508448, -0.4911769, 2.334987, 1, 1, 1, 1, 1,
0.4510947, -1.957642, 1.531935, 1, 1, 1, 1, 1,
0.4517846, 0.267778, 1.612136, 0, 0, 1, 1, 1,
0.45186, 0.82713, -0.1485445, 1, 0, 0, 1, 1,
0.4522972, -0.3025174, 2.059156, 1, 0, 0, 1, 1,
0.4528317, -0.434343, 2.692776, 1, 0, 0, 1, 1,
0.4555832, -0.4436544, 3.463036, 1, 0, 0, 1, 1,
0.4589792, 0.3844685, -0.3473584, 1, 0, 0, 1, 1,
0.4626467, 0.7962104, 0.2555716, 0, 0, 0, 1, 1,
0.4639745, -0.1467348, 1.010904, 0, 0, 0, 1, 1,
0.4691529, -0.2191856, 1.013212, 0, 0, 0, 1, 1,
0.472216, -0.427, 3.830232, 0, 0, 0, 1, 1,
0.4731337, 0.8238657, -0.1697568, 0, 0, 0, 1, 1,
0.4734328, -0.8634468, 0.8111768, 0, 0, 0, 1, 1,
0.4768175, -0.6847105, 2.994571, 0, 0, 0, 1, 1,
0.4771141, -0.3636332, 1.58079, 1, 1, 1, 1, 1,
0.4785144, 0.2222002, 1.577725, 1, 1, 1, 1, 1,
0.4847176, -0.6330507, 1.746069, 1, 1, 1, 1, 1,
0.4871921, -0.6056083, 1.873238, 1, 1, 1, 1, 1,
0.4889684, 1.403489, -0.8161709, 1, 1, 1, 1, 1,
0.4957772, 0.1804889, 2.791621, 1, 1, 1, 1, 1,
0.4998328, -2.051531, 3.405899, 1, 1, 1, 1, 1,
0.5027101, 0.9563243, 1.550003, 1, 1, 1, 1, 1,
0.504178, -0.9237022, 3.472634, 1, 1, 1, 1, 1,
0.5104215, 1.001961, 2.29336, 1, 1, 1, 1, 1,
0.5173758, -1.172479, 1.815196, 1, 1, 1, 1, 1,
0.5180929, 0.2360413, 0.1149836, 1, 1, 1, 1, 1,
0.5205135, -1.526852, 2.307739, 1, 1, 1, 1, 1,
0.5219308, 1.510533, 0.5927062, 1, 1, 1, 1, 1,
0.5242399, 0.03590439, 0.2136744, 1, 1, 1, 1, 1,
0.5253485, 0.52367, 0.2371811, 0, 0, 1, 1, 1,
0.5285212, 0.9314731, 0.3015112, 1, 0, 0, 1, 1,
0.5306802, -0.3737682, 3.737432, 1, 0, 0, 1, 1,
0.5361598, 0.1433062, 1.797709, 1, 0, 0, 1, 1,
0.540222, -1.030209, 1.999046, 1, 0, 0, 1, 1,
0.5408751, -0.5775499, 3.003338, 1, 0, 0, 1, 1,
0.5416706, 1.316632, 0.844678, 0, 0, 0, 1, 1,
0.5417113, 1.364568, 0.5242131, 0, 0, 0, 1, 1,
0.5552532, -0.7222969, 2.450104, 0, 0, 0, 1, 1,
0.5598648, -0.6972772, 1.417254, 0, 0, 0, 1, 1,
0.5625966, -0.4031208, 2.853539, 0, 0, 0, 1, 1,
0.5629454, -0.6766645, -1.608219, 0, 0, 0, 1, 1,
0.5636469, -0.4190953, 2.885171, 0, 0, 0, 1, 1,
0.568148, -1.666766, 2.906288, 1, 1, 1, 1, 1,
0.5695757, -1.242803, 0.840789, 1, 1, 1, 1, 1,
0.5733871, 1.302529, -1.252529, 1, 1, 1, 1, 1,
0.5757611, -0.7189409, 2.004165, 1, 1, 1, 1, 1,
0.5768175, -0.8069686, 4.88585, 1, 1, 1, 1, 1,
0.5796575, 1.023974, 1.85172, 1, 1, 1, 1, 1,
0.5816656, 0.1292393, 0.3280095, 1, 1, 1, 1, 1,
0.5826547, 0.7935243, 1.805226, 1, 1, 1, 1, 1,
0.5847898, -0.3686455, 4.458375, 1, 1, 1, 1, 1,
0.5864341, -0.3912069, 1.823787, 1, 1, 1, 1, 1,
0.5937623, 0.1950209, 2.801963, 1, 1, 1, 1, 1,
0.596446, 0.4808996, 0.2974357, 1, 1, 1, 1, 1,
0.5979943, 0.6646501, 1.247749, 1, 1, 1, 1, 1,
0.5984534, 0.2341192, 3.460977, 1, 1, 1, 1, 1,
0.5987815, -0.4409771, 3.468881, 1, 1, 1, 1, 1,
0.5992664, -0.9101028, 1.780427, 0, 0, 1, 1, 1,
0.6037087, 0.4454762, 0.3408243, 1, 0, 0, 1, 1,
0.6038491, -0.3124271, 1.236285, 1, 0, 0, 1, 1,
0.6176891, -1.617837, 4.178369, 1, 0, 0, 1, 1,
0.6177264, -0.8191729, 2.665149, 1, 0, 0, 1, 1,
0.6202466, 0.05330944, 1.777873, 1, 0, 0, 1, 1,
0.620271, -1.837245, 2.241121, 0, 0, 0, 1, 1,
0.6205839, -0.2233185, 0.9847541, 0, 0, 0, 1, 1,
0.625523, 2.445207, 0.8174371, 0, 0, 0, 1, 1,
0.6316707, 1.327221, 1.868678, 0, 0, 0, 1, 1,
0.6322682, -0.3412564, 3.165244, 0, 0, 0, 1, 1,
0.6338117, -1.068165, 2.100463, 0, 0, 0, 1, 1,
0.6342171, -1.820584, 4.162384, 0, 0, 0, 1, 1,
0.6396028, 2.67659, 0.6553729, 1, 1, 1, 1, 1,
0.6443673, 0.4005688, 1.751886, 1, 1, 1, 1, 1,
0.6446754, 0.4320943, 1.843919, 1, 1, 1, 1, 1,
0.6458025, 0.7125051, -0.4892938, 1, 1, 1, 1, 1,
0.6466467, 0.4389048, 0.6841422, 1, 1, 1, 1, 1,
0.6630217, 0.4660856, 3.073498, 1, 1, 1, 1, 1,
0.6735987, -0.4889177, 1.536992, 1, 1, 1, 1, 1,
0.6736023, 0.8883035, 0.5426428, 1, 1, 1, 1, 1,
0.683331, -0.8784384, 1.833611, 1, 1, 1, 1, 1,
0.6877337, 0.1974773, 1.008871, 1, 1, 1, 1, 1,
0.6894513, -0.1070659, 1.88536, 1, 1, 1, 1, 1,
0.6930625, -1.051643, 2.029075, 1, 1, 1, 1, 1,
0.6931973, 1.713169, -0.0970264, 1, 1, 1, 1, 1,
0.6935722, -0.9181304, 2.405096, 1, 1, 1, 1, 1,
0.6965428, -0.5357424, 3.208456, 1, 1, 1, 1, 1,
0.6973179, 0.7430699, 1.491585, 0, 0, 1, 1, 1,
0.6978387, 2.226301, 0.2766685, 1, 0, 0, 1, 1,
0.6999012, 0.51344, 0.2684869, 1, 0, 0, 1, 1,
0.7015086, 2.723984, -0.7340086, 1, 0, 0, 1, 1,
0.7017058, 2.236571, 2.552686, 1, 0, 0, 1, 1,
0.7024186, 0.08995342, -0.8248905, 1, 0, 0, 1, 1,
0.7033482, 1.331822, 1.311346, 0, 0, 0, 1, 1,
0.7046775, -2.007784, 3.179664, 0, 0, 0, 1, 1,
0.7074803, -2.344102, 3.3146, 0, 0, 0, 1, 1,
0.7102153, 1.113793, 0.5332215, 0, 0, 0, 1, 1,
0.7103663, -2.265181, 2.46786, 0, 0, 0, 1, 1,
0.7142158, 0.4146099, 2.38754, 0, 0, 0, 1, 1,
0.7154468, 0.8590857, 0.1447146, 0, 0, 0, 1, 1,
0.7168547, 1.350385, 0.7415762, 1, 1, 1, 1, 1,
0.7179645, 0.6685274, 1.720439, 1, 1, 1, 1, 1,
0.7186321, -0.337517, 0.07222553, 1, 1, 1, 1, 1,
0.7231297, -2.672463, 2.916439, 1, 1, 1, 1, 1,
0.7234735, -0.4995421, 1.523022, 1, 1, 1, 1, 1,
0.7272162, -0.8167919, 1.278186, 1, 1, 1, 1, 1,
0.7282594, -0.08941816, 0.3115278, 1, 1, 1, 1, 1,
0.7292304, -0.2887384, 2.02051, 1, 1, 1, 1, 1,
0.7352251, -0.4458859, 2.39073, 1, 1, 1, 1, 1,
0.7357358, -0.913887, 3.138361, 1, 1, 1, 1, 1,
0.7387666, -0.04432107, 1.568781, 1, 1, 1, 1, 1,
0.7451624, -0.6865339, 3.04526, 1, 1, 1, 1, 1,
0.7455218, -1.221635, 2.625512, 1, 1, 1, 1, 1,
0.7461639, 0.4696245, 1.315133, 1, 1, 1, 1, 1,
0.746316, -0.4184647, 2.102419, 1, 1, 1, 1, 1,
0.7484605, -0.4644206, 2.31138, 0, 0, 1, 1, 1,
0.7513621, 0.1809874, 1.738277, 1, 0, 0, 1, 1,
0.7532227, -0.5488002, 3.480423, 1, 0, 0, 1, 1,
0.7538204, 1.204602, -0.1104542, 1, 0, 0, 1, 1,
0.753921, 0.8764156, 0.9900452, 1, 0, 0, 1, 1,
0.7540421, -2.191203, 3.481514, 1, 0, 0, 1, 1,
0.7588155, -1.033418, 2.526493, 0, 0, 0, 1, 1,
0.7669302, -0.8030622, 0.7847521, 0, 0, 0, 1, 1,
0.7676921, 0.5472491, 2.275022, 0, 0, 0, 1, 1,
0.7710591, -1.316866, 3.035217, 0, 0, 0, 1, 1,
0.7735259, 0.2904595, 1.367093, 0, 0, 0, 1, 1,
0.7754271, -0.4719032, 1.403413, 0, 0, 0, 1, 1,
0.7792172, -0.502507, 1.757939, 0, 0, 0, 1, 1,
0.7811058, -0.4941097, 2.70826, 1, 1, 1, 1, 1,
0.7814257, -2.0913, 1.751276, 1, 1, 1, 1, 1,
0.7903084, 0.0366337, 1.967801, 1, 1, 1, 1, 1,
0.7983807, -0.6906728, 1.659105, 1, 1, 1, 1, 1,
0.8011077, 2.638804, 1.334986, 1, 1, 1, 1, 1,
0.8017391, 1.254971, 1.273077, 1, 1, 1, 1, 1,
0.8018222, 1.218648, 0.612366, 1, 1, 1, 1, 1,
0.8041037, -0.9535902, 2.244099, 1, 1, 1, 1, 1,
0.8083797, -0.241641, 2.431507, 1, 1, 1, 1, 1,
0.8165436, -0.7412535, 1.777275, 1, 1, 1, 1, 1,
0.8249676, -1.009559, 3.492777, 1, 1, 1, 1, 1,
0.8283864, -0.07885568, 2.219681, 1, 1, 1, 1, 1,
0.8357453, -0.1546708, 0.4175062, 1, 1, 1, 1, 1,
0.8369281, -0.6718433, 3.316101, 1, 1, 1, 1, 1,
0.8372523, 1.224892, 0.4965974, 1, 1, 1, 1, 1,
0.8421751, -0.6155326, 2.73153, 0, 0, 1, 1, 1,
0.843256, 0.1953635, 2.541349, 1, 0, 0, 1, 1,
0.8441286, -0.9116978, 2.578004, 1, 0, 0, 1, 1,
0.856682, -0.01403722, 1.860411, 1, 0, 0, 1, 1,
0.8572705, 1.390899, 1.359309, 1, 0, 0, 1, 1,
0.8584142, 1.632553, 1.775417, 1, 0, 0, 1, 1,
0.8588869, -0.5903021, 2.612604, 0, 0, 0, 1, 1,
0.8589577, -1.027338, 3.559758, 0, 0, 0, 1, 1,
0.8658784, -0.09848601, 1.666943, 0, 0, 0, 1, 1,
0.8890434, -0.4665051, 1.609193, 0, 0, 0, 1, 1,
0.9041517, 0.3006899, 0.7268894, 0, 0, 0, 1, 1,
0.9064155, 0.1543753, 1.248098, 0, 0, 0, 1, 1,
0.9095575, -0.9770527, 3.221715, 0, 0, 0, 1, 1,
0.913622, 2.616872, 1.081857, 1, 1, 1, 1, 1,
0.9219736, -0.4878339, 2.357243, 1, 1, 1, 1, 1,
0.9248227, 0.3049095, 0.9963702, 1, 1, 1, 1, 1,
0.9389454, 1.23166, 0.8534073, 1, 1, 1, 1, 1,
0.9414729, -0.1912663, 1.325602, 1, 1, 1, 1, 1,
0.9472322, -1.04452, 3.137638, 1, 1, 1, 1, 1,
0.9479094, -0.3615707, 1.977716, 1, 1, 1, 1, 1,
0.9499741, 0.8865014, 0.6556858, 1, 1, 1, 1, 1,
0.9525562, -0.7098114, 1.849888, 1, 1, 1, 1, 1,
0.9530122, -0.02394264, -0.3936132, 1, 1, 1, 1, 1,
0.955314, -1.524655, 2.291069, 1, 1, 1, 1, 1,
0.9578845, 1.741527, 0.3417952, 1, 1, 1, 1, 1,
0.9714593, 0.5503312, 0.7193788, 1, 1, 1, 1, 1,
0.9773561, 0.3562849, -0.07195083, 1, 1, 1, 1, 1,
0.9777982, 0.652231, -1.704399, 1, 1, 1, 1, 1,
0.9787734, 0.7908303, 0.199357, 0, 0, 1, 1, 1,
0.9794459, -0.40959, 1.57838, 1, 0, 0, 1, 1,
0.9829001, 1.987991, -0.04126617, 1, 0, 0, 1, 1,
0.9831025, -1.617327, 1.328721, 1, 0, 0, 1, 1,
0.9839217, -0.8557438, 0.8761738, 1, 0, 0, 1, 1,
0.9880806, -0.8159915, 3.528083, 1, 0, 0, 1, 1,
0.9895357, -1.850117, 3.77839, 0, 0, 0, 1, 1,
0.9918572, 1.034889, 0.8983122, 0, 0, 0, 1, 1,
0.9935938, 0.7524971, 0.6800227, 0, 0, 0, 1, 1,
0.9939402, 1.219359, 0.7203437, 0, 0, 0, 1, 1,
0.9954752, -0.08666166, 1.235427, 0, 0, 0, 1, 1,
1.001893, -1.067717, 2.335631, 0, 0, 0, 1, 1,
1.018687, 1.04621, -0.2470013, 0, 0, 0, 1, 1,
1.024706, -0.4186669, 3.520785, 1, 1, 1, 1, 1,
1.036373, 0.9834645, 1.919871, 1, 1, 1, 1, 1,
1.037519, -1.474382, 1.662996, 1, 1, 1, 1, 1,
1.038335, -0.3956133, 2.376291, 1, 1, 1, 1, 1,
1.043768, -0.5176494, 2.916031, 1, 1, 1, 1, 1,
1.044003, -0.5177405, 1.619339, 1, 1, 1, 1, 1,
1.050553, 1.261448, 0.8615492, 1, 1, 1, 1, 1,
1.057276, 0.6290543, 0.9120669, 1, 1, 1, 1, 1,
1.061758, 0.2977416, 0.5428586, 1, 1, 1, 1, 1,
1.062582, -0.3987111, 2.608033, 1, 1, 1, 1, 1,
1.063568, 0.6143289, -0.0906457, 1, 1, 1, 1, 1,
1.071313, 0.9568053, 2.662057, 1, 1, 1, 1, 1,
1.088324, 0.2769221, 1.589196, 1, 1, 1, 1, 1,
1.095793, -1.402717, 2.589948, 1, 1, 1, 1, 1,
1.099221, -1.043316, 0.5938681, 1, 1, 1, 1, 1,
1.107503, -1.05668, 3.240636, 0, 0, 1, 1, 1,
1.110964, 0.4779176, 2.951616, 1, 0, 0, 1, 1,
1.11687, -0.2152786, 1.91891, 1, 0, 0, 1, 1,
1.123938, 0.2153746, 1.80641, 1, 0, 0, 1, 1,
1.124167, 1.18114, 0.8461744, 1, 0, 0, 1, 1,
1.127434, 1.386338, -0.313438, 1, 0, 0, 1, 1,
1.128269, -1.571113, 0.7326055, 0, 0, 0, 1, 1,
1.131814, 0.1409355, 1.57458, 0, 0, 0, 1, 1,
1.132976, -0.03486326, 3.178267, 0, 0, 0, 1, 1,
1.136559, -0.400719, 2.415185, 0, 0, 0, 1, 1,
1.136768, 2.002337, 0.4672222, 0, 0, 0, 1, 1,
1.146033, -1.794653, 2.024165, 0, 0, 0, 1, 1,
1.150712, 0.301889, 0.5373634, 0, 0, 0, 1, 1,
1.165449, 0.2145471, 0.1788541, 1, 1, 1, 1, 1,
1.165581, 0.1380097, 1.068699, 1, 1, 1, 1, 1,
1.170275, 0.456241, 1.658832, 1, 1, 1, 1, 1,
1.176436, -0.2039214, 1.818659, 1, 1, 1, 1, 1,
1.177892, -0.6752876, 2.268661, 1, 1, 1, 1, 1,
1.182888, -0.5217173, 3.232277, 1, 1, 1, 1, 1,
1.192639, 0.4307673, 1.8493, 1, 1, 1, 1, 1,
1.206302, 0.9727306, 0.9035217, 1, 1, 1, 1, 1,
1.207781, -0.3985069, 1.693592, 1, 1, 1, 1, 1,
1.211106, -1.143998, 4.806254, 1, 1, 1, 1, 1,
1.213186, -1.007616, 4.375525, 1, 1, 1, 1, 1,
1.216211, -0.01076251, 0.6780517, 1, 1, 1, 1, 1,
1.218491, -0.3929049, 3.110288, 1, 1, 1, 1, 1,
1.221392, -0.9020251, 0.5878347, 1, 1, 1, 1, 1,
1.222125, 0.4478205, 0.6903058, 1, 1, 1, 1, 1,
1.224834, -1.01923, 3.384323, 0, 0, 1, 1, 1,
1.226425, 1.666809, 1.398335, 1, 0, 0, 1, 1,
1.228273, -0.7945218, 1.044129, 1, 0, 0, 1, 1,
1.234986, -2.14908, 0.9168622, 1, 0, 0, 1, 1,
1.235279, -1.142403, 0.9330443, 1, 0, 0, 1, 1,
1.243363, 0.2029994, 0.2310453, 1, 0, 0, 1, 1,
1.244086, 0.7461561, -0.3355559, 0, 0, 0, 1, 1,
1.245822, 0.7202158, 0.6706915, 0, 0, 0, 1, 1,
1.25247, -0.2334448, 1.629122, 0, 0, 0, 1, 1,
1.252815, -0.1903559, 1.733181, 0, 0, 0, 1, 1,
1.273444, -1.179155, 2.244892, 0, 0, 0, 1, 1,
1.287178, -1.744572, 2.715206, 0, 0, 0, 1, 1,
1.294045, 0.707998, 1.402911, 0, 0, 0, 1, 1,
1.295479, 1.111342, 0.9116706, 1, 1, 1, 1, 1,
1.300089, -1.042323, 2.097337, 1, 1, 1, 1, 1,
1.300228, -0.7322446, 3.267153, 1, 1, 1, 1, 1,
1.310339, -1.651347, 1.944714, 1, 1, 1, 1, 1,
1.314345, 0.9822825, 0.8257021, 1, 1, 1, 1, 1,
1.315511, 1.878503, 0.9067277, 1, 1, 1, 1, 1,
1.319186, -1.304718, 2.754472, 1, 1, 1, 1, 1,
1.322859, -0.5172421, 1.270766, 1, 1, 1, 1, 1,
1.32992, 0.8109265, 1.741602, 1, 1, 1, 1, 1,
1.337122, 0.295989, 0.2042727, 1, 1, 1, 1, 1,
1.337476, 0.6063605, 0.5540495, 1, 1, 1, 1, 1,
1.338407, -0.3811527, 1.104578, 1, 1, 1, 1, 1,
1.363173, 1.118248, 0.3611468, 1, 1, 1, 1, 1,
1.367432, -0.8623286, 3.141561, 1, 1, 1, 1, 1,
1.37475, -1.517056, 2.862763, 1, 1, 1, 1, 1,
1.378791, -1.243822, 2.86908, 0, 0, 1, 1, 1,
1.38701, 0.01814601, 1.218878, 1, 0, 0, 1, 1,
1.41283, -1.345644, 1.96162, 1, 0, 0, 1, 1,
1.413345, -1.071583, 2.457724, 1, 0, 0, 1, 1,
1.426111, -3.068928, 2.629422, 1, 0, 0, 1, 1,
1.43339, -1.21009, 2.799294, 1, 0, 0, 1, 1,
1.438347, -0.1146654, 1.029398, 0, 0, 0, 1, 1,
1.442932, 0.4730443, 1.027167, 0, 0, 0, 1, 1,
1.453456, 1.475, -1.8611, 0, 0, 0, 1, 1,
1.464935, -1.503469, 2.345196, 0, 0, 0, 1, 1,
1.469858, 0.1225867, 0.3983935, 0, 0, 0, 1, 1,
1.470375, -0.02434766, 1.991133, 0, 0, 0, 1, 1,
1.479875, 1.779253, -0.3857429, 0, 0, 0, 1, 1,
1.487938, -1.623966, 0.7750133, 1, 1, 1, 1, 1,
1.495943, -0.20181, 2.301716, 1, 1, 1, 1, 1,
1.502138, 0.6808954, 0.2522471, 1, 1, 1, 1, 1,
1.50773, -0.08255319, 0.9008111, 1, 1, 1, 1, 1,
1.513443, -0.5677063, 2.004794, 1, 1, 1, 1, 1,
1.521559, -0.4877223, 2.707558, 1, 1, 1, 1, 1,
1.527976, 1.791197, -0.7348863, 1, 1, 1, 1, 1,
1.537584, 0.6912145, 3.025094, 1, 1, 1, 1, 1,
1.54253, 0.4452874, 0.3325239, 1, 1, 1, 1, 1,
1.548644, 0.4106267, 1.989427, 1, 1, 1, 1, 1,
1.582233, 1.482323, -0.0310785, 1, 1, 1, 1, 1,
1.601679, 0.3910075, 0.9139293, 1, 1, 1, 1, 1,
1.625041, 0.4846658, 2.589074, 1, 1, 1, 1, 1,
1.668736, 0.3743689, 0.7830011, 1, 1, 1, 1, 1,
1.677637, 0.0643919, -0.8584685, 1, 1, 1, 1, 1,
1.699196, 0.8656463, -1.060442, 0, 0, 1, 1, 1,
1.704939, 1.683567, 0.6849923, 1, 0, 0, 1, 1,
1.706531, 1.351315, 1.371992, 1, 0, 0, 1, 1,
1.741504, 0.3109264, 2.040487, 1, 0, 0, 1, 1,
1.759842, -0.4185103, 0.847715, 1, 0, 0, 1, 1,
1.782931, 1.943786, 0.541749, 1, 0, 0, 1, 1,
1.794185, -0.7812451, 2.642485, 0, 0, 0, 1, 1,
1.797633, 0.1313909, 1.301496, 0, 0, 0, 1, 1,
1.800754, -1.863768, 3.144446, 0, 0, 0, 1, 1,
1.814962, 1.156929, 0.7939582, 0, 0, 0, 1, 1,
1.837309, -1.353251, 3.862071, 0, 0, 0, 1, 1,
1.897173, -1.289935, 1.607201, 0, 0, 0, 1, 1,
1.915064, -1.195714, 2.892848, 0, 0, 0, 1, 1,
1.921365, -0.4465429, 2.711313, 1, 1, 1, 1, 1,
1.924594, -2.346392, 1.281716, 1, 1, 1, 1, 1,
1.932734, 0.9838949, 0.2671478, 1, 1, 1, 1, 1,
1.934449, -0.5066909, 3.209877, 1, 1, 1, 1, 1,
1.953306, 1.425508, -1.169377, 1, 1, 1, 1, 1,
1.961199, -0.6716857, 2.330901, 1, 1, 1, 1, 1,
1.970999, 0.3305355, 2.402555, 1, 1, 1, 1, 1,
1.987479, 0.5699128, 2.626301, 1, 1, 1, 1, 1,
1.999397, -1.619619, 1.208658, 1, 1, 1, 1, 1,
2.00321, 1.239849, -0.1478911, 1, 1, 1, 1, 1,
2.022452, -0.6955177, 1.475473, 1, 1, 1, 1, 1,
2.035429, 0.6317276, 1.726832, 1, 1, 1, 1, 1,
2.049888, 0.9556861, 0.7047225, 1, 1, 1, 1, 1,
2.060071, 1.170512, 3.144729, 1, 1, 1, 1, 1,
2.068451, 2.217971, 1.246647, 1, 1, 1, 1, 1,
2.122684, -0.5500008, 1.517441, 0, 0, 1, 1, 1,
2.126296, -0.536228, 1.873069, 1, 0, 0, 1, 1,
2.198244, -0.3904181, 2.632105, 1, 0, 0, 1, 1,
2.199764, -0.01436483, 1.99654, 1, 0, 0, 1, 1,
2.221094, -1.217778, 3.122139, 1, 0, 0, 1, 1,
2.224083, 0.0476111, 0.9125884, 1, 0, 0, 1, 1,
2.264835, 1.394595, -1.185432, 0, 0, 0, 1, 1,
2.26595, -1.694533, 2.440817, 0, 0, 0, 1, 1,
2.309596, 0.3961574, 0.2138347, 0, 0, 0, 1, 1,
2.336319, -0.6728602, 1.595736, 0, 0, 0, 1, 1,
2.362772, -0.4865519, 2.112279, 0, 0, 0, 1, 1,
2.374178, 0.4787151, 1.081013, 0, 0, 0, 1, 1,
2.387177, -1.201234, 2.839613, 0, 0, 0, 1, 1,
2.433023, -0.4808885, 1.926639, 1, 1, 1, 1, 1,
2.482253, 1.434026, 0.2852328, 1, 1, 1, 1, 1,
2.552967, -0.2136916, 1.494932, 1, 1, 1, 1, 1,
2.641919, -0.4141454, 2.626191, 1, 1, 1, 1, 1,
2.691991, -1.868881, 1.20902, 1, 1, 1, 1, 1,
2.934894, -1.183968, 3.153014, 1, 1, 1, 1, 1,
2.953216, 2.644468, -0.3486382, 1, 1, 1, 1, 1
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
var radius = 9.38818;
var distance = 32.97558;
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
mvMatrix.translate( 0.06106889, 0.172472, -0.2547596 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.97558);
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