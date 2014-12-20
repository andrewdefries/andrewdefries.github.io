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
-3.023243, 0.6835445, -1.270573, 1, 0, 0, 1,
-2.95468, -0.8278109, -1.228199, 1, 0.007843138, 0, 1,
-2.677054, 1.684605, -1.763192, 1, 0.01176471, 0, 1,
-2.665167, 0.469958, -3.414918, 1, 0.01960784, 0, 1,
-2.639516, -0.2570233, -1.213051, 1, 0.02352941, 0, 1,
-2.602874, -1.594314, -1.879146, 1, 0.03137255, 0, 1,
-2.364285, 0.9581522, -0.7632198, 1, 0.03529412, 0, 1,
-2.252301, -0.1097846, -1.7308, 1, 0.04313726, 0, 1,
-2.231531, -0.7352327, -1.990049, 1, 0.04705882, 0, 1,
-2.223433, -1.205661, -2.423867, 1, 0.05490196, 0, 1,
-2.21704, -0.5683088, -1.23897, 1, 0.05882353, 0, 1,
-2.147707, 1.410978, 0.2926609, 1, 0.06666667, 0, 1,
-2.122042, 0.2608838, -1.285017, 1, 0.07058824, 0, 1,
-2.117973, -0.3419485, -2.511413, 1, 0.07843138, 0, 1,
-2.096328, 0.2950846, 0.2816174, 1, 0.08235294, 0, 1,
-2.083714, -0.4649599, -2.212981, 1, 0.09019608, 0, 1,
-2.036206, 0.4547802, -1.628824, 1, 0.09411765, 0, 1,
-2.028175, 0.4070534, 0.9502388, 1, 0.1019608, 0, 1,
-1.965022, -0.7273066, -1.604034, 1, 0.1098039, 0, 1,
-1.946288, -0.376895, -0.6169802, 1, 0.1137255, 0, 1,
-1.942027, 0.6215407, -0.6613219, 1, 0.1215686, 0, 1,
-1.938296, -0.1473798, 0.07827087, 1, 0.1254902, 0, 1,
-1.910732, 0.002701753, -2.12485, 1, 0.1333333, 0, 1,
-1.909618, -0.9289182, -1.608587, 1, 0.1372549, 0, 1,
-1.875359, 0.3874644, -0.6605754, 1, 0.145098, 0, 1,
-1.854347, -1.888363, -2.442294, 1, 0.1490196, 0, 1,
-1.840866, -2.029114, -2.272225, 1, 0.1568628, 0, 1,
-1.831744, 1.501555, 0.01627611, 1, 0.1607843, 0, 1,
-1.831158, 0.7560036, -1.566664, 1, 0.1686275, 0, 1,
-1.788315, -1.237657, -2.282276, 1, 0.172549, 0, 1,
-1.77988, -1.30274, -2.844983, 1, 0.1803922, 0, 1,
-1.77548, -0.9946024, -2.039667, 1, 0.1843137, 0, 1,
-1.759983, -0.4201787, -2.053331, 1, 0.1921569, 0, 1,
-1.758538, 0.20636, -1.37686, 1, 0.1960784, 0, 1,
-1.747048, -2.280224, -2.188511, 1, 0.2039216, 0, 1,
-1.727451, -0.8135763, -3.722356, 1, 0.2117647, 0, 1,
-1.718227, -0.3758336, -1.902961, 1, 0.2156863, 0, 1,
-1.690975, -0.08150633, -0.97531, 1, 0.2235294, 0, 1,
-1.670719, 0.9216729, -0.2091065, 1, 0.227451, 0, 1,
-1.665116, -0.04261293, 0.01968116, 1, 0.2352941, 0, 1,
-1.656369, -0.184035, -2.269609, 1, 0.2392157, 0, 1,
-1.638654, 0.3803568, -0.847078, 1, 0.2470588, 0, 1,
-1.63211, -0.4410717, -2.441099, 1, 0.2509804, 0, 1,
-1.626151, 1.161265, 0.606666, 1, 0.2588235, 0, 1,
-1.61979, -0.5059077, -2.839319, 1, 0.2627451, 0, 1,
-1.610641, -0.7542599, -2.631066, 1, 0.2705882, 0, 1,
-1.60235, -0.5730654, -1.850538, 1, 0.2745098, 0, 1,
-1.59594, 1.007493, -1.370142, 1, 0.282353, 0, 1,
-1.589203, -1.024502, -1.257319, 1, 0.2862745, 0, 1,
-1.553091, 1.570407, -0.7954802, 1, 0.2941177, 0, 1,
-1.543573, -2.102028, -2.764543, 1, 0.3019608, 0, 1,
-1.531186, -0.58675, -3.311301, 1, 0.3058824, 0, 1,
-1.485511, -0.1571099, -1.641888, 1, 0.3137255, 0, 1,
-1.478369, 0.2142677, -0.146124, 1, 0.3176471, 0, 1,
-1.476501, -0.8540077, -1.455249, 1, 0.3254902, 0, 1,
-1.464244, 0.1867961, -1.956429, 1, 0.3294118, 0, 1,
-1.46297, -1.216057, -2.149781, 1, 0.3372549, 0, 1,
-1.452544, -0.8807524, -4.285064, 1, 0.3411765, 0, 1,
-1.428999, 0.8312368, -1.728776, 1, 0.3490196, 0, 1,
-1.419516, 0.7508929, -1.02716, 1, 0.3529412, 0, 1,
-1.419097, 0.3463843, -2.414171, 1, 0.3607843, 0, 1,
-1.409649, -0.2041467, -0.4313039, 1, 0.3647059, 0, 1,
-1.407769, 0.00218916, -1.788598, 1, 0.372549, 0, 1,
-1.40494, 0.6712095, 0.3922607, 1, 0.3764706, 0, 1,
-1.393719, 0.8453812, -0.2572131, 1, 0.3843137, 0, 1,
-1.392796, 0.2341849, -0.1544421, 1, 0.3882353, 0, 1,
-1.387721, 2.896921, -1.400144, 1, 0.3960784, 0, 1,
-1.382993, 1.059777, -0.1638052, 1, 0.4039216, 0, 1,
-1.381673, 1.515488, -1.769692, 1, 0.4078431, 0, 1,
-1.379561, -0.1490953, -3.395751, 1, 0.4156863, 0, 1,
-1.362371, -0.4549451, -1.985083, 1, 0.4196078, 0, 1,
-1.360074, 1.343811, -1.265091, 1, 0.427451, 0, 1,
-1.356313, -0.2000699, -1.995962, 1, 0.4313726, 0, 1,
-1.352241, 0.3361131, -1.99391, 1, 0.4392157, 0, 1,
-1.350288, 0.5509363, -2.363041, 1, 0.4431373, 0, 1,
-1.334509, 1.174173, -1.002065, 1, 0.4509804, 0, 1,
-1.33341, -0.1198533, -0.3835508, 1, 0.454902, 0, 1,
-1.324084, -1.26216, -0.1846688, 1, 0.4627451, 0, 1,
-1.324025, -0.7360778, -1.800418, 1, 0.4666667, 0, 1,
-1.315492, 0.8120062, -1.530423, 1, 0.4745098, 0, 1,
-1.314726, -0.9348105, -2.350548, 1, 0.4784314, 0, 1,
-1.310298, -0.2671454, -2.803805, 1, 0.4862745, 0, 1,
-1.303358, 1.086751, -0.621533, 1, 0.4901961, 0, 1,
-1.302111, 0.6139898, -0.7267235, 1, 0.4980392, 0, 1,
-1.30171, -0.2953211, -2.126515, 1, 0.5058824, 0, 1,
-1.293124, 1.041035, -0.6804561, 1, 0.509804, 0, 1,
-1.290383, 1.38137, 0.8689316, 1, 0.5176471, 0, 1,
-1.289721, -0.6744538, -2.782574, 1, 0.5215687, 0, 1,
-1.282224, 1.290904, -1.705415, 1, 0.5294118, 0, 1,
-1.279015, 1.110421, -0.200088, 1, 0.5333334, 0, 1,
-1.254012, 1.019603, -1.617528, 1, 0.5411765, 0, 1,
-1.245283, 0.8804352, -1.094232, 1, 0.5450981, 0, 1,
-1.238156, 0.518462, 0.2693886, 1, 0.5529412, 0, 1,
-1.229852, -1.36388, -2.453176, 1, 0.5568628, 0, 1,
-1.217636, -0.9287387, -2.774129, 1, 0.5647059, 0, 1,
-1.215083, 1.177317, -0.7124594, 1, 0.5686275, 0, 1,
-1.20794, 0.553769, -0.3703576, 1, 0.5764706, 0, 1,
-1.200502, -1.0377, -1.678151, 1, 0.5803922, 0, 1,
-1.197174, 0.6359636, -0.8938691, 1, 0.5882353, 0, 1,
-1.193147, 0.2211747, -3.748132, 1, 0.5921569, 0, 1,
-1.192422, -2.051937, -2.803125, 1, 0.6, 0, 1,
-1.19095, -0.1717712, -1.600917, 1, 0.6078432, 0, 1,
-1.182885, -1.853698, -1.666217, 1, 0.6117647, 0, 1,
-1.174351, 1.835227, -0.1148207, 1, 0.6196079, 0, 1,
-1.169173, 0.1535529, 0.007541758, 1, 0.6235294, 0, 1,
-1.165559, 1.506859, -0.07237657, 1, 0.6313726, 0, 1,
-1.163041, -0.1838173, -0.4798426, 1, 0.6352941, 0, 1,
-1.1562, -0.2818204, -1.708559, 1, 0.6431373, 0, 1,
-1.152038, -0.3151824, -2.780494, 1, 0.6470588, 0, 1,
-1.146682, 0.7995424, -1.10603, 1, 0.654902, 0, 1,
-1.140009, -1.279497, -1.857013, 1, 0.6588235, 0, 1,
-1.132803, 0.4263553, -1.420172, 1, 0.6666667, 0, 1,
-1.129905, 2.809038, -1.130373, 1, 0.6705883, 0, 1,
-1.127465, -0.4274009, -1.073179, 1, 0.6784314, 0, 1,
-1.126427, -1.392541, -1.318805, 1, 0.682353, 0, 1,
-1.125845, 1.343999, -0.9116216, 1, 0.6901961, 0, 1,
-1.113403, -1.035762, -0.8587883, 1, 0.6941177, 0, 1,
-1.111691, -0.5955406, -0.903505, 1, 0.7019608, 0, 1,
-1.111158, 0.2192186, -2.612318, 1, 0.7098039, 0, 1,
-1.107868, 0.3189762, -2.32791, 1, 0.7137255, 0, 1,
-1.105433, -0.9722394, -2.718762, 1, 0.7215686, 0, 1,
-1.101422, -0.7766049, -1.805072, 1, 0.7254902, 0, 1,
-1.099593, 1.934532, 0.8104224, 1, 0.7333333, 0, 1,
-1.097046, -0.6068286, -1.847975, 1, 0.7372549, 0, 1,
-1.094879, -1.036589, -2.281004, 1, 0.7450981, 0, 1,
-1.093053, -1.337876, -3.641196, 1, 0.7490196, 0, 1,
-1.090609, -1.329556, -4.244102, 1, 0.7568628, 0, 1,
-1.089028, -0.1387831, -2.20293, 1, 0.7607843, 0, 1,
-1.078502, -0.5527328, -3.862092, 1, 0.7686275, 0, 1,
-1.078315, -0.227406, -0.9884573, 1, 0.772549, 0, 1,
-1.078163, 0.6305562, -0.05634446, 1, 0.7803922, 0, 1,
-1.076848, 0.7119839, -0.9908687, 1, 0.7843137, 0, 1,
-1.074441, -0.3082698, -0.462186, 1, 0.7921569, 0, 1,
-1.07409, -1.173231, -1.500511, 1, 0.7960784, 0, 1,
-1.067596, 1.004032, -2.338762, 1, 0.8039216, 0, 1,
-1.062391, -1.139125, -2.864282, 1, 0.8117647, 0, 1,
-1.060306, 0.2261597, 0.7270332, 1, 0.8156863, 0, 1,
-1.059866, -0.2623252, -2.229003, 1, 0.8235294, 0, 1,
-1.057925, 1.112631, -1.551353, 1, 0.827451, 0, 1,
-1.055044, 0.9115365, -1.648411, 1, 0.8352941, 0, 1,
-1.052657, 0.1635211, -2.033804, 1, 0.8392157, 0, 1,
-1.052584, -0.4279505, -2.961954, 1, 0.8470588, 0, 1,
-1.051711, -1.58286, -1.206262, 1, 0.8509804, 0, 1,
-1.04857, 0.2905562, -3.367279, 1, 0.8588235, 0, 1,
-1.048064, 1.910451, -1.038274, 1, 0.8627451, 0, 1,
-1.04639, -0.9317682, -3.000788, 1, 0.8705882, 0, 1,
-1.045198, -1.473455, -2.87699, 1, 0.8745098, 0, 1,
-1.041633, -1.279636, -3.028076, 1, 0.8823529, 0, 1,
-1.035926, 2.167779, -0.3872483, 1, 0.8862745, 0, 1,
-1.033285, -1.822669, -3.622644, 1, 0.8941177, 0, 1,
-1.032191, 0.9150329, -0.4620512, 1, 0.8980392, 0, 1,
-1.02732, 1.354087, 0.08486473, 1, 0.9058824, 0, 1,
-1.025281, -1.037692, -1.979075, 1, 0.9137255, 0, 1,
-1.024386, 1.91317, -0.6857117, 1, 0.9176471, 0, 1,
-1.020502, -2.420543, -2.80449, 1, 0.9254902, 0, 1,
-0.9949495, 1.313086, -1.3258, 1, 0.9294118, 0, 1,
-0.993333, 0.6222754, 0.2658501, 1, 0.9372549, 0, 1,
-0.9856929, 0.09024511, -0.4363635, 1, 0.9411765, 0, 1,
-0.9821182, -0.4931124, -3.223932, 1, 0.9490196, 0, 1,
-0.9787179, 0.2350224, -2.16129, 1, 0.9529412, 0, 1,
-0.9772366, 0.05622633, -1.923278, 1, 0.9607843, 0, 1,
-0.9697917, -3.063886, -3.247605, 1, 0.9647059, 0, 1,
-0.9673931, 0.7716504, -0.9594159, 1, 0.972549, 0, 1,
-0.965782, -0.34489, -3.627236, 1, 0.9764706, 0, 1,
-0.9620008, 0.3562885, -2.864798, 1, 0.9843137, 0, 1,
-0.9617306, 1.160394, -0.4401831, 1, 0.9882353, 0, 1,
-0.9576692, -0.7324653, -1.711329, 1, 0.9960784, 0, 1,
-0.9544466, 0.6320243, -2.677762, 0.9960784, 1, 0, 1,
-0.9528183, 0.2892781, -0.9457842, 0.9921569, 1, 0, 1,
-0.9525791, 0.3061413, -2.604368, 0.9843137, 1, 0, 1,
-0.9510764, 0.2495984, -0.5107365, 0.9803922, 1, 0, 1,
-0.9445726, 0.1362232, -1.781204, 0.972549, 1, 0, 1,
-0.943083, 0.1404711, -1.148288, 0.9686275, 1, 0, 1,
-0.9407916, -0.5641148, -2.762002, 0.9607843, 1, 0, 1,
-0.9381216, 0.3815971, -1.808268, 0.9568627, 1, 0, 1,
-0.9347676, 2.38762, -2.746885, 0.9490196, 1, 0, 1,
-0.929799, 0.2064602, -3.116596, 0.945098, 1, 0, 1,
-0.9222404, 0.004706935, -0.5829166, 0.9372549, 1, 0, 1,
-0.9179285, -0.3538901, -1.985144, 0.9333333, 1, 0, 1,
-0.9176216, -0.7180331, -3.465813, 0.9254902, 1, 0, 1,
-0.9127143, 0.2635855, -2.770338, 0.9215686, 1, 0, 1,
-0.9124432, 0.3142612, -1.496079, 0.9137255, 1, 0, 1,
-0.9123474, 1.428473, -0.7063358, 0.9098039, 1, 0, 1,
-0.9116448, 1.39721, -2.424469, 0.9019608, 1, 0, 1,
-0.9091813, -0.650688, -3.938947, 0.8941177, 1, 0, 1,
-0.9044238, 0.3560022, -2.376338, 0.8901961, 1, 0, 1,
-0.9036332, 0.3173178, -0.6231338, 0.8823529, 1, 0, 1,
-0.9034194, 0.7877735, 0.4605715, 0.8784314, 1, 0, 1,
-0.9003537, -0.1652584, -1.272631, 0.8705882, 1, 0, 1,
-0.8992091, 0.7336609, -1.373328, 0.8666667, 1, 0, 1,
-0.895784, -0.6249249, -2.685682, 0.8588235, 1, 0, 1,
-0.8953837, -1.147039, -2.449249, 0.854902, 1, 0, 1,
-0.8944667, 0.08796293, -1.995633, 0.8470588, 1, 0, 1,
-0.8942227, -1.244886, -2.746146, 0.8431373, 1, 0, 1,
-0.8941884, -0.1142571, -1.659738, 0.8352941, 1, 0, 1,
-0.8923186, -0.05336624, -2.661261, 0.8313726, 1, 0, 1,
-0.8821614, 0.3356281, -0.9793529, 0.8235294, 1, 0, 1,
-0.8812715, 0.9458394, -1.038366, 0.8196079, 1, 0, 1,
-0.87349, -0.1625439, 1.35418, 0.8117647, 1, 0, 1,
-0.87088, 1.407757, -2.180443, 0.8078431, 1, 0, 1,
-0.8636595, 0.4617051, 0.47304, 0.8, 1, 0, 1,
-0.8599114, -0.6300813, -2.185663, 0.7921569, 1, 0, 1,
-0.8573118, 0.5155048, -1.119427, 0.7882353, 1, 0, 1,
-0.8567451, 0.4187915, -0.5199497, 0.7803922, 1, 0, 1,
-0.8548951, 0.4806951, -2.200188, 0.7764706, 1, 0, 1,
-0.8548225, -0.2167948, -3.681958, 0.7686275, 1, 0, 1,
-0.8525398, -0.3329417, -1.221161, 0.7647059, 1, 0, 1,
-0.8522086, -0.8221391, -1.819533, 0.7568628, 1, 0, 1,
-0.8501814, -0.887587, -3.021737, 0.7529412, 1, 0, 1,
-0.8495715, 0.504666, -1.304514, 0.7450981, 1, 0, 1,
-0.8450528, 0.283228, -3.442163, 0.7411765, 1, 0, 1,
-0.8447063, 1.623015, 0.792986, 0.7333333, 1, 0, 1,
-0.8446925, 0.1933714, -1.691917, 0.7294118, 1, 0, 1,
-0.8385555, -1.086418, -1.071509, 0.7215686, 1, 0, 1,
-0.8369799, -0.48296, -3.071645, 0.7176471, 1, 0, 1,
-0.8359013, 2.40723e-05, -0.6586514, 0.7098039, 1, 0, 1,
-0.8293223, 0.1644008, -4.053391, 0.7058824, 1, 0, 1,
-0.8278387, -0.9370722, -2.797094, 0.6980392, 1, 0, 1,
-0.8233575, -0.1496063, -2.440313, 0.6901961, 1, 0, 1,
-0.8226885, -1.343238, -2.214359, 0.6862745, 1, 0, 1,
-0.821997, 0.2321797, -1.039007, 0.6784314, 1, 0, 1,
-0.8161787, -0.422132, -1.933877, 0.6745098, 1, 0, 1,
-0.8154532, 1.210252, -2.216063, 0.6666667, 1, 0, 1,
-0.8067883, 2.080604, 0.1110123, 0.6627451, 1, 0, 1,
-0.8043982, -0.4216002, -1.115605, 0.654902, 1, 0, 1,
-0.8003199, 0.2379536, -0.4692036, 0.6509804, 1, 0, 1,
-0.7999605, 1.759313, 0.8545553, 0.6431373, 1, 0, 1,
-0.7849826, 0.9942655, 0.5665311, 0.6392157, 1, 0, 1,
-0.7832539, -0.0193725, -1.225252, 0.6313726, 1, 0, 1,
-0.7772911, 0.9268128, 0.77155, 0.627451, 1, 0, 1,
-0.7757015, 0.1403874, -0.3764288, 0.6196079, 1, 0, 1,
-0.7749819, 0.3144114, -2.450515, 0.6156863, 1, 0, 1,
-0.7730119, -0.9948909, -0.9630877, 0.6078432, 1, 0, 1,
-0.7708455, 0.9646784, -2.271538, 0.6039216, 1, 0, 1,
-0.7591679, -2.47019, -3.419837, 0.5960785, 1, 0, 1,
-0.7587194, -1.045248, -3.164017, 0.5882353, 1, 0, 1,
-0.7585921, 0.2991964, -2.17441, 0.5843138, 1, 0, 1,
-0.7544616, -0.3123119, -1.821099, 0.5764706, 1, 0, 1,
-0.7468685, -1.348706, -2.192065, 0.572549, 1, 0, 1,
-0.7437742, 1.005533, 0.3309746, 0.5647059, 1, 0, 1,
-0.7400907, 0.1636024, -3.040305, 0.5607843, 1, 0, 1,
-0.7348148, 1.090418, -1.841964, 0.5529412, 1, 0, 1,
-0.733542, -0.4581879, -0.8351223, 0.5490196, 1, 0, 1,
-0.7326079, 0.5962855, -2.1504, 0.5411765, 1, 0, 1,
-0.7296168, 0.7535171, -0.08999889, 0.5372549, 1, 0, 1,
-0.7292192, 0.6968595, 0.08085871, 0.5294118, 1, 0, 1,
-0.7291175, 1.066342, -1.96856, 0.5254902, 1, 0, 1,
-0.7284222, 0.1698267, -1.014353, 0.5176471, 1, 0, 1,
-0.7273964, 0.06908605, 0.4663969, 0.5137255, 1, 0, 1,
-0.7261711, -0.03069732, -1.254658, 0.5058824, 1, 0, 1,
-0.7243686, 1.284903, -2.080117, 0.5019608, 1, 0, 1,
-0.7217535, 1.925521, -1.836426, 0.4941176, 1, 0, 1,
-0.721166, -0.1502387, -2.911217, 0.4862745, 1, 0, 1,
-0.7174589, -1.83884, -2.058036, 0.4823529, 1, 0, 1,
-0.7171203, 1.673828, -0.947558, 0.4745098, 1, 0, 1,
-0.7126775, -0.8805705, -3.059354, 0.4705882, 1, 0, 1,
-0.7093185, -0.5241526, -0.06975651, 0.4627451, 1, 0, 1,
-0.7085333, -0.6219003, -1.856578, 0.4588235, 1, 0, 1,
-0.6934758, -1.120502, -2.448195, 0.4509804, 1, 0, 1,
-0.6915362, 1.749707, 0.3591355, 0.4470588, 1, 0, 1,
-0.6892347, -1.332753, -3.916327, 0.4392157, 1, 0, 1,
-0.6885753, 0.01009066, -3.055936, 0.4352941, 1, 0, 1,
-0.6883547, -0.2818861, -1.346815, 0.427451, 1, 0, 1,
-0.6836436, 0.5831009, -1.262561, 0.4235294, 1, 0, 1,
-0.6824228, -0.3592907, -2.277963, 0.4156863, 1, 0, 1,
-0.6819994, 0.3816315, -0.4292739, 0.4117647, 1, 0, 1,
-0.6806248, -0.4829806, -1.325704, 0.4039216, 1, 0, 1,
-0.6785589, -0.3399357, -1.77584, 0.3960784, 1, 0, 1,
-0.6652321, 0.8344649, -1.690078, 0.3921569, 1, 0, 1,
-0.6555153, 0.3075045, -1.250715, 0.3843137, 1, 0, 1,
-0.6548188, 0.7170514, -1.712488, 0.3803922, 1, 0, 1,
-0.6500335, -0.02038166, -2.641878, 0.372549, 1, 0, 1,
-0.6487032, -0.2195579, -1.956124, 0.3686275, 1, 0, 1,
-0.6457105, 1.046957, -0.9963853, 0.3607843, 1, 0, 1,
-0.6332704, -1.655717, -2.568868, 0.3568628, 1, 0, 1,
-0.6249102, -1.844327, -1.891397, 0.3490196, 1, 0, 1,
-0.6248537, 2.428922, -0.3522175, 0.345098, 1, 0, 1,
-0.6244429, -0.06052215, -1.027759, 0.3372549, 1, 0, 1,
-0.6240292, 0.4765694, -1.527003, 0.3333333, 1, 0, 1,
-0.6218322, -0.1352849, 0.06125975, 0.3254902, 1, 0, 1,
-0.621545, 0.7089233, -0.3355953, 0.3215686, 1, 0, 1,
-0.6206857, 0.1301288, -0.8042718, 0.3137255, 1, 0, 1,
-0.6202568, 2.749197, -0.3695209, 0.3098039, 1, 0, 1,
-0.6145322, 0.5861911, 0.6187888, 0.3019608, 1, 0, 1,
-0.6038482, 0.5399633, -1.750278, 0.2941177, 1, 0, 1,
-0.6030321, 0.6260076, -0.4937117, 0.2901961, 1, 0, 1,
-0.6026888, 0.638032, -0.1858844, 0.282353, 1, 0, 1,
-0.6025696, -0.4075858, -1.008144, 0.2784314, 1, 0, 1,
-0.5889034, -0.2570517, -2.604511, 0.2705882, 1, 0, 1,
-0.5845237, 0.3412547, -0.2424398, 0.2666667, 1, 0, 1,
-0.5828373, -0.3884005, -2.467923, 0.2588235, 1, 0, 1,
-0.5814724, 0.3850721, -0.5610523, 0.254902, 1, 0, 1,
-0.5724741, 0.9516776, -1.018946, 0.2470588, 1, 0, 1,
-0.566153, 1.298816, -1.922333, 0.2431373, 1, 0, 1,
-0.5646954, 1.592228, 0.5425536, 0.2352941, 1, 0, 1,
-0.5611733, 1.232856, 0.2177979, 0.2313726, 1, 0, 1,
-0.5568609, 0.717038, -0.6811457, 0.2235294, 1, 0, 1,
-0.5564963, -0.774075, -1.055261, 0.2196078, 1, 0, 1,
-0.553267, -1.099111, -0.8453542, 0.2117647, 1, 0, 1,
-0.5524524, -0.4287887, -1.324574, 0.2078431, 1, 0, 1,
-0.5473921, -0.284468, -2.017319, 0.2, 1, 0, 1,
-0.5447212, 0.1533716, -0.8938254, 0.1921569, 1, 0, 1,
-0.5445089, -0.2162094, -1.949688, 0.1882353, 1, 0, 1,
-0.5440748, -0.2731818, -1.896243, 0.1803922, 1, 0, 1,
-0.541575, -0.08547635, -1.748671, 0.1764706, 1, 0, 1,
-0.540962, 0.9483188, -0.5184152, 0.1686275, 1, 0, 1,
-0.5386623, -0.9488336, -2.430044, 0.1647059, 1, 0, 1,
-0.5384813, 0.8369329, 0.3281143, 0.1568628, 1, 0, 1,
-0.5340138, -0.7229908, -3.412776, 0.1529412, 1, 0, 1,
-0.5318301, 1.051015, -1.77141, 0.145098, 1, 0, 1,
-0.5269622, -1.899408, -2.47162, 0.1411765, 1, 0, 1,
-0.5255254, -0.9439242, -3.715632, 0.1333333, 1, 0, 1,
-0.5231499, -0.7769465, -1.038181, 0.1294118, 1, 0, 1,
-0.5211377, 0.3880346, 0.2381317, 0.1215686, 1, 0, 1,
-0.519784, -0.1918092, -1.442591, 0.1176471, 1, 0, 1,
-0.517276, 1.609009, 1.477778, 0.1098039, 1, 0, 1,
-0.5142952, 1.094438, -0.1004255, 0.1058824, 1, 0, 1,
-0.5114155, -0.536799, -1.241717, 0.09803922, 1, 0, 1,
-0.5076686, -0.6692291, -2.793678, 0.09019608, 1, 0, 1,
-0.5059088, -0.4578162, -3.593289, 0.08627451, 1, 0, 1,
-0.501901, 1.949141, -0.1991128, 0.07843138, 1, 0, 1,
-0.5013794, -2.958617, -3.041644, 0.07450981, 1, 0, 1,
-0.4986367, -2.043453, -2.249708, 0.06666667, 1, 0, 1,
-0.4931015, -1.454632, -0.7953417, 0.0627451, 1, 0, 1,
-0.4924427, -1.167607, -1.873202, 0.05490196, 1, 0, 1,
-0.4915859, 1.880798, 0.9920566, 0.05098039, 1, 0, 1,
-0.4875658, 0.06551889, -2.279888, 0.04313726, 1, 0, 1,
-0.4834114, 0.5452579, -2.098534, 0.03921569, 1, 0, 1,
-0.4762488, 0.6773748, 0.3906611, 0.03137255, 1, 0, 1,
-0.4720596, 1.59758, -1.312754, 0.02745098, 1, 0, 1,
-0.4647635, -0.6027576, -1.306535, 0.01960784, 1, 0, 1,
-0.4640478, 1.10955, -1.199046, 0.01568628, 1, 0, 1,
-0.4632168, -0.463779, -1.925815, 0.007843138, 1, 0, 1,
-0.4599264, -0.1795579, -1.890772, 0.003921569, 1, 0, 1,
-0.4562694, -0.2432559, -3.863415, 0, 1, 0.003921569, 1,
-0.4513442, -0.1886978, -1.602818, 0, 1, 0.01176471, 1,
-0.4512466, 0.009575931, -0.3791857, 0, 1, 0.01568628, 1,
-0.449094, 0.4990695, 0.7906158, 0, 1, 0.02352941, 1,
-0.4489976, -0.305742, -2.889363, 0, 1, 0.02745098, 1,
-0.4432731, 2.10785, 0.2548556, 0, 1, 0.03529412, 1,
-0.4254116, -1.271497, -2.573025, 0, 1, 0.03921569, 1,
-0.4212143, -0.7185836, -2.076773, 0, 1, 0.04705882, 1,
-0.4203528, 1.103913, 0.9696132, 0, 1, 0.05098039, 1,
-0.4187382, -0.5087678, -1.390111, 0, 1, 0.05882353, 1,
-0.4183071, 0.6093274, 0.3679713, 0, 1, 0.0627451, 1,
-0.4172918, -0.3538016, -3.796579, 0, 1, 0.07058824, 1,
-0.4168011, 1.02146, -1.05814, 0, 1, 0.07450981, 1,
-0.4140372, 1.168276, -1.149543, 0, 1, 0.08235294, 1,
-0.4118727, -0.1294042, -2.915832, 0, 1, 0.08627451, 1,
-0.4097673, -0.408314, -3.082964, 0, 1, 0.09411765, 1,
-0.408587, -0.7401798, -2.71538, 0, 1, 0.1019608, 1,
-0.4035303, -0.76389, -2.512112, 0, 1, 0.1058824, 1,
-0.4032289, 0.08102205, -0.9693523, 0, 1, 0.1137255, 1,
-0.402749, 1.335484, 0.720691, 0, 1, 0.1176471, 1,
-0.3956685, 3.890409, 0.538718, 0, 1, 0.1254902, 1,
-0.3932336, -1.102899, -2.770424, 0, 1, 0.1294118, 1,
-0.3888653, 1.745404, 1.246932, 0, 1, 0.1372549, 1,
-0.3862129, 0.5316601, -0.8438254, 0, 1, 0.1411765, 1,
-0.3795256, -1.189606, -2.708458, 0, 1, 0.1490196, 1,
-0.3738195, 0.5502791, 0.706376, 0, 1, 0.1529412, 1,
-0.3717905, 1.089377, -0.6596196, 0, 1, 0.1607843, 1,
-0.3710751, -4.032121, -3.825573, 0, 1, 0.1647059, 1,
-0.370099, -0.6737098, -2.230884, 0, 1, 0.172549, 1,
-0.3675102, -1.319521, -4.371254, 0, 1, 0.1764706, 1,
-0.3609338, -0.8163595, -2.899441, 0, 1, 0.1843137, 1,
-0.3607561, -0.5862012, -2.052078, 0, 1, 0.1882353, 1,
-0.3545708, 1.443364, 1.930166, 0, 1, 0.1960784, 1,
-0.3494595, 0.9679022, 0.5288155, 0, 1, 0.2039216, 1,
-0.3480964, 1.13196, 1.301964, 0, 1, 0.2078431, 1,
-0.3475159, -0.3486226, -0.2911312, 0, 1, 0.2156863, 1,
-0.346382, 1.618613, 0.2047188, 0, 1, 0.2196078, 1,
-0.3373641, 0.1950043, -0.4175661, 0, 1, 0.227451, 1,
-0.3365785, -1.612822, -3.410469, 0, 1, 0.2313726, 1,
-0.3344005, -0.008438116, -0.3795263, 0, 1, 0.2392157, 1,
-0.3275835, 1.703743, 1.625534, 0, 1, 0.2431373, 1,
-0.3272168, 1.406969, 0.213456, 0, 1, 0.2509804, 1,
-0.3249774, -0.1539664, -1.235196, 0, 1, 0.254902, 1,
-0.3240432, -1.369303, -2.033305, 0, 1, 0.2627451, 1,
-0.3235147, -0.6824102, -1.854933, 0, 1, 0.2666667, 1,
-0.3218814, 0.470816, -3.077204, 0, 1, 0.2745098, 1,
-0.3199643, -0.0544275, -2.385627, 0, 1, 0.2784314, 1,
-0.3197237, 0.9848109, -0.1647323, 0, 1, 0.2862745, 1,
-0.3191561, 0.6976448, -0.8569227, 0, 1, 0.2901961, 1,
-0.3070755, -0.1466291, -4.094966, 0, 1, 0.2980392, 1,
-0.3064731, -0.3170818, -2.970601, 0, 1, 0.3058824, 1,
-0.3055883, -0.3252389, -1.773504, 0, 1, 0.3098039, 1,
-0.3045073, -1.014216, -2.757311, 0, 1, 0.3176471, 1,
-0.3036017, -0.09451272, -1.869649, 0, 1, 0.3215686, 1,
-0.3035962, -0.02218483, -1.168579, 0, 1, 0.3294118, 1,
-0.3029165, -0.4431627, -3.916172, 0, 1, 0.3333333, 1,
-0.3022462, -1.816471, -2.808257, 0, 1, 0.3411765, 1,
-0.2987539, -1.116431, -2.440675, 0, 1, 0.345098, 1,
-0.294076, -0.7725211, -1.487208, 0, 1, 0.3529412, 1,
-0.2891987, 0.5524036, -0.1864549, 0, 1, 0.3568628, 1,
-0.2844392, -0.127854, -1.115503, 0, 1, 0.3647059, 1,
-0.2837082, -0.9707192, -2.687241, 0, 1, 0.3686275, 1,
-0.2828416, 0.5305757, 1.888105, 0, 1, 0.3764706, 1,
-0.2757925, -0.3951777, -3.706295, 0, 1, 0.3803922, 1,
-0.2708304, -0.01695739, -1.785585, 0, 1, 0.3882353, 1,
-0.2677513, 1.094779, 0.9801337, 0, 1, 0.3921569, 1,
-0.2616553, 0.3260433, -0.2631468, 0, 1, 0.4, 1,
-0.2602248, 0.6743345, -0.9655746, 0, 1, 0.4078431, 1,
-0.2584785, 0.4473891, 0.8002424, 0, 1, 0.4117647, 1,
-0.2560562, -0.3968763, -4.369982, 0, 1, 0.4196078, 1,
-0.255378, -1.752401, -3.693149, 0, 1, 0.4235294, 1,
-0.2549418, 0.8220065, 0.3079927, 0, 1, 0.4313726, 1,
-0.2539441, -0.6666162, -1.486822, 0, 1, 0.4352941, 1,
-0.2538174, -1.246997, -2.699374, 0, 1, 0.4431373, 1,
-0.2524101, 0.9060003, 0.7155874, 0, 1, 0.4470588, 1,
-0.2505101, -0.04746832, -2.020082, 0, 1, 0.454902, 1,
-0.2502973, -0.5946192, -3.955594, 0, 1, 0.4588235, 1,
-0.2428534, -1.225651, -2.642735, 0, 1, 0.4666667, 1,
-0.2399964, -1.552621, -2.308066, 0, 1, 0.4705882, 1,
-0.2398613, 0.5589404, -1.02451, 0, 1, 0.4784314, 1,
-0.2380141, -1.108756, -3.711352, 0, 1, 0.4823529, 1,
-0.2370023, -0.6398087, -3.218538, 0, 1, 0.4901961, 1,
-0.2354073, 0.6913444, 1.309772, 0, 1, 0.4941176, 1,
-0.2343799, 1.000585, 0.03613301, 0, 1, 0.5019608, 1,
-0.2333782, 0.2778476, -1.713473, 0, 1, 0.509804, 1,
-0.2272934, 0.8503775, -1.265099, 0, 1, 0.5137255, 1,
-0.2271407, -1.660037, -2.915496, 0, 1, 0.5215687, 1,
-0.2203941, 0.0279224, -1.530247, 0, 1, 0.5254902, 1,
-0.2176923, 0.02490525, -3.838181, 0, 1, 0.5333334, 1,
-0.2128705, -0.3155357, -1.74472, 0, 1, 0.5372549, 1,
-0.2098561, -0.1651646, -3.040224, 0, 1, 0.5450981, 1,
-0.2085062, 0.3046003, 0.315448, 0, 1, 0.5490196, 1,
-0.2066833, 0.1620617, -0.8438329, 0, 1, 0.5568628, 1,
-0.2059042, -0.8794816, -3.161898, 0, 1, 0.5607843, 1,
-0.2037705, 2.003526, 0.8644766, 0, 1, 0.5686275, 1,
-0.1987496, -0.05952024, -1.510628, 0, 1, 0.572549, 1,
-0.1980783, -0.1102692, -3.33111, 0, 1, 0.5803922, 1,
-0.1977051, -1.180098, -2.09896, 0, 1, 0.5843138, 1,
-0.1963717, 0.914928, 0.1390971, 0, 1, 0.5921569, 1,
-0.1950842, -0.9806649, -3.855682, 0, 1, 0.5960785, 1,
-0.1933093, -1.689861, -5.292639, 0, 1, 0.6039216, 1,
-0.1916231, -0.5226134, -3.991606, 0, 1, 0.6117647, 1,
-0.189491, 0.08266727, -2.200423, 0, 1, 0.6156863, 1,
-0.1894823, -1.930611, -2.27443, 0, 1, 0.6235294, 1,
-0.1876638, 0.4968021, -1.108933, 0, 1, 0.627451, 1,
-0.1823246, -0.1474136, -3.161638, 0, 1, 0.6352941, 1,
-0.1814248, -0.1926092, -1.707757, 0, 1, 0.6392157, 1,
-0.1812914, -0.4807065, -1.857674, 0, 1, 0.6470588, 1,
-0.1738616, 0.04155421, -3.442441, 0, 1, 0.6509804, 1,
-0.1729125, 1.236024, -1.644554, 0, 1, 0.6588235, 1,
-0.1706079, 0.04830375, 0.3939469, 0, 1, 0.6627451, 1,
-0.1627882, 1.398667, 0.5721551, 0, 1, 0.6705883, 1,
-0.1610203, 0.4211873, -0.7778161, 0, 1, 0.6745098, 1,
-0.158746, 1.052294, -1.416462, 0, 1, 0.682353, 1,
-0.1577424, 0.8864607, 0.5165486, 0, 1, 0.6862745, 1,
-0.1573612, -0.7308235, -2.393012, 0, 1, 0.6941177, 1,
-0.1566499, -0.8902032, -2.439111, 0, 1, 0.7019608, 1,
-0.1537395, 0.4122999, -1.257719, 0, 1, 0.7058824, 1,
-0.1493537, -1.395246, -3.599247, 0, 1, 0.7137255, 1,
-0.1487681, 1.58994, 0.6759801, 0, 1, 0.7176471, 1,
-0.1431512, -1.299668, -3.719966, 0, 1, 0.7254902, 1,
-0.1407149, 1.031726, -0.1159954, 0, 1, 0.7294118, 1,
-0.135852, -0.4026375, -2.609299, 0, 1, 0.7372549, 1,
-0.1346844, -1.741803, -3.436954, 0, 1, 0.7411765, 1,
-0.1345468, 0.8811037, -1.830076, 0, 1, 0.7490196, 1,
-0.1336256, 1.150359, 0.81273, 0, 1, 0.7529412, 1,
-0.1319012, 1.12182, -0.1510212, 0, 1, 0.7607843, 1,
-0.1291703, 1.278262, -1.311879, 0, 1, 0.7647059, 1,
-0.1261697, -0.3611077, -1.915745, 0, 1, 0.772549, 1,
-0.1164577, -0.1027319, -2.93335, 0, 1, 0.7764706, 1,
-0.1159432, 1.278367, -1.441389, 0, 1, 0.7843137, 1,
-0.1143977, 0.5399029, 0.2137931, 0, 1, 0.7882353, 1,
-0.1135349, -0.6581258, -2.230925, 0, 1, 0.7960784, 1,
-0.1130608, -0.6929944, -2.630192, 0, 1, 0.8039216, 1,
-0.1116401, 0.5856106, -2.227562, 0, 1, 0.8078431, 1,
-0.1042621, 0.08391313, -1.407466, 0, 1, 0.8156863, 1,
-0.1026949, 0.5985894, 0.2962483, 0, 1, 0.8196079, 1,
-0.1007633, 0.4343267, -0.5149829, 0, 1, 0.827451, 1,
-0.09854829, -0.05790974, -1.803928, 0, 1, 0.8313726, 1,
-0.09460992, -0.1798884, -1.957704, 0, 1, 0.8392157, 1,
-0.0930005, 1.583887, 1.208699, 0, 1, 0.8431373, 1,
-0.08679187, 0.4529622, 0.2638018, 0, 1, 0.8509804, 1,
-0.08446965, -0.006753311, -0.9076303, 0, 1, 0.854902, 1,
-0.08180158, -0.5086098, -2.749702, 0, 1, 0.8627451, 1,
-0.08172028, -0.6464176, -2.043512, 0, 1, 0.8666667, 1,
-0.073604, -0.4058047, -1.698899, 0, 1, 0.8745098, 1,
-0.06656156, 0.1284887, 0.373634, 0, 1, 0.8784314, 1,
-0.06305134, -1.823115, -4.427274, 0, 1, 0.8862745, 1,
-0.05924468, 3.723639, -0.8281429, 0, 1, 0.8901961, 1,
-0.0584495, -0.5606712, -2.486479, 0, 1, 0.8980392, 1,
-0.0572434, 0.5735642, 0.607109, 0, 1, 0.9058824, 1,
-0.05516473, -1.043104, -3.41196, 0, 1, 0.9098039, 1,
-0.05426294, 0.2010294, -0.6842047, 0, 1, 0.9176471, 1,
-0.05329806, -0.8444705, -3.169789, 0, 1, 0.9215686, 1,
-0.05307995, -0.2847787, -1.474911, 0, 1, 0.9294118, 1,
-0.05286592, 1.196058, 0.0906828, 0, 1, 0.9333333, 1,
-0.05150484, 1.319853, -0.476691, 0, 1, 0.9411765, 1,
-0.04958795, 2.143473, 1.759696, 0, 1, 0.945098, 1,
-0.04898451, -0.2646987, -2.164482, 0, 1, 0.9529412, 1,
-0.04282301, -1.123744, -2.993566, 0, 1, 0.9568627, 1,
-0.03891198, -0.3181269, -1.792403, 0, 1, 0.9647059, 1,
-0.03877834, -1.207085, -5.597683, 0, 1, 0.9686275, 1,
-0.03799213, -2.036284, -3.349621, 0, 1, 0.9764706, 1,
-0.03518546, -0.2923534, -2.107158, 0, 1, 0.9803922, 1,
-0.03407934, 0.6009737, 0.7976873, 0, 1, 0.9882353, 1,
-0.03370937, 1.076803, -1.010525, 0, 1, 0.9921569, 1,
-0.03332603, -0.321526, -3.093038, 0, 1, 1, 1,
-0.02975732, 1.1174, 0.007790732, 0, 0.9921569, 1, 1,
-0.02781153, 1.249841, 0.3771712, 0, 0.9882353, 1, 1,
-0.0254948, -1.165474, -2.975498, 0, 0.9803922, 1, 1,
-0.02286272, 1.434333, -0.5534585, 0, 0.9764706, 1, 1,
-0.01757455, 0.02941996, -0.7029541, 0, 0.9686275, 1, 1,
-0.01682573, -0.9733567, -3.578392, 0, 0.9647059, 1, 1,
-0.01574414, 0.1273879, 0.5170062, 0, 0.9568627, 1, 1,
-0.01324806, 0.7927797, 0.6525864, 0, 0.9529412, 1, 1,
-0.01165009, 2.046277, -0.09624118, 0, 0.945098, 1, 1,
-0.007840265, -0.9653702, -3.918838, 0, 0.9411765, 1, 1,
-0.005061796, -0.2669925, -1.447417, 0, 0.9333333, 1, 1,
-0.004454707, -0.4743448, -2.968378, 0, 0.9294118, 1, 1,
-0.002945185, -0.611154, -4.572085, 0, 0.9215686, 1, 1,
0.005811595, -0.1016954, 2.654561, 0, 0.9176471, 1, 1,
0.01312182, 2.454625, 0.1544222, 0, 0.9098039, 1, 1,
0.01364159, 0.1856968, 0.5457551, 0, 0.9058824, 1, 1,
0.01706839, 0.4222099, 0.5700294, 0, 0.8980392, 1, 1,
0.02550048, 0.7452252, 1.128349, 0, 0.8901961, 1, 1,
0.02649269, -0.1623214, 1.341717, 0, 0.8862745, 1, 1,
0.02740003, 1.056509, -0.7520459, 0, 0.8784314, 1, 1,
0.02831195, -1.007322, 3.957363, 0, 0.8745098, 1, 1,
0.03046534, 0.8485442, 0.1318371, 0, 0.8666667, 1, 1,
0.03294586, -0.6458032, 3.641158, 0, 0.8627451, 1, 1,
0.03312808, -1.754306, 2.981063, 0, 0.854902, 1, 1,
0.03561306, -1.397853, 3.657777, 0, 0.8509804, 1, 1,
0.03590384, -0.6614903, 1.825362, 0, 0.8431373, 1, 1,
0.03777096, -0.5931789, 3.494115, 0, 0.8392157, 1, 1,
0.03979761, 0.352767, 1.071429, 0, 0.8313726, 1, 1,
0.04026147, 0.1970862, 0.7350935, 0, 0.827451, 1, 1,
0.04225652, 1.236072, 0.2547653, 0, 0.8196079, 1, 1,
0.04316189, -1.150752, 2.706149, 0, 0.8156863, 1, 1,
0.04454756, 0.9254973, -0.350961, 0, 0.8078431, 1, 1,
0.04532541, -1.204894, 2.7954, 0, 0.8039216, 1, 1,
0.04627394, 0.7412044, -0.4768529, 0, 0.7960784, 1, 1,
0.04867502, 0.2820234, -0.1185016, 0, 0.7882353, 1, 1,
0.05115352, -0.7109371, 1.516314, 0, 0.7843137, 1, 1,
0.05155079, 0.3204299, 0.8166351, 0, 0.7764706, 1, 1,
0.05466295, -0.6684068, 2.943587, 0, 0.772549, 1, 1,
0.05658695, 1.052642, -0.4835878, 0, 0.7647059, 1, 1,
0.05707425, -0.4838573, 3.418377, 0, 0.7607843, 1, 1,
0.05913427, 0.3669092, -0.7375066, 0, 0.7529412, 1, 1,
0.06178413, 0.8812401, 0.6683488, 0, 0.7490196, 1, 1,
0.06200584, 0.1816, 0.7791545, 0, 0.7411765, 1, 1,
0.06559394, -1.977885, 2.945014, 0, 0.7372549, 1, 1,
0.06764507, -0.8080955, 3.140098, 0, 0.7294118, 1, 1,
0.07112685, 1.670326, -0.6752698, 0, 0.7254902, 1, 1,
0.07281859, 0.5192044, -1.247798, 0, 0.7176471, 1, 1,
0.07378265, -1.096458, 4.461002, 0, 0.7137255, 1, 1,
0.07524976, 0.1204612, 1.677487, 0, 0.7058824, 1, 1,
0.08322075, -0.105869, 2.892755, 0, 0.6980392, 1, 1,
0.08409123, 0.7156555, 0.4282474, 0, 0.6941177, 1, 1,
0.0872487, 0.1670045, -0.05231226, 0, 0.6862745, 1, 1,
0.08766107, 0.8363616, 0.853126, 0, 0.682353, 1, 1,
0.08971425, 0.2478933, 2.51704, 0, 0.6745098, 1, 1,
0.09148225, 0.1283015, 1.029628, 0, 0.6705883, 1, 1,
0.09895141, 1.526865, -0.9176835, 0, 0.6627451, 1, 1,
0.1011439, 1.901739, 1.497198, 0, 0.6588235, 1, 1,
0.1038171, 0.6957724, 0.5588739, 0, 0.6509804, 1, 1,
0.1039233, 0.9710146, -0.6146505, 0, 0.6470588, 1, 1,
0.1067693, -0.443222, 4.200202, 0, 0.6392157, 1, 1,
0.1070566, 0.869284, 0.9741477, 0, 0.6352941, 1, 1,
0.1124447, -0.2866721, 3.050272, 0, 0.627451, 1, 1,
0.1144219, 1.813731, -0.7690442, 0, 0.6235294, 1, 1,
0.1184902, 1.15718, -1.121743, 0, 0.6156863, 1, 1,
0.1194172, -1.046187, 2.92768, 0, 0.6117647, 1, 1,
0.1223326, 0.07811976, 1.631242, 0, 0.6039216, 1, 1,
0.1237488, 1.477581, 0.4243818, 0, 0.5960785, 1, 1,
0.1244387, -1.880344, 2.986772, 0, 0.5921569, 1, 1,
0.1259651, 0.2842878, 1.498361, 0, 0.5843138, 1, 1,
0.127609, -0.382132, 1.451259, 0, 0.5803922, 1, 1,
0.1281507, 0.3612082, 0.7668406, 0, 0.572549, 1, 1,
0.1385837, 1.260589, -1.338228, 0, 0.5686275, 1, 1,
0.1398179, 0.9413735, 2.084236, 0, 0.5607843, 1, 1,
0.1445048, 0.9794962, 0.05315816, 0, 0.5568628, 1, 1,
0.1505884, 0.4384714, 1.739319, 0, 0.5490196, 1, 1,
0.1561022, 0.4608267, 0.7272786, 0, 0.5450981, 1, 1,
0.157101, -1.621094, 2.287721, 0, 0.5372549, 1, 1,
0.1616168, 0.5783468, -0.4186331, 0, 0.5333334, 1, 1,
0.1624601, 0.2849699, 1.131933, 0, 0.5254902, 1, 1,
0.1633799, 0.9962261, 0.1891328, 0, 0.5215687, 1, 1,
0.1646597, -1.356579, 2.805639, 0, 0.5137255, 1, 1,
0.1667681, -0.8846779, 3.676605, 0, 0.509804, 1, 1,
0.166903, -1.814843, 1.710551, 0, 0.5019608, 1, 1,
0.1685047, -0.1486395, -0.09099323, 0, 0.4941176, 1, 1,
0.1685932, -2.457193, 2.017975, 0, 0.4901961, 1, 1,
0.1735697, -1.477805, 1.483882, 0, 0.4823529, 1, 1,
0.173669, 0.7027925, 1.085908, 0, 0.4784314, 1, 1,
0.1771705, 0.6875906, -0.3177343, 0, 0.4705882, 1, 1,
0.1786358, -0.1536518, 1.451458, 0, 0.4666667, 1, 1,
0.1823961, 0.9414574, -0.681502, 0, 0.4588235, 1, 1,
0.1840714, 1.633075, -0.3450046, 0, 0.454902, 1, 1,
0.187368, 0.6434181, 0.1412315, 0, 0.4470588, 1, 1,
0.1878524, 1.910837, -0.7802923, 0, 0.4431373, 1, 1,
0.1896781, 0.03681258, 0.2821196, 0, 0.4352941, 1, 1,
0.191117, 0.49351, 1.702727, 0, 0.4313726, 1, 1,
0.1919827, 1.741829, -0.2670353, 0, 0.4235294, 1, 1,
0.194362, 0.6567591, -1.561574, 0, 0.4196078, 1, 1,
0.1982039, 0.4887292, -0.5217344, 0, 0.4117647, 1, 1,
0.2071616, 0.724168, 1.017385, 0, 0.4078431, 1, 1,
0.2120214, -1.387794, 3.540806, 0, 0.4, 1, 1,
0.2141281, 0.07461862, 1.163869, 0, 0.3921569, 1, 1,
0.2146789, -3.575446, 2.903824, 0, 0.3882353, 1, 1,
0.2147236, -0.8061695, 3.530672, 0, 0.3803922, 1, 1,
0.2176522, -2.367829, 2.988941, 0, 0.3764706, 1, 1,
0.218071, -1.513009, 1.861221, 0, 0.3686275, 1, 1,
0.2189635, -0.5985689, 1.845755, 0, 0.3647059, 1, 1,
0.2233642, -0.2242747, 2.767371, 0, 0.3568628, 1, 1,
0.2291992, -0.9728426, 4.136614, 0, 0.3529412, 1, 1,
0.229909, 1.730735, -1.161444, 0, 0.345098, 1, 1,
0.2329717, -0.2037455, 2.638289, 0, 0.3411765, 1, 1,
0.2336389, 0.2283815, 0.4980072, 0, 0.3333333, 1, 1,
0.2339118, 0.2548707, 1.415718, 0, 0.3294118, 1, 1,
0.2361457, -0.3801955, 0.3188831, 0, 0.3215686, 1, 1,
0.2362168, 1.114545, -0.2841367, 0, 0.3176471, 1, 1,
0.2371179, -0.1680515, 1.306034, 0, 0.3098039, 1, 1,
0.2413044, 0.7224144, 0.7423722, 0, 0.3058824, 1, 1,
0.2523842, -0.2778945, 2.395135, 0, 0.2980392, 1, 1,
0.2581645, -1.518114, 3.816938, 0, 0.2901961, 1, 1,
0.25907, 0.9978565, 0.9194369, 0, 0.2862745, 1, 1,
0.2631273, -0.9014382, 3.444928, 0, 0.2784314, 1, 1,
0.2646495, 1.572986, 0.02957198, 0, 0.2745098, 1, 1,
0.2659156, 0.6026331, 0.2805891, 0, 0.2666667, 1, 1,
0.2663198, 0.9312575, -0.3715987, 0, 0.2627451, 1, 1,
0.2705346, 0.2917063, 0.4535886, 0, 0.254902, 1, 1,
0.2741648, -0.5563088, 1.620397, 0, 0.2509804, 1, 1,
0.2768399, 0.2894531, 1.696771, 0, 0.2431373, 1, 1,
0.2800326, -0.4844197, 2.537009, 0, 0.2392157, 1, 1,
0.2806168, 0.7873505, -2.287254, 0, 0.2313726, 1, 1,
0.2816996, 0.784615, 1.59882, 0, 0.227451, 1, 1,
0.2839193, 0.02239765, 1.480813, 0, 0.2196078, 1, 1,
0.2857372, 1.460364, 0.6741413, 0, 0.2156863, 1, 1,
0.2908533, 0.09592919, 1.262641, 0, 0.2078431, 1, 1,
0.2927595, 0.0690763, 2.228123, 0, 0.2039216, 1, 1,
0.302259, 0.4620833, 0.4397992, 0, 0.1960784, 1, 1,
0.3035644, 0.4124971, 1.178499, 0, 0.1882353, 1, 1,
0.3090111, 0.3898151, 1.123669, 0, 0.1843137, 1, 1,
0.3091595, -0.872145, 2.017746, 0, 0.1764706, 1, 1,
0.3163554, 0.5475786, 1.631404, 0, 0.172549, 1, 1,
0.3170862, 1.550249, 0.3561517, 0, 0.1647059, 1, 1,
0.3224034, 1.113013, 1.22567, 0, 0.1607843, 1, 1,
0.3236945, -1.505836, 3.336349, 0, 0.1529412, 1, 1,
0.3240693, 0.4254935, -0.05096737, 0, 0.1490196, 1, 1,
0.3243777, -0.1484926, 2.189614, 0, 0.1411765, 1, 1,
0.3284227, 1.886402, 0.3630998, 0, 0.1372549, 1, 1,
0.3328456, -1.376422, 3.465465, 0, 0.1294118, 1, 1,
0.3344447, 0.7315142, 1.134356, 0, 0.1254902, 1, 1,
0.3346767, -0.0928565, 2.236378, 0, 0.1176471, 1, 1,
0.3347617, -0.457329, 4.161048, 0, 0.1137255, 1, 1,
0.3367207, -1.085694, 3.692721, 0, 0.1058824, 1, 1,
0.3446805, 0.03049469, 2.34677, 0, 0.09803922, 1, 1,
0.3465138, -0.9337088, 3.334041, 0, 0.09411765, 1, 1,
0.3466223, -0.5656662, 2.711742, 0, 0.08627451, 1, 1,
0.3494248, 3.481429, -0.05636661, 0, 0.08235294, 1, 1,
0.3594065, 0.3149522, 1.091391, 0, 0.07450981, 1, 1,
0.3613354, 1.434442, 0.2430454, 0, 0.07058824, 1, 1,
0.3622999, -0.9972976, 3.682435, 0, 0.0627451, 1, 1,
0.3646673, 0.4840252, -0.01214525, 0, 0.05882353, 1, 1,
0.3665207, 0.7034678, 1.869629, 0, 0.05098039, 1, 1,
0.3690808, -0.2364476, 0.8989164, 0, 0.04705882, 1, 1,
0.3702773, -1.041781, 2.139679, 0, 0.03921569, 1, 1,
0.3730432, -1.327173, 1.057218, 0, 0.03529412, 1, 1,
0.3738459, -1.342462, 0.1851289, 0, 0.02745098, 1, 1,
0.375113, 1.427021, 0.345241, 0, 0.02352941, 1, 1,
0.3771974, 0.8913509, -0.4611996, 0, 0.01568628, 1, 1,
0.3782781, 1.115887, 1.410736, 0, 0.01176471, 1, 1,
0.3800757, 1.14045, 1.088657, 0, 0.003921569, 1, 1,
0.3841861, 0.9646283, -0.6205487, 0.003921569, 0, 1, 1,
0.3882847, 0.9187497, -1.826073, 0.007843138, 0, 1, 1,
0.3952307, -0.8606407, 2.150389, 0.01568628, 0, 1, 1,
0.3970607, -0.8513628, 1.453078, 0.01960784, 0, 1, 1,
0.3983784, 1.783919, 0.01517017, 0.02745098, 0, 1, 1,
0.399703, 0.8031028, 1.930488, 0.03137255, 0, 1, 1,
0.4016999, 0.6914707, -0.8413388, 0.03921569, 0, 1, 1,
0.4025678, 0.9932708, 0.6795048, 0.04313726, 0, 1, 1,
0.4028369, 0.6283287, -0.5392296, 0.05098039, 0, 1, 1,
0.403681, -1.268906, 0.5596218, 0.05490196, 0, 1, 1,
0.4073744, 1.876468, 1.056925, 0.0627451, 0, 1, 1,
0.4079329, -0.9432064, 1.830923, 0.06666667, 0, 1, 1,
0.4095033, 0.02395706, 1.831716, 0.07450981, 0, 1, 1,
0.4097362, 0.5612777, -0.9265203, 0.07843138, 0, 1, 1,
0.415528, -0.839522, 2.461993, 0.08627451, 0, 1, 1,
0.4206078, -0.1211942, 0.2640493, 0.09019608, 0, 1, 1,
0.4230459, -1.869117, 3.72654, 0.09803922, 0, 1, 1,
0.4249958, 0.2456009, 0.256671, 0.1058824, 0, 1, 1,
0.425449, -1.619232, 4.192238, 0.1098039, 0, 1, 1,
0.428597, -0.8243985, 1.681292, 0.1176471, 0, 1, 1,
0.4295297, -0.01252188, 2.52565, 0.1215686, 0, 1, 1,
0.4299883, -0.3603697, 2.904549, 0.1294118, 0, 1, 1,
0.4306389, 0.6061237, 1.063322, 0.1333333, 0, 1, 1,
0.4362296, -0.9056391, 3.891591, 0.1411765, 0, 1, 1,
0.4624916, -0.4373025, 3.103461, 0.145098, 0, 1, 1,
0.4638599, 0.05168319, 0.4013751, 0.1529412, 0, 1, 1,
0.467346, 1.419193, -0.9412758, 0.1568628, 0, 1, 1,
0.4678867, -0.7671342, 3.876759, 0.1647059, 0, 1, 1,
0.4752936, -0.4088864, 1.577378, 0.1686275, 0, 1, 1,
0.4790979, 0.177543, 0.8370032, 0.1764706, 0, 1, 1,
0.479369, 0.148597, 2.849683, 0.1803922, 0, 1, 1,
0.4812938, 1.283872, 1.496688, 0.1882353, 0, 1, 1,
0.4856673, 0.3261566, 1.070014, 0.1921569, 0, 1, 1,
0.4915499, 0.1409556, 1.579508, 0.2, 0, 1, 1,
0.4957279, 0.07295763, 0.7767503, 0.2078431, 0, 1, 1,
0.4968118, 0.5692351, 1.401591, 0.2117647, 0, 1, 1,
0.4974265, 0.2901376, -0.5728853, 0.2196078, 0, 1, 1,
0.4991843, 0.9895394, -2.433466, 0.2235294, 0, 1, 1,
0.5032673, 0.05883683, 1.099271, 0.2313726, 0, 1, 1,
0.5072998, 0.7593828, 2.123924, 0.2352941, 0, 1, 1,
0.5073541, 0.5899691, 2.102639, 0.2431373, 0, 1, 1,
0.5136876, -0.4528601, 3.296002, 0.2470588, 0, 1, 1,
0.5145974, -1.537889, 3.983994, 0.254902, 0, 1, 1,
0.5163882, -1.571999, 2.132285, 0.2588235, 0, 1, 1,
0.5233166, 0.604537, 1.25988, 0.2666667, 0, 1, 1,
0.5361885, 1.055118, -2.049947, 0.2705882, 0, 1, 1,
0.5362118, -0.07779846, 1.475977, 0.2784314, 0, 1, 1,
0.5395158, -0.3127812, 4.395344, 0.282353, 0, 1, 1,
0.5415805, 0.03900824, 1.062301, 0.2901961, 0, 1, 1,
0.5454652, 0.6551859, -0.624587, 0.2941177, 0, 1, 1,
0.548366, -0.430713, 2.874548, 0.3019608, 0, 1, 1,
0.5501382, -0.2874608, 2.382315, 0.3098039, 0, 1, 1,
0.5511882, -2.086497, 1.143273, 0.3137255, 0, 1, 1,
0.5529896, 1.367334, -0.2977458, 0.3215686, 0, 1, 1,
0.5567935, -0.6430687, 2.042394, 0.3254902, 0, 1, 1,
0.5628775, 2.517982, 0.2159733, 0.3333333, 0, 1, 1,
0.568162, 1.878989, 0.09007303, 0.3372549, 0, 1, 1,
0.5705876, -1.840148, 2.857958, 0.345098, 0, 1, 1,
0.5727206, -0.6500849, 1.713069, 0.3490196, 0, 1, 1,
0.5760929, 0.903344, -0.5243129, 0.3568628, 0, 1, 1,
0.5775504, -1.417131, 3.359603, 0.3607843, 0, 1, 1,
0.5783571, 0.7985948, -0.160335, 0.3686275, 0, 1, 1,
0.5794149, -1.99506, 4.632571, 0.372549, 0, 1, 1,
0.5834436, -1.089058, 1.45677, 0.3803922, 0, 1, 1,
0.5916081, 0.6754386, 0.8231735, 0.3843137, 0, 1, 1,
0.5964944, 0.8494263, -0.2129668, 0.3921569, 0, 1, 1,
0.5993541, 0.4938526, 0.1333078, 0.3960784, 0, 1, 1,
0.6000953, 0.9877592, 0.007787996, 0.4039216, 0, 1, 1,
0.6071928, -0.2114947, 2.284435, 0.4117647, 0, 1, 1,
0.6158368, 0.5037149, 2.279504, 0.4156863, 0, 1, 1,
0.6267208, -0.03279914, 1.375413, 0.4235294, 0, 1, 1,
0.6308901, -1.401566, 4.216878, 0.427451, 0, 1, 1,
0.6316283, 1.12227, 0.1596648, 0.4352941, 0, 1, 1,
0.6326258, 1.437263, -0.8588139, 0.4392157, 0, 1, 1,
0.6330017, 0.166252, 1.658836, 0.4470588, 0, 1, 1,
0.6332284, 0.05580577, 1.92774, 0.4509804, 0, 1, 1,
0.6383766, 0.9081312, -0.002200807, 0.4588235, 0, 1, 1,
0.639259, 0.5243171, 3.078667, 0.4627451, 0, 1, 1,
0.6406769, 0.957171, -0.5744313, 0.4705882, 0, 1, 1,
0.6481327, 0.2022286, 0.4602125, 0.4745098, 0, 1, 1,
0.6564757, 0.5547257, 0.2599587, 0.4823529, 0, 1, 1,
0.6566992, -0.0720794, 1.957718, 0.4862745, 0, 1, 1,
0.6582392, -0.3796741, 0.1944629, 0.4941176, 0, 1, 1,
0.6588519, 0.3355471, 2.720173, 0.5019608, 0, 1, 1,
0.6659262, -1.000964, 1.142659, 0.5058824, 0, 1, 1,
0.6659825, -0.04475398, 3.58511, 0.5137255, 0, 1, 1,
0.6673008, 0.2368854, 1.819724, 0.5176471, 0, 1, 1,
0.668289, -0.8250921, 1.013897, 0.5254902, 0, 1, 1,
0.6689755, 1.937404, 2.261812, 0.5294118, 0, 1, 1,
0.67014, 0.7658995, 0.7163212, 0.5372549, 0, 1, 1,
0.6749677, -0.900415, 2.029544, 0.5411765, 0, 1, 1,
0.6768256, 0.7366465, 0.8178075, 0.5490196, 0, 1, 1,
0.6856287, 0.9504427, 1.593562, 0.5529412, 0, 1, 1,
0.6866941, -0.3872674, 2.722867, 0.5607843, 0, 1, 1,
0.6882151, 0.1270189, 0.2493471, 0.5647059, 0, 1, 1,
0.6990735, -0.3755493, 2.687793, 0.572549, 0, 1, 1,
0.7063656, 2.247178, 0.7540529, 0.5764706, 0, 1, 1,
0.7122952, 0.07653572, 0.3764943, 0.5843138, 0, 1, 1,
0.7174063, 1.640616, -1.292924, 0.5882353, 0, 1, 1,
0.717872, -0.1427534, 3.004626, 0.5960785, 0, 1, 1,
0.7182131, -0.1295264, 1.532403, 0.6039216, 0, 1, 1,
0.7206551, 0.3032776, 2.43732, 0.6078432, 0, 1, 1,
0.7215242, 0.7738036, 2.584033, 0.6156863, 0, 1, 1,
0.7364538, 1.616885, 0.4029171, 0.6196079, 0, 1, 1,
0.7379944, 0.7112908, -0.1497626, 0.627451, 0, 1, 1,
0.7399417, 0.773154, 2.199236, 0.6313726, 0, 1, 1,
0.7415391, -0.8801079, 2.816535, 0.6392157, 0, 1, 1,
0.7417474, 0.03329025, 2.194037, 0.6431373, 0, 1, 1,
0.7461691, 0.7099869, 0.9753326, 0.6509804, 0, 1, 1,
0.7465749, 1.121562, 0.8105311, 0.654902, 0, 1, 1,
0.7474822, 1.482262, 2.021838, 0.6627451, 0, 1, 1,
0.7477115, 0.238893, -0.7988803, 0.6666667, 0, 1, 1,
0.7494454, -0.9081964, 0.7144361, 0.6745098, 0, 1, 1,
0.7569084, 1.852435, 0.9471018, 0.6784314, 0, 1, 1,
0.7573283, -1.176126, 1.420716, 0.6862745, 0, 1, 1,
0.765494, -1.152909, 3.751894, 0.6901961, 0, 1, 1,
0.7667333, -0.005762265, 1.730394, 0.6980392, 0, 1, 1,
0.7670592, -0.7658812, 3.540571, 0.7058824, 0, 1, 1,
0.7711107, -0.02064502, 0.9870176, 0.7098039, 0, 1, 1,
0.7726054, -0.1793015, 1.564381, 0.7176471, 0, 1, 1,
0.7755954, 2.225607, 1.917876, 0.7215686, 0, 1, 1,
0.780263, 1.538607, -0.2454143, 0.7294118, 0, 1, 1,
0.7954058, 0.06891511, 0.2424367, 0.7333333, 0, 1, 1,
0.7963421, 0.7247625, 1.669737, 0.7411765, 0, 1, 1,
0.8049438, -0.3073437, 1.917979, 0.7450981, 0, 1, 1,
0.8111091, 1.095953, 0.556372, 0.7529412, 0, 1, 1,
0.8156052, 0.9365295, 3.599371, 0.7568628, 0, 1, 1,
0.820375, -1.181047, 3.277193, 0.7647059, 0, 1, 1,
0.8251595, 1.971922, 0.6857915, 0.7686275, 0, 1, 1,
0.8255522, 1.395483, 0.0470434, 0.7764706, 0, 1, 1,
0.8258581, -2.030524, 2.08887, 0.7803922, 0, 1, 1,
0.8265784, 0.7314914, 1.105862, 0.7882353, 0, 1, 1,
0.8304579, 0.239845, 1.364821, 0.7921569, 0, 1, 1,
0.8315625, 0.2531822, 1.427167, 0.8, 0, 1, 1,
0.831965, 0.3389351, 1.850131, 0.8078431, 0, 1, 1,
0.8326685, 0.9019436, 0.76605, 0.8117647, 0, 1, 1,
0.849614, -0.6680759, 2.38716, 0.8196079, 0, 1, 1,
0.8503028, -1.546261, 2.646775, 0.8235294, 0, 1, 1,
0.8520324, -0.7420001, 2.062522, 0.8313726, 0, 1, 1,
0.85963, -0.2590697, 1.884487, 0.8352941, 0, 1, 1,
0.8665845, 2.43946, 0.6446257, 0.8431373, 0, 1, 1,
0.8720729, -1.694418, 2.787706, 0.8470588, 0, 1, 1,
0.8739824, -1.936516, 2.686778, 0.854902, 0, 1, 1,
0.8764882, 2.355728, 0.0321985, 0.8588235, 0, 1, 1,
0.8833351, 1.636486, 0.6837351, 0.8666667, 0, 1, 1,
0.8840262, 0.5129883, 2.413703, 0.8705882, 0, 1, 1,
0.8898265, 0.08511662, 2.052411, 0.8784314, 0, 1, 1,
0.8980673, 0.9915417, -0.1844445, 0.8823529, 0, 1, 1,
0.8991944, -0.4839813, 1.412895, 0.8901961, 0, 1, 1,
0.9003187, 0.4968277, 0.441563, 0.8941177, 0, 1, 1,
0.9005734, 1.456608, 0.7831538, 0.9019608, 0, 1, 1,
0.9013262, 0.1354211, 3.237356, 0.9098039, 0, 1, 1,
0.911667, 0.6219141, 1.722636, 0.9137255, 0, 1, 1,
0.9175238, -0.1725665, 2.331574, 0.9215686, 0, 1, 1,
0.9198784, -1.13163, 2.029471, 0.9254902, 0, 1, 1,
0.9202375, 0.3025823, 2.137014, 0.9333333, 0, 1, 1,
0.9228762, 0.7587863, -0.1960836, 0.9372549, 0, 1, 1,
0.9331456, -0.4466251, 0.1746754, 0.945098, 0, 1, 1,
0.93453, -1.664625, 1.858425, 0.9490196, 0, 1, 1,
0.9351273, -0.8422022, 2.667221, 0.9568627, 0, 1, 1,
0.9389364, 1.373289, -0.6941535, 0.9607843, 0, 1, 1,
0.9394509, -0.6525733, 1.943892, 0.9686275, 0, 1, 1,
0.9399081, 1.812556, 1.734637, 0.972549, 0, 1, 1,
0.940037, 0.6337485, 1.095762, 0.9803922, 0, 1, 1,
0.9468484, 0.8434539, 1.563849, 0.9843137, 0, 1, 1,
0.9478734, 1.073157, -0.944817, 0.9921569, 0, 1, 1,
0.9490414, -1.148854, 3.264329, 0.9960784, 0, 1, 1,
0.949528, 0.7183875, 1.000395, 1, 0, 0.9960784, 1,
0.9528015, 0.6331294, 1.132221, 1, 0, 0.9882353, 1,
0.9625273, -1.303015, 2.046281, 1, 0, 0.9843137, 1,
0.9659683, -0.785623, 1.913227, 1, 0, 0.9764706, 1,
0.9682726, 0.5588802, 2.282577, 1, 0, 0.972549, 1,
0.9697271, -0.8036488, 2.313865, 1, 0, 0.9647059, 1,
0.9780377, -1.391886, 5.193597, 1, 0, 0.9607843, 1,
0.9826967, -0.08956916, 0.9150905, 1, 0, 0.9529412, 1,
0.9890106, 0.1792702, 1.696297, 1, 0, 0.9490196, 1,
0.9891139, -0.4129622, 0.8972126, 1, 0, 0.9411765, 1,
0.9988962, 1.318085, -1.700527, 1, 0, 0.9372549, 1,
1.003435, 0.1389412, 1.628407, 1, 0, 0.9294118, 1,
1.005706, -0.08506538, 1.875015, 1, 0, 0.9254902, 1,
1.0063, 0.8888558, 1.366845, 1, 0, 0.9176471, 1,
1.010724, 0.5741105, -1.399405, 1, 0, 0.9137255, 1,
1.013686, 0.2914807, 3.44925, 1, 0, 0.9058824, 1,
1.013864, 0.7530966, -0.2705529, 1, 0, 0.9019608, 1,
1.014269, 0.6134375, -0.08000063, 1, 0, 0.8941177, 1,
1.014739, 1.097071, 2.039946, 1, 0, 0.8862745, 1,
1.021274, -0.6718103, 1.593525, 1, 0, 0.8823529, 1,
1.02261, 0.1348584, 0.2648698, 1, 0, 0.8745098, 1,
1.036076, -0.04474727, 0.1441344, 1, 0, 0.8705882, 1,
1.036166, 0.2428898, 1.407031, 1, 0, 0.8627451, 1,
1.03689, 0.782289, 0.09757252, 1, 0, 0.8588235, 1,
1.040434, -0.1138664, 1.010907, 1, 0, 0.8509804, 1,
1.049176, 0.2650977, 1.537954, 1, 0, 0.8470588, 1,
1.051422, 1.157221, 1.907763, 1, 0, 0.8392157, 1,
1.069235, 0.02982828, 0.9462963, 1, 0, 0.8352941, 1,
1.069956, 0.2064151, 1.69668, 1, 0, 0.827451, 1,
1.078113, -0.9462825, 3.118547, 1, 0, 0.8235294, 1,
1.088846, 0.3870145, 1.22083, 1, 0, 0.8156863, 1,
1.093106, 0.2821538, 0.5757914, 1, 0, 0.8117647, 1,
1.093208, 0.06859258, 2.142462, 1, 0, 0.8039216, 1,
1.096928, -0.6809599, 1.21508, 1, 0, 0.7960784, 1,
1.108423, -0.08056185, 2.168252, 1, 0, 0.7921569, 1,
1.119449, 0.00310382, 0.09419582, 1, 0, 0.7843137, 1,
1.124684, -0.06390955, 3.324666, 1, 0, 0.7803922, 1,
1.133183, 0.2729689, -0.04635175, 1, 0, 0.772549, 1,
1.145398, 0.3996249, 2.029426, 1, 0, 0.7686275, 1,
1.146909, -0.02185428, 1.539905, 1, 0, 0.7607843, 1,
1.152749, -0.004418735, 2.577484, 1, 0, 0.7568628, 1,
1.155481, 2.163954, -0.4452865, 1, 0, 0.7490196, 1,
1.155506, -0.2147323, 0.4406405, 1, 0, 0.7450981, 1,
1.165157, 0.6664804, 0.5377482, 1, 0, 0.7372549, 1,
1.176619, -0.3418571, 2.581346, 1, 0, 0.7333333, 1,
1.178082, 0.7242013, 2.257264, 1, 0, 0.7254902, 1,
1.182634, -0.06831279, 0.771956, 1, 0, 0.7215686, 1,
1.182905, 0.005467237, 2.03337, 1, 0, 0.7137255, 1,
1.189688, -0.620497, 2.551461, 1, 0, 0.7098039, 1,
1.19104, 0.6459087, 1.77015, 1, 0, 0.7019608, 1,
1.192277, -0.2164246, 2.00321, 1, 0, 0.6941177, 1,
1.199276, 1.454964, -0.35292, 1, 0, 0.6901961, 1,
1.202612, -0.2793603, 0.832512, 1, 0, 0.682353, 1,
1.213773, 0.6537566, 0.03066173, 1, 0, 0.6784314, 1,
1.217569, 0.08046799, 1.421103, 1, 0, 0.6705883, 1,
1.218313, -0.2032162, 1.152968, 1, 0, 0.6666667, 1,
1.222071, 0.5753947, 1.591688, 1, 0, 0.6588235, 1,
1.232216, 1.825309, 1.414554, 1, 0, 0.654902, 1,
1.260105, 0.7115777, 0.3778192, 1, 0, 0.6470588, 1,
1.264716, 0.7294232, 0.5968619, 1, 0, 0.6431373, 1,
1.265187, 0.07566175, 2.588402, 1, 0, 0.6352941, 1,
1.266557, -0.4131365, 2.788558, 1, 0, 0.6313726, 1,
1.273499, 0.8056598, -0.4381868, 1, 0, 0.6235294, 1,
1.290391, -1.013938, 2.637022, 1, 0, 0.6196079, 1,
1.291242, -1.285857, 3.410066, 1, 0, 0.6117647, 1,
1.298835, 1.771524, 0.5840643, 1, 0, 0.6078432, 1,
1.303254, -0.5737461, 1.986801, 1, 0, 0.6, 1,
1.306894, -1.88236, 2.793528, 1, 0, 0.5921569, 1,
1.328861, 1.867542, 2.006239, 1, 0, 0.5882353, 1,
1.33746, -0.4371068, 1.242754, 1, 0, 0.5803922, 1,
1.34912, -3.954254, 1.056567, 1, 0, 0.5764706, 1,
1.357178, -0.7727144, 0.3448905, 1, 0, 0.5686275, 1,
1.361352, 0.5553086, 1.376112, 1, 0, 0.5647059, 1,
1.373773, -0.1115396, 1.797428, 1, 0, 0.5568628, 1,
1.376947, 0.668311, -0.1303919, 1, 0, 0.5529412, 1,
1.383298, -0.2782952, 1.872147, 1, 0, 0.5450981, 1,
1.384143, 0.3474915, 1.25661, 1, 0, 0.5411765, 1,
1.39439, -1.037077, 2.989124, 1, 0, 0.5333334, 1,
1.395864, -0.04992171, -0.8726627, 1, 0, 0.5294118, 1,
1.41223, -1.376232, 3.383845, 1, 0, 0.5215687, 1,
1.426217, 1.482376, 1.722632, 1, 0, 0.5176471, 1,
1.429698, -0.1163971, 2.016372, 1, 0, 0.509804, 1,
1.436165, 0.1708962, 1.74068, 1, 0, 0.5058824, 1,
1.447632, -2.257698, 3.193661, 1, 0, 0.4980392, 1,
1.451931, 1.986989, 1.477459, 1, 0, 0.4901961, 1,
1.465157, 0.2725612, 0.9598256, 1, 0, 0.4862745, 1,
1.467667, 2.372993, 0.3456593, 1, 0, 0.4784314, 1,
1.473076, 1.084432, 2.190524, 1, 0, 0.4745098, 1,
1.473827, -0.08045136, 4.386204, 1, 0, 0.4666667, 1,
1.475412, 0.3652621, 2.515067, 1, 0, 0.4627451, 1,
1.480457, 0.1934868, 0.8291084, 1, 0, 0.454902, 1,
1.489504, -1.078226, 0.9758989, 1, 0, 0.4509804, 1,
1.500745, -0.3307271, 1.786287, 1, 0, 0.4431373, 1,
1.502432, -1.067547, 2.087108, 1, 0, 0.4392157, 1,
1.507395, 1.020249, 1.791029, 1, 0, 0.4313726, 1,
1.526566, 0.4018664, 3.001659, 1, 0, 0.427451, 1,
1.528314, 0.6542032, 1.103509, 1, 0, 0.4196078, 1,
1.533872, -0.6080408, 0.9657907, 1, 0, 0.4156863, 1,
1.541365, -0.7753393, 1.712517, 1, 0, 0.4078431, 1,
1.545561, -1.226783, 1.130367, 1, 0, 0.4039216, 1,
1.547255, -0.8827155, 2.252824, 1, 0, 0.3960784, 1,
1.54726, 1.848968, 0.7779062, 1, 0, 0.3882353, 1,
1.548847, -0.9470423, 2.243854, 1, 0, 0.3843137, 1,
1.550747, -1.36464, 3.896754, 1, 0, 0.3764706, 1,
1.572499, -0.4868164, 2.772633, 1, 0, 0.372549, 1,
1.573354, -0.7392184, 0.3644161, 1, 0, 0.3647059, 1,
1.578792, 1.149365, 1.128095, 1, 0, 0.3607843, 1,
1.600858, 0.1966666, 0.8618061, 1, 0, 0.3529412, 1,
1.613253, 0.5840691, 0.1534746, 1, 0, 0.3490196, 1,
1.62465, -1.904376, 1.418782, 1, 0, 0.3411765, 1,
1.626848, 0.1022378, 1.364312, 1, 0, 0.3372549, 1,
1.654511, 0.2175198, 3.020159, 1, 0, 0.3294118, 1,
1.656089, 0.3713446, 2.556421, 1, 0, 0.3254902, 1,
1.657198, -0.9994259, 0.3585653, 1, 0, 0.3176471, 1,
1.703125, 0.5858733, 2.421216, 1, 0, 0.3137255, 1,
1.704035, -0.6946298, 2.430494, 1, 0, 0.3058824, 1,
1.713879, 0.01262779, 1.636127, 1, 0, 0.2980392, 1,
1.740677, 0.8518863, 1.007601, 1, 0, 0.2941177, 1,
1.765317, -0.7985801, 1.0945, 1, 0, 0.2862745, 1,
1.773893, 0.1695974, 0.7825967, 1, 0, 0.282353, 1,
1.789035, -0.811194, 1.26118, 1, 0, 0.2745098, 1,
1.789664, 1.291856, 0.110335, 1, 0, 0.2705882, 1,
1.790405, -0.5009481, 2.025856, 1, 0, 0.2627451, 1,
1.815747, -0.9943694, 1.732915, 1, 0, 0.2588235, 1,
1.832675, 0.3671575, 1.412982, 1, 0, 0.2509804, 1,
1.844729, -0.1851435, 2.24368, 1, 0, 0.2470588, 1,
1.865512, -0.1651465, 1.469338, 1, 0, 0.2392157, 1,
1.897809, 1.074878, 0.9984495, 1, 0, 0.2352941, 1,
1.898638, -1.089656, 3.017899, 1, 0, 0.227451, 1,
1.898662, 0.9181273, -0.2800165, 1, 0, 0.2235294, 1,
1.934331, 0.1860562, 0.9414887, 1, 0, 0.2156863, 1,
1.935152, 0.7677065, -0.496921, 1, 0, 0.2117647, 1,
1.943913, -2.79291, 2.426475, 1, 0, 0.2039216, 1,
1.952431, 1.496245, 0.5315918, 1, 0, 0.1960784, 1,
1.962794, -0.8744144, 1.7111, 1, 0, 0.1921569, 1,
1.973341, 0.04021389, -0.5210183, 1, 0, 0.1843137, 1,
2.001444, -0.5980858, 2.304271, 1, 0, 0.1803922, 1,
2.027031, -1.100848, 2.572439, 1, 0, 0.172549, 1,
2.037601, -1.98304, 0.6075311, 1, 0, 0.1686275, 1,
2.069061, 0.9384078, 2.767505, 1, 0, 0.1607843, 1,
2.154489, -0.5809337, 1.70063, 1, 0, 0.1568628, 1,
2.165634, -0.3583517, 0.2153198, 1, 0, 0.1490196, 1,
2.198206, 2.071613, 1.459457, 1, 0, 0.145098, 1,
2.200666, 1.178103, 0.9735335, 1, 0, 0.1372549, 1,
2.203009, 1.96864, 1.907051, 1, 0, 0.1333333, 1,
2.238952, 0.3868324, 1.729254, 1, 0, 0.1254902, 1,
2.245576, -0.4867151, 2.840475, 1, 0, 0.1215686, 1,
2.247746, -0.6760828, 0.8843411, 1, 0, 0.1137255, 1,
2.260553, 1.550793, 0.6741156, 1, 0, 0.1098039, 1,
2.262437, -0.03671669, -0.2696025, 1, 0, 0.1019608, 1,
2.346853, -0.03085614, 1.584361, 1, 0, 0.09411765, 1,
2.355049, -1.514617, 2.073174, 1, 0, 0.09019608, 1,
2.371312, 0.3714094, 4.065663, 1, 0, 0.08235294, 1,
2.379888, 1.746018, 1.111572, 1, 0, 0.07843138, 1,
2.416131, -1.287388, 0.2356929, 1, 0, 0.07058824, 1,
2.47597, 1.985297, 1.301654, 1, 0, 0.06666667, 1,
2.506461, -0.859933, 0.3776488, 1, 0, 0.05882353, 1,
2.556925, 0.250632, 1.493924, 1, 0, 0.05490196, 1,
2.601844, -1.144296, 1.748778, 1, 0, 0.04705882, 1,
2.656246, 1.588874, 3.160287, 1, 0, 0.04313726, 1,
2.743332, 1.312318, 0.6470081, 1, 0, 0.03529412, 1,
2.91868, 0.03160847, 1.408151, 1, 0, 0.03137255, 1,
2.942096, -0.975756, 2.615782, 1, 0, 0.02352941, 1,
3.007807, 1.174558, -0.5344785, 1, 0, 0.01960784, 1,
3.070837, -1.281754, 0.4234028, 1, 0, 0.01176471, 1,
3.081098, -0.5389464, 4.032169, 1, 0, 0.007843138, 1
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
0.02892745, -5.37499, -7.426805, 0, -0.5, 0.5, 0.5,
0.02892745, -5.37499, -7.426805, 1, -0.5, 0.5, 0.5,
0.02892745, -5.37499, -7.426805, 1, 1.5, 0.5, 0.5,
0.02892745, -5.37499, -7.426805, 0, 1.5, 0.5, 0.5
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
-4.057929, -0.07085574, -7.426805, 0, -0.5, 0.5, 0.5,
-4.057929, -0.07085574, -7.426805, 1, -0.5, 0.5, 0.5,
-4.057929, -0.07085574, -7.426805, 1, 1.5, 0.5, 0.5,
-4.057929, -0.07085574, -7.426805, 0, 1.5, 0.5, 0.5
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
-4.057929, -5.37499, -0.2020428, 0, -0.5, 0.5, 0.5,
-4.057929, -5.37499, -0.2020428, 1, -0.5, 0.5, 0.5,
-4.057929, -5.37499, -0.2020428, 1, 1.5, 0.5, 0.5,
-4.057929, -5.37499, -0.2020428, 0, 1.5, 0.5, 0.5
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
-3, -4.150959, -5.759552,
3, -4.150959, -5.759552,
-3, -4.150959, -5.759552,
-3, -4.354964, -6.037427,
-2, -4.150959, -5.759552,
-2, -4.354964, -6.037427,
-1, -4.150959, -5.759552,
-1, -4.354964, -6.037427,
0, -4.150959, -5.759552,
0, -4.354964, -6.037427,
1, -4.150959, -5.759552,
1, -4.354964, -6.037427,
2, -4.150959, -5.759552,
2, -4.354964, -6.037427,
3, -4.150959, -5.759552,
3, -4.354964, -6.037427
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
-3, -4.762974, -6.593179, 0, -0.5, 0.5, 0.5,
-3, -4.762974, -6.593179, 1, -0.5, 0.5, 0.5,
-3, -4.762974, -6.593179, 1, 1.5, 0.5, 0.5,
-3, -4.762974, -6.593179, 0, 1.5, 0.5, 0.5,
-2, -4.762974, -6.593179, 0, -0.5, 0.5, 0.5,
-2, -4.762974, -6.593179, 1, -0.5, 0.5, 0.5,
-2, -4.762974, -6.593179, 1, 1.5, 0.5, 0.5,
-2, -4.762974, -6.593179, 0, 1.5, 0.5, 0.5,
-1, -4.762974, -6.593179, 0, -0.5, 0.5, 0.5,
-1, -4.762974, -6.593179, 1, -0.5, 0.5, 0.5,
-1, -4.762974, -6.593179, 1, 1.5, 0.5, 0.5,
-1, -4.762974, -6.593179, 0, 1.5, 0.5, 0.5,
0, -4.762974, -6.593179, 0, -0.5, 0.5, 0.5,
0, -4.762974, -6.593179, 1, -0.5, 0.5, 0.5,
0, -4.762974, -6.593179, 1, 1.5, 0.5, 0.5,
0, -4.762974, -6.593179, 0, 1.5, 0.5, 0.5,
1, -4.762974, -6.593179, 0, -0.5, 0.5, 0.5,
1, -4.762974, -6.593179, 1, -0.5, 0.5, 0.5,
1, -4.762974, -6.593179, 1, 1.5, 0.5, 0.5,
1, -4.762974, -6.593179, 0, 1.5, 0.5, 0.5,
2, -4.762974, -6.593179, 0, -0.5, 0.5, 0.5,
2, -4.762974, -6.593179, 1, -0.5, 0.5, 0.5,
2, -4.762974, -6.593179, 1, 1.5, 0.5, 0.5,
2, -4.762974, -6.593179, 0, 1.5, 0.5, 0.5,
3, -4.762974, -6.593179, 0, -0.5, 0.5, 0.5,
3, -4.762974, -6.593179, 1, -0.5, 0.5, 0.5,
3, -4.762974, -6.593179, 1, 1.5, 0.5, 0.5,
3, -4.762974, -6.593179, 0, 1.5, 0.5, 0.5
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
-3.114808, -4, -5.759552,
-3.114808, 2, -5.759552,
-3.114808, -4, -5.759552,
-3.271995, -4, -6.037427,
-3.114808, -2, -5.759552,
-3.271995, -2, -6.037427,
-3.114808, 0, -5.759552,
-3.271995, 0, -6.037427,
-3.114808, 2, -5.759552,
-3.271995, 2, -6.037427
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
"-4",
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
-3.586368, -4, -6.593179, 0, -0.5, 0.5, 0.5,
-3.586368, -4, -6.593179, 1, -0.5, 0.5, 0.5,
-3.586368, -4, -6.593179, 1, 1.5, 0.5, 0.5,
-3.586368, -4, -6.593179, 0, 1.5, 0.5, 0.5,
-3.586368, -2, -6.593179, 0, -0.5, 0.5, 0.5,
-3.586368, -2, -6.593179, 1, -0.5, 0.5, 0.5,
-3.586368, -2, -6.593179, 1, 1.5, 0.5, 0.5,
-3.586368, -2, -6.593179, 0, 1.5, 0.5, 0.5,
-3.586368, 0, -6.593179, 0, -0.5, 0.5, 0.5,
-3.586368, 0, -6.593179, 1, -0.5, 0.5, 0.5,
-3.586368, 0, -6.593179, 1, 1.5, 0.5, 0.5,
-3.586368, 0, -6.593179, 0, 1.5, 0.5, 0.5,
-3.586368, 2, -6.593179, 0, -0.5, 0.5, 0.5,
-3.586368, 2, -6.593179, 1, -0.5, 0.5, 0.5,
-3.586368, 2, -6.593179, 1, 1.5, 0.5, 0.5,
-3.586368, 2, -6.593179, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.114808, -4.150959, -4,
-3.114808, -4.150959, 4,
-3.114808, -4.150959, -4,
-3.271995, -4.354964, -4,
-3.114808, -4.150959, -2,
-3.271995, -4.354964, -2,
-3.114808, -4.150959, 0,
-3.271995, -4.354964, 0,
-3.114808, -4.150959, 2,
-3.271995, -4.354964, 2,
-3.114808, -4.150959, 4,
-3.271995, -4.354964, 4
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
-3.586368, -4.762974, -4, 0, -0.5, 0.5, 0.5,
-3.586368, -4.762974, -4, 1, -0.5, 0.5, 0.5,
-3.586368, -4.762974, -4, 1, 1.5, 0.5, 0.5,
-3.586368, -4.762974, -4, 0, 1.5, 0.5, 0.5,
-3.586368, -4.762974, -2, 0, -0.5, 0.5, 0.5,
-3.586368, -4.762974, -2, 1, -0.5, 0.5, 0.5,
-3.586368, -4.762974, -2, 1, 1.5, 0.5, 0.5,
-3.586368, -4.762974, -2, 0, 1.5, 0.5, 0.5,
-3.586368, -4.762974, 0, 0, -0.5, 0.5, 0.5,
-3.586368, -4.762974, 0, 1, -0.5, 0.5, 0.5,
-3.586368, -4.762974, 0, 1, 1.5, 0.5, 0.5,
-3.586368, -4.762974, 0, 0, 1.5, 0.5, 0.5,
-3.586368, -4.762974, 2, 0, -0.5, 0.5, 0.5,
-3.586368, -4.762974, 2, 1, -0.5, 0.5, 0.5,
-3.586368, -4.762974, 2, 1, 1.5, 0.5, 0.5,
-3.586368, -4.762974, 2, 0, 1.5, 0.5, 0.5,
-3.586368, -4.762974, 4, 0, -0.5, 0.5, 0.5,
-3.586368, -4.762974, 4, 1, -0.5, 0.5, 0.5,
-3.586368, -4.762974, 4, 1, 1.5, 0.5, 0.5,
-3.586368, -4.762974, 4, 0, 1.5, 0.5, 0.5
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
-3.114808, -4.150959, -5.759552,
-3.114808, 4.009247, -5.759552,
-3.114808, -4.150959, 5.355466,
-3.114808, 4.009247, 5.355466,
-3.114808, -4.150959, -5.759552,
-3.114808, -4.150959, 5.355466,
-3.114808, 4.009247, -5.759552,
-3.114808, 4.009247, 5.355466,
-3.114808, -4.150959, -5.759552,
3.172663, -4.150959, -5.759552,
-3.114808, -4.150959, 5.355466,
3.172663, -4.150959, 5.355466,
-3.114808, 4.009247, -5.759552,
3.172663, 4.009247, -5.759552,
-3.114808, 4.009247, 5.355466,
3.172663, 4.009247, 5.355466,
3.172663, -4.150959, -5.759552,
3.172663, 4.009247, -5.759552,
3.172663, -4.150959, 5.355466,
3.172663, 4.009247, 5.355466,
3.172663, -4.150959, -5.759552,
3.172663, -4.150959, 5.355466,
3.172663, 4.009247, -5.759552,
3.172663, 4.009247, 5.355466
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
var radius = 8.092315;
var distance = 36.00362;
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
mvMatrix.translate( -0.02892745, 0.07085574, 0.2020428 );
mvMatrix.scale( 1.391588, 1.072224, 0.7871844 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.00362);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
terbuthylazine<-read.table("terbuthylazine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-terbuthylazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'terbuthylazine' not found
```

```r
y<-terbuthylazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'terbuthylazine' not found
```

```r
z<-terbuthylazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'terbuthylazine' not found
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
-3.023243, 0.6835445, -1.270573, 0, 0, 1, 1, 1,
-2.95468, -0.8278109, -1.228199, 1, 0, 0, 1, 1,
-2.677054, 1.684605, -1.763192, 1, 0, 0, 1, 1,
-2.665167, 0.469958, -3.414918, 1, 0, 0, 1, 1,
-2.639516, -0.2570233, -1.213051, 1, 0, 0, 1, 1,
-2.602874, -1.594314, -1.879146, 1, 0, 0, 1, 1,
-2.364285, 0.9581522, -0.7632198, 0, 0, 0, 1, 1,
-2.252301, -0.1097846, -1.7308, 0, 0, 0, 1, 1,
-2.231531, -0.7352327, -1.990049, 0, 0, 0, 1, 1,
-2.223433, -1.205661, -2.423867, 0, 0, 0, 1, 1,
-2.21704, -0.5683088, -1.23897, 0, 0, 0, 1, 1,
-2.147707, 1.410978, 0.2926609, 0, 0, 0, 1, 1,
-2.122042, 0.2608838, -1.285017, 0, 0, 0, 1, 1,
-2.117973, -0.3419485, -2.511413, 1, 1, 1, 1, 1,
-2.096328, 0.2950846, 0.2816174, 1, 1, 1, 1, 1,
-2.083714, -0.4649599, -2.212981, 1, 1, 1, 1, 1,
-2.036206, 0.4547802, -1.628824, 1, 1, 1, 1, 1,
-2.028175, 0.4070534, 0.9502388, 1, 1, 1, 1, 1,
-1.965022, -0.7273066, -1.604034, 1, 1, 1, 1, 1,
-1.946288, -0.376895, -0.6169802, 1, 1, 1, 1, 1,
-1.942027, 0.6215407, -0.6613219, 1, 1, 1, 1, 1,
-1.938296, -0.1473798, 0.07827087, 1, 1, 1, 1, 1,
-1.910732, 0.002701753, -2.12485, 1, 1, 1, 1, 1,
-1.909618, -0.9289182, -1.608587, 1, 1, 1, 1, 1,
-1.875359, 0.3874644, -0.6605754, 1, 1, 1, 1, 1,
-1.854347, -1.888363, -2.442294, 1, 1, 1, 1, 1,
-1.840866, -2.029114, -2.272225, 1, 1, 1, 1, 1,
-1.831744, 1.501555, 0.01627611, 1, 1, 1, 1, 1,
-1.831158, 0.7560036, -1.566664, 0, 0, 1, 1, 1,
-1.788315, -1.237657, -2.282276, 1, 0, 0, 1, 1,
-1.77988, -1.30274, -2.844983, 1, 0, 0, 1, 1,
-1.77548, -0.9946024, -2.039667, 1, 0, 0, 1, 1,
-1.759983, -0.4201787, -2.053331, 1, 0, 0, 1, 1,
-1.758538, 0.20636, -1.37686, 1, 0, 0, 1, 1,
-1.747048, -2.280224, -2.188511, 0, 0, 0, 1, 1,
-1.727451, -0.8135763, -3.722356, 0, 0, 0, 1, 1,
-1.718227, -0.3758336, -1.902961, 0, 0, 0, 1, 1,
-1.690975, -0.08150633, -0.97531, 0, 0, 0, 1, 1,
-1.670719, 0.9216729, -0.2091065, 0, 0, 0, 1, 1,
-1.665116, -0.04261293, 0.01968116, 0, 0, 0, 1, 1,
-1.656369, -0.184035, -2.269609, 0, 0, 0, 1, 1,
-1.638654, 0.3803568, -0.847078, 1, 1, 1, 1, 1,
-1.63211, -0.4410717, -2.441099, 1, 1, 1, 1, 1,
-1.626151, 1.161265, 0.606666, 1, 1, 1, 1, 1,
-1.61979, -0.5059077, -2.839319, 1, 1, 1, 1, 1,
-1.610641, -0.7542599, -2.631066, 1, 1, 1, 1, 1,
-1.60235, -0.5730654, -1.850538, 1, 1, 1, 1, 1,
-1.59594, 1.007493, -1.370142, 1, 1, 1, 1, 1,
-1.589203, -1.024502, -1.257319, 1, 1, 1, 1, 1,
-1.553091, 1.570407, -0.7954802, 1, 1, 1, 1, 1,
-1.543573, -2.102028, -2.764543, 1, 1, 1, 1, 1,
-1.531186, -0.58675, -3.311301, 1, 1, 1, 1, 1,
-1.485511, -0.1571099, -1.641888, 1, 1, 1, 1, 1,
-1.478369, 0.2142677, -0.146124, 1, 1, 1, 1, 1,
-1.476501, -0.8540077, -1.455249, 1, 1, 1, 1, 1,
-1.464244, 0.1867961, -1.956429, 1, 1, 1, 1, 1,
-1.46297, -1.216057, -2.149781, 0, 0, 1, 1, 1,
-1.452544, -0.8807524, -4.285064, 1, 0, 0, 1, 1,
-1.428999, 0.8312368, -1.728776, 1, 0, 0, 1, 1,
-1.419516, 0.7508929, -1.02716, 1, 0, 0, 1, 1,
-1.419097, 0.3463843, -2.414171, 1, 0, 0, 1, 1,
-1.409649, -0.2041467, -0.4313039, 1, 0, 0, 1, 1,
-1.407769, 0.00218916, -1.788598, 0, 0, 0, 1, 1,
-1.40494, 0.6712095, 0.3922607, 0, 0, 0, 1, 1,
-1.393719, 0.8453812, -0.2572131, 0, 0, 0, 1, 1,
-1.392796, 0.2341849, -0.1544421, 0, 0, 0, 1, 1,
-1.387721, 2.896921, -1.400144, 0, 0, 0, 1, 1,
-1.382993, 1.059777, -0.1638052, 0, 0, 0, 1, 1,
-1.381673, 1.515488, -1.769692, 0, 0, 0, 1, 1,
-1.379561, -0.1490953, -3.395751, 1, 1, 1, 1, 1,
-1.362371, -0.4549451, -1.985083, 1, 1, 1, 1, 1,
-1.360074, 1.343811, -1.265091, 1, 1, 1, 1, 1,
-1.356313, -0.2000699, -1.995962, 1, 1, 1, 1, 1,
-1.352241, 0.3361131, -1.99391, 1, 1, 1, 1, 1,
-1.350288, 0.5509363, -2.363041, 1, 1, 1, 1, 1,
-1.334509, 1.174173, -1.002065, 1, 1, 1, 1, 1,
-1.33341, -0.1198533, -0.3835508, 1, 1, 1, 1, 1,
-1.324084, -1.26216, -0.1846688, 1, 1, 1, 1, 1,
-1.324025, -0.7360778, -1.800418, 1, 1, 1, 1, 1,
-1.315492, 0.8120062, -1.530423, 1, 1, 1, 1, 1,
-1.314726, -0.9348105, -2.350548, 1, 1, 1, 1, 1,
-1.310298, -0.2671454, -2.803805, 1, 1, 1, 1, 1,
-1.303358, 1.086751, -0.621533, 1, 1, 1, 1, 1,
-1.302111, 0.6139898, -0.7267235, 1, 1, 1, 1, 1,
-1.30171, -0.2953211, -2.126515, 0, 0, 1, 1, 1,
-1.293124, 1.041035, -0.6804561, 1, 0, 0, 1, 1,
-1.290383, 1.38137, 0.8689316, 1, 0, 0, 1, 1,
-1.289721, -0.6744538, -2.782574, 1, 0, 0, 1, 1,
-1.282224, 1.290904, -1.705415, 1, 0, 0, 1, 1,
-1.279015, 1.110421, -0.200088, 1, 0, 0, 1, 1,
-1.254012, 1.019603, -1.617528, 0, 0, 0, 1, 1,
-1.245283, 0.8804352, -1.094232, 0, 0, 0, 1, 1,
-1.238156, 0.518462, 0.2693886, 0, 0, 0, 1, 1,
-1.229852, -1.36388, -2.453176, 0, 0, 0, 1, 1,
-1.217636, -0.9287387, -2.774129, 0, 0, 0, 1, 1,
-1.215083, 1.177317, -0.7124594, 0, 0, 0, 1, 1,
-1.20794, 0.553769, -0.3703576, 0, 0, 0, 1, 1,
-1.200502, -1.0377, -1.678151, 1, 1, 1, 1, 1,
-1.197174, 0.6359636, -0.8938691, 1, 1, 1, 1, 1,
-1.193147, 0.2211747, -3.748132, 1, 1, 1, 1, 1,
-1.192422, -2.051937, -2.803125, 1, 1, 1, 1, 1,
-1.19095, -0.1717712, -1.600917, 1, 1, 1, 1, 1,
-1.182885, -1.853698, -1.666217, 1, 1, 1, 1, 1,
-1.174351, 1.835227, -0.1148207, 1, 1, 1, 1, 1,
-1.169173, 0.1535529, 0.007541758, 1, 1, 1, 1, 1,
-1.165559, 1.506859, -0.07237657, 1, 1, 1, 1, 1,
-1.163041, -0.1838173, -0.4798426, 1, 1, 1, 1, 1,
-1.1562, -0.2818204, -1.708559, 1, 1, 1, 1, 1,
-1.152038, -0.3151824, -2.780494, 1, 1, 1, 1, 1,
-1.146682, 0.7995424, -1.10603, 1, 1, 1, 1, 1,
-1.140009, -1.279497, -1.857013, 1, 1, 1, 1, 1,
-1.132803, 0.4263553, -1.420172, 1, 1, 1, 1, 1,
-1.129905, 2.809038, -1.130373, 0, 0, 1, 1, 1,
-1.127465, -0.4274009, -1.073179, 1, 0, 0, 1, 1,
-1.126427, -1.392541, -1.318805, 1, 0, 0, 1, 1,
-1.125845, 1.343999, -0.9116216, 1, 0, 0, 1, 1,
-1.113403, -1.035762, -0.8587883, 1, 0, 0, 1, 1,
-1.111691, -0.5955406, -0.903505, 1, 0, 0, 1, 1,
-1.111158, 0.2192186, -2.612318, 0, 0, 0, 1, 1,
-1.107868, 0.3189762, -2.32791, 0, 0, 0, 1, 1,
-1.105433, -0.9722394, -2.718762, 0, 0, 0, 1, 1,
-1.101422, -0.7766049, -1.805072, 0, 0, 0, 1, 1,
-1.099593, 1.934532, 0.8104224, 0, 0, 0, 1, 1,
-1.097046, -0.6068286, -1.847975, 0, 0, 0, 1, 1,
-1.094879, -1.036589, -2.281004, 0, 0, 0, 1, 1,
-1.093053, -1.337876, -3.641196, 1, 1, 1, 1, 1,
-1.090609, -1.329556, -4.244102, 1, 1, 1, 1, 1,
-1.089028, -0.1387831, -2.20293, 1, 1, 1, 1, 1,
-1.078502, -0.5527328, -3.862092, 1, 1, 1, 1, 1,
-1.078315, -0.227406, -0.9884573, 1, 1, 1, 1, 1,
-1.078163, 0.6305562, -0.05634446, 1, 1, 1, 1, 1,
-1.076848, 0.7119839, -0.9908687, 1, 1, 1, 1, 1,
-1.074441, -0.3082698, -0.462186, 1, 1, 1, 1, 1,
-1.07409, -1.173231, -1.500511, 1, 1, 1, 1, 1,
-1.067596, 1.004032, -2.338762, 1, 1, 1, 1, 1,
-1.062391, -1.139125, -2.864282, 1, 1, 1, 1, 1,
-1.060306, 0.2261597, 0.7270332, 1, 1, 1, 1, 1,
-1.059866, -0.2623252, -2.229003, 1, 1, 1, 1, 1,
-1.057925, 1.112631, -1.551353, 1, 1, 1, 1, 1,
-1.055044, 0.9115365, -1.648411, 1, 1, 1, 1, 1,
-1.052657, 0.1635211, -2.033804, 0, 0, 1, 1, 1,
-1.052584, -0.4279505, -2.961954, 1, 0, 0, 1, 1,
-1.051711, -1.58286, -1.206262, 1, 0, 0, 1, 1,
-1.04857, 0.2905562, -3.367279, 1, 0, 0, 1, 1,
-1.048064, 1.910451, -1.038274, 1, 0, 0, 1, 1,
-1.04639, -0.9317682, -3.000788, 1, 0, 0, 1, 1,
-1.045198, -1.473455, -2.87699, 0, 0, 0, 1, 1,
-1.041633, -1.279636, -3.028076, 0, 0, 0, 1, 1,
-1.035926, 2.167779, -0.3872483, 0, 0, 0, 1, 1,
-1.033285, -1.822669, -3.622644, 0, 0, 0, 1, 1,
-1.032191, 0.9150329, -0.4620512, 0, 0, 0, 1, 1,
-1.02732, 1.354087, 0.08486473, 0, 0, 0, 1, 1,
-1.025281, -1.037692, -1.979075, 0, 0, 0, 1, 1,
-1.024386, 1.91317, -0.6857117, 1, 1, 1, 1, 1,
-1.020502, -2.420543, -2.80449, 1, 1, 1, 1, 1,
-0.9949495, 1.313086, -1.3258, 1, 1, 1, 1, 1,
-0.993333, 0.6222754, 0.2658501, 1, 1, 1, 1, 1,
-0.9856929, 0.09024511, -0.4363635, 1, 1, 1, 1, 1,
-0.9821182, -0.4931124, -3.223932, 1, 1, 1, 1, 1,
-0.9787179, 0.2350224, -2.16129, 1, 1, 1, 1, 1,
-0.9772366, 0.05622633, -1.923278, 1, 1, 1, 1, 1,
-0.9697917, -3.063886, -3.247605, 1, 1, 1, 1, 1,
-0.9673931, 0.7716504, -0.9594159, 1, 1, 1, 1, 1,
-0.965782, -0.34489, -3.627236, 1, 1, 1, 1, 1,
-0.9620008, 0.3562885, -2.864798, 1, 1, 1, 1, 1,
-0.9617306, 1.160394, -0.4401831, 1, 1, 1, 1, 1,
-0.9576692, -0.7324653, -1.711329, 1, 1, 1, 1, 1,
-0.9544466, 0.6320243, -2.677762, 1, 1, 1, 1, 1,
-0.9528183, 0.2892781, -0.9457842, 0, 0, 1, 1, 1,
-0.9525791, 0.3061413, -2.604368, 1, 0, 0, 1, 1,
-0.9510764, 0.2495984, -0.5107365, 1, 0, 0, 1, 1,
-0.9445726, 0.1362232, -1.781204, 1, 0, 0, 1, 1,
-0.943083, 0.1404711, -1.148288, 1, 0, 0, 1, 1,
-0.9407916, -0.5641148, -2.762002, 1, 0, 0, 1, 1,
-0.9381216, 0.3815971, -1.808268, 0, 0, 0, 1, 1,
-0.9347676, 2.38762, -2.746885, 0, 0, 0, 1, 1,
-0.929799, 0.2064602, -3.116596, 0, 0, 0, 1, 1,
-0.9222404, 0.004706935, -0.5829166, 0, 0, 0, 1, 1,
-0.9179285, -0.3538901, -1.985144, 0, 0, 0, 1, 1,
-0.9176216, -0.7180331, -3.465813, 0, 0, 0, 1, 1,
-0.9127143, 0.2635855, -2.770338, 0, 0, 0, 1, 1,
-0.9124432, 0.3142612, -1.496079, 1, 1, 1, 1, 1,
-0.9123474, 1.428473, -0.7063358, 1, 1, 1, 1, 1,
-0.9116448, 1.39721, -2.424469, 1, 1, 1, 1, 1,
-0.9091813, -0.650688, -3.938947, 1, 1, 1, 1, 1,
-0.9044238, 0.3560022, -2.376338, 1, 1, 1, 1, 1,
-0.9036332, 0.3173178, -0.6231338, 1, 1, 1, 1, 1,
-0.9034194, 0.7877735, 0.4605715, 1, 1, 1, 1, 1,
-0.9003537, -0.1652584, -1.272631, 1, 1, 1, 1, 1,
-0.8992091, 0.7336609, -1.373328, 1, 1, 1, 1, 1,
-0.895784, -0.6249249, -2.685682, 1, 1, 1, 1, 1,
-0.8953837, -1.147039, -2.449249, 1, 1, 1, 1, 1,
-0.8944667, 0.08796293, -1.995633, 1, 1, 1, 1, 1,
-0.8942227, -1.244886, -2.746146, 1, 1, 1, 1, 1,
-0.8941884, -0.1142571, -1.659738, 1, 1, 1, 1, 1,
-0.8923186, -0.05336624, -2.661261, 1, 1, 1, 1, 1,
-0.8821614, 0.3356281, -0.9793529, 0, 0, 1, 1, 1,
-0.8812715, 0.9458394, -1.038366, 1, 0, 0, 1, 1,
-0.87349, -0.1625439, 1.35418, 1, 0, 0, 1, 1,
-0.87088, 1.407757, -2.180443, 1, 0, 0, 1, 1,
-0.8636595, 0.4617051, 0.47304, 1, 0, 0, 1, 1,
-0.8599114, -0.6300813, -2.185663, 1, 0, 0, 1, 1,
-0.8573118, 0.5155048, -1.119427, 0, 0, 0, 1, 1,
-0.8567451, 0.4187915, -0.5199497, 0, 0, 0, 1, 1,
-0.8548951, 0.4806951, -2.200188, 0, 0, 0, 1, 1,
-0.8548225, -0.2167948, -3.681958, 0, 0, 0, 1, 1,
-0.8525398, -0.3329417, -1.221161, 0, 0, 0, 1, 1,
-0.8522086, -0.8221391, -1.819533, 0, 0, 0, 1, 1,
-0.8501814, -0.887587, -3.021737, 0, 0, 0, 1, 1,
-0.8495715, 0.504666, -1.304514, 1, 1, 1, 1, 1,
-0.8450528, 0.283228, -3.442163, 1, 1, 1, 1, 1,
-0.8447063, 1.623015, 0.792986, 1, 1, 1, 1, 1,
-0.8446925, 0.1933714, -1.691917, 1, 1, 1, 1, 1,
-0.8385555, -1.086418, -1.071509, 1, 1, 1, 1, 1,
-0.8369799, -0.48296, -3.071645, 1, 1, 1, 1, 1,
-0.8359013, 2.40723e-05, -0.6586514, 1, 1, 1, 1, 1,
-0.8293223, 0.1644008, -4.053391, 1, 1, 1, 1, 1,
-0.8278387, -0.9370722, -2.797094, 1, 1, 1, 1, 1,
-0.8233575, -0.1496063, -2.440313, 1, 1, 1, 1, 1,
-0.8226885, -1.343238, -2.214359, 1, 1, 1, 1, 1,
-0.821997, 0.2321797, -1.039007, 1, 1, 1, 1, 1,
-0.8161787, -0.422132, -1.933877, 1, 1, 1, 1, 1,
-0.8154532, 1.210252, -2.216063, 1, 1, 1, 1, 1,
-0.8067883, 2.080604, 0.1110123, 1, 1, 1, 1, 1,
-0.8043982, -0.4216002, -1.115605, 0, 0, 1, 1, 1,
-0.8003199, 0.2379536, -0.4692036, 1, 0, 0, 1, 1,
-0.7999605, 1.759313, 0.8545553, 1, 0, 0, 1, 1,
-0.7849826, 0.9942655, 0.5665311, 1, 0, 0, 1, 1,
-0.7832539, -0.0193725, -1.225252, 1, 0, 0, 1, 1,
-0.7772911, 0.9268128, 0.77155, 1, 0, 0, 1, 1,
-0.7757015, 0.1403874, -0.3764288, 0, 0, 0, 1, 1,
-0.7749819, 0.3144114, -2.450515, 0, 0, 0, 1, 1,
-0.7730119, -0.9948909, -0.9630877, 0, 0, 0, 1, 1,
-0.7708455, 0.9646784, -2.271538, 0, 0, 0, 1, 1,
-0.7591679, -2.47019, -3.419837, 0, 0, 0, 1, 1,
-0.7587194, -1.045248, -3.164017, 0, 0, 0, 1, 1,
-0.7585921, 0.2991964, -2.17441, 0, 0, 0, 1, 1,
-0.7544616, -0.3123119, -1.821099, 1, 1, 1, 1, 1,
-0.7468685, -1.348706, -2.192065, 1, 1, 1, 1, 1,
-0.7437742, 1.005533, 0.3309746, 1, 1, 1, 1, 1,
-0.7400907, 0.1636024, -3.040305, 1, 1, 1, 1, 1,
-0.7348148, 1.090418, -1.841964, 1, 1, 1, 1, 1,
-0.733542, -0.4581879, -0.8351223, 1, 1, 1, 1, 1,
-0.7326079, 0.5962855, -2.1504, 1, 1, 1, 1, 1,
-0.7296168, 0.7535171, -0.08999889, 1, 1, 1, 1, 1,
-0.7292192, 0.6968595, 0.08085871, 1, 1, 1, 1, 1,
-0.7291175, 1.066342, -1.96856, 1, 1, 1, 1, 1,
-0.7284222, 0.1698267, -1.014353, 1, 1, 1, 1, 1,
-0.7273964, 0.06908605, 0.4663969, 1, 1, 1, 1, 1,
-0.7261711, -0.03069732, -1.254658, 1, 1, 1, 1, 1,
-0.7243686, 1.284903, -2.080117, 1, 1, 1, 1, 1,
-0.7217535, 1.925521, -1.836426, 1, 1, 1, 1, 1,
-0.721166, -0.1502387, -2.911217, 0, 0, 1, 1, 1,
-0.7174589, -1.83884, -2.058036, 1, 0, 0, 1, 1,
-0.7171203, 1.673828, -0.947558, 1, 0, 0, 1, 1,
-0.7126775, -0.8805705, -3.059354, 1, 0, 0, 1, 1,
-0.7093185, -0.5241526, -0.06975651, 1, 0, 0, 1, 1,
-0.7085333, -0.6219003, -1.856578, 1, 0, 0, 1, 1,
-0.6934758, -1.120502, -2.448195, 0, 0, 0, 1, 1,
-0.6915362, 1.749707, 0.3591355, 0, 0, 0, 1, 1,
-0.6892347, -1.332753, -3.916327, 0, 0, 0, 1, 1,
-0.6885753, 0.01009066, -3.055936, 0, 0, 0, 1, 1,
-0.6883547, -0.2818861, -1.346815, 0, 0, 0, 1, 1,
-0.6836436, 0.5831009, -1.262561, 0, 0, 0, 1, 1,
-0.6824228, -0.3592907, -2.277963, 0, 0, 0, 1, 1,
-0.6819994, 0.3816315, -0.4292739, 1, 1, 1, 1, 1,
-0.6806248, -0.4829806, -1.325704, 1, 1, 1, 1, 1,
-0.6785589, -0.3399357, -1.77584, 1, 1, 1, 1, 1,
-0.6652321, 0.8344649, -1.690078, 1, 1, 1, 1, 1,
-0.6555153, 0.3075045, -1.250715, 1, 1, 1, 1, 1,
-0.6548188, 0.7170514, -1.712488, 1, 1, 1, 1, 1,
-0.6500335, -0.02038166, -2.641878, 1, 1, 1, 1, 1,
-0.6487032, -0.2195579, -1.956124, 1, 1, 1, 1, 1,
-0.6457105, 1.046957, -0.9963853, 1, 1, 1, 1, 1,
-0.6332704, -1.655717, -2.568868, 1, 1, 1, 1, 1,
-0.6249102, -1.844327, -1.891397, 1, 1, 1, 1, 1,
-0.6248537, 2.428922, -0.3522175, 1, 1, 1, 1, 1,
-0.6244429, -0.06052215, -1.027759, 1, 1, 1, 1, 1,
-0.6240292, 0.4765694, -1.527003, 1, 1, 1, 1, 1,
-0.6218322, -0.1352849, 0.06125975, 1, 1, 1, 1, 1,
-0.621545, 0.7089233, -0.3355953, 0, 0, 1, 1, 1,
-0.6206857, 0.1301288, -0.8042718, 1, 0, 0, 1, 1,
-0.6202568, 2.749197, -0.3695209, 1, 0, 0, 1, 1,
-0.6145322, 0.5861911, 0.6187888, 1, 0, 0, 1, 1,
-0.6038482, 0.5399633, -1.750278, 1, 0, 0, 1, 1,
-0.6030321, 0.6260076, -0.4937117, 1, 0, 0, 1, 1,
-0.6026888, 0.638032, -0.1858844, 0, 0, 0, 1, 1,
-0.6025696, -0.4075858, -1.008144, 0, 0, 0, 1, 1,
-0.5889034, -0.2570517, -2.604511, 0, 0, 0, 1, 1,
-0.5845237, 0.3412547, -0.2424398, 0, 0, 0, 1, 1,
-0.5828373, -0.3884005, -2.467923, 0, 0, 0, 1, 1,
-0.5814724, 0.3850721, -0.5610523, 0, 0, 0, 1, 1,
-0.5724741, 0.9516776, -1.018946, 0, 0, 0, 1, 1,
-0.566153, 1.298816, -1.922333, 1, 1, 1, 1, 1,
-0.5646954, 1.592228, 0.5425536, 1, 1, 1, 1, 1,
-0.5611733, 1.232856, 0.2177979, 1, 1, 1, 1, 1,
-0.5568609, 0.717038, -0.6811457, 1, 1, 1, 1, 1,
-0.5564963, -0.774075, -1.055261, 1, 1, 1, 1, 1,
-0.553267, -1.099111, -0.8453542, 1, 1, 1, 1, 1,
-0.5524524, -0.4287887, -1.324574, 1, 1, 1, 1, 1,
-0.5473921, -0.284468, -2.017319, 1, 1, 1, 1, 1,
-0.5447212, 0.1533716, -0.8938254, 1, 1, 1, 1, 1,
-0.5445089, -0.2162094, -1.949688, 1, 1, 1, 1, 1,
-0.5440748, -0.2731818, -1.896243, 1, 1, 1, 1, 1,
-0.541575, -0.08547635, -1.748671, 1, 1, 1, 1, 1,
-0.540962, 0.9483188, -0.5184152, 1, 1, 1, 1, 1,
-0.5386623, -0.9488336, -2.430044, 1, 1, 1, 1, 1,
-0.5384813, 0.8369329, 0.3281143, 1, 1, 1, 1, 1,
-0.5340138, -0.7229908, -3.412776, 0, 0, 1, 1, 1,
-0.5318301, 1.051015, -1.77141, 1, 0, 0, 1, 1,
-0.5269622, -1.899408, -2.47162, 1, 0, 0, 1, 1,
-0.5255254, -0.9439242, -3.715632, 1, 0, 0, 1, 1,
-0.5231499, -0.7769465, -1.038181, 1, 0, 0, 1, 1,
-0.5211377, 0.3880346, 0.2381317, 1, 0, 0, 1, 1,
-0.519784, -0.1918092, -1.442591, 0, 0, 0, 1, 1,
-0.517276, 1.609009, 1.477778, 0, 0, 0, 1, 1,
-0.5142952, 1.094438, -0.1004255, 0, 0, 0, 1, 1,
-0.5114155, -0.536799, -1.241717, 0, 0, 0, 1, 1,
-0.5076686, -0.6692291, -2.793678, 0, 0, 0, 1, 1,
-0.5059088, -0.4578162, -3.593289, 0, 0, 0, 1, 1,
-0.501901, 1.949141, -0.1991128, 0, 0, 0, 1, 1,
-0.5013794, -2.958617, -3.041644, 1, 1, 1, 1, 1,
-0.4986367, -2.043453, -2.249708, 1, 1, 1, 1, 1,
-0.4931015, -1.454632, -0.7953417, 1, 1, 1, 1, 1,
-0.4924427, -1.167607, -1.873202, 1, 1, 1, 1, 1,
-0.4915859, 1.880798, 0.9920566, 1, 1, 1, 1, 1,
-0.4875658, 0.06551889, -2.279888, 1, 1, 1, 1, 1,
-0.4834114, 0.5452579, -2.098534, 1, 1, 1, 1, 1,
-0.4762488, 0.6773748, 0.3906611, 1, 1, 1, 1, 1,
-0.4720596, 1.59758, -1.312754, 1, 1, 1, 1, 1,
-0.4647635, -0.6027576, -1.306535, 1, 1, 1, 1, 1,
-0.4640478, 1.10955, -1.199046, 1, 1, 1, 1, 1,
-0.4632168, -0.463779, -1.925815, 1, 1, 1, 1, 1,
-0.4599264, -0.1795579, -1.890772, 1, 1, 1, 1, 1,
-0.4562694, -0.2432559, -3.863415, 1, 1, 1, 1, 1,
-0.4513442, -0.1886978, -1.602818, 1, 1, 1, 1, 1,
-0.4512466, 0.009575931, -0.3791857, 0, 0, 1, 1, 1,
-0.449094, 0.4990695, 0.7906158, 1, 0, 0, 1, 1,
-0.4489976, -0.305742, -2.889363, 1, 0, 0, 1, 1,
-0.4432731, 2.10785, 0.2548556, 1, 0, 0, 1, 1,
-0.4254116, -1.271497, -2.573025, 1, 0, 0, 1, 1,
-0.4212143, -0.7185836, -2.076773, 1, 0, 0, 1, 1,
-0.4203528, 1.103913, 0.9696132, 0, 0, 0, 1, 1,
-0.4187382, -0.5087678, -1.390111, 0, 0, 0, 1, 1,
-0.4183071, 0.6093274, 0.3679713, 0, 0, 0, 1, 1,
-0.4172918, -0.3538016, -3.796579, 0, 0, 0, 1, 1,
-0.4168011, 1.02146, -1.05814, 0, 0, 0, 1, 1,
-0.4140372, 1.168276, -1.149543, 0, 0, 0, 1, 1,
-0.4118727, -0.1294042, -2.915832, 0, 0, 0, 1, 1,
-0.4097673, -0.408314, -3.082964, 1, 1, 1, 1, 1,
-0.408587, -0.7401798, -2.71538, 1, 1, 1, 1, 1,
-0.4035303, -0.76389, -2.512112, 1, 1, 1, 1, 1,
-0.4032289, 0.08102205, -0.9693523, 1, 1, 1, 1, 1,
-0.402749, 1.335484, 0.720691, 1, 1, 1, 1, 1,
-0.3956685, 3.890409, 0.538718, 1, 1, 1, 1, 1,
-0.3932336, -1.102899, -2.770424, 1, 1, 1, 1, 1,
-0.3888653, 1.745404, 1.246932, 1, 1, 1, 1, 1,
-0.3862129, 0.5316601, -0.8438254, 1, 1, 1, 1, 1,
-0.3795256, -1.189606, -2.708458, 1, 1, 1, 1, 1,
-0.3738195, 0.5502791, 0.706376, 1, 1, 1, 1, 1,
-0.3717905, 1.089377, -0.6596196, 1, 1, 1, 1, 1,
-0.3710751, -4.032121, -3.825573, 1, 1, 1, 1, 1,
-0.370099, -0.6737098, -2.230884, 1, 1, 1, 1, 1,
-0.3675102, -1.319521, -4.371254, 1, 1, 1, 1, 1,
-0.3609338, -0.8163595, -2.899441, 0, 0, 1, 1, 1,
-0.3607561, -0.5862012, -2.052078, 1, 0, 0, 1, 1,
-0.3545708, 1.443364, 1.930166, 1, 0, 0, 1, 1,
-0.3494595, 0.9679022, 0.5288155, 1, 0, 0, 1, 1,
-0.3480964, 1.13196, 1.301964, 1, 0, 0, 1, 1,
-0.3475159, -0.3486226, -0.2911312, 1, 0, 0, 1, 1,
-0.346382, 1.618613, 0.2047188, 0, 0, 0, 1, 1,
-0.3373641, 0.1950043, -0.4175661, 0, 0, 0, 1, 1,
-0.3365785, -1.612822, -3.410469, 0, 0, 0, 1, 1,
-0.3344005, -0.008438116, -0.3795263, 0, 0, 0, 1, 1,
-0.3275835, 1.703743, 1.625534, 0, 0, 0, 1, 1,
-0.3272168, 1.406969, 0.213456, 0, 0, 0, 1, 1,
-0.3249774, -0.1539664, -1.235196, 0, 0, 0, 1, 1,
-0.3240432, -1.369303, -2.033305, 1, 1, 1, 1, 1,
-0.3235147, -0.6824102, -1.854933, 1, 1, 1, 1, 1,
-0.3218814, 0.470816, -3.077204, 1, 1, 1, 1, 1,
-0.3199643, -0.0544275, -2.385627, 1, 1, 1, 1, 1,
-0.3197237, 0.9848109, -0.1647323, 1, 1, 1, 1, 1,
-0.3191561, 0.6976448, -0.8569227, 1, 1, 1, 1, 1,
-0.3070755, -0.1466291, -4.094966, 1, 1, 1, 1, 1,
-0.3064731, -0.3170818, -2.970601, 1, 1, 1, 1, 1,
-0.3055883, -0.3252389, -1.773504, 1, 1, 1, 1, 1,
-0.3045073, -1.014216, -2.757311, 1, 1, 1, 1, 1,
-0.3036017, -0.09451272, -1.869649, 1, 1, 1, 1, 1,
-0.3035962, -0.02218483, -1.168579, 1, 1, 1, 1, 1,
-0.3029165, -0.4431627, -3.916172, 1, 1, 1, 1, 1,
-0.3022462, -1.816471, -2.808257, 1, 1, 1, 1, 1,
-0.2987539, -1.116431, -2.440675, 1, 1, 1, 1, 1,
-0.294076, -0.7725211, -1.487208, 0, 0, 1, 1, 1,
-0.2891987, 0.5524036, -0.1864549, 1, 0, 0, 1, 1,
-0.2844392, -0.127854, -1.115503, 1, 0, 0, 1, 1,
-0.2837082, -0.9707192, -2.687241, 1, 0, 0, 1, 1,
-0.2828416, 0.5305757, 1.888105, 1, 0, 0, 1, 1,
-0.2757925, -0.3951777, -3.706295, 1, 0, 0, 1, 1,
-0.2708304, -0.01695739, -1.785585, 0, 0, 0, 1, 1,
-0.2677513, 1.094779, 0.9801337, 0, 0, 0, 1, 1,
-0.2616553, 0.3260433, -0.2631468, 0, 0, 0, 1, 1,
-0.2602248, 0.6743345, -0.9655746, 0, 0, 0, 1, 1,
-0.2584785, 0.4473891, 0.8002424, 0, 0, 0, 1, 1,
-0.2560562, -0.3968763, -4.369982, 0, 0, 0, 1, 1,
-0.255378, -1.752401, -3.693149, 0, 0, 0, 1, 1,
-0.2549418, 0.8220065, 0.3079927, 1, 1, 1, 1, 1,
-0.2539441, -0.6666162, -1.486822, 1, 1, 1, 1, 1,
-0.2538174, -1.246997, -2.699374, 1, 1, 1, 1, 1,
-0.2524101, 0.9060003, 0.7155874, 1, 1, 1, 1, 1,
-0.2505101, -0.04746832, -2.020082, 1, 1, 1, 1, 1,
-0.2502973, -0.5946192, -3.955594, 1, 1, 1, 1, 1,
-0.2428534, -1.225651, -2.642735, 1, 1, 1, 1, 1,
-0.2399964, -1.552621, -2.308066, 1, 1, 1, 1, 1,
-0.2398613, 0.5589404, -1.02451, 1, 1, 1, 1, 1,
-0.2380141, -1.108756, -3.711352, 1, 1, 1, 1, 1,
-0.2370023, -0.6398087, -3.218538, 1, 1, 1, 1, 1,
-0.2354073, 0.6913444, 1.309772, 1, 1, 1, 1, 1,
-0.2343799, 1.000585, 0.03613301, 1, 1, 1, 1, 1,
-0.2333782, 0.2778476, -1.713473, 1, 1, 1, 1, 1,
-0.2272934, 0.8503775, -1.265099, 1, 1, 1, 1, 1,
-0.2271407, -1.660037, -2.915496, 0, 0, 1, 1, 1,
-0.2203941, 0.0279224, -1.530247, 1, 0, 0, 1, 1,
-0.2176923, 0.02490525, -3.838181, 1, 0, 0, 1, 1,
-0.2128705, -0.3155357, -1.74472, 1, 0, 0, 1, 1,
-0.2098561, -0.1651646, -3.040224, 1, 0, 0, 1, 1,
-0.2085062, 0.3046003, 0.315448, 1, 0, 0, 1, 1,
-0.2066833, 0.1620617, -0.8438329, 0, 0, 0, 1, 1,
-0.2059042, -0.8794816, -3.161898, 0, 0, 0, 1, 1,
-0.2037705, 2.003526, 0.8644766, 0, 0, 0, 1, 1,
-0.1987496, -0.05952024, -1.510628, 0, 0, 0, 1, 1,
-0.1980783, -0.1102692, -3.33111, 0, 0, 0, 1, 1,
-0.1977051, -1.180098, -2.09896, 0, 0, 0, 1, 1,
-0.1963717, 0.914928, 0.1390971, 0, 0, 0, 1, 1,
-0.1950842, -0.9806649, -3.855682, 1, 1, 1, 1, 1,
-0.1933093, -1.689861, -5.292639, 1, 1, 1, 1, 1,
-0.1916231, -0.5226134, -3.991606, 1, 1, 1, 1, 1,
-0.189491, 0.08266727, -2.200423, 1, 1, 1, 1, 1,
-0.1894823, -1.930611, -2.27443, 1, 1, 1, 1, 1,
-0.1876638, 0.4968021, -1.108933, 1, 1, 1, 1, 1,
-0.1823246, -0.1474136, -3.161638, 1, 1, 1, 1, 1,
-0.1814248, -0.1926092, -1.707757, 1, 1, 1, 1, 1,
-0.1812914, -0.4807065, -1.857674, 1, 1, 1, 1, 1,
-0.1738616, 0.04155421, -3.442441, 1, 1, 1, 1, 1,
-0.1729125, 1.236024, -1.644554, 1, 1, 1, 1, 1,
-0.1706079, 0.04830375, 0.3939469, 1, 1, 1, 1, 1,
-0.1627882, 1.398667, 0.5721551, 1, 1, 1, 1, 1,
-0.1610203, 0.4211873, -0.7778161, 1, 1, 1, 1, 1,
-0.158746, 1.052294, -1.416462, 1, 1, 1, 1, 1,
-0.1577424, 0.8864607, 0.5165486, 0, 0, 1, 1, 1,
-0.1573612, -0.7308235, -2.393012, 1, 0, 0, 1, 1,
-0.1566499, -0.8902032, -2.439111, 1, 0, 0, 1, 1,
-0.1537395, 0.4122999, -1.257719, 1, 0, 0, 1, 1,
-0.1493537, -1.395246, -3.599247, 1, 0, 0, 1, 1,
-0.1487681, 1.58994, 0.6759801, 1, 0, 0, 1, 1,
-0.1431512, -1.299668, -3.719966, 0, 0, 0, 1, 1,
-0.1407149, 1.031726, -0.1159954, 0, 0, 0, 1, 1,
-0.135852, -0.4026375, -2.609299, 0, 0, 0, 1, 1,
-0.1346844, -1.741803, -3.436954, 0, 0, 0, 1, 1,
-0.1345468, 0.8811037, -1.830076, 0, 0, 0, 1, 1,
-0.1336256, 1.150359, 0.81273, 0, 0, 0, 1, 1,
-0.1319012, 1.12182, -0.1510212, 0, 0, 0, 1, 1,
-0.1291703, 1.278262, -1.311879, 1, 1, 1, 1, 1,
-0.1261697, -0.3611077, -1.915745, 1, 1, 1, 1, 1,
-0.1164577, -0.1027319, -2.93335, 1, 1, 1, 1, 1,
-0.1159432, 1.278367, -1.441389, 1, 1, 1, 1, 1,
-0.1143977, 0.5399029, 0.2137931, 1, 1, 1, 1, 1,
-0.1135349, -0.6581258, -2.230925, 1, 1, 1, 1, 1,
-0.1130608, -0.6929944, -2.630192, 1, 1, 1, 1, 1,
-0.1116401, 0.5856106, -2.227562, 1, 1, 1, 1, 1,
-0.1042621, 0.08391313, -1.407466, 1, 1, 1, 1, 1,
-0.1026949, 0.5985894, 0.2962483, 1, 1, 1, 1, 1,
-0.1007633, 0.4343267, -0.5149829, 1, 1, 1, 1, 1,
-0.09854829, -0.05790974, -1.803928, 1, 1, 1, 1, 1,
-0.09460992, -0.1798884, -1.957704, 1, 1, 1, 1, 1,
-0.0930005, 1.583887, 1.208699, 1, 1, 1, 1, 1,
-0.08679187, 0.4529622, 0.2638018, 1, 1, 1, 1, 1,
-0.08446965, -0.006753311, -0.9076303, 0, 0, 1, 1, 1,
-0.08180158, -0.5086098, -2.749702, 1, 0, 0, 1, 1,
-0.08172028, -0.6464176, -2.043512, 1, 0, 0, 1, 1,
-0.073604, -0.4058047, -1.698899, 1, 0, 0, 1, 1,
-0.06656156, 0.1284887, 0.373634, 1, 0, 0, 1, 1,
-0.06305134, -1.823115, -4.427274, 1, 0, 0, 1, 1,
-0.05924468, 3.723639, -0.8281429, 0, 0, 0, 1, 1,
-0.0584495, -0.5606712, -2.486479, 0, 0, 0, 1, 1,
-0.0572434, 0.5735642, 0.607109, 0, 0, 0, 1, 1,
-0.05516473, -1.043104, -3.41196, 0, 0, 0, 1, 1,
-0.05426294, 0.2010294, -0.6842047, 0, 0, 0, 1, 1,
-0.05329806, -0.8444705, -3.169789, 0, 0, 0, 1, 1,
-0.05307995, -0.2847787, -1.474911, 0, 0, 0, 1, 1,
-0.05286592, 1.196058, 0.0906828, 1, 1, 1, 1, 1,
-0.05150484, 1.319853, -0.476691, 1, 1, 1, 1, 1,
-0.04958795, 2.143473, 1.759696, 1, 1, 1, 1, 1,
-0.04898451, -0.2646987, -2.164482, 1, 1, 1, 1, 1,
-0.04282301, -1.123744, -2.993566, 1, 1, 1, 1, 1,
-0.03891198, -0.3181269, -1.792403, 1, 1, 1, 1, 1,
-0.03877834, -1.207085, -5.597683, 1, 1, 1, 1, 1,
-0.03799213, -2.036284, -3.349621, 1, 1, 1, 1, 1,
-0.03518546, -0.2923534, -2.107158, 1, 1, 1, 1, 1,
-0.03407934, 0.6009737, 0.7976873, 1, 1, 1, 1, 1,
-0.03370937, 1.076803, -1.010525, 1, 1, 1, 1, 1,
-0.03332603, -0.321526, -3.093038, 1, 1, 1, 1, 1,
-0.02975732, 1.1174, 0.007790732, 1, 1, 1, 1, 1,
-0.02781153, 1.249841, 0.3771712, 1, 1, 1, 1, 1,
-0.0254948, -1.165474, -2.975498, 1, 1, 1, 1, 1,
-0.02286272, 1.434333, -0.5534585, 0, 0, 1, 1, 1,
-0.01757455, 0.02941996, -0.7029541, 1, 0, 0, 1, 1,
-0.01682573, -0.9733567, -3.578392, 1, 0, 0, 1, 1,
-0.01574414, 0.1273879, 0.5170062, 1, 0, 0, 1, 1,
-0.01324806, 0.7927797, 0.6525864, 1, 0, 0, 1, 1,
-0.01165009, 2.046277, -0.09624118, 1, 0, 0, 1, 1,
-0.007840265, -0.9653702, -3.918838, 0, 0, 0, 1, 1,
-0.005061796, -0.2669925, -1.447417, 0, 0, 0, 1, 1,
-0.004454707, -0.4743448, -2.968378, 0, 0, 0, 1, 1,
-0.002945185, -0.611154, -4.572085, 0, 0, 0, 1, 1,
0.005811595, -0.1016954, 2.654561, 0, 0, 0, 1, 1,
0.01312182, 2.454625, 0.1544222, 0, 0, 0, 1, 1,
0.01364159, 0.1856968, 0.5457551, 0, 0, 0, 1, 1,
0.01706839, 0.4222099, 0.5700294, 1, 1, 1, 1, 1,
0.02550048, 0.7452252, 1.128349, 1, 1, 1, 1, 1,
0.02649269, -0.1623214, 1.341717, 1, 1, 1, 1, 1,
0.02740003, 1.056509, -0.7520459, 1, 1, 1, 1, 1,
0.02831195, -1.007322, 3.957363, 1, 1, 1, 1, 1,
0.03046534, 0.8485442, 0.1318371, 1, 1, 1, 1, 1,
0.03294586, -0.6458032, 3.641158, 1, 1, 1, 1, 1,
0.03312808, -1.754306, 2.981063, 1, 1, 1, 1, 1,
0.03561306, -1.397853, 3.657777, 1, 1, 1, 1, 1,
0.03590384, -0.6614903, 1.825362, 1, 1, 1, 1, 1,
0.03777096, -0.5931789, 3.494115, 1, 1, 1, 1, 1,
0.03979761, 0.352767, 1.071429, 1, 1, 1, 1, 1,
0.04026147, 0.1970862, 0.7350935, 1, 1, 1, 1, 1,
0.04225652, 1.236072, 0.2547653, 1, 1, 1, 1, 1,
0.04316189, -1.150752, 2.706149, 1, 1, 1, 1, 1,
0.04454756, 0.9254973, -0.350961, 0, 0, 1, 1, 1,
0.04532541, -1.204894, 2.7954, 1, 0, 0, 1, 1,
0.04627394, 0.7412044, -0.4768529, 1, 0, 0, 1, 1,
0.04867502, 0.2820234, -0.1185016, 1, 0, 0, 1, 1,
0.05115352, -0.7109371, 1.516314, 1, 0, 0, 1, 1,
0.05155079, 0.3204299, 0.8166351, 1, 0, 0, 1, 1,
0.05466295, -0.6684068, 2.943587, 0, 0, 0, 1, 1,
0.05658695, 1.052642, -0.4835878, 0, 0, 0, 1, 1,
0.05707425, -0.4838573, 3.418377, 0, 0, 0, 1, 1,
0.05913427, 0.3669092, -0.7375066, 0, 0, 0, 1, 1,
0.06178413, 0.8812401, 0.6683488, 0, 0, 0, 1, 1,
0.06200584, 0.1816, 0.7791545, 0, 0, 0, 1, 1,
0.06559394, -1.977885, 2.945014, 0, 0, 0, 1, 1,
0.06764507, -0.8080955, 3.140098, 1, 1, 1, 1, 1,
0.07112685, 1.670326, -0.6752698, 1, 1, 1, 1, 1,
0.07281859, 0.5192044, -1.247798, 1, 1, 1, 1, 1,
0.07378265, -1.096458, 4.461002, 1, 1, 1, 1, 1,
0.07524976, 0.1204612, 1.677487, 1, 1, 1, 1, 1,
0.08322075, -0.105869, 2.892755, 1, 1, 1, 1, 1,
0.08409123, 0.7156555, 0.4282474, 1, 1, 1, 1, 1,
0.0872487, 0.1670045, -0.05231226, 1, 1, 1, 1, 1,
0.08766107, 0.8363616, 0.853126, 1, 1, 1, 1, 1,
0.08971425, 0.2478933, 2.51704, 1, 1, 1, 1, 1,
0.09148225, 0.1283015, 1.029628, 1, 1, 1, 1, 1,
0.09895141, 1.526865, -0.9176835, 1, 1, 1, 1, 1,
0.1011439, 1.901739, 1.497198, 1, 1, 1, 1, 1,
0.1038171, 0.6957724, 0.5588739, 1, 1, 1, 1, 1,
0.1039233, 0.9710146, -0.6146505, 1, 1, 1, 1, 1,
0.1067693, -0.443222, 4.200202, 0, 0, 1, 1, 1,
0.1070566, 0.869284, 0.9741477, 1, 0, 0, 1, 1,
0.1124447, -0.2866721, 3.050272, 1, 0, 0, 1, 1,
0.1144219, 1.813731, -0.7690442, 1, 0, 0, 1, 1,
0.1184902, 1.15718, -1.121743, 1, 0, 0, 1, 1,
0.1194172, -1.046187, 2.92768, 1, 0, 0, 1, 1,
0.1223326, 0.07811976, 1.631242, 0, 0, 0, 1, 1,
0.1237488, 1.477581, 0.4243818, 0, 0, 0, 1, 1,
0.1244387, -1.880344, 2.986772, 0, 0, 0, 1, 1,
0.1259651, 0.2842878, 1.498361, 0, 0, 0, 1, 1,
0.127609, -0.382132, 1.451259, 0, 0, 0, 1, 1,
0.1281507, 0.3612082, 0.7668406, 0, 0, 0, 1, 1,
0.1385837, 1.260589, -1.338228, 0, 0, 0, 1, 1,
0.1398179, 0.9413735, 2.084236, 1, 1, 1, 1, 1,
0.1445048, 0.9794962, 0.05315816, 1, 1, 1, 1, 1,
0.1505884, 0.4384714, 1.739319, 1, 1, 1, 1, 1,
0.1561022, 0.4608267, 0.7272786, 1, 1, 1, 1, 1,
0.157101, -1.621094, 2.287721, 1, 1, 1, 1, 1,
0.1616168, 0.5783468, -0.4186331, 1, 1, 1, 1, 1,
0.1624601, 0.2849699, 1.131933, 1, 1, 1, 1, 1,
0.1633799, 0.9962261, 0.1891328, 1, 1, 1, 1, 1,
0.1646597, -1.356579, 2.805639, 1, 1, 1, 1, 1,
0.1667681, -0.8846779, 3.676605, 1, 1, 1, 1, 1,
0.166903, -1.814843, 1.710551, 1, 1, 1, 1, 1,
0.1685047, -0.1486395, -0.09099323, 1, 1, 1, 1, 1,
0.1685932, -2.457193, 2.017975, 1, 1, 1, 1, 1,
0.1735697, -1.477805, 1.483882, 1, 1, 1, 1, 1,
0.173669, 0.7027925, 1.085908, 1, 1, 1, 1, 1,
0.1771705, 0.6875906, -0.3177343, 0, 0, 1, 1, 1,
0.1786358, -0.1536518, 1.451458, 1, 0, 0, 1, 1,
0.1823961, 0.9414574, -0.681502, 1, 0, 0, 1, 1,
0.1840714, 1.633075, -0.3450046, 1, 0, 0, 1, 1,
0.187368, 0.6434181, 0.1412315, 1, 0, 0, 1, 1,
0.1878524, 1.910837, -0.7802923, 1, 0, 0, 1, 1,
0.1896781, 0.03681258, 0.2821196, 0, 0, 0, 1, 1,
0.191117, 0.49351, 1.702727, 0, 0, 0, 1, 1,
0.1919827, 1.741829, -0.2670353, 0, 0, 0, 1, 1,
0.194362, 0.6567591, -1.561574, 0, 0, 0, 1, 1,
0.1982039, 0.4887292, -0.5217344, 0, 0, 0, 1, 1,
0.2071616, 0.724168, 1.017385, 0, 0, 0, 1, 1,
0.2120214, -1.387794, 3.540806, 0, 0, 0, 1, 1,
0.2141281, 0.07461862, 1.163869, 1, 1, 1, 1, 1,
0.2146789, -3.575446, 2.903824, 1, 1, 1, 1, 1,
0.2147236, -0.8061695, 3.530672, 1, 1, 1, 1, 1,
0.2176522, -2.367829, 2.988941, 1, 1, 1, 1, 1,
0.218071, -1.513009, 1.861221, 1, 1, 1, 1, 1,
0.2189635, -0.5985689, 1.845755, 1, 1, 1, 1, 1,
0.2233642, -0.2242747, 2.767371, 1, 1, 1, 1, 1,
0.2291992, -0.9728426, 4.136614, 1, 1, 1, 1, 1,
0.229909, 1.730735, -1.161444, 1, 1, 1, 1, 1,
0.2329717, -0.2037455, 2.638289, 1, 1, 1, 1, 1,
0.2336389, 0.2283815, 0.4980072, 1, 1, 1, 1, 1,
0.2339118, 0.2548707, 1.415718, 1, 1, 1, 1, 1,
0.2361457, -0.3801955, 0.3188831, 1, 1, 1, 1, 1,
0.2362168, 1.114545, -0.2841367, 1, 1, 1, 1, 1,
0.2371179, -0.1680515, 1.306034, 1, 1, 1, 1, 1,
0.2413044, 0.7224144, 0.7423722, 0, 0, 1, 1, 1,
0.2523842, -0.2778945, 2.395135, 1, 0, 0, 1, 1,
0.2581645, -1.518114, 3.816938, 1, 0, 0, 1, 1,
0.25907, 0.9978565, 0.9194369, 1, 0, 0, 1, 1,
0.2631273, -0.9014382, 3.444928, 1, 0, 0, 1, 1,
0.2646495, 1.572986, 0.02957198, 1, 0, 0, 1, 1,
0.2659156, 0.6026331, 0.2805891, 0, 0, 0, 1, 1,
0.2663198, 0.9312575, -0.3715987, 0, 0, 0, 1, 1,
0.2705346, 0.2917063, 0.4535886, 0, 0, 0, 1, 1,
0.2741648, -0.5563088, 1.620397, 0, 0, 0, 1, 1,
0.2768399, 0.2894531, 1.696771, 0, 0, 0, 1, 1,
0.2800326, -0.4844197, 2.537009, 0, 0, 0, 1, 1,
0.2806168, 0.7873505, -2.287254, 0, 0, 0, 1, 1,
0.2816996, 0.784615, 1.59882, 1, 1, 1, 1, 1,
0.2839193, 0.02239765, 1.480813, 1, 1, 1, 1, 1,
0.2857372, 1.460364, 0.6741413, 1, 1, 1, 1, 1,
0.2908533, 0.09592919, 1.262641, 1, 1, 1, 1, 1,
0.2927595, 0.0690763, 2.228123, 1, 1, 1, 1, 1,
0.302259, 0.4620833, 0.4397992, 1, 1, 1, 1, 1,
0.3035644, 0.4124971, 1.178499, 1, 1, 1, 1, 1,
0.3090111, 0.3898151, 1.123669, 1, 1, 1, 1, 1,
0.3091595, -0.872145, 2.017746, 1, 1, 1, 1, 1,
0.3163554, 0.5475786, 1.631404, 1, 1, 1, 1, 1,
0.3170862, 1.550249, 0.3561517, 1, 1, 1, 1, 1,
0.3224034, 1.113013, 1.22567, 1, 1, 1, 1, 1,
0.3236945, -1.505836, 3.336349, 1, 1, 1, 1, 1,
0.3240693, 0.4254935, -0.05096737, 1, 1, 1, 1, 1,
0.3243777, -0.1484926, 2.189614, 1, 1, 1, 1, 1,
0.3284227, 1.886402, 0.3630998, 0, 0, 1, 1, 1,
0.3328456, -1.376422, 3.465465, 1, 0, 0, 1, 1,
0.3344447, 0.7315142, 1.134356, 1, 0, 0, 1, 1,
0.3346767, -0.0928565, 2.236378, 1, 0, 0, 1, 1,
0.3347617, -0.457329, 4.161048, 1, 0, 0, 1, 1,
0.3367207, -1.085694, 3.692721, 1, 0, 0, 1, 1,
0.3446805, 0.03049469, 2.34677, 0, 0, 0, 1, 1,
0.3465138, -0.9337088, 3.334041, 0, 0, 0, 1, 1,
0.3466223, -0.5656662, 2.711742, 0, 0, 0, 1, 1,
0.3494248, 3.481429, -0.05636661, 0, 0, 0, 1, 1,
0.3594065, 0.3149522, 1.091391, 0, 0, 0, 1, 1,
0.3613354, 1.434442, 0.2430454, 0, 0, 0, 1, 1,
0.3622999, -0.9972976, 3.682435, 0, 0, 0, 1, 1,
0.3646673, 0.4840252, -0.01214525, 1, 1, 1, 1, 1,
0.3665207, 0.7034678, 1.869629, 1, 1, 1, 1, 1,
0.3690808, -0.2364476, 0.8989164, 1, 1, 1, 1, 1,
0.3702773, -1.041781, 2.139679, 1, 1, 1, 1, 1,
0.3730432, -1.327173, 1.057218, 1, 1, 1, 1, 1,
0.3738459, -1.342462, 0.1851289, 1, 1, 1, 1, 1,
0.375113, 1.427021, 0.345241, 1, 1, 1, 1, 1,
0.3771974, 0.8913509, -0.4611996, 1, 1, 1, 1, 1,
0.3782781, 1.115887, 1.410736, 1, 1, 1, 1, 1,
0.3800757, 1.14045, 1.088657, 1, 1, 1, 1, 1,
0.3841861, 0.9646283, -0.6205487, 1, 1, 1, 1, 1,
0.3882847, 0.9187497, -1.826073, 1, 1, 1, 1, 1,
0.3952307, -0.8606407, 2.150389, 1, 1, 1, 1, 1,
0.3970607, -0.8513628, 1.453078, 1, 1, 1, 1, 1,
0.3983784, 1.783919, 0.01517017, 1, 1, 1, 1, 1,
0.399703, 0.8031028, 1.930488, 0, 0, 1, 1, 1,
0.4016999, 0.6914707, -0.8413388, 1, 0, 0, 1, 1,
0.4025678, 0.9932708, 0.6795048, 1, 0, 0, 1, 1,
0.4028369, 0.6283287, -0.5392296, 1, 0, 0, 1, 1,
0.403681, -1.268906, 0.5596218, 1, 0, 0, 1, 1,
0.4073744, 1.876468, 1.056925, 1, 0, 0, 1, 1,
0.4079329, -0.9432064, 1.830923, 0, 0, 0, 1, 1,
0.4095033, 0.02395706, 1.831716, 0, 0, 0, 1, 1,
0.4097362, 0.5612777, -0.9265203, 0, 0, 0, 1, 1,
0.415528, -0.839522, 2.461993, 0, 0, 0, 1, 1,
0.4206078, -0.1211942, 0.2640493, 0, 0, 0, 1, 1,
0.4230459, -1.869117, 3.72654, 0, 0, 0, 1, 1,
0.4249958, 0.2456009, 0.256671, 0, 0, 0, 1, 1,
0.425449, -1.619232, 4.192238, 1, 1, 1, 1, 1,
0.428597, -0.8243985, 1.681292, 1, 1, 1, 1, 1,
0.4295297, -0.01252188, 2.52565, 1, 1, 1, 1, 1,
0.4299883, -0.3603697, 2.904549, 1, 1, 1, 1, 1,
0.4306389, 0.6061237, 1.063322, 1, 1, 1, 1, 1,
0.4362296, -0.9056391, 3.891591, 1, 1, 1, 1, 1,
0.4624916, -0.4373025, 3.103461, 1, 1, 1, 1, 1,
0.4638599, 0.05168319, 0.4013751, 1, 1, 1, 1, 1,
0.467346, 1.419193, -0.9412758, 1, 1, 1, 1, 1,
0.4678867, -0.7671342, 3.876759, 1, 1, 1, 1, 1,
0.4752936, -0.4088864, 1.577378, 1, 1, 1, 1, 1,
0.4790979, 0.177543, 0.8370032, 1, 1, 1, 1, 1,
0.479369, 0.148597, 2.849683, 1, 1, 1, 1, 1,
0.4812938, 1.283872, 1.496688, 1, 1, 1, 1, 1,
0.4856673, 0.3261566, 1.070014, 1, 1, 1, 1, 1,
0.4915499, 0.1409556, 1.579508, 0, 0, 1, 1, 1,
0.4957279, 0.07295763, 0.7767503, 1, 0, 0, 1, 1,
0.4968118, 0.5692351, 1.401591, 1, 0, 0, 1, 1,
0.4974265, 0.2901376, -0.5728853, 1, 0, 0, 1, 1,
0.4991843, 0.9895394, -2.433466, 1, 0, 0, 1, 1,
0.5032673, 0.05883683, 1.099271, 1, 0, 0, 1, 1,
0.5072998, 0.7593828, 2.123924, 0, 0, 0, 1, 1,
0.5073541, 0.5899691, 2.102639, 0, 0, 0, 1, 1,
0.5136876, -0.4528601, 3.296002, 0, 0, 0, 1, 1,
0.5145974, -1.537889, 3.983994, 0, 0, 0, 1, 1,
0.5163882, -1.571999, 2.132285, 0, 0, 0, 1, 1,
0.5233166, 0.604537, 1.25988, 0, 0, 0, 1, 1,
0.5361885, 1.055118, -2.049947, 0, 0, 0, 1, 1,
0.5362118, -0.07779846, 1.475977, 1, 1, 1, 1, 1,
0.5395158, -0.3127812, 4.395344, 1, 1, 1, 1, 1,
0.5415805, 0.03900824, 1.062301, 1, 1, 1, 1, 1,
0.5454652, 0.6551859, -0.624587, 1, 1, 1, 1, 1,
0.548366, -0.430713, 2.874548, 1, 1, 1, 1, 1,
0.5501382, -0.2874608, 2.382315, 1, 1, 1, 1, 1,
0.5511882, -2.086497, 1.143273, 1, 1, 1, 1, 1,
0.5529896, 1.367334, -0.2977458, 1, 1, 1, 1, 1,
0.5567935, -0.6430687, 2.042394, 1, 1, 1, 1, 1,
0.5628775, 2.517982, 0.2159733, 1, 1, 1, 1, 1,
0.568162, 1.878989, 0.09007303, 1, 1, 1, 1, 1,
0.5705876, -1.840148, 2.857958, 1, 1, 1, 1, 1,
0.5727206, -0.6500849, 1.713069, 1, 1, 1, 1, 1,
0.5760929, 0.903344, -0.5243129, 1, 1, 1, 1, 1,
0.5775504, -1.417131, 3.359603, 1, 1, 1, 1, 1,
0.5783571, 0.7985948, -0.160335, 0, 0, 1, 1, 1,
0.5794149, -1.99506, 4.632571, 1, 0, 0, 1, 1,
0.5834436, -1.089058, 1.45677, 1, 0, 0, 1, 1,
0.5916081, 0.6754386, 0.8231735, 1, 0, 0, 1, 1,
0.5964944, 0.8494263, -0.2129668, 1, 0, 0, 1, 1,
0.5993541, 0.4938526, 0.1333078, 1, 0, 0, 1, 1,
0.6000953, 0.9877592, 0.007787996, 0, 0, 0, 1, 1,
0.6071928, -0.2114947, 2.284435, 0, 0, 0, 1, 1,
0.6158368, 0.5037149, 2.279504, 0, 0, 0, 1, 1,
0.6267208, -0.03279914, 1.375413, 0, 0, 0, 1, 1,
0.6308901, -1.401566, 4.216878, 0, 0, 0, 1, 1,
0.6316283, 1.12227, 0.1596648, 0, 0, 0, 1, 1,
0.6326258, 1.437263, -0.8588139, 0, 0, 0, 1, 1,
0.6330017, 0.166252, 1.658836, 1, 1, 1, 1, 1,
0.6332284, 0.05580577, 1.92774, 1, 1, 1, 1, 1,
0.6383766, 0.9081312, -0.002200807, 1, 1, 1, 1, 1,
0.639259, 0.5243171, 3.078667, 1, 1, 1, 1, 1,
0.6406769, 0.957171, -0.5744313, 1, 1, 1, 1, 1,
0.6481327, 0.2022286, 0.4602125, 1, 1, 1, 1, 1,
0.6564757, 0.5547257, 0.2599587, 1, 1, 1, 1, 1,
0.6566992, -0.0720794, 1.957718, 1, 1, 1, 1, 1,
0.6582392, -0.3796741, 0.1944629, 1, 1, 1, 1, 1,
0.6588519, 0.3355471, 2.720173, 1, 1, 1, 1, 1,
0.6659262, -1.000964, 1.142659, 1, 1, 1, 1, 1,
0.6659825, -0.04475398, 3.58511, 1, 1, 1, 1, 1,
0.6673008, 0.2368854, 1.819724, 1, 1, 1, 1, 1,
0.668289, -0.8250921, 1.013897, 1, 1, 1, 1, 1,
0.6689755, 1.937404, 2.261812, 1, 1, 1, 1, 1,
0.67014, 0.7658995, 0.7163212, 0, 0, 1, 1, 1,
0.6749677, -0.900415, 2.029544, 1, 0, 0, 1, 1,
0.6768256, 0.7366465, 0.8178075, 1, 0, 0, 1, 1,
0.6856287, 0.9504427, 1.593562, 1, 0, 0, 1, 1,
0.6866941, -0.3872674, 2.722867, 1, 0, 0, 1, 1,
0.6882151, 0.1270189, 0.2493471, 1, 0, 0, 1, 1,
0.6990735, -0.3755493, 2.687793, 0, 0, 0, 1, 1,
0.7063656, 2.247178, 0.7540529, 0, 0, 0, 1, 1,
0.7122952, 0.07653572, 0.3764943, 0, 0, 0, 1, 1,
0.7174063, 1.640616, -1.292924, 0, 0, 0, 1, 1,
0.717872, -0.1427534, 3.004626, 0, 0, 0, 1, 1,
0.7182131, -0.1295264, 1.532403, 0, 0, 0, 1, 1,
0.7206551, 0.3032776, 2.43732, 0, 0, 0, 1, 1,
0.7215242, 0.7738036, 2.584033, 1, 1, 1, 1, 1,
0.7364538, 1.616885, 0.4029171, 1, 1, 1, 1, 1,
0.7379944, 0.7112908, -0.1497626, 1, 1, 1, 1, 1,
0.7399417, 0.773154, 2.199236, 1, 1, 1, 1, 1,
0.7415391, -0.8801079, 2.816535, 1, 1, 1, 1, 1,
0.7417474, 0.03329025, 2.194037, 1, 1, 1, 1, 1,
0.7461691, 0.7099869, 0.9753326, 1, 1, 1, 1, 1,
0.7465749, 1.121562, 0.8105311, 1, 1, 1, 1, 1,
0.7474822, 1.482262, 2.021838, 1, 1, 1, 1, 1,
0.7477115, 0.238893, -0.7988803, 1, 1, 1, 1, 1,
0.7494454, -0.9081964, 0.7144361, 1, 1, 1, 1, 1,
0.7569084, 1.852435, 0.9471018, 1, 1, 1, 1, 1,
0.7573283, -1.176126, 1.420716, 1, 1, 1, 1, 1,
0.765494, -1.152909, 3.751894, 1, 1, 1, 1, 1,
0.7667333, -0.005762265, 1.730394, 1, 1, 1, 1, 1,
0.7670592, -0.7658812, 3.540571, 0, 0, 1, 1, 1,
0.7711107, -0.02064502, 0.9870176, 1, 0, 0, 1, 1,
0.7726054, -0.1793015, 1.564381, 1, 0, 0, 1, 1,
0.7755954, 2.225607, 1.917876, 1, 0, 0, 1, 1,
0.780263, 1.538607, -0.2454143, 1, 0, 0, 1, 1,
0.7954058, 0.06891511, 0.2424367, 1, 0, 0, 1, 1,
0.7963421, 0.7247625, 1.669737, 0, 0, 0, 1, 1,
0.8049438, -0.3073437, 1.917979, 0, 0, 0, 1, 1,
0.8111091, 1.095953, 0.556372, 0, 0, 0, 1, 1,
0.8156052, 0.9365295, 3.599371, 0, 0, 0, 1, 1,
0.820375, -1.181047, 3.277193, 0, 0, 0, 1, 1,
0.8251595, 1.971922, 0.6857915, 0, 0, 0, 1, 1,
0.8255522, 1.395483, 0.0470434, 0, 0, 0, 1, 1,
0.8258581, -2.030524, 2.08887, 1, 1, 1, 1, 1,
0.8265784, 0.7314914, 1.105862, 1, 1, 1, 1, 1,
0.8304579, 0.239845, 1.364821, 1, 1, 1, 1, 1,
0.8315625, 0.2531822, 1.427167, 1, 1, 1, 1, 1,
0.831965, 0.3389351, 1.850131, 1, 1, 1, 1, 1,
0.8326685, 0.9019436, 0.76605, 1, 1, 1, 1, 1,
0.849614, -0.6680759, 2.38716, 1, 1, 1, 1, 1,
0.8503028, -1.546261, 2.646775, 1, 1, 1, 1, 1,
0.8520324, -0.7420001, 2.062522, 1, 1, 1, 1, 1,
0.85963, -0.2590697, 1.884487, 1, 1, 1, 1, 1,
0.8665845, 2.43946, 0.6446257, 1, 1, 1, 1, 1,
0.8720729, -1.694418, 2.787706, 1, 1, 1, 1, 1,
0.8739824, -1.936516, 2.686778, 1, 1, 1, 1, 1,
0.8764882, 2.355728, 0.0321985, 1, 1, 1, 1, 1,
0.8833351, 1.636486, 0.6837351, 1, 1, 1, 1, 1,
0.8840262, 0.5129883, 2.413703, 0, 0, 1, 1, 1,
0.8898265, 0.08511662, 2.052411, 1, 0, 0, 1, 1,
0.8980673, 0.9915417, -0.1844445, 1, 0, 0, 1, 1,
0.8991944, -0.4839813, 1.412895, 1, 0, 0, 1, 1,
0.9003187, 0.4968277, 0.441563, 1, 0, 0, 1, 1,
0.9005734, 1.456608, 0.7831538, 1, 0, 0, 1, 1,
0.9013262, 0.1354211, 3.237356, 0, 0, 0, 1, 1,
0.911667, 0.6219141, 1.722636, 0, 0, 0, 1, 1,
0.9175238, -0.1725665, 2.331574, 0, 0, 0, 1, 1,
0.9198784, -1.13163, 2.029471, 0, 0, 0, 1, 1,
0.9202375, 0.3025823, 2.137014, 0, 0, 0, 1, 1,
0.9228762, 0.7587863, -0.1960836, 0, 0, 0, 1, 1,
0.9331456, -0.4466251, 0.1746754, 0, 0, 0, 1, 1,
0.93453, -1.664625, 1.858425, 1, 1, 1, 1, 1,
0.9351273, -0.8422022, 2.667221, 1, 1, 1, 1, 1,
0.9389364, 1.373289, -0.6941535, 1, 1, 1, 1, 1,
0.9394509, -0.6525733, 1.943892, 1, 1, 1, 1, 1,
0.9399081, 1.812556, 1.734637, 1, 1, 1, 1, 1,
0.940037, 0.6337485, 1.095762, 1, 1, 1, 1, 1,
0.9468484, 0.8434539, 1.563849, 1, 1, 1, 1, 1,
0.9478734, 1.073157, -0.944817, 1, 1, 1, 1, 1,
0.9490414, -1.148854, 3.264329, 1, 1, 1, 1, 1,
0.949528, 0.7183875, 1.000395, 1, 1, 1, 1, 1,
0.9528015, 0.6331294, 1.132221, 1, 1, 1, 1, 1,
0.9625273, -1.303015, 2.046281, 1, 1, 1, 1, 1,
0.9659683, -0.785623, 1.913227, 1, 1, 1, 1, 1,
0.9682726, 0.5588802, 2.282577, 1, 1, 1, 1, 1,
0.9697271, -0.8036488, 2.313865, 1, 1, 1, 1, 1,
0.9780377, -1.391886, 5.193597, 0, 0, 1, 1, 1,
0.9826967, -0.08956916, 0.9150905, 1, 0, 0, 1, 1,
0.9890106, 0.1792702, 1.696297, 1, 0, 0, 1, 1,
0.9891139, -0.4129622, 0.8972126, 1, 0, 0, 1, 1,
0.9988962, 1.318085, -1.700527, 1, 0, 0, 1, 1,
1.003435, 0.1389412, 1.628407, 1, 0, 0, 1, 1,
1.005706, -0.08506538, 1.875015, 0, 0, 0, 1, 1,
1.0063, 0.8888558, 1.366845, 0, 0, 0, 1, 1,
1.010724, 0.5741105, -1.399405, 0, 0, 0, 1, 1,
1.013686, 0.2914807, 3.44925, 0, 0, 0, 1, 1,
1.013864, 0.7530966, -0.2705529, 0, 0, 0, 1, 1,
1.014269, 0.6134375, -0.08000063, 0, 0, 0, 1, 1,
1.014739, 1.097071, 2.039946, 0, 0, 0, 1, 1,
1.021274, -0.6718103, 1.593525, 1, 1, 1, 1, 1,
1.02261, 0.1348584, 0.2648698, 1, 1, 1, 1, 1,
1.036076, -0.04474727, 0.1441344, 1, 1, 1, 1, 1,
1.036166, 0.2428898, 1.407031, 1, 1, 1, 1, 1,
1.03689, 0.782289, 0.09757252, 1, 1, 1, 1, 1,
1.040434, -0.1138664, 1.010907, 1, 1, 1, 1, 1,
1.049176, 0.2650977, 1.537954, 1, 1, 1, 1, 1,
1.051422, 1.157221, 1.907763, 1, 1, 1, 1, 1,
1.069235, 0.02982828, 0.9462963, 1, 1, 1, 1, 1,
1.069956, 0.2064151, 1.69668, 1, 1, 1, 1, 1,
1.078113, -0.9462825, 3.118547, 1, 1, 1, 1, 1,
1.088846, 0.3870145, 1.22083, 1, 1, 1, 1, 1,
1.093106, 0.2821538, 0.5757914, 1, 1, 1, 1, 1,
1.093208, 0.06859258, 2.142462, 1, 1, 1, 1, 1,
1.096928, -0.6809599, 1.21508, 1, 1, 1, 1, 1,
1.108423, -0.08056185, 2.168252, 0, 0, 1, 1, 1,
1.119449, 0.00310382, 0.09419582, 1, 0, 0, 1, 1,
1.124684, -0.06390955, 3.324666, 1, 0, 0, 1, 1,
1.133183, 0.2729689, -0.04635175, 1, 0, 0, 1, 1,
1.145398, 0.3996249, 2.029426, 1, 0, 0, 1, 1,
1.146909, -0.02185428, 1.539905, 1, 0, 0, 1, 1,
1.152749, -0.004418735, 2.577484, 0, 0, 0, 1, 1,
1.155481, 2.163954, -0.4452865, 0, 0, 0, 1, 1,
1.155506, -0.2147323, 0.4406405, 0, 0, 0, 1, 1,
1.165157, 0.6664804, 0.5377482, 0, 0, 0, 1, 1,
1.176619, -0.3418571, 2.581346, 0, 0, 0, 1, 1,
1.178082, 0.7242013, 2.257264, 0, 0, 0, 1, 1,
1.182634, -0.06831279, 0.771956, 0, 0, 0, 1, 1,
1.182905, 0.005467237, 2.03337, 1, 1, 1, 1, 1,
1.189688, -0.620497, 2.551461, 1, 1, 1, 1, 1,
1.19104, 0.6459087, 1.77015, 1, 1, 1, 1, 1,
1.192277, -0.2164246, 2.00321, 1, 1, 1, 1, 1,
1.199276, 1.454964, -0.35292, 1, 1, 1, 1, 1,
1.202612, -0.2793603, 0.832512, 1, 1, 1, 1, 1,
1.213773, 0.6537566, 0.03066173, 1, 1, 1, 1, 1,
1.217569, 0.08046799, 1.421103, 1, 1, 1, 1, 1,
1.218313, -0.2032162, 1.152968, 1, 1, 1, 1, 1,
1.222071, 0.5753947, 1.591688, 1, 1, 1, 1, 1,
1.232216, 1.825309, 1.414554, 1, 1, 1, 1, 1,
1.260105, 0.7115777, 0.3778192, 1, 1, 1, 1, 1,
1.264716, 0.7294232, 0.5968619, 1, 1, 1, 1, 1,
1.265187, 0.07566175, 2.588402, 1, 1, 1, 1, 1,
1.266557, -0.4131365, 2.788558, 1, 1, 1, 1, 1,
1.273499, 0.8056598, -0.4381868, 0, 0, 1, 1, 1,
1.290391, -1.013938, 2.637022, 1, 0, 0, 1, 1,
1.291242, -1.285857, 3.410066, 1, 0, 0, 1, 1,
1.298835, 1.771524, 0.5840643, 1, 0, 0, 1, 1,
1.303254, -0.5737461, 1.986801, 1, 0, 0, 1, 1,
1.306894, -1.88236, 2.793528, 1, 0, 0, 1, 1,
1.328861, 1.867542, 2.006239, 0, 0, 0, 1, 1,
1.33746, -0.4371068, 1.242754, 0, 0, 0, 1, 1,
1.34912, -3.954254, 1.056567, 0, 0, 0, 1, 1,
1.357178, -0.7727144, 0.3448905, 0, 0, 0, 1, 1,
1.361352, 0.5553086, 1.376112, 0, 0, 0, 1, 1,
1.373773, -0.1115396, 1.797428, 0, 0, 0, 1, 1,
1.376947, 0.668311, -0.1303919, 0, 0, 0, 1, 1,
1.383298, -0.2782952, 1.872147, 1, 1, 1, 1, 1,
1.384143, 0.3474915, 1.25661, 1, 1, 1, 1, 1,
1.39439, -1.037077, 2.989124, 1, 1, 1, 1, 1,
1.395864, -0.04992171, -0.8726627, 1, 1, 1, 1, 1,
1.41223, -1.376232, 3.383845, 1, 1, 1, 1, 1,
1.426217, 1.482376, 1.722632, 1, 1, 1, 1, 1,
1.429698, -0.1163971, 2.016372, 1, 1, 1, 1, 1,
1.436165, 0.1708962, 1.74068, 1, 1, 1, 1, 1,
1.447632, -2.257698, 3.193661, 1, 1, 1, 1, 1,
1.451931, 1.986989, 1.477459, 1, 1, 1, 1, 1,
1.465157, 0.2725612, 0.9598256, 1, 1, 1, 1, 1,
1.467667, 2.372993, 0.3456593, 1, 1, 1, 1, 1,
1.473076, 1.084432, 2.190524, 1, 1, 1, 1, 1,
1.473827, -0.08045136, 4.386204, 1, 1, 1, 1, 1,
1.475412, 0.3652621, 2.515067, 1, 1, 1, 1, 1,
1.480457, 0.1934868, 0.8291084, 0, 0, 1, 1, 1,
1.489504, -1.078226, 0.9758989, 1, 0, 0, 1, 1,
1.500745, -0.3307271, 1.786287, 1, 0, 0, 1, 1,
1.502432, -1.067547, 2.087108, 1, 0, 0, 1, 1,
1.507395, 1.020249, 1.791029, 1, 0, 0, 1, 1,
1.526566, 0.4018664, 3.001659, 1, 0, 0, 1, 1,
1.528314, 0.6542032, 1.103509, 0, 0, 0, 1, 1,
1.533872, -0.6080408, 0.9657907, 0, 0, 0, 1, 1,
1.541365, -0.7753393, 1.712517, 0, 0, 0, 1, 1,
1.545561, -1.226783, 1.130367, 0, 0, 0, 1, 1,
1.547255, -0.8827155, 2.252824, 0, 0, 0, 1, 1,
1.54726, 1.848968, 0.7779062, 0, 0, 0, 1, 1,
1.548847, -0.9470423, 2.243854, 0, 0, 0, 1, 1,
1.550747, -1.36464, 3.896754, 1, 1, 1, 1, 1,
1.572499, -0.4868164, 2.772633, 1, 1, 1, 1, 1,
1.573354, -0.7392184, 0.3644161, 1, 1, 1, 1, 1,
1.578792, 1.149365, 1.128095, 1, 1, 1, 1, 1,
1.600858, 0.1966666, 0.8618061, 1, 1, 1, 1, 1,
1.613253, 0.5840691, 0.1534746, 1, 1, 1, 1, 1,
1.62465, -1.904376, 1.418782, 1, 1, 1, 1, 1,
1.626848, 0.1022378, 1.364312, 1, 1, 1, 1, 1,
1.654511, 0.2175198, 3.020159, 1, 1, 1, 1, 1,
1.656089, 0.3713446, 2.556421, 1, 1, 1, 1, 1,
1.657198, -0.9994259, 0.3585653, 1, 1, 1, 1, 1,
1.703125, 0.5858733, 2.421216, 1, 1, 1, 1, 1,
1.704035, -0.6946298, 2.430494, 1, 1, 1, 1, 1,
1.713879, 0.01262779, 1.636127, 1, 1, 1, 1, 1,
1.740677, 0.8518863, 1.007601, 1, 1, 1, 1, 1,
1.765317, -0.7985801, 1.0945, 0, 0, 1, 1, 1,
1.773893, 0.1695974, 0.7825967, 1, 0, 0, 1, 1,
1.789035, -0.811194, 1.26118, 1, 0, 0, 1, 1,
1.789664, 1.291856, 0.110335, 1, 0, 0, 1, 1,
1.790405, -0.5009481, 2.025856, 1, 0, 0, 1, 1,
1.815747, -0.9943694, 1.732915, 1, 0, 0, 1, 1,
1.832675, 0.3671575, 1.412982, 0, 0, 0, 1, 1,
1.844729, -0.1851435, 2.24368, 0, 0, 0, 1, 1,
1.865512, -0.1651465, 1.469338, 0, 0, 0, 1, 1,
1.897809, 1.074878, 0.9984495, 0, 0, 0, 1, 1,
1.898638, -1.089656, 3.017899, 0, 0, 0, 1, 1,
1.898662, 0.9181273, -0.2800165, 0, 0, 0, 1, 1,
1.934331, 0.1860562, 0.9414887, 0, 0, 0, 1, 1,
1.935152, 0.7677065, -0.496921, 1, 1, 1, 1, 1,
1.943913, -2.79291, 2.426475, 1, 1, 1, 1, 1,
1.952431, 1.496245, 0.5315918, 1, 1, 1, 1, 1,
1.962794, -0.8744144, 1.7111, 1, 1, 1, 1, 1,
1.973341, 0.04021389, -0.5210183, 1, 1, 1, 1, 1,
2.001444, -0.5980858, 2.304271, 1, 1, 1, 1, 1,
2.027031, -1.100848, 2.572439, 1, 1, 1, 1, 1,
2.037601, -1.98304, 0.6075311, 1, 1, 1, 1, 1,
2.069061, 0.9384078, 2.767505, 1, 1, 1, 1, 1,
2.154489, -0.5809337, 1.70063, 1, 1, 1, 1, 1,
2.165634, -0.3583517, 0.2153198, 1, 1, 1, 1, 1,
2.198206, 2.071613, 1.459457, 1, 1, 1, 1, 1,
2.200666, 1.178103, 0.9735335, 1, 1, 1, 1, 1,
2.203009, 1.96864, 1.907051, 1, 1, 1, 1, 1,
2.238952, 0.3868324, 1.729254, 1, 1, 1, 1, 1,
2.245576, -0.4867151, 2.840475, 0, 0, 1, 1, 1,
2.247746, -0.6760828, 0.8843411, 1, 0, 0, 1, 1,
2.260553, 1.550793, 0.6741156, 1, 0, 0, 1, 1,
2.262437, -0.03671669, -0.2696025, 1, 0, 0, 1, 1,
2.346853, -0.03085614, 1.584361, 1, 0, 0, 1, 1,
2.355049, -1.514617, 2.073174, 1, 0, 0, 1, 1,
2.371312, 0.3714094, 4.065663, 0, 0, 0, 1, 1,
2.379888, 1.746018, 1.111572, 0, 0, 0, 1, 1,
2.416131, -1.287388, 0.2356929, 0, 0, 0, 1, 1,
2.47597, 1.985297, 1.301654, 0, 0, 0, 1, 1,
2.506461, -0.859933, 0.3776488, 0, 0, 0, 1, 1,
2.556925, 0.250632, 1.493924, 0, 0, 0, 1, 1,
2.601844, -1.144296, 1.748778, 0, 0, 0, 1, 1,
2.656246, 1.588874, 3.160287, 1, 1, 1, 1, 1,
2.743332, 1.312318, 0.6470081, 1, 1, 1, 1, 1,
2.91868, 0.03160847, 1.408151, 1, 1, 1, 1, 1,
2.942096, -0.975756, 2.615782, 1, 1, 1, 1, 1,
3.007807, 1.174558, -0.5344785, 1, 1, 1, 1, 1,
3.070837, -1.281754, 0.4234028, 1, 1, 1, 1, 1,
3.081098, -0.5389464, 4.032169, 1, 1, 1, 1, 1
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
var radius = 9.957184;
var distance = 34.97419;
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
mvMatrix.translate( -0.02892733, 0.07085562, 0.2020428 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.97419);
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
