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
-3.365007, 0.01497064, -3.389471, 1, 0, 0, 1,
-3.117523, -0.7758815, -0.390956, 1, 0.007843138, 0, 1,
-2.787461, -1.183797, -3.284538, 1, 0.01176471, 0, 1,
-2.740459, 0.9175006, -1.462119, 1, 0.01960784, 0, 1,
-2.594616, -1.375758, -1.844743, 1, 0.02352941, 0, 1,
-2.403804, 3.087074, -0.1255349, 1, 0.03137255, 0, 1,
-2.398728, 0.05668968, -2.216335, 1, 0.03529412, 0, 1,
-2.326579, 0.1555132, -1.178307, 1, 0.04313726, 0, 1,
-2.301718, -0.07466007, -0.6241032, 1, 0.04705882, 0, 1,
-2.254852, 1.277003, -1.836668, 1, 0.05490196, 0, 1,
-2.253668, 0.4861713, -1.628894, 1, 0.05882353, 0, 1,
-2.241436, 0.8894846, 0.6700225, 1, 0.06666667, 0, 1,
-2.231587, 0.1827714, -0.7467247, 1, 0.07058824, 0, 1,
-2.22851, -1.225472, -0.7773678, 1, 0.07843138, 0, 1,
-2.195802, -0.4083915, -2.551389, 1, 0.08235294, 0, 1,
-2.118509, 0.4976649, -2.79392, 1, 0.09019608, 0, 1,
-2.115667, 1.624496, -1.692208, 1, 0.09411765, 0, 1,
-2.105996, -0.317789, -2.834415, 1, 0.1019608, 0, 1,
-2.088157, 0.009921306, -2.620524, 1, 0.1098039, 0, 1,
-2.065022, -1.608048, -0.9355708, 1, 0.1137255, 0, 1,
-2.042421, -0.4461571, -1.144697, 1, 0.1215686, 0, 1,
-1.961211, 0.04032645, 0.5099472, 1, 0.1254902, 0, 1,
-1.947532, -0.8085904, -1.537094, 1, 0.1333333, 0, 1,
-1.946745, 0.03658924, -0.4821382, 1, 0.1372549, 0, 1,
-1.9452, 2.634084, -1.366544, 1, 0.145098, 0, 1,
-1.93984, -1.429213, -2.794003, 1, 0.1490196, 0, 1,
-1.929602, 1.036815, -2.429083, 1, 0.1568628, 0, 1,
-1.923234, 0.2436856, -2.729178, 1, 0.1607843, 0, 1,
-1.922557, 0.3945398, -0.3849937, 1, 0.1686275, 0, 1,
-1.902271, -0.06141092, -1.680148, 1, 0.172549, 0, 1,
-1.902003, 0.4636123, -0.1993453, 1, 0.1803922, 0, 1,
-1.875872, -1.240739, -2.176034, 1, 0.1843137, 0, 1,
-1.841496, 0.1793798, -0.3394076, 1, 0.1921569, 0, 1,
-1.833591, -1.400684, -1.951561, 1, 0.1960784, 0, 1,
-1.832016, -0.8386132, -2.953295, 1, 0.2039216, 0, 1,
-1.831785, -0.0288424, -3.707638, 1, 0.2117647, 0, 1,
-1.806886, -1.138551, -0.03592338, 1, 0.2156863, 0, 1,
-1.790036, 0.84675, -0.6749505, 1, 0.2235294, 0, 1,
-1.778674, 0.3381801, -2.268994, 1, 0.227451, 0, 1,
-1.762234, -0.6517305, -2.010285, 1, 0.2352941, 0, 1,
-1.760661, 0.3818134, -1.106225, 1, 0.2392157, 0, 1,
-1.756445, -0.1667012, -0.3031866, 1, 0.2470588, 0, 1,
-1.74862, -0.757532, -1.936729, 1, 0.2509804, 0, 1,
-1.73663, 0.4998158, -2.227183, 1, 0.2588235, 0, 1,
-1.729906, -0.2595828, -1.658428, 1, 0.2627451, 0, 1,
-1.687788, -1.185795, -2.331537, 1, 0.2705882, 0, 1,
-1.68733, 0.2452194, -1.264557, 1, 0.2745098, 0, 1,
-1.681899, -0.7650006, -2.798266, 1, 0.282353, 0, 1,
-1.672852, 1.309307, -1.560498, 1, 0.2862745, 0, 1,
-1.658872, -0.3991525, -3.111614, 1, 0.2941177, 0, 1,
-1.628659, -1.656897, -3.643172, 1, 0.3019608, 0, 1,
-1.621441, -0.1615446, -3.395864, 1, 0.3058824, 0, 1,
-1.614085, -0.1410136, -1.99851, 1, 0.3137255, 0, 1,
-1.606202, -0.9403641, -0.3761467, 1, 0.3176471, 0, 1,
-1.604642, 0.3026758, -0.7494576, 1, 0.3254902, 0, 1,
-1.601768, -1.835344, -2.779531, 1, 0.3294118, 0, 1,
-1.580553, -0.3849291, -1.34172, 1, 0.3372549, 0, 1,
-1.573233, -1.742797, -4.045413, 1, 0.3411765, 0, 1,
-1.568666, -0.1905391, -0.6364732, 1, 0.3490196, 0, 1,
-1.55996, 0.05570456, -1.952805, 1, 0.3529412, 0, 1,
-1.55534, -0.7281079, -0.1368106, 1, 0.3607843, 0, 1,
-1.539869, -1.581944, -3.156306, 1, 0.3647059, 0, 1,
-1.539198, 0.6788484, -1.637548, 1, 0.372549, 0, 1,
-1.52942, 1.021027, -2.587477, 1, 0.3764706, 0, 1,
-1.518245, -0.04674306, -1.803425, 1, 0.3843137, 0, 1,
-1.514792, 0.272984, -1.940359, 1, 0.3882353, 0, 1,
-1.493221, 0.7699355, -0.7460578, 1, 0.3960784, 0, 1,
-1.488189, 1.59611, -2.423616, 1, 0.4039216, 0, 1,
-1.482098, 0.9204679, -1.640222, 1, 0.4078431, 0, 1,
-1.463253, -0.9336848, -1.002578, 1, 0.4156863, 0, 1,
-1.456583, 0.7146311, 0.8320936, 1, 0.4196078, 0, 1,
-1.455993, -1.299445, -3.672249, 1, 0.427451, 0, 1,
-1.448179, -0.137853, -0.9261603, 1, 0.4313726, 0, 1,
-1.418399, 0.4839509, -0.6450678, 1, 0.4392157, 0, 1,
-1.412497, -2.826558, -2.895092, 1, 0.4431373, 0, 1,
-1.410222, -0.8742747, -4.163976, 1, 0.4509804, 0, 1,
-1.408407, 0.03413554, 0.05433514, 1, 0.454902, 0, 1,
-1.388505, -1.874072, -3.864009, 1, 0.4627451, 0, 1,
-1.3818, -0.2719094, -2.491674, 1, 0.4666667, 0, 1,
-1.380296, -0.04721538, -1.911857, 1, 0.4745098, 0, 1,
-1.373008, -1.656844, -2.513096, 1, 0.4784314, 0, 1,
-1.362865, -1.4579, -2.079731, 1, 0.4862745, 0, 1,
-1.361432, 1.219776, 0.7872064, 1, 0.4901961, 0, 1,
-1.351511, 1.670924, -0.4547132, 1, 0.4980392, 0, 1,
-1.351029, 0.3869031, -1.998672, 1, 0.5058824, 0, 1,
-1.345304, -0.9277059, -3.610752, 1, 0.509804, 0, 1,
-1.333806, 0.2677304, -2.040411, 1, 0.5176471, 0, 1,
-1.332409, -1.044092, -1.846068, 1, 0.5215687, 0, 1,
-1.318885, 2.490022, -1.26132, 1, 0.5294118, 0, 1,
-1.313053, 0.2741591, -0.8590345, 1, 0.5333334, 0, 1,
-1.304187, -0.7536333, -2.195455, 1, 0.5411765, 0, 1,
-1.296878, 0.1339449, -1.737341, 1, 0.5450981, 0, 1,
-1.296705, -1.2016, -2.897386, 1, 0.5529412, 0, 1,
-1.293267, 1.109357, -1.431655, 1, 0.5568628, 0, 1,
-1.287666, -0.9746396, -3.252123, 1, 0.5647059, 0, 1,
-1.286167, -0.7083071, -1.188742, 1, 0.5686275, 0, 1,
-1.279931, -0.3851866, -1.573605, 1, 0.5764706, 0, 1,
-1.279134, 1.366824, 0.6708757, 1, 0.5803922, 0, 1,
-1.2745, -0.275512, -3.143488, 1, 0.5882353, 0, 1,
-1.271715, 1.912909, 0.7357646, 1, 0.5921569, 0, 1,
-1.269138, 0.578371, -0.9637584, 1, 0.6, 0, 1,
-1.267727, -0.2671022, -1.263386, 1, 0.6078432, 0, 1,
-1.265633, 3.176877, -3.367052, 1, 0.6117647, 0, 1,
-1.258067, -1.335859, -2.692835, 1, 0.6196079, 0, 1,
-1.254367, 0.4972797, -0.3506078, 1, 0.6235294, 0, 1,
-1.253503, -0.7193324, -2.733795, 1, 0.6313726, 0, 1,
-1.253001, 0.2074692, -2.88403, 1, 0.6352941, 0, 1,
-1.247615, -1.291562, -2.170382, 1, 0.6431373, 0, 1,
-1.231097, 0.7250932, -1.721751, 1, 0.6470588, 0, 1,
-1.231087, -0.2777197, -1.917788, 1, 0.654902, 0, 1,
-1.221559, -1.607948, -0.8093879, 1, 0.6588235, 0, 1,
-1.219411, -0.7427463, -2.460372, 1, 0.6666667, 0, 1,
-1.212386, 0.7520043, -0.6548236, 1, 0.6705883, 0, 1,
-1.202465, 0.06340541, -2.669861, 1, 0.6784314, 0, 1,
-1.193909, 0.042657, -2.387017, 1, 0.682353, 0, 1,
-1.188271, 1.129227, -0.3258339, 1, 0.6901961, 0, 1,
-1.186882, 1.34204, -0.05291102, 1, 0.6941177, 0, 1,
-1.186552, 0.6425573, -1.515364, 1, 0.7019608, 0, 1,
-1.18288, 0.9891134, -0.06251655, 1, 0.7098039, 0, 1,
-1.180142, 0.9758852, -1.970483, 1, 0.7137255, 0, 1,
-1.170547, 0.3753694, -2.296416, 1, 0.7215686, 0, 1,
-1.156785, 1.724359, -0.01933715, 1, 0.7254902, 0, 1,
-1.156111, 0.2712922, -1.601407, 1, 0.7333333, 0, 1,
-1.15588, -0.356875, -1.85455, 1, 0.7372549, 0, 1,
-1.14647, -1.820136, -2.817677, 1, 0.7450981, 0, 1,
-1.14302, -1.396085, -3.928444, 1, 0.7490196, 0, 1,
-1.133496, 1.142382, -1.767374, 1, 0.7568628, 0, 1,
-1.132726, 0.3230993, 0.02369132, 1, 0.7607843, 0, 1,
-1.130883, 0.6486082, -1.28483, 1, 0.7686275, 0, 1,
-1.12528, 1.463964, -2.247938, 1, 0.772549, 0, 1,
-1.122186, 2.238477, -0.07508805, 1, 0.7803922, 0, 1,
-1.119837, -0.6845921, -1.16125, 1, 0.7843137, 0, 1,
-1.079657, -1.001069, -3.02333, 1, 0.7921569, 0, 1,
-1.070725, -0.6854097, -3.223668, 1, 0.7960784, 0, 1,
-1.064471, -0.1273372, -1.934466, 1, 0.8039216, 0, 1,
-1.060562, 2.292536, -0.8692113, 1, 0.8117647, 0, 1,
-1.059845, 0.2713193, -2.104346, 1, 0.8156863, 0, 1,
-1.056934, -0.7194579, -2.403185, 1, 0.8235294, 0, 1,
-1.052871, -1.265049, -2.683268, 1, 0.827451, 0, 1,
-1.050087, -1.031466, -1.332091, 1, 0.8352941, 0, 1,
-1.048962, -0.7065296, -1.027789, 1, 0.8392157, 0, 1,
-1.034868, -0.221594, -1.562774, 1, 0.8470588, 0, 1,
-1.027734, 0.3741676, -0.8263592, 1, 0.8509804, 0, 1,
-1.024722, -0.8892471, -0.715056, 1, 0.8588235, 0, 1,
-1.024697, -0.0702251, -1.436137, 1, 0.8627451, 0, 1,
-1.019285, 0.01478622, -2.277992, 1, 0.8705882, 0, 1,
-1.018566, 0.1722777, -3.02595, 1, 0.8745098, 0, 1,
-1.017591, -1.206024, -3.108899, 1, 0.8823529, 0, 1,
-1.015362, 1.414903, -0.2864189, 1, 0.8862745, 0, 1,
-1.013152, 0.3252114, -1.035689, 1, 0.8941177, 0, 1,
-1.002595, 1.10446, -1.891432, 1, 0.8980392, 0, 1,
-1.002188, -0.2016026, -0.4581679, 1, 0.9058824, 0, 1,
-0.9992457, -0.6232288, -2.938526, 1, 0.9137255, 0, 1,
-0.9974189, -1.411424, -2.803759, 1, 0.9176471, 0, 1,
-0.9943951, 0.9082062, -1.740462, 1, 0.9254902, 0, 1,
-0.9904938, -0.4941537, -1.912775, 1, 0.9294118, 0, 1,
-0.9865617, -1.030098, -0.6464642, 1, 0.9372549, 0, 1,
-0.985444, 0.2499208, -0.974787, 1, 0.9411765, 0, 1,
-0.9844468, -0.4562017, -0.6928788, 1, 0.9490196, 0, 1,
-0.9679693, 1.033162, -1.310558, 1, 0.9529412, 0, 1,
-0.967725, 0.9254568, 1.207636, 1, 0.9607843, 0, 1,
-0.9660428, -1.564889, -2.787131, 1, 0.9647059, 0, 1,
-0.960998, -2.606371, -1.702141, 1, 0.972549, 0, 1,
-0.9592636, 0.3922597, -1.019024, 1, 0.9764706, 0, 1,
-0.9580652, 0.5539134, -2.012495, 1, 0.9843137, 0, 1,
-0.9576149, 0.2478496, -1.595913, 1, 0.9882353, 0, 1,
-0.9514948, 0.4957936, -1.079984, 1, 0.9960784, 0, 1,
-0.9483659, -0.454106, -1.254148, 0.9960784, 1, 0, 1,
-0.9476234, 2.746171, -0.4307618, 0.9921569, 1, 0, 1,
-0.9472027, -0.0212761, -1.986469, 0.9843137, 1, 0, 1,
-0.9468327, 1.529855, -0.7605503, 0.9803922, 1, 0, 1,
-0.9415484, 0.2934653, -3.159328, 0.972549, 1, 0, 1,
-0.9383361, -1.622259, -3.115591, 0.9686275, 1, 0, 1,
-0.9357023, -0.5102292, -4.48896, 0.9607843, 1, 0, 1,
-0.9339201, -1.061275, -2.324575, 0.9568627, 1, 0, 1,
-0.9331821, 1.00374, 0.6739048, 0.9490196, 1, 0, 1,
-0.9283679, -0.07091483, -1.753224, 0.945098, 1, 0, 1,
-0.9279374, 1.832032, -0.4294927, 0.9372549, 1, 0, 1,
-0.9247808, 0.2224697, -1.273162, 0.9333333, 1, 0, 1,
-0.9138156, 0.1661894, -1.972229, 0.9254902, 1, 0, 1,
-0.9106606, 1.571489, 0.2565458, 0.9215686, 1, 0, 1,
-0.9095789, 1.62275, -0.9067609, 0.9137255, 1, 0, 1,
-0.9095615, -0.07999245, -2.519754, 0.9098039, 1, 0, 1,
-0.9029019, -0.1354705, -1.718797, 0.9019608, 1, 0, 1,
-0.9012237, 2.268942, 0.504558, 0.8941177, 1, 0, 1,
-0.8988274, -1.422778, -2.253562, 0.8901961, 1, 0, 1,
-0.8974804, -1.092456, -2.837256, 0.8823529, 1, 0, 1,
-0.8935455, -0.9136698, -3.700761, 0.8784314, 1, 0, 1,
-0.8892043, -1.902727, -2.231644, 0.8705882, 1, 0, 1,
-0.8890116, 0.5208055, -0.7971535, 0.8666667, 1, 0, 1,
-0.8823119, -1.990341, -3.609588, 0.8588235, 1, 0, 1,
-0.8805486, -1.171276, -3.144539, 0.854902, 1, 0, 1,
-0.8776773, -1.078479, -4.311704, 0.8470588, 1, 0, 1,
-0.873454, 0.3576835, -0.4624458, 0.8431373, 1, 0, 1,
-0.8733987, 0.6833403, -2.356571, 0.8352941, 1, 0, 1,
-0.8722364, 0.4330488, -1.566745, 0.8313726, 1, 0, 1,
-0.8679314, 0.09505393, -1.49481, 0.8235294, 1, 0, 1,
-0.8654062, -1.082458, -3.476439, 0.8196079, 1, 0, 1,
-0.8614382, 0.9068041, -0.8870206, 0.8117647, 1, 0, 1,
-0.8550192, 0.7971749, -0.2862114, 0.8078431, 1, 0, 1,
-0.8549928, 0.186371, -1.066664, 0.8, 1, 0, 1,
-0.8515841, 0.219505, -0.810255, 0.7921569, 1, 0, 1,
-0.8509219, 1.538459, -0.2103801, 0.7882353, 1, 0, 1,
-0.8477409, -0.7133333, -3.01511, 0.7803922, 1, 0, 1,
-0.8465083, -0.2088455, -3.408036, 0.7764706, 1, 0, 1,
-0.8454835, -0.01168229, -0.3740265, 0.7686275, 1, 0, 1,
-0.8289142, -0.1309817, -0.01940326, 0.7647059, 1, 0, 1,
-0.8288733, 2.057328, -0.1317636, 0.7568628, 1, 0, 1,
-0.8233446, 0.7884794, -2.626282, 0.7529412, 1, 0, 1,
-0.8199012, 0.09958836, -1.943384, 0.7450981, 1, 0, 1,
-0.8192364, -0.4772065, -0.3510738, 0.7411765, 1, 0, 1,
-0.8189976, 0.3872608, -1.137747, 0.7333333, 1, 0, 1,
-0.808758, 2.17768, -0.5120052, 0.7294118, 1, 0, 1,
-0.8059759, -0.6864869, -3.485734, 0.7215686, 1, 0, 1,
-0.8017001, -0.7273059, -1.993205, 0.7176471, 1, 0, 1,
-0.7900098, -0.007984119, 0.8270648, 0.7098039, 1, 0, 1,
-0.7827584, 0.1351254, -1.475517, 0.7058824, 1, 0, 1,
-0.7784596, 0.8298023, -1.008193, 0.6980392, 1, 0, 1,
-0.7767622, -0.3028687, -3.337162, 0.6901961, 1, 0, 1,
-0.7716336, 0.9473357, -0.04223719, 0.6862745, 1, 0, 1,
-0.7710115, -1.866581, -4.105402, 0.6784314, 1, 0, 1,
-0.7466882, -0.6550841, -1.646032, 0.6745098, 1, 0, 1,
-0.7463356, -0.2114805, -0.7632655, 0.6666667, 1, 0, 1,
-0.7447907, 0.5809892, -0.6425624, 0.6627451, 1, 0, 1,
-0.7385621, -0.8691546, -1.669263, 0.654902, 1, 0, 1,
-0.7376266, 0.2122823, -0.3602098, 0.6509804, 1, 0, 1,
-0.7374898, -0.5883722, -2.182456, 0.6431373, 1, 0, 1,
-0.7373908, -0.9265047, -4.326477, 0.6392157, 1, 0, 1,
-0.7349585, -0.3715613, -0.5222613, 0.6313726, 1, 0, 1,
-0.7245334, 1.32796, -1.199846, 0.627451, 1, 0, 1,
-0.7193877, -0.8991635, -2.413712, 0.6196079, 1, 0, 1,
-0.7192269, 1.132788, 0.3510124, 0.6156863, 1, 0, 1,
-0.7012312, -0.9531072, -1.984235, 0.6078432, 1, 0, 1,
-0.6937732, 0.2730161, -1.96184, 0.6039216, 1, 0, 1,
-0.6897373, 1.832082, 0.1124344, 0.5960785, 1, 0, 1,
-0.6844609, -1.662445, -2.255782, 0.5882353, 1, 0, 1,
-0.6813826, 0.6782907, -0.4909521, 0.5843138, 1, 0, 1,
-0.6790603, -0.08039519, -2.806099, 0.5764706, 1, 0, 1,
-0.6771113, 0.4323432, -1.202566, 0.572549, 1, 0, 1,
-0.6757863, -0.05130291, -2.632087, 0.5647059, 1, 0, 1,
-0.6620538, 0.2870331, -0.7609435, 0.5607843, 1, 0, 1,
-0.6611731, -0.08353813, -1.257855, 0.5529412, 1, 0, 1,
-0.6569358, 0.2355851, -1.788233, 0.5490196, 1, 0, 1,
-0.6568954, -1.733281, -3.988105, 0.5411765, 1, 0, 1,
-0.6558636, 0.3198486, -0.2147968, 0.5372549, 1, 0, 1,
-0.6548972, -0.3261469, -2.46583, 0.5294118, 1, 0, 1,
-0.6516606, -0.129623, -1.111081, 0.5254902, 1, 0, 1,
-0.6481494, -0.9010286, -3.093726, 0.5176471, 1, 0, 1,
-0.6470934, -0.8740291, -2.859053, 0.5137255, 1, 0, 1,
-0.6466761, -0.2986353, -2.491771, 0.5058824, 1, 0, 1,
-0.6445624, -1.086846, -4.280973, 0.5019608, 1, 0, 1,
-0.6436659, 0.4594664, -0.2995875, 0.4941176, 1, 0, 1,
-0.6397372, 0.2057958, -0.9232021, 0.4862745, 1, 0, 1,
-0.6363358, 1.446562, -0.6440341, 0.4823529, 1, 0, 1,
-0.6357385, -0.1848607, 0.3274662, 0.4745098, 1, 0, 1,
-0.6275756, 0.5013524, -2.53195, 0.4705882, 1, 0, 1,
-0.626318, 0.09356423, -2.004489, 0.4627451, 1, 0, 1,
-0.6251438, 0.4499055, 0.5414087, 0.4588235, 1, 0, 1,
-0.6172576, -1.105469, -1.938827, 0.4509804, 1, 0, 1,
-0.6170744, -0.9164343, -2.315187, 0.4470588, 1, 0, 1,
-0.6136869, 0.4827186, -0.6595612, 0.4392157, 1, 0, 1,
-0.5926423, 0.08724816, 0.2656392, 0.4352941, 1, 0, 1,
-0.5883769, -0.1941863, -0.2907089, 0.427451, 1, 0, 1,
-0.585354, 0.7163191, -0.9954204, 0.4235294, 1, 0, 1,
-0.5808043, 0.6770731, -0.7223676, 0.4156863, 1, 0, 1,
-0.5796182, -0.5798939, -1.67776, 0.4117647, 1, 0, 1,
-0.5739907, 0.5859491, -0.8660408, 0.4039216, 1, 0, 1,
-0.5715941, -0.05209914, -1.542282, 0.3960784, 1, 0, 1,
-0.5706714, -0.4575747, -1.801134, 0.3921569, 1, 0, 1,
-0.5697796, -1.959557, -2.802586, 0.3843137, 1, 0, 1,
-0.5671721, 0.3779771, -2.241064, 0.3803922, 1, 0, 1,
-0.5669451, -0.5562736, -3.479774, 0.372549, 1, 0, 1,
-0.5660529, -0.8933048, -3.076617, 0.3686275, 1, 0, 1,
-0.5634092, 0.2564897, -0.8553835, 0.3607843, 1, 0, 1,
-0.5586741, -1.750586, -1.012945, 0.3568628, 1, 0, 1,
-0.5574998, 0.7153882, -2.473326, 0.3490196, 1, 0, 1,
-0.5552113, 0.191337, -2.083482, 0.345098, 1, 0, 1,
-0.5552064, 0.5929712, 0.2992068, 0.3372549, 1, 0, 1,
-0.5537177, -0.1195466, -1.00382, 0.3333333, 1, 0, 1,
-0.5526405, -0.5637174, -2.142656, 0.3254902, 1, 0, 1,
-0.5522181, -0.6428084, -2.369802, 0.3215686, 1, 0, 1,
-0.5481567, -0.5518243, -2.488065, 0.3137255, 1, 0, 1,
-0.5464455, 0.520485, 0.8277392, 0.3098039, 1, 0, 1,
-0.5463117, 0.37844, -0.4782337, 0.3019608, 1, 0, 1,
-0.5447583, -0.3045706, -2.218392, 0.2941177, 1, 0, 1,
-0.5433179, 0.8326678, -0.644129, 0.2901961, 1, 0, 1,
-0.5417587, 1.653992, 0.8313093, 0.282353, 1, 0, 1,
-0.5405002, 0.251408, -2.324154, 0.2784314, 1, 0, 1,
-0.539521, 1.012432, -2.666711, 0.2705882, 1, 0, 1,
-0.5390723, 0.8231522, 0.6705958, 0.2666667, 1, 0, 1,
-0.5348051, 1.088863, -0.262272, 0.2588235, 1, 0, 1,
-0.5335923, 1.158359, 0.250044, 0.254902, 1, 0, 1,
-0.5271852, -2.350906, -3.680202, 0.2470588, 1, 0, 1,
-0.5249149, 1.15903, -0.86292, 0.2431373, 1, 0, 1,
-0.5200672, 0.7742639, -0.3573986, 0.2352941, 1, 0, 1,
-0.5166733, -2.225622, -4.083108, 0.2313726, 1, 0, 1,
-0.5138173, -2.376415, -2.94887, 0.2235294, 1, 0, 1,
-0.5135709, -1.046152, -1.250513, 0.2196078, 1, 0, 1,
-0.5126677, -0.62581, -0.2222595, 0.2117647, 1, 0, 1,
-0.5123742, 1.845315, 1.84479, 0.2078431, 1, 0, 1,
-0.5075647, -0.7168616, -3.107836, 0.2, 1, 0, 1,
-0.5072755, 0.251104, -1.103635, 0.1921569, 1, 0, 1,
-0.5022215, 0.01056828, -0.9110346, 0.1882353, 1, 0, 1,
-0.5000552, -0.1450223, -1.541274, 0.1803922, 1, 0, 1,
-0.49968, 1.701505, -0.01433709, 0.1764706, 1, 0, 1,
-0.4992007, 0.8705862, -2.054663, 0.1686275, 1, 0, 1,
-0.4949703, 0.601198, 0.2115852, 0.1647059, 1, 0, 1,
-0.4893136, -0.4043353, -3.64641, 0.1568628, 1, 0, 1,
-0.4880165, -0.09946913, -2.153526, 0.1529412, 1, 0, 1,
-0.4878966, -0.02445379, -0.7706468, 0.145098, 1, 0, 1,
-0.487232, 0.2743416, 0.3419235, 0.1411765, 1, 0, 1,
-0.4748715, -0.3149978, -1.658658, 0.1333333, 1, 0, 1,
-0.4696642, 0.09987269, -2.107889, 0.1294118, 1, 0, 1,
-0.4692874, 0.5622539, 0.8476816, 0.1215686, 1, 0, 1,
-0.4671067, 0.5171221, 1.417933, 0.1176471, 1, 0, 1,
-0.4566142, -0.1483378, 0.02813953, 0.1098039, 1, 0, 1,
-0.4544072, 0.1498816, -1.118701, 0.1058824, 1, 0, 1,
-0.453921, -0.6494707, -2.435314, 0.09803922, 1, 0, 1,
-0.4491669, 1.19076, -0.3864844, 0.09019608, 1, 0, 1,
-0.4482439, -0.272647, -1.125384, 0.08627451, 1, 0, 1,
-0.4474785, 0.08755152, -2.623471, 0.07843138, 1, 0, 1,
-0.4446198, -0.3470352, -1.917158, 0.07450981, 1, 0, 1,
-0.4426018, -1.454574, -2.723459, 0.06666667, 1, 0, 1,
-0.4396651, -0.2340045, -2.537078, 0.0627451, 1, 0, 1,
-0.436193, -1.920887, -5.561672, 0.05490196, 1, 0, 1,
-0.4328119, 0.5152425, -0.8751514, 0.05098039, 1, 0, 1,
-0.4323946, 1.669133, 0.07077822, 0.04313726, 1, 0, 1,
-0.4319085, 1.188921, 0.3278317, 0.03921569, 1, 0, 1,
-0.4317971, 0.5618857, -0.111756, 0.03137255, 1, 0, 1,
-0.4291334, 0.05289371, -1.826168, 0.02745098, 1, 0, 1,
-0.4278997, -0.09056227, 0.1511363, 0.01960784, 1, 0, 1,
-0.4275115, 0.9087262, -0.05137908, 0.01568628, 1, 0, 1,
-0.4248694, 0.3266666, -0.8127299, 0.007843138, 1, 0, 1,
-0.4126917, 0.05058149, -0.3935584, 0.003921569, 1, 0, 1,
-0.4112621, 0.3260005, 0.4590364, 0, 1, 0.003921569, 1,
-0.4102097, -0.1413943, -2.132592, 0, 1, 0.01176471, 1,
-0.4038253, 0.9797129, 0.07871692, 0, 1, 0.01568628, 1,
-0.4012341, 0.1397596, -0.6424057, 0, 1, 0.02352941, 1,
-0.3978328, 0.9916742, 0.9011019, 0, 1, 0.02745098, 1,
-0.3906232, -0.01132185, -2.303657, 0, 1, 0.03529412, 1,
-0.385875, -0.5717162, -4.361933, 0, 1, 0.03921569, 1,
-0.3807672, 1.568614, 0.8115481, 0, 1, 0.04705882, 1,
-0.3794241, -1.032295, -3.146915, 0, 1, 0.05098039, 1,
-0.3756016, -1.57955, -3.848316, 0, 1, 0.05882353, 1,
-0.3740047, 1.595903, -2.088817, 0, 1, 0.0627451, 1,
-0.3719618, 0.1234991, -2.532101, 0, 1, 0.07058824, 1,
-0.3706261, -0.6003106, -2.91934, 0, 1, 0.07450981, 1,
-0.3668156, -0.5516129, -0.9588821, 0, 1, 0.08235294, 1,
-0.3651792, -0.370096, -2.196334, 0, 1, 0.08627451, 1,
-0.3644413, 1.120092, 0.963152, 0, 1, 0.09411765, 1,
-0.3615425, -1.345951, -1.639385, 0, 1, 0.1019608, 1,
-0.3570434, -0.6645089, -3.097675, 0, 1, 0.1058824, 1,
-0.3546505, 0.1279986, -2.210108, 0, 1, 0.1137255, 1,
-0.354068, 0.4837526, -0.4244167, 0, 1, 0.1176471, 1,
-0.3538142, 1.516828, -0.4254667, 0, 1, 0.1254902, 1,
-0.3505765, 0.8226716, -2.181322, 0, 1, 0.1294118, 1,
-0.3473178, 1.810297, -1.256568, 0, 1, 0.1372549, 1,
-0.3463588, -0.05507131, -2.588065, 0, 1, 0.1411765, 1,
-0.3462069, -1.511177, -1.969207, 0, 1, 0.1490196, 1,
-0.3457482, -1.391461, -4.601237, 0, 1, 0.1529412, 1,
-0.3442915, -0.0775496, -0.8986661, 0, 1, 0.1607843, 1,
-0.3423589, 1.754228, 1.039891, 0, 1, 0.1647059, 1,
-0.341157, -1.106526, -3.661951, 0, 1, 0.172549, 1,
-0.3409592, -0.9541874, -3.142784, 0, 1, 0.1764706, 1,
-0.3391355, 0.2558113, 0.3952634, 0, 1, 0.1843137, 1,
-0.334159, -0.2491758, -0.8781387, 0, 1, 0.1882353, 1,
-0.3317771, 0.5997678, 0.4253148, 0, 1, 0.1960784, 1,
-0.3298407, -1.350074, -3.553188, 0, 1, 0.2039216, 1,
-0.3270322, -1.065381, -2.2901, 0, 1, 0.2078431, 1,
-0.326995, -0.8737761, -2.218824, 0, 1, 0.2156863, 1,
-0.3203206, -1.414506, -3.400317, 0, 1, 0.2196078, 1,
-0.3150133, 0.4919813, -0.2215643, 0, 1, 0.227451, 1,
-0.3148446, -0.5740018, -2.689086, 0, 1, 0.2313726, 1,
-0.3126493, 0.9227473, -1.276919, 0, 1, 0.2392157, 1,
-0.3107604, 0.4502665, -0.290039, 0, 1, 0.2431373, 1,
-0.3075813, 0.3553436, 1.385235, 0, 1, 0.2509804, 1,
-0.30399, -0.8128882, -3.962176, 0, 1, 0.254902, 1,
-0.3034613, 0.4033768, -1.240543, 0, 1, 0.2627451, 1,
-0.3025006, 0.5119033, 0.2941779, 0, 1, 0.2666667, 1,
-0.3017717, 0.1558701, -0.8355197, 0, 1, 0.2745098, 1,
-0.2993913, 0.2130663, -1.665914, 0, 1, 0.2784314, 1,
-0.2940985, -0.9450928, -0.9649187, 0, 1, 0.2862745, 1,
-0.291634, -1.428467, -1.081449, 0, 1, 0.2901961, 1,
-0.2853861, -1.749876, -1.960426, 0, 1, 0.2980392, 1,
-0.2853561, -1.079394, -2.104661, 0, 1, 0.3058824, 1,
-0.2846487, -0.5142956, -1.889489, 0, 1, 0.3098039, 1,
-0.279906, 0.5108652, -0.1027588, 0, 1, 0.3176471, 1,
-0.2794399, -0.4318254, -3.003528, 0, 1, 0.3215686, 1,
-0.2762462, -0.0585281, -2.314954, 0, 1, 0.3294118, 1,
-0.2742681, 1.057808, -0.1329211, 0, 1, 0.3333333, 1,
-0.2741995, -0.3245721, -2.261689, 0, 1, 0.3411765, 1,
-0.2648611, -0.9895459, -3.269011, 0, 1, 0.345098, 1,
-0.264029, 1.882639, 1.714006, 0, 1, 0.3529412, 1,
-0.2615517, 1.062005, -0.8779325, 0, 1, 0.3568628, 1,
-0.2596658, -0.0636436, -0.5193992, 0, 1, 0.3647059, 1,
-0.2593879, 0.121332, -0.7843019, 0, 1, 0.3686275, 1,
-0.2592082, -0.8284668, -2.462452, 0, 1, 0.3764706, 1,
-0.2577089, -1.269261, -2.658838, 0, 1, 0.3803922, 1,
-0.2574968, 1.779146, -0.4552723, 0, 1, 0.3882353, 1,
-0.2574518, 0.5214414, -0.7802582, 0, 1, 0.3921569, 1,
-0.2548627, 1.776335, -0.7968647, 0, 1, 0.4, 1,
-0.2545416, -0.2361061, -1.923323, 0, 1, 0.4078431, 1,
-0.2483344, -1.218323, -4.384886, 0, 1, 0.4117647, 1,
-0.2450824, 1.372849, 0.4629038, 0, 1, 0.4196078, 1,
-0.241526, 0.3826509, -1.627936, 0, 1, 0.4235294, 1,
-0.2408696, -2.263413, -3.120408, 0, 1, 0.4313726, 1,
-0.239517, -1.446814, -4.979673, 0, 1, 0.4352941, 1,
-0.238867, -0.8263387, -2.6308, 0, 1, 0.4431373, 1,
-0.2378257, 1.081685, -1.74854, 0, 1, 0.4470588, 1,
-0.2367168, -1.444451, -4.663877, 0, 1, 0.454902, 1,
-0.2365603, 1.426629, 1.063167, 0, 1, 0.4588235, 1,
-0.2361781, -1.084888, -1.67293, 0, 1, 0.4666667, 1,
-0.2341271, 0.2055296, -1.133197, 0, 1, 0.4705882, 1,
-0.2294884, -0.3077802, -3.032125, 0, 1, 0.4784314, 1,
-0.2291601, 0.8397095, -1.743112, 0, 1, 0.4823529, 1,
-0.2280978, 0.1031571, -0.8926678, 0, 1, 0.4901961, 1,
-0.2268422, 0.2832918, -0.4778734, 0, 1, 0.4941176, 1,
-0.2261894, -0.278808, -2.377078, 0, 1, 0.5019608, 1,
-0.2260299, 0.2797047, -0.925814, 0, 1, 0.509804, 1,
-0.2250885, 1.483979, -0.8757838, 0, 1, 0.5137255, 1,
-0.2241733, -1.199082, -3.84233, 0, 1, 0.5215687, 1,
-0.2238121, 0.1294565, -0.1999244, 0, 1, 0.5254902, 1,
-0.2184498, -0.6284735, -1.667475, 0, 1, 0.5333334, 1,
-0.218177, 0.2476484, -0.4493176, 0, 1, 0.5372549, 1,
-0.2181709, 0.4564555, -1.391944, 0, 1, 0.5450981, 1,
-0.2178712, 0.2615146, -0.9275492, 0, 1, 0.5490196, 1,
-0.2168792, 0.9715689, 1.466375, 0, 1, 0.5568628, 1,
-0.2124272, -0.87624, -2.151761, 0, 1, 0.5607843, 1,
-0.2118122, 0.4163884, -1.86079, 0, 1, 0.5686275, 1,
-0.2084586, -0.6970115, -2.288244, 0, 1, 0.572549, 1,
-0.2055851, -0.4878217, -3.172324, 0, 1, 0.5803922, 1,
-0.2018282, -0.6382269, -1.409024, 0, 1, 0.5843138, 1,
-0.2011546, 0.6503314, -0.4379746, 0, 1, 0.5921569, 1,
-0.1942942, 0.529273, -1.320986, 0, 1, 0.5960785, 1,
-0.1926639, 1.097352, 0.876124, 0, 1, 0.6039216, 1,
-0.1924485, -2.115283, -2.690432, 0, 1, 0.6117647, 1,
-0.1833338, 0.343594, -1.904964, 0, 1, 0.6156863, 1,
-0.1830547, -0.1615257, -4.739638, 0, 1, 0.6235294, 1,
-0.1805657, -0.3193551, -5.319204, 0, 1, 0.627451, 1,
-0.1790114, -0.2347626, -3.200333, 0, 1, 0.6352941, 1,
-0.1785028, -0.3888009, -2.678013, 0, 1, 0.6392157, 1,
-0.1778235, -0.2100825, -2.584292, 0, 1, 0.6470588, 1,
-0.1764748, 0.1873346, -0.08534575, 0, 1, 0.6509804, 1,
-0.174073, -0.4514494, -1.460544, 0, 1, 0.6588235, 1,
-0.1717593, -0.03029753, -2.545807, 0, 1, 0.6627451, 1,
-0.171315, 0.1735702, -1.79184, 0, 1, 0.6705883, 1,
-0.1706493, 0.4086994, 1.272823, 0, 1, 0.6745098, 1,
-0.1692949, 0.1449508, -0.4096956, 0, 1, 0.682353, 1,
-0.1661139, -0.310294, -3.737198, 0, 1, 0.6862745, 1,
-0.1648421, -0.9896827, -3.520247, 0, 1, 0.6941177, 1,
-0.1637405, 1.093686, -0.9236371, 0, 1, 0.7019608, 1,
-0.1635202, -0.1956018, -1.796224, 0, 1, 0.7058824, 1,
-0.15878, -0.1118128, -0.8678624, 0, 1, 0.7137255, 1,
-0.1559067, -1.235913, -3.784755, 0, 1, 0.7176471, 1,
-0.1557686, 0.02261743, 0.140317, 0, 1, 0.7254902, 1,
-0.1539215, 0.7126285, -0.3722319, 0, 1, 0.7294118, 1,
-0.1532452, 0.6751941, 0.2727053, 0, 1, 0.7372549, 1,
-0.1509277, 0.2156607, -1.220676, 0, 1, 0.7411765, 1,
-0.1491671, 0.1935532, -0.432995, 0, 1, 0.7490196, 1,
-0.1404901, -0.8042088, -2.044179, 0, 1, 0.7529412, 1,
-0.1396461, 0.00777154, 0.8975406, 0, 1, 0.7607843, 1,
-0.139433, 0.6160145, -0.6845915, 0, 1, 0.7647059, 1,
-0.1331631, 0.8059762, -1.241555, 0, 1, 0.772549, 1,
-0.1324716, 0.3520744, -1.298434, 0, 1, 0.7764706, 1,
-0.1294102, -1.201141, -4.886345, 0, 1, 0.7843137, 1,
-0.1278137, 0.2678701, 0.01081637, 0, 1, 0.7882353, 1,
-0.1245516, 1.892315, 2.093772, 0, 1, 0.7960784, 1,
-0.1230053, 0.5187554, -1.746729, 0, 1, 0.8039216, 1,
-0.1176165, 1.412147, -0.8966595, 0, 1, 0.8078431, 1,
-0.1164409, -0.7326741, -3.524658, 0, 1, 0.8156863, 1,
-0.1145224, 1.262631, 0.1670558, 0, 1, 0.8196079, 1,
-0.1136898, 1.313607, 1.382975, 0, 1, 0.827451, 1,
-0.107732, 0.1669954, -0.4070202, 0, 1, 0.8313726, 1,
-0.1074927, -0.08494827, -1.493044, 0, 1, 0.8392157, 1,
-0.09854848, -0.6335263, -2.07783, 0, 1, 0.8431373, 1,
-0.09622408, -0.07869199, -1.216926, 0, 1, 0.8509804, 1,
-0.0946181, -1.723833, -3.335746, 0, 1, 0.854902, 1,
-0.09425239, 0.1520204, -1.326357, 0, 1, 0.8627451, 1,
-0.09266971, -1.796225, -3.563426, 0, 1, 0.8666667, 1,
-0.0918772, -1.233927, -3.537271, 0, 1, 0.8745098, 1,
-0.09154063, -0.294874, -2.047167, 0, 1, 0.8784314, 1,
-0.09129747, 1.701939, 0.3418564, 0, 1, 0.8862745, 1,
-0.09100447, 0.4268182, 0.1236678, 0, 1, 0.8901961, 1,
-0.08971647, 1.167393, -2.141312, 0, 1, 0.8980392, 1,
-0.08895498, -0.551295, -1.7102, 0, 1, 0.9058824, 1,
-0.08679578, -0.45324, -4.466591, 0, 1, 0.9098039, 1,
-0.08506607, -0.8101777, -5.705903, 0, 1, 0.9176471, 1,
-0.08498689, 1.047931, 1.376274, 0, 1, 0.9215686, 1,
-0.08298218, -0.5112751, -3.114382, 0, 1, 0.9294118, 1,
-0.06644876, 0.9563484, -0.9140094, 0, 1, 0.9333333, 1,
-0.06633724, 1.157936, -0.4428768, 0, 1, 0.9411765, 1,
-0.06496487, 1.369478, -0.1943581, 0, 1, 0.945098, 1,
-0.06476874, 0.2362221, -0.4964699, 0, 1, 0.9529412, 1,
-0.06079054, 1.545414, 0.9768823, 0, 1, 0.9568627, 1,
-0.05947591, 0.7367391, 1.203195, 0, 1, 0.9647059, 1,
-0.05689711, -1.268291, -1.265765, 0, 1, 0.9686275, 1,
-0.04877852, -0.3277976, -2.643809, 0, 1, 0.9764706, 1,
-0.04691245, 0.8450389, -0.4559904, 0, 1, 0.9803922, 1,
-0.04661882, -1.039619, -2.989317, 0, 1, 0.9882353, 1,
-0.0464349, -0.8579597, -4.553693, 0, 1, 0.9921569, 1,
-0.04338727, -0.2634204, -2.977505, 0, 1, 1, 1,
-0.04190569, -0.2138894, -1.5644, 0, 0.9921569, 1, 1,
-0.03714938, -1.550646, -4.629572, 0, 0.9882353, 1, 1,
-0.0360389, 0.2913243, 1.103927, 0, 0.9803922, 1, 1,
-0.0346372, -0.5399943, -2.088748, 0, 0.9764706, 1, 1,
-0.03008855, 0.5431653, 2.225566, 0, 0.9686275, 1, 1,
-0.02518047, -0.1847359, -3.033653, 0, 0.9647059, 1, 1,
-0.02413717, -0.4604354, -3.288736, 0, 0.9568627, 1, 1,
-0.02395597, 0.2634079, -1.361706, 0, 0.9529412, 1, 1,
-0.02331199, 1.498883, 0.4738923, 0, 0.945098, 1, 1,
-0.02318707, 0.2432933, -1.016966, 0, 0.9411765, 1, 1,
-0.01789021, -0.3182411, -2.005284, 0, 0.9333333, 1, 1,
-0.01781846, -1.382702, -1.402115, 0, 0.9294118, 1, 1,
-0.01517485, 1.547501, -0.7650226, 0, 0.9215686, 1, 1,
-0.009224365, -0.8926069, -5.220368, 0, 0.9176471, 1, 1,
-0.007845706, 0.8876719, -0.489414, 0, 0.9098039, 1, 1,
-0.007073984, -1.787671, -2.074569, 0, 0.9058824, 1, 1,
-0.005500238, -1.981656, -3.384949, 0, 0.8980392, 1, 1,
-0.0009230938, 0.0566368, -0.9671477, 0, 0.8901961, 1, 1,
0.006508162, -0.4326285, 4.044955, 0, 0.8862745, 1, 1,
0.008237927, -0.4535859, 4.553595, 0, 0.8784314, 1, 1,
0.01161597, -0.8537612, 3.978402, 0, 0.8745098, 1, 1,
0.01628465, 0.658172, -1.461419, 0, 0.8666667, 1, 1,
0.01913909, -0.2377761, 4.179409, 0, 0.8627451, 1, 1,
0.01965483, 1.028549, 1.634563, 0, 0.854902, 1, 1,
0.02401412, 0.5874745, 2.254786, 0, 0.8509804, 1, 1,
0.02819291, 0.7144555, 0.5720203, 0, 0.8431373, 1, 1,
0.0310105, 0.3656554, -0.01834731, 0, 0.8392157, 1, 1,
0.03206916, 0.5969163, -0.3204089, 0, 0.8313726, 1, 1,
0.03306017, -1.538979, 2.036834, 0, 0.827451, 1, 1,
0.03755038, -0.3747524, 4.800636, 0, 0.8196079, 1, 1,
0.05250511, 0.9214845, 0.7715806, 0, 0.8156863, 1, 1,
0.05350319, 0.3160309, -0.01559622, 0, 0.8078431, 1, 1,
0.05389418, 0.2960137, 0.6850299, 0, 0.8039216, 1, 1,
0.05426671, -1.843521, 3.517652, 0, 0.7960784, 1, 1,
0.05642101, -2.142441, 3.085653, 0, 0.7882353, 1, 1,
0.06203284, -0.7663086, 4.465567, 0, 0.7843137, 1, 1,
0.06689257, -0.2620988, 3.604423, 0, 0.7764706, 1, 1,
0.07595605, 0.5193287, 2.216813, 0, 0.772549, 1, 1,
0.07808796, 0.4912255, -0.4836899, 0, 0.7647059, 1, 1,
0.08673414, 0.8724026, -0.1135066, 0, 0.7607843, 1, 1,
0.08695495, 0.645056, 1.193437, 0, 0.7529412, 1, 1,
0.08816868, 0.3922048, 1.834, 0, 0.7490196, 1, 1,
0.08943814, 0.8202177, -0.04747206, 0, 0.7411765, 1, 1,
0.0909304, 1.326963, 0.1597183, 0, 0.7372549, 1, 1,
0.09094734, 1.221679, 0.5674496, 0, 0.7294118, 1, 1,
0.09130165, 1.317169, -0.1999609, 0, 0.7254902, 1, 1,
0.09154045, 1.53466, -0.8198758, 0, 0.7176471, 1, 1,
0.09253633, -0.01832652, 2.692057, 0, 0.7137255, 1, 1,
0.09500176, 1.418096, 0.702929, 0, 0.7058824, 1, 1,
0.09793297, 1.139034, -0.5880528, 0, 0.6980392, 1, 1,
0.09826969, 0.7224343, 0.1296561, 0, 0.6941177, 1, 1,
0.09914087, -0.7563878, 1.240273, 0, 0.6862745, 1, 1,
0.1020924, -0.3524023, 3.725632, 0, 0.682353, 1, 1,
0.1062834, -1.956041, 1.31734, 0, 0.6745098, 1, 1,
0.1098599, -0.9104686, 2.405634, 0, 0.6705883, 1, 1,
0.112473, 0.9911753, 0.2698938, 0, 0.6627451, 1, 1,
0.1164233, 1.106255, 0.2106169, 0, 0.6588235, 1, 1,
0.1281804, 0.5706128, -0.5192643, 0, 0.6509804, 1, 1,
0.128603, -0.3453242, 3.067632, 0, 0.6470588, 1, 1,
0.129197, 0.4627548, 0.5796738, 0, 0.6392157, 1, 1,
0.1306295, -0.2879522, 2.677502, 0, 0.6352941, 1, 1,
0.1311161, 0.3633429, -0.05474928, 0, 0.627451, 1, 1,
0.1330564, -1.137947, 2.214346, 0, 0.6235294, 1, 1,
0.1336103, -0.8945299, 2.966293, 0, 0.6156863, 1, 1,
0.1341485, -1.009882, 2.95094, 0, 0.6117647, 1, 1,
0.137732, -0.5814143, 2.470558, 0, 0.6039216, 1, 1,
0.1378109, 0.7998497, 0.2556202, 0, 0.5960785, 1, 1,
0.1386725, 0.8539832, 0.3009061, 0, 0.5921569, 1, 1,
0.1408902, -0.4888377, 2.606457, 0, 0.5843138, 1, 1,
0.1426565, 0.3270546, 1.785836, 0, 0.5803922, 1, 1,
0.1438521, 0.3504545, 0.2525147, 0, 0.572549, 1, 1,
0.1481036, -0.3927578, 1.358248, 0, 0.5686275, 1, 1,
0.1490193, -1.548157, 3.180275, 0, 0.5607843, 1, 1,
0.155269, 0.1487184, 0.4853434, 0, 0.5568628, 1, 1,
0.1557592, -0.413522, 2.142754, 0, 0.5490196, 1, 1,
0.1570598, 0.3862471, 0.6078911, 0, 0.5450981, 1, 1,
0.1582233, -0.9384912, 1.988417, 0, 0.5372549, 1, 1,
0.1589287, -0.2912067, 2.932159, 0, 0.5333334, 1, 1,
0.1630534, -1.338864, 3.290274, 0, 0.5254902, 1, 1,
0.165267, 0.556391, 0.2793048, 0, 0.5215687, 1, 1,
0.1705806, -0.3439288, 2.011725, 0, 0.5137255, 1, 1,
0.1724809, -0.05854913, 0.9367474, 0, 0.509804, 1, 1,
0.1732527, 0.7836528, 2.01314, 0, 0.5019608, 1, 1,
0.1752204, 0.03038415, 2.260369, 0, 0.4941176, 1, 1,
0.1769555, 1.288411, 0.9185611, 0, 0.4901961, 1, 1,
0.1778294, -0.5011954, 2.507362, 0, 0.4823529, 1, 1,
0.1785149, -0.6571819, 2.769166, 0, 0.4784314, 1, 1,
0.1787209, 0.2847767, 2.452448, 0, 0.4705882, 1, 1,
0.18006, -0.4433067, 2.766042, 0, 0.4666667, 1, 1,
0.1830354, -0.7186034, 2.964253, 0, 0.4588235, 1, 1,
0.1836372, 0.01809665, 1.305204, 0, 0.454902, 1, 1,
0.1859482, 0.4535346, 0.3503767, 0, 0.4470588, 1, 1,
0.1890417, 0.03659284, 0.230848, 0, 0.4431373, 1, 1,
0.1894952, 0.05216908, 2.793037, 0, 0.4352941, 1, 1,
0.1913759, 0.2914938, 0.8306025, 0, 0.4313726, 1, 1,
0.1923587, 0.7903052, 1.437104, 0, 0.4235294, 1, 1,
0.1930658, -0.6229871, 2.549021, 0, 0.4196078, 1, 1,
0.1939127, 0.302404, 1.111102, 0, 0.4117647, 1, 1,
0.1971344, -0.5080874, 1.822638, 0, 0.4078431, 1, 1,
0.2021144, 0.8733379, 0.556645, 0, 0.4, 1, 1,
0.2022658, 0.3344158, -0.5454071, 0, 0.3921569, 1, 1,
0.2075147, -0.8584276, 2.042987, 0, 0.3882353, 1, 1,
0.2091544, -1.020476, 4.099125, 0, 0.3803922, 1, 1,
0.2132957, -0.6299936, 2.326222, 0, 0.3764706, 1, 1,
0.2143247, 0.06472555, 1.41441, 0, 0.3686275, 1, 1,
0.2278253, 0.9940864, 1.248757, 0, 0.3647059, 1, 1,
0.2285527, -0.9988387, 1.560204, 0, 0.3568628, 1, 1,
0.2326212, 0.9951328, 1.727414, 0, 0.3529412, 1, 1,
0.2402543, -0.6511194, 3.31871, 0, 0.345098, 1, 1,
0.2425689, -0.7008276, 1.954251, 0, 0.3411765, 1, 1,
0.2435948, 0.05605919, -0.2944561, 0, 0.3333333, 1, 1,
0.2495131, -1.552187, 2.714854, 0, 0.3294118, 1, 1,
0.2520896, -1.366379, 2.597628, 0, 0.3215686, 1, 1,
0.2523097, 0.4233021, 2.149968, 0, 0.3176471, 1, 1,
0.2539309, -0.1058066, 0.1041789, 0, 0.3098039, 1, 1,
0.2539379, -0.7559199, 3.727325, 0, 0.3058824, 1, 1,
0.2540988, -0.2811549, 2.922697, 0, 0.2980392, 1, 1,
0.256275, -1.522255, 2.509851, 0, 0.2901961, 1, 1,
0.2574922, 0.5762971, -0.6214804, 0, 0.2862745, 1, 1,
0.2591632, -2.086601, 2.881436, 0, 0.2784314, 1, 1,
0.2601357, -0.8373445, 1.607788, 0, 0.2745098, 1, 1,
0.2678487, 0.7180188, 0.2089168, 0, 0.2666667, 1, 1,
0.2725008, 0.4650156, 1.355036, 0, 0.2627451, 1, 1,
0.2725271, 0.7309178, 0.3362871, 0, 0.254902, 1, 1,
0.2734544, 1.467495, -0.3930472, 0, 0.2509804, 1, 1,
0.2740668, 1.108531, 0.4631228, 0, 0.2431373, 1, 1,
0.2766467, 0.9069287, 1.239386, 0, 0.2392157, 1, 1,
0.278752, -0.7565418, 3.709054, 0, 0.2313726, 1, 1,
0.2804279, 0.7018703, -2.005674, 0, 0.227451, 1, 1,
0.2862723, 0.03528913, 1.183322, 0, 0.2196078, 1, 1,
0.2925633, 1.49293, 0.06786545, 0, 0.2156863, 1, 1,
0.2936406, -0.3273287, 1.773918, 0, 0.2078431, 1, 1,
0.2959719, 0.367972, -1.206814, 0, 0.2039216, 1, 1,
0.2977647, -1.547345, 2.378021, 0, 0.1960784, 1, 1,
0.2978148, -0.3529057, -0.1130727, 0, 0.1882353, 1, 1,
0.3015735, 0.5591387, 0.7506186, 0, 0.1843137, 1, 1,
0.3023151, 0.4935746, 0.8714921, 0, 0.1764706, 1, 1,
0.304348, -0.2954054, 2.280906, 0, 0.172549, 1, 1,
0.3063219, 0.08030792, 1.085777, 0, 0.1647059, 1, 1,
0.3121621, 1.327774, -0.5899798, 0, 0.1607843, 1, 1,
0.3143666, 0.4724499, 0.3341945, 0, 0.1529412, 1, 1,
0.3157572, 0.9496917, -0.129943, 0, 0.1490196, 1, 1,
0.3175466, -0.2178684, 2.48842, 0, 0.1411765, 1, 1,
0.320782, 1.25677, 1.262454, 0, 0.1372549, 1, 1,
0.3219578, 0.6430931, -0.3690311, 0, 0.1294118, 1, 1,
0.3233868, 1.374717, -1.358082, 0, 0.1254902, 1, 1,
0.3236696, -0.4812447, 3.895884, 0, 0.1176471, 1, 1,
0.3284551, -0.5996599, 4.235664, 0, 0.1137255, 1, 1,
0.3297518, 1.287574, 0.8650336, 0, 0.1058824, 1, 1,
0.3301786, 0.05505192, 0.8866164, 0, 0.09803922, 1, 1,
0.3307534, -1.400902, 3.680771, 0, 0.09411765, 1, 1,
0.3308713, -0.1951944, 3.520652, 0, 0.08627451, 1, 1,
0.3361219, -0.8852457, 1.369048, 0, 0.08235294, 1, 1,
0.3433604, -0.2214431, 1.178062, 0, 0.07450981, 1, 1,
0.3434206, -0.3081276, 4.138684, 0, 0.07058824, 1, 1,
0.3436405, -0.7435979, 1.93171, 0, 0.0627451, 1, 1,
0.3442451, -0.01858029, 0.08063727, 0, 0.05882353, 1, 1,
0.3461241, -1.256634, 3.769219, 0, 0.05098039, 1, 1,
0.3505232, 0.2174924, 0.5583982, 0, 0.04705882, 1, 1,
0.3662911, 0.8508348, -0.8979545, 0, 0.03921569, 1, 1,
0.3682455, -0.04492514, 1.198901, 0, 0.03529412, 1, 1,
0.3731284, -0.01646473, 0.4633251, 0, 0.02745098, 1, 1,
0.3747796, -1.373981, 1.6559, 0, 0.02352941, 1, 1,
0.3769102, 0.00581349, 0.5290712, 0, 0.01568628, 1, 1,
0.378525, 0.6576512, 1.196755, 0, 0.01176471, 1, 1,
0.3787661, -1.319421, 4.637024, 0, 0.003921569, 1, 1,
0.3820704, 0.06649165, 1.88109, 0.003921569, 0, 1, 1,
0.3849183, 0.03466164, 3.654962, 0.007843138, 0, 1, 1,
0.3853361, -0.2419392, 3.291147, 0.01568628, 0, 1, 1,
0.3903614, 0.3637769, -1.374535, 0.01960784, 0, 1, 1,
0.3931337, -0.1700431, 2.860769, 0.02745098, 0, 1, 1,
0.3998789, -0.1963274, 2.529383, 0.03137255, 0, 1, 1,
0.4047849, -0.8391188, 2.279257, 0.03921569, 0, 1, 1,
0.4191293, 1.002416, -0.7462742, 0.04313726, 0, 1, 1,
0.420159, -0.2342339, 1.892262, 0.05098039, 0, 1, 1,
0.4266849, -1.423238, 2.585061, 0.05490196, 0, 1, 1,
0.4275428, 0.202731, 2.736459, 0.0627451, 0, 1, 1,
0.4297276, 2.36172, -2.202596, 0.06666667, 0, 1, 1,
0.4300581, 0.9071875, 0.781776, 0.07450981, 0, 1, 1,
0.4336561, -0.8566926, 1.262417, 0.07843138, 0, 1, 1,
0.4344283, -0.03625172, 2.158456, 0.08627451, 0, 1, 1,
0.4351777, -1.498305, 3.814671, 0.09019608, 0, 1, 1,
0.435735, 0.8426967, 1.555616, 0.09803922, 0, 1, 1,
0.4402257, 1.732781, 0.9911407, 0.1058824, 0, 1, 1,
0.4436066, -0.7487555, -0.08189905, 0.1098039, 0, 1, 1,
0.4461879, -0.6062865, 0.6323225, 0.1176471, 0, 1, 1,
0.4526992, -0.2169576, 1.577721, 0.1215686, 0, 1, 1,
0.4533341, -1.917101, 4.078063, 0.1294118, 0, 1, 1,
0.457568, 0.7722181, -1.817724, 0.1333333, 0, 1, 1,
0.4580225, 0.9393833, 0.542344, 0.1411765, 0, 1, 1,
0.4608762, -1.18318, 5.254044, 0.145098, 0, 1, 1,
0.4629606, -0.68909, 1.462956, 0.1529412, 0, 1, 1,
0.4672757, 0.7770311, -0.7080963, 0.1568628, 0, 1, 1,
0.4742285, -0.9916666, 2.259068, 0.1647059, 0, 1, 1,
0.4787273, -1.67213, 4.086776, 0.1686275, 0, 1, 1,
0.4821891, -0.2564114, 4.350186, 0.1764706, 0, 1, 1,
0.4858815, 1.926887, -0.1451667, 0.1803922, 0, 1, 1,
0.4876501, -0.5997384, 1.607603, 0.1882353, 0, 1, 1,
0.4900636, -1.583233, 2.522933, 0.1921569, 0, 1, 1,
0.5106518, -0.2254768, 3.266456, 0.2, 0, 1, 1,
0.5129396, 0.2106484, 0.5742014, 0.2078431, 0, 1, 1,
0.5133398, -1.187739, 3.943373, 0.2117647, 0, 1, 1,
0.5175115, 1.052971, 1.186811, 0.2196078, 0, 1, 1,
0.519116, -0.04327396, 1.842114, 0.2235294, 0, 1, 1,
0.5204527, 1.629222, 0.06036553, 0.2313726, 0, 1, 1,
0.5208276, 0.7989672, -0.658812, 0.2352941, 0, 1, 1,
0.5223613, -0.7943746, 1.601, 0.2431373, 0, 1, 1,
0.5242581, -0.299516, 2.42352, 0.2470588, 0, 1, 1,
0.5291377, -1.280037, 2.20119, 0.254902, 0, 1, 1,
0.5371632, -0.8807177, 2.273755, 0.2588235, 0, 1, 1,
0.5383096, 0.3283009, 0.7810569, 0.2666667, 0, 1, 1,
0.5386989, 1.877378, -1.453394, 0.2705882, 0, 1, 1,
0.5411116, 1.487618, 0.1464146, 0.2784314, 0, 1, 1,
0.5577888, -0.3376154, 1.906132, 0.282353, 0, 1, 1,
0.5631868, 0.6062236, 1.803765, 0.2901961, 0, 1, 1,
0.5649831, 0.06323623, 1.525384, 0.2941177, 0, 1, 1,
0.565822, -0.407959, 3.049394, 0.3019608, 0, 1, 1,
0.5658401, -0.4138852, 2.027412, 0.3098039, 0, 1, 1,
0.5751215, -1.044915, 3.581735, 0.3137255, 0, 1, 1,
0.5828297, -0.7956018, 3.011246, 0.3215686, 0, 1, 1,
0.5831103, 0.1436271, 2.578959, 0.3254902, 0, 1, 1,
0.591108, -0.8764351, 2.1259, 0.3333333, 0, 1, 1,
0.5929327, 0.7237941, 1.334618, 0.3372549, 0, 1, 1,
0.5935776, 1.18762, 2.061768, 0.345098, 0, 1, 1,
0.5976524, -0.2645754, 2.539964, 0.3490196, 0, 1, 1,
0.5998101, 3.080912, -1.05507, 0.3568628, 0, 1, 1,
0.6034067, -2.035561, 2.404939, 0.3607843, 0, 1, 1,
0.6049252, 0.9798164, 0.877239, 0.3686275, 0, 1, 1,
0.6060313, 0.3411135, 1.695213, 0.372549, 0, 1, 1,
0.6068285, 0.07405315, -0.5788796, 0.3803922, 0, 1, 1,
0.6090905, -0.1104636, 3.189842, 0.3843137, 0, 1, 1,
0.6129133, 1.212837, 1.541577, 0.3921569, 0, 1, 1,
0.6129885, 1.328818, -1.064731, 0.3960784, 0, 1, 1,
0.6148143, -0.3830206, 2.8146, 0.4039216, 0, 1, 1,
0.6150398, 2.00314, 0.04416933, 0.4117647, 0, 1, 1,
0.6175511, 0.634477, 0.08038113, 0.4156863, 0, 1, 1,
0.6182442, 0.3750485, 0.01368731, 0.4235294, 0, 1, 1,
0.6228852, -1.509487, 2.530535, 0.427451, 0, 1, 1,
0.6232923, -0.2647404, 2.788492, 0.4352941, 0, 1, 1,
0.6236553, 1.348337, -0.7091076, 0.4392157, 0, 1, 1,
0.6241348, 0.8368567, 1.761432, 0.4470588, 0, 1, 1,
0.6332598, -1.397133, 3.173087, 0.4509804, 0, 1, 1,
0.6341347, -0.3765074, 2.195451, 0.4588235, 0, 1, 1,
0.6357074, 0.08665163, 2.295421, 0.4627451, 0, 1, 1,
0.6357323, -1.199607, 2.888912, 0.4705882, 0, 1, 1,
0.6386339, 0.2776835, 1.962685, 0.4745098, 0, 1, 1,
0.6406196, -0.004565945, 2.240834, 0.4823529, 0, 1, 1,
0.6504752, -2.427849, 2.475701, 0.4862745, 0, 1, 1,
0.6528028, -2.825929, 4.444081, 0.4941176, 0, 1, 1,
0.654847, 0.8737883, 0.0724471, 0.5019608, 0, 1, 1,
0.660754, 1.479287, 1.093257, 0.5058824, 0, 1, 1,
0.6671896, 1.766978, -0.1520083, 0.5137255, 0, 1, 1,
0.6714199, -0.5860677, 2.485413, 0.5176471, 0, 1, 1,
0.6821469, 0.9911913, -0.6438737, 0.5254902, 0, 1, 1,
0.6847071, 0.197668, 0.3128932, 0.5294118, 0, 1, 1,
0.68613, -0.6970523, 2.79197, 0.5372549, 0, 1, 1,
0.6918647, -0.3834881, 3.58374, 0.5411765, 0, 1, 1,
0.6957377, -0.4840836, 2.063274, 0.5490196, 0, 1, 1,
0.699891, 0.403247, 1.205036, 0.5529412, 0, 1, 1,
0.7014513, -0.1089104, 1.182324, 0.5607843, 0, 1, 1,
0.7014726, 1.517776, -1.010967, 0.5647059, 0, 1, 1,
0.7046439, -3.204755, 3.838734, 0.572549, 0, 1, 1,
0.7098834, -0.4943116, 4.325035, 0.5764706, 0, 1, 1,
0.716975, 0.7403777, 1.542453, 0.5843138, 0, 1, 1,
0.7211218, 1.097199, 0.8055566, 0.5882353, 0, 1, 1,
0.7217225, -0.07389125, 2.589979, 0.5960785, 0, 1, 1,
0.7295835, -0.4535642, 3.839252, 0.6039216, 0, 1, 1,
0.7307034, -1.476762, 3.914354, 0.6078432, 0, 1, 1,
0.7337628, -0.7790358, 3.003411, 0.6156863, 0, 1, 1,
0.736982, 0.5864697, 0.3657079, 0.6196079, 0, 1, 1,
0.743117, 0.2837512, -0.4232136, 0.627451, 0, 1, 1,
0.7438986, 0.6588264, 1.211658, 0.6313726, 0, 1, 1,
0.7500724, 0.7176148, 1.08271, 0.6392157, 0, 1, 1,
0.7526646, 0.7239406, 1.020489, 0.6431373, 0, 1, 1,
0.7529165, -0.8605127, 3.293594, 0.6509804, 0, 1, 1,
0.7607838, -0.1350537, 2.735979, 0.654902, 0, 1, 1,
0.7631978, 2.046258, 0.7155665, 0.6627451, 0, 1, 1,
0.7680473, 0.5774686, -1.003335, 0.6666667, 0, 1, 1,
0.7724053, 0.8149228, 2.108652, 0.6745098, 0, 1, 1,
0.7744493, 2.874938, 0.4427978, 0.6784314, 0, 1, 1,
0.7767172, -0.2945644, 2.315557, 0.6862745, 0, 1, 1,
0.7777439, 0.3223866, 1.293146, 0.6901961, 0, 1, 1,
0.7883618, 0.8716212, -0.1197157, 0.6980392, 0, 1, 1,
0.7903643, 1.000517, 0.9977454, 0.7058824, 0, 1, 1,
0.7903898, -0.7251294, 1.331757, 0.7098039, 0, 1, 1,
0.7908816, -0.02618975, 2.474186, 0.7176471, 0, 1, 1,
0.7921435, -0.708946, -0.02537325, 0.7215686, 0, 1, 1,
0.7976182, 0.1541687, 0.791364, 0.7294118, 0, 1, 1,
0.8033359, 0.2638283, 2.375436, 0.7333333, 0, 1, 1,
0.8099939, 1.326321, 1.487856, 0.7411765, 0, 1, 1,
0.8122806, 1.289233, -0.2723553, 0.7450981, 0, 1, 1,
0.8160781, -1.121683, 3.257609, 0.7529412, 0, 1, 1,
0.8170545, -0.1682322, 1.050912, 0.7568628, 0, 1, 1,
0.8181837, 0.2536918, 1.567588, 0.7647059, 0, 1, 1,
0.8232216, -0.393944, 2.551127, 0.7686275, 0, 1, 1,
0.8279849, 1.207476, 0.6367062, 0.7764706, 0, 1, 1,
0.8288354, -0.3986107, 1.220095, 0.7803922, 0, 1, 1,
0.8292285, -2.423462, 3.196398, 0.7882353, 0, 1, 1,
0.8445084, 1.366174, 0.2306293, 0.7921569, 0, 1, 1,
0.8490622, -0.05959668, 0.9363829, 0.8, 0, 1, 1,
0.8513471, 0.02422747, 1.312414, 0.8078431, 0, 1, 1,
0.8537761, 0.4425106, 0.1502213, 0.8117647, 0, 1, 1,
0.8585806, -0.7922823, 0.6407573, 0.8196079, 0, 1, 1,
0.8629121, 1.170594, -1.624782, 0.8235294, 0, 1, 1,
0.8646266, 0.1439122, 1.828512, 0.8313726, 0, 1, 1,
0.8685637, -0.6437926, 4.525482, 0.8352941, 0, 1, 1,
0.8723825, -0.4478099, 2.646245, 0.8431373, 0, 1, 1,
0.8725059, -0.8522399, 2.055094, 0.8470588, 0, 1, 1,
0.8793674, -0.6363324, 1.424712, 0.854902, 0, 1, 1,
0.8798596, 1.436869, 0.6763237, 0.8588235, 0, 1, 1,
0.8830627, 1.109778, -0.4628043, 0.8666667, 0, 1, 1,
0.8835778, 0.08780523, 0.2676126, 0.8705882, 0, 1, 1,
0.8912845, -0.7324465, 1.430467, 0.8784314, 0, 1, 1,
0.8985682, 0.4176066, 0.6365401, 0.8823529, 0, 1, 1,
0.899178, -0.3367186, 1.122477, 0.8901961, 0, 1, 1,
0.9031238, 0.7174647, 0.0949642, 0.8941177, 0, 1, 1,
0.9097388, -1.745921, 1.46065, 0.9019608, 0, 1, 1,
0.913991, -0.7823492, 1.197569, 0.9098039, 0, 1, 1,
0.9205818, -0.174514, 2.463813, 0.9137255, 0, 1, 1,
0.92942, 0.4917946, 1.371466, 0.9215686, 0, 1, 1,
0.9294359, -0.04623865, 3.000156, 0.9254902, 0, 1, 1,
0.9325332, 0.6079211, -1.040553, 0.9333333, 0, 1, 1,
0.9335418, 0.3820389, 0.3494973, 0.9372549, 0, 1, 1,
0.9376002, -0.4061444, 1.711129, 0.945098, 0, 1, 1,
0.9394779, 1.652961, 1.474068, 0.9490196, 0, 1, 1,
0.9421459, 1.126675, 0.978139, 0.9568627, 0, 1, 1,
0.9462929, -0.4195617, 3.540118, 0.9607843, 0, 1, 1,
0.9571697, 1.012158, 0.1229367, 0.9686275, 0, 1, 1,
0.9577855, 1.089182, -0.7671602, 0.972549, 0, 1, 1,
0.9723184, 0.2911573, 2.916544, 0.9803922, 0, 1, 1,
0.9745718, 0.9964998, -0.1166519, 0.9843137, 0, 1, 1,
0.9850888, -1.125164, 2.916971, 0.9921569, 0, 1, 1,
0.9908819, 1.621006, 0.5304133, 0.9960784, 0, 1, 1,
0.992039, 1.631321, -0.2229605, 1, 0, 0.9960784, 1,
0.9930704, -0.4872595, 2.864838, 1, 0, 0.9882353, 1,
0.9956766, 0.4794738, 1.759634, 1, 0, 0.9843137, 1,
0.9992955, -0.2148727, 2.010325, 1, 0, 0.9764706, 1,
1.000164, 1.129233, -0.6029801, 1, 0, 0.972549, 1,
1.000795, 0.04542668, 3.143734, 1, 0, 0.9647059, 1,
1.000908, 0.3781234, 0.5618615, 1, 0, 0.9607843, 1,
1.005052, 0.2947592, 2.57703, 1, 0, 0.9529412, 1,
1.007124, -0.2358831, 2.050137, 1, 0, 0.9490196, 1,
1.01097, -1.252801, 3.882483, 1, 0, 0.9411765, 1,
1.013437, 1.287449, 2.090325, 1, 0, 0.9372549, 1,
1.014, 1.12785, -0.9062071, 1, 0, 0.9294118, 1,
1.016736, -0.122742, -0.387778, 1, 0, 0.9254902, 1,
1.017492, -1.256781, 2.802327, 1, 0, 0.9176471, 1,
1.025564, 0.9305933, 0.5829309, 1, 0, 0.9137255, 1,
1.030078, 0.1908254, 0.9644377, 1, 0, 0.9058824, 1,
1.030797, 1.159159, 1.762917, 1, 0, 0.9019608, 1,
1.033729, -0.18512, 1.06266, 1, 0, 0.8941177, 1,
1.036032, 0.3054222, 0.6370354, 1, 0, 0.8862745, 1,
1.049816, -0.8416418, 2.625012, 1, 0, 0.8823529, 1,
1.063953, -1.466579, 2.812803, 1, 0, 0.8745098, 1,
1.066688, -0.4583299, 1.454614, 1, 0, 0.8705882, 1,
1.073144, -1.174378, 1.429798, 1, 0, 0.8627451, 1,
1.077462, -0.5422624, 0.6667271, 1, 0, 0.8588235, 1,
1.097856, -0.472528, 2.074903, 1, 0, 0.8509804, 1,
1.102428, -0.3916237, 1.696174, 1, 0, 0.8470588, 1,
1.102562, -0.8810637, 1.512293, 1, 0, 0.8392157, 1,
1.103054, 0.313788, 1.959496, 1, 0, 0.8352941, 1,
1.107505, -0.3470808, 1.869578, 1, 0, 0.827451, 1,
1.113109, -0.8232594, 2.287506, 1, 0, 0.8235294, 1,
1.120906, 1.519537, 0.3290516, 1, 0, 0.8156863, 1,
1.1233, 0.6092941, 1.464452, 1, 0, 0.8117647, 1,
1.125481, 1.122337, 1.395976, 1, 0, 0.8039216, 1,
1.126472, -2.052376, 1.627536, 1, 0, 0.7960784, 1,
1.129456, -1.06969, 1.672563, 1, 0, 0.7921569, 1,
1.13703, 1.227468, 2.546211, 1, 0, 0.7843137, 1,
1.139062, 0.2447258, 1.441322, 1, 0, 0.7803922, 1,
1.139208, -1.489644, 3.67191, 1, 0, 0.772549, 1,
1.147127, -0.1077694, 2.0238, 1, 0, 0.7686275, 1,
1.149564, -0.7064828, 1.977394, 1, 0, 0.7607843, 1,
1.153759, -0.353464, 2.319188, 1, 0, 0.7568628, 1,
1.155455, -1.730902, 1.558497, 1, 0, 0.7490196, 1,
1.157369, -0.7533911, 0.4354548, 1, 0, 0.7450981, 1,
1.164048, -0.6666641, 1.492023, 1, 0, 0.7372549, 1,
1.168515, 0.662797, 2.412927, 1, 0, 0.7333333, 1,
1.171515, 1.757367, -1.255747, 1, 0, 0.7254902, 1,
1.182618, 0.8035961, 1.567756, 1, 0, 0.7215686, 1,
1.1843, -0.07090021, 2.099372, 1, 0, 0.7137255, 1,
1.184692, -1.327029, 1.697255, 1, 0, 0.7098039, 1,
1.18679, 0.9768696, -0.9506212, 1, 0, 0.7019608, 1,
1.189493, -1.267988, 3.508816, 1, 0, 0.6941177, 1,
1.197915, 0.2228024, 1.409583, 1, 0, 0.6901961, 1,
1.201483, -0.3708709, 0.6663542, 1, 0, 0.682353, 1,
1.20182, 1.231003, 1.221753, 1, 0, 0.6784314, 1,
1.206077, -1.854965, 3.581121, 1, 0, 0.6705883, 1,
1.209281, -2.823635, 1.922647, 1, 0, 0.6666667, 1,
1.211252, 0.04061269, 2.346004, 1, 0, 0.6588235, 1,
1.214302, -0.6736225, 2.905047, 1, 0, 0.654902, 1,
1.215361, 0.3243578, 1.617837, 1, 0, 0.6470588, 1,
1.215651, -1.353341, 1.443228, 1, 0, 0.6431373, 1,
1.223458, 0.7719449, 3.217626, 1, 0, 0.6352941, 1,
1.232126, -0.05137995, 2.079994, 1, 0, 0.6313726, 1,
1.241349, 0.8814832, 2.449328, 1, 0, 0.6235294, 1,
1.245982, -0.9122643, 0.1921874, 1, 0, 0.6196079, 1,
1.25583, 0.1572555, 1.00503, 1, 0, 0.6117647, 1,
1.260598, 1.646821, -0.9994452, 1, 0, 0.6078432, 1,
1.262134, 0.2879478, 1.02915, 1, 0, 0.6, 1,
1.266253, 0.5440912, 1.161147, 1, 0, 0.5921569, 1,
1.267853, -0.6088871, -0.5325033, 1, 0, 0.5882353, 1,
1.272698, 0.7606942, 2.840385, 1, 0, 0.5803922, 1,
1.273614, 1.884435, -0.9163103, 1, 0, 0.5764706, 1,
1.277986, 0.5340285, 2.339892, 1, 0, 0.5686275, 1,
1.280259, -0.9360158, 1.182552, 1, 0, 0.5647059, 1,
1.285064, -0.940679, 1.024542, 1, 0, 0.5568628, 1,
1.28661, 1.484939, -0.1382935, 1, 0, 0.5529412, 1,
1.297541, -0.9312819, 2.680971, 1, 0, 0.5450981, 1,
1.305211, -0.02643449, 0.7585692, 1, 0, 0.5411765, 1,
1.30654, 1.247845, -2.390027, 1, 0, 0.5333334, 1,
1.315148, 0.3028935, 1.18023, 1, 0, 0.5294118, 1,
1.316212, -1.691821, 1.570577, 1, 0, 0.5215687, 1,
1.317016, 0.52231, 1.602147, 1, 0, 0.5176471, 1,
1.319238, -0.1989939, 1.009562, 1, 0, 0.509804, 1,
1.321529, 0.08587558, 0.4670389, 1, 0, 0.5058824, 1,
1.324273, -1.359919, 2.580138, 1, 0, 0.4980392, 1,
1.337777, 0.1858132, 0.826575, 1, 0, 0.4901961, 1,
1.343557, 0.598872, -0.08939896, 1, 0, 0.4862745, 1,
1.362098, 0.4115228, -0.05924638, 1, 0, 0.4784314, 1,
1.368497, -0.09842619, 4.017388, 1, 0, 0.4745098, 1,
1.379988, 1.104383, 0.4430869, 1, 0, 0.4666667, 1,
1.388133, 0.4287344, 1.15073, 1, 0, 0.4627451, 1,
1.392064, -2.261527, 3.58847, 1, 0, 0.454902, 1,
1.401735, -0.6444569, 1.960288, 1, 0, 0.4509804, 1,
1.405123, 1.479811, -0.5389777, 1, 0, 0.4431373, 1,
1.426726, -0.5235773, 2.72132, 1, 0, 0.4392157, 1,
1.431036, 1.242757, 2.294502, 1, 0, 0.4313726, 1,
1.435827, 1.34254, 1.758995, 1, 0, 0.427451, 1,
1.440045, -0.9610877, 3.114267, 1, 0, 0.4196078, 1,
1.452795, -1.827668, 4.348269, 1, 0, 0.4156863, 1,
1.463655, -0.6800835, 0.5342695, 1, 0, 0.4078431, 1,
1.474218, -0.09514393, 0.3640246, 1, 0, 0.4039216, 1,
1.475213, 1.099718, 0.1531057, 1, 0, 0.3960784, 1,
1.481659, -0.3164335, 1.673635, 1, 0, 0.3882353, 1,
1.507797, -0.4973346, 1.946002, 1, 0, 0.3843137, 1,
1.513604, -0.1471287, 0.4544563, 1, 0, 0.3764706, 1,
1.515426, 0.2356317, 2.005107, 1, 0, 0.372549, 1,
1.520606, -1.154859, 1.463862, 1, 0, 0.3647059, 1,
1.531275, -0.681296, 0.6986488, 1, 0, 0.3607843, 1,
1.554558, 0.9684047, 0.6711213, 1, 0, 0.3529412, 1,
1.556829, -0.5572332, 2.848595, 1, 0, 0.3490196, 1,
1.563046, -1.398849, 2.820041, 1, 0, 0.3411765, 1,
1.587004, -1.300477, 2.52863, 1, 0, 0.3372549, 1,
1.589364, -0.2595079, 3.334568, 1, 0, 0.3294118, 1,
1.616474, 0.1790426, 1.874303, 1, 0, 0.3254902, 1,
1.621174, -0.6968222, 1.330199, 1, 0, 0.3176471, 1,
1.624093, -0.3637144, 2.185651, 1, 0, 0.3137255, 1,
1.63183, 2.479316, 1.194505, 1, 0, 0.3058824, 1,
1.634075, -0.4693807, 1.747555, 1, 0, 0.2980392, 1,
1.641335, 0.3452508, 1.012672, 1, 0, 0.2941177, 1,
1.64581, 1.220336, 0.5498477, 1, 0, 0.2862745, 1,
1.64716, 1.066961, 0.8577059, 1, 0, 0.282353, 1,
1.648536, -1.106467, 2.645973, 1, 0, 0.2745098, 1,
1.659909, 0.03432495, -1.48806, 1, 0, 0.2705882, 1,
1.68338, 1.533263, 0.3171671, 1, 0, 0.2627451, 1,
1.702494, 0.5899725, 1.521218, 1, 0, 0.2588235, 1,
1.702741, 0.1372863, 1.406294, 1, 0, 0.2509804, 1,
1.703953, 0.9075223, 0.6802742, 1, 0, 0.2470588, 1,
1.737695, 0.9489032, -0.4970337, 1, 0, 0.2392157, 1,
1.745027, -0.4177754, 2.698994, 1, 0, 0.2352941, 1,
1.78468, 0.6686055, 0.9513731, 1, 0, 0.227451, 1,
1.791756, 1.858208, -0.3360189, 1, 0, 0.2235294, 1,
1.793968, 0.145266, 0.1645694, 1, 0, 0.2156863, 1,
1.808224, 0.4524379, 1.91928, 1, 0, 0.2117647, 1,
1.827593, -1.248567, 2.609156, 1, 0, 0.2039216, 1,
1.832418, -0.5239389, 1.219029, 1, 0, 0.1960784, 1,
1.833846, -0.4355113, 3.035594, 1, 0, 0.1921569, 1,
1.888821, 0.9610018, 2.450337, 1, 0, 0.1843137, 1,
1.888908, -1.080769, 1.759362, 1, 0, 0.1803922, 1,
1.928593, -0.6694753, 1.258294, 1, 0, 0.172549, 1,
1.932627, -0.3463358, 1.69999, 1, 0, 0.1686275, 1,
1.949764, 1.061626, 1.71742, 1, 0, 0.1607843, 1,
1.953985, 0.4590056, 0.6456524, 1, 0, 0.1568628, 1,
1.978167, 2.207468, 1.786094, 1, 0, 0.1490196, 1,
1.988403, -1.292689, 1.209832, 1, 0, 0.145098, 1,
1.990434, -0.2501567, 1.141191, 1, 0, 0.1372549, 1,
2.006368, -0.5522531, 0.3825068, 1, 0, 0.1333333, 1,
2.041516, 0.3215714, 1.690311, 1, 0, 0.1254902, 1,
2.081304, -1.76605, 2.302923, 1, 0, 0.1215686, 1,
2.120263, -0.02637671, 1.659603, 1, 0, 0.1137255, 1,
2.17517, 0.4472174, 0.9379569, 1, 0, 0.1098039, 1,
2.188719, 0.9242436, 0.7760404, 1, 0, 0.1019608, 1,
2.239479, -0.569513, 2.200729, 1, 0, 0.09411765, 1,
2.292371, -1.492091, 1.856196, 1, 0, 0.09019608, 1,
2.370388, 0.02423045, 1.609566, 1, 0, 0.08235294, 1,
2.387081, -0.5726146, 1.944181, 1, 0, 0.07843138, 1,
2.445609, -0.7818245, 2.517254, 1, 0, 0.07058824, 1,
2.480333, -1.000964, 0.8991228, 1, 0, 0.06666667, 1,
2.497867, 0.9021428, 2.752329, 1, 0, 0.05882353, 1,
2.52861, 0.170104, 1.545716, 1, 0, 0.05490196, 1,
2.554671, -0.02315012, 2.367618, 1, 0, 0.04705882, 1,
2.632051, 1.643509, 1.724674, 1, 0, 0.04313726, 1,
2.680063, -0.7444822, 0.6780396, 1, 0, 0.03529412, 1,
2.741503, 2.51635, -0.3536824, 1, 0, 0.03137255, 1,
2.751858, 1.015267, 1.191059, 1, 0, 0.02352941, 1,
2.757308, 1.372207, 1.876988, 1, 0, 0.01960784, 1,
2.857881, -1.107466, 0.4977401, 1, 0, 0.01176471, 1,
2.868147, 0.03500177, -0.06568613, 1, 0, 0.007843138, 1
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
-0.24843, -4.286441, -7.563613, 0, -0.5, 0.5, 0.5,
-0.24843, -4.286441, -7.563613, 1, -0.5, 0.5, 0.5,
-0.24843, -4.286441, -7.563613, 1, 1.5, 0.5, 0.5,
-0.24843, -4.286441, -7.563613, 0, 1.5, 0.5, 0.5
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
-4.421526, -0.01393855, -7.563613, 0, -0.5, 0.5, 0.5,
-4.421526, -0.01393855, -7.563613, 1, -0.5, 0.5, 0.5,
-4.421526, -0.01393855, -7.563613, 1, 1.5, 0.5, 0.5,
-4.421526, -0.01393855, -7.563613, 0, 1.5, 0.5, 0.5
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
-4.421526, -4.286441, -0.2259295, 0, -0.5, 0.5, 0.5,
-4.421526, -4.286441, -0.2259295, 1, -0.5, 0.5, 0.5,
-4.421526, -4.286441, -0.2259295, 1, 1.5, 0.5, 0.5,
-4.421526, -4.286441, -0.2259295, 0, 1.5, 0.5, 0.5
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
-3, -3.300479, -5.870302,
2, -3.300479, -5.870302,
-3, -3.300479, -5.870302,
-3, -3.464806, -6.15252,
-2, -3.300479, -5.870302,
-2, -3.464806, -6.15252,
-1, -3.300479, -5.870302,
-1, -3.464806, -6.15252,
0, -3.300479, -5.870302,
0, -3.464806, -6.15252,
1, -3.300479, -5.870302,
1, -3.464806, -6.15252,
2, -3.300479, -5.870302,
2, -3.464806, -6.15252
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
-3, -3.79346, -6.716958, 0, -0.5, 0.5, 0.5,
-3, -3.79346, -6.716958, 1, -0.5, 0.5, 0.5,
-3, -3.79346, -6.716958, 1, 1.5, 0.5, 0.5,
-3, -3.79346, -6.716958, 0, 1.5, 0.5, 0.5,
-2, -3.79346, -6.716958, 0, -0.5, 0.5, 0.5,
-2, -3.79346, -6.716958, 1, -0.5, 0.5, 0.5,
-2, -3.79346, -6.716958, 1, 1.5, 0.5, 0.5,
-2, -3.79346, -6.716958, 0, 1.5, 0.5, 0.5,
-1, -3.79346, -6.716958, 0, -0.5, 0.5, 0.5,
-1, -3.79346, -6.716958, 1, -0.5, 0.5, 0.5,
-1, -3.79346, -6.716958, 1, 1.5, 0.5, 0.5,
-1, -3.79346, -6.716958, 0, 1.5, 0.5, 0.5,
0, -3.79346, -6.716958, 0, -0.5, 0.5, 0.5,
0, -3.79346, -6.716958, 1, -0.5, 0.5, 0.5,
0, -3.79346, -6.716958, 1, 1.5, 0.5, 0.5,
0, -3.79346, -6.716958, 0, 1.5, 0.5, 0.5,
1, -3.79346, -6.716958, 0, -0.5, 0.5, 0.5,
1, -3.79346, -6.716958, 1, -0.5, 0.5, 0.5,
1, -3.79346, -6.716958, 1, 1.5, 0.5, 0.5,
1, -3.79346, -6.716958, 0, 1.5, 0.5, 0.5,
2, -3.79346, -6.716958, 0, -0.5, 0.5, 0.5,
2, -3.79346, -6.716958, 1, -0.5, 0.5, 0.5,
2, -3.79346, -6.716958, 1, 1.5, 0.5, 0.5,
2, -3.79346, -6.716958, 0, 1.5, 0.5, 0.5
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
-3.458504, -3, -5.870302,
-3.458504, 3, -5.870302,
-3.458504, -3, -5.870302,
-3.619008, -3, -6.15252,
-3.458504, -2, -5.870302,
-3.619008, -2, -6.15252,
-3.458504, -1, -5.870302,
-3.619008, -1, -6.15252,
-3.458504, 0, -5.870302,
-3.619008, 0, -6.15252,
-3.458504, 1, -5.870302,
-3.619008, 1, -6.15252,
-3.458504, 2, -5.870302,
-3.619008, 2, -6.15252,
-3.458504, 3, -5.870302,
-3.619008, 3, -6.15252
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
-3.940015, -3, -6.716958, 0, -0.5, 0.5, 0.5,
-3.940015, -3, -6.716958, 1, -0.5, 0.5, 0.5,
-3.940015, -3, -6.716958, 1, 1.5, 0.5, 0.5,
-3.940015, -3, -6.716958, 0, 1.5, 0.5, 0.5,
-3.940015, -2, -6.716958, 0, -0.5, 0.5, 0.5,
-3.940015, -2, -6.716958, 1, -0.5, 0.5, 0.5,
-3.940015, -2, -6.716958, 1, 1.5, 0.5, 0.5,
-3.940015, -2, -6.716958, 0, 1.5, 0.5, 0.5,
-3.940015, -1, -6.716958, 0, -0.5, 0.5, 0.5,
-3.940015, -1, -6.716958, 1, -0.5, 0.5, 0.5,
-3.940015, -1, -6.716958, 1, 1.5, 0.5, 0.5,
-3.940015, -1, -6.716958, 0, 1.5, 0.5, 0.5,
-3.940015, 0, -6.716958, 0, -0.5, 0.5, 0.5,
-3.940015, 0, -6.716958, 1, -0.5, 0.5, 0.5,
-3.940015, 0, -6.716958, 1, 1.5, 0.5, 0.5,
-3.940015, 0, -6.716958, 0, 1.5, 0.5, 0.5,
-3.940015, 1, -6.716958, 0, -0.5, 0.5, 0.5,
-3.940015, 1, -6.716958, 1, -0.5, 0.5, 0.5,
-3.940015, 1, -6.716958, 1, 1.5, 0.5, 0.5,
-3.940015, 1, -6.716958, 0, 1.5, 0.5, 0.5,
-3.940015, 2, -6.716958, 0, -0.5, 0.5, 0.5,
-3.940015, 2, -6.716958, 1, -0.5, 0.5, 0.5,
-3.940015, 2, -6.716958, 1, 1.5, 0.5, 0.5,
-3.940015, 2, -6.716958, 0, 1.5, 0.5, 0.5,
-3.940015, 3, -6.716958, 0, -0.5, 0.5, 0.5,
-3.940015, 3, -6.716958, 1, -0.5, 0.5, 0.5,
-3.940015, 3, -6.716958, 1, 1.5, 0.5, 0.5,
-3.940015, 3, -6.716958, 0, 1.5, 0.5, 0.5
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
-3.458504, -3.300479, -4,
-3.458504, -3.300479, 4,
-3.458504, -3.300479, -4,
-3.619008, -3.464806, -4,
-3.458504, -3.300479, -2,
-3.619008, -3.464806, -2,
-3.458504, -3.300479, 0,
-3.619008, -3.464806, 0,
-3.458504, -3.300479, 2,
-3.619008, -3.464806, 2,
-3.458504, -3.300479, 4,
-3.619008, -3.464806, 4
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
-3.940015, -3.79346, -4, 0, -0.5, 0.5, 0.5,
-3.940015, -3.79346, -4, 1, -0.5, 0.5, 0.5,
-3.940015, -3.79346, -4, 1, 1.5, 0.5, 0.5,
-3.940015, -3.79346, -4, 0, 1.5, 0.5, 0.5,
-3.940015, -3.79346, -2, 0, -0.5, 0.5, 0.5,
-3.940015, -3.79346, -2, 1, -0.5, 0.5, 0.5,
-3.940015, -3.79346, -2, 1, 1.5, 0.5, 0.5,
-3.940015, -3.79346, -2, 0, 1.5, 0.5, 0.5,
-3.940015, -3.79346, 0, 0, -0.5, 0.5, 0.5,
-3.940015, -3.79346, 0, 1, -0.5, 0.5, 0.5,
-3.940015, -3.79346, 0, 1, 1.5, 0.5, 0.5,
-3.940015, -3.79346, 0, 0, 1.5, 0.5, 0.5,
-3.940015, -3.79346, 2, 0, -0.5, 0.5, 0.5,
-3.940015, -3.79346, 2, 1, -0.5, 0.5, 0.5,
-3.940015, -3.79346, 2, 1, 1.5, 0.5, 0.5,
-3.940015, -3.79346, 2, 0, 1.5, 0.5, 0.5,
-3.940015, -3.79346, 4, 0, -0.5, 0.5, 0.5,
-3.940015, -3.79346, 4, 1, -0.5, 0.5, 0.5,
-3.940015, -3.79346, 4, 1, 1.5, 0.5, 0.5,
-3.940015, -3.79346, 4, 0, 1.5, 0.5, 0.5
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
-3.458504, -3.300479, -5.870302,
-3.458504, 3.272602, -5.870302,
-3.458504, -3.300479, 5.418443,
-3.458504, 3.272602, 5.418443,
-3.458504, -3.300479, -5.870302,
-3.458504, -3.300479, 5.418443,
-3.458504, 3.272602, -5.870302,
-3.458504, 3.272602, 5.418443,
-3.458504, -3.300479, -5.870302,
2.961644, -3.300479, -5.870302,
-3.458504, -3.300479, 5.418443,
2.961644, -3.300479, 5.418443,
-3.458504, 3.272602, -5.870302,
2.961644, 3.272602, -5.870302,
-3.458504, 3.272602, 5.418443,
2.961644, 3.272602, 5.418443,
2.961644, -3.300479, -5.870302,
2.961644, 3.272602, -5.870302,
2.961644, -3.300479, 5.418443,
2.961644, 3.272602, 5.418443,
2.961644, -3.300479, -5.870302,
2.961644, -3.300479, 5.418443,
2.961644, 3.272602, -5.870302,
2.961644, 3.272602, 5.418443
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
var radius = 7.772297;
var distance = 34.57983;
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
mvMatrix.translate( 0.24843, 0.01393855, 0.2259295 );
mvMatrix.scale( 1.308935, 1.278481, 0.7444193 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.57983);
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
thiamethoxam<-read.table("thiamethoxam.xyz")
```

```
## Error in read.table("thiamethoxam.xyz"): no lines available in input
```

```r
x<-thiamethoxam$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiamethoxam' not found
```

```r
y<-thiamethoxam$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiamethoxam' not found
```

```r
z<-thiamethoxam$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiamethoxam' not found
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
-3.365007, 0.01497064, -3.389471, 0, 0, 1, 1, 1,
-3.117523, -0.7758815, -0.390956, 1, 0, 0, 1, 1,
-2.787461, -1.183797, -3.284538, 1, 0, 0, 1, 1,
-2.740459, 0.9175006, -1.462119, 1, 0, 0, 1, 1,
-2.594616, -1.375758, -1.844743, 1, 0, 0, 1, 1,
-2.403804, 3.087074, -0.1255349, 1, 0, 0, 1, 1,
-2.398728, 0.05668968, -2.216335, 0, 0, 0, 1, 1,
-2.326579, 0.1555132, -1.178307, 0, 0, 0, 1, 1,
-2.301718, -0.07466007, -0.6241032, 0, 0, 0, 1, 1,
-2.254852, 1.277003, -1.836668, 0, 0, 0, 1, 1,
-2.253668, 0.4861713, -1.628894, 0, 0, 0, 1, 1,
-2.241436, 0.8894846, 0.6700225, 0, 0, 0, 1, 1,
-2.231587, 0.1827714, -0.7467247, 0, 0, 0, 1, 1,
-2.22851, -1.225472, -0.7773678, 1, 1, 1, 1, 1,
-2.195802, -0.4083915, -2.551389, 1, 1, 1, 1, 1,
-2.118509, 0.4976649, -2.79392, 1, 1, 1, 1, 1,
-2.115667, 1.624496, -1.692208, 1, 1, 1, 1, 1,
-2.105996, -0.317789, -2.834415, 1, 1, 1, 1, 1,
-2.088157, 0.009921306, -2.620524, 1, 1, 1, 1, 1,
-2.065022, -1.608048, -0.9355708, 1, 1, 1, 1, 1,
-2.042421, -0.4461571, -1.144697, 1, 1, 1, 1, 1,
-1.961211, 0.04032645, 0.5099472, 1, 1, 1, 1, 1,
-1.947532, -0.8085904, -1.537094, 1, 1, 1, 1, 1,
-1.946745, 0.03658924, -0.4821382, 1, 1, 1, 1, 1,
-1.9452, 2.634084, -1.366544, 1, 1, 1, 1, 1,
-1.93984, -1.429213, -2.794003, 1, 1, 1, 1, 1,
-1.929602, 1.036815, -2.429083, 1, 1, 1, 1, 1,
-1.923234, 0.2436856, -2.729178, 1, 1, 1, 1, 1,
-1.922557, 0.3945398, -0.3849937, 0, 0, 1, 1, 1,
-1.902271, -0.06141092, -1.680148, 1, 0, 0, 1, 1,
-1.902003, 0.4636123, -0.1993453, 1, 0, 0, 1, 1,
-1.875872, -1.240739, -2.176034, 1, 0, 0, 1, 1,
-1.841496, 0.1793798, -0.3394076, 1, 0, 0, 1, 1,
-1.833591, -1.400684, -1.951561, 1, 0, 0, 1, 1,
-1.832016, -0.8386132, -2.953295, 0, 0, 0, 1, 1,
-1.831785, -0.0288424, -3.707638, 0, 0, 0, 1, 1,
-1.806886, -1.138551, -0.03592338, 0, 0, 0, 1, 1,
-1.790036, 0.84675, -0.6749505, 0, 0, 0, 1, 1,
-1.778674, 0.3381801, -2.268994, 0, 0, 0, 1, 1,
-1.762234, -0.6517305, -2.010285, 0, 0, 0, 1, 1,
-1.760661, 0.3818134, -1.106225, 0, 0, 0, 1, 1,
-1.756445, -0.1667012, -0.3031866, 1, 1, 1, 1, 1,
-1.74862, -0.757532, -1.936729, 1, 1, 1, 1, 1,
-1.73663, 0.4998158, -2.227183, 1, 1, 1, 1, 1,
-1.729906, -0.2595828, -1.658428, 1, 1, 1, 1, 1,
-1.687788, -1.185795, -2.331537, 1, 1, 1, 1, 1,
-1.68733, 0.2452194, -1.264557, 1, 1, 1, 1, 1,
-1.681899, -0.7650006, -2.798266, 1, 1, 1, 1, 1,
-1.672852, 1.309307, -1.560498, 1, 1, 1, 1, 1,
-1.658872, -0.3991525, -3.111614, 1, 1, 1, 1, 1,
-1.628659, -1.656897, -3.643172, 1, 1, 1, 1, 1,
-1.621441, -0.1615446, -3.395864, 1, 1, 1, 1, 1,
-1.614085, -0.1410136, -1.99851, 1, 1, 1, 1, 1,
-1.606202, -0.9403641, -0.3761467, 1, 1, 1, 1, 1,
-1.604642, 0.3026758, -0.7494576, 1, 1, 1, 1, 1,
-1.601768, -1.835344, -2.779531, 1, 1, 1, 1, 1,
-1.580553, -0.3849291, -1.34172, 0, 0, 1, 1, 1,
-1.573233, -1.742797, -4.045413, 1, 0, 0, 1, 1,
-1.568666, -0.1905391, -0.6364732, 1, 0, 0, 1, 1,
-1.55996, 0.05570456, -1.952805, 1, 0, 0, 1, 1,
-1.55534, -0.7281079, -0.1368106, 1, 0, 0, 1, 1,
-1.539869, -1.581944, -3.156306, 1, 0, 0, 1, 1,
-1.539198, 0.6788484, -1.637548, 0, 0, 0, 1, 1,
-1.52942, 1.021027, -2.587477, 0, 0, 0, 1, 1,
-1.518245, -0.04674306, -1.803425, 0, 0, 0, 1, 1,
-1.514792, 0.272984, -1.940359, 0, 0, 0, 1, 1,
-1.493221, 0.7699355, -0.7460578, 0, 0, 0, 1, 1,
-1.488189, 1.59611, -2.423616, 0, 0, 0, 1, 1,
-1.482098, 0.9204679, -1.640222, 0, 0, 0, 1, 1,
-1.463253, -0.9336848, -1.002578, 1, 1, 1, 1, 1,
-1.456583, 0.7146311, 0.8320936, 1, 1, 1, 1, 1,
-1.455993, -1.299445, -3.672249, 1, 1, 1, 1, 1,
-1.448179, -0.137853, -0.9261603, 1, 1, 1, 1, 1,
-1.418399, 0.4839509, -0.6450678, 1, 1, 1, 1, 1,
-1.412497, -2.826558, -2.895092, 1, 1, 1, 1, 1,
-1.410222, -0.8742747, -4.163976, 1, 1, 1, 1, 1,
-1.408407, 0.03413554, 0.05433514, 1, 1, 1, 1, 1,
-1.388505, -1.874072, -3.864009, 1, 1, 1, 1, 1,
-1.3818, -0.2719094, -2.491674, 1, 1, 1, 1, 1,
-1.380296, -0.04721538, -1.911857, 1, 1, 1, 1, 1,
-1.373008, -1.656844, -2.513096, 1, 1, 1, 1, 1,
-1.362865, -1.4579, -2.079731, 1, 1, 1, 1, 1,
-1.361432, 1.219776, 0.7872064, 1, 1, 1, 1, 1,
-1.351511, 1.670924, -0.4547132, 1, 1, 1, 1, 1,
-1.351029, 0.3869031, -1.998672, 0, 0, 1, 1, 1,
-1.345304, -0.9277059, -3.610752, 1, 0, 0, 1, 1,
-1.333806, 0.2677304, -2.040411, 1, 0, 0, 1, 1,
-1.332409, -1.044092, -1.846068, 1, 0, 0, 1, 1,
-1.318885, 2.490022, -1.26132, 1, 0, 0, 1, 1,
-1.313053, 0.2741591, -0.8590345, 1, 0, 0, 1, 1,
-1.304187, -0.7536333, -2.195455, 0, 0, 0, 1, 1,
-1.296878, 0.1339449, -1.737341, 0, 0, 0, 1, 1,
-1.296705, -1.2016, -2.897386, 0, 0, 0, 1, 1,
-1.293267, 1.109357, -1.431655, 0, 0, 0, 1, 1,
-1.287666, -0.9746396, -3.252123, 0, 0, 0, 1, 1,
-1.286167, -0.7083071, -1.188742, 0, 0, 0, 1, 1,
-1.279931, -0.3851866, -1.573605, 0, 0, 0, 1, 1,
-1.279134, 1.366824, 0.6708757, 1, 1, 1, 1, 1,
-1.2745, -0.275512, -3.143488, 1, 1, 1, 1, 1,
-1.271715, 1.912909, 0.7357646, 1, 1, 1, 1, 1,
-1.269138, 0.578371, -0.9637584, 1, 1, 1, 1, 1,
-1.267727, -0.2671022, -1.263386, 1, 1, 1, 1, 1,
-1.265633, 3.176877, -3.367052, 1, 1, 1, 1, 1,
-1.258067, -1.335859, -2.692835, 1, 1, 1, 1, 1,
-1.254367, 0.4972797, -0.3506078, 1, 1, 1, 1, 1,
-1.253503, -0.7193324, -2.733795, 1, 1, 1, 1, 1,
-1.253001, 0.2074692, -2.88403, 1, 1, 1, 1, 1,
-1.247615, -1.291562, -2.170382, 1, 1, 1, 1, 1,
-1.231097, 0.7250932, -1.721751, 1, 1, 1, 1, 1,
-1.231087, -0.2777197, -1.917788, 1, 1, 1, 1, 1,
-1.221559, -1.607948, -0.8093879, 1, 1, 1, 1, 1,
-1.219411, -0.7427463, -2.460372, 1, 1, 1, 1, 1,
-1.212386, 0.7520043, -0.6548236, 0, 0, 1, 1, 1,
-1.202465, 0.06340541, -2.669861, 1, 0, 0, 1, 1,
-1.193909, 0.042657, -2.387017, 1, 0, 0, 1, 1,
-1.188271, 1.129227, -0.3258339, 1, 0, 0, 1, 1,
-1.186882, 1.34204, -0.05291102, 1, 0, 0, 1, 1,
-1.186552, 0.6425573, -1.515364, 1, 0, 0, 1, 1,
-1.18288, 0.9891134, -0.06251655, 0, 0, 0, 1, 1,
-1.180142, 0.9758852, -1.970483, 0, 0, 0, 1, 1,
-1.170547, 0.3753694, -2.296416, 0, 0, 0, 1, 1,
-1.156785, 1.724359, -0.01933715, 0, 0, 0, 1, 1,
-1.156111, 0.2712922, -1.601407, 0, 0, 0, 1, 1,
-1.15588, -0.356875, -1.85455, 0, 0, 0, 1, 1,
-1.14647, -1.820136, -2.817677, 0, 0, 0, 1, 1,
-1.14302, -1.396085, -3.928444, 1, 1, 1, 1, 1,
-1.133496, 1.142382, -1.767374, 1, 1, 1, 1, 1,
-1.132726, 0.3230993, 0.02369132, 1, 1, 1, 1, 1,
-1.130883, 0.6486082, -1.28483, 1, 1, 1, 1, 1,
-1.12528, 1.463964, -2.247938, 1, 1, 1, 1, 1,
-1.122186, 2.238477, -0.07508805, 1, 1, 1, 1, 1,
-1.119837, -0.6845921, -1.16125, 1, 1, 1, 1, 1,
-1.079657, -1.001069, -3.02333, 1, 1, 1, 1, 1,
-1.070725, -0.6854097, -3.223668, 1, 1, 1, 1, 1,
-1.064471, -0.1273372, -1.934466, 1, 1, 1, 1, 1,
-1.060562, 2.292536, -0.8692113, 1, 1, 1, 1, 1,
-1.059845, 0.2713193, -2.104346, 1, 1, 1, 1, 1,
-1.056934, -0.7194579, -2.403185, 1, 1, 1, 1, 1,
-1.052871, -1.265049, -2.683268, 1, 1, 1, 1, 1,
-1.050087, -1.031466, -1.332091, 1, 1, 1, 1, 1,
-1.048962, -0.7065296, -1.027789, 0, 0, 1, 1, 1,
-1.034868, -0.221594, -1.562774, 1, 0, 0, 1, 1,
-1.027734, 0.3741676, -0.8263592, 1, 0, 0, 1, 1,
-1.024722, -0.8892471, -0.715056, 1, 0, 0, 1, 1,
-1.024697, -0.0702251, -1.436137, 1, 0, 0, 1, 1,
-1.019285, 0.01478622, -2.277992, 1, 0, 0, 1, 1,
-1.018566, 0.1722777, -3.02595, 0, 0, 0, 1, 1,
-1.017591, -1.206024, -3.108899, 0, 0, 0, 1, 1,
-1.015362, 1.414903, -0.2864189, 0, 0, 0, 1, 1,
-1.013152, 0.3252114, -1.035689, 0, 0, 0, 1, 1,
-1.002595, 1.10446, -1.891432, 0, 0, 0, 1, 1,
-1.002188, -0.2016026, -0.4581679, 0, 0, 0, 1, 1,
-0.9992457, -0.6232288, -2.938526, 0, 0, 0, 1, 1,
-0.9974189, -1.411424, -2.803759, 1, 1, 1, 1, 1,
-0.9943951, 0.9082062, -1.740462, 1, 1, 1, 1, 1,
-0.9904938, -0.4941537, -1.912775, 1, 1, 1, 1, 1,
-0.9865617, -1.030098, -0.6464642, 1, 1, 1, 1, 1,
-0.985444, 0.2499208, -0.974787, 1, 1, 1, 1, 1,
-0.9844468, -0.4562017, -0.6928788, 1, 1, 1, 1, 1,
-0.9679693, 1.033162, -1.310558, 1, 1, 1, 1, 1,
-0.967725, 0.9254568, 1.207636, 1, 1, 1, 1, 1,
-0.9660428, -1.564889, -2.787131, 1, 1, 1, 1, 1,
-0.960998, -2.606371, -1.702141, 1, 1, 1, 1, 1,
-0.9592636, 0.3922597, -1.019024, 1, 1, 1, 1, 1,
-0.9580652, 0.5539134, -2.012495, 1, 1, 1, 1, 1,
-0.9576149, 0.2478496, -1.595913, 1, 1, 1, 1, 1,
-0.9514948, 0.4957936, -1.079984, 1, 1, 1, 1, 1,
-0.9483659, -0.454106, -1.254148, 1, 1, 1, 1, 1,
-0.9476234, 2.746171, -0.4307618, 0, 0, 1, 1, 1,
-0.9472027, -0.0212761, -1.986469, 1, 0, 0, 1, 1,
-0.9468327, 1.529855, -0.7605503, 1, 0, 0, 1, 1,
-0.9415484, 0.2934653, -3.159328, 1, 0, 0, 1, 1,
-0.9383361, -1.622259, -3.115591, 1, 0, 0, 1, 1,
-0.9357023, -0.5102292, -4.48896, 1, 0, 0, 1, 1,
-0.9339201, -1.061275, -2.324575, 0, 0, 0, 1, 1,
-0.9331821, 1.00374, 0.6739048, 0, 0, 0, 1, 1,
-0.9283679, -0.07091483, -1.753224, 0, 0, 0, 1, 1,
-0.9279374, 1.832032, -0.4294927, 0, 0, 0, 1, 1,
-0.9247808, 0.2224697, -1.273162, 0, 0, 0, 1, 1,
-0.9138156, 0.1661894, -1.972229, 0, 0, 0, 1, 1,
-0.9106606, 1.571489, 0.2565458, 0, 0, 0, 1, 1,
-0.9095789, 1.62275, -0.9067609, 1, 1, 1, 1, 1,
-0.9095615, -0.07999245, -2.519754, 1, 1, 1, 1, 1,
-0.9029019, -0.1354705, -1.718797, 1, 1, 1, 1, 1,
-0.9012237, 2.268942, 0.504558, 1, 1, 1, 1, 1,
-0.8988274, -1.422778, -2.253562, 1, 1, 1, 1, 1,
-0.8974804, -1.092456, -2.837256, 1, 1, 1, 1, 1,
-0.8935455, -0.9136698, -3.700761, 1, 1, 1, 1, 1,
-0.8892043, -1.902727, -2.231644, 1, 1, 1, 1, 1,
-0.8890116, 0.5208055, -0.7971535, 1, 1, 1, 1, 1,
-0.8823119, -1.990341, -3.609588, 1, 1, 1, 1, 1,
-0.8805486, -1.171276, -3.144539, 1, 1, 1, 1, 1,
-0.8776773, -1.078479, -4.311704, 1, 1, 1, 1, 1,
-0.873454, 0.3576835, -0.4624458, 1, 1, 1, 1, 1,
-0.8733987, 0.6833403, -2.356571, 1, 1, 1, 1, 1,
-0.8722364, 0.4330488, -1.566745, 1, 1, 1, 1, 1,
-0.8679314, 0.09505393, -1.49481, 0, 0, 1, 1, 1,
-0.8654062, -1.082458, -3.476439, 1, 0, 0, 1, 1,
-0.8614382, 0.9068041, -0.8870206, 1, 0, 0, 1, 1,
-0.8550192, 0.7971749, -0.2862114, 1, 0, 0, 1, 1,
-0.8549928, 0.186371, -1.066664, 1, 0, 0, 1, 1,
-0.8515841, 0.219505, -0.810255, 1, 0, 0, 1, 1,
-0.8509219, 1.538459, -0.2103801, 0, 0, 0, 1, 1,
-0.8477409, -0.7133333, -3.01511, 0, 0, 0, 1, 1,
-0.8465083, -0.2088455, -3.408036, 0, 0, 0, 1, 1,
-0.8454835, -0.01168229, -0.3740265, 0, 0, 0, 1, 1,
-0.8289142, -0.1309817, -0.01940326, 0, 0, 0, 1, 1,
-0.8288733, 2.057328, -0.1317636, 0, 0, 0, 1, 1,
-0.8233446, 0.7884794, -2.626282, 0, 0, 0, 1, 1,
-0.8199012, 0.09958836, -1.943384, 1, 1, 1, 1, 1,
-0.8192364, -0.4772065, -0.3510738, 1, 1, 1, 1, 1,
-0.8189976, 0.3872608, -1.137747, 1, 1, 1, 1, 1,
-0.808758, 2.17768, -0.5120052, 1, 1, 1, 1, 1,
-0.8059759, -0.6864869, -3.485734, 1, 1, 1, 1, 1,
-0.8017001, -0.7273059, -1.993205, 1, 1, 1, 1, 1,
-0.7900098, -0.007984119, 0.8270648, 1, 1, 1, 1, 1,
-0.7827584, 0.1351254, -1.475517, 1, 1, 1, 1, 1,
-0.7784596, 0.8298023, -1.008193, 1, 1, 1, 1, 1,
-0.7767622, -0.3028687, -3.337162, 1, 1, 1, 1, 1,
-0.7716336, 0.9473357, -0.04223719, 1, 1, 1, 1, 1,
-0.7710115, -1.866581, -4.105402, 1, 1, 1, 1, 1,
-0.7466882, -0.6550841, -1.646032, 1, 1, 1, 1, 1,
-0.7463356, -0.2114805, -0.7632655, 1, 1, 1, 1, 1,
-0.7447907, 0.5809892, -0.6425624, 1, 1, 1, 1, 1,
-0.7385621, -0.8691546, -1.669263, 0, 0, 1, 1, 1,
-0.7376266, 0.2122823, -0.3602098, 1, 0, 0, 1, 1,
-0.7374898, -0.5883722, -2.182456, 1, 0, 0, 1, 1,
-0.7373908, -0.9265047, -4.326477, 1, 0, 0, 1, 1,
-0.7349585, -0.3715613, -0.5222613, 1, 0, 0, 1, 1,
-0.7245334, 1.32796, -1.199846, 1, 0, 0, 1, 1,
-0.7193877, -0.8991635, -2.413712, 0, 0, 0, 1, 1,
-0.7192269, 1.132788, 0.3510124, 0, 0, 0, 1, 1,
-0.7012312, -0.9531072, -1.984235, 0, 0, 0, 1, 1,
-0.6937732, 0.2730161, -1.96184, 0, 0, 0, 1, 1,
-0.6897373, 1.832082, 0.1124344, 0, 0, 0, 1, 1,
-0.6844609, -1.662445, -2.255782, 0, 0, 0, 1, 1,
-0.6813826, 0.6782907, -0.4909521, 0, 0, 0, 1, 1,
-0.6790603, -0.08039519, -2.806099, 1, 1, 1, 1, 1,
-0.6771113, 0.4323432, -1.202566, 1, 1, 1, 1, 1,
-0.6757863, -0.05130291, -2.632087, 1, 1, 1, 1, 1,
-0.6620538, 0.2870331, -0.7609435, 1, 1, 1, 1, 1,
-0.6611731, -0.08353813, -1.257855, 1, 1, 1, 1, 1,
-0.6569358, 0.2355851, -1.788233, 1, 1, 1, 1, 1,
-0.6568954, -1.733281, -3.988105, 1, 1, 1, 1, 1,
-0.6558636, 0.3198486, -0.2147968, 1, 1, 1, 1, 1,
-0.6548972, -0.3261469, -2.46583, 1, 1, 1, 1, 1,
-0.6516606, -0.129623, -1.111081, 1, 1, 1, 1, 1,
-0.6481494, -0.9010286, -3.093726, 1, 1, 1, 1, 1,
-0.6470934, -0.8740291, -2.859053, 1, 1, 1, 1, 1,
-0.6466761, -0.2986353, -2.491771, 1, 1, 1, 1, 1,
-0.6445624, -1.086846, -4.280973, 1, 1, 1, 1, 1,
-0.6436659, 0.4594664, -0.2995875, 1, 1, 1, 1, 1,
-0.6397372, 0.2057958, -0.9232021, 0, 0, 1, 1, 1,
-0.6363358, 1.446562, -0.6440341, 1, 0, 0, 1, 1,
-0.6357385, -0.1848607, 0.3274662, 1, 0, 0, 1, 1,
-0.6275756, 0.5013524, -2.53195, 1, 0, 0, 1, 1,
-0.626318, 0.09356423, -2.004489, 1, 0, 0, 1, 1,
-0.6251438, 0.4499055, 0.5414087, 1, 0, 0, 1, 1,
-0.6172576, -1.105469, -1.938827, 0, 0, 0, 1, 1,
-0.6170744, -0.9164343, -2.315187, 0, 0, 0, 1, 1,
-0.6136869, 0.4827186, -0.6595612, 0, 0, 0, 1, 1,
-0.5926423, 0.08724816, 0.2656392, 0, 0, 0, 1, 1,
-0.5883769, -0.1941863, -0.2907089, 0, 0, 0, 1, 1,
-0.585354, 0.7163191, -0.9954204, 0, 0, 0, 1, 1,
-0.5808043, 0.6770731, -0.7223676, 0, 0, 0, 1, 1,
-0.5796182, -0.5798939, -1.67776, 1, 1, 1, 1, 1,
-0.5739907, 0.5859491, -0.8660408, 1, 1, 1, 1, 1,
-0.5715941, -0.05209914, -1.542282, 1, 1, 1, 1, 1,
-0.5706714, -0.4575747, -1.801134, 1, 1, 1, 1, 1,
-0.5697796, -1.959557, -2.802586, 1, 1, 1, 1, 1,
-0.5671721, 0.3779771, -2.241064, 1, 1, 1, 1, 1,
-0.5669451, -0.5562736, -3.479774, 1, 1, 1, 1, 1,
-0.5660529, -0.8933048, -3.076617, 1, 1, 1, 1, 1,
-0.5634092, 0.2564897, -0.8553835, 1, 1, 1, 1, 1,
-0.5586741, -1.750586, -1.012945, 1, 1, 1, 1, 1,
-0.5574998, 0.7153882, -2.473326, 1, 1, 1, 1, 1,
-0.5552113, 0.191337, -2.083482, 1, 1, 1, 1, 1,
-0.5552064, 0.5929712, 0.2992068, 1, 1, 1, 1, 1,
-0.5537177, -0.1195466, -1.00382, 1, 1, 1, 1, 1,
-0.5526405, -0.5637174, -2.142656, 1, 1, 1, 1, 1,
-0.5522181, -0.6428084, -2.369802, 0, 0, 1, 1, 1,
-0.5481567, -0.5518243, -2.488065, 1, 0, 0, 1, 1,
-0.5464455, 0.520485, 0.8277392, 1, 0, 0, 1, 1,
-0.5463117, 0.37844, -0.4782337, 1, 0, 0, 1, 1,
-0.5447583, -0.3045706, -2.218392, 1, 0, 0, 1, 1,
-0.5433179, 0.8326678, -0.644129, 1, 0, 0, 1, 1,
-0.5417587, 1.653992, 0.8313093, 0, 0, 0, 1, 1,
-0.5405002, 0.251408, -2.324154, 0, 0, 0, 1, 1,
-0.539521, 1.012432, -2.666711, 0, 0, 0, 1, 1,
-0.5390723, 0.8231522, 0.6705958, 0, 0, 0, 1, 1,
-0.5348051, 1.088863, -0.262272, 0, 0, 0, 1, 1,
-0.5335923, 1.158359, 0.250044, 0, 0, 0, 1, 1,
-0.5271852, -2.350906, -3.680202, 0, 0, 0, 1, 1,
-0.5249149, 1.15903, -0.86292, 1, 1, 1, 1, 1,
-0.5200672, 0.7742639, -0.3573986, 1, 1, 1, 1, 1,
-0.5166733, -2.225622, -4.083108, 1, 1, 1, 1, 1,
-0.5138173, -2.376415, -2.94887, 1, 1, 1, 1, 1,
-0.5135709, -1.046152, -1.250513, 1, 1, 1, 1, 1,
-0.5126677, -0.62581, -0.2222595, 1, 1, 1, 1, 1,
-0.5123742, 1.845315, 1.84479, 1, 1, 1, 1, 1,
-0.5075647, -0.7168616, -3.107836, 1, 1, 1, 1, 1,
-0.5072755, 0.251104, -1.103635, 1, 1, 1, 1, 1,
-0.5022215, 0.01056828, -0.9110346, 1, 1, 1, 1, 1,
-0.5000552, -0.1450223, -1.541274, 1, 1, 1, 1, 1,
-0.49968, 1.701505, -0.01433709, 1, 1, 1, 1, 1,
-0.4992007, 0.8705862, -2.054663, 1, 1, 1, 1, 1,
-0.4949703, 0.601198, 0.2115852, 1, 1, 1, 1, 1,
-0.4893136, -0.4043353, -3.64641, 1, 1, 1, 1, 1,
-0.4880165, -0.09946913, -2.153526, 0, 0, 1, 1, 1,
-0.4878966, -0.02445379, -0.7706468, 1, 0, 0, 1, 1,
-0.487232, 0.2743416, 0.3419235, 1, 0, 0, 1, 1,
-0.4748715, -0.3149978, -1.658658, 1, 0, 0, 1, 1,
-0.4696642, 0.09987269, -2.107889, 1, 0, 0, 1, 1,
-0.4692874, 0.5622539, 0.8476816, 1, 0, 0, 1, 1,
-0.4671067, 0.5171221, 1.417933, 0, 0, 0, 1, 1,
-0.4566142, -0.1483378, 0.02813953, 0, 0, 0, 1, 1,
-0.4544072, 0.1498816, -1.118701, 0, 0, 0, 1, 1,
-0.453921, -0.6494707, -2.435314, 0, 0, 0, 1, 1,
-0.4491669, 1.19076, -0.3864844, 0, 0, 0, 1, 1,
-0.4482439, -0.272647, -1.125384, 0, 0, 0, 1, 1,
-0.4474785, 0.08755152, -2.623471, 0, 0, 0, 1, 1,
-0.4446198, -0.3470352, -1.917158, 1, 1, 1, 1, 1,
-0.4426018, -1.454574, -2.723459, 1, 1, 1, 1, 1,
-0.4396651, -0.2340045, -2.537078, 1, 1, 1, 1, 1,
-0.436193, -1.920887, -5.561672, 1, 1, 1, 1, 1,
-0.4328119, 0.5152425, -0.8751514, 1, 1, 1, 1, 1,
-0.4323946, 1.669133, 0.07077822, 1, 1, 1, 1, 1,
-0.4319085, 1.188921, 0.3278317, 1, 1, 1, 1, 1,
-0.4317971, 0.5618857, -0.111756, 1, 1, 1, 1, 1,
-0.4291334, 0.05289371, -1.826168, 1, 1, 1, 1, 1,
-0.4278997, -0.09056227, 0.1511363, 1, 1, 1, 1, 1,
-0.4275115, 0.9087262, -0.05137908, 1, 1, 1, 1, 1,
-0.4248694, 0.3266666, -0.8127299, 1, 1, 1, 1, 1,
-0.4126917, 0.05058149, -0.3935584, 1, 1, 1, 1, 1,
-0.4112621, 0.3260005, 0.4590364, 1, 1, 1, 1, 1,
-0.4102097, -0.1413943, -2.132592, 1, 1, 1, 1, 1,
-0.4038253, 0.9797129, 0.07871692, 0, 0, 1, 1, 1,
-0.4012341, 0.1397596, -0.6424057, 1, 0, 0, 1, 1,
-0.3978328, 0.9916742, 0.9011019, 1, 0, 0, 1, 1,
-0.3906232, -0.01132185, -2.303657, 1, 0, 0, 1, 1,
-0.385875, -0.5717162, -4.361933, 1, 0, 0, 1, 1,
-0.3807672, 1.568614, 0.8115481, 1, 0, 0, 1, 1,
-0.3794241, -1.032295, -3.146915, 0, 0, 0, 1, 1,
-0.3756016, -1.57955, -3.848316, 0, 0, 0, 1, 1,
-0.3740047, 1.595903, -2.088817, 0, 0, 0, 1, 1,
-0.3719618, 0.1234991, -2.532101, 0, 0, 0, 1, 1,
-0.3706261, -0.6003106, -2.91934, 0, 0, 0, 1, 1,
-0.3668156, -0.5516129, -0.9588821, 0, 0, 0, 1, 1,
-0.3651792, -0.370096, -2.196334, 0, 0, 0, 1, 1,
-0.3644413, 1.120092, 0.963152, 1, 1, 1, 1, 1,
-0.3615425, -1.345951, -1.639385, 1, 1, 1, 1, 1,
-0.3570434, -0.6645089, -3.097675, 1, 1, 1, 1, 1,
-0.3546505, 0.1279986, -2.210108, 1, 1, 1, 1, 1,
-0.354068, 0.4837526, -0.4244167, 1, 1, 1, 1, 1,
-0.3538142, 1.516828, -0.4254667, 1, 1, 1, 1, 1,
-0.3505765, 0.8226716, -2.181322, 1, 1, 1, 1, 1,
-0.3473178, 1.810297, -1.256568, 1, 1, 1, 1, 1,
-0.3463588, -0.05507131, -2.588065, 1, 1, 1, 1, 1,
-0.3462069, -1.511177, -1.969207, 1, 1, 1, 1, 1,
-0.3457482, -1.391461, -4.601237, 1, 1, 1, 1, 1,
-0.3442915, -0.0775496, -0.8986661, 1, 1, 1, 1, 1,
-0.3423589, 1.754228, 1.039891, 1, 1, 1, 1, 1,
-0.341157, -1.106526, -3.661951, 1, 1, 1, 1, 1,
-0.3409592, -0.9541874, -3.142784, 1, 1, 1, 1, 1,
-0.3391355, 0.2558113, 0.3952634, 0, 0, 1, 1, 1,
-0.334159, -0.2491758, -0.8781387, 1, 0, 0, 1, 1,
-0.3317771, 0.5997678, 0.4253148, 1, 0, 0, 1, 1,
-0.3298407, -1.350074, -3.553188, 1, 0, 0, 1, 1,
-0.3270322, -1.065381, -2.2901, 1, 0, 0, 1, 1,
-0.326995, -0.8737761, -2.218824, 1, 0, 0, 1, 1,
-0.3203206, -1.414506, -3.400317, 0, 0, 0, 1, 1,
-0.3150133, 0.4919813, -0.2215643, 0, 0, 0, 1, 1,
-0.3148446, -0.5740018, -2.689086, 0, 0, 0, 1, 1,
-0.3126493, 0.9227473, -1.276919, 0, 0, 0, 1, 1,
-0.3107604, 0.4502665, -0.290039, 0, 0, 0, 1, 1,
-0.3075813, 0.3553436, 1.385235, 0, 0, 0, 1, 1,
-0.30399, -0.8128882, -3.962176, 0, 0, 0, 1, 1,
-0.3034613, 0.4033768, -1.240543, 1, 1, 1, 1, 1,
-0.3025006, 0.5119033, 0.2941779, 1, 1, 1, 1, 1,
-0.3017717, 0.1558701, -0.8355197, 1, 1, 1, 1, 1,
-0.2993913, 0.2130663, -1.665914, 1, 1, 1, 1, 1,
-0.2940985, -0.9450928, -0.9649187, 1, 1, 1, 1, 1,
-0.291634, -1.428467, -1.081449, 1, 1, 1, 1, 1,
-0.2853861, -1.749876, -1.960426, 1, 1, 1, 1, 1,
-0.2853561, -1.079394, -2.104661, 1, 1, 1, 1, 1,
-0.2846487, -0.5142956, -1.889489, 1, 1, 1, 1, 1,
-0.279906, 0.5108652, -0.1027588, 1, 1, 1, 1, 1,
-0.2794399, -0.4318254, -3.003528, 1, 1, 1, 1, 1,
-0.2762462, -0.0585281, -2.314954, 1, 1, 1, 1, 1,
-0.2742681, 1.057808, -0.1329211, 1, 1, 1, 1, 1,
-0.2741995, -0.3245721, -2.261689, 1, 1, 1, 1, 1,
-0.2648611, -0.9895459, -3.269011, 1, 1, 1, 1, 1,
-0.264029, 1.882639, 1.714006, 0, 0, 1, 1, 1,
-0.2615517, 1.062005, -0.8779325, 1, 0, 0, 1, 1,
-0.2596658, -0.0636436, -0.5193992, 1, 0, 0, 1, 1,
-0.2593879, 0.121332, -0.7843019, 1, 0, 0, 1, 1,
-0.2592082, -0.8284668, -2.462452, 1, 0, 0, 1, 1,
-0.2577089, -1.269261, -2.658838, 1, 0, 0, 1, 1,
-0.2574968, 1.779146, -0.4552723, 0, 0, 0, 1, 1,
-0.2574518, 0.5214414, -0.7802582, 0, 0, 0, 1, 1,
-0.2548627, 1.776335, -0.7968647, 0, 0, 0, 1, 1,
-0.2545416, -0.2361061, -1.923323, 0, 0, 0, 1, 1,
-0.2483344, -1.218323, -4.384886, 0, 0, 0, 1, 1,
-0.2450824, 1.372849, 0.4629038, 0, 0, 0, 1, 1,
-0.241526, 0.3826509, -1.627936, 0, 0, 0, 1, 1,
-0.2408696, -2.263413, -3.120408, 1, 1, 1, 1, 1,
-0.239517, -1.446814, -4.979673, 1, 1, 1, 1, 1,
-0.238867, -0.8263387, -2.6308, 1, 1, 1, 1, 1,
-0.2378257, 1.081685, -1.74854, 1, 1, 1, 1, 1,
-0.2367168, -1.444451, -4.663877, 1, 1, 1, 1, 1,
-0.2365603, 1.426629, 1.063167, 1, 1, 1, 1, 1,
-0.2361781, -1.084888, -1.67293, 1, 1, 1, 1, 1,
-0.2341271, 0.2055296, -1.133197, 1, 1, 1, 1, 1,
-0.2294884, -0.3077802, -3.032125, 1, 1, 1, 1, 1,
-0.2291601, 0.8397095, -1.743112, 1, 1, 1, 1, 1,
-0.2280978, 0.1031571, -0.8926678, 1, 1, 1, 1, 1,
-0.2268422, 0.2832918, -0.4778734, 1, 1, 1, 1, 1,
-0.2261894, -0.278808, -2.377078, 1, 1, 1, 1, 1,
-0.2260299, 0.2797047, -0.925814, 1, 1, 1, 1, 1,
-0.2250885, 1.483979, -0.8757838, 1, 1, 1, 1, 1,
-0.2241733, -1.199082, -3.84233, 0, 0, 1, 1, 1,
-0.2238121, 0.1294565, -0.1999244, 1, 0, 0, 1, 1,
-0.2184498, -0.6284735, -1.667475, 1, 0, 0, 1, 1,
-0.218177, 0.2476484, -0.4493176, 1, 0, 0, 1, 1,
-0.2181709, 0.4564555, -1.391944, 1, 0, 0, 1, 1,
-0.2178712, 0.2615146, -0.9275492, 1, 0, 0, 1, 1,
-0.2168792, 0.9715689, 1.466375, 0, 0, 0, 1, 1,
-0.2124272, -0.87624, -2.151761, 0, 0, 0, 1, 1,
-0.2118122, 0.4163884, -1.86079, 0, 0, 0, 1, 1,
-0.2084586, -0.6970115, -2.288244, 0, 0, 0, 1, 1,
-0.2055851, -0.4878217, -3.172324, 0, 0, 0, 1, 1,
-0.2018282, -0.6382269, -1.409024, 0, 0, 0, 1, 1,
-0.2011546, 0.6503314, -0.4379746, 0, 0, 0, 1, 1,
-0.1942942, 0.529273, -1.320986, 1, 1, 1, 1, 1,
-0.1926639, 1.097352, 0.876124, 1, 1, 1, 1, 1,
-0.1924485, -2.115283, -2.690432, 1, 1, 1, 1, 1,
-0.1833338, 0.343594, -1.904964, 1, 1, 1, 1, 1,
-0.1830547, -0.1615257, -4.739638, 1, 1, 1, 1, 1,
-0.1805657, -0.3193551, -5.319204, 1, 1, 1, 1, 1,
-0.1790114, -0.2347626, -3.200333, 1, 1, 1, 1, 1,
-0.1785028, -0.3888009, -2.678013, 1, 1, 1, 1, 1,
-0.1778235, -0.2100825, -2.584292, 1, 1, 1, 1, 1,
-0.1764748, 0.1873346, -0.08534575, 1, 1, 1, 1, 1,
-0.174073, -0.4514494, -1.460544, 1, 1, 1, 1, 1,
-0.1717593, -0.03029753, -2.545807, 1, 1, 1, 1, 1,
-0.171315, 0.1735702, -1.79184, 1, 1, 1, 1, 1,
-0.1706493, 0.4086994, 1.272823, 1, 1, 1, 1, 1,
-0.1692949, 0.1449508, -0.4096956, 1, 1, 1, 1, 1,
-0.1661139, -0.310294, -3.737198, 0, 0, 1, 1, 1,
-0.1648421, -0.9896827, -3.520247, 1, 0, 0, 1, 1,
-0.1637405, 1.093686, -0.9236371, 1, 0, 0, 1, 1,
-0.1635202, -0.1956018, -1.796224, 1, 0, 0, 1, 1,
-0.15878, -0.1118128, -0.8678624, 1, 0, 0, 1, 1,
-0.1559067, -1.235913, -3.784755, 1, 0, 0, 1, 1,
-0.1557686, 0.02261743, 0.140317, 0, 0, 0, 1, 1,
-0.1539215, 0.7126285, -0.3722319, 0, 0, 0, 1, 1,
-0.1532452, 0.6751941, 0.2727053, 0, 0, 0, 1, 1,
-0.1509277, 0.2156607, -1.220676, 0, 0, 0, 1, 1,
-0.1491671, 0.1935532, -0.432995, 0, 0, 0, 1, 1,
-0.1404901, -0.8042088, -2.044179, 0, 0, 0, 1, 1,
-0.1396461, 0.00777154, 0.8975406, 0, 0, 0, 1, 1,
-0.139433, 0.6160145, -0.6845915, 1, 1, 1, 1, 1,
-0.1331631, 0.8059762, -1.241555, 1, 1, 1, 1, 1,
-0.1324716, 0.3520744, -1.298434, 1, 1, 1, 1, 1,
-0.1294102, -1.201141, -4.886345, 1, 1, 1, 1, 1,
-0.1278137, 0.2678701, 0.01081637, 1, 1, 1, 1, 1,
-0.1245516, 1.892315, 2.093772, 1, 1, 1, 1, 1,
-0.1230053, 0.5187554, -1.746729, 1, 1, 1, 1, 1,
-0.1176165, 1.412147, -0.8966595, 1, 1, 1, 1, 1,
-0.1164409, -0.7326741, -3.524658, 1, 1, 1, 1, 1,
-0.1145224, 1.262631, 0.1670558, 1, 1, 1, 1, 1,
-0.1136898, 1.313607, 1.382975, 1, 1, 1, 1, 1,
-0.107732, 0.1669954, -0.4070202, 1, 1, 1, 1, 1,
-0.1074927, -0.08494827, -1.493044, 1, 1, 1, 1, 1,
-0.09854848, -0.6335263, -2.07783, 1, 1, 1, 1, 1,
-0.09622408, -0.07869199, -1.216926, 1, 1, 1, 1, 1,
-0.0946181, -1.723833, -3.335746, 0, 0, 1, 1, 1,
-0.09425239, 0.1520204, -1.326357, 1, 0, 0, 1, 1,
-0.09266971, -1.796225, -3.563426, 1, 0, 0, 1, 1,
-0.0918772, -1.233927, -3.537271, 1, 0, 0, 1, 1,
-0.09154063, -0.294874, -2.047167, 1, 0, 0, 1, 1,
-0.09129747, 1.701939, 0.3418564, 1, 0, 0, 1, 1,
-0.09100447, 0.4268182, 0.1236678, 0, 0, 0, 1, 1,
-0.08971647, 1.167393, -2.141312, 0, 0, 0, 1, 1,
-0.08895498, -0.551295, -1.7102, 0, 0, 0, 1, 1,
-0.08679578, -0.45324, -4.466591, 0, 0, 0, 1, 1,
-0.08506607, -0.8101777, -5.705903, 0, 0, 0, 1, 1,
-0.08498689, 1.047931, 1.376274, 0, 0, 0, 1, 1,
-0.08298218, -0.5112751, -3.114382, 0, 0, 0, 1, 1,
-0.06644876, 0.9563484, -0.9140094, 1, 1, 1, 1, 1,
-0.06633724, 1.157936, -0.4428768, 1, 1, 1, 1, 1,
-0.06496487, 1.369478, -0.1943581, 1, 1, 1, 1, 1,
-0.06476874, 0.2362221, -0.4964699, 1, 1, 1, 1, 1,
-0.06079054, 1.545414, 0.9768823, 1, 1, 1, 1, 1,
-0.05947591, 0.7367391, 1.203195, 1, 1, 1, 1, 1,
-0.05689711, -1.268291, -1.265765, 1, 1, 1, 1, 1,
-0.04877852, -0.3277976, -2.643809, 1, 1, 1, 1, 1,
-0.04691245, 0.8450389, -0.4559904, 1, 1, 1, 1, 1,
-0.04661882, -1.039619, -2.989317, 1, 1, 1, 1, 1,
-0.0464349, -0.8579597, -4.553693, 1, 1, 1, 1, 1,
-0.04338727, -0.2634204, -2.977505, 1, 1, 1, 1, 1,
-0.04190569, -0.2138894, -1.5644, 1, 1, 1, 1, 1,
-0.03714938, -1.550646, -4.629572, 1, 1, 1, 1, 1,
-0.0360389, 0.2913243, 1.103927, 1, 1, 1, 1, 1,
-0.0346372, -0.5399943, -2.088748, 0, 0, 1, 1, 1,
-0.03008855, 0.5431653, 2.225566, 1, 0, 0, 1, 1,
-0.02518047, -0.1847359, -3.033653, 1, 0, 0, 1, 1,
-0.02413717, -0.4604354, -3.288736, 1, 0, 0, 1, 1,
-0.02395597, 0.2634079, -1.361706, 1, 0, 0, 1, 1,
-0.02331199, 1.498883, 0.4738923, 1, 0, 0, 1, 1,
-0.02318707, 0.2432933, -1.016966, 0, 0, 0, 1, 1,
-0.01789021, -0.3182411, -2.005284, 0, 0, 0, 1, 1,
-0.01781846, -1.382702, -1.402115, 0, 0, 0, 1, 1,
-0.01517485, 1.547501, -0.7650226, 0, 0, 0, 1, 1,
-0.009224365, -0.8926069, -5.220368, 0, 0, 0, 1, 1,
-0.007845706, 0.8876719, -0.489414, 0, 0, 0, 1, 1,
-0.007073984, -1.787671, -2.074569, 0, 0, 0, 1, 1,
-0.005500238, -1.981656, -3.384949, 1, 1, 1, 1, 1,
-0.0009230938, 0.0566368, -0.9671477, 1, 1, 1, 1, 1,
0.006508162, -0.4326285, 4.044955, 1, 1, 1, 1, 1,
0.008237927, -0.4535859, 4.553595, 1, 1, 1, 1, 1,
0.01161597, -0.8537612, 3.978402, 1, 1, 1, 1, 1,
0.01628465, 0.658172, -1.461419, 1, 1, 1, 1, 1,
0.01913909, -0.2377761, 4.179409, 1, 1, 1, 1, 1,
0.01965483, 1.028549, 1.634563, 1, 1, 1, 1, 1,
0.02401412, 0.5874745, 2.254786, 1, 1, 1, 1, 1,
0.02819291, 0.7144555, 0.5720203, 1, 1, 1, 1, 1,
0.0310105, 0.3656554, -0.01834731, 1, 1, 1, 1, 1,
0.03206916, 0.5969163, -0.3204089, 1, 1, 1, 1, 1,
0.03306017, -1.538979, 2.036834, 1, 1, 1, 1, 1,
0.03755038, -0.3747524, 4.800636, 1, 1, 1, 1, 1,
0.05250511, 0.9214845, 0.7715806, 1, 1, 1, 1, 1,
0.05350319, 0.3160309, -0.01559622, 0, 0, 1, 1, 1,
0.05389418, 0.2960137, 0.6850299, 1, 0, 0, 1, 1,
0.05426671, -1.843521, 3.517652, 1, 0, 0, 1, 1,
0.05642101, -2.142441, 3.085653, 1, 0, 0, 1, 1,
0.06203284, -0.7663086, 4.465567, 1, 0, 0, 1, 1,
0.06689257, -0.2620988, 3.604423, 1, 0, 0, 1, 1,
0.07595605, 0.5193287, 2.216813, 0, 0, 0, 1, 1,
0.07808796, 0.4912255, -0.4836899, 0, 0, 0, 1, 1,
0.08673414, 0.8724026, -0.1135066, 0, 0, 0, 1, 1,
0.08695495, 0.645056, 1.193437, 0, 0, 0, 1, 1,
0.08816868, 0.3922048, 1.834, 0, 0, 0, 1, 1,
0.08943814, 0.8202177, -0.04747206, 0, 0, 0, 1, 1,
0.0909304, 1.326963, 0.1597183, 0, 0, 0, 1, 1,
0.09094734, 1.221679, 0.5674496, 1, 1, 1, 1, 1,
0.09130165, 1.317169, -0.1999609, 1, 1, 1, 1, 1,
0.09154045, 1.53466, -0.8198758, 1, 1, 1, 1, 1,
0.09253633, -0.01832652, 2.692057, 1, 1, 1, 1, 1,
0.09500176, 1.418096, 0.702929, 1, 1, 1, 1, 1,
0.09793297, 1.139034, -0.5880528, 1, 1, 1, 1, 1,
0.09826969, 0.7224343, 0.1296561, 1, 1, 1, 1, 1,
0.09914087, -0.7563878, 1.240273, 1, 1, 1, 1, 1,
0.1020924, -0.3524023, 3.725632, 1, 1, 1, 1, 1,
0.1062834, -1.956041, 1.31734, 1, 1, 1, 1, 1,
0.1098599, -0.9104686, 2.405634, 1, 1, 1, 1, 1,
0.112473, 0.9911753, 0.2698938, 1, 1, 1, 1, 1,
0.1164233, 1.106255, 0.2106169, 1, 1, 1, 1, 1,
0.1281804, 0.5706128, -0.5192643, 1, 1, 1, 1, 1,
0.128603, -0.3453242, 3.067632, 1, 1, 1, 1, 1,
0.129197, 0.4627548, 0.5796738, 0, 0, 1, 1, 1,
0.1306295, -0.2879522, 2.677502, 1, 0, 0, 1, 1,
0.1311161, 0.3633429, -0.05474928, 1, 0, 0, 1, 1,
0.1330564, -1.137947, 2.214346, 1, 0, 0, 1, 1,
0.1336103, -0.8945299, 2.966293, 1, 0, 0, 1, 1,
0.1341485, -1.009882, 2.95094, 1, 0, 0, 1, 1,
0.137732, -0.5814143, 2.470558, 0, 0, 0, 1, 1,
0.1378109, 0.7998497, 0.2556202, 0, 0, 0, 1, 1,
0.1386725, 0.8539832, 0.3009061, 0, 0, 0, 1, 1,
0.1408902, -0.4888377, 2.606457, 0, 0, 0, 1, 1,
0.1426565, 0.3270546, 1.785836, 0, 0, 0, 1, 1,
0.1438521, 0.3504545, 0.2525147, 0, 0, 0, 1, 1,
0.1481036, -0.3927578, 1.358248, 0, 0, 0, 1, 1,
0.1490193, -1.548157, 3.180275, 1, 1, 1, 1, 1,
0.155269, 0.1487184, 0.4853434, 1, 1, 1, 1, 1,
0.1557592, -0.413522, 2.142754, 1, 1, 1, 1, 1,
0.1570598, 0.3862471, 0.6078911, 1, 1, 1, 1, 1,
0.1582233, -0.9384912, 1.988417, 1, 1, 1, 1, 1,
0.1589287, -0.2912067, 2.932159, 1, 1, 1, 1, 1,
0.1630534, -1.338864, 3.290274, 1, 1, 1, 1, 1,
0.165267, 0.556391, 0.2793048, 1, 1, 1, 1, 1,
0.1705806, -0.3439288, 2.011725, 1, 1, 1, 1, 1,
0.1724809, -0.05854913, 0.9367474, 1, 1, 1, 1, 1,
0.1732527, 0.7836528, 2.01314, 1, 1, 1, 1, 1,
0.1752204, 0.03038415, 2.260369, 1, 1, 1, 1, 1,
0.1769555, 1.288411, 0.9185611, 1, 1, 1, 1, 1,
0.1778294, -0.5011954, 2.507362, 1, 1, 1, 1, 1,
0.1785149, -0.6571819, 2.769166, 1, 1, 1, 1, 1,
0.1787209, 0.2847767, 2.452448, 0, 0, 1, 1, 1,
0.18006, -0.4433067, 2.766042, 1, 0, 0, 1, 1,
0.1830354, -0.7186034, 2.964253, 1, 0, 0, 1, 1,
0.1836372, 0.01809665, 1.305204, 1, 0, 0, 1, 1,
0.1859482, 0.4535346, 0.3503767, 1, 0, 0, 1, 1,
0.1890417, 0.03659284, 0.230848, 1, 0, 0, 1, 1,
0.1894952, 0.05216908, 2.793037, 0, 0, 0, 1, 1,
0.1913759, 0.2914938, 0.8306025, 0, 0, 0, 1, 1,
0.1923587, 0.7903052, 1.437104, 0, 0, 0, 1, 1,
0.1930658, -0.6229871, 2.549021, 0, 0, 0, 1, 1,
0.1939127, 0.302404, 1.111102, 0, 0, 0, 1, 1,
0.1971344, -0.5080874, 1.822638, 0, 0, 0, 1, 1,
0.2021144, 0.8733379, 0.556645, 0, 0, 0, 1, 1,
0.2022658, 0.3344158, -0.5454071, 1, 1, 1, 1, 1,
0.2075147, -0.8584276, 2.042987, 1, 1, 1, 1, 1,
0.2091544, -1.020476, 4.099125, 1, 1, 1, 1, 1,
0.2132957, -0.6299936, 2.326222, 1, 1, 1, 1, 1,
0.2143247, 0.06472555, 1.41441, 1, 1, 1, 1, 1,
0.2278253, 0.9940864, 1.248757, 1, 1, 1, 1, 1,
0.2285527, -0.9988387, 1.560204, 1, 1, 1, 1, 1,
0.2326212, 0.9951328, 1.727414, 1, 1, 1, 1, 1,
0.2402543, -0.6511194, 3.31871, 1, 1, 1, 1, 1,
0.2425689, -0.7008276, 1.954251, 1, 1, 1, 1, 1,
0.2435948, 0.05605919, -0.2944561, 1, 1, 1, 1, 1,
0.2495131, -1.552187, 2.714854, 1, 1, 1, 1, 1,
0.2520896, -1.366379, 2.597628, 1, 1, 1, 1, 1,
0.2523097, 0.4233021, 2.149968, 1, 1, 1, 1, 1,
0.2539309, -0.1058066, 0.1041789, 1, 1, 1, 1, 1,
0.2539379, -0.7559199, 3.727325, 0, 0, 1, 1, 1,
0.2540988, -0.2811549, 2.922697, 1, 0, 0, 1, 1,
0.256275, -1.522255, 2.509851, 1, 0, 0, 1, 1,
0.2574922, 0.5762971, -0.6214804, 1, 0, 0, 1, 1,
0.2591632, -2.086601, 2.881436, 1, 0, 0, 1, 1,
0.2601357, -0.8373445, 1.607788, 1, 0, 0, 1, 1,
0.2678487, 0.7180188, 0.2089168, 0, 0, 0, 1, 1,
0.2725008, 0.4650156, 1.355036, 0, 0, 0, 1, 1,
0.2725271, 0.7309178, 0.3362871, 0, 0, 0, 1, 1,
0.2734544, 1.467495, -0.3930472, 0, 0, 0, 1, 1,
0.2740668, 1.108531, 0.4631228, 0, 0, 0, 1, 1,
0.2766467, 0.9069287, 1.239386, 0, 0, 0, 1, 1,
0.278752, -0.7565418, 3.709054, 0, 0, 0, 1, 1,
0.2804279, 0.7018703, -2.005674, 1, 1, 1, 1, 1,
0.2862723, 0.03528913, 1.183322, 1, 1, 1, 1, 1,
0.2925633, 1.49293, 0.06786545, 1, 1, 1, 1, 1,
0.2936406, -0.3273287, 1.773918, 1, 1, 1, 1, 1,
0.2959719, 0.367972, -1.206814, 1, 1, 1, 1, 1,
0.2977647, -1.547345, 2.378021, 1, 1, 1, 1, 1,
0.2978148, -0.3529057, -0.1130727, 1, 1, 1, 1, 1,
0.3015735, 0.5591387, 0.7506186, 1, 1, 1, 1, 1,
0.3023151, 0.4935746, 0.8714921, 1, 1, 1, 1, 1,
0.304348, -0.2954054, 2.280906, 1, 1, 1, 1, 1,
0.3063219, 0.08030792, 1.085777, 1, 1, 1, 1, 1,
0.3121621, 1.327774, -0.5899798, 1, 1, 1, 1, 1,
0.3143666, 0.4724499, 0.3341945, 1, 1, 1, 1, 1,
0.3157572, 0.9496917, -0.129943, 1, 1, 1, 1, 1,
0.3175466, -0.2178684, 2.48842, 1, 1, 1, 1, 1,
0.320782, 1.25677, 1.262454, 0, 0, 1, 1, 1,
0.3219578, 0.6430931, -0.3690311, 1, 0, 0, 1, 1,
0.3233868, 1.374717, -1.358082, 1, 0, 0, 1, 1,
0.3236696, -0.4812447, 3.895884, 1, 0, 0, 1, 1,
0.3284551, -0.5996599, 4.235664, 1, 0, 0, 1, 1,
0.3297518, 1.287574, 0.8650336, 1, 0, 0, 1, 1,
0.3301786, 0.05505192, 0.8866164, 0, 0, 0, 1, 1,
0.3307534, -1.400902, 3.680771, 0, 0, 0, 1, 1,
0.3308713, -0.1951944, 3.520652, 0, 0, 0, 1, 1,
0.3361219, -0.8852457, 1.369048, 0, 0, 0, 1, 1,
0.3433604, -0.2214431, 1.178062, 0, 0, 0, 1, 1,
0.3434206, -0.3081276, 4.138684, 0, 0, 0, 1, 1,
0.3436405, -0.7435979, 1.93171, 0, 0, 0, 1, 1,
0.3442451, -0.01858029, 0.08063727, 1, 1, 1, 1, 1,
0.3461241, -1.256634, 3.769219, 1, 1, 1, 1, 1,
0.3505232, 0.2174924, 0.5583982, 1, 1, 1, 1, 1,
0.3662911, 0.8508348, -0.8979545, 1, 1, 1, 1, 1,
0.3682455, -0.04492514, 1.198901, 1, 1, 1, 1, 1,
0.3731284, -0.01646473, 0.4633251, 1, 1, 1, 1, 1,
0.3747796, -1.373981, 1.6559, 1, 1, 1, 1, 1,
0.3769102, 0.00581349, 0.5290712, 1, 1, 1, 1, 1,
0.378525, 0.6576512, 1.196755, 1, 1, 1, 1, 1,
0.3787661, -1.319421, 4.637024, 1, 1, 1, 1, 1,
0.3820704, 0.06649165, 1.88109, 1, 1, 1, 1, 1,
0.3849183, 0.03466164, 3.654962, 1, 1, 1, 1, 1,
0.3853361, -0.2419392, 3.291147, 1, 1, 1, 1, 1,
0.3903614, 0.3637769, -1.374535, 1, 1, 1, 1, 1,
0.3931337, -0.1700431, 2.860769, 1, 1, 1, 1, 1,
0.3998789, -0.1963274, 2.529383, 0, 0, 1, 1, 1,
0.4047849, -0.8391188, 2.279257, 1, 0, 0, 1, 1,
0.4191293, 1.002416, -0.7462742, 1, 0, 0, 1, 1,
0.420159, -0.2342339, 1.892262, 1, 0, 0, 1, 1,
0.4266849, -1.423238, 2.585061, 1, 0, 0, 1, 1,
0.4275428, 0.202731, 2.736459, 1, 0, 0, 1, 1,
0.4297276, 2.36172, -2.202596, 0, 0, 0, 1, 1,
0.4300581, 0.9071875, 0.781776, 0, 0, 0, 1, 1,
0.4336561, -0.8566926, 1.262417, 0, 0, 0, 1, 1,
0.4344283, -0.03625172, 2.158456, 0, 0, 0, 1, 1,
0.4351777, -1.498305, 3.814671, 0, 0, 0, 1, 1,
0.435735, 0.8426967, 1.555616, 0, 0, 0, 1, 1,
0.4402257, 1.732781, 0.9911407, 0, 0, 0, 1, 1,
0.4436066, -0.7487555, -0.08189905, 1, 1, 1, 1, 1,
0.4461879, -0.6062865, 0.6323225, 1, 1, 1, 1, 1,
0.4526992, -0.2169576, 1.577721, 1, 1, 1, 1, 1,
0.4533341, -1.917101, 4.078063, 1, 1, 1, 1, 1,
0.457568, 0.7722181, -1.817724, 1, 1, 1, 1, 1,
0.4580225, 0.9393833, 0.542344, 1, 1, 1, 1, 1,
0.4608762, -1.18318, 5.254044, 1, 1, 1, 1, 1,
0.4629606, -0.68909, 1.462956, 1, 1, 1, 1, 1,
0.4672757, 0.7770311, -0.7080963, 1, 1, 1, 1, 1,
0.4742285, -0.9916666, 2.259068, 1, 1, 1, 1, 1,
0.4787273, -1.67213, 4.086776, 1, 1, 1, 1, 1,
0.4821891, -0.2564114, 4.350186, 1, 1, 1, 1, 1,
0.4858815, 1.926887, -0.1451667, 1, 1, 1, 1, 1,
0.4876501, -0.5997384, 1.607603, 1, 1, 1, 1, 1,
0.4900636, -1.583233, 2.522933, 1, 1, 1, 1, 1,
0.5106518, -0.2254768, 3.266456, 0, 0, 1, 1, 1,
0.5129396, 0.2106484, 0.5742014, 1, 0, 0, 1, 1,
0.5133398, -1.187739, 3.943373, 1, 0, 0, 1, 1,
0.5175115, 1.052971, 1.186811, 1, 0, 0, 1, 1,
0.519116, -0.04327396, 1.842114, 1, 0, 0, 1, 1,
0.5204527, 1.629222, 0.06036553, 1, 0, 0, 1, 1,
0.5208276, 0.7989672, -0.658812, 0, 0, 0, 1, 1,
0.5223613, -0.7943746, 1.601, 0, 0, 0, 1, 1,
0.5242581, -0.299516, 2.42352, 0, 0, 0, 1, 1,
0.5291377, -1.280037, 2.20119, 0, 0, 0, 1, 1,
0.5371632, -0.8807177, 2.273755, 0, 0, 0, 1, 1,
0.5383096, 0.3283009, 0.7810569, 0, 0, 0, 1, 1,
0.5386989, 1.877378, -1.453394, 0, 0, 0, 1, 1,
0.5411116, 1.487618, 0.1464146, 1, 1, 1, 1, 1,
0.5577888, -0.3376154, 1.906132, 1, 1, 1, 1, 1,
0.5631868, 0.6062236, 1.803765, 1, 1, 1, 1, 1,
0.5649831, 0.06323623, 1.525384, 1, 1, 1, 1, 1,
0.565822, -0.407959, 3.049394, 1, 1, 1, 1, 1,
0.5658401, -0.4138852, 2.027412, 1, 1, 1, 1, 1,
0.5751215, -1.044915, 3.581735, 1, 1, 1, 1, 1,
0.5828297, -0.7956018, 3.011246, 1, 1, 1, 1, 1,
0.5831103, 0.1436271, 2.578959, 1, 1, 1, 1, 1,
0.591108, -0.8764351, 2.1259, 1, 1, 1, 1, 1,
0.5929327, 0.7237941, 1.334618, 1, 1, 1, 1, 1,
0.5935776, 1.18762, 2.061768, 1, 1, 1, 1, 1,
0.5976524, -0.2645754, 2.539964, 1, 1, 1, 1, 1,
0.5998101, 3.080912, -1.05507, 1, 1, 1, 1, 1,
0.6034067, -2.035561, 2.404939, 1, 1, 1, 1, 1,
0.6049252, 0.9798164, 0.877239, 0, 0, 1, 1, 1,
0.6060313, 0.3411135, 1.695213, 1, 0, 0, 1, 1,
0.6068285, 0.07405315, -0.5788796, 1, 0, 0, 1, 1,
0.6090905, -0.1104636, 3.189842, 1, 0, 0, 1, 1,
0.6129133, 1.212837, 1.541577, 1, 0, 0, 1, 1,
0.6129885, 1.328818, -1.064731, 1, 0, 0, 1, 1,
0.6148143, -0.3830206, 2.8146, 0, 0, 0, 1, 1,
0.6150398, 2.00314, 0.04416933, 0, 0, 0, 1, 1,
0.6175511, 0.634477, 0.08038113, 0, 0, 0, 1, 1,
0.6182442, 0.3750485, 0.01368731, 0, 0, 0, 1, 1,
0.6228852, -1.509487, 2.530535, 0, 0, 0, 1, 1,
0.6232923, -0.2647404, 2.788492, 0, 0, 0, 1, 1,
0.6236553, 1.348337, -0.7091076, 0, 0, 0, 1, 1,
0.6241348, 0.8368567, 1.761432, 1, 1, 1, 1, 1,
0.6332598, -1.397133, 3.173087, 1, 1, 1, 1, 1,
0.6341347, -0.3765074, 2.195451, 1, 1, 1, 1, 1,
0.6357074, 0.08665163, 2.295421, 1, 1, 1, 1, 1,
0.6357323, -1.199607, 2.888912, 1, 1, 1, 1, 1,
0.6386339, 0.2776835, 1.962685, 1, 1, 1, 1, 1,
0.6406196, -0.004565945, 2.240834, 1, 1, 1, 1, 1,
0.6504752, -2.427849, 2.475701, 1, 1, 1, 1, 1,
0.6528028, -2.825929, 4.444081, 1, 1, 1, 1, 1,
0.654847, 0.8737883, 0.0724471, 1, 1, 1, 1, 1,
0.660754, 1.479287, 1.093257, 1, 1, 1, 1, 1,
0.6671896, 1.766978, -0.1520083, 1, 1, 1, 1, 1,
0.6714199, -0.5860677, 2.485413, 1, 1, 1, 1, 1,
0.6821469, 0.9911913, -0.6438737, 1, 1, 1, 1, 1,
0.6847071, 0.197668, 0.3128932, 1, 1, 1, 1, 1,
0.68613, -0.6970523, 2.79197, 0, 0, 1, 1, 1,
0.6918647, -0.3834881, 3.58374, 1, 0, 0, 1, 1,
0.6957377, -0.4840836, 2.063274, 1, 0, 0, 1, 1,
0.699891, 0.403247, 1.205036, 1, 0, 0, 1, 1,
0.7014513, -0.1089104, 1.182324, 1, 0, 0, 1, 1,
0.7014726, 1.517776, -1.010967, 1, 0, 0, 1, 1,
0.7046439, -3.204755, 3.838734, 0, 0, 0, 1, 1,
0.7098834, -0.4943116, 4.325035, 0, 0, 0, 1, 1,
0.716975, 0.7403777, 1.542453, 0, 0, 0, 1, 1,
0.7211218, 1.097199, 0.8055566, 0, 0, 0, 1, 1,
0.7217225, -0.07389125, 2.589979, 0, 0, 0, 1, 1,
0.7295835, -0.4535642, 3.839252, 0, 0, 0, 1, 1,
0.7307034, -1.476762, 3.914354, 0, 0, 0, 1, 1,
0.7337628, -0.7790358, 3.003411, 1, 1, 1, 1, 1,
0.736982, 0.5864697, 0.3657079, 1, 1, 1, 1, 1,
0.743117, 0.2837512, -0.4232136, 1, 1, 1, 1, 1,
0.7438986, 0.6588264, 1.211658, 1, 1, 1, 1, 1,
0.7500724, 0.7176148, 1.08271, 1, 1, 1, 1, 1,
0.7526646, 0.7239406, 1.020489, 1, 1, 1, 1, 1,
0.7529165, -0.8605127, 3.293594, 1, 1, 1, 1, 1,
0.7607838, -0.1350537, 2.735979, 1, 1, 1, 1, 1,
0.7631978, 2.046258, 0.7155665, 1, 1, 1, 1, 1,
0.7680473, 0.5774686, -1.003335, 1, 1, 1, 1, 1,
0.7724053, 0.8149228, 2.108652, 1, 1, 1, 1, 1,
0.7744493, 2.874938, 0.4427978, 1, 1, 1, 1, 1,
0.7767172, -0.2945644, 2.315557, 1, 1, 1, 1, 1,
0.7777439, 0.3223866, 1.293146, 1, 1, 1, 1, 1,
0.7883618, 0.8716212, -0.1197157, 1, 1, 1, 1, 1,
0.7903643, 1.000517, 0.9977454, 0, 0, 1, 1, 1,
0.7903898, -0.7251294, 1.331757, 1, 0, 0, 1, 1,
0.7908816, -0.02618975, 2.474186, 1, 0, 0, 1, 1,
0.7921435, -0.708946, -0.02537325, 1, 0, 0, 1, 1,
0.7976182, 0.1541687, 0.791364, 1, 0, 0, 1, 1,
0.8033359, 0.2638283, 2.375436, 1, 0, 0, 1, 1,
0.8099939, 1.326321, 1.487856, 0, 0, 0, 1, 1,
0.8122806, 1.289233, -0.2723553, 0, 0, 0, 1, 1,
0.8160781, -1.121683, 3.257609, 0, 0, 0, 1, 1,
0.8170545, -0.1682322, 1.050912, 0, 0, 0, 1, 1,
0.8181837, 0.2536918, 1.567588, 0, 0, 0, 1, 1,
0.8232216, -0.393944, 2.551127, 0, 0, 0, 1, 1,
0.8279849, 1.207476, 0.6367062, 0, 0, 0, 1, 1,
0.8288354, -0.3986107, 1.220095, 1, 1, 1, 1, 1,
0.8292285, -2.423462, 3.196398, 1, 1, 1, 1, 1,
0.8445084, 1.366174, 0.2306293, 1, 1, 1, 1, 1,
0.8490622, -0.05959668, 0.9363829, 1, 1, 1, 1, 1,
0.8513471, 0.02422747, 1.312414, 1, 1, 1, 1, 1,
0.8537761, 0.4425106, 0.1502213, 1, 1, 1, 1, 1,
0.8585806, -0.7922823, 0.6407573, 1, 1, 1, 1, 1,
0.8629121, 1.170594, -1.624782, 1, 1, 1, 1, 1,
0.8646266, 0.1439122, 1.828512, 1, 1, 1, 1, 1,
0.8685637, -0.6437926, 4.525482, 1, 1, 1, 1, 1,
0.8723825, -0.4478099, 2.646245, 1, 1, 1, 1, 1,
0.8725059, -0.8522399, 2.055094, 1, 1, 1, 1, 1,
0.8793674, -0.6363324, 1.424712, 1, 1, 1, 1, 1,
0.8798596, 1.436869, 0.6763237, 1, 1, 1, 1, 1,
0.8830627, 1.109778, -0.4628043, 1, 1, 1, 1, 1,
0.8835778, 0.08780523, 0.2676126, 0, 0, 1, 1, 1,
0.8912845, -0.7324465, 1.430467, 1, 0, 0, 1, 1,
0.8985682, 0.4176066, 0.6365401, 1, 0, 0, 1, 1,
0.899178, -0.3367186, 1.122477, 1, 0, 0, 1, 1,
0.9031238, 0.7174647, 0.0949642, 1, 0, 0, 1, 1,
0.9097388, -1.745921, 1.46065, 1, 0, 0, 1, 1,
0.913991, -0.7823492, 1.197569, 0, 0, 0, 1, 1,
0.9205818, -0.174514, 2.463813, 0, 0, 0, 1, 1,
0.92942, 0.4917946, 1.371466, 0, 0, 0, 1, 1,
0.9294359, -0.04623865, 3.000156, 0, 0, 0, 1, 1,
0.9325332, 0.6079211, -1.040553, 0, 0, 0, 1, 1,
0.9335418, 0.3820389, 0.3494973, 0, 0, 0, 1, 1,
0.9376002, -0.4061444, 1.711129, 0, 0, 0, 1, 1,
0.9394779, 1.652961, 1.474068, 1, 1, 1, 1, 1,
0.9421459, 1.126675, 0.978139, 1, 1, 1, 1, 1,
0.9462929, -0.4195617, 3.540118, 1, 1, 1, 1, 1,
0.9571697, 1.012158, 0.1229367, 1, 1, 1, 1, 1,
0.9577855, 1.089182, -0.7671602, 1, 1, 1, 1, 1,
0.9723184, 0.2911573, 2.916544, 1, 1, 1, 1, 1,
0.9745718, 0.9964998, -0.1166519, 1, 1, 1, 1, 1,
0.9850888, -1.125164, 2.916971, 1, 1, 1, 1, 1,
0.9908819, 1.621006, 0.5304133, 1, 1, 1, 1, 1,
0.992039, 1.631321, -0.2229605, 1, 1, 1, 1, 1,
0.9930704, -0.4872595, 2.864838, 1, 1, 1, 1, 1,
0.9956766, 0.4794738, 1.759634, 1, 1, 1, 1, 1,
0.9992955, -0.2148727, 2.010325, 1, 1, 1, 1, 1,
1.000164, 1.129233, -0.6029801, 1, 1, 1, 1, 1,
1.000795, 0.04542668, 3.143734, 1, 1, 1, 1, 1,
1.000908, 0.3781234, 0.5618615, 0, 0, 1, 1, 1,
1.005052, 0.2947592, 2.57703, 1, 0, 0, 1, 1,
1.007124, -0.2358831, 2.050137, 1, 0, 0, 1, 1,
1.01097, -1.252801, 3.882483, 1, 0, 0, 1, 1,
1.013437, 1.287449, 2.090325, 1, 0, 0, 1, 1,
1.014, 1.12785, -0.9062071, 1, 0, 0, 1, 1,
1.016736, -0.122742, -0.387778, 0, 0, 0, 1, 1,
1.017492, -1.256781, 2.802327, 0, 0, 0, 1, 1,
1.025564, 0.9305933, 0.5829309, 0, 0, 0, 1, 1,
1.030078, 0.1908254, 0.9644377, 0, 0, 0, 1, 1,
1.030797, 1.159159, 1.762917, 0, 0, 0, 1, 1,
1.033729, -0.18512, 1.06266, 0, 0, 0, 1, 1,
1.036032, 0.3054222, 0.6370354, 0, 0, 0, 1, 1,
1.049816, -0.8416418, 2.625012, 1, 1, 1, 1, 1,
1.063953, -1.466579, 2.812803, 1, 1, 1, 1, 1,
1.066688, -0.4583299, 1.454614, 1, 1, 1, 1, 1,
1.073144, -1.174378, 1.429798, 1, 1, 1, 1, 1,
1.077462, -0.5422624, 0.6667271, 1, 1, 1, 1, 1,
1.097856, -0.472528, 2.074903, 1, 1, 1, 1, 1,
1.102428, -0.3916237, 1.696174, 1, 1, 1, 1, 1,
1.102562, -0.8810637, 1.512293, 1, 1, 1, 1, 1,
1.103054, 0.313788, 1.959496, 1, 1, 1, 1, 1,
1.107505, -0.3470808, 1.869578, 1, 1, 1, 1, 1,
1.113109, -0.8232594, 2.287506, 1, 1, 1, 1, 1,
1.120906, 1.519537, 0.3290516, 1, 1, 1, 1, 1,
1.1233, 0.6092941, 1.464452, 1, 1, 1, 1, 1,
1.125481, 1.122337, 1.395976, 1, 1, 1, 1, 1,
1.126472, -2.052376, 1.627536, 1, 1, 1, 1, 1,
1.129456, -1.06969, 1.672563, 0, 0, 1, 1, 1,
1.13703, 1.227468, 2.546211, 1, 0, 0, 1, 1,
1.139062, 0.2447258, 1.441322, 1, 0, 0, 1, 1,
1.139208, -1.489644, 3.67191, 1, 0, 0, 1, 1,
1.147127, -0.1077694, 2.0238, 1, 0, 0, 1, 1,
1.149564, -0.7064828, 1.977394, 1, 0, 0, 1, 1,
1.153759, -0.353464, 2.319188, 0, 0, 0, 1, 1,
1.155455, -1.730902, 1.558497, 0, 0, 0, 1, 1,
1.157369, -0.7533911, 0.4354548, 0, 0, 0, 1, 1,
1.164048, -0.6666641, 1.492023, 0, 0, 0, 1, 1,
1.168515, 0.662797, 2.412927, 0, 0, 0, 1, 1,
1.171515, 1.757367, -1.255747, 0, 0, 0, 1, 1,
1.182618, 0.8035961, 1.567756, 0, 0, 0, 1, 1,
1.1843, -0.07090021, 2.099372, 1, 1, 1, 1, 1,
1.184692, -1.327029, 1.697255, 1, 1, 1, 1, 1,
1.18679, 0.9768696, -0.9506212, 1, 1, 1, 1, 1,
1.189493, -1.267988, 3.508816, 1, 1, 1, 1, 1,
1.197915, 0.2228024, 1.409583, 1, 1, 1, 1, 1,
1.201483, -0.3708709, 0.6663542, 1, 1, 1, 1, 1,
1.20182, 1.231003, 1.221753, 1, 1, 1, 1, 1,
1.206077, -1.854965, 3.581121, 1, 1, 1, 1, 1,
1.209281, -2.823635, 1.922647, 1, 1, 1, 1, 1,
1.211252, 0.04061269, 2.346004, 1, 1, 1, 1, 1,
1.214302, -0.6736225, 2.905047, 1, 1, 1, 1, 1,
1.215361, 0.3243578, 1.617837, 1, 1, 1, 1, 1,
1.215651, -1.353341, 1.443228, 1, 1, 1, 1, 1,
1.223458, 0.7719449, 3.217626, 1, 1, 1, 1, 1,
1.232126, -0.05137995, 2.079994, 1, 1, 1, 1, 1,
1.241349, 0.8814832, 2.449328, 0, 0, 1, 1, 1,
1.245982, -0.9122643, 0.1921874, 1, 0, 0, 1, 1,
1.25583, 0.1572555, 1.00503, 1, 0, 0, 1, 1,
1.260598, 1.646821, -0.9994452, 1, 0, 0, 1, 1,
1.262134, 0.2879478, 1.02915, 1, 0, 0, 1, 1,
1.266253, 0.5440912, 1.161147, 1, 0, 0, 1, 1,
1.267853, -0.6088871, -0.5325033, 0, 0, 0, 1, 1,
1.272698, 0.7606942, 2.840385, 0, 0, 0, 1, 1,
1.273614, 1.884435, -0.9163103, 0, 0, 0, 1, 1,
1.277986, 0.5340285, 2.339892, 0, 0, 0, 1, 1,
1.280259, -0.9360158, 1.182552, 0, 0, 0, 1, 1,
1.285064, -0.940679, 1.024542, 0, 0, 0, 1, 1,
1.28661, 1.484939, -0.1382935, 0, 0, 0, 1, 1,
1.297541, -0.9312819, 2.680971, 1, 1, 1, 1, 1,
1.305211, -0.02643449, 0.7585692, 1, 1, 1, 1, 1,
1.30654, 1.247845, -2.390027, 1, 1, 1, 1, 1,
1.315148, 0.3028935, 1.18023, 1, 1, 1, 1, 1,
1.316212, -1.691821, 1.570577, 1, 1, 1, 1, 1,
1.317016, 0.52231, 1.602147, 1, 1, 1, 1, 1,
1.319238, -0.1989939, 1.009562, 1, 1, 1, 1, 1,
1.321529, 0.08587558, 0.4670389, 1, 1, 1, 1, 1,
1.324273, -1.359919, 2.580138, 1, 1, 1, 1, 1,
1.337777, 0.1858132, 0.826575, 1, 1, 1, 1, 1,
1.343557, 0.598872, -0.08939896, 1, 1, 1, 1, 1,
1.362098, 0.4115228, -0.05924638, 1, 1, 1, 1, 1,
1.368497, -0.09842619, 4.017388, 1, 1, 1, 1, 1,
1.379988, 1.104383, 0.4430869, 1, 1, 1, 1, 1,
1.388133, 0.4287344, 1.15073, 1, 1, 1, 1, 1,
1.392064, -2.261527, 3.58847, 0, 0, 1, 1, 1,
1.401735, -0.6444569, 1.960288, 1, 0, 0, 1, 1,
1.405123, 1.479811, -0.5389777, 1, 0, 0, 1, 1,
1.426726, -0.5235773, 2.72132, 1, 0, 0, 1, 1,
1.431036, 1.242757, 2.294502, 1, 0, 0, 1, 1,
1.435827, 1.34254, 1.758995, 1, 0, 0, 1, 1,
1.440045, -0.9610877, 3.114267, 0, 0, 0, 1, 1,
1.452795, -1.827668, 4.348269, 0, 0, 0, 1, 1,
1.463655, -0.6800835, 0.5342695, 0, 0, 0, 1, 1,
1.474218, -0.09514393, 0.3640246, 0, 0, 0, 1, 1,
1.475213, 1.099718, 0.1531057, 0, 0, 0, 1, 1,
1.481659, -0.3164335, 1.673635, 0, 0, 0, 1, 1,
1.507797, -0.4973346, 1.946002, 0, 0, 0, 1, 1,
1.513604, -0.1471287, 0.4544563, 1, 1, 1, 1, 1,
1.515426, 0.2356317, 2.005107, 1, 1, 1, 1, 1,
1.520606, -1.154859, 1.463862, 1, 1, 1, 1, 1,
1.531275, -0.681296, 0.6986488, 1, 1, 1, 1, 1,
1.554558, 0.9684047, 0.6711213, 1, 1, 1, 1, 1,
1.556829, -0.5572332, 2.848595, 1, 1, 1, 1, 1,
1.563046, -1.398849, 2.820041, 1, 1, 1, 1, 1,
1.587004, -1.300477, 2.52863, 1, 1, 1, 1, 1,
1.589364, -0.2595079, 3.334568, 1, 1, 1, 1, 1,
1.616474, 0.1790426, 1.874303, 1, 1, 1, 1, 1,
1.621174, -0.6968222, 1.330199, 1, 1, 1, 1, 1,
1.624093, -0.3637144, 2.185651, 1, 1, 1, 1, 1,
1.63183, 2.479316, 1.194505, 1, 1, 1, 1, 1,
1.634075, -0.4693807, 1.747555, 1, 1, 1, 1, 1,
1.641335, 0.3452508, 1.012672, 1, 1, 1, 1, 1,
1.64581, 1.220336, 0.5498477, 0, 0, 1, 1, 1,
1.64716, 1.066961, 0.8577059, 1, 0, 0, 1, 1,
1.648536, -1.106467, 2.645973, 1, 0, 0, 1, 1,
1.659909, 0.03432495, -1.48806, 1, 0, 0, 1, 1,
1.68338, 1.533263, 0.3171671, 1, 0, 0, 1, 1,
1.702494, 0.5899725, 1.521218, 1, 0, 0, 1, 1,
1.702741, 0.1372863, 1.406294, 0, 0, 0, 1, 1,
1.703953, 0.9075223, 0.6802742, 0, 0, 0, 1, 1,
1.737695, 0.9489032, -0.4970337, 0, 0, 0, 1, 1,
1.745027, -0.4177754, 2.698994, 0, 0, 0, 1, 1,
1.78468, 0.6686055, 0.9513731, 0, 0, 0, 1, 1,
1.791756, 1.858208, -0.3360189, 0, 0, 0, 1, 1,
1.793968, 0.145266, 0.1645694, 0, 0, 0, 1, 1,
1.808224, 0.4524379, 1.91928, 1, 1, 1, 1, 1,
1.827593, -1.248567, 2.609156, 1, 1, 1, 1, 1,
1.832418, -0.5239389, 1.219029, 1, 1, 1, 1, 1,
1.833846, -0.4355113, 3.035594, 1, 1, 1, 1, 1,
1.888821, 0.9610018, 2.450337, 1, 1, 1, 1, 1,
1.888908, -1.080769, 1.759362, 1, 1, 1, 1, 1,
1.928593, -0.6694753, 1.258294, 1, 1, 1, 1, 1,
1.932627, -0.3463358, 1.69999, 1, 1, 1, 1, 1,
1.949764, 1.061626, 1.71742, 1, 1, 1, 1, 1,
1.953985, 0.4590056, 0.6456524, 1, 1, 1, 1, 1,
1.978167, 2.207468, 1.786094, 1, 1, 1, 1, 1,
1.988403, -1.292689, 1.209832, 1, 1, 1, 1, 1,
1.990434, -0.2501567, 1.141191, 1, 1, 1, 1, 1,
2.006368, -0.5522531, 0.3825068, 1, 1, 1, 1, 1,
2.041516, 0.3215714, 1.690311, 1, 1, 1, 1, 1,
2.081304, -1.76605, 2.302923, 0, 0, 1, 1, 1,
2.120263, -0.02637671, 1.659603, 1, 0, 0, 1, 1,
2.17517, 0.4472174, 0.9379569, 1, 0, 0, 1, 1,
2.188719, 0.9242436, 0.7760404, 1, 0, 0, 1, 1,
2.239479, -0.569513, 2.200729, 1, 0, 0, 1, 1,
2.292371, -1.492091, 1.856196, 1, 0, 0, 1, 1,
2.370388, 0.02423045, 1.609566, 0, 0, 0, 1, 1,
2.387081, -0.5726146, 1.944181, 0, 0, 0, 1, 1,
2.445609, -0.7818245, 2.517254, 0, 0, 0, 1, 1,
2.480333, -1.000964, 0.8991228, 0, 0, 0, 1, 1,
2.497867, 0.9021428, 2.752329, 0, 0, 0, 1, 1,
2.52861, 0.170104, 1.545716, 0, 0, 0, 1, 1,
2.554671, -0.02315012, 2.367618, 0, 0, 0, 1, 1,
2.632051, 1.643509, 1.724674, 1, 1, 1, 1, 1,
2.680063, -0.7444822, 0.6780396, 1, 1, 1, 1, 1,
2.741503, 2.51635, -0.3536824, 1, 1, 1, 1, 1,
2.751858, 1.015267, 1.191059, 1, 1, 1, 1, 1,
2.757308, 1.372207, 1.876988, 1, 1, 1, 1, 1,
2.857881, -1.107466, 0.4977401, 1, 1, 1, 1, 1,
2.868147, 0.03500177, -0.06568613, 1, 1, 1, 1, 1
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
var radius = 9.62102;
var distance = 33.79342;
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
mvMatrix.translate( 0.24843, 0.01393867, 0.2259295 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.79342);
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
