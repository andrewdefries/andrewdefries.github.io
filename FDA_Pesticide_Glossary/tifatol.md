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
-3.896338, 1.709972, -0.6353155, 1, 0, 0, 1,
-3.505437, -0.9950516, -2.124204, 1, 0.007843138, 0, 1,
-2.892369, -0.5152304, -1.477759, 1, 0.01176471, 0, 1,
-2.805659, -1.126761, -1.30597, 1, 0.01960784, 0, 1,
-2.639874, 0.03887957, -2.888563, 1, 0.02352941, 0, 1,
-2.551037, -0.8573298, -1.772496, 1, 0.03137255, 0, 1,
-2.538405, 0.17305, -1.810416, 1, 0.03529412, 0, 1,
-2.537125, -1.228858, -0.2501204, 1, 0.04313726, 0, 1,
-2.40237, 1.533277, -1.360506, 1, 0.04705882, 0, 1,
-2.359929, -0.09425239, -2.329608, 1, 0.05490196, 0, 1,
-2.318388, -1.659076, -0.9621479, 1, 0.05882353, 0, 1,
-2.287032, -1.574765, -1.749764, 1, 0.06666667, 0, 1,
-2.272503, -0.9478486, -1.906392, 1, 0.07058824, 0, 1,
-2.169867, 0.5578088, -1.022656, 1, 0.07843138, 0, 1,
-2.147406, 0.9979675, -1.527626, 1, 0.08235294, 0, 1,
-2.135775, -1.193642, -5.532062, 1, 0.09019608, 0, 1,
-2.105272, -0.0490846, -1.186622, 1, 0.09411765, 0, 1,
-2.104144, -0.4336568, -1.769804, 1, 0.1019608, 0, 1,
-2.092905, -0.325254, -1.390848, 1, 0.1098039, 0, 1,
-2.069601, 0.3463521, -0.1080284, 1, 0.1137255, 0, 1,
-2.06685, 0.4543709, -3.450674, 1, 0.1215686, 0, 1,
-2.066825, -0.9428393, 0.1570651, 1, 0.1254902, 0, 1,
-2.04612, 0.9282621, -1.113877, 1, 0.1333333, 0, 1,
-2.01353, -1.882569, -0.5942254, 1, 0.1372549, 0, 1,
-2.004718, 0.7059897, 1.107609, 1, 0.145098, 0, 1,
-2.00442, 0.6102945, -1.227299, 1, 0.1490196, 0, 1,
-1.990116, 0.1882333, -1.919519, 1, 0.1568628, 0, 1,
-1.925745, 1.136077, -2.181693, 1, 0.1607843, 0, 1,
-1.915607, 1.29553, -2.437284, 1, 0.1686275, 0, 1,
-1.914314, 0.3741075, -1.208082, 1, 0.172549, 0, 1,
-1.893749, 1.926824, -0.3222221, 1, 0.1803922, 0, 1,
-1.893652, -1.377118, -2.8064, 1, 0.1843137, 0, 1,
-1.875337, 0.2330981, -2.650718, 1, 0.1921569, 0, 1,
-1.865787, 1.290189, -1.857435, 1, 0.1960784, 0, 1,
-1.824713, 2.790152, -1.215896, 1, 0.2039216, 0, 1,
-1.82032, 0.2631868, -2.223276, 1, 0.2117647, 0, 1,
-1.811257, 0.6160834, -1.503288, 1, 0.2156863, 0, 1,
-1.79515, 0.6784571, -1.45556, 1, 0.2235294, 0, 1,
-1.786487, -0.08691023, -3.472204, 1, 0.227451, 0, 1,
-1.784381, 1.629093, -0.4456245, 1, 0.2352941, 0, 1,
-1.759296, -0.349908, -1.078134, 1, 0.2392157, 0, 1,
-1.73983, -1.053017, -3.360116, 1, 0.2470588, 0, 1,
-1.736995, -0.1529493, -0.8733181, 1, 0.2509804, 0, 1,
-1.730085, -0.418635, -2.315549, 1, 0.2588235, 0, 1,
-1.711482, -1.051645, -3.244642, 1, 0.2627451, 0, 1,
-1.691967, 0.1927231, -1.361511, 1, 0.2705882, 0, 1,
-1.673423, 0.1481322, -2.15507, 1, 0.2745098, 0, 1,
-1.66922, 1.106396, -1.417898, 1, 0.282353, 0, 1,
-1.659771, -2.172733, -1.700383, 1, 0.2862745, 0, 1,
-1.656626, 0.4260928, -1.757965, 1, 0.2941177, 0, 1,
-1.653834, -0.2281214, -3.22742, 1, 0.3019608, 0, 1,
-1.632957, -0.3867887, -0.7893813, 1, 0.3058824, 0, 1,
-1.600362, 0.02115487, -2.51, 1, 0.3137255, 0, 1,
-1.597295, 0.8891813, 0.9372495, 1, 0.3176471, 0, 1,
-1.596802, 2.032859, -1.379723, 1, 0.3254902, 0, 1,
-1.59186, 0.008732812, -0.5451422, 1, 0.3294118, 0, 1,
-1.574419, 0.3807552, -1.81906, 1, 0.3372549, 0, 1,
-1.568987, 0.7785096, -3.902122, 1, 0.3411765, 0, 1,
-1.566758, -1.263851, -1.251701, 1, 0.3490196, 0, 1,
-1.559678, 1.293256, -1.491008, 1, 0.3529412, 0, 1,
-1.55156, -1.041811, -2.24822, 1, 0.3607843, 0, 1,
-1.549854, 0.2753077, -1.424764, 1, 0.3647059, 0, 1,
-1.547827, 0.05704875, -1.183564, 1, 0.372549, 0, 1,
-1.533841, -1.661263, -1.596168, 1, 0.3764706, 0, 1,
-1.533484, 0.1989703, -0.4502784, 1, 0.3843137, 0, 1,
-1.524981, -1.62429, -3.740087, 1, 0.3882353, 0, 1,
-1.519006, -1.223374, -2.429649, 1, 0.3960784, 0, 1,
-1.514672, -0.003438635, -2.526923, 1, 0.4039216, 0, 1,
-1.513055, -0.87642, -3.710489, 1, 0.4078431, 0, 1,
-1.505788, -0.09554172, -1.786248, 1, 0.4156863, 0, 1,
-1.49489, -0.7055665, -1.487177, 1, 0.4196078, 0, 1,
-1.494741, 1.202715, -1.131376, 1, 0.427451, 0, 1,
-1.479627, 0.8661737, -2.679035, 1, 0.4313726, 0, 1,
-1.466586, 1.28601, -1.198853, 1, 0.4392157, 0, 1,
-1.462329, -1.145754, -2.141762, 1, 0.4431373, 0, 1,
-1.461647, 2.711118, -0.4223701, 1, 0.4509804, 0, 1,
-1.46025, 1.20467, -1.383144, 1, 0.454902, 0, 1,
-1.455494, -1.1903, -3.114832, 1, 0.4627451, 0, 1,
-1.454556, 1.161029, 0.5422828, 1, 0.4666667, 0, 1,
-1.450782, 1.19679, -0.01728798, 1, 0.4745098, 0, 1,
-1.428017, 0.7380166, -1.028406, 1, 0.4784314, 0, 1,
-1.423706, -0.5350193, -2.866396, 1, 0.4862745, 0, 1,
-1.413262, 0.3175079, -0.1653548, 1, 0.4901961, 0, 1,
-1.407081, 0.9816663, -1.105055, 1, 0.4980392, 0, 1,
-1.39309, 0.3161851, -0.9245408, 1, 0.5058824, 0, 1,
-1.39166, 1.049859, -3.196629, 1, 0.509804, 0, 1,
-1.390882, -0.4022415, -0.2776003, 1, 0.5176471, 0, 1,
-1.387645, 0.8345042, -1.003941, 1, 0.5215687, 0, 1,
-1.382131, -0.8775394, -4.259362, 1, 0.5294118, 0, 1,
-1.380069, -0.3725452, -0.04878541, 1, 0.5333334, 0, 1,
-1.372082, -2.105421, -4.303595, 1, 0.5411765, 0, 1,
-1.350098, 0.1984566, -2.199635, 1, 0.5450981, 0, 1,
-1.34627, 0.3291305, -1.137455, 1, 0.5529412, 0, 1,
-1.34502, -1.246633, -3.550051, 1, 0.5568628, 0, 1,
-1.343543, 0.1451548, -0.1173931, 1, 0.5647059, 0, 1,
-1.333214, -2.010341, -2.120033, 1, 0.5686275, 0, 1,
-1.332056, -1.160457, -1.10954, 1, 0.5764706, 0, 1,
-1.325748, 0.04535459, -1.901556, 1, 0.5803922, 0, 1,
-1.3246, -0.9040602, -1.488741, 1, 0.5882353, 0, 1,
-1.317493, 0.7884813, 0.4340256, 1, 0.5921569, 0, 1,
-1.312358, -0.3030188, -1.42207, 1, 0.6, 0, 1,
-1.308178, -0.8947178, -0.7586342, 1, 0.6078432, 0, 1,
-1.300939, 1.388226, -0.4443327, 1, 0.6117647, 0, 1,
-1.300446, -1.749903, -4.015562, 1, 0.6196079, 0, 1,
-1.298615, -0.1726664, -0.9336937, 1, 0.6235294, 0, 1,
-1.290439, -0.9060498, -1.89113, 1, 0.6313726, 0, 1,
-1.29008, 1.072658, -1.491942, 1, 0.6352941, 0, 1,
-1.28061, 0.7058716, -1.092093, 1, 0.6431373, 0, 1,
-1.28053, 0.5156021, -0.3211479, 1, 0.6470588, 0, 1,
-1.275772, -1.108195, -2.830588, 1, 0.654902, 0, 1,
-1.257433, 1.399299, -2.332528, 1, 0.6588235, 0, 1,
-1.250149, -0.8746912, -1.612724, 1, 0.6666667, 0, 1,
-1.249448, -1.263195, -3.428333, 1, 0.6705883, 0, 1,
-1.239266, -0.1855077, -1.750999, 1, 0.6784314, 0, 1,
-1.232191, 0.08084331, -1.332892, 1, 0.682353, 0, 1,
-1.232129, -0.9153444, -3.83123, 1, 0.6901961, 0, 1,
-1.227622, -1.061303, -2.86052, 1, 0.6941177, 0, 1,
-1.224224, -0.452078, -1.955471, 1, 0.7019608, 0, 1,
-1.224223, -0.07232904, -1.557464, 1, 0.7098039, 0, 1,
-1.215891, -1.758898, -2.863479, 1, 0.7137255, 0, 1,
-1.214994, 0.7178281, -1.605591, 1, 0.7215686, 0, 1,
-1.214246, 0.1647165, -3.637185, 1, 0.7254902, 0, 1,
-1.210994, -0.7678847, 0.8542376, 1, 0.7333333, 0, 1,
-1.195077, 0.1708217, -4.390258, 1, 0.7372549, 0, 1,
-1.193223, -0.1902517, -1.018397, 1, 0.7450981, 0, 1,
-1.173455, 2.520025, -1.249622, 1, 0.7490196, 0, 1,
-1.172921, 0.18061, -0.03481667, 1, 0.7568628, 0, 1,
-1.170569, 0.9104282, -1.456548, 1, 0.7607843, 0, 1,
-1.153556, -1.914157, -1.231966, 1, 0.7686275, 0, 1,
-1.151675, 0.02335711, -1.600793, 1, 0.772549, 0, 1,
-1.138728, 0.8486739, -0.8300107, 1, 0.7803922, 0, 1,
-1.136726, 0.06775176, -2.920081, 1, 0.7843137, 0, 1,
-1.126617, -0.4698844, -3.756167, 1, 0.7921569, 0, 1,
-1.123674, -0.05936489, -1.063283, 1, 0.7960784, 0, 1,
-1.12083, -1.616553, -3.275287, 1, 0.8039216, 0, 1,
-1.11627, 1.8965, -1.900187, 1, 0.8117647, 0, 1,
-1.115046, 1.581753, -0.2388443, 1, 0.8156863, 0, 1,
-1.112334, 0.5933973, -0.3276789, 1, 0.8235294, 0, 1,
-1.097283, -0.427943, -1.240807, 1, 0.827451, 0, 1,
-1.095586, -0.231932, -1.373517, 1, 0.8352941, 0, 1,
-1.093266, 0.6628696, -0.8231801, 1, 0.8392157, 0, 1,
-1.087839, -0.1234388, -1.266764, 1, 0.8470588, 0, 1,
-1.082908, 0.4693661, -1.239231, 1, 0.8509804, 0, 1,
-1.080226, -0.7824295, -0.998001, 1, 0.8588235, 0, 1,
-1.074332, 0.5886581, -1.393198, 1, 0.8627451, 0, 1,
-1.06645, -0.6110963, -2.390882, 1, 0.8705882, 0, 1,
-1.064885, -0.9527624, -0.9074378, 1, 0.8745098, 0, 1,
-1.058783, 0.2798094, -1.019138, 1, 0.8823529, 0, 1,
-1.056931, 1.953768, -0.003408203, 1, 0.8862745, 0, 1,
-1.054842, 0.3065011, -0.4280118, 1, 0.8941177, 0, 1,
-1.053808, -0.8789486, -1.210378, 1, 0.8980392, 0, 1,
-1.050471, -0.7622156, -1.973208, 1, 0.9058824, 0, 1,
-1.046553, 0.2441469, -1.040135, 1, 0.9137255, 0, 1,
-1.045909, -0.4192177, -1.398384, 1, 0.9176471, 0, 1,
-1.043216, 1.148324, -1.915214, 1, 0.9254902, 0, 1,
-1.038715, -0.02180845, -0.9560406, 1, 0.9294118, 0, 1,
-1.035592, -1.083955, -3.217938, 1, 0.9372549, 0, 1,
-1.031085, -0.8120635, -2.312568, 1, 0.9411765, 0, 1,
-1.028316, 0.439347, -0.4970261, 1, 0.9490196, 0, 1,
-1.027275, -0.8410591, -1.133101, 1, 0.9529412, 0, 1,
-1.017135, -0.8811429, -1.567536, 1, 0.9607843, 0, 1,
-1.000301, 0.012194, -3.108492, 1, 0.9647059, 0, 1,
-0.9986674, -0.7220483, -2.419041, 1, 0.972549, 0, 1,
-0.9898452, 2.046727, -2.71096, 1, 0.9764706, 0, 1,
-0.9870704, -1.482217, -2.48567, 1, 0.9843137, 0, 1,
-0.9859905, -0.04868653, 0.9250851, 1, 0.9882353, 0, 1,
-0.9852259, 0.3466892, -1.669412, 1, 0.9960784, 0, 1,
-0.9851712, -0.2333293, -1.57359, 0.9960784, 1, 0, 1,
-0.9835351, 0.07994048, -1.04279, 0.9921569, 1, 0, 1,
-0.9831278, -0.3628483, -0.1817279, 0.9843137, 1, 0, 1,
-0.9823496, 1.659724, -0.9129983, 0.9803922, 1, 0, 1,
-0.9817295, -1.326707, -1.052651, 0.972549, 1, 0, 1,
-0.977977, -0.5028803, -3.796158, 0.9686275, 1, 0, 1,
-0.9770929, 0.2179603, -1.670712, 0.9607843, 1, 0, 1,
-0.9736792, 0.2527692, -1.587886, 0.9568627, 1, 0, 1,
-0.972582, 0.116809, -1.221111, 0.9490196, 1, 0, 1,
-0.9706227, -0.08110721, -1.949959, 0.945098, 1, 0, 1,
-0.9626709, 1.639945, 1.293602, 0.9372549, 1, 0, 1,
-0.9595363, -0.9843931, -3.139467, 0.9333333, 1, 0, 1,
-0.9571321, 0.1833532, -0.827184, 0.9254902, 1, 0, 1,
-0.9518015, 0.7066854, -1.678985, 0.9215686, 1, 0, 1,
-0.9373292, 0.4644769, -0.9802386, 0.9137255, 1, 0, 1,
-0.9239494, -2.371144, -3.057809, 0.9098039, 1, 0, 1,
-0.9197823, -0.3864833, -2.737138, 0.9019608, 1, 0, 1,
-0.9167804, -1.061278, -1.730644, 0.8941177, 1, 0, 1,
-0.9159204, 0.4589814, -0.2741025, 0.8901961, 1, 0, 1,
-0.9145124, -0.7791167, -3.262889, 0.8823529, 1, 0, 1,
-0.9122428, -1.003252, -4.306024, 0.8784314, 1, 0, 1,
-0.9117718, 2.315788, -0.7002283, 0.8705882, 1, 0, 1,
-0.9045302, -2.076523, -1.603132, 0.8666667, 1, 0, 1,
-0.8964128, -0.4239554, -1.063635, 0.8588235, 1, 0, 1,
-0.8927943, -0.4960251, -0.839497, 0.854902, 1, 0, 1,
-0.8860594, 0.8370586, -1.504434, 0.8470588, 1, 0, 1,
-0.8836486, -0.332997, -1.182896, 0.8431373, 1, 0, 1,
-0.880408, -0.02118431, -1.20095, 0.8352941, 1, 0, 1,
-0.8737862, 0.43659, -1.011973, 0.8313726, 1, 0, 1,
-0.8716105, -0.4279774, -2.340255, 0.8235294, 1, 0, 1,
-0.8672462, 0.6113818, -0.747281, 0.8196079, 1, 0, 1,
-0.8634126, 0.2717606, -0.2726477, 0.8117647, 1, 0, 1,
-0.8603725, 0.1950583, -0.4408145, 0.8078431, 1, 0, 1,
-0.86035, -0.4654982, -1.136405, 0.8, 1, 0, 1,
-0.8587871, 0.9563439, -0.2457038, 0.7921569, 1, 0, 1,
-0.85531, -0.575027, -2.733918, 0.7882353, 1, 0, 1,
-0.8399472, 1.342524, -1.81538, 0.7803922, 1, 0, 1,
-0.8321041, -1.660191, -1.64057, 0.7764706, 1, 0, 1,
-0.8312239, 1.668461, 0.9340007, 0.7686275, 1, 0, 1,
-0.830494, -1.024189, -1.611319, 0.7647059, 1, 0, 1,
-0.8291202, 0.5125348, -0.5599966, 0.7568628, 1, 0, 1,
-0.8289709, 0.1918312, 0.1288976, 0.7529412, 1, 0, 1,
-0.8277352, -0.2109465, -1.842761, 0.7450981, 1, 0, 1,
-0.8239793, 1.268445, -0.5381536, 0.7411765, 1, 0, 1,
-0.8238409, 0.9443921, -0.97681, 0.7333333, 1, 0, 1,
-0.8224121, -2.225893, -2.406833, 0.7294118, 1, 0, 1,
-0.8203142, 0.004438486, -0.3485895, 0.7215686, 1, 0, 1,
-0.8196546, -0.195811, -2.378975, 0.7176471, 1, 0, 1,
-0.8038036, -1.689833, -2.65886, 0.7098039, 1, 0, 1,
-0.8036583, -0.8837878, -1.300024, 0.7058824, 1, 0, 1,
-0.8026815, -2.715105, -2.500154, 0.6980392, 1, 0, 1,
-0.792673, -1.211867, -1.81751, 0.6901961, 1, 0, 1,
-0.7914706, -0.8125866, -1.943062, 0.6862745, 1, 0, 1,
-0.7913214, 0.1267856, -1.180896, 0.6784314, 1, 0, 1,
-0.7836195, 1.076066, -0.7763871, 0.6745098, 1, 0, 1,
-0.7832482, 1.038744, -0.4778194, 0.6666667, 1, 0, 1,
-0.7759922, 1.210222, 1.30581, 0.6627451, 1, 0, 1,
-0.7739781, -3.210009, -3.907039, 0.654902, 1, 0, 1,
-0.7691551, -0.5910482, -1.761072, 0.6509804, 1, 0, 1,
-0.7678614, 0.8756568, -0.7026034, 0.6431373, 1, 0, 1,
-0.7653153, 1.066477, -2.682612, 0.6392157, 1, 0, 1,
-0.7613427, -1.248597, -2.269686, 0.6313726, 1, 0, 1,
-0.7573237, 0.711418, -0.9957661, 0.627451, 1, 0, 1,
-0.7489942, -0.7480279, -0.5593092, 0.6196079, 1, 0, 1,
-0.746716, 1.022879, -1.07171, 0.6156863, 1, 0, 1,
-0.7461621, -0.9236811, -1.830461, 0.6078432, 1, 0, 1,
-0.7436677, -0.1283298, -1.3928, 0.6039216, 1, 0, 1,
-0.742053, -1.554815, -2.73506, 0.5960785, 1, 0, 1,
-0.7393197, 0.714317, -0.8565035, 0.5882353, 1, 0, 1,
-0.7354339, -0.678073, -2.12841, 0.5843138, 1, 0, 1,
-0.7275007, 0.6756756, -2.455771, 0.5764706, 1, 0, 1,
-0.7224154, 1.51699, -0.5870983, 0.572549, 1, 0, 1,
-0.7200201, 0.1428197, -0.3843575, 0.5647059, 1, 0, 1,
-0.7186252, 0.9065797, -0.5332247, 0.5607843, 1, 0, 1,
-0.717463, 1.623049, -1.511977, 0.5529412, 1, 0, 1,
-0.716223, 1.66415, -0.09429866, 0.5490196, 1, 0, 1,
-0.7142457, -0.7404159, -0.9621255, 0.5411765, 1, 0, 1,
-0.7129635, 1.333419, -1.427036, 0.5372549, 1, 0, 1,
-0.7085634, 1.290934, 1.327978, 0.5294118, 1, 0, 1,
-0.7075648, -0.4908943, -0.9302701, 0.5254902, 1, 0, 1,
-0.7065995, -0.8068563, -3.173567, 0.5176471, 1, 0, 1,
-0.6990424, 1.951404, -1.512749, 0.5137255, 1, 0, 1,
-0.6984125, -0.2881991, -0.3697003, 0.5058824, 1, 0, 1,
-0.6807045, -0.4778612, -2.011445, 0.5019608, 1, 0, 1,
-0.678443, -0.5459841, -2.340449, 0.4941176, 1, 0, 1,
-0.6773809, -0.4456507, -2.16349, 0.4862745, 1, 0, 1,
-0.6763151, 1.180021, 0.1767929, 0.4823529, 1, 0, 1,
-0.676177, 0.1044609, 0.431474, 0.4745098, 1, 0, 1,
-0.6731786, 0.2631143, -2.625564, 0.4705882, 1, 0, 1,
-0.6711699, 1.347633, -1.153613, 0.4627451, 1, 0, 1,
-0.6637648, -1.499561, -1.744687, 0.4588235, 1, 0, 1,
-0.6596227, 0.3118172, -0.3173482, 0.4509804, 1, 0, 1,
-0.6570275, 1.176277, -0.8287106, 0.4470588, 1, 0, 1,
-0.6501703, -0.367281, -1.00606, 0.4392157, 1, 0, 1,
-0.6450374, -0.517388, -3.429702, 0.4352941, 1, 0, 1,
-0.6421128, -0.01891838, -1.73395, 0.427451, 1, 0, 1,
-0.6394509, -0.1353386, -1.121873, 0.4235294, 1, 0, 1,
-0.6329176, -2.169122, -4.435679, 0.4156863, 1, 0, 1,
-0.631934, -0.9966567, -1.927538, 0.4117647, 1, 0, 1,
-0.6269059, -1.889884, -1.016921, 0.4039216, 1, 0, 1,
-0.6265309, -0.7769236, -3.474916, 0.3960784, 1, 0, 1,
-0.6264928, 0.07898474, -2.564396, 0.3921569, 1, 0, 1,
-0.6230352, -0.6447375, -2.891166, 0.3843137, 1, 0, 1,
-0.6170858, 1.484841, -0.1837794, 0.3803922, 1, 0, 1,
-0.6161178, 0.01612104, -2.727619, 0.372549, 1, 0, 1,
-0.61497, -1.724551, -3.346747, 0.3686275, 1, 0, 1,
-0.6075267, -1.281021, -3.401747, 0.3607843, 1, 0, 1,
-0.6054149, 2.084702, -0.1905771, 0.3568628, 1, 0, 1,
-0.6046916, -1.689214, -2.023951, 0.3490196, 1, 0, 1,
-0.601595, -0.6886591, -2.027693, 0.345098, 1, 0, 1,
-0.6003851, -0.4072372, -3.019688, 0.3372549, 1, 0, 1,
-0.5956571, -0.8296152, -2.169886, 0.3333333, 1, 0, 1,
-0.5932396, -0.5491319, -1.797362, 0.3254902, 1, 0, 1,
-0.5839668, -0.5342497, -1.60178, 0.3215686, 1, 0, 1,
-0.5838145, 1.16951, 0.4851523, 0.3137255, 1, 0, 1,
-0.5776981, -0.3058627, -1.603979, 0.3098039, 1, 0, 1,
-0.5774569, 0.4090855, -1.090129, 0.3019608, 1, 0, 1,
-0.5749743, -0.8954271, -2.111247, 0.2941177, 1, 0, 1,
-0.5715743, 0.09836762, -0.8616439, 0.2901961, 1, 0, 1,
-0.5624422, -0.5989457, -3.381902, 0.282353, 1, 0, 1,
-0.552901, -0.6844408, -2.62108, 0.2784314, 1, 0, 1,
-0.54959, -0.3045678, -0.7588858, 0.2705882, 1, 0, 1,
-0.5485409, 0.4431539, -0.611922, 0.2666667, 1, 0, 1,
-0.5465347, -1.476617, -1.975964, 0.2588235, 1, 0, 1,
-0.5360839, -1.178388, -2.118336, 0.254902, 1, 0, 1,
-0.5357891, 0.1234849, -2.591259, 0.2470588, 1, 0, 1,
-0.5335249, -0.3296847, -1.573386, 0.2431373, 1, 0, 1,
-0.5232862, 0.07927813, -2.904505, 0.2352941, 1, 0, 1,
-0.5209394, 0.8919768, -1.565864, 0.2313726, 1, 0, 1,
-0.5191327, -0.7697954, -3.301357, 0.2235294, 1, 0, 1,
-0.5149736, -0.880281, -1.65957, 0.2196078, 1, 0, 1,
-0.5115808, -0.2737334, -0.8997562, 0.2117647, 1, 0, 1,
-0.5090671, -1.346512, -2.589144, 0.2078431, 1, 0, 1,
-0.5085017, 1.125652, -1.343002, 0.2, 1, 0, 1,
-0.5059671, 0.0931493, -1.368092, 0.1921569, 1, 0, 1,
-0.505335, 1.83303, -0.0674393, 0.1882353, 1, 0, 1,
-0.5021197, -0.3804084, -2.937121, 0.1803922, 1, 0, 1,
-0.5019987, 0.4130036, -0.5541244, 0.1764706, 1, 0, 1,
-0.5009072, -1.40816, -4.541195, 0.1686275, 1, 0, 1,
-0.4986617, -0.7620627, -1.763605, 0.1647059, 1, 0, 1,
-0.4955763, -0.04155108, -0.5140521, 0.1568628, 1, 0, 1,
-0.4922773, -0.2747883, -4.711295, 0.1529412, 1, 0, 1,
-0.4908416, -1.879223, -4.005634, 0.145098, 1, 0, 1,
-0.490285, -0.6097121, -2.106233, 0.1411765, 1, 0, 1,
-0.4886971, 0.7098426, -0.3792741, 0.1333333, 1, 0, 1,
-0.4830707, -0.3976044, -1.224154, 0.1294118, 1, 0, 1,
-0.4780947, -1.057943, -2.351293, 0.1215686, 1, 0, 1,
-0.4742149, 1.478867, -0.9420024, 0.1176471, 1, 0, 1,
-0.4720028, -0.9595953, -3.759423, 0.1098039, 1, 0, 1,
-0.4712163, 0.9728023, 0.7187614, 0.1058824, 1, 0, 1,
-0.4709939, 1.41058, -0.5522605, 0.09803922, 1, 0, 1,
-0.4695077, 0.8124892, 0.1429121, 0.09019608, 1, 0, 1,
-0.4662922, 0.7340315, -0.8938975, 0.08627451, 1, 0, 1,
-0.4641303, 1.0127, -1.063208, 0.07843138, 1, 0, 1,
-0.4639862, -1.502536, -2.257265, 0.07450981, 1, 0, 1,
-0.4630109, 0.4343576, -0.3466817, 0.06666667, 1, 0, 1,
-0.4608963, 0.01778514, -0.4366291, 0.0627451, 1, 0, 1,
-0.4487766, -1.078956, -4.197811, 0.05490196, 1, 0, 1,
-0.4474512, -0.5002475, -3.027563, 0.05098039, 1, 0, 1,
-0.4443874, 0.4686465, -0.6549164, 0.04313726, 1, 0, 1,
-0.4431015, -1.261409, -2.451015, 0.03921569, 1, 0, 1,
-0.4417009, 0.7596796, -0.7889943, 0.03137255, 1, 0, 1,
-0.4393878, -0.505282, -2.340674, 0.02745098, 1, 0, 1,
-0.4361858, 1.833894, -2.597651, 0.01960784, 1, 0, 1,
-0.4341314, 0.1712216, -2.037549, 0.01568628, 1, 0, 1,
-0.4336866, -0.6170352, -1.098431, 0.007843138, 1, 0, 1,
-0.4292701, 1.486629, 0.7453091, 0.003921569, 1, 0, 1,
-0.4281664, 0.7027695, -0.7217032, 0, 1, 0.003921569, 1,
-0.4248825, -0.9950668, -1.819764, 0, 1, 0.01176471, 1,
-0.4235054, -0.7961898, -1.447378, 0, 1, 0.01568628, 1,
-0.4231234, 0.6429953, -0.7244956, 0, 1, 0.02352941, 1,
-0.4193694, -0.2904205, -2.293992, 0, 1, 0.02745098, 1,
-0.4174714, -0.5164407, -2.645159, 0, 1, 0.03529412, 1,
-0.4153099, 0.06113869, -1.91501, 0, 1, 0.03921569, 1,
-0.4045165, -1.43326, -3.84942, 0, 1, 0.04705882, 1,
-0.4040653, 0.2925642, -1.540819, 0, 1, 0.05098039, 1,
-0.3947155, -0.09951629, -2.333626, 0, 1, 0.05882353, 1,
-0.3940152, 1.375834, 0.6561962, 0, 1, 0.0627451, 1,
-0.3937957, -0.7447836, -3.403774, 0, 1, 0.07058824, 1,
-0.3913741, -0.6768751, -1.884311, 0, 1, 0.07450981, 1,
-0.391279, -0.7328053, -1.793692, 0, 1, 0.08235294, 1,
-0.3882409, 0.3073972, 0.2622861, 0, 1, 0.08627451, 1,
-0.3874812, -0.1911611, -1.627396, 0, 1, 0.09411765, 1,
-0.3872767, -0.4938436, -2.486799, 0, 1, 0.1019608, 1,
-0.3854175, -0.496574, -1.748698, 0, 1, 0.1058824, 1,
-0.3844329, 0.3500613, -1.486013, 0, 1, 0.1137255, 1,
-0.3835611, -0.354588, -2.391833, 0, 1, 0.1176471, 1,
-0.3801553, -0.8290076, -3.569935, 0, 1, 0.1254902, 1,
-0.3776425, 0.1639256, -0.1376485, 0, 1, 0.1294118, 1,
-0.3747705, -0.07537927, -0.208029, 0, 1, 0.1372549, 1,
-0.3744819, -0.6729661, -1.718231, 0, 1, 0.1411765, 1,
-0.3718057, -0.5321837, -1.05583, 0, 1, 0.1490196, 1,
-0.3702918, 0.642121, -0.8245008, 0, 1, 0.1529412, 1,
-0.3701504, -1.989339, -2.057386, 0, 1, 0.1607843, 1,
-0.3695531, -1.627093, -1.496316, 0, 1, 0.1647059, 1,
-0.3693343, 0.8141583, 0.8067212, 0, 1, 0.172549, 1,
-0.3656353, -0.007042066, -0.9052014, 0, 1, 0.1764706, 1,
-0.3559086, -0.04434901, -2.52547, 0, 1, 0.1843137, 1,
-0.3555185, 1.011013, -1.285655, 0, 1, 0.1882353, 1,
-0.3544221, -1.125808, -3.283591, 0, 1, 0.1960784, 1,
-0.3536521, -1.015023, -0.927572, 0, 1, 0.2039216, 1,
-0.3485746, 0.6943784, -0.6989725, 0, 1, 0.2078431, 1,
-0.3485379, -2.376057, -1.903347, 0, 1, 0.2156863, 1,
-0.3461097, 0.209778, -2.06726, 0, 1, 0.2196078, 1,
-0.3413666, -0.2126096, -1.545721, 0, 1, 0.227451, 1,
-0.3407816, -0.9226195, -3.587029, 0, 1, 0.2313726, 1,
-0.3406509, 1.399169, -1.985493, 0, 1, 0.2392157, 1,
-0.3331751, -0.7920261, -2.834152, 0, 1, 0.2431373, 1,
-0.3294616, -0.5627163, -0.3085271, 0, 1, 0.2509804, 1,
-0.3270066, 0.04196702, 0.9940521, 0, 1, 0.254902, 1,
-0.326813, -0.5432864, -2.890526, 0, 1, 0.2627451, 1,
-0.3258415, 0.7114119, -0.7356197, 0, 1, 0.2666667, 1,
-0.325641, -1.672122, -2.894654, 0, 1, 0.2745098, 1,
-0.3255276, 0.2674746, -1.697317, 0, 1, 0.2784314, 1,
-0.3214847, 0.2779317, 0.446112, 0, 1, 0.2862745, 1,
-0.3163923, -1.053414, -4.361216, 0, 1, 0.2901961, 1,
-0.316309, 1.828475, 1.085433, 0, 1, 0.2980392, 1,
-0.3153335, -1.887263, -3.316982, 0, 1, 0.3058824, 1,
-0.314667, -0.7078449, -1.490227, 0, 1, 0.3098039, 1,
-0.3140267, -0.9631683, -2.503057, 0, 1, 0.3176471, 1,
-0.3122213, -0.05676946, -2.792326, 0, 1, 0.3215686, 1,
-0.3103901, -0.4696405, -2.214123, 0, 1, 0.3294118, 1,
-0.3087315, -0.4767319, -2.196772, 0, 1, 0.3333333, 1,
-0.3048331, 0.5834087, 0.5272683, 0, 1, 0.3411765, 1,
-0.3025416, -1.094279, -2.623162, 0, 1, 0.345098, 1,
-0.3025407, 0.2615164, -0.760789, 0, 1, 0.3529412, 1,
-0.3022442, -0.9327732, -2.116678, 0, 1, 0.3568628, 1,
-0.3018229, -0.6019344, -3.791809, 0, 1, 0.3647059, 1,
-0.2959309, -1.37556, -2.33122, 0, 1, 0.3686275, 1,
-0.2941825, -0.2715114, -2.596443, 0, 1, 0.3764706, 1,
-0.2929233, 1.361556, 0.4228784, 0, 1, 0.3803922, 1,
-0.2926533, -1.807872, -3.120794, 0, 1, 0.3882353, 1,
-0.2921535, -1.170147, -3.79838, 0, 1, 0.3921569, 1,
-0.2864585, -0.1334274, -1.680436, 0, 1, 0.4, 1,
-0.2837437, -2.370924, -3.769639, 0, 1, 0.4078431, 1,
-0.2774988, -0.4816186, -3.335169, 0, 1, 0.4117647, 1,
-0.2767877, 0.6056094, 0.4378845, 0, 1, 0.4196078, 1,
-0.2705937, 0.2984713, -1.108642, 0, 1, 0.4235294, 1,
-0.2659161, -0.6181034, -0.7607558, 0, 1, 0.4313726, 1,
-0.2634612, 0.5029842, 2.23502, 0, 1, 0.4352941, 1,
-0.2617429, 0.007569335, -1.154114, 0, 1, 0.4431373, 1,
-0.2578225, -0.8165655, -3.539288, 0, 1, 0.4470588, 1,
-0.2556585, 0.419467, -1.197188, 0, 1, 0.454902, 1,
-0.2547535, -0.3641989, -2.867748, 0, 1, 0.4588235, 1,
-0.2542881, -1.605029, -1.335321, 0, 1, 0.4666667, 1,
-0.2535842, -0.3330983, -3.369755, 0, 1, 0.4705882, 1,
-0.2528331, -0.02369908, -2.912489, 0, 1, 0.4784314, 1,
-0.2524425, -1.130148, -1.194567, 0, 1, 0.4823529, 1,
-0.2518511, 0.4530157, -1.246729, 0, 1, 0.4901961, 1,
-0.2502078, 0.9869228, 1.826705, 0, 1, 0.4941176, 1,
-0.2449372, -0.2471093, -2.642584, 0, 1, 0.5019608, 1,
-0.2441609, 1.059171, -0.1142019, 0, 1, 0.509804, 1,
-0.2440962, 0.3560219, 0.5850812, 0, 1, 0.5137255, 1,
-0.2340638, 0.03311785, -1.446282, 0, 1, 0.5215687, 1,
-0.2333255, -0.03296577, -2.205899, 0, 1, 0.5254902, 1,
-0.2280929, 0.3847649, -1.389893, 0, 1, 0.5333334, 1,
-0.2278674, 2.019691, 0.9463612, 0, 1, 0.5372549, 1,
-0.2253774, -1.53995, -2.474529, 0, 1, 0.5450981, 1,
-0.2160533, -1.780478, -5.055749, 0, 1, 0.5490196, 1,
-0.2140168, -0.582442, -2.019734, 0, 1, 0.5568628, 1,
-0.2107164, -2.731362, -2.752803, 0, 1, 0.5607843, 1,
-0.2094567, 0.6765117, -0.2644618, 0, 1, 0.5686275, 1,
-0.1987618, -0.085214, -4.050991, 0, 1, 0.572549, 1,
-0.195889, -0.2521813, -2.051428, 0, 1, 0.5803922, 1,
-0.1921451, 0.456718, -0.5840194, 0, 1, 0.5843138, 1,
-0.1815137, 0.6104682, 0.2786463, 0, 1, 0.5921569, 1,
-0.1811709, 0.6290534, -0.2847528, 0, 1, 0.5960785, 1,
-0.1779804, 0.5249866, -0.4685637, 0, 1, 0.6039216, 1,
-0.1766961, -0.6423203, -2.814441, 0, 1, 0.6117647, 1,
-0.169852, 1.951067, 1.66624, 0, 1, 0.6156863, 1,
-0.1554045, -0.9265888, -3.220933, 0, 1, 0.6235294, 1,
-0.1525565, 0.1909701, 1.685314, 0, 1, 0.627451, 1,
-0.1503191, -1.306738, -1.846072, 0, 1, 0.6352941, 1,
-0.1453306, -0.2201292, -2.036987, 0, 1, 0.6392157, 1,
-0.1451939, -0.4638922, -4.350396, 0, 1, 0.6470588, 1,
-0.144067, -0.1235457, -0.7927139, 0, 1, 0.6509804, 1,
-0.1434338, -0.5234009, -2.973362, 0, 1, 0.6588235, 1,
-0.1432868, 1.381952, -0.6934636, 0, 1, 0.6627451, 1,
-0.1418667, 0.3413915, -1.885671, 0, 1, 0.6705883, 1,
-0.1410219, 0.0575565, -1.572885, 0, 1, 0.6745098, 1,
-0.1388976, 0.5615906, 0.8787071, 0, 1, 0.682353, 1,
-0.1372069, 0.2360411, -0.203625, 0, 1, 0.6862745, 1,
-0.1353144, -1.958694, -4.830687, 0, 1, 0.6941177, 1,
-0.1319953, -0.1706219, -3.072139, 0, 1, 0.7019608, 1,
-0.1312266, -0.7901629, -2.976601, 0, 1, 0.7058824, 1,
-0.1248687, 0.276502, -0.0399351, 0, 1, 0.7137255, 1,
-0.1247384, 0.4167809, -0.03897984, 0, 1, 0.7176471, 1,
-0.1205866, 1.7217, 0.650273, 0, 1, 0.7254902, 1,
-0.1165234, 0.2066758, 0.9104135, 0, 1, 0.7294118, 1,
-0.1163072, 1.73258, -0.3802387, 0, 1, 0.7372549, 1,
-0.1127524, 0.08065454, -0.335629, 0, 1, 0.7411765, 1,
-0.11197, 0.04613562, -0.8917752, 0, 1, 0.7490196, 1,
-0.1115098, -2.31326, -3.479918, 0, 1, 0.7529412, 1,
-0.1077838, -0.02749434, -2.373245, 0, 1, 0.7607843, 1,
-0.107468, -0.1074023, -0.8396025, 0, 1, 0.7647059, 1,
-0.10226, -0.8588965, -2.484347, 0, 1, 0.772549, 1,
-0.1006934, 1.778309, -0.2450404, 0, 1, 0.7764706, 1,
-0.100684, 0.4538802, 0.384824, 0, 1, 0.7843137, 1,
-0.09366516, 0.7610174, -1.160064, 0, 1, 0.7882353, 1,
-0.09054739, 0.5588835, 1.476962, 0, 1, 0.7960784, 1,
-0.0893786, -0.00320368, -2.438545, 0, 1, 0.8039216, 1,
-0.08793542, -0.1320004, -2.92688, 0, 1, 0.8078431, 1,
-0.08672953, 1.09074, -1.308566, 0, 1, 0.8156863, 1,
-0.08449577, -0.2224797, -1.448531, 0, 1, 0.8196079, 1,
-0.08258886, 0.7420231, 0.6320895, 0, 1, 0.827451, 1,
-0.07622482, 1.285741, -0.8914979, 0, 1, 0.8313726, 1,
-0.0664318, 1.977852, -1.420582, 0, 1, 0.8392157, 1,
-0.06276881, 0.126287, -1.531749, 0, 1, 0.8431373, 1,
-0.05500112, -0.6231936, -4.139778, 0, 1, 0.8509804, 1,
-0.05486074, -0.6872807, -3.532168, 0, 1, 0.854902, 1,
-0.0523303, 1.044511, -0.3450921, 0, 1, 0.8627451, 1,
-0.05130878, -0.6776303, -1.489233, 0, 1, 0.8666667, 1,
-0.04930295, -0.1001883, -1.814206, 0, 1, 0.8745098, 1,
-0.04724968, -0.3319256, -3.480832, 0, 1, 0.8784314, 1,
-0.04505666, -0.27526, -3.326044, 0, 1, 0.8862745, 1,
-0.03907842, -0.4590077, -1.928494, 0, 1, 0.8901961, 1,
-0.03665068, -0.08795594, -2.79581, 0, 1, 0.8980392, 1,
-0.03437132, -1.875542, -2.521454, 0, 1, 0.9058824, 1,
-0.03371721, 1.03667, -0.9199339, 0, 1, 0.9098039, 1,
-0.02748113, -0.504685, -4.034278, 0, 1, 0.9176471, 1,
-0.02211811, -0.577864, -3.799585, 0, 1, 0.9215686, 1,
-0.01992615, -1.703787, -2.997162, 0, 1, 0.9294118, 1,
-0.01853677, 0.00802729, -1.58597, 0, 1, 0.9333333, 1,
-0.01832622, -0.6056924, -1.26466, 0, 1, 0.9411765, 1,
-0.01502272, -1.422559, -3.30314, 0, 1, 0.945098, 1,
-0.01439998, 0.3795436, 0.752074, 0, 1, 0.9529412, 1,
-0.01353139, 0.5971142, -1.240971, 0, 1, 0.9568627, 1,
-0.01194865, 0.3504831, -2.563808, 0, 1, 0.9647059, 1,
-0.01035151, -0.05301226, -2.502208, 0, 1, 0.9686275, 1,
-0.006180825, 1.284335, 1.646816, 0, 1, 0.9764706, 1,
-0.00543466, 0.841657, 0.5191435, 0, 1, 0.9803922, 1,
-0.002762541, 0.5549577, 1.584165, 0, 1, 0.9882353, 1,
0.00066292, -0.03341492, 1.949824, 0, 1, 0.9921569, 1,
0.002438306, -1.322942, 1.834277, 0, 1, 1, 1,
0.01025662, 1.049499, -0.4505124, 0, 0.9921569, 1, 1,
0.0144634, 0.2759018, -0.3997664, 0, 0.9882353, 1, 1,
0.01567524, 0.1007172, 1.359381, 0, 0.9803922, 1, 1,
0.01607252, 0.2495893, -1.65297, 0, 0.9764706, 1, 1,
0.01694222, -0.2373872, 3.855518, 0, 0.9686275, 1, 1,
0.02030096, 0.0561329, -0.8366911, 0, 0.9647059, 1, 1,
0.02131493, 0.8417546, 1.213431, 0, 0.9568627, 1, 1,
0.0300333, -0.558517, 4.214488, 0, 0.9529412, 1, 1,
0.03117677, -0.9692932, 3.606618, 0, 0.945098, 1, 1,
0.03163198, 0.1467308, -0.1764224, 0, 0.9411765, 1, 1,
0.03495521, -1.199885, 3.911816, 0, 0.9333333, 1, 1,
0.04098812, -0.7723061, 1.158592, 0, 0.9294118, 1, 1,
0.0439349, -0.9130092, 3.566417, 0, 0.9215686, 1, 1,
0.04763677, 0.9545017, 0.3676221, 0, 0.9176471, 1, 1,
0.05072181, 0.02945846, 1.11167, 0, 0.9098039, 1, 1,
0.05130876, 0.7346547, 0.02589212, 0, 0.9058824, 1, 1,
0.05324081, 0.8977408, 0.9142649, 0, 0.8980392, 1, 1,
0.05458859, -0.7166743, 3.831319, 0, 0.8901961, 1, 1,
0.06165443, 1.071226, 0.496407, 0, 0.8862745, 1, 1,
0.06298348, -0.9731123, 2.93786, 0, 0.8784314, 1, 1,
0.07657929, 1.656305, -0.4817256, 0, 0.8745098, 1, 1,
0.08513763, 0.4105092, 1.102241, 0, 0.8666667, 1, 1,
0.09250434, -0.07449956, 2.690218, 0, 0.8627451, 1, 1,
0.09328032, 0.6888443, -0.1143258, 0, 0.854902, 1, 1,
0.09352224, -0.5362831, 2.077443, 0, 0.8509804, 1, 1,
0.09504696, -1.536741, 3.531373, 0, 0.8431373, 1, 1,
0.09564874, -1.428091, 2.202461, 0, 0.8392157, 1, 1,
0.09797799, 0.9648054, 1.832809, 0, 0.8313726, 1, 1,
0.1061922, 1.714453, -1.198898, 0, 0.827451, 1, 1,
0.1129854, -0.385513, 1.877894, 0, 0.8196079, 1, 1,
0.1129865, -0.1548087, 2.32917, 0, 0.8156863, 1, 1,
0.1172328, 0.7497681, 0.1120922, 0, 0.8078431, 1, 1,
0.118628, 1.773857, -0.2502317, 0, 0.8039216, 1, 1,
0.1186716, 0.8527265, -1.959725, 0, 0.7960784, 1, 1,
0.127839, -0.4306259, 2.422663, 0, 0.7882353, 1, 1,
0.1279287, -0.575322, 3.433902, 0, 0.7843137, 1, 1,
0.1281128, -2.682983, 2.031496, 0, 0.7764706, 1, 1,
0.1312799, 1.534303, 0.9549673, 0, 0.772549, 1, 1,
0.1323907, 1.784158, -0.2113799, 0, 0.7647059, 1, 1,
0.1327688, 0.9775284, 0.3404135, 0, 0.7607843, 1, 1,
0.1329775, 0.2199428, 1.509337, 0, 0.7529412, 1, 1,
0.1363832, 0.1121163, 2.62438, 0, 0.7490196, 1, 1,
0.1406444, -0.4920239, 1.226009, 0, 0.7411765, 1, 1,
0.1433384, 1.389807, -2.080528, 0, 0.7372549, 1, 1,
0.1433857, -0.7561119, 4.618523, 0, 0.7294118, 1, 1,
0.1476277, 0.1936586, 2.255632, 0, 0.7254902, 1, 1,
0.1481176, -0.7457855, 3.603063, 0, 0.7176471, 1, 1,
0.1533236, 1.221949, 0.9884271, 0, 0.7137255, 1, 1,
0.1558322, 0.8629327, 0.09051344, 0, 0.7058824, 1, 1,
0.1560127, -0.4390952, 2.660819, 0, 0.6980392, 1, 1,
0.1594882, 0.9938763, 0.7539024, 0, 0.6941177, 1, 1,
0.1638193, 0.8261406, 1.43956, 0, 0.6862745, 1, 1,
0.1649864, 0.1198767, -1.206688, 0, 0.682353, 1, 1,
0.1723078, -0.8198574, 2.187633, 0, 0.6745098, 1, 1,
0.178644, -1.450574, 1.676721, 0, 0.6705883, 1, 1,
0.1794026, 0.1854592, -1.299297, 0, 0.6627451, 1, 1,
0.1820007, -0.4105849, 4.479077, 0, 0.6588235, 1, 1,
0.1828372, 0.1235846, 1.754992, 0, 0.6509804, 1, 1,
0.1831408, 0.6391838, 0.3612669, 0, 0.6470588, 1, 1,
0.1839993, -1.031478, 4.146743, 0, 0.6392157, 1, 1,
0.1899214, 1.384155, -0.6142249, 0, 0.6352941, 1, 1,
0.1938679, 0.697837, 1.268573, 0, 0.627451, 1, 1,
0.1958182, 1.183883, 1.399385, 0, 0.6235294, 1, 1,
0.1967939, 0.6189222, 1.166025, 0, 0.6156863, 1, 1,
0.2003278, -0.2363738, 1.774055, 0, 0.6117647, 1, 1,
0.2008075, 0.8624936, 0.7458437, 0, 0.6039216, 1, 1,
0.2017314, 0.7111415, 0.7775286, 0, 0.5960785, 1, 1,
0.2045951, 1.384106, -0.3473865, 0, 0.5921569, 1, 1,
0.2046801, -0.8360501, 2.531075, 0, 0.5843138, 1, 1,
0.2101639, 0.1157164, 3.317638, 0, 0.5803922, 1, 1,
0.2159093, 1.061985, 0.5113862, 0, 0.572549, 1, 1,
0.2177999, -0.5584816, 1.825223, 0, 0.5686275, 1, 1,
0.2178791, 0.5013759, -1.984793, 0, 0.5607843, 1, 1,
0.2229352, -0.5460552, 2.103712, 0, 0.5568628, 1, 1,
0.2274956, 0.729154, 1.932001, 0, 0.5490196, 1, 1,
0.228795, -0.1431853, 2.302517, 0, 0.5450981, 1, 1,
0.2330054, 1.375158, 0.09703721, 0, 0.5372549, 1, 1,
0.2332048, 1.122333, 0.6923147, 0, 0.5333334, 1, 1,
0.2366252, -0.4445393, 2.486309, 0, 0.5254902, 1, 1,
0.2381231, -1.555087, 2.894214, 0, 0.5215687, 1, 1,
0.2402761, -2.027991, 1.049265, 0, 0.5137255, 1, 1,
0.2502691, -1.136653, 3.713337, 0, 0.509804, 1, 1,
0.2555869, 0.6058291, 0.7082164, 0, 0.5019608, 1, 1,
0.2571523, 0.5788134, 0.5057049, 0, 0.4941176, 1, 1,
0.257615, -0.8435548, 1.670619, 0, 0.4901961, 1, 1,
0.2578347, -0.2828991, 4.216218, 0, 0.4823529, 1, 1,
0.2599724, -0.3809305, 3.646215, 0, 0.4784314, 1, 1,
0.2622767, 0.1163171, 1.837716, 0, 0.4705882, 1, 1,
0.2647569, 0.2323047, 1.485819, 0, 0.4666667, 1, 1,
0.2663547, -1.523433, 2.663053, 0, 0.4588235, 1, 1,
0.2665366, -0.4425021, 1.007449, 0, 0.454902, 1, 1,
0.269063, -0.08597943, 0.2735617, 0, 0.4470588, 1, 1,
0.2744004, 0.4821817, 0.1354764, 0, 0.4431373, 1, 1,
0.2750874, 0.9273224, 0.8330136, 0, 0.4352941, 1, 1,
0.2764205, -0.66383, 2.969869, 0, 0.4313726, 1, 1,
0.2776116, 0.1904619, 3.973565, 0, 0.4235294, 1, 1,
0.2781874, 0.1233679, 0.8440241, 0, 0.4196078, 1, 1,
0.2802809, -0.2785511, 1.437434, 0, 0.4117647, 1, 1,
0.2819841, -1.7834, 3.675091, 0, 0.4078431, 1, 1,
0.2824791, 1.288238, 0.4340112, 0, 0.4, 1, 1,
0.2840683, 1.763134, -0.5644222, 0, 0.3921569, 1, 1,
0.2892326, 0.8351229, 0.005143157, 0, 0.3882353, 1, 1,
0.2914699, 1.38703, 0.05242017, 0, 0.3803922, 1, 1,
0.2971012, -0.7309159, 2.362549, 0, 0.3764706, 1, 1,
0.2979936, -0.87611, 3.489095, 0, 0.3686275, 1, 1,
0.3015721, 0.08122477, 0.6101586, 0, 0.3647059, 1, 1,
0.3019142, 1.164781, 1.733826, 0, 0.3568628, 1, 1,
0.3031062, -0.3006999, 3.21035, 0, 0.3529412, 1, 1,
0.3040498, 0.05183199, 2.939846, 0, 0.345098, 1, 1,
0.3083514, 1.155476, -0.00711597, 0, 0.3411765, 1, 1,
0.3088574, 0.1502483, 0.579105, 0, 0.3333333, 1, 1,
0.3091319, -1.787687, 1.403208, 0, 0.3294118, 1, 1,
0.3117712, -2.190954, 2.291693, 0, 0.3215686, 1, 1,
0.3118118, -0.8824066, 1.245237, 0, 0.3176471, 1, 1,
0.3136716, 0.7065634, -0.5080937, 0, 0.3098039, 1, 1,
0.3161024, -0.00179752, 0.2920211, 0, 0.3058824, 1, 1,
0.3166355, -1.501389, 3.227249, 0, 0.2980392, 1, 1,
0.3170655, 0.3526484, 1.656622, 0, 0.2901961, 1, 1,
0.321167, -0.2541484, 1.925043, 0, 0.2862745, 1, 1,
0.3220698, 0.4271493, -0.7678735, 0, 0.2784314, 1, 1,
0.325471, 0.1267551, 1.250422, 0, 0.2745098, 1, 1,
0.3257225, -0.02954607, 2.638748, 0, 0.2666667, 1, 1,
0.3271164, -0.4798824, 3.259977, 0, 0.2627451, 1, 1,
0.3333444, 0.7244794, -0.3266963, 0, 0.254902, 1, 1,
0.3370801, 0.218173, 1.580867, 0, 0.2509804, 1, 1,
0.337887, 1.136552, 0.5728797, 0, 0.2431373, 1, 1,
0.3404266, 0.7880127, 1.510476, 0, 0.2392157, 1, 1,
0.3413116, 0.060631, 0.3902837, 0, 0.2313726, 1, 1,
0.3428694, -0.2498044, 3.199012, 0, 0.227451, 1, 1,
0.3456617, 0.1364241, 0.7912562, 0, 0.2196078, 1, 1,
0.3485732, -0.632846, 2.603769, 0, 0.2156863, 1, 1,
0.3533531, -0.5640558, 4.281146, 0, 0.2078431, 1, 1,
0.3555743, -1.252207, 2.096259, 0, 0.2039216, 1, 1,
0.3573839, 0.1296999, 3.129234, 0, 0.1960784, 1, 1,
0.3596369, 0.6190788, -1.065754, 0, 0.1882353, 1, 1,
0.3627112, -1.166345, 1.474005, 0, 0.1843137, 1, 1,
0.3644876, 0.8758603, 1.319434, 0, 0.1764706, 1, 1,
0.3647117, -1.041734, 2.688172, 0, 0.172549, 1, 1,
0.365071, 0.9008768, 0.270113, 0, 0.1647059, 1, 1,
0.3666791, 0.481244, 0.08225615, 0, 0.1607843, 1, 1,
0.3685883, -0.333531, 4.456676, 0, 0.1529412, 1, 1,
0.3688373, 0.9563006, 0.2586325, 0, 0.1490196, 1, 1,
0.3691936, 0.828698, -0.8471255, 0, 0.1411765, 1, 1,
0.3709247, -1.704115, 4.130042, 0, 0.1372549, 1, 1,
0.3738016, 1.202716, 0.7815465, 0, 0.1294118, 1, 1,
0.3740432, -0.3377749, 1.814791, 0, 0.1254902, 1, 1,
0.3777251, -2.946957, 3.379309, 0, 0.1176471, 1, 1,
0.3784768, 1.027779, 1.046315, 0, 0.1137255, 1, 1,
0.3806522, -0.1756022, -0.616362, 0, 0.1058824, 1, 1,
0.3807767, 0.7508865, -1.349457, 0, 0.09803922, 1, 1,
0.3828004, -1.123192, 1.847587, 0, 0.09411765, 1, 1,
0.3852152, -0.2919803, 2.757876, 0, 0.08627451, 1, 1,
0.3874442, 0.3785157, -0.2049014, 0, 0.08235294, 1, 1,
0.3900285, 0.5740692, 0.6316206, 0, 0.07450981, 1, 1,
0.397478, 0.7861513, 3.993798, 0, 0.07058824, 1, 1,
0.3990616, 0.2027941, 2.2584, 0, 0.0627451, 1, 1,
0.4030035, -1.726505, 2.903647, 0, 0.05882353, 1, 1,
0.4046407, -0.04421679, 0.7454742, 0, 0.05098039, 1, 1,
0.4053985, -0.1322534, 2.919297, 0, 0.04705882, 1, 1,
0.4082895, 0.2929489, 0.7037404, 0, 0.03921569, 1, 1,
0.4128295, 0.1192499, 2.109805, 0, 0.03529412, 1, 1,
0.4186068, -0.6785557, 3.098444, 0, 0.02745098, 1, 1,
0.4187481, -1.639465, 1.543169, 0, 0.02352941, 1, 1,
0.4224072, 0.4290017, 2.315892, 0, 0.01568628, 1, 1,
0.4235541, 0.4781394, -0.302425, 0, 0.01176471, 1, 1,
0.4260435, 0.1547645, 1.295606, 0, 0.003921569, 1, 1,
0.4301265, 0.4036018, 2.083124, 0.003921569, 0, 1, 1,
0.4303318, -0.2992656, 1.128017, 0.007843138, 0, 1, 1,
0.4350141, 0.9061304, 2.500545, 0.01568628, 0, 1, 1,
0.4381799, -0.2356797, 2.677966, 0.01960784, 0, 1, 1,
0.4416466, 1.239156, -0.06635412, 0.02745098, 0, 1, 1,
0.4419688, 0.4061221, 1.021381, 0.03137255, 0, 1, 1,
0.4433111, -0.9334916, 3.266105, 0.03921569, 0, 1, 1,
0.4444309, -0.6789392, 3.370286, 0.04313726, 0, 1, 1,
0.4462368, 1.027822, -0.215478, 0.05098039, 0, 1, 1,
0.4572055, -0.3603272, 1.42609, 0.05490196, 0, 1, 1,
0.4646834, -0.6809813, 2.133736, 0.0627451, 0, 1, 1,
0.4700307, 0.2981442, -0.6915109, 0.06666667, 0, 1, 1,
0.4713199, 0.8471693, 0.4619879, 0.07450981, 0, 1, 1,
0.4738855, 0.1151432, 1.016494, 0.07843138, 0, 1, 1,
0.4848951, 0.4711471, 2.223997, 0.08627451, 0, 1, 1,
0.4860529, -0.2013734, 1.159412, 0.09019608, 0, 1, 1,
0.4915099, 0.3892924, 1.235756, 0.09803922, 0, 1, 1,
0.4924218, 0.7538406, -0.3467855, 0.1058824, 0, 1, 1,
0.4933773, 1.176173, -1.154094, 0.1098039, 0, 1, 1,
0.497774, -0.3423874, 2.927029, 0.1176471, 0, 1, 1,
0.4998811, 0.1111279, 1.827668, 0.1215686, 0, 1, 1,
0.5031113, -1.290012, 3.750701, 0.1294118, 0, 1, 1,
0.5037149, 0.7898065, 0.3904656, 0.1333333, 0, 1, 1,
0.5042191, 0.515702, 0.4221636, 0.1411765, 0, 1, 1,
0.5146819, 1.32071, 1.356482, 0.145098, 0, 1, 1,
0.5195474, -0.203956, 0.1132489, 0.1529412, 0, 1, 1,
0.5233636, -0.4339018, 2.399389, 0.1568628, 0, 1, 1,
0.5333813, -0.6095623, 2.427588, 0.1647059, 0, 1, 1,
0.5368689, -1.013756, 3.878041, 0.1686275, 0, 1, 1,
0.5384771, -0.4110337, 1.514195, 0.1764706, 0, 1, 1,
0.5419546, -0.08482391, 0.3958886, 0.1803922, 0, 1, 1,
0.5484974, -0.9507567, 2.739252, 0.1882353, 0, 1, 1,
0.5517772, 1.426541, 0.676403, 0.1921569, 0, 1, 1,
0.5554777, 1.483018, 0.5997415, 0.2, 0, 1, 1,
0.5610209, 1.503231, -0.9011113, 0.2078431, 0, 1, 1,
0.5613119, -0.193452, 4.108014, 0.2117647, 0, 1, 1,
0.5684489, 0.9686028, 1.986815, 0.2196078, 0, 1, 1,
0.5685646, -1.055556, 4.363965, 0.2235294, 0, 1, 1,
0.5736203, 0.4531097, 1.304633, 0.2313726, 0, 1, 1,
0.5740774, 0.7720436, -0.2972642, 0.2352941, 0, 1, 1,
0.5756983, -0.1899112, 3.217832, 0.2431373, 0, 1, 1,
0.5782536, -0.9751012, 1.505904, 0.2470588, 0, 1, 1,
0.5796621, -0.9815239, 3.466974, 0.254902, 0, 1, 1,
0.5807451, -0.08557105, 2.208824, 0.2588235, 0, 1, 1,
0.5819681, -1.071566, 1.434293, 0.2666667, 0, 1, 1,
0.589562, 0.3577327, 0.3578401, 0.2705882, 0, 1, 1,
0.5918602, 1.259416, -0.9106033, 0.2784314, 0, 1, 1,
0.5928404, -1.433307, 2.814218, 0.282353, 0, 1, 1,
0.5966899, -1.031471, 1.227698, 0.2901961, 0, 1, 1,
0.598796, -0.5660238, 2.724491, 0.2941177, 0, 1, 1,
0.6019497, -0.01568376, 1.088533, 0.3019608, 0, 1, 1,
0.6058989, -0.9869524, 2.778255, 0.3098039, 0, 1, 1,
0.6104651, -0.3911091, 3.38986, 0.3137255, 0, 1, 1,
0.6122662, -0.818498, 0.9536316, 0.3215686, 0, 1, 1,
0.6135111, -0.03441228, 0.4974146, 0.3254902, 0, 1, 1,
0.614671, -0.3028788, 2.286982, 0.3333333, 0, 1, 1,
0.616131, -0.6341459, 3.245482, 0.3372549, 0, 1, 1,
0.6182483, 0.2137013, 2.579778, 0.345098, 0, 1, 1,
0.6199239, -1.649514, 2.553381, 0.3490196, 0, 1, 1,
0.6211947, -0.6271002, 2.959575, 0.3568628, 0, 1, 1,
0.6213906, -0.4347759, 1.55024, 0.3607843, 0, 1, 1,
0.6219712, -0.5741072, 1.998665, 0.3686275, 0, 1, 1,
0.6309304, -1.703174, 2.481814, 0.372549, 0, 1, 1,
0.6320428, 1.77121, 0.5482952, 0.3803922, 0, 1, 1,
0.6328778, 0.3161113, -0.4730961, 0.3843137, 0, 1, 1,
0.6442348, -0.7045113, 2.199043, 0.3921569, 0, 1, 1,
0.647572, 1.951836, 0.4937761, 0.3960784, 0, 1, 1,
0.6543819, 0.2188219, 0.4233653, 0.4039216, 0, 1, 1,
0.6589111, -0.03915858, 3.492318, 0.4117647, 0, 1, 1,
0.6618634, 2.640259, -0.09715383, 0.4156863, 0, 1, 1,
0.6626015, 1.305875, 0.9244117, 0.4235294, 0, 1, 1,
0.662897, -2.196838, 2.669725, 0.427451, 0, 1, 1,
0.6631436, -0.5376486, 2.328816, 0.4352941, 0, 1, 1,
0.6641436, 0.2647261, 2.228138, 0.4392157, 0, 1, 1,
0.6681992, -1.274766, 2.018744, 0.4470588, 0, 1, 1,
0.6749884, -0.7459564, 3.092184, 0.4509804, 0, 1, 1,
0.6757988, -0.7199964, 2.882902, 0.4588235, 0, 1, 1,
0.6845536, 0.3348667, 0.9164107, 0.4627451, 0, 1, 1,
0.6879976, 0.5263049, 0.12535, 0.4705882, 0, 1, 1,
0.6886662, -1.317697, 2.073456, 0.4745098, 0, 1, 1,
0.6910028, -1.008269, 1.900814, 0.4823529, 0, 1, 1,
0.6931199, -0.5609284, 2.03929, 0.4862745, 0, 1, 1,
0.6943744, 1.247256, 0.9139903, 0.4941176, 0, 1, 1,
0.6948221, 0.3162228, 3.336802, 0.5019608, 0, 1, 1,
0.697224, 0.9392944, 1.487731, 0.5058824, 0, 1, 1,
0.7022327, -1.248361, 3.077252, 0.5137255, 0, 1, 1,
0.7085555, 0.7530668, 1.300041, 0.5176471, 0, 1, 1,
0.7113124, -0.7648208, 2.760866, 0.5254902, 0, 1, 1,
0.7119293, 0.3081705, 0.9843729, 0.5294118, 0, 1, 1,
0.7131937, -0.07207203, 2.467733, 0.5372549, 0, 1, 1,
0.7274505, -2.488786, 3.298788, 0.5411765, 0, 1, 1,
0.7288479, -1.347868, 4.154629, 0.5490196, 0, 1, 1,
0.7296489, 0.8687165, 1.468045, 0.5529412, 0, 1, 1,
0.7309734, -2.62321, 1.150466, 0.5607843, 0, 1, 1,
0.7311537, -1.078642, 2.956143, 0.5647059, 0, 1, 1,
0.734117, 0.5268296, 1.230529, 0.572549, 0, 1, 1,
0.7362456, 0.6567872, 1.009948, 0.5764706, 0, 1, 1,
0.7375351, -0.8656396, 3.478633, 0.5843138, 0, 1, 1,
0.7389489, 0.6355026, -0.1995725, 0.5882353, 0, 1, 1,
0.739894, 1.160409, 0.9543012, 0.5960785, 0, 1, 1,
0.7407215, -0.3841543, 1.220276, 0.6039216, 0, 1, 1,
0.7409004, -1.529552, 2.604833, 0.6078432, 0, 1, 1,
0.7441489, 1.356734, -0.3500994, 0.6156863, 0, 1, 1,
0.744294, 1.204371, 0.3679871, 0.6196079, 0, 1, 1,
0.7481521, 0.7942868, 1.464712, 0.627451, 0, 1, 1,
0.7516058, -0.337395, 3.335491, 0.6313726, 0, 1, 1,
0.7523121, 0.9446635, 0.1210161, 0.6392157, 0, 1, 1,
0.753368, 1.035032, 0.2620132, 0.6431373, 0, 1, 1,
0.7555513, -1.485518, 2.497574, 0.6509804, 0, 1, 1,
0.7647346, 0.6663144, 1.103094, 0.654902, 0, 1, 1,
0.7717789, -0.5510691, -0.5634964, 0.6627451, 0, 1, 1,
0.7739956, 0.2857511, 0.06311114, 0.6666667, 0, 1, 1,
0.774917, 0.5125427, 1.699259, 0.6745098, 0, 1, 1,
0.7754714, 0.3809916, 0.02271893, 0.6784314, 0, 1, 1,
0.792152, 0.9277266, 1.931404, 0.6862745, 0, 1, 1,
0.8011113, 0.7352159, 1.865472, 0.6901961, 0, 1, 1,
0.801891, -0.3841049, 3.186469, 0.6980392, 0, 1, 1,
0.8038435, -1.04405, 2.979288, 0.7058824, 0, 1, 1,
0.8104655, 0.8415413, 0.9577357, 0.7098039, 0, 1, 1,
0.8119469, 1.035797, 0.3037477, 0.7176471, 0, 1, 1,
0.8214943, 0.5389842, 2.659996, 0.7215686, 0, 1, 1,
0.8527237, -1.065439, 3.125846, 0.7294118, 0, 1, 1,
0.8529536, -0.290971, 4.237488, 0.7333333, 0, 1, 1,
0.8532155, 0.4422215, -0.2148864, 0.7411765, 0, 1, 1,
0.8622741, 1.402149, 0.3469952, 0.7450981, 0, 1, 1,
0.8646536, -0.3658259, 2.216864, 0.7529412, 0, 1, 1,
0.8664141, -0.5014324, 4.021614, 0.7568628, 0, 1, 1,
0.8669853, -0.1405574, 0.3933705, 0.7647059, 0, 1, 1,
0.8688789, 1.096589, 2.003184, 0.7686275, 0, 1, 1,
0.8697466, 0.3504899, 2.27951, 0.7764706, 0, 1, 1,
0.8727716, 1.69093, 0.9029321, 0.7803922, 0, 1, 1,
0.895592, 1.245877, 0.3017567, 0.7882353, 0, 1, 1,
0.899649, 0.2914837, 0.8654648, 0.7921569, 0, 1, 1,
0.9056522, 0.3910099, 1.507083, 0.8, 0, 1, 1,
0.9064291, 0.1614182, 2.464813, 0.8078431, 0, 1, 1,
0.9084828, 0.1490579, 0.4753897, 0.8117647, 0, 1, 1,
0.912447, -0.6633931, 2.118184, 0.8196079, 0, 1, 1,
0.9147965, -2.134895, 3.022701, 0.8235294, 0, 1, 1,
0.9196353, -0.3789237, 0.8937604, 0.8313726, 0, 1, 1,
0.9199963, 1.112437, -0.849621, 0.8352941, 0, 1, 1,
0.9207839, 0.4850917, 0.01534267, 0.8431373, 0, 1, 1,
0.9254601, 0.4962639, 0.4571163, 0.8470588, 0, 1, 1,
0.9264198, 1.246274, -0.03719232, 0.854902, 0, 1, 1,
0.9289444, -0.2127161, 0.5129907, 0.8588235, 0, 1, 1,
0.931217, -0.09800717, 1.564685, 0.8666667, 0, 1, 1,
0.9351646, 1.86708, 0.1792055, 0.8705882, 0, 1, 1,
0.9413164, 0.6460585, 2.610603, 0.8784314, 0, 1, 1,
0.949626, -0.8554693, 5.027884, 0.8823529, 0, 1, 1,
0.9522133, -1.060158, 2.248829, 0.8901961, 0, 1, 1,
0.9548, -0.3917764, 2.880107, 0.8941177, 0, 1, 1,
0.9564376, -0.1651723, 4.517526, 0.9019608, 0, 1, 1,
0.963513, 2.513998, 0.03327567, 0.9098039, 0, 1, 1,
0.9674232, 0.463246, 2.059034, 0.9137255, 0, 1, 1,
0.9674665, 1.074595, 0.2137987, 0.9215686, 0, 1, 1,
0.9734188, 0.9857606, 0.2487808, 0.9254902, 0, 1, 1,
0.9855735, 0.528918, 3.606462, 0.9333333, 0, 1, 1,
0.9870761, -1.138622, 2.495517, 0.9372549, 0, 1, 1,
0.9877017, 1.265164, -0.1782833, 0.945098, 0, 1, 1,
0.987736, 0.7956341, 0.4661652, 0.9490196, 0, 1, 1,
0.9937866, 3.093695, 0.6110893, 0.9568627, 0, 1, 1,
1.001264, 0.8169515, 0.7396697, 0.9607843, 0, 1, 1,
1.00207, 0.6925531, 1.278189, 0.9686275, 0, 1, 1,
1.004426, 0.2416054, -0.9136205, 0.972549, 0, 1, 1,
1.009452, 0.9994394, 1.258826, 0.9803922, 0, 1, 1,
1.014645, -1.601817, 0.9203175, 0.9843137, 0, 1, 1,
1.017702, -1.173375, 2.039278, 0.9921569, 0, 1, 1,
1.018657, -0.01837213, 2.888902, 0.9960784, 0, 1, 1,
1.022501, 2.079881, -0.2120322, 1, 0, 0.9960784, 1,
1.024167, 0.6898038, -0.02522852, 1, 0, 0.9882353, 1,
1.024572, 0.6952726, 0.9352563, 1, 0, 0.9843137, 1,
1.0311, -0.8257644, 1.888943, 1, 0, 0.9764706, 1,
1.033762, 0.9613208, 1.013508, 1, 0, 0.972549, 1,
1.03772, -0.2995563, 1.891611, 1, 0, 0.9647059, 1,
1.042884, -1.380478, 2.357417, 1, 0, 0.9607843, 1,
1.044264, 0.5175986, 0.2886947, 1, 0, 0.9529412, 1,
1.045696, -1.238863, 3.520005, 1, 0, 0.9490196, 1,
1.047015, 1.092476, 1.694425, 1, 0, 0.9411765, 1,
1.050925, -0.3698933, 2.327438, 1, 0, 0.9372549, 1,
1.054196, 0.006494432, 0.7413552, 1, 0, 0.9294118, 1,
1.057654, -0.7941039, 3.54439, 1, 0, 0.9254902, 1,
1.062906, 0.8091046, 1.406837, 1, 0, 0.9176471, 1,
1.064233, 0.7547579, 3.069595, 1, 0, 0.9137255, 1,
1.077245, -0.01159169, 1.729527, 1, 0, 0.9058824, 1,
1.079855, -0.7380215, 2.534993, 1, 0, 0.9019608, 1,
1.09059, -0.9877529, 3.647458, 1, 0, 0.8941177, 1,
1.091758, -0.8993726, 4.042364, 1, 0, 0.8862745, 1,
1.107583, 0.5211896, 0.0280515, 1, 0, 0.8823529, 1,
1.111797, -1.458176, 3.72933, 1, 0, 0.8745098, 1,
1.116998, -0.233728, 0.8790292, 1, 0, 0.8705882, 1,
1.123808, -0.316172, 1.04957, 1, 0, 0.8627451, 1,
1.14004, 0.8168445, 0.6579896, 1, 0, 0.8588235, 1,
1.14441, 0.9247944, 1.026598, 1, 0, 0.8509804, 1,
1.14793, 0.2454089, 1.89463, 1, 0, 0.8470588, 1,
1.148977, -1.187532, 3.17723, 1, 0, 0.8392157, 1,
1.148998, -1.324336, 1.917194, 1, 0, 0.8352941, 1,
1.149643, 1.759612, 1.091049, 1, 0, 0.827451, 1,
1.150851, 1.32446, 0.04119328, 1, 0, 0.8235294, 1,
1.151138, 0.8783727, 2.381631, 1, 0, 0.8156863, 1,
1.153662, 1.67738, 0.5054243, 1, 0, 0.8117647, 1,
1.157668, -1.078706, 2.524047, 1, 0, 0.8039216, 1,
1.161562, 0.5161698, 1.819261, 1, 0, 0.7960784, 1,
1.161743, -0.6197051, 2.849506, 1, 0, 0.7921569, 1,
1.165198, -1.213523, 0.7822901, 1, 0, 0.7843137, 1,
1.187707, -0.04648682, 2.592578, 1, 0, 0.7803922, 1,
1.18883, -0.2711375, 2.461485, 1, 0, 0.772549, 1,
1.190206, 0.5333244, 1.446352, 1, 0, 0.7686275, 1,
1.194938, -0.2027355, -0.221763, 1, 0, 0.7607843, 1,
1.195117, -2.023993, 2.628016, 1, 0, 0.7568628, 1,
1.198992, 0.3501591, 0.1344527, 1, 0, 0.7490196, 1,
1.205674, 0.3976049, 0.9916742, 1, 0, 0.7450981, 1,
1.20914, -0.2850879, 3.188754, 1, 0, 0.7372549, 1,
1.21009, 0.241103, 3.150471, 1, 0, 0.7333333, 1,
1.214909, -0.2200051, 1.506638, 1, 0, 0.7254902, 1,
1.218439, 0.2432981, 1.246525, 1, 0, 0.7215686, 1,
1.218554, -1.850119, 1.649387, 1, 0, 0.7137255, 1,
1.219945, 0.3727808, 2.254459, 1, 0, 0.7098039, 1,
1.230868, 0.6938464, 0.5391015, 1, 0, 0.7019608, 1,
1.237105, 0.08751506, 1.958683, 1, 0, 0.6941177, 1,
1.238317, -0.6835921, 4.580825, 1, 0, 0.6901961, 1,
1.238439, -0.1538343, 2.236772, 1, 0, 0.682353, 1,
1.241477, 1.494287, -0.4694272, 1, 0, 0.6784314, 1,
1.249685, -0.5754862, 1.61185, 1, 0, 0.6705883, 1,
1.250455, 0.2894936, 2.019277, 1, 0, 0.6666667, 1,
1.253325, -0.2664683, 1.142335, 1, 0, 0.6588235, 1,
1.256933, 0.4861888, 1.061294, 1, 0, 0.654902, 1,
1.257632, -1.504043, 2.086478, 1, 0, 0.6470588, 1,
1.260054, -1.865256, 3.175418, 1, 0, 0.6431373, 1,
1.260661, 1.257844, 0.9921142, 1, 0, 0.6352941, 1,
1.267312, 1.151336, 1.047804, 1, 0, 0.6313726, 1,
1.279596, 0.4582893, 1.726492, 1, 0, 0.6235294, 1,
1.289245, -1.032514, 2.6773, 1, 0, 0.6196079, 1,
1.300885, -0.4756338, 1.432356, 1, 0, 0.6117647, 1,
1.306785, -1.932932, 3.530818, 1, 0, 0.6078432, 1,
1.309546, 1.096668, 0.09677969, 1, 0, 0.6, 1,
1.319305, 0.4044581, -1.054219, 1, 0, 0.5921569, 1,
1.322548, 0.2251926, 0.4177692, 1, 0, 0.5882353, 1,
1.324515, 0.2683496, 0.7750904, 1, 0, 0.5803922, 1,
1.332654, -0.3337999, 3.248039, 1, 0, 0.5764706, 1,
1.340728, -0.6169031, 2.684199, 1, 0, 0.5686275, 1,
1.348323, 0.1059498, 2.250297, 1, 0, 0.5647059, 1,
1.358166, 0.5855264, 0.83019, 1, 0, 0.5568628, 1,
1.362354, -0.869267, 3.214996, 1, 0, 0.5529412, 1,
1.36576, 0.1310302, 1.636895, 1, 0, 0.5450981, 1,
1.37336, -1.104898, 3.731646, 1, 0, 0.5411765, 1,
1.376306, -0.7256905, 2.557622, 1, 0, 0.5333334, 1,
1.381197, -0.6419189, 2.367576, 1, 0, 0.5294118, 1,
1.382488, 0.2683376, 2.089479, 1, 0, 0.5215687, 1,
1.388379, -0.02851181, 0.3989687, 1, 0, 0.5176471, 1,
1.390851, -0.7587891, 1.349389, 1, 0, 0.509804, 1,
1.409036, -1.183177, 3.920007, 1, 0, 0.5058824, 1,
1.411099, -0.2404956, 1.535301, 1, 0, 0.4980392, 1,
1.431841, -0.02582219, 0.5467218, 1, 0, 0.4901961, 1,
1.43851, 0.1082287, -0.08681814, 1, 0, 0.4862745, 1,
1.438656, -0.202817, 2.111124, 1, 0, 0.4784314, 1,
1.44092, -1.088824, 2.411478, 1, 0, 0.4745098, 1,
1.441948, 0.00514662, 0.2983494, 1, 0, 0.4666667, 1,
1.446206, -0.07357777, 1.847809, 1, 0, 0.4627451, 1,
1.453869, -1.866157, 2.652763, 1, 0, 0.454902, 1,
1.468221, 0.1645197, 1.835505, 1, 0, 0.4509804, 1,
1.482011, 0.8176379, 1.415589, 1, 0, 0.4431373, 1,
1.490945, -0.1108822, 3.042908, 1, 0, 0.4392157, 1,
1.491408, -0.3401796, 0.6409334, 1, 0, 0.4313726, 1,
1.510271, -0.7950524, 2.635566, 1, 0, 0.427451, 1,
1.516104, -0.6400643, 0.6341264, 1, 0, 0.4196078, 1,
1.525111, -0.7543476, 3.6959, 1, 0, 0.4156863, 1,
1.525995, -0.02703149, 1.720908, 1, 0, 0.4078431, 1,
1.526781, -1.602809, 3.353451, 1, 0, 0.4039216, 1,
1.531634, -2.203901, 2.98295, 1, 0, 0.3960784, 1,
1.534295, -0.211493, 3.50449, 1, 0, 0.3882353, 1,
1.53892, 0.6199447, -1.000612, 1, 0, 0.3843137, 1,
1.544111, -0.7034563, 2.564506, 1, 0, 0.3764706, 1,
1.550009, 1.585461, 0.6746982, 1, 0, 0.372549, 1,
1.551056, 0.9587326, 0.50433, 1, 0, 0.3647059, 1,
1.553134, -2.270523, 3.229394, 1, 0, 0.3607843, 1,
1.558679, 2.04989, 1.084333, 1, 0, 0.3529412, 1,
1.571115, -1.097824, 2.142941, 1, 0, 0.3490196, 1,
1.585866, 2.269883, 1.544519, 1, 0, 0.3411765, 1,
1.591264, 0.5572853, 1.489262, 1, 0, 0.3372549, 1,
1.593153, 0.7669604, 3.706716, 1, 0, 0.3294118, 1,
1.595085, 0.1218884, -0.2233685, 1, 0, 0.3254902, 1,
1.616753, 1.378618, 0.5854445, 1, 0, 0.3176471, 1,
1.634922, -0.2100624, -1.687667, 1, 0, 0.3137255, 1,
1.650293, 1.052158, -0.6309142, 1, 0, 0.3058824, 1,
1.667643, -0.6357374, 1.507549, 1, 0, 0.2980392, 1,
1.67962, 0.9963894, 0.09732321, 1, 0, 0.2941177, 1,
1.687907, 0.1867243, 0.9436384, 1, 0, 0.2862745, 1,
1.692209, 0.4847639, -0.008083055, 1, 0, 0.282353, 1,
1.694754, -0.03868693, 2.354215, 1, 0, 0.2745098, 1,
1.699579, -0.6753733, 2.767393, 1, 0, 0.2705882, 1,
1.707563, -0.6831951, -0.5828561, 1, 0, 0.2627451, 1,
1.716986, -2.225387, 2.386706, 1, 0, 0.2588235, 1,
1.718216, 0.1091265, 0.2876168, 1, 0, 0.2509804, 1,
1.744012, 1.435697, -0.438638, 1, 0, 0.2470588, 1,
1.755937, 0.8937066, 1.530218, 1, 0, 0.2392157, 1,
1.761724, -0.216804, 0.09430944, 1, 0, 0.2352941, 1,
1.786219, 0.1107329, 2.158507, 1, 0, 0.227451, 1,
1.803415, -0.09892149, -0.08554175, 1, 0, 0.2235294, 1,
1.820945, -0.5412275, 1.684579, 1, 0, 0.2156863, 1,
1.843158, 0.3465099, 1.753559, 1, 0, 0.2117647, 1,
1.84401, -0.1331713, 1.525113, 1, 0, 0.2039216, 1,
1.868218, 0.354313, 2.28406, 1, 0, 0.1960784, 1,
1.897459, -1.423052, 2.632073, 1, 0, 0.1921569, 1,
1.911233, 1.03574, 0.7310272, 1, 0, 0.1843137, 1,
1.911888, 0.01583653, 1.801409, 1, 0, 0.1803922, 1,
1.925311, -0.4242026, 1.00996, 1, 0, 0.172549, 1,
1.928686, 0.4732866, 2.501831, 1, 0, 0.1686275, 1,
1.950014, -1.125176, 2.149825, 1, 0, 0.1607843, 1,
1.980624, -0.2454087, -1.084258, 1, 0, 0.1568628, 1,
1.987713, -0.4142895, -0.1530818, 1, 0, 0.1490196, 1,
1.988278, -1.879025, 0.7746722, 1, 0, 0.145098, 1,
2.004176, -0.6919762, 1.9253, 1, 0, 0.1372549, 1,
2.020736, -0.3709549, 2.248248, 1, 0, 0.1333333, 1,
2.034341, -0.2438247, 1.547952, 1, 0, 0.1254902, 1,
2.045571, 0.8888494, -0.5729849, 1, 0, 0.1215686, 1,
2.076876, -1.52337, 1.046846, 1, 0, 0.1137255, 1,
2.090095, 1.012894, 1.000721, 1, 0, 0.1098039, 1,
2.117303, -1.591972, 2.280922, 1, 0, 0.1019608, 1,
2.120301, -0.5988215, 2.403992, 1, 0, 0.09411765, 1,
2.154134, -1.717163, 3.600226, 1, 0, 0.09019608, 1,
2.158807, 1.037361, 2.524627, 1, 0, 0.08235294, 1,
2.18125, 0.649511, 2.287104, 1, 0, 0.07843138, 1,
2.220468, -0.9964488, 0.8393615, 1, 0, 0.07058824, 1,
2.230344, 0.9067471, 1.560861, 1, 0, 0.06666667, 1,
2.337872, 0.03839977, 1.7967, 1, 0, 0.05882353, 1,
2.375371, 0.1680983, 1.845341, 1, 0, 0.05490196, 1,
2.442274, 0.4508395, 1.506653, 1, 0, 0.04705882, 1,
2.444489, -0.02120301, 1.139173, 1, 0, 0.04313726, 1,
2.605006, 0.5981293, -1.27008, 1, 0, 0.03529412, 1,
2.661469, -0.9031118, 1.688534, 1, 0, 0.03137255, 1,
2.843106, -0.5388829, 3.2818, 1, 0, 0.02352941, 1,
2.864197, -0.8398951, 2.096835, 1, 0, 0.01960784, 1,
2.962777, -0.2183933, 2.073738, 1, 0, 0.01176471, 1,
3.397441, 0.002403731, 2.500426, 1, 0, 0.007843138, 1
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
-0.2494485, -4.278487, -7.321972, 0, -0.5, 0.5, 0.5,
-0.2494485, -4.278487, -7.321972, 1, -0.5, 0.5, 0.5,
-0.2494485, -4.278487, -7.321972, 1, 1.5, 0.5, 0.5,
-0.2494485, -4.278487, -7.321972, 0, 1.5, 0.5, 0.5
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
-5.132634, -0.05815697, -7.321972, 0, -0.5, 0.5, 0.5,
-5.132634, -0.05815697, -7.321972, 1, -0.5, 0.5, 0.5,
-5.132634, -0.05815697, -7.321972, 1, 1.5, 0.5, 0.5,
-5.132634, -0.05815697, -7.321972, 0, 1.5, 0.5, 0.5
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
-5.132634, -4.278487, -0.252089, 0, -0.5, 0.5, 0.5,
-5.132634, -4.278487, -0.252089, 1, -0.5, 0.5, 0.5,
-5.132634, -4.278487, -0.252089, 1, 1.5, 0.5, 0.5,
-5.132634, -4.278487, -0.252089, 0, 1.5, 0.5, 0.5
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
-2, -3.304565, -5.690461,
2, -3.304565, -5.690461,
-2, -3.304565, -5.690461,
-2, -3.466885, -5.962379,
0, -3.304565, -5.690461,
0, -3.466885, -5.962379,
2, -3.304565, -5.690461,
2, -3.466885, -5.962379
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
-2, -3.791526, -6.506217, 0, -0.5, 0.5, 0.5,
-2, -3.791526, -6.506217, 1, -0.5, 0.5, 0.5,
-2, -3.791526, -6.506217, 1, 1.5, 0.5, 0.5,
-2, -3.791526, -6.506217, 0, 1.5, 0.5, 0.5,
0, -3.791526, -6.506217, 0, -0.5, 0.5, 0.5,
0, -3.791526, -6.506217, 1, -0.5, 0.5, 0.5,
0, -3.791526, -6.506217, 1, 1.5, 0.5, 0.5,
0, -3.791526, -6.506217, 0, 1.5, 0.5, 0.5,
2, -3.791526, -6.506217, 0, -0.5, 0.5, 0.5,
2, -3.791526, -6.506217, 1, -0.5, 0.5, 0.5,
2, -3.791526, -6.506217, 1, 1.5, 0.5, 0.5,
2, -3.791526, -6.506217, 0, 1.5, 0.5, 0.5
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
-4.005745, -3, -5.690461,
-4.005745, 3, -5.690461,
-4.005745, -3, -5.690461,
-4.19356, -3, -5.962379,
-4.005745, -2, -5.690461,
-4.19356, -2, -5.962379,
-4.005745, -1, -5.690461,
-4.19356, -1, -5.962379,
-4.005745, 0, -5.690461,
-4.19356, 0, -5.962379,
-4.005745, 1, -5.690461,
-4.19356, 1, -5.962379,
-4.005745, 2, -5.690461,
-4.19356, 2, -5.962379,
-4.005745, 3, -5.690461,
-4.19356, 3, -5.962379
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
-4.56919, -3, -6.506217, 0, -0.5, 0.5, 0.5,
-4.56919, -3, -6.506217, 1, -0.5, 0.5, 0.5,
-4.56919, -3, -6.506217, 1, 1.5, 0.5, 0.5,
-4.56919, -3, -6.506217, 0, 1.5, 0.5, 0.5,
-4.56919, -2, -6.506217, 0, -0.5, 0.5, 0.5,
-4.56919, -2, -6.506217, 1, -0.5, 0.5, 0.5,
-4.56919, -2, -6.506217, 1, 1.5, 0.5, 0.5,
-4.56919, -2, -6.506217, 0, 1.5, 0.5, 0.5,
-4.56919, -1, -6.506217, 0, -0.5, 0.5, 0.5,
-4.56919, -1, -6.506217, 1, -0.5, 0.5, 0.5,
-4.56919, -1, -6.506217, 1, 1.5, 0.5, 0.5,
-4.56919, -1, -6.506217, 0, 1.5, 0.5, 0.5,
-4.56919, 0, -6.506217, 0, -0.5, 0.5, 0.5,
-4.56919, 0, -6.506217, 1, -0.5, 0.5, 0.5,
-4.56919, 0, -6.506217, 1, 1.5, 0.5, 0.5,
-4.56919, 0, -6.506217, 0, 1.5, 0.5, 0.5,
-4.56919, 1, -6.506217, 0, -0.5, 0.5, 0.5,
-4.56919, 1, -6.506217, 1, -0.5, 0.5, 0.5,
-4.56919, 1, -6.506217, 1, 1.5, 0.5, 0.5,
-4.56919, 1, -6.506217, 0, 1.5, 0.5, 0.5,
-4.56919, 2, -6.506217, 0, -0.5, 0.5, 0.5,
-4.56919, 2, -6.506217, 1, -0.5, 0.5, 0.5,
-4.56919, 2, -6.506217, 1, 1.5, 0.5, 0.5,
-4.56919, 2, -6.506217, 0, 1.5, 0.5, 0.5,
-4.56919, 3, -6.506217, 0, -0.5, 0.5, 0.5,
-4.56919, 3, -6.506217, 1, -0.5, 0.5, 0.5,
-4.56919, 3, -6.506217, 1, 1.5, 0.5, 0.5,
-4.56919, 3, -6.506217, 0, 1.5, 0.5, 0.5
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
-4.005745, -3.304565, -4,
-4.005745, -3.304565, 4,
-4.005745, -3.304565, -4,
-4.19356, -3.466885, -4,
-4.005745, -3.304565, -2,
-4.19356, -3.466885, -2,
-4.005745, -3.304565, 0,
-4.19356, -3.466885, 0,
-4.005745, -3.304565, 2,
-4.19356, -3.466885, 2,
-4.005745, -3.304565, 4,
-4.19356, -3.466885, 4
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
-4.56919, -3.791526, -4, 0, -0.5, 0.5, 0.5,
-4.56919, -3.791526, -4, 1, -0.5, 0.5, 0.5,
-4.56919, -3.791526, -4, 1, 1.5, 0.5, 0.5,
-4.56919, -3.791526, -4, 0, 1.5, 0.5, 0.5,
-4.56919, -3.791526, -2, 0, -0.5, 0.5, 0.5,
-4.56919, -3.791526, -2, 1, -0.5, 0.5, 0.5,
-4.56919, -3.791526, -2, 1, 1.5, 0.5, 0.5,
-4.56919, -3.791526, -2, 0, 1.5, 0.5, 0.5,
-4.56919, -3.791526, 0, 0, -0.5, 0.5, 0.5,
-4.56919, -3.791526, 0, 1, -0.5, 0.5, 0.5,
-4.56919, -3.791526, 0, 1, 1.5, 0.5, 0.5,
-4.56919, -3.791526, 0, 0, 1.5, 0.5, 0.5,
-4.56919, -3.791526, 2, 0, -0.5, 0.5, 0.5,
-4.56919, -3.791526, 2, 1, -0.5, 0.5, 0.5,
-4.56919, -3.791526, 2, 1, 1.5, 0.5, 0.5,
-4.56919, -3.791526, 2, 0, 1.5, 0.5, 0.5,
-4.56919, -3.791526, 4, 0, -0.5, 0.5, 0.5,
-4.56919, -3.791526, 4, 1, -0.5, 0.5, 0.5,
-4.56919, -3.791526, 4, 1, 1.5, 0.5, 0.5,
-4.56919, -3.791526, 4, 0, 1.5, 0.5, 0.5
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
-4.005745, -3.304565, -5.690461,
-4.005745, 3.188251, -5.690461,
-4.005745, -3.304565, 5.186283,
-4.005745, 3.188251, 5.186283,
-4.005745, -3.304565, -5.690461,
-4.005745, -3.304565, 5.186283,
-4.005745, 3.188251, -5.690461,
-4.005745, 3.188251, 5.186283,
-4.005745, -3.304565, -5.690461,
3.506848, -3.304565, -5.690461,
-4.005745, -3.304565, 5.186283,
3.506848, -3.304565, 5.186283,
-4.005745, 3.188251, -5.690461,
3.506848, 3.188251, -5.690461,
-4.005745, 3.188251, 5.186283,
3.506848, 3.188251, 5.186283,
3.506848, -3.304565, -5.690461,
3.506848, 3.188251, -5.690461,
3.506848, -3.304565, 5.186283,
3.506848, 3.188251, 5.186283,
3.506848, -3.304565, -5.690461,
3.506848, -3.304565, 5.186283,
3.506848, 3.188251, -5.690461,
3.506848, 3.188251, 5.186283
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
var radius = 7.864199;
var distance = 34.98871;
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
mvMatrix.translate( 0.2494485, 0.05815697, 0.252089 );
mvMatrix.scale( 1.131823, 1.30959, 0.7817529 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.98871);
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
tifatol<-read.table("tifatol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tifatol$V2
```

```
## Error in eval(expr, envir, enclos): object 'tifatol' not found
```

```r
y<-tifatol$V3
```

```
## Error in eval(expr, envir, enclos): object 'tifatol' not found
```

```r
z<-tifatol$V4
```

```
## Error in eval(expr, envir, enclos): object 'tifatol' not found
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
-3.896338, 1.709972, -0.6353155, 0, 0, 1, 1, 1,
-3.505437, -0.9950516, -2.124204, 1, 0, 0, 1, 1,
-2.892369, -0.5152304, -1.477759, 1, 0, 0, 1, 1,
-2.805659, -1.126761, -1.30597, 1, 0, 0, 1, 1,
-2.639874, 0.03887957, -2.888563, 1, 0, 0, 1, 1,
-2.551037, -0.8573298, -1.772496, 1, 0, 0, 1, 1,
-2.538405, 0.17305, -1.810416, 0, 0, 0, 1, 1,
-2.537125, -1.228858, -0.2501204, 0, 0, 0, 1, 1,
-2.40237, 1.533277, -1.360506, 0, 0, 0, 1, 1,
-2.359929, -0.09425239, -2.329608, 0, 0, 0, 1, 1,
-2.318388, -1.659076, -0.9621479, 0, 0, 0, 1, 1,
-2.287032, -1.574765, -1.749764, 0, 0, 0, 1, 1,
-2.272503, -0.9478486, -1.906392, 0, 0, 0, 1, 1,
-2.169867, 0.5578088, -1.022656, 1, 1, 1, 1, 1,
-2.147406, 0.9979675, -1.527626, 1, 1, 1, 1, 1,
-2.135775, -1.193642, -5.532062, 1, 1, 1, 1, 1,
-2.105272, -0.0490846, -1.186622, 1, 1, 1, 1, 1,
-2.104144, -0.4336568, -1.769804, 1, 1, 1, 1, 1,
-2.092905, -0.325254, -1.390848, 1, 1, 1, 1, 1,
-2.069601, 0.3463521, -0.1080284, 1, 1, 1, 1, 1,
-2.06685, 0.4543709, -3.450674, 1, 1, 1, 1, 1,
-2.066825, -0.9428393, 0.1570651, 1, 1, 1, 1, 1,
-2.04612, 0.9282621, -1.113877, 1, 1, 1, 1, 1,
-2.01353, -1.882569, -0.5942254, 1, 1, 1, 1, 1,
-2.004718, 0.7059897, 1.107609, 1, 1, 1, 1, 1,
-2.00442, 0.6102945, -1.227299, 1, 1, 1, 1, 1,
-1.990116, 0.1882333, -1.919519, 1, 1, 1, 1, 1,
-1.925745, 1.136077, -2.181693, 1, 1, 1, 1, 1,
-1.915607, 1.29553, -2.437284, 0, 0, 1, 1, 1,
-1.914314, 0.3741075, -1.208082, 1, 0, 0, 1, 1,
-1.893749, 1.926824, -0.3222221, 1, 0, 0, 1, 1,
-1.893652, -1.377118, -2.8064, 1, 0, 0, 1, 1,
-1.875337, 0.2330981, -2.650718, 1, 0, 0, 1, 1,
-1.865787, 1.290189, -1.857435, 1, 0, 0, 1, 1,
-1.824713, 2.790152, -1.215896, 0, 0, 0, 1, 1,
-1.82032, 0.2631868, -2.223276, 0, 0, 0, 1, 1,
-1.811257, 0.6160834, -1.503288, 0, 0, 0, 1, 1,
-1.79515, 0.6784571, -1.45556, 0, 0, 0, 1, 1,
-1.786487, -0.08691023, -3.472204, 0, 0, 0, 1, 1,
-1.784381, 1.629093, -0.4456245, 0, 0, 0, 1, 1,
-1.759296, -0.349908, -1.078134, 0, 0, 0, 1, 1,
-1.73983, -1.053017, -3.360116, 1, 1, 1, 1, 1,
-1.736995, -0.1529493, -0.8733181, 1, 1, 1, 1, 1,
-1.730085, -0.418635, -2.315549, 1, 1, 1, 1, 1,
-1.711482, -1.051645, -3.244642, 1, 1, 1, 1, 1,
-1.691967, 0.1927231, -1.361511, 1, 1, 1, 1, 1,
-1.673423, 0.1481322, -2.15507, 1, 1, 1, 1, 1,
-1.66922, 1.106396, -1.417898, 1, 1, 1, 1, 1,
-1.659771, -2.172733, -1.700383, 1, 1, 1, 1, 1,
-1.656626, 0.4260928, -1.757965, 1, 1, 1, 1, 1,
-1.653834, -0.2281214, -3.22742, 1, 1, 1, 1, 1,
-1.632957, -0.3867887, -0.7893813, 1, 1, 1, 1, 1,
-1.600362, 0.02115487, -2.51, 1, 1, 1, 1, 1,
-1.597295, 0.8891813, 0.9372495, 1, 1, 1, 1, 1,
-1.596802, 2.032859, -1.379723, 1, 1, 1, 1, 1,
-1.59186, 0.008732812, -0.5451422, 1, 1, 1, 1, 1,
-1.574419, 0.3807552, -1.81906, 0, 0, 1, 1, 1,
-1.568987, 0.7785096, -3.902122, 1, 0, 0, 1, 1,
-1.566758, -1.263851, -1.251701, 1, 0, 0, 1, 1,
-1.559678, 1.293256, -1.491008, 1, 0, 0, 1, 1,
-1.55156, -1.041811, -2.24822, 1, 0, 0, 1, 1,
-1.549854, 0.2753077, -1.424764, 1, 0, 0, 1, 1,
-1.547827, 0.05704875, -1.183564, 0, 0, 0, 1, 1,
-1.533841, -1.661263, -1.596168, 0, 0, 0, 1, 1,
-1.533484, 0.1989703, -0.4502784, 0, 0, 0, 1, 1,
-1.524981, -1.62429, -3.740087, 0, 0, 0, 1, 1,
-1.519006, -1.223374, -2.429649, 0, 0, 0, 1, 1,
-1.514672, -0.003438635, -2.526923, 0, 0, 0, 1, 1,
-1.513055, -0.87642, -3.710489, 0, 0, 0, 1, 1,
-1.505788, -0.09554172, -1.786248, 1, 1, 1, 1, 1,
-1.49489, -0.7055665, -1.487177, 1, 1, 1, 1, 1,
-1.494741, 1.202715, -1.131376, 1, 1, 1, 1, 1,
-1.479627, 0.8661737, -2.679035, 1, 1, 1, 1, 1,
-1.466586, 1.28601, -1.198853, 1, 1, 1, 1, 1,
-1.462329, -1.145754, -2.141762, 1, 1, 1, 1, 1,
-1.461647, 2.711118, -0.4223701, 1, 1, 1, 1, 1,
-1.46025, 1.20467, -1.383144, 1, 1, 1, 1, 1,
-1.455494, -1.1903, -3.114832, 1, 1, 1, 1, 1,
-1.454556, 1.161029, 0.5422828, 1, 1, 1, 1, 1,
-1.450782, 1.19679, -0.01728798, 1, 1, 1, 1, 1,
-1.428017, 0.7380166, -1.028406, 1, 1, 1, 1, 1,
-1.423706, -0.5350193, -2.866396, 1, 1, 1, 1, 1,
-1.413262, 0.3175079, -0.1653548, 1, 1, 1, 1, 1,
-1.407081, 0.9816663, -1.105055, 1, 1, 1, 1, 1,
-1.39309, 0.3161851, -0.9245408, 0, 0, 1, 1, 1,
-1.39166, 1.049859, -3.196629, 1, 0, 0, 1, 1,
-1.390882, -0.4022415, -0.2776003, 1, 0, 0, 1, 1,
-1.387645, 0.8345042, -1.003941, 1, 0, 0, 1, 1,
-1.382131, -0.8775394, -4.259362, 1, 0, 0, 1, 1,
-1.380069, -0.3725452, -0.04878541, 1, 0, 0, 1, 1,
-1.372082, -2.105421, -4.303595, 0, 0, 0, 1, 1,
-1.350098, 0.1984566, -2.199635, 0, 0, 0, 1, 1,
-1.34627, 0.3291305, -1.137455, 0, 0, 0, 1, 1,
-1.34502, -1.246633, -3.550051, 0, 0, 0, 1, 1,
-1.343543, 0.1451548, -0.1173931, 0, 0, 0, 1, 1,
-1.333214, -2.010341, -2.120033, 0, 0, 0, 1, 1,
-1.332056, -1.160457, -1.10954, 0, 0, 0, 1, 1,
-1.325748, 0.04535459, -1.901556, 1, 1, 1, 1, 1,
-1.3246, -0.9040602, -1.488741, 1, 1, 1, 1, 1,
-1.317493, 0.7884813, 0.4340256, 1, 1, 1, 1, 1,
-1.312358, -0.3030188, -1.42207, 1, 1, 1, 1, 1,
-1.308178, -0.8947178, -0.7586342, 1, 1, 1, 1, 1,
-1.300939, 1.388226, -0.4443327, 1, 1, 1, 1, 1,
-1.300446, -1.749903, -4.015562, 1, 1, 1, 1, 1,
-1.298615, -0.1726664, -0.9336937, 1, 1, 1, 1, 1,
-1.290439, -0.9060498, -1.89113, 1, 1, 1, 1, 1,
-1.29008, 1.072658, -1.491942, 1, 1, 1, 1, 1,
-1.28061, 0.7058716, -1.092093, 1, 1, 1, 1, 1,
-1.28053, 0.5156021, -0.3211479, 1, 1, 1, 1, 1,
-1.275772, -1.108195, -2.830588, 1, 1, 1, 1, 1,
-1.257433, 1.399299, -2.332528, 1, 1, 1, 1, 1,
-1.250149, -0.8746912, -1.612724, 1, 1, 1, 1, 1,
-1.249448, -1.263195, -3.428333, 0, 0, 1, 1, 1,
-1.239266, -0.1855077, -1.750999, 1, 0, 0, 1, 1,
-1.232191, 0.08084331, -1.332892, 1, 0, 0, 1, 1,
-1.232129, -0.9153444, -3.83123, 1, 0, 0, 1, 1,
-1.227622, -1.061303, -2.86052, 1, 0, 0, 1, 1,
-1.224224, -0.452078, -1.955471, 1, 0, 0, 1, 1,
-1.224223, -0.07232904, -1.557464, 0, 0, 0, 1, 1,
-1.215891, -1.758898, -2.863479, 0, 0, 0, 1, 1,
-1.214994, 0.7178281, -1.605591, 0, 0, 0, 1, 1,
-1.214246, 0.1647165, -3.637185, 0, 0, 0, 1, 1,
-1.210994, -0.7678847, 0.8542376, 0, 0, 0, 1, 1,
-1.195077, 0.1708217, -4.390258, 0, 0, 0, 1, 1,
-1.193223, -0.1902517, -1.018397, 0, 0, 0, 1, 1,
-1.173455, 2.520025, -1.249622, 1, 1, 1, 1, 1,
-1.172921, 0.18061, -0.03481667, 1, 1, 1, 1, 1,
-1.170569, 0.9104282, -1.456548, 1, 1, 1, 1, 1,
-1.153556, -1.914157, -1.231966, 1, 1, 1, 1, 1,
-1.151675, 0.02335711, -1.600793, 1, 1, 1, 1, 1,
-1.138728, 0.8486739, -0.8300107, 1, 1, 1, 1, 1,
-1.136726, 0.06775176, -2.920081, 1, 1, 1, 1, 1,
-1.126617, -0.4698844, -3.756167, 1, 1, 1, 1, 1,
-1.123674, -0.05936489, -1.063283, 1, 1, 1, 1, 1,
-1.12083, -1.616553, -3.275287, 1, 1, 1, 1, 1,
-1.11627, 1.8965, -1.900187, 1, 1, 1, 1, 1,
-1.115046, 1.581753, -0.2388443, 1, 1, 1, 1, 1,
-1.112334, 0.5933973, -0.3276789, 1, 1, 1, 1, 1,
-1.097283, -0.427943, -1.240807, 1, 1, 1, 1, 1,
-1.095586, -0.231932, -1.373517, 1, 1, 1, 1, 1,
-1.093266, 0.6628696, -0.8231801, 0, 0, 1, 1, 1,
-1.087839, -0.1234388, -1.266764, 1, 0, 0, 1, 1,
-1.082908, 0.4693661, -1.239231, 1, 0, 0, 1, 1,
-1.080226, -0.7824295, -0.998001, 1, 0, 0, 1, 1,
-1.074332, 0.5886581, -1.393198, 1, 0, 0, 1, 1,
-1.06645, -0.6110963, -2.390882, 1, 0, 0, 1, 1,
-1.064885, -0.9527624, -0.9074378, 0, 0, 0, 1, 1,
-1.058783, 0.2798094, -1.019138, 0, 0, 0, 1, 1,
-1.056931, 1.953768, -0.003408203, 0, 0, 0, 1, 1,
-1.054842, 0.3065011, -0.4280118, 0, 0, 0, 1, 1,
-1.053808, -0.8789486, -1.210378, 0, 0, 0, 1, 1,
-1.050471, -0.7622156, -1.973208, 0, 0, 0, 1, 1,
-1.046553, 0.2441469, -1.040135, 0, 0, 0, 1, 1,
-1.045909, -0.4192177, -1.398384, 1, 1, 1, 1, 1,
-1.043216, 1.148324, -1.915214, 1, 1, 1, 1, 1,
-1.038715, -0.02180845, -0.9560406, 1, 1, 1, 1, 1,
-1.035592, -1.083955, -3.217938, 1, 1, 1, 1, 1,
-1.031085, -0.8120635, -2.312568, 1, 1, 1, 1, 1,
-1.028316, 0.439347, -0.4970261, 1, 1, 1, 1, 1,
-1.027275, -0.8410591, -1.133101, 1, 1, 1, 1, 1,
-1.017135, -0.8811429, -1.567536, 1, 1, 1, 1, 1,
-1.000301, 0.012194, -3.108492, 1, 1, 1, 1, 1,
-0.9986674, -0.7220483, -2.419041, 1, 1, 1, 1, 1,
-0.9898452, 2.046727, -2.71096, 1, 1, 1, 1, 1,
-0.9870704, -1.482217, -2.48567, 1, 1, 1, 1, 1,
-0.9859905, -0.04868653, 0.9250851, 1, 1, 1, 1, 1,
-0.9852259, 0.3466892, -1.669412, 1, 1, 1, 1, 1,
-0.9851712, -0.2333293, -1.57359, 1, 1, 1, 1, 1,
-0.9835351, 0.07994048, -1.04279, 0, 0, 1, 1, 1,
-0.9831278, -0.3628483, -0.1817279, 1, 0, 0, 1, 1,
-0.9823496, 1.659724, -0.9129983, 1, 0, 0, 1, 1,
-0.9817295, -1.326707, -1.052651, 1, 0, 0, 1, 1,
-0.977977, -0.5028803, -3.796158, 1, 0, 0, 1, 1,
-0.9770929, 0.2179603, -1.670712, 1, 0, 0, 1, 1,
-0.9736792, 0.2527692, -1.587886, 0, 0, 0, 1, 1,
-0.972582, 0.116809, -1.221111, 0, 0, 0, 1, 1,
-0.9706227, -0.08110721, -1.949959, 0, 0, 0, 1, 1,
-0.9626709, 1.639945, 1.293602, 0, 0, 0, 1, 1,
-0.9595363, -0.9843931, -3.139467, 0, 0, 0, 1, 1,
-0.9571321, 0.1833532, -0.827184, 0, 0, 0, 1, 1,
-0.9518015, 0.7066854, -1.678985, 0, 0, 0, 1, 1,
-0.9373292, 0.4644769, -0.9802386, 1, 1, 1, 1, 1,
-0.9239494, -2.371144, -3.057809, 1, 1, 1, 1, 1,
-0.9197823, -0.3864833, -2.737138, 1, 1, 1, 1, 1,
-0.9167804, -1.061278, -1.730644, 1, 1, 1, 1, 1,
-0.9159204, 0.4589814, -0.2741025, 1, 1, 1, 1, 1,
-0.9145124, -0.7791167, -3.262889, 1, 1, 1, 1, 1,
-0.9122428, -1.003252, -4.306024, 1, 1, 1, 1, 1,
-0.9117718, 2.315788, -0.7002283, 1, 1, 1, 1, 1,
-0.9045302, -2.076523, -1.603132, 1, 1, 1, 1, 1,
-0.8964128, -0.4239554, -1.063635, 1, 1, 1, 1, 1,
-0.8927943, -0.4960251, -0.839497, 1, 1, 1, 1, 1,
-0.8860594, 0.8370586, -1.504434, 1, 1, 1, 1, 1,
-0.8836486, -0.332997, -1.182896, 1, 1, 1, 1, 1,
-0.880408, -0.02118431, -1.20095, 1, 1, 1, 1, 1,
-0.8737862, 0.43659, -1.011973, 1, 1, 1, 1, 1,
-0.8716105, -0.4279774, -2.340255, 0, 0, 1, 1, 1,
-0.8672462, 0.6113818, -0.747281, 1, 0, 0, 1, 1,
-0.8634126, 0.2717606, -0.2726477, 1, 0, 0, 1, 1,
-0.8603725, 0.1950583, -0.4408145, 1, 0, 0, 1, 1,
-0.86035, -0.4654982, -1.136405, 1, 0, 0, 1, 1,
-0.8587871, 0.9563439, -0.2457038, 1, 0, 0, 1, 1,
-0.85531, -0.575027, -2.733918, 0, 0, 0, 1, 1,
-0.8399472, 1.342524, -1.81538, 0, 0, 0, 1, 1,
-0.8321041, -1.660191, -1.64057, 0, 0, 0, 1, 1,
-0.8312239, 1.668461, 0.9340007, 0, 0, 0, 1, 1,
-0.830494, -1.024189, -1.611319, 0, 0, 0, 1, 1,
-0.8291202, 0.5125348, -0.5599966, 0, 0, 0, 1, 1,
-0.8289709, 0.1918312, 0.1288976, 0, 0, 0, 1, 1,
-0.8277352, -0.2109465, -1.842761, 1, 1, 1, 1, 1,
-0.8239793, 1.268445, -0.5381536, 1, 1, 1, 1, 1,
-0.8238409, 0.9443921, -0.97681, 1, 1, 1, 1, 1,
-0.8224121, -2.225893, -2.406833, 1, 1, 1, 1, 1,
-0.8203142, 0.004438486, -0.3485895, 1, 1, 1, 1, 1,
-0.8196546, -0.195811, -2.378975, 1, 1, 1, 1, 1,
-0.8038036, -1.689833, -2.65886, 1, 1, 1, 1, 1,
-0.8036583, -0.8837878, -1.300024, 1, 1, 1, 1, 1,
-0.8026815, -2.715105, -2.500154, 1, 1, 1, 1, 1,
-0.792673, -1.211867, -1.81751, 1, 1, 1, 1, 1,
-0.7914706, -0.8125866, -1.943062, 1, 1, 1, 1, 1,
-0.7913214, 0.1267856, -1.180896, 1, 1, 1, 1, 1,
-0.7836195, 1.076066, -0.7763871, 1, 1, 1, 1, 1,
-0.7832482, 1.038744, -0.4778194, 1, 1, 1, 1, 1,
-0.7759922, 1.210222, 1.30581, 1, 1, 1, 1, 1,
-0.7739781, -3.210009, -3.907039, 0, 0, 1, 1, 1,
-0.7691551, -0.5910482, -1.761072, 1, 0, 0, 1, 1,
-0.7678614, 0.8756568, -0.7026034, 1, 0, 0, 1, 1,
-0.7653153, 1.066477, -2.682612, 1, 0, 0, 1, 1,
-0.7613427, -1.248597, -2.269686, 1, 0, 0, 1, 1,
-0.7573237, 0.711418, -0.9957661, 1, 0, 0, 1, 1,
-0.7489942, -0.7480279, -0.5593092, 0, 0, 0, 1, 1,
-0.746716, 1.022879, -1.07171, 0, 0, 0, 1, 1,
-0.7461621, -0.9236811, -1.830461, 0, 0, 0, 1, 1,
-0.7436677, -0.1283298, -1.3928, 0, 0, 0, 1, 1,
-0.742053, -1.554815, -2.73506, 0, 0, 0, 1, 1,
-0.7393197, 0.714317, -0.8565035, 0, 0, 0, 1, 1,
-0.7354339, -0.678073, -2.12841, 0, 0, 0, 1, 1,
-0.7275007, 0.6756756, -2.455771, 1, 1, 1, 1, 1,
-0.7224154, 1.51699, -0.5870983, 1, 1, 1, 1, 1,
-0.7200201, 0.1428197, -0.3843575, 1, 1, 1, 1, 1,
-0.7186252, 0.9065797, -0.5332247, 1, 1, 1, 1, 1,
-0.717463, 1.623049, -1.511977, 1, 1, 1, 1, 1,
-0.716223, 1.66415, -0.09429866, 1, 1, 1, 1, 1,
-0.7142457, -0.7404159, -0.9621255, 1, 1, 1, 1, 1,
-0.7129635, 1.333419, -1.427036, 1, 1, 1, 1, 1,
-0.7085634, 1.290934, 1.327978, 1, 1, 1, 1, 1,
-0.7075648, -0.4908943, -0.9302701, 1, 1, 1, 1, 1,
-0.7065995, -0.8068563, -3.173567, 1, 1, 1, 1, 1,
-0.6990424, 1.951404, -1.512749, 1, 1, 1, 1, 1,
-0.6984125, -0.2881991, -0.3697003, 1, 1, 1, 1, 1,
-0.6807045, -0.4778612, -2.011445, 1, 1, 1, 1, 1,
-0.678443, -0.5459841, -2.340449, 1, 1, 1, 1, 1,
-0.6773809, -0.4456507, -2.16349, 0, 0, 1, 1, 1,
-0.6763151, 1.180021, 0.1767929, 1, 0, 0, 1, 1,
-0.676177, 0.1044609, 0.431474, 1, 0, 0, 1, 1,
-0.6731786, 0.2631143, -2.625564, 1, 0, 0, 1, 1,
-0.6711699, 1.347633, -1.153613, 1, 0, 0, 1, 1,
-0.6637648, -1.499561, -1.744687, 1, 0, 0, 1, 1,
-0.6596227, 0.3118172, -0.3173482, 0, 0, 0, 1, 1,
-0.6570275, 1.176277, -0.8287106, 0, 0, 0, 1, 1,
-0.6501703, -0.367281, -1.00606, 0, 0, 0, 1, 1,
-0.6450374, -0.517388, -3.429702, 0, 0, 0, 1, 1,
-0.6421128, -0.01891838, -1.73395, 0, 0, 0, 1, 1,
-0.6394509, -0.1353386, -1.121873, 0, 0, 0, 1, 1,
-0.6329176, -2.169122, -4.435679, 0, 0, 0, 1, 1,
-0.631934, -0.9966567, -1.927538, 1, 1, 1, 1, 1,
-0.6269059, -1.889884, -1.016921, 1, 1, 1, 1, 1,
-0.6265309, -0.7769236, -3.474916, 1, 1, 1, 1, 1,
-0.6264928, 0.07898474, -2.564396, 1, 1, 1, 1, 1,
-0.6230352, -0.6447375, -2.891166, 1, 1, 1, 1, 1,
-0.6170858, 1.484841, -0.1837794, 1, 1, 1, 1, 1,
-0.6161178, 0.01612104, -2.727619, 1, 1, 1, 1, 1,
-0.61497, -1.724551, -3.346747, 1, 1, 1, 1, 1,
-0.6075267, -1.281021, -3.401747, 1, 1, 1, 1, 1,
-0.6054149, 2.084702, -0.1905771, 1, 1, 1, 1, 1,
-0.6046916, -1.689214, -2.023951, 1, 1, 1, 1, 1,
-0.601595, -0.6886591, -2.027693, 1, 1, 1, 1, 1,
-0.6003851, -0.4072372, -3.019688, 1, 1, 1, 1, 1,
-0.5956571, -0.8296152, -2.169886, 1, 1, 1, 1, 1,
-0.5932396, -0.5491319, -1.797362, 1, 1, 1, 1, 1,
-0.5839668, -0.5342497, -1.60178, 0, 0, 1, 1, 1,
-0.5838145, 1.16951, 0.4851523, 1, 0, 0, 1, 1,
-0.5776981, -0.3058627, -1.603979, 1, 0, 0, 1, 1,
-0.5774569, 0.4090855, -1.090129, 1, 0, 0, 1, 1,
-0.5749743, -0.8954271, -2.111247, 1, 0, 0, 1, 1,
-0.5715743, 0.09836762, -0.8616439, 1, 0, 0, 1, 1,
-0.5624422, -0.5989457, -3.381902, 0, 0, 0, 1, 1,
-0.552901, -0.6844408, -2.62108, 0, 0, 0, 1, 1,
-0.54959, -0.3045678, -0.7588858, 0, 0, 0, 1, 1,
-0.5485409, 0.4431539, -0.611922, 0, 0, 0, 1, 1,
-0.5465347, -1.476617, -1.975964, 0, 0, 0, 1, 1,
-0.5360839, -1.178388, -2.118336, 0, 0, 0, 1, 1,
-0.5357891, 0.1234849, -2.591259, 0, 0, 0, 1, 1,
-0.5335249, -0.3296847, -1.573386, 1, 1, 1, 1, 1,
-0.5232862, 0.07927813, -2.904505, 1, 1, 1, 1, 1,
-0.5209394, 0.8919768, -1.565864, 1, 1, 1, 1, 1,
-0.5191327, -0.7697954, -3.301357, 1, 1, 1, 1, 1,
-0.5149736, -0.880281, -1.65957, 1, 1, 1, 1, 1,
-0.5115808, -0.2737334, -0.8997562, 1, 1, 1, 1, 1,
-0.5090671, -1.346512, -2.589144, 1, 1, 1, 1, 1,
-0.5085017, 1.125652, -1.343002, 1, 1, 1, 1, 1,
-0.5059671, 0.0931493, -1.368092, 1, 1, 1, 1, 1,
-0.505335, 1.83303, -0.0674393, 1, 1, 1, 1, 1,
-0.5021197, -0.3804084, -2.937121, 1, 1, 1, 1, 1,
-0.5019987, 0.4130036, -0.5541244, 1, 1, 1, 1, 1,
-0.5009072, -1.40816, -4.541195, 1, 1, 1, 1, 1,
-0.4986617, -0.7620627, -1.763605, 1, 1, 1, 1, 1,
-0.4955763, -0.04155108, -0.5140521, 1, 1, 1, 1, 1,
-0.4922773, -0.2747883, -4.711295, 0, 0, 1, 1, 1,
-0.4908416, -1.879223, -4.005634, 1, 0, 0, 1, 1,
-0.490285, -0.6097121, -2.106233, 1, 0, 0, 1, 1,
-0.4886971, 0.7098426, -0.3792741, 1, 0, 0, 1, 1,
-0.4830707, -0.3976044, -1.224154, 1, 0, 0, 1, 1,
-0.4780947, -1.057943, -2.351293, 1, 0, 0, 1, 1,
-0.4742149, 1.478867, -0.9420024, 0, 0, 0, 1, 1,
-0.4720028, -0.9595953, -3.759423, 0, 0, 0, 1, 1,
-0.4712163, 0.9728023, 0.7187614, 0, 0, 0, 1, 1,
-0.4709939, 1.41058, -0.5522605, 0, 0, 0, 1, 1,
-0.4695077, 0.8124892, 0.1429121, 0, 0, 0, 1, 1,
-0.4662922, 0.7340315, -0.8938975, 0, 0, 0, 1, 1,
-0.4641303, 1.0127, -1.063208, 0, 0, 0, 1, 1,
-0.4639862, -1.502536, -2.257265, 1, 1, 1, 1, 1,
-0.4630109, 0.4343576, -0.3466817, 1, 1, 1, 1, 1,
-0.4608963, 0.01778514, -0.4366291, 1, 1, 1, 1, 1,
-0.4487766, -1.078956, -4.197811, 1, 1, 1, 1, 1,
-0.4474512, -0.5002475, -3.027563, 1, 1, 1, 1, 1,
-0.4443874, 0.4686465, -0.6549164, 1, 1, 1, 1, 1,
-0.4431015, -1.261409, -2.451015, 1, 1, 1, 1, 1,
-0.4417009, 0.7596796, -0.7889943, 1, 1, 1, 1, 1,
-0.4393878, -0.505282, -2.340674, 1, 1, 1, 1, 1,
-0.4361858, 1.833894, -2.597651, 1, 1, 1, 1, 1,
-0.4341314, 0.1712216, -2.037549, 1, 1, 1, 1, 1,
-0.4336866, -0.6170352, -1.098431, 1, 1, 1, 1, 1,
-0.4292701, 1.486629, 0.7453091, 1, 1, 1, 1, 1,
-0.4281664, 0.7027695, -0.7217032, 1, 1, 1, 1, 1,
-0.4248825, -0.9950668, -1.819764, 1, 1, 1, 1, 1,
-0.4235054, -0.7961898, -1.447378, 0, 0, 1, 1, 1,
-0.4231234, 0.6429953, -0.7244956, 1, 0, 0, 1, 1,
-0.4193694, -0.2904205, -2.293992, 1, 0, 0, 1, 1,
-0.4174714, -0.5164407, -2.645159, 1, 0, 0, 1, 1,
-0.4153099, 0.06113869, -1.91501, 1, 0, 0, 1, 1,
-0.4045165, -1.43326, -3.84942, 1, 0, 0, 1, 1,
-0.4040653, 0.2925642, -1.540819, 0, 0, 0, 1, 1,
-0.3947155, -0.09951629, -2.333626, 0, 0, 0, 1, 1,
-0.3940152, 1.375834, 0.6561962, 0, 0, 0, 1, 1,
-0.3937957, -0.7447836, -3.403774, 0, 0, 0, 1, 1,
-0.3913741, -0.6768751, -1.884311, 0, 0, 0, 1, 1,
-0.391279, -0.7328053, -1.793692, 0, 0, 0, 1, 1,
-0.3882409, 0.3073972, 0.2622861, 0, 0, 0, 1, 1,
-0.3874812, -0.1911611, -1.627396, 1, 1, 1, 1, 1,
-0.3872767, -0.4938436, -2.486799, 1, 1, 1, 1, 1,
-0.3854175, -0.496574, -1.748698, 1, 1, 1, 1, 1,
-0.3844329, 0.3500613, -1.486013, 1, 1, 1, 1, 1,
-0.3835611, -0.354588, -2.391833, 1, 1, 1, 1, 1,
-0.3801553, -0.8290076, -3.569935, 1, 1, 1, 1, 1,
-0.3776425, 0.1639256, -0.1376485, 1, 1, 1, 1, 1,
-0.3747705, -0.07537927, -0.208029, 1, 1, 1, 1, 1,
-0.3744819, -0.6729661, -1.718231, 1, 1, 1, 1, 1,
-0.3718057, -0.5321837, -1.05583, 1, 1, 1, 1, 1,
-0.3702918, 0.642121, -0.8245008, 1, 1, 1, 1, 1,
-0.3701504, -1.989339, -2.057386, 1, 1, 1, 1, 1,
-0.3695531, -1.627093, -1.496316, 1, 1, 1, 1, 1,
-0.3693343, 0.8141583, 0.8067212, 1, 1, 1, 1, 1,
-0.3656353, -0.007042066, -0.9052014, 1, 1, 1, 1, 1,
-0.3559086, -0.04434901, -2.52547, 0, 0, 1, 1, 1,
-0.3555185, 1.011013, -1.285655, 1, 0, 0, 1, 1,
-0.3544221, -1.125808, -3.283591, 1, 0, 0, 1, 1,
-0.3536521, -1.015023, -0.927572, 1, 0, 0, 1, 1,
-0.3485746, 0.6943784, -0.6989725, 1, 0, 0, 1, 1,
-0.3485379, -2.376057, -1.903347, 1, 0, 0, 1, 1,
-0.3461097, 0.209778, -2.06726, 0, 0, 0, 1, 1,
-0.3413666, -0.2126096, -1.545721, 0, 0, 0, 1, 1,
-0.3407816, -0.9226195, -3.587029, 0, 0, 0, 1, 1,
-0.3406509, 1.399169, -1.985493, 0, 0, 0, 1, 1,
-0.3331751, -0.7920261, -2.834152, 0, 0, 0, 1, 1,
-0.3294616, -0.5627163, -0.3085271, 0, 0, 0, 1, 1,
-0.3270066, 0.04196702, 0.9940521, 0, 0, 0, 1, 1,
-0.326813, -0.5432864, -2.890526, 1, 1, 1, 1, 1,
-0.3258415, 0.7114119, -0.7356197, 1, 1, 1, 1, 1,
-0.325641, -1.672122, -2.894654, 1, 1, 1, 1, 1,
-0.3255276, 0.2674746, -1.697317, 1, 1, 1, 1, 1,
-0.3214847, 0.2779317, 0.446112, 1, 1, 1, 1, 1,
-0.3163923, -1.053414, -4.361216, 1, 1, 1, 1, 1,
-0.316309, 1.828475, 1.085433, 1, 1, 1, 1, 1,
-0.3153335, -1.887263, -3.316982, 1, 1, 1, 1, 1,
-0.314667, -0.7078449, -1.490227, 1, 1, 1, 1, 1,
-0.3140267, -0.9631683, -2.503057, 1, 1, 1, 1, 1,
-0.3122213, -0.05676946, -2.792326, 1, 1, 1, 1, 1,
-0.3103901, -0.4696405, -2.214123, 1, 1, 1, 1, 1,
-0.3087315, -0.4767319, -2.196772, 1, 1, 1, 1, 1,
-0.3048331, 0.5834087, 0.5272683, 1, 1, 1, 1, 1,
-0.3025416, -1.094279, -2.623162, 1, 1, 1, 1, 1,
-0.3025407, 0.2615164, -0.760789, 0, 0, 1, 1, 1,
-0.3022442, -0.9327732, -2.116678, 1, 0, 0, 1, 1,
-0.3018229, -0.6019344, -3.791809, 1, 0, 0, 1, 1,
-0.2959309, -1.37556, -2.33122, 1, 0, 0, 1, 1,
-0.2941825, -0.2715114, -2.596443, 1, 0, 0, 1, 1,
-0.2929233, 1.361556, 0.4228784, 1, 0, 0, 1, 1,
-0.2926533, -1.807872, -3.120794, 0, 0, 0, 1, 1,
-0.2921535, -1.170147, -3.79838, 0, 0, 0, 1, 1,
-0.2864585, -0.1334274, -1.680436, 0, 0, 0, 1, 1,
-0.2837437, -2.370924, -3.769639, 0, 0, 0, 1, 1,
-0.2774988, -0.4816186, -3.335169, 0, 0, 0, 1, 1,
-0.2767877, 0.6056094, 0.4378845, 0, 0, 0, 1, 1,
-0.2705937, 0.2984713, -1.108642, 0, 0, 0, 1, 1,
-0.2659161, -0.6181034, -0.7607558, 1, 1, 1, 1, 1,
-0.2634612, 0.5029842, 2.23502, 1, 1, 1, 1, 1,
-0.2617429, 0.007569335, -1.154114, 1, 1, 1, 1, 1,
-0.2578225, -0.8165655, -3.539288, 1, 1, 1, 1, 1,
-0.2556585, 0.419467, -1.197188, 1, 1, 1, 1, 1,
-0.2547535, -0.3641989, -2.867748, 1, 1, 1, 1, 1,
-0.2542881, -1.605029, -1.335321, 1, 1, 1, 1, 1,
-0.2535842, -0.3330983, -3.369755, 1, 1, 1, 1, 1,
-0.2528331, -0.02369908, -2.912489, 1, 1, 1, 1, 1,
-0.2524425, -1.130148, -1.194567, 1, 1, 1, 1, 1,
-0.2518511, 0.4530157, -1.246729, 1, 1, 1, 1, 1,
-0.2502078, 0.9869228, 1.826705, 1, 1, 1, 1, 1,
-0.2449372, -0.2471093, -2.642584, 1, 1, 1, 1, 1,
-0.2441609, 1.059171, -0.1142019, 1, 1, 1, 1, 1,
-0.2440962, 0.3560219, 0.5850812, 1, 1, 1, 1, 1,
-0.2340638, 0.03311785, -1.446282, 0, 0, 1, 1, 1,
-0.2333255, -0.03296577, -2.205899, 1, 0, 0, 1, 1,
-0.2280929, 0.3847649, -1.389893, 1, 0, 0, 1, 1,
-0.2278674, 2.019691, 0.9463612, 1, 0, 0, 1, 1,
-0.2253774, -1.53995, -2.474529, 1, 0, 0, 1, 1,
-0.2160533, -1.780478, -5.055749, 1, 0, 0, 1, 1,
-0.2140168, -0.582442, -2.019734, 0, 0, 0, 1, 1,
-0.2107164, -2.731362, -2.752803, 0, 0, 0, 1, 1,
-0.2094567, 0.6765117, -0.2644618, 0, 0, 0, 1, 1,
-0.1987618, -0.085214, -4.050991, 0, 0, 0, 1, 1,
-0.195889, -0.2521813, -2.051428, 0, 0, 0, 1, 1,
-0.1921451, 0.456718, -0.5840194, 0, 0, 0, 1, 1,
-0.1815137, 0.6104682, 0.2786463, 0, 0, 0, 1, 1,
-0.1811709, 0.6290534, -0.2847528, 1, 1, 1, 1, 1,
-0.1779804, 0.5249866, -0.4685637, 1, 1, 1, 1, 1,
-0.1766961, -0.6423203, -2.814441, 1, 1, 1, 1, 1,
-0.169852, 1.951067, 1.66624, 1, 1, 1, 1, 1,
-0.1554045, -0.9265888, -3.220933, 1, 1, 1, 1, 1,
-0.1525565, 0.1909701, 1.685314, 1, 1, 1, 1, 1,
-0.1503191, -1.306738, -1.846072, 1, 1, 1, 1, 1,
-0.1453306, -0.2201292, -2.036987, 1, 1, 1, 1, 1,
-0.1451939, -0.4638922, -4.350396, 1, 1, 1, 1, 1,
-0.144067, -0.1235457, -0.7927139, 1, 1, 1, 1, 1,
-0.1434338, -0.5234009, -2.973362, 1, 1, 1, 1, 1,
-0.1432868, 1.381952, -0.6934636, 1, 1, 1, 1, 1,
-0.1418667, 0.3413915, -1.885671, 1, 1, 1, 1, 1,
-0.1410219, 0.0575565, -1.572885, 1, 1, 1, 1, 1,
-0.1388976, 0.5615906, 0.8787071, 1, 1, 1, 1, 1,
-0.1372069, 0.2360411, -0.203625, 0, 0, 1, 1, 1,
-0.1353144, -1.958694, -4.830687, 1, 0, 0, 1, 1,
-0.1319953, -0.1706219, -3.072139, 1, 0, 0, 1, 1,
-0.1312266, -0.7901629, -2.976601, 1, 0, 0, 1, 1,
-0.1248687, 0.276502, -0.0399351, 1, 0, 0, 1, 1,
-0.1247384, 0.4167809, -0.03897984, 1, 0, 0, 1, 1,
-0.1205866, 1.7217, 0.650273, 0, 0, 0, 1, 1,
-0.1165234, 0.2066758, 0.9104135, 0, 0, 0, 1, 1,
-0.1163072, 1.73258, -0.3802387, 0, 0, 0, 1, 1,
-0.1127524, 0.08065454, -0.335629, 0, 0, 0, 1, 1,
-0.11197, 0.04613562, -0.8917752, 0, 0, 0, 1, 1,
-0.1115098, -2.31326, -3.479918, 0, 0, 0, 1, 1,
-0.1077838, -0.02749434, -2.373245, 0, 0, 0, 1, 1,
-0.107468, -0.1074023, -0.8396025, 1, 1, 1, 1, 1,
-0.10226, -0.8588965, -2.484347, 1, 1, 1, 1, 1,
-0.1006934, 1.778309, -0.2450404, 1, 1, 1, 1, 1,
-0.100684, 0.4538802, 0.384824, 1, 1, 1, 1, 1,
-0.09366516, 0.7610174, -1.160064, 1, 1, 1, 1, 1,
-0.09054739, 0.5588835, 1.476962, 1, 1, 1, 1, 1,
-0.0893786, -0.00320368, -2.438545, 1, 1, 1, 1, 1,
-0.08793542, -0.1320004, -2.92688, 1, 1, 1, 1, 1,
-0.08672953, 1.09074, -1.308566, 1, 1, 1, 1, 1,
-0.08449577, -0.2224797, -1.448531, 1, 1, 1, 1, 1,
-0.08258886, 0.7420231, 0.6320895, 1, 1, 1, 1, 1,
-0.07622482, 1.285741, -0.8914979, 1, 1, 1, 1, 1,
-0.0664318, 1.977852, -1.420582, 1, 1, 1, 1, 1,
-0.06276881, 0.126287, -1.531749, 1, 1, 1, 1, 1,
-0.05500112, -0.6231936, -4.139778, 1, 1, 1, 1, 1,
-0.05486074, -0.6872807, -3.532168, 0, 0, 1, 1, 1,
-0.0523303, 1.044511, -0.3450921, 1, 0, 0, 1, 1,
-0.05130878, -0.6776303, -1.489233, 1, 0, 0, 1, 1,
-0.04930295, -0.1001883, -1.814206, 1, 0, 0, 1, 1,
-0.04724968, -0.3319256, -3.480832, 1, 0, 0, 1, 1,
-0.04505666, -0.27526, -3.326044, 1, 0, 0, 1, 1,
-0.03907842, -0.4590077, -1.928494, 0, 0, 0, 1, 1,
-0.03665068, -0.08795594, -2.79581, 0, 0, 0, 1, 1,
-0.03437132, -1.875542, -2.521454, 0, 0, 0, 1, 1,
-0.03371721, 1.03667, -0.9199339, 0, 0, 0, 1, 1,
-0.02748113, -0.504685, -4.034278, 0, 0, 0, 1, 1,
-0.02211811, -0.577864, -3.799585, 0, 0, 0, 1, 1,
-0.01992615, -1.703787, -2.997162, 0, 0, 0, 1, 1,
-0.01853677, 0.00802729, -1.58597, 1, 1, 1, 1, 1,
-0.01832622, -0.6056924, -1.26466, 1, 1, 1, 1, 1,
-0.01502272, -1.422559, -3.30314, 1, 1, 1, 1, 1,
-0.01439998, 0.3795436, 0.752074, 1, 1, 1, 1, 1,
-0.01353139, 0.5971142, -1.240971, 1, 1, 1, 1, 1,
-0.01194865, 0.3504831, -2.563808, 1, 1, 1, 1, 1,
-0.01035151, -0.05301226, -2.502208, 1, 1, 1, 1, 1,
-0.006180825, 1.284335, 1.646816, 1, 1, 1, 1, 1,
-0.00543466, 0.841657, 0.5191435, 1, 1, 1, 1, 1,
-0.002762541, 0.5549577, 1.584165, 1, 1, 1, 1, 1,
0.00066292, -0.03341492, 1.949824, 1, 1, 1, 1, 1,
0.002438306, -1.322942, 1.834277, 1, 1, 1, 1, 1,
0.01025662, 1.049499, -0.4505124, 1, 1, 1, 1, 1,
0.0144634, 0.2759018, -0.3997664, 1, 1, 1, 1, 1,
0.01567524, 0.1007172, 1.359381, 1, 1, 1, 1, 1,
0.01607252, 0.2495893, -1.65297, 0, 0, 1, 1, 1,
0.01694222, -0.2373872, 3.855518, 1, 0, 0, 1, 1,
0.02030096, 0.0561329, -0.8366911, 1, 0, 0, 1, 1,
0.02131493, 0.8417546, 1.213431, 1, 0, 0, 1, 1,
0.0300333, -0.558517, 4.214488, 1, 0, 0, 1, 1,
0.03117677, -0.9692932, 3.606618, 1, 0, 0, 1, 1,
0.03163198, 0.1467308, -0.1764224, 0, 0, 0, 1, 1,
0.03495521, -1.199885, 3.911816, 0, 0, 0, 1, 1,
0.04098812, -0.7723061, 1.158592, 0, 0, 0, 1, 1,
0.0439349, -0.9130092, 3.566417, 0, 0, 0, 1, 1,
0.04763677, 0.9545017, 0.3676221, 0, 0, 0, 1, 1,
0.05072181, 0.02945846, 1.11167, 0, 0, 0, 1, 1,
0.05130876, 0.7346547, 0.02589212, 0, 0, 0, 1, 1,
0.05324081, 0.8977408, 0.9142649, 1, 1, 1, 1, 1,
0.05458859, -0.7166743, 3.831319, 1, 1, 1, 1, 1,
0.06165443, 1.071226, 0.496407, 1, 1, 1, 1, 1,
0.06298348, -0.9731123, 2.93786, 1, 1, 1, 1, 1,
0.07657929, 1.656305, -0.4817256, 1, 1, 1, 1, 1,
0.08513763, 0.4105092, 1.102241, 1, 1, 1, 1, 1,
0.09250434, -0.07449956, 2.690218, 1, 1, 1, 1, 1,
0.09328032, 0.6888443, -0.1143258, 1, 1, 1, 1, 1,
0.09352224, -0.5362831, 2.077443, 1, 1, 1, 1, 1,
0.09504696, -1.536741, 3.531373, 1, 1, 1, 1, 1,
0.09564874, -1.428091, 2.202461, 1, 1, 1, 1, 1,
0.09797799, 0.9648054, 1.832809, 1, 1, 1, 1, 1,
0.1061922, 1.714453, -1.198898, 1, 1, 1, 1, 1,
0.1129854, -0.385513, 1.877894, 1, 1, 1, 1, 1,
0.1129865, -0.1548087, 2.32917, 1, 1, 1, 1, 1,
0.1172328, 0.7497681, 0.1120922, 0, 0, 1, 1, 1,
0.118628, 1.773857, -0.2502317, 1, 0, 0, 1, 1,
0.1186716, 0.8527265, -1.959725, 1, 0, 0, 1, 1,
0.127839, -0.4306259, 2.422663, 1, 0, 0, 1, 1,
0.1279287, -0.575322, 3.433902, 1, 0, 0, 1, 1,
0.1281128, -2.682983, 2.031496, 1, 0, 0, 1, 1,
0.1312799, 1.534303, 0.9549673, 0, 0, 0, 1, 1,
0.1323907, 1.784158, -0.2113799, 0, 0, 0, 1, 1,
0.1327688, 0.9775284, 0.3404135, 0, 0, 0, 1, 1,
0.1329775, 0.2199428, 1.509337, 0, 0, 0, 1, 1,
0.1363832, 0.1121163, 2.62438, 0, 0, 0, 1, 1,
0.1406444, -0.4920239, 1.226009, 0, 0, 0, 1, 1,
0.1433384, 1.389807, -2.080528, 0, 0, 0, 1, 1,
0.1433857, -0.7561119, 4.618523, 1, 1, 1, 1, 1,
0.1476277, 0.1936586, 2.255632, 1, 1, 1, 1, 1,
0.1481176, -0.7457855, 3.603063, 1, 1, 1, 1, 1,
0.1533236, 1.221949, 0.9884271, 1, 1, 1, 1, 1,
0.1558322, 0.8629327, 0.09051344, 1, 1, 1, 1, 1,
0.1560127, -0.4390952, 2.660819, 1, 1, 1, 1, 1,
0.1594882, 0.9938763, 0.7539024, 1, 1, 1, 1, 1,
0.1638193, 0.8261406, 1.43956, 1, 1, 1, 1, 1,
0.1649864, 0.1198767, -1.206688, 1, 1, 1, 1, 1,
0.1723078, -0.8198574, 2.187633, 1, 1, 1, 1, 1,
0.178644, -1.450574, 1.676721, 1, 1, 1, 1, 1,
0.1794026, 0.1854592, -1.299297, 1, 1, 1, 1, 1,
0.1820007, -0.4105849, 4.479077, 1, 1, 1, 1, 1,
0.1828372, 0.1235846, 1.754992, 1, 1, 1, 1, 1,
0.1831408, 0.6391838, 0.3612669, 1, 1, 1, 1, 1,
0.1839993, -1.031478, 4.146743, 0, 0, 1, 1, 1,
0.1899214, 1.384155, -0.6142249, 1, 0, 0, 1, 1,
0.1938679, 0.697837, 1.268573, 1, 0, 0, 1, 1,
0.1958182, 1.183883, 1.399385, 1, 0, 0, 1, 1,
0.1967939, 0.6189222, 1.166025, 1, 0, 0, 1, 1,
0.2003278, -0.2363738, 1.774055, 1, 0, 0, 1, 1,
0.2008075, 0.8624936, 0.7458437, 0, 0, 0, 1, 1,
0.2017314, 0.7111415, 0.7775286, 0, 0, 0, 1, 1,
0.2045951, 1.384106, -0.3473865, 0, 0, 0, 1, 1,
0.2046801, -0.8360501, 2.531075, 0, 0, 0, 1, 1,
0.2101639, 0.1157164, 3.317638, 0, 0, 0, 1, 1,
0.2159093, 1.061985, 0.5113862, 0, 0, 0, 1, 1,
0.2177999, -0.5584816, 1.825223, 0, 0, 0, 1, 1,
0.2178791, 0.5013759, -1.984793, 1, 1, 1, 1, 1,
0.2229352, -0.5460552, 2.103712, 1, 1, 1, 1, 1,
0.2274956, 0.729154, 1.932001, 1, 1, 1, 1, 1,
0.228795, -0.1431853, 2.302517, 1, 1, 1, 1, 1,
0.2330054, 1.375158, 0.09703721, 1, 1, 1, 1, 1,
0.2332048, 1.122333, 0.6923147, 1, 1, 1, 1, 1,
0.2366252, -0.4445393, 2.486309, 1, 1, 1, 1, 1,
0.2381231, -1.555087, 2.894214, 1, 1, 1, 1, 1,
0.2402761, -2.027991, 1.049265, 1, 1, 1, 1, 1,
0.2502691, -1.136653, 3.713337, 1, 1, 1, 1, 1,
0.2555869, 0.6058291, 0.7082164, 1, 1, 1, 1, 1,
0.2571523, 0.5788134, 0.5057049, 1, 1, 1, 1, 1,
0.257615, -0.8435548, 1.670619, 1, 1, 1, 1, 1,
0.2578347, -0.2828991, 4.216218, 1, 1, 1, 1, 1,
0.2599724, -0.3809305, 3.646215, 1, 1, 1, 1, 1,
0.2622767, 0.1163171, 1.837716, 0, 0, 1, 1, 1,
0.2647569, 0.2323047, 1.485819, 1, 0, 0, 1, 1,
0.2663547, -1.523433, 2.663053, 1, 0, 0, 1, 1,
0.2665366, -0.4425021, 1.007449, 1, 0, 0, 1, 1,
0.269063, -0.08597943, 0.2735617, 1, 0, 0, 1, 1,
0.2744004, 0.4821817, 0.1354764, 1, 0, 0, 1, 1,
0.2750874, 0.9273224, 0.8330136, 0, 0, 0, 1, 1,
0.2764205, -0.66383, 2.969869, 0, 0, 0, 1, 1,
0.2776116, 0.1904619, 3.973565, 0, 0, 0, 1, 1,
0.2781874, 0.1233679, 0.8440241, 0, 0, 0, 1, 1,
0.2802809, -0.2785511, 1.437434, 0, 0, 0, 1, 1,
0.2819841, -1.7834, 3.675091, 0, 0, 0, 1, 1,
0.2824791, 1.288238, 0.4340112, 0, 0, 0, 1, 1,
0.2840683, 1.763134, -0.5644222, 1, 1, 1, 1, 1,
0.2892326, 0.8351229, 0.005143157, 1, 1, 1, 1, 1,
0.2914699, 1.38703, 0.05242017, 1, 1, 1, 1, 1,
0.2971012, -0.7309159, 2.362549, 1, 1, 1, 1, 1,
0.2979936, -0.87611, 3.489095, 1, 1, 1, 1, 1,
0.3015721, 0.08122477, 0.6101586, 1, 1, 1, 1, 1,
0.3019142, 1.164781, 1.733826, 1, 1, 1, 1, 1,
0.3031062, -0.3006999, 3.21035, 1, 1, 1, 1, 1,
0.3040498, 0.05183199, 2.939846, 1, 1, 1, 1, 1,
0.3083514, 1.155476, -0.00711597, 1, 1, 1, 1, 1,
0.3088574, 0.1502483, 0.579105, 1, 1, 1, 1, 1,
0.3091319, -1.787687, 1.403208, 1, 1, 1, 1, 1,
0.3117712, -2.190954, 2.291693, 1, 1, 1, 1, 1,
0.3118118, -0.8824066, 1.245237, 1, 1, 1, 1, 1,
0.3136716, 0.7065634, -0.5080937, 1, 1, 1, 1, 1,
0.3161024, -0.00179752, 0.2920211, 0, 0, 1, 1, 1,
0.3166355, -1.501389, 3.227249, 1, 0, 0, 1, 1,
0.3170655, 0.3526484, 1.656622, 1, 0, 0, 1, 1,
0.321167, -0.2541484, 1.925043, 1, 0, 0, 1, 1,
0.3220698, 0.4271493, -0.7678735, 1, 0, 0, 1, 1,
0.325471, 0.1267551, 1.250422, 1, 0, 0, 1, 1,
0.3257225, -0.02954607, 2.638748, 0, 0, 0, 1, 1,
0.3271164, -0.4798824, 3.259977, 0, 0, 0, 1, 1,
0.3333444, 0.7244794, -0.3266963, 0, 0, 0, 1, 1,
0.3370801, 0.218173, 1.580867, 0, 0, 0, 1, 1,
0.337887, 1.136552, 0.5728797, 0, 0, 0, 1, 1,
0.3404266, 0.7880127, 1.510476, 0, 0, 0, 1, 1,
0.3413116, 0.060631, 0.3902837, 0, 0, 0, 1, 1,
0.3428694, -0.2498044, 3.199012, 1, 1, 1, 1, 1,
0.3456617, 0.1364241, 0.7912562, 1, 1, 1, 1, 1,
0.3485732, -0.632846, 2.603769, 1, 1, 1, 1, 1,
0.3533531, -0.5640558, 4.281146, 1, 1, 1, 1, 1,
0.3555743, -1.252207, 2.096259, 1, 1, 1, 1, 1,
0.3573839, 0.1296999, 3.129234, 1, 1, 1, 1, 1,
0.3596369, 0.6190788, -1.065754, 1, 1, 1, 1, 1,
0.3627112, -1.166345, 1.474005, 1, 1, 1, 1, 1,
0.3644876, 0.8758603, 1.319434, 1, 1, 1, 1, 1,
0.3647117, -1.041734, 2.688172, 1, 1, 1, 1, 1,
0.365071, 0.9008768, 0.270113, 1, 1, 1, 1, 1,
0.3666791, 0.481244, 0.08225615, 1, 1, 1, 1, 1,
0.3685883, -0.333531, 4.456676, 1, 1, 1, 1, 1,
0.3688373, 0.9563006, 0.2586325, 1, 1, 1, 1, 1,
0.3691936, 0.828698, -0.8471255, 1, 1, 1, 1, 1,
0.3709247, -1.704115, 4.130042, 0, 0, 1, 1, 1,
0.3738016, 1.202716, 0.7815465, 1, 0, 0, 1, 1,
0.3740432, -0.3377749, 1.814791, 1, 0, 0, 1, 1,
0.3777251, -2.946957, 3.379309, 1, 0, 0, 1, 1,
0.3784768, 1.027779, 1.046315, 1, 0, 0, 1, 1,
0.3806522, -0.1756022, -0.616362, 1, 0, 0, 1, 1,
0.3807767, 0.7508865, -1.349457, 0, 0, 0, 1, 1,
0.3828004, -1.123192, 1.847587, 0, 0, 0, 1, 1,
0.3852152, -0.2919803, 2.757876, 0, 0, 0, 1, 1,
0.3874442, 0.3785157, -0.2049014, 0, 0, 0, 1, 1,
0.3900285, 0.5740692, 0.6316206, 0, 0, 0, 1, 1,
0.397478, 0.7861513, 3.993798, 0, 0, 0, 1, 1,
0.3990616, 0.2027941, 2.2584, 0, 0, 0, 1, 1,
0.4030035, -1.726505, 2.903647, 1, 1, 1, 1, 1,
0.4046407, -0.04421679, 0.7454742, 1, 1, 1, 1, 1,
0.4053985, -0.1322534, 2.919297, 1, 1, 1, 1, 1,
0.4082895, 0.2929489, 0.7037404, 1, 1, 1, 1, 1,
0.4128295, 0.1192499, 2.109805, 1, 1, 1, 1, 1,
0.4186068, -0.6785557, 3.098444, 1, 1, 1, 1, 1,
0.4187481, -1.639465, 1.543169, 1, 1, 1, 1, 1,
0.4224072, 0.4290017, 2.315892, 1, 1, 1, 1, 1,
0.4235541, 0.4781394, -0.302425, 1, 1, 1, 1, 1,
0.4260435, 0.1547645, 1.295606, 1, 1, 1, 1, 1,
0.4301265, 0.4036018, 2.083124, 1, 1, 1, 1, 1,
0.4303318, -0.2992656, 1.128017, 1, 1, 1, 1, 1,
0.4350141, 0.9061304, 2.500545, 1, 1, 1, 1, 1,
0.4381799, -0.2356797, 2.677966, 1, 1, 1, 1, 1,
0.4416466, 1.239156, -0.06635412, 1, 1, 1, 1, 1,
0.4419688, 0.4061221, 1.021381, 0, 0, 1, 1, 1,
0.4433111, -0.9334916, 3.266105, 1, 0, 0, 1, 1,
0.4444309, -0.6789392, 3.370286, 1, 0, 0, 1, 1,
0.4462368, 1.027822, -0.215478, 1, 0, 0, 1, 1,
0.4572055, -0.3603272, 1.42609, 1, 0, 0, 1, 1,
0.4646834, -0.6809813, 2.133736, 1, 0, 0, 1, 1,
0.4700307, 0.2981442, -0.6915109, 0, 0, 0, 1, 1,
0.4713199, 0.8471693, 0.4619879, 0, 0, 0, 1, 1,
0.4738855, 0.1151432, 1.016494, 0, 0, 0, 1, 1,
0.4848951, 0.4711471, 2.223997, 0, 0, 0, 1, 1,
0.4860529, -0.2013734, 1.159412, 0, 0, 0, 1, 1,
0.4915099, 0.3892924, 1.235756, 0, 0, 0, 1, 1,
0.4924218, 0.7538406, -0.3467855, 0, 0, 0, 1, 1,
0.4933773, 1.176173, -1.154094, 1, 1, 1, 1, 1,
0.497774, -0.3423874, 2.927029, 1, 1, 1, 1, 1,
0.4998811, 0.1111279, 1.827668, 1, 1, 1, 1, 1,
0.5031113, -1.290012, 3.750701, 1, 1, 1, 1, 1,
0.5037149, 0.7898065, 0.3904656, 1, 1, 1, 1, 1,
0.5042191, 0.515702, 0.4221636, 1, 1, 1, 1, 1,
0.5146819, 1.32071, 1.356482, 1, 1, 1, 1, 1,
0.5195474, -0.203956, 0.1132489, 1, 1, 1, 1, 1,
0.5233636, -0.4339018, 2.399389, 1, 1, 1, 1, 1,
0.5333813, -0.6095623, 2.427588, 1, 1, 1, 1, 1,
0.5368689, -1.013756, 3.878041, 1, 1, 1, 1, 1,
0.5384771, -0.4110337, 1.514195, 1, 1, 1, 1, 1,
0.5419546, -0.08482391, 0.3958886, 1, 1, 1, 1, 1,
0.5484974, -0.9507567, 2.739252, 1, 1, 1, 1, 1,
0.5517772, 1.426541, 0.676403, 1, 1, 1, 1, 1,
0.5554777, 1.483018, 0.5997415, 0, 0, 1, 1, 1,
0.5610209, 1.503231, -0.9011113, 1, 0, 0, 1, 1,
0.5613119, -0.193452, 4.108014, 1, 0, 0, 1, 1,
0.5684489, 0.9686028, 1.986815, 1, 0, 0, 1, 1,
0.5685646, -1.055556, 4.363965, 1, 0, 0, 1, 1,
0.5736203, 0.4531097, 1.304633, 1, 0, 0, 1, 1,
0.5740774, 0.7720436, -0.2972642, 0, 0, 0, 1, 1,
0.5756983, -0.1899112, 3.217832, 0, 0, 0, 1, 1,
0.5782536, -0.9751012, 1.505904, 0, 0, 0, 1, 1,
0.5796621, -0.9815239, 3.466974, 0, 0, 0, 1, 1,
0.5807451, -0.08557105, 2.208824, 0, 0, 0, 1, 1,
0.5819681, -1.071566, 1.434293, 0, 0, 0, 1, 1,
0.589562, 0.3577327, 0.3578401, 0, 0, 0, 1, 1,
0.5918602, 1.259416, -0.9106033, 1, 1, 1, 1, 1,
0.5928404, -1.433307, 2.814218, 1, 1, 1, 1, 1,
0.5966899, -1.031471, 1.227698, 1, 1, 1, 1, 1,
0.598796, -0.5660238, 2.724491, 1, 1, 1, 1, 1,
0.6019497, -0.01568376, 1.088533, 1, 1, 1, 1, 1,
0.6058989, -0.9869524, 2.778255, 1, 1, 1, 1, 1,
0.6104651, -0.3911091, 3.38986, 1, 1, 1, 1, 1,
0.6122662, -0.818498, 0.9536316, 1, 1, 1, 1, 1,
0.6135111, -0.03441228, 0.4974146, 1, 1, 1, 1, 1,
0.614671, -0.3028788, 2.286982, 1, 1, 1, 1, 1,
0.616131, -0.6341459, 3.245482, 1, 1, 1, 1, 1,
0.6182483, 0.2137013, 2.579778, 1, 1, 1, 1, 1,
0.6199239, -1.649514, 2.553381, 1, 1, 1, 1, 1,
0.6211947, -0.6271002, 2.959575, 1, 1, 1, 1, 1,
0.6213906, -0.4347759, 1.55024, 1, 1, 1, 1, 1,
0.6219712, -0.5741072, 1.998665, 0, 0, 1, 1, 1,
0.6309304, -1.703174, 2.481814, 1, 0, 0, 1, 1,
0.6320428, 1.77121, 0.5482952, 1, 0, 0, 1, 1,
0.6328778, 0.3161113, -0.4730961, 1, 0, 0, 1, 1,
0.6442348, -0.7045113, 2.199043, 1, 0, 0, 1, 1,
0.647572, 1.951836, 0.4937761, 1, 0, 0, 1, 1,
0.6543819, 0.2188219, 0.4233653, 0, 0, 0, 1, 1,
0.6589111, -0.03915858, 3.492318, 0, 0, 0, 1, 1,
0.6618634, 2.640259, -0.09715383, 0, 0, 0, 1, 1,
0.6626015, 1.305875, 0.9244117, 0, 0, 0, 1, 1,
0.662897, -2.196838, 2.669725, 0, 0, 0, 1, 1,
0.6631436, -0.5376486, 2.328816, 0, 0, 0, 1, 1,
0.6641436, 0.2647261, 2.228138, 0, 0, 0, 1, 1,
0.6681992, -1.274766, 2.018744, 1, 1, 1, 1, 1,
0.6749884, -0.7459564, 3.092184, 1, 1, 1, 1, 1,
0.6757988, -0.7199964, 2.882902, 1, 1, 1, 1, 1,
0.6845536, 0.3348667, 0.9164107, 1, 1, 1, 1, 1,
0.6879976, 0.5263049, 0.12535, 1, 1, 1, 1, 1,
0.6886662, -1.317697, 2.073456, 1, 1, 1, 1, 1,
0.6910028, -1.008269, 1.900814, 1, 1, 1, 1, 1,
0.6931199, -0.5609284, 2.03929, 1, 1, 1, 1, 1,
0.6943744, 1.247256, 0.9139903, 1, 1, 1, 1, 1,
0.6948221, 0.3162228, 3.336802, 1, 1, 1, 1, 1,
0.697224, 0.9392944, 1.487731, 1, 1, 1, 1, 1,
0.7022327, -1.248361, 3.077252, 1, 1, 1, 1, 1,
0.7085555, 0.7530668, 1.300041, 1, 1, 1, 1, 1,
0.7113124, -0.7648208, 2.760866, 1, 1, 1, 1, 1,
0.7119293, 0.3081705, 0.9843729, 1, 1, 1, 1, 1,
0.7131937, -0.07207203, 2.467733, 0, 0, 1, 1, 1,
0.7274505, -2.488786, 3.298788, 1, 0, 0, 1, 1,
0.7288479, -1.347868, 4.154629, 1, 0, 0, 1, 1,
0.7296489, 0.8687165, 1.468045, 1, 0, 0, 1, 1,
0.7309734, -2.62321, 1.150466, 1, 0, 0, 1, 1,
0.7311537, -1.078642, 2.956143, 1, 0, 0, 1, 1,
0.734117, 0.5268296, 1.230529, 0, 0, 0, 1, 1,
0.7362456, 0.6567872, 1.009948, 0, 0, 0, 1, 1,
0.7375351, -0.8656396, 3.478633, 0, 0, 0, 1, 1,
0.7389489, 0.6355026, -0.1995725, 0, 0, 0, 1, 1,
0.739894, 1.160409, 0.9543012, 0, 0, 0, 1, 1,
0.7407215, -0.3841543, 1.220276, 0, 0, 0, 1, 1,
0.7409004, -1.529552, 2.604833, 0, 0, 0, 1, 1,
0.7441489, 1.356734, -0.3500994, 1, 1, 1, 1, 1,
0.744294, 1.204371, 0.3679871, 1, 1, 1, 1, 1,
0.7481521, 0.7942868, 1.464712, 1, 1, 1, 1, 1,
0.7516058, -0.337395, 3.335491, 1, 1, 1, 1, 1,
0.7523121, 0.9446635, 0.1210161, 1, 1, 1, 1, 1,
0.753368, 1.035032, 0.2620132, 1, 1, 1, 1, 1,
0.7555513, -1.485518, 2.497574, 1, 1, 1, 1, 1,
0.7647346, 0.6663144, 1.103094, 1, 1, 1, 1, 1,
0.7717789, -0.5510691, -0.5634964, 1, 1, 1, 1, 1,
0.7739956, 0.2857511, 0.06311114, 1, 1, 1, 1, 1,
0.774917, 0.5125427, 1.699259, 1, 1, 1, 1, 1,
0.7754714, 0.3809916, 0.02271893, 1, 1, 1, 1, 1,
0.792152, 0.9277266, 1.931404, 1, 1, 1, 1, 1,
0.8011113, 0.7352159, 1.865472, 1, 1, 1, 1, 1,
0.801891, -0.3841049, 3.186469, 1, 1, 1, 1, 1,
0.8038435, -1.04405, 2.979288, 0, 0, 1, 1, 1,
0.8104655, 0.8415413, 0.9577357, 1, 0, 0, 1, 1,
0.8119469, 1.035797, 0.3037477, 1, 0, 0, 1, 1,
0.8214943, 0.5389842, 2.659996, 1, 0, 0, 1, 1,
0.8527237, -1.065439, 3.125846, 1, 0, 0, 1, 1,
0.8529536, -0.290971, 4.237488, 1, 0, 0, 1, 1,
0.8532155, 0.4422215, -0.2148864, 0, 0, 0, 1, 1,
0.8622741, 1.402149, 0.3469952, 0, 0, 0, 1, 1,
0.8646536, -0.3658259, 2.216864, 0, 0, 0, 1, 1,
0.8664141, -0.5014324, 4.021614, 0, 0, 0, 1, 1,
0.8669853, -0.1405574, 0.3933705, 0, 0, 0, 1, 1,
0.8688789, 1.096589, 2.003184, 0, 0, 0, 1, 1,
0.8697466, 0.3504899, 2.27951, 0, 0, 0, 1, 1,
0.8727716, 1.69093, 0.9029321, 1, 1, 1, 1, 1,
0.895592, 1.245877, 0.3017567, 1, 1, 1, 1, 1,
0.899649, 0.2914837, 0.8654648, 1, 1, 1, 1, 1,
0.9056522, 0.3910099, 1.507083, 1, 1, 1, 1, 1,
0.9064291, 0.1614182, 2.464813, 1, 1, 1, 1, 1,
0.9084828, 0.1490579, 0.4753897, 1, 1, 1, 1, 1,
0.912447, -0.6633931, 2.118184, 1, 1, 1, 1, 1,
0.9147965, -2.134895, 3.022701, 1, 1, 1, 1, 1,
0.9196353, -0.3789237, 0.8937604, 1, 1, 1, 1, 1,
0.9199963, 1.112437, -0.849621, 1, 1, 1, 1, 1,
0.9207839, 0.4850917, 0.01534267, 1, 1, 1, 1, 1,
0.9254601, 0.4962639, 0.4571163, 1, 1, 1, 1, 1,
0.9264198, 1.246274, -0.03719232, 1, 1, 1, 1, 1,
0.9289444, -0.2127161, 0.5129907, 1, 1, 1, 1, 1,
0.931217, -0.09800717, 1.564685, 1, 1, 1, 1, 1,
0.9351646, 1.86708, 0.1792055, 0, 0, 1, 1, 1,
0.9413164, 0.6460585, 2.610603, 1, 0, 0, 1, 1,
0.949626, -0.8554693, 5.027884, 1, 0, 0, 1, 1,
0.9522133, -1.060158, 2.248829, 1, 0, 0, 1, 1,
0.9548, -0.3917764, 2.880107, 1, 0, 0, 1, 1,
0.9564376, -0.1651723, 4.517526, 1, 0, 0, 1, 1,
0.963513, 2.513998, 0.03327567, 0, 0, 0, 1, 1,
0.9674232, 0.463246, 2.059034, 0, 0, 0, 1, 1,
0.9674665, 1.074595, 0.2137987, 0, 0, 0, 1, 1,
0.9734188, 0.9857606, 0.2487808, 0, 0, 0, 1, 1,
0.9855735, 0.528918, 3.606462, 0, 0, 0, 1, 1,
0.9870761, -1.138622, 2.495517, 0, 0, 0, 1, 1,
0.9877017, 1.265164, -0.1782833, 0, 0, 0, 1, 1,
0.987736, 0.7956341, 0.4661652, 1, 1, 1, 1, 1,
0.9937866, 3.093695, 0.6110893, 1, 1, 1, 1, 1,
1.001264, 0.8169515, 0.7396697, 1, 1, 1, 1, 1,
1.00207, 0.6925531, 1.278189, 1, 1, 1, 1, 1,
1.004426, 0.2416054, -0.9136205, 1, 1, 1, 1, 1,
1.009452, 0.9994394, 1.258826, 1, 1, 1, 1, 1,
1.014645, -1.601817, 0.9203175, 1, 1, 1, 1, 1,
1.017702, -1.173375, 2.039278, 1, 1, 1, 1, 1,
1.018657, -0.01837213, 2.888902, 1, 1, 1, 1, 1,
1.022501, 2.079881, -0.2120322, 1, 1, 1, 1, 1,
1.024167, 0.6898038, -0.02522852, 1, 1, 1, 1, 1,
1.024572, 0.6952726, 0.9352563, 1, 1, 1, 1, 1,
1.0311, -0.8257644, 1.888943, 1, 1, 1, 1, 1,
1.033762, 0.9613208, 1.013508, 1, 1, 1, 1, 1,
1.03772, -0.2995563, 1.891611, 1, 1, 1, 1, 1,
1.042884, -1.380478, 2.357417, 0, 0, 1, 1, 1,
1.044264, 0.5175986, 0.2886947, 1, 0, 0, 1, 1,
1.045696, -1.238863, 3.520005, 1, 0, 0, 1, 1,
1.047015, 1.092476, 1.694425, 1, 0, 0, 1, 1,
1.050925, -0.3698933, 2.327438, 1, 0, 0, 1, 1,
1.054196, 0.006494432, 0.7413552, 1, 0, 0, 1, 1,
1.057654, -0.7941039, 3.54439, 0, 0, 0, 1, 1,
1.062906, 0.8091046, 1.406837, 0, 0, 0, 1, 1,
1.064233, 0.7547579, 3.069595, 0, 0, 0, 1, 1,
1.077245, -0.01159169, 1.729527, 0, 0, 0, 1, 1,
1.079855, -0.7380215, 2.534993, 0, 0, 0, 1, 1,
1.09059, -0.9877529, 3.647458, 0, 0, 0, 1, 1,
1.091758, -0.8993726, 4.042364, 0, 0, 0, 1, 1,
1.107583, 0.5211896, 0.0280515, 1, 1, 1, 1, 1,
1.111797, -1.458176, 3.72933, 1, 1, 1, 1, 1,
1.116998, -0.233728, 0.8790292, 1, 1, 1, 1, 1,
1.123808, -0.316172, 1.04957, 1, 1, 1, 1, 1,
1.14004, 0.8168445, 0.6579896, 1, 1, 1, 1, 1,
1.14441, 0.9247944, 1.026598, 1, 1, 1, 1, 1,
1.14793, 0.2454089, 1.89463, 1, 1, 1, 1, 1,
1.148977, -1.187532, 3.17723, 1, 1, 1, 1, 1,
1.148998, -1.324336, 1.917194, 1, 1, 1, 1, 1,
1.149643, 1.759612, 1.091049, 1, 1, 1, 1, 1,
1.150851, 1.32446, 0.04119328, 1, 1, 1, 1, 1,
1.151138, 0.8783727, 2.381631, 1, 1, 1, 1, 1,
1.153662, 1.67738, 0.5054243, 1, 1, 1, 1, 1,
1.157668, -1.078706, 2.524047, 1, 1, 1, 1, 1,
1.161562, 0.5161698, 1.819261, 1, 1, 1, 1, 1,
1.161743, -0.6197051, 2.849506, 0, 0, 1, 1, 1,
1.165198, -1.213523, 0.7822901, 1, 0, 0, 1, 1,
1.187707, -0.04648682, 2.592578, 1, 0, 0, 1, 1,
1.18883, -0.2711375, 2.461485, 1, 0, 0, 1, 1,
1.190206, 0.5333244, 1.446352, 1, 0, 0, 1, 1,
1.194938, -0.2027355, -0.221763, 1, 0, 0, 1, 1,
1.195117, -2.023993, 2.628016, 0, 0, 0, 1, 1,
1.198992, 0.3501591, 0.1344527, 0, 0, 0, 1, 1,
1.205674, 0.3976049, 0.9916742, 0, 0, 0, 1, 1,
1.20914, -0.2850879, 3.188754, 0, 0, 0, 1, 1,
1.21009, 0.241103, 3.150471, 0, 0, 0, 1, 1,
1.214909, -0.2200051, 1.506638, 0, 0, 0, 1, 1,
1.218439, 0.2432981, 1.246525, 0, 0, 0, 1, 1,
1.218554, -1.850119, 1.649387, 1, 1, 1, 1, 1,
1.219945, 0.3727808, 2.254459, 1, 1, 1, 1, 1,
1.230868, 0.6938464, 0.5391015, 1, 1, 1, 1, 1,
1.237105, 0.08751506, 1.958683, 1, 1, 1, 1, 1,
1.238317, -0.6835921, 4.580825, 1, 1, 1, 1, 1,
1.238439, -0.1538343, 2.236772, 1, 1, 1, 1, 1,
1.241477, 1.494287, -0.4694272, 1, 1, 1, 1, 1,
1.249685, -0.5754862, 1.61185, 1, 1, 1, 1, 1,
1.250455, 0.2894936, 2.019277, 1, 1, 1, 1, 1,
1.253325, -0.2664683, 1.142335, 1, 1, 1, 1, 1,
1.256933, 0.4861888, 1.061294, 1, 1, 1, 1, 1,
1.257632, -1.504043, 2.086478, 1, 1, 1, 1, 1,
1.260054, -1.865256, 3.175418, 1, 1, 1, 1, 1,
1.260661, 1.257844, 0.9921142, 1, 1, 1, 1, 1,
1.267312, 1.151336, 1.047804, 1, 1, 1, 1, 1,
1.279596, 0.4582893, 1.726492, 0, 0, 1, 1, 1,
1.289245, -1.032514, 2.6773, 1, 0, 0, 1, 1,
1.300885, -0.4756338, 1.432356, 1, 0, 0, 1, 1,
1.306785, -1.932932, 3.530818, 1, 0, 0, 1, 1,
1.309546, 1.096668, 0.09677969, 1, 0, 0, 1, 1,
1.319305, 0.4044581, -1.054219, 1, 0, 0, 1, 1,
1.322548, 0.2251926, 0.4177692, 0, 0, 0, 1, 1,
1.324515, 0.2683496, 0.7750904, 0, 0, 0, 1, 1,
1.332654, -0.3337999, 3.248039, 0, 0, 0, 1, 1,
1.340728, -0.6169031, 2.684199, 0, 0, 0, 1, 1,
1.348323, 0.1059498, 2.250297, 0, 0, 0, 1, 1,
1.358166, 0.5855264, 0.83019, 0, 0, 0, 1, 1,
1.362354, -0.869267, 3.214996, 0, 0, 0, 1, 1,
1.36576, 0.1310302, 1.636895, 1, 1, 1, 1, 1,
1.37336, -1.104898, 3.731646, 1, 1, 1, 1, 1,
1.376306, -0.7256905, 2.557622, 1, 1, 1, 1, 1,
1.381197, -0.6419189, 2.367576, 1, 1, 1, 1, 1,
1.382488, 0.2683376, 2.089479, 1, 1, 1, 1, 1,
1.388379, -0.02851181, 0.3989687, 1, 1, 1, 1, 1,
1.390851, -0.7587891, 1.349389, 1, 1, 1, 1, 1,
1.409036, -1.183177, 3.920007, 1, 1, 1, 1, 1,
1.411099, -0.2404956, 1.535301, 1, 1, 1, 1, 1,
1.431841, -0.02582219, 0.5467218, 1, 1, 1, 1, 1,
1.43851, 0.1082287, -0.08681814, 1, 1, 1, 1, 1,
1.438656, -0.202817, 2.111124, 1, 1, 1, 1, 1,
1.44092, -1.088824, 2.411478, 1, 1, 1, 1, 1,
1.441948, 0.00514662, 0.2983494, 1, 1, 1, 1, 1,
1.446206, -0.07357777, 1.847809, 1, 1, 1, 1, 1,
1.453869, -1.866157, 2.652763, 0, 0, 1, 1, 1,
1.468221, 0.1645197, 1.835505, 1, 0, 0, 1, 1,
1.482011, 0.8176379, 1.415589, 1, 0, 0, 1, 1,
1.490945, -0.1108822, 3.042908, 1, 0, 0, 1, 1,
1.491408, -0.3401796, 0.6409334, 1, 0, 0, 1, 1,
1.510271, -0.7950524, 2.635566, 1, 0, 0, 1, 1,
1.516104, -0.6400643, 0.6341264, 0, 0, 0, 1, 1,
1.525111, -0.7543476, 3.6959, 0, 0, 0, 1, 1,
1.525995, -0.02703149, 1.720908, 0, 0, 0, 1, 1,
1.526781, -1.602809, 3.353451, 0, 0, 0, 1, 1,
1.531634, -2.203901, 2.98295, 0, 0, 0, 1, 1,
1.534295, -0.211493, 3.50449, 0, 0, 0, 1, 1,
1.53892, 0.6199447, -1.000612, 0, 0, 0, 1, 1,
1.544111, -0.7034563, 2.564506, 1, 1, 1, 1, 1,
1.550009, 1.585461, 0.6746982, 1, 1, 1, 1, 1,
1.551056, 0.9587326, 0.50433, 1, 1, 1, 1, 1,
1.553134, -2.270523, 3.229394, 1, 1, 1, 1, 1,
1.558679, 2.04989, 1.084333, 1, 1, 1, 1, 1,
1.571115, -1.097824, 2.142941, 1, 1, 1, 1, 1,
1.585866, 2.269883, 1.544519, 1, 1, 1, 1, 1,
1.591264, 0.5572853, 1.489262, 1, 1, 1, 1, 1,
1.593153, 0.7669604, 3.706716, 1, 1, 1, 1, 1,
1.595085, 0.1218884, -0.2233685, 1, 1, 1, 1, 1,
1.616753, 1.378618, 0.5854445, 1, 1, 1, 1, 1,
1.634922, -0.2100624, -1.687667, 1, 1, 1, 1, 1,
1.650293, 1.052158, -0.6309142, 1, 1, 1, 1, 1,
1.667643, -0.6357374, 1.507549, 1, 1, 1, 1, 1,
1.67962, 0.9963894, 0.09732321, 1, 1, 1, 1, 1,
1.687907, 0.1867243, 0.9436384, 0, 0, 1, 1, 1,
1.692209, 0.4847639, -0.008083055, 1, 0, 0, 1, 1,
1.694754, -0.03868693, 2.354215, 1, 0, 0, 1, 1,
1.699579, -0.6753733, 2.767393, 1, 0, 0, 1, 1,
1.707563, -0.6831951, -0.5828561, 1, 0, 0, 1, 1,
1.716986, -2.225387, 2.386706, 1, 0, 0, 1, 1,
1.718216, 0.1091265, 0.2876168, 0, 0, 0, 1, 1,
1.744012, 1.435697, -0.438638, 0, 0, 0, 1, 1,
1.755937, 0.8937066, 1.530218, 0, 0, 0, 1, 1,
1.761724, -0.216804, 0.09430944, 0, 0, 0, 1, 1,
1.786219, 0.1107329, 2.158507, 0, 0, 0, 1, 1,
1.803415, -0.09892149, -0.08554175, 0, 0, 0, 1, 1,
1.820945, -0.5412275, 1.684579, 0, 0, 0, 1, 1,
1.843158, 0.3465099, 1.753559, 1, 1, 1, 1, 1,
1.84401, -0.1331713, 1.525113, 1, 1, 1, 1, 1,
1.868218, 0.354313, 2.28406, 1, 1, 1, 1, 1,
1.897459, -1.423052, 2.632073, 1, 1, 1, 1, 1,
1.911233, 1.03574, 0.7310272, 1, 1, 1, 1, 1,
1.911888, 0.01583653, 1.801409, 1, 1, 1, 1, 1,
1.925311, -0.4242026, 1.00996, 1, 1, 1, 1, 1,
1.928686, 0.4732866, 2.501831, 1, 1, 1, 1, 1,
1.950014, -1.125176, 2.149825, 1, 1, 1, 1, 1,
1.980624, -0.2454087, -1.084258, 1, 1, 1, 1, 1,
1.987713, -0.4142895, -0.1530818, 1, 1, 1, 1, 1,
1.988278, -1.879025, 0.7746722, 1, 1, 1, 1, 1,
2.004176, -0.6919762, 1.9253, 1, 1, 1, 1, 1,
2.020736, -0.3709549, 2.248248, 1, 1, 1, 1, 1,
2.034341, -0.2438247, 1.547952, 1, 1, 1, 1, 1,
2.045571, 0.8888494, -0.5729849, 0, 0, 1, 1, 1,
2.076876, -1.52337, 1.046846, 1, 0, 0, 1, 1,
2.090095, 1.012894, 1.000721, 1, 0, 0, 1, 1,
2.117303, -1.591972, 2.280922, 1, 0, 0, 1, 1,
2.120301, -0.5988215, 2.403992, 1, 0, 0, 1, 1,
2.154134, -1.717163, 3.600226, 1, 0, 0, 1, 1,
2.158807, 1.037361, 2.524627, 0, 0, 0, 1, 1,
2.18125, 0.649511, 2.287104, 0, 0, 0, 1, 1,
2.220468, -0.9964488, 0.8393615, 0, 0, 0, 1, 1,
2.230344, 0.9067471, 1.560861, 0, 0, 0, 1, 1,
2.337872, 0.03839977, 1.7967, 0, 0, 0, 1, 1,
2.375371, 0.1680983, 1.845341, 0, 0, 0, 1, 1,
2.442274, 0.4508395, 1.506653, 0, 0, 0, 1, 1,
2.444489, -0.02120301, 1.139173, 1, 1, 1, 1, 1,
2.605006, 0.5981293, -1.27008, 1, 1, 1, 1, 1,
2.661469, -0.9031118, 1.688534, 1, 1, 1, 1, 1,
2.843106, -0.5388829, 3.2818, 1, 1, 1, 1, 1,
2.864197, -0.8398951, 2.096835, 1, 1, 1, 1, 1,
2.962777, -0.2183933, 2.073738, 1, 1, 1, 1, 1,
3.397441, 0.002403731, 2.500426, 1, 1, 1, 1, 1
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
var radius = 9.731707;
var distance = 34.18221;
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
mvMatrix.translate( 0.2494485, 0.05815697, 0.252089 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.18221);
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
