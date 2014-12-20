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
-3.290105, 0.4841896, -1.27266, 1, 0, 0, 1,
-3.074861, 0.7472507, -2.947153, 1, 0.007843138, 0, 1,
-3.056745, -0.0203528, -3.148669, 1, 0.01176471, 0, 1,
-3.048608, -0.6621061, 0.003041006, 1, 0.01960784, 0, 1,
-2.875595, 0.08363428, -4.034914, 1, 0.02352941, 0, 1,
-2.85072, 1.136936, -1.511615, 1, 0.03137255, 0, 1,
-2.671057, 0.1355251, -4.642778, 1, 0.03529412, 0, 1,
-2.64571, -0.2669399, -1.031365, 1, 0.04313726, 0, 1,
-2.620173, 1.130524, -0.1123958, 1, 0.04705882, 0, 1,
-2.608564, 0.1830971, -1.938626, 1, 0.05490196, 0, 1,
-2.596634, 0.6463444, -0.1322739, 1, 0.05882353, 0, 1,
-2.561672, 1.240954, -0.602629, 1, 0.06666667, 0, 1,
-2.486897, 0.2792796, -0.67009, 1, 0.07058824, 0, 1,
-2.481261, 1.393028, -0.8251747, 1, 0.07843138, 0, 1,
-2.404827, 0.4286128, -1.852844, 1, 0.08235294, 0, 1,
-2.347076, -1.494241, -1.448487, 1, 0.09019608, 0, 1,
-2.32392, 1.130848, 0.6796122, 1, 0.09411765, 0, 1,
-2.303731, 0.8223934, -2.122831, 1, 0.1019608, 0, 1,
-2.298758, -0.5166184, -1.477973, 1, 0.1098039, 0, 1,
-2.295072, 0.5244566, 0.5711195, 1, 0.1137255, 0, 1,
-2.27639, -1.410915, -4.824241, 1, 0.1215686, 0, 1,
-2.276133, 0.4083219, -0.7268721, 1, 0.1254902, 0, 1,
-2.245389, -1.332508, -0.5996286, 1, 0.1333333, 0, 1,
-2.238212, 0.6044398, -2.869117, 1, 0.1372549, 0, 1,
-2.215736, 2.2266, 1.148361, 1, 0.145098, 0, 1,
-2.204126, 0.7492158, -1.206508, 1, 0.1490196, 0, 1,
-2.162672, 1.21102, 0.6886885, 1, 0.1568628, 0, 1,
-2.15842, -1.012608, -2.53675, 1, 0.1607843, 0, 1,
-2.135838, -1.065523, -1.063326, 1, 0.1686275, 0, 1,
-2.056742, -0.7753062, -3.691768, 1, 0.172549, 0, 1,
-2.015975, -1.344913, -2.992569, 1, 0.1803922, 0, 1,
-2.009778, 0.1318277, -3.515424, 1, 0.1843137, 0, 1,
-2.000463, -0.7902624, -2.906664, 1, 0.1921569, 0, 1,
-1.982335, -0.3537457, -0.8133558, 1, 0.1960784, 0, 1,
-1.976123, -1.706139, -4.422688, 1, 0.2039216, 0, 1,
-1.964296, -1.266157, -1.020563, 1, 0.2117647, 0, 1,
-1.957907, -1.018514, -2.721509, 1, 0.2156863, 0, 1,
-1.956509, -1.335801, -0.9067781, 1, 0.2235294, 0, 1,
-1.93783, -0.8832179, -2.983229, 1, 0.227451, 0, 1,
-1.924665, 0.1017443, -2.572849, 1, 0.2352941, 0, 1,
-1.913158, 0.07147763, -3.826575, 1, 0.2392157, 0, 1,
-1.864041, 0.9801589, -0.6519609, 1, 0.2470588, 0, 1,
-1.853325, -0.1047104, -1.798159, 1, 0.2509804, 0, 1,
-1.850537, 1.265913, -1.076303, 1, 0.2588235, 0, 1,
-1.845301, 0.3045509, -2.010329, 1, 0.2627451, 0, 1,
-1.842539, -1.049467, -0.8436825, 1, 0.2705882, 0, 1,
-1.837853, 0.3036937, -1.147599, 1, 0.2745098, 0, 1,
-1.836823, -0.2773667, -4.084965, 1, 0.282353, 0, 1,
-1.828394, 0.4325527, -2.030157, 1, 0.2862745, 0, 1,
-1.826898, 0.7915486, -0.295877, 1, 0.2941177, 0, 1,
-1.812824, 0.1498595, -2.092551, 1, 0.3019608, 0, 1,
-1.78797, -1.278975, -2.25958, 1, 0.3058824, 0, 1,
-1.778777, -0.3263619, -2.947795, 1, 0.3137255, 0, 1,
-1.778412, -1.54505, -2.877922, 1, 0.3176471, 0, 1,
-1.776191, 1.715167, -1.302312, 1, 0.3254902, 0, 1,
-1.772869, -0.03417765, -1.452566, 1, 0.3294118, 0, 1,
-1.769738, 0.367397, -1.855169, 1, 0.3372549, 0, 1,
-1.71811, 0.2012051, -2.345768, 1, 0.3411765, 0, 1,
-1.718091, 0.6837337, -2.178441, 1, 0.3490196, 0, 1,
-1.710748, 0.01245509, -2.749853, 1, 0.3529412, 0, 1,
-1.704291, -0.4082793, -3.031951, 1, 0.3607843, 0, 1,
-1.695927, -0.0794495, -1.065797, 1, 0.3647059, 0, 1,
-1.687463, -0.07721134, -2.49923, 1, 0.372549, 0, 1,
-1.682384, 0.400456, -0.761928, 1, 0.3764706, 0, 1,
-1.681067, -0.4673757, -2.265062, 1, 0.3843137, 0, 1,
-1.680195, 0.5633313, 0.1208671, 1, 0.3882353, 0, 1,
-1.67509, -0.3223078, -2.622479, 1, 0.3960784, 0, 1,
-1.671539, -0.5987458, -2.898421, 1, 0.4039216, 0, 1,
-1.664361, 0.6584593, -1.166798, 1, 0.4078431, 0, 1,
-1.6493, -1.467626, -3.551194, 1, 0.4156863, 0, 1,
-1.647961, 0.1224295, -0.4762803, 1, 0.4196078, 0, 1,
-1.645394, 0.5218452, -2.539513, 1, 0.427451, 0, 1,
-1.642315, 1.202738, -1.845091, 1, 0.4313726, 0, 1,
-1.640046, -2.671113, -2.867777, 1, 0.4392157, 0, 1,
-1.637016, 2.045115, -0.5740097, 1, 0.4431373, 0, 1,
-1.635406, 1.143677, -0.2145498, 1, 0.4509804, 0, 1,
-1.634551, 0.5508028, -0.7740341, 1, 0.454902, 0, 1,
-1.627967, -0.5387287, -2.26509, 1, 0.4627451, 0, 1,
-1.627732, 1.153944, -2.025334, 1, 0.4666667, 0, 1,
-1.610116, -0.216575, -1.44145, 1, 0.4745098, 0, 1,
-1.599739, 0.9462937, -2.035816, 1, 0.4784314, 0, 1,
-1.593129, 0.05876708, -1.038868, 1, 0.4862745, 0, 1,
-1.584081, 0.1130037, 0.2115133, 1, 0.4901961, 0, 1,
-1.583057, 0.8647743, 0.06409358, 1, 0.4980392, 0, 1,
-1.578838, 0.4312446, -1.802113, 1, 0.5058824, 0, 1,
-1.57058, -0.3347259, -2.621594, 1, 0.509804, 0, 1,
-1.54945, 0.48151, -1.445825, 1, 0.5176471, 0, 1,
-1.540608, -0.2621287, -1.655276, 1, 0.5215687, 0, 1,
-1.524159, -1.322035, -1.55985, 1, 0.5294118, 0, 1,
-1.517837, 0.797744, -1.149019, 1, 0.5333334, 0, 1,
-1.517393, 0.4076225, -2.833253, 1, 0.5411765, 0, 1,
-1.496695, 1.403953, -2.050708, 1, 0.5450981, 0, 1,
-1.480921, -0.1183614, -3.710521, 1, 0.5529412, 0, 1,
-1.476511, 0.360037, -1.906104, 1, 0.5568628, 0, 1,
-1.463644, 1.192783, -0.5562437, 1, 0.5647059, 0, 1,
-1.463344, 0.5693962, 0.5928176, 1, 0.5686275, 0, 1,
-1.455475, 0.1207509, -0.2685455, 1, 0.5764706, 0, 1,
-1.44895, 0.6985949, -0.6491938, 1, 0.5803922, 0, 1,
-1.448775, 2.500468, -0.3162599, 1, 0.5882353, 0, 1,
-1.440711, -1.028845, -1.51164, 1, 0.5921569, 0, 1,
-1.440197, 1.200182, -2.322816, 1, 0.6, 0, 1,
-1.439302, 0.05647212, -1.343993, 1, 0.6078432, 0, 1,
-1.41619, -0.2440737, -2.639995, 1, 0.6117647, 0, 1,
-1.415213, 1.163425, -0.1414013, 1, 0.6196079, 0, 1,
-1.410906, 0.5031106, -0.9183801, 1, 0.6235294, 0, 1,
-1.407642, 0.3773505, -2.076827, 1, 0.6313726, 0, 1,
-1.397434, 2.487869, 0.2898162, 1, 0.6352941, 0, 1,
-1.3915, -1.781903, -3.742074, 1, 0.6431373, 0, 1,
-1.388565, 1.161868, 0.2901878, 1, 0.6470588, 0, 1,
-1.374249, 0.106996, -2.501411, 1, 0.654902, 0, 1,
-1.373003, 0.4455877, -2.212201, 1, 0.6588235, 0, 1,
-1.371976, -0.7947809, -2.975147, 1, 0.6666667, 0, 1,
-1.367675, -1.320572, -2.769952, 1, 0.6705883, 0, 1,
-1.360194, 0.4115145, -1.175759, 1, 0.6784314, 0, 1,
-1.349861, 0.5983251, -1.11675, 1, 0.682353, 0, 1,
-1.347964, 0.8495852, -1.524047, 1, 0.6901961, 0, 1,
-1.345678, -1.422384, -3.854292, 1, 0.6941177, 0, 1,
-1.345517, 0.147858, -1.162591, 1, 0.7019608, 0, 1,
-1.336968, 2.152591, 1.449512, 1, 0.7098039, 0, 1,
-1.332107, -1.533852, -1.730896, 1, 0.7137255, 0, 1,
-1.327225, 0.7345374, -0.2431467, 1, 0.7215686, 0, 1,
-1.325297, -0.4801999, -3.300235, 1, 0.7254902, 0, 1,
-1.324464, -0.1622119, -1.747569, 1, 0.7333333, 0, 1,
-1.304042, -1.069144, -3.948848, 1, 0.7372549, 0, 1,
-1.298966, -0.07041154, -1.920445, 1, 0.7450981, 0, 1,
-1.297287, -0.8367273, -2.880618, 1, 0.7490196, 0, 1,
-1.288415, -0.9684105, -2.163166, 1, 0.7568628, 0, 1,
-1.287168, -1.077026, -1.922165, 1, 0.7607843, 0, 1,
-1.280991, 0.3891616, -1.908991, 1, 0.7686275, 0, 1,
-1.271641, 0.1390472, -1.1321, 1, 0.772549, 0, 1,
-1.268158, -0.6587822, -4.306497, 1, 0.7803922, 0, 1,
-1.261597, -0.486207, -0.8711325, 1, 0.7843137, 0, 1,
-1.261198, 1.04887, -0.6582851, 1, 0.7921569, 0, 1,
-1.257692, 0.073126, -1.63313, 1, 0.7960784, 0, 1,
-1.24321, -0.8054858, -2.446182, 1, 0.8039216, 0, 1,
-1.235867, -0.1660456, 0.8228344, 1, 0.8117647, 0, 1,
-1.231854, -0.8015112, -2.712657, 1, 0.8156863, 0, 1,
-1.229625, -0.1718631, -1.297402, 1, 0.8235294, 0, 1,
-1.221114, -0.5897996, -1.668812, 1, 0.827451, 0, 1,
-1.21755, -0.2003778, -1.785294, 1, 0.8352941, 0, 1,
-1.2168, 0.02899734, -2.20454, 1, 0.8392157, 0, 1,
-1.197455, -0.09904911, -1.321994, 1, 0.8470588, 0, 1,
-1.18981, 1.012455, -0.7906014, 1, 0.8509804, 0, 1,
-1.189621, -1.262729, -2.322077, 1, 0.8588235, 0, 1,
-1.166547, 1.496292, -0.4252005, 1, 0.8627451, 0, 1,
-1.165484, 2.046086, 0.4469079, 1, 0.8705882, 0, 1,
-1.159212, -0.804203, -3.129012, 1, 0.8745098, 0, 1,
-1.13798, -0.0136801, -2.067115, 1, 0.8823529, 0, 1,
-1.132846, -0.8733619, -2.560301, 1, 0.8862745, 0, 1,
-1.113701, -0.1744206, -1.646692, 1, 0.8941177, 0, 1,
-1.113358, -0.935618, -1.004918, 1, 0.8980392, 0, 1,
-1.110532, -0.4739114, -3.874344, 1, 0.9058824, 0, 1,
-1.101326, -0.4373574, -2.47533, 1, 0.9137255, 0, 1,
-1.09655, -0.9601277, -3.576768, 1, 0.9176471, 0, 1,
-1.085874, 1.002269, -0.9291443, 1, 0.9254902, 0, 1,
-1.071582, -1.393909, -2.821225, 1, 0.9294118, 0, 1,
-1.054799, 0.08933421, -0.4975244, 1, 0.9372549, 0, 1,
-1.037521, -0.2828611, -1.741168, 1, 0.9411765, 0, 1,
-1.031236, 0.08585674, 0.2191548, 1, 0.9490196, 0, 1,
-1.030766, 0.9374827, -1.645191, 1, 0.9529412, 0, 1,
-1.029684, 0.5249512, -1.942637, 1, 0.9607843, 0, 1,
-1.029378, -0.4790325, -1.712727, 1, 0.9647059, 0, 1,
-1.026016, -0.4946024, -2.671914, 1, 0.972549, 0, 1,
-1.020827, -1.818151, -3.398595, 1, 0.9764706, 0, 1,
-1.019096, -0.02025576, -2.094787, 1, 0.9843137, 0, 1,
-1.018139, -2.499964, -1.867371, 1, 0.9882353, 0, 1,
-1.007172, -0.02217382, -2.70317, 1, 0.9960784, 0, 1,
-1.005698, -0.904909, -1.98498, 0.9960784, 1, 0, 1,
-1.002125, -0.6928861, -1.49756, 0.9921569, 1, 0, 1,
-0.9840258, 0.02760163, -2.490874, 0.9843137, 1, 0, 1,
-0.9819884, 1.131618, -3.025573, 0.9803922, 1, 0, 1,
-0.974669, -0.8629752, -1.553408, 0.972549, 1, 0, 1,
-0.9697207, 0.3257932, -0.8919549, 0.9686275, 1, 0, 1,
-0.9665423, -0.09269769, -0.6931335, 0.9607843, 1, 0, 1,
-0.9654508, -1.945275, -3.143401, 0.9568627, 1, 0, 1,
-0.9652404, -0.3878504, -1.710828, 0.9490196, 1, 0, 1,
-0.9584133, 0.7527007, -2.2713, 0.945098, 1, 0, 1,
-0.9563648, 0.4477524, -0.8830384, 0.9372549, 1, 0, 1,
-0.9528805, 1.094805, -0.8801361, 0.9333333, 1, 0, 1,
-0.9467797, -0.1275384, -0.3440999, 0.9254902, 1, 0, 1,
-0.9418556, 0.5270266, -0.7112637, 0.9215686, 1, 0, 1,
-0.941848, -0.7392755, -2.67973, 0.9137255, 1, 0, 1,
-0.9403079, -0.5773912, -1.897923, 0.9098039, 1, 0, 1,
-0.9357932, 0.2416832, -2.645369, 0.9019608, 1, 0, 1,
-0.9342652, -2.099423, -2.186033, 0.8941177, 1, 0, 1,
-0.9341756, 0.658155, -1.680946, 0.8901961, 1, 0, 1,
-0.9334841, 0.1368982, -1.14706, 0.8823529, 1, 0, 1,
-0.9284631, 1.289262, 0.4583672, 0.8784314, 1, 0, 1,
-0.9245932, 0.5143576, -2.924217, 0.8705882, 1, 0, 1,
-0.9228687, 0.03855763, -1.550609, 0.8666667, 1, 0, 1,
-0.9196696, -1.03369, -3.597952, 0.8588235, 1, 0, 1,
-0.919079, 0.3643549, -1.342903, 0.854902, 1, 0, 1,
-0.9157814, -0.07015082, -2.038089, 0.8470588, 1, 0, 1,
-0.9145733, -2.320519, -1.905002, 0.8431373, 1, 0, 1,
-0.9081979, 2.141435, -0.6374116, 0.8352941, 1, 0, 1,
-0.9017901, -0.2566571, -2.468044, 0.8313726, 1, 0, 1,
-0.9005421, -1.352328, -4.333944, 0.8235294, 1, 0, 1,
-0.8988469, -0.4492532, -2.077787, 0.8196079, 1, 0, 1,
-0.8987518, 1.142677, 0.3266162, 0.8117647, 1, 0, 1,
-0.8979734, 0.8715116, -1.556415, 0.8078431, 1, 0, 1,
-0.8911038, 0.6587009, -2.326024, 0.8, 1, 0, 1,
-0.8742313, -1.713729, -3.669355, 0.7921569, 1, 0, 1,
-0.8736109, -2.220634, -3.632239, 0.7882353, 1, 0, 1,
-0.8728157, -0.09347226, -2.164154, 0.7803922, 1, 0, 1,
-0.8702536, -1.549473, -3.77912, 0.7764706, 1, 0, 1,
-0.8618997, -1.292032, -1.581642, 0.7686275, 1, 0, 1,
-0.8614601, -0.4040274, -2.554755, 0.7647059, 1, 0, 1,
-0.8593422, -0.5073299, -3.14959, 0.7568628, 1, 0, 1,
-0.8576862, 1.240776, -1.946494, 0.7529412, 1, 0, 1,
-0.8575035, 1.012385, -1.205585, 0.7450981, 1, 0, 1,
-0.8574987, 0.1624449, -2.570174, 0.7411765, 1, 0, 1,
-0.850435, -0.02371926, -1.162878, 0.7333333, 1, 0, 1,
-0.8495188, -0.6817768, -0.8187444, 0.7294118, 1, 0, 1,
-0.8494871, -1.297604, -2.913306, 0.7215686, 1, 0, 1,
-0.8482537, 0.01289454, -0.9938617, 0.7176471, 1, 0, 1,
-0.8475521, -0.1156676, -1.803377, 0.7098039, 1, 0, 1,
-0.8463033, -1.527761, -1.295458, 0.7058824, 1, 0, 1,
-0.8405203, 0.08736037, -2.550287, 0.6980392, 1, 0, 1,
-0.8381746, 0.977546, -1.934799, 0.6901961, 1, 0, 1,
-0.832962, 0.6144151, -1.162269, 0.6862745, 1, 0, 1,
-0.8321157, -0.1833398, -1.8724, 0.6784314, 1, 0, 1,
-0.8255202, 1.308365, 0.8135704, 0.6745098, 1, 0, 1,
-0.8252167, 0.04553585, -3.237093, 0.6666667, 1, 0, 1,
-0.8169647, -1.798782, -2.458759, 0.6627451, 1, 0, 1,
-0.8108625, 0.6028615, 1.536426, 0.654902, 1, 0, 1,
-0.8080763, -0.7695501, -3.211633, 0.6509804, 1, 0, 1,
-0.8070663, -2.43759, -3.598295, 0.6431373, 1, 0, 1,
-0.7952743, -2.426916, -2.867514, 0.6392157, 1, 0, 1,
-0.7935477, 0.1025868, -0.7804722, 0.6313726, 1, 0, 1,
-0.7915788, -0.5983618, -2.167118, 0.627451, 1, 0, 1,
-0.7856633, 0.1347327, -2.623747, 0.6196079, 1, 0, 1,
-0.7795887, -0.1757584, -0.3200992, 0.6156863, 1, 0, 1,
-0.7737708, 1.17923, -1.264618, 0.6078432, 1, 0, 1,
-0.7726237, -0.8992746, -2.650349, 0.6039216, 1, 0, 1,
-0.7710394, 0.4971245, -2.389669, 0.5960785, 1, 0, 1,
-0.7687107, 0.7527745, -1.580285, 0.5882353, 1, 0, 1,
-0.7676777, 2.391257, 0.5023861, 0.5843138, 1, 0, 1,
-0.7669716, -0.4525431, -0.1719113, 0.5764706, 1, 0, 1,
-0.7627, 0.6826195, -0.4107299, 0.572549, 1, 0, 1,
-0.7582926, -1.217914, -0.9369993, 0.5647059, 1, 0, 1,
-0.7562657, 0.8433381, 0.2144741, 0.5607843, 1, 0, 1,
-0.7547772, 0.7715148, -2.012643, 0.5529412, 1, 0, 1,
-0.7544491, 0.5678163, 0.1618209, 0.5490196, 1, 0, 1,
-0.7544466, 1.253524, -0.8676269, 0.5411765, 1, 0, 1,
-0.7470921, -1.123721, -3.156917, 0.5372549, 1, 0, 1,
-0.7394347, -0.7780555, -3.597494, 0.5294118, 1, 0, 1,
-0.7391076, 0.3188144, -1.151326, 0.5254902, 1, 0, 1,
-0.7308209, 0.3388188, -3.19033, 0.5176471, 1, 0, 1,
-0.7298315, 0.6489106, -1.762734, 0.5137255, 1, 0, 1,
-0.7286823, 1.717936, -0.8632204, 0.5058824, 1, 0, 1,
-0.7279713, -0.2463223, -3.321034, 0.5019608, 1, 0, 1,
-0.7278097, 0.2234903, -0.870047, 0.4941176, 1, 0, 1,
-0.7259183, -0.3351968, -0.7486671, 0.4862745, 1, 0, 1,
-0.7235155, -0.6546507, -1.766447, 0.4823529, 1, 0, 1,
-0.7204645, 0.7117758, 0.02814722, 0.4745098, 1, 0, 1,
-0.7176847, 0.5246284, -1.942594, 0.4705882, 1, 0, 1,
-0.715546, 0.09661316, -2.588545, 0.4627451, 1, 0, 1,
-0.7124634, -1.134119, -0.1194307, 0.4588235, 1, 0, 1,
-0.7052188, -0.5228088, -0.966902, 0.4509804, 1, 0, 1,
-0.7033802, 0.6491238, -0.8170158, 0.4470588, 1, 0, 1,
-0.700615, 2.448896, -0.4466122, 0.4392157, 1, 0, 1,
-0.6941764, -1.05778, -2.838093, 0.4352941, 1, 0, 1,
-0.6898576, 0.3979425, 0.4729599, 0.427451, 1, 0, 1,
-0.686775, -1.45099, -1.8409, 0.4235294, 1, 0, 1,
-0.6826197, 0.5137289, 0.2698989, 0.4156863, 1, 0, 1,
-0.6737863, -1.475718, -2.310562, 0.4117647, 1, 0, 1,
-0.6654307, 0.6220747, -0.755505, 0.4039216, 1, 0, 1,
-0.6564538, -0.8642815, -1.864768, 0.3960784, 1, 0, 1,
-0.6563448, -0.6223648, -2.022397, 0.3921569, 1, 0, 1,
-0.6498477, -0.1487824, -1.074703, 0.3843137, 1, 0, 1,
-0.6423314, 0.1069665, -2.913704, 0.3803922, 1, 0, 1,
-0.639148, -2.368119, -3.21582, 0.372549, 1, 0, 1,
-0.6375926, 0.1969867, -1.248762, 0.3686275, 1, 0, 1,
-0.6375703, 0.2541761, -2.053934, 0.3607843, 1, 0, 1,
-0.6245656, 1.97675, -0.3254381, 0.3568628, 1, 0, 1,
-0.624417, 0.3012346, -1.928726, 0.3490196, 1, 0, 1,
-0.6210894, -1.46677, -0.7491803, 0.345098, 1, 0, 1,
-0.6192278, 0.2803969, -0.7073476, 0.3372549, 1, 0, 1,
-0.6185548, 0.09353417, -1.697827, 0.3333333, 1, 0, 1,
-0.6157205, -0.198432, -1.559727, 0.3254902, 1, 0, 1,
-0.6067327, 2.216284, -1.397921, 0.3215686, 1, 0, 1,
-0.6059997, -1.271089, -0.3332319, 0.3137255, 1, 0, 1,
-0.605552, -1.201451, -1.487629, 0.3098039, 1, 0, 1,
-0.6038852, 0.1752771, -0.7117625, 0.3019608, 1, 0, 1,
-0.5961838, 1.725949, 0.1424634, 0.2941177, 1, 0, 1,
-0.59497, 0.823317, 0.07459372, 0.2901961, 1, 0, 1,
-0.5907735, -0.5887141, -2.384007, 0.282353, 1, 0, 1,
-0.5899349, -1.573866, -2.654874, 0.2784314, 1, 0, 1,
-0.5894093, 0.5102173, -2.730327, 0.2705882, 1, 0, 1,
-0.5891815, 0.2661467, -1.569326, 0.2666667, 1, 0, 1,
-0.5859839, -0.2276883, -3.137301, 0.2588235, 1, 0, 1,
-0.5791792, 0.1251254, -0.5477282, 0.254902, 1, 0, 1,
-0.5750666, 0.05229619, -2.55435, 0.2470588, 1, 0, 1,
-0.5701011, -0.5692799, -2.73753, 0.2431373, 1, 0, 1,
-0.5647379, 0.6329121, -0.2579716, 0.2352941, 1, 0, 1,
-0.5613413, 0.9108956, -1.511756, 0.2313726, 1, 0, 1,
-0.5590059, 1.007396, -0.9863714, 0.2235294, 1, 0, 1,
-0.5497258, 0.06925402, -2.76587, 0.2196078, 1, 0, 1,
-0.5493882, 0.763507, -2.069946, 0.2117647, 1, 0, 1,
-0.5450814, 0.7142858, -1.313832, 0.2078431, 1, 0, 1,
-0.5448049, 0.9243742, -0.06094494, 0.2, 1, 0, 1,
-0.5426894, 0.6650143, -1.881041, 0.1921569, 1, 0, 1,
-0.5389102, 0.6120434, -0.9169831, 0.1882353, 1, 0, 1,
-0.5337695, 0.04887366, -2.900777, 0.1803922, 1, 0, 1,
-0.5330244, -0.356416, -2.643267, 0.1764706, 1, 0, 1,
-0.5298346, 0.2104103, -1.471403, 0.1686275, 1, 0, 1,
-0.5241846, 1.408312, -0.3874995, 0.1647059, 1, 0, 1,
-0.5210579, -0.9815821, -1.650005, 0.1568628, 1, 0, 1,
-0.5210259, -0.7892276, -4.326897, 0.1529412, 1, 0, 1,
-0.520824, -0.7887726, -2.066243, 0.145098, 1, 0, 1,
-0.5197285, 0.5169626, -0.03678515, 0.1411765, 1, 0, 1,
-0.5192532, 1.661946, 0.05127319, 0.1333333, 1, 0, 1,
-0.5170388, -0.1483301, -1.977507, 0.1294118, 1, 0, 1,
-0.5169492, -1.069371, -3.526496, 0.1215686, 1, 0, 1,
-0.5162569, 0.09681306, -1.771226, 0.1176471, 1, 0, 1,
-0.511453, 1.001867, -0.02474258, 0.1098039, 1, 0, 1,
-0.5112513, -0.5549045, -1.048276, 0.1058824, 1, 0, 1,
-0.5105519, 0.7053639, 0.2522035, 0.09803922, 1, 0, 1,
-0.5075167, -0.7226179, -2.007707, 0.09019608, 1, 0, 1,
-0.5057468, 1.742876, -0.05539457, 0.08627451, 1, 0, 1,
-0.5031945, -0.5261582, -2.398975, 0.07843138, 1, 0, 1,
-0.5020707, 1.393474, -0.201067, 0.07450981, 1, 0, 1,
-0.4995427, 0.7530056, 0.0264017, 0.06666667, 1, 0, 1,
-0.4968509, 0.5999966, -0.06019934, 0.0627451, 1, 0, 1,
-0.4900652, -0.3434421, -1.479121, 0.05490196, 1, 0, 1,
-0.4880413, -0.6922749, -1.916006, 0.05098039, 1, 0, 1,
-0.4818761, -0.9424549, -1.755789, 0.04313726, 1, 0, 1,
-0.4811679, -0.3557221, -2.383934, 0.03921569, 1, 0, 1,
-0.471921, -0.1784514, -3.360993, 0.03137255, 1, 0, 1,
-0.4709281, -1.773822, -1.800484, 0.02745098, 1, 0, 1,
-0.4671723, -0.9904741, -2.626032, 0.01960784, 1, 0, 1,
-0.4620106, -1.038871, -2.159844, 0.01568628, 1, 0, 1,
-0.4579372, 0.001300137, -1.878539, 0.007843138, 1, 0, 1,
-0.4572828, 1.890088, 0.1658639, 0.003921569, 1, 0, 1,
-0.4556506, -0.1792421, -1.898712, 0, 1, 0.003921569, 1,
-0.4505908, -0.2680554, -2.40801, 0, 1, 0.01176471, 1,
-0.4498223, 0.5475876, -0.5428633, 0, 1, 0.01568628, 1,
-0.4450703, 0.9747183, -0.8269868, 0, 1, 0.02352941, 1,
-0.4424489, 1.33884, -1.439038, 0, 1, 0.02745098, 1,
-0.4333735, -0.7693697, -3.639161, 0, 1, 0.03529412, 1,
-0.4330148, 1.153428, -0.8253582, 0, 1, 0.03921569, 1,
-0.4329696, 1.140676, -0.3267185, 0, 1, 0.04705882, 1,
-0.429738, 0.8583277, -1.995589, 0, 1, 0.05098039, 1,
-0.4223366, -2.155434, -3.055414, 0, 1, 0.05882353, 1,
-0.4200133, -0.5807557, -2.202039, 0, 1, 0.0627451, 1,
-0.4189766, -1.524867, -4.022529, 0, 1, 0.07058824, 1,
-0.4050318, 0.2029063, -3.653678, 0, 1, 0.07450981, 1,
-0.4049767, -0.2456785, -3.631185, 0, 1, 0.08235294, 1,
-0.4035973, -0.05408851, -2.343276, 0, 1, 0.08627451, 1,
-0.4023033, 1.575993, 0.4883702, 0, 1, 0.09411765, 1,
-0.4022793, -0.3543585, -5.64923, 0, 1, 0.1019608, 1,
-0.3995576, 0.4650686, -1.420594, 0, 1, 0.1058824, 1,
-0.3978617, -0.9873348, -2.520317, 0, 1, 0.1137255, 1,
-0.3902377, 0.3039184, -0.7492433, 0, 1, 0.1176471, 1,
-0.3893365, 0.4205319, -1.329688, 0, 1, 0.1254902, 1,
-0.3853316, -0.6094844, -3.691883, 0, 1, 0.1294118, 1,
-0.3848238, -0.008256728, -1.912286, 0, 1, 0.1372549, 1,
-0.3844037, 0.9201086, -1.674928, 0, 1, 0.1411765, 1,
-0.3794692, -1.143536, -1.233895, 0, 1, 0.1490196, 1,
-0.3751535, 2.077389, 1.538165, 0, 1, 0.1529412, 1,
-0.3751029, -0.2418102, -2.200288, 0, 1, 0.1607843, 1,
-0.3738332, 0.5297218, -0.4086045, 0, 1, 0.1647059, 1,
-0.3646322, -0.3712845, -2.87733, 0, 1, 0.172549, 1,
-0.3595581, -0.797245, -1.719908, 0, 1, 0.1764706, 1,
-0.358462, 0.4753721, -1.201413, 0, 1, 0.1843137, 1,
-0.352727, 0.8575771, 0.3689719, 0, 1, 0.1882353, 1,
-0.3517532, 0.5603651, 0.2488064, 0, 1, 0.1960784, 1,
-0.3496473, -0.9876926, -2.726006, 0, 1, 0.2039216, 1,
-0.3487042, -1.830326, -1.180422, 0, 1, 0.2078431, 1,
-0.3461693, -0.223885, -2.584943, 0, 1, 0.2156863, 1,
-0.3433676, 0.2222585, -2.588626, 0, 1, 0.2196078, 1,
-0.3420479, 0.08040135, 0.3312422, 0, 1, 0.227451, 1,
-0.3415967, -0.05689968, 1.216108, 0, 1, 0.2313726, 1,
-0.3409529, 0.04100989, -0.4915934, 0, 1, 0.2392157, 1,
-0.3398007, 2.716442, 1.796061, 0, 1, 0.2431373, 1,
-0.3359791, 1.726522, -1.183275, 0, 1, 0.2509804, 1,
-0.3339996, 2.073958, 0.08355612, 0, 1, 0.254902, 1,
-0.3290669, -1.138862, -2.666541, 0, 1, 0.2627451, 1,
-0.3280195, 2.301902, 0.1244861, 0, 1, 0.2666667, 1,
-0.3263249, 0.4069593, -0.7921002, 0, 1, 0.2745098, 1,
-0.3244655, -0.387664, -2.44575, 0, 1, 0.2784314, 1,
-0.3223224, -0.4037106, -3.190063, 0, 1, 0.2862745, 1,
-0.3220482, -1.864732, -2.973752, 0, 1, 0.2901961, 1,
-0.3184789, 0.741643, 0.136172, 0, 1, 0.2980392, 1,
-0.311098, -0.0837989, -1.946925, 0, 1, 0.3058824, 1,
-0.3082638, -0.7156609, -3.13897, 0, 1, 0.3098039, 1,
-0.306228, -0.6661664, -2.447469, 0, 1, 0.3176471, 1,
-0.3060331, 0.1599559, -0.8202155, 0, 1, 0.3215686, 1,
-0.3049355, 0.4459168, -0.778269, 0, 1, 0.3294118, 1,
-0.3042895, 0.7707509, -0.0001195553, 0, 1, 0.3333333, 1,
-0.3041173, -0.08244645, -2.776768, 0, 1, 0.3411765, 1,
-0.3018756, 1.176985, 0.3226404, 0, 1, 0.345098, 1,
-0.2943494, -0.00964672, -2.076061, 0, 1, 0.3529412, 1,
-0.2916711, 1.793372, -0.4928242, 0, 1, 0.3568628, 1,
-0.2865033, -0.3568791, -2.907544, 0, 1, 0.3647059, 1,
-0.2850073, 0.4553433, -0.5578045, 0, 1, 0.3686275, 1,
-0.284721, -0.2184799, -2.503561, 0, 1, 0.3764706, 1,
-0.2824778, 0.05719491, -3.011826, 0, 1, 0.3803922, 1,
-0.2768419, -0.1676303, -2.610303, 0, 1, 0.3882353, 1,
-0.2762524, -0.1411006, -2.112303, 0, 1, 0.3921569, 1,
-0.27451, 0.8487768, -0.3266761, 0, 1, 0.4, 1,
-0.2741349, 1.623456, 0.1070948, 0, 1, 0.4078431, 1,
-0.2689651, 0.4446985, 0.9635324, 0, 1, 0.4117647, 1,
-0.2639044, -0.391424, -2.496707, 0, 1, 0.4196078, 1,
-0.2630813, -1.193089, -5.554202, 0, 1, 0.4235294, 1,
-0.2602794, 0.2837512, -1.067257, 0, 1, 0.4313726, 1,
-0.2594483, 0.9247002, 0.234731, 0, 1, 0.4352941, 1,
-0.2589358, -0.1477942, -1.957921, 0, 1, 0.4431373, 1,
-0.2537581, -1.20897, -3.405123, 0, 1, 0.4470588, 1,
-0.2521529, -3.396986, -1.796629, 0, 1, 0.454902, 1,
-0.249897, -1.677658, -3.777571, 0, 1, 0.4588235, 1,
-0.2469741, -0.2148342, -2.69134, 0, 1, 0.4666667, 1,
-0.2464792, 1.813131, -0.609733, 0, 1, 0.4705882, 1,
-0.2463108, 0.5330442, -1.31309, 0, 1, 0.4784314, 1,
-0.2462012, -1.903026, -0.7776129, 0, 1, 0.4823529, 1,
-0.2450674, 1.246469, -0.04544521, 0, 1, 0.4901961, 1,
-0.2396982, -0.840193, -1.333563, 0, 1, 0.4941176, 1,
-0.2380154, -0.2964614, -2.657041, 0, 1, 0.5019608, 1,
-0.2322153, 1.097159, 0.1870739, 0, 1, 0.509804, 1,
-0.2309058, 0.4555033, -0.9882375, 0, 1, 0.5137255, 1,
-0.2263311, -1.32574, -3.894707, 0, 1, 0.5215687, 1,
-0.2187068, 0.5901403, -2.313851, 0, 1, 0.5254902, 1,
-0.2186335, -0.4986497, -0.02435312, 0, 1, 0.5333334, 1,
-0.2160187, 1.158858, -1.746286, 0, 1, 0.5372549, 1,
-0.2098461, -0.8094274, -2.07646, 0, 1, 0.5450981, 1,
-0.2075897, -2.309072, -3.119569, 0, 1, 0.5490196, 1,
-0.2069478, 1.045055, -0.08732214, 0, 1, 0.5568628, 1,
-0.2041146, 0.7764578, -1.284247, 0, 1, 0.5607843, 1,
-0.2033935, -1.892552, -3.469653, 0, 1, 0.5686275, 1,
-0.2016959, -0.4693607, -1.976251, 0, 1, 0.572549, 1,
-0.1958842, 0.07107415, 0.9318779, 0, 1, 0.5803922, 1,
-0.1958459, -1.214784, -2.272632, 0, 1, 0.5843138, 1,
-0.1926387, 1.059394, -0.5435075, 0, 1, 0.5921569, 1,
-0.1890021, -0.1241818, -2.385527, 0, 1, 0.5960785, 1,
-0.1866257, -0.481833, -3.438595, 0, 1, 0.6039216, 1,
-0.1849172, 0.911884, -1.561075, 0, 1, 0.6117647, 1,
-0.1717142, 0.5625489, 1.109513, 0, 1, 0.6156863, 1,
-0.1690955, -0.6074688, -2.954499, 0, 1, 0.6235294, 1,
-0.1678944, 1.293892, -1.039865, 0, 1, 0.627451, 1,
-0.1667737, -0.2855418, -1.275669, 0, 1, 0.6352941, 1,
-0.1664412, -2.48139, -4.008848, 0, 1, 0.6392157, 1,
-0.1651837, 0.579161, 1.648865, 0, 1, 0.6470588, 1,
-0.1646287, 2.011957, 0.517593, 0, 1, 0.6509804, 1,
-0.1636537, -0.7385818, -3.051877, 0, 1, 0.6588235, 1,
-0.1625716, -0.4294048, -3.312512, 0, 1, 0.6627451, 1,
-0.1620547, 0.2075715, -0.01191774, 0, 1, 0.6705883, 1,
-0.1607124, -1.076838, -3.142515, 0, 1, 0.6745098, 1,
-0.1586287, -1.327264, -1.967579, 0, 1, 0.682353, 1,
-0.1584772, 1.063163, 1.044395, 0, 1, 0.6862745, 1,
-0.1562197, 0.2408367, -1.073406, 0, 1, 0.6941177, 1,
-0.1554416, 0.9658625, -1.596765, 0, 1, 0.7019608, 1,
-0.1528799, 0.769914, 0.0003127012, 0, 1, 0.7058824, 1,
-0.1431259, 2.272134, -0.05698585, 0, 1, 0.7137255, 1,
-0.13911, -1.013655, -5.78232, 0, 1, 0.7176471, 1,
-0.1245651, 0.5934494, -0.6327332, 0, 1, 0.7254902, 1,
-0.1218533, 0.8020596, -1.010136, 0, 1, 0.7294118, 1,
-0.1217865, -0.3904184, -2.904879, 0, 1, 0.7372549, 1,
-0.1204669, -0.07295771, -1.396039, 0, 1, 0.7411765, 1,
-0.1199914, -0.0746948, -3.072591, 0, 1, 0.7490196, 1,
-0.116795, -1.321602, -3.706906, 0, 1, 0.7529412, 1,
-0.116201, -1.753998, -3.104262, 0, 1, 0.7607843, 1,
-0.1161469, 0.6825265, -0.7924461, 0, 1, 0.7647059, 1,
-0.1146353, 0.3852068, 1.729172, 0, 1, 0.772549, 1,
-0.1115072, -0.1202866, -3.020118, 0, 1, 0.7764706, 1,
-0.1067303, 1.257837, -0.37153, 0, 1, 0.7843137, 1,
-0.1060816, -0.764082, -3.770746, 0, 1, 0.7882353, 1,
-0.1055624, 0.08013289, -1.793044, 0, 1, 0.7960784, 1,
-0.1000809, 0.7649949, 0.0007353363, 0, 1, 0.8039216, 1,
-0.09966108, 1.238493, -2.582531, 0, 1, 0.8078431, 1,
-0.0971643, 0.5754869, -1.786645, 0, 1, 0.8156863, 1,
-0.09692845, -0.08317003, -1.512658, 0, 1, 0.8196079, 1,
-0.09146015, 0.1569662, 0.6040694, 0, 1, 0.827451, 1,
-0.09097623, -0.7833324, -3.38079, 0, 1, 0.8313726, 1,
-0.08525513, 0.4803913, -0.310137, 0, 1, 0.8392157, 1,
-0.08047683, 0.1087451, -0.2993771, 0, 1, 0.8431373, 1,
-0.0798498, 0.2971722, -0.6767182, 0, 1, 0.8509804, 1,
-0.07895496, -0.2276957, -3.739462, 0, 1, 0.854902, 1,
-0.0771705, 0.4699155, -0.7473212, 0, 1, 0.8627451, 1,
-0.06201909, 0.4265397, -0.6424224, 0, 1, 0.8666667, 1,
-0.06140518, 0.9516922, 1.788376, 0, 1, 0.8745098, 1,
-0.06106719, 1.055711, -0.2305551, 0, 1, 0.8784314, 1,
-0.0607191, -0.872658, -2.360232, 0, 1, 0.8862745, 1,
-0.05997226, -0.1177177, -2.416006, 0, 1, 0.8901961, 1,
-0.05848697, 0.0646201, -2.221704, 0, 1, 0.8980392, 1,
-0.05808391, 1.108541, -0.523962, 0, 1, 0.9058824, 1,
-0.05803878, -1.988918, -2.877324, 0, 1, 0.9098039, 1,
-0.05421215, -0.7143014, -4.585809, 0, 1, 0.9176471, 1,
-0.05239531, -1.033768, -4.124021, 0, 1, 0.9215686, 1,
-0.05022681, 3.022087, 1.005313, 0, 1, 0.9294118, 1,
-0.05022548, 1.215584, 0.1783402, 0, 1, 0.9333333, 1,
-0.0501927, 1.52438, -0.1211494, 0, 1, 0.9411765, 1,
-0.04992612, -1.439329, -3.132078, 0, 1, 0.945098, 1,
-0.0483711, -0.03304651, -4.786691, 0, 1, 0.9529412, 1,
-0.04771376, 0.02600835, -0.5270672, 0, 1, 0.9568627, 1,
-0.0467131, 0.4834538, -1.641346, 0, 1, 0.9647059, 1,
-0.04443075, 0.5938212, -0.6738048, 0, 1, 0.9686275, 1,
-0.03792804, 0.8402807, 0.5224324, 0, 1, 0.9764706, 1,
-0.03683671, -0.2821623, -6.01705, 0, 1, 0.9803922, 1,
-0.03642952, -0.5313336, -2.524092, 0, 1, 0.9882353, 1,
-0.03612047, 0.5315205, 0.09654704, 0, 1, 0.9921569, 1,
-0.03457786, -0.4318412, -2.155844, 0, 1, 1, 1,
-0.03300902, -1.150247, -0.8292887, 0, 0.9921569, 1, 1,
-0.03256895, 0.3685302, 0.07416975, 0, 0.9882353, 1, 1,
-0.02542306, -0.1207207, -2.390874, 0, 0.9803922, 1, 1,
-0.02528471, 0.4454977, -1.300272, 0, 0.9764706, 1, 1,
-0.02480334, -1.063722, -3.578121, 0, 0.9686275, 1, 1,
-0.02428602, 1.921513, 0.5589989, 0, 0.9647059, 1, 1,
-0.0222851, -0.4917807, -2.963032, 0, 0.9568627, 1, 1,
-0.01705853, -0.8077002, -2.969192, 0, 0.9529412, 1, 1,
-0.01094892, -0.2697681, -3.175084, 0, 0.945098, 1, 1,
-0.01085909, 2.013449, 0.166025, 0, 0.9411765, 1, 1,
-0.008563017, -1.113045, -4.594502, 0, 0.9333333, 1, 1,
-0.007931489, -0.2185734, -4.942482, 0, 0.9294118, 1, 1,
-0.006969769, -0.8152303, -1.279871, 0, 0.9215686, 1, 1,
-0.005858063, 0.8474249, 0.719787, 0, 0.9176471, 1, 1,
-0.003347201, -1.372021, -2.042331, 0, 0.9098039, 1, 1,
-0.001198872, 0.5350685, 1.54397, 0, 0.9058824, 1, 1,
0.001174705, -1.112878, 4.773953, 0, 0.8980392, 1, 1,
0.003541604, 0.298333, 0.4349824, 0, 0.8901961, 1, 1,
0.004149552, -0.08469047, 2.534803, 0, 0.8862745, 1, 1,
0.005020583, -1.172173, 2.575411, 0, 0.8784314, 1, 1,
0.006123898, -0.1724646, 3.074461, 0, 0.8745098, 1, 1,
0.007093104, 0.6903036, -0.6351408, 0, 0.8666667, 1, 1,
0.01333372, 0.9102706, -0.4216754, 0, 0.8627451, 1, 1,
0.01463311, -0.1780146, 3.844026, 0, 0.854902, 1, 1,
0.01874026, -0.490373, 2.217412, 0, 0.8509804, 1, 1,
0.02384871, -0.9367538, 3.008731, 0, 0.8431373, 1, 1,
0.02390797, -2.311873, 4.745694, 0, 0.8392157, 1, 1,
0.02939156, 1.671082, 0.3901607, 0, 0.8313726, 1, 1,
0.03063176, 1.232156, 0.07649248, 0, 0.827451, 1, 1,
0.03220828, -1.333914, 2.978611, 0, 0.8196079, 1, 1,
0.03431918, -1.178265, 4.871182, 0, 0.8156863, 1, 1,
0.03497211, 0.01409686, 0.9792109, 0, 0.8078431, 1, 1,
0.04089305, 1.15385, -0.527092, 0, 0.8039216, 1, 1,
0.04173349, 0.8767251, -0.3766813, 0, 0.7960784, 1, 1,
0.04188498, 0.0894248, 0.9514236, 0, 0.7882353, 1, 1,
0.05690271, 1.36327, -0.4610648, 0, 0.7843137, 1, 1,
0.0588451, -0.007942969, 0.3090662, 0, 0.7764706, 1, 1,
0.06275003, -0.1988636, 2.757824, 0, 0.772549, 1, 1,
0.06299739, -0.5573007, 4.558507, 0, 0.7647059, 1, 1,
0.06471238, -1.799932, 4.614164, 0, 0.7607843, 1, 1,
0.06523667, 0.1987854, -0.5527939, 0, 0.7529412, 1, 1,
0.06715848, -0.5624455, 3.510567, 0, 0.7490196, 1, 1,
0.07021058, 1.288266, 0.5047008, 0, 0.7411765, 1, 1,
0.0706915, 1.030875, -3.266503, 0, 0.7372549, 1, 1,
0.07401835, 0.2964196, 0.520178, 0, 0.7294118, 1, 1,
0.07845781, -0.638001, 4.708976, 0, 0.7254902, 1, 1,
0.07973757, -0.1968559, 3.702436, 0, 0.7176471, 1, 1,
0.07978092, 0.5202159, 3.391467, 0, 0.7137255, 1, 1,
0.08106431, 1.550064, 1.956599, 0, 0.7058824, 1, 1,
0.08119155, 0.3942832, 0.4736528, 0, 0.6980392, 1, 1,
0.08460678, 0.1774687, 0.7768676, 0, 0.6941177, 1, 1,
0.08645102, 2.558633, -1.555859, 0, 0.6862745, 1, 1,
0.09201377, 0.8191456, -1.295198, 0, 0.682353, 1, 1,
0.09227058, -1.361356, 3.539466, 0, 0.6745098, 1, 1,
0.09339089, -1.087808, 3.38629, 0, 0.6705883, 1, 1,
0.09455107, 0.3950864, -1.484059, 0, 0.6627451, 1, 1,
0.09677282, -2.131969, 1.872796, 0, 0.6588235, 1, 1,
0.09997397, 0.516235, -0.9387392, 0, 0.6509804, 1, 1,
0.1045529, 1.808343, 1.120719, 0, 0.6470588, 1, 1,
0.1101875, 1.692048, 0.3927875, 0, 0.6392157, 1, 1,
0.1106468, 1.006036, -0.04292646, 0, 0.6352941, 1, 1,
0.1170502, -1.505306, 3.016428, 0, 0.627451, 1, 1,
0.1181563, -1.885408, 3.630244, 0, 0.6235294, 1, 1,
0.1183122, -0.1133999, 2.269762, 0, 0.6156863, 1, 1,
0.1201221, 0.4731067, -1.38472, 0, 0.6117647, 1, 1,
0.1211907, -0.5575774, 3.528068, 0, 0.6039216, 1, 1,
0.1214729, 1.187417, -0.3431334, 0, 0.5960785, 1, 1,
0.1216181, -1.034323, 3.298243, 0, 0.5921569, 1, 1,
0.1243867, 0.1000843, 1.185589, 0, 0.5843138, 1, 1,
0.1292295, -0.612231, 2.732395, 0, 0.5803922, 1, 1,
0.1348123, -1.034544, 5.224729, 0, 0.572549, 1, 1,
0.143408, -0.1867839, 1.982668, 0, 0.5686275, 1, 1,
0.1449369, 0.7907594, 2.20768, 0, 0.5607843, 1, 1,
0.1458589, 1.105987, 0.699134, 0, 0.5568628, 1, 1,
0.1460618, -0.5845919, 2.804274, 0, 0.5490196, 1, 1,
0.1514736, -0.6209294, 4.331774, 0, 0.5450981, 1, 1,
0.1557872, -0.9213116, 2.812064, 0, 0.5372549, 1, 1,
0.157463, -1.054554, 2.174379, 0, 0.5333334, 1, 1,
0.1599411, -0.6038066, 4.341036, 0, 0.5254902, 1, 1,
0.1635068, -1.862168, 2.99653, 0, 0.5215687, 1, 1,
0.1647718, -0.7164192, 2.971429, 0, 0.5137255, 1, 1,
0.1705467, 0.6355541, 1.975662, 0, 0.509804, 1, 1,
0.1731649, -0.6876381, 2.322988, 0, 0.5019608, 1, 1,
0.1739463, 0.1013597, -0.0164083, 0, 0.4941176, 1, 1,
0.1772987, 2.497299, -1.020526, 0, 0.4901961, 1, 1,
0.1773477, -0.2351472, 2.402133, 0, 0.4823529, 1, 1,
0.1815862, 2.200867, 0.3649494, 0, 0.4784314, 1, 1,
0.1853852, -0.6352108, 3.217929, 0, 0.4705882, 1, 1,
0.1862233, 0.5697648, 0.2395851, 0, 0.4666667, 1, 1,
0.1919473, 2.557131, 2.297864, 0, 0.4588235, 1, 1,
0.2022254, 1.874808, -1.223796, 0, 0.454902, 1, 1,
0.2084828, -0.6221622, 4.227329, 0, 0.4470588, 1, 1,
0.2116722, -0.5572018, 2.337862, 0, 0.4431373, 1, 1,
0.2145925, -1.975995, 3.977576, 0, 0.4352941, 1, 1,
0.2170048, 0.8855028, -0.2566252, 0, 0.4313726, 1, 1,
0.217326, -0.4476248, 2.71656, 0, 0.4235294, 1, 1,
0.2196399, -0.4382341, 1.632982, 0, 0.4196078, 1, 1,
0.2203724, 1.065314, -1.012023, 0, 0.4117647, 1, 1,
0.222642, 2.142021, -0.09448025, 0, 0.4078431, 1, 1,
0.227822, -0.6705434, 3.458571, 0, 0.4, 1, 1,
0.2296171, 1.049185, 1.372477, 0, 0.3921569, 1, 1,
0.2347993, -0.2451587, 2.049363, 0, 0.3882353, 1, 1,
0.2352557, 2.014504, -0.2035867, 0, 0.3803922, 1, 1,
0.2405181, 1.453402, -0.208911, 0, 0.3764706, 1, 1,
0.2406037, -0.5666566, 0.7320228, 0, 0.3686275, 1, 1,
0.2411591, 0.4268447, 0.8802319, 0, 0.3647059, 1, 1,
0.2419562, -0.5943243, 4.237675, 0, 0.3568628, 1, 1,
0.245537, -0.04823494, 0.9474119, 0, 0.3529412, 1, 1,
0.2459527, 0.1947666, 2.758581, 0, 0.345098, 1, 1,
0.2473457, 0.3767726, -0.05514531, 0, 0.3411765, 1, 1,
0.2536229, 1.126366, 0.8951449, 0, 0.3333333, 1, 1,
0.2549354, 0.1377825, 0.5595205, 0, 0.3294118, 1, 1,
0.2551138, -0.6401117, 3.573654, 0, 0.3215686, 1, 1,
0.2556184, 0.5577199, 2.538015, 0, 0.3176471, 1, 1,
0.2591246, -0.332636, 1.295229, 0, 0.3098039, 1, 1,
0.2595221, 0.4545396, -0.6004742, 0, 0.3058824, 1, 1,
0.2614411, -0.4042222, 2.647999, 0, 0.2980392, 1, 1,
0.2647969, -0.5499599, 2.373839, 0, 0.2901961, 1, 1,
0.266753, 1.548922, 0.03980988, 0, 0.2862745, 1, 1,
0.2710368, -0.6934116, 1.989424, 0, 0.2784314, 1, 1,
0.274204, 0.9301355, 1.174674, 0, 0.2745098, 1, 1,
0.2766682, 1.111749, -0.993944, 0, 0.2666667, 1, 1,
0.2880567, -1.770924, 3.131972, 0, 0.2627451, 1, 1,
0.2894277, -0.8519797, 2.715955, 0, 0.254902, 1, 1,
0.2910119, 0.7594318, 1.082369, 0, 0.2509804, 1, 1,
0.2927046, 0.01267383, 1.72632, 0, 0.2431373, 1, 1,
0.2959935, -1.148754, 2.581532, 0, 0.2392157, 1, 1,
0.3013248, 1.094569, 1.13093, 0, 0.2313726, 1, 1,
0.301482, -0.2834204, 2.647639, 0, 0.227451, 1, 1,
0.3053115, -1.969177, 4.222432, 0, 0.2196078, 1, 1,
0.3104429, 1.314327, -0.7712765, 0, 0.2156863, 1, 1,
0.3107508, 0.3696149, 0.9811292, 0, 0.2078431, 1, 1,
0.3193971, -1.782984, 2.105258, 0, 0.2039216, 1, 1,
0.3229529, 0.6777465, 0.4942498, 0, 0.1960784, 1, 1,
0.3280973, -0.04972881, 0.663451, 0, 0.1882353, 1, 1,
0.3438747, -0.3603143, 2.702136, 0, 0.1843137, 1, 1,
0.3443604, 0.3805307, 2.467016, 0, 0.1764706, 1, 1,
0.3483053, 0.6953033, -0.3451381, 0, 0.172549, 1, 1,
0.356223, 0.483398, -0.810856, 0, 0.1647059, 1, 1,
0.3583547, -0.8345473, 2.367514, 0, 0.1607843, 1, 1,
0.3589279, -1.094714, 3.183736, 0, 0.1529412, 1, 1,
0.3604685, -0.7658303, 3.077901, 0, 0.1490196, 1, 1,
0.3634866, -0.8283284, 2.753901, 0, 0.1411765, 1, 1,
0.3648028, 0.9103407, -0.8862543, 0, 0.1372549, 1, 1,
0.3721122, -0.4883075, 1.891646, 0, 0.1294118, 1, 1,
0.3731223, 0.9047937, -1.024128, 0, 0.1254902, 1, 1,
0.3766112, -0.5885513, 4.231999, 0, 0.1176471, 1, 1,
0.3780341, 0.2334804, 2.936625, 0, 0.1137255, 1, 1,
0.3782559, -0.1438682, 1.668983, 0, 0.1058824, 1, 1,
0.3828954, 1.306972, 1.316085, 0, 0.09803922, 1, 1,
0.3838747, -1.005671, 3.951559, 0, 0.09411765, 1, 1,
0.3839398, -0.3690795, -0.6233866, 0, 0.08627451, 1, 1,
0.3853441, -0.06037555, 1.309588, 0, 0.08235294, 1, 1,
0.3861253, 1.296906, 0.7756851, 0, 0.07450981, 1, 1,
0.3893543, -1.71456, 2.621013, 0, 0.07058824, 1, 1,
0.3935793, 1.17039, 0.9700447, 0, 0.0627451, 1, 1,
0.3965701, -1.63476, 2.290656, 0, 0.05882353, 1, 1,
0.3987635, -1.184475, 1.581011, 0, 0.05098039, 1, 1,
0.4061722, 0.7301921, 0.816232, 0, 0.04705882, 1, 1,
0.4061944, -1.411165, 1.515015, 0, 0.03921569, 1, 1,
0.4063467, -0.2257583, 0.7385492, 0, 0.03529412, 1, 1,
0.4087401, -0.707217, 3.152661, 0, 0.02745098, 1, 1,
0.4132062, -0.1649262, 1.338838, 0, 0.02352941, 1, 1,
0.4185587, 0.1462346, 1.120474, 0, 0.01568628, 1, 1,
0.4200948, -0.5666326, 1.97705, 0, 0.01176471, 1, 1,
0.4228708, -0.112252, 1.509189, 0, 0.003921569, 1, 1,
0.4280095, 0.3693232, 1.087655, 0.003921569, 0, 1, 1,
0.4356393, -0.1925805, 1.914843, 0.007843138, 0, 1, 1,
0.4392336, 0.8439204, 1.723613, 0.01568628, 0, 1, 1,
0.4397088, -0.7686996, 1.337816, 0.01960784, 0, 1, 1,
0.439851, 1.199524, 1.680427, 0.02745098, 0, 1, 1,
0.4411289, 1.556135, 0.3987136, 0.03137255, 0, 1, 1,
0.4431484, 0.9080238, -0.702598, 0.03921569, 0, 1, 1,
0.4448305, -0.2006181, 0.9481642, 0.04313726, 0, 1, 1,
0.447138, -1.003685, 0.1504785, 0.05098039, 0, 1, 1,
0.447166, -0.08069274, 1.229223, 0.05490196, 0, 1, 1,
0.4472702, -0.1274515, 2.874331, 0.0627451, 0, 1, 1,
0.4494437, 0.00321788, 0.14746, 0.06666667, 0, 1, 1,
0.4499901, 0.2707953, -0.625121, 0.07450981, 0, 1, 1,
0.4507643, 1.455192, -2.110133, 0.07843138, 0, 1, 1,
0.4541913, -1.172048, 2.440665, 0.08627451, 0, 1, 1,
0.4560211, 0.5589071, 1.125526, 0.09019608, 0, 1, 1,
0.456358, -1.079612, 0.2717321, 0.09803922, 0, 1, 1,
0.4578682, -1.589571, 4.092094, 0.1058824, 0, 1, 1,
0.4586803, 0.5754499, -0.01837605, 0.1098039, 0, 1, 1,
0.4614768, 0.3477087, 0.6068702, 0.1176471, 0, 1, 1,
0.4615611, 0.6788, 0.0105728, 0.1215686, 0, 1, 1,
0.4624225, 0.3767797, 0.9456285, 0.1294118, 0, 1, 1,
0.4676841, 0.1542181, 2.60608, 0.1333333, 0, 1, 1,
0.4677888, -0.6476838, 2.858752, 0.1411765, 0, 1, 1,
0.4678186, -0.8831823, 3.432836, 0.145098, 0, 1, 1,
0.4681881, -0.2894, 1.406156, 0.1529412, 0, 1, 1,
0.471379, -1.553407, 4.096635, 0.1568628, 0, 1, 1,
0.4715789, -0.8157468, 4.290836, 0.1647059, 0, 1, 1,
0.4775206, 0.3348533, 0.2456364, 0.1686275, 0, 1, 1,
0.4802578, -0.01894925, 1.851383, 0.1764706, 0, 1, 1,
0.481367, -1.195903, 4.178532, 0.1803922, 0, 1, 1,
0.4827569, -1.26802, 1.426789, 0.1882353, 0, 1, 1,
0.4837705, 0.2658422, 2.114822, 0.1921569, 0, 1, 1,
0.4841374, 0.5479392, -0.6677522, 0.2, 0, 1, 1,
0.4883697, -0.8417886, 0.402155, 0.2078431, 0, 1, 1,
0.4896595, 1.22481, -2.190626, 0.2117647, 0, 1, 1,
0.4963968, -0.5292877, 3.544897, 0.2196078, 0, 1, 1,
0.4974714, 1.594773, -0.2431962, 0.2235294, 0, 1, 1,
0.4998035, 0.3296365, 0.07612659, 0.2313726, 0, 1, 1,
0.4998036, -1.492891, 2.121214, 0.2352941, 0, 1, 1,
0.5020426, -0.7401326, 1.010085, 0.2431373, 0, 1, 1,
0.5050724, 0.5198466, -0.5227044, 0.2470588, 0, 1, 1,
0.5053756, 1.166222, 1.086107, 0.254902, 0, 1, 1,
0.5090194, -0.8581576, 1.562801, 0.2588235, 0, 1, 1,
0.5091016, 1.406696, 0.2656105, 0.2666667, 0, 1, 1,
0.5390612, 1.333095, 1.845086, 0.2705882, 0, 1, 1,
0.5398397, 1.13367, 1.340134, 0.2784314, 0, 1, 1,
0.5405574, 0.1412313, 1.977588, 0.282353, 0, 1, 1,
0.5455523, 1.046382, -0.2382356, 0.2901961, 0, 1, 1,
0.548867, 0.6265373, 1.695829, 0.2941177, 0, 1, 1,
0.5538059, -2.154578, 2.961868, 0.3019608, 0, 1, 1,
0.5553308, 0.7453695, 2.528676, 0.3098039, 0, 1, 1,
0.5577076, 1.70138, 0.7419628, 0.3137255, 0, 1, 1,
0.5584443, 1.551644, 2.168334, 0.3215686, 0, 1, 1,
0.5618736, -0.5861562, 2.30551, 0.3254902, 0, 1, 1,
0.5706544, -0.07598245, -0.2173726, 0.3333333, 0, 1, 1,
0.5726178, -0.90725, 2.025417, 0.3372549, 0, 1, 1,
0.5817091, -0.5336465, 2.65107, 0.345098, 0, 1, 1,
0.5888929, -0.3474126, 1.20108, 0.3490196, 0, 1, 1,
0.5891807, 0.9079108, 2.129484, 0.3568628, 0, 1, 1,
0.589842, 0.5279792, 0.1820211, 0.3607843, 0, 1, 1,
0.5916121, -1.450033, 1.114592, 0.3686275, 0, 1, 1,
0.5944634, -0.1412551, 1.469321, 0.372549, 0, 1, 1,
0.5999107, 1.269585, 0.03468261, 0.3803922, 0, 1, 1,
0.600468, 1.580061, 1.390046, 0.3843137, 0, 1, 1,
0.6008773, -0.0148678, 1.035735, 0.3921569, 0, 1, 1,
0.6017233, -1.099482, 3.386317, 0.3960784, 0, 1, 1,
0.6037526, 0.3245697, 1.590979, 0.4039216, 0, 1, 1,
0.6073472, -0.4974096, 1.685307, 0.4117647, 0, 1, 1,
0.613484, 1.98953, 1.651705, 0.4156863, 0, 1, 1,
0.6153944, -0.1341973, 1.656692, 0.4235294, 0, 1, 1,
0.6154684, -0.4314186, 1.978908, 0.427451, 0, 1, 1,
0.6163265, 0.185078, 1.874995, 0.4352941, 0, 1, 1,
0.6199282, -1.27232, 2.722317, 0.4392157, 0, 1, 1,
0.6201186, -0.5532343, 2.825566, 0.4470588, 0, 1, 1,
0.631209, 1.081269, -0.1392022, 0.4509804, 0, 1, 1,
0.6365475, -0.8350393, 0.2871688, 0.4588235, 0, 1, 1,
0.6423274, 1.287825, 1.051331, 0.4627451, 0, 1, 1,
0.6458565, -0.5863776, 2.769834, 0.4705882, 0, 1, 1,
0.6532819, -0.8025185, 1.878489, 0.4745098, 0, 1, 1,
0.6599036, -0.4020747, 2.485797, 0.4823529, 0, 1, 1,
0.6693305, 0.4912704, 1.386597, 0.4862745, 0, 1, 1,
0.6696668, 0.7431689, 0.3246713, 0.4941176, 0, 1, 1,
0.6709205, -1.516907, 3.42941, 0.5019608, 0, 1, 1,
0.672883, -0.6272784, 3.656581, 0.5058824, 0, 1, 1,
0.6763617, -1.157972, 2.789477, 0.5137255, 0, 1, 1,
0.6780791, 0.8452258, 3.004323, 0.5176471, 0, 1, 1,
0.679148, 0.22593, 1.550302, 0.5254902, 0, 1, 1,
0.6806496, -0.07777768, 0.7492594, 0.5294118, 0, 1, 1,
0.6831223, -2.922458, 2.592517, 0.5372549, 0, 1, 1,
0.6853209, 1.539109, -1.098966, 0.5411765, 0, 1, 1,
0.6955165, -0.7348159, 2.945092, 0.5490196, 0, 1, 1,
0.6972802, -0.3411274, 2.635426, 0.5529412, 0, 1, 1,
0.6981777, -1.06954, 2.259767, 0.5607843, 0, 1, 1,
0.7021735, -0.4494559, 0.9740199, 0.5647059, 0, 1, 1,
0.7026842, -0.2984567, 3.441072, 0.572549, 0, 1, 1,
0.7077802, -0.01052075, 1.998124, 0.5764706, 0, 1, 1,
0.7193946, 0.08832522, 1.962432, 0.5843138, 0, 1, 1,
0.7221298, 1.35915, 0.4314186, 0.5882353, 0, 1, 1,
0.7221898, -0.9911643, 3.017359, 0.5960785, 0, 1, 1,
0.7235343, 0.02633379, 2.343491, 0.6039216, 0, 1, 1,
0.724879, 0.1239572, -0.08483863, 0.6078432, 0, 1, 1,
0.7264937, -0.6860836, 0.8217978, 0.6156863, 0, 1, 1,
0.7292638, 0.2224403, 1.263193, 0.6196079, 0, 1, 1,
0.7295853, 0.5815919, 0.5563675, 0.627451, 0, 1, 1,
0.7363961, 0.8227347, -0.1843968, 0.6313726, 0, 1, 1,
0.7437746, -1.499366, 3.231647, 0.6392157, 0, 1, 1,
0.745802, -0.1129708, 2.049165, 0.6431373, 0, 1, 1,
0.7478521, 1.08716, 2.300532, 0.6509804, 0, 1, 1,
0.7540547, 0.9116238, 0.1092456, 0.654902, 0, 1, 1,
0.7608463, -0.8880573, 0.9959122, 0.6627451, 0, 1, 1,
0.7625617, 0.5225343, 1.119694, 0.6666667, 0, 1, 1,
0.7687504, -0.1389254, 1.869795, 0.6745098, 0, 1, 1,
0.770836, -0.7406843, 2.583046, 0.6784314, 0, 1, 1,
0.7708839, -1.209168, 3.509611, 0.6862745, 0, 1, 1,
0.773696, 0.536422, 0.7937948, 0.6901961, 0, 1, 1,
0.7741549, -0.05429621, 1.317204, 0.6980392, 0, 1, 1,
0.7747177, 0.08827604, 1.477964, 0.7058824, 0, 1, 1,
0.77609, 0.8289054, -0.8425078, 0.7098039, 0, 1, 1,
0.7766705, -0.6370875, 2.76605, 0.7176471, 0, 1, 1,
0.7801853, -1.733255, 2.870866, 0.7215686, 0, 1, 1,
0.7813643, -1.447081, 1.557971, 0.7294118, 0, 1, 1,
0.7823458, 0.5037266, 1.634828, 0.7333333, 0, 1, 1,
0.7885199, 0.08578069, -0.645466, 0.7411765, 0, 1, 1,
0.7969033, 2.137083, -0.4936477, 0.7450981, 0, 1, 1,
0.7977058, -0.4621242, 2.43843, 0.7529412, 0, 1, 1,
0.7990251, -0.9355483, 0.8996161, 0.7568628, 0, 1, 1,
0.8044422, 0.03764925, 1.226359, 0.7647059, 0, 1, 1,
0.8058166, -0.5954441, 1.706279, 0.7686275, 0, 1, 1,
0.8067436, -0.2512554, 3.04945, 0.7764706, 0, 1, 1,
0.8085932, -1.564331, 3.319029, 0.7803922, 0, 1, 1,
0.8129629, -0.5833619, 2.222399, 0.7882353, 0, 1, 1,
0.822533, 1.089561, -1.021672, 0.7921569, 0, 1, 1,
0.8327798, 1.253416, 2.11324, 0.8, 0, 1, 1,
0.8352017, -0.8267909, 2.043625, 0.8078431, 0, 1, 1,
0.8373834, -1.071602, 3.042083, 0.8117647, 0, 1, 1,
0.8442768, -1.26371, 1.610917, 0.8196079, 0, 1, 1,
0.8468891, -2.08229, 1.127307, 0.8235294, 0, 1, 1,
0.8469704, 1.205479, 0.2237635, 0.8313726, 0, 1, 1,
0.8492205, 0.5468162, 1.245585, 0.8352941, 0, 1, 1,
0.8598747, -2.055856, 3.796571, 0.8431373, 0, 1, 1,
0.8640631, 1.126298, 2.312519, 0.8470588, 0, 1, 1,
0.8647764, 0.2691554, 0.111044, 0.854902, 0, 1, 1,
0.867284, 1.276589, -0.1484117, 0.8588235, 0, 1, 1,
0.8702661, -0.1782064, 2.541641, 0.8666667, 0, 1, 1,
0.8758346, -0.2815598, 2.080681, 0.8705882, 0, 1, 1,
0.8764627, 1.249991, 2.794932, 0.8784314, 0, 1, 1,
0.8788937, 2.000437, -0.4969249, 0.8823529, 0, 1, 1,
0.8813583, 0.3002947, 1.866834, 0.8901961, 0, 1, 1,
0.8892438, -0.07192998, 1.52313, 0.8941177, 0, 1, 1,
0.8929337, -0.320283, 3.164776, 0.9019608, 0, 1, 1,
0.89963, -0.7127285, 1.175662, 0.9098039, 0, 1, 1,
0.9008102, -0.2794799, 2.131618, 0.9137255, 0, 1, 1,
0.9016054, 0.8643157, 0.1678517, 0.9215686, 0, 1, 1,
0.9020455, 2.549117, 0.8325343, 0.9254902, 0, 1, 1,
0.9060134, -0.6769739, 2.090124, 0.9333333, 0, 1, 1,
0.9074177, 1.111034, 1.093184, 0.9372549, 0, 1, 1,
0.9147342, -0.8547768, 0.719512, 0.945098, 0, 1, 1,
0.9152668, 2.837052, 0.7458606, 0.9490196, 0, 1, 1,
0.9234152, -0.525637, 2.03482, 0.9568627, 0, 1, 1,
0.929342, -0.7696313, 2.69128, 0.9607843, 0, 1, 1,
0.9313562, -1.092889, 3.456061, 0.9686275, 0, 1, 1,
0.9337493, -0.8746493, 3.436969, 0.972549, 0, 1, 1,
0.9343494, 0.2441936, 2.849549, 0.9803922, 0, 1, 1,
0.9387243, 0.3694177, 1.020263, 0.9843137, 0, 1, 1,
0.9394984, -1.041004, 2.780524, 0.9921569, 0, 1, 1,
0.9407483, 1.05234, -0.5168945, 0.9960784, 0, 1, 1,
0.9420195, -0.7105288, 1.577094, 1, 0, 0.9960784, 1,
0.9445812, 0.04028549, 1.049429, 1, 0, 0.9882353, 1,
0.9473861, 0.3354878, 1.631508, 1, 0, 0.9843137, 1,
0.9524871, -0.2806558, 1.211364, 1, 0, 0.9764706, 1,
0.956813, 1.900881, 0.7462215, 1, 0, 0.972549, 1,
0.9572395, -0.01310422, 1.496128, 1, 0, 0.9647059, 1,
0.9619304, -0.6384937, -0.2948304, 1, 0, 0.9607843, 1,
0.9627599, 1.142214, 0.4071913, 1, 0, 0.9529412, 1,
0.9632277, -1.245937, 1.816313, 1, 0, 0.9490196, 1,
0.964505, 0.6640681, 2.05926, 1, 0, 0.9411765, 1,
0.9663571, -0.6478952, 1.524343, 1, 0, 0.9372549, 1,
0.9748639, 1.294638, 0.3499127, 1, 0, 0.9294118, 1,
0.9777091, 0.3101296, -0.1240468, 1, 0, 0.9254902, 1,
0.9816154, -0.9718815, 2.51801, 1, 0, 0.9176471, 1,
0.9832191, 1.987661, 0.0153072, 1, 0, 0.9137255, 1,
0.9892326, 0.01779295, 0.3050166, 1, 0, 0.9058824, 1,
0.9957042, -0.2740715, 2.186582, 1, 0, 0.9019608, 1,
0.9996584, 0.7759472, 1.049237, 1, 0, 0.8941177, 1,
1.000141, -1.448636, 2.938169, 1, 0, 0.8862745, 1,
1.006405, -0.5045017, 2.33451, 1, 0, 0.8823529, 1,
1.010196, 0.8287557, -0.1538838, 1, 0, 0.8745098, 1,
1.010506, -0.5318444, 1.409814, 1, 0, 0.8705882, 1,
1.015504, 1.418407, 0.1764412, 1, 0, 0.8627451, 1,
1.029118, 0.4604292, 1.876117, 1, 0, 0.8588235, 1,
1.033804, 0.3084042, 1.694546, 1, 0, 0.8509804, 1,
1.036404, -0.3025816, 2.627822, 1, 0, 0.8470588, 1,
1.047476, 0.7772465, 1.13886, 1, 0, 0.8392157, 1,
1.058825, 0.2185907, 0.7611079, 1, 0, 0.8352941, 1,
1.066712, 2.444422, 0.3069966, 1, 0, 0.827451, 1,
1.069002, -0.4903844, 2.904673, 1, 0, 0.8235294, 1,
1.080131, 0.2884888, 2.133992, 1, 0, 0.8156863, 1,
1.080868, -0.4565485, 2.036785, 1, 0, 0.8117647, 1,
1.084328, -0.3984609, 2.416815, 1, 0, 0.8039216, 1,
1.088444, 0.5593905, 1.761103, 1, 0, 0.7960784, 1,
1.088639, 0.170543, 0.8075926, 1, 0, 0.7921569, 1,
1.092568, -0.6873922, 1.835619, 1, 0, 0.7843137, 1,
1.095831, -0.4241256, 2.938394, 1, 0, 0.7803922, 1,
1.096832, 1.514144, -0.2123429, 1, 0, 0.772549, 1,
1.098532, 2.111014, 2.537301, 1, 0, 0.7686275, 1,
1.113303, 0.9686434, 1.909008, 1, 0, 0.7607843, 1,
1.113649, 1.046262, 1.444166, 1, 0, 0.7568628, 1,
1.118358, 0.3227053, 0.8768951, 1, 0, 0.7490196, 1,
1.127461, 2.53376, 0.8459634, 1, 0, 0.7450981, 1,
1.130646, -0.3159946, 1.191066, 1, 0, 0.7372549, 1,
1.132934, -1.225681, 4.460721, 1, 0, 0.7333333, 1,
1.137405, 0.9522411, 2.357882, 1, 0, 0.7254902, 1,
1.141078, 1.596151, 0.5462744, 1, 0, 0.7215686, 1,
1.146901, -0.392641, 1.209956, 1, 0, 0.7137255, 1,
1.147617, 0.01536636, 2.671599, 1, 0, 0.7098039, 1,
1.148258, -0.7351229, 2.058238, 1, 0, 0.7019608, 1,
1.15425, 0.7576287, 1.508568, 1, 0, 0.6941177, 1,
1.160153, -0.4862255, 3.844548, 1, 0, 0.6901961, 1,
1.172836, 1.080399, -0.07455484, 1, 0, 0.682353, 1,
1.175119, 0.01353816, 2.412936, 1, 0, 0.6784314, 1,
1.176182, -0.5893227, 0.1904184, 1, 0, 0.6705883, 1,
1.181491, -1.034839, 0.4315147, 1, 0, 0.6666667, 1,
1.183759, 0.4563842, 0.6649859, 1, 0, 0.6588235, 1,
1.19732, 1.448686, 1.140142, 1, 0, 0.654902, 1,
1.198587, 1.759589, -0.3038647, 1, 0, 0.6470588, 1,
1.205694, 1.734551, 1.540064, 1, 0, 0.6431373, 1,
1.208566, 1.476627, 1.050573, 1, 0, 0.6352941, 1,
1.210675, -0.7476363, 2.309743, 1, 0, 0.6313726, 1,
1.211108, 1.034684, 0.805594, 1, 0, 0.6235294, 1,
1.21539, -0.3075433, 1.475519, 1, 0, 0.6196079, 1,
1.225229, 0.4230499, 1.732324, 1, 0, 0.6117647, 1,
1.2417, 2.810539, 0.7810576, 1, 0, 0.6078432, 1,
1.241943, 0.731374, 1.029869, 1, 0, 0.6, 1,
1.24637, -1.485679, 2.561179, 1, 0, 0.5921569, 1,
1.261514, 0.00501396, 0.6522452, 1, 0, 0.5882353, 1,
1.281459, 0.8257906, 0.2571305, 1, 0, 0.5803922, 1,
1.291605, 1.13136, 1.862444, 1, 0, 0.5764706, 1,
1.296349, -0.4003871, -0.9482728, 1, 0, 0.5686275, 1,
1.298291, -1.757871, 2.64737, 1, 0, 0.5647059, 1,
1.307751, -0.6444144, 0.849583, 1, 0, 0.5568628, 1,
1.311436, -1.254227, 2.319385, 1, 0, 0.5529412, 1,
1.318527, 0.1902976, 1.072056, 1, 0, 0.5450981, 1,
1.325333, 0.8866863, 2.042286, 1, 0, 0.5411765, 1,
1.330648, 0.4329695, -0.6196442, 1, 0, 0.5333334, 1,
1.340832, -0.9743472, 2.984507, 1, 0, 0.5294118, 1,
1.351006, -0.5806442, 3.716907, 1, 0, 0.5215687, 1,
1.355724, 0.8918524, 0.6803952, 1, 0, 0.5176471, 1,
1.357763, -0.8841075, 3.953087, 1, 0, 0.509804, 1,
1.361193, 0.2432189, -0.7843773, 1, 0, 0.5058824, 1,
1.362526, -0.1722173, 2.105067, 1, 0, 0.4980392, 1,
1.36282, 0.8602011, 0.5382504, 1, 0, 0.4901961, 1,
1.363471, -0.2294924, -0.4250236, 1, 0, 0.4862745, 1,
1.364244, 0.3477897, 1.079713, 1, 0, 0.4784314, 1,
1.366827, -1.665869, 2.118985, 1, 0, 0.4745098, 1,
1.377679, -1.318602, 1.095554, 1, 0, 0.4666667, 1,
1.38183, -0.5507228, 3.731667, 1, 0, 0.4627451, 1,
1.413727, -0.1078411, 1.311276, 1, 0, 0.454902, 1,
1.419532, -0.6341472, 2.951872, 1, 0, 0.4509804, 1,
1.460794, -0.5100799, 1.953592, 1, 0, 0.4431373, 1,
1.47356, -1.049185, 3.217874, 1, 0, 0.4392157, 1,
1.474688, -0.5443624, 1.027085, 1, 0, 0.4313726, 1,
1.486182, 0.3297203, 1.942418, 1, 0, 0.427451, 1,
1.497405, -1.474733, 2.371496, 1, 0, 0.4196078, 1,
1.497604, 0.6727487, 1.798897, 1, 0, 0.4156863, 1,
1.508925, 1.611683, 0.3042638, 1, 0, 0.4078431, 1,
1.511834, 0.01983433, 1.089383, 1, 0, 0.4039216, 1,
1.528268, -0.7860621, 4.204809, 1, 0, 0.3960784, 1,
1.52915, -0.2765195, 1.38509, 1, 0, 0.3882353, 1,
1.531501, 1.368209, -0.2506751, 1, 0, 0.3843137, 1,
1.547191, 0.7008981, 1.104272, 1, 0, 0.3764706, 1,
1.558048, 1.312767, 2.126344, 1, 0, 0.372549, 1,
1.559992, 0.50902, 2.975184, 1, 0, 0.3647059, 1,
1.581514, -0.28399, 1.100891, 1, 0, 0.3607843, 1,
1.587554, -1.347679, 1.834155, 1, 0, 0.3529412, 1,
1.618602, 0.1917234, -0.4428132, 1, 0, 0.3490196, 1,
1.618888, -1.075676, 2.149155, 1, 0, 0.3411765, 1,
1.638043, -0.427137, 2.205156, 1, 0, 0.3372549, 1,
1.638605, 1.02393, 1.576823, 1, 0, 0.3294118, 1,
1.653023, 0.8549268, 0.4872936, 1, 0, 0.3254902, 1,
1.666551, -1.419819, 2.713079, 1, 0, 0.3176471, 1,
1.681892, -0.7989221, 2.228132, 1, 0, 0.3137255, 1,
1.686681, 0.6428192, 2.422165, 1, 0, 0.3058824, 1,
1.687859, 1.27791, 1.903616, 1, 0, 0.2980392, 1,
1.689927, -0.1251796, 1.368074, 1, 0, 0.2941177, 1,
1.69336, -0.2938048, 2.153436, 1, 0, 0.2862745, 1,
1.701346, 0.9896984, 1.028485, 1, 0, 0.282353, 1,
1.708416, -0.408089, 1.751661, 1, 0, 0.2745098, 1,
1.719672, -0.04233576, 0.835484, 1, 0, 0.2705882, 1,
1.736809, 0.8947963, 1.968679, 1, 0, 0.2627451, 1,
1.744153, 0.3579797, 1.719191, 1, 0, 0.2588235, 1,
1.758007, -0.1035738, 1.497332, 1, 0, 0.2509804, 1,
1.758257, 1.816057, 0.724113, 1, 0, 0.2470588, 1,
1.793391, -0.02956238, 3.879377, 1, 0, 0.2392157, 1,
1.809911, 0.2035728, 1.899719, 1, 0, 0.2352941, 1,
1.820022, 0.8102031, 0.5156724, 1, 0, 0.227451, 1,
1.83302, -1.890791, 4.987451, 1, 0, 0.2235294, 1,
1.84537, -1.226031, 2.574981, 1, 0, 0.2156863, 1,
1.849496, 0.9229022, 1.92183, 1, 0, 0.2117647, 1,
1.852442, -0.6900384, 0.547897, 1, 0, 0.2039216, 1,
1.853858, -0.8608935, 1.495041, 1, 0, 0.1960784, 1,
1.869182, -0.8517821, 0.8335761, 1, 0, 0.1921569, 1,
1.913308, 0.07132586, 2.41842, 1, 0, 0.1843137, 1,
1.919861, -2.342789, 3.156252, 1, 0, 0.1803922, 1,
1.991368, 0.1671995, 1.371093, 1, 0, 0.172549, 1,
1.992782, 1.089254, 1.056462, 1, 0, 0.1686275, 1,
2.002444, -0.25175, 1.297542, 1, 0, 0.1607843, 1,
2.011343, 1.180285, -0.8030077, 1, 0, 0.1568628, 1,
2.014725, -0.7200434, 2.456508, 1, 0, 0.1490196, 1,
2.026338, -0.01061747, 0.6536061, 1, 0, 0.145098, 1,
2.042161, -1.982052, 3.917967, 1, 0, 0.1372549, 1,
2.096816, 1.273722, 3.609468, 1, 0, 0.1333333, 1,
2.120948, 0.1266978, 3.049536, 1, 0, 0.1254902, 1,
2.153336, -1.080641, 3.294989, 1, 0, 0.1215686, 1,
2.164076, -0.1343899, 1.019842, 1, 0, 0.1137255, 1,
2.169225, 1.379379, 0.3573706, 1, 0, 0.1098039, 1,
2.198735, -1.494115, 3.728029, 1, 0, 0.1019608, 1,
2.217419, 0.6609882, 1.566216, 1, 0, 0.09411765, 1,
2.22331, -1.896158, 1.668494, 1, 0, 0.09019608, 1,
2.251934, -0.2601208, 0.6287926, 1, 0, 0.08235294, 1,
2.300409, 1.597251, 0.7281616, 1, 0, 0.07843138, 1,
2.312744, 0.8359656, 3.05196, 1, 0, 0.07058824, 1,
2.347185, 0.3745635, -0.8806123, 1, 0, 0.06666667, 1,
2.398171, 0.1976426, -0.1005362, 1, 0, 0.05882353, 1,
2.43256, -1.931583, 1.364942, 1, 0, 0.05490196, 1,
2.482308, -0.5631845, 1.638635, 1, 0, 0.04705882, 1,
2.512482, -0.3807451, 1.854693, 1, 0, 0.04313726, 1,
2.546731, -1.446495, 2.726395, 1, 0, 0.03529412, 1,
2.552343, 1.053245, 2.610417, 1, 0, 0.03137255, 1,
2.676817, 0.651863, -0.7583534, 1, 0, 0.02352941, 1,
2.713078, -0.547314, 0.695969, 1, 0, 0.01960784, 1,
2.792672, -0.06090129, 0.9023595, 1, 0, 0.01176471, 1,
2.901455, 0.1495429, 2.23874, 1, 0, 0.007843138, 1
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
-0.1943253, -4.485019, -7.922531, 0, -0.5, 0.5, 0.5,
-0.1943253, -4.485019, -7.922531, 1, -0.5, 0.5, 0.5,
-0.1943253, -4.485019, -7.922531, 1, 1.5, 0.5, 0.5,
-0.1943253, -4.485019, -7.922531, 0, 1.5, 0.5, 0.5
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
-4.339575, -0.1874495, -7.922531, 0, -0.5, 0.5, 0.5,
-4.339575, -0.1874495, -7.922531, 1, -0.5, 0.5, 0.5,
-4.339575, -0.1874495, -7.922531, 1, 1.5, 0.5, 0.5,
-4.339575, -0.1874495, -7.922531, 0, 1.5, 0.5, 0.5
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
-4.339575, -4.485019, -0.3961606, 0, -0.5, 0.5, 0.5,
-4.339575, -4.485019, -0.3961606, 1, -0.5, 0.5, 0.5,
-4.339575, -4.485019, -0.3961606, 1, 1.5, 0.5, 0.5,
-4.339575, -4.485019, -0.3961606, 0, 1.5, 0.5, 0.5
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
-3, -3.493272, -6.185677,
2, -3.493272, -6.185677,
-3, -3.493272, -6.185677,
-3, -3.658563, -6.475152,
-2, -3.493272, -6.185677,
-2, -3.658563, -6.475152,
-1, -3.493272, -6.185677,
-1, -3.658563, -6.475152,
0, -3.493272, -6.185677,
0, -3.658563, -6.475152,
1, -3.493272, -6.185677,
1, -3.658563, -6.475152,
2, -3.493272, -6.185677,
2, -3.658563, -6.475152
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
-3, -3.989145, -7.054104, 0, -0.5, 0.5, 0.5,
-3, -3.989145, -7.054104, 1, -0.5, 0.5, 0.5,
-3, -3.989145, -7.054104, 1, 1.5, 0.5, 0.5,
-3, -3.989145, -7.054104, 0, 1.5, 0.5, 0.5,
-2, -3.989145, -7.054104, 0, -0.5, 0.5, 0.5,
-2, -3.989145, -7.054104, 1, -0.5, 0.5, 0.5,
-2, -3.989145, -7.054104, 1, 1.5, 0.5, 0.5,
-2, -3.989145, -7.054104, 0, 1.5, 0.5, 0.5,
-1, -3.989145, -7.054104, 0, -0.5, 0.5, 0.5,
-1, -3.989145, -7.054104, 1, -0.5, 0.5, 0.5,
-1, -3.989145, -7.054104, 1, 1.5, 0.5, 0.5,
-1, -3.989145, -7.054104, 0, 1.5, 0.5, 0.5,
0, -3.989145, -7.054104, 0, -0.5, 0.5, 0.5,
0, -3.989145, -7.054104, 1, -0.5, 0.5, 0.5,
0, -3.989145, -7.054104, 1, 1.5, 0.5, 0.5,
0, -3.989145, -7.054104, 0, 1.5, 0.5, 0.5,
1, -3.989145, -7.054104, 0, -0.5, 0.5, 0.5,
1, -3.989145, -7.054104, 1, -0.5, 0.5, 0.5,
1, -3.989145, -7.054104, 1, 1.5, 0.5, 0.5,
1, -3.989145, -7.054104, 0, 1.5, 0.5, 0.5,
2, -3.989145, -7.054104, 0, -0.5, 0.5, 0.5,
2, -3.989145, -7.054104, 1, -0.5, 0.5, 0.5,
2, -3.989145, -7.054104, 1, 1.5, 0.5, 0.5,
2, -3.989145, -7.054104, 0, 1.5, 0.5, 0.5
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
-3.382979, -3, -6.185677,
-3.382979, 3, -6.185677,
-3.382979, -3, -6.185677,
-3.542411, -3, -6.475152,
-3.382979, -2, -6.185677,
-3.542411, -2, -6.475152,
-3.382979, -1, -6.185677,
-3.542411, -1, -6.475152,
-3.382979, 0, -6.185677,
-3.542411, 0, -6.475152,
-3.382979, 1, -6.185677,
-3.542411, 1, -6.475152,
-3.382979, 2, -6.185677,
-3.542411, 2, -6.475152,
-3.382979, 3, -6.185677,
-3.542411, 3, -6.475152
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
-3.861277, -3, -7.054104, 0, -0.5, 0.5, 0.5,
-3.861277, -3, -7.054104, 1, -0.5, 0.5, 0.5,
-3.861277, -3, -7.054104, 1, 1.5, 0.5, 0.5,
-3.861277, -3, -7.054104, 0, 1.5, 0.5, 0.5,
-3.861277, -2, -7.054104, 0, -0.5, 0.5, 0.5,
-3.861277, -2, -7.054104, 1, -0.5, 0.5, 0.5,
-3.861277, -2, -7.054104, 1, 1.5, 0.5, 0.5,
-3.861277, -2, -7.054104, 0, 1.5, 0.5, 0.5,
-3.861277, -1, -7.054104, 0, -0.5, 0.5, 0.5,
-3.861277, -1, -7.054104, 1, -0.5, 0.5, 0.5,
-3.861277, -1, -7.054104, 1, 1.5, 0.5, 0.5,
-3.861277, -1, -7.054104, 0, 1.5, 0.5, 0.5,
-3.861277, 0, -7.054104, 0, -0.5, 0.5, 0.5,
-3.861277, 0, -7.054104, 1, -0.5, 0.5, 0.5,
-3.861277, 0, -7.054104, 1, 1.5, 0.5, 0.5,
-3.861277, 0, -7.054104, 0, 1.5, 0.5, 0.5,
-3.861277, 1, -7.054104, 0, -0.5, 0.5, 0.5,
-3.861277, 1, -7.054104, 1, -0.5, 0.5, 0.5,
-3.861277, 1, -7.054104, 1, 1.5, 0.5, 0.5,
-3.861277, 1, -7.054104, 0, 1.5, 0.5, 0.5,
-3.861277, 2, -7.054104, 0, -0.5, 0.5, 0.5,
-3.861277, 2, -7.054104, 1, -0.5, 0.5, 0.5,
-3.861277, 2, -7.054104, 1, 1.5, 0.5, 0.5,
-3.861277, 2, -7.054104, 0, 1.5, 0.5, 0.5,
-3.861277, 3, -7.054104, 0, -0.5, 0.5, 0.5,
-3.861277, 3, -7.054104, 1, -0.5, 0.5, 0.5,
-3.861277, 3, -7.054104, 1, 1.5, 0.5, 0.5,
-3.861277, 3, -7.054104, 0, 1.5, 0.5, 0.5
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
-3.382979, -3.493272, -6,
-3.382979, -3.493272, 4,
-3.382979, -3.493272, -6,
-3.542411, -3.658563, -6,
-3.382979, -3.493272, -4,
-3.542411, -3.658563, -4,
-3.382979, -3.493272, -2,
-3.542411, -3.658563, -2,
-3.382979, -3.493272, 0,
-3.542411, -3.658563, 0,
-3.382979, -3.493272, 2,
-3.542411, -3.658563, 2,
-3.382979, -3.493272, 4,
-3.542411, -3.658563, 4
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
-3.861277, -3.989145, -6, 0, -0.5, 0.5, 0.5,
-3.861277, -3.989145, -6, 1, -0.5, 0.5, 0.5,
-3.861277, -3.989145, -6, 1, 1.5, 0.5, 0.5,
-3.861277, -3.989145, -6, 0, 1.5, 0.5, 0.5,
-3.861277, -3.989145, -4, 0, -0.5, 0.5, 0.5,
-3.861277, -3.989145, -4, 1, -0.5, 0.5, 0.5,
-3.861277, -3.989145, -4, 1, 1.5, 0.5, 0.5,
-3.861277, -3.989145, -4, 0, 1.5, 0.5, 0.5,
-3.861277, -3.989145, -2, 0, -0.5, 0.5, 0.5,
-3.861277, -3.989145, -2, 1, -0.5, 0.5, 0.5,
-3.861277, -3.989145, -2, 1, 1.5, 0.5, 0.5,
-3.861277, -3.989145, -2, 0, 1.5, 0.5, 0.5,
-3.861277, -3.989145, 0, 0, -0.5, 0.5, 0.5,
-3.861277, -3.989145, 0, 1, -0.5, 0.5, 0.5,
-3.861277, -3.989145, 0, 1, 1.5, 0.5, 0.5,
-3.861277, -3.989145, 0, 0, 1.5, 0.5, 0.5,
-3.861277, -3.989145, 2, 0, -0.5, 0.5, 0.5,
-3.861277, -3.989145, 2, 1, -0.5, 0.5, 0.5,
-3.861277, -3.989145, 2, 1, 1.5, 0.5, 0.5,
-3.861277, -3.989145, 2, 0, 1.5, 0.5, 0.5,
-3.861277, -3.989145, 4, 0, -0.5, 0.5, 0.5,
-3.861277, -3.989145, 4, 1, -0.5, 0.5, 0.5,
-3.861277, -3.989145, 4, 1, 1.5, 0.5, 0.5,
-3.861277, -3.989145, 4, 0, 1.5, 0.5, 0.5
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
-3.382979, -3.493272, -6.185677,
-3.382979, 3.118373, -6.185677,
-3.382979, -3.493272, 5.393355,
-3.382979, 3.118373, 5.393355,
-3.382979, -3.493272, -6.185677,
-3.382979, -3.493272, 5.393355,
-3.382979, 3.118373, -6.185677,
-3.382979, 3.118373, 5.393355,
-3.382979, -3.493272, -6.185677,
2.994328, -3.493272, -6.185677,
-3.382979, -3.493272, 5.393355,
2.994328, -3.493272, 5.393355,
-3.382979, 3.118373, -6.185677,
2.994328, 3.118373, -6.185677,
-3.382979, 3.118373, 5.393355,
2.994328, 3.118373, 5.393355,
2.994328, -3.493272, -6.185677,
2.994328, 3.118373, -6.185677,
2.994328, -3.493272, 5.393355,
2.994328, 3.118373, 5.393355,
2.994328, -3.493272, -6.185677,
2.994328, -3.493272, 5.393355,
2.994328, 3.118373, -6.185677,
2.994328, 3.118373, 5.393355
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
var radius = 7.892404;
var distance = 35.1142;
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
mvMatrix.translate( 0.1943253, 0.1874495, 0.3961606 );
mvMatrix.scale( 1.338092, 1.290666, 0.736972 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.1142);
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


