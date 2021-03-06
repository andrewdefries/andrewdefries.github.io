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
-3.732019, -1.418393, -0.2405971, 1, 0, 0, 1,
-3.581429, 0.135456, -1.413592, 1, 0.007843138, 0, 1,
-3.383236, -0.2124372, -0.689965, 1, 0.01176471, 0, 1,
-2.709098, -0.2258908, -1.856196, 1, 0.01960784, 0, 1,
-2.681203, 0.5093056, -1.185876, 1, 0.02352941, 0, 1,
-2.578341, 0.224509, -1.675698, 1, 0.03137255, 0, 1,
-2.574085, -0.7210779, -0.8798864, 1, 0.03529412, 0, 1,
-2.546622, 0.4160073, -1.024889, 1, 0.04313726, 0, 1,
-2.532452, 0.6235589, -0.9044976, 1, 0.04705882, 0, 1,
-2.520285, -1.213036, -1.541758, 1, 0.05490196, 0, 1,
-2.424911, -0.1778874, -2.052166, 1, 0.05882353, 0, 1,
-2.401819, 2.071546, -0.6531596, 1, 0.06666667, 0, 1,
-2.334545, -1.412766, -1.063599, 1, 0.07058824, 0, 1,
-2.26783, -0.6780508, -2.424549, 1, 0.07843138, 0, 1,
-2.230094, 0.4825183, -0.7458001, 1, 0.08235294, 0, 1,
-2.210036, -0.7357568, -1.693397, 1, 0.09019608, 0, 1,
-2.202745, -2.222851, -2.736207, 1, 0.09411765, 0, 1,
-2.119482, 0.1655596, -2.80345, 1, 0.1019608, 0, 1,
-2.110976, 0.2405511, -0.6546199, 1, 0.1098039, 0, 1,
-2.062645, -1.820614, -2.235543, 1, 0.1137255, 0, 1,
-1.989392, 1.041661, -0.4244688, 1, 0.1215686, 0, 1,
-1.958667, 1.14498, -1.459533, 1, 0.1254902, 0, 1,
-1.916642, 0.08518988, -3.470295, 1, 0.1333333, 0, 1,
-1.89123, -1.885008, -3.331283, 1, 0.1372549, 0, 1,
-1.88911, -0.7486323, -1.604387, 1, 0.145098, 0, 1,
-1.879852, -0.4226907, -1.778482, 1, 0.1490196, 0, 1,
-1.872642, -0.5494793, -0.3970523, 1, 0.1568628, 0, 1,
-1.86708, -0.4967081, 0.926093, 1, 0.1607843, 0, 1,
-1.837072, 0.5414844, -3.532503, 1, 0.1686275, 0, 1,
-1.835634, -1.956593, -1.371534, 1, 0.172549, 0, 1,
-1.81399, -0.8724132, -1.758643, 1, 0.1803922, 0, 1,
-1.812278, -0.6219665, -2.935918, 1, 0.1843137, 0, 1,
-1.801863, -0.3007275, -2.752582, 1, 0.1921569, 0, 1,
-1.784831, 0.1168644, -1.295446, 1, 0.1960784, 0, 1,
-1.757429, -0.1834265, -2.263511, 1, 0.2039216, 0, 1,
-1.751362, 1.500508, -1.33658, 1, 0.2117647, 0, 1,
-1.75011, 0.3853025, -3.098436, 1, 0.2156863, 0, 1,
-1.735232, -0.622421, -0.8910237, 1, 0.2235294, 0, 1,
-1.719341, 0.6704141, -1.649461, 1, 0.227451, 0, 1,
-1.694651, 0.5835555, -1.669991, 1, 0.2352941, 0, 1,
-1.687115, -0.1204159, -1.146532, 1, 0.2392157, 0, 1,
-1.673001, 1.361542, -2.046839, 1, 0.2470588, 0, 1,
-1.660017, 0.5603506, -1.871014, 1, 0.2509804, 0, 1,
-1.637232, 0.08845889, -2.174197, 1, 0.2588235, 0, 1,
-1.635352, 0.4582378, -1.488336, 1, 0.2627451, 0, 1,
-1.626209, 0.09217665, -1.280754, 1, 0.2705882, 0, 1,
-1.616043, -0.519982, -1.794579, 1, 0.2745098, 0, 1,
-1.613347, -0.1154326, -1.588749, 1, 0.282353, 0, 1,
-1.611965, -0.733866, -3.360861, 1, 0.2862745, 0, 1,
-1.609717, -0.3420123, -1.872085, 1, 0.2941177, 0, 1,
-1.594092, 0.02160536, -3.845429, 1, 0.3019608, 0, 1,
-1.590211, 0.4886409, -0.4992678, 1, 0.3058824, 0, 1,
-1.543956, 0.08880236, -1.865033, 1, 0.3137255, 0, 1,
-1.534078, -0.3817765, -1.692923, 1, 0.3176471, 0, 1,
-1.522725, 0.02668833, -2.579811, 1, 0.3254902, 0, 1,
-1.518065, 0.5792611, -2.49666, 1, 0.3294118, 0, 1,
-1.517564, -0.2712771, -1.328295, 1, 0.3372549, 0, 1,
-1.515531, 1.172225, -1.578727, 1, 0.3411765, 0, 1,
-1.502505, 0.7946666, -2.160192, 1, 0.3490196, 0, 1,
-1.501311, -1.499115, -1.382039, 1, 0.3529412, 0, 1,
-1.498243, 0.1797296, -0.9522011, 1, 0.3607843, 0, 1,
-1.495837, -0.1211823, -3.366528, 1, 0.3647059, 0, 1,
-1.490235, 0.03964122, -2.170495, 1, 0.372549, 0, 1,
-1.485624, -0.7831964, -1.249328, 1, 0.3764706, 0, 1,
-1.473117, 0.9814151, -2.418857, 1, 0.3843137, 0, 1,
-1.472308, 1.924196, -2.134024, 1, 0.3882353, 0, 1,
-1.451385, -1.436245, -2.403188, 1, 0.3960784, 0, 1,
-1.444421, -0.4400502, -2.018089, 1, 0.4039216, 0, 1,
-1.443292, 0.1294601, -3.053311, 1, 0.4078431, 0, 1,
-1.435514, -0.1244858, -1.690395, 1, 0.4156863, 0, 1,
-1.420209, 0.3641199, -2.276138, 1, 0.4196078, 0, 1,
-1.416331, 0.06489655, -1.100919, 1, 0.427451, 0, 1,
-1.405764, 0.09694102, -3.559659, 1, 0.4313726, 0, 1,
-1.403108, 0.121177, -2.061845, 1, 0.4392157, 0, 1,
-1.394315, 0.5914755, -1.976894, 1, 0.4431373, 0, 1,
-1.385152, -0.2530573, -0.7706301, 1, 0.4509804, 0, 1,
-1.371983, 0.8292983, -0.824511, 1, 0.454902, 0, 1,
-1.360267, 1.835564, -0.7802297, 1, 0.4627451, 0, 1,
-1.359542, -0.3342611, -1.341915, 1, 0.4666667, 0, 1,
-1.35751, -1.321455, -3.161455, 1, 0.4745098, 0, 1,
-1.351223, 0.7571188, -0.866241, 1, 0.4784314, 0, 1,
-1.349444, 0.7407415, -0.3834909, 1, 0.4862745, 0, 1,
-1.343252, 1.254944, -1.457005, 1, 0.4901961, 0, 1,
-1.333808, 1.548969, 1.001976, 1, 0.4980392, 0, 1,
-1.323819, -0.9529241, -2.689836, 1, 0.5058824, 0, 1,
-1.320126, 1.30077, -1.060076, 1, 0.509804, 0, 1,
-1.320012, -0.1378102, -2.082314, 1, 0.5176471, 0, 1,
-1.31286, 0.7783807, -0.07762474, 1, 0.5215687, 0, 1,
-1.312512, 0.9195339, -0.04985522, 1, 0.5294118, 0, 1,
-1.308133, -0.6250351, -2.144295, 1, 0.5333334, 0, 1,
-1.303675, -0.5561671, -2.626687, 1, 0.5411765, 0, 1,
-1.30209, 0.5152913, -0.9144882, 1, 0.5450981, 0, 1,
-1.294376, -0.338264, -0.06994788, 1, 0.5529412, 0, 1,
-1.289847, -0.1690242, -1.344259, 1, 0.5568628, 0, 1,
-1.289333, 1.700508, -0.6655647, 1, 0.5647059, 0, 1,
-1.280901, -0.557524, -2.927285, 1, 0.5686275, 0, 1,
-1.277169, 1.037125, 0.4916008, 1, 0.5764706, 0, 1,
-1.27146, -1.078029, -2.760369, 1, 0.5803922, 0, 1,
-1.260477, 0.8218775, 0.1496394, 1, 0.5882353, 0, 1,
-1.252843, -1.020969, -0.7280801, 1, 0.5921569, 0, 1,
-1.250739, -1.748736, -1.719353, 1, 0.6, 0, 1,
-1.246462, 0.9395112, -2.80037, 1, 0.6078432, 0, 1,
-1.241365, -2.249084, -2.675579, 1, 0.6117647, 0, 1,
-1.238917, -0.6142536, -1.242362, 1, 0.6196079, 0, 1,
-1.233023, -0.6415131, -3.093401, 1, 0.6235294, 0, 1,
-1.227231, -1.47225, -2.170862, 1, 0.6313726, 0, 1,
-1.21913, -0.289536, -1.854716, 1, 0.6352941, 0, 1,
-1.209405, -0.3082038, -3.06961, 1, 0.6431373, 0, 1,
-1.203769, -0.8010631, -1.45816, 1, 0.6470588, 0, 1,
-1.201888, -1.823274, -4.118037, 1, 0.654902, 0, 1,
-1.199415, 1.037184, -0.2636925, 1, 0.6588235, 0, 1,
-1.19933, -1.426259, -3.027311, 1, 0.6666667, 0, 1,
-1.190802, 1.286653, -0.9675392, 1, 0.6705883, 0, 1,
-1.189253, -0.7162825, -2.097295, 1, 0.6784314, 0, 1,
-1.188947, -1.289825, -2.403547, 1, 0.682353, 0, 1,
-1.182009, -1.287689, -1.168635, 1, 0.6901961, 0, 1,
-1.17691, 0.3767118, -1.359109, 1, 0.6941177, 0, 1,
-1.176187, -0.6802628, -3.616112, 1, 0.7019608, 0, 1,
-1.168767, -0.08279799, -2.246978, 1, 0.7098039, 0, 1,
-1.164718, -1.41932, -2.172027, 1, 0.7137255, 0, 1,
-1.16294, 0.6540946, -2.378179, 1, 0.7215686, 0, 1,
-1.162366, -0.178978, -0.4143171, 1, 0.7254902, 0, 1,
-1.158384, -0.4074028, -3.142153, 1, 0.7333333, 0, 1,
-1.146147, -0.5491031, -2.416466, 1, 0.7372549, 0, 1,
-1.136249, -0.6980842, -1.070069, 1, 0.7450981, 0, 1,
-1.135108, 0.280552, -2.02483, 1, 0.7490196, 0, 1,
-1.133886, 0.08187865, -2.743359, 1, 0.7568628, 0, 1,
-1.128983, 0.6256844, -0.7419519, 1, 0.7607843, 0, 1,
-1.115907, 1.164869, -0.1450865, 1, 0.7686275, 0, 1,
-1.110405, -1.141157, -1.460552, 1, 0.772549, 0, 1,
-1.107054, -0.7207828, -2.606352, 1, 0.7803922, 0, 1,
-1.101859, 0.06338383, -0.7583797, 1, 0.7843137, 0, 1,
-1.095075, 1.3781, -0.6856901, 1, 0.7921569, 0, 1,
-1.084214, 0.4389409, -0.6176935, 1, 0.7960784, 0, 1,
-1.078517, -1.27767, -3.850959, 1, 0.8039216, 0, 1,
-1.078464, 0.6441757, -1.098656, 1, 0.8117647, 0, 1,
-1.078144, -0.2604671, -2.511093, 1, 0.8156863, 0, 1,
-1.073684, -0.756512, -3.615106, 1, 0.8235294, 0, 1,
-1.071111, 1.169215, -1.321534, 1, 0.827451, 0, 1,
-1.070013, -1.164307, -2.170253, 1, 0.8352941, 0, 1,
-1.067179, -0.9532082, -1.758304, 1, 0.8392157, 0, 1,
-1.065267, -0.6722626, -2.488839, 1, 0.8470588, 0, 1,
-1.058752, 0.2270851, -0.8006928, 1, 0.8509804, 0, 1,
-1.055263, 0.6549818, 1.212657, 1, 0.8588235, 0, 1,
-1.054503, -0.8783958, -1.534762, 1, 0.8627451, 0, 1,
-1.050574, -0.09828824, -2.09425, 1, 0.8705882, 0, 1,
-1.045219, 0.4213501, -0.007802759, 1, 0.8745098, 0, 1,
-1.038321, 0.3898244, -0.7224284, 1, 0.8823529, 0, 1,
-1.037792, 1.642259, 1.574514, 1, 0.8862745, 0, 1,
-1.037001, 0.1394828, -2.291274, 1, 0.8941177, 0, 1,
-1.024849, -0.4365114, -2.269807, 1, 0.8980392, 0, 1,
-1.023257, -0.9376711, -2.879199, 1, 0.9058824, 0, 1,
-1.023098, 0.5056142, -1.222905, 1, 0.9137255, 0, 1,
-1.022847, 2.485095, -0.7605666, 1, 0.9176471, 0, 1,
-1.019524, -1.808523, -3.383254, 1, 0.9254902, 0, 1,
-1.017961, 0.174775, -1.870877, 1, 0.9294118, 0, 1,
-1.014104, 0.6550968, -2.355345, 1, 0.9372549, 0, 1,
-1.012303, 0.4428603, -0.4194937, 1, 0.9411765, 0, 1,
-0.9980005, -1.380052, -3.284328, 1, 0.9490196, 0, 1,
-0.9966148, 0.3966687, -1.215041, 1, 0.9529412, 0, 1,
-0.9940332, 0.9911988, 1.608691, 1, 0.9607843, 0, 1,
-0.9919339, -0.5822933, -1.011787, 1, 0.9647059, 0, 1,
-0.9838308, 1.133913, 1.101418, 1, 0.972549, 0, 1,
-0.9835914, 0.5719822, -1.404185, 1, 0.9764706, 0, 1,
-0.9835303, 0.2644843, -0.6157843, 1, 0.9843137, 0, 1,
-0.9777416, 0.4830514, -1.449611, 1, 0.9882353, 0, 1,
-0.972815, 1.378771, 1.907961, 1, 0.9960784, 0, 1,
-0.9692528, 0.7961882, 0.3562468, 0.9960784, 1, 0, 1,
-0.9669784, -1.297498, -1.553958, 0.9921569, 1, 0, 1,
-0.9649525, 1.104965, -1.733307, 0.9843137, 1, 0, 1,
-0.9601294, 0.8347955, -1.327097, 0.9803922, 1, 0, 1,
-0.9503441, 0.7358322, -0.9354767, 0.972549, 1, 0, 1,
-0.9357126, 0.125301, -1.997594, 0.9686275, 1, 0, 1,
-0.9286862, -0.4366268, -1.629495, 0.9607843, 1, 0, 1,
-0.926931, 0.3309284, -0.5716303, 0.9568627, 1, 0, 1,
-0.9207135, -0.5272332, -0.5262969, 0.9490196, 1, 0, 1,
-0.9121952, 1.408193, 1.391614, 0.945098, 1, 0, 1,
-0.9110211, -0.6822761, -2.756876, 0.9372549, 1, 0, 1,
-0.9103905, 2.158465, -0.8344447, 0.9333333, 1, 0, 1,
-0.9097391, -0.1369434, -3.132318, 0.9254902, 1, 0, 1,
-0.8955046, -0.7326986, -4.22461, 0.9215686, 1, 0, 1,
-0.8913061, 1.175339, -1.557965, 0.9137255, 1, 0, 1,
-0.8901975, 1.080328, -1.283874, 0.9098039, 1, 0, 1,
-0.8888805, -0.6946893, -3.874732, 0.9019608, 1, 0, 1,
-0.8811565, 0.5583676, 0.07596722, 0.8941177, 1, 0, 1,
-0.8739038, 1.381442, -0.4697483, 0.8901961, 1, 0, 1,
-0.8676364, -1.819627, -3.321095, 0.8823529, 1, 0, 1,
-0.861693, 0.2733782, -0.8945267, 0.8784314, 1, 0, 1,
-0.8527808, 0.07167959, -2.168634, 0.8705882, 1, 0, 1,
-0.8492477, -2.981958, -2.91881, 0.8666667, 1, 0, 1,
-0.8489704, 0.1205669, -1.1389, 0.8588235, 1, 0, 1,
-0.843721, 2.455339, -0.1378005, 0.854902, 1, 0, 1,
-0.8431452, -0.927173, -2.435545, 0.8470588, 1, 0, 1,
-0.8398781, -1.030952, -2.725116, 0.8431373, 1, 0, 1,
-0.831769, -2.004096, -2.743043, 0.8352941, 1, 0, 1,
-0.8300191, 0.814172, 0.6120217, 0.8313726, 1, 0, 1,
-0.8289495, -0.000602418, -2.62405, 0.8235294, 1, 0, 1,
-0.8176062, 0.4694983, -1.781218, 0.8196079, 1, 0, 1,
-0.8105181, 1.25624, -0.8776712, 0.8117647, 1, 0, 1,
-0.8082904, 0.9923668, -2.867937, 0.8078431, 1, 0, 1,
-0.8066439, 0.8237511, 0.7745207, 0.8, 1, 0, 1,
-0.804965, 1.006019, -1.511445, 0.7921569, 1, 0, 1,
-0.8011135, -0.1638309, -2.661973, 0.7882353, 1, 0, 1,
-0.7944517, -0.7406015, -1.925949, 0.7803922, 1, 0, 1,
-0.7859525, -0.01309148, -1.649225, 0.7764706, 1, 0, 1,
-0.778059, -0.5873359, -1.394806, 0.7686275, 1, 0, 1,
-0.7759076, 0.6973464, -1.514699, 0.7647059, 1, 0, 1,
-0.7714545, 0.178758, -1.673459, 0.7568628, 1, 0, 1,
-0.7674572, -0.5714952, -1.180727, 0.7529412, 1, 0, 1,
-0.7645888, -0.1500523, -1.738178, 0.7450981, 1, 0, 1,
-0.7523162, -0.1333489, -1.070797, 0.7411765, 1, 0, 1,
-0.7507403, 0.7747313, -0.8908524, 0.7333333, 1, 0, 1,
-0.7457096, 0.2525169, -0.6571901, 0.7294118, 1, 0, 1,
-0.7428476, -1.833901, -2.607862, 0.7215686, 1, 0, 1,
-0.7424225, 0.000850728, -1.483927, 0.7176471, 1, 0, 1,
-0.7384204, -0.8893737, -1.801093, 0.7098039, 1, 0, 1,
-0.7357471, 1.952805, 0.2263919, 0.7058824, 1, 0, 1,
-0.7327669, 0.8902119, -0.5632086, 0.6980392, 1, 0, 1,
-0.7294338, -0.02619106, -2.738672, 0.6901961, 1, 0, 1,
-0.7282691, 1.383106, 0.001009481, 0.6862745, 1, 0, 1,
-0.7280818, -0.9154782, -1.046921, 0.6784314, 1, 0, 1,
-0.7276872, 0.08707648, 0.5257854, 0.6745098, 1, 0, 1,
-0.7267721, 0.09741578, -0.7160406, 0.6666667, 1, 0, 1,
-0.7246512, 0.1380901, -2.470774, 0.6627451, 1, 0, 1,
-0.7245977, 0.2445027, -2.375547, 0.654902, 1, 0, 1,
-0.7227033, 0.1276722, -2.802918, 0.6509804, 1, 0, 1,
-0.7215009, 0.5479198, -0.9232643, 0.6431373, 1, 0, 1,
-0.7115411, 0.2623562, -0.4510383, 0.6392157, 1, 0, 1,
-0.7083496, -0.665159, -2.002885, 0.6313726, 1, 0, 1,
-0.7042837, -0.029083, -1.523097, 0.627451, 1, 0, 1,
-0.698829, -0.008401452, -3.988198, 0.6196079, 1, 0, 1,
-0.6985444, -1.152628, -2.946696, 0.6156863, 1, 0, 1,
-0.6980423, -0.00835022, -1.038949, 0.6078432, 1, 0, 1,
-0.6977939, -0.9706639, -2.053654, 0.6039216, 1, 0, 1,
-0.6972908, -0.008337416, -0.3319286, 0.5960785, 1, 0, 1,
-0.6871412, 0.06668194, -1.094024, 0.5882353, 1, 0, 1,
-0.6870871, 0.184707, -1.06967, 0.5843138, 1, 0, 1,
-0.6836215, -0.172405, -2.428547, 0.5764706, 1, 0, 1,
-0.6834962, -1.301205, -2.825637, 0.572549, 1, 0, 1,
-0.67788, 0.9888616, -0.9396969, 0.5647059, 1, 0, 1,
-0.6752583, -0.6945292, -3.156089, 0.5607843, 1, 0, 1,
-0.6739157, -2.019639, -0.5394261, 0.5529412, 1, 0, 1,
-0.6732883, -0.1538819, -1.986859, 0.5490196, 1, 0, 1,
-0.6671106, 0.2632892, 0.2853956, 0.5411765, 1, 0, 1,
-0.6659866, 1.561063, -0.9514015, 0.5372549, 1, 0, 1,
-0.6642566, 0.3320287, -3.28489, 0.5294118, 1, 0, 1,
-0.6605864, 0.2763107, -3.02133, 0.5254902, 1, 0, 1,
-0.656798, -0.6563069, -4.081297, 0.5176471, 1, 0, 1,
-0.6537159, -0.2603551, -1.796532, 0.5137255, 1, 0, 1,
-0.6512065, 0.5023567, -1.833178, 0.5058824, 1, 0, 1,
-0.6496458, -0.7259387, -4.145965, 0.5019608, 1, 0, 1,
-0.6437613, 0.2334713, -0.3083453, 0.4941176, 1, 0, 1,
-0.6399046, -0.05984303, -2.786182, 0.4862745, 1, 0, 1,
-0.635511, -0.2171998, -1.00913, 0.4823529, 1, 0, 1,
-0.6309356, -0.6043784, -4.85367, 0.4745098, 1, 0, 1,
-0.6284949, 1.149808, -1.539394, 0.4705882, 1, 0, 1,
-0.6284633, -0.379353, -0.8148031, 0.4627451, 1, 0, 1,
-0.6280165, -0.7792871, -2.79102, 0.4588235, 1, 0, 1,
-0.623418, -0.6570805, -1.549573, 0.4509804, 1, 0, 1,
-0.623041, -1.048989, -2.794891, 0.4470588, 1, 0, 1,
-0.6213518, 1.552089, -0.3766149, 0.4392157, 1, 0, 1,
-0.615258, -2.393997, -3.17484, 0.4352941, 1, 0, 1,
-0.6145902, 0.008967603, -1.078964, 0.427451, 1, 0, 1,
-0.6145018, 0.310868, -2.340696, 0.4235294, 1, 0, 1,
-0.6096879, 0.2944855, -0.9160292, 0.4156863, 1, 0, 1,
-0.6096604, -0.3206112, -2.605994, 0.4117647, 1, 0, 1,
-0.6051184, 1.846901, -1.609061, 0.4039216, 1, 0, 1,
-0.6001994, -1.401598, -1.788818, 0.3960784, 1, 0, 1,
-0.597091, -0.04618059, -1.31579, 0.3921569, 1, 0, 1,
-0.5958274, -1.391842, -1.669014, 0.3843137, 1, 0, 1,
-0.5918974, -0.8187506, -2.882467, 0.3803922, 1, 0, 1,
-0.5862042, 1.061961, 0.6263202, 0.372549, 1, 0, 1,
-0.5844321, 0.5089034, -2.555285, 0.3686275, 1, 0, 1,
-0.5843023, 0.4220568, -1.622528, 0.3607843, 1, 0, 1,
-0.5794351, -0.4172735, -2.997068, 0.3568628, 1, 0, 1,
-0.578924, 2.421384, -0.2037271, 0.3490196, 1, 0, 1,
-0.5743461, -1.739998, -3.366334, 0.345098, 1, 0, 1,
-0.5714869, -0.5816073, -1.978675, 0.3372549, 1, 0, 1,
-0.570415, -0.3971176, -2.173409, 0.3333333, 1, 0, 1,
-0.5696409, -1.640634, -0.8952636, 0.3254902, 1, 0, 1,
-0.5375955, 1.368746, -0.2700777, 0.3215686, 1, 0, 1,
-0.5370807, 0.4466432, -0.3494471, 0.3137255, 1, 0, 1,
-0.5300179, -1.042452, -2.177443, 0.3098039, 1, 0, 1,
-0.5251949, -0.5142964, -1.144546, 0.3019608, 1, 0, 1,
-0.5248755, 0.3987412, -0.7900059, 0.2941177, 1, 0, 1,
-0.5234054, 0.05415225, -1.08703, 0.2901961, 1, 0, 1,
-0.5221286, -0.2466242, -2.024269, 0.282353, 1, 0, 1,
-0.5125683, -3.323318, -0.5071876, 0.2784314, 1, 0, 1,
-0.5096375, -1.112855, -3.097434, 0.2705882, 1, 0, 1,
-0.5064795, 0.1673547, -2.209612, 0.2666667, 1, 0, 1,
-0.504235, -1.689345, -5.846854, 0.2588235, 1, 0, 1,
-0.5028501, 1.303435, -0.9341976, 0.254902, 1, 0, 1,
-0.5000892, -1.554804, -5.53997, 0.2470588, 1, 0, 1,
-0.4995566, 0.566331, 0.05760314, 0.2431373, 1, 0, 1,
-0.4980824, 1.047213, -0.6702517, 0.2352941, 1, 0, 1,
-0.4967338, -1.083012, -3.78618, 0.2313726, 1, 0, 1,
-0.4962258, 0.7532201, -1.700489, 0.2235294, 1, 0, 1,
-0.4869433, -0.1309199, -1.860254, 0.2196078, 1, 0, 1,
-0.4862204, 0.4935426, -1.519904, 0.2117647, 1, 0, 1,
-0.4766124, 0.4876553, -0.656137, 0.2078431, 1, 0, 1,
-0.4724565, -0.04079293, -1.351443, 0.2, 1, 0, 1,
-0.4659747, 1.131181, 2.179556, 0.1921569, 1, 0, 1,
-0.4624751, -0.7974946, -1.371117, 0.1882353, 1, 0, 1,
-0.4603072, 0.4159392, -0.5045923, 0.1803922, 1, 0, 1,
-0.4551686, -0.8148119, -2.102993, 0.1764706, 1, 0, 1,
-0.454979, -0.3371636, -1.597986, 0.1686275, 1, 0, 1,
-0.4524509, 0.3791806, -3.454221, 0.1647059, 1, 0, 1,
-0.4501635, 1.580332, -1.122921, 0.1568628, 1, 0, 1,
-0.4489497, 1.359699, -0.9641615, 0.1529412, 1, 0, 1,
-0.4440855, -0.3469426, -2.047674, 0.145098, 1, 0, 1,
-0.443772, 1.951393, 0.02108266, 0.1411765, 1, 0, 1,
-0.4399793, -0.5783563, -0.9328846, 0.1333333, 1, 0, 1,
-0.4385703, 1.029124, 0.1934273, 0.1294118, 1, 0, 1,
-0.4364055, -1.763904, -3.222511, 0.1215686, 1, 0, 1,
-0.4363049, 0.7592649, -1.890255, 0.1176471, 1, 0, 1,
-0.433982, -2.166383, -2.91943, 0.1098039, 1, 0, 1,
-0.4326046, 0.09430421, -0.7100363, 0.1058824, 1, 0, 1,
-0.4279754, -0.005933815, -1.659108, 0.09803922, 1, 0, 1,
-0.4260693, 0.6276987, 0.2552575, 0.09019608, 1, 0, 1,
-0.4249028, -0.2229774, -4.467651, 0.08627451, 1, 0, 1,
-0.4235384, -0.6127901, -1.525845, 0.07843138, 1, 0, 1,
-0.4201239, -0.07299529, -3.942173, 0.07450981, 1, 0, 1,
-0.4180548, -0.8977875, -3.114829, 0.06666667, 1, 0, 1,
-0.4157955, -0.2090007, -2.20998, 0.0627451, 1, 0, 1,
-0.4127931, 0.7912636, -0.8385506, 0.05490196, 1, 0, 1,
-0.4104537, 0.637578, -1.447719, 0.05098039, 1, 0, 1,
-0.4103741, -0.3853611, -2.62245, 0.04313726, 1, 0, 1,
-0.4088916, 0.1464671, -1.353112, 0.03921569, 1, 0, 1,
-0.4077269, -0.4685779, -2.372755, 0.03137255, 1, 0, 1,
-0.4057963, -1.184191, -2.336347, 0.02745098, 1, 0, 1,
-0.4056557, 0.6673021, -1.116739, 0.01960784, 1, 0, 1,
-0.405, 0.4356325, -0.07895698, 0.01568628, 1, 0, 1,
-0.4010921, -0.4172973, -1.382292, 0.007843138, 1, 0, 1,
-0.3969598, 0.2749142, -2.216584, 0.003921569, 1, 0, 1,
-0.3936746, -0.6239619, -1.980995, 0, 1, 0.003921569, 1,
-0.3906141, -0.9622492, -3.269303, 0, 1, 0.01176471, 1,
-0.387872, -0.1554303, -1.462306, 0, 1, 0.01568628, 1,
-0.3866351, -0.98892, -3.17767, 0, 1, 0.02352941, 1,
-0.3865381, -0.875785, -3.384398, 0, 1, 0.02745098, 1,
-0.3861806, -0.7402264, -2.666779, 0, 1, 0.03529412, 1,
-0.3843426, 1.129667, -1.231236, 0, 1, 0.03921569, 1,
-0.3842536, 0.2418629, -1.67955, 0, 1, 0.04705882, 1,
-0.3824989, 2.038266, 1.155486, 0, 1, 0.05098039, 1,
-0.382059, -0.1393217, -0.7212156, 0, 1, 0.05882353, 1,
-0.3818254, -1.78564, -3.030055, 0, 1, 0.0627451, 1,
-0.3781076, 0.00471974, -0.9598126, 0, 1, 0.07058824, 1,
-0.3775486, -0.3925297, -2.369786, 0, 1, 0.07450981, 1,
-0.3759054, -0.1454924, -3.237441, 0, 1, 0.08235294, 1,
-0.3755736, -0.483349, -2.209759, 0, 1, 0.08627451, 1,
-0.3748031, 0.9210154, 1.252969, 0, 1, 0.09411765, 1,
-0.3739505, 1.287075, 0.3436523, 0, 1, 0.1019608, 1,
-0.3700984, -0.7943213, -2.454954, 0, 1, 0.1058824, 1,
-0.3671308, 0.06136854, 1.096569, 0, 1, 0.1137255, 1,
-0.365679, -1.199873, -2.932739, 0, 1, 0.1176471, 1,
-0.3653591, -0.7870618, -4.174611, 0, 1, 0.1254902, 1,
-0.364653, -1.239272, -3.85532, 0, 1, 0.1294118, 1,
-0.3644871, -0.4243627, -2.091367, 0, 1, 0.1372549, 1,
-0.3628431, 0.1892423, -1.686156, 0, 1, 0.1411765, 1,
-0.3616568, -2.011457, -2.299282, 0, 1, 0.1490196, 1,
-0.3608913, -0.1684516, -0.3625684, 0, 1, 0.1529412, 1,
-0.3532258, 1.454863, -0.6540629, 0, 1, 0.1607843, 1,
-0.3504521, 0.2841779, -1.015104, 0, 1, 0.1647059, 1,
-0.3500139, -0.5783565, -2.633204, 0, 1, 0.172549, 1,
-0.349362, -0.0568208, -0.6604772, 0, 1, 0.1764706, 1,
-0.3485146, 1.290704, -0.8604743, 0, 1, 0.1843137, 1,
-0.3463665, 0.3899803, -1.896036, 0, 1, 0.1882353, 1,
-0.3461039, -1.426672, -1.901845, 0, 1, 0.1960784, 1,
-0.3453678, -0.8439054, -2.604154, 0, 1, 0.2039216, 1,
-0.3444079, -1.810107, -2.693473, 0, 1, 0.2078431, 1,
-0.3431741, -1.747695, -2.939495, 0, 1, 0.2156863, 1,
-0.338175, -0.02202707, -3.340531, 0, 1, 0.2196078, 1,
-0.3318051, -0.6609808, -3.075362, 0, 1, 0.227451, 1,
-0.3313479, 0.1112369, -0.458897, 0, 1, 0.2313726, 1,
-0.3296487, 0.01109566, -0.4495661, 0, 1, 0.2392157, 1,
-0.3287227, 0.358764, -0.8192794, 0, 1, 0.2431373, 1,
-0.3279799, 0.2270074, 1.302461, 0, 1, 0.2509804, 1,
-0.3262366, 0.4456276, -1.560395, 0, 1, 0.254902, 1,
-0.3216748, -0.08057044, -1.743505, 0, 1, 0.2627451, 1,
-0.3204795, -0.7264103, -2.850993, 0, 1, 0.2666667, 1,
-0.3170131, -1.356767, -2.368353, 0, 1, 0.2745098, 1,
-0.315202, 0.5538335, -0.2994924, 0, 1, 0.2784314, 1,
-0.3144588, -1.810441, -3.489752, 0, 1, 0.2862745, 1,
-0.3098921, 0.840492, 0.8355414, 0, 1, 0.2901961, 1,
-0.3094385, -2.25592, -2.791802, 0, 1, 0.2980392, 1,
-0.3068464, -0.1840783, -1.371204, 0, 1, 0.3058824, 1,
-0.3064637, -1.306544, -1.628193, 0, 1, 0.3098039, 1,
-0.2924381, -0.8090049, -1.914217, 0, 1, 0.3176471, 1,
-0.2902498, 1.021027, -0.3126439, 0, 1, 0.3215686, 1,
-0.2878161, -1.128243, -3.523794, 0, 1, 0.3294118, 1,
-0.2875689, 1.60843, -0.1953333, 0, 1, 0.3333333, 1,
-0.2867988, -0.6561025, -3.164064, 0, 1, 0.3411765, 1,
-0.2857938, 0.1722239, -0.4767242, 0, 1, 0.345098, 1,
-0.2774057, 1.51869, -0.2498254, 0, 1, 0.3529412, 1,
-0.2750295, -0.2645087, -3.900525, 0, 1, 0.3568628, 1,
-0.2661689, 0.1619717, -1.247441, 0, 1, 0.3647059, 1,
-0.2659785, -0.08734631, -2.573516, 0, 1, 0.3686275, 1,
-0.2649663, 1.328883, 0.1932227, 0, 1, 0.3764706, 1,
-0.2617971, -0.1528583, 0.4507914, 0, 1, 0.3803922, 1,
-0.2608849, 1.284526, -0.09754934, 0, 1, 0.3882353, 1,
-0.2604882, -1.412762, -4.014339, 0, 1, 0.3921569, 1,
-0.2604766, 1.122245, -1.871705, 0, 1, 0.4, 1,
-0.2592752, 1.547509, 0.06401505, 0, 1, 0.4078431, 1,
-0.258654, -0.8665683, -2.380088, 0, 1, 0.4117647, 1,
-0.2533146, 1.856907, 2.292427, 0, 1, 0.4196078, 1,
-0.2532908, 0.4002907, -1.292434, 0, 1, 0.4235294, 1,
-0.2526047, -1.422691, -3.849256, 0, 1, 0.4313726, 1,
-0.2514491, -0.7111931, -3.019319, 0, 1, 0.4352941, 1,
-0.2506322, 0.6756787, -1.259368, 0, 1, 0.4431373, 1,
-0.2498491, -1.133436, -3.232448, 0, 1, 0.4470588, 1,
-0.2489185, 1.551563, 1.137853, 0, 1, 0.454902, 1,
-0.2403754, 0.5046359, 1.808672, 0, 1, 0.4588235, 1,
-0.2323102, 0.368109, -0.7185712, 0, 1, 0.4666667, 1,
-0.2269506, -0.8060735, -2.665178, 0, 1, 0.4705882, 1,
-0.226735, 0.5468901, 0.8160403, 0, 1, 0.4784314, 1,
-0.2245925, -0.3349057, -1.841491, 0, 1, 0.4823529, 1,
-0.2245408, 0.5322517, -0.08671228, 0, 1, 0.4901961, 1,
-0.2203265, -0.380412, -3.898965, 0, 1, 0.4941176, 1,
-0.2177943, 0.3257789, -2.024047, 0, 1, 0.5019608, 1,
-0.2174523, 1.4473, 2.695091, 0, 1, 0.509804, 1,
-0.2168597, 0.435487, -1.072604, 0, 1, 0.5137255, 1,
-0.2128597, -0.4347961, -1.425009, 0, 1, 0.5215687, 1,
-0.2101315, 0.09722443, -0.1849413, 0, 1, 0.5254902, 1,
-0.2088833, -1.180644, -3.6658, 0, 1, 0.5333334, 1,
-0.2049146, -0.9652436, -2.606704, 0, 1, 0.5372549, 1,
-0.2023237, -0.00118121, -1.304644, 0, 1, 0.5450981, 1,
-0.1997729, 0.2191227, 0.4219925, 0, 1, 0.5490196, 1,
-0.1979234, 0.5999483, -0.2898382, 0, 1, 0.5568628, 1,
-0.191448, -0.6070749, -0.868552, 0, 1, 0.5607843, 1,
-0.1900986, -0.7228296, -1.811804, 0, 1, 0.5686275, 1,
-0.1897246, -0.2991701, -4.80781, 0, 1, 0.572549, 1,
-0.1876932, -0.5035532, -2.707568, 0, 1, 0.5803922, 1,
-0.1841432, -2.131313, -3.093282, 0, 1, 0.5843138, 1,
-0.1779271, 0.6920581, 0.02972977, 0, 1, 0.5921569, 1,
-0.1751831, 0.7826568, -0.2331387, 0, 1, 0.5960785, 1,
-0.174839, 0.2510734, -2.061273, 0, 1, 0.6039216, 1,
-0.1596735, 1.067074, 0.7246007, 0, 1, 0.6117647, 1,
-0.1545486, 0.1829644, 0.6241723, 0, 1, 0.6156863, 1,
-0.1521518, -0.4703685, -3.365907, 0, 1, 0.6235294, 1,
-0.1505022, 0.1933808, -0.06213063, 0, 1, 0.627451, 1,
-0.1444509, 0.8473641, -0.4619694, 0, 1, 0.6352941, 1,
-0.1435205, -0.8178532, -2.847292, 0, 1, 0.6392157, 1,
-0.1417993, 2.337447, 1.103241, 0, 1, 0.6470588, 1,
-0.1369365, 0.7317219, -0.1762288, 0, 1, 0.6509804, 1,
-0.1367472, -0.1274102, -1.334023, 0, 1, 0.6588235, 1,
-0.1320353, -1.202149, -3.374603, 0, 1, 0.6627451, 1,
-0.1319722, -0.3357781, -2.843885, 0, 1, 0.6705883, 1,
-0.1261523, -0.2350116, -1.651559, 0, 1, 0.6745098, 1,
-0.1203071, -0.6774061, -1.894989, 0, 1, 0.682353, 1,
-0.120006, 1.569445, 0.464125, 0, 1, 0.6862745, 1,
-0.1199095, 0.7592389, -0.9217265, 0, 1, 0.6941177, 1,
-0.1166566, -0.1846558, -2.835482, 0, 1, 0.7019608, 1,
-0.1165283, 0.158022, -0.01859619, 0, 1, 0.7058824, 1,
-0.1130724, 0.4761516, 0.853811, 0, 1, 0.7137255, 1,
-0.1125965, -0.5745289, -3.980552, 0, 1, 0.7176471, 1,
-0.1125489, 0.4751307, 1.134734, 0, 1, 0.7254902, 1,
-0.1118045, 0.9527628, 0.722196, 0, 1, 0.7294118, 1,
-0.1116649, 1.194054, -1.618303, 0, 1, 0.7372549, 1,
-0.1116148, -0.2333233, -2.723311, 0, 1, 0.7411765, 1,
-0.1097757, 0.6703338, -1.682407, 0, 1, 0.7490196, 1,
-0.1034251, 0.3252426, -1.43294, 0, 1, 0.7529412, 1,
-0.09823561, 0.3086872, 0.1550583, 0, 1, 0.7607843, 1,
-0.09660201, 1.241073, -0.06465098, 0, 1, 0.7647059, 1,
-0.09470288, -1.19091, -2.395735, 0, 1, 0.772549, 1,
-0.09419832, 1.160258, -0.3936567, 0, 1, 0.7764706, 1,
-0.09219183, 0.07306121, -0.3832135, 0, 1, 0.7843137, 1,
-0.09153318, 0.2520265, 1.56624, 0, 1, 0.7882353, 1,
-0.08854692, 0.4659111, 0.8774033, 0, 1, 0.7960784, 1,
-0.08681966, 0.3096743, -0.4830621, 0, 1, 0.8039216, 1,
-0.08041483, -1.488246, -2.812973, 0, 1, 0.8078431, 1,
-0.07959837, 0.8464165, 1.480655, 0, 1, 0.8156863, 1,
-0.0728807, 0.7536328, -0.07849704, 0, 1, 0.8196079, 1,
-0.06486309, 2.581114, 2.296031, 0, 1, 0.827451, 1,
-0.06436712, 0.6020676, -0.7057132, 0, 1, 0.8313726, 1,
-0.06355193, -0.3494222, -2.974076, 0, 1, 0.8392157, 1,
-0.06351444, -0.3046323, -2.257456, 0, 1, 0.8431373, 1,
-0.06210244, 0.9223542, -1.659411, 0, 1, 0.8509804, 1,
-0.06122867, -0.3537762, -1.556512, 0, 1, 0.854902, 1,
-0.05603305, 1.762011, -1.139209, 0, 1, 0.8627451, 1,
-0.05494066, 0.1888132, -1.015173, 0, 1, 0.8666667, 1,
-0.05442328, -0.3965285, -2.416421, 0, 1, 0.8745098, 1,
-0.05394114, -1.048686, -2.526053, 0, 1, 0.8784314, 1,
-0.05368345, -0.0416491, -4.431148, 0, 1, 0.8862745, 1,
-0.04989577, 0.1335814, 0.0647564, 0, 1, 0.8901961, 1,
-0.04948707, 0.6061501, 0.890745, 0, 1, 0.8980392, 1,
-0.04884606, -0.7038524, -1.190263, 0, 1, 0.9058824, 1,
-0.04769779, -1.120103, -2.593058, 0, 1, 0.9098039, 1,
-0.0439882, 1.638952, -0.4064648, 0, 1, 0.9176471, 1,
-0.04120777, -0.5472475, -3.63037, 0, 1, 0.9215686, 1,
-0.03499194, 0.2973959, -0.08605773, 0, 1, 0.9294118, 1,
-0.0311836, 1.455186, -1.054966, 0, 1, 0.9333333, 1,
-0.03037906, -0.3614519, -1.242018, 0, 1, 0.9411765, 1,
-0.03029061, -0.515713, -2.834018, 0, 1, 0.945098, 1,
-0.02512795, 0.1091669, -3.071721, 0, 1, 0.9529412, 1,
-0.0228736, 0.03634499, 1.532214, 0, 1, 0.9568627, 1,
-0.02197544, 0.2273745, -1.183695, 0, 1, 0.9647059, 1,
-0.01848483, 0.5780787, 0.2020025, 0, 1, 0.9686275, 1,
-0.01221437, 0.6428681, 0.5095726, 0, 1, 0.9764706, 1,
-0.008075051, -0.02273309, -2.238032, 0, 1, 0.9803922, 1,
-0.004943293, 1.000372, 1.895366, 0, 1, 0.9882353, 1,
-0.001063214, 0.2068645, -0.2958526, 0, 1, 0.9921569, 1,
-0.0009394696, 0.7190964, -2.389916, 0, 1, 1, 1,
0.001041532, -1.515823, 2.261972, 0, 0.9921569, 1, 1,
0.001154186, 0.7690492, -1.500991, 0, 0.9882353, 1, 1,
0.001608464, -0.8021181, 2.288612, 0, 0.9803922, 1, 1,
0.001830804, -0.3202245, 2.972246, 0, 0.9764706, 1, 1,
0.002374423, 0.6556757, -0.5542853, 0, 0.9686275, 1, 1,
0.006593696, 3.122203, 0.7597082, 0, 0.9647059, 1, 1,
0.01024377, -1.308096, 3.992392, 0, 0.9568627, 1, 1,
0.0121288, -1.293668, 3.292662, 0, 0.9529412, 1, 1,
0.0132185, -1.289404, 3.357457, 0, 0.945098, 1, 1,
0.01527608, 0.2829939, -1.01442, 0, 0.9411765, 1, 1,
0.01598617, -0.02996888, 2.452274, 0, 0.9333333, 1, 1,
0.01771354, 1.706544, 0.3438791, 0, 0.9294118, 1, 1,
0.01922823, 0.04545506, -0.0668243, 0, 0.9215686, 1, 1,
0.02549973, -0.9744581, 2.358311, 0, 0.9176471, 1, 1,
0.0273514, 0.5239192, -1.003737, 0, 0.9098039, 1, 1,
0.03118304, -2.275258, 3.94175, 0, 0.9058824, 1, 1,
0.03164638, -0.504618, 2.738658, 0, 0.8980392, 1, 1,
0.03621105, 1.036854, -0.8979717, 0, 0.8901961, 1, 1,
0.03871659, 0.3169299, -0.6828203, 0, 0.8862745, 1, 1,
0.0483435, -0.02621445, 0.7069333, 0, 0.8784314, 1, 1,
0.05288387, 1.713095, 0.4399752, 0, 0.8745098, 1, 1,
0.05418015, 0.9095063, -0.4139048, 0, 0.8666667, 1, 1,
0.05535669, -0.1095299, 3.326344, 0, 0.8627451, 1, 1,
0.05887853, 0.5927348, 0.2878041, 0, 0.854902, 1, 1,
0.06166355, 0.1734264, 1.212343, 0, 0.8509804, 1, 1,
0.06285782, -0.6620408, 2.570867, 0, 0.8431373, 1, 1,
0.06327419, 1.062976, 0.6659566, 0, 0.8392157, 1, 1,
0.06828161, -0.006319286, 0.4331522, 0, 0.8313726, 1, 1,
0.06891565, 0.1857442, 2.126241, 0, 0.827451, 1, 1,
0.07492924, -0.6007916, 2.15651, 0, 0.8196079, 1, 1,
0.08237204, 0.9203089, 0.002353828, 0, 0.8156863, 1, 1,
0.08987729, 0.7340606, -0.02624048, 0, 0.8078431, 1, 1,
0.09076318, 0.8247312, 0.1767558, 0, 0.8039216, 1, 1,
0.09100273, 0.8577091, 1.554433, 0, 0.7960784, 1, 1,
0.09123712, 0.6138356, 1.775724, 0, 0.7882353, 1, 1,
0.09320834, -0.4632904, 2.201236, 0, 0.7843137, 1, 1,
0.09551197, 0.3183771, -0.03507537, 0, 0.7764706, 1, 1,
0.09583186, -1.102313, 4.633532, 0, 0.772549, 1, 1,
0.09845249, -1.511148, 4.158137, 0, 0.7647059, 1, 1,
0.1105844, 0.1310093, -1.980241, 0, 0.7607843, 1, 1,
0.1108683, -1.145869, 3.092797, 0, 0.7529412, 1, 1,
0.1139003, 0.1516736, 1.824127, 0, 0.7490196, 1, 1,
0.1197046, -0.5470633, 3.119818, 0, 0.7411765, 1, 1,
0.1214661, 0.1460245, -0.515177, 0, 0.7372549, 1, 1,
0.1225707, -0.7669644, 1.717821, 0, 0.7294118, 1, 1,
0.1227911, 0.1055781, 1.386713, 0, 0.7254902, 1, 1,
0.1228902, -0.07444597, 3.023844, 0, 0.7176471, 1, 1,
0.1239029, -0.496538, 2.839833, 0, 0.7137255, 1, 1,
0.1251554, 0.2202294, -0.09095389, 0, 0.7058824, 1, 1,
0.1251786, -1.062029, 2.496303, 0, 0.6980392, 1, 1,
0.1280196, 0.5006921, -0.6049062, 0, 0.6941177, 1, 1,
0.1326424, 0.3385285, 0.7831191, 0, 0.6862745, 1, 1,
0.1569783, 1.430288, -0.0830353, 0, 0.682353, 1, 1,
0.1572071, -0.5856694, 3.926935, 0, 0.6745098, 1, 1,
0.1594169, 1.597464, -1.228069, 0, 0.6705883, 1, 1,
0.159491, 1.324229, 0.02125642, 0, 0.6627451, 1, 1,
0.1644437, -2.147558, 2.505669, 0, 0.6588235, 1, 1,
0.1647607, 0.7336568, 1.243847, 0, 0.6509804, 1, 1,
0.1661464, -0.2454919, 3.323732, 0, 0.6470588, 1, 1,
0.166512, 0.6550467, 1.543261, 0, 0.6392157, 1, 1,
0.1669046, -0.9886964, 4.217593, 0, 0.6352941, 1, 1,
0.1697808, -0.4457309, 1.521636, 0, 0.627451, 1, 1,
0.1726696, 0.4448957, 0.5034239, 0, 0.6235294, 1, 1,
0.1767783, 1.435931, 1.089103, 0, 0.6156863, 1, 1,
0.1776564, -0.9665941, 2.466326, 0, 0.6117647, 1, 1,
0.1845657, -1.904992, 3.632863, 0, 0.6039216, 1, 1,
0.1872432, 0.0812795, 0.8912286, 0, 0.5960785, 1, 1,
0.1886181, -0.590533, 2.606503, 0, 0.5921569, 1, 1,
0.1941465, 0.4623151, -0.05745885, 0, 0.5843138, 1, 1,
0.1985633, -0.7573209, 3.345233, 0, 0.5803922, 1, 1,
0.2080182, -0.923681, 1.68003, 0, 0.572549, 1, 1,
0.2088863, -1.067602, 2.276906, 0, 0.5686275, 1, 1,
0.2103347, 1.578131, -1.394485, 0, 0.5607843, 1, 1,
0.2118495, 0.2281358, 1.569885, 0, 0.5568628, 1, 1,
0.2119018, 0.05252595, 1.3767, 0, 0.5490196, 1, 1,
0.2165495, -2.957896, 4.056394, 0, 0.5450981, 1, 1,
0.2172177, -0.519791, 3.27465, 0, 0.5372549, 1, 1,
0.2189147, -1.712041, 3.065237, 0, 0.5333334, 1, 1,
0.2211809, 0.1075307, -0.3824623, 0, 0.5254902, 1, 1,
0.2245303, 1.407451, -1.353476, 0, 0.5215687, 1, 1,
0.2294054, -0.05503644, 1.53899, 0, 0.5137255, 1, 1,
0.231051, 0.416729, 1.423063, 0, 0.509804, 1, 1,
0.2322053, -0.6791868, 2.733365, 0, 0.5019608, 1, 1,
0.2336884, -0.7986714, 1.984373, 0, 0.4941176, 1, 1,
0.2348624, 0.5497978, 1.638138, 0, 0.4901961, 1, 1,
0.2358836, -1.049429, 0.8684778, 0, 0.4823529, 1, 1,
0.2387552, -1.258189, 2.943899, 0, 0.4784314, 1, 1,
0.2402428, 0.9960964, -0.6475838, 0, 0.4705882, 1, 1,
0.2445011, -1.412178, 3.487407, 0, 0.4666667, 1, 1,
0.2453233, -2.185072, 2.980289, 0, 0.4588235, 1, 1,
0.2470495, -0.3387884, 3.436355, 0, 0.454902, 1, 1,
0.2531079, 1.766993, -0.04203681, 0, 0.4470588, 1, 1,
0.2570218, 1.684034, 1.55069, 0, 0.4431373, 1, 1,
0.2578008, -0.4674493, 2.130352, 0, 0.4352941, 1, 1,
0.258352, 0.648298, 0.08310562, 0, 0.4313726, 1, 1,
0.2583652, 1.164586, -0.5191333, 0, 0.4235294, 1, 1,
0.2585266, -0.3428002, 1.158526, 0, 0.4196078, 1, 1,
0.2606635, -0.2027759, 0.8336882, 0, 0.4117647, 1, 1,
0.2645404, -0.5111502, 2.163256, 0, 0.4078431, 1, 1,
0.2669894, -1.158195, 2.951917, 0, 0.4, 1, 1,
0.2695174, -1.607491, 5.043995, 0, 0.3921569, 1, 1,
0.269713, -0.7044376, 3.709109, 0, 0.3882353, 1, 1,
0.2700175, -0.5140557, 2.411457, 0, 0.3803922, 1, 1,
0.2712941, 1.609153, 2.305699, 0, 0.3764706, 1, 1,
0.2731165, -1.204958, 4.637747, 0, 0.3686275, 1, 1,
0.2752265, 0.7395148, -0.8757736, 0, 0.3647059, 1, 1,
0.2809861, -0.3123762, 1.069244, 0, 0.3568628, 1, 1,
0.2960185, -2.119477, 3.742399, 0, 0.3529412, 1, 1,
0.2960546, 0.3798047, 0.7666454, 0, 0.345098, 1, 1,
0.3001522, 0.8916497, 1.026621, 0, 0.3411765, 1, 1,
0.3007306, -0.2417645, 1.608574, 0, 0.3333333, 1, 1,
0.3035446, -0.3809534, 2.859857, 0, 0.3294118, 1, 1,
0.3059855, 1.378824, -0.8625288, 0, 0.3215686, 1, 1,
0.3062014, 1.806965, -0.5439004, 0, 0.3176471, 1, 1,
0.3087428, 1.015655, 0.7060639, 0, 0.3098039, 1, 1,
0.3104764, 1.152146, 1.14725, 0, 0.3058824, 1, 1,
0.3138538, -0.2530761, 1.970666, 0, 0.2980392, 1, 1,
0.323138, -0.7690693, 2.824901, 0, 0.2901961, 1, 1,
0.3252238, -0.4539343, 4.582392, 0, 0.2862745, 1, 1,
0.3273087, -0.1105893, 1.768214, 0, 0.2784314, 1, 1,
0.3304112, 0.1198858, 0.9542052, 0, 0.2745098, 1, 1,
0.330932, -0.5672072, 3.283666, 0, 0.2666667, 1, 1,
0.3339009, -1.469587, 0.4619149, 0, 0.2627451, 1, 1,
0.3373071, -0.5808198, 3.787575, 0, 0.254902, 1, 1,
0.3382553, -0.3287993, 1.311778, 0, 0.2509804, 1, 1,
0.3443383, -0.7895501, 3.052587, 0, 0.2431373, 1, 1,
0.3471702, 0.05582501, -0.7242466, 0, 0.2392157, 1, 1,
0.3479418, -0.09276683, 2.171653, 0, 0.2313726, 1, 1,
0.3563931, 0.1807618, 1.675742, 0, 0.227451, 1, 1,
0.3581068, 0.3548136, 0.6923128, 0, 0.2196078, 1, 1,
0.3584495, 0.658987, 0.01017868, 0, 0.2156863, 1, 1,
0.3592588, -0.04472066, 1.395989, 0, 0.2078431, 1, 1,
0.3615689, 0.3645809, 1.905529, 0, 0.2039216, 1, 1,
0.3631065, 1.346385, 0.2615902, 0, 0.1960784, 1, 1,
0.3654235, 1.232557, 0.4327095, 0, 0.1882353, 1, 1,
0.366306, 0.1579819, 0.7142351, 0, 0.1843137, 1, 1,
0.3694208, 0.1666391, 0.2463254, 0, 0.1764706, 1, 1,
0.3725583, -0.6054576, 1.494857, 0, 0.172549, 1, 1,
0.372921, 0.4179041, 1.530556, 0, 0.1647059, 1, 1,
0.3832293, -0.2995203, 3.246996, 0, 0.1607843, 1, 1,
0.3832837, -1.245591, 2.777805, 0, 0.1529412, 1, 1,
0.3914238, -0.4593823, 1.922747, 0, 0.1490196, 1, 1,
0.3918833, 0.5666673, 1.09506, 0, 0.1411765, 1, 1,
0.3921434, 0.2130331, 3.982298, 0, 0.1372549, 1, 1,
0.395458, 0.01770425, 2.819968, 0, 0.1294118, 1, 1,
0.4021067, -0.6170739, 2.43267, 0, 0.1254902, 1, 1,
0.4034517, -1.993194, 3.657289, 0, 0.1176471, 1, 1,
0.410242, -0.8271798, 3.278437, 0, 0.1137255, 1, 1,
0.4117216, -1.917338, 2.267394, 0, 0.1058824, 1, 1,
0.4140445, -0.5893508, 2.951608, 0, 0.09803922, 1, 1,
0.4190138, 0.8078019, 0.1846096, 0, 0.09411765, 1, 1,
0.4301222, 0.2984092, 0.1980802, 0, 0.08627451, 1, 1,
0.4335939, -0.005339053, 1.21289, 0, 0.08235294, 1, 1,
0.4357933, -0.3901719, 2.704982, 0, 0.07450981, 1, 1,
0.4368947, 1.849992, 0.7861761, 0, 0.07058824, 1, 1,
0.4480776, 1.315642, -0.4340068, 0, 0.0627451, 1, 1,
0.4539686, 0.3934158, 0.3217343, 0, 0.05882353, 1, 1,
0.4545953, -0.4677104, 1.938309, 0, 0.05098039, 1, 1,
0.4581201, 0.3192842, 1.354323, 0, 0.04705882, 1, 1,
0.4623576, 1.735792, 0.4384225, 0, 0.03921569, 1, 1,
0.4637127, -1.483768, 1.625128, 0, 0.03529412, 1, 1,
0.4656721, 0.2416176, 0.881461, 0, 0.02745098, 1, 1,
0.4704758, -0.6022019, 1.474756, 0, 0.02352941, 1, 1,
0.473904, -0.2127713, 2.595521, 0, 0.01568628, 1, 1,
0.4817214, -0.2841112, 1.39316, 0, 0.01176471, 1, 1,
0.4823245, 0.2363219, 0.4070565, 0, 0.003921569, 1, 1,
0.4832788, -1.152595, 3.087941, 0.003921569, 0, 1, 1,
0.4861852, 0.9737058, 1.110456, 0.007843138, 0, 1, 1,
0.4929613, -0.3314982, 1.826063, 0.01568628, 0, 1, 1,
0.4929911, 0.9326911, 2.512744, 0.01960784, 0, 1, 1,
0.4970526, -0.9674727, 1.547293, 0.02745098, 0, 1, 1,
0.498322, 0.01714391, 1.97832, 0.03137255, 0, 1, 1,
0.5008046, 0.576788, -1.882649, 0.03921569, 0, 1, 1,
0.5014454, -0.5567779, 2.068482, 0.04313726, 0, 1, 1,
0.5021404, 0.2917457, 0.8982099, 0.05098039, 0, 1, 1,
0.5076918, -2.566697, 2.208228, 0.05490196, 0, 1, 1,
0.508083, -1.140724, 1.738776, 0.0627451, 0, 1, 1,
0.5121843, -0.2608925, 0.4531495, 0.06666667, 0, 1, 1,
0.5176439, -0.3245569, 3.797059, 0.07450981, 0, 1, 1,
0.5196803, -0.02496345, 0.881045, 0.07843138, 0, 1, 1,
0.5247616, -1.536492, 3.14574, 0.08627451, 0, 1, 1,
0.5263758, -0.3181254, 3.496259, 0.09019608, 0, 1, 1,
0.5272502, 0.5627438, 0.9237735, 0.09803922, 0, 1, 1,
0.527437, 0.2707224, 0.8553227, 0.1058824, 0, 1, 1,
0.5308484, 0.7142758, 0.8409567, 0.1098039, 0, 1, 1,
0.5341191, -0.6623273, 3.827165, 0.1176471, 0, 1, 1,
0.5432523, 0.6924089, -0.5112956, 0.1215686, 0, 1, 1,
0.5464744, 0.01049973, 0.9744602, 0.1294118, 0, 1, 1,
0.5474626, -1.424626, 2.234569, 0.1333333, 0, 1, 1,
0.5488017, 1.343231, 1.694874, 0.1411765, 0, 1, 1,
0.550155, -0.209503, 2.115505, 0.145098, 0, 1, 1,
0.5509567, -0.1168085, 2.599053, 0.1529412, 0, 1, 1,
0.5530819, 0.259477, 0.8381858, 0.1568628, 0, 1, 1,
0.5536872, -0.1659467, 1.533128, 0.1647059, 0, 1, 1,
0.5576231, 0.1667651, 1.216444, 0.1686275, 0, 1, 1,
0.5577963, -0.5529706, 2.321505, 0.1764706, 0, 1, 1,
0.557938, 2.196498, -0.6060064, 0.1803922, 0, 1, 1,
0.5601307, -1.360366, 2.279847, 0.1882353, 0, 1, 1,
0.564647, 1.094175, 1.160625, 0.1921569, 0, 1, 1,
0.5664113, 0.6052981, 1.645774, 0.2, 0, 1, 1,
0.5668437, -0.7881119, 3.021013, 0.2078431, 0, 1, 1,
0.5683126, -0.6257546, 3.169957, 0.2117647, 0, 1, 1,
0.5689244, 1.619199, -0.5109205, 0.2196078, 0, 1, 1,
0.5714308, 0.03733559, 2.833583, 0.2235294, 0, 1, 1,
0.5754077, 0.9519212, 0.2935281, 0.2313726, 0, 1, 1,
0.5761715, -0.7047252, 2.225663, 0.2352941, 0, 1, 1,
0.5833431, 1.496603, 1.211497, 0.2431373, 0, 1, 1,
0.58516, -0.2554328, 1.488514, 0.2470588, 0, 1, 1,
0.5855829, 1.500406, 0.06811709, 0.254902, 0, 1, 1,
0.5867938, -1.212141, 1.60472, 0.2588235, 0, 1, 1,
0.5871308, -1.743851, 2.709188, 0.2666667, 0, 1, 1,
0.5916651, 2.3411, 0.7287434, 0.2705882, 0, 1, 1,
0.5934914, -1.149591, 2.677017, 0.2784314, 0, 1, 1,
0.602139, -0.06257262, 1.865221, 0.282353, 0, 1, 1,
0.6025314, -1.4322, 0.9235317, 0.2901961, 0, 1, 1,
0.6122876, -0.4397333, 3.648991, 0.2941177, 0, 1, 1,
0.6124953, -1.195755, 3.944148, 0.3019608, 0, 1, 1,
0.6255705, -0.1810137, 0.2044881, 0.3098039, 0, 1, 1,
0.6274394, 0.08832493, 2.381742, 0.3137255, 0, 1, 1,
0.6280392, -0.01257471, 3.488982, 0.3215686, 0, 1, 1,
0.631081, 0.09797035, 1.860924, 0.3254902, 0, 1, 1,
0.6312691, -1.179124, 2.335943, 0.3333333, 0, 1, 1,
0.6360775, -0.8677641, 1.654078, 0.3372549, 0, 1, 1,
0.6361756, 1.720761, 0.8458756, 0.345098, 0, 1, 1,
0.6363947, 1.653142, 0.7081468, 0.3490196, 0, 1, 1,
0.6370566, 0.07792467, 0.7156487, 0.3568628, 0, 1, 1,
0.6448943, 2.37844, 0.9529939, 0.3607843, 0, 1, 1,
0.649094, -0.2372527, 0.2261486, 0.3686275, 0, 1, 1,
0.6499817, 1.172674, 1.524887, 0.372549, 0, 1, 1,
0.6542873, -0.9847209, 3.006705, 0.3803922, 0, 1, 1,
0.6549717, -0.8394007, 2.811116, 0.3843137, 0, 1, 1,
0.6570247, -0.08764426, 1.758821, 0.3921569, 0, 1, 1,
0.6619322, 0.482159, 2.276657, 0.3960784, 0, 1, 1,
0.6702842, -0.4036453, 3.247773, 0.4039216, 0, 1, 1,
0.6721195, 0.7649744, 0.9716986, 0.4117647, 0, 1, 1,
0.6755733, -1.324628, 3.177042, 0.4156863, 0, 1, 1,
0.6792657, 0.2589903, 0.743301, 0.4235294, 0, 1, 1,
0.6798732, -0.2394907, 3.469823, 0.427451, 0, 1, 1,
0.6851568, 0.7029235, -0.2640844, 0.4352941, 0, 1, 1,
0.6868408, 0.8479993, -0.6112977, 0.4392157, 0, 1, 1,
0.687618, 1.862199, 1.053743, 0.4470588, 0, 1, 1,
0.7017888, 0.1532262, 1.598923, 0.4509804, 0, 1, 1,
0.7026263, -1.376189, 3.930161, 0.4588235, 0, 1, 1,
0.7047564, 1.049563, 0.2309936, 0.4627451, 0, 1, 1,
0.7075959, 0.6222513, 1.243302, 0.4705882, 0, 1, 1,
0.7084093, -1.383616, 3.357396, 0.4745098, 0, 1, 1,
0.7088808, -2.024654, 3.565675, 0.4823529, 0, 1, 1,
0.7102255, -1.483258, 2.608542, 0.4862745, 0, 1, 1,
0.7108378, 0.05659654, 1.495623, 0.4941176, 0, 1, 1,
0.7140661, 0.3013098, 1.987187, 0.5019608, 0, 1, 1,
0.716011, -1.745838, 3.364324, 0.5058824, 0, 1, 1,
0.7168068, 0.6201306, 1.662145, 0.5137255, 0, 1, 1,
0.724987, 0.9346002, 2.418265, 0.5176471, 0, 1, 1,
0.7275211, -1.282387, 0.5014651, 0.5254902, 0, 1, 1,
0.7362638, 0.2817568, 1.62516, 0.5294118, 0, 1, 1,
0.74417, -1.26552, 2.665352, 0.5372549, 0, 1, 1,
0.7442414, 1.049164, 0.9180066, 0.5411765, 0, 1, 1,
0.7445257, 0.1329223, 1.157343, 0.5490196, 0, 1, 1,
0.7471837, 0.03971258, 2.728847, 0.5529412, 0, 1, 1,
0.7485965, -0.8206674, 3.108528, 0.5607843, 0, 1, 1,
0.7500064, 0.1782984, 2.894287, 0.5647059, 0, 1, 1,
0.7524371, -0.1159872, 2.388539, 0.572549, 0, 1, 1,
0.7589505, -1.483816, 2.959, 0.5764706, 0, 1, 1,
0.7635729, 0.3830251, 0.7390868, 0.5843138, 0, 1, 1,
0.766748, -0.4264053, 2.51344, 0.5882353, 0, 1, 1,
0.7698979, 1.299126, -0.2683113, 0.5960785, 0, 1, 1,
0.7711654, -0.3674776, 4.158727, 0.6039216, 0, 1, 1,
0.7721637, -0.3737905, 0.8152116, 0.6078432, 0, 1, 1,
0.7738462, -1.027576, 3.164733, 0.6156863, 0, 1, 1,
0.7789487, -0.2467191, 1.055237, 0.6196079, 0, 1, 1,
0.7797641, -0.6553338, 2.477297, 0.627451, 0, 1, 1,
0.7851866, 0.1220868, 1.534552, 0.6313726, 0, 1, 1,
0.795468, -1.076344, 2.530057, 0.6392157, 0, 1, 1,
0.7965797, 0.6917931, 0.2747128, 0.6431373, 0, 1, 1,
0.7985742, -1.528217, 2.298563, 0.6509804, 0, 1, 1,
0.8051284, 1.159671, 0.5065066, 0.654902, 0, 1, 1,
0.8075686, -0.9983031, 2.516034, 0.6627451, 0, 1, 1,
0.8106794, 0.3586268, 1.260258, 0.6666667, 0, 1, 1,
0.8107978, -0.02903941, 0.9569032, 0.6745098, 0, 1, 1,
0.8146799, -0.1591769, 3.03729, 0.6784314, 0, 1, 1,
0.8192025, -0.7123294, 3.812525, 0.6862745, 0, 1, 1,
0.8349428, 0.9365261, 0.3361324, 0.6901961, 0, 1, 1,
0.8392362, 1.302552, 0.1016834, 0.6980392, 0, 1, 1,
0.8393686, -1.720397, 2.026164, 0.7058824, 0, 1, 1,
0.8435822, -0.4172349, 2.140094, 0.7098039, 0, 1, 1,
0.8484384, -0.3177539, 3.130436, 0.7176471, 0, 1, 1,
0.8539769, -1.685199, 2.638373, 0.7215686, 0, 1, 1,
0.8786851, 0.5231402, 1.68501, 0.7294118, 0, 1, 1,
0.8861638, 0.3578191, 1.107643, 0.7333333, 0, 1, 1,
0.8897417, -0.1222357, 2.221816, 0.7411765, 0, 1, 1,
0.8927377, 0.3767304, 2.975243, 0.7450981, 0, 1, 1,
0.893298, -0.5088721, 1.868196, 0.7529412, 0, 1, 1,
0.8964015, -0.8423625, 3.459452, 0.7568628, 0, 1, 1,
0.8990026, 0.7611187, 2.339488, 0.7647059, 0, 1, 1,
0.9003691, 0.1772539, 2.761236, 0.7686275, 0, 1, 1,
0.9032043, -1.741384, -0.04109589, 0.7764706, 0, 1, 1,
0.9061066, -0.7724923, 1.199274, 0.7803922, 0, 1, 1,
0.9072354, 0.4631172, 0.4112983, 0.7882353, 0, 1, 1,
0.9141847, 1.017998, 0.7254161, 0.7921569, 0, 1, 1,
0.9159378, -1.029883, 2.601296, 0.8, 0, 1, 1,
0.9178857, 0.2977394, 3.29957, 0.8078431, 0, 1, 1,
0.9191045, -1.375554, 4.476079, 0.8117647, 0, 1, 1,
0.9226616, -1.317463, 2.740645, 0.8196079, 0, 1, 1,
0.926269, 0.5967292, 1.868901, 0.8235294, 0, 1, 1,
0.9318265, -0.6181886, 1.06274, 0.8313726, 0, 1, 1,
0.9389181, 0.2830498, 1.300661, 0.8352941, 0, 1, 1,
0.9411818, 1.186339, 2.571562, 0.8431373, 0, 1, 1,
0.9436965, 2.190475, 0.5487605, 0.8470588, 0, 1, 1,
0.9463361, -0.228605, 2.005344, 0.854902, 0, 1, 1,
0.9476495, 0.02365719, 2.15201, 0.8588235, 0, 1, 1,
0.9483817, 1.574349, 1.773892, 0.8666667, 0, 1, 1,
0.9484187, -0.8481584, 2.394639, 0.8705882, 0, 1, 1,
0.9500954, -0.7078399, 1.570609, 0.8784314, 0, 1, 1,
0.9534026, -2.18978, 1.968991, 0.8823529, 0, 1, 1,
0.9539831, 0.1805085, 2.563639, 0.8901961, 0, 1, 1,
0.9572524, -1.267224, 1.550872, 0.8941177, 0, 1, 1,
0.9579677, 0.9913886, -0.2239028, 0.9019608, 0, 1, 1,
0.9594146, -0.3163064, 2.052223, 0.9098039, 0, 1, 1,
0.9618464, 0.4069227, 0.7136518, 0.9137255, 0, 1, 1,
0.9621754, 0.2492073, 2.808162, 0.9215686, 0, 1, 1,
0.9629158, 1.61464, 2.385162, 0.9254902, 0, 1, 1,
0.9688047, -1.588728, 1.078848, 0.9333333, 0, 1, 1,
0.9694079, 1.185884, 0.6147627, 0.9372549, 0, 1, 1,
0.969892, -0.746519, 1.279302, 0.945098, 0, 1, 1,
0.9868921, 1.156134, 1.921991, 0.9490196, 0, 1, 1,
0.9897056, 0.1116537, 3.428524, 0.9568627, 0, 1, 1,
0.9928481, -0.5131849, 0.9455042, 0.9607843, 0, 1, 1,
0.9934365, 0.5905504, 1.974934, 0.9686275, 0, 1, 1,
0.9951581, 2.618796, 0.3472374, 0.972549, 0, 1, 1,
1.007736, 0.6729299, 0.2655877, 0.9803922, 0, 1, 1,
1.011906, 0.03023552, 0.9458039, 0.9843137, 0, 1, 1,
1.013798, 0.5558161, 0.7283077, 0.9921569, 0, 1, 1,
1.014068, -0.5893477, -0.2831947, 0.9960784, 0, 1, 1,
1.015903, 0.1240499, 1.68894, 1, 0, 0.9960784, 1,
1.016181, 0.5840507, 0.7328016, 1, 0, 0.9882353, 1,
1.019369, 0.5170614, 1.436799, 1, 0, 0.9843137, 1,
1.02278, 0.9360146, 1.007723, 1, 0, 0.9764706, 1,
1.026064, -1.618275, 1.117058, 1, 0, 0.972549, 1,
1.028185, 0.8348477, 2.688925, 1, 0, 0.9647059, 1,
1.028932, -1.36638, 1.223323, 1, 0, 0.9607843, 1,
1.034668, -0.9149157, 3.629827, 1, 0, 0.9529412, 1,
1.043531, 1.760244, -2.491256, 1, 0, 0.9490196, 1,
1.050063, -1.616006, 2.908735, 1, 0, 0.9411765, 1,
1.050279, 1.030364, 0.2813318, 1, 0, 0.9372549, 1,
1.050368, -0.4360715, 2.622677, 1, 0, 0.9294118, 1,
1.055637, 0.4567912, 0.778855, 1, 0, 0.9254902, 1,
1.055672, -0.1352737, 1.348969, 1, 0, 0.9176471, 1,
1.061275, -0.8577973, 3.638002, 1, 0, 0.9137255, 1,
1.06674, -1.300782, 1.580399, 1, 0, 0.9058824, 1,
1.067196, 1.170191, 0.5460165, 1, 0, 0.9019608, 1,
1.07218, 0.01180695, 1.331473, 1, 0, 0.8941177, 1,
1.075047, 0.4219859, 0.6823728, 1, 0, 0.8862745, 1,
1.075146, 0.3929511, 2.336581, 1, 0, 0.8823529, 1,
1.083217, -1.064576, 1.858461, 1, 0, 0.8745098, 1,
1.090562, -1.389526, 2.499912, 1, 0, 0.8705882, 1,
1.09306, -0.3828337, 0.6640401, 1, 0, 0.8627451, 1,
1.11933, -0.1469814, 2.350205, 1, 0, 0.8588235, 1,
1.12729, 0.2164216, -0.5152411, 1, 0, 0.8509804, 1,
1.129429, 2.897965, -1.675774, 1, 0, 0.8470588, 1,
1.130522, 0.7742062, -1.170426, 1, 0, 0.8392157, 1,
1.130744, 1.109977, 1.890702, 1, 0, 0.8352941, 1,
1.138925, -0.1901768, 0.03302383, 1, 0, 0.827451, 1,
1.140932, 0.05683862, 1.430739, 1, 0, 0.8235294, 1,
1.169805, 0.3162077, 0.02108362, 1, 0, 0.8156863, 1,
1.171988, 0.9688308, -0.7663079, 1, 0, 0.8117647, 1,
1.179787, 1.851056, -0.267504, 1, 0, 0.8039216, 1,
1.180373, -1.11715, 1.777164, 1, 0, 0.7960784, 1,
1.18154, 1.643882, 0.9656295, 1, 0, 0.7921569, 1,
1.182207, -0.8726974, 2.387283, 1, 0, 0.7843137, 1,
1.182548, 0.05192051, 3.054166, 1, 0, 0.7803922, 1,
1.182862, -0.6527496, 2.036341, 1, 0, 0.772549, 1,
1.187562, 0.6083998, 1.197484, 1, 0, 0.7686275, 1,
1.194769, 0.4065201, 0.9393797, 1, 0, 0.7607843, 1,
1.208199, -0.5496354, 2.035764, 1, 0, 0.7568628, 1,
1.209682, 0.6466416, 0.04568104, 1, 0, 0.7490196, 1,
1.21092, -1.27623, 2.616823, 1, 0, 0.7450981, 1,
1.217003, -0.9201297, 3.382828, 1, 0, 0.7372549, 1,
1.225593, 0.8279962, -0.878194, 1, 0, 0.7333333, 1,
1.23014, 0.2219595, 1.953086, 1, 0, 0.7254902, 1,
1.231936, 0.0780958, 3.085365, 1, 0, 0.7215686, 1,
1.252663, -0.8290473, 3.910879, 1, 0, 0.7137255, 1,
1.253345, -0.3148275, 1.270707, 1, 0, 0.7098039, 1,
1.253499, -0.7730022, 3.30829, 1, 0, 0.7019608, 1,
1.265013, -0.8031346, 1.603079, 1, 0, 0.6941177, 1,
1.265087, 0.6915911, 1.009944, 1, 0, 0.6901961, 1,
1.269617, 0.5791607, 1.980253, 1, 0, 0.682353, 1,
1.274439, -0.2392976, 1.72518, 1, 0, 0.6784314, 1,
1.2754, -0.1334746, 1.453094, 1, 0, 0.6705883, 1,
1.275904, 1.1088, 1.229301, 1, 0, 0.6666667, 1,
1.277997, 1.044989, 1.719531, 1, 0, 0.6588235, 1,
1.278795, 1.040144, -0.5119921, 1, 0, 0.654902, 1,
1.29676, -0.5271827, 3.107495, 1, 0, 0.6470588, 1,
1.300304, -0.4130954, 1.67163, 1, 0, 0.6431373, 1,
1.303253, -1.244553, 2.717535, 1, 0, 0.6352941, 1,
1.304239, -2.112499, 3.040442, 1, 0, 0.6313726, 1,
1.309762, -0.1185434, 1.843849, 1, 0, 0.6235294, 1,
1.319028, -0.3784224, 0.983303, 1, 0, 0.6196079, 1,
1.325354, -0.2468794, 1.32902, 1, 0, 0.6117647, 1,
1.330433, -0.3788401, 3.437421, 1, 0, 0.6078432, 1,
1.335301, -0.2635648, 2.389689, 1, 0, 0.6, 1,
1.338138, 0.4886776, 0.8012636, 1, 0, 0.5921569, 1,
1.338482, 0.4980315, 2.024455, 1, 0, 0.5882353, 1,
1.350664, 0.4195459, 0.3843606, 1, 0, 0.5803922, 1,
1.359661, -0.3521553, 2.929549, 1, 0, 0.5764706, 1,
1.364201, -1.848084, 2.035513, 1, 0, 0.5686275, 1,
1.37156, -0.6087351, 1.714201, 1, 0, 0.5647059, 1,
1.373081, -1.594714, 0.200787, 1, 0, 0.5568628, 1,
1.373095, -0.21942, 0.1984303, 1, 0, 0.5529412, 1,
1.375894, -1.303215, 0.6926901, 1, 0, 0.5450981, 1,
1.380239, 0.4592245, -0.3745661, 1, 0, 0.5411765, 1,
1.382853, -0.1794127, 2.176412, 1, 0, 0.5333334, 1,
1.385198, -0.5675809, 1.616186, 1, 0, 0.5294118, 1,
1.386029, -1.007851, 2.373649, 1, 0, 0.5215687, 1,
1.388791, 0.03582961, 1.435538, 1, 0, 0.5176471, 1,
1.395584, -0.3783881, 0.9762091, 1, 0, 0.509804, 1,
1.397533, 1.011083, 1.729801, 1, 0, 0.5058824, 1,
1.415649, 0.02006511, 1.229471, 1, 0, 0.4980392, 1,
1.423776, 1.268331, 1.674964, 1, 0, 0.4901961, 1,
1.435465, -0.9176235, 2.269814, 1, 0, 0.4862745, 1,
1.44714, -0.04384639, 0.126058, 1, 0, 0.4784314, 1,
1.449142, 0.9690076, 1.82339, 1, 0, 0.4745098, 1,
1.453748, -1.138315, 4.31588, 1, 0, 0.4666667, 1,
1.460773, 0.3749319, 0.5467924, 1, 0, 0.4627451, 1,
1.460952, -1.577529, 3.236073, 1, 0, 0.454902, 1,
1.472911, 0.07944245, 1.246108, 1, 0, 0.4509804, 1,
1.490907, -0.06094151, 1.824551, 1, 0, 0.4431373, 1,
1.503338, -0.1903155, 3.521387, 1, 0, 0.4392157, 1,
1.503485, 1.216065, 2.264428, 1, 0, 0.4313726, 1,
1.505523, -0.4093358, 2.672951, 1, 0, 0.427451, 1,
1.508039, -0.6546724, 2.115631, 1, 0, 0.4196078, 1,
1.521425, -0.8378506, 1.754802, 1, 0, 0.4156863, 1,
1.52816, -0.7142684, 0.6803402, 1, 0, 0.4078431, 1,
1.536449, -0.6044331, 1.683817, 1, 0, 0.4039216, 1,
1.547063, -0.3392946, 2.165736, 1, 0, 0.3960784, 1,
1.580451, 0.01573666, 0.7617978, 1, 0, 0.3882353, 1,
1.611036, 0.7193189, 0.2017886, 1, 0, 0.3843137, 1,
1.614313, 1.413693, 0.505748, 1, 0, 0.3764706, 1,
1.621029, 0.09965621, -0.5936618, 1, 0, 0.372549, 1,
1.631927, -1.78981, 1.123031, 1, 0, 0.3647059, 1,
1.637667, 2.018256, 0.3174366, 1, 0, 0.3607843, 1,
1.640033, 0.9750253, 1.679532, 1, 0, 0.3529412, 1,
1.651662, -1.944044, 2.252757, 1, 0, 0.3490196, 1,
1.657844, 0.7195151, 1.870655, 1, 0, 0.3411765, 1,
1.659252, -0.8826603, 1.958283, 1, 0, 0.3372549, 1,
1.659512, 1.227188, 0.9624343, 1, 0, 0.3294118, 1,
1.666353, 0.3825915, 2.21287, 1, 0, 0.3254902, 1,
1.672975, -1.133416, 1.757618, 1, 0, 0.3176471, 1,
1.673331, -1.122982, 1.715551, 1, 0, 0.3137255, 1,
1.686554, -0.653176, 0.8546509, 1, 0, 0.3058824, 1,
1.7085, 0.21935, 2.729807, 1, 0, 0.2980392, 1,
1.730757, -0.1779273, 1.689502, 1, 0, 0.2941177, 1,
1.735622, -0.2301572, 2.036661, 1, 0, 0.2862745, 1,
1.736831, -0.6349598, 1.725838, 1, 0, 0.282353, 1,
1.743512, 0.7246681, -0.1890039, 1, 0, 0.2745098, 1,
1.778578, 2.043392, 1.065771, 1, 0, 0.2705882, 1,
1.780853, -0.592941, 2.456285, 1, 0, 0.2627451, 1,
1.781036, 0.3368828, 1.056406, 1, 0, 0.2588235, 1,
1.791014, 1.831707, 1.431814, 1, 0, 0.2509804, 1,
1.806988, 0.1655909, 1.140347, 1, 0, 0.2470588, 1,
1.814423, -0.3502381, 2.494495, 1, 0, 0.2392157, 1,
1.832823, -1.275734, 1.622952, 1, 0, 0.2352941, 1,
1.840228, 0.7693399, 0.7064902, 1, 0, 0.227451, 1,
1.842253, 0.5540374, -0.06015041, 1, 0, 0.2235294, 1,
1.85475, 0.6075351, 0.4950005, 1, 0, 0.2156863, 1,
1.858772, -0.4135123, 2.356637, 1, 0, 0.2117647, 1,
1.866672, -0.921852, 1.121034, 1, 0, 0.2039216, 1,
1.873722, 1.998431, 0.6172106, 1, 0, 0.1960784, 1,
1.879717, 1.988211, -0.5036313, 1, 0, 0.1921569, 1,
1.922004, 1.387029, 1.994344, 1, 0, 0.1843137, 1,
1.956243, 0.2247593, 2.677768, 1, 0, 0.1803922, 1,
1.998037, 0.5626798, 2.109384, 1, 0, 0.172549, 1,
2.009859, -0.3703777, 1.395473, 1, 0, 0.1686275, 1,
2.068204, 1.216185, 1.326051, 1, 0, 0.1607843, 1,
2.088983, 0.7309037, 0.09280779, 1, 0, 0.1568628, 1,
2.092109, -0.5326511, 1.042021, 1, 0, 0.1490196, 1,
2.104699, -1.070828, 1.083337, 1, 0, 0.145098, 1,
2.10999, 1.022871, 2.974428, 1, 0, 0.1372549, 1,
2.110567, 1.254061, 0.8124132, 1, 0, 0.1333333, 1,
2.12368, 0.01157689, 2.627845, 1, 0, 0.1254902, 1,
2.136072, -1.125715, 2.070839, 1, 0, 0.1215686, 1,
2.156033, 0.1890294, 1.02562, 1, 0, 0.1137255, 1,
2.160053, 0.07642228, 2.339944, 1, 0, 0.1098039, 1,
2.16609, -1.026596, 1.011495, 1, 0, 0.1019608, 1,
2.167269, 0.8475332, 0.0002405483, 1, 0, 0.09411765, 1,
2.183605, -0.9848674, 2.70174, 1, 0, 0.09019608, 1,
2.198597, 0.03382147, 2.410957, 1, 0, 0.08235294, 1,
2.204694, 0.4082865, 2.012435, 1, 0, 0.07843138, 1,
2.251886, -0.05551843, 1.557802, 1, 0, 0.07058824, 1,
2.380505, -0.6181172, 1.038709, 1, 0, 0.06666667, 1,
2.405015, 0.3558577, 1.657739, 1, 0, 0.05882353, 1,
2.446953, -0.8774806, 1.554548, 1, 0, 0.05490196, 1,
2.462442, -0.5119083, 2.434714, 1, 0, 0.04705882, 1,
2.58077, 1.425896, 2.041132, 1, 0, 0.04313726, 1,
2.629377, -0.8729041, 1.418499, 1, 0, 0.03529412, 1,
2.63176, 0.2952742, 1.318909, 1, 0, 0.03137255, 1,
2.651329, 0.7877675, 1.462764, 1, 0, 0.02352941, 1,
2.702812, 0.8068638, 2.44094, 1, 0, 0.01960784, 1,
2.886521, -0.753324, 0.7507334, 1, 0, 0.01176471, 1,
2.889098, 1.591362, 1.432799, 1, 0, 0.007843138, 1
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
-0.4214603, -4.415834, -7.692852, 0, -0.5, 0.5, 0.5,
-0.4214603, -4.415834, -7.692852, 1, -0.5, 0.5, 0.5,
-0.4214603, -4.415834, -7.692852, 1, 1.5, 0.5, 0.5,
-0.4214603, -4.415834, -7.692852, 0, 1.5, 0.5, 0.5
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
-4.854298, -0.1005578, -7.692852, 0, -0.5, 0.5, 0.5,
-4.854298, -0.1005578, -7.692852, 1, -0.5, 0.5, 0.5,
-4.854298, -0.1005578, -7.692852, 1, 1.5, 0.5, 0.5,
-4.854298, -0.1005578, -7.692852, 0, 1.5, 0.5, 0.5
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
-4.854298, -4.415834, -0.4014294, 0, -0.5, 0.5, 0.5,
-4.854298, -4.415834, -0.4014294, 1, -0.5, 0.5, 0.5,
-4.854298, -4.415834, -0.4014294, 1, 1.5, 0.5, 0.5,
-4.854298, -4.415834, -0.4014294, 0, 1.5, 0.5, 0.5
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
-3, -3.420001, -6.010216,
2, -3.420001, -6.010216,
-3, -3.420001, -6.010216,
-3, -3.585973, -6.290656,
-2, -3.420001, -6.010216,
-2, -3.585973, -6.290656,
-1, -3.420001, -6.010216,
-1, -3.585973, -6.290656,
0, -3.420001, -6.010216,
0, -3.585973, -6.290656,
1, -3.420001, -6.010216,
1, -3.585973, -6.290656,
2, -3.420001, -6.010216,
2, -3.585973, -6.290656
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
-3, -3.917917, -6.851534, 0, -0.5, 0.5, 0.5,
-3, -3.917917, -6.851534, 1, -0.5, 0.5, 0.5,
-3, -3.917917, -6.851534, 1, 1.5, 0.5, 0.5,
-3, -3.917917, -6.851534, 0, 1.5, 0.5, 0.5,
-2, -3.917917, -6.851534, 0, -0.5, 0.5, 0.5,
-2, -3.917917, -6.851534, 1, -0.5, 0.5, 0.5,
-2, -3.917917, -6.851534, 1, 1.5, 0.5, 0.5,
-2, -3.917917, -6.851534, 0, 1.5, 0.5, 0.5,
-1, -3.917917, -6.851534, 0, -0.5, 0.5, 0.5,
-1, -3.917917, -6.851534, 1, -0.5, 0.5, 0.5,
-1, -3.917917, -6.851534, 1, 1.5, 0.5, 0.5,
-1, -3.917917, -6.851534, 0, 1.5, 0.5, 0.5,
0, -3.917917, -6.851534, 0, -0.5, 0.5, 0.5,
0, -3.917917, -6.851534, 1, -0.5, 0.5, 0.5,
0, -3.917917, -6.851534, 1, 1.5, 0.5, 0.5,
0, -3.917917, -6.851534, 0, 1.5, 0.5, 0.5,
1, -3.917917, -6.851534, 0, -0.5, 0.5, 0.5,
1, -3.917917, -6.851534, 1, -0.5, 0.5, 0.5,
1, -3.917917, -6.851534, 1, 1.5, 0.5, 0.5,
1, -3.917917, -6.851534, 0, 1.5, 0.5, 0.5,
2, -3.917917, -6.851534, 0, -0.5, 0.5, 0.5,
2, -3.917917, -6.851534, 1, -0.5, 0.5, 0.5,
2, -3.917917, -6.851534, 1, 1.5, 0.5, 0.5,
2, -3.917917, -6.851534, 0, 1.5, 0.5, 0.5
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
-3.831336, -3, -6.010216,
-3.831336, 3, -6.010216,
-3.831336, -3, -6.010216,
-4.00183, -3, -6.290656,
-3.831336, -2, -6.010216,
-4.00183, -2, -6.290656,
-3.831336, -1, -6.010216,
-4.00183, -1, -6.290656,
-3.831336, 0, -6.010216,
-4.00183, 0, -6.290656,
-3.831336, 1, -6.010216,
-4.00183, 1, -6.290656,
-3.831336, 2, -6.010216,
-4.00183, 2, -6.290656,
-3.831336, 3, -6.010216,
-4.00183, 3, -6.290656
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
-4.342817, -3, -6.851534, 0, -0.5, 0.5, 0.5,
-4.342817, -3, -6.851534, 1, -0.5, 0.5, 0.5,
-4.342817, -3, -6.851534, 1, 1.5, 0.5, 0.5,
-4.342817, -3, -6.851534, 0, 1.5, 0.5, 0.5,
-4.342817, -2, -6.851534, 0, -0.5, 0.5, 0.5,
-4.342817, -2, -6.851534, 1, -0.5, 0.5, 0.5,
-4.342817, -2, -6.851534, 1, 1.5, 0.5, 0.5,
-4.342817, -2, -6.851534, 0, 1.5, 0.5, 0.5,
-4.342817, -1, -6.851534, 0, -0.5, 0.5, 0.5,
-4.342817, -1, -6.851534, 1, -0.5, 0.5, 0.5,
-4.342817, -1, -6.851534, 1, 1.5, 0.5, 0.5,
-4.342817, -1, -6.851534, 0, 1.5, 0.5, 0.5,
-4.342817, 0, -6.851534, 0, -0.5, 0.5, 0.5,
-4.342817, 0, -6.851534, 1, -0.5, 0.5, 0.5,
-4.342817, 0, -6.851534, 1, 1.5, 0.5, 0.5,
-4.342817, 0, -6.851534, 0, 1.5, 0.5, 0.5,
-4.342817, 1, -6.851534, 0, -0.5, 0.5, 0.5,
-4.342817, 1, -6.851534, 1, -0.5, 0.5, 0.5,
-4.342817, 1, -6.851534, 1, 1.5, 0.5, 0.5,
-4.342817, 1, -6.851534, 0, 1.5, 0.5, 0.5,
-4.342817, 2, -6.851534, 0, -0.5, 0.5, 0.5,
-4.342817, 2, -6.851534, 1, -0.5, 0.5, 0.5,
-4.342817, 2, -6.851534, 1, 1.5, 0.5, 0.5,
-4.342817, 2, -6.851534, 0, 1.5, 0.5, 0.5,
-4.342817, 3, -6.851534, 0, -0.5, 0.5, 0.5,
-4.342817, 3, -6.851534, 1, -0.5, 0.5, 0.5,
-4.342817, 3, -6.851534, 1, 1.5, 0.5, 0.5,
-4.342817, 3, -6.851534, 0, 1.5, 0.5, 0.5
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
-3.831336, -3.420001, -4,
-3.831336, -3.420001, 4,
-3.831336, -3.420001, -4,
-4.00183, -3.585973, -4,
-3.831336, -3.420001, -2,
-4.00183, -3.585973, -2,
-3.831336, -3.420001, 0,
-4.00183, -3.585973, 0,
-3.831336, -3.420001, 2,
-4.00183, -3.585973, 2,
-3.831336, -3.420001, 4,
-4.00183, -3.585973, 4
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
-4.342817, -3.917917, -4, 0, -0.5, 0.5, 0.5,
-4.342817, -3.917917, -4, 1, -0.5, 0.5, 0.5,
-4.342817, -3.917917, -4, 1, 1.5, 0.5, 0.5,
-4.342817, -3.917917, -4, 0, 1.5, 0.5, 0.5,
-4.342817, -3.917917, -2, 0, -0.5, 0.5, 0.5,
-4.342817, -3.917917, -2, 1, -0.5, 0.5, 0.5,
-4.342817, -3.917917, -2, 1, 1.5, 0.5, 0.5,
-4.342817, -3.917917, -2, 0, 1.5, 0.5, 0.5,
-4.342817, -3.917917, 0, 0, -0.5, 0.5, 0.5,
-4.342817, -3.917917, 0, 1, -0.5, 0.5, 0.5,
-4.342817, -3.917917, 0, 1, 1.5, 0.5, 0.5,
-4.342817, -3.917917, 0, 0, 1.5, 0.5, 0.5,
-4.342817, -3.917917, 2, 0, -0.5, 0.5, 0.5,
-4.342817, -3.917917, 2, 1, -0.5, 0.5, 0.5,
-4.342817, -3.917917, 2, 1, 1.5, 0.5, 0.5,
-4.342817, -3.917917, 2, 0, 1.5, 0.5, 0.5,
-4.342817, -3.917917, 4, 0, -0.5, 0.5, 0.5,
-4.342817, -3.917917, 4, 1, -0.5, 0.5, 0.5,
-4.342817, -3.917917, 4, 1, 1.5, 0.5, 0.5,
-4.342817, -3.917917, 4, 0, 1.5, 0.5, 0.5
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
-3.831336, -3.420001, -6.010216,
-3.831336, 3.218885, -6.010216,
-3.831336, -3.420001, 5.207357,
-3.831336, 3.218885, 5.207357,
-3.831336, -3.420001, -6.010216,
-3.831336, -3.420001, 5.207357,
-3.831336, 3.218885, -6.010216,
-3.831336, 3.218885, 5.207357,
-3.831336, -3.420001, -6.010216,
2.988415, -3.420001, -6.010216,
-3.831336, -3.420001, 5.207357,
2.988415, -3.420001, 5.207357,
-3.831336, 3.218885, -6.010216,
2.988415, 3.218885, -6.010216,
-3.831336, 3.218885, 5.207357,
2.988415, 3.218885, 5.207357,
2.988415, -3.420001, -6.010216,
2.988415, 3.218885, -6.010216,
2.988415, -3.420001, 5.207357,
2.988415, 3.218885, 5.207357,
2.988415, -3.420001, -6.010216,
2.988415, -3.420001, 5.207357,
2.988415, 3.218885, -6.010216,
2.988415, 3.218885, 5.207357
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
var radius = 7.855466;
var distance = 34.94985;
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
mvMatrix.translate( 0.4214603, 0.1005578, 0.4014294 );
mvMatrix.scale( 1.245424, 1.279354, 0.7571587 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.94985);
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
trinexapac-ethyl<-read.table("trinexapac-ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trinexapac-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'trinexapac' not found
```

```r
y<-trinexapac-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'trinexapac' not found
```

```r
z<-trinexapac-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'trinexapac' not found
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
-3.732019, -1.418393, -0.2405971, 0, 0, 1, 1, 1,
-3.581429, 0.135456, -1.413592, 1, 0, 0, 1, 1,
-3.383236, -0.2124372, -0.689965, 1, 0, 0, 1, 1,
-2.709098, -0.2258908, -1.856196, 1, 0, 0, 1, 1,
-2.681203, 0.5093056, -1.185876, 1, 0, 0, 1, 1,
-2.578341, 0.224509, -1.675698, 1, 0, 0, 1, 1,
-2.574085, -0.7210779, -0.8798864, 0, 0, 0, 1, 1,
-2.546622, 0.4160073, -1.024889, 0, 0, 0, 1, 1,
-2.532452, 0.6235589, -0.9044976, 0, 0, 0, 1, 1,
-2.520285, -1.213036, -1.541758, 0, 0, 0, 1, 1,
-2.424911, -0.1778874, -2.052166, 0, 0, 0, 1, 1,
-2.401819, 2.071546, -0.6531596, 0, 0, 0, 1, 1,
-2.334545, -1.412766, -1.063599, 0, 0, 0, 1, 1,
-2.26783, -0.6780508, -2.424549, 1, 1, 1, 1, 1,
-2.230094, 0.4825183, -0.7458001, 1, 1, 1, 1, 1,
-2.210036, -0.7357568, -1.693397, 1, 1, 1, 1, 1,
-2.202745, -2.222851, -2.736207, 1, 1, 1, 1, 1,
-2.119482, 0.1655596, -2.80345, 1, 1, 1, 1, 1,
-2.110976, 0.2405511, -0.6546199, 1, 1, 1, 1, 1,
-2.062645, -1.820614, -2.235543, 1, 1, 1, 1, 1,
-1.989392, 1.041661, -0.4244688, 1, 1, 1, 1, 1,
-1.958667, 1.14498, -1.459533, 1, 1, 1, 1, 1,
-1.916642, 0.08518988, -3.470295, 1, 1, 1, 1, 1,
-1.89123, -1.885008, -3.331283, 1, 1, 1, 1, 1,
-1.88911, -0.7486323, -1.604387, 1, 1, 1, 1, 1,
-1.879852, -0.4226907, -1.778482, 1, 1, 1, 1, 1,
-1.872642, -0.5494793, -0.3970523, 1, 1, 1, 1, 1,
-1.86708, -0.4967081, 0.926093, 1, 1, 1, 1, 1,
-1.837072, 0.5414844, -3.532503, 0, 0, 1, 1, 1,
-1.835634, -1.956593, -1.371534, 1, 0, 0, 1, 1,
-1.81399, -0.8724132, -1.758643, 1, 0, 0, 1, 1,
-1.812278, -0.6219665, -2.935918, 1, 0, 0, 1, 1,
-1.801863, -0.3007275, -2.752582, 1, 0, 0, 1, 1,
-1.784831, 0.1168644, -1.295446, 1, 0, 0, 1, 1,
-1.757429, -0.1834265, -2.263511, 0, 0, 0, 1, 1,
-1.751362, 1.500508, -1.33658, 0, 0, 0, 1, 1,
-1.75011, 0.3853025, -3.098436, 0, 0, 0, 1, 1,
-1.735232, -0.622421, -0.8910237, 0, 0, 0, 1, 1,
-1.719341, 0.6704141, -1.649461, 0, 0, 0, 1, 1,
-1.694651, 0.5835555, -1.669991, 0, 0, 0, 1, 1,
-1.687115, -0.1204159, -1.146532, 0, 0, 0, 1, 1,
-1.673001, 1.361542, -2.046839, 1, 1, 1, 1, 1,
-1.660017, 0.5603506, -1.871014, 1, 1, 1, 1, 1,
-1.637232, 0.08845889, -2.174197, 1, 1, 1, 1, 1,
-1.635352, 0.4582378, -1.488336, 1, 1, 1, 1, 1,
-1.626209, 0.09217665, -1.280754, 1, 1, 1, 1, 1,
-1.616043, -0.519982, -1.794579, 1, 1, 1, 1, 1,
-1.613347, -0.1154326, -1.588749, 1, 1, 1, 1, 1,
-1.611965, -0.733866, -3.360861, 1, 1, 1, 1, 1,
-1.609717, -0.3420123, -1.872085, 1, 1, 1, 1, 1,
-1.594092, 0.02160536, -3.845429, 1, 1, 1, 1, 1,
-1.590211, 0.4886409, -0.4992678, 1, 1, 1, 1, 1,
-1.543956, 0.08880236, -1.865033, 1, 1, 1, 1, 1,
-1.534078, -0.3817765, -1.692923, 1, 1, 1, 1, 1,
-1.522725, 0.02668833, -2.579811, 1, 1, 1, 1, 1,
-1.518065, 0.5792611, -2.49666, 1, 1, 1, 1, 1,
-1.517564, -0.2712771, -1.328295, 0, 0, 1, 1, 1,
-1.515531, 1.172225, -1.578727, 1, 0, 0, 1, 1,
-1.502505, 0.7946666, -2.160192, 1, 0, 0, 1, 1,
-1.501311, -1.499115, -1.382039, 1, 0, 0, 1, 1,
-1.498243, 0.1797296, -0.9522011, 1, 0, 0, 1, 1,
-1.495837, -0.1211823, -3.366528, 1, 0, 0, 1, 1,
-1.490235, 0.03964122, -2.170495, 0, 0, 0, 1, 1,
-1.485624, -0.7831964, -1.249328, 0, 0, 0, 1, 1,
-1.473117, 0.9814151, -2.418857, 0, 0, 0, 1, 1,
-1.472308, 1.924196, -2.134024, 0, 0, 0, 1, 1,
-1.451385, -1.436245, -2.403188, 0, 0, 0, 1, 1,
-1.444421, -0.4400502, -2.018089, 0, 0, 0, 1, 1,
-1.443292, 0.1294601, -3.053311, 0, 0, 0, 1, 1,
-1.435514, -0.1244858, -1.690395, 1, 1, 1, 1, 1,
-1.420209, 0.3641199, -2.276138, 1, 1, 1, 1, 1,
-1.416331, 0.06489655, -1.100919, 1, 1, 1, 1, 1,
-1.405764, 0.09694102, -3.559659, 1, 1, 1, 1, 1,
-1.403108, 0.121177, -2.061845, 1, 1, 1, 1, 1,
-1.394315, 0.5914755, -1.976894, 1, 1, 1, 1, 1,
-1.385152, -0.2530573, -0.7706301, 1, 1, 1, 1, 1,
-1.371983, 0.8292983, -0.824511, 1, 1, 1, 1, 1,
-1.360267, 1.835564, -0.7802297, 1, 1, 1, 1, 1,
-1.359542, -0.3342611, -1.341915, 1, 1, 1, 1, 1,
-1.35751, -1.321455, -3.161455, 1, 1, 1, 1, 1,
-1.351223, 0.7571188, -0.866241, 1, 1, 1, 1, 1,
-1.349444, 0.7407415, -0.3834909, 1, 1, 1, 1, 1,
-1.343252, 1.254944, -1.457005, 1, 1, 1, 1, 1,
-1.333808, 1.548969, 1.001976, 1, 1, 1, 1, 1,
-1.323819, -0.9529241, -2.689836, 0, 0, 1, 1, 1,
-1.320126, 1.30077, -1.060076, 1, 0, 0, 1, 1,
-1.320012, -0.1378102, -2.082314, 1, 0, 0, 1, 1,
-1.31286, 0.7783807, -0.07762474, 1, 0, 0, 1, 1,
-1.312512, 0.9195339, -0.04985522, 1, 0, 0, 1, 1,
-1.308133, -0.6250351, -2.144295, 1, 0, 0, 1, 1,
-1.303675, -0.5561671, -2.626687, 0, 0, 0, 1, 1,
-1.30209, 0.5152913, -0.9144882, 0, 0, 0, 1, 1,
-1.294376, -0.338264, -0.06994788, 0, 0, 0, 1, 1,
-1.289847, -0.1690242, -1.344259, 0, 0, 0, 1, 1,
-1.289333, 1.700508, -0.6655647, 0, 0, 0, 1, 1,
-1.280901, -0.557524, -2.927285, 0, 0, 0, 1, 1,
-1.277169, 1.037125, 0.4916008, 0, 0, 0, 1, 1,
-1.27146, -1.078029, -2.760369, 1, 1, 1, 1, 1,
-1.260477, 0.8218775, 0.1496394, 1, 1, 1, 1, 1,
-1.252843, -1.020969, -0.7280801, 1, 1, 1, 1, 1,
-1.250739, -1.748736, -1.719353, 1, 1, 1, 1, 1,
-1.246462, 0.9395112, -2.80037, 1, 1, 1, 1, 1,
-1.241365, -2.249084, -2.675579, 1, 1, 1, 1, 1,
-1.238917, -0.6142536, -1.242362, 1, 1, 1, 1, 1,
-1.233023, -0.6415131, -3.093401, 1, 1, 1, 1, 1,
-1.227231, -1.47225, -2.170862, 1, 1, 1, 1, 1,
-1.21913, -0.289536, -1.854716, 1, 1, 1, 1, 1,
-1.209405, -0.3082038, -3.06961, 1, 1, 1, 1, 1,
-1.203769, -0.8010631, -1.45816, 1, 1, 1, 1, 1,
-1.201888, -1.823274, -4.118037, 1, 1, 1, 1, 1,
-1.199415, 1.037184, -0.2636925, 1, 1, 1, 1, 1,
-1.19933, -1.426259, -3.027311, 1, 1, 1, 1, 1,
-1.190802, 1.286653, -0.9675392, 0, 0, 1, 1, 1,
-1.189253, -0.7162825, -2.097295, 1, 0, 0, 1, 1,
-1.188947, -1.289825, -2.403547, 1, 0, 0, 1, 1,
-1.182009, -1.287689, -1.168635, 1, 0, 0, 1, 1,
-1.17691, 0.3767118, -1.359109, 1, 0, 0, 1, 1,
-1.176187, -0.6802628, -3.616112, 1, 0, 0, 1, 1,
-1.168767, -0.08279799, -2.246978, 0, 0, 0, 1, 1,
-1.164718, -1.41932, -2.172027, 0, 0, 0, 1, 1,
-1.16294, 0.6540946, -2.378179, 0, 0, 0, 1, 1,
-1.162366, -0.178978, -0.4143171, 0, 0, 0, 1, 1,
-1.158384, -0.4074028, -3.142153, 0, 0, 0, 1, 1,
-1.146147, -0.5491031, -2.416466, 0, 0, 0, 1, 1,
-1.136249, -0.6980842, -1.070069, 0, 0, 0, 1, 1,
-1.135108, 0.280552, -2.02483, 1, 1, 1, 1, 1,
-1.133886, 0.08187865, -2.743359, 1, 1, 1, 1, 1,
-1.128983, 0.6256844, -0.7419519, 1, 1, 1, 1, 1,
-1.115907, 1.164869, -0.1450865, 1, 1, 1, 1, 1,
-1.110405, -1.141157, -1.460552, 1, 1, 1, 1, 1,
-1.107054, -0.7207828, -2.606352, 1, 1, 1, 1, 1,
-1.101859, 0.06338383, -0.7583797, 1, 1, 1, 1, 1,
-1.095075, 1.3781, -0.6856901, 1, 1, 1, 1, 1,
-1.084214, 0.4389409, -0.6176935, 1, 1, 1, 1, 1,
-1.078517, -1.27767, -3.850959, 1, 1, 1, 1, 1,
-1.078464, 0.6441757, -1.098656, 1, 1, 1, 1, 1,
-1.078144, -0.2604671, -2.511093, 1, 1, 1, 1, 1,
-1.073684, -0.756512, -3.615106, 1, 1, 1, 1, 1,
-1.071111, 1.169215, -1.321534, 1, 1, 1, 1, 1,
-1.070013, -1.164307, -2.170253, 1, 1, 1, 1, 1,
-1.067179, -0.9532082, -1.758304, 0, 0, 1, 1, 1,
-1.065267, -0.6722626, -2.488839, 1, 0, 0, 1, 1,
-1.058752, 0.2270851, -0.8006928, 1, 0, 0, 1, 1,
-1.055263, 0.6549818, 1.212657, 1, 0, 0, 1, 1,
-1.054503, -0.8783958, -1.534762, 1, 0, 0, 1, 1,
-1.050574, -0.09828824, -2.09425, 1, 0, 0, 1, 1,
-1.045219, 0.4213501, -0.007802759, 0, 0, 0, 1, 1,
-1.038321, 0.3898244, -0.7224284, 0, 0, 0, 1, 1,
-1.037792, 1.642259, 1.574514, 0, 0, 0, 1, 1,
-1.037001, 0.1394828, -2.291274, 0, 0, 0, 1, 1,
-1.024849, -0.4365114, -2.269807, 0, 0, 0, 1, 1,
-1.023257, -0.9376711, -2.879199, 0, 0, 0, 1, 1,
-1.023098, 0.5056142, -1.222905, 0, 0, 0, 1, 1,
-1.022847, 2.485095, -0.7605666, 1, 1, 1, 1, 1,
-1.019524, -1.808523, -3.383254, 1, 1, 1, 1, 1,
-1.017961, 0.174775, -1.870877, 1, 1, 1, 1, 1,
-1.014104, 0.6550968, -2.355345, 1, 1, 1, 1, 1,
-1.012303, 0.4428603, -0.4194937, 1, 1, 1, 1, 1,
-0.9980005, -1.380052, -3.284328, 1, 1, 1, 1, 1,
-0.9966148, 0.3966687, -1.215041, 1, 1, 1, 1, 1,
-0.9940332, 0.9911988, 1.608691, 1, 1, 1, 1, 1,
-0.9919339, -0.5822933, -1.011787, 1, 1, 1, 1, 1,
-0.9838308, 1.133913, 1.101418, 1, 1, 1, 1, 1,
-0.9835914, 0.5719822, -1.404185, 1, 1, 1, 1, 1,
-0.9835303, 0.2644843, -0.6157843, 1, 1, 1, 1, 1,
-0.9777416, 0.4830514, -1.449611, 1, 1, 1, 1, 1,
-0.972815, 1.378771, 1.907961, 1, 1, 1, 1, 1,
-0.9692528, 0.7961882, 0.3562468, 1, 1, 1, 1, 1,
-0.9669784, -1.297498, -1.553958, 0, 0, 1, 1, 1,
-0.9649525, 1.104965, -1.733307, 1, 0, 0, 1, 1,
-0.9601294, 0.8347955, -1.327097, 1, 0, 0, 1, 1,
-0.9503441, 0.7358322, -0.9354767, 1, 0, 0, 1, 1,
-0.9357126, 0.125301, -1.997594, 1, 0, 0, 1, 1,
-0.9286862, -0.4366268, -1.629495, 1, 0, 0, 1, 1,
-0.926931, 0.3309284, -0.5716303, 0, 0, 0, 1, 1,
-0.9207135, -0.5272332, -0.5262969, 0, 0, 0, 1, 1,
-0.9121952, 1.408193, 1.391614, 0, 0, 0, 1, 1,
-0.9110211, -0.6822761, -2.756876, 0, 0, 0, 1, 1,
-0.9103905, 2.158465, -0.8344447, 0, 0, 0, 1, 1,
-0.9097391, -0.1369434, -3.132318, 0, 0, 0, 1, 1,
-0.8955046, -0.7326986, -4.22461, 0, 0, 0, 1, 1,
-0.8913061, 1.175339, -1.557965, 1, 1, 1, 1, 1,
-0.8901975, 1.080328, -1.283874, 1, 1, 1, 1, 1,
-0.8888805, -0.6946893, -3.874732, 1, 1, 1, 1, 1,
-0.8811565, 0.5583676, 0.07596722, 1, 1, 1, 1, 1,
-0.8739038, 1.381442, -0.4697483, 1, 1, 1, 1, 1,
-0.8676364, -1.819627, -3.321095, 1, 1, 1, 1, 1,
-0.861693, 0.2733782, -0.8945267, 1, 1, 1, 1, 1,
-0.8527808, 0.07167959, -2.168634, 1, 1, 1, 1, 1,
-0.8492477, -2.981958, -2.91881, 1, 1, 1, 1, 1,
-0.8489704, 0.1205669, -1.1389, 1, 1, 1, 1, 1,
-0.843721, 2.455339, -0.1378005, 1, 1, 1, 1, 1,
-0.8431452, -0.927173, -2.435545, 1, 1, 1, 1, 1,
-0.8398781, -1.030952, -2.725116, 1, 1, 1, 1, 1,
-0.831769, -2.004096, -2.743043, 1, 1, 1, 1, 1,
-0.8300191, 0.814172, 0.6120217, 1, 1, 1, 1, 1,
-0.8289495, -0.000602418, -2.62405, 0, 0, 1, 1, 1,
-0.8176062, 0.4694983, -1.781218, 1, 0, 0, 1, 1,
-0.8105181, 1.25624, -0.8776712, 1, 0, 0, 1, 1,
-0.8082904, 0.9923668, -2.867937, 1, 0, 0, 1, 1,
-0.8066439, 0.8237511, 0.7745207, 1, 0, 0, 1, 1,
-0.804965, 1.006019, -1.511445, 1, 0, 0, 1, 1,
-0.8011135, -0.1638309, -2.661973, 0, 0, 0, 1, 1,
-0.7944517, -0.7406015, -1.925949, 0, 0, 0, 1, 1,
-0.7859525, -0.01309148, -1.649225, 0, 0, 0, 1, 1,
-0.778059, -0.5873359, -1.394806, 0, 0, 0, 1, 1,
-0.7759076, 0.6973464, -1.514699, 0, 0, 0, 1, 1,
-0.7714545, 0.178758, -1.673459, 0, 0, 0, 1, 1,
-0.7674572, -0.5714952, -1.180727, 0, 0, 0, 1, 1,
-0.7645888, -0.1500523, -1.738178, 1, 1, 1, 1, 1,
-0.7523162, -0.1333489, -1.070797, 1, 1, 1, 1, 1,
-0.7507403, 0.7747313, -0.8908524, 1, 1, 1, 1, 1,
-0.7457096, 0.2525169, -0.6571901, 1, 1, 1, 1, 1,
-0.7428476, -1.833901, -2.607862, 1, 1, 1, 1, 1,
-0.7424225, 0.000850728, -1.483927, 1, 1, 1, 1, 1,
-0.7384204, -0.8893737, -1.801093, 1, 1, 1, 1, 1,
-0.7357471, 1.952805, 0.2263919, 1, 1, 1, 1, 1,
-0.7327669, 0.8902119, -0.5632086, 1, 1, 1, 1, 1,
-0.7294338, -0.02619106, -2.738672, 1, 1, 1, 1, 1,
-0.7282691, 1.383106, 0.001009481, 1, 1, 1, 1, 1,
-0.7280818, -0.9154782, -1.046921, 1, 1, 1, 1, 1,
-0.7276872, 0.08707648, 0.5257854, 1, 1, 1, 1, 1,
-0.7267721, 0.09741578, -0.7160406, 1, 1, 1, 1, 1,
-0.7246512, 0.1380901, -2.470774, 1, 1, 1, 1, 1,
-0.7245977, 0.2445027, -2.375547, 0, 0, 1, 1, 1,
-0.7227033, 0.1276722, -2.802918, 1, 0, 0, 1, 1,
-0.7215009, 0.5479198, -0.9232643, 1, 0, 0, 1, 1,
-0.7115411, 0.2623562, -0.4510383, 1, 0, 0, 1, 1,
-0.7083496, -0.665159, -2.002885, 1, 0, 0, 1, 1,
-0.7042837, -0.029083, -1.523097, 1, 0, 0, 1, 1,
-0.698829, -0.008401452, -3.988198, 0, 0, 0, 1, 1,
-0.6985444, -1.152628, -2.946696, 0, 0, 0, 1, 1,
-0.6980423, -0.00835022, -1.038949, 0, 0, 0, 1, 1,
-0.6977939, -0.9706639, -2.053654, 0, 0, 0, 1, 1,
-0.6972908, -0.008337416, -0.3319286, 0, 0, 0, 1, 1,
-0.6871412, 0.06668194, -1.094024, 0, 0, 0, 1, 1,
-0.6870871, 0.184707, -1.06967, 0, 0, 0, 1, 1,
-0.6836215, -0.172405, -2.428547, 1, 1, 1, 1, 1,
-0.6834962, -1.301205, -2.825637, 1, 1, 1, 1, 1,
-0.67788, 0.9888616, -0.9396969, 1, 1, 1, 1, 1,
-0.6752583, -0.6945292, -3.156089, 1, 1, 1, 1, 1,
-0.6739157, -2.019639, -0.5394261, 1, 1, 1, 1, 1,
-0.6732883, -0.1538819, -1.986859, 1, 1, 1, 1, 1,
-0.6671106, 0.2632892, 0.2853956, 1, 1, 1, 1, 1,
-0.6659866, 1.561063, -0.9514015, 1, 1, 1, 1, 1,
-0.6642566, 0.3320287, -3.28489, 1, 1, 1, 1, 1,
-0.6605864, 0.2763107, -3.02133, 1, 1, 1, 1, 1,
-0.656798, -0.6563069, -4.081297, 1, 1, 1, 1, 1,
-0.6537159, -0.2603551, -1.796532, 1, 1, 1, 1, 1,
-0.6512065, 0.5023567, -1.833178, 1, 1, 1, 1, 1,
-0.6496458, -0.7259387, -4.145965, 1, 1, 1, 1, 1,
-0.6437613, 0.2334713, -0.3083453, 1, 1, 1, 1, 1,
-0.6399046, -0.05984303, -2.786182, 0, 0, 1, 1, 1,
-0.635511, -0.2171998, -1.00913, 1, 0, 0, 1, 1,
-0.6309356, -0.6043784, -4.85367, 1, 0, 0, 1, 1,
-0.6284949, 1.149808, -1.539394, 1, 0, 0, 1, 1,
-0.6284633, -0.379353, -0.8148031, 1, 0, 0, 1, 1,
-0.6280165, -0.7792871, -2.79102, 1, 0, 0, 1, 1,
-0.623418, -0.6570805, -1.549573, 0, 0, 0, 1, 1,
-0.623041, -1.048989, -2.794891, 0, 0, 0, 1, 1,
-0.6213518, 1.552089, -0.3766149, 0, 0, 0, 1, 1,
-0.615258, -2.393997, -3.17484, 0, 0, 0, 1, 1,
-0.6145902, 0.008967603, -1.078964, 0, 0, 0, 1, 1,
-0.6145018, 0.310868, -2.340696, 0, 0, 0, 1, 1,
-0.6096879, 0.2944855, -0.9160292, 0, 0, 0, 1, 1,
-0.6096604, -0.3206112, -2.605994, 1, 1, 1, 1, 1,
-0.6051184, 1.846901, -1.609061, 1, 1, 1, 1, 1,
-0.6001994, -1.401598, -1.788818, 1, 1, 1, 1, 1,
-0.597091, -0.04618059, -1.31579, 1, 1, 1, 1, 1,
-0.5958274, -1.391842, -1.669014, 1, 1, 1, 1, 1,
-0.5918974, -0.8187506, -2.882467, 1, 1, 1, 1, 1,
-0.5862042, 1.061961, 0.6263202, 1, 1, 1, 1, 1,
-0.5844321, 0.5089034, -2.555285, 1, 1, 1, 1, 1,
-0.5843023, 0.4220568, -1.622528, 1, 1, 1, 1, 1,
-0.5794351, -0.4172735, -2.997068, 1, 1, 1, 1, 1,
-0.578924, 2.421384, -0.2037271, 1, 1, 1, 1, 1,
-0.5743461, -1.739998, -3.366334, 1, 1, 1, 1, 1,
-0.5714869, -0.5816073, -1.978675, 1, 1, 1, 1, 1,
-0.570415, -0.3971176, -2.173409, 1, 1, 1, 1, 1,
-0.5696409, -1.640634, -0.8952636, 1, 1, 1, 1, 1,
-0.5375955, 1.368746, -0.2700777, 0, 0, 1, 1, 1,
-0.5370807, 0.4466432, -0.3494471, 1, 0, 0, 1, 1,
-0.5300179, -1.042452, -2.177443, 1, 0, 0, 1, 1,
-0.5251949, -0.5142964, -1.144546, 1, 0, 0, 1, 1,
-0.5248755, 0.3987412, -0.7900059, 1, 0, 0, 1, 1,
-0.5234054, 0.05415225, -1.08703, 1, 0, 0, 1, 1,
-0.5221286, -0.2466242, -2.024269, 0, 0, 0, 1, 1,
-0.5125683, -3.323318, -0.5071876, 0, 0, 0, 1, 1,
-0.5096375, -1.112855, -3.097434, 0, 0, 0, 1, 1,
-0.5064795, 0.1673547, -2.209612, 0, 0, 0, 1, 1,
-0.504235, -1.689345, -5.846854, 0, 0, 0, 1, 1,
-0.5028501, 1.303435, -0.9341976, 0, 0, 0, 1, 1,
-0.5000892, -1.554804, -5.53997, 0, 0, 0, 1, 1,
-0.4995566, 0.566331, 0.05760314, 1, 1, 1, 1, 1,
-0.4980824, 1.047213, -0.6702517, 1, 1, 1, 1, 1,
-0.4967338, -1.083012, -3.78618, 1, 1, 1, 1, 1,
-0.4962258, 0.7532201, -1.700489, 1, 1, 1, 1, 1,
-0.4869433, -0.1309199, -1.860254, 1, 1, 1, 1, 1,
-0.4862204, 0.4935426, -1.519904, 1, 1, 1, 1, 1,
-0.4766124, 0.4876553, -0.656137, 1, 1, 1, 1, 1,
-0.4724565, -0.04079293, -1.351443, 1, 1, 1, 1, 1,
-0.4659747, 1.131181, 2.179556, 1, 1, 1, 1, 1,
-0.4624751, -0.7974946, -1.371117, 1, 1, 1, 1, 1,
-0.4603072, 0.4159392, -0.5045923, 1, 1, 1, 1, 1,
-0.4551686, -0.8148119, -2.102993, 1, 1, 1, 1, 1,
-0.454979, -0.3371636, -1.597986, 1, 1, 1, 1, 1,
-0.4524509, 0.3791806, -3.454221, 1, 1, 1, 1, 1,
-0.4501635, 1.580332, -1.122921, 1, 1, 1, 1, 1,
-0.4489497, 1.359699, -0.9641615, 0, 0, 1, 1, 1,
-0.4440855, -0.3469426, -2.047674, 1, 0, 0, 1, 1,
-0.443772, 1.951393, 0.02108266, 1, 0, 0, 1, 1,
-0.4399793, -0.5783563, -0.9328846, 1, 0, 0, 1, 1,
-0.4385703, 1.029124, 0.1934273, 1, 0, 0, 1, 1,
-0.4364055, -1.763904, -3.222511, 1, 0, 0, 1, 1,
-0.4363049, 0.7592649, -1.890255, 0, 0, 0, 1, 1,
-0.433982, -2.166383, -2.91943, 0, 0, 0, 1, 1,
-0.4326046, 0.09430421, -0.7100363, 0, 0, 0, 1, 1,
-0.4279754, -0.005933815, -1.659108, 0, 0, 0, 1, 1,
-0.4260693, 0.6276987, 0.2552575, 0, 0, 0, 1, 1,
-0.4249028, -0.2229774, -4.467651, 0, 0, 0, 1, 1,
-0.4235384, -0.6127901, -1.525845, 0, 0, 0, 1, 1,
-0.4201239, -0.07299529, -3.942173, 1, 1, 1, 1, 1,
-0.4180548, -0.8977875, -3.114829, 1, 1, 1, 1, 1,
-0.4157955, -0.2090007, -2.20998, 1, 1, 1, 1, 1,
-0.4127931, 0.7912636, -0.8385506, 1, 1, 1, 1, 1,
-0.4104537, 0.637578, -1.447719, 1, 1, 1, 1, 1,
-0.4103741, -0.3853611, -2.62245, 1, 1, 1, 1, 1,
-0.4088916, 0.1464671, -1.353112, 1, 1, 1, 1, 1,
-0.4077269, -0.4685779, -2.372755, 1, 1, 1, 1, 1,
-0.4057963, -1.184191, -2.336347, 1, 1, 1, 1, 1,
-0.4056557, 0.6673021, -1.116739, 1, 1, 1, 1, 1,
-0.405, 0.4356325, -0.07895698, 1, 1, 1, 1, 1,
-0.4010921, -0.4172973, -1.382292, 1, 1, 1, 1, 1,
-0.3969598, 0.2749142, -2.216584, 1, 1, 1, 1, 1,
-0.3936746, -0.6239619, -1.980995, 1, 1, 1, 1, 1,
-0.3906141, -0.9622492, -3.269303, 1, 1, 1, 1, 1,
-0.387872, -0.1554303, -1.462306, 0, 0, 1, 1, 1,
-0.3866351, -0.98892, -3.17767, 1, 0, 0, 1, 1,
-0.3865381, -0.875785, -3.384398, 1, 0, 0, 1, 1,
-0.3861806, -0.7402264, -2.666779, 1, 0, 0, 1, 1,
-0.3843426, 1.129667, -1.231236, 1, 0, 0, 1, 1,
-0.3842536, 0.2418629, -1.67955, 1, 0, 0, 1, 1,
-0.3824989, 2.038266, 1.155486, 0, 0, 0, 1, 1,
-0.382059, -0.1393217, -0.7212156, 0, 0, 0, 1, 1,
-0.3818254, -1.78564, -3.030055, 0, 0, 0, 1, 1,
-0.3781076, 0.00471974, -0.9598126, 0, 0, 0, 1, 1,
-0.3775486, -0.3925297, -2.369786, 0, 0, 0, 1, 1,
-0.3759054, -0.1454924, -3.237441, 0, 0, 0, 1, 1,
-0.3755736, -0.483349, -2.209759, 0, 0, 0, 1, 1,
-0.3748031, 0.9210154, 1.252969, 1, 1, 1, 1, 1,
-0.3739505, 1.287075, 0.3436523, 1, 1, 1, 1, 1,
-0.3700984, -0.7943213, -2.454954, 1, 1, 1, 1, 1,
-0.3671308, 0.06136854, 1.096569, 1, 1, 1, 1, 1,
-0.365679, -1.199873, -2.932739, 1, 1, 1, 1, 1,
-0.3653591, -0.7870618, -4.174611, 1, 1, 1, 1, 1,
-0.364653, -1.239272, -3.85532, 1, 1, 1, 1, 1,
-0.3644871, -0.4243627, -2.091367, 1, 1, 1, 1, 1,
-0.3628431, 0.1892423, -1.686156, 1, 1, 1, 1, 1,
-0.3616568, -2.011457, -2.299282, 1, 1, 1, 1, 1,
-0.3608913, -0.1684516, -0.3625684, 1, 1, 1, 1, 1,
-0.3532258, 1.454863, -0.6540629, 1, 1, 1, 1, 1,
-0.3504521, 0.2841779, -1.015104, 1, 1, 1, 1, 1,
-0.3500139, -0.5783565, -2.633204, 1, 1, 1, 1, 1,
-0.349362, -0.0568208, -0.6604772, 1, 1, 1, 1, 1,
-0.3485146, 1.290704, -0.8604743, 0, 0, 1, 1, 1,
-0.3463665, 0.3899803, -1.896036, 1, 0, 0, 1, 1,
-0.3461039, -1.426672, -1.901845, 1, 0, 0, 1, 1,
-0.3453678, -0.8439054, -2.604154, 1, 0, 0, 1, 1,
-0.3444079, -1.810107, -2.693473, 1, 0, 0, 1, 1,
-0.3431741, -1.747695, -2.939495, 1, 0, 0, 1, 1,
-0.338175, -0.02202707, -3.340531, 0, 0, 0, 1, 1,
-0.3318051, -0.6609808, -3.075362, 0, 0, 0, 1, 1,
-0.3313479, 0.1112369, -0.458897, 0, 0, 0, 1, 1,
-0.3296487, 0.01109566, -0.4495661, 0, 0, 0, 1, 1,
-0.3287227, 0.358764, -0.8192794, 0, 0, 0, 1, 1,
-0.3279799, 0.2270074, 1.302461, 0, 0, 0, 1, 1,
-0.3262366, 0.4456276, -1.560395, 0, 0, 0, 1, 1,
-0.3216748, -0.08057044, -1.743505, 1, 1, 1, 1, 1,
-0.3204795, -0.7264103, -2.850993, 1, 1, 1, 1, 1,
-0.3170131, -1.356767, -2.368353, 1, 1, 1, 1, 1,
-0.315202, 0.5538335, -0.2994924, 1, 1, 1, 1, 1,
-0.3144588, -1.810441, -3.489752, 1, 1, 1, 1, 1,
-0.3098921, 0.840492, 0.8355414, 1, 1, 1, 1, 1,
-0.3094385, -2.25592, -2.791802, 1, 1, 1, 1, 1,
-0.3068464, -0.1840783, -1.371204, 1, 1, 1, 1, 1,
-0.3064637, -1.306544, -1.628193, 1, 1, 1, 1, 1,
-0.2924381, -0.8090049, -1.914217, 1, 1, 1, 1, 1,
-0.2902498, 1.021027, -0.3126439, 1, 1, 1, 1, 1,
-0.2878161, -1.128243, -3.523794, 1, 1, 1, 1, 1,
-0.2875689, 1.60843, -0.1953333, 1, 1, 1, 1, 1,
-0.2867988, -0.6561025, -3.164064, 1, 1, 1, 1, 1,
-0.2857938, 0.1722239, -0.4767242, 1, 1, 1, 1, 1,
-0.2774057, 1.51869, -0.2498254, 0, 0, 1, 1, 1,
-0.2750295, -0.2645087, -3.900525, 1, 0, 0, 1, 1,
-0.2661689, 0.1619717, -1.247441, 1, 0, 0, 1, 1,
-0.2659785, -0.08734631, -2.573516, 1, 0, 0, 1, 1,
-0.2649663, 1.328883, 0.1932227, 1, 0, 0, 1, 1,
-0.2617971, -0.1528583, 0.4507914, 1, 0, 0, 1, 1,
-0.2608849, 1.284526, -0.09754934, 0, 0, 0, 1, 1,
-0.2604882, -1.412762, -4.014339, 0, 0, 0, 1, 1,
-0.2604766, 1.122245, -1.871705, 0, 0, 0, 1, 1,
-0.2592752, 1.547509, 0.06401505, 0, 0, 0, 1, 1,
-0.258654, -0.8665683, -2.380088, 0, 0, 0, 1, 1,
-0.2533146, 1.856907, 2.292427, 0, 0, 0, 1, 1,
-0.2532908, 0.4002907, -1.292434, 0, 0, 0, 1, 1,
-0.2526047, -1.422691, -3.849256, 1, 1, 1, 1, 1,
-0.2514491, -0.7111931, -3.019319, 1, 1, 1, 1, 1,
-0.2506322, 0.6756787, -1.259368, 1, 1, 1, 1, 1,
-0.2498491, -1.133436, -3.232448, 1, 1, 1, 1, 1,
-0.2489185, 1.551563, 1.137853, 1, 1, 1, 1, 1,
-0.2403754, 0.5046359, 1.808672, 1, 1, 1, 1, 1,
-0.2323102, 0.368109, -0.7185712, 1, 1, 1, 1, 1,
-0.2269506, -0.8060735, -2.665178, 1, 1, 1, 1, 1,
-0.226735, 0.5468901, 0.8160403, 1, 1, 1, 1, 1,
-0.2245925, -0.3349057, -1.841491, 1, 1, 1, 1, 1,
-0.2245408, 0.5322517, -0.08671228, 1, 1, 1, 1, 1,
-0.2203265, -0.380412, -3.898965, 1, 1, 1, 1, 1,
-0.2177943, 0.3257789, -2.024047, 1, 1, 1, 1, 1,
-0.2174523, 1.4473, 2.695091, 1, 1, 1, 1, 1,
-0.2168597, 0.435487, -1.072604, 1, 1, 1, 1, 1,
-0.2128597, -0.4347961, -1.425009, 0, 0, 1, 1, 1,
-0.2101315, 0.09722443, -0.1849413, 1, 0, 0, 1, 1,
-0.2088833, -1.180644, -3.6658, 1, 0, 0, 1, 1,
-0.2049146, -0.9652436, -2.606704, 1, 0, 0, 1, 1,
-0.2023237, -0.00118121, -1.304644, 1, 0, 0, 1, 1,
-0.1997729, 0.2191227, 0.4219925, 1, 0, 0, 1, 1,
-0.1979234, 0.5999483, -0.2898382, 0, 0, 0, 1, 1,
-0.191448, -0.6070749, -0.868552, 0, 0, 0, 1, 1,
-0.1900986, -0.7228296, -1.811804, 0, 0, 0, 1, 1,
-0.1897246, -0.2991701, -4.80781, 0, 0, 0, 1, 1,
-0.1876932, -0.5035532, -2.707568, 0, 0, 0, 1, 1,
-0.1841432, -2.131313, -3.093282, 0, 0, 0, 1, 1,
-0.1779271, 0.6920581, 0.02972977, 0, 0, 0, 1, 1,
-0.1751831, 0.7826568, -0.2331387, 1, 1, 1, 1, 1,
-0.174839, 0.2510734, -2.061273, 1, 1, 1, 1, 1,
-0.1596735, 1.067074, 0.7246007, 1, 1, 1, 1, 1,
-0.1545486, 0.1829644, 0.6241723, 1, 1, 1, 1, 1,
-0.1521518, -0.4703685, -3.365907, 1, 1, 1, 1, 1,
-0.1505022, 0.1933808, -0.06213063, 1, 1, 1, 1, 1,
-0.1444509, 0.8473641, -0.4619694, 1, 1, 1, 1, 1,
-0.1435205, -0.8178532, -2.847292, 1, 1, 1, 1, 1,
-0.1417993, 2.337447, 1.103241, 1, 1, 1, 1, 1,
-0.1369365, 0.7317219, -0.1762288, 1, 1, 1, 1, 1,
-0.1367472, -0.1274102, -1.334023, 1, 1, 1, 1, 1,
-0.1320353, -1.202149, -3.374603, 1, 1, 1, 1, 1,
-0.1319722, -0.3357781, -2.843885, 1, 1, 1, 1, 1,
-0.1261523, -0.2350116, -1.651559, 1, 1, 1, 1, 1,
-0.1203071, -0.6774061, -1.894989, 1, 1, 1, 1, 1,
-0.120006, 1.569445, 0.464125, 0, 0, 1, 1, 1,
-0.1199095, 0.7592389, -0.9217265, 1, 0, 0, 1, 1,
-0.1166566, -0.1846558, -2.835482, 1, 0, 0, 1, 1,
-0.1165283, 0.158022, -0.01859619, 1, 0, 0, 1, 1,
-0.1130724, 0.4761516, 0.853811, 1, 0, 0, 1, 1,
-0.1125965, -0.5745289, -3.980552, 1, 0, 0, 1, 1,
-0.1125489, 0.4751307, 1.134734, 0, 0, 0, 1, 1,
-0.1118045, 0.9527628, 0.722196, 0, 0, 0, 1, 1,
-0.1116649, 1.194054, -1.618303, 0, 0, 0, 1, 1,
-0.1116148, -0.2333233, -2.723311, 0, 0, 0, 1, 1,
-0.1097757, 0.6703338, -1.682407, 0, 0, 0, 1, 1,
-0.1034251, 0.3252426, -1.43294, 0, 0, 0, 1, 1,
-0.09823561, 0.3086872, 0.1550583, 0, 0, 0, 1, 1,
-0.09660201, 1.241073, -0.06465098, 1, 1, 1, 1, 1,
-0.09470288, -1.19091, -2.395735, 1, 1, 1, 1, 1,
-0.09419832, 1.160258, -0.3936567, 1, 1, 1, 1, 1,
-0.09219183, 0.07306121, -0.3832135, 1, 1, 1, 1, 1,
-0.09153318, 0.2520265, 1.56624, 1, 1, 1, 1, 1,
-0.08854692, 0.4659111, 0.8774033, 1, 1, 1, 1, 1,
-0.08681966, 0.3096743, -0.4830621, 1, 1, 1, 1, 1,
-0.08041483, -1.488246, -2.812973, 1, 1, 1, 1, 1,
-0.07959837, 0.8464165, 1.480655, 1, 1, 1, 1, 1,
-0.0728807, 0.7536328, -0.07849704, 1, 1, 1, 1, 1,
-0.06486309, 2.581114, 2.296031, 1, 1, 1, 1, 1,
-0.06436712, 0.6020676, -0.7057132, 1, 1, 1, 1, 1,
-0.06355193, -0.3494222, -2.974076, 1, 1, 1, 1, 1,
-0.06351444, -0.3046323, -2.257456, 1, 1, 1, 1, 1,
-0.06210244, 0.9223542, -1.659411, 1, 1, 1, 1, 1,
-0.06122867, -0.3537762, -1.556512, 0, 0, 1, 1, 1,
-0.05603305, 1.762011, -1.139209, 1, 0, 0, 1, 1,
-0.05494066, 0.1888132, -1.015173, 1, 0, 0, 1, 1,
-0.05442328, -0.3965285, -2.416421, 1, 0, 0, 1, 1,
-0.05394114, -1.048686, -2.526053, 1, 0, 0, 1, 1,
-0.05368345, -0.0416491, -4.431148, 1, 0, 0, 1, 1,
-0.04989577, 0.1335814, 0.0647564, 0, 0, 0, 1, 1,
-0.04948707, 0.6061501, 0.890745, 0, 0, 0, 1, 1,
-0.04884606, -0.7038524, -1.190263, 0, 0, 0, 1, 1,
-0.04769779, -1.120103, -2.593058, 0, 0, 0, 1, 1,
-0.0439882, 1.638952, -0.4064648, 0, 0, 0, 1, 1,
-0.04120777, -0.5472475, -3.63037, 0, 0, 0, 1, 1,
-0.03499194, 0.2973959, -0.08605773, 0, 0, 0, 1, 1,
-0.0311836, 1.455186, -1.054966, 1, 1, 1, 1, 1,
-0.03037906, -0.3614519, -1.242018, 1, 1, 1, 1, 1,
-0.03029061, -0.515713, -2.834018, 1, 1, 1, 1, 1,
-0.02512795, 0.1091669, -3.071721, 1, 1, 1, 1, 1,
-0.0228736, 0.03634499, 1.532214, 1, 1, 1, 1, 1,
-0.02197544, 0.2273745, -1.183695, 1, 1, 1, 1, 1,
-0.01848483, 0.5780787, 0.2020025, 1, 1, 1, 1, 1,
-0.01221437, 0.6428681, 0.5095726, 1, 1, 1, 1, 1,
-0.008075051, -0.02273309, -2.238032, 1, 1, 1, 1, 1,
-0.004943293, 1.000372, 1.895366, 1, 1, 1, 1, 1,
-0.001063214, 0.2068645, -0.2958526, 1, 1, 1, 1, 1,
-0.0009394696, 0.7190964, -2.389916, 1, 1, 1, 1, 1,
0.001041532, -1.515823, 2.261972, 1, 1, 1, 1, 1,
0.001154186, 0.7690492, -1.500991, 1, 1, 1, 1, 1,
0.001608464, -0.8021181, 2.288612, 1, 1, 1, 1, 1,
0.001830804, -0.3202245, 2.972246, 0, 0, 1, 1, 1,
0.002374423, 0.6556757, -0.5542853, 1, 0, 0, 1, 1,
0.006593696, 3.122203, 0.7597082, 1, 0, 0, 1, 1,
0.01024377, -1.308096, 3.992392, 1, 0, 0, 1, 1,
0.0121288, -1.293668, 3.292662, 1, 0, 0, 1, 1,
0.0132185, -1.289404, 3.357457, 1, 0, 0, 1, 1,
0.01527608, 0.2829939, -1.01442, 0, 0, 0, 1, 1,
0.01598617, -0.02996888, 2.452274, 0, 0, 0, 1, 1,
0.01771354, 1.706544, 0.3438791, 0, 0, 0, 1, 1,
0.01922823, 0.04545506, -0.0668243, 0, 0, 0, 1, 1,
0.02549973, -0.9744581, 2.358311, 0, 0, 0, 1, 1,
0.0273514, 0.5239192, -1.003737, 0, 0, 0, 1, 1,
0.03118304, -2.275258, 3.94175, 0, 0, 0, 1, 1,
0.03164638, -0.504618, 2.738658, 1, 1, 1, 1, 1,
0.03621105, 1.036854, -0.8979717, 1, 1, 1, 1, 1,
0.03871659, 0.3169299, -0.6828203, 1, 1, 1, 1, 1,
0.0483435, -0.02621445, 0.7069333, 1, 1, 1, 1, 1,
0.05288387, 1.713095, 0.4399752, 1, 1, 1, 1, 1,
0.05418015, 0.9095063, -0.4139048, 1, 1, 1, 1, 1,
0.05535669, -0.1095299, 3.326344, 1, 1, 1, 1, 1,
0.05887853, 0.5927348, 0.2878041, 1, 1, 1, 1, 1,
0.06166355, 0.1734264, 1.212343, 1, 1, 1, 1, 1,
0.06285782, -0.6620408, 2.570867, 1, 1, 1, 1, 1,
0.06327419, 1.062976, 0.6659566, 1, 1, 1, 1, 1,
0.06828161, -0.006319286, 0.4331522, 1, 1, 1, 1, 1,
0.06891565, 0.1857442, 2.126241, 1, 1, 1, 1, 1,
0.07492924, -0.6007916, 2.15651, 1, 1, 1, 1, 1,
0.08237204, 0.9203089, 0.002353828, 1, 1, 1, 1, 1,
0.08987729, 0.7340606, -0.02624048, 0, 0, 1, 1, 1,
0.09076318, 0.8247312, 0.1767558, 1, 0, 0, 1, 1,
0.09100273, 0.8577091, 1.554433, 1, 0, 0, 1, 1,
0.09123712, 0.6138356, 1.775724, 1, 0, 0, 1, 1,
0.09320834, -0.4632904, 2.201236, 1, 0, 0, 1, 1,
0.09551197, 0.3183771, -0.03507537, 1, 0, 0, 1, 1,
0.09583186, -1.102313, 4.633532, 0, 0, 0, 1, 1,
0.09845249, -1.511148, 4.158137, 0, 0, 0, 1, 1,
0.1105844, 0.1310093, -1.980241, 0, 0, 0, 1, 1,
0.1108683, -1.145869, 3.092797, 0, 0, 0, 1, 1,
0.1139003, 0.1516736, 1.824127, 0, 0, 0, 1, 1,
0.1197046, -0.5470633, 3.119818, 0, 0, 0, 1, 1,
0.1214661, 0.1460245, -0.515177, 0, 0, 0, 1, 1,
0.1225707, -0.7669644, 1.717821, 1, 1, 1, 1, 1,
0.1227911, 0.1055781, 1.386713, 1, 1, 1, 1, 1,
0.1228902, -0.07444597, 3.023844, 1, 1, 1, 1, 1,
0.1239029, -0.496538, 2.839833, 1, 1, 1, 1, 1,
0.1251554, 0.2202294, -0.09095389, 1, 1, 1, 1, 1,
0.1251786, -1.062029, 2.496303, 1, 1, 1, 1, 1,
0.1280196, 0.5006921, -0.6049062, 1, 1, 1, 1, 1,
0.1326424, 0.3385285, 0.7831191, 1, 1, 1, 1, 1,
0.1569783, 1.430288, -0.0830353, 1, 1, 1, 1, 1,
0.1572071, -0.5856694, 3.926935, 1, 1, 1, 1, 1,
0.1594169, 1.597464, -1.228069, 1, 1, 1, 1, 1,
0.159491, 1.324229, 0.02125642, 1, 1, 1, 1, 1,
0.1644437, -2.147558, 2.505669, 1, 1, 1, 1, 1,
0.1647607, 0.7336568, 1.243847, 1, 1, 1, 1, 1,
0.1661464, -0.2454919, 3.323732, 1, 1, 1, 1, 1,
0.166512, 0.6550467, 1.543261, 0, 0, 1, 1, 1,
0.1669046, -0.9886964, 4.217593, 1, 0, 0, 1, 1,
0.1697808, -0.4457309, 1.521636, 1, 0, 0, 1, 1,
0.1726696, 0.4448957, 0.5034239, 1, 0, 0, 1, 1,
0.1767783, 1.435931, 1.089103, 1, 0, 0, 1, 1,
0.1776564, -0.9665941, 2.466326, 1, 0, 0, 1, 1,
0.1845657, -1.904992, 3.632863, 0, 0, 0, 1, 1,
0.1872432, 0.0812795, 0.8912286, 0, 0, 0, 1, 1,
0.1886181, -0.590533, 2.606503, 0, 0, 0, 1, 1,
0.1941465, 0.4623151, -0.05745885, 0, 0, 0, 1, 1,
0.1985633, -0.7573209, 3.345233, 0, 0, 0, 1, 1,
0.2080182, -0.923681, 1.68003, 0, 0, 0, 1, 1,
0.2088863, -1.067602, 2.276906, 0, 0, 0, 1, 1,
0.2103347, 1.578131, -1.394485, 1, 1, 1, 1, 1,
0.2118495, 0.2281358, 1.569885, 1, 1, 1, 1, 1,
0.2119018, 0.05252595, 1.3767, 1, 1, 1, 1, 1,
0.2165495, -2.957896, 4.056394, 1, 1, 1, 1, 1,
0.2172177, -0.519791, 3.27465, 1, 1, 1, 1, 1,
0.2189147, -1.712041, 3.065237, 1, 1, 1, 1, 1,
0.2211809, 0.1075307, -0.3824623, 1, 1, 1, 1, 1,
0.2245303, 1.407451, -1.353476, 1, 1, 1, 1, 1,
0.2294054, -0.05503644, 1.53899, 1, 1, 1, 1, 1,
0.231051, 0.416729, 1.423063, 1, 1, 1, 1, 1,
0.2322053, -0.6791868, 2.733365, 1, 1, 1, 1, 1,
0.2336884, -0.7986714, 1.984373, 1, 1, 1, 1, 1,
0.2348624, 0.5497978, 1.638138, 1, 1, 1, 1, 1,
0.2358836, -1.049429, 0.8684778, 1, 1, 1, 1, 1,
0.2387552, -1.258189, 2.943899, 1, 1, 1, 1, 1,
0.2402428, 0.9960964, -0.6475838, 0, 0, 1, 1, 1,
0.2445011, -1.412178, 3.487407, 1, 0, 0, 1, 1,
0.2453233, -2.185072, 2.980289, 1, 0, 0, 1, 1,
0.2470495, -0.3387884, 3.436355, 1, 0, 0, 1, 1,
0.2531079, 1.766993, -0.04203681, 1, 0, 0, 1, 1,
0.2570218, 1.684034, 1.55069, 1, 0, 0, 1, 1,
0.2578008, -0.4674493, 2.130352, 0, 0, 0, 1, 1,
0.258352, 0.648298, 0.08310562, 0, 0, 0, 1, 1,
0.2583652, 1.164586, -0.5191333, 0, 0, 0, 1, 1,
0.2585266, -0.3428002, 1.158526, 0, 0, 0, 1, 1,
0.2606635, -0.2027759, 0.8336882, 0, 0, 0, 1, 1,
0.2645404, -0.5111502, 2.163256, 0, 0, 0, 1, 1,
0.2669894, -1.158195, 2.951917, 0, 0, 0, 1, 1,
0.2695174, -1.607491, 5.043995, 1, 1, 1, 1, 1,
0.269713, -0.7044376, 3.709109, 1, 1, 1, 1, 1,
0.2700175, -0.5140557, 2.411457, 1, 1, 1, 1, 1,
0.2712941, 1.609153, 2.305699, 1, 1, 1, 1, 1,
0.2731165, -1.204958, 4.637747, 1, 1, 1, 1, 1,
0.2752265, 0.7395148, -0.8757736, 1, 1, 1, 1, 1,
0.2809861, -0.3123762, 1.069244, 1, 1, 1, 1, 1,
0.2960185, -2.119477, 3.742399, 1, 1, 1, 1, 1,
0.2960546, 0.3798047, 0.7666454, 1, 1, 1, 1, 1,
0.3001522, 0.8916497, 1.026621, 1, 1, 1, 1, 1,
0.3007306, -0.2417645, 1.608574, 1, 1, 1, 1, 1,
0.3035446, -0.3809534, 2.859857, 1, 1, 1, 1, 1,
0.3059855, 1.378824, -0.8625288, 1, 1, 1, 1, 1,
0.3062014, 1.806965, -0.5439004, 1, 1, 1, 1, 1,
0.3087428, 1.015655, 0.7060639, 1, 1, 1, 1, 1,
0.3104764, 1.152146, 1.14725, 0, 0, 1, 1, 1,
0.3138538, -0.2530761, 1.970666, 1, 0, 0, 1, 1,
0.323138, -0.7690693, 2.824901, 1, 0, 0, 1, 1,
0.3252238, -0.4539343, 4.582392, 1, 0, 0, 1, 1,
0.3273087, -0.1105893, 1.768214, 1, 0, 0, 1, 1,
0.3304112, 0.1198858, 0.9542052, 1, 0, 0, 1, 1,
0.330932, -0.5672072, 3.283666, 0, 0, 0, 1, 1,
0.3339009, -1.469587, 0.4619149, 0, 0, 0, 1, 1,
0.3373071, -0.5808198, 3.787575, 0, 0, 0, 1, 1,
0.3382553, -0.3287993, 1.311778, 0, 0, 0, 1, 1,
0.3443383, -0.7895501, 3.052587, 0, 0, 0, 1, 1,
0.3471702, 0.05582501, -0.7242466, 0, 0, 0, 1, 1,
0.3479418, -0.09276683, 2.171653, 0, 0, 0, 1, 1,
0.3563931, 0.1807618, 1.675742, 1, 1, 1, 1, 1,
0.3581068, 0.3548136, 0.6923128, 1, 1, 1, 1, 1,
0.3584495, 0.658987, 0.01017868, 1, 1, 1, 1, 1,
0.3592588, -0.04472066, 1.395989, 1, 1, 1, 1, 1,
0.3615689, 0.3645809, 1.905529, 1, 1, 1, 1, 1,
0.3631065, 1.346385, 0.2615902, 1, 1, 1, 1, 1,
0.3654235, 1.232557, 0.4327095, 1, 1, 1, 1, 1,
0.366306, 0.1579819, 0.7142351, 1, 1, 1, 1, 1,
0.3694208, 0.1666391, 0.2463254, 1, 1, 1, 1, 1,
0.3725583, -0.6054576, 1.494857, 1, 1, 1, 1, 1,
0.372921, 0.4179041, 1.530556, 1, 1, 1, 1, 1,
0.3832293, -0.2995203, 3.246996, 1, 1, 1, 1, 1,
0.3832837, -1.245591, 2.777805, 1, 1, 1, 1, 1,
0.3914238, -0.4593823, 1.922747, 1, 1, 1, 1, 1,
0.3918833, 0.5666673, 1.09506, 1, 1, 1, 1, 1,
0.3921434, 0.2130331, 3.982298, 0, 0, 1, 1, 1,
0.395458, 0.01770425, 2.819968, 1, 0, 0, 1, 1,
0.4021067, -0.6170739, 2.43267, 1, 0, 0, 1, 1,
0.4034517, -1.993194, 3.657289, 1, 0, 0, 1, 1,
0.410242, -0.8271798, 3.278437, 1, 0, 0, 1, 1,
0.4117216, -1.917338, 2.267394, 1, 0, 0, 1, 1,
0.4140445, -0.5893508, 2.951608, 0, 0, 0, 1, 1,
0.4190138, 0.8078019, 0.1846096, 0, 0, 0, 1, 1,
0.4301222, 0.2984092, 0.1980802, 0, 0, 0, 1, 1,
0.4335939, -0.005339053, 1.21289, 0, 0, 0, 1, 1,
0.4357933, -0.3901719, 2.704982, 0, 0, 0, 1, 1,
0.4368947, 1.849992, 0.7861761, 0, 0, 0, 1, 1,
0.4480776, 1.315642, -0.4340068, 0, 0, 0, 1, 1,
0.4539686, 0.3934158, 0.3217343, 1, 1, 1, 1, 1,
0.4545953, -0.4677104, 1.938309, 1, 1, 1, 1, 1,
0.4581201, 0.3192842, 1.354323, 1, 1, 1, 1, 1,
0.4623576, 1.735792, 0.4384225, 1, 1, 1, 1, 1,
0.4637127, -1.483768, 1.625128, 1, 1, 1, 1, 1,
0.4656721, 0.2416176, 0.881461, 1, 1, 1, 1, 1,
0.4704758, -0.6022019, 1.474756, 1, 1, 1, 1, 1,
0.473904, -0.2127713, 2.595521, 1, 1, 1, 1, 1,
0.4817214, -0.2841112, 1.39316, 1, 1, 1, 1, 1,
0.4823245, 0.2363219, 0.4070565, 1, 1, 1, 1, 1,
0.4832788, -1.152595, 3.087941, 1, 1, 1, 1, 1,
0.4861852, 0.9737058, 1.110456, 1, 1, 1, 1, 1,
0.4929613, -0.3314982, 1.826063, 1, 1, 1, 1, 1,
0.4929911, 0.9326911, 2.512744, 1, 1, 1, 1, 1,
0.4970526, -0.9674727, 1.547293, 1, 1, 1, 1, 1,
0.498322, 0.01714391, 1.97832, 0, 0, 1, 1, 1,
0.5008046, 0.576788, -1.882649, 1, 0, 0, 1, 1,
0.5014454, -0.5567779, 2.068482, 1, 0, 0, 1, 1,
0.5021404, 0.2917457, 0.8982099, 1, 0, 0, 1, 1,
0.5076918, -2.566697, 2.208228, 1, 0, 0, 1, 1,
0.508083, -1.140724, 1.738776, 1, 0, 0, 1, 1,
0.5121843, -0.2608925, 0.4531495, 0, 0, 0, 1, 1,
0.5176439, -0.3245569, 3.797059, 0, 0, 0, 1, 1,
0.5196803, -0.02496345, 0.881045, 0, 0, 0, 1, 1,
0.5247616, -1.536492, 3.14574, 0, 0, 0, 1, 1,
0.5263758, -0.3181254, 3.496259, 0, 0, 0, 1, 1,
0.5272502, 0.5627438, 0.9237735, 0, 0, 0, 1, 1,
0.527437, 0.2707224, 0.8553227, 0, 0, 0, 1, 1,
0.5308484, 0.7142758, 0.8409567, 1, 1, 1, 1, 1,
0.5341191, -0.6623273, 3.827165, 1, 1, 1, 1, 1,
0.5432523, 0.6924089, -0.5112956, 1, 1, 1, 1, 1,
0.5464744, 0.01049973, 0.9744602, 1, 1, 1, 1, 1,
0.5474626, -1.424626, 2.234569, 1, 1, 1, 1, 1,
0.5488017, 1.343231, 1.694874, 1, 1, 1, 1, 1,
0.550155, -0.209503, 2.115505, 1, 1, 1, 1, 1,
0.5509567, -0.1168085, 2.599053, 1, 1, 1, 1, 1,
0.5530819, 0.259477, 0.8381858, 1, 1, 1, 1, 1,
0.5536872, -0.1659467, 1.533128, 1, 1, 1, 1, 1,
0.5576231, 0.1667651, 1.216444, 1, 1, 1, 1, 1,
0.5577963, -0.5529706, 2.321505, 1, 1, 1, 1, 1,
0.557938, 2.196498, -0.6060064, 1, 1, 1, 1, 1,
0.5601307, -1.360366, 2.279847, 1, 1, 1, 1, 1,
0.564647, 1.094175, 1.160625, 1, 1, 1, 1, 1,
0.5664113, 0.6052981, 1.645774, 0, 0, 1, 1, 1,
0.5668437, -0.7881119, 3.021013, 1, 0, 0, 1, 1,
0.5683126, -0.6257546, 3.169957, 1, 0, 0, 1, 1,
0.5689244, 1.619199, -0.5109205, 1, 0, 0, 1, 1,
0.5714308, 0.03733559, 2.833583, 1, 0, 0, 1, 1,
0.5754077, 0.9519212, 0.2935281, 1, 0, 0, 1, 1,
0.5761715, -0.7047252, 2.225663, 0, 0, 0, 1, 1,
0.5833431, 1.496603, 1.211497, 0, 0, 0, 1, 1,
0.58516, -0.2554328, 1.488514, 0, 0, 0, 1, 1,
0.5855829, 1.500406, 0.06811709, 0, 0, 0, 1, 1,
0.5867938, -1.212141, 1.60472, 0, 0, 0, 1, 1,
0.5871308, -1.743851, 2.709188, 0, 0, 0, 1, 1,
0.5916651, 2.3411, 0.7287434, 0, 0, 0, 1, 1,
0.5934914, -1.149591, 2.677017, 1, 1, 1, 1, 1,
0.602139, -0.06257262, 1.865221, 1, 1, 1, 1, 1,
0.6025314, -1.4322, 0.9235317, 1, 1, 1, 1, 1,
0.6122876, -0.4397333, 3.648991, 1, 1, 1, 1, 1,
0.6124953, -1.195755, 3.944148, 1, 1, 1, 1, 1,
0.6255705, -0.1810137, 0.2044881, 1, 1, 1, 1, 1,
0.6274394, 0.08832493, 2.381742, 1, 1, 1, 1, 1,
0.6280392, -0.01257471, 3.488982, 1, 1, 1, 1, 1,
0.631081, 0.09797035, 1.860924, 1, 1, 1, 1, 1,
0.6312691, -1.179124, 2.335943, 1, 1, 1, 1, 1,
0.6360775, -0.8677641, 1.654078, 1, 1, 1, 1, 1,
0.6361756, 1.720761, 0.8458756, 1, 1, 1, 1, 1,
0.6363947, 1.653142, 0.7081468, 1, 1, 1, 1, 1,
0.6370566, 0.07792467, 0.7156487, 1, 1, 1, 1, 1,
0.6448943, 2.37844, 0.9529939, 1, 1, 1, 1, 1,
0.649094, -0.2372527, 0.2261486, 0, 0, 1, 1, 1,
0.6499817, 1.172674, 1.524887, 1, 0, 0, 1, 1,
0.6542873, -0.9847209, 3.006705, 1, 0, 0, 1, 1,
0.6549717, -0.8394007, 2.811116, 1, 0, 0, 1, 1,
0.6570247, -0.08764426, 1.758821, 1, 0, 0, 1, 1,
0.6619322, 0.482159, 2.276657, 1, 0, 0, 1, 1,
0.6702842, -0.4036453, 3.247773, 0, 0, 0, 1, 1,
0.6721195, 0.7649744, 0.9716986, 0, 0, 0, 1, 1,
0.6755733, -1.324628, 3.177042, 0, 0, 0, 1, 1,
0.6792657, 0.2589903, 0.743301, 0, 0, 0, 1, 1,
0.6798732, -0.2394907, 3.469823, 0, 0, 0, 1, 1,
0.6851568, 0.7029235, -0.2640844, 0, 0, 0, 1, 1,
0.6868408, 0.8479993, -0.6112977, 0, 0, 0, 1, 1,
0.687618, 1.862199, 1.053743, 1, 1, 1, 1, 1,
0.7017888, 0.1532262, 1.598923, 1, 1, 1, 1, 1,
0.7026263, -1.376189, 3.930161, 1, 1, 1, 1, 1,
0.7047564, 1.049563, 0.2309936, 1, 1, 1, 1, 1,
0.7075959, 0.6222513, 1.243302, 1, 1, 1, 1, 1,
0.7084093, -1.383616, 3.357396, 1, 1, 1, 1, 1,
0.7088808, -2.024654, 3.565675, 1, 1, 1, 1, 1,
0.7102255, -1.483258, 2.608542, 1, 1, 1, 1, 1,
0.7108378, 0.05659654, 1.495623, 1, 1, 1, 1, 1,
0.7140661, 0.3013098, 1.987187, 1, 1, 1, 1, 1,
0.716011, -1.745838, 3.364324, 1, 1, 1, 1, 1,
0.7168068, 0.6201306, 1.662145, 1, 1, 1, 1, 1,
0.724987, 0.9346002, 2.418265, 1, 1, 1, 1, 1,
0.7275211, -1.282387, 0.5014651, 1, 1, 1, 1, 1,
0.7362638, 0.2817568, 1.62516, 1, 1, 1, 1, 1,
0.74417, -1.26552, 2.665352, 0, 0, 1, 1, 1,
0.7442414, 1.049164, 0.9180066, 1, 0, 0, 1, 1,
0.7445257, 0.1329223, 1.157343, 1, 0, 0, 1, 1,
0.7471837, 0.03971258, 2.728847, 1, 0, 0, 1, 1,
0.7485965, -0.8206674, 3.108528, 1, 0, 0, 1, 1,
0.7500064, 0.1782984, 2.894287, 1, 0, 0, 1, 1,
0.7524371, -0.1159872, 2.388539, 0, 0, 0, 1, 1,
0.7589505, -1.483816, 2.959, 0, 0, 0, 1, 1,
0.7635729, 0.3830251, 0.7390868, 0, 0, 0, 1, 1,
0.766748, -0.4264053, 2.51344, 0, 0, 0, 1, 1,
0.7698979, 1.299126, -0.2683113, 0, 0, 0, 1, 1,
0.7711654, -0.3674776, 4.158727, 0, 0, 0, 1, 1,
0.7721637, -0.3737905, 0.8152116, 0, 0, 0, 1, 1,
0.7738462, -1.027576, 3.164733, 1, 1, 1, 1, 1,
0.7789487, -0.2467191, 1.055237, 1, 1, 1, 1, 1,
0.7797641, -0.6553338, 2.477297, 1, 1, 1, 1, 1,
0.7851866, 0.1220868, 1.534552, 1, 1, 1, 1, 1,
0.795468, -1.076344, 2.530057, 1, 1, 1, 1, 1,
0.7965797, 0.6917931, 0.2747128, 1, 1, 1, 1, 1,
0.7985742, -1.528217, 2.298563, 1, 1, 1, 1, 1,
0.8051284, 1.159671, 0.5065066, 1, 1, 1, 1, 1,
0.8075686, -0.9983031, 2.516034, 1, 1, 1, 1, 1,
0.8106794, 0.3586268, 1.260258, 1, 1, 1, 1, 1,
0.8107978, -0.02903941, 0.9569032, 1, 1, 1, 1, 1,
0.8146799, -0.1591769, 3.03729, 1, 1, 1, 1, 1,
0.8192025, -0.7123294, 3.812525, 1, 1, 1, 1, 1,
0.8349428, 0.9365261, 0.3361324, 1, 1, 1, 1, 1,
0.8392362, 1.302552, 0.1016834, 1, 1, 1, 1, 1,
0.8393686, -1.720397, 2.026164, 0, 0, 1, 1, 1,
0.8435822, -0.4172349, 2.140094, 1, 0, 0, 1, 1,
0.8484384, -0.3177539, 3.130436, 1, 0, 0, 1, 1,
0.8539769, -1.685199, 2.638373, 1, 0, 0, 1, 1,
0.8786851, 0.5231402, 1.68501, 1, 0, 0, 1, 1,
0.8861638, 0.3578191, 1.107643, 1, 0, 0, 1, 1,
0.8897417, -0.1222357, 2.221816, 0, 0, 0, 1, 1,
0.8927377, 0.3767304, 2.975243, 0, 0, 0, 1, 1,
0.893298, -0.5088721, 1.868196, 0, 0, 0, 1, 1,
0.8964015, -0.8423625, 3.459452, 0, 0, 0, 1, 1,
0.8990026, 0.7611187, 2.339488, 0, 0, 0, 1, 1,
0.9003691, 0.1772539, 2.761236, 0, 0, 0, 1, 1,
0.9032043, -1.741384, -0.04109589, 0, 0, 0, 1, 1,
0.9061066, -0.7724923, 1.199274, 1, 1, 1, 1, 1,
0.9072354, 0.4631172, 0.4112983, 1, 1, 1, 1, 1,
0.9141847, 1.017998, 0.7254161, 1, 1, 1, 1, 1,
0.9159378, -1.029883, 2.601296, 1, 1, 1, 1, 1,
0.9178857, 0.2977394, 3.29957, 1, 1, 1, 1, 1,
0.9191045, -1.375554, 4.476079, 1, 1, 1, 1, 1,
0.9226616, -1.317463, 2.740645, 1, 1, 1, 1, 1,
0.926269, 0.5967292, 1.868901, 1, 1, 1, 1, 1,
0.9318265, -0.6181886, 1.06274, 1, 1, 1, 1, 1,
0.9389181, 0.2830498, 1.300661, 1, 1, 1, 1, 1,
0.9411818, 1.186339, 2.571562, 1, 1, 1, 1, 1,
0.9436965, 2.190475, 0.5487605, 1, 1, 1, 1, 1,
0.9463361, -0.228605, 2.005344, 1, 1, 1, 1, 1,
0.9476495, 0.02365719, 2.15201, 1, 1, 1, 1, 1,
0.9483817, 1.574349, 1.773892, 1, 1, 1, 1, 1,
0.9484187, -0.8481584, 2.394639, 0, 0, 1, 1, 1,
0.9500954, -0.7078399, 1.570609, 1, 0, 0, 1, 1,
0.9534026, -2.18978, 1.968991, 1, 0, 0, 1, 1,
0.9539831, 0.1805085, 2.563639, 1, 0, 0, 1, 1,
0.9572524, -1.267224, 1.550872, 1, 0, 0, 1, 1,
0.9579677, 0.9913886, -0.2239028, 1, 0, 0, 1, 1,
0.9594146, -0.3163064, 2.052223, 0, 0, 0, 1, 1,
0.9618464, 0.4069227, 0.7136518, 0, 0, 0, 1, 1,
0.9621754, 0.2492073, 2.808162, 0, 0, 0, 1, 1,
0.9629158, 1.61464, 2.385162, 0, 0, 0, 1, 1,
0.9688047, -1.588728, 1.078848, 0, 0, 0, 1, 1,
0.9694079, 1.185884, 0.6147627, 0, 0, 0, 1, 1,
0.969892, -0.746519, 1.279302, 0, 0, 0, 1, 1,
0.9868921, 1.156134, 1.921991, 1, 1, 1, 1, 1,
0.9897056, 0.1116537, 3.428524, 1, 1, 1, 1, 1,
0.9928481, -0.5131849, 0.9455042, 1, 1, 1, 1, 1,
0.9934365, 0.5905504, 1.974934, 1, 1, 1, 1, 1,
0.9951581, 2.618796, 0.3472374, 1, 1, 1, 1, 1,
1.007736, 0.6729299, 0.2655877, 1, 1, 1, 1, 1,
1.011906, 0.03023552, 0.9458039, 1, 1, 1, 1, 1,
1.013798, 0.5558161, 0.7283077, 1, 1, 1, 1, 1,
1.014068, -0.5893477, -0.2831947, 1, 1, 1, 1, 1,
1.015903, 0.1240499, 1.68894, 1, 1, 1, 1, 1,
1.016181, 0.5840507, 0.7328016, 1, 1, 1, 1, 1,
1.019369, 0.5170614, 1.436799, 1, 1, 1, 1, 1,
1.02278, 0.9360146, 1.007723, 1, 1, 1, 1, 1,
1.026064, -1.618275, 1.117058, 1, 1, 1, 1, 1,
1.028185, 0.8348477, 2.688925, 1, 1, 1, 1, 1,
1.028932, -1.36638, 1.223323, 0, 0, 1, 1, 1,
1.034668, -0.9149157, 3.629827, 1, 0, 0, 1, 1,
1.043531, 1.760244, -2.491256, 1, 0, 0, 1, 1,
1.050063, -1.616006, 2.908735, 1, 0, 0, 1, 1,
1.050279, 1.030364, 0.2813318, 1, 0, 0, 1, 1,
1.050368, -0.4360715, 2.622677, 1, 0, 0, 1, 1,
1.055637, 0.4567912, 0.778855, 0, 0, 0, 1, 1,
1.055672, -0.1352737, 1.348969, 0, 0, 0, 1, 1,
1.061275, -0.8577973, 3.638002, 0, 0, 0, 1, 1,
1.06674, -1.300782, 1.580399, 0, 0, 0, 1, 1,
1.067196, 1.170191, 0.5460165, 0, 0, 0, 1, 1,
1.07218, 0.01180695, 1.331473, 0, 0, 0, 1, 1,
1.075047, 0.4219859, 0.6823728, 0, 0, 0, 1, 1,
1.075146, 0.3929511, 2.336581, 1, 1, 1, 1, 1,
1.083217, -1.064576, 1.858461, 1, 1, 1, 1, 1,
1.090562, -1.389526, 2.499912, 1, 1, 1, 1, 1,
1.09306, -0.3828337, 0.6640401, 1, 1, 1, 1, 1,
1.11933, -0.1469814, 2.350205, 1, 1, 1, 1, 1,
1.12729, 0.2164216, -0.5152411, 1, 1, 1, 1, 1,
1.129429, 2.897965, -1.675774, 1, 1, 1, 1, 1,
1.130522, 0.7742062, -1.170426, 1, 1, 1, 1, 1,
1.130744, 1.109977, 1.890702, 1, 1, 1, 1, 1,
1.138925, -0.1901768, 0.03302383, 1, 1, 1, 1, 1,
1.140932, 0.05683862, 1.430739, 1, 1, 1, 1, 1,
1.169805, 0.3162077, 0.02108362, 1, 1, 1, 1, 1,
1.171988, 0.9688308, -0.7663079, 1, 1, 1, 1, 1,
1.179787, 1.851056, -0.267504, 1, 1, 1, 1, 1,
1.180373, -1.11715, 1.777164, 1, 1, 1, 1, 1,
1.18154, 1.643882, 0.9656295, 0, 0, 1, 1, 1,
1.182207, -0.8726974, 2.387283, 1, 0, 0, 1, 1,
1.182548, 0.05192051, 3.054166, 1, 0, 0, 1, 1,
1.182862, -0.6527496, 2.036341, 1, 0, 0, 1, 1,
1.187562, 0.6083998, 1.197484, 1, 0, 0, 1, 1,
1.194769, 0.4065201, 0.9393797, 1, 0, 0, 1, 1,
1.208199, -0.5496354, 2.035764, 0, 0, 0, 1, 1,
1.209682, 0.6466416, 0.04568104, 0, 0, 0, 1, 1,
1.21092, -1.27623, 2.616823, 0, 0, 0, 1, 1,
1.217003, -0.9201297, 3.382828, 0, 0, 0, 1, 1,
1.225593, 0.8279962, -0.878194, 0, 0, 0, 1, 1,
1.23014, 0.2219595, 1.953086, 0, 0, 0, 1, 1,
1.231936, 0.0780958, 3.085365, 0, 0, 0, 1, 1,
1.252663, -0.8290473, 3.910879, 1, 1, 1, 1, 1,
1.253345, -0.3148275, 1.270707, 1, 1, 1, 1, 1,
1.253499, -0.7730022, 3.30829, 1, 1, 1, 1, 1,
1.265013, -0.8031346, 1.603079, 1, 1, 1, 1, 1,
1.265087, 0.6915911, 1.009944, 1, 1, 1, 1, 1,
1.269617, 0.5791607, 1.980253, 1, 1, 1, 1, 1,
1.274439, -0.2392976, 1.72518, 1, 1, 1, 1, 1,
1.2754, -0.1334746, 1.453094, 1, 1, 1, 1, 1,
1.275904, 1.1088, 1.229301, 1, 1, 1, 1, 1,
1.277997, 1.044989, 1.719531, 1, 1, 1, 1, 1,
1.278795, 1.040144, -0.5119921, 1, 1, 1, 1, 1,
1.29676, -0.5271827, 3.107495, 1, 1, 1, 1, 1,
1.300304, -0.4130954, 1.67163, 1, 1, 1, 1, 1,
1.303253, -1.244553, 2.717535, 1, 1, 1, 1, 1,
1.304239, -2.112499, 3.040442, 1, 1, 1, 1, 1,
1.309762, -0.1185434, 1.843849, 0, 0, 1, 1, 1,
1.319028, -0.3784224, 0.983303, 1, 0, 0, 1, 1,
1.325354, -0.2468794, 1.32902, 1, 0, 0, 1, 1,
1.330433, -0.3788401, 3.437421, 1, 0, 0, 1, 1,
1.335301, -0.2635648, 2.389689, 1, 0, 0, 1, 1,
1.338138, 0.4886776, 0.8012636, 1, 0, 0, 1, 1,
1.338482, 0.4980315, 2.024455, 0, 0, 0, 1, 1,
1.350664, 0.4195459, 0.3843606, 0, 0, 0, 1, 1,
1.359661, -0.3521553, 2.929549, 0, 0, 0, 1, 1,
1.364201, -1.848084, 2.035513, 0, 0, 0, 1, 1,
1.37156, -0.6087351, 1.714201, 0, 0, 0, 1, 1,
1.373081, -1.594714, 0.200787, 0, 0, 0, 1, 1,
1.373095, -0.21942, 0.1984303, 0, 0, 0, 1, 1,
1.375894, -1.303215, 0.6926901, 1, 1, 1, 1, 1,
1.380239, 0.4592245, -0.3745661, 1, 1, 1, 1, 1,
1.382853, -0.1794127, 2.176412, 1, 1, 1, 1, 1,
1.385198, -0.5675809, 1.616186, 1, 1, 1, 1, 1,
1.386029, -1.007851, 2.373649, 1, 1, 1, 1, 1,
1.388791, 0.03582961, 1.435538, 1, 1, 1, 1, 1,
1.395584, -0.3783881, 0.9762091, 1, 1, 1, 1, 1,
1.397533, 1.011083, 1.729801, 1, 1, 1, 1, 1,
1.415649, 0.02006511, 1.229471, 1, 1, 1, 1, 1,
1.423776, 1.268331, 1.674964, 1, 1, 1, 1, 1,
1.435465, -0.9176235, 2.269814, 1, 1, 1, 1, 1,
1.44714, -0.04384639, 0.126058, 1, 1, 1, 1, 1,
1.449142, 0.9690076, 1.82339, 1, 1, 1, 1, 1,
1.453748, -1.138315, 4.31588, 1, 1, 1, 1, 1,
1.460773, 0.3749319, 0.5467924, 1, 1, 1, 1, 1,
1.460952, -1.577529, 3.236073, 0, 0, 1, 1, 1,
1.472911, 0.07944245, 1.246108, 1, 0, 0, 1, 1,
1.490907, -0.06094151, 1.824551, 1, 0, 0, 1, 1,
1.503338, -0.1903155, 3.521387, 1, 0, 0, 1, 1,
1.503485, 1.216065, 2.264428, 1, 0, 0, 1, 1,
1.505523, -0.4093358, 2.672951, 1, 0, 0, 1, 1,
1.508039, -0.6546724, 2.115631, 0, 0, 0, 1, 1,
1.521425, -0.8378506, 1.754802, 0, 0, 0, 1, 1,
1.52816, -0.7142684, 0.6803402, 0, 0, 0, 1, 1,
1.536449, -0.6044331, 1.683817, 0, 0, 0, 1, 1,
1.547063, -0.3392946, 2.165736, 0, 0, 0, 1, 1,
1.580451, 0.01573666, 0.7617978, 0, 0, 0, 1, 1,
1.611036, 0.7193189, 0.2017886, 0, 0, 0, 1, 1,
1.614313, 1.413693, 0.505748, 1, 1, 1, 1, 1,
1.621029, 0.09965621, -0.5936618, 1, 1, 1, 1, 1,
1.631927, -1.78981, 1.123031, 1, 1, 1, 1, 1,
1.637667, 2.018256, 0.3174366, 1, 1, 1, 1, 1,
1.640033, 0.9750253, 1.679532, 1, 1, 1, 1, 1,
1.651662, -1.944044, 2.252757, 1, 1, 1, 1, 1,
1.657844, 0.7195151, 1.870655, 1, 1, 1, 1, 1,
1.659252, -0.8826603, 1.958283, 1, 1, 1, 1, 1,
1.659512, 1.227188, 0.9624343, 1, 1, 1, 1, 1,
1.666353, 0.3825915, 2.21287, 1, 1, 1, 1, 1,
1.672975, -1.133416, 1.757618, 1, 1, 1, 1, 1,
1.673331, -1.122982, 1.715551, 1, 1, 1, 1, 1,
1.686554, -0.653176, 0.8546509, 1, 1, 1, 1, 1,
1.7085, 0.21935, 2.729807, 1, 1, 1, 1, 1,
1.730757, -0.1779273, 1.689502, 1, 1, 1, 1, 1,
1.735622, -0.2301572, 2.036661, 0, 0, 1, 1, 1,
1.736831, -0.6349598, 1.725838, 1, 0, 0, 1, 1,
1.743512, 0.7246681, -0.1890039, 1, 0, 0, 1, 1,
1.778578, 2.043392, 1.065771, 1, 0, 0, 1, 1,
1.780853, -0.592941, 2.456285, 1, 0, 0, 1, 1,
1.781036, 0.3368828, 1.056406, 1, 0, 0, 1, 1,
1.791014, 1.831707, 1.431814, 0, 0, 0, 1, 1,
1.806988, 0.1655909, 1.140347, 0, 0, 0, 1, 1,
1.814423, -0.3502381, 2.494495, 0, 0, 0, 1, 1,
1.832823, -1.275734, 1.622952, 0, 0, 0, 1, 1,
1.840228, 0.7693399, 0.7064902, 0, 0, 0, 1, 1,
1.842253, 0.5540374, -0.06015041, 0, 0, 0, 1, 1,
1.85475, 0.6075351, 0.4950005, 0, 0, 0, 1, 1,
1.858772, -0.4135123, 2.356637, 1, 1, 1, 1, 1,
1.866672, -0.921852, 1.121034, 1, 1, 1, 1, 1,
1.873722, 1.998431, 0.6172106, 1, 1, 1, 1, 1,
1.879717, 1.988211, -0.5036313, 1, 1, 1, 1, 1,
1.922004, 1.387029, 1.994344, 1, 1, 1, 1, 1,
1.956243, 0.2247593, 2.677768, 1, 1, 1, 1, 1,
1.998037, 0.5626798, 2.109384, 1, 1, 1, 1, 1,
2.009859, -0.3703777, 1.395473, 1, 1, 1, 1, 1,
2.068204, 1.216185, 1.326051, 1, 1, 1, 1, 1,
2.088983, 0.7309037, 0.09280779, 1, 1, 1, 1, 1,
2.092109, -0.5326511, 1.042021, 1, 1, 1, 1, 1,
2.104699, -1.070828, 1.083337, 1, 1, 1, 1, 1,
2.10999, 1.022871, 2.974428, 1, 1, 1, 1, 1,
2.110567, 1.254061, 0.8124132, 1, 1, 1, 1, 1,
2.12368, 0.01157689, 2.627845, 1, 1, 1, 1, 1,
2.136072, -1.125715, 2.070839, 0, 0, 1, 1, 1,
2.156033, 0.1890294, 1.02562, 1, 0, 0, 1, 1,
2.160053, 0.07642228, 2.339944, 1, 0, 0, 1, 1,
2.16609, -1.026596, 1.011495, 1, 0, 0, 1, 1,
2.167269, 0.8475332, 0.0002405483, 1, 0, 0, 1, 1,
2.183605, -0.9848674, 2.70174, 1, 0, 0, 1, 1,
2.198597, 0.03382147, 2.410957, 0, 0, 0, 1, 1,
2.204694, 0.4082865, 2.012435, 0, 0, 0, 1, 1,
2.251886, -0.05551843, 1.557802, 0, 0, 0, 1, 1,
2.380505, -0.6181172, 1.038709, 0, 0, 0, 1, 1,
2.405015, 0.3558577, 1.657739, 0, 0, 0, 1, 1,
2.446953, -0.8774806, 1.554548, 0, 0, 0, 1, 1,
2.462442, -0.5119083, 2.434714, 0, 0, 0, 1, 1,
2.58077, 1.425896, 2.041132, 1, 1, 1, 1, 1,
2.629377, -0.8729041, 1.418499, 1, 1, 1, 1, 1,
2.63176, 0.2952742, 1.318909, 1, 1, 1, 1, 1,
2.651329, 0.7877675, 1.462764, 1, 1, 1, 1, 1,
2.702812, 0.8068638, 2.44094, 1, 1, 1, 1, 1,
2.886521, -0.753324, 0.7507334, 1, 1, 1, 1, 1,
2.889098, 1.591362, 1.432799, 1, 1, 1, 1, 1
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
var radius = 9.712204;
var distance = 34.1137;
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
mvMatrix.translate( 0.4214603, 0.1005578, 0.4014294 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.1137);
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
